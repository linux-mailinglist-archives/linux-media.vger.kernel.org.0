Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12A1BEDC3B
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 11:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbfKDKN3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 05:13:29 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:46399 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfKDKN2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 05:13:28 -0500
X-Originating-IP: 86.250.200.211
Received: from aptenodytes (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9A4B7E0005;
        Mon,  4 Nov 2019 10:13:19 +0000 (UTC)
Date:   Mon, 4 Nov 2019 11:13:19 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 2/3] media: cedrus: Fix H264 4k support
Message-ID: <20191104101319.GE502900@aptenodytes>
References: <20191026074959.1073512-1-jernej.skrabec@siol.net>
 <20191026074959.1073512-3-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rMWmSaSbD7nr+du9"
Content-Disposition: inline
In-Reply-To: <20191026074959.1073512-3-jernej.skrabec@siol.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--rMWmSaSbD7nr+du9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat 26 Oct 19, 09:49, Jernej Skrabec wrote:
> H264 decoder needs additional or bigger buffers in order to decode 4k
> videos.

Thanks for the fixup, we hadn't looked into those bits at all during initial
bringup of H.264!

See a few minor comments below.

> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 83 +++++++++++++++++--
>  .../staging/media/sunxi/cedrus/cedrus_regs.h  | 11 +++
>  3 files changed, 93 insertions(+), 8 deletions(-)
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
> index d2c854ecdf15..19962f4213d4 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -39,7 +39,6 @@ struct cedrus_h264_sram_ref_pic {
>  #define CEDRUS_H264_FRAME_NUM		18
> =20
>  #define CEDRUS_NEIGHBOR_INFO_BUF_SIZE	(16 * SZ_1K)
> -#define CEDRUS_PIC_INFO_BUF_SIZE	(128 * SZ_1K)

Could we keep a define with the minimum size that you are using later
(increased to 130 * SZ_1K)?

>  static void cedrus_h264_write_sram(struct cedrus_dev *dev,
>  				   enum cedrus_h264_sram_off off,
> @@ -342,6 +341,20 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
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
> @@ -502,18 +515,28 @@ static void cedrus_h264_setup(struct cedrus_ctx *ct=
x,
>  static int cedrus_h264_start(struct cedrus_ctx *ctx)
>  {
>  	struct cedrus_dev *dev =3D ctx->dev;
> +	unsigned int pic_info_size;
>  	unsigned int field_size;
>  	unsigned int mv_col_size;
>  	int ret;
> =20

Maybe add a comment here this is a half-magic sub-optimal formula?

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
> +	if (pic_info_size < 130 * SZ_1K)
> +		pic_info_size =3D 130 * SZ_1K;

This is where I think we could have a "minimum pic info size" define.

> +
> +	ctx->codec.h264.pic_info_buf_size =3D pic_info_size;
>  	ctx->codec.h264.pic_info_buf =3D
> -		dma_alloc_coherent(dev->dev, CEDRUS_PIC_INFO_BUF_SIZE,
> +		dma_alloc_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
>  				   &ctx->codec.h264.pic_info_buf_dma,
>  				   GFP_KERNEL);
>  	if (!ctx->codec.h264.pic_info_buf)
> @@ -566,15 +589,51 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
>  		goto err_neighbor_buf;
>  	}
> =20
> +	if (ctx->src_fmt.width > 2048) {

Feel free to add a comment here to explain where the 12 below comes from if=
 you
have some idea, or that it's a somewhat magical value that generally works.

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

Same here, a comment would be welcome about the 5 value below.

Cheers,

Paul

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
> @@ -590,9 +649,17 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
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
> 2.23.0
>=20

--rMWmSaSbD7nr+du9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl2/+b4ACgkQ3cLmz3+f
v9HaCAf/f5weE5cZlXj5hydAutd2A4v+2HWp/yN+RMH1MTGYB3Xuywu+rmpXBGKa
OK5C7E/8zTZNr0hQxJqmkMG5lTgXijJuBL400Z5vvo8AXC+ZU5AVQ2z+7sForN4l
uVtintoRdCEGr0UGOoZY9JawFRcYHUDmgihGktePw2IvH9+FDsen6XCIuwRlSotg
h9Yn13epwvlcaPIlonaNIh/kTjUtuX1CDhbWjVFrlhTVWwmLToGyd4JXOgFgMn6F
DRLtdRNZ8N+uSNo2EvX18K9Rj7GELbWi8y1xEF+8Jq9iqeRNNOJAFhDlOjfCAPyi
XIhivvvc9lEvsClj/8Jrbls0W6qNwg==
=zSTM
-----END PGP SIGNATURE-----

--rMWmSaSbD7nr+du9--
