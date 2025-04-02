Return-Path: <linux-media+bounces-29189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D46DA78801
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 08:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60DC4188A0BA
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 06:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B88F231A5F;
	Wed,  2 Apr 2025 06:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ng4auzJ9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010E180B;
	Wed,  2 Apr 2025 06:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743574588; cv=none; b=seXmlgTPK38KQS5Pb+epxQPg5z7iwd364BGFn/yD0NP63eP8Y9UEjitReY0/8ebsjRVoBhUNCjN254pViqTlINObMkPvUNCSNSd6PVCo/n9KBGRfKO6h6Gj8XWfq9iR/XQxPRUynjPm2rY6UoiXZzag8fzcSwLIxRsMbvgEt5zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743574588; c=relaxed/simple;
	bh=o5SPs2kmzrF3uxWXmhZNC1OOCYmDmloKgvKUJZ6X9Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vd3u9WPdDbuJcYUeshGtxQyEHxscduZ9OrLrrVenz82SrRaPUJMC6OhVyA5Y8iruBhOJGeHjrl5MzxGTdVTirCl8whYSGy6oojdUH1yZTfsJLsooFw4MSfOoIL8qs1SN0hAQ4uZiywD7sIPRT75b9ryCwWPvrpI669J8MDwj8k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ng4auzJ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224BEC4CEDD;
	Wed,  2 Apr 2025 06:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743574587;
	bh=o5SPs2kmzrF3uxWXmhZNC1OOCYmDmloKgvKUJZ6X9Fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ng4auzJ9VAFdyxqqaXMITshYAUOOKZCYo6fV2eBQV/O8YHMzef+bZOlxtjloTZUHN
	 Wv6BQ8TWIv7i7c6XP90VQeVbfd1A2mpgOI4AL7RgWX13Or+rhaUoqLuaOZTb0oajOT
	 rTjSLYe8C58ijjX4SRpR7kYyM+Y3DsFciiyMy9nE=
Date: Wed, 2 Apr 2025 07:15:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: gshahrouzi@gmail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org
Subject: Re: [PATCH] staging: media: Remove unnecessary braces for single
Message-ID: <2025040246-smith-unfixed-bb4c@gregkh>
References: <67ec86f5.d40a0220.2fb67c.97f0@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67ec86f5.d40a0220.2fb67c.97f0@mx.google.com>

On Tue, Apr 01, 2025 at 05:38:13PM -0700, gshahrouzi@gmail.com wrote:
> >>From 2414aa327e8a2b2f8b7cb5673c20bcdea3c5763e Mon Sep 17 00:00:00 2001
> From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> Date: Tue, 1 Apr 2025 20:22:22 -0400
> Subject: [PATCH] staging: media: Remove unnecessary braces for single
>  statement block
> 
> Remove unnecessary braces in single statement block to comply with kernel
> coding style.
> ---
>  drivers/staging/media/imx/imx-media-of.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
> index bb28daa4d713..7413551052ae 100644
> --- a/drivers/staging/media/imx/imx-media-of.c
> +++ b/drivers/staging/media/imx/imx-media-of.c
> @@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
>  		of_node_put(csi_np);
>  		if (ret) {
>  			/* unavailable or already added is not an error */
> -			if (ret == -ENODEV || ret == -EEXIST) {
> +			if (ret == -ENODEV || ret == -EEXIST)
>  				continue;
> -			}
>  
>  			/* other error, can't continue */
>  			return ret;
> -- 
> 2.43.0
> 


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

