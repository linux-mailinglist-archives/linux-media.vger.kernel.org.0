Return-Path: <linux-media+bounces-32732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBB1ABB42F
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 06:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10490173A8B
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 04:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3161EDA1A;
	Mon, 19 May 2025 04:37:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FA0A2D;
	Mon, 19 May 2025 04:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747629454; cv=none; b=L3MD8gmYioEx9yGT+t2fmoPRbWOXKb/FzawOBSuM/6jp7AapcQ9LrqTiqRwV0Lm/ZVg2iCPhjN1PkQHfwxGzrUveDNscmjqAuZcd4v26RjULnXk93D2wXKt8kSqn21K0wvBzT7k8l4iqoj6rxXiSRaJJeV6SIDSaiIxUUVn/++M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747629454; c=relaxed/simple;
	bh=a0nvOpDqrql3ZFEi5W0GpGxgLPA+jCOafxYLgxeQLQY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hydks1dzG5+uOdWTYVZl5tamje9np7rfPtiSKBc592Ub4lDiOLxmflSTYzH+O1dGQQnEPkK18xLor11RoMUId869a6O/V8O4l+Hb7RAgBoZOz7VOxr1ABm/jJz+o+0wgM9x2v74oC52ROp9+7ZTU5w+dflLbzbn3WXin0NFFSu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w001.hihonor.com (unknown [10.68.25.235])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4b14cK0dpLzYl0FY;
	Mon, 19 May 2025 12:35:29 +0800 (CST)
Received: from a001.hihonor.com (10.68.28.182) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 May
 2025 12:37:20 +0800
Received: from a010.hihonor.com (10.68.16.52) by a001.hihonor.com
 (10.68.28.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 May
 2025 12:37:20 +0800
Received: from a010.hihonor.com ([fe80::7127:3946:32c7:6e]) by
 a010.hihonor.com ([fe80::7127:3946:32c7:6e%14]) with mapi id 15.02.1544.011;
 Mon, 19 May 2025 12:37:17 +0800
From: wangtao <tao.wangtao@honor.com>
To: "T.J. Mercier" <tjmercier@google.com>,
	=?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "jstultz@google.com"
	<jstultz@google.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "wangbintian(BintianWang)"
	<bintian.wang@honor.com>, yipengxiang <yipengxiang@honor.com>, liulu 00013167
	<liulu.liu@honor.com>, hanfeng 00012985 <feng.han@honor.com>
Subject: RE: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
Thread-Topic: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
Thread-Index: AQHbw+qMldEo/aUx7kiLwLLmDDhXfrPP52GAgACTfSD//4oVgIAB7nTg//+OJQCAAiukIP//j3cAADMZG0D//5fGgIAAp/oA//u1nrA=
Date: Mon, 19 May 2025 04:37:17 +0000
Message-ID: <64aa801ccf4e4e74b8d699a9330ecb2a@honor.com>
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
In-Reply-To: <CABdmKX30c_5N34FYMre6Qx5LLLWicsi_XdUdu0QtsOmQ=RcYxQ@mail.gmail.com>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVC5KLiBNZXJjaWVyIDx0
am1lcmNpZXJAZ29vZ2xlLmNvbT4NCj4gU2VudDogU2F0dXJkYXksIE1heSAxNywgMjAyNSAyOjM3
IEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBkbWFidWYvaGVhcHM6IGltcGxlbWVudA0K
PiBETUFfQlVGX0lPQ1RMX1JXX0ZJTEUgZm9yIHN5c3RlbV9oZWFwDQo+IA0KPiBPbiBGcmksIE1h
eSAxNiwgMjAyNSBhdCAxOjM24oCvQU0gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IE9uIDUvMTYvMjUgMDk6NDAsIHdhbmd0YW8g
d3JvdGU6DQo+ID4gPg0KPiA+ID4NCj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+ID4+IEZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4N
Cj4gPiA+PiBTZW50OiBUaHVyc2RheSwgTWF5IDE1LCAyMDI1IDEwOjI2IFBNDQo+ID4gPj4gU3Vi
amVjdDogUmU6IFtQQVRDSCAyLzJdIGRtYWJ1Zi9oZWFwczogaW1wbGVtZW50DQo+ID4gPj4gRE1B
X0JVRl9JT0NUTF9SV19GSUxFIGZvciBzeXN0ZW1faGVhcA0KPiA+ID4+DQo+ID4gPj4gT24gNS8x
NS8yNSAxNjowMywgd2FuZ3RhbyB3cm90ZToNCj4gPiA+Pj4gW3dhbmd0YW9dIE15IFRlc3QgQ29u
ZmlndXJhdGlvbiAoQ1BVIDFHSHosIDUtdGVzdCBhdmVyYWdlKToNCj4gPiA+Pj4gQWxsb2NhdGlv
bjogMzJ4MzJNQiBidWZmZXIgY3JlYXRpb24NCj4gPiA+Pj4gLSBkbWFidWYgNTNtcyB2cy4gdWRt
YWJ1ZiA2OTRtcyAoMTBYIHNsb3dlcikNCj4gPiA+Pj4gLSBOb3RlOiBzaG1lbSBzaG93cyBleGNl
c3NpdmUgYWxsb2NhdGlvbiB0aW1lDQo+ID4gPj4NCj4gPiA+PiBZZWFoLCB0aGF0IGlzIHNvbWV0
aGluZyBhbHJlYWR5IG5vdGVkIGJ5IG90aGVycyBhcyB3ZWxsLiBCdXQgdGhhdA0KPiA+ID4+IGlz
IG9ydGhvZ29uYWwuDQo+ID4gPj4NCj4gPiA+Pj4NCj4gPiA+Pj4gUmVhZCAxMDI0TUIgRmlsZToN
Cj4gPiA+Pj4gLSBkbWFidWYgZGlyZWN0IDMyNm1zIHZzLiB1ZG1hYnVmIGRpcmVjdCA0NjFtcyAo
NDAlIHNsb3dlcikNCj4gPiA+Pj4gLSBOb3RlOiBwaW5fdXNlcl9wYWdlc19mYXN0IGNvbnN1bWVz
IG1ham9yaXR5IENQVSBjeWNsZXMNCj4gPiA+Pj4NCj4gPiA+Pj4gS2V5IGZ1bmN0aW9uIGNhbGwg
dGltaW5nOiBTZWUgZGV0YWlscyBiZWxvdy4NCj4gPiA+Pg0KPiA+ID4+IFRob3NlIGFyZW4ndCB2
YWxpZCwgeW91IGFyZSBjb21wYXJpbmcgZGlmZmVyZW50IGZ1bmN0aW9uYWxpdGllcyBoZXJlLg0K
PiA+ID4+DQo+ID4gPj4gUGxlYXNlIHRyeSB1c2luZyB1ZG1hYnVmIHdpdGggc2VuZGZpbGUoKSBh
cyBjb25maXJtZWQgdG8gYmUgd29ya2luZyBieQ0KPiBULkouDQo+ID4gPiBbd2FuZ3Rhb10gVXNp
bmcgYnVmZmVyIElPIHdpdGggZG1hYnVmIGZpbGUgcmVhZC93cml0ZSByZXF1aXJlcyBvbmUNCj4g
bWVtb3J5IGNvcHkuDQo+ID4gPiBEaXJlY3QgSU8gcmVtb3ZlcyB0aGlzIGNvcHkgdG8gZW5hYmxl
IHplcm8tY29weS4gVGhlIHNlbmRmaWxlIHN5c3RlbQ0KPiA+ID4gY2FsbCByZWR1Y2VzIG1lbW9y
eSBjb3BpZXMgZnJvbSB0d28gKHJlYWQvd3JpdGUpIHRvIG9uZS4gSG93ZXZlciwNCj4gPiA+IHdp
dGggdWRtYWJ1Ziwgc2VuZGZpbGUgc3RpbGwga2VlcHMgYXQgbGVhc3Qgb25lIGNvcHksIGZhaWxp
bmcgemVyby1jb3B5Lg0KPiA+DQo+ID4NCj4gPiBUaGVuIHBsZWFzZSB3b3JrIG9uIGZpeGluZyB0
aGlzLg0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBDaHJpc3RpYW4uDQo+ID4NCj4gPg0KPiA+ID4N
Cj4gPiA+IElmIHVkbWFidWYgc2VuZGZpbGUgdXNlcyBidWZmZXIgSU8gKGZpbGUgcGFnZSBjYWNo
ZSksIHJlYWQgbGF0ZW5jeQ0KPiA+ID4gbWF0Y2hlcyBkbWFidWYgYnVmZmVyIHJlYWQsIGJ1dCBh
bGxvY2F0aW9uIHRpbWUgaXMgbXVjaCBsb25nZXIuDQo+ID4gPiBXaXRoIERpcmVjdCBJTywgdGhl
IGRlZmF1bHQgMTYtcGFnZSBwaXBlIHNpemUgbWFrZXMgaXQgc2xvd2VyIHRoYW4gYnVmZmVyDQo+
IElPLg0KPiA+ID4NCj4gPiA+IFRlc3QgZGF0YSBzaG93czoNCj4gPiA+IHVkbWFidWYgZGlyZWN0
IHJlYWQgaXMgbXVjaCBmYXN0ZXIgdGhhbiB1ZG1hYnVmIHNlbmRmaWxlLg0KPiA+ID4gZG1hYnVm
IGRpcmVjdCByZWFkIG91dHBlcmZvcm1zIHVkbWFidWYgZGlyZWN0IHJlYWQgYnkgYSBsYXJnZSBt
YXJnaW4uDQo+ID4gPg0KPiA+ID4gSXNzdWU6IEFmdGVyIHVkbWFidWYgaXMgbWFwcGVkIHZpYSBt
YXBfZG1hX2J1ZiwgYXBwcyB1c2luZyBtZW1mZCBvcg0KPiA+ID4gdWRtYWJ1ZiBmb3IgRGlyZWN0
IElPIG1pZ2h0IGNhdXNlIGVycm9ycywgYnV0IHRoZXJlIGFyZSBubw0KPiA+ID4gc2FmZWd1YXJk
cyB0byBwcmV2ZW50IHRoaXMuDQo+ID4gPg0KPiA+ID4gQWxsb2NhdGUgMzJ4MzJNQiBidWZmZXIg
YW5kIHJlYWQgMTAyNCBNQiBmaWxlIFRlc3Q6DQo+ID4gPiBNZXRyaWMgICAgICAgICAgICAgICAg
IHwgYWxsb2MgKG1zKSB8IHJlYWQgKG1zKSB8IHRvdGFsIChtcykNCj4gPiA+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tfC0tLS0tLS0tLS0tLXwtLS0tLS0tLS0tLXwtLS0tLS0tLS0tLQ0KPiA+ID4g
dWRtYWJ1ZiBidWZmZXIgcmVhZCAgICB8IDUzOSAgICAgICAgfCAyMDE3ICAgICAgfCAyNTU1DQo+
ID4gPiB1ZG1hYnVmIGRpcmVjdCByZWFkICAgIHwgNTIyICAgICAgICB8IDY1OCAgICAgICB8IDEx
NzkNCj4gDQo+IEkgY2FuJ3QgcmVwcm9kdWNlIHRoZSBwYXJ0IHdoZXJlIHVkbWFidWYgZGlyZWN0
IHJlYWRzIGFyZSBmYXN0ZXIgdGhhbg0KPiBidWZmZXJlZCByZWFkcy4gVGhhdCdzIHRoZSBvcHBv
c2l0ZSBvZiB3aGF0IEknZCBleHBlY3QuIFNvbWV0aGluZyBzZWVtcw0KPiB3cm9uZyB3aXRoIHRo
b3NlIGJ1ZmZlcmVkIHJlYWRzLg0KPiANClt3YW5ndGFvXSBCdWZmZXIgcmVhZCByZXF1aXJlcyBh
biBleHRyYSBDUFUgbWVtb3J5IGNvcHkuIE91ciBkZXZpY2UncyBsb3cgQ1BVDQpwZXJmb3JtYW5j
ZSBsZWFkcyB0byBsb25nZXIgbGF0ZW5jeS4gT24gaGlnaC1wZXJmb3JtYW5jZSAzLjVHSHogQ1BV
cywgYnVmZmVyDQpyZWFkIHNob3dzIGJldHRlciByYXRpb3MgYnV0IHN0aWxsIGxhZ3MgYmVoaW5k
IGRpcmVjdCBJL08uDQoNClRlc3RzIHVzZWQgc2luZ2xlLXRocmVhZCBwcm9ncmFtcyB3aXRoIDMy
TUIgcmVhZGFoZWFkIHRvIG1pbmltaXplIGxhdGVuY3koRW1iZWRkZWQgbW9iaWxlIGRldmljZXMg
dXN1YWxseSA8PSAyTUIpLg0KDQpUZXN0IHJlc3VsdHMgKHRpbWUgaW4gbXMpOg0KfCAgICAgICAg
ICAgICAgICAgICB8ICAgICBsaXR0bGUgY29yZSBAMUdIeiAgICAgfCAgICAgIGJpZyBjb3JlIEAz
LjVHSHogICAgIHwNCnwgICAgICAgICAgICAgICAgICAgfCBhbGxvYyAgICAgICAgICAgICB8IHJl
YWQgIHwgYWxsb2MgICAgICAgICAgICAgfCByZWFkICB8DQp8LS0tLS0tLS0tLS0tLS0tLS0tLXwt
LS0tLS0tLS0tLS0tLS0tLS0tfC0tLS0tLS18LS0tLS0tLS0tLS0tLS0tLS0tLXwtLS0tLS0tfA0K
fCB1ZG1hYnVmIGJ1ZmZlciBSRCB8IDU0MyAgICAgICAgICAgICAgIHwgMjA3OCAgfCAxMzUgICAg
ICAgICAgICAgICB8IDU0OSAgIHwNCnwgdWRtYWJ1ZiBkaXJlY3QgUkQgfCA1NDMgICAgICAgICAg
ICAgICB8IDY0MCAgIHwgMTYzICAgICAgICAgICAgICAgfCAyOTEgICB8DQp8IHVkbWFidWYgYnVm
ZmVyIFNGIHwgNDk0ICAgICAgICAgICAgICAgfCAxMDU4ICB8IDEzNyAgICAgICAgICAgICAgIHwg
MzE1ICAgfA0KfCB1ZG1hYnVmIGRpcmVjdCBTRiB8IDUyOSAgICAgICAgICAgICAgIHwgMjMzNSAg
fCAxNDMgICAgICAgICAgICAgICB8IDkwOSAgIHwNCnwgZG1hYnVmIGJ1ZmZlciAgUkQgfCAzOSAg
ICAgICAgICAgICAgICB8IDEwNzcgIHwgMjMgICAgICAgICAgICAgICAgfCAzNDkgICB8DQp8IHBh
dGNoIGRpcmVjdCBSRCAgIHwgNTEgICAgICAgICAgICAgICAgfCAzMDYgICB8IDMwICAgICAgICAg
ICAgICAgIHwgMjY3ICAgfA0KDQo+ID4gPiB1ZG1hYnVmIGJ1ZmZlciBzZW5kZmlsZXwgNTA1ICAg
ICAgICB8IDEwNDAgICAgICB8IDE1NDYNCj4gPiA+IHVkbWFidWYgZGlyZWN0IHNlbmRmaWxlfCA1
MTAgICAgICAgIHwgMjI2OSAgICAgIHwgMjc4MA0KPiANCj4gSSBjYW4gcmVwcm9kdWNlIHRoZSAz
LjV4IHNsb3dlciB1ZGFtYnVmIGRpcmVjdCBzZW5kZmlsZSBjb21wYXJlZCB0bw0KPiB1ZG1hYnVm
IGRpcmVjdCByZWFkLiBJdCdzIGEgcHJldHR5IGRpc2FwcG9pbnRpbmcgcmVzdWx0LCBzbyBpdCBz
ZWVtcyBsaWtlDQo+IHNvbWV0aGluZyBjb3VsZCBiZSBpbXByb3ZlZCB0aGVyZS4NCj4gDQo+IDFH
IGZyb20gZXh0NCBvbiA2LjEyLjE3IHwgcmVhZC9zZW5kZmlsZSAobXMpDQo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLXwtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IHVkbWFidWYgYnVmZmVyIHJlYWQg
ICAgIHwgMzUxDQo+IHVkbWFidWYgZGlyZWN0IHJlYWQgICAgIHwgNTQwDQo+IHVkbWFidWYgYnVm
ZmVyIHNlbmRmaWxlIHwgMjU1DQo+IHVkbWFidWYgZGlyZWN0IHNlbmRmaWxlIHwgMTk5MA0KPiAN
Clt3YW5ndGFvXSBLZXkgb2JzZXJ2YXRpb25zOg0KMS4gRGlyZWN0IHNlbmRmaWxlIHVuZGVycGVy
Zm9ybXMgZHVlIHRvIHNtYWxsIHBpcGUgYnVmZmVycy9tZW1vcnkgZmlsZSBwYWdlLA0KICAgcmVx
dWlyaW5nIG1vcmUgRE1BIG9wZXJhdGlvbnMuDQoyLiBleHQ0IHZzIGYyZnM6IGV4dDQgc3VwcG9y
dHMgaHVnZXBhZ2UvbGFyZ2VyIGZvbGlvICh1bmxpa2UgZjJmcykuIE1vYmlsZQ0KICAgZGV2aWNl
cyBtb3N0bHkgdXNlIGYyZnMsIHdoaWNoIGFmZmVjdHMgcGVyZm9ybWFuY2UuDQoNCkkvTyBwYXRo
IGNvbXBhcmlzb246DQotIEJ1ZmZlciByZWFkOiBbRElTS10g4oaSIERNQSDihpIgW3BhZ2UgY2Fj
aGVdIOKGkiBDUFUgY29weSDihpIgW21lbW9yeSBmaWxlXQ0KLSBEaXJlY3QgcmVhZDogW0RJU0td
IOKGkiBETUEg4oaSIFttZW1vcnkgZmlsZV0NCi0gQnVmZmVyIHNlbmRmaWxlOiBbRElTS10g4oaS
IERNQSDihpIgW3BhZ2UgY2FjaGVdIOKGkiBDUFUgY29weSDihpIgW21lbW9yeSBmaWxlXQ0KLSBE
aXJlY3Qgc2VuZGZpbGU6IFtESVNLXSDihpIgRE1BIOKGkiBbcGlwZSBidWZmZXJdIOKGkiBDUFUg
Y29weSDihpIgW21lbW9yeSBmaWxlXQ0KDQpUaGUgZXh0cmEgQ1BVIGNvcHkgYW5kIHBpcGUgbGlt
aXRhdGlvbnMgZXhwbGFpbiB0aGUgcGVyZm9ybWFuY2UgZ2FwLg0KDQo+IA0KPiA+ID4gZG1hYnVm
IGJ1ZmZlciByZWFkICAgICB8IDUxICAgICAgICAgfCAxMDY4ICAgICAgfCAxMTE4DQo+ID4gPiBk
bWFidWYgZGlyZWN0IHJlYWQgICAgIHwgNTIgICAgICAgICB8IDI5NyAgICAgICB8IDM0OQ0KPiA+
ID4NCj4gPiA+IHVkbWFidWYgc2VuZGZpbGUgdGVzdCBzdGVwczoNCj4gPiA+IDEuIE9wZW4gZGF0
YSBmaWxlKDEwMjRNQiksIGdldCBiYWNrX2ZkIDIuIENyZWF0ZSBtZW1mZCgzMk1CKSAjIExvb3AN
Cj4gPiA+IHN0ZXBzIDItNiAzLiBBbGxvY2F0ZSB1ZG1hYnVmIHdpdGggbWVtZmQgNC4gQ2FsbCBz
ZW5kZmlsZShtZW1mZCwNCj4gPiA+IGJhY2tfZmQpIDUuIENsb3NlIG1lbWZkIGFmdGVyIHNlbmRm
aWxlIDYuIENsb3NlIHVkbWFidWYgNy4gQ2xvc2UNCj4gPiA+IGJhY2tfZmQNCj4gPiA+DQo+ID4g
Pj4NCj4gPiA+PiBSZWdhcmRzLA0KPiA+ID4+IENocmlzdGlhbi4NCj4gPiA+DQo+ID4NCg0K

