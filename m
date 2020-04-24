Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB821B7735
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 15:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgDXNmh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 09:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726667AbgDXNmh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 09:42:37 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38647C09B045
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2020 06:42:37 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id k28so7711639lfe.10
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2020 06:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9XPuItu2p5q0J1stXYL3FlizDb4b2Hp0W76okzjB3Yg=;
        b=1gBHdNVVVD55yBdxouLHVQIr2R2DG14UwgiuO1DRw+MsxOTtsLf6Qt4nCy2XNn0Wn9
         T+Z+OHefE+86FdQvoYKGav4kR+gpWcBZY448c0Rrexhv66wYCGuMFsInXNldtDi46o04
         rD/aRfmdPWZxY1H5gMK+k/OTThXFo7bm347H8dcPyg8MLpoIIf6WSa0BAjjnyqViV9+B
         S5z+aa2b6k6Nz4zPQs9Khf8Dpd8chZtC40Do54ozJSUPCxO21aQm9HkqYoTfskEWiOgT
         Ek5c9tTtMTnNqbEW4tTqdz7MbaEu3lx+zKesB59zZ6JnAYHCJZVOgPv7b3F7GuIt4WzF
         mUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9XPuItu2p5q0J1stXYL3FlizDb4b2Hp0W76okzjB3Yg=;
        b=tSPlepKRV8Fqs0KHPX64JolkEbAL/k9rat8QTUtF+PUQCoU17QT/NFGyS9uqlrY/WZ
         N9AoCeJBmIlvTeF2XnckFoPjyuymubMdy4v4BU4u1SqGvk8ESgHZEfPgz4ISgnAEqgZN
         2xjEWitAxl3w8/Sf9ZqpFjsgHAiQAphLpIlEUK9XH2We7S7XVfolk1EnVfepBLnJZset
         f6pw0KhErYL7AbA8Y0rYWnTXu2uFeWkZ0fuwvB6Td2wVxAEdV9SutfL/iV7ZNXg7uDNo
         T2xWc6at3TYVyyj8/t2Vs0NqCpMOpzRyGwsW8RcEZ6sEPZpCr/xs8P1YyJ3ZCeEw9DAa
         ZCWA==
X-Gm-Message-State: AGi0Puag0/WQAekSJ4iWe/5Jlj5RLsV8u73pMe1rn7GneqrSN/NPeoH+
        +dkIFlPCLs54eAEF83ooug2Yig==
X-Google-Smtp-Source: APiQypJUCaE4jBrGyzJqhy/Wi6vjxKbAYz+/SclhtNuTdMQXmtFuj4rozg3LhSbteTaPt3IW2bzkZg==
X-Received: by 2002:a19:5217:: with SMTP id m23mr6595764lfb.202.1587735755707;
        Fri, 24 Apr 2020 06:42:35 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id a13sm4259474ljm.25.2020.04.24.06.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 06:42:35 -0700 (PDT)
Date:   Fri, 24 Apr 2020 15:42:34 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        hans.verkuil@cisco.com, skhan@linuxfoundation.org,
        mchehab@kernel.org
Subject: Re: [PATCH v3 3/4] media: staging: rkisp1: use
 v4l2_pipeline_stream_{enable,disable} helpers
Message-ID: <20200424134234.GC4040416@oden.dyn.berto.se>
References: <20200415013044.1778572-1-helen.koike@collabora.com>
 <20200415013044.1778572-4-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200415013044.1778572-4-helen.koike@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

Thanks for your work.

On 2020-04-14 22:30:43 -0300, Helen Koike wrote:
> Use v4l2_pipeline_stream_{enable,disable} to call .s_stream() subdevice
> callbacks through the pipeline.
> 
> Tested by streaming on Scarlet Chromebook.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> ---
> 
> Changes in v3:
> - rebase on top of new helpers prototypes
> 
> Changes in v2:
> - rebase on top of new helpers prototypes
> 
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 76 +------------------
>  1 file changed, 3 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 24fe6a7888aa4..a18f1668e3563 100644
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
> +	v4l2_pipeline_stream_disable(&node->vdev, &cap->rkisp1->pipe);
>  
>  	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_ERROR);
>  
> @@ -1005,8 +936,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
>  	rkisp1_stream_start(cap);
>  
>  	/* start sub-devices */
> -	ret = rkisp1_pipeline_sink_walk(entity, NULL,
> -					rkisp1_pipeline_enable_cb);
> +	ret = v4l2_pipeline_stream_enable(&cap->vnode.vdev, &cap->rkisp1->pipe);
>  	if (ret)
>  		goto err_stop_stream;
>  
> @@ -1019,7 +949,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
>  	return 0;
>  
>  err_pipe_disable:
> -	rkisp1_pipeline_sink_walk(entity, NULL, rkisp1_pipeline_disable_cb);
> +	v4l2_pipeline_stream_disable(&cap->vnode.vdev, &cap->rkisp1->pipe);
>  err_stop_stream:
>  	rkisp1_stream_stop(cap);
>  	v4l2_pipeline_pm_put(entity);
> -- 
> 2.26.0
> 

-- 
Regards,
Niklas Söderlund
