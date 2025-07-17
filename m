Return-Path: <linux-media+bounces-37958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E678B088E0
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 11:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 464184E1B75
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 09:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9123A266B67;
	Thu, 17 Jul 2025 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="NFhls1pr"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958344503B
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752743026; cv=none; b=LzKs2E/HXNyFh7Fr1OohH0z93LuuEGniC6MvSyBXVgvy6Eq7A1Veu0JSuoEsQ0LEZbvTHzCW+a2AAJesNqTJ7Gf1sMTOKfYOtnqJ2Y4tbZvi5qcA1FGMkv7F4D/U1o+GO8tPqk4GQtFIQL19DVGSWyRkDlE2gZuxRPohM5DLE5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752743026; c=relaxed/simple;
	bh=aPYeUKIKEot34EcuFYc/W6eFdnkSDFlGQqFtBhQgXqk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=YoJar6tz7//GOcAUyvoHzstm6keVPaDkZJbBszDsXqXZvWT7+xENL50VZdnOQC3TOUqFDffvPYy5yX02NfYVEv+r2TBIysIWFNkt5wVnwSFAiTlnbUQCccCwrY8mz7k0mwuBmmgxgPsrppccgR2Aeu8iBgcEC2YwQY27nqZX8VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=NFhls1pr; arc=none smtp.client-ip=195.121.94.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: ec6d420f-62ec-11f0-80e6-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id ec6d420f-62ec-11f0-80e6-005056aba152;
	Thu, 17 Jul 2025 11:03:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:subject:from:to:mime-version:date:message-id;
	bh=3J2cz6M6Pnd0M0y1qEpkz5vy2yMVFhUys3P5Bsd4k3o=;
	b=NFhls1prowoHXYN0CaMEZYvJ708OqsEa/MABU2xAWe2YSWUUqijvGBq097U6p+YqPmfAgSELEFlEq
	 xdlaXoNC2Z0sZhTotPNJOPdh1MM6N6rFOjHY37GfH0LMWoBfB5r0/9LagitgZz59CRrydIOYFBrr/l
	 4g3zFoBAw5Cuw6BJ/M/5JY8L1InCo/aeAxRLxMTtdrvL71bvnw71yl9Vav1Rjqt5APUH1purEYAuOF
	 klykDHFxC70eJOgnrFjNptb3njUBHKCb4yyQIPQTyHDgr4SL2pem9cP+mC85UV5hi4tK/tGrc2hrr2
	 QZMuiATRssI2qTus+xWBP6PVOOvCthA==
X-KPN-MID: 33|oE6zIhH1F2PjHCoPE4SBQ7xcTDGchmJK2VE9mO1ga1pjhv8UMdZ22YKI6GbudvT
 EZz/r2JM7KFXXSN0yjQGD3ysE+OB+7lj4H1VKPwqQKc4=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|IFNnclpOn5DWyNCrbOjUFJtfMmtVcuu9cD5VWzg6B3G8lbzp7sIvt3MxCFzk57P
 Rqcwk/LE0EEWWsBLWidaB4Q==
Received: from [192.168.1.10] (80-60-128-215.fixed.kpn.net [80.60.128.215])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id eb861acc-62ec-11f0-8021-005056ab7447;
	Thu, 17 Jul 2025 11:03:35 +0200 (CEST)
Message-ID: <29d8a4e0-c7b2-4d48-bc2e-f22dc32cd7c6@xs4all.nl>
Date: Thu, 17 Jul 2025 11:03:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: i2c: tc358743: add support for more infoframe types
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add support for SPD, AUDIO and HDMI InfoFrames.

The tc358743 HDMI-to-CSI2 bridge is widely available, so it is useful
if it has support for more InfoFrame types than just the AVI InfoFrame.

Tested on my Raspberry Pi 5.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/i2c/tc358743.c      | 62 ++++++++++++++++++++++++-------
 drivers/media/i2c/tc358743_regs.h | 33 ++++++++--------
 2 files changed, 64 insertions(+), 31 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 1cc7636e446d..31588ff7f225 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -466,10 +466,26 @@ tc358743_debugfs_if_read(u32 type, void *priv, struct file *filp,
 	if (!is_hdmi(sd))
 		return 0;

-	if (type != V4L2_DEBUGFS_IF_AVI)
+	switch (type) {
+	case V4L2_DEBUGFS_IF_AVI:
+		i2c_rd(sd, PK_AVI_0HEAD, buf, PK_AVI_LEN);
+		break;
+	case V4L2_DEBUGFS_IF_AUDIO:
+		i2c_rd(sd, PK_AUD_0HEAD, buf, PK_AUD_LEN);
+		break;
+	case V4L2_DEBUGFS_IF_SPD:
+		i2c_rd(sd, PK_SPD_0HEAD, buf, PK_SPD_LEN);
+		break;
+	case V4L2_DEBUGFS_IF_HDMI:
+		i2c_rd(sd, PK_VS_0HEAD, buf, PK_VS_LEN);
+		break;
+	default:
 		return 0;
+	}
+
+	if (!buf[2])
+		return -ENOENT;

-	i2c_rd(sd, PK_AVI_0HEAD, buf, PK_AVI_16BYTE - PK_AVI_0HEAD + 1);
 	len = buf[2] + 4;
 	if (len > V4L2_DEBUGFS_IF_MAX_LEN)
 		len = -ENOENT;
@@ -478,26 +494,43 @@ tc358743_debugfs_if_read(u32 type, void *priv, struct file *filp,
 	return len < 0 ? 0 : len;
 }

-static void print_avi_infoframe(struct v4l2_subdev *sd)
+static void print_infoframes(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct device *dev = &client->dev;
 	union hdmi_infoframe frame;
-	u8 buffer[HDMI_INFOFRAME_SIZE(AVI)] = {};
+	u8 buffer[V4L2_DEBUGFS_IF_MAX_LEN] = {};

 	if (!is_hdmi(sd)) {
-		v4l2_info(sd, "DVI-D signal - AVI infoframe not supported\n");
+		v4l2_info(sd, "DVI-D signal - InfoFrames not supported\n");
 		return;
 	}

-	i2c_rd(sd, PK_AVI_0HEAD, buffer, HDMI_INFOFRAME_SIZE(AVI));
+	i2c_rd(sd, PK_AVI_0HEAD, buffer, PK_AVI_LEN);

-	if (hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer)) < 0) {
-		v4l2_err(sd, "%s: unpack of AVI infoframe failed\n", __func__);
-		return;
-	}
+	if (hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer)) >= 0)
+		hdmi_infoframe_log(KERN_INFO, dev, &frame);

-	hdmi_infoframe_log(KERN_INFO, dev, &frame);
+	/*
+	 * Both the SPD and the Vendor Specific packet sizes are the
+	 * same for the tc358840. Since HDMI_INFOFRAME_SIZE(VENDOR) is
+	 * larger than HDMI_INFOFRAME_SIZE(SPD) we use the latter instead.
+	 * The remaining bytes in buffer[] are 0.
+	 */
+	i2c_rd(sd, PK_VS_0HEAD, buffer, PK_VS_LEN);
+
+	if (hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer)) >= 0)
+		hdmi_infoframe_log(KERN_INFO, dev, &frame);
+
+	i2c_rd(sd, PK_AUD_0HEAD, buffer, PK_AUD_LEN);
+
+	if (hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer)) >= 0)
+		hdmi_infoframe_log(KERN_INFO, dev, &frame);
+
+	i2c_rd(sd, PK_SPD_0HEAD, buffer, PK_SPD_LEN);
+
+	if (hdmi_infoframe_unpack(&frame, buffer, sizeof(buffer)) >= 0)
+		hdmi_infoframe_log(KERN_INFO, dev, &frame);
 }

 /* --------------- CTRLS --------------- */
@@ -1375,7 +1408,7 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 	v4l2_info(sd, "Deep color mode: %d-bits per channel\n",
 			deep_color_mode[(i2c_rd8(sd, VI_STATUS1) &
 				MASK_S_DEEPCOLOR) >> 2]);
-	print_avi_infoframe(sd);
+	print_infoframes(sd);

 	return 0;
 }
@@ -2234,8 +2267,9 @@ static int tc358743_probe(struct i2c_client *client)

 	state->debugfs_dir = debugfs_create_dir(sd->name, v4l2_debugfs_root());
 	state->infoframes = v4l2_debugfs_if_alloc(state->debugfs_dir,
-						  V4L2_DEBUGFS_IF_AVI, sd,
-						  tc358743_debugfs_if_read);
+			  V4L2_DEBUGFS_IF_AVI | V4L2_DEBUGFS_IF_AUDIO |
+			  V4L2_DEBUGFS_IF_SPD | V4L2_DEBUGFS_IF_HDMI, sd,
+			  tc358743_debugfs_if_read);

 	v4l2_info(sd, "%s found @ 0x%x (%s)\n", client->name,
 		  client->addr << 1, client->adapter->name);
diff --git a/drivers/media/i2c/tc358743_regs.h b/drivers/media/i2c/tc358743_regs.h
index 2495878dc358..bc49e4248e40 100644
--- a/drivers/media/i2c/tc358743_regs.h
+++ b/drivers/media/i2c/tc358743_regs.h
@@ -720,25 +720,24 @@
 #define ERR_PK_LIMIT                          0x870D
 #define NO_PKT_LIMIT2                         0x870E
 #define PK_AVI_0HEAD                          0x8710
-#define PK_AVI_1HEAD                          0x8711
-#define PK_AVI_2HEAD                          0x8712
 #define PK_AVI_0BYTE                          0x8713
-#define PK_AVI_1BYTE                          0x8714
-#define PK_AVI_2BYTE                          0x8715
-#define PK_AVI_3BYTE                          0x8716
-#define PK_AVI_4BYTE                          0x8717
-#define PK_AVI_5BYTE                          0x8718
-#define PK_AVI_6BYTE                          0x8719
-#define PK_AVI_7BYTE                          0x871A
-#define PK_AVI_8BYTE                          0x871B
-#define PK_AVI_9BYTE                          0x871C
-#define PK_AVI_10BYTE                         0x871D
-#define PK_AVI_11BYTE                         0x871E
-#define PK_AVI_12BYTE                         0x871F
-#define PK_AVI_13BYTE                         0x8720
-#define PK_AVI_14BYTE                         0x8721
-#define PK_AVI_15BYTE                         0x8722
 #define PK_AVI_16BYTE                         0x8723
+#define PK_AVI_LEN			      (PK_AVI_16BYTE - PK_AVI_0HEAD + 1)
+
+#define PK_AUD_0HEAD			      0x8730
+#define PK_AUD_0BYTE			      0x8733
+#define PK_AUD_10BYTE			      0x873d
+#define PK_AUD_LEN			      (PK_AUD_10BYTE - PK_AUD_0HEAD + 1)
+
+#define PK_SPD_0HEAD			      0x8750
+#define PK_SPD_0BYTE			      0x8753
+#define PK_SPD_27BYTE			      0x876e
+#define PK_SPD_LEN			      (PK_SPD_27BYTE - PK_SPD_0HEAD + 1)
+
+#define PK_VS_0HEAD			      0x8770
+#define PK_VS_0BYTE			      0x8773
+#define PK_VS_27BYTE			      0x878e
+#define PK_VS_LEN			      (PK_VS_27BYTE - PK_VS_0HEAD + 1)

 #define BKSV                                  0x8800

-- 
2.47.2


