Return-Path: <linux-media+bounces-51835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLn5AJmqfGkaOQIAu9opvQ
	(envelope-from <linux-media+bounces-51835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:56:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87199BAC97
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B463930A92D0
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37BD3859C2;
	Fri, 30 Jan 2026 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2KolQS2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76DA3803CB
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769777410; cv=none; b=F5aEhe/YMP+6FBadOEcfkUaC3VYFeeAix1QeEuenNP317dih+wih30U/AKSAS3aGr23IYDgxe9HnodjKOL3++UsTk+2CJncm7Djwm81b2yRPBe7oCsK36if6RmVv34tMiB90EK+j/TeTctR8Fa/ZQjn1lkN1mr6znmva0+VbFTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769777410; c=relaxed/simple;
	bh=XkC6pC1Ht7QYhYz5xBTY+ZnKrbdM95bt/73kNqM5zOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l97yxZYb70pvBGDS8JZM/2l/wHGrK/pdekHFOiJQ2cKIwzKHNh7ijj17XCylYVuIEQ7+ooIV2Wlqh+X461QJq17U6354yNtt7d1/eF3XIbFLUM61wCJo4TAJ37VyTrycw+SnHBAfRgsGhuVzEVAu0rgx/11AZafSKB+sxPIAczc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2KolQS2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-435a11957f6so1749099f8f.0
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769777406; x=1770382206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edep+Evwox4IxBSEQEcIkaZkpzUcbpvh4gwyQ5gLWYA=;
        b=d2KolQS2+suGkg6hfU8mLCyAOZmCCxFDjzuqt30vafRIheHXGHEsPNLeSKELOlL2j4
         MTHrWbvn9TUIdysoiScWorpivDQYeXFN7/IY6mm/aGZikIu8IooWaJWkeT7q+72zHZLI
         7aln6Mbq9RSxqlbeaXHeJAa+uIl0kXr9S/R5LNqUuie53+TifSmU1xlIcm7gyKEtVC/x
         5z6AYjSM29gaClhta49B46sKYhdWqdTf7WgDBwLmhzJ3BHI9xRQjt3bkGXWa+2yfv/6v
         AHU+XdDpP/SQEFYigUL/5pVY58hdHPWgiDfJFpL9bdR9T2rqgzqxFEOTnCK6FEiVX25o
         jYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769777406; x=1770382206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=edep+Evwox4IxBSEQEcIkaZkpzUcbpvh4gwyQ5gLWYA=;
        b=qrCQ6uwIjjJ/url0CZFAaAxG4pUtbYqY8lsdJsxHBwA0mvpRRRQdyWlp9Eu4vEEC3+
         8kQ8MTJziRuaZnlMvJGwLQZ+St2BinfwivcilXbW0sjEh6TkYFxcZd07TYMIRVupJnVS
         N5Dfuu0s6KM0jLeLDyAzn548V7riwbhT4DnEzPl4C+XSoNXjS8mHmsJoqEOCX/3DfHq7
         RkyWDl7hQXKiLqNOidYP1kRx1GcEN9URo/0rAjIo3ZOdl6XVY6BqFjMJgJspPS26lKON
         OJDuu7fHKaNKegu0XzH2jL3I4HSKhZb7H3pYbEVNvWdGEOVgbHmWgBB/YMFTNCH7Ssq8
         3nMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUgl+ocoZsZgCS9wzEqhsc/HXguy8hWoHunYpgeR/7nOWilpaYLb6YZrbaSbUgOqrl+o5DJ3MWWG+q6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxu5hafAf9P01pYe38TEaiO3b0wVFAH/+clUUTahT0L1ku2Ie
	pzoPIW7JIsHAJ/RAmFlXXzALtHsEGMeRBU52X1QDH4R65X4AXqH4HE0Y
X-Gm-Gg: AZuq6aKcRl1qQR8bjmb5dFC3ly5xsq4xxaau7KUaF5eTyXuosaDoUn1AtEq5AjT4DGQ
	jKE6ag0I49UI1/e8g0ZHwmFhrzC7rohUM/OzQy3a1ogJwA/jJLymLVIax7KgK1MpnGjJOlOdV4r
	1Clkr7ZyR4yW1NIo4Pcbkr7hnc1eWQ+0SPW62ENa+WpkUuipdOJJ+mRVsTQz3RalY5hJf2EpTBY
	sFQkx9jSbto0GXeyK0UsnExxzDxbWi86lkKvL81kDBh0D9DavrRY5T7kIogRkP95rfMpPnvNLDj
	mdQ9iIfflL4wcXCP+ggKcj8LPIMdyer9W3ey6d+j43nSSPwYtWY+Vpw9jAferjTmbaAhd5wPsoW
	3xMi6jZucJl/BWtUsly/s2Ocv35vGKoJdqgonCn2GUGeANcdj0KN77eY4rNkhmnQQB7JLwkwlK8
	tq
X-Received: by 2002:a05:6000:2689:b0:430:fa9a:74d with SMTP id ffacd0b85a97d-435f3a7bb17mr4337461f8f.24.1769777405561;
        Fri, 30 Jan 2026 04:50:05 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm22738783f8f.5.2026.01.30.04.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 04:50:05 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v6 10/15] staging: media: tegra-video: tegra20: adjust format align calculations
Date: Fri, 30 Jan 2026 14:49:27 +0200
Message-ID: <20260130124932.351328-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130124932.351328-1-clamor95@gmail.com>
References: <20260130124932.351328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51835-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87199BAC97
X-Rspamd-Action: no action

Expand supported formats structure with data_type and bit_width fields
required for CSI support. Adjust tegra20_fmt_align by factoring out common
bytesperline and sizeimage calculation logic shared by supported planar
and non-planar formats and leaving planar-related correction under a
switch.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 39 ++++++++++-----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index c8afc6f2adf2..4b218b9fbc26 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -280,18 +280,13 @@ static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
 	pix->width  = clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIGHT);
 
+	pix->bytesperline = roundup(pix->width, 8) * bpp;
+	pix->sizeimage = pix->bytesperline * pix->height;
+
 	switch (pix->pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_VYUY:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_YVYU:
-		pix->bytesperline = roundup(pix->width, 2) * 2;
-		pix->sizeimage = roundup(pix->width, 2) * 2 * pix->height;
-		break;
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
-		pix->bytesperline = roundup(pix->width, 8);
-		pix->sizeimage = roundup(pix->width, 8) * pix->height * 3 / 2;
+		pix->sizeimage = pix->sizeimage * 3 / 2;
 		break;
 	}
 }
@@ -576,20 +571,24 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
 	.vi_stop_streaming = tegra20_vi_stop_streaming,
 };
 
-#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)	\
-{							\
-	.code    = MEDIA_BUS_FMT_##MBUS_CODE,		\
-	.bpp     = BPP,					\
-	.fourcc  = V4L2_PIX_FMT_##FOURCC,		\
+#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	\
+{									\
+	.img_dt		= TEGRA_IMAGE_DT_##DATA_TYPE,			\
+	.bit_width	= BIT_WIDTH,					\
+	.code		= MEDIA_BUS_FMT_##MBUS_CODE,			\
+	.bpp		= BPP,						\
+	.fourcc		= V4L2_PIX_FMT_##FOURCC,			\
 }
 
 static const struct tegra_video_format tegra20_video_formats[] = {
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
-	TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
-	TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
-	TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
+	/* YUV422 */
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 2, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, YVYU),
+	/* YUV420P */
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YVU420),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
-- 
2.51.0


