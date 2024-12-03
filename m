Return-Path: <linux-media+bounces-22505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A8E9E1496
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 08:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 973A6B218FE
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 07:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984A2199247;
	Tue,  3 Dec 2024 07:48:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753F31BF37;
	Tue,  3 Dec 2024 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212106; cv=none; b=eG8gOfZdD4ye2PYkqH0GBVue+6tD6FvYfsmRUeGdiCBu1DCQ6JDrpjCz4aU+KUF6dvUpK1SeUeVW8UiBFf36++p1+ruipqFJW04f54/ZJzU+kHP8m3053fS80+fjNkwH4lOlq3n4mwLLDPjx4cekF35RnApzR0RAo5taZjW83vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212106; c=relaxed/simple;
	bh=epIsTmuEGqV5ex7Buj53hs+4a+53QyQDfmiqJ/xjAcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EXS4L/G0/g9i15J9VND1UKXNf6AX3J6I+ES1zft1L8Mj96KYUahHzrpvn75sWYnMuAMBcE1c93RIY6joUGDcTn3l8JDHPyaXGACyt+cqZvLl12CmEDFSL+QbmhSVilUr+AUgprzZq21b75sFUHfU04pzRdGdu8aemGyc3bIVmU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.243.18:6251.1851321443
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-123.150.8.42 (unknown [10.158.243.18])
	by 189.cn (HERMES) with SMTP id C8D4D1001EF;
	Tue,  3 Dec 2024 15:48:20 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-5c5f88b874-pd459 with ESMTP id 002a35733e044706a3f8316a06dff72b for arnd@arndb.de;
	Tue, 03 Dec 2024 15:48:20 CST
X-Transaction-ID: 002a35733e044706a3f8316a06dff72b
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Message-ID: <f552e0f5-6350-416f-89e5-e1a0e6aa2886@189.cn>
Date: Tue, 3 Dec 2024 15:48:19 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/media/pci/sta2x11: replace legacy GPIO APIs
To: Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20241203072742.191787-1-chensong_2000@189.cn>
 <9489561e-bc41-481d-b542-07fed1161a03@app.fastmail.com>
Content-Language: en-US
From: Song Chen <chensong_2000@189.cn>
In-Reply-To: <9489561e-bc41-481d-b542-07fed1161a03@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

ok, then remove it.

what about drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c,
it has the same problem, are you going to remove it as well?

Song

在 2024/12/3 15:32, Arnd Bergmann 写道:
> On Tue, Dec 3, 2024, at 08:27, Song Chen wrote:
>> GPIO subsystem is moving toward a descriptor-based approach
>> from global GPIO numberspace, but some of legacy GPIO APIs
>> callings still remain in sta2x11.
>>
>> This patch mainly replaces gpio_request with gpiod_get_index
>> and removes including gpio.h.
>>
>> Signed-off-by: Song Chen <chensong_2000@189.cn>
>> ---
> 
> This is a step in the right direction, but realistically we
> should just remove this driver. I'm planning to send a patch
> to remove the sta2x11 platform from arch/x86 in a few days
> as we had discussed years ago but never actually done.
> 
>        Arnd
> 

