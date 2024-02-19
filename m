Return-Path: <linux-media+bounces-5440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD1A85AD8D
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 22:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D725B1F23DB1
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 21:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33A453E08;
	Mon, 19 Feb 2024 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="JxolVbzK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1F02E40C
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 21:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708377000; cv=none; b=nkVxr+ZEYc4E2cTIOSEHuuPtARo93ErvVHLO3KyJLg/NavYDs2HhLIeqG2XNoU28+k0HzUjmcsSOSD3ex3L8tIby77Vmkik4sEtW32xtCStPgVjwDjPaE/wPIFtBCGMvr3rUJmk+Obpy7s68NhbgPy9SMLkVHwHo3Xsto1ORF9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708377000; c=relaxed/simple;
	bh=6tlDEwERPvlXfHC9YCswOQBfp3ZINsYEeaCarvocP6Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jt2B+F4f43fE73sYRFs5xs+YO9B9K848DjbLx7ggRSf7bB8NcMnzmXF614Q+EsOt/a+ZqRDef/4Z2jcG3i6ITdQWR67YnaRNC5CgcT1SVfI/9QqrS0b9wyxhm0pKP7VXJGfR0qRh6LZGbgdn9zu4pR45cFZZfe90MNt88ldBFwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=JxolVbzK; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-68f87e24be8so4670036d6.2
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 13:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1708376997; x=1708981797; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HCbkaHP288a5yrdhun50bmJZYdjOw3WPCZ9sfVUzD6g=;
        b=JxolVbzKKgyZQ6UPKAooB/IQgAfdvuFnuQCgu1gOfKujtG//rdw4ObhLHtZ/3Uh00H
         I5wHrpcEnAr1TfhXujlgyJKU528lfvNTsDbGhT2NfAoVULQ4y0hmuDWQvuqdFd3bPJQ4
         HUeBM1kQ2fOZvPQ6ChecLGHd7sUbpuZKlcCCZQEWGZj5jiIoUys8nXFUvn415VHLgOpt
         uBvCniy9SB425k3lsVHkygvVjNARlkIcCGU98D1fP+0iL4bYIWVuKRBr+HmttHYPHSRg
         Gi0WrzBkMMCneCMXx36uROFg4z5nnSdRa0XQAkLeM1MQqaOxDzQ5ULvtInducSlDfk/F
         UCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708376997; x=1708981797;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCbkaHP288a5yrdhun50bmJZYdjOw3WPCZ9sfVUzD6g=;
        b=tkAglEb6HHpH7jAHKC+BkuRF0WvbhMSdueed6wULpxmDtXxYTPJ9z7Kxi/mu4HqFB2
         DP6k/SN6amNjK+txhYy25Tp6sZW9oPAM+/1QxVr/ozRju4zMS1QRAJdtt75ew6l30AGE
         opY3BJB1O2bvF5pPz8UOZIjB/akspKhCN3RhsoE0ZQDnXq2gUOBp/otvxAaVD+07vqIC
         q9xJiuK9iTiuX0d4ykF/1d+EMZdTnK3PrU366Uu3zzL3MzbHoNxpE46MsopjjONJCHa+
         Mp1vPD01pz+Hs7u730TR0yHg5HzVsD1tPqcpgxRgAI13gUWHsxy/zYWo7LwYaJUqX6tT
         fR8g==
X-Forwarded-Encrypted: i=1; AJvYcCUKx++RiTdvZbnf+1q2criBaV1KY7Y2ehzNfuzc4RnzQll2z/3zjnKJ3HDKFqApuLuJjOm6iqTja45UiKCGK0NSXPJwjgZVG/BHSyI=
X-Gm-Message-State: AOJu0YzA6zmV1rbXG7FzGe5LbMKbwXDijqd71elH6hsvRRtjPWSLB+Pa
	9C2NfPaoL3hoS17CtagD+l4o3+5dzUVYXyeiMLMe0COjsAD3ippz50iqrYDnhIg=
X-Google-Smtp-Source: AGHT+IE4nG1woNYcCJfdWwaumNGm4a6aorUD4KZhgabmwl0ONqKwgzR9HsQOTqEqXF6MlUwntWWu4Q==
X-Received: by 2002:a0c:db0c:0:b0:68c:7f24:efdc with SMTP id d12-20020a0cdb0c000000b0068c7f24efdcmr15617434qvk.53.1708376997287;
        Mon, 19 Feb 2024 13:09:57 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id t5-20020a05620a004500b007876fd0b878sm666361qkt.53.2024.02.19.13.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 13:09:57 -0800 (PST)
Message-ID: <6bed645bc3ddd51092ed8f6e49672af40735c83d.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Handle VP9 superframe
 bitstream with 8 sub-frames
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 angelogioacchino.delregno@collabora.com, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
 <longfei.wang@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Mon, 19 Feb 2024 16:09:54 -0500
In-Reply-To: <20240218115954.4038-1-irui.wang@mediatek.com>
References: <20240218115954.4038-1-irui.wang@mediatek.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le dimanche 18 f=C3=A9vrier 2024 =C3=A0 19:59 +0800, Irui Wang a =C3=A9crit=
=C2=A0:
> The VP9 bitstream has 8 sub-frames into one superframe, the superframe
> index validate failed when reach 8, modify the index checking so that the
> last sub-frame can be decoded normally.

When I first saw this patch I was concerned, since we don't allow bundling =
super
frame into the stateless API, but now I realize that this is for the statef=
ul
decoder. Perhaps you can help me and possibly other reviewers with simply
stating that this is for stateful decoders.

>=20
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
> index 55355fa70090..4a9ced7348ee 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
> @@ -526,7 +526,7 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *i=
nst)
>  	/* if this super frame and it is not last sub-frame, get next fb for
>  	 * sub-frame decode
>  	 */
> -	if (vsi->sf_frm_cnt > 0 && vsi->sf_frm_idx !=3D vsi->sf_frm_cnt - 1)
> +	if (vsi->sf_frm_cnt > 0 && vsi->sf_frm_idx !=3D vsi->sf_frm_cnt)
>  		vsi->sf_next_ref_fb_idx =3D vp9_get_sf_ref_fb(inst);
>  }
> =20
> @@ -735,7 +735,7 @@ static void get_free_fb(struct vdec_vp9_inst *inst, s=
truct vdec_fb **out_fb)
> =20
>  static int validate_vsi_array_indexes(struct vdec_vp9_inst *inst,
>  		struct vdec_vp9_vsi *vsi) {
> -	if (vsi->sf_frm_idx >=3D VP9_MAX_FRM_BUF_NUM - 1) {
> +	if (vsi->sf_frm_idx >=3D VP9_MAX_FRM_BUF_NUM) {

nit: I'd propose to define a new maximum (contractions allowed):

  #define VP9_MAX_NUM_SUPER_FRAMES 8

This way you can revisit bunch of `VP9_MAX_FRM_BUF_NUM-1`, and make the ove=
rall
code a bit more human readable. There is no relation between VP9_MAX_FRM_BU=
F_NUM
and this maximum. The limits simply comes from the fact
frames_in_superframe_minus_1 is expressed with 3 bits.

regards,
Nicolas

p.s. your change looks good otherwise.

>  		mtk_vdec_err(inst->ctx, "Invalid vsi->sf_frm_idx=3D%u.", vsi->sf_frm_i=
dx);
>  		return -EIO;
>  	}


