Return-Path: <linux-media+bounces-3741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D8382EB68
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 10:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58655B223DF
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 09:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D2412B7A;
	Tue, 16 Jan 2024 09:21:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E287125B2;
	Tue, 16 Jan 2024 09:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F049C433C7;
	Tue, 16 Jan 2024 09:21:55 +0000 (UTC)
Message-ID: <c832da45-c818-420d-aaf8-05c15c1e5426@xs4all.nl>
Date: Tue, 16 Jan 2024 10:21:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: media videobuf2: Stop direct calls to queue
 num_buffers field
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, tfiga@chromium.org,
 m.szyprowski@samsung.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20240115170826.214519-1-benjamin.gaignard@collabora.com>
 <20240115170826.214519-2-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240115170826.214519-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2024 18:08, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Fixes: c838530d230b ("media: media videobuf2: Be more flexible on the number of queue stored buffers")
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 41a832dd1426..b6bf8f232f48 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -989,7 +989,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  	bool no_previous_buffers = !q_num_bufs;
>  	int ret = 0;
>  
> -	if (q->num_buffers == q->max_num_buffers) {
> +	if (q_num_bufs == q->max_num_buffers) {
>  		dprintk(q, 1, "maximum number of buffers already allocated\n");
>  		return -ENOBUFS;
>  	}

There is another case in vb2_ioctl_create_bufs() where num_buffers is accessed directly.
Can you fix that one as well?

Regards,

	Hans

