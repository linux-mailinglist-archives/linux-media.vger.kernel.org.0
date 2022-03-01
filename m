Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5BEA4C93DB
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 20:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiCATDP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 14:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237271AbiCATDF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 14:03:05 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0BB65830
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 11:02:24 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id c7so13702624qka.7
        for <linux-media@vger.kernel.org>; Tue, 01 Mar 2022 11:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=GsGl1dGldgnpdLEXcvxrxYAF/SUgWFg5pNG0AUKw04w=;
        b=v5QG28VLIZmA6C+9VU64CfSfh9FZ13n2yEH89RDA/5CBUpVZQ6ZijmlreX4/EXQMrP
         dFKg1MxqW13FfKMGIq81pTFUPEEQNIv92eat+lBY0ISh7pgFQd8V9lQrQt7Vp6SwVr0F
         P3YdCNICRmkCtBsdq2cantzryx93X8fr91clLV8S81Xs4f1eyVL1TV+Ide4FznDwmJTO
         3iXMvrZtgPOZjcPX4qKd5C0Ju4QlRA62+nmhwW0FlYQNeMzy4PYj5oS3SPKCzAW7Tsf0
         5hGvQU6x5Fd+AEaDjpN5WIb3SmB9S4DAFdcJuxbm2mmAlmRPbqRm/0e41O2jbrBmyz93
         As0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GsGl1dGldgnpdLEXcvxrxYAF/SUgWFg5pNG0AUKw04w=;
        b=XSgd77C5lz3/y/j1L0WWCsT9NGUxSU8gVqawALfA6nWJiA/S6aTOthoa/Jg6xZD2na
         TjN4OKGjVq/eH2x/r+mD+e6A/0RjKJ+mIJckY3W/7wK/N69YSgfo9iaMN+/J10gigaMl
         1uQ2dBEGDn44NrkSJeL1ZHFvo9kzkasZMR5a3vZgyG/UoQ7UHywDVbNQRjzCCTdQwK7s
         lKzrDYy0Rk5WfNteFMKMvmXCS7/mx7Hx2l+eTSRTQNSpICW+R3wDu9NHhPf4y6R24NVc
         jUd6Ozb0xZEHfKAFCWY8BivPDPR3WidfArQ43aUl52KjX3PUKIXcr+VgGasAd3G7INje
         iq0A==
X-Gm-Message-State: AOAM531ex2VNBrrTAcUCZ1M1+z+rkBCfzFJ/SC+GDwDDdJFOELSbuU+j
        yN19gq80FfQvILjfsxxjbtqUUg==
X-Google-Smtp-Source: ABdhPJzpmA5uFIaU8OToNP2i0XOhvtLd6r7cnQbc8qnuHs7rV4wShM354MApuOXKlSpD/7rOLJGNhg==
X-Received: by 2002:a05:620a:22a6:b0:662:e97d:c7bc with SMTP id p6-20020a05620a22a600b00662e97dc7bcmr6914032qkh.486.1646161343508;
        Tue, 01 Mar 2022 11:02:23 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id i128-20020a378686000000b00648ddd8a5c0sm6790641qkd.100.2022.03.01.11.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 11:02:22 -0800 (PST)
Message-ID: <90c57ac742bad5cd75ae76e01e6042739b4e8012.camel@ndufresne.ca>
Subject: Re: [PATCH v7, 09/15] media: mtk-vcodec: disable vp8 4K capability
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
Cc:     George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Date:   Tue, 01 Mar 2022 14:02:21 -0500
In-Reply-To: <20220223034008.15781-10-yunfei.dong@mediatek.com>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
         <20220223034008.15781-10-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 23 février 2022 à 11:40 +0800, Yunfei Dong a écrit :
> For vp8 not support 4K, need to disable it.

This patch will need to be changed after you have moved this code into the
proper ioctl.

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index bae43938ee37..ba188d16f0fb 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -532,7 +532,8 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
>  		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>  		fsize->stepwise = dec_pdata->vdec_framesizes[i].stepwise;
>  		if (!(ctx->dev->dec_capability &
> -				VCODEC_CAPABILITY_4K_DISABLED)) {
> +				VCODEC_CAPABILITY_4K_DISABLED) &&
> +				fsize->pixel_format != V4L2_PIX_FMT_VP8_FRAME) {
>  			mtk_v4l2_debug(3, "4K is enabled");
>  			fsize->stepwise.max_width =
>  					VCODEC_DEC_4K_CODED_WIDTH;

