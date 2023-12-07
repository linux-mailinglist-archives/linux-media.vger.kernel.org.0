Return-Path: <linux-media+bounces-1851-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5505C808B0B
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 15:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5F59282FA3
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 14:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B16644363;
	Thu,  7 Dec 2023 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aCgRpH77"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17512AC
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 06:51:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 930ED669;
	Thu,  7 Dec 2023 15:50:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701960639;
	bh=mmIkfVQc68N7JNAoTaRx+5k1CZ6tmq9+BC7ujGbLecQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aCgRpH77mR7UtKnvDAQOpecUIDW09gbrBDTIQtXK9MY9OJjDm2ew2SPq3rDh947tJ
	 TEUCZhbLOzewpl/rHEVyZXV9t8hlauqH2BMe7IkXa5hvBk1LByS/GPOX1tir8DGE4z
	 kWQW3vhdyrL87BbLtFQYANHNgLkPTj68n/woZvJw=
Date: Thu, 7 Dec 2023 16:51:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	kieran.bingham@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com
Subject: Re: [PATCH v2 0/4] media: rkisp1: Misc fixes and debug
Message-ID: <20231207145127.GB17373@pendragon.ideasonboard.com>
References: <20231201140433.2126011-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231201140433.2126011-1-paul.elder@ideasonboard.com>

Hi Paul,

Thank you for the patches.

On Fri, Dec 01, 2023 at 11:04:29PM +0900, Paul Elder wrote:
> This series adds a small cleanup of the register definitions, as well as
> some additions to the debug for the rkisp1 driver.
> 
> Paul Elder (4):
>   media: rkisp1: regs: Consolidate MI interrupt wrap fields
>   media: rkisp1: debug: Add register dump for IS
>   media: rkisp1: debug: Count completed frame interrupts
>   media: rkisp1: debug: Consolidate counter debugfs files

I'll take patch 1/4 to 3/4 in my tree already, while the discussion on
4/4 continues. Please let me know if you would rather have me wait.

>  .../platform/rockchip/rkisp1/rkisp1-capture.c |  2 +
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  5 ++
>  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 71 +++++++++++++------
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     |  2 +
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  9 +--
>  5 files changed, 60 insertions(+), 29 deletions(-)

-- 
Regards,

Laurent Pinchart

