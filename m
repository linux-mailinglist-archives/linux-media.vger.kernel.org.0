Return-Path: <linux-media+bounces-41831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA03B454DD
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 12:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE3E3189A76C
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14232D7817;
	Fri,  5 Sep 2025 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R+mJNJ2W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955142D028A;
	Fri,  5 Sep 2025 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068800; cv=none; b=XXuTiPAqebmqmCPYAFbtilxfXZ7vQgF6noQGd9gbEO+0ur32WrO7Spp5S2/zkiUvVMLi2g+9RJONcBp1oTEZmgi20FAMDPM6StlTIP27vOIQBA/cp4jrdW94syDW+5DUtcyOIB7lIEMt5jy222HvJYeAn1vCbjaHLvdGv704Ih8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068800; c=relaxed/simple;
	bh=/SlyzfgVaz5SVbHY0pSaBSJpooFqAIbmo2KGxi6A7lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTqghEKeL9dN76TbPs/H1C2WWV3ZkfjYxLBmc7QCGCa1470CMjW85XdCUXwDEGO3Rz3Q+DFzqGBpeGGkVel7aCmSwjeYd0E0askLBgeXxm6176DM1axqEpVUuLN7kYxit3G3E97ZckmEHOWnBHkRewRLXjk6D7OTULtSI0o6TwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R+mJNJ2W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE792F09;
	Fri,  5 Sep 2025 12:38:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757068725;
	bh=/SlyzfgVaz5SVbHY0pSaBSJpooFqAIbmo2KGxi6A7lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+mJNJ2WN1VUDWHCViREJhjMRCETKXoNXhNDEpstTFTfyNPtbIRFOpHPs94r7JQuY
	 jYFarguhGnF56o+0wsg2oMQKIkA+4f5dJtUwNqZYCckCLQ50eJTLsbjfLhFIqWl5q/
	 Y++NY7IsLJgaow7cQm668/4aaWsPkM8pnInBNF3M=
Date: Fri, 5 Sep 2025 12:39:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/8] media: Introduce V4L2 extensible parameters
Message-ID: <7l6ahcvujnpfqhzqsviwo72oyhenvcqklj4adivx5yv6fmux5o@bzpgpmmtgntc>
References: <20250820-extensible-parameters-validation-v4-0-30fe5a99cb1f@ideasonboard.com>
 <784dcb9e-4e72-44ca-975e-4eb1b0eed5cf@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <784dcb9e-4e72-44ca-975e-4eb1b0eed5cf@nxp.com>

Hello Antoine

On Fri, Sep 05, 2025 at 12:14:39PM +0200, Antoine Bouyer wrote:
> Hi Jacopo
>
> On 20/08/2025 14:58, Jacopo Mondi wrote:
> > Extensible parameters meta formats have been introduced in the Linux
> > kernel v6.12 initially to support different revision of the RkISP1 ISP
> > implemented in different SoC. In order to avoid breaking userspace
> > everytime an ISP configuration block is added or modified in the uAPI
> > these new formats, which are versionated and extensible by their
> > definition have been introduced.
> >
> > See for reference:
> > e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
> > 6c53a7b68c5d ("media: rkisp1: Implement extensible params support")
> >
> > The Amlogic C3 ISP driver followed shortly, introducing an extensible
> > format for the ISP configuration:
> >
> > 6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")
> >
> > with a very similar, if not identical, implementation of the routines to
> > validate and handle the ISP configuration in the ISP driver in the
> > c3-isp-params.c file.
> >
> > fb2e135208f3 ("media: platform: Add C3 ISP driver")
> >
> > With the recent upstreaming attempt of the Mali C55 ISP driver from Dan,
> > a third user of extensible parameters is going to be itroduced in the
> > kernel, duplicating again in the driver the procedure for validating and
> > handling the ISP configuration blocks
> >
> > https://patchwork.linuxtv.org/project/linux-media/patch/20250624-c55-v10-15-54f3d4196990@ideasonboard.com/
> >
> > To avoid duplicating again the validation routines and common types
> > definition, this series introduces v4l2-params.c/.h for the kAPI
> > and v4l2-extensible-params.h for the uAPI and re-organize the RkISP1
> > and Amlogic C3 drivers to use the common types and the helper validation
> > routines.
> >
>
> I'm currently working on another ISP driver: NXP neo, and also use extended
> params so as RkISP1.
>

Nice to hear!

> Using common types looks like really interesting approach. However, only
> params are taken into account, while NXP neo also provides statistics. I'm
> currently testing extended approach for both params AND statistics. But
> v4l2-params only applies to .. params, as stated in the name.
>
> Is there any plan to apply the same to statistics ?
>

Not a proper plan at the moment, but I agree it would indeed be
beneficial to have a similar approach for stats...

Are you suggesting we should drop 'params' at least from the file
names ?

> > If the here proposed approach is accepted, I propose to rebase the Mali
> > C55 driver on top of this series, to use the new common types and
> > helpers.
> >
> > I have been able to test this on RkISP1 but not on C3.
>
> Also tested on NXP neo locally.

Great, could you maybe send a Tested-by tag ?

Also, not sure if you have noticed this series for libcamera
https://patchwork.libcamera.org/project/libcamera/list/?series=5413
where I tried to generalize the extensible param helpers.

Thanks
  j

>
> Best regards
> Antoine
>
> >
> > Thanks
> >    j
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> > Changes in v4:
> > - Fix the definition of V4L2_PARAMS_FL_PLATFORM_FLAGS
> > - Add __counted_by() attribute to the data[] flexible-array member of
> >    v4l2_params_buffer
> > - Minor style change
> > - Link to v3: https://lore.kernel.org/r/20250819-extensible-parameters-validation-v3-0-9dc008348b30@ideasonboard.com
> >
> > Changes in v3:
> > - Rebased on latest media-committers/next
> > - Take in Dan's suggestion in block size validation
> > - Documentation minor spelling fixes
> > - Link to v2: https://lore.kernel.org/r/20250710-extensible-parameters-validation-v2-0-7ec8918ec443@ideasonboard.com
> >
> > Changes in v2:
> > - Make v4l2_params_buffer directly usable
> > - Centralize ENABLE/DISABLE flags definition and validation
> > - Take in Dan's v4l2_params_buffer_size()
> > - Allow blocks to only contain the header if they're going to be
> >    disabled
> > - Documentation fixes as reported by Nicolas
> > - Link to v1: https://lore.kernel.org/r/20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com
> >
> > ---
> > Jacopo Mondi (8):
> >        media: uapi: Introduce V4L2 extensible params
> >        media: uapi: Convert RkISP1 to V4L2 extensible params
> >        media: uapi: Convert Amlogic C3 to V4L2 extensible params
> >        media: Documentation: uapi: Add V4L2 extensible parameters
> >        media: v4l2-core: Introduce v4l2-params.c
> >        media: rkisp1: Use v4l2-params for validation
> >        media: amlogic-c3: Use v4l2-params for validation
> >        media: Documentation: kapi: Add v4l2 extensible parameters
> >
> >   Documentation/driver-api/media/v4l2-core.rst       |   1 +
> >   Documentation/driver-api/media/v4l2-params.rst     |   5 +
> >   .../media/v4l/extensible-parameters.rst            |  89 ++++++
> >   .../userspace-api/media/v4l/meta-formats.rst       |   1 +
> >   MAINTAINERS                                        |  10 +
> >   .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 263 ++++++----------
> >   .../media/platform/rockchip/rkisp1/rkisp1-params.c | 349 +++++++++------------
> >   drivers/media/v4l2-core/Makefile                   |   3 +-
> >   drivers/media/v4l2-core/v4l2-params.c              | 126 ++++++++
> >   include/media/v4l2-params.h                        | 164 ++++++++++
> >   include/uapi/linux/media/amlogic/c3-isp-config.h   |  48 +--
> >   include/uapi/linux/media/v4l2-extensible-params.h  | 146 +++++++++
> >   include/uapi/linux/rkisp1-config.h                 |  67 ++--
> >   13 files changed, 817 insertions(+), 455 deletions(-)
> > ---
> > base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
> > change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b
> >
> > Best regards,

