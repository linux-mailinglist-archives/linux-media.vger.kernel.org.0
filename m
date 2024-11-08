Return-Path: <linux-media+bounces-21105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 902A69C155C
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 05:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2212D1F23C8E
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 04:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE5C1C68A3;
	Fri,  8 Nov 2024 04:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l7jvja/9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B597168B1
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 04:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731039642; cv=none; b=ZBh8FRfE3SHI226Qxcjmac1FzMOfWlF+dVzBYjK19h0bCTGPe3+GJdu+Ia+pmmnqv43HlZa+UqsDuMwV4LzvWvmGsdtWMctBV1GDAaojwhLNBo7O3ryJQjlK4O/sTMlJdCzYyROrKXRp5JRpMT4+yMdc6oQ4hSuL1ZDYxn77r0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731039642; c=relaxed/simple;
	bh=YodfxzMhXROdNig5kcqg4w3VAHmnkaIJsEpWcMyT8qQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajtRI4VQA8Ec76sRM+jVJnlsrfQXSZHGIHrA4b0MIowqdOCU/tEzGC6HEr4rrRfVaxFpQRlcT72DMBboMyl5/XrekP5EKGa1TNEcna5cXC1IwuLMaeqMA1R3BanpxOs4RnQXThibvfz7dNy4rraT9rnAAd/uDg/Xp0kiiDM4hvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l7jvja/9; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so1583601e87.3
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 20:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731039639; x=1731644439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEWziAM5vGxUZErinOfDkgBc9AdFxegHOYFNZYJiUGk=;
        b=l7jvja/9eRnrdw+ei+6Six2iE6R09VzzXR/56AzJbfRPbpjr4SSYhicgBsUK2XwYSO
         pI/9hSRybbVFTNKEVNz2A+cEU0Wb/bURmDnzubxGHi9FK4wi8fc02mj2HSmLKCVkS+Hf
         BohUWvCqkm1h88qPmU5NSJwqNQ6aRMxI/nPww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731039639; x=1731644439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEWziAM5vGxUZErinOfDkgBc9AdFxegHOYFNZYJiUGk=;
        b=SF4VJ/ajpqjpi/DeTYjGhFO4jgwNE6G9CjTgDRRonyz/weHBo8OYbrgVDxn0HoJI/B
         aCsFKZKE2pb8VHyAOv2Hu0Q/RzhW1GIsp4GKJSUs5B5QsaRrbA2O1WEkAQsLJjPN7rTv
         BKEw0Dwtbtifete1IYrYBtBOpC+hNfGmxd+eIs7aU1+Qaz2YBu4j9+jNLiHvcgH7q7TK
         j2dBlfWzcmsPpK19zKCliErhm2ScD2Nj1ybG1CJNLE4J/Thd1HY29gBaC3+c4WXnXrfK
         PoaKxCeV3eyYToKZLjioASgpOr3Al59HzVN7cyrLY3LQ5j9MQS+O7KggN2aHk8UBlH4t
         G3ag==
X-Forwarded-Encrypted: i=1; AJvYcCWrE+A/fXNsqtDASdBwzcwOUIuVFIt16GklcT4IT+MbfpYVwHuDPl0Kt+vBCEGxqpOtKtxlEDmuWi5RoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE/9SpXJHrJDZxQiGdih0GZGn4FN/jBmdRMADgLA9hPXllRdgc
	P0EkGtTkafJHazDm1PffxywP3/mzT4yTAyh4wt0nmuyjeuhMZMGiHsjKN97F93LAUH8Ru1RV49c
	PcN+PrzPnxN8WKCi6ZuBfM4ZFHsbf2aBn1a9O
X-Google-Smtp-Source: AGHT+IE4XZ04YFjPUEEL0D8wcmr49KGT/Fc8Oa+piPRCpeewhZIE7Cc2kejtZ9Oe/D6WW+a2IwuOeZhBz5+WWTsy8s0=
X-Received: by 2002:ac2:4e13:0:b0:539:ea0f:cc43 with SMTP id
 2adb3069b0e04-53d862c6f1amr560775e87.19.1731039639002; Thu, 07 Nov 2024
 20:20:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108033219.19804-1-yunfei.dong@mediatek.com> <20241108033219.19804-4-yunfei.dong@mediatek.com>
In-Reply-To: <20241108033219.19804-4-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 8 Nov 2024 12:20:28 +0800
Message-ID: <CAGXv+5GgoSxGM9whwaL3jEUCEoxhTr6UsUdRH8BpBG3UUqDP1A@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] media: mediatek: vcodec: Get SRC buffer from
 bitstream instead of M2M
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 11:32=E2=80=AFAM Yunfei Dong <yunfei.dong@mediatek.c=
om> wrote:
>
> Getting the SRC buffer from M2M will pick a different than the one
> used for current decode operation when the SRC buffer is removed
> from ready list.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 25 +++++++------------
>  .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 24 ++++++------------
>  2 files changed, 17 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index 90217cc8e242..0e1469effeb5 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> @@ -1060,24 +1060,20 @@ static inline void vdec_av1_slice_vsi_to_remote(s=
truct vdec_av1_slice_vsi *vsi,
>         memcpy(remote_vsi, vsi, sizeof(*vsi));
>  }
>
> -static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_i=
nstance *instance,
> -                                                struct vdec_av1_slice_vs=
i *vsi,
> -                                                struct vdec_lat_buf *lat=
_buf)
> +static void vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_=
instance *instance,
> +                                                 struct vdec_av1_slice_v=
si *vsi,
> +                                                 struct mtk_vcodec_mem *=
bs,
> +                                                 struct vdec_lat_buf *la=
t_buf)
>  {
> -       struct vb2_v4l2_buffer *src;
> +       struct mtk_video_dec_buf *src_buf_info;
>         struct vb2_v4l2_buffer *dst;
>
> -       src =3D v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
> -       if (!src)
> -               return -EINVAL;
> -
> -       lat_buf->vb2_v4l2_src =3D src;
> +       src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, bs_bu=
ffer);
> +       lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
>
>         dst =3D &lat_buf->ts_info;
> -       v4l2_m2m_buf_copy_metadata(src, dst, true);
> +       v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, dst, true);
>         vsi->frame.cur_ts =3D dst->vb2_buf.timestamp;
> -
> -       return 0;
>  }
>
>  static short vdec_av1_slice_resolve_divisor_32(u32 D, short *shift)
> @@ -1724,10 +1720,7 @@ static int vdec_av1_slice_setup_lat(struct vdec_av=
1_slice_instance *instance,
>         struct vdec_av1_slice_vsi *vsi =3D &pfc->vsi;
>         int ret;
>
> -       ret =3D vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, lat_=
buf);
> -       if (ret)
> -               return ret;
> -
> +       vdec_av1_slice_setup_lat_from_src_buf(instance, vsi, bs, lat_buf)=
;
>         ret =3D vdec_av1_slice_setup_pfc(instance, pfc);
>         if (ret)
>                 return ret;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index 3dceb668ba1c..a56f6bb879a6 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -711,21 +711,16 @@ int vdec_vp9_slice_setup_single_from_src_to_dst(str=
uct vdec_vp9_slice_instance *
>         return 0;
>  }
>
> -static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_i=
nstance *instance,
> -                                                struct vdec_lat_buf *lat=
_buf)
> +static void vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_=
instance *instance,
> +                                                 struct mtk_vcodec_mem *=
bs,
> +                                                 struct vdec_lat_buf *la=
t_buf)
>  {
> -       struct vb2_v4l2_buffer *src;
> -       struct vb2_v4l2_buffer *dst;
> -
> -       src =3D v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
> -       if (!src)
> -               return -EINVAL;
> +       struct mtk_video_dec_buf *src_buf_info;
>
> -       lat_buf->vb2_v4l2_src =3D src;
> +       src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, bs_bu=
ffer);
> +       lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
>
> -       dst =3D &lat_buf->ts_info;
> -       v4l2_m2m_buf_copy_metadata(src, dst, true);
> -       return 0;
> +       v4l2_m2m_buf_copy_metadata(lat_buf->vb2_v4l2_src, &lat_buf->ts_in=
fo, true);
>  }
>
>  static void vdec_vp9_slice_setup_hdr(struct vdec_vp9_slice_instance *ins=
tance,
> @@ -1154,10 +1149,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp=
9_slice_instance *instance,
>         struct vdec_vp9_slice_vsi *vsi =3D &pfc->vsi;
>         int ret;
>
> -       ret =3D vdec_vp9_slice_setup_lat_from_src_buf(instance, lat_buf);
> -       if (ret)
> -               goto err;
> -
> +       vdec_vp9_slice_setup_lat_from_src_buf(instance, bs, lat_buf);
>         ret =3D vdec_vp9_slice_setup_pfc(instance, pfc);
>         if (ret)
>                 goto err;
> --
> 2.46.0
>

