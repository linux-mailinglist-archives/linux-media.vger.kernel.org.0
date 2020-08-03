Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC2CA23B13C
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 01:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbgHCXtn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 19:49:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51926 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgHCXtn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 19:49:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 93734296F2E
Subject: Re: [PATCH v3 03/10] media: staging: rkisp1: cap: remove unsupported
 format YUV444
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
 <20200723132014.4597-4-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <be2ecf0c-1e79-1181-e473-796420e7f53f@collabora.com>
Date:   Mon, 3 Aug 2020 20:49:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723132014.4597-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 7/23/20 10:20 AM, Dafna Hirschfeld wrote:
> It is not clear if the device is able to support format
> V4L2_PIX_FMT_YUV444M, and also this is not an important format
> so remove it.

I would just improve this a bit, how did you reach this conclusion,
what is not clear, tests you made, etc.
I know this was discussed a in previous thread, but it would be nice
to add the info here.

Regards,
Helen

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 470e49d5d889..fd0864194203 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -131,12 +131,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  		.uv_swap = 1,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
>  	},
> -	/* yuv444 */
> -	{
> -		.fourcc = V4L2_PIX_FMT_YUV444M,
> -		.uv_swap = 0,
> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
> -	},
>  	/* yuv400 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_GREY,
> @@ -243,13 +237,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
>  	},
> -	/* yuv444 */
> -	{
> -		.fourcc = V4L2_PIX_FMT_YUV444M,
> -		.uv_swap = 0,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV444,
> -	},
>  	/* yuv400 */
>  	{
>  		.fourcc = V4L2_PIX_FMT_GREY,
> 
