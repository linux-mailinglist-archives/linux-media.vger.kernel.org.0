Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2DFD2EBEAF
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 14:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbhAFNav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 08:30:51 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2941 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbhAFNau (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 08:30:50 -0500
Received: from dggeme762-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4D9qvl3Dq1z5F1p;
        Wed,  6 Jan 2021 21:29:07 +0800 (CST)
Received: from dggeme760-chm.china.huawei.com (10.3.19.106) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 6 Jan 2021 21:30:02 +0800
Received: from dggeme760-chm.china.huawei.com ([10.6.80.70]) by
 dggeme760-chm.china.huawei.com ([10.6.80.70]) with mapi id 15.01.1913.007;
 Wed, 6 Jan 2021 21:30:02 +0800
From:   zhengyongjun <zhengyongjun3@huawei.com>
To:     "clabbe@baylibre.com" <clabbe@baylibre.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mjpeg-users@lists.sourceforge.net" 
        <mjpeg-users@lists.sourceforge.net>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIC1uZXh0XSBtZWRpYTogem9yYW46IHVzZSByZXNvdXJj?=
 =?gb2312?Q?e=5Fsize?=
Thread-Topic: [PATCH -next] media: zoran: use resource_size
Thread-Index: AQHW5C4k5dTBnbfL/0ecILiTVyuNR6oal3pw
Date:   Wed, 6 Jan 2021 13:30:02 +0000
Message-ID: <f6368bef56b54bdf94c2fdb1fa0752d1@huawei.com>
References: <20210106131702.32507-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210106131702.32507-1-zhengyongjun3@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.178.249]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

U29ycnksIHRoaXMgaXMgbXkgZmF1bHQsIGFsbCB0aGlzIG1lZGlhIHJlbGF0ZWQgcGF0Y2ggY29t
bWl0IG1zZyBpcyB3cm9uZywgSSB3aWxsIHNlbmQgcGF0Y2ggdjIsIHBsZWFzZSBpZ25vcmUgaXQu
DQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiB6aGVuZ3lvbmdqdW4gDQq3osvNyrG85Dog
MjAyMcTqMdTCNsjVIDIxOjE3DQrK1bz+yMs6IGNsYWJiZUBiYXlsaWJyZS5jb207IG1jaGVoYWJA
a2VybmVsLm9yZzsgbWpwZWctdXNlcnNAbGlzdHMuc291cmNlZm9yZ2UubmV0OyBsaW51eC1tZWRp
YUB2Z2VyLmtlcm5lbC5vcmc7IGRldmVsQGRyaXZlcmRldi5vc3Vvc2wub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnDQqzrcvNOiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgemhl
bmd5b25nanVuIDx6aGVuZ3lvbmdqdW4zQGh1YXdlaS5jb20+DQrW98ziOiBbUEFUQ0ggLW5leHRd
IG1lZGlhOiB6b3JhbjogdXNlIHJlc291cmNlX3NpemUNCg0KVXNlIHJlc291cmNlX3NpemUgcmF0
aGVyIHRoYW4gYSB2ZXJib3NlIGNvbXB1dGF0aW9uIG9uIHRoZSBlbmQgYW5kIHN0YXJ0IGZpZWxk
cy4NCg0KU2lnbmVkLW9mZi1ieTogWmhlbmcgWW9uZ2p1biA8emhlbmd5b25nanVuM0BodWF3ZWku
Y29tPg0KLS0tDQogZHJpdmVycy9zdGFnaW5nL21lZGlhL3pvcmFuL3pvcmFuX2RyaXZlci5jIHwg
MiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL3pvcmFuL3pvcmFuX2RyaXZlci5jIGIv
ZHJpdmVycy9zdGFnaW5nL21lZGlhL3pvcmFuL3pvcmFuX2RyaXZlci5jDQppbmRleCA4MDgxOTZl
YTViODEuLmQ2MGI0YzczZWE4MCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS96
b3Jhbi96b3Jhbl9kcml2ZXIuYw0KKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL3pvcmFuL3pv
cmFuX2RyaXZlci5jDQpAQCAtMTAyMCw3ICsxMDIwLDcgQEAgaW50IHpvcmFuX3F1ZXVlX2luaXQo
c3RydWN0IHpvcmFuICp6ciwgc3RydWN0IHZiMl9xdWV1ZSAqdnEpDQogCXZxLT5idWZfc3RydWN0
X3NpemUgPSBzaXplb2Yoc3RydWN0IHpyX2J1ZmZlcik7DQogCXZxLT5vcHMgPSAmenJfdmlkZW9f
cW9wczsNCiAJdnEtPm1lbV9vcHMgPSAmdmIyX2RtYV9jb250aWdfbWVtb3BzOw0KLQl2cS0+Z2Zw
X2ZsYWdzID0gR0ZQX0RNQTMyLA0KKwl2cS0+Z2ZwX2ZsYWdzID0gR0ZQX0RNQTMyOw0KIAl2cS0+
dGltZXN0YW1wX2ZsYWdzID0gVjRMMl9CVUZfRkxBR19USU1FU1RBTVBfTU9OT1RPTklDOw0KIAl2
cS0+bWluX2J1ZmZlcnNfbmVlZGVkID0gOTsNCiAJdnEtPmxvY2sgPSAmenItPmxvY2s7DQotLQ0K
Mi4yMi4wDQoNCg==
