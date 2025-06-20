Return-Path: <linux-media+bounces-35479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38432AE1874
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 12:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D07F03AC53E
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 10:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC7F284691;
	Fri, 20 Jun 2025 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hp2zdNEb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66FC28469A
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413704; cv=none; b=iz2Zd9dS9oyGcH67gDmpSfyEwe6zkcLw97j4wkxGkct8mEne70ShmwHIMEERyGM4d1pSpih0xQkvpHBWYnJVVZfsqdF7gDUlVM2fhkamzXqKmekfxZGaoBKT59e99cmBfkOo/RBUPSi35tKrRW/GAWUrXIIzqpoyDsiqn8jHlKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413704; c=relaxed/simple;
	bh=6w+0d6ioUaATmDfxcPZK5atUH1pn20um7PEkXHint1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iagmGpFihHnc25gaPl6RSLzp35slwPxAk0SoM+LkWPdTVjzztrBAWxrwLKNI4E3VSdwj9hpFqi2AAA6L8XdCFX+aK/kBd4lG8pWJhn3Ei2Qik7eUR4ERZHx7/z6i9G9jh5Dhqo288jE22QvAodojT/Mi6+hTZ2KhnbULdLG8f8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hp2zdNEb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D93B9C0B;
	Fri, 20 Jun 2025 12:01:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750413685;
	bh=6w+0d6ioUaATmDfxcPZK5atUH1pn20um7PEkXHint1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hp2zdNEbaby5WxwYaTOL5L19oNRiq/vAooNMs8t5u7Avl3oeZPFdN2jEsInRntET3
	 MjhO/MVKlhjakfS3Z/VQ1M2I9wNk9aZcdpH+xPyq4koX6vMF4YKI4hUifW+WVum65v
	 jEnAa96n4E+UQRpXCwSJUcXOpJL6TUKA52jCIQK0=
Date: Fri, 20 Jun 2025 12:01:36 +0200
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
Subject: Re: [PATCH v10 08/64] media: Documentation: Refer to internal pads
 in metadata documentation
Message-ID: <5wzdogevsfx2p2ecpy2vhz5igcut3pmovpg3n56ovpvdur4hi6@yjhitjftdhn5>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-9-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-9-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:57:40PM +0300, Sakari Ailus wrote:
> Metadata is intended to be used with internal pads when it comes to the
> source of the data. Document this.

Isn't this more likely something:

Generic metadata formats are intended to be used along the media
pipeline while the actual metadata format is reported by the
V4L2_CID_METADATA_LAYOUT control value. Document this.

Which makes me wonder if this isn't better merged with the patch I
assume comes later in the series that introduces that control.

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/userspace-api/media/v4l/metafmt-generic.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-generic.rst b/Documentation/userspace-api/media/v4l/metafmt-generic.rst
> index 78ab56b21682..90a1bc2ea15e 100644
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

s/by an/by the/ ?

> +<image_source_control_metadata_layout>` of the source sub-device. See also
> +:ref:`source routes <subdev-routing>`.
>
>  .. _v4l2-meta-fmt-generic-8:
>
> --
> 2.39.5
>
>

