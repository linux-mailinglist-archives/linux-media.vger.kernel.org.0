Return-Path: <linux-media+bounces-67580-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g6pxDpp4Vmq76QAAu9opvQ
	(envelope-from <linux-media+bounces-67580-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 19:57:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC6F757A9E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 19:57:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="QKLP/USo";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67580-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67580-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB62131B39E5
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 17:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B55F31F9B7;
	Tue, 14 Jul 2026 17:53:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0202EB5B8;
	Tue, 14 Jul 2026 17:53:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784051592; cv=none; b=DBnqP6rrPqm0TfsB9ZTKbap6BPaeMpm2bHKHgMrIlZo3lWBjCLQ6/ZRKJcvwcKL5GxPPPAe5LogDWr3Xj8rUFf0A6MK3TvX9p7dFaGGz9GfleMw7DZm54P+zByUV+Et1jmMpp9vl9D+0pf8xctHGjYkvRdP19TWvLaJGDlXE8+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784051592; c=relaxed/simple;
	bh=tAmRuwe4iOiZT6cYgNdW2yQayZgtadz1k07EyAMjkzs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=bzEqVeUUKMbi3eE47a0PmjhKZpH0JB+39u02wmxkREAKN+iEpnG75uaRneRPgGhMSjm7XZkclXsEIaJ3a7OoLA1DI+Nz+60AGQSoxlmY9HV7NZ5aPmlT8hKFIUoc5VabOMh4R1+7HvBtZnhi08GRsqYVrW8Twqqj6+zBgF1zf+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKLP/USo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33C71F000E9;
	Tue, 14 Jul 2026 17:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784051589;
	bh=fo4ZCxgBFuMzvv8i+e0hgQz7BHe+qOPEpLPG7BxIRjo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=QKLP/USoaDZQRALN2GqyPg7rpQJZEJLlGfakooKdTCqcfJgRnsFVZZm5ffeC5wBIu
	 FwuUZpuM+hr6OGA5Ltfsg+Js7hrmu6CQAqHMobIpgc1Y00Nucqf5Dm+Ip9ZIpBUWyQ
	 7ZmKsm8CE60AygzxIZkzp5k5u2UCRcS6H9BaYY2ivLecPdovJzsdqzalBfLE0t5G+t
	 dccwmjPP1xdmB8eJYiRPS/5skhlXjezkI6T9+WIrBbgl9hbPUPZ7Vi5DF8rw/BYJuk
	 r74Nf0ZwCX4FqoHL27lsky7LQQp9hh2tzBnABa/fy0iu8Ory6c3vh559LoZ64yjcHz
	 1kt1lvN3FNJlw==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jul 2026 19:53:03 +0200
Message-Id: <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Cc: "Oliver Neukum" <oneukum@suse.com>, "Colin Braun"
 <colinbrauncl@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Mathias Nyman" <mathias.nyman@intel.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-media@vger.kernel.org>, "Colin Braun"
 <colin.braun.cl@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <driver-core@lists.linux.dev>
To: "Alan Stern" <stern@rowland.harvard.edu>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
In-Reply-To: <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[suse.com,gmail.com,kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,intel.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67580-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:oneukum@suse.com,m:colinbrauncl@gmail.com,m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,m:rafael@kernel.org,m:driver-core@lists.linux.dev,m:stern@rowland.harvard.edu,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FC6F757A9E

(Cc: driver-core)

On Tue Jul 14, 2026 at 6:26 PM CEST, Alan Stern wrote:
> I don't see why Rust needs to distinguish between a USB device that is=20
> bound and one that is unbound.  There isn't much you can do with one=20
> that can't be done with the other.

It has nothing to do with Rust, those driver lifecycle rules exist regardle=
ss
and they are present universally, including in C.

The only difference is that in C all the responsibility to enforce them is
usually on the driver -- e.g. by creating, destroying and calling things in=
 the
correct order in probe() and remove() -- and a lot of drivers have bugs in =
this
regard as a consequence.

With Rust we can enforce those rules with the help of the type system at co=
mpile
time; device context states are a part of that.

> Similarly, I don't see why Rust needs to distinguish between an=20
> interface that is bound and one that isn't.
>
> Even from the point of view of the device core, a device that is bound=20
> to a driver is the same kind of data structure as one that isn't bound;=
=20
> the only difference is whether the ->driver pointer is set.

This is a huge understatement.

The state of a device being bound to a driver defines which entity (i.e. wh=
ich
driver) is in charge of operating the underlying device, and thus defines w=
ho
owns the device (associated) resources.

Many APIs rely on this, as in they only guarantee valid behavior when calle=
d
from a scope where the device is guaranteed to be bound to a driver, or IOW
where a driver can prove that it actually operates the device.

Drivers must only acquire device resources when they are actually bound to =
the
corresponding device, and must hand them back before the device is unbound.=
 The
devres API, for instance, exists for this fundamental reason.

For instance, we can't have drivers manage IRQs, mess with I/O memory, prog=
ram
IOMMU page tables (e.g. through DMA APIs), etc. for devices they are not bo=
und
to and hence are not allowed to operate (anymore).

Those device resources all have a lifetime that is tied to the lifetime of =
the
device being bound to a driver.

Consequently, any asynchronous scopes such as IOCTLs from class device
registrations, IRQs, work queued on workqueues, etc. must all be synchroniz=
ed in
some way such that those asynchronous scopes do not access device resources=
 that
have already been destroyed on driver unbind.

Or in other words, they must be synchronized against the "bound" scope, whi=
ch is
exactly what the Device<Bound> type state in Rust represents.

So, again, all those lifetime rules around the driver lifecycle exist
universally, it's just that in Rust we enforce them through the type system=
.

For instance, tying it back to USB, we don't want that a usb_driver still m=
esses
with a usb_interface, e.g. initiating transfers after it has been unbound f=
rom
the interface and hence must not operate it anymore. This can easily happen=
 if
e.g. a class device registration is not properly synchronized and the drive=
r
still receives IOCTLs after driver unbind. In Rust we know through the "Bou=
nd"
type state which scope provides the guarantee that the device is still boun=
d,
such that mistakes like this become impossible.

