Return-Path: <linux-media+bounces-53893-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEJvB9CWo2neHgUAu9opvQ
	(envelope-from <linux-media+bounces-53893-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:30:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B8E1CAD8A
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED33030495CD
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6DB2701C4;
	Sun,  1 Mar 2026 01:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rjm8c9SF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BEC175A74;
	Sun,  1 Mar 2026 01:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328014; cv=none; b=Kc7KYJG1f8I5sizJE9LJgOGWjTuhXA5WAxl3jasnErjGx1I0+nBwcdbXUAhzIaMru0zxBErCNKn6pebRUFtSuAOJzSejSGP1eeDJdI3EFzeQjv5GmN7jfjZpCygYcvB2B9uqsAnI9t3mKAo/vn1Mnq2neKoWocrnslYXxhLHX/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328014; c=relaxed/simple;
	bh=l6r7TAdSaed17tNhusJkVtFzG6xQ+3cfZjw/jnjIBOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XJ7wgWE/G6WV9EE922EA/JvakOdGl/qsaSWGRxC0WNASv9gd1FN1GX0sxFO7jCH8m7DODtTzMt0IzlukMewg8VrYQa1c+qmb/3xtwZ7/oTJuLRD7OWWW6lbHXUmWbmGpapDG4wzQ/2XKdOYeu0A2CDBqiLo6wwCVjaf9LJd1TYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rjm8c9SF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF0FC19421;
	Sun,  1 Mar 2026 01:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328014;
	bh=l6r7TAdSaed17tNhusJkVtFzG6xQ+3cfZjw/jnjIBOk=;
	h=From:To:Cc:Subject:Date:From;
	b=Rjm8c9SFMAeNShvllqOQNnOLlUSd+2TEFfBIWIVAjdQ5lcnZEzRbJG5COrQ0DZIAP
	 hq71bOI71MHGNqD2K42W/HFD8Na72HoW6MHXI3dqKFVLSrCbD7sQXodPtZU5mJbBD4
	 hohW1oHK6puJLK8fMAZn2GWynIfMsJDPyyqcbcKy/xCAmTM6K/0NyN68OqUq43gkOo
	 Awx7oCBcqEcgH50Yq2a0RMyQIZZ1FYqLzFNdOseANEQYqFjx5+IlySMvX+FONWuuNo
	 EwCcOXSH4BIi/WcyYQYUC1V+bqxqUDNWSM5EXSDXAzXXTHRmFJDjPbIJpGNHhg7do4
	 iJgE7+xs/UKQQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	hansg@kernel.org
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov01a10: Fix the horizontal flip control" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:12 -0500
Message-ID: <20260301012012.1675698-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53893-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 71B8E1CAD8A
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From ada20c3db0db4f2834d9515f6105111871f04a4d Mon Sep 17 00:00:00 2001
From: Hans de Goede <hansg@kernel.org>
Date: Tue, 14 Oct 2025 19:40:09 +0200
Subject: [PATCH] media: i2c: ov01a10: Fix the horizontal flip control

During sensor calibration I noticed that with the hflip control set
to false/disabled the image was mirrored.

So it seems that the horizontal flip control is inverted and needs to
be set to 1 to not flip (just like the similar problem recently fixed
on the ov08x40 sensor).

Invert the hflip control to fix the sensor mirroring by default.

As the comment above the newly added OV01A10_MEDIA_BUS_FMT define explains
the control being inverted also means that the native Bayer-order of
the sensor actually is GBRG not BGGR, but so as to not break userspace
the Bayer-order is kept at BGGR.

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 141cb6f75b555..e5df01f979781 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -75,6 +75,15 @@
 #define OV01A10_REG_X_WIN		0x3811
 #define OV01A10_REG_Y_WIN		0x3813
 
+/*
+ * The native ov01a10 bayer-pattern is GBRG, but there was a driver bug enabling
+ * hflip/mirroring by default resulting in BGGR. Because of this bug Intel's
+ * proprietary IPU6 userspace stack expects BGGR. So we report BGGR to not break
+ * userspace and fix things up by shifting the crop window-x coordinate by 1
+ * when hflip is *disabled*.
+ */
+#define OV01A10_MEDIA_BUS_FMT		MEDIA_BUS_FMT_SBGGR10_1X10
+
 struct ov01a10_reg {
 	u16 address;
 	u8 val;
@@ -185,14 +194,14 @@ static const struct ov01a10_reg sensor_1280x800_setting[] = {
 	{0x380e, 0x03},
 	{0x380f, 0x80},
 	{0x3810, 0x00},
-	{0x3811, 0x08},
+	{0x3811, 0x09},
 	{0x3812, 0x00},
 	{0x3813, 0x08},
 	{0x3814, 0x01},
 	{0x3815, 0x01},
 	{0x3816, 0x01},
 	{0x3817, 0x01},
-	{0x3820, 0xa0},
+	{0x3820, 0xa8},
 	{0x3822, 0x13},
 	{0x3832, 0x28},
 	{0x3833, 0x10},
@@ -411,7 +420,7 @@ static int ov01a10_set_hflip(struct ov01a10 *ov01a10, u32 hflip)
 	int ret;
 	u32 val, offset;
 
-	offset = hflip ? 0x9 : 0x8;
+	offset = hflip ? 0x8 : 0x9;
 	ret = ov01a10_write_reg(ov01a10, OV01A10_REG_X_WIN, 1, offset);
 	if (ret)
 		return ret;
@@ -420,8 +429,8 @@ static int ov01a10_set_hflip(struct ov01a10 *ov01a10, u32 hflip)
 	if (ret)
 		return ret;
 
-	val = hflip ? val | FIELD_PREP(OV01A10_HFLIP_MASK, 0x1) :
-		val & ~OV01A10_HFLIP_MASK;
+	val = hflip ? val & ~OV01A10_HFLIP_MASK :
+		      val | FIELD_PREP(OV01A10_HFLIP_MASK, 0x1);
 
 	return ov01a10_write_reg(ov01a10, OV01A10_REG_FORMAT1, 1, val);
 }
@@ -610,7 +619,7 @@ static void ov01a10_update_pad_format(const struct ov01a10_mode *mode,
 {
 	fmt->width = mode->width;
 	fmt->height = mode->height;
-	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	fmt->code = OV01A10_MEDIA_BUS_FMT;
 	fmt->field = V4L2_FIELD_NONE;
 	fmt->colorspace = V4L2_COLORSPACE_RAW;
 }
@@ -751,7 +760,7 @@ static int ov01a10_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	code->code = OV01A10_MEDIA_BUS_FMT;
 
 	return 0;
 }
@@ -761,7 +770,7 @@ static int ov01a10_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
 	if (fse->index >= ARRAY_SIZE(supported_modes) ||
-	    fse->code != MEDIA_BUS_FMT_SBGGR10_1X10)
+	    fse->code != OV01A10_MEDIA_BUS_FMT)
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
-- 
2.51.0





