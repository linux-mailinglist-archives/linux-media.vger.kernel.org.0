Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0B92154E4
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 11:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbgGFJps (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 05:45:48 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:32121 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728299AbgGFJpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 05:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=rvLDHxfrHlo3Otfv/kTs7QJwT/t3WC4PX7Ybs44eM+I=;
        b=jbZOEYwz91P6/LEMqcDKxkPB8I3dcATl6ZugqIrh0HXQdYpdDkSLR9RIO/P7d5hI5OgK
        3L8L2Nms/CDlJjQ4qfxPp3ETZWJpAWQFb9xnr65ppX3qs0oJh/nTLBKSk/iHbAS5xy3nQ0
        vqmaCbFKoKvkiEdJkeK1yHqMYD/LOmvR0=
Received: by filterdrecv-p3mdw1-75c584b9c6-4xwkm with SMTP id filterdrecv-p3mdw1-75c584b9c6-4xwkm-18-5F02F2CA-A
        2020-07-06 09:45:46.161499776 +0000 UTC m=+837368.642959845
Received: from [192.168.1.14] (unknown)
        by ismtpd0005p1lon1.sendgrid.net (SG) with ESMTP
        id ZYAMUW8kRXGzWA_jlRz-5g
        Mon, 06 Jul 2020 09:45:45.891 +0000 (UTC)
Subject: Re: [PATCH 1/2] rkvdec: h264: Refuse to decode unsupported bitstream
References: <20200626171130.27346-1-ezequiel@collabora.com>
 <20200626171130.27346-2-ezequiel@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <551304f5-88bd-a673-a0ef-47af65700fe7@kwiboo.se>
Date:   Mon, 06 Jul 2020 09:45:46 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200626171130.27346-2-ezequiel@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h2vJGzwXeGW+hCLrj?=
 =?us-ascii?Q?dhOVvE6NWrUK6wFWeiUTqhwTnvLUFyzDIZaB8lm?=
 =?us-ascii?Q?aJqcyCVh4Z8Bl772YUAcGAX576Qsb5qQqHbfpNB?=
 =?us-ascii?Q?L5bJAF+2spZBrBmCctDWy79T7r=2FGD0saK0xx37P?=
 =?us-ascii?Q?BJiURZ4j5RPU4+skcv33yaKpeGvsiZ7HXcAELnp?=
 =?us-ascii?Q?0RuEbJ7Td7CGvJKqYFNjg=3D=3D?=
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        kernel@collabora.com
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-06-26 19:11, Ezequiel Garcia wrote:
> The hardware only supports 4:2:2, 4:2:0 or 4:0:0 (monochrome),
> 8-bit or 10-bit depth content.
> 
> Verify that the PPS refers to a supported bitstream, and refuse

This should be SPS not PPS, same for hantro patch.

> unsupported bitstreams by failing at TRY_EXT_CTRLS time.
> 
> The driver is currently broken on 10-bit and 4:2:2
> so disallow those as well.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 225eeca73356..0f81b47792f6 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -27,6 +27,32 @@
>  #include "rkvdec.h"
>  #include "rkvdec-regs.h"
>  
> +static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_SPS) {
> +		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_cur.p;

This should be p_new and not p_cur to validate the new ctrl value, same for hantro patch.

With both fixed this and the hantro patch is,

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Regards,
Jonas

> +		/*
> +		 * TODO: The hardware supports 10-bit and 4:2:2 profiles,
> +		 * but it's currently broken in the driver.
> +		 * Reject them for now, until it's fixed.
> +		 */
> +		if (sps->chroma_format_idc > 1)
> +			/* Only 4:0:0 and 4:2:0 are supported */
> +			return -EINVAL;
> +		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
> +			/* Luma and chroma bit depth mismatch */
> +			return -EINVAL;
> +		if (sps->bit_depth_luma_minus8 != 0)
> +			/* Only 8-bit is supported */
> +			return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
> +	.try_ctrl = rkvdec_try_ctrl,
> +};
> +
>  static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
>  	{
>  		.per_request = true,
> @@ -42,6 +68,7 @@ static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
>  		.per_request = true,
>  		.mandatory = true,
>  		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SPS,
> +		.cfg.ops = &rkvdec_ctrl_ops,
>  	},
>  	{
>  		.per_request = true,
> 
