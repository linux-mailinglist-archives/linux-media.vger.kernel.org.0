Return-Path: <linux-media+bounces-172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0269C7E9454
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 03:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B4B5B208C6
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 02:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46175232;
	Mon, 13 Nov 2023 02:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QViYZHSn"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDF3469D
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 02:00:51 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA95B172B
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 18:00:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C8DE29A
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 03:00:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699840823;
	bh=76N/cDDQAA7sbS5tPMrgfS7b5fw27UhLCjmn4O8Y33E=;
	h=Date:From:To:Subject:From;
	b=QViYZHSndurRw3crlWBVTF1iufTm2ChnEHxSESctdn4B+xZSKK8AAWiPgZlkbq9Mp
	 w8Ie8DP4ckTOuq4zwH1fwTz0G/kXWqqqcHa9o+nNqqOnmA8ACNW/Y0v6tvITOPkPs8
	 mUmva5pHQRfUkCE5f9EENe6W7pYlG9XxLaw+z8qU=
Date: Mon, 13 Nov 2023 04:00:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v6.7] Renesas R-Car VSP1 regression fix
Message-ID: <20231113020054.GA18039@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Mauro, Hans,

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-renesas-fixes-20231113

for you to fetch changes up to 42d62b7e47d58273c64fc1540e5d81ccfdb60f77:

  media: vsp1: Remove unbalanced .s_stream(0) calls (2023-11-13 03:40:13 +0200)

I will have more VSP1 patches for v6.8 that depend on this one, so once
the pull request gets merged in the media fixes branch, could you please
also merge it (*not* cherry-pick) into the master branch for v6.8 ?

----------------------------------------------------------------
Renesas R-Car VSP1 driver regression fix

----------------------------------------------------------------
Laurent Pinchart (1):
      media: vsp1: Remove unbalanced .s_stream(0) calls

 drivers/media/platform/renesas/vsp1/vsp1_pipe.c |  2 +-
 drivers/media/platform/renesas/vsp1/vsp1_rpf.c  | 10 +--------
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.c |  8 +++++--
 drivers/media/platform/renesas/vsp1/vsp1_rwpf.h |  4 +++-
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c  | 29 +++----------------------
 5 files changed, 14 insertions(+), 39 deletions(-)

-- 
Regards,

Laurent Pinchart

