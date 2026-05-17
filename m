Return-Path: <linux-media+bounces-61837-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIVLIzZGCWqqSwQAu9opvQ
	(envelope-from <linux-media+bounces-61837-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 06:38:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C2155F3BA
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 06:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F29230055CB
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 04:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A4E33ADA7;
	Sun, 17 May 2026 04:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="I2xaKH4V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m19731120.qiye.163.com (mail-m19731120.qiye.163.com [220.197.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC3931A065
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 04:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778992684; cv=none; b=n/KsYH0tSxJbgxR4RWGlEsVVc5WVSDWIU8liYQzb/b5YFoeEgO9EHXKKhzY0WUFv/AMAkJKVrKHX6L2jRjEmJxdznYTWxZJuKkIINfblLSSXX0B6mEHynlCbmq2OB5Hm7dAaS6u0EceE0wkQFeQp6wwUvZvqNfQZcGSKJhmgVuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778992684; c=relaxed/simple;
	bh=pEKJI21z1dVXuJfu3jGrwbHmDrWWLp77BzyKtrvoMm8=;
	h=Content-Type:Message-ID:To:Subject:In-Reply-To:References:
	 MIME-Version:From:Date; b=rfCcNg+UqopS+HaoJg9JQRN8UMy0jWF2lXPydPTamESPuoZRBa78+4ITFWcac5/FYGBeHr+T+ZjKNcAHJMVB0ii9pZnmlhLfFGSNVi6HnfUtsuck5xSaFVYtg8LmWI8Ga68BpKC260aOSSWV5IuyScuwudzP4tvOUbvjxRES5Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=I2xaKH4V; arc=none smtp.client-ip=220.197.31.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AMcA1gBAKfJ6YmCBXgiBsKpM.3.1778988128990.Hmail.220255775@seu.edu.cn>
To: linux-media@vger.kernel.org
Subject: =?UTF-8?B?UmU6UmU6IG1lZGlhOiBiY20yODM1LXVuaWNhbTogZml4IGR1bW15IGJ1ZmZlciBkb3VibGUgZnJlZSB3aGVuIHJlZ2lzdGVyIGZhaWxz?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com web
In-Reply-To: <6a074579.394694c0.121283.faf4@mx.google.com>
References: <20260515152529.1007540-1-dawei.feng@seu.edu.cn> <6a074579.394694c0.121283.faf4@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 220255775@seu.edu.cn( [221.228.238.82] ) by ajax-webmail ( [127.0.0.1] ) ; Sun, 17 May 2026 11:22:08 +0800 (GMT+08:00)
From: =?UTF-8?B?5Yav5aSn546u?= <220255775@seu.edu.cn>
Date: Sun, 17 May 2026 11:22:08 +0800 (GMT+08:00)
X-HM-Tid: 0a9e33f3eca409bdkunm44a532d7e304
X-HM-MType: 1
X-HM-NTES-SC: AL0_4z5B86Wr4Tz9jdMF+bhXMf6MpADvhip6WmVjXfIDtSTmmv9kT97/LMjT4d
	0GxKpl24ceyADYgQplL/E6OwW0Q4hZLSegkrpgUUJ+WzKpHHQnZFwg1r/6ZAX8NMK0Mr17PAyYGx
	s+B1xGTlHB1F0fToCvh9NPAYvvZZKwa7bbKUE=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSU9IVkMdGRpMSB5CQkodTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSk
	tISkhNSlVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=I2xaKH4VwqI3YF5JKvgB9trraxbRN+ZpiSpfwT5UOFP4ps5f6GOONqMmqDzHQtgsRvTsy6wxLHwPrvbxBmxgNTV6+IaiRlu3zQcUW+aY7uXiwzv8ro2MaX4noexjkBcYbCXtclxjqZRkpL4VAzlo6/6UM8bozfbHwA+0A99/y5o=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=pEKJI21z1dVXuJfu3jGrwbHmDrWWLp77BzyKtrvoMm8=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Queue-Id: 11C2155F3BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUBJ_EXCESS_BASE64(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61837-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[220255775@seu.edu.cn,linux-media@vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

SGkgYWxsLAoKSSBub3RpY2VkIHRoYXQgbXkgcGF0Y2ggaGl0IHRoZSB2b2x1bWUgY2xlYW51cC1y
ZWxhdGVkIGVycm9ycyBpbiBNZWRpYSBDSS4gSSBzZWUgdGhlcmUncyBhbHJlYWR5IGFuIGlzc3Vl
IG1lbnRpb25pbmcgdGhhdCBzZXZlcmFsIHBhdGNoZXMgYXJlIGVuY291bnRlcmluZyB0aGUgc2Ft
ZSBwcm9ibGVtLCBhbmQgdGhlc2UgZmFpbHVyZXMgZG9uJ3QgYXBwZWFyIHRvIGJlIGNhdXNlZCBi
eSB0aGUgY29kZSBjaGFuZ2VzLgoKQ291bGQgeW91IHBsZWFzZSBjbGFyaWZ5IHdoZXRoZXIgdGhp
cyBDSSBmYWlsdXJlIHdpbGwgYmxvY2sgdGhlIHJldmlldyBhbmQgbWVyZ2luZyBvZiBteSBwYXRj
aD8KClRoZSBmdWxsIENJIGVycm9yIHJlcG9ydCBvZiBteSBwYXRjaCBpcyBoZXJlOiBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbGludXgtbWVkaWEvdXNlcnMvcGF0Y2h3b3JrLy0vam9i
cy85OTk2NzI5MgpBbmQgdGhlIHJlbGF0ZWQgaXNzdWUgdHJhY2tpbmcgdGhpcyBwcm9ibGVtOiBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbGludXgtbWVkaWEvbWVkaWEtY2kvLS93b3Jr
X2l0ZW1zP3Nob3c9ZXlKcGFXUWlPaUl4TWpnaUxDSm1kV3hzWDNCaGRHZ2lPaUpzYVc1MWVDMXRa
V1JwWVM5dFpXUnBZUzFqYVNJc0ltbGtJam94TkRrNU56SjkKClRoYW5rcywgRGF3ZWkgRmVuZwoK
CgoKCgpGcm9tOiBQYXRjaHdvcmsgSW50ZWdyYXRpb24gPHBhdGNod29ya0BtZWRpYS1jaS5vcmc+
CkRhdGU6IDIwMjYtMDUtMTYgMDA6MTA6MzMKVG86ICBEYXdlaSBGZW5nIDxkYXdlaS5mZW5nQHNl
dS5lZHUuY24+ClN1YmplY3Q6IFJlOiBtZWRpYTogYmNtMjgzNS11bmljYW06IGZpeCBkdW1teSBi
dWZmZXIgZG91YmxlIGZyZWUgd2hlbiByZWdpc3RlciBmYWlscz5EZWFyIERhd2VpIEZlbmc6Cj4K
PlRoYW5rcyBmb3IgeW91ciBwYXRjaGVzISBVbmZvcnR1bmF0ZWx5IHRoZSBNZWRpYSBDSSByb2Jv
dCBkZXRlY3RlZCBzb21lCj5pc3N1ZXM6Cj4KPgo+Cj5QbGVhc2UgZml4IHlvdXIgc2VyaWVzLCBh
bmQgdXBsb2FkIGEgbmV3IHZlcnNpb24uIElmIHlvdSBoYXZlIGEgcGF0Y2h3b3JrCj5hY2NvdW50
LCBkbyBub3QgZm9yZ2V0IHRvIG1hcmsgdGhlIGN1cnJlbnQgc2VyaWVzIGFzIFN1cGVyc2VkZWQu
Cj4KPkZvciBtb3JlIGRldGFpbHMsIGNoZWNrIHRoZSBmdWxsIHJlcG9ydCBhdDoKPmh0dHBzOi8v
bGludXgtbWVkaWEucGFnZXMuZnJlZWRlc2t0b3Aub3JnLy0vdXNlcnMvcGF0Y2h3b3JrLy0vam9i
cy85OTk2NzI5Ni9hcnRpZmFjdHMvcmVwb3J0Lmh0bSAuCj4KPgo+Cj5CZXN0IHJlZ2FyZHMsIGFu
ZCBIYXBweSBIYWNraW5nIQo+TWVkaWEgQ0kgcm9ib3Qgb24gYmVoYWxmIG9mIHRoZSBsaW51eC1t
ZWRpYSBjb21tdW5pdHkuCj4KPi0tLQo+Q2hlY2sgdGhlIGxhdGVzdCBydWxlcyBmb3IgY29udHJp
YnV0aW5nIHlvdXIgcGF0Y2hlcyBhdDoKPmh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2RyaXZlci1h
cGkvbWVkaWEvbWFpbnRhaW5lci1lbnRyeS1wcm9maWxlLmh0bWwKPgo+SWYgeW91IGJlbGlldmUg
dGhhdCB0aGUgQ0kgaXMgd3JvbmcsIGtpbmRseSBvcGVuIGFuIGlzc3VlIGF0Cj5odHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvbGludXgtbWVkaWEvbWVkaWEtY2kvLS9pc3N1ZXMgb3IgcmVw
bHktYWxsCj50byB0aGlzIG1lc3NhZ2UuCj4KPgo=

