Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1454679D4E
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 16:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234650AbjAXPV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 10:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234617AbjAXPV5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 10:21:57 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F0BEC62
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 07:21:52 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id q15so13346383qtn.0
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 07:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bFtQtLadQA2ObcCEDcCQRG86nPrii76lpgh8cpV608w=;
        b=M39BAm0x1RztCQqVhf/0+ID8Gg2xQ78qACXZjlCdw8RUM5yu1MuJD4qBdr5s05rn41
         AEZ3YbVKNMS8U9G+RW8OZTg49sw6mGSo5f9q9uSRgGs9sI7qNwUL0akHRchXjj7HP7Qm
         NFQLuYsRqBLywh4P7PQ1SsMERkaZBhDsIUjpLoUgtlTbm0f9L8iUeLwUS/BGkaGiDM/X
         2ABXo4iGwQ2hZFtFErqAWCQEocxVMQZjkSMdePNOcGClDlQzKkGJBbDtPwAc6NeGDQCq
         SVRnb7xMPMQeuFtnsiI+5+JXQKxs1qW7WMMsKFlSXEXt29yjJEHpQ45BVfJXMjfkC81l
         nyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bFtQtLadQA2ObcCEDcCQRG86nPrii76lpgh8cpV608w=;
        b=M/fc3ULnFGErPu0f+OvvoplGRjRWbfNYVvRZg0aiO3AG/eGkFbLEUKV2fagX6IAiN9
         Ssg1rvgztrT1Dru8q9SXlCBDkvP6/lxDQzRzMMuB1MZxQACC8rPlnBlqhAtJY3Qusxtc
         yuSe/CEZWal8WxSMGvWXIN/Jmnyb4wAc/oeWsFU9KQeTvTEPpwgcJHWCGYpC5HeLbwV9
         eQIEQIg+omAjr38NwJA78wmCdy79UQL1vrrYWjjvrrr0bDgqUpCz4qagPqm0ahCofz+A
         5ei7FJ7hZDEYxYElUOYcXowR8M7YXnMse5HFzPPKD2GMweoKjVCOynZSmT9y3KwNmvbk
         x7mw==
X-Gm-Message-State: AFqh2kpRW+nKV4F5FfvftOr6GW3730FGj+qEmh8s7We/bNJu/kWDAKbG
        4GqKwAtmo17AmDN14cwIs+eBVzF4jICGiQEYKcw=
X-Google-Smtp-Source: AMrXdXtSUsvDcDMy39sAFtjgmmenhdJfbJjeprDK80NlfaErNGRRy61YhjLOSVPt+0EprC9CKD2J8w==
X-Received: by 2002:a05:622a:4816:b0:3b6:2b4f:aad5 with SMTP id fb22-20020a05622a481600b003b62b4faad5mr45652021qtb.0.1674573711244;
        Tue, 24 Jan 2023 07:21:51 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id o3-20020ac80243000000b003a6a19ee4f0sm1412209qtg.33.2023.01.24.07.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 07:21:50 -0800 (PST)
Message-ID: <6ff68c4bea9d48980853e9af9db1fc0bf13976ae.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/2] media: meson: vdec: implement 10bit bitstream
 handling
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Christian Hewitt <christianshewitt@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Benjamin Roszak <benjamin545@gmail.com>
Date:   Tue, 24 Jan 2023 10:21:49 -0500
In-Reply-To: <20230124034058.3407235-2-christianshewitt@gmail.com>
References: <20230124034058.3407235-1-christianshewitt@gmail.com>
         <20230124034058.3407235-2-christianshewitt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Le mardi 24 janvier 2023 =C3=A0 03:40 +0000, Christian Hewitt a =C3=A9crit=
=C2=A0:
> From: Benjamin Roszak <benjamin545@gmail.com>
>=20
> In order to support 10bit bitstream decoding, buffers and MMU
> handling must be cleaned up to support either downscale output
> from compressed 10bit decoding to uncompressed 8bit NV12 output
> or to compressed 10bit proprietary encoded frame format.

I understand this is step forward, and agree with the patches in general, t=
hough
I'd like to know if we can expect 10bit secondary buffers in the future ? O=
r is
the AMFBC that only 10bit format supported ? Should be expect the 10bit for=
mat
definition to be added later ?

>=20
> For that, "am21c" name is moved to "amfbc" to reflect the upstream
> Amlogic Compressed framebuffer modifier naming.
>=20
> Compressed frame buffers allocation is also cleaned up so it
> can be shared with the HEVC decoder implementation.
>=20
> Signed-off-by: Benjamin Roszak <benjamin545@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/codec_h264.c |   3 +-
>  .../media/meson/vdec/codec_hevc_common.c      | 161 +++++++++++-------
>  .../media/meson/vdec/codec_hevc_common.h      |   3 +-
>  drivers/staging/media/meson/vdec/codec_vp9.c  |  35 ++--
>  drivers/staging/media/meson/vdec/esparser.c   |   1 +
>  drivers/staging/media/meson/vdec/vdec.h       |   1 +
>  .../staging/media/meson/vdec/vdec_helpers.c   |  44 +++--
>  .../staging/media/meson/vdec/vdec_helpers.h   |  10 +-
>  8 files changed, 161 insertions(+), 97 deletions(-)
>=20
> diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/stag=
ing/media/meson/vdec/codec_h264.c
> index c61128fc4bb9..d53c9a464bde 100644
> --- a/drivers/staging/media/meson/vdec/codec_h264.c
> +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> @@ -353,7 +353,8 @@ static void codec_h264_src_change(struct amvdec_sessi=
on *sess)
>  		frame_width, frame_height, crop_right, crop_bottom);
> =20
>  	codec_h264_set_par(sess);
> -	amvdec_src_change(sess, frame_width, frame_height, h264->max_refs + 5);
> +	amvdec_src_change(sess, frame_width, frame_height,
> +			  h264->max_refs + 5, 8);
>  }
> =20
>  /*
> diff --git a/drivers/staging/media/meson/vdec/codec_hevc_common.c b/drive=
rs/staging/media/meson/vdec/codec_hevc_common.c
> index 0315cc0911cd..1c74b4837dcb 100644
> --- a/drivers/staging/media/meson/vdec/codec_hevc_common.c
> +++ b/drivers/staging/media/meson/vdec/codec_hevc_common.c
> @@ -30,8 +30,11 @@ const u16 vdec_hevc_parser_cmd[] =3D {
>  void codec_hevc_setup_decode_head(struct amvdec_session *sess, int is_10=
bit)
>  {
>  	struct amvdec_core *core =3D sess->core;
> -	u32 body_size =3D amvdec_am21c_body_size(sess->width, sess->height);
> -	u32 head_size =3D amvdec_am21c_head_size(sess->width, sess->height);
> +	u32 use_mmu =3D codec_hevc_use_mmu(core->platform->revision,
> +					 sess->pixfmt_cap, is_10bit);
> +	u32 body_size =3D amvdec_amfbc_body_size(sess->width, sess->height,
> +					       is_10bit, use_mmu);
> +	u32 head_size =3D amvdec_amfbc_head_size(sess->width, sess->height);
> =20
>  	if (!codec_hevc_use_fbc(sess->pixfmt_cap, is_10bit)) {
>  		/* Enable 2-plane reference read mode */
> @@ -39,9 +42,17 @@ void codec_hevc_setup_decode_head(struct amvdec_sessio=
n *sess, int is_10bit)
>  		return;
>  	}
> =20
> +	/* enable mem saving mode for 8-bit */
> +	if (!is_10bit)
> +		amvdec_write_dos_bits(core, HEVC_SAO_CTRL5, BIT(9));
> +	else
> +		amvdec_clear_dos_bits(core, HEVC_SAO_CTRL5, BIT(9));
> +
>  	if (codec_hevc_use_mmu(core->platform->revision,
>  			       sess->pixfmt_cap, is_10bit))
>  		amvdec_write_dos(core, HEVCD_MPP_DECOMP_CTL1, BIT(4));
> +	else if (!is_10bit)
> +		amvdec_write_dos(core, HEVCD_MPP_DECOMP_CTL1, BIT(3));
>  	else
>  		amvdec_write_dos(core, HEVCD_MPP_DECOMP_CTL1, 0);
> =20
> @@ -73,7 +84,7 @@ static void codec_hevc_setup_buffers_gxbb(struct amvdec=
_session *sess,
> =20
>  		idx =3D vb->index;
> =20
> -		if (codec_hevc_use_downsample(sess->pixfmt_cap, is_10bit))
> +		if (codec_hevc_use_fbc(sess->pixfmt_cap, is_10bit))
>  			buf_y_paddr =3D comm->fbc_buffer_paddr[idx];
>  		else
>  			buf_y_paddr =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> @@ -114,8 +125,8 @@ static void codec_hevc_setup_buffers_gxl(struct amvde=
c_session *sess,
>  {
>  	struct amvdec_core *core =3D sess->core;
>  	struct v4l2_m2m_buffer *buf;
> -	u32 revision =3D core->platform->revision;
>  	u32 pixfmt_cap =3D sess->pixfmt_cap;
> +	const u32 revision =3D core->platform->revision;
>  	int i;
> =20
>  	amvdec_write_dos(core, HEVCD_MPP_ANC2AXI_TBL_CONF_ADDR,
> @@ -127,12 +138,14 @@ static void codec_hevc_setup_buffers_gxl(struct amv=
dec_session *sess,
>  		dma_addr_t buf_uv_paddr =3D 0;
>  		u32 idx =3D vb->index;
> =20
> -		if (codec_hevc_use_mmu(revision, pixfmt_cap, is_10bit))
> -			buf_y_paddr =3D comm->mmu_header_paddr[idx];
> -		else if (codec_hevc_use_downsample(pixfmt_cap, is_10bit))
> -			buf_y_paddr =3D comm->fbc_buffer_paddr[idx];
> -		else
> +		if (codec_hevc_use_downsample(pixfmt_cap, is_10bit)) {
> +			if (codec_hevc_use_mmu(revision, pixfmt_cap, is_10bit))
> +				buf_y_paddr =3D comm->mmu_header_paddr[idx];
> +			else
> +				buf_y_paddr =3D comm->fbc_buffer_paddr[idx];
> +		} else {
>  			buf_y_paddr =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> +		}
> =20
>  		amvdec_write_dos(core, HEVCD_MPP_ANC2AXI_TBL_DATA,
>  				 buf_y_paddr >> 5);
> @@ -150,60 +163,67 @@ static void codec_hevc_setup_buffers_gxl(struct amv=
dec_session *sess,
>  		amvdec_write_dos(core, HEVCD_MPP_ANC_CANVAS_DATA_ADDR, 0);
>  }
> =20
> -void codec_hevc_free_fbc_buffers(struct amvdec_session *sess,
> +void codec_hevc_free_mmu_headers(struct amvdec_session *sess,
>  				 struct codec_hevc_common *comm)
>  {
>  	struct device *dev =3D sess->core->dev;
> -	u32 am21_size =3D amvdec_am21c_size(sess->width, sess->height);
>  	int i;
> =20
>  	for (i =3D 0; i < MAX_REF_PIC_NUM; ++i) {
> -		if (comm->fbc_buffer_vaddr[i]) {
> -			dma_free_coherent(dev, am21_size,
> -					  comm->fbc_buffer_vaddr[i],
> -					  comm->fbc_buffer_paddr[i]);
> -			comm->fbc_buffer_vaddr[i] =3D NULL;
> +		if (comm->mmu_header_vaddr[i]) {
> +			dma_free_coherent(dev, MMU_COMPRESS_HEADER_SIZE,
> +					  comm->mmu_header_vaddr[i],
> +					  comm->mmu_header_paddr[i]);
> +			comm->mmu_header_vaddr[i] =3D NULL;
>  		}
>  	}
>  }
> -EXPORT_SYMBOL_GPL(codec_hevc_free_fbc_buffers);
> +EXPORT_SYMBOL_GPL(codec_hevc_free_mmu_headers);
> =20
> -static int codec_hevc_alloc_fbc_buffers(struct amvdec_session *sess,
> +static int codec_hevc_alloc_mmu_headers(struct amvdec_session *sess,
>  					struct codec_hevc_common *comm)
>  {
>  	struct device *dev =3D sess->core->dev;
>  	struct v4l2_m2m_buffer *buf;
> -	u32 am21_size =3D amvdec_am21c_size(sess->width, sess->height);
> =20
>  	v4l2_m2m_for_each_dst_buf(sess->m2m_ctx, buf) {
>  		u32 idx =3D buf->vb.vb2_buf.index;
>  		dma_addr_t paddr;
> -		void *vaddr =3D dma_alloc_coherent(dev, am21_size, &paddr,
> -						 GFP_KERNEL);
> +		void *vaddr =3D dma_alloc_coherent(dev, MMU_COMPRESS_HEADER_SIZE,
> +						 &paddr, GFP_KERNEL);
>  		if (!vaddr) {
> -			codec_hevc_free_fbc_buffers(sess, comm);
> +			codec_hevc_free_mmu_headers(sess, comm);
>  			return -ENOMEM;
>  		}
> =20
> -		comm->fbc_buffer_vaddr[idx] =3D vaddr;
> -		comm->fbc_buffer_paddr[idx] =3D paddr;
> +		comm->mmu_header_vaddr[idx] =3D vaddr;
> +		comm->mmu_header_paddr[idx] =3D paddr;
>  	}
> =20
>  	return 0;
>  }
> =20
> -void codec_hevc_free_mmu_headers(struct amvdec_session *sess,
> +void codec_hevc_free_fbc_buffers(struct amvdec_session *sess,
>  				 struct codec_hevc_common *comm)
>  {
>  	struct device *dev =3D sess->core->dev;
> +	u32 use_mmu;
> +	u32 am21_size;
>  	int i;
> =20
> +	use_mmu =3D codec_hevc_use_mmu(sess->core->platform->revision,
> +				     sess->pixfmt_cap,
> +				sess->bitdepth =3D=3D 10 ? 1 : 0);
> +
> +	am21_size =3D amvdec_amfbc_size(sess->width, sess->height,
> +				      sess->bitdepth =3D=3D 10 ? 1 : 0, use_mmu);
> +
>  	for (i =3D 0; i < MAX_REF_PIC_NUM; ++i) {
> -		if (comm->mmu_header_vaddr[i]) {
> -			dma_free_coherent(dev, MMU_COMPRESS_HEADER_SIZE,
> -					  comm->mmu_header_vaddr[i],
> -					  comm->mmu_header_paddr[i]);
> -			comm->mmu_header_vaddr[i] =3D NULL;
> +		if (comm->fbc_buffer_vaddr[i]) {
> +			dma_free_coherent(dev, am21_size,
> +					  comm->fbc_buffer_vaddr[i],
> +					  comm->fbc_buffer_paddr[i]);
> +			comm->fbc_buffer_vaddr[i] =3D NULL;
>  		}
>  	}
> =20
> @@ -213,33 +233,50 @@ void codec_hevc_free_mmu_headers(struct amvdec_sess=
ion *sess,
>  				  comm->mmu_map_paddr);
>  		comm->mmu_map_vaddr =3D NULL;
>  	}
> +
> +	codec_hevc_free_mmu_headers(sess, comm);
>  }
> -EXPORT_SYMBOL_GPL(codec_hevc_free_mmu_headers);
> +EXPORT_SYMBOL_GPL(codec_hevc_free_fbc_buffers);
> =20
> -static int codec_hevc_alloc_mmu_headers(struct amvdec_session *sess,
> +static int codec_hevc_alloc_fbc_buffers(struct amvdec_session *sess,
>  					struct codec_hevc_common *comm)
>  {
>  	struct device *dev =3D sess->core->dev;
>  	struct v4l2_m2m_buffer *buf;
> +	u32 use_mmu;
> +	u32 am21_size;
> +	const u32 revision =3D sess->core->platform->revision;
> +	const u32 is_10bit =3D sess->bitdepth =3D=3D 10 ? 1 : 0;
> +	int ret;
> =20
> -	comm->mmu_map_vaddr =3D dma_alloc_coherent(dev, MMU_MAP_SIZE,
> -						 &comm->mmu_map_paddr,
> -						 GFP_KERNEL);
> -	if (!comm->mmu_map_vaddr)
> -		return -ENOMEM;
> +	use_mmu =3D codec_hevc_use_mmu(revision, sess->pixfmt_cap,
> +				     is_10bit);
> +
> +	am21_size =3D amvdec_amfbc_size(sess->width, sess->height,
> +				      is_10bit, use_mmu);
> =20
>  	v4l2_m2m_for_each_dst_buf(sess->m2m_ctx, buf) {
>  		u32 idx =3D buf->vb.vb2_buf.index;
>  		dma_addr_t paddr;
> -		void *vaddr =3D dma_alloc_coherent(dev, MMU_COMPRESS_HEADER_SIZE,
> -						 &paddr, GFP_KERNEL);
> +
> +		void *vaddr =3D dma_alloc_coherent(dev, am21_size, &paddr,
> +						 GFP_KERNEL);
>  		if (!vaddr) {
> -			codec_hevc_free_mmu_headers(sess, comm);
> +			codec_hevc_free_fbc_buffers(sess, comm);
>  			return -ENOMEM;
>  		}
> =20
> -		comm->mmu_header_vaddr[idx] =3D vaddr;
> -		comm->mmu_header_paddr[idx] =3D paddr;
> +		comm->fbc_buffer_vaddr[idx] =3D vaddr;
> +		comm->fbc_buffer_paddr[idx] =3D paddr;
> +	}
> +
> +	if (codec_hevc_use_mmu(revision, sess->pixfmt_cap, is_10bit) &&
> +	    codec_hevc_use_downsample(sess->pixfmt_cap, is_10bit)) {
> +		ret =3D codec_hevc_alloc_mmu_headers(sess, comm);
> +		if (ret) {
> +			codec_hevc_free_fbc_buffers(sess, comm);
> +			return ret;
> +		}
>  	}
> =20
>  	return 0;
> @@ -250,21 +287,24 @@ int codec_hevc_setup_buffers(struct amvdec_session =
*sess,
>  			     int is_10bit)
>  {
>  	struct amvdec_core *core =3D sess->core;
> +	struct device *dev =3D core->dev;
>  	int ret;
> =20
> -	if (codec_hevc_use_downsample(sess->pixfmt_cap, is_10bit)) {
> -		ret =3D codec_hevc_alloc_fbc_buffers(sess, comm);
> -		if (ret)
> -			return ret;
> +	if (codec_hevc_use_mmu(core->platform->revision,
> +			       sess->pixfmt_cap, is_10bit)) {
> +		comm->mmu_map_vaddr =3D dma_alloc_coherent(dev, MMU_MAP_SIZE,
> +							 &comm->mmu_map_paddr,
> +							 GFP_KERNEL);
> +		if (!comm->mmu_map_vaddr)
> +			return -ENOMEM;
>  	}
> =20
>  	if (codec_hevc_use_mmu(core->platform->revision,
> -			       sess->pixfmt_cap, is_10bit)) {
> -		ret =3D codec_hevc_alloc_mmu_headers(sess, comm);
> -		if (ret) {
> -			codec_hevc_free_fbc_buffers(sess, comm);
> +			       sess->pixfmt_cap, is_10bit) ||
> +	    codec_hevc_use_downsample(sess->pixfmt_cap, is_10bit)) {
> +		ret =3D codec_hevc_alloc_fbc_buffers(sess, comm);
> +		if (ret)
>  			return ret;
> -		}
>  	}
> =20
>  	if (core->platform->revision =3D=3D VDEC_REVISION_GXBB)
> @@ -278,19 +318,24 @@ EXPORT_SYMBOL_GPL(codec_hevc_setup_buffers);
> =20
>  void codec_hevc_fill_mmu_map(struct amvdec_session *sess,
>  			     struct codec_hevc_common *comm,
> -			     struct vb2_buffer *vb)
> +			     struct vb2_buffer *vb,
> +			     u32 is_10bit)
>  {
> -	u32 size =3D amvdec_am21c_size(sess->width, sess->height);
> -	u32 nb_pages =3D size / PAGE_SIZE;
> +	u32 use_mmu;
> +	u32 size;
> +	u32 nb_pages;
>  	u32 *mmu_map =3D comm->mmu_map_vaddr;
>  	u32 first_page;
>  	u32 i;
> =20
> -	if (sess->pixfmt_cap =3D=3D V4L2_PIX_FMT_NV12M)
> -		first_page =3D comm->fbc_buffer_paddr[vb->index] >> PAGE_SHIFT;
> -	else
> -		first_page =3D vb2_dma_contig_plane_dma_addr(vb, 0) >> PAGE_SHIFT;
> +	use_mmu =3D codec_hevc_use_mmu(sess->core->platform->revision,
> +				     sess->pixfmt_cap, is_10bit);
> +
> +	size =3D amvdec_amfbc_size(sess->width, sess->height, is_10bit,
> +				 use_mmu);
> =20
> +	nb_pages =3D size / PAGE_SIZE;
> +	first_page =3D comm->fbc_buffer_paddr[vb->index] >> PAGE_SHIFT;
>  	for (i =3D 0; i < nb_pages; ++i)
>  		mmu_map[i] =3D first_page + i;
>  }
> diff --git a/drivers/staging/media/meson/vdec/codec_hevc_common.h b/drive=
rs/staging/media/meson/vdec/codec_hevc_common.h
> index cf072b8a9da2..13f9f1d90a94 100644
> --- a/drivers/staging/media/meson/vdec/codec_hevc_common.h
> +++ b/drivers/staging/media/meson/vdec/codec_hevc_common.h
> @@ -64,6 +64,7 @@ int codec_hevc_setup_buffers(struct amvdec_session *ses=
s,
> =20
>  void codec_hevc_fill_mmu_map(struct amvdec_session *sess,
>  			     struct codec_hevc_common *comm,
> -			     struct vb2_buffer *vb);
> +			     struct vb2_buffer *vb,
> +			     u32 is_10bit);
> =20
>  #endif
> diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/stagi=
ng/media/meson/vdec/codec_vp9.c
> index 394df5761556..8e3bbf0db4b3 100644
> --- a/drivers/staging/media/meson/vdec/codec_vp9.c
> +++ b/drivers/staging/media/meson/vdec/codec_vp9.c
> @@ -458,12 +458,6 @@ struct codec_vp9 {
>  	struct list_head ref_frames_list;
>  	u32 frames_num;
> =20
> -	/* In case of downsampling (decoding with FBC but outputting in NV12M),
> -	 * we need to allocate additional buffers for FBC.
> -	 */
> -	void      *fbc_buffer_vaddr[MAX_REF_PIC_NUM];
> -	dma_addr_t fbc_buffer_paddr[MAX_REF_PIC_NUM];
> -
>  	int ref_frame_map[REF_FRAMES];
>  	int next_ref_frame_map[REF_FRAMES];
>  	struct vp9_frame *frame_refs[REFS_PER_FRAME];
> @@ -901,11 +895,8 @@ static void codec_vp9_set_sao(struct amvdec_session =
*sess,
>  		buf_y_paddr =3D
>  		       vb2_dma_contig_plane_dma_addr(vb, 0);
> =20
> -	if (codec_hevc_use_fbc(sess->pixfmt_cap, vp9->is_10bit)) {
> -		val =3D amvdec_read_dos(core, HEVC_SAO_CTRL5) & ~0xff0200;
> -		amvdec_write_dos(core, HEVC_SAO_CTRL5, val);
> +	if (codec_hevc_use_fbc(sess->pixfmt_cap, vp9->is_10bit))
>  		amvdec_write_dos(core, HEVC_CM_BODY_START_ADDR, buf_y_paddr);
> -	}
> =20
>  	if (sess->pixfmt_cap =3D=3D V4L2_PIX_FMT_NV12M) {
>  		buf_y_paddr =3D
> @@ -920,8 +911,13 @@ static void codec_vp9_set_sao(struct amvdec_session =
*sess,
> =20
>  	if (codec_hevc_use_mmu(core->platform->revision, sess->pixfmt_cap,
>  			       vp9->is_10bit)) {
> -		amvdec_write_dos(core, HEVC_CM_HEADER_START_ADDR,
> -				 vp9->common.mmu_header_paddr[vb->index]);
> +		dma_addr_t header_adr;
> +
> +		if (codec_hevc_use_downsample(sess->pixfmt_cap, vp9->is_10bit))
> +			header_adr =3D vp9->common.mmu_header_paddr[vb->index];
> +		else
> +			header_adr =3D vb2_dma_contig_plane_dma_addr(vb, 0);
> +		amvdec_write_dos(core, HEVC_CM_HEADER_START_ADDR, header_adr);
>  		/* use HEVC_CM_HEADER_START_ADDR */
>  		amvdec_write_dos_bits(core, HEVC_SAO_CTRL5, BIT(10));
>  	}
> @@ -1148,9 +1144,13 @@ static void codec_vp9_set_mc(struct amvdec_session=
 *sess,
>  {
>  	struct amvdec_core *core =3D sess->core;
>  	u32 scale =3D 0;
> +	u32 use_mmu;
>  	u32 sz;
>  	int i;
> =20
> +	use_mmu =3D codec_hevc_use_mmu(core->platform->revision,
> +				     sess->pixfmt_cap, vp9->is_10bit);
> +
>  	amvdec_write_dos(core, HEVCD_MPP_ANC_CANVAS_ACCCONFIG_ADDR, 1);
>  	codec_vp9_set_refs(sess, vp9);
>  	amvdec_write_dos(core, HEVCD_MPP_ANC_CANVAS_ACCCONFIG_ADDR,
> @@ -1166,8 +1166,9 @@ static void codec_vp9_set_mc(struct amvdec_session =
*sess,
>  		    vp9->frame_refs[i]->height !=3D vp9->height)
>  			scale =3D 1;
> =20
> -		sz =3D amvdec_am21c_body_size(vp9->frame_refs[i]->width,
> -					    vp9->frame_refs[i]->height);
> +		sz =3D amvdec_amfbc_body_size(vp9->frame_refs[i]->width,
> +					    vp9->frame_refs[i]->height,
> +					    vp9->is_10bit, use_mmu);
> =20
>  		amvdec_write_dos(core, VP9D_MPP_REFINFO_DATA,
>  				 vp9->frame_refs[i]->width);
> @@ -1283,7 +1284,8 @@ static void codec_vp9_process_frame(struct amvdec_s=
ession *sess)
>  	if (codec_hevc_use_mmu(core->platform->revision, sess->pixfmt_cap,
>  			       vp9->is_10bit))
>  		codec_hevc_fill_mmu_map(sess, &vp9->common,
> -					&vp9->cur_frame->vbuf->vb2_buf);
> +					&vp9->cur_frame->vbuf->vb2_buf,
> +					vp9->is_10bit);
> =20
>  	intra_only =3D param->p.show_frame ? 0 : param->p.intra_only;
> =20
> @@ -2130,7 +2132,8 @@ static irqreturn_t codec_vp9_threaded_isr(struct am=
vdec_session *sess)
> =20
>  	codec_vp9_fetch_rpm(sess);
>  	if (codec_vp9_process_rpm(vp9)) {
> -		amvdec_src_change(sess, vp9->width, vp9->height, 16);
> +		amvdec_src_change(sess, vp9->width, vp9->height, 16,
> +				  vp9->is_10bit ? 10 : 8);
> =20
>  		/* No frame is actually processed */
>  		vp9->cur_frame =3D NULL;
> diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/stagin=
g/media/meson/vdec/esparser.c
> index 1904d58875ad..3cd29ab4f979 100644
> --- a/drivers/staging/media/meson/vdec/esparser.c
> +++ b/drivers/staging/media/meson/vdec/esparser.c
> @@ -320,6 +320,7 @@ esparser_queue(struct amvdec_session *sess, struct vb=
2_v4l2_buffer *vbuf)
>  		if (esparser_vififo_get_free_space(sess) < payload_size ||
>  		    atomic_read(&sess->esparser_queued_bufs) >=3D num_dst_bufs)
>  			return -EAGAIN;
> +
>  	} else if (esparser_vififo_get_free_space(sess) < payload_size) {
>  		return -EAGAIN;
>  	}
> diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/me=
dia/meson/vdec/vdec.h
> index 0906b8fb5cc6..a48170fe4cff 100644
> --- a/drivers/staging/media/meson/vdec/vdec.h
> +++ b/drivers/staging/media/meson/vdec/vdec.h
> @@ -244,6 +244,7 @@ struct amvdec_session {
>  	u32 width;
>  	u32 height;
>  	u32 colorspace;
> +	u32 bitdepth;
>  	u8 ycbcr_enc;
>  	u8 quantization;
>  	u8 xfer_func;
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/st=
aging/media/meson/vdec/vdec_helpers.c
> index 7d2a75653250..fef76142f0c5 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> @@ -50,32 +50,40 @@ void amvdec_write_parser(struct amvdec_core *core, u3=
2 reg, u32 val)
>  }
>  EXPORT_SYMBOL_GPL(amvdec_write_parser);
> =20
> -/* 4 KiB per 64x32 block */
> -u32 amvdec_am21c_body_size(u32 width, u32 height)
> +/* AMFBC body is made out of 64x32 blocks with varying block size */
> +u32 amvdec_amfbc_body_size(u32 width, u32 height, u32 is_10bit, u32 use_=
mmu)
>  {
>  	u32 width_64 =3D ALIGN(width, 64) / 64;
>  	u32 height_32 =3D ALIGN(height, 32) / 32;
> +	u32 blk_size =3D 4096;
> =20
> -	return SZ_4K * width_64 * height_32;
> +	if (!is_10bit) {
> +		if (use_mmu)
> +			blk_size =3D 3200;
> +		else
> +			blk_size =3D 3072;
> +	}
> +
> +	return blk_size * width_64 * height_32;
>  }
> -EXPORT_SYMBOL_GPL(amvdec_am21c_body_size);
> +EXPORT_SYMBOL_GPL(amvdec_amfbc_body_size);
> =20
>  /* 32 bytes per 128x64 block */
> -u32 amvdec_am21c_head_size(u32 width, u32 height)
> +u32 amvdec_amfbc_head_size(u32 width, u32 height)
>  {
>  	u32 width_128 =3D ALIGN(width, 128) / 128;
>  	u32 height_64 =3D ALIGN(height, 64) / 64;
> =20
>  	return 32 * width_128 * height_64;
>  }
> -EXPORT_SYMBOL_GPL(amvdec_am21c_head_size);
> +EXPORT_SYMBOL_GPL(amvdec_amfbc_head_size);
> =20
> -u32 amvdec_am21c_size(u32 width, u32 height)
> +u32 amvdec_amfbc_size(u32 width, u32 height, u32 is_10bit, u32 use_mmu)
>  {
> -	return ALIGN(amvdec_am21c_body_size(width, height) +
> -		     amvdec_am21c_head_size(width, height), SZ_64K);
> +	return ALIGN(amvdec_amfbc_body_size(width, height, is_10bit, use_mmu) +
> +		     amvdec_amfbc_head_size(width, height), SZ_64K);
>  }
> -EXPORT_SYMBOL_GPL(amvdec_am21c_size);
> +EXPORT_SYMBOL_GPL(amvdec_amfbc_size);
> =20
>  static int canvas_alloc(struct amvdec_session *sess, u8 *canvas_id)
>  {
> @@ -440,7 +448,7 @@ void amvdec_set_par_from_dar(struct amvdec_session *s=
ess,
>  EXPORT_SYMBOL_GPL(amvdec_set_par_from_dar);
> =20
>  void amvdec_src_change(struct amvdec_session *sess, u32 width,
> -		       u32 height, u32 dpb_size)
> +		       u32 height, u32 dpb_size, u32 bitdepth)
>  {
>  	static const struct v4l2_event ev =3D {
>  		.type =3D V4L2_EVENT_SOURCE_CHANGE,
> @@ -448,25 +456,27 @@ void amvdec_src_change(struct amvdec_session *sess,=
 u32 width,
> =20
>  	v4l2_ctrl_s_ctrl(sess->ctrl_min_buf_capture, dpb_size);
> =20
> +	sess->bitdepth =3D bitdepth;
> +
>  	/*
>  	 * Check if the capture queue is already configured well for our
> -	 * usecase. If so, keep decoding with it and do not send the event
> +	 * usecase. If so, keep decoding with it.
>  	 */
>  	if (sess->streamon_cap &&
>  	    sess->width =3D=3D width &&
>  	    sess->height =3D=3D height &&
>  	    dpb_size <=3D sess->num_dst_bufs) {
>  		sess->fmt_out->codec_ops->resume(sess);
> -		return;
> +	} else {
> +		sess->status =3D STATUS_NEEDS_RESUME;
> +		sess->changed_format =3D 0;
>  	}
> =20
> -	sess->changed_format =3D 0;
>  	sess->width =3D width;
>  	sess->height =3D height;
> -	sess->status =3D STATUS_NEEDS_RESUME;
> =20
> -	dev_dbg(sess->core->dev, "Res. changed (%ux%u), DPB size %u\n",
> -		width, height, dpb_size);
> +	dev_dbg(sess->core->dev, "Res. changed (%ux%u), DPB %u, bitdepth %u\n",
> +		width, height, dpb_size, bitdepth);
>  	v4l2_event_queue_fh(&sess->fh, &ev);
>  }
>  EXPORT_SYMBOL_GPL(amvdec_src_change);
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/st=
aging/media/meson/vdec/vdec_helpers.h
> index 4bf3e61d081b..1a711679d26a 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.h
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
> @@ -27,9 +27,10 @@ void amvdec_clear_dos_bits(struct amvdec_core *core, u=
32 reg, u32 val);
>  u32 amvdec_read_parser(struct amvdec_core *core, u32 reg);
>  void amvdec_write_parser(struct amvdec_core *core, u32 reg, u32 val);
> =20
> -u32 amvdec_am21c_body_size(u32 width, u32 height);
> -u32 amvdec_am21c_head_size(u32 width, u32 height);
> -u32 amvdec_am21c_size(u32 width, u32 height);
> +/* Helpers for the Amlogic compressed framebuffer format */
> +u32 amvdec_amfbc_body_size(u32 width, u32 height, u32 is_10bit, u32 use_=
mmu);
> +u32 amvdec_amfbc_head_size(u32 width, u32 height);
> +u32 amvdec_amfbc_size(u32 width, u32 height, u32 is_10bit, u32 use_mmu);
> =20
>  /**
>   * amvdec_dst_buf_done_idx() - Signal that a buffer is done decoding
> @@ -77,9 +78,10 @@ void amvdec_set_par_from_dar(struct amvdec_session *se=
ss,
>   * @width: picture width detected by the hardware
>   * @height: picture height detected by the hardware
>   * @dpb_size: Decoded Picture Buffer size (=3D amount of buffers for dec=
oding)
> + * @bitdepth: Bit depth (usually 10 or 8) of the coded content
>   */
>  void amvdec_src_change(struct amvdec_session *sess, u32 width,
> -		       u32 height, u32 dpb_size);
> +		       u32 height, u32 dpb_size, u32 bitdepth);
> =20
>  /**
>   * amvdec_abort() - Abort the current decoding session

