Return-Path: <linux-media+bounces-38017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05814B08DA8
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 14:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3E9C4E1E5B
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AAA2D77F3;
	Thu, 17 Jul 2025 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KEn8ySAC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D801F92A
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752757013; cv=none; b=iUEESK1tzdck2gJrxRHW1bOROtHJwSTaajNfNfj0rHlQ/t3vjFGkaOeuhuSr/F3CdSVxgQjwAzVAPd5DWKlbuTsGllCJkEYDvQKaC9n52T2JODWaM8Iu5Zc26f7Di474DheX2qCmAxB1a1EWssNPYcXd9MZb0XnVU9VY8mg4rA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752757013; c=relaxed/simple;
	bh=+vfZ4qEJmhJ0CuZgJ5MckVbDrjcXFYLiFJD4FgeIvdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5Z0yS5MkclhjvPjKSLvQNBb1q2K1/CNy3MZ9cMM0hlBMsmdOaSusagXEfpKIPESohZ+hf664y4JSwpFUPl2jmJC7xpKE/AVn1svDctYSZlUnk7g+QDl2E7V2W3wCl2GRRqnMq51GVCc2TqpHrDhrg6dFOVboQi+Jw8z9xqkyqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KEn8ySAC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d54214adso6591035e9.3
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 05:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752757009; x=1753361809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0mNyr/hM5aTyuCJBMUBNmNPc9rqjSE6cNDS+GRjXb5Y=;
        b=KEn8ySACd0+SRg7HI22ifwJ7BuwhVLJ99sN1U9jDQYnx6Z0yXIQRGOJ7AKFuVlDPy8
         G7bwj/rcS37NKeNg77rxi5BbJi+Zq5mXKEW46O79D/ygqtWXQzCP0/q3LUXx7vioTfJE
         MSyvpGSzTLhV3rwhZ0EnWqUncuVPqq2i2UjtOfbztZfscIK9tRWIXorCtYu/X55V3mTE
         zkqrmDta//eGSKrQzHIdu904bHKWEoV+YlGXyrJ+MnMQvH7PNelbFAL9s6MtwLVEP1Wp
         D+lVuNU99DhnqPQYG3i6FOM+EMDLuT4qrC81geZC9W8t+OrRTEAAASsC4VOa1D3BImpR
         V3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757009; x=1753361809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0mNyr/hM5aTyuCJBMUBNmNPc9rqjSE6cNDS+GRjXb5Y=;
        b=DG4yvCY0jIA8b4NMNLzzOMgapWtTUK16Pg5vxRZw7lq2WOVAjfFAbbBne75XglVFZX
         Fco2Rnkma7uH68ZoB4QsVryJM2yeogO5JvK3FA62hwfqz9LdRY0J3wwD2StBKMUrM5JS
         dnqqshaONP/DLialfENLNDHPc4fIh4rx8vOzkOXE0IHLsLG5Kx301MecNNQxTajXKSmS
         qwWiTN7yqDCYoiJs1b0H0DXv4ej6ESWA13omWALDaHKH0eiAE9DTZbEMrnsT+RmdBAcM
         vuinkrMBQKdxIoEzepRlS9iBFmtrGUoUNcBTIUFsmETAJjhdP4CNd/7Z5vbve4rHWpAn
         1ZcA==
X-Forwarded-Encrypted: i=1; AJvYcCWTKMoZM8elvzMzYOWszsdl3Fxc8SzgEejoMXGG88P4qdo7brqJf91+jnT6iN3MuszTfTBk9LwNOzaQcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDBk/WXpwXRZKvVQKrvst+LFkUsuhqo4LHwKyZ8dnGORZdPTKA
	wZn1nheNf1wQbt4o6uh0AXxyF0lpGZMdtdI4IwRBM0vjhuVWPt2T6d2jiEuTQSMQums=
X-Gm-Gg: ASbGncvw6naZXLV1EU9JzKL+XWArIkn5MrR9MhccQm/1QcCywEdMUhXUqQ5i43S3T68
	arB/DRDG1CvgaLtPjLVj8IsnpkQV04nlmwjpGVDM0Z8BnoQ/vVnXbqmoffjPUE1oAMweyjP0S/L
	LFEXmE+0nqPtDYshQyln9qPqzUJGD5+CSI8wqw/0lWWj4M6O2jBotMSbLxMVE0/+u2vWpMKbgs5
	6I29qxCh3JPHFm59kCz7Vn7ifyXxLuUvOi1HXe/CxKT6Ga3/Fi5yaBuYVPAUe25zzXo9f/rHHxy
	Ce7hr+UcnmJF0gd7MN9ZhfC3tbRAhoZS4tUkQWtINYUxF45Eb7iAbURwFn1RH78tEb1ZelXz9vu
	udB6oWbgoyJbLFl/nJFejZD36XqPFeL2r6ndEqOKPfP4KCs5c2uc4kURfGC5UgSrq
X-Google-Smtp-Source: AGHT+IFwzlcZ3XyphB6xVJH9plnzq9OlfvUFVxbUtfP76iynvrgFKDaR31Nt3Cogffx1lz6L3MLP9A==
X-Received: by 2002:a05:600c:314a:b0:455:ed48:144f with SMTP id 5b1f17b1804b1-456352e9d36mr27356435e9.14.1752757008778;
        Thu, 17 Jul 2025 05:56:48 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b617e8e1c0sm517552f8f.6.2025.07.17.05.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 05:56:48 -0700 (PDT)
Message-ID: <3f838ee3-af25-4cf5-afcb-823ba68f0f43@linaro.org>
Date: Thu, 17 Jul 2025 13:56:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: Add link support for TPG
 common
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
 <20250717-lemans_tpg-v2-2-a2538659349c@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250717-lemans_tpg-v2-2-a2538659349c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2025 04:20, Wenmeng Liu wrote:
> TPG is connected to the csid as an entity, the link
> needs to be adapted.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c | 44 +++++++++++++++++-----
>   drivers/media/platform/qcom/camss/camss.c      | 52 ++++++++++++++++++++++++++
>   2 files changed, 87 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 5284b5857368c37c202cd89dad6ae8042b637537..1ee4c4cc61cb32ce731dd8123522cc729d1ae3bb 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1226,6 +1226,23 @@ void msm_csid_get_csid_id(struct media_entity *entity, u8 *id)
>   	*id = csid->id;
>   }
>   
> +/*
> + * csid_get_csiphy_tpg_lane_assign - Calculate lane assign by tpg lane num
> + * @num - tpg lane num
> + *
> + * Return lane assign
> + */
> +static u32 csid_get_csiphy_tpg_lane_assign(int num)
> +{
> +	u32 lane_assign = 0;
> +	int i;
> +
> +	for (i = (num - 1); i >= 0; i--)
> +		lane_assign |= i << (i * 4);
> +
> +	return lane_assign;
> +}

Are you actually supporting different # of lanes feeding into the CSID ?

If so you need to show how, if not drop dead code.

> +
>   /*
>    * csid_get_lane_assign - Calculate CSI2 lane assign configuration parameter
>    * @lane_cfg - CSI2 lane configuration
> @@ -1266,6 +1283,7 @@ static int csid_link_setup(struct media_entity *entity,
>   		struct csid_device *csid;
>   		struct csiphy_device *csiphy;
>   		struct csiphy_lanes_cfg *lane_cfg;
> +		struct tpg_device *tpg;
>   
>   		sd = media_entity_to_v4l2_subdev(entity);
>   		csid = v4l2_get_subdevdata(sd);
> @@ -1277,18 +1295,26 @@ static int csid_link_setup(struct media_entity *entity,
>   			return -EBUSY;
>   
>   		sd = media_entity_to_v4l2_subdev(remote->entity);
> -		csiphy = v4l2_get_subdevdata(sd);
> +		if (strnstr(sd->name, MSM_TPG_NAME, strlen(MSM_TPG_NAME))) {
> +			tpg = v4l2_get_subdevdata(sd);

If you need a flag add an "is_tpg" or otherwise encode a property into 
the csiphy device.

I can imagine needing to differentiate between CSIPHY and TPG numerous 
times and we shouldn't be doing string comparisons for that.

>   
> -		/* If a sensor is not linked to CSIPHY */
> -		/* do no allow a link from CSIPHY to CSID */
> -		if (!csiphy->cfg.csi2)
> -			return -EPERM;
> +			csid->phy.lane_cnt = tpg->res->lane_cnt;

The lane counts are fixed in the config so surely the assign_lane is 
redundant - you could literally call the same function in the CSIPHY.

So bigger question since alot of this code is copy/paste from CSIPHY - 
why are we not reusing the code in camss-csiphy.c - either by extending 
that file - i.e. adding TPG inside of that file or by exporting 
functions from that file into camss-tpg.c ?

Either way I'd like to reduce code duplication.

> +			csid->phy.csiphy_id = tpg->id;
> +			csid->phy.lane_assign = csid_get_csiphy_tpg_lane_assign(csid->phy.lane_cnt);
> +		} else {
> +			csiphy = v4l2_get_subdevdata(sd);
> +
> +			/* If a sensor is not linked to CSIPHY */
> +			/* do no allow a link from CSIPHY to CSID */
> +			if (!csiphy->cfg.csi2)
> +				return -EPERM;
>   
> -		csid->phy.csiphy_id = csiphy->id;
> +			csid->phy.csiphy_id = csiphy->id;
>   
> -		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
> -		csid->phy.lane_cnt = lane_cfg->num_data;
> -		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
> +			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
> +			csid->phy.lane_cnt = lane_cfg->num_data;
> +			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
> +		}
>   	}
>   	/* Decide which virtual channels to enable based on which source pads are enabled */
>   	if (local->flags & MEDIA_PAD_FL_SOURCE) {
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index af5c9326736f9c8576816c91b73ad3e1d3a49dbf..34f71039038e881ced9c9f06bd70915b5c5f610f 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3913,6 +3913,19 @@ static int camss_init_subdevices(struct camss *camss)
>   		}
>   	}
>   
> +	if (camss->tpg) {
> +		for (i = 0; i < camss->res->tpg_num; i++) {
> +			ret = msm_tpg_subdev_init(camss, &camss->tpg[i],
> +						  &res->tpg_res[i], i);
> +			if (ret < 0) {
> +				dev_err(camss->dev,
> +					"Failed to init tpg%d sub-device: %d\n",
> +					i, ret);
> +				return ret;
> +			}
> +		}
> +	}

OK so what I'd like is the thinking on why TPG is its own camss-tpg.c 
and its own device, instead of a property of the CSIPHY.

I can lay out some of the arguments for/against that spring to mind.

Separate for:
     Cleaner code ?
     Less logical change ?
     Fewer clocks/ISR stuff to handle ?

Separate against:
     Code duplication
     Data structure duplication

I'd like you to explain your reasoning for the design choice, either in 
the cover letter or inline as a response.

BTW its not criticism, I'm trying to get clear in my head your thinking 
and also to prompt you to think about doing it the other way and to 
justify the design choice to yourself and others or to change to a 
different design choice, if that makes sense.

Part of me says "yes TPG should be its own device" another part of me 
says "but it is so similar to CSIPHY" - either way I'd like to reduce 
code duplication to something approaching nil.

---
bod

