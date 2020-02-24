Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAED16A2F0
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2020 10:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgBXJqW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Feb 2020 04:46:22 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:62083 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726628AbgBXJqW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Feb 2020 04:46:22 -0500
X-UUID: 15efe623feed440a82ff83e29f541fd1-20200224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=JJObHOiFNWZrMDB8kq3sMti+Ri6V2M0iYaOtSYj8HuU=;
        b=hr23lqTthINWXnyqH4FlJZ93clckrD8c2YBD5KQCbAwl1+cMWaGGMF3XqR8jIgyEIQ4ESiynsunRR/peYZmkPZvdQevHMU7s9jWu3khE9ievaw3b0LSAgAFiNMwlYyn3V3uCt9CB5Zq/z+Frm0e33tQA2eZvSaA7HFGoVNyfd2Y=;
X-UUID: 15efe623feed440a82ff83e29f541fd1-20200224
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 81929236; Mon, 24 Feb 2020 17:46:15 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 24 Feb
 2020 17:45:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 24 Feb 2020 17:44:58 +0800
Message-ID: <1582537569.859.14.camel@mhfsdcap03>
Subject: Re: [PATCH v6 1/5] media: platform: Fix jpeg dec driver bug and
 improve code quality
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        <srv_heupstream@mediatek.com>
Date:   Mon, 24 Feb 2020 17:46:09 +0800
In-Reply-To: <20200214093506.GA193786@chromium.org>
References: <20200121095320.32258-1-xia.jiang@mediatek.com>
         <20200121095320.32258-2-xia.jiang@mediatek.com>
         <20200214093506.GA193786@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDIwLTAyLTE0IGF0IDE4OjM1ICswOTAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4g
SGkgWGlhLA0KPiANCj4gT24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMDU6NTM6MTdQTSArMDgwMCwg
WGlhIEppYW5nIHdyb3RlOg0KPiA+IEZpeCB2NGwyLWNvbXBsaWFuY2UgdGVzdCBidWcgYW5kIGlt
cHJvdmUgY29kZSBxdWFsaXR5IG9mIGpwZWcgZGVjb2RlDQo+ID4gZHJpdmVyLCBiZWNhdXNlIHRo
ZSBqcGVnIGVuY29kZSBkcml2ZXIgd2lsbCBiYXNlIG9uIGl0Lg0KPiA+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiB2
NjogYWxpZ25tZW50ICdNVEtfSlBFR19EQ1RTSVpFJyBtYXRjaCBvcGVuIHBhcmVudGhlc2lzLg0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gPiB2NTog
VXNlIGNsYW1wKCl0byByZXBsYWNlIG10a19qcGVnX2JvdW5kX2FsaWduX2ltYWdlKCkgYW5kIHJv
dW5kX3VwKCkNCj4gPiAgICAgdG8gcmVwbGFjZSBtdGtfanBlZ19hbGlnbigpLg0KPiA+ICAgICBH
ZXQgY29ycmVjdCBjb21wb3NlIHZhbHVlIGluIG10a19qcGVnX3NlbGVjdGlvbigpLg0KPiA+ICAg
ICBDYW5jZWwgc3BpbiBsb2NrIGFuZCB1bmxvY2sgb3BlcmF0aW9uIGluIGRldmljZSBydW4gZnVu
Y3Rpb24uDQo+ID4gICAgIENoYW5nZSByZWdpc3RlciBvZmZzZXQgaGV4IG51bWJlcmFscyBmcm9t
IHVwZXJjYXNlIHRvIGxvd2VyY2FzZS4NCj4gPiANCj4gPiB2NDogbmV3IGFkZCBwYXRjaCBmb3Ig
djRsMi1jb21wbGlhbmNlIHRlc3QgYnVnIGZpeC4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNo
LiBUaGUgY2hhbmdlcyBsb29rIGdvb2QgdG8gbWUsIGJ1dCBlYWNoIG9mIHRoZQ0KPiB1bnJlbGF0
ZWQgY2hhbmdlcyBzaG91bGQgYmUgc3BsaXQgaW50byBpdHMgb3duIHBhdGNoLCB3aXRoIHByb3Bl
cg0KPiBleHBsYW5hdGlvbiBpbiBpdHMgY29tbWl0IG1lc3NhZ2UuIEVzcGVjaWFsbHkgdGhlIG9u
ZXMgdGhhdCBpbnRyb2R1Y2UNCj4gYmVoYXZpb3IgY2hhbmdlcywgc3VjaCBhcyB0aGUgU19TRUxF
Q1RJT04gb3IgbG9ja2luZyBjaGFuZ2UuDQo+IA0KPiBBbHNvIHBsZWFzZSBzZWUgb25lIGNvbW1l
bnQgaW5saW5lLg0KPiANCj4gW3NuaXBdDQo+IA0KPiA+IEBAIC04MDEsNyArNzc4LDYgQEAgc3Rh
dGljIHZvaWQgbXRrX2pwZWdfZGV2aWNlX3J1bih2b2lkICpwcml2KQ0KPiA+ICAJc3RydWN0IG10
a19qcGVnX2RldiAqanBlZyA9IGN0eC0+anBlZzsNCj4gPiAgCXN0cnVjdCB2YjJfdjRsMl9idWZm
ZXIgKnNyY19idWYsICpkc3RfYnVmOw0KPiA+ICAJZW51bSB2YjJfYnVmZmVyX3N0YXRlIGJ1Zl9z
dGF0ZSA9IFZCMl9CVUZfU1RBVEVfRVJST1I7DQo+ID4gLQl1bnNpZ25lZCBsb25nIGZsYWdzOw0K
PiA+ICAJc3RydWN0IG10a19qcGVnX3NyY19idWYgKmpwZWdfc3JjX2J1ZjsNCj4gPiAgCXN0cnVj
dCBtdGtfanBlZ19icyBiczsNCj4gPiAgCXN0cnVjdCBtdGtfanBlZ19mYiBmYjsNCj4gPiBAQCAt
ODI5LDEzICs4MDUsMTEgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdfZGV2aWNlX3J1bih2b2lkICpw
cml2KQ0KPiA+ICAJaWYgKG10a19qcGVnX3NldF9kZWNfZHN0KGN0eCwgJmpwZWdfc3JjX2J1Zi0+
ZGVjX3BhcmFtLCAmZHN0X2J1Zi0+dmIyX2J1ZiwgJmZiKSkNCj4gPiAgCQlnb3RvIGRlY19lbmQ7
DQo+ID4gIA0KPiA+IC0Jc3Bpbl9sb2NrX2lycXNhdmUoJmpwZWctPmh3X2xvY2ssIGZsYWdzKTsN
Cj4gDQo+IFdoeSBpcyBpdCBzYWZlIHRvIHJlbW92ZSB0aGUgbG9ja2luZyBoZXJlPw0KRGVhciBU
b21hc3osDQoNCkkgd2lsbCBzcGxpdCB1bnJlbGF0ZWQgY2hhbmdlcyBpbnRvIGRpZmZlcmVudCBw
YXRjaGVzLg0KDQpNeSBvcGluaW9uIGFib3V0IHJlbW92ZSBsb2NraW5nIGlzIGZvbGxvd2luZyhh
ZnRlciBkZWVwIHRoaW5raW5nKToNCg0KVGhlIGRldmljZV9ydW4gZnVuY3Rpb24gY2FuIGJlIG9u
bHkgY2FsbGVkIG9uY2UgZm9yIG9uZSBpbnN0YW5jZS4NCkZvciBtdWx0aS1pbnN0YW5jZSxpcyB0
aGVyZSBhbnkgcG9zc3NpYmlsaXR5IG9mIGh3IG92ZXJyaWRlIGlmIHJlbW92aW5nIGxvY2tpbmc/
SSB0aGluayBzby4NCldoYXQgYWJvdXQgeW91ciBmdXJ0aGVyIG9waW5pb24/DQoNCkJlc3QgUmVn
YXJkcywNClhpYSBKaWFuZw0KPiA+ICAJbXRrX2pwZWdfZGVjX3Jlc2V0KGpwZWctPmRlY19yZWdf
YmFzZSk7DQo+ID4gIAltdGtfanBlZ19kZWNfc2V0X2NvbmZpZyhqcGVnLT5kZWNfcmVnX2Jhc2Us
DQo+ID4gIAkJCQkmanBlZ19zcmNfYnVmLT5kZWNfcGFyYW0sICZicywgJmZiKTsNCj4gPiAgDQo+
ID4gIAltdGtfanBlZ19kZWNfc3RhcnQoanBlZy0+ZGVjX3JlZ19iYXNlKTsNCj4gPiAtCXNwaW5f
dW5sb2NrX2lycXJlc3RvcmUoJmpwZWctPmh3X2xvY2ssIGZsYWdzKTsNCj4gPiAgCXJldHVybjsN
Cj4gPiAgDQo+ID4gIGRlY19lbmQ6DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFRvbWFzeg0KPiAN
Cg0K

