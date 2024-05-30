Return-Path: <linux-media+bounces-12280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BC68D525F
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 21:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12B241C23860
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 19:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E922A158874;
	Thu, 30 May 2024 19:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZOPQUqdR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB1D158860
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 19:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717097680; cv=none; b=rjM1JLoLU6RsD9HOaqlbsZo4TDs9s5S7+PFFkY3eliD9idKk6AGZe7e9fSSuOXCA6WqQMZPMctUmwPv0VXNOMUMiEnHVYTnvN5j0wn80OuJq0wcdkSaFvkWIjMQfoFpGXBzBwd8rTSZPgA92RvmA3gyDIHVglcxre/AWKE/KKZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717097680; c=relaxed/simple;
	bh=FEBvFlgwHLR1+51aCFRhi4+V3z2/ZWs6kFr4TMA2714=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPSMWVzayLvxvt0WXTy8unN4B/TQfp45eUfDSwq5USyRqiOyZJnGF0lOG5/uQEnkIvrA2mxHUrnsVWPe23IpyF/qWi96NUGRZXhspIteojlpORWerO3H3SDBidUtufcPXnulcQl8lsgaLZE0YtnrmXKvjk24zSiwbzh4V6ifIoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZOPQUqdR; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7eaf9e5681aso5202839f.2
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 12:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717097678; x=1717702478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQG0MEYAgUFV52dM8+z1iD0VLQNWf6C1hiOw2RdBIaA=;
        b=ZOPQUqdR6miU8vfRCXMrz5pwkpy8x2sgeCPbVuSMosp/j+OMRqt5bwG+TbDpY2aFoY
         5yKQtVShiTQjsG9wOmhzK7TKJZ8t0kygFOB0oZX8tvo90u3ppE3FbSvGNCxpt9vGaq5x
         E2pgiEGzJr6h4plALTS8T1ly+ORqGf13YFzZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717097678; x=1717702478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DQG0MEYAgUFV52dM8+z1iD0VLQNWf6C1hiOw2RdBIaA=;
        b=ra3Smpa+DLj0HXLh0MwK3hYO2KyyHS2RSKlKbtkOYP1pUTzoVjVNXXbmY/DhANXS/w
         7JLTtUwBStxKAWP22LoiaV3OQlsxSBijgCPCxT/p2fgr9aCPRXSJ9yJEX3E0c+ufJ5gz
         14vW1wnKQOkUX9jU+7ekLQe2U87XpAdYvxfoTZ7i0AVUXmKWtUo0grc2SK6MQ7RdF5Je
         hm2j3xMd8auSYQZFlxUl6sf9I2bhn9mxGFDwWE8o6d2YsuiPtTvk+kL/21Mr1C29frFG
         WSpDshwHtE4ZC5F1TVfK6e1lFzXjZDoyq3MwAqQ2lBQI+QEvWwZMw+VE517ImdYt3afz
         fe9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWN+u5wcuwlsNITcOStvIhGoE5YEc9YWFBlRpXTvuOeXuatE6pY7jvgWJWPtOUUBtr7ayAFAngHCc1gKsJmMd1KxfmqrWRr1OTMpCU=
X-Gm-Message-State: AOJu0YyAEHhWbqIw1/E9Cro+AbRqOG0oosZgGvhazfCU8CsFzO2nkXlC
	Z3kOkLaxw/Q/CUEaqA+nNMidX5ZOwotiq5TTC9yW/XEa0bP2MIkRWQj3FCe2gBo=
X-Google-Smtp-Source: AGHT+IHivAW3rMyP2odpqJZyGgoxT5Tqxh4XRR5GLXzCwsbgz877Vxi6f0Zyi37Rk05OwbkR5CvotA==
X-Received: by 2002:a5d:948d:0:b0:7de:dc52:18b6 with SMTP id ca18e2360f4ac-7eaf5d8e437mr284462139f.2.1717097677694;
        Thu, 30 May 2024 12:34:37 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b4881d5bf4sm79334173.42.2024.05.30.12.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 12:34:37 -0700 (PDT)
Message-ID: <6230cde9-bd77-48e6-9eaf-92be412862cb@linuxfoundation.org>
Date: Thu, 30 May 2024 13:34:36 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/9] media: vimc improvements
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 17:57, Laurent Pinchart wrote:
> Hello,
> 
> This patch series cleans up and improves the vimc driver, with the end
> goal of converting it to the V4L2 subdev active state API. The goal of
> this exercise is to make the API used by a virtual test driver, to
> increase test coverage.
> 
> The series starts with 4 random cleanups, to avoid unnecessary
> iterations (1/9), constify structures (2/9 and 3/9) and rename a
> weirdly-named enum (4/9). Patch 5/9 then centralizes the subdev
> internal_ops initialization to prepare for the switch to the active
> state API. The remaining patches (6/9 to 9/9) convert the vimc entities
> to the new API one by one.
> 
> The result has been tested using the libcamera unit tests, which make
> extensive use of the vimc driver, as well as with v4l2-compliance. The
> latter reports 4 errors, but they occur already with the latest stage
> master branch.
> 
> Laurent Pinchart (9):
>    media: vimc: Don't iterate over single pad
Please drop the first patch.

>    media: vimc: Constify vimc_ent_type structures
>    media: vimc: Constify the ent_config array
>    media: vimc: scaler: Rename vic_sca_pad enum to vimc_scaler_pad
>    media: vimc: Centralize subdev internal_ops initialization
>    media: vimc: Initialize subdev active state
>    media: vimc: sensor: Use subdev active state
>    media: vimc: debayer: Use subdev active state
>    media: vimc: scaler: Use subdev active state
> 
>   .../media/test-drivers/vimc/vimc-capture.c    |   2 +-
>   drivers/media/test-drivers/vimc/vimc-common.c |  25 ++-
>   drivers/media/test-drivers/vimc/vimc-common.h |  14 +-
>   drivers/media/test-drivers/vimc/vimc-core.c   |   2 +-
>   .../media/test-drivers/vimc/vimc-debayer.c    | 197 ++++++++----------
>   drivers/media/test-drivers/vimc/vimc-lens.c   |   5 +-
>   drivers/media/test-drivers/vimc/vimc-scaler.c | 134 +++++-------
>   drivers/media/test-drivers/vimc/vimc-sensor.c | 125 +++++------
>   8 files changed, 236 insertions(+), 268 deletions(-)
> 
> 
> base-commit: e42a204f0519a2540f1507ac2798be2aeaa76bee

Others look good to me. I can apply them all for 6.11-rc1.
Please send v2 without the first patch if others depend
on it.

thanks,
-- Shuah


