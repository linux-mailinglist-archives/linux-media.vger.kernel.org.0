Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8680E741BA7
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 00:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbjF1WIr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 18:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbjF1WIp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 18:08:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EEF2111
        for <linux-media@vger.kernel.org>; Wed, 28 Jun 2023 15:08:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 26E316135C
        for <linux-media@vger.kernel.org>; Wed, 28 Jun 2023 22:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385C2C433C8;
        Wed, 28 Jun 2023 22:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687990122;
        bh=oD8jyc7fNPFEigWhEE6GUAm46EKvFixy4ZKVcvTME0I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NEdqsNnA8WyCP1e+hInyU3NyQ6RFdG2q0hybKrrQQHTZbG+72b7Azyh5qD9fRGkhX
         g3XT7tpR32Q8aImY2iojYUp3OOIfGRfZYna0qUMfXbQoHocISYu7rO+VBTlVmfKvMt
         Eu5KssbYIZaTuxjQp8O1lkusnxFBjT+dHzExMwgaNVdX80y4z0G5MHHclvUFaWhWQ/
         HbmvEaXMh/xaHDxUpvELkkOE/BkDO9CZfQlGPS7Vx7OTIlA3owmqqwlTffTKgP3gXk
         +r014Xv8fkvnmtEFSSN3E9/7zrhuwCEMoVd7pvD3hjrRmFcx02QRxcM/hYrHfQttMA
         benHbPX2jj+hw==
Date:   Thu, 29 Jun 2023 00:08:37 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Cc:     Linux regressions mailing list <regressions@lists.linux.dev>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Martijn Braam <martijn@brixit.nl>, jernej.skrabec@gmail.com,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [REGRESSION] breakage in sun6i-csi media api
Message-ID: <20230629000837.122abd21@sal.lan>
In-Reply-To: <25cf3947-1fe0-7280-09e2-3dc107b2c8e7@leemhuis.info>
References: <f13c27fb-2afe-b94e-aad9-ed5ecc818183@brixit.nl>
        <ZHmzZUkcFK8Gq_JL@aptenodytes>
        <e168d246-528d-b615-aa50-af8f17af4442@brixit.nl>
        <ZHm46or-MhTb457b@aptenodytes>
        <20230602100352.GK19463@pendragon.ideasonboard.com>
        <25cf3947-1fe0-7280-09e2-3dc107b2c8e7@leemhuis.info>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 26 Jun 2023 14:23:50 +0200
"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info> escreveu:

> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
> 
> Paul, what happened to this? It looks like this fall through the cracks,
> but maybe I'm missing something, that's why I ask.

On a quick look, checking the proposed app fix[1], it sounds to me that
the application is not prepared to actually use the devices that are
enumerated, as it is setting only the values that are known.

See, the media controller has the MEDIA_IOC_G_TOPOLOGY ioctl [2], which
enumerates the entire sub-device topology.

The current application was just expecting two sub-devices, failing
if other devices are added on newer Kernels. This is not how this uAPI is
supposed to work.

[1] https://gitlab.com/postmarketOS/megapixels/-/merge_requests/31/diffs?commit_id=38bbee084126b15d39c1bce5cb5d45e6efea64fa
[2] https://gitlab.com/postmarketOS/megapixels/-/blob/master/src/device.c#L106

Now, I was told during yesterday, during the Media Summit that there are
new apps since Kernel 6.2 that do require setting the bridge with different
configurations. Paul/Sebastian: is this the case? If so, could you provide
more details about it?

If this is true, it seems too late to revert the changes, as this will
break other existing applications.

IMO, the best here would be to modify the application to be smarter,
using the topology actually reported by MEDIA_IOC_G_TOPOLOGY, instead
on relying on some specific hard-coded types.

Regards,
Mauro

> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> #regzbot poke
> 
> On 02.06.23 12:03, Laurent Pinchart wrote:
> > On Fri, Jun 02, 2023 at 11:39:54AM +0200, Paul Kocialkowski wrote:  
> >> (Re-adding folks from the original email, adding Laurent and Hans.)
> >> On Fri 02 Jun 23, 11:24, Martijn Braam wrote:  
> >>>
> >>> That's basically it yes. My software doesn't expect the bridge block,
> >>> because it wasn't there. The pipeline always worked "automatically".
> >>>
> >>> This is the workaround that's been made now it run on newer kernels:
> >>> https://gitlab.com/postmarketOS/megapixels/-/merge_requests/31
> >>>
> >>> I'm pretty sure format propagation would fix this issue.  
> >>
> >> Okay that's good to know.
> >>
> >> To be honest it's still not very clear to me if in-driver format propagation is
> >> a "nice to have" feature or something that all media pipeline drivers are
> >> supposed to implement.  
> > 
> > For MC-based drivers, in-kernel propagation *inside* subdevs is
> > mandatory, in-kernel propagration *between* subdevs is not allowed. The
> > latter is the responsibility of userspace.
> > 
> > For traditional (I'd say legacy, but I know not everybody likes that
> > term :-)) drivers that only expose video device nodes and do not expose
> > subdev nodes to userspace, the driver is responsible for configuring the
> > full pipeline internally based on the S_FMT call on the video nodes
> > only. This isn't applicable to the sun6i-csi driver, as it exposes
> > subdev nodes to userspace.
> >   
> >> Anyway I feel like this is not really a regression but a result of the driver
> >> being converted to a newer API.
> >>
> >> Also there's a V4L2_CAP_IO_MC flag which should indicate that the video device
> >> must be controlled via the media controller API instead of being
> >> video-device-centric, but I've seen comments asking not to set the flag even
> >> when MC is used so I'm a bit confused here.  
> > 
> > Would you have pointers to those comments ?
> >   
> >> Perhaps the flag is only required when there is no automatic format
> >> propagation?  
> > 
> > The flag is more or less required when you expose subdev nodes to
> > userspace.
> >   
> >> If anyone has solid answers on these points I'd be happy to read some
> >> clarification (and act accordingly).
> >>  
> >>> On 6/2/23 11:16, Paul Kocialkowski wrote:  
> >>>> Hi Martijn,
> >>>>
> >>>> On Thu 01 Jun 23, 23:19, Martijn Braam wrote:  
> >>>>> It seems like this commit:
> >>>>>
> >>>>> media: sun6i-csi: Add bridge v4l2 subdev with port management
> >>>>>
> >>>>> Has changed the way the media pipeline on a64 devices, in my case the PINE64
> >>>>> PinePhone works. Since this is an API towards userspace and there's active
> >>>>> applications that use it I think this counts as a regression.  
> >>>> Do you have more details on what changed specifically?
> >>>>
> >>>> The commit added a bridge subdev in addition to the video node, which is
> >>>> generally a better description of the CSI hardware and also a necessity
> >>>> to support the ISP data flow.
> >>>>
> >>>> Maybe your userspace application is not configuring the bridge media block with
> >>>> the right format, which results in a mismatch?
> >>>>
> >>>> Some work was started to achieve automatic format propagation, perhaps it
> >>>> would be enough to solve your issue.
> >>>>
> >>>> Cheers,
> >>>>
> >>>> Paul
> >>>>  
> >>>>> #regzbot introduced: 0d2b746b1bef73de62d2d311e594a7ffed4ca43  
> >   
