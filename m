Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A03324D53F0
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 22:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344187AbiCJVxr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 16:53:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245071AbiCJVxp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 16:53:45 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4276F69480
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 13:52:43 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id q194so5598853qke.5
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 13:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=XoNS7bNckVqBdGF7uX6abypolgbd5rV9QDIOVKHm6/I=;
        b=xz4XY5Zfo+NZjO3UUnmb6VJlkmCxff5edkzV0EaNdhHTkWMwwMJFYPP8uwxSRO6OGD
         2A0/CgN+clQWN6ARq3FrZ+elNGxtk1vWMai12iXkC2DBo5PPmavheXfb24NDO1DJ2vbL
         mZAV265ZQQKGjho08S9GQlcIfkP7j5V0YOp/sdfZE0BVwQF9AgJ8xhLP9IaPUvHalHVv
         vp7NZs+tc4T1JfhjzxnktQFl2qQXgiTmWVDUlm+3hNx90Neyrx/cf9D0GQa04eY6Jt1y
         UYqEYX+lLjFWYjs3DmrJmHYHGk/6iEFRQ9jl44XCowywzoC4yv8YR2ljq9HYaMwD62s6
         g3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XoNS7bNckVqBdGF7uX6abypolgbd5rV9QDIOVKHm6/I=;
        b=58Re6svSv1h+6k3mq9v/17PCpWIUjS6IUBHbvTbsBXrSP/ZzGlRnPuorzjxD119T8c
         /3il6Pl3vXQBJLiqx6YbxKCrVAkP2rw7IuigD4/SaIJ6CIUuFhS8mZIBxokOIbIxEIkw
         3UZTOyFt0x0mdaHH1dXvBCJWNy3BculsOdd7PnmZh6pbv/C6O6T8V0o61Gl4mgNqg+w4
         uZxSxV/c/iVWyd+iXpSAMA+4D/jT3hDy9Y7ntX7p86kd6HuoznJEdvKOXn1VV9LVGL36
         2Sn6FyRl/w6k4SKQRlaPhsOrmVOBLa3Kvp/NsIauS4kZyxPi+ZnTyCNZvqNOCIS9r3g2
         QIYw==
X-Gm-Message-State: AOAM530rYxrYjzkbkeEYxjGe7YYLsDjB33q3rrlWGRc5qpSXCVDqqHhR
        Wj07SCp7Mt+XC75jpX/JFu8MRg==
X-Google-Smtp-Source: ABdhPJyadnPvLaRy/Ev2KYCly6LAV1pwaAzdBaQ34qneHGxwL7+NY9FsL1WvTVWQdbJ0g/d/jdfEgA==
X-Received: by 2002:a37:bc04:0:b0:5e9:796a:8e76 with SMTP id m4-20020a37bc04000000b005e9796a8e76mr4515104qkf.647.1646949162121;
        Thu, 10 Mar 2022 13:52:42 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a0c5000b0067af598be2esm3143819qki.136.2022.03.10.13.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 13:52:41 -0800 (PST)
Message-ID: <2adbb0c29d3951edd953c4738affb40d32cf1d3d.camel@ndufresne.ca>
Subject: Re: [PATCH v2 6/9] media: uapi: Add a control for DW100 driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Date:   Thu, 10 Mar 2022 16:52:40 -0500
In-Reply-To: <d48e2863-0098-41bf-3bc5-2fdf14aa8a11@oss.nxp.com>
References: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
         <20220308184829.38242-7-xavier.roumegue@oss.nxp.com>
         <1b2f72c783e7a83956acc788888c539bb83fe995.camel@ndufresne.ca>
         <986c4b3c-e346-e5b5-7fc9-497d8a4fc89f@oss.nxp.com>
         <5a43a326a270051df1f7b8402d07b443b02331b6.camel@ndufresne.ca>
         <d4d170c3-b4df-47ee-28b1-09a4c8ebc5f6@oss.nxp.com>
         <8d7db603e85b2bf1f1d7d581028e7d9f578ec643.camel@ndufresne.ca>
         <d48e2863-0098-41bf-3bc5-2fdf14aa8a11@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,LONG_TERM_PRICE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 10 mars 2022 à 13:20 +0100, Xavier Roumegue (OSS) a écrit :
> 
> On 3/9/22 21:08, Nicolas Dufresne wrote:
> > Le mercredi 09 mars 2022 à 00:16 +0100, Xavier Roumegue (OSS) a écrit :
> > > 
> > > On 3/8/22 21:28, Nicolas Dufresne wrote:
> > > > Le mardi 08 mars 2022 à 20:42 +0100, Xavier Roumegue (OSS) a écrit :
> > > > > Hello Nicolas,
> > > > > 
> > > > > On 3/8/22 20:15, Nicolas Dufresne wrote:
> > > > > > Le mardi 08 mars 2022 à 19:48 +0100, Xavier Roumegue a écrit :
> > > > > > > The DW100 driver gets the dewarping mapping as a binary blob from the
> > > > > > > userspace application through a custom control.
> > > > > > > The blob format is hardware specific so create a dedicated control for
> > > > > > > this purpose.
> > > > > > > 
> > > > > > > Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> > > > > > > ---
> > > > > > >     Documentation/userspace-api/media/drivers/dw100.rst |  7 +++++++
> > > > > > >     include/uapi/linux/dw100.h                          | 11 +++++++++++
> > > > > > >     2 files changed, 18 insertions(+)
> > > > > > >     create mode 100644 include/uapi/linux/dw100.h
> > > > > > > 
> > > > > > > diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
> > > > > > > index 20aeae63a94f..3abad05849ad 100644
> > > > > > > --- a/Documentation/userspace-api/media/drivers/dw100.rst
> > > > > > > +++ b/Documentation/userspace-api/media/drivers/dw100.rst
> > > > > > > @@ -20,4 +20,11 @@ match the expected size inherited from the destination image resolution.
> > > > > > >     More details on the DW100 hardware operations can be found in
> > > > > > >     *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
> > > > > > >     
> > > > > > > +The Vivante DW100 m2m driver implements the following driver-specific control:
> > > > > > > +
> > > > > > > +``V4L2_CID_DW100_MAPPING (integer)``
> > > > > > > +    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
> > > > > > > +    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
> > > > > > > +    dynamic array.
> > > > > > > +
> > > > > > >     .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC
> > > > > > 
> > > > > > This point to a document names "i.MX 8M Plus Applications Processor Datasheet
> > > > > > for Industrial Products" which does not contain that reference.
> > > > > My bad.. Wrong link. :)
> > > > > Will repost with correct link.
> > > > 
> > > > Thanks. What I wanted to check is if it actually made sense to expose the
> > > > synthetized HW LUT. But for this, one need to share the parameters / algo needed
> > > > to generate them.
> > > There is no special dewarping algorithm which strictly depends on the
> > > dw100 IP, or optimized for the IP capabilities.
> > > 
> > >    This way we can compare against other popular dewarp
> > > > algorithms / API and see if they have something in common.
> > > The dw100 hw lut description is rather close to a how you implement
> > > dewarping with openGL taking benefit of the shader pipeline stage.
> > > The main differences with OpenGL implementation are:
> > > - Fixed vertices coordinates (16x16) vs any
> > > - Limited resolution on input (texture) coordinates (UQ12.4) vs float
> > > 
> > > Standard routines from OpenCV such as initUndistortRectifyMap()
> > > https://docs.opencv.org/4.5.5/d9/d0c/group__calib3d.html#ga7dfb72c9cf9780a347fbe3d1c47e5d5a
> > > can be used to generate the binary blob, with an additional decimation
> > > processing stage to satisfy the 16x16 macro block vertices grid and the
> > > fixed point format.
> > > 
> > > > 
> > > > The issue I see with this control is relate to the message it gives. When adding
> > > > controls for the prosperity, we want these control to actually be usable. This
> > > > is possible if the documentation makes its usage obvious, or if there is Open
> > > > Source userland to support that.
> > > So yes, most famous vision opensource project such OpenCV can be used to
> > > generate the blob.
> > > > 
> > > > None of this is met, so as a side effect, this looks like NXP sneaking in
> > > > private blob control into a publicly maintained Open Source project.
> > > I then disagree with this statement considering my previous comments.
> > > 
> > > I plan to release publicly some programming examples on how to generate
> > > the dewarping map only using openCV library routines and aligned with
> > > lenses calibration state of the art method.
> > > A dedicated openCV module taking benefit of the DW100 will be published
> > > as well.
> > > 
> > > A long term target is to add its support in libcamera, combined with all
> > > media components (CSI, ISP, ISI) pulled from upstream kernel tree.
> > > 
> > >    This isn't
> > > > truly aligned with how V4L2 controls are meant to be. Doing trivial lut
> > > > synthesis in the kernel could be fine though.
> > > I am not sure what you meant with this comment.
> > > 
> > > As part of this patch series, an identity map is generated in the driver
> > > which should be enough for anyone familiar with dewarping process.
> > > If you meant to generate the remapping table from the lens calibration
> > > data, I don't think this is a reasonable option considering the
> > > NP-completeness of the problem.
> > > 
> > > If this is the idea of binary blob (despite its public format
> > > description) which hurts you, the map can be exposed to the kernel in a
> > > more human readable format such Image_in(xin, yin) -> Image_out(xout,
> > > yout) in UQ1.31 format but will add extra processing at runtime for
> > > something which has to be done anyway offline, and memory overhead. But
> > > I don't think we can end with a generic v4l2 control considering the
> > > hardware restrictions (vertices position, limited fixed point
> > > resolution, etc..).
> > 
> > Please avoid implication that I would be *hurt* by your patchset. Your
> > imagination will make you read my comment as saying something it is not. My
> > comment are strictly scoped within the information you have provided with the
> > patchset to justify adding a vendor control in contrast to providing controls
> > that would be reused by another driver later. I'm not into lense or anything, I
> > strictly review the userland APIs that you submitted with care on documentation
> > and usability.
> > 
> > Try and ignore everything you know and the inner of this hardware design, and
> > perhaps about dewarping technique and you may endup with a different read of
> > your patchset. My impression while reading it is that I would not be able to use
> > it due to lack of example. And if NXP website would stop hosting the
> > documentation, this would make it just impossible. Time have showed that vendor
> > controls are rarely the solution and should only be added with great care and
> > good documentation. For a first driver supporting a technology like this one, it
> > could be acceptable, assuming it is documented in a future proof way.
> I fully understand uapi changes have to be handle with care, and that 
> was the reason I was initially willing to use a private custom control 
> (as few drivers are doing), without being aware of the current policy 
> with this regards.
> 
> I was willing to share the details of the hardware specification through 
> NXP website such as one could get all public details available on the 
> IP, and I was (wrongly) thinking the code was talking by itself to give 
> indication on its format (finally pretty simple). Again, I understand 
> one could be mistrustful with documentation hosted out of kernel tree 
> for the reasons you mentioned, even though the risk is pretty small as 
> NXP (as most of the vendors) has some long term maintenance legal 
> contracts to fulfill.
> 
> > 
> > All the information and the rationale you are adding in this reply can be added
> > in the next submission. What I think you should strictly address:
> > 
> > - The LUT format and meaning should be documented directly in the Linux Kernel
> > documentation. Having to register an account with NXP in order to download the
> > documentation is not acceptable and not future safe.
> Will do, and will provide a short script example to generate the LUT.
> > - You forgot to provide the output of v4l2-compliance, I didn't mention yet, but
> > that would have come of course.
> The v4l2-compliance report is actually in the cover letter of the patchset.
> > 
> > The rest are just nice to have, though generally wanted.
> > 
> > - The name of the control could be made more descriptive. The lut is mapping
> > what in one word ? And that word could be added to the name.
> I am running out of imagination for figuring out the good word to use.
> The LUT is mapping "input pixels coordinates" to "output pixels 
> coordinates".
> Using OpenGL semantic, this maps textures coordinates to vertices 
> coordinates. Any naming suggestions are welcome.

I just read the 2 paragraph of doc in the 7K pages TRM, and indeed this is
simple. The table is relocating/remapping vertex (tiles) not pixels. Is my
reading correct ?

So it's basically an array of 32bit X/Y coordinate. Each coordinate are 16 bit
fixed point, with 12bit for the rational, 4bit fractionnal (convient considering
we have 16 x 16 vertex, as it got a step of 1/16). And the size of the control
will vary depending on the resolution of the incoming stream. Basically rounded
up form of width/16 x height/16 * 32bit. Right and bottom most tile are just
missing pixels if the image size is not aligned, at least that was my reading of
the doc.

The coordinate points to the middle of the tile/vertex, and relocate with
interpolation toward the specified coordinate. Basically stretching the image in
that direction.

Some naming ideas:

- DW100_DEWARPING_MAP

Just the doc wording, no detail.

- DW100_DEWARPING_GRID_MAP

Another wording used in the doc.

- DW100_DEWARPING_16x16_VERTEX_MAP

A little more detail, still using mostly doc wording.

- DW100_DEWARPING_16x16_TILE_MAP

Using tile ? I simply use the term tile before because of my background, but
vextex might speak better to folks used to do this in vertex shaders ?

- DW100_DEWARPING_16x16_GRID_MAP

That basically avoid both tiles and vertex, grid is also a wording used in the
doc.

Just some ideas. I kept the DW100 since its likely going to be classified as
vendor. I would not make it private though.

> 
> > - The patchset could mention userland code that uses it, which show that this is
> > actually tested*
> 
> Will do.
> Custom control was tested with a gst pipelone using a (hacky) 
> gstv4l2transform element and a opencv script using custom module which 
> will be shared publicly.
> 
> 
> 
> > - There is other feature you mention, unrelated to the dewarp feature. You
> > haven't said with what userland these have been tested. M2M scaling, csc and
> > crop are generic should just work with existing userland. You could use
> > GStreamer as an example.
> v4l2-ctl and gst pipeline using (vanilla) gstv4l2transform have been 
> used for testing.
> 
> Unfortunately, I had to apply oneliner patches on v4l2-ctl to get the 
> cropping working to prevent the use of read_write_padded_frame() for 
> FWHT cases which is applying a sw cropping/compose if I got it right, 
> which seems incorrect for generic m2m.
> 
> https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-ctl/v4l2-ctl-streaming.cpp#n1112
> 
> https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-ctl/v4l2-ctl-streaming.cpp#n1372
> 
> I will open a thread on v4l2-utils to discuss this.
> 
> 
> > 
> > * You'll find this funny, or perhaps even insulting at first, but you'd be
> > surprise how much code (specially from ARM SoC vendors) that get sent every year
> > that don't even compile or have never been tested after being up-ported from an
> > older tree. And that is only scratching the surface of the problem we have to
> > deal with. Notably drivers were only 1 pixel format out of let's say 10 have
> > been tested that comes with broken stride and memory buffer size calculation
> > causing much larger troubles in the system.
> This certainly does not ensure the driver to be bug-free, but I swear I 
> tested all in/out pixel format combinations and driver compilation is 
> W=12 warnings free :)
> > 
> > > 
> > > Adding a generic dewarping API to V4L2 is possible but this was not the
> > > scope of this patchset, and anyway missing data on any existing public
> > > dewarp hardware implementation supported by the kernel is somehow a
> > > blocker for this.
> > 
> > I was asking to share about your research that made you opt-out any kind of non-
> > vendor control for this feature. From your original submission, it would have
> > been ill advised for me to assume anything. Note that programming interface for
> > a V4L2 driver does not need to be based on other hardware vendor interface. I'm
> > not in this industry, but there could have been an industry standard for
> > expressing lense correction, produce through a a calibration process. The one
> > thing I've been assuming is that you are in the industry and would be able to
> > share a bit on that.
> I am looking on dewarp stuff for 3 months but I can share for sure my 
> undersanding whatever it worths.
> The optical system can be mathematically described using a set of 
> matrices and lenses distorsion parameters which are estimated during 
> your calibration stage.
> 
> https://docs.opencv.org/4.5.5/dc/dbb/tutorial_py_calibration.html
> 
> Then it's a matter of resolving a non linear system (ouch) to get the 
> remapping lut correcting the distorsion. OpenCV computes a 1:1 pixel 
> (re)mapping.
> 
> This is obviously impossible to perform those software computation in 
> the kernel.
> One could imagine that some hw dewarpers might have implemented mapping 
> lut computation in hardware, and if so, the control api could have been 
> inherited from those calibration parameters. I have no idea if such 
> hardware exists.
> 
> Another alternative is to consider the remapping LUT as an input which 
> seems more reasonable applying divide and conquer concepts.
> I would rather go for such option if a generic v4l2 interface should be 
> designed and combined with a library. And this would likely help to get 
> synergies with openGL implementation from the application standpoint.
> 
> The driver would have to expose its mapping capabilities (mainly 
> vertices coordinates constraints (x:y mapping) and float resolution).
> But this might worth waiting a bit to check the availability trend on 
> such capable hardware.
> 
> 
> 
> > 
> > > 
> > > > 
> > > > > > 
> > > > > > > diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..0ef926c61cf0
> > > > > > > --- /dev/null
> > > > > > > +++ b/include/uapi/linux/dw100.h
> > > > > > > @@ -0,0 +1,11 @@
> > > > > > > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > > > > > > +/* Copyright 2022 NXP */
> > > > > > > +
> > > > > > > +#ifndef __UAPI_DW100_H__
> > > > > > > +#define __UAPI_DW100_H__
> > > > > > > +
> > > > > > > +#include <linux/v4l2-controls.h>
> > > > > > > +
> > > > > > > +#define V4L2_CID_DW100_MAPPING		(V4L2_CID_USER_DW100_BASE + 1)
> > > > > > > +
> > > > > > > +#endif
> > > > > > 
> > > > 
> > 

