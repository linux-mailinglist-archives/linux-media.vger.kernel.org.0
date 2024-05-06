Return-Path: <linux-media+bounces-10895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C8F8BD1B4
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 17:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 475B0282235
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 15:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E141553A7;
	Mon,  6 May 2024 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="aNWHc6i2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fuk/2CSB"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout7-smtp.messagingengine.com (wfout7-smtp.messagingengine.com [64.147.123.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C268002A;
	Mon,  6 May 2024 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715010307; cv=none; b=u6bUUeV79yVVo47cW6p7H7caWwIrt92YtHsrV6ZB7wNXnZIgaCgKzG1v7aTxuO2iGPb3bm9IP64JjVgDXZin0jxgGgIyDzeGDQqe2BB9sUhHoAd0j4D6Tis8hP8qecMT6QN8fD3mvVn0jrkwEF4Y/OMRi3C+KsZMMRnmz51Cdnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715010307; c=relaxed/simple;
	bh=CzO86Ecjjq43vk9vd/lZbqzy6KgX5xn92z/ZND0YmQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6iEDxffgbGohdyLQkNELOCpJ/BtVdkT+3YobOYc7oEjZIy+e/lcB3//2/slqS53qj03n/5qy5z5gHZaO+bfrqrGihor0zXz8oVLUOY5vDEyHP7QNWo7mBKVY48ZLDSn4dOYmK0Re9XcS6QjdGq175kT8MJo4SmCooOWebitMEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=aNWHc6i2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fuk/2CSB; arc=none smtp.client-ip=64.147.123.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id A8DC11C00182;
	Mon,  6 May 2024 11:45:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Mon, 06 May 2024 11:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715010304;
	 x=1715096704; bh=6/OULYBvCLTct6dB/vSEFPlG1h1yzseKryz3nrqKAEU=; b=
	aNWHc6i2o8lt2Vqu7b4aa1gSHbWLv4TJH8hktER/yRcXog7ErZxVeQ9oJhP82iuq
	zivATm4KLydwSmUlV5cLH1xjlBDxCfYXXZ1NXBhxhbjEyhs+TwSShBco5Rp3zIdz
	9vUMUYFXJX0zLp4dSMvxPHEV2hvQk3M/sUDP+4LZpppC6QZ4hM568RKEnHgksuIr
	Wi/ZdygzaNddivMOIklflSaCdyHmrV5DIR8am20M4CIWgYJV0CB1dLSv9tMaCN+d
	n0LUMRT9oj19jEic5tDAnIGa+a9Sr+aNWnpXMA5zTIvyqWTPGVsZtHzTNLZ6gx6G
	5+BsEAp8BGJihSzOViNB/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715010304; x=
	1715096704; bh=6/OULYBvCLTct6dB/vSEFPlG1h1yzseKryz3nrqKAEU=; b=f
	uk/2CSBbUjgHMOjZ1ji1w3bgasBy8jbbxhrXltm1wRxK0vZ93Tq0QXAodoMqkhfv
	GXYH2qyEwn2Ijj+P9qPXz3tEgxxEhyR/D0p/hKmIFQW0kNM2c4pE6TPphTAGvulD
	VxXjA4fhrEDxwBm5rydZda2ZYrV71HLzwiKX4tJd6Ui1Vom//G0grPHICpj0W01p
	Tq4a3FS0rZZOEY9jCb8RPpsxNxEX1KbO2otzPkLXfB87AhqHz0eArIIYVYvDAtVA
	Ewr4wXOxejFkrLggBfgrUqhLO1+GntZqp6G9YIcUp1o36/GFx+Kq/CFuCN5xObC0
	0fXMLKc0Em1I+cU2OFrhg==
X-ME-Sender: <xms:APs4ZpllqnB4_4EFICWXAGCqUQzMPJz-l-cxILch6C6NjetFMof8BQ>
    <xme:APs4Zk3U1q5iKuuTeL_NEt4XjTceA2ypQ9vvOEkfSgRyK_6GDFPdQjvlhIZDU8zLo
    9PuPa41t93rwURCL0E>
X-ME-Received: <xmr:APs4ZvrqkegR9X49yPQ30LHq8qbhgxWtGmvJbGMBx7pGTqNZ4cA8rRt0-vFFsMh-AFQmRH1CgZKGu6ChHFrFjCmXvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddviedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:APs4ZpkUmc6vbY-sBRfM-rPwI4nRm9HebvC-onFBM9wulEnTGUuGSA>
    <xmx:APs4Zn3__mYmQZMpgP1w5FAZSmS_BdIC7NWB_YNg9I_VSRR7zPgdZQ>
    <xmx:APs4ZouyP2IYg7HeBJm--NJ4ceOiEQ1uDcgqe6lXHj_0R0pWNBPHWA>
    <xmx:APs4ZrV4SaSUbDogcuzUgldaVtNb3XP1zzVP24e9NeCskSZlsWotyA>
    <xmx:APs4ZskLgheHuUDitQdHObB2ORJ1N_Jjb_k-otBMI6i4lzLYNP1ywi6Q>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 May 2024 11:45:03 -0400 (EDT)
Date: Mon, 6 May 2024 17:45:02 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/11] media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
Message-ID: <20240506154502.GA345614@ragnatech.se>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
 <20240503155127.105235-2-jacopo.mondi@ideasonboard.com>
 <20240505205043.GA25518@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240505205043.GA25518@pendragon.ideasonboard.com>

Hello,

On 2024-05-05 23:50:43 +0300, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Fri, May 03, 2024 at 05:51:16PM +0200, Jacopo Mondi wrote:
> > The YUYV8_1X16 and UYVY8_1X16 formats are treated as 'ITU-R
> > BT.601/BT.1358 16-bit YCbCr-422 input' (YUV16 - 0x5) in the R-Car VIN
> > driver and are thus disallowed when capturing frames from the R-Car
> > CSI-2 interface according to the hardware manual.
> > 
> > As the 1X16 format variants are meant to be used with serial busses they
> > have to be treated as 'YCbCr-422 8-bit data input' (0x1) when capturing
> > from CSI-2, which is a valid setting for CSI-2.
> > 
> > Commit 78b3f9d75a62 ("media: rcar-vin: Add check that input interface
> > and format are valid") disallowed capturing YUV16 when using the CSI-2
> > interface. Fix this by using YUV8_BT601 for YCbCr422 when CSI-2 is in
> > use.
> > 
> > Fixes: 78b3f9d75a62 ("media: rcar-vin: Add check that input interface and format are valid")
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  .../media/platform/renesas/rcar-vin/rcar-dma.c   | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > index e2c40abc6d3d..21d5b2815e86 100644
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
> > @@ -742,12 +742,22 @@ static int rvin_setup(struct rvin_dev *vin)
> >  	 */
> >  	switch (vin->mbus_code) {
> >  	case MEDIA_BUS_FMT_YUYV8_1X16:
> > -		/* BT.601/BT.1358 16bit YCbCr422 */
> > -		vnmc |= VNMC_INF_YUV16;
> > +		if (vin->is_csi)
> > +			/* YCbCr422 8-bit */
> > +			vnmc |= VNMC_INF_YUV8_BT601;
> > +		else
> > +			/* BT.601/BT.1358 16bit YCbCr422 */
> > +			vnmc |= VNMC_INF_YUV16;
> >  		input_is_yuv = true;
> >  		break;
> >  	case MEDIA_BUS_FMT_UYVY8_1X16:
> > -		vnmc |= VNMC_INF_YUV16 | VNMC_YCAL;
> > +		if (vin->is_csi)
> > +			/* YCbCr422 8-bit */
> > +			vnmc |= VNMC_INF_YUV8_BT601;
> > +		else
> > +			/* BT.601/BT.1358 16bit YCbCr422 */
> > +			vnmc |= VNMC_INF_YUV16;
> > +		vnmc |= VNMC_YCAL;
> 
> You could also write
> 
> 	case MEDIA_BUS_FMT_UYVY8_1X16:
> 		vnmc |= VNMC_YCAL;
> 		fallthrough;
> 	case MEDIA_BUS_FMT_YUYV8_1X16:
> 		if (vin->is_csi)
> 			/* YCbCr422 8-bit */
> 			vnmc |= VNMC_INF_YUV8_BT601;
> 		else
> 			/* BT.601/BT.1358 16bit YCbCr422 */
> 			vnmc |= VNMC_INF_YUV16;
> 		input_is_yuv = true;
> 		break;
> 
> Up to you.

I prefers Jacopo's version. This function should likely be reworked in 
the future to be separate Gen2/Gen3/Gen4 versions so we can remove all 
these ugly checks as not all formats are supported on all hardware 
generations.

I think that work would be easier if we keep the current ugly and dumb 
structure of these switches.

> 
> On a side note, CSI-2 isn't supposed to support
> MEDIA_BUS_FMT_YUYV8_1X16. The native format is MEDIA_BUS_FMT_UYVY8_1X16.
> I wonder if we should trim down the list of supported formats. That's a
> candidate for another patch though.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> >  		input_is_yuv = true;
> >  		break;
> >  	case MEDIA_BUS_FMT_UYVY8_2X8:
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

