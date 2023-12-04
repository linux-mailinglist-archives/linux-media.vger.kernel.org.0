Return-Path: <linux-media+bounces-1547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A980332F
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3FC61F21189
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 12:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641E124211;
	Mon,  4 Dec 2023 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dfem/dGb"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F221D64
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701693600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev/+zQ+QVJe4KhIfW0hqjtS91kOMMuAcJlwcyJ07zpY=;
	b=dfem/dGb1uD+cFgWf31YrPJJgcw9o9jyUinp19mvc2JZZxBFv8Vsvf0+UorkSWTaHdcSAr
	JJk5iWJRO3SQVn1S0YHvGRxGZOgtOrJH2lRVdNYw0KdZcOOvpfDMXG+lgW2UUeJU8rDG8I
	tZAvpM1VE2OdvdEFfiyywzlhyyBHYg8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-uzGA6aKeMaqKw5i_iefooQ-1; Mon, 04 Dec 2023 07:39:57 -0500
X-MC-Unique: uzGA6aKeMaqKw5i_iefooQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F7E182A62D;
	Mon,  4 Dec 2023 12:39:57 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF5BE40C6EB9;
	Mon,  4 Dec 2023 12:39:55 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 5/9] media: ov2740: Fix hts value
Date: Mon,  4 Dec 2023 13:39:42 +0100
Message-ID: <20231204123947.5754-6-hdegoede@redhat.com>
In-Reply-To: <20231204123947.5754-1-hdegoede@redhat.com>
References: <20231204123947.5754-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

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
index 1cbe0ac16995..759e91f4169b 100644
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
2.43.0


