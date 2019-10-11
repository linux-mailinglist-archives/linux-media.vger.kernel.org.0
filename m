Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C20FD3B96
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 10:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbfJKItU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 11 Oct 2019 04:49:20 -0400
Received: from mailoutvs7.siol.net ([185.57.226.198]:44160 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726310AbfJKItU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 04:49:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 489F8520F41;
        Fri, 11 Oct 2019 10:49:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 3gcfRvo8kcgz; Fri, 11 Oct 2019 10:49:16 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id C6100520FA2;
        Fri, 11 Oct 2019 10:49:16 +0200 (CEST)
Received: from jernej-laptop.localnet (unknown [89.216.49.66])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id F08E2520F89;
        Fri, 11 Oct 2019 10:49:15 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCHv3 6/8] media: cedrus: Detect first slice of a frame
Date:   Fri, 11 Oct 2019 10:49:15 +0200
Message-ID: <2841216.fgL18TTB4F@jernej-laptop>
In-Reply-To: <20191010131152.68984-7-hverkuil-cisco@xs4all.nl>
References: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl> <20191010131152.68984-7-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne četrtek, 10. oktober 2019 ob 15:11:50 CEST je Hans Verkuil napisal(a):
> From: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> When codec supports multiple slices in one frame, VPU has to know when
> first slice of each frame is being processed, presumably to correctly
> clear/set data in auxiliary buffers.
> 
> Add first_slice field to cedrus_run structure and set it according to
> the new_frame boolean of the context.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> [hverkuil-cisco@xs4all.nl: rewritten to use the new_frame bool]
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h     | 1 +
>  drivers/staging/media/sunxi/cedrus/cedrus_dec.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h
> b/drivers/staging/media/sunxi/cedrus/cedrus.h index
> 2f017a651848..32cb38e541c6 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -70,6 +70,7 @@ struct cedrus_mpeg2_run {
>  struct cedrus_run {
>  	struct vb2_v4l2_buffer	*src;
>  	struct vb2_v4l2_buffer	*dst;
> +	bool first_slice;
> 
>  	union {
>  		struct cedrus_h264_run	h264;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c index
> 56ca4c9ad01c..7d3dd31e8190 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -31,6 +31,7 @@ void cedrus_device_run(void *priv)
> 
>  	run.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>  	run.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	run.first_slice = ctx->fh.m2m_ctx->new_frame;

I'm not sure if this patch makes sense anymore now that the flag is part of the 
core. I think we can drop this patch and access new_frame directly in next 
patch. Any thoughts?

Best regards,
Jernej

> 
>  	/* Apply request(s) controls if needed. */
>  	src_req = run.src->vb2_buf.req_obj.req;




