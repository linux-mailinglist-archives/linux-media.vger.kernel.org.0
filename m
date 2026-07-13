Return-Path: <linux-media+bounces-67492-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZlKsEi7uVGqthQAAu9opvQ
	(envelope-from <linux-media+bounces-67492-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 15:54:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 276FA74BEF2
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 15:54:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=Yrb7x8sp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67492-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67492-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DBF73010BFD
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 13:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623FE435EFA;
	Mon, 13 Jul 2026 13:54:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D0A435EDB;
	Mon, 13 Jul 2026 13:54:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783950884; cv=pass; b=pmW/qbanysM6UPPNbL/oCeTTVhYGBiis8yI4FnvOjOfP6E0iZ7A/J0z9wvalBkKeVisRbJpmzXAStL0TVRuVJjd3Dwnn/9WHRvfHQrLzeNxsPLTRhN72yh+Qd64qj7/rW/hCi7YaCtU1d4qUorwkCzRHi2L8jmxgpq4F2fL1qZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783950884; c=relaxed/simple;
	bh=7W4YfR6ydyEuBtwaBf80fZd2tB4FEvjgV4IX2l+KzzU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DcwqHLAHdsgK80Ya9Kjn3LS1C4rzulsFA6q8g3ZYTosKzfUFByrg1O3c5vqXmzfY15TS7Ppqr7QKG3PCOF7LNRjaSXU3+9OoND7nIOeIWv0qJ0t5qMVstdDppVZ6tuVfQ1/i8OHAkjyUEMAV+scq1bTgpnYlXbdt8U9dEGkiC0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Yrb7x8sp; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal: i=1; a=rsa-sha256; t=1783950856; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cOxylWnyogYgeVK0wKQbZ+nL2obViCTsaacfxNWqF99mBJzZzzt2kdewTTlnmwLY4ItRK+Ln9AZbwbCxLkIZHWNcOROlczs6FjbLqw9aGmPAs1NAhLZhv2OT4b10cyGgmHkMb71bpICGeK208qrJvcEusvD8skrwW2qdgeWsw9w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783950856; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Rfpe2S+/qHsS5TmklPOnS8nF/Q0xmFqrcx26dB72c40=; 
	b=C1aESQB8L6dstHKQxkNyKIr4GbaVMEYG7tjpxAweB/gct80TJYZoC0/WyyJSORpCIysy3vxsD6AP1tQuNIBIpftuI+kVWPr/LKpsspXpNvGuu6Nz6sDwZd/YUrW4x1x+bwrSlvWtbB9RXohRoY4zyld8J4PvbP/5rar6hJTz/qk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783950856;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=Rfpe2S+/qHsS5TmklPOnS8nF/Q0xmFqrcx26dB72c40=;
	b=Yrb7x8sp43Ze68AfTYzuhIa8YFjZWyV3uhte6tpjRzFCFdBZyzT9r2c83N0DRoqB
	Ix1EcoJssmuDH3MfBQ7dbUs8GVHi/JAUFgF0LCqSoxOrUlqMQFSEDWlvfnjLYGiGjiK
	oTxpcslz2ckImhJi/SmsMuOwLZKzion/feI20syM=
Received: by mx.zohomail.com with SMTPS id 1783950853920887.4408743552947;
	Mon, 13 Jul 2026 06:54:13 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [RFC PATCH 0/4] rust: usb: add usb request block abstractions and
 a user
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
Date: Mon, 13 Jul 2026 10:53:53 -0300
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
 Colin Braun <colin.braun.cl@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1E924102-5CC7-427A-9FD0-3B15BA1BEAEB@collabora.com>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
To: Colin Braun <colinbrauncl@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-67492-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[daniel.almeida@collabora.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:mchehab@kernel.org,m:stern@rowland.harvard.edu,m:mathias.nyman@intel.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-media@vger.kernel.org,m:colin.braun.cl@gmail.com,m:colinbrauncl@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,onurozkan.dev,rowland.harvard.edu,intel.com,vger.kernel.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	APPLE_MAILER_COMMON(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,collabora.com:from_mime,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 276FA74BEF2

Hi Colin!

> On 12 Jul 2026, at 18:07, Colin Braun <colinbrauncl@gmail.com> wrote:
>=20
> This series introduces initial abstractions to allow for the
> implementation of USB drivers in Rust.
>=20
> This is an RFC to demonstrate a rough idea on how the USB abstractions
> needed to create drivers in Rust could be implemented.
>=20
> The series is broken up into 4 parts:
>=20
> 1. USB chapter 9 standard descriptors and constants - Exposes the
>   necessary structs and constants from include/uapi/linux/usb/ch9.h as
>   a new ch9 submodule.
>=20
> 2. Interface and endpoint abstractions - Wraps the relevant C structs
>   and functions defined in include/linux/usb.h, allowing drivers to
>   safely query and configure interfaces and their endpoints.
>=20
> 3. USB Request Block (URB) abstractions - Creates a safe wrapper =
around
>   the C `struct urb` to allow Rust drivers to communicate with =
devices.
>=20
> 4. An initial user of the new abstractions - A driver for the GV-USB2
>   composite-usb video capture device.
>=20
> Patch 3 is the bulk and core of this series. By their asynchronous
> nature, creating a safe URB abstraction for drivers to use is tricky.
> The goals of the URB abstraction are:
>=20
> 1. No `unsafe` needed in driver code. This means providing a way for a
>   driver to safely access private data sent with the URB.
> 2. Drivers are forced to handle the URB status in their completion
>   callback before accessing the URB data.
> 3. Dropping an URB ensures it is not in-flight and frees its =
resources.
> 4. The URB can be safely resubmitted from the completion callback.
>=20
> The patch elaborates on how these goals are achieved in more detail.
>=20
> Although the URB abstractions do not include immediate support for =
bulk
> or interrupt URBs, I believe it creates a foundation conducive to
> future, safe abstractions for them.
>=20
> Patch 4 is first user of these USB abstractions. The initial
> implementation is very much bare-bones, only exposing audio data via
> debugfs. It is based on the in-tree STK1160 driver and an old,
> out-of-tree driver written by Isaac Lozano [1].
>=20
> [1] https://github.com/Isaac-Lozano/GV-USB2-Driver
>=20
> Signed-off-by: Colin Braun <colin.braun.cl@gmail.com>
> ---
> Colin Braun (4):
>      rust: usb: add USB ch9 standard descriptors and constants
>      rust: usb: add usb host interface and endpoint abstractions
>      rust: usb: add urb abstraction with control and isochronous =
support
>      media: add gv-usb2 audio capture driver

Have you talked to the media people about adding a Rust driver?

>=20
> drivers/media/usb/Kconfig            |   1 +
> drivers/media/usb/Makefile           |   1 +
> drivers/media/usb/gv-usb2/Kconfig    |   9 +
> drivers/media/usb/gv-usb2/Makefile   |   1 +
> drivers/media/usb/gv-usb2/driver.rs  | 361 ++++++++++++++
> drivers/media/usb/gv-usb2/gv_usb2.rs |  16 +
> drivers/media/usb/gv-usb2/regs.rs    |  25 +
> include/linux/usb.h                  |   4 +
> rust/kernel/usb.rs                   | 905 =
++++++++++++++++++++++++++++++++++-
> rust/kernel/usb/ch9.rs               | 295 ++++++++++++
> 10 files changed, 1613 insertions(+), 5 deletions(-)
> ---
> base-commit: 30e873dd61b044092dbc657c7c67a5d19adfd933
> change-id: 20260712-urb-abstraction-v1-020a67f16cff
>=20
> Best regards,
> -- =20
> Colin Braun <colin.braun.cl@gmail.com>
>=20
>=20


