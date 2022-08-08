Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E997958C36D
	for <lists+linux-media@lfdr.de>; Mon,  8 Aug 2022 08:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235756AbiHHGqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Aug 2022 02:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbiHHGpy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Aug 2022 02:45:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE015FA4
        for <linux-media@vger.kernel.org>; Sun,  7 Aug 2022 23:45:45 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1091949C;
        Mon,  8 Aug 2022 08:45:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659941142;
        bh=n90AQzZ+DZQf5ngJHbhwzcOr7eYnoEJ8lGNnh6kXLTs=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=WCjyCSOhHgABA6vbTeS3vwCsXL4X3DZMaj8GsV8Rvvo4/E+ai2zxlRc9IJz4IuSK7
         rLduyGlYM2iFHaGGadKRtRn1Tr7+eRxdo+VjiNcqLhptIETku0Q8jFmHGHwan8Ajtc
         kLJALV18nInvuVxIdyjWjaGz8OL4HDiAX6dpTVS4=
Message-ID: <d713dfb0-5506-ce04-36eb-5ca19a1088ee@ideasonboard.com>
Date:   Mon, 8 Aug 2022 09:45:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v12 00/30] v4l: routing and streams support
Content-Language: en-US
To:     "Milen Mitkov (Consultant)" <mmitkov@quicinc.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        "satish.nagireddy@getcruise.com" <satish.nagireddy@getcruise.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <MW4PR02MB737849AF15E8004B2CB39C3BB09C9@MW4PR02MB7378.namprd02.prod.outlook.com>
 <b7e3b283-a042-8b73-26f3-9aef0f5c7fbb@ideasonboard.com>
 <MW4PR02MB73781CDA5C792C28390BAF29B09E9@MW4PR02MB7378.namprd02.prod.outlook.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <MW4PR02MB73781CDA5C792C28390BAF29B09E9@MW4PR02MB7378.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/08/2022 18:14, Milen Mitkov (Consultant) wrote:

>  >> If I want to configure the CSI decoder subdev (msm_csid0) to receive 1
>  >> stream on the sink pad and route it to 2 streams on its source pad. Is
>  >> my thinking correct?
>  >
>  >Yes, if your HW can do that. I don't have HW that can split (or clone) a
>  >stream, so it's possible that the use case doesn't work.
> 
> Now here's the main question. We use the CSI decoder (CSID) hardware to 
> split
> one stream from the sensor into 2 or more streams based on datatype or 
> CSI virtual channel.
> 
> Basically, the complete pipeline is something like this, for 2 virtual 
> channels:
> 
>                                             -> ISP line 0 -> videodev 
> /dev/video0
>                                           /
> sensor -> CSIPHY -> CSID ->   
>                                           \
>                                           -> ISP line 1 -> videodev 
> /dev/video1
>                                     
>                                     
> So my idea was to make the CSID subdevice multistream API compliant
> (e.g. V4L2_SUBDEV_FL_STREAMS, manage the active state with the
> V4L2 API v4l2_subdev_get_locked_active_state, take care of routing setup 
> etc.),
> but keep the rest of the devices the way they are.

That's now how the streams support has been designed. Your sensor 
provides two streams, and all the drivers that pass through multiple 
streams needs to be ported to streams API. So in your case, I believe 
everything but the "ISP line" needs to support streams.

> The CSID subdev must take 1 stream on the sink pad and output on 2 
> source pads.
> 
> The routing configuration I use for the CSID subdev looks like this:
> 
> media-ctl -R '"msm_csid0"[0/0->1/0[0x1],0/0->2/0[0x1]]'
> 
> 0 - sink pad, 1 - first source pad, 2 - second source pad
> 
> However, this routing setup fails with the validation in 
> v4l2_link_validate_get_streams().
> The logic there figures these are duplicate streams because because they 
> start at the same sink pad.
> 
> To summarize my questions:
> 
> 1. Is there some sort of restriction that the same sink pad can't be 
> used for more than 1 stream starting from it?

In theory no, but it hasn't been tested. I think this case would mainly 
be cloning of the stream, not really splitting it.

> 2. Is it ok to migrate only one subdevice to the multistream API
> or should all possible subdevices in the pipeline be migrated?

It's ok to mix streams and non-streams subdevices, but the non-streams 
subdevs must only use a single stream. E.g. You could have 4 non-streams 
cameras, each providing a single stream to a bridge. The bridge would 
support streams, and the bridge would send the 4 streams in a single 
CSI-2 bus.

Now, that said, I don't think anything strictly prevents from supporting 
stream splitting, but as I mentioned above, it's not been tested or 
really even considered very much. It's also a bit ambiguous and unclear 
and I'd stay away from it if full streams support makes sense.

I think if a source subdev (sensor) knows that it's providing multiple 
streams, then it should use streams API to provide those. I.e. if the 
sensor is providing different types of data, using VCs or DTs, then 
those are clearly separate streams and the sensor driver must be aware 
of them.

Stream splitting might came into play in situations where the sensor 
provides just a single stream, but a bridge subdev splits it based on 
information the sensor can't be aware of. For example, the sensor 
provides a normal pixel stream, and the bridge subdev splits the frames 
into two halves, sending upper half to output 1 and lower half to output 2.

  Tomi
