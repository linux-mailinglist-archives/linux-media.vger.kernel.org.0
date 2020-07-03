Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161902131EB
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 04:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgGCCyg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 22:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgGCCyg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 22:54:36 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3746BC08C5C1;
        Thu,  2 Jul 2020 19:54:36 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B1CD62A2D53
Message-ID: <8daa49704a14764bfe0797cbf802bad3d64ede17.camel@collabora.com>
Subject: Re: [PATCH 1/9] media: rkvdec: h264: Support profile and level
 controls
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 02 Jul 2020 23:54:23 -0300
In-Reply-To: <20200701215616.30874-2-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
         <20200701215616.30874-2-jonas@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2020-07-01 at 21:56 +0000, Jonas Karlman wrote:
> The Rockchip Video Decoder used in RK3399 supports H.264 profiles from
> Baseline to High 4:2:2 up to Level 5.1, except for the Extended profile.
> 
> Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE and the
> V4L2_CID_MPEG_VIDEO_H264_LEVEL control, so that userspace can query the
> driver for the list of supported profiles and level.
> 
> In current state only Baseline to High profile is supported by the driver.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

I think the patch is good so:

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

However, feel free to just drop this patch and support the profiles
and levels at the end of the patchset, once High 10 and High 422
support is there.

Thanks,
Ezequiel

> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 0f81b47792f6..b1de55aa6535 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -94,6 +94,19 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
>  		.cfg.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
>  		.cfg.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
>  	},
> +	{
> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.cfg.menu_skip_mask =
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
> +		.cfg.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
> +		.cfg.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.cfg.max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1,
> +	},
>  };
>  
>  static const struct rkvdec_ctrls rkvdec_h264_ctrls = {


