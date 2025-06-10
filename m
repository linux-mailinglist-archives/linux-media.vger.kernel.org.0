Return-Path: <linux-media+bounces-34470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FC1AD40CA
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 19:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 003D03A7EA4
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 17:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B5F2459C9;
	Tue, 10 Jun 2025 17:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzaB4sF9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD6E24634F
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 17:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576424; cv=none; b=UR+sE5QZaV3jmq24hlt/BfWfBkgpBVwN2mSmEAcjbIQW4YnV1NLjWfouATGyjCtB1vSWLUcxOKcd3I0sIwbSHtWydRlq0ixbGX+RT6spV3K6fBzmyo1U8YJ2sziIwPX9HDh9YRZQO3SZ85Nc66qMC0DJWgtVE8mNfawF0R6aoeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576424; c=relaxed/simple;
	bh=e/oOcbUFpgTOzRmXA6CcB30uzxELMK9/+jh+TW5P4aA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bpYTmuRIIrOmV+sA4nJyPMo2hhhCcyJ6tluDil2Jz3ltmHf5xUNnzKVhhmOXKegRzpDoDjq7aiwVmaFlf4Dxok+pnD2LVyAA9NvGWrnJpxBK59e9XLPJj86W7aY8lsvTrPOxegzQgy61ya71EbwofWm99utw2johs7IggIQnK6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LzaB4sF9; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32a80cc8c88so2614331fa.0
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 10:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749576421; x=1750181221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDWeNOmrP5y3qHNd9VDypMq2nedTQKGXWj49qp+NK0k=;
        b=LzaB4sF9haIM0LzicNZ/4ThZghaKYI0cF5NAs9wPmt9JcaBUtKv6OyWQOns+84K7GG
         +s1bSBE8KlG5Wm50C17O49dTdiFzFucLEdXKF9VRQ3PASw6Ovejggw+KsN3J06zQDw7i
         IghU5V/4vKffCpEphPC4BseUxC4kj9fzfyXAettpSoxQt8oSQakLWO9JCJUmtx61ihBY
         xt/k9ftdfkszdUu+mqIWsUHVhuiSh1AiCV5U5vGCKmZg6y+me7IXZIfeE7hLSWUQ/gZi
         ASHjLecWzFLA9TL8U5vA5RIoKQuIpCfLTLbNGSjXuDfst0+4mQskIl2fU9dTIO/98qf+
         uOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749576421; x=1750181221;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDWeNOmrP5y3qHNd9VDypMq2nedTQKGXWj49qp+NK0k=;
        b=XzwK2lLZCV8NseZHCKGcZ+c97WQSzXCB4LFHVqvBf+IXkQEODD8+Ik/dwJrQsyqVG9
         DDNv0aXKypR1zeB0yxlOYYRsnDVMw394yvloHbjxSKpPqbuPFRxD1jyisVDroPAWUdOC
         PywsGqF70CkDLDZnzx2W9G+4yBiv0XFWkMu8HfUL5e1CRDxdVwnVPBHLT3Clbf3EiIHL
         mwU8Q/W4QQEllgJPhzwwMF11zApOp4f1CKdM6boNvqLmoee/7hEaN2bGCHXkgs3wje7I
         r6xmc+3w09noMf2s32ITKuuOzCqUXd+pl3/91F2ilhlRN4ed5P0awQny+mb9geywv7h/
         0EQw==
X-Forwarded-Encrypted: i=1; AJvYcCV698tOAuYfw5atOOo/mlxI3pUyBMmS6Mf+lEoR8VegDiFAe2UMI2GPBrtvX/mwVHaqHZ4SmCDu79KFZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhSl+ROTujlkTkI8YQYLvt9v3KUqcZVxBZAn69TQ0b1jz/6iXw
	UcG3oGnTYIzZnbFi1sXcB76n6qtwuimV19rbAPPV49z6XD9XpaRV+c0d3roHoNbwAUU=
X-Gm-Gg: ASbGnctZBBMY2ApKWHhXGHpLQPRgJe3Gs1D07PrKcj/2JtXws0g31z+RZAO4X1OKeJV
	qtR4B/F3X0ca+EkMiB67NViqOmSd3+vmvh7L3iRdXrSGjxI2ec/Jt1bsThi6qKNdWtP2mB4z0sI
	UcL0YuV89u1A7q+o/UiKcJ3OPXlwglZvnVGIamHR+NNnyRh1XU2M/VK5n5PXHk8R32q5tOssaDu
	T/HY9ooVH9/+stdQPYJz57dCSTWAKWwfNRe+2ekssc3VcsZbJqLzzUioXcgjj3PRYnFeTBtBrE2
	jwO/IgrcCsyd+FRv6q0RHUMkLLHxZgmev9r/fKQg18tAJx3NMQN2lmNEhJERRj/RaC7UXuqV4xu
	nEaj5sdF2loD9qD2tV6pX+dk2OjBjXn0LV23M2EVl
X-Google-Smtp-Source: AGHT+IFWQCdk5MFKzpyZcmaS0S71xmsUSR6RTjpWEE/zEXq46zpQ6nAKr24sBfjyOfgS8C9kLowDEg==
X-Received: by 2002:a2e:bc22:0:b0:32a:739d:f78 with SMTP id 38308e7fff4ca-32ae335a47bmr15627331fa.11.1749576420634;
        Tue, 10 Jun 2025 10:27:00 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1cad5c8sm15446441fa.72.2025.06.10.10.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 10:27:00 -0700 (PDT)
Message-ID: <b268a017-b42c-4b4c-859c-a7e8ea6cf8fa@linaro.org>
Date: Tue, 10 Jun 2025 20:26:59 +0300
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
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

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

The changeset is left unreviewed for 4 weeks...

May I ask linux-media maintainers to take care of the patchset?..

--
Best wishes,
Vladimir

