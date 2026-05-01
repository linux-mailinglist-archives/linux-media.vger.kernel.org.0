Return-Path: <linux-media+bounces-60157-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOVQCyXf9Gn8FQIAu9opvQ
	(envelope-from <linux-media+bounces-60157-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 19:13:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B264AE68F
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 19:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42713304BC8A
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 17:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79393406261;
	Fri,  1 May 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJHiCfSX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602A73D8910
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 17:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655317; cv=none; b=Hlmx6Zpj0gt7naOp+c9h8Kj4XUhIoku6q7UvPpt1bkQT++JU+yOd8/bzkWtBd7I5EFzptdekHDYcpttCcIWXOIxAElKJW8TKC5uBYYsCsgd9a+kKeVDQdl/9731rGI956SQl2hZcL0mmjE/CASl+8hXdqj5gDaHqhzelHf42DDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655317; c=relaxed/simple;
	bh=5YlxqVUZMmAu7OzHvewNrtOrDhqyNa39uWLh5eD7InY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CB5Hzb0LxgUUZ5gk+A9fsB8uUE8lQu2WgiSTeuVMt013a2vHeN2sdLlopxMIExbwF35jzoJWVIWqGpHZWF0PviZx5/khWIkwikl7aWXvyidx9FSX9ck/X8KGBjyTl08af1TORPJ1kqkEIGx9dv6dF7jaSArOktekJaqGvvFnazk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJHiCfSX; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82748257f5fso2393955b3a.1
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 10:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777655315; x=1778260115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r3jBh2i5QcfKLncxdlwHNU4owYDErQsEOr4uUJaqJO4=;
        b=nJHiCfSX9Bel0aEnZu8dmMiiqSt3wwpyxndDM3NQzJ7h/8DxORcU9dAe5uqRSARDKB
         jPMXzAC0rM+lki9r7QCwGAQdAQGDdHwCMz8ITOTWv9smNHL/OGj+6SRsqHhSpZ1Kc8jg
         4vAkrR/YB2d7S76wQmX9krueggMZqR1IJF1NvYs2AVRPtBj/tXRHMp3PcAUxBVbrWE+K
         x+UI9j/w3PKSOtyvB9ZF+vOkiUC6e1RPRwGWNEsXRkksfZVnWrFyG3pZyxCRXQRWCaN/
         ykF2VPcJJXojX6SRNGLkiUOH07+7OMVpiJN7VPib/n0vjeZyEcmQKcaK4azW+bOjkA8H
         xCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655315; x=1778260115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3jBh2i5QcfKLncxdlwHNU4owYDErQsEOr4uUJaqJO4=;
        b=mEXU86WoDX/T/68BvAN9KBqajTBDXoPqmNudt0lU3MoyVJrn2IrudDKIim2UVVmyxR
         odm1GQYkSQ78H+TWOwA180CcPJ57s5ljR6AD8EoFtZqigOfSbh3JgK9y/bKGusPmqOWz
         O6rDDEye0m+yqsmlnMA6H95jbPzXRloa3uVSiYgIIhtyvkxzZoNTa2RefCKudtusoWR6
         /bXZ0ZY22DHOFWIls6qB8/TPRJ5HZVsng54kKj53WrNxhgDunfR+ljzXQen/hqYEgWbw
         bWqJvZtOehXL+6L6buWQBgAS+WrXQWO9+N5DJ5wxqT0BUcLON7Q7J8SCo4c1DNm8bJCH
         lWEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+memMyKDYThz6uD1Zby/HHa/XgZ9qr07VDQhf7i3KE3Bmf8dbFwIu27jG6rSX1yUniezEx1tobtwCQBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuNDrZhGcPaygZ+1CpT4o6HhMCG7wmchge8fdb0eLpXgxL/fo2
	VezuguosiZ/8WOu+tbbj18rIc3NY/3CPqJd485WHaECE78V9nRpfwUnM
X-Gm-Gg: AeBDieuuTAI2FlYcMlNYVGzzLW6ZNQBTCkKN33y3OoWi8qp7lQdvvBgs+DSX4mvT9my
	GpiCGVfthBTXzrfoqy7lx7hlwImrY4Wzk1p6DbkUT87YXxKP7UFVgzR/LsFfyL2II1ZWOhGpsUP
	TrvSKVt148/J9E5SXToOhwIbDRVNtzfKQl1xJAJS5a1MzcAzeeyiuf6T4sEpmvrPvZHR0SO5/or
	381fgekfZo2zj5PgGdaBDX2Zf8Rp9i3iyh2qXsD5y3xBWk8s3HfUXNfFXckyS7HgPTAGJ4DVOJF
	TbStbxPl7Qo/0BLYGo+zFsfJeFyIuBy4M6NHgxYxlNUlCg6QgnsLAZzX15fIieT04J6r2pPBmeQ
	NKGTWDiJY9cpL1UZSbp427D37XYOGGIa+pqab6kQBbqdR377mci70uP6p7N7OQo6i1jrVj6nLUh
	oDICkuzwp4ai5mkXg/VCN3Mp5/BDw=
X-Received: by 2002:a05:6a00:b488:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-834fff38ebfmr7018376b3a.13.1777655314499;
        Fri, 01 May 2026 10:08:34 -0700 (PDT)
Received: from localhost ([2409:40d1:ac:8595:d46b:293a:655a:c877])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b87869sm3368321b3a.61.2026.05.01.10.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:08:34 -0700 (PDT)
From: Ansh Bagga <ansh.bagga.linux@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ansh Bagga <ansh.bagga.linux@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix block comment formatting
Date: Fri,  1 May 2026 22:38:02 +0530
Message-ID: <20260501170802.554963-1-ansh.bagga.linux@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D4B264AE68F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-60157-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[anshbaggalinux@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Fix checkpatch warnings regarding block comment alignment.
Block comments should use a trailing '*/' on a separate line to
adhere to the kernel coding style guidelines.

Signed-off-by: Ansh Bagga <ansh.bagga.linux@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 41 ++++++++++++-------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..37ccc95076a7 100644
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
@@ -1394,7 +1396,8 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 		/* Failure for 3A buffers does not influence DIS buffers */
 		if (asd->params.s3a_output_bytes != 0) {
 			/* For SOC sensor happens s3a_output_bytes == 0,
-			 * using if condition to exclude false error log */
+			 * using if condition to exclude false error log
+			 */
 			dev_err(isp->dev, "Failed to allocate memory for 3A statistics\n");
 		}
 		goto err;
@@ -1687,8 +1690,9 @@ int atomisp_3a_stat(struct atomisp_sub_device *asd, int flag,
 
 	if (atomisp_compare_grid(asd, &config->grid_info) != 0) {
 		/* If the grid info in the argument differs from the current
-		   grid info, we tell the caller to reset the grid size and
-		   try again. */
+		 * grid info, we tell the caller to reset the grid size and
+		 * try again
+		 */
 		return -EAGAIN;
 	}
 
@@ -2463,8 +2467,9 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
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
 
@@ -2519,8 +2524,9 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
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
 
@@ -3027,7 +3033,8 @@ int atomisp_param(struct atomisp_sub_device *asd, int flag,
 
 		/* We always return the resolution and stride even if there is
 		 * no valid metadata. This allows the caller to get the
-		 * information needed to allocate user-space buffers. */
+		 * information needed to allocate user-space buffers.
+		 */
 		config->metadata_config.metadata_height = asd->
 			stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_info.
 			metadata_info.resolution.height;
@@ -3278,7 +3285,8 @@ atomisp_bytesperline_to_padded_width(unsigned int bytesperline,
 	case IA_CSS_FRAME_FORMAT_RGBA888:
 		return bytesperline / 4;
 	/* The following cases could be removed, but we leave them
-	   in to document the formats that are included. */
+	 * in to document the formats that are included.
+	 */
 	case IA_CSS_FRAME_FORMAT_NV11:
 	case IA_CSS_FRAME_FORMAT_NV12:
 	case IA_CSS_FRAME_FORMAT_NV16:
@@ -3315,8 +3323,9 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 			   arg->fmt.bytesperline, sh_format);
 
 	/* Note: the padded width on an ia_css_frame is in elements, not in
-	   bytes. The RAW frame we use here should always be a 16bit RAW
-	   frame. This is why we bytesperline/2 is equal to the padded with */
+	 * bytes. The RAW frame we use here should always be a 16bit RAW
+	 * frame. This is why we bytesperline/2 is equal to the padded with
+	 */
 	if (ia_css_frame_allocate(&res, arg->fmt.width, arg->fmt.height,
 				       sh_format, padded_width, 0)) {
 		ret = -ENOMEM;
@@ -3926,7 +3935,8 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 	}
 
 	/* Compatibility for sensors which provide no media bus code
-	 * in s_mbus_framefmt() nor support pad formats. */
+	 * in s_mbus_framefmt() nor support pad formats.
+	 */
 	if (mipi_info && mipi_info->input_format != -1) {
 		bayer_order = mipi_info->raw_bayer_order;
 
@@ -4385,7 +4395,8 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 			V4L2_SEL_TGT_CROP);
 
 	/* Try to enable YUV downscaling if ISP input is 10 % (either
-	 * width or height) bigger than the desired result. */
+	 * width or height) bigger than the desired result.
+	 */
 	if (!IS_MOFD ||
 	    isp_sink_crop.width * 9 / 10 < f->fmt.pix.width ||
 	    isp_sink_crop.height * 9 / 10 < f->fmt.pix.height ||
-- 
2.54.0


