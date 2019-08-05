Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BACC81B4E
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 15:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729897AbfHENNb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 09:13:31 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:43045 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729604AbfHENNa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Aug 2019 09:13:30 -0400
Received: from [10.125.143.226] ([138.219.197.106])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ucnGh33SWqTdhucnMhAv5t; Mon, 05 Aug 2019 15:13:28 +0200
Subject: Re: [RFC PATCH 1/5] media: vb2: Add a helper to get the vb2 buffer
 attached to a request
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20190805094827.11205-1-boris.brezillon@collabora.com>
 <20190805094827.11205-2-boris.brezillon@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <722ddb41-f7b8-afee-66a3-e99a571da5d7@xs4all.nl>
Date:   Mon, 5 Aug 2019 10:12:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190805094827.11205-2-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFtU8HlSWzydTXPBqaWipS6OQfdxHKVvD061dR1UtpB/IyrRNh7dO+wssWbY9VpmkP7yv+EI9NHAFU6aBXGq1HxQ0r0QxvD1K/YSLxbpGHzxz6h6qHF1
 ZoycdYrKF8tDKKH2waPvYNIbYfxmCuUwA3BD/wxYh64UNE5Ipa86C1+F9A8rFRBfgJ9L8c53y2JQpZ8ADl++fNsjTnP1VXFLKyGT8WSpFwETMx6N/py+50k5
 UepDIjpppO3lvkKtWZWHD7cLlxNl5gWLmFjxt6ZhykswIjfRQpK9veXd9dAxNyriUnynaWHHDruCa6aM0gQOCj7PN/vDXdzCXujrXx47fpTLFGORHo15yVzw
 cutnvWLUjy11Xpw+ot8uh/THRq4cA7qRPU+cyhUnM5aHXoilVVjTgnpXj2m0NfK/CkdRYReu3lS3VxSkkC70lpMsWXIgC9IOnXsIqY8erIdF3H4CjjDxx2nM
 L6WK02JVk2xMAlcTMietraf2pqrJ98ogHaY4UD2ZdsOhJyjCXrDuN5alg89b9HdcZqCGSrCOrrIRmPM599CNUk/blDUU8Ne2ZrwxfyLkzxPtBAGWtmA2Ls6N
 9k0qFvUOTSZ1XEc9cvpAH79KPj5bvChINVY4QnkEkSqpuMQwFzjp5EcjhU5zhRBoRu+9b+4HaeulpE50XoKR9uRLdrjvkNOLreAf7XoV9Ym6G13SRnRmkInZ
 iA0qPbMlgK9pFjXXCXBq4zUUXPq8kXmde4bjTem66Jwy0t+BCHXifQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/5/19 6:48 AM, Boris Brezillon wrote:
> vb2_request_get_buf() returns the N-th buffer attached to a media
> request.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   .../media/common/videobuf2/videobuf2-core.c   | 23 +++++++++++++++++++
>   include/media/videobuf2-core.h                | 11 +++++++++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 4489744fbbd9..58769f0c8665 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1416,6 +1416,29 @@ unsigned int vb2_request_buffer_cnt(struct media_request *req)
>   }
>   EXPORT_SYMBOL_GPL(vb2_request_buffer_cnt);
>   
> +struct vb2_buffer *vb2_request_get_buf(struct media_request *req,
> +				       unsigned int idx)
> +{
> +	struct media_request_object *obj;
> +	struct vb2_buffer *buf = NULL;
> +	unsigned int nbufs = 0;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&req->lock, flags);
> +	list_for_each_entry(obj, &req->objects, list) {
> +		if (!vb2_request_object_is_buffer(obj) ||
> +		    nbufs++ < idx)
> +			continue;
> +
> +		buf = container_of(obj, struct vb2_buffer, req_obj);
> +		break;
> +	}
> +	spin_unlock_irqrestore(&req->lock, flags);
> +
> +	return buf;
> +}
> +EXPORT_SYMBOL_GPL(vb2_request_get_buf);
> +
>   int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
>   {
>   	struct vb2_buffer *vb;
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 640aabe69450..febf3261a120 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -1222,4 +1222,15 @@ bool vb2_request_object_is_buffer(struct media_request_object *obj);
>    */
>   unsigned int vb2_request_buffer_cnt(struct media_request *req);
>   
> +/**
> + * vb2_request_get_buf() - return the buffer at index @idx
> + *
> + * @req:	the request.
> + * @idx:	index of the buffer in the req object list

This is confusing: it suggests that you are talking about the buffer
index itself (buf->index) instead of the nth buffer in the request.

Looks good otherwise.

Regards,

	Hans

> + *
> + * Return a vb2 buffer or NULL if there's no buffer at the specified index
> + */
> +struct vb2_buffer *vb2_request_get_buf(struct media_request *req,
> +				       unsigned int idx);
> +
>   #endif /* _MEDIA_VIDEOBUF2_CORE_H */
> 

