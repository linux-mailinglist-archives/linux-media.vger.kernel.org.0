Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E461EF2B6
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 10:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgFEIGX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 04:06:23 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:42126 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726024AbgFEIGW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 04:06:22 -0400
X-UUID: 756c1bb4f294495cad12b19f607124e6-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=JPwMS253KWO9wyEuaU8F+mAJwhd2XFkcAArD4gWyjuw=;
        b=r84M9kbMkAHdhmQ99Ju87LXZPXvyM8eeiUPZyAXXuEDyW7usHpd04ANJ8O4kncROlA0GKAptwjnmCO4nHMXd+qzvcrqLRVtetOswOslkLSyk85r6WJBEmRIWICLVLJndCJcAQt7/zs/5Mfa8diQseoE5IldVP02D+KZfR1PvUsk=;
X-UUID: 756c1bb4f294495cad12b19f607124e6-20200605
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1811965991; Fri, 05 Jun 2020 16:06:11 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 5 Jun
 2020 16:06:09 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 16:06:09 +0800
Message-ID: <1591344245.32607.10.camel@mhfsdcap03>
Subject: Re: [PATCH v8 08/14] media: platform: Change case for improving
 code quality
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        <srv_heupstream@mediatek.com>, <senozhatsky@chromium.org>,
        <mojahsu@chromium.org>, <drinkcat@chromium.org>,
        <maoguang.meng@mediatek.com>, <sj.huang@mediatek.com>
Date:   Fri, 5 Jun 2020 16:04:05 +0800
In-Reply-To: <4b8cc41e-5171-0d48-f588-96e4212ab22c@xs4all.nl>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
         <20200403094033.8288-9-xia.jiang@mediatek.com>
         <4b8cc41e-5171-0d48-f588-96e4212ab22c@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BC553A6124CC156816443CD8FFFB780032B7C78833E4223FA7C71AEB92EE0B6A2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIwLTA1LTExIGF0IDEwOjM3ICswMjAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQo+
IE9uIDAzLzA0LzIwMjAgMTE6NDAsIFhpYSBKaWFuZyB3cm90ZToNCj4gPiBDaGFuZ2UgcmVnaXN0
ZXIgb2Zmc2V0IGhleCBudW1iZXJhbHMgZnJvbSB1cGVyY2FzZSB0byBsb3dlcmNhc2UuDQo+IA0K
PiBUeXBvczoNCj4gDQo+IG51bWJlcmFscyAtPiBudW1lcmFscw0KPiANCj4gdXBlcmNhc2UgLT4g
dXBwZXJjYXNlDQpEb25lLg0KPiANCj4gUmVnYXJkcywNCj4gDQo+IAlIYW5zDQo+IA0KPiA+IA0K
PiA+IFNpZ25lZC1vZmYtYnk6IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCj4g
PiAtLS0NCj4gPiB2ODogbm8gY2hhbmdlcw0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay1qcGVnL210a19qcGVnX3JlZy5oIHwgMTggKysrKysrKysrLS0tLS0tLS0tDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+ID4g
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pw
ZWdfcmVnLmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX3JlZy5o
DQo+ID4gaW5kZXggOTRkYjA0ZTljZGI2Li4yOTQ1ZGE4NDJkZmEgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19yZWcuaA0KPiA+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfcmVnLmgNCj4gPiBAQCAt
MjAsMjkgKzIwLDI5IEBADQo+ID4gICNkZWZpbmUgQklUX0lOUVNUX01BU0tfQUxMSVJRCQkweDM3
DQo+ID4gIA0KPiA+ICAjZGVmaW5lIEpQR0RFQ19SRUdfUkVTRVQJCTB4MDA5MA0KPiA+IC0jZGVm
aW5lIEpQR0RFQ19SRUdfQlJaX0ZBQ1RPUgkJMHgwMEY4DQo+ID4gLSNkZWZpbmUgSlBHREVDX1JF
R19EVV9OVU0JCTB4MDBGQw0KPiA+ICsjZGVmaW5lIEpQR0RFQ19SRUdfQlJaX0ZBQ1RPUgkJMHgw
MGY4DQo+ID4gKyNkZWZpbmUgSlBHREVDX1JFR19EVV9OVU0JCTB4MDBmYw0KPiA+ICAjZGVmaW5l
IEpQR0RFQ19SRUdfREVTVF9BRERSMF9ZCQkweDAxNDANCj4gPiAgI2RlZmluZSBKUEdERUNfUkVH
X0RFU1RfQUREUjBfVQkJMHgwMTQ0DQo+ID4gICNkZWZpbmUgSlBHREVDX1JFR19ERVNUX0FERFIw
X1YJCTB4MDE0OA0KPiA+IC0jZGVmaW5lIEpQR0RFQ19SRUdfREVTVF9BRERSMV9ZCQkweDAxNEMN
Cj4gPiArI2RlZmluZSBKUEdERUNfUkVHX0RFU1RfQUREUjFfWQkJMHgwMTRjDQo+ID4gICNkZWZp
bmUgSlBHREVDX1JFR19ERVNUX0FERFIxX1UJCTB4MDE1MA0KPiA+ICAjZGVmaW5lIEpQR0RFQ19S
RUdfREVTVF9BRERSMV9WCQkweDAxNTQNCj4gPiAgI2RlZmluZSBKUEdERUNfUkVHX1NUUklERV9Z
CQkweDAxNTgNCj4gPiAtI2RlZmluZSBKUEdERUNfUkVHX1NUUklERV9VVgkJMHgwMTVDDQo+ID4g
KyNkZWZpbmUgSlBHREVDX1JFR19TVFJJREVfVVYJCTB4MDE1Yw0KPiA+ICAjZGVmaW5lIEpQR0RF
Q19SRUdfSU1HX1NUUklERV9ZCQkweDAxNjANCj4gPiAgI2RlZmluZSBKUEdERUNfUkVHX0lNR19T
VFJJREVfVVYJMHgwMTY0DQo+ID4gLSNkZWZpbmUgSlBHREVDX1JFR19XRE1BX0NUUkwJCTB4MDE2
Qw0KPiA+ICsjZGVmaW5lIEpQR0RFQ19SRUdfV0RNQV9DVFJMCQkweDAxNmMNCj4gPiAgI2RlZmlu
ZSBKUEdERUNfUkVHX1BBVVNFX01DVV9OVU0JMHgwMTcwDQo+ID4gLSNkZWZpbmUgSlBHREVDX1JF
R19PUEVSQVRJT05fTU9ERQkweDAxN0MNCj4gPiArI2RlZmluZSBKUEdERUNfUkVHX09QRVJBVElP
Tl9NT0RFCTB4MDE3Yw0KPiA+ICAjZGVmaW5lIEpQR0RFQ19SRUdfRklMRV9BRERSCQkweDAyMDAN
Cj4gPiAtI2RlZmluZSBKUEdERUNfUkVHX0NPTVBfSUQJCTB4MDIwQw0KPiA+ICsjZGVmaW5lIEpQ
R0RFQ19SRUdfQ09NUF9JRAkJMHgwMjBjDQo+ID4gICNkZWZpbmUgSlBHREVDX1JFR19UT1RBTF9N
Q1VfTlVNCTB4MDIxMA0KPiA+ICAjZGVmaW5lIEpQR0RFQ19SRUdfQ09NUDBfREFUQV9VTklUX05V
TQkweDAyMjQNCj4gPiAtI2RlZmluZSBKUEdERUNfUkVHX0RVX0NUUkwJCTB4MDIzQw0KPiA+ICsj
ZGVmaW5lIEpQR0RFQ19SRUdfRFVfQ1RSTAkJMHgwMjNjDQo+ID4gICNkZWZpbmUgSlBHREVDX1JF
R19UUklHCQkJMHgwMjQwDQo+ID4gICNkZWZpbmUgSlBHREVDX1JFR19GSUxFX0JSUAkJMHgwMjQ4
DQo+ID4gLSNkZWZpbmUgSlBHREVDX1JFR19GSUxFX1RPVEFMX1NJWkUJMHgwMjRDDQo+ID4gKyNk
ZWZpbmUgSlBHREVDX1JFR19GSUxFX1RPVEFMX1NJWkUJMHgwMjRjDQo+ID4gICNkZWZpbmUgSlBH
REVDX1JFR19RVF9JRAkJMHgwMjcwDQo+ID4gICNkZWZpbmUgSlBHREVDX1JFR19JTlRFUlJVUFRf
U1RBVFVTCTB4MDI3NA0KPiA+ICAjZGVmaW5lIEpQR0RFQ19SRUdfU1RBVFVTCQkweDAyNzgNCj4g
PiANCj4gDQoNCg==

