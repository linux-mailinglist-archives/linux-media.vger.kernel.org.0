Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D1B248F8A
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 22:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgHRURy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 16:17:54 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:4453 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgHRURw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 16:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=RuCvMrKp6VxvZO5UUtpowl0fsiqeJBEj5FSA4Vxbrxg=;
        b=ilGqXaes4aR7WXymCDQeoPY6eyzYSlRpuUcbmzm6ZKlXSe8Sg22nIxI3a3O1wQ0NDHtO
        npfeYM/2M9zP2N4z8rN5vE6gRyzQImleinf0jJD1ughOigUfkGptye73+i8VglsscTuXJO
        xXAi/xBsSiIfq8bQmz1xTmFCWNgILziL4=
Received: by filterdrecv-p3las1-5785d94c6b-r9wzj with SMTP id filterdrecv-p3las1-5785d94c6b-r9wzj-18-5F3C376E-9E
        2020-08-18 20:17:50.924530207 +0000 UTC m=+445696.706536938
Received: from [192.168.1.14] (unknown)
        by ismtpd0004p1lon1.sendgrid.net (SG) with ESMTP
        id UUXgryapThOfjJcLbvDddw
        Tue, 18 Aug 2020 20:17:50.369 +0000 (UTC)
Subject: Re: [PATCH v3 16/19] media: rkvdec: Drop unneeded per_request
 driver-specific control flag
References: <20200814133634.95665-1-ezequiel@collabora.com>
 <20200814133634.95665-17-ezequiel@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <7ce53e65-1a05-bef7-afe7-9a5113d5bd4f@kwiboo.se>
Date:   Tue, 18 Aug 2020 20:17:51 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200814133634.95665-17-ezequiel@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h8514vzcITDp0ijey?=
 =?us-ascii?Q?7D32ZAyPLrQtiOsInGIlwvONBhI6ZigZkC=2F72=2F6?=
 =?us-ascii?Q?7I2FfZp4SuurJ9dE6OjQ44foVU2ABQXdDPLYh=2FS?=
 =?us-ascii?Q?V7qfbPQj3GnHbT1v7lggia=2FqZXYgvB3xOzPie0Z?=
 =?us-ascii?Q?qaME9h7sRdScmeXFzky19Z5OI=2FpvdpCHHt=2FSWsM?=
 =?us-ascii?Q?Tv8zOO78NjyNvF+=2FsLmKQ=3D=3D?=
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On 2020-08-14 15:36, Ezequiel Garcia wrote:
> Currently, the drivers makes no distinction between per_request
> and mandatory, as both are used in the same request validate check.
> 
> The driver only cares to know if a given control is
> required to be part of a request, so only one flag is needed.

This patch cause decoding issues with ffmpeg.

The removal of per_request makes DECODE_MODE and START_CODE ctrls
mandatory to be included in the request.

Best regards,
Jonas

> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 6 +-----
>  drivers/staging/media/rkvdec/rkvdec.h | 1 -
>  2 files changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 7c5129593921..cd720d726d7f 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -55,23 +55,19 @@ static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
>  
>  static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
>  	{
> -		.per_request = true,
>  		.mandatory = true,
>  		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
>  	},
>  	{
> -		.per_request = true,
>  		.mandatory = true,
>  		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SPS,
>  		.cfg.ops = &rkvdec_ctrl_ops,
>  	},
>  	{
> -		.per_request = true,
>  		.mandatory = true,
>  		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PPS,
>  	},
>  	{
> -		.per_request = true,
>  		.mandatory = true,
>  		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
>  	},
> @@ -615,7 +611,7 @@ static int rkvdec_request_validate(struct media_request *req)
>  		u32 id = ctrls->ctrls[i].cfg.id;
>  		struct v4l2_ctrl *ctrl;
>  
> -		if (!ctrls->ctrls[i].per_request || !ctrls->ctrls[i].mandatory)
> +		if (!ctrls->ctrls[i].mandatory)
>  			continue;
>  
>  		ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl, id);
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> index 2fc9f46b6910..77a137cca88e 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.h
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -25,7 +25,6 @@
>  struct rkvdec_ctx;
>  
>  struct rkvdec_ctrl_desc {
> -	u32 per_request : 1;
>  	u32 mandatory : 1;
>  	struct v4l2_ctrl_config cfg;
>  };
> 
