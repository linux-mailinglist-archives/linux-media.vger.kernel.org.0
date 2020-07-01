Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C5521029A
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 05:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgGADqk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 23:46:40 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:13542 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725862AbgGADqj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 23:46:39 -0400
X-UUID: 5b232870d7d64e75a6adc067879c1dff-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Ry6nys1ZRAY+H8Q6GyL9wPx9JOP40z3D/yzAqhlEzgk=;
        b=ovJa4YyVa+MSf+OAgTLxN+HYc/SF+vSAFvuNr2xwCVEqPVRs4xFHxhH3Fij7XbSLAf6P9KHsyXjmC6BJOQ7FWjtTAtoyKXOdxAvtNPpYVM3z9Da8lkVeE83n9VETVDCMJC+k9fwft+bb7pkUsXhWjwO8k1drgRg7FF03JL+8zHA=;
X-UUID: 5b232870d7d64e75a6adc067879c1dff-20200701
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <tiffany.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 933444611; Wed, 01 Jul 2020 11:46:33 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 11:46:29 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 11:46:29 +0800
Message-ID: <1593575190.1533.2.camel@mtksdaap41>
Subject: Re: [PATCH v2 12/18] media: mtk-vcodec: venc: set OUTPUT buffers
 field to V4L2_FIELD_NONE
From:   Tiffany Lin <tiffany.lin@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>
CC:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        "Pi-Hsun Shih" <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Date:   Wed, 1 Jul 2020 11:46:30 +0800
In-Reply-To: <20200626080442.292309-13-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
         <20200626080442.292309-13-acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5DBE0FC55AB4023EE954F5DA77B7212998D8E0782B4337E1906B2A5E2DE6EAA12000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDIwLTA2LTI2IGF0IDE3OjA0ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gQSBkZWZhdWx0IHZhbHVlIG9mIDAgbWVhbnMgVjRMMl9GSUVMRF9BTlksIHdoaWNoIGlz
IG5vdCBjb3JyZWN0Lg0KPiBSZXBvcnRlZCBieSB2NGwyLWNvbXBsaWFuY2UuDQo+IA0KDQpBY2tl
ZC1ieTogVGlmZmFueSBMaW4gPHRpZmZhbnkubGluQG1lZGlhdGVrLmNvbT4NCg0KDQo+IFNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJvdEBjaHJvbWl1bS5vcmc+DQo+IC0t
LQ0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMg
fCA5ICsrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVj
X2VuYy5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5j
LmMNCj4gaW5kZXggZjgzM2FlZTRhMDZmLi4xYTk4MWQ4NDJjMTkgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuYy5jDQo+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuYy5jDQo+IEBA
IC04OTMsOCArODkzLDE3IEBAIHN0YXRpYyB2b2lkIHZiMm9wc192ZW5jX3N0b3Bfc3RyZWFtaW5n
KHN0cnVjdCB2YjJfcXVldWUgKnEpDQo+ICAJY3R4LT5zdGF0ZSA9IE1US19TVEFURV9GUkVFOw0K
PiAgfQ0KPiAgDQo+ICtzdGF0aWMgaW50IHZiMm9wc192ZW5jX2J1Zl9vdXRfdmFsaWRhdGUoc3Ry
dWN0IHZiMl9idWZmZXIgKnZiKQ0KPiArew0KPiArCXN0cnVjdCB2YjJfdjRsMl9idWZmZXIgKnZi
dWYgPSB0b192YjJfdjRsMl9idWZmZXIodmIpOw0KPiArDQo+ICsJdmJ1Zi0+ZmllbGQgPSBWNEwy
X0ZJRUxEX05PTkU7DQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgdmIyX29wcyBtdGtfdmVuY192YjJfb3BzID0gew0KPiAgCS5xdWV1ZV9zZXR1cAkJPSB2
YjJvcHNfdmVuY19xdWV1ZV9zZXR1cCwNCj4gKwkuYnVmX291dF92YWxpZGF0ZQk9IHZiMm9wc192
ZW5jX2J1Zl9vdXRfdmFsaWRhdGUsDQo+ICAJLmJ1Zl9wcmVwYXJlCQk9IHZiMm9wc192ZW5jX2J1
Zl9wcmVwYXJlLA0KPiAgCS5idWZfcXVldWUJCT0gdmIyb3BzX3ZlbmNfYnVmX3F1ZXVlLA0KPiAg
CS53YWl0X3ByZXBhcmUJCT0gdmIyX29wc193YWl0X3ByZXBhcmUsDQoNCg==

