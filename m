Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA90217D77
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 05:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbgGHDTQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 23:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728335AbgGHDTQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 23:19:16 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889C8C061755;
        Tue,  7 Jul 2020 20:19:16 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C13EA2A4F7D
Message-ID: <97a4c51aa5cfcdef7f4c96fcf84f85bd7c8b3729.camel@collabora.com>
Subject: Re: [PATCH v2 12/12] media: rkvdec: h264: Support profile and level
 controls
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 08 Jul 2020 00:19:05 -0300
In-Reply-To: <20200706215430.22859-13-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
         <20200706215430.22859-1-jonas@kwiboo.se>
         <20200706215430.22859-13-jonas@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-07-06 at 21:54 +0000, Jonas Karlman wrote:
> The Rockchip Video Decoder used in RK3399 supports H.264 profiles from
> Baseline to High 4:2:2 up to Level 5.1, except for the Extended profile.
> 
> Expose the V4L2_CID_MPEG_VIDEO_H264_PROFILE and the
> V4L2_CID_MPEG_VIDEO_H264_LEVEL control, so that userspace can query the
> driver for the list of supported profiles and level.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> Changes in v2:
> - Moved to end
> - Collect r-b tag
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 4faee9262392..b21031535330 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -144,6 +144,19 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
>  		.cfg.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
>  		.cfg.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
>  	},
> +	{
> +		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
> +		.cfg.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,

Nicolas recently pointed out to me that our drivers
can't support ASO/FMO baseline features, and so
seems we need to leave baseline out.

(Applies to Hantro as well).

Thanks,
Ezequiel

> +		.cfg.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_422,
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


