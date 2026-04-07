Return-Path: <linux-media+bounces-58162-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEa0EAvO1GkOxwcAu9opvQ
	(envelope-from <linux-media+bounces-58162-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 11:27:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5BC3ABF55
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 11:27:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0B2A300D684
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 09:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94DC39B49C;
	Tue,  7 Apr 2026 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="R9MSiaDE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2EA39BFFD
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553924; cv=none; b=HNEMvY/ciL6vbhF7/dggKmqp9iMRJ6VKjesjld06ampwGWaRBqG3hiuvzQif19kF/u6Js62FfoPEN/mXkjH+ioi3fBTXkeXtOTWdGTpDKh3A8u9h6f8MyCqk7jtW6yD3Rr/cPaUMu7WyRBPmXa44UbfBkcAygMHS6hMMOievgtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553924; c=relaxed/simple;
	bh=EL1uS51GqLRXczIb69xOmfNqtX6Z7UkZCrcbE2W7W8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRQArHJU/eKGOBhT3td0HE6RF/3CnYrfu7rhkSdrXj0DywbzWTvAwyF7YqpOFItC0m3Pq0jp9FoG02xnv/jlp2rwGn7k4aTEnodpV57Nvd4oy9+aofa/IXG6KpylHpDD7hfimBlp9FFj7ANBavLCDp9wnFzsrQifPlB96/39ulo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=R9MSiaDE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so4221176f8f.0
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 02:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1775553918; x=1776158718; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ChD0onF1gDOUOLYFpD7x1c0kz7T4QILlyJ39777mmvM=;
        b=R9MSiaDEFAOzVzsF0Nnrqj5sRZYlmD4s1UzuCpPhitgztYs/EudVcakEQgSGk+33dV
         bZIOlMfMw5ZYbVz7OCVM+0uzmjn7iNhNodb7oEIrI0iPltPDvEMWRduUc3UOkKTHesRh
         3vEAwHh0z8z1F3/NMqwADfA/PyzXIgmdz76EZpcFh9tFKWkiCXwW9EOGVaNNfiiRkWMl
         K6W+3x853w2YPpAF00MvAQabR9qYroGpWlb7X4YRgECJMDz35phuxV0rF3NDHA3eRFT1
         AYAkUAB2s8gFDDl0Ncj5bth1w+txSz8clwIX96T1drXJGtOU7X8IxjIKeT7xgkmvPN8x
         rfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553918; x=1776158718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ChD0onF1gDOUOLYFpD7x1c0kz7T4QILlyJ39777mmvM=;
        b=BOYJFIP1UOe+oSGyZSF1bHmdo6bE/JypSDfic8nOdS8sNB7B1YmAJU3DfJFBHGH2fv
         ik9kWJbfTUyRg9c+lwhrW0iyp5rXKPZeAbzk+oaWPnipRQ53WNOS9Fb/1AACHJ1CNc5G
         zXnFhXX3ng7w99AyaZmU3lOJZc3I/LP0YrVewPR67BhOH5InXhvQMBX7SNy8SBXYxLA8
         xxGfuBd62QweevgORX5MNQJ2CDoYkvkpi4PbEujiwyd0wuH+wwLw+nrwLZeR1rtcj/mI
         Tv8YINjEow2Ur6rYoljSEthWngBd5HJOEQJyA9OwHwe0BsBEFt1dn6j9vagtycICJY+I
         OROA==
X-Forwarded-Encrypted: i=1; AJvYcCUCjO1zM+Y1V+h1LWDxEohqxRdl2lxh9mPjeej66uBLoX6Qc/IFRixsueUxYn+SctykfE0oNeQfTZ4P7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1y0UmmMFUKlYHuWywYgpixGy+RxTo6buzaemr66tuYl3LNH4q
	QRSSjktGR5NWUs50uqgdRu2YYXeFRvQfpxLL7KlONHkaKI6zLKNlzgSP73VCtWn8xBU=
X-Gm-Gg: AeBDiev9tk/i2W6VMEP53/GHhHitxk1q8pXYoxl/W39esDUrv9TzCJjVo5F39OKwQWx
	FGaplyife1fIQUUdgqjbmgy2D/ku2SlDdqPboCpxlFR0PE0jNf0JVd3b7dmpuMiTsfpONOO6FAi
	Ev5sY5JMbhwnPbDO1gby7MTPzf71Pr/qotHty74KHV9Ln/PawKP+cOnG2jCp7TzT48jcS2bwHEI
	8uDLn47i++Lni7lVDDERu+ZqQNmNbM/0UCqH45gXZI7ze8BqVvgiuck2WRDGGb/IVhfKnOnT87P
	3P+MelnHjipel4u29M4oEcBjrI/L8/hIc9DsVS3vUfB5M0H4W8hHXCF0HjolfZ4Vo8A3d1yUXSF
	rdPO1pH01gFpmC9FTu2AezISozfnLLNDDHT7tjVPATCfYLRL52sUrh1B1Ic1wZUxFegdVg3B4ko
	zmU8LrReZZ5/g965lvLGWigwv9Ug7nxy4=
X-Received: by 2002:a05:6000:4201:b0:43c:f95c:3e66 with SMTP id ffacd0b85a97d-43d29294b62mr24203622f8f.21.1775553918478;
        Tue, 07 Apr 2026 02:25:18 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5016sm52091538f8f.33.2026.04.07.02.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:25:17 -0700 (PDT)
Date: Tue, 7 Apr 2026 11:25:15 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH] dma-buf: heaps: system: document system_cc_shared heap
Message-ID: <5l5ack3pgpajrkbcactkiyvfi5pir3jn5eg6tmohcrdgiuqtn5@odbwbvsn4vrj>
References: <20260402141103.598495-1-jiri@resnulli.us>
 <CABdmKX3N70j8ZZs5DNhx6fhRi=Aa_+2xY1JHcW+uDoaV2+Sngw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdmKX3N70j8ZZs5DNhx6fhRi=Aa_+2xY1JHcW+uDoaV2+Sngw@mail.gmail.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58162-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli.us:email,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,resnulli-us.20251104.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 8B5BC3ABF55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mon, Apr 06, 2026 at 10:20:33PM +0200, tjmercier@google.com wrote:
>On Thu, Apr 2, 2026 at 7:11 AM Jiri Pirko <jiri@resnulli.us> wrote:
>>
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> Document the system_cc_shared dma-buf heap that was introduced
>> recently. Describe its purpose, availability conditions and
>> relation to confidential computing VMs.
>>
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>> ---
>>  Documentation/userspace-api/dma-buf-heaps.rst | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
>> index 05445c83b79a..591732393e7d 100644
>> --- a/Documentation/userspace-api/dma-buf-heaps.rst
>> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
>> @@ -16,6 +16,14 @@ following heaps:
>>
>>   - The ``system`` heap allocates virtually contiguous, cacheable, buffers.
>>
>> + - The ``system_cc_shared`` heap allocates virtually contiguous, cacheable,
>> +   buffers using shared (decrypted) memory. It is only present on
>> +   confidential computing (CoCo) VMs where memory encryption is active
>> +   (e.g., AMD SEV, Intel TDX). The allocated pages have the encryption
>> +   bit cleared, making them accessible for device DMA without TDISP
>> +   support. On non-CoCo VMs configurations, this heap is
>
>"non-CoCo VM configurations"
>
>> +   not registered.
>
>Doesn't seem like you need to wrap this line.
>
>with that: Reviewed-by: T.J.Mercier <tjmercier@google.com>

Okay. Thanks!


>
>> +
>>   - The ``default_cma_region`` heap allocates physically contiguous,
>>     cacheable, buffers. Only present if a CMA region is present. Such a
>>     region is usually created either through the kernel commandline
>
>Each paragraph starting with '-' confused me for a second there. Those
>aren't part of the diff. :)

