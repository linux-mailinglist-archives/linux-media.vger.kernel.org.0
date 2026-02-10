Return-Path: <linux-media+bounces-52523-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDQ4B3JFi2mfRwAAu9opvQ
	(envelope-from <linux-media+bounces-52523-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 15:49:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7079911C0EC
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 15:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 241CA3034282
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 14:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3352D3803D4;
	Tue, 10 Feb 2026 14:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="OcqMuml5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A421367F27
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770734951; cv=none; b=WuWot/Pxk3yRztVW5+b6MJgjHM3ht6F2bxvNw4uvQbSpnGI98LcEENK2Dxl1zFjhNOYcgik1tQ0bqWXVneBQ9mJqm4zVjWhP7+MC4K45BkLuQOOFhUKxFQ59DGVptg2+dxHkabBJbYibSOJCqGOmsXWPrmawqp3kmge/QIOcr1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770734951; c=relaxed/simple;
	bh=+bIFsqkuMlO2AMozRHfhdOolt0s77l01f5PiZRSILuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mifSAHsgfx91okfqRfCpo+hJ24J/Aa+EkHsJ9BSXuK4IcNHH3ml1K1vfkPqX1wcTK99x5Qt/E2Un+vwJFl8C0xlgrhVzYu87y2D3Wj0/B6/P84/ry2hDFfINhmHF9RepighbQhKKLv/SPuQurAKtavAw826IVrr14luKh4g9BjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=OcqMuml5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so7942325e9.1
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 06:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770734947; x=1771339747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=knkS23bKgxD0sGFgNoxwcHFypphehdzY/C+BgKABh1k=;
        b=OcqMuml5NOPcjom1tin3Y8WNieLRwOxRRg+F0dAvpIJQRxZP2CmCeDTBeYyIm2tdKx
         EnXKcOIGlJaF2ZVuoX4TuztIqbxD8c6OymDUv2c84H3L3otirxEOXsxIuxO69rPH6kCm
         JxNoSraFXD9Glbf1e9gM/mkbplvy/DBVA9SOIMwX25GaN4uHQTkF4kJUblP7TAXnYkkm
         5HBiIE+FY4CS5WVllB9ErovJcXwvk3Kas4tUsb4S0ozimHav0DI4Tdu4ynGdEKYV6ibQ
         NQ76IVGjQ9aIuUOfintqpAlleHt3Bbe0WY3BdoRVzhx+N+WjRgMkG8tQhIm9t1hNEb5N
         pB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770734947; x=1771339747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knkS23bKgxD0sGFgNoxwcHFypphehdzY/C+BgKABh1k=;
        b=mgTgGaSLWKS165uJubY00PyOS8vTSjeCgIwKPdi/BSJxzjuds34IUzVcEk4rcUX0ql
         SKMIHLxVML28A8oKlnC2Hs0AyYQYVIwJVMN041LDXKz5I2B7LqFWvi3/fnuudb59lCIQ
         IarDJP1T5HcyVCUeYVMcruyvUMypNAGlG1c5YTZDoUBm7QWiGa0oJxgnq5F/OBo+yY9A
         Xe2tDRyMnmPL78eOSzRCXFzJPgUZVCMq3Jo9zqzE7/5wTuyW+tiTox4Kgn9IW6s0fpBZ
         4HYz+BufUTFZHhd+i+i5ru/TJn5y1l5+dBu1/pUNBqUM718I5CYTILf2i1Ggqlo/3mlV
         SZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLedsNubUXAmzylg3c5ezGSStTWE0bzvc99cnQNLLek5x8D6zOTXDENNuCa2jJNdeKXGWZi9ER7fhnzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXnPI0GdkP6hcSXgcrc9ucyUuOPkY5pl5cHhsrTAMwlMmpaTUM
	T9qS752F2LELnROkmGIEhKXVacZJCs+xNQXo/E44xqSQYMtYFvSZY6yK2seru/2KRc0=
X-Gm-Gg: AZuq6aLpdLF0pe6KPnzYG/nHaBsZvq31G38VvB0CuctXA+OYWPvVNSanTfNBwV9JJ9M
	8wNJkRCD5S49/g2/P2MRJF01r/P04Ac2mO0tW46taQ48NqBnVyYHf2Qb68pJHBJAf4WWyYtqATQ
	ofRnuiaOw2TmUVhj9cj6AcL8c7SuP2KAbPUPOMKjfIMhQc/p4C4zkrUPxp1NDbwzv5c72WMd0YX
	RJZhI7Ah5AeUgc8VuUK/XWDonu29IzK4QfyAUvYJhvwHn4if5pXe4Jc9LUi6+kXBOeGdfZo/qx4
	V+6LKQM18qZiUKyi/Ng7/HrYK+dtLkMC9fqYflzJSvBcU0lzw3qnwH0vXmwJDNxwb36+E1e+wBW
	3NERqrZn7oSe2sP4eKGVC2Xp/DbBn0UfLw+FhZb9PJEdhJvri0ceuL8l0vrTiE9wPzTzVEyQz0M
	P3Z4V534HvbVfsX3WdB7Q2NtLRDay6lyeUCE4=
X-Received: by 2002:a05:600c:3f0a:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-48320236ad7mr236498725e9.31.1770734946334;
        Tue, 10 Feb 2026 06:49:06 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd1c9sm34022302f8f.15.2026.02.10.06.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 06:49:05 -0800 (PST)
Date: Tue, 10 Feb 2026 15:49:02 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap
 flags
Message-ID: <y7gvezflidmma7odnut2rmlecsbxahrcwpmoevfnhzjveusuwj@6qxqogin45j3>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <20260210002927.GC943673@ziepe.ca>
 <tgvdjszwxggr53digbmddcbxvupzl4xcoprofkgrs2kgf6rknx@44ebljjpghjm>
 <20260210124357.GD943673@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210124357.GD943673@ziepe.ca>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52523-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli-us.20230601.gappssmtp.com:dkim,ziepe.ca:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7079911C0EC
X-Rspamd-Action: no action

Tue, Feb 10, 2026 at 01:43:57PM +0100, jgg@ziepe.ca wrote:
>On Tue, Feb 10, 2026 at 10:14:08AM +0100, Jiri Pirko wrote:
>
>> >I'd advocate that the right design is for userspace to positively
>> >signal via this flag that it wants/accepts shared memory and without
>> >the flag shared memory should never be returned.
>> 
>> We can have the same behaviour with the separate heap, can't we?
>> Userpace positively signals it wants/accepts the shared memory by
>> choosing "system_cc_decrypted" heap name.
>
>So what do the other heap names do? Always private? Do you ever get
>heaps that are unknowably private or shared (eg MMIO backed?)

If I understand the code correctly, you may get something like this:
$ ls /dev/dma_heap/
default_cma_region
protected,secure-video
protected,secure-video-record
protected,trusted-ui
system

The "protected*" ones are created by tee. I believe they handle
memory that is inaccesible to CPU.

