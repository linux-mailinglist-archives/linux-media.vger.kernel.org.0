Return-Path: <linux-media+bounces-17725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFF996E718
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 03:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E6B21C231D1
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 01:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED54B1A270;
	Fri,  6 Sep 2024 01:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sQOs/dco"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CE6186A
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 01:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725584737; cv=none; b=pPqABiP7nFuRlOus3+mrJAeh3aokaOZTStJK0wbPMBO1rDV+IFV6YU/pu4xK0oFHBE+/nyPqWo6hOD5j+hKfki9UI+wSS4qj0bnik8qXrwxFQpID9opriDt7iaBnMgqIjV7oQoNsi5MEZn9nbyRCj3qviS8GaCFTkEiffXaBFt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725584737; c=relaxed/simple;
	bh=J02rQJFIdENo8s9OyaLrzvWWAhINGwRko9kbgLPFte4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZ0W3FiVZ5whSQqLKbMzMqn/sxTl38pVKsPG9TO+3FXv7e7cWsEYfaZaYNKoqb8dTJdHJ2r5jjL8nbrIxg26xl12LGoaVPsLSlJTzHXBO8lvFnTFfSjYXNMYxqlQarAl0WODndBd6r0YUnKhzSU/6uvLI5InwZhrTci/qaZJYB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sQOs/dco; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53653c23c3bso175234e87.3
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2024 18:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725584734; x=1726189534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pEISOZKVymIo9I1PGSjsszu4GcOoy0f94hhNiVuBx/I=;
        b=sQOs/dco09di2xawsEvjQ9W2MTen6rXKTqRy+7Ls3WFyi1HQ8+fbxIgbtZ3VnUEYrJ
         FAHjC9A7eb3VtSdWPghQzjChzeBRIOZ+RL4vSZONbjWIS7Ly1n7cZWwb5YyG0KS/qDvE
         L3q8ncY2TwsZRi/ewbXS7KEwtouGpHoyLhn9bIzDSAaKbUG9apMBmC5tOlxjbHXhfr6g
         3oglPy+g3KGMF8rgsWPw74LB6OOBgvvRbOtOj3ep2HqGb2V2jberNhIjPG0esMRpSaYs
         YSZ1GbL5MCdD1QxX4iJbXHnkWOHpHjuNn46WLwMS3qwEFX51DNz/GN93J6nTmsuTgNCe
         yGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725584734; x=1726189534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pEISOZKVymIo9I1PGSjsszu4GcOoy0f94hhNiVuBx/I=;
        b=cPJIlvEYOEN7//u+JaEDqYm0lPAL90Ad578L+R0jj8d+lDIoUMOG45+oGVnd5Nq1Eq
         W9tW1FwvosxF11s55kPXbcHjtcN3G3Dl2WxZ3XHn6EWV5hXAEwlqpnaL82HV3zpCSem9
         uBJTlIKe1Qu4NKbtX7o4T3xVGAelbdwlDWDbNm/6R76PaaAPcaXItyQ7RQT5BXOBSA8T
         hlnvoRbSh9aqcM9ZT1DrMODadtSPhJZ20UtXTcD5LDn6CBpieljQctAihEuYzjYV32eu
         WdwXd6BRgo3JnexyhZ14OSvIWcmtKKYzZElE5aX5iFNBYiePxHBjpJCGICFRXA4Gc9E8
         4awg==
X-Gm-Message-State: AOJu0YyZb9piPVho53tIoMP0rDlSrmFedtpz3baeRAILpwuN6jYxsPfy
	PzAHwOlbUevy6YQcV2u9uJt78LvkdvGKBodl99fQlX7v60xWRzwwSjSJrSnh7Hw=
X-Google-Smtp-Source: AGHT+IHqTecyMCXjxz/h97PL0XeJTktBMk1kLCkDh232vEf9xzuW6gKiZrusAkzTTBBC6DSTu79Mgg==
X-Received: by 2002:a05:6512:b9d:b0:52f:76:c258 with SMTP id 2adb3069b0e04-5365880faefmr194848e87.8.1725584733590;
        Thu, 05 Sep 2024 18:05:33 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53655171444sm183909e87.213.2024.09.05.18.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 18:05:33 -0700 (PDT)
Message-ID: <b9b1e8e9-5fd2-4880-abc5-300d9d28211c@linaro.org>
Date: Fri, 6 Sep 2024 04:05:31 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: qcom: camss: Remove use_count guard in
 stop_streaming
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hansverk@cisco.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org
References: <20240729-linux-next-24-07-13-camss-fixes-v3-0-38235dc782c7@linaro.org>
 <20240729-linux-next-24-07-13-camss-fixes-v3-1-38235dc782c7@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240729-linux-next-24-07-13-camss-fixes-v3-1-38235dc782c7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/24 15:42, Bryan O'Donoghue wrote:
> The use_count check was introduced so that multiple concurrent Raw Data
> Interfaces RDIs could be driven by different virtual channels VCs on the
> CSIPHY input driving the video pipeline.
> 
> This is an invalid use of use_count though as use_count pertains to the
> number of times a video entity has been opened by user-space not the number
> of active streams.
> 
> If use_count and stream-on count don't agree then stop_streaming() will
> break as is currently the case and has become apparent when using CAMSS
> with libcamera's released softisp 0.3.
> 
> The use of use_count like this is a bit hacky and right now breaks regular
> usage of CAMSS for a single stream case. Stopping qcam results in the splat
> below, and then it cannot be started again and any attempts to do so fails
> with -EBUSY.
> 
> [ 1265.509831] WARNING: CPU: 5 PID: 919 at drivers/media/common/videobuf2/videobuf2-core.c:2183 __vb2_queue_cancel+0x230/0x2c8 [videobuf2_common]
> ...
> [ 1265.510630] Call trace:
> [ 1265.510636]  __vb2_queue_cancel+0x230/0x2c8 [videobuf2_common]
> [ 1265.510648]  vb2_core_streamoff+0x24/0xcc [videobuf2_common]
> [ 1265.510660]  vb2_ioctl_streamoff+0x5c/0xa8 [videobuf2_v4l2]
> [ 1265.510673]  v4l_streamoff+0x24/0x30 [videodev]
> [ 1265.510707]  __video_do_ioctl+0x190/0x3f4 [videodev]
> [ 1265.510732]  video_usercopy+0x304/0x8c4 [videodev]
> [ 1265.510757]  video_ioctl2+0x18/0x34 [videodev]
> [ 1265.510782]  v4l2_ioctl+0x40/0x60 [videodev]
> ...
> [ 1265.510944] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 0 in active state
> [ 1265.511175] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 1 in active state
> [ 1265.511398] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 2 in active st
> 
> One CAMSS specific way to handle multiple VCs on the same RDI might be:
> 
> - Reference count each pipeline enable for CSIPHY, CSID, VFE and RDIx.
> - The video buffers are already associated with msm_vfeN_rdiX so
>    release video buffers when told to do so by stop_streaming.
> - Only release the power-domains for the CSIPHY, CSID and VFE when
>    their internal refcounts drop.
> 
> Either way refusing to release video buffers based on use_count is
> erroneous and should be reverted. The silicon enabling code for selecting
> VCs is perfectly fine. Its a "known missing feature" that concurrent VCs
> won't work with CAMSS right now.
> 
> Initial testing with this code didn't show an error but, SoftISP and "real"
> usage with Google Hangouts breaks the upstream code pretty quickly, we need
> to do a partial revert and take another pass at VCs.
> 
> This commit partially reverts commit 89013969e232 ("media: camss: sm8250:
> Pipeline starting and stopping for multiple virtual channels")
> 
> Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Closes: https://lore.kernel.org/lkml/ZoVNHOTI0PKMNt4_@hovoldconsulting.com/
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-video.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index cd72feca618c..3b8fc31d957c 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -297,12 +297,6 @@ static void video_stop_streaming(struct vb2_queue *q)
>   
>   		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
>   
> -		if (entity->use_count > 1) {
> -			/* Don't stop if other instances of the pipeline are still running */
> -			dev_dbg(video->camss->dev, "Video pipeline still used, don't stop streaming.\n");
> -			return;
> -		}
> -
>   		if (ret) {
>   			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
>   			return;
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

