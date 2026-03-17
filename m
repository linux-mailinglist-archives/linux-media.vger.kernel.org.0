Return-Path: <linux-media+bounces-56047-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBtSOMY3uWk8vgEAu9opvQ
	(envelope-from <linux-media+bounces-56047-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:15:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 395312A892E
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D7113015EC6
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EA83AA1A3;
	Tue, 17 Mar 2026 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hx+D43U9"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A49373BF5;
	Tue, 17 Mar 2026 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773746104; cv=none; b=B4FXIBOdOLJcaIEyKHfYPncd5R099/Z7adDA89sf9onuyIZWDo9EjOKTdOmYWo90h8oCqLcGFatb2VX9BuFD143L/4pEZcNpnXDAu0SIxb7kWpnmG/vB8lhy/XSfeaxxqDWOffHyiXTkwTatuOUZ571ZmOSDdhlsmBGh3f4uU1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773746104; c=relaxed/simple;
	bh=d1ToI1/zGmEICvkOkFwrBLLB8YZ8pv8zBi3wu9DA1g4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=je2TaMrTLC8wMaHFszVwcvHzK2CG2OZ6lRa1YlsAJrnFSpcNaSIiV2RqzyfvBz0DApgoN9lP5JfFpLmjwXdq+mY11UOCA0OnCuOYb2RWsHknW3bP2gDyjht4lyDVevs6cGCBH1ACuM7x47VZB29dtwVEPHgsQK8rI01xFW0+Q1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hx+D43U9; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=d1ToI1/zGmEICvkOkFwrBLLB8YZ8pv8zBi3wu9DA1g4=; b=h
	x+D43U9l56mj3HRPRQpSuyPAtGc0inCDE6gBX6KcaMRwV1HdkqL8D4FzY7VIl0uk
	6bjGNCVoEisa66jBOlqou6kZlgM9Kpjofjlqqn3szNOLADL+Erymj57QiywLHG+b
	/8AkmsCJDIDobb0J384JSu9BDH6h3PkgjoTJe/GQ4Q=
Received: from luo.liu.linux$163.com ( [112.64.125.122] ) by
 ajax-webmail-wmsvr-40-130 (Coremail) ; Tue, 17 Mar 2026 19:14:43 +0800
 (CST)
Date: Tue, 17 Mar 2026 19:14:43 +0800 (CST)
From: "luo.liu.linux" <luo.liu.linux@163.com>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: Re: Re: Re: [PATCH] media:v4l2-async:debugfs for registered
 subdevices
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <abkPC3sHVUdGuww1@kekkonen.localdomain>
References: <20260313075824.2818713-1-luo.liu.linux@163.com>
 <abPm3VGGRAIsY1eQ@kekkonen.localdomain>
 <5e63e8aa.943f.19ce6ee4ad5.Coremail.luo.liu.linux@163.com>
 <abP4Mr_s8JRpQH0B@kekkonen.localdomain>
 <384d2274.9b3e.19ce776ec2c.Coremail.luo.liu.linux@163.com>
 <abg0R5zerwCM_1mK@kekkonen.localdomain>
 <186862ed.3836.19cf9df139c.Coremail.luo.liu.linux@163.com>
 <abkPC3sHVUdGuww1@kekkonen.localdomain>
X-NTES-SC: AL_Qu2cAfufuUgj5SObYukWn0sSh+Y3WcC2uP0u2IYbZ+Q8vBrI0QssRnFYLXzo0eu/LzKJixqlezdL9PpxZJEu9UIjBFdpBIqn7m5W7ULj
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4155da3e.9361.19cfb815615.Coremail.luo.liu.linux@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gigvCgDnr2+jN7lpsWZ6AA--.28323W
X-CM-SenderInfo: hoxrhztlxozxxqx0qiywtou0bp/xtbC6wO+MGm5N6OBjAAA3v
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spamd-Result: default: False [-1.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56047-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 395312A892E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgpIaSBTYWthcmksCgogICAgICAgVGhlIGV4aXN0aW5nwqBwZW5kaW5nX2FzeW5jX3N1YmRldmlj
ZXPCoGludGVyZmFjZSBwcm92aWRlcyBleGNlbGxlbnQgdmlzaWJpbGl0eSBpbnRvIHRoZcKgbm90
aWZpZXJfbGlzdMKgKHRoZSAnd2FpdGVyJyBzaWRlKS4gClRvIGFjaGlldmUgZnVsbCBzeW1tZXRy
eSBhbmQgY29tcGxldGUgZGVidWdnYWJpbGl0eSwgd2Ugc2hvdWxkIGFsc28gZXhwb3NlIHRoZcKg
c3ViZGV2X2xpc3TCoCh0aGUgJ3Byb3ZpZGVyJyBzaWRlKS5UaGVzZSB0d28gdmlld3Mgc29sdmUg
ZGlmZmVyZW50IHByb2JsZW1zOgoKMSBOb3RpZmllciBMaXN0OiBEaWFnbm9zZXMgd2h5IGJpbmRp
bmcgaXPCoHN0YWxsZWTCoChtaXNzaW5nIHN1Yi1kZXZpY2VzKS4KCjIgU3ViZGV2IExpc3Q6IERp
YWdub3Nlc8Kgc3RhdGUgaW5jb25zaXN0ZW5jaWVzwqAoZS5nLiwgc3ViLWRldmljZXMgcHJlc2Vu
dCBidXQgdW5tYXRjaGVkKSBhbmQgdmVyaWZpZXPCoHJlc291cmNlIGNsZWFudXDCoHVwb24gdW5i
aW5kLgoKRnJvbSBwcmFjdGljYWwgZXhwZXJpZW5jZSwgbGFja2luZyB2aXNpYmlsaXR5IGludG/C
oHN1YmRldl9saXN0wqBtYWtlcyBpdCBkaWZmaWN1bHQgdG8gZGlzdGluZ3Vpc2ggYmV0d2VlbiBh
IHN1Yi1kZXZpY2UgcHJvYmUgZmFpbHVyZSBhbmQgYW4gYXN5bmMgbWF0Y2hpbmcgZmFpbHVyZS4g
CkFkZGluZyB0aGlzIGludGVyZmFjZSB3b3VsZCBwcm92aWRlIGEgaG9saXN0aWMgdmlldyBvZiB0
aGUgYXN5bmMgZW5naW5lJ3Mgc3RhdGUsIHdoaWNoIGhhcyBwcm92ZW4gZXNzZW50aWFsIGZvciBy
YXBpZCBpc3N1ZSBsb2NhbGl6YXRpb24gaW4gY29tcGxleCBkcml2ZXIgc3RhY2tzLgoKS2luZCBy
ZWdhcmRzLAoKTHVvCgoKCkF0IDIwMjYtMDMtMTcgMTY6MjE6MzEsICJTYWthcmkgQWlsdXMiIDxz
YWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPiB3cm90ZToKPkhpIEx1bywKPgo+T24gVHVlLCBN
YXIgMTcsIDIwMjYgYXQgMTE6Mzc6NTJBTSArMDgwMCwgbHVvLmxpdS5saW51eCB3cm90ZToKPj4g
Cj4+IAo+PiBIaSBTYWthcmksCj4+IAo+PiAJWW91IGFyZSBhYnNvbHV0ZWx5IHJpZ2h0LiBGb3Ig
YW4gZXhwZXJpZW5jZWQga2VybmVsIGRldmVsb3BlciBsaWtlCj4+ICB5b3Vyc2VsZiwgdG9vbHMg
bGlrZSBLQVNBTiBhbmQgQ09ORklHX0RFQlVHX0xJU1QgYXJlIHNlY29uZCBuYXR1cmUgYW5kCj4+
ICBpbmNyZWRpYmx5IGVmZmVjdGl2ZSBmb3IgcGlucG9pbnRpbmcgc3VjaCBpc3N1ZXMuIEkgdHJ1
bHkgYWRtaXJlIHlvdXIKPj4gIGV4cGVydGlzZSBpbiBsZXZlcmFnaW5nIHRoZXNlIGFkdmFuY2Vk
IGRlYnVnZ2luZyBtZWNoYW5pc21zLgo+PiAKPj4gCUhvd2V2ZXIsIEkgdGhpbmsgaXQgaXMgaW1w
b3J0YW50IHRvIGNvbnNpZGVyIHRoZSByZWFsaXR5IGZvciBtYW55Cj4+IGp1bmlvciBkcml2ZXIg
ZGV2ZWxvcGVycyAobXlzZWxmIGluY2x1ZGVkKS4gV2Ugb2Z0ZW4gbGFjayB0aGUgZGVlcAo+PiBp
bnR1aXRpb24gYW5kIGV4dGVuc2l2ZSBleHBlcmllbmNlIHJlcXVpcmVkIHRvIHdpZWxkIHRoZXNl
IHBvd2VyZnVsIHRvb2xzCj4+IGVmZmVjdGl2ZWx5IGluIGV2ZXJ5IHNjZW5hcmlvLiBNb3JlIG9m
dGVuIHRoYW4gbm90LCB3ZSBzdGlsbCByZWx5IG9uCj4+IHByaW1pdGl2ZSBtZXRob2RzOiBzdHJ1
Z2dsaW5nIHRvIHJlcHJvZHVjZSBpbnRlcm1pdHRlbnQgY3Jhc2hlcywKPj4gc2NhdHRlcmluZyBw
cmludGsgbG9ncyBldmVyeXdoZXJlLCBhbmQgbWFudWFsbHkgdHJhY2luZyBleGVjdXRpb24gcGF0
aHMuCj4+IFRoaXMgcHJvY2VzcyBpcyBleHRyZW1lbHkgdGltZS1jb25zdW1pbmcgYW5kIG9mdGVu
IHlpZWxkcyBubyBjbGVhcgo+PiBjb25jbHVzaW9ucyBmb3IgInNpbGVudCIgcmVzb3VyY2UgbGVh
a3MuCj4+IAo+PiAJV2hpbGUgSSBhbSBhY3RpdmVseSB3b3JraW5nIHRvIGltcHJvdmUgbXkgc2tp
bGxzIGFuZCBsZWFybiB0byB1c2UKPj4gdGhlc2UgYWR2YW5jZWQgdG9vbHMgbW9yZSBwcm9maWNp
ZW50bHkuIEkgcmVtYWluIGNvbnZpbmNlZCB0aGF0IHByb3ZpZGluZwo+PiBzdWNoIGEgc2ltcGxl
LCBpbnR1aXRpdmUgaW50ZXJmYWNlIG9mZmVycyBhIG5lY2Vzc2FyeSBzdXBwbGVtZW50IGJ5Cj4+
IHNlcnZpbmcgYXMgYSBsb3ctYmFycmllciBlbnRyeSBwb2ludCBmb3IgZGV2ZWxvcGVycy4KPj4g
Cj4+IAlJIGhvcGUgdGhpcyBwZXJzcGVjdGl2ZSBjbGFyaWZpZXMgd2h5IEkgYmVsaWV2ZSB0aGlz
IHNtYWxsIGNoYW5nZQo+PiBjYW4gYnJpbmcgYSBiaXQgb2YgY29udmVuaWVuY2UgdG8gYSBicm9h
ZGVyIHJhbmdlIG9mIGRyaXZlciBkZXZlbG9wZXJzLgo+Cj5KdXN0IGVuYWJsZSBLQVNBTiBhbmQg
bGlzdCBkZWJ1Z2dpbmcgaW4gdGhlIGZ1dHVyZS4gTmV3IGludGVyZmFjZXMgbGlrZQo+dGhpcyB3
b24ndCBpbXByb3ZlIHRoaW5ncyBhdCBsYXJnZS4KPgo+LS0gCj5LaW5kIHJlZ2FyZHMsCj4KPlNh
a2FyaSBBaWx1cwo=

