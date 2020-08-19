Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F08A249E79
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 14:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgHSMpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 08:45:51 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:65264 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgHSMpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 08:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1597841133; x=1629377133;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jwOWa14Iody65DgsA92lOrUhAOSm+sipDGaGbTJmcDI=;
  b=jUGwK+gUV0lI9/mnkQg+0qgaa0yNkbKcrfeaRKRBEVxWBxxQnKxalSrB
   FPP+9CEu8GlB5jLYXVSPKlBQoaNJzUc6kB12JssmmOzIwC7NnLxogqTop
   j2RD0iSMoW0+8Cekp17OIAqN+fbhIyGqmoTkOcZprY0GZENJEa7gKo2lm
   KA1zMve8vku4Wc5bJziB1Lx2j2aDjk7///x9vXVrAc4Zn46AqBzRYcB2g
   n3S3VVvs0iM5aIOa4oGboa3sZMrBaGsbUrq7vJRO4CulHUqb7afqzKRiQ
   A0bviRi1mrdXZJEVxICT0BWo1cLSdNX4LlISRh/ivofsOLsSypj1vTrzD
   w==;
IronPort-SDR: ZyPUfYtqsquSbnEuYaT0zy8FJ/pQw2CT9zgN3MwlT9ZWDQzB1Wm4ASxddkPh2yK5uVLmhyZl/k
 uBhlywCqlYtAa60QBeQ/jDyg7SZwls/F6DwE5uXlBnEhOl9x0AaXaux0J5DlzA1gWxl4Am1EUL
 D41koLAWOBGGa+iryOTTCMfrCk/zAtDLFrYl09GfXyQOws7jPPkcbSyMBZWMFtZMZ6VTTwxcW8
 F0Vxl/xIKwxhX8TugwdIOLQ9jOrCS2BNnETQ3UlMcGqJ1JAvUVWmYouEc+h5UQ8aOgXlx7ALh/
 WY8=
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; 
   d="scan'208";a="87731660"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2020 05:45:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 19 Aug 2020 05:44:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 19 Aug 2020 05:44:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjgTClWGPYfOq44PSJkJ1T6YDTrEUQwlmejBO1eUx6VX2KjxOvqGYLxioafDsx9gazfs9I3f+xvob4SfR2vX026wgLLmPADRhGXZIKDhXp3AVIydKwOmPDf1pDVW9YyVzII2IcR/0juTYbsQkSQOoDH4/isGFYtsT0Vs47lkvzkkvoHy3YkPVCjcYuM5xhncRQZxGTW/HmTqd40Yx1KY8YSwYaqs+isX7Iwn6B+w8t6sdftx/frmqHY0WYxXVjWq+vM+Varnu8sAvKC6muSPaie/AdF7fXlgiEWCjAXQF4SdX6Rs6LV7lIqWIVWCJO0cpP1bCkHzZlKzPnsYQo8bmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwOWa14Iody65DgsA92lOrUhAOSm+sipDGaGbTJmcDI=;
 b=QR+JZJ8lStUgdbpaKFMfqjuG+xBa0rs9FU/xE0ipFmSa+0Vqcx1PyoLVEdzZ2GmCUlOcSqDqEoEiZxJNH/RfqbVwT3fEmOlU1X2oysrM/uZho45ej0Au0JmS58x7Na4wSBK79oGjGtzEv8rdycMu+0gYcsHNBZij7p/LKQ4kbR0mUNy+WbVNQxYL612IFgIZ2RBykB0fX3w3mKfMPcFio8Mr2aKSvz/ZeHbJOyA6BSY8UubOJAtaN8kCmKR7fsumvdR1wRA1NtTgcESIDDj67wmDiFyTeJwUZXiudwnpygIRj5ghfhF1EVQOX32yw7zqE3qY41JLDq33ZmMwb3K14w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwOWa14Iody65DgsA92lOrUhAOSm+sipDGaGbTJmcDI=;
 b=QGQN/+E5BSu1gkmjpuuSBTuaRHPPQHRl477E5oqawxzEWiyvhzFWOhVyD7JBPgB/OJFpE/dQIMFFFJkR+dTaz4USeb90/Ei/eqvMA85TYb+22lG7HEKzUldJaAptRXmkxd88LcOyfNxn5pXNW9ydBADbszASRkwMSJoyNTJp/B0=
Received: from BYAPR11MB2999.namprd11.prod.outlook.com (2603:10b6:a03:90::17)
 by BY5PR11MB4166.namprd11.prod.outlook.com (2603:10b6:a03:191::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 19 Aug
 2020 12:45:29 +0000
Received: from BYAPR11MB2999.namprd11.prod.outlook.com
 ([fe80::9d17:b603:ad42:a2d4]) by BYAPR11MB2999.namprd11.prod.outlook.com
 ([fe80::9d17:b603:ad42:a2d4%7]) with mapi id 15.20.3305.024; Wed, 19 Aug 2020
 12:45:29 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <sakari.ailus@iki.fi>
CC:     <mchehab@kernel.org>, <hverkuil@xs4all.nl>, <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: csi2dc: add bindings for
 microchip csi2dc
Thread-Topic: [PATCH v2 1/4] dt-bindings: media: csi2dc: add bindings for
 microchip csi2dc
Thread-Index: AQHWUQ4jEadYX0HypkGv3SAUXQZrmKk25QKAgAjGG4A=
Date:   Wed, 19 Aug 2020 12:45:29 +0000
Message-ID: <07583628-1fd0-cb05-dc12-f4a3c76da3de@microchip.com>
References: <20200703074416.55272-1-eugen.hristev@microchip.com>
 <20200703074416.55272-2-eugen.hristev@microchip.com>
 <20200813224619.GN840@valkosipuli.retiisi.org.uk>
In-Reply-To: <20200813224619.GN840@valkosipuli.retiisi.org.uk>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: iki.fi; dkim=none (message not signed)
 header.d=none;iki.fi; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.121.125.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c3cbf8a-4dfc-4e7c-d6d2-08d8443dc0dd
x-ms-traffictypediagnostic: BY5PR11MB4166:
x-microsoft-antispam-prvs: <BY5PR11MB4166DD9038CC18A02F5C18FEE85D0@BY5PR11MB4166.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3v2udrP9BgLjOtq7GW2MMFU/ewW7p/7lQadKe4W1pF7YijBVjo0lVcaKxbyP+kCU44j8SD4tt6oy5T9/RkumoRF2NLfg4QaWz6sGzSDy+Y4btPeWWXvXbyOYtTC6ytxGRbNl7Y2X6uKMDDqHI/qeGMVMC4V8gwoqLpoULUZa4i90hn3/fXBIeKCvpe1NsT2ABq0dApjpYhgwSblR2fGUamZYC4YEU+nc525HTojw2om6R2A1I+IN0tHA8LSYIrQ0QBrQ/QkGKd1qoY2dHELd0x+m5/iaXjJHd5GabsysgGwqybs/JBeLBVqQx+cXasnMTMZU7tkC6zKpWJsCZFBrwHdJ+QmYqImlpeKlCPbQcOC66dFFcs3kpUvBPXg8jsl4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2999.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(136003)(39860400002)(396003)(66446008)(64756008)(66556008)(66476007)(36756003)(26005)(31686004)(316002)(2906002)(5660300002)(8676002)(6512007)(2616005)(31696002)(478600001)(186003)(91956017)(6486002)(4326008)(54906003)(8936002)(6506007)(53546011)(71200400001)(66946007)(76116006)(6916009)(86362001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 7aHBEm1TwgY4FJKCXL3V9pG+01ufs6zfvbXJEfHTknho++o0gDGLSUifcrCsgzeptCGSqLcGj/Zz86ol1Hbc7ChWDRLBZ9q/9fjxkvUEnnNTccV9keQrblcGNDbF2jUd+aBrcDDHU8wxFLgtvvRifdKR8RzNJWaLuFYaz29n39mQZ/6Awqgm1lzuNGzIU8hvDK8hOGmNeFElCkDtDLCy8TO8Z1yX08fBQWFiGjfreQoSHsK9RiUusB6rFtomIPF1l/19lxizYVWZasPqI6k0BUSHBlnoAduqmUIIELwioBFjexS0BD8vVQwfbTX0RU59sXtQSRp8vPEQiMFVzdr4mFzwfsrZ2oXi4PYyEBjCR8tH7YDCXpPKSie4zV4cqZxVlD1qaXj6fjqfMm+7hFm6ZnVJ8EwdWv8Q1CbyvPWt5ss0lKpa+IEQZTJ/1EYTuG6h/1P0NPdY7OLlce//K5zqN/N67uNR3/oGFEkNCfuvlShjPoi17aS0TtfEBqueufb7s0z/tTRIUniGWzBuaRtveEOyuaXrW2v8Jq4ecm5bW2agLfFz/fQj/q9byUJZzNeGP7vhtjHJUHWrcgV2pHChHmsCFdeKzucAmy3L7ZTA+gufiS9iaAzDbWkp8dy7nMxKBy+EaK4eI56CZFAfl27xZQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <63295B18F5822A4389B4EF4DC50F1900@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2999.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3cbf8a-4dfc-4e7c-d6d2-08d8443dc0dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2020 12:45:29.1103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0tKHFL+aMZ/nyJhjpm5c+88DzpmV3uXQ+nCyfignQd9J5XQS5xDScsxTJTw41Gs9eoOiZzUokactvvBOJzP0LhRUOmYgXqjWEybT1RCDl80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4166
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTQuMDguMjAyMCAwMTo0NiwgU2FrYXJpIEFpbHVzIHdyb3RlOg0KPiBIaSBFdWdlbiwNCj4g
DQo+IE9uIEZyaSwgSnVsIDAzLCAyMDIwIGF0IDEwOjQ0OjEzQU0gKzAzMDAsIEV1Z2VuIEhyaXN0
ZXYgd3JvdGU6DQo+PiBBZGQgYmluZGluZ3MgZG9jdW1lbnRhdGlvbiBmb3IgbWljcm9jaGlwIENT
STIgRGVtdWx0aXBsZXhlciBjb250cm9sbGVyLg0KPiANCj4gLi4uDQo+IA0KPj4gKyAgcG9ydEAx
Og0KPj4gKyAgICB0eXBlOiBvYmplY3QNCj4+ICsgICAgZGVzY3JpcHRpb246DQo+PiArICAgICAg
T3V0cHV0IHBvcnQgbm9kZSwgc2luZ2xlIGVuZHBvaW50LCBkZXNjcmliaW5nIHRoZSBvdXRwdXQg
cGFkLg0KPj4gKw0KPj4gKyAgICBwcm9wZXJ0aWVzOg0KPj4gKyAgICAgICcjYWRkcmVzcy1jZWxs
cyc6DQo+PiArICAgICAgICBjb25zdDogMQ0KPj4gKw0KPj4gKyAgICAgICcjc2l6ZS1jZWxscyc6
DQo+PiArICAgICAgICBjb25zdDogMA0KPj4gKw0KPj4gKyAgICAgIHJlZzoNCj4+ICsgICAgICAg
IGNvbnN0OiAxDQo+PiArDQo+PiArICAgIHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPj4gKyAgICAgICJe
ZW5kcG9pbnRAWzAtOWEtZl0kIjoNCj4+ICsgICAgICAgIHR5cGU6IG9iamVjdA0KPj4gKw0KPj4g
KyAgICAgICAgcHJvcGVydGllczoNCj4+ICsgICAgICAgICAgcmVnOg0KPj4gKyAgICAgICAgICAg
IGVudW06IFswLCAxLCAyLCAzXQ0KPj4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB2aXJ0dWFs
IGNoYW5uZWwgZm9yIHRoZSBlbmRwb2ludA0KPiANCj4gVW5sZXNzIHlvdSBuZWVkIHRoaXMgcmln
aHQgbm93IEknZCBqdXN0IGhhcmQgY29kZSB0aGlzIHRvIHplcm8gaW4gdGhlDQo+IGRyaXZlci4g
WW91IGNhbid0IGhhdmUgbW9yZSBlbmRwb2ludHMgZm9yIGFjdGl2ZSBkZXZpY2VzIGFueXdheSwg
Y2FuIHlvdT8NCg0KSGVsbG8gU2FrYXJpLA0KDQpZb3UgYXJlIHJpZ2h0LCBidXQsIHRoZSB2aXJ0
dWFsIElEIG11c3QgYmUgd3JpdHRlbiBpbiBoYXJkd2FyZSANCnJlZ2lzdGVycy4gU28gSSBjYW4g
dGFrZSB0aGUgdmlydHVhbCBJRCBmcm9tIHRoaXMgcHJvcGVydHkuDQpPdGhlcndpc2UsIGlmIEkg
aGFyZGNvZGUgdGhpcyBpbiB0aGUgZHJpdmVyLCBhbm90aGVyIHZpcnR1YWwgSUQgd291bGQgYmUg
DQppbXBvc3NpYmxlIHRvIHVzZSB3aXRob3V0IGNoYW5naW5nIHRoZSBkcml2ZXIuIEFuZCBpZiB0
aGUgYmluZGluZyBpcyANCmFjY2VwdGVkIHdpdGhvdXQgdGhpcyBwcm9wZXJ0eSwgaXQgd2lsbCBi
ZSAnc2V0IGluIHN0b25lJyBhbmQgZGlmZmljdWx0IA0KdG8gY2hhbmdlIGFmdGVyd2FyZHMuDQoN
CldoYXQgZG8geW91IHRoaW5rID8NCg0KRXVnZW4NCj4gDQo+IC0tDQo+IFNha2FyaSBBaWx1cw0K
PiANCg0K
