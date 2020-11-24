Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B59F2C2289
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 11:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgKXKKX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 05:10:23 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:9187 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725792AbgKXKKX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 05:10:23 -0500
X-UUID: 98052439ccf44716ae12f6965e2bb06c-20201124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=u3IMSN6l9DpAAf3WTb8SAGhvr/8FfMvCzmELwlNcKgw=;
        b=P8nAD54DPfSa4fiI0weW968+SQGLVNBIsGcNZsUkOBnLTPzhe3SCbHcZu81pmsaCRT6FkVSadSk5yra8+nYC0JtO7kKs8Xv9traj2Io2sVrjqu04vPWCkd/+e4dsqoDrA8RMzliM5ES93UtxguJNPNws75pIRD5NRJsPezhQK1A=;
X-UUID: 98052439ccf44716ae12f6965e2bb06c-20201124
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 657754852; Tue, 24 Nov 2020 18:10:16 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 24 Nov
 2020 18:10:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Nov 2020 18:10:15 +0800
Message-ID: <1606212616.4733.157.camel@mhfsdcap03>
Subject: Re: [PATCH] media: ov8856: Remove 3280x2464 mode
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Robert Foss <robert.foss@linaro.org>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ben Kao <ben.kao@intel.com>, <tfiga@google.com>,
        <shengnan.wang@mediatek.com>, <dongchun.zhu@mediatek.com>
Date:   Tue, 24 Nov 2020 18:10:16 +0800
In-Reply-To: <20201124084343.GD3940@paasikivi.fi.intel.com>
References: <20201116155008.118124-1-robert.foss@linaro.org>
         <1606203651.4733.134.camel@mhfsdcap03>
         <20201124084343.GD3940@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 727A302743AD4B499C0DB70EA4A56C8256AD2C86B3BD07D9F325D4A353D04AC12000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiBUdWUsIDIwMjAtMTEtMjQgYXQgMTA6NDMgKzAyMDAsIFNha2FyaSBB
aWx1cyB3cm90ZToNCj4gSGkgRG9uZ2NodW4sDQo+IA0KPiBPbiBUdWUsIE5vdiAyNCwgMjAyMCBh
dCAwMzo0MDo1MVBNICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+ID4gPiAgc3RhdGljIGNv
bnN0IHN0cnVjdCBvdjg4NTZfbW9kZSBzdXBwb3J0ZWRfbW9kZXNbXSA9IHsNCj4gPiA+IC0Jew0K
PiA+ID4gLQkJLndpZHRoID0gMzI4MCwNCj4gPiA+IC0JCS5oZWlnaHQgPSAyNDY0LA0KPiA+ID4g
LQkJLmh0cyA9IDE5MjgsDQo+ID4gPiAtCQkudnRzX2RlZiA9IDI0ODgsDQo+ID4gPiAtCQkudnRz
X21pbiA9IDI0ODgsDQo+ID4gPiAtCQkucmVnX2xpc3QgPSB7DQo+ID4gPiAtCQkJLm51bV9vZl9y
ZWdzID0gQVJSQVlfU0laRShtb2RlXzMyODB4MjQ2NF9yZWdzKSwNCj4gPiA+IC0JCQkucmVncyA9
IG1vZGVfMzI4MHgyNDY0X3JlZ3MsDQo+ID4gPiAtCQl9LA0KPiA+ID4gLQkJLmxpbmtfZnJlcV9p
bmRleCA9IE9WODg1Nl9MSU5LX0ZSRVFfNzIwTUJQUywNCj4gPiA+IC0JfSwNCj4gPiANCj4gPiBJ
ZiAzMjgweDI0NjQgcmVzb2x1dGlvbiBpcyByZW1vdmVkLCBiYXllciBvcmRlciBuZWVkcyB0byBi
ZSB1cGRhdGVkIGluDQo+ID4gdGhlIG1lYW50aW1lLiBGcm9tIE9WODg1NidzIGRhdGFzaGVldCwg
YmF5ZXIgb3JkZXIgdHVybnMgdG8gYmUgQkdHUiBpZg0KPiA+IHNlbnNvciBhZG9wdHMgZnVsbCBt
b2RlICgzMjY0eDI0NDgpIG9yIGJpbm5pbmcgbW9kZSAoMTYzMngxMjI0KS4NCj4gDQo+IEhvdyBp
cyB0aGlzIHJlbGF0ZWQgdG8gdGhlIHBhdGNoPw0KPiANCg0KWWVzLCBpdCBzZWVtcyB0byBiZSBh
bm90aGVyIGlzc3VlLg0KQnV0IGl0IGlzIHZlcnkgb2Z0ZW4gdGhhdCBiYXllciBvcmRlciBpcyBz
dHJvbmdseSByZWxhdGVkIHRvIHRoZSBpbWFnZQ0Kd2luZG93IHNpemUgYW5kIG1pcnJvci9mbGlw
IHNldHRpbmcuDQoNCj4gVGhlIG5leHQgbGFyZ2VzdCBzaXplIGlzIDE2IGJ5IDE2IGxlc3MsIHNv
IHRoZSBCYXllciBvcmRlciBpcyB0aGUgc2FtZS4gSWYNCj4gaXQncyB3cm9uZyBjdXJyZW50bHkg
KGFzIGl0IHdvdWxkIGFwcGVhciB0byksIGl0IHNob3VsZCBiZSBhIHNlcGFyYXRlDQo+IHBhdGNo
Lg0KPiANCg0KT1Y4ODU2IHNlbnNvciBhcnJheSByZWdpb24gY29uc2lzdHMgb2YgMyBtYWluIHdp
bmRvdyBzZXR0aW5ncy4NClRoZSBpbm5lciB3aW5kb3cgaXMgY29udHJvbGxlZCBieSBbSF93aW5f
b2ZmLCBWX3dpbl9vZmZdLg0KRnJvbSB0aGUgb2xkIHVudXN1YWwgMzI4MHgyNDY0IGFuZCAxNjQw
eDEyMzIgc2V0dGluZywNCkhfd2luX29mZihSMzgxMC1SMzgxMSkgaXMgMCwgVl93aW5fb2ZmKFIz
ODEyLVIzODEzKSBpcyAxLg0KDQpDb25zaWRlcmluZyB0aGF0IHRoZSByZWdpc3RlciBURVNUX1BB
VFRFUk5fQ1RSTChSNDMyMCkgY29udHJvbGxpbmcgcGl4ZWwNCm9yZGVyIGlzIG5vdCBzZXQgKGRl
ZmF1bHQ6IDB4ODAsIG1lYW5pbmcgQkcvR1IpIGFuZCBtaXJyb3IvZmxpcCBhcmUgYm90aA0KT0ZG
LCB0aGUgYWJzb2x1dGUgY29vcmRpbmF0ZSBvZiBjcm9wX3N0YXJ0IGlzIGV4cHJlc3NlZCBhczoN
CltIX2Nyb3Bfc3RhcnQrSF93aW5fb2ZmLCBWX2Nyb3Bfc3RhcnQrVl93aW5fb2ZmXSA9IFswLCA3
XQ0KDQpUaHVzIHRoZSBmaXJzdCBwaXhlbCBzaGFsbCBzdGFydCB3aXRoIEcgY2hhbm5lbChhY2Nv
cmRpbmcgdG8gZGF0YXNoZWV0KS4NClRoaXMgaXMgZGlmZmVyZW50IHdpdGggY3VycmVudCByZXNv
bHV0aW9ucyAoMzI2NHgyNDQ4IGFuZCAxNjMyeDEyMjQpLg0KDQo=

