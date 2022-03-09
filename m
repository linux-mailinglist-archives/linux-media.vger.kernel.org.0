Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69D8C4D3B06
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 21:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234935AbiCIU1O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 15:27:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238120AbiCIU1N (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 15:27:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCF14754A;
        Wed,  9 Mar 2022 12:26:13 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75D8EA50;
        Wed,  9 Mar 2022 21:26:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646857571;
        bh=C0hndd3YnZnssTuhjaC3YZSqP9LJ07H5lC8NuZjhgbc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mYkdklsAt99t3m0fgQ7OJP0yj0wYWZlTDTI+wlgUNPCIsLkLby7RSwvO5PTzsUViS
         L+NYkXxuaCJJC8jk1x5hQQFagLJwBULp8DwSD3d8vRd6vhIWyfIlsEN3URPgpjBwwl
         njfUMhopMW3J2eGsK/WLaRKiDZq0eZ/DOuBw/F2A=
Date:   Wed, 9 Mar 2022 22:25:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/9] media: uapi: Add a control for DW100 driver
Message-ID: <YikNVPsovdUDxJEB@pendragon.ideasonboard.com>
References: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
 <20220308184829.38242-7-xavier.roumegue@oss.nxp.com>
 <1b2f72c783e7a83956acc788888c539bb83fe995.camel@ndufresne.ca>
 <986c4b3c-e346-e5b5-7fc9-497d8a4fc89f@oss.nxp.com>
 <5a43a326a270051df1f7b8402d07b443b02331b6.camel@ndufresne.ca>
 <d4d170c3-b4df-47ee-28b1-09a4c8ebc5f6@oss.nxp.com>
 <8d7db603e85b2bf1f1d7d581028e7d9f578ec643.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d7db603e85b2bf1f1d7d581028e7d9f578ec643.camel@ndufresne.ca>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LONG_TERM_PRICE,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas and Xavier,

On Wed, Mar 09, 2022 at 03:08:06PM -0500, Nicolas Dufresne wrote:
> Le mercredi 09 mars 2022 à 00:16 +0100, Xavier Roumegue (OSS) a écrit :
> > On 3/8/22 21:28, Nicolas Dufresne wrote:
> > > Le mardi 08 mars 2022 à 20:42 +0100, Xavier Roumegue (OSS) a écrit :
> > > > On 3/8/22 20:15, Nicolas Dufresne wrote:
> > > > > Le mardi 08 mars 2022 à 19:48 +0100, Xavier Roumegue a écrit :
> > > > > > The DW100 driver gets the dewarping mapping as a binary blob from the
> > > > > > userspace application through a custom control.
> > > > > > The blob format is hardware specific so create a dedicated control for
> > > > > > this purpose.
> > > > > > 
> > > > > > Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> > > > > > ---
> > > > > >    Documentation/userspace-api/media/drivers/dw100.rst |  7 +++++++
> > > > > >    include/uapi/linux/dw100.h                          | 11 +++++++++++
> > > > > >    2 files changed, 18 insertions(+)
> > > > > >    create mode 100644 include/uapi/linux/dw100.h
> > > > > > 
> > > > > > diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
> > > > > > index 20aeae63a94f..3abad05849ad 100644
> > > > > > --- a/Documentation/userspace-api/media/drivers/dw100.rst
> > > > > > +++ b/Documentation/userspace-api/media/drivers/dw100.rst
> > > > > > @@ -20,4 +20,11 @@ match the expected size inherited from the destination image resolution.
> > > > > >    More details on the DW100 hardware operations can be found in
> > > > > >    *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
> > > > > >    
> > > > > > +The Vivante DW100 m2m driver implements the following driver-specific control:
> > > > > > +
> > > > > > +``V4L2_CID_DW100_MAPPING (integer)``
> > > > > > +    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
> > > > > > +    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
> > > > > > +    dynamic array.
> > > > > > +
> > > > > >    .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC
> > > > > 
> > > > > This point to a document names "i.MX 8M Plus Applications Processor Datasheet
> > > > > for Industrial Products" which does not contain that reference.
> > > > My bad.. Wrong link. :)
> > > > Will repost with correct link.
> > > 
> > > Thanks. What I wanted to check is if it actually made sense to expose the
> > > synthetized HW LUT. But for this, one need to share the parameters / algo needed
> > > to generate them.
> >
> > There is no special dewarping algorithm which strictly depends on the 
> > dw100 IP, or optimized for the IP capabilities.
> > 
> >   This way we can compare against other popular dewarp
> > > algorithms / API and see if they have something in common.
> >
> > The dw100 hw lut description is rather close to a how you implement 
> > dewarping with openGL taking benefit of the shader pipeline stage.
> > The main differences with OpenGL implementation are:
> > - Fixed vertices coordinates (16x16) vs any
> > - Limited resolution on input (texture) coordinates (UQ12.4) vs float
> > 
> > Standard routines from OpenCV such as initUndistortRectifyMap()
> > https://docs.opencv.org/4.5.5/d9/d0c/group__calib3d.html#ga7dfb72c9cf9780a347fbe3d1c47e5d5a
> > can be used to generate the binary blob, with an additional decimation 
> > processing stage to satisfy the 16x16 macro block vertices grid and the 
> > fixed point format.
> > 
> > > The issue I see with this control is relate to the message it gives. When adding
> > > controls for the prosperity, we want these control to actually be usable. This
> > > is possible if the documentation makes its usage obvious, or if there is Open
> > > Source userland to support that.
> >
> > So yes, most famous vision opensource project such OpenCV can be used to 
> > generate the blob.
> >
> > > None of this is met, so as a side effect, this looks like NXP sneaking in
> > > private blob control into a publicly maintained Open Source project.
> >
> > I then disagree with this statement considering my previous comments.
> > 
> > I plan to release publicly some programming examples on how to generate 
> > the dewarping map only using openCV library routines and aligned with 
> > lenses calibration state of the art method.
> > A dedicated openCV module taking benefit of the DW100 will be published 
> > as well.
> > 
> > A long term target is to add its support in libcamera, combined with all 
> > media components (CSI, ISP, ISI) pulled from upstream kernel tree.
> > 
> >   This isn't
> > > truly aligned with how V4L2 controls are meant to be. Doing trivial lut
> > > synthesis in the kernel could be fine though.
> >
> > I am not sure what you meant with this comment.
> > 
> > As part of this patch series, an identity map is generated in the driver 
> > which should be enough for anyone familiar with dewarping process.
> > If you meant to generate the remapping table from the lens calibration 
> > data, I don't think this is a reasonable option considering the 
> > NP-completeness of the problem.
> > 
> > If this is the idea of binary blob (despite its public format 
> > description) which hurts you, the map can be exposed to the kernel in a 
> > more human readable format such Image_in(xin, yin) -> Image_out(xout, 
> > yout) in UQ1.31 format but will add extra processing at runtime for 
> > something which has to be done anyway offline, and memory overhead. But 
> > I don't think we can end with a generic v4l2 control considering the 
> > hardware restrictions (vertices position, limited fixed point 
> > resolution, etc..).
> 
> Please avoid implication that I would be *hurt* by your patchset.

There are many developers in the community for who code is their baby,
so being hurt by a patch series is actually a feeling that can occurs
:-) I don't think anyone is trying to hurt anyone here. There was a bit
of miscommunication in the beginning as Xavier's cover letter didn't
outline the userspace development plans, and that has been clarified
now. The driver may expose a hardware-specific configuration blob to
userspace, but that will be fully supported by an open-source userspace
implementation.

> Your imagination will make you read my comment as saying something it is not. My
> comment are strictly scoped within the information you have provided with the
> patchset to justify adding a vendor control in contrast to providing controls
> that would be reused by another driver later. I'm not into lense or anything, I
> strictly review the userland APIs that you submitted with care on documentation
> and usability.
> 
> Try and ignore everything you know and the inner of this hardware design, and
> perhaps about dewarping technique and you may endup with a different read of
> your patchset. My impression while reading it is that I would not be able to use
> it due to lack of example. And if NXP website would stop hosting the
> documentation, this would make it just impossible. Time have showed that vendor
> controls are rarely the solution and should only be added with great care and
> good documentation. For a first driver supporting a technology like this one, it
> could be acceptable, assuming it is documented in a future proof way.

While I'm not sure there would be value in trying to standardize the
control here, documenting it in the kernel instead of simply referring
to the reference manual could indeed be nice. That's a bit of extra work
for little immediate gain, but it would be more future-proof.

> All the information and the rationale you are adding in this reply can be added
> in the next submission. What I think you should strictly address:
> 
> - The LUT format and meaning should be documented directly in the Linux Kernel
> documentation. Having to register an account with NXP in order to download the
> documentation is not acceptable and not future safe.

We don't *necessarily* need to fully document the format in the kernel
documentation itself (but we *can*), it could also be documented as part
of an open-source userspace project (think about GPU command streams
that are not documented on the kernel side but in Mesa). In any case,
the documentation should be provided to merge the driver, even if it
lives as part of a userspace project.

> - You forgot to provide the output of v4l2-compliance, I didn't mention yet, but
> that would have come of course.
> 
> The rest are just nice to have, though generally wanted.
> 
> - The name of the control could be made more descriptive. The lut is mapping
> what in one word ? And that word could be added to the name.
> - The patchset could mention userland code that uses it, which show that this is
> actually tested*
> - There is other feature you mention, unrelated to the dewarp feature. You
> haven't said with what userland these have been tested. M2M scaling, csc and
> crop are generic should just work with existing userland. You could use
> GStreamer as an example.
> 
> * You'll find this funny, or perhaps even insulting at first, but you'd be
> surprise how much code (specially from ARM SoC vendors) that get sent every year
> that don't even compile or have never been tested after being up-ported from an
> older tree. And that is only scratching the surface of the problem we have to
> deal with. Notably drivers were only 1 pixel format out of let's say 10 have
> been tested that comes with broken stride and memory buffer size calculation
> causing much larger troubles in the system.

While I don't necessarily disagree, and while I understand it may make
you cautious (as we say in French, chat échaudé craint l'eau froide),
let's remember to be welcoming to new contributions without any
prejudice.

> > Adding a generic dewarping API to V4L2 is possible but this was not the 
> > scope of this patchset, and anyway missing data on any existing public 
> > dewarp hardware implementation supported by the kernel is somehow a 
> > blocker for this.
> 
> I was asking to share about your research that made you opt-out any kind of non-
> vendor control for this feature. From your original submission, it would have
> been ill advised for me to assume anything. Note that programming interface for
> a V4L2 driver does not need to be based on other hardware vendor interface. I'm
> not in this industry, but there could have been an industry standard for
> expressing lense correction, produce through a a calibration process. The one
> thing I've been assuming is that you are in the industry and would be able to
> share a bit on that.
> 
> > > > > > diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..0ef926c61cf0
> > > > > > --- /dev/null
> > > > > > +++ b/include/uapi/linux/dw100.h
> > > > > > @@ -0,0 +1,11 @@
> > > > > > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > > > > > +/* Copyright 2022 NXP */
> > > > > > +
> > > > > > +#ifndef __UAPI_DW100_H__
> > > > > > +#define __UAPI_DW100_H__
> > > > > > +
> > > > > > +#include <linux/v4l2-controls.h>
> > > > > > +
> > > > > > +#define V4L2_CID_DW100_MAPPING		(V4L2_CID_USER_DW100_BASE + 1)
> > > > > > +
> > > > > > +#endif

-- 
Regards,

Laurent Pinchart
