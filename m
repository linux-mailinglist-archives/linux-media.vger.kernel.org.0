Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09B7610992C
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 07:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfKZG2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 01:28:49 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:15322 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725802AbfKZG2t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 01:28:49 -0500
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAQ6SV5p007120;
        Tue, 26 Nov 2019 01:28:47 -0500
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2052.outbound.protection.outlook.com [104.47.36.52])
        by mx0a-00128a01.pphosted.com with ESMTP id 2wf2j4pmd7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Nov 2019 01:28:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GF9TD3IsErnrS7b1LYPHWeucHLeLQ68CzuY5OjZ6AsN4QKnSCeX8RdpJJuGZmWvSFzvUeRCTVFHxjO8QgfDS5xB7+9CCKyGPChQ8ryNN0K/qXp3CeibS9tLhFvJ8ktVCIvmgzrtyvfXbMyeF0fA51g02k53xtHstMUPmGZYH29pwzKzlsiwj8mFQvym+Kad3ldAdxEbE01dFrAwAK+ECvzVVTP42mPjeOX2G4bXePblOBjR8DrkPydAz90Pt4tNRRYeylD6rMDRIzjxnMZXfitbAmUPbT6k9n1i7dVjhqV0/R0Xd+tCl83SjZo95bfUKs/DPes47TGZ/Pnzg2qvb4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk0oB67sLa2YgsUpxyCSEbqxQ9UfiqxmAXvC6aK5cAM=;
 b=Hfas8IOf2axwpgyWauKNZpSoTdtMA0jtcuDezeu10UQCPX0ej53lXsbKxQoIRmF09GLLCzcdvI8Kpv4Fg4wRZ4mf+1cLrmAB7RRVVgrJzrqd3MjCFMw1YTrK8/K1V4EI3NHpbgNwaYpP9pvHHeOVuA2jmt//0knFopOLairiU1Z74fZ8WzVAOpygMCo8hRBK/N3xr5lJSFow4TeuXtI+JfeEjDDpFnqWDFTTQtwQv+gHmPCH3DjmA1D7Y8OenE4LKHqOKtkl18YJoFeX18l+/biTDN/MLvhpSOw82lgaBs8SPTTcNqNxzAZKwEgYqv220/408PXRc7YrfxKoPGIHBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk0oB67sLa2YgsUpxyCSEbqxQ9UfiqxmAXvC6aK5cAM=;
 b=l/n+wEAMUFRrq3SyaTY/5x6kVv97rO2aOmExNkxH8bnOb7PjSfXHnflQl7wFH/RWBewI8Z7UbpVsikUo26hkIUlDtDTCnuoxQy2UMVuHRo+c8oQPrTVEo43drturuVzS0mwCLPsieV25yU6rfBHCxKO+yXVPaSy2+Uo8odSdhjY=
Received: from CH2PR03MB5192.namprd03.prod.outlook.com (20.180.12.152) by
 CH2PR03MB5333.namprd03.prod.outlook.com (20.180.5.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Tue, 26 Nov 2019 06:28:44 +0000
Received: from CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::38e7:c7c5:75cc:682c]) by CH2PR03MB5192.namprd03.prod.outlook.com
 ([fe80::38e7:c7c5:75cc:682c%5]) with mapi id 15.20.2495.014; Tue, 26 Nov 2019
 06:28:44 +0000
From:   "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "Bogdan, Dragos" <Dragos.Bogdan@analog.com>
Subject: Re: [PATCH v2] media: adv7604: extend deep color mode to ADV7611
Thread-Topic: [PATCH v2] media: adv7604: extend deep color mode to ADV7611
Thread-Index: AQHVhadUGF5sVrtyQkGjbJFTf/w2daecOOmAgAAP+4CAAPGdgA==
Date:   Tue, 26 Nov 2019 06:28:44 +0000
Message-ID: <705cd4a40c2e7a1d3d613a9fef093d4fd4792775.camel@analog.com>
References: <20191018112157.31657-1-alexandru.ardelean@analog.com>
         <20191018112955.13652-1-alexandru.ardelean@analog.com>
         <6a524aedf79ba40f3286bf0ad4c7b320b561caf1.camel@analog.com>
         <5278491a-5d48-b171-2194-fe4806397424@xs4all.nl>
In-Reply-To: <5278491a-5d48-b171-2194-fe4806397424@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 32e24995-84e8-4bc0-9d99-08d77239e32c
x-ms-traffictypediagnostic: CH2PR03MB5333:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR03MB5333804A034A725B3325C9B4F9450@CH2PR03MB5333.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(136003)(376002)(366004)(396003)(54534003)(189003)(199004)(54906003)(86362001)(2201001)(6512007)(6486002)(6246003)(186003)(14454004)(2906002)(66066001)(118296001)(478600001)(25786009)(229853002)(91956017)(66946007)(66476007)(4326008)(66556008)(64756008)(66446008)(110136005)(76116006)(2501003)(5660300002)(107886003)(76176011)(316002)(305945005)(36756003)(71190400001)(71200400001)(2616005)(6436002)(446003)(11346002)(4001150100001)(99286004)(14444005)(3846002)(102836004)(6116002)(7736002)(8936002)(81156014)(26005)(53546011)(6506007)(256004)(8676002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR03MB5333;H:CH2PR03MB5192.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BPb/uCWXYlzDSysl2kR36TcVfHIJ05hGV135HQHkNT5T8omZx1XrfKyEOgKK4XRi9a5QsSBu7n4pgWqOQcTbTwHQvxnKzZXQvA37+6iFQTbgo6lvq/MY18VjckLi1+O65ORC9MdsOQOPyK3dXPkZD6BLQfNkFqCvc4BH7oh+zVxAEyOFy5SmjkKacQbPfYCLROm4Kwe0kR8N1nlFO8EAO6laCdaONZZfufzxlIo+On9t4Vrl99E65dEt4Or6EDKTnDqr9sJcWuIvlt9QAxG8TgbpBrKPgOkE75D0Pw8EJZB4sshVoA3Y+k8U7lOqOGS/GOQ/K8viSNA74CLH3AIJMsNsEJpOyL2wvHlwpUaRmDFt5oAMNZLm65ZEpMAO55UHahH4UR/Er/2HBLa6/+l8ZvLjpPiHK3UjYsi/hepOwuAigFPbtBhulJsExHXDfZTR
Content-Type: text/plain; charset="utf-8"
Content-ID: <91E38D13C4B23E4E9E5988085616FD79@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e24995-84e8-4bc0-9d99-08d77239e32c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 06:28:44.5492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oq0VziyVlP1QXjJC8+DYW3JQ3GxrghFHBzMkExDYhk8eyvCa0P3lbuWhCNxM5cV6E61UTNO1GfSNgy+gVj9+s28FH9r/caKsymh7rp0Fujw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5333
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_01:2019-11-21,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911260056
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDE5LTExLTI1IGF0IDE3OjA1ICswMTAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQo+
IE9uIDExLzI1LzE5IDQ6MDYgUE0sIEFyZGVsZWFuLCBBbGV4YW5kcnUgd3JvdGU6DQo+ID4gT24g
RnJpLCAyMDE5LTEwLTE4IGF0IDE0OjI5ICswMzAwLCBBbGV4YW5kcnUgQXJkZWxlYW4gd3JvdGU6
DQo+ID4gPiBGcm9tOiBEcmFnb3MgQm9nZGFuIDxkcmFnb3MuYm9nZGFuQGFuYWxvZy5jb20+DQo+
ID4gPiANCj4gPiA+IFRoZSBBRDc2MTEgY2hpcCBzdXBwb3J0cyB0aGUgc2FtZSBEZWVwIENvbG9y
IE1vZGUgc2V0dGluZ3MgYXMgdGhlDQo+ID4gPiBBRDc2MDQuDQo+ID4gPiBUaGlzIGNoYW5nZSBl
eHRlbmRzIHN1cHBvcnQgZm9yIHRoaXMgZmVhdHVyZSB0byB0aGUgQUQ3NjExIGJ5IGFkZGluZw0K
PiA+ID4gYQ0KPiA+ID4gd3JhcHBlciBmdW5jdGlvbiBmb3IgdGhlIGByZWFkX2hkbWlfcGl4ZWxj
bG9ja2AgaG9vayBhbmQgYWRkaW5nIHRoZQ0KPiA+ID4gc2FtZQ0KPiA+ID4gZnJlcXVlbmN5IGFk
anVzdG1lbnQgbG9naWMuDQo+ID4gPiANCj4gPiANCj4gPiBwaW5nIGhlcmUNCj4gDQo+IE5vdCBm
b3Jnb3R0ZW4sIGl0J3Mgb24gbXkgVE9ETyBsaXN0LiBCdXQgSSBuZWVkIHNvbWUgdGltZSB0byBk
aWcgYSBiaXQNCj4gZGVlcGVyIGludG8gdGhpcyBjb2RlLg0KDQpBY2suDQoNClRoYW5rcyBmb3Ig
cmVwbHlpbmcuDQoNCkFsZXgNCg0KPiANCj4gUmVnYXJkcywNCj4gDQo+IAlIYW5zDQo+IA0KPiA+
ID4gU2lnbmVkLW9mZi1ieTogRHJhZ29zIEJvZ2RhbiA8ZHJhZ29zLmJvZ2RhbkBhbmFsb2cuY29t
Pg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEFyZGVsZWFuIDxhbGV4YW5kcnUuYXJk
ZWxlYW5AYW5hbG9nLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gDQo+ID4gPiBDaGFuZ2Vsb2cgdjEg
LT4gdjI6DQo+ID4gPiAqIGFkZHJlc3MgY2hlY2twYXRjaCBjb21wbGFpbnRzIGFib3V0IDgwIGNv
bCBsaW1pdCBhbmQNCj4gPiA+ICAgdXNlIG9mIGB1bnNpZ25lZGAgdnMgYHVuc2lnbmVkIGludGAN
Cj4gPiA+IA0KPiA+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL2Fkdjc2MDQuYyB8IDMyICsrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2Vy
dGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZWRpYS9pMmMvYWR2NzYwNC5jDQo+ID4gPiBiL2RyaXZlcnMvbWVkaWEvaTJjL2Fkdjc2
MDQuYw0KPiA+ID4gaW5kZXggMjhhODRiZjlmOGE5Li5jNmZlM2FhNjk3MzMgMTAwNjQ0DQo+ID4g
PiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9hZHY3NjA0LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvaTJjL2Fkdjc2MDQuYw0KPiA+ID4gQEAgLTE1MDMsMjMgKzE1MDMsMTQgQEAgc3RhdGlj
IHZvaWQNCj4gPiA+IGFkdjc2eHhfZmlsbF9vcHRpb25hbF9kdl90aW1pbmdzX2ZpZWxkcyhzdHJ1
Y3QgdjRsMl9zdWJkZXYgKnNkLA0KPiA+ID4gIA0KPiA+ID4gIHN0YXRpYyB1bnNpZ25lZCBpbnQg
YWR2NzYwNF9yZWFkX2hkbWlfcGl4ZWxjbG9jayhzdHJ1Y3QgdjRsMl9zdWJkZXYNCj4gPiA+ICpz
ZCkNCj4gPiA+ICB7DQo+ID4gPiAtCXVuc2lnbmVkIGludCBmcmVxOw0KPiA+ID4gIAlpbnQgYSwg
YjsNCj4gPiA+ICANCj4gPiA+ICAJYSA9IGhkbWlfcmVhZChzZCwgMHgwNik7DQo+ID4gPiAgCWIg
PSBoZG1pX3JlYWQoc2QsIDB4M2IpOw0KPiA+ID4gIAlpZiAoYSA8IDAgfHwgYiA8IDApDQo+ID4g
PiAgCQlyZXR1cm4gMDsNCj4gPiA+IC0JZnJlcSA9ICBhICogMTAwMDAwMCArICgoYiAmIDB4MzAp
ID4+IDQpICogMjUwMDAwOw0KPiA+ID4gIA0KPiA+ID4gLQlpZiAoaXNfaGRtaShzZCkpIHsNCj4g
PiA+IC0JCS8qIGFkanVzdCBmb3IgZGVlcCBjb2xvciBtb2RlICovDQo+ID4gPiAtCQl1bnNpZ25l
ZCBiaXRzX3Blcl9jaGFubmVsID0gKChoZG1pX3JlYWQoc2QsIDB4MGIpICYgMHg2MCkNCj4gPiA+
ID4gPiA0KSArIDg7DQo+ID4gPiAtDQo+ID4gPiAtCQlmcmVxID0gZnJlcSAqIDggLyBiaXRzX3Bl
cl9jaGFubmVsOw0KPiA+ID4gLQl9DQo+ID4gPiAtDQo+ID4gPiAtCXJldHVybiBmcmVxOw0KPiA+
ID4gKwlyZXR1cm4gYSAqIDEwMDAwMDAgKyAoKGIgJiAweDMwKSA+PiA0KSAqIDI1MDAwMDsNCj4g
PiA+ICB9DQo+ID4gPiAgDQo+ID4gPiAgc3RhdGljIHVuc2lnbmVkIGludCBhZHY3NjExX3JlYWRf
aGRtaV9waXhlbGNsb2NrKHN0cnVjdCB2NGwyX3N1YmRldg0KPiA+ID4gKnNkKQ0KPiA+ID4gQEAg
LTE1MzAsOSArMTUyMSwyOCBAQCBzdGF0aWMgdW5zaWduZWQgaW50DQo+ID4gPiBhZHY3NjExX3Jl
YWRfaGRtaV9waXhlbGNsb2NrKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QpDQo+ID4gPiAgCWIgPSBo
ZG1pX3JlYWQoc2QsIDB4NTIpOw0KPiA+ID4gIAlpZiAoYSA8IDAgfHwgYiA8IDApDQo+ID4gPiAg
CQlyZXR1cm4gMDsNCj4gPiA+ICsNCj4gPiA+ICAJcmV0dXJuICgoYSA8PCAxKSB8IChiID4+IDcp
KSAqIDEwMDAwMDAgKyAoYiAmIDB4N2YpICogMTAwMDAwMCAvDQo+ID4gPiAxMjg7DQo+ID4gPiAg
fQ0KPiA+ID4gIA0KPiA+ID4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgYWR2NzZ4eF9yZWFkX2hkbWlf
cGl4ZWxjbG9jayhzdHJ1Y3QgdjRsMl9zdWJkZXYNCj4gPiA+ICpzZCkNCj4gPiA+ICt7DQo+ID4g
PiArCXN0cnVjdCBhZHY3Nnh4X3N0YXRlICpzdGF0ZSA9IHRvX3N0YXRlKHNkKTsNCj4gPiA+ICsJ
Y29uc3Qgc3RydWN0IGFkdjc2eHhfY2hpcF9pbmZvICppbmZvID0gc3RhdGUtPmluZm87DQo+ID4g
PiArCXVuc2lnbmVkIGludCBmcmVxLCBiaXRzX3Blcl9jaGFubmVsLCBwaXhlbHJlcGV0aXRpb247
DQo+ID4gPiArDQo+ID4gPiArCWZyZXEgPSBpbmZvLT5yZWFkX2hkbWlfcGl4ZWxjbG9jayhzZCk7
DQo+ID4gPiArCWlmIChpc19oZG1pKHNkKSkgew0KPiA+ID4gKwkJLyogYWRqdXN0IGZvciBkZWVw
IGNvbG9yIG1vZGUgYW5kIHBpeGVsIHJlcGV0aXRpb24gKi8NCj4gPiA+ICsJCWJpdHNfcGVyX2No
YW5uZWwgPSAoKGhkbWlfcmVhZChzZCwgMHgwYikgJiAweDYwKSA+PiA0KSArIDg7DQo+ID4gPiAr
CQlwaXhlbHJlcGV0aXRpb24gPSAoaGRtaV9yZWFkKHNkLCAweDA1KSAmIDB4MGYpICsgMTsNCj4g
PiA+ICsNCj4gPiA+ICsJCWZyZXEgPSBmcmVxICogOCAvIGJpdHNfcGVyX2NoYW5uZWwgLyBwaXhl
bHJlcGV0aXRpb247DQo+ID4gPiArCX0NCj4gPiA+ICsNCj4gPiA+ICsJcmV0dXJuIGZyZXE7DQo+
ID4gPiArfQ0KPiA+ID4gKw0KPiA+ID4gIHN0YXRpYyBpbnQgYWR2NzZ4eF9xdWVyeV9kdl90aW1p
bmdzKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsDQo+ID4gPiAgCQkJc3RydWN0IHY0bDJfZHZfdGlt
aW5ncyAqdGltaW5ncykNCj4gPiA+ICB7DQo+ID4gPiBAQCAtMTU3OSw3ICsxNTg5LDcgQEAgc3Rh
dGljIGludCBhZHY3Nnh4X3F1ZXJ5X2R2X3RpbWluZ3Moc3RydWN0DQo+ID4gPiB2NGwyX3N1YmRl
diAqc2QsDQo+ID4gPiAgDQo+ID4gPiAgCQlidC0+d2lkdGggPSB3Ow0KPiA+ID4gIAkJYnQtPmhl
aWdodCA9IGg7DQo+ID4gPiAtCQlidC0+cGl4ZWxjbG9jayA9IGluZm8tPnJlYWRfaGRtaV9waXhl
bGNsb2NrKHNkKTsNCj4gPiA+ICsJCWJ0LT5waXhlbGNsb2NrID0gYWR2NzZ4eF9yZWFkX2hkbWlf
cGl4ZWxjbG9jayhzZCk7DQo+ID4gPiAgCQlidC0+aGZyb250cG9yY2ggPSBoZG1pX3JlYWQxNihz
ZCwgMHgyMCwgaW5mby0NCj4gPiA+ID4gaGZyb250cG9yY2hfbWFzayk7DQo+ID4gPiAgCQlidC0+
aHN5bmMgPSBoZG1pX3JlYWQxNihzZCwgMHgyMiwgaW5mby0+aHN5bmNfbWFzayk7DQo+ID4gPiAg
CQlidC0+aGJhY2twb3JjaCA9IGhkbWlfcmVhZDE2KHNkLCAweDI0LCBpbmZvLQ0KPiA+ID4gPiBo
YmFja3BvcmNoX21hc2spOw0K
