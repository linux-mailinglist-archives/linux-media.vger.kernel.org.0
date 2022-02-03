Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267824A83DA
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 13:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350537AbiBCMd2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Feb 2022 07:33:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37247 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229653AbiBCMd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Feb 2022 07:33:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643891605;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ygLyhz4TBQI+mv4Im/MJmdf3FjsrWIB3jzek5GHAWM0=;
        b=IEB7ZXdfvHFj21tv1EBuubbOg3ns4Jp6DvKRACpqqF8W26ybLPnyifLpsq0pCuJgvIqc0W
        azaeuv1Ktx7l2RiNa+9JJum/B/KhqOZnZolvDayAfhlAUrXJe22CY0dUvUcOJTze454wqS
        xtOFn+BKZJOOTJU47FxN3/1/xCP6erA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-rh8yodhVPNu2xWLgWIFtrw-1; Thu, 03 Feb 2022 07:33:24 -0500
X-MC-Unique: rh8yodhVPNu2xWLgWIFtrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C3EE1006AA4;
        Thu,  3 Feb 2022 12:33:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.196.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CE49E7D71E;
        Thu,  3 Feb 2022 12:33:21 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2 1/1] media: i2c: ov5648: Fix lockdep error
Date:   Thu,  3 Feb 2022 13:33:12 +0100
Message-Id: <20220203123312.505318-2-hdegoede@redhat.com>
In-Reply-To: <20220203123312.505318-1-hdegoede@redhat.com>
References: <20220203123312.505318-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
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

