Return-Path: <linux-media+bounces-31133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0742A9E500
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 00:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22AA51891D42
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 22:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F1B1FDA92;
	Sun, 27 Apr 2025 22:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bspkDE7d"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAC61D5ACE
	for <linux-media@vger.kernel.org>; Sun, 27 Apr 2025 22:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745792026; cv=none; b=YzxTTq/TRzAYj6kHYumxPwyWXZOSQko5rMtBXoiybxtutaZozb/+oviy3aAtRKlQF6VfSgjWuDIbQ4FIO7v2eR2/ccbA7fUxVNTC98rkmmOO07lv6IxFFFHUBquLg4pd3Fh63OEnzPIPnts1kNNoZHKDZ4Y/hlexHA28Ok1gFoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745792026; c=relaxed/simple;
	bh=/i4io4Gv/kb6g1zfXO7OkZGDt+rLYWKBmMLBgp+fRt0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=SWbXI5pFgZlgtv4jS8E8wjP/SO5hiZN8yrVjbKz8IwICP7trsKPxWPzpsO94YOBXluvDC01kSDfvkxNaJsSR1w/XvrkxN9s62z5i9jv0nFiBKWG78cOVWIQFhs4swSbQkEZxKtCRA0xntq9RVp7+2i7UAiMsLkXrhIo9lErZIhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bspkDE7d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 747EE564;
	Mon, 28 Apr 2025 00:13:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745792012;
	bh=/i4io4Gv/kb6g1zfXO7OkZGDt+rLYWKBmMLBgp+fRt0=;
	h=From:To:Subject:Date:From;
	b=bspkDE7dGHCv+uCy939z1df1rWwxw5ePDOhX5oZy8/NX+Dl2R1YuZ8sDW2EqKAH5q
	 xaTzHeN1vEtOarondR+Ihzjf3t0p9ZlVuqmwC0E5StEfhzviBtbtgCphYYY392no4t
	 TFAutEHfVqnSHOC65WhpT/a73T6sPOWTNJAjIXDs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: ccs-pll: Print a debug message when VT tree calculation fails
Date: Mon, 28 Apr 2025 01:13:32 +0300
Message-ID: <20250427221332.17553-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the VT tree calculation fails to find a valid pre-divider, the
ccs_pll_calculate_vt_tree() function returns an error silently, and the
caller doesn't print any message either. This makes debugging PLL
calculation issues more difficult. Add a debug message to report the
issue, and amend the corresponding message for the OP tree to mention
"OP".

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ccs-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
index 8f9a695bd9e5..4eb83636e102 100644
--- a/drivers/media/i2c/ccs-pll.c
+++ b/drivers/media/i2c/ccs-pll.c
@@ -449,6 +449,7 @@ static int ccs_pll_calculate_vt_tree(struct device *dev,
 		return 0;
 	}
 
+	dev_dbg(dev, "unable to compute VT pre_pll divisor\n");
 	return -EINVAL;
 }
 
@@ -888,8 +889,7 @@ int ccs_pll_calculate(struct device *dev, const struct ccs_pll_limits *lim,
 	}
 
 	if (rval) {
-		dev_dbg(dev, "unable to compute pre_pll divisor\n");
-
+		dev_dbg(dev, "unable to compute OP pre_pll divisor\n");
 		return rval;
 	}
 

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
prerequisite-patch-id: 2dd0ca0c58806f4bca1f25cef6b4181ba455a12a
prerequisite-patch-id: 023258a689a5ed293f22504b0390b46cc9ce4bac
prerequisite-patch-id: c6e6e9ff091f36376eb41606ac8bd0d4c01b2e23
prerequisite-patch-id: 740a79bc284ec07de4064a77634c8afd15ef36bd
prerequisite-patch-id: 6cd1027d4c2352dc41ff1c094642911345951171
prerequisite-patch-id: 642e8c01a478a4c0980b0d8a3a05f395e1e62b28
prerequisite-patch-id: 69ddd4750e20892503fe33a1de5a48edae0d3aea
prerequisite-patch-id: a0c59cf60713e023de0100f5a3cbbb54d914b4f3
prerequisite-patch-id: 69ed159afa2c6f6f1f6d53fcf8e470bf18bdcda9
prerequisite-patch-id: 1f7f5da2ba5c8374958f900e83f056a16ac710d8
prerequisite-patch-id: dc53e71afa250af4beb370d662c72df2d5afd12d
-- 
Regards,

Laurent Pinchart


