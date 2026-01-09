Return-Path: <linux-media+bounces-50257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1B2D06966
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 01:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2E61300E8CC
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 00:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CDDD515;
	Fri,  9 Jan 2026 00:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zi5yp1Ak"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27FF11CA0
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 00:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767917035; cv=none; b=Zv5CeHwp3rPyz8yb9dScMpSU+c3Qv6OsHFFGy/9LMEDfRdqeMSXtzUsfAGUIJHhYELBJg04ukHnjhAOaFRfiJgdGhyLq1k08aeQe7fbfM/Rj1OouJGRoojVI9ADlyFgu8L0pXt+9F3pbXeWYkSF1Lhv4M1V5QNyJ8bJKm0b5WZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767917035; c=relaxed/simple;
	bh=v+9ee2Aa4r3g9HfDKthd6QFz7+h1HZRTWQXetJ5JnUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nd4uwjyH5PzfHy9AQzsx5x7koOSg0GyQCLjthYf0+BeOg1yOEoxLV+4edr29TxVknnY74MZyemEqHmNnLirw1gL8NFeJMAk0vXgTXV0sb8DrorVvh4mbnDJS3CBe2D0X+SXrwbG/ZLb+ydYiynSxbgn95ZGtbER3YJ/Qqw4/tAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Zi5yp1Ak; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7ce614de827so523465a34.1
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 16:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767917032; x=1768521832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qTHH3F2aPJMirJc88nZSw2IdPsNNpolNwsQT8W41faE=;
        b=Zi5yp1AkUEg5uk3w7tRAWT2mz27u2cOLeLmeTSNe29T0k8NcLl6xQ9n4Cp0qExRRUL
         XXaMqmE6sxAaiVNfJYH9nV6aI0He1Ux8hw2aj+D7wqRvWIJKPpM3jXACTucr9/BkCdhJ
         1SoNt+1El35krVT0NdNqaliGiv41noFaYNFCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767917032; x=1768521832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTHH3F2aPJMirJc88nZSw2IdPsNNpolNwsQT8W41faE=;
        b=UmnOcuZ26DDttLazpz6mA5zSguKkjkyUxX7KG2ep9H2CehakN4Kf9Urg/AvvbmPqgq
         9q/hI/kimtb0vzNHFF6MhAYYJZnIDvpxHmBbqrBmepm2bFIji1oyhsnESUUqOjwibhnb
         dq7lPZc7jrrXQiG0HhpNKNneR57jxElWKQtIAYsMlGEic4mI1m2tWOeBX4s2WnwFZZaH
         hsE5tp3GvXvzOC8Plc2damAzLZKDOIyr6OwAqZbHA5UVlPkca4+uOO9nw2ZjzICDKn5X
         HJC6cvI39zX/65KTPpyLhcggKjld7ujkZKUv1wvjq4UWKfkjdrgv67k3yqH3XzuEKwsu
         19IQ==
X-Gm-Message-State: AOJu0YwM4UbhRO9Rn1BstUtAxT7zm3IRzwS8Qo5Jso8S2PQNk+3P4H7J
	Q1QxVkoSOZ2CHydTsCCN1FKTTNgvrYNm9i9Fj7C0KLOTZVYHGAGqWRNP1rfR/F1vcPo9XcnJq9k
	uOhiF
X-Gm-Gg: AY/fxX6hSxf1onPnEREDn1lnGuh3cRXfn6oBcLtev3WZ7554n+vhOaeuitPcNcO6cLS
	B5aP2UeAbtd55gzK/DfkzYCNrhDf/whIhQPekFU/Emi5seePP3U4yCLBQfqvWf0OSVxUgrN1QRx
	5Zj9C1qPdattCZml1WFyHfhAPUE9u7Ky4ORZ1M/rZcTY/z9SsOUpa3SOITuBh3FAtN7TSibC1AF
	SM4r8baSadanrS+XKKTyHjIEAjwFYV89uqNpoH7v8k8ym03VJORAV/BAOIM+ITd6zECELA6yJn/
	YczqdlMx95UxcN8+Sn3lJt+1sFLCEu9uNjnb9CLdM7omiONW+D0v5CS7S1Gvr1BpsmvEvuzS4H9
	0elYTycD3fOSuXBRpQe4jyx/wtZ+XzLDrPqUKJRgxktmnxxDdNRGVvkF57RYmUNrcYs1u8oCTfl
	TwKcaC9TOBPnj7+QV4YR5zdGw=
X-Google-Smtp-Source: AGHT+IE8cqDmZjGbSLV6LCBvmeV/5XsKvjJZtlV2J/E3imfQR5JQjlUJbtfs36UelNJlUzod7xV04A==
X-Received: by 2002:a05:6830:2709:b0:7cb:1287:e3d4 with SMTP id 46e09a7af769-7ce50a88c52mr4168739a34.36.1767917032489;
        Thu, 08 Jan 2026 16:03:52 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce4781c286sm6680757a34.8.2026.01.08.16.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 16:03:51 -0800 (PST)
Message-ID: <97f56d44-8452-4d0c-9022-a67935c2b9fb@linuxfoundation.org>
Date: Thu, 8 Jan 2026 17:03:50 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT,PULL] Linux Media vimc update for 6.20-rc1
To: linux-media@vger.kernel.org
Cc: linuxtv-commits@linuxtv.org, Shuah Khan <skhan@linuxfoundation.org>
References: <5e808887-c849-4ccd-8fbf-77d12e3d8730@linuxfoundation.org>
 <696040cd.050a0220.1fd978.b2a7@mx.google.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <696040cd.050a0220.1fd978.b2a7@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/26 16:42, Patchwork Integration wrote:
> Dear Shuah Khan:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test virtme32:test-virtme
> Final Summary: 1412, Succeeded: 1384, Failed: 28, Warnings: 0
> Errors Found!
> 
> # Test virtme64:test-virtme
> Final Summary: 1388, Succeeded: 1360, Failed: 28, Warnings: 0
> Errors Found!
> 
> # Test media-patchstyle:./0001-Linux-Media-vimc-update-for-6.20-rc1.patch media style
> ERROR: ./0001-Linux-Media-vimc-update-for-6.20-rc1.patch: Missing author Shuah Khan <skhan@linuxfoundation.org> Signed-off-by
> WARNING: Missing commit description - Add an appropriate one
> 
> total: 0 errors, 1 warnings, 500 lines checked
> 
> ERROR: Fails one or more mandatory checkpatch tests
> ERROR: 9ea34411540210db961bca65857fa0c27278276b: Missing 'media:' prefix in Subject

One of the patches is documentation patch -is that warning here?

docs: media: vimc: document RGB/YUV input entity

     

> 
> # Test checkpatch:./0001-Linux-Media-vimc-update-for-6.20-rc1.patch checkpatch
> WARNING: Missing commit description - Add an appropriate one

The tag has the description - this is routine pull request.
Is there something different that needs to be done for media
pull requests?

thanks,
-- Shuah

