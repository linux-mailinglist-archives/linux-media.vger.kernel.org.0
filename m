Return-Path: <linux-media+bounces-67491-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MwquN23rVGrFhAAAu9opvQ
	(envelope-from <linux-media+bounces-67491-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 15:43:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D490A74BC45
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 15:43:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="b/yRq4yF";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67491-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67491-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E4B330C3B68
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 13:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B299D42EEAB;
	Mon, 13 Jul 2026 13:22:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FAE42E00F;
	Mon, 13 Jul 2026 13:22:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948961; cv=none; b=Ya3KTlKUSaV2SGexZjwrQbnp1RefbHLUhhLyL7URMYMencZRBTKb5XQiq4X1eWX+HZNJyaQr+uhBa/E0UxFXLrefnbi7Qr1ZcGptNDoDPTC6113w81CIThpn/ZfSjqYojC9mDKdpYSITkMbVOZHyCJxwXPnZSIDow+vOVUA9CAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948961; c=relaxed/simple;
	bh=jM6e9c+0o75eNSvMophbQ8WJrLMI6Mrq3HnN42o2rqo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=AwO9UW8/YWFY7nWOsvFTPhmBZ4z6FnxE0djOwJ425/pqLJCsyLRvXvGG8ris+hdAQMtJJhX5pIq2BEttrIbKyaVeUBygJbGids3DDhC9ZDvZkGTyvffQ/dVzJHxC4zMbzTpXlBBJ0cqGMGTdchHxaQrvHYM6Dimx92GyqP8umcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/yRq4yF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9DE1F000E9;
	Mon, 13 Jul 2026 13:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948959;
	bh=oN4fj19HlXx2gH9uVU0NktYB1l0CTvjr8ja0mgYRZ7I=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=b/yRq4yFfhFI/VFgrjlcjCvG6J1C292nFVSaKSvG0Y87cCj2pwiXmTpth/btpZQmc
	 WkAYyqlkXeUgIGWfqDI0NeroLdhQf33eBbcfl02BosFiM/8p8Gq+gOFTZHzTm4a9DD
	 sDmjTxKfgRx+EfWh9xgJMZCCPYwW89mJ1wnQXjdOiDt8IRuq9AvU73o76mMyLYmETl
	 ZIUNIj5X3EFMSK30+8WlHOex9v3i7Hs/gJS44EVEcExwZKBWl69hd1shOezktbJFx3
	 j07bJ7sU2E6415ZgTzhMR3Jy2MpggV0JP46c/nd0vP5qYC6FjEXIaJIsrfDhTSDFYX
	 cQ+k6Pv/npM5A==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 15:22:33 +0200
Message-Id: <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>
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
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
In-Reply-To: <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-67491-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D490A74BC45

(Cc: Oliver)

On Sun Jul 12, 2026 at 11:07 PM CEST, Colin Braun wrote:
> @@ -382,8 +556,8 @@ fn as_ref(&self) -> &device::Device<Ctx> {
>      }
>  }
> =20
> -impl<Ctx: device::DeviceContext> AsRef<Device> for Interface<Ctx> {
> -    fn as_ref(&self) -> &Device {
> +impl<Ctx: device::DeviceContext> AsRef<Device<Ctx>> for Interface<Ctx> {
> +    fn as_ref(&self) -> &Device<Ctx> {
>          // SAFETY: `self.as_raw()` is valid by the type invariants.
>          let usb_dev =3D unsafe { bindings::interface_to_usbdev(self.as_r=
aw()) };

Please see commit f12140f21acb ("rust: usb: don't retain device context for=
 the
interface parent").

We can't derive the device context of a USB device from a USB interface. Pl=
ease
also see the device context documentation in [1].

USB device drivers are separate from USB interface drivers, we can't assume=
 that
a USB device is bound to a USB device driver just because a USB interface (=
of
that same device) is bound to an USB interface driver.

The same is true from the Core context, which means the device is in a bus
device callback, where the device lock is held.

This is also the reason why I keep proposing to only expose simple forwardi=
ng
helpers on usb::Interface to implement URBs (see also [2] and [3]).

An URB requires either usb::Interface<Bound> or, for a USB device driver,
usb::Device<Bound>. But since we can't derive usb::Device<Bound> from
usb::Interface<Bound> a simple forwarding helper does the trick.

[1] https://rust.docs.kernel.org/kernel/device/trait.DeviceContext.html
[2] https://lore.kernel.org/lkml/DJRF98V7SMXT.14BS8WGBEESZ8@kernel.org/
[3] https://lore.kernel.org/lkml/24196da3-62e8-4707-8024-d989bcd5d3a8@rowla=
nd.harvard.edu/

