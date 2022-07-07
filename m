Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B47C356ADE6
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 23:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236893AbiGGVrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 17:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236879AbiGGVr3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 17:47:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB6330F63
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 14:47:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1D9DD00;
        Thu,  7 Jul 2022 23:47:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657230446;
        bh=nM19EOLpimc401Ml0+BRbDPw4Q23Wx0EwxuqiKtDdE8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X+8d0qoNlTM4Xt2X4KGTplLIrpC6t5siDkqWcnulMhV3VPECqXXJv5stBOKH7BkyF
         HJN/ipMSArHCrrZojOFNyYh+VoHoSfK0eYhrOqsyfFVJph80oU2KiHvf0BxiGFdFKo
         jxlWd86djeNomRbWVZCldFWkZhwJVg5+MZ6/Agl8=
Date:   Fri, 8 Jul 2022 00:47:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Petko Manolov <petko.manolov@konsulko.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, jacopo@jmondi.org
Subject: Re: Re: Re: hooking Sony 47MPixel sensor to NXP imx8m-mini MIPI CSI2
Message-ID: <YsdUVAr/MJjDRObd@pendragon.ideasonboard.com>
References: <YrwFf7Jw2/yDlcDq@carbon.lan>
 <12352558.O9o76ZdvQC@steina-w>
 <YsRVAV8a48CwpaSY@p310.k.g>
 <2450654.irdbgypaU6@steina-w>
 <YsWJBEPhp9WhiYe1@p310.k.g>
 <YsWTXnTpeM+mCImc@pendragon.ideasonboard.com>
 <YsXh/arQZXnaeGAi@carbon.gago.life>
 <YsYC6eMtotq7FR2i@pendragon.ideasonboard.com>
 <YsbO74eGybz7uFBe@carbon.gago.life>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YsbO74eGybz7uFBe@carbon.gago.life>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Petko,

On Thu, Jul 07, 2022 at 03:17:51PM +0300, Petko Manolov wrote:
> On 22-07-07 00:47:21, Laurent Pinchart wrote:
> > 
> > MEDIA_BUS_FMT_* are media bus formats, they describe the format of data as it
> > gets transmitted on buses between entities. The main purposes of those formats
> > are configuration of entities in the pipeline (an IP core will need to be
> > configured differently if it receives 10-bit raw data or 12-bit raw data for
> > instance), and validation of the pipeline configuration (the format on the
> > output of an entity must match the format on the input of the next entity).
> > 
> > V4L2_PIX_FMT_* are pixel formats, and they describe the format of data as
> > stored in memory. They're only meaningful for the DMA engines at the end of
> > the pipeline, and while they're related to the media bus formats (the DMA
> > engine can't write to memory, for instance, V4L2_PIX_FMT_YUYV if it receives
> > MEDIA_BUS_FMT_SGRBG10 from the previous entity), there's no fixed 1:1 mapping
> > between the two formats. The mapping is device-dependent. For instance, a DMA
> > engine that receives YUV 4:2:2 data in the form of MEDIA_BUS_FMT_YUYV8_1X16
> > could support writing it in different pixel formats, such as
> > V4L2_PIX_FMT_YUYV, V4L2_PIX_FMT_NV12, V4L2_PIX_FMT_NV16, ...
> 
> Thanks for these details.
> 
> I was wondering why V4L2_PIX_FMT_SGBRG12 would not be used for
> MEDIA_BUS_FMT_SGBRG12_1X12 bus formats, but i guess the answer i can extract
> from the info above is "device dependent".

And I think it's also wrong in the imx7-media-csi driver. I've sent a
pull request ([1]) for v5.20 that should fix this, in particular in
patch "staging: media: imx: imx7-media-csi: Fix list of supported
formats" ([2]).

[1] https://lore.kernel.org/linux-media/YsbEoobPgKoYcZUs@pendragon.ideasonboard.com/
[2] https://lore.kernel.org/linux-media/20220510115859.19777-46-laurent.pinchart@ideasonboard.com/

> > I have work in progress patches that address issues with the imx7-csi-bridge
> > driver, once they land we could look into this. I'm afraid I'm a bit slow
> > these days due to covid.
> 
> Quick recovery!  Looking forward to these patches.

Thank you. The pull request has been sent, so this should be fixed in
v5.20.

> For me, changing VID_MEM_LIMIT to 512MB works OK for the moment.  I am not yet
> certain how this constant is related to the global CMA parameter.  In the
> default kernel config CMA is 32MB, while VID_MEM_LIMIT is 64MB.  Isn't this
> wrong?

There's no real rule about the maximum amount of memory V4L2 driver
can/should allocate. Every driver sets its own limits (and some drivers
don't set a limit at all). 64MB is clearly too little. Feel free to
submit a patch to increase this in the imx7-media-csi driver (on top of
[1] to avoid conflicts).

-- 
Regards,

Laurent Pinchart
