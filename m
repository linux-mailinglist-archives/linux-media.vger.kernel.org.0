Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88CA244746A
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 18:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235952AbhKGRTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 12:19:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25230 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235939AbhKGRTR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 12:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636305394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WiPLWJPgTA6gAhs9VVSBRkfSI3oaxNGGr5gWgMBCnms=;
        b=V+hyZflDqt/ieuOMePoIACBAeTz6MQVWUeFtv04Mey6ng6WopyDqDN+TROW8mW93nlWZzd
        3wuo1OuA/CssMXKsdO92z1pcGJJc6AkI4UTzmOD98SkIkCuDmK2KufpvlKgOJRdairpSEw
        RLDn6CNcZgXXy/MHTX62xGwENmdac40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-9C25friiPU-VnG2Q_i6LMQ-1; Sun, 07 Nov 2021 12:16:01 -0500
X-MC-Unique: 9C25friiPU-VnG2Q_i6LMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 743A28042CF;
        Sun,  7 Nov 2021 17:15:59 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 50F2057CD3;
        Sun,  7 Nov 2021 17:15:57 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 03/11] media: atomisp-ov2680: Push the input_lock taking up into ov2680_s_power()
Date:   Sun,  7 Nov 2021 18:15:41 +0100
Message-Id: <20211107171549.267583-4-hdegoede@redhat.com>
In-Reply-To: <20211107171549.267583-1-hdegoede@redhat.com>
References: <20211107171549.267583-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ov2680_s_power() is the only caller of ov2680_init(), push the input_lock
taking from ov2680_init() up into ov2680_s_power(), this way the new
power_on bool is also protected by it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 7b7cf7a68823..2721223ebcde 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -655,21 +655,11 @@ static int ov2680_init_registers(struct v4l2_subdev *sd)
 
 static int ov2680_init(struct v4l2_subdev *sd)
 {
-	struct ov2680_device *dev = to_ov2680_sensor(sd);
-
-	int ret;
-
-	mutex_lock(&dev->input_lock);
-
 	/* restore settings */
 	ov2680_res = ov2680_res_preview;
 	N_RES = N_RES_PREVIEW;
 
-	ret = ov2680_init_registers(sd);
-
-	mutex_unlock(&dev->input_lock);
-
-	return ret;
+	return ov2680_init_registers(sd);
 }
 
 static int power_ctrl(struct v4l2_subdev *sd, bool flag)
@@ -817,15 +807,21 @@ static int power_down(struct v4l2_subdev *sd)
 
 static int ov2680_s_power(struct v4l2_subdev *sd, int on)
 {
+	struct ov2680_device *dev = to_ov2680_sensor(sd);
 	int ret;
 
+	mutex_lock(&dev->input_lock);
+
 	if (on == 0) {
 		ret = power_down(sd);
 	} else {
 		ret = power_up(sd);
 		if (!ret)
-			return ov2680_init(sd);
+			ret = ov2680_init(sd);
 	}
+
+	mutex_unlock(&dev->input_lock);
+
 	return ret;
 }
 
-- 
2.31.1

