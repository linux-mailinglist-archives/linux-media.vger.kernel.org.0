Return-Path: <linux-media+bounces-55666-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAhMHAH0s2kxeAAAu9opvQ
	(envelope-from <linux-media+bounces-55666-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:24:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B21D282332
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1D8A30115AD
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D792738D6B6;
	Fri, 13 Mar 2026 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KQ6TzIy2"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BB6331215;
	Fri, 13 Mar 2026 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400930; cv=none; b=H3tP9MhjQdszLdWoXYpz/oq3Hxj9vI77c1LnNoukLpHHGETTxFDXV4gId7xvGeiPAwiQtFWirGTX7gQgWv5/iiAH7IitBkUEAV+sBBxWhpKIcA0nXOVm3sOTpYr4CmpGn8O3ypN01tKBT4Uptmb0H1PKAlH3IC7xnoSUn+egVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400930; c=relaxed/simple;
	bh=aUyZEd92H/q90oLVkNR++CXf6cLBE9/Ymfl2GlPTQT0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=jHdNrlP2yDHy0MxK5TlJq0U8DMCjIBLR2mAWeJ4Bbu1BIdhFwfNuPeJy3Nx68pd8SrinREhTVEXyq3idtWR9tZrYC4/5LHd0qINGf6AHlrUiC6aULTL7BiuWN/iu09YGoBY7vC3GUPYbK8wQdXEWMUGvAcBO/IQghUlLDlpjsi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KQ6TzIy2; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=aUyZEd92H/q90oLVkNR++CXf6cLBE9/Ymfl2GlPTQT0=; b=K
	Q6TzIy2xtKUYwaNAXqAZGGUJdeCUD2GEOCGkagQdhvuGsFht5FWMLXrX+4PQuAiX
	Ty0vSsKAEhG1B/p7cUegDrKjPH43oVEXTjUqs1RSpxgP6vknXEHBDrfKcmFnlTJy
	raXqwYg5PpPREyGvmS0TqdhBsbKuNTbRjxPmLcjlAE=
Received: from luo.liu.linux$163.com ( [112.64.125.122] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Fri, 13 Mar 2026 19:21:42 +0800
 (CST)
Date: Fri, 13 Mar 2026 19:21:42 +0800 (CST)
From: "luo.liu.linux" <luo.liu.linux@163.com>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] media:v4l2-async:debugfs for registered subdevices
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <abPm3VGGRAIsY1eQ@kekkonen.localdomain>
References: <20260313075824.2818713-1-luo.liu.linux@163.com>
 <abPm3VGGRAIsY1eQ@kekkonen.localdomain>
X-NTES-SC: AL_Qu2cAfibv0Er5COcY+kWn0sSh+Y3WcC2uP0u2IYbTeUxuzDh3SoqTGJvP2vQ9OujNw+KtDqbXz51xsZiUKVTL3oi1aXgm7dzr2R/FfdZ
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <5e63e8aa.943f.19ce6ee4ad5.Coremail.luo.liu.linux@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgDHB95G87NpRxB5AA--.13929W
X-CM-SenderInfo: hoxrhztlxozxxqx0qiywtou0bp/xtbC7AZVxmmz80ZVZwAA3k
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
	TAGGED_FROM(0.00)[bounces-55666-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cix-localhost:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B21D282332
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CkhpIFNha2FyaaOsCgogICAgVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciByZXBseS4KCiAg
ICAgV2hlbiBidWlsZGluZyBhIHBpcGVsaW5lIGluIHRoZSBjYW1lcmEgc3Vic3lzdGVtIHZpYSBN
ZWRpYSBFbnRpdGllcwogCihlLmcuLCBTZW5zb3IgLT4gRFBIWSAtPiBNSVBJLUNTSTIgLT4gSVNQ
KSwgaXQgaXMgY3J1Y2lhbCB0byB2ZXJpZnkgdGhhdCB0aGUgcmVnaXN0cmF0aW9uCgogYW5kIHVu
cmVnaXN0cmF0aW9uIHByb2Nlc3NlcyBmb3IgZWFjaCBzdWItZGV2aWNlIChzdWJkZXYpIGRyaXZl
ciB3aXRoaW4gdGhlIHBpcGVsaW5lIAoKYXJlIGZ1bmN0aW9uaW5nIGNvcnJlY3RseS4KClNwZWNp
ZmljYWxseSwgdGFraW5nIGEgc2Vuc29yIGFzIGFuIGV4YW1wbGUgb2YgYSBzdWJkZXY6CgogICAg
IFJlZ2lzdHJhdGlvbiBWZXJpZmljYXRpb246IFVwb24gc3VjY2Vzc2Z1bGx5IGxvYWRpbmcgdGhl
IGRyaXZlciB1c2luZyBpbnNtb2QgeHh4X3NlbnNvci5rbywgCgp0aGUgY29ycmVzcG9uZGluZyBz
ZW5zb3Igc3ViZGV2IHNob3VsZCBhcHBlYXIgaW4gdGhlIHN1YmRldl9saXN0LgoKICAgICBVbnJl
Z2lzdHJhdGlvbiBWZXJpZmljYXRpb246IFVwb24gc3VjY2Vzc2Z1bGx5IHVubG9hZGluZyB0aGUg
ZHJpdmVyIHVzaW5nIHJtbW9kIHh4eF9zZW5zb3Iua28sCgogdGhlIGNvcnJlc3BvbmRpbmcgc3Vi
ZGV2IGVudHJ5IHNob3VsZCBiZSByZW1vdmVkIGZyb20gdGhlIHN1YmRldl9saXN0LgoKClRoZSBm
b2xsb3dpbmcgdGVzdCBsb2cgaW4gbXkgYm9hcmQ6CgoKcm9vdEBjaXgtbG9jYWxob3N0On4vdXBs
b2FkIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvdjRsMi1hc3luYy9yZWdpc3RlcmVkX3N1YmRldmlj
ZXMgCnJvb3RAY2l4LWxvY2FsaG9zdDp+L3VwbG9hZCMKcm9vdEBjaXgtbG9jYWxob3N0On4vdXBs
b2FkIyBpbnNtb2QgbHQ3OTExdXhjLmtvCnJvb3RAY2l4LWxvY2FsaG9zdDp+L3VwbG9hZCMKcm9v
dEBjaXgtbG9jYWxob3N0On4vdXBsb2FkIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvdjRsMi1hc3lu
Yy9yZWdpc3RlcmVkX3N1YmRldmljZXMKTFQ3OTExVVhDIDAtMDA0MyAoZGV2OiAwLTAwNDMpICAg
ICAgICAgICAgICAgIApyb290QGNpeC1sb2NhbGhvc3Q6fi91cGxvYWQjCnJvb3RAY2l4LWxvY2Fs
aG9zdDp+L3VwbG9hZCMgcm1tb2QgbHQ3OTExdXhjLmtvCnJvb3RAY2l4LWxvY2FsaG9zdDp+L3Vw
bG9hZCMKcm9vdEBjaXgtbG9jYWxob3N0On4vdXBsb2FkIyBjYXQgL3N5cy9rZXJuZWwvZGVidWcv
djRsMi1hc3luYy9yZWdpc3RlcmVkX3N1YmRldmljZXMKcm9vdEBjaXgtbG9jYWxob3N0On4vdXBs
b2FkIwpyb290QGNpeC1sb2NhbGhvc3Q6fi91cGxvYWQjCgoKUmVnYXJkcywKCkx1byBMaXUKCgoK
CgoKCgoKCgoKCgoKCkF0IDIwMjYtMDMtMTMgMTg6Mjg6NDUsICJTYWthcmkgQWlsdXMiIDxzYWth
cmkuYWlsdXNAbGludXguaW50ZWwuY29tPiB3cm90ZToKPkhpIEx1bywKPgo+T24gRnJpLCBNYXIg
MTMsIDIwMjYgYXQgMDM6NTg6MjRQTSArMDgwMCwgbHVvLmxpdSB3cm90ZToKPj4gQWRkIGEgbmV3
IGRlYnVnZnMgZmlsZSAicmVnaXN0ZXJlZF9zdWJkZXZpY2VzIiB1bmRlciB0aGUgInY0bDItYXN5
bmMiCj4+IGRpcmVjdG9yeSB0byBkaXNwbGF5IGFsbCByZWdpc3RlcmVkIHN1YmRldmljZXMgaW4g
dGhlIHN1YmRldl9saXN0LiBUaGlzCj4+IGhlbHBzIHdpdGggZGVidWdnaW5nIGJ5IHByb3ZpZGlu
ZyBhIGNsZWFyIHZpZXcgb2YgYWxsIGN1cnJlbnRseSByZWdpc3RlcmVkCj4+IFY0TDIgc3ViZGV2
aWNlcy4KPgo+Q291bGQgeW91IGVsYWJvcmF0ZSBhIGxpdHRsZSBob3cgaGFzIHByb3ZpZGluZyB0
aGlzIGluZm9ybWF0aW9uIG92ZXIKPmRlYnVnZnMgaGVscGVkIHlvdT8KPgo+LS0gCj5SZWdhcmRz
LAo+Cj5TYWthcmkgQWlsdXMK

