Return-Path: <linux-media+bounces-5276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D939857C4C
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 13:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF6181F236A1
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 12:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EF978688;
	Fri, 16 Feb 2024 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CHU/Os2n"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF561BC57
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 12:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708085264; cv=none; b=kKHkI8YFYC9za4anSVd1+Ur5TQ9LPxKFB5IgUdOrtxaTvZ7QRSS5+xhdzfh+PiMhduYQcdrGcQuCsGAY5P25PSyR2WbsjmXgna2XeEzMtqmIzwXCuS1iMv9GIKzfgz5oDsIYz3byJKENTgMJebi9kWM43ILgsMmTPromN+Mc8yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708085264; c=relaxed/simple;
	bh=GOnahRLX2P8mzW7BlfinqgNqsClAbd1mWw0+yc1uRfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=byoENWsqCmm9g6zrfJ92VtGGGKTFBH1GFVCD3kZJp6W3DV2beS7TnB4ZXOpWVEuBmuHXof+25tQy4aet1h9BWWIIPSn0gqw3xIEvGqVNqDO50mVS4gFBcInS278wRfKsLF7mUTSTTnaPuLgdNSUSMI8EXc64X3TMhYNcQzxTtsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CHU/Os2n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C71C56B3;
	Fri, 16 Feb 2024 13:07:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708085256;
	bh=GOnahRLX2P8mzW7BlfinqgNqsClAbd1mWw0+yc1uRfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHU/Os2nu7fSK9Z/1ebsMJa4YzHcuPfKePlqNwuGebHkOUmtPyJS+bSWBUXdQy6xJ
	 gcz1n8peyWmA8vDZFl/N26lzKYOtmYsbmTdwQ6T66/5KXHjYeu+BESY+cmLThCiltq
	 Qra6gjCFyy/uBV2xqBba9srEpS/b7Mk8mXH+WVEE=
Date: Fri, 16 Feb 2024 14:07:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?8J+Qpy1tZWRpYQ==?= <linux-media@vger.kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [GIT FIXES FOR v6.8] rkisp1 regression fix
Message-ID: <20240216120744.GA32343@pendragon.ideasonboard.com>
References: <20240128173245.GE27180@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240128173245.GE27180@pendragon.ideasonboard.com>

Ping. This must land in v6.8, it's becoming urgent.

On Sun, Jan 28, 2024 at 07:32:45PM +0200, Laurent Pinchart wrote:
> Hi Hans and Mauro,
> 
> The following changes since commit b32431b753217d8d45b018443b1a7aac215921fb:
> 
>   media: vb2: refactor setting flags and caps, fix missing cap (2024-01-24 17:27:51 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/media-fixes-rkisp1-20240128
> 
> for you to fetch changes up to f3a16731f6c03d01198477743212198c608ac4d8:
> 
>   media: rkisp1: Fix IRQ handling due to shared interrupts (2024-01-28 19:07:39 +0200)
> 
> ----------------------------------------------------------------
> rkisp1 regression fix for v6.8
> 
> ----------------------------------------------------------------
> Tomi Valkeinen (2):
>       Revert "media: rkisp1: Drop IRQF_SHARED"
>       media: rkisp1: Fix IRQ handling due to shared interrupts
> 
>  .../platform/rockchip/rkisp1/rkisp1-capture.c      |  3 +++
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h |  2 ++
>  .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |  3 +++
>  .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 24 +++++++++++++++++++++-
>  .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |  3 +++
>  5 files changed, 34 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

