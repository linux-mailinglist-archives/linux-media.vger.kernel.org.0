Return-Path: <linux-media+bounces-67584-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z+x9FKKEVmoL8AAAu9opvQ
	(envelope-from <linux-media+bounces-67584-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 20:49:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFC7757F28
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 20:49:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=LwaOq9mV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67584-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67584-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6472301025A
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 18:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5583DB636;
	Tue, 14 Jul 2026 18:48:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1584A336EC5
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 18:48:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784054934; cv=none; b=UVJCO3dtOTLiI01r0hwhDbPLATLW0b/useyY0dkD7gGvieNCNfUlEMJB0brZRJBpUBdat00DWbmSMvJ/MtmwKwpAuo2nME6zY+RtPG//HFr8Ocn96E22FG9xQp+ZLd1yVG5/w9pSd0j9nEKXa7EPOM2jgO/OY9OoZ33QeGC9S0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784054934; c=relaxed/simple;
	bh=gPFPIei4CDkO7J1lxwRZh0QQzWYIn252zXFk5L8y0Ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWM4okqIDSNzNghDyrQ6XMNq2KuBhqRwXP85SWmWHzV7gYDxIrWOeSNlHi7EqKKG6viZz2QmkxO+dwfowxmDaAdz9gbHB1JfYtd+nqFOeMz86Vr0/1MvieEE0RtyHBDSaKartqbrujsbMB3ffrDk6kLjO8D0aolO3rxdUCDpJkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LwaOq9mV; arc=none smtp.client-ip=209.85.221.44
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47df6a5202bso2882262f8f.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 11:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784054928; x=1784659728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9g9uFKnNctGU0FYMhigLvskzpkcJ4V8ymJ1XdxHN22E=;
        b=LwaOq9mVhTu9fXTOgZv+K5w+yF8DWN6ZW3sQ6InXBHNCCdEdZ63D3YBPbXJVSf0NrB
         exTOAiTo7FwVMAUdbIFa5ToyTSBQRpXflCL7iH6kop2w0IxvQYy2HjENkQIbHZJjFvib
         GfcZWVl70P6Z93tzpcx7MzDHRf4OdPVZSIWHc8slfYfUdu4Pump5kYPvHHcHHmtdRX7K
         fyx+HTLPJxtE/WBW4yZ+oUbUJwh++hNhn14Ai9n9XYLFJ8DbMyBZI5b3kZnNBfy75LUl
         xmY2s0zMCN8IMVmym++yKwl44UDfwDtyvTpgbWFgSKudq5HzygnCYuM3k1AwhCd7AVtA
         4H6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784054928; x=1784659728;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9g9uFKnNctGU0FYMhigLvskzpkcJ4V8ymJ1XdxHN22E=;
        b=Yx/1SZGzUnjhr++BJGSKH3vT2uAwBDnvEChnIoEM3fbAe/uh7QFjQ5CIrqcfaubWBb
         gojB25JOsYJGrNazjRYp3R46L2eiXnzowvBPuC5PczKXTkChf0FfGzYyFdkhPE9YzOSx
         v3GUM++sqq7AL0FC66ccoBwM9LyPYMwE+38U3yyNE5VtXlTSesB8jb0+b+Q2gq0Mbi1h
         dS0h3EDwLFEHAGAAzDPymAlQ8yB0gFlkOzF5rZTADSB+prmnZTQ6wP0sjs4IFJZBi9Sm
         dQN1tzW9kczmamnWGiPkdaxP01Jz9twAyeGtU4EsHzZddqViVkMokWFY01Au7LH5y0Ve
         KsJg==
X-Forwarded-Encrypted: i=1; AHgh+RppbOZgvATIfA/m+GHWF8Qd0D2QWA8kTxnRYwiDKWnvdWMY5wVa04ayztLKP/o73Odg9Brfr7B9yxLBbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTDM0qAhW1t2IP2Gq7EpYmiJPZpOXiykTpYnYR/TAGnpdLTAa1
	Ym4Ff5qLNemLtNpOzlJfAuUCSusNU3DHG6jHa2de5WQE4660viidnu0CEa6ZY6wRw1Q=
X-Gm-Gg: AfdE7cmH3sndc6TyPYkreS1HZRR4BoaWsVOD289pXm+aXKKq24UbU0+KtIn2+h1GSgk
	/0LzxLjizn/1vwSyQIURrKQ5ufnrcpr/zuBvswcvGlp2K5oXPhFwXp0Rjh/Zue44csAhN+k5oOR
	oilnEURWHe2QJBxA6AacHO8JNH0/1y/JcIxJp6xzGfZgM4XpT9ieQNKv1Pvr8KrHC4JoJXz3pBU
	bpr8QInh/Z3DQVAVXYn+Hk8XcBh51JIDwB/BCeIQ44k5cImxIilIemdW4hWBWdcl5Mo9O9MEmUm
	9lXcrJD07XcS0ylsRaNCjKH6AaqR6i/5BYN/OyN9QiCrnBHCAA/d+g5cUiub+l2sN1qO6I4xqVp
	qFboXsb5ll7J1IAmsugOzj18qc8Md5LgvFcbLPkHE3Vf/ar2wVDHnlbssB/WcjEe9PL6dqh/vXB
	DuZGBhVDuuuRBHuv8Qf97ohtWAhLrjJtxE6ETSOKKi1x1xXNogM4517Uc=
X-Received: by 2002:a05:6000:3c6:b0:47d:f023:b4b3 with SMTP id ffacd0b85a97d-47f2dce9728mr18256050f8f.34.1784054928423;
        Tue, 14 Jul 2026 11:48:48 -0700 (PDT)
Received: from ?IPV6:2001:a61:13c3:1c01:3157:c849:4aaa:fa65? ([2001:a61:13c3:1c01:3157:c849:4aaa:fa65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c4320sm9826293f8f.32.2026.07.14.11.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 11:48:48 -0700 (PDT)
Message-ID: <018687f9-a7ba-4e30-bb3c-25ea6b8f172b@suse.com>
Date: Tue, 14 Jul 2026 20:48:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
To: Danilo Krummrich <dakr@kernel.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, Colin Braun <colinbrauncl@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
 <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-67584-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dakr@kernel.org,m:stern@rowland.harvard.edu,m:oneukum@suse.com,m:colinbrauncl@gmail.com,m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,m:rafael@kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[oneukum@suse.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,intel.com,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFFC7757F28

On 14.07.26 19:53, Danilo Krummrich wrote:

> Many APIs rely on this, as in they only guarantee valid behavior when called
> from a scope where the device is guaranteed to be bound to a driver, or IOW
> where a driver can prove that it actually operates the device.
> 
> Drivers must only acquire device resources when they are actually bound to the
> corresponding device, and must hand them back before the device is unbound. The
> devres API, for instance, exists for this fundamental reason.
> 
> For instance, we can't have drivers manage IRQs, mess with I/O memory, program
> IOMMU page tables (e.g. through DMA APIs), etc. for devices they are not bound
> to and hence are not allowed to operate (anymore).
> 
> Those device resources all have a lifetime that is tied to the lifetime of the
> device being bound to a driver.

Understood. Unfortunately this does not map straightforwardly to the USB API.
Usbcore tells a driver via corresponding opeations when IO has to cease
(and other operations should be performed) and when it is allowed again.

Being probed and unbound is merely one of them. Nor does this really
tell you anything about the device driver.

	Regards
		Oliver


