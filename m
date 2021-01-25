Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D469B3048A2
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388394AbhAZFoW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:44:22 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:42317 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726743AbhAYKAT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 05:00:19 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 3yWVlSvJWiWRg3yWYlfjeh; Mon, 25 Jan 2021 10:51:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611568268; bh=wrk8BKpLgBpPNHd1tb+sYL44XtjDBRa45AyPT1wW64s=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Jn3mt0HhgXor55LXLpuNlJKmav0gxvQ4xyNio3n5rNMNS0A9gD4U6fMUYJN5/3pdO
         +PMrDHxGeQ5CeQbqOBbe8TEemMefOAqZHw70lTOwgTsBBDbShlysx/hXRQczPSXPPF
         tDR3OTbNKK+xD0BEM2oMuLRJVOtxs1rsAPAuxp83IBXcs0YF6vQIUEy+BcvT2Vvq9H
         mBh/9r7vEuIxmFZcg+t/YXS3fwXoPhcAOYxgJwbd45gCdujOxQFGKY3tA2u05CgUBm
         sobGY1rHK/YXZEO1nTAck4PMunYSF3yrWUizj99hqIxPgL8frumsb2EMz4WQKu0Y9c
         IJgXvbkNZP75Q==
Subject: Re: [PATCH v2 2/3] media/radio: Make radio_isa_common_remove() return
 void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210122092449.426097-1-uwe@kleine-koenig.org>
 <20210122092449.426097-3-uwe@kleine-koenig.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6b63a9cc-6b67-ff2a-b6f7-01a1e2b043ef@xs4all.nl>
Date:   Mon, 25 Jan 2021 10:51:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122092449.426097-3-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOJCl0dUPu9rmM2SOym+WapbhiLzwdq924BtMGODJV2TcVRfNeBl9XQ/Jzp+EXpFLFlG+OnKdS4LupZR/tmMLca3UWdxIKaltDT4Bqtm+HCLA4ebrCfw
 ivJL/M10g+1FYBaNT5QAW5QnwoQBzLprDRkbt0Gpm2797GXq1plWVAzf2aD7N5NZlcMrivBSphFtCdg61bX5ncFgTSQQe7K4hjkP6nM33iRhgD2gzX4Ez4Qb
 h9VXbXO0uJkQ+DuZ+x0QLedsT8ZhD1Ez2NmWL6m+AwQN7vRZy5KqlpO1Qa2eBm2rgQRcAuNYYKGBEh9oSGpkjqt7BAiK5dBq9EThPIqlmFE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/01/2021 10:24, Uwe Kleine-König wrote:
> Instead of an unconditional return 0, return no value. One of the two
> callers ignored the return value already before.
> 
> This simplifies the next patch.
> 
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  drivers/media/radio/radio-isa.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/radio/radio-isa.c b/drivers/media/radio/radio-isa.c
> index ad2ac16ff12d..527f4c3b0ca4 100644
> --- a/drivers/media/radio/radio-isa.c
> +++ b/drivers/media/radio/radio-isa.c
> @@ -273,8 +273,8 @@ static int radio_isa_common_probe(struct radio_isa_card *isa,
>  	return res;
>  }
>  
> -static int radio_isa_common_remove(struct radio_isa_card *isa,
> -				   unsigned region_size)
> +static void radio_isa_common_remove(struct radio_isa_card *isa,
> +				    unsigned region_size)
>  {
>  	const struct radio_isa_ops *ops = isa->drv->ops;
>  
> @@ -285,7 +285,6 @@ static int radio_isa_common_remove(struct radio_isa_card *isa,
>  	release_region(isa->io, region_size);
>  	v4l2_info(&isa->v4l2_dev, "Removed radio card %s\n", isa->drv->card);
>  	kfree(isa);
> -	return 0;
>  }
>  
>  int radio_isa_probe(struct device *pdev, unsigned int dev)
> @@ -342,7 +341,9 @@ int radio_isa_remove(struct device *pdev, unsigned int dev)
>  {
>  	struct radio_isa_card *isa = dev_get_drvdata(pdev);
>  
> -	return radio_isa_common_remove(isa, isa->drv->region_size);
> +	radio_isa_common_remove(isa, isa->drv->region_size);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(radio_isa_remove);
>  
> 

