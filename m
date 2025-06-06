Return-Path: <linux-media+bounces-34223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F4FAD00CD
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A676E189D33F
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 10:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D972853E5;
	Fri,  6 Jun 2025 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QSK2lApD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7095028689C
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207130; cv=none; b=SFU8HywPUD4+wmm6odo9m0SyzjzknkMB2oh5aiZgj5CCvCZe2muLkmv+5YABuIRu2sz6lPMvGBzMwClVSexqSA7GfVUOHmObok/bRnHNoxEHRQmMQXe/xLhavvB0xt4jh53kEIaiUT5+aSdoK9LHeW4C89SEDg55qipSi1soyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207130; c=relaxed/simple;
	bh=dCV89BzZq6Q6ZmLswE/QDhu0SpE6z0dhIXVsXThcLaA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FYRy2N2JTXEUFTr85fKwludnm5MJQZG/FP3FBZG71Ry32GYsYOpR+BEs4tvvBrkq7hNXUrOGhqo16+pRSpn2ty1NWeFe88nCqF6ZgsPDu8gybyDgBkSwmVI7CBrMoWtcIgpf7ry+M9LTaNFVp1ujawtNC3NmZzHEZCqlDAl9znc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QSK2lApD; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b0da81302so285613e87.3
        for <linux-media@vger.kernel.org>; Fri, 06 Jun 2025 03:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749207126; x=1749811926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CDQlZ14CIljDyLnJNEF0jBU1r5V6b2tN4fhdULFPL+A=;
        b=QSK2lApDJ/tfw/5SnIC+RW0Itd/vqOFfayy9C46/98NvzOjmlPJq4+busf5zPdu6vf
         qCNJV96AXxNza1nNSHhR1LNKJBMpGYXt1kVzN1OeSQUWTpqE7cGd/Y8NxoTTC7+C/eHr
         oFPWVqJPcQPBgO266vI8V6Nc8jKWIn2KhG+gmTFU0AZw+Up7OvBB/FDtIgdKi97HBFDB
         dvK54OVrJF6N4vawxBEJ8s+1mH0S1z+n93UlelxpjktC7ewgWuEERNU4Qvns5SXQ1KoC
         JjgeLvB6UAdeIJVQlq4gjGupMEPBz849EswXUNIhRwK9hKsjIWM7gDCuSc1NIfe9hBRR
         bfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749207126; x=1749811926;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDQlZ14CIljDyLnJNEF0jBU1r5V6b2tN4fhdULFPL+A=;
        b=t+Xj7O0Or1ZWZw9IgxZ8pPTe37VfTz9GkQxuWpV9juFj00Mjs5NMic5Kkgo4MwKJ2h
         jonRr864TgBV4mjNBbpP8wJ+9Zq/AVwtrzXdhTicc5XX21a9G2xhKx1AhVtCh8kCPlNh
         cft6VzSPErXX6KztCpRVKnum/qg5kF4aCG9DkzR5+ZRwmAu/rX9ebh5YxUEVeVja3bcx
         dMvHiyeF9dfR0T2jEJ42TLyb3pghdQzyaEw6Son+9iWzlOA8UKYGcKrVjBEJ20WUhNL0
         j6kb+tJ5ygpAeBQrpf6Ow71GqU5vj9tQ+jIOdQXQKObXPRuPgk/4DLbL8TP/XrEzsjna
         UkXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgAlw/NP4XDcoI4HYC5sWxXvbkTFIX2Kzl1xiVnFvQcWSdwT7kAb2ZSp23hbHEz5spXl0MM1Q/okYD1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSA8WgDkqx0p26C1HRZunn7oNFER+ZWHWJpK9DQvZi+9h4k5jK
	ePAhqW1eXS6lx4eW4TONNWPyeORw5pA5rvOZW804Hd0Ceju1fpNIkk1G9qnkZFuD1tI=
X-Gm-Gg: ASbGnctxCaYVxrczxssVBsJQZlHHp1XtszVMJ/AVC77wwaaxL1alqICV7CgRlX3IV9v
	YuP5B4ziAL4LCO3KRtZU9G/eqNt5XHPwIm5JvGjapFs4w3H8KVScQ5z03ARRKBgZ7z7UIzNAUqO
	zc+u09xKoLXBc3eN0GuOLjG6FtZK3kJHWOhfN42PcwpI4bwerwkRn/vpIjFPFeP9+cu0i/N5uDS
	FtiC2mUtfHqjRjc0KWOInzp/fMEqNYwoQE0mIfJFiETyTtwB/B30r6dPAfhov/ibewCkJwJt4pC
	fB7CkooNtV0bL6SLkM4cumHkHZ4fjXzOZmlIdphFUJ8lqxE/FkxHEhANP9qDodCdiaKxZWpivLM
	zypkq4SOADU52JsIXryAq8aphRNhs4H4C3LhMxWG3
X-Google-Smtp-Source: AGHT+IGxLt9Z+N/1x0tncIX7jlR/e9bVGJ2gA9tLXg0h7whncbamIa81lMzDHp3MQY/PXi3EBWG4Cg==
X-Received: by 2002:a05:6512:3da2:b0:553:35f5:7aa5 with SMTP id 2adb3069b0e04-55368797208mr189213e87.9.1749207125759;
        Fri, 06 Jun 2025 03:52:05 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722237sm146841e87.113.2025.06.06.03.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 03:52:05 -0700 (PDT)
Message-ID: <69eac7dc-16e0-4dec-8e41-4d99d8bffff4@linaro.org>
Date: Fri, 6 Jun 2025 13:52:04 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] media: qcom: camss: a number of cleanups and fixes
Content-Language: ru-RU
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hans.verkuil@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Bryan, Robert, Todor.

On 5/13/25 17:23, Vladimir Zapolskiy wrote:
> The patchset prepares the ground for a CSIPHY rework in CAMSS ISP driver.
> 
> For simplicity of continuing my reviews of CAMSS paches add myself as
> a reviewer, as well it will simplify the work of syncing and avoiding
> patch conflicts between work oin CAMSS done by others and myself.
> 
> Vladimir Zapolskiy (9):
>    media: qcom: camss: cleanup media device allocated resource on error path
>    media: qcom: camss: remove duplicated csiphy_formats_sc7280 data
>    media: qcom: camss: remove .link_entities
>    media: qcom: camss: register camss media device before subdevices
>    media: qcom: camss: unconditionally set async notifier of subdevices
>    media: qcom: camss: simplify camss_subdev_notifier_complete() function
>    media: qcom: camss: change internals of endpoint parsing to fwnode handling
>    media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function
>    MAINTAINERS: add myself as a CAMSS patch reviewer
> 
>   MAINTAINERS                                   |   1 +
>   .../media/platform/qcom/camss/camss-csiphy.c  |   5 -
>   .../media/platform/qcom/camss/camss-csiphy.h  |   1 -
>   drivers/media/platform/qcom/camss/camss.c     | 182 +++++++-----------
>   drivers/media/platform/qcom/camss/camss.h     |   1 -
>   5 files changed, 71 insertions(+), 119 deletions(-)
> 

Let me kindly remind about this unreviewed patchset, the support of new
platforms like MSM8939 in CAMSS comes later and now with merge conflicts.

--
Best wishes,
Vladimir

