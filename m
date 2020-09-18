Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8514226FEA9
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 15:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgIRNfo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 09:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIRNfo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 09:35:44 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D108BC0613CE;
        Fri, 18 Sep 2020 06:35:43 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 2039E29C954
Message-ID: <8b5f42e17ceacd36c0e3808637cec291dc160ec3.camel@collabora.com>
Subject: Re: [PATCH v2] media: cedrus: Propagate OUTPUT resolution to CAPTURE
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 18 Sep 2020 10:35:32 -0300
In-Reply-To: <a9116365a389e4c163a43a5fca25b9ead2c62b36.camel@collabora.com>
References: <20200918002751.373984-1-nicolas.dufresne@collabora.com>
         <a9116365a389e4c163a43a5fca25b9ead2c62b36.camel@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On Thu, 2020-09-17 at 20:43 -0400, Nicolas Dufresne wrote:
> Le jeudi 17 septembre 2020 à 20:27 -0400, Nicolas Dufresne a écrit :
> > As per spec, the CAPTURE resolution should be automatically set based on
> > the OTUPUT resolution. This patch properly propagate width/height to the
> > capture when the OUTPUT format is set and override the user provided
> > width/height with configured OUTPUT resolution when the CAPTURE fmt is
> > updated.
> > 
> > This also prevents userspace from selecting a CAPTURE resolution that is
> > too small, avoiding kernel oops.
> 
> Just in case it wasn't obvious, this is fully reproducible oops
> whenever you use GStreamer 1.18. Here's a copy of Ondrej report from
> today which thankfully allowed me to realized I had never completed
> this patch. Pretty much all kernel that includes Cedrus are to be
> affect, though is a staging driver on staging API of course.
> 
> ---
> 
> I tried testing cedrus with gstreamer 1.18 and it managed to crash the
> kernel on
> A64. I used:
> 
>   gst-launch-1.0 filesrc location=test.mkv ! matroskademux ! queue !
> h264parse ! v4l2slh264dec ! filesink location=aaa.dat
> 
> Unable to handle kernel paging request at virtual address
> 8080808080808088
> Mem abort info:
>   ESR = 0x96000044
>   EC = 0x25: DABT (current EL), IL = 32 bits
>   SET = 0, FnV = 0
>   EA = 0, S1PTW = 0
> Data abort info:
>   ISV = 0, ISS = 0x00000044
>   CM = 0, WnR = 1
> [8080808080808088] address between user and kernel address ranges
> Internal error: Oops: 96000044 [#1] SMP
> Modules linked in: modem_power hci_uart btrtl bluetooth ecdh_generic
> ecc sunxi_cedrus(C) sun8i_ce crypto_engine snd_soc_bt_sco
> snd_soc_simple_card snd_soc_simple_card_utils snd_soc_simple_amplifier
> sun50i_codec_analog sun8i_codec sun8i_adda_pr_regmap snd_soc_ec25
> sun4i_i2s snd_soc_core snd_pcm_dmaengine snd_pcm snd_timer snd
> soundcore stk3310 inv_mpu6050_i2c inv_mpu6050 st_magn_i2c
> st_sensors_i2c st_magn st_sensors industrialio_triggered_buffer
> kfifo_buf regmap_i2c option usb_wwan usbserial anx7688 ohci_platform
> ohci_hcd ehci_platform ehci_hcd g_cdc usb_f_acm u_serial usb_f_ecm
> u_ether libcomposite sunxi phy_generic musb_hdrc udc_core usbcore
> sun8i_rotate v4l2_mem2mem gc2145 ov5640 sun6i_csi videobuf2_dma_contig
> v4l2_fwnode videobuf2_memops videobuf2_v4l2 videobuf2_common videodev
> mc 8723cs(C) cfg80211 rfkill lima gpu_sched goodix
> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G         C        5.9.0-rc5-
> 00386-g4fe2ef82bd0b #62
> Hardware name: Pine64 PinePhone (1.2) (DT)
> pstate: 80000085 (Nzcv daIf -PAN -UAO BTYPE=--)
> pc : v4l2_m2m_buf_remove+0x44/0x90 [v4l2_mem2mem]
> lr : v4l2_m2m_buf_remove+0x18/0x90 [v4l2_mem2mem]
> sp : ffffffc010c8be20
> x29: ffffffc010c8be20 x28: ffffffc010bb2fc0 
> x27: 0000000000000060 x26: ffffffc010935e58 
> x25: ffffffc010c06a5a x24: 0000000000000080 
> x23: 0000000000000005 x22: ffffffc010c8bf4c 
> x21: ffffff806ba0d088 x20: ffffff80687d1800 
> x19: ffffff8066c40298 x18: 0000000000000000 
> x17: 0000000000000000 x16: 0000000000000000 
> x15: 000001b66678fd80 x14: 0000000000000204 
> x13: 0000000000000001 x12: 0000000000000040 
> x11: ffffff806f0c0248 x10: ffffff806f0c024a 
> x9 : ffffffc010bbdac8 x8 : ffffff806f000270 
> x7 : 0000000000000000 x6 : dead000000000100 
> x5 : dead000000000122 x4 : 0000000000000000 
> x3 : 8080808080808080 x2 : 8080808080808080 
> x1 : ffffff80641327a8 x0 : 0000000000000080 
> Call trace:
>  v4l2_m2m_buf_remove+0x44/0x90 [v4l2_mem2mem]
>  v4l2_m2m_buf_done_and_job_finish+0x34/0x140 [v4l2_mem2mem]
>  cedrus_irq+0x8c/0xc0 [sunxi_cedrus]
>  __handle_irq_event_percpu+0x54/0x150
>  handle_irq_event+0x4c/0xec
>  handle_fasteoi_irq+0xbc/0x1c0
>  __handle_domain_irq+0x78/0xdc
>  gic_handle_irq+0x50/0xa0
>  el1_irq+0xb8/0x140
>  arch_cpu_idle+0x10/0x14
>  cpu_startup_entry+0x24/0x60
>  rest_init+0xb0/0xbc
>  arch_call_rest_init+0xc/0x14
>  start_kernel+0x690/0x6b0
> Code: f2fbd5a6 f2fbd5a5 52800004 a9400823 (f9000462) 
> ---[ end trace 88233b9a76cdb261 ]---
> Kernel panic - not syncing: Fatal exception in interrupt
> 

Just FWIW, you could have included the panic backtrace and
the information about the bug in the patch description.

The driver is in staging, but still I'd say it's worth
to have:

Cc: stable@vger.kernel.org
Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")

Thanks,
Ezequiel

> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Tested-by: Ondrej Jirman <megous@megous.com>
> > ---
> >  .../staging/media/sunxi/cedrus/cedrus_video.c | 29 +++++++++++++++++--
> >  1 file changed, 27 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > index 16d82309e7b6..667b86dde1ee 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > @@ -247,6 +247,8 @@ static int cedrus_try_fmt_vid_cap(struct file *file, void *priv,
> >  		return -EINVAL;
> >  
> >  	pix_fmt->pixelformat = fmt->pixelformat;
> > +	pix_fmt->width = ctx->src_fmt.width;
> > +	pix_fmt->height = ctx->src_fmt.height;
> >  	cedrus_prepare_format(pix_fmt);
> >  
> >  	return 0;
> > @@ -296,10 +298,30 @@ static int cedrus_s_fmt_vid_out(struct file *file, void *priv,
> >  {
> >  	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
> >  	struct vb2_queue *vq;
> > +	struct vb2_queue *peer_vq;
> >  	int ret;
> >  
> > +	ret = cedrus_try_fmt_vid_out(file, priv, f);
> > +	if (ret)
> > +		return ret;
> > +
> >  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > -	if (vb2_is_busy(vq))
> > +	/*
> > +	 * In order to support dynamic resolution change,
> > +	 * the decoder admits a resolution change, as long
> > +	 * as the pixelformat remains. Can't be done if streaming.
> > +	 */
> > +	if (vb2_is_streaming(vq) || (vb2_is_busy(vq) &&
> > +	    f->fmt.pix.pixelformat != ctx->src_fmt.pixelformat))
> > +		return -EBUSY;
> > +	/*
> > +	 * Since format change on the OUTPUT queue will reset
> > +	 * the CAPTURE queue, we can't allow doing so
> > +	 * when the CAPTURE queue has buffers allocated.
> > +	 */
> > +	peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> > +				  V4L2_BUF_TYPE_VIDEO_CAPTURE);
> > +	if (vb2_is_busy(peer_vq))
> >  		return -EBUSY;
> >  
> >  	ret = cedrus_try_fmt_vid_out(file, priv, f);
> > @@ -319,11 +341,14 @@ static int cedrus_s_fmt_vid_out(struct file *file, void *priv,
> >  		break;
> >  	}
> >  
> > -	/* Propagate colorspace information to capture. */
> > +	/* Propagate format information to capture. */
> >  	ctx->dst_fmt.colorspace = f->fmt.pix.colorspace;
> >  	ctx->dst_fmt.xfer_func = f->fmt.pix.xfer_func;
> >  	ctx->dst_fmt.ycbcr_enc = f->fmt.pix.ycbcr_enc;
> >  	ctx->dst_fmt.quantization = f->fmt.pix.quantization;
> > +	ctx->dst_fmt.width = ctx->src_fmt.width;
> > +	ctx->dst_fmt.height = ctx->src_fmt.height;
> > +	cedrus_prepare_format(&ctx->dst_fmt);
> >  
> >  	return 0;
> >  }


