Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1D26C34F1
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 16:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjCUPAT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 11:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbjCUPAR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 11:00:17 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F8448E36
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 08:00:16 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so4784142wmq.3
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679410815;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/SKvKGtYbJspT2KfSVVcegusA4FS/+In9jNUHnh2Smc=;
        b=P3/JN7QvITsVuX1klcHni87+mXKPlqijSK7TO1nWayAZJMFXHn9Hjo04TiOV8VGQhT
         e7Pw3rEQHMAKm08sMdm08V+95oFkwsyTVvsSwNKWaeN36I1asxgbX/vYeA2PwCUYcD01
         FZjpaaIvzdqNUizGr6/58n9FqfXaUIeHfPUpaHRPFlg0CWhV3EV+P9l2JWcVU6AciEBm
         lU4Ml5bkcxBiKOqdor27Roo89Djcd5xi439uCbcd2RS3LjB5Lsyz3WSzQ4i5/G00NsaY
         ig/u9sSLGYsUjrtwXfqTkZfojJsPbP4pAkgAtANmXslT3CkJQPwwIqMnAxfeoDbjNer3
         tqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679410815;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/SKvKGtYbJspT2KfSVVcegusA4FS/+In9jNUHnh2Smc=;
        b=AW10ude4YD1BcvOOP1aowYxWTwrhfjb9Wf2kidUUiHPMcxXo1fK1lHcquzw553bjeR
         OgOLcLpTmtDMb73wvTELhCPlFeFVUX7jjqsuwfMU0X65uCz59J9GD9QP9th3rQs7WGjB
         MmedM3HpNL/33auhY/vCVVIecTkuNm2dCZotO7VI70P+G1dCU8RbQNVB/SKFJ8POIAI4
         vOPo81XIh5TgtiOKgPkOBFmWszqcm3kADDMpEoAYEtZ/EuoG2fgYstl1vlSyJ1jGWTAx
         uSdkAbAd99J/WOQ9oMS5GEEioML7InXT+QovtxUfFAxNNfVTB+KNh+3WyZ9iyNwGCQz4
         o6pA==
X-Gm-Message-State: AO0yUKVlwTjYdijZUXnl4bN510eDXjNDgJzS3AaIVx3S01K/UvpSNuXg
        D8XmpxBl7PC38PmFlQqrvgO9KDcJzJ99EA==
X-Google-Smtp-Source: AK7set/sdOiFTHpgd/fbhMEssMMrtW2VX1HqCeNJZXIKbzhlonWR8CPVqT0Jvy8u/F1tyc65IsF9XQ==
X-Received: by 2002:a05:600c:2307:b0:3ed:ed36:4150 with SMTP id 7-20020a05600c230700b003eded364150mr2510405wmo.4.1679410814916;
        Tue, 21 Mar 2023 08:00:14 -0700 (PDT)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id l26-20020a05600c2cda00b003dd1bd0b915sm19921345wmc.22.2023.03.21.08.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 08:00:14 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] media: imx: imx7-media-csi: Fix mbus framefmt
 field init
In-Reply-To: <20230321072707.678039-2-alexander.stein@ew.tq-group.com>
References: <20230321072707.678039-1-alexander.stein@ew.tq-group.com>
 <20230321072707.678039-2-alexander.stein@ew.tq-group.com>
Date:   Tue, 21 Mar 2023 15:00:13 +0000
Message-ID: <m3bkkmgneq.fsf@gmail.com>
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

Alexander Stein <alexander.stein@ew.tq-group.com> writes:

> 'field' is zero-initialized to V4L2_FIELD_ANY, which is an invalid value
> to return to userspace. Instead fefault to non-interleaving.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Many thanks for adding this much better change log. (with the already
mention fefault fix from Laurent :) )

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui
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
