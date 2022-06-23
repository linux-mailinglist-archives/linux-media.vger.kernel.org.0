Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89C0A55894C
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 21:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbiFWTlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 15:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiFWTk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 15:40:59 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3731900F
        for <linux-media@vger.kernel.org>; Thu, 23 Jun 2022 12:31:47 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca [66.171.169.34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 151CB66017E1;
        Thu, 23 Jun 2022 20:31:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1656012705;
        bh=aJYMdIVamDoLW9V7AEVtgOUECNl26CyuhJCTzfPS0fU=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=T4fLSjAeWYwB6Sy3Qio2dn+yrTgVTlkYSvHf1bNE1ZDKEmMvJ3JagKC0GeXQOztIR
         wpq1/JUMg3M6irycAQSB3JYXkWnnlje9/hhue6BXmY66v/ZyLYpQuY3O+GCNfwPtbl
         mFCZs6GRVowAbB+w+ZRRVF+DX8kZdMserGeHL44e/xK4uxD4PfvRaOVXI/kBLeel4h
         9Drvy1dARYs2Z66S5zf1617ihbxrZV0CZ5tX7HxY9P+v+FoUQQyZw/plA5TwIqBn2z
         hcQEsi0sJS6+gXnP3W1wv81Gyx0q0NVvBTwPuxUu1yw63hzJUwOcpjxBHt8iLSmAap
         T0Exngtb48Jww==
Message-ID: <1e1e8934915380ebcf0a1d2af11ef8f54bc2c28a.camel@collabora.com>
Subject: Re: [PATCH] mediatek/jpeg: validate data_offsets for v4l2 planes
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Justin Green <greenjustin@chromium.org>,
        linux-media@vger.kernel.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        mchehab@kernel.org, matthias.bgg@gmail.com, andrescj@chromium.org,
        yunfei.dong@mediatek.com, Justin Green <greenjustin@google.com>
Date:   Thu, 23 Jun 2022 15:31:36 -0400
In-Reply-To: <20220623191422.1157518-1-greenjustin@chromium.org>
References: <20220623191422.1157518-1-greenjustin@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 23 juin 2022 =C3=A0 15:14 -0400, Justin Green a =C3=A9crit=C2=A0:
> Validate V4L2 plane data_offset values. We need to make sure the size of
> the image we're encoding does not exceed the size of the buffer minus
> its offset.
>=20
> Signed-off-by: Justin Green <greenjustin@google.com>
> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index bc5b0a0168ec..8f5c1b9937bc 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -687,6 +687,10 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *v=
b)
> =20
>  	for (i =3D 0; i < q_data->fmt->colplanes; i++) {
>  		plane_fmt =3D q_data->pix_mp.plane_fmt[i];
> +                if (vb->planes[i].data_offset > vb2_plane_size(vb, i) ||
> +                    vb2_plane_size(vb, i) - vb->planes[i].data_offset
> +                    < plane_fmt.sizeimage)
> +                    return -EINVAL;

Just double checking, but has data_offset been verified already to prevent =
the
underflow ?

>  		if (ctx->enable_exif &&
>  		    q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
>  			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +

