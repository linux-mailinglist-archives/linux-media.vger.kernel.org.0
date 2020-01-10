Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4DD136AB7
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 11:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbgAJKNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 05:13:24 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:45247 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727345AbgAJKNY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 05:13:24 -0500
Received: from [IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef]
 ([IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id prI6ilr7DpLtbprI9iPsoU; Fri, 10 Jan 2020 11:13:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578651201; bh=EQZFmUatpkRfJncF22R0svOZHakbIpsmtV+r92AM4vk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VzsVlz7/+IH14gT9YyVjGXny7iEK0AGDl1qeGBkP+l6zrFylT5RDJnwnppnekoQLd
         IEgK3LjIgGReAqiRNLEyRZN8Lsq0wcEkEUXEvogRwtMmMg6g4bqchUSFVUTbUhXe0N
         GH6q1lxdVDS+bHvdBaf2xGur0c8KQ0Y3aBE6MeQ+2mzdBDPtmjUNL8JMW+UXGKtPXr
         4DQJd9+N4j9pFepTXSvrgxbhZ4VqkG2raDrwQBD9c2ZGe7/i9+6EspMkLyKor6vxXU
         g8Cx5Obu12CYuJ0+G6YVf6nJrQe5BUq+c5UrL+v5VjZOBvoJ0OgoeCKCx/yk+E+yHm
         W1rVCVpXY21SA==
Subject: Re: [RFC][PATCH 12/15] videobuf2: add begin/end cpu_access callbacks
 to dma-sg
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
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-13-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1c5198dc-db4e-47d6-0d8b-259fbbb6372f@xs4all.nl>
Date:   Fri, 10 Jan 2020 11:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217032034.54897-13-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGxGp+oRQLeyV11iepfB4M188Y4d+5L/IiEs4v+l8amuiJUq/JK1KFy8sgNFIhsx3LL1hRNfTDF+klzKxCl2+00YMFtDjCRKA7BJXwHyv//jRc1MFh6N
 yq/nAx+BecxHK6ISawEgibcibO4N54nVduPnlU+66MeqCpwVUespAULDB8Nb/gT7TDcRkbz4+/sxS2fSU5lJElulNDzvjeT7q4yjpZ9kyi9MOkVhJO+6E7at
 HosI1etPR+IiR4DXAcBKrN3Xfc3lcdIqclZP51Senp48mYmDsqjihvSvzTQgiByIptC06NkYQk2fSSPtkARK51LqGiNh+RjEX8MCySN7rt/cNZcopsheDcrx
 0Mo5qv9N5zJ1Q41zLJeSmbY5Mui+yA3sUilJWoxnub8FFy467hx9Hg52YLIMAFtzMFKHf3qxrWwWQMW2sZnzAnm4dqT4OXuptuRwqcpqiu9P1hWbt9PRj4qY
 zI4tBf6BN+jPPRKY+bHUUtNjkjbwGQSn05F9YKO0ATQwZXGM11B0kjrDMakAeMbwQ4r6SQnxHtmFNw+IoGCLUuC1Nvu50WVNnsBF0HwBnx/S191tvMhojlxq
 +qItelRz5vHr/81qTVQNoOllGrRU8GsQiGYgxkfpDU0ZHrfT0QS9KO6xyFZ1xGNpapY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
> callbacks for cache synchronisation on exported buffers.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-dma-sg.c | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 6db60e9d5183..bfc99a0cb7b9 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -470,6 +470,26 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
>  	vb2_dma_sg_put(dbuf->priv);
>  }
>  

There is no corresponding vb2_sg_buffer_consistent function here.

Looking more closely I see that vb2_dma_sg_alloc doesn't pass the dma_attrs
argument to dma_map_sg_attrs, thus V4L2_FLAG_MEMORY_NON_CONSISTENT has no
effect on dma-sg buffers.

Is there a reason why dma_attrs isn't passed on to dma_map_sg_attrs()?

I suspect it was just laziness in the past, and that it should be wired
up, just as for dma-contig.

Regards,

	Hans

> +static int vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> +					enum dma_data_direction direction)
> +{
> +	struct vb2_dma_sg_buf *buf = dbuf->priv;
> +	struct sg_table *sgt = buf->dma_sgt;
> +
> +	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
> +	return 0;
> +}
> +
> +static int vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
> +					enum dma_data_direction direction)
> +{
> +	struct vb2_dma_sg_buf *buf = dbuf->priv;
> +	struct sg_table *sgt = buf->dma_sgt;
> +
> +	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
> +	return 0;
> +}
> +
>  static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
>  {
>  	struct vb2_dma_sg_buf *buf = dbuf->priv;
> @@ -488,6 +508,8 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
>  	.detach = vb2_dma_sg_dmabuf_ops_detach,
>  	.map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
>  	.unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
> +	.begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
> +	.end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
>  	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
>  	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
>  	.release = vb2_dma_sg_dmabuf_ops_release,
> 

