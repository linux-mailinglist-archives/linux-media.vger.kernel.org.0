Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBEB44DE3A6
	for <lists+linux-media@lfdr.de>; Fri, 18 Mar 2022 22:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241192AbiCRVp4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Mar 2022 17:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240149AbiCRVpz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Mar 2022 17:45:55 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84B830A884
        for <linux-media@vger.kernel.org>; Fri, 18 Mar 2022 14:44:35 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id a1so11979906wrh.10
        for <linux-media@vger.kernel.org>; Fri, 18 Mar 2022 14:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dKFZHXhq5PDE6KlWlNRXum2aRz6p6t4t3h8m0N9KFFY=;
        b=HmCYE8GC5Yt4UL20qU48XI4tRjp3Wkg4i+dr/vwBv+ysSq6N01zbkGqTDGlNmJ+H/x
         d+BvM0WQpXhUUIOIaHDTdJEP5HvctDzUMXkWw2gd7Quk4Ib+tHfeMejZu6P7hxi8/ax7
         JF12qmxWBlRXAWaOP83xxwW2rozFXgYoCgNyW/sg9XHum3CQjMw5Fb21t8J7UBqXpOY4
         IMHyFVc2yg6+NMweBhYEVbUliSrKx0JE0pjCplaPhiHZpFfKBIHLsytiPgjRfxzuNA7G
         1sxPpOiJWRYe9MBqmW71zDTeA2A/B+mmLsrX3A/8aYBIlm/ieD344hkPcaGrgjh3YLkC
         Z80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dKFZHXhq5PDE6KlWlNRXum2aRz6p6t4t3h8m0N9KFFY=;
        b=IuslIVVTyo8rxL3Fka1Xy9H43ep6zqidKfCOt1tpcBW1anlP3ey3HTrFcjm0M8BTQi
         JKHEU2NnXDJAGqXpRAridoP7FjM+Mwe/nHHPK+nC6K1LhLq+WIdg26BJ83O/s/G/hvoN
         lEDJEZJk+1vNNQGspCyiIYU5e90ECvbqRCW342dtnX2c+dfRw4s7g00WAnX9j4GTcHyu
         ommj/SWQSQRvKquveWvQ0p57+vgWPCTHVwku1mRUEi12cmRNnTNsOzix8CKUeg0ZW2kc
         RU9DbpSH8YmdDhwwC/Jhbmnw29ba73DrmBA6LyyYeM5q0dx3St30sqGMV3H+y+rXBrbu
         KNBQ==
X-Gm-Message-State: AOAM53225H5zfhnf7wfKBBEiQ9EdcHMpP1Yj2TuQLzHJyRytUouGHFD7
        J6QTNc29AgfazLIGhk14BEIZfwB7ghc=
X-Google-Smtp-Source: ABdhPJxUZvIBkWOzKqNx2yrBkFTsxNDaXOXpDzAPnYeT1lgblPo/eIL6+bZ4sctegmR5pddZDdg3YA==
X-Received: by 2002:a05:6000:18a7:b0:203:72d1:9be5 with SMTP id b7-20020a05600018a700b0020372d19be5mr9389347wri.325.1647639874347;
        Fri, 18 Mar 2022 14:44:34 -0700 (PDT)
Received: from arch-thunder (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c4fc200b0038c90f61942sm864594wmq.28.2022.03.18.14.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 14:44:33 -0700 (PDT)
Date:   Fri, 18 Mar 2022 21:44:30 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH] media: nxp: Restrict VIDEO_IMX_MIPI_CSIS to ARCH_MXC or
 COMPILE_TEST
Message-ID: <20220318214430.zzx4wcnlxu3ygjun@arch-thunder>
References: <20220318203735.5923-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220318203735.5923-1-laurent.pinchart+renesas@ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Fri, Mar 18, 2022 at 10:37:35PM +0200, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> The imx-mipi-csis driver is specific to NXP platforms. Restrict it to
> those by default, and enable compilation with COMPILE_TEST to keep a
> wide test coverage.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, LGTM.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
     Rui
> ---
>  drivers/media/platform/nxp/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index 7473096f5885..28f2bafc14d2 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -6,6 +6,7 @@ comment "NXP media platform drivers"
>  
>  config VIDEO_IMX_MIPI_CSIS
>  	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
> +	depends on ARCH_MXC || COMPILE_TEST
>  	select MEDIA_CONTROLLER
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
> 
> base-commit: 71e6d0608e4d1b79069990c7dacb3600ced28a3b
> -- 
> Regards,
> 
> Laurent Pinchart
> 
