Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61F6137B3C
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 19:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbfFFRjM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 13:39:12 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59816 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728782AbfFFRjM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 13:39:12 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 34AED260D60;
        Thu,  6 Jun 2019 18:39:10 +0100 (BST)
Date:   Thu, 6 Jun 2019 19:39:06 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com, Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pawel Osciak <pawel@osciak.com>
Subject: Re: [PATCH 1/5] media: vb2: Introduce a vb2_get_buffer accessor
Message-ID: <20190606193906.02d95aa7@collabora.com>
In-Reply-To: <20190606154426.6899-2-ezequiel@collabora.com>
References: <20190606154426.6899-1-ezequiel@collabora.com>
        <20190606154426.6899-2-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu,  6 Jun 2019 12:44:22 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> Some drivers need to access a vb2 buffer from its
> queue index. Introduce an accessor to abstract this,
> and avoid drivers from accessing private members.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  include/media/videobuf2-core.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index c03ef7cc5071..7b1729320b16 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -1163,6 +1163,24 @@ static inline void vb2_clear_last_buffer_dequeued(struct vb2_queue *q)
>  	q->last_buffer_dequeued = false;
>  }
>  
> +/**
> + * vb2_get_buffer() - get a buffer from a queue
> + * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> + * @index:	buffer index
> + *
> + * This function obtains a buffer from a queue, by its index.
> + * Keep in mind that there is no refcounting involved in this
> + * operation, so the buffer lifetime should be taken into
> + * consideration.
> + */
> +static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
> +						unsigned int index)
> +{
> +	if (q->num_buffers > 0 && index < q->num_buffers)

No need to check q->num_buffers > 0 because in that case
index < q->num_buffers is always false.

Looks good otherwise

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> +		return q->bufs[index];
> +	return NULL;
> +}
> +
>  /*
>   * The following functions are not part of the vb2 core API, but are useful
>   * functions for videobuf2-*.

