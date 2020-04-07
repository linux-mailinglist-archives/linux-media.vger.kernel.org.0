Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B16531A1706
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 22:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgDGUvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 16:51:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44254 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgDGUvS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Apr 2020 16:51:18 -0400
Received: from [IPv6:2804:431:e7cc:377d:dcf4:aab0:a7bd:9880] (unknown [IPv6:2804:431:e7cc:377d:dcf4:aab0:a7bd:9880])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CBAC22947F5;
        Tue,  7 Apr 2020 21:51:13 +0100 (BST)
Subject: Re: [PATCH v2 2/3] media: staging: rkisp1: use
 v4l2_pipeline_stream_{enable,disable} helpers
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        hans.verkuil@cisco.com, skhan@linuxfoundation.org,
        mchehab@kernel.org
References: <20200403213312.1863876-1-helen.koike@collabora.com>
 <20200403213312.1863876-3-helen.koike@collabora.com>
 <20200407193453.GF1716317@oden.dyn.berto.se>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <152f9441-75cf-b400-d57e-e8e003890943@collabora.com>
Date:   Tue, 7 Apr 2020 17:51:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407193453.GF1716317@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/7/20 4:34 PM, Niklas Söderlund wrote:
> Hi Helen,
> 
> Thanks for your work.
> 
> On 2020-04-03 18:33:11 -0300, Helen Koike wrote:
>> Use v4l2_pipeline_stream_{enable,disable} to call .s_stream() subdevice
>> callbacks through the pipeline.
>>
>> Tested by streaming on RockPi4 with imx219 and on Scarlet Chromebook.
>>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>
>> ---
>>
>> Changes in v2:
>> - rebase on top of new helpers prototypes
>>
>>  drivers/staging/media/rkisp1/rkisp1-capture.c | 76 +------------------
>>  1 file changed, 3 insertions(+), 73 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> index 24fe6a7888aa4..0c2a357c4a12a 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> @@ -838,71 +838,6 @@ static void rkisp1_return_all_buffers(struct rkisp1_capture *cap,
>>  	spin_unlock_irqrestore(&cap->buf.lock, flags);
>>  }
>>  
>> -/*
>> - * rkisp1_pipeline_sink_walk - Walk through the pipeline and call cb
>> - * @from: entity at which to start pipeline walk
>> - * @until: entity at which to stop pipeline walk
>> - *
>> - * Walk the entities chain starting at the pipeline video node and stop
>> - * all subdevices in the chain.
>> - *
>> - * If the until argument isn't NULL, stop the pipeline walk when reaching the
>> - * until entity. This is used to disable a partially started pipeline due to a
>> - * subdev start error.
>> - */
>> -static int rkisp1_pipeline_sink_walk(struct media_entity *from,
>> -				     struct media_entity *until,
>> -				     int (*cb)(struct media_entity *from,
>> -					       struct media_entity *curr))
>> -{
>> -	struct media_entity *entity = from;
>> -	struct media_pad *pad;
>> -	unsigned int i;
>> -	int ret;
>> -
>> -	while (1) {
>> -		pad = NULL;
>> -		/* Find remote source pad */
>> -		for (i = 0; i < entity->num_pads; i++) {
>> -			struct media_pad *spad = &entity->pads[i];
>> -
>> -			if (!(spad->flags & MEDIA_PAD_FL_SINK))
>> -				continue;
>> -			pad = media_entity_remote_pad(spad);
>> -			if (pad && is_media_entity_v4l2_subdev(pad->entity))
>> -				break;
>> -		}
>> -		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
>> -			break;
>> -
>> -		entity = pad->entity;
>> -		if (entity == until)
>> -			break;
>> -
>> -		ret = cb(from, entity);
>> -		if (ret)
>> -			return ret;
>> -	}
>> -
>> -	return 0;
>> -}
>> -
>> -static int rkisp1_pipeline_disable_cb(struct media_entity *from,
>> -				      struct media_entity *curr)
>> -{
>> -	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
>> -
>> -	return v4l2_subdev_call(sd, video, s_stream, false);
>> -}
>> -
>> -static int rkisp1_pipeline_enable_cb(struct media_entity *from,
>> -				     struct media_entity *curr)
>> -{
>> -	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(curr);
>> -
>> -	return v4l2_subdev_call(sd, video, s_stream, true);
>> -}
>> -
>>  static void rkisp1_stream_stop(struct rkisp1_capture *cap)
>>  {
>>  	int ret;
>> @@ -929,11 +864,7 @@ static void rkisp1_vb2_stop_streaming(struct vb2_queue *queue)
>>  
>>  	rkisp1_stream_stop(cap);
>>  	media_pipeline_stop(&node->vdev.entity);
>> -	ret = rkisp1_pipeline_sink_walk(&node->vdev.entity, NULL,
>> -					rkisp1_pipeline_disable_cb);
>> -	if (ret)
>> -		dev_err(rkisp1->dev,
>> -			"pipeline stream-off failed error:%d\n", ret);
>> +	v4l2_pipeline_stream_disable(&node->vdev);
>>  
>>  	rkisp1_return_all_buffers(cap, VB2_BUF_STATE_ERROR);
>>  
>> @@ -1005,8 +936,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
>>  	rkisp1_stream_start(cap);
>>  
>>  	/* start sub-devices */
>> -	ret = rkisp1_pipeline_sink_walk(entity, NULL,
>> -					rkisp1_pipeline_enable_cb);
>> +	ret = v4l2_pipeline_stream_enable(&cap->vnode.vdev);
>>  	if (ret)
>>  		goto err_stop_stream;
>>  
>> @@ -1019,7 +949,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
>>  	return 0;
>>  
>>  err_pipe_disable:
>> -	rkisp1_pipeline_sink_walk(entity, NULL, rkisp1_pipeline_disable_cb);
>> +	v4l2_pipeline_stream_disable(entity, &cap->rkisp1->pipe);
> 
> This does not match the prototype for v4l2_pipeline_stream_disable() or 
> am I missing something ?

You are right, I must have messed with my branches, because I'm sure I compiled and tested it.

Thanks for catching this.
Helen

> 
>>  err_stop_stream:
>>  	rkisp1_stream_stop(cap);
>>  	v4l2_pipeline_pm_put(entity);
>> -- 
>> 2.26.0
>>
> 
