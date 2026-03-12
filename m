Return-Path: <linux-media+bounces-55498-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP5PFTa/smmvPAAAu9opvQ
	(envelope-from <linux-media+bounces-55498-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 14:27:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBF02727B0
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 14:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51161301945C
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 13:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449EC3A7592;
	Thu, 12 Mar 2026 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="efKwxGiG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E144A375F88
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 13:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322034; cv=none; b=sZHe2j0fc2ZmJXmoZIY3HqRklO6mxPcjVPEXFlLDd3MJPOlgBYKJw8MQExgV8nuqqUQBgmBi79M0dFy1ZzvFP822TZbyeU84qOKYfk7Ys54r8ZrgNIF7MX+u2uk6ojgjXmI4lt14UCcV2TxDq63c8Vtm+UToziZMnWJdWsrglSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322034; c=relaxed/simple;
	bh=gpA8yPsxWr0YYMreEtPtRRIeMQAt8l2vEE7xAShAnkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuQ7HmoquoM9nbvmc9BiyebWudIV79u2YNBwojH+BhzGuA5e/CWn8smCluJ7EbQX70UfGY/0brn+Sapf8ZkkrQdkbRsSurZ1YHsHu93JUHytKkerhNT4o61dhztQYWvINAhd0G9ssZi/FRD1//8pIghIP6f7dBeKIHXt9tPBizc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=efKwxGiG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so989111f8f.2
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773322030; x=1773926830; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9eBBP4AujN/dlLV9JaVbLVwoGymEEzkiKrZGnylO0o=;
        b=efKwxGiGfbz3LoSLql8msgf7dYr3tgT22Ejkxnc/Nzmbh3umv8PZxCg6yLXrZib8Tf
         d1VA6vkF/bCiVF+RNJLrKKUKp9FoSoHKfQeIoBBV4iGjMqcy2sR0mMuDhATAAP+peQhz
         J+138AX+u6pXDSDI4wM2fNLif4359lhXjeyB7K6XGrdkfDTuqNlppVTiq3VDXWb9oBIF
         /c73C2XahsI7jSlLfpyMTQgUiPfsHCjdi5FcQnsdrYTv7M1CSO+tOyS0arQHeJNDYuH7
         0BvaOmNqsblstplnc8HBxbCnvlW0muOsQkkHos0aY/PQc0fcKEVBN6Fh2BDW5dvxvxAS
         kjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322030; x=1773926830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9eBBP4AujN/dlLV9JaVbLVwoGymEEzkiKrZGnylO0o=;
        b=gHt4F/hU7fi/lEildFkh/jtw9kH4LZpsEVSnn8Y0tJpCXoICEoKp+0eY5MKNW9MZZY
         41FLmn+vFopsaOud5bPSHVb13s0VIeXHQ7c0Qo6T5Axp4DH2RCPofv5/tuU+MF0pbntA
         kUIDFNj2MWubNxZydAogMF/04F++0Le9ci8lqV7W0uR1Um4/AbZrnBuKQm1iuIwIeSXF
         xuNOqf+/mDjp/UQx9ATk0/fdw+T+JXHzh2LAfr62xsGm4u75WU0FzrAcKp5DV3DbmKnT
         Mcuj6ATJ3xOtjM79XmubYsMVeOeurTYFC+CuXYKYyjNM5+Zik2jCu9x89CHPrkZimMt8
         pWIw==
X-Forwarded-Encrypted: i=1; AJvYcCUH9gQgYPOywJsDRJqMW0votiqax9tGHr6qMhP0EzPbDrJ2ur7sTDxiaNdJmNZPLbcpZAw+nIE/cGCNcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt7/rDj85wq3pNMovulmXSyxJgbHIC3Ta+wCrDxMDaa4zGJ/6j
	MqlQAsBSQEwZ2O0qAkH2Hj65+MD9gbPpQnt5vKRllgoZ1RYwemVRu6E40uXHZoncqdQ=
X-Gm-Gg: ATEYQzz5gkm4KK6JL+W4ikTrWz2Y5YVnY2ZXc9Q5sGCqhTgMhTb9LIFMHTzTuZx4Tun
	yeEgpMATShmWBsAks+qUaH6b3Bdex8zqi+n2NYHWnitHK7oamU982s7UeHeszJa+LCTMPF1JSce
	3ibm9dVuBeGi30KdFi37+I88M5xxmLNOPzpmQ4uCKPo4wcm9rkRijXBeylBoYIwD12cJvXk7ASx
	aYotEvu+VY3cBE8DJPwapFckzdzUcyko3bg0JtLsYCQVZhnCs0BjKnxu6gLxD5EkGphq2CjEXhZ
	jyJLvm0FIKv41NTzsuRMlM1V5R6jo15DI0m1BMMr4pdFz3rQK+k2WmlsccP3/bWPiJfgHMa/q1O
	aGuANwpR+tXsV1V65vWki9kvt8b/WrdyAJnxP0+vX8eLuqJmpV11lU3USP1BBrC5avOhETnpXLV
	hO+OpzMC4/EH0xiPuA4Kea+TGN1TCUKK4=
X-Received: by 2002:a5d:5d0b:0:b0:439:f5ba:8c2e with SMTP id ffacd0b85a97d-439f81c6390mr11949569f8f.18.1773322030015;
        Thu, 12 Mar 2026 06:27:10 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2186d5sm7889290f8f.28.2026.03.12.06.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:27:09 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:27:06 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, 
	jstultz@google.com, tjmercier@google.com, christian.koenig@amd.com, 
	m.szyprowski@samsung.com, robin.murphy@arm.com, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/2] dma-mapping: introduce
 DMA_ATTR_CC_DECRYPTED for pre-decrypted memory
Message-ID: <qhu6ahugrw7ehxubssin4amdvsdqeuezjm3vdja5xpcykyjij7@kcg3fojxysqw>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
 <20260309131530.GJ1687929@ziepe.ca>
 <20260309140233.GW12611@unreal>
 <20260309151857.GO1687929@ziepe.ca>
 <phry3e2dtgxzxdqvrnqfuskangp4al64f2auithwme5kwkgepe@7qtftrhgv4l7>
 <20260312003408.GA1469476@ziepe.ca>
 <pmfxzgtazwa7fwz4mx53htdg4jjifwyq3gyzwklc45affy3xrp@57hxan4pqnkx>
 <20260312120606.GC1469476@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312120606.GC1469476@ziepe.ca>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55498-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,resnulli-us.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: ECBF02727B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thu, Mar 12, 2026 at 01:06:06PM +0100, jgg@ziepe.ca wrote:
>On Thu, Mar 12, 2026 at 10:03:37AM +0100, Jiri Pirko wrote:
>> >Alot of device MMIO is decrypted by nature and can't be encrypted, so
>> >you'd have to use both flags. eg in VFIO we'd want to do this.
>> 
>> Why both flags? Why MMIO flag is not enough? You still want to hit
>> "if (attrs & DMA_ATTR_MMIO) {" path, don't you?
>
>Because we will eventually have both decrypted and encrypted MMIO.
>
>> I mean, CC_DECRYPTED says the memory to be mapped was explicitly
>> decrypted before the call. MMIO was not explicitly decrypted, it is
>> decrypted by definition. For me that does not fit the CC_DECRYPTED
>> semantics.
>
>I would say CC_DECRYPTED means that pgprot_decrypted must be used to
>form a PTE, and !CC_DECRYPTED means that pgprot_encrypted() was used
>
>This flag should someday flow down into the vIOMMU driver and set the
>corresponding C bit the IOPTE (for AMD) exactly as the pgprot does.
>
>Less about set_memory_encrypted as that is only for DRAM.

Okay, that makes sense. Thanks!


