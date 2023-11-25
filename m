Return-Path: <linux-media+bounces-1003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF5A7F88F3
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 08:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85FCE1C20C41
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 07:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285CB8F6A;
	Sat, 25 Nov 2023 07:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T6eKkn/L"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174E54435
	for <linux-media@vger.kernel.org>; Sat, 25 Nov 2023 07:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3AEEC433C8;
	Sat, 25 Nov 2023 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700898524;
	bh=2Jqvgdk2LpiV1WxebiiaBPjnXuNkuIUOCoXEMB6dMgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6eKkn/Lpf0Na1PwR3q0Nc9EpletVID6t2uGQTizJ0bBHU8T5dmAJrHfyIfZ609+Y
	 Yc0nv8ke+kSp+LuCytllFm86LqbCcVQrmMX6lZd8ixrC5x/EF+wewWwSVCD5vSh6+q
	 wP5N6pCisVTRJTMOHjY2hdSpIeMRN7PglaDSYyts=
Date: Sat, 25 Nov 2023 07:48:41 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Phillip Potter <phil@philpotter.co.uk>
Subject: Re: [PATCH V3] media: stk1160: Fixed high volume of stk1160_dbg
 messages
Message-ID: <2023112554-bagginess-banker-089e@gregkh>
References: <20231125073738.649948-1-ghanshyam1898@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125073738.649948-1-ghanshyam1898@gmail.com>

On Sat, Nov 25, 2023 at 01:07:38PM +0530, Ghanshyam Agrawal wrote:
> The function stk1160_dbg gets called too many times, which causes
> the output to get flooded with messages. Since stk1160_dbg uses
> printk, it is now replaced with printk_ratelimited directly.
> 
> Suggested-by: Phillip Potter <phil@philpotter.co.uk>
> Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> ---
> V3:
> Fixed the issue with my patch needing previous versions being applied
> first.
> 
> Used printk_ratelimited instead of dev_warn_ratelimited because
> of compiler error "incompatible pointer type".
> 
> V2:
> To add KERN_WARNING in printk_ratelimited, and later as per warning by
> the checkpatch script, replaced  printk_ratelimited with 
> dev_warn_ratelimited.
> 
> V1:
> The function stk1160_dbg gets called too many times, which causes
> the output to get flooded with messages. Since stk1160_dbg uses
> printk, it is now replaced with dev_warn_ratelimited.
> 
>  drivers/media/usb/stk1160/stk1160-video.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> index 4e966f6bf608..98417fa31d70 100644
> --- a/drivers/media/usb/stk1160/stk1160-video.c
> +++ b/drivers/media/usb/stk1160/stk1160-video.c
> @@ -107,8 +107,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
>  
>  	/*
>  	 * TODO: These stk1160_dbg are very spammy!
> -	 * We should 1) check why we are getting them
> -	 * and 2) add ratelimit.
> +	 * We should check why we are getting them.
>  	 *
>  	 * UPDATE: One of the reasons (the only one?) for getting these
>  	 * is incorrect standard (mismatch between expected and configured).
> @@ -151,7 +150,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
>  
>  	/* Let the bug hunt begin! sanity checks! */
>  	if (lencopy < 0) {
> -		stk1160_dbg("copy skipped: negative lencopy\n");
> +		printk_ratelimited(KERN_WARNING "copy skipped: negative lencopy\n");

You changed a debug message level to a KERN_WARNING level?  That feels
like a step backwards.

thanks,

greg k-h

