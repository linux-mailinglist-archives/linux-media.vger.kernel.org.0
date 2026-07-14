Return-Path: <linux-media+bounces-67585-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J0PaCs2GVmrl8AAAu9opvQ
	(envelope-from <linux-media+bounces-67585-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 20:58:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EC1757FEC
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 20:58:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bjBSyw3W;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67585-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67585-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6CB33018AAE
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 18:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997D1417BDE;
	Tue, 14 Jul 2026 18:58:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17FA377AB4;
	Tue, 14 Jul 2026 18:58:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055485; cv=none; b=FG0a8CU97z+cWdYpYEy9eDx7BiKXxy5jYHrr/E5w+JzuIiaiAaMfeikr8SmVZQbG47rtwFzRoH9yWhy3fICp/AIUEcobGZybMDteotwQrdJIzo7BX2wHzJb6dVeGi5Npq8ozKlCoEIyD7yI7aRROYA1F2pW8kHl6m8wp2+RzV+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055485; c=relaxed/simple;
	bh=8QnLKMJTb0BaoNd3LZ/kg0lldXZADKQy/ehAaTqWQGg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=kuRV/jzWo30ssoCM/9kbms/nTIx/XzDakQ2mmrFYcVXj3n8nUrrhV4bv0l2moGdz7dIjte1xqJZu1JRi4y5uk8QCsb+s5JGQWLOmbJu75BHJXEALwfzLjdttIWkBsRso9et5vz0dlIUZjYeoz/xNFImYPgEEHUJk0hDOhf4utFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjBSyw3W; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B31F1F00A3A;
	Tue, 14 Jul 2026 18:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784055483;
	bh=8QnLKMJTb0BaoNd3LZ/kg0lldXZADKQy/ehAaTqWQGg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=bjBSyw3W5Vr1udvBdO1zXH69HXbUIbp5D+eeNohhNwTkY2cfw1SiKO4kvDfe0fIWC
	 +ty9aXMclaqj452VsgXY1y6Sor1W23vZAmUkJBfB1NpsjlEQASvR9UvmfDbewaL4yk
	 ThGHuIS3vfZzMNtR9ni91IGZ3/SKmA5KP4BnXoFUc+DbSG2mlud9hPCcWdcaWgNYZf
	 kuJTW3RjhFnmc9/FIU8N79eW5hyGlN1mcubdW13M9EQbA05PtLhOlnQZ2MKpAd/cSC
	 1R+WOoD7CpwW85geKJoviI7oIg8QN8obYyWClGa79q3OQPPXfY/GT65NDBifXPbyWR
	 7Qk+TUw8bs0Dg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jul 2026 20:57:57 +0200
Message-Id: <DJYIVVQAQANH.3GIU2U9D08BKS@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Cc: "Alan Stern" <stern@rowland.harvard.edu>, "Colin Braun"
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
To: "Oliver Neukum" <oneukum@suse.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
 <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
 <018687f9-a7ba-4e30-bb3c-25ea6b8f172b@suse.com>
In-Reply-To: <018687f9-a7ba-4e30-bb3c-25ea6b8f172b@suse.com>
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
	TAGGED_FROM(0.00)[bounces-67585-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:stern@rowland.harvard.edu,m:colinbrauncl@gmail.com,m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,m:rafael@kernel.org,m:driver-core@lists.linux.dev,m:oneukum@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[rowland.harvard.edu,gmail.com,kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,intel.com,vger.kernel.org,lists.linux.dev];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28EC1757FEC

On Tue Jul 14, 2026 at 8:48 PM CEST, Oliver Neukum wrote:
> On 14.07.26 19:53, Danilo Krummrich wrote:
>
>> Many APIs rely on this, as in they only guarantee valid behavior when ca=
lled
>> from a scope where the device is guaranteed to be bound to a driver, or =
IOW
>> where a driver can prove that it actually operates the device.
>>=20
>> Drivers must only acquire device resources when they are actually bound =
to the
>> corresponding device, and must hand them back before the device is unbou=
nd. The
>> devres API, for instance, exists for this fundamental reason.
>>=20
>> For instance, we can't have drivers manage IRQs, mess with I/O memory, p=
rogram
>> IOMMU page tables (e.g. through DMA APIs), etc. for devices they are not=
 bound
>> to and hence are not allowed to operate (anymore).
>>=20
>> Those device resources all have a lifetime that is tied to the lifetime =
of the
>> device being bound to a driver.
>
> Understood. Unfortunately this does not map straightforwardly to the USB =
API.
> Usbcore tells a driver via corresponding opeations when IO has to cease
> (and other operations should be performed) and when it is allowed again.

Everything regarding other device resources, such as DMA mappings, IRQs, et=
c.
still applies.

Regarding USB I/O APIs, what you describe sounds like an additional constra=
int,
where the usbcore tells the driver when I/O operations are allowed within t=
he
bigger window of the driver being bound.

This additional constraint can be modeled with additional USB specific type=
s
that limit the scope to those specific operations.

For instance, it could be a new type around e.g. a usb::Interface<Bound> th=
at
implements the corresponding accessors and is only given out with a lifetim=
e
spanning those operations.

