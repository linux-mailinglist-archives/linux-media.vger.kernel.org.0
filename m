Return-Path: <linux-media+bounces-33055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3679DABFD22
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 21:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58D3F1B621F4
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 19:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D74728F945;
	Wed, 21 May 2025 19:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b2z2+Tyw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A4230BE1;
	Wed, 21 May 2025 19:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747854199; cv=none; b=jFqBdgDitDDkRvfOUBnGNf4dTEgYvzC4J94CdALi4ncu8/tJOFQWM+A5wAh6ATik5kvEyoQyNzB1ArioYShSEnoZFGspszOTTCT4JWMQTtGrAj3f2SrnQ8FihhaJ3cQUkKiMzU1qPVoanBMvkORa7UC/vSSTyvjT7v0PJa4CtA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747854199; c=relaxed/simple;
	bh=vPvuwM/u6pIaMk4JleeZDQfpq6e7V/QhYzjGPzUWzvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4zpwZrIkwpMiz4zhsYLMnd1zKPAYcIeNgiAq3s8vwE4xS9YhNDPglP8hpqTeE5yZ2m3zaqVb0g3aLfJqKl2YLG5lcO5/KhD+TKgMe/AimZo0LQhtYYBANH3USPDxHfAwJJ0Dp/E3oHwJ5ASHyUNfR5QXX30KRcLslzP9KkHZTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b2z2+Tyw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01FD36AF;
	Wed, 21 May 2025 21:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747854173;
	bh=vPvuwM/u6pIaMk4JleeZDQfpq6e7V/QhYzjGPzUWzvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2z2+Tyww+BF+od3NVjTp2B0clH/Tgpur5Oa7hsMZDItXAFI7fJ7LGL4PZr9IZrXk
	 spTxfIW7+zUmBa3KN3286SE5SoeKNG1AzVLCfiAVx8wfgAXRaqAJABKFIwuViNMDGw
	 kbahZi1oSnS+ziSLw/Qks9hTKeTtMqYOQD2bXpHU=
Date: Wed, 21 May 2025 21:03:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ondrej Jirman <megi@xff.cz>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	stefan.klug@ideasonboard.com
Subject: Re: [PATCH] RKISP1: correct histogram window size
Message-ID: <20250521190308.GB6792@pendragon.ideasonboard.com>
References: <m3tt5u9q7h.fsf@t19.piap.pl>
 <aB31Eg6oRpcHHEsb@pyrite.rasen.tech>
 <m3jz6b8lb1.fsf@t19.piap.pl>
 <20250521101042.GC12514@pendragon.ideasonboard.com>
 <174784811736.14042.11404187248848039485@calcite>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174784811736.14042.11404187248848039485@calcite>

On Wed, May 21, 2025 at 07:21:57PM +0200, Paul Elder wrote:
> Quoting Laurent Pinchart (2025-05-21 12:10:42)
> > On Tue, May 20, 2025 at 03:26:58PM +0200, Krzysztof Hałasa wrote:
> > > Paul Elder <paul.elder@ideasonboard.com> writes:
> > > 
> > > >> Without the patch (i.MX8MP, all-white RGGB-12 full HD input from
> > > >> the sensor, YUV NV12 output from ISP, full range, histogram Y mode).
> > > >> HIST_STEPSIZE = 3 (lowest permitted):
> > > >
> > > > According to the datasheet, the histogram bins are 16-bit integer with a
> > > > 4-bit fractional part. To prevent overflowing the 16-bit integer
> > > > counter, the step size should be 10.
> > 
> > That would be for combined RGB mode, as every pixel is accounted for
> > three times in that mode. In other modes, a step size of 8 should be
> > fine.
> 
> Ah, right.
> 
> > > >
> > > > Do you have any other information on this? Is it known that it's stable
> > > > and consistent to use all 20 bits anyway?
> > 
> > The documentation states that the width of the bin counter registers is
> > 20 bits wide including a 4-bit fractional part, and that the software
> > should use only the upper 16 bits of the bin counters. The fractional
> > part is caused by the weights. There's a corresponding todo comment in
> > libcamera:
> > 
> >         ...
> >          *
> >          * \todo Take into account weights. That is, if the weights are low
> >          * enough we can potentially reduce the predivider to increase
> >          * precision. This needs some investigation however, as this hardware
> >          * behavior is undocumented and is only an educated guess.
> >          */
> >         int count = mode == RKISP1_CIF_ISP_HISTOGRAM_MODE_RGB_COMBINED ? 3 : 1;
> >         double factor = size.width * size.height * count / 65536.0;
> >         double root = std::sqrt(factor);
> >         uint8_t predivider = static_cast<uint8_t>(std::ceil(root));
> > 
> >         return std::clamp<uint8_t>(predivider, 3, 127);
> > 
> > libcamera sets the default weights to 1, and discards the 4 fractional
> > bits. It seems that the 
> 
> (what did you mean to finish saying...?)

Oops. Ignore that, I split my reasoning to two paragraphs and forgot to
delete that half line.

> > I expect that each pixel contributes to its bin by adding the weight
> > value corresponding to its zone. Setting all weights to 1, I would
> > expect that the 4 fractional bits could be used to increase the bin size
> > to 1048575 pixels (20 bits), and therefore decrease the predivider from
> > 10 to 3.
> 
> True. I suppose if all the weights are 1 then we can squeeze out more bit
> precision then. But that's a todo for libcamera.
> 
> > > Interesting. I only have those mrv_*.h files which come with
> > > isp-imx-4.2.2.* package(s). Here we have (among others):
> > > 
> > > /*! Register: isp_hist_prop: Histogram properties (0x00000000)*/
> > > /*! Slice: stepsize:*/
> > > /*! histogram predivider, process every (stepsize)th pixel, all other pixels are skipped */
> > > /* 0,1,2: not allowed */
> > > /* 3: process every third input pixel */
> > > /* 4: process every fourth input pixel */
> > > /* ...*/
> > > /* 7FH: process every 127th pixel */
> > > #define MRV_HIST_STEPSIZE_MASK 0x000003F8
> > > #define MRV_HIST_STEPSIZE_SHIFT 3
> > > 
> > > In case of my IMX290 1920x1080 sensor, 1 doesn't work well (it stops
> > > counting before reaching $((1920x1080)) in each bin, and even if no bin
> > > reaches this magic value, the total count may be invalid (not equal to
> > > the number of pixels). IIRC, 2 worked well. Maybe with higher
> > > resolutions, I don't know.
> > > 
> > > I'm currently using "3" per the .h file:
> > > isp_hist_prop:
> > > 32E12400: 1Dh
> > > histogram_measurement_result:
> > > 32E12414: 0 0 1 1004 569 476 633 1197 2373 2212 1923 2945 3632 3025 5821 204589
> > > which sums to 518400 = 1920*1080/9.
> > > 
> > > Setting "2", the same input scene:
> > > 32E12400: 15h
> > > 32E12414: 0 0 0 2194 1263 1096 1406 2528 5228 5052 4291 6354 8322 6943 13201 460522
> > > which sums to 518400 = 1920*1080/4.
> 
> Yes, these look good (although I think you might've copy&pasted the wrong
> number for the sum)
> 
> > > Setting "1", the same input scene:
> > > 32E12400: Dh
> > > 32E12414: 0 0 25 9046 4924 4317 5435 10655 20781 18965 16051 24716 32681 28368 54301 1048559
> > > which sums to 1278824 which is rather less than 2073600.
> > > The last number (1048559) is the magic one, no bin can go higher. Less lights and:
> 
> Oh? I would've expected 2^20-1 = 1048575 to be the magic number, but ok I
> suppose the hardware caps at 1048559 instead. It probably overflowed and that's
> why the sum is so low.
> 
> > > 32E12400: Dh
> > > 32E12414: 0 0 0 0 0 0 184 3059 11970 75298 114898 211444 429772 439922 400358 386695
> > > total = 2073600. But don't rely on it too much, the "1" has problems.
> 
> That's interesting. My guess would be that in practice a divider of 1 would
> still work as long as you make sure that it doesn't overflow. Maybe the usage
> documentation was based on a rule-of-thumb.
> 
> > > In short, those are integer values. One may use them as fractionals with
> > > some clever step size, I guess.
> > > 
> > > >> isp_hist_h_size: 383 (= 1920 / 5 - 1)
> > > >> isp_hist_v_size: 215 (= 1080 / 5 - 1)
> > > >> histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 229401
> > > >>
> > > >> Apparently the histogram is missing the last column (3-pixel wide,
> > > >> though only single pixels count) and the last (same idea) row
> > > >> of the input image: 1917 * 1077 / 3 / 3 = 229401
> > > >
> > > > I don't quite understand this. With a sub-window width of
> > > > 1920 / 5 - 1 = 383, shouldn't the resulting total window width be
> > > > 383 * 5 = 1915? Same idea for the height.
> > > 
> > > It would, but the stepsize = 3 makes it ignore only the last one
> > > - i.e., normally the counted ones are 0, 3, ... 1914, 1917 (which makes
> > > 1920/3) and with 383, it ends at 1914, thus only 3 pixels (1 really,
> > > instead of 2) are missing from calculations (not 5). I guess the same
> > > vertically, 1080 divides / 3 and 1075 doesn't.
> 
> Ah ok, I see. Thanks for the clarification.
> 
> > > 
> > > > The fix looks fine though. Although, I'm wondering if there's a reason
> > > > why there was a -1 in the first place. Does anybody know?
> > > 
> > > There is slight chance it's different on some other SoC, but I would be
> > > surprised.
> > 
> > The documented constraint is
> > 
> >     hist_h_offset + hist_h_size x 5 should be less than or equal to the
> >     horizontal size of the picture.
> > 
> > (and similar for the vertical direction). The initial -1 seems to be a
> > bug.
> 
> Ok.
> 
> Looks go to me.
> 
> Reviewed-by: Paul ELder <paul.elder@ideasonboard.com>

Should we update the commit message as you initially proposed ?

-- 
Regards,

Laurent Pinchart

