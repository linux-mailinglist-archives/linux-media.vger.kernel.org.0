Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 814087B6871
	for <lists+linux-media@lfdr.de>; Tue,  3 Oct 2023 14:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbjJCMCq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Oct 2023 08:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbjJCMCq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Oct 2023 08:02:46 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17107A6;
        Tue,  3 Oct 2023 05:02:43 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7b102a6565eso373559241.0;
        Tue, 03 Oct 2023 05:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696334562; x=1696939362; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hd+Lx4aRlWvSHrfg7WOKO3naulywUKZrNYQIafJkcZY=;
        b=m+tMGUEOfwmNmcWblSlFltQIpFaYhW6XJPQd7UC7+DPhBeyxzBKxfC/Ork2jZ3iBqN
         lHZgS0dee0j9Igr4JDvfZLvhiHfQr9yWTmjXVEqCcAxEYBT7d9mE8D5lMk3PwhGskpQ7
         xbSqFplO7ntZHwb0b9LMgX3S5O/8FZOa+gHbs1+BMavt1tUm+dVXuOSxJU6aMeqGrNyP
         zRuJX8EYJFrb3MyAmDwMfgvaIHsI0lwkgZxCFpUuf00CBNbU2cUtPMYv9Y65EtcXPc0D
         IxiumomoQOvgqTYFgFJ9Hn/nWyLH6TFoF73hPjq2J8k4focmxuY+7YLG2HeyAasghWCE
         LImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696334562; x=1696939362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hd+Lx4aRlWvSHrfg7WOKO3naulywUKZrNYQIafJkcZY=;
        b=bxAyOvlZXocLFhtYZmp9prR4qDRbvrI66Yi0cra7VNGAB+8NINuzUl0uvuqzTAs8fh
         8EC0+IwXXYuZtCHNe3hLhVBjjhF7Q6qStgoIA7vDRtS1qAt6ih9nwPLc2mFoJjOllWeG
         ZTBrLSDALpdD+1xjhgLW2Sgl/rMjdQttxVqIN2p9QsYO0i6uCKJfkgGPn+Ghj3+EjV6l
         MAYronqSiL3qt+Zay6n0FQwq6MLK4TKYSNFiMf+SaWDNIQG03FwdfgxHy6oU5adLCdBb
         3OKrURg3RWmvWjV7shrTjEJ3syYWADL17crLTSugWW4kRMpzmHcEJ1tZBZD7/fKYAHU0
         CqDQ==
X-Gm-Message-State: AOJu0Yx36TxOgqLtESlwXMRYBvcYIclHgcBpiEILnas7OCuS7FCgX4Xi
        dgqJfyVXfuZFsQrl3FmIGedoxJ6b0aT0WpxSmBpB/P2E+jc=
X-Google-Smtp-Source: AGHT+IGOT9AKk8fOpDGE1BJjc5REY867ya8oL5vBldAPtRvtWYbriuyP4mFkPCks4+SF+1iN1hdnmk3qgxyz6muVB34=
X-Received: by 2002:a1f:d8c4:0:b0:490:e790:a15b with SMTP id
 p187-20020a1fd8c4000000b00490e790a15bmr11034494vkg.10.1696334561880; Tue, 03
 Oct 2023 05:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <3134a802-75fe-49f3-bcd6-06addc2ffaf5@moroto.mountain>
In-Reply-To: <3134a802-75fe-49f3-bcd6-06addc2ffaf5@moroto.mountain>
From:   Kun-Fa Lin <milkfafa@gmail.com>
Date:   Tue, 3 Oct 2023 20:02:33 +0800
Message-ID: <CADnNmFrOeGxUL1U9eJngKpMpoVVZXN4Owxxo9Ee18tEYxZ6FhQ@mail.gmail.com>
Subject: Re: [PATCH] media: nuvoton: npcm-video: Fix IS_ERR() vs NULL bug
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thanks for the patch.

> The of_parse_phandle() function returns NULL on error.  It never returns
> error pointers.  Update the check accordingly.

Commit message contains some redundant whitespaces.

>
> Fixes: 70721089985c ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/media/platform/nuvoton/npcm-video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
> index ac8d73b794d3..b9e6782f59b4 100644
> --- a/drivers/media/platform/nuvoton/npcm-video.c
> +++ b/drivers/media/platform/nuvoton/npcm-video.c
> @@ -1660,9 +1660,9 @@ static int npcm_video_ece_init(struct npcm_video *video)
>         void __iomem *regs;
>
>         ece_node = of_parse_phandle(video->dev->of_node, "nuvoton,ece", 0);
> -       if (IS_ERR(ece_node)) {
> +       if (!ece_node) {
>                 dev_err(dev, "Failed to get ECE phandle in DTS\n");
> -               return PTR_ERR(ece_node);
> +               return -ENODEV;
>         }
>
>         video->ece.enable = of_device_is_available(ece_node);

Others,
Reviewed-by: Marvin Lin <milkfafa@gmail.com>

Regards,
Marvin
