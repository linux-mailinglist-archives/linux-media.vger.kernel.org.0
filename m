Return-Path: <linux-media+bounces-52477-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB/0Cu57imnJKwAAu9opvQ
	(envelope-from <linux-media+bounces-52477-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 01:29:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F93E1159CC
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 01:29:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A2583025C4F
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 00:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE6B22FE0A;
	Tue, 10 Feb 2026 00:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="A83xX/B2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C75226CF6
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 00:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770683371; cv=none; b=jO5QqAC+k1b/v4QYy0ctYi7tzqyMsqqnhS3N5P7T0cOfJIDJgZeexT7D1468JALEy+SFIhliiD2iNC/DbA9cmmqnYUu4yIqQ6x5trEq5Q0MTIwwJisl6OjhacNFZnW1b8P2txUpYLaWT6V3JMMg5nYMTPK5gJ2cM3LjhTt79MrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770683371; c=relaxed/simple;
	bh=QkYEXlLgFiLfYsdbBUxkHnpm64IBcci0n3arrJTjZQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBiPB9gr/prDw41XyuzAVL0cKm85Zmy2xhXjSst+UMZi+V5JS3cwatF2eTJWwMxIQh8doG6/ekyiaJ2pCONhlFUn4wK0LJV3OjwgucKibQW2BvNSNy6RXhSmqDijnth00XfJ5nl7TVI2Swb/zx48bumMGxiU15pZAHHX9W8jlUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=A83xX/B2; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-503347e8715so43366751cf.2
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 16:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1770683369; x=1771288169; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x6h4j6WhKvTbDaZfOUKYNWWIjZl7N5IPl8TkLFVZwN4=;
        b=A83xX/B2seg/cnscnC0nFblKwgzguEC6y+SEroWVfUvVHrcAX+b2JnHyQAcPpCp2ZN
         vdH3GOpi2vHftFTQ5MXEWZglALUcKqBVLQ3Pb9Ov6QwjcWnyfV9eEsp+ndQYPX8fHDxZ
         sYmHcRjhjdUa3CV77cEMlLsPymkmHcyfb3PSR4pBbMZQSn6nYLcpUfldlFW/20WehV4l
         IdaoH4wc3NoGkZgy1xtXWPFdUz/uf1Y5PLYbl5kFK7D+8YPr/uBGMPFrZ0HjOMz6Ug5k
         2ro02wIgkjv8ptMNDUUuJ0i2+YvlLTowHgmGq+tx/t/tEIn1F4LEOsiAjDPF6Zaj6fAo
         0flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770683369; x=1771288169;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6h4j6WhKvTbDaZfOUKYNWWIjZl7N5IPl8TkLFVZwN4=;
        b=XAlYRlyEyqU9b+UazqBXNYkvHQg+8Zf5Pia7HFl9XcnKgWNjDuNaJSEdhvhREUr4r7
         ZOwcX4xs0dcrt7TB9D+lt+UALkW1RUYulgejNoocO9vMNMs+P4BFkfrmUrLT452b5NfM
         MWu6BcR4EeYC+PRFDdaOIDm1IuFrssD6yRXp6QM3Rr9UMPkKbnQNIYM4qjavfIS2U4OY
         XNyQ8AfAZanBchGyfV9tM2IyWJP/d1HUJjQyo7A2vNdMFN3J7fnUw1EkzWTOPuqkEbxE
         T/Rlk9amA82r4oX/9kbLC47Q4QTvJTbsTPwqvQnpnOLjVbnYLWJG19hDDUvrcTK2zHPn
         WQPw==
X-Forwarded-Encrypted: i=1; AJvYcCX+4hNw6zoI6p/siFHgedpEQ7KlsIYaurB8vbHtyXMI5AV7+sFHskq2QJsVz52t/F+os4ypSPxrPUVYtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjIVG0Vi1Dm+5WDy1gYXG1iPuZuha6NiyMZQXpS4ffzh1xsd5b
	dHnP9p96qE1b5bOb3DAXRVqnPP4ToiJ29RmiMtkVuR0SuI7BrvUjkrYIDGx4y1uIymU=
X-Gm-Gg: AZuq6aIhHEuqpy9YAEf4Q92lq+w+HiSMQ/MgewYQq9gkA4z+DWgk53Q7jOUyGE7GB8t
	a/5X6+24iIVEKZp5M/Jx3NS1bKWWC4MTM+M7PvsPxSxOkvkYqx4YVnqZomZ//boJqg+WeitPOV0
	tJK5led45RIGucBe1Am5jVVLYMHIvPhBDe0ZqJDRXI1j3FTnhXX/ZMTwrtZsDVAT4Y1wILaPagV
	8SQEH8iyvWrZ4MZF0fIS8wH0Ng26Gcx9ogWXRqHj/p01sE8iTFJaCCxe7ciB4A4Z7EH6YqwcWbu
	fGd4DBDJ8wg3Cqfg4Gfn9bxeKgdFV17Ir9pQhiFg6M0JtyjKyJR6llENEEKTfW6+qmOxdxVg1nK
	sMsy+E22XeOalMTGLWpHng9Lpv6z7j7kxQR1sWNRCRnuqCbxSYFDt+koXM09TAixLiAqM06gHJW
	6ajaSL7y/J4YbtsF49spr+iIjpe+T/EFvMKfqioOufWly115vzh45zV8XQ8QaYbdMY8EeMKVQNK
	5afflQ=
X-Received: by 2002:a05:622a:54:b0:4f3:438c:71 with SMTP id d75a77b69052e-50639889de0mr182445181cf.24.1770683368674;
        Mon, 09 Feb 2026 16:29:28 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a157ddsm979856985a.28.2026.02.09.16.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 16:29:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vpbd9-0000000GngP-1JAF;
	Mon, 09 Feb 2026 20:29:27 -0400
Date: Mon, 9 Feb 2026 20:29:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Stultz <jstultz@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
	tjmercier@google.com, christian.koenig@amd.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, leon@kernel.org,
	sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
	aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap
 flags
Message-ID: <20260210002927.GC943673@ziepe.ca>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52477-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8F93E1159CC
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 12:08:03PM -0800, John Stultz wrote:
> On Mon, Feb 9, 2026 at 7:38 AM Jiri Pirko <jiri@resnulli.us> wrote:
> >
> > From: Jiri Pirko <jiri@nvidia.com>
> >
> > Currently the flags, which are unused, are validated for all heaps.
> > Since the follow-up patch introduces a flag valid for only one of the
> > heaps, allow to specify the valid flags per-heap.
> 
> I'm not really in this space anymore, so take my feedback with a grain of salt.
> 
> While the heap allocate flags argument is unused, it was intended to
> be used for generic allocation flags that would apply to all or at
> least a wide majority of heaps.
> 
> It was definitely not added to allow for per-heap or heap specific
> flags (as this patch tries to utilize it). That was the mess we had
> with ION driver that we were trying to avoid.

I don't know alot about DMA heaps..

On a CC VM system the shared/private property is universal and applies
to every physical address. Not every address can dynamically change
between shared and private, but every address does have a
shared/private state.

By default userspace process generally run exclusively in private
memory and there are very few ways for userspace to even access shared
memory.

From a heaps perspective the API would be very strange, and perhaps
even security dangerous, if it is returning shared memory to userspace
without userspace knowing this is happening.

I'd advocate that the right design is for userspace to positively
signal via this flag that it wants/accepts shared memory and without
the flag shared memory should never be returned.

Even if the underyling heap only has shared memory in it (eg it is
mmio or something).

Otherwise making it implicit, perhaps based on heap name, sounds very
tricky for userspace to actually use fully securely.

Again, I don't know alot about heaps, but perhaps the missing part
here is that on a CC system all existing heaps, other than the one
using normal system pages, should be disabled for now. They can come
back once they are audited as to their shared/private state and
respect the new flag.

Another view is to ignore this affirmative handshake and just make it
implicit on something like the heap name and hope userspace lucks into
something that works for it, and doesn't accidently place, or become
tricked into placing, sensitive information into shared heap memory.

Again I know nothing about heaps, but this is a fuller picture of the
security sensitivity and what to think about with heaps and CC VM
systems.

> Now, there has been many discussions around "protected buffers" (which
> doesn't seem to map exactly to this confidental computing primitive,
> but sounds like it might be related) 

I'm not sure what protected buffers are, but this CC VM shared/private
(or encrypted/decrypted) is a core kernel property that applies to
every physical address in the CC VM.

I assume protected buffers are something more platform specific and
hidden?

> But, it seems like the use case here is still far too narrow for a top
> level allocation flag.

CC certainly is a narrow use case, but within CC I don't think it is
narrow at all..

Jason

