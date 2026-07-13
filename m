Return-Path: <linux-media+bounces-67494-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /JyyN/P5VGoeiQAAu9opvQ
	(envelope-from <linux-media+bounces-67494-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 16:45:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B75F374C8DD
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 16:45:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NEqe3vf0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67494-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67494-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8157E3029CFA
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E36A438FFD;
	Mon, 13 Jul 2026 14:44:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D6526F29C;
	Mon, 13 Jul 2026 14:44:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783953871; cv=none; b=AfXATU0Nt10xeoBlXaeZq7mDeJGEfRps2mbdr+i3DTVtXpBiSomGD4SGP6t/lzwuk7DnnsjwAP8w7p5qcI9rOS2WoMw8DgVp3ChL0QFiilPMoYlQyRdqh9d3sRShojT00et4LO06DtzCwk8lyzBNRJiq/ZQw8guhNj+uKq5FWmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783953871; c=relaxed/simple;
	bh=Wi2oIO4KlthMzhdBHCa/zOWzvuPpWi847pDCLSaxheI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=pfvxvav0wNpHys4XlPNwb2QjMpUWQIYdMrOF7kxbAazFjD0HdpCHlTY37O0W2o4t3UvVgnh7As1R3XGPT492EVl+3S3spu1T703PQq12YDAzT06QvaTO8hpszkXfD1N9/9kaSk2NreIVwZqGL0eXRgHcYYiPxo7yyyfDRfV8d7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEqe3vf0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339E71F000E9;
	Mon, 13 Jul 2026 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783953870;
	bh=TJzui1iXfClv4opxUqA+6q+P2kgXyCK8mGf+aPBN15w=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=NEqe3vf0wECpvAehX8BA508mFHxw0Vc+AtEr40n2CwBWIiKY9M5HKEQJdqd1xlMmt
	 EgDYk/hdyBDIigSlvRgafUlNMjplThFerXphRXqe4b3FttoCaLpaKfIBavvLjc32uU
	 xy1J7dsY7IfJypwkgZBgfiq4fYuhIZQfWHGlYthHPLANI34eHyb4aOEMP2Dewt66hL
	 UkV4VFQHRC3NXK/frjsMQIkwccnJlQxyzOD5sq9bCPlaDAKr+Zpgld3CJmzfI8p5kk
	 nA9abuqjtHBhFpeV2SxbxhK/WTD25aCh+ejr2yhz8MStXbrugC93aKVHOcJ9QGsRJU
	 kO3x4WDSa3R6A==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 16:44:24 +0200
Message-Id: <DJXIV7JTU8JG.2U0I0LMHE84NJ@kernel.org>
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
 <linux-media@vger.kernel.org>, "Colin Braun" <colin.braun.cl@gmail.com>
To: "Colin Braun" <colinbrauncl@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 4/4] media: add gv-usb2 audio capture driver
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-4-9fa011634ead@gmail.com>
In-Reply-To: <20260712-urb-abstraction-v1-v1-4-9fa011634ead@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-67494-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:stern@rowland.harvard.edu,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,m:colinbrauncl@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,rowland.harvard.edu,intel.com,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B75F374C8DD

On Sun Jul 12, 2026 at 11:08 PM CEST, Colin Braun wrote:
> +/// Write a vendor-specific control register on the GV-USB2 device.
> +///
> +/// Uses a vendor-type control request (`REQ_WRITE_REG`) to write the
> +/// given `value` to the given `reg` address.
> +fn write_reg(intf: &usb::Interface<device::Bound>, reg: u16, value: u8) =
-> Result {

In addition to raw control messages, this can leverage the generic I/O back=
end
infrastructure, so you don't have to roll your own write_reg() function and=
 use
the register!() infrastructure instead. See also [1] and [2].

[1] https://lore.kernel.org/driver-core/20260706-io_projection-v6-0-72cd5d0=
55d54@garyguo.net/
[2] https://lore.kernel.org/lkml/DJVQ852J7SOH.26YBIJTQ9B66G@kernel.org/

> +    let req =3D usb::ch9::CtrlRequest::new(
> +        usb::ch9::RequestType::new(
> +            usb::ch9::Direction::Out,
> +            usb::ch9::Type::Vendor,
> +            usb::ch9::Recipient::Device,
> +        ),
> +        regs::REQ_WRITE_REG,
> +        u16::from(value),
> +        reg,
> +        0,
> +    );
> +    let dev: &usb::Device<device::Bound> =3D intf.as_ref();
> +    dev.control_msg(&req, None, Delta::from_millis(1_000))
> +        .map(|_| ())
> +}

