Return-Path: <linux-media+bounces-33001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80222ABF183
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 12:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C6134E4F9A
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 10:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666EB25E44C;
	Wed, 21 May 2025 10:25:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mta20.hihonor.com (mta20.honor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B788825C82B;
	Wed, 21 May 2025 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823143; cv=none; b=SUynxDd8+GTF+aSFk10/PT4cd/VdiT4JSn9ax+MaUFcLq7/stC9DBwByGhwZ5z94pc1S3no5hsnSsQu+0MMvdKqdktTKn8eJqN5k8aVIYEhJpQurpUiRgNtJXu/AK4UROHD5LJu4d2ThFuFZD31qDdO4ddzmPlxK+qJjwhKsHHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823143; c=relaxed/simple;
	bh=QTqD0va0nHJPhwyvBwSlI5EphB6UoCC74y+rY+qd9yU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iRG5PlFAav1MHdBBUwgE69/MoOFtTjEStLPJrTl+o0XQKaGcINZS3rTuhyVm6doSMVJBEzrgLPcjVZMC8DbJQK/KgZTvcQGg0Nx1TsUPJqAagAJAziRHty4RN78EUWNicrDwI8Lyd3r2yyHdsA3NxsAQYpya0IUKto66up6QmW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4b2SDw6NBpzYl68D;
	Wed, 21 May 2025 18:23:28 +0800 (CST)
Received: from a009.hihonor.com (10.68.30.244) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 21 May
 2025 18:25:37 +0800
Received: from a010.hihonor.com (10.68.16.52) by a009.hihonor.com
 (10.68.30.244) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 21 May
 2025 18:25:36 +0800
Received: from a010.hihonor.com ([fe80::7127:3946:32c7:6e]) by
 a010.hihonor.com ([fe80::7127:3946:32c7:6e%14]) with mapi id 15.02.1544.011;
 Wed, 21 May 2025 18:25:36 +0800
From: wangtao <tao.wangtao@honor.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "T.J.
 Mercier" <tjmercier@google.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "jstultz@google.com"
	<jstultz@google.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "wangbintian(BintianWang)"
	<bintian.wang@honor.com>, yipengxiang <yipengxiang@honor.com>, liulu 00013167
	<liulu.liu@honor.com>, hanfeng 00012985 <feng.han@honor.com>,
	"amir73il@gmail.com" <amir73il@gmail.com>
Subject: RE: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
Thread-Topic: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
Thread-Index: AQHbw+qMldEo/aUx7kiLwLLmDDhXfrPP52GAgACTfSD//4oVgIAB7nTg//+OJQCAAiukIP//j3cAADMZG0D//5fGgIAAp/oA//s1a9D/9XOJ4IAWHEIA//9iivAAH1/SAP//V55A
Date: Wed, 21 May 2025 10:25:36 +0000
Message-ID: <e61fcdbf71ba4f9dbfef2f521d1b2fc1@honor.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
 <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com>
 <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
 <a3f57102bc6e4588bc7659485feadbc1@honor.com>
 <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
 <CABdmKX30c_5N34FYMre6Qx5LLLWicsi_XdUdu0QtsOmQ=RcYxQ@mail.gmail.com>
 <375f6aac8c2f4b84814251c5025ae6eb@honor.com>
 <38aa6cf19ce245578264aaa9062aa6dd@honor.com>
 <CABdmKX0nAYDdgq-PHv0HxucfYQzvvTAJjVCo7nQ0UtjwcF02aQ@mail.gmail.com>
 <7198873a044143c7be12f727b469649b@honor.com>
 <fdd7a11b-140c-40bd-a1c1-334d69256b92@amd.com>
In-Reply-To: <fdd7a11b-140c-40bd-a1c1-334d69256b92@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIE1heSAyMSwg
MjAyNSAzOjM2IFBNDQo+IFRvOiB3YW5ndGFvIDx0YW8ud2FuZ3Rhb0Bob25vci5jb20+OyBULkou
IE1lcmNpZXINCj4gPHRqbWVyY2llckBnb29nbGUuY29tPg0KPiBDYzogc3VtaXQuc2Vtd2FsQGxp
bmFyby5vcmc7IGJlbmphbWluLmdhaWduYXJkQGNvbGxhYm9yYS5jb207DQo+IEJyaWFuLlN0YXJr
ZXlAYXJtLmNvbTsganN0dWx0ekBnb29nbGUuY29tOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmc7DQo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbmFyby1tbS1zaWdAbGlz
dHMubGluYXJvLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHdhbmdiaW50
aWFuKEJpbnRpYW5XYW5nKQ0KPiA8YmludGlhbi53YW5nQGhvbm9yLmNvbT47IHlpcGVuZ3hpYW5n
IDx5aXBlbmd4aWFuZ0Bob25vci5jb20+OyBsaXVsdQ0KPiAwMDAxMzE2NyA8bGl1bHUubGl1QGhv
bm9yLmNvbT47IGhhbmZlbmcgMDAwMTI5ODUgPGZlbmcuaGFuQGhvbm9yLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCAyLzJdIGRtYWJ1Zi9oZWFwczogaW1wbGVtZW50DQo+IERNQV9CVUZfSU9D
VExfUldfRklMRSBmb3Igc3lzdGVtX2hlYXANCj4gDQo+IE9uIDUvMjEvMjUgMDY6MTcsIHdhbmd0
YW8gd3JvdGU6DQo+ID4+PiBSZWR1Y2luZyBDUFUgb3ZlcmhlYWQvcG93ZXIgY29uc3VtcHRpb24g
aXMgY3JpdGljYWwgZm9yIG1vYmlsZQ0KPiBkZXZpY2VzLg0KPiA+Pj4gV2UgbmVlZCBzaW1wbGVy
IGFuZCBtb3JlIGVmZmljaWVudCBkbWFidWYgZGlyZWN0IEkvTyBzdXBwb3J0Lg0KPiA+Pj4NCj4g
Pj4+IEFzIENocmlzdGlhbiBldmFsdWF0ZWQgc2VuZGZpbGUgcGVyZm9ybWFuY2UgYmFzZWQgb24g
eW91ciBkYXRhLA0KPiA+Pj4gY291bGQgeW91IGNvbmZpcm0gd2hldGhlciB0aGUgY2FjaGUgd2Fz
IGNsZWFyZWQ/IElmIG5vdCwgcGxlYXNlDQo+ID4+PiBzaGFyZSB0aGUgcG9zdC1jYWNoZS1jbGVh
cmluZyB0ZXN0IGRhdGEuIFRoYW5rIHlvdSBmb3IgeW91ciBzdXBwb3J0Lg0KPiA+Pg0KPiA+PiBZ
ZXMgc29ycnksIEkgd2FzIG91dCB5ZXN0ZXJkYXkgcmlkaW5nIG1vdG9yY3ljbGVzLiBJIGRpZCBu
b3QgY2xlYXINCj4gPj4gdGhlIGNhY2hlIGZvciB0aGUgYnVmZmVyZWQgcmVhZHMsIEkgZGlkbid0
IHJlYWxpemUgeW91IGhhZC4gVGhlIElPDQo+ID4+IHBsdXMgdGhlIGNvcHkgY2VydGFpbmx5IGV4
cGxhaW5zIHRoZSBkaWZmZXJlbmNlLg0KPiA+Pg0KPiA+PiBZb3VyIHBvaW50IGFib3V0IHRoZSB1
bmxpa2VsaWhvb2Qgb2YgYW55IG9mIHRoYXQgZGF0YSBiZWluZyBpbiB0aGUNCj4gPj4gY2FjaGUg
YWxzbyBtYWtlcyBzZW5zZS4NCj4gPiBbd2FuZ3Rhb10gVGhhbmsgeW91IGZvciB0ZXN0aW5nIGFu
ZCBjbGFyaWZ5aW5nLg0KPiA+DQo+ID4+DQo+ID4+IEknbSBub3Qgc3VyZSBpdCBjaGFuZ2VzIGFu
eXRoaW5nIGFib3V0IHRoZSBpb2N0bCBhcHByb2FjaCB0aG91Z2guDQo+ID4+IEFub3RoZXIgd2F5
IHRvIGRvIHRoaXMgd291bGQgYmUgdG8gbW92ZSB0aGUgKG9wdGlvbmFsKSBzdXBwb3J0IGZvcg0K
PiA+PiBkaXJlY3QgSU8gaW50byB0aGUgZXhwb3J0ZXIgdmlhIGRtYV9idWZfZm9wcyBhbmQgZG1h
X2J1Zl9vcHMuIFRoZW4NCj4gPj4gbm9ybWFsIHJlYWQoKSBzeXNjYWxscyB3b3VsZCBqdXN0IHdv
cmsgZm9yIGJ1ZmZlcnMgdGhhdCBzdXBwb3J0IHRoZW0uDQo+ID4+IEkga25vdyB0aGF0J3MgbW9y
ZSBjb21wbGljYXRlZCwgYnV0IGF0IGxlYXN0IGl0IGRvZXNuJ3QgcmVxdWlyZQ0KPiA+PiBpbnZl
bnRpbmcgbmV3IHVhcGkgdG8gZG8gaXQuDQo+ID4+DQo+ID4gW3dhbmd0YW9dIFRoYW5rIHlvdSBm
b3IgdGhlIGRpc2N1c3Npb24uIEkgZnVsbHkgc3VwcG9ydCBhbnkgbWV0aG9kDQo+ID4gdGhhdCBl
bmFibGVzIGRtYWJ1ZiBkaXJlY3QgSS9PLg0KPiA+DQo+ID4gSSB1bmRlcnN0YW5kIHVzaW5nIHNl
bmRmaWxlL3NwbGljZSB3aXRoIHJlZ3VsYXIgZmlsZXMgZm9yIGRtYWJ1ZiBhZGRzDQo+ID4gYW4g
ZXh0cmEgQ1BVIGNvcHksIHByZXZlbnRpbmcgemVyby1jb3B5LiBGb3IgZXhhbXBsZToNCj4gPiBz
ZW5kZmlsZSBwYXRoOiBbRElTS10g4oaSIERNQSDihpIgW3BhZ2UgY2FjaGVdIOKGkiBDUFUgY29w
eSDihpIgW21lbW9yeQ0KPiBmaWxlXS4NCj4gDQo+IFllYWgsIGJ1dCB3aHkgY2FuJ3QgeW91IHdv
cmsgb24gaW1wcm92aW5nIHRoYXQ/DQo+IA0KPiA+IFRoZSByZWFkKCkgc3lzY2FsbCBjYW4ndCBw
YXNzIHJlZ3VsYXIgZmlsZSBmZCBwYXJhbWV0ZXJzLCBzbyBJIGFkZGVkDQo+ID4gYW4gaW9jdGwg
Y29tbWFuZC4NCj4gPiBXaGlsZSBjb3B5X2ZpbGVfcmFuZ2UoKSBzdXBwb3J0cyB0d28gZmRzIChm
ZF9pbi9mZF9vdXQpLCBpdCBibG9ja3MgY3Jvc3MtZnMNCj4gdXNlLg0KPiA+IEV2ZW4gd2l0aG91
dCB0aGlzIHJlc3RyaWN0aW9uLCBmaWxlX291dC0+Zl9vcC0+Y29weV9maWxlX3JhbmdlIG9ubHkN
Cj4gPiBlbmFibGVzIGRtYWJ1ZiBkaXJlY3QgcmVhZHMgZnJvbSByZWd1bGFyIGZpbGVzLCBub3Qg
d3JpdGVzLg0KPiA+DQo+ID4gU2luY2UgZG1hYnVmJ3MgZGlyZWN0IEkvTyBsaW1pdGF0aW9uIGNv
bWVzIGZyb20gaXRzIHVuaXF1ZQ0KPiA+IGF0dGFjaG1lbnQvbWFwL2ZlbmNlIG1vZGVsIGFuZCBs
YWNrcyBzdWl0YWJsZSBzeXNjYWxscywgYWRkaW5nIGFuDQo+ID4gaW9jdGwgc2VlbXMgbmVjZXNz
YXJ5Lg0KPiANCj4gSSBhYnNvbHV0ZWx5IGRvbid0IHNlZSB0aGF0LiBCb3RoIHNwbGljZSBhbmQg
c2VuZGZpbGUgY2FuIHRha2UgdHdvIHJlZ3VsYXIgZmlsZQ0KPiBkZXNjcmlwdG9ycy4NCj4gDQo+
IFRoYXQgdGhlIHVuZGVybHlpbmcgZm9wcyBjdXJyZW50bHkgY2FuJ3QgZG8gdGhhdCBpcyBub3Qg
YSB2YWxpZCBhcmd1bWVudCBmb3INCj4gYWRkaW5nIG5ldyB1QVBJLiBJdCBqdXN0IG1lYW5zIHRo
YXQgeW91IG5lZWQgdG8gd29yayBvbiBpbXByb3ZpbmcgdGhvc2UNCj4gZm9wcy4NCj4gDQo+IEFz
IGxvbmcgYXMgbm9ib2R5IHByb3ZlcyB0byBtZSB0aGF0IHRoZSBleGlzdGluZyB1QVBJIGlzbid0
IHN1ZmZpY2llbnQgZm9yIHRoaXMNCj4gdXNlIGNhc2UgSSB3aWxsIHN5c3RlbWF0aWNhbGx5IHJl
amVjdCBhbnkgYXBwcm9hY2ggdG8gYWRkaW5nIG5ldyBvbmUuDQo+IA0KW3dhbmd0YW9dIEkgcHJl
dmlvdXNseSBleHBsYWluZWQgdGhhdCByZWFkL3NlbmRmaWxlL3NwbGljZS9jb3B5X2ZpbGVfcmFu
Z2UNCnN5c2NhbGxzIGNhbid0IGFjaGlldmUgZG1hYnVmIGRpcmVjdCBJTyB6ZXJvLWNvcHkuDQox
LiByZWFkKCkgY2FuJ3QgcGFzcyByZWd1bGFyIGZpbGUgZmQgdG8gZG1hYnVmLg0KMi4gc2VuZGZp
bGUoKSBzdXBwb3J0cyByZWd1bGFyIGZpbGUgPC0+IHJlZ3VsYXIgZmlsZS9zb2NrZXQgemVyby1j
b3B5LA0KYnV0IG5vdCByZWd1bGFyIGZpbGUgPC0+IG1lbW9yeSBmaWxlLg0KRXhhbXBsZToNCnNl
bmRmaWxlKGRzdF9uZXQsIHNyY19kaXNrKToNCltESVNLXSAtLURNQS0tPiBbcGFnZSBidWZmZXJd
IC0tRE1BLS0+IFtOSUNdDQoNCnNlbmRmaWxlKGRzdF9kaXNrLCBzcmNfZGlzayk6DQpbRElTS10g
LS1ETUEtLT4gW3BhZ2UgYnVmZmVyXSAtLURNQS0tPiBbRElTS10NCg0Kc2VuZGZpbGUoZHN0X21l
bWZpbGUsIHNyY19kaXNrKToNCltESVNLXSAtLURNQS0tPiBbcGFnZSBidWZmZXJdIC0tQ1BVIGNv
cHktLT4gW01FTU9SWSBmaWxlXQ0KDQozLiBzcGxpY2UoKSByZXF1aXJlcyBvbmUgZW5kIHRvIGJl
IGEgcGlwZSwgbWFraW5nIGl0IHVuc3VpdGFibGUuDQo0LiBjb3B5X2ZpbGVfcmFuZ2UoKSBpcyBi
bG9ja2VkIGJ5IGNyb3NzLUZTIHJlc3RyaWN0aW9ucyAoQW1pcidzIGNvbW1pdA0KODY4ZjlmMmY4
ZTAwNGJmZTBkMzkzNWIxOTc2ZjYyNWIyOTI0ODkzYikuIEV2ZW4gd2l0aG91dCB0aGlzLA0KZmls
ZV9vdXQtPmZfb3AtPmNvcHlfZmlsZV9yYW5nZSBvbmx5IGVuYWJsZXMgZG1hYnVmIHJlYWQgZnJv
bSByZWd1bGFyIGZpbGVzLA0Kbm90IHdyaXRlLg0KDQpNeSBmb2N1cyBpcyBlbmFibGluZyBkbWFi
dWYgZGlyZWN0IEkvTyBmb3IgW3JlZ3VsYXIgZmlsZV0gPC0tRE1BLS0+IFtkbWFidWZdDQp6ZXJv
LWNvcHkuIEFueSBBUEkgYWNoaWV2aW5nIHRoaXMgd291bGQgd29yay4gQXJlIHRoZXJlIG90aGVy
IHVBUElzIHlvdSB0aGluaw0KY291bGQgaGVscD8gQ291bGQgeW91IHJlY29tbWVuZCBleHBlcnRz
IHdobyBtaWdodCBvZmZlciBzdWdnZXN0aW9ucz8NClRoYW5rIHlvdS4NCg0KPiBSZWdhcmRzLA0K
PiBDaHJpc3RpYW4uDQo+IA0KPiA+IFdoZW4gc3lzdGVtIGV4cG9ydGVycyByZXR1cm4gYSBkdXBs
aWNhdGVkIHNnX3RhYmxlIHZpYSBtYXBfZG1hX2J1Zg0KPiA+ICh1c2VkIGV4Y2x1c2l2ZWx5IGxp
a2UgYSBwYWdlcyBhcnJheSksIHRoZXkgc2hvdWxkIHJldGFpbiBjb250cm9sIG92ZXINCj4gPiBp
dC4NCj4gPg0KPiA+IEkgd2VsY29tZSBhbGwgc29sdXRpb25zIHRvIGFjaGlldmUgZG1hYnVmIGRp
cmVjdCBJL08hIFlvdXIgZmVlZGJhY2sgaXMNCj4gPiBncmVhdGx5IGFwcHJlY2lhdGVkLg0KPiA+
DQo+ID4+IDFHIGZyb20gZXh0NCBvbiA2LjEyLjIwIHwgcmVhZC9zZW5kZmlsZSAobXMpIHcvIDMg
PiBkcm9wX2NhY2hlcw0KPiA+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18LS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiA+PiB1ZG1hYnVmIGJ1ZmZlciByZWFkICAgICB8IDEyMTANCj4gPj4gdWRtYWJ1
ZiBkaXJlY3QgcmVhZCAgICAgfCA2NzENCj4gPj4gdWRtYWJ1ZiBidWZmZXIgc2VuZGZpbGUgfCAx
MDk2DQo+ID4+IHVkbWFidWYgZGlyZWN0IHNlbmRmaWxlIHwgMjM0MA0KPiA+Pg0KPiA+Pg0KPiA+
Pg0KPiA+Pj4NCj4gPj4+Pj4NCj4gPj4+Pj4+PiBkbWFidWYgYnVmZmVyIHJlYWQgICAgIHwgNTEg
ICAgICAgICB8IDEwNjggICAgICB8IDExMTgNCj4gPj4+Pj4+PiBkbWFidWYgZGlyZWN0IHJlYWQg
ICAgIHwgNTIgICAgICAgICB8IDI5NyAgICAgICB8IDM0OQ0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4g
dWRtYWJ1ZiBzZW5kZmlsZSB0ZXN0IHN0ZXBzOg0KPiA+Pj4+Pj4+IDEuIE9wZW4gZGF0YSBmaWxl
KDEwMjRNQiksIGdldCBiYWNrX2ZkIDIuIENyZWF0ZSBtZW1mZCgzMk1CKSAjDQo+ID4+Pj4+Pj4g
TG9vcCBzdGVwcyAyLTYgMy4gQWxsb2NhdGUgdWRtYWJ1ZiB3aXRoIG1lbWZkIDQuIENhbGwNCj4g
Pj4+Pj4+PiBzZW5kZmlsZShtZW1mZCwNCj4gPj4+Pj4+PiBiYWNrX2ZkKSA1LiBDbG9zZSBtZW1m
ZCBhZnRlciBzZW5kZmlsZSA2LiBDbG9zZSB1ZG1hYnVmIDcuDQo+ID4+Pj4+Pj4gQ2xvc2UgYmFj
a19mZA0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IFJlZ2FyZHMsDQo+ID4+Pj4+
Pj4+IENocmlzdGlhbi4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4NCj4gPj4+DQoNCg==

