Return-Path: <linux-media+bounces-16922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A31959609F4
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 14:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FC2FB21159
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0603A1A01BC;
	Tue, 27 Aug 2024 12:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v96LigO3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D18619D08C
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 12:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761294; cv=none; b=nikvfiNlDJCP2ZpgTnq810MCL3hPKPN122e9XLCWG6UiUl1gJtu4q2VDS9qW/3eUJvRrcalNtA7W2uQJKO8Lu+cSogjBzZ/3/JeXP4Vns2uUSPUlKXWVuxPp4bVD4BryZRPMl8UF0aGeNfnFLsOzxDyy7ejJVYnZqrw11SBwNpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761294; c=relaxed/simple;
	bh=gYFbggpUIcjozh8uXfitok+HJo0yILVF8md++1GKmsY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZvAMi+6+ccQwfg9jeu7UdlSGAxh5NAFKMfmoFYMZxDGevZtZ+saqdsMVVYccLBkIWWM2FMOd5O3LvkRLvSLYwYM2mrQ7mJSQXD1JZAq7CSR2uqc+Qw/hwdybu85aI2/qPwqMAFgUdqOSSdEWCEzZ2U165OBAfcsPYGKRHDdLp4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v96LigO3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB1BB9FF;
	Tue, 27 Aug 2024 14:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724761223;
	bh=gYFbggpUIcjozh8uXfitok+HJo0yILVF8md++1GKmsY=;
	h=Date:From:To:Cc:Subject:From;
	b=v96LigO3cMCR7wG+lJRV8g9VcRp8dkWcZfSrEJxA996CWqeGFpJfUZl0tyuNHRTYq
	 BTRH2MtwhL222HLUB7Uy7BJiAoX7tc8GuXc/j7uSfC2K47gFUBioOczfVtwYx3YjwE
	 bMyFVHNGG/Mz8MysGTVFj5GASGOIiquyimrg/GR0=
Date: Tue, 27 Aug 2024 15:21:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [GIT PULL FOR v6.12] videobuf2 fix
Message-ID: <20240827122125.GA17846@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Mauro, Hans,

The following changes since commit ea2e2ea551abf0ce8350f82e8cd431b7f8a1e5e9:

  media: dt-bindings: qcom,sc7280-venus: Allow one IOMMU entry (2024-08-25 09:16:08 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/next-media-videobuf-20240827

for you to fetch changes up to e5700c9037727d5a69a677d6dba25010b485d65b:

  media: videobuf2: Drop minimum allocation requirement of 2 buffers (2024-08-27 14:57:38 +0300)

----------------------------------------------------------------
media: videobuf2 regression fix

----------------------------------------------------------------
Laurent Pinchart (1):
      media: videobuf2: Drop minimum allocation requirement of 2 buffers

 drivers/media/common/videobuf2/videobuf2-core.c | 7 -------
 1 file changed, 7 deletions(-)

-- 
Regards,

Laurent Pinchart


