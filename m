Return-Path: <linux-media+bounces-39268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5EBB1F6C3
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7429188749E
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E85529CB24;
	Sat,  9 Aug 2025 21:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="trrXUs5v"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F627F4D5
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774363; cv=none; b=q7LiPNSxnsx9o50bUm4amiOBz1f+aK6qTqZua21Jv8zbMAHUm3URY/Cux9VFiix2V2tGH11PG3RvmJCsl9e6pTZB9HVGOITQWueKjFMtiDzeQLM4LbRQg8l4nhCec1gmVTI2Y2zgrevR5AEuHRjdjyDEkVJ7vmNd9ZOLQ4EQ9RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774363; c=relaxed/simple;
	bh=J09Wb2LE9vj2EYa9ukHcCx2DPe7cQ9TvK97alGEJFas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mx1pI3lCrSq8G2nWP04tHhFd2a0si5iwdu40LTA0Ob2zcKNMLjlUHDDoe1o78Nky31MOdNkepbYvyjuFo0z6aFCDSipcSU9rSoRhTayxAp2F5g89iG17HFk/WO4HW71ccQBGc0GRhgo9z5Aw9zyheAcN4uwPigj7FYpiaQQNI1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=trrXUs5v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D0485111D;
	Sat,  9 Aug 2025 23:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774303;
	bh=J09Wb2LE9vj2EYa9ukHcCx2DPe7cQ9TvK97alGEJFas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=trrXUs5vSbwTjfgqFocvW2POEQjasBVjj16JG7YDbiXcmdB09rJmWoqIUg+h2j+7K
	 27DrCMFFkBCnihlO7VAeHSAPG8n4ysi3HHtpYUnjoHXIUd4oP4lJai2gJqL/EiaArJ
	 hCrkcBh8tTmwgAJdsps6otThErADregkCR7mAJYQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v2 73/76] media: v4l2-pci-skeleton: Rename second ioctl handlers argument to 'void *priv'
Date: Sun, 10 Aug 2025 00:16:50 +0300
Message-ID: <20250809211654.28887-74-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The second argument to the ioctl handlers is not a file handle any more.
Rename it to 'void *priv', to avoid misconceptions. This is particularly
important in the v4l2-pci-skeleton driver, as it is meant to be a base
for new drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 samples/v4l/v4l2-pci-skeleton.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
index d709d82800cd..69925d30329e 100644
--- a/samples/v4l/v4l2-pci-skeleton.c
+++ b/samples/v4l/v4l2-pci-skeleton.c
@@ -470,7 +470,7 @@ static int skeleton_querystd(struct file *file, void *priv, v4l2_std_id *std)
 	return 0;
 }
 
-static int skeleton_s_dv_timings(struct file *file, void *_fh,
+static int skeleton_s_dv_timings(struct file *file, void *priv,
 				 struct v4l2_dv_timings *timings)
 {
 	struct skeleton *skel = video_drvdata(file);
@@ -509,7 +509,7 @@ static int skeleton_s_dv_timings(struct file *file, void *_fh,
 	return 0;
 }
 
-static int skeleton_g_dv_timings(struct file *file, void *_fh,
+static int skeleton_g_dv_timings(struct file *file, void *priv,
 				 struct v4l2_dv_timings *timings)
 {
 	struct skeleton *skel = video_drvdata(file);
@@ -522,7 +522,7 @@ static int skeleton_g_dv_timings(struct file *file, void *_fh,
 	return 0;
 }
 
-static int skeleton_enum_dv_timings(struct file *file, void *_fh,
+static int skeleton_enum_dv_timings(struct file *file, void *priv,
 				    struct v4l2_enum_dv_timings *timings)
 {
 	struct skeleton *skel = video_drvdata(file);
@@ -544,7 +544,7 @@ static int skeleton_enum_dv_timings(struct file *file, void *_fh,
  * can lock but that the DMA engine it is connected to cannot handle
  * pixelclocks above a certain frequency), then -ERANGE is returned.
  */
-static int skeleton_query_dv_timings(struct file *file, void *_fh,
+static int skeleton_query_dv_timings(struct file *file, void *priv,
 				     struct v4l2_dv_timings *timings)
 {
 	struct skeleton *skel = video_drvdata(file);
@@ -573,7 +573,7 @@ static int skeleton_query_dv_timings(struct file *file, void *_fh,
 	return 0;
 }
 
-static int skeleton_dv_timings_cap(struct file *file, void *fh,
+static int skeleton_dv_timings_cap(struct file *file, void *priv,
 				   struct v4l2_dv_timings_cap *cap)
 {
 	struct skeleton *skel = video_drvdata(file);
-- 
Regards,

Laurent Pinchart


