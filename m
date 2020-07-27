Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0766322FBC8
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 00:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgG0WDd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 18:03:33 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:38952 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgG0WDd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 18:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=w2bDNJZ76P9qJ19x5xB00kMLUR4+ZgAUg8Ijbwn+DLA=;
        b=sRkYK5XabzB5/UUKrx2kGwHUiyaCOb3S58Ql5Zj2zmLjA2ku0DBwS+oYRp1N7NpFPuil
        YYM4yCBPcdSt8H6JhPSLBPcq2p9zBDbx1xsmERfdpHU7n3Cn9Q518tyuofCqjLkDSndbCh
        eWkCnluUY/9cErabpmIfHSDl1SHAJeQ+U=
Received: by filterdrecv-p3iad2-5b55dcd864-m99xc with SMTP id filterdrecv-p3iad2-5b55dcd864-m99xc-18-5F1F4F33-B5
        2020-07-27 22:03:31.636807693 +0000 UTC m=+2696046.241755925
Received: from [192.168.1.14] (unknown)
        by ismtpd0001p1lon1.sendgrid.net (SG) with ESMTP
        id i_qwivOTRUCQfKgZSd4ODw
        Mon, 27 Jul 2020 22:03:31.287 +0000 (UTC)
Subject: Re: [PATCH 10/10] media: rkvdec: Don't require unneeded
 H264_SLICE_PARAMS
References: <20200715202233.185680-1-ezequiel@collabora.com>
 <20200715202233.185680-11-ezequiel@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <13935609-c123-3eae-9a18-c11ece2f59e9@kwiboo.se>
Date:   Mon, 27 Jul 2020 22:03:31 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715202233.185680-11-ezequiel@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hySkcpyJxVVHTnEQc?=
 =?us-ascii?Q?+vC59FDvRguz4eio+Q+kuDyCnvNMtKH55NhSJJw?=
 =?us-ascii?Q?R7ujHnm5=2FdyT+4C4fAn=2FbSiYAeT4=2Fz46zMaz=2FWW?=
 =?us-ascii?Q?lJMXvZwY6SjI17j6KfWwaguCxI0pSSJFaTS0wCs?=
 =?us-ascii?Q?LEKRWyRlmAxWMLci3qONZteXLI2Lu=2FTUr=2FVEchc?=
 =?us-ascii?Q?9qN=2F553hSxcuQYU7Fa=2F4A=3D=3D?=
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2020-07-15 22:22, Ezequiel Garcia wrote:
> Now that slice invariant parameters have been moved,
> the driver no longer needs this control, so drop it.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 4 ----
>  drivers/staging/media/rkvdec/rkvdec.c      | 5 -----
>  2 files changed, 9 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index 57c084910b3b..f6e1fa19d625 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -109,7 +109,6 @@ struct rkvdec_h264_reflists {
>  struct rkvdec_h264_run {
>  	struct rkvdec_run base;
>  	const struct v4l2_ctrl_h264_decode_params *decode_params;
> -	const struct v4l2_ctrl_h264_slice_params *slices_params;
>  	const struct v4l2_ctrl_h264_sps *sps;
>  	const struct v4l2_ctrl_h264_pps *pps;
>  	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
> @@ -1067,9 +1066,6 @@ static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
>  	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
>  	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
>  			      V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS);
> -	run->slices_params = ctrl ? ctrl->p_cur.p : NULL;
> -	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
> -			      V4L2_CID_MPEG_VIDEO_H264_SPS);

V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS line should be removed not SPS :-)

With that fixed,

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Best regards,
Jonas

>  	run->sps = ctrl ? ctrl->p_cur.p : NULL;
>  	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
>  			      V4L2_CID_MPEG_VIDEO_H264_PPS);
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index accb4a902fdd..8ebc9dfc83be 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -59,11 +59,6 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
>  		.mandatory = true,
>  		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
>  	},
> -	{
> -		.per_request = true,
> -		.mandatory = true,
> -		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
> -	},
>  	{
>  		.per_request = true,
>  		.mandatory = true,
> 
