Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F6271FE7F
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 12:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234410AbjFBKEA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 06:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234402AbjFBKD6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 06:03:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3A0194
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 03:03:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp [126.156.168.104])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31EC76E0;
        Fri,  2 Jun 2023 12:03:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685700212;
        bh=oCe9V8TK9XeWJO+7wFaKHHZCEzj4y9AIBpuCCb1YwKU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B20Y4baTrMd+AtwaSstNF6qPWOSKvb/GppFDOnLANj71Qtt3YQqMV4yRfjpAfdLNq
         2edYF+KQjkYTrI6W8ZKJfWC1NTPM4NOmQMbCbkYiYZIQSY7i/vxg3BbYRTXw36sVh0
         dxTRqvxOoCCU3s1P63P0S5ONzyax/EqZug+LRIkE=
Date:   Fri, 2 Jun 2023 13:03:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Martijn Braam <martijn@brixit.nl>, regressions@lists.linux.dev,
        jernej.skrabec@gmail.com, sakari.ailus@linux.intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [REGRESSION] breakage in sun6i-csi media api
Message-ID: <20230602100352.GK19463@pendragon.ideasonboard.com>
References: <f13c27fb-2afe-b94e-aad9-ed5ecc818183@brixit.nl>
 <ZHmzZUkcFK8Gq_JL@aptenodytes>
 <e168d246-528d-b615-aa50-af8f17af4442@brixit.nl>
 <ZHm46or-MhTb457b@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZHm46or-MhTb457b@aptenodytes>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Fri, Jun 02, 2023 at 11:39:54AM +0200, Paul Kocialkowski wrote:
> Hi,
> 
> (Re-adding folks from the original email, adding Laurent and Hans.)
> 
> On Fri 02 Jun 23, 11:24, Martijn Braam wrote:
> > Hi Paul,
> > 
> > That's basically it yes. My software doesn't expect the bridge block,
> > because it wasn't there. The pipeline always worked "automatically".
> > 
> > This is the workaround that's been made now it run on newer kernels:
> > https://gitlab.com/postmarketOS/megapixels/-/merge_requests/31
> > 
> > I'm pretty sure format propagation would fix this issue.
> 
> Okay that's good to know.
> 
> To be honest it's still not very clear to me if in-driver format propagation is
> a "nice to have" feature or something that all media pipeline drivers are
> supposed to implement.

For MC-based drivers, in-kernel propagation *inside* subdevs is
mandatory, in-kernel propagration *between* subdevs is not allowed. The
latter is the responsibility of userspace.

For traditional (I'd say legacy, but I know not everybody likes that
term :-)) drivers that only expose video device nodes and do not expose
subdev nodes to userspace, the driver is responsible for configuring the
full pipeline internally based on the S_FMT call on the video nodes
only. This isn't applicable to the sun6i-csi driver, as it exposes
subdev nodes to userspace.

> Anyway I feel like this is not really a regression but a result of the driver
> being converted to a newer API.
> 
> Also there's a V4L2_CAP_IO_MC flag which should indicate that the video device
> must be controlled via the media controller API instead of being
> video-device-centric, but I've seen comments asking not to set the flag even
> when MC is used so I'm a bit confused here.

Would you have pointers to those comments ?

> Perhaps the flag is only required when there is no automatic format
> propagation?

The flag is more or less required when you expose subdev nodes to
userspace.

> If anyone has solid answers on these points I'd be happy to read some
> clarification (and act accordingly).
>
> > On 6/2/23 11:16, Paul Kocialkowski wrote:
> > > Hi Martijn,
> > > 
> > > On Thu 01 Jun 23, 23:19, Martijn Braam wrote:
> > > > It seems like this commit:
> > > > 
> > > > media: sun6i-csi: Add bridge v4l2 subdev with port management
> > > > 
> > > > Has changed the way the media pipeline on a64 devices, in my case the PINE64
> > > > PinePhone works. Since this is an API towards userspace and there's active
> > > > applications that use it I think this counts as a regression.
> > > Do you have more details on what changed specifically?
> > > 
> > > The commit added a bridge subdev in addition to the video node, which is
> > > generally a better description of the CSI hardware and also a necessity
> > > to support the ISP data flow.
> > > 
> > > Maybe your userspace application is not configuring the bridge media block with
> > > the right format, which results in a mismatch?
> > > 
> > > Some work was started to achieve automatic format propagation, perhaps it
> > > would be enough to solve your issue.
> > > 
> > > Cheers,
> > > 
> > > Paul
> > > 
> > > > #regzbot introduced: 0d2b746b1bef73de62d2d311e594a7ffed4ca43

-- 
Regards,

Laurent Pinchart
