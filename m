Return-Path: <linux-media+bounces-31479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AB3AA53EF
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 20:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFDC14E1E94
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 18:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EAF26D4D4;
	Wed, 30 Apr 2025 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QesXjgnE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B4E266B41
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 18:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038603; cv=none; b=UgOcMBKs5YiuuP0cbfZuyYgq3GlUusxoFZZdKV0AxgtF3D/FrzUfFnKj/kJhRLBlHKgK2bdSE5tWws5G1oOOhjsSzv5Thq6SdvPkbaAXv2wsf/ebhSX1XBOrq5zGuc3Gr0lZ4pXGVOc/6J7aUvLdIdCQNM3MjwYlkNObutrES48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038603; c=relaxed/simple;
	bh=11UqxkMxSvNPXrAdtZgTSrUbZ1HX15+He0fqToJxniY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MvtY2djE7Pi8kOlYzgkyLj4rvju4PnqWXG9mX26noGido9M7bAbUOcpO298iVBG2psn0vtzOYHVi6T+XiWDmLfNBOULxnBnwYcLcOQgYfK7cM+9THb6e7wzXUWGNJXO6xASXuI3HAUxTk/tO9t9Uoo6GM7YxRZGXDG++IzMnfbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QesXjgnE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDE2D725;
	Wed, 30 Apr 2025 20:43:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746038593;
	bh=11UqxkMxSvNPXrAdtZgTSrUbZ1HX15+He0fqToJxniY=;
	h=Date:From:To:Cc:Subject:From;
	b=QesXjgnETFNRkvoZ9FthlYdaePrMOJKChoDtfMsC4nLvuS5qEzziXu194P+JVBH2L
	 2TLwdnAn8Z17F488AmCvdvaQI3YWJ2InM9B0ACBOlhpJ/0IakkEfsNTdYeTpObmmgq
	 cDeXBZDaGnaHPAtpaqcGpC+wZZaPjtC4TyYbqWfI=
Date: Wed, 30 Apr 2025 21:43:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: [GIT PULL FOR v6.16] NXP media drivers changes
Message-ID: <20250430184311.GA30825@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Mauro, Hans,

The following changes since commit 543f81b86cf4046c7454a05c741c491a4fac44dd:

  media: rc: add keymap for Hauppauge Credit Card RC (2025-04-30 09:35:24 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20250430

for you to fetch changes up to 445f27243d3f1162934db242048e1eab4db1b6cc:

  media: rkisp1: Remove unnecessary defines (2025-04-30 20:53:38 +0300)

----------------------------------------------------------------
Miscellaneous fixes for NXP media drivers

----------------------------------------------------------------
Laurentiu Palcu (1):
      media: nxp: imx8-isi: better handle the m2m usage_count

Stefan Klug (1):
      media: rkisp1: Remove unnecessary defines

 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c   | 14 +++++++++++++-
 drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h |  7 -------
 2 files changed, 13 insertions(+), 8 deletions(-)

-- 
Regards,

Laurent Pinchart

