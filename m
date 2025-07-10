Return-Path: <linux-media+bounces-37248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5149AFFA1F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 08:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFA254E5970
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 06:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5360D280328;
	Thu, 10 Jul 2025 06:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VLpZlqE3"
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14E9230BE1
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 06:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752130245; cv=none; b=S3nTac5u/xZ1vazGG24SgwT6BeggXT2FKBI6dj1XwUlG1DWVbtTDL4wvGJT+sQLLmREcsi1H7jAyGYl0Dr5m51MZP3dY4OqG+2amqsCMspvKGHCZug1ykUWIV2gN9GrwNXEoFXL/AdvUsgHN996ho+mi1/oBVJcX67hg7EkiJOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752130245; c=relaxed/simple;
	bh=SdKu/GMtQwLJEaaCjW1RIxQW251XZf8SCLIOEAOt2Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i25UjWKRruN1TQcZqZSrxAC2NHX4k+STZEwkJDo7ZXJA08wYWE/ZeDQjdiyJUvy7D6YrziIXlBtqqDdTWNOhZdYJgcuYjEIOGI4lek9jG0LDDqOTmvANybEfadfAQnkIKbAJpg2gJuGIH7hcvI7uEwuFcZBNkOgvOxuHlG3S5js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VLpZlqE3; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 10 Jul 2025 08:50:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752130231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L992WhSF6F+1xmuH9sbrraDKPVVrouzQDALMSeEPU6E=;
	b=VLpZlqE3pduyxnSeEIEq3yWk1uVtTSY2ymaBgs3clzezyqe95JRPQQ2Hw3o7LW0mSNFetQ
	POUK6FqNboPqrVpFHH9VGN/qqJtiSBA3m4W3w0F51Oyz9JwjVmOMX5LrjWTXEHfggCGlHL
	nPWk7glePEwgFTrQaYTj2PLJWs931cw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 06/10] media: i2c: ov9282: add led_mode v4l2 control
Message-ID: <5i6a77wbggmjjxfridurbq5mrdjksse236vwucawbi43fjv2ae@umy4fe7six5p>
References: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
 <20250617-ov9282-flash-strobe-v5-6-9762da74d065@linux.dev>
 <aG7bWXpz5sxYcLKI@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG7bWXpz5sxYcLKI@kekkonen.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi Sakari,

thanks for the feedback :)

On Wed, Jul 09, 2025 at 09:12:57PM +0000, Sakari Ailus wrote:
> Hi Richard,
> 
> Thanks for the update.
> 
> On Tue, Jun 17, 2025 at 09:31:40AM +0200, Richard Leitner wrote:
> > Add V4L2_CID_FLASH_LED_MODE support using the "strobe output enable"
> > feature of the sensor. This implements following modes:
> > 
> >  - V4L2_FLASH_LED_MODE_NONE, which disables the strobe output
> >  - V4L2_FLASH_LED_MODE_FLASH, which enables the strobe output
> 
> I really think you should use a different control for this. The sensor can
> strobe the flash but it won't control its mode.
> 
> How about calling it V4L2_FLASH_STROBE_ENABLE?

I agree on that. But tbh V4L2_FLASH_STROBE_ENABLE somehow sounds wrong
to me. As the strobe output in the ov9282 case goes high for the strobe
duration, what do you think about calling it V4L2_FLASH_STROBE_PULSE?
Or should it be V4L2_FLASH_LED_MODE_STROBE_PULSE?

Regarding disabling the strobe output: Is sticking with V4L2_FLASH_LED_MODE_NONE
fine? Or do you prefer an additional V4L2_FLASH_(MODE_)STROBE_DISABLE
or something similar?

regards;rl

> 
> -- 
> Kind regards,
> 
> Sakari Ailus

