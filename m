Return-Path: <linux-media+bounces-64659-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WRBxOOLMK2oGFQQAu9opvQ
	(envelope-from <linux-media+bounces-64659-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:09:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4524B678143
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 11:09:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=pgFcfuu1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64659-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64659-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9704233E0F82
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 09:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53ADE369203;
	Fri, 12 Jun 2026 09:04:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581A61D88D7;
	Fri, 12 Jun 2026 09:04:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255083; cv=none; b=a8n2Rk9E9o8PODB+BgyTtFbK9Y5lI1cmN+1lylP0qKiRUhQiP0hGknTV3lsoyj8nL3/LSZL6sdKpq19SagtzTFR9Nnfj1bi9HpNjX03JrNXfRORKoBdyZUAi/teTDL5bdM2J26i4CCOeH868KVzrVBbXhbRDmJhA03SjtNcVYCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255083; c=relaxed/simple;
	bh=X31Kl78dLCDCMcs/F4rY6Z35nCi57iiNHRU1BErIdDQ=;
	h=Date:From:To:Cc:Subject:References:Mime-Version:Message-ID:
	 Content-Type; b=pMMwTnubf5VaO/IPy+Usn1179ehOJ/aOi9pUJKOPs5GvjRL96kwjGGzHahE8RVxmv7KajecI6mnPm6OpSLwt5BLZUGtCS6Lk5d6TDAYcJCXkH2u8eBsy85UqSlGilh8Ad/eLJlZ3xkjkRYQmjSQgGSneBDDaLTERHM0/dskGzRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=pgFcfuu1; arc=none smtp.client-ip=54.254.200.128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781255006;
	bh=X31Kl78dLCDCMcs/F4rY6Z35nCi57iiNHRU1BErIdDQ=;
	h=Date:From:To:Subject:Mime-Version:Message-ID;
	b=pgFcfuu1CTaums4f2q03bp1DdknMD+3ize4uuWLJbvOUuez55mS/gT43l1Aygs2PE
	 gZSDsq3hm/7BYx/zJhvIXmAx8jZkKyoVub4DHaUVSFHQjHMv0Npo4qPfU7BdWhw0Tu
	 nslEuUPWOtjp1ZYXCAV1giYnOty4dyh1xTqTjHKU=
X-QQ-mid: esmtpsz11t1781254994td821a0de
X-QQ-Originating-IP: JrpDEooSWmrGcBEWkJGnwpiWz7pwTm7IZMXTQ257GmE=
Received: from PEN002676 ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 12 Jun 2026 17:03:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13897525409563887300
Date: Fri, 12 Jun 2026 17:03:12 +0800
From: =?GB2312?B?1dS98MP3?= <zhaojinming@uniontech.com>
To: "Nicolas Dufresne" <nicolas@ndufresne.ca>, 
	tomeu <tomeu@tomeuvizoso.net>, 
	ogabbay <ogabbay@kernel.org>
Cc: sumit.semwal <sumit.semwal@linaro.org>, 
	christian.koenig <christian.koenig@amd.com>, 
	jeff.hugo <jeff.hugo@oss.qualcomm.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, 
	linaro-mm-sig <linaro-mm-sig@lists.linaro.org>, 
	stable <stable@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] accel/rocket: Fix error path handling in rocket_job_run()
References: <20260610061915.1CA281F00893@smtp.kernel.org>, 
	<20260610071045.3414828-1-zhaojinming@uniontech.com>, 
	<0e3b9cdb9d8bd692290dfabafb32d7faa5bd50f8.camel@ndufresne.ca>
X-Priority: 3
X-GUID: D35A159F-6825-4573-AE95-48F50940D356
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.375[cn]
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <F5773C4B33DAB9B9+2026061217031108584617@uniontech.com>
Content-Type: text/plain;
	charset="GB2312"
Content-Transfer-Encoding: base64
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NT7uTz3cNku21O2Qpo49ZX3qbjMEcHHwjR20QJ5Txmp+WOmPrG2dMary
	MoRC55frpzDTh1rJAnmt0+nJsxhsJMTHgyRzJQliUkf8bPIgfDt/jfK3pNzgUytYBlGTp40
	zvyjspZVajS+j7JObT4x+hciDJDR4o6JQhLI5d/3Jva6U9ecm8y9ZW2+vZ4WtZA4ayL7nun
	dJbM3gzZry6V1zuR6GiI5jz82nguhi6Hjf8VDiMOMcSZBE6VKbeUAcHTxgS6HtYUSZAhwsI
	V5OE4eG8pE1zjr0kb3S5WE3Yv+2OLfcEnTjgLdOL3Py6G0McN004WipMiEtHvOyUODvk6bQ
	OOCjW/cVcTQCfM7Nkc2s8ogAZUmViVy3dILv77j/Btv6pjVfFFI5LAM4ts07ST1/V2sEHUG
	b7klWidN3QCOAK2Oapyo2E+xrm+Y6PQ2qSRlBlGtj13iQN4aO+bHC8MFfB+/uSn/tkGg0k2
	eNwZyAnc2eVNXHCNJIWPOQ25r442+VEbceBnDU/4Z5fX6eyQNj2LDIaJM665qvxx/OVLrrD
	xRSw1dhibFd41cz18FV+6QdKPp3I3vTmKOzJtZA5fvM8fKVlOesAbcpaaeVeLhupCx1hp3R
	aUNevySTmcVCKzPP13ZVFVxBq3A1h22QpHOvWP9ky/AU+3QgCq4Iqcpog1hn+q3Wb1Y1gFd
	vsou7uZT1WMsfJGYhr4x+Egcp0g6RCetmYfGOeXS7gydbrwOwb3LECrtkmB+Og/2KDsEijh
	JxJzMt0QUKBqLpIMYd71Rm2Ar93fvdUd0e1jPVXzHp2fe07PHhSFMSvd0PTr89dfKJg+ci8
	m3E7Rc20hM2LTF4qs0WVBqMV41V3yXDsUMyXh9HtbQGQxHac+C/VLRebBV1x6HiANw0jJit
	/UZY9uWkh0OB60ZCrtMUGW53e8pYjz3Ol3qHzXcJ5THa5Z+wt8KMya3l0IpyIRng5h27ZbH
	BD3qxsFBEA3eLGDAc0X5znxpxtfhTzSmQSrmiJklC6W/RjdJxEOxugdW4JTowO8cH3sUqEo
	TxL4ijRTcYOVVUQiBhsP+D1Fvyce8=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nicolas@ndufresne.ca,m:tomeu@tomeuvizoso.net,m:ogabbay@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jeff.hugo@oss.qualcomm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-64659-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[zhaojinming@uniontech.com,linux-media@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhaojinming@uniontech.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[uniontech.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4524B678143

SGksCgpBcG9sb2dpZXMgZm9yIHRoZSBjb25mdXNpb24gY2F1c2VkLiBJIHdhcyB0cnlpbmcgdG8g
aW5jb3Jwb3JhdGUgZmVlZGJhY2sgZnJvbSB0aGUgQUkgdG8gbWFrZSBteSBjaGFuZ2VzIHNhZmVy
LCBidXQgdGhlIHJlc3VsdCBzZWVtcyB1bnNhdGlzZmFjdG9yeS4KCkknZCBsaWtlIHRvIHNwbGl0
IHRoZSB0d28gaW5kZXBlbmRlbnQgZml4ZXMgYW5kIHRhY2tsZSB0aGVtIHNlcGFyYXRlbHkuIExl
dCdzIGZpcnN0IHJldmlldyBbUEFUQ0ggdjYgMS8yXSBhY2NlbC9yb2NrZXQ6IEZpeCBlcnJvciBw
YXRoIGhhbmRsaW5nIGluIHJvY2tldF9qb2JfcnVuKCkuCgpJIGN1cnJlbnRseSBkb24ndCBmdWxs
eSBncmFzcCB0aGUgQUkncyBwcm9ibGVtIGRlc2NyaXB0aW9uIHJlZ2FyZGluZyBbUEFUQ0ggdjYg
Mi8yXSBhY2NlbC9yb2NrZXQ6IEZpeCBpb21tdV9ncm91cCBsZWFrIGFuZCB1bnNhZmUgSVJRIHJl
Z2lzdGVyIGFjY2Vzcy4KClBsZWFzZSBsZXQgbWUga25vdyBpZiBJIHNob3VsZCBzdGFydCBhIG5l
dyB0aHJlYWQgZm9yIFtQQVRDSCB2NiAxLzJdLgoKVGhhbmtzLAoKCi0tLS0tLS0tLS0tLS0tCgoK
ClpoYW8gSmlubWluZwoKCj5IaSwKCgoKPgoKCgo+TGUgbWVyY3JlZGkgMTAganVpbiAyMDI2IKik
IDE1OjEwICswODAwLCBaaGFvSmlubWluZyBhIKimY3JpdD86CgoKCj4+IEluIHJvY2tldF9qb2Jf
cnVuKCksIGFmdGVyIHRha2luZyBhbiBleHRyYSBmZW5jZSByZWZlcmVuY2UgZm9yCgoKCj4+IGpv
Yi0+ZG9uZV9mZW5jZSB2aWEgZG1hX2ZlbmNlX2dldCgpLCB0aGUgZXJyb3IgcGF0aHMgaGF2ZSB0
aHJlZSBidWdzOgoKCgo+PiAKCgoKPj4gLSBUaGUgZG1hX2ZlbmNlIHJlZmVyZW5jZSBoZWxkIGJ5
IGpvYi0+ZG9uZV9mZW5jZSBpcyBuZXZlciByZWxlYXNlZCwKCgoKPj4gPyBjYXVzaW5nIGEgcmVm
ZXJlbmNlIGxlYWsuCgoKCj4+IC0gcG1fcnVudGltZV9nZXRfc3luYygpIGluY3JlbWVudHMgdGhl
IHVzYWdlIGNvdW50ZXIgZXZlbiBvbiBmYWlsdXJlLAoKCgo+PiA/IGJ1dCB0aGUgZXJyb3IgcGF0
aCBkb2VzIG5vdCBkZWNyZW1lbnQgaXQsIGxlYWtpbmcgdGhlIHJ1bnRpbWUgUE0KCgoKPj4gPyBy
ZWZlcmVuY2UgYW5kIHByZXZlbnRpbmcgdGhlIE5QVSBmcm9tIHN1c3BlbmRpbmcuCgoKCj4+IC0g
QSB2YWxpZCBidXQgdW5zaWduYWxlZCBmZW5jZSBpcyByZXR1cm5lZCB0byB0aGUgRFJNIHNjaGVk
dWxlciwKCgoKPj4gPyB3aGljaCB0cmlnZ2VycyBXQVJOKCJGZW5jZSAuLi4gcmVsZWFzZWQgd2l0
aCBwZW5kaW5nIHNpZ25hbHMhIikKCgoKPj4gPyB3aGVuIHRoZSBzY2hlZHVsZXIgZHJvcHMgaXRz
IHJlZmVyZW5jZS4KCgoKPj4gCgoKCj4+IEZpeCBieSByZXBsYWNpbmcgcG1fcnVudGltZV9nZXRf
c3luYygpIHdpdGggcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpCgoKCj4+IHdoaWNoIGF1dG8t
YmFsYW5jZXMgdGhlIHVzYWdlIGNvdW50ZXIgb24gZmFpbHVyZSwgcmVsZWFzaW5nIGJvdGggZmVu
Y2UKCgoKPj4gcmVmZXJlbmNlcyBvbiBlcnJvciwgYW5kIHJldHVybmluZyBFUlJfUFRSKHJldCkg
aW5zdGVhZCBvZiB0aGUKCgoKPj4gdW5zaWduYWxlZCBmZW5jZS4KCgoKPj4gCgoKCj4+IENjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnCgoKCj4+IEZpeGVzOiAwODEwZDVhZDg4YTEgKCJhY2NlbC9y
b2NrZXQ6IEFkZCBqb2Igc3VibWlzc2lvbiBJT0NUTCIpCgoKCj4+IFNpZ25lZC1vZmYtYnk6IFpo
YW9KaW5taW5nIDx6aGFvamlubWluZ0B1bmlvbnRlY2guY29tPgoKCgo+PiAtLS0KCgoKPgoKCgo+
VGhpcyBpcyBhIGxvdCBvZiB2ZXJzaW9ucyB3aXRoaW4gdGhlIHNhbWUgZGF5LiBZb3Ugc2hvdWxk
IHNsb3cgZG93biBhIGxpdHRsZSBzbwoKCgo+YSBodW1hbiBjYW4gcHJvdmlkZSBhIHJldmlldywg
YW5kIGFsc28gZG9jdW1lbnQgdGhlIGRpZmZlcmVuY2VzIGluIHRoaXMgc2VjdGlvbiwKCgoKPmFm
dGVyIHRoZSAtLS0sIG9yIHVzaW5nIGEgY292ZXIgbGV0dGVyLgoKCgo+CgoKCj5OaWNvbGFzCgoK
Cj4KCgoKPj4gP2RyaXZlcnMvYWNjZWwvcm9ja2V0L3JvY2tldF9qb2IuYyB8IDE5ICsrKysrKysr
KysrKysrLS0tLS0KCgoKPj4gPzEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKCgo+PiAKCgoKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNjZWwvcm9ja2V0
L3JvY2tldF9qb2IuYwoKCgo+PiBiL2RyaXZlcnMvYWNjZWwvcm9ja2V0L3JvY2tldF9qb2IuYwoK
Cgo+PiBpbmRleCBhYzUxYmZmMzk4MzMuLmU4YTA3M2UyMmFjMiAxMDA2NDQKCgoKPj4gLS0tIGEv
ZHJpdmVycy9hY2NlbC9yb2NrZXQvcm9ja2V0X2pvYi5jCgoKCj4+ICsrKyBiL2RyaXZlcnMvYWNj
ZWwvcm9ja2V0L3JvY2tldF9qb2IuYwoKCgo+PiBAQCAtMzEwLDEzICszMTAsMjIgQEAgc3RhdGlj
IHN0cnVjdCBkbWFfZmVuY2UgKnJvY2tldF9qb2JfcnVuKHN0cnVjdAoKCgo+PiBkcm1fc2NoZWRf
am9iICpzY2hlZF9qb2IpCgoKCj4+ID8JCWRtYV9mZW5jZV9wdXQoam9iLT5kb25lX2ZlbmNlKTsK
CgoKPj4gPwlqb2ItPmRvbmVfZmVuY2UgPSBkbWFfZmVuY2VfZ2V0KGZlbmNlKTsKCgoKPj4gPwoK
Cgo+PiAtCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoY29yZS0+ZGV2KTsKCgoKPj4gLQlpZiAo
cmV0IDwgMCkKCgoKPj4gLQkJcmV0dXJuIGZlbmNlOwoKCgo+PiArCXJldCA9IHBtX3J1bnRpbWVf
cmVzdW1lX2FuZF9nZXQoY29yZS0+ZGV2KTsKCgoKPj4gKwlpZiAocmV0IDwgMCkgewoKCgo+PiAr
CQlkbWFfZmVuY2VfcHV0KGpvYi0+ZG9uZV9mZW5jZSk7CgoKCj4+ICsJCWpvYi0+ZG9uZV9mZW5j
ZSA9IE5VTEw7CgoKCj4+ICsJCWRtYV9mZW5jZV9wdXQoZmVuY2UpOwoKCgo+PiArCQlyZXR1cm4g
RVJSX1BUUihyZXQpOwoKCgo+PiArCX0KCgoKPj4gPwoKCgo+PiA/CXJldCA9IGlvbW11X2F0dGFj
aF9ncm91cChqb2ItPmRvbWFpbi0+ZG9tYWluLCBjb3JlLT5pb21tdV9ncm91cCk7CgoKCj4+IC0J
aWYgKHJldCA8IDApCgoKCj4+IC0JCXJldHVybiBmZW5jZTsKCgoKPj4gKwlpZiAocmV0IDwgMCkg
ewoKCgo+PiArCQlwbV9ydW50aW1lX3B1dChjb3JlLT5kZXYpOwoKCgo+PiArCQlkbWFfZmVuY2Vf
cHV0KGpvYi0+ZG9uZV9mZW5jZSk7CgoKCj4+ICsJCWpvYi0+ZG9uZV9mZW5jZSA9IE5VTEw7CgoK
Cj4+ICsJCWRtYV9mZW5jZV9wdXQoZmVuY2UpOwoKCgo+PiArCQlyZXR1cm4gRVJSX1BUUihyZXQp
OwoKCgo+PiArCX0KCgoKPj4gPwoKCgo+PiA/CXNjb3BlZF9ndWFyZChtdXRleCwgJmNvcmUtPmpv
Yl9sb2NrKSB7CgoKCj4+ID8JCWNvcmUtPmluX2ZsaWdodF9qb2IgPSBqb2I7CgoK


