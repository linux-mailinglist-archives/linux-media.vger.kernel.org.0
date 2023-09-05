Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC06E792E0F
	for <lists+linux-media@lfdr.de>; Tue,  5 Sep 2023 20:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239678AbjIES7s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Sep 2023 14:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241034AbjIES7m (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Sep 2023 14:59:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25FE3A8E
        for <linux-media@vger.kernel.org>; Tue,  5 Sep 2023 09:40:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15C6EAF2;
        Tue,  5 Sep 2023 18:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693931809;
        bh=uLu1DefAJsdeoaPSlV2WDdTZ8wTsJgcSyWKrC6dzDwA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fAxkySJ+OebVSyFXGyw5gA1dVAGFXCHhA/Iz4XR4giEdZUyKYTJIMu30tnFhXJlqr
         O+UQwWI0W+GPUW0fBpwJJwOcIP2Z1eCSuYexLcJ9mjjJJrTZCSQcQ4RFJP/rdrfTai
         2rkVjEocK6PqQQmv+YYfptx4zCFpeGL0xmUcl0wY=
Date:   Tue, 5 Sep 2023 19:38:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 04/10] media: uapi: Add generic serial metadata mbus
 formats
Message-ID: <20230905163827.GA7971@pendragon.ideasonboard.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-5-sakari.ailus@linux.intel.com>
 <0d022884-366d-4df0-caa6-2406714d5e07@ideasonboard.com>
 <ZOcFpbLmZHh1d6Vt@kekkonen.localdomain>
 <d16ebd3e-4837-3300-1e6b-4bf3e866e312@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d16ebd3e-4837-3300-1e6b-4bf3e866e312@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 24, 2023 at 11:26:56AM +0300, Tomi Valkeinen wrote:
> On 24/08/2023 10:24, Sakari Ailus wrote:
> > On Wed, Aug 23, 2023 at 04:16:13PM +0300, Tomi Valkeinen wrote:
> >> On 08/08/2023 10:55, Sakari Ailus wrote:
> >>> Add generic serial metadata mbus formats. These formats describe data
> >>> width and packing but not the content itself. The reason for specifying
> >>> such formats is that the formats as such are fairly device specific but
> >>> they are still handled by CSI-2 receiver drivers that should not be aware

Do we want these formats to be CSI-2-specific ?

> >>> of device specific formats. What makes generic metadata formats possible
> >>> is that these formats are parsed by software only, after capturing the
> >>> data to system memory.
> >>
> >> If I'm not mistaken, the CSI-2 spec doesn't say much about embedded data,
> >> except that it may exist. Afaics, in CSI-2, the embedded data is split into
> >> "lines", although the amount of data can be different than in the video
> >> lines.
> >>
> >> The CCS specs talks more about embedded data. Some of it is quite odd, like:
> >> "The length of the embedded data line shall not exceed the length of the
> >> image data line. The embedded data line should have the same length as the
> >> image data line.". I think it means the embedded line can be shorter than
> >> image line, but not longer.
> > 
> > That's what it means, yes. The CCS also has means to obtain the actual
> > length --- frame format descriptors.
> > 
> >> CCS also says that an embedded line should use 0x07 as padding at the end of
> >> the line, if there's less data than the image line.
> >>
> >> CCS also talks about how the embedded data would be packed, and in some
> >> cases that packing would be the same as for pixel data.
> > 
> > In fact the packing is the same as for pixel data: the CSI-2 does not
> > really differentiate there.
> 
> If I understand the CCS spec right, the packing is not the same as for 
> the pixel data. You can have RAW12 pixel data but 8-byte embedded data. 
> But if you meant that the different packing style options are the same 
> for pixel and embedded data, yes.

The idea is to allow CSI-2 receivers to unpack embedded data the same
way as pixel data at the hardware level, and guarantee that no embedded
data significant byte gets split across multiple samples. When unpacking
RAW10 pixel data, the CSI-2 receiver will take 5 bytes and output 4
samples on a 10-bit wide bus. For embedded data, it can conceptually do
that same, and output embedded data with one byte per sample, aligned on
the MSB of the 10-bit bus. However, in practice, I think the CSI-2
receiver will simply receive the bytes and send them to the DMA engine,
without unpacking and then repacking.

This can also be viewed as away to allow CSI-2 transmitters to serialize
pixel data and embedded data the same way. For a RAW10 sensor, for
instance, the embedded data would be generated on an internal 10-bit
wide bus, aligned to the MSB, and would go through CSI-2 packing the
same way that pixels do. That's nice, but it's internal to the sensor,
so we don't need to expose it to userspace on that side.

> >> But I don't think these formats are generic. They're defined in CCS, so
> >> shouldn't the format be, e.g., MEDIA_BUS_FMT_META_CCS_RAW_12 or such?
> > 
> > The reason for having generic definitions is that we do not need receiver
> > drivers to be aware of formats that are specific to another driver.
> 
> Yes, I agree with that, and that's not my point here. But "generic" 
> doesn't mean the definitions are not for some particular bus or 
> standard, "generic" just means that it doesn't specify the content, only 
> the packing.
> 
> My point is that these packings seem to be specific to CCS. While 
> non-CCS compliant sensors may use the same packing, the packing itself 
> is still a "CCS packing".

Agreed.

> So why not call them that? The 8-bit format is 
> fully generic, whereas the rest are CCS packings, as defined in the CCS 
> spec (the CCS spec also specifies the content, but here were only using 
> the CCS packing).

I think an additional question is whether we actually need multiple
media bus codes here. Are there CSI-2 receivers, or other downstream
blocks, that will need to be configured differently to receive embedded
data from a CCS (in the sense of using CCS packing, not being fully
CCS-compliant) RAW10 sensor compared to a RAW12 sensor ? Or will the
CSI-2 receiver just send bytes to memory without caring ? In the latter
case, it will be the application that will need to know how the data is
packed to ignore one byte out of three for RAW12 and out of five for
RAW10.

> Maybe they shouldn't be called "generic", but... umm... Content unaware 
> metadata formats... doesn't sound very good =).
> 
> Also, I'm a bit confused about CSI-2 pixel and embedded data formats and 
> how we handle them.
> 
> For MEDIA_BUS_FMT_SBGGR10_1X10, we define that the data contains 10 bits 
> per pixel, from bit 0 to 9. But CSI-2, for RAW10, actually sends it 
> differently, with the higher bits first, and the lowest bits in the 
> fourth byte. So that CSI-2 packing is implicit, kind of hidden here. 

Usage of MEDIA_BUS_FMT_SBGGR10_1X10 for CSI-2 is a historical decision
(or mistake, depending on how you look at it). It doesn't match what
actually happens on the bus.

> Which is probably fine, as we're really only interested in the unpacked 
> data, not the CSI-2 packed. And when writing this data to memory, the 
> DMA engine can write it either as is, or unpack each pixel to a 16-bit 
> container.
> 
> For MEDIA_BUS_FMT_META_10, we define it similarly to 
> MEDIA_BUS_FMT_SBGGR10_1X10, except the lowest 2 bits are marked as 
> padding bits. And, I think, MEDIA_BUS_FMT_META_10 implies RAW10 CSI-2 
> format.

That's how I understand it too

> However, when writing the data to memory, we don't want either 
> of the modes used in the above pixel data case, but rather we want to 
> write the data as it is in the CSI-2 bus. So, the DMA engine can either 
> reverse the RAW10 unpacking to get the wanted output format, or 
> alternatively the CSI-2 receiver could instead use RAW8 mode to avoid 
> any unpacking.

I don't think the DMA engine would "reverse the RAW10 packing" here. It
will write bytes as they arrive (or more likely, a set of bytes at a
time to operate on bursts). The other option would be for the DMA engine
to drop the padding bytes, but I don't know of any CSI-2 receiver that
can do that.

> Does the above make any sense? I'm a bit confused about all the packings 
> and unpackings =). Does MEDIA_BUS_FMT_META_10 mean that the CSI-2 TX 
> uses RAW10 CSI-2 packing, but the receiver uses RAW8 CSI-2 packing?
> 
> > If there is a need for new generic formats that do not match this, we can
> > always add more. But the point is: drivers for devices that do not produce
> > the data should never deal with (device) specific formats.
> > 
> > What comes to CSI-2 and these formats --- on parallel buses you might have
> > the data aligned to the least significant bits instead. But is there a need
> > to transport such data on parallel buses, at least so it would be expressed
> > in mbus formats?
> 
> I have a parallel sensor that sends embedded data. I'll have a look how 
> it organizes the data.

-- 
Regards,

Laurent Pinchart
