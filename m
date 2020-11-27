Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABEF2C6623
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 14:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729273AbgK0NAF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 08:00:05 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:54515 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728404AbgK0NAE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 08:00:04 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id idLykQ9HIDuFjidM2kqtAp; Fri, 27 Nov 2020 14:00:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606482002; bh=HOMppZobt6qFRcDaM53vHK/IM1PaO9vvUi20G1XPmOw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YSJ5gwPmwaue9ecT8oxVpdRs0Byukek1K9Uuf3NMFbdaD/5KackXMAPdE2HqW5x5R
         1mkLdiL34MJZD8CKuF3ZmVNwUhtIByWleBV6Y/iHPtPdQQ1dusgBOjC5X5Ponab6VX
         rJfhIVBRQdOaFhIJnI23F38G74g11IK1GW6tsG4Pd671HC9NI81ZcXVYHJ5xSZKPDc
         3BpYzYohujEc65TQfzpQwywuRWDUH7uvjzeYhkfDXIpsq1RkKtWvyTFl+jCA8LstYi
         cm/sUeaufzsFF7zSqOBZZYiTU+WlnA7C3v1dShz4zdyyCAjQfNA8BC/Q7sDSLIyX+Y
         QwasEP9UEeJOw==
Subject: Re: [PATCH] media: vb2: always set buffer cache sync hints
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20201127094136.1051071-1-sergey.senozhatsky@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0dbfa509-8c82-7470-c18b-24ab5c92dc4b@xs4all.nl>
Date:   Fri, 27 Nov 2020 13:59:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201127094136.1051071-1-sergey.senozhatsky@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfF9WdxLsIljKXQ86VtwCHlJGUVW9BlpEOCet6vkdk1HOeJYbwsqj+ni99c22/uEahuaYHePbGdnzvrlzHNCTN8+qrE6EgCMWIRLUSnuLeXQoRN5/wgI6
 QZC8ul1RjHRyzULD35ZdJLoegGBz0wAh97ZD/5M8mCa6GPepgeWV5x3lemSTblbts+Zkg+gp9YkvK7WG5qAZvTrqVZ0sYs1NbaDjoND17AgW9E9X+mVJsR6H
 MXpz4uHWunGEG/TwtgUFiyJbek4EfcSMx51G8pZxajm+RqYjDoymHy6va2s7+j2Xt7ZoQaH5vOSECOq1iX7Jo8OPsNEjAet39cWGyAVDBP4JB734shO1mLA4
 U8543Sejhz4cSs4RqyHhKxdF7CFugV3gnwfMRZto1q4C1JOeea/s6rhQYTzARghj2GrvAUxh
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/11/2020 10:41, Sergey Senozhatsky wrote:
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
> Reported-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 5499013cf82e..14a26888a892 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -414,6 +414,8 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  		vb->index = q->num_buffers + buffer;
>  		vb->type = q->type;
>  		vb->memory = memory;
> +		vb->need_cache_sync_on_prepare = 1;
> +		vb->need_cache_sync_on_finish = 1;

I think this needs a comment, basically explaining what you said in
the commit log. It's not obvious from the code that this is a
workaround.

Regards,

	Hans

>  		for (plane = 0; plane < num_planes; ++plane) {
>  			vb->planes[plane].length = plane_sizes[plane];
>  			vb->planes[plane].min_length = plane_sizes[plane];
> 

