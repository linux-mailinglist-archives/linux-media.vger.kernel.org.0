Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5778026EA09
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 02:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgIRAnr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 20:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgIRAnr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 20:43:47 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7679DC06174A;
        Thu, 17 Sep 2020 17:43:47 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 42C0829B23B
Message-ID: <a9116365a389e4c163a43a5fca25b9ead2c62b36.camel@collabora.com>
Subject: Re: [PATCH v2] media: cedrus: Propagate OUTPUT resolution to CAPTURE
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Ondrej Jirman <megous@megous.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 17 Sep 2020 20:43:41 -0400
In-Reply-To: <20200918002751.373984-1-nicolas.dufresne@collabora.com>
References: <20200918002751.373984-1-nicolas.dufresne@collabora.com>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-4OAuXJMbV66WcnRzbNuQ"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-4OAuXJMbV66WcnRzbNuQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 17 septembre 2020 =C3=A0 20:27 -0400, Nicolas Dufresne a =C3=A9cri=
t :
> As per spec, the CAPTURE resolution should be automatically set based on
> the OTUPUT resolution. This patch properly propagate width/height to the
> capture when the OUTPUT format is set and override the user provided
> width/height with configured OUTPUT resolution when the CAPTURE fmt is
> updated.
>=20
> This also prevents userspace from selecting a CAPTURE resolution that is
> too small, avoiding kernel oops.

Just in case it wasn't obvious, this is fully reproducible oops
whenever you use GStreamer 1.18. Here's a copy of Ondrej report from
today which thankfully allowed me to realized I had never completed
this patch. Pretty much all kernel that includes Cedrus are to be
affect, though is a staging driver on staging API of course.

---

I tried testing cedrus with gstreamer 1.18 and it managed to crash the
kernel on
A64. I used:

  gst-launch-1.0 filesrc location=3Dtest.mkv ! matroskademux ! queue !
h264parse ! v4l2slh264dec ! filesink location=3Daaa.dat

Unable to handle kernel paging request at virtual address
8080808080808088
Mem abort info:
  ESR =3D 0x96000044
  EC =3D 0x25: DABT (current EL), IL =3D 32 bits
  SET =3D 0, FnV =3D 0
  EA =3D 0, S1PTW =3D 0
Data abort info:
  ISV =3D 0, ISS =3D 0x00000044
  CM =3D 0, WnR =3D 1
[8080808080808088] address between user and kernel address ranges
Internal error: Oops: 96000044 [#1] SMP
Modules linked in: modem_power hci_uart btrtl bluetooth ecdh_generic
ecc sunxi_cedrus(C) sun8i_ce crypto_engine snd_soc_bt_sco
snd_soc_simple_card snd_soc_simple_card_utils snd_soc_simple_amplifier
sun50i_codec_analog sun8i_codec sun8i_adda_pr_regmap snd_soc_ec25
sun4i_i2s snd_soc_core snd_pcm_dmaengine snd_pcm snd_timer snd
soundcore stk3310 inv_mpu6050_i2c inv_mpu6050 st_magn_i2c
st_sensors_i2c st_magn st_sensors industrialio_triggered_buffer
kfifo_buf regmap_i2c option usb_wwan usbserial anx7688 ohci_platform
ohci_hcd ehci_platform ehci_hcd g_cdc usb_f_acm u_serial usb_f_ecm
u_ether libcomposite sunxi phy_generic musb_hdrc udc_core usbcore
sun8i_rotate v4l2_mem2mem gc2145 ov5640 sun6i_csi videobuf2_dma_contig
v4l2_fwnode videobuf2_memops videobuf2_v4l2 videobuf2_common videodev
mc 8723cs(C) cfg80211 rfkill lima gpu_sched goodix
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G         C        5.9.0-rc5-
00386-g4fe2ef82bd0b #62
Hardware name: Pine64 PinePhone (1.2) (DT)
pstate: 80000085 (Nzcv daIf -PAN -UAO BTYPE=3D--)
pc : v4l2_m2m_buf_remove+0x44/0x90 [v4l2_mem2mem]
lr : v4l2_m2m_buf_remove+0x18/0x90 [v4l2_mem2mem]
sp : ffffffc010c8be20
x29: ffffffc010c8be20 x28: ffffffc010bb2fc0=20
x27: 0000000000000060 x26: ffffffc010935e58=20
x25: ffffffc010c06a5a x24: 0000000000000080=20
x23: 0000000000000005 x22: ffffffc010c8bf4c=20
x21: ffffff806ba0d088 x20: ffffff80687d1800=20
x19: ffffff8066c40298 x18: 0000000000000000=20
x17: 0000000000000000 x16: 0000000000000000=20
x15: 000001b66678fd80 x14: 0000000000000204=20
x13: 0000000000000001 x12: 0000000000000040=20
x11: ffffff806f0c0248 x10: ffffff806f0c024a=20
x9 : ffffffc010bbdac8 x8 : ffffff806f000270=20
x7 : 0000000000000000 x6 : dead000000000100=20
x5 : dead000000000122 x4 : 0000000000000000=20
x3 : 8080808080808080 x2 : 8080808080808080=20
x1 : ffffff80641327a8 x0 : 0000000000000080=20
Call trace:
 v4l2_m2m_buf_remove+0x44/0x90 [v4l2_mem2mem]
 v4l2_m2m_buf_done_and_job_finish+0x34/0x140 [v4l2_mem2mem]
 cedrus_irq+0x8c/0xc0 [sunxi_cedrus]
 __handle_irq_event_percpu+0x54/0x150
 handle_irq_event+0x4c/0xec
 handle_fasteoi_irq+0xbc/0x1c0
 __handle_domain_irq+0x78/0xdc
 gic_handle_irq+0x50/0xa0
 el1_irq+0xb8/0x140
 arch_cpu_idle+0x10/0x14
 cpu_startup_entry+0x24/0x60
 rest_init+0xb0/0xbc
 arch_call_rest_init+0xc/0x14
 start_kernel+0x690/0x6b0
Code: f2fbd5a6 f2fbd5a5 52800004 a9400823 (f9000462)=20
---[ end trace 88233b9a76cdb261 ]---
Kernel panic - not syncing: Fatal exception in interrupt

>=20
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Tested-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../staging/media/sunxi/cedrus/cedrus_video.c | 29 +++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index 16d82309e7b6..667b86dde1ee 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -247,6 +247,8 @@ static int cedrus_try_fmt_vid_cap(struct file *file, =
void *priv,
>  		return -EINVAL;
> =20
>  	pix_fmt->pixelformat =3D fmt->pixelformat;
> +	pix_fmt->width =3D ctx->src_fmt.width;
> +	pix_fmt->height =3D ctx->src_fmt.height;
>  	cedrus_prepare_format(pix_fmt);
> =20
>  	return 0;
> @@ -296,10 +298,30 @@ static int cedrus_s_fmt_vid_out(struct file *file, =
void *priv,
>  {
>  	struct cedrus_ctx *ctx =3D cedrus_file2ctx(file);
>  	struct vb2_queue *vq;
> +	struct vb2_queue *peer_vq;
>  	int ret;
> =20
> +	ret =3D cedrus_try_fmt_vid_out(file, priv, f);
> +	if (ret)
> +		return ret;
> +
>  	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (vb2_is_busy(vq))
> +	/*
> +	 * In order to support dynamic resolution change,
> +	 * the decoder admits a resolution change, as long
> +	 * as the pixelformat remains. Can't be done if streaming.
> +	 */
> +	if (vb2_is_streaming(vq) || (vb2_is_busy(vq) &&
> +	    f->fmt.pix.pixelformat !=3D ctx->src_fmt.pixelformat))
> +		return -EBUSY;
> +	/*
> +	 * Since format change on the OUTPUT queue will reset
> +	 * the CAPTURE queue, we can't allow doing so
> +	 * when the CAPTURE queue has buffers allocated.
> +	 */
> +	peer_vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> +				  V4L2_BUF_TYPE_VIDEO_CAPTURE);
> +	if (vb2_is_busy(peer_vq))
>  		return -EBUSY;
> =20
>  	ret =3D cedrus_try_fmt_vid_out(file, priv, f);
> @@ -319,11 +341,14 @@ static int cedrus_s_fmt_vid_out(struct file *file, =
void *priv,
>  		break;
>  	}
> =20
> -	/* Propagate colorspace information to capture. */
> +	/* Propagate format information to capture. */
>  	ctx->dst_fmt.colorspace =3D f->fmt.pix.colorspace;
>  	ctx->dst_fmt.xfer_func =3D f->fmt.pix.xfer_func;
>  	ctx->dst_fmt.ycbcr_enc =3D f->fmt.pix.ycbcr_enc;
>  	ctx->dst_fmt.quantization =3D f->fmt.pix.quantization;
> +	ctx->dst_fmt.width =3D ctx->src_fmt.width;
> +	ctx->dst_fmt.height =3D ctx->src_fmt.height;
> +	cedrus_prepare_format(&ctx->dst_fmt);
> =20
>  	return 0;
>  }

--=-4OAuXJMbV66WcnRzbNuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCX2QCvQAKCRBxUwItrAao
HH8PAKDUYpL8eVWFEZVqqdePkDoZXjsYeQCfUqjfXGR2E25n85w/cv4OqCOBRr0=
=NJzQ
-----END PGP SIGNATURE-----

--=-4OAuXJMbV66WcnRzbNuQ--

