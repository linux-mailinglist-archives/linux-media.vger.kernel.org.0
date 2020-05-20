Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197C01DC216
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 00:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbgETWfE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 18:35:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41768 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbgETWfE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 18:35:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 29D912A1B13
Subject: Re: [PATCH v2 4/4] media: staging: rkisp1: cap: remove support of
 BGR666 format
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-5-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <fc4dbc40-ab57-0ca4-4ac7-5ffdb7f0ad81@collabora.com>
Date:   Wed, 20 May 2020 19:34:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515142952.20163-5-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 5/15/20 11:29 AM, Dafna Hirschfeld wrote:
> The rkisp1 supports RGB encoding with 6 bits per
> color with the following format:
> - - b5 b4 b3 b2 b1 b0 - - g5 g4 g3 g2 g1 g0 - - r5 r4 r3 r2 r1 r0 - - - - - - - -

Is this the same as V4L2_PIX_FMT_XBGR32 format, but with colors range from 0 to 63 ?

I was wondering what is the usage of such a format. If it is useful, then I'm sad
to see this being removed from the driver, since this is a v4l2 api limitation, and not
a hw limitation.

Regards,
Helen

> 
> This is not how V4L2_PIX_FMT_BGR666 is defined, so remove
> this format from the driver's formats list.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 61b9ebe577b2..2660e44eda88 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -283,10 +283,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  		.fourcc = V4L2_PIX_FMT_RGB565,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
> -	}, {
> -		.fourcc = V4L2_PIX_FMT_BGR666,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB666,
>  	},
>  };
>  
> 
