Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08A8CA9CE6
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 10:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731492AbfIEIYV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 04:24:21 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:36777 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730769AbfIEIYU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Sep 2019 04:24:20 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 5n3viVmkL50xT5n3ziprsN; Thu, 05 Sep 2019 10:24:19 +0200
Subject: Re: [PATCH for v5.3] videobuf-core.c: poll_wait needs a non-NULL buf
 pointer
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>
References: <f60c12ef-5015-c6e1-ed1b-e9d8ca98a593@xs4all.nl>
Message-ID: <a5c65e64-3161-8a5f-1f45-df78170b0472@xs4all.nl>
Date:   Thu, 5 Sep 2019 10:24:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f60c12ef-5015-c6e1-ed1b-e9d8ca98a593@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIXMlnI+SR/7xj6k9JpAvyJvk5HXPBDnaJASbl5owDXgnfMUZlNoPjvxuZapw5LqXyoxxpE1HeA9zz5kT1LBN8cj02QhJANMkeK9+90O6+Yl7FSWQJPh
 FixXFhtSkT252npMw6OZdxwnQT+2YRmNO2fMqWkPXYCSiXzES5LFNhlOHYko/mXIrbeGGMYojEG/2pB7wZGNQPkb/J9fu3lQAVM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/4/19 11:04 AM, Hans Verkuil wrote:
> poll_wait uses &buf->done, but buf is NULL. Move the poll_wait to later
> in the function once buf is correctly set and only call it if it is
> non-NULL.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: bb436cbeb918 ("media: videobuf: fix epoll() by calling poll_wait first")
> Cc: <stable@vger.kernel.org>      # for v5.1 and up

Tested with the cx231xx driver:

Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
> diff --git a/drivers/media/v4l2-core/videobuf-core.c b/drivers/media/v4l2-core/videobuf-core.c
> index 7ef3e4d22bf6..939fc11cf080 100644
> --- a/drivers/media/v4l2-core/videobuf-core.c
> +++ b/drivers/media/v4l2-core/videobuf-core.c
> @@ -1123,7 +1123,6 @@ __poll_t videobuf_poll_stream(struct file *file,
>  	struct videobuf_buffer *buf = NULL;
>  	__poll_t rc = 0;
> 
> -	poll_wait(file, &buf->done, wait);
>  	videobuf_queue_lock(q);
>  	if (q->streaming) {
>  		if (!list_empty(&q->stream))
> @@ -1143,7 +1142,9 @@ __poll_t videobuf_poll_stream(struct file *file,
>  		}
>  		buf = q->read_buf;
>  	}
> -	if (!buf)
> +	if (buf)
> +		poll_wait(file, &buf->done, wait);
> +	else
>  		rc = EPOLLERR;
> 
>  	if (0 == rc) {
> 

