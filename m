Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C73491D9F
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 09:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfHSHQU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 03:16:20 -0400
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:14652 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726186AbfHSHQT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 03:16:19 -0400
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7J7DlYQ020610;
        Mon, 19 Aug 2019 00:16:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=proofpoint;
 bh=vufHKKxWYE/lUOX+3AiRWc8sRlXb37jZDWnMQ74KYJs=;
 b=BTZA2CqATiRJ99qGZKBf1RgQ3MWMRVo1xR8X8+r1jJDFT8sfT9xFaQZnmcqS3NqITRZE
 fF9z5yzZrBjnBEjK0eM6bGXZpz/b+Y+McJPfypjR4jf7IYa6KfnZV3oeY+C1YVx2Ix8Q
 Jn+GaCPQoUU0OFmm9gnRwTI1z9PiUDi3Golb5I+KiXICuXGbxg4mluAKHY70WYWaW3Xt
 pC801jn9Zm22x8p05gc3PFCphEA9MQ1CJ/ABWFEqk3dUoNWDPvbXLJL+cSSv2oYA07b9
 i28OY2WSti8A5VFl6jzRQBWLMmlqJBDJCVJeQ/Py/5L0h6Ijyf9O1sBRuBW9+80jYbiS IA== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=jank@cadence.com
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2059.outbound.protection.outlook.com [104.47.44.59])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2ued5wnxhp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 19 Aug 2019 00:16:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqFb4imVva6Ve9NyZE/5TUbp1QhpyNUCDklOYXgZInVZ4Tb94Rok8/rCFtcqSTpg7nDEy7S2ljE7A3TR2qVyTkTz3ouryCNqgWikurOeRxvPaJHi5Ppkim1OObGdlpTTbW6iGiuZxpNPc9wMI9ooIQrkk4oeKyJevjMCHj24IfWaXx/UOhD9dQA15Fh+45SWDW+h3wgfNx+aXWmNyElNpyDvaof9cYyyCB1ILJMYZoBRWJ7A2uGgG6N8ZNElXEISry7ZIE4bnyog7wfPGR/zUMMPmllRBLR1MHw+a4UF8KDqZWSwm8Je0VJrKlrSuBQSU4ai+/UO0iXKuYf83/+wVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vufHKKxWYE/lUOX+3AiRWc8sRlXb37jZDWnMQ74KYJs=;
 b=SrhPWZky19WDSK/22/EVPRFsvt6XUlN1XhbJ9VuiN4YhDmz/vHMuJ7UsPQKBI2aEENDpUQUqeVjibNVbWg3pYYM7kklUqN8MwVMAbDO3yZfCu0aBMMIOAcP+5SaeI/dk/AGPA+yDocgBXTSxyQ2HXsiCc9DiIFn5ZzFHCrIL7h5WCxa9/kssPcLUTH/eHvN2zXnoJ9pLkAQ2ft/grZ42d2oFYYbwhxn2wr1/XLQ6OYtxzIYZXNOOh+cP7uhzMVgPjrf6MQmywot2g22iN+HUswro4oeFOroL/UGEgnyaGsX+dkjM35BruqFdZYpQMR0EVVyZY48QXXsbgVLA5DIdow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vufHKKxWYE/lUOX+3AiRWc8sRlXb37jZDWnMQ74KYJs=;
 b=IxPB8BKnyCiGqtjIaoPi/7jNk0bedQwocnV0yJpHrBywI/ZID9nm8slb7R13bdwkHniJeqmS1028CGahiU9CyERg/+vBRnS/66EUToRfAmwOknEQqe8HzuQ5oTN8ngXm9T7aFgk/33tHtuM/IOcSpG7Fe698+8cFwFzuaaJkeIo=
Received: from CY1PR07MB2521.namprd07.prod.outlook.com (10.167.16.12) by
 CY1PR07MB2539.namprd07.prod.outlook.com (10.167.8.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Mon, 19 Aug 2019 07:16:04 +0000
Received: from CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::2cc9:1e25:81ae:bc20]) by CY1PR07MB2521.namprd07.prod.outlook.com
 ([fe80::2cc9:1e25:81ae:bc20%11]) with mapi id 15.20.2178.018; Mon, 19 Aug
 2019 07:16:04 +0000
From:   Jan Kotas <jank@cadence.com>
To:     Rob Herring <robh@kernel.org>
CC:     Jan Kotas <jank@cadence.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Rafal Ciepiela <rafalc@cadence.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] media: dt-bindings: Update bindings for Cadence
 CSI2RX version 2.1
Thread-Topic: [PATCH 1/3] media: dt-bindings: Update bindings for Cadence
 CSI2RX version 2.1
Thread-Index: AQHVQtN9gPRtTjsHTUOk6ph3I74Brab+aoUAgAPLv4A=
Date:   Mon, 19 Aug 2019 07:16:04 +0000
Message-ID: <A3DAF408-887A-4913-B620-959BCD4E98D8@global.cadence.com>
References: <20190725102648.13445-1-jank@cadence.com>
 <20190725102648.13445-2-jank@cadence.com> <20190816211802.GA12657@bogus>
In-Reply-To: <20190816211802.GA12657@bogus>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3508351-fa7c-496e-ef6d-08d7247518d2
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:CY1PR07MB2539;
x-ms-traffictypediagnostic: CY1PR07MB2539:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR07MB25395E8FE0BE9C1DFF29D812D0A80@CY1PR07MB2539.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39850400004)(136003)(396003)(376002)(366004)(346002)(24433001)(199004)(189003)(36092001)(6506007)(71200400001)(64756008)(81166006)(8676002)(91956017)(6436002)(26005)(8936002)(66946007)(478600001)(81156014)(2906002)(99286004)(6246003)(7736002)(53546011)(4326008)(15650500001)(102836004)(76176011)(14454004)(305945005)(11346002)(6916009)(486006)(476003)(71190400001)(229853002)(186003)(76116006)(446003)(86362001)(25786009)(53936002)(316002)(33656002)(66446008)(5660300002)(66476007)(3846002)(4744005)(6512007)(66066001)(6486002)(6116002)(54906003)(66556008)(14444005)(256004);DIR:OUT;SFP:1101;SCL:1;SRVR:CY1PR07MB2539;H:CY1PR07MB2521.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VlGJRDDqMRdKcr6X8S9DV+ctCcHsAG4NFJAcQ+XbZlPP4ZMovJE4GWsuZuA0cPPchaj/ZAeLejdpxluPVD9iTP7kvBsuEnTF5ZbrUDciLUTmaIcsM46XnAqwOjx7uT1BnDdiAk1HF3VnKdI4h8A4En7RsNiU7pEpVFfOsFCoULMA+tBV1m3f/56r3rKYlJSdv5JKngrGAKML1qh0er/+BZbI5VJ5DItaUygZ4d4LMY7K+Iaclsu/551Zk80PFR1WOCdoHnHUOp5dWi13K+0JUlrg7ZMZgR/kjSni08I3Y2z4LryHetyW5j2g+YMU2HzisJ8PyVZ221q+vmzIZyyvhLGu5+kS7MHEW5m+77SqXQzJn4eneRMy+tNBhFDfcuWj281M6LmCAhNbco3nSRvS1MQVBogClFJ9ICLDcR5b7vE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <727375F62A61604DBA21FABDFB9748E1@namprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3508351-fa7c-496e-ef6d-08d7247518d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 07:16:04.0305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6y//8lD9WYiFt7TEa5iyW1CxbFf3O5gHYW5HqUUswm7vuNvkpJLm4AFJMKHbeBHDApLGYspvwkNqXUdWI0ztxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2539
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-19_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190083
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCj4gT24gMTYgQXVnIDIwMTksIGF0IDIzOjE4LCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiBPbiBUaHUsIEp1bCAyNSwgMjAxOSBhdCAxMToyNjo0NkFN
ICswMTAwLCBKYW4gS290YXMgd3JvdGU6DQo+PiBUaGlzIHBhdGNoIGFkZHMgYSBEVCBiaW5kaW5n
cyBkb2N1bWVudGF0aW9uIGZvcg0KPj4gQ2FkZW5jZSBDU0kyUlggdjIuMSBjb250cm9sbGVyLg0K
PiANCj4gQW5kIDEuMz8NCg0KT0ssIEnigJlsbCB1cGRhdGUgdGhlIGNvbW1pdCBkZXNjcmlwdGlv
bi4NCj4+IFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+PiAtICAtIGNvbXBhdGlibGU6IG11c3QgYmUg
c2V0IHRvICJjZG5zLGNzaTJyeCIgYW5kIGFuIFNvQy1zcGVjaWZpYyBjb21wYXRpYmxlDQo+PiAr
ICAtIGNvbXBhdGlibGU6IG11c3QgYmUgc2V0IHRvICJjZG5zLGNzaTJyeCIgb3IgImNkbnMsY3Np
MnJ4LTEuMyINCj4+ICsgICAgZm9yIHZlcnNpb24gMS4zIG9mIHRoZSBjb250cm9sbGVyLCAiY2Ru
cyxjc2kycngtMi4xIiBmb3IgdjIuMQ0KPj4gKyAgICBhbmQgYW4gU29DLXNwZWNpZmljIGNvbXBh
dGlibGUNCj4gDQo+IFRoaXMgd29yZGluZyBpcyBub3cgbm90IGNsZWFyIHRoYXQgYW4gU29DLXNw
ZWNpZmljIGNvbXBhdGlibGUgaXMgYWx3YXlzIA0KPiByZXF1aXJlZCBvciBqdXN0IGZvciAyLjEu
IFBsZWFzZSBmb3JtYXQgb25lIGNvbXBhdGlibGUgcGVyIGxpbmUuDQoNCk9LLCBJIHdpbGwgZml4
IGl0IGluIHYyLg0KDQpUaGFuayB5b3UgZm9yIHRoZSBjb21tZW50cy4NCg0KUmVnYXJkcywNCkph
bg0KDQoNCg==
