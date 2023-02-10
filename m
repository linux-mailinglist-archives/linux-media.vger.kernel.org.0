Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE9F69225E
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 16:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232813AbjBJPgg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 10:36:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232609AbjBJPgf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 10:36:35 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0869577BAD
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 07:36:28 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id i12so3759933qvs.2
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 07:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yns5dIgTI6JxWbAph1O5r62njQOhGCrBzKQvo54B6zU=;
        b=qt0dTy3gVXkMeMMY1z1PZwzdNHzVX7V43gDb6L3hzCqa+olBH07sWy3wRrodzDIMG4
         6hhWqr1Vobg7UcTDxPhcBKvvutcBaIlcdZt315xhTaQQG8r5n/M+uOuTOrVicwmwyKAU
         064uvXHrbIh3mtaWOU4aybOMWgkXvkOzKL0b8uQUjc/v2XlzXgc0DQpTPFVMok0FMsQM
         08vESDuFXllzb2iR8QrHNONx/wudIUxbhG5sODlHnj3/KUNblwg71nM5dxt/l0oVqdMr
         /nlLhaPAjSj5IgprhRQcEHPcPMcz3AcuIRCJk9+PrV5mMO/ejuZ4Rbocq4ZekG0vV8P9
         JnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yns5dIgTI6JxWbAph1O5r62njQOhGCrBzKQvo54B6zU=;
        b=n/fuJ1xtZwv6/yxOkNg3RKQfM7ZoNVVy37cYHdBtbpFFptm/hgoWS8q9QKifp2ekp/
         fX18MmPUOqjv0rew8rXZCfXNGgW8mQU5Uc3IPcgf51guHVye6MFAVscu6jK04ENTAdCQ
         XdbE883LhVBiFBw7G0x8Hap7JPyoFtMP/flLqojx1zHkzzgKwuHqGb89He1RHP6OQBKH
         tUUJLe76R6l0+wYAOGkAMJAuSqvX1A0JFPRDAajUvXzNAjDurr9nUGK9QvZDnBKaDnNA
         qbvv70YBUlUMgbvGkiykwpI3O7WNvblgVO6TcclEW584JN1fhgK2+rtDda8GHa6LszHi
         tT9Q==
X-Gm-Message-State: AO0yUKWqFszxnf28OOnFE9Rc7ioRMdqCU819PLnUxdotnW/oFcyuA6Qt
        0kYZm7e2q9V460yvc/CMTzo4Qw==
X-Google-Smtp-Source: AK7set/9kH5iClIq96ImXMXxCRZP3o6rb/SFdyOqAvYoxsx641uTIbYLyp0hit6CJig0eeQHDNzzWg==
X-Received: by 2002:a05:6214:1bc9:b0:537:7484:8d1c with SMTP id m9-20020a0562141bc900b0053774848d1cmr29006106qvc.30.1676043388060;
        Fri, 10 Feb 2023 07:36:28 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id r129-20020a37a887000000b006cec8001bf4sm3758407qke.26.2023.02.10.07.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 07:36:27 -0800 (PST)
Message-ID: <e972c2ac1a7a6f0ce258c8056b82bdc87e4d8ceb.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: mediatek: vcodec: Force capture queue format
 to MM21
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Date:   Fri, 10 Feb 2023 10:36:25 -0500
In-Reply-To: <20230210055518.6017-1-yunfei.dong@mediatek.com>
References: <20230210055518.6017-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 10 f=C3=A9vrier 2023 =C3=A0 13:55 +0800, Yunfei Dong a =C3=A9cr=
it=C2=A0:
> In order to conver the format of capture queue from mediatek MM21 to
> standard yuv420 with Libyuv, need to force capture queue format to
> MM21 for Libyuv can't covert mediatek MT21 format at current period.

Please rework this text, it is hard to understand.

>=20
> Fixes: 7501edef6b1f ("media: mediatek: vcodec: Different codec using diff=
erent capture format")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.org>
> ---
> changed with v1:
> - add Fixes tag.
> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/dr=
ivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 641f533c417f..4f5e9c20214f 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -41,7 +41,7 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx =
*ctx, int format_index)
>  	const struct mtk_video_fmt *fmt;
>  	struct mtk_q_data *q_data;
>  	int num_frame_count =3D 0, i;
> -	bool ret =3D true;
> +	bool ret =3D false;
> =20
>  	for (i =3D 0; i < *dec_pdata->num_formats; i++) {
>  		if (dec_pdata->vdec_formats[i].type !=3D MTK_FMT_FRAME)
> @@ -63,7 +63,7 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx =
*ctx, int format_index)
>  	case V4L2_PIX_FMT_H264_SLICE:
>  	case V4L2_PIX_FMT_VP9_FRAME:
>  		if (fmt->fourcc =3D=3D V4L2_PIX_FMT_MM21)
> -			ret =3D false;
> +			ret =3D true;

This makes the VP8 and the other cases identical, leaving anything that tou=
ches
MT21 as dead code. I'm not sure, cause I cannot test it, but it should in t=
heory
render MT8192 unusable, unless a new firmware has been submitted to linux-
firmware with MM21 support ?

>  		break;
>  	default:
>  		ret =3D true;

