Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6E81D121F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2020 14:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731493AbgEMMBr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 May 2020 08:01:47 -0400
Received: from mga03.intel.com ([134.134.136.65]:27531 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728165AbgEMMBr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 May 2020 08:01:47 -0400
IronPort-SDR: dXaXZDcHkZGz9JvVy9qV/Aut8r9Nj+tQQzJ++xHQM/DODry7xparkxPLa5Nm0RKBCI6xxL3J/9
 mikJcdBw3jMA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 05:01:38 -0700
IronPort-SDR: SyXMo6HzRErgjS7rZ6n20RSqoIxXtM4P355JyqBbBnl2WxpDV8mhuNwxOaPESGjZivOTW0tBGN
 OvBMF+lTzKSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,387,1583222400"; 
   d="scan'208";a="287005321"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
  by fmsmga004.fm.intel.com with ESMTP; 13 May 2020 05:01:38 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 13 May 2020 05:01:38 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.60]) by
 FMSMSX119.amr.corp.intel.com ([169.254.14.63]) with mapi id 14.03.0439.000;
 Wed, 13 May 2020 05:01:38 -0700
From:   "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Pawel Osciak <pawel@osciak.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Airlie <airlied@linux.ie>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 38/38] videobuf2: use sgtable-based scatterlist
 wrappers
Thread-Topic: [PATCH v4 38/38] videobuf2: use sgtable-based scatterlist
 wrappers
Thread-Index: AQHWKDwP0fqa3BxGckm0EsGy+4sAaqikud8QgACkUACAAIvJEA==
Date:   Wed, 13 May 2020 12:01:37 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663010E211B19@FMSMSX108.amr.corp.intel.com>
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
        <20200512090058.14910-1-m.szyprowski@samsung.com>
        <CGME20200512090130eucas1p2eb86c5d34be56bbc81032bc0b6927d1e@eucas1p2.samsung.com>
        <20200512090058.14910-38-m.szyprowski@samsung.com>
        <14063C7AD467DE4B82DEDB5C278E8663010E210FAC@FMSMSX108.amr.corp.intel.com>
 <f6242137-82a5-0e33-f1a2-9e73dc679aa9@samsung.com>
In-Reply-To: <f6242137-82a5-0e33-f1a2-9e73dc679aa9@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogTWFyZWsgU3p5cHJvd3NraSA8bS5z
enlwcm93c2tpQHNhbXN1bmcuY29tPg0KPlNlbnQ6IFR1ZXNkYXksIE1heSAxMiwgMjAyMCA0OjM0
IFBNDQo+VG86IFJ1aGwsIE1pY2hhZWwgSiA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPjsgZHJp
LQ0KPmRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW9tbXVAbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmc7IGxpbmFyby1tbS0NCj5zaWdAbGlzdHMubGluYXJvLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZw0KPkNjOiBQYXdlbCBPc2NpYWsgPHBhd2VsQG9zY2lhay5jb20+OyBC
YXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6DQo+PGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT47IERh
dmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47IGxpbnV4LQ0KPm1lZGlhQHZnZXIua2VybmVs
Lm9yZzsgSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+OyBNYXVybw0KPkNh
cnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgUm9iaW4gTXVycGh5DQo+PHJvYmlu
Lm11cnBoeUBhcm0uY29tPjsgQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+OyBsaW51eC1h
cm0tDQo+a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENIIHY0
IDM4LzM4XSB2aWRlb2J1ZjI6IHVzZSBzZ3RhYmxlLWJhc2VkIHNjYXR0ZXJsaXN0DQo+d3JhcHBl
cnMNCj4NCj5IaSBNaWNoYWVsLA0KPg0KPk9uIDEyLjA1LjIwMjAgMTk6NTIsIFJ1aGwsIE1pY2hh
ZWwgSiB3cm90ZToNCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+IEZyb206IGRy
aS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhh
bGYgT2YNCj4+PiBNYXJlayBTenlwcm93c2tpDQo+Pj4gU2VudDogVHVlc2RheSwgTWF5IDEyLCAy
MDIwIDU6MDEgQU0NCj4+PiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW9t
bXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmc7DQo+Pj4gbGluYXJvLW1tLXNpZ0BsaXN0cy5s
aW5hcm8ub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+Pj4gQ2M6IFBhd2VsIE9z
Y2lhayA8cGF3ZWxAb3NjaWFrLmNvbT47IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oNCj4+PiA8
Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPjsgRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PjsgbGludXgtDQo+Pj4gbWVkaWFAdmdlci5rZXJuZWwub3JnOyBIYW5zIFZlcmt1aWwgPGh2ZXJr
dWlsLWNpc2NvQHhzNGFsbC5ubD47IE1hdXJvDQo+Pj4gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFi
QGtlcm5lbC5vcmc+OyBSb2JpbiBNdXJwaHkNCj4+PiA8cm9iaW4ubXVycGh5QGFybS5jb20+OyBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT47IGxpbnV4LWFybS0NCj4+PiBrZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsgTWFyZWsgU3p5cHJvd3NraQ0KPj4+IDxtLnN6eXByb3dza2lAc2Ft
c3VuZy5jb20+DQo+Pj4gU3ViamVjdDogW1BBVENIIHY0IDM4LzM4XSB2aWRlb2J1ZjI6IHVzZSBz
Z3RhYmxlLWJhc2VkIHNjYXR0ZXJsaXN0DQo+d3JhcHBlcnMNCj4+Pg0KPj4+IFVzZSByZWNlbnRs
eSBpbnRyb2R1Y2VkIGNvbW1vbiB3cmFwcGVycyBvcGVyYXRpbmcgZGlyZWN0bHkgb24gdGhlIHN0
cnVjdA0KPj4+IHNnX3RhYmxlIG9iamVjdHMgYW5kIHNjYXR0ZXJsaXN0IHBhZ2UgaXRlcmF0b3Jz
IHRvIG1ha2UgdGhlIGNvZGUgYSBiaXQNCj4+PiBtb3JlIGNvbXBhY3QsIHJvYnVzdCwgZWFzaWVy
IHRvIGZvbGxvdyBhbmQgY29weS9wYXN0ZSBzYWZlLg0KPj4+DQo+Pj4gTm8gZnVuY3Rpb25hbCBj
aGFuZ2UsIGJlY2F1c2UgdGhlIGNvZGUgYWxyZWFkeSBwcm9wZXJseSBkaWQgYWxsIHRoZQ0KPj4+
IHNjYXRlcmxpc3QgcmVsYXRlZCBjYWxscy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVr
IFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4NCj4+PiAtLS0NCj4+PiBGb3Ig
bW9yZSBpbmZvcm1hdGlvbiwgc2VlICdbUEFUQ0ggdjQgMDAvMzhdIERSTTogZml4IHN0cnVjdCBz
Z190YWJsZSBuZW50cw0KPj4+IHZzLiBvcmlnX25lbnRzIG1pc3VzZScgdGhyZWFkOg0KPj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIwMDUxMjA4NTcxMC4xNDY4OC0xLQ0K
Pj4+IG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbS9ULw0KPj4+IC0tLQ0KPj4+IC4uLi9tZWRpYS9j
b21tb24vdmlkZW9idWYyL3ZpZGVvYnVmMi1kbWEtY29udGlnLmMgIHwgNDEgKysrKysrKysrKy0N
Cj4tLS0NCj4+PiAtLS0tLS0tLQ0KPj4+IGRyaXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVmMi92
aWRlb2J1ZjItZG1hLXNnLmMgIHwgMzIgKysrKysrKy0tLS0tDQo+LS0tDQo+Pj4gLS0NCj4+PiBk
cml2ZXJzL21lZGlhL2NvbW1vbi92aWRlb2J1ZjIvdmlkZW9idWYyLXZtYWxsb2MuYyB8IDEyICsr
Ky0tLS0NCj4+PiAzIGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDUxIGRlbGV0aW9u
cygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvY29tbW9uL3ZpZGVvYnVm
Mi92aWRlb2J1ZjItZG1hLWNvbnRpZy5jDQo+Pj4gYi9kcml2ZXJzL21lZGlhL2NvbW1vbi92aWRl
b2J1ZjIvdmlkZW9idWYyLWRtYS1jb250aWcuYw0KPj4+IGluZGV4IGQzYTNlZTUuLmJmMzFhOWQg
MTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL3ZpZGVvYnVm
Mi1kbWEtY29udGlnLmMNCj4+PiArKysgYi9kcml2ZXJzL21lZGlhL2NvbW1vbi92aWRlb2J1ZjIv
dmlkZW9idWYyLWRtYS1jb250aWcuYw0KPj4+IEBAIC00OCwxNiArNDgsMTUgQEAgc3RydWN0IHZi
Ml9kY19idWYgew0KPj4+DQo+Pj4gc3RhdGljIHVuc2lnbmVkIGxvbmcgdmIyX2RjX2dldF9jb250
aWd1b3VzX3NpemUoc3RydWN0IHNnX3RhYmxlICpzZ3QpDQo+Pj4gew0KPj4+IC0Jc3RydWN0IHNj
YXR0ZXJsaXN0ICpzOw0KPj4+IAlkbWFfYWRkcl90IGV4cGVjdGVkID0gc2dfZG1hX2FkZHJlc3Mo
c2d0LT5zZ2wpOw0KPj4+IC0JdW5zaWduZWQgaW50IGk7DQo+Pj4gKwlzdHJ1Y3Qgc2dfZG1hX3Bh
Z2VfaXRlciBkbWFfaXRlcjsNCj4+PiAJdW5zaWduZWQgbG9uZyBzaXplID0gMDsNCj4+Pg0KPj4+
IC0JZm9yX2VhY2hfc2coc2d0LT5zZ2wsIHMsIHNndC0+bmVudHMsIGkpIHsNCj4+PiAtCQlpZiAo
c2dfZG1hX2FkZHJlc3MocykgIT0gZXhwZWN0ZWQpDQo+Pj4gKwlmb3JfZWFjaF9zZ3RhYmxlX2Rt
YV9wYWdlKHNndCwgJmRtYV9pdGVyLCAwKSB7DQo+Pj4gKwkJaWYgKHNnX3BhZ2VfaXRlcl9kbWFf
YWRkcmVzcygmZG1hX2l0ZXIpICE9IGV4cGVjdGVkKQ0KPj4+IAkJCWJyZWFrOw0KPj4+IC0JCWV4
cGVjdGVkID0gc2dfZG1hX2FkZHJlc3MocykgKyBzZ19kbWFfbGVuKHMpOw0KPj4+IC0JCXNpemUg
Kz0gc2dfZG1hX2xlbihzKTsNCj4+PiArCQlleHBlY3RlZCArPSBQQUdFX1NJWkU7DQo+Pj4gKwkJ
c2l6ZSArPSBQQUdFX1NJWkU7DQo+PiBUaGlzIGNvZGUgaW4gZHJtX3ByaW1lX3RfY29udGlndW91
c19zaXplIGFuZCBoZXJlLiAgSSBzZWVtIHRvIHJlbWVtYmVyDQo+c2VlaW5nDQo+PiB0aGUgc2Ft
ZSBwYXR0ZXJuIGluIG90aGVyIGRyaXZlcnMuDQo+Pg0KPj4gV291bGQgaXQgd29ydGh3aGlsZSB0
byBtYWtlIHRoaXMgYSBoZWxwZXIgYXMgd2VsbD8NCj5JIHRoaW5rIEkndmUgaWRlbnRpZmllZCBz
dWNoIHBhdHRlcm5zIGluIGFsbCBEUk0gZHJpdmVycyBhbmQgcmVwbGFjZWQNCj53aXRoIGEgY29t
bW9uIGhlbHBlci4gU28gZmFyIEkgaGF2ZSBubyBpZGVhIHdoZXJlIHRvIHB1dCBzdWNoIGhlbHBl
ciB0bw0KPm1ha2UgaXQgYXZhaWxhYmxlIGZvciBtZWRpYS92aWRlb2J1ZjIsIHNvIHRob3NlIGEg
ZmV3IGxpbmVzIGFyZSBpbmRlZWQNCj5kdXBsaWNhdGVkIGhlcmUuDQoNCkkgd2FzIHRoaW5raW5n
IG9mIGRyaXZlcnMgb3V0c2lkZSBvZiBEUk0vbWVkaWEuICBTcGVjaWZpY2FsbHkgUkRNQS4NCg0K
SG93ZXZlciwgbG9va2luZyBhdCB0aGF0IGNvZGUsIEkgc2VlIHRoYXQgbXkgbWVtb3J5IHdhcyBh
IGxpdHRsZSBvZmYuDQpJdCBpcyB3b3JraW5nIHdpdGggY29udGludW91cyBwYWdlcywgIGJ1dCBu
b3QgZmluZGluZyB0aGUgc2l6ZS4NCg0KPj4gQWxzbywgaXNuJ3QgdGhlIHNnX2RtYV9sZW4oKSB0
aGUgYWN0dWFsIGxlbmd0aCBvZiB0aGUgY2h1bmsgd2UgYXJlIGxvb2tpbmcNCj5hdD8NCj4+DQo+
PiBJZiBpdHMgSSBub3QgUEFHRV9TSVpFIChpZS4gZG1hIGNodW5rIGlzIDQgKiBQQUdFX1NJWkU/
KSwgZG9lcyB5b3VyDQo+bG9vcC9jYWxjdWxhdGlvbiBzdGlsbCB3b3JrPw0KPg0KPnNjYXRlcmxp
c3QgcGFnZSBpdGVyYXRvcnMgKGZvcl9lYWNoX3NnX3BhZ2UvZm9yX2VhY2hfc2dfZG1hX3BhZ2Ug
YW5kDQo+dGhlaXIgc2d0YWJsZSB2YXJpYW50cykgYWx3YXlzIG9wZXJhdGVzIG9uIFBBR0VfU0la
RSB1bml0cy4gVGhleQ0KPmNvcnJlY3RseSBoYW5kbGUgbGFyZ2VyIHNnX2RtYV9sZW4oKS4NCg0K
QWhoLCBvaywgSSBzZWUuIA0KDQpUaGFuayB5b3UhDQoNCk1pa2UNCg0KPg0KPkJlc3QgcmVnYXJk
cw0KPi0tDQo+TWFyZWsgU3p5cHJvd3NraSwgUGhEDQo+U2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBv
bGFuZA0KDQo=
