Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F2A2131F8
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 05:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgGCDB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 23:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGCDB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 23:01:28 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14817C08C5C1;
        Thu,  2 Jul 2020 20:01:28 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5F65A2A5573
Message-ID: <151c4930973dbec938f2e1ff135149f40e4cc7de.camel@collabora.com>
Subject: Re: [PATCH 2/9] media: rkvdec: h264: Fix reference frame_num wrap
 for second field
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 03 Jul 2020 00:01:17 -0300
In-Reply-To: <20200701215616.30874-3-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
         <20200701215616.30874-3-jonas@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+Boris

On Wed, 2020-07-01 at 21:56 +0000, Jonas Karlman wrote:
> When decoding the second field in a complementary field pair the second
> field is sharing the same frame_num with the first field.
> 
> Currently the frame_num for the first field is wrapped when it matches the
> field being decoded, this cause issues to decode the second field in a
> complementary field pair.
> 
> Fix this by using inclusive comparison, less than or equal.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index 7b66e2743a4f..f0cfed84d60d 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -754,7 +754,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
>  			continue;
>  

Taking a closer look here, I see this comment:

        /*
         * Assign an invalid pic_num if DPB entry at that position is inactive.
         * If we assign 0 in that position hardware will treat that as a real
         * reference picture with pic_num 0, triggering output picture
         * corruption.
         */

ChromeOS driver was setting 0xff on a non-active hw_rps table entry,
but we are not doing so.

Are we missing anything, or is this not really required
(and so the comment is outdated)?

Thanks,
Ezequiel

>  		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ||
> -		    dpb[i].frame_num < sl_params->frame_num) {
> +		    dpb[i].frame_num <= sl_params->frame_num) {
>  			p[i] = dpb[i].frame_num;
>  			continue;
>  		}


