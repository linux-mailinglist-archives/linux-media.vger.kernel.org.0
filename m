Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D10B4E303D
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 19:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352310AbiCUSvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 14:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239977AbiCUSvF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 14:51:05 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D039F6E34B
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 11:49:38 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id r13so31704672ejd.5
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 11:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GsH1tmm4FtEohdpTfSTSb9MeA5r5w7rEpZE3qDN7NDQ=;
        b=bIMTh95LkKtjZQhvPXd2wwUfQY14b/pI5lrg/bDthql+/vWpOaAS5MKI+/DdUbEnnj
         8h0e6Oskv1og7yN+6BaErNmLg8yO+gzreLO4h5OzTZZ8VV7OeLZ/Nc3dEkInLquV200q
         ThmugnZaKNwUQvr5VQJaU6A8U7unuOI6QOVAQ+ZGG/25uWEC7K+Wh7Drw06pSovmagcH
         BAC/QE6I3YRZR4X/N/LIgUnQad/CmyF2jLwP2zp9vkTROZE8oUtaAytASR0oOQUBQ19z
         6CPI5ccfkEzcDVI1D8iZR0YAFyZBJ9T4kLoqXfU/wu8v9FP/CgYA60leeZddp/HaWWV1
         PS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GsH1tmm4FtEohdpTfSTSb9MeA5r5w7rEpZE3qDN7NDQ=;
        b=cF1FadeJ/JrGTLnIa0WmKW0AUzR8C3bxcNpArtR1hvXmluuPow59aO2okI2hA+NC7H
         d8GNoRPNfVX4EBQYLrtD+Bjwuk/cr8Azl7Q3g4P5mMmJ+T83SXd9Ox5SnzRCYuBiSx0I
         ONnRKqVlPE+GDYBPCvCB9EQqDSrrd5BKE4LTZ93uKsfaB1xBL4PRauVh0U5B+JJiZyGM
         k5HS0WIhkunr/8nFzWZKeZ4EOrb2bDogfbh3Mx00HBDY5nodm4SNMpF263qUNoI9uPQh
         2jXEHloKWFv3wG/deSNEFko8KVpgv0Q5zhzLAXnXpUETz2TdaE4Q1d4/KmILAX28un5r
         VelA==
X-Gm-Message-State: AOAM533QRRA6cU/tDsM1MWMISfj3QkdWbmCfWBnZD6zvnTXTIeTFR22k
        aOw84zhxg/LjqFG3YnKdZkHDbJ1n5oY=
X-Google-Smtp-Source: ABdhPJzdwynurVjkvciImuis3UXuhQrxBZGlliP69i59y9m/IH2wYbqMvbBYbZ958XNC1W0ddxH9EA==
X-Received: by 2002:a17:907:162a:b0:6db:b0e8:9721 with SMTP id hb42-20020a170907162a00b006dbb0e89721mr21981299ejc.579.1647888577289;
        Mon, 21 Mar 2022 11:49:37 -0700 (PDT)
Received: from arch-thunder (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id gg3-20020a170906e28300b006da68b9fdf1sm7200350ejb.68.2022.03.21.11.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 11:49:36 -0700 (PDT)
Date:   Mon, 21 Mar 2022 18:49:32 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH] media: imx: imx-mipi-csis: Fix active format
 initialization on source pad
Message-ID: <20220321184932.iycpd56ovwemz22k@arch-thunder>
References: <20220321153020.29965-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321153020.29965-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Laurent,
Many thanks for the fix.

On Mon, Mar 21, 2022 at 05:30:20PM +0200, Laurent Pinchart wrote:
> Commit 52f69bc5f8c0 ("media: imx: csis: Store pads format separately")
> broke initialization of the active format on the source pad, as it
> forgot to update the .init_cfg() handler. Fix it.
> 
> Fixes: 52f69bc5f8c0 ("media: imx: csis: Store pads format separately")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

LGTM.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
     Rui

> ---
>  drivers/media/platform/imx/imx-mipi-csis.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> index 6d03d89fb5d8..9da105d37987 100644
> --- a/drivers/media/platform/imx/imx-mipi-csis.c
> +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> @@ -1014,14 +1014,6 @@ static int mipi_csis_init_cfg(struct v4l2_subdev *sd,
>  		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt_sink->colorspace,
>  					      fmt_sink->ycbcr_enc);
>  
> -	/*
> -	 * When called from mipi_csis_subdev_init() to initialize the active
> -	 * configuration, cfg is NULL, which indicates there's no source pad
> -	 * configuration to set.
> -	 */
> -	if (!sd_state)
> -		return 0;
> -
>  	fmt_source = mipi_csis_get_format(csis, sd_state, which,
>  					  CSIS_PAD_SOURCE);
>  	*fmt_source = *fmt_sink;
> -- 
> Regards,
> 
> Laurent Pinchart
> 
