Return-Path: <linux-media+bounces-41695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B07B422F3
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 247ED5E1805
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9BA3126BF;
	Wed,  3 Sep 2025 14:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RGkbzTmP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E9631197D
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908098; cv=none; b=KbPV4ga/B7ieLZQAxnScF85pvORMlk0Skdcu4w/o9qUuRVpQ9WvzqOm8ATHevpFaHlFjkQjgopAhZ+zAdThiPG209QRWY/YvPtmlhxMoTo8DiP3+PZ28644dk0LhzkFGYFmYOVsJrWpjWJhr7ZIWn+CG8LK6A0sdElhSobNg/WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908098; c=relaxed/simple;
	bh=I78f0MPoA/bMPR5XDaEsOljbdsJMl+4DraS2JL1j/N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjB8iDL1+MhCZ7gTRgwzDbkbSJ9v+yht6SnDCK0beSQ24K9GScsSzVPOJeaAu/bF2d9lx3f80A34UbwlP0X9NJSdDce7eQ0U7RaWRXx0OtidKW34iIiOXeGFfrEl2Bx777dcNtFyr5G/WYUbNWjCjsqqssNEM2tFmgAgRW4c24E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RGkbzTmP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C6975C6D;
	Wed,  3 Sep 2025 16:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756908023;
	bh=I78f0MPoA/bMPR5XDaEsOljbdsJMl+4DraS2JL1j/N0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGkbzTmPEcwcMLRHvj7FcBCUqAxgF6euY1PrMHFucwujpd12+DclGit/eW42L8xmm
	 SbGqE94tx+llitUdZq4O7MkxS07mWBn9pvcqx2eK2GU0GL8Jg+eP2MC3UNEOzozzmg
	 juJCOwVjYX0eihlLis33AZ2cBrQNBPHO2735g8jE=
Date: Wed, 3 Sep 2025 16:01:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 14/66] media: Documentation: Refer to internal pads
 in metadata documentation
Message-ID: <20250903140111.GI3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-15-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-15-sakari.ailus@linux.intel.com>

On Mon, Aug 25, 2025 at 12:50:15PM +0300, Sakari Ailus wrote:
> Metadata is intended to be used with internal pads when it comes to the
> source of the data. Document this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/userspace-api/media/v4l/metafmt-generic.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> index 39d529c910a8..e8824b5a65d6 100644
> --- a/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> +++ b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> @@ -7,12 +7,17 @@ V4L2_META_FMT_GENERIC_8 ('MET8'), V4L2_META_FMT_GENERIC_CSI2_10 ('MC1A'), V4L2_M
>  
>  Generic line-based metadata formats
>  
> +.. _v4l2-format-generic-meta:
>  
>  Description
>  ===========
>  
>  These generic line-based metadata formats define the memory layout of the data
> -without defining the format or meaning of the metadata itself.
> +without defining the format or meaning of the metadata itself. These formats may
> +only be used with a Media Controller pipeline where the more specific metadata

Maybe "exact" matadata layout instead of "more specific".

> +layout is reported by an :ref:`V4L2_CID_METADATA_LAYOUT control

s/an/the/

> +<image_source_control_metadata_layout>` of the source sub-device. See also

I would write

layout is reported using the :ref:`V4L2_CID_METADATA_LAYOUT control
<image_source_control_metadata_layout>` by the sub-device generating the
metadata. See also

(or possibly s/using/through/).

With the updated commit message you proposed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +:ref:`source routes <subdev-routing>`.
>  
>  .. _v4l2-meta-fmt-generic-8:
>  

-- 
Regards,

Laurent Pinchart

