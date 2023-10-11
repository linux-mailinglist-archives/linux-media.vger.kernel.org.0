Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66A097C5DCE
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 21:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233337AbjJKTsa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 15:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbjJKTsa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 15:48:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7A19D
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 12:48:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0181B512;
        Wed, 11 Oct 2023 21:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697053703;
        bh=eebksFwDsNsPmllxmCnVQjmd3MQrie+FL+Ehku2452M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PJhSFRe3o0U07Ip07gr8xqgRnAnlexRVZkKHn10650T2OQRgOZHBm57raybJd03a2
         dcEOLXIGhgdAqPb+lrsLBnZl1GZ5AEGoZg1SoOdjCwRcQrBYoK7gC2iMsbYTZ0Y5Cd
         xQ+Gi0qDgiROEm58UFmzuNSM0WM9r19e+xzuatgw=
Date:   Wed, 11 Oct 2023 22:48:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Alexander Shiyan <eagle.alexander923@gmail.com>,
        linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH] media: imx: imx-mipi-csis: Fix null pointer dereference
 when link is not set
Message-ID: <20231011194833.GC5322@pendragon.ideasonboard.com>
References: <20231006074654.11468-1-eagle.alexander923@gmail.com>
 <ZSb7O+2pbIHKgroc@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZSb7O+2pbIHKgroc@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 11, 2023 at 07:44:59PM +0000, Sakari Ailus wrote:
> On Fri, Oct 06, 2023 at 10:46:54AM +0300, Alexander Shiyan wrote:
> > Let's add a check for src_sd before using it.
> > The link may not be set, in which case the call to this function will fail.
> 
> That would seem like an understatement.
> 
> Any idea when this was introduced (and which patch did), Fixes: and Cc:
> stable should be added if this is already in a release.

It's actually an issue in the pipeline validation code in the V4L2 core.
The link is marked as MUST_CONNECT, but that isn't handled properly :-(
It's been on my todo list for a while but I haven't had time to get to
it. Feel free to give it a go.

> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 5f93712bf485..df5a159b2d39 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -595,6 +595,9 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
> >  	s64 link_freq;
> >  	u32 lane_rate;
> >  
> > +	if (!csis->src_sd)
> > +		return -EINVAL;
> > +
> >  	/* Calculate the line rate from the pixel rate. */
> >  	link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
> >  				       csis_fmt->width,

-- 
Regards,

Laurent Pinchart
