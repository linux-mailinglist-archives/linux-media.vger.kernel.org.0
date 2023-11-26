Return-Path: <linux-media+bounces-1046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6707F92FE
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 15:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E38AB20ED8
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 14:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAFCDDB6;
	Sun, 26 Nov 2023 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HwYWAvP8"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D74101
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 06:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701008136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNnZWi0g1vNwYkIElm86d6y/h2XLBd5ao3U9UQMTdy8=;
	b=HwYWAvP8CA96438woYpY62sDE2xQUkViC6elJNFtKvGk7AbbitMc10Z0yvBU2aKsYdADNB
	9qMoJqZ7c5ABn+aAun6wupVmYKTpbK+2qzUqEb613pxl8vJkVZ5JOykP72mIZrgm8LqF7q
	m8+FXVPuyLtqfOJbH+VDSEYNvmf78OI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-v7Ae88mtMZSCJ3xeOBjRKw-1; Sun, 26 Nov 2023 09:15:30 -0500
X-MC-Unique: v7Ae88mtMZSCJ3xeOBjRKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F584811E7E;
	Sun, 26 Nov 2023 14:15:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 473902027019;
	Sun, 26 Nov 2023 14:15:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 5/9] media: ov2740: Fix hts value
Date: Sun, 26 Nov 2023 15:15:13 +0100
Message-ID: <20231126141517.7534-6-hdegoede@redhat.com>
In-Reply-To: <20231126141517.7534-1-hdegoede@redhat.com>
References: <20231126141517.7534-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

HTS must be more then width, so the 1080 value clearly is wrong,
this is then corrected with some weird math dividing clocks in
to_pixels_per_line() which results in the hts getting multiplied by 2,
resulting in 2160.

Instead just directly set hts to the correct value of 2160 and
drop to_pixels_per_line().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 7e31aa2decd0..14a90dcf0199 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -312,7 +312,7 @@ static const struct ov2740_mode supported_modes[] = {
 	{
 		.width = 1932,
 		.height = 1092,
-		.hts = 1080,
+		.hts = 2160,
 		.vts_def = OV2740_VTS_DEF,
 		.vts_min = OV2740_VTS_MIN,
 		.reg_list = {
@@ -363,15 +363,6 @@ static u64 to_pixel_rate(u32 f_index)
 	return pixel_rate;
 }
 
-static u64 to_pixels_per_line(u32 hts, u32 f_index)
-{
-	u64 ppl = hts * to_pixel_rate(f_index);
-
-	do_div(ppl, OV2740_SCLK);
-
-	return ppl;
-}
-
 static int ov2740_read_reg(struct ov2740 *ov2740, u16 reg, u16 len, u32 *val)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
@@ -604,8 +595,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 					   V4L2_CID_VBLANK, vblank_min,
 					   vblank_max, 1, vblank_default);
 
-	h_blank = to_pixels_per_line(cur_mode->hts, cur_mode->link_freq_index);
-	h_blank -= cur_mode->width;
+	h_blank = cur_mode->hts - cur_mode->width;
 	ov2740->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					   V4L2_CID_HBLANK, h_blank, h_blank, 1,
 					   h_blank);
@@ -848,8 +838,7 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
 				 mode->vts_min - mode->height,
 				 OV2740_VTS_MAX - mode->height, 1, vblank_def);
 	__v4l2_ctrl_s_ctrl(ov2740->vblank, vblank_def);
-	h_blank = to_pixels_per_line(mode->hts, mode->link_freq_index) -
-		mode->width;
+	h_blank = mode->hts - mode->width;
 	__v4l2_ctrl_modify_range(ov2740->hblank, h_blank, h_blank, 1, h_blank);
 
 	return 0;
-- 
2.41.0


