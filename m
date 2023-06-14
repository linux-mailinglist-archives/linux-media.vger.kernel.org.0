Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0D27303DF
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 17:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236155AbjFNP30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 11:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233272AbjFNP3Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 11:29:25 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938FFC3;
        Wed, 14 Jun 2023 08:29:24 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:c623::7a9])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id ECEB36606F4F;
        Wed, 14 Jun 2023 16:29:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1686756563;
        bh=EwpPaawJ0jLzVbGU6lbdNpBxv2dOVOqXbVeRLYmJrpM=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=SS6KFpNSUEQ21ypiewsTyRCcfKPYRTd9j+btkiu7fW2ZEtoPv3+Sw4tE3U1N4roxu
         qknkA2tBaWdP/oRSaW4//b5aNlUCIF33YpyaYA2RarM3YrjN+vDjyc5WRP9sRop13M
         vPo/8FIsNQbviU5npo5wU5WNZAN2kAmc6XsOKOmjY9IS0KzXwXjTm3ZdO2v61UpbCK
         30J0OAnLOfZsNh8ha5BfnWBRMgnGtGHEvDAZPCx/k1mtDEuqfetVFw5H81X47zEY4Q
         wTQ4BaPR11ZCqq5FdYXJMmHB9kLIbUF8B+aQoZvBm90HQYEUAWO+4CrbnmnUSyM/sT
         erLZ8gjFCDSgw==
Message-ID: <f4a218653814461f02b462ba34cf92682da26bc2.camel@collabora.com>
Subject: Re: [PATCH 2/4] media: mediatek: vcodec: fix resource leaks in
 vdec_msg_queue_init()
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Date:   Wed, 14 Jun 2023 11:29:13 -0400
In-Reply-To: <b8948d9a-65bc-4f3f-aa90-60addd064819@moroto.mountain>
References: <b8948d9a-65bc-4f3f-aa90-60addd064819@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le mercredi 14 juin 2023 =C3=A0 16:06 +0300, Dan Carpenter a =C3=A9crit=C2=
=A0:
> If we encounter any error in the vdec_msg_queue_init() then we need
> to set "msg_queue->wdma_addr.size =3D 0;".  Normally, this is done
> inside the vdec_msg_queue_deinit() function.  However, if the
> first call to allocate &msg_queue->wdma_addr fails, then the
> vdec_msg_queue_deinit() function is a no-op.  For that situation, just
> set the size to zero explicitly and return.
>=20
> There were two other error paths which did not clean up before returning.
> Change those error paths to goto mem_alloc_err.
>=20
> Fixes: b199fe46f35c ("media: mtk-vcodec: Add msg queue feature for lat an=
d core architecture")
> Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 deco=
der")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

This change looks good to me, thanks again for your work.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/dr=
ivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> index 92ac82eb444e..be25d56712d8 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> @@ -307,6 +307,7 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_qu=
eue,
>  	err =3D mtk_vcodec_mem_alloc(ctx, &msg_queue->wdma_addr);
>  	if (err) {
>  		mtk_v4l2_err("failed to allocate wdma_addr buf");
> +		msg_queue->wdma_addr.size =3D 0;
>  		return -ENOMEM;
>  	}
>  	msg_queue->wdma_rptr_addr =3D msg_queue->wdma_addr.dma_addr;
> @@ -338,14 +339,14 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_=
queue,
>  			err =3D mtk_vcodec_mem_alloc(ctx, &lat_buf->rd_mv_addr);
>  			if (err) {
>  				mtk_v4l2_err("failed to allocate rd_mv_addr buf[%d]", i);
> -				return -ENOMEM;
> +				goto mem_alloc_err;
>  			}
> =20
>  			lat_buf->tile_addr.size =3D VDEC_LAT_TILE_SZ;
>  			err =3D mtk_vcodec_mem_alloc(ctx, &lat_buf->tile_addr);
>  			if (err) {
>  				mtk_v4l2_err("failed to allocate tile_addr buf[%d]", i);
> -				return -ENOMEM;
> +				goto mem_alloc_err;
>  			}
>  		}
> =20

