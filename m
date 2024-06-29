Return-Path: <linux-media+bounces-14403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6494091CE06
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 17:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A1671F21FFB
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 15:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305F881AC8;
	Sat, 29 Jun 2024 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J+ss757w"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EF421364
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719676351; cv=none; b=A43WhvUjvJsTh07Vyqg5hXdF5TyCvUvS+C/EsZKtiRIBc4B3X/NQ7PpCQ6k0Jyvzt6EUqKwbJpWNkMm3aFrPas2vyNUJhsiXcaATUjCqBQ0YoY8gjI/t0HiIdjuMH/qSPjSuXlWoX9w2OEGRBURUueNt6C1BOWeKyWVQY6tJj7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719676351; c=relaxed/simple;
	bh=h9xMUlmHlfcKYeEwMW/ZIokI8BYZQ2+jF4bE9vfqnyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4YkCSMWNC+RPaVT4z8b49+BXw6WRIrVRdJUJSMQy7/13pjiE5jaQh/Jr0gf9cN7liUho8BCW5UQIZ81TCWa/nFqyA1gzvaD70E6pRylVRfd0el9BrDbGywaCcRmsxqxk7RvXt8NMOopSZag0hdiA8UkqWYC8FZo1e2yQ2cRUJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J+ss757w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CC7B8E0;
	Sat, 29 Jun 2024 17:52:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719676322;
	bh=h9xMUlmHlfcKYeEwMW/ZIokI8BYZQ2+jF4bE9vfqnyY=;
	h=From:To:Cc:Subject:Date:From;
	b=J+ss757wiqFoOg/+W+c86QPdlY0qovsEvKo5gv5JcIQ6Mk2LhMGdNLV5Ni78MAibV
	 JvoBWsGZpxuX4xtCnammjt/a/RtdKkoW1XAetOWcF1lNYud44PM3E5zOkCwHfoiU2S
	 vyz6DCCTUi9Jy5aNJUp/R3Hvf8Af4bHMzbHcthTk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH] media: ccs-pll: Make variables const where appropriate
Date: Sat, 29 Jun 2024 18:52:05 +0300
Message-ID: <20240629155205.17132-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many functions operate on data structures that are read only, both in
the implementation and by design. Mark them as const to increase
readability and avoid future mistakes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs-pll.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index cf8858cb13d4..34ccda666524 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -75,11 +75,11 @@ static const char *pll_string(unsigned int which)
 
 #define PLL_FL(f) CCS_PLL_FLAG_##f
 
-static void print_pll(struct device *dev, struct ccs_pll *pll)
+static void print_pll(struct device *dev, const struct ccs_pll *pll)
 {
 	const struct {
-		struct ccs_pll_branch_fr *fr;
-		struct ccs_pll_branch_bk *bk;
+		const struct ccs_pll_branch_fr *fr;
+		const struct ccs_pll_branch_bk *bk;
 		unsigned int which;
 	} branches[] = {
 		{ &pll->vt_fr, &pll->vt_bk, PLL_VT },
@@ -150,10 +150,10 @@ static u32 op_pix_ddr(u32 flags)
 
 static int check_fr_bounds(struct device *dev,
 			   const struct ccs_pll_limits *lim,
-			   struct ccs_pll *pll, unsigned int which)
+			   const struct ccs_pll *pll, unsigned int which)
 {
 	const struct ccs_pll_branch_limits_fr *lim_fr;
-	struct ccs_pll_branch_fr *pll_fr;
+	const struct ccs_pll_branch_fr *pll_fr;
 	const char *s = pll_string(which);
 	int rval;
 
@@ -190,10 +190,10 @@ static int check_fr_bounds(struct device *dev,
 
 static int check_bk_bounds(struct device *dev,
 			   const struct ccs_pll_limits *lim,
-			   struct ccs_pll *pll, unsigned int which)
+			   const struct ccs_pll *pll, unsigned int which)
 {
 	const struct ccs_pll_branch_limits_bk *lim_bk;
-	struct ccs_pll_branch_bk *pll_bk;
+	const struct ccs_pll_branch_bk *pll_bk;
 	const char *s = pll_string(which);
 	int rval;
 
@@ -230,7 +230,7 @@ static int check_bk_bounds(struct device *dev,
 	return rval;
 }
 
-static int check_ext_bounds(struct device *dev, struct ccs_pll *pll)
+static int check_ext_bounds(struct device *dev, const struct ccs_pll *pll)
 {
 	if (!(pll->flags & CCS_PLL_FLAG_FIFO_DERATING) &&
 	    pll->pixel_rate_pixel_array > pll->pixel_rate_csi) {

base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
-- 
Regards,

Laurent Pinchart


