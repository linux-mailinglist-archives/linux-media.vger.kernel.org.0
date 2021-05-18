Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0732F3872E9
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 09:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346975AbhERHOx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 03:14:53 -0400
Received: from mail-eopbgr80078.outbound.protection.outlook.com ([40.107.8.78]:22400
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244514AbhERHOx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 03:14:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElsHbCoEIplQ15Gq1hFlq9ZVkzNvXgVbNzCU4yNUqe5vjmZtch8Nd+OoMTnL8Vo9j3zhIaems+XyayhEQ/I9pJuTZhndQQEb7J5wRdhdiP8CNEixcwP0DYdj9kMtSPr9EHMjtguywx277CebC7J3mOrg05fYPDbIBDSGqPKHazmNqxyj25TNqbcIiS3AiygOnbhHitidsWy450ebXc3kOLntbmdNHj1cI51C7Fe8cd7r5bx0pWnchDyUH2oB7boFv94Cjgls8WQQ/uapmHu1UGGRM/PcYDzF1PHZwLB4ZKBWOR8Cb35brdFbqtwc0CET1QYYWJ7SGCF+51rrBWclBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YhofY1DpDIXm66XjjqdguuB6sh8ZQUXv0Dr+Qi7kgM=;
 b=HxJZUiE8u9xHS5qcBrma0xOMfCvuQCMkzuGwvIQhX9D4YaSCm3zGYj1AmjjSnZ7k+seXfelklElM4pfTb1ICbuiG1ZXlVwkw2wIyv/wGPo3+UW7gQBwMWkj+zktyKOTUwGCv4jrZev15tVXR6OSysA9Jid6zY90c6dMQJ5ISUqK1hYanAP9GDz1XdRZSyp+eCdnpBGH1e5EFuFrIB8J0DUGHS77H8UU+rLxyrMJFwv3D9DbfEhkdXwZjF/tKPO854ptN8Tpt/O9WKEZz6qcS2JKHtfuhSong0+7GNq6LYfhWLCfngtiQdYft3YOmE6SLgtndkfjflpYnDR1STrEdmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YhofY1DpDIXm66XjjqdguuB6sh8ZQUXv0Dr+Qi7kgM=;
 b=lbEKF1AoIh88/qb5/b4dQOqjBWn3RWe1FN1/UsWm5WK2+TTXl6SQvteqbKV+BuEWcrleL5c9Q8V6iZuC6aiBD3gn7qd3FyrTZOHzZlLgDM20P6QSz/VPy08HZhlWbqpl4tKCsPcQ5IsY9H5sWNfDTYPimN/fmHc3ujZb2Uc8x3A=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AS8PR04MB8069.eurprd04.prod.outlook.com (2603:10a6:20b:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 07:13:32 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 07:13:32 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>
CC:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Peng Fan <peng.fan@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: RE: [PATCH v11] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Topic: [PATCH v11] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Index: AQHXOClx/EGs7P4PmkKRDSOc1GkfSqrhJaCAgAHAwICABhMssA==
Date:   Tue, 18 May 2021 07:13:32 +0000
Message-ID: <AM6PR04MB4966AD2DAA6C27F714349F9F802C9@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210423101414.20068-1-mirela.rabulea@oss.nxp.com>
 <20210513073832.GS3425@dragon> <YJ5P6ZdAMIsYrTMX@ryzen.lan>
In-Reply-To: <YJ5P6ZdAMIsYrTMX@ryzen.lan>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d5fcedb-3d87-464c-efd5-08d919cc721d
x-ms-traffictypediagnostic: AS8PR04MB8069:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB80697D0474EB793C26BA8597802C9@AS8PR04MB8069.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uUVl2DHgDnhMvuuP4IVwwrv4FS3ofpnPK+qUJrf7093RKNkD4leABTjrjSbTSV0MPgnf8UWLUgSAKz9B1JhnUzAsOJCEe3z4XWwkabIztamSl7LFyQMipl0fyXOd/XlJ2mlNS7AwCLKUq2Bh6bqCjZsVPtYLS7UnxfWY+YdEC6TOZWka7kJ40JL7JN3qpAkE2/laxspyLvWIHU14ZbZM4FGzUEQBtHy3igJJBAOFZg9jwYvWG9x2DaJ/2jii24EMln+lt6xH2qcYr+rXPIRKUYlc+p3Cw1vXQdsUaHDoIXVPomtarZob7vC0hXlwy/7NzANHrJi4KXGN/lhn5RiPCt04z3gy3JA2ydFKEB9WWhJFrxsRzMIykikZTIiN/eZW6imnFvtEq//N5HjYldcm32zj6ux9wJ0R9hCiQ8RnnSwd725a9UDqo3lsRZ8yJFunRinGOf+3xVd2P6RWcsHZqkao8aIHCghG/JAzgdm36XhAW2569+Bgr+sAp7IO2ywwhad2schJffEHXFHtBPR1lHhaTxkRx/bAT0JPe/lwHIxl3fenDn58S5OwJdjwoFDSiiXzxeUIidI8wEUdc8QutrYvLth7B6kIZ1gqrsO4ISL7hp1wqWCPW2BV3cXWe61p+SBK3Pzk8bZ26I3uQKOlBQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(4326008)(8676002)(8936002)(55016002)(7696005)(54906003)(316002)(9686003)(6506007)(53546011)(2906002)(186003)(26005)(86362001)(44832011)(38100700002)(76116006)(71200400001)(7416002)(122000001)(66946007)(83380400001)(66556008)(64756008)(66476007)(66446008)(5660300002)(478600001)(33656002)(52536014)(110136005)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Q3dRRTFnK2hsUkZ1dTNnblF4SFZRaGcxTXpLemlWd1JRN2MwcnVYY0JRcS9z?=
 =?utf-8?B?dldwdlYzV0pHWXpLVjA4M2p3V0VWT2ppbit5c0RtaElOMXlSdCtnQXJCWVFy?=
 =?utf-8?B?QXdyKzJIYWVmK25jVlU2ZW1OT1ZQaG15SlBkMXkxZzVYTGJ4YzAvSzAyZERL?=
 =?utf-8?B?eVVLLy9GWFUrWStvN1MreHpESlQ1dTNkbFErSFY5VFZ4amVTMzl2WTc1WHUv?=
 =?utf-8?B?RXVSa0Q4UkhwMHpRNWxFcllrVlpoQUQ0dTZmUDdtSHFTU2lGdWZHcENreVNK?=
 =?utf-8?B?UWtNaXV3cGRTSEJTN242STBmSHcvanhpL2g5NzgwamVpWGZNZnhTdTUzM204?=
 =?utf-8?B?TkI1ZzE5YVZpaWk0WTBGUXEvdWRhbTI1a2FTTG8vanNvbHIwR0hNa0tLZC9p?=
 =?utf-8?B?QTRGRkd6Qk9zUngxSEYxMSt3UDlKOXBXYmNrL0htZXpFdUJFTUlWa0dMd0Rj?=
 =?utf-8?B?NGRUMlpiSmVZeUFMSTk1MVh2V2RZZEo5Snd2OGp6a3M0VXl3LzZEMW9qSk1Q?=
 =?utf-8?B?VUkyT2txTkJRZTByRU1PUUp0dWpBQytzd2MweitSQktqVWZBV21vUnhPeU1J?=
 =?utf-8?B?MEFIeWNNL0p0RnNrNmJlQjIzVVBUNEtmMGNXMHFZZVNkbDBvVlhJU09vcEI3?=
 =?utf-8?B?dTAyNjJRYnpWYng1VWlqMUwrbGIxRERTdjhVYU1SWjVtR21NbzM2S1JjdW50?=
 =?utf-8?B?WUJZVEhLWWw0U2FuVUt2ZlRkVVBCS2lzOUJwbER1WTVza3NUWDhFMzZQK2ho?=
 =?utf-8?B?eUhRK3F4OWE5MSt6OC9RQ08wRjJDUkpZZ0htc1p5M1lUTTc4bitPbmlqVGcy?=
 =?utf-8?B?S3hjR3hKcVpyMWMxbnhVcmJOY083OGdTL0ZmWU55YTgzMlBzTWI5cURwMGs2?=
 =?utf-8?B?REJNOVpvcld0UkNLdEVORGdsYjl0ak0rSjJPU3pBdGl6SlhqdGtCcXhpV2t2?=
 =?utf-8?B?ZnluT3FMMDdwQzk3ZXoyWnZtZ08rbXlFek5BWXk4dkhHUXh5WmRydHd5OXgr?=
 =?utf-8?B?Ym5rcXMxUDVFSG1lbE5pWk5FbkRGWGQzQXYzV2UxOElPVUFIWlk4WGlIR1ZR?=
 =?utf-8?B?VFh3WVdtZXVYNlFETlR2YURJemV6WExuRkhRZDVaZDR5MkhaUVJKazhwVktY?=
 =?utf-8?B?L2xLcmZUYkJTQXBCbms2SjBZemsrK0hKVVZtenB6aDRoMUZlYm9mM3Z0cFRI?=
 =?utf-8?B?bDcvcDc0ekkyTkl4RHBtWFNJeGZST0QxdG8vMzBBRkcrZUdpbmxHMkt5OXMr?=
 =?utf-8?B?WXhCL2Fqc3M0SnpTYWJ5UDJoMUJsYzhhYU4zTEdMZVlSTkg2NVUxRHI2d1B1?=
 =?utf-8?B?bXRPQmtaajdQekgreWsyWS9yc0pzejBGbjRUeWVSMG5ROUdqekJ6akR6Sm1q?=
 =?utf-8?B?UnJhS3NuaVdZZkNUU1VPY1NqRFBibm5vc0dpUEc3YlFUYXMrTi9RZjg5OXV2?=
 =?utf-8?B?VWNRckhpYTNRMkVRYUJ1a2F0VnZiSG5sV2hhUWZiUkIyNTBKb2o0NVdLb0sv?=
 =?utf-8?B?b3BmS20yL1grYUdtZVg1QWlnOW9Cc05zQXU0WlRIdHkwOFZTYUpnWEZ2V1Fw?=
 =?utf-8?B?SHhvbEpPc0szN2h5NmlBZDJIK29tK213cFV4dlRRRnFxaTdhNHdLM25yL2Fh?=
 =?utf-8?B?Lytac0RiVnBNSmkxMWdVKzFTNFAzckw2cDZneWFTVGZBcFVUbkdjWk9pdzVk?=
 =?utf-8?B?OW9oalZXb2FXZGd5eXNIUE0zcVNTbHNtbmwzWGFzQ0NINDZNb0ZPcVFEamk3?=
 =?utf-8?Q?4n8gpJOWtQcSVN/RA6z5UKusrvTjiTZtPGTO6RS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5fcedb-3d87-464c-efd5-08d919cc721d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2021 07:13:32.7373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qDxh1kyjyKY2csuyadn2tv0opp3B+WsZ2h2H+lyuOYfp+uyWMYoSf8M2rfNxLVMPL/cUfCqdiWKGbdZEPwxceA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8069
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBGcm9tOiBBYmVsIFZlc2EgPGFiZWx2ZXNhQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwg
TWF5IDE0LCAyMDIxIDY6MjUgUE0NCj4gDQo+IE9uIDIxLTA1LTEzIDE1OjM4OjMzLCBTaGF3biBH
dW8gd3JvdGU6DQo+ID4gT24gRnJpLCBBcHIgMjMsIDIwMjEgYXQgMDE6MTQ6MTRQTSArMDMwMCwg
TWlyZWxhIFJhYnVsZWEgKE9TUykgd3JvdGU6DQo+ID4gPiBGcm9tOiBNaXJlbGEgUmFidWxlYSA8
bWlyZWxhLnJhYnVsZWFAbnhwLmNvbT4NCj4gPiA+DQo+ID4gPiBBZGQgZHRzIGZvciBpbWFnaW5n
IHN1YnN5dGVtLCBpbmNsdWRlIGpwZWcgbm9kZXMgaGVyZS4NCj4gPiA+IFRlc3RlZCBvbiBpbXg4
cXhwIG9ubHksIHNob3VsZCB3b3JrIG9uIGlteDhxbSwgYnV0IGl0IHdhcyBub3QgdGVzdGVkLg0K
PiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pcmVsYSBSYWJ1bGVhIDxtaXJlbGEucmFidWxl
YUBueHAuY29tPg0KPiA+DQo+ID4gU28gdGhlIGJpbmRpbmdzIGFuZCBkcml2ZXIgcGFydHMgaGF2
ZSBiZWVuIGFjY2VwdGVkIGFscmVhZHk/DQo+ID4NCj4gPiA+IC0tLQ0KPiA+ID4gQ2hhbmdlcyBp
biB2MTE6DQo+ID4gPiAgIEFkcmVzcyBmZWVkYmFjayBmcm9tIEFpc2hlbmcgRG9uZzoNCj4gPiA+
ICAgLSBSZW5hbWUgaW1nX2pwZWdfZGVjX2Nsay9pbWdfanBlZ19lbmNfY2xrIHRvDQo+IGpwZWdf
ZGVjX2xwY2cvanBlZ19lbmNfbHBjZyB0byBtYWtlIGl0IHZpc2libGUgaXQncyBscGNnIG5vdCBv
dGhlciB0eXBlIG9mIGNsaw0KPiA+ID4gICAtIERyb3AgdGhlIGNhbWVyYWRldiBub2RlLCBub3Qg
bmVlZGVkIGZvciBqcGVnDQo+ID4gPiAgIC0gTWF0Y2ggYXNzaWduZWQtY2xvY2tzICYgYXNzaWdu
ZWQtY2xvY2stcmF0ZXMNCj4gPiA+DQo+ID4gPiAgLi4uL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4LXNzLWltZy5kdHNpIHwgODINCj4gKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaSAgICB8ICAxICsNCj4gPiA+
ICAyIGZpbGVzIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKykNCj4gPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRzaQ0KPiA+
ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4
LXNzLWltZy5kdHNpDQo+ID4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgt
c3MtaW1nLmR0c2kNCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLmM1MDhlNWQwYzkyYg0KPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRzaQ0KPiA+ID4gQEAg
LTAsMCArMSw4MiBAQA0KPiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
Kw0KPiA+ID4gKy8qDQo+ID4gPiArICogQ29weXJpZ2h0IDIwMTktMjAyMSBOWFANCj4gPiA+ICsg
KiBaaG91IEd1b25pdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4gICovDQo+ID4gPiAraW1nX3N1YnN5
czogYnVzQDU4MDAwMDAwIHsNCj4gPiA+ICsJY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCj4g
PiA+ICsJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gPiArCSNzaXplLWNlbGxzID0gPDE+Ow0K
PiA+ID4gKwlyYW5nZXMgPSA8MHg1ODAwMDAwMCAweDAgMHg1ODAwMDAwMCAweDEwMDAwMDA+Ow0K
PiA+ID4gKw0KPiA+ID4gKwlpbWdfaXBnX2NsazogY2xvY2staW1nLWlwZyB7DQo+ID4gPiArCQlj
b21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gPiA+ICsJCSNjbG9jay1jZWxscyA9IDwwPjsN
Cj4gPiA+ICsJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyMDAwMDAwMDA+Ow0KPiA+ID4gKwkJY2xvY2st
b3V0cHV0LW5hbWVzID0gImltZ19pcGdfY2xrIjsNCj4gPiA+ICsJfTsNCj4gPg0KPiA+IEhtbSwg
bm90IHN1cmUgYSBmaXhlZC1jbG9jayBzaG91bGQgYmUgaW4gdGhlIHN1YnN5c3RlbS4NCj4gPg0K
PiANCj4gQWdyZWVkLiBBc3N1bWluZyB0aGUgaW1nX2lwZ19jbGsgaXMgb25seSB1c2VkIG9uIDhR
WFAsIHlvdSBjb3VsZCBtb3ZlIGl0DQo+IGludG8gaW14OHF4cC1zcy1pbWcuZHRzaS4gVGhpcyB3
YXkgZXZlcnkgb3RoZXIgcGxhdGZvcm0gdGhhdCB1c2VzIHRoaXMgc3MgZmlsZQ0KPiB3aWxsIG5v
dCBiZSBpbXBhY3RlZC4NCj4gDQoNCklteF9pcGdfY2xrIGlzIHVzZWQgaW4gdGhpcyBwYXRjaC4N
CkhlcmUgd2UgZGVmaW5lIHN1YnN5cy5kdHNpIG1vc3RseSBiYXNlZCBvbiBNWDhRWFAuDQpNWDhR
TSBjYW4gb3ZlcndyaXRlIGl0IGluIFFNIHN1YnN5cy5kdHNpIGlmIG5lZWRlZC4NCg0KUmVnYXJk
cw0KQWlzaGVuZw0KDQoNCj4gPiA+ICsNCj4gPiA+ICsJaW1nX2pwZWdfZGVjX2xwY2c6IGNsb2Nr
LWNvbnRyb2xsZXJANTg1ZDAwMDAgew0KPiA+ID4gKwkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4
cC1scGNnIjsNCj4gPiA+ICsJCXJlZyA9IDwweDU4NWQwMDAwIDB4MTAwMDA+Ow0KPiA+ID4gKwkJ
I2Nsb2NrLWNlbGxzID0gPDE+Ow0KPiA+ID4gKwkJY2xvY2tzID0gPCZpbWdfaXBnX2Nsaz4sIDwm
aW1nX2lwZ19jbGs+Ow0KPiA+ID4gKwkJY2xvY2staW5kaWNlcyA9IDxJTVhfTFBDR19DTEtfMD4s
DQo+ID4gPiArCQkJCTxJTVhfTFBDR19DTEtfND47DQo+ID4gPiArCQljbG9jay1vdXRwdXQtbmFt
ZXMgPSAiaW1nX2pwZWdfZGVjX2xwY2dfY2xrIiwNCj4gPiA+ICsJCQkJICAgICAiaW1nX2pwZWdf
ZGVjX2xwY2dfaXBnX2NsayI7DQo+ID4gPiArCQlwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0Nf
Ul9NSlBFR19ERUNfTVA+Ow0KPiA+ID4gKwl9Ow0KPiA+ID4gKw0KPiA+ID4gKwlpbWdfanBlZ19l
bmNfbHBjZzogY2xvY2stY29udHJvbGxlckA1ODVmMDAwMCB7DQo+ID4gPiArCQljb21wYXRpYmxl
ID0gImZzbCxpbXg4cXhwLWxwY2ciOw0KPiA+ID4gKwkJcmVnID0gPDB4NTg1ZjAwMDAgMHgxMDAw
MD47DQo+ID4gPiArCQkjY2xvY2stY2VsbHMgPSA8MT47DQo+ID4gPiArCQljbG9ja3MgPSA8Jmlt
Z19pcGdfY2xrPiwgPCZpbWdfaXBnX2Nsaz47DQo+ID4gPiArCQljbG9jay1pbmRpY2VzID0gPElN
WF9MUENHX0NMS18wPiwNCj4gPiA+ICsJCQkJPElNWF9MUENHX0NMS180PjsNCj4gPiA+ICsJCWNs
b2NrLW91dHB1dC1uYW1lcyA9ICJpbWdfanBlZ19lbmNfbHBjZ19jbGsiLA0KPiA+ID4gKwkJCQkg
ICAgICJpbWdfanBlZ19lbmNfbHBjZ19pcGdfY2xrIjsNCj4gPiA+ICsJCXBvd2VyLWRvbWFpbnMg
PSA8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19NUD47DQo+ID4gPiArCX07DQo+ID4gPiArDQo+ID4g
PiArCWpwZWdkZWM6IGpwZWdkZWNANTg0MDAwMDAgew0KPiA+DQo+ID4gS2VlcCBub2RlcyBzb3J0
ZWQgaW4gdW5pdCBhZGRyZXNzLg0KPiA+DQo+ID4gU2hhd24NCj4gPg0KPiA+ID4gKwkJY29tcGF0
aWJsZSA9ICJueHAsaW14OHF4cC1qcGdkZWMiOw0KPiA+ID4gKwkJcmVnID0gPDB4NTg0MDAwMDAg
MHgwMDA1MDAwMCA+Ow0KPiA+ID4gKwkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMwOSBJUlFfVFlQ
RV9MRVZFTF9ISUdIPiwNCj4gPiA+ICsJCQkgICAgIDxHSUNfU1BJIDMxMCBJUlFfVFlQRV9MRVZF
TF9ISUdIPiwNCj4gPiA+ICsJCQkgICAgIDxHSUNfU1BJIDMxMSBJUlFfVFlQRV9MRVZFTF9ISUdI
PiwNCj4gPiA+ICsJCQkgICAgIDxHSUNfU1BJIDMxMiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4g
PiA+ICsJCWNsb2NrcyA9IDwmaW1nX2pwZWdfZGVjX2xwY2cgMD4sDQo+ID4gPiArCQkJIDwmaW1n
X2pwZWdfZGVjX2xwY2cgMT47DQo+ID4gPiArCQljbG9jay1uYW1lcyA9ICJwZXIiLCAiaXBnIjsN
Cj4gPiA+ICsJCWFzc2lnbmVkLWNsb2NrcyA9IDwmaW1nX2pwZWdfZGVjX2xwY2cgMD4sDQo+ID4g
PiArCQkJCSAgPCZpbWdfanBlZ19kZWNfbHBjZyAxPjsNCj4gPiA+ICsJCWFzc2lnbmVkLWNsb2Nr
LXJhdGVzID0gPDIwMDAwMDAwMD4sIDwyMDAwMDAwMDA+Ow0KPiA+ID4gKwkJcG93ZXItZG9tYWlu
cyA9IDwmcGQgSU1YX1NDX1JfTUpQRUdfREVDX01QPiwNCj4gPiA+ICsJCQkJPCZwZCBJTVhfU0Nf
Ul9NSlBFR19ERUNfUzA+LA0KPiA+ID4gKwkJCQk8JnBkIElNWF9TQ19SX01KUEVHX0RFQ19TMT4s
DQo+ID4gPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfREVDX1MyPiwNCj4gPiA+ICsJCQkJPCZw
ZCBJTVhfU0NfUl9NSlBFR19ERUNfUzM+Ow0KPiA+ID4gKwl9Ow0KPiA+ID4gKw0KPiA+ID4gKwlq
cGVnZW5jOiBqcGVnZW5jQDU4NDUwMDAwIHsNCj4gPiA+ICsJCWNvbXBhdGlibGUgPSAibnhwLGlt
eDhxeHAtanBnZW5jIjsNCj4gPiA+ICsJCXJlZyA9IDwweDU4NDUwMDAwIDB4MDAwNTAwMDAgPjsN
Cj4gPiA+ICsJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzMDUgSVJRX1RZUEVfTEVWRUxfSElHSD4s
DQo+ID4gPiArCQkJICAgICA8R0lDX1NQSSAzMDYgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4g
PiArCQkJICAgICA8R0lDX1NQSSAzMDcgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gPiArCQkJ
ICAgICA8R0lDX1NQSSAzMDggSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gPiArCQljbG9ja3Mg
PSA8JmltZ19qcGVnX2VuY19scGNnIDA+LA0KPiA+ID4gKwkJCSA8JmltZ19qcGVnX2VuY19scGNn
IDE+Ow0KPiA+ID4gKwkJY2xvY2stbmFtZXMgPSAicGVyIiwgImlwZyI7DQo+ID4gPiArCQlhc3Np
Z25lZC1jbG9ja3MgPSA8JmltZ19qcGVnX2VuY19scGNnIDA+LA0KPiA+ID4gKwkJCQkgIDwmaW1n
X2pwZWdfZW5jX2xwY2cgMT47DQo+ID4gPiArCQlhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwyMDAw
MDAwMDA+LCA8MjAwMDAwMDAwPjsNCj4gPiA+ICsJCXBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9T
Q19SX01KUEVHX0VOQ19NUD4sDQo+ID4gPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX1Mw
PiwNCj4gPiA+ICsJCQkJPCZwZCBJTVhfU0NfUl9NSlBFR19FTkNfUzE+LA0KPiA+ID4gKwkJCQk8
JnBkIElNWF9TQ19SX01KUEVHX0VOQ19TMj4sDQo+ID4gPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQ
RUdfRU5DX1MzPjsNCj4gPiA+ICsJfTsNCj4gPiA+ICt9Ow0KPiA+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaQ0KPiA+ID4gYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gPiA+IGluZGV4IDFlNmI0OTk1
MDkxZS4uMmQ5NTg5MzA5YmQwIDEwMDY0NA0KPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gPiA+IEBAIC0yNTgsNiArMjU4LDcgQEANCj4gPiA+
ICAJfTsNCj4gPiA+DQo+ID4gPiAgCS8qIHNvcnRlZCBpbiByZWdpc3RlciBhZGRyZXNzICovDQo+
ID4gPiArCSNpbmNsdWRlICJpbXg4LXNzLWltZy5kdHNpIg0KPiA+ID4gIAkjaW5jbHVkZSAiaW14
OC1zcy1hZG1hLmR0c2kiDQo+ID4gPiAgCSNpbmNsdWRlICJpbXg4LXNzLWNvbm4uZHRzaSINCj4g
PiA+ICAJI2luY2x1ZGUgImlteDgtc3MtZGRyLmR0c2kiDQo+ID4gPiAtLQ0KPiA+ID4gMi4xNy4x
DQo+ID4gPg0K
