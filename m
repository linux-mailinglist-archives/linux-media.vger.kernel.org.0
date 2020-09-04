Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA68625DA0F
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 15:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730498AbgIDNgq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 09:36:46 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:17224 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730486AbgIDNeb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Sep 2020 09:34:31 -0400
X-UUID: 7b857da086b7497398ecea8b9af73aa2-20200904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=WiFHXErEj76BZNPxRjW3J4xmOmUT5inytUFEOkb4Kqs=;
        b=Xl4IikklDNaK8lCAI+EVmIa5pSyVCFBvi+tEWQvWkgzlNsO9F+/ewaYXKskUddRZgshjDAp87aQStlh8X7IKM68IzEvSueGpsPKK175lGRrn7SgwySb1MEWYWmSHUHDSWTGyg+RFaQU3G1frqrmbU0ab7BaDCH8UeFZlqh2T9fE=;
X-UUID: 7b857da086b7497398ecea8b9af73aa2-20200904
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 460020713; Fri, 04 Sep 2020 21:34:16 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Sep
 2020 21:34:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Sep 2020 21:34:14 +0800
Message-ID: <1599226354.4733.69.camel@mhfsdcap03>
Subject: Re: [PATCH v14 2/2] media: i2c: Add OV02A10 image sensor driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>, <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>, <matrix.zhu@aliyun.com>
Date:   Fri, 4 Sep 2020 21:32:34 +0800
In-Reply-To: <20200902135145.GO1891694@smile.fi.intel.com>
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
         <20200902120122.24456-3-dongchun.zhu@mediatek.com>
         <20200902134421.GN1891694@smile.fi.intel.com>
         <20200902135145.GO1891694@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 386AAC2586955A2B46CD605CFB58BE67C464E85DE164D539730FF46DA6DFEAE12000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIwLTA5LTAyIGF0IDE2OjUxICswMzAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
DQo+IE9uIFdlZCwgU2VwIDAyLCAyMDIwIGF0IDA0OjQ0OjIxUE0gKzAzMDAsIEFuZHkgU2hldmNo
ZW5rbyB3cm90ZToNCj4gPiBPbiBXZWQsIFNlcCAwMiwgMjAyMCBhdCAwODowMToyMlBNICswODAw
LCBEb25nY2h1biBaaHUgd3JvdGU6DQo+IA0KPiA+ID4gKwlyZXQgPSBmd25vZGVfcHJvcGVydHlf
cmVhZF91MzIoZGV2X2Z3bm9kZShkZXYpLCAicm90YXRpb24iLCAmcm90YXRpb24pOw0KPiANCj4g
PiA+ICsJcmV0ID0gZndub2RlX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KGRldl9md25vZGUoZGV2
KSwNCj4gDQo+ID4gPiArCQlmd25vZGVfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkoZGV2X2Z3bm9k
ZShkZXYpLA0KPiANCj4gPiA+ICsJcmV0ID0gZndub2RlX3Byb3BlcnR5X3JlYWRfdTMyKGRldl9m
d25vZGUoZGV2KSwgImNsb2NrLWZyZXF1ZW5jeSIsDQo+IA0KPiANCj4gQnR3LCBjYW4gc29tZWJv
ZHkgZXhwbGFpbiwgd2h5IGl0J3MgZndub2RlIEFQSSBhbmQgbm90IGRpcmVjdCB1c2Ugb2YgZGV2
aWNlIHByb3BlcnR5IEFQST8NCj4gDQo+IEluIGFsbCBhYm92ZSBjYXNlcyBJIHNlZSBubyByZWFz
b24gd2h5IG5vdCB0byB1c2UgZGV2aWNlIHByb3BlcnR5IEFQSSBkaXJlY3RseS4NCj4gDQoNCkZy
b20gdGhlIGZ3bm9kZSBBUEkncyB1c2FnZToNCkBmd25vZGU6IEZpcm13YXJlIG5vZGUgdG8gZ2V0
IHRoZSBwcm9wZXJ0eSBvZi4NCg0KSXQgc2VlbXMgZGV2X2Z3bm9kZShkZXYpIGNvdWxkIHJldHVy
biBkZXYtPm9mX25vZGUtPmZ3bm9kZSBpZiBDT05GSUdfT0YNCmlzIGVuYWJsZWQsIG9yIHJldHVy
biBkZXYtPmZ3bm9kZSBpZiBub3QuDQoNCg0KDQo=

