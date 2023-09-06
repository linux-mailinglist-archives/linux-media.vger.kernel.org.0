Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54AA6793D0F
	for <lists+linux-media@lfdr.de>; Wed,  6 Sep 2023 14:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234075AbjIFMuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Sep 2023 08:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbjIFMuD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Sep 2023 08:50:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79209E43
        for <linux-media@vger.kernel.org>; Wed,  6 Sep 2023 05:49:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6417C67;
        Wed,  6 Sep 2023 14:48:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694004510;
        bh=tQ+/8wI4yAZ9m47HaB8mlmEEw1ixF566VPNjYFEto6k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MHpjcnk8QxRcg9IEZFg7Jj0pImV69F8BhBOz7SkHK5IG69Pt2OxfRuz1TvAEduM86
         eUeQlCdEi7LGQwc2nY+LLrQb4YSgr9lgjFIGBaHv8nPlFg/rZWrpKJVRMANDTaF3+Y
         JWBZFGIYNOFBwYqZ6NClwiCzT2Pgl5A62WIvDStA=
Date:   Wed, 6 Sep 2023 15:50:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 04/10] media: uapi: Add generic serial metadata mbus
 formats
Message-ID: <20230906125009.GG17308@pendragon.ideasonboard.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-5-sakari.ailus@linux.intel.com>
 <0d022884-366d-4df0-caa6-2406714d5e07@ideasonboard.com>
 <ZOcFpbLmZHh1d6Vt@kekkonen.localdomain>
 <d16ebd3e-4837-3300-1e6b-4bf3e866e312@ideasonboard.com>
 <20230905163827.GA7971@pendragon.ideasonboard.com>
 <5e9c8fb5-6ae1-5f2c-2c1d-0a948c901dce@ideasonboard.com>
 <20230906113117.GD17308@pendragon.ideasonboard.com>
 <ZPhxwvkQO59gAjwQ@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZPhxwvkQO59gAjwQ@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Sep 06, 2023 at 12:34:10PM +0000, Sakari Ailus wrote:
> On Wed, Sep 06, 2023 at 02:31:17PM +0300, Laurent Pinchart wrote:
> > On Wed, Sep 06, 2023 at 11:28:37AM +0300, Tomi Valkeinen wrote:
> > > On 05/09/2023 19:38, Laurent Pinchart wrote:
> > > > On Thu, Aug 24, 2023 at 11:26:56AM +0300, Tomi Valkeinen wrote:
> > > >> On 24/08/2023 10:24, Sakari Ailus wrote:
> > > >>> On Wed, Aug 23, 2023 at 04:16:13PM +0300, Tomi Valkeinen wrote:
> > > >>>> On 08/08/2023 10:55, Sakari Ailus wrote:
> > > >>>>> Add generic serial metadata mbus formats. These formats describe data
> > > >>>>> width and packing but not the content itself. The reason for specifying
> > > >>>>> such formats is that the formats as such are fairly device specific but
> > > >>>>> they are still handled by CSI-2 receiver drivers that should not be aware
> > > > 
> > > > Do we want these formats to be CSI-2-specific ?
> > > >
> > > >>>>> of device specific formats. What makes generic metadata formats possible
> > > >>>>> is that these formats are parsed by software only, after capturing the
> > > >>>>> data to system memory.
> > > >>>>
> > > >>>> If I'm not mistaken, the CSI-2 spec doesn't say much about embedded data,
> > > >>>> except that it may exist. Afaics, in CSI-2, the embedded data is split into
> > > >>>> "lines", although the amount of data can be different than in the video
> > > >>>> lines.
> > > >>>>
> > > >>>> The CCS specs talks more about embedded data. Some of it is quite odd, like:
> > > >>>> "The length of the embedded data line shall not exceed the length of the
> > > >>>> image data line. The embedded data line should have the same length as the
> > > >>>> image data line.". I think it means the embedded line can be shorter than
> > > >>>> image line, but not longer.
> > > >>>
> > > >>> That's what it means, yes. The CCS also has means to obtain the actual
> > > >>> length --- frame format descriptors.
> > > >>>
> > > >>>> CCS also says that an embedded line should use 0x07 as padding at the end of
> > > >>>> the line, if there's less data than the image line.
> > > >>>>
> > > >>>> CCS also talks about how the embedded data would be packed, and in some
> > > >>>> cases that packing would be the same as for pixel data.
> > > >>>
> > > >>> In fact the packing is the same as for pixel data: the CSI-2 does not
> > > >>> really differentiate there.
> > > >>
> > > >> If I understand the CCS spec right, the packing is not the same as for
> > > >> the pixel data. You can have RAW12 pixel data but 8-byte embedded data.
> > > >> But if you meant that the different packing style options are the same
> > > >> for pixel and embedded data, yes.
> > > > 
> > > > The idea is to allow CSI-2 receivers to unpack embedded data the same
> > > > way as pixel data at the hardware level, and guarantee that no embedded
> > > 
> > > Yes, but my comment was to Sakari's "the packing is the same as for 
> > > pixel data" comment. Afaics, there's nothing in CSI-2 or CCS that says 
> > > the packing is the same for pixel data and embedded data.
> > > 
> > > In fact, the CSS says "By default, top-embedded data shall use the same 
> > > data packing as the Visible pixel data with one embedded data byte per 
> > > pixel", implying that it would not always be the case. It continues that 
> > > for RAW16/RAW20/RAW24 pixels the embedded data could be sent with 
> > > RAW8/RAW10/RAW12.
> > 
> > The spec if a bit ambiguous :-S "by default" implies that something else
> > could be done, but it's not clear what the other options are.
> 
> The options for packing are detailed in the spec. For higher bit depths
> there are options (as detailed by Tomi above).

The "by default" wording could be construed as allowing any packing. I
think the intent was to only allow an alternative packing for RAW16 and
higher, but it's not very clear.

> > > That was just for top-embedded data, and I couldn't right away see 
> > > mention of other embedded data.
> > 
> > The specification also mentions PDAF data for instance.
> 
> The bottom PDAF data is vendor defined (as it's processed) so the vendor is
> free to do whatever there. Note that the better way to support PDAF is via
> embedded PDAF pixels, not via separate bottom embedded (PDAF) data. The
> bottom embedded data could also be different kinds of statistics.

Lots of ISPs don't support hardware processing of embedded PDAF pixels,
so sensor-side processing is often nice to have. I wouldn't consider the
embedded PDAF lines to be always worse than embedded PDAF pixels.

> > > > data significant byte gets split across multiple samples. When unpacking
> > > > RAW10 pixel data, the CSI-2 receiver will take 5 bytes and output 4
> > > > samples on a 10-bit wide bus. For embedded data, it can conceptually do
> > > > that same, and output embedded data with one byte per sample, aligned on
> > > > the MSB of the 10-bit bus. However, in practice, I think the CSI-2
> > > > receiver will simply receive the bytes and send them to the DMA engine,
> > > > without unpacking and then repacking.
> > > 
> > > At least TI CAL CSI-2 RX can extract the data from the CSI-2 stream 
> > > using different unpacking for pixel and embedded data, and then 
> > > (optionally) pack it in different ways when writing to memory.
> > 
> > Does this mean that the CAL could take RAW10 embedded data and drop the
> > padding bytes when writing to memory ?
> > 
> > > > This can also be viewed as away to allow CSI-2 transmitters to serialize
> > > > pixel data and embedded data the same way. For a RAW10 sensor, for
> > > > instance, the embedded data would be generated on an internal 10-bit
> > > > wide bus, aligned to the MSB, and would go through CSI-2 packing the
> > > > same way that pixels do. That's nice, but it's internal to the sensor,
> > > > so we don't need to expose it to userspace on that side.
> > > > 
> > > >>>> But I don't think these formats are generic. They're defined in CCS, so
> > > >>>> shouldn't the format be, e.g., MEDIA_BUS_FMT_META_CCS_RAW_12 or such?
> > > >>>
> > > >>> The reason for having generic definitions is that we do not need receiver
> > > >>> drivers to be aware of formats that are specific to another driver.
> > > >>
> > > >> Yes, I agree with that, and that's not my point here. But "generic"
> > > >> doesn't mean the definitions are not for some particular bus or
> > > >> standard, "generic" just means that it doesn't specify the content, only
> > > >> the packing.
> > > >>
> > > >> My point is that these packings seem to be specific to CCS. While
> > > >> non-CCS compliant sensors may use the same packing, the packing itself
> > > >> is still a "CCS packing".
> > > > 
> > > > Agreed.
> > > > 
> > > >> So why not call them that? The 8-bit format is
> > > >> fully generic, whereas the rest are CCS packings, as defined in the CCS
> > > >> spec (the CCS spec also specifies the content, but here were only using
> > > >> the CCS packing).
> > > > 
> > > > I think an additional question is whether we actually need multiple
> > > > media bus codes here. Are there CSI-2 receivers, or other downstream
> > > > blocks, that will need to be configured differently to receive embedded
> > > > data from a CCS (in the sense of using CCS packing, not being fully
> > > > CCS-compliant) RAW10 sensor compared to a RAW12 sensor ? Or will the
> > > > CSI-2 receiver just send bytes to memory without caring ? In the latter
> > > > case, it will be the application that will need to know how the data is
> > > > packed to ignore one byte out of three for RAW12 and out of five for
> > > > RAW10.
> > > 
> > > I would presume all receivers can operate in "just write what you 
> > > receive" mode, in which case the packing doesn't matter as you say, but 
> > > then again, I think it's safer to have mbus codes for the different 
> > > packings.
> > > 
> > > >> Maybe they shouldn't be called "generic", but... umm... Content unaware
> > > >> metadata formats... doesn't sound very good =).
> > > >>
> > > >> Also, I'm a bit confused about CSI-2 pixel and embedded data formats and
> > > >> how we handle them.
> > > >>
> > > >> For MEDIA_BUS_FMT_SBGGR10_1X10, we define that the data contains 10 bits
> > > >> per pixel, from bit 0 to 9. But CSI-2, for RAW10, actually sends it
> > > >> differently, with the higher bits first, and the lowest bits in the
> > > >> fourth byte. So that CSI-2 packing is implicit, kind of hidden here.
> > > > 
> > > > Usage of MEDIA_BUS_FMT_SBGGR10_1X10 for CSI-2 is a historical decision
> > > > (or mistake, depending on how you look at it). It doesn't match what
> > > > actually happens on the bus.
> > > > 
> > > >> Which is probably fine, as we're really only interested in the unpacked
> > > >> data, not the CSI-2 packed. And when writing this data to memory, the
> > > >> DMA engine can write it either as is, or unpack each pixel to a 16-bit
> > > >> container.
> > > >>
> > > >> For MEDIA_BUS_FMT_META_10, we define it similarly to
> > > >> MEDIA_BUS_FMT_SBGGR10_1X10, except the lowest 2 bits are marked as
> > > >> padding bits. And, I think, MEDIA_BUS_FMT_META_10 implies RAW10 CSI-2
> > > >> format.
> > > > 
> > > > That's how I understand it too
> > > > 
> > > >> However, when writing the data to memory, we don't want either
> > > >> of the modes used in the above pixel data case, but rather we want to
> > > >> write the data as it is in the CSI-2 bus. So, the DMA engine can either
> > > >> reverse the RAW10 unpacking to get the wanted output format, or
> > > >> alternatively the CSI-2 receiver could instead use RAW8 mode to avoid
> > > >> any unpacking.
> > > > 
> > > > I don't think the DMA engine would "reverse the RAW10 packing" here. It
> > > > will write bytes as they arrive (or more likely, a set of bytes at a
> > > > time to operate on bursts). The other option would be for the DMA engine
> > > > to drop the padding bytes, but I don't know of any CSI-2 receiver that
> > > > can do that.
> > > 
> > > Well, for pixel data, TI CAL has the following options when writing to 
> > > memory for, e.g. RAW12:
> > > - RAW12 MIPI (a separate byte for lsbs)
> > > - RAW12 Linear (12 consecutive bits per pixel)
> > > - RAW16 (12 consecutive bits per pixel in a 16bit container)
> > > 
> > > Of these, only the RAW12 MIPI makes sense for embedded data (actually 
> > > the whole processing block can be and should be skipped for embedded 
> > > data, so it's more like CAL is receiving RAW8 and writing out RAW8).
> > > 
> > > Or, if it would be possible, skipping the padding bytes. Which looks 
> > > like it is almost possible with TI CAL, but not quite: it can write with 
> > > RAW8, but afaics that always takes the lowest bits of the 12-bit pixel, 
> > > but here we'd like it to take the highest bits.
> > 
> > That's a weird one, even for image data, dropping the MSBs doesn't make
> > much sense, while writing the RAW8 MSB when receiving RAW10 or RAW12
> > would be useful.
> 
> I'd suppose it would drop the four most significant bits if it was a
> parallel receiver. Does CAL have 8-bit input support? That should just work
> in this case.

-- 
Regards,

Laurent Pinchart
