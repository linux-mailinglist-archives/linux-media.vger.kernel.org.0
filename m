Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAC1CAD477
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 10:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388775AbfIIINQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 04:13:16 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:2972 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388757AbfIIINQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 04:13:16 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8988Xg6001211;
        Mon, 9 Sep 2019 01:12:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=proofpoint;
 bh=RRQ7B8ahDdwXFeFsuzZF3FUz2scNEDG9yIbqbeiW6dM=;
 b=ClGuyuS6uTujS2HwWnRij68pzCA6D81m5+B1rAxZijMvdrh38HeOPSF2HuGrh3JDDBhn
 Vy+KGwzXPT8ASZat4wW7yolTeb4PBR/2uuhIE1YxIfvMN3ZylCtIJJPgILL/anJS6H7+
 MKHQNAFAna5i4PHJ2u6lNcDjXuiDg5+9FW9jUqXZY044iXvLzMmosx/uXfjJ8h90J6Bl
 gknL4CJ84J6QekTS1fUAP+m8VVlK0Q2si5CvmdLrXp0ZRmHTsqRvQP9VVJTOIZzgYyjA
 PVR9tm649hkLOxh7rEAgNwdMHuLNUIvfvbY/IRmg+SmwIwMoOJf7rTPUMcbSbhcShfIM pQ== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam02-bl2-obe.outbound.protection.outlook.com (mail-bl2nam02lp2056.outbound.protection.outlook.com [104.47.38.56])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2uv84xeq07-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Sep 2019 01:12:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4utwoitpYckYcxSJWXWFWt/Q3jxFFaJ8DXDE0qmzowkiJ6ALb8Ae588FZrYL4qPxS6GkfcUMi0W7YqNFAY8wsvtUXVI5I/yfBZcZb+Go74lYtFp/K8TQ1QKhdS2E99840beJVo+qNjFV06gyxGouq4zxp+avWlLO76eTCV0hKFP9dQudi8QuS41ORobTrbTilYbez6fND+nx0Ko00lMWEjeQW+WC8lVN4i+CFZ5D5L1yGL8vvCkx45SESsOIKSTskwe/QlvgqYFiaYrcygnXM8OH+2Bq71980LYrsEjZDJwL484ODAjKfrWx4Lybv79xSQSykBRzLX+AZV1GtxQ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRQ7B8ahDdwXFeFsuzZF3FUz2scNEDG9yIbqbeiW6dM=;
 b=Tir1EWkafCKzFgj8ysTB7PP3P3buSp3MH0KM1lLEVavwUjgs81j4Gp0S91utA0FXIirJcp9RE4rB8hpowXsbyQsk2cMNOs2WQRXsy8sK4RTIuGkyNvKLg6fLTjuJU32sxGiN9WoHUz+ps+jQP3hhzurmpn+1A6uXeEMirEQsWkD1LMTatrewmWxIrWzzEQz/T1/35YwIWAqEsr6N4acRlPlZnQGNjPBp+kSVsTTr+uEYdUHi33ADVdch3oo+cw3wQm/rO47sAYMt9afq6b3EJWRyL0sPq4nPmr7XGD1dTWB5eOikN1aqjQSMp4L+pFgPGcg83/ze8CW8lBQgtvooOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRQ7B8ahDdwXFeFsuzZF3FUz2scNEDG9yIbqbeiW6dM=;
 b=HyEm/gVUpylP9+WaY5aquJJcRd8V3koT05Ps7dKD9yqrUqeLOwdb4eMvRC3wVT3Yl++lIga8FIbsePms4nyAAKT4R+ndGlkU+plQK12TUzugnxVhas0yx4/LJ5ajuCZ5hTFE62a170hT0H40l5JFtNBiw34i02SNOJ/WOX61RuY=
Received: from CY1PR07MB2521.namprd07.prod.outlook.com (10.167.16.12) by
 CY1PR07MB2633.namprd07.prod.outlook.com (10.166.207.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 08:12:55 +0000
Received: from CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::1927:7325:2156:bd59]) by CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::1927:7325:2156:bd59%10]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 08:12:55 +0000
From:   Jan Kotas <jank@cadence.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Jan Kotas <jank@cadence.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rafal Ciepiela <rafalc@cadence.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] media: Add lane checks for Cadence CSI2RX
Thread-Topic: [PATCH v2 2/3] media: Add lane checks for Cadence CSI2RX
Thread-Index: AQHVY9iTRWpCeBlM0kmgbmtOhXyfuaceSNqAgASzZ4CAAALxgIAABd6A
Date:   Mon, 9 Sep 2019 08:12:54 +0000
Message-ID: <6F0DAE9B-BD7F-44D6-8D5B-92B3B3099CF2@global.cadence.com>
References: <20190905105601.27034-1-jank@cadence.com>
 <20190905105601.27034-3-jank@cadence.com>
 <20190906075413.GE1586@valkosipuli.retiisi.org.uk>
 <1D1666FD-CFC6-4DE1-8A2E-1809D1BDEAAB@global.cadence.com>
 <20190909075153.GA843@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190909075153.GA843@valkosipuli.retiisi.org.uk>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77bd7c44-6797-4b90-bfc2-08d734fd8482
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY1PR07MB2633;
x-ms-traffictypediagnostic: CY1PR07MB2633:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR07MB2633F31629873CC53FC515C1D0B70@CY1PR07MB2633.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(51914003)(36092001)(199004)(189003)(316002)(66476007)(3846002)(6116002)(66556008)(66946007)(5660300002)(64756008)(66446008)(476003)(486006)(2906002)(53936002)(446003)(11346002)(6512007)(6246003)(76176011)(99286004)(6486002)(6436002)(76116006)(91956017)(229853002)(66066001)(478600001)(86362001)(33656002)(6916009)(54906003)(8936002)(14454004)(81166006)(81156014)(8676002)(71200400001)(4326008)(25786009)(102836004)(6506007)(53546011)(71190400001)(256004)(305945005)(7736002)(186003)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:CY1PR07MB2633;H:CY1PR07MB2521.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 850pjiqzgish9JuKpzwLhN7IAX7+p601iI4fI37z4TftZjeBYdWCTQrFvA8osNtYDolSU3vRj3xhJH6RXrv3E9I1PARJ7GmBb3LhATGg+B5Gpq2lg0t0giU3wyrH9DsTz0ICjD0Bi2AOUc7aQyCevYyBv75anM6QOJRwdWl7FSzl6SAmBMqui0IZa5QUNweX/xQ9EW2UxA3lE+/fhME/uMa4jBanjQNAEGLKE5Ab+69qKZvjG3gzN3dk1g4kS6BXlnWrHR+pR+K+Yspg5In6cWb3d6+LrJmaJ40tTEhfe1ZDGVQRwlKnT2goFdhcj5AeR38vj9FWZGBqH9+61DSOhleWQv5HaZ/slgDuVT5H65ZfPxoF8vCxHx+DivHIQMh8MgtKfzGulVGsboi+zaE8kKPnpwQpQW3wD2NGsOFmPi8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFF097342181FD47A71D32FD1616FEFE@namprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bd7c44-6797-4b90-bfc2-08d734fd8482
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 08:12:54.9386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vM55Co55a+LLVqjhJoOZUsNOALeZDTEVMiy+Ceq5VJV9QTCAk8byXANZXq5jzhrAAsVLaK6DOObnLa9ErWRF5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2633
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-09_04:2019-09-08,2019-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=706 clxscore=1015
 impostorscore=0 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909090088
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCj4gT24gOSBTZXAgMjAxOSwgYXQgMDk6NTEsIFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVz
QGlraS5maT4gd3JvdGU6DQo+IA0KPiANCj4gT24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDc6NDE6
MjFBTSArMDAwMCwgSmFuIEtvdGFzIHdyb3RlOg0KPj4gDQo+PiANCj4+IEhlbGxvIFNha2FyaSwN
Cj4+IA0KPj4gVGhhbmtzIGZvciB5b3VyIHJlcGx5Lg0KPj4+IE9uIDYgU2VwIDIwMTksIGF0IDA5
OjU0LCBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0Bpa2kuZmk+IHdyb3RlOg0KPj4+IA0KPj4+
IEhpIEphbiwNCj4+PiANCj4+PiBUaGFua3MgZm9yIHRoZSBwYXRjaHNldC4NCj4+PiANCj4+PiBP
biBUaHUsIFNlcCAwNSwgMjAxOSBhdCAxMTo1NjowMEFNICswMTAwLCBKYW4gS290YXMgd3JvdGU6
DQo+Pj4+IC8qDQo+Pj4+ICogRHJpdmVyIGZvciBDYWRlbmNlIE1JUEktQ1NJMiBSWCBDb250cm9s
bGVyIHYxLjMNCj4+Pj4gKg0KPj4+PiAtICogQ29weXJpZ2h0IChDKSAyMDE3IENhZGVuY2UgRGVz
aWduIFN5c3RlbXMgSW5jLg0KPj4+PiArICogQ29weXJpZ2h0IChDKSAyMDE3LTIwMTkgQ2FkZW5j
ZSBEZXNpZ24gU3lzdGVtcyBJbmMuDQo+Pj4+ICovDQo+Pj4+IA0KPj4+PiArCWZvciAoaSA9IDA7
IGkgPCBjc2kycngtPm51bV9sYW5lczsgaSsrKSB7DQo+Pj4+ICsJCWlmIChjc2kycngtPmxhbmVz
W2ldIDwgMSkgew0KPj4+IA0KPj4+IERvIHlvdSBuZWVkIHRoaXM/IHY0bDJfZndub2RlX3BhcnNl
X2VuZHBvaW50KCkgYWxyZWFkeSBoYXMgYSBtb3JlIHRob3JvdWdoDQo+Pj4gY2hlY2sgZm9yIHRo
ZSBsYW5lIG51bWJlcnMuDQo+PiANCj4+IEkgbG9va2VkIGF0IHRoZSBzb3VyY2UgY29kZSBvZiB2
NGwyX2Z3bm9kZV9lbmRwb2ludF9wYXJzZV9jc2kyX2J1cw0KPj4gYW5kIHRoaXMgcGFydGljdWxh
ciBjYXNlIGRvZXNu4oCZdCBzZWVtIHRvIGJlIGNoZWNrZWQuDQo+IA0KPiBOb3Qgc3BlY2lmaWNh
bGx5LCBzaW5jZSAwIGlzIGEgdmFsaWQgbGFuZSBudW1iZXIuDQo+IA0KPiBIb3dldmVyLCB0aGUg
ZHJpdmVyIG9ubHkgYXBwZWFycyB0byBiZSB1c2luZyB0aGUgaW5mb3JtYXRpb24gb24gaG93IG1h
bnkNCj4gbGFuZXMgdGhlcmUgYXJlLiBJZiB0aGUgaGFyZHdhcmUgZG9lc24ndCBzdXBwb3J0IGxh
bmUgcm91dGluZywgdGhlbiB0aGlzIGlzDQo+IGFsbCB5b3UgbmVlZC4gT3RoZXJ3aXNlIGFkZGl0
aW9uYWwgY2hlY2tzIHNob3VsZCBiZSBhZGRlZCBpbiBjYXNlIHRoZXJlIGFyZQ0KPiBsaW1pdGF0
aW9ucyBob3cgdGhlIGxhbmVzIGNhbiBiZSByb3V0ZWQuDQoNClRoZSBDU0kyUlggdjEuMyBkb2Vz
IHN1cHBvcnQgdGhhdCAoQ1NJMlJYX1NUQVRJQ19DRkdfUkVHKQ0KYW5kIGFzc3VtZXMgdGhlIGZp
cnN0IGRhdGEgbGFuZSBoYXMgbnVtYmVyIDEuDQoNClJlZ3JhZHMsDQpKYW4NCg0KPiAtLSANCj4g
U2FrYXJpIEFpbHVzDQoNCg==
