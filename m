Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 571FC3887E0
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 08:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238384AbhESG7B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 02:59:01 -0400
Received: from mail-am6eur05on2050.outbound.protection.outlook.com ([40.107.22.50]:5632
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233136AbhESG7B (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 02:59:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfsMtYtP12/BslW96ncTm2mz+TNOnfkchcRQ2+vXRklpAOV245kKbrjkB/LPD6AlWGcynpxLVPhNjlVtL9wM8o5yLcAR4eEEvinekFywpAe5htQv01ZhbXhnZlZigWDIX96ZbmavF5nlP0tGsA2zTYYh5gF342l5il5yJm/5IExytf8WwYH2283EBe4DGfxI3sCTeyou8kBOqSBAh9wafOF4j9gaPMMhuyFnr0xZiZjuwZbf4wGUUa7F0miJXkBUOMDbjVru7upIH7Bmt1cQCW7z3K2fCagZTcJPuvspozmNtgitWpDlDTilImM5hPbyKvIgYLgA4p5J2+wB0UxP6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh/dsgrKgUmuWpW0Yp1lZifN4jsd59dU0Ak/wKEmWCA=;
 b=TltjW0YmkVGJoLQhCFYCNrmAD0sCtqg94fpN1hNZ9rTwNQvEFnWWY760R4UzwLJE5GPj1BgJbBv2gSkeLebyCvRjUYQlfr0SfJYDlhoIy7g+cJyc0Dwy1qh/eIdmkufMsTpHfI5r5185G6F0i0ppHoW2FS5Kc6b1inZKz0dwZhDN296JMjJyClfBQRy3enu/XW5HNbjOcObYCaqsJNVb6d9ZVLVXGYVHsfN5prR0/JzXbuLRl+TbKzRrRFFGNu3wDgaghx2xiXkEHPUJfn6KIr1rzbZItTcxMogn8jMf81PYyxR++ON0GbcUxuIPlMV/F4nk0W1y5QUbmRhBPBD/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh/dsgrKgUmuWpW0Yp1lZifN4jsd59dU0Ak/wKEmWCA=;
 b=QW9fwzZCAwGeyTSEeodFo3bngydN4sSH9vYFHeipFHmTXEGxUBOqGOTi2s63zUUE7mnhffOGK0dRXc5qbIlZMgefBJIBWUAPZOVFyi467KhzF4quattt300+H+MeEYs/4Lw0oC1IpabMjJvEF2FBGMhHhpBzReG6Zl+x/uspeCY=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM7PR04MB7144.eurprd04.prod.outlook.com (2603:10a6:20b:11b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 06:57:40 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb%5]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 06:57:40 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v11] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Topic: [PATCH v11] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Index: AQHXTHCCspdn7uu1Vkql7Vb4OqhcSKrqX6KA
Date:   Wed, 19 May 2021 06:57:39 +0000
Message-ID: <a51f5e8733638cf962afd170d50ca0b19ddfcc2c.camel@nxp.com>
References: <20210519053323.27194-1-mirela.rabulea@oss.nxp.com>
In-Reply-To: <20210519053323.27194-1-mirela.rabulea@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [86.124.171.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02d0c999-a26d-4332-ce9d-08d91a9364ae
x-ms-traffictypediagnostic: AM7PR04MB7144:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB71447267560AB34201F5DA3E8F2B9@AM7PR04MB7144.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: slB/FMJvgz4Madv8yxkc77sfjKB5c+ritT9qXXspCxAyyMFXL/WX1CJo9Xp5HT8a59pW2cyOXxHpBycWxfr6t9JYrc/4qhouOLiZhL4fpOHfajX4KthmCZAHUkCs/n9sb+fi/QcUp0OmpSIdrwOTYr0+Jb6wU2+z3G327INcw1vNkp7T62M8yW59+V2jGLAmFkeLSNDls3zm5O+/CVGmfIwWTW7klgxC5ZfyCvl7rIA+nY2xM4C3IdPjDs+YcEwkxosbctJLJ8xBsL2LtIbKjZgWOHQ5Q/8mM78gX9uoxE9BucXLpb4YzU/yuETyIvi6QU2rml6X3k+uDfiHv967gogBOCMPIGQDx6D+HS91PjN7DZ/JoqwHtRDXQ3NFDcMqAqY0Fjuyf9LmgYRWWHDC8V5MYT8LOw5oQPqDiicTV/VM/GuPaksK9UNomE5Lt35EZLdLAHfOU8EHQlTCXNfE+LsoIFAUDkWCefEZ+nBHHlY5oWG67msqmAkCoszXHjUMzSakdD5p9kAcW4S8SKUipGelapsr0TTRTPo8Yv13qxjQEUh0tS2/IJLtXhM6Qdbz1soPwOH7tT+JLhgaUCzDQTzspSKb1wVp4ckIJqBAX7n0vBuNclnQV5hdKnhv7YS7RieoKrN2bVXbpog5q4IKQm54WAxtF3i5Uz6ycvTxGUI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(36756003)(66476007)(38100700002)(91956017)(83380400001)(76116006)(64756008)(66556008)(122000001)(66946007)(66446008)(5660300002)(316002)(110136005)(2616005)(4326008)(6506007)(478600001)(86362001)(8676002)(8936002)(44832011)(54906003)(26005)(186003)(7416002)(2906002)(6512007)(6636002)(71200400001)(6486002)(99106002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SkhHWTFiU3hNZHZ6NkJxekQ3OE1uQ1BkWFB6OVNPdW41TThUcXZkenovQkZq?=
 =?utf-8?B?YmQ5Y044cnRTQzJuWDlZUXYzRGVlcC91MUlmUEc5M0NsbE9CbW1KWjlPY0Iv?=
 =?utf-8?B?dHR1R2owZWI4clNEV1lKbTdvMGhvVzRMTmZaZVZTOXBscDBuYVJ5WlFvRW5I?=
 =?utf-8?B?UTFpWktjbld0RWcxL1l1Ri9uM3dkTW1pU0xmVkRhVHAxYlZhL0t4RUZiQjdz?=
 =?utf-8?B?alphUG9ZVVJ6Q05LKzQ5U1BUUmhxZ1AyNVdraDMwbzFBOFpwZlhVc1V1TTJL?=
 =?utf-8?B?Tk1tMGtsSjdnQnZ2UCtNUHpWTjZhRUpBMkVuL0lTOUhWS0hXOWpMMnQ4bE5O?=
 =?utf-8?B?R1RSOUlOWmtUZTgycmdZUkMvbm1USUJ0VTAzK0F1YXBFNUVjM1B0M01NTm9i?=
 =?utf-8?B?U0RTTmtiWi9sSDJTeUJGNWc2akpQZGc4elJ0d0dnUkNrK3ovRHNybllMcTRN?=
 =?utf-8?B?YzVRdkMyMlVWQm9VTDZ5dE5xOXpiSkFWQ0dDVGVrMEFRQ2w5dFBjdG5BZk9v?=
 =?utf-8?B?cFA3M241UVFQNzFNbWdteUxtTFEyZkkwOVBYcWhBYXFOMit5RnhUWkczM0lt?=
 =?utf-8?B?aXlCd1hnbWlmUmJ6NUhoR3ZNVzk2VEtvUExkV2JvU0FXaU5UMmpGRkovcVBs?=
 =?utf-8?B?cnc5UWRGRlI1VWRtM1FkS3Bya0tpZkxoVXYwQVZPVlNxM3N0dkk4K2NxQVho?=
 =?utf-8?B?ZmtNUWJGc0lZdERycG9kcVNucW81SktLWmNsVnpkNmY0N1hGbDg2d1JOaDVU?=
 =?utf-8?B?SkFzN2JNQXRLNUVSUk1lVGJjc2VRLzZNVEhFM24xaUl4YWQwSjE4R2U0eEdl?=
 =?utf-8?B?bUJ3ZlJIeFpOdzhWQWhpTE1TaHlqS09Yam1TZXA0Rk9QR0tWbEt3TkhvNS9G?=
 =?utf-8?B?WEZLS1dBK25VemhtZUpOREZ6dXZrU1RDWm1lKzkyOSs0eVplMlJ0VzM4N01u?=
 =?utf-8?B?TGkrdEdveGlUcmQ5d3ZFc0htOHdWMjFzdTkvVHNaa21jSFFib203SFIwWWJl?=
 =?utf-8?B?bEkzMHQ3Q05rbVpaYlJya3h0TGxPQWphTlRjY3g5dG1ySm5HdVdrSEZaZ1R2?=
 =?utf-8?B?MklIalg0ZlpWaG5TOHJ6eHNpRlhFOGh0NmxSSERxMG9La2UxejBiMTRFV1hL?=
 =?utf-8?B?TmsvMXBtc0pVSVJaU1BmbXRNeHQxQ0ZpZlREQVY4VDBMOUNySEpQcjZqZmhB?=
 =?utf-8?B?V2dMRXhNbEZQZmpjK01Ca0M4K1VQSDFWeVE2NmRWdHZKT1RKNVRNU3FSZmlz?=
 =?utf-8?B?N0NBUnZ3WlB1MlhMbmdEVk50REhEanhKb0QrTVphck5vTTZsSDhwbG8raTdk?=
 =?utf-8?B?ZC9LZUJONVNyV3ZreU5GRlhMUVpDZ0ZGdUxmL05VbGg1cmE0ZG9lendRb3Na?=
 =?utf-8?B?Y09iTEZOWkRFTHdzODVLZEIwRzZXeGRuUERCdUxlTjBqSTNET3NFWGxQWXRB?=
 =?utf-8?B?NVFhWTM0Q0NtYmZmZHRSQTZQbHpCRitMdXJMR3VhQzA3a0kwMVhFQlB0TU5y?=
 =?utf-8?B?TW9oZW94SzE0QmRycnVDdk1mT1crclZNZlZ0WmVHMkVyZGtEcGtTZHpibzZL?=
 =?utf-8?B?Y0VHWDlHQWhONHJrZVhPN0M5YnNyOHZFQ2RFaGxLcFZXTTVoaFd5WXBxR0tW?=
 =?utf-8?B?SURzOHE1WVp5R21uSWlIaUliMHFqTjdlUHdjZmVGMU1QYktNdTRIMERURkdO?=
 =?utf-8?B?b0p3SGZ1ZjFVemNLRnBuWGU2OHRBZ0pnZnJuOWRGWXpiejgveWlkdGRuamhS?=
 =?utf-8?Q?/NO4hDMoGSPhOhx+OH4l+u5vgpqaLLie/6xNthq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC61BC90444179479DDFBC9096F7CED6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d0c999-a26d-4332-ce9d-08d91a9364ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 06:57:40.0158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rq23mOUfEWK1JMV9fM+J1idMOsiza5CoNycJbH92Ik07DQYE2iyuty7RveMDLWD+lRwQVBvQtq7+dnUa9VNezQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7144
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksDQpwbGVhc2UgaWdub3JlIHRoaXMsIEkgbWlzdGFrZW5seSBzZW50IGl0IGluc3RlYWQgb2Yg
djEyLg0KDQpSZWdhcmRzLA0KTWlyZWxhDQoNCk9uIFdlZCwgMjAyMS0wNS0xOSBhdCAwODozMyAr
MDMwMCwgTWlyZWxhIFJhYnVsZWEgKE9TUykgd3JvdGU6DQo+IEZyb206IE1pcmVsYSBSYWJ1bGVh
IDxtaXJlbGEucmFidWxlYUBueHAuY29tPg0KPiANCj4gQWRkIGR0cyBmb3IgaW1hZ2luZyBzdWJz
eXRlbSwgaW5jbHVkZSBqcGVnIG5vZGVzIGhlcmUuDQo+IFRlc3RlZCBvbiBpbXg4cXhwIG9ubHks
IHNob3VsZCB3b3JrIG9uIGlteDhxbSwgYnV0IGl0IHdhcyBub3QgdGVzdGVkLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTWlyZWxhIFJhYnVsZWEgPG1pcmVsYS5yYWJ1bGVhQG54cC5jb20+DQo+IC0t
LQ0KPiBDaGFuZ2VzIGluIHYxMToNCj4gICBBZHJlc3MgZmVlZGJhY2sgZnJvbSBBaXNoZW5nIERv
bmc6DQo+ICAgLSBSZW5hbWUgaW1nX2pwZWdfZGVjX2Nsay9pbWdfanBlZ19lbmNfY2xrIHRvDQo+
IGpwZWdfZGVjX2xwY2cvanBlZ19lbmNfbHBjZyB0byBtYWtlIGl0IHZpc2libGUgaXQncyBscGNn
IG5vdCBvdGhlcg0KPiB0eXBlIG9mIGNsaw0KPiAgIC0gRHJvcCB0aGUgY2FtZXJhZGV2IG5vZGUs
IG5vdCBuZWVkZWQgZm9yIGpwZWcNCj4gICAtIE1hdGNoIGFzc2lnbmVkLWNsb2NrcyAmIGFzc2ln
bmVkLWNsb2NrLXJhdGVzDQo+IA0KPiAgLi4uL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4
LXNzLWltZy5kdHNpIHwgODINCj4gKysrKysrKysrKysrKysrKysrKw0KPiAgYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpICAgIHwgIDEgKw0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCA4MyBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRzaQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3MtaW1nLmR0c2kNCj4gYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzUwOGU1ZDBjOTJiDQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRz
aQ0KPiBAQCAtMCwwICsxLDgyIEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMCsNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgMjAxOS0yMDIxIE5YUA0KPiArICogWmhvdSBH
dW9uaXUgPGd1b25pdS56aG91QG54cC5jb20+DQo+ICsgKi8NCj4gK2ltZ19zdWJzeXM6IGJ1c0A1
ODAwMDAwMCB7DQo+ICsJY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCj4gKwkjYWRkcmVzcy1j
ZWxscyA9IDwxPjsNCj4gKwkjc2l6ZS1jZWxscyA9IDwxPjsNCj4gKwlyYW5nZXMgPSA8MHg1ODAw
MDAwMCAweDAgMHg1ODAwMDAwMCAweDEwMDAwMDA+Ow0KPiArDQo+ICsJaW1nX2lwZ19jbGs6IGNs
b2NrLWltZy1pcGcgew0KPiArCQljb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gKwkJI2Ns
b2NrLWNlbGxzID0gPDA+Ow0KPiArCQljbG9jay1mcmVxdWVuY3kgPSA8MjAwMDAwMDAwPjsNCj4g
KwkJY2xvY2stb3V0cHV0LW5hbWVzID0gImltZ19pcGdfY2xrIjsNCj4gKwl9Ow0KPiArDQo+ICsJ
aW1nX2pwZWdfZGVjX2xwY2c6IGNsb2NrLWNvbnRyb2xsZXJANTg1ZDAwMDAgew0KPiArCQljb21w
YXRpYmxlID0gImZzbCxpbXg4cXhwLWxwY2ciOw0KPiArCQlyZWcgPSA8MHg1ODVkMDAwMCAweDEw
MDAwPjsNCj4gKwkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KPiArCQljbG9ja3MgPSA8JmltZ19pcGdf
Y2xrPiwgPCZpbWdfaXBnX2Nsaz47DQo+ICsJCWNsb2NrLWluZGljZXMgPSA8SU1YX0xQQ0dfQ0xL
XzA+LA0KPiArCQkJCTxJTVhfTFBDR19DTEtfND47DQo+ICsJCWNsb2NrLW91dHB1dC1uYW1lcyA9
ICJpbWdfanBlZ19kZWNfbHBjZ19jbGsiLA0KPiArCQkJCSAgICAgImltZ19qcGVnX2RlY19scGNn
X2lwZ19jbGsiOw0KPiArCQlwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNf
TVA+Ow0KPiArCX07DQo+ICsNCj4gKwlpbWdfanBlZ19lbmNfbHBjZzogY2xvY2stY29udHJvbGxl
ckA1ODVmMDAwMCB7DQo+ICsJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtbHBjZyI7DQo+ICsJ
CXJlZyA9IDwweDU4NWYwMDAwIDB4MTAwMDA+Ow0KPiArCQkjY2xvY2stY2VsbHMgPSA8MT47DQo+
ICsJCWNsb2NrcyA9IDwmaW1nX2lwZ19jbGs+LCA8JmltZ19pcGdfY2xrPjsNCj4gKwkJY2xvY2st
aW5kaWNlcyA9IDxJTVhfTFBDR19DTEtfMD4sDQo+ICsJCQkJPElNWF9MUENHX0NMS180PjsNCj4g
KwkJY2xvY2stb3V0cHV0LW5hbWVzID0gImltZ19qcGVnX2VuY19scGNnX2NsayIsDQo+ICsJCQkJ
ICAgICAiaW1nX2pwZWdfZW5jX2xwY2dfaXBnX2NsayI7DQo+ICsJCXBvd2VyLWRvbWFpbnMgPSA8
JnBkIElNWF9TQ19SX01KUEVHX0VOQ19NUD47DQo+ICsJfTsNCj4gKw0KPiArCWpwZWdkZWM6IGpw
ZWdkZWNANTg0MDAwMDAgew0KPiArCQljb21wYXRpYmxlID0gIm54cCxpbXg4cXhwLWpwZ2RlYyI7
DQo+ICsJCXJlZyA9IDwweDU4NDAwMDAwIDB4MDAwNTAwMDAgPjsNCj4gKwkJaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDMwOSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gKwkJCSAgICAgPEdJQ19TUEkg
MzEwIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiArCQkJICAgICA8R0lDX1NQSSAzMTEgSVJRX1RZ
UEVfTEVWRUxfSElHSD4sDQo+ICsJCQkgICAgIDxHSUNfU1BJIDMxMiBJUlFfVFlQRV9MRVZFTF9I
SUdIPjsNCj4gKwkJY2xvY2tzID0gPCZpbWdfanBlZ19kZWNfbHBjZyAwPiwNCj4gKwkJCSA8Jmlt
Z19qcGVnX2RlY19scGNnIDE+Ow0KPiArCQljbG9jay1uYW1lcyA9ICJwZXIiLCAiaXBnIjsNCj4g
KwkJYXNzaWduZWQtY2xvY2tzID0gPCZpbWdfanBlZ19kZWNfbHBjZyAwPiwNCj4gKwkJCQkgIDwm
aW1nX2pwZWdfZGVjX2xwY2cgMT47DQo+ICsJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDIwMDAw
MDAwMD4sIDwyMDAwMDAwMDA+Ow0KPiArCQlwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9N
SlBFR19ERUNfTVA+LA0KPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfREVDX1MwPiwNCj4gKwkJ
CQk8JnBkIElNWF9TQ19SX01KUEVHX0RFQ19TMT4sDQo+ICsJCQkJPCZwZCBJTVhfU0NfUl9NSlBF
R19ERUNfUzI+LA0KPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfREVDX1MzPjsNCj4gKwl9Ow0K
PiArDQo+ICsJanBlZ2VuYzoganBlZ2VuY0A1ODQ1MDAwMCB7DQo+ICsJCWNvbXBhdGlibGUgPSAi
bnhwLGlteDhxeHAtanBnZW5jIjsNCj4gKwkJcmVnID0gPDB4NTg0NTAwMDAgMHgwMDA1MDAwMCA+
Ow0KPiArCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzA1IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0K
PiArCQkJICAgICA8R0lDX1NQSSAzMDYgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkgICAg
IDxHSUNfU1BJIDMwNyBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gKwkJCSAgICAgPEdJQ19TUEkg
MzA4IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiArCQljbG9ja3MgPSA8JmltZ19qcGVnX2VuY19s
cGNnIDA+LA0KPiArCQkJIDwmaW1nX2pwZWdfZW5jX2xwY2cgMT47DQo+ICsJCWNsb2NrLW5hbWVz
ID0gInBlciIsICJpcGciOw0KPiArCQlhc3NpZ25lZC1jbG9ja3MgPSA8JmltZ19qcGVnX2VuY19s
cGNnIDA+LA0KPiArCQkJCSAgPCZpbWdfanBlZ19lbmNfbHBjZyAxPjsNCj4gKwkJYXNzaWduZWQt
Y2xvY2stcmF0ZXMgPSA8MjAwMDAwMDAwPiwgPDIwMDAwMDAwMD47DQo+ICsJCXBvd2VyLWRvbWFp
bnMgPSA8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19NUD4sDQo+ICsJCQkJPCZwZCBJTVhfU0NfUl9N
SlBFR19FTkNfUzA+LA0KPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX1MxPiwNCj4gKwkJ
CQk8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19TMj4sDQo+ICsJCQkJPCZwZCBJTVhfU0NfUl9NSlBF
R19FTkNfUzM+Ow0KPiArCX07DQo+ICt9Ow0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OHF4cC5kdHNpDQo+IGluZGV4IDFlNmI0OTk1MDkxZS4uMmQ5NTg5MzA5YmQwIDEw
MDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kN
Cj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IEBA
IC0yNTgsNiArMjU4LDcgQEANCj4gIAl9Ow0KPiAgDQo+ICAJLyogc29ydGVkIGluIHJlZ2lzdGVy
IGFkZHJlc3MgKi8NCj4gKwkjaW5jbHVkZSAiaW14OC1zcy1pbWcuZHRzaSINCj4gIAkjaW5jbHVk
ZSAiaW14OC1zcy1hZG1hLmR0c2kiDQo+ICAJI2luY2x1ZGUgImlteDgtc3MtY29ubi5kdHNpIg0K
PiAgCSNpbmNsdWRlICJpbXg4LXNzLWRkci5kdHNpIg0K
