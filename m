Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1CEA3FD541
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 10:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243217AbhIAIUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 04:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243233AbhIAIUl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 04:20:41 -0400
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32371C061575
        for <linux-media@vger.kernel.org>; Wed,  1 Sep 2021 01:19:43 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LLT9mbwvPlQKhLLTAmHxWp; Wed, 01 Sep 2021 10:19:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1630484381; bh=1oA3g4WV8hAam/6kv0LvNABd7SgAakZdIKN0HgyLQxU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QCDJV7u3aXa61qVWFiMoqu9/CyJCBST2bJd/nRzKGzkdVewHJnSzM8w6nSjBcZ7tJ
         hhaZ2qEIRLxXx7iYjDHsdLj/VyniHq4HTqpldyKYa+cMdEeEXF1SeaRTlNKTn1gPM3
         wQmqa3PayN2IoZoJ2qSp3XtXhvvUk8SCnDdFfH1uY0UMbWUPCtGZihqsQQjOe+SMD7
         KQUT61YblFMVbi6MEuTzjNaIeK4MAv9DU44eXCgBsLUqIc318eoCuenlhpuxAD8+RI
         PD/1ixO0d3VhwtR0TaVZxPZfvcl5RzXL5/Js9zc9DpRauSf5rh9Ggvg0AVZlDJYUTQ
         7dSV7Vq6/qrZQ==
Subject: Re: [PATCH] media: rcar_drif: Make use of the helper function
 devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210901055517.7329-1-caihuoqing@baidu.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <fe294624-3ad4-2f4e-7a1f-cd4ac3d6b387@xs4all.nl>
Date:   Wed, 1 Sep 2021 10:19:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901055517.7329-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIDlik5mjhflElGwtSmDwaYXi9gSZLE+y2/z8xRdmWW/RlXvmth2F9ZgcLV3K+7AGiQhzdMXG4GYrto/ntIs1K1VkTxPOKFtmaOI/f4vIMT8Q/5nX8mc
 EP/RcrGIlejq3VT2r4LYkOyFv4NvNI+ww9FnEf9ldC1K7CPUqRGqx6DkjtyviGApWiaQt/+u3k3E0lAqgxOUWUp2YL+aE5svRxG8Wwk3TqgSyshlNVbU5S2S
 0mZ/r9mbn+hs5IngcsRQmdAxT25Q3jSaBtC6pa84dF6Ps5CHib5polpWpAsbnGV7rfICf+BD+7yHfasf1ommz8OfA6bkNnJl0AziyVN3BNCgCa7rmluSDTjb
 59VRWo593RB0R84sSgLu6oETkTFUmwjC7T7J4lspExW2JRF1VoO/thEcQgm4kNr3a2d2WgxhCjEvPx3L1Vm0PeRogALUTVamByKYJa2rf6zqdHdin+S+aGy2
 7Fq5LvXJax3VK4cR
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/09/2021 07:55, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/platform/rcar_drif.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar_drif.c b/drivers/media/platform/rcar_drif.c
> index a505d991548b..f0a1edb57841 100644
> --- a/drivers/media/platform/rcar_drif.c
> +++ b/drivers/media/platform/rcar_drif.c
> @@ -1376,7 +1376,6 @@ static int rcar_drif_probe(struct platform_device *pdev)
>  	struct rcar_drif_sdr *sdr;
>  	struct device_node *np;
>  	struct rcar_drif *ch;
> -	struct resource	*res;
>  	int ret;
>  
>  	/* Reserve memory for enabled channel */
> @@ -1395,8 +1394,7 @@ static int rcar_drif_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Register map */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ch->base = devm_ioremap_resource(&pdev->dev, res);
> +	ch->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ch->base))
>  		return PTR_ERR(ch->base);
>  
> 

Compile error:

drivers/media/platform/rcar_drif.c: In function ‘rcar_drif_probe’:
drivers/media/platform/rcar_drif.c:1401:14: error: ‘res’ undeclared (first use in this function); did you mean ‘ret’?
 1401 |  ch->start = res->start;
      |              ^~~
      |              ret
drivers/media/platform/rcar_drif.c:1401:14: note: each undeclared identifier is reported only once for each function it appears in

Regards,

	Hans
