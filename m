Return-Path: <linux-media+bounces-15729-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84440946080
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 17:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B68C01C20936
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 15:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E3213633A;
	Fri,  2 Aug 2024 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="R2+aNIIn"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A69D136334;
	Fri,  2 Aug 2024 15:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612391; cv=none; b=KdQlTjQ+3rjH0sdAmfHMqLPdM43px+2gY3bzxGXGu2gSAL2+/NHb+LW2xJexQAxaaWL7EGV+GEMhybvhmqzPfGvliUE1HkHIPmTzmnBBeVv9fd9YAF82L/dBfSRz4igbptDXO7HZ2nBbiQ/3Hxs+bizHQ3cT5P/RP/aUFBZaV00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612391; c=relaxed/simple;
	bh=vaUoWKYYbc+9apH9UAH7phKlFhbklSN9gVy55V3kjUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqqm8Ivr11sFZgBt8v7JL3KOlLgBlLEraP8+ZL2peME0czqZy6we0VK+9tJTgQ8oa3eGSwQonrjwB4G2VSZGnH4Sgl0bLEX9Zew6ENeQGs3SyLsMmdUhxAa4BAHbKp/yEEI3iJl8Kjykz/vE42pRETzJF2YqBJSoLdmyzXWb7Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=R2+aNIIn; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Wb8nD4pX9z9tM7;
	Fri,  2 Aug 2024 17:26:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1722612384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IbiOHuuK++HVqf4Ly0K8XIOEOZLhizAbHkNRlvigC5k=;
	b=R2+aNIInlYHCHZ2caXa7mIUa0XaVi1NbbxC4Sc0k23Tv6Cd77LrKwMYv0HcLd/NPZT19h0
	V9gXA9vCM32XI7l0mJvMr1w4BDM8kRMXHt57HkNoGUzKjjxpvvj97tZg9p9kyrB43EBSQc
	RuJWYANqMDxRfmnYipbG//P2htyDtB4PXxwzS6GZSHdlESLPCf9MyEWyDbSu3byDG6PCJ+
	Uxf9f+ZerJEbGi/4e7nUpPelWnR4aaLy1nJPlIFsi9HrGNsS1oNPKB1U9as8Mnji9biv1e
	/LNTN9alkIvHiIOuO28LMNR6TEld0ugCOnrpPsnFyLKyzSKr3bz3xpCiQQtQ2Q==
Message-ID: <86d7ca9c-1493-474b-95d6-1e38b5703a67@mailbox.org>
Date: Fri, 2 Aug 2024 17:26:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] udmbuf bug fix and some improvements
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, Huan Yang
 <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240801104512.4056860-1-link@vivo.com>
 <IA0PR11MB7185EDB259502BC6937CE566F8B22@IA0PR11MB7185.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA, de-CH-frami
In-Reply-To: <IA0PR11MB7185EDB259502BC6937CE566F8B22@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: jraeashjkoya6xgp7jomd86xn6cw6ttf
X-MBO-RS-ID: a8c9a5cf6cddf16cf40

On 2024-08-01 20:32, Kasireddy, Vivek wrote:
> Hi Huan,
> 
>> This patchset attempts to fix some errors in udmabuf and remove the
>> upin_list structure.
>>
>> Some of this fix just gather the patches which I upload before.
>>
>> Patch1
>> ===
>> Try to remove page fault mmap and direct map it.
>> Due to current udmabuf has already obtained and pinned the folio
>> upon completion of the creation.This means that the physical memory has
>> already been acquired, rather than being accessed dynamically. The
>> current page fault method only saves some page table memory.
>>
>> As a result, the page fault mechanism has lost its purpose as a demanding
>> page. Due to the fact that page fault requires trapping into kernel mode
>> and filling in when accessing the corresponding virtual address in mmap,
>> this means that user mode access to virtual addresses needs to trap into
>> kernel mode.
>>
>> Therefore, when creating a large size udmabuf, this represents a
>> considerable overhead.
> Just want to mention that for the main use-case the udmabuf driver is designed for,
> (sharing Qemu Guest FB with Host for GPU DMA), udmabufs are not created very
> frequently. And, I think providing CPU access via mmap is just a backup, mainly
> intended for debugging purposes.

FYI, Mesa now uses udmabuf for supporting dma-bufs with software rendering.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer


