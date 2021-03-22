Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE75343704
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 04:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbhCVDCR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Mar 2021 23:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhCVDBr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Mar 2021 23:01:47 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A49CC061574;
        Sun, 21 Mar 2021 20:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=AbUtbbw+++6dvKZRwYZxzd/vcNNKSLCJwxvZNKR2U74=; b=fjcPpKY3kVLV8XG8xhpuH1l5Ut
        PobnVEpAd9gENsqJHY9hP1v2vwzP67y7Fyp0DOfUfqsIgJrBuD3j17ohl5xaI1ehGbK8n0mJ3dn0I
        hK3rAq/cnlvFr2KTFfYt535gAHR/47jAuJbdF4CPMaMmxEuEdF9P2ozXeiOsKwEW0AKoxsTzAu/Ei
        DZFSUa5vvEZdRevc8bVXHelAirpbauCrGZszeWktGOQucWZUNMNd5ef487vu9tJhHQ0TEbW1ozP7Y
        su8Q8theLQbgiHySN+i0AJt9Sy4mv8AAev5Y3FdA84zRIL1d1ZVnmtLs1RYVF6f8euN0pRijnvdOr
        wpbqaung==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lOAp3-00AjrX-DI; Mon, 22 Mar 2021 03:01:42 +0000
Subject: Re: [PATCH] media: Fix a typo
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20210322022431.3992890-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0124fc9c-6d96-e9ce-8c69-7362871fdecf@infradead.org>
Date:   Sun, 21 Mar 2021 20:01:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210322022431.3992890-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/21/21 7:24 PM, Bhaskar Chowdhury wrote:
> 
> s/Sysytem/System/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/staging/media/atomisp/i2c/gc2235.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
> index 68252b8f516d..ba5db1230033 100644
> --- a/drivers/staging/media/atomisp/i2c/gc2235.h
> +++ b/drivers/staging/media/atomisp/i2c/gc2235.h
> @@ -218,7 +218,7 @@ static struct gc2235_reg const gc2235_stream_off[] = {
>  };
> 
>  static struct gc2235_reg const gc2235_init_settings[] = {
> -	/* Sysytem */
> +	/* System */
>  	{ GC2235_8BIT, 0xfe, 0x80 },
>  	{ GC2235_8BIT, 0xfe, 0x80 },
>  	{ GC2235_8BIT, 0xfe, 0x80 },
> --


-- 
~Randy

