Return-Path: <linux-media+bounces-46106-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB38DC26406
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 17:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9365F1A22178
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 16:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BB92F83DC;
	Fri, 31 Oct 2025 16:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqR3OA6F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BF52FD684
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 16:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761929819; cv=none; b=cQjpaIP/LjRm2qz5i5YHEmRUWu4Kmq20tc5Krsw2naudrkAm8DhkLrXWhzGacD4JqKOuNiGQfyArwaBbJZvoWpNdURKliFYTdqe+6G00QTsh38SXV78h4tSCNq5Sp5Gi7Ll2I5miI0gnz8FlXRwyNJ+4t/P8X6DcavD6kP0G6NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761929819; c=relaxed/simple;
	bh=WWnQxq9MvOz5vophT5mh709wnc18gU/QGh7BlY7BU44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rWhXg1K9V6+K/zDUNWGS6WMYhUg61lVZ4s/eshaJJ76JxGOVAdh2+8Xqtznl7Q9KOEcizplfdIz/Q+ZJMKx0OSOA2zhQP4YN2vg9hHLSucgPjy3UG644ncD/0dEBSMVrasBhj+6MfhRuS+4IxOhr1Ow6y6REEm3Ikb1hKC14+So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqR3OA6F; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7a28226dd13so2517186b3a.3
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 09:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761929817; x=1762534617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=75H06cNN6UuN6pp1+AJHS92a14vydasjYoMYY7ki7eY=;
        b=FqR3OA6FfwdQNbQxzim1e1vH5+6Xs3MKk/QQCmJz9jzfhCUIZBT3Sw1+V14sG9xifS
         kirJtJsoTLMPsTL8iY/Zv5LBeoLsqvhOUtNpweK533m34iUNItowDZw9ud7Ob0OLVOyB
         Vfh2cc3qwPn0l9s8zrudPUmUC4GgzdMelqfgrplnmqlMGKW6Zjfi8sxcc8TpL2fHbrhe
         vMtoSWCl4z9zTtxB9AR515W0faQ3FOk4HEvY5DJhmwlb3GWLsvfiKRFw89/nXqKSzrvW
         xLKMcx5ov+uai1DhePx32Sq32pq6Vf6O5ZcMpDf625O1YQ9rgONLhDCyRRyOrY5Y421y
         uKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761929817; x=1762534617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75H06cNN6UuN6pp1+AJHS92a14vydasjYoMYY7ki7eY=;
        b=VkU+nMFqxeUIjMp8XFFk+3FuNxjlawSqsNYNBLsUFvss6tQsgCsMjV0MxqDjCEz/yA
         dozPe6jlCby2VcPfyqnUG+WWgyikyCvuEG4DRjIBrZYOIz5Q09V2W2IdCnEPzgxTSA0M
         ZoW5fCh90nbLqW5+8DyiS4F4jVFlESfaRWNTqECfq81nAQlijtwcUT6oQDYUzynmubae
         ecuZ3n5UxDcUbWeOIh7iRmeF10gZ30jCe7PI1blFRLHCP71TVbrJ/Cu/quNIOVuVs0MT
         ImU61EhS8/Ze6Ek/qGWkyUutgzLX/3lVc7FrZ6inkq0OTU1T6sxRoMiR2z2BN2UmideM
         2xNg==
X-Forwarded-Encrypted: i=1; AJvYcCUfCzvYSvVtql6z2cEcUS11II3gS8fGq+srKtU4IAU/pHlyCLMTrEr+RswdZaRb+rStdQ/Vo0HnhUw8QA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36f6QmB5+KZ16rhJ1N/9KQ076nO8YK5w05aInDH3Cxuheuy7n
	TVJMdLeybNeb47GsnOCJdfMRkOWYcN+ztOc3dCwLZP9HUvGSyuA3nhde
X-Gm-Gg: ASbGncv1lk2Wa7FFHvYltSd7gXrh7Kz3xNnGwj0XVj47vHtd74iyLg9+vijFfWdom1H
	RBuY1jNJMZKiULobZ5P2+/IRnV6Lf28E5kPcNHO+Z2dRan8GJN3Ld5LoPvWrq4tkPAsvTDwoamL
	3D9iNN0RU/2Qg868rk0udp8cLcI6KG8rCK5SP6xHCkY6FELJ9eDMiw+13Cgf87RPNbHbC4KN1N/
	AH37+0/H6G5GRjtEoNrUCxzOiB63UUO470Xl7SLNC3AEQft2jAEpxuTsk6gmOgTdHHKGyxmLzuB
	6c+uuUXzlFA+xac6vGkIPtGRQ42jRuiAy3WXphTfiL+2abzR/UhavHGmY3owHLQpsQixCyNgD8c
	kgE31R/P9QhhCZ8w8BjVyTupu1V2/8o54ydFoJhVH/AyYJntvHtPdE2YiGbJuW1KFeG0BoaIbLQ
	2qGLs=
X-Google-Smtp-Source: AGHT+IEn9mRaFriZ4w42iWzEpFpTJw3pAZ5gIf/TLvCs2205ZF0F+XXD+dUdH9vCvuvbHC5KOkO2jw==
X-Received: by 2002:a05:6a00:3e24:b0:781:24ec:c8f4 with SMTP id d2e1a72fcca58-7a776d97ed2mr4632190b3a.3.1761929817335;
        Fri, 31 Oct 2025 09:56:57 -0700 (PDT)
Received: from Ubuntu24.. ([103.187.64.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7dbc5aa56sm2745572b3a.68.2025.10.31.09.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 09:56:56 -0700 (PDT)
From: Shrikant Raskar <raskar.shree97@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Shrikant Raskar <raskar.shree97@gmail.com>
Subject: [RFC PATCH v3] media: saa6588: Remove dprintk macro and use v4l2_info()
Date: Fri, 31 Oct 2025 22:26:45 +0530
Message-ID: <20251031165645.6217-1-raskar.shree97@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing 'dprintk' macro used an unwrapped 'if' statement which was
flagged by checkpatch, but instead of wrapping it, the debug handling
can be simplified.

This patch removes the 'dprintk' macro entirely and replaces all its
usages with v4l2_info() helper. The unused 'PREFIX' macro is also
removed.

Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>
---
Changelog:
Changes since v2:
- Fixed indentation issue reported by media CI robot.

Link to v2:
https://lore.kernel.org/all/20251025124107.4921-1-raskar.shree97@gmail.com/
---
 drivers/media/i2c/saa6588.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/saa6588.c b/drivers/media/i2c/saa6588.c
index fb09e4560d8a..90ae4121a68a 100644
--- a/drivers/media/i2c/saa6588.c
+++ b/drivers/media/i2c/saa6588.c
@@ -49,8 +49,6 @@ MODULE_LICENSE("GPL");
 /* ---------------------------------------------------------------------- */
 
 #define UNSET       (-1U)
-#define PREFIX      "saa6588: "
-#define dprintk     if (debug) printk
 
 struct saa6588 {
 	struct v4l2_subdev sd;
@@ -144,14 +142,14 @@ static bool block_from_buf(struct saa6588 *s, unsigned char *buf)
 
 	if (s->rd_index == s->wr_index) {
 		if (debug > 2)
-			dprintk(PREFIX "Read: buffer empty.\n");
+			v4l2_info(&s->sd, "Read: buffer empty.\n");
 		return false;
 	}
 
 	if (debug > 2) {
-		dprintk(PREFIX "Read: ");
+		v4l2_info(&s->sd, "Read: ");
 		for (i = s->rd_index; i < s->rd_index + 3; i++)
-			dprintk("0x%02x ", s->buffer[i]);
+			v4l2_info(&s->sd, "0x%02x ", s->buffer[i]);
 	}
 
 	memcpy(buf, &s->buffer[s->rd_index], 3);
@@ -162,7 +160,7 @@ static bool block_from_buf(struct saa6588 *s, unsigned char *buf)
 	s->block_count--;
 
 	if (debug > 2)
-		dprintk("%d blocks total.\n", s->block_count);
+		v4l2_info(&s->sd, "%d blocks total.\n", s->block_count);
 
 	return true;
 }
@@ -222,11 +220,11 @@ static void block_to_buf(struct saa6588 *s, unsigned char *blockbuf)
 	unsigned int i;
 
 	if (debug > 3)
-		dprintk(PREFIX "New block: ");
+		v4l2_info(&s->sd, "New block: ");
 
 	for (i = 0; i < 3; ++i) {
 		if (debug > 3)
-			dprintk("0x%02x ", blockbuf[i]);
+			v4l2_info(&s->sd, "0x%02x ", blockbuf[i]);
 		s->buffer[s->wr_index] = blockbuf[i];
 		s->wr_index++;
 	}
@@ -242,7 +240,7 @@ static void block_to_buf(struct saa6588 *s, unsigned char *blockbuf)
 		s->block_count++;
 
 	if (debug > 3)
-		dprintk("%d blocks total.\n", s->block_count);
+		v4l2_info(&s->sd, "%d blocks total.\n", s->block_count);
 }
 
 static void saa6588_i2c_poll(struct saa6588 *s)
@@ -257,7 +255,7 @@ static void saa6588_i2c_poll(struct saa6588 *s)
 	   SAA6588 returns garbage otherwise. */
 	if (6 != i2c_master_recv(client, &tmpbuf[0], 6)) {
 		if (debug > 1)
-			dprintk(PREFIX "read error!\n");
+			v4l2_info(&s->sd, "read error!\n");
 		return;
 	}
 
@@ -267,7 +265,7 @@ static void saa6588_i2c_poll(struct saa6588 *s)
 	blocknum = tmpbuf[0] >> 5;
 	if (blocknum == s->last_blocknum) {
 		if (debug > 3)
-			dprintk("Saw block %d again.\n", blocknum);
+			v4l2_info(&s->sd, "Saw block %d again.\n", blocknum);
 		return;
 	}
 
@@ -370,12 +368,13 @@ static void saa6588_configure(struct saa6588 *s)
 		break;
 	}
 
-	dprintk(PREFIX "writing: 0w=0x%02x 1w=0x%02x 2w=0x%02x\n",
-		buf[0], buf[1], buf[2]);
+	if (debug)
+		v4l2_info(&s->sd, "writing: 0w=0x%02x 1w=0x%02x 2w=0x%02x\n",
+			  buf[0], buf[1], buf[2]);
 
 	rc = i2c_master_send(client, buf, 3);
 	if (rc != 3)
-		printk(PREFIX "i2c i/o error: rc == %d (should be 3)\n", rc);
+		v4l2_info(&s->sd, "i2c i/o error: rc == %d (should be 3)\n", rc);
 }
 
 /* ---------------------------------------------------------------------- */

base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
-- 
2.43.0


