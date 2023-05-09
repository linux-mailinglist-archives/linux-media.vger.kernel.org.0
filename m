Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4959D6FBF30
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 08:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234862AbjEIGYB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 02:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234859AbjEIGX7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 02:23:59 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2071.outbound.protection.outlook.com [40.107.13.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6CB68A7B
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 23:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXvV976h4pzYBjSdaIxY9Ul5F9fjYlu2A8RIBuWqY1pxKwScYcDhht0kC0rpGTrVTbI8Y5Uxi+G4TQaUcGMaMaayNwFOep3cg1oKTCYe9R4leEA3E0vWVd1LCNSISKAkdbogshjpM0R0iD02iLjjtYYUZ+8833vkNftx4Re5g6f09eTPPWafCjeOF8hDpRs4QAoMg09t74UdPuOtfLY/eZvs0qesleYs4OQ+CUjdWxxVPA8hw5/FQCcYk3B51+d1QJrsfyoGt94UhQXYm/gBsipQBXcCppy23lywANlsYVPTAieL7vTT2uBer7KUSfvF99+vH6AEdxV5HewspBo4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHvV/q7YogGrMjR+y945zRVaEJrH/7c7nkQUOf/IHo0=;
 b=bV1yt+AUdy+r5h7dB7DMLkssQt6g8tRvrOW9UjF30Kj0QJXh33bbMZabLzg+eMstvswt0FoRKfmYrk7fjigBPliCBT7TXvnUGpbyBAElIbAVvKVQ7Ls6jv5oyseGEyzxG1G00otmmFWN6XdzYYjQQBSHJsL8fs5dORL3VQqi21RhB2tavhwTAO31kmus3w4YF6uld72ptMZIkN5HGL3hm7IM42RxrYc8O2oUhBdyxCVjlPEsHyl4fTfW344qgXtmxRra9Z9YDE9Sbb/BVBrUpkXjHLFvVAXRHy5fgrSs4zd5bEy1jq01qxRJx2rFeDMpYEL/Nhu4Qu7H/2dBUTSs1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHvV/q7YogGrMjR+y945zRVaEJrH/7c7nkQUOf/IHo0=;
 b=OEDMgozsw01var3rY5l0NY9N72sqjE2oIy9Ag0Bkn9Vh70c8Uq1TMuqsfWc5wFWs0UTaVjqrjDRNHi0SUh/SLT7i9j0ZPg4FEzCAzIDCBodU4Hi1P+qRFoQFIxIL9KA8TtKiBuqsD9bjKwBNwz33ouE405zaM34CGUoxD+K8k5U=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB9349.eurprd04.prod.outlook.com (2603:10a6:102:2b8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 06:23:54 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 06:23:54 +0000
From:   "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2] media: ov5640: fix incorrect frame frate issue for
 defulat VGA
Thread-Topic: [PATCH v2] media: ov5640: fix incorrect frame frate issue for
 defulat VGA
Thread-Index: AQHZfvTGj0BOADJockGBuK99eOh5K69LPJGAgATpuwCAAVlHwA==
Date:   Tue, 9 May 2023 06:23:54 +0000
Message-ID: <AS8PR04MB9080F1936F2547ABAC2DF852FA769@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230505020114.764715-1-guoniu.zhou@oss.nxp.com>
 <qrwnkofoyf5utyh7kepihb7vp5wqb657dbak4m7ecjej357i6v@swbdvakgtaby>
 <ZFjFMubAzS7Xd7OR@valkosipuli.retiisi.eu>
In-Reply-To: <ZFjFMubAzS7Xd7OR@valkosipuli.retiisi.eu>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PAXPR04MB9349:EE_
x-ms-office365-filtering-correlation-id: 574c9e08-9fdb-470c-c36e-08db5055f6bc
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NX7RwZf7ENLMKnQaZ1/dLMJIN4SiqTxEQHItkLh/NDVNh2B1QQyWdzNmEOtRIsic65OfrrHMvPuOi1ojVAiEjUoJseRPgcOlFYOffLomiol7NBvghE5HUS23y+T5Fi5wOYD6a86XSECLgdpxRB1Ec7PR532bAWfUvXLGdzpmat2TyZcMvDIUhlCqCUDTEKP2RavDB4NEiy5lP+Yg83uTDXKGDd7ee62cnNirhLu6f1AdSw79CfN6Z5hwf8pn/3vQGHrmNk1oWI9/bR/UTlC65uRFqoNRQEtLSHTUtmaEEbrgERLbPGkcLXWft1KGGNZApuo3Wy0SXQtkFXF173tUcfXgF4jmvPIJH+2S+zDLRl4Xg/9AIUFpNkHDiueKlb97vZYYWIlrc9fC6omQOQ92IzyVxOq1oEbipyFmz3C/u3tMGZZGlTAvAByACEWG/RMLYqUJCCOexY+tDFlkOfmrVa8KW5Eaz9h5OCsq1rY4FeGsmxLyF1qeLNxXuiGc7eKCt1a39XoHcvx3pOnfwf2g2yLXhvQegznY/1XW5kXIrlu1EoNSD4I4/RtlsBv4POCEdYpweZh+hpszRWFNQlxuJACK2IMMP0swpYFSWOB3pL9/AO7SCa9ZvyAx1INSSpQbo3VNLyQLNgKZ0mQUD/pfjo76FQIhXeSkBEgY5PnSX3A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199021)(33656002)(38100700002)(52536014)(66446008)(4744005)(2906002)(86362001)(5660300002)(316002)(8676002)(55016003)(66556008)(64756008)(66946007)(122000001)(41300700001)(8936002)(76116006)(66476007)(38070700005)(4326008)(83380400001)(186003)(9686003)(26005)(53546011)(6506007)(71200400001)(54906003)(478600001)(7696005)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?Tit4UXdSUzRKZUU3REI3TFFFekI1NlNrSjlrR0NLNUpjdXJyNU1nTmVzV3dk?=
 =?gb2312?B?NGo5dGc4eHo3bzhxVndWZVJWQ1ZnUS9QTkVlOExsMFpxbU85OXVIUndqSC9v?=
 =?gb2312?B?Tnlwc25xUmdMS3E4N3Z1RTUrNXdXc1FHNWJ6Uyt6T3B0WnFpVFF2alA4N05r?=
 =?gb2312?B?RVJhVy9nNEowT2hjZHJQQUFJUHNUdGFuaWFyb0QxUjY2MGNpeEpGclpaUXc1?=
 =?gb2312?B?eWJQN0o4QjdleFp1Wmh6Y3k4aFBKd2g3VE5FbVlYRmxyeWM1SjdmY1lQK3h0?=
 =?gb2312?B?eXBaNGIvWUgrc2w4dVppSDVaZEJ6eFpmMVk5cHpVbEh4RGJ6TGZQYnl0YmNX?=
 =?gb2312?B?L0Vlemd6aVpiZFAyRHhSM1Roa1MwMTc1b2R4d1pEdkR4c1pQOERXaUpNb3Ev?=
 =?gb2312?B?dHpxdjllbG96SDBBZE11Mi9wT2NNR1dnWUFET1R4ZFBZYzhOcC9sMm41WDc1?=
 =?gb2312?B?a3ltdTg5MUxaTTQ1SkZrQzBlZTlyVFByWXBJblNTQlAvajBBSDYrN1REZlls?=
 =?gb2312?B?MmVQVGxpbmhmbW55eUpjTVlSMWhKY2dBMEhzQlNpMzVaVjd1a2tYWHNqQWJv?=
 =?gb2312?B?MWdSMGwyVE5ldWFOSkFIUVRHS0lHOWV4b25nQnNuMUxDZklmOFZreHBPaHJP?=
 =?gb2312?B?ZnFUaVlZK0JFVlZ5QVFrQnFhREhMVkY3M2ZQSmhFdXM4RE9jVnpvdXhkdjh3?=
 =?gb2312?B?WjhmL1BMeERaRUIxZXlySFZKOWZaZXZSYWVMbjg5ZUJGMU5iQ3FldUtnY3Fy?=
 =?gb2312?B?QWg3R3MrSkpmVkVuZDVxN05ab3hSMjQreDArZldwbUtMWVFaZG5vc25LNWRI?=
 =?gb2312?B?TW5CUG0yM0xUWGtDVnRFVmN1dGd4emNBMm1OdFFZNDVzYnJxOU03ZUxqenV1?=
 =?gb2312?B?V0kvQkFFaGVNTkJhbUhnRFV6YlB0VUlzWkx4UG9adlN3WHpDM2ZJby91TDB6?=
 =?gb2312?B?ZlZHdzMyV1h0OTJiYW90VFdSRkYzcnIrN3BXcy9jQmErU2hGRWZjb0d3ajlp?=
 =?gb2312?B?VG8ydTA4Umw2Y05ad1B2NEM5eERjaDUxSDJhZXdxMmIwVkxQRDk0MTdiTlFy?=
 =?gb2312?B?OEVRTzVHSFBYcVpCZmF5dm5Qb3pub2ZsZ1BzUWRKRG9mdE9qVEg3UmVzZ2Nr?=
 =?gb2312?B?VGhNeXpQVEFjUGlWb2xNbUFLamYwcUdxU2tIbXZNT3VzOURrQnk3SWg5NUgz?=
 =?gb2312?B?Q2tOZUJmR0QxcU5KYi9wbmNJYkxSQkZZU3N5ZlJzYllJOGhRbnNhays5LzlT?=
 =?gb2312?B?YW02Q2NOUjUrNGt0aWd2WU9tOVFvSUdzTkhwNXVqSi9xbTQyQ2VreStsakpB?=
 =?gb2312?B?a0dXOHZMK1JFekdJeHFMdnp6UGV3TWU0U3lMeXBQMlQ3UXo1c2pZOTVKcG5h?=
 =?gb2312?B?WnZmRFdQZ29ZaXZ5VEQzY2dsMXc0YU9SSHFqUHcrUUlzc00yNWx6K3dRNnNV?=
 =?gb2312?B?aHRFNS8xVlhhZ2ZuY0Vmcmp3T2JSUkFwZHQyVlNLUHYxbStvZ1VGN014N1hz?=
 =?gb2312?B?K1hMT0syRFlQeTF3Qm5XWWVkNUpMYTFBUWU5b0VvMjhIck5RRDI4NXdXRW56?=
 =?gb2312?B?R2pSVUNXYmdwdFczMit3RGtva1BsaW14ZE9GQ3lNbjZZUU9FQXZER0o0RlFO?=
 =?gb2312?B?ZVVrMHhRVTJ3bTBZRy9QbjBFOVFoWEdTL0pMNFg0SjZ4dWpRMUN5cUp1blF4?=
 =?gb2312?B?OFg3ZFQvR3dQZ0JxNVIxUk5NL0ZFbGx3KzBvK2RzOGdFRUg2RzJrU1NCcWdD?=
 =?gb2312?B?OEtsSVJCUXZRb2JmWHRrT0wyR3BQeHRQbTdqZERlOXB5K1JhenNCL2Y3UVFG?=
 =?gb2312?B?REtVdmhtdVNhK0NCZm1uQ1FoUWpoQ3JSb0E0R2dhdHVYTlpEdFMyZTBuejY5?=
 =?gb2312?B?bGhOQ2EydXpnbTNqSHllY1k5UEFQTGxwK2hMQmVZa3BYZytHVHJsUXdaaHhl?=
 =?gb2312?B?aDZyb2Z2ZXZyL3BRckt0TkRzcFdXMHR3S1ZnTWJETUc5OEI3NFFmNUxKN3Ax?=
 =?gb2312?B?ZWgydlN6Uml5dkgwZnNQcmkyUWhjZDQ5MEhMMmtxbjBtdXZIRTBlOWFza2x5?=
 =?gb2312?B?TlQ4ZEFsbVFjdlJ3ZDNMcUhrd1pyZWxjcVg3TVJmSWJBMFVLa0pNS3VkVlJU?=
 =?gb2312?Q?tb+YemoRP1BlH2mtfpuQDinh9?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 574c9e08-9fdb-470c-c36e-08db5055f6bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 06:23:54.4538
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bb9Qv4IU5mxSyjSsd7HxOxvlcVNjxxW8hVRl0QbePg2XyKfK72dJhe/U8cFpvxkrvcaXF8t3E01wOe+ckWfI2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9349
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWdyZWUsIHdpbGwgdXBkYXRlIHNvb24sIHRoYW5rcy4NCg0KQmVzdCBSZWdhcmRzDQpHLk4gWmhv
dQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2FrYXJpIEFpbHVz
IDxzYWthcmkuYWlsdXNAaWtpLmZpPg0KPiBTZW50OiAyMDIzxOo11MI4yNUgMTc6NDgNCj4gVG86
IEphY29wbyBNb25kaSA8amFjb3BvLm1vbmRpQGlkZWFzb25ib2FyZC5jb20+DQo+IENjOiBHLk4u
IFpob3UgKE9TUykgPGd1b25pdS56aG91QG9zcy5ueHAuY29tPjsgbGludXgtbWVkaWFAdmdlci5r
ZXJuZWwub3JnOw0KPiBtY2hlaGFiQGtlcm5lbC5vcmc7IHNsb25nZXJiZWFtQGdtYWlsLmNvbTsN
Cj4gbGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjJdIG1lZGlhOiBvdjU2NDA6IGZpeCBpbmNvcnJlY3QgZnJhbWUgZnJhdGUgaXNzdWUgZm9y
IGRlZnVsYXQNCj4gVkdBDQo+IA0KPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWls
LiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3Igb3BlbmluZw0KPiBhdHRh
Y2htZW50cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVw
b3J0IHRoaXMgZW1haWwnDQo+IGJ1dHRvbg0KPiANCj4gDQo+IE9uIEZyaSwgTWF5IDA1LCAyMDIz
IGF0IDA4OjQ1OjU1QU0gKzAyMDAsIEphY29wbyBNb25kaSB3cm90ZToNCj4gPiArICAgICAgKiBZ
VVY0MjIgVVlWWSBWR0EgKDMwRlBTIGluIHBhcmFsbGVsIG1vZGUsIDYwIGluIE1JUEkgQ1NJLTIN
Cj4gbW9kZSkNCj4gPg0KPiA+IFdoYXQgZG8geW91IHRoaW5rID8NCj4gDQo+IFBsZWFzZSBhbHNv
IGZpeCBzdWJqZWN0IChzcGVsbGluZykuDQo+IA0KPiAtLQ0KPiBTYWthcmkgQWlsdXMNCg==
