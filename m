Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 488D2AD598
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 11:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389778AbfIIJYb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 05:24:31 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:11022 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726121AbfIIJYb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 05:24:31 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x899LQLH020921;
        Mon, 9 Sep 2019 02:24:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=proofpoint;
 bh=0P4ORJAGLqx5xzmfbvkuvdKi+S1+WuFgo0ahCrUCd2A=;
 b=SJLncAca4isnehy8sgzYxOsCLdBUoxy326F9X5D9F6HOzcXhwc7IDm+KTLIDI3q3OxD0
 PtOrf+KWW39TbO+pkYuWlCiYiDRmHzMnWhmxbyHEIBxLh/Jkn0jOuqCqMWb8WP/4G/Cz
 sf95uWtKClDe23GQBK1MYJwXPs+M47ODn45Ev2QGDga+m0PoomHJNNLR8hsiaaBP1MAs
 vbtDFppunVuW8mpWteO2D2SkG+IITeRnp4haPizqwjGWNkvFPL7/14jonxT4BAdIwv6R
 ZSaPy87Y1IGhjaRsrfOv2KJMIyxIKOMfbs5di9ZGC5SuV66MXLK+26mMz/5R63mOQJLB Lg== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2056.outbound.protection.outlook.com [104.47.37.56])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2uv93y6kw6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Sep 2019 02:24:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtQF6EGmLx/5OxVdwHSSn0jN3980LbFfU7sBR1G4OiSJMKC2P92TcQd4rh6eSLlDiwd93fl5qbTCpkMMxXPARHLX33LwMEQ8TbtOBZZYoJVgOxnwqsOhBsLFjL7k4qLHS9hXJRjn1Yqdxuc2rNRGWerr8kqFnUfnfOFILSwxZG8Gv3fimRcnTZe9SaMoe9uVqUByhts6iksoTntq+lWMQs2wka1uWmatVsujFq2p90bzFxDEqwornoMzU1yTaO39l8+dM920yZYcXAQwHsgCNECHIhw4RBv3I1/7i5mNXFhi9hjzMRmJesyAp0T3TGUUx3o2xgFQjDxOsrDf0FhpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0P4ORJAGLqx5xzmfbvkuvdKi+S1+WuFgo0ahCrUCd2A=;
 b=oVXJmOjv27MMZLNGtSBq3+Bmb5i0hq0BXxuHt3l/hqQ/XZ7nRXugSLKjGug4k7v9NtmI1fl1V2WUbVqeSSpEswY7j3Kjya06AszRspTlhS9aFqs3kn6h46xXKPj3OCmhiazRlMXtjLQgOx2uZkTLi8VhXaXPtOkZ7Ie/55YT2zGYMOlvrFlf02ulv3sCHLQZ3mHJuNLnCALH5V+mDqCeRUnEA/iECcXcclGlroPzZnghwY5VUDEOBEtCtU4t4yoUeHVsw+rWlwTvHFvdofVHA509kdM86hiLBbd2P5/Z3TpirUJNqqziT9k9kbUOY1xF9rgNrI1wruPy3Khe0pqqUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0P4ORJAGLqx5xzmfbvkuvdKi+S1+WuFgo0ahCrUCd2A=;
 b=FaLqsjqD9BWqkaw1ExqrModG0aOnbU+vwj9Gn+1CU86/dfRiFTvXlmML4RBt028O7X14O7eQjWoSgDnfi9w9G8jrmuLXn9KM3NqYqyUxSwoc14R1WgsaZtIaqvsEE2/toEpib6XXpTYrirz3ZW3mUd3qPCW0L+bqOjmbhyypp44=
Received: from CY1PR07MB2521.namprd07.prod.outlook.com (10.167.16.12) by
 CY1PR07MB2713.namprd07.prod.outlook.com (10.167.9.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Mon, 9 Sep 2019 09:24:16 +0000
Received: from CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::1927:7325:2156:bd59]) by CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::1927:7325:2156:bd59%10]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 09:24:15 +0000
From:   Jan Kotas <jank@cadence.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Jan Kotas <jank@cadence.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Rafal Ciepiela <rafalc@cadence.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] media: Add support for Cadence CSI2RX 2.1
Thread-Topic: [PATCH v2 3/3] media: Add support for Cadence CSI2RX 2.1
Thread-Index: AQHVY9iTrR0e8VlLlECKXVF7DJNOK6ceStaAgATOK4A=
Date:   Mon, 9 Sep 2019 09:24:15 +0000
Message-ID: <A67221D2-8F92-4168-83D0-6B1325CA4417@global.cadence.com>
References: <20190905105601.27034-1-jank@cadence.com>
 <20190905105601.27034-4-jank@cadence.com>
 <20190906080119.GF1586@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190906080119.GF1586@valkosipuli.retiisi.org.uk>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7650694c-321c-4e3d-82ff-08d735077c18
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:CY1PR07MB2713;
x-ms-traffictypediagnostic: CY1PR07MB2713:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR07MB27134B359CFEC83D0E9EC583D0B70@CY1PR07MB2713.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(36092001)(51914003)(189003)(199004)(8676002)(81156014)(81166006)(476003)(8936002)(26005)(66476007)(66556008)(64756008)(66446008)(33656002)(99286004)(6512007)(102836004)(86362001)(6246003)(3846002)(53936002)(6116002)(76116006)(71190400001)(54906003)(11346002)(66946007)(446003)(91956017)(71200400001)(7736002)(316002)(305945005)(14454004)(5660300002)(486006)(186003)(6916009)(229853002)(6486002)(478600001)(14444005)(53546011)(2906002)(4326008)(6436002)(66066001)(6506007)(256004)(76176011)(25786009);DIR:OUT;SFP:1101;SCL:1;SRVR:CY1PR07MB2713;H:CY1PR07MB2521.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YSEQuaP+06Dn/KHn4mTxPbRPEUjJyUZFaeyX/KEaxBpFoMMk5/maaKt1WY0c+Ut/E5oRN1vUSgirzk0WctkoCrxztNPAQTtIugAFX7m4DBM6bdbLsNF0pHGjaVYeo50P7PXVKFxfXqvgQRDIs9i3IUcuIZ5BN4yq7bDAI2yvHGerjMq/De1VFvD+Gx9uDsVMQtfUAlw50UmVuKFsSadaJteLLiljvs3t7eUnv5U2M/vG46PjKwperPjmH7XZgiOzRG7GVfiAXWQePBx15nkfBE+lFq+H01P+MJwuXYioutL2GEm77K1Iag0f8dFvFmH7BlFHZIv0ShTOqmZ+H26Ah00+ppPWo5sqmM744Fz69fsaO6/PonX8PbEbFNGmOjUNhnOui9Rba1BkXz7vVlhDUTS+6H24sEFzUtekiNL9rR0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDDB38729AB88942B13EA992868E3718@namprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7650694c-321c-4e3d-82ff-08d735077c18
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 09:24:15.8469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vTox0i9/+Zmj5nOIOO94oqeMhVGZAOO5xCEkhDjfGmtbz+2QkkfBgoprLQHmnnFEQband55JPfjlqWydxUEwXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2713
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-09_04:2019-09-08,2019-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909090098
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8gU2FrYXJpLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gT24gNiBTZXAgMjAx
OSwgYXQgMTA6MDEsIFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGlraS5maT4gd3JvdGU6DQo+
IA0KPiBIaSBKYW4sDQo+IA0KPiBPbiBUaHUsIFNlcCAwNSwgMjAxOSBhdCAxMTo1NjowMUFNICsw
MTAwLCBKYW4gS290YXMgd3JvdGU6DQo+PiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgQ1NJ
MlJYIHYyLjEgdmVyc2lvbiBvZiB0aGUgY29udHJvbGxlci4NCj4+IA0KPj4gU2lnbmVkLW9mZi1i
eTogSmFuIEtvdGFzIDxqYW5rQGNhZGVuY2UuY29tPg0KPj4gLS0tDQo+PiBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL2NhZGVuY2UvY2Rucy1jc2kycnguYyB8IDEzOSArKysrKysrKysrKysrKysrKysr
KysrLS0tLS0NCj4+IDEgZmlsZSBjaGFuZ2VkLCAxMTYgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRp
b25zKC0pDQo+PiANCj4+IHN0cnVjdCBjc2kycnhfcHJpdiB7DQo+PiAJc3RydWN0IGRldmljZQkJ
CSpkZXY7DQo+PiAJdW5zaWduZWQgaW50CQkJY291bnQ7DQo+PiBAQCAtNjksNiArODEsNyBAQCBz
dHJ1Y3QgY3NpMnJ4X3ByaXYgew0KPj4gCXN0cnVjdCBjbGsJCQkqcF9jbGs7DQo+PiAJc3RydWN0
IGNsawkJCSpwaXhlbF9jbGtbQ1NJMlJYX1NUUkVBTVNfTUFYXTsNCj4+IAlzdHJ1Y3QgcGh5CQkJ
KmRwaHk7DQo+PiArCXN0cnVjdCBjc2kycnhfdm9wcwkJKnZvcHM7DQo+IA0KPiBjb25zdD8NCg0K
SeKAmWxsIGFkZCBpdCwgdGhhbmtzLg0KDQo+PiANCj4+IAl1OAkJCQlsYW5lc1tDU0kyUlhfTEFO
RVNfTUFYXTsNCj4+IAl1OAkJCQludW1fbGFuZXM7DQo+PiBAQCAtOTIsNiArMTA1LDMyIEBAIHN0
cnVjdCBjc2kycnhfcHJpdiAqdjRsMl9zdWJkZXZfdG9fY3NpMnJ4KHN0cnVjdCB2NGwyX3N1YmRl
diAqc3ViZGV2KQ0KPj4gCXJldHVybiBjb250YWluZXJfb2Yoc3ViZGV2LCBzdHJ1Y3QgY3NpMnJ4
X3ByaXYsIHN1YmRldik7DQo+PiB9DQo+PiANCj4+ICtzdGF0aWMgdm9pZCBjc2kycnhfZ2V0X2Rl
dl9jZmcoc3RydWN0IGNzaTJyeF9wcml2ICpjc2kycngpDQo+PiArew0KPj4gKwl1MzIgZGV2X2Nm
ZzsNCj4+ICsNCj4+ICsJY2xrX3ByZXBhcmVfZW5hYmxlKGNzaTJyeC0+cF9jbGspOw0KPj4gKwlk
ZXZfY2ZnID0gcmVhZGwoY3NpMnJ4LT5iYXNlICsgQ1NJMlJYX0RFVklDRV9DRkdfUkVHKTsNCj4+
ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGNzaTJyeC0+cF9jbGspOw0KPj4gKw0KPj4gKwljc2ky
cngtPm1heF9sYW5lcyA9IGRldl9jZmcgJiA3Ow0KPj4gKwljc2kycngtPm1heF9zdHJlYW1zID0g
KGRldl9jZmcgPj4gNCkgJiA3Ow0KPj4gKwljc2kycngtPmhhc19pbnRlcm5hbF9kcGh5ID0gZGV2
X2NmZyAmIEJJVCgzKSA/IHRydWUgOiBmYWxzZTsNCj4gDQo+IENvdWxkIHlvdSBzcGVsbCBvdXQg
dGhlc2UgYSBsaXR0bGUsIGJ5IGFkZGluZyAjZGVmaW5lcyBmb3IgdGhlIHJlZ2lzdGVyDQo+IGJp
dHM/IFNhbWUgYmVsb3cuDQoNCkkgdHJpZWQgdG8ga2VlcCBpbXBhY3Qgb24gdGhlIG9yaWdpbmFs
IGNvZGUgdG8gdGhlIG1pbmltdW0sIA0KYnV0IHlvdeKAmXJlIHJpZ2h0LiBJdOKAmXMgYSBnb29k
IG9wcG9ydHVuaXR5IGZvciBhIGNsZWFudXAuIA0KDQo+PiANCj4+IEBAIC00MzksNiArNTM1LDkg
QEAgc3RhdGljIGludCBjc2kycnhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4+IAljc2kycngtPmRldiA9ICZwZGV2LT5kZXY7DQo+PiAJbXV0ZXhfaW5pdCgmY3NpMnJ4LT5s
b2NrKTsNCj4+IA0KPj4gKwlvZl9pZCA9IG9mX21hdGNoX25vZGUoY3NpMnJ4X29mX3RhYmxlLCBw
ZGV2LT5kZXYub2Zfbm9kZSk7DQo+PiArCWNzaTJyeC0+dm9wcyA9IChzdHJ1Y3QgY3NpMnJ4X3Zv
cHMgKilvZl9pZC0+ZGF0YTsNCj4gDQo+IFRoZSBjYXN0IGlzbid0IG5lZWRlZCwgaXMgaXQ/DQoN
Ckl04oCZcyBub3QsIGJ1dCBkb2VzbuKAmXQgbWFrZSBpdCBtb3JlIHJlYWRhYmxlPw0KDQo+IC0t
IA0KPiBLaW5kIHJlZ2FyZHMsDQo+IA0KPiBTYWthcmkgQWlsdXMNCg0KUmVnYXJkcywNCkphbg0K
DQo=
