Return-Path: <linux-media+bounces-15551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6967E940D12
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 11:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2546C281F0F
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 09:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D74B19414B;
	Tue, 30 Jul 2024 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pl8/vXoP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EC91940A9;
	Tue, 30 Jul 2024 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722330636; cv=none; b=uas93vsLfnd22LjShBduNE3ECX0VkUwziV38LULbyt4rCI/0wFhTgGpUh6A9UtGhtKz0Qx1Noy8GirbEGoDSFHfsjVlAJ27YcepAeOHRwB3wws/kLsWozsghEHDro/NIcElnK6LZvsFYdHZSRTXmVh4ecSgqJocOtsZF/XZhesE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722330636; c=relaxed/simple;
	bh=2NmCI2POzf0UE9zMycMrxntBDQRqkQhz4KvcbTOG+8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxl8nKIkdCsFskOCs23DiG+9o980lXMW0gtd1JGWEGb1QF457nZF4SEeAlmUHfw+DO22BKzs4qK6NisEGaWUHIciF03Yv0+L6iBaO7rm+7qJ1XElKFtok2Rsa8hR1nUYdMORVvHvjod9+ojkxeY0Wu9+imF6NFQGPmIUdt5dySM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pl8/vXoP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8DDE4C9;
	Tue, 30 Jul 2024 11:09:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722330585;
	bh=2NmCI2POzf0UE9zMycMrxntBDQRqkQhz4KvcbTOG+8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pl8/vXoPwF34TQrK0jGnM3eLmljyQ04EKmwJOvpJbaTEkpXblPQ9syG+Qn9PJK61o
	 UO3+4w8y43Sxb3d9d7jZ4v2cG1XISBA5RQ9skdHutg8nPwBtT9cpcLVpEJnJB+BKEb
	 M+Kf90LLKEG8do8GuxEoDXwnhsP8wy34PIdi8a5c=
Date: Tue, 30 Jul 2024 12:10:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-media@vger.kernel.org, stable@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: imx335: Fix reset-gpio handling
Message-ID: <20240730091011.GL300@pendragon.ideasonboard.com>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
 <20240729110437.199428-3-umang.jain@ideasonboard.com>
 <ef05c39a-ad5c-4751-a758-f73a2d114823@kernel.org>
 <ZqijVf68ZQuFGKhU@kekkonen.localdomain>
 <729280cd-557f-43ba-b1a6-8d319977ca82@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <729280cd-557f-43ba-b1a6-8d319977ca82@kernel.org>

On Tue, Jul 30, 2024 at 10:42:01AM +0200, Krzysztof Kozlowski wrote:
> On 30/07/2024 10:24, Sakari Ailus wrote:
> > Hi Krzysztof,
> > 
> > On Mon, Jul 29, 2024 at 04:09:39PM +0200, Krzysztof Kozlowski wrote:
> >> On 29/07/2024 13:04, Umang Jain wrote:
> >>> Rectify the logical value of reset-gpio so that it is set to
> >>> 0 (disabled) during power-on and to 1 (enabled) during power-off.
> >>>
> >>> Meanwhile at it, set the reset-gpio to GPIO_OUT_HIGH at initialization
> >>> time to make sure it starts off in reset.
> >>>
> >>> Fixes: 45d19b5fb9ae ("media: i2c: Add imx335 camera sensor driver")
> >>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> >>> ---
> >>>  drivers/media/i2c/imx335.c | 8 ++++----
> >>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>
> >> This will break all the users, so no. At least not without mentioning
> >> ABI break and some sort of investigating how customers or users are
> >> affected.
> > 
> > I know the original authors aren't using the driver anymore and it took
> > quite a bit of time until others started to contribute to it so I suspect
> > the driver hasn't been in use for that long. There are no instances of the
> > device in the in-kernel DTS either.
> > 
> > Any DTS author should have also noticed the issue but of course there's a
> > risk someone could have just changed the polarity and not bothered to chech
> > what it was supposed to be.
> > 
> > I agree the commit message should be more vocal about the effects on
> > existing DTS.
> 
> I can imagine that all users (out of tree, in this case) inverted
> polarity in DTS based on what's implemented. You could go with some
> trivial hack, like I did for one of codecs - see 738455858a2d ("ASoC:
> codecs: wsa881x: Use proper shutdown GPIO polarity"), but I remember
> Mark Brown rejected similar commit for newer drivers.

I don't think there's any out-of-tree user, because when we started
using the recently driver, it required lots of fixes to even work at
all. I'll let Kieran and Umang comment on that, I haven't follow the
development in details.

-- 
Regards,

Laurent Pinchart

