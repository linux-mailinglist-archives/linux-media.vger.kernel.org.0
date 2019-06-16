Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE4F472BA
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 04:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbfFPCsb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jun 2019 22:48:31 -0400
Received: from merlin.infradead.org ([205.233.59.134]:52364 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbfFPCsb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jun 2019 22:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=fVR/gatsCNvx0HfZ+cZtZt1egg9Lv7Ur86vtwfcXrT4=; b=osqG7nTxCG0chX8AjzYKA4XQN7
        43yVCmjIEtwVihWM9s4a7ybp7yDBwUgVxyzal/Hw6DIuvlK34Mivqb2eG38meWVPEKm5MwSH8gMtQ
        YsrZTs+qP09+6BJSk1Mhc8V9zsldhCKJ78vDT+oE4rxjFMZNHlcDL7Yx9fqlLYhRpVT3a8PiQs3sb
        v34iQ7R7ZVuA34UL652FrgWLaQimFv76S2EY5t1FaVrTEMwHjVFcn16g3Zyxf9bw2GWCoX1rKFw/X
        IVdZ91J0bovZt2l4n2TwTM29SL637mJFjdAegaUWsQujbmGaYEMKe/fY2NEgKWzpUr6hgJiqmqY3v
        Qawzmf0g==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hcLDY-0006gs-1P; Sun, 16 Jun 2019 02:48:28 +0000
Subject: Re: [PATCH v2 1/2] media: vimc: stream: add missing function
 documentation
To:     =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>,
        linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil@xs4all.nl, helen.koike@collabora.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org
References: <20190616020959.7360-1-andrealmeid@collabora.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ed60e26e-64f2-4769-3018-135cbf0fbfc0@infradead.org>
Date:   Sat, 15 Jun 2019 19:48:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190616020959.7360-1-andrealmeid@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/15/19 7:09 PM, André Almeida wrote:
> Add comments at vimc_streamer_s_stream and vimc_streamer_thread, making
> the vimc-stream totally documented.
> 
> Signed-off-by: André Almeida <andrealmeid@collabora.com>
> ---
> Commit extracted from [PATCH 0/4] media: vimc: Minor code cleanup
> and documentation
> 
> Changes in v2: fix typos
> 
>  drivers/media/platform/vimc/vimc-streamer.c | 22 +++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
> index 236ade38f1da..76435e87d609 100644
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

                                   of the current stream               ??

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
> + * When starting, check if there is no stream->kthread allocated. This should
> + * indicate that a streaming is already running. Then, it initializes
> + * the pipeline, creates and runs a kthread to consume buffers through the
> + * pipeline.
> + * When stopping, analogously check if there is a stream running, stops
> + * the thread and terminates the pipeline.
> + */
>  int vimc_streamer_s_stream(struct vimc_stream *stream,
>  			   struct vimc_ent_device *ved,
>  			   int enable)
> 


-- 
~Randy
