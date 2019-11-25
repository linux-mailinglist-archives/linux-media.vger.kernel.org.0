Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D108F1090AE
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 16:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbfKYPGv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 10:06:51 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:44816 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728329AbfKYPGv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 10:06:51 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAPEw0Wb014998;
        Mon, 25 Nov 2019 10:06:49 -0500
Received: from nam01-bn3-obe.outbound.protection.outlook.com (mail-bn3nam01lp2050.outbound.protection.outlook.com [104.47.33.50])
        by mx0a-00128a01.pphosted.com with ESMTP id 2wf2j4msj1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 25 Nov 2019 10:06:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcRw4y4FZDDueGZUaDChqIMBysHBtg2a2D/jxt6DjYtCboTHmqV0pPcTcDvEknUa92/SOXW7R4FzcjPgwyQMjq2k56CQivzBhqJHXLoYKTkvXLj0xi56Jl5B3fteybFd8BPfuz/PFfFrVfURTx//YRHh5Zf2QQUAXf1z8vyGaOGH9ayrD3wg1S3Q6wOyFG0MM+OjvQYT7EAeqXQSRGZv2B8pTD12WtUXzLRykyHn0puXHAfsOChi/jcILrUaG1BEgOgmUCibznK6fK56U/5neoKqwGDFAeAx4m9ttZHfWyR14jVa4Ey7GDt2UklncAemhr2ksW/6StL6UEPMb4g/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UipkQDKfEzt06+v5VSr77jxhT3EUikB5/XZ7SGrj+EU=;
 b=Czw5ufvDz7EoQ5PhH7nvqZwsG2a0ws7R2GNJIRESz3zg/UbQ1FH4ih4iy/ysoS79NCPxrcDVMYKMZ8qPUMqtT2sFRHezq4llgyKwLniOlSCT00WZDUFptFfHJHxhGubNyvQ/hwzBUJz/AnFO/WdZ8y6T5xDMo4IdIsg0ztxozvbIfQzoMJM3OIv5hdtxZ0GsKV5Phe8M/NBh8hA8euvZiiRI6Y9XPDzZYXgVk0UMJCrZ440L2kQ+y0AkacwDxlq2z62b/wYusbGt7e5GAOZ1ojg3XtN7sKQJJz/qRFR0Y2VeyB7uc1hP6VvRsMNxwEZSrlOtRUp3XSmlmDiUA5glxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UipkQDKfEzt06+v5VSr77jxhT3EUikB5/XZ7SGrj+EU=;
 b=SQFWeiICwcLTooP5blK/+kBNsz4JAcIz5JvzYzastET77VqyfeFZ2f97SRtrneeNlWfCLstNKQuTT2z/srfyVPU160zB47xrlJLjRM47RYFubqSGBwCRcbi9jr4CYwlNBtbOL87cKv/E1k0CfucRJ/NF2Bm8nmqVHe71dl53vz4=
Received: from CH2PR03MB5192.namprd03.prod.outlook.com (20.180.12.152) by
 CH2PR03MB5237.namprd03.prod.outlook.com (20.180.15.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Mon, 25 Nov 2019 15:06:47 +0000
Received: from CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::38e7:c7c5:75cc:682c]) by CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::38e7:c7c5:75cc:682c%5]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 15:06:47 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "Bogdan, Dragos" <Dragos.Bogdan@analog.com>
Subject: Re: [PATCH v2] media: adv7604: extend deep color mode to ADV7611
Thread-Topic: [PATCH v2] media: adv7604: extend deep color mode to ADV7611
Thread-Index: AQHVhadUGF5sVrtyQkGjbJFTf/w2daecOOmA
Date:   Mon, 25 Nov 2019 15:06:47 +0000
Message-ID: <6a524aedf79ba40f3286bf0ad4c7b320b561caf1.camel@analog.com>
References: <20191018112157.31657-1-alexandru.ardelean@analog.com>
         <20191018112955.13652-1-alexandru.ardelean@analog.com>
In-Reply-To: <20191018112955.13652-1-alexandru.ardelean@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0b675cb1-64c5-4af2-233f-08d771b9176e
x-ms-traffictypediagnostic: CH2PR03MB5237:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR03MB5237E8AFDFF1872587C36563F94A0@CH2PR03MB5237.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(136003)(396003)(376002)(366004)(54534003)(199004)(189003)(6436002)(76116006)(66476007)(64756008)(6486002)(54906003)(110136005)(316002)(6116002)(7736002)(71190400001)(71200400001)(14444005)(256004)(2906002)(229853002)(66556008)(66446008)(99286004)(36756003)(66066001)(66946007)(4001150100001)(118296001)(11346002)(305945005)(102836004)(14454004)(8936002)(186003)(76176011)(81156014)(6506007)(2616005)(6512007)(8676002)(81166006)(86362001)(2501003)(4326008)(3846002)(6246003)(5660300002)(107886003)(478600001)(446003)(25786009)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR03MB5237;H:CH2PR03MB5192.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zsi+BLs1HYxPk+hGwOWv6A+NlwnDxlAEe7WQGGLheImmZYPiT5N0pD4L+e505pB6YwWLYQ1/oeOmttdyg2zSqfHrJcIvvK/Xvi9r2eUvXb5MmIaRA+NZVou6iATGVQLFYzR3KiGzdDC91KWKpbbBJp8BlVpYTk7+dlaqmjTEahwf/X5w60TTKBkN6+8Jb403UrdlX18/3pVubpHaiv2pM0EVKdEFSJ+sJsh55LQJw4qJJ8fK6AX2NflsmrzSryB3rWVki4TgZn18bdBOtiOhCfrtQUmN3GIrYaiOPU+8KIm5vn5nM9zCWWp1w1znieWidwzmSHF4ErhSMEGAfOVsq7N+Q68KJ6kgSIEl2xgCxXnlE69zfB0plvijv97qe4TbEerZR5xc8tG++59j6WwattDIrumjEkTZ1YvgdljFv7t3Ssm80povYQAovw9M7Ff3
Content-Type: text/plain; charset="utf-8"
Content-ID: <341313250CC9244BA25ADD055F0C7836@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b675cb1-64c5-4af2-233f-08d771b9176e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 15:06:47.0972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QvBHE2WzqN+1qSZb9+F+/VdAQQj4ELZzoYWzmkY2zrwUrD4JKJNJDhQuLjvkqpiqa+pL4HAD72D/TV+37BN9ezd7PJdyjU26ZM43msG+CFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5237
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_03:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1011 priorityscore=1501 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911250136
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDE5LTEwLTE4IGF0IDE0OjI5ICswMzAwLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3Jv
dGU6DQo+IEZyb206IERyYWdvcyBCb2dkYW4gPGRyYWdvcy5ib2dkYW5AYW5hbG9nLmNvbT4NCj4g
DQo+IFRoZSBBRDc2MTEgY2hpcCBzdXBwb3J0cyB0aGUgc2FtZSBEZWVwIENvbG9yIE1vZGUgc2V0
dGluZ3MgYXMgdGhlIEFENzYwNC4NCj4gVGhpcyBjaGFuZ2UgZXh0ZW5kcyBzdXBwb3J0IGZvciB0
aGlzIGZlYXR1cmUgdG8gdGhlIEFENzYxMSBieSBhZGRpbmcgYQ0KPiB3cmFwcGVyIGZ1bmN0aW9u
IGZvciB0aGUgYHJlYWRfaGRtaV9waXhlbGNsb2NrYCBob29rIGFuZCBhZGRpbmcgdGhlIHNhbWUN
Cj4gZnJlcXVlbmN5IGFkanVzdG1lbnQgbG9naWMuDQo+IA0KDQpwaW5nIGhlcmUNCg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBEcmFnb3MgQm9nZGFuIDxkcmFnb3MuYm9nZGFuQGFuYWxvZy5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWxleGFuZHJ1LmFyZGVsZWFuQGFuYWxv
Zy5jb20+DQo+IC0tLQ0KPiANCj4gQ2hhbmdlbG9nIHYxIC0+IHYyOg0KPiAqIGFkZHJlc3MgY2hl
Y2twYXRjaCBjb21wbGFpbnRzIGFib3V0IDgwIGNvbCBsaW1pdCBhbmQNCj4gICB1c2Ugb2YgYHVu
c2lnbmVkYCB2cyBgdW5zaWduZWQgaW50YA0KPiANCj4gIGRyaXZlcnMvbWVkaWEvaTJjL2Fkdjc2
MDQuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZWRpYS9pMmMvYWR2NzYwNC5jIGIvZHJpdmVycy9tZWRpYS9pMmMvYWR2NzYw
NC5jDQo+IGluZGV4IDI4YTg0YmY5ZjhhOS4uYzZmZTNhYTY5NzMzIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL21lZGlhL2kyYy9hZHY3NjA0LmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvYWR2
NzYwNC5jDQo+IEBAIC0xNTAzLDIzICsxNTAzLDE0IEBAIHN0YXRpYyB2b2lkDQo+IGFkdjc2eHhf
ZmlsbF9vcHRpb25hbF9kdl90aW1pbmdzX2ZpZWxkcyhzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLA0K
PiAgDQo+ICBzdGF0aWMgdW5zaWduZWQgaW50IGFkdjc2MDRfcmVhZF9oZG1pX3BpeGVsY2xvY2so
c3RydWN0IHY0bDJfc3ViZGV2ICpzZCkNCj4gIHsNCj4gLQl1bnNpZ25lZCBpbnQgZnJlcTsNCj4g
IAlpbnQgYSwgYjsNCj4gIA0KPiAgCWEgPSBoZG1pX3JlYWQoc2QsIDB4MDYpOw0KPiAgCWIgPSBo
ZG1pX3JlYWQoc2QsIDB4M2IpOw0KPiAgCWlmIChhIDwgMCB8fCBiIDwgMCkNCj4gIAkJcmV0dXJu
IDA7DQo+IC0JZnJlcSA9ICBhICogMTAwMDAwMCArICgoYiAmIDB4MzApID4+IDQpICogMjUwMDAw
Ow0KPiAgDQo+IC0JaWYgKGlzX2hkbWkoc2QpKSB7DQo+IC0JCS8qIGFkanVzdCBmb3IgZGVlcCBj
b2xvciBtb2RlICovDQo+IC0JCXVuc2lnbmVkIGJpdHNfcGVyX2NoYW5uZWwgPSAoKGhkbWlfcmVh
ZChzZCwgMHgwYikgJiAweDYwKQ0KPiA+PiA0KSArIDg7DQo+IC0NCj4gLQkJZnJlcSA9IGZyZXEg
KiA4IC8gYml0c19wZXJfY2hhbm5lbDsNCj4gLQl9DQo+IC0NCj4gLQlyZXR1cm4gZnJlcTsNCj4g
KwlyZXR1cm4gYSAqIDEwMDAwMDAgKyAoKGIgJiAweDMwKSA+PiA0KSAqIDI1MDAwMDsNCj4gIH0N
Cj4gIA0KPiAgc3RhdGljIHVuc2lnbmVkIGludCBhZHY3NjExX3JlYWRfaGRtaV9waXhlbGNsb2Nr
KHN0cnVjdCB2NGwyX3N1YmRldiAqc2QpDQo+IEBAIC0xNTMwLDkgKzE1MjEsMjggQEAgc3RhdGlj
IHVuc2lnbmVkIGludA0KPiBhZHY3NjExX3JlYWRfaGRtaV9waXhlbGNsb2NrKHN0cnVjdCB2NGwy
X3N1YmRldiAqc2QpDQo+ICAJYiA9IGhkbWlfcmVhZChzZCwgMHg1Mik7DQo+ICAJaWYgKGEgPCAw
IHx8IGIgPCAwKQ0KPiAgCQlyZXR1cm4gMDsNCj4gKw0KPiAgCXJldHVybiAoKGEgPDwgMSkgfCAo
YiA+PiA3KSkgKiAxMDAwMDAwICsgKGIgJiAweDdmKSAqIDEwMDAwMDAgLw0KPiAxMjg7DQo+ICB9
DQo+ICANCj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgYWR2NzZ4eF9yZWFkX2hkbWlfcGl4ZWxjbG9j
ayhzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkKQ0KPiArew0KPiArCXN0cnVjdCBhZHY3Nnh4X3N0YXRl
ICpzdGF0ZSA9IHRvX3N0YXRlKHNkKTsNCj4gKwljb25zdCBzdHJ1Y3QgYWR2NzZ4eF9jaGlwX2lu
Zm8gKmluZm8gPSBzdGF0ZS0+aW5mbzsNCj4gKwl1bnNpZ25lZCBpbnQgZnJlcSwgYml0c19wZXJf
Y2hhbm5lbCwgcGl4ZWxyZXBldGl0aW9uOw0KPiArDQo+ICsJZnJlcSA9IGluZm8tPnJlYWRfaGRt
aV9waXhlbGNsb2NrKHNkKTsNCj4gKwlpZiAoaXNfaGRtaShzZCkpIHsNCj4gKwkJLyogYWRqdXN0
IGZvciBkZWVwIGNvbG9yIG1vZGUgYW5kIHBpeGVsIHJlcGV0aXRpb24gKi8NCj4gKwkJYml0c19w
ZXJfY2hhbm5lbCA9ICgoaGRtaV9yZWFkKHNkLCAweDBiKSAmIDB4NjApID4+IDQpICsgODsNCj4g
KwkJcGl4ZWxyZXBldGl0aW9uID0gKGhkbWlfcmVhZChzZCwgMHgwNSkgJiAweDBmKSArIDE7DQo+
ICsNCj4gKwkJZnJlcSA9IGZyZXEgKiA4IC8gYml0c19wZXJfY2hhbm5lbCAvIHBpeGVscmVwZXRp
dGlvbjsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gZnJlcTsNCj4gK30NCj4gKw0KPiAgc3RhdGlj
IGludCBhZHY3Nnh4X3F1ZXJ5X2R2X3RpbWluZ3Moc3RydWN0IHY0bDJfc3ViZGV2ICpzZCwNCj4g
IAkJCXN0cnVjdCB2NGwyX2R2X3RpbWluZ3MgKnRpbWluZ3MpDQo+ICB7DQo+IEBAIC0xNTc5LDcg
KzE1ODksNyBAQCBzdGF0aWMgaW50IGFkdjc2eHhfcXVlcnlfZHZfdGltaW5ncyhzdHJ1Y3QNCj4g
djRsMl9zdWJkZXYgKnNkLA0KPiAgDQo+ICAJCWJ0LT53aWR0aCA9IHc7DQo+ICAJCWJ0LT5oZWln
aHQgPSBoOw0KPiAtCQlidC0+cGl4ZWxjbG9jayA9IGluZm8tPnJlYWRfaGRtaV9waXhlbGNsb2Nr
KHNkKTsNCj4gKwkJYnQtPnBpeGVsY2xvY2sgPSBhZHY3Nnh4X3JlYWRfaGRtaV9waXhlbGNsb2Nr
KHNkKTsNCj4gIAkJYnQtPmhmcm9udHBvcmNoID0gaGRtaV9yZWFkMTYoc2QsIDB4MjAsIGluZm8t
DQo+ID5oZnJvbnRwb3JjaF9tYXNrKTsNCj4gIAkJYnQtPmhzeW5jID0gaGRtaV9yZWFkMTYoc2Qs
IDB4MjIsIGluZm8tPmhzeW5jX21hc2spOw0KPiAgCQlidC0+aGJhY2twb3JjaCA9IGhkbWlfcmVh
ZDE2KHNkLCAweDI0LCBpbmZvLQ0KPiA+aGJhY2twb3JjaF9tYXNrKTsNCg==
