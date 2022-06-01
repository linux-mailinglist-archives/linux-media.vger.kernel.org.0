Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0982F53A9B8
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 17:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354898AbiFAPOI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jun 2022 11:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348999AbiFAPOH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jun 2022 11:14:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B5F90CFA
        for <linux-media@vger.kernel.org>; Wed,  1 Jun 2022 08:14:06 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 744D81F44596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1654096444;
        bh=lUHsKvf50AHaOVWK0bLfhNIAXc7K9XGAbVurLDdREhE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=WP8HNlob6R3yCxMoiPBdFrgY96c5WXXUa45yeeDJRUXHG0TjgnTCCsG9fHM4PAFiJ
         EmT7TTLr/EKKMPc95p0uAMzRwZ6Q1ZNKCbzoaaXUeuXONt7Rx7PgkZGEAUKQMDvjMz
         CkAtZNz2HseAFJvfWUzNGttv3zbIEpcZ7XGhYbpU0cNH5BwvBy4p+jVDZQ0bouBQIH
         nuU1YeMr/WASKKlKJn+B13SiFf0HAklgMckkQNd8ElhfiM6G/ZizXI6sKTjDysHmtw
         MEgTeq4dEX9BDyInexdqrnP5pDGHsj39D3VBnM8TbmdHIsbtq6f9cfF8MaHojvx50/
         XvkwtI9RLAYfw==
Message-ID: <92a0163fa2bb20a5c577ca0222e497f0e2bee926.camel@collabora.com>
Subject: Re: [PATCH] mediatek/vcodec: Enable incoherent buffer allocation
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Justin Green <greenjustin@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     linux-media@vger.kernel.org,
        "tiffany.lin@mediatek.com" <tiffany.lin@mediatek.com>,
        "andrew-ct.chen@mediatek.com" <andrew-ct.chen@mediatek.com>,
        mchehab@kernel.org,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Date:   Wed, 01 Jun 2022 11:13:54 -0400
In-Reply-To: <CAHC42RfnEmBzzLpRikJovq6-E-VWf04Wxrc6Go96y5w2MKT2YQ@mail.gmail.com>
References: <CAHC42RegxBFjqMwR2gv8EwqE0FG+oS7QA9rcopapktf7tD_y-g@mail.gmail.com>
         <YpbDJ+PUmUTcOD3n@google.com>
         <CAHC42RfnEmBzzLpRikJovq6-E-VWf04Wxrc6Go96y5w2MKT2YQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Justin,

Le mercredi 01 juin 2022 =C3=A0 10:00 -0400, Justin Green a =C3=A9crit=C2=
=A0:
> Sure thing! Sorry about that, I think something got messed up with the
> tabs. I've switched the "=3D" padding to spaces to spacing to make sure
> everything is consistent. I think the removals part of the diff might
> still look odd on some clients because of the tabs though.

Best practice to to not mix style and functional changes, unless trivial. S=
o if
you want to change the style, add a second patch. Otherwise just maintain t=
he
original style (my recommendation). By the way you can add:

Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

I'd be very interested to learn from Sergey on why this feature wasn't enab=
le
more broadly. I notice though the begin/end access bits have not been
implemented, so when used with DMABuf, this isn't going to behave quite rig=
ht by
default. I also notice that the code make no use of the attached device
dma_coherent flag, so another case were this feature would get some help be=
fore
being generalized.

>=20
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 52e5d36aa912..6a47b34c5bc9 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -929,30 +929,32 @@ int mtk_vcodec_dec_queue_init(void *priv, struct
> vb2_queue *src_vq,
>=20
>   mtk_v4l2_debug(3, "[%d]", ctx->id);
>=20
> - src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> - src_vq->io_modes =3D VB2_DMABUF | VB2_MMAP;
> - src_vq->drv_priv =3D ctx;
> - src_vq->buf_struct_size =3D sizeof(struct mtk_video_dec_buf);
> - src_vq->ops =3D ctx->dev->vdec_pdata->vdec_vb2_ops;
> - src_vq->mem_ops =3D &vb2_dma_contig_memops;
> - src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> - src_vq->lock =3D &ctx->dev->dev_mutex;
> - src_vq->dev             =3D &ctx->dev->plat_dev->dev;
> + src_vq->type              =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> + src_vq->io_modes          =3D VB2_DMABUF | VB2_MMAP;
> + src_vq->drv_priv          =3D ctx;
> + src_vq->buf_struct_size   =3D sizeof(struct mtk_video_dec_buf);
> + src_vq->ops               =3D ctx->dev->vdec_pdata->vdec_vb2_ops;
> + src_vq->mem_ops           =3D &vb2_dma_contig_memops;
> + src_vq->timestamp_flags   =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> + src_vq->lock              =3D &ctx->dev->dev_mutex;
> + src_vq->dev               =3D &ctx->dev->plat_dev->dev;
> + src_vq->allow_cache_hints =3D 1;

As a side effect, you'll only have this line added, no noise around it.

>=20
>   ret =3D vb2_queue_init(src_vq);
>   if (ret) {
>   mtk_v4l2_err("Failed to initialize videobuf2 queue(output)");
>   return ret;
>   }
> - dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> - dst_vq->io_modes =3D VB2_DMABUF | VB2_MMAP;
> - dst_vq->drv_priv =3D ctx;
> - dst_vq->buf_struct_size =3D sizeof(struct mtk_video_dec_buf);
> - dst_vq->ops =3D ctx->dev->vdec_pdata->vdec_vb2_ops;
> - dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> - dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> - dst_vq->lock =3D &ctx->dev->dev_mutex;
> - dst_vq->dev             =3D &ctx->dev->plat_dev->dev;
> + dst_vq->type              =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> + dst_vq->io_modes          =3D VB2_DMABUF | VB2_MMAP;
> + dst_vq->drv_priv          =3D ctx;
> + dst_vq->buf_struct_size   =3D sizeof(struct mtk_video_dec_buf);
> + dst_vq->ops               =3D ctx->dev->vdec_pdata->vdec_vb2_ops;
> + dst_vq->mem_ops           =3D &vb2_dma_contig_memops;
> + dst_vq->timestamp_flags   =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> + dst_vq->lock              =3D &ctx->dev->dev_mutex;
> + dst_vq->dev               =3D &ctx->dev->plat_dev->dev;
> + dst_vq->allow_cache_hints =3D 1;
>=20
>   ret =3D vb2_queue_init(dst_vq);
>   if (ret)

