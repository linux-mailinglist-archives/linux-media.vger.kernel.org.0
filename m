Return-Path: <linux-media+bounces-9316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F058A4B2C
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 11:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B7D0284DD2
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 09:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6D93BBF5;
	Mon, 15 Apr 2024 09:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLEIB0EZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC5D383A6
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713172445; cv=none; b=KGZtpVrIELxs6uaD1AWXAJ26sY6qN8c+Ujd5EbMycjzdE4cpkLJctZD44YeQZZxaCXtMObnC/FWCUecrWwFO4EIiv/GMvBpzHe2iDUZJTnD5cqFZrvQdhZ6l1+gRVKFwHbqLo8v408mcor42dNe+uthQ76j58Z2XkM5fpXJErv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713172445; c=relaxed/simple;
	bh=4TTAUkMC2T3PMqoxO299sL0jtkly/bhqPU+YjNTLHtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Si0b0OfpwHanB8Dz0LY6MQ8D+ufT/NIkz8msLOp0LvDz0vZ9J4mTX0QAjmSDso8DE+Mqy4gt7N3YF/s41cAh4vTxh25zxtIYNKLnuXS71xKlR1KnMyi/KP1QjyYmo8ROXedY+osM9i6rYkyKWlRwTbIYIKGoURId7wdHp7N7GOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLEIB0EZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713172443; x=1744708443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4TTAUkMC2T3PMqoxO299sL0jtkly/bhqPU+YjNTLHtU=;
  b=lLEIB0EZnH8hUliGUv/PlG3vGpSi31NT/UAlfWVTf6/JXELLiZSBMsud
   252BxpJJM+aeqxAqvrQ2ZJugMFr7gHyf7TJx+F/VJobLT2OSjKYH2Gn+5
   E9w8dor3K+iz7W1W0RsjUTmZABXgn4VgRNaALqVRybkvuEYHrA2V3Isqi
   enicBDwvHXdcnl0SdpzxYIgXka/Bg2/ZDp29CB8Xc/tHY5aj/mNWbfFN4
   UmrI1c09xahfhtPbMoKOzNC8CrqwvWyBo8Dx+QSlVDv8mGT8xARCIyiNG
   U8q7Z7qGJydvJ9uyipkAuc7ClUUWcRBudIFSgvqgbVyh91/7tkhtB0Q6I
   g==;
X-CSE-ConnectionGUID: M2T/76hBRYuW4VYp1tmS8A==
X-CSE-MsgGUID: jntdnuMLQni12SSWrnP7Ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8771071"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8771071"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 02:14:03 -0700
X-CSE-ConnectionGUID: W9qtFOAgS3KVTVNz9yBTtg==
X-CSE-MsgGUID: zEOwDfdRSbuuMVoK7ZaBOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="59299841"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 02:14:01 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A18B611F8AF;
	Mon, 15 Apr 2024 12:13:58 +0300 (EEST)
Date: Mon, 15 Apr 2024 09:13:58 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: imx219: Use dev_err_probe on probe
Message-ID: <Zhzv1twXY0GQEDQL@kekkonen.localdomain>
References: <20240311090042.30280-1-umang.jain@ideasonboard.com>
 <Ze7shcxM/v1+FHCm@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <b949d192-9ea5-489a-91a9-2b055ec47b22@ideasonboard.com>
 <20240314152147.GB2441@pendragon.ideasonboard.com>
 <7b3724aa-04ac-463c-834a-3902fae4b505@ideasonboard.com>
 <20240328105305.GB26064@pendragon.ideasonboard.com>
 <d5d210d9-b638-4790-a9fe-0816462ba58a@ideasonboard.com>
 <20240328110913.GC26064@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240328110913.GC26064@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Mar 28, 2024 at 01:09:13PM +0200, Laurent Pinchart wrote:
> Sakari, there's a question for you below.
> 
> On Thu, Mar 28, 2024 at 04:29:41PM +0530, Umang Jain wrote:
> > On 28/03/24 4:23 pm, Laurent Pinchart wrote:
> > > On Fri, Mar 15, 2024 at 12:13:15PM +0530, Umang Jain wrote:
> > >> On 14/03/24 8:51 pm, Laurent Pinchart wrote:
> > >>> On Thu, Mar 14, 2024 at 06:51:04PM +0530, Umang Jain wrote:
> > >>>> On 11/03/24 5:05 pm, Tommaso Merciai wrote:
> > >>>>> On Mon, Mar 11, 2024 at 02:30:42PM +0530, Umang Jain wrote:
> > >>>>>> Drop dev_err() and use the dev_err_probe() helper on probe path.
> > >>>>>>
> > >>>>>> No functional changes intended.
> > >>>>>>
> > >>>>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > >>>>>> ---
> > >>>>>>     drivers/media/i2c/imx219.c | 64 +++++++++++++++++++-------------------
> > >>>>>>     1 file changed, 32 insertions(+), 32 deletions(-)
> > >>>>>>
> > >>>>>> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > >>>>>> index e17ef2e9d9d0..acd27e2ef849 100644
> > >>>>>> --- a/drivers/media/i2c/imx219.c
> > >>>>>> +++ b/drivers/media/i2c/imx219.c
> > >>>>>> @@ -551,8 +551,9 @@ static int imx219_init_controls(struct imx219 *imx219)
> > >>>>>>     
> > >>>>>>     	if (ctrl_hdlr->error) {
> > >>>>>>     		ret = ctrl_hdlr->error;
> > >>>>>> -		dev_err(&client->dev, "%s control init failed (%d)\n",
> > >>>>>> -			__func__, ret);
> > >>>>>> +		dev_err_probe(&client->dev, ret,
> > >>>>>> +			      "%s control init failed\n",
> > >>>>>> +			      __func__);
> > >>> ctrl_hdlr->error can never be -EPROBE_DEFER, is dev_err_probe() really
> > >>> useful here ?
> > >> is dev_err_probe() really /only/ about -EPROBE_DEFER ?  or all probe()
> > >> errors?
> > >>
> > >> The documentation is explicitly stating for dev_Err_probe()
> > >>
> > >> ```
> > >>    * Note that it is deemed acceptable to use this function for error
> > >>    * prints during probe even if the @err is known to never be -EPROBE_DEFER.
> > >>    * The benefit compared to a normal dev_err() is the standardized format
> > >>    * of the error code and the fact that the error code is returned.
> > >>    *
> > >>
> > >> ```
> > > As in so many cases, it's partly a matter of taste :-) When it comes to
> > > changes such as
> > >
> > > -		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> > > -			imx219->xclk_freq);
> > > -		return -EINVAL;
> > > +		return dev_err_probe(dev, -EINVAL,
> > > +				     "xclk frequency not supported: %d Hz\n",
> > > +				     imx219->xclk_freq);
> > >
> > > I find the resulting less readable. The indentation is higher, you have
> > > to look at the parameters to dev_err_probe() to see what is returned
> > > (compared to reading "return -EINVAL"), and adding the error code to the
> > > printed message also makes the kernel log less as the error code really
> > > doesn't need to be printed in this case.
> > 
> > Indeed, a matter of taste ...
> > 
> > On IMX283 driver, I got the feedback that all probe errors should go via 
> > dev_err_probe()
> > 
> > "Make all messages in ->probe() stage to use the same pattern." [1]
> > 
> > For IMX219, (since it's the most appropriate reference driver from 
> > framework PoV), I saw that it is not logging through dev_err_probe(), 
> > and in such cases hence tried to align with [1]
> 
> I'd say we should have common guidelines for all sensor drivers. As
> Sakari is the maintainer here, he can be the judge too :-)

I don't really have much of an opinion. If there's a chance you might have
-EPROBE_DEFER, then you should use it, I guess, but it may well be
reasonable also otherwise.

-- 
Regards,

Sakari Ailus

