Return-Path: <linux-media+bounces-67602-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nCUlB0XyVmpqDQEAu9opvQ
	(envelope-from <linux-media+bounces-67602-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 04:36:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F6075A146
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 04:36:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=X40AoUZd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67602-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67602-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1E5D30254AF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 02:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86EFB3A873A;
	Wed, 15 Jul 2026 02:36:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF4F25776;
	Wed, 15 Jul 2026 02:36:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784082995; cv=pass; b=VUh5E+Kpx/fv9SZKW3E1uhfv7iQyoDnopBlKT+SebV4u6rpSQhlA57l3JAET9affkY9GhJ+8rMTeGsXoJ8AmkRFybCMOR/0ZiREfMZjjsyzwU48KUem3OFKUM+Gm0eFAW/ZcXS9HE5IYZyZbqYnJ8OlXnwA2LLFecHqvw+vQnd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784082995; c=relaxed/simple;
	bh=CCCoBKWdYOZIqsZgs6d6JT73LJGIMyFaB4POVbHF6tk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=bXoNkeJ6PbSl8Xmgws+pb50BCFv67/zdY5Za5omn2Mp2kiiB3eNMwI+SmjSFTyOQ6m+f9tvl+6nnVzzPRraadBvBzJlMCWkIGrDnl5UlD1TxCtZI8MNO1NhuwY4BtdW3ZcLyZRCQRYwOigXXG05XSx6tMmDajWMSt4hspY5zL7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=X40AoUZd; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal: i=1; a=rsa-sha256; t=1784082971; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EDMJI5+Zxodtl29AzYLlxHF57BTQIVOnpBYHfLqeaaKfm4KN402UVrwnQ6z58zUD2cfzR6Wo+K5qm2Wf8H614lVlHMBRPYDVKK0836cBgOFPhh4/I/xSjNlPDZUsVBcjCCtb+9sbR/75Stjze82gUR2pQ3S0Vce85fjNrmEX7xc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784082971; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CCCoBKWdYOZIqsZgs6d6JT73LJGIMyFaB4POVbHF6tk=; 
	b=UEmXXmSGthgKtaAlykKaIpMraEpboC50k978gJBOQSgrS8SrLOW7jGGaoJdmweOk3iTqAzNsp9arabgrxuHnPXQa2VEbYH6IrKa4kSDUkvHlFWn/1XrK2uvDSoWAZIF4+1t2LvPv8+D9iLIZrNDmDfIEx/x6xxGWAaE+1k27Uo0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784082971;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=CCCoBKWdYOZIqsZgs6d6JT73LJGIMyFaB4POVbHF6tk=;
	b=X40AoUZdJrMD6AA+fIConpeuYtY+IfQs3BgFWVGlwjjTTigymnkm/P4FHOq4GOYZ
	UIY/qPO7nlqzKY25ii63TsxVQuV7aHoiTU1NiqGDF/3153D4MhYihznqgM6Na0F8752
	6vmttJ+ULPVtsj7fJ+eanxiJT0uKI1wq06qu95Mw=
Received: by mx.zohomail.com with SMTPS id 1784082969609978.1531201799045;
	Tue, 14 Jul 2026 19:36:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [RFC PATCH 0/4] rust: usb: add usb request block abstractions and
 a user
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <alVGanOux7SJ5dpM@pendragon>
Date: Tue, 14 Jul 2026 23:35:50 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Mathias Nyman <mathias.nyman@intel.com>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org,
 Colin Braun <colin.braun.cl@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0CCB6F69-1336-4254-AE1A-5DDC63BCA7B1@collabora.com>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <1E924102-5CC7-427A-9FD0-3B15BA1BEAEB@collabora.com>
 <alVGanOux7SJ5dpM@pendragon>
To: Colin Braun <colinbrauncl@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:stern@rowland.harvard.edu,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,m:nicolas.dufresne@collabora.com,m:colinbrauncl@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67602-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,onurozkan.dev,rowland.harvard.edu,intel.com,vger.kernel.org,gmail.com,collabora.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	APPLE_MAILER_COMMON(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78F6075A146

Hi Colin,

> On 13 Jul 2026, at 17:32, Colin Braun <colinbrauncl@gmail.com> wrote:
>=20
> On Mon, Jul 13, 2026 at 10:53:53AM -0300, Daniel Almeida wrote:
>>=20
>> Have you talked to the media people about adding a Rust driver?
>>=20
>=20
> I have not. I was actually wondering if this belongs in
> drivers/staging/media, given how much work still needs to be done for =
it
> to support basic functionality. I had seen some v4l2 Rust abstraction
> work done but not merged in, so I had hoped this could eventually be a

Yep, I was behind this for a few years, in a few different ways.

> user of that work. Still trying to get a lay of the land, this is my
> first attempt at contributing to the kernel.
>=20

I=E2=80=99m cc=E2=80=99ing my colleague Nicolas. He was at the media =
summit this year
discussing a topic somewhat related to Rust.

IIUC, the consensus is unfavorable for Rust media drivers at the moment. =
They
are waiting for more progress on gcc-rs before allowing it, as clang =
does not
fit some of their infrastructure.

This doesn't have to discourage you from this work, though. Last I spoke =
to
Greg, I think he was OK with having enough infrastructure to build a =
Rust
version of usb-skeleton.c. You could perhaps work on that? I never =
really found
the time to, but I can chime in with reviews. It's always nice to =
onboard new people :)

As Danilo pointed out, there is a competing implementation, though that =
seems
to be completely AI-generated, IIRC. Perhaps Mike would be interested in
letting you take it over? It's already a lot of work on their plate to =
do
hardware RE + KMS + usb, so you could work together instead.

Just a suggestion, of course.

-- Daniel







