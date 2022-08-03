Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCC9588B67
	for <lists+linux-media@lfdr.de>; Wed,  3 Aug 2022 13:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237470AbiHCLhS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Aug 2022 07:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236468AbiHCLhS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Aug 2022 07:37:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07069FD04
        for <linux-media@vger.kernel.org>; Wed,  3 Aug 2022 04:37:17 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F9D08B;
        Wed,  3 Aug 2022 13:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659526635;
        bh=GG3bcvz7alMj2a03YqJR8mL5nzOLkh7/DWe+e+4KVeI=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=TnLuStUnFPAtIHiXTJkOyH9PnhjeZi8+Wlc1FGdTlgvCuOZWlWFIaZVbuS9HZHgeJ
         wqMnbDMGHk4Si/lfEaBW+H8sJti9ARkA+xVA0pCbodWDny6Kp4a+clr/9fYsXU4prO
         hTweSSq77mzOR+MMKe5dLL+crxXpS0Kyt/TMgy4w=
Message-ID: <b7e3b283-a042-8b73-26f3-9aef0f5c7fbb@ideasonboard.com>
Date:   Wed, 3 Aug 2022 14:37:11 +0300
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
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <MW4PR02MB737849AF15E8004B2CB39C3BB09C9@MW4PR02MB7378.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 03/08/2022 12:03, Milen Mitkov (Consultant) wrote:
> Hey Tomi,
> 
> thank you for providing v12 of the routing and streams support patches! 
> We are using v11 of these to add CSI virtual channels support to the 
> Qualcomm Titan platform (a.k.a qcom-camss driver) and will be moving to 
> the brand new fresh v12 now.
> 
> I ponder several questions with regards to this newly added 
> functionality (not just v12, but all versions in general):
> 
> 1. What are the main benefits of having multiple streams, that can be 
> enabled/disabled/configured, on the same pad vs. say having multiple 
> pads, each of which can be enabled/disabled/configured?

The streams and pads are kind of similar, but also different.

One difference is a conceptual one, that a pad represents some kind of 
physical connector, streams are logical "virtual" pads or connectors.

But perhaps the main practical difference is that you had a hardcoded 
amount of pads, but the amount of streams is dynamic, adjusted based on 
the routing table.

> As far as I understood, in the user-space world each stream on the end 
> of the pipeline gets exposed as a /dev/video%d node. Each node 
> corresponds to a videodev which is wrapped in a media entity that has a 

Yes.

It would be nice to have a videodev that supports multiple streams, but 
at the moment there's no API for that kind of thing. Perhaps in the future.

> single sink pad. So in the end, all streams end up as multiple "stream 
> -> pad" correspondences. I am sure there is some benefit of having 
> multiple streams vs having multiple pads, but I am struggling to put it 
> into exact words.

Consider a bridge device with, say, 2 CSI2 inputs and 2 CSI2 outputs. 
The device can route streams from either input to either output, and 
possibly modify them (say, change virtual channel number).

How many pads would have there? You would need a predefined amount of 
pads, one for each stream. So how many streams? What's a stream? With 
CSI2, we can easily define at least that we can have streams identified 
with the VC and the DT. So, 4 VCs at max, but there can be many DTs. I 
don't remember how wide the DT field is, but lets say 10 DTs. That would 
be max 40 streams per input.

So the above device would need to have 40 * 4 pads to cover "all" 
possible uses. I say "all", because it's not clear how to define a 
stream. If the device in question can, say, split the incoming frame per 
line, and somehow output each of those lines separately, then, 
effectively, there would be as many streams as there are lines. That's a 
silly example, but I just want to highlight the dynamic nature of streams.

> 2. What is your userspace modus operandi with regards to testing these 

I have my own python scripts built on top of kms++. They're really not 
in such a condition that I could share them to others. Maybe I'll at 
some point find the time to clean them up...

> changes? For example, I figured out this much with regards to media-ctl:

Yes, it should be all doable with media-ctl, v4l2-ctl.

> media-ctl -R '"msm_csid0"[0/0->1/0[0x1],0/0->1/1[0x1]]'
> 
> If I want to configure the CSI decoder subdev (msm_csid0) to receive 1 
> stream on the sink pad and route it to 2 streams on its source pad. Is 
> my thinking correct?

Yes, if your HW can do that. I don't have HW that can split (or clone) a 
stream, so it's possible that the use case doesn't work.

> And I also wonder what is your preferred method to open each /dev/video 
> node in userspace concurrently? Are you, say, running 2 or more parallel 
> instances of yavta?

I do it with my script, but yes, I think running multiple yavtas should 
do the trick.

> 3. I assume, that with these changes, it's _strongly_ preferred that the 
> subdevice's active state management is left to the V4L2 API and not kept 
> internally like older drivers do?

A subdev that uses routing/streams _must_ use the subdev active state.

  Tomi
