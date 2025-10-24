Return-Path: <linux-media+bounces-45534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E8C07231
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 18:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1976A506167
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 16:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E331332EA3;
	Fri, 24 Oct 2025 16:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ATCY1k9l"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED4ABA3D;
	Fri, 24 Oct 2025 16:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761321980; cv=none; b=sd5W408nXbwmk7eR6sajg3EGOsBVApdIGEVGV0Y3adc9iEu5BEngFsHN6wb5p68ycZGYjAFcJ10xdq0tTWikU8SZS/DsRV4fGUNeJMkCqOHBY92UCyPQ5qbO9ixI+HjqonHupYJV4vFY25eLrTYLgwkTxSICljdVURLK35orNwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761321980; c=relaxed/simple;
	bh=XP0xgKYL8Ca1s01fuTHXcj3nh0jQ0oXKtwdsaZC8Ubw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFQtEYSnIqqHdyrt+IUB7vxNMcUdXUJbbcB75qUP507y47UmFTNDEK70d/UXaH5GHAFXqcCF66AdaSBmoQh9Wr3MJ9vEGXDw+PgTwHvMqZh4t/gTed0w0ALJ4Hj5q0D89c/hbJgkLfVzvhfuCCzJxlsLH0POnKuSiQnuQR+f9YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ATCY1k9l; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JzsWkVI8qD4VvRgYZM6Q6s9mOVUzFUE3TdY3Qk/PUlk=; b=ATCY1k9lKNLJ60m+Rp+byJ1Vxi
	kXR5/sbFdMcE6EzEIIg5iyP1cWGOaoNa9wLCMBTjjeJksY9MgmdhZQSq9pzWxYUoXH6WAYvz3ywmf
	m8C+Ipd7AKnip8T/7Yn9J82S5fUPLkSNygsYjvEx03CJV0br8/4ZoGaZ7MmZbBaOKbDOHmbjxSC2T
	JpYoXc0GMPKw0b2JyWKowWtFJJOBFzUFUYJ5cIj9IG4voM+t2xeLjj8pXzN3zt1/v+bLVzGiX1pMI
	cDuuLGHc5cSOBbIx4Vtfb3RUSVWwpmLkcZ/uRmnDf6Bu+5IvauEEQ0niloghL2rkFBl/Dw8J4IolM
	Yz1Bmw2A==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vCKIn-00Ep37-F0; Fri, 24 Oct 2025 18:06:05 +0200
Message-ID: <5b828e1e-bebd-4730-8866-7a650c1f724f@igalia.com>
Date: Fri, 24 Oct 2025 17:06:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251024075019.162351-2-phasta@kernel.org>
 <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
 <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
 <1d0bbdcf-f4d6-49c0-bbdf-364c2af80868@igalia.com>
 <89812f66-25a6-4f9e-aa4f-74adbf116db8@kernel.org>
 <5640fbf1-7b8d-4537-9f1a-b401a7a4934b@igalia.com>
 <8cba66d2-9608-4a5c-a2af-6cc91f46a49f@kernel.org>
 <cefe8f07-68a3-4c93-ae46-ebb01ff6fa2c@igalia.com>
 <b21ba8b4-a31f-44e5-a2da-ba585a93d3a6@kernel.org>
 <66f066b0-a8bb-40b2-bdd8-7cbcf114cde1@igalia.com>
 <02b7cdce-95fe-475f-a346-b41fd5615695@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <02b7cdce-95fe-475f-a346-b41fd5615695@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 24/10/2025 15:36, Danilo Krummrich wrote:
> On 10/24/25 4:28 PM, Tvrtko Ursulin wrote:
>> On 24/10/2025 15:17, Danilo Krummrich wrote:
>>> On 10/24/25 3:37 PM, Tvrtko Ursulin wrote:
>>>> How about "unknown-driver", would that satisfy you?
>>>
>>> Honestly, the most accurate thing to say would be "fence-signaled", because
>>> that's the actual condition which causes the change.
>> Hm, ->get_driver_name() returning "fence-signaled" is not great, and debugfs
>> output in the form of "kernel fence: fence-signaled timeline-signaled seq 1234
>> signaled" feels a bit redundant. :shrug:
> 
> Indeed, what about "retired-driver"? Still implying that it's not just unknown,
> but that some process has finished. But without the ambiguity of "detached-driver".

Maybe "decoupled-driver"?

Regards,

Tvrtko


