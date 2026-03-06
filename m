Return-Path: <linux-media+bounces-54718-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL6SF6ahqmlLUgEAu9opvQ
	(envelope-from <linux-media+bounces-54718-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 10:43:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B221E205
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 10:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DC4C303589D
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 09:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7E5346E47;
	Fri,  6 Mar 2026 09:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IBmSyxwq"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1CB346A1F;
	Fri,  6 Mar 2026 09:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772790102; cv=none; b=iwRSf9qQB/4lgWwNPhPMN+q0WZrAlhLkO9vJrZ1mdmD51wZnnH/p6iAZKRWcJLDsJvysG8z0Rvtmx3u2ttMSfipYV9pL00cyXPki+wnaqxaTnRDC2w1ZqSxj7khsw3KDLd7tZGG429E3kYb68QVgxh709LqqjhR6qOQTZM+VWnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772790102; c=relaxed/simple;
	bh=y5EebPudMbF8OOKK0SWAxzxkI04F+girdMrQK0s3o4o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=jkpRlkreZM1kGZxNfaO89XUUeiJe2mUrv9SYC2Q74xw/8C7idIrQEI54Nu6Glbp6X3ymvRzBVHhjVxgPOg0uJxsSYlQK9ZTHLZ/tChQFQqxFtYOKRoBcBJbGuIXd7xuOPRrXuDg7rwCYZrUhBGvUIz/NY05+1ykR5HYGRLie0eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IBmSyxwq; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=y5EebPudMbF8OOKK0SWAxzxkI04F+girdMrQK0s3o4o=; b=I
	BmSyxwqTloFxShzvN2KCkutqmSLlH6Vl20y4QV9FOFtqDr3ePHc8E6E3LfKHi2SH
	EO/SaUNUtVP8EmBfLaUq7Pv0da6MJk/8n5HL+zPZqB6EUjIoiQgaqlXSCDkDnZKi
	j5vDBBsjeI065h6oQJ3uXYPNcT2yxu9soCO3zYvEWU=
Received: from luo.liu.linux$163.com ( [112.64.125.122] ) by
 ajax-webmail-wmsvr-40-129 (Coremail) ; Fri, 6 Mar 2026 17:41:17 +0800 (CST)
Date: Fri, 6 Mar 2026 17:41:17 +0800 (CST)
From: "luo.liu.linux" <luo.liu.linux@163.com>
To: sakari.ailus@linux.intel.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:[PATCH v2] media:v4l2-async:add debugfs under CONFIG_DEBUG_FS
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260121031456.1125096-1-luo.liu.linux@163.com>
References: <20260121031456.1125096-1-luo.liu.linux@163.com>
X-NTES-SC: AL_Qu2cAPuSv0gs4SCZYekWn0sSh+Y3WcC2uP0u2IYbZ+UZhQrV0AowRXVEMl/W9/mzJTCtkDKtfShj1f1jb6Mphll6X8F89jFGa+RbR7u5
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <500865d6.8b0f.19cc285d65e.Coremail.luo.liu.linux@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gSgvCgDnryo9oappIY9zAA--.31566W
X-CM-SenderInfo: hoxrhztlxozxxqx0qiywtou0bp/xtbC6x187WmqoT25bwAA3u
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Rspamd-Queue-Id: 145B221E205
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54718-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_X_PRIO_THREE(0.00)[3];
	DKIM_TRACE(0.00)[163.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luo.liu.linux@163.com,linux-media@vger.kernel.org];
	FREEMAIL_FROM(0.00)[163.com];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

IAogSGVsbG8gU2FrYXJpIGFuZCBNYXVyb6OsCiAgCiAgICAgR2VudGxlIHBpbmcgLi4uLgoKCkF0
IDIwMjYtMDEtMjEgMTE6MTQ6NTYsICJsdW8ubGl1IiA8bHVvLmxpdS5saW51eEAxNjMuY29tPiB3
cm90ZToKPkFsbCBkZWJ1Z2ZzLXJlbGF0ZWQgY29kZSBpcyBndWFyZGVkIGJ5IENPTkZJR19ERUJV
R19GUyB0byBhdm9pZAo+YmxvYXRpbmcgdGhlIGtlcm5lbCB3aGVuIGRlYnVnZnMgaXMgZGlzYWJs
ZWQuCj4KPlNpZ25lZC1vZmYtYnk6IGx1by5saXUgPGx1by5saXUubGludXhAMTYzLmNvbT4KPi0t
LQo+IGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItYXN5bmMuYyB8IDYgKysrKysrCj4gMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRp
YS92NGwyLWNvcmUvdjRsMi1hc3luYy5jIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1h
c3luYy5jCj5pbmRleCAxYzA4YmJhOWVjYjkuLmY2YTFhNTcxNDliYSAxMDA2NDQKPi0tLSBhL2Ry
aXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItYXN5bmMuYwo+KysrIGIvZHJpdmVycy9tZWRpYS92
NGwyLWNvcmUvdjRsMi1hc3luYy5jCj5AQCAtOTQ3LDYgKzk0Nyw3IEBAIHY0bDJfYXN5bmNfbmZf
bmFtZShzdHJ1Y3QgdjRsMl9hc3luY19ub3RpZmllciAqbm90aWZpZXIpCj4gCQlyZXR1cm4gIm5p
bCI7Cj4gfQo+IAo+KyNpZmRlZiBDT05GSUdfREVCVUdfRlMKPiBzdGF0aWMgaW50IHBlbmRpbmdf
c3ViZGV2c19zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqZGF0YSkKPiB7Cj4gCXN0cnVj
dCB2NGwyX2FzeW5jX25vdGlmaWVyICpub3RpZjsKPkBAIC05NjcsMjAgKzk2OCwyNSBAQCBzdGF0
aWMgaW50IHBlbmRpbmdfc3ViZGV2c19zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqZGF0
YSkKPiBERUZJTkVfU0hPV19BVFRSSUJVVEUocGVuZGluZ19zdWJkZXZzKTsKPiAKPiBzdGF0aWMg
c3RydWN0IGRlbnRyeSAqdjRsMl9hc3luY19kZWJ1Z2ZzX2RpcjsKPisjZW5kaWYKPiAKPiBzdGF0
aWMgaW50IF9faW5pdCB2NGwyX2FzeW5jX2luaXQodm9pZCkKPiB7Cj4rI2lmZGVmIENPTkZJR19E
RUJVR19GUwo+IAl2NGwyX2FzeW5jX2RlYnVnZnNfZGlyID0gZGVidWdmc19jcmVhdGVfZGlyKCJ2
NGwyLWFzeW5jIiwgTlVMTCk7Cj4gCWRlYnVnZnNfY3JlYXRlX2ZpbGUoInBlbmRpbmdfYXN5bmNf
c3ViZGV2aWNlcyIsIDA0NDQsCj4gCQkJICAgIHY0bDJfYXN5bmNfZGVidWdmc19kaXIsIE5VTEws
Cj4gCQkJICAgICZwZW5kaW5nX3N1YmRldnNfZm9wcyk7Cj4gCj4rI2VuZGlmCj4gCXJldHVybiAw
Owo+IH0KPiAKPiBzdGF0aWMgdm9pZCBfX2V4aXQgdjRsMl9hc3luY19leGl0KHZvaWQpCj4gewo+
KyNpZmRlZiBDT05GSUdfREVCVUdfRlMKPiAJZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKHY0bDJf
YXN5bmNfZGVidWdmc19kaXIpOwo+KyNlbmRpZgo+IH0KPiAKPiBzdWJzeXNfaW5pdGNhbGwodjRs
Ml9hc3luY19pbml0KTsKPgo+YmFzZS1jb21taXQ6IGQwOGM4NWFjODg5NDk5NWQ0YjBkOGZiNDhk
MmY2YTNlNTNjZDc5YWIKPi0tIAo+Mi4yNS4xCg==

