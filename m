Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2F421CD95C
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 14:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729327AbgEKMH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 08:07:57 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:3457 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727873AbgEKMH5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 08:07:57 -0400
X-UUID: 2b1d2213b8f043dba6a23fbf1278bda7-20200511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=vMipxxyx4vvbm6f5PGT2B9rTKQUVPBjJU6zHZu06PhY=;
        b=nijYdYWKJk1lzibIVt030yqGOvFax/1AxuCU4dnlCz1eTIQp9rhRPGj1G390+fSzgtzOZRF0CuVjULyhUffyV3kbsL6BSV7UdjVL6TBQTZ6WOJMb3/hy65sJWYUIDMmyKrA+0U0DooE3Kpyd1ac9uBkFsdaMoATLZkTNX33QycU=;
X-UUID: 2b1d2213b8f043dba6a23fbf1278bda7-20200511
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 813659591; Mon, 11 May 2020 20:07:49 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 11 May
 2020 20:07:49 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 May 2020 20:07:47 +0800
Message-ID: <1589198795.8804.276.camel@mhfsdcap03>
Subject: Re: [V8, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>, <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>
Date:   Mon, 11 May 2020 20:06:35 +0800
In-Reply-To: <20200511093308.GF185537@smile.fi.intel.com>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
         <20200509080627.23222-3-dongchun.zhu@mediatek.com>
         <20200511093308.GF185537@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1C8EC2EFA9EA89E9356A83C33519571046D31C38383666B09EF4913B1E4D0A3F2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQW5keSwNCg0KVGhhbmtzIGZvciB0aGUga2luZGx5IHJldmlldy4NCg0KT24gTW9uLCAyMDIw
LTA1LTExIGF0IDEyOjMzICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+IE9uIFNhdCwg
TWF5IDA5LCAyMDIwIGF0IDA0OjA2OjI3UE0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90ZToNCj4g
PiBBZGQgYSBWNEwyIHN1Yi1kZXZpY2UgZHJpdmVyIGZvciBPVjAyQTEwIGltYWdlIHNlbnNvci4N
Cj4gDQo+IC4uLg0KPiANCj4gPiArI2RlZmluZSBPVjAyQTEwX0lEKF9tc2IsIF9sc2IpCQkJCSgo
X21zYikgPDwgOCB8IChfbHNiKSkNCj4gDQo+IEhvdyBvZnRlbiBkbyB5b3UgdXNlIHRoaXMgbWFj
cm8/DQo+IA0KDQpKdXN0IG9uY2UuDQpJIHdvdWxkIHRyeSB0byB1c2UgdGhlIG1hY3JvIGZ1bmN0
aW9uIGRpcmVjdGx5IGluIG5leHQgcmVsZWFzZS4NCg0KPiAuLi4NCj4gDQo+ID4gK3N0YXRpYyBp
bnQgb3YwMmExMF9yZWFkX3NtYnVzKHN0cnVjdCBvdjAyYTEwICpvdjAyYTEwLCB1bnNpZ25lZCBj
aGFyIHJlZywNCj4gPiArCQkJICAgICAgdW5zaWduZWQgY2hhciAqdmFsKQ0KPiA+ICt7DQo+ID4g
KwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdjRsMl9nZXRfc3ViZGV2ZGF0YSgmb3YwMmEx
MC0+c3ViZGV2KTsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJcmV0ID0gaTJjX3NtYnVz
X3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwgcmVnKTsNCj4gDQo+ID4gKw0KPiANCj4gRXh0cmEgYmxh
bmsgbGluZS4NCj4gDQoNClRoYW5rcyBmb3IgdGhlIGNhcmVmdWxseSByZW1pbmRlci4NClRoaXMg
ZXJyb3IgY2FuIGVhc2lseSBiZSBuZWdsZWN0ZWQuDQpJIHdvdWxkIHJlbW92ZSBpdCBpbiBuZXh0
IHJlbGVhc2UuDQoNCj4gPiArCWlmIChyZXQgPCAwKQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4g
Kw0KPiA+ICsJKnZhbCA9ICh1bnNpZ25lZCBjaGFyKXJldDsNCj4gPiArDQo+ID4gKwlyZXR1cm4g
MDsNCj4gPiArfQ0KPiANCj4gLi4uDQo+IA0KPiA+ICtzdGF0aWMgaW50IG92MDJhMTBfZW50aXR5
X2luaXRfY2ZnKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsDQo+ID4gKwkJCQkgICBzdHJ1Y3QgdjRs
Ml9zdWJkZXZfcGFkX2NvbmZpZyAqY2ZnKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgdjRsMl9zdWJk
ZXZfZm9ybWF0IGZtdCA9IHsNCj4gDQo+ID4gKwkJLndoaWNoID0gY2ZnID8gVjRMMl9TVUJERVZf
Rk9STUFUX1RSWQ0KPiA+ICsJCQkgICAgIDogVjRMMl9TVUJERVZfRk9STUFUX0FDVElWRSwNCj4g
DQo+IEkgdGhpbmsgaXQgd291bGQgYmUgZmluZSB0byBoYXZlIGl0IG9uIG9uZSBsaW5lLg0KPiAN
Cg0KR290IGl0Lg0KRml4ZWQgaW4gbmV4dCByZWxlYXNlLg0KDQo+ID4gKwkJLmZvcm1hdCA9IHsN
Cj4gPiArCQkJLndpZHRoID0gMTYwMCwNCj4gPiArCQkJLmhlaWdodCA9IDEyMDAsDQo+ID4gKwkJ
fQ0KPiA+ICsJfTsNCj4gPiArDQo+ID4gKwlvdjAyYTEwX3NldF9mbXQoc2QsIGNmZywgJmZtdCk7
DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gDQo+IC4uLg0KPiANCj4gPiArCWlm
ICghcmV0KSB7DQo+ID4gKwkJaWYgKHJvdGF0aW9uID09IDE4MCkgew0KPiANCj4gaWYgKGEpIHsN
Cj4gCWlmIChiKSB7DQo+IAkJLi4uDQo+IAl9DQo+IH0NCj4gDQo+ID09DQo+IA0KPiBpZiAoYSAm
JiBiKSB7DQo+IAkuLi4NCj4gfQ0KPiANCg0KVGhhbmtzIGZvciB0aGUgcmVtaW5kZXIgOi0pDQpO
ZXh0IHJlbGVhc2Ugd291bGQgdXNlOg0KaWYgKCFyZXQgJiYgcm90YXRpb24gPT0gMTgwKSB7DQoJ
Li4uDQp9DQoNCj4gPiArCQkJb3YwMmExMC0+dXBzaWRlX2Rvd24gPSB0cnVlOw0KPiA+ICsJCQlv
djAyYTEwLT5mbXQuY29kZSA9IE1FRElBX0JVU19GTVRfU1JHR0IxMF8xWDEwOw0KPiA+ICsJCX0N
Cj4gPiArCX0NCj4gDQoNCg==

