Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 853081C4938
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 23:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbgEDVnr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 17:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726338AbgEDVnr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 17:43:47 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6B9C061A0E;
        Mon,  4 May 2020 14:43:45 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id f15so334805plr.3;
        Mon, 04 May 2020 14:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=bnAoXlE6naZXplH2LBElomP8n2q8fSlbfgAhYHfgt5s=;
        b=Xvklki9IQXKduwRuB61lYr5L7UeuVOeXXXrkX5wDjDsAsfcntdW37APtcUDnKjKhJQ
         WmOMHiPHAqFkCBadXH9VpgorfXKBgRC0zQZmDQwWEf5jjAq+8sw35TJd4O56nuC0k703
         NTgDizKysiTachoo/YlCwUkehsDeXiXfNjF4M7lF3SMYeAXACAwwZDDZQDSolHZ/7d6O
         79oHEf56eWYXRDOiQhteVbDsYiVu/7aMBQ8d1xe0YvOF9JKSUHXk+CT5dtJBcWQwdHPB
         Q+P888yZAB+7VPuN5NfWeILJtWbjJy9OZJSYmM80DQXMbQz1NklywNzhP6xiAxtWL0l/
         5ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bnAoXlE6naZXplH2LBElomP8n2q8fSlbfgAhYHfgt5s=;
        b=ZQoN5MsBqVuf+t8jnY9aiehyD/4zuQoSk35q4qHvyB6SbWkyjIJlo8QYFvfIketMrE
         i6QQCKZaEV9J+i5+z+qXdL4KoPsnKnTnhTQ5UTGyQjcQ6uDGBiYRetCzWu0wLsUD6gRX
         u394P7Fhj8YiwleSngoqNimOAbEPo/jqn2kdj2sVhp8Cl3uR2+46j+dW3hQKmW02XCZF
         kEprea2oQGncfNYJPlcJ3Bw0MXsFQkdomZ9lsNmueDGg5L5/TYfAnGXiG2vw08QHOunY
         yV8tP4jmb5vJkk8LivNvtyXi1U0i1740lBybiwgyuwZ8VOyz6sQCGu2t5xFXZEcwyMEf
         9CRg==
X-Gm-Message-State: AGi0PubI5T+MQOcD14Glf41OXVKw7/HlGjdAl8JMKuTfkyufVoidSUOj
        /5WVQg5w8nPcofBjdkjQrTc=
X-Google-Smtp-Source: APiQypKUaF4qPe5cgKCYcrALmmsDKqYrLA0zZqfhO29Z84bE+BLxFpXhzF6qsCG3ZfRxgDI0iuEyrw==
X-Received: by 2002:a17:90a:2b46:: with SMTP id y6mr207238pjc.154.1588628625309;
        Mon, 04 May 2020 14:43:45 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a142sm52764pfa.6.2020.05.04.14.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 14:43:44 -0700 (PDT)
Subject: Re: [PATCH] nand: brcmnand: correctly verify erased pages
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20200504092943.2739784-1-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <2fea8057-8b84-790e-60ba-b6848a186e18@gmail.com>
Date:   Mon, 4 May 2020 14:43:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504092943.2739784-1-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/4/2020 2:29 AM, Álvaro Fernández Rojas wrote:
> The current code checks that the whole OOB area is erased.
> This is a problem when JFFS2 cleanmarkers are added to the OOB, since it will
> fail due to the usable OOB bytes not being 0xff.
> Correct this by only checking that the ECC aren't 0xff.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Can you provide a Fixes: tag for this change?

> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index e4e3ceeac38f..546f0807b887 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -2018,6 +2018,7 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
>  static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
>  		  struct nand_chip *chip, void *buf, u64 addr)
>  {
> +	struct mtd_oob_region oobecc;
>  	int i, sas;
>  	void *oob = chip->oob_poi;
>  	int bitflips = 0;
> @@ -2035,11 +2036,24 @@ static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
>  	if (ret)
>  		return ret;
>  
> -	for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
> +	for (i = 0; i < chip->ecc.steps; i++) {
>  		ecc_chunk = buf + chip->ecc.size * i;
> -		ret = nand_check_erased_ecc_chunk(ecc_chunk,
> -						  chip->ecc.size,
> -						  oob, sas, NULL, 0,
> +
> +		ret = nand_check_erased_ecc_chunk(ecc_chunk, chip->ecc.size,
> +						  NULL, 0, NULL, 0,
> +						  chip->ecc.strength);
> +		if (ret < 0)
> +			return ret;
> +
> +		bitflips = max(bitflips, ret);
> +	}
> +
> +	for (i = 0; mtd->ooblayout->ecc(mtd, i, &oobecc) != -ERANGE; i++)
> +	{
> +		ret = nand_check_erased_ecc_chunk(NULL, 0,
> +						  oob + oobecc.offset,
> +						  oobecc.length,
> +						  NULL, 0,
>  						  chip->ecc.strength);
>  		if (ret < 0)
>  			return ret;
> 

-- 
Florian
