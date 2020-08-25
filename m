Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F70C2511B8
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 07:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgHYFt7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 01:49:59 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:63712 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726090AbgHYFt7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 01:49:59 -0400
X-UUID: 8c52e717cd56457386aab6ec17ffc486-20200825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=x24GTs4og816xQigVioi/+Ob9pQhy96LyKGjS7OYRMc=;
        b=iwH2tpJgrgR3KrNYkukx9eMsnaurS3rowME2whW82Y83BXsfoJWoWR3VeuOKzOBwSUm7gZbMjpCLg/rq/NcxSxTd02axJ1DyygTtt9Jjj5LSoTk8dDv4x5DW86hK9jhxyOysmJcAOBgvtVCSoSTP6Qe3h+hOMY1lHzdWccz518I=;
X-UUID: 8c52e717cd56457386aab6ec17ffc486-20200825
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <tiffany.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1222872420; Tue, 25 Aug 2020 13:49:54 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 13:49:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 13:49:54 +0800
Message-ID: <1598334593.1969.3.camel@mtksdaap41>
Subject: Re: [PATCH v4 17/17] media: mtk-vcodec: venc: fix invalid time per
 frame in S_PARM
From:   Tiffany Lin <tiffany.lin@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>
CC:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Date:   Tue, 25 Aug 2020 13:49:53 +0800
In-Reply-To: <20200821103608.2310097-18-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
         <20200821103608.2310097-18-acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDIwLTA4LTIxIGF0IDE5OjM2ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gdjRsMi1jb21wbGlhbmNlIGV4cGVjdHMgdGhlIGRyaXZlciB0byBhZGp1c3QgdGhlIHRp
bWUgcGVyIGZyYW1lIGlmIGl0IGlzDQo+IGludmFsaWQgKG51bWVyYXRvciBvciBkZW5vbWluYXRv
ciBzZXQgdG8gMCkuIEFkanVzdCBpdCB0byB0aGUgZGVmYXVsdA0KPiB2YWx1ZSBpbiB0aGVzZSBj
YXNlcy4NCj4gDQoNCkFja2VkLWJ5OiBUaWZmYW55IExpbiA8dGlmZmFueS5saW5AbWVkaWF0ZWsu
Y29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJvdEBjaHJv
bWl1bS5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210
a192Y29kZWNfZW5jLmMgfCAxMiArKysrKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMgYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYw0KPiBpbmRleCAwOWJhYWMyZGJj
MzYuLjgyYjA0NzE0Zjc1MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstdmNvZGVjL210a192Y29kZWNfZW5jLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMNCj4gQEAgLTIwMCwxNCArMjAwLDE4IEBAIHN0
YXRpYyBpbnQgdmlkaW9jX3ZlbmNfc19wYXJtKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2
LA0KPiAgCQkJICAgICAgc3RydWN0IHY0bDJfc3RyZWFtcGFybSAqYSkNCj4gIHsNCj4gIAlzdHJ1
Y3QgbXRrX3Zjb2RlY19jdHggKmN0eCA9IGZoX3RvX2N0eChwcml2KTsNCj4gKwlzdHJ1Y3QgdjRs
Ml9mcmFjdCAqdGltZXBlcmZyYW1lID0gJmEtPnBhcm0ub3V0cHV0LnRpbWVwZXJmcmFtZTsNCj4g
IA0KPiAgCWlmIChhLT50eXBlICE9IFY0TDJfQlVGX1RZUEVfVklERU9fT1VUUFVUX01QTEFORSkN
Cj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICANCj4gLQljdHgtPmVuY19wYXJhbXMuZnJhbWVyYXRl
X251bSA9DQo+IC0JCQlhLT5wYXJtLm91dHB1dC50aW1lcGVyZnJhbWUuZGVub21pbmF0b3I7DQo+
IC0JY3R4LT5lbmNfcGFyYW1zLmZyYW1lcmF0ZV9kZW5vbSA9DQo+IC0JCQlhLT5wYXJtLm91dHB1
dC50aW1lcGVyZnJhbWUubnVtZXJhdG9yOw0KPiArCWlmICh0aW1lcGVyZnJhbWUtPm51bWVyYXRv
ciA9PSAwIHx8IHRpbWVwZXJmcmFtZS0+ZGVub21pbmF0b3IgPT0gMCkgew0KPiArCQl0aW1lcGVy
ZnJhbWUtPm51bWVyYXRvciA9IE1US19ERUZBVUxUX0ZSQU1FUkFURV9OVU07DQo+ICsJCXRpbWVw
ZXJmcmFtZS0+ZGVub21pbmF0b3IgPSBNVEtfREVGQVVMVF9GUkFNRVJBVEVfREVOT007DQo+ICsJ
fQ0KPiArDQo+ICsJY3R4LT5lbmNfcGFyYW1zLmZyYW1lcmF0ZV9udW0gPSB0aW1lcGVyZnJhbWUt
PmRlbm9taW5hdG9yOw0KPiArCWN0eC0+ZW5jX3BhcmFtcy5mcmFtZXJhdGVfZGVub20gPSB0aW1l
cGVyZnJhbWUtPm51bWVyYXRvcjsNCj4gIAljdHgtPnBhcmFtX2NoYW5nZSB8PSBNVEtfRU5DT0RF
X1BBUkFNX0ZSQU1FUkFURTsNCj4gIA0KPiAgCWEtPnBhcm0ub3V0cHV0LmNhcGFiaWxpdHkgPSBW
NEwyX0NBUF9USU1FUEVSRlJBTUU7DQoNCg==

