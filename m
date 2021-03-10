Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E672B334501
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 18:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbhCJRU1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 12:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233342AbhCJRUB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 12:20:01 -0500
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E459C061760
        for <linux-media@vger.kernel.org>; Wed, 10 Mar 2021 09:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=pfezQPr2Z3+Jnt76E5tGzgXbIfU7Vr+gGQTFCD/YsW0=; b=MB2QmfUUS5EGJZSQqiIig+vCOl
        I2DYugcVGUhEnuZEcCcJUphVuGyMkJ73YDDNvQh33swqbwySF3ZTfJaUGyMtTxhZ/moxZZVaZQUvc
        yX3C0kWFul3KhxzB1hDVL9S9hSUX/zl4ywu5iy+hpHeG96BN8cQfFa4JubVaMNPukhoQ0IR9mb0hF
        Yfam88U7o47gQkygUbMP8XP03GJYtqg6eMwm3sQrkkTQNSurI0KjsnvE2IVOSVwdQcfaD+u7oiXIl
        UW6u4HmNm/ScPju4bXgC7Dynnc8sByAB5TOGSVH8s/TwEuvXnPPujK/TrTOm1VInD5nw7Ub2LizD3
        7SIm8aEQ==;
Received: from merlin.infradead.org ([2001:8b0:10b:1234::107])
        by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
        id 1lK2V5-007KHs-Ko
        for linux-media@vger.kernel.org; Wed, 10 Mar 2021 17:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=pfezQPr2Z3+Jnt76E5tGzgXbIfU7Vr+gGQTFCD/YsW0=; b=XArOQJ9GfH1lHI3+JYcnGQ3uyh
        kv3wydZnU9j2ppAoBdZNvGLWk9QHNTUmWrhFKFFg7yHXk4xXq2OG7D/2b0Sj9w4K23ekaydBMdaSn
        ZOu4WJ8D8HcSdlbUdHmHN1mSEmYlyNu7BHwt9BC671sIgY5NfQyUYTbmFzXN6weC2lO+dQj5u2sto
        jmgri2xPrCiM3PTh65FMEc5VbNdjSPMSqOdnWa6WkZVL8HZHJAbtkaiI9oJr5tj/TkLBW1z8r+xu3
        aV5d3sAGi7ihNPmDtRk9p1CGTEZj7J+zy7LsAQiEDZIPk7Uxg6CE+7HVf6p+TZYOnz2Dmv/nCySs4
        Ir1yRm0w==;
Received: from [2601:1c0:6280:3f0::3ba4]
        by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lK2Uv-000pXP-GU; Wed, 10 Mar 2021 17:19:49 +0000
Subject: Re: [PATCH] Correct 'so'
To:     Xiaofeng Cao <cxfcosmos@gmail.com>, mchehab@kernel.org,
        patrice.chotard@st.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210310145816.32271-1-cxfcosmos@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bcc2c2c9-5ad7-ba04-fe81-ca1728e81dc2@infradead.org>
Date:   Wed, 10 Mar 2021 09:19:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310145816.32271-1-cxfcosmos@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/10/21 6:58 AM, Xiaofeng Cao wrote:
> In Kconfig it should be 'to'
> In c8sectpfe-core.c it should be 'do'
> 
> Signed-off-by: Xiaofeng Cao <cxfcosmos@gmail.com>

The Subject: could use some work, but the patch contents look good.
Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/media/Kconfig                                 | 2 +-
>  drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> index 6222b3ae220b..b07812657cee 100644
> --- a/drivers/media/Kconfig
> +++ b/drivers/media/Kconfig
> @@ -134,7 +134,7 @@ config MEDIA_PLATFORM_SUPPORT
>  	  This is found on Embedded hardware (SoC), on V4L2 codecs and
>  	  on some GPU and newer CPU chipsets.
>  
> -	  Say Y when you want to be able so see such devices.
> +	  Say Y when you want to be able to see such devices.
>  
>  config MEDIA_TEST_SUPPORT
>  	bool
> diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> index a7a6ea666740..338b205ae3a7 100644
> --- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> +++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> @@ -655,7 +655,7 @@ static irqreturn_t c8sectpfe_error_irq_handler(int irq, void *priv)
>  
>  	/*
>  	 * TODO FIXME we should detect some error conditions here
> -	 * and ideally so something about them!
> +	 * and ideally do something about them!
>  	 */
>  
>  	return IRQ_HANDLED;
> 


-- 
~Randy

