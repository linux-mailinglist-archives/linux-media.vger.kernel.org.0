Return-Path: <linux-media+bounces-32581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7276AAB8475
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 13:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 630BF7A6DBB
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 10:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA38297A58;
	Thu, 15 May 2025 11:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="BSIwJEs7"
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AA910E5;
	Thu, 15 May 2025 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747306833; cv=none; b=lFJjTw0YjPASBmC5517drymvs7DLS6dHdvE7hAlaX2Kh+wR6by0ntUslI47qA+onBa6nFIzVlwU45GZ9kXxSyXW/WqTLKeRpnB6lhuLZmDQqNoX+5j2UIUy4icLFGhW3QE7fmfvUPN6t+l/tcuHHJ14itwtt78MtcGQjebZSCOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747306833; c=relaxed/simple;
	bh=9wXc0Y6ONkjmcPVhgvZpxOyZFLhEYSEFw8irgO7zawo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=F6RoQS5LruCW5v8WfMdb50qCkbHdIistOiZ1Y/36QhhuLvh+NDZ5TpocKz9fjbOhJcXG2VDIJuLZA81KxIDmXo05MZ6toV6ah5X6LY3VXtnnwd98z+6mF9Vpi7GjXR2khvr9tnsu48fhXkOz5Q3d7xPM5p11p5ddV74NvFmioLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=BSIwJEs7 reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=wgA5p1KMNjDu91thD7De1NuKFHa5lkaeczPZ6UzaBts=; b=B
	SIwJEs7MfqcsoiVVHKZ2OBTP3KmtW4vYq2R8y+f9zslpNZhTn0F0x3T29QrsLXXR
	/OIumOciqrS9kTcp5YWjmKOtGrkodoNA5MDwf8IOcno1YXdwKehb1DVSbsF5lujE
	i+tmz0M2GEBp+Tqv0zQzECKvFYFmD22ccAhLqH7E7o=
Received: from ccc194101$163.com ( [116.128.244.169] ) by
 ajax-webmail-wmsvr-40-129 (Coremail) ; Thu, 15 May 2025 18:59:53 +0800
 (CST)
Date: Thu, 15 May 2025 18:59:53 +0800 (CST)
From: =?GBK?B?19S8ug==?= <ccc194101@163.com>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "Ricardo Ribalda" <ribalda@chromium.org>, hdegoede@redhat.com,
	mchehab@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: Re:Re: [PATCH v10] media: uvcvideo: Fix bandwidth issue for Alcor
 camera.
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250515081202.GA8748@pendragon.ideasonboard.com>
References: <20250510061803.811433-1-ccc194101@163.com>
 <CANiDSCsXPgQZVtq9RL_TkXCAW9Bt3kMO3-cR4X8GZaQvmYCQyA@mail.gmail.com>
 <20250515081202.GA8748@pendragon.ideasonboard.com>
X-NTES-SC: AL_Qu2fBf+buU8i5SaebOkfmkwQhuk+XsG5u/gm2IBUOp9xjADpwyshUGVSAGbz4OO0Kz62mgmGVz9i9cNiRYNDZYg6HxhDLwdne6LcsxJlOCf+/A==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <3b644a8c.9fa7.196d399cac8.Coremail.ccc194101@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:gSgvCgD3P0oqySVoY3gFAA--.41876W
X-CM-SenderInfo: 5fffimiurqiqqrwthudrp/1tbiTg5O3mglnk6GtgACs-
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

RGVhciBSaWNhcmRvIFJpYmFsZGEgJiBMYXVyZW50IFBpbmNoYXJ0OgoKCkF0IDIwMjUtMDUtMTUg
MTY6MTI6MDIsICJMYXVyZW50IFBpbmNoYXJ0IiA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPiB3cm90ZToKPk9uIFdlZCwgTWF5IDE0LCAyMDI1IGF0IDExOjE3OjA2QU0gKzAyMDAs
IFJpY2FyZG8gUmliYWxkYSB3cm90ZToKPj4gSGkgY2hlbmNoYW5nY2hlbmcKPj4gCj4+IFRoYW5r
cyBmb3IgeW91ciBwYXRpZW5jZSBmaXhpbmcgdGhlIHdhcm5pbmdzIGZyb20gbWVkaWEtY2kgOikK
Pj4gCj4+IFJlZ2FyZHMKPj4gCj4+IE9uIFNhdCwgMTAgTWF5IDIwMjUgYXQgMDg6MTgsIGNoZW5j
aGFuZ2NoZW5nIDxjY2MxOTQxMDFAMTYzLmNvbT4gd3JvdGU6Cj4+ID4KPj4gPiBGcm9tOiBjaGVu
Y2hhbmdjaGVuZyA8Y2hlbmNoYW5nY2hlbmdAa3lsaW5vcy5jbj4KPj4gPgo+PiA+IFNvbWUgYnJv
a2VuIGRldmljZSByZXR1cm4gd3JvbmcgZHdNYXhQYXlsb2FkVHJhbnNmZXJTaXplIGZpZWxkcwo+
PiA+IGFzIGZvbGxvd3M6Cj4+ID4gICAgIFsgIDIxOC42MzI1MzddIFtwaWQ6MjA0MjcsY3B1Nixn
dXZjdmlldyw4XXV2Y3ZpZGVvOiBEZXZpY2UgcmVxdWVzdGVkIDI3NTI1MTIgQi9mcmFtZSBiYW5k
d2lkdGguCj4+ID4gICAgIFsgIDIxOC42MzI1OThdIFtwaWQ6MjA0MjcsY3B1NixndXZjdmlldyw5
XXV2Y3ZpZGVvOiBObyBmYXN0IGVub3VnaCBhbHQgc2V0dGluZyBmb3IgcmVxdWVzdGVkIGJhbmR3
aWR0aC4KPj4gPgo+PiA+IFdoZW4gZHdNYXhQYXlsb2FkVHJhbnNmZXJTaXplIGlzIGdyZWF0ZXIg
dGhhbiBtYXhwc2l6ZSwKPj4gPiBpdCB3aWxsIHByZXZlbnQgdGhlIGNhbWVyYSBmcm9tIHN0YXJ0
aW5nLgo+PiA+IFNvIHVzZSB0aGUgYmFuZHdpZHRoIG9mIG1heHBzaXplLgo+PiA+Cj4+ID4gU2ln
bmVkLW9mZi1ieTogY2hlbmNoYW5nY2hlbmcgPGNoZW5jaGFuZ2NoZW5nQGt5bGlub3MuY24+Cj4K
Pj4gUmV2aWV3ZWQtYnk6IFJpY2FyZG8gUmliYWxkYSA8cmliYWxkYUBjaHJvbWl1bS5vcmc+Cj4+
Cj4+ID4gLS0tCj4+ID4gIGRyaXZlcnMvbWVkaWEvdXNiL3V2Yy91dmNfdmlkZW8uYyB8IDkgKysr
KysrKysrCj4+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPj4gPgo+PiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX3ZpZGVvLmMgYi9kcml2ZXJzL21l
ZGlhL3VzYi91dmMvdXZjX3ZpZGVvLmMKPj4gPiBpbmRleCBlMzU2N2FlYjAwMDcuLmE3NGNmODk4
NTJkMSAxMDA2NDQKPj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX3ZpZGVvLmMK
Pj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3VzYi91dmMvdXZjX3ZpZGVvLmMKPj4gPiBAQCAtMjYy
LDYgKzI2MiwxNSBAQCBzdGF0aWMgdm9pZCB1dmNfZml4dXBfdmlkZW9fY3RybChzdHJ1Y3QgdXZj
X3N0cmVhbWluZyAqc3RyZWFtLAo+PiA+Cj4+ID4gICAgICAgICAgICAgICAgIGN0cmwtPmR3TWF4
UGF5bG9hZFRyYW5zZmVyU2l6ZSA9IGJhbmR3aWR0aDsKPj4gPiAgICAgICAgIH0KPj4gPiArCj4+
ID4gKyAgICAgICBpZiAoc3RyZWFtLT5pbnRmLT5udW1fYWx0c2V0dGluZyA+IDEgJiYKPj4gPiAr
ICAgICAgICAgICBjdHJsLT5kd01heFBheWxvYWRUcmFuc2ZlclNpemUgPiBzdHJlYW0tPm1heHBz
aXplKSB7Cj4+ID4gKyAgICAgICAgICAgICAgIGRldl93YXJuX3JhdGVsaW1pdGVkKCZzdHJlYW0t
PmludGYtPmRldiwKPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInRo
ZSBtYXggcGF5bG9hZCB0cmFuc21pc3Npb24gc2l6ZSAoJWQpIGV4Y2VlZGVkcyB0aGUgc2l6ZSBv
ZiB0aGUgZXAgbWF4IHBhY2tldCAoJWQpLiBVc2luZyB0aGUgbWF4IHNpemUuXG4iLAo+PiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdHJsLT5kd01heFBheWxvYWRUcmFu
c2ZlclNpemUsCj4+IAo+PiBNaW5vciBuaXRwaWNrLiBJIGFtIHRyeWluZyB0byBzdGFuZGFyaXpl
ICJVVkMgbm9uIGNvbXBsaWFuY2UiIGhlYWRlcgo+PiBpbiB0aGUgbG9ncyBmb3IgdGhpcyBraW5k
IG9mIHRoaW5ncy4KPj4gCj4+ICJVVkMgbm9uIGNvbXBsaWFuY2U6IHRoZSBtYXggcGF5bG9hZCB0
cmFuc21pc3Npb24gc2l6ZSAoJWQpIGV4Y2VlZGVkcwo+PiB0aGUgc2l6ZSBvZiB0aGUgZXAgbWF4
IHBhY2tldCAoJWQpLiBVc2luZyB0aGUgbWF4IHNpemUuXG4iCj4KPnMvZXhjZWVkZWRzL2V4Y2Vl
ZHMvCj4KPkkgd2lsbCBhbHNvIHJlcGxhdWNlICVkIHdpdGggJXUgYXMgYm90aCB2YXJpYWJsZXMg
YXJlIHVuc2lnbmVkLgo+Cj5SZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+Cj4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cmVhbS0+bWF4cHNpemUpOwo+PiA+ICsgICAgICAgICAgICAgICBjdHJs
LT5kd01heFBheWxvYWRUcmFuc2ZlclNpemUgPSBzdHJlYW0tPm1heHBzaXplOwo+PiA+ICsgICAg
ICAgfQo+PiA+ICB9Cj4+ID4KPj4gPiAgc3RhdGljIHNpemVfdCB1dmNfdmlkZW9fY3RybF9zaXpl
KHN0cnVjdCB1dmNfc3RyZWFtaW5nICpzdHJlYW0pCj4+ID4KPj4gPiBiYXNlLWNvbW1pdDogZDc2
YmIxZWJiNTU4N2Y2NmIwZjhiODA5OWJmYmI0NDcyMmJjMDhiMwo+Cj4tLSAKPlJlZ2FyZHMsCj4K
PkxhdXJlbnQgUGluY2hhcnQKCgogICAgICBUaGFuayB5b3UgZm9yIHlvdXIgZ3VpZGFuY2UuCiAg
ICAgIEkgd2lsbCBzdWJtaXQgYSBuZXcgdmVyc2lvbiBhZnRlciB0aGUgbW9kaWZpY2F0aW9ucy4K
Ci0tIApSZWdhcmRzLAoKQ2hhbmdjaGVuZyBDaGVu

