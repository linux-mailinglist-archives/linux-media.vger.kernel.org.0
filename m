Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 491A15B4630
	for <lists+linux-media@lfdr.de>; Sat, 10 Sep 2022 14:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiIJMVU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Sep 2022 08:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiIJMVT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Sep 2022 08:21:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529114A103
        for <linux-media@vger.kernel.org>; Sat, 10 Sep 2022 05:21:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89C3C60C33
        for <linux-media@vger.kernel.org>; Sat, 10 Sep 2022 12:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807B2C433C1;
        Sat, 10 Sep 2022 12:21:12 +0000 (UTC)
Message-ID: <8a745b89-e63d-ac8f-d4fa-c985d830cb41@xs4all.nl>
Date:   Sat, 10 Sep 2022 14:21:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Media Summit] Using the selection API to control image sensor
 subsampling
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
References: <20220829071528.6fxm4kdvpjzkr3yw@uno.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220829071528.6fxm4kdvpjzkr3yw@uno.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 29/08/2022 09:15, Jacopo Mondi wrote:
> Hello
> 
>    I have prepared a slide deck to brief on the discussion for
> the topic specified in the subject. Slides are available at
> https://nc.nibble.pw/s/oib8jzNjjtgB9c6 as an attachment of ~5MB would
> probably be caught by the mailing list filter
> 
> I'll here copy a brief summary as presented in Hans' agenda:
> 
> -------------------------------------------------------------------------------
> 11:45 Jacopo: Representing addition sensor processing stages.
> 
>   How to represent additional processing stages that happens
>   on the sensor side, mostly additional subsampling/cropping that happen
>   between the analogue cropping on the full pixel array and the final
>   image sent on the wire.
> 
>   https://lore.kernel.org/linux-media/CAPY8ntA06L1Xsph79sv9t7MiDSNeSO2vADevuXZdXQdhWpSmow@mail.gmail.com/
> 
>   Dave made a good introduction of the issue his email which got
>   largely unanswered.
> 
>   The issue is particularly relevant for RAW sensors, where applying
>   subsampling has an impact on the sensor's sensitivity and requires
>   to adjust the gains and exposure accordingly.
> -------------------------------------------------------------------------------
> 
> The slide deck:
> 
> - Introduces the topic in slides [1-10]
> 
> - Presents Dave's proposed use case and how it is currently handled in
>   mainline drivers in slides [11-31] using as example the imx274,
>   mt9p031 and CCS drivers.
> 
> - Proposes a best-effort solution for imx219 in slides [32-37]
> 
> - The last two slides presents two discussion topics which I will copy
>   here
> 
>   ------------------------------------------------------------------------
>   Do we need new abstractions ?
> 
>   - An image sensor abstraction built on top of multiple subdevices
>     - Would it really make userspace any simpler ?
> 
>   - Image sensor specific SELECTION_TARGETS
>     - Conflicts with format selection are bound to happen with a single
>       source pad
>       - Can a “special” sink pad that represents the raw pixel array help ?
>     - Does not scale to represent complex sensors with multiple scalers
>   ------------------------------------------------------------------------
> 
> The imx219 proposal can be discussed by email or in person, while the
> questions in the last two slides might be worth being discussed during
> the meeting.

I've always wondered why binning and skipping wasn't implemented as controls.
You set them in userspace based on your needs, and they change the formats
and selection rectangles accordingly.

Trying to model it with selection rectangles is basically impossible.

For the discussion it would be good to know what kind of binning and skipping
schemes there are. Would it be fairly straightforward to translate it to a
control? Or are there many variations between vendors?

Regards,

	Hans

> 
> Thanks
>    j
> 

