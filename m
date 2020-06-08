Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D331F1A1C
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 15:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729801AbgFHNcA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 09:32:00 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:55515 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729179AbgFHNcA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 09:32:00 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id iHsWjRRwwCKzeiHsajmTai; Mon, 08 Jun 2020 15:31:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591623118; bh=hpssZSUA5d2m6FhPSGizkhqbO91xmOa36DTTnuhiAmM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bW6BOi/nlihoCKb/tDIpF4M/e/Tmp7K+4H8fvihHNiMTwf+jMVc4TrECALgUbXgFj
         IwpsX1ypTd1cs50Nvq+cdbdec/W3S8eEodwLvek2MTgFU98pNinVda/kpgGlaNIpLq
         I7dDf2Z5aYs/wCAfCI6AVICJfwf+Fv/dkcW8mmh2HcOP5z3xak77ehvXqyaC+AW7KF
         lq8eRGEBK63+f7s53mH0tZEYOWIpaudNjXvxZTtFwmPvKp9U9qP4e44H2EkgxtqQKV
         kE6NTl1mHGdPGacT5vItxdDZctemxdU07lLndgdAZufsoh5emECUxabV39xESfOq6t
         5tm+XVGsE8PVg==
Subject: Re: [PATCH] media: platform: sti: hva: Fix runtime PM imbalance on
 error
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
Cc:     Jean-Christophe Trotin <jean-christophe.trotin@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200521100503.13454-1-dinghao.liu@zju.edu.cn>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6d640a38-fc51-6a20-371c-336b246669a3@xs4all.nl>
Date:   Mon, 8 Jun 2020 15:31:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200521100503.13454-1-dinghao.liu@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBUbpNcTLkj0DKFuv5gfPbHkUNH+du+C5pXmuTbe/icR1ZrKUn8YMkf5x7njs9KK0epSq39tQxOuaOKtNmQxC/4TWV4S2a8OIHgdLewCmAbOs3bMPTLi
 dnywhzV0TYe3FAjYyARU2usd1kSaWBEh5rlfhjNgcko2aafaqvqZSzJ7KjW6wRev6v4gjeM8uZijZ9VFoOmrbrbfUVkWEt8RCz/oYmFFjjUUtV8ZLMWtN4sK
 U5ODOFmiv5z0eisPVs1g/l2lfAPHpHG0zoTqnHykx0J26HgTPWGKNHDMTncD/i2OS8sbchO2aN5dChZabbFpZJh/5wgAmnkAzfRsXrXT9gcRYvw9M0Ej1Xkj
 mDUlod49
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/05/2020 12:05, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/media/platform/sti/hva/hva-hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/sti/hva/hva-hw.c b/drivers/media/platform/sti/hva/hva-hw.c
> index 401aaafa1710..8533d3bc6d5c 100644
> --- a/drivers/media/platform/sti/hva/hva-hw.c
> +++ b/drivers/media/platform/sti/hva/hva-hw.c
> @@ -388,7 +388,7 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
>  	ret = pm_runtime_get_sync(dev);
>  	if (ret < 0) {
>  		dev_err(dev, "%s     failed to set PM\n", HVA_PREFIX);
> -		goto err_clk;
> +		goto err_pm;
>  	}
>  
>  	/* check IP hardware version */
> 

err_pm:
        pm_runtime_put(dev);

Shouldn't that be pm_runtime_put_sync()?

I'm not pm expert, but it does look odd.

Regards,

	Hans
