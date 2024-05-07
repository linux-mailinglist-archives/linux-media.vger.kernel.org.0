Return-Path: <linux-media+bounces-10959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 469A58BDAA7
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 07:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1378285315
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 05:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74506BB5E;
	Tue,  7 May 2024 05:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQTFJMPy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59613D0BD;
	Tue,  7 May 2024 05:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715059523; cv=none; b=sUSmf71HGxB1y78GtXOO0uR2utpxR6tLnovHzYQKLRFSA9TDHzivr9WzXqH37hRj3HvjN1bYsWX2vLzPfg3tP6JMlNjrgJv6b/iK9ZfAKbUFCnyx4Zdw3DzfvqpnsJs/+WA6/sbA+Fl77MgEUDBQGvZKvgm0gcfXKTHpIaKqX8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715059523; c=relaxed/simple;
	bh=Lz9upKnBUWSJCR3radsm+C5q/ZD++lGHXzZbSNDY3Jc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=thLnSrIBIZ6B798XXk0rnSQQxlPw66poijIQ0ayEG4TMVUdydD5aREBtZM7688zl+qD32m0EsrakNCboL7luTc5ZxYa6AzFTAI8EIQBydLTL3RXTpT0EXG4zMumg8TAdCqkgtfSz2xccR/GH0TEpVJ9VeAOojURHHOPw4c0KbYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQTFJMPy; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f45f1179c3so1868136b3a.3;
        Mon, 06 May 2024 22:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715059521; x=1715664321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VotM072PU5f1ynFHubhbSZEV9Z58k4OS4yjrvCyi/KU=;
        b=GQTFJMPyJvWhVAMxZ3EoPKFdbuGzAlfArcsSDVHj3fi+FWsGf8X4EtdcAr/71WFQcT
         vpoGpbJGTZUl4HjBxJC0LsAfgu1AIKjOWzVuKRmezqnmhSV/l9TdS6026t+VGyWzyCXS
         iBscroP/vSuaMfBeEdpS9ZOoDKeWexl0LQpodlEUNUAKVtQy/4wfDfbYp/W6gmKnPfYj
         nyxt9/ZDQUPRKMsch/a9jNqE/sbMHMS03ufQEFKYrF4fyUrmLIJj7MYbq8CTU1HLV6Fi
         F1YQoN0UhubVrsEaOO+ryTd3zqpPs2JDVCZJQUT+FgBDc7JAy1WyoRRoIlabX5fqUzym
         FDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715059521; x=1715664321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VotM072PU5f1ynFHubhbSZEV9Z58k4OS4yjrvCyi/KU=;
        b=Kd31m4z5NJ0ak3b+h6bLFzLaHDjEg4YcJGqEI4HQXeWP6gHUBCL3Yt9Ij7sx5/refc
         StERAX4tN+3R2BEnUzR3RA3pVRftHDEGpEI1oQCyQofrt5I5Bqu4q9jnG7qeCEsUzAaJ
         z7oBCtLAyEdvzSCJ992Ua6Lhhcd5mDepbVoyptCP+zo3+L7cg9Gji3KtdIt1Y7PY7laO
         5ecOIk4PsnN+s2rigE1IqqYW8uJDSlex/0r5xePFm3RwgueqshDcgAf0BvkjZHU9riro
         ijuTlDgehMDLQrM/bTikg+5x3AcVhUMe3IFWF7vvn49lETMUEq3/7bn1887z50D897jc
         jigw==
X-Forwarded-Encrypted: i=1; AJvYcCVk8T5rxvW0OcZiGM6P+U30v0KIkizu/JxZCSWRWEpYWiITsnPEGRvdbEEEXraaPelrTyMlnBzjaeMCeh2xuKuqTfSWkvhgthb3ut7UqWVgrrI9cVruAt0jFX/sb7JBwR5NqeWkwTVzN+8=
X-Gm-Message-State: AOJu0YymR4YJjWDKw4iG5iyjZcQ30gI0g2jRAKWlxkRlFYiRHEQyKSgJ
	dmNfdRCn1CnyiEaDIFne0pO0h1C5zU70JzT+OYDe2MBTbHPMfogD
X-Google-Smtp-Source: AGHT+IEXAeBUuXaJ5L39BPGwF3v+uLqY+hCMwjgssXQL5Lk+kDguAle74Rzr9m631YM+fytEf0u6EA==
X-Received: by 2002:a05:6a00:3910:b0:6f3:86ac:5eae with SMTP id fh16-20020a056a00391000b006f386ac5eaemr14548559pfb.28.1715059520934;
        Mon, 06 May 2024 22:25:20 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id it21-20020a056a00459500b006f4401df6c9sm8276063pfb.113.2024.05.06.22.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 22:25:20 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hpa@redhat.com,
	hverkuil-cisco@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: atomisp: Fix spelling mistakes in sh_css_sp.c
Date: Tue,  7 May 2024 11:10:12 +0545
Message-Id: <20240507052512.7296-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Codespell reported misspelled fields,suppress,separately and offset in
file sh_css_sp.c. This patch fixes the misspellings.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index cd7f5a3fecaa..9da89290c954 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1038,7 +1038,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 	if (binary->info->sp.pipeline.mode == IA_CSS_BINARY_MODE_PREVIEW &&
 	    (binary->vf_downscale_log2 > 0)) {
 		/* TODO: Remove this after preview output decimation is fixed
-		 * by configuring out&vf info fiels properly */
+		 * by configuring out&vf info fields properly */
 		sh_css_sp_stage.frames.out[0].info.padded_width
 		<<= binary->vf_downscale_log2;
 		sh_css_sp_stage.frames.out[0].info.res.width
@@ -1333,7 +1333,7 @@ bool sh_css_write_host2sp_command(enum host2sp_commands host2sp_command)
 			      host2sp_command)
 			      / sizeof(int);
 	enum host2sp_commands last_cmd = host2sp_cmd_error;
-	(void)HIVE_ADDR_host_sp_com; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_host_sp_com; /* Suppress warnings in CRUN */
 
 	/* Previous command must be handled by SP (by design) */
 	last_cmd = load_sp_array_uint(host_sp_com, offset);
@@ -1351,7 +1351,7 @@ sh_css_read_host2sp_command(void)
 	unsigned int HIVE_ADDR_host_sp_com = sh_css_sp_fw.info.sp.host_sp_com;
 	unsigned int offset = (unsigned int)offsetof(struct host_sp_communication, host2sp_command)
 	/ sizeof(int);
-	(void)HIVE_ADDR_host_sp_com; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_host_sp_com; /* Suppress warnings in CRUN */
 	return (enum host2sp_commands)load_sp_array_uint(host_sp_com, offset);
 }
 
@@ -1359,7 +1359,7 @@ sh_css_read_host2sp_command(void)
  * Frame data is no longer part of the sp_stage structure but part of a
  * separate structure. The aim is to make the sp_data struct static
  * (it defines a pipeline) and that the dynamic (per frame) data is stored
- * separetly.
+ * separately.
  *
  * This function must be called first every where were you start constructing
  * a new pipeline by defining one or more stages with use of variable
@@ -1372,7 +1372,7 @@ sh_css_init_host2sp_frame_data(void)
 	/* Clean table */
 	unsigned int HIVE_ADDR_host_sp_com = sh_css_sp_fw.info.sp.host_sp_com;
 
-	(void)HIVE_ADDR_host_sp_com; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_host_sp_com; /* Suppress warnings in CRUN */
 	/*
 	 * rvanimme: don't clean it to save static frame info line ref_in
 	 * ref_out, and tnr_frames. Once this static data is in a
@@ -1551,7 +1551,7 @@ ia_css_pipe_set_irq_mask(struct ia_css_pipe *pipe,
 	 * - different assert for Linux and Windows
 	 */
 
-	(void)HIVE_ADDR_host_sp_com; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_host_sp_com; /* Suppress warnings in CRUN */
 
 	IA_CSS_LOG("or_mask=%x, and_mask=%x", or_mask, and_mask);
 	event_irq_mask.or_mask  = (uint16_t)or_mask;
@@ -1580,7 +1580,7 @@ ia_css_event_get_irq_mask(const struct ia_css_pipe *pipe,
 	struct sh_css_event_irq_mask event_irq_mask;
 	unsigned int pipe_num;
 
-	(void)HIVE_ADDR_host_sp_com; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_host_sp_com; /* Suppress warnings in CRUN */
 
 	IA_CSS_ENTER_LEAVE("");
 
@@ -1630,7 +1630,7 @@ sh_css_sp_start_isp(void)
 	if (sp_running)
 		return;
 
-	(void)HIVE_ADDR_sp_sw_state; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_sp_sw_state; /* Suppress warnings in CRUN */
 
 	/* no longer here, sp started immediately */
 	/*ia_css_debug_pipe_graph_dump_epilogue();*/
@@ -1669,7 +1669,7 @@ ia_css_isp_has_started(void)
 {
 	const struct ia_css_fw_info *fw = &sh_css_sp_fw;
 	unsigned int HIVE_ADDR_ia_css_ispctrl_sp_isp_started = fw->info.sp.isp_started;
-	(void)HIVE_ADDR_ia_css_ispctrl_sp_isp_started; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_ia_css_ispctrl_sp_isp_started; /* Suppress warnings in CRUN */
 
 	return (bool)load_sp_uint(ia_css_ispctrl_sp_isp_started);
 }
@@ -1724,7 +1724,7 @@ sh_css_sp_set_dma_sw_reg(int dma_id,
 	sw_reg =
 	    sh_css_sp_group.debug.dma_sw_reg;
 
-	/* get the offest of the target bit */
+	/* get the offset of the target bit */
 	bit_offset = (8 * request_type) + channel_id;
 
 	/* clear the value of the target bit */
-- 
2.34.1


