Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9819425AB26
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 14:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgIBMav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 08:30:51 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:49967 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726377AbgIBMao (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 08:30:44 -0400
X-UUID: ea9ba8abf0e14f189b56f1e741f232ca-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ZtjJKtZNAVuZVOOlw4wrd3u0b/ydDS0OmQrA7mmZt64=;
        b=WQH2h9V/SoJ0o8LoWpTXrzLicqG7ZRxrmRTMlxpN1Gniwc+5xbhPJJXm6EORjCSMT2+CaVTJC7ouefkuT0lvGOjPixhCsxEX7+IXm4YyQbN7cexa/0MxrwohtcCDhsdGmTChYuKWo0sFPAYh5gnEH4XDC6wEQf/jgJEuLJBkcxs=;
X-UUID: ea9ba8abf0e14f189b56f1e741f232ca-20200902
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 218364270; Wed, 02 Sep 2020 20:30:18 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 2 Sep
 2020 20:30:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Sep 2020 20:30:16 +0800
Message-ID: <1599049719.25072.4.camel@mhfsdcap03>
Subject: Re: [PATCH] media: mtk-vcodec: set dma max segment size
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
CC:     <linux-mediatek@lists.infradead.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>,
        Anand K Mistry <amistry@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Yunfei Dong <Yunfei.Dong@mediatek.com>
Date:   Wed, 2 Sep 2020 20:28:39 +0800
In-Reply-To: <20200821041414.1560707-1-hsinyi@chromium.org>
References: <20200821041414.1560707-1-hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 88726D815BBC0380A972E320C447704F65376A421771C015CAE967C03689FAF22000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RGVhciBIc2luLVlpLA0KDQpiZWNhdXNlIHRoaXMgV2FybmluZyBpcyBvY2N1cmVkIHdpdGggY29u
ZmlnIENPTkZJR19ETUFfQVBJX0RFQlVHX1NHPXksDQpob3cgYWJvdXQgYWRkIHRoZXNlIG1vZGlm
aWNhdGlvbnMgd2l0aCB0aGlzIGNvbmZpZ3VyYXRpb24gYXMgd2VsbD8NCg0KT24gRnJpLCAyMDIw
LTA4LTIxIGF0IDEyOjE0ICswODAwLCBIc2luLVlpIFdhbmcgd3JvdGU6DQo+IFNldCBkbWEgbWF4
IHNlZ21lbnQgc2l6ZSBmb3IgZW5jb2RlciBhbmQgZGVjb2RlciBkcml2ZXIuDQo+IA0KPiBGaXgg
Zm9sbG93aW5nIHdhcm5pbmcgd2l0aCBDT05GSUdfRE1BX0FQSV9ERUJVR19TRz15DQo+IA0KPiBb
ICAgNzUuMTQ3ODI1XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gWyAg
IDc1LjE0Nzg0NF0gbXRrLXZjb2RlYy1lbmMgMTkwMDIwMDAudmNvZGVjOiBETUEtQVBJOiBtYXBw
aW5nIHNnIHNlZ21lbnQgbG9uZ2VyIHRoYW4gZGV2aWNlIGNsYWltcyB0byBzdXBwb3J0IFtsZW49
OTgzMDQwXSBbbWF4PTY1NTM2XQ0KPiBbICAgNzUuMTQ3ODc2XSBXQVJOSU5HOiBDUFU6IDIgUElE
OiA0MDY5IGF0IGtlcm5lbC9kbWEvZGVidWcuYzoxMzAyIGRlYnVnX2RtYV9tYXBfc2crMHgxYTgv
MHgyYzQNCj4gLi4uDQo+IFsgICA3NS4xNDgxMzldIENhbGwgdHJhY2U6DQo+IFsgICA3NS4xNDgx
NDldICBkZWJ1Z19kbWFfbWFwX3NnKzB4MWE4LzB4MmM0DQo+IFsgICA3NS4xNDgxNjVdICB2YjJf
ZGNfZ2V0X3VzZXJwdHIrMHgyMjgvMHgzNjQgW3ZpZGVvYnVmMl9kbWFfY29udGlnXQ0KPiBbICAg
NzUuMTQ4MTc4XSAgX19idWZfcHJlcGFyZSsweDNhYy8weDhjMCBbdmlkZW9idWYyX2NvbW1vbl0N
Cj4gWyAgIDc1LjE0ODE4OF0gIHZiMl9jb3JlX3FidWYrMHhhNC8weDU4YyBbdmlkZW9idWYyX2Nv
bW1vbl0NCj4gWyAgIDc1LjE0ODE5OV0gIHZiMl9xYnVmKzB4ODgvMHhlNCBbdmlkZW9idWYyX3Y0
bDJdDQo+IFsgICA3NS4xNDgyMTFdICB2NGwyX20ybV9xYnVmKzB4ODAvMHhmOCBbdjRsMl9tZW0y
bWVtXQ0KPiBbICAgNzUuMTQ4MjIxXSAgdmlkaW9jX3ZlbmNfcWJ1ZisweDNjLzB4NzAgW210a192
Y29kZWNfZW5jXQ0KPiBbICAgNzUuMTQ4MjM0XSAgdjRsX3FidWYrMHg0OC8weDU4DQo+IFsgICA3
NS4xNDgyNDJdICBfX3ZpZGVvX2RvX2lvY3RsKzB4MjAwLzB4MzdjDQo+IFsgICA3NS4xNDgyNTBd
ICB2aWRlb191c2VyY29weSsweDM2MC8weDgzNA0KPiBbICAgNzUuMTQ4MjU5XSAgdmlkZW9faW9j
dGwyKzB4MzgvMHg0OA0KPiBbICAgNzUuMTQ4MjY3XSAgdjRsMl9pb2N0bCsweDZjLzB4ODANCj4g
WyAgIDc1LjE0ODI3Nl0gIGRvX3ZpZGVvX2lvY3RsKzB4ZWZjLzB4NGI3MA0KPiBbICAgNzUuMTQ4
Mjg0XSAgdjRsMl9jb21wYXRfaW9jdGwzMisweDVjLzB4Y2MNCj4gWyAgIDc1LjE0ODI5NF0gIF9f
YXJtNjRfY29tcGF0X3N5c19pb2N0bCsweGY0LzB4MjQwDQo+IFsgICA3NS4xNDgzMDRdICBlbDBf
c3ZjX2NvbW1vbisweGFjLzB4MTk4DQo+IFsgICA3NS4xNDgzMTJdICBlbDBfc3ZjX2NvbXBhdF9o
YW5kbGVyKzB4MmMvMHg0MA0KPiBbICAgNzUuMTQ4MzIxXSAgZWwwX3N2Y19jb21wYXQrMHg4LzB4
MTgNCj4gWyAgIDc1LjE0ODMyOF0gaXJxIGV2ZW50IHN0YW1wOiAwDQo+IFsgICA3NS4xNDgzMzdd
IGhhcmRpcnFzIGxhc3QgIGVuYWJsZWQgYXQgKDApOiBbPDAwMDAwMDAwMDAwMDAwMDA+XSAgICAg
ICAgICAgKG51bGwpDQo+IFsgICA3NS4xNDgzNDddIGhhcmRpcnFzIGxhc3QgZGlzYWJsZWQgYXQg
KDApOiBbPGZmZmZmZjkwMDgwZTY1YzA+XSBjb3B5X3Byb2Nlc3MrMHgzODAvMHgxMTVjDQo+IFsg
ICA3NS4xNDgzNTZdIHNvZnRpcnFzIGxhc3QgIGVuYWJsZWQgYXQgKDApOiBbPGZmZmZmZjkwMDgw
ZTY1ZDg+XSBjb3B5X3Byb2Nlc3MrMHgzOTgvMHgxMTVjDQo+IFsgICA3NS4xNDgzNjRdIHNvZnRp
cnFzIGxhc3QgZGlzYWJsZWQgYXQgKDApOiBbPDAwMDAwMDAwMDAwMDAwMDA+XSAgICAgICAgICAg
KG51bGwpDQo+IFsgICA3NS4xNDgzNzJdIC0tLVsgZW5kIHRyYWNlIDU4OGJmNTI5NDUxZTM1MzEg
XS0tLQ0KPiANCj4gUmVwb3J0ZWQtYnk6IEFuYW5kIEsgTWlzdHJ5IDxhbWlzdHJ5QGNocm9taXVt
Lm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3Jn
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVj
X2RlY19kcnYuYyB8IDggKysrKysrKysNCj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZj
b2RlYy9tdGtfdmNvZGVjX2VuY19kcnYuYyB8IDggKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYw0KPiBpbmRleCA5N2ExYjY2NjRj
MjAuLjNiYmQwYmFjNTZkNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstdmNvZGVjL210a192Y29kZWNfZGVjX2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYw0KPiBAQCAtMjQyLDYgKzI0Miwx
NCBAQCBzdGF0aWMgaW50IG10a192Y29kZWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gIAkJbXRrX3Y0bDJfZXJyKCJbVlBVXSB2cHUgZGV2aWNlIGluIG5vdCByZWFkeSIp
Ow0KPiAgCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsNCj4gIAl9DQo+ICsJaWYgKCFwZGV2LT5kZXYu
ZG1hX3Bhcm1zKSB7DQo+ICsJCXBkZXYtPmRldi5kbWFfcGFybXMgPSBkZXZtX2t6YWxsb2MoJnBk
ZXYtPmRldiwNCj4gKwkJCQkJCXNpemVvZigqcGRldi0+ZGV2LmRtYV9wYXJtcyksDQo+ICsJCQkJ
CQlHRlBfS0VSTkVMKTsNCj4gKwkJaWYgKCFwZGV2LT5kZXYuZG1hX3Bhcm1zKQ0KPiArCQkJcmV0
dXJuIC1FTk9NRU07DQo+ICsJfQ0KPiArCWRtYV9zZXRfbWF4X3NlZ19zaXplKCZwZGV2LT5kZXYs
IERNQV9CSVRfTUFTSygzMikpOw0KPiAgDQo+ICAJdnB1X3dkdF9yZWdfaGFuZGxlcihkZXYtPnZw
dV9wbGF0X2RldiwgbXRrX3Zjb2RlY19kZWNfcmVzZXRfaGFuZGxlciwNCj4gIAkJCWRldiwgVlBV
X1JTVF9ERUMpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNv
ZGVjL210a192Y29kZWNfZW5jX2Rydi5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNv
ZGVjL210a192Y29kZWNfZW5jX2Rydi5jDQo+IGluZGV4IDRkMzFmMWVkMTEzZi4uZmY0YTg3NDg1
ZDY5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRr
X3Zjb2RlY19lbmNfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNv
ZGVjL210a192Y29kZWNfZW5jX2Rydi5jDQo+IEBAIC0yNDksNiArMjQ5LDE0IEBAIHN0YXRpYyBp
bnQgbXRrX3Zjb2RlY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCQlt
dGtfdjRsMl9lcnIoIltWUFVdIHZwdSBkZXZpY2UgaW4gbm90IHJlYWR5Iik7DQo+ICAJCXJldHVy
biAtRVBST0JFX0RFRkVSOw0KPiAgCX0NCj4gKwlpZiAoIXBkZXYtPmRldi5kbWFfcGFybXMpIHsN
Cj4gKwkJcGRldi0+ZGV2LmRtYV9wYXJtcyA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LA0KPiAr
CQkJCQkJc2l6ZW9mKCpwZGV2LT5kZXYuZG1hX3Bhcm1zKSwNCj4gKwkJCQkJCUdGUF9LRVJORUwp
Ow0KPiArCQlpZiAoIXBkZXYtPmRldi5kbWFfcGFybXMpDQo+ICsJCQlyZXR1cm4gLUVOT01FTTsN
Cj4gKwl9DQo+ICsJZG1hX3NldF9tYXhfc2VnX3NpemUoJnBkZXYtPmRldiwgRE1BX0JJVF9NQVNL
KDMyKSk7DQo+ICANCj4gIAl2cHVfd2R0X3JlZ19oYW5kbGVyKGRldi0+dnB1X3BsYXRfZGV2LCBt
dGtfdmNvZGVjX2VuY19yZXNldF9oYW5kbGVyLA0KPiAgCQkJCWRldiwgVlBVX1JTVF9FTkMpOw0K
DQo=

