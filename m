Return-Path: <linux-media+bounces-56474-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AsPLhrvvGme4gIAu9opvQ
	(envelope-from <linux-media+bounces-56474-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:54:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB6F2D65A9
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37316307A6C6
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 06:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3C1358369;
	Fri, 20 Mar 2026 06:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GQ3Kkff6"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F38355F59;
	Fri, 20 Mar 2026 06:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773989648; cv=none; b=bBu2X3YUO6mQ0+NwKIPnXROmtuk80VpPug1N/x8+kQ2dh/g2lfUp15mAOEbO1GUseY01dmnfxKABDaKaBRDvM19IiMI3uPeIKf4idWRshQS3VfZ8r8sZ5ZUlQBjnYGtJ1sILth3+Vc7o+HACHI54l1s8eWAWEF2EecCCBcqf3YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773989648; c=relaxed/simple;
	bh=p1iE5SQ1Nr0RQM/ILZCHIvFH0zad5/yHugaR6iWeXq0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ZXOEQEhSLEi0n30TXhCdHj8Y/tZVxCp3XuDPsuArH/wA83RIF7InBto0bLgOpnXbSsvWKfmWm73gNUea7v/l0+2lG4SLj08vG+hcL+bQgNwF3LCMnVOZJxdJM95T3fkAsIxKGisripvUaDtppG5siKq/XXY5SacK1a6WVYyUsFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GQ3Kkff6; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=p1iE5SQ1Nr0RQM/ILZCHIvFH0zad5/yHugaR6iWeXq0=; b=G
	Q3Kkff6Z7FEBIEDhUPEscyxf9tG+wXu/Gj9DWW9TtiMCG2XciGUSFSYeeMkgXDxq
	Fmb2yL+gsLyodhVkSOQpjGHDnGJj6CrlP+XasjkzEmEtIjHeIqHJsipkKDPc43x2
	KKN5Gq655+9uWEhXJAu34PJ6rH6ZqvhD6VgU837U7w=
Received: from luo.liu.linux$163.com ( [112.64.125.122] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Fri, 20 Mar 2026 14:52:50 +0800
 (CST)
Date: Fri, 20 Mar 2026 14:52:50 +0800 (CST)
From: "luo.liu.linux" <luo.liu.linux@163.com>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
	"Sakari Ailus" <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: Re: Re: Re: Re: [PATCH] media:v4l2-async:debugfs for
 registered subdevices
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260319203037.GF860715@killaraus.ideasonboard.com>
References: <20260313075824.2818713-1-luo.liu.linux@163.com>
 <abPm3VGGRAIsY1eQ@kekkonen.localdomain>
 <5e63e8aa.943f.19ce6ee4ad5.Coremail.luo.liu.linux@163.com>
 <abP4Mr_s8JRpQH0B@kekkonen.localdomain>
 <384d2274.9b3e.19ce776ec2c.Coremail.luo.liu.linux@163.com>
 <abg0R5zerwCM_1mK@kekkonen.localdomain>
 <186862ed.3836.19cf9df139c.Coremail.luo.liu.linux@163.com>
 <abkPC3sHVUdGuww1@kekkonen.localdomain>
 <4155da3e.9361.19cfb815615.Coremail.luo.liu.linux@163.com>
 <20260319203037.GF860715@killaraus.ideasonboard.com>
X-NTES-SC: AL_Qu2cAfWTtk0s5iWQZOkWn0sSh+Y3WcC2uP0u2IYbRuUevC3z+y0jZ3BzElXu0fqFFiGgqiGMYDF89OBIW7KTjMzVfJfJ0LUBR9jl1qAl
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <4de2b255.55d8.19d0a04a81e.Coremail.luo.liu.linux@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:aygvCgD3d+DC7rxpvSp9AA--.55821W
X-CM-SenderInfo: hoxrhztlxozxxqx0qiywtou0bp/xtbC6wJ15mm87sI43QAA3m
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	TAGGED_FROM(0.00)[bounces-56474-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luo.liu.linux@163.com,linux-media@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1BB6F2D65A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgpIaSBMYXVyZW50IO+8jFNha2FyaSwgCgox77yMQ3VycmVudCBkZWJ1Z2dpbmcgdG9vbHMgKEtB
U0FOLCBDT05GSUdfREVCVUdfTElTVCkgb3BlcmF0ZSBvbiBhIHBhc3NpdmUgZGVmZW5zZSBtb2Rl
bDoKCiAgICAgdGhleSBvbmx5IGFsZXJ0IHdoZW4gZXhwbGljaXQgZXJyb3JzIG9jY3VyLCBzdWNo
IGFzIGNvcnJ1cHRlZCBwb2ludGVycyBvciBpbGxlZ2FsIG1lbW9yeSBhY2Nlc3MuIFRoZXkgYXJl
IGZ1bmRhbWVudGFsbHkgYmxpbmQgdG8gImxvZ2ljYWwgb21pc3Npb25zIuKAlHN0YXRlcyB3aGVy
ZSBkYXRhIHNob3VsZCBoYXZlIGJlZW4gcmVtb3ZlZCBidXQgd2Fzbid0LgpDb25zaWRlciB0aGUg
c2NlbmFyaW8gd2hlcmUgYSBkcml2ZXIgZm9yZ2V0cyB0byBjYWxswqB2NGwyX2FzeW5jX3VucmVn
aXN0ZXJfc3ViZGV2KCk6CgpMaXN0IERlYnVnIHJlbWFpbnMgc2lsZW50OsKgU2luY2Ugbm/CoGxp
c3RfZGVsKCnCoGlzIGV4ZWN1dGVkLCB0aGXCoHNkLT5hc3luY19saXN0wqBub2RlIHJlbWFpbnMg
c3RydWN0dXJhbGx5IGludGFjdCB3aXRoaW7CoHN1YmRldl9saXN0LCB3aXRoIHZhbGlkwqBwcmV2
wqBhbmTCoG5leHTCoGxpbmtzLgoKS0FTQU4gcmVtYWlucyBzaWxlbnQ6wqBJdCBkZXRlY3RzwqBh
Y2Nlc3PCoHRvIGZyZWVkIG1lbW9yeSwgbm90IHRoZcKgZXhpc3RlbmNlwqBvZiBkYW5nbGluZyBw
b2ludGVycy4gSWYgdGhlIG9ycGhhbmVkIG5vZGUgaXMgbmV2ZXIgdHJhdmVyc2VkIGFmdGVyIHRo
ZSBkcml2ZXIgZnJlZXMgaXRzIG1lbW9yeSwgbm8gVXNlLUFmdGVyLUZyZWUgaXMgdHJpZ2dlcmVk
LgoKCkluIHRoZSBzY2VuYXJpbyBJIGRlc2NyaWJlZCBpbiBteSBwcmV2aW91cyBlbWFpbO+8jHRo
ZSBidWcgcmVtYWlucyBkb3JtYW50IGFuZCBpbnZpc2libGUgZHVyaW5nIG5vcm1hbCBvcGVyYXRp
b24uIFRoZSBkcml2ZXIgY291bGQgcnVuIGZsYXdsZXNzbHkgZm9yIHllYXJzLCBvbmx5IHJldmVh
bGluZyB0aGUgaXNzdWUgdW5kZXIgc3BlY2lmaWMgc3RyZXNzIGNvbmRpdGlvbnMKCgoy77yMSSBu
b3RpY2VkIHRoYXQgdGhlIGltcGxlbWVudGF0aW9uIG9mIHY0bDJfYXN5bmNfdW5yZWdpc3Rlcl9z
dWJkZXYoKSByZXZlYWxzIGEgY3JpdGljYWwgc3RhdGUgZGVwZW5kZW5jeToKCnZvaWQgdjRsMl9h
c3luY191bnJlZ2lzdGVyX3N1YmRldihzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkKQp7CiAgICAvLyAu
Li4KICAgIGlmICghc2QtPmFzeW5jX2xpc3QubmV4dCkKICAgICAgICByZXR1cm47IC8vIEd1YXJk
IGNoZWNrIGltcGxpZXMgdGhlIG5vZGUgbXVzdCBiZSBsaW5rZWQgdG8gcHJvY2VlZAogICAgLy8g
Li4uCn0KClRoaXMgZ3VhcmQgY2hlY2sgKGlmICghc2QtPmFzeW5jX2xpc3QubmV4dCkpIGhpZ2hs
aWdodHMgdGhlIGZyYWdpbGl0eSBvZiB0aGUgc3RhdGUgbWFjaGluZS4gSWYgYSBkcml2ZXIgbWlz
bWFuYWdlcyBpdHMgbGlmZWN5Y2xlIG9yIHNpbXBseSBvbWl0cyB0aGlzIGNhbGwsIHRoZSBzdWJk
ZXYgcmVtYWlucyBwZXJtYW5lbnRseSBzdHJhbmRlZCBpbiBzdWJkZXZfbGlzdC4gVGhpcyBpcyBh
IGxvZ2ljYWwgY29uc2lzdGVuY3kgZXJyb3LigJR0aGUgZGF0YSBzdHJ1Y3R1cmUgaXMgdmFsaWQg
YnV0IHNlbWFudGljYWxseSBpbmNvcnJlY3TigJRyYXRoZXIgdGhhbiBhIG1lbW9yeSBjb3JydXB0
aW9uIGlzc3VlCgoKM++8jFRvZ2V0aGVyIHdpdGggcGVuZGluZ19zdWJkZXZzX3Nob3csIHRoaXMg
aW50ZXJmYWNlIHByb3ZpZGVzIGEgaG9saXN0aWMgdmlldyBvZiB0aGUgc3Vic3lzdGVtJ3MgaGVh
bHRoLiBJdCBlbmFibGVzIHRlYW1zIHRvIHByb2FjdGl2ZWx5IGlkZW50aWZ5IGxvZ2ljYWwgZmxh
d3MgZHVyaW5nIHRoZSBkZXZlbG9wbWVudCBjeWNsZSwgZWxpbWluYXRpbmcgdGhlIHJlbGlhbmNl
IG9uIGx1Y2sgb3Igc3RyZXNzIHRlc3RzIHRvIHVuY292ZXIgdGhlc2UgZGVlcC1zZWF0ZWQgc3Rh
dGUgbWFuYWdlbWVudCBidWdzCgpSZWdhcmRzLAoKTHVvCgoKCgpBdCAyMDI2LTAzLTIwIDA0OjMw
OjM3LCAiTGF1cmVudCBQaW5jaGFydCIgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4gd3JvdGU6Cj5PbiBUdWUsIE1hciAxNywgMjAyNiBhdCAwNzoxNDo0M1BNICswODAwLCBsdW8u
bGl1LmxpbnV4IHdyb3RlOgo+PiAKPj4gSGkgU2FrYXJpLAo+PiAKPj4gVGhlIGV4aXN0aW5nwqBw
ZW5kaW5nX2FzeW5jX3N1YmRldmljZXPCoGludGVyZmFjZSBwcm92aWRlcyBleGNlbGxlbnQKPj4g
dmlzaWJpbGl0eSBpbnRvIHRoZcKgbm90aWZpZXJfbGlzdMKgKHRoZSAnd2FpdGVyJyBzaWRlKS4K
Pj4KPj4gVG8gYWNoaWV2ZSBmdWxsIHN5bW1ldHJ5IGFuZCBjb21wbGV0ZSBkZWJ1Z2dhYmlsaXR5
LCB3ZSBzaG91bGQgYWxzbwo+PiBleHBvc2UgdGhlwqBzdWJkZXZfbGlzdMKgKHRoZSAncHJvdmlk
ZXInIHNpZGUpLlRoZXNlIHR3byB2aWV3cyBzb2x2ZQo+PiBkaWZmZXJlbnQgcHJvYmxlbXM6Cj4+
IAo+PiAxIE5vdGlmaWVyIExpc3Q6IERpYWdub3NlcyB3aHkgYmluZGluZyBpc8Kgc3RhbGxlZMKg
KG1pc3Npbmcgc3ViLWRldmljZXMpLgo+PiAKPj4gMiBTdWJkZXYgTGlzdDogRGlhZ25vc2VzwqBz
dGF0ZSBpbmNvbnNpc3RlbmNpZXPCoChlLmcuLCBzdWItZGV2aWNlcwo+PiBwcmVzZW50IGJ1dCB1
bm1hdGNoZWQpIGFuZCB2ZXJpZmllc8KgcmVzb3VyY2UgY2xlYW51cMKgdXBvbiB1bmJpbmQuCj4+
IAo+PiBGcm9tIHByYWN0aWNhbCBleHBlcmllbmNlLCBsYWNraW5nIHZpc2liaWxpdHkgaW50b8Kg
c3ViZGV2X2xpc3TCoG1ha2VzCj4+IGl0IGRpZmZpY3VsdCB0byBkaXN0aW5ndWlzaCBiZXR3ZWVu
IGEgc3ViLWRldmljZSBwcm9iZSBmYWlsdXJlIGFuZCBhbgo+PiBhc3luYyBtYXRjaGluZyBmYWls
dXJlLiAKPj4KPj4gQWRkaW5nIHRoaXMgaW50ZXJmYWNlIHdvdWxkIHByb3ZpZGUgYSBob2xpc3Rp
YyB2aWV3IG9mIHRoZSBhc3luYwo+PiBlbmdpbmUncyBzdGF0ZSwgd2hpY2ggaGFzIHByb3ZlbiBl
c3NlbnRpYWwgZm9yIHJhcGlkIGlzc3VlCj4+IGxvY2FsaXphdGlvbiBpbiBjb21wbGV4IGRyaXZl
ciBzdGFja3MuCj4KPkkgYWdyZWUgd2l0aCBTYWthcmkgaGVyZS4gVGhlcmUgYXJlIHBsZW50eSBv
ZiBvdGhlciBkZWJ1Z2dpbmcgdG9vbHMgaW4KPnRoZSBrZXJuZWwgdGhhdCBjYW4gYmUgdXNlZCB0
byBkaWFnbm9zZSB0aGUga2luZCBvZiBpc3N1ZXMgeW91J3ZlCj5kZXNjcmliZWQuIEkgdGhpbmsg
dGhpcyBwYXRjaCBhZGRzIG1vcmUgbm9pc2UgdGhhbiB2YWx1ZS4KPgoKPi0tIAo+UmVnYXJkcywK
PgoKPkxhdXJlbnQgUGluY2hhcnQKCgoKT24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgMDk6NTA6NTZQ
TSArMDgwMCwgbHVvLmxpdS5saW51eCB3cm90ZToKPiAKPiBIaSBTYWthcmksCj4gCj4gICAgIEFw
b2xvZ2llcyBpZiBteSBwcmV2aW91cyBleHBsYW5hdGlvbiB3YXNuJ3QgY2xlYXIgZW5vdWdoLiAK
PiAKPiAgICAgVG8gY2xhcmlmeSwgdGhlIHByaW1hcnkgZ29hbCBvZiB0aGlzIGludGVyZmFjZSBp
cyBub3QgbWVyZWx5IHRvIHZlcmlmeSBpZiBpbnNtb2Qvcm1tb2Qgc3VjY2VlZHMsIAo+IGJ1dCB0
byB2YWxpZGF0ZSB0aGUgY29ycmVjdG5lc3Mgb2YgdGhlIGFzeW5jaHJvbm91cyBzdWJkZXZpY2Ug
cmVnaXN0cmF0aW9uIGFuZCB1bnJlZ2lzdHJhdGlvbiBwYXRocywKPiBzcGVjaWZpY2FsbHkgZW5z
dXJpbmcgdGhhdCByZXNvdXJjZSBhbGxvY2F0aW9uIGFuZCByZWNsYW1hdGlvbiBhcmUgaGFuZGxl
ZCBwcm9wZXJseS4KPiAKPiAgICBJIHdvdWxkIGxpa2UgdG8gc2hhcmUgYSByZWFsLXdvcmxkIHNj
ZW5hcmlvIHRoYXQgbW90aXZhdGVkIHRoaXMgcGF0Y2g6Cj4gCj4gICAgV2UgaGFkIGEgY2FtZXJh
IHN1YnN5c3RlbSBwaXBlbGluZSBsaWtlIHNlbnNvciAtPiBkcGh5IC0+IG1pcGktY3NpMiAtPiBp
c3AKPiBzdWJkZXZpY2UgZHJpdmVyIHRoYXQgYXBwZWFyZWQgdG8gZnVuY3Rpb24gcGVyZmVjdGx5
IGZvciBzaXggbW9udGhzLiBpbnNtb2QgYW5kIHJtbW9kIGNvbXBsZXRlZCB3aXRob3V0IGFueSBl
cnJvcnMsCj4gYW5kIHRoZSBzeXN0ZW0gc2VlbWVkIHN0YWJsZSBkdXJpbmcgbm9ybWFsIG9wZXJh
dGlvbi4gSG93ZXZlciwganVzdCBiZWZvcmUgYSBtYWpvciByZWxlYXNlLCBhIFFBIGVuZ2luZWVy
IHBlcmZvcm1lZCAKPiBzdHJlc3MgdGVzdGluZyBpbnZvbHZpbmcgcmFwaWQsIHJlcGVhdGVkIGN5
Y2xlcyBvZiBpbnNtb2QgYW5kIHJtbW9kLCB3aGljaCBldmVudHVhbGx5IHRyaWdnZXJlZCBhIGtl
cm5lbCBjcmFzaC4KPiAKPiBEdXJpbmcgdGhlIGRlYnVnZ2luZyBwcm9jZXNzLCBJIGluc3BlY3Rl
ZCB0aGUgaW50ZXJuYWwgZ2xvYmFsIGxpc3RzOgo+IAo+IHN0YXRpYyBMSVNUX0hFQUQoc3ViZGV2
X2xpc3QpOwo+IHN0YXRpYyBMSVNUX0hFQUQobm90aWZpZXJfbGlzdCk7Cj4gCj4gQnkgZHVtcGlu
ZyB0aGUgc3ViZGV2X2xpc3QgdmlhIHRoaXMgZGVidWdmcyBpbnRlcmZhY2UsIEkgZGlzY292ZXJl
ZCB0aGF0IGEgRC1QSFkgc3ViZGV2aWNlIGVudHJ5IHJlbWFpbmVkIGluIHRoZSBsaXN0IGV2ZW4g
Cj4gYWZ0ZXIgaXRzIGRyaXZlciB3YXMgdW5sb2FkZWQuIENydWNpYWxseSwgdGhlIG91dHB1dCBl
eHBsaWNpdGx5IHNob3dlZCB0aGUgZGV2aWNlIG5hbWUsIGFsbG93aW5nIG1lIHRvIGltbWVkaWF0
ZWx5IHBpbnBvaW50Cj4gdGhlIEQtUEhZIGRyaXZlciBhcyB0aGUgY3VscHJpdCwgcmF0aGVyIHRo
YW4gYmxpbmRseSB0cm91Ymxlc2hvb3Rpbmcgb3RoZXIgY29tcG9uZW50cyBpbiB0aGUgcGlwZWxp
bmUgKHN1Y2ggYXMgdGhlIHNlbnNvciBvciBJU1ApLgo+IAo+IFRoaXMgd2FzIHRoZSBjcml0aWNh
bCBjbHVlIHRoYXQgbGVkIG1lIHRvIHRoZSByb290IGNhdXNlOiAKPiAKPiBUaGUgRC1QSFkgc3Vi
ZHJpdmVyJ3MgcmVtb3ZlIGZ1bmN0aW9uIHdhcyBtaXNzaW5nIGEgY2FsbCB0byB2NGwyX2FzeW5j
X2NsZWFudXAoc2QpLiBDb25zZXF1ZW50bHksIHRoZSBzdWJkZXZpY2Ugd2FzIG5ldmVyIHByb3Bl
cmx5IAo+IHVucmVnaXN0ZXJlZCBmcm9tIHRoZSBhc3luYyBmcmFtZXdvcmssIGxlYWRpbmcgdG8g
YSB1c2UtYWZ0ZXItZnJlZSBvciBzdGFsZSBwb2ludGVyIGlzc3VlIGR1cmluZyB0aGUgc3RyZXNz
IHRlc3QuCj4gCj4gV2l0aG91dCB0aGlzIGRlYnVnZnMgaW50ZXJmYWNlLCBkZXRlY3Rpbmcgc3Vj
aCAic2lsZW50IiByZWdpc3RyYXRpb24gbGVha3MgaXMgZXh0cmVtZWx5IGRpZmZpY3VsdC4gCj4g
VGhlIGRyaXZlciBsb2FkcyBhbmQgdW5sb2FkcyB3aXRob3V0IHJlcG9ydGluZyBlcnJvcnMsIGFu
ZCBzdGFuZGFyZCBsb2dzIChkbWVzZykgb2Z0ZW4gcHJvdmlkZQo+IG5vIGluZGljYXRpb24gdGhh
dCBhbiBlbnRyeSB3YXMgbGVmdCBiZWhpbmQgaW4gdGhlIGNvcmUgZnJhbWV3b3JrJ3MgbGlzdCB1
bnRpbCBhIGNyYXNoIG9jY3VycyB1bmRlciBzcGVjaWZpYyB0aW1pbmcgY29uZGl0aW9ucy4KPiAK
PiAKPiBHaXZlbiB0aGlzIGV4cGVyaWVuY2UsIEkgYmVsaWV2ZSB0aGlzIGludGVyZmFjZSBwcm92
aWRlcyBhIHZpdGFsIHZpc2liaWxpdHkgcG9pbnQgZm9yIGVuZ2luZWVycyB0bzoKPiAKPiAxLFZl
cmlmeSB0aGF0IHN1YmRldmljZXMgYXJlIGNvcnJlY3RseSByZW1vdmVkIGZyb20gdGhlIGdsb2Jh
bCBsaXN0IHVwb24gZHJpdmVyIHVubG9hZC4KPiAyLENhdGNoIG1pc3NpbmcgY2xlYW51cCBjYWxs
cyAobGlrZSB2NGwyX2FzeW5jX2NsZWFudXApIGVhcmx5IGluIHRoZSBkZXZlbG9wbWVudCBjeWNs
ZSwgcmF0aGVyIHRoYW4gZGlzY292ZXJpbmcgdGhlbSB0aHJvdWdoIHJhbmRvbSBjcmFzaGVzIGlu
IHN0cmVzcyB0ZXN0aW5nLgoKSSBndWVzcyB5b3UnZCBoYXZlIGZvdW5kIHRoaXMgd2l0aCBlaXRo
ZXIgS0FTQU4gb3IgbGlua2VkIGxpc3QgZGVidWdnaW5nPwoKLS0gClNha2FyaSBBaWx1cwoKCgoK
CgoK

