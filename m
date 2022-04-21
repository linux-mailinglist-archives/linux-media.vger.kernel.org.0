Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A431509C9A
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 11:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387874AbiDUJsB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 05:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387839AbiDUJrn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 05:47:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D98381
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 02:44:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 90707B823A6
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 09:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D99C385A9;
        Thu, 21 Apr 2022 09:44:50 +0000 (UTC)
Message-ID: <3b1ace8f-a425-6a61-cb97-39e93100e75c@xs4all.nl>
Date:   Thu, 21 Apr 2022 11:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/7] media: coda: set output buffer bytesused to appease
 v4l2-compliance
Content-Language: en-US
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220404163533.707508-1-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/04/2022 18:35, Philipp Zabel wrote:
> The V4L2 specification states:
> 
>  "If the application sets this to 0 for an output stream, then bytesused
>   will be set to the size of the buffer (see the length field of this
>   struct) by the driver."
> 
> Since we set allow_zero_bytesused, we have to handle this ourselves.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/media/platform/chips-media/coda-bit.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/chips-media/coda-bit.c b/drivers/media/platform/chips-media/coda-bit.c
> index c484c008ab02..705a179ea8f0 100644
> --- a/drivers/media/platform/chips-media/coda-bit.c
> +++ b/drivers/media/platform/chips-media/coda-bit.c
> @@ -381,6 +381,9 @@ void coda_fill_bitstream(struct coda_ctx *ctx, struct list_head *buffer_list)
>  		/* Dump empty buffers */
>  		if (!vb2_get_plane_payload(&src_buf->vb2_buf, 0)) {
>  			src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +			vb2_set_plane_payload(&src_buf->vb2_buf, 0,
> +					      vb2_plane_size(&src_buf->vb2_buf,
> +							     0));

Would it be possible to stop using allow_zero_bytesused altogether?

Are there still applications that rely on zero-sized output buffers to stop the
decoder?

I'm not actually sure that I want this in the driver, perhaps v4l2-compliance
can be modified to turn a fail into a warn if the driver is the coda driver.

Patching the driver is hiding the fact that the coda driver does something
non-standard for legacy reasons. It doesn't make sense either to change
bytesused to the buffer size since there really is nothing in the buffer.

v4l2-compliance already has checks for two drivers, search for is_vivid and
is_uvcvideo.

I'm skipping this patch for now.

Regards,

	Hans

>  			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
>  			continue;
>  		}

