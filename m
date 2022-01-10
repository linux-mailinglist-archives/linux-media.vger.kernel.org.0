Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58FB4489785
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 12:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244833AbiAJLco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 06:32:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244775AbiAJLcX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 06:32:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED904C061748;
        Mon, 10 Jan 2022 03:32:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4ED32A50;
        Mon, 10 Jan 2022 12:32:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641814341;
        bh=eX1/BiYxwQ831RKDWij1jdfm+j8FhRTuyLRMBWLOFbs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vyidJal6AHQtZvJVED6aOq3txhCXObIZfiokmM61zuo3EBWwesnpZUvSIkD7RGpNU
         044bGVDvAjH4eaVuVRmyLgmqbemMD8O0quQAOzj74BP48W9iaoBjWNVSz3Ww9fGP0I
         uUYXmNaupd3NLM6Yc7mKswGzHVCCadSiPtFifse4=
Date:   Mon, 10 Jan 2022 13:32:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: Re: [PATCH v2 08/11] media: i2c: max9286: Define macros for all bits
 of register 0x15
Message-ID: <YdwZPCCULRGg5w/E@pendragon.ideasonboard.com>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-9-laurent.pinchart+renesas@ideasonboard.com>
 <20220109103738.fqyehzvj4hgggu6w@uno.localdomain>
 <Ydtt+TsZ56qv8G27@pendragon.ideasonboard.com>
 <4ef0af5a-36cd-fd40-73f0-3e5c746e7882@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4ef0af5a-36cd-fd40-73f0-3e5c746e7882@omp.ru>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

On Mon, Jan 10, 2022 at 01:37:51PM +0300, Sergey Shtylyov wrote:
> Hello!
> 
> On 1/10/22 2:21 AM, Laurent Pinchart wrote:
> 
> >>> Macros are easier to read than numerical values.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>> ---
> >>>  drivers/media/i2c/max9286.c | 27 ++++++++++++++++++---------
> >>>  1 file changed, 18 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> >>> index 24c2bf4fda53..4b69bd036ca6 100644
> >>> --- a/drivers/media/i2c/max9286.c
> >>> +++ b/drivers/media/i2c/max9286.c
> [...]
> >>> @@ -810,13 +815,17 @@ static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
> >>>  		}
> >>>
> >>>  		/*
> >>> -		 * Enable CSI output, VC set according to link number.
> >>> -		 * Bit 7 must be set (chip manual says it's 0 and reserved).
> >>> +		 * Configure the CSI-2 output to line interleaved mode (W x (N
> >>> +		 * x H), as opposed to the (N x W) x H mode that outputs the
> >>> +		 * images stitched side-by-side) and enable it.
> >>>  		 */
> >>> -		max9286_write(priv, 0x15, 0x80 | MAX9286_VCTYPE |
> >>> -			      MAX9286_CSIOUTEN | MAX9286_0X15_RESV);
> >>> +		max9286_write(priv, 0x15, MAX9286_CSI_IMAGE_TYP | MAX9286_VCTYPE |
> >>> +			      MAX9286_CSIOUTEN | MAX9286_EN_CCBSYB_CLK_STR |
> >>> +			      MAX9286_EN_GPI_CCBSYB);
> >>>  	} else {
> >>> -		max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
> >>> +		max9286_write(priv, 0x15, MAX9286_VCTYPE |
> >>> +			      MAX9286_EN_CCBSYB_CLK_STR |
> >>> +			      MAX9286_EN_GPI_CCBSYB);
> >>
> >> Probably fits better on two lines only.
> > 
> > That would be over the 80 columns limit, which is a soft limit now, but
> > still often requested by reviewers (including myself in quite a few
> > cases :-)).
> 
>     The new limit is 100 columns, not 80. :-)

That's the new hard limit, yes :-) I do occasionally write lines wider
than 80 columns and am often asked to change that. In this specific case
it doesn't matter much to me, I'll happily pick whatever option
reviewers will want to give me a Reviewed-by as both are equally
readable for me.

> [...]

-- 
Regards,

Laurent Pinchart
