Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E7325FF52
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 18:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729853AbgIGQaa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 12:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729631AbgIGO1I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 10:27:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5CDC061757
        for <linux-media@vger.kernel.org>; Mon,  7 Sep 2020 07:20:39 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id B4DE72988B0
Subject: Re: [PATCH v4 03/10] media: staging: rkisp1: cap: remove unsupported
 format YUV444
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
 <20200901111612.10552-4-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <9147c38d-790e-e486-5b6f-a8af922641b4@collabora.com>
Date:   Mon, 7 Sep 2020 11:19:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901111612.10552-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 9/1/20 8:16 AM, Dafna Hirschfeld wrote:
> It is not clear if the device is able to support format
> V4L2_PIX_FMT_YUV444M so remove it.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> see the cover letter for details

This commit message could have a bit more details, since it will
remain in the git history. At least mentioning that
it was tested in several configurations and you weren't able to
get good frames.

In any case:

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> 
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 79195e74d995..022b8eeed426 100644
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
