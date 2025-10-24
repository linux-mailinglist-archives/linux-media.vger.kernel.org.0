Return-Path: <linux-media+bounces-45499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 32630C06493
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 14:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4356C358097
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 12:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547BD3191D8;
	Fri, 24 Oct 2025 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="d0eerXkS"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB7B3176E3;
	Fri, 24 Oct 2025 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761309620; cv=none; b=SGTcI5B626zDL2JgJ9URakjaydyKVnFSLwmsM+ZBcbInKr2CVKzzMqHL16TA85v2lgIPujilsoumqkMdVE05TcxgTchmJoFH5oTfbjaflnC/aUQZaH40ZHsKI01BkxbkH6p5qVbG9kKClPZn+lIJ/1p3YejXCDGE/oRE5I04nbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761309620; c=relaxed/simple;
	bh=Om9HVma6Qjp5czvUKnNREoYKYjR5jgFdjeAAMtVRVtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZU0I38vvR+cclVhtKrftQJMDFngZjhHuusYBtXRb5WuQw7C6a/8j0LeI7PeJVcTLKamoGuUNpy0qyRJeuqCD3cUnwOW+CfPWUNbxkM2xzor7uShbY2SI9IisrmpfFdGB/jcKiDzZHeKLV31lgarjeB+e+36Drzn16aqYiL5fugE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=d0eerXkS; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CYH5z7YnNdqtt5xRRak5CboKl5y9ju/AiYhGCppJhKw=; b=d0eerXkSz12vh9goTqEWUKfH5E
	zJp6M2wqWfy5fyCSxfbg8yUBO7wDhb/Znuu0czUS02xbpGDbDksbJ+gTf3kNrWwxQMJ0XtKPeog0A
	bbk9tSkvijKY/OGnSYXWYm3u8BLwjphK39wlI+4o7+GeCmVzGd3w6rRA8yvJVQioRszIRFqwqwdt+
	Dw1uUJNfnkBifui0BOAcENJoXAIQXpXnN78NypTT+yKIwHvQoLv9KkmzUvJLD2P61zqgSmqgshUih
	iJtCY9IsMOlLQ8NFGsaXBrZ2pYXAo0EN1JVI4qMmIqQrDO9UtXBZCPel693JNiYTH/J38GCFug8Bz
	gMSBM05w==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vCH5Q-00El6s-Be; Fri, 24 Oct 2025 14:40:04 +0200
Message-ID: <5640fbf1-7b8d-4537-9f1a-b401a7a4934b@igalia.com>
Date: Fri, 24 Oct 2025 13:40:03 +0100
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
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <89812f66-25a6-4f9e-aa4f-74adbf116db8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 24/10/2025 13:12, Danilo Krummrich wrote:
> On 10/24/25 1:31 PM, Tvrtko Ursulin wrote:
>> Also, the short name can be reduced from a verbose starting point similar to yours:
>>
>>   "unknown-driver-is-detached-from-the-signaled-fence"
>>   "driver-detached-from-the-fence"
>>   "driver-detached"
>>
>> Or keep "detached-driver" as good enough. Mea culpa for typing it up transposed. :)
> 
> "detached-driver" is misleading, just because the fence is signaled it doesn't
> mean that the driver is detached.

You trim too much of the quote making it unclear if you read the whole 
story.

If the driver isn't detached from the signalled fence then it is 
vulnerable to use after free.

Current state is that name and timeline helpers _are_ detached from the 
driver once the fence is signalled.

Fence ops and lock are still not and that is work in progress.

The names under discussion are printed together in debugfs (intended 
audience kernel developers). Currently, per fence, it should be along 
the lines of:

"kernel fence: detached-driver signaled-timeline seq 1234 signalled"

You can propose a better name but make it not too verbose and/or 
redundant considering the above.

Regards,

Tvrtko


