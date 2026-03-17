Return-Path: <linux-media+bounces-55988-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K85GRXNuGkrjgEAu9opvQ
	(envelope-from <linux-media+bounces-55988-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 04:40:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBD62A3454
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 04:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92DA73018BDE
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 03:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0FC3090C1;
	Tue, 17 Mar 2026 03:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KJpxOLKu"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEF528314E;
	Tue, 17 Mar 2026 03:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773718704; cv=none; b=BnIA+bj72/1V4hXQT37gtpwfrAmRMGAKnOxiB99K+ZmZ8VxWh+N6J/bK6r21JR7h/kOskFbal1nh8D2SRSVBm3tG5odTX725asclldcnZRv1qnZ8m8jUXBGTMzk/Hhssi16wDPg1Z8E08GrPu9FH4gsSCQ02ILXx+bhTobyqzas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773718704; c=relaxed/simple;
	bh=kZfKuyKXp0p5m2QPrVWZz5FSRY+Oh7DNj/GHeO5p9Js=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=CwkEXXwV27vTOGNKpqFgnT6mLhet1GafsDV/i8Gzw+RkJVuRibZKKbMvYTIpS0buXGFn7oyNMa5sPCj+wX5cUwxStiV+7w3ZEuBD0NLEFW3JRL05bGn0FhIY7eQ/vHi/7YVegnPF33CilBvCkJV3bREtGIprE2ty/LMSAsRXaYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KJpxOLKu; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=kZfKuyKXp0p5m2QPrVWZz5FSRY+Oh7DNj/GHeO5p9Js=; b=K
	JpxOLKuAxC+g8HDDBOhkecIjiSGQkOVNZWo6YxI0ErZL7tdmUZmMEAPwiv3EVCr1
	JkPyn5bCMfz+yj69E1Nd486YQa+uKdAhjDN/f9iHvZZl29CJs/FXlE89eyMSUvec
	f8V4OyWHB6qR6awI1USY+aHgstUgY0OOi0cFrdT/no=
Received: from luo.liu.linux$163.com ( [112.64.125.122] ) by
 ajax-webmail-wmsvr-40-146 (Coremail) ; Tue, 17 Mar 2026 11:37:52 +0800
 (CST)
Date: Tue, 17 Mar 2026 11:37:52 +0800 (CST)
From: "luo.liu.linux" <luo.liu.linux@163.com>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: Re: Re: [PATCH] media:v4l2-async:debugfs for registered
 subdevices
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <abg0R5zerwCM_1mK@kekkonen.localdomain>
References: <20260313075824.2818713-1-luo.liu.linux@163.com>
 <abPm3VGGRAIsY1eQ@kekkonen.localdomain>
 <5e63e8aa.943f.19ce6ee4ad5.Coremail.luo.liu.linux@163.com>
 <abP4Mr_s8JRpQH0B@kekkonen.localdomain>
 <384d2274.9b3e.19ce776ec2c.Coremail.luo.liu.linux@163.com>
 <abg0R5zerwCM_1mK@kekkonen.localdomain>
X-NTES-SC: AL_Qu2cAfuat04s5CKfZ+kWn0sSh+Y3WcC2uP0u2IYbS+cvlyzW/yUhQFRTJXzQ/OKgDh+TizO2UxVDyfh9QKS8ZklhWQzzfbUSReVNEWn7
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <186862ed.3836.19cf9df139c.Coremail.luo.liu.linux@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:kigvCgD39z2QzLhp0PZ5AA--.52896W
X-CM-SenderInfo: hoxrhztlxozxxqx0qiywtou0bp/xtbC7BDfUWm4zJAcYAAA3D
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-55988-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luo.liu.linux@163.com,linux-media@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BDBD62A3454
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgpIaSBTYWthcmksCgoJWW91IGFyZSBhYnNvbHV0ZWx5IHJpZ2h0LiBGb3IgYW4gZXhwZXJpZW5j
ZWQga2VybmVsIGRldmVsb3BlciBsaWtlIHlvdXJzZWxmLCB0b29scyBsaWtlIEtBU0FOIGFuZCBD
T05GSUdfREVCVUdfTElTVCBhcmUgc2Vjb25kIG5hdHVyZSBhbmQgaW5jcmVkaWJseSBlZmZlY3Rp
dmUgZm9yIHBpbnBvaW50aW5nIHN1Y2ggaXNzdWVzLgogSSB0cnVseSBhZG1pcmUgeW91ciBleHBl
cnRpc2UgaW4gbGV2ZXJhZ2luZyB0aGVzZSBhZHZhbmNlZCBkZWJ1Z2dpbmcgbWVjaGFuaXNtcy4K
CglIb3dldmVyLCBJIHRoaW5rIGl0IGlzIGltcG9ydGFudCB0byBjb25zaWRlciB0aGUgcmVhbGl0
eSBmb3IgbWFueSBqdW5pb3IgZHJpdmVyIGRldmVsb3BlcnMgKG15c2VsZiBpbmNsdWRlZCkuIFdl
IG9mdGVuIGxhY2sgdGhlIGRlZXAgaW50dWl0aW9uIGFuZCBleHRlbnNpdmUgZXhwZXJpZW5jZSBy
ZXF1aXJlZCB0byB3aWVsZCB0aGVzZQpwb3dlcmZ1bCB0b29scyBlZmZlY3RpdmVseSBpbiBldmVy
eSBzY2VuYXJpby4gTW9yZSBvZnRlbiB0aGFuIG5vdCwgd2Ugc3RpbGwgcmVseSBvbiBwcmltaXRp
dmUgbWV0aG9kczogc3RydWdnbGluZyB0byByZXByb2R1Y2UgaW50ZXJtaXR0ZW50IGNyYXNoZXMs
IHNjYXR0ZXJpbmcgcHJpbnRrIGxvZ3MgZXZlcnl3aGVyZSwgYW5kIG1hbnVhbGx5CnRyYWNpbmcg
ZXhlY3V0aW9uIHBhdGhzLiBUaGlzIHByb2Nlc3MgaXMgZXh0cmVtZWx5IHRpbWUtY29uc3VtaW5n
IGFuZCBvZnRlbiB5aWVsZHMgbm8gY2xlYXIgY29uY2x1c2lvbnMgZm9yICJzaWxlbnQiIHJlc291
cmNlIGxlYWtzLgoKCVdoaWxlIEkgYW0gYWN0aXZlbHkgd29ya2luZyB0byBpbXByb3ZlIG15IHNr
aWxscyBhbmQgbGVhcm4gdG8gdXNlIHRoZXNlIGFkdmFuY2VkIHRvb2xzIG1vcmUgcHJvZmljaWVu
dGx5LiBJIHJlbWFpbiBjb252aW5jZWQgdGhhdCBwcm92aWRpbmcgc3VjaCBhIHNpbXBsZSwgaW50
dWl0aXZlIGludGVyZmFjZSBvZmZlcnMgYSBuZWNlc3NhcnkgCnN1cHBsZW1lbnQgYnkgc2Vydmlu
ZyBhcyBhIGxvdy1iYXJyaWVyIGVudHJ5IHBvaW50IGZvciBkZXZlbG9wZXJzLgoKCUkgaG9wZSB0
aGlzIHBlcnNwZWN0aXZlIGNsYXJpZmllcyB3aHkgSSBiZWxpZXZlIHRoaXMgc21hbGwgY2hhbmdl
IGNhbiBicmluZyBhIGJpdCBvZiBjb252ZW5pZW5jZSB0byBhIGJyb2FkZXIgcmFuZ2Ugb2YgZHJp
dmVyIGRldmVsb3BlcnMuCgpCZXN0IHJlZ2FyZHMsCkx1bwoKCgpBdCAyMDI2LTAzLTE3IDAwOjQ4
OjA3LCAiU2FrYXJpIEFpbHVzIiA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6
Cj5IaSBMdW8sCj4KPk9uIEZyaSwgTWFyIDEzLCAyMDI2IGF0IDA5OjUwOjU2UE0gKzA4MDAsIGx1
by5saXUubGludXggd3JvdGU6Cj4+IAo+PiBIaSBTYWthcmksCj4+IAo+PiAgICAgQXBvbG9naWVz
IGlmIG15IHByZXZpb3VzIGV4cGxhbmF0aW9uIHdhc24ndCBjbGVhciBlbm91Z2guIAo+PiAKPj4g
ICAgIFRvIGNsYXJpZnksIHRoZSBwcmltYXJ5IGdvYWwgb2YgdGhpcyBpbnRlcmZhY2UgaXMgbm90
IG1lcmVseSB0byB2ZXJpZnkgaWYgaW5zbW9kL3JtbW9kIHN1Y2NlZWRzLCAKPj4gYnV0IHRvIHZh
bGlkYXRlIHRoZSBjb3JyZWN0bmVzcyBvZiB0aGUgYXN5bmNocm9ub3VzIHN1YmRldmljZSByZWdp
c3RyYXRpb24gYW5kIHVucmVnaXN0cmF0aW9uIHBhdGhzLAo+PiBzcGVjaWZpY2FsbHkgZW5zdXJp
bmcgdGhhdCByZXNvdXJjZSBhbGxvY2F0aW9uIGFuZCByZWNsYW1hdGlvbiBhcmUgaGFuZGxlZCBw
cm9wZXJseS4KPj4gCj4+ICAgIEkgd291bGQgbGlrZSB0byBzaGFyZSBhIHJlYWwtd29ybGQgc2Nl
bmFyaW8gdGhhdCBtb3RpdmF0ZWQgdGhpcyBwYXRjaDoKPj4gCj4+ICAgIFdlIGhhZCBhIGNhbWVy
YSBzdWJzeXN0ZW0gcGlwZWxpbmUgbGlrZSBzZW5zb3IgLT4gZHBoeSAtPiBtaXBpLWNzaTIgLT4g
aXNwCj4+IHN1YmRldmljZSBkcml2ZXIgdGhhdCBhcHBlYXJlZCB0byBmdW5jdGlvbiBwZXJmZWN0
bHkgZm9yIHNpeCBtb250aHMuIGluc21vZCBhbmQgcm1tb2QgY29tcGxldGVkIHdpdGhvdXQgYW55
IGVycm9ycywKPj4gYW5kIHRoZSBzeXN0ZW0gc2VlbWVkIHN0YWJsZSBkdXJpbmcgbm9ybWFsIG9w
ZXJhdGlvbi4gSG93ZXZlciwganVzdCBiZWZvcmUgYSBtYWpvciByZWxlYXNlLCBhIFFBIGVuZ2lu
ZWVyIHBlcmZvcm1lZCAKPj4gc3RyZXNzIHRlc3RpbmcgaW52b2x2aW5nIHJhcGlkLCByZXBlYXRl
ZCBjeWNsZXMgb2YgaW5zbW9kIGFuZCBybW1vZCwgd2hpY2ggZXZlbnR1YWxseSB0cmlnZ2VyZWQg
YSBrZXJuZWwgY3Jhc2guCj4+IAo+PiBEdXJpbmcgdGhlIGRlYnVnZ2luZyBwcm9jZXNzLCBJIGlu
c3BlY3RlZCB0aGUgaW50ZXJuYWwgZ2xvYmFsIGxpc3RzOgo+PiAKPj4gc3RhdGljIExJU1RfSEVB
RChzdWJkZXZfbGlzdCk7Cj4+IHN0YXRpYyBMSVNUX0hFQUQobm90aWZpZXJfbGlzdCk7Cj4+IAo+
PiBCeSBkdW1waW5nIHRoZSBzdWJkZXZfbGlzdCB2aWEgdGhpcyBkZWJ1Z2ZzIGludGVyZmFjZSwg
SSBkaXNjb3ZlcmVkIHRoYXQgYSBELVBIWSBzdWJkZXZpY2UgZW50cnkgcmVtYWluZWQgaW4gdGhl
IGxpc3QgZXZlbiAKPj4gYWZ0ZXIgaXRzIGRyaXZlciB3YXMgdW5sb2FkZWQuIENydWNpYWxseSwg
dGhlIG91dHB1dCBleHBsaWNpdGx5IHNob3dlZCB0aGUgZGV2aWNlIG5hbWUsIGFsbG93aW5nIG1l
IHRvIGltbWVkaWF0ZWx5IHBpbnBvaW50Cj4+IHRoZSBELVBIWSBkcml2ZXIgYXMgdGhlIGN1bHBy
aXQsIHJhdGhlciB0aGFuIGJsaW5kbHkgdHJvdWJsZXNob290aW5nIG90aGVyIGNvbXBvbmVudHMg
aW4gdGhlIHBpcGVsaW5lIChzdWNoIGFzIHRoZSBzZW5zb3Igb3IgSVNQKS4KPj4gCj4+IFRoaXMg
d2FzIHRoZSBjcml0aWNhbCBjbHVlIHRoYXQgbGVkIG1lIHRvIHRoZSByb290IGNhdXNlOiAKPj4g
Cj4+IFRoZSBELVBIWSBzdWJkcml2ZXIncyByZW1vdmUgZnVuY3Rpb24gd2FzIG1pc3NpbmcgYSBj
YWxsIHRvIHY0bDJfYXN5bmNfY2xlYW51cChzZCkuIENvbnNlcXVlbnRseSwgdGhlIHN1YmRldmlj
ZSB3YXMgbmV2ZXIgcHJvcGVybHkgCj4+IHVucmVnaXN0ZXJlZCBmcm9tIHRoZSBhc3luYyBmcmFt
ZXdvcmssIGxlYWRpbmcgdG8gYSB1c2UtYWZ0ZXItZnJlZSBvciBzdGFsZSBwb2ludGVyIGlzc3Vl
IGR1cmluZyB0aGUgc3RyZXNzIHRlc3QuCj4+IAo+PiBXaXRob3V0IHRoaXMgZGVidWdmcyBpbnRl
cmZhY2UsIGRldGVjdGluZyBzdWNoICJzaWxlbnQiIHJlZ2lzdHJhdGlvbiBsZWFrcyBpcyBleHRy
ZW1lbHkgZGlmZmljdWx0LiAKPj4gVGhlIGRyaXZlciBsb2FkcyBhbmQgdW5sb2FkcyB3aXRob3V0
IHJlcG9ydGluZyBlcnJvcnMsIGFuZCBzdGFuZGFyZCBsb2dzIChkbWVzZykgb2Z0ZW4gcHJvdmlk
ZQo+PiBubyBpbmRpY2F0aW9uIHRoYXQgYW4gZW50cnkgd2FzIGxlZnQgYmVoaW5kIGluIHRoZSBj
b3JlIGZyYW1ld29yaydzIGxpc3QgdW50aWwgYSBjcmFzaCBvY2N1cnMgdW5kZXIgc3BlY2lmaWMg
dGltaW5nIGNvbmRpdGlvbnMuCj4+IAo+PiAKPj4gR2l2ZW4gdGhpcyBleHBlcmllbmNlLCBJIGJl
bGlldmUgdGhpcyBpbnRlcmZhY2UgcHJvdmlkZXMgYSB2aXRhbCB2aXNpYmlsaXR5IHBvaW50IGZv
ciBlbmdpbmVlcnMgdG86Cj4+IAo+PiAxLFZlcmlmeSB0aGF0IHN1YmRldmljZXMgYXJlIGNvcnJl
Y3RseSByZW1vdmVkIGZyb20gdGhlIGdsb2JhbCBsaXN0IHVwb24gZHJpdmVyIHVubG9hZC4KPj4g
MixDYXRjaCBtaXNzaW5nIGNsZWFudXAgY2FsbHMgKGxpa2UgdjRsMl9hc3luY19jbGVhbnVwKSBl
YXJseSBpbiB0aGUgZGV2ZWxvcG1lbnQgY3ljbGUsIHJhdGhlciB0aGFuIGRpc2NvdmVyaW5nIHRo
ZW0gdGhyb3VnaCByYW5kb20gY3Jhc2hlcyBpbiBzdHJlc3MgdGVzdGluZy4KPgo+SSBndWVzcyB5
b3UnZCBoYXZlIGZvdW5kIHRoaXMgd2l0aCBlaXRoZXIgS0FTQU4gb3IgbGlua2VkIGxpc3QgZGVi
dWdnaW5nPwo+Cj4tLSAKPlNha2FyaSBBaWx1cwo=

