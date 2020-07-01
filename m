Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F79921028A
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 05:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgGADaz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 23:30:55 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:19186 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725862AbgGADaz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 23:30:55 -0400
X-UUID: c85820bc15814427a6baf24b5e392061-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=jPLb6X7KkAERFbw83D4rpBHLOde+TpO2PyeCi9S6N1E=;
        b=AHHT2TIIhepSYWlhLVKskutyhuKRf2HSMQvwbgvqDuaoO7na3BOl662AHh1phPyVHy3TXzTz5j2TzzG/l9HbuknxCEpoR6epc0OAxFeXo9t6xkoep6UTdIQSVEIS6AySYPnfqT8TQ7uVnAx/4GQmGlCvNLi7zGs8vXXaI0hPVuo=;
X-UUID: c85820bc15814427a6baf24b5e392061-20200701
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <tiffany.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 875107434; Wed, 01 Jul 2020 11:30:53 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 11:30:48 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 11:30:48 +0800
Message-ID: <1593574249.1533.1.camel@mtksdaap41>
Subject: Re: [PATCH v2 11/18] media: mtk-vcodec: venc support
 MIN_OUTPUT_BUFFERS control
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
Date:   Wed, 1 Jul 2020 11:30:49 +0800
In-Reply-To: <20200626080442.292309-12-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
         <20200626080442.292309-12-acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A53B404917E71990100EFA58BA547508BC57621DE14CC7C0F8BFD21319A27A322000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDIwLTA2LTI2IGF0IDE3OjA0ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gVGhpcyBjb250cm9sIGlzIHJlcXVpcmVkIGJ5IHY0bDItY29tcGxpYW5jZSBmb3IgZW5j
b2RlcnMuIEEgdmFsdWUgb2YgMQ0KPiBzaG91bGQgYmUgc3VpdGFibGUgZm9yIGFsbCBzY2VuYXJp
b3MuDQo+IA0KQWNrZWQtYnk6IFRpZmZhbnkgTGluIDx0aWZmYW55LmxpbkBtZWRpYXRlay5jb20+
DQoNCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QGNocm9taXVt
Lm9yZz4NCj4gLS0tDQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zj
b2RlY19lbmMuYyB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zj
b2RlY19lbmMuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVj
X2VuYy5jDQo+IGluZGV4IGYyYmExOWMzMjQwMC4uZjgzM2FlZTRhMDZmIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYw0KPiAr
KysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYw0K
PiBAQCAtMTIwNiw2ICsxMjA2LDggQEAgaW50IG10a192Y29kZWNfZW5jX2N0cmxzX3NldHVwKHN0
cnVjdCBtdGtfdmNvZGVjX2N0eCAqY3R4KQ0KPiAgDQo+ICAJdjRsMl9jdHJsX2hhbmRsZXJfaW5p
dChoYW5kbGVyLCBNVEtfTUFYX0NUUkxTX0hJTlQpOw0KPiAgDQo+ICsJdjRsMl9jdHJsX25ld19z
dGQoaGFuZGxlciwgb3BzLCBWNEwyX0NJRF9NSU5fQlVGRkVSU19GT1JfT1VUUFVULA0KPiArCQkJ
ICAxLCAxLCAxLCAxKTsNCj4gIAl2NGwyX2N0cmxfbmV3X3N0ZChoYW5kbGVyLCBvcHMsIFY0TDJf
Q0lEX01QRUdfVklERU9fQklUUkFURSwNCj4gIAkJCSAgY3R4LT5kZXYtPnZlbmNfcGRhdGEtPm1p
bl9iaXRyYXRlLA0KPiAgCQkJICBjdHgtPmRldi0+dmVuY19wZGF0YS0+bWF4X2JpdHJhdGUsIDEs
IDQwMDAwMDApOw0KDQo=

