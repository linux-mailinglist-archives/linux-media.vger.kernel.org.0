Return-Path: <linux-media+bounces-32998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B03ABF106
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 12:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D8431BC1A02
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 10:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3B325A342;
	Wed, 21 May 2025 10:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NbjLX9Gb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14911185;
	Wed, 21 May 2025 10:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822253; cv=none; b=oU+CBhhCWembP6N+3yBIMm5n/ERw4m2ChqFMRMMe9ZYg+PHXPEuVYfY0S4V4WZPZc6HP6Y6tzCXX2CK1qEEpAr8UIFN4fSliYoh5YQORbsjzmzaNnxBd0o1Mu6DxrEJRC8aI/AwB40EWXk0Xu3RPzeLa/p+9Y3no22VRaB7szMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822253; c=relaxed/simple;
	bh=dxAfHCbzu/1/eFKa6ozmSU01XQUjFGYoBCNB5/x0dQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDAh+og6cRv2vh/ad9vHKoin6xnYrBAPpIwb7H/ue6DNEeoWI9lTAZwvO0uvAiPshxULW2u7TGtqmWNc3KZAYsp2++x7K19OcA+bD1vnA8WannczRSgv+IMhbX+bzSNHFKq5D9qBrk5jeFH0N0ZYKk6BGOnFQrfp/wMnTvy1oXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NbjLX9Gb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 179C76B5;
	Wed, 21 May 2025 12:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747822227;
	bh=dxAfHCbzu/1/eFKa6ozmSU01XQUjFGYoBCNB5/x0dQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbjLX9Gb7voEGiUjcAeGHMkJeBmtKQK2Pd2u3OJRJ2CvlfC9Al3BQ2d2Qxut4L43M
	 2WI0vWQKJu24p++0F2f3v69dFLLgvq8yzJ7sZrPWaGAJSrLj6+Hm+nPS4hiXBIlET3
	 qLACFCIacYNE2XZODgeqacGyOovzxS50Z12Q8Ca4=
Date: Wed, 21 May 2025 12:10:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Paul Elder <paul.elder@ideasonboard.com>,
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
Message-ID: <20250521101042.GC12514@pendragon.ideasonboard.com>
References: <m3tt5u9q7h.fsf@t19.piap.pl>
 <aB31Eg6oRpcHHEsb@pyrite.rasen.tech>
 <m3jz6b8lb1.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3jz6b8lb1.fsf@t19.piap.pl>

On Tue, May 20, 2025 at 03:26:58PM +0200, Krzysztof Hałasa wrote:
> Paul Elder <paul.elder@ideasonboard.com> writes:
> 
> >> Without the patch (i.MX8MP, all-white RGGB-12 full HD input from
> >> the sensor, YUV NV12 output from ISP, full range, histogram Y mode).
> >> HIST_STEPSIZE = 3 (lowest permitted):
> >
> > According to the datasheet, the histogram bins are 16-bit integer with a
> > 4-bit fractional part. To prevent overflowing the 16-bit integer
> > counter, the step size should be 10.

That would be for combined RGB mode, as every pixel is accounted for
three times in that mode. In other modes, a step size of 8 should be
fine.

> >
> > Do you have any other information on this? Is it known that it's stable
> > and consistent to use all 20 bits anyway?

The documentation states that the width of the bin counter registers is
20 bits wide including a 4-bit fractional part, and that the software
should use only the upper 16 bits of the bin counters. The fractional
part is caused by the weights. There's a corresponding todo comment in
libcamera:

	...
	 *
         * \todo Take into account weights. That is, if the weights are low
         * enough we can potentially reduce the predivider to increase
         * precision. This needs some investigation however, as this hardware
         * behavior is undocumented and is only an educated guess.
         */
        int count = mode == RKISP1_CIF_ISP_HISTOGRAM_MODE_RGB_COMBINED ? 3 : 1;
        double factor = size.width * size.height * count / 65536.0;
        double root = std::sqrt(factor);
        uint8_t predivider = static_cast<uint8_t>(std::ceil(root));

        return std::clamp<uint8_t>(predivider, 3, 127);

libcamera sets the default weights to 1, and discards the 4 fractional
bits. It seems that the 

I expect that each pixel contributes to its bin by adding the weight
value corresponding to its zone. Setting all weights to 1, I would
expect that the 4 fractional bits could be used to increase the bin size
to 1048575 pixels (20 bits), and therefore decrease the predivider from
10 to 3.

> Interesting. I only have those mrv_*.h files which come with
> isp-imx-4.2.2.* package(s). Here we have (among others):
> 
> /*! Register: isp_hist_prop: Histogram properties (0x00000000)*/
> /*! Slice: stepsize:*/
> /*! histogram predivider, process every (stepsize)th pixel, all other pixels are skipped */
> /* 0,1,2: not allowed */
> /* 3: process every third input pixel */
> /* 4: process every fourth input pixel */
> /* ...*/
> /* 7FH: process every 127th pixel */
> #define MRV_HIST_STEPSIZE_MASK 0x000003F8
> #define MRV_HIST_STEPSIZE_SHIFT 3
> 
> In case of my IMX290 1920x1080 sensor, 1 doesn't work well (it stops
> counting before reaching $((1920x1080)) in each bin, and even if no bin
> reaches this magic value, the total count may be invalid (not equal to
> the number of pixels). IIRC, 2 worked well. Maybe with higher
> resolutions, I don't know.
> 
> I'm currently using "3" per the .h file:
> isp_hist_prop:
> 32E12400: 1Dh
> histogram_measurement_result:
> 32E12414: 0 0 1 1004 569 476 633 1197 2373 2212 1923 2945 3632 3025 5821 204589
> which sums to 518400 = 1920*1080/9.
> 
> Setting "2", the same input scene:
> 32E12400: 15h
> 32E12414: 0 0 0 2194 1263 1096 1406 2528 5228 5052 4291 6354 8322 6943 13201 460522
> which sums to 518400 = 1920*1080/4.
> 
> Setting "1", the same input scene:
> 32E12400: Dh
> 32E12414: 0 0 25 9046 4924 4317 5435 10655 20781 18965 16051 24716 32681 28368 54301 1048559
> which sums to 1278824 which is rather less than 2073600.
> The last number (1048559) is the magic one, no bin can go higher. Less lights and:
> 32E12400: Dh
> 32E12414: 0 0 0 0 0 0 184 3059 11970 75298 114898 211444 429772 439922 400358 386695
> total = 2073600. But don't rely on it too much, the "1" has problems.
> 
> In short, those are integer values. One may use them as fractionals with
> some clever step size, I guess.
> 
> >> isp_hist_h_size: 383 (= 1920 / 5 - 1)
> >> isp_hist_v_size: 215 (= 1080 / 5 - 1)
> >> histogram_measurement_result[16]: 0 0 0 0  0 0 0 0  0 0 0 0  0 0 0 229401
> >>
> >> Apparently the histogram is missing the last column (3-pixel wide,
> >> though only single pixels count) and the last (same idea) row
> >> of the input image: 1917 * 1077 / 3 / 3 = 229401
> >
> > I don't quite understand this. With a sub-window width of
> > 1920 / 5 - 1 = 383, shouldn't the resulting total window width be
> > 383 * 5 = 1915? Same idea for the height.
> 
> It would, but the stepsize = 3 makes it ignore only the last one
> - i.e., normally the counted ones are 0, 3, ... 1914, 1917 (which makes
> 1920/3) and with 383, it ends at 1914, thus only 3 pixels (1 really,
> instead of 2) are missing from calculations (not 5). I guess the same
> vertically, 1080 divides / 3 and 1075 doesn't.
> 
> > The fix looks fine though. Although, I'm wondering if there's a reason
> > why there was a -1 in the first place. Does anybody know?
> 
> There is slight chance it's different on some other SoC, but I would be
> surprised.

The documented constraint is

    hist_h_offset + hist_h_size x 5 should be less than or equal to the
    horizontal size of the picture.

(and similar for the vertical direction). The initial -1 seems to be a
bug.

-- 
Regards,

Laurent Pinchart

