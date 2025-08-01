Return-Path: <linux-media+bounces-38731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEC8B188A4
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 23:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60E631C21AC1
	for <lists+linux-media@lfdr.de>; Fri,  1 Aug 2025 21:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B725D28D8C7;
	Fri,  1 Aug 2025 21:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FYN4wVbj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DC728F51F
	for <linux-media@vger.kernel.org>; Fri,  1 Aug 2025 21:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754083200; cv=none; b=sNuVi0NHLePjXNQJVZXCNpn3lKPfamghSvLgbKiGepi/nl3ijbCW97S6LRyQTS6KniJeaqNIHBgLTmA/A3gg0QBSFCqO5Shgcy3Yi1rrPggGCi43kF7JFP7Iq+8dM3kMOTWLi+rrcxQBoLl78UHNvfuIRNKyuGt9nMFXVx/11t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754083200; c=relaxed/simple;
	bh=6azXtqGMpJWXKSXmySPb38jfxI6R81GYHePRpzwybRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MvKVQi+t0on+QzzgqyTsgubmv32RT9ccMk5B5Nc1RPew32cagUQ+kLCdMPbGfBNmFBvWr8yDgBR9EuPvZZV8xNFdBGqnhIVpYozP0DnMVRchMIwEo7DTXEoPvxZTObOxGRm1cc836Z2AwxeUiqL4GeWqBU0rXUzijZaPLv5b1D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FYN4wVbj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BEF26666;
	Fri,  1 Aug 2025 23:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754083145;
	bh=6azXtqGMpJWXKSXmySPb38jfxI6R81GYHePRpzwybRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FYN4wVbj2FWQj8iNtRbAatzdaFO0krgSEbklmZqKGYL/MSw3H4qvqWtcyDUysc3UN
	 f+QZmEAwEjbmjgyVn4VTGbJjydMxc0SHZV7HBQhLcl1wi5LFaxIMlRpkzil4f+3x2G
	 SaUa4lJmQkRZVeKjOPuoVP2qlZwiFh9ZIhI6SBzw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev
Subject: [PATCH 3/3] media: staging: imx: Drop custom .unsubscribe_event() handler
Date: Sat,  2 Aug 2025 00:19:33 +0300
Message-ID: <20250801211933.22553-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250801211933.22553-1-laurent.pinchart@ideasonboard.com>
References: <20250801211933.22553-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The csi_unsubscribe_event() function simply calls
v4l2_event_unsubscribe(), forwarding its arguments. Replace it with the
v4l2_event_subdev_unsubscribe() helper that performs exactly the same
operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index a7cd3ef95fc3..fd7e37d803e7 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1751,12 +1751,6 @@ static int csi_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 	return v4l2_event_subscribe(fh, sub, 0, NULL);
 }
 
-static int csi_unsubscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
-				 struct v4l2_event_subscription *sub)
-{
-	return v4l2_event_unsubscribe(fh, sub);
-}
-
 static int csi_registered(struct v4l2_subdev *sd)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
@@ -1872,7 +1866,7 @@ static const struct media_entity_operations csi_entity_ops = {
 
 static const struct v4l2_subdev_core_ops csi_core_ops = {
 	.subscribe_event = csi_subscribe_event,
-	.unsubscribe_event = csi_unsubscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
 static const struct v4l2_subdev_video_ops csi_video_ops = {
-- 
Regards,

Laurent Pinchart


