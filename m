Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A7E5F77C4
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 13:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiJGL6k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 07:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJGL6f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 07:58:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDB5CF866;
        Fri,  7 Oct 2022 04:58:33 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D90BBBBE;
        Fri,  7 Oct 2022 13:58:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665143911;
        bh=v5HsThQcrApFO/RRHq0wRJMHyC462XDJhteLf+j9ksg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=gDH9yrf5vDcvx/i9cj0ohjZnJwJG5J0wK7P4KxaYArdXbcbSZyT19Q/eTgGEYtp/k
         DF6YPTxs5NGyCd2IWMoEWoE9WDbqrTHRzeOmo9NekIAwJcKzFXs4szwzO6lJU6UjeT
         p8OLkJgcLCeIbJ+35Kq0NUCELi0ZwFCjCog65Uws=
Message-ID: <fe62899e-7718-afb6-21db-83da333b8a9b@ideasonboard.com>
Date:   Fri, 7 Oct 2022 14:58:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 00/31] v4l: add support for multiplexed streams
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, luca@lucaceresoli.net,
        ian.arkver.dev@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190328200608.9463-1-jacopo+renesas@jmondi.org>
 <1510023a-a6aa-611e-8920-32b949ec5250@ideasonboard.com>
 <Yz66ADqFVj2UY248@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Yz66ADqFVj2UY248@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/10/2022 14:20, Sakari Ailus wrote:
> Moi,
> 
> On Thu, Feb 11, 2021 at 03:44:56PM +0200, Tomi Valkeinen wrote:

You found an old one =).

>> Hi all,
>>
>> On 28/03/2019 22:05, Jacopo Mondi wrote:
>>> Hello,
>>>     new iteration of multiplexed stream support patch series.
>>>
>>> V3 available at:
>>> https://patchwork.kernel.org/cover/10839889/
>>>
>>> V2 sent by Niklas is available at:
>>> https://patchwork.kernel.org/cover/10573817/
>>>
>>> Series available at:
>>> git://jmondi.org/linux v4l2-mux/media-master/v4
>>
>> I'm trying to understand how these changes can be used with virtual
>> channels and also with embedded data.
>>
>> I have an SoC with two CSI-2 RX ports, both of which connect to a
>> processing block with 8 DMA engines. Each of the DMA engines can be
>> programmed to handle a certain virtual channel and datatype.
>>
>> The board has a multiplexer, connected to 4 cameras, and the multiplexer
>> connects to SoC's CSI-2 RX port. This board has just one multiplexer
>> connected, but, of course, both RX ports could have a multiplexer,
>> amounting to total 8 cameras.
>>
>> So, in theory, there could be 16 streams to be handled (4 pixel streams
>> and 4 embedded data streams for both RX ports). With only 8 DMA engines
>> available, the driver has to manage them dynamically, reserving a DMA
>> engine when a stream is started.
>>
>> My confusion is with the /dev/video nodes. I think it would be logical
>> to create 8 of them, one for each DMA engine (or less, if I know there
>> is only, say, 1 camera connected, in which case 2 nodes would be
> 
> For more complex devices, it is often not possible to define such a number.
> Say, put an external ISP in between the sensor and the CSI-2 receiver, and
> you may get more streams than you would from the sensor alone.
> 
>> enough). But in that case how does the user know what data is being
>> received from that node? In other words, how to connect, say,
>> /dev/video0 to second camera's embedded data stream?
>>
>> Another option would be to create 16 /dev/video nodes, and document that
>> first one maps to virtual channel 0 + pixel data, second to virtual
>> channel 0 + embedded data, and so on. And only allow 8 of them to be
>> turned on at a time. But I don't like this idea much.
> 
> This isn't great IMO as it is limited to pre-defined use cases.
> 
>>
>> The current driver architecture is such that the multiplexer is modeled
>> with a subdev with 4 sink pads and one source pad, the SoC's RX ports
>> are subdevs with a single sink and a single output pad, and then there
>> are the video devices connected to RX's source pad.
>>
>> And while I can connect the video node's pad to the source pad on either
>> of the RX ports, I don't think I have any way to define which stream it
>> receives.
>>
>> Does that mean that each RX port subdev should instead have 8 source
>> pads? Isn't a pad like a physical connection? There's really just one
>> output from the RX port, with multiplexed streams, so 8 pads doesn't
>> sound right.
> 
> If you have eight DMAs you should always have eight video nodes.
> 
> I would put one link between the sub-device and a video node, and handle
> the incoming streams by routing them to the desired video nodes.

This is how it's been for quite a while. However, I think this model 
causes problems with more programmable DMA systems, where there's no 
maximum number of DMA "engines" (or the max is something like 256). But 
for now those systems can just define a sensible number of DMAs (8? 16? 
I guess it depends on the HW).

  Tomi

