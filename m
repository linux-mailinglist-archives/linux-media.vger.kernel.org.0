Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575C045E1AA
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 21:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350782AbhKYUhO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 15:37:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34002 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1357167AbhKYUfO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 15:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637872322;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=umO/XuNPAGhKOr8uOD1V3xlpkUaa9/xQHdtEkrt1LoM=;
        b=Odv4yeQzIaAPQS4JIeITzd4ecarzpVDF1ui9va66B/xYEZUuEb2DAgihf+XzbDh3tSTXdw
        GuVeTLc66OSNT0/+j0IOK84mShFb0jxK+ldoWAWOoizUWI3WP142/YyaVXSojNq2UQHpg4
        q9NW0UmffZK8YU1RIE4gSmZZFfNFv2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-p1_xEpsaOGSQCqH99yAXFQ-1; Thu, 25 Nov 2021 15:31:59 -0500
X-MC-Unique: p1_xEpsaOGSQCqH99yAXFQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 153421006AA1;
        Thu, 25 Nov 2021 20:31:58 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EFC7D17D61;
        Thu, 25 Nov 2021 20:31:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-media@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH] media: i2c: ov5648: Fix lockdep error
Date:   Thu, 25 Nov 2021 21:31:56 +0100
Message-Id: <20211125203156.825539-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 drivers/media/i2c/ov5648.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 947d437ed0ef..9f24bdccf50f 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2546,7 +2546,9 @@ static int ov5648_probe(struct i2c_client *client)
 	if (ret)
 		goto error_mutex;
 
+	mutex_lock(&sensor->mutex);
 	ret = ov5648_state_init(sensor);
+	mutex_unlock(&sensor->mutex);
 	if (ret)
 		goto error_ctrls;
 
-- 
2.33.1

