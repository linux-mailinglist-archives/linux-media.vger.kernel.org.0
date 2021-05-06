Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705213755A5
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 16:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234841AbhEFOaM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 10:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234779AbhEFOaM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 10:30:12 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24AAC061574
        for <linux-media@vger.kernel.org>; Thu,  6 May 2021 07:29:13 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id i17so5066061qki.3
        for <linux-media@vger.kernel.org>; Thu, 06 May 2021 07:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=GW95dzInD2TKzR0jdVkWnUZGwBXxcKhZ1/8vg5w2zVE=;
        b=0u96e57Z+1xVtYpsdQo9L1gyUGGB/AdDb46/CNeCtQ1aivWcYlLssYV+UVDb2UtD5W
         wJ7aW5jYyVAtsxe9bwsZ6SXMC7AXzW1Rz3VkMZUhah3G4NucVM+253gX+w4o+a6Z4Say
         hRA9NV69eYJDUQzhQbp8A1ha2PiIqDjJqT8b2jARnGRGh42FoeIy+Qus7g534T0Gswhn
         OzFnI/4JOcA2UPema641K+sOCPWv0KdYlXxGmElG4VZZcxZ/zXg1GDCEMvM75nfr2GmC
         7ktrMxnU8BaSoUq3H2sDXb9ZJCvggHl70bcfut4Hm8S74xMtuHjlT65I+aUF0g1Mqiaf
         BLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GW95dzInD2TKzR0jdVkWnUZGwBXxcKhZ1/8vg5w2zVE=;
        b=T2DEmuuv9FQb/TdUn5a9u6qEMBGDch7+/S+A6GS8cGRNYC4BTS10VJoiYLctRy/Qeu
         5e1vwVh9JJdPxFZldoavEZO59zrACnQHrD0MmZX1jzmLusdY3Edd8qX1mZ/clzUsnd9y
         D7QmqMj7RB5BWeJsnW5z7xg69R9iZt2+IzlwUFoLkZWYb4a/uAWAA2AIOeul8yGww4pA
         fuS4rmhJ0XUQ0Dc29GRGFvz+b8cPU2FFu+hpE4AILKyjRobaV9vMlDGm+rVouRCQPKrL
         FCZXhNUKux2Rsn0WE61xjeqnH2EtXrvb1u0hMna6Mu5WfEIMyffxUJEyc+mgRO+KtnoF
         kvog==
X-Gm-Message-State: AOAM530l3pFJQtiATdpOP8hci2itn1Ik9zVxXzWj5JB7N8090CACPNCD
        LB3nLuPxgvYXe+J305nhH8oemA==
X-Google-Smtp-Source: ABdhPJwBLjKNP6aEe8hFOPRHRhSRkv5wP+9YODtFwFW5GW5DmRxNW2uhWkdMbMheliE8NhBkXiyRyQ==
X-Received: by 2002:a05:620a:a5a:: with SMTP id j26mr4167891qka.156.1620311352924;
        Thu, 06 May 2021 07:29:12 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id h62sm2005578qkf.116.2021.05.06.07.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 07:29:11 -0700 (PDT)
Message-ID: <15e2b577e84ef19bfcfcbb23a7ea2bf63abefdb3.camel@ndufresne.ca>
Subject: Re: [PATCH v10 6/9] media: uapi: Add a control for HANTRO driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, cphealy@gmail.com
Date:   Thu, 06 May 2021 10:29:09 -0400
In-Reply-To: <n7q79gl86gvdo00sgsg1r5beittohsu4ta@4ax.com>
References: <20210420121046.181889-1-benjamin.gaignard@collabora.com>
         <20210420121046.181889-7-benjamin.gaignard@collabora.com>
         <a7c9fe23-2900-ac90-7131-21380fbfc793@xs4all.nl>
         <1cf94540-7f4d-0179-dd1e-0b82ee30f6d2@collabora.com>
         <815a4bd6-599b-cfb8-9ddc-efa4b7092c23@xs4all.nl>
         <n7q79gl86gvdo00sgsg1r5beittohsu4ta@4ax.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 06 mai 2021 à 14:11 +0100, John Cox a écrit :
> > On 05/05/2021 17:20, Benjamin Gaignard wrote:
> > > 
> > > Le 05/05/2021 à 16:55, Hans Verkuil a écrit :
> > > > On 20/04/2021 14:10, Benjamin Gaignard wrote:
> > > > > The HEVC HANTRO driver needs to know the number of bits to skip at
> > > > > the beginning of the slice header.
> > > > > That is a hardware specific requirement so create a dedicated control
> > > > > for this purpose.
> > > > > 
> > > > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > > > > ---
> > > > >   .../userspace-api/media/drivers/hantro.rst    | 19
> > > > > +++++++++++++++++++
> > > > >   .../userspace-api/media/drivers/index.rst     |  1 +
> > > > >   include/media/hevc-ctrls.h                    | 13 +++++++++++++
> > > > >   3 files changed, 33 insertions(+)
> > > > >   create mode 100644 Documentation/userspace-
> > > > > api/media/drivers/hantro.rst
> > > > > 
> > > > > diff --git a/Documentation/userspace-api/media/drivers/hantro.rst
> > > > > b/Documentation/userspace-api/media/drivers/hantro.rst
> > > > > new file mode 100644
> > > > > index 000000000000..cd9754b4e005
> > > > > --- /dev/null
> > > > > +++ b/Documentation/userspace-api/media/drivers/hantro.rst
> > > > > @@ -0,0 +1,19 @@
> > > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > > +
> > > > > +Hantro video decoder driver
> > > > > +===========================
> > > > > +
> > > > > +The Hantro video decoder driver implements the following driver-
> > > > > specific controls:
> > > > > +
> > > > > +``V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP (integer)``
> > > > > +    Specifies to Hantro HEVC video decoder driver the number of data
> > > > > (in bits) to
> > > > > +    skip in the slice segment header.
> > > > > +    If non-IDR, the bits to be skipped go from syntax element
> > > > > "pic_output_flag"
> > > > > +    to before syntax element "slice_temporal_mvp_enabled_flag".
> > > > > +    If IDR, the skipped bits are just "pic_output_flag"
> > > > > +    (separate_colour_plane_flag is not supported).
> > > > I'm not very keen on this. Without this information the video data
> > > > cannot be
> > > > decoded, or will it just be suboptimal?
> > > 
> > > Without that information the video can't be decoded.
> > > 
> > > > 
> > > > The problem is that a generic decoder would have to know that the HW is
> > > > a hantro,
> > > > and then call this control. If they don't (and are testing on non-hantro
> > > > HW), then
> > > > it won't work, thus defeating the purpose of the HW independent decoder
> > > > API.
> > > > 
> > > > Since hantro is widely used, and if there is no other way to do this
> > > > beside explitely
> > > > setting this control, then perhaps this should be part of the standard
> > > > HEVC API.
> > > > Non-hantro drivers that do not need this can just skip it.
> > > 
> > > Even if I put this parameter in decode_params structure that would means
> > > that a generic
> > > userland decoder will have to know how the compute this value for hantro
> > > HW since it
> > > isn't something that could be done on kernel side.
> > 
> > But since hantro is very common, any userland decoder will need to calculate
> > this anyway.
> > So perhaps it is better to have this as part of the decode_params?
> > 
> > I'd like to know what others think about this.
> 
> I don't know exactly what I think on this - its all a bit of a mess. I

There is no better way to describe the state of my own opinion about this.

> don't think this is going to be the last HEVC decoder that needs some
> non-standard setup that can't be trivially extracted from a standard
> slice header parse. So if future decoders are going to have to generate
> custom attributes to cope with their quirks then Hantro probably should
> too. And if Hantro is common then the userspace progs will at least have
> a framework for dealing with this sort of thing so when the next oddity
> comes along.

To add to this, when we moved it out of the decode_params, we were actually
making it an example. We use large structure for the common stuff because is
convenient, but with the current infrastructure, the cost of adding controls is
rather low.

So we need to think if we want to hide or highlight what looks like hardware
design specific needs. There is nothing particularly wrong in the hardware, as
Hantro traditionally parse a lot of the headers, but I suppose they don't really
want to implement skip parsers because at some point the hardware becomes quite
big and complex, skipping bits is just trivial.

One thing I've been discussing with Benjamin yesterday is that while splitting,
we also made the data exactly what the HW wants, which is a skip. A more
reusable representation would have been to provide two offsets in the header.
This way if another HW need a different skip, but with a different stop
position, you can share the start position. Though, it's no longer a 1:1 match
with how the HW is programmed, so not an easy call.

As for having more quirks in more HW, the newer chips are designed with a
constraints these days. As an example, you will notice that inside mpp (rockchip
library) they use Microsoft DXVA parameters and use that as a contraint during
the design. From comment Alex made around Mediatek, they actually used Google
downstream Linux API as a constraint. As we do cover existing API like DXVA,
NVDEC and VA as far as my review went. I don't really expect in fact newer
design to require quirks/extensions so often, but making this one a split
control would serve as an example how to keep things clear.

Now, what I believe is missing in the story is a way for userspace to detect
that extra (non standard) controls are needed. There might be other support
decoder on the platform, or even a software decoder may be more suitable for the
use cas then a corrupted output (which is what happens if you ignore the hantro
control). So perhaps we should think of way to flag the requirement for some
extra controls. Perhaps in the form of a bitmask of quirks, so the userspace can
check early if it has the required implementation and fallback to something else
if not.

This is the type of API missing we have had in many other places in the fast, we
did fix it after that fact, which was not ideal, but still acceptable. So I'm
not like oh no, we screwed up the other stable API. But we have a use case here,
perhaps we can learn from it ?

p.s. I try to avoid extensions as this makes me think of the extra paremeters
associates with the bitstream profile we may not support. We already provide
list of support profiles, and have a good story, tested with stateful decoder on
how to introduce new paremters along with new profiles.

p.s. Notice that if we want to revive the VA driver (VA does not have this
skip), we need to stop modifying the VA API, and just re-parse whatever is
missing. Having a separate control can be used as a clear indication that double
parsing is not needed for the specific implementation. Same would apply if some
Wine folks want to emulate DXVA over V4L2 API (though unlikely as this is rarely
seen on desktop).

> 
> Regards
> 
> John Cox
> 
> > Regards,
> > 
> > 	Hans
> > 
> > > 
> > > 
> > > Regards,
> > > Benjamin
> > > 
> > > > 
> > > > Regards,
> > > > 
> > > > 	Hans
> > > > 
> > > > > +
> > > > > +.. note::
> > > > > +
> > > > > +        This control is not yet part of the public kernel API and
> > > > > +        it is expected to change.
> > > > > diff --git a/Documentation/userspace-api/media/drivers/index.rst
> > > > > b/Documentation/userspace-api/media/drivers/index.rst
> > > > > index 1a9038f5f9fa..12e3c512d718 100644
> > > > > --- a/Documentation/userspace-api/media/drivers/index.rst
> > > > > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > > > > @@ -33,6 +33,7 @@ For more details see the file COPYING in the source
> > > > > distribution of Linux.
> > > > >   
> > > > >   	ccs
> > > > >   	cx2341x-uapi
> > > > > +        hantro
> > > > >   	imx-uapi
> > > > >   	max2175
> > > > >   	meye-uapi
> > > > > diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
> > > > > index 8e0109eea454..b713eeed1915 100644
> > > > > --- a/include/media/hevc-ctrls.h
> > > > > +++ b/include/media/hevc-ctrls.h
> > > > > @@ -224,4 +224,17 @@ struct v4l2_ctrl_hevc_decode_params {
> > > > >   	__u64	flags;
> > > > >   };
> > > > >   
> > > > > +/*  MPEG-class control IDs specific to the Hantro driver as defined
> > > > > by V4L2 */
> > > > > +#define
> > > > > V4L2_CID_CODEC_HANTRO_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1200)
> > > > > +/*
> > > > > + * V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP -
> > > > > + * the number of data (in bits) to skip in the
> > > > > + * slice segment header.
> > > > > + * If non-IDR, the bits to be skipped go from syntax element
> > > > > "pic_output_flag"
> > > > > + * to before syntax element "slice_temporal_mvp_enabled_flag".
> > > > > + * If IDR, the skipped bits are just "pic_output_flag"
> > > > > + * (separate_colour_plane_flag is not supported).
> > > > > + */
> > > > > +#define
> > > > > V4L2_CID_HANTRO_HEVC_SLICE_HEADER_SKIP	(V4L2_CID_CODEC_HANTRO_BASE + 0)
> > > > > +
> > > > >   #endif
> > > > > 
> > > > 


