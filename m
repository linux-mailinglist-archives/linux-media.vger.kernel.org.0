Return-Path: <linux-media+bounces-55350-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOoOHpwvsWmWrwIAu9opvQ
	(envelope-from <linux-media+bounces-55350-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:02:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F4825FE63
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 10:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE78D306ADBC
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 08:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D0C3C3C06;
	Wed, 11 Mar 2026 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="W0qlR3Wf"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB2337BA4;
	Wed, 11 Mar 2026 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219531; cv=none; b=Xx0laDMzL6/txHCvAZQAcZq+Q2OvSw1eargDZzrFwcjMuv603BE06AFoL2JdjhVrG4nbUAEthI1h4PVUYydjz2wNq4RxpZB0U21nYWZpaqB6Rf1Mfg7akpv51TRirYrycLMj+AarPiEuved3md6/sbR5EHW7gjZJCeK1t6W8mxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219531; c=relaxed/simple;
	bh=QNe3AgD5cudHWQ1mVbQB8dIucSTrlT/dVZXxEmM4oz8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=QJdBbgrbDf5h13WbOG6C8SySznKG65rP4un382CTJdVrmnR4vw+qFkQKYTu+I3/f7gaLZ0bX+KX86C93UEdBZWN4pYZ/FxGsCiRas+RHkNFNF48mLsqI82+i0Zob7yvNzCD5QcvLTlTEwPx40Ylj70hSUr60JdnNsiZNl+PIIbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=W0qlR3Wf; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=QNe3AgD5cudHWQ1mVbQB8dIucSTrlT/dVZXxEmM4oz8=; b=W
	0qlR3WfrrUs2F5iZr4j+18G209bIW4ikLvzYX2GbUj0Rfoj9+ojOB4Mou7a5nfmH
	j8GhEok1rzdfM0Zo4VHZ6dZVUDWhE57ciGhqXm/6Ms5jIdJSirl6C3M+81qWTdep
	w6jB99DAjkYdQb8zrfUjGmdfSxGkG0zdD+L4yfSkoI=
Received: from luo.liu.linux$163.com ( [112.64.125.122] ) by
 ajax-webmail-wmsvr-40-136 (Coremail) ; Wed, 11 Mar 2026 16:58:26 +0800
 (CST)
Date: Wed, 11 Mar 2026 16:58:26 +0800 (CST)
From: "luo.liu.linux" <luo.liu.linux@163.com>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v2] media:v4l2-async:add debugfs under
 CONFIG_DEBUG_FS
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <abET_OcHYr5_wpdK@kekkonen.localdomain>
References: <20260121031456.1125096-1-luo.liu.linux@163.com>
 <abET_OcHYr5_wpdK@kekkonen.localdomain>
X-NTES-SC: AL_Qu2cAf6atk0r4CKaYukWn0sSh+Y3WcC2uP0u2IYbTucbvwru2AIabVxkLGnY7cWwLAuulzaobTdB9ehoe4BGS+UNu3eu85+E38dkk1e2
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <24d41d72.7da6.19cdc1e683e.Coremail.luo.liu.linux@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:iCgvCgDnz_KyLrFprwV3AA--.39678W
X-CM-SenderInfo: hoxrhztlxozxxqx0qiywtou0bp/xtbC6xJ+72mxLrKtHQAA3c
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Rspamd-Queue-Id: 25F4825FE63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55350-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	FREEMAIL_FROM(0.00)[163.com];
	MAILSPIKE_FAIL(0.00)[2600:3c09:e001:a7::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luo.liu.linux@163.com,linux-media@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

CkhpIFNha2FyaSwKCiAgICAgICAgIFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmVwbHkg
YW5kIHJlbWluZGVyLgoKIEkgdGhpbmsgIHR3byBsYXR0ZXIgI2lmJ3MgIGlzIHVzZWZ1bKOsV2hp
bGUgbW9kZXJuIGNvbXBpbGVycyAoc3VjaCBhcyBHQ0MgYW5kIENsYW5nKSBwb3NzZXNzICJEZWFk
IENvZGUgRWxpbWluYXRpb24iIChEQ0UpIGNhcGFiaWxpdGllcyBhbmQgY2FuIG9wdGltaXplIGF3
YXkgZnVuY3Rpb24gY2FsbHMgd2hlbiBDT05GSUdfREVCVUdfRlMgaXMgZGlzYWJsZWQsIAoKIGV4
cGxpY2l0bHkgd3JhcHBpbmcgdGhlIHJlbGV2YW50IGNvZGUgYmxvY2tzIHdpdGggI2lmZGVmIENP
TkZJR19ERUJVR19GUyByZW1haW5zIGEgc3RhbmRhcmQgYW5kIG5lY2Vzc2FyeSBwcmFjdGljZSBp
biBMaW51eCBrZXJuZWwgZGV2ZWxvcG1lbnQuCgoKSGVyZSBhcmUgdGhlIGRldGFpbGVkIHJlYXNv
bnM6CgoxLiBQcmV2ZW50aW9uIG9mIENvbXBpbGF0aW9uIEVycm9ycyAoUHJpbWFyeSBSZWFzb24p
CgpJZiBDT05GSUdfREVCVUdfRlMgaXMgbm90IGVuYWJsZWQ6CgpNb3N0IGZ1bmN0aW9ucyBpbiA8
bGludXgvZGVidWdmcy5oPiAoZS5nLiwgZGVidWdmc19jcmVhdGVfZGlyLCBkZWJ1Z2ZzX2NyZWF0
ZV9maWxlLCBkZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUpIGFyZSB0eXBpY2FsbHkgZGVmaW5lZCBh
cyBlbXB0eSBpbmxpbmUgZnVuY3Rpb25zIG9yIG1hY3JvcyB0aGF0IHJldHVybiBOVUxMIG9yIHBl
cmZvcm0gbm8gb3BlcmF0aW9uLgoKSG93ZXZlciwgY2VydGFpbiBkYXRhIHN0cnVjdHVyZXMgcmVm
ZXJlbmNlZCBpbiB0aGUgY29kZSBvciBub24taW5saW5lIGhlbHBlciBmdW5jdGlvbnMgbWlnaHQg
bm90IGV4aXN0IGF0IGFsbC4KCkNydWNpYWxseSwgdGhlIGZ1bmN0aW9ucyBkZWZpbmVkIGluIHRo
aXMgcGF0Y2gsIHN1Y2ggYXMgcGVuZGluZ19zdWJkZXZzX3Nob3cgYW5kIHRoZSBtYWNybyBERUZJ
TkVfU0hPV19BVFRSSUJVVEUocGVuZGluZ19zdWJkZXZzKSwgaGVhdmlseSByZWx5IG9uIGRlYnVn
ZnMtc3BlY2lmaWMgaW50ZXJuYWwgc3RydWN0dXJlcyAoZS5nLiwgaW50ZXJhY3Rpb25zIGludm9s
dmluZyBzdHJ1Y3Qgc2VxX2ZpbGUpLgoKRXZlbiBpZiB2NGwyX2FzeW5jX2luaXQgZG9lcyBub3Qg
Y2FsbCB0aGVzZSBmdW5jdGlvbnMgd2hlbiB0aGUgY29uZmlnIGlzIGRpc2FibGVkLCB0aGUgY29t
cGlsZXIgc3RpbGwgYXR0ZW1wdHMgdG8gY29tcGlsZSB0aGVpciBkZWZpbml0aW9ucy4KCklmIHRo
ZSBib2R5IG9mIHRoZXNlIGZ1bmN0aW9ucyB1c2VzIEFQSXMgb3Igc3RydWN0dXJlIG1lbWJlcnMg
dGhhdCBvbmx5IGV4aXN0IHdoZW4gQ09ORklHX0RFQlVHX0ZTPXksIHRoZSBjb21waWxhdGlvbiB3
aWxsIGZhaWwgKHJlcG9ydGluZyB1bmRlZmluZWQgcmVmZXJlbmNlcyBvciBtaXNzaW5nIHN0cnVj
dHVyZSBtZW1iZXJzKSByYXRoZXIgdGhhbiBmYWlsaW5nIGF0IHRoZSBsaW5rIHN0YWdlLiAKCkV4
cGxpY2l0IHdyYXBwaW5nIGVuc3VyZXMgdGhhdCB0aGUgZnVuY3Rpb24gYm9kaWVzLCB3aGljaCBk
ZXBlbmQgb24gZGVidWdmcyBpbnRlcm5hbHMsIGFyZSBuZXZlciBjb21waWxlZCBpbiB0aGUgZmly
c3QgcGxhY2UuCgoKMi4gQ29kZSBSZWFkYWJpbGl0eSBhbmQgTWFpbnRhaW5hYmlsaXR5CgpDbGVh
ciBJbnRlbnQ6ICNpZmRlZiBDT05GSUdfREVCVUdfRlMgY2xlYXJseSBzaWduYWxzIHRvIGFueW9u
ZSByZWFkaW5nIHRoZSBjb2RlOiAiVGhpcyBjb2RlIGV4aXN0cyBvbmx5IHdoZW4gdGhlIGRlYnVn
IGZpbGVzeXN0ZW0gaXMgZW5hYmxlZC4iCgpSZWR1Y2VkIE5vaXNlOiBXaGVuIGRldmVsb3BlcnMg
ZGlzYWJsZSBkZWJ1Z2ZzIHRvIHRyaW0gdGhlIGtlcm5lbCwgdGhleSBleHBlY3QgdGhlIHJlbGF0
ZWQgY29kZSB0byBkaXNhcHBlYXIgY29tcGxldGVseSBmcm9tIHRoZSBidWlsZCwgcmF0aGVyIHRo
YW4gc2VlaW5nIGEgYnVuY2ggb2YgZW1wdHkgZnVuY3Rpb24gZGVmaW5pdGlvbnMgdGhhdCB3ZXJl
IG9wdGltaXplZCBhd2F5IGJ5IHRoZSBjb21waWxlci4gVGhpcyBoZWxwcyBpbiB1bmRlcnN0YW5k
aW5nIHRoZSBhY3R1YWwgY29tcG9zaXRpb24gb2YgdGhlIGtlcm5lbCBpbWFnZS4KCjMuIFByZXZl
bnRpb24gb2YgUG90ZW50aWFsIFNpZGUgRWZmZWN0cwoKQWx0aG91Z2ggaW4gdGhpcyBzaW1wbGUg
ZXhhbXBsZSB0aGUgdmFyaWFibGUgdjRsMl9hc3luY19kZWJ1Z2ZzX2RpciB3b3VsZCBvbmx5IG9j
Y3VweSBhIHBvaW50ZXIncyBzcGFjZSAoYW5kIGxpa2VseSBiZSBvcHRpbWl6ZWQgb3V0KSBpZiB1
bnVzZWQsIGluIG1vcmUgY29tcGxleCBzY2VuYXJpb3MsIHVucHJvdGVjdGVkIGNvZGUgY291bGQg
ZXhlY3V0ZSB1bm5lY2Vzc2FyeSBpbml0aWFsaXphdGlvbiBsb2dpYyBvciBjb25zdW1lIHN0YXRp
YyBtZW1vcnksIGV2ZW4gaWYgdWx0aW1hdGVseSBuZXZlciBjYWxsZWQuCgpLaW5kIHJlZ2FyZHMs
IAoKTHVvLkxpdQoKCgoKQXQgMjAyNi0wMy0xMSAxNTowNDoyOCwgIlNha2FyaSBBaWx1cyIgPHNh
a2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+SGkgTHVvLAo+Cj5UaGFua3MgZm9y
IHRoZSBwYXRjaC4KPgo+T24gV2VkLCBKYW4gMjEsIDIwMjYgYXQgMTE6MTQ6NTZBTSArMDgwMCwg
bHVvLmxpdSB3cm90ZToKPj4gQWxsIGRlYnVnZnMtcmVsYXRlZCBjb2RlIGlzIGd1YXJkZWQgYnkg
Q09ORklHX0RFQlVHX0ZTIHRvIGF2b2lkCj4+IGJsb2F0aW5nIHRoZSBrZXJuZWwgd2hlbiBkZWJ1
Z2ZzIGlzIGRpc2FibGVkLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogbHVvLmxpdSA8bHVvLmxpdS5s
aW51eEAxNjMuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItYXN5
bmMuYyB8IDYgKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+IAo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1hc3luYy5jIGIvZHJp
dmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1hc3luYy5jCj4+IGluZGV4IDFjMDhiYmE5ZWNiOS4u
ZjZhMWE1NzE0OWJhIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwy
LWFzeW5jLmMKPj4gKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1hc3luYy5jCj4+
IEBAIC05NDcsNiArOTQ3LDcgQEAgdjRsMl9hc3luY19uZl9uYW1lKHN0cnVjdCB2NGwyX2FzeW5j
X25vdGlmaWVyICpub3RpZmllcikKPj4gIAkJcmV0dXJuICJuaWwiOwo+PiAgfQo+PiAgCj4+ICsj
aWZkZWYgQ09ORklHX0RFQlVHX0ZTCj4+ICBzdGF0aWMgaW50IHBlbmRpbmdfc3ViZGV2c19zaG93
KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqZGF0YSkKPj4gIHsKPj4gIAlzdHJ1Y3QgdjRsMl9h
c3luY19ub3RpZmllciAqbm90aWY7Cj4+IEBAIC05NjcsMjAgKzk2OCwyNSBAQCBzdGF0aWMgaW50
IHBlbmRpbmdfc3ViZGV2c19zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqZGF0YSkKPj4g
IERFRklORV9TSE9XX0FUVFJJQlVURShwZW5kaW5nX3N1YmRldnMpOwo+PiAgCj4+ICBzdGF0aWMg
c3RydWN0IGRlbnRyeSAqdjRsMl9hc3luY19kZWJ1Z2ZzX2RpcjsKPj4gKyNlbmRpZgo+Cj5UaGlz
IHBhcnQgc2VlbXMgcmVhc29uYWJsZS4uLgo+Cj4+ICAKPj4gIHN0YXRpYyBpbnQgX19pbml0IHY0
bDJfYXN5bmNfaW5pdCh2b2lkKQo+PiAgewo+PiArI2lmZGVmIENPTkZJR19ERUJVR19GUwo+PiAg
CXY0bDJfYXN5bmNfZGVidWdmc19kaXIgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoInY0bDItYXN5bmMi
LCBOVUxMKTsKPj4gIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJwZW5kaW5nX2FzeW5jX3N1YmRldmlj
ZXMiLCAwNDQ0LAo+PiAgCQkJICAgIHY0bDJfYXN5bmNfZGVidWdmc19kaXIsIE5VTEwsCj4+ICAJ
CQkgICAgJnBlbmRpbmdfc3ViZGV2c19mb3BzKTsKPj4gIAo+PiArI2VuZGlmCj4+ICAJcmV0dXJu
IDA7Cj4+ICB9Cj4+ICAKPj4gIHN0YXRpYyB2b2lkIF9fZXhpdCB2NGwyX2FzeW5jX2V4aXQodm9p
ZCkKPj4gIHsKPj4gKyNpZmRlZiBDT05GSUdfREVCVUdfRlMKPj4gIAlkZWJ1Z2ZzX3JlbW92ZV9y
ZWN1cnNpdmUodjRsMl9hc3luY19kZWJ1Z2ZzX2Rpcik7Cj4+ICsjZW5kaWYKPj4gIH0KPgo+QnV0
IGFyZSB0aGUgdHdvIGxhdHRlciAjaWYncyB1c2VmdWw/IExvb2tzIGxpa2UgdGhlIGNvbXBpbGVy
IHNob3VsZAo+b3B0aW1pc2UgdGhlc2Ugb3V0Li4uCj4KPj4gIAo+PiAgc3Vic3lzX2luaXRjYWxs
KHY0bDJfYXN5bmNfaW5pdCk7Cj4+IAo+PiBiYXNlLWNvbW1pdDogZDA4Yzg1YWM4ODk0OTk1ZDRi
MGQ4ZmI0OGQyZjZhM2U1M2NkNzlhYgo+Cj4tLSAKPktpbmQgcmVnYXJkcywKPgo+U2FrYXJpIEFp
bHVzCg==

