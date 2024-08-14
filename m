Return-Path: <linux-media+bounces-16298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4288F951BAD
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 15:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7289A1C22AB5
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 13:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8341AD9E3;
	Wed, 14 Aug 2024 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kxOjJH3k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B9B1879
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723641584; cv=none; b=UK3MdZKD39HBfdSHt2mAIl85v8rE04t8+HlQNVM9dAJCtA1qin6qxeKXyyARbeMnFaagI+n7Oxeh5B15KDK8/I1yiBM6ECB3POoYPuJTxhtCW2TFVRbjXlzzGpBbwPJFMiJwgDX2/ehO6TJIvdmMWpqMwy3Z7E1lEGiCuh91tpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723641584; c=relaxed/simple;
	bh=gkA1I7GOns0zYw9EGq8CTds5tyPQqD0qqcL5owFKhYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPZV03afEGyErIJQ2JnDdxhaGfxcK8PQ1OP4XWN//VjGGvAeaPh6qNeQuZmhAQoks9Vac4kMAotVh9X4IRNbfoUNLH0yurFTu9NgiRCZ1CXwvQBVP6wBkXuma1VErqRBlr5AGoKHhFCFpvF04EkbzzvDWRc1ehBmQ9kmkflXFBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kxOjJH3k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4402566F;
	Wed, 14 Aug 2024 15:18:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723641523;
	bh=gkA1I7GOns0zYw9EGq8CTds5tyPQqD0qqcL5owFKhYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kxOjJH3kZfQ1NyxOrDB+vZXz08hIV0SKXaUvMlD/q5XMxMlSI+Ki79CX9jDrH0YS5
	 7Ro35/aYE7r8khly5LRm1/EwcV2D4fMsafSBoco8t2kbjed1v44Z9HyRSt9LuwyA7d
	 gCzuXB+TPEaTmrhkm8TyoAjJRQAZ02Eb8RbipgTQ=
Date: Wed, 14 Aug 2024 16:19:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [GIT PULL FOR v6.12] rkisp1 extensible parameters format
Message-ID: <20240814131915.GB26073@pendragon.ideasonboard.com>
References: <20240812230545.GA2358@pendragon.ideasonboard.com>
 <70262640-21eb-452a-a24d-783b4bcd8d54@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <70262640-21eb-452a-a24d-783b4bcd8d54@xs4all.nl>

On Wed, Aug 14, 2024 at 12:02:39PM +0200, Hans Verkuil wrote:
> Hi Laurent,
> 
> On 13/08/2024 01:05, Laurent Pinchart wrote:
> > Hi Hans, Mauro,
> 
> commit 5ef3fcc8e42b43523498c7b0ede19a47fbdf8353 (media: rkisp1: Implement extensible params support)
> failed to push because the commit log contains a local changelog:
> 
>     ...
>     Implement parameter buffer validation for the extensible format at
>     .buf_prepare() time.
> 
>     Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>     Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>     Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>     Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
>     Tested-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>     Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>     Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>     ---
>     Changes since v10:
> 
>     - Use %zu to print size_t arguments
> 
> I can either just take these patches (i.e. I don't merge them), and manually remove
> this before committing, or you need to update your tree yourself.
> 
> If you decide to do the latter, then please add my:
> 
> 	Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> to patches 2 and 3 (uAPI changes).

Oooops. I'll resend now. I wonder how I didn't notice that.

> > 
> > The following changes since commit c80bfa4f9e0ebfce6ac909488d412347acbcb4f9:
> > 
> >   media: ti: cal: use 'time_left' variable with wait_event_timeout() (2024-08-09 07:56:39 +0200)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git tags/next-media-rkisp1-20240813
> > 
> > for you to fetch changes up to 32be6029c1c1e8c628077403b2096e9d9085f6c8:
> > 
> >   media: rkisp1: Add support for the companding block (2024-08-12 13:36:50 +0300)
> > 
> > ----------------------------------------------------------------
> > Extensible parameters support for the rkisp1 driver
> > 
> > ----------------------------------------------------------------
> > Jacopo Mondi (7):
> >       media: uapi: rkisp1-config: Add extensible params format
> >       media: uapi: videodev2: Add V4L2_META_FMT_RK_ISP1_EXT_PARAMS
> >       media: rkisp1: Add struct rkisp1_params_buffer
> >       media: rkisp1: Copy the parameters buffer
> >       media: rkisp1: Cache the currently active format
> >       media: rkisp1: Implement extensible params support
> >       media: rkisp1: Implement s_fmt/try_fmt
> > 
> > Laurent Pinchart (2):
> >       media: rkisp1: Add helper function to swap colour channels
> >       media: rkisp1: Add features mask to extensible block handlers
> > 
> > Ondrej Jirman (1):
> >       media: rkisp1: Adapt to different SoCs having different size limits
> > 
> > Paul Elder (3):
> >       media: rkisp1: Add register definitions for the companding block
> >       media: rkisp1: Add feature flags for BLS and compand
> >       media: rkisp1: Add support for the companding block
> > 
> >  Documentation/admin-guide/media/rkisp1.rst         |   11 +-
> >  .../userspace-api/media/v4l/metafmt-rkisp1.rst     |   57 +-
> >  .../media/platform/rockchip/rkisp1/rkisp1-common.c |   14 +
> >  .../media/platform/rockchip/rkisp1/rkisp1-common.h |   49 +-
> >  .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |    5 +-
> >  .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   15 +-
> >  .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |    9 +-
> >  .../media/platform/rockchip/rkisp1/rkisp1-params.c | 1037 ++++++++++++++++++--
> >  .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |   23 +
> >  .../platform/rockchip/rkisp1/rkisp1-resizer.c      |    4 +-
> >  .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |   51 +-
> >  drivers/media/v4l2-core/v4l2-ioctl.c               |    1 +
> >  include/uapi/linux/rkisp1-config.h                 |  578 +++++++++++
> >  include/uapi/linux/videodev2.h                     |    1 +
> >  14 files changed, 1689 insertions(+), 166 deletions(-)

-- 
Regards,

Laurent Pinchart

