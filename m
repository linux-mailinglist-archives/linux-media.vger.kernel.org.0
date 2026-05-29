Return-Path: <linux-media+bounces-63053-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF18Gne/GWoqywgAu9opvQ
	(envelope-from <linux-media+bounces-63053-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 18:31:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B74D9605A58
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 18:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C71D323C45C
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 15:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A345E3655DA;
	Fri, 29 May 2026 15:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsgTWYBw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057A7186284
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780069453; cv=none; b=Lal2tK4Dj9R08C8WgMqmpzHnc9fvJ8QKmRUHQ6F/n5ic0Q1PmmskM2NRkzF5kHk4e/ay1+cVK+S4wysYMrXQ4LN6hWuMu0OfmGPbGe3CvG+g5Hs0/c80Naf/t63Rf5IFgNjbJqCc9B4gt1v888wHx6ol5Cob8C4DdFsiawsobyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780069453; c=relaxed/simple;
	bh=hp5BUUTX1mi4ZEb9cz65rJNqx9844qbddMA0vSZFr74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I5bC7aB9PMbCjeIuaMjkrcRFEsBLGoIorYa29Lffj2qx9yjUaatfQhKRNGmPpYMAeJwlMy16Lk7Q3KQVqVu5d6LIm34Z9DAK5JPy/90pXwhr1hW5skA8ElPBdwZJBmiz/3g+ZBtu50Ms28QRtepaSNwMFs9cg9RjUqzpSD+M3Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsgTWYBw; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36ac67f489aso3957046a91.0
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780069450; x=1780674250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTALgua40eSJxC5QPIzISf5Jcp4xUbj6pCCeQN6u3VU=;
        b=EsgTWYBwSyi++27Df7vQSc8Fumvt8+8m74MmpCJlou3p5O7l9wnrkiAuYlqIw/uPjn
         MmP5ttHL6auKEl/1PLWvkGvQOAlkBRnLgmbjyP+x4SxrcsJUrYnGsEhqVoVwpUmnSu51
         /ygGp/m3qlkFTw++DBVXjtPdxP9W12eYYLgDpqFQ1OLQlirMmG3kmX5sIu0CzkbVIS7m
         29GM2NQ5/V764nQy7F8TpCAhTf9Y517i6N1ppHPmHAVsNM0Kt02/ORq1pan+CPNGku5k
         PPEBavkj3hxeT3p4Xb2gEcXSHmejHvWO1VcUuykRpYUUqJFMowgqIQO6i/TiC5NmPbNE
         /24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780069450; x=1780674250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gTALgua40eSJxC5QPIzISf5Jcp4xUbj6pCCeQN6u3VU=;
        b=AskMrEI29XTUNz1FZJS0POZ3IX0xJ29zc83O3rRo1xRK9D1/SKkutn0sxbTUMovb4A
         KhELGq/lwlcEe3BTSrz10QoHxjmAj5WaJJ1gx6DMBuZeaSN1cghMPHxY0wkwA02q+UBm
         /GZIJYu/2Nelw/wAubZcM4wDfGK1KDiYJ1nEyxi/2dt/oUkpzwsFzWEYe2CDTWh6WmDq
         NSna1RjgS8Fe+mR4zl7Y5CT6QuaNXr49+7nbAGcKeawoojGCK3MjWj23jaKOxS0DuI+G
         C8EeAuZRJKQvfvMRBKoSwx6ED7MrmcCAUeu2m8qR69J8xIW8Y53CThDvsVRS8Lue8K4a
         U4PA==
X-Gm-Message-State: AOJu0YxlrXBbfccn5iCUx54JzbrPGW5GYdiv8Fs42d8USM3bFXULluya
	huWruDTiqcAgeGY9fHxauVCojG1nF16l9CiiQhfWrdcTEhlYQm0/DuG7
X-Gm-Gg: Acq92OE5r1trF8srTb1LC782e3ZDr4TeJy6PUbI90AyR+LTei+LUgDYSqy1bbSB4cuy
	lNlvigvKrFXa0KDC3j+zfZbWqI+nSKXsvhwq8Tg0DhhRr8xd8qxWNX4328MFvTg0Vzf03Q1gOEg
	aB9Q6fPM4nClNXUCLpw5IJAl2wbN/SzLEjkSTTztW9T4DRw7XsjJel2EBVGedLDCMbabAcWdfy3
	lG2lRuW/j97B1OSTklIj9ejv7wy5LBW4Oerd+Gm3llEuNo5bEcx3r3bMKChIPPtTLP3K95jfSyF
	AB1UUBcnqwuB6/YmgwTRoKZV9w23Ea3EYcF025NgF/R+yDE4mzRLxwdYNtJ64tszwFb6wCneMXQ
	FK8G2YeXfNkBzN4aWlZRF8k7Ar2t5F5QkGw5RIEFm/0Td36wtRu+UwOZYmj6AYwTf92rDBA2jGK
	Zd7KwFklu9hrV2EOCXF8iY0x+CNcbefR8YQfsGRMN6ER2/
X-Received: by 2002:a17:90b:4b4d:b0:368:864:62ad with SMTP id 98e67ed59e1d1-36bbdf7d3e7mr3551853a91.3.1780069448756;
        Fri, 29 May 2026 08:44:08 -0700 (PDT)
Received: from mohan.. ([2402:3a80:183a:585e:7822:745a:cdc5:a9a8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbe192c34sm1076279a91.11.2026.05.29.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:44:08 -0700 (PDT)
From: Mohan Sudhandhiram M <mohan86108@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohan Sudhandhiram M <mohan86108@gmail.com>
Subject: [PATCH] staging: media: atomisp: align block comments to match kernel style
Date: Fri, 29 May 2026 21:13:57 +0530
Message-ID: <20260529154357.18066-1-mohan86108@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-63053-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohan86108@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B74D9605A58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix checkpatch.pl warnings regarding block comments that did not align
the '*' on each line. Removed the custom banner formatting and replaced
it with standard kernel block comments to improve readability and comply
with kernel coding guidelines.

Signed-off-by: Mohan Sudhandhiram M <mohan86108@gmail.com>
---
 .../atomisp/pci/runtime/frame/src/frame.c     | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
index 8614efc28..66161942b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
+++ b/drivers/staging/media/atomisp/pci/runtime/frame/src/frame.c
@@ -17,10 +17,9 @@
 
 #define NV12_TILEY_TILE_WIDTH  128
 #define NV12_TILEY_TILE_HEIGHT  32
-
-/**************************************************************************
-**	Static functions declarations
-**************************************************************************/
+/*
+ * Static functions declarations
+ */
 static void frame_init_plane(struct ia_css_frame_plane *plane,
 			     unsigned int width,
 			     unsigned int stride,
@@ -75,11 +74,9 @@ static struct ia_css_frame *frame_create(unsigned int width,
 static unsigned
 ia_css_elems_bytes_from_info(
     const struct ia_css_frame_info *info);
-
-/**************************************************************************
-**	CSS API functions, exposed by ia_css.h
-**************************************************************************/
-
+/*
+ *	CSS API functions, exposed by ia_css.h
+ */
 int ia_css_frame_allocate_from_info(struct ia_css_frame **frame,
 	const struct ia_css_frame_info *info)
 {
@@ -141,9 +138,9 @@ void ia_css_frame_free(struct ia_css_frame *frame)
 	IA_CSS_LEAVE_PRIVATE("void");
 }
 
-/**************************************************************************
-**	Module public functions
-**************************************************************************/
+/*
+ *	Module public functions
+ */
 
 int ia_css_frame_check_info(const struct ia_css_frame_info *info)
 {
@@ -435,9 +432,9 @@ int ia_css_dma_configure_from_info(struct dma_port_config *config,
 	return 0;
 }
 
-/**************************************************************************
-**	Static functions
-**************************************************************************/
+/*
+ *	Static functions
+ */
 
 static void frame_init_plane(struct ia_css_frame_plane *plane,
 			     unsigned int width,
-- 
2.43.0


