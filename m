Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9CC217EA67
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 21:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgCIUs3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 16:48:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33440 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbgCIUs3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 16:48:29 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDAEF2D2;
        Mon,  9 Mar 2020 21:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583786908;
        bh=hI1o3BnZzKd+hAwFzEP7IV1BaODIaXcDQ/fQQH+Kpnk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qOoT0iMbXSXBDotUE68KmfLnrYSqL2fnV3H8Mh5/l6wP4OrwUvirQadZep2erMk7t
         /zMfffA8pLP7Sp4OaZCHuE5fjyLv9f4NZn6jHQXhQEAUI/sTZDXu3TX/yXjbpAJtRr
         jI0Y+6sxElrzYF644pCPsxm4Ke/Gxxovoj6R/GCY=
Date:   Mon, 9 Mar 2020 22:48:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH 7/7] media: imx: imx7-media-csi: Fix video field handling
Message-ID: <20200309204824.GG4916@pendragon.ideasonboard.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
 <20191024004155.32068-8-laurent.pinchart@ideasonboard.com>
 <1bce458b-8e80-1ceb-2f6d-39a0f2856f87@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1bce458b-8e80-1ceb-2f6d-39a0f2856f87@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Wed, Oct 23, 2019 at 08:25:53PM -0700, Steve Longerbeam wrote:
> On 10/23/19 5:41 PM, Laurent Pinchart wrote:
> > Commit 4791bd7d6adc ("media: imx: Try colorimetry at both sink and
> > source pads") reworked the way that formats are set on the sink pad of
> > the CSI subdevice, and accidentally removed video field handling.
> > Restore it by defaulting to V4L2_FIELD_NONE if the field value isn't
> > supported, with the only two supported value being V4L2_FIELD_NONE and
> > V4L2_FIELD_ALTERNATE.
> 
> I think you mean the only two supported field values being 
> V4L2_FIELD_NONE and V4L2_FIELD_INTERLACED.
> 
> For this driver to support ALTERNATE, it would have to detect the 
> captured field type and place that type in the returned vb2 buf->field, 
> which it is not doing.

Yes, that's what I meant, sorry. I'll fix the commit message.

> > Fixes: 4791bd7d6adc ("media: imx: Try colorimetry at both sink and source pads")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   drivers/staging/media/imx/imx7-media-csi.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> > index ac07f55a63e3..0db6473caf13 100644
> > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > @@ -1017,6 +1017,7 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
> >   		sdformat->format.width = in_fmt->width;
> >   		sdformat->format.height = in_fmt->height;
> >   		sdformat->format.code = in_fmt->code;
> > +		sdformat->format.field = in_fmt->field;
> >   		*cc = in_cc;
> >   
> >   		sdformat->format.colorspace = in_fmt->colorspace;
> > @@ -1031,6 +1032,9 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
> >   							 false);
> >   			sdformat->format.code = (*cc)->codes[0];
> >   		}
> > +
> > +		if (sdformat->format.field != V4L2_FIELD_INTERLACED)
> > +			sdformat->format.field = V4L2_FIELD_NONE;
> >   		break;
> >   	default:
> >   		return -EINVAL;
> 

-- 
Regards,

Laurent Pinchart
