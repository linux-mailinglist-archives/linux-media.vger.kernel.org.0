Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3055AD1BB
	for <lists+linux-media@lfdr.de>; Mon,  5 Sep 2022 13:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238221AbiIELoB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Sep 2022 07:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238216AbiIELoA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Sep 2022 07:44:00 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E0F5788A;
        Mon,  5 Sep 2022 04:43:59 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id fy31so16531115ejc.6;
        Mon, 05 Sep 2022 04:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FuWCEQrkq67hH5XIbvmOYYp78soeMvCFJK03dgG0hnU=;
        b=MUFymhzxKYlVlOPNYX8dVu6Mtzpf23C+FsQK5w6ZTavZerG6wjjtpWMrWr5ZK4DAje
         ozsMSl30+9NId+ecbgjNyYyglP6JoUVi28GIVE4APZ6Z2aaLKIAsLkIRLtmvNNZh34ZW
         S3RFhmNZja38AjKT5u5ymolzw2NP8XS04pUtt/LdzkAZsjUHQ/kC60yBJ8Zu7HEBAZLh
         NZX7OYylAlK3a9fnFO8WuoSslFDCXpJb3HsEfQv9FqdfMouhOBK9KqxQN9o+CBce3hWm
         vSJEk3VFzs8z7HdWi7Udvfo5+Ex4KIgLTZQk0K23Z4rSizF/FFCUZQeXXE36o+tlmRbf
         V4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FuWCEQrkq67hH5XIbvmOYYp78soeMvCFJK03dgG0hnU=;
        b=02LvQDOy99PrA0L3psOC2uCh2TEiPowQl+EuHxgVsQxfngcUTmju255JOJmzC+hBAb
         FzQ01kG+TWyavuGaRAQk2N9DwaApbHTiOgHcbwX2VOzfk+XswitH0iOndd5HreGlOjUJ
         GINWQvVoHKT9l4tixGYU4O1km+rR7GjbPZce4itTWcBSgfRla4mKN7wGrP2+J11p5xJG
         rr01ntOJIFtV8bWFpNroAYis+Ac3hxqB1QjKUzQkQNCJbu6aHyIA+oYZM5rPh6pBRFPh
         jSIlNxiGzbu8Znp5iCu5QYo/jLqSYwBQUJaSNc6mCYJjtmqAfA0wNt1ciy2PuPCoBbfM
         Ielg==
X-Gm-Message-State: ACgBeo1H8p8wKuj3uKxTE3/mwsUWIV6MUWl40mxfYqcmtu8xj3+yxx2Z
        SSJYvdOwKLtUX9nG6MdQPXE=
X-Google-Smtp-Source: AA6agR4crvawfs6ErjZK3rzI+30+3kCDqoQqsAtSzu6Pnnl1xPCDOdlrdZA4EktV07KkEa8Ur/Rj+g==
X-Received: by 2002:a17:907:2cea:b0:741:6251:3a22 with SMTP id hz10-20020a1709072cea00b0074162513a22mr26754245ejc.6.1662378237788;
        Mon, 05 Sep 2022 04:43:57 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id kv12-20020a17090778cc00b0073dd0b0ba67sm4856017ejc.200.2022.09.05.04.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 04:43:56 -0700 (PDT)
Message-ID: <7b0ce06b-1e56-0db6-c07b-dd2946af6741@gmail.com>
Date:   Mon, 5 Sep 2022 13:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] media: platform: mtk-mdp3: fix error code in
 mdp_vpu_dev_init()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Moudy Ho <moudy.ho@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
References: <YxDGFMwyeNXFPaig@kili>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <YxDGFMwyeNXFPaig@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 01/09/2022 16:47, Dan Carpenter wrote:
> Return a negative error code if mdp_vpu_shared_mem_alloc() fails.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> index 9f5844385c8f..a72bed927bb6 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> @@ -173,7 +173,8 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
>   	/* vpu work_size was set in mdp_vpu_ipi_handle_init_ack */
>   
>   	mem_size = vpu_alloc_size;
> -	if (mdp_vpu_shared_mem_alloc(vpu)) {
> +	err = mdp_vpu_shared_mem_alloc(vpu);
> +	if (err) {
>   		dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
>   		goto err_mem_alloc;
>   	}
