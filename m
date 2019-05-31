Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB5FC305C5
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 02:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfEaA0m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 20:26:42 -0400
Received: from mail-eopbgr20083.outbound.protection.outlook.com ([40.107.2.83]:3042
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726128AbfEaA0l (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 20:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPkqpCYioJu9+KUj4mn51kqFYFS00uoeCSIy0k7ue4U=;
 b=q04M4gu0TJsyPrMMjCVhq2R123NPtC4LEnU+/7nMu1nbpl/MZ0iCsxEQopgZPmel/aFFwHhWElM8ugP+NXzQ5izjQMn+kAeWfj58PqoOO2sJmDssuWdoypbl9K+qkeWiucd4A910COa2mR9aN4jC5oD99yBq0pfxyUkEejNX3Y0=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (20.179.235.81) by
 VE1PR04MB6510.eurprd04.prod.outlook.com (20.179.233.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.23; Fri, 31 May 2019 00:26:37 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::a13e:6f61:e9e6:16d7]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::a13e:6f61:e9e6:16d7%7]) with mapi id 15.20.1943.016; Fri, 31 May 2019
 00:26:37 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>
CC:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        "tharvey@gateworks.com" <tharvey@gateworks.com>
Subject: RE: [v8] media: imx: add mem2mem device
Thread-Topic: [v8] media: imx: add mem2mem device
Thread-Index: AQHVFzWVi6WPXAEL2EqP2Yi5fqgD66aEYCyg
Date:   Fri, 31 May 2019 00:26:37 +0000
Message-ID: <VE1PR04MB6638C5E75F797BD3114C467A89190@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com>
 <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
 <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca>
 <CAGngYiUZJCwg-VgOafU=gBgDtaSV++UVmNQawn6d5LunBFg1FQ@mail.gmail.com>
 <CAOMZO5AxL6MeOY=Pooq65B-Ly=t41JVp0Y_nXrYUKk03yh0KJQ@mail.gmail.com>
In-Reply-To: <CAOMZO5AxL6MeOY=Pooq65B-Ly=t41JVp0Y_nXrYUKk03yh0KJQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yibin.gong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c5f9bb9c-2b81-41fd-5480-08d6e55ea503
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:VE1PR04MB6510;
x-ms-traffictypediagnostic: VE1PR04MB6510:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <VE1PR04MB6510AA776813F04D3E5242E289190@VE1PR04MB6510.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(396003)(346002)(39860400002)(376002)(13464003)(199004)(189003)(53546011)(99286004)(4326008)(52536014)(256004)(7696005)(76176011)(5660300002)(86362001)(8936002)(229853002)(66476007)(66066001)(73956011)(76116006)(316002)(71190400001)(66946007)(6246003)(4744005)(14454004)(64756008)(6506007)(25786009)(66446008)(66556008)(102836004)(9686003)(81166006)(6436002)(110136005)(81156014)(186003)(26005)(71200400001)(33656002)(2906002)(74316002)(8676002)(476003)(478600001)(53936002)(3846002)(6116002)(7736002)(486006)(305945005)(68736007)(55016002)(54906003)(11346002)(446003);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6510;H:VE1PR04MB6638.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Dd7xlEyDHy9RrqBibPEGZyX7oss7yT24NzfxV/4F4Qd+m3VJaqH3UGNL0VfD6uA8lzJUEeTElVCQ+Z2u7TCF6TcPnPnFTWNhVusK/DVjoYpiNURRo6IEjaniRaZW0ns8JQIr22V4L8TRPeQKY1nen4rVPye6MUxvmKNrsI2BRIUXTUge00uLG+uF0cGfLbOtAFwEqzdJ+ImGYna29/j2L9dBwU8XEuq5FrcnZT+O1zC2RjVBFLParrm3fzgY9WGcs5wrAA1Yh3DaBhD/9ByqyQdprGsrIPOXC6UesIheJaEa2NAoMni2OIWdzBzolIi9HvGSn2P+yfhtNHDUagRBc1NAeDkqkjuyOhScNCvXonkSwqnTPISMu9x6LtmwFUT5+7SDhgQP7+PZ4BCUu7R4HcYdp/QfpjFAg0WtJIzvHx4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f9bb9c-2b81-41fd-5480-08d6e55ea503
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 00:26:37.6399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yibin.gong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6510
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU3ZlbiwNCglXaGF0J3Mgc29jIGNoaXAgYW5kIGJvYXJkIHlvdSB1c2VkPyBDb3VsZCB5b3Ug
cG9zdCBsb2c/DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRmFiaW8g
RXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPg0KPiBTZW50OiAyMDE55bm0NeaciDMx5pelIDY6
MTgNCj4gVG86IFN2ZW4gVmFuIEFzYnJvZWNrIDx0aGVzdmVuNzNAZ21haWwuY29tPjsgUm9iaW4g
R29uZw0KPiA8eWliaW4uZ29uZ0BueHAuY29tPg0KPiBDYzogTmljb2xhcyBEdWZyZXNuZSA8bmlj
b2xhc0BuZHVmcmVzbmUuY2E+OyBQaGlsaXBwIFphYmVsDQo+IDxwLnphYmVsQHBlbmd1dHJvbml4
LmRlPjsgbGludXgtbWVkaWEgPGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz47IEhhbnMNCj4g
VmVya3VpbCA8aGFucy52ZXJrdWlsQGNpc2NvLmNvbT47IHRoYXJ2ZXlAZ2F0ZXdvcmtzLmNvbQ0K
PiBTdWJqZWN0OiBSZTogW3Y4XSBtZWRpYTogaW14OiBhZGQgbWVtMm1lbSBkZXZpY2UNCj4gDQo+
IEhpIFN2ZW4sDQo+IA0KPiBbQWRkaW4gUm9iaW5dDQo+IA0KPiBPbiBUaHUsIE1heSAzMCwgMjAx
OSBhdCA2OjM0IFBNIFN2ZW4gVmFuIEFzYnJvZWNrIDx0aGVzdmVuNzNAZ21haWwuY29tPg0KPiB3
cm90ZToNCj4gDQo+ID4gVW5mb3J0dW5hdGVseSBJIGNhbm5vdCBsb2FkIGFueSBpbXgtc2RtYSBm
aXJtd2FyZSBvbiB0aGUgbGF0ZXN0DQo+ID4gbWFpbmxpbmUga2VybmVsLiBSaWdodCBhZnRlciB0
aGUgZmlybXdhcmUgaXMgbG9hZGVkLCByZWFkcyBzZWVtIHRvIGdldA0KPiA+IGNvcnJ1cHRlZCBh
bmQgdGhlIHdob2xlIGtlcm5lbCBjcmFzaGVzIC8gaGFuZ3MuDQo+ID4NCj4gPiBJIGFtIGN1cnJl
bnRseSBiaXNlY3RpbmcgdG8gZmluZCB0aGUgb2ZmZW5kaW5nIGNvbW1pdDoNCj4gPiB2LjQuMjAg
Z29vZA0KPiA+IHY1LjAgYmFkDQo+IA0KPiBJIGFtIG5vdCBzdXJlIEkgdW5kZXJzdG9vZCB0aGUg
c2RtYSBmaXJtd2FyZSBpc3N1ZSBjb3JyZWN0bHkuDQo+IA0KPiBQbGVhc2Ugc3RhcnQgYSBuZXcg
dGhyZWFkIGluIGxpbnV4LWFybS1rZXJuZWwgb24gdGhpcyB0b3BpYyBhbmQgYWxzbyBjb3B5IFJv
YmluDQo+IGFuZCB0aGUgZm9sa3MgZnJvbSAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwgLWYg
ZHJpdmVycy9kbWEvaW14LXNkbWEuYw0KPiANCj4gVGhhbmtzDQo=
