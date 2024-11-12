Return-Path: <linux-media+bounces-21340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B212C9C6536
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 00:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B28D284930
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 23:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8539821C18A;
	Tue, 12 Nov 2024 23:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xt+pz0SO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A04230997
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 23:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731454466; cv=none; b=lZKfhrc9CX5texKqoOJuVl6mv2va9eNdXaZcqiH716r8ZM/9phelje6KF6D5E/fifjAf1s/mWU3+OIXpbzeTiZdr6waZa6yJ8F19DP77e2XlWYfTwpYeMvzVgZfjjG6bBTsXpkMOrXEc+JqVbo9ngLTmWSvasf1Nzf32LoroSXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731454466; c=relaxed/simple;
	bh=V7YrvqMxBiDtu1yyjd5HTYFxNev9pFYFi/CbJHPn/GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twwGc31qNJ3K0H838+bq4sQwS1AjEe8QncLGzKlhYJ74NoOWPoC3FaD194AbZlbo5v1+07A8mj0lvPw5VPujeddnbQVn4Vd/BGbsq0hmnHsQdMp5XQtHsagYRCO3jnkrxWedyj81lLc/yexKZ55LQc5+mlHFQdOI8F6O1fJiooY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xt+pz0SO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4314b316495so52532355e9.2
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 15:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731454461; x=1732059261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jDK6Jpe2m/hfg4hQn4ofja0c9FU98DCMFpbVNI55NDw=;
        b=Xt+pz0SOjdIN95RcRiAVuhh3b0dx4jfeab0fNNmMVCLXCz8zguDUujXvHLBfbaLlNw
         yEZ+5dJp5isT327A3Az76TtVQ6eWFrfqi88eeltZcPpXpc4tJ6S49cGrNdhaRWp2bZcW
         oU3VycPUcBVJtXONPQ15X45LLHYnbFK/o2GPgdHnqNzFNK1b924wAV8gMxcLvqeaScDB
         DyjjgmPAu8RUl7aBE80V9OOyLRgHtq7Tt4TNjXATbaVlOJs7xtcuYvFDgwUskH/3nKmd
         l1FgDivKED0r5OERgl8OHW0TLSlD6rek1Rh/B1ZcLohcScfFGs0tGBnLhX14N8j401qo
         kRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731454461; x=1732059261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jDK6Jpe2m/hfg4hQn4ofja0c9FU98DCMFpbVNI55NDw=;
        b=CFqER7Oi68nB41e6lgCkCfISx4gUaJ7AiLyFf8dYlfz4dumI+F/BS4kEjfKj+67mN+
         zQm7GIEtyIgVW9IlSH/S1nmqgVk5JJY861UhWK0p/CsZ8V9eZp4cSYF1q8C50CFv1Hpp
         yDiYuHLE+VgB8cjyLp+lEb8ljXTQebAgldm2Djs77i4j+y3FJNdniS85W7PcSYF+bQos
         2RUOCklmCXHJAAHT4DKgFXQhkCwA5X5IjmkTiTRirmTChuRhbriI2LbukcUnQcRdzGMD
         85fCs2JupsBc+/f85OcEiaoojmR/9d/P/uI2OJx7JSpbHq+7FslonvfQq9WVquP7u/J0
         qb8w==
X-Gm-Message-State: AOJu0Yxh2sXW/kcQRH/sNPfDkvOkz2TyaTvStSf58gQjDwHJOqFeYoXx
	RmfyjGUaopad+8hqAnFNmyY8vBxNFMw7hhktbieycNCFyiw4zx+CfdKIt6pgh4k=
X-Google-Smtp-Source: AGHT+IFlTjuNrbTGIsR+0sG4thfT19ptCWMJEbd2b1payDR1CxHa6BLA6qbK+uLJjTdl7xL7zRnAjw==
X-Received: by 2002:a05:600c:5125:b0:430:52ec:1e41 with SMTP id 5b1f17b1804b1-432d4ab80d5mr8680315e9.17.1731454461350;
        Tue, 12 Nov 2024 15:34:21 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d550c14esm2955535e9.28.2024.11.12.15.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 15:34:20 -0800 (PST)
Message-ID: <1cefe6f0-5d08-41a4-b0c6-2291dd5781ca@linaro.org>
Date: Tue, 12 Nov 2024 23:34:18 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: qcom: camss: Restructure
 camss_link_entities
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, krzk+dt@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241112133846.2397017-1-quic_vikramsa@quicinc.com>
 <20241112133846.2397017-2-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241112133846.2397017-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2024 13:38, Vikram Sharma wrote:
> Refactor the camss_link_entities function by breaking it down into
> three distinct functions. Each function will handle the linking of
> a specific entity separately, enhancing readability.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c |   6 +-
>   drivers/media/platform/qcom/camss/camss.c     | 196 ++++++++++++------
>   drivers/media/platform/qcom/camss/camss.h     |   4 +
>   3 files changed, 138 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 83c5a36d071f..446604cc7ef6 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1794,9 +1794,9 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
>   				&video_out->vdev.entity, 0,
>   				MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
>   		if (ret < 0) {
> -			dev_err(dev, "Failed to link %s->%s entities: %d\n",
> -				sd->entity.name, video_out->vdev.entity.name,
> -				ret);
> +			camss_link_err(vfe->camss, sd->entity.name,
> +				       video_out->vdev.entity.name,
> +				       ret);

So you're doing the right thing reusing camss_link_err here however

1. The commit log no-longer matches
2. I generally suggest patches should be as granular as possible
3. That means if you want to use camss_link_err in camss-vfe.c
    and BTW I think that's, correct then

a) Refactor this to be two patches
b) First patch is about reducing the repitious string and introducing
    the reduction in camss.c and camss-vfe.c
c) The second patch is about restructiring link_entities in camss.c

Basically this patch now does two things and instead of havin those two 
things contained in the one patch, you should split those two things 
into two separate patches.

---
bod

