Return-Path: <linux-media+bounces-11146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5038BFD75
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 14:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FBFC1C2210D
	for <lists+linux-media@lfdr.de>; Wed,  8 May 2024 12:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEC454BEF;
	Wed,  8 May 2024 12:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fulYJOCy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364756F068;
	Wed,  8 May 2024 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715172221; cv=none; b=FatwwCsGsvOW8YueixFgDvr4DH9+0Bn+csK7Al5tcJg3IvQiPBBn8p+7S4k6hYCHWinQgPyCAYSMCrRDb5Z46uGvdvBKWfzlpwjD3ysMef99nIO845xLwLzukfBKKb7rJfdIpVBVpOzfRG246ngELi9Ue3n/hq1zBjQ6LeMWe6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715172221; c=relaxed/simple;
	bh=IEkA4m/tzIqY6Ui6NTcGls8ZPDri+j24cttTqZ1XhW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBwbW7klOeJsR4G344SRGcL9jDUdE4im4DuOQUOUkVw1I91r8QIlnfbUtyq1MPJiKUoxLNuvAf/3cT26vOGIEr+r1p/uuU6L0GMkoi0YSiS+T2z6LzyH1cmFaHOOVdGmJLcj0JOH56saUCUkbP/oOz6Ug8YDHMyOa0EuxhPBFBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fulYJOCy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A5B919FA;
	Wed,  8 May 2024 14:43:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715172214;
	bh=IEkA4m/tzIqY6Ui6NTcGls8ZPDri+j24cttTqZ1XhW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fulYJOCyEiR8pC4KuQLyH8vKMaWoQxfJdRDbwIF8PavfeDKqw6+KzfqD3rXRFgpER
	 jiw4OCnc+/pWYl81ZY9uGn53vNx/n+8VBinIvdC5uQ9F+8TTMb4basOKUGJQyPf4OM
	 oZyRzL7IqKk89zN0HrpwO91/BdnHGJDm2l4w8LTo=
Date: Wed, 8 May 2024 14:43:34 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, Martina Krasteva <quic_mkrastev@quicinc.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: Fix imx412 exposure control
Message-ID: <bppn2qglcya3xbfy7uey5cgybyanxthhweqv7foojwi5rvqwmk@temzdedvecfe>
References: <20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v2-1-2e665f072f8f@linaro.org>
 <dvyed4grpazqk7a3tz6dqwpkd76ghtrt4euinxt3kycdeh63ez@ljgfjsfhypix>
 <20a0300a-ac16-456c-840a-e272f49050a8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20a0300a-ac16-456c-840a-e272f49050a8@linaro.org>

Hi Bryan

On Wed, May 08, 2024 at 01:30:31PM GMT, Bryan O'Donoghue wrote:
> On 08/05/2024 09:02, Jacopo Mondi wrote:
> > Hi Bryan
> >
> > On Mon, May 06, 2024 at 11:38:26PM GMT, Bryan O'Donoghue wrote:
> > > Currently we have the following algorithm to calculate what value should be
> > > written to the exposure control of imx412.
> > >
> > > lpfr = imx412->vblank + imx412->cur_mode->height;
> > > shutter = lpfr - exposure;
> > >
> > > The 'shutter' value is given to IMX412_REG_EXPOSURE_CIT however, the above
> > > algorithm will result in the value given to IMX412_REG_EXPOSURE_CIT
> > > decreasing as the requested exposure value from user-space goes up.
> > >
> > > e.g.
> > > [ 2255.713989] imx412 20-001a: Received exp 1608, analog gain 0
> > > [ 2255.714002] imx412 20-001a: Set exp 1608, analog gain 0, shutter 1938, lpfr 3546
> > > [ 2256.302770] imx412 20-001a: Received exp 2586, analog gain 100
> > > [ 2256.302800] imx412 20-001a: Set exp 2586, analog gain 100, shutter 960, lpfr 3546
> > > [ 2256.753755] imx412 20-001a: Received exp 3524, analog gain 110
> > > [ 2256.753772] imx412 20-001a: Set exp 3524, analog gain 110, shutter 22, lpfr 3546
> > >
> > > This behaviour results in the image having less exposure as the requested
> > > exposure value from user-space increases.
> > >
> > > Other sensor drivers such as ov5675, imx218, hid556 and others take the
> > > requested exposure value and directly.
> >
> > has the phrase been truncated or is it me reading it wrong ?
>
> Sod's law says no matter how many times you send yourself a patch before
> sending it to LKML you'll find a typo ~ 2 seconds after reading your patch
> on LKML.
>

Sounds familiar enough

>
> > > Looking at the range of imx sensors, it appears this particular error has
> > > been replicated a number of times but, I haven't so far really drilled into
> > > each sensor.
> >
> > Ouch, what other driver have the same issue ?
>
> So without data sheet or sensor its hard to say if these are correct or
> incorrect, it's the same basic calculation though.
>
> drivers/media/i2c/imx334.c::imx334_update_exp_gain()
>
>         lpfr = imx334->vblank + imx334->cur_mode->height;
>         shutter = lpfr - exposure;
>
>         ret = imx334_write_reg(imx334, IMX334_REG_SHUTTER, 3, shutter);
>
>
> drivers/media/i2c/imx335.c::imx335_update_exp_gain()
>
>         lpfr = imx335->vblank + imx335->cur_mode->height;
>         shutter = lpfr - exposure;
>
>         ret = imx335_write_reg(imx335, IMX334_REG_SHUTTER, 3, shutter);
>
>
> Looking again I'm inclined to believe the imx334/imx335 stuff is probably
> correct for those sensors, got copied to imx412/imx577 and misapplied to the
> EXPOSURE control in imx412.
>

Without datasheet/devices it really is hard to tell. Cargo cult at
play most probably.

>
> > > -	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, shutter);
> > > +	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, exposure);
> >
> > No datasheet here, can you confirm the IMX412_REG_EXPOSURE_CIT
> > register is actually in lines ?
>
>
> Looks like.
>
> From downstream "coarseIntgTimeAddr"
>
> imx577_sensor.xml
>     <coarseIntgTimeAddr>0x0202</coarseIntgTimeAddr>
>
> imx586/imx586_sensor.cpp
> pRegSettingsInfo->regSetting[regCount].registerAddr  =
> pExposureData->pRegInfo->coarseIntgTimeAddr + 1;
>
> pRegSettingsInfo->regSetting[regCount].registerData  = (lineCount & 0xFF);
>
> > Apart from that, as the CID_EXPOSURE control limit are correctly
> > updated when a new VBLANK is set by taking into account the exposure
> > margins, I think writing the control value to the register is the
> > right thing to do (if the register is in lines of course)
> >
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > Thanks
> >    j
> >
>
> If that's good enough I'll fix the typo and apply your RB.

Sure

Thanks
  j

>
> ---
> bod
>

