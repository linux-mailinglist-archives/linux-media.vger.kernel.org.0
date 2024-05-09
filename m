Return-Path: <linux-media+bounces-11187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 211C98C0C36
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 10:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CFFB1C21640
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 08:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172BC149C73;
	Thu,  9 May 2024 08:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="itwoxSQn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFFA26AE7;
	Thu,  9 May 2024 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715241704; cv=none; b=kl3DRZjD/AikRhwgZTC4lKKsI/KvZvmcst/4W4Uzlp2aOexrwTe8q4yWcSwlL2C0934QB/2bKwOUqtQ/7jJqyXaut4haMhL2OdC+Sg3Lwg8ZmeSO9FFGuxC6xxqWekA3Pnxw25ilw914+KpEs7pn16VjlX0O13hbulsXcbQjaHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715241704; c=relaxed/simple;
	bh=hQd+IVfmyRxwLvvw11lLb5fWagwiMSbJTS97skYOggE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuWJX01kOIiH2vnZjskjNAeXqWEX6THbyQJ66/+T0EZnAXTgvI7TJjH64IUnlUoP/D671LMn1rFVygjHPbegyVtgYVKeiEAM2fczMVB7kbTi09dtYc/AhBPFfa//U+8Jd9qyTnDuy1pQOe85p1R8k+h7iCQIMlLO6J6lq8e1HgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=itwoxSQn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 25D252CF2;
	Thu,  9 May 2024 10:01:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715241697;
	bh=hQd+IVfmyRxwLvvw11lLb5fWagwiMSbJTS97skYOggE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=itwoxSQnsd4T7zfz85OrhwOxbBgzMVBKPL7DKN4MWu4o0kwZKIyva+J+pZQssXjn9
	 MXFIr930H4QCSJll9eoNAV9RfJDHJ/omzlAcB/e3gA/7rlvvjK4cJGnOJf8xARhl7G
	 8sBV2AY7+sscoWSLVSAg9pk6gTVy356Ype8Q9z0c=
Date: Thu, 9 May 2024 10:01:37 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: "Gjorgji Rosikopulos (Consultant)" <quic_grosikop@quicinc.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Martina Krasteva <quic_mkrastev@quicinc.com>, Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: Fix imx412 exposure control
Message-ID: <qv5vzwgg4mpdo3yy73hrykmuum3rlkleixrgg5zc5n2kjj3wl3@wmbx34evysiy>
References: <20240506-b4-linux-next-camss-x13s-mmsol-integration-in-test-imx577-fix-v2-1-2e665f072f8f@linaro.org>
 <dvyed4grpazqk7a3tz6dqwpkd76ghtrt4euinxt3kycdeh63ez@ljgfjsfhypix>
 <20a0300a-ac16-456c-840a-e272f49050a8@linaro.org>
 <bppn2qglcya3xbfy7uey5cgybyanxthhweqv7foojwi5rvqwmk@temzdedvecfe>
 <ca8865e9-b41c-49a6-a7b0-39b133be34a1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca8865e9-b41c-49a6-a7b0-39b133be34a1@quicinc.com>

Hi Gjorgji !

On Wed, May 08, 2024 at 07:02:37PM GMT, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Bryan, Jacopo,
>
> On 5/8/2024 3:43 PM, Jacopo Mondi wrote:
> > Hi Bryan
> >
> > On Wed, May 08, 2024 at 01:30:31PM GMT, Bryan O'Donoghue wrote:
> >> On 08/05/2024 09:02, Jacopo Mondi wrote:
> >>> Hi Bryan
> >>>
> >>> On Mon, May 06, 2024 at 11:38:26PM GMT, Bryan O'Donoghue wrote:
> >>>> Currently we have the following algorithm to calculate what value should be
> >>>> written to the exposure control of imx412.
> >>>>
> >>>> lpfr = imx412->vblank + imx412->cur_mode->height;
> >>>> shutter = lpfr - exposure;
> >>>>
> >>>> The 'shutter' value is given to IMX412_REG_EXPOSURE_CIT however, the above
> >>>> algorithm will result in the value given to IMX412_REG_EXPOSURE_CIT
> >>>> decreasing as the requested exposure value from user-space goes up.
> >>>>
> >>>> e.g.
> >>>> [ 2255.713989] imx412 20-001a: Received exp 1608, analog gain 0
> >>>> [ 2255.714002] imx412 20-001a: Set exp 1608, analog gain 0, shutter 1938, lpfr 3546
> >>>> [ 2256.302770] imx412 20-001a: Received exp 2586, analog gain 100
> >>>> [ 2256.302800] imx412 20-001a: Set exp 2586, analog gain 100, shutter 960, lpfr 3546
> >>>> [ 2256.753755] imx412 20-001a: Received exp 3524, analog gain 110
> >>>> [ 2256.753772] imx412 20-001a: Set exp 3524, analog gain 110, shutter 22, lpfr 3546
> >>>>
> >>>> This behaviour results in the image having less exposure as the requested
> >>>> exposure value from user-space increases.
> >>>>
> >>>> Other sensor drivers such as ov5675, imx218, hid556 and others take the
> >>>> requested exposure value and directly.
> >>>
> >>> has the phrase been truncated or is it me reading it wrong ?
> >>
> >> Sod's law says no matter how many times you send yourself a patch before
> >> sending it to LKML you'll find a typo ~ 2 seconds after reading your patch
> >> on LKML.
> >>
> >
> > Sounds familiar enough
> >
> >>
> >>>> Looking at the range of imx sensors, it appears this particular error has
> >>>> been replicated a number of times but, I haven't so far really drilled into
> >>>> each sensor.
> >>>
> >>> Ouch, what other driver have the same issue ?
> >>
> >> So without data sheet or sensor its hard to say if these are correct or
> >> incorrect, it's the same basic calculation though.
> >>
> >> drivers/media/i2c/imx334.c::imx334_update_exp_gain()
> >>
> >>         lpfr = imx334->vblank + imx334->cur_mode->height;
> >>         shutter = lpfr - exposure;
> >>
> >>         ret = imx334_write_reg(imx334, IMX334_REG_SHUTTER, 3, shutter);
> >>
> >>
> >> drivers/media/i2c/imx335.c::imx335_update_exp_gain()
> >>
> >>         lpfr = imx335->vblank + imx335->cur_mode->height;
> >>         shutter = lpfr - exposure;
> >>
> >>         ret = imx335_write_reg(imx335, IMX334_REG_SHUTTER, 3, shutter);
> >>
> >>
> >> Looking again I'm inclined to believe the imx334/imx335 stuff is probably
> >> correct for those sensors, got copied to imx412/imx577 and misapplied to the
> >> EXPOSURE control in imx412.
> >>
> >
> > Without datasheet/devices it really is hard to tell. Cargo cult at
> > play most probably.
>
> I have explained in previous email. But i will post here as well :-)
>

Thanks, I have probably missed it!

>
> As far as i know this issue is only for this imx412 sensor driver.
> The sensor driver for imx412 was submitted along with imx335 and imx334,
> maybe after all the reworking this was missed.
> imx334 and imx335 are using shutter for setting the exposure from where
> this calculation is taken.

Thanks for clarifying and confirming the other drivers are correct.

>
> However imx412 uses number of lines for exposure.
>
> Reviewed-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
>
> ~Gjorgji
>
> >
> >>
> >>>> -	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, shutter);
> >>>> +	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, exposure);
> >>>
> >>> No datasheet here, can you confirm the IMX412_REG_EXPOSURE_CIT
> >>> register is actually in lines ?
> >>
> >>
> >> Looks like.
> >>
> >> From downstream "coarseIntgTimeAddr"
> >>
> >> imx577_sensor.xml
> >>     <coarseIntgTimeAddr>0x0202</coarseIntgTimeAddr>
> >>
> >> imx586/imx586_sensor.cpp
> >> pRegSettingsInfo->regSetting[regCount].registerAddr  =
> >> pExposureData->pRegInfo->coarseIntgTimeAddr + 1;
> >>
> >> pRegSettingsInfo->regSetting[regCount].registerData  = (lineCount & 0xFF);
> >>
> >>> Apart from that, as the CID_EXPOSURE control limit are correctly
> >>> updated when a new VBLANK is set by taking into account the exposure
> >>> margins, I think writing the control value to the register is the
> >>> right thing to do (if the register is in lines of course)
> >>>
> >>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >>>
> >>> Thanks
> >>>    j
> >>>
> >>
> >> If that's good enough I'll fix the typo and apply your RB.
> >
> > Sure
> >
> > Thanks
> >   j
> >
> >>
> >> ---
> >> bod
> >>
> >

