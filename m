Return-Path: <linux-media+bounces-60934-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOP+LRAN/mm2mQAAu9opvQ
	(envelope-from <linux-media+bounces-60934-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 18:19:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3224F9560
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 18:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B9BA3014130
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 16:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D49237F8DF;
	Fri,  8 May 2026 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTMXZXms"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBE130F932
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 16:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257067; cv=none; b=BVAC/8z76LKcucgdQdEQJcTf5rltuTaeCx0xgaumBW9jVegNjo722cr/yhAfiCMiBfNVx+zERGJPzkg7ALjziMg0otjbRsx1pIKAFkng7eC9WQW743iq9tmlQbzVHiTSf/JjTnm81p65d2Xe9eeW45P6QBUWoq1ZqFCw4Hfz/os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257067; c=relaxed/simple;
	bh=/Eqe5iU44ry/gzPo+lsa36VWQqG8Zp8mFC8GsAoSEgs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p8CKcmQ/wC/DFKEmqlPptUHu+PhGvdtqq1l/yEExRkb1cvfrYI7GIRygOWZcecfs7KW0ay59tDRFYkNhBjeGpx+NyguKk34f5jlEA3hKtKqhkkQG4JsTC7CfKNLMTSaoTuj1LYdhh0LeXERDmNsRGtiLnPXOs1zuvkJHfxXWYfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTMXZXms; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso1664795f8f.2
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257065; x=1778861865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFzpvNnAmypkJr1Nj81ekibmeUXSe5xhjPOVIP2fg5s=;
        b=kTMXZXmsbWlvAbgu0Kzg3kHyIEUYc7iGiSD5bd7qVUI1TgxXAvy/hTJC4OXCgr90sg
         NCyNsPWNgSe/Y0dlAoU8gHvlEjbdCppnwkwnZUxXG4CGLzcuSYSr2mz1eoTtKOOZFryf
         I2uaXaEo7whnAe6yzoddXu/gt3IV28ekLLg5K+FQ+gaCI0jIcwpTe5nVVRK2U6IT+Cvq
         GOKw3uN2H8HJa0AvThMF6pxOxVq0EP9Vvt+2K4HP39ADlrJEpugB5GyhIBGXqjRknjvY
         /beJ0LjQFkhL9Ft/U/LOHF0Om1l9sv6sJZwYWgoKcJtCmTQL5Twc1wcXIqxSRgma4Nyi
         CNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257065; x=1778861865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFzpvNnAmypkJr1Nj81ekibmeUXSe5xhjPOVIP2fg5s=;
        b=HSmpw7jmD7aqZMI27JeVPZJ7e8wStDHNCrAD/xctGk9XVvfMrI2Hr/AzbRvYD5znC3
         0rKlF87NuFyFHR61L6WqLuigRcnq2IEpsun5O6kGTlw4YQLFaXb6uOuXJ9G/319nxLSY
         HFwBy9eIwBz8cm97R2FQeBh+CWnCI7BVodEapJ3uhZPSe5sYFrmTdJ6yvxM42Wb874iE
         /tFT1YdXvOOo2lt7qDkScAugacLzW+rYRggwzaFT5ygsh1QdGI5Phpru0QOjsN0aVeXn
         oL8DvuDSITFbFam5tJRZZHbejMFo9dM3FKBlIPVm8bLp/I+5Sd8GiMGudYs/3nVQx08r
         66LQ==
X-Gm-Message-State: AOJu0YyinEQyhgk/rBhuuCRsWI+84WLIfy7xHFM4//bg8NL66pz4LhnE
	ufPY/bwAl1MVNSnnEKjJpfymyzlwH0WJxyTjzu33yHWiLj4/yJCn6rDlXKV2VGSxNJKKxw==
X-Gm-Gg: Acq92OGSZcBgxvtOcWiKsXoBKMHoes9pSLRlpKuXbcEiyZjY/oFfuBQ0a4ue0e00niu
	XQV/jEl5tEkEPOgvfdGzejTwUfvF3MPfv65GxQZmrl/EvV8YMVBQ60q9U50dSCGEwSMysb6vCUL
	ApSrhbMjq4NgYLUwq/wpQPbGE1KOPSZ/06xngZns2kzMCvj1kwsTNIXVE3MhJVa/Ss4LjQ7DjmY
	v1u0j5hJih9nQJfIruvYZ6jheZSSVRfg7JF2xH+jR5zqDa44ogKz3JIbP3tLPkyEjepRyHBzVT0
	TpOui7qR7gASQ/FhCldc3tfgcF4OU6l34ehwGqhc/vqAxr57clEFTCxth8trgavGxoVL20D3NTJ
	jdpXtZrpCS5QSzAt3SjCjAEd/J8L4LjNjBS3sGIccJOFE37yzdSZtBSSuaKOkgfTmaqVdOX7C0j
	fFBeLvmhEjuanrzi0rObyvNdXAY5bWc/J+1hNVYaa4zVMsoN95pKkYhdQTX0nHLa2nyZh/S7SL3
	bARBdf/RQ==
X-Received: by 2002:a05:6000:186b:b0:43c:f1a5:56f6 with SMTP id ffacd0b85a97d-4515e245b31mr19758647f8f.43.1778257064705;
        Fri, 08 May 2026 09:17:44 -0700 (PDT)
Received: from thinkpad ([46.164.92.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6b071sm5276653f8f.14.2026.05.08.09.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:17:44 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v2 3/3] media: sun6i-csi: capture: Support MC-centric format enumeration
Date: Fri,  8 May 2026 19:47:21 +0330
Message-Id: <20260508161721.94285-4-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508161721.94285-1-arash.golgol@gmail.com>
References: <20260508161721.94285-1-arash.golgol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0C3224F9560
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,lists.infradead.org,lists.linux.dev,ideasonboard.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60934-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Extend vidioc_enum_fmt to support MC-centric enumeration by filtering
pixel formats based on the provided mbus code. Advertise MC I/O support
on the video device to reflect its intended usage within a media graph.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v2:
 - Return pixelformat directly instead of a pointer
 - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-4-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 39 +++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 375ea6745eed..2db96ee19d8b 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -327,6 +327,22 @@ static bool sun6i_csi_capture_format_match(u32 pixelformat, u32 mbus_code)
 	return false;
 }
 
+static u32 sun6i_csi_capture_pixelformat_find(u32 mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
+		const struct sun6i_csi_capture_format_match *match =
+			&sun6i_csi_capture_format_matches[i];
+
+		if (match->mbus_code == mbus_code)
+			return match->pixelformat;
+	}
+
+	/* Valid fourcc is non-zero. */
+	return 0;
+}
+
 /* Capture */
 
 static void
@@ -729,11 +745,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
+	u32 mbus_code = fmtdesc->mbus_code;
+	u32 pixelformat;
+
+	/* MC-centric or Video-node-centric */
+	if (mbus_code) {
+		/* There is only one pixelformat for a mbus_code. */
+		if (index)
+			return -EINVAL;
+
+		pixelformat = sun6i_csi_capture_pixelformat_find(mbus_code);
+	} else {
+		if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+			return -EINVAL;
+
+		pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	}
 
-	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+	if (!pixelformat)
 		return -EINVAL;
 
-	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	fmtdesc->pixelformat = pixelformat;
 
 	return 0;
 }
@@ -1065,7 +1097,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 
 	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				 V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_RX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_csi_capture_fops;
-- 
2.34.1


