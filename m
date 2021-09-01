Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFF43FD544
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 10:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243047AbhIAIV3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 04:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243005AbhIAIV3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 04:21:29 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4094C061575
        for <linux-media@vger.kernel.org>; Wed,  1 Sep 2021 01:20:32 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LLTumbxEylQKhLLTvmHxed; Wed, 01 Sep 2021 10:20:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630484430; bh=GfCHqSZv2nZlr8KsNnFiMZi9+oWhMPoyCqpwjG+OdiE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cevdEFABsVf5kVrWj4kTmLhuAArUTVho1wy+fLzKmWs63SXLDvGQwrAyVtVDNHE08
         NbJxU7ydFxjX8MfoNyolX2QvEMOXIkWasr+PeFdtnmcGAE48blnE8HVoiuZS8xNLos
         Socp/WsGnBRArsGpcXUwwqpk/391O4MT3IXrIdaE6itCG3i9UABvInj5a+i+3n6eTS
         uivaZKfWMipq3NoYlxpAjWFsYBSNSda0OJ6QvIFB0W7c9JZMgUqbP8sxczsaCrqADy
         1482EOrWQYiuiIX3QJ7nAlvO+Zenvb3DIGq3QdJ7BVwGPklDUvE9cEYFDGg8x3ZAMZ
         YaIWuBiFE37lA==
Subject: Re: [PATCH] media: sti/c8sectpfe: Make use of the helper function
 devm_platform_ioremap_resource_byname()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210901055631.7829-1-caihuoqing@baidu.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <91245ea5-215f-5e60-0a97-7c29ceb7c3a9@xs4all.nl>
Date:   Wed, 1 Sep 2021 10:20:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901055631.7829-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJRoayrIqmcHfdDz2ck/bNwHScVxGGQWvquTGIyrIs576AcabdctUNUbGEj+i494562eYjGHj0UVa70tJWJuO4uud54+g/wh83pgODOiGDexGiuBjZtO
 nMkD4naXo1NJR9paGA7PLOzwL+EwM0v0onjBBBs4Idu0huK9cyQT2OE5TzFADN11hscON0n2uglKXcknJWvzGeQ+7LPT171ViNY9XFR0TgFqoZ59AEfHYr/z
 dPn1Bnfks5usPN4SVihU2fH6JH2lFsNHL6n5lWWZwwNYJL/OuT8owx2rpzr8A1Q9Q13z0nvmYOsGCU2q3Tkhn4L1DTqMz/CLLCLHA0GcC+szcwSSw4NwvL+3
 u88IE8f99yhumFwJXnQ4N+zwkBxgBkyHj0KpEm7g6Edd53zgXZOKzNmHndDYnm1jM6Sk8gyqEEhrIdqEsiJ7qgqZL7ErY2Api+QjQmz6yOfEPGyijIQZlwAj
 1Rdqg+R7kn3AVMoR
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/09/2021 07:56, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> index 02dc78bd7fab..9f05984f711a 100644
> --- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> +++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> @@ -665,7 +665,6 @@ static int c8sectpfe_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *child, *np = dev->of_node;
>  	struct c8sectpfei *fei;
> -	struct resource *res;
>  	int ret, index = 0;
>  	struct channel_info *tsin;
>  
> @@ -676,14 +675,11 @@ static int c8sectpfe_probe(struct platform_device *pdev)
>  
>  	fei->dev = dev;
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "c8sectpfe");
> -	fei->io = devm_ioremap_resource(dev, res);
> +	fei->io = devm_platform_ioremap_resource_byname(pdev, "c8sectpfe");
>  	if (IS_ERR(fei->io))
>  		return PTR_ERR(fei->io);
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -					"c8sectpfe-ram");
> -	fei->sram = devm_ioremap_resource(dev, res);
> +	fei->sram = devm_platform_ioremap_resource_byname(pdev, "c8sectpfe-ram");
>  	if (IS_ERR(fei->sram))
>  		return PTR_ERR(fei->sram);
>  
> 

Compile error:

drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: In function ‘c8sectpfe_probe’:
drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:686:33: error: ‘res’ undeclared (first use in this function); did you mean ‘ret’?
  686 |  fei->sram_size = resource_size(res);
      |                                 ^~~
      |                                 ret
drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:686:33: note: each undeclared identifier is reported only once for each function it appears in

Regards,

	Hans
