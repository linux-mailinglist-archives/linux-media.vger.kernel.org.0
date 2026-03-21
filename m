Return-Path: <linux-media+bounces-56608-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBQUKtPmvmm2igMAu9opvQ
	(envelope-from <linux-media+bounces-56608-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 19:43:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3942E6D48
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 19:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FD1830263EE
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 18:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B19349B0B;
	Sat, 21 Mar 2026 18:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwUYhUMI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB8134846D
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 18:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774118569; cv=none; b=Prq2L2plY4x6ZMRq1/kP917eWgU39cOgK7pKAUk07/jU1JcwPaIdN8ztO2rAKsMU85Y+gLb3ozDaVjNEAQvybfMBUvET7evCrTGMNuWiPFQbBkDURGW3/FIOrDUQKtHF0s1qvKXGMdcSsue/qzykltxBZuNJBoiKbfFxCk3yoxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774118569; c=relaxed/simple;
	bh=Z031qvX0Lh8Kw5PlpbhT3p3CAkirxht5YbFEJHKb6xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rtzEMfTAPXAOpMsjbzl/kbELgE1xGGZ6mIq0zsK9uP5gd/31J9CbFdedTyvk0b9cXw+ABfftW9qCqiyzmqeGTHiQwdiaQYEBllG+nzQ38qJnJ0mtcPdcNYEnZHnhOBkUgR3oYPylL9CprekhvDPjV80jUwTdQeuq4g3eH2GhbQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwUYhUMI; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c736261ee8dso1070429a12.1
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 11:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774118567; x=1774723367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tX5Pt10T82xTjhI6u1k3ryf9SskZVWpfzWj29gwwrMQ=;
        b=NwUYhUMIbvyVHzaSJA1saduuuu/ol9/4rCnxmcCEJO8cuXily0MzcgCX6+cxP36Zsu
         YwmuHWC0RUoKpaO/VpqISI5WrOBMV3rwSG7Llpf0dijKCK+dCh1/wcoTkp4/tFBJ4CPL
         O/klU5cFwwHrZn39J8lkNqs3GAFF2iR5zhaUPD3e/or4bDG7FOrvUKpjBk9P++BcAd2y
         CoWXNRbwFRHy07jE/wiBVBia4azX8lngWBhdHK58w/Ljxf0f8bcikaL4V9Hd2rCXVepF
         Ch1km6HzotfbYUxwSyB6jo4EXL1P85fZqcAeNeqJ3iTdXDDpPlOphXeeFP4vtwZ2QvLX
         1YPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774118567; x=1774723367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tX5Pt10T82xTjhI6u1k3ryf9SskZVWpfzWj29gwwrMQ=;
        b=juP154vapsD3CQyMvfqiQWx5Ntd5auqkM7Dm6LLKx6tZ33dGkNRqNkk3vymH9V02I9
         Dg9ai9B8sPJOJMelrkdHNVB38QTDULLvf8ou9CD6icJ3cPdKG+VU2Lo/JEQ6S1Yk5p5N
         nC2sSTTpZKrE33X+/xwyky4IyflxbB6efe2W1MhjLXNb3+/Ch9H2gZgKIA98CjAdnVwf
         iATeUrPVNdI6S90PL+/0KISmUqPkDcwZzzQKXzFAsSuItgzC4MucD9o6H9lvPR9yVO/+
         DZQ1jVs4YmOUpet5HWp30f8xi3sCa8s11SaCPheKGQcCyEnsM/4WBIkqtGkXn/Talp0i
         yuyw==
X-Forwarded-Encrypted: i=1; AJvYcCXCdD2u5wMuaVKUE/e5CFxELUVCKe2ff8IjCs0A1SQaAbDIzaZPDU4rD2nZXDZXccWu/hx3aoya8RpcoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7lepOrLqANJFUpuZ16RhBaD/Zhgo/9mzk/mMh4cFGqwPgE4i
	rdW2dVD+QZPy1UEO5aq4NNdXtlYesszHpq8DYRkvGcaaG92QGKVYLh04
X-Gm-Gg: ATEYQzzXwlmpLzeVcqpJ0A4HQH94sKy4CvvTkckMEn9S835TSa/JyZeif/vnaooaLQt
	m3yNe3H5CDjh0DuAg48csIt5NF5slXvXoaKkNsq5SxsF2yW/tZdINmCgm4rhNkQSZxp/n+3s96S
	42NLxkwpqY0OxICpT5yg0Ejpt1Jydc0yOa6YGRwjV+qb4+p5pJVYJZ6bpKcxzME6iK8fngg9lb9
	cQImTmpaghKZP2LQN+SQS1dqJJCkEhQe+/CABVPfY+CQOO80pTFVMFFlMIZP4uAtDUfyEc53u3o
	P3vfVbaeEWxlswY04dsuDyHlcSBuHCmCexwo7tg42lVp8HDyB1SmahYU+yMmin7Ehi4VDfez0HZ
	aI5/0G75MZE5WXwiVUxXmH0LJMDL9D+3IKlqeU5ZBssBz8rcI5ySJZU7j4yB3uVnB7Lle3KblfF
	ksl/jVfHwkdpORwQqzu2y1Oiw6SEI8hkTQFPUL2fEEWHIAMoASumCDGDapXDKdKg==
X-Received: by 2002:a17:90b:5103:b0:35b:a418:6990 with SMTP id 98e67ed59e1d1-35bd2985674mr6424847a91.0.1774118567168;
        Sat, 21 Mar 2026 11:42:47 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.bbrouter ([60.243.255.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd26cde44sm1898884a91.4.2026.03.21.11.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 11:42:46 -0700 (PDT)
From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Abinash Singh <abinashsinghlalotra@gmail.com>
Subject: [PATCH] staging: atomisp: replace uint32_t with u32
Date: Sun, 22 Mar 2026 00:12:24 +0530
Message-ID: <20260321184224.36322-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,nxp.com,ti.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-56608-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abinashsinghlalotra@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F3942E6D48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace usage of uint32_t with u32 to comply with kernel coding
style guidelines.

Reported by checkpatch.pl.
CHECK: Prefer kernel type 'u32' over 'uint32_t'

Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---
Similar cleanup done in:
d6e1f701c61f ("staging: gpib: tnt4882: u8 over uint8_t")

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings


 .../staging/media/atomisp/pci/atomisp_subdev.c | 18 +++++++++---------
 .../staging/media/atomisp/pci/atomisp_subdev.h | 12 ++++++------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 3d56ca83ecb7..ff9f08cbf73b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -180,8 +180,8 @@ static int isp_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int isp_subdev_validate_rect(struct v4l2_subdev *sd, uint32_t pad,
-				    uint32_t target)
+static int isp_subdev_validate_rect(struct v4l2_subdev *sd, u32 pad,
+				    u32 target)
 {
 	switch (pad) {
 	case ATOMISP_SUBDEV_PAD_SINK:
@@ -203,8 +203,8 @@ static int isp_subdev_validate_rect(struct v4l2_subdev *sd, uint32_t pad,
 
 struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
 	struct v4l2_subdev_state *sd_state,
-	u32 which, uint32_t pad,
-	uint32_t target)
+	u32 which, u32 pad,
+	u32 target)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 
@@ -229,8 +229,8 @@ struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
 
 struct v4l2_mbus_framefmt
 *atomisp_subdev_get_ffmt(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_state *sd_state, uint32_t which,
-			 uint32_t pad)
+			 struct v4l2_subdev_state *sd_state, u32 which,
+			 u32 pad)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 
@@ -242,7 +242,7 @@ struct v4l2_mbus_framefmt
 
 static void isp_get_fmt_rect(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
-			     uint32_t which,
+			     u32 which,
 			     struct v4l2_mbus_framefmt **ffmt,
 			     struct v4l2_rect *crop[ATOMISP_SUBDEV_PADS_NUM],
 			     struct v4l2_rect *comp[ATOMISP_SUBDEV_PADS_NUM])
@@ -291,7 +291,7 @@ static const char *atomisp_pad_str(unsigned int pad)
 
 int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
-				 u32 which, uint32_t pad, uint32_t target,
+				 u32 which, u32 pad, u32 target,
 				 u32 flags, struct v4l2_rect *r)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
@@ -467,7 +467,7 @@ static int isp_subdev_set_selection(struct v4l2_subdev *sd,
 
 void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
-			     uint32_t which,
+			     u32 which,
 			     u32 pad, struct v4l2_mbus_framefmt *ffmt)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index e1d0168cb91d..b12bb65be3f2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -315,20 +315,20 @@ bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd);
 /* Get pointer to appropriate format */
 struct v4l2_mbus_framefmt
 *atomisp_subdev_get_ffmt(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_state *sd_state, uint32_t which,
-			 uint32_t pad);
+			 struct v4l2_subdev_state *sd_state, u32 which,
+			 u32 pad);
 struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
 	struct v4l2_subdev_state *sd_state,
-	u32 which, uint32_t pad,
-	uint32_t target);
+	u32 which, u32 pad,
+	u32 target);
 int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
-				 u32 which, uint32_t pad, uint32_t target,
+				 u32 which, u32 pad, u32 target,
 				 u32 flags, struct v4l2_rect *r);
 /* Actually set the format */
 void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
-			     uint32_t which,
+			     u32 which,
 			     u32 pad, struct v4l2_mbus_framefmt *ffmt);
 
 void atomisp_subdev_cleanup_pending_events(struct atomisp_sub_device *asd);
-- 
2.43.0


