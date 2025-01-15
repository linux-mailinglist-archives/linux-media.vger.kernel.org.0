Return-Path: <linux-media+bounces-24771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F172A11F60
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 11:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4D4F18861EA
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 10:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5B423F275;
	Wed, 15 Jan 2025 10:28:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A6A1DB130
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736936881; cv=none; b=euOj3wAVrI5wmtJutDrCi6dU2idNTr9wt65bPkDy3nX/cuSqv9dKizrn++K4UWmwcta95IqJdmZOOLgOKgkC0v+PKhoP5dgouIngef943gUle+Wthl9o9RGo0g8nQ3Qv1Y0pArgTcSHYX2ZTkqAkKO5Bd+5aMS7ty261XxXdf3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736936881; c=relaxed/simple;
	bh=6IBe//irp++7hQboibe+IyOinHwrN9Uo5zBQjoEPCZA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BKAARwmUJpKzpl4PbPVc3mgCcX8q7wo5X9JWDF4ex7Cyp2KuL1BTu2qHVbuyRtol22IxQmgd6pYsV3sWNgcuzESYY87RxDwVVGl8kEjPGW1d8Z4yN1wmuT+FNOHv9DZihogOXp8bwkAgqnzp9c1opnOCHWdBxKzFZHsHVgWDh9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 50FARmmW011362
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 18:27:48 +0800 (+08)
	(envelope-from zhaoyang.huang@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4YY2DP2Y4Zz2Q0GRh
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 18:24:37 +0800 (CST)
Received: from BJMBX01.spreadtrum.com (10.0.64.7) by BJMBX01.spreadtrum.com
 (10.0.64.7) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Wed, 15 Jan
 2025 18:27:47 +0800
Received: from BJMBX01.spreadtrum.com ([fe80::54e:9a:129d:fac7]) by
 BJMBX01.spreadtrum.com ([fe80::54e:9a:129d:fac7%16]) with mapi id
 15.00.1497.023; Wed, 15 Jan 2025 18:27:47 +0800
From: =?gb2312?B?u8azr9H0IChaaGFveWFuZyBIdWFuZyk=?=
	<zhaoyang.huang@unisoc.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: =?gb2312?B?v7W8zbH1IChTdGV2ZSBLYW5nKQ==?= <Steve.Kang@unisoc.com>
Subject: reply//: [RFC] driver: dma-buf: use vmf_insert_page for
 cma_heap_vm_fault
Thread-Topic: reply//: [RFC] driver: dma-buf: use vmf_insert_page for
 cma_heap_vm_fault
Thread-Index: AQHbZzgewAlxtYq/xUKGyIVadgN0xw==
Date: Wed, 15 Jan 2025 10:27:47 +0000
Message-ID: <1736936867040.43424@unisoc.com>
References: <20250115061805.3495048-1-zhaoyang.huang@unisoc.com>,<202501150911.50F9BvMX005131@SHSPAM01.spreadtrum.com>
In-Reply-To: <202501150911.50F9BvMX005131@SHSPAM01.spreadtrum.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:SHSQR01.spreadtrum.com 50FARmmW011362

SSBkbyBmYWlsIGluIGFwcGx5IHRoaXMgcGF0Y2ggb24gdGhlIHRvcCBvZiAnaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2xpbnV4LW1lZGlhL21lZGlhLWNvbW1pdHRlcnMuZ2l0IG5leHQn
LCB3aGlsZSBpdCB3b3JrcyBvbiBtYWlubGluZS4gSSBkb24ndCBrbm93IHdoYXQgY2F1c2VkIHRo
aXMuIEl0IGlzIGEgc2ltcGxlc3QgcGF0Y2ggd2hpY2gganVzdCBoYXMgb25lIGxpbmUgbW9kaWZp
ZWQuCgoKCkRlYXIgemhhb3lhbmcuaHVhbmc6CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2hlcyEgVW5m
b3J0dW5hdGVseSB0aGUgTWVkaWEgQ0kgcm9ib3QgaGFzIG5vdCBiZWVuCmFibGUgdG8gdGVzdCB0
aGVtLgoKTWFrZSBzdXJlIHRoYXQgdGhlIHdob2xlIHNlcmllcyAyMDI1MDExNTA2MTgwNS4zNDk1
MDQ4LTEtemhhb3lhbmcuaHVhbmdAdW5pc29jLmNvbSBpcwphdmFpbGFibGUgYXQgbG9yZS4gQW5k
IHRoYXQgaXQgY2FuIGJlIGNoZXJyeS1waWNrZWQgb24gdG9wIHRoZSAibmV4dCIKYnJhbmNoIG9m
ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbGludXgtbWVkaWEvbWVkaWEtY29tbWl0
dGVycy5naXQiLgoKWW91IGNhbiB0cnkgc29tZXRoaW5nIGxpa2UgdGhpczoKICAgIGdpdCBmZXRj
aCBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbGludXgtbWVkaWEvbWVkaWEtY29tbWl0
dGVycy5naXQgbmV4dAogICAgZ2l0IGNoZWNrb3V0IEZFVENIX0hFQUQKICAgIGI0IHNoYXphbSAy
MDI1MDExNTA2MTgwNS4zNDk1MDQ4LTEtemhhb3lhbmcuaHVhbmdAdW5pc29jLmNvbQoKRXJyb3Ig
bWVzc2FnZTpcClRyeWluZyBicmFuY2ggbmV4dCBjNGI3Nzc5YWJjNjYzMzY3N2U2ZWRiNzllMjgw
OWY0ZjYxZmRlMTU3Li4uClJ1bm5pbmcgaW4gT0ZGTElORSBtb2RlCkFuYWx5emluZyAxIG1lc3Nh
Z2VzIGluIHRoZSB0aHJlYWQKQ2hlY2tpbmcgYXR0ZXN0YXRpb24gb24gYWxsIG1lc3NhZ2VzLCBt
YXkgdGFrZSBhIG1vbWVudC4uLgotLS0KICBbUEFUQ0ggUkZDXSBkcml2ZXI6IGRtYS1idWY6IHVz
ZSB2bWZfaW5zZXJ0X3BhZ2UgZm9yIGNtYV9oZWFwX3ZtX2ZhdWx0CiAgICArIExpbms6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAxMTUwNjE4MDUuMzQ5NTA0OC0xLXpoYW95YW5nLmh1
YW5nQHVuaXNvYy5jb20KLS0tClRvdGFsIHBhdGNoZXM6IDEKLS0tCkFwcGx5aW5nOiBkcml2ZXI6
IGRtYS1idWY6IHVzZSB2bWZfaW5zZXJ0X3BhZ2UgZm9yIGNtYV9oZWFwX3ZtX2ZhdWx0ClBhdGNo
IGZhaWxlZCBhdCAwMDAxIGRyaXZlcjogZG1hLWJ1ZjogdXNlIHZtZl9pbnNlcnRfcGFnZSBmb3Ig
Y21hX2hlYXBfdm1fZmF1bHQKV2hlbiB5b3UgaGF2ZSByZXNvbHZlZCB0aGlzIHByb2JsZW0sIHJ1
biAiZ2l0IGFtIC0tY29udGludWUiLgpJZiB5b3UgcHJlZmVyIHRvIHNraXAgdGhpcyBwYXRjaCwg
cnVuICJnaXQgYW0gLS1za2lwIiBpbnN0ZWFkLgpUbyByZXN0b3JlIHRoZSBvcmlnaW5hbCBicmFu
Y2ggYW5kIHN0b3AgcGF0Y2hpbmcsIHJ1biAiZ2l0IGFtIC0tYWJvcnQiLgplcnJvcjogcGF0Y2gg
ZmFpbGVkOiBkcml2ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hlYXAuYzoxNjgKZXJyb3I6IGRyaXZl
cnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jOiBwYXRjaCBkb2VzIG5vdCBhcHBseQpoaW50OiBV
c2UgJ2dpdCBhbSAtLXNob3ctY3VycmVudC1wYXRjaD1kaWZmJyB0byBzZWUgdGhlIGZhaWxlZCBw
YXRjaAoKVHJ5aW5nIGJyYW5jaCBmaXhlcyA4YjU1Zjg4MTg5MDBjOTlkZDRmNTVhNTlhMTAzZjVi
MjllNDFlYjJjLi4uClJ1bm5pbmcgaW4gT0ZGTElORSBtb2RlCkFuYWx5emluZyAxIG1lc3NhZ2Vz
IGluIHRoZSB0aHJlYWQKQ2hlY2tpbmcgYXR0ZXN0YXRpb24gb24gYWxsIG1lc3NhZ2VzLCBtYXkg
dGFrZSBhIG1vbWVudC4uLgotLS0KICBbUEFUQ0ggUkZDXSBkcml2ZXI6IGRtYS1idWY6IHVzZSB2
bWZfaW5zZXJ0X3BhZ2UgZm9yIGNtYV9oZWFwX3ZtX2ZhdWx0CiAgICArIExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNTAxMTUwNjE4MDUuMzQ5NTA0OC0xLXpoYW95YW5nLmh1YW5n
QHVuaXNvYy5jb20KLS0tClRvdGFsIHBhdGNoZXM6IDEKLS0tCkFwcGx5aW5nOiBkcml2ZXI6IGRt
YS1idWY6IHVzZSB2bWZfaW5zZXJ0X3BhZ2UgZm9yIGNtYV9oZWFwX3ZtX2ZhdWx0ClBhdGNoIGZh
aWxlZCBhdCAwMDAxIGRyaXZlcjogZG1hLWJ1ZjogdXNlIHZtZl9pbnNlcnRfcGFnZSBmb3IgY21h
X2hlYXBfdm1fZmF1bHQKV2hlbiB5b3UgaGF2ZSByZXNvbHZlZCB0aGlzIHByb2JsZW0sIHJ1biAi
Z2l0IGFtIC0tY29udGludWUiLgpJZiB5b3UgcHJlZmVyIHRvIHNraXAgdGhpcyBwYXRjaCwgcnVu
ICJnaXQgYW0gLS1za2lwIiBpbnN0ZWFkLgpUbyByZXN0b3JlIHRoZSBvcmlnaW5hbCBicmFuY2gg
YW5kIHN0b3AgcGF0Y2hpbmcsIHJ1biAiZ2l0IGFtIC0tYWJvcnQiLgplcnJvcjogcGF0Y2ggZmFp
bGVkOiBkcml2ZXJzL2RtYS1idWYvaGVhcHMvY21hX2hlYXAuYzoxNjgKZXJyb3I6IGRyaXZlcnMv
ZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jOiBwYXRjaCBkb2VzIG5vdCBhcHBseQpoaW50OiBVc2Ug
J2dpdCBhbSAtLXNob3ctY3VycmVudC1wYXRjaD1kaWZmJyB0byBzZWUgdGhlIGZhaWxlZCBwYXRj
aAoKCgpCZXN0IHJlZ2FyZHMsIGFuZCBIYXBweSBIYWNraW5nIQpNZWRpYSBDSSByb2JvdCBvbiBi
ZWhhbGYgb2YgdGhlIGxpbnV4LW1lZGlhIGNvbW11bml0eS4KCi0tLQpDaGVjayB0aGUgbGF0ZXN0
IHJ1bGVzIGZvciBjb250cmlidXRpbmcgeW91ciBwYXRjaGVzIGF0OgpodHRwczovL2RvY3Mua2Vy
bmVsLm9yZy9kcml2ZXItYXBpL21lZGlhL21haW50YWluZXItZW50cnktcHJvZmlsZS5odG1sCgpJ
ZiB5b3UgYmVsaWV2ZSB0aGF0IHRoZSBDSSBpcyB3cm9uZywga2luZGx5IG9wZW4gYW4gaXNzdWUg
YXQKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2xpbnV4LW1lZGlhL21lZGlhLWNpLy0v
aXNzdWVzIG9yIHJlcGx5LWFsbAp0byB0aGlzIG1lc3NhZ2UuCgo=

