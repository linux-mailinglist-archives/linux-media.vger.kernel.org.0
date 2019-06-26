Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88DE856F91
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 19:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfFZRdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 13:33:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35992 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfFZRdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 13:33:14 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1035510;
        Wed, 26 Jun 2019 19:27:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1561570050;
        bh=i14VRbRUNWeaIKjEs5xAYIdwAOF9WuME1WNthjXo334=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D7AdT3iHB/0TaRDGPON3Uu1w9UZ1SWe8rNbHY0LKbFytsYZFOOX5xgYHPMDriKuNl
         go7zLXJ7/ylQZy/6QEXBEdVbwSV8/fCmLJx1TavUSbtS+hWyPvGBMeIoy6KK91cFx1
         xbNWGAxwk2PBZ+wMy9Yycyz0YHUUD+Ib8HSGU81c=
Date:   Wed, 26 Jun 2019 20:25:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hugues FRUCHET <hugues.fruchet@st.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Yannick FERTRE <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Mickael GUENE <mickael.guene@st.com>
Subject: Re: [PATCH v2 0/3] DCMI bridge support
Message-ID: <20190626172503.GB6118@pendragon.ideasonboard.com>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <20190620161721.h3wn4nibomrvriw4@kekkonen.localdomain>
 <ae097d67-58fe-82d7-78d6-2445664f28db@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ae097d67-58fe-82d7-78d6-2445664f28db@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Mon, Jun 24, 2019 at 10:10:05AM +0000, Hugues FRUCHET wrote:
> Hi Sakari,
> 
>  > - Where's the sub-device representing the bridge itself?
> This is pointed by [1]: drivers/media/i2c/st-mipid02.c
> 
>  > - As the driver becomes MC-centric, crop configuration takes place
> through
>  >   V4L2 sub-device interface, not through the video device node.
>  > - Same goes for accessing sensor configuration: it does not take place
>  >   through video node but through the sub-device nodes.
> 
> Our objective is to be able to support either a simple parallel sensor
> or a CSI-2 sensor connected through a bridge without any changes on 
> userspace side because no additional processing or conversion involved, 
> only deserialisation is m.
> With the proposed set of patches, we succeeded to do so, the same 
> non-regression tests campaign is passed with OV5640 parallel sensor 
> (STM32MP1 evaluation board) or OV5640 CSI-2 sensor (Avenger96 board with 
> D3 mezzanine board).
> 
> We don't want driver to be MC-centric, media controller support was 
> required only to get access to the set of functions needed to link and
> walk trough subdevices: media_create_pad_link(), 
> media_entity_remote_pad(), etc...
> 
> We did a try with the v1 version of this patchset, delegating subdevices 
> handling to userspace, by using media-controller, but this require to 
> configure first the pipeline for each single change of resolution and 
> format before making any capture using v4l2-ctl or GStreamer, quite 
> heavy in fact.
> Benjamin did another try using new libcamera codebase, but even for a 
> basic capture use-case, negotiation code is quite tricky in order to
> match the right subdevices bus format to the required V4L2 format.

Why would it be trickier in userspace than in the kernel ? The V4L2
subdev operations are more or less expose verbatim through the subdev
userspace API.

> Moreover, it was not clear how to call libcamera library prior to any
> v4l2-ctl or GStreamer calls.

libcamera isn't meant to be called before v4l2-ctl or GStreamer.
Applications are supposed to be based directly on libcamera, or, for
existing userspace APIs such as V4L2 or GStreamer, compatibility layers
are supposed to be developed. For V4L2 it will take the form of a
LD_PRELOAD-able .so that will intercept the V4L2 API calls, making most
V4L2 applications work with libcamera unmodified (I said most as 100%
compatibility will likely not be achievable). For GStreamer it will take
the form of a GStreamer libcamera element that will replace the V4L2
source element.

> Adding 100 lines of code into DCMI to well configure resolution and 
> formats fixes the point and allows us to keep backward compatibility
> as per our objective, so it seems far more reasonable to us to do so
> even if DCMI controls more than the subdevice it is connected to.
> Moreover we found similar code in other video interfaces code like 
> qcom/camss/camss.c and xilinx/xilinx-dma.c, controlling the whole 
> pipeline, so it seems to us quite natural to go this way.

I can't comment on the qcom-camss driver as I'm not aware of its
internals, but where have you found such code in the Xilinx V4L2 drivers
?

> To summarize, if we cannot do the negotiation within kernel, delegating
> this to userspace implies far more complexity and breaks compatibility
> with existing applications without adding new functionalities.
> 
> Having all that in mind, what should be reconsidered in your opinion 
> Sakari ? Do you have some alternatives ?

First of all, let's note that your patch series performs to related but
still independent changes: it enables MC support, *and* enables the V4L2
subdev userspace API. The former is clearly needed and will allow you to
use the MC API internally in the kernel, simplifying pipeline traversal.
The latter then enables the V4L2 subdev userspace API, moving the
pipeline configuration responsibility to userspace.

You could in theory move to the MC API inside the kernel, without
enabling support for the V4L2 subdev userspace API. Configuring the
pipeline and propagating the formats would then be the responsibility of
the kernel driver. However, this will limit your driver to the
following:

- Fully linear pipelines only (single sensor)
- No support for controls implemented by multiple entities in the
  pipeline (for instance controls that would exist in both the sensor
  and the bridge, such as gains)
- No proper support for scaling configuration if multiple components in
  the pipeline can scale

Are you willing to set those limitations in stone and give up on
supporting those features ?

> On 6/20/19 6:17 PM, Sakari Ailus wrote:
> > On Tue, Jun 11, 2019 at 10:48:29AM +0200, Hugues Fruchet wrote:
> >> This patch serie allows to connect non-parallel camera sensor to
> >> DCMI thanks to a bridge connected in between such as STMIPID02 [1].
> >>
> >> Media controller support is introduced first, then support of
> >> several sub-devices within pipeline with dynamic linking
> >> between them.
> >> In order to keep backward compatibility with applications
> >> relying on V4L2 interface only, format set on video node
> >> is propagated to all sub-devices connected to camera interface.
> >>
> >> [1] https://www.spinics.net/lists/devicetree/msg278002.html
> > 
> > General notes on the set, not related to any single patch:
> > 
> > - Where's the sub-device representing the bridge itself?
> > 
> > - As the driver becomes MC-centric, crop configuration takes place through
> >    V4L2 sub-device interface, not through the video device node.
> > 
> > - Same goes for accessing sensor configuration: it does not take place
> >    through video node but through the sub-device nodes.
> > 

-- 
Regards,

Laurent Pinchart
