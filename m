Return-Path: <linux-media+bounces-17000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BC0962441
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 12:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 790D71C209D6
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 10:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8079B16848F;
	Wed, 28 Aug 2024 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b="cSjo8wbN"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4B81553BC;
	Wed, 28 Aug 2024 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724839363; cv=pass; b=e0PmFEifY9zfjL+Wz4SPvqpIpG3LYGOgbMpQ/y/MzJ0QAXtFycHRv3Hr7lcLFXXd+jSNG3C+eXGCOROpivH881/1rHaLP2oElKB9qEKRBsyZx1A5nrgQLLyLn1GOOE5LRrJFqLfUjNaSTqL2HAsj8OfTjcTJHss8/dSUCT63VxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724839363; c=relaxed/simple;
	bh=cVhdnGh1gtNtWJrnF9ZbO5IS+WmF+xa16YhB9Qx5chE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ckWqEuZ71aWnh4HDjhEPuHmOSR9G37je3JtqGXkkIMX3HhDldYyyrCKU/qGPCNuPNHDqJ8cumzR4o1dHW1ftkBDjdXY9jQvRqqj4qlxQaT1YpGtKT3/27/JmKCYA5ML/8Hk25bsUFhkSYWmoxMPF/61UZs0xfKR92a/PMUJ03Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b=cSjo8wbN; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724839350; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P9ItgZk4OFmZ3oZujLJajth3nyKBxbqHHC7XSxBB/YDUGnVX1kxeJYvObWVpPwFOl7HxitnIIkdVE+1oWZu6e2WY2XPr7u68vpBCqzVfRPj30FziypcdVsNxNojoSQtNQMxmw2TkZ/6BIz0xiD97DZ2Ge90KVbc/M8ZD9h0myRU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724839350; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZLM7oCag8bEqv46GHSaKZQveF6nYFv5zvA0CwiARDdg=; 
	b=OMkxr3BYhuhmPXPMZ2GR8bgkjSU4bPZ/ZbqUVOMrwxD6LqIt5wekHRG05wEQJX5Q5PRel7pIe57K1RpZaE3jsjFUouqwPfdvujDriK4u0UFggRvVlIRwvVXFyFBfga/utegYOCdIHjcVyN6G3lhD0w1Wb3aPrmVRT6xQQXXIuaQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=julien.massot@collabora.com;
	dmarc=pass header.from=<julien.massot@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724839350;
	s=zohomail; d=collabora.com; i=julien.massot@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZLM7oCag8bEqv46GHSaKZQveF6nYFv5zvA0CwiARDdg=;
	b=cSjo8wbNH9XtnKMCb0bvgScrc5QDlcDTq3YTb3q7YMKaSVNpruDNaCusCG/xxjRg
	PQN4466OjR/6rysuinfmNwDJEEswNbWHaaxEBaMOdTbMU6AtgeFMwD0jCSPeFFoB8oI
	G2X4mazr3FQ6+LpepwETeezxK/gpO6q77uSJ7AB0=
Received: by mx.zohomail.com with SMTPS id 1724839349104444.9895094581451;
	Wed, 28 Aug 2024 03:02:29 -0700 (PDT)
Message-ID: <dd566af6-9632-4768-b945-ec25db93814b@collabora.com>
Date: Wed, 28 Aug 2024 12:02:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: staging: max96712: Add support for MAX96724
To: Tommaso Merciai <tomm.merciai@gmail.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-renesas-soc@vger.kernel.org
References: <20240827131841.629920-1-niklas.soderlund+renesas@ragnatech.se>
 <20240827131841.629920-3-niklas.soderlund+renesas@ragnatech.se>
 <Zs3az1G/e5y5lkf1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Content-Language: en-US
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <Zs3az1G/e5y5lkf1@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Tommaso,

On 8/27/24 3:55 PM, Tommaso Merciai wrote:
> Hi Niklas,
> Thanks for your work.
> 
> Hi Julien,
> I think we can adopt a similar approach for the max96716 deserializer using your work
> on max96714 driver. What do you think?
> 
> Thanks in advance.


I don't think that supporting MAX96716 and MAX96714 in the same driver 
is the best option

MAX96714 is a very simple device with one input one output one video pipe.

While the MAX96716 is a two inputs/outputs with four different pipes.

IMHO we should have one driver for the 1 port GMSL2 devices, another 
driver for the dual deserializers which will introduce more complex 
routing, and another one for the quad deserializers since the register 
layout is too much different.

But that's only my opinion let's see when we will implement the dual 
deserializer support.

We can of course share some functions for those drivers like GPIO 
handling or pattern generation.

Regards,
Julien



