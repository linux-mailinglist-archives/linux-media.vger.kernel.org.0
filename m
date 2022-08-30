Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 452175A693D
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 19:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiH3RHT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 13:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbiH3RHS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 13:07:18 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEBF1A222C
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 10:07:12 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id gb36so2618011ejc.10
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 10:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=AvdCfYjT/xhsGz3hwU8EJwwAxSoChuuFpkaC5m1h5Ss=;
        b=odLHEHirz8JquS9bzO1JvmBNKQiYSktXvBo/HPSZwI5+9jgfpG8e56+1hCimn8dxuH
         htDjkk9FRHx/ObuClkmPhlgFojB+QxVahURCiNy9DHFS4ABJ3P4tScBZCTvN/ePbZEoz
         ctFkrujcoEkbtQ3lHYKIaXdgXzpU49NZf5kk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=AvdCfYjT/xhsGz3hwU8EJwwAxSoChuuFpkaC5m1h5Ss=;
        b=m8NSpSgfq9fkYVTZWy5UdFVWP3OgOZG69yl7/2WdT8jIreH9Ry6qEvk/315vpZFcMx
         v3SVVhSlAX17L/VxP7uBx5wAByZT1DxwembXzfv7YstpEKYd7QvGC67po/PnDOIb+DD7
         GSs92cqckC8vApkEsYVAon/DRNudZwajC8uAfisVgGM9cJUziRWM3ewhKzmyiHwSaC13
         bspIPUGTojgGmqbFfBHhyxmuVWcmm+7pAO94UtZUVsrNwlKWXPkX1GLFQtikXiKztsYZ
         8Z5tkQTWBEFj5uSXPUpHyr0CcVriPnbu1R/RmVo8RGIiOcK7/1j6hhDfLCGnxgAjh6wi
         7g4g==
X-Gm-Message-State: ACgBeo0f0kOD5i4zsJSHRvtXvP6dx1uzsQYd9moYRb8JcSjpGEgeyces
        Y9/NHCaGtUl9zhbRDaPNX0x0ziiG1SmCeg==
X-Google-Smtp-Source: AA6agR4zRA+K46Z8+ezJunedLRnzhn2M5vq7ZC/3Rxn0St3EV3VeUQYitIGl9xnwjNZD+1uEyIwg9w==
X-Received: by 2002:a17:907:d0f:b0:731:5c2:a9a5 with SMTP id gn15-20020a1709070d0f00b0073105c2a9a5mr16955340ejc.413.1661879231398;
        Tue, 30 Aug 2022 10:07:11 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-49-118.cust.vodafonedsl.it. [188.217.49.118])
        by smtp.gmail.com with ESMTPSA id kv2-20020a17090778c200b0073cd7cc2c81sm6007502ejc.181.2022.08.30.10.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 10:07:10 -0700 (PDT)
Date:   Tue, 30 Aug 2022 19:07:08 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Ming Qian <ming.qian@nxp.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: amphion: release m2m ctx when releasing vpu
 instance
Message-ID: <20220830170708.GA141868@tom-ThinkPad-T14s-Gen-2i>
References: <20220829053316.19400-1-ming.qian@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829053316.19400-1-ming.qian@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ming,
Nice, from my point off view you move v4l2_m2m_ctx_release
into the right position (release function).

checkpatch.pl also looks good.
total: 0 errors, 0 warnings, 772 lines checked

Looks good to me.

Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>

Regards,
Tommaso

On Mon, Aug 29, 2022 at 01:33:16PM +0800, Ming Qian wrote:
> release m2m ctx in the callback function that
> release the vpu instance, then there is no need
> to add lock around releasing m2m ctx.
> 
> Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> ---
>  drivers/media/platform/amphion/vpu_v4l2.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
> index 1f18289aa47a..99ad2f1c5a53 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -688,6 +688,10 @@ static int vpu_v4l2_release(struct vpu_inst *inst)
>  		inst->workqueue = NULL;
>  	}
>  
> +	if (inst->fh.m2m_ctx) {
> +		v4l2_m2m_ctx_release(inst->fh.m2m_ctx);
> +		inst->fh.m2m_ctx = NULL;
> +	}
>  	v4l2_ctrl_handler_free(&inst->ctrl_handler);
>  	mutex_destroy(&inst->lock);
>  	v4l2_fh_del(&inst->fh);
> @@ -770,13 +774,6 @@ int vpu_v4l2_close(struct file *file)
>  
>  	vpu_trace(vpu->dev, "tgid = %d, pid = %d, inst = %p\n", inst->tgid, inst->pid, inst);
>  
> -	vpu_inst_lock(inst);
> -	if (inst->fh.m2m_ctx) {
> -		v4l2_m2m_ctx_release(inst->fh.m2m_ctx);
> -		inst->fh.m2m_ctx = NULL;
> -	}
> -	vpu_inst_unlock(inst);
> -
>  	call_void_vop(inst, release);
>  	vpu_inst_unregister(inst);
>  	vpu_inst_put(inst);
> -- 
> 2.37.1
> 

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
