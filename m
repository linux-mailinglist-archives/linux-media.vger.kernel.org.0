Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1256AD40E
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 09:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388218AbfIIHll (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 03:41:41 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:10692 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726026AbfIIHll (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 03:41:41 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x897arVo027026;
        Mon, 9 Sep 2019 00:41:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=proofpoint;
 bh=MHVhCcjXdi+cD242GqEqgEjKWaUkWkROl8jSDeGEu00=;
 b=YF76NykadJD3f43eU6wXz118c8VCQNTY98ebvzco6yGnjZWRhgM58qaINGkwB7V5+LDj
 s2JvZyFTRyjnjCb2yiR9eUxOoza2COaVfTPta1dQNOdb3ims3fDbAh6F7ZUF5WGy70ea
 CCGzzZYzceEEktf3iRyj+RB+v8CJfjD8DrnMBfVDceONmYGE4uMOqAgqWdUqnzR9Xe7O
 FVUFRCKoELoA7g/JzWqwxoHGezTlqqTQU0SOJjaSxUf7xj0ydulT+5bF3IlLMyLgrjTk
 tjsWe103Tqvg42+elTGUjvCU9NUTspGmhRXaHlXiUDqu4iW+m6V/QdR3zIjvfarSM5BH WA== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2053.outbound.protection.outlook.com [104.47.37.53])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2uv93y68wb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Sep 2019 00:41:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVvn3BqdEdWpieXHd0wNl0B9pT9wWeHv0UlkkoiSqakPC2L9+/zQCW+hQ332geYeXJ4FLrVeALSw/UYPg8PC0e4U0V0bq5VV8qPYsx/Ezzk4njkTjx+iIVyspdWCCMGPHa18rhUNfMj9KpbiOpN1RRaiK1NfD+iGo0hKujfu+L6zArNmvNYmiSATqkVz14aqev6nXh0ivhM9NHiAfuDnRxshWZD5245VsneUGQqfJhGpgEX26nsf4Q9D39u5gy2DBtXXMoZxxu8arD4f848EM+WN0NM7fa4PJ1lTNbsyPEOBA9J5BW1V8h8twj7RmgHPFTPEgGNnFhBEHxDoglwO4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHVhCcjXdi+cD242GqEqgEjKWaUkWkROl8jSDeGEu00=;
 b=ZWm3JGEMfC0bFiWBUk7lMaIu+LHcUok+Q4jKBRQEwonABO19254jyCzcQ+KDgd9sOVtazonFW+z2ZQ5zbvRd1WskfzTEBzFXnYNuOab/YpXcC/Y0xoV5AHqjJKM+9PvW2oTzibkMXYUXPtBG1yxcKxvdkhEHYJc5WxGRtiTPXghJBidR8bbOV+M055yIpQOvdaI+VKfbs+MQUNauq2CAKkgGoRl9/UvjVVigs0UcoW5C3j0j8xhSzJ7rIiyRHl/lV00xMcVHH3hvL1/IueoaLlTU/acD7visXAsCuJYXkDPBKJact4OfIckLITzrh99gRElVpbhicRlTY2l3A0182g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHVhCcjXdi+cD242GqEqgEjKWaUkWkROl8jSDeGEu00=;
 b=e1giV9G7RzJFv/n9oQEOsY/NzlQO6UoOwekJNlSg0DAmCoHpWMadt5VPBXn0HjLulH043B6E9Z73CasmO8V6aQ2heqg+7hSNDIKcvH8pBsa0oAr8XZVgwSenWo3xf4eLPiqaO1PTrOlziHao9FYibCaTpkBLaSnOkoCjpK9aHno=
Received: from CY1PR07MB2521.namprd07.prod.outlook.com (10.167.16.12) by
 CY1PR07MB2490.namprd07.prod.outlook.com (10.167.18.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 07:41:22 +0000
Received: from CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::1927:7325:2156:bd59]) by CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::1927:7325:2156:bd59%10]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 07:41:22 +0000
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
Thread-Index: AQHVY9iTRWpCeBlM0kmgbmtOhXyfuaceSNqAgASzZ4A=
Date:   Mon, 9 Sep 2019 07:41:21 +0000
Message-ID: <1D1666FD-CFC6-4DE1-8A2E-1809D1BDEAAB@global.cadence.com>
References: <20190905105601.27034-1-jank@cadence.com>
 <20190905105601.27034-3-jank@cadence.com>
 <20190906075413.GE1586@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190906075413.GE1586@valkosipuli.retiisi.org.uk>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bb61386-e205-40af-304e-08d734f91c38
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY1PR07MB2490;
x-ms-traffictypediagnostic: CY1PR07MB2490:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR07MB2490A3C0B87DE8551179E886D0B70@CY1PR07MB2490.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(36092001)(199004)(189003)(51914003)(99286004)(6246003)(14454004)(6116002)(3846002)(4744005)(2906002)(486006)(6916009)(6486002)(6436002)(71200400001)(66066001)(5660300002)(229853002)(446003)(76116006)(91956017)(11346002)(476003)(316002)(54906003)(25786009)(6506007)(53936002)(102836004)(53546011)(186003)(71190400001)(478600001)(76176011)(26005)(33656002)(8936002)(256004)(66946007)(66556008)(64756008)(66446008)(66476007)(8676002)(305945005)(86362001)(6512007)(4326008)(7736002)(81156014)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:CY1PR07MB2490;H:CY1PR07MB2521.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GyywWoCbdP1W2VsY44S/YoncVNmNfYwPCzFx6odIgEI6zAGLFJj7rJwKibfzcZLSTXWU5IrFmTE/iz7duxi+y6YgSvuNSQaH6wz2uASelA7qf/7b1wVanCugzKArOiKlEZ2RFOhLA5OUzGSv8RWZe02j+l6fbruoq88ayYusH5evnYuODy2yuJ4jHuN+QnGU0//oFrxrifzHHoHZ+bDFkVTY1nSOh2V05HmMZsFf0SG87ZQi84vZlSZP1pY/UygGBascBgyE6gdnTIsbnQEMNmxJJAyzFIKPMuZ09IFm57lNykQVWm1z75x+Sf3CM5GoAEkHsz5dgZw81PX00hVgy45S/6H5fQYsgDef3zHpnlfLSD9KPWwO/dwH2D2+19HIR0dcbDP8Oyubb7O7C5psfaaftF4CSSHo4rUaFB4/YoQ=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92F0E0B42750394CB426E0B76CE653F7@namprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb61386-e205-40af-304e-08d734f91c38
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 07:41:21.9590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJ3M/jIEhsx+ZVA/hiKv+UBugWY7NZs3TLh+hRq2eD41HNRN4ANSr7jSJ1FgHgAUt9EFM0FCycPmitfSdXS70w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2490
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-09_04:2019-09-08,2019-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 clxscore=1011
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 mlxlogscore=640 priorityscore=1501 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909090084
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCkhlbGxvIFNha2FyaSwNCg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5Lg0KPiBPbiA2IFNlcCAy
MDE5LCBhdCAwOTo1NCwgU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAaWtpLmZpPiB3cm90ZToN
Cj4gDQo+IEhpIEphbiwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoc2V0Lg0KPiANCj4gT24g
VGh1LCBTZXAgMDUsIDIwMTkgYXQgMTE6NTY6MDBBTSArMDEwMCwgSmFuIEtvdGFzIHdyb3RlOg0K
Pj4gLyoNCj4+ICAqIERyaXZlciBmb3IgQ2FkZW5jZSBNSVBJLUNTSTIgUlggQ29udHJvbGxlciB2
MS4zDQo+PiAgKg0KPj4gLSAqIENvcHlyaWdodCAoQykgMjAxNyBDYWRlbmNlIERlc2lnbiBTeXN0
ZW1zIEluYy4NCj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTctMjAxOSBDYWRlbmNlIERlc2lnbiBT
eXN0ZW1zIEluYy4NCj4+ICAqLw0KPj4gDQo+PiArCWZvciAoaSA9IDA7IGkgPCBjc2kycngtPm51
bV9sYW5lczsgaSsrKSB7DQo+PiArCQlpZiAoY3NpMnJ4LT5sYW5lc1tpXSA8IDEpIHsNCj4gDQo+
IERvIHlvdSBuZWVkIHRoaXM/IHY0bDJfZndub2RlX3BhcnNlX2VuZHBvaW50KCkgYWxyZWFkeSBo
YXMgYSBtb3JlIHRob3JvdWdoDQo+IGNoZWNrIGZvciB0aGUgbGFuZSBudW1iZXJzLg0KDQpJIGxv
b2tlZCBhdCB0aGUgc291cmNlIGNvZGUgb2YgdjRsMl9md25vZGVfZW5kcG9pbnRfcGFyc2VfY3Np
Ml9idXMNCmFuZCB0aGlzIHBhcnRpY3VsYXIgY2FzZSBkb2VzbuKAmXQgc2VlbSB0byBiZSBjaGVj
a2VkLg0KDQo+IA0KPiAtLSANCj4gUmVnYXJkcywNCj4gDQo+IFNha2FyaSBBaWx1cw0KDQpSZWdh
cmRzLA0KSmFuDQoNCg==
