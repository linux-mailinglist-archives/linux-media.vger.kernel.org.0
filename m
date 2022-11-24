Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 697806379D9
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 14:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiKXNWd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 08:22:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiKXNWb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 08:22:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 641F6FEE;
        Thu, 24 Nov 2022 05:22:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 223E3B827EC;
        Thu, 24 Nov 2022 13:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3992CC433C1;
        Thu, 24 Nov 2022 13:22:22 +0000 (UTC)
Message-ID: <02507136-170d-aeac-b422-327afccf3020@xs4all.nl>
Date:   Thu, 24 Nov 2022 14:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 4/4] media: camss: sm8250: Pipeline starting and
 stopping for multiple virtual channels
Content-Language: en-US
To:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, bryan.odonoghue@linaro.org,
        cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com>
 <20221013121255.1977-5-quic_mmitkov@quicinc.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221013121255.1977-5-quic_mmitkov@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Milen,

Just a small comment:

On 13/10/2022 14:12, quic_mmitkov@quicinc.com wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> 
> Use the multistream series function video_device_pipeline_alloc_start
> to allows multiple clients of the same pipeline.
> 
> If any of the entities in the pipeline doesn't return success at stop
> (e.g. if a VFE line remains running), the full pipeline won't be stopped.
> This allows for stopping and starting streams at any point without
> disrupting the other running streams.
> 
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../media/platform/qcom/camss/camss-video.c   | 21 ++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 81fb3a5bc1d5..094971e2ff02 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -351,6 +351,7 @@ static int video_get_subdev_format(struct camss_video *video,
>  	if (subdev == NULL)
>  		return -EPIPE;
>  
> +	memset(&fmt, 0, sizeof(fmt));
>  	fmt.pad = pad;
>  	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>  
> @@ -493,9 +494,11 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>  	struct v4l2_subdev *subdev;
>  	int ret;
>  
> -	ret = video_device_pipeline_start(vdev, &video->pipe);
> -	if (ret < 0)
> +	ret = video_device_pipeline_alloc_start(vdev);
> +	if (ret < 0) {
> +		dev_err(video->camss->dev, "Failed to start media pipeline: %d\n", ret);
>  		return ret;

This should be a 'goto flush_buffers;'.

Regards,

	Hans

> +	}
>  
>  	ret = video_check_format(video);
>  	if (ret < 0)
> @@ -536,6 +539,7 @@ static void video_stop_streaming(struct vb2_queue *q)
>  	struct media_entity *entity;
>  	struct media_pad *pad;
>  	struct v4l2_subdev *subdev;
> +	int ret;
>  
>  	entity = &vdev->entity;
>  	while (1) {
> @@ -550,7 +554,18 @@ static void video_stop_streaming(struct vb2_queue *q)
>  		entity = pad->entity;
>  		subdev = media_entity_to_v4l2_subdev(entity);
>  
> -		v4l2_subdev_call(subdev, video, s_stream, 0);
> +		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
> +
> +		if (ret == -EBUSY) {
> +			/* Don't stop if other instances of the pipeline are still running */
> +			dev_dbg(video->camss->dev, "Video pipeline still used, don't stop streaming.\n");
> +			return;
> +		}
> +
> +		if (ret) {
> +			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
> +			return;
> +		}
>  	}
>  
>  	video_device_pipeline_stop(vdev);

