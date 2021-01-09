Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5482EFF7E
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 13:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbhAIMgv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jan 2021 07:36:51 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34312 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725896AbhAIMgv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jan 2021 07:36:51 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 44C971F45F1B
Message-ID: <ad42babfca4a34d31875ff4f1250f4869be3a5a1.camel@collabora.com>
Subject: Re: [PATCH v3] staging: media: rkvdec: rkvdec.c: Use semicolon in
 place of comma
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Sri Laasya Nutheti <nutheti.laasya@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Date:   Sat, 09 Jan 2021 09:36:01 -0300
In-Reply-To: <20210109121349.wuf7xpkqicjadlnf@nutheti>
References: <20210109121349.wuf7xpkqicjadlnf@nutheti>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2021-01-09 at 17:43 +0530, Sri Laasya Nutheti wrote:
> Line 146 had a comma in place of a semicolon. Fix it.
> 
> Signed-off-by: Sri Laasya Nutheti <nutheti.laasya@gmail.com>
> ---
> v3: Corrected email recipients
>  drivers/staging/media/rkvdec/rkvdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index aa4f8c287618..d3eb81ee8dc2 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -143,7 +143,7 @@ static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
>         memset(f, 0, sizeof(*f));
>         f->fmt.pix_mp.pixelformat = fourcc;
>         f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> -       f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709,
> +       f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
>         f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>         f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>         f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;

A fix was sent already for this:

https://patchwork.kernel.org/project/linux-rockchip/patch/20201204233743.GA8530@linuxmint-midtower-pc/

Thanks,
Ezequiel

