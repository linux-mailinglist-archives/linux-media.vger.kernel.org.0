Return-Path: <linux-media+bounces-52218-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBcKO1+wg2l1swMAu9opvQ
	(envelope-from <linux-media+bounces-52218-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 21:47:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59398EC8FD
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 21:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED415301F4AE
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 20:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A66438FFB;
	Wed,  4 Feb 2026 20:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=loescher@gmx.de header.b="OLatA9JM"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1029C438FF0
	for <linux-media@vger.kernel.org>; Wed,  4 Feb 2026 20:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770237985; cv=none; b=GmYhsd0pGib+fdWt6i1CsA2M+LPFnFh2oS31HW89LoGcYbiCmLym+9ufHnLLXg8ix9eR589KzhzhgygXHegxhwfLLZbyA/rWBR9JAbrQtgbbIVsxSZjtlfnYgsXNBsjDQRfk92m+5JzxrhTSxU7pmoZJsUiwaHBvuSZWpzoK35I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770237985; c=relaxed/simple;
	bh=cJZXNrFIt22PZuLwNSx4KHCLYyYDgQUtQBRGNlq4les=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=tH0jzSXNpYUf/5yVUgEPtUolj2ybbl7YMP7bvk6NfUxJidN1Itqt4XhTEUy1O2DXJamR8mWOxmNqDsjUIVQJrwggnV39Gkh3YG11z4UZ7Vhx/L6x8a8pXEHman011DZaawhB66dXRv5kFpIldOFMuZFU3EKL3yz0ezwg7f/fSFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=loescher@gmx.de header.b=OLatA9JM; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770237983; x=1770842783; i=loescher@gmx.de;
	bh=cJZXNrFIt22PZuLwNSx4KHCLYyYDgQUtQBRGNlq4les=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OLatA9JMmgrLqnNqILOU6/Ky6J7VAg/axbEkME/Eh6Oe8tbzM2fJ047zucyqxWx+
	 OwNgSxg2Q5bgb+aKi8Si+hE/g7RtXCNgREmSV3FdQ17jmg5gG7c8q3mBh+2iUTXmX
	 GJQkdTFhtMlHRYOUjAO3O1k39pewtzL46vqbUuOebYgzd8Ln03jOyVOgBc2P01mUm
	 SqrhKl5ZjW3z7Zw19b2EdS4Uh3q5G3oasp59nc66bYygBMHwfL6aWigPWNV9ZimMm
	 u39psPgF0tCL5XNru5eMg+E28X6/eHfaLVHJcRujIjhxrqS6mePz3RSxvDs7dK6V/
	 Qy0MM+Z8KzGMtuF0jQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.212] ([87.123.36.164]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ3t-1wJNoA0eWL-00JevN for
 <linux-media@vger.kernel.org>; Wed, 04 Feb 2026 21:46:23 +0100
Message-ID: <871426e6-e371-47b2-945a-2ddbc873c371@gmx.de>
Date: Wed, 4 Feb 2026 21:46:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: linux-media@vger.kernel.org
From: Stephan Loescher <loescher@gmx.de>
Subject: cinergyT2-core.c - Fix remote key stroke hang
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:D+Q4tvZjDnJFmcYQ5G4OoaDLsyFb7PUo6nDx7NCZEtch/ghFz3Y
 1lQ2NSCZEoGm24jbcQqzVZaYIZTbBTVYpIJYKSwCQnt/OLf8m5PGb0ya1XINVC/ITseG4ls
 Q0q+MNAC7RnbKHKSZCx/pn323oWBB3dGzKKnGj4YNgogKgcDh7nYpXTpTkFSi3mwblZBk9e
 YEY5WoR8RHqXvcP+ZJWfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+0W2zRbi8pQ=;QtNvcErexidpolRwaI+l+0ZFAlm
 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
 pGyDU6/ganWLWRxY8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52218-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmx.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmx.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loescher@gmx.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 59398EC8FD
X-Rspamd-Action: no action

RGVhciBMaW51eCBkZXZlbG9wZXJzLA0KDQpNeSBmaXJzdCB0cnkgdG8gc2VuZCB0aGUgcGF0
Y2ggd2FzIG5vdCBzdWNjZXNzZnVsIGFzIGl0IHNlZW1zLCBzbyBJIHRyeSANCml0IGFnYWlu
Lg0KDQpJIGhvcGUgSSBmb3VuZCB0aGUgcmlnaHQgd2F5IHRvIHJlcG9ydCBhIExpbnV4IEtl
cm5lbCBidWcgZm9yIHRoZSBmaWxlDQpkcml2ZXJzL21lZGlhL3VzYi9kdmItdXNiL2NpbmVy
Z3lUMi1jb3JlLmMNCklmIG5vdCwgcGxlYXNlIHRlbGwgbWUhDQoNCklzc3VlIGlzOiBJIGhh
dmUgYSBUZXJyYXRlYyBDaW5lcmd5IFQyIGFuZCB3aGVuIEkgcHJlc3MgdGhlIFVQL0RPV04v
DQpMRUZUL1JJR0hUIGJ1dHRvbnMgb24gdGhlIHJlbW90ZSBjb250cm9sLCB0aGlzIGtleXBy
ZXNzIGlzIHJlcGVhdGVkDQplbmRsZXNzbHksIHdoaWNoIEkgY2FuIHNlZSBpbiBldnRlc3Qu
DQpJIG1hZGUgYSB3b3JrYXJvdW5kIGZvciB0aGlzIHdpdGggdGhpcyBsaXR0bGUgcGF0Y2g6
DQoNCi0tLSBvcmlnL2RyaXZlcnMvbWVkaWEvdXNiL2R2Yi11c2IvY2luZXJneVQyLWNvcmUu
YyAgICAyMDI2LTAxLTIyIA0KMTM6NDA6MDQuNjQ3NzM5ODI3ICswMTAwDQorKysgZml4ZWQv
ZHJpdmVycy9tZWRpYS91c2IvZHZiLXVzYi9jaW5lcmd5VDItY29yZS5jICAgIDIwMjYtMDEt
MjIgDQoxMzo0MDozMS4yOTYwMDc3NzYgKzAxMDANCkBAIC0xMjksMTAgKzEyOSw2IEBADQog
ICNkZWZpbmUgUkNfUkVQRUFUX0RFTEFZIDMNCg0KICBzdGF0aWMgaW50IHJlcGVhdGFibGVf
a2V5c1tdID0gew0KLSAgICBLRVlfVVAsDQotICAgIEtFWV9ET1dOLA0KLSAgICBLRVlfTEVG
VCwNCi0gICAgS0VZX1JJR0hULA0KICAgICAgS0VZX1ZPTFVNRVVQLA0KICAgICAgS0VZX1ZP
TFVNRURPV04sDQogICAgICBLRVlfQ0hBTk5FTFVQLA0KDQpJIGRvbid0IHVuZGVyc3RhbmQg
d2hhdCB0aGUgY29kZSBkb2VzIHdpdGggdGhhdCAicmVwZWF0YWJsZV9rZXlzIiwgYnV0DQph
ZnRlciBJIHJlbW92ZWQgdGhlbSBmcm9tIHRoYXQgYXJyYXkgYW5kIGluc2VydGVkIHRoZSBj
aGFuZ2VkIEtlcm5lbA0KbW9kdWxlLCB0aGUgcmVtb3RlIGNvbnRyb2wgc2VuZHMgb25seSBz
aW5nbGUga2V5IHByZXNzZXMgYXMgZXhwZWN0ZWQuDQpDYW4geW91IHBsZWFzZSByZXZpZXcg
YW5kIGhvcGVmdWxseSBjaGFuZ2UgdGhlIGNvZGU/DQpJIHRoaW5rIGFsbCBvdGhlciBDaW5l
cmd5IG93bmVycyBtaWdodCBiZSBoYXBweSwgdG9vLiDwn5mCDQoNClRoZSBvdGhlciBrZXlz
IGluIHRoZSByZXBlYXRhYmxlX2tleXMgYXJyYXkgc2hvdyB0aGUgc2FtZSBpc3N1ZSwgYnV0
IEkNCmRvbid0IG5lZWQgdGhlbS4NCg0KSSB1c2VkIEtlcm5lbCB2ZXJzaW9uIDYuMTguNC4N
Cg0KQmVzdCByZWdhcmRzLA0KU3RlcGhhbi4NCg0K

