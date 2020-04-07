Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5231A1608
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 21:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgDGTe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 15:34:58 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35407 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgDGTe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 15:34:58 -0400
Received: by mail-lj1-f196.google.com with SMTP id k21so5115880ljh.2
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2020 12:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oTjVCuFZKsHR8rmYdP/22TGJxJAP4oGFR0k0Wc3dyYI=;
        b=lrRSGAFzEbPXA07o375bOTdLd/YSixu9Cg0DCC119qB+A0gJMrSmfWoh6tIaNBaCBh
         FM63P7UQcATYjdDP9dFzQdXXw553/fZs6dj1mQH5HiZ0h02TpeO9AQg5/kKu8zdGRg+u
         bg0wa4M5+EqIDi/Z5Y5o+wmsNXz0bhaB1DTDOvfSNAzK3OgbOcC+HtdSMnXWAwn8jIhf
         RsJKWIJNBj4dpA+Ga7Jt80PlWiDH97iTAJtqyM0Siv0BHwjTpIsIoh43ffACr7aEXoD9
         FRQy8+0b2vNEGq6jH6eZNeYpspW5IGmZ++F0vvC0Ile+1WkITvhK7rvm0mBp0Ukl/YBZ
         ogPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oTjVCuFZKsHR8rmYdP/22TGJxJAP4oGFR0k0Wc3dyYI=;
        b=U4x7BTA2FqqFv0vq5M+De/QaumGOA9sqv9CntOArWwgWP2IqkRO8x1vTJtCV8kBPGl
         HlONJtiheYkToUbqVCusWX0N6SmcHFI7bjvbK/2q/ESBWBSq1Yz2SlINZj+wWxjgl/ie
         AsDXieAzhJRzhUY0POthzNIZ+DcoySlFJw0QbMpoeZIEJXpMOwln/RA7QX1ZG06Gqrgg
         D5TUJ1s5CaS2bOtkksg0B7csTe/LvgoU0+chvupec1cUsFcp6wAHUVXBerJmvECPwYyJ
         qXzxI5hUzIrDhfu5mvpJw5mTSF0SMdCBVcutUsVmj2ik+8n5o8BYFsk102rNFa2Y1kYd
         kfPQ==
X-Gm-Message-State: AGi0PuYzEt5p+YcVQnvZxR1wBBQ23qsXbcS1bso5Kmk4L8dYsiDRuZon
        k/UCLpm5rJNFEioezxbpvvmBkQ==
X-Google-Smtp-Source: APiQypK2WA/n6jRO1CDXfuB25Me8MW/u2D6IwvVc8Ic6ePlBFao53EmemdW8U8NK2YQnPSBPI6hZBg==
X-Received: by 2002:a2e:87cc:: with SMTP id v12mr2704317ljj.127.1586288095696;
        Tue, 07 Apr 2020 12:34:55 -0700 (PDT)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id y20sm12437520ljy.100.2020.04.07.12.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 12:34:55 -0700 (PDT)
Date:   Tue, 7 Apr 2020 21:34:53 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        hans.verkuil@cisco.com, skhan@linuxfoundation.org,
        mchehab@kernel.org
Subject: Re: [PATCH v2 2/3] media: staging: rkisp1: use
 v4l2_pipeline_stream_{enable,disable} helpers
Message-ID: <20200407193453.GF1716317@oden.dyn.berto.se>
References: <20200403213312.1863876-1-helen.koike@collabora.com>
 <20200403213312.1863876-3-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200403213312.1863876-3-helen.koike@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for your work.

On 2020-04-03 18:33:11 -0300, Helen Koike wrote:
> Use v4l2_pipeline_stream_{enable,disable} to call .s_stream() subdevice
> callbacks through the pipeline.
> 
> Tested by streaming on RockPi4 with imx219 and on Scarlet Chromebook.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> Changes in v2:
> - rebase on top of new helpers prototypes
> 
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 76 +------------------
>  1 file changed, 3 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 24fe6a7888aa4..0c2a357c4a12a 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -838,71 +838,6 @@ static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
>  	spin_unlock_irqrestore(&cap->buf.lock, flags);
>  }
>  
> -/*
> - * rkisp1_pipeline_sink_walk - Walk through the pipeline and call cb
> - * @from: entity at which to start pipeline walk
> - * @until: entity at which to stop pipeline walk
> - *
> - * Walk the entities chain starting at the pipeline video node and stop
> - * all subdevices in the chain.
> - *
> - * If the until argument isn't NULL, stop the pipeline walk when reaching the
> - * until entity. This is used to disable a partially started pipeline due to a
> - * subdev start error.
> - */
> -static int rkisp1_pipeline_sink_walk(struct media_entity *from,
> -				     struct media_entity *until,
> -				     int (*cb)(struct media_entity *from,
> -					       struct media_entity *curr))
> -{
> -	struct media_entity *entity = from;
> -	struct media_pad *pad;
> -	unsigned int i;
> -	int ret;
> -
> -	while (1) {
> -		pad = NULL;
> -		/* Find remote source pad */
> -		for (i = 0; i < entity->num_pads; i++) {
> -			struct media_pad *spad = &entity->pads[i];
> -
> -			if (!(spad->flags & MEDIA_PAD_FL_SINK))
> -				continue;
> -			pad = media_entity_remote_pad(spad);
> -			if (pad && is_media_entity_v4l2_subdev(pad->entity))
> -				break;
> -		}
> -		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
> -			break;
> -
> -		entity = pad->entity;
> -		if (entity == until)
> -			break;
> -
> -		ret = cb(from, entity);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static int rkisp1_pipeline_disable_cb(struct media_entity *from,
> -				      struct media_entity *curr)
> -{
> -	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
> -
> -	return v4l2_subdev_call(sd, video, s_stream, false);
> -}
> -
> -static int rkisp1_pipeline_enable_cb(struct media_entity *from,
> -				     struct media_entity *curr)
> -{
> -	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
> -
> -	return v4l2_subdev_call(sd, video, s_stream, true);
> -}
> -
>  static void rkisp1_stream_stop(struct rkisp1_capture *cap)
>  {
>  	int ret;
> @@ -929,11 +864,7 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
>  
>  	rkisp1_stream_stop(cap);
>  	media_pipeline_stop(&node->vdev.entity);
> -	ret = rkisp1_pipeline_sink_walk(&node->vdev.entity, NULL,
> -					rkisp1_pipeline_disable_cb);
> -	if (ret)
> -		dev_err(rkisp1->dev,
> -			"pipeline stream-off failed error:%d\n", ret);
> +	v4l2_pipeline_stream_disable(&node->vdev);
>  
>  	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_ERROR);
>  
> @@ -1005,8 +936,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
>  	rkisp1_stream_start(cap);
>  
>  	/* start sub-devices */
> -	ret = rkisp1_pipeline_sink_walk(entity, NULL,
> -					rkisp1_pipeline_enable_cb);
> +	ret = v4l2_pipeline_stream_enable(&cap->vnode.vdev);
>  	if (ret)
>  		goto err_stop_stream;
>  
> @@ -1019,7 +949,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
>  	return 0;
>  
>  err_pipe_disable:
> -	rkisp1_pipeline_sink_walk(entity, NULL, rkisp1_pipeline_disable_cb);
> +	v4l2_pipeline_stream_disable(entity, &cap->rkisp1->pipe);

This does not match the prototype for v4l2_pipeline_stream_disable() or 
am I missing something ?

>  err_stop_stream:
>  	rkisp1_stream_stop(cap);
>  	v4l2_pipeline_pm_put(entity);
> -- 
> 2.26.0
> 

-- 
Regards,
Niklas Söderlund
