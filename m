Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE0449DDD5
	for <lists+linux-media@lfdr.de>; Thu, 27 Jan 2022 10:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238524AbiA0JYK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jan 2022 04:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238498AbiA0JYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jan 2022 04:24:10 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974D5C06173B
        for <linux-media@vger.kernel.org>; Thu, 27 Jan 2022 01:24:09 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id e9so3395541ljq.1
        for <linux-media@vger.kernel.org>; Thu, 27 Jan 2022 01:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1/pFKZsibDbTasI5zHvoomcfgVulhQzgBhdCkCIsPV4=;
        b=SBk++oGjK7vx0bR/u816Fk2uDzB+AlEwqZ4fjozkcNku8sKEy0s4qnYQVBkjiLcXwZ
         iONXICtuFkUv6Hw8Tzo4sCIck9Nt/2u9zBftwk0FLSN/SWTNQTB3x08U4JLD4Wzx1o5h
         hiX00dZ7j99eLlL0vFrDxqxBbboh8fBIxyY6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1/pFKZsibDbTasI5zHvoomcfgVulhQzgBhdCkCIsPV4=;
        b=wqlXnxwj00Q0FlY+xWmxYx4jXtywCsYMEvb5rhmuHR9v/vGJO3JeeS7l9SqI1n5twE
         /JZPRawE2SbGS8u8MQoSmXddCkADhnC08cJGi/wU1U1nk0K18R5PeFIPCyBTuuOg/qjG
         1qhl23bmR8/GpuwCQBiq4dVX7MULFOn90OdGTmxcyHC4aD/JZAxrEzor4MwuEl4NFbBM
         N0tAz/J9hUGRFmiL87x6QNK50l9kY4V501a/gVl9whgREyVozI+OZBVox72l5ZAvhtaA
         w7nBhJp49g1RyrnFWpc2aDdMn8tZi7CKi5msWhSBcu+uSYzaOIsAG2nb/1ofdm1YPGII
         aYnw==
X-Gm-Message-State: AOAM530v94DcQRJmRktGOluYZgHb+pZQFEd1MoOB8IhBYmEQC+mBuUFq
        9KavtdPteY9A/OzfnG9FKmUh26xvT/nFJ0CWWgq71w==
X-Google-Smtp-Source: ABdhPJyXM+RpThUvI1HjeGrfGwAx7jB600kp/rh3QNtWeV9RUuO7+U6MejDM5XXVg8GmXXHFoXWzjd3Eg8/BT40cL18=
X-Received: by 2002:a2e:920b:: with SMTP id k11mr2169470ljg.302.1643275447980;
 Thu, 27 Jan 2022 01:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20220127025544.10854-1-yunfei.dong@mediatek.com> <20220127025544.10854-8-yunfei.dong@mediatek.com>
In-Reply-To: <20220127025544.10854-8-yunfei.dong@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 27 Jan 2022 17:23:56 +0800
Message-ID: <CAGXv+5ELuvvG6dwXH5DdHtjOm4j4AAVTk2UxGOitF5v5Vx265A@mail.gmail.com>
Subject: Re: [PATCH v1, 7/8] media: uapi: Init VP9 stateless decode params
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Jan 27, 2022 at 10:56 AM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Init some of VP9 frame decode params to default value.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Maybe add

Fixes: b88dbe38dca8 ("media: uapi: Add VP9 stateless decoder controls")

> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 54abe5245dcc..b25c77b8a445 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -112,6 +112,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>         struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
>         struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quant;
>         struct v4l2_ctrl_vp8_frame *p_vp8_frame;
> +       struct v4l2_ctrl_vp9_frame *p_vp9_frame;
>         struct v4l2_ctrl_fwht_params *p_fwht_params;
>         void *p = ptr.p + idx * ctrl->elem_size;
>
> @@ -152,6 +153,13 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>                 p_vp8_frame = p;
>                 p_vp8_frame->num_dct_parts = 1;
>                 break;
> +       case V4L2_CTRL_TYPE_VP9_FRAME:
> +               p_vp9_frame = p;
> +               p_vp9_frame->profile = 0;
> +               p_vp9_frame->bit_depth = 8;
> +               p_vp9_frame->flags |= V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING |
> +                       V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING;
> +               break;
>         case V4L2_CTRL_TYPE_FWHT_PARAMS:
>                 p_fwht_params = p;
>                 p_fwht_params->version = V4L2_FWHT_VERSION;
> --
> 2.25.1
>
