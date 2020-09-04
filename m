Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F3525D7A5
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 13:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729941AbgIDLmx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 07:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729659AbgIDLmu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 07:42:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE458C061244;
        Fri,  4 Sep 2020 04:42:45 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B8DF540;
        Fri,  4 Sep 2020 13:42:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599219758;
        bh=5m9CPuvvJ12BVvZCUIbqTZxHowrCyBw0gm7zJPfA8Tk=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=iZcI2metrdWJP29zWbt4Wl/p1Oma+MvfWw3k3v8xTom6lzI2h87eY86qiw2VBIwwa
         Ae17SfWw63szbsB9sh9mzIc+TKyOXrZlumOWNeIyAcYKoHhQaLkvN1I1mttgJK66lR
         /7k0EQ3808tUbAESiiDd5+d8e9U+aSuRcC70m/Wk=
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
To:     Joe Perches <joe@perches.com>, Jiri Kosina <trivial@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <cover.1598331148.git.joe@perches.com>
 <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <e6035e4b-9d4e-3c23-c140-4e9d6822496b@ideasonboard.com>
Date:   Fri, 4 Sep 2020 12:42:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joe,

Nice, I only see three of these on the linux-media list, so I'll only
look at those, but I'm pleased to see this is treewide ;-)

Definitely prefer this.

On 25/08/2020 05:56, Joe Perches wrote:
> Use semicolons and braces.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/dma-buf/st-dma-fence.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index e593064341c8..c8a12d7ad71a 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -471,8 +471,11 @@ static int thread_signal_callback(void *arg)
>  			dma_fence_signal(f1);
>  
>  		smp_store_mb(cb.seen, false);
> -		if (!f2 || dma_fence_add_callback(f2, &cb.cb, simple_callback))
> -			miss++, cb.seen = true;
> +		if (!f2 ||
> +		    dma_fence_add_callback(f2, &cb.cb, simple_callback)) {
> +			miss++;
> +			cb.seen = true;
> +		}
>  
>  		if (!t->before)
>  			dma_fence_signal(f1);
> 

