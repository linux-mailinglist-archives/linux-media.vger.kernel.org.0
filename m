Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDFFC33AD44
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 09:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhCOIWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 04:22:16 -0400
Received: from mail-eopbgr1400095.outbound.protection.outlook.com ([40.107.140.95]:40360
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230091AbhCOIVt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 04:21:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+LeF6GUqVfTvSmpsmhtL4n9svgj1LjhiZ0zI2Yaa/eah5AlAqI3zPuh/7Nvh7G6DZzVDfLjXZn2lCzBiFGk97FYH1VdCs+Shg16VR+uXSiA/a6yNkIpPjAaQNBI2aMZNOUNdrGpbXodClfRmHnoyZnSMnYXkLUXmhLEYJUSfiqEulO8h64bnewUq+9ciKdJR05izNDY6deH0aDDdhJoUg+7C0LGklMCAtWtIXppgvodUPENN9uDob31YbHhfyfrugCKJyTvlzf5TCENCyusblP4Dkx8vgyVnJgVmZT9zm5DuWsT4E4e8z01UY52MsyQgCnL4jjZM9iXwgtOH2jQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/g2J+c0dwiVMzWG5RFWUTr1LwBuE8JtseLUaHnAq9lQ=;
 b=C3oefmLqJptMsQNmr7cIwdbQAkyzfpu1cUYxDZ8o8PiXXozPqvduJVGDigU6AGt3FeF2I9hhDfvNLaP4yCi7Jy/ywHYqGHowHxbg2EXp5XSPdrDZfLEZrkvyySXD1hbe2MpS+0ShwrlTzYeeOC3Jdu0GCHwA8Lwn1HwI/uHPkUZm9J8CwibpCdneBVoaoXRQAvz8sHUcpskIU0PM6DIcefEj+tos0+oE1TBKgO4e5g+v/wLQTYih0fw/B644ZN511ONVyLJ0EKf2zlQA4u+fEsgMGmoBSL4u2Tgn1DxagjCo/03L6A6oozkMBTw2XKaasMS6oNn799IwJCigjIU9Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/g2J+c0dwiVMzWG5RFWUTr1LwBuE8JtseLUaHnAq9lQ=;
 b=OOWG16JJuWOHAV4laepuPh9zpQvfs1x/Vok5LSIiq/IgwRiE/ynqutlMWMczzSAGer2nTfTfMKyjBpzcpUXb4H86lU5ls6THv7du0Lz8AVi+dp+I9mNavcCNOwGR/LHMYEmuYF+z+uu7y8EF0F4nEEuCZhRKqU1Tatj0jx5FWzk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3205.jpnprd01.prod.outlook.com (2603:1096:604:1f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 08:21:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::a1c6:97eb:7268:c2b3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::a1c6:97eb:7268:c2b3%4]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 08:21:38 +0000
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
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: RE: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
Thread-Topic: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
Thread-Index: AQHXDpOdmMw2sSB0m0arhJWcvCVJPKp6wHQAgAKKpxCAAA4OgIAAAK+AgAcjlICAAEyqwA==
Date:   Mon, 15 Mar 2021 08:21:38 +0000
Message-ID: <OS0PR01MB59224694123B5D55F742C2CF866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
 <20210301120828.6945-3-biju.das.jz@bp.renesas.com>
 <133f8b63-3b84-c60a-725d-30b8d6df35dd@ideasonboard.com>
 <OS0PR01MB5922BE9F9D151623773CF53286919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <56c2d53e-8d1f-5b84-1480-5965ae9cbae2@ideasonboard.com>
 <OS0PR01MB5922ABCA7A782950B63DCA6686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YE7XwWVZeOZ+HsYx@pendragon.ideasonboard.com>
In-Reply-To: <YE7XwWVZeOZ+HsYx@pendragon.ideasonboard.com>
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
x-ms-office365-filtering-correlation-id: 2e4d11c5-2c1e-414c-47a1-08d8e78b5ae3
x-ms-traffictypediagnostic: OSBPR01MB3205:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB3205D41B72DBA97748D3E345866C9@OSBPR01MB3205.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i1zqgH4ACnsqNg3gglotnljBOdMTsK5pN9OAK6/pdqGsS8aRlHeyKiZF2gTpaWe1gjqlkLsU6SlafsjxfJbg//nEZNJJTZyU2mtDL+hdv1jkBlzltH+6efDaKeMf+pvZK1rVBMb9cWXSaQlgUUKjTrEbXH1VrinMUzoaaK/GOrCCaadI8oG9s+T63aloCQqzV8M52XuEGxq3hazywE6geXWT7ni4mBE9fNddqaFm1+O9pm0+iWPLC6ZSEvlau5YZB/72xpAswqH5zBf8cruz7DXL1im55s89cnraiSAjB1XoIKE5krCjuHcnVO3Ocw1T2sLbKPzYRHqTxnEhXeapS+y9v2wWDZ97Rl1npjv2RKbFu0kVAlTN13EDIYfG0x3OAfNjozqrNxTSwxepGjEwzQEmLQ7GoyZghR1Pj25PYpEFrWNKQ9VKPmQggnkt4Ht6EwlzXJgFKk/dqB5mI4Mr7Smg5sA4c7qhwUCZ2A3lIl0UuzL9C8SV9g8Qc4eExTcWkEcYPjkopFZJpgMi88CZ7AUTDfjZFBid2+/CYCwoSkVf9chQtN6Np9f7mFRZy7r0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39850400004)(2906002)(54906003)(8936002)(6506007)(186003)(83380400001)(316002)(86362001)(7696005)(8676002)(53546011)(6916009)(71200400001)(26005)(66946007)(64756008)(66476007)(66556008)(76116006)(52536014)(9686003)(55016002)(66446008)(4326008)(33656002)(478600001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?M3FsSGc0dVBzZVhsakpBU3poNURjNmxKU004YytvWGpxbEVpRVhLM3ZQU1Y3?=
 =?utf-8?B?Z090MUtveDV1ZmFGdVBHK1NUV2NySWxrbVFuV08zS1gyT1ViZHZMdEF5aVlY?=
 =?utf-8?B?SWlIbGQ4V3JIKytqREh4WWNEZjIwdVdJSEtTSHpJQW9EcklxUkh1cjFDRlEz?=
 =?utf-8?B?cWVyRC9nQllWQkU4QTliMG1ydmFaY3gzamdBbFIvNUI3WXdqVWpjak1DaEl5?=
 =?utf-8?B?dEZua3pndjl4Z3RnL0p2cmdOL3JPT0tNbE5XenVpNEFDZXNRbFRSUVY2bGpv?=
 =?utf-8?B?eUU5MkFWdnJaUkI2a0tnaFRMYURVc1kvYjB5RFlMckNMK3J0U25iN3hQZGoz?=
 =?utf-8?B?UGFncFRKL2ovVVgwYUxaVXNySW5Sa2daU1pJUG5uWDQ4alpyV0lLRmZEcGRG?=
 =?utf-8?B?U3FEVVpXWmJZcGpncUNSSVVTMDltQXFkMitDTjBHckh2K05nSlZEaTl3K1Zl?=
 =?utf-8?B?blZkVGorY1Q0R0dpRnBGeDIwdCtkaGJsVlI3djV5T1JkdG5vQVc3Z3BYK1gx?=
 =?utf-8?B?U2U4US93K1owVndUemlkS3RHSTMvWFkyS3htcUJ3VElackJ1dVR5OUNhYU9m?=
 =?utf-8?B?WGFpd3RzKytTWHZsZFdNQ0liTDVQSE1pQVJEMVVjMHkrNXpsRzJUdTAzbUhi?=
 =?utf-8?B?L0Q2VHMyWXJsTGRwTllISXlLcjVNTHdTVHNTT2RsTkNqVVdmT3MwdmJXMEpE?=
 =?utf-8?B?Wk1xdEVjYWVpMFJTYnJ2b2xxYk16aFZiZnhBUVRPQUp0VEZBL2Vib0dZWDN5?=
 =?utf-8?B?Y0sxWTVZMktYR2QrNVREQkw2VjlJc3hJNVB6YjFaM2xrTUhyYUtxVG9nZUNH?=
 =?utf-8?B?RGppM2VQN2xBeXZRcENocGM5K1FYeHlBd3gyVkdyNURpbXZsRlBTU1JZOCtE?=
 =?utf-8?B?THVoVWgwRUM1NHFWVFFQREF4azhQWjh3MWEzVEpOT1hRK2hGYzhNUXExa3l0?=
 =?utf-8?B?eDl1QmRHM1NKb05EYkU4cTdlSmExWGxVc1hBR3NJUzJ0Z3VXNEdkNncyYzlj?=
 =?utf-8?B?cVBmNUtOSmpmczNFczNBZ1NpWUJEY1pZSS9uRjlidkVubHEvb1lsSjBnUzVz?=
 =?utf-8?B?RllKRHhJN1V6K0hqYy9PU2JlWVMwM2YwN2xCbUNJdE45cFNUZ3pST0YvQ1Zh?=
 =?utf-8?B?c1hnL0E5Nmd3VXBOSytuWGJPZTdSMnJQVVFrUGgrZEE1UjZyVFgxN0VGRkhp?=
 =?utf-8?B?dGtLdkExcGdkbzRKVjJhU0MweWZKWWFVU2dWbFpEdFJVS0poK0I5cklMRGRM?=
 =?utf-8?B?cTVUdVlpT2x2cXlKZnpJeXdBb1BRU0xnemE4blVINHF6U3pjcWtXTlgrTGJp?=
 =?utf-8?B?QkNNZldBVVVCaFRTYjVVbGdkYktab1FrRzBJTVBlLzJKMzFYTHdSMEk4S00y?=
 =?utf-8?B?SC9zeWNFa2JxREhSbi83Q0Vvcmp6b2JHbzE3ZUdIMTl1RkJzbmszVUw5NHdQ?=
 =?utf-8?B?TlFMNUV1M01tdk9ISHdGU0NsT0lCOEtoU21yMmdwN1h4VFVhQmVZcXVrb1lY?=
 =?utf-8?B?Z0FHMHF3cE43cHY0Y3hPSFh6TmY5R0YzejFUTmh5QllSeUFjN0lMemE2eGd4?=
 =?utf-8?B?cEcwZElOQU5OQS85VkptTFU4WmZWWXhlMDg2QWlBNVV0Y2ZaQ2kycGpkeFVN?=
 =?utf-8?B?L2lLM0drM2RsSVdNRjBlV1JlOE5la2lxMTQ0U3dreE4zVTZGUE1VVGxYMWJo?=
 =?utf-8?B?NHRXMEUvTHJSN0Vac2Z5RVRDL01YS3NncG5HMEwwMVZKVzJUSzFPNEorVkVw?=
 =?utf-8?Q?+b6tDglteDLx/pDpTU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4d11c5-2c1e-414c-47a1-08d8e78b5ae3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 08:21:38.2388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gMBm1Ras2tKKtClvHFZ7LzGPcYn3Lq+D71+ur3zNYqsYqnkl/hs7Axfqg/LVOsnsD7rk3iSjoLnovwPmcdMQ2lyZyODV5aJddiUve6gftI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3205
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiAxNSBNYXJjaCAyMDIxIDAzOjQzDQo+IFRvOiBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IENjOiBraWVyYW4uYmluZ2hh
bStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb207IE1hdXJvIENhcnZhbGhvIENoZWhhYg0KPiA8bWNo
ZWhhYkBrZXJuZWwub3JnPjsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1yZW5l
c2FzLQ0KPiBzb2NAdmdlci5rZXJuZWwub3JnOyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3Jl
bmVzYXNAZ2xpZGVyLmJlPjsgQ2hyaXMNCj4gUGF0ZXJzb24gPENocmlzLlBhdGVyc29uMkByZW5l
c2FzLmNvbT47IEJpanUgRGFzDQo+IDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT47IFByYWJoYWth
ciBNYWhhZGV2IExhZCA8cHJhYmhha2FyLm1haGFkZXYtDQo+IGxhZC5yakBicC5yZW5lc2FzLmNv
bT47IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDIvMl0gbWVkaWE6IHY0bDogdnNwMTogRml4IHVpZiBudWxsIHBvaW50ZXIgYWNj
ZXNzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBNYXIgMTAsIDIwMjEgYXQgMDI6NTA6
MjNQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiBPbiAxMC8wMy8yMDIxIDEzOjU2LCBC
aWp1IERhcyB3cm90ZToNCj4gPiA+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4gPiA+
PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gbWVkaWE6IHY0bDogdnNwMTogRml4IHVpZiBudWxs
IHBvaW50ZXINCj4gPiA+ID4+IGFjY2Vzcw0KPiA+ID4gPj4NCj4gPiA+ID4+IEhpIEJpanUsDQo+
ID4gPiA+Pg0KPiA+ID4gPj4gT24gMDEvMDMvMjAyMSAxMjowOCwgQmlqdSBEYXMgd3JvdGU6DQo+
ID4gPiA+Pj4gUlovRzJMIFNvQyBoYXMgbm8gVUlGLiBUaGlzIHBhdGNoIGZpeGVzIG51bGwgcG9p
bnRlciBhY2Nlc3MsDQo+ID4gPiA+Pj4gd2hlbiBVSUYgbW9kdWxlIGlzIG5vdCB1c2VkLg0KPiA+
ID4gPj4+DQo+ID4gPiA+Pj4gRml4ZXM6IDVlODI0Zjk4OWU2ZTgoIm1lZGlhOiB2NGw6IHZzcDE6
IEludGVncmF0ZSBESVNDT00gaW4NCj4gPiA+ID4+PiBkaXNwbGF5DQo+ID4gPiA+Pj4gcGlwZWxp
bmUiKQ0KPiA+ID4gPj4+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPiA+ID4+PiAtLS0NCj4gPiA+ID4+PiAgZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS92c3AxL3ZzcDFfZHJtLmMgfCA0ICsrLS0NCj4gPiA+ID4+PiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+ID4+Pg0KPiA+ID4gPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZzcDEvdnNwMV9kcm0uYw0KPiA+ID4g
Pj4+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92c3AxL3ZzcDFfZHJtLmMNCj4gPiA+ID4+PiBp
bmRleCBmNmQyZjQ3YTQwNTguLjA2Zjc0ZDQxMDk3MyAxMDA2NDQNCj4gPiA+ID4+PiAtLS0gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZzcDEvdnNwMV9kcm0uYw0KPiA+ID4gPj4+ICsrKyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vdnNwMS92c3AxX2RybS5jDQo+ID4gPiA+Pj4gQEAgLTQ2Miw5
ICs0NjIsOSBAQCBzdGF0aWMgaW50DQo+ID4gPiA+Pj4gdnNwMV9kdV9waXBlbGluZV9zZXR1cF9p
bnB1dHMoc3RydWN0DQo+ID4gPiA+Pj4gdnNwMV9kZXZpY2UgKnZzcDEsDQo+ID4gPiA+Pg0KPiA+
ID4gPj4NCj4gPiA+ID4+IFRoaXMgbG9va3MgbGlrZSBpdCBjb21wbGljYXRlcyB0aGVzZSBjb25k
aXRpb25hbHMgbW9yZSB0aGFuIHdlDQo+ID4gPiA+PiBwZXJoYXBzIG5lZWQgdG8uDQo+ID4gPiA+
Pg0KPiA+ID4gPj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgYWRkaW5nIHNvbWV0aGluZyBhYm92
ZSB0aGUgYmxvY2sgY29tbWVudA0KPiBoZXJlPzoNCj4gPiA+ID4NCj4gPiA+ID4gSXQgaXMgbXVj
aCBiZXR0ZXIuDQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgcGF0Y2ggaXMgYWNjZXB0ZWQgaW4gbWVk
aWEgdHJlZVsxXS4gU28gbm90IHN1cmUsIHNob3VsZCBJDQo+ID4gPiA+IHNlbmQgYSBmb2xsb3cg
dXAgcGF0Y2ggYXMgb3B0aW1pemF0aW9uIG9yIGRyb3AgdGhpcyBwYXRjaCBhbmQgc2VuZA0KPiBu
ZXcgb25lLg0KPiA+ID4NCj4gPiA+IE9oLCBJIGRpZG4ndCByZWFsaXNlIHRoZXNlIHdlcmUgaW4g
YWxyZWFkeS4gU29ycnksIEkgZGlkbid0IHNlZSBhbnkNCj4gPiA+IHJldmlldyBvbiB0aGUgbGlz
dCwgYW5kIGl0IHdhcyB0aGUgZWFybGllc3QgSSBoYWQgZ290IHRvIHRoZW0uDQo+ID4gPg0KPiA+
ID4gPiBQbGVhc2Ugc3VnZ2VzdC4NCj4gPiA+DQo+ID4gPiBVcCB0byB5b3UsIEkgZG9uJ3QgdGhp
bmsgdGhpcyB3b3VsZCBnZXQgZHJvcHBlZCBub3cgaXQncyBpbnRlZ3JhdGVkLg0KPiA+ID4gSXQn
cyBpbiwgc28gaWYgeW91IHdhbnQgdG8gdXBkYXRlIG9uIHRvcCBJIGJlbGlldmUgdGhhdCdzIGZp
bmUuDQo+ID4NCj4gPiBPSywgV2lsbCBzZW5kIGZvbGxvdyB1cCBwYXRjaCBhcyBvcHRpbWl6YXRp
b24uDQo+IA0KPiBUaGF0IHdvdWxkIGJlIG5pY2UuDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoaXMg
cGF0Y2ggc2hvdWxkIGhhdmUgYmVlbiBmYXN0LXRyYWNrZWQgYXMgYSBmaXgsIGFzIFJaL0cyTA0K
PiBpc24ndCBzdXBwb3J0ZWQgaW4gbWFpbmxpbmUgeWV0IGFzIGZhciBhcyBJIGNhbiB0ZWxsLg0K
DQoNClBsZWFzZSBjb3JyZWN0IG1lLCBpZiBJIGFtIHdyb25nLiBXZSBoYXZlIHBsdWdnYWJsZSBt
b2R1bGVzIGluIFZTUCBhbmQgd2l0aCByb3V0aW5nDQpSZWdpc3RlciB3ZSBjYW4gYWNoaWV2ZSBh
bnkgY29tYmluYXRpb24gd2l0aCB0aGUgVlNQIGRyaXZlciB3ZSBoYXZlLiANCg0KSWYgaXQgaXMg
dGhlIGNhc2UsIGl0IGlzIGEgYnVnIHdoaWNoIGlzIGZhc3QtdHJhY2tlZCBhcyBhIGZpeC4gT3Ro
ZXJ3aXNlKGllLCBkcml2ZXIgZG9lc24ndCBoYXZlIGZsZXhpYmlsaXR5IHRvIHN1cHBvcnQgcGx1
Z2dhYmxlIGZlYXR1cmUpIEkgYW0gYWdyZWVpbmcgd2l0aCB5b3VyIHN0YXRlbWVudC4NCg0KQ2hl
ZXJzLA0KQmlqdQ0KDQo+IEhhbnMsIG5leHQgdGltZSwgY291bGQgd2UgZ2V0IGEgbm90aWZpY2F0
aW9uIGluc3RlYWQgb2YgYSBzaWxlbnQgbWVyZ2UgPw0KPiANCj4gPiA+ID4+IAlpZiAoIWRybV9w
aXBlLT51aWYpDQo+ID4gPiA+PiAJCXJldHVybiAwOw0KPiA+ID4gPj4NCj4gPiA+ID4+DQo+ID4g
PiA+Pj4gIAkgKiBtYWtlIHN1cmUgaXQgaXMgcHJlc2VudCBpbiB0aGUgcGlwZWxpbmUncyBsaXN0
IG9mIGVudGl0aWVzDQo+IGlmIGl0DQo+ID4gPiA+Pj4gIAkgKiB3YXNuJ3QgYWxyZWFkeS4NCj4g
PiA+ID4+PiAgCSAqLw0KPiA+ID4gPj4+IC0JaWYgKCF1c2VfdWlmKSB7DQo+ID4gPiA+Pj4gKwlp
ZiAoZHJtX3BpcGUtPnVpZiAmJiAhdXNlX3VpZikgew0KPiA+ID4gPj4+ICAJCWRybV9waXBlLT51
aWYtPnBpcGUgPSBOVUxMOw0KPiA+ID4gPj4+IC0JfSBlbHNlIGlmICghZHJtX3BpcGUtPnVpZi0+
cGlwZSkgew0KPiA+ID4gPj4+ICsJfSBlbHNlIGlmIChkcm1fcGlwZS0+dWlmICYmICFkcm1fcGlw
ZS0+dWlmLT5waXBlKSB7Pg0KPiA+ID4gPj4gCWRybV9waXBlLT51aWYtPnBpcGUgPSBwaXBlOw0K
PiA+ID4gPj4+ICAJCWxpc3RfYWRkX3RhaWwoJmRybV9waXBlLT51aWYtPmxpc3RfcGlwZSwgJnBp
cGUtDQo+ID5lbnRpdGllcyk7DQo+ID4gPiA+Pj4gIAl9DQo+ID4gPiA+Pj4NCj4gDQo+IC0tDQo+
IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
