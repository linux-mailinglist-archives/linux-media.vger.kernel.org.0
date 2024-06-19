Return-Path: <linux-media+bounces-13648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D287390E147
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 03:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DD5E2840D8
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 01:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DBB1170F;
	Wed, 19 Jun 2024 01:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l/AsMhOE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F151AD32;
	Wed, 19 Jun 2024 01:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718760272; cv=none; b=jGAlI9qse5FUlDHQMKVjccmaWM+v+kJZmR898sNDCp3w7ZuIml5s1TmgIbz90naIlrG0h/IUC5UNjydigXfl26s2Bd85PfBVo2huUqfWY8pCjRMzQl0dqoWxH6121oa4+jDWoJAruIxRAopAWzKyyrz87wTHQ+iG5VOH0OPchvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718760272; c=relaxed/simple;
	bh=BxwFc+luxvMoNAtbVbMthJtaEL72gSDIum8h9l1swBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgbtvVVgeBrAOIDPtPfnzOfPXCXpcqJVbOkLsH6qfdP0B0ptXcxoEceBwdP2vdUTstG1jPeOVl+M0KqcKnrpuqfUYD9obzKaWLvkb2199R3pG0+Ci2lccA/nMldGUUfy92SIjs8in8pjeVHnj1r+oXP/+e/I+67HRdjNhmTt1RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l/AsMhOE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1463C121A;
	Wed, 19 Jun 2024 03:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718760249;
	bh=BxwFc+luxvMoNAtbVbMthJtaEL72gSDIum8h9l1swBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l/AsMhOEv81G6pS2xsbdnkCId3X8AKNqWyr9q7M21fEerbEjhgcVHFYNXq0GLCARZ
	 2KaVQh2B68L5gg9j2otoa3iokH8jwxjFoXLer7MsUQ2mnwLD1tvnM2dhrRJD6JCi0t
	 VDgkltX83vglus607GXzyEje1I1YnWaGMU2sftK0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 6/8] media: renesas: vsp1: Print debug message to diagnose validation failure
Date: Wed, 19 Jun 2024 04:23:54 +0300
Message-ID: <20240619012356.22685-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619012356.22685-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When formats don't match between a subdev and a connected video device,
starting streaming returns an error without giving the user any
indication as to what went wrong. To help debugging pipeline
misconfigurations, add a debug message that indicates the cause of the
failure.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_video.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 5a9cb0e5640e..d6f2739456bf 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -78,8 +78,14 @@ static int vsp1_video_verify_format(struct vsp1_video *video)
 
 	if (video->rwpf->fmtinfo->mbus != fmt.format.code ||
 	    video->rwpf->format.height != fmt.format.height ||
-	    video->rwpf->format.width != fmt.format.width)
+	    video->rwpf->format.width != fmt.format.width) {
+		dev_dbg(video->vsp1->dev,
+			"Format mismatch: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
+			video->rwpf->fmtinfo->mbus, video->rwpf->format.width,
+			video->rwpf->format.height, fmt.format.code,
+			fmt.format.width, fmt.format.height);
 		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart


