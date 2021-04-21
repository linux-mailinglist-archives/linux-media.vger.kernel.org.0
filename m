Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 902F4366E89
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 16:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243661AbhDUOzY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 10:55:24 -0400
Received: from mail-vi1eur05on2086.outbound.protection.outlook.com ([40.107.21.86]:58208
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237851AbhDUOzX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 10:55:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlrLp+A4nQM+HLe/WeUy9/VJbSWECEUE5+/j+KpP2mpTDac7ZNmd+wUMLUwbqDNju1lG/q2waDW7XEvf3wjn+Y7+W7bp8kgV02F/bxN6YuTq0T0X+mxLaSsUSquF6oW1og924ofbIiLLgMSR1R9d1xWxhVMlrXYtahVrEmYE4Z0rHPiZdg8TU6HbYPy+qbmHWMU2bwaXcpZczh+5HupjaydCkA11bxZV3NmfZsMtrK0YFX4T5FrzHn7O8EfhFE/TUCZRzi2xSPpbNafyCNXVmQesmys1XnefKLEGXUL+7r8LuRVcVMdGCLTzecHkUBge2W493mnj1kVJH6IY4O5ziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/d6+zC3VejWe9ZgS60s+C/3mOxmMU0RSNyzvJcW1sC8=;
 b=gZIlmrpd0wLq8wU1szBrnzLs+ApuwGwzB/LwG6RYL2UE2pGovhGXDn0vBgnQ9vdV91Wz9/gN9Yl6Bq7qWoSNfMTN1bx3fCEVzNHpdxy+Jk2+qPYaFdQTXn9iPB1HdI47opycZK4rlYKq0v7LwHhry+P9QUDRk/kWpegohR1I1tRed4OR0wsl2xpLNLOovTFcdUoyI1VdZ5KDzYVOUmGmLkSIm5qBasHymqVs0lbX0w3qIvJCvTvFV9GNRHNOuyRvKhS//94tqErW3tHq4PZ2fSDKDnxkVBKfegK7r95G9lfqAMUbLO6jzbRAkq4mRzZxNKUfLyQ0gHqfQPTpaI9Zjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/d6+zC3VejWe9ZgS60s+C/3mOxmMU0RSNyzvJcW1sC8=;
 b=dT04iF3mnTz8WX5Ulpf4rhWw6pr2REJX83evoofBb4uevUxs1e9s/O41dIx7JipP8yNvWjKwE3G1m1YFlYLhxgyLXpmb7gA8J1fgALCHuAc2YrMQvRFbNYj512WojjguHEodtlkkdCXaXxl/Ax/FYDCNkJlDUWJl/U5Gc6UHXP0=
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com (2603:10a6:803:127::25)
 by VI1PR04MB3056.eurprd04.prod.outlook.com (2603:10a6:802:8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 14:54:47 +0000
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::de2:8b2:852b:6eca]) by VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::de2:8b2:852b:6eca%7]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 14:54:47 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>,
        Shengjiu Wang <shengjiu.wang@gmail.com>
CC:     Nicolin Chen <nicoleotsuka@gmail.com>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "S.j. Wang" <shengjiu.wang@nxp.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Takashi Iwai <tiwai@suse.com>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        Mark Brown <broonie@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in
 probe
Thread-Topic: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in
 probe
Thread-Index: AQHWLcMcvbp0uyGgYk605EKKtgH/8aivLYuAgAF2HACAABbKAIIDgX+QgAHvdICAAJqQwIAG4DOAgAHNh+CAAAv2AIABkvaQ
Date:   Wed, 21 Apr 2021 14:54:47 +0000
Message-ID: <VE1PR04MB66887C731E32BDBB340B044C89479@VE1PR04MB6688.eurprd04.prod.outlook.com>
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
         <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
         <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
         <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
         <VE1PR04MB66387217EDE5133FD2D8F793894E9@VE1PR04MB6638.eurprd04.prod.outlook.com>
         <50ef17a2d57b022c48bbca71fd4e074cc3ca9be5.camel@pengutronix.de>
         <VE1PR04MB6638EE85485768351755557B89499@VE1PR04MB6638.eurprd04.prod.outlook.com>
         <97262466d537402ad4032098ef277d6d47734f1f.camel@pengutronix.de>
         <VE1PR04MB6638659EC8557D01861042B189489@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <d8d084aa7ff183e2f78128a46a0ce5241f357c9a.camel@pengutronix.de>
In-Reply-To: <d8d084aa7ff183e2f78128a46a0ce5241f357c9a.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [183.192.237.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca5cc7f4-0c49-4918-8d0d-08d904d56863
x-ms-traffictypediagnostic: VI1PR04MB3056:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB3056933094CDE0A38D70452289479@VI1PR04MB3056.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ar9c6hepx8/CD9iZ5oowxYHJPVl8ffxnjsz1mquBHcd8y03nHIECrXVk27aW/WAIuaJmHNs1O98TxORsGSvuP7rr4Q9v90pnQ13M8m37h/UVl2Y+kHIxoYN3Cu/hnr32eXKfNkzextSHv5Ykmw8qMs5S1HKoC41GNOqDbemi/IbZCyPT/RJ9TnCqV2uj7oeZhLnXvlFL2hJD6WjfySbv5aUC6FeznDcCp1NGvJzXj+6vOM4TaKx4DiYNp5S/Bn7GxF5oV2dHqSaRiMmEff72DaJ1YDQUZ6nEAcFSohae/hn2BEzL5aMV0tZUw2+g5njw3EAq/1pbUKrt5OOJ6epHnO2qnBVQDjlHsI4ZbJK7vMLqwnt5aIYzx/+0MZGWPbkeosZC8tuxvNSDqRPrQGnvh0mUvVfPv2YeqcufWKv+ZP+mIYycZlhS37X5Czr2bVJcspN5UocGou3ZDB11d/NctvzW93qf+huS7rPHMhVqR6SLe2Ir5snY0aWVkZgYFq9ii3tB5L/bvV1RtP+7QFJzkZJEj9O04EmjyXgxLkGO8jSVoLWiXV9LBBS1JCkH58g8P96Lg9okW4pNiO8Okdmko69esUKUgwDab7QNQ+hOxIVVkQ5JqYd4/FAmabyJ+w8AnzgOIjpYMbrLq13BrSAsdQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(366004)(136003)(346002)(5660300002)(53546011)(4326008)(6506007)(55016002)(316002)(33656002)(9686003)(86362001)(66446008)(66556008)(64756008)(66476007)(38100700002)(122000001)(478600001)(2906002)(83380400001)(7416002)(8676002)(8936002)(66946007)(76116006)(52536014)(71200400001)(26005)(7696005)(110136005)(186003)(54906003)(98474003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?cTZjdndMd2FHVDB0ZWRhRlhXNHBWVXdYNDRGZllBbVVrbUx5VXJVenIrUnZn?=
 =?utf-8?B?ZzFVTFRSSDBEa2toL2xDRzE5Q2svUlhLSEVZZW0rcHhja3V6MWY5MVFzalVV?=
 =?utf-8?B?L2ExWHJmY3YzZmhpSEdQZ1FyNWpIYU5Db1JESXJGSzJqRm90Q2VoeXVlZHZv?=
 =?utf-8?B?enZuMXh0RW15OUVLRnpVWWo4UHZsdDNYelNXN240VUN2bElGWE05MnpwZkxM?=
 =?utf-8?B?cWxjQlhORGMxOU9zNmM2ZHZrWGZsYWw4SFBodUtadVAvb0c1RkpNb21IaWtO?=
 =?utf-8?B?OEpGM2U2clZlOVZKWXB2OXBJZWZUODdBeFk0WWlYR0srTGZJSWtCRzVpS01a?=
 =?utf-8?B?dlZMMkN0eGtYRUcxWnNQRWRZbnZEWkJtNWdZL0VIdEx1b0RRalgySjR5Uzcv?=
 =?utf-8?B?eEkxbk9ORWRqTDdZRnpWRnhOSElmZ0U2S1VzUVlsN1dHT1lERElBUWpKbWc3?=
 =?utf-8?B?ZXZ4cFZPWkhJUXdVV2xBQ2QxUnV1RDV0ZzN2TW9YWkVGMFZoa1IwUzBMZHlD?=
 =?utf-8?B?UVBVQW5WVjJ5YVRiczRYZnVBRjQrNVNHNzBiWTVZbUVPWGF1MllJODZtdkM3?=
 =?utf-8?B?K1VMQWNOOWVyby84Nk1lNWN2YWRsMld4T2w4anFpRFVacW80WnFBOXlzK2pY?=
 =?utf-8?B?cUo4a2ZZWWZ2RjVGRXdhQ1Z0Qmg0RlIvNERpeitGL040VXFnanpmOFFmWFNm?=
 =?utf-8?B?OFBIdjROZVlhR1Z2S2kybkhRcjcyTzdVTjZWcUVmM3lyQXZqZ1B5cXFTN1V1?=
 =?utf-8?B?cVgrdHh6ekE3QndTaEExTkFHSENPTjNxd1dOS2w3ZkozZzl5OHducCtjY1Y3?=
 =?utf-8?B?TnRBYzZQaXRpbndtRFB2RlZzdHRLSE0ySmxQWXlrSGxYOEVnUjc2SlVYek9E?=
 =?utf-8?B?UlFSa3NpNUVDQlVvVkF4RzkrRVEvRHBVbGtzbEZZc0c2NEpXYWlMZmIxem0z?=
 =?utf-8?B?cmNqTFhCSFdvbW81S3VlQmZyS1BTNzFUVk54bkFmVGtkbHFySmFNd0JFQ2NO?=
 =?utf-8?B?eVRieHp5UFZYd2UxYmozUTYzV3NFN1AwL2pTR1N6LzVSU1d1ajd4cVJuc0Iz?=
 =?utf-8?B?WE9XMzMxUkh1ckNBNDJlTGd0T09ibjNaQUlSOUFHVE5CTnVxTnZOWjVKYnZ1?=
 =?utf-8?B?c1h1ZjJKOFU2aUpQMG9JNEhRK3gxZm1XN2RBYUlaQXpIYlRGUzVOZ2p2VFZ2?=
 =?utf-8?B?NFdYQkNvc29qcmxLNG41UHI0OTg1WXE1Z2xWOXFwcmNPR25TTXlXRjdZendL?=
 =?utf-8?B?M0xXY3dwSkp0VjNxa0VOd3M1UDIvbUVmR2hOVk1wZ2tTR213VmJtT0dSNVV5?=
 =?utf-8?B?aFRqQmcwUW94dXJSSGFyRm0xa3g2TjlGZGx6Y3ZUSTZ6ekxpbEFCQjdSWC9u?=
 =?utf-8?B?THNheFVwcGVwVlhycnpXbEpPSXlqZ3NNY2VITTlpd2hoclFqUTkvcWRDNzVY?=
 =?utf-8?B?ZGkxZHBCUEROM09ZYWwyS0UvV05qbnZyaXBvY1VUNEN5SzVsamdZNVZTb0xs?=
 =?utf-8?B?aWd6dVhEU3hTeUpDN0x5TlNIWW12cWcwWDlrUXhtclBvMVJTZTUra1J3MmtN?=
 =?utf-8?B?K3pZZGZwRXc0czN2d0UxRmRSK2FWdmZvejJrR2F4ZGp0Qm5vK1ZBWEhWaXhG?=
 =?utf-8?B?bUg3Zys0TG9RNmVtZnBhSkxUYkU0TEtpMHFabEtXZ0k1QlIvZTBWU0NDaVNV?=
 =?utf-8?B?SDdOREZxclBZRWNRZm1YUVU2cDJPODRNblorNjRad0c3Tk1xK2xEelZSWmtz?=
 =?utf-8?Q?33izOXBvLSp/bMlwG17pyA4PtSKemWDAZVLGo5f?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5cc7f4-0c49-4918-8d0d-08d904d56863
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2021 14:54:47.3946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8PGgLu6EjOwnlhuLfaoBCnvYYrzxAPDHyidVKAzJGoUwKWGS3Z4Llqzh1U9IwWvIJ365tKnrdBPYYax0oDxDsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3056
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjAyMDEvMDQvMjAgMjI6MDEgTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+
IHdyb3RlOg0KPiBBbSBEaWVuc3RhZywgZGVtIDIwLjA0LjIwMjEgdW0gMTM6NDcgKzAwMDAgc2No
cmllYiBSb2JpbiBHb25nOg0KPiA+IE9uIDIwMjEvMDQvMTkgMTc6NDYgTHVjYXMgU3RhY2ggPGwu
c3RhY2hAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOg0KPiA+ID4gQW0gTW9udGFnLCBkZW0gMTkuMDQu
MjAyMSB1bSAwNzoxNyArMDAwMCBzY2hyaWViIFJvYmluIEdvbmc6DQo+ID4gPiA+IEhpIEx1Y2Fz
LA0KPiA+ID4gPg0KPiA+ID4gPiBPbiAyMDIxLzA0LzE0IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBl
bmd1dHJvbml4LmRlPiB3cm90ZToNCj4gPiA+ID4gPiBIaSBSb2JpbiwNCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IEFtIE1pdHR3b2NoLCBkZW0gMTQuMDQuMjAyMSB1bSAxNDozMyArMDAwMCBzY2hyaWVi
IFJvYmluIEdvbmc6DQo+ID4gPiA+ID4gPiBPbiAyMDIwLzA1LzIwIDE3OjQzIEx1Y2FzIFN0YWNo
IDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPiB3cm90ZToNCj4gPiA+ID4gPiA+ID4gQW0gTWl0dHdv
Y2gsIGRlbiAyMC4wNS4yMDIwLCAxNjoyMCArMDgwMCBzY2hyaWViIFNoZW5naml1DQo+IFdhbmc6
DQo+ID4gPiA+ID4gPiA+ID4gSGkNCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IE9u
IFR1ZSwgTWF5IDE5LCAyMDIwIGF0IDY6MDQgUE0gTHVjYXMgU3RhY2gNCj4gPiA+ID4gPiA+ID4g
PiA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4NCj4gPiA+ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+
ID4gPiA+ID4gPiBBbSBEaWVuc3RhZywgZGVuIDE5LjA1LjIwMjAsIDE3OjQxICswODAwIHNjaHJp
ZWIgU2hlbmdqaXUNCj4gV2FuZzoNCj4gPiA+ID4gPiA+ID4gPiA+ID4gVGhlcmUgYXJlIHR3byBy
ZXF1aXJlbWVudHMgdGhhdCB3ZSBuZWVkIHRvIG1vdmUgdGhlDQo+ID4gPiA+ID4gPiA+ID4gPiA+
IHJlcXVlc3Qgb2YgZG1hIGNoYW5uZWwgZnJvbSBwcm9iZSB0byBvcGVuLg0KPiA+ID4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IEhvdyBkbyB5b3UgaGFuZGxlIC1FUFJPQkVfREVGRVIg
cmV0dXJuIGNvZGUgZnJvbSB0aGUNCj4gPiA+ID4gPiA+ID4gPiA+IGNoYW5uZWwgcmVxdWVzdCBp
ZiB5b3UgZG9uJ3QgZG8gaXQgaW4gcHJvYmU/DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
ID4gPiBJIHVzZSB0aGUgZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbCBvciBkbWFfcmVxdWVzdF9j
aGFubmVsDQo+ID4gPiA+ID4gPiA+ID4gaW5zdGVhZCBvZiBkbWFlbmdpbmVfcGNtX3JlcXVlc3Rf
Y2hhbl9vZi4gc28gdGhlcmUgc2hvdWxkDQo+ID4gPiA+ID4gPiA+ID4gYmUgbm90IC1FUFJPQkVf
REVGRVIgcmV0dXJuIGNvZGUuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFRoaXMgaXMg
YSBwcmV0dHkgd2VhayBhcmd1bWVudC4gVGhlIGRtYWVuZ2luZSBkZXZpY2UgbWlnaHQNCj4gPiA+
ID4gPiA+ID4gcHJvYmUgYWZ0ZXIgeW91IHRyeSB0byBnZXQgdGhlIGNoYW5uZWwuIFVzaW5nIGEg
ZnVuY3Rpb24gdG8NCj4gPiA+ID4gPiA+ID4gcmVxdWVzdCB0aGUgY2hhbm5lbCB0aGF0IGRvZXNu
J3QgYWxsb3cgeW91IHRvIGhhbmRsZSBwcm9iZQ0KPiA+ID4gPiA+ID4gPiBkZWZlcnJhbCBpcyBJ
TUhPIGEgYnVnIGFuZCBzaG91bGQgYmUgZml4ZWQsIGluc3RlYWQgb2YNCj4gPiA+ID4gPiA+ID4g
YnVpbGRpbmcgZXZlbiBtb3JlIGFzc3VtcHRpb25zIG9uIHRvcA0KPiA+ID4gPiA+IG9mIGl0Lg0K
PiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiAtIFdoZW4gZG1hIGRldmljZSBiaW5k
cyB3aXRoIHBvd2VyLWRvbWFpbnMsIHRoZSBwb3dlcg0KPiA+ID4gPiA+ID4gPiA+ID4gPiB3aWxs
IGJlIGVuYWJsZWQgd2hlbiB3ZSByZXF1ZXN0IGRtYSBjaGFubmVsLiBJZiB0aGUNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gcmVxdWVzdCBvZiBkbWEgY2hhbm5lbCBoYXBwZW4gb24gcHJvYmUsIHRoZW4g
dGhlDQo+ID4gPiA+ID4gPiA+ID4gPiA+IHBvd2VyLWRvbWFpbnMgd2lsbCBiZSBhbHdheXMgZW5h
YmxlZCBhZnRlciBrZXJuZWwgYm9vdA0KPiA+ID4gPiA+ID4gPiA+ID4gPiB1cCwgIHdoaWNoIGlz
IG5vdCBnb29kIGZvciBwb3dlciBzYXZpbmcsICBzbyB3ZSBuZWVkDQo+ID4gPiA+ID4gPiA+ID4g
PiA+IHRvIG1vdmUgdGhlIHJlcXVlc3Qgb2YgZG1hIGNoYW5uZWwgdG8gLm9wZW4oKTsNCj4gPiA+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIGlzIGNlcnRhaW5seSBzb21ldGhp
bmcgd2hpY2ggY291bGQgYmUgZml4ZWQgaW4gdGhlDQo+ID4gPiA+ID4gPiA+ID4gPiBkbWFlbmdp
bmUgZHJpdmVyLg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gRG1hIGRyaXZlciBh
bHdheXMgY2FsbCB0aGUgcG1fcnVudGltZV9nZXRfc3luYyBpbg0KPiA+ID4gPiA+ID4gPiA+IGRl
dmljZV9hbGxvY19jaGFuX3Jlc291cmNlcywgdGhlDQo+ID4gPiA+ID4gPiA+ID4gZGV2aWNlX2Fs
bG9jX2NoYW5fcmVzb3VyY2VzIGlzIGNhbGxlZCB3aGVuIGNoYW5uZWwgaXMNCj4gPiA+ID4gPiA+
ID4gPiByZXF1ZXN0ZWQuIHNvIHBvd2VyIGlzIGVuYWJsZWQgb24gY2hhbm5lbA0KPiA+ID4gPiA+
IHJlcXVlc3QuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFNvIHdoeSBjYW4ndCB5b3Ug
Zml4IHRoZSBkbWFlbmdpbmUgZHJpdmVyIHRvIGRvIHRoYXQgUlBNDQo+ID4gPiA+ID4gPiA+IGNh
bGwgYXQgYSBsYXRlciB0aW1lIHdoZW4gdGhlIGNoYW5uZWwgaXMgYWN0dWFsbHkgZ29pbmcgdG8N
Cj4gPiA+ID4gPiA+ID4gYmUgdXNlZD8gVGhpcyB3aWxsIGFsbG93IGZ1cnRoZXIgcG93ZXIgc2F2
aW5ncyB3aXRoIG90aGVyDQo+ID4gPiA+ID4gPiA+IHNsYXZlIGRldmljZXMgdGhhbiB0aGUgYXVk
aW8NCj4gPiA+IFBDTS4NCj4gPiA+ID4gPiA+IEhpIEx1Y2FzLA0KPiA+ID4gPiA+ID4gwqDCoFRo
YW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLiBJIGhhdmUgdHJpZWQgdG8gaW1wbGVtZW50DQo+ID4g
PiA+ID4gPiBydW50aW1lIGF1dG9zdXNwZW5kIGluIGZzbC1lZG1hIGRyaXZlciBvbiBpLm14OHFt
L3F4cCB3aXRoDQo+ID4gPiA+ID4gPiBkZWxheSB0aW1lICgyDQo+ID4gPiA+ID4gPiBzZWMpIGZv
ciB0aGlzIGZlYXR1cmUgYXMgYmVsb3cgKG9yIHlvdSBjYW4gcmVmZXIgdG8NCj4gPiA+ID4gPiA+
IGRyaXZlcnMvZG1hL3Fjb20vaGlkbWEuYyksIGFuZCBwbV9ydW50aW1lX2dldF9zeW5jLw0KPiA+
ID4gPiA+ID4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQgaW4gYWxsIGRtYWVuZ2luZSBkcml2
ZXIgaW50ZXJmYWNlDQo+ID4gPiA+ID4gPiBsaWtlDQo+ID4gPiA+ID4gPiBkZXZpY2VfYWxsb2Nf
Y2hhbl9yZXNvdXJjZXMvZGV2aWNlX3ByZXBfc2xhdmVfc2cvZGV2aWNlX3ByZXBfZA0KPiA+ID4g
PiA+ID4gbWFfYw0KPiA+ID4gPiA+ID4geWNsaQ0KPiA+ID4gPiA+ID4gYy8NCj4gPiA+ID4gPiA+
IGRldmljZV90eF9zdGF0dXMuLi4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwbV9ydW50aW1lX3VzZV9hdXRvc3Vz
cGVuZChmc2xfY2hhbi0+ZGUNCj4gdik7DQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2RlbGF5KGZzbF9jaGENCj4g
bi0+DQo+ID4gPiBkZXYsDQo+ID4gPiA+ID4gMjAwMCk7DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gVGhhdCBjb3VsZCByZXNvbHZlIHRoaXMgYXVkaW8gY2FzZSBzaW5jZSB0aGUgYXV0b3N1c3Bl
bmQgY291bGQNCj4gPiA+ID4gPiA+IHN1c3BlbmQgcnVudGltZSBhZnRlcg0KPiA+ID4gPiA+ID4g
MiBzZWNvbmRzIGlmIHRoZXJlIGlzIG5vIGZ1cnRoZXIgZG1hIHRyYW5zZmVyIGJ1dCBvbmx5IGNo
YW5uZWwNCj4gPiA+ID4gPiByZXF1ZXN0KGRldmljZV9hbGxvY19jaGFuX3Jlc291cmNlcykuDQo+
ID4gPiA+ID4gPiBCdXQgdW5mb3J0dW5hdGVseSwgaXQgY2F1c2UgYW5vdGhlciBpc3N1ZS4gQXMg
eW91IGtub3csIG9uIG91cg0KPiA+ID4gPiA+ID4gaS5teDhxbS9xeHAsIHBvd2VyIGRvbWFpbiBk
b25lIGJ5IHNjZncNCj4gPiA+ID4gPiA+IChkcml2ZXJzL2Zpcm13YXJlL2lteC9zY3UtcGQuYykN
Cj4gPiA+ID4gPiBvdmVyIG1haWxib3g6DQo+ID4gPiA+ID4gPiDCoGlteF9zY19wZF9wb3dlcigp
LT5pbXhfc2N1X2NhbGxfcnBjKCktPg0KPiA+ID4gPiA+ID4gaW14X3NjdV9pcGNfd3JpdGUoKS0+
bWJveF9zZW5kX21lc3NhZ2UoKQ0KPiA+ID4gPiA+ID4gd2hpY2ggbWVhbnMgaGF2ZSB0byAnd2Fp
dHMgZm9yIGNvbXBsZXRpb24nLCBtZWFud2hpbGUsIHNvbWUNCj4gPiA+ID4gPiA+IGRyaXZlciBs
aWtlIHR0eSB3aWxsIGNhbGwgZG1hZW5naW5lIGludGVyZmFjZXMgaW4gbm9uLWF0b21pYw0KPiA+
ID4gPiA+ID4gY2FzZSBhcyBiZWxvdywNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBzdGF0aWMg
aW50IHVhcnRfd3JpdGUoc3RydWN0IHR0eV9zdHJ1Y3QgKnR0eSwgY29uc3QgdW5zaWduZWQNCj4g
PiA+ID4gPiA+IGNoYXIgKmJ1ZiwgaW50IGNvdW50KSB7DQo+ID4gPiA+ID4gPiDCoMKgwqAuLi4u
Li4uDQo+ID4gPiA+ID4gPiAJICAgIHBvcnQgPSB1YXJ0X3BvcnRfbG9jayhzdGF0ZSwgZmxhZ3Mp
Ow0KPiA+ID4gPiA+ID4gwqDCoMKgLi4uLi4uDQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
X191YXJ0X3N0YXJ0KHR0eSk7ICAvL2NhbGwNCj4gPiA+IHN0YXJ0X3R4KCktPmRtYWVuZ2luZV9w
cmVwX3NsYXZlX3NnLi4uDQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdWFydF9wb3J0X3Vu
bG9jayhwb3J0LCBmbGFncyk7DQo+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJl
dDsNCj4gPiA+ID4gPiA+IH0NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBUaHVzIGRtYSBydW50
aW1lIHJlc3VtZSBtYXkgaGFwcGVuIGluIHRoYXQgdGltaW5nIHdpbmRvdyBhbmQNCj4gPiA+ID4g
PiA+IGNhdXNlDQo+ID4gPiA+ID4ga2VybmVsIGFsYXJtLg0KPiA+ID4gPiA+ID4gSSdtIG5vdCBz
dXJlIHdoZXRoZXIgdGhlcmUgYXJlIHNpbWlsYXIgbGltaXRhdGlvbnMgb24gb3RoZXINCj4gPiA+
ID4gPiA+IGRyaXZlciBzdWJzeXN0ZW0uIEJ1dCBmb3IgbWUsIEl0IGxvb2tzIGxpa2UgdGhlIG9u
bHkgd2F5IHRvDQo+ID4gPiA+ID4gPiByZXNvbHZlIHRoZSBjb250cmFkaWN0aW9uIGJldHdlZW4g
dHR5IGFuZCBzY3UtcGQgKGhhcmR3YXJlDQo+ID4gPiA+ID4gPiBsaW1pdGF0aW9uIG9uDQo+ID4g
PiA+ID4gPiBpLm14OHFtL3F4cCkgaXMgdG8gZ2l2ZSB1cCBhdXRvc3VzcGVuZCBhbmQga2VlcA0K
PiA+ID4gPiA+ID4gcG1fcnVudGltZV9nZXRfc3luYw0KPiA+ID4gPiA+IG9ubHkgaW4gZGV2aWNl
X2FsbG9jX2NoYW5fcmVzb3VyY2VzIGJlY2F1c2UgcmVxdWVzdCBjaGFubmVsIGlzIGENCj4gPiA+
ID4gPiBzYWZlIG5vbi1hdG9taWMgcGhhc2UuDQo+ID4gPiA+ID4gPiBEbyB5b3UgaGF2ZSBhbnkg
aWRlYT8gVGhhbmtzIGluIGFkdmFuY2UuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJZiB5b3UgbG9v
ayBjbG9zZWx5IGF0IHRoZSBkcml2ZXIgeW91IHVzZWQgYXMgYW4gZXhhbXBsZQ0KPiA+ID4gPiA+
IChoaWRtYS5jKSBpdCBsb29rcyBsaWtlIHRoZXJlIGlzIGFscmVhZHkgc29tZXRoaW5nIGluIHRo
ZXJlLA0KPiA+ID4gPiA+IHdoaWNoIGxvb2tzIHZlcnkgbXVjaCBsaWtlIHdoYXQgeW91IG5lZWQN
Cj4gPiA+ID4gPiBoZXJlOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSW4gaGlkbWFfaXNzdWVfcGVu
ZGluZygpIHRoZSBkcml2ZXIgdHJpZXMgdG8gZ2V0IHRoZSBkZXZpY2UgdG8NCj4gPiA+ID4gPiBy
dW50aW1lDQo+ID4gPiByZXN1bWUuDQo+ID4gPiA+ID4gSWYgdGhpcyBkb2Vzbid0IHdvcmssIG1h
eWJlIGR1ZSB0byB0aGUgcG93ZXIgZG9tYWluIGNvZGUgbm90DQo+ID4gPiA+ID4gYmVpbmcgYWJs
ZSB0byBiZSBjYWxsZWQgaW4gYXRvbWljIGNvbnRleHQsIHRoZSBhY3R1YWwgd29yayBvZg0KPiA+
ID4gPiA+IHdha2luZyB1cCB0aGUgZG1hIGhhcmR3YXJlIGFuZCBpc3N1aW5nIHRoZSBkZXNjcmlw
dG9yIGlzIHNodW50ZWQgdG8gYQ0KPiB0YXNrbGV0Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSWYg
SSdtIHJlYWRpbmcgdGhpcyByaWdodCwgdGhpcyBpcyBleGFjdGx5IHdoYXQgeW91IG5lZWQgaGVy
ZSB0bw0KPiA+ID4gPiA+IGJlIGFibGUgdG8gY2FsbCB0aGUgZG1hZW5naW5lIGNvZGUgZnJvbSBh
dG9taWMgY29udGV4dDogdHJ5IHRoZQ0KPiA+ID4gPiA+IHJwbSBnZXQgYW5kIGlzc3VlIGltbWVk
aWF0ZWx5IHdoZW4gcG9zc2libGUsIG90aGVyd2lzZSBzaHVudCB0aGUNCj4gPiA+ID4gPiB3b3Jr
IHRvIGENCj4gPiA+ID4gPiBub24tIGF0b21pYyBjb250ZXh0IHdoZXJlIHlvdSBjYW4gZGVhbCB3
aXRoIHRoZSByZXF1aXJlbWVudHMgb2YNCj4gc2N1LXBkLg0KPiA+ID4gPiBZZXMsIEkgY2FuIHNj
aGVkdWxlX3dvcmsgdG8gd29ya2VyIHRvIHJ1bnRpbWUgcmVzdW1lIGVkbWEgY2hhbm5lbA0KPiA+
ID4gPiBieQ0KPiA+ID4gY2FsbGluZyBzY3UtcGQuDQo+ID4gPiA+IEJ1dCB0aGF0IG1lYW5zIGFs
bCBkbWFlbmdpbmUgaW50ZXJmYWNlcyBzaG91bGQgYmUgdGFrZW4gY2FyZSwgbm90DQo+ID4gPiA+
IG9ubHkNCj4gPiA+ID4gaXNzdWVfcGVuZGluZygpIGJ1dCBhbHNvDQo+ID4gPiA+IGRtYWVuZ2lu
ZV90ZXJtaW5hdGVfYWxsKCkvZG1hZW5naW5lX3BhdXNlKCkvZG1hZW5naW5lX3Jlc3VtZSgpLw0K
PiA+ID4gPiBkbWFlbmdpbmVfdHhfc3RhdHVzKCkuIE5vdCBzdXJlIHdoeSBoaWRtYSBvbmx5IHRh
a2UgY2FyZQ0KPiA+ID4gPiBpc3N1ZV9wZW5kaW5nLiBNYXliZSB0aGVpciB1c2VyIGNhc2UgaXMg
anVzdCBmb3IgbWVtY3B5L21lbXNldCBzbw0KPiA+ID4gPiB0aGF0IG5vIGZ1cnRoZXIgY29tcGxp
Y2F0ZSBjYXNlIGFzIEFMU0Egb3IgVFRZLg0KPiA+ID4gPiBCZXNpZGVzLCBmb3IgYXV0b3N1c3Bl
bmQgaW4gY3ljbGljLCB3ZSBoYXZlIHRvIGFkZA0KPiA+ID4gPiBwbV9ydW50aW1lX2dldF9zeW5j
IGludG8gaW50ZXJydXB0IGhhbmRsZXIgYXMgcWNvbS9iYW1fZG1hLmMuIGJ1dA0KPiA+ID4gPiBo
b3cgY291bGQgcmVzb2x2ZSB0aGUgc2N1LXBkJ3Mgbm9uLWF0bW9pYyBsaW1pdGF0aW9uIGluIGlu
dGVycnVwdA0KPiBoYW5kbGVyPw0KPiA+ID4NCj4gPiA+IFN1cmUsIHRoaXMgYWxsIG5lZWRzIHNv
bWUgY2FyZWZ1bCBhbmFseXNpcyBvbiBob3cgdGhvc2UgZnVuY3Rpb25zDQo+ID4gPiBhcmUgY2Fs
bGVkIGFuZCB3aGF0IHRvIGRvIGFib3V0IGF0b21pYyBjYWxsZXJzLCBidXQgaXQgc2hvdWxkIGJl
DQo+ID4gPiBkb2FibGUuIEkgZG9uJ3Qgc2VlIGFueSBmdW5kYW1lbnRhbCBpc3N1ZXMgaGVyZS4N
Cj4gPiA+DQo+ID4gPiBJIGRvbid0IHNlZSB3aHkgeW91IHdvdWxkIGV2ZXIgbmVlZCB0byB3YWtl
IHRoZSBoYXJkd2FyZSBpbiBhbg0KPiA+ID4gaW50ZXJydXB0IGhhbmRsZXIuIFN1cmVseSB0aGUg
aGFyZHdhcmUgaXMgYWxyZWFkeSBhd2FrZSwgYXMgaXQNCj4gPiA+IHdvdWxkbid0IHNpZ25hbCBh
biBpbnRlcnJ1cHQgb3RoZXJ3aXNlLiBBbmQgZm9yIHRoZSBpc3N1ZSB3aXRoDQo+ID4gPiBzY3Ut
cGQgeW91IG9ubHkgY2FyZSBhYm91dCB0aGUgc3RhdGUgdHJhbnNpdGlvbiBvZg0KPiA+ID4gc3Vz
cGVuZGVkLT5ydW5uaW5nLiBJZiB0aGUgaGFyZHdhcmUgaXMgYWxyZWFkeSBydW5uaW5nL2F3YWtl
LCB0aGUNCj4gPiA+IHJ1bnRpbWUgcG0gc3RhdGUgaGFuZGxpbmcgaXMgbm90aGluZyBtb3JlIHRo
YW4gYnVtcGluZyBhIHJlZmNvdW50LA0KPiA+ID4gd2hpY2ggaXMgYXRvbWljIHNhZmUuIFB1dHRp
bmcgdGhlIEhXIGluIHN1c3BlbmQgaXMgYWxyZWFkeSBoYW5kbGVkDQo+IGFzeW5jaHJvbm91c2x5
IGluIGEgd29ya2VyLCBzbyB0aGlzIGlzIGFsc28gYXRvbWljIHNhZmUuDQo+ID4gQnV0IHdpdGgg
YXV0b3N1c3BlbmQgdXNlZCwgaW4gY29ybmVyIGNhc2UsIG1heSBydW50aW1lIHN1c3BlbmRlZA0K
PiA+IGJlZm9yZSBmYWxsaW5nIEludG8gZWRtYSBpbnRlcnJ1cHQgaGFuZGxlciBpZiB0aW1lb3V0
IGhhcHBlbiB3aXRoIHRoZQ0KPiA+IGRlbGF5IHZhbHVlIG9mIHBtX3J1bnRpbWVfc2V0X2F1dG9z
dXNwZW5kX2RlbGF5KCkuIFRodXMsIGNhbid0IHRvdWNoDQo+ID4gYW55IGVkbWEgaW50ZXJydXB0
IHN0YXR1cyByZWdpc3RlciB1bmxlc3MgcnVudGltZSByZXN1bWUgZWRtYSBpbg0KPiA+IGludGVy
cnVwdCBoYW5kbGVyIHdoaWxlIHJ1bnRpbWUgcmVzdW1lIGZ1bmN0aW9uIGJhc2VkIG9uIHNjdS1w
ZCdzIHBvd2VyDQo+IGRvbWFpbiBtYXkgYmxvY2sgb3Igc2xlZXAuDQo+ID4gSSBoYXZlIGEgc2lt
cGxlIHdvcmthcm91bmQgdGhhdCBkaXNhYmxlIHJ1bnRpbWUgc3VzcGVuZCBpbg0KPiA+IGlzc3Vl
X3BlbmRpbmcgd29ya2VyIGJ5IGNhbGxpbmcgcG1fcnVudGltZV9mb3JiaWQoKSBhbmQgdGhlbiBl
bmFibGUNCj4gPiBydW50aW1lIGF1dG8gc3VzcGVuZCBpbiBkbWFlbmdpbmVfdGVybWluYXRlX2Fs
bCBzbyB0aGF0IHdlIGNvdWxkDQo+ID4gZWFzaWx5IHJlZ2FyZCB0aGF0IGVkbWEgY2hhbm5lbCBp
cyBhbHdheXMgaW4gcnVudGltZSByZXN1bWUgYmV0d2Vlbg0KPiA+IGlzc3VlX3BlbmRpbmcgYW5k
IGNoYW5uZWwgdGVybWluYXRlZCBhbmQgaWdub3JlIHRoZSBhYm92ZSBpbnRlcnJ1cHQNCj4gaGFu
ZGxlci9zY3UtcGQgbGltaXRhdGlvbi4NCj4gDQo+IFRoZSBJUlEgaGFuZGxlciBpcyB0aGUgcG9p
bnQgd2hlcmUgeW91IGFyZSBpbmZvcm1lZCBieSB0aGUgaGFyZHdhcmUgdGhhdCBhDQo+IHNwZWNp
ZmljIG9wZXJhdGlvbiBpcyBjb21wbGV0ZS4gSSBkb24ndCBzZWUgYW55IHVzZS1jYXNlIHdoZXJl
IGl0IHdvdWxkIGJlIHZhbGlkDQo+IHRvIGRyb3AgdGhlIHJwbSByZWZjb3VudCB0byAwIGJlZm9y
ZSB0aGUgSVJRIGlzIGhhbmRsZWQuIFN1cmVseSB0aGUgaGFyZHdhcmUNCj4gbmVlZHMgdG8gc3Rh
eSBhd2FrZSB1bnRpbCB0aGUgY3VycmVudGx5IHF1ZXVlZCBvcGVyYXRpb25zIGFyZSBjb21wbGV0
ZSBhbmQgaWYNCj4gdGhlIElSUSBoYW5kbGVyIGlzIHRoZSBjb21wbGV0aW9uIHBvaW50IHRoZSBJ
UlEgaGFuZGxlciBpcyB0aGUgZmlyc3QgcG9pbnQgaW4NCj4gdGltZSB3aGVyZSB5b3VyIGF1dG9z
dXNwZW5kIHRpbWVyIHNob3VsZCBzdGFydCB0byBydW4uIFRoZXJlIHNob3VsZCBuZXZlciBiZQ0K
PiBhIHNpdHVhdGlvbiB3aGVyZSB0aGUgdGltZXIgZXhwaXJ5IGNhbiBnZXQgYmV0d2VlbiBJUlEg
c2lnbmFsaW5nIGFuZCB0aGUNCj4gaGFuZGxlciBjb2RlIHJ1bm5pbmcuDQpCdXQgdGhlIHRpbWVy
IG9mIHJ1bnRpbWVfYXV0b19zdXNwZW5kIGRlY2lkZSB3aGVuIGVudGVyIHJ1bnRpbWUgc3VzcGVu
ZCByYXRoZXINCnRoYW4gaGFyZHdhcmUsIHdoaWxlIHRyYW5zZmVyIGRhdGEgc2l6ZSBhbmQgdHJh
bnNmZXIgcmF0ZSBvbiBJUCBidXMgZGVjaWRlIHdoZW4gdGhlDQpkbWEgaW50ZXJydXB0IGhhcHBl
bi4gIEdlbmVyYWxseSwgd2UgY2FuIGNhbGwgcG1fcnVudGltZV9nZXRfc3luYyhmc2xfY2hhbi0+
ZGV2KS8NCnBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3kgaW4gaW50ZXJydXB0IGhhbmRsZXIgdG8g
aG9wZSB0aGUgcnVudGltZV9hdXRvX3N1c3BlbmQNCnRpbWVyIGV4cGlyeSBsYXRlciB0aGFuIGlu
dGVycnVwdCBjb21pbmcsIGJ1dCBpZiB0aGUgdHJhbnNmZXIgZGF0YSBzaXplIGlzIGxhcmdlciBp
biBjeWNsaWMNCmFuZCB0cmFuc2ZlciByYXRlIGlzIHZlcnkgc2xvdyBsaWtlIDExNTIwMCBvciBs
b3dlciBvbiB1YXJ0LCB0aGUgZml4IGF1dG9zdXNwZW5kIHRpbWVyDQoxMDBtcy8yMDBtcyBtYXli
ZSBub3QgZW5vdWdoLCBoZW5jZSwgcnVudGltZSBzdXNwZW5kIG1heSBleGVjdXRlIG1lYW53aGls
ZQ0KdGhlIGRtYSBpbnRlcnJ1cHQgbWF5YmUgdHJpZ2dlcmVkIGFuZCBjYXVnaHQgYnkgR0lDKGJ1
dCBpbnRlcnJ1cHQgaGFuZGxlciBwcmV2ZW50DQpieSBzcGluX2xvY2tfaXJxc2F2ZSBpbiBwbV9z
dXNwZW5kX3RpbWVyX2ZuKCkgKSwgYW5kIHRoZW4gaW50ZXJydXB0IGhhbmRsZXIgc3RhcnQNCnRv
IHJ1biBhZnRlciBydW50aW1lIHN1c3BlbmQuIA0KDQo=
