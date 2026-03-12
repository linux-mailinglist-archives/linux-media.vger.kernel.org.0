Return-Path: <linux-media+bounces-55483-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LEgFBZmsmk3MQAAu9opvQ
	(envelope-from <linux-media+bounces-55483-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 08:07:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4397226E269
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 08:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C7CAA300E484
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 07:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792893A9D9D;
	Thu, 12 Mar 2026 07:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="K5x+Lu/D"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8F1306B11;
	Thu, 12 Mar 2026 07:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773299215; cv=none; b=FnIdFgcagXJUk2uTlRaUmG3EYClkz2ZgxiKCx2Jxy5Hbz1qlaMNQR83yuKWA1rh+5IV0eQmeQpju2tRSZxA1NnuuZoCfeg+sEM5kvCxkpERRPK1VEZEj6EBXKs96aQC8mHzWzFrXIzVUSJosj8wiGwmqUWMP0ORK7OvVlmrvGxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773299215; c=relaxed/simple;
	bh=+WP0nQjbtOnP/rcXyH2yWOFbvQM8MDhMhwpOBitvgQo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=r3KyBlZBcrkZoQ2P8aKAcAkkjwHknnoNctw1rfKcCu8a9gvWTcyvusKZCR46boRhiNK637s4XVTj7IxmxXf+/mocfOoqQjpgwlp+Zq1FYJCz36JIoHFxoakEIiYvQjCKiSqNkWWZolwWBOC5FetpsNRUNzhzrQecurYAzT0P5+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=K5x+Lu/D; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=+WP0nQjbtOnP/rcXyH2yWOFbvQM8MDhMhwpOBitvgQo=; b=K
	5x+Lu/Dcz3UH2reBYhAtdj2ejhrgSzITNor0GAwzilBHnuydtz6jcpbpzjxqJNUC
	bu4LC2Yc7zPoph8inFgD/LHHhUAQ95f1GQxFKSit9AvJBSUa+cyqA5QBBEpJH7Mb
	fcbHXQ+3Tyk6e1prZ0xbZZHyA/2+Ye/lu29MhQ5tgo=
Received: from luo.liu.linux$163.com ( [112.64.125.122] ) by
 ajax-webmail-wmsvr-40-131 (Coremail) ; Thu, 12 Mar 2026 15:06:24 +0800
 (CST)
Date: Thu, 12 Mar 2026 15:06:24 +0800 (CST)
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
X-NTES-SC: AL_Qu2cAf6Stkkj4iaQYekWn0sSh+Y3WcC2uP0u2IYbaOQOpTHkwhgMcG1lJXrZ+fqWGRCjvRyJXQB118NcfrJNW+RZDbKk2BZohoFwqw2W
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1f76a832.5a3e.19ce0de3433.Coremail.luo.liu.linux@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gygvCgD3n5DwZbJpBCR3AA--.41851W
X-CM-SenderInfo: hoxrhztlxozxxqx0qiywtou0bp/xtbC6xCcDmmyZfCnuQAA35
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
	TAGGED_FROM(0.00)[bounces-55483-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luo.liu.linux@163.com,linux-media@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4397226E269
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgpIaSBTYWthcmksCgogICAgIFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmV2aWV3IGFu
ZCBzdWdnZXN0aW9ucy4KICAKICAgICBJIGNvbnNpZGVyZWQgd3JhcHBpbmcgdGhlIGVudGlyZSBi
bG9jayBpbiBhIHNpbmdsZSAjaWZkZWYsIGJ1dCBzaW5jZSB2NGwyX2FzeW5jX2luaXQgYW5kIHY0
bDJfYXN5bmNfZXhpdCBhcmUgbWFuZGF0b3J5IG1vZHVsZSBlbnRyeSBwb2ludHMsIHRoZXkgY2Fu
bm90IGJlIG9taXR0ZWQgZXZlbiB3aGVuIENPTkZJR19ERUJVR19GUyBpcyBkaXNhYmxlZC4KIFRo
ZXJlZm9yZSwgdGhlICNpZmRlZiBndWFyZHMgaW5zaWRlIHRoZXNlIGZ1bmN0aW9ucyBhcmUgbmVj
ZXNzYXJ5IHRvIHByZXZlbnQgcmVmZXJlbmNlcyB0byB1bmRlZmluZWQgc3ltYm9scyAobGlrZSBw
ZW5kaW5nX3N1YmRldnNfZm9wcyBhbmQgdjRsMl9hc3luY19kZWJ1Z2ZzX2Rpcikgd2hpbGUga2Vl
cGluZyB0aGUgZnVuY3Rpb24gZGVmaW5pdGlvbnMgdGhlbXNlbHZlcyBpbnRhY3QKCiAgICAgSSBo
YXZlIGNvbnNvbGlkYXRlZCBhbGwgZGVidWdmcy1zcGVjaWZpYyBkZWZpbml0aW9ucyAodGhlIHNo
b3cgZnVuY3Rpb24gYW5kIHRoZSBkaXJlY3RvcnkgcG9pbnRlcikgaW50byBvbmUgYmxvY2sgdG8g
a2VlcCB0aGUgY29kZSBjbGVhbiwgbGVhdmluZyBvbmx5IHRoZSBtaW5pbWFsIG5lY2Vzc2FyeSBn
dWFyZHMgaW5zaWRlIHRoZSBpbml0L2V4aXQgZnVuY3Rpb25zCgoKCgoKCiAKCgoKCgoKCgoKCgoK
CgoKCkF0IDIwMjYtMDMtMTEgMTc6MjA6NDEsICJTYWthcmkgQWlsdXMiIDxzYWthcmkuYWlsdXNA
bGludXguaW50ZWwuY29tPiB3cm90ZToKPk9uIEZyaSwgTWFyIDA2LCAyMDI2IGF0IDA1OjQxOjE3
UE0gKzA4MDAsIGx1by5saXUubGludXggd3JvdGU6Cj4+ICAKPj4gIEhlbGxvIFNha2FyaSBhbmQg
TWF1cm+jrAo+PiAgIAo+PiAgICAgIEdlbnRsZSBwaW5nIC4uLi4KPj4gCj4+IAo+PiBBdCAyMDI2
LTAxLTIxIDExOjE0OjU2LCAibHVvLmxpdSIgPGx1by5saXUubGludXhAMTYzLmNvbT4gd3JvdGU6
Cj4+ID5BbGwgZGVidWdmcy1yZWxhdGVkIGNvZGUgaXMgZ3VhcmRlZCBieSBDT05GSUdfREVCVUdf
RlMgdG8gYXZvaWQKPj4gPmJsb2F0aW5nIHRoZSBrZXJuZWwgd2hlbiBkZWJ1Z2ZzIGlzIGRpc2Fi
bGVkLgo+PiA+Cj4+ID5TaWduZWQtb2ZmLWJ5OiBsdW8ubGl1IDxsdW8ubGl1LmxpbnV4QDE2My5j
b20+Cj4+ID4tLS0KPj4gPiBkcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWFzeW5jLmMgfCA2
ICsrKysrKwo+PiA+IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4gPgo+PiA+ZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItYXN5bmMuYyBiL2RyaXZlcnMv
bWVkaWEvdjRsMi1jb3JlL3Y0bDItYXN5bmMuYwo+PiA+aW5kZXggMWMwOGJiYTllY2I5Li5mNmEx
YTU3MTQ5YmEgMTAwNjQ0Cj4+ID4tLS0gYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWFz
eW5jLmMKPj4gPisrKyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItYXN5bmMuYwo+PiA+
QEAgLTk0Nyw2ICs5NDcsNyBAQCB2NGwyX2FzeW5jX25mX25hbWUoc3RydWN0IHY0bDJfYXN5bmNf
bm90aWZpZXIgKm5vdGlmaWVyKQo+PiA+IAkJcmV0dXJuICJuaWwiOwo+PiA+IH0KPj4gPiAKPj4g
PisjaWZkZWYgQ09ORklHX0RFQlVHX0ZTCj4+ID4gc3RhdGljIGludCBwZW5kaW5nX3N1YmRldnNf
c2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKmRhdGEpCj4+ID4gewo+PiA+IAlzdHJ1Y3Qg
djRsMl9hc3luY19ub3RpZmllciAqbm90aWY7Cj4+ID5AQCAtOTY3LDIwICs5NjgsMjUgQEAgc3Rh
dGljIGludCBwZW5kaW5nX3N1YmRldnNfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKmRh
dGEpCj4+ID4gREVGSU5FX1NIT1dfQVRUUklCVVRFKHBlbmRpbmdfc3ViZGV2cyk7Cj4+ID4gCj4+
ID4gc3RhdGljIHN0cnVjdCBkZW50cnkgKnY0bDJfYXN5bmNfZGVidWdmc19kaXI7Cj4+ID4rI2Vu
ZGlmCj4+ID4gCj4+ID4gc3RhdGljIGludCBfX2luaXQgdjRsMl9hc3luY19pbml0KHZvaWQpCj4+
ID4gewo+PiA+KyNpZmRlZiBDT05GSUdfREVCVUdfRlMKPj4gPiAJdjRsMl9hc3luY19kZWJ1Z2Zz
X2RpciA9IGRlYnVnZnNfY3JlYXRlX2RpcigidjRsMi1hc3luYyIsIE5VTEwpOwo+PiA+IAlkZWJ1
Z2ZzX2NyZWF0ZV9maWxlKCJwZW5kaW5nX2FzeW5jX3N1YmRldmljZXMiLCAwNDQ0LAo+PiA+IAkJ
CSAgICB2NGwyX2FzeW5jX2RlYnVnZnNfZGlyLCBOVUxMLAo+PiA+IAkJCSAgICAmcGVuZGluZ19z
dWJkZXZzX2ZvcHMpOwo+PiA+IAo+PiA+KyNlbmRpZgo+PiA+IAlyZXR1cm4gMDsKPj4gPiB9Cj4+
ID4gCj4+ID4gc3RhdGljIHZvaWQgX19leGl0IHY0bDJfYXN5bmNfZXhpdCh2b2lkKQo+PiA+IHsK
Pj4gPisjaWZkZWYgQ09ORklHX0RFQlVHX0ZTCj4+ID4gCWRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2
ZSh2NGwyX2FzeW5jX2RlYnVnZnNfZGlyKTsKPj4gPisjZW5kaWYKPj4gPiB9Cj4KPklmIGRlYnVn
ZnMgaXMgZGlzYWJsZWQsIHRoZSBpbml0IGZ1bmN0aW9ucyB3b24ndCBkbyBhbnl0aGluZy4gWW91
IGNhbiBwdXQKPnRoZXNlIGJlaGluZCBhIHNpbmdsZSAjaWZkZWYgLi4gI2VuZGlmLgo+Cj4tLSAK
PlNha2FyaSBBaWx1cwo=

