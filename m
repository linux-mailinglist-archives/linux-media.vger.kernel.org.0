Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4BA8E3A7B
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 19:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436672AbfJXR6F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 13:58:05 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43032 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388218AbfJXR6F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 13:58:05 -0400
Received: by mail-wr1-f68.google.com with SMTP id c2so21857197wrr.10
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 10:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YKIV362Orj8jE2IzMEtRewTq0DhnqNh3px2XRL0BNMg=;
        b=Htp8sgUJH3DAYYRRWJMO4R7kNJJue799y6fDsBVcHjNs7sl6XffCTJkvy7iAhMGCdi
         MV4w7X9dHkXzCLtg6buUByry4G1D6/zDr8sQAFhlwDcRefe9yD7Um35BjKCc7eynfi1u
         FkPDdow+/hISUd6LMw3t6mA+xqcsXRd2I1P6kSB4aCvZzjyGhlx02bHlgRT1fWopVvzo
         ii53B/QjWvgHObSBrLGZc775N1YH7si4LbQY7xiOqglUVunDqVMf4v4G6vXAZxXe2aZY
         ckb63XC1M9IbvwuHyjZXEVYnjrQWLL9TFdRUOeArbbzIxpXOGzQ+82pTzAJsQh/f/k/3
         Us2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YKIV362Orj8jE2IzMEtRewTq0DhnqNh3px2XRL0BNMg=;
        b=PpYWBHrNW0TzzvU9z4T+7e5sv8RpGOaXg3JAq55SpGQchKMM1+5uKUcAWOyxDNaGo0
         sa2zvC1PaBLN+neAZIxPynI+LLkosjRSBRUUUSkJOUvUNWZzi2iX0Vowz1k0KLATelAn
         CY2mzkfjqeBNO8wXfQBEQsoQWJMr8tkHhjSG3Ej1iQWdCgAq60mkDyrasfSIOl3JSi6Q
         4+oyKRUYbMQK4mVRHViIqp4m3T0CTWy3OzSerAq4UC1K2MGdFe0uaAzdAz/wdZJrxChZ
         dBenK2aVKzuNrUtDQYjfVqQ4+COAisp6Bqwih8P8k5qorb3k5rtZKpB09jJbdOjgJsAW
         bjmA==
X-Gm-Message-State: APjAAAVqGEM4Xn9SpBhG0XRdTkX0N3MN5TTH4bHGtTDLK/4sZTnUz/4w
        DF+NSYvkztEAWWKMBI282k8=
X-Google-Smtp-Source: APXvYqzoze1FnFeU/KsREv9hoafGXiag7YpN1imQ9ITUQbYN+o4S9qvXpvoTbS/FhxO4RbbN0Wv2qg==
X-Received: by 2002:adf:e30a:: with SMTP id b10mr4761868wrj.44.1571939883310;
        Thu, 24 Oct 2019 10:58:03 -0700 (PDT)
Received: from [172.30.89.101] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id p1sm3875444wmg.11.2019.10.24.10.58.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 10:58:02 -0700 (PDT)
Subject: Re: [PATCH 6/7] media: imx: imx7-media-csi: Remove unneeded register
 read
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20191024004155.32068-1-laurent.pinchart@ideasonboard.com>
 <20191024004155.32068-7-laurent.pinchart@ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <3363ebfc-c78a-5441-2621-4f57b861e059@gmail.com>
Date:   Thu, 24 Oct 2019 10:57:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024004155.32068-7-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

This patch also looks like it needs a Fixes tag.

Steve


On 10/23/19 5:41 PM, Laurent Pinchart wrote:
> The imx7_csi_dma_reflash() function starts by reading the unrelated
> register CSI_CSICR18 to then overwrite the read value with a read from
> register CSI_CSICR3. This is likely due to a bad copy&paste, and is not
> needed. Remove the extraneous read from register CSI_CSICR18.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/staging/media/imx/imx7-media-csi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index e4c9bcc045f7..ac07f55a63e3 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -292,7 +292,7 @@ static void imx7_csi_hw_disable(struct imx7_csi *csi)
>   
>   static void imx7_csi_dma_reflash(struct imx7_csi *csi)
>   {
> -	u32 cr3 = imx7_csi_reg_read(csi, CSI_CSICR18);
> +	u32 cr3;
>   
>   	cr3 = imx7_csi_reg_read(csi, CSI_CSICR3);
>   	cr3 |= BIT_DMA_REFLASH_RFF;

