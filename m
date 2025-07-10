Return-Path: <linux-media+bounces-37272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9727CAFFD99
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 11:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73154483E81
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 09:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78A928FFCF;
	Thu, 10 Jul 2025 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QNPTeQr+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B4F28ECC0;
	Thu, 10 Jul 2025 09:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138635; cv=none; b=SSMEQpeDkO4MHjhcCYhBg4/t1qE8FnitrMnlVlzReceWsNfYABjL4X+l7vSeOGVrXG7mp3IHDxPtKlG+CD38gpQzBHomollTA0WljGxrCWmTeS+KQAtBygMT6aNAV9GqfyTGlcKu5HRGoiQmA0+MRnNQ/YozUu7jIWW8+cKf8ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138635; c=relaxed/simple;
	bh=KnQLeV/muA9zmcPpgnW5VbMVrTzSV8M0rsvTF3LBqxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gER6lQiDhkdpEPyr8iytoAEtnChmaUuqmZuDBIY8g1igMHGmnkr9pjjH793f68J5YrN1koFT9PRpZrO/C4dcieuzvN7J6p0xelsPOVWCAUhM2/D/cTY8mip35j7mQDhqzMPZViNZ+JJFa3e+0i6njAzOJg7DLyJFg6fPXHlRo7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QNPTeQr+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [78.208.207.146])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B18E7C0B;
	Thu, 10 Jul 2025 11:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752138602;
	bh=KnQLeV/muA9zmcPpgnW5VbMVrTzSV8M0rsvTF3LBqxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QNPTeQr+a2cRLw7XRTh+kjj+if9f/5JnsJvs69DfVjKYIYLCQ50RCkTHob1dKtzcA
	 awpdJIWOCzoIaLBPthhWNTN2QrrgwnqRX/Vw1hDwj/tc7KKJn6hdPts8RQY1ZD888g
	 q0phSQMERsSQQDfKEvqgFP0AJjCjZN9/ive80a78=
Date: Thu, 10 Jul 2025 11:10:26 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] media: uapi: Introduce V4L2 extensible params
Message-ID: <b6b5pmk3flqfminyrccmespqhbznqqfn2ggn2ooqomflcoqun6@maoza7zuoq2r>
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
 <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>
 <9b12b035-a80d-4d12-a039-daa94d13280e@ideasonboard.com>
 <yydzeg53koeawjc3vtzwfnq5x6avmv4ep53bcxff6kvzzu36jl@qp37ojw2drug>
 <78006c71-592b-4f54-93ed-5f4b21b5bc33@ideasonboard.com>
 <gemjiujyal7jf6gq7vd5wemriqkz7knxmkoe76fgmhhto6xzqu@zgy4r4ynaoe7>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gemjiujyal7jf6gq7vd5wemriqkz7knxmkoe76fgmhhto6xzqu@zgy4r4ynaoe7>

Hi Dan
 one correction

On Thu, Jul 10, 2025 at 09:15:54AM +0200, Jacopo Mondi wrote:
> Hi Dan
>
> On Wed, Jul 09, 2025 at 02:18:07PM +0100, Dan Scally wrote:
> > Hi Jacopo
> >
> > On 09/07/2025 12:53, Jacopo Mondi wrote:
> > > Hi Dan,
> > >     thanks for the comments
> > >
> > > On Wed, Jul 09, 2025 at 12:33:17PM +0100, Dan Scally wrote:
> > > > Hi Jacopo - thanks for the patches
> > > >
> > > > On 08/07/2025 11:40, Jacopo Mondi wrote:
> > > > > Introduce v4l2-extensible-params.h in the Linux kernel uAPI.
> > > > >
> > > > > The header defines two types that all drivers that use the extensible
> > > > > parameters format for ISP configuration shall use to build their own
> > > > > parameters format.
> > > > >
> > > > > The newly introduce type v4l2_params_block represent the
> > > > > header to be prepend to each ISP configuration block and the
> > > > > v4l2_params_buffer type represent the base type for the configuration
> > > > > parameters buffer.
> > > > >
> > > > > The newly introduced header is not meant to be used directly by
> > > > > applications which should instead use the platform-specific ones.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > ---
> > > > >    MAINTAINERS                                       |   6 ++
> > > > >    include/uapi/linux/media/v4l2-extensible-params.h | 106 ++++++++++++++++++++++
> > > > >    2 files changed, 112 insertions(+)
> > > > >
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index 658543062bba3b7e600699d7271ffc89250ba7e5..49a9329e5fe8874bdbaca13946ea28bd80134cb3 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -25968,6 +25968,12 @@ F:	drivers/media/i2c/vd55g1.c
> > > > >    F:	drivers/media/i2c/vd56g3.c
> > > > >    F:	drivers/media/i2c/vgxy61.c
> > > > > +V4L2 EXTENSIBLE PARAMETERS FORMAT
> > > > > +M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > +L:	linux-media@vger.kernel.org
> > > > > +S:	Maintained
> > > > > +F:	include/uapi/linux/media/v4l2-extensible-params.h
> > > > > +
> > > > >    VF610 NAND DRIVER
> > > > >    M:	Stefan Agner <stefan@agner.ch>
> > > > >    L:	linux-mtd@lists.infradead.org
> > > > > diff --git a/include/uapi/linux/media/v4l2-extensible-params.h b/include/uapi/linux/media/v4l2-extensible-params.h
> > > > > new file mode 100644
> > > > > index 0000000000000000000000000000000000000000..ed37da433c6b1a34523b6a9befde5c0dee601cfb
> > > > > --- /dev/null
> > > > > +++ b/include/uapi/linux/media/v4l2-extensible-params.h
> > > > > @@ -0,0 +1,106 @@
> > > > > +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) */
> > > > > +/*
> > > > > + * Video4Linux2 extensible configuration parameters base types
> > > > > + *
> > > > > + * Copyright (C) 2025 Ideas On Board Oy
> > > > > + * Author: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > + */
> > > > > +
> > > > > +#ifndef _UAPI_V4L2_PARAMS_H_
> > > > > +#define _UAPI_V4L2_PARAMS_H_
> > > > > +
> > > > > +#ifndef _UAPI_V4L2_EXTENSIBLE_PARAMS_GUARD_
> > > > > +/*
> > > > > + * Note: each ISP driver exposes a different uAPI, where the types layout
> > > > > + * match (more or less strictly) the hardware registers layout.
> > > > > + *
> > > > > + * This file defines the base types on which each ISP driver can implement its
> > > > > + * own types that define its uAPI.
> > > > > + *
> > > > > + * This file is not meant to be included directly by applications which shall
> > > > > + * instead only include the ISP-specific implementation.
> > > > > + */
> > > > > +#error "This file should not be included directly by applications"
> > > > > +#endif
> > > > > +
> > > > > +#include <linux/types.h>
> > > > > +
> > > > > +/**
> > > > > + * struct v4l2_params_block - V4L2 extensible parameters block header
> > > > struct v4l2_params_block_header would be nicer I think
> > > >
> > > That's what I had started with :)
> > >
> > > I'm debated between a longer but more explicative name, or a shorter
> > > one.
> >
> >
> > I vote for longer here but only because I think the phrase "block" applies
> > more properly to the likes of struct rkisp1_ext_params_bls_config for
> > example.
>
> Thanks, I've seen you made a patch to change this!
>
> >
> > >
> > > > > + *
> > > > > + * This structure represents the common part of all the ISP configuration
> > > > > + * blocks. Each parameters block shall embed an instance of this structure type
> > > > > + * as its first member, followed by the block-specific configuration data. The
> > > > > + * driver inspects this common header to discern the block type and its size and
> > > > > + * properly handle the block content by casting it to the correct block-specific
> > > > > + * type.
> > > > > + *
> > > > > + * The @type field is one of the values enumerated by each platform-specific ISP
> > > > > + * block types which specifies how the data should be interpreted by the driver.
> > > > > + * The @size field specifies the size of the parameters block and is used by the
> > > > > + * driver for validation purposes.
> > > > > + *
> > > > > + * The @flags field is a bitmask of platform-specific control flags.
> > > > Since we're including flags in this base struct rather than a platform
> > > > specific subclass I think perhaps we should centralise some flags (which I
> > > > think is supported by the fact that all three implementations share the same
> > > > flags so far). Perhaps we could reserve the bottom 8 bits for common flags
> > > > (like ENABLE / DISABLE) and validate them centrally, and leave the top 8 for
> > > > platform specific flags. I think we could then drop the platform specific
> > > > validation for rkisp1 and c3 and just pass null to the helpers, since they
> > > > do the same thing.
> > > Yes, that's one of the things I was not sure about... if we should
> > > centralize flags definition as well or not...
> >
> >
> > I think probably the ability to have both centralised and platform specific ones would be worthwhile
> >
> > >
> > > Knowing that Mali will use the same flags that the two existing
> > > implementations already have is a good indication that we can probably
> > > centralize at least the ENABLE/DISABLE ones
> >
> >
> > Yeah
> >
> > >
> > > > > + *
> > > > > + * Userspace shall never use this type directly but use the platform specific
> > > > > + * one with the associated data types.
> > > > Why wouldn't userspace just use these directly? I could see why it might be
> > > > difficult for the C3 and Rkisp1 which are merged, but for a new
> > > > implementation couldn't they just use these objects without bothering to
> > > > define their own?
> > > >
> > > mmm, my thinking was that each driver implementation shall define
> > > their own types because I would expect that they will have to define
> > > their own meta image format... For v4l2_params_buffer see below, for
> > > the blocks it might be totally possible to use these type most
> > > probably..
> > >
> > > > If we end up using these objects directly I think it would be nice to have
> > > > the example code block from the platform specific headers documentation here
> > > > too.
> > > >
> > > > > + *
> > > > > + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_block_type`
> > > > > + * - Amlogic C3: :c:type:`c3_isp_params_block_type`
> > > > > + *
> > > > > + * @type: The parameters block type (platform-specific)
> > > > > + * @flags: A bitmask of block flags (platform-specific)
> > > > > + * @size: Size (in bytes) of the parameters block, including this header
> > > > > + */
> > > > > +struct v4l2_params_block {
> > > > > +	__u16 type;
> > > > > +	__u16 flags;
> > > > > +	__u32 size;
> > > > > +} __attribute__((aligned(8)));
> > > > > +
> > > > > +/**
> > > > > + * struct v4l2_params_buffer - V4L2 extensible parameters configuration
> > > > > + *
> > > > > + * This struct contains the configuration parameters of the ISP algorithms,
> > > > > + * serialized by userspace into a data buffer. Each configuration parameter
> > > > > + * block is represented by a block-specific structure which contains a
> > > > > + * :c:type:`v4l2_params_block` entry as first member. Userspace populates
> > > > > + * the @data buffer with configuration parameters for the blocks that it intends
> > > > > + * to configure. As a consequence, the data buffer effective size changes
> > > > > + * according to the number of ISP blocks that userspace intends to configure and
> > > > > + * is set by userspace in the @data_size field.
> > > > > + *
> > > > > + * The parameters buffer is versioned by the @version field to allow modifying
> > > > > + * and extending its definition. Userspace shall populate the @version field to
> > > > > + * inform the driver about the version it intends to use. The driver will parse
> > > > > + * and handle the @data buffer according to the data layout specific to the
> > > > > + * indicated version and return an error if the desired version is not
> > > > > + * supported.
> > > > > + *
> > > > > + * For each ISP block that userspace wants to configure, a block-specific
> > > > > + * structure is appended to the @data buffer, one after the other without gaps
> > > > > + * in between nor overlaps. Userspace shall populate the @data_size field with
> > > > > + * the effective size, in bytes, of the @data buffer.
> > > > > + *
> > > > > + * Each ISP driver using the extensible parameters format shall define a
> > > > > + * type which is type-convertible to this one, with the difference that the
> > > > > + * @data member shall actually a memory buffer of platform-specific size and
> > > > > + * not a pointer.
> > > > Why not just use this object directly? We could provide a helper in
> > > > v4l2-extensible-params.h that calculates the size of the buffer with a given
> > > > data array size for the driver's convenience
> > > The main reason I thought v4l2_params_buffer cannot be used is because
> > > of the flexible-array at the end of the type
> > >
> > > struct v4l2_params_buffer {
> > > 	__u32 version;
> > > 	__u32 data_size;
> > > 	__u8 data[];
> > > };
> > >
> > > vs
> > >
> > > struct rkisp1_ext_params_cfg {
> > > 	__u32 version;
> > > 	__u32 data_size;
> > > 	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
> > > };
> > >
> > > I might have missed what you're suggesting here with the helper in
> > > v4l2-extensible-params.h :)
> >
> > So I think a known size is needed to accomodate operations like "memcpy(dst,
> > src, sizeof(rkisp1_ext_params_cfg))", but with something like...
> >
> >
> > #define v4l2_params_buffer_size(max_params_size) \
> >
> >         (offsetof(struct v4l2_params_buffer, data) + max_params_size)
> >
> >
> > then the above operation can be memcpy(dst,
> > src, v4l2_params_buffer_size(RKISP1_EXT_PARAMS_MAX_SIZE)) instead
>
> Fine for drivers indeed, my thinking was that we would need to reserve
> space for userspace to write configuration blocks in...
>
> However, buffers are allocated by videobuf2 and We could certainly
> allocate the appropriate size using the vb2 queue 'buf_struct_size' member...

I was cearly confused. What I should have suggested is using the
queue_setup() vb2 op to specify the desired plane sizes.

>
> I can experiment with that indeed, in the meantime I wonder what
> maintainers think about this ;)
>
> Thanks
>   j
>
> >
> >
> > Unless I'm missing something that should be enough to drop the driver
> > specific struct...it seems to work ok anyway
> >
> >
> > Dan
> >
> > >
> > >
> > > >
> > > > Thanks
> > > >
> > > > Dan
> > > >
> > > > > + *
> > > > > + * Userspace shall never use this type directly but use the platform specific
> > > > > + * one with the associated data types.
> > > > > + *
> > > > > + * - Rockchip RkISP1: :c:type:`rkisp1_ext_params_cfg`
> > > > > + * - Amlogic C3: :c:type:`c3_isp_params_cfg`
> > > > > + *
> > > > > + * @version: The parameters buffer version (platform-specific)
> > > > > + * @data_size: The configuration data effective size, excluding this header
> > > > > + * @data: The configuration data
> > > > > + */
> > > > > +struct v4l2_params_buffer {
> > > > > +	__u32 version;
> > > > > +	__u32 data_size;
> > > > > +	__u8 data[];
> > > > > +};
> > > > > +
> > > > > +#endif /* _UAPI_V4L2_PARAMS_H_ */
> > > > >

