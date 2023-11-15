Return-Path: <linux-media+bounces-223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FC67E9B56
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 12:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDD90B20BBB
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 11:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0ED1CFB2;
	Mon, 13 Nov 2023 11:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gJTyTC+k"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803991CFA9
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 11:43:53 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBFA4D4A;
	Mon, 13 Nov 2023 03:43:51 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CC4E10A;
	Mon, 13 Nov 2023 12:43:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699875805;
	bh=af4nFw1Ng+vE1VtaSl3G/+mH1mCl5X/mKOH0BalXcQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJTyTC+k9OJR/UVotA8y6eyAxoIJnPTFUr9nbIm7YgtzFuGVDm44HEduVaEi+CYm/
	 zQTow2SDQEgJM+iuA8g2ueyRFmTiDvmHg9QTede+6+Ua3t24lD2LZRCxAjrqk90bVn
	 HqYQulmTfV8+sk3oYRCK1jGz1mP18CbGfcMooCwY=
Date: Mon, 13 Nov 2023 13:43:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 10/15] media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
Message-ID: <20231113114357.GD24338@pendragon.ideasonboard.com>
References: <1699595289-25773-1-git-send-email-shengjiu.wang@nxp.com>
 <1699595289-25773-11-git-send-email-shengjiu.wang@nxp.com>
 <4cd6b593-2376-4cbc-a7c8-d3eb36a2f7a0@xs4all.nl>
 <20231113104238.GA13981@pendragon.ideasonboard.com>
 <6a3e7eb9-505c-4cfb-8a86-a8947a2e44d5@xs4all.nl>
 <20231113110754.GB24338@pendragon.ideasonboard.com>
 <3e898664-cbfc-4892-9765-37b66891643b@xs4all.nl>
 <ZVIIc-fi32ZxIi-p@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZVIIc-fi32ZxIi-p@valkosipuli.retiisi.eu>

On Mon, Nov 13, 2023 at 11:28:51AM +0000, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Nov 13, 2023 at 12:24:14PM +0100, Hans Verkuil wrote:
> > On 13/11/2023 12:07, Laurent Pinchart wrote:
> > > On Mon, Nov 13, 2023 at 11:56:49AM +0100, Hans Verkuil wrote:
> > >> On 13/11/2023 11:42, Laurent Pinchart wrote:
> > >>> On Mon, Nov 13, 2023 at 11:29:09AM +0100, Hans Verkuil wrote:
> > >>>> Hi Shengjiu,
> > >>>>
> > >>>> On 10/11/2023 06:48, Shengjiu Wang wrote:
> > >>>>> Fixed point controls are used by the user to configure
> > >>>>> a fixed point value in 64bits, which Q31.32 format.
> > >>>>>
> > >>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >>>>
> > >>>> This patch adds a new control type. This is something that also needs to be
> > >>>> tested by v4l2-compliance, and for that we need to add support for this to
> > >>>> one of the media test-drivers. The best place for that is the vivid driver,
> > >>>> since that has already a bunch of test controls for other control types.
> > >>>>
> > >>>> See e.g. VIVID_CID_INTEGER64 in vivid-ctrls.c.
> > >>>>
> > >>>> Can you add a patch adding a fixed point test control to vivid?
> > >>>
> > >>> I don't think V4L2_CTRL_TYPE_FIXED_POINT is a good idea. This seems to
> > >>> relate more to units than control types. We have lots of fixed-point
> > >>> values in controls already, using the 32-bit and 64-bit integer control
> > >>> types. They use various locations for the decimal point, depending on
> > >>> the control. If we want to make this more explicit to users, we should
> > >>> work on adding unit support to the V4L2 controls.
> > >>
> > >> "Fixed Point" is not a unit, it's a type. 'Db', 'Hz' etc. are units.
> > > 
> > > It's not a unit, but I think it's related to units. My point is that,
> > > without units support, I don't see why we need a formal definition of
> > > fixed-point types, and why this series couldn't just use
> > > VIVID_CID_INTEGER64. Drivers already interpret VIVID_CID_INTEGER64
> > > values as they see fit.
> > 
> > They do? That's new to me. A quick grep for V4L2_CTRL_TYPE_INTEGER64
> > (I assume you meant that rather than VIVID_CID_INTEGER64) shows that it

Yes, I meant V4L2_CTRL_TYPE_INTEGER64. Too hasty copy & paste :-)

> > is always interpreted as a 64 bit integer and nothing else. As it should.

The most common case for control handling in drivers is taking the
integer value and converting it to a register value, using
device-specific encoding of the register value. It can be a fixed-point
format or something else, depending on the device. My point is that
drivers routinely convert a "plain" integer to something else, and that
has never been considered as a cause of concern. I don't see why it
would be different in this series.

> > And while we do not have support for units (other than the documentation),
> > we do have type support in the form of V4L2_CTRL_TYPE_*.
> > 
> > >> A quick "git grep -i "fixed point" Documentation/userspace-api/media/'
> > >> only shows a single driver specific control (dw100.rst).
> > >>
> > >> I'm not aware of other controls in mainline that use fixed point.
> > > 
> > > The analog gain control for sensors for instance.
> > 
> > Not really. The documentation is super vague:
> > 
> > V4L2_CID_ANALOGUE_GAIN (integer)
> > 
> > 	Analogue gain is gain affecting all colour components in the pixel matrix. The
> > 	gain operation is performed in the analogue domain before A/D conversion.
> > 
> > And the integer is just a range. Internally it might map to some fixed
> > point value, but userspace won't see that, it's hidden in the driver AFAICT.

It's hidden so well that libcamera has a database of the sensor it
supports, with formulas to map a real gain value to the
V4L2_CID_ANALOGUE_GAIN control. The encoding of the integer value does
matter, and the kernel doesn't expose it. We may or may not consider
that as a shortcoming of the V4L2 control API, but in any case it's the
situation we have today.

> I wonder if Laurent meant digital gain.

No, I meant analog. It applies to digital gain too though.

> Those are often Q numbers. The practice there has been that the default
> value yields gain of 1.
> 
> There are probably many other examples in controls where something being
> controlled isn't actually an integer while integer controls are still being
> used for the purpose.

A good summary of my opinion :-)

> Instead of this patch, I'd prefer to have a way to express the meaning of
> the control value, be it a Q number or something else, and do that
> independently of the type of the control.

Agreed.

> > In the case of this particular series the control type is really a fixed point
> > value with a documented unit (Hz). It really is not something you want to
> > use type INTEGER64 for.
> > 
> > >> Note that V4L2_CTRL_TYPE_FIXED_POINT is a Q31.32 format. By setting
> > >> min/max/step you can easily map that to just about any QN.M format where
> > >> N <= 31 and M <= 32.
> > >>
> > >> In the case of dw100 it is a bit different in that it is quite specialized
> > >> and it had to fit in 16 bits.

-- 
Regards,

Laurent Pinchart

