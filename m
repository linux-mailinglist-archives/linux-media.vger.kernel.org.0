Return-Path: <linux-media+bounces-28551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE40A6B47C
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 07:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59DE84831B6
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 06:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BED71EB5D0;
	Fri, 21 Mar 2025 06:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHD7Kq1t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF58C1E571A;
	Fri, 21 Mar 2025 06:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742538911; cv=none; b=h2GR5AfZXgKicJL7D2fr+0Mg5As3eY+YukVge2vi6Lz+A6bbYDoaLPkB3oDObq/FYIks74L0xOrsuaQPsvDLhPJruqigRU7lclTqxSJIzJDCWSGLFWwRuAHRpSrBKkhhtXT1h+u20etvGDwI1L0iTaheJIZN7HBRlwTZQCP7/fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742538911; c=relaxed/simple;
	bh=dQzBALqC5Ck2v6Lty2jY51d3uNVCdMbdVo0x35KjDuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c5j94+nnpkv2pUg6MzL/StaimJ6SAqIX6XnJ9k/l0DQaSg95KuIoZqjiIwIVespKdlJyRV/KAxXyqERtau+tb3qxZ2jRmbgRctOEjr5F0gRC8srPnoeeP4g2VOEtt9y+NrhuDW4RyvjFiOMaenZLYgioYQLmgmVDRWiTLUiRreg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHD7Kq1t; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30795988ebeso15480691fa.3;
        Thu, 20 Mar 2025 23:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742538908; x=1743143708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mABwJRF0qaiKxWbKLqj1MBFoPvsAgskTmp5VNWC/wR4=;
        b=jHD7Kq1tedL016w4QxhrhNja3gnWrKnvfxSF29LAL4ZFa0HRL+7P+1BHamU5+2cI8S
         FD1nVZefepYtvv1qeR8sLnRYECc4jj5Zn7ETrURcML6618Edt8vJrVGQ8pbEJsRbBIhU
         nFEvRi5RZnMwoBm4tLdC7NhverEMIJqmOMkS5HoVOgMm0helY4/jfrzaZZc3d3to6Tcc
         HxkMVsGaf6uv44QDNmmOY/CobcPykidSa97GKF5k1YtOSKof5CWp+BgVcuSis6tSW8fe
         awODX2z9jIYVRPJU51OLxuHaGkweTCvefQySE9fVetUZVQ1OQZzolHeZ1HZ4ePdjy6+h
         fM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742538908; x=1743143708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mABwJRF0qaiKxWbKLqj1MBFoPvsAgskTmp5VNWC/wR4=;
        b=Nx+u8CGW0yrouOtYJuPOyaeJVMf+LM8+O2VTe7SOsgxGlu0s0CwCdfhy+vMgm32Cgx
         18WpSJ3TcG1WQ1q0b+Th7knOTwS94SNXePBO1GagYXO5sTUL7yXPLXlZd1If1JTsEV6h
         ztSKy6H1+tDzYv8StXhchTTGcF+MKk4JyAQsYdsQCwJyLsyVc7pqqGp1f5x7nagIXgkx
         /N0PeCZn+tVjp577JAlQnY+RHL9nLH2Z9XuRy4cKN2eUHa93OyqvhPqyiIg+KKkkLo52
         4BqSukLeW7QntY0YVWNDL07ez5aIh0yh26Ib1Z61zYhi1NCwea7qNZfdQ8AmQl0reH2X
         x1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWa8oeuLbUXxCaOiTmb3hik7WOBFjAGz0b4xmA3vfXNFncmrmJSzpDs/fFX4jg/SCPEbbwaanMkEaZuU0g=@vger.kernel.org, AJvYcCWwJINtA7mS56Jb62wgnLJBq6dChAmwR6atwmt7jAmUjK/mALRrKcr2uRqibLsU28ZBQ9Meo/GsWvy46zc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1vemdCVt554QaAdKb5mpnDNU8lJ+eNRVMvHQxyW8dA/ewgoSr
	O7QYaE9kb2OxBuUM9W4o6cyjwRYwOQY+azhWjwMEKwuwGObOdPs1
X-Gm-Gg: ASbGncs3HszqMoTV7eCPEK6yrE8KOsF/6p8NPxwelPZUuHuwz1CtGKTfYhOSw8Xdkzq
	m3mBM31KaD8pCz+vQwKTNbxERcXw63y9D/C+KDAeqZRUlxDt950GFx/3DijNQyg7Y4C4ZJ5U72d
	EHojNxIa9C2t/nW3/XLNFbgmCfSxGyCk/AfnEwbPa5kuEJRkKyMU4b1llFv3zjIYTu8qPgNKnJ0
	SYH7y8at8XcHrbIKVxoL0qav3xiMM152HOPnANQrMFJLpTqWwzxc/BQ+3z21mVaNqJM8F6pjxZW
	NbtCpn/c5GNVmtwXsIY+wHxiZj68kt5orJ6znF3JNcC5MehjWQmr7hxSg0epxwJcRCMfC/xhb/r
	qd/hdciqv6aiUJAMw4hRu5Pw8Tw==
X-Google-Smtp-Source: AGHT+IEWrDcmg8oOaHL3GpUN9c65VEIxPZngtaBg7FF7PGHibcF+gg+MSldUTtVANBF0nfgIQ6nPlQ==
X-Received: by 2002:a2e:be8b:0:b0:30c:50ff:1a4e with SMTP id 38308e7fff4ca-30d7e24579emr9300741fa.18.1742538907590;
        Thu, 20 Mar 2025 23:35:07 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d914054sm1560791fa.108.2025.03.20.23.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 23:35:06 -0700 (PDT)
Message-ID: <ffa5ae6d-a925-41da-9826-4bb376ca0fbe@gmail.com>
Date: Fri, 21 Mar 2025 08:35:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: thp7312: Don't require node availability
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Z9vTV7tS2ZI3tM6m@mva-rohm>
 <20250320142635.GA14394@pendragon.ideasonboard.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250320142635.GA14394@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi dee Ho Laurent,

On 20/03/2025 16:26, Laurent Pinchart wrote:
> Hi Matti,
> 
> On Thu, Mar 20, 2025 at 10:35:35AM +0200, Matti Vaittinen wrote:
>> It appears that the concept of available firmware nodes is not really
>> applicable to the scenarios where a specific name is required from a
>> node.
>>
>> As explained[1] by Sakari:
>> "OF only enumerates available nodes via the fwnode API, software nodes
>> don't have the concept but on ACPI I guess you could have a difference
>> in nodes where you have device sub-nodes that aren't available. Still,
>> these ACPI device nodes don't have meaningful names in this context
>> (they're 4-character object names) so you wouldn't use them like this
>> anyway."
>>
>> Use the fwnode_for_each_child_node() instead of the
>> fwnode_for_each_available_child_node() In order to make it clearly
>> visible that the 'availability' of the nodes does not need to be
>> considered here.
> 
> Why not ? Node availability is a concept that exists in DT, and this
> driver has only been tested on DT-based systems.

I admit I need to study this then. I just took what Sakari said for 
granted, without taking any further look at this.

I mean following quote:
"OF only enumerates available nodes via the fwnode API".

I interpreted it as if, in the dt based systems, the nodes which aren't 
available, wouldn't be enumerated and available via the fwnode APIs. If 
this is not true, then we probably need to re-re-re-consider also the 
need for the fwnode_for_each_available_named_child_node().

> Why can't we keep the
> code as-is ?

If I am mistaken and the 'availability' has a meaning - then we can and 
should. If not, then this discussion should serve as a good example why 
the code should be changed ;)

I hope Sakari can share his view :)

Yours,
	-- Matti

