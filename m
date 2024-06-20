Return-Path: <linux-media+bounces-13842-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 616F3910AD7
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 17:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DF5B283053
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 15:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFD71B0136;
	Thu, 20 Jun 2024 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Shgu/VWh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6613D1B0103
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 15:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899176; cv=none; b=jM/cm90i9AIpE+PZpGpAHPmJgSrNHhdYrV8b7xOCEDZ8UraSLmD1uQLw/RHDXxnAx5HwBpYCYuREmRZ5u1Hnmb737j4tmopw1vsNWspROZlUA9PYN4lhdYXauupjC1gC9AtuN0J8mIHzFuAYK5TXM4B7Rzj4yrRkURAm2rYYNog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899176; c=relaxed/simple;
	bh=WIa/bRL83R71AZiqE9lSdkl9nR/5CWtQ69gs3EUS4Z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnhCiOLX+x7fW5Gw5no3J+RrMcqcmzq98iL+lKXGXrWUO7prPjeyTPo/I7VwbHI994jP/dkoQjuqlw038UodSo5rlpEYTyQjVWgsu0nyZA72GsZhruVsEJmy51KhX6kGAOAlJUzLkPBsxvNghBcD/qPAuo09JhGdCXkgN3aH6QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Shgu/VWh; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3748ec0cae2so617485ab.3
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 08:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718899172; x=1719503972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0e0szqJIRrMNC/KT5pU/mdb5mtxgEC0IWwq1wwbrVks=;
        b=Shgu/VWhRWHgOBnvCkDWdzunyqr8z0dzshgPa3eUaLhqkTyNiu7i1cW/3O0SVPwspa
         RPwKDOtGQyIPGlp49PQPky0/Pk0WyYzKpp3P9u3AtKdsaSK0tDbkywS8saYOOr1HQIY0
         VPsgNnqb7p0lQOBwVbS8g/6qeZtqdZY2xsNh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718899172; x=1719503972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0e0szqJIRrMNC/KT5pU/mdb5mtxgEC0IWwq1wwbrVks=;
        b=hxX29epirc7TSVA7YwzlhgVGnzAIRYdO8tp5c6azc42Wq4QwdkQWdYYwvhNFY7m7yG
         sljHCQ7a9lwJVX8njWemoeiNUCg6HFpObh4N+y2UrD6pFOeQ9nMBSy3ANQdj37nIkA9Q
         7fV+P+7Ip2T3dU839CUU5BVOfu+dOKQshwM/lxKfq4Y5ZDeZ4tZolgsQcids5ICwGs9r
         TqRU8lBoTbKwYkspLMBwUT19QHiXocw0gRZSG8rToajzThYPnKSMN1tMeydGRh9FPGOB
         Ay57m4mnLk2xfdl0lHpqwZJ+XTS02yugcbph6VdwVOsOS+/pVk6b2yR+m5TqG0/2EY8L
         apnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFPC2qgl6r6+1lBnzhnukdmhjRT7IW/zGnGg9H1EThe4au7u7Uy4JZdQd6qx/neC3Yej9yNNoHL6Eu/fYj/9qBx23F/+GknLHr4jQ=
X-Gm-Message-State: AOJu0YybR80ZD5zsyQtZ1sk36vttixBz8ZBb8igTWj8nd/lEUX8arMCB
	dak6TDXScyxtfhJj4w62WefdyAr7YTzuR/ExcONfw+KQToSagWarRkGV4N4axnVced6YrXcwiDL
	C
X-Google-Smtp-Source: AGHT+IGdHzAZq2MtMhvtBjWgPl33yWzsA8nxG52Tlk0F+IfDNJ1iUKFE8D0uOC29f5RW7SKlMBG+ZQ==
X-Received: by 2002:a05:6e02:584:b0:375:dfbf:b543 with SMTP id e9e14a558f8ab-3761d6e5388mr52915935ab.2.1718899172464;
        Thu, 20 Jun 2024 08:59:32 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-375d866e530sm32343995ab.8.2024.06.20.08.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 08:59:31 -0700 (PDT)
Message-ID: <bb5eb601-a7b6-4c77-afd8-bfabcd8c15d4@linuxfoundation.org>
Date: Thu, 20 Jun 2024 09:59:31 -0600
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
 Shuah Khan <skhan@linuxfoundation.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
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
>    media: vimc: Constify vimc_ent_type structures
>    media: vimc: Constify the ent_config array
>    media: vimc: scaler: Rename vic_sca_pad enum to vimc_scaler_pad
>    media: vimc: Centralize subdev internal_ops initialization
>    media: vimc: Initialize subdev active state
>    media: vimc: sensor: Use subdev active state
>    media: vimc: debayer: Use subdev active state
>    media: vimc: scaler: Use subdev active state
> 

Thank you. Applied the series to

https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=vimc

I will send pull request to Mauro in a week.

thanks,
-- Shuah


