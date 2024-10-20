Return-Path: <linux-media+bounces-19943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9C9A5755
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 00:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD6E8282795
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 22:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02923198E63;
	Sun, 20 Oct 2024 22:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m1nq0WJl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D3520E31D
	for <linux-media@vger.kernel.org>; Sun, 20 Oct 2024 22:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729462517; cv=none; b=o1yZI2OrYT5WbgsJG9wPcvrBcOsF8Whn1Dc2SpgQuMZj/Rgdfmr8kXUXew0yJKqmim1cA4Kayl5JP+kCvFZFksBWl9xJZyOsAAog2QH8Zxp+8A5bnB6LRLBZokUovr5PGUgNmKgjNIXpDx9eFS3QAC6M3/ncI36nv9QSEaHUMco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729462517; c=relaxed/simple;
	bh=5dR8Bo1FIeI7u7KeJ6TvItQr4kJ7LFMQ5v9/uIp+KgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QvS6M81JcdrvqDMV2Q6wnGxTL9phARY7fsNKg+/Jo2soC42g6586Zgievk7KXtcKT8YMggr2rFwNpBA7Jy+gMCpB0D7WkbT7LxnGOpfjWYS1qSyJdI6uUSVCVFjy4YJJb5Rmsam9Oze45m0fLqtofjR43K39dL2eam2mkPFcv20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m1nq0WJl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2D864CF;
	Mon, 21 Oct 2024 00:13:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729462403;
	bh=5dR8Bo1FIeI7u7KeJ6TvItQr4kJ7LFMQ5v9/uIp+KgE=;
	h=Date:From:To:Cc:Subject:From;
	b=m1nq0WJlWgpJ7iGg6UvMyVv/hcKwU6Cl5n3ihgwEABsehgpe4Hi2rjlOJ6134OJ2N
	 16Yw6H+fxQSnIK12fUvXxjjc9sK9a3oZuVUm/u0eTc4yBOLkuhds4si+I8woxJEfJU
	 SVesGQ2L53w0rCpUBX53PTWpIwc6gC35iL0+aAic=
Date: Mon, 21 Oct 2024 01:15:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [GIT PULL FOR v6.13] rzg2l-cru driver improvements
Message-ID: <20241020221502.GM7770@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit 698b6e3163bafd61e1b7d13572e2c42974ac85ec:

  media: atomisp: Replace ternary operator with if (2024-10-16 09:32:42 +0200)

are available in the Git repository at:

  git@gitlab.freedesktop.org:linux-media/users/pinchartl.git tags/next-media-renesas-20241021

for you to fetch changes up to 1819a61e4c77189a0183697c0513fefb9bedf462:

  media: renesas: rzg2l-cru: Add 'yuv' flag to IP format structure (2024-10-21 00:45:08 +0300)

CI pipeline results available at
https://gitlab.freedesktop.org/linux-media/users/pinchartl/-/pipelines/1293997

----------------------------------------------------------------
media: rzg2l-cru improvements

----------------------------------------------------------------
Biju Das (1):
      media: platform: rzg2l-cru: rzg2l-video: Set AXI burst max length

Lad Prabhakar (23):
      media: rzg2l-cru: Use RZG2L_CRU_IP_SINK/SOURCE enum entries
      media: rzg2l-cru: Mark sink and source pad with MUST_CONNECT flag
      media: rzg2l-cru: csi2: Mark sink and source pad with MUST_CONNECT flag
      media: rzg2l-cru: csi2: Use ARRAY_SIZE() in media_entity_pads_init()
      media: rzg2l-cru: csi2: Implement .get_frame_desc()
      media: rzg2l-cru: Retrieve virtual channel information
      media: rzg2l-cru: Remove `channel` member from `struct rzg2l_cru_csi`
      media: rzg2l-cru: Use MIPI CSI-2 data types for ICnMC_INF definitions
      media: rzg2l-cru: Remove unused fields from rzg2l_cru_ip_format struct
      media: rzg2l-cru: Remove unnecessary WARN_ON check in format func
      media: rzg2l-cru: Simplify configuring input format for image processing
      media: rzg2l-cru: Inline calculating image size
      media: rzg2l-cru: Simplify handling of supported formats
      media: rzg2l-cru: Inline calculating bytesperline
      media: rzg2l-cru: Make use of v4l2_format_info() helpers
      media: rzg2l-cru: Use `rzg2l_cru_ip_formats` array in enum_frame_size
      media: rzg2l-cru: csi2: Remove unused field from rzg2l_csi2_format
      media: rzg2l-cru: video: Implement .link_validate() callback
      media: rzg2l-cru: csi2: Use rzg2l_csi2_formats array in enum_frame_size
      media: rzg2l-cru: Refactor ICnDMR register configuration
      media: rzg2l-cru: Add support to capture 8bit raw sRGB
      media: rzg2l-cru: Move register definitions to a separate file
      media: renesas: rzg2l-cru: Add 'yuv' flag to IP format structure

 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |   3 +-
 .../platform/renesas/rzg2l-cru/rzg2l-cru-regs.h    |  80 ++++++
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  28 +-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |  39 ++-
 .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |  85 ++++--
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 288 ++++++++-------------
 6 files changed, 321 insertions(+), 202 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h


-- 
Regards,

Laurent Pinchart

