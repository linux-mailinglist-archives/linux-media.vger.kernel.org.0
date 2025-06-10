Return-Path: <linux-media+bounces-34472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9072CAD4249
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 20:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A92DA7A2F60
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 18:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7239B24DD14;
	Tue, 10 Jun 2025 18:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lNRxAH3Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0449624E4A8
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 18:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749581593; cv=none; b=EqqVUFzaPbJgFWMPksCEtAe8k8oGky4lGXTd0jzP7OOLmX6XJ+sK/5Cei6W6PTLyLc7YWdG6u8UhNnmszN51nWQk6Wf32xfxORv/cBEEyZWuzupgIYUiG2XrtdIekYRfwMiu2orcbkk/WN/cB4Ff1CgrTahwwr4azxEtKhSaRg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749581593; c=relaxed/simple;
	bh=bTAnFIxWZfvZUu1WkNJ1+cIFzEXbVV1YkuS7ekLhsJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIetklCfAWIrEIj5/TokXgRu2J180ygx5LnnOz/pScfHUIuhZ93GZamGOupIMVHSErTqd1O4jpr3wSb0ZsDUsVe8km6WekmbzSLKxyQpfqayTk/AvdzqkfyPBXHJwmoUHlNF/B1Pmov9Bnl2WXi9gtmKDd9oSQps1gzlEoqrZlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lNRxAH3Y; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d7b50815so50814085e9.2
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 11:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749581590; x=1750186390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=limngthPrrojQ4KJ65LcFySdaULZ71w81rid/pfz/0g=;
        b=lNRxAH3YutBNRQBr1IGPA+6VxEAr+9dQek0sm0rJQS35st/Iea99nwktDeQwKh+h0a
         8ewkzxubd29f71Xb/N1FWCAlHeX0IhGfKHcVYQt9063W9Ei71gCbHuvv/tPfABVBhWpC
         lPcKsbjsg9nZBStucqkIivj0lG0INEF4iNOGla1x2tuL/jDtXxtrGCWOsdL3QBZaXdK1
         Q4Yuu6cBpZVXPLSooemJ8ek3+rIrOJ7vaZIPZD9HpyDYS7yUyiwSmx6hbsYO1tHY/xzf
         GXb7KuHEaLpX57Z1457UR7K8qa2PyKIkNP1Y/pxc8XJxPGffUhFXgbRAxVIfhu5t47US
         aUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749581590; x=1750186390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=limngthPrrojQ4KJ65LcFySdaULZ71w81rid/pfz/0g=;
        b=tuSb434HGxy4lVdiKcES5hxl60N5TLfOeCbcQC810nVhlPv9HWzWhxfHyzXvyevwWM
         +rbZGcVOJbJqlbtJMkvXxSSopLMVBVYw7j2y0xOT8kGYolAKhC9ptDTURxWj4nB3GEqP
         J2ET0+6o+JzM5Md8x7yDb5XM2GIDiDoAo/jo3QR94ZRgSKte4yWCfOUrbAwWUdQgHcdQ
         KqkcOfwPX6Ly0AgoevCNu5dP4b+GRsIXXiqPQ3m9gZkwpMk3HmXt+g/2zXp7UR7/1Xsi
         3VDQ3T2s5umtSz1v+OMzJQN4ewytld5adnHNoWgEZnT9txGlXTVR3mLYMkRDzCQuv3tS
         9+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMz7m+mxwqWARabh1RCA4vFQh9wZyyq9FQf5JVsK93wjywa1LG+VkQefU4yiWR77ytV9/diK8ln5yjSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyghPY9xCLW0vaXwuehx8zBU4YzKRZE5Uu6gv2rJLap+GwoqD9j
	YJ4bHkqwracV+kGzos1xTwja0mHSMCKq32Mn6XC7RFnc0R9VAk6wF2qDXEgm0I7tlYw=
X-Gm-Gg: ASbGnctmeHbl1DhtFS58qFYUdYq3kTskTju1EJp6DXlLXjuFrrLow/I8wYoRbHRAjx4
	xV/rAqG/yDFB8whmN5a72aqupVSzS5Yub+P7u5DTf8Yi9X8MzKoLxuzeELB6W2rnDoxeID+WqMK
	7rTie905eJw2FZnBCJiMETm5mRaWCYzBCDaIapg0jQPZs7CK2uFRRCO4LQ4n1P6ym9DMKezW9Kf
	bEV4tBRTyVhcwP93R+b4PSCtUgzpKfMzyzirQ0gQVgju72LGf4fLwawjDhOt/mDqQcuRVjpqPAO
	YYdfyGu5ZL/NGLSgjCISztEq/WFo71MkrinDUqYPCa93d2Niml5RI9jGNvQO5WjlLxYELUT0TP8
	Ph7Kw47PW0ehB9Rn70EClCeThbOs=
X-Google-Smtp-Source: AGHT+IE53EfjobCw1+L2Lvsy4dC5WiBeht46Qa92GXpv6iuXucxwSOzWMWrssqASfQwPAZ73oiRu9A==
X-Received: by 2002:a05:600c:5022:b0:442:f482:c42d with SMTP id 5b1f17b1804b1-4532487e899mr2101255e9.9.1749581590269;
        Tue, 10 Jun 2025 11:53:10 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453247cbb1dsm2091305e9.13.2025.06.10.11.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 11:53:09 -0700 (PDT)
Message-ID: <bc139945-2fe7-46da-8929-2098d77e155a@linaro.org>
Date: Tue, 10 Jun 2025 19:53:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] media: qcom: camss: a number of cleanups and fixes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <b268a017-b42c-4b4c-859c-a7e8ea6cf8fa@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b268a017-b42c-4b4c-859c-a7e8ea6cf8fa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/06/2025 18:26, Vladimir Zapolskiy wrote:
> On 5/13/25 17:23, Vladimir Zapolskiy wrote:
>> The patchset prepares the ground for a CSIPHY rework in CAMSS ISP driver.
>>
>> For simplicity of continuing my reviews of CAMSS paches add myself as
>> a reviewer, as well it will simplify the work of syncing and avoiding
>> patch conflicts between work oin CAMSS done by others and myself.
>>
>> Vladimir Zapolskiy (9):
>>    media: qcom: camss: cleanup media device allocated resource on 
>> error path
>>    media: qcom: camss: remove duplicated csiphy_formats_sc7280 data
>>    media: qcom: camss: remove .link_entities
>>    media: qcom: camss: register camss media device before subdevices
>>    media: qcom: camss: unconditionally set async notifier of subdevices
>>    media: qcom: camss: simplify camss_subdev_notifier_complete() function
>>    media: qcom: camss: change internals of endpoint parsing to fwnode 
>> handling
>>    media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() 
>> function
>>    MAINTAINERS: add myself as a CAMSS patch reviewer
>>
>>   MAINTAINERS                                   |   1 +
>>   .../media/platform/qcom/camss/camss-csiphy.c  |   5 -
>>   .../media/platform/qcom/camss/camss-csiphy.h  |   1 -
>>   drivers/media/platform/qcom/camss/camss.c     | 182 +++++++-----------
>>   drivers/media/platform/qcom/camss/camss.h     |   1 -
>>   5 files changed, 71 insertions(+), 119 deletions(-)
>>
> 
> The changeset is left unreviewed for 4 weeks...
> 
> May I ask linux-media maintainers to take care of the patchset?..
> 
> -- 
> Best wishes,
> Vladimir

I haven't forgotten about your series, thanks for the ping.

---
bod

