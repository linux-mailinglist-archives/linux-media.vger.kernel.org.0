Return-Path: <linux-media+bounces-41212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A535B393EE
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 08:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0C26680B83
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 06:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA18427A455;
	Thu, 28 Aug 2025 06:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GDg5Ts2G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEE013DDAA;
	Thu, 28 Aug 2025 06:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756363232; cv=none; b=tBsnOMkO+bD3sFShIWDhMOns1eaPQ3AFkhPhzPfxOrMjtlDveRZODbcEvydBrEubq2wj+AJy+GH3/DJYCkObWe5rdu4auQjNGVjveu8z+ZpqgNjXUBu3TBBjNhJWrpF6l7HrfQB8B5MfGSdQAdauZn4LpOzD3PnZjopSlYJf9PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756363232; c=relaxed/simple;
	bh=wVanGn2pOTKHqPky1Y3RQndB0p77FejtrPuOmSQtWXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kN1b3twvtO++se7QZFKao731ykkIMt6F3HOTTyLcmI57WBA74lW+t3vakAUgY3frcNSapnp4b8NTIgxFnBohQGllos/LShBj9AgBM0q5tZ6dpvLb3QMER7WqHnIdDH7y4DSh5YANfgXawPDjJiOWHg4i1U9QMNEZ5iNYZ4LavI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GDg5Ts2G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-54-205.net.vodafone.it [5.90.54.205])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F08C11189;
	Thu, 28 Aug 2025 08:39:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756363163;
	bh=wVanGn2pOTKHqPky1Y3RQndB0p77FejtrPuOmSQtWXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GDg5Ts2G+3SlSwd1DcTVyPe05wCOclNLYfI0by+1CIhtKcUiytaUcNbQt4TCmAkSH
	 afr4efv5omdyQ7OeyCsyhqAbCvXop7zDtxlw930UqS+yBrYMUUJG1EygDPKLp4qOil
	 /Apjqspkq/xvM4xy5rIN11hIFtoX+IoMZibZBIHM=
Date: Thu, 28 Aug 2025 08:40:22 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"open list:MT9V111 APTINA CAMERA SENSOR" <linux-media@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] media: i2c: mt9v111: fix incorrect type for ret
Message-ID: <bceety6ir4doadxo7zeixc3vve5faewtqhofsilkcjcbppwu4p@zdis66vyayi2>
References: <20250827123916.504189-1-rongqianfeng@vivo.com>
 <20250827123916.504189-3-rongqianfeng@vivo.com>
 <xbmwlnflzhfhapyt5dinqqsdurxgu5imlqixudopb7z32eteth@cs7hulza54e3>
 <411e9db5-5339-4527-bb3d-473b339a6572@vivo.com>
 <x3wogjf6vgpkisdhg3abzrx7v7zktmdnfmqeih5kosszmagqfs@oh3qxrgzkikf>
 <8cf9d7a6-9950-4086-8b81-ddaa68639410@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cf9d7a6-9950-4086-8b81-ddaa68639410@vivo.com>

Hi Qianfeng

On Thu, Aug 28, 2025 at 10:08:07AM +0800, Qianfeng Rong wrote:
>
> 在 2025/8/28 0:24, Jacopo Mondi 写道:
> > [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Hi Qianfeng
> >
> > On Wed, Aug 27, 2025 at 11:41:26PM +0800, Qianfeng Rong wrote:
> > > 在 2025/8/27 20:58, Jacopo Mondi 写道:
> > > > [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > > >
> > > > Hi Qianfeng
> > > >
> > > > On Wed, Aug 27, 2025 at 08:39:10PM +0800, Qianfeng Rong wrote:
> > > > > Change "ret" from unsigned int to int type in mt9v111_calc_frame_rate()
> > > > > to store negative error codes or zero returned by __mt9v111_hw_reset()
> > > > > and other functions.
> > > > >
> > > > > Storing the negative error codes in unsigned type, doesn't cause an issue
> > > > > at runtime but it's ugly as pants.
> > > > >
> > > > > No effect on runtime.
> > > > well, I'm not sure that's true.
> > > >
> > > > The code goes as
> > > >
> > > >           ret = __mt9v111_hw_reset(mt9v111);
> > > >           if (ret == -EINVAL)
> > > >                   ret = __mt9v111_sw_reset(mt9v111);
> > > >           if (ret)
> > > >                   return ret;
> > > >
> > > > And if ret is unsigned the condition ret == -EINVAL will never be met.
> > > >
> > > > I guess this actually fixes a bug, doesn't it ?
> > > > You can add:
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
> > > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > >
> > > > Thanks
> > > >     j
> > > I have written a test program on the arm64 platform:
> > >
> > > unsigned int ret = -ENOMEM;
> > >
> > > if (ret == -ENOMEM)
> > >      pr_info("unsigned int ret(%u) == -ENOMEM\n", ret);
> > > else
> > >      pr_info("unsigned int ret(%u) != -ENOMEM\n", ret);
> > >
> > > Output log is: unsigned int ret(4294967284) == -ENOMEM
> > Indeed, I was very wrong and ignoring the C integer promotion rules.
> >
> > If I read right the "6.3.1.8 Usual arithmetic conversions" section of
> > the C11 specs I found freely available online (ISO/IEC 9899:201x), in
> > particular:
> >
> > if the operand that has unsigned integer type has rank greater or
> > equal to the rank of the type of the other operand, then the operand with
> > signed integer type is converted to the type of the operand with unsigned
> > integer type.
> >
> > Indeed the above doesn't introduce any functional change (as the
> > 'rank' of an unsigned int is the same as the one of an int [1])
> >
> > I would anyway consider it at least a "logical" fix, as comparing an
> > unsigned int to a negative error code is misleading for the reader at
> > the least.
> >
> > Thanks anyway for testing.
> >
> > [1] Section "6.3.1.1"
> > The rank of any unsigned integer type shall equal the rank of the corresponding
> > signed integer type, if any.
>
>
> Thank you for letting me know about this.  It's a great learning experience
> through our discussions-cheers!
>
> Do I still need to submit the v2 version with the following additions?
>
> Cc: stable@vger.kernel.org
> Fixes: aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

I would do so anyway, yes.

For sure you can keep my tag ;)

Cheers!

>
> Best regards,
> Qianfeng
>
> >

