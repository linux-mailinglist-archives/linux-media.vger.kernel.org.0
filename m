Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42CBD3097A2
	for <lists+linux-media@lfdr.de>; Sat, 30 Jan 2021 19:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbhA3Sr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jan 2021 13:47:56 -0500
Received: from smtprelay0049.hostedemail.com ([216.40.44.49]:46318 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229620AbhA3Srz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jan 2021 13:47:55 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id EBCFD181D341E;
        Sat, 30 Jan 2021 18:47:12 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3868:4321:5007:7652:10004:10400:10848:11026:11232:11658:11914:12043:12297:12438:12555:12740:12895:12986:13069:13311:13357:13439:13894:14181:14659:14721:21080:21627:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: cork01_33057cb275b3
X-Filterd-Recvd-Size: 1933
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf19.hostedemail.com (Postfix) with ESMTPA;
        Sat, 30 Jan 2021 18:47:11 +0000 (UTC)
Message-ID: <a87b95d11c22d997ebc423bba71cabef15ca0bac.camel@perches.com>
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
From:   Joe Perches <joe@perches.com>
To:     Jiri Kosina <trivial@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Date:   Sat, 30 Jan 2021 10:47:10 -0800
In-Reply-To: <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
         <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
> Use semicolons and braces.

Ping?
 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/dma-buf/st-dma-fence.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
> index e593064341c8..c8a12d7ad71a 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -471,8 +471,11 @@ static int thread_signal_callback(void *arg)
>  			dma_fence_signal(f1);
>  
> 
>  		smp_store_mb(cb.seen, false);
> -		if (!f2 || dma_fence_add_callback(f2, &cb.cb, simple_callback))
> -			miss++, cb.seen = true;
> +		if (!f2 ||
> +		    dma_fence_add_callback(f2, &cb.cb, simple_callback)) {
> +			miss++;
> +			cb.seen = true;
> +		}
>  
> 
>  		if (!t->before)
>  			dma_fence_signal(f1);


