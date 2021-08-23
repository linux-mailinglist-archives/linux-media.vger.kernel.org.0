Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708FA3F4668
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 10:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbhHWIKA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 04:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235283AbhHWIJz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 04:09:55 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072FBC061575;
        Mon, 23 Aug 2021 01:09:13 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id w68so14652385pfd.0;
        Mon, 23 Aug 2021 01:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w4BKx4lb7KmQZA85sKpEbdTzNjkorEefzZzY1FyEeO4=;
        b=BdGh7T+q5hSXKMlVprVx2rILWkvtYa67421TokaBqUQfCxLXgPktfu904jCnDTcXtn
         VrZRkgY8QdvYNMIQ0qDddPG8aKCATiGKerreUeeEqXQfAerlxNq8BQjLwVo/yRko/uRq
         2hBl7yf/5H1ovMqEGM6HRNAfzSoL2KDe5Ib/JhMazOEtrviCxvDVUOdNpTxJnDgIM9m7
         KfVda6YWuQID0ge/OmbGbXa+sq2qUH+a+jXakNE8bFzyGtw8P99hRUmEhi8sn7+mp1Mf
         x8Gry8oNgSXgceHWe5U5CCyWlE9F3w7cJlMvssZqebMX8AZDIVIqn33sSikdvTEhX9TD
         pmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w4BKx4lb7KmQZA85sKpEbdTzNjkorEefzZzY1FyEeO4=;
        b=K7sbpH+N0POxJArdPhAZQkIQj/P6nFklSkZh29ve3YiZnpbGvQ/UTHK5ffyyyAl+Nz
         gSRXpy+gwroJdu50pgI1IFihcRgE+GL2PKEkJOf/4RCQSar9SePAAuNNRKzztBiEzHwI
         lbf3S3deXzwbHowTDyNBZtb8uD4/urFTas0vxSCzu69gCS2E15Qx6b+OIWJPgcoY1bTT
         pdBw0LO0vxrDJiivkG1aWI4IPU1/1/k5F2YxJqNpe1wXUxGGIBZF8BR/1oU2GLyOz72d
         bkHAHkZqfQMVWtCwDe4IYYNnAylS8gaY5B+2FjbYmehdpICT3LEnXyq0w0CFVE5Pnd52
         f4LA==
X-Gm-Message-State: AOAM531SzW82K+EDpzxQtgqj3aiovQjAxD78qAINJmL31px2AbhP/lLT
        IQ3E2tJwuM7ZC3aRjuhpGvIat14aKNg=
X-Google-Smtp-Source: ABdhPJwPAIet1ix3vaoJYqo99unSUG9QDGLWncvOyqRaW2B+0yQCYtsba51pXxr7Or7t8GRWeXpEZw==
X-Received: by 2002:a63:6983:: with SMTP id e125mr30894685pgc.389.1629706152631;
        Mon, 23 Aug 2021 01:09:12 -0700 (PDT)
Received: from [192.168.3.7] (softbank219203027033.bbtec.net. [219.203.27.33])
        by smtp.gmail.com with ESMTPSA id x19sm15438507pfo.40.2021.08.23.01.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 01:09:12 -0700 (PDT)
Subject: Re: [PATCH] media: switch from 'pci_' to 'dma_' API
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <71a7e0029ce28ec748eb045c8381d354011cebe6.1629623093.git.christophe.jaillet@wanadoo.fr>
From:   Akihiro TSUKADA <tskd08@gmail.com>
Message-ID: <25694cb6-ef03-7ef4-f096-257bcb560bbb@gmail.com>
Date:   Mon, 23 Aug 2021 17:09:08 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <71a7e0029ce28ec748eb045c8381d354011cebe6.1629623093.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=iso-2022-jp
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>  drivers/media/pci/pt1/pt1.c                   |  2 +-

> diff --git a/drivers/media/pci/pt1/pt1.c b/drivers/media/pci/pt1/pt1.c
> index f2aa36814fba..121a4a92ea10 100644
> --- a/drivers/media/pci/pt1/pt1.c
> +++ b/drivers/media/pci/pt1/pt1.c
> @@ -1340,7 +1340,7 @@ static int pt1_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (ret < 0)
>  		goto err;
>  
> -	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
> +	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
>  	if (ret < 0)
>  		goto err_pci_disable_device;
>  

Acked-by: Akihiro Tsukada <tskd08@gmail.com>
Tested-by: Akihiro Tsukada <tskd08@gmail.com>

--
tsukada
