Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 019556F9EF
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2019 09:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbfGVHHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jul 2019 03:07:46 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:58572 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727222AbfGVHHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jul 2019 03:07:46 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6M755IX008859;
        Mon, 22 Jul 2019 00:07:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=proofpoint;
 bh=t9AbwECXfbv88byPQQ27afOo04WT9VATBZioP8DZL/0=;
 b=XI2HK1hYuBf5NRJCB+3PTOyuZ688A61yeIOQQjzZas1UBXl5GgahpKH5DScHdCd4uFfK
 6v/Q8ECmXOZJgp7r8BEjqOg3HYDTlJiIl+l0Cc+ZR5fq43MX1TBkCC/yI9jMzWvv9LHU
 oLGIFwsevWqclrF1fGbqFJkstS3jaSFC89zuwCmRhkV0drg8CZTwxuLxzOnlIZkU62Zx
 GLrFXOT3vFgXXToRZJdDsrJgK++Ifiz6TPsecIpUTs3JNCGjAFGd1Kzx/IwSMAGHdl4I
 OY93cVt6qoIekmY+EQrYYsAPzHX9w/MC8fQU+WthL82/QnKti64u67ALkpwKz0Kb6HWE 6A== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam03-by2-obe.outbound.protection.outlook.com (mail-by2nam03lp2052.outbound.protection.outlook.com [104.47.42.52])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2tuxhwdt2t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 22 Jul 2019 00:07:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OB5ARnEbx3FSqlg6Fw/Dk8yTZ1Jq0PeJKXI65CzRGLN4uKg74DRQGhW1+skn1JDhUoKYsa3lJlulvf+hY+iTGD8UIC47BGtKjH9coA99dmpRs1CiYoSw82fQBrkIRUSELDsNWLBz/2x5OKfHD9qpKDWM8IiGs1fzS5tw0+qTMmoCWQN1qkLI/Pum2TwPXx8TODxLxfstchEvRUOJhyXxZSDaQhfqHqDkNID5HoP18VYErYOXZMMC8FiXOhphZq4IXwAwOLplq/8TxvShYyDPd/Oba+cr4ZOpofAtEzW10gH+tiZKtZzYs1Nfx1qTyXN9XCEpyXyC7Wy32CxhDJMZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9AbwECXfbv88byPQQ27afOo04WT9VATBZioP8DZL/0=;
 b=aZkezevFAUFOk8efffN6PRuDoLkT3+2fJZav+Wyuki7YPZEsCE2Rh/ElI5BFkj+St5FR0qSqviZK9SyLzl1fnYRFmZmdjSHUyTu3eMCheisDLkPIofFI/nGJOYo9LpN9qTs/IS+V0DKTfdQAd1gt/3YdxbyA91T2nfiBci8aMflKAGCG85knXHkKvUFsFzpcGqtBjlDWWqjh5kLrlQcny5W2sMm8+tkgf3NLxggML/P/e7NPBjjzFIEqnBncLcN2VFftt4j+hSSZrZ0XpmnBDaCBmwMK7IXdNgw0T5fwMXKXcLLlv0s7uzTMxkOM/SgsgXEdjQ3X9BDbSsy+4nwaQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=cadence.com;dmarc=pass action=none
 header.from=cadence.com;dkim=pass header.d=cadence.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9AbwECXfbv88byPQQ27afOo04WT9VATBZioP8DZL/0=;
 b=ZI6epbgGsnB/VgdjJzZfDu3urK7/ewB//iGwQB4pqicd1cLYJ3aHCCpawbvhv8OYGTTzElQLddNDiD77mpC7EvuSL6BH8AD/wVzNqTM2pEui4aHcZzU/+CD/iOSvU/4JMMBuoN9MAPWs7kd/N0B+FyzAHGhN0XsLwNbpAUrRZag=
Received: from CY1PR07MB2521.namprd07.prod.outlook.com (10.167.16.12) by
 CY1PR07MB2729.namprd07.prod.outlook.com (10.166.205.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 07:07:33 +0000
Received: from CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::ac78:3ee1:c7d6:763]) by CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::ac78:3ee1:c7d6:763%6]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 07:07:33 +0000
From:   Jan Kotas <jank@cadence.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
CC:     Jan Kotas <jank@cadence.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] media: Add support for Cadence CSI2TX 2.1
Thread-Topic: [PATCH 3/3] media: Add support for Cadence CSI2TX 2.1
Thread-Index: AQHVPVo5HHj6Bdr/tkW3/v69X+Pq+qbTLtCAgAMOv4A=
Date:   Mon, 22 Jul 2019 07:07:33 +0000
Message-ID: <AF5297BE-EE52-4652-8DE6-6A3F4E855480@global.cadence.com>
References: <20190718111509.29924-1-jank@cadence.com>
 <20190718111509.29924-4-jank@cadence.com>
 <20190720082559.pk3odkf5hztgvpif@flea>
In-Reply-To: <20190720082559.pk3odkf5hztgvpif@flea>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 941bf537-491b-4fe3-a273-08d70e734509
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY1PR07MB2729;
x-ms-traffictypediagnostic: CY1PR07MB2729:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY1PR07MB2729192665F94334D5B66FA2D0C40@CY1PR07MB2729.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(36092001)(199004)(189003)(66446008)(6506007)(53546011)(86362001)(64756008)(66476007)(66556008)(102836004)(76176011)(186003)(5660300002)(256004)(26005)(53936002)(6246003)(6306002)(6512007)(66946007)(91956017)(76116006)(11346002)(446003)(476003)(4326008)(2906002)(486006)(14454004)(966005)(478600001)(68736007)(81156014)(81166006)(6436002)(8936002)(25786009)(66066001)(7736002)(305945005)(6916009)(6116002)(3846002)(229853002)(8676002)(33656002)(316002)(54906003)(99286004)(71190400001)(71200400001)(6486002);DIR:OUT;SFP:1101;SCL:1;SRVR:CY1PR07MB2729;H:CY1PR07MB2521.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e21DDOPG/Lb1LCK6O2soV8zji39ADUpbBknCkEGd77e2KAr/auHoRBaEdVkouQgKtDcLx08Uo8RmbE8iiucvOqATRQ2+FXMWYp04VyXjZOJp94sMv8gUtMBxnnsqn1HO8Jaw67k2uI3x9RyTUuJFVjzIFKavX3iyBHBe63hNThtwBQDEj95PYGHADeXypRLU8+FvW8He/e0K7Hd9BVT9qyoXCckA72COUCSSQUh8NUSq8s1FSCX6nKvAwudqoj3qvg7+cJMRguKEK87pvH+UusH59OI+qAChjxe1l2ajynwP5BoHeJVhcMmHQ8HAXfKTrbZ9NnD8mTi09vM2GHs2EuGymRdAdhoGNli5xpPSmhH5y2fYamsSejchu8mYee1jWqmaxciewyxJfYsVycJ3Ab2A1zPRInelFbHbF8jJqwc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <73B7B35BAB48B647A849C30917595FFE@namprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 941bf537-491b-4fe3-a273-08d70e734509
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 07:07:33.7140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jank@global.cadence.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2729
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-22_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=832 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907220085
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCj4gT24gMjAgSnVsIDIwMTksIGF0IDEwOjI1LCBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gVGh1LCBKdWwgMTgs
IDIwMTkgYXQgMTI6MTU6MDlQTSArMDEwMCwgSmFuIEtvdGFzIHdyb3RlOg0KPj4gCS8qIFB1dCBv
dXIgbGFuZXMgKGNsb2NrIGFuZCBkYXRhKSBvdXQgb2YgcmVzZXQgKi8NCj4+IAlyZWcgPSBDU0ky
VFhfRFBIWV9DRkdfQ0xLX1JFU0VUIHwgQ1NJMlRYX0RQSFlfQ0ZHX01PREVfTFBEVDsNCj4+IAlm
b3IgKGkgPSAwOyBpIDwgY3NpMnR4LT5udW1fbGFuZXM7IGkrKykNCj4+IC0JCXJlZyB8PSBDU0ky
VFhfRFBIWV9DRkdfTEFORV9SRVNFVChjc2kydHgtPmxhbmVzW2ldKTsNCj4+ICsJCXJlZyB8PSBD
U0kyVFhfRFBIWV9DRkdfTEFORV9SRVNFVChjc2kydHgtPmxhbmVzW2ldIC0gMSk7DQo+IA0KPiBU
aGlzIGxvb2tzIGxpa2UgYSBzZXBhcmF0ZSBjaGFuZ2U/DQo+IA0KPj4gCXdyaXRlbChyZWcsIGNz
aTJ0eC0+YmFzZSArIENTSTJUWF9EUEhZX0NGR19SRUcpOw0KPj4gDQo+PiAtCXVkZWxheSgxMCk7
DQo+PiArCWNzaTJ0eF9kcGh5X2luaXRfZmluaXNoKGNzaTJ0eCwgcmVnKTsNCj4+ICt9DQo+PiAN
Cj4+IC0JLyogRW5hYmxlIG91ciAoY2xvY2sgYW5kIGRhdGEpIGxhbmVzICovDQo+PiAtCXJlZyB8
PSBDU0kyVFhfRFBIWV9DRkdfQ0xLX0VOQUJMRTsNCj4+IC0JZm9yIChpID0gMDsgaSA8IGNzaTJ0
eC0+bnVtX2xhbmVzOyBpKyspDQo+PiAtCQlyZWcgfD0gQ1NJMlRYX0RQSFlfQ0ZHX0xBTkVfRU5B
QkxFKGNzaTJ0eC0+bGFuZXNbaV0pOw0KPiANCj4gQW5kIHlvdSBoYXZlIGEgc2ltaWxhciBjaGFu
Z2UgaGVyZSB0aGF0IHNob3VsZCBiZSBpbiBhIHNlcGFyYXRlIHBhdGNoLA0KPiB3aXRoIGEgcHJv
cGVyIGV4cGxhbmF0aW9uLg0KPiANCj4gT3RoZXJ3aXNlLCB0aGUgcmVzdCBsb29rcyBnb29kLg0K
DQpPSywgSeKAmWxsIGNyZWF0ZSBhIHNlcGFyYXRlIHBhdGNoIHdpdGggdGhpcyBtb2RpZmljYXRp
b24uDQpKYW4NCg0KPiBNYXhpbWUNCj4gDQo+IC0tDQo+IE1heGltZSBSaXBhcmQsIEJvb3RsaW4N
Cj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczovL2Jvb3Rs
aW4uY29tDQoNCg==
