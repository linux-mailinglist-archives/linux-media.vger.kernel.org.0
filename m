Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 702066EDBBA
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 08:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233480AbjDYGie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 02:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233461AbjDYGid (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 02:38:33 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89A34EF7
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 23:38:32 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-77259202d1dso1373486241.1
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 23:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682404712; x=1684996712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/4po1Ej3WlfOvU1adXzD1g1bzAX945MwQFA0TAxTFI=;
        b=nFbieztOPswW5GxKKRLXOuztCpyAKY9mEjRZBMEICHGO1mEr4lOyasrgFTeqpGgjkM
         ZVarB5HMqvVpOvv0t0+9B1RcIWFMy1IH+lchfuVbvAR5ex1IiPV2XfN06pd0Epa4XknE
         WOuntHpjHKejNoMhtXaT2wWCOPaKUPevx4HHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682404712; x=1684996712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/4po1Ej3WlfOvU1adXzD1g1bzAX945MwQFA0TAxTFI=;
        b=kCBZZmk2GLLrjcwBMFaDPr2RHwYxENtBeB1B22nJ/1bOLyTbesOfC046BtKVA4UjeA
         xLdzkwJiuW+giq5zCDMbfWsGfmUiOT2V+NUy7HAAxHwOgR+EstTulIADnmCrm+uPJSyL
         wUx507OvXs6CNdzNLGm17cLoK1RRRUpMiIssHKQxWko5JXBX55a8J9ZDfm6n5INV2Zyj
         FN3VvXZztxOBQPB9ILG7ksHmgb+u/zwXIkyiVvUzzm+znm0wM8CzDssKJoerWH977tmX
         s5c8j6sSsAmHbIBlhX3/BD6vSML36lsFDHDWaj/tCrjRWk7SHnbIZhHzmOOPhlwR+p9e
         /h1w==
X-Gm-Message-State: AAQBX9eR0MhnG6Q1V2H9EmXVJAExMBSoUdhZ9EhHFU74fEEFuJ65i55v
        ZZH/4qg1Jv34iBjQJYNG4QD5LsFea1SYo83XxHCvPA==
X-Google-Smtp-Source: AKy350bAqm4/VLyKdgzolsEnGjY/HHjmxsgcud09926UX90Ij1K67+wBUb5KDEvOlucOh39eKpAS/LkMZ7WwxRXo5PA=
X-Received: by 2002:a1f:3f44:0:b0:43b:ef4d:f6c0 with SMTP id
 m65-20020a1f3f44000000b0043bef4df6c0mr4118847vka.0.1682404711878; Mon, 24 Apr
 2023 23:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230422103905.1995271-1-treapking@chromium.org>
In-Reply-To: <20230422103905.1995271-1-treapking@chromium.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 25 Apr 2023 14:38:20 +0800
Message-ID: <CAGXv+5HszT12aSaupe0occaFSC-9pZUmaCiKagbFSA5++X3xcA@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Only apply 4K frame sizes on
 decoder formats
To:     Pin-yen Lin <treapking@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 22, 2023 at 6:39=E2=80=AFPM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> When VCODEC_CAPABILITY_4K_DISABLED is not set in dec_capability, skip
> formats that are not MTK_FMT_DEC so only decoder formats is updated in
> mtk_init_vdec_params.
>
> Fixes: e25528e1dbe5 ("media: mediatek: vcodec: Use 4K frame size when sup=
ported by stateful decoder")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>
>  .../media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c   | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_statef=
ul.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
> index 29991551cf61..0fbd030026c7 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateful.c
> @@ -584,6 +584,9 @@ static void mtk_init_vdec_params(struct mtk_vcodec_ct=
x *ctx)
>
>         if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED)) =
{
>                 for (i =3D 0; i < num_supported_formats; i++) {
> +                       if (mtk_video_formats[i].type !=3D MTK_FMT_DEC)
> +                               continue;
> +
>                         mtk_video_formats[i].frmsize.max_width =3D
>                                 VCODEC_DEC_4K_CODED_WIDTH;
>                         mtk_video_formats[i].frmsize.max_height =3D
> --
> 2.40.0.634.g4ca3ef3211-goog
>
