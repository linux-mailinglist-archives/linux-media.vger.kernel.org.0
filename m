Return-Path: <linux-media+bounces-60675-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMDIEI6H+2lpcQMAu9opvQ
	(envelope-from <linux-media+bounces-60675-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:25:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4AE4DF4D6
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10C8C300D4E8
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 18:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB61C4C9551;
	Wed,  6 May 2026 18:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kOo5Orvx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65CE4C6EED
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 18:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091846; cv=none; b=I5H20tS7JO2dnG9RUtS9Mx4vJyJw7X8IyqcVIJgyjGEaA+ABc7JgWzOK7Vm7eQgfrh5nhupGAvNj7Gnb6R8piEByHv7jkm7FkNPMDAkEjXEl+AEtGZT4X1oWCRoQL6U0WRo6omQy6VWU5xSd6FLDNPYQLw0CH8oyp01FvyzkhSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091846; c=relaxed/simple;
	bh=5rTqxxrXxuKRZeZ8cljm9KNLkFR9jV2eUD4Dy5C5uvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iO+wV0cgEQl9yBsKo2v+f6c/5YRkB3U5oCW2bh7n+dHFJQLIiwCB1Pri4uAa9Yyf1zoL5rWF8AAdpv+hsDDTRobSOs8czJAf52pu0mo4WaJ9dCKa5WuvyfU0q/UdJRXg6fgJ8OVfDktyoqDMyFYN+fRQtpHZx8U1ChrYkiVJpKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=kOo5Orvx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so103612765e9.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 11:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778091843; x=1778696643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikJiy5dWqthQNFnGNxSlv0pQq/OSpUugZlZvhxfr4so=;
        b=kOo5Orvxa5MhDTX+UW+HfsVkmuiUnC9IHoFOP+m4pUKADClBnO/0BKMN2vYYheOZkE
         Z1Ss4lGdwuZE38UL2vxlOpGZQgZ/N48UsTclJ+v9a4aHRBi8gmPA41zsclf+GvDc5nVO
         pdiP++cDijZ5lgHvylymGObeRXeufHheZpQl79j+tE26HZUkQ/7pSzwmkxVlU7+MJzgT
         6XLXHku7QhKNM10wCgBYilkQZQubcBTpr/zJgV0fSd6V2V0Co62GFQ8+trA6rquGWJ0l
         sYB0rzoGrtPAIH8QGr1EajSIRd7yuWT+yX+tRq93PlsmhSh89nKsCO137PkLNF24iHEm
         SDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091843; x=1778696643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ikJiy5dWqthQNFnGNxSlv0pQq/OSpUugZlZvhxfr4so=;
        b=bVVoXOjMqNfmyItxHDvvUwP8lIjalicXsEte4lKBzEhS8k0LtNFhvNet/QGpt91OQg
         Py2t3Aia1IWLpT/o/C0JHyd0MRbBusPG070ECieW+POOSJdKigtg48TBa8Q3no8BG71B
         uL5F1GwkMFJTsPq2kY7mZHy2Ok6sOIijDYqf1HAPbyCjUQ1jFOAlxOrcKHveRPM3POqX
         ieGOMpC3ql9jZ+sqAOJPlnngSOEgW73v1LXr0jLI9arA1znzC3NOwgONha0j6y/H8db0
         HiNaH8WXI68/jhXP1tV2epV62vOyMLuf/dorsgn/oAKWwF09JZWcczrWIu5JBp8c06GF
         IqRQ==
X-Gm-Message-State: AOJu0YzrymkmgOxs2zpq0GVXIhaFzzpHnxvMk9dXB0zAm+dae/1NhZRm
	OU2rw5QdvKwDMikcizIqx6/EWTyZMUNB5YrqMZAyAaabk0XnHyNAaKBcu/yEDk46xlAZhVOm0L3
	ysXxm
X-Gm-Gg: AeBDiet6jjYmv9rdeox7yLQ5amAAVW1pNMO5du+x9s506SQpvAmdiHgVWxyF+/2JI8F
	8xRPKdTS+U7wUohe1eSh5ixt00UdDyzDcyRsjtIxLinze2k+8LSwlXKGt5XZmBU3JhAdoimwkuH
	MgIRgmmJu3KHvgoW/ZurR7IQTJC7bNyh2V9o+BbU4/77oi4PXAbW1nID7BgbFc7LxrqmS/AtFBD
	tdKlJXveAlwVondUTmrCPo+ycCJSVCWqESbEfWN/mamDbtJ+Smc8BPovQtNYpTcXCaWdav55R/b
	DR3IY8FSZH9SYaYUNxdtctZV1KbrQPq4g2E/mt3YBXYR7uwHLbJdzxl9YwYszuVDaXtxbCjlKuZ
	E/s5WtGU1Ok8KDj+zgbBUf2wr6KaYBQZIEPe7nFqSk8zkg+BNOORvScqR7dUGoPP4FRuB+StNyv
	/nWHsCypZrSXWg67TzYFHFmbAK
X-Received: by 2002:a05:600c:8b08:b0:48a:5501:7995 with SMTP id 5b1f17b1804b1-48e51f32ca9mr82587515e9.18.1778091843131;
        Wed, 06 May 2026 11:24:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm36165675e9.5.2026.05.06.11.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:24:02 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 06 May 2026 19:23:48 +0100
Subject: [PATCH 10/13] media: imx355: Add support for get_selection
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-media-imx355-v1-10-660685030455@raspberrypi.com>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
In-Reply-To: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Queue-Id: 4A4AE4DF4D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60675-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,raspberrypi.com:email,raspberrypi.com:dkim,raspberrypi.com:mid]

Provide all the cropping information via get_selection.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 5a3bfcd0f51c..d8d7cc0ceab9 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -88,6 +88,11 @@
 /* number of data lanes */
 #define IMX355_DATA_LANES		4
 
+#define IMX355_PIXEL_ARRAY_TOP		0
+#define IMX355_PIXEL_ARRAY_LEFT		0
+#define IMX355_PIXEL_ARRAY_WIDTH	3280
+#define IMX355_PIXEL_ARRAY_HEIGHT	2464
+
 struct imx355_reg {
 	u16 address;
 	u8 val;
@@ -671,6 +676,7 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	struct imx355 *imx355 = to_imx355(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
 		v4l2_subdev_state_get_format(fh->state, 0);
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(fh->state, 0);
 
 	mutex_lock(&imx355->mutex);
 
@@ -680,6 +686,11 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->code = imx355_get_format_code(imx355);
 	try_fmt->field = V4L2_FIELD_NONE;
 
+	crop->left = imx355->cur_mode->x_add_start;
+	crop->top = imx355->cur_mode->y_add_start;
+	crop->width = imx355->cur_mode->width;
+	crop->height = imx355->cur_mode->height;
+
 	mutex_unlock(&imx355->mutex);
 
 	return 0;
@@ -886,6 +897,52 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static void
+__imx355_get_pad_crop(struct imx355 *imx355,
+		      struct v4l2_subdev_state *sd_state, unsigned int pad,
+		      enum v4l2_subdev_format_whence which, struct v4l2_rect *r)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		*r = *v4l2_subdev_state_get_crop(sd_state, pad);
+		break;
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		r->left = imx355->cur_mode->x_add_start;
+		r->top = imx355->cur_mode->y_add_start;
+		r->width = imx355->cur_mode->width;
+		r->height = imx355->cur_mode->height;
+		break;
+	}
+}
+
+static int imx355_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		struct imx355 *imx355 = to_imx355(sd);
+
+		mutex_lock(&imx355->mutex);
+		__imx355_get_pad_crop(imx355, sd_state, sel->pad, sel->which,
+				      &sel->r);
+		mutex_unlock(&imx355->mutex);
+
+		return 0;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = IMX355_PIXEL_ARRAY_TOP;
+		sel->r.left = IMX355_PIXEL_ARRAY_LEFT;
+		sel->r.width = IMX355_PIXEL_ARRAY_WIDTH;
+		sel->r.height = IMX355_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 /* Start streaming */
 static int imx355_start_streaming(struct imx355 *imx355)
 {
@@ -1062,6 +1119,7 @@ static const struct v4l2_subdev_pad_ops imx355_pad_ops = {
 	.get_fmt = imx355_get_pad_format,
 	.set_fmt = imx355_set_pad_format,
 	.enum_frame_size = imx355_enum_frame_size,
+	.get_selection = imx355_get_selection,
 };
 
 static const struct v4l2_subdev_ops imx355_subdev_ops = {

-- 
2.34.1


