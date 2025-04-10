Return-Path: <linux-media+bounces-29989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21496A8502E
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 01:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3077819E3AD4
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 23:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC65E2144AC;
	Thu, 10 Apr 2025 23:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LDhcuY0U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C2C1DED40;
	Thu, 10 Apr 2025 23:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744328592; cv=none; b=Av8be5uevzQBhy7xsNpBf/jq8/vVnHIc/yPkojxma+Y/WOiqsQmBelvPJ7b+Eqifj1hF0XWrHvBmQXqkEOADhFiKE86Ff7GIyxEcFfL//3PsHI2hLM8/HG4OtvYL81AkapBWzFp7F6p76NjcJ4JbgynwfgzPGE6QUl36np+egO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744328592; c=relaxed/simple;
	bh=TpqUVnVvF12n5pRwFSqv74hT0Ga5lBUcCWULIJwqNhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m9AZCC2/MZ9RKr2Qwffw45dyLEF29VPl/DJFUa8Z24GQHDjrpmFa+K0Owv7J2r1KaCeKlas9NcChWWrKWWGuCKeM4D0+r+cTPtvsjT5P7DRakFfCEEt0znjYgdoTrrqVj4X9MWRjmPUYLAEMAYxFtJQ8O1rpD6cu6ze0OeJGHW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LDhcuY0U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2422669;
	Fri, 11 Apr 2025 01:41:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744328469;
	bh=TpqUVnVvF12n5pRwFSqv74hT0Ga5lBUcCWULIJwqNhs=;
	h=From:To:Cc:Subject:Date:From;
	b=LDhcuY0U3y6O722mfl7TC/4cglUWDMNZAjx+WVXm4I2oG6koiro3iRxxMINlPDaaX
	 2D+qeJwR3FVP7QdkdEwL/nMe4t/yAi29S2kAlJ8AaLvJiuExYO8nV6fQLkoNq9g60N
	 cJH0Hmp/SoPdyozUt7TJrEEPJGsEzzYxBByTwrJw=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/3] drm: rcar-du: Support plane color space properties
Date: Fri, 11 Apr 2025 02:42:38 +0300
Message-ID: <20250410234241.28123-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series builds on top of the R-Car VSP1 color space
support ("[PATCH 0/6] media: renesas: vsp1: Add colorspace support",
posted as [1]) to implement the KMS plane color space properties in the
R-Car DU driver.

The first two patches add support to specify plane color encoding and
color range in the vsp1-du API. Patch 1/3 starts with a small
refactoring, and patch 2/2 extends the in-kernel API with two new
parameters, and wire them up to the VSP pipeline. Patch 3/3 then creates
the color space properties in R-Car DU driver, and pass their values to
the VSP driver.

Given that only the last patch touches the DRM subsystem, while the 9
patches it depends on touch the V4L2 subsystem, I would like to merge
everything through V4L2. I don't expect conflicting changes to the
rcar-du driver to be merged for v6.16. Dave, Sima, could I get your ack
for this ?

[1] https://lore.kernel.org/r/20250409003815.10253-1-laurent.pinchart+renesas@ideasonboard.com

Laurent Pinchart (3):
  media: renesas: vsp1: Name nested structure in vsp1_drm
  media: renesas: vsp1: Expose color space through the DRM API
  drm: rcar-du: Create plane color properties

 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 15 +++++++++++++
 .../media/platform/renesas/vsp1/vsp1_drm.c    | 22 +++++++++++--------
 .../media/platform/renesas/vsp1/vsp1_drm.h    |  8 ++++---
 include/media/vsp1.h                          |  4 ++++
 4 files changed, 37 insertions(+), 12 deletions(-)


base-commit: 9ddc3d6c16ea2587898a315f20f7b8fbd791dc1b
prerequisite-patch-id: e3d9847d1da4398f1bf0b57f5ef4a612392c7255
prerequisite-patch-id: 54ade6c92a08292f509ad0c42cc578e2b355e699
prerequisite-patch-id: c2f29968199990b573d655ca9ea9ac0883842a9c
prerequisite-patch-id: 96e1d3ee682a91153ecd32207a641274cdd88b7a
prerequisite-patch-id: 221744f7a7fc757b67c32a1eb2160fb46cd59111
prerequisite-patch-id: cf6b99de1ae04e635d14dd198b5bf918ef8f6213
prerequisite-patch-id: 439fe909a37bc235622e8feacc2fc01429dcb4bb
-- 
Regards,

Laurent Pinchart


