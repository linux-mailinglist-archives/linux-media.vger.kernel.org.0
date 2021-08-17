Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01ADE3EEB4F
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 13:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236253AbhHQLBo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 07:01:44 -0400
Received: from gofer.mess.org ([88.97.38.141]:34459 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236413AbhHQLBo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 07:01:44 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id EEB74C6459; Tue, 17 Aug 2021 12:01:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1629198069; bh=3Hf2kjmrZS7y5m+g+HH4Wijwu9LoVfWTnc54wguFOwo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nxsjQy5wvPaeVVrzE1FwK1kB/GD1ql48uST7OIIHHX6VTTwlmhKXZPyq1gWuu6Led
         Yux02baUm3Ub7OvqcGebCwxatsUcBQlptj8GWsY4ffvA6iEfU0dx4oGc5QChhV8HcO
         X0VjxOS8xHzv16j3q7rPJt+RYWqjvHuOSq4BPUOHH87KTrdMqTz0Wb/KhOx4SED3zp
         cIfYwNwNxQrm3cbY6P+LwpSv4OrNZSWITAS8ciKTW4i1y3QSjRvvzlVf0/HVlAORKU
         PJG5tCTWLqBs78U/Ke7D2KdhQDaP5X7GqRB4432LywrU9DUtuFlAr0OeFJn31N6KjY
         rtV66pMoWR4fg==
Date:   Tue, 17 Aug 2021 12:01:09 +0100
From:   Sean Young <sean@mess.org>
To:     Nil Yi <teroincn@163.com>
Cc:     crope@iki.fi, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: usb: dvb-usb-v2: clean the freed pointer and
 counter
Message-ID: <20210817110109.GA18933@gofer.mess.org>
References: <20210815100109.GA70768@nilus-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210815100109.GA70768@nilus-desk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 15, 2021 at 06:01:09PM +0800, Nil Yi wrote:
> After urb was freed, the pointer and counter need to be
> cleaned.

Ideally the commit message will say why this change needs happen, i.e.
what code path might lead to something bad happening.

I'm re-reading the code and I'm having a hard time figuring out what
that code path is, i.e. why this patch is needed.

Also "cleaned" isn't common terminology as far I know. Better to avoid
that.

Thanks

Sean

> 
> Signed-off-by: Nil Yi <teroincn@163.com>
> ---
>  drivers/media/usb/dvb-usb-v2/usb_urb.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/usb_urb.c b/drivers/media/usb/dvb-usb-v2/usb_urb.c
> index 2ad2ddeaf..08ba2d138 100644
> --- a/drivers/media/usb/dvb-usb-v2/usb_urb.c
> +++ b/drivers/media/usb/dvb-usb-v2/usb_urb.c
> @@ -143,8 +143,11 @@ static int usb_urb_alloc_bulk_urbs(struct usb_data_stream *stream)
>  		stream->urb_list[i] = usb_alloc_urb(0, GFP_ATOMIC);
>  		if (!stream->urb_list[i]) {
>  			dev_dbg(&stream->udev->dev, "%s: failed\n", __func__);
> -			for (j = 0; j < i; j++)
> +			for (j = 0; j < i; j++) {
>  				usb_free_urb(stream->urb_list[j]);
> +				stream->urb_list[j] = NULL;
> +			}
> +			stream->urbs_initialized = 0;
>  			return -ENOMEM;
>  		}
>  		usb_fill_bulk_urb(stream->urb_list[i],
> @@ -173,8 +176,11 @@ static int usb_urb_alloc_isoc_urbs(struct usb_data_stream *stream)
>  				stream->props.u.isoc.framesperurb, GFP_ATOMIC);
>  		if (!stream->urb_list[i]) {
>  			dev_dbg(&stream->udev->dev, "%s: failed\n", __func__);
> -			for (j = 0; j < i; j++)
> +			for (j = 0; j < i; j++) {
>  				usb_free_urb(stream->urb_list[j]);
> +				stream->urb_list[j] = NULL;
> +			}
> +			stream->urbs_initialized = 0;
>  			return -ENOMEM;
>  		}
>  
> -- 
> 2.17.1
> 
