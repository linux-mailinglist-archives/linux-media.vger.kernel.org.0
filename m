Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18A549072E
	for <lists+linux-media@lfdr.de>; Mon, 17 Jan 2022 12:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239127AbiAQLen (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 06:34:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34138 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233803AbiAQLen (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 06:34:43 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE872596;
        Mon, 17 Jan 2022 12:34:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642419281;
        bh=cMzvJinieKNaujPsAHV/k3GPrWetfBFmhTwoaBgInkg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jmLQsEVEPBFuUyHQ7fkqFwc7CgnDCPoUmtJ5EAZ09OKwhUxUm3Gx3cEozBETeroZk
         d481AnTdKGhoXSSGVhuB5+JB5RRdC4Iems/Q+GdXGF2RFEoqr4G/zBcj8+TXXPhDvu
         TZnOEOwgvUh037DPumAhh6ksKSyS858Q2q62Zsgw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211207115923.13639-1-dafna.hirschfeld@collabora.com>
References: <20211207115923.13639-1-dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH v2] media: rkisp1: fix grey format iommu page faults
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     nicolas.dufresne@collabora.com,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Date:   Mon, 17 Jan 2022 11:34:39 +0000
Message-ID: <164241927947.10801.12217816997308426483@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Quoting Dafna Hirschfeld (2021-12-07 11:59:23)
> Currently capturing grey format produces page faults
> on both selfpath and mainpath. To support greyscale
> we can capture YUV422 planar format and configure the U, V
> buffers to the dummy buffer.
>=20
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> This is v2 of the patch "media: rkisp1: remove support for V4L2_PIX_FMT_G=
REY"
> In v1 I removed the grey format. In this version it is 'fixed'
>=20
>  .../platform/rockchip/rkisp1/rkisp1-capture.c | 28 ++++++++++++++-----
>  1 file changed, 21 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/dr=
ivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 768987d5f2dd..8e982dd0c740 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -249,7 +249,7 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_=
fmts[] =3D {
>                 .fourcc =3D V4L2_PIX_FMT_GREY,
>                 .uv_swap =3D 0,
>                 .write_format =3D RKISP1_MI_CTRL_SP_WRITE_PLA,
> -               .output_format =3D RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
> +               .output_format =3D RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>                 .mbus =3D MEDIA_BUS_FMT_YUYV8_2X8,
>         },
>         /* rgb */
> @@ -631,12 +631,26 @@ static void rkisp1_set_next_buf(struct rkisp1_captu=
re *cap)
>                 rkisp1_write(cap->rkisp1,
>                              buff_addr[RKISP1_PLANE_Y],
>                              cap->config->mi.y_base_ad_init);
> -               rkisp1_write(cap->rkisp1,
> -                            buff_addr[RKISP1_PLANE_CB],
> -                            cap->config->mi.cb_base_ad_init);
> -               rkisp1_write(cap->rkisp1,
> -                            buff_addr[RKISP1_PLANE_CR],
> -                            cap->config->mi.cr_base_ad_init);
> +               /*
> +                * In order to support grey format we capture
> +                * YUV422 planar format from the camera and
> +                * set the U and V planes to the dummy buffer
> +                */
> +               if (cap->pix.cfg->fourcc =3D=3D V4L2_PIX_FMT_GREY) {
> +                       rkisp1_write(cap->rkisp1,
> +                                    cap->buf.dummy.dma_addr,
> +                                    cap->config->mi.cb_base_ad_init);
> +                       rkisp1_write(cap->rkisp1,
> +                                    cap->buf.dummy.dma_addr,
> +                                    cap->config->mi.cr_base_ad_init);
> +               } else {
> +                       rkisp1_write(cap->rkisp1,
> +                                    buff_addr[RKISP1_PLANE_CB],
> +                                    cap->config->mi.cb_base_ad_init);
> +                       rkisp1_write(cap->rkisp1,
> +                                    buff_addr[RKISP1_PLANE_CR],
> +                                    cap->config->mi.cr_base_ad_init);
> +               }
>         } else {

Looking at this function, I think I would have initialised a local array
of addresses (either to zero, or to the dummy address?) to then set
values when appropriate, and reduce the number of calls to
rkisp1_write() to a single set of three after the processing.

It might make the function simpler, and more readable, but it's more
effort, and this does look like it will solve the greyscale format issue
as discussed in earlier threads so I'd leave it up to you if you want to
refactor.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


>                 /*
>                  * Use the dummy space allocated by dma_alloc_coherent to
> --=20
> 2.17.1
>
