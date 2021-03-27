Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9AB34B7B6
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 15:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhC0OdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 10:33:17 -0400
Received: from mail-eopbgr00068.outbound.protection.outlook.com ([40.107.0.68]:24452
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230266AbhC0Ocv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 10:32:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWj4IogThm3sDGVIUhbfr0lXcKKdiD+ElqO4WmziPprT75Jx3Fe043dQgt+ARxd+6KTF6EIsZFUT/r8WlTI1Tv+gdkAZcTXtPLyUUNxDj0+NLEqR4RT8vOI73witb1k8ceb+cMQOmYc2psEdvusy2SXhs3VnrYyHCdi3XD7q5IjKC7GWJmDTUDDgszWMoSNmaFyBf9NzC6lj5W0maxr890tVRpDu2dFIJgpHFfYSNl/OSVhvO+9v8BgSWDMK2UQ+UBMeGZ2l20weyh74pSkcZpBoEcsjiB5z8GHbt4t34ArG6huE4QBRCfXPmoO4FaZBSRZ2uiMlr4XKuXLcs3fkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsNAfiRL/gjyqD9+oTUSNoTMFz3D3GbLt3ymdJVsnBg=;
 b=jejZfJ4nXEHWznbEv8WnJi/zzjHxRp+owgorLGa83hdBFWsWLlsvMnrvyUO72bcf1bLXc0rdNGZHxacqlCFA1yMNWV56B+JziInMakQEPxRSv+NwFQb4L5LV3U6hGkpf77CGxfBZkxI40ORooZrzDRnlF6hAi+Dt+pzkZ6YPKha4F72Ylzr7LHbPGLVmpnmmZ2a8K0DIqvxAEqO/OiW0lqTD8YVwIB9u4D9Nh8jm7qmumAoZHKg1LRpeqKm95rFXHQoGp9QJQ1Pz4zLRHUdcpldMhkHujCrTZwdVtEvpgBlOu612MxOefU4X9xxzWAB9p/vBtV934VPmN6Bkxu3aTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsNAfiRL/gjyqD9+oTUSNoTMFz3D3GbLt3ymdJVsnBg=;
 b=N7SN6SilLMub/m7eOrz0AcNqXXJizrihhVaeCFsWOwA3DXaEGw4aE6xwLFL25NWNPX+XAQQd/d42uiZY0Qc44rjnfRCvOq1J0ySTcsmLDV7yJ+USIEZJjibNB/0YWYTsp9TxUdtf8UvgNl6os3FtITat/LE9Dh48XUrSAouMbAE=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB6038.eurprd04.prod.outlook.com (2603:10a6:20b:b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Sat, 27 Mar
 2021 14:32:49 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::15d6:e539:4f60:d7df]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::15d6:e539:4f60:d7df%6]) with mapi id 15.20.3955.027; Sat, 27 Mar 2021
 14:32:49 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     dl-linux-imx <linux-imx@nxp.com>,
        "colin.king@canonical.com" <colin.king@canonical.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [EXT] [PATCH][next] media: imx-jpeg: Pass the v4l2_jpeg_header
 header argument by reference
Thread-Topic: [EXT] [PATCH][next] media: imx-jpeg: Pass the v4l2_jpeg_header
 header argument by reference
Thread-Index: AQHXH/A7QlB6xhUytEGHmYi2XKljB6qX7D0A
Date:   Sat, 27 Mar 2021 14:32:49 +0000
Message-ID: <746d11c3f0feb79f0e8fdc16d5bdead3795f1f3e.camel@nxp.com>
References: <20210323142421.348695-1-colin.king@canonical.com>
In-Reply-To: <20210323142421.348695-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [86.124.171.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4c4cf9ed-01e2-42cb-353e-08d8f12d3268
x-ms-traffictypediagnostic: AM6PR04MB6038:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB60383E7B6DC2AB5BC62798828F609@AM6PR04MB6038.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5YA+ZV4z9z10K0b76mrZ0gugZofUmvan/kjYa174g7mqeu/XeyG5X5BiAfI+YnvSFbrUqsVdxhGIaB+vik2/NYYwPyBXpta/rS2PBtoahmol4U6uS234QP7XYJ8YW0m4qX8UKzntIWSdbcXwUO5e3jp/aAiemzql6Q9J9xwXjZ0gpWQ3REpZA8M8UxyGTiAmMcwrZhLc3ib7bAc87nwPxPyBr3efUrzWgXDOEX6A36me3cT+R/mlR/jEUt8Ltr+NNUMfOeoPFdex6FK1Zxs8OMX0J6WF6DxzIJ0cwPsLEDb19b/AOZBV9AfYkfT9oboy7OEz3Jy/fjm31ljGX3hUk0IORFBZbcXsiENai5xij6iSD8aRqn3+2ZijX0gspeKyoYV/fDvDbQCglkE4ZtpnpLkvJEarNVYOPnwsF5AfG8yrjz/oEBrHrZ2hKO0hqehRPWznrW2B1MIxkuWv7URiwEAaxTtsoL+yzwCWcyhOq91jYILM1DIjU0CEp0COPF19JzAs4fTSbxsBV5n57zSJZIIHzjTluXed4cFMf3XH0c1CH7U2aAijKkSFFSufyEVHZj7oHMwrT5Ug/FYxTzJybA/BAlxQzC0BCzRDwbQcVWad3B7UVXQOzbD/u25Ux3LJtv3G1yWIbLn4JboeTwngT2ftFA5XoSWpbvyNTOvr6vTdM3LkT86k554mBu749j4O3/RBEhQZU6uBm13LJNJOCw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(5660300002)(8936002)(66476007)(316002)(7416002)(6512007)(64756008)(66946007)(76116006)(66556008)(91956017)(4326008)(110136005)(66446008)(2906002)(38100700001)(8676002)(2616005)(186003)(83380400001)(921005)(6506007)(54906003)(71200400001)(6486002)(86362001)(478600001)(44832011)(36756003)(26005)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OXNnSHZUR2Q3LzVjdWw5MWZtajJiV2Vjbk9nU24vZWxvUzg0MGZtdE5aVE53?=
 =?utf-8?B?OGQvT0QvYysxNEliREwxZFl2azIrR1dlSFdMbTI5cjgrMGtKRGloMWxvclJs?=
 =?utf-8?B?NHZxdHZocVJPaEZ4dXZjb2ZtTFhyUkZ3U0V4S21XOFpRVzE2UkhITlFRQUNM?=
 =?utf-8?B?UnFQV0Y3L1VRSktzTzMvMElwZlhDdStWb2lCejZaQVFuNXVpaU9HT1crQXR3?=
 =?utf-8?B?cWRSeklnRjZhT0Z6OXZicDVJUUMyUkpVZTRvcWhiVTV6bWZrSnV6dGwrVCtX?=
 =?utf-8?B?YnBxL2ZQc0tqTm9tZ2RNWjBuR3lVUFFxbUNhZWJqK1FBaDFienY1K2Zkajl0?=
 =?utf-8?B?NzA0MzNnVmlsRVRLOE5aYnJjT0dHUEpWTU4xOW9qTWJxdHRRcUdBUVUxYTBC?=
 =?utf-8?B?ZC9rMkxqbmRpY1NVYzViM3NFM0Qrc1JnM0l2eXBWNVZoRlRybG9FUUp0cENo?=
 =?utf-8?B?OFdabXJ1WHJ6MG96RHFlMTA4cTVBb21GclhjdVlUN3phWkxYV2VlaGRPSzc1?=
 =?utf-8?B?eC9Tc2dkNy93Q1VWelNrRk9BYWU5Nk43VDlMYWNJQURFajZFMGZwcXBFTmM3?=
 =?utf-8?B?L0JlUGh0Mk5NQkVEQTdKSFlzZi9wbDZxUnFiRldGem5UbXBadWowT0MySkcw?=
 =?utf-8?B?VExadzA0amh3TjJLNWh1bGtzSFlPY1U3Nk1adVM4eFVTVFdzazJvZlliRys5?=
 =?utf-8?B?c0QwekpVeUhqaW1Rc0xtcVBRaWxWM2Y5WklTRzNLSVg5eXIwWXRURVpEUHZH?=
 =?utf-8?B?Ymx1anNPanIyUUkvNmZBd1dsTHlNaHZTWGFaOGxydnl1elBYam1jK21Fbmxl?=
 =?utf-8?B?VU9uRURXKzhhZHhsc0NBTHZiWDVwQXlJWmJVdkszWG9Hb1p6ZW5NbVRSdlZ3?=
 =?utf-8?B?SkhydmJpYmxvSld0d0ZTdVgwc3J3Q2hUQW02Sjc1c3g1bEovajZuVzFlS2hK?=
 =?utf-8?B?bXV6QWgwQ3JtQzAxSW4yZzQxbHNseXExNHpmakRRRURSZ1MwclVOZkt1cUVS?=
 =?utf-8?B?OW81U1JtaXFlNGsrN2FodTIvd3N1YXlQQzVlU0ZBVTZKSHNGUDBNSjFqalhP?=
 =?utf-8?B?YUFDQ01PUDhDSWFBN044SHdXOGRvbklDbS9maFpKWTY1czVCTnBQUXBES2p3?=
 =?utf-8?B?MWxBZngvN2NCaVJTNURDVVhxelpRRUx5ai9oby9yeVJqOWd0TGRwWkYveWIx?=
 =?utf-8?B?U3hGdzREWm5sTW1VVk00UHJpUGx0NWR2T29yaWxycWh5S2xrUDF6cWI4R0lU?=
 =?utf-8?B?bE43c1pCR0lIYWxPYXVBYmxORzljYzByRWsvQllDK292S081OTBGUVlFVlBO?=
 =?utf-8?B?VDdHT3BUbWh0UGdTK201amk4YWZ1NmdacGhoczdGZTdPT2hrTUIvL1k1Y1Vv?=
 =?utf-8?B?M3E1RHNwZHpzV2VOcGh1a3UrQ0pHVnBNYzEyS1lJdTlhellaUGVLUmxWSm93?=
 =?utf-8?B?cmtCdmRUZ2h0QjZYNlBIS2ZNTjcrWVZSTlBJSTZXMkRaQzJUeDNvUmlnSkVh?=
 =?utf-8?B?a1pUOWZ4UjQwemN0c3BKZG1HZDlwSG90UTUvOHhlT2crUVlNWEdoeU9JNTE0?=
 =?utf-8?B?SW4rdkVjYjVnU21uYTFUcEdRVEJ1QXpEYlJSRGpkMWxNNHhIOTdHK1JtVE12?=
 =?utf-8?B?RXZ2TjdUNTNsUmdiRFRNUWlkSUNDbkI4UDBRR2tJNjBZLzhOZjBOZFFlQWJm?=
 =?utf-8?B?cFZwT2Q5VUF4L29mejdkNkZWbUdTeW1hR2tnUjJ5Wk9yYVl4eGdqQVdZbDg5?=
 =?utf-8?Q?6TmVvEg/IY+W+ftFHywwu+G4HcYo61AJqNDqcyp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6DD8D8BC875D1488865E7B30BE17EF3@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4cf9ed-01e2-42cb-353e-08d8f12d3268
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2021 14:32:49.3937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQ1z6/acniQMJ3fFRGjyQRid23NT1Z4gvdl7yNLk40KJmjS3UPJfJD2zL1DGOd5lBTEN0HtRZ6J+9IygwgmB5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6038
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksDQoNCk9uIFR1ZSwgMjAyMS0wMy0yMyBhdCAxNDoyNCArMDAwMCwgQ29saW4gS2luZyB3cm90
ZToNCj4gDQo+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+
DQo+IA0KPiBDdXJyZW50bHkgdGhlIGhlYWRlciBhcmd1bWVudCBpcyBiZWluZyBwYXNzZWQgYnkg
dmFsdWUsIHNvIGEgY29weSBvZg0KPiAyNTYNCj4gYnl0ZSBzdHJ1Y3R1cmUgb24gdGhlIHN0YWNr
IGlzIHBvdGVudGlhbGx5IG9jY3VycmluZy4gRml4IHRoaXMgYnkNCj4gcGFzc2luZw0KPiBieSBy
ZWZlcmVuY2UgdG8gYXZvaWQgYW55IGxhcmdlIHN0YWNrIGNvcGllcy4NCj4gDQo+IEFkZHJlc3Nl
cy1Db3Zlcml0eTogKCJCaWcgcGFyYW1ldGVyIHBhc3NlZCBieSB2YWx1ZSIpDQo+IEZpeGVzOiAy
ZGIxNmM2ZWQ3MmMgKCJtZWRpYTogaW14LWpwZWc6IEFkZCBWNEwyIGRyaXZlciBmb3IgaS5NWDgg
SlBFRw0KPiBFbmNvZGVyL0RlY29kZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2lu
ZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vaW14LWpwZWcvbXhjLWpwZWcuYyB8IDE0ICsrKysrKystLS0tLS0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vaW14LWpwZWcvbXhjLWpwZWcuYw0KPiBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vaW14LWpwZWcvbXhjLWpwZWcuYw0KPiBpbmRleCBhZGIxNzE1Yzc1
ZDcuLmYxM2E4ZWZjMzVhZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9p
bXgtanBlZy9teGMtanBlZy5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vaW14LWpw
ZWcvbXhjLWpwZWcuYw0KPiBAQCAtMTExNCwyMSArMTExNCwyMSBAQCBzdGF0aWMgaW50IG14Y19q
cGVnX3ZhbGlkX2NvbXBfaWQoc3RydWN0DQo+IGRldmljZSAqZGV2LA0KPiAgfQ0KPiANCj4gIHN0
YXRpYyB1MzIgbXhjX2pwZWdfZ2V0X2ltYWdlX2Zvcm1hdChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdjRsMl9q
cGVnX2hlYWRlcg0KPiBoZWFkZXIpDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgdjRsMl9qcGVnX2hlYWRlcg0KPiAqaGVhZGVyKQ0KPiAgew0KPiAg
ICAgICAgIGludCBpOw0KPiAgICAgICAgIHUzMiBmb3VyY2MgPSAwOw0KPiANCj4gICAgICAgICBm
b3IgKGkgPSAwOyBpIDwgTVhDX0pQRUdfTlVNX0ZPUk1BVFM7IGkrKykNCj4gLSAgICAgICAgICAg
ICAgIGlmIChteGNfZm9ybWF0c1tpXS5zdWJzYW1wbGluZyA9PQ0KPiBoZWFkZXIuZnJhbWUuc3Vi
c2FtcGxpbmcgJiYNCj4gLSAgICAgICAgICAgICAgICAgICBteGNfZm9ybWF0c1tpXS5uYyA9PSBo
ZWFkZXIuZnJhbWUubnVtX2NvbXBvbmVudHMpDQo+IHsNCj4gKyAgICAgICAgICAgICAgIGlmICht
eGNfZm9ybWF0c1tpXS5zdWJzYW1wbGluZyA9PSBoZWFkZXItDQo+ID5mcmFtZS5zdWJzYW1wbGlu
ZyAmJg0KPiArICAgICAgICAgICAgICAgICAgIG14Y19mb3JtYXRzW2ldLm5jID09IGhlYWRlci0N
Cj4gPmZyYW1lLm51bV9jb21wb25lbnRzKSB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGZv
dXJjYyA9IG14Y19mb3JtYXRzW2ldLmZvdXJjYzsNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
YnJlYWs7DQo+ICAgICAgICAgICAgICAgICB9DQo+ICAgICAgICAgaWYgKGZvdXJjYyA9PSAwKSB7
DQo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkNvdWxkIG5vdCBpZGVudGlmeSBpbWFn
ZSBmb3JtYXQgbmM9JWQsDQo+IHN1YnNhbXBsaW5nPSVkXG4iLA0KPiAtICAgICAgICAgICAgICAg
ICAgICAgICBoZWFkZXIuZnJhbWUubnVtX2NvbXBvbmVudHMsDQo+IC0gICAgICAgICAgICAgICAg
ICAgICAgIGhlYWRlci5mcmFtZS5zdWJzYW1wbGluZyk7DQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGhlYWRlci0+ZnJhbWUubnVtX2NvbXBvbmVudHMsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGhlYWRlci0+ZnJhbWUuc3Vic2FtcGxpbmcpOw0KPiAgICAgICAgICAgICAgICAgcmV0dXJu
IGZvdXJjYzsNCj4gICAgICAgICB9DQo+ICAgICAgICAgLyoNCj4gQEAgLTExMzcsNyArMTEzNyw3
IEBAIHN0YXRpYyB1MzIgbXhjX2pwZWdfZ2V0X2ltYWdlX2Zvcm1hdChzdHJ1Y3QNCj4gZGV2aWNl
ICpkZXYsDQo+ICAgICAgICAgICogSVRVLVQgVC44NzIgY2hhcHRlciA2LjUuMyBBUFAxNCBtYXJr
ZXIgc2VnbWVudCBmb3IgY29sb3VyDQo+IGVuY29kaW5nDQo+ICAgICAgICAgICovDQo+ICAgICAg
ICAgaWYgKGZvdXJjYyA9PSBWNEwyX1BJWF9GTVRfWVVWMjQgfHwgZm91cmNjID09DQo+IFY0TDJf
UElYX0ZNVF9SR0IyNCkgew0KPiAtICAgICAgICAgICAgICAgaWYgKGhlYWRlci5hcHAxNF90ZiA9
PSBWNEwyX0pQRUdfQVBQMTRfVEZfQ01ZS19SR0IpDQo+ICsgICAgICAgICAgICAgICBpZiAoaGVh
ZGVyLT5hcHAxNF90ZiA9PSBWNEwyX0pQRUdfQVBQMTRfVEZfQ01ZS19SR0IpDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGZvdXJjYyA9IFY0TDJfUElYX0ZNVF9SR0IyNDsNCj4gICAgICAgICAg
ICAgICAgIGVsc2UNCj4gICAgICAgICAgICAgICAgICAgICAgICAgZm91cmNjID0gVjRMMl9QSVhf
Rk1UX1lVVjI0Ow0KPiBAQCAtMTI1OCw3ICsxMjU4LDcgQEAgc3RhdGljIGludCBteGNfanBlZ19w
YXJzZShzdHJ1Y3QgbXhjX2pwZWdfY3R4DQo+ICpjdHgsDQo+ICAgICAgICAgaWYgKCFteGNfanBl
Z192YWxpZF9jb21wX2lkKGRldiwgcHNvZiwgcHNvcykpDQo+ICAgICAgICAgICAgICAgICBkZXZf
d2FybihkZXYsICJKUEVHIGNvbXBvbmVudCBpZHMgc2hvdWxkIGJlIDAtMyBvciAxLQ0KPiA0Iik7
DQo+IA0KPiAtICAgICAgIGZvdXJjYyA9IG14Y19qcGVnX2dldF9pbWFnZV9mb3JtYXQoZGV2LCBo
ZWFkZXIpOw0KPiArICAgICAgIGZvdXJjYyA9IG14Y19qcGVnX2dldF9pbWFnZV9mb3JtYXQoZGV2
LCAmaGVhZGVyKTsNCj4gICAgICAgICBpZiAoZm91cmNjID09IDApDQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCj4gDQo+IC0tDQo+IDIuMzAuMg0KPiANClRoYW5rcyBmb3IgdGhl
IHBhdGNoLg0KDQpSZXZpZXdlZC1ieTogTWlyZWxhIFJhYnVsZWEgPG1pcmVsYS5yYWJ1bGVhQG54
cC5jb20+DQoNClJlZ2FyZHMsDQpNaXJlbGENCg==
