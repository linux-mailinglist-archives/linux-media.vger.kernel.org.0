Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0655344F92
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 20:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbhCVTDr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 15:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbhCVTD1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 15:03:27 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C830FC061574;
        Mon, 22 Mar 2021 12:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=gTn5a+hhi+Al/ztxFkfdOPHESSGHwdfBo/g0d5NtQJo=; b=RLxxwg0gf5U9/d/qw39M8eAv2M
        XFswTw1Z5NKMOpWgzXt+34Rfk1PsM/EBNMd8jj1vccz9sXvkvzFCy7s/ZYJOLEsY6IWOUYh8NwkpX
        X0GZzbCRu3TEcDZDjYsZPtpk45+0YvRwTqubm00FYPGN8pvxSwniaLCAQzRM1dkFzxbzQ8L8oKZ73
        nH9FhV/gSk/5Zh9us7nWPwvtCxZDNmeVxxsrRr46+BkMZlXzXAsa7teJqbBIcNYT81ryEGpjA3VHd
        Acr5qq6C9UqMQGYfDTTVu12loRTRIMDAx3gU74glxB6uCYWpwBbJXATeAXVN7V5mN3fvAFw/utrMA
        cSi0LyAg==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lOPp5-008wxs-9F; Mon, 22 Mar 2021 19:02:57 +0000
Subject: Re: [PATCH] drivers/media/pci/cx18: Fix a spelling minimze to
 minimize in the file cx18-firmware.c
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, awalls@md.metrocast.net,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210213150014.1605602-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cd6fbcc5-a3f5-2ee0-ce36-1ae2177dddfe@infradead.org>
Date:   Mon, 22 Mar 2021 12:02:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210213150014.1605602-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/13/21 7:00 AM, Bhaskar Chowdhury wrote:
> 
> s/minimze/minimize/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

I was about to Ack this one, but really, all of these tiny cx18 patches
should be merged into just one patch.

> ---
>  drivers/media/pci/cx18/cx18-firmware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/cx18/cx18-firmware.c b/drivers/media/pci/cx18/cx18-firmware.c
> index 876b96c11290..fdac310d7477 100644
> --- a/drivers/media/pci/cx18/cx18-firmware.c
> +++ b/drivers/media/pci/cx18/cx18-firmware.c
> @@ -244,7 +244,7 @@ void cx18_init_power(struct cx18 *cx, int lowpwr)
>  	 * an error of less than 0.13 ppm which is way, way better than any off
>  	 * the shelf crystal will have for accuracy anyway.
>  	 *
> -	 * Below I aim to run the PLLs' VCOs near 400 MHz to minimze errors.
> +	 * Below I aim to run the PLLs' VCOs near 400 MHz to minimize errors.
>  	 *
>  	 * Many thanks to Jeff Campbell and Mike Bradley for their extensive
>  	 * investigation, experimentation, testing, and suggested solutions of
> --


-- 
~Randy

