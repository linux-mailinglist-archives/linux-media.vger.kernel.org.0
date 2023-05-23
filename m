Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4E2370DF61
	for <lists+linux-media@lfdr.de>; Tue, 23 May 2023 16:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237267AbjEWOf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 10:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237131AbjEWOfz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 10:35:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAA50E70
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 07:35:30 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1q1T6l-0006Em-FZ; Tue, 23 May 2023 16:35:27 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1q1T6h-0008Cv-9N; Tue, 23 May 2023 16:35:23 +0200
Date:   Tue, 23 May 2023 16:35:23 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH] media: verisilicon: Final fix for the crash when opening
 the driver
Message-ID: <20230523143523.GA9943@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
References: <CGME20230421104811eucas1p16ad5e11ebc4d305c6fab372d3743b6e1@eucas1p1.samsung.com>
 <20230421104759.2236463-1-m.szyprowski@samsung.com>
 <f4da6f1e5218db0417429a7fb5ebfdb95928e240.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4da6f1e5218db0417429a7fb5ebfdb95928e240.camel@ndufresne.ca>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 01 May 2023 14:50:57 -0400, Nicolas Dufresne wrote:
> Le vendredi 21 avril 2023 à 12:47 +0200, Marek Szyprowski a écrit :
> > ctx->vpu_src_fmt is no more initialized before calling hantro_try_fmt()
> > so checking it led to crash the kernel. Simply use the provided 'fmt' as
> > a format for those checks.
> > 
> > This fixes the following issue observed on Odroid-M1 board:
> > 
> >  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> >  Mem abort info:
> >  ...
> >  Modules linked in: crct10dif_ce hantro_vpu snd_soc_simple_card snd_soc_simple_card_utils v4l2_vp9 v4l2_h264 rockchip_saradc v4l2_mem2mem videobuf2_dma_contig videobuf2_memops rtc_rk808 videobuf2_v4l2 industrialio_triggered_buffer rockchip_thermal dwmac_rk stmmac_platform stmmac videodev kfifo_buf display_connector videobuf2_common pcs_xpcs mc rockchipdrm analogix_dp dw_mipi_dsi dw_hdmi drm_display_helper panfrost drm_shmem_helper gpu_sched ip_tables x_tables ipv6
> >  CPU: 3 PID: 176 Comm: v4l_id Not tainted 6.3.0-rc7-next-20230420 #13481
> >  Hardware name: Hardkernel ODROID-M1 (DT)
> >  pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >  pc : hantro_try_fmt+0xa0/0x278 [hantro_vpu]
> >  lr : hantro_try_fmt+0x94/0x278 [hantro_vpu]
> >  ...
> >  Call trace:
> >   hantro_try_fmt+0xa0/0x278 [hantro_vpu]
> >   hantro_set_fmt_out+0x3c/0x298 [hantro_vpu]
> >   hantro_reset_raw_fmt+0x98/0x128 [hantro_vpu]
> >   hantro_set_fmt_cap+0x240/0x254 [hantro_vpu]
> >   hantro_reset_encoded_fmt+0x94/0xcc [hantro_vpu]
> >   hantro_reset_fmts+0x18/0x38 [hantro_vpu]
> >   hantro_open+0xd4/0x20c [hantro_vpu]
> >   v4l2_open+0x80/0x120 [videodev]
> >   chrdev_open+0xc0/0x22c
> >   do_dentry_open+0x13c/0x48c
> >   vfs_open+0x2c/0x38
> >   path_openat+0x550/0x934
> >   do_filp_open+0x80/0x12c
> >   do_sys_openat2+0xb4/0x168
> >   __arm64_sys_openat+0x64/0xac
> >   invoke_syscall+0x48/0x114
> >   el0_svc_common+0x100/0x120
> >   do_el0_svc+0x3c/0xa8
> >   el0_svc+0x40/0xa8
> >   el0t_64_sync_handler+0xb8/0xbc
> >   el0t_64_sync+0x190/0x194
> >  Code: 97fc8a7f f940aa80 52864a61 72a686c1 (b9400800) 
> >  ---[ end trace 0000000000000000 ]---
> > 
> > Fixes: db6f68b51e5c ("media: verisilicon: Do not set context src/dst formats in reset functions")
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> > It looks that I've missed the fact that the first fix merged as commit
> > f100ce3bbd6a ("media: verisilicon: Fix crash when probing encoder") did
> > not fix all the issues introduced by db6f68b51e5c ("media: verisilicon:
> > Do not set context src/dst formats in reset functions"). I'm really sorry
> > for that.
> > ---
> >  drivers/media/platform/verisilicon/hantro_v4l2.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
> > index 835518534e3b..618ea23a7d49 100644
> > --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> > +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> > @@ -313,17 +313,17 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
> >  		/* Fill remaining fields */
> >  		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
> >  				    pix_mp->height);
> > -		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
> > +		if (fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
> 
> In this context, we have !coded, so fmt->fourcc will never be any of H264, VP9
> or HEVC, so we'llnever allocate space for motion vector. I'm surprise you are
> getting anything working after that. What this code is trying to achieve is to
> pad the size of raw images depending on the selected coded format (opposite
> queue).

The error happens for the encoder. Thus, it is the OUTPUT device that is
!coded. The OUTPUT device also determines vpu_src_format, which will never be
H264, VP9, or HEVC for an encoder.

The encoder works fine with this patch, but I think it breaks the decoder.

> 
> I think the proper fix is to actually fix the default coded format setup. This
> will ensure that vpu_src_fmt is always valid. The same pointer can be used in
> start-streaming it seems.

Setting a default coded format would be a proper fix. However, this previously
was done in the hantro_reset_*_fmt functions, where it has been removed.

Michael

> 
> >  		    !hantro_needs_postproc(ctx, fmt))
> >  			pix_mp->plane_fmt[0].sizeimage +=
> >  				hantro_h264_mv_size(pix_mp->width,
> >  						    pix_mp->height);
> > -		else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME &&
> > +		else if (fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME &&
> >  			 !hantro_needs_postproc(ctx, fmt))
> >  			pix_mp->plane_fmt[0].sizeimage +=
> >  				hantro_vp9_mv_size(pix_mp->width,
> >  						   pix_mp->height);
> > -		else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE &&
> > +		else if (fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE &&
> >  			 !hantro_needs_postproc(ctx, fmt))
> >  			pix_mp->plane_fmt[0].sizeimage +=
> >  				hantro_hevc_mv_size(pix_mp->width,
> 
