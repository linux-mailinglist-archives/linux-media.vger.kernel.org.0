Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0059E33AE6C
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 10:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhCOJPH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 05:15:07 -0400
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:27999
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229878AbhCOJPE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 05:15:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuAsFoPOyJrGU5euqGx0heQcur8cml+ZHX3MjW9WFdbPsLeMfV5SO0y2zjHWPUSETgd1jTCsuHYX2sE6jgWiF6MeRdKTmOxDhZ6ssIhi06uJFo0lkOsNs1ZZLn/c8smNSCBGga3G0zmfMKcW/N+l1/fmh4L1Nwkj+/hnuZLQE7q4LykGiebNF1uBLB9ISD4+QJ2hlLrKmo/Bz4XMJDW1PnngbZIFA7iwxg5OaTXaHnYlr+FlGuFtp8kN152zJKUhI+nWlfQrpAAEhw9QMG+1zeApdvbrFuG4qpHQq1X22zEBIwKItve59Bq0bBJyFumCWqXNXRuFr5yRx/ixwb6hUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6zlFbIK9vudApGcELrxjkDUI0KyJq6RQdEh5ITGRKo=;
 b=e6rVy3BgKKi6ofDluMIOoDPp0lF03XyH/sJDP0T9RfHUNPHpbD9XiE2Rxrn+qUu+HcSK+BjUI9LsRhFAvs9yBRGH8DWVvTvfQK494Hzb80MzP30eUrWzFBPzENRDw0V3fG6WZlRd6zDOtwfVswHV92vCzJyWpvkXWhih27ez4tE/FhrcvxntcqxpjcT4KqWM/6mEpKEisXG1q7HB1QaEfyAH+VxWJke6GI6Y3Y8BNFzJnbLfIFnaP+JTn5hPCJ0MgakiTVHkBa81c3oaqsqxdiRnzuOMttvpaHOxLNp8yksJ7VvU+wIBpwtn22zia7mH2st8PfuF06agvNEVxsnosQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6zlFbIK9vudApGcELrxjkDUI0KyJq6RQdEh5ITGRKo=;
 b=bW+zxo1yIg0JDllCdC26w95csJjhdRuGAArNCmUiUBydrl1HqZWBk5rdIXW4OL5PV6qiz3cwLmXflakbIoCrtZ9Q6cF19CcEWyZ4KSq4twsN2L83pR8vWV06ZOOLsMtN92wDv9GG31ZvjSHI/N8JtYAEWjML2R1oBi+yekvrOz0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3729.jpnprd01.prod.outlook.com (2603:1096:604:5f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 09:15:01 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::a1c6:97eb:7268:c2b3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::a1c6:97eb:7268:c2b3%4]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 09:15:00 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] media: v4l: vsp1: Fix bru null pointer access
Thread-Topic: [PATCH 1/2] media: v4l: vsp1: Fix bru null pointer access
Thread-Index: AQHXDpOc6lCyYQk/MU6wTBj2ngPlwKp6wlAAgAOortCABhCIAIAAWxNA
Date:   Mon, 15 Mar 2021 09:15:00 +0000
Message-ID: <OS0PR01MB5922B003F6613525DB699236866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
 <20210301120828.6945-2-biju.das.jz@bp.renesas.com>
 <67dbb76a-db02-7a49-9b1d-0218d01c3173@ideasonboard.com>
 <OS0PR01MB59225484E090C01FD25BAF3C86909@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YE7WKtXzxFdZL4Oh@pendragon.ideasonboard.com>
In-Reply-To: <YE7WKtXzxFdZL4Oh@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [86.167.35.65]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e0c1af13-c07a-439a-4345-08d8e792cfba
x-ms-traffictypediagnostic: OSAPR01MB3729:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB37295C169A107490E3AF2DF7866C9@OSAPR01MB3729.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J+YotdSAfGb5xcYx/PiFSHx4WMyXP3buOu9gGINnEgU1lN8SBIv4nAHOjzUxLkYEecCd+tWmxc63GlhPR/aVfp/p5hgAtELVs1JhThvHWrEGV27dD4s9HLyjPLWh9EsU1rK8hU8ZU08CRa1y/zy6PgtGMhgbKBEEWoSlcuEI8ZArCNW6ioGHuWAdJmu4ep32ozNaMUE1PybhGUZLwsTZWclDsxP6omYY9DTpSsnLqSv7L6bV/bLTxPZlTCOzSGw5sEc34zw5zJPeGKLcojA/Nz+XGr9nh7doJx3TMHI/vlY3YJYDgbxba34W6zj/xvfZ09uLVEq8H/DrZrP5JXl5OYb+qW6029F4XBJBcuNZsC0k5JYOZKp2p7MnuHxq+347rDnjS+XbTiImpoB4GgMuf8UeFT+oGWwTdduBQ2fhyJCBHkmyhF4sgAuLrh+kD0nXiHbfSyaZT7ZSbcTuQ7LTtTEJasLFWHhriMacHLo2dgTL/gNOa9BuRQTfoWrisq0mZIRENV46QUhJL9IJ1Zdfh2hzyuRmK2Agaw/5tzC6ErIexfa/G5tovAadYSOgx7nA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(66556008)(66946007)(4326008)(76116006)(66476007)(64756008)(6916009)(8676002)(2906002)(55016002)(9686003)(316002)(5660300002)(66446008)(186003)(478600001)(26005)(83380400001)(33656002)(52536014)(7696005)(8936002)(71200400001)(6506007)(53546011)(107886003)(86362001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QzE4RmhPcGQzR1EyQkVNdFVWMEs2VnR5Z1IrM0c4bHhYSnhPbkU5R0RkSElB?=
 =?utf-8?B?QllxUm5tc25TV3JrM2M1RE4wL2lMMWt3QkJxRW9FTGdGU1RiZ0pBelQ4RkN1?=
 =?utf-8?B?dmtsT3RaTGdJWG1lUkdNaE1ZOGFWc1htR2N4dVY5M1RycSswSVhPUEVQQ3hv?=
 =?utf-8?B?RnBuWE9ObGpnZjNaWjhzOXFibEloTDNTeSsvQ0hWdXZySWdlYm54dERkVnJG?=
 =?utf-8?B?ZVUzZ0N0MVJiNDZpb3JyTXZOUlVSV3JwNEhMY3VPcUZINWR2N1E2VkVNN1ln?=
 =?utf-8?B?Ulg4YUxJVDlLenJoc1owaTJhK01LQlJtN2dKNFJibWo3ZmpHSzRyT2pUMkJ5?=
 =?utf-8?B?K3dRczlXQk13UW81dTVkdjI0WGd0b1ZsbmVGMTZXQ3JDMjBLTFMvc0FHdXBj?=
 =?utf-8?B?dEdMcGI1bXdmd3BqNldCQkNIQ3dOQmg1UFVxY2pGb0pSeS9NVmVuOGFMVWh4?=
 =?utf-8?B?K05ReWlIc2pEK25OMVA0Z1ZsaEJ5bjRHajIzUUFQMm16aXdqVTdVSlhNZGFO?=
 =?utf-8?B?RzZjdTl1TUZ1anNlemoyLzJoMUVmdEIzWUxjdWZLbnFqNmRVTFUwamNPTVY4?=
 =?utf-8?B?L1JyZkFtZVhyQjc2eFA3Y1RYVWJrNSs2Nkg2eEFodHY2QmMwdEl2ZDZXaXEv?=
 =?utf-8?B?NG4yTHJVWXdGcVA1OUVvbzJOUzM5Ymp6UTdKOElObDh1ZUtkRDNuNGx4aDdi?=
 =?utf-8?B?RjJrMnIya0EvdHZkRnB6SWptVjNKOENMR2FmQy9pV2RINXd1RGJiVjRlWGV0?=
 =?utf-8?B?ZlBFajAxamsvbTZWUkJMN2FRdVVVOXVBNEN5aklXdUlBWDY2dktBVnNVQVBw?=
 =?utf-8?B?NitNN1I1ODJzUS9Da2l2SzArZlNVS1pESVNXK29aM1dhOHA5djRvUTQ5WHlG?=
 =?utf-8?B?Rnc5NzRtMUZxbVUreld1eC94Rm5jVHB2TG42MDNTajB6Qkdmd0ZTb0ZoMlVK?=
 =?utf-8?B?ald6eWVxMFN4ZS9TeTRQV0JaVW04VTJ1anZZWmNXNUNGVnNaSWJGZEVvVmkw?=
 =?utf-8?B?YkdSaTBXaDFibWErWDBCSmQrM1dLcTRsb0tsZmYySmVMMkdzWkZNcERXN2Uz?=
 =?utf-8?B?S0xjUVBtc1NzdHZHR2RObnRLczFoMHdnMHhnK21Pai83MWhUMXMrSW1VdkFD?=
 =?utf-8?B?QXZRaVBhRVNzeUJGeEVzOFhQd0lCb3VNRlJwSUdmUElLS29DZnlGSGhYZ0tS?=
 =?utf-8?B?OXc0MExsQVl5OEVSa3FtaDV4b0JpR1N6WnVEM3luejhPTmZ4dVpIa1A2bVht?=
 =?utf-8?B?WUVpSGtvcWxHUEVWOWxiT1RuUGlvNEkxbkk4Q0hIcTJ2UXJSRjI3UVArbVZF?=
 =?utf-8?B?MEc3dkMxSVJMTmN1M2J1dFk1SVRsNlI0NHptMi9XaVc5dlhwbUE2RDF5ZXFz?=
 =?utf-8?B?RUtQY01Vc0txM3dnV1BIUzMrQVZLbXF2NHF6MzhnczQvUkFjaVFYZkk4Y3RM?=
 =?utf-8?B?aTdxWUl4VGpRVVNOeXg5Q0FoeGFobGN1OUQ0Uml3Qng1cWloRzRYa0VzQVNw?=
 =?utf-8?B?anhFbmd3WG1GOVRLclNPUkUvQVFpNkVnTlVrbEJ3TWs4TnJueXVHRUdkd0xE?=
 =?utf-8?B?Z1JyU1hwT2ZVQnJmRGFRV25TOThuRGdHQ3ZTbkhJN2hRemZzOWVURFZDa1NP?=
 =?utf-8?B?dEFIbU5naFo1VEhjWnk0VFg5SGxOVjBNV0xNREhQS3JMODlJKy9LTzIybjFY?=
 =?utf-8?B?U3JLZVQrdllPTGpxVm9IekFZZ2pCcW5QR0pFanVjNkdpOG5CbWVkWXFXUGNx?=
 =?utf-8?Q?LW08p8VIQNCCZZuxzA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c1af13-c07a-439a-4345-08d8e792cfba
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 09:15:00.7405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQ2EHsZ6VhhlyQ1tf5p7Tm1Z6iHeGv7xO/b5L4p9bZ1CvkvAHyBBwq/o1p1qeW/uRx3MB19PusOkC6jTofClIL8uVjfh9iO0uNlSk3+qDF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3729
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAxLzJdIG1lZGlhOiB2NGw6IHZzcDE6IEZpeCBicnUgbnVsbCBwb2ludGVyIGFjY2Vz
cw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFRodSwgTWFyIDExLCAyMDIxIGF0IDA3OjE1OjAx
QU0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJd
IG1lZGlhOiB2NGw6IHZzcDE6IEZpeCBicnUgbnVsbCBwb2ludGVyDQo+ID4gPiBhY2Nlc3MNCj4g
PiA+DQo+ID4gPiBIaSBCaWp1LA0KPiA+ID4NCj4gPiA+IE9uIDAxLzAzLzIwMjEgMTI6MDgsIEJp
anUgRGFzIHdyb3RlOg0KPiA+ID4gPiBSWi9HMkwgU29DIGhhcyBvbmx5IEJSUy4gVGhpcyBwYXRj
aCBmaXhlcyBudWxsIHBvaW50ZXIgYWNjZXNzLHdoZW4NCj4gPiA+ID4gb25seSBCUlMgaXMgZW5h
YmxlZC4NCj4gPiA+ID4NCj4gPiA+ID4gRml4ZXM6IGNiYjdmYTQ5Yzc0NjYoIm1lZGlhOiB2NGw6
IHZzcDE6IFJlbmFtZSBCUlUgdG8gQlJ4IikNCj4gDQo+IEdpdmVuIHRoYXQgUlovRzJMIGlzbid0
IHN1cHBvcnRlZCBpbiBtYWlubGluZSwgdGhpcyBpcyBoYXJkbHkgYSBmaXgsIGlzIGl0DQo+ID8N
Cg0KSSBhZ3JlZSBSWi9HMkwgaXMgYSBuZXcgU29DLg0KDQpQbGVhc2Ugc2VlIG15IGNvbW1lbnRz
IGZvciBvdGhlciBwYXRjaC4gSSBoYXZlIGFkZGVkIGZpeGVzIHRhZyBiYXNlZCBvbiBwbHVnZ2Fi
bGUgZmVhdHVyZSBvbiBWU1AgZHJpdmVyLg0KDQpJZiB3ZSBoYXZlIEJSUyBhbmQgQlJVLCB3ZSBj
YW4gc2VsZWN0IGVpdGhlciBCUlMgb3IgQlJVLiBGb3IgZWc6LSBWU1BETCBpbiBSLUNhciBIMy9I
My1OL00zLU4gYW5kIGFsc28gUi1DYXIgVjNNL1YzSCB3ZSBoYXZlIGJvdGggQlJTIGFuZCBCUlUu
IFNpbmNlIGJvdGggYXJlIHByZXNlbnQgb24gdGhpcyBTb0MncywgaXQgd29uJ3QgdHJpZ2dlciB0
aGUgbnVsbCBwb2ludGVyIGlzc3VlLiANCg0KQnV0IGFzIG5ldyBTb0MncyBsaWtlIFJaL0cyTCBo
YXZlIG9ubHkgQlJTLg0KDQo+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS92c3AxL3ZzcDFfZHJtLmMgfCAyICstDQo+ID4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdnNwMS92c3AxX2RybS5jDQo+ID4gPiA+
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92c3AxL3ZzcDFfZHJtLmMNCj4gPiA+ID4gaW5kZXgg
ODZkNWUzZjRiMWZmLi5mNmQyZjQ3YTQwNTggMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vdnNwMS92c3AxX2RybS5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vdnNwMS92c3AxX2RybS5jDQo+ID4gPiA+IEBAIC0yNDUsNyArMjQ1LDcgQEAg
c3RhdGljIGludCB2c3AxX2R1X3BpcGVsaW5lX3NldHVwX2JyeChzdHJ1Y3QNCj4gPiA+IHZzcDFf
ZGV2aWNlICp2c3AxLA0KPiA+ID4gPiAgCQlicnggPSAmdnNwMS0+YnJ1LT5lbnRpdHk7DQo+ID4g
PiA+ICAJZWxzZSBpZiAocGlwZS0+YnJ4ICYmICFkcm1fcGlwZS0+Zm9yY2VfYnJ4X3JlbGVhc2Up
DQo+ID4gPiA+ICAJCWJyeCA9IHBpcGUtPmJyeDsNCj4gPiA+ID4gLQllbHNlIGlmICghdnNwMS0+
YnJ1LT5lbnRpdHkucGlwZSkNCj4gPiA+ID4gKwllbHNlIGlmICh2c3AxX2ZlYXR1cmUodnNwMSwg
VlNQMV9IQVNfQlJVKSAmJg0KPiA+ID4gPiArIXZzcDEtPmJydS0+ZW50aXR5LnBpcGUpDQo+ID4g
PiA+ICAJCWJyeCA9ICZ2c3AxLT5icnUtPmVudGl0eTsNCj4gPiA+ID4gIAllbHNlDQo+ID4gPiA+
ICAJCWJyeCA9ICZ2c3AxLT5icnMtPmVudGl0eTsNCj4gPiA+DQo+ID4gPg0KPiA+ID4gVGhlIGNv
bW1lbnRzIGhlcmUgZGVzY3JpYmUgdGhhdCB0aGUgY2hvaWNlIHRvIHN0YXJ0IGF0IHRoZSBCUlUg
aXMNCj4gPiA+IGFyYml0cmFyeSwgc28gaWYgd2UgY291bGQgY29uZmlybSB0aGF0IHRoZXJlIHdp
bGwgYWx3YXlzIGJlIGEgQlJTDQo+ID4gPiBvdGhlcndpc2UsIHdlIGNvdWxkIHN3YXAgdGhvc2Ug
dG8gc2F2ZSBhbiBleHRyYSBmZWF0dXJlIGNoZWNrLg0KPiA+DQo+ID4gQXMgbG9uZyBhcyB3ZSBh
cmUgc3VwcG9ydGluZyBjb21wb3NpdGlvbihNdWx0aXBsZSBpbnB1dHMgd2l0aCBCbGVuZA0KPiA+
IGFuZCBSYXN0ZXIgb3BlcmF0aW9ucykgVGhlcmUgd2lsbCBiZSBlaXRoZXIgQlJVIG9yIEJSUyBv
ciBib3RoIGluDQo+ID4gUi1DYXIgR2VuM3xSWi9HMiBTb0Mncy4gQ3VycmVudGx5IHRoaXMgaXMg
dGhlIGNhc2Ugd2l0aCBhbGwgU29DIHZhcmlhbnQNCj4gb2YgdGhpcyBmYW1pbGllcy4NCj4gDQo+
IEdpdmVuIHRoYXQgdGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCB2c3AxX2R1X3BpcGVsaW5lX3NldHVw
X2JyeCgpLCBJIHRoaW5rIHdlDQo+IGNhbiBhc3N1bWUgdGhlcmUgd2lsbCBiZSBlaXRoZXIgYSBC
UlUgb3IgYSBCUlMgOi0pDQo+IA0KPiBIb3cgbWFueSBSUEYgaW5zdGFuY2VzIGRvZXMgdGhlIFJH
L0cyTCBWU1BEIGhhdmUgPw0KDQoyIFJQRiwgMVdQRiAsIDEgQlJTLCAxIExVVCBhbmQgMSBMSUYN
Cg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ID4gQnV0IGFzIHdlIGhhdmUgYm90aCB2c3AxX2Zl
YXR1cmUodnNwMSwgVlNQMV9IQVNfQlJVKSBhbmQNCj4gPiA+IHZzcDFfZmVhdHVyZSh2c3AxLCBW
U1AxX0hBU19CUlMpLCBJIGRvbid0IHRoaW5rIHRoYXQncyB0aGUgY2FzZS4NCj4gPiA+DQo+ID4g
PiBJJ2QgYWxtb3N0IHdhbnQgdG8gY2hlY2sgZm9yIHZzcDFfZmVhdHVyZSh2c3AxLCBWU1AxX0hB
U19CUlMpIG9uIHRoZQ0KPiA+ID4gYnJzLT5lbnRpdHkgbGluZSB0byBrZWVwIHRoZSBzeW1tZXRy
eSAuLi4gYnV0IGl0IHdvdWxkbid0IGJlIG5lZWRlZCwNCj4gPiA+IGJycy0+YXMNCj4gPiA+IGl0
IHNob3VsZCBmYWxsIHRocm91Z2guIElmIHRoZXJlIGlzbid0IGEgQlJTIHRoZXJlIG11c3QgYmUg
YSBCUlUgb3INCj4gPiA+IHdlIHdvdWxkbid0IGJlIHNldHRpbmcgdXAgYSBicnggaW4gdGhlIGZp
cnN0IHBsYWNlIDstKQ0KPiA+ID4NCj4gPiA+IFNvIEkgdGhpbmsgd2hhdCB5b3UgaGF2ZSBpcyBn
b29kLg0KPiA+ID4NCj4gPiA+IFJldmlld2VkLWJ5OiBLaWVyYW4gQmluZ2hhbQ0KPiA+ID4gPGtp
ZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gDQo+IC0tDQo+IFJlZ2Fy
ZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
