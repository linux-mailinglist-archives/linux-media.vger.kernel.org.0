Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7080A6BEF84
	for <lists+linux-media@lfdr.de>; Fri, 17 Mar 2023 18:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjCQRVJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Mar 2023 13:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjCQRVA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Mar 2023 13:21:00 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08014E2539
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 10:20:59 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id ay8so3825930wmb.1
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 10:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679073657;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qBXUX1ewVGliH2qbyG+NOLH5sHkCboCsAmAn6tWfaSI=;
        b=C39B7bz4syjKd+MEqnCiL0qwT4ZPMK++5XDkmdcsR1jYZP4nRQcjqZAuz2EtZsgfN0
         q7ljEx9u/j7pQdRS9lRyEZ/1bVVpHHCf7LqKylNuv60eYl+3eiaf8Fa4AF6zMD5n/UEf
         6cvGP+241StV3SsjFj71ueJPTcOV3XanC591KtDANg9HeT/tN7nTGlbeZlD3CoN9RVMY
         JUNoGY8smUBK+1Cl4Dql6skMPAJgZ2NKlJVOuFenWCLvZu2jB2xbDsBQyjFhuGK5CSyH
         jNy/iChFaX6cXw+LvGWL953npxX5TpOm+H3tzBjWhDLFAWVArUocsLK6plMlW3bb4gjM
         y1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679073657;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBXUX1ewVGliH2qbyG+NOLH5sHkCboCsAmAn6tWfaSI=;
        b=TusuW1IaNHlQZh/BgXKik+wXmIpN0UDHIyAzcVD39OJbIH+eP4X+IWlkxxc7ehNWdK
         +T9AhPCQ1k1zWbA1DBOxHNi9UJLrA+iFHdZ+1U4JoxK1fPzRZVXS3wvIe95DsqmpRHYp
         7+Ntrc0e4yxIRlpAlEVyar7wpQqrJ8O1zEDZrDRJQSa9B6RxwZ0sp7nPufWi4oVSyh/u
         Z+eA9UyMXdmJT5VSrYq3Ae5YgxuIHVzbz2zbgq/8i4NEgzmJHkC9nl/Qt+QidYgOS6Dn
         t1ZqLCM3E+jWBdpOne6d4Zwvoc54iZ6nxIa/jRCLXMnNBBY2uDMDizc/GMDcclPXqR/2
         9m9w==
X-Gm-Message-State: AO0yUKWnLjZc+wN8PSrWzYz7rf83yZAHUxY5itlZKsfRFIyLPj07SRFn
        58Ys5QFzGjsq3qFkG602JdoE0GsywFA=
X-Google-Smtp-Source: AK7set93quNvl9XqYzMK7ssB9IZvr4tBa5yjli80z3VRJhiTMbh7gNLAYvP959gf89qaX9R7zksHHg==
X-Received: by 2002:a05:600c:4ecf:b0:3ea:e4bb:340c with SMTP id g15-20020a05600c4ecf00b003eae4bb340cmr25799917wmq.18.1679073657413;
        Fri, 17 Mar 2023 10:20:57 -0700 (PDT)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id bd20-20020a05600c1f1400b003e21dcccf9fsm8402684wmb.16.2023.03.17.10.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 10:20:56 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] media: imx: imx7-media-csi: Fix mbus framefmt field
 init
In-Reply-To: <20230316143829.499039-2-alexander.stein@ew.tq-group.com>
References: <20230316143829.499039-1-alexander.stein@ew.tq-group.com>
 <20230316143829.499039-2-alexander.stein@ew.tq-group.com>
Date:   Fri, 17 Mar 2023 17:20:55 +0000
Message-ID: <m3r0tn47m0.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,
Thanks for the patch.

Alexander Stein <alexander.stein@ew.tq-group.com> writes:

> Default to non-interleaving.

Why?

>
> Fixes: bc0d3df31ffe ("media: imx: imx7-media-csi: Simplify imx7_csi_video_init_format()")

It was never init to FIELD_NONE even before this patch, do you think it
is really a fix?

Cheers,
  Rui

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> index c22bf5c827e7..3e97b9f2ff69 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1610,6 +1610,7 @@ static int imx7_csi_video_init_format(struct imx7_csi *csi)
>  	format.code = IMX7_CSI_DEF_MBUS_CODE;
>  	format.width = IMX7_CSI_DEF_PIX_WIDTH;
>  	format.height = IMX7_CSI_DEF_PIX_HEIGHT;
> +	format.field = V4L2_FIELD_NONE;
>  
>  	imx7_csi_mbus_fmt_to_pix_fmt(&csi->vdev_fmt, &format, NULL);
>  	csi->vdev_compose.width = format.width;
> -- 
> 2.34.1
