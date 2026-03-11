Return-Path: <linux-media+bounces-55372-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE1eN+RBsWk3tAIAu9opvQ
	(envelope-from <linux-media+bounces-55372-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 11:20:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E5B261FE5
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 11:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2183534996CA
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 09:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB74B363C7C;
	Wed, 11 Mar 2026 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TFJOiHyJ"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258D83BAD91;
	Wed, 11 Mar 2026 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773222157; cv=none; b=fS/2vtLDS5gffQhl4A20wRbHctHGB8QpY/Qgier++a7Cbv6HIDFd0C7AXRRR3D14mzznpqLIttXGVBryjCfUoup6nI1pUHJgoBsnysPxQf0blJyeK/D3NSry0U3ggS9lp8fZvkJBut0MO2PusI11zg19r+PNI2yNJmmLy42eV08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773222157; c=relaxed/simple;
	bh=gfNaYUtHgJ6yT+oACqc2Vzl45/VI3uyAabzTxTxnRTI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=mIFnaVYNSunU33rBYb0vy6PYcWL4h1pPxq1u12ZNkfs6dllNFTbwZLGZZOspLQC+a7D+UYVwczCfOwCOsl7Ed3Aloa7RwrzpMSkpsKgRC7gg06Hc6WmmHM625CjRYFgsvDCL0OBUVX91B4+rwWceOxf69nwMid7mNURu8qpseuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TFJOiHyJ; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=gfNaYUtHgJ6yT+oACqc2Vzl45/VI3uyAabzTxTxnRTI=; b=T
	FJOiHyJUArNuCNdsh0rL1zw4fIZ3qnsrphWDQZ0HJKTLthsNmyKGQGo5xW+WVMD/
	On+Pt8S5D9bi6in99nYd+eebwVst3taXDQp9Ww70rBQsJOyCZTKBDcjBST4ezXv9
	Jy3gQxcoBt5fA8SSwQDbj3oq1I19a0qkR9lgApHPP8=
Received: from luo.liu.linux$163.com ( [112.64.125.122] ) by
 ajax-webmail-wmsvr-40-136 (Coremail) ; Wed, 11 Mar 2026 17:42:15 +0800
 (CST)
Date: Wed, 11 Mar 2026 17:42:15 +0800 (CST)
From: "luo.liu.linux" <luo.liu.linux@163.com>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v2] media:v4l2-async:add debugfs under
 CONFIG_DEBUG_FS
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <abEz6U82C994zgw7@kekkonen.localdomain>
References: <20260121031456.1125096-1-luo.liu.linux@163.com>
 <500865d6.8b0f.19cc285d65e.Coremail.luo.liu.linux@163.com>
 <abEz6U82C994zgw7@kekkonen.localdomain>
X-NTES-SC: AL_Qu2cAf6ZvUko4yCabOkWn0sSh+Y3WcC2uP0u2IYbTucbvwru2AIabVxkLGnY7cWwLAuulzaobTdB9ehoe4BVFuo4zJgaEDcVAEHUkpgh
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <50d50ad1.88ee.19cdc468501.Coremail.luo.liu.linux@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:iCgvCgD33wX3OLFplhV3AA--.39654W
X-CM-SenderInfo: hoxrhztlxozxxqx0qiywtou0bp/xtbC6xcSg2mxOPe5PQAA3+
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Rspamd-Queue-Id: 60E5B261FE5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55372-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luo.liu.linux@163.com,linux-media@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

CgoKSGkgU2FrYXJpLAoKICAgICAgICBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHJldmll
dyBhbmQgc3VnZ2VzdGlvbnMuCgoKICAgICAgICAgIFllcywgSSBvcmlnaW5hbGx5IGludGVuZGVk
IHRvIHdyYXAgZXZlcnl0aGluZyBpbiBhIHNpbmdsZcKgI2lmZGVmIENPTkZJR19ERUJVR19GUyAu
Li4gI2VuZGlmwqBibG9jay4gSG93ZXZlciwgc2luY2XCoHY0bDJfYXN5bmNfaW5pdMKgYW5kwqB2
NGwyX2FzeW5jX2V4aXTCoGFyZSBtYW5kYXRvcnkgZW50cnkgcG9pbnRzIChyZWdpc3RlcmVkIHZp
YcKgc3Vic3lzX2luaXRjYWxswqBhbmTCoG1vZHVsZV9leGl0KSwgCgp0aGV5IG11c3QgcmVtYWlu
IHByZXNlbnQgcmVnYXJkbGVzcyBvZiB0aGUgY29uZmlndXJhdGlvbi4gVGhpcyBsaW1pdHMgdGhl
IGdyYW51bGFyaXR5LCBmb3JjaW5nIG1lIHRvIHBsYWNlIHRoZSBjb25kaXRpb25hbCBjaGVja3Mg
aW5zaWRlIHRoZXNlIHR3byBmdW5jdGlvbnMuCgoKS2luZCByZWdhcmRzLCAKCkx1by5MaXUKCgpB
dCAyMDI2LTAzLTExIDE3OjIwOjQxLCAiU2FrYXJpIEFpbHVzIiA8c2FrYXJpLmFpbHVzQGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj5PbiBGcmksIE1hciAwNiwgMjAyNiBhdCAwNTo0MToxN1BNICsw
ODAwLCBsdW8ubGl1LmxpbnV4IHdyb3RlOgo+PiAgCj4+ICBIZWxsbyBTYWthcmkgYW5kIE1hdXJv
77yMCj4+ICAgCj4+ICAgICAgR2VudGxlIHBpbmcgLi4uLgo+PiAKPj4gCj4+IEF0IDIwMjYtMDEt
MjEgMTE6MTQ6NTYsICJsdW8ubGl1IiA8bHVvLmxpdS5saW51eEAxNjMuY29tPiB3cm90ZToKPj4g
PkFsbCBkZWJ1Z2ZzLXJlbGF0ZWQgY29kZSBpcyBndWFyZGVkIGJ5IENPTkZJR19ERUJVR19GUyB0
byBhdm9pZAo+PiA+YmxvYXRpbmcgdGhlIGtlcm5lbCB3aGVuIGRlYnVnZnMgaXMgZGlzYWJsZWQu
Cj4+ID4KPj4gPlNpZ25lZC1vZmYtYnk6IGx1by5saXUgPGx1by5saXUubGludXhAMTYzLmNvbT4K
Pj4gPi0tLQo+PiA+IGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItYXN5bmMuYyB8IDYgKysr
KysrCj4+ID4gMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+PiA+Cj4+ID5kaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1hc3luYy5jIGIvZHJpdmVycy9tZWRp
YS92NGwyLWNvcmUvdjRsMi1hc3luYy5jCj4+ID5pbmRleCAxYzA4YmJhOWVjYjkuLmY2YTFhNTcx
NDliYSAxMDA2NDQKPj4gPi0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItYXN5bmMu
Ywo+PiA+KysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1hc3luYy5jCj4+ID5AQCAt
OTQ3LDYgKzk0Nyw3IEBAIHY0bDJfYXN5bmNfbmZfbmFtZShzdHJ1Y3QgdjRsMl9hc3luY19ub3Rp
ZmllciAqbm90aWZpZXIpCj4+ID4gCQlyZXR1cm4gIm5pbCI7Cj4+ID4gfQo+PiA+IAo+PiA+KyNp
ZmRlZiBDT05GSUdfREVCVUdfRlMKPj4gPiBzdGF0aWMgaW50IHBlbmRpbmdfc3ViZGV2c19zaG93
KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqZGF0YSkKPj4gPiB7Cj4+ID4gCXN0cnVjdCB2NGwy
X2FzeW5jX25vdGlmaWVyICpub3RpZjsKPj4gPkBAIC05NjcsMjAgKzk2OCwyNSBAQCBzdGF0aWMg
aW50IHBlbmRpbmdfc3ViZGV2c19zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqZGF0YSkK
Pj4gPiBERUZJTkVfU0hPV19BVFRSSUJVVEUocGVuZGluZ19zdWJkZXZzKTsKPj4gPiAKPj4gPiBz
dGF0aWMgc3RydWN0IGRlbnRyeSAqdjRsMl9hc3luY19kZWJ1Z2ZzX2RpcjsKPj4gPisjZW5kaWYK
Pj4gPiAKPj4gPiBzdGF0aWMgaW50IF9faW5pdCB2NGwyX2FzeW5jX2luaXQodm9pZCkKPj4gPiB7
Cj4+ID4rI2lmZGVmIENPTkZJR19ERUJVR19GUwo+PiA+IAl2NGwyX2FzeW5jX2RlYnVnZnNfZGly
ID0gZGVidWdmc19jcmVhdGVfZGlyKCJ2NGwyLWFzeW5jIiwgTlVMTCk7Cj4+ID4gCWRlYnVnZnNf
Y3JlYXRlX2ZpbGUoInBlbmRpbmdfYXN5bmNfc3ViZGV2aWNlcyIsIDA0NDQsCj4+ID4gCQkJICAg
IHY0bDJfYXN5bmNfZGVidWdmc19kaXIsIE5VTEwsCj4+ID4gCQkJICAgICZwZW5kaW5nX3N1YmRl
dnNfZm9wcyk7Cj4+ID4gCj4+ID4rI2VuZGlmCj4+ID4gCXJldHVybiAwOwo+PiA+IH0KPj4gPiAK
Pj4gPiBzdGF0aWMgdm9pZCBfX2V4aXQgdjRsMl9hc3luY19leGl0KHZvaWQpCj4+ID4gewo+PiA+
KyNpZmRlZiBDT05GSUdfREVCVUdfRlMKPj4gPiAJZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKHY0
bDJfYXN5bmNfZGVidWdmc19kaXIpOwo+PiA+KyNlbmRpZgo+PiA+IH0KPgo+SWYgZGVidWdmcyBp
cyBkaXNhYmxlZCwgdGhlIGluaXQgZnVuY3Rpb25zIHdvbid0IGRvIGFueXRoaW5nLiBZb3UgY2Fu
IHB1dAo+dGhlc2UgYmVoaW5kIGEgc2luZ2xlICNpZmRlZiAuLiAjZW5kaWYuCj4KPi0tIAo+U2Fr
YXJpIEFpbHVzCg==

