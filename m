Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A622ECD79
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 11:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbhAGKGv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 05:06:51 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:56763 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725974AbhAGKGv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Jan 2021 05:06:51 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id xSB7klznqbMeAxSBAkTDMc; Thu, 07 Jan 2021 11:06:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610013968; bh=16EDQQrb7BzqYQP3Qhe8RixWHoJERl1tg+cwWJ1aub4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hD/yyhiMDJuTnTdra5BrJvSbIDzNR9aGRXrE6HqKlQjdyqrarsGRE0B1UYu27lFlr
         ULJu6OENk7Zdw1XdkkrYDpA8a9FEpR1kUAjxOAZYUWWAG4+ETgBQ3V0BY+MmYYLoyC
         MtZHNL8GP/0WbigKbb7aVO0URmhMyqmqOnRztVQBcPIyoxS7NLbW3UeGOustu3kxDD
         OeNeSTjhAq3WHSpA3HyShi6Iw5xtma9R6yu2FWzsCwZe5/aSs6Ezna9ZTCchzIvFN9
         wVFbBHqnNIkFYRQPhYA0HWCuHiNi7vG90iJ/Fk4WTJ/s3QbzJx+ad4iW1Cmh2iKE0c
         5P5CDnHxPg/3w==
Subject: Re: [PATCH v2 1/1] media: aspeed: fix clock handling logic
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
References: <20201221223225.14723-1-jae.hyun.yoo@linux.intel.com>
 <20201221223225.14723-2-jae.hyun.yoo@linux.intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6cd30b60-87d9-0c92-4721-fdaa429acf3e@xs4all.nl>
Date:   Thu, 7 Jan 2021 11:06:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221223225.14723-2-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOcMz+xa5kN04kzT6m2GYPfbqzY1WyAMxyJULZ5qXXxiAQiGEy7LMZ8JmRsijCIV9HAwiJZNGVZrra4NtRGrv7eoXTOzYr1cwcbfJdMIeAHKXBEFriFt
 TXpt0s9ijAVw71WtvA7FIIB3zjQN8qZmFbCUIe543Cf1AXw3WovcYw3Jjyqh95QDxlPU65z1jMCaGhlHaMBEVqH5KkbB/OospdK83At3YOLBZRskxgMrS+0V
 PFBksh3P8tlsPecgWYaazfFv/2Rs4xLS3OyrUcgCZ46a1BgTt0uY+wLh0Rvs29g2UV09JM51/d0zkrG1HUbIoe0massnqTk9IwCTOGDL0lhrbs8J7B5GVGbo
 Vj0Wsme2a/p5Izc/he9hKSl6l3eGaSacjM139azJub8EA7NleLLUu2SMK59dxqWv+ian8u+eQFqABF5J9YxWszHcu9Eu318iWoqp46mky5L/HtFlCaY+bE35
 F1lgT9/gXOua3QoqP3ETKoOrbZD7NwqywL8b2GG/BBkHoVQ4XV1YCl80jaolO0+Zl17WDDbKrDM9LyBw
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stephen,

On 21/12/2020 23:32, Jae Hyun Yoo wrote:
> Video engine uses eclk and vclk for its clock sources and its reset
> control is coupled with eclk so the current clock enabling sequence works
> like below.
> 
>  Enable eclk
>  De-assert Video Engine reset
>  10ms delay
>  Enable vclk
> 
> It introduces improper reset on the Video Engine hardware and eventually
> the hardware generates unexpected DMA memory transfers that can corrupt
> memory region in random and sporadic patterns. This issue is observed
> very rarely on some specific AST2500 SoCs but it causes a critical
> kernel panic with making a various shape of signature so it's extremely
> hard to debug. Moreover, the issue is observed even when the video
> engine is not actively used because udevd turns on the video engine
> hardware for a short time to make a query in every boot.
> 
> To fix this issue, this commit changes the clock handling logic to make
> the reset de-assertion triggered after enabling both eclk and vclk. Also,
> it adds clk_unprepare call for a case when probe fails.
> 
> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
> 
> clk: ast2600: fix reset settings for eclk and vclk
> 
> Video engine reset setting should be coupled with eclk to match it
> with the setting for previous Aspeed SoCs which is defined in
> clk-aspeed.c since all Aspeed SoCs are sharing a single video engine
> driver. Also, reset bit 6 is defined as 'Video Engine' reset in
> datasheet so it should be de-asserted when eclk is enabled. This
> commit fixes the setting.
> 
> Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

I think it makes sense to merge this via the media subsystem.

Can you Ack this patch?

Thanks!

	Hans

> ---
> Changes since v1:
> - Squashed two patches due to dependency.
> 
>  drivers/clk/clk-ast2600.c             | 4 ++--
>  drivers/media/platform/aspeed-video.c | 9 ++++++---
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 177368cac6dd..882da16575d4 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -60,10 +60,10 @@ static void __iomem *scu_g6_base;
>  static const struct aspeed_gate_data aspeed_g6_gates[] = {
>  	/*				    clk rst  name		parent	 flags */
>  	[ASPEED_CLK_GATE_MCLK]		= {  0, -1, "mclk-gate",	"mpll",	 CLK_IS_CRITICAL }, /* SDRAM */
> -	[ASPEED_CLK_GATE_ECLK]		= {  1, -1, "eclk-gate",	"eclk",	 0 },	/* Video Engine */
> +	[ASPEED_CLK_GATE_ECLK]		= {  1,  6, "eclk-gate",	"eclk",	 0 },	/* Video Engine */
>  	[ASPEED_CLK_GATE_GCLK]		= {  2,  7, "gclk-gate",	NULL,	 0 },	/* 2D engine */
>  	/* vclk parent - dclk/d1clk/hclk/mclk */
> -	[ASPEED_CLK_GATE_VCLK]		= {  3,  6, "vclk-gate",	NULL,	 0 },	/* Video Capture */
> +	[ASPEED_CLK_GATE_VCLK]		= {  3, -1, "vclk-gate",	NULL,	 0 },	/* Video Capture */
>  	[ASPEED_CLK_GATE_BCLK]		= {  4,  8, "bclk-gate",	"bclk",	 0 }, /* PCIe/PCI */
>  	/* From dpll */
>  	[ASPEED_CLK_GATE_DCLK]		= {  5, -1, "dclk-gate",	NULL,	 CLK_IS_CRITICAL }, /* DAC */
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index c46a79eace98..db072ff2df70 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -514,8 +514,8 @@ static void aspeed_video_off(struct aspeed_video *video)
>  	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
>  
>  	/* Turn off the relevant clocks */
> -	clk_disable(video->vclk);
>  	clk_disable(video->eclk);
> +	clk_disable(video->vclk);
>  
>  	clear_bit(VIDEO_CLOCKS_ON, &video->flags);
>  }
> @@ -526,8 +526,8 @@ static void aspeed_video_on(struct aspeed_video *video)
>  		return;
>  
>  	/* Turn on the relevant clocks */
> -	clk_enable(video->eclk);
>  	clk_enable(video->vclk);
> +	clk_enable(video->eclk);
>  
>  	set_bit(VIDEO_CLOCKS_ON, &video->flags);
>  }
> @@ -1719,8 +1719,11 @@ static int aspeed_video_probe(struct platform_device *pdev)
>  		return rc;
>  
>  	rc = aspeed_video_setup_video(video);
> -	if (rc)
> +	if (rc) {
> +		clk_unprepare(video->vclk);
> +		clk_unprepare(video->eclk);
>  		return rc;
> +	}
>  
>  	return 0;
>  }
> 

