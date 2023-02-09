Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC5269041F
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 10:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjBIJtn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 04:49:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbjBIJtm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 04:49:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788B13B657
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 01:49:40 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EE008DD;
        Thu,  9 Feb 2023 10:49:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675936178;
        bh=dcb/xITKT0yOZPY5MoWC3UqeMDZ/P8vql2H8G/IYXcU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sHGkhWyNp4hihC32dYHnjdddXLWwgdLXsmH8JsPzdN44G6hUjeiqfVD5Kol/HCSiE
         zHBfd5xT2d8++IpbniqjWVS2BNxFstkC46S8/RGI/RKLic4DI5tDuQ/+c5LUV46Zsd
         pUxxWb+TKukTjE+PHjzcVIOdxx7DYwXOjeolFXlc=
Date:   Thu, 9 Feb 2023 11:49:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, p.zabel@pengutronix.de,
        slongerbeam@gmail.com, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/6] media: uapi: Add MEDIA_BUS_FMT_SGRGB_IGIG_GBGR_IGIG
 media bus formats
Message-ID: <Y+TBsOCsqXKwhQxB@pendragon.ideasonboard.com>
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
 <20210427120701.21809-2-m.felsch@pengutronix.de>
 <YIoRLQfoNm0GJGsY@pendragon.ideasonboard.com>
 <20210429074903.cc5gohn52cgv4i5z@pengutronix.de>
 <YIsvyz49KvZK6Wg5@pendragon.ideasonboard.com>
 <20210430065134.jwscxlv3sydo4zgy@pengutronix.de>
 <YIv1rMFZuv7z4R8a@pendragon.ideasonboard.com>
 <20210430145146.359a9b90@coco.lan>
 <YIv/DuLdrs3NEDoB@pendragon.ideasonboard.com>
 <20230208194425.anis36f6jlzmsjwp@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230208194425.anis36f6jlzmsjwp@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

On Wed, Feb 08, 2023 at 08:44:25PM +0100, Marco Felsch wrote:
> Hi all,
> 
> sorry for the long absence on this topic. Only a few years later I'm
> back on this topic :)

No worries, I rarely complain when I receive less e-mails :-)

> On 21-04-30, Laurent Pinchart wrote:
> > On Fri, Apr 30, 2021 at 02:51:46PM +0200, Mauro Carvalho Chehab wrote:
> > > Em Fri, 30 Apr 2021 15:18:52 +0300 Laurent Pinchart escreveu:
> > > > On Fri, Apr 30, 2021 at 08:51:34AM +0200, Marco Felsch wrote:
> > > > > On 21-04-30 01:14, Laurent Pinchart wrote:  
> > > > > > On Thu, Apr 29, 2021 at 09:49:03AM +0200, Marco Felsch wrote:  
> > > > > > > On 21-04-29 04:51, Laurent Pinchart wrote:  
> > > > > > > > On Tue, Apr 27, 2021 at 02:06:56PM +0200, Marco Felsch wrote:  
> > > > > > > > > Add special 8/12bit bayer media bus format for the OnSemi AR0237IR
> > > > > > > > > camera sensor [1]. OnSemi calls this format RGB-IR, the pixel array
> > > > > > > > > with the interleaved IR pixels looks like:
> > > > > > > > > 
> > > > > > > > >         |  G |  R |  G |  B | ...
> > > > > > > > >         +----+----+----+----+---
> > > > > > > > >         | IR |  G | IR |  G | ...
> > > > > > > > >         +----+----+----+----+---
> > > > > > > > >         |  G |  B |  G |  R | ...
> > > > > > > > >         +----+----+----+----+---
> > > > > > > > >         | IR |  G | IR |  G | ...
> > > > > > > > >         +----+----+----+----+---
> > > > > > > > >         | .. | .. | .. | .. | ..
> > > > > > > > > 
> > > > > > > > > [1] https://www.framos.com/media/pdf/96/ac/8f/AR0237CS-D-PDF-framos.pdf  
> > > > > > > > 
> > > > > > > > I think we're reaching a limit of the media bus codes model here, due to
> > > > > > > > a historical mistake. The four possible Bayer patterns, times the
> > > > > > > > different number of bits per pixel, creates a lot of media bus codes,
> > > > > > > > and drivers for CSI-2 receivers and IP cores further down the pipeline
> > > > > > > > have to support them all.  
> > > > > > > 
> > > > > > > That's correct but it is not bayer related. Currently it is what it is,
> > > > > > > if a new code is added it must be propagated through all the involved
> > > > > > > subdevs. On the other hand I wouldn't say that it is better to support
> > > > > > > new codes per default for all drivers. Since this would add a lot of
> > > > > > > untested code paths.  
> > > > > > 
> > > > > > It's not an issue limited to Bayer patterns, but they make the issue
> > > > > > worse given the number of possible combinations (think about adding DPCM
> > > > > > and ALAW compression on top of that...).  
> > > > > 
> > > > > You're right and again this will apply to all mbus formats...
> > > > >   
> > > > > > > > This is already painful, and if we had a
> > > > > > > > non-Bayer pattern such as this one,  
> > > > > > > 
> > > > > > > That's not exactly true since it is a bayer pattern but instead of using
> > > > > > > 4x4 it uses 8x8 and it as some special pixels.
> > > > > > >   
> > > > > > > > we'll open the door to an explosion
> > > > > > > > of the number of media bus codes (imagine all the different possible
> > > > > > > > arrangements of this pattern, for instance if you enable horizontal
> > > > > > > > and/or vertical flipping on the sensor). All drivers would need to be
> > > > > > > > updated to support these new bus codes, and this really kills the
> > > > > > > > current model.  
> > > > > > > 
> > > > > > > Yep, I know what you mean but as I said above I think that adding it
> > > > > > > explicite is the better abbroach since it involves somone who add _and_
> > > > > > > test the new code on the particular platform.
> > > > > > >   
> > > > > > > > The historical mistake was to tie the Bayer pattern with the media bus
> > > > > > > > code. We should really have specified raw 8/10/12/14/16 media bus codes,
> > > > > > > > and conveyed the pattern separately. Most IP cores in the pipeline don't
> > > > > > > > need to care about the pattern at all, and those who do (that's mostly
> > > > > > > > ISPs) could be programmed explicitly by userspace as long as we have an
> > > > > > > > API to retrieve the pattern from the sensor. I believe it's time to bite
> > > > > > > > the bullet and go in that direction. I'm sorry for this case of yak
> > > > > > > > shaving, but it really wouldn't be manageable anymore :-(  
> > > > > > > 
> > > > > > > I got all your points and would agree but this is not a bayer only
> > > > > > > related problem. You will have this problem with all new other formats
> > > > > > > as well. I'm with you, most IP cores don't care but I wouldn't
> > > > > > > guarantee that.  
> > > > > > 
> > > > > > Sorry, but adding new media bus formats like this one will just not
> > > > > > scale. We have two options, either fixing the issue, or considering that
> > > > > > V4L2 is a barely alive API with no future, and merging this without
> > > > > > caring anymore.  
> > > > > 
> > > > > Hm.. you're right that it doesn't scale, as I said I'm absolute on your
> > > > > side. So let us consider a new approach @Mauro, @Hans, @Sailus what do
> > > > > you think about?  
> > > > 
> > > > Starting brainstorming, how about new media bus codes for
> > > > raw{8,10,12,14,16}, 
> > > 
> > > By "raw", are you meaning vendor-specific formats? If so, that sounds 
> > > a bad idea. Different vendor-specific formats should use different
> > > media bus codes (and fourccs) as otherwise there won't be an easy way
> > > to distinguish them and to describe the raw formats at the media specs.
> > 
> > I mean what the CSI-2 spec means. The exact interpretation of the format
> > will be a combination of the media bus code and the CFA pattern control.
> > The whole point of this discussion is to not have different media bus
> > codes for all possible combinations of formats, as that clearly doesn't
> > scale.
> 
> You mean that we should propagate the value as raw{size} through the
> entire pipeline, if I got this correctly. How the picture should be
> interpreted is up to the user-space by calling a new read-only CFA
> v4l2-control. This way we don't need to patch each subdev driver and
> take the user-space into account of interpreting the data. For the CFA
> control we could use a global-unique list so the control returns an
> enum.

That's the idea, yes. The CFA pattern control would be read-only on the
sensor side (but its value may change if h/v flip is implemented,
depending on the sensor, or possibly if we allow moving the crop
rectangle by one pixel instead of two), and would be writable on any
subdev that needs the information (typically the subdev that implements
CFA interpolation).

-- 
Regards,

Laurent Pinchart
