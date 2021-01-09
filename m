Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A4B2EFF79
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 13:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbhAIMgJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jan 2021 07:36:09 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34302 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbhAIMgH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jan 2021 07:36:07 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 673821F447AC
Message-ID: <7647e289689d186d048afd0d18f91c919e38d8fc.camel@collabora.com>
Subject: Re: [PATCH v2 -next] media: rkvdec: convert comma to semicolon
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org
Date:   Sat, 09 Jan 2021 09:35:16 -0300
In-Reply-To: <20210108092244.18845-1-zhengyongjun3@huawei.com>
References: <20210108092244.18845-1-zhengyongjun3@huawei.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2021-01-08 at 17:22 +0800, Zheng Yongjun wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index d25c4a37e2af..66572066e7a0 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -130,7 +130,7 @@ static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f,
>         memset(f, 0, sizeof(*f));
>         f->fmt.pix_mp.pixelformat = fourcc;
>         f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> -       f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709,
> +       f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
>         f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>         f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>         f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;

Seems a fix was sent already for this:

https://patchwork.kernel.org/project/linux-rockchip/patch/20201204233743.GA8530@linuxmint-midtower-pc/

Thanks,
Ezequiel

