Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7972959930B
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 04:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241237AbiHSCbQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Aug 2022 22:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239340AbiHSCbO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Aug 2022 22:31:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7EAC742B
        for <linux-media@vger.kernel.org>; Thu, 18 Aug 2022 19:31:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3DDF3F1;
        Fri, 19 Aug 2022 04:31:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1660876272;
        bh=UP51vNMTq2JlpPfoVcCz2Bc1BWrElIUP2KlcwFLgdeQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SV5DIjO9ooiy+a7MrO1uGjOQjzHjV9jDFzDxMLgPhwc7rxTWDgcASPCZBP/xkdKVR
         ilAw/tfZhi7ogc2G5ojsCJh2CwjFiDqx0sBuiXA9n/yfejAejEmQJV87bHkReiiK0b
         x3bAG4fk4C1V16dHDkvJEj7c5g8d25SFklQBuxoo=
Date:   Fri, 19 Aug 2022 05:31:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     "Milen Mitkov (Consultant)" <mmitkov@quicinc.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        "satish.nagireddy@getcruise.com" <satish.nagireddy@getcruise.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v12 00/30] v4l: routing and streams support
Message-ID: <Yv717OFWbbgvginn@pendragon.ideasonboard.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <MW4PR02MB737849AF15E8004B2CB39C3BB09C9@MW4PR02MB7378.namprd02.prod.outlook.com>
 <b7e3b283-a042-8b73-26f3-9aef0f5c7fbb@ideasonboard.com>
 <MW4PR02MB73781CDA5C792C28390BAF29B09E9@MW4PR02MB7378.namprd02.prod.outlook.com>
 <d713dfb0-5506-ce04-36eb-5ca19a1088ee@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d713dfb0-5506-ce04-36eb-5ca19a1088ee@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 08, 2022 at 09:45:38AM +0300, Tomi Valkeinen wrote:
> On 05/08/2022 18:14, Milen Mitkov (Consultant) wrote:
> 
> > >> If I want to configure the CSI decoder subdev (msm_csid0) to receive 1
> > >> stream on the sink pad and route it to 2 streams on its source pad. Is
> > >> my thinking correct?
> > >
> > > Yes, if your HW can do that. I don't have HW that can split (or clone) a
> > > stream, so it's possible that the use case doesn't work.
> > 
> > Now here's the main question. We use the CSI decoder (CSID) hardware to 
> > split
> > one stream from the sensor into 2 or more streams based on datatype or 
> > CSI virtual channel.
> > 
> > Basically, the complete pipeline is something like this, for 2 virtual 
> > channels:
> > 
> >                               -> ISP line 0 -> videodev /dev/video0
> >                             /
> > sensor -> CSIPHY -> CSID ->
> >                             \
> >                               -> ISP line 1 -> videodev /dev/video1
> >                                     
> >                                     
> > So my idea was to make the CSID subdevice multistream API compliant
> > (e.g. V4L2_SUBDEV_FL_STREAMS, manage the active state with the
> > V4L2 API v4l2_subdev_get_locked_active_state, take care of routing setup 
> > etc.),
> > but keep the rest of the devices the way they are.
> 
> That's now how the streams support has been designed. Your sensor 
> provides two streams, and all the drivers that pass through multiple 
> streams needs to be ported to streams API. So in your case, I believe 
> everything but the "ISP line" needs to support streams.

To add a bit of information here, the important thing to understand is
that streams and physical links are two different concepts. The above
diagram describes the physical links (both outside the SoC, and inside
it). Streams are carried by physical links, and a link can carry
multiple streams (hence the name "multiplexed streams" used in this
patch series). If the sensor outputs image data and embedded data with
two CSI-2 DT on one VC, that's two streams carried over the sensor ->
CSIPHY link, and the same two streams going over the CSIPHY -> CSID
link. The CSID demultiplexes the streams, with one stream going to ISP
line 0 and the other one to ISP line 1. As Tomi explained, every subdev
that deals with multiple streams has to implement the new API. This
includes, in this case, the sensor, the CSIPHY and the CSID.

If the sensor were to output two images in different resolutions over
two VCs, it would conceptually be the same, with two streams. If it were
to output image data, embedded data and black level lines over with 3
DTs over one VC, that would be three streams. And so on.

> > The CSID subdev must take 1 stream on the sink pad and output on 2 
> > source pads.
> > 
> > The routing configuration I use for the CSID subdev looks like this:
> > 
> > media-ctl -R '"msm_csid0"[0/0->1/0[0x1],0/0->2/0[0x1]]'
> > 
> > 0 - sink pad, 1 - first source pad, 2 - second source pad
> > 
> > However, this routing setup fails with the validation in 
> > v4l2_link_validate_get_streams().
> > The logic there figures these are duplicate streams because because they 
> > start at the same sink pad.
> > 
> > To summarize my questions:
> > 
> > 1. Is there some sort of restriction that the same sink pad can't be 
> > used for more than 1 stream starting from it?
> 
> In theory no, but it hasn't been tested. I think this case would mainly 
> be cloning of the stream, not really splitting it.
> 
> > 2. Is it ok to migrate only one subdevice to the multistream API
> > or should all possible subdevices in the pipeline be migrated?
> 
> It's ok to mix streams and non-streams subdevices, but the non-streams 
> subdevs must only use a single stream. E.g. You could have 4 non-streams 
> cameras, each providing a single stream to a bridge. The bridge would 
> support streams, and the bridge would send the 4 streams in a single 
> CSI-2 bus.
> 
> Now, that said, I don't think anything strictly prevents from supporting 
> stream splitting, but as I mentioned above, it's not been tested or 
> really even considered very much. It's also a bit ambiguous and unclear 
> and I'd stay away from it if full streams support makes sense.
> 
> I think if a source subdev (sensor) knows that it's providing multiple 
> streams, then it should use streams API to provide those. I.e. if the 
> sensor is providing different types of data, using VCs or DTs, then 
> those are clearly separate streams and the sensor driver must be aware 
> of them.
> 
> Stream splitting might came into play in situations where the sensor 
> provides just a single stream, but a bridge subdev splits it based on 
> information the sensor can't be aware of. For example, the sensor 
> provides a normal pixel stream, and the bridge subdev splits the frames 
> into two halves, sending upper half to output 1 and lower half to output 2.

We've tested splitting on an i.MX8MP, with two different processing
pipelines capturing the stream produced by a single YUV sensor, in
different resolutions and formats. It works (or at least worked with v11
of the streams series, I'll update the code to v13 and retest).

-- 
Regards,

Laurent Pinchart
