Return-Path: <linux-media+bounces-4560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 874F78458AD
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 14:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2471F1F280F4
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 13:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBB35336F;
	Thu,  1 Feb 2024 13:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wXVldkcf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0104A3A1BC
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706793462; cv=none; b=lwZhm2eQtCKy5rEOvuBH97ySyZE//476otmlGWosxs05LZkVKjK3kVuoWDP9rM8fQWG1YMsjkgGJy1M+zKblc5ZNLXddMvftrPGOQx3YLqUcz9dRtnWf4W5xBXGzCiEuGzce6gjvC9cmXc9fAb5RpO8OMjGPxMpcaZj6T6Y23ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706793462; c=relaxed/simple;
	bh=8Jf+vg4kVKtXTW7i4RgIAwlHnabQHaRedGilANJK2lQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GKD65KeWA9/9kG812KBc1GAFg3Afl9zLgXAmJuWQlOmQwrgnBIVDz8NSb0aZ39jQNMjMykUsblL54Nu2/VSMNYnOFnsAWn/91wvZAHqfFTVdYhicf1vX1oSrwbBR+cUEoDAwZ6fIa9NqZ4kVQPivzLeue0BFtfTFss1Kf4TLvfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wXVldkcf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [94.107.229.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39376613C
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 14:16:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706793378;
	bh=8Jf+vg4kVKtXTW7i4RgIAwlHnabQHaRedGilANJK2lQ=;
	h=Date:From:To:Subject:From;
	b=wXVldkcf1LpJ2+nnspidiprEwaxNT+5Q7a19fi5uYPSZxc4g9Ef+GFeROmHYsk24m
	 Xhm3WrouqvrldaHP2ZCUhoRyzxQWQliJWUUtNags1zlgmQbyd3vIiumpf9jU5pArt9
	 mZ48J7T8TV7vlDoNa5Tj3vaxqm4d5oPgSdDQhy3Q=
Date: Thu, 1 Feb 2024 15:17:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Subject: [GIT PULL FOR v6.9] MUST_CONNECT & imx8-isi fixes
Message-ID: <20240201131737.GA5344@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Hans and Mauro,

The following changes since commit feb8831be9d468ee961289c6a275536a1ee0011c:

  media: ov08x40: Reduce start streaming time (2024-02-01 13:45:19 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-imx-next-20240131

for you to fetch changes up to 87a913cc4385da5313208ae240484fa2c591eb2e:

  media: nxp: imx8-isi: Factor out a variable (2024-02-01 15:12:32 +0200)

----------------------------------------------------------------
- Fix handling of MEDIA_PAD_FL_MUST_CONNECT flag in V4L2 core
- Fix MUST_CONNECT-related crash in the imx8-isi driver
- Fix compiler warning in imx8-isi driver

----------------------------------------------------------------
Laurent Pinchart (6):
      media: mc: Add local pad to pipeline regardless of the link state
      media: mc: Fix flags handling when creating pad links
      media: mc: Add num_links flag to media_pad
      media: mc: Rename pad variable to clarify intent
      media: mc: Expand MUST_CONNECT flag to always require an enabled link
      media: nxp: imx8-isi: Mark all crossbar sink pads as MUST_CONNECT

Marek Vasut (1):
      media: nxp: imx8-isi: Check whether crossbar pad is non-NULL before access

Ricardo Ribalda (1):
      media: nxp: imx8-isi: Factor out a variable

 .../userspace-api/media/mediactl/media-types.rst   | 11 ++-
 drivers/media/mc/mc-entity.c                       | 93 ++++++++++++++++------
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |  4 +-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  8 +-
 include/media/media-entity.h                       |  2 +
 5 files changed, 81 insertions(+), 37 deletions(-)

-- 
Regards,

Laurent Pinchart

