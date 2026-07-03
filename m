Return-Path: <linux-media+bounces-66452-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pYkYO1WJR2rQaQAAu9opvQ
	(envelope-from <linux-media+bounces-66452-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 12:05:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44297700F51
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 12:05:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=R+dmW1Jw;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66452-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66452-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88B62304D273
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 09:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778203B5305;
	Fri,  3 Jul 2026 09:55:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE4F3B6BF7;
	Fri,  3 Jul 2026 09:55:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072547; cv=none; b=Pd6Laz2OrBc0Lx3nEV+0SO8PtITPVmOxqlicC59AsYqPgUt00S8FxQMT6V8i8qDJLy7uPxFhiEOqAeryYWVxtJi1QYS1HnKe1T9k7N8R8eg+HMUXZ1VJNj3k45B1cw/wnogylVLCOSX33300xaZaxI8Ni8Eyu1/2KqPWjXvuCW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072547; c=relaxed/simple;
	bh=G7g7EkbaGiZLIcF8Qw4x0zTrMroMepQCMBgRhA/phhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRpi5IPny5YP7Qet26Nzn36M4wkxq60Yvm/2T1LpWWtNc4ap3mfZaZUrN3grQnSo4b6nv9czt714vtRAd5sM3Q3ozhX21rln3HQ80xeuAHO3YiXXBfiAXs+uH/CM0ZqMj9BYFgG5gtvTgnsWJl4FsmTKl6622J06sNfxmdOaR4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R+dmW1Jw; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E79D611DD;
	Fri,  3 Jul 2026 11:54:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783072481;
	bh=G7g7EkbaGiZLIcF8Qw4x0zTrMroMepQCMBgRhA/phhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R+dmW1JwR0FqqJxdCOk0oKE1ZXGEPWNqBsa2FtSvbmlCfXCEWCQDyTT5/iCZexV2n
	 y9bmRVqrGOs4AyMZDkMcXNfwJkGMKUoJCZgUZsofQ+CsSaPAfvTsqiPJQyIRiWjlMe
	 zFCY1kGPhTLMWej6Y3QXTU52YQsU2FzYVTSvyEdQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 03 Jul 2026 15:24:15 +0530
Subject: [PATCH RFC 10/10] media: i2c: imx678: Support 10-bit output
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-imx678-meta-v1-10-7c4924a0df05@ideasonboard.com>
References: <20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com>
In-Reply-To: <20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, 
 Ryuichi Tadano <Ryuichi.Tadano@sony.com>, 
 Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4631;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=G7g7EkbaGiZLIcF8Qw4x0zTrMroMepQCMBgRhA/phhE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqR4bTZlIcziuQz5l1myw43ryC2nn1VOCy+ingD
 tDb2d7rBw6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCakeG0wAKCRBD3pH5JJpx
 RSKvEACA6TIWA31FkyHi+ltXsZ00rmnIDoyeBdtMstzwwJ3JkI9N39eAMIzhawXJDOK42yyFY64
 eFRAvA80jRSfLebUV53a4YjzgY53cCn+ZfKfwaVHmN0GqYyUuaDu05RflZkQiRJCBIc0qy0VqKH
 PdmZnQ5LDFy/rtGehKEeAcXCVeL2CvduzUCNlXv+DV/UW7LcOslI1d4MXTSCQU+OAyAbeI050d+
 qINyfaZu0hNHVWrAMPGDOFl3+QLh7Jgs7IGSrXqgLoIk6FDDDtR1H2UAQbmGc2fp/kaWByOkKUF
 SjGplvRvvPya+ND4atbMXPGk5X+/lPwu1nwFGq7FrlAX4kD3neA51/npAmhSwJS4qyR3ukTAGtS
 wy4lsBZOx9d67arypYk/ba2BZ0r0D3uF43qfahIj1x6UQa9Kx9ABKnZJbpmCY4LFdfPgnH4y1Gn
 vlLG9BS3tK7iQC4tnygAoCxjzDZ9ppCmS/x5D0PGuJZIaW0dqAmcs0HYi6HeixGGLT6p21ITyYN
 DtjTTlfQbA0LYoM5MXvqBKiyMHCo28r0jWkh5ZWRuzYZwdMS7oM7MDlISU7XP1NdYbknOuNeul2
 12To7kjAD/Hm8N3Y4gYJAIlPjwkG5sa1Ky1BvbzM8+gWx2hlCrD39Eaq+Y3QeKNzkrwjtYIUCBk
 bnXD5JgI85zogyw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66452-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44297700F51

The sensor supports 10-bit output using MDBIT register. Add support for
user-configurable output bit depth using the media bus code on the
source pad

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx678.c | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
index 3961d728a65f..45191e45d12d 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/imx678.c
@@ -113,6 +113,8 @@
 #define IMX678_AD_10B			0x0
 #define IMX678_AD_12B			0x1
 #define IMX678_REG_MDBIT                CCI_REG8(0x3023)
+#define IMX678_MD_10B			0x0
+#define IMX678_MD_12B			0x1
 #define IMX678_REG_GAIN_PGC_FIDMD       CCI_REG8(0x3400)
 
 /* Test pattern generator */
@@ -670,7 +672,6 @@ static const struct cci_reg_sequence common_regs[] = {
 	{ CCI_REG8(0x47c2), 0x3e },
 	{ CCI_REG8(0x47c3), 0x01 },
 	{ IMX678_REG_WDMODE, 0x00 },
-	{ IMX678_REG_MDBIT, 0x01 },
 	{ IMX678_REG_XXS_DRV, 0x00 },
 };
 
@@ -681,16 +682,21 @@ static const u32 codes_internal[] = {
 
 static const u32 codes_meta[] = {
 	MEDIA_BUS_FMT_META_12,
+	MEDIA_BUS_FMT_META_10,
 };
 
 static const u32 codes_bayer[] = {
 	MEDIA_BUS_FMT_SRGGB12_1X12,
+	MEDIA_BUS_FMT_SRGGB10_1X10,
 	MEDIA_BUS_FMT_RAW_12,
+	MEDIA_BUS_FMT_RAW_10,
 };
 
 static const u32 codes_monochrome[] = {
 	MEDIA_BUS_FMT_Y12_1X12,
+	MEDIA_BUS_FMT_Y10_1X10,
 	MEDIA_BUS_FMT_RAW_12,
+	MEDIA_BUS_FMT_RAW_10,
 };
 
 static const struct imx678_model_info imx678_aaqr_info = {
@@ -1009,7 +1015,6 @@ static int imx678_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	fd->num_entries = 2;
 	fd->entry[0].stream = IMX678_STREAM_IMAGE;
 	fd->entry[0].bus.csi2.vc = 0;
-	fd->entry[0].bus.csi2.dt = MIPI_CSI2_DT_RAW12;
 
 	fd->entry[1].stream = IMX678_STREAM_METADATA;
 	fd->entry[1].bus.csi2.vc = 0;
@@ -1019,6 +1024,16 @@ static int imx678_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	fmt = v4l2_subdev_state_get_format(state, pad, IMX678_STREAM_IMAGE);
 	fd->entry[0].pixelcode = fmt->code;
+	switch (fmt->code) {
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_RAW_10:
+		fd->entry[0].bus.csi2.dt = MIPI_CSI2_DT_RAW10;
+		break;
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_RAW_12:
+		fd->entry[0].bus.csi2.dt = MIPI_CSI2_DT_RAW12;
+		break;
+	}
 
 	fmt = v4l2_subdev_state_get_format(state, pad, IMX678_STREAM_METADATA);
 	fd->entry[1].pixelcode = fmt->code;
@@ -1117,7 +1132,7 @@ static int imx678_set_pad_format(struct v4l2_subdev *sd,
 	struct imx678 *imx678 = to_imx678(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	if (fmt->pad != IMX678_SOURCE_PAD && fmt->stream != IMX678_STREAM_IMAGE)
+	if (fmt->pad != IMX678_SOURCE_PAD)
 		return v4l2_subdev_get_fmt(sd, sd_state, fmt);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
@@ -1378,7 +1393,8 @@ static int imx678_write_common(struct imx678 *imx678)
 
 static int imx678_program_window(struct imx678 *imx678,
 				 const struct v4l2_rect *crop,
-				 const struct v4l2_mbus_framefmt *format)
+				 const struct v4l2_mbus_framefmt *format,
+				 const struct v4l2_mbus_framefmt *src_format)
 {
 	int ret = 0;
 
@@ -1413,6 +1429,18 @@ static int imx678_program_window(struct imx678 *imx678,
 		break;
 	}
 
+	switch (src_format->code) {
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_RAW_10:
+		cci_write(imx678->cci, IMX678_REG_MDBIT, IMX678_MD_10B, &ret);
+		break;
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_RAW_12:
+	default:
+		cci_write(imx678->cci, IMX678_REG_MDBIT, IMX678_MD_12B, &ret);
+		break;
+	}
+
 	return ret;
 }
 
@@ -1423,7 +1451,7 @@ static int imx678_enable_streams(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct imx678 *imx678 = to_imx678(sd);
 	const struct v4l2_rect *crop;
-	const struct v4l2_mbus_framefmt *format;
+	const struct v4l2_mbus_framefmt *format, *src_format;
 	int ret;
 
 	if (!(mask & 1ULL))
@@ -1437,7 +1465,9 @@ static int imx678_enable_streams(struct v4l2_subdev *sd,
 					  IMX678_STREAM_IMAGE);
 	format = v4l2_subdev_state_get_format(state, IMX678_IMAGE_PAD,
 					      IMX678_STREAM_IMAGE);
-	ret = imx678_program_window(imx678, crop, format);
+	src_format = v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD,
+						  IMX678_STREAM_IMAGE);
+	ret = imx678_program_window(imx678, crop, format, src_format);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to set mode\n", __func__);
 		goto err_rpm_put;

-- 
2.54.0


