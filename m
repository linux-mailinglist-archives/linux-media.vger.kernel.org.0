Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18D83F5F3D
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 13:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfKIM7y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 07:59:54 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:49947 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfKIM7y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 07:59:54 -0500
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B6C9A240004;
        Sat,  9 Nov 2019 12:59:49 +0000 (UTC)
Date:   Sat, 9 Nov 2019 13:59:49 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 2/3] media: cedrus: Fix H264 4k support
Message-ID: <20191109125949.GC845368@aptenodytes>
References: <20191106210538.3474-1-jernej.skrabec@siol.net>
 <20191106210538.3474-3-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline
In-Reply-To: <20191106210538.3474-3-jernej.skrabec@siol.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jenrej,

On Wed 06 Nov 19, 22:05, Jernej Skrabec wrote:
> H264 decoder needs additional or bigger buffers in order to decode 4k
> videos.

Thanks for the changes, looks good to me!

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 91 +++++++++++++++++--
>  .../staging/media/sunxi/cedrus/cedrus_regs.h  | 11 +++
>  3 files changed, 101 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
> index c45fb9a7ad07..96765555ab8a 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -116,8 +116,15 @@ struct cedrus_ctx {
>  			ssize_t		mv_col_buf_size;
>  			void		*pic_info_buf;
>  			dma_addr_t	pic_info_buf_dma;
> +			ssize_t		pic_info_buf_size;
>  			void		*neighbor_info_buf;
>  			dma_addr_t	neighbor_info_buf_dma;
> +			void		*deblk_buf;
> +			dma_addr_t	deblk_buf_dma;
> +			ssize_t		deblk_buf_size;
> +			void		*intra_pred_buf;
> +			dma_addr_t	intra_pred_buf_dma;
> +			ssize_t		intra_pred_buf_size;
>  		} h264;
>  		struct {
>  			void		*mv_col_buf;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> index d2c854ecdf15..ab83a6f1f921 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -39,7 +39,7 @@ struct cedrus_h264_sram_ref_pic {
>  #define CEDRUS_H264_FRAME_NUM		18
> =20
>  #define CEDRUS_NEIGHBOR_INFO_BUF_SIZE	(16 * SZ_1K)
> -#define CEDRUS_PIC_INFO_BUF_SIZE	(128 * SZ_1K)
> +#define CEDRUS_MIN_PIC_INFO_BUF_SIZE       (130 * SZ_1K)
> =20
>  static void cedrus_h264_write_sram(struct cedrus_dev *dev,
>  				   enum cedrus_h264_sram_off off,
> @@ -342,6 +342,20 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
>  		     VE_H264_VLD_ADDR_FIRST | VE_H264_VLD_ADDR_VALID |
>  		     VE_H264_VLD_ADDR_LAST);
> =20
> +	if (ctx->src_fmt.width > 2048) {
> +		cedrus_write(dev, VE_BUF_CTRL,
> +			     VE_BUF_CTRL_INTRAPRED_MIXED_RAM |
> +			     VE_BUF_CTRL_DBLK_MIXED_RAM);
> +		cedrus_write(dev, VE_DBLK_DRAM_BUF_ADDR,
> +			     ctx->codec.h264.deblk_buf_dma);
> +		cedrus_write(dev, VE_INTRAPRED_DRAM_BUF_ADDR,
> +			     ctx->codec.h264.intra_pred_buf_dma);
> +	} else {
> +		cedrus_write(dev, VE_BUF_CTRL,
> +			     VE_BUF_CTRL_INTRAPRED_INT_SRAM |
> +			     VE_BUF_CTRL_DBLK_INT_SRAM);
> +	}
> +
>  	/*
>  	 * FIXME: Since the bitstream parsing is done in software, and
>  	 * in userspace, this shouldn't be needed anymore. But it
> @@ -502,18 +516,30 @@ static void cedrus_h264_setup(struct cedrus_ctx *ct=
x,
>  static int cedrus_h264_start(struct cedrus_ctx *ctx)
>  {
>  	struct cedrus_dev *dev =3D ctx->dev;
> +	unsigned int pic_info_size;
>  	unsigned int field_size;
>  	unsigned int mv_col_size;
>  	int ret;
> =20
> +	/* Formula for picture buffer size is taken from CedarX source. */
> +
> +	if (ctx->src_fmt.width > 2048)
> +		pic_info_size =3D CEDRUS_H264_FRAME_NUM * 0x4000;
> +	else
> +		pic_info_size =3D CEDRUS_H264_FRAME_NUM * 0x1000;
> +
>  	/*
> -	 * FIXME: It seems that the H6 cedarX code is using a formula
> -	 * here based on the size of the frame, while all the older
> -	 * code is using a fixed size, so that might need to be
> -	 * changed at some point.
> +	 * FIXME: If V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY is set,
> +	 * there is no need to multiply by 2.
>  	 */
> +	pic_info_size +=3D ctx->src_fmt.height * 2 * 64;
> +
> +	if (pic_info_size < CEDRUS_MIN_PIC_INFO_BUF_SIZE)
> +		pic_info_size =3D CEDRUS_MIN_PIC_INFO_BUF_SIZE;
> +
> +	ctx->codec.h264.pic_info_buf_size =3D pic_info_size;
>  	ctx->codec.h264.pic_info_buf =3D
> -		dma_alloc_coherent(dev->dev, CEDRUS_PIC_INFO_BUF_SIZE,
> +		dma_alloc_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
>  				   &ctx->codec.h264.pic_info_buf_dma,
>  				   GFP_KERNEL);
>  	if (!ctx->codec.h264.pic_info_buf)
> @@ -566,15 +592,56 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
>  		goto err_neighbor_buf;
>  	}
> =20
> +	if (ctx->src_fmt.width > 2048) {
> +		/*
> +		 * Formulas for deblock and intra prediction buffer sizes
> +		 * are taken from CedarX source.
> +		 */
> +
> +		ctx->codec.h264.deblk_buf_size =3D
> +			ALIGN(ctx->src_fmt.width, 32) * 12;
> +		ctx->codec.h264.deblk_buf =3D
> +			dma_alloc_coherent(dev->dev,
> +					   ctx->codec.h264.deblk_buf_size,
> +					   &ctx->codec.h264.deblk_buf_dma,
> +					   GFP_KERNEL);
> +		if (!ctx->codec.h264.deblk_buf) {
> +			ret =3D -ENOMEM;
> +			goto err_mv_col_buf;
> +		}
> +
> +		ctx->codec.h264.intra_pred_buf_size =3D
> +			ALIGN(ctx->src_fmt.width, 64) * 5;
> +		ctx->codec.h264.intra_pred_buf =3D
> +			dma_alloc_coherent(dev->dev,
> +					   ctx->codec.h264.intra_pred_buf_size,
> +					   &ctx->codec.h264.intra_pred_buf_dma,
> +					   GFP_KERNEL);
> +		if (!ctx->codec.h264.intra_pred_buf) {
> +			ret =3D -ENOMEM;
> +			goto err_deblk_buf;
> +		}
> +	}
> +
>  	return 0;
> =20
> +err_deblk_buf:
> +	dma_free_coherent(dev->dev, ctx->codec.h264.deblk_buf_size,
> +			  ctx->codec.h264.deblk_buf,
> +			  ctx->codec.h264.deblk_buf_dma);
> +
> +err_mv_col_buf:
> +	dma_free_coherent(dev->dev, ctx->codec.h264.mv_col_buf_size,
> +			  ctx->codec.h264.mv_col_buf,
> +			  ctx->codec.h264.mv_col_buf_dma);
> +
>  err_neighbor_buf:
>  	dma_free_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
>  			  ctx->codec.h264.neighbor_info_buf,
>  			  ctx->codec.h264.neighbor_info_buf_dma);
> =20
>  err_pic_buf:
> -	dma_free_coherent(dev->dev, CEDRUS_PIC_INFO_BUF_SIZE,
> +	dma_free_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
>  			  ctx->codec.h264.pic_info_buf,
>  			  ctx->codec.h264.pic_info_buf_dma);
>  	return ret;
> @@ -590,9 +657,17 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
>  	dma_free_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
>  			  ctx->codec.h264.neighbor_info_buf,
>  			  ctx->codec.h264.neighbor_info_buf_dma);
> -	dma_free_coherent(dev->dev, CEDRUS_PIC_INFO_BUF_SIZE,
> +	dma_free_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
>  			  ctx->codec.h264.pic_info_buf,
>  			  ctx->codec.h264.pic_info_buf_dma);
> +	if (ctx->codec.h264.deblk_buf_size)
> +		dma_free_coherent(dev->dev, ctx->codec.h264.deblk_buf_size,
> +				  ctx->codec.h264.deblk_buf,
> +				  ctx->codec.h264.deblk_buf_dma);
> +	if (ctx->codec.h264.intra_pred_buf_size)
> +		dma_free_coherent(dev->dev, ctx->codec.h264.intra_pred_buf_size,
> +				  ctx->codec.h264.intra_pred_buf,
> +				  ctx->codec.h264.intra_pred_buf_dma);
>  }
> =20
>  static void cedrus_h264_trigger(struct cedrus_ctx *ctx)
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers/s=
taging/media/sunxi/cedrus/cedrus_regs.h
> index ace3d49fcd82..7beb03d3bb39 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> @@ -46,6 +46,17 @@
>  #define VE_MODE_DEC_H264			(0x01 << 0)
>  #define VE_MODE_DEC_MPEG			(0x00 << 0)
> =20
> +#define VE_BUF_CTRL				0x50
> +
> +#define VE_BUF_CTRL_INTRAPRED_EXT_RAM		(0x02 << 2)
> +#define VE_BUF_CTRL_INTRAPRED_MIXED_RAM		(0x01 << 2)
> +#define VE_BUF_CTRL_INTRAPRED_INT_SRAM		(0x00 << 2)
> +#define VE_BUF_CTRL_DBLK_EXT_RAM		(0x02 << 0)
> +#define VE_BUF_CTRL_DBLK_MIXED_RAM		(0x01 << 0)
> +#define VE_BUF_CTRL_DBLK_INT_SRAM		(0x00 << 0)
> +
> +#define VE_DBLK_DRAM_BUF_ADDR			0x54
> +#define VE_INTRAPRED_DRAM_BUF_ADDR		0x58
>  #define VE_PRIMARY_CHROMA_BUF_LEN		0xc4
>  #define VE_PRIMARY_FB_LINE_STRIDE		0xc8
> =20
> --=20
> 2.24.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl3GuEUACgkQ3cLmz3+f
v9FbwAf9FsyMnR+21TKS8wr5rU3EEcwwQNJqPtczR+akZcSA4MKNGtXclblYTewX
GF58C8HGeKVylE8eLJWj7qo6DK8tLGPWHvc1QL0hWSvkxrpf+aMYpCdgVpOZXqES
YIrpJjD9D2G40M3Hdxgal1XILEsfscQM7VkRoFaRlb0dXd/PEogr/MO19K0ypl3c
5Sy1jNjdCvBEtlSFfC5/IQpN3lX/3c8DLx63EZgbaDfQCSy5Xh/sJsVNohTdPc5i
gAzwMeLmEkveNiJ14XYXtuCW+njW2vp87PAC4VD/ijmaWU99PzoRSSXL4DT+cjLd
ErxvAj2UfPj+MW4IwJOPqMKrmlwrqg==
=9LW5
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
