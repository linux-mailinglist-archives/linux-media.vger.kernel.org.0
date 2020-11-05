Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337AF2A8091
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 15:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730999AbgKEOPA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 09:15:00 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48482 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729113AbgKEOO7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 09:14:59 -0500
Received: from [IPv6:2804:14c:483:7e3e::1003] (unknown [IPv6:2804:14c:483:7e3e::1003])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2E3581F4644C;
        Thu,  5 Nov 2020 14:14:51 +0000 (GMT)
Subject: Re: [PATCH 08/14] media: sunxi: Add support for the A31 MIPI CSI-2
 controller
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-9-paul.kocialkowski@bootlin.com>
 <1a3a615c-a058-e282-2dbb-c99dfa98be68@collabora.com>
 <20201102092110.ro6a456lvbrktwoz@gilmour.lan>
 <20201104111710.GB287014@aptenodytes>
 <f74e4d59-a391-36ab-74aa-8e02aca1b0bc@collabora.com>
 <20201104184538.f6qagsmjdoijbzmv@gilmour.lan>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <3b99b055-ff53-c873-19b2-fd2ccc86956d@collabora.com>
Date:   Thu, 5 Nov 2020 11:14:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104184538.f6qagsmjdoijbzmv@gilmour.lan>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/4/20 3:45 PM, Maxime Ripard wrote:
> On Wed, Nov 04, 2020 at 01:38:08PM -0300, Helen Koike wrote:
>>
>>
>> On 11/4/20 8:17 AM, Paul Kocialkowski wrote:
>>> Hi,
>>>
>>> On Mon 02 Nov 20, 10:21, Maxime Ripard wrote:
>>>> On Fri, Oct 30, 2020 at 07:45:18PM -0300, Helen Koike wrote:
>>>>> On 10/23/20 2:45 PM, Paul Kocialkowski wrote:
>>>>>> The A31 MIPI CSI-2 controller is a dedicated MIPI CSI-2 controller
>>>>>> found on Allwinner SoCs such as the A31 and V3/V3s.
>>>>>>
>>>>>> It is a standalone block, connected to the CSI controller on one side
>>>>>> and to the MIPI D-PHY block on the other. It has a dedicated address
>>>>>> space, interrupt line and clock.
>>>>>>
>>>>>> Currently, the MIPI CSI-2 controller is hard-tied to a specific CSI
>>>>>> controller (CSI0) but newer SoCs (such as the V5) may allow switching
>>>>>> MIPI CSI-2 controllers between CSI controllers.
>>>>>>
>>>>>> It is represented as a V4L2 subdev to the CSI controller and takes a
>>>>>> MIPI CSI-2 sensor as its own subdev, all using the fwnode graph and
>>>>>> media controller API.
>>>>>
>>>>> Maybe this is a bad idea, but I was thinking:
>>>>> This driver basically just turn on/off and catch some interrupts for errors,
>>>>> and all the rest of v4l2 config you just forward to the next subdevice
>>>>> on the pipeline.
>>>>>
>>>>> So instead of exposing it as a subdevice, I was wondering if modeling
>>>>> this driver also through the phy subsystem wouldn't be cleaner, so
>>>>> you won't need all the v4l2 subdevice/topology boilerplate code that
>>>>> it seems you are not using (unless you have plans to add controls or
>>>>> some specific configuration on this node later).
>>>>>
>>>>> But this would require changes on the sun6i-csi driver.
>>>>>
>>>>> What do you think?
>>>>
>>>> Eventually we'll need to filter the virtual channels / datatypes I
>>>> guess, so it's definitely valuable to have it in v4l2
>>
>> Which kind of datatypes? 
> 
> MIPI-CSI datatypes. Each packet on the MIPI-CSI bus is assigned a
> virtual channel and data type so that you can multiplex multiple streams
> (like a 3d camera would send for example, through the virtual channels)
> and data types (like frames and metadata) and MIPI-CSI controllers
> usually allow to filter them based on what you want.
> 
>> I ask to know if this shouldn't be configured through the video node
>> instead of subdevice.
> 
> Not really, some setups have a mux that can split the multiple virtual
> channels to multiple video nodes for example.
> 
>> Regarding channels, we had a discussion to implement it through the video
>> node (and not subdevice) [1]. But we discussed about blitters and multi-scalers,
>> so now I'm wondering if we could use the same API for mipi-csi virtual channels
>> in the video entity device, or if it doesn't apply and we need another API
>> for that in a subdevice instead.
>>
>> [1] https://patchwork.linuxtv.org/project/linux-media/cover/20200717115435.2632623-1-helen.koike@collabora.com/
> 
> There's already an API to deal with MIPI-CSI virtual channels:
> https://patchwork.kernel.org/project/linux-renesas-soc/cover/20190328200608.9463-1-jacopo+renesas@jmondi.org/
> 
> Maxime
> 

Thanks for the explanation :)

Helen
