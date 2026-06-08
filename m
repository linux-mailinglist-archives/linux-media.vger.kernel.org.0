Return-Path: <linux-media+bounces-64232-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rKICJN8GJ2qvqQIAu9opvQ
	(envelope-from <linux-media+bounces-64232-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:15:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 075FF6599A6
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:15:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="kUHCV6/e";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64232-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64232-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E43A531E112B
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 17:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328713D47C2;
	Mon,  8 Jun 2026 17:59:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB3E30E82C;
	Mon,  8 Jun 2026 17:59:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941587; cv=none; b=ZI1YSRuPBVZI8VpmM/8MrbX2Ex7coZhY5xHtUDQyVN8JCM2sSBbOkXbIkmI26YV0I1AsaO4cg1nQ6Esb/jJZ+gYw/YlWpj+HWmf4tkPOemQ+dSChqrQL/np+elBDPicpgWHjhZhkhOAzSNs9EEp6pr0Q9wtlU9QzBFroPy0Zaqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941587; c=relaxed/simple;
	bh=q2JqATLztu+mIBVuhWa8EiLN1hz2Egk+EZOysl2E1h4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=BsGpLDKu03Ruk0JRdAcLjuwFPJF71gmauyCcAlFrtkzvSoJXw2nZrZvkm2eiClZftHE2AwNXLkB9KAf730lHMoDjYl46LabWdWdattM9yz6AMyjhvVWhtm/SOwp/hQOwBvi244Rb8f91eZOQ7A4GnkR8w36F7wLCftzA9hO3Q4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUHCV6/e; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637D81F00893;
	Mon,  8 Jun 2026 17:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780941586;
	bh=q2JqATLztu+mIBVuhWa8EiLN1hz2Egk+EZOysl2E1h4=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=kUHCV6/ezHm16sVuomaCS9gJrTOweRjwt3q9+UtmWmTxStpGTivrtB1eWFoPeGTRi
	 Rt1rYLWtTlbygc6r7E1o3j234o8PH7MkGBgbgDrmb3oMAWu57Xq+WFIXYJFoGCXoHz
	 VG120l533CGIe9Tkjbe4fVAGbgJvzkL1Qt+LyOR+ZMdECbY9d39OTW+ylMga4MxFSD
	 uaUXJq43RAMak/XdyjRKHviGfGTs5m1vA4QyIffN3ZFbGQJj+e98O+u4y2LZoSS2Vq
	 DCjTk+LOp3hVUTmJdiV0VL7NqiQmGRZORKd1d4EHF75sMs3UTPKN6PMViSfZpfdKjj
	 KCZTTCkCOaOPg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 19:59:42 +0200
Message-Id: <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
To: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
Cc: <phasta@kernel.org>, "Sumit Semwal" <sumit.semwal@linaro.org>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <dwlsalmeida@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20260608142436.265820-2-phasta@kernel.org>
 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
In-Reply-To: <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-64232-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 075FF6599A6

On Mon Jun 8, 2026 at 7:34 PM CEST, Christian K=C3=B6nig wrote:
> That's why we need the RCU grace period to make sure that nobody is
> referencing the driver stuff any more.

Right, and that's what Philipp tries to address, the requirement to wait fo=
r an
RCU grace period is perfectly fine if it is only about freeing memory, but =
it
can become painful if the fence private data contains data also needs to be
destructed in some way.

IOW, if a driver signals a fence, it is lifecycle-wise reasonable to destru=
ct
the private data that is no longer needed (remaining users only deal with s=
truct
dma_fence) and having to wait for a full grace period adds sublety and
complication that can be avoided with the proposed approach.

That said, I'd like to ask the opposite question: What are the concerns wit=
h the
proposed approach over (pure) RCU?

