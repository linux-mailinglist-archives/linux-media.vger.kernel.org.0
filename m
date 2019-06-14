Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3C5455CC
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 09:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfFNHXQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 03:23:16 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:56431 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725837AbfFNHXQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 03:23:16 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id bgYIhW1VS5qKabgYLhKgPi; Fri, 14 Jun 2019 09:23:14 +0200
Subject: Re: [PATCH 3/4] media: vimc: stream: add missing function
 documentation
To:     =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, helen.koike@collabora.com,
        kernel@collabora.com, lkcamp@lists.libreplanetbr.org,
        linux-kernel@vger.kernel.org
References: <20190613150616.19336-1-andrealmeid@collabora.com>
 <20190613150616.19336-4-andrealmeid@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <45507691-4836-8443-62f1-382383aa6e67@xs4all.nl>
Date:   Fri, 14 Jun 2019 09:23:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190613150616.19336-4-andrealmeid@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDg67Wp2kITHzjx4Hzs4089/ThUiPmc3f+shUNgu1ZcZa6cgVZDRk44Rc7/uxRl2GATyGDTyDUuG5YoS4dw/MpRr7l+5vYZW/thL7i/wmeuZNEGkVGlu
 r0SDuuQmownbExThgRsaxwivduWFErIgp2CJSJVxdlMmNezDXVG7/BWnM6J7mT3jV7URMHdZEseSzu/H6btBrnqlwaTofo9N5igKi+Rc3e7a7xsKwwvz8mTW
 ++KuZ9tJ8sFuk+2UMxhCozWFRBOfS/dP2LRCM50wGRe66CKiTtbks8YHtOeOtbYuRLKBQuRE+nmiyITLgXG5MuviEbBKT7yfdeNKrcu0mUPRUgaqNrM+fv+S
 xceOIfNTp+jnsGE++fYmLbyVm+BT627WnrBgDHGRmYMBKhkSXzI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/13/19 5:06 PM, André Almeida wrote:
> Add comments at vimc_streamer_s_stream and vimc_streamer_thread, making
> the vimc-stream totally documented.
> 
> Signed-off-by: André Almeida <andrealmeid@collabora.com>
> ---
>  drivers/media/platform/vimc/vimc-streamer.c | 22 +++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
> index 236ade38f1da..8556cc6e8654 100644
> --- a/drivers/media/platform/vimc/vimc-streamer.c
> +++ b/drivers/media/platform/vimc/vimc-streamer.c
> @@ -122,6 +122,14 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
>  	return -EINVAL;
>  }
>  
> +/*
> + * vimc_streamer_thread - process frames through the pipeline
> + *
> + * @data:	vimc_stream struct of the current streaming
> + *
> + * From the source to the sink, gets a frame from each subdevice and send to
> + * the next one of the pipeline in a fixed framerate.
> + */
>  static int vimc_streamer_thread(void *data)
>  {
>  	struct vimc_stream *stream = data;
> @@ -149,6 +157,20 @@ static int vimc_streamer_thread(void *data)
>  	return 0;
>  }
>  
> +/*
> + * vimc_streamer_s_stream - start/stop the streaming on the media pipeline
> + *
> + * @stream:	the pointer to the stream structure of the current stream
> + * @ved:	pointer to the vimc entity of the entity of the stream
> + * @enable:	flag to determine if stream should start/stop
> + *
> + * When starting, checks if there's no stream->kthread allocated. This should

checks -> check
there's -> there is

> + * indicates that a streaming is already running. Then, it's initialize

indicates -> indicate
it's initialize -> it initializes

> + * the pipeline, create and run a kthread to consume buffers through the

create and run -> creates and runs

> + * pipeline.
> + * When stopping, analogously check's it there's a streaming running, stops

check's it there's a streaming -> check if there is a stream



> + * the thread and terminate the pipeline.

terminate -> terminates

> + */
>  int vimc_streamer_s_stream(struct vimc_stream *stream,
>  			   struct vimc_ent_device *ved,
>  			   int enable)
> 

Regards,

	Hans
