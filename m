Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938943ECEAC
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 08:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbhHPGir (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 02:38:47 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:18128 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230442AbhHPGiq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 02:38:46 -0400
X-UUID: 5d7d5474ea4e4f7eb6e3e368c49424be-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=12//E0MrCca/AisDc97mnYI9peKrrOex0Lod2WXevtQ=;
        b=ssV5h5u8EZW1zd9G1ePs3eVH5JNCm1zmIaRx0YE/J818wXBjfxdvaOggHc08CB3aWCOIdkUaGp+pnCJYlxFPq8Jc4jgVEAYSNJbQRAk35FDFeoIjVqeAlY5dfj4vd5rYQSR27o7mL6RvOPKuNqnkMP6ScxCBhLcvhq9TXE2KV64=;
X-UUID: 5d7d5474ea4e4f7eb6e3e368c49424be-20210816
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1073371218; Mon, 16 Aug 2021 14:38:12 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 14:38:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 14:38:00 +0800
Message-ID: <76560e846d084f89e37cc8ccd7ca714e539c2803.camel@mediatek.com>
Subject: Re: [PATCH v2] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
From:   houlong wei <houlong.wei@mediatek.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "dafna3@gmail.com" <dafna3@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= 
        <Minghsiu.Tsai@mediatek.com>,
        Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= 
        <Andrew-CT.Chen@mediatek.com>,
        Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?= 
        <tiffany.lin@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "courbot@chromium.org" <courbot@chromium.org>,
        "hsinyi@chromium.org" <hsinyi@chromium.org>,
        "eizan@chromium.org" <eizan@chromium.org>,
        <houlong.wei@mediatek.com>
Date:   Mon, 16 Aug 2021 14:38:01 +0800
In-Reply-To: <20210806082810.9378-1-dafna.hirschfeld@collabora.com>
References: <20210806082810.9378-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 771D58D45B93244CED2E1141867E5E3129C614AEA2FA04CE8851AE9F5553180F2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDIxLTA4LTA2IGF0IDE2OjI4ICswODAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiBGcm9tOiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAY2hyb21pdW0ub3JnPg0KPiAN
Cj4gV2hlbiBydW5uaW5nIG1lbWNweV90b2lvOg0KPiBtZW1jcHlfdG9pbyhzZW5kX29iai0+c2hh
cmVfYnVmLCBidWYsIGxlbik7DQo+IGl0IHdhcyBmb3VuZCB0aGF0IGVycm9ycyBhcHBlYXIgaWYg
bGVuIGlzIG5vdCBhIG11bHRpcGxlIG9mIDg6DQo+IA0KPiBbNTguMzUwODQxXSBtdGstbWRwIDE0
MDAxMDAwLnJkbWE6IHByb2Nlc3NpbmcgZmFpbGVkOiAtMjINCj4gDQo+IFRoaXMgcGF0Y2ggZW5z
dXJlIGNvcHkgb2YgYSBtdWx0aWxlIG9mIDggc2l6ZSBieSBjYWxsaW5nDQo+IHJvdW5kX3VwKGxl
biwgOCkgd2hlbiBjb3B5aW5nDQo+IA0KPiBGaXhlczogZTY1OTlhZGZhZDMwICgibWVkaWE6IG10
ay12cHU6IGF2b2lkIHVuYWxpZ25lZCBhY2Nlc3MgdG8gRFRDTQ0KPiBidWZmZXIuIikNCj4gU2ln
bmVkLW9mZi1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QGNocm9taXVtLm9yZz4NCj4g
U2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29s
bGFib3JhLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRGFmbmEgSGlyc2NoZmVsZCA8ZGFmbmEuaGly
c2NoZmVsZEBjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gY2hhbmdlcyBzaW5jZSB2MToNCj4gMS4g
Y2hhbmdlIHNpZ24tb2ZmLWJ5IHRhZ3MNCj4gMi4gY2hhbmdlIHZhbHVlcyB0byBtZW1zZXQNCj4g
DQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jIHwgNSArKysrLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZwdS9tdGtfdnB1LmMNCj4g
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jDQo+IGluZGV4IGVjMjkw
ZGRlNTljZi4uNjYyNzZjNWExYmMzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL210ay12cHUvbXRrX3ZwdS5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LXZwdS9tdGtfdnB1LmMNCj4gQEAgLTMxNiw2ICszMTYsNyBAQCBpbnQgdnB1X2lwaV9zZW5kKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQo+ICB7DQo+ICAJc3RydWN0IG10a192cHUgKnZw
dSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiAgCXN0cnVjdCBzaGFyZV9vYmogX19p
b21lbSAqc2VuZF9vYmogPSB2cHUtPnNlbmRfYnVmOw0KPiArCXVuc2lnbmVkIGNoYXIgZGF0YVtT
SEFSRV9CVUZfU0laRV07DQo+ICAJdW5zaWduZWQgbG9uZyB0aW1lb3V0Ow0KPiAgCWludCByZXQg
PSAwOw0KPiAgDQo+IEBAIC0zNDksNyArMzUwLDkgQEAgaW50IHZwdV9pcGlfc2VuZChzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2LA0KPiAgCQl9DQo+ICAJfSB3aGlsZSAodnB1X2NmZ19yZWFk
bCh2cHUsIEhPU1RfVE9fVlBVKSk7DQo+ICANCj4gLQltZW1jcHlfdG9pbyhzZW5kX29iai0+c2hh
cmVfYnVmLCBidWYsIGxlbik7DQo+ICsJbWVtc2V0KGRhdGEgKyBsZW4sIDAsIHNpemVvZihkYXRh
KSAtIGxlbik7DQo+ICsJbWVtY3B5KGRhdGEsIGJ1ZiwgbGVuKTsNCj4gKwltZW1jcHlfdG9pbyhz
ZW5kX29iai0+c2hhcmVfYnVmLCBkYXRhLCByb3VuZF91cChsZW4sIDgpKTsNCg0KSGkgRGFmbmEs
DQoNClRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCkluIHRoaXMgcGF0Y2gsIHRoZSBkYXRhIGlzIGNv
cGllZCB0d2ljZSBldmVuIGlmIHRoZSAnbGVuJyBpcyBtdWxpdHBsZQ0Kb2YgOC4gQ2FuIHdlIGp1
ZGdlIHRoZSBhbGlnbm1lbnQgYW5kIGRlY2lkZSB0byBjb3B5IG9uY2Ugb3IgdHdpY2UgPyANCkxp
a2UgYmVsb3csIHdoaWNoIG1heSByZWR1Y2UgdGhlIGxhdGVuY3kgb2YgdGhpcyBmdW5jdGlvbiBh
IGJpdCB3aGVuDQonbGVuJyBpcyBtdWx0aXBsZSBvZiA4Lg0KaWYgKHVubGlrZWx5KChsZW4gJSA4
KSAhPSAwKSkgew0KCXVuc2lnbmVkIGNoYXIgZGF0YVtTSEFSRV9CVUZfU0laRV07DQoJDQoJbWVt
c2V0KGRhdGEgKyBsZW4sIDAsIHNpemVvZihkYXRhKSAtIGxlbik7DQoJbWVtY3B5KGRhdGEsIGJ1
ZiwgbGVuKTsNCgltZW1jcHlfdG9pbyhzZW5kX29iai0+c2hhcmVfYnVmLCBkYXRhLCByb3VuZF91
cChsZW4sIDgpKTsNCn0gZWxzZSB7DQoJbWVtY3B5X3RvaW8oc2VuZF9vYmotPnNoYXJlX2J1Ziwg
YnVmLCBsZW4pOw0KfQ0KDQoNClJlZ2FyZHMsDQpIb3Vsb25nDQoNCj4gIAl3cml0ZWwobGVuLCAm
c2VuZF9vYmotPmxlbik7DQo+ICAJd3JpdGVsKGlkLCAmc2VuZF9vYmotPmlkKTsNCj4gIA0KPiAt
LSANCj4gMi4xNy4xDQoNCg==

