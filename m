Return-Path: <linux-media+bounces-10823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BCD8BC730
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 07:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DB701F21005
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 05:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC63F4879B;
	Mon,  6 May 2024 05:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITNIEB/p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF2547F6B;
	Mon,  6 May 2024 05:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714975111; cv=none; b=cnLO1l0NMcEusKrArOb7MFCO3tLRFdSlR6b7cPs6ARqgMXBuNiPNEtPKZFbFPsnP0fkmdRxCwwsVfP9rzxhQf9FQpoW8NhAziha9CfIw2UJlL0YMrql2V8hLop1RYxDs49/L0+i4wl+cVT0b1UF9RWqGzBvOsMkGCWIq3DztuzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714975111; c=relaxed/simple;
	bh=Qg+oNkKwnd2IUYGxP3VVcbqQZ/khrZhVb1GbWFDn6l8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LAQg3bq74qb/MRxHfjBTNwN5ZDDv5RzVaHAXzb65TWZhGViNgUk7mcNBD4cXPVTI4RQ8kNxZ0zpFCRGFJgDF6czzlV4TvUb4RWUKHyJUAaqF/yPu4BzdEAQoq3bKPXskroska7iwb7p94VFREr3uwNa3zeyxvaFpTy97cfsPk9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITNIEB/p; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2b4952a1b51so1157339a91.0;
        Sun, 05 May 2024 22:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714975109; x=1715579909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUzrEYcxxtjau4TcE/YkY3seNanf+E2axNOscE+yJfw=;
        b=ITNIEB/pxy/2qU/qU5PvHsGJvpv2zUzv3E3drd/0Ux2LHmwzezqFPgDlID/c5DhmPL
         69Eu8JUSK8F+kEz3RRqlQyKGvpFAd8W72key89wy8VxTp6vBzjCVn2x/NtFKuPOzseKL
         zDXRa5E7GLDTuhBDdi7B7SQiAgFekRjPSnzNWKYfCXuZPu6fqoxYKj1APBBm3yPWFpaS
         rw9PIolcD9t//H0U/6j85pDcgouka3rjXFYm00sS1IASLirdaqlLqa5QPBMBE3L4+1hL
         lrUA7EHE9PTTKE6Vgf0A6OshczB0IN5ZgW03z3ErxyXQaaeh//UjwXmZlL/gvtVVRPeY
         39+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714975109; x=1715579909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUzrEYcxxtjau4TcE/YkY3seNanf+E2axNOscE+yJfw=;
        b=mnjf4HarIRTgvA65IKiCYlRkVMjfZY4Cgw2Wf429qzM7bzNat58PYaWwJyeFV/Nzb/
         Nk+dOrB5ceoydvvV7Xw9V8YsuiVh7vf+jrYph/+UvHAdNvhTFeP4RcIGgqykEMduQBsz
         vST+elmtpmddaiXF2lQDhV38uTcy/KEajZ0UxWcHXtkuTduDYYdhOI6RrJqfmJdmd+P1
         j4DfKDMvhpvUCdXAky9lj5t94yykUJJjneXw6GREE6RmxO2oSvVztbDMSGAWJvfaO3O+
         Vwo77B9elsN3MKr81OU6/OGxGTVnMyWp2LIp6zh++8Np2nqcvLWJEBGRaHLhBUd5NBAM
         tPkg==
X-Forwarded-Encrypted: i=1; AJvYcCWeHnCgZed9MNcm1Zq/E1DYS9GFpGcoQciyv2R9MofYvmrOghEtpsilX8zGBMqk3WhsmOP/APXNLW6kTV1fJJNRF8sHwNlY6uXZl91idj2GlWnVteJ+51iphnRPo6Y5+DbTdow9tUFGczU=
X-Gm-Message-State: AOJu0YzzrbxiET47pKnp8tJETE8g/A7izFnITGYPJHewyPsdylw+pCpr
	Y+1AWGzrDw6GNQ5vn4r6FnD0sUetUCQJ0d0CCBXnmDG5a0TMQsg0
X-Google-Smtp-Source: AGHT+IEi69z7mWn7W9ALtpdFofxAgk3jSSRm1Rp19U+XHsUnpB8tkT8NTbFw40g4S7bzrlYBadcC/Q==
X-Received: by 2002:a17:90b:f93:b0:2b2:c84e:9124 with SMTP id ft19-20020a17090b0f9300b002b2c84e9124mr6100790pjb.45.1714975109208;
        Sun, 05 May 2024 22:58:29 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id sx7-20020a17090b2cc700b002a4b2933a7asm9389812pjb.1.2024.05.05.22.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 22:58:28 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hpa@redhat.com,
	gregkh@linuxfoundation.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: atomisp: Fix spelling mistake in ia_css_debug.c
Date: Mon,  6 May 2024 11:43:18 +0545
Message-Id: <20240506055818.2532-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled suppress and implicit on ia_css_debug.c.
This patch fixes the misspellings.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 .../media/atomisp/pci/runtime/debug/src/ia_css_debug.c        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 3e92794555ec..f81e1b1df4e4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -847,7 +847,7 @@ void ia_css_debug_enable_sp_sleep_mode(enum ia_css_sp_sleep_mode mode)
 	fw = &sh_css_sp_fw;
 	HIVE_ADDR_sp_sleep_mode = fw->info.sp.sleep_mode;
 
-	(void)HIVE_ADDR_sp_sleep_mode;	/* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_sp_sleep_mode;	/* Suppress warnings in CRUN */
 
 	sp_dmem_store_uint32(SP0_ID,
 			     (unsigned int)sp_address_of(sp_sleep_mode),
@@ -1333,7 +1333,7 @@ ia_css_debug_pipe_graph_dump_stage(
 
 	if (stage->stage_num == 0) {
 		/*
-		 * There are some implicite assumptions about which bin is the
+		 * There are some implicit assumptions about which bin is the
 		 * input binary e.g. which one is connected to the input system
 		 * Priority:
 		 * 1) sp_raw_copy bin has highest priority
-- 
2.34.1


