Return-Path: <linux-media+bounces-67513-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nuspKwhGVWpjmQAAu9opvQ
	(envelope-from <linux-media+bounces-67513-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 22:09:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D3574EF7F
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 22:09:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DVgW+o6l;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67513-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67513-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 96059300E91C
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 20:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F58235C1BD;
	Mon, 13 Jul 2026 20:09:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9443382F4;
	Mon, 13 Jul 2026 20:09:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973371; cv=none; b=eX4QibyO1DbfIMtZMOAJRUiZL2WFkkv/I1RQfUudxzqJbFEWZaRm8TCMQLG8AzPjXK9Jl8i3+xh7m0snFadorX8qDGs/eJUUTzWcmLgePK+UoOw4FA1zF3DH2LQdR20qhSL0bFBJS0JJK1KfTbTqgxb35Yf2Iqke4yezGpnBAdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973371; c=relaxed/simple;
	bh=mss/B+cZ1HdpgFx6u4/LPmRMnN2jEzZGgXXzH7XVLKw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=aLwlid79gIpObVW5RmezPKpFk0DJodKUwdT9UJTxcvht7SEYzyTwk43yZOAvhB+uaIQOaj4TvOWupjh4tLyR8OrviLBqHZFyyWFx3IfeGh1YklyWwhidjGSQMOq5izQX4gMT359K5ecFueoN/mB0KvhG66n8UNMP4X7ar7UwKAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVgW+o6l; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBD31F000E9;
	Mon, 13 Jul 2026 20:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783973368;
	bh=VTPpDn/Xcj1Tl5BJcGDkfSf33jZdlkZD65YlmnFb1kg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=DVgW+o6l3gJwfvvKtHIJtCKCtGuFQU7aWxPe/3dmQDQyRDsnEc8QbDUJyptMj4PGH
	 LherIhJaiz7r+Bhz4nE2M3xUv1B4M8wQ2EO9pJH6fk6WQPN3cLMPTZrFAgvXO6eSIB
	 dBv69f0Ag3Jr/l/SqPYitkOr+LNi27EQqzpuleqQsMPzz1yYbEhOdFcP0ZVTSXZbCO
	 rqwhvwnYf78ObNsId/QslVgwVYKblWKpXVw+Qns+0eNIrJUIckfCFssNkv0V0ptw8Z
	 vrfGt8guQG2+dYx4rHbH2W7D8vBtKDqVd30OtX0VQMEzYSJctGcO82/HcXnP7MxF4D
	 O+55XHAvJGKTg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 22:09:21 +0200
Message-Id: <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Alan
 Stern" <stern@rowland.harvard.edu>, "Mathias Nyman"
 <mathias.nyman@intel.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <linux-media@vger.kernel.org>, "Colin Braun" <colin.braun.cl@gmail.com>,
 <oneukum@suse.com>
To: "Colin Braun" <colinbrauncl@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
In-Reply-To: <alVEUR0JrF1ga3S8@pendragon>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-67513-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:stern@rowland.harvard.edu,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,m:oneukum@suse.com,m:colinbrauncl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,rowland.harvard.edu,intel.com,vger.kernel.org,gmail.com,suse.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6D3574EF7F

On Mon Jul 13, 2026 at 10:03 PM CEST, Colin Braun wrote:
> On Mon, Jul 13, 2026 at 03:22:33PM +0200, Danilo Krummrich wrote:
>> (Cc: Oliver)
>>=20
>> On Sun Jul 12, 2026 at 11:07 PM CEST, Colin Braun wrote:
>> > @@ -382,8 +556,8 @@ fn as_ref(&self) -> &device::Device<Ctx> {
>> >      }
>> >  }
>> > =20
>> > -impl<Ctx: device::DeviceContext> AsRef<Device> for Interface<Ctx> {
>> > -    fn as_ref(&self) -> &Device {
>> > +impl<Ctx: device::DeviceContext> AsRef<Device<Ctx>> for Interface<Ctx=
> {
>> > +    fn as_ref(&self) -> &Device<Ctx> {
>> >          // SAFETY: `self.as_raw()` is valid by the type invariants.
>> >          let usb_dev =3D unsafe { bindings::interface_to_usbdev(self.a=
s_raw()) };
>>=20
>> Please see commit f12140f21acb ("rust: usb: don't retain device context =
for the
>> interface parent").
>>=20
>> We can't derive the device context of a USB device from a USB interface.=
 Please
>> also see the device context documentation in [1].
>>=20
>> USB device drivers are separate from USB interface drivers, we can't ass=
ume that
>> a USB device is bound to a USB device driver just because a USB interfac=
e (of
>> that same device) is bound to an USB interface driver.
>>=20
>> The same is true from the Core context, which means the device is in a b=
us
>> device callback, where the device lock is held.
>>=20
>> This is also the reason why I keep proposing to only expose simple forwa=
rding
>> helpers on usb::Interface to implement URBs (see also [2] and [3]).
>>=20
>> An URB requires either usb::Interface<Bound> or, for a USB device driver=
,
>> usb::Device<Bound>. But since we can't derive usb::Device<Bound> from
>> usb::Interface<Bound> a simple forwarding helper does the trick.
>
> That makes sense, thank you for pointing this out. I should have taken a
> look at the git log for that line to try to understand its background.
>
> I'll remove the usb::Device<device::Bound>::set_interface() and
> usb::Device<device::Bound>::control_msg() implementations in my next
> revision (since they will no longer be used) and just implement them on
> usb::Interface<device::Bound>.

I'd keep them unsafely on usb::Device and then safely expose forwarding via
usb::Device<Bound> and usb::Interface<Bound> once required.

