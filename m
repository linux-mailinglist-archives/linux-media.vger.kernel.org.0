Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B962F6F3640
	for <lists+linux-media@lfdr.de>; Mon,  1 May 2023 20:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbjEASvC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 14:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjEASvB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 14:51:01 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0185F198A
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 11:50:59 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-5f45fad3be1so26834766d6.0
        for <linux-media@vger.kernel.org>; Mon, 01 May 2023 11:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1682967059; x=1685559059;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1IrKN9yQpj4+PbmG8SIT7+msTT91q+chwYH/2Xg1TcE=;
        b=hedcBqmnBA1oJcgDT5njSgePClDMmN8QAyNivh2nLGm+v/i2sPlqVp3U5VKsYqnUYR
         m0G6n3KU6/FgXyabIdTEG8V5NZtTPZmovX+fA0zRg3ADpKxs1RXJ+0uQ1pI52B+/6K3F
         d3CQ68ONqQs6A2L6Cy6Q0croWPiwQCxlko3PjRnH3Yvf8BHYtgkxF8NLaoxiCFltAW3K
         xAz7toDwYAxnITtlvSD/yVCoPQ16dEgjmL9CV4ysdDL8t4t6oDTU+ElYNt6LxWaYm7f1
         AK3nF7DoNNQPUT5elKQsRLnWOR+UYiR2IBN3GoM0m5x0z9tfhGWUDIx0qZ2hBiXeHa4f
         aH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682967059; x=1685559059;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1IrKN9yQpj4+PbmG8SIT7+msTT91q+chwYH/2Xg1TcE=;
        b=JmgCPsyma2cDjwsyGi3Pe2rnUPC2HKfYDdy+/yZI3t4jmCSO3RVkMfC871VItK/w7+
         KTgPKP62rIiEPUhyvR7tUbYxhLFCfTjAaVe5j3FuRYlbA9qgoGIr10fgyoXFzeivKp2e
         uJLkZya24paVx/M4BhyB/nYIPfA2BN+xTXxpQmKoGlxg5DCP7YBbHKhHktrS3tU1y/WV
         lKcMFWnBRinmVkM6JINBUv2KA5rFj5kiy/mFDi1PFsLOzL80rtu9+TTUeLMZaPy4Qpay
         iy4a6nr/rzs+WpxpSPKt15RM+sNCZ1PX5irUnat/SjsTSyYogs44ayZuGszdwR3JTvRT
         7Irw==
X-Gm-Message-State: AC+VfDwmurpaRczb5VeZtQCq6kkSQWcUycINyUYLfnKk3HRIOvXydr8G
        owIDddnsiRNnX6E1r1MpUH/EYg==
X-Google-Smtp-Source: ACHHUZ7+pfQxUxJ0ZORCmS00RcCCJYQW0hmZdX2fRHxGy1/XhbEh8T5qxYUBY1qFCNOil3VOV1HKWA==
X-Received: by 2002:a05:6214:23c9:b0:619:ca55:9709 with SMTP id hr9-20020a05621423c900b00619ca559709mr1578917qvb.21.1682967058905;
        Mon, 01 May 2023 11:50:58 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:199e::7a9])
        by smtp.gmail.com with ESMTPSA id y4-20020a0ce044000000b0061b58b07130sm966247qvk.137.2023.05.01.11.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 11:50:58 -0700 (PDT)
Message-ID: <f4da6f1e5218db0417429a7fb5ebfdb95928e240.camel@ndufresne.ca>
Subject: Re: [PATCH] media: verisilicon: Final fix for the crash when
 opening the driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date:   Mon, 01 May 2023 14:50:57 -0400
In-Reply-To: <20230421104759.2236463-1-m.szyprowski@samsung.com>
References: <CGME20230421104811eucas1p16ad5e11ebc4d305c6fab372d3743b6e1@eucas1p1.samsung.com>
         <20230421104759.2236463-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 21 avril 2023 =C3=A0 12:47 +0200, Marek Szyprowski a =C3=A9crit=
=C2=A0:
> ctx->vpu_src_fmt is no more initialized before calling hantro_try_fmt()
> so checking it led to crash the kernel. Simply use the provided 'fmt' as
> a format for those checks.
>=20
> This fixes the following issue observed on Odroid-M1 board:
>=20
>  Unable to handle kernel NULL pointer dereference at virtual address 0000=
000000000008
>  Mem abort info:
>  ...
>  Modules linked in: crct10dif_ce hantro_vpu snd_soc_simple_card snd_soc_s=
imple_card_utils v4l2_vp9 v4l2_h264 rockchip_saradc v4l2_mem2mem videobuf2_=
dma_contig videobuf2_memops rtc_rk808 videobuf2_v4l2 industrialio_triggered=
_buffer rockchip_thermal dwmac_rk stmmac_platform stmmac videodev kfifo_buf=
 display_connector videobuf2_common pcs_xpcs mc rockchipdrm analogix_dp dw_=
mipi_dsi dw_hdmi drm_display_helper panfrost drm_shmem_helper gpu_sched ip_=
tables x_tables ipv6
>  CPU: 3 PID: 176 Comm: v4l_id Not tainted 6.3.0-rc7-next-20230420 #13481
>  Hardware name: Hardkernel ODROID-M1 (DT)
>  pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>  pc : hantro_try_fmt+0xa0/0x278 [hantro_vpu]
>  lr : hantro_try_fmt+0x94/0x278 [hantro_vpu]
>  ...
>  Call trace:
>   hantro_try_fmt+0xa0/0x278 [hantro_vpu]
>   hantro_set_fmt_out+0x3c/0x298 [hantro_vpu]
>   hantro_reset_raw_fmt+0x98/0x128 [hantro_vpu]
>   hantro_set_fmt_cap+0x240/0x254 [hantro_vpu]
>   hantro_reset_encoded_fmt+0x94/0xcc [hantro_vpu]
>   hantro_reset_fmts+0x18/0x38 [hantro_vpu]
>   hantro_open+0xd4/0x20c [hantro_vpu]
>   v4l2_open+0x80/0x120 [videodev]
>   chrdev_open+0xc0/0x22c
>   do_dentry_open+0x13c/0x48c
>   vfs_open+0x2c/0x38
>   path_openat+0x550/0x934
>   do_filp_open+0x80/0x12c
>   do_sys_openat2+0xb4/0x168
>   __arm64_sys_openat+0x64/0xac
>   invoke_syscall+0x48/0x114
>   el0_svc_common+0x100/0x120
>   do_el0_svc+0x3c/0xa8
>   el0_svc+0x40/0xa8
>   el0t_64_sync_handler+0xb8/0xbc
>   el0t_64_sync+0x190/0x194
>  Code: 97fc8a7f f940aa80 52864a61 72a686c1 (b9400800)=20
>  ---[ end trace 0000000000000000 ]---
>=20
> Fixes: db6f68b51e5c ("media: verisilicon: Do not set context src/dst form=
ats in reset functions")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> It looks that I've missed the fact that the first fix merged as commit
> f100ce3bbd6a ("media: verisilicon: Fix crash when probing encoder") did
> not fix all the issues introduced by db6f68b51e5c ("media: verisilicon:
> Do not set context src/dst formats in reset functions"). I'm really sorry
> for that.
> ---
>  drivers/media/platform/verisilicon/hantro_v4l2.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
> index 835518534e3b..618ea23a7d49 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -313,17 +313,17 @@ static int hantro_try_fmt(const struct hantro_ctx *=
ctx,
>  		/* Fill remaining fields */
>  		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
>  				    pix_mp->height);
> -		if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_H264_SLICE &&
> +		if (fmt->fourcc =3D=3D V4L2_PIX_FMT_H264_SLICE &&

In this context, we have !coded, so fmt->fourcc will never be any of H264, =
VP9
or HEVC, so we'llnever allocate space for motion vector. I'm surprise you a=
re
getting anything working after that. What this code is trying to achieve is=
 to
pad the size of raw images depending on the selected coded format (opposite
queue).

I think the proper fix is to actually fix the default coded format setup. T=
his
will ensure that vpu_src_fmt is always valid. The same pointer can be used =
in
start-streaming it seems.

>  		    !hantro_needs_postproc(ctx, fmt))
>  			pix_mp->plane_fmt[0].sizeimage +=3D
>  				hantro_h264_mv_size(pix_mp->width,
>  						    pix_mp->height);
> -		else if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_VP9_FRAME &&
> +		else if (fmt->fourcc =3D=3D V4L2_PIX_FMT_VP9_FRAME &&
>  			 !hantro_needs_postproc(ctx, fmt))
>  			pix_mp->plane_fmt[0].sizeimage +=3D
>  				hantro_vp9_mv_size(pix_mp->width,
>  						   pix_mp->height);
> -		else if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_HEVC_SLICE &&
> +		else if (fmt->fourcc =3D=3D V4L2_PIX_FMT_HEVC_SLICE &&
>  			 !hantro_needs_postproc(ctx, fmt))
>  			pix_mp->plane_fmt[0].sizeimage +=3D
>  				hantro_hevc_mv_size(pix_mp->width,

