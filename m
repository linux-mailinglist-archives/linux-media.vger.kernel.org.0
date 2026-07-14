Return-Path: <linux-media+bounces-67564-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YeTSFfc1VmoI1gAAu9opvQ
	(envelope-from <linux-media+bounces-67564-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 15:13:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4436754EE3
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 15:13:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=COCqk8yy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67564-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67564-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 039D7326BBCA
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 13:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228EA47AF6E;
	Tue, 14 Jul 2026 13:05:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EAC46AEE0;
	Tue, 14 Jul 2026 13:05:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034323; cv=none; b=TcQWv+r06Gj829RIuuY0miOMALuKU+VlfAL2eV0ZVgbtk8GGHlJJax5wmxanb3WIdDz56YeWzF0WsYINYU4t0C+649sU4nllPwJrabHxnDRXMRyZ0ggrJr0/SVEaUBygBoI3s9KusrbqTQUSMEt5N+venZCkVkzt5FgOJeuNOQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034323; c=relaxed/simple;
	bh=I7wEKHsf2R2pDc9KJje/OSCZvG41Dp/KsYtJEHVdnMs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=k3dgRiF8YQ260yJYgGTS5FWw2Kz4XN/elqJB5jjcfqZU1PEY7yfgor4Qt7ruu1bTxeQdO9EeBDbLvDmm/s4AgBFdvY55t8CYSk2kt6OtF0qNaB7nncAtNMKtDAG16Cu5a4S29zEY6IPCrLAZKjH+aJRY21tJonNZzv0jTVr2y2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COCqk8yy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EBF1F00A3D;
	Tue, 14 Jul 2026 13:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784034322;
	bh=Wbj6QDXg19S0b+wBbjbuJhWZrQ4U/U4cwe80Uim8/Nc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=COCqk8yyHxuJEN9djlQCTBh1IOHnxAtOtM7s2b6RdmnnTWMojnCSpQIfMqwRwYfHP
	 B0UOy3ZkXmNxGTNJ3MvwP3FVsxqSpWc/eLDKHRwuuAvjkaKRWWaojT06mkzVkPZgA1
	 h4mqw18yCbo6A7lmCWrEWECM69YSLHZibj6CIUQRN0s3jhEOJmuUPe66HUxQVkgoKR
	 RNu+OsP1oeQLsWmdvn0Yx5ak7ZbUDft+r+GbBdHvh1FhBIuNZtqqyCXtoX+8TuqHCy
	 x/XqK+fknZYwEiGKKJ5C5Qa+XxR7u6xQu0aqbNslIWJ7JqpQs+XyJxOInB9/xJdl5s
	 e7F3bSOmsq71Q==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jul 2026 15:05:16 +0200
Message-Id: <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
Cc: "Colin Braun" <colinbrauncl@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Alan Stern" <stern@rowland.harvard.edu>, "Mathias
 Nyman" <mathias.nyman@intel.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <linux-media@vger.kernel.org>, "Colin Braun" <colin.braun.cl@gmail.com>
To: "Oliver Neukum" <oneukum@suse.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
In-Reply-To: <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67564-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:colinbrauncl@gmail.com,m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:stern@rowland.harvard.edu,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,m:oneukum@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,rowland.harvard.edu,intel.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4436754EE3

On Tue Jul 14, 2026 at 11:26 AM CEST, Oliver Neukum wrote:
> You can see that there is no way a configuration and thereby its interfac=
es
> can last longer than its device.

So, what you're saying is that, in the generic case, there is a guarantee t=
hat
if a usb_interface is bound to a usb_driver, then the usb_interface's paren=
t
usb_device is also bound to a usb_device_driver.

But the relevant question is whether this always holds. In a previous discu=
ssion
[1] Alan explained that it currently doesn't hold.

Note that I'm not looking at this from a USB topology perspective, but from=
 a
driver model perspective. All I'm saying is that usb::Device<Bound> from th=
e
driver model side means "it is guaranteed that the usb_device is bound to a
usb_device_driver" and therefore can implement functions that rely on this
invariant.

Analogously, usb::Interface<Bound> means that the usb_interface is bound to=
 a
usb_driver. So, if we want to be able to derive usb::Device<Bound> from
usb::Interface<Bound> it must always be guaranteed that this holds, not jus=
t in
the most common case.

As for the question whether it should be

	let dev =3D intf.device();
	dev.bulk_recv();

or

	intf.bulk_recv();

the former does not work if we can't uphold the guarantee that
usb::Device<Bound> follows from usb::Interface<Bound>; at least not without=
 an
additional type state wrapper.

However, I don't see why we don't want to have the helper regardless. A
usb_driver primarily deals with the usb_interface device, so that makes per=
fect
sense from a driver model perspective: The "device" a usb_driver deals with=
 is
the usb_interface.

I think our main disconnect comes from the fact that you see this from a US=
B
stack topology point of view, whereas I see it from a driver model topology
point of view.

From the driver core perspective a usb_interface is just another device tha=
t
happens to have a usb_device parent. Lifecycle wise any device resources
requested by a usb_driver are tied to the lifetime of the usb_interface bei=
ng
bound to the usb_driver.

The semantic relationship of a usb_interface and a usb_device is a USB subs=
ystem
implementation detail, but it doesn't change the core lifecycle and ownersh=
ip
rules as far as the driver model is concerned.

That said, the question of having or not having those helpers is "bikeshedd=
ing"
about USB topology vs. driver model perspective and either seems reasonable
IMHO. However, it has a correctness implication, as giving out
usb::Device<Bound> from usb::Interface<Bound> would currently be unsound as=
 by
[1]; deriving usb::Device<Core> from usb::Interface<Core> is never correct,=
 as
it implies being in the scope of a device lock protected bus callback.

> There simply is no data structure equivalent to the binding of a driver a=
nd an
> interface,

I don't know what you mean by this.

> hence we cannot just give interfaces a state.

Of course we can, and we have to. As mentioned above, from a driver core
perspective a usb_interface is just another device, with an own struct devi=
ce it
embedds, its own device lock and its own driver structure (struct usb_drive=
r) it
can be bound to.

The device types states match exactly this. For instance the 'Core' context
represents a device that is given out in a bus callback while the device lo=
ck is
held, such that we can restrict methods that require this scope to this con=
text.

The same goes for the 'Bound' device context state. In the case of usb_inte=
rface
it means that the usb_interface is bound to the usb_driver.

[1] https://lore.kernel.org/all/0ff2a825-1115-426a-a6f9-df544cd0c5fc@rowlan=
d.harvard.edu/

