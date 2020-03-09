Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B20617EA79
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 21:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgCIUwo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 16:52:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33478 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgCIUwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 16:52:44 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E9ABF2D2;
        Mon,  9 Mar 2020 21:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583787162;
        bh=RbKBhvMXvpIEyie37v4VB/IUswQJ9WPGyzUZlIunEMA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q4a4aGp2Q2dogE+j//HppaiUSjxbg/XS4HMs0zHOas6UrTF5htI734+30e6HEaejP
         xOtpbnFJnzizf5o7FiwDibhDbCn65PyEfLSH3SM300anAxUI1pBIi3HBkIP3QE9f+I
         TQHLzj11eZ1Vxxg01T8mcVZDjKlZXoTGEY2Al9/s=
Date:   Mon, 9 Mar 2020 22:52:38 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH 7/7] media: imx: imx7-media-csi: Fix video field handling
Message-ID: <20200309205238.GH4916@pendragon.ideasonboard.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
 <20191024004155.32068-8-laurent.pinchart@ideasonboard.com>
 <3d979bfa-0bb2-0dde-9bc7-83ee3923d33a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3d979bfa-0bb2-0dde-9bc7-83ee3923d33a@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Thu, Oct 24, 2019 at 08:11:20AM -0700, Steve Longerbeam wrote:
> On 10/23/19 5:41 PM, Laurent Pinchart wrote:
> > Commit 4791bd7d6adc ("media: imx: Try colorimetry at both sink and
> > source pads") reworked the way that formats are set on the sink pad of
> > the CSI subdevice, and accidentally removed video field handling.
> 
> Well, let me restate the problem. This driver never did have correct 
> field handling (as you demonstrate in this patch, the driver never 
> set/propagated the field type to its source pad). So it's not accurate 
> to say the patch is a fix. A better description is that it adds 
> rudimentary field handling.

Didn't it ? The above commit removed a call to
imx_media_fill_default_mbus_fields() from imx7_csi_try_fmt(), and that
function had rudimentary field handling. The Fixes: tag isn't there to
blame you :-)

> > Restore it by defaulting to V4L2_FIELD_NONE if the field value isn't
> > supported, with the only two supported value being V4L2_FIELD_NONE and
> > V4L2_FIELD_ALTERNATE.
> >
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

-- 
Regards,

Laurent Pinchart
