Return-Path: <linux-media+bounces-67592-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ZXdIj2NVmrM8wAAu9opvQ
	(envelope-from <linux-media+bounces-67592-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 21:25:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8481B75837F
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 21:25:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rowland.harvard.edu header.s=google header.b=lPFINUGw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67592-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67592-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rowland.harvard.edu;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF6A03013D7C
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 19:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B3548B384;
	Tue, 14 Jul 2026 19:25:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3224B41B8C9
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 19:25:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057142; cv=none; b=Qz45hhMtxABTV9T4hm2d1ocLW5LJaIsrE7Ev7IyPnz1dDglJ4GI6idZrfadV4Ffwqev4PFnJKiKqDBRZ21dEZY4ifLxiezL1r4EooSymAQwiWo0XUkDn7v+X4OqZ3qkfuLlgT+EOtOJKwt9Tu0our+3xD4PJ/1czpaMWPRIPR/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057142; c=relaxed/simple;
	bh=QWcvV6fVT9UEcqdWIGyKil73iXH+THrW/6k3NvPhvvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saEuM7CDb7A3AWHeI5skKazOtHNTE8eJ0wKhImj+lAcXbMHL+arlvE3zbMH2KQxkHDxkVEfgrGKB0QL0KVRgQ+EJ5sl5D8i4xXNckq2mhRRJwK2K1HG0sBKaG5rw+cE37AUkuMYskpPdexzxc9P55+Civ7fifjyXnA9QdcFsf6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lPFINUGw; arc=none smtp.client-ip=209.85.219.53
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ee88fce572so19264586d6.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 12:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784057139; x=1784661939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DeJjtlrM066xLR7BVtiJMoEVf129H/GMCvG48B6bMZE=;
        b=lPFINUGwuLgSt28TII9so3SiuFZ08j4OeFCHsHtr+F80JA/2/K6kPLDaoTMLfb/Gc2
         213W6wK34VFwsGwD76Kmi1L2lmllkZ19u8isQ6DoPzyF6HAG6QoOyvCpYpVFMvKspTGZ
         POlZ/dQ8L2+4XgMKH3SrRHrnQVvRKpq0RkRIrcoqsF5l62r8Nss+RTqvsENH9+96vul8
         h4/mR8iYscF7z12jpt5McRxyfub79qhvaJTMCoiH0dLbAyPrXwm2JIsOM4ZEkFULclXf
         fdgyNrIwIAQOqoiev5zBjuuozCR6B/FjIfrtkTvvmhPOh0XmdrOOUg64yoNVkRs8a4D2
         CpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057139; x=1784661939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeJjtlrM066xLR7BVtiJMoEVf129H/GMCvG48B6bMZE=;
        b=lH7lmWSQqaOqtSLUTTTNRAqKXL2VG1W0m9P3Bic39KCswtubUUO2sXQKAOibsUk7KB
         K7FLejhoNiaCANV7KxwtFp9fR7VZQa9EzpRljWJLQnF2QBjjNwtub1wAoYHT5DBxLcQs
         pbZrRjipUv0x5Avp22CJ7pdmukJaKIhfsHSXbayohgn46S//hf21tVqHhk7o8dfzRO2G
         ep0XD5W34bpwxUExK+MSIWraVwilgzphCKC00jb1zobUnwYsqK3kiyTP59AItgl0gxmz
         u105qxZZKbmwY+KcFS6WNT/NxFrvnlyETYyQH6YgI+ACW6hx9bAF6q6h8NsW+eQj9Fm6
         /PQg==
X-Forwarded-Encrypted: i=1; AHgh+RrdPPNDD+IkmDs++SYFPTFjZft2BXJmpyotboLB1FrJuNJnMFlwr6Zx7jC83ry+6OGMgN2puT87H0A7cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Tdu3rcFvItYiPNTNQYKsNs7diHW0ckWOFJCCk9gGSIFCpNVf
	D8D59t7Uedgi7Y1Pi0/5+5V/+s0PgKfuQQgiRYWvkqmTVmljz685j8RS0YRJrZVtDA==
X-Gm-Gg: AfdE7ckumCI7MUtuwVoUkN8bk5xqr4r6aT/3QTLfQKa6bferVmYiv4k7CkpgyKWFycQ
	LbgjN5oGZCNQC5ewA1MInCEyrbUUTdcjSfRwhN2/JJy9TdHKyNlFJb5Fn9ReEUC93JRNO7Lw8ga
	dWw+imStKiqdy560MOK0D29PxOfVuJFsQQw0dpm5et59iw0bdv9QIbM9IKT6p/wMFLxiE0xWIvX
	Oz8T78cq8de51rycrAVzjMZJzBBdkzEvHDD9SJ/ghhFXYTkeGCqyXQxMWttDoUe5BKQ4Zsfgwfp
	PABSsc71EvAvV4WZv7cq+8QSHTF5p0W2QhrjrZw1IvAb6zdpcZ+tA4DPCHvQs/hWyrleHQ2Hbvq
	KYKZktSWGs5eF8latfDEe84a4CtfZq9glLn+T3K6eDOSkHxpuV1+zAYSnPPwDsBTclqZFbOSX1f
	bOwTgmTRi/ExG+Y93MvhWFyDtB
X-Received: by 2002:a05:6214:1303:b0:8ef:7fd6:11db with SMTP id 6a1803df08f44-90403d5658bmr171597896d6.51.1784057115041;
        Tue, 14 Jul 2026 12:25:15 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd248e666sm174996326d6.0.2026.07.14.12.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:25:14 -0700 (PDT)
Date: Tue, 14 Jul 2026 15:25:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, Colin Braun <colinbrauncl@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	Colin Braun <colin.braun.cl@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Message-ID: <a6809829-b7f8-4181-9965-0668fe95d133@rowland.harvard.edu>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>
 <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
 <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,intel.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-67592-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:oneukum@suse.com,m:colinbrauncl@gmail.com,m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,m:rafael@kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[stern@rowland.harvard.edu,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8481B75837F

On Tue, Jul 14, 2026 at 07:53:03PM +0200, Danilo Krummrich wrote:
> (Cc: driver-core)
> 
> On Tue Jul 14, 2026 at 6:26 PM CEST, Alan Stern wrote:
> > I don't see why Rust needs to distinguish between a USB device that is 
> > bound and one that is unbound.  There isn't much you can do with one 
> > that can't be done with the other.
> 
> It has nothing to do with Rust, those driver lifecycle rules exist regardless
> and they are present universally, including in C.
> 
> The only difference is that in C all the responsibility to enforce them is
> usually on the driver -- e.g. by creating, destroying and calling things in the
> correct order in probe() and remove() -- and a lot of drivers have bugs in this
> regard as a consequence.
> 
> With Rust we can enforce those rules with the help of the type system at compile
> time; device context states are a part of that.

I don't really understand how that would work.  For example, suppose you 
have an object whose type represents an unbound USB interface (I forget 
what you are calling this).  Then a driver is probed and binds to the 
interface.  What happens to the object?  Is it somehow destroyed and 
replaced by a new object of a different type, representing a bound 
interface?  Or does the object remain unchanged but you create a new 
reference to it, of the new type?

Also, what happens while the binding or unbinding procedure is underway, 
so the interface is, so to speak, partially bound?  The USB stack does 
actually take notice of this; see the definition of enum 
usb_interface_condition in include/linux/usb.h.

> > Similarly, I don't see why Rust needs to distinguish between an 
> > interface that is bound and one that isn't.
> >
> > Even from the point of view of the device core, a device that is bound 
> > to a driver is the same kind of data structure as one that isn't bound; 
> > the only difference is whether the ->driver pointer is set.
> 
> This is a huge understatement.
> 
> The state of a device being bound to a driver defines which entity (i.e. which
> driver) is in charge of operating the underlying device, and thus defines who
> owns the device (associated) resources.

That's not how I would describe it.  When a device is bound to a driver, 
the driver is allowed to create and use associated resource; when the 
device is not bound, no such resources should exist.

> Many APIs rely on this, as in they only guarantee valid behavior when called
> from a scope where the device is guaranteed to be bound to a driver, or IOW
> where a driver can prove that it actually operates the device.

I can't think of many APIs like that in the USB stack.  One that springs 
to mind is encapsulated by checkintf() and check_ctrlrecip() in 
core/devio.c, but those are the exception rather than the rule.

> Drivers must only acquire device resources when they are actually bound to the
> corresponding device, and must hand them back before the device is unbound. The
> devres API, for instance, exists for this fundamental reason.

How would having separate types for bound and unbound interfaces enable 
Rust to recognize that a driver had not destroyed back a resource in its 
unbind callback?

> For instance, we can't have drivers manage IRQs, mess with I/O memory, program
> IOMMU page tables (e.g. through DMA APIs), etc. for devices they are not bound
> to and hence are not allowed to operate (anymore).
> 
> Those device resources all have a lifetime that is tied to the lifetime of the
> device being bound to a driver.
> 
> Consequently, any asynchronous scopes such as IOCTLs from class device
> registrations, IRQs, work queued on workqueues, etc. must all be synchronized in
> some way such that those asynchronous scopes do not access device resources that
> have already been destroyed on driver unbind.

That is certainly true.  But I don't see how it can be enforced at 
compile time.

> Or in other words, they must be synchronized against the "bound" scope, which is
> exactly what the Device<Bound> type state in Rust represents.
> 
> So, again, all those lifetime rules around the driver lifecycle exist
> universally, it's just that in Rust we enforce them through the type system.

How do you enforce through the type system that, for example, a 
workqueue item has completed?

> For instance, tying it back to USB, we don't want that a usb_driver still messes
> with a usb_interface, e.g. initiating transfers after it has been unbound from
> the interface and hence must not operate it anymore. This can easily happen if
> e.g. a class device registration is not properly synchronized and the driver
> still receives IOCTLs after driver unbind. In Rust we know through the "Bound"
> type state which scope provides the guarantee that the device is still bound,
> such that mistakes like this become impossible.

How can you pass types around to different control threads with somewhat 
arbitrary synchronization schemes managed at runtime, all while not 
allowing a typed reference to exist beyond its lifetime?  This seems 
very similar to the "pointer zap" problem in C/C++, which as far as I 
know, has no real solution.

Alan Stern

