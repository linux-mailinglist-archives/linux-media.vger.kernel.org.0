Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28DCA163F93
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgBSIq1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:46:27 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:42627 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726197AbgBSIq1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:46:27 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4KzsjzRCCP9a94KzwjnUo7; Wed, 19 Feb 2020 09:46:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582101984; bh=PTKVwzVLQIQPSyqMNFpGkfySY5g8krHUvlfxMep32fU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=F+xgFFXFAZaqMbAP406e6nV+kfRI6nfbEU7zlXgTe4es9gSPlG5/5hrH0CrEl1ebg
         9G3/ad4BLYwtzTbAEB7ls21iPcJQAi5Lla65W1V0YIVe3wWXaXgsKUVZBfuQlLEWSz
         qMGHPbCCPQWdi/ahtk2mY+MFyPnQ6REBBp0vOE0T9ym/4b9oPwWpDrj/5B93SjjnK1
         JxkwkmS2+bnsBuYB+U9TL73k13zODztbf5SbnIMhd0mScUlpO7DSZPxzgJZtPXD5P0
         PPX9c1diKLiz2CSsspN1iSgujevzQ34MAx4yfnmcPNtv1R3p1JDwcJmYgG4pjvllYe
         C+AD+9e3XAA4w==
Subject: Re: [RFC][PATCHv2 02/12] videobuf2: handle V4L2 buffer cache flags
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-3-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b4fc938d-4eb9-40fd-7984-a4019b6a0de8@xs4all.nl>
Date:   Wed, 19 Feb 2020 09:46:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200204025641.218376-3-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfH8hQYBAj6CYnYUzAlnh4X3n9TQ5wLesGlVBp/Z/zU0bWyibekn0RK3CUs3OBU81BBzza1HBSvNC9X9UW5vB9YYsuCJDV4Hnu2tDu38FssqLwbr3lkK7
 DkYzn4R/os6pirc9vpJ0hHZkTOkWa0VvWeMNcDDgIiADhESwbk9uwNZTGnvK0wspsWd0N20vtCb3N4Zjp+V1RqfHBMhBO2UNmtwhMErVtzfsQOI7NB607T18
 38+lZX4OUlb5EcGxeztQLBZHUxXkhsHdAcHvjscpE9BobIJKlvGZYxL7AeTbvAnFB/Kahv1vzFG34yzla9OZm65Ob5Bb6B8+Hd0Rdq3usMVmXK03GJF79YIl
 QGqKj5D4c05jyS8DgOmWQHqDAaiB0TDnoH6LOtPbvKuQrpovcpmROx39KzRxwKQ2isx3TFWsigNN9nGUzikgAIQIUqTChchOLGBuqCfvBRk4NjwkxuPk27V4
 CEjN9bDE2KGKDhwQsnEMymCLyLMKxFYmDJDrlqQd7UNq2jdwrHsZIGuTbANayxF194bIKWrEV3xgZgiI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/4/20 3:56 AM, Sergey Senozhatsky wrote:
> Set video buffer cache management flags corresponding to V4L2 cache
> flags.
> 
> Both ->prepare() and ->finish() cache management hints should be
> passed during this stage (buffer preparation), because there is no
> other way for user-space to skip ->finish() cache flush.
> 
> There are two possible alternative approaches:
> - The first one is to move cache sync from ->finish() to dqbuf().
>   But this breaks some drivers, that need to fix-up buffers before
>   dequeueing them.
> 
> - The second one is to move ->finish() call from ->done() to dqbuf.
> 
> Change-Id: I3bef1d1fb93a5fba290ce760eaeecdc8e7d6885a
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index eb5d5db96552..2da06a2ad6c4 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -337,6 +337,41 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
>  	return 0;
>  }
>  
> +static void set_buffer_cache_hints(struct vb2_queue *q,
> +				   struct vb2_buffer *vb,
> +				   struct v4l2_buffer *b)
> +{
> +	/*
> +	 * DMA exporter should take care of cache syncs, so we can avoid
> +	 * explicit ->prepare()/->finish() syncs. For other ->memory types
> +	 * we always need ->prepare() or/and ->finish() cache sync.
> +	 */
> +	if (q->memory == VB2_MEMORY_DMABUF) {
> +		vb->need_cache_sync_on_finish = 0;
> +		vb->need_cache_sync_on_prepare = 0;
> +		return;
> +	}
> +
> +	if (!q->allow_cache_hints)

If q->allow_cache_hints is 0, then if userspace attempts to set these
flags in v4l2_buffer, they should be cleared. That's to indicate to
userspace that these flags won't work.

That should be done in vb2_fill_vb2_v4l2_buffer().

Regards,

	Hans

> +		return;
> +
> +	vb->need_cache_sync_on_prepare = 1;
> +	/*
> +	 * ->finish() cache sync can be avoided when queue direction is
> +	 * TO_DEVICE.
> +	 */
> +	if (q->dma_dir != DMA_TO_DEVICE)
> +		vb->need_cache_sync_on_finish = 1;
> +	else
> +		vb->need_cache_sync_on_finish = 0;
> +
> +	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_INVALIDATE)
> +		vb->need_cache_sync_on_finish = 0;
> +
> +	if (b->flags & V4L2_BUF_FLAG_NO_CACHE_CLEAN)
> +		vb->need_cache_sync_on_prepare = 0;
> +}
> +
>  static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
>  				    struct v4l2_buffer *b, bool is_prepare,
>  				    struct media_request **p_req)
> @@ -381,6 +416,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  	}
>  
>  	if (!vb->prepared) {
> +		set_buffer_cache_hints(q, vb, b);
>  		/* Copy relevant information provided by the userspace */
>  		memset(vbuf->planes, 0,
>  		       sizeof(vbuf->planes[0]) * vb->num_planes);
> 

