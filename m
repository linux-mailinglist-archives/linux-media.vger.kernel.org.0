Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC665379E0
	for <lists+linux-media@lfdr.de>; Mon, 30 May 2022 13:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbiE3L23 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 May 2022 07:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235819AbiE3L20 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 May 2022 07:28:26 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB9850E20
        for <linux-media@vger.kernel.org>; Mon, 30 May 2022 04:28:04 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id q21so20271758ejm.1
        for <linux-media@vger.kernel.org>; Mon, 30 May 2022 04:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tAj71uhfpd7zy3DcY1wrWpNC2HSiY+lz9KoYoOBAv+g=;
        b=MAul1gaNGk3a5noHPlwKMT4U8N4QwNwOCCMG11QXRNZUuagQK60TVoSFAZ3gH3YGD/
         0e2xLVoicFMNpUt9IeL9Ro7lBLsEoSvb1uiX/sjCaElFGmaiXOAuyKRKdn3wv/zUOjOT
         e/8xWo9A8MVK/X6819bIx9HLUpfs/YzFqNgxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tAj71uhfpd7zy3DcY1wrWpNC2HSiY+lz9KoYoOBAv+g=;
        b=jsthK2uzhBRa4fz/IAdy2Kr9Ljw56Wcrwkmh7zry+nJtN2+79IkgnL61h5upyafAYQ
         UQ+/I3uvWmenV592VBgLKU+3wMRHxtcLuSluc0RmSke++uKLfX5XFNWr0J8b/JrdSb5q
         zxNVpEAsjnva9e6wAOZxoopWVf5o3vjYe7WqjeQ2s0i2TMmphYrIKwlOizfoddc4UDoj
         F2J54lES2sZW6i4qaG/G2rA/1AtNbIBjukvGjwXh9pH+HY8GwYCQ6V3B/62BhS/Wuqbw
         lGX/RrrobrszBfPQyzBY41ca6WbYHWa+1zGssTF137ZncI8PdqYECO8/2euMUDh2/+C8
         dGbQ==
X-Gm-Message-State: AOAM531Avu6rlQRO22ggTgfkWadFO/REnS+FAlB0zH6En3HgZ89MuVb2
        Jsg/IISCeAQc8nxdN5PDMhwXhfLEDaoDGQ==
X-Google-Smtp-Source: ABdhPJySR3Qh0UAwwf+pSKv/+yvslrXpUVHM3TvCzEy8domQUYmGU1UJ53eOkvuWwZq3vxTFjpq3KA==
X-Received: by 2002:a17:906:6a02:b0:6ff:1dfb:1e2a with SMTP id qw2-20020a1709066a0200b006ff1dfb1e2amr18649571ejc.477.1653910082573;
        Mon, 30 May 2022 04:28:02 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-2-39-143-183.cust.vodafonedsl.it. [2.39.143.183])
        by smtp.gmail.com with ESMTPSA id e23-20020a1709062c1700b006f3ef214dd2sm3905507ejh.56.2022.05.30.04.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 04:28:02 -0700 (PDT)
Date:   Mon, 30 May 2022 13:27:59 +0200
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Ming Qian <ming.qian@nxp.com>, Shijie Qin <shijie.qin@nxp.com>,
        Zhou Peng <eagle.zhou@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] media: amphion: Replace zero-length array with
 flexible-array member
Message-ID: <20220530112759.GC99280@tom-ThinkPad-T14s-Gen-2i>
References: <20220527212953.797574-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220527212953.797574-1-keescook@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 27, 2022 at 02:29:53PM -0700, Kees Cook wrote:
> There is a regular need in the kernel to provide a way to declare
> having a dynamically sized set of trailing elements in a structure.
> Kernel code should always use “flexible array members”[1] for these
> cases. The older style of one-element or zero-length arrays should no
> longer be used[2][3].
> 
> [1] https://en.wikipedia.org/wiki/Flexible_array_member
> [2] https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays
> [3] https://github.com/KSPP/linux/issues/78
> 
> Fixes: 9f599f351e86 ("media: amphion: add vpu core driver")
> Cc: Ming Qian <ming.qian@nxp.com>
> Cc: Shijie Qin <shijie.qin@nxp.com>
> Cc: Zhou Peng <eagle.zhou@nxp.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/media/platform/amphion/vpu_dbg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
> index da62bd718fb8..f72c8a506b22 100644
> --- a/drivers/media/platform/amphion/vpu_dbg.c
> +++ b/drivers/media/platform/amphion/vpu_dbg.c
> @@ -27,7 +27,7 @@ struct print_buf_desc {
>  	u32 bytes;
>  	u32 read;
>  	u32 write;
> -	char buffer[0];
> +	char buffer[];
>  };
>  
>  static char *vb2_stat_name[] = {
> -- 
> 2.32.0
> 

Hi,
Looks good to me, thanks.

Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>

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
