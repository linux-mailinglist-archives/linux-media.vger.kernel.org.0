Return-Path: <linux-media+bounces-55693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKPJJ00XtGlkgwAAu9opvQ
	(envelope-from <linux-media+bounces-55693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:55:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A016284506
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 14:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FFA6318A69A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04BC3976BC;
	Fri, 13 Mar 2026 13:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PB/FhSBs"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C656437703B;
	Fri, 13 Mar 2026 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409893; cv=none; b=PAel08rAusqz1VXPzKvNG5YowxLHSlZTVawS026qcP6wy+UrQI4zj8zhYEUVJN0HH4fqnm1AlVffKFn5XV60A37qiNUSCNvmv/4riSaRmPfTW0gcftACRDAnMq4HzZvq7Iz1twxlLBvqRIjA2GxaQr0RA1q5nyd212NAfjiEKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409893; c=relaxed/simple;
	bh=amYuh9JPapIGiIyjGxpC58edNjxMuoLjRpByuFuy/mA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=VACKs3VBModgte/4F1EumQ8O4Y/emu9/8UtdQSDpHyhFSgqXMgzTgdLk0y5pJ1z6vyTXj9njG0BA1NkZzAEwFE4Mq9qOqMQgIQITJj9C9r1wRNzO6qcFOqqPiORGcwmvWlAMGY3u55JtAJ7vBaIWeXW8pbFNtzPpG/HmMLKGpOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PB/FhSBs; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=amYuh9JPapIGiIyjGxpC58edNjxMuoLjRpByuFuy/mA=; b=P
	B/FhSBsM8prrYLepBQPlPgLY9fX7XT4LhIy8sEdfU5Nc+L/8ng2vXCqY7crsFPoK
	Z76rtHYaJLmiWAHAWy3odjIyPUBDex1rQ/qSdkhGKOMhnhjO6cDMoUVesNWLzPI1
	z4p6k+Ib8dbWPAc9TZN787FBIeSWE6eMNq/XUZwwvg=
Received: from luo.liu.linux$163.com ( [112.64.125.122] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Fri, 13 Mar 2026 21:50:56 +0800
 (CST)
Date: Fri, 13 Mar 2026 21:50:56 +0800 (CST)
From: "luo.liu.linux" <luo.liu.linux@163.com>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: Re: [PATCH] media:v4l2-async:debugfs for registered
 subdevices
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <abP4Mr_s8JRpQH0B@kekkonen.localdomain>
References: <20260313075824.2818713-1-luo.liu.linux@163.com>
 <abPm3VGGRAIsY1eQ@kekkonen.localdomain>
 <5e63e8aa.943f.19ce6ee4ad5.Coremail.luo.liu.linux@163.com>
 <abP4Mr_s8JRpQH0B@kekkonen.localdomain>
X-NTES-SC: AL_Qu2cAfibtkAu4CWcZOkWn0sSh+Y3WcC2uP0u2IYbTeUxuzDh3SoqTGJvP2vQ9OujNw+KtDqbXz51xsZiUKXHtkwwNWFz/BUHRKm+V5MR
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <384d2274.9b3e.19ce776ec2c.Coremail.luo.liu.linux@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgDXf3FAFrRpDhl5AA--.48783W
X-CM-SenderInfo: hoxrhztlxozxxqx0qiywtou0bp/xtbCwwAdjmm0FkBcawAA3s
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spamd-Result: default: False [-1.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55693-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0A016284506
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CkhpIFNha2FyaSwKCiAgICBBcG9sb2dpZXMgaWYgbXkgcHJldmlvdXMgZXhwbGFuYXRpb24gd2Fz
bid0IGNsZWFyIGVub3VnaC4gCgogICAgVG8gY2xhcmlmeSwgdGhlIHByaW1hcnkgZ29hbCBvZiB0
aGlzIGludGVyZmFjZSBpcyBub3QgbWVyZWx5IHRvIHZlcmlmeSBpZiBpbnNtb2Qvcm1tb2Qgc3Vj
Y2VlZHMsIApidXQgdG8gdmFsaWRhdGUgdGhlIGNvcnJlY3RuZXNzIG9mIHRoZSBhc3luY2hyb25v
dXMgc3ViZGV2aWNlIHJlZ2lzdHJhdGlvbiBhbmQgdW5yZWdpc3RyYXRpb24gcGF0aHMsCnNwZWNp
ZmljYWxseSBlbnN1cmluZyB0aGF0IHJlc291cmNlIGFsbG9jYXRpb24gYW5kIHJlY2xhbWF0aW9u
IGFyZSBoYW5kbGVkIHByb3Blcmx5LgoKICAgSSB3b3VsZCBsaWtlIHRvIHNoYXJlIGEgcmVhbC13
b3JsZCBzY2VuYXJpbyB0aGF0IG1vdGl2YXRlZCB0aGlzIHBhdGNoOgoKICAgV2UgaGFkIGEgY2Ft
ZXJhIHN1YnN5c3RlbSBwaXBlbGluZSBsaWtlIHNlbnNvciAtPiBkcGh5IC0+IG1pcGktY3NpMiAt
PiBpc3AKc3ViZGV2aWNlIGRyaXZlciB0aGF0IGFwcGVhcmVkIHRvIGZ1bmN0aW9uIHBlcmZlY3Rs
eSBmb3Igc2l4IG1vbnRocy4gaW5zbW9kIGFuZCBybW1vZCBjb21wbGV0ZWQgd2l0aG91dCBhbnkg
ZXJyb3JzLAphbmQgdGhlIHN5c3RlbSBzZWVtZWQgc3RhYmxlIGR1cmluZyBub3JtYWwgb3BlcmF0
aW9uLiBIb3dldmVyLCBqdXN0IGJlZm9yZSBhIG1ham9yIHJlbGVhc2UsIGEgUUEgZW5naW5lZXIg
cGVyZm9ybWVkIApzdHJlc3MgdGVzdGluZyBpbnZvbHZpbmcgcmFwaWQsIHJlcGVhdGVkIGN5Y2xl
cyBvZiBpbnNtb2QgYW5kIHJtbW9kLCB3aGljaCBldmVudHVhbGx5IHRyaWdnZXJlZCBhIGtlcm5l
bCBjcmFzaC4KCkR1cmluZyB0aGUgZGVidWdnaW5nIHByb2Nlc3MsIEkgaW5zcGVjdGVkIHRoZSBp
bnRlcm5hbCBnbG9iYWwgbGlzdHM6CgpzdGF0aWMgTElTVF9IRUFEKHN1YmRldl9saXN0KTsKc3Rh
dGljIExJU1RfSEVBRChub3RpZmllcl9saXN0KTsKCkJ5IGR1bXBpbmcgdGhlIHN1YmRldl9saXN0
IHZpYSB0aGlzIGRlYnVnZnMgaW50ZXJmYWNlLCBJIGRpc2NvdmVyZWQgdGhhdCBhIEQtUEhZIHN1
YmRldmljZSBlbnRyeSByZW1haW5lZCBpbiB0aGUgbGlzdCBldmVuIAphZnRlciBpdHMgZHJpdmVy
IHdhcyB1bmxvYWRlZC4gQ3J1Y2lhbGx5LCB0aGUgb3V0cHV0IGV4cGxpY2l0bHkgc2hvd2VkIHRo
ZSBkZXZpY2UgbmFtZSwgYWxsb3dpbmcgbWUgdG8gaW1tZWRpYXRlbHkgcGlucG9pbnQKdGhlIEQt
UEhZIGRyaXZlciBhcyB0aGUgY3VscHJpdCwgcmF0aGVyIHRoYW4gYmxpbmRseSB0cm91Ymxlc2hv
b3Rpbmcgb3RoZXIgY29tcG9uZW50cyBpbiB0aGUgcGlwZWxpbmUgKHN1Y2ggYXMgdGhlIHNlbnNv
ciBvciBJU1ApLgoKVGhpcyB3YXMgdGhlIGNyaXRpY2FsIGNsdWUgdGhhdCBsZWQgbWUgdG8gdGhl
IHJvb3QgY2F1c2U6IAoKVGhlIEQtUEhZIHN1YmRyaXZlcidzIHJlbW92ZSBmdW5jdGlvbiB3YXMg
bWlzc2luZyBhIGNhbGwgdG8gdjRsMl9hc3luY19jbGVhbnVwKHNkKS4gQ29uc2VxdWVudGx5LCB0
aGUgc3ViZGV2aWNlIHdhcyBuZXZlciBwcm9wZXJseSAKdW5yZWdpc3RlcmVkIGZyb20gdGhlIGFz
eW5jIGZyYW1ld29yaywgbGVhZGluZyB0byBhIHVzZS1hZnRlci1mcmVlIG9yIHN0YWxlIHBvaW50
ZXIgaXNzdWUgZHVyaW5nIHRoZSBzdHJlc3MgdGVzdC4KCldpdGhvdXQgdGhpcyBkZWJ1Z2ZzIGlu
dGVyZmFjZSwgZGV0ZWN0aW5nIHN1Y2ggInNpbGVudCIgcmVnaXN0cmF0aW9uIGxlYWtzIGlzIGV4
dHJlbWVseSBkaWZmaWN1bHQuIApUaGUgZHJpdmVyIGxvYWRzIGFuZCB1bmxvYWRzIHdpdGhvdXQg
cmVwb3J0aW5nIGVycm9ycywgYW5kIHN0YW5kYXJkIGxvZ3MgKGRtZXNnKSBvZnRlbiBwcm92aWRl
Cm5vIGluZGljYXRpb24gdGhhdCBhbiBlbnRyeSB3YXMgbGVmdCBiZWhpbmQgaW4gdGhlIGNvcmUg
ZnJhbWV3b3JrJ3MgbGlzdCB1bnRpbCBhIGNyYXNoIG9jY3VycyB1bmRlciBzcGVjaWZpYyB0aW1p
bmcgY29uZGl0aW9ucy4KCgpHaXZlbiB0aGlzIGV4cGVyaWVuY2UsIEkgYmVsaWV2ZSB0aGlzIGlu
dGVyZmFjZSBwcm92aWRlcyBhIHZpdGFsIHZpc2liaWxpdHkgcG9pbnQgZm9yIGVuZ2luZWVycyB0
bzoKCjEsVmVyaWZ5IHRoYXQgc3ViZGV2aWNlcyBhcmUgY29ycmVjdGx5IHJlbW92ZWQgZnJvbSB0
aGUgZ2xvYmFsIGxpc3QgdXBvbiBkcml2ZXIgdW5sb2FkLgoyLENhdGNoIG1pc3NpbmcgY2xlYW51
cCBjYWxscyAobGlrZSB2NGwyX2FzeW5jX2NsZWFudXApIGVhcmx5IGluIHRoZSBkZXZlbG9wbWVu
dCBjeWNsZSwgcmF0aGVyIHRoYW4gZGlzY292ZXJpbmcgdGhlbSB0aHJvdWdoIHJhbmRvbSBjcmFz
aGVzIGluIHN0cmVzcyB0ZXN0aW5nLgoKCkkgaG9wZSB0aGlzIGNvbnRleHQgY2xhcmlmaWVzIHdo
eSBJIGNvbnNpZGVyIHRoaXMgZGVidWdmcyBpbnRlcmZhY2UgbWVhbmluZ2Z1bCBhbmQgbmVjZXNz
YXJ5IGZvciByb2J1c3QgZHJpdmVyIGRldmVsb3BtZW50LgoKQmVzdCByZWdhcmRzLApMdW8KCgoK
CgoKCgoKCgoKCgoKCgoKQXQgMjAyNi0wMy0xMyAxOTo0Mjo0MiwgIlNha2FyaSBBaWx1cyIgPHNh
a2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+SGkgTHVvLAo+Cj5PbiBGcmksIE1h
ciAxMywgMjAyNiBhdCAwNzoyMTo0MlBNICswODAwLCBsdW8ubGl1LmxpbnV4IHdyb3RlOgo+PiAK
Pj4gSGkgU2FrYXJpo6wKPj4gCj4+ICAgICBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHJl
cGx5Lgo+PiAKPj4gICAgICBXaGVuIGJ1aWxkaW5nIGEgcGlwZWxpbmUgaW4gdGhlIGNhbWVyYSBz
dWJzeXN0ZW0gdmlhIE1lZGlhIEVudGl0aWVzCj4+ICAKPj4gKGUuZy4sIFNlbnNvciAtPiBEUEhZ
IC0+IE1JUEktQ1NJMiAtPiBJU1ApLCBpdCBpcyBjcnVjaWFsIHRvIHZlcmlmeSB0aGF0IHRoZSBy
ZWdpc3RyYXRpb24KPj4gCj4+ICBhbmQgdW5yZWdpc3RyYXRpb24gcHJvY2Vzc2VzIGZvciBlYWNo
IHN1Yi1kZXZpY2UgKHN1YmRldikgZHJpdmVyIHdpdGhpbiB0aGUgcGlwZWxpbmUgCj4+IAo+PiBh
cmUgZnVuY3Rpb25pbmcgY29ycmVjdGx5Lgo+Cj5Zb3UgZG9uJ3QgbmVlZCBhIGRlYnVnZnMgaW50
ZXJmYWNlIGZvciB0aGF0LCBkbyB5b3U/IFdlIGhhdmUgYSBsYXJnZSBudW1iZXIKPm9mIHRoaW5n
cyB0aGF0IGNhbiBnbyB3cm9uZyB0aGF0IGFyZSBtdWNoIG1vcmUgY29tcGxpY2F0ZWQgdGhhbiB0
aGlzIChhbmQKPnRoZXJlJ3Mgbm8gZGVidWdmcyBpbnRlcmZhY2UgdG8gdmVyaWZ5IHRob3NlIGVp
dGhlciwgbm8sIGxhcmdlbHkgYmVjYXVzZSBpdAo+d291bGRuJ3QgYmUgbWVhbmluZ2Z1bCkuCj4K
Pi0tIAo+UmVnYXJkcywKPgo+U2FrYXJpIEFpbHVzCg==

