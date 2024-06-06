Return-Path: <linux-media+bounces-12663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C128FF09C
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 17:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 098F81F241ED
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBFD19884B;
	Thu,  6 Jun 2024 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sHv4OEh2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8D9197A88;
	Thu,  6 Jun 2024 15:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717687491; cv=none; b=sMwgKDoHXUj03RPbV306LZGiPGRQyIVfrkbsryU5H7kGfwg3xG1+U+SR5gq0ZoAXj+tFkp4EPAU2UlQJEZeoxpO838IqkIo66oTnLgxOEMx9S+q59wbdPr8etmTT3QyJVlRD1gDZ6m/tBBdJKxW+TEOCsG5vru5gfqVXDXuKQ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717687491; c=relaxed/simple;
	bh=n78Zkhg4oKwDPOcSIozydgPL5XZLBnZuhcXJqM2vK+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jL6chaNFW4hjuPViqh+eGXtw1UE4taHj34mwwClIR+cA0wxCnZTGhXETFlu8aGcOnGZeP1afq9/ic2qZ0TVgvxVe1uHBOw1vDdSDZ+8mkPU2TTp2aXh858QXAe0NkxPbFmqhFFAdF+X4fiBQ+2y7lRYFsPyeNWlyvenqmvKPfxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sHv4OEh2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD88482A;
	Thu,  6 Jun 2024 17:24:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717687478;
	bh=n78Zkhg4oKwDPOcSIozydgPL5XZLBnZuhcXJqM2vK+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHv4OEh2ofR2FuF8C3NZUPZvd/YT3mptT70PJv1bxt256giOVKJjGVaT6gd7aM0iD
	 7vacxm9h1y6tS4cwGcXsOcGQLx8h3FJSsniXH/yQN9kdGJCSbkzdYL6kVmZYcAClx/
	 OZuwEROOI73uN6aBmduSA/azS8E8JPhBQUrkcUdY=
Date: Thu, 6 Jun 2024 18:24:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Julien Massot <julien.massot@collabora.com>, sakari.ailus@iki.fi,
	devicetree@vger.kernel.org, kernel@collabora.com,
	linux-kernel@vger.kernel.org, mchehab@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-media@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v7 0/5] Add support for MAX96714/F and MAX96717/F GMSL2
 ser/des
Message-ID: <20240606152428.GA26663@pendragon.ideasonboard.com>
References: <20240430131931.166012-1-julien.massot@collabora.com>
 <8d67c3b3-a3a6-4733-ac0d-ddd2c244d790@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d67c3b3-a3a6-4733-ac0d-ddd2c244d790@ideasonboard.com>

On Thu, Jun 06, 2024 at 04:34:19PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 30/04/2024 16:19, Julien Massot wrote:
> > Change since v6:
> >    - Remove mention of C-PHY for MAX96717, this serializer is D-PHY only
> >    - Remove bus-type requirement for MAX96717
> >    - Minor changes requested by Sakari
> >    - Workaround a MAX96717 issue, which occurs when stopping
> >      the CSI source before stopping the MAX96717 CSI receiver.
> > 
> > Power management is not included in this patchset. The GMSL link is
> > not always resuming when the deserializer is suspended without
> > suspending the serializer.
> > 
> > Change since v5:
> >   - Reverse fallback logic: max9671{4,7} can fallback to max9671{4,7}F
> >   - use const instead of enum for max9671{4,7}f compatible as suggested
> > 
> > Change since v4:
> >   - Add support for MAX96717 and MAX96714 and use them as a fallback for
> >     MAX96717F and MAX96714F respectively
> >   - The drivers are now compatible with MAX96717 and MAX96714 since no change in
> >     the logic is needed
> >   - Reference 'i2c-gate' instead of 'i2c-controller' in the bindings
> > 
> > Change since v3:
> > - bindings
> >    - Renamed bindings to drop the 'f' suffix
> >    - Add bus type to MAX96717 and remove from MAX9674
> >    - Add lane-polarities to both bindings
> > 
> > - drivers
> >    - Address changes requested by Sakari in v3
> >    - use v4l2_subdev_s_stream_helper for MAX96714
> >    - do not init regmap twice in the MAX96714 driver
> >    - Fix compilations on 32 bits platforms
> > 
> > Change since v2:
> > - Convert drivers to use CCI helpers
> > - Use generic node name
> > - Use 'powerdown' as gpio name instead of 'enable'
> > - Add pattern generator support for MAX96714
> > 
> > These patches add support for Maxim MAX96714F deserializer and
> > MAX96717F serializer.
> > 
> > MAX96714F has one GMSL2 input port and one CSI2 4 lanes output port,
> > MAX96717F has one CSI2 input port and one GMSL2 output port.
> > 
> > The drivers support the tunnel mode where all the
> > CSI2 traffic coming from an imager is replicated through the deserializer
> > output port.
> > 
> > Both MAX96714F and MAX96717F are limited to a 3Gbps forward link rate
> > leaving a maximum of 2.6Gbps for the video payload.
> 
> (I see this mail turned out to be a collection of thoughts rather than 
> clear questions... Bear with me =))
> 
> I know I'm very late to this party, and perhaps these topics have 
> already been discussed, but as I will most likely be doing some GMSL 
> work in the future I wanted to ask these questions. My main 
> questions/concerns are related to the i2c and the representation of the 
> links in the DT.
> 
> First, I know these particular devices are one input, one output 
> serializer and deserializer, so there's not much to do wrt. i2c 
> translation/gating. But even here I wonder how does one support a case 
> where a single local i2c bus would have two deserializer devices (with 
> different i2c addresses), connected to two identical camera modules?
> 
> Controlling the deserializers would work fine, but as the serializers 
> and the remote peripherals (sensor) would answer to identical i2c 
> addresses, it would conflict and not work.
> 
> If I understand the HW docs right, a way (maybe there are others?) to 
> handle this would be:
> - deser probes, but keeps the link disabled by default

I don't know if the GMSL2 deserializers typically start with the link
enabled or disabled by default, but I assume you mean here that early in
the probe sequence the driver would disable the link if it's enabled by
default.

Note that the forward (from serializer to deserializer, carrying video
and I2C "replies") and reverse (from deserializer to serializer,
carrying I2C "requests") can be controlled separately in GMSL1. I don't
know if GMSL2 allows doing the same. It would be good to be precise in
the discussions.

> - deser reads the initial serializer i2c address from the DT, but also a 
> new address which we want the serializer to have (which doesn't conflict 
> with the other serializer)

There's also the devices behind the serializer that we need to consider.
There will typically be one (a camera sensor), but possibly multiple
(microcontrollers, EEPROMs, ISPs, ...) such devices. With GMSL1, the
serializer has the ability to perform address translation for up to two
addresses, plus the ability to reprogram the serializer address. If we
end up having more than two devices behind the serializers, address
translation won't be good enough.

For GMSL1, we decided not to reprogram the serializer address, but
instead to implement an I2C mux in the deserializer driver. The
deserializer would disable all reverse links, and enable them
selectively through the I2C mux API. This ensured that only one reverse
link would be enabled at a time per deserializer. It didn't address the
issue of multiple deserializers on the same I2C bus.

There's also the issue of power management to consider. Power to the
cameras and deserializers could be cut when they're unused. We need to
ensure they can come back up with I2C conflicts, as they would be reset
to their default address. I don't know if this is a solvable problem in
the generic case with GMSL1 and GMSL2.

> - deser enables the link and immediately (how to be sure the other deser 
> driver doesn't do this at the same time?) sends a write to the 
> serializer's DEV_ADDR, changing the serializer's i2c address.

We faced a similar issue when we started working on the MAX9286 driver
(a quad GMSL1 deserializer). Our test platform had two MAX9286 on the
same I2C bus (for a total of 8 cameras), and all cameras were identical.

The initial driver implementation posted to the list ([1]) included a
mechanism to handle this problem:

	/*
	 * We can have multiple MAX9286 instances on the same physical I2C
	 * bus, and I2C children behind ports of separate MAX9286 instances
	 * having the same I2C address. As the MAX9286 starts by default with
	 * all ports enabled, we need to disable all ports on all MAX9286
	 * instances before proceeding to further initialize the devices and
	 * instantiate children.
	 *
	 * Start by just disabling all channels on the current device. Then,
	 * if all other MAX9286 on the parent bus have been probed, proceed
	 * to initialize them all, including the current one.
	 */
	max9286_i2c_mux_close(dev);
   
	/*
	 * The MAX9286 initialises with auto-acknowledge enabled by default.
	 * This means that if multiple MAX9286 devices are connected to an I2C
	 * bus, another MAX9286 could ack I2C transfers meant for a device on
	 * the other side of the GMSL links for this MAX9286 (such as a
	 * MAX9271). To prevent that disable auto-acknowledge early on; it
	 * will be enabled later as needed.
	 */
	max9286_configure_i2c(dev, false);
   
	ret = device_for_each_child(client->dev.parent, &client->dev,
				    max9286_is_bound);
	if (ret)
		return 0;
   
	dev_dbg(&client->dev,
		"All max9286 probed: start initialization sequence\n");
	ret = device_for_each_child(client->dev.parent, NULL,
				    max9286_init);

[1] https://lore.kernel.org/all/20180605233435.18102-3-kieran.bingham+renesas@ideasonboard.com/

This was considered as a hack and dropped, limiting support to a single
MAX9286 on a given I2C bus. I think we should revive that discussion,
and implement a generic mechanism to handle synchronized initialization
at probe time, synchronized operation of muxes across multiple
deserializers (if we decide to go that way for GMSL1), and synchronized
power up at runtime (again if we decide we can handle runtime power
management).

> - deser can now add the serializer linux i2c device, so that the 
> serializer can probe

I'm a bit concerned about having the deserializer driver writing to a
serializer register. If possible, I'd like that to be performed by the
serializer driver when it probes. Power management needs to be taken
into account here (if we decide to support it).

> - the serializer should prevent any remote i2c transactions until it has 
> written the SRC_A/B and DST_A/B registers, to get translation for the 
> remote peripherals (or maybe the deser driver should do this part too).
> 
> Am I on the right track with the above?

As explained above, we went the I2C mux way. I think address translation
would make sense to explore, but we may need to support falling back to
a mux if there are too many devices behind the serializers.

> Now, maybe having such a HW config, two deserializers on a single i2c 
> bus, doesn't happen in real life,

It did, we cried about it, and the world didn't care. Maybe we didn't
sacrifice the right goat to the right god, but I'm pretty sure we'll run
out of goats and/or gods before we run out of "interesting" hardware
designs.

> but this issue comes up with 
> multi-port deserializers. And while those deserializers are different 
> devices than what's added in this series, the serializers used may be 
> the same as here. This means the serializer drivers and DT bindings 
> should be such that multi-port deserializers can be supported.

I fully agree, the DT bindings need to consider more than just the
particular serializers and deserializers that this series covers.

> As I said, I'm late (and new) to this party, and struggling to consume 
> and understand all the related specs and drivers, so I hope you can give 
> some insight into how all this might be implemented in the future =).
> 
> Have you looked at the FPD-Link drivers (ds90ub9xx)? The i2c management 
> is a bit different with those (with my current understanding, a bit 
> saner...), but I wonder if similar style would help here, or if the 
> i2c-atr could be utilized. It would be nice (but I guess not really 
> mandatory in any way) to have similar style in DT bindings for all 
> ser-des solutions.
> 
> To summarize the i2c management on both FPD-Link and GMSL (if I have 
> understood it right):
> 
> In FPD-Link the deserializer does it all: it has registers for the 
> serializer i2c aliases, and for i2c address translation (per port). So 
> when the deser probes, it can program suitable i2c addresses (based on 
> data from DT), which will be the addresses visible on the main i2c bus, 
> and thus there are never any conflicts.

That's much nicer than the GMSL architecture in my opinion.

> In addition to that, the drivers utilize i2c-atr, which means that new 
> linux i2c busses are created for each serializer. E.g. the deser might 
> be, say, on i2c bus 4, and also the serializers, via their i2c aliases, 
> would be accessible bus 4. When the serializer drivers probe they will 
> create new i2c busses with i2c-atr. So with a 4 port deserializer we 
> might get i2c busses 5, 6, 7 and 8. The linux i2c devices for remote 
> peripherals (sensors mainly) would be created on these busses with their 
> real i2c addresses. When a sensor driver does an i2c write to its 
> device, the i2c-atr will catch the write, change the address according 
> to the translation table, and do an actual write on the i2c bus 4. This 
> would result in the deser HW to catch this write, switch the address 
> back to the "real" one, and send it to the appropriate serializer, which 
> would then send the i2c transaction on its i2c bus.
> 
> In GMSL the deser just forwards everything it sees on the i2c bus, if a 
> port is enabled. The deser has no other support related to i2c. The 
> serializers have DEV_ADDR register which can be used to change the 
> address the serializers respond to, and the serializers also have i2c 
> translation for two remote peripherals.

In addition to that, the deserializer (at least the MAX9286) has support
for auto-ack. When enabled, it will automatically ack any I2C write,
when the I2C reverse channel is available for the forward channel isn't.
It's a plug-and-pray approach, used to write serializer registers
related to the I2C forward channel configuration. One issue with this is
that any I2C write on the bus seen by the deserializer will be acked by
it, even if it is for a completely unrelated device.

> But if the i2c translation is used, it would mean that, say, the sensor 
> driver would need to use the "virtual" address, not the real one to 
> communicate with the sensor device, which doesn't sound right...

How so ? With FPD-Link, with ATR is enabled, doesn't the sensor driver
also use the "virtual" (as in host-visible) I2C address instead of the
real one (as in the address used on the bus physically connected to the
sensor) ?

> You have used i2c-gate for both the deser and the ser. I don't have 
> experience with i2c-gate, but how can we manage the serializer i2c 
> address and the i2c address translation with it?
> 
> One difference with the FPD-Link and this series' DT bindings is that I 
> have a "links" node in the deser, instead of just adding the serializers 
> under an i2c node. In FPD-Link case this allowed me to better represent 
> the hardware and the configuration needed.
> 
> So... Perhaps my bottom line question is: do we need something similar 
> to what the FPD-Link uses (links, i2c-atr) to fully support GMSL 
> devices? And also, if we merge the DT bindings in this series, will we 
> have gone into a corner wrt. how we can manage the i2c?

For consistency, I would like to keep the bindings as close as possible
to each other when there is no reason to do otherwise. Of course, we
already have GMSL1 and FPD-Link bindings that are not identical... Given
the backward compatibility of GMSL2 with GMSL1, we may need to stay
closer to the GMSL1 bindings than to the FPD-Link bindings. Of course,
any feature not available in the GMSL1 bindings that we would need to
design and implement can mimick the FPD-Link bindings.

-- 
Regards,

Laurent Pinchart

