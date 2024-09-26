Return-Path: <linux-media+bounces-18664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69507987BCF
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 01:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99B441C20BE5
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 23:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F3A1B012B;
	Thu, 26 Sep 2024 23:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JH06Lkvm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D6615A87A
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 23:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727393503; cv=none; b=nDehfJocR7UWTeXCtvnLWDolAFWYz70jHja1xvfBZG7aj2GzR91vacSm/NAT9Ze//6QL2XeiI5Ns3xjVOsZe/5cWlExxnJ/dkdfTQza4gDnDdR4G5efuGeKAdM3SayzU+tQG0IlqICULH0TT/Rrw/ygK7tK1/c1jUrbo+J7HfL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727393503; c=relaxed/simple;
	bh=Bp8HPf7stQdrTDsUCg5klmtzyhttsI7grk8NeOenYZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QydZPhV1c9jQFXsJTX6Islh3wgmKY5n5DTgdg17JfZRbsztBvVehpgO3HH+ttKDzNH1nc9VtuIiaXzbI8SBWCh+/o3+Cg8gLtboGleJ70M4s+VPwZBg9Og+XWDLnyBqHgVxsHR7T1CTvt1fWrp6XKYOOCvvIAit2yRThF5IXAlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JH06Lkvm; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8d29b7edc2so189689866b.1
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 16:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727393501; x=1727998301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hP7/C2ERKTWKRLlTVueOIVkd3A9IVhWvPRqsiJv9ebQ=;
        b=JH06Lkvmr7dcbPy1VG08QIBISc+Sel9nI4Ji1eyR8OQDkFhuxTeBERHIVfh5JJo7yi
         IvPRlaOOmK+KwPWyUgyHx4bayRzl8fguneYI9rbvB0VWDc/2BnxbGmI7bqsb4UFBiqhf
         tEa0kj3SnlPd3hAgAeTwwfL3mbz2Fc84XReUrixfhJbERRM7M7HQPWUYQ5TswksvnPIV
         spVwgebAh9jvlSvrucOhgGFNua/QuqN00kkc9pFMLRSpAdVrS4I8NZRBeoLw1bs58H+e
         lnktICXl/ShUoy6LTrRelUwOjlrCcAgbJYpiSLafEIwDLzjVh5xhVdmo9kdcKxlOhNLz
         Wing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727393501; x=1727998301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hP7/C2ERKTWKRLlTVueOIVkd3A9IVhWvPRqsiJv9ebQ=;
        b=T9+UfFTIYSyJIMt+4HvVatMD4CYs6gZAxxJEoZdr0l0NXMxRTThuTD7dWAJuq5BQ9F
         p54YqDpUnKQO+tXypJblk7asuft6mpQlg50J/XTcJd6BclhCOYOeVblrvX4nVwraIyF5
         bHG0nl7/BnLAHdMhUp/C3spQcNs9YLe960ccnoqhGZR/510A9tviVyHqR1Bd/mETw0h5
         9xGMbsIAOX4GoQx3I4y1l96gzXQKGdibjuSuNUChITBEIhTeGQ8J9Xx8lSXZTUjEqfZA
         WU0/vmSHUrTmhITCJQl+juo0UJppLrPBGQ1C2ic77yHI4EB00qNLxiIXC2qoyJuxcwDj
         +ENA==
X-Forwarded-Encrypted: i=1; AJvYcCVVnsktHKUOCRvNTjtMmKvSFgP8KgG6iUxHaof9DZObZ4c86YhfB8azT4dPMjMJFReutG5GhfywtbKH8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyohlWnMQAfPH0tLQ84+TIO3mDbeLOgc4n0qnIQFn6suFqskoJT
	IkQOHIbl4j+LNpdY+8vwYj4fNE4AvfD0jH78zoMdtK9lQ6tFStM+KTx0J3VXiuM=
X-Google-Smtp-Source: AGHT+IE4AVD5jFUsWhQY+2HFi2yt7VOe7tQYNHSxknZoiuanOX2bzSzKA56+0M4bkU4Sm5lwRzL3zg==
X-Received: by 2002:a17:907:9305:b0:a86:8d9d:898a with SMTP id a640c23a62f3a-a93c4c282bbmr98056766b.58.1727393500403;
        Thu, 26 Sep 2024 16:31:40 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c5ae5sm51114266b.63.2024.09.26.16.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 16:31:40 -0700 (PDT)
Message-ID: <76a6b4d1-5376-44be-87de-011154d67771@linaro.org>
Date: Fri, 27 Sep 2024 00:31:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] media: qcom: camss: manage supply regulators as
 CSIPHY resources
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240926211957.4108692-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240926211957.4108692-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2024 22:19, Vladimir Zapolskiy wrote:
> The change is based on a recent discussion of a changeset, which adds
> CAMSS support of Qualcomm SM8550 platform:
> 
>    https://lore.kernel.org/all/6d78c1de-00bf-4aea-b0c6-a147faa40a8f@linaro.org/
> 
> Regulators shall be managed as CSIPHY resources, while apparently CSID
> subdevices can be run with external regulators kept disabled.
> 
> Performed regression testing on RB5 successfully, however it might be
> important to state that on RB5 board L5A and L9A supplies are always on.
> 
> Vladimir Zapolskiy (2):
>    media: qcom: camss: add management of supply regulators to CSIPHY
>    media: qcom: camss: move sm8250 regulators from CSID to CSIPHY subdevice
> 
>   .../media/platform/qcom/camss/camss-csiphy.c  | 35 ++++++++++++++++++-
>   .../media/platform/qcom/camss/camss-csiphy.h  |  2 ++
>   drivers/media/platform/qcom/camss/camss.c     | 20 +++++------
>   3 files changed, 46 insertions(+), 11 deletions(-)
> 

This looks pretty good to me. I'll give it a test tomorrow and let you 
know how it goes.

---
bod

