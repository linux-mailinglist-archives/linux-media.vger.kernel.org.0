Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE3AA764361
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 03:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbjG0BWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jul 2023 21:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjG0BWh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jul 2023 21:22:37 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E109C;
        Wed, 26 Jul 2023 18:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaGU4z/lYQqPbij+ozV+KQkAJtiQ6z2Ax+v6YY8UVJuFhHk4Hd99tbpKdE06FNEH/cT6C/ly1ufslb/nPnhAOhhswYeniLuOsPJSXZqkGh4tR0+EvtGendIvrUcg4J4UWbSl/MbgfsN6dHJHmLeFj19PZSlfyOYnyZsBaDXUe/o6O817u4XnTbtO50PxFihaVLbY1ypJHGn5Aj9GKMU6thRHe1PddWIjtoF3lmXVh1CzNU1Xz+2bx5HuSiwh5Dx+Ea/TldcD6Vz1CJ2mWZ9QmQWzJJUut0mCIcKTj3f9cMuiiMumn4sEXGbQwaNOgdaW1UrP3RsaH5EOJs7qTTZTEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naGwSTS2xRPcO+dHXRis+9TdFgDrWj2Q+kVV7+2TCDM=;
 b=f+6cEyvGBpdHWXv/8QL98R+KtGl4mEWX7MNwmwtUKV1ri6PUBV9r2wlu7A6jju9/vDMgCYSSxs0I2hFWtZ5oV3qlTYZjTHrWJAVkGA+aIdYcPf4Kic+dMv7VU2niMEbKxITIMpVg+jh2YGLrWZuvst/WjRq6De1tHbYN8jb/90dBBAPxoXxq64pLq389xXIkfQbcE9fxxR+QQsB0HixFXzxnElx2UV1hbOfbR5bTarvjJsR2eXDs7BWS1HS97OYiAPTUjOTcKQcFaLfLNp0NQN7eYuRCw3mmeQZm73Cqjvq+8gUQGTrPBx3nIwt04wHHUBKttFiW4TnvEuOZ5N48NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naGwSTS2xRPcO+dHXRis+9TdFgDrWj2Q+kVV7+2TCDM=;
 b=Lfgzmt6F/IIill7hyNGj56wu6VackaRqXkgEpC/VIj97Bc0aG7z0Knv1aTznM3co8fDa7nZpT89YsDlK00sBThoQx5huhNGfvrMNTUE+kXNRYpWiVZAN26eiQydArGks779cocAlMowzV/JFukyV93FEKBDrP/9yjKeOCyRle/o=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB7557.eurprd04.prod.outlook.com (2603:10a6:20b:294::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 01:22:32 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::6149:22e9:3a6a:4a6d]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::6149:22e9:3a6a:4a6d%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 01:22:32 +0000
From:   "G.N. Zhou" <guoniu.zhou@nxp.com>
To:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject: RE: [PATCH v5 0/3] add ISI support for iMX93
Thread-Topic: [PATCH v5 0/3] add ISI support for iMX93
Thread-Index: AQHZqil9z/VU0xBXyEiFRQDMxYEW7K/M+1Vw
Date:   Thu, 27 Jul 2023 01:22:32 +0000
Message-ID: <AS8PR04MB9080C8C57521BBBEAA1EDAD6FA01A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230629013621.2388121-1-guoniu.zhou@oss.nxp.com>
In-Reply-To: <20230629013621.2388121-1-guoniu.zhou@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|AS8PR04MB7557:EE_
x-ms-office365-filtering-correlation-id: da6ec96c-4365-4d52-5c61-08db8e3ff389
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v5+uwkPh8lWKfDbfWAoGLsKpFVTgfgNJbfRSQ9tVieQWpvByUabH34OeKXJQQbOHtcr+B/lpxVojOGcgSTFodT88H4pwjH3oCA6OI4Iv5lDAYB7nUwzqsOS8becM2PvwwJMr5E7IKgnAwtVwh1FPw98TNWFTdULPaQoHFZCyu705oCRSn7Q7iBhPGpHw7Y7/q9dsvXxREQIqI5/K6xGYTzD7salpbuXZeyu2ujBFh7NVPJ2nfKzpF5llzsPN8hC6WUx1TLImsJbuBm99XkxRQ0K8AsMBayxwD4oCZYJnhtnw7+R5wRrHGWkYKUk4B0duuEjQQhAF0fsDtEYF+1QHO366SNzJBY/IjHaQS/aHWhR64l4I1WMB6q1uzcqKi6r/UbyFtTobmLHlF6pKbYhFlJSHhlF8rTVEYDitSQaes1ZbIeyENYn1LRn02+rHS2m2M7rksl4hbNy1P99vfcmy6qTOhZrdpBQkts2QcfOmA7DiAXDV89AWrNI7ZkTZG5qKHnOyIkVrPzsZnpVHL5/ZKwOj5mcSBBZReskojYu/ZKMmxcM8I7vnB7YQ7faCCZykwrJE7tkketmuyCoy4E6i9WFxxBYvE0CJ37iOb8FJhJ357dvLFbEf3bysaNPs0Dl6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199021)(110136005)(478600001)(6506007)(9686003)(186003)(26005)(53546011)(54906003)(122000001)(7696005)(71200400001)(76116006)(64756008)(66446008)(66476007)(66556008)(4326008)(66946007)(83380400001)(38100700002)(5660300002)(7416002)(52536014)(8936002)(8676002)(33656002)(38070700005)(2906002)(41300700001)(316002)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?TlNKb0k0SjBMUUhuWG41ZENkek12S1BWOUxVNnZBNTNPNVFNVFdVNDNMZ08y?=
 =?gb2312?B?TjdBV3Y4bXNjbzB5cmVNbzJYY0lZSkY4ajBsUGh2dnRTQ0Q3dmRoN0hDYmE0?=
 =?gb2312?B?K3p6ZGNCSHNPNHYxQjRwNkNuL3FYZ1BxeWQrVkJZK1ZCVDR3RTBBSUdCMStr?=
 =?gb2312?B?Ymx0UmRrZTJNK0NxcXJWdUc2K21rZFpYMXFGam1NcnorMFFMOGppcWRGOXBV?=
 =?gb2312?B?OFIrTjZWVjNzVGVLQ29FdmVkcFRUS0JXdkxXMGhrTlpuZzhyUFJ3ZXVTdGgy?=
 =?gb2312?B?RlVsT0dLOXFpU3I4MEgwVG9mNWtkdUNoK3k0TXVuUmcrWVl2em85VGpHMEt4?=
 =?gb2312?B?eE1mT1ZqYjBtSWwxQkM0SHd5elRLNUk5SUg3NjlROTl0Nlh2SmJVZlB0ajB5?=
 =?gb2312?B?NlFMcXg1OGhSSk51dVNrNCtzbXNTNkI2MWdoVHJYOGl4MDVwSytqbzkyZVFD?=
 =?gb2312?B?SjJtU3pKME1xY3JDaW4reFBqdWU5M1VFTWJsNzZ2bEVGdkVTbitzREdPSk5m?=
 =?gb2312?B?UTZONm9GUTQ3QzFpRjk1c2RsV0F5czFORHRxLzF5WXJYYlZJOVI0YlJTU2pW?=
 =?gb2312?B?cGJPRXVBUWxUMDBTTDl2bjdHYlhtMXZLaFM3cmYrV3doNzQ2dTVpTlYxRjZy?=
 =?gb2312?B?cFpvN1VpUUE2SGN2eUF2aVJBTFljRFZaTmFZWkZ4SFJlVDBNNXF1VUg3K1NP?=
 =?gb2312?B?blMxcnBmSXloOUhFSzMxbUhLcjN1ZVk5MWsxZTNtMVZ2cm5KQWxabFBKcHdz?=
 =?gb2312?B?c0g1L2lqZUFIVmhvRVZtUk94TDg4TXI4aVZXaU5QY0g1REF1eE5waFJXUnc3?=
 =?gb2312?B?N0kzaUpuZTFlZlh6MlREaVgvZHJSTjVQNEYxVzd5eFRLbis4RjYvWVQreFIr?=
 =?gb2312?B?S0ZLR0Fzak1UMVl2bThCVUVqNkFZMHhlWHlKMXEzNzM4aHpSQ2ZyS2ZMNk52?=
 =?gb2312?B?SjJvV0JscTNqWjhPVFpFVUZWV3FGZGxUMEF5ZlZ2QU8zWW5ncHdSMlVZTlpY?=
 =?gb2312?B?MjRNYWl0bFUwbnJGQlFtK1lOSDVSaUJ0S2cwZUN2R3JSUEdIK0w4eXNpc0Nx?=
 =?gb2312?B?S1M0QXFDL1NNeUNGVjdYbEczRDdVdlZ5R1plNGg2c2FTVXJCRUt2NDQ1T2ZW?=
 =?gb2312?B?M2pQWkRITUF3cUNzTW9NV0l5YzM3WEhFRGovZGtPS2FpRjhlVWNvL0d4UXIz?=
 =?gb2312?B?cjFWTmJVOHR0RkppWXJEMGlPV0tlakJhUkc0VzZVLzN3MXAwa2RKWUF5YlVt?=
 =?gb2312?B?SlIxcVNTSG9FZlppQVZxL0N5WHJSajFGOHVwN0tsVmNNa2wvSzlLQWtGNzF4?=
 =?gb2312?B?bmFrZGtHazh0N0VYakZDR3dDNkd2QUpURkU0VnR4WGpURVplV0xEeWphVFVl?=
 =?gb2312?B?VmEvb1FwV0RWMlBTTkdONHhRU0pJNElnM2EvM0M3Mm1UaytwVUJsQ0FQK1Fa?=
 =?gb2312?B?Vk5MMkN1YzhUcjd1cVNnS3JjR0VkR2Z1aXhWZmdBblR0dVAyOGhMNmxVZmlT?=
 =?gb2312?B?Z3NIdkdBOWQxS2pMY0xZcHExN0plR3JWZmF6Tk81Tng4bkdpSlVMYUZIYlda?=
 =?gb2312?B?ZjNzbWxUMFRoNExvNUhvOHcwamRBejZZMjJqckZEbHdtV00rOGRYVE1tLzE5?=
 =?gb2312?B?eWxmSjJqalJXZ2hvQVVEYmRsdmVOZEh0UFBFVHc4K21JTUVXaW0yc3BGSWRD?=
 =?gb2312?B?NVAvb1V1aW1meHNEVGVKaHFkS0ttWi83L2dvdHBleXU3VHhkd1VzTVUrY2tZ?=
 =?gb2312?B?Njdha2FVME5MWlVUNkJpTkc5UkdTQnYxTFZOTjNHandxeENYamxCaGJGbFVa?=
 =?gb2312?B?OVpWai9JbC9Nd21qUFczMDBZZlltaEpYbjQyQ2Y3Q1FvOVBjMmU4Z1N1b1I4?=
 =?gb2312?B?QXowWTU2enJIWk8vcFlsYUF5ek1kUFZTdHgyRWVyZXN2ejBzY0FYbWdPdmZG?=
 =?gb2312?B?QkpTOE15aGozbXB6TFlWdWsybW5HOVFtdGFYYW02dVdkUlVMaFlDL2ppZ0ZG?=
 =?gb2312?B?RHZ1QjUvUkxwUDd5bk1Zd1NqMGJKdUFaclJiQVNKYkhwOVhRMitidzdJUmQ0?=
 =?gb2312?B?L0pLVU9rMDRkMDBuUmFDVTBQU0RPSHNtRExyRXZhQlhUMTdXelJWTlFVdFRY?=
 =?gb2312?Q?L+WvxLDJadfsj+0ABEQhGV7w0?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6ec96c-4365-4d52-5c61-08db8e3ff389
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 01:22:32.2735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OObzb5lyFqyQlvpM69/Trw3RR4vIiE2JsaqFRvq6npdJ4Iw08wWBdyzvvvbRBPaw4aMLe8WEyZtJpNjiCyw3AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7557
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgYWxsLA0KDQpEbyB5b3UgaGF2ZSBhbnkgb3RoZXIgY29tbWVudHMsIHN1Z2dlc3Rpb25zIG9y
IHF1ZXN0aW9ucyBmb3IgdGhlIHNlcmlhbCwgSSB3b3VsZCBiZSBncmF0ZWZ1bCBmcm9tIGFueSB2
YWx1YWJsZSB1cGRhdGUgZnJvbSBjb21tdW5pdHkuIFRoYW5rcyBpbiBhZHZhbmNlLg0KDQpCZXN0
IFJlZ2FyZHMNCkcuTiBaaG91DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBHLk4uIFpob3UgKE9TUykNCj4gU2VudDogMjAyM8TqNtTCMjnI1SA5OjMyDQo+IFRvOiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5j
b20+Ow0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiBDYzogbGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tOyBtY2hlaGFiQGtlcm5lbC5vcmc7DQo+IHJvYmgrZHRAa2VybmVs
Lm9yZzsga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyBjb25vcitkdEBrZXJuZWwu
b3JnOw0KPiBYYXZpZXIgUm91bWVndWUgKE9TUykgPHhhdmllci5yb3VtZWd1ZUBvc3MubnhwLmNv
bT47DQo+IGtlcm5lbEBwZW5ndXRyb25peC5kZTsgamFjb3BvLm1vbmRpQGlkZWFzb25ib2FyZC5j
b207DQo+IHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20NCj4gU3ViamVjdDogW1BBVENIIHY1
IDAvM10gYWRkIElTSSBzdXBwb3J0IGZvciBpTVg5Mw0KPiANCj4gRnJvbTogIkd1b25pdS56aG91
IiA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gDQo+IE5YUCBpLk1YOTMgZmFtaWx5IGFsbW9zdCBy
ZXVzZSBJU0kgSVAgZnJvbSBpLk1YOE0gZmFtaWx5LCBzbyBhZGQgaXQgc3VwcG9ydCBpbg0KPiBj
dXJyZW50IElTSSBkcml2ZXINCj4gDQo+IENoYW5nZXMgaW4gdmVyc2lvbiA1Og0KPiAtIEFkZCBi
YWNrIHNvbWUgaGVhZGVyIGZpbGVzIHJlbW92ZWQgaW4gdmVyc2lvbiA0DQo+IC0gUmVmaW5lIHNv
bWUgY29tbWVudHMgcGxhY2VtZW50IHRvIG1ha2UgY29kZSBtb3JlIGNsZWFybHkNCj4gDQo+IENo
YW5nZXMgaW4gdmVyc2lvbiA0Og0KPiAtIFVwZGF0ZSBjb21taXQgbWVzc2FnZSB0byBleHBsYWlu
IHdoeSBuZWVkIHRvIG1vdmUgZ2Fza2V0IG9wcyB0byBhIHN0cnVjdHVyZQ0KPiAtIFJlbW92ZSBz
b21lIHJlZHVuZGFudCBhbmQgdW51c2VkIGhlYWRlciBmaWxlcw0KPiAtIE1vdmUgZ2Fza2V0IG9w
cyBzdHJ1Y3R1cmUgdmFyaWFibGUgdG8gaW14OC1pc2ktZ2Fza2V0LmMgYW5kIGV4cG9ydCB0aGVt
IGJ5DQo+IGV4dGVybg0KPiAtIERyb3Agc29tZSBjaGVjaw0KPiANCj4gQ2hhbmdlcyBpbiB2ZXJz
aW9uIDM6DQo+IC0gU3BsaXQgW1BBVENIIHYyIDIvMl0gaW50byB0d28gcGF0Y2hlcywgb25lIGNy
ZWF0ZSBhIHNlcGFyYXRlIGZpbGUgdG8NCj4gICBzdG9yZSBnYXNrZXQgb3BlcmF0aW9uIGFuZCB0
aGUgb3RoZXIgdG8gYWRkIElTSSBzdXBwb3J0IGZvciBpLk1YOTMuDQo+IC0gRHJvcCBzb21lIGRl
YnVnIG1lc3NhZ2UgaW4gZ2Fza2V0IG9wZXJhdGlvbi4NCj4gLSBNZXJnZSAuZ2Fza2V0X2VuYWJs
ZSBhbmQgLmdhc2tldF9jb25maWcgdG8gLmdhc2tldF9lbmFibGUNCj4gLSBEcm9wIHNvbWUgZGVh
ZCBjb2RlDQo+IC0gU29tZSBvdGhlciBzbWFsbCB1cGRhdGVzDQo+IA0KPiBDaGFuZ2VzIGluIHZl
cnNpb24gMjoNCj4gLSBSZW1vdmUgdHdvIHBhdGNoZXMgd2hpY2ggdXNlZCB0byByZW5hbWUgaW14
OCB0byBpbXguDQo+ICAgW1BBVENIIDEvNF0gbWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTogcmVu
YW1lIG54cCxpbXg4LWlzaS55YW1sIHRvDQo+IG54cCxpbXgtaXNpLnlhbWwNCj4gICBbUEFUQ0gg
Mi80XSBtZWRpYTogbnhwOiByZW5hbWUgaW14OC1pc2kgdG8gaW14LWlzaSBhbmQgcmVtb3ZlIHJl
ZmVyZW5jZSB0bw0KPiBpLk1YOA0KPiAtIE1vZGlmeSBjb21taXQgbG9nIHRvIG1vcmUgYWNjdXJh
dGVseSBtYXRjaCBpdHMgZ29hbC4NCj4gLSBSZW1vdmUgcmVkdW5kYW50ICJtZWRpYSIgaW4gcGF0
Y2ggc3ViamVjdC4NCj4gDQo+IEd1b25pdS56aG91ICgzKToNCj4gICBtZWRpYTogZHQtYmluZGlu
Z3M6IG54cCxpbXg4LWlzaTogYWRkIGkuTVg5MyBJU0kgY29tcGF0aWJsZSBzdHJpbmcNCj4gICBt
ZWRpYTogbnhwOiBpbXg4LWlzaTogbW92ZSBpLk1YOCBnYXNrZXQgY29uZmlndXJhdGlvbiB0byBh
biBvcHMNCj4gICAgIHN0cnVjdHVyZQ0KPiAgIG1lZGlhOiBueHA6IGlteDgtaXNpOiBhZGQgSVNJ
IHN1cHBvcnQgZm9yIGkuTVg5Mw0KPiANCj4gIC4uLi9iaW5kaW5ncy9tZWRpYS9ueHAsaW14OC1p
c2kueWFtbCAgICAgICAgICB8ICA1ICstDQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9p
bXg4LWlzaS9NYWtlZmlsZSAgfCAgNCArLQ0KPiAgLi4uL3BsYXRmb3JtL254cC9pbXg4LWlzaS9p
bXg4LWlzaS1jb3JlLmMgICAgIHwgMjEgKysrKy0NCj4gIC4uLi9wbGF0Zm9ybS9ueHAvaW14OC1p
c2kvaW14OC1pc2ktY29yZS5oICAgICB8IDE0ICsrLQ0KPiAgLi4uL3BsYXRmb3JtL254cC9pbXg4
LWlzaS9pbXg4LWlzaS1jcm9zc2Jhci5jIHwgMzYgKystLS0tLS0NCj4gIC4uLi9wbGF0Zm9ybS9u
eHAvaW14OC1pc2kvaW14OC1pc2ktZ2Fza2V0LmMgICB8IDg1ICsrKysrKysrKysrKysrKysrKysN
Cj4gIDYgZmlsZXMgY2hhbmdlZCwgMTI4IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygtKSAg
Y3JlYXRlIG1vZGUgMTAwNjQ0DQo+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNp
L2lteDgtaXNpLWdhc2tldC5jDQo+IA0KPiAtLQ0KPiAyLjM3LjENCg0K
