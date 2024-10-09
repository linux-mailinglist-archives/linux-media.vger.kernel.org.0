Return-Path: <linux-media+bounces-19329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CEE9971BE
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 18:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A9661F2AFED
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 16:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D930E1E25EB;
	Wed,  9 Oct 2024 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzGO/g61"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402C41E1C28;
	Wed,  9 Oct 2024 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728491447; cv=none; b=ks1+jK5lj12SxwnZS/KlJ1sbXbGWfvpySYiWuVT5fbCudq+TZmXjKIicp8Ke6ZDLj/4qwF6ryqwdA8ogfOskGnwaWgwLC85V3g7cA8Xwgp3Z7CTJv11SdFXCdI0WyxkvIfZ/m5MnFy5dB4uVtO8quVBaEBEEl3CcIkShGt2syPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728491447; c=relaxed/simple;
	bh=p2SwZu0y0jZu3uMoIRH/Uwl6N0CoH1qLqSxXadMMjuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDwhzybUHGNHIwtCDKHIVADG6JVAkQNYn/g8hSNRW15Lc/lViR5dPbO0obAku+J8ZskP/TKXbgze4Ytoy+9QEtq4XZTuUBtyvWC5rt2rEICCBWNPptJ0LNHUMvnWRWkI5CycePYzxWEhH+IMHTY6Z31zyMv6wYqTtKZ40O8rBIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzGO/g61; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C371C4CEC3;
	Wed,  9 Oct 2024 16:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728491446;
	bh=p2SwZu0y0jZu3uMoIRH/Uwl6N0CoH1qLqSxXadMMjuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XzGO/g61YJm9+ot1jGk8JWOgYup0diGNpbrziVWKOF9o9A5WLEtrfWuNIw7VlU8Y0
	 xQy/WKZHo0Kyq6oalg3f1HT/BBlJZzSK1w47bytQ6g4Eb/QTG++tScZZ12+3SnuWNj
	 MKzDeZYT7f1qzG3Gr1LtxInXbIpx9ZzFtubaOHJAPDA1fuvR7W8G7YAbuv5fLKRzIP
	 XLCXUceVgMoAF+B6XBkBrr3Jt5fGvAtdGe/RAZEngyuApiFnGM5RRybeEA7/I/HhC8
	 mf9jAqkBhK5LRU1X2/wcims6n0RGQ53AqP4IwR5GtGiDSZZo9q/jWx/Lw2YE7gungY
	 B3ozNYVfnV9TQ==
Date: Wed, 9 Oct 2024 18:30:44 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 14/15] media: anysee: Fix link to outdated sleep
 function documentation
Message-ID: <ZwavtEHr_29NTvTg@localhost.localdomain>
References: <20240911-devel-anna-maria-b4-timers-flseep-v2-0-b0d3f33ccfe0@linutronix.de>
 <20240911-devel-anna-maria-b4-timers-flseep-v2-14-b0d3f33ccfe0@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240911-devel-anna-maria-b4-timers-flseep-v2-14-b0d3f33ccfe0@linutronix.de>

Le Wed, Sep 11, 2024 at 07:13:40AM +0200, Anna-Maria Behnsen a écrit :
> The TODO FIXME comment references the outdated lower limit for msleep()
> function of 20ms. As this is not right and the proper documentation of
> msleep() is now part of the function description, remove the old stuff and
> point to the up to date documentation.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> ---
>  drivers/media/usb/dvb-usb-v2/anysee.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/anysee.c b/drivers/media/usb/dvb-usb-v2/anysee.c
> index 8699846eb416..b2f5db961245 100644
> --- a/drivers/media/usb/dvb-usb-v2/anysee.c
> +++ b/drivers/media/usb/dvb-usb-v2/anysee.c
> @@ -55,10 +55,8 @@ static int anysee_ctrl_msg(struct dvb_usb_device *d,
>  
>  	/* TODO FIXME: dvb_usb_generic_rw() fails rarely with error code -32
>  	 * (EPIPE, Broken pipe). Function supports currently msleep() as a
> -	 * parameter but I would not like to use it, since according to
> -	 * Documentation/timers/timers-howto.rst it should not be used such
> -	 * short, under < 20ms, sleeps. Repeating failed message would be
> -	 * better choice as not to add unwanted delays...
> +	 * parameter. Check msleep() for details. Repeating failed message would
> +	 * be better choice as not to add unwanted delays...

Does the comment still matches any up-to-date worry? It passes 2000 ms which is
2 seconds...

Thanks.

>  	 * Fixing that correctly is one of those or both;
>  	 * 1) use repeat if possible
>  	 * 2) add suitable delay
> 
> -- 
> 2.39.2
> 

