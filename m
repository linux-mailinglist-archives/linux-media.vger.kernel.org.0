Return-Path: <linux-media+bounces-41431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF65B3E242
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 14:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CDC3440003
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 12:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0830C2586FE;
	Mon,  1 Sep 2025 12:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l9GXMTNH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0711E258EDD
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756728487; cv=none; b=DqMyv8mVekmV4YRxCDJjLL5ZRI/cR33AtYmpLRkNcG3AFOo2zYMyite9hY0/Z7vDlrMkFGmSdWXPTwtdGGQnIrGZ26pPs05gtN2J8HOzGfws4FOISQnnTl29mjA2kLJRaHLGNinTGAXv34SfCG+mygI4VGmVA+gQItoto49tmH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756728487; c=relaxed/simple;
	bh=pX2uja4tQdl8lDbavnVVX+J0uz03DE2Dx8qz5MViie8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKNjO3PnZmKpVELV3YnyWYI7gtDKbMyQEWlOBab6Yo2CSqVpVhuRBWy8EUVD+xc82YCHOqTdxXDWdWuSoKSt228JCnP0BWA562tObsF4cZAF6ykVn5HyRE8I7LmfoWvA7xhu1Do5rUNtXohGEtx56l9KdjSl4U6xWb5X4LUWOP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=l9GXMTNH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E64D8E92;
	Mon,  1 Sep 2025 14:06:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756728417;
	bh=pX2uja4tQdl8lDbavnVVX+J0uz03DE2Dx8qz5MViie8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l9GXMTNHVIvaAP1cs7aW25KvquRaM5VAoYw19DuDxaeOePP67jLUm90eENrq4n+Xk
	 6lhK4IrkolaSvKK1C7bQgy8vUK48zXdyrJVxWRklFlFrrYhY8k0+nRQMUQ9asGdDF4
	 s5tbahtvfrG16xeEmBth+qsAVBNsSbEBJ25KkjPM=
Date: Mon, 1 Sep 2025 14:08:01 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 14/66] media: Documentation: Refer to internal pads
 in metadata documentation
Message-ID: <tjvbo4qgvlb2iqqeys4pucz3w535fmqqnl2zz5cvmwigrz2prw@wgmeur7h4t5e>
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

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:15PM +0300, Sakari Ailus wrote:
> Metadata is intended to be used with internal pads when it comes to the
> source of the data. Document this.

The commit title and description do not match the patch content
anymore

With these updated:
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

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
> +layout is reported by an :ref:`V4L2_CID_METADATA_LAYOUT control
> +<image_source_control_metadata_layout>` of the source sub-device. See also
> +:ref:`source routes <subdev-routing>`.
>
>  .. _v4l2-meta-fmt-generic-8:
>
> --
> 2.47.2
>
>

