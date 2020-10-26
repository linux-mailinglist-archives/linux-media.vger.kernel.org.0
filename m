Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0F88299327
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 17:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1786821AbgJZQ6g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 12:58:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33220 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1786771AbgJZQ6f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 12:58:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 24D8E1F44F7B
Subject: Re: [PATCH] media: staging: rkisp1: capture: set default quantization
 on 'set_fmt'
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201026162848.18310-1-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <56efb732-860c-a2e1-ef55-975d0ace2773@collabora.com>
Date:   Mon, 26 Oct 2020 13:58:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201026162848.18310-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10/26/20 1:28 PM, Dafna Hirschfeld wrote:
> On 's/try_fmt' ioctl, set the quantization field to
> V4L2_QUANTIZATION_DEFAULT. This fixes the compliance
> errors:
> 
> fail: v4l2-test-formats.cpp(357): quantization >= 0xff
> fail: v4l2-test-formats.cpp(473): testColorspace(!node->is_io_mc, pix_mp.pixelformat, pix_mp.colorspace, pix_mp.ycbcr_enc, pix_mp.quantization)
> test VIDIOC_TRY_FMT: FAIL
> fail: v4l2-test-formats.cpp(357): quantization >= 0xff
> fail: v4l2-test-formats.cpp(473): testColorspace(!node->is_io_mc, pix_mp.pixelformat, pix_mp.colorspace, pix_mp.ycbcr_enc, pix_mp.quantization)
> test VIDIOC_S_FMT: FAIL
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks!
Helen

> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index b6f497ce3e95..9a0f88b2254b 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -1132,6 +1132,7 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
>  	pixm->field = V4L2_FIELD_NONE;
>  	pixm->colorspace = V4L2_COLORSPACE_DEFAULT;
>  	pixm->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	pixm->quantization = V4L2_QUANTIZATION_DEFAULT;
>  
>  	info = rkisp1_fill_pixfmt(pixm, cap->id);
>  
> 
