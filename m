Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5F73D8588
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 03:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbhG1BlP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 21:41:15 -0400
Received: from mail-eopbgr10087.outbound.protection.outlook.com ([40.107.1.87]:47013
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232926AbhG1BlO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 21:41:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfG76g1xYo7w+ltL9eLyzQMAAvkwvNmMEKjxO2nsc7Nq5yb7ggAxzDycRgHFRp0u00Ep5b8E7qz2VIOYye4PYzMqHiCIgfl46JiOuhITgppbdii+4j0o7bz8vjUKcsxZ7FL+2buLqGkbkWFRkW6bkcbM5GgjYP0zSc7kGc5sFiJo4IWHsKcuGFgbQWlruursUjUiHUeCo24mSaKUJSeyv2svdW854jjy7gDBdxlYgNfsT71jrHYsA/HVGMbWLIUFlPXSFXGaaSsZZv1JkaBsrs3weAZ3dMy8OjyZf1lZ8fWics557U9oKdX+NM9Y872JPv/Yr0J13U6ezTKT3Cr+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzx/JtEyi3UeHxIVB5MLlVuazp7XY8Efk5T5Zya4klE=;
 b=ecpBBYyFDWGugtZtVSMMm+YSyEKTowD1rYsJWKiGxEb+x9OCZsTUDUqKFDt+a2kM3suE1SvWVLK6bc8xY8IWBngcvbe+heV24q/6PKXboHpbCCK55yQueWADJ7FRf7tDI2UIx4OtosvriSTxEDP1KlbW6IG03QaMkZftv1tF74FPD5oxMkrFAjNTiBbUHAehicqAqCoP4KhSFizCvW0JMp5DccvQUs7qepd3GHJaznomDwK8kA5u8m7fhLpuehvgVh8/0kwS/7z14oHg1BB8AXczVpceQLMuxuSjhtzLIZPAxwlbUqgzHLfvNr8d6bzNYORjyB7EZ3CNazRmmjeqcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzx/JtEyi3UeHxIVB5MLlVuazp7XY8Efk5T5Zya4klE=;
 b=BABm3DHPQ+m1ZpUI9Dc7IQwBax0+Y0NnQuWz0o4VpFQtODta1j7BBPMBYT668lTkVjk7yQ2ACTZh/basTH4YWrDeg+Q7zJOkmimVwKimxgaRXta9AqXhnZnE+1vgqePO5WlI/s80Jl6OiIKug9WidsLnWOW0NUZpUJkLk/KB6hI=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2434.eurprd04.prod.outlook.com (2603:10a6:203:35::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Wed, 28 Jul
 2021 01:41:10 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::81e3:1e06:83ee:5db8%3]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 01:41:10 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v5 02/14] media:Add nt8 and nt10 video format.
Thread-Topic: [EXT] Re: [PATCH v5 02/14] media:Add nt8 and nt10 video format.
Thread-Index: AQHXgpD8B0LcqraPZ0Klt5ff7x/la6tXHMiAgACA4tA=
Date:   Wed, 28 Jul 2021 01:41:10 +0000
Message-ID: <AM6PR04MB6341EF298D521EC922CF1F53E7EA9@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1627353315.git.ming.qian@nxp.com>
         <ee482c18fdaae121e3c9495d07b0f3eb1661e36e.1627353315.git.ming.qian@nxp.com>
 <e88f70b1438d4e5b5313aacccb1f369cabe513bc.camel@ndufresne.ca>
In-Reply-To: <e88f70b1438d4e5b5313aacccb1f369cabe513bc.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ndufresne.ca; dkim=none (message not signed)
 header.d=none;ndufresne.ca; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e3b6231-8aff-472a-a721-08d95168c6dc
x-ms-traffictypediagnostic: AM5PR0401MB2434:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR0401MB2434450E16FBB16ED8D6DF7BE7EA9@AM5PR0401MB2434.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lb+0hRCVSYGHl+WIA1f9Se+Y0uViVX2IEeWaJle+DxUHE0d+KvP+2f+XJxHVTOT3ZuFK+YHjIScxNV8Tcj0+WQg4jtTZkjnSxYxPCqrg9ac297oaYprf55axNcMcn0DFhfq0RP/e/FKHnkAx/eq325qTW5HTF1obkCuCIOl0c7Eyy6O9jXXg6SPOo6DpmfChrihcuH9NoitsR46GUttzFdK3Vd+n0P7Pe+JPAyYgjemHrd3da/R4Y08IApqx10P3aLlPTBoewdqNKzoRJb2X3RFCgMPe1G2T6XgzR+yCXrS5LOiZ7Ju80SzAjEA4Ht/0y/QmFb0FsB69XNGpCpoyVCviYrpBT6RpXWV6kJsL+JgIreX4NmmLoXM9a46VCyENS9YyDyO3LA6GYKJzB+1UxYRppEkDBVfd3vL/f5eTUyJtOMsTK7LaJ1BlzMwyiuydinH6JGiN4awdwrqycX+avLiGC3PIQd5E97HGT5LA4eNw7zF/VMPyDuYv62JRUr4tItHl1TouDbUd8eD5LjBNlDQxtjdBZ4Q9wcbwQwf03m0wFtrnsKocjW4KxFA+KxoW7hRQoZdIvyr6Uk8L4G+ckv5HgX+JeeTf05OiXg+yjmGb3BHz18H2kCg5WW9g7PPeLQU2VjqwPI+37oE6vozQL4Jegf+oabhSlpFjmtKMvOhc98PBx3R9q+nM6+djLbbssTyLDg2ETEfT4lijCvs2UA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(9686003)(55016002)(7696005)(316002)(8936002)(7416002)(66946007)(6506007)(186003)(478600001)(53546011)(26005)(8676002)(2906002)(71200400001)(44832011)(38100700002)(110136005)(54906003)(5660300002)(4326008)(76116006)(66574015)(122000001)(86362001)(52536014)(33656002)(66476007)(66446008)(38070700005)(64756008)(83380400001)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVZvN1lvUDhVTjBxTmRWQitSNHBZWGdoMUhZdG1odXB3MjJwem5mMVAyaHFO?=
 =?utf-8?B?VEJ5OGtPSFQrS0dBZ2xvWjV5enl3TEYwanZlZmRRZDh2ZGt0VFNHMm9ZM0dR?=
 =?utf-8?B?a0hXNmtWeHNSem9tRlV2UzViRmp4YzlXUUdLQ3JGM0NwNXNXaEJHVHlXZS9U?=
 =?utf-8?B?K1krc3hSZ21CSThyZVVBNFpFc2lZQzlQb1o0cUswalJTL0hhNWdlc2MvUzVv?=
 =?utf-8?B?RjZpSS9jNVVGMTVDeGtEbVhKMEE2dndVa01LU29JWnpmYVVBYUl0SlhQVFo5?=
 =?utf-8?B?akQrQ3AwTjQ3ZTlJVTB1TUd6RCtaZFZyTnpSWGtWNTlnK1U1SHBOYzE4K3Ur?=
 =?utf-8?B?Vkt6RUtSakxGejdHQ3pyWmsyTHFpaEhsbUVtYjFaZ1Fic09OOFkvQ0FrMHl1?=
 =?utf-8?B?NllUTWZuY1FpdHVsWWdFNFVOcVFVZm5PcDc3YTc1elhUMjI1YzlCRXZRenRq?=
 =?utf-8?B?eWRDU0VlR3ROK2g0bHZuaG1lcU5HNDNIaW00aWZwaXh2d0RWRXFkKzNmVnVr?=
 =?utf-8?B?TzZoTW8xY0xLOEJZK2pXbTVObTNCdkhTWVRTdVZnV2NKd1RSckQ1WnpRWUlB?=
 =?utf-8?B?aGZuUERoUlJqQUdTTWc0VzJtSHJEUDJHZlh5S1d0YWFrcS9DUDlmSjZpVEtI?=
 =?utf-8?B?dFlyR2JBWWNHOVBOTGxMaFhiM2hBV1pvbzlKbUZyWU1saUt2dEkvTzlQM2Yz?=
 =?utf-8?B?QlB5Q2FCaEV1S2NPUFJMZkJTRmUxWTRaM0tiV3FLKytpY09lckpsa1laaUNl?=
 =?utf-8?B?bzlFUGcwQUtwUVhSb1lLZ3cvbnlZMmlqdDk5SGY5MjlSc0ZqbHp2WFE5Lytq?=
 =?utf-8?B?TzZUL2ZKZi9uZGJPV0g3VllXMXcreWpZRW1naFA3OGcxSVZGbWppd3hLQmd5?=
 =?utf-8?B?VVRuNkdQT1FnUHdMT0Z0R0xDTW54Mlpub1Z2YmZDdVlOdHYrWEwvV2hUSXg4?=
 =?utf-8?B?QVcwc3pNb2tVZ2NpbUpYbC8yS0ZjNkR1d3JJWWpQdlVjZGtJQTk2V01lZHRX?=
 =?utf-8?B?Q2ZNeDQ3eDFxR1UvNVdXWEMzOTZMSjZsWHRqZU5iR0NUWDZvY3drSjNCbVkr?=
 =?utf-8?B?SVNqLzNTbEgzeVMvNGIvOTJUTzAzdCs2ekUyQUU0MkZOQmNrWFlGRDFabzR4?=
 =?utf-8?B?ZWZLeTVlT0EyeHNDSGk1YkFraFFtLzRLQVdmWlBCMDZPNW5iRGlNZzk3UGEv?=
 =?utf-8?B?SEF0eE1TTTNMQUVrNmsvM09zOHUvaWU5NTA4MktvclFpTEdxYnZBVXBCQnBo?=
 =?utf-8?B?OUdDWmp1b1U3ZTJ2ZDcrM0hoOGQ5MVJQNnJNb3J4dndMNHYzY0ZIb2hNUmxG?=
 =?utf-8?B?dXlPYlVSN0h1eDA0ZHJYbE8wUFhia3pZZTI5bXo1cFdTVlV4Sk1uWUh4QU9l?=
 =?utf-8?B?WDdpc09xNnVuekFVUE0vZXc4Q1EwSlo0c1lyV001OWU1NVJFazU2S0xNVlZk?=
 =?utf-8?B?R1NDemFlSTIrUC8zZGlTN3BJd2NoMzQrVGptbUZKeUFqbmxoSWFvdE5rQ1FX?=
 =?utf-8?B?T3Roc1NIUU44WWZoYUFhL2lLaUdUZXIwZHl3MitjUmpSNUdRWm83c0dOWm1G?=
 =?utf-8?B?RCtMU094dlNVWHNxMHJJOWlIN3pwajBDVmdDK20wNkxjdFoyYUIvUzFyT3hT?=
 =?utf-8?B?QnBTVkcxZWFDRjUweC8vRHpVV2FjTGNEUE05elZnY2F0RkYzcXVMOVJoeVI1?=
 =?utf-8?B?VndVdGdGTkV3M2NRa1ZVYzMyVmNqbC9RY2FmcFBOZXBvdDIvdnlRZ2ltek9J?=
 =?utf-8?Q?K2jlxclwCzrpK7/JVw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3b6231-8aff-472a-a721-08d95168c6dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 01:41:10.3334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: osgJt9WC0LbT99leNsDnO/4ZBlL059hzLmoI+OCoh8BkZS37x0jbmr12LR1zdwIJKv65sWcdIFji56+PqLFT6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2434
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmljb2xhcyBEdWZyZXNu
ZSBbbWFpbHRvOm5pY29sYXNAbmR1ZnJlc25lLmNhXQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bHkg
MjgsIDIwMjEgMTo1OCBBTQ0KPiBUbzogTWluZyBRaWFuIDxtaW5nLnFpYW5AbnhwLmNvbT47IG1j
aGVoYWJAa2VybmVsLm9yZzsNCj4gc2hhd25ndW9Aa2VybmVsLm9yZzsgcm9iaCtkdEBrZXJuZWwu
b3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlDQo+IENjOiBodmVya3VpbC1jaXNjb0B4czRhbGwu
bmw7IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOw0KPiBkbC1saW51
eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgQWlzaGVuZyBEb25nIDxhaXNoZW5nLmRvbmdAbnhw
LmNvbT47DQo+IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHY1IDAy
LzE0XSBtZWRpYTpBZGQgbnQ4IGFuZCBudDEwIHZpZGVvIGZvcm1hdC4NCj4gDQo+IENhdXRpb246
IEVYVCBFbWFpbA0KPiANCj4gTGUgbWFyZGkgMjcganVpbGxldCAyMDIxIMOgIDExOjIwICswODAw
LCBNaW5nIFFpYW4gYSDDqWNyaXQgOg0KPiA+IE5UOCBpcyA4LWJpdCB0aWxlZCBudjEyIGZvcm1h
dCB1c2VkIGJ5IGFtcGhpb24gZGVjb2Rlci4NCj4gPiBOVDEwIGlzIDEwLWJpdCB0aWxlZCBmb3Jt
YXQgdXNlZCBieSBhbXBoaW9uIGRlY29kZXIuDQo+ID4gVGhlIHRpbGUgc2l6ZSBpcyA4eDEyOA0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWluZyBRaWFuIDxtaW5nLnFpYW5AbnhwLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBTaGlqaWUgUWluIDxzaGlqaWUucWluQG54cC5jb20+DQo+ID4gU2ln
bmVkLW9mZi1ieTogWmhvdSBQZW5nIDxlYWdsZS56aG91QG54cC5jb20+DQo+ID4gLS0tDQo+ID4g
IC4uLi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9waXhmbXQtcmVzZXJ2ZWQucnN0ICAgfCAxNSAr
KysrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5j
ICAgICAgICAgICAgICB8ICAyICsrDQo+ID4gIGluY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIu
aCAgICAgICAgICAgICAgICAgICAgfCAgMiArKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3VzZXJzcGFj
ZS1hcGkvbWVkaWEvdjRsL3BpeGZtdC1yZXNlcnZlZC5yc3QNCj4gPiBiL0RvY3VtZW50YXRpb24v
dXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvcGl4Zm10LXJlc2VydmVkLnJzdA0KPiA+IGluZGV4IGM5
MjMxZTE4ODU5Yi4uMmRlYWU0OTIxMGE3IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24v
dXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvcGl4Zm10LXJlc2VydmVkLnJzdA0KPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvcGl4Zm10LXJlc2VydmVkLnJzdA0K
PiA+IEBAIC0yNTYsMyArMjU2LDE4IEBAIHBsZWFzZSBtYWtlIGEgcHJvcG9zYWwgb24gdGhlIGxp
bnV4LW1lZGlhIG1haWxpbmcNCj4gbGlzdC4NCj4gPiAgICAgICBvZiB0aWxlcywgcmVzdWx0aW5n
IGluIDMyLWFsaWduZWQgcmVzb2x1dGlvbnMgZm9yIHRoZSBsdW1pbmFuY2UgcGxhbmUNCj4gPiAg
ICAgICBhbmQgMTYtYWxpZ25lZCByZXNvbHV0aW9ucyBmb3IgdGhlIGNocm9taW5hbmNlIHBsYW5l
ICh3aXRoIDJ4Mg0KPiA+ICAgICAgIHN1YnNhbXBsaW5nKS4NCj4gPiArICAgICogLi4gX1Y0TDIt
UElYLUZNVC1OVDg6DQo+ID4gKw0KPiA+ICsgICAgICAtIGBgVjRMMl9QSVhfRk1UX05UOGBgDQo+
ID4gKyAgICAgIC0gJ05BMTInDQo+ID4gKyAgICAgIC0gVHdvLXBsYW5hciBOVjEyLWJhc2VkIGZv
cm1hdCB1c2VkIGJ5IHRoZSB2aWRlbyBlbmdpbmUgZm91bmQgb24NCj4gQW1waGlvbiBkZWNvZGVy
LA0KPiA+ICsgICAgd2l0aCA4eDEyOCB0aWxlcyBmb3IgdGhlIGx1bWluYW5jZSBwbGFuZSBhbmQg
Y2hyb21pbmFuY2UgcGxhbmUuDQo+ID4gKyAgICBUaGUgbnVtYmVyIG9mIGJ5dGVzIGluIG9uZSBs
dW1pbmFuY2Ugb3IgY2hyb21pbmFuY2Ugcm93IG11c3QgYmUNCj4gZGl2aXNpYmxlIGJ5IDI1Ni4N
Cj4gPiArICAgICogLi4gX1Y0TDItUElYLUZNVC1OVDEwOg0KPiANCj4gVGhlcmUgaXMgYSBsYXJn
ZSBzcHJlYWQgb2YgInZlbmRvciBzcGVjaWZpYyIgZm9ybWF0IHRoYXQgYXJlbid0IHJlYWxseSBz
cGVjaWZpYywgb3INCj4gY29tcGxleCBlbm91Z2ggdG8gYmUgd29ydGggYmVpbmcgbWFya2VkIGFz
IHZlbmRvciBmb3JtYXQuIEFzIHBlciBteQ0KPiByZWFkaW5nIG9mIHRoaXMgZGVzY3JpcHRpb24s
IHRoaXMgaXMgbGluZWFybHkgbGF5b3V0IDh4MTI4IHRpbGVkIGZvcm1hdCwgd2l0aCBubw0KPiBj
b21wcmVzc2lvbiBvciBhbnl0aGluZyAod2VsbCB1bmxlc3MgeW91IGZvcmdvdCB0byBtZW50aW9u
KS4gQXMgYSBzaWRlIGVmZmVjdCwNCj4gd2Ugc2hvdWxkIGdpdmUgdGhhdCBmb3JtYXQgYW4gZXhw
bGljaXQgbmFtZSAoTlQ4IGlzIGNyeXB0aWMpLiBXaGF0IGFib3V0DQo+IFY0TDJfUElYX0ZNVF9O
VjEyXzhMMTI4LCBteSBjb2xsZWFndWUgaXMgYWJvdXQgdG8gc2VuZCBhIHByb3Bvc2FsIGluIHRo
YXQNCj4gZGlyZWN0aW9uLiBUaGF0IHdvdWxkIGJlIE5WMTIgd2l0aCBwbGFuZSB0aWxlZCA4eDEy
OCBieXRlcyBhbmQgbGF5b3V0IGxpbmVhcmx5LA0KPiByb3cgYnkgcm93LCBsZWZ0IHRvIHJpZ2h0
LiBXZSBhbHJlYWR5IGhhdmUgY3J5cHRpYyBmb3JtYXRzIGxpa2UgU1VOWEksIEhNMTINCj4gdGhh
dCBhcmUgbGl0ZXJhbGx5IGp1c3QgdGhhdCwgc2ltcGxlIHRpbGluZywgYW5kIHdlIGVuZHVwIGhh
dmluZyB0byB1c2Ugb2JzY3VyZQ0KPiB2ZW5kb3IgbmFtZSB3aGVuZXZlciBvdGhlciBIVyB1c2Vz
IHRoZSBzYW1lLg0KPiANCj4gKHRoaXMgY29tbWVudCBleHRlbmRzIHRvIHRoZSBvdGhlciBmb3Jt
YXRzIGhlcmUpDQoNCkhpIE5pY29sYXMsDQogICBUaGFua3MgZm9yIHlvdXIgYWR2aWNlLCBJJ2xs
IGNoYW5nZSB0aGUgZm9ybWF0IG5hbWUgZnJvbSBOVDggdG8gTlYxMl84TDEyOA0KDQo+IA0KPiA+
ICsNCj4gPiArICAgICAgLSBgYFY0TDJfUElYX0ZNVF9OVDEwYGANCj4gPiArICAgICAgLSAnTlQx
MicNCj4gPiArICAgICAgLSBOVDEwIGlzIGEgdGlsZWQgWVVWIGZvcm1hdCB3aXRoIDEwLWJpdHMg
cGVyIHBpeGVsIHdpdGggaW50ZXJsZWF2ZWQNCj4gVVYuDQo+ID4gKyAgICBJdCdzIHVzZWQgYnkg
dGhlIHZpZGVvIGVuZ2luZSBmb3VuZCBvbiBBbXBoaW9uIGRlY29kZXIsDQo+ID4gKyAgICB3aXRo
IDh4MTI4IHRpbGVzIGZvciB0aGUgbHVtaW5hbmNlIHBsYW5lIGFuZCBjaHJvbWluYW5jZSBwbGFu
ZS4NCj4gPiArICAgIFRoZSBudW1iZXIgb2YgYnl0ZXMgaW4gb25lIGx1bWluYW5jZSBvciBjaHJv
bWluYW5jZSByb3cgbXVzdCBiZQ0KPiBkaXZpc2libGUgYnkgMjU2Lg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWlvY3RsLmMNCj4gPiBiL2RyaXZlcnMvbWVk
aWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYw0KPiA+IGluZGV4IGVlZmYzOThmYmRjYy4uMzRlNjQx
NWU1NzIyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9j
dGwuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYw0KPiA+
IEBAIC0xNDAyLDYgKzE0MDIsOCBAQCBzdGF0aWMgdm9pZCB2NGxfZmlsbF9mbXRkZXNjKHN0cnVj
dCB2NGwyX2ZtdGRlc2MNCj4gKmZtdCkNCj4gPiAgICAgICBjYXNlIFY0TDJfTUVUQV9GTVRfVVZD
OiAgICAgICAgIGRlc2NyID0gIlVWQyBQYXlsb2FkIEhlYWRlcg0KPiBNZXRhZGF0YSI7IGJyZWFr
Ow0KPiA+ICAgICAgIGNhc2UgVjRMMl9NRVRBX0ZNVF9ENFhYOiAgICAgICAgZGVzY3IgPSAiSW50
ZWwgRDR4eCBVVkMNCj4gTWV0YWRhdGEiOyBicmVhazsNCj4gPiAgICAgICBjYXNlIFY0TDJfTUVU
QV9GTVRfVklWSUQ6ICAgICAgIGRlc2NyID0gIlZpdmlkIE1ldGFkYXRhIjsNCj4gYnJlYWs7DQo+
ID4gKyAgICAgY2FzZSBWNEwyX1BJWF9GTVRfTlQ4OiAgICAgICAgICBkZXNjciA9ICJBbXBoaW9u
IFRpbGVkIDh4MTI4DQo+IE5WMTIiOyBicmVhazsNCj4gPiArICAgICBjYXNlIFY0TDJfUElYX0ZN
VF9OVDEwOiAgICAgICAgIGRlc2NyID0gIkFtcGhpb24gVGlsZWQgOHgxMjgNCj4gMTAtYml0Ijsg
YnJlYWs7DQo+ID4NCj4gPiAgICAgICBkZWZhdWx0Og0KPiA+ICAgICAgICAgICAgICAgLyogQ29t
cHJlc3NlZCBmb3JtYXRzICovIGRpZmYgLS1naXQNCj4gPiBhL2luY2x1ZGUvdWFwaS9saW51eC92
aWRlb2RldjIuaCBiL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaA0KPiA+IGluZGV4IDUz
NGVhYTRkMzliYy4uNDgzNjU5MGE2OTBjIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9s
aW51eC92aWRlb2RldjIuaA0KPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIu
aA0KPiA+IEBAIC03NDAsNiArNzQwLDggQEAgc3RydWN0IHY0bDJfcGl4X2Zvcm1hdCB7DQo+ID4g
ICNkZWZpbmUgVjRMMl9QSVhfRk1UX0lOWkkgICAgIHY0bDJfZm91cmNjKCdJJywgJ04nLCAnWics
ICdJJykgLyogSW50ZWwgUGxhbmFyDQo+IEdyZXlzY2FsZSAxMC1iaXQgYW5kIERlcHRoIDE2LWJp
dCAqLw0KPiA+ICAjZGVmaW5lIFY0TDJfUElYX0ZNVF9TVU5YSV9USUxFRF9OVjEyIHY0bDJfZm91
cmNjKCdTJywgJ1QnLCAnMScsICcyJykgLyoNCj4gU3VueGkgVGlsZWQgTlYxMiBGb3JtYXQgKi8N
Cj4gPiAgI2RlZmluZSBWNEwyX1BJWF9GTVRfQ05GNCAgICAgdjRsMl9mb3VyY2MoJ0MnLCAnTics
ICdGJywgJzQnKSAvKiBJbnRlbCA0LWJpdA0KPiBwYWNrZWQgZGVwdGggY29uZmlkZW5jZSBpbmZv
cm1hdGlvbiAqLw0KPiA+ICsjZGVmaW5lIFY0TDJfUElYX0ZNVF9OVDggICAgICB2NGwyX2ZvdXJj
YygnTicsICdBJywgJzEnLCAnMicpIC8qIEFtcGhpb24NCj4gVGlsZWQgOHgxMjggTlYxMiBGb3Jt
YXQgKi8NCj4gPiArI2RlZmluZSBWNEwyX1BJWF9GTVRfTlQxMCAgICAgdjRsMl9mb3VyY2MoJ04n
LCAnVCcsICcxJywgJzInKSAvKiBBbXBoaW9uDQo+IFRpbGVkIDh4MTI4IDEwIGJpdCBGb3JtYXQg
Ki8NCj4gPg0KPiA+ICAvKiAxMGJpdCByYXcgYmF5ZXIgcGFja2VkLCAzMiBieXRlcyBmb3IgZXZl
cnkgMjUgcGl4ZWxzLCBsYXN0IExTQiA2IGJpdHMNCj4gdW51c2VkICovDQo+ID4gICNkZWZpbmUg
VjRMMl9QSVhfRk1UX0lQVTNfU0JHR1IxMCAgICB2NGwyX2ZvdXJjYygnaScsICdwJywgJzMnLCAn
YicpIC8qDQo+IElQVTMgcGFja2VkIDEwLWJpdCBCR0dSIGJheWVyICovDQo+IA0KDQo=
