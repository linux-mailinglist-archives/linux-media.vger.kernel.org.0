Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA7345ECF4
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 12:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348219AbhKZLxY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 06:53:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39537 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1376829AbhKZLvX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 06:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637927290;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=58Du/1ip8c6cDeWIafIsOKBd0bhpeiPo+lEIaH+hUXI=;
        b=MzLzf08B7oLPsONbmexPiBI88xMTIQm9D7CTt1893PqwlCsscdwIPxPNQQmLfNOX/kHXph
        C+JJWjZ/xUfaVJElXdvLWvJOLxAGpQifWoGlF/ZCLyhMGLXvFszMHru1GaGwnW2OD6T1BU
        nk1sG/xE0PDeVCcV2nKVsjxNLL4E6Nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-iDlLGnaJOPe-6MN0fxrX8g-1; Fri, 26 Nov 2021 06:48:07 -0500
X-MC-Unique: iDlLGnaJOPe-6MN0fxrX8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C0B1102C886;
        Fri, 26 Nov 2021 11:48:06 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.121])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A0BF8604CC;
        Fri, 26 Nov 2021 11:48:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2] media: i2c: ov5648: Fix lockdep error
Date:   Fri, 26 Nov 2021 12:48:02 +0100
Message-Id: <20211126114802.85706-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ov5648_state_init() calls ov5648_state_mipi_configure() which uses
__v4l2_ctrl_s_ctrl[_int64](). This means that sensor->mutex (which
is also sensor->ctrls.handler.lock) must be locked before calling
ov5648_state_init().

ov5648_state_mipi_configure() is also used in other places where
the lock is already held so it cannot be changed itself.

Note this is based on an identical (tested) fix for the ov8865 driver,
this has only been compile-tested.

Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Move the taking of the mutex to inside ov5648_state_init()
---
 drivers/media/i2c/ov5648.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 947d437ed0ef..01e22c535267 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -1778,8 +1778,14 @@ static int ov5648_state_configure(struct ov5648_sensor *sensor,
 
 static int ov5648_state_init(struct ov5648_sensor *sensor)
 {
-	return ov5648_state_configure(sensor, &ov5648_modes[0],
-				      ov5648_mbus_codes[0]);
+	int ret;
+
+	mutex_lock(&sensor->mutex);
+	ret = ov5648_state_configure(sensor, &ov5648_modes[0],
+				     ov5648_mbus_codes[0]);
+	mutex_unlock(&sensor->mutex);
+
+	return ret;
 }
 
 /* Sensor Base */
-- 
2.33.1

