Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6666D239A
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 17:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbjCaPID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 11:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbjCaPIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 11:08:01 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09EA61FD23
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 08:07:47 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id o44so16550585qvo.4
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112; t=1680275266;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A12k4KB7ebXlDgbV8iGTgTpjb9CZpe/iCFGufVrwogk=;
        b=3qdTx722YwxkHAtxvy1VcRPVzeSppIZZUpd4Ue1d6L4glpGtNWvZHh9bVaBSusS8ay
         Wl/pD5Cew3yHVv3hGo/oSWUvINtlUJZoQVQKXSiBh01mPUx2+CAxSokhAAq5jYGGzM/V
         nI5Zk/HzHivGGjtO5vgjUY9yFDmdC/ndrx3ESo4FYCZNkyKoYqAZNBqQrx6BEPQ3LGl7
         PvmUVM1yQ/DokeO9qmNbjZrPVBvLSjkPf5qHBjW6rrfDF7vrxqkzv3ciLgen+XGJkQlO
         jfs8AEVqfZSEVX3h1OfQfKWpgGsEJZ7kiWtuFVrZmTjfGtK2WalmPaotGJoRQzIyT7WX
         vvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680275266;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A12k4KB7ebXlDgbV8iGTgTpjb9CZpe/iCFGufVrwogk=;
        b=cQQ3i50GBwxYjlUyxzGFn7Aps6t1LFl4m7uv2vpeBFfkjf+6Si/gXwa7wAAAzkzKnA
         zueyUlJnaJa92I9vgeOwBd+dVyMfebfLmtDIPrl/dLL9cipip04gX5RfZuUTm2ikqsq+
         yj5HagNukhf2HUiHI1kCYGDszs6SWf0uiGjgQ4kCOruUPSWYVv38y/3E8+yI0SWnhitL
         roBLWTkPJfuLukad/6cBcgvGdgOmglTW1AT+WunxPZqZkfigAFTttDfqJY0401EJzWKx
         TZXZyRpcwGeyM9/tVPnyuqWyQtgnYZsptpjUr5iJOhTaA57Zmvpq4nkZjY6hnM0WMpa7
         3PTg==
X-Gm-Message-State: AAQBX9dq1ulCvam5i+PUSLSPkUvbIaRRmsuNMVlCrf6sJQh3NALttLKu
        qFvWRxiDMuQUVUxewqzkQRurhQ==
X-Google-Smtp-Source: AKy350acTVSkbB/Xv5a/ig05pzT/j5zP0MCg579jrpttL+7LBR8Fa6PYr2Oj2TKovED/UKAXzXvXeQ==
X-Received: by 2002:a05:6214:f0f:b0:56e:a9d4:428a with SMTP id gw15-20020a0562140f0f00b0056ea9d4428amr40684485qvb.1.1680275266127;
        Fri, 31 Mar 2023 08:07:46 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:a07e::580])
        by smtp.gmail.com with ESMTPSA id mn7-20020a0562145ec700b005dd8b93459fsm657878qvb.55.2023.03.31.08.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 08:07:45 -0700 (PDT)
Message-ID: <1f1a5acbd8951cfec250b78fff5a9fec731c3488.camel@ndufresne.ca>
Subject: Re: [RFC PATCH] media: hantro: respect data_offset in vb2_plane
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        mtr@pengutronix.de
Date:   Fri, 31 Mar 2023 11:07:44 -0400
In-Reply-To: <20230327132324.1781416-1-m.tretter@pengutronix.de>
References: <20230327132324.1781416-1-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Micheal,

Le lundi 27 mars 2023 =C3=A0 15:23 +0200, Michael Tretter a =C3=A9crit=C2=
=A0:
> The vb2_plane in the vb2_v4l2_buffer may have a data_offset, which is
> written by user space to tell the driver that the data starts at an
> offset into the buffer. Currently the hantro driver assumes that the
> data starts directly at the base address of the buffer.
>=20
> Add the data_offset to the plane dma_address to make sure that the
> encoder actually reads the plane data if the user space put the plane
> data at an offset into the buffer. Otherwise the encoded data may not be
> the data that userspace expected to be encoded.
>=20

The data_offset for this purpose have limited use, and this usage is only v=
alid
for encoders (OUTPUT queues). Would it be possible to state this clearly in=
 the
subject ?

>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Hi,
>=20
> Most other drivers also assume that the address returned by
> vb2_dma_contig_plane_dma_addr() is the start of the plane data. Maybe it
> would be better to change vb2_dma_contig_plane_dma_addr() to already add
> the data_offset to the plane address. However, there are a few drivers
> that already have a helper that respects the data_offset, but that seems
> to be the exception rather than the rule.

I had this discussion recently, and its a bit hardware specific. Some HW ma=
y
support any random offset, in which case you will program the original (and
aligned) address, and program the offset in the HW. But some HW may not, in
which case you need to add alignment validation in the driver.

>=20
> What I am actually trying to achieve is to import a V4L2_PIX_FMT_NV12
> buffer from a Rockchip RGA2 (which doesn't support the multi-planar API)
> as a V4L2_PIX_FMT_NV12M buffer into the Hantro JPEG encoder (which
> doesn't support V4L2_PIX_FMT_NV12). Solving this by importing the same
> FD for each plane with a respective offset is how one would import such
> a buffer with the DRM API. Please tell me, if my approach is wrong and,
> if so, how I should solve it differently.

The approach is fine, this is the only valid usage of data_offset when pass=
ed by
userspace. Though, you are making your live much more difficult then needed=
,
adding NV12 (contiguous) support to the jpeg encoder should be fairly easy =
too.

>=20
> Michael
> ---
>  .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c   | 24 +++++++++++++------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc=
.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> index 8395c4d48dd0..05df7768187d 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
> @@ -32,6 +32,16 @@
> =20
>  #define VEPU_JPEG_QUANT_TABLE_COUNT 16
> =20
> +static dma_addr_t rockchip_vpu2_plane_dma_addr(struct vb2_buffer *vb,
> +					       unsigned int plane_no)
> +{
> +	struct vb2_v4l2_buffer *v4l2_buf =3D to_vb2_v4l2_buffer(vb);
> +	dma_addr_t base =3D vb2_dma_contig_plane_dma_addr(vb, plane_no);
> +	unsigned int offset =3D v4l2_buf->planes[plane_no].data_offset;
> +
> +	return base + offset;

As the offset is not being passed as a control to the HW, you need to go ba=
ck to
the datasheet, and figure-out what is the required alignment. This aligment=
 then
needs to be validated. I don't know the exact answer for you, we don't chec=
k the
dma address because they are all page aligned, so its not needed.

If the alignment is not acceptable, you have to fail synchronously in
VIDIOC_QBUF, so that userspace knows and can fallback to copy.

> +}
> +
>  static void rockchip_vpu2_set_src_img_ctrl(struct hantro_dev *vpu,
>  					   struct hantro_ctx *ctx)
>  {
> @@ -79,23 +89,23 @@ static void rockchip_vpu2_jpeg_enc_set_buffers(struct=
 hantro_dev *vpu,
> =20
>  	WARN_ON(pix_fmt->num_planes > 3);
> =20
> -	vepu_write_relaxed(vpu, vb2_dma_contig_plane_dma_addr(dst_buf, 0) +
> +	vepu_write_relaxed(vpu, rockchip_vpu2_plane_dma_addr(dst_buf, 0) +
>  				ctx->vpu_dst_fmt->header_size,
>  			   VEPU_REG_ADDR_OUTPUT_STREAM);
>  	vepu_write_relaxed(vpu, size_left, VEPU_REG_STR_BUF_LIMIT);
> =20
>  	if (pix_fmt->num_planes =3D=3D 1) {
> -		src[0] =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
> +		src[0] =3D rockchip_vpu2_plane_dma_addr(src_buf, 0);
>  		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
>  	} else if (pix_fmt->num_planes =3D=3D 2) {
> -		src[0] =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
> -		src[1] =3D vb2_dma_contig_plane_dma_addr(src_buf, 1);
> +		src[0] =3D rockchip_vpu2_plane_dma_addr(src_buf, 0);
> +		src[1] =3D rockchip_vpu2_plane_dma_addr(src_buf, 1);
>  		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
>  		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
>  	} else {
> -		src[0] =3D vb2_dma_contig_plane_dma_addr(src_buf, 0);
> -		src[1] =3D vb2_dma_contig_plane_dma_addr(src_buf, 1);
> -		src[2] =3D vb2_dma_contig_plane_dma_addr(src_buf, 2);
> +		src[0] =3D rockchip_vpu2_plane_dma_addr(src_buf, 0);
> +		src[1] =3D rockchip_vpu2_plane_dma_addr(src_buf, 1);
> +		src[2] =3D rockchip_vpu2_plane_dma_addr(src_buf, 2);
>  		vepu_write_relaxed(vpu, src[0], VEPU_REG_ADDR_IN_PLANE_0);
>  		vepu_write_relaxed(vpu, src[1], VEPU_REG_ADDR_IN_PLANE_1);
>  		vepu_write_relaxed(vpu, src[2], VEPU_REG_ADDR_IN_PLANE_2);

