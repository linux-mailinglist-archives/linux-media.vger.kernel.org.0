Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C371AFD3B7
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 05:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbfKOEgh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 23:36:37 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57836 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbfKOEgg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 23:36:36 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 320FF291502;
        Fri, 15 Nov 2019 04:36:34 +0000 (GMT)
Date:   Fri, 15 Nov 2019 05:36:30 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: hantro: make update_dpb() not leave holes in DPB
Message-ID: <20191115053630.129b473b@collabora.com>
In-Reply-To: <20191115035013.145152-1-acourbot@chromium.org>
References: <20191115035013.145152-1-acourbot@chromium.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexandre,

On Fri, 15 Nov 2019 12:50:13 +0900
Alexandre Courbot <acourbot@chromium.org> wrote:

> update_dpb() reorders the DPB entries such as the same frame in two
> consecutive decoding requests always ends up in the same DPB slot.
> 
> It first clears all the active flags in the DPB, and then checks whether
> the active flag is not set to decide whether an entry is a candidate for
> matching or not.
> 
> However, this means that unused DPB entries are also candidates for
> matching, and an unused entry will match if we are testing it against a
> frame which (TopFieldOrderCount, BottomFieldOrderCount) is (0, 0).

Hm, I might be wrong but I thought we were supposed to re-use matching
entries even if the ref was not active on the last decoded frame. IIRC,
a ref can be active on specific decoding request (X), then inactive on
the next one (X+1) and active again on the following one (X+2).
Shouldn't we re-use the slot we used when decoding X for this ref when
decoding X+2?

> 
> As it turns out, this happens for the very first frame of a stream, but
> it is not a problem as it would be copied to the first entry anyway.
> More concerning is that after an IDR frame the Top/BottomFieldOrderCount
> can be reset to 0, and this time update_dpb() will match the IDR frame
> to the first unused entry of the DPB (and not the entry at index 0 as
> would be expected) because the first slots will have different values.

We could also consider resetting the DPB cache on IDR frames if that
works on Hantro.

> 
> The Hantro driver is ok with this, but when trying to use the same
> function for another driver (MT8183) I noticed decoding artefacts caused
> by this hole in the DPB.

I guess this new version passes the chromium testsuite on rk-based
boards. If that's the case I don't have any objection to this patch.

Note that I was not planning to share the DPB caching logic as I
thought only Hantro G1 needed that trick. Have you tried passing the
DPB directly? Maybe it just works on mtk.

> 
> Fix this by maintaining a list of DPB slots that are actually in use,
> instead of relying on the absence of the active flag to do so. This also
> allows us to optimize matching a bit.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/staging/media/hantro/hantro_h264.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
> index 568640eab3a6..2357068b0f82 100644
> --- a/drivers/staging/media/hantro/hantro_h264.c
> +++ b/drivers/staging/media/hantro/hantro_h264.c
> @@ -474,14 +474,19 @@ static void update_dpb(struct hantro_ctx *ctx)
>  {
>  	const struct v4l2_ctrl_h264_decode_params *dec_param;
>  	DECLARE_BITMAP(new, ARRAY_SIZE(dec_param->dpb)) = { 0, };
> +	DECLARE_BITMAP(in_use, ARRAY_SIZE(dec_param->dpb)) = { 0, };
>  	DECLARE_BITMAP(used, ARRAY_SIZE(dec_param->dpb)) = { 0, };
>  	unsigned int i, j;
>  
>  	dec_param = ctx->h264_dec.ctrls.decode;
>  
> -	/* Disable all entries by default. */
> -	for (i = 0; i < ARRAY_SIZE(ctx->h264_dec.dpb); i++)
> +	/* Mark entries in use before disabling them. */
> +	for (i = 0; i < ARRAY_SIZE(ctx->h264_dec.dpb); i++) {
> +		if (ctx->h264_dec.dpb[i].flags &
> +		    V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
> +			set_bit(i, in_use);
>  		ctx->h264_dec.dpb[i].flags &= ~V4L2_H264_DPB_ENTRY_FLAG_ACTIVE;
> +	}
>  
>  	/* Try to match new DPB entries with existing ones by their POCs. */
>  	for (i = 0; i < ARRAY_SIZE(dec_param->dpb); i++) {
> @@ -492,18 +497,19 @@ static void update_dpb(struct hantro_ctx *ctx)
>  
>  		/*
>  		 * To cut off some comparisons, iterate only on target DPB
> -		 * entries which are not used yet.
> +		 * entries which are already used.
>  		 */
> -		for_each_clear_bit(j, used, ARRAY_SIZE(ctx->h264_dec.dpb)) {
> +		for_each_set_bit(j, in_use, ARRAY_SIZE(ctx->h264_dec.dpb)) {
>  			struct v4l2_h264_dpb_entry *cdpb;
>  
>  			cdpb = &ctx->h264_dec.dpb[j];
> -			if (cdpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE ||
> -			    !dpb_entry_match(cdpb, ndpb))
> +			if (!dpb_entry_match(cdpb, ndpb))
>  				continue;
>  
>  			*cdpb = *ndpb;
>  			set_bit(j, used);
> +			/* Don't reiterate on this one. */
> +			clear_bit(j, in_use);
>  			break;
>  		}
>  

