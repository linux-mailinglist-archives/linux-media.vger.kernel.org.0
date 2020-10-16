Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD96290511
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 14:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407535AbgJPMbF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 08:31:05 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:11202 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405601AbgJPMbE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 08:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602851465; x=1634387465;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zh27I/Uz2zyFeJvjF7bVO87bmHYsfRUInWYCr/x5XOw=;
  b=t9HYryUDPFn198tZV9G1Qvn1ruAH0SQtcHGXXucWGraIDbjTfv3QGc0w
   7PsIYCuIIXUswGigiiJ3VMLrfIJ/YdqgZCnnXlYY0Fw5zXzK9TXQkXLFT
   J6ts9paULRK047JPJ/o2sZV1uuSx5DuDIMPs76DgatTbswrDZKHz6JYpT
   PJkluiO9sfvqIxqURC8sRZBXCjhSJC9UfQ+TaJpXFoDbKr9Py4Ks6wldO
   h/NZqx3wZoukHhWOmI2ZbugWgdZR7UlahY7+iMJLIK0lVwVKnhkY/t2zD
   g3HPMg6eh4A+iP+ayutlGvcJruqziB1b1VspFZNJzyf3eEVe5uPZrVTW6
   A==;
IronPort-SDR: G8W3ajbjL3um8uKUAcCmcHiuK9rqWsvDz+AqOdUPFLwPlWdYmHfrmuDxs9gIDV/beYKe0DbReo
 YMoQSwHlNFqbKI+yLhm/Ghc6eBqx7tpJjr9UYc9PjPmchSFPMqY/JnqYPHTzU5Xb9Jr+jC6z0r
 Zc0uOIYNin2V0Lnm+U2lFV0JxXDl8wTHfV+B+fPmjRfCnK1g1rjEPKPWvEmkutdbRIpj5H6f+M
 8/81kG8RAYRsVRzldGt8q+R+xxG/Q3Jf7i4NAfJzHlaM++IqW49Up3POjzq+yRLZYd9NojTugD
 3uY=
X-IronPort-AV: E=Sophos;i="5.77,382,1596524400"; 
   d="scan'208";a="94876972"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Oct 2020 05:31:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 16 Oct 2020 05:31:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Fri, 16 Oct 2020 05:31:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vq7fRFf4QS048/hlVgV+C1tCFK7QGGdSON6o0njwh8VF1I2pQatCk9hbekPm97xZxDTijODF/PhDrCHVi/njlhuF1bWiEEArTdPjJKTujwn5tVqxRSfIO2D7c538uytkpLaSPkwNyzDVkiypXsBChnrK5atJ4oG0Jkgrf8GDTfWmY4UglTIDYonGX7h8XDNUNZxraK6shjTFcLE3eRu06GtF4czDp31MAT9mGEdAucczDmIob2+uXALoJZlU3+TKJpKsxG6TAve6EHGnMD7hFNxf5Kea2/lAkYGejP7Ko08c2PEZ8+6PESYUToPVBuY5qdRnZJJr9iChg0ogYtFriw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zh27I/Uz2zyFeJvjF7bVO87bmHYsfRUInWYCr/x5XOw=;
 b=N45of7f6cOdyf7HTgJGSEe7n5jnteytcaCSZ6l5ary8XJPy6BAmYxKGJIylJas5XFTiYXm64QfxfMYFix+gzX+QmoHVu+jT071uRu+/Nt6jdZ9bINKty9Q3Gs/L1ESGQjy/tPSSdVhn8Il3+DMRNDdqd9XIPMPKOndGo8ep35I/FHzk1wlYU3un+kQVPpPcKqTapVHcs3YC3N4gWtbzcDdKQoxmwIUPduWjsUPeRQ8qg2x1oFoP0o2COI9sbJF63hBsODf04zJKbxX0lNqDzMRlBsGtKvIiUtiqtbRoIYZ2ig1yyzYA4Y9xIhO/Lv0+fWcYa4fmjuZ0O28/TXe00MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zh27I/Uz2zyFeJvjF7bVO87bmHYsfRUInWYCr/x5XOw=;
 b=UBBllEfG6xxA8Ohnh7eRuJtYz/z/hY0vnDDT7I0SjRRnnQHcvz6OQDJ3ax4cdFQ5bqbi1AcQe1SLLURVJ2ureJaYD7lZKGCB8unmcq+hkOaxJU+tUHG2uVk+S9PRYojiQMpDJObskmc/q9NH1N89L8RTJWjF/cAfqxrlOEj7bo0=
Received: from BYAPR11MB2999.namprd11.prod.outlook.com (2603:10b6:a03:90::17)
 by BY5PR11MB4276.namprd11.prod.outlook.com (2603:10b6:a03:1b9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.28; Fri, 16 Oct
 2020 12:31:00 +0000
Received: from BYAPR11MB2999.namprd11.prod.outlook.com
 ([fe80::4854:dda7:8d0f:bb51]) by BYAPR11MB2999.namprd11.prod.outlook.com
 ([fe80::4854:dda7:8d0f:bb51%7]) with mapi id 15.20.3477.025; Fri, 16 Oct 2020
 12:30:59 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <jacopo@jmondi.org>
CC:     <laurent.pinchart@ideasonboard.com>, <robh+dt@kernel.org>,
        <sakari.ailus@iki.fi>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: media: atmel: csi2dc: add bindings
 for microchip csi2dc
Thread-Topic: [PATCH v3 1/3] dt-bindings: media: atmel: csi2dc: add bindings
 for microchip csi2dc
Thread-Index: AQHWe3Vqn0L0AW6OnE6uFIjSaVH1XKmRnqqAgAI6iACAAGBOgIAGP/sA
Date:   Fri, 16 Oct 2020 12:30:59 +0000
Message-ID: <c473748a-18f9-082a-9121-9c04c663e434@microchip.com>
References: <20200826065142.205000-1-eugen.hristev@microchip.com>
 <20201010211743.GB3939@pendragon.ideasonboard.com>
 <c5d27d11-891b-afd8-0be1-02bf5eb8bef9@microchip.com>
 <20201012130425.2rszhgd7eh7nffrv@uno.localdomain>
In-Reply-To: <20201012130425.2rszhgd7eh7nffrv@uno.localdomain>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [188.27.154.238]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9643038c-5b3c-408c-f837-08d871cf56ad
x-ms-traffictypediagnostic: BY5PR11MB4276:
x-microsoft-antispam-prvs: <BY5PR11MB42768828BDE7859E2DB33872E8030@BY5PR11MB4276.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5nHyJaImIvF/VBJJk0AvB8OAAClk/uFXadJh8UzngTPGx0fAs7M97bfCroViICPtL8aSK58z0IBfdUl1VgEOidztXvHm8qY8SbsQnCQD7Id2GmI9JZT8ZVwOSSo/vK0UkNJe2Gb7b4aaZfv96ouFrDMYKUlBSCSMWsUeF/vwvfKFBRShG9vxgk+v9gk8ef+NHhdqfHuljSEjGRVDFc90C2aAsJPeTvs6aYHf7ZR6l3vFHk+7IsTCsr8w1Pf1bnuqMdQjsNP46LS4K2Ll4FNO9LyJg7oTLfVkZdlbCF52o4iUbtEp6OnUmyVrsOXWC5Zxp6ca4kBIovwHKri7u4Fxqjo5mn9KijyK2uQvDaBxeNsW1WKIPc0Xd6zq4pzU0i98kgedNQmdXb34KoHQYpgzhgmSCCOzXKKJAEc5QeAp8B+7+GKuYwk+iKZsbLP9CrURdrTmvU7Y1gFoSOMiXXhFFw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2999.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(376002)(396003)(366004)(136003)(2906002)(6486002)(76116006)(6512007)(36756003)(86362001)(4326008)(53546011)(6916009)(316002)(31696002)(2616005)(6506007)(8936002)(966005)(66556008)(26005)(186003)(66446008)(66946007)(91956017)(5660300002)(478600001)(54906003)(83380400001)(71200400001)(66476007)(8676002)(31686004)(64756008)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: WKewxrWhGGs3ZLvoPO2dE2oxdrgA7IgJYTYymCSth5H7TkqShnBTZ7R/bk9fyeEr4oI2M/e+rxMZuD6dkTy1bEyelQiaVKZQbeosVXlsdIjdlxjxkkdQ1XAAmfNZV8MykkNadnO0L2FxaIbbwwjyRun3LAJjo3oeZ1hXtC3dIW1zFHzt6tiZG37JYsDYjMxSDv9HSJBGKrg9ezruuX/AAg22PTrzw8MUhhhzY21Aik4XRAAQbeKIQ2pvFo7IAVCZAe/wWjU+oncdWaO6SWm6e9OAOb61Fd1H0gHSRRECqyRSze9PJxWwmSR1P6RCxR1vBthAOVy7V3cmacu7VJKmeD+caKYPFtc7/w82gzW9ceZee/r/ExZPywOlI8fD0bONw+MPrexWvVptfFlzsxvWQoeR4TSWZryv7wt4ZpWkRibv0vHSrrHkPLvvb0uuk5b1n48RkLukegk6OE8b4bZgcW187UvmwuqmCP5wJK431/kSURR/X4A2tOcl1FqW8cB+Olw4RokKCfq+2nxnf1fFF2k3CNLdi1nhV0JoyhRS74GvbZEliybEHRfNuFiruzAXjNEOsurePfMM2odNn8xTnrfMs1xQIfIFYVBZL3qQmBKmHfh7a+K2oDEoZ4CH6+lipvHn8ZsuVkCjCiZRpkgWwQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FB083EF8F835C47A2FB162A0AE9E23C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2999.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9643038c-5b3c-408c-f837-08d871cf56ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 12:30:59.7626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oJ5rDcmzBrUFemL+a6x4dZ30VJJLOodWx7yiliBBnXqWR8eTU12VbENCjN0rPh1hhdUvnsc2pgkUqs+wT41kr4oXeWXTlloBeKN/VMrwwlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4276
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTIuMTAuMjAyMCAxNjowNCwgSmFjb3BvIE1vbmRpIHdyb3RlOg0KPiBIZWxsbywNCj4gICAg
IGp1c3QgbXkgMiBjZW50cywgYXMgSSd2ZSBub3RpY2VkIHRoaXMgcGF0Y2ggc2tpbW1pbmcgdGhy
b3VnaCB0aGUNCj4gICAgIGxpc3QNCj4gDQo+IE9uIE1vbiwgT2N0IDEyLCAyMDIwIGF0IDA3OjE5
OjQzQU0gKzAwMDAsIEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IE9uIDEx
LjEwLjIwMjAgMDA6MTcsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+Pj4gSGkgRXVnZW4sDQo+
Pj4NCj4+PiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4+DQo+PiBIaSwNCj4+DQo+PiBUaGFu
ayB5b3UgZm9yIHlvdXIgcmV2aWV3LA0KPj4NCj4+Pg0KPj4+IE9uIFdlZCwgQXVnIDI2LCAyMDIw
IGF0IDA5OjUxOjQwQU0gKzAzMDAsIEV1Z2VuIEhyaXN0ZXYgd3JvdGU6DQo+Pj4+IEFkZCBiaW5k
aW5ncyBkb2N1bWVudGF0aW9uIGZvciBNaWNyb2NoaXAgQ1NJMiBEZW11bHRpcGxleGVyIGNvbnRy
b2xsZXIuDQo+Pj4+DQo+Pj4+IENTSTJEQyBpcyBhIGRlbXVsdGlwbGV4ZXIgZnJvbSBTeW5vcHN5
cyBJREkgaW50ZXJmYWNlIHNwZWNpZmljYXRpb24gdG8NCj4+Pj4gcGFyYWxsZWwgaW50ZXJmYWNl
IGNvbm5lY3Rpb24gb3IgZGlyZWN0IG1lbW9yeSBhY2Nlc3MuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCj4+Pj4g
LS0tDQo+Pj4+IENoYW5nZXMgaW4gdjM6DQo+Pj4+IC0gUmVtb3ZlZCBzb21lIHRleHQgZnJvbSBk
ZXNjcmlwdGlvbiwgYXMgaXQgd2FzIGV4cGxhaW5lZCBpbiB0aGUgc2NoZW1hDQo+Pj4+IC0gZml4
ZWQgb3RoZXIgdGhpbmdzIGFzIHBlciBSb2IncyByZXZpZXcNCj4+Pj4gLSBtb3ZlZCBzb21lIHRl
eHQgaW5zaWRlIHRoZSBzY2hlbWEsIGxpa2UgdGhlIGNsb2NrIGRlc2NyaXB0aW9uDQo+Pj4+DQo+
Pj4+IENoYW5nZXMgaW4gdjI6DQo+Pj4+IC0gZml4ZWQgd2FybmluZ3MgcmVwb3J0ZWQgYnkgZHRf
YmluZGluZ19jaGVjaw0KPj4+Pg0KPj4+PiAgICAuLi4vYmluZGluZ3MvbWVkaWEvbWljcm9jaGlw
LGNzaTJkYy55YW1sICAgICAgfCAxNzQgKysrKysrKysrKysrKysrKysrDQo+Pj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCAxNzQgaW5zZXJ0aW9ucygrKQ0KPj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21pY3JvY2hpcCxjc2kyZGMu
eWFtbA0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL21pY3JvY2hpcCxjc2kyZGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9taWNyb2NoaXAsY3NpMmRjLnlhbWwNCj4+Pj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iNGMxYjg4MDBhM2INCj4+Pj4g
LS0tIC9kZXYvbnVsbA0KPj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVkaWEvbWljcm9jaGlwLGNzaTJkYy55YW1sDQo+Pj4+IEBAIC0wLDAgKzEsMTc0IEBADQo+
Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZSkNCj4+Pj4gKyVZQU1MIDEuMg0KPj4+PiArLS0tDQo+Pj4+ICskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL21lZGlhL21pY3JvY2hpcCxjc2kyZGMueWFtbCMNCj4+Pj4gKyRz
Y2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPj4+
PiArDQo+Pj4+ICt0aXRsZTogTWljcm9jaGlwIENTSTIgRGVtdXggQ29udHJvbGxlciAoQ1NJMkRD
KQ0KPj4+PiArDQo+Pj4+ICttYWludGFpbmVyczoNCj4+Pj4gKyAgLSBFdWdlbiBIcmlzdGV2IDxl
dWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+DQo+Pj4+ICsNCj4+Pj4gK2Rlc2NyaXB0aW9uOg0K
Pj4+PiArICBDU0kyREMgLSBDYW1lcmEgU2VyaWFsIEludGVyZmFjZSAyIERlbXV4IENvbnRyb2xs
ZXINCj4+Pj4gKw0KPj4+PiArICBDU0kyREMgaXMgYSBoYXJkd2FyZSBibG9jayB0aGF0IHJlY2Vp
dmVzIGluY29taW5nIGRhdGEgZnJvbSBhbiBJREkgaW50ZXJmYWNlDQo+Pj4+ICsgIGFuZCBmaWx0
ZXJzIHBhY2tldHMgYmFzZWQgb24gdGhlaXIgZGF0YSB0eXBlIGFuZCB2aXJ0dWFsIGNoYW5uZWwg
aWRlbnRpZmllciwNCj4+Pj4gKyAgdGhlbiBjb252ZXJ0cyB0aGUgYnl0ZSBzdHJlYW0gaW50byBh
IGNyb3NzIGNsb2NrIGRvbWFpbiB0byBhIHBpeGVsIHN0cmVhbQ0KPj4+PiArICB0byBhIHBhcmFs
bGVsIGludGVyZmFjZSB0aGF0IGNhbiBiZSByZWFkIGJ5IGEgc2Vuc29yIGNvbnRyb2xsZXIuDQo+
Pj4+ICsNCj4+Pj4gKyAgQ1NJMkRDIHByb3ZpZGVzIHR3byBwaXBlcywgb25lIHZpZGVvIHBpcGUg
YW5kIG9uZSBkYXRhIHBpcGUuIFZpZGVvIHBpcGUNCj4+Pj4gKyAgaXMgY29ubmVjdGVkIHRvIGEg
c2Vuc29yIGNvbnRyb2xsZXIgYW5kIHRoZSBkYXRhIHBpcGUgaXMgYWNjZXNzaWJsZQ0KPj4+PiAr
ICBhcyBhIERNQSBzbGF2ZSBwb3J0IHRvIGEgRE1BIGNvbnRyb2xsZXIuDQo+Pj4+ICsNCj4+Pj4g
KyAgQ1NJMkRDIHN1cHBvcnRzIGEgc2luZ2xlICdwb3J0JyBub2RlIGFzIGEgc291cmNlIHBhZCB3
aXRoIFN5bm9wc3lzIDMyLWJpdA0KPj4+PiArICBJREkgaW50ZXJmYWNlLiBUaGUgY29ubmVjdGVk
IGVuZHBvaW50IG11c3QgYmUgYSBJREkgaW50ZXJmYWNlIGNvbXBhdGlibGUNCj4+Pj4gKyAgZGV2
aWNlIChsaWtlIFN5bm9wc3lzIENTSTJIT1NUKSAsIHRoYXQgY2FuIHByb3ZpZGUgMzItYml0IElE
SSBpbnRlcmZhY2UNCj4+Pj4gKyAgY29ubmVjdGlvbiBhcyBzaW5rIHBhZC4NCj4+Pj4gKyAgRm9y
IG1lZGlhIGVudGl0eSBhbmQgZW5kcG9pbnRzIHBsZWFzZSByZWZlciB0byB0aGUgYmluZGluZ3Mg
ZGVmaW5lZCBpbg0KPj4+PiArICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvdmlkZW8taW50ZXJmYWNlcy50eHQuDQo+Pj4+ICsgIEZvciBTeW5vcHN5cyBJREkgaW50ZXJm
YWNlIHBsZWFzZSByZWZlciB0bw0KPj4+PiArICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvc25wcyxkdy1jc2ktcGxhdC50eHQNCj4+Pj4gKw0KPj4+PiArICBDU0kyREMg
c3VwcG9ydHMgb25lICdwb3J0JyBub2RlIGFzIHNpbmsgcGFkIHdpdGggcGFyYWxsZWwgaW50ZXJm
YWNlLiBUaGlzIGlzDQo+Pj4+ICsgIGNhbGxlZCB2aWRlbyBwaXBlLg0KPj4+PiArICBUaGlzIHBv
cnQgaGFzIGFuICdlbmRwb2ludCcgY2FuIHRoZW4gYmUgdXNlZCBhcyBhIHNvdXJjZSBwYWQgZm9y
IGFub3RoZXINCj4+Pj4gKyAgY29udHJvbGxlciAobmV4dCBpbiBwaXBlbGluZSkuDQo+Pj4+ICsg
IFBsZWFzZSByZWZlciB0byB0aGUgYmluZGluZ3MgZGVmaW5lZCBpbg0KPj4+PiArICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8taW50ZXJmYWNlcy50eHQuDQo+
Pj4+ICsNCj4+Pj4gKyAgQ1NJMkRDIGFsc28gc3VwcG9ydHMgZGlyZWN0IGFjY2VzcyB0byB0aGUg
ZGF0YSB0aHJvdWdoIEFIQiwgdmlhIERNQSBjaGFubmVsLA0KPj4+PiArICBjYWxsZWQgZGF0YSBw
aXBlLg0KPj4+PiArICBCZWNhdXNlIG9mIHRoaXMsIHRoZSBzaW5rICdwb3J0JyBjaGlsZCBub2Rl
IChzZWNvbmQpIGlzIG5vdCBtYW5kYXRvcnkuDQo+Pj4+ICsgIElmIHRoZSBzaW5rICdwb3J0JyBj
aGlsZCBub2RlIGlzIG1pc3NpbmcsIG9ubHkgZGF0YSBwaXBlIGlzIGF2YWlsYWJsZS4NCj4+Pj4g
Kw0KPj4+PiArcHJvcGVydGllczoNCj4+Pj4gKyAgY29tcGF0aWJsZToNCj4+Pj4gKyAgICBjb25z
dDogbWljcm9jaGlwLHNhbWE3ZzUtY3NpMmRjDQo+Pj4+ICsNCj4+Pj4gKyAgcmVnOg0KPj4+PiAr
ICAgIG1heEl0ZW1zOiAxDQo+Pj4+ICsNCj4+Pj4gKyAgY2xvY2tzOg0KPj4+PiArICAgIG1heEl0
ZW1zOiAyDQo+Pj4+ICsNCj4+Pj4gKyAgY2xvY2stbmFtZXM6DQo+Pj4+ICsgICAgZGVzY3JpcHRp
b246DQo+Pj4+ICsgICAgICBDU0kyREMgbXVzdCBoYXZlIHR3byBjbG9ja3MgdG8gZnVuY3Rpb24g
Y29ycmVjdGx5LiBPbmUgY2xvY2sgaXMgdGhlDQo+Pj4+ICsgICAgICBwZXJpcGhlcmFsIGNsb2Nr
IGZvciB0aGUgaW5zaWRlIGZ1bmN0aW9uYWxpdHkgb2YgdGhlIGhhcmR3YXJlIGJsb2NrLg0KPj4+
PiArICAgICAgVGhpcyBpcyBuYW1lZCAncGNsaycuIFRoZSBzZWNvbmQgY2xvY2sgbXVzdCBiZSB0
aGUgY3Jvc3MgZG9tYWluIGNsb2NrLA0KPj4+PiArICAgICAgaW4gd2hpY2ggQ1NJMkRDIHdpbGwg
cGVyZm9ybSBjbG9jayBjcm9zc2luZy4gVGhpcyBjbG9jayBtdXN0IGJlIGZlZA0KPj4+PiArICAg
ICAgYnkgdGhlIG5leHQgY29udHJvbGxlciBpbiBwaXBlbGluZSwgd2hpY2ggdXN1YWxseSBpcyBh
IHNlbnNvciBjb250cm9sbGVyLg0KPj4+PiArICAgICAgTm9ybWFsbHkgdGhpcyBjbG9jayBzaG91
bGQgYmUgZ2l2ZW4gYnkgdGhpcyBzZW5zb3IgY29udHJvbGxlciB3aG8NCj4+Pj4gKyAgICAgIGlz
IGFsc28gYSBjbG9jayBzb3VyY2UuIFRoaXMgY2xvY2sgaXMgbmFtZWQgJ3NjY2snLCBzZW5zb3Ig
Y29udHJvbGxlciBjbG9jay4NCj4+Pj4gKyAgICBpdGVtczoNCj4+Pj4gKyAgICAgIC0gY29uc3Q6
IHBjbGsNCj4+Pj4gKyAgICAgIC0gY29uc3Q6IHNjY2sNCj4+Pj4gKw0KPj4+PiArICBtaWNyb2No
aXAsY2xrLWdhdGVkOg0KPj4+PiArICAgIHR5cGU6IGJvb2xlYW4NCj4+Pj4gKyAgICBkZXNjcmlw
dGlvbjoNCj4+Pj4gKyAgICAgIElmIHByZXNlbnQsIGluZGljYXRlcyB0aGF0IHRoZSBjbG9jayBp
cyBnYXRlZC4NCj4+Pj4gKyAgICAgIE90aGVyd2lzZSwgdGhlIGNsb2NrIGlzIGZyZWUtcnVubmlu
Zy4NCj4+Pg0KPj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBiZWxvbmdzIHRvIHRoZSBEVCBiaW5kaW5n
cywgaXQgc2hvdWxkIGluc3RlYWQgYmUNCj4+PiBxdWVyaWVkIGZyb20gdGhlIHNvdXJjZSBzdWJk
ZXYgYXQgcnVudGltZS4NCj4+DQo+PiBJZiB0aGlzIHNob3VsZCBiZSBxdWVyaWVkLCBkbyB5b3Ug
a25vdyB3aGF0IGlzIHRoZSB2NGwyIG1lY2hhbmlzbSB0bw0KPj4gcXVlcnkgc3VjaCBpbmZvcm1h
dGlvbiA/DQo+PiBUaGUgc3ViZGV2aWNlIGlzIGNvbm5lY3RlZCB0aHJvdWdoIGEgcG9ydCBpbnRl
cmZhY2UgdG8gdGhpcyBkZXZpY2UsIHNvDQo+PiBpdCB3YXMgbmF0dXJhbCBmb3IgbWUgdG8gZnVs
bHkgZGVzY3JpYmUgdGhlIGludGVyZmFjZSBpbiB0aGUgZGV2aWNldHJlZQ0KPj4gcG9ydCBkZXNj
cmlwdGlvbg0KPj4NCg0KSGksDQoNClRoYW5rcyBmb3IgaGVscGluZywNCj4gDQo+IElzIHRoaXMg
cHJvcGVydHkgZGVzY3JpYmluZyB0aGUgQ1NJLTIgY2xvY2sgY29udGludW91cywgbm9uLWNvbnRp
bnVvdXMNCj4gbW9kZSBjb25maWd1cmF0aW9uLCBvciBkaWQgSSBtaXMtaW50ZXJwcmV0ZWQgaXQg
Pw0KDQpJIHRoaW5rIHNvLiBUaGlzIGlzIGEgc2V0dGluZyBpbnNpZGUgdGhlIGNzaTJkYyByZWdh
cmRpbmcgY2xvY2suIElmIHdlIA0KY2FuIG9idGFpbiBpdCBmcm9tIHBhZHMgb3BlcmF0aW9ucywg
dGhlbiBpdCdzIGdvb2QsIGJ1dCB0aGUgcXVlc3Rpb24gaXMsIA0KaWYgdGhlIGRldmljZXMgY2Fu
IHByb3ZpZGUgdGhpcyBvciBub3QgPw0KPiANCj4gV2UgYWRkZWQgc3VwcG9ydCBmb3IgcmV0cmll
dmluZyBydW4tdGltZSBjb25maWd1cmF0aW9uIG9mIHRoZSBtZWRpYQ0KPiBidXMgd2l0aCB0aGUg
Z2V0X21idXNfY29uZmlnIHBhZCBvcGVyYXRpb25zIHJlY2VudGx5LiBBbW9uZyB0aGUNCj4gY29u
ZmlndXJhdGlvbiBmbGFncyBmb3IgTUJVU19DU0kyX0RQSFkgdGhlcmUgYXJlIGluZGVkIENPTlRJ
TlVPVVMgYW5kDQo+IE5PTl9DT05USU5VT1VTIGNsb2NrIGZsYWdzLg0KPiANCj4+Pg0KPj4+PiAr
DQo+Pj4+ICsgIG1pY3JvY2hpcCxpbnRlci1saW5lLWRlbGF5Og0KPj4+PiArICAgIGFsbE9mOg0K
Pj4+PiArICAgIC0gJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMy
DQo+Pj4+ICsgICAgLSBtaW5pbXVtOiAxDQo+Pj4+ICsgICAgLSBtYXhpbXVtOiAxNg0KPj4+PiAr
ICAgIGRlZmF1bHQ6IDE2DQo+Pj4+ICsgICAgZGVzY3JpcHRpb246DQo+Pj4+ICsgICAgICBJbmRp
Y2F0ZXMgaG93IG1hbnkgY2xvY2sgY3ljbGVzIHNob3VsZCBiZSBpbnRyb2R1Y2VkIGJldHdlZW4g
ZWFjaCBsaW5lLg0KPj4+DQo+Pj4gVGhpcyBhbHNvIHNvdW5kcyBsaWtlIGEgY29uZmlndXJhdGlv
biBwYXJhbWV0ZXIuIEhvdyBkb2VzIG9uZSBjb21wdXRlDQo+Pj4gdGhlIHJpZ2h0IHZhbHVlIGZv
ciB0aGlzID8NCj4+DQo+PiBJIHRoaW5rIHRoaXMgaXMgYSBkZWxheSB0aGF0IGNhbiBiZSBhZGRl
ZCBpbnNpZGUgdGhlIGhhcmR3YXJlIGJsb2NrLA0KPj4gZGVwZW5kaW5nIG9uIHRoZSBpbnRlcmZh
Y2Ugc3BlZWQgYW5kIGJhbmR3aWR0aC4gSSB3aWxsIHRyeSB0byB1bmRlcnN0YW5kDQo+PiBtb3Jl
IGRldGFpbHMgZnJvbSB0aGUgaGFyZHdhcmUgZGVzaWduIGFuZCBjb21lIGJhY2sgd2l0aCBhIG1v
cmUgZGV0YWlsZWQNCj4+IGFuc3dlci4NCj4+DQoNClJlZ2FyZGluZyB0aGlzLCBJIHdpbGwgcmVt
b3ZlIGl0LiBPdXIgZGVzaWduIHRlYW0gYWR2aXNlZCB0byBoYXZlIGEgDQpoYXJkY29kZWQgdmFs
dWUgZm9yIHRoaXMgcHJvZHVjdC4NCg0KPj4+DQo+Pj4+ICsNCj4+Pj4gKyAgcG9ydEAwOg0KPj4+
PiArICAgIHR5cGU6IG9iamVjdA0KPj4+PiArICAgIGRlc2NyaXB0aW9uOg0KPj4+PiArICAgICAg
SW5wdXQgcG9ydCBub2RlLCBzaW5nbGUgZW5kcG9pbnQgZGVzY3JpYmluZyB0aGUgaW5wdXQgcGFk
Lg0KPj4+PiArDQo+Pj4+ICsgICAgcHJvcGVydGllczoNCj4+Pj4gKyAgICAgIHJlZzoNCj4+Pj4g
KyAgICAgICAgY29uc3Q6IDANCj4+Pj4gKw0KPj4+PiArICAgICAgZW5kcG9pbnQ6DQo+Pj4+ICsg
ICAgICAgIHR5cGU6IG9iamVjdA0KPj4+PiArDQo+Pj4+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+
Pj4+ICsgICAgICAgICAgcmVtb3RlLWVuZHBvaW50OiB0cnVlDQo+Pj4+ICsNCj4+Pj4gKyAgICAg
ICAgcmVxdWlyZWQ6DQo+Pj4+ICsgICAgICAgICAgLSByZW1vdGUtZW5kcG9pbnQNCj4+Pj4gKw0K
Pj4+PiArICAgICAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4+Pj4gKw0KPj4+PiAr
ICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4+PiArDQo+Pj4+ICsgIHBvcnRAMToN
Cj4+Pj4gKyAgICB0eXBlOiBvYmplY3QNCj4+Pj4gKyAgICBkZXNjcmlwdGlvbjoNCj4+Pj4gKyAg
ICAgIE91dHB1dCBwb3J0IG5vZGUsIHNpbmdsZSBlbmRwb2ludCwgZGVzY3JpYmluZyB0aGUgb3V0
cHV0IHBhZC4NCj4+Pj4gKw0KPj4+PiArICAgIHByb3BlcnRpZXM6DQo+Pj4+ICsgICAgICAnI2Fk
ZHJlc3MtY2VsbHMnOg0KPj4+PiArICAgICAgICBjb25zdDogMQ0KPj4+PiArDQo+Pj4+ICsgICAg
ICAnI3NpemUtY2VsbHMnOg0KPj4+PiArICAgICAgICBjb25zdDogMA0KPj4+PiArDQo+Pj4+ICsg
ICAgICByZWc6DQo+Pj4+ICsgICAgICAgIGNvbnN0OiAxDQo+Pj4+ICsNCj4+Pj4gKyAgICBwYXR0
ZXJuUHJvcGVydGllczoNCj4+Pj4gKyAgICAgICJeZW5kcG9pbnRAWzAtM10kIjoNCj4+Pj4gKyAg
ICAgICAgdHlwZTogb2JqZWN0DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgcHJvcGVydGllczoNCj4+
Pj4gKyAgICAgICAgICByZWc6DQo+Pj4+ICsgICAgICAgICAgICBlbnVtOiBbMCwgMSwgMiwgM10N
Cj4+Pj4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB2aXJ0dWFsIGNoYW5uZWwgZm9yIHRoZSBl
bmRwb2ludA0KPj4+DQo+Pj4gVGhlIHZpcnR1YWwgY2hhbm5lbCB1c2VkIGJ5IHRoZSBzb3VyY2Ug
aXMgYWxzbyBzb21ldGhpbmcgdGhhdCBuZWVkcyB0bw0KPj4+IGJlIHF1ZXJpZWQgZnJvbSB0aGUg
c291cmNlIGF0IHJ1bnRpbWUsIGl0IGRvZXNuJ3QgYmVsb25nIHRvIHRoaXMNCj4+PiBiaW5kaW5n
Lg0KPj4NCj4+IFRoZSBzYW1lIHF1ZXN0aW9uIGFzIGZvciB0aGUgZ2F0ZWQgY2xvY2sgY29uZmln
dXJhdGlvbi4gSG93IGNhbiB3ZSB1c2UNCj4+IHY0bDIgc3ViZGV2aWNlIEFQSSB0byBvYnRhaW4g
c3VjaCBpbmZvcm1hdGlvbiBmcm9tIHRoZSBzdWJkZXZpY2U/IEFuZCBpZg0KPj4gdGhlIHN1YmRl
dmljZSBkb2VzIG5vdCBvZmZlciBzdWNoIGluZm9ybWF0aW9uID8NCj4gDQo+IEkgdGhpbmsgdGhl
IHN1YmRldiBkcml2ZXIgc2hvdWxkIGJlIGluc3RydW1lbnRlZCB0byByZXBvcnQgaXQgaW5zdGVh
ZCBvZg0KPiBoYXJkLWNvZGluZyB0aGUgaW5mb3JtYXRpb24gaW4gRFQgd2hpY2ggc2hvdWxkIGJl
IG90aGVyd2lzZSB1cGRhdGVkDQo+IGRlcGVuZGluZyBvbiB3aGljaCBzZW5zb3IgaXMgY29ubmVj
dGVkIHRvIHRoZSBib2FyZC4gRG9lcyBpdCBtYWtlDQo+IHNlbnNlIHRvIHlvdSA/DQoNCkl0IGRv
ZXMsIGJ1dCB0aGVuLCBpdCB3b24ndCB3b3JrIHVubGVzcyBjb25uZWN0ZWQgdG8gaW5zdHJ1bWVu
dGVkIA0Kc3ViZGV2aWNlcy4gV2hpY2ggaXMgbm90IHJlYWxseSBzb21ldGhpbmcgSSB3b3VsZCBk
bywgc2luY2UgaXQgd291bGQgDQpjb21wbGV0ZWx5IGxpbWl0IHRoZSB1c2FiaWxpdHkuDQpEbyB5
b3UgaGF2ZSBhbnkgZXhhbXBsZSBvbiBob3cgdG8gZ2V0IHRoZSB2aXJ0dWFsIGlkIGZyb20gdGhl
IHN1YmRldiA/DQoNClRoYW5rcyBhZ2FpbiwNCg0KRXVnZW4NCj4gDQo+IENoZWVycw0KPiAgICAg
ag0KPiANCj4+DQo+PiBUaGFua3MgYWdhaW4sDQo+Pg0KPj4gRXVnZW4NCj4+Pg0KPj4+PiArDQo+
Pj4+ICsgICAgICAgICAgcmVtb3RlLWVuZHBvaW50OiB0cnVlDQo+Pj4+ICsNCj4+Pj4gKyAgICAg
ICAgcmVxdWlyZWQ6DQo+Pj4+ICsgICAgICAgICAgLSByZW1vdGUtZW5kcG9pbnQNCj4+Pj4gKyAg
ICAgICAgICAtIHJlZw0KPj4+PiArDQo+Pj4+ICsgICAgICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVz
OiBmYWxzZQ0KPj4+PiArDQo+Pj4+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+
Pj4+ICsNCj4+Pj4gK3JlcXVpcmVkOg0KPj4+PiArICAtIGNvbXBhdGlibGUNCj4+Pj4gKyAgLSBy
ZWcNCj4+Pj4gKyAgLSBjbG9ja3MNCj4+Pj4gKyAgLSBjbG9jay1uYW1lcw0KPj4+PiArICAtIHBv
cnRAMA0KPj4+PiArDQo+Pj4+ICtleGFtcGxlczoNCj4+Pj4gKyAgLSB8DQo+Pj4+ICsgICAgY3Np
MmRjQGUxNDA0MDAwIHsNCj4+Pj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAsc2Ft
YTdnNS1jc2kyZGMiOw0KPj4+PiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+Pj4g
KyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+Pj4+ICsgICAgICAgIHJlZyA9IDwweGUxNDA0
MDAwIDB4NTAwPjsNCj4+Pj4gKyAgICAgICAgY2xvY2tzID0gPCZwY2xrPiwgPCZzY2NrPjsNCj4+
Pj4gKyAgICAgICAgY2xvY2stbmFtZXMgPSAicGNsayIsICJzY2NrIjsNCj4+Pj4gKw0KPj4+PiAr
ICAgICAgICBwb3J0QDAgew0KPj4+PiArICAgICAgICAgICAgICAgcmVnID0gPDA+OyAvKiBtdXN0
IGJlIDAsIGZpcnN0IGNoaWxkIHBvcnQgKi8NCj4+Pj4gKyAgICAgICAgICAgICAgIGNzaTJkY19p
bjogZW5kcG9pbnQgeyAvKiBpbnB1dCBmcm9tIElESSBpbnRlcmZhY2UgKi8NCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmY3NpMmhvc3Rfb3V0PjsNCj4+Pj4g
KyAgICAgICAgICAgICAgIH07DQo+Pj4+ICsgICAgICAgIH07DQo+Pj4+ICsNCj4+Pj4gKyAgICAg
ICAgcG9ydEAxIHsNCj4+Pj4gKyAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4+Pj4gKyAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4+Pj4gKyAgICAgICAg
ICAgICAgICByZWcgPSA8MT47IC8qIG11c3QgYmUgMSwgc2Vjb25kIGNoaWxkIHBvcnQgKi8NCj4+
Pj4gKyAgICAgICAgICAgICAgICBjc2kyZGNfb3V0OiBlbmRwb2ludEAyIHsNCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwyPjsgIC8qIHZpcnR1YWwgY2hhbm5lbCBpZGVudGlm
aWVyICovDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8
Jnhpc2NfaW4+OyAvKiBvdXRwdXQgdG8gc2Vuc29yIGNvbnRyb2xsZXIgKi8NCj4+Pj4gKyAgICAg
ICAgICAgICAgICB9Ow0KPj4+PiArICAgICAgICB9Ow0KPj4+PiArICAgIH07DQo+Pj4+ICsNCj4+
Pj4gKy4uLg0KPj4+DQo+Pj4gLS0NCj4+PiBSZWdhcmRzLA0KPj4+DQo+Pj4gTGF1cmVudCBQaW5j
aGFydA0KPj4+DQo+Pg0KDQo=
