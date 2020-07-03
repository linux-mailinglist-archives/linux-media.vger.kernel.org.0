Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C872131F2
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 04:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgGCC6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 22:58:39 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37544 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGCC6j (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 22:58:39 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D2BD32A2D53
Message-ID: <dd6d28589e098c3f83b630fa9abf943870780fa6.camel@collabora.com>
Subject: Re: [PATCH 4/9] media: rkvdec: h264: Fix bit depth wrap in pps
 packet
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 02 Jul 2020 23:58:29 -0300
In-Reply-To: <20200701215616.30874-5-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
         <20200701215616.30874-5-jonas@kwiboo.se>
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
> The luma and chroma bit depth fields in the pps packet is 3 bits wide.
> 8 is wrongly added to the bit depth value written to these 3-bit fields.
> Because only the 3 LSB is written the hardware is configured correctly.
> 
> Correct this by not adding 8 to the luma and chroma bit depth value.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks!
Ezequiel

> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index c9aebeb8f9b3..9c8e49642cd9 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -662,8 +662,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
>  	WRITE_PPS(0xff, PROFILE_IDC);
>  	WRITE_PPS(1, CONSTRAINT_SET3_FLAG);
>  	WRITE_PPS(sps->chroma_format_idc, CHROMA_FORMAT_IDC);
> -	WRITE_PPS(sps->bit_depth_luma_minus8 + 8, BIT_DEPTH_LUMA);
> -	WRITE_PPS(sps->bit_depth_chroma_minus8 + 8, BIT_DEPTH_CHROMA);
> +	WRITE_PPS(sps->bit_depth_luma_minus8, BIT_DEPTH_LUMA);
> +	WRITE_PPS(sps->bit_depth_chroma_minus8, BIT_DEPTH_CHROMA);
>  	WRITE_PPS(0, QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG);
>  	WRITE_PPS(sps->log2_max_frame_num_minus4, LOG2_MAX_FRAME_NUM_MINUS4);
>  	WRITE_PPS(sps->max_num_ref_frames, MAX_NUM_REF_FRAMES);


