Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A350A54CF9C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 19:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349694AbiFORV1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 13:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346981AbiFORV0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 13:21:26 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB0A22BE0
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 10:21:25 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: nicolas)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 149666601713;
        Wed, 15 Jun 2022 18:21:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1655313684;
        bh=I33Riumivsy9OR/meKZIX1PlcSQxIAu/ubmQySabLnE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=G7um3QVse7r/ukWAbEo1t9keNjgdzFvdI155Fsldi4QWfLmb6fodv593jxAOTB4yp
         6OASBiOMwDTqLSExQh/8KfgX0jaVnAoLVxcWFEfICdKbe+eQdQ7ddBzeIK0RXP+vfc
         4AKsr4G7kOeWITeLevES4lYta3bWDEg0yzkU7pOVC+ZJ3JrNde6LgQUX4bpXvpCUue
         mAcRKbCR3xwpTRPNLIlCTX4gt+KJgXMwYg61VNT52J8W1lrWbt4Fw8Wuwn0f/iA0fT
         jNPaWhcwNRqDqFfsIQsy330ITyAbCXalEbn+ClxJA9OMJAhSiugq5B3lWjpl9f+vtV
         rERmUWbVVJfOA==
Message-ID: <da5af9cb6cf87cabbb53afb300bd2daf579c761d.camel@collabora.com>
Subject: Re: [PATCH] mediatek: vcodec: return EINVAL if plane is too small
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Justin Green <greenjustin@chromium.org>,
        linux-media@vger.kernel.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        mchehab@kernel.org, matthias.bgg@gmail.com, andrescj@chromium.org,
        yunfei.dong@mediatek.com
Date:   Wed, 15 Jun 2022 13:21:13 -0400
In-Reply-To: <20220615153827.4137366-1-greenjustin@chromium.org>
References: <20220615153827.4137366-1-greenjustin@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mercredi 15 juin 2022 =C3=A0 11:38 -0400, Justin Green a =C3=A9crit=C2=
=A0:
> Modify vb2ops_vdec_buf_prepare to return EINVAL if the size of the plane
> is less than the size of the image. Currently we just log an error and
> return 0 anyway, which may cause a buffer overrun bug.
>=20
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> Suggested-by: Andres Calderon Jaramillo <andrescj@chromium.org>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/dr=
ivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 52e5d36aa912..191e13344c53 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -735,6 +735,7 @@ int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
>  			mtk_v4l2_err("data will not fit into plane %d (%lu < %d)",
>  				i, vb2_plane_size(vb, i),
>  				q_data->sizeimage[i]);
> +			return -EINVAL;
>  		}
>  		if (!V4L2_TYPE_IS_OUTPUT(vb->type))
>  			vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);

