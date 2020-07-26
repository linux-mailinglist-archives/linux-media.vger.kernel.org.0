Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6580822DCF2
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 09:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgGZHmf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 03:42:35 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:47577 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgGZHme (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 03:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=yP7cIiqVZpDMGkAoiIM0YOAEn7R/4aAcE6eYqJxNcok=;
        b=g1DW1ME5rqISfstGMMPt2t/zlBKAsq2f6pQ8sMhPpCG25NVcGzdbzaCx9Q5Qf1isvuoq
        wbfbmhnsY22t4smIDP/pNqTBNNnnYxbtmaQviN0VTu0odxMWwR6UwYTMXlVIZbFBqlEn89
        vAj3tmyOwn6alpWZFoo1PX8Qx5ZDqxFhU=
Received: by filterdrecv-p3mdw1-75c584b9c6-hmqrz with SMTP id filterdrecv-p3mdw1-75c584b9c6-hmqrz-19-5F1D33E9-27
        2020-07-26 07:42:33.845393196 +0000 UTC m=+2557983.307530721
Received: from [192.168.1.14] (unknown)
        by ismtpd0005p1lon1.sendgrid.net (SG) with ESMTP
        id vFKMZyTBQH-7MKI53b8fMg
        Sun, 26 Jul 2020 07:42:33.488 +0000 (UTC)
Subject: Re: [PATCH 2/2] hantro: postproc: Fix motion vector space allocation
References: <20200725155208.897908-1-ezequiel@collabora.com>
 <20200725155208.897908-3-ezequiel@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <783c2943-e601-23f1-1c23-aa8f67140ac1@kwiboo.se>
Date:   Sun, 26 Jul 2020 07:42:33 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200725155208.897908-3-ezequiel@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0hzSSfDTeVfUVVWFmh?=
 =?us-ascii?Q?1Bldmh4FlHUEibY=2F2RpZZ8KnQTcHQN8rmETigHS?=
 =?us-ascii?Q?OrAlXbiqySZ8iHzJHGSCxSHLGNsn86Ts2sLD8is?=
 =?us-ascii?Q?mWWcsCS4dKCcgwDG3FF5S7B6A4b8kFxP98NOqyD?=
 =?us-ascii?Q?GYL8HD4XxBru3ztwgVsM2vvQPToFgguGQDnSTOB?=
 =?us-ascii?Q?LuhvzoJLaW7ietByUmfOg=3D=3D?=
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Adrian Ratiu <adrian.ratiu@collabora.com>, kernel@collabora.com
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-07-25 17:52, Ezequiel Garcia wrote:
> When the post-processor is enabled, the driver allocates
> "shadow buffers" which are used for the decoder core,
> and exposes the post-processed buffers to userspace.
> 
> For this reason, extra motion vector space has to
> be allocated on the shadow buffers, which the driver
> wasn't doing. Fix this.
> 
> This fix removes artifacts on high profile bitstreams,
> found on certain platforms.
> 
> While here, fix the MV layout comment, since the multicore
> (MC) word is found before the MV buffer.

If this is the case then the mv offset currently used is probably
wrong for multicore hantro blocks.

The imx-vpu-hantro reference code mentions the following for H.264,

  allocate 32 bytes for multicore status fields
  locate it after picture and direct MV

and for VP8 it locate it directly after picture.

The Rockchip hantro devices I have is not multicore (to my knowledge),
is the iMX8M hantro a multicore block?

Best regards,
Jonas

> 
> Fixes: 8c2d66b036c77 ("media: hantro: Support color conversion via post-processing")
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_hw.h       | 4 ++--
>  drivers/staging/media/hantro/hantro_postproc.c | 4 +++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index f066de6b592d..989564485ca1 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -200,10 +200,10 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
>  	 * +---------------------------+
>  	 * | UV-plane  128 bytes x MBs |
>  	 * +---------------------------+
> -	 * | MV buffer  64 bytes x MBs |
> -	 * +---------------------------+
>  	 * | MC sync          32 bytes |
>  	 * +---------------------------+
> +	 * | MV buffer  64 bytes x MBs |
> +	 * +---------------------------+
>  	 */
>  	return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
>  }
> diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
> index 44062ffceaea..6d2a8f2a8f0b 100644
> --- a/drivers/staging/media/hantro/hantro_postproc.c
> +++ b/drivers/staging/media/hantro/hantro_postproc.c
> @@ -118,7 +118,9 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
>  	unsigned int num_buffers = cap_queue->num_buffers;
>  	unsigned int i, buf_size;
>  
> -	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage;
> +	buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage +
> +		   hantro_h264_mv_size(ctx->dst_fmt.width,
> +				       ctx->dst_fmt.height);
>  
>  	for (i = 0; i < num_buffers; ++i) {
>  		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
> 
