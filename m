Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A7111E636
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 16:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfLMPJs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 10:09:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55304 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbfLMPJs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 10:09:48 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 312F7E00;
        Fri, 13 Dec 2019 16:09:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576249785;
        bh=o0CHrYc/I6WkpvTk7+BesHWKBfYO6bupATH/o75dbwU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mDAhW94IwncfLplmU4vn8//7eN/1PBQpAfRa6g+02MsXGWgvOlLAWSlNlB5ip3tyw
         7jySM6NlCLHobkLpS4V2XvoClJQiu4zmNpvXFxOkdIfEAFaKiTXrdx+jFCImi4u4Hb
         lalLOR5/uDbq2GZcZN5F78GoizUvG8WavsE1/5lM=
Date:   Fri, 13 Dec 2019 17:09:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 1/7] media: vb2: Add a helper to get the vb2 buffer
 attached to a request
Message-ID: <20191213150935.GC24654@pendragon.ideasonboard.com>
References: <20191213125414.90725-1-boris.brezillon@collabora.com>
 <20191213125414.90725-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191213125414.90725-2-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Boris,

On Fri, Dec 13, 2019 at 01:54:08PM +0100, Boris Brezillon wrote:
> vb2_request_get_buf() returns the N-th buffer attached to a media
> request.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> * None
> 
> Changes in v2:
> * Adjust the kernel doc as suggested by Hans
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 23 +++++++++++++++++++
>  include/media/videobuf2-core.h                | 11 +++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 4489744fbbd9..c4c7980dcb0d 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1416,6 +1416,29 @@ unsigned int vb2_request_buffer_cnt(struct media_request *req)
>  }
>  EXPORT_SYMBOL_GPL(vb2_request_buffer_cnt);
>  
> +struct vb2_buffer *vb2_request_get_buf(struct media_request *req,
> +				       unsigned int n)
> +{
> +	struct media_request_object *obj;
> +	struct vb2_buffer *buf = NULL;
> +	unsigned int nbufs = 0;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&req->lock, flags);
> +	list_for_each_entry(obj, &req->objects, list) {
> +		if (!vb2_request_object_is_buffer(obj) ||
> +		    nbufs++ < n)
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
>  int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
>  {
>  	struct vb2_buffer *vb;
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index a2b2208b02da..6206e25df764 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -1225,4 +1225,15 @@ bool vb2_request_object_is_buffer(struct media_request_object *obj);
>   */
>  unsigned int vb2_request_buffer_cnt(struct media_request *req);
>  
> +/**
> + * vb2_request_get_buf() - return the buffer at index @idx
> + *
> + * @req:	the request.
> + * @n:		search for the Nth buffer in the req object list

It's not very clear to me what "n" is here. Wouldn't it be better to
pass the queue pointer instead, to get a buffer for a given queue ?

> + *
> + * Return a vb2 buffer or NULL if there's no buffer at the specified position
> + */
> +struct vb2_buffer *vb2_request_get_buf(struct media_request *req,
> +				       unsigned int n);
> +
>  #endif /* _MEDIA_VIDEOBUF2_CORE_H */

-- 
Regards,

Laurent Pinchart
