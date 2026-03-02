Return-Path: <linux-media+bounces-54087-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMryJ82FpWkeDAYAu9opvQ
	(envelope-from <linux-media+bounces-54087-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 13:42:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BC21D8E0F
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 13:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E89EB308E860
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 12:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D0436EAAB;
	Mon,  2 Mar 2026 12:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATw7NiUt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF5136D9E5
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454967; cv=none; b=cQBdQLnDCjVzuO86PF3CsF5j1RN2cek1x4xw7Xot75DtgCAbqyjmUmqrN+TRRKfIwy+H5W7MWuk6Gc29cKvcRbY1PWCQfT8neuvQbmBTJ1u4cFwr3+WEY+uCnLHvughBafaTczrMQ9A4gJ0flnsGrnZwy3TBjxXncBtwxcsbYkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454967; c=relaxed/simple;
	bh=WjN5TzoQv+xWU7Skq9M9Zm1RgZ2z6sPgG98q3ldmFL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SuEK1DItUruJz5xeE2GAdP/js0Yi5HNU2RGAVq0n5hw2OWBSzHhWSmmZf8p9zLtac7cMG8QHMCFi7PCBaAkfjYAhu14PuLXFROyQMIBG4JsfVHFJz2J/dPGVG2UoneVz1s3h/OtD2rSS/EwLHXVDRUh4h5maAuPLYKu2KMbLVA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATw7NiUt; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-824ac5d28f9so4466346b3a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 04:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772454964; x=1773059764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iJO6abKpVzoD+V+e3XRskwGj2DBwgjX9SQo0wFCYDds=;
        b=ATw7NiUtkRBTpdLVTYLp1HmvGx18YubaOJvKoINF7H4hlGVREXH30bjYlyphI+jX3k
         AWr0qH8pZ4rvhLTzcpRDntmV3Zyxfk23O+ldA3eLDEdzOzpE3EjkdqouMOFCWxGEJewf
         WLVpMlAIzw6NbFpYcyRNm3gxe42dxAFWJCTnk0iDyNpmiN2Peqv8HB53dxFc664yqJmZ
         ImpBzryyIucMWTypMWeaUWGkfTxLcoZHIQIBJ5V6fkctfg2v7DqXtSXD8SGEsQhLSA+l
         KQmb26knTG3SIxtF5qsisC2eRDjWj97nCDMJU0KXVSmC1EK5sm7xIWd4jcG46IdaSObV
         gerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772454964; x=1773059764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJO6abKpVzoD+V+e3XRskwGj2DBwgjX9SQo0wFCYDds=;
        b=kZAKQr+WAOcGfhMhBDMI6UL1wi3XAbH+JgmneauVx0obtTjBpeIQQg2v1E6xq1Z+b0
         hal2J+4Hq+IAQVQeVFMPevouWPp1PIguzVy5qsv4jRHTKM/vp3SURizTs/IyLG4lObhi
         Q5RrQvDeyAF5O+Iy1/gS5QGgASUjmoNEJMQmbbCzrbmWeUuI0RcBLDVqbOMPPHvPLC3A
         1MDCg/1MuysUl+a7BufLyasp8BCwKb3FT8/YKqAombkmSzusEIiMz3ChXp5aTltjWIse
         spy7eDMFNRdcLY3FD2ReQPGaaUZwlR1ms8e2A1OUHNwLv7urUtXImOOmrpVH1In2nVIs
         +ocw==
X-Forwarded-Encrypted: i=1; AJvYcCXEXdN0KCpjQhZ6SQfbrstVhxIus0TUHVGeT/GFnCw+m4sMJSiRCUX92OnQxoFfoWFNww9lv3sn4yFHAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywioau2wxsk/myYxIEhRXU/cR6wA8nRHNtsZBuISERDsaQus+do
	t+RvKH3TMrMHuJixvrMONf+h7k2BDdpTUBofLtJcPSNKEO9h1LSFpOBZ
X-Gm-Gg: ATEYQzxlveF5y3ZfFlmC2zR4kOGXshVWyyNZqHmbCqUmmJphyEWwRUuAuuMwhe6ZI5u
	7czKk5Vq/qtnyDHrdpFPTJmXTV+0TH481bCqTjqPkjGMvyNp2TL6Vl6lbHFgeHZ1h5l5sgWfhJT
	ujMc5vo4tl9nLtcG0c14KiMAPE2a5OZyzOBcO3K/r3cxe2PbQkkP8dg66iaKyo+GRKqoLlakQc1
	z/uWuDv5UKFjzI9MQnWN4U6ONTI1Z3DCvC+uK6UlYeL3kS5k6ktF9K/c6IGzSgxEo5U6ry05m80
	JJOUDKYnA932S3Y4VaIFyd1PcCJYAsj2h0eYb8Pe0c0+Tgg/yULiNX2ATTuV1lfcPScJFlzFEcu
	cxDhQVMvv6pUswZRN7zqk1kACHoBsfE9kTUi0ecza4K3NAQYX+ipCX2yQA6cJmHYoKwrNpjx4GK
	DTCNTgGMnwHEufhzQKutjRYzYw7ZYr8vH2BcJYw9I=
X-Received: by 2002:a05:6a00:94c1:b0:824:93df:6d86 with SMTP id d2e1a72fcca58-8274d9f5b74mr9260840b3a.50.1772454964264;
        Mon, 02 Mar 2026 04:36:04 -0800 (PST)
Received: from deadibone.. ([118.141.233.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a0571acsm13288323b3a.55.2026.03.02.04.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:36:03 -0800 (PST)
From: Ethan Lam <ethanlxkernel@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Lam <ethanlxkernel@gmail.com>
Subject: [PATCH v4] staging: media: atomisp: fix block comment style in atomisp_cmd.c
Date: Mon,  2 Mar 2026 20:35:47 +0800
Message-ID: <20260302123548.24663-1-ethanlxkernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-54087-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethanlxkernel@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 16BC21D8E0F
X-Rspamd-Action: no action

Fix block comment style warnings reported by checkpatch.pl in atomisp_cmd.c.

Signed-off-by: Ethan Lam <ethanlxkernel@gmail.com>
---
Changes in v4:
 - Rephrased commit message to fit the documentation's guidelines.
 - Updated subject line to clarify the patch only applies to atomisp_cmd.c.

Changes in v3:
 - Preserved original indentation within comments to avoid breaking
   lists and code examples.
 - Restored dev_dbg() lines that were accidentally removed in v2.

Changes in v2:
 - Added period to the end of the commit message.
 - Fixed missed block comment style warnings in atomisp_cmd.c.

Changes in v1:
 - Initial patch to fix block comment style warnings in atomisp_cmd.c.

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 60 ++++++++++++-------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..c67fa4cc3f06 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1380,8 +1380,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_css_get_grid_info(asd, pipe_id))
 		return;
 
-	/* We must free all buffers because they no longer match
-	   the grid size. */
+	/*
+	 * We must free all buffers because they no longer match
+	 * the grid size.
+	 */
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
@@ -1393,8 +1395,10 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_alloc_3a_output_buf(asd)) {
 		/* Failure for 3A buffers does not influence DIS buffers */
 		if (asd->params.s3a_output_bytes != 0) {
-			/* For SOC sensor happens s3a_output_bytes == 0,
-			 * using if condition to exclude false error log */
+			/*
+			 * For SOC sensor happens s3a_output_bytes == 0,
+			 * using if condition to exclude false error log
+			 */
 			dev_err(isp->dev, "Failed to allocate memory for 3A statistics\n");
 		}
 		goto err;
@@ -1686,9 +1690,11 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 		return -EINVAL;
 
 	if (atomisp_compare_grid(asd, &config->grid_info) != 0) {
-		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		/*
+		 * If the grid info in the argument differs from the current
+		 * grid info, we tell the caller to reset the grid size and
+		 * try again.
+		 */
 		return -EAGAIN;
 	}
 
@@ -2462,9 +2468,11 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(coefs->grid) ||
 		    memcmp(&coefs->grid, cur, sizeof(coefs->grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+			/*
+			 * If the grid info in the argument differs from the current
+			 * grid info, we tell the caller to reset the grid size and
+			 * try again.
+			 */
 			return -EAGAIN;
 		}
 
@@ -3028,9 +3036,11 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 
 		atomisp_curr_user_grid_info(asd, &config->info);
 
-		/* We always return the resolution and stride even if there is
+		/*
+		 * We always return the resolution and stride even if there is
 		 * no valid metadata. This allows the caller to get the
-		 * information needed to allocate user-space buffers. */
+		 * information needed to allocate user-space buffers.
+		 */
 		config->metadata_config.metadata_height = asd->
 			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
 			metadata_info.resolution.height;
@@ -3280,8 +3290,10 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
 		return bytesperline / 2;
 	case IA_CSS_FRAME_FORMAT_RGBA888:
 		return bytesperline / 4;
-	/* The following cases could be removed, but we leave them
-	   in to document the formats that are included. */
+	/*
+	 * The following cases could be removed, but we leave them
+	 * in to document the formats that are included.
+	 */
 	case IA_CSS_FRAME_FORMAT_NV11:
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV16:
@@ -3317,9 +3329,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 	padded_width = atomisp_bytesperline_to_padded_width(
 			   arg->fmt.bytesperline, sh_format);
 
-	/* Note: the padded width on an ia_css_frame is in elements, not in
-	   bytes. The RAW frame we use here should always be a 16bit RAW
-	   frame. This is why we bytesperline/2 is equal to the padded with */
+	/*
+	 * Note: the padded width on an ia_css_frame is in elements, not in
+	 * bytes. The RAW frame we use here should always be a 16bit RAW
+	 * frame. This is why we bytesperline/2 is equal to the padded with
+	 */
 	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
 				       sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
@@ -3928,8 +3942,10 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 		    asd->stream_env[stream_id].isys_info[1].height);
 	}
 
-	/* Compatibility for sensors which provide no media bus code
-	 * in s_mbus_framefmt() nor support pad formats. */
+	/*
+	 * Compatibility for sensors which provide no media bus code
+	 * in s_mbus_framefmt() nor support pad formats.
+	 */
 	if (mipi_info && mipi_info->input_format != -1) {
 		bayer_order = mipi_info->raw_bayer_order;
 
@@ -4387,8 +4403,10 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 			ATOMISP_SUBDEV_PAD_SINK,
 			V4L2_SEL_TGT_CROP);
 
-	/* Try to enable YUV downscaling if ISP input is 10 % (either
-	 * width or height) bigger than the desired result. */
+	/*
+	 * Try to enable YUV downscaling if ISP input is 10 % (either
+	 * width or height) bigger than the desired result.
+	 */
 	if (!IS_MOFD ||
 	    isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
 	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||
-- 
2.43.0


