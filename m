Return-Path: <linux-media+bounces-55486-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL5cKWCCsmm6NAAAu9opvQ
	(envelope-from <linux-media+bounces-55486-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 10:07:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC6326F5D9
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 10:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BA01305510F
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 09:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8259F38C401;
	Thu, 12 Mar 2026 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="1n60bEQo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD6638CFE5
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773306225; cv=none; b=ICZwNM1ryy5ZhRrAzMa+ARVLi8qaIA46xgQphLyL9pTma1D2uFa8S0ZpoXMv0iib1DQxoXtfx48qwv5iZBjhbPLRhVORMBaRrJQauIduWnXILm/mJj8i7A2O/6tLiB/XkiN6U+9T+poozPgSeC8U7sXdMwG2UyH86t+JE0+SDAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773306225; c=relaxed/simple;
	bh=LdyzC1pgxXTGxkwgodIu0tKumfCfu9AUZ2hCUMAE1os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTqsfJP/hv3K1zM3LkXEFPXMnM7dRMGtcx7UX/fEWpfG2VQXaNrwnPDep4NFAw1Uy6xLEwO0QFov+5SD0E2VvpVAaooigyiMpQOq7QlWGWpQawyCPgRFW2eDyyGz7E6dkBuQcv27dEDVg+Iw1m3ammdQ5xJvVWGU8D4oisCR/a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=1n60bEQo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439c56e822eso806272f8f.2
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 02:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773306220; x=1773911020; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FFPtayDDhz8Xf/M05gyckNDjnYEg9BLk1Cs40ltYFF0=;
        b=1n60bEQoQRSr/7GkhSXU8Y60cSGteccZedGTMlCsKtFn0kLKhvic1SK73IZ6o8Ax3N
         9Zz3bdDsHlEJH2JuIx5f6YtNJWuZSwRcPZucddaQjENHAWQCXyX2yENPyqB3EBTuV9Gf
         C3UvnqzuU+w3IqrScPDoaQJ/JXO7yWdociA3i79xruVtdz2uJYfkyrtpSHddHXhH7qBb
         fGg+QWkDXR9BUw1mrCg5XOsjDs8AiULYNC8oV7lu4d8qudvxm+TVWpsWres6aLPa9BFa
         sNClxwSHUk5vYAWsBek+7ybrhSfS5yQgQYP90Y9fbp9V6J+NImy6Np/Cuf8Hxi2qF8qU
         tlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773306220; x=1773911020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFPtayDDhz8Xf/M05gyckNDjnYEg9BLk1Cs40ltYFF0=;
        b=LVFjoWwfMhBFRVUuNmLhXHz7vNNGiOqiFtdf6x4fFnU1HnimLJRrtRiUpOQdDJK4xe
         taoNjCGiaxbi/i06yqzRjGdmfCsoXJBr+lIdOXyZfhyvW/DAImQViIO+T28jrciUpen+
         RrZRYUmVI4+694Odu4I+8CTrC4MBbBUXMf/APPdhbaXv2CYNAfQ3RUyYaVJdJc0yyrJt
         P2I9gnukdJsuLQvM5rf6l9Fru4DENZKHP0pg73uNeF7FeCZRMkWWzNveZwhB77luaUdV
         /02uKXr88y6youkK5CaZPtVBHvTxnUAiAjDDNQzd2CUSD65xB44VCCC3AeOeZvcMSKQQ
         V44w==
X-Forwarded-Encrypted: i=1; AJvYcCWzoVWTGjjOWFFHEBm+N1o6+XwH+Vnqdg13vhhqy4VlljUwbHJtYf49jJrXN7/wtRrl4mtv8dQ7XhPIWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEYtlskW8flOOpP2zC/c0lpvwuDgqLwZ3DiGumMl4RJUpDWw9T
	EZ0Ur+xhAGlAl8E9TwDFKUbFG9jhPZ/JHBAJ404F4EUhppY2vp9iMCbXllYgCFdjZ04=
X-Gm-Gg: ATEYQzwV8r6Z+QjxAp2DMqhH0JOnNJSuherVZQUJBtii1wpwvOy0g5Mol6pXAm+BMnh
	J1gDDSnq4lnqRurNjBC9RkJ5UKhgwEnS8yGEJ/esI9lqno2TsknWkDSp/53g8AFSWjSVYh7MCjZ
	TXHrfUV+zbqSJ6ffJtgVdca8Vx2sPyuPSDZFQWgRBE1mASdygPJL321j6EtfYYK+6DzY9qwx5FB
	VUBwHtbi8Tr5LY+HnhFa85pOkRqyTpbgnWRAAfAz2n9vTMjvor8e2hTx9ZD6DLkKNnHaVorQOi8
	o5kELSQ/+wIc3CPmCVGfL+5cV3jG4COnTqjmCcS+aaL7U2Td2Ks94EWM9IkxUaJXSHPNvXTVR+N
	Vn1uwwzXJ70V7jrmxWVrVlWthq1U3c355fzhEUtI0LhDXK4jjFc2Pw+5tFO+YGmTjwXoEmBzUsI
	Pzj7bFWoTrmxSZfZr/slsL3rAwkE6hPxY=
X-Received: by 2002:a05:6000:24c4:b0:439:b3ff:9abb with SMTP id ffacd0b85a97d-439f8224fc0mr10284840f8f.57.1773306220321;
        Thu, 12 Mar 2026 02:03:40 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm6366764f8f.4.2026.03.12.02.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 02:03:39 -0700 (PDT)
Date: Thu, 12 Mar 2026 10:03:37 +0100
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
Message-ID: <pmfxzgtazwa7fwz4mx53htdg4jjifwyq3gyzwklc45affy3xrp@57hxan4pqnkx>
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-2-jiri@resnulli.us>
 <20260308101948.GO12611@unreal>
 <20260309131530.GJ1687929@ziepe.ca>
 <20260309140233.GW12611@unreal>
 <20260309151857.GO1687929@ziepe.ca>
 <phry3e2dtgxzxdqvrnqfuskangp4al64f2auithwme5kwkgepe@7qtftrhgv4l7>
 <20260312003408.GA1469476@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312003408.GA1469476@ziepe.ca>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55486-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ziepe.ca:email]
X-Rspamd-Queue-Id: EBC6326F5D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thu, Mar 12, 2026 at 01:34:08AM +0100, jgg@ziepe.ca wrote:
>On Mon, Mar 09, 2026 at 06:51:21PM +0100, Jiri Pirko wrote:
>> Mon, Mar 09, 2026 at 04:18:57PM +0100, jgg@ziepe.ca wrote:
>> >On Mon, Mar 09, 2026 at 04:02:33PM +0200, Leon Romanovsky wrote:
>> >> On Mon, Mar 09, 2026 at 10:15:30AM -0300, Jason Gunthorpe wrote:
>> >> > On Sun, Mar 08, 2026 at 12:19:48PM +0200, Leon Romanovsky wrote:
>> >> > 
>> >> > > > +/*
>> >> > > > + * DMA_ATTR_CC_DECRYPTED: Indicates memory that has been explicitly decrypted
>> >> > > > + * (shared) for confidential computing guests. The caller must have
>> >> > > > + * called set_memory_decrypted(). A struct page is required.
>> >> > > > + */
>> >> > > > +#define DMA_ATTR_CC_DECRYPTED	(1UL << 12)
>> >> > > 
>> >> > > While adding the new attribute is fine, I would expect additional checks in
>> >> > > dma_map_phys() to ensure the attribute cannot be misused. For example,
>> >> > > WARN_ON(attrs & (DMA_ATTR_CC_DECRYPTED | DMA_ATTR_MMIO)), along with a check
>> >> > > that we are taking the direct path only.
>> >> > 
>> >> > DECRYPYED and MMIO is something that needs to work, VFIO (inside a
>> >> > TVM) should be using that combination.
>> >> 
>> >> So this sentence "A struct page is required" from the comment above is
>> >> not accurate.
>> >
>> >It would be clearer to say "Unless DMA_ATTR_MMIO is provided a struct
>> >page is required"
>> >
>> >We need to audit if that works properly, IIRC it does, but I don't
>> >remember.. Jiri?
>> 
>> How can you do set_memory_decrypted if you don't have page/folio ?
>
>Alot of device MMIO is decrypted by nature and can't be encrypted, so
>you'd have to use both flags. eg in VFIO we'd want to do this.

Why both flags? Why MMIO flag is not enough? You still want to hit
"if (attrs & DMA_ATTR_MMIO) {" path, don't you?

I mean, CC_DECRYPTED says the memory to be mapped was explicitly
decrypted before the call. MMIO was not explicitly decrypted, it is
decrypted by definition. For me that does not fit the CC_DECRYPTED
semantics.

What am I missing?

