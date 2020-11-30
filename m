Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C232C81A1
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 11:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbgK3KDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 05:03:19 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59217 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726158AbgK3KDT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 05:03:19 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id jg0tku31zN7Xgjg0xki5vo; Mon, 30 Nov 2020 11:02:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606730556; bh=HLkBIGFl/i78UMPfgNYy6/oMgvF3eWKw4fQKQ09bjvc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=buZmtTVwV0mS8o1RFeStGSD1fNJ2tKgs3DmiB0cwR53W81gHLgbwaOE9fC+ErbjTv
         3n6a0yT18zpG2cQkUWJjkliNUjYX7BWd1OMMLhm2k7na6h46XGKGPsWNiploMldETS
         tJaI/h809cemT1AUSjJplk0FlYZAmcmWHz3DIIiE893H+fNH3ouAOhc9nirgAXOBkJ
         HE1//JHJREWOsm2ieNkxlZbRL+2W3UNIWyMiLQTTk3qouM0Z4759o4HhDxzITyR+2Y
         BjT74pd/gd7ZSkIBZ8LeLEWZ/Zd1Be6hS4eWlnCfAYUH2f/OZHkLokQU/95WQ5GJlr
         OBUVWS7Zs4y9w==
Subject: Re: [PATCHv3] media: vb2: always set buffer cache sync hints
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20201129031545.557586-1-sergey.senozhatsky@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6cf9bf76-3875-5c89-cebe-a4e44ee1f326@xs4all.nl>
Date:   Mon, 30 Nov 2020 11:02:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201129031545.557586-1-sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOiQvc2nbyS6U+M1bgIqf61hGg43WAo6LQRcSNiX1GIRQDhycHx16qF22RVofvymMGpal6e1dhn9OUqnj1zEWUCduyQ/Zfz13dmI24DPP/WqcD63727j
 78mNxFszxEZAqWUVRHLqrX8WhZqeREbwQiZja7O9HajluVNf92BBUEyzw4j7+8dkJleD2zTPfkER7sAk4U7UDcU0cSt1DXA7lyecfvn+2Hh9Wf97hJvAajTF
 FinpBH6y2zicBJ89BD9CZeO55AN3BXjV/MfADY64rWUIiFe4AenXV7mujynZA100Hpj3Ygc4NULasr0BGLD5eNGfMDqAZbaRfnnMicRsl+q6nUmwye64Zo64
 POJD4qVLI08blPiPaC9RgyHcqklN6hQ1F9bV1hMiZLhSA6GbFrYczAheBSK78cz6qmjrxlST
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/11/2020 04:15, Sergey Senozhatsky wrote:
> We need to always set ->need_cache_sync_on_prepare and
> ->need_cache_sync_on_finish when we initialize vb2 buffer.
> 
> Currently these flags are set/adjusted only in V4L2's
> vb2_queue_or_prepare_buf(), which means that for the code
> paths that don't use V4L2 vb2 will always tell videobuf2
> core to skip ->prepare() and ->finish() cache syncs/flushes.
> 
> This is a quick solution that should do the trick. The
> proper fix, however, is much more complicated and requires
> a rather big videobuf2 refactoring - we need to move cache
> sync/flush decision making out of core videobuf2 to the
> allocators.
> 
> Fixes: f5f5fa73fbfb ("media: videobuf2: handle V4L2 buffer cache flags")
> Reported-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> v3: Improved code comment and dropped queue allow_cache_hints check (Tomasz)
> v2: Added a comment and set cache sync flags only for specific buffers (Hans)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 5499013cf82e..3f11fc5b5d9a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -414,6 +414,20 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  		vb->index = q->num_buffers + buffer;
>  		vb->type = q->type;
>  		vb->memory = memory;
> +		/*
> +		 * A workaround fix. We need to set these flags here so that
> +		 * videobuf2 core will call ->prepare()/->finish() cache
> +		 * sync/flush on vb2 buffers when appropriate. Otherwise, for
> +		 * backends that don't rely on V4L2 (perhaps dvb) these flags
> +		 * will always be false and, hence, videobuf2 core will skip
> +		 * cache sync/flush operations. However, we can avoid explicit
> +		 * ->prepare() and ->finish() cache sync for DMABUF buffers,
> +		 * because DMA exporter takes care of it.
> +		 */
> +		if (q->memory != VB2_MEMORY_DMABUF) {
> +			vb->need_cache_sync_on_prepare = 1;
> +			vb->need_cache_sync_on_finish = 1;
> +		}

Is this a work-around fix? Isn't this just a bug fix? It seems reasonable
to always set this when allocating buffers for a queue. And for v4l2 these
values can be changed if supported by the driver (allow_cache_hints is set).

So the comment would be:

	/*
	 * We need to set these flags here so that the videobuf2 core
	 * will call ->prepare()/->finish() cache sync/flush on vb2
	 * buffers when appropriate. However, we can avoid explicit
	 * ->prepare() and ->finish() cache sync for DMABUF buffers,
	 * because DMA exporter takes care of it.
	 */

The commit message would need to be modified as well.

Regards,

	Hans

>  		for (plane = 0; plane < num_planes; ++plane) {
>  			vb->planes[plane].length = plane_sizes[plane];
>  			vb->planes[plane].min_length = plane_sizes[plane];
> 

