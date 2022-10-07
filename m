Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECE85F79E4
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 16:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiJGOob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 10:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbiJGOoa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 10:44:30 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D33B8BB96
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 07:44:29 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id bv10so4059164wrb.4
        for <linux-media@vger.kernel.org>; Fri, 07 Oct 2022 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dH0I0D9MQ2kV5lmx0JlAikpECtYodT/MBKaJgTnZkgI=;
        b=JluJt4k1Oh4t+094uv2CBEPcMFfUeREaXqGnpyEdh//ADa/GwG7i3O825BovB4yR5d
         //A7x4OXOMjXFfT3L5631kfpMoZ2X8IGlomagqHSuaDKsqniyDAr9X8w0EpP/9BVMEkM
         bYLLJC8e1T0XRY1kjiRguYPSWMnq0i72OCL9td6bLQ0nVRrVYzEz9TbYzPrA++jVd/6k
         z8CLXwdyGYn9mFsJYUNtmGan5JSQGtrjUdn+62HJoauMOjxQSOF4C7R1/7G6Z+jbpoA4
         hTXgJCqCSJ3cD3g5+6j2aD8bjBB98MzNYEuqxNnpNBWghg34IFs42i4xKLvg3+y9TNIi
         iM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dH0I0D9MQ2kV5lmx0JlAikpECtYodT/MBKaJgTnZkgI=;
        b=LJaht66Q6UOxmpASHVbWdKRzncX88pPsBQHom3io7+Mecx9PY2Lw5sLSA1IeP5KEXZ
         6E+ZBBh+3dM5MTzhdhrXrlMx7+4ByB9Z75oka/+rpGjU+L+POkQxpN8AE2TWlVMfgtPo
         ECBvz1+yiYRGf/MkDPWlxJEuuG6OgxJzI7MShxPAPV0Dl1WxCjhJbCHAxoshLeMqjin/
         55f5QEYriffOUrZxc0jq2W1a3xRu0FJm2q5sf4XpMTEpL3YcP4vCV1X9mulCNP+9iUim
         hXCEZUk6Fl31p+a2R6yNip8vtY/IPPYJMF2gI0m+mJ9OzWSYlBmdgmQQN7bQ+pLAahaE
         OrQw==
X-Gm-Message-State: ACrzQf1J1QCv64+Vlszkhb2tVyVbGjmOtIPJDy/v2Uk2FSpVkjqFdeiA
        3SSFILwNpkJApS5Ggc71++8OnjHHEvFIAw==
X-Google-Smtp-Source: AMsMyM5N3qr4xcQGe0HtKtrEIHPPSpq5/OmhDeQKAZulWlLFxUAci8mn+esb4RMaZV6Z6cVRzOkk3w==
X-Received: by 2002:adf:edd1:0:b0:22e:5257:a19e with SMTP id v17-20020adfedd1000000b0022e5257a19emr3339317wro.180.1665153867464;
        Fri, 07 Oct 2022 07:44:27 -0700 (PDT)
Received: from [192.168.0.159] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l15-20020adfe58f000000b0022ac119fcc5sm2142938wrm.60.2022.10.07.07.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Oct 2022 07:44:27 -0700 (PDT)
Message-ID: <2b54256f-edba-0379-d6df-3135f6c61440@linaro.org>
Date:   Fri, 7 Oct 2022 15:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/4] media: camss: sm8250: Pipeline starting and
 stopping for multiple virtual channels
Content-Language: en-US
To:     quic_mmitkov@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        akapatra@quicinc.com, jzala@quicinc.com, todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mchehab@kernel.org,
        cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com
References: <20221007132009.1886-1-quic_mmitkov@quicinc.com>
 <20221007132009.1886-5-quic_mmitkov@quicinc.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20221007132009.1886-5-quic_mmitkov@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/10/2022 14:20, quic_mmitkov@quicinc.com wrote:
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
> ---
>   .../media/platform/qcom/camss/camss-video.c   | 21 ++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 81fb3a5bc1d5..b042faf3dcda 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -353,6 +353,7 @@ static int video_get_subdev_format(struct camss_video *video,
>   
>   	fmt.pad = pad;
>   	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +	fmt.stream = 0;
>   
>   	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
>   	if (ret)
> @@ -493,9 +494,11 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
>   	struct v4l2_subdev *subdev;
>   	int ret;
>   
> -	ret = video_device_pipeline_start(vdev, &video->pipe);
> -	if (ret < 0)
> +	ret = video_device_pipeline_alloc_start(vdev);
> +	if (ret < 0) {
> +		dev_err(video->camss->dev, "Failed to start media pipeline: %d\n", ret);
>   		return ret;
> +	}
>   
>   	ret = video_check_format(video);
>   	if (ret < 0)
> @@ -536,6 +539,7 @@ static void video_stop_streaming(struct vb2_queue *q)
>   	struct media_entity *entity;
>   	struct media_pad *pad;
>   	struct v4l2_subdev *subdev;
> +	int ret;
>   
>   	entity = &vdev->entity;
>   	while (1) {
> @@ -550,7 +554,18 @@ static void video_stop_streaming(struct vb2_queue *q)
>   		entity = pad->entity;
>   		subdev = media_entity_to_v4l2_subdev(entity);
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
>   	}
>   
>   	video_device_pipeline_stop(vdev);

Hi.

This still doesn't apply to media tip of tree fixes

I get 3/4 patches in then the last one doesn't apply

To ssh://git.linaro.org/people/bryan.odonoghue/kernel.git
  * [new branch]                HEAD -> 
media-tree-fixes-22-10-07+qcom-camss-vc-partial

