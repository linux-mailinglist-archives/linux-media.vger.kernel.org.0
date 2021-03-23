Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECAB93462D4
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 16:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232787AbhCWP20 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 11:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232803AbhCWP2P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 11:28:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FADC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 08:28:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8A62885;
        Tue, 23 Mar 2021 16:28:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616513291;
        bh=ozfrGDTp3za/SvappXL36u0VdRAs8GRuKFsQujpN9O0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pjj7V992b3q0UkA+PIqvcxZmzdJzR5qEF10VilQ1ZO6TyU9pmn0yOe2kRE8LZyQHH
         16Zlw5a46OMLTWF3M9vSsmAygP3WTTWT9wTKpnI0NoQ1nA7ch9NvnFBec3Pi40uQVo
         ctSDUXcQUwgNCzUVTolQMHA1z0eGc7e055l+Rt0k=
Date:   Tue, 23 Mar 2021 17:27:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, bingbu.cao@intel.com,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: Re: [PATCH 1/1] ipu3-cio2: Fix pixel-rate derived link frequency
Message-ID: <YFoI4V31f84xOwiZ@pendragon.ideasonboard.com>
References: <20210215075742.12434-1-sakari.ailus@linux.intel.com>
 <YCpaOdiaXE3VO86+@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YCpaOdiaXE3VO86+@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Do you plan to send a pull request for this ? I don't see the patch in
neither the master nor fixes branches of Mauro's tree.

On Mon, Feb 15, 2021 at 01:25:45PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Feb 15, 2021 at 09:57:42AM +0200, Sakari Ailus wrote:
> > The driver uses v4l2_get_link_freq() helper to obtain the link frequency
> > using the LINK_FREQ but also the PIXEL_RATE control. The divisor for the
> > pixel rate derived link frequency was wrong, missing the bus uses double
> > data rate. Fix this.
> > 
> > Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Fixes: 4b6c129e87a3 ("media: ipu3-cio2: Use v4l2_get_link_freq helper")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > index 6e8c0c230e11..fecef85bd62e 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> > @@ -302,7 +302,7 @@ static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
> >  	if (!q->sensor)
> >  		return -ENODEV;
> >  
> > -	freq = v4l2_get_link_freq(q->sensor->ctrl_handler, bpp, lanes);
> > +	freq = v4l2_get_link_freq(q->sensor->ctrl_handler, bpp, lanes * 2);
> >  	if (freq < 0) {
> >  		dev_err(dev, "error %lld, invalid link_freq\n", freq);
> >  		return freq;

-- 
Regards,

Laurent Pinchart
