Return-Path: <linux-media+bounces-54021-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNFNL16npGntnwUAu9opvQ
	(envelope-from <linux-media+bounces-54021-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 21:53:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F561D18CF
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 21:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DA673011BFF
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 20:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E613148CF;
	Sun,  1 Mar 2026 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/YLvbRC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C6A2AD2C
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 20:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772398422; cv=none; b=Y8Fb+N4tNmBq+PAu0/6Z4YcxIk1gex4gHvsyuNcpcWOEuhKJpp11e9+7IZbgps/pHcWdDh+hE3e2USJi4TUEx6HRN+w9xTqdCmhBb8uHXSiWHkb31Bzf8vO1TsNbrkyGfDDlfqQQW89tHinDZaDQaUCOH8J2+ddJ9tJVukzxrRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772398422; c=relaxed/simple;
	bh=39uFdK1Q7vn96qEWLv0wHXVCHKfsSGVWDeHHyAku2q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9R/E+wkeHX/BtA+GfYQdk5p54/W6qYcMVVAo8ChzhpbnS+Smb/UkGclae0qTAnB4BG6al7AUaSOjB0FQOnLbXnBHL0t/UlFkNglc1iFyFkEeAqaL8FUYT8vrYcFXn+KXNU5CpnBj2A03xv3N6/V62lS6J9sk64xy0v8CRgSTbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/YLvbRC; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-389ff6e5885so50514071fa.0
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 12:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772398419; x=1773003219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jywKuAMQtVAiPypAjdsdOCiiCMyjTljL9XvusWi7pf4=;
        b=C/YLvbRCALAoPfTJXWlk/9nV8KnGtp/fU4OaCQ7IvSmMvOITO+sZbtHQSceSIwFoJ/
         +ZSPG7TZhpz3+NhVx1mfRDWZr/FjBrecPLqgx3mlVkMMhoZlvJLfFYWWb+S5hHeKyDXl
         UG8D3b2Z869YngYwVAz3gy5PBkUl991HYHcIS7WITm8ZkZU0AIWdd7h3/nc2NWSKCmRJ
         UE2GmcXn+nz7y2dG7WpOPlGZdxuwISbMPlCMwTEAQyCD5UUMbblnhX0IZusAx7/GLASP
         YDc1qOF2Cbc0ulMk5bQFeCgqjbl6Rk1Ijmhl9kTix6HVizIohQRR3L2+vaYTmxGEI3Y0
         VZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772398419; x=1773003219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jywKuAMQtVAiPypAjdsdOCiiCMyjTljL9XvusWi7pf4=;
        b=iKPI2Q2yPM5th4G0KhqPZCHVGLKBfEPc9ZkS/7mcCLz1MU64UGSm4xb+gaiNVLFaCV
         DSLUWgodcyL6aNpggjgon3wS6TOS02+r4SErvQ3wMFdFLNrygypgVNP/K/IIDDbA3har
         R5FVbjhCRVH2T4jyT2WkYZBovJkz+oO5K0WX5qy2UpfmDNv0P4hpr/DthqTvd3ezvKbQ
         tsS6Ded+Gk6apTB66dyAEk63xgpvAkV9TO9YW+XloK+17wRiUAApInINbfT8B9P77I4C
         QY+FPmj/GJCcs+U0xx+WvA7zSbiM7q2pAh9uocX+deG8Cf7JAnUQ/8ofTP8lwt5mdekp
         M0hw==
X-Forwarded-Encrypted: i=1; AJvYcCWu0l/VZqOB/Q0cIWkaktkQJ8Y7lwJZ/da6JB8T2DTbqJcomZXtVBsmM2esGhnYiV5ujjJBQkaOeg1jFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpOuVH2ovmB6RoUpMl4EzGRuK4WV9i51MXg+bCcZP867VdvPrV
	GyGvgGhjYTpVhujPDcoE4uKzq78KeDvDYAGrTIrdJQ1VG5q5ZAONcpNH0Js6m0F9
X-Gm-Gg: ATEYQzwihLmG819ApgG7ICu6AVioFzfRfgxUFb+hBsSjnisSfNwP8enJK8uU9LC+R+M
	ByjzJiQB/eH9yHZl3hmQQ4yMflB0RcIYUXUw0qk+LORf3EtHb4N79b1FY82ZH488NqCMtsQ9Ofx
	eiPblhevsfYyM3KdjlcRMid2sBXTOuvISbOqxWEI0MqdjNnL8I12JzS4qyKqDnpLdfhRrMHn7PS
	5G6eB86rTYqENvR2trIOQeEolTBEgRVrJl6zuP8ZY19uIUBzl3iy4bsxl1V1YjHIq1YLTPKCRvL
	UKV4m0Kd0grzi4S3+QxSCbsny0Uh1ihkRx2OEs64P1OxnsxU9fjSr8MyLUYDvHflsRB0GaVPtEE
	uc0prvR7Kwc38weEiG5mzLf2KZdU+qUF7gmltPueUUU61bhhJ+H/GN/Al3CbjouVYsI8tOyxvxc
	eWq5jDnrTWx0kDtu9AavjuxbpXwxquE6UjDQZZvFOSfTqUk/Itksh8ALWSG92ljj1zZ4M=
X-Received: by 2002:a2e:a109:0:b0:389:f86a:f51 with SMTP id 38308e7fff4ca-389ff74bb22mr60743061fa.17.1772398418405;
        Sun, 01 Mar 2026 12:53:38 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2ffe119sm26797711fa.21.2026.03.01.12.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 12:53:38 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
X-Google-Original-From: Oskar Ray-Frayssinet <oskar.rf@live.se>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <oskar.rf@live.se>
Subject: [PATCH] staging: atomisp: fix block comment style in atomisp_cmd.c
Date: Sun,  1 Mar 2026 21:53:36 +0100
Message-ID: <20260301205337.3157-1-oskar.rf@live.se>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-54021-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,live.se];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rayfraytech@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 21F561D18CF
X-Rspamd-Action: no action

Fix block comments to use the proper kernel coding style by adding
* on subsequent lines and moving trailing */ to a separate line.

Signed-off-by: Oskar Ray-Frayssinet <oskar.rf@live.se>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 40 ++++++++++++-------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..5bc1541b1e40 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1381,7 +1381,8 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 		return;
 
 	/* We must free all buffers because they no longer match
-	   the grid size. */
+	 * the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
@@ -1391,10 +1392,11 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	}
 
 	if (atomisp_alloc_3a_output_buf(asd)) {
-		/* Failure for 3A buffers does not influence DIS buffers */
+		/* Failure for 3A buffers does not influence DIS buffers. */
 		if (asd->params.s3a_output_bytes != 0) {
 			/* For SOC sensor happens s3a_output_bytes == 0,
-			 * using if condition to exclude false error log */
+			 * using if condition to exclude false error log.
+			 */
 			dev_err(isp->dev, "Failed to allocate memory for 3A statistics\n");
 		}
 		goto err;
@@ -1687,8 +1689,9 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 
 	if (atomisp_compare_grid(asd, &config->grid_info) != 0) {
 		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		 * grid info, we tell the caller to reset the grid size and
+		 * try again.
+		 */
 		return -EAGAIN;
 	}
 
@@ -2463,8 +2466,9 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		    memcmp(&coefs->grid, cur, sizeof(coefs->grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
 			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			 * grid info, we tell the caller to reset the grid size and
+			 * try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -2519,8 +2523,9 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
 			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			 * grid info, we tell the caller to reset the grid size and
+			 * try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -3027,7 +3032,8 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 
 		/* We always return the resolution and stride even if there is
 		 * no valid metadata. This allows the caller to get the
-		 * information needed to allocate user-space buffers. */
+		 * information needed to allocate user-space buffers.
+		 */
 		config->metadata_config.metadata_height = asd->
 			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
 			metadata_info.resolution.height;
@@ -3278,7 +3284,8 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
 	case IA_CSS_FRAME_FORMAT_RGBA888:
 		return bytesperline / 4;
 	/* The following cases could be removed, but we leave them
-	   in to document the formats that are included. */
+	 * in to document the formats that are included.
+	 */
 	case IA_CSS_FRAME_FORMAT_NV11:
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV16:
@@ -3315,8 +3322,9 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 			   arg->fmt.bytesperline, sh_format);
 
 	/* Note: the padded width on an ia_css_frame is in elements, not in
-	   bytes. The RAW frame we use here should always be a 16bit RAW
-	   frame. This is why we bytesperline/2 is equal to the padded with */
+	 * bytes. The RAW frame we use here should always be a 16bit RAW
+	 * frame. This is why we bytesperline/2 is equal to the padded width.
+	 */
 	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
 				       sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
@@ -3926,7 +3934,8 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 	}
 
 	/* Compatibility for sensors which provide no media bus code
-	 * in s_mbus_framefmt() nor support pad formats. */
+	 * in s_mbus_framefmt() nor support pad formats.
+	 */
 	if (mipi_info && mipi_info->input_format != -1) {
 		bayer_order = mipi_info->raw_bayer_order;
 
@@ -4385,7 +4394,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 			V4L2_SEL_TGT_CROP);
 
 	/* Try to enable YUV downscaling if ISP input is 10 % (either
-	 * width or height) bigger than the desired result. */
+	 * width or height) bigger than the desired result.
+	 */
 	if (!IS_MOFD ||
 	    isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
 	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||
-- 
2.43.0


