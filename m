Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328A32A69ED
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 17:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730542AbgKDQhB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 11:37:01 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34814 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbgKDQhB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 11:37:01 -0500
Received: from [IPv6:2804:14c:483:7e3e::1003] (unknown [IPv6:2804:14c:483:7e3e::1003])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3B23C1F45AA5;
        Wed,  4 Nov 2020 16:36:54 +0000 (GMT)
Subject: Re: [PATCH 00/14] Allwinner MIPI CSI-2 support for A31/V3s/A83T
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
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
 <d15d724b-6af7-3e51-1316-7bdde5a42c60@collabora.com>
 <20201104111137.GH285779@aptenodytes>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <fd2fb44e-1814-1589-216d-78eb96b39c3a@collabora.com>
Date:   Wed, 4 Nov 2020 13:36:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104111137.GH285779@aptenodytes>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On 11/4/20 8:11 AM, Paul Kocialkowski wrote:
> Hi Helen,
> 
> On Fri 30 Oct 20, 19:44, Helen Koike wrote:
>> Hi Paul,
>>
>> I have some comments through the series, I hope this helps.
> 
> Thanks for your comments :)
> 
>> On 10/23/20 2:45 PM, Paul Kocialkowski wrote:
>>> This series introduces support for MIPI CSI-2, with the A31 controller that is
>>> found on most SoCs (A31, V3s and probably V5) as well as the A83T-specific
>>> controller. While the former uses the same MIPI D-PHY that is already supported
>>> for DSI, the latter embeds its own D-PHY.
>>>
>>> In order to distinguish the use of the D-PHY between Rx mode (for MIPI CSI-2)
>>> and Tx mode (for MIPI DSI), a submode is introduced for D-PHY in the PHY API.
>>> This allows adding Rx support in the A31 D-PHY driver.
>>>
>>> A few changes and fixes are applied to the A31 CSI controller driver, in order
>>> to support the MIPI CSI-2 use-case.
>>>
>>> Follows is the V4L2 device topology representing the interactions between
>>> the MIPI CSI-2 sensor, the MIPI CSI-2 controller (which controls the D-PHY)
>>> and the CSI controller:
>>> - entity 1: sun6i-csi (1 pad, 1 link)
>>>             type Node subtype V4L flags 0
>>>             device node name /dev/video0
>>> 	pad0: Sink
>>> 		<- "sun6i-mipi-csi2":1 [ENABLED,IMMUTABLE]
>>>
>>> - entity 5: sun6i-mipi-csi2 (2 pads, 2 links)
>>>             type V4L2 subdev subtype Unknown flags 0
>>> 	pad0: Sink
>>> 		<- "ov5648 0-0036":0 [ENABLED,IMMUTABLE]
>>> 	pad1: Source
>>> 		-> "sun6i-csi":0 [ENABLED,IMMUTABLE]
>>>
>>> - entity 8: ov5648 0-0036 (1 pad, 1 link)
>>>             type V4L2 subdev subtype Sensor flags 0
>>>             device node name /dev/v4l-subdev0
>>
>> Question: I noticed is that sun6i-mipi-csi2 doesn't expose a node under /dev/, but the sensor
>> exposes it. Probably because it uses V4L2_SUBDEV_FL_HAS_DEVNODE and sun6i-csi() calls
>> v4l2_device_register_subdev_nodes().
>>
>> I find this weird from a userspace pov, since usually we don't mix manual and auto propagation
>> of the configs, so I started wondering if sun6i-csi driver should be calling
>> v4l2_device_register_subdev_nodes() in the first place.
> 
> I must admit that I didn't really pay attention to that, but since
> sun6i-mipi-csi2 is basically a bridge driver, it doesn't make sense to apply
> manual configuration to it. It is actually designed to forward most subdev ops
> to its own subdev so configuring it manually would actually result in
> configuring the sensor.

Ack, then maybe sun6i-csi needs a patch removing the call to v4l2_device_register_subdev_nodes()

> 
> XXX
> 
>> Also, sun6i-csi doesn't seem to be used by any board dts (it's declared on the dtsi, but I
>> didn't find any dts enabling it), so I wonder if it would be a bad thing if we update it.
>>
>>> 	pad0: Source
>>> 		[fmt:SBGGR8_1X8/640x480@1/30 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
>>> 		-> "sun6i-mipi-csi2":0 [ENABLED,IMMUTABLE]
>>
>> If I understand correctly, this is very similar to ipu3:
>>     sensor->bus->dma_engine
>>
>> in the case of ipu3-cio2:
>>     sensor->ipu3-csi2->ipu3-cio2
>>
>> in this case:
>>     ov5648->sun6i-mipi-csi2->sun6i-csi
> 
> Yes this is the correct picture.
> 
>> On thing that is confusing me is the name csi2 with csi (that makes me think of csi
>> version one, which is not the case), I would rename it to sun6i-video (or maybe
>> it is just me who gets confused).
> 
> So the CSI name comes from the Allwinner litterature and implementation for that
> controller. Since it supports parallel input on its own, it does in fact support
> parallel CSI. The DMA engine part alone from that controller is also used for
> MIPI CSI-2, so in this case the name looses its relevance.
> 
>> I know this driver is already upstream and not part of this series, but on the other hand it
>> doesn't seem to be used.
> 
> Personally I don't find a rename to be necessary and while I agree that
> nothing would apparently prevent us from renaming it, I would prefer to keep
> the naming in line with Allwinner's litterature.

Ok, I didn't know it was from Allwinner's litterature, I don't mind keeping the name.

> 
>> On another note, I always wonder if we should expose the bus in the topology, I'm not
>> sure if it provides any useful API or information for userspace, and you could have
>> a cleaner code (maybe code could be under phy subsystem). But at the same time, it
>> seems this is a pattern on v4l2.
>>
>> I'd like to hear what others think on the above.
> 
> My view on this is that we are dealing with two distinct controllers here,
> one that acts as a DMA engine and one that acts as a bridge. As a result, two
> chained subdevs looks like the most appropriate representation to me.
> 
> Using the PHY subsystem would probably be abusing the framework since the
> MIPI CSI-2 controller is not a PHY (and we do have a D-PHY driver for the D-PHY
> part that uses the PHY API already).
> 
> So tl;dr I don't agree that it would be cleaner.


My point is, this is a "dummy" subdevice in userspace pov,
but if it is only used with auto-propagation of the configurations, then
it doesn't matter (since userspace won't interact with that node).
And in the kernel space you need to implement media boilerplate code.
So I was trying to think in another alternative, but tbh I don't mind
keeping it in the media topology.

Regards,
Helen

> 
> Cheers,
> 
> Paul
> 
>>> Happy reviewing!
>>>
>>> Paul Kocialkowski (14):
>>>   phy: Distinguish between Rx and Tx for MIPI D-PHY with submodes
>>>   phy: allwinner: phy-sun6i-mipi-dphy: Support D-PHY Rx mode for MIPI
>>>     CSI-2
>>>   media: sun6i-csi: Support an optional dedicated memory pool
>>>   media: sun6i-csi: Fix the image storage bpp for 10/12-bit Bayer
>>>     formats
>>>   media: sun6i-csi: Only configure the interface data width for parallel
>>>   media: sun6i-csi: Support feeding from the MIPI CSI-2 controller
>>>   dt-bindings: media: i2c: Add A31 MIPI CSI-2 bindings documentation
>>>   media: sunxi: Add support for the A31 MIPI CSI-2 controller
>>>   ARM: dts: sun8i: v3s: Add CSI0 camera interface node
>>>   ARM: dts: sun8i: v3s: Add MIPI D-PHY and MIPI CSI-2 interface nodes
>>>   dt-bindings: media: i2c: Add A83T MIPI CSI-2 bindings documentation
>>>   media: sunxi: Add support for the A83T MIPI CSI-2 controller
>>>   ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
>>>   media: sunxi: sun8i-a83t-mipi-csi2: Avoid using the (unsolicited)
>>>     interrupt
>>>
>>>  .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 168 +++++
>>>  .../media/allwinner,sun8i-a83t-mipi-csi2.yaml | 158 +++++
>>>  arch/arm/boot/dts/sun8i-a83t.dtsi             |  26 +
>>>  arch/arm/boot/dts/sun8i-v3s.dtsi              |  62 ++
>>>  drivers/media/platform/sunxi/Kconfig          |   2 +
>>>  drivers/media/platform/sunxi/Makefile         |   2 +
>>>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  54 +-
>>>  .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  20 +-
>>>  .../platform/sunxi/sun6i-mipi-csi2/Kconfig    |  11 +
>>>  .../platform/sunxi/sun6i-mipi-csi2/Makefile   |   4 +
>>>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 635 +++++++++++++++++
>>>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   | 116 +++
>>>  .../sunxi/sun8i-a83t-mipi-csi2/Kconfig        |  11 +
>>>  .../sunxi/sun8i-a83t-mipi-csi2/Makefile       |   4 +
>>>  .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c    |  92 +++
>>>  .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h    |  39 ++
>>>  .../sun8i_a83t_mipi_csi2.c                    | 660 ++++++++++++++++++
>>>  .../sun8i_a83t_mipi_csi2.h                    | 196 ++++++
>>>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 164 ++++-
>>>  drivers/staging/media/rkisp1/rkisp1-isp.c     |   3 +-
>>>  include/linux/phy/phy-mipi-dphy.h             |  13 +
>>>  21 files changed, 2408 insertions(+), 32 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
>>>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi-csi2.yaml
>>>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
>>>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
>>>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
>>>  create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
>>>  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
>>>  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Makefile
>>>  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>>>  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h
>>>  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
>>>  create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h
>>>
> 
