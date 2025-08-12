Return-Path: <linux-media+bounces-39578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 617DBB225DE
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 13:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FE5B7A9528
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C332ED84A;
	Tue, 12 Aug 2025 11:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T+ZEoERn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA22E2DE0;
	Tue, 12 Aug 2025 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754998120; cv=none; b=MG/XPZA4fv8ean2jAJzk5AKjpMZHd6W8GVBqR+jvC7Bbp9gKUoZTpK+kfn9iKOEMLpHHnLCDFmrnUwUDFVB0102wvdzNrCprW0OmYh450gztuhSHrJ+TWeZxRD4VuPvwCIXENgx4Yl+xxK3O5OwmrrLkhvQGzcw2W7Glw56vdVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754998120; c=relaxed/simple;
	bh=aucV3Sk1cFWXbwVP3m/8s6jEvha/U79mOmkbk6667gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duGnjDFPy1S7B9a3nDSXV74tc4FdyMRzE4qhS5+Y5mIf69x79z2RMcP98iVlb2/KhmOlWKC0rOUouGOzHFnS6cgbablLNGYlPeITvN604lZ/xZ3ie0XAQq0iCqzSzbzsBZSYDc7TmoF+hbdmYOsHdr40+1nruyrBcnrtFHmHT4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T+ZEoERn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8BDC4346;
	Tue, 12 Aug 2025 13:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754998062;
	bh=aucV3Sk1cFWXbwVP3m/8s6jEvha/U79mOmkbk6667gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+ZEoERn73hAtMcyzscX3cz4VPPafGKpTE2h2HjIZM2OpmAGVTFS8xPTF/20T/CN8
	 Hn06axQhyd6SgqJRu+O7SuXSo87H0eCkXvGdSfcTezoPdQE6q4+qDvMBp8QaRrfzxL
	 X1F0IqfF5lKbuFVsnlrU+aid6LeNCy4Rwq/U/R7A=
Date: Tue, 12 Aug 2025 14:28:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Will Whang <will@willwhang.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/4] media: docs: Add userspace-API guide for the
 IMX585 driver
Message-ID: <20250812112817.GM30054@pendragon.ideasonboard.com>
References: <20250810220921.14307-1-will@willwhang.com>
 <20250810220921.14307-5-will@willwhang.com>
 <CAPY8ntATfq=yqoYkpuD5Ga-7yUb8C-_k=wSZJBpz0p9PLjVk0w@mail.gmail.com>
 <CAFoNnrzHhJVbR1yQrr6o1+1JhyDB6y0NNfyJkK=by9YOJRGusQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFoNnrzHhJVbR1yQrr6o1+1JhyDB6y0NNfyJkK=by9YOJRGusQ@mail.gmail.com>

Hi Will,

On Mon, Aug 11, 2025 at 07:31:13PM -0700, Will Whang wrote:
> On Mon, Aug 11, 2025 at 7:24 AM Dave Stevenson wrote:
> > On Sun, 10 Aug 2025 at 23:11, Will Whang wrote:
> > >
> > > The new IMX585 V4L2 sub-device driver introduces several
> > > driver-specific controls for configuring Clear-HDR blending,
> > > gradation compression thresholds, and HCG enabling.  This patch adds
> > > an rst document under Documentation/userspace-api/media/drivers/
> > > that details each control, allowed values, and their effects.
> > >
> > > Signed-off-by: Will Whang <will@willwhang.com>
> > > ---
> > >  .../userspace-api/media/drivers/imx585.rst    | 122 ++++++++++++++++++
> > >  .../userspace-api/media/drivers/index.rst     |   1 +
> > >  MAINTAINERS                                   |   1 +
> > >  3 files changed, 124 insertions(+)
> > >  create mode 100644 Documentation/userspace-api/media/drivers/imx585.rst
> > >
> > > diff --git a/Documentation/userspace-api/media/drivers/imx585.rst b/Documentation/userspace-api/media/drivers/imx585.rst
> > > new file mode 100644
> > > index 000000000..9f7c16f30
> > > --- /dev/null
> > > +++ b/Documentation/userspace-api/media/drivers/imx585.rst
> > > @@ -0,0 +1,122 @@
> > > +.. SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +Sony IMX585 driver
> > > +==================
> > > +
> > > +The IMX585 image-sensor driver provides the following *driver-specific*
> > > +V4L2 controls.  They are visible only when the IMX585 driver is loaded
> > > +and sit in the sensor-private control class.
> > > +
> > > +HDR data blending
> > > +-----------------
> > > +
> > > +``V4L2_CID_IMX585_HDR_DATASEL_TH``  (``U16[2]``)
> > > +    Lower/upper **thresholds** (0 – 4095) that decide which exposure is
> > > +    chosen—or blended—for each pixel in Clear-HDR mode.
> > > +
> > > +``V4L2_CID_IMX585_HDR_DATASEL_BK``  (menu)
> > > +    **Blending ratio** between the long-gain (LG) and
> > > +    high-gain (HG) read-outs.
> > > +
> > > +    .. flat-table::
> > > +       :stub-columns: 0
> > > +       :widths: 1 5
> > > +
> > > +       * - ``0``
> > > +         - HG ½, LG ½
> > > +       * - ``1``
> > > +         - HG ¾, LG ¼
> > > +       * - ``2``     # duplicate ratio present in the datasheet
> > > +         - HG ½, LG ½
> > > +       * - ``3``
> > > +         - HG ⅞, LG ⅛
> > > +       * - ``4``
> > > +         - HG 15⁄16, LG 1⁄16
> > > +       * - ``5``     # second 50/50 entry as documented
> > > +         - **2ⁿᵈ** HG ½, LG ½
> > > +       * - ``6``
> > > +         - HG 1⁄16, LG 15⁄16
> > > +       * - ``7``
> > > +         - HG ⅛, LG ⅞
> > > +       * - ``8``
> > > +         - HG ¼, LG ¾
> > > +
> > > +Gradation compression
> > > +---------------------
> > > +
> > > +``V4L2_CID_IMX585_HDR_GRAD_TH``  (``U32[2]``)
> > > +    17-bit **break-points** (0 – 0x1ffff) that shape the 16-bit
> > > +    gradation-compression curve.
> > > +
> > > +``V4L2_CID_IMX585_HDR_GRAD_COMP_L``  (menu)
> > > +    See V4L2_CID_IMX585_HDR_GRAD_COMP_H
> > > +
> > > +``V4L2_CID_IMX585_HDR_GRAD_COMP_H``  (menu)
> > > +    **Compression ratios** below the first break-point and between the
> > > +    two break-points, respectively.
> > > +
> > > +    .. flat-table::
> > > +        :stub-columns: 0
> > > +        :widths: 1 4
> > > +
> > > +        * - ``0``
> > > +          - 1 : 1
> > > +        * - ``1``
> > > +          - 1 : 2
> > > +        * - ``2``
> > > +          - 1 : 4   *(default for COMP_L)*
> > > +        * - ``3``
> > > +          - 1 : 8
> > > +        * - ``4``
> > > +          - 1 : 16
> > > +        * - ``5``
> > > +          - 1 : 32
> > > +        * - ``6``
> > > +          - 1 : 64  *(default for COMP_H)*
> > > +        * - ``7``
> > > +          - 1 : 128
> > > +        * - ``8``
> > > +          - 1 : 256
> > > +        * - ``9``
> > > +          - 1 : 512
> > > +        * - ``10``
> > > +          - 1 : 1024
> > > +        * - ``11``
> > > +          - 1 : 2048
> > > +
> > > +Gain settings
> > > +-------------
> > > +
> > > +``V4L2_CID_IMX585_HDR_GAIN``  (menu)
> > > +    **Additional gain** (in dB) applied to the high-gain path when
> > > +    Clear-HDR is active.
> > > +
> > > +    .. flat-table::
> > > +        :stub-columns: 0
> > > +        :widths: 1 3
> > > +
> > > +        * - ``0``
> > > +          - +0 dB
> > > +        * - ``1``
> > > +          - +6 dB
> > > +        * - ``2``
> > > +          - +12 dB *(default)*
> > > +        * - ``3``
> > > +          - +18 dB
> > > +        * - ``4``
> > > +          - +24 dB
> > > +        * - ``5``
> > > +          - +29.1 dB
> > > +
> > > +``V4L2_CID_IMX585_HCG_GAIN``  (boolean)
> >
> > HCG stands for High Conversion Gain, so we've got Gain repeated in the name.
> >
> > Spell it out as V4L2_CID_IMX585_HIGH_CONV_GAIN, or call it
> > CONVERSION_GAIN and use an enum control?
> >
> > > +    Toggle **High-Conversion-Gain** mode.
> > > +
> > > +    *0 = LCG (default), 1 = HCG.*
> >
> > An HCG / LCG control would also be applicable for IMX290 [1], so it
> > would be nice if this could be a generic control instead of imx585
> > specific.
> >
> > I never got a good description as to the benefit HCG was meant to
> > give. The datasheet for IMX290 says the conversion efficiency ratio
> > between HCG and LCG is 2, but not why that is any better than adding
> > 6dB of analog gain.
> 
> What I've learned is that HCG is actually a 2nd stage amplifier, so
> instead of using one for high gain, you can split it into two lower
> gain stages that lower the noise.

DCG as a term is a bit confusing. It was initially used to describe an
inter-frame HDR technique, where two different conversion gains are
applied to separate frames by switching on and off an extra capacitor on
the pixel's floating diffusion node. I don't know how it evolved from
there, but just adding a second amplifier doesn't seem to be a very
effective way to lower noise.

If anyone does some research on the topic and finds clear information,
please share them.

> This is also why ClearHDR and HCG have the conflict, because it is
> basically sampling after the 1st gain stage and 2nd gain stage as
> High/Low gain images.
> 
> I have thought about making it more generic because IMX662 and IMX678
> are going to be the next patch once this one passes that also has this
> function (the two are basically stripped down versions from IMX585
> that the driver can be adapted to easily). I intended for the upcoming
> IMX662/IMX678 driver to use IMX585's V4L2 HCG control also.
> 
> But given that I'm new to Linux kernel developments, or more
> specifically, V4L2, I really don't have an idea how to do so in a way
> the patch will be accepted.
> Or I can make this more generic name to replace IMX585 for STARVIS2,
> for example: V4L2_CID_STARVIS2_HIGH_CONV_GAIN

We should really try to standardize V4L2 controls for HDR support in
sensors. See https://lore.kernel.org/linux-media/20250710220544.89066-1-mirela.rabulea@nxp.com
for an attempt at doing so (for some of the controls at least). Could
you share your feedback in that mail thread ?

The proposal doesn't address the sensor-side blending controls. For
those, I recommend considering how they should be handled from
userspace. We don't want to have per-sensor code there if we can avoid
it, and that should drive the API design.

As for what you call gradation above, that's not strictly speaking
limited to HDR, right ? If my understanding is right, this is about
applying a compression curve to lower the bandwidth by lowering the
number of bits per pixel while preserving more dynamic range in the
lower and middle parts of the pixel value range. Is that correct ? If
so, the term "companding" is also often used for this feature. I think
we have three needs:

- Enable/disable companding (which includes configuring the bit depth of
  the output format)

- Obtaining the companding curve applied by the sensor (as the host will
  have to apply the inverse expansion curve)

- Optionally, modifying the companing curve.

I'd like standard controls for those.

> > Sony's website [2] states
> > "Sony’s Super High Conversion Gain technology is designed to amplify
> > electrical signals immediately after the conversion from photons, when
> > the noise levels are relatively low. In this way, it reduces the
> > overall noise after amplification. As a result, lower-noise images,
> > compared to conventional technology, can be captured even in a
> > low-illuminance environment. Lower noise levels in images also help to
> > enhance the accuracy in visual or AI-assisted image recognition."
> > From that one would presume you'd always want it on (lower noise =
> > good), unless needing the minimum exposure time and the image was
> > already over-exposed.
> > I'm guessing you have no additional information based on your description text.
> >
> >   Dave
> >
> > [1] Also IMX327, IMX462, and IMX662 which are in the same family,
> > IMX678 (ratio of 2.6), and quite probably most of the Sony Starvis or
> > Starvis 2 ranges.
> > [2] https://www.sony-semicon.com/en/technology/security/index.html
> 
> Yeah I think Starvis 2 series all have this capability.
> 
> > > +
> > > +Notes
> > > +-----
> > > +
> > > +* Controls are writable while streaming; changes take effect from the
> > > +  next frame.
> > > +* HDR-specific controls are hidden when HDR is disabled.
> > > +* Inter-control dependencies are enforced by the driver.
> > > diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> > > index d706cb47b..87912acfb 100644
> > > --- a/Documentation/userspace-api/media/drivers/index.rst
> > > +++ b/Documentation/userspace-api/media/drivers/index.rst
> > > @@ -32,6 +32,7 @@ For more details see the file COPYING in the source distribution of Linux.
> > >         cx2341x-uapi
> > >         dw100
> > >         imx-uapi
> > > +       imx585
> > >         max2175
> > >         npcm-video
> > >         omap3isp-uapi
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 175f5236a..42e32b6ba 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -23183,6 +23183,7 @@ M:      Will Whang <will@willwhang.com>
> > >  L:     linux-media@vger.kernel.org
> > >  S:     Maintained
> > >  F:     Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
> > > +F:     Documentation/userspace-api/media/drivers/imx585.rst
> > >  F:     drivers/media/i2c/imx585.c
> > >  F:     include/uapi/linux/imx585.h
> > >

-- 
Regards,

Laurent Pinchart

