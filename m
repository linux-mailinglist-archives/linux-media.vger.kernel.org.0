Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F08444745F
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 18:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235924AbhKGRSu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 12:18:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20325 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235923AbhKGRSs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 12:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636305364;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iomUZ6tTneEsDY36qk52jXAdQ4IFcPyraE5IvBWRl7E=;
        b=bFCY7b7t7EMz4DHOibKp1qCptBwuvls/owHtBc3BvhCC02O9ct6j5yoJpW2rYkPdLRxMjr
        0LWr1/uGNsupERraiuKwO2zSahtSyhnoxN/Zo2tjto89HgziAdnlCKDRSGjMfrZzVtfyc7
        +V6ZJwlxXbDLuDZW+O3C93KIiCKdkQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-Zi77muTXM5K4CPq9ge6XZw-1; Sun, 07 Nov 2021 12:16:03 -0500
X-MC-Unique: Zi77muTXM5K4CPq9ge6XZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C353710055A7;
        Sun,  7 Nov 2021 17:16:01 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.28])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A07CD57CD3;
        Sun,  7 Nov 2021 17:15:59 +0000 (UTC)
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
Subject: [PATCH 04/11] media: atomisp-ov2680: Remove the ov2680_res and N_RES global variables
Date:   Sun,  7 Nov 2021 18:15:42 +0100
Message-Id: <20211107171549.267583-5-hdegoede@redhat.com>
In-Reply-To: <20211107171549.267583-1-hdegoede@redhat.com>
References: <20211107171549.267583-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ov2680_res and N_RES global variables are just hardcoded as aliases
for ov2680_res_preview and N_RES_PREVIEW, remove them.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2680.c        | 28 +++++--------------
 drivers/staging/media/atomisp/i2c/ov2680.h    |  3 --
 2 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 2721223ebcde..b6927f9be022 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -653,15 +653,6 @@ static int ov2680_init_registers(struct v4l2_subdev *sd)
 	return ret;
 }
 
-static int ov2680_init(struct v4l2_subdev *sd)
-{
-	/* restore settings */
-	ov2680_res = ov2680_res_preview;
-	N_RES = N_RES_PREVIEW;
-
-	return ov2680_init_registers(sd);
-}
-
 static int power_ctrl(struct v4l2_subdev *sd, bool flag)
 {
 	int ret = 0;
@@ -817,7 +808,7 @@ static int ov2680_s_power(struct v4l2_subdev *sd, int on)
 	} else {
 		ret = power_up(sd);
 		if (!ret)
-			ret = ov2680_init(sd);
+			ret = ov2680_init_registers(sd);
 	}
 
 	mutex_unlock(&dev->input_lock);
@@ -857,7 +848,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 				     ARRAY_SIZE(ov2680_res_preview), width,
 				     height, fmt->width, fmt->height);
 	if (!res)
-		res = &ov2680_res[N_RES - 1];
+		res = &ov2680_res_preview[N_RES_PREVIEW - 1];
 
 	fmt->width = res->width;
 	fmt->height = res->height;
@@ -975,11 +966,6 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 	ret = ov2680_write_reg(client, 1, OV2680_SW_STREAM,
 			       enable ? OV2680_START_STREAMING :
 			       OV2680_STOP_STREAMING);
-#if 0
-	/* restore settings */
-	ov2680_res = ov2680_res_preview;
-	N_RES = N_RES_PREVIEW;
-#endif
 
 	//otp valid at stream on state
 	//if(!dev->otp_data)
@@ -1069,13 +1055,13 @@ static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
 {
 	int index = fse->index;
 
-	if (index >= N_RES)
+	if (index >= N_RES_PREVIEW)
 		return -EINVAL;
 
-	fse->min_width = ov2680_res[index].width;
-	fse->min_height = ov2680_res[index].height;
-	fse->max_width = ov2680_res[index].width;
-	fse->max_height = ov2680_res[index].height;
+	fse->min_width = ov2680_res_preview[index].width;
+	fse->min_height = ov2680_res_preview[index].height;
+	fse->max_width = ov2680_res_preview[index].width;
+	fse->max_height = ov2680_res_preview[index].height;
 
 	return 0;
 }
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index edd87bb8563f..c1998c9132a2 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -838,7 +838,4 @@ static struct ov2680_resolution ov2680_res_preview[] = {
 
 #define N_RES_PREVIEW (ARRAY_SIZE(ov2680_res_preview))
 
-static struct ov2680_resolution *ov2680_res = ov2680_res_preview;
-static unsigned long N_RES = N_RES_PREVIEW;
-
 #endif
-- 
2.31.1

