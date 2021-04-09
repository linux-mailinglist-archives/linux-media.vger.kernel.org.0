Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92DDE359704
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 10:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhDIIAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 04:00:25 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:62422 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229621AbhDIIAY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 04:00:24 -0400
Received: by ajax-webmail-mail-app3 (Coremail) ; Fri, 9 Apr 2021 15:59:53
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.72.8]
Date:   Fri, 9 Apr 2021 15:59:53 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Rui Miguel Silva" <rmfrfs@gmail.com>
Cc:     kjlu@umn.edu, "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Shawn Guo" <shawnguo@kernel.org>,
        "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "NXP Linux Team" <linux-imx@nxp.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: imx: imx7-mipi-csis: Fix runtime PM
 imbalance in mipi_csis_s_stream
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn zju.edu.cn
In-Reply-To: <20210408135702.f7ikjvwirvtzsarv@arch-thunder.localdomain>
References: <20210408090827.32612-1-dinghao.liu@zju.edu.cn>
 <20210408135702.f7ikjvwirvtzsarv@arch-thunder.localdomain>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5025467a.453b6.178b5a50321.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgC3nz55CXBgg0vxAA--.30249W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgkKBlZdtTUlDwABsn
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBIaSBMaXUsCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLgo+IAo+IE9uIFRodSwgQXByIDA4LCAy
MDIxIGF0IDA1OjA4OjI3UE0gKzA4MDAsIERpbmdoYW8gTGl1IHdyb3RlOgo+ID4gV2hlbiB2NGwy
X3N1YmRldl9jYWxsKCkgZmFpbHMsIGEgcGFpcmluZyBQTSB1c2FnZSBjb3VudGVyCj4gPiBkZWNy
ZW1lbnQgaXMgbmVlZGVkIHRvIGtlZXAgdGhlIGNvdW50ZXIgYmFsYW5jZWQuIEl0J3MgdGhlCj4g
PiBzYW1lIGZvciB0aGUgZm9sbG93aW5nIGVycm9yIHBhdGhzIGluIGNhc2UgJ2VuYWJsZScgaXMg
b24uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IERpbmdoYW8gTGl1IDxkaW5naGFvLmxpdUB6anUu
ZWR1LmNuPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9zdGFnaW5nL21lZGlhL2lteC9pbXg3LW1pcGkt
Y3Npcy5jIHwgOSArKysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21l
ZGlhL2lteC9pbXg3LW1pcGktY3Npcy5jIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL2lteC9pbXg3
LW1pcGktY3Npcy5jCj4gPiBpbmRleCBhMDFhNzM2NGI0YjkuLjJhM2ZmZjIzMWE0MCAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9pbXgvaW14Ny1taXBpLWNzaXMuYwo+ID4g
KysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL2lteC9pbXg3LW1pcGktY3Npcy5jCj4gPiBAQCAt
NjI3LDIxICs2MjcsMjYgQEAgc3RhdGljIGludCBtaXBpX2NzaXNfc19zdHJlYW0oc3RydWN0IHY0
bDJfc3ViZGV2ICptaXBpX3NkLCBpbnQgZW5hYmxlKQo+ID4gIAkJCXJldHVybiByZXQ7Cj4gPiAg
CQl9Cj4gPiAgCQlyZXQgPSB2NGwyX3N1YmRldl9jYWxsKHN0YXRlLT5zcmNfc2QsIGNvcmUsIHNf
cG93ZXIsIDEpOwo+ID4gLQkJaWYgKHJldCA8IDApCj4gPiArCQlpZiAocmV0IDwgMCkgewo+ID4g
KwkJCXBtX3J1bnRpbWVfcHV0X25vaWRsZSgmc3RhdGUtPnBkZXYtPmRldik7Cj4gCj4gSSB0aGlu
ayBoZXJlIHdlIHNob3VsZCBnbyBjb21wbGV0ZWx5IHBtX3J1bnRpbWVfcHV0IHRvIGNhbGwgdGhl
Cj4gbWlwaV9jc2lzX3BtX3N1c3BlbmQgZG93biB0aGUgbGluZSwgcmlnaHQ/Cj4gCj4gPiAgCQkJ
cmV0dXJuIHJldDsKPiA+ICsJCX0KPiA+ICAJfQo+ID4gIAo+ID4gIAltdXRleF9sb2NrKCZzdGF0
ZS0+bG9jayk7Cj4gPiAgCWlmIChlbmFibGUpIHsKPiA+ICAJCWlmIChzdGF0ZS0+ZmxhZ3MgJiBT
VF9TVVNQRU5ERUQpIHsKPiA+ICAJCQlyZXQgPSAtRUJVU1k7Cj4gPiArCQkJcG1fcnVudGltZV9w
dXRfbm9pZGxlKCZzdGF0ZS0+cGRldi0+ZGV2KTsKPiAKPiBzaW5jZSB3ZSBhcmUgaW4gU1RfU1VT
UEVOREVEIHN0YXRlLCBmb3Igc3VyZSB0aGUgcG0gY291bnRlciB3YXMKPiBhbHJlYWR5IDAuCj4g
Cj4gPiAgCQkJZ290byB1bmxvY2s7Cj4gPiAgCQl9Cj4gPiAgCj4gPiAgCQltaXBpX2NzaXNfc3Rh
cnRfc3RyZWFtKHN0YXRlKTsKPiA+ICAJCXJldCA9IHY0bDJfc3ViZGV2X2NhbGwoc3RhdGUtPnNy
Y19zZCwgdmlkZW8sIHNfc3RyZWFtLCAxKTsKPiA+IC0JCWlmIChyZXQgPCAwKQo+ID4gKwkJaWYg
KHJldCA8IDApIHsKPiA+ICsJCQlwbV9ydW50aW1lX3B1dF9ub2lkbGUoJnN0YXRlLT5wZGV2LT5k
ZXYpOwo+IAo+IGhlcmUgYWxzbyB3ZSBuZWVkIHRoZSBwbV9ydW50aW1lX3B1dCwgbWF5YmUganVz
dCBjaGFuZ2luZyB0aGUgdW5sb2NrCj4gdGFnIGJlbGxvdyBmcm9tOgo+ICAgICBpZiAoIWVuYWJs
ZSkKPiAgICAgICAgIHBtX3J1bnRpbWVfcHV0KCZzdGF0ZS0+cGRldi0+ZGV2KTsKPiAKPiB0byAK
PiAgICAgaWYgKCFlbmFibGUgfHwgKHJldCA8IDApKQo+ICAgICAgICAgcG1fcnVudGltZV9wdXQo
JnN0YXRlLT5wZGV2LT5kZXYpOwo+IAo+IHdpbGwgbm90IGh1cnQgdGhlIGZpcnN0IGNhc2UgYW5k
IHdpbGwgY29tcGxldGUgdGhlIHN1c3BlbmQgcm91dGluZQo+IGFmdGVyd2FyZCBpbiB0aGUgc2Vj
b25kIGNhc2UuCj4gCgpUaGlzIGlzIG11Y2ggY2xlYXJlciwgdGhhbmtzISBJIHdpbGwgZml4IHRo
aXMgYW5kIHNlbmQgYSBuZXcgcGF0Y2ggc29vbi4KClJlZ2FyZHMsCkRpbmdoYW8=
