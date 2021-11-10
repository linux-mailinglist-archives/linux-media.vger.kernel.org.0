Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAEB444C69B
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 19:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbhKJSGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 13:06:42 -0500
Received: from mail-eopbgr60070.outbound.protection.outlook.com ([40.107.6.70]:8109
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230100AbhKJSGl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 13:06:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVSRByjiIFE6a5bFvBii40yQsmpMU9qFTemFBL50BZE/AOh+99Qkehr0R3ZZ9hHox7+2LNspI00R0evGPsPvvmWAc/KZ6lpt1T4JpXwO0iEhS2D9soXkOLMMQlXZV5w6Hv5as6yHo9uB5IiseAMrkrTj8vt5xhgKyT/posEiGHa9cdIb8//y7xjKNCxvrqwYP9LjTQep9na7UCLrvUjeZL4YdBns5M1fmOLXXGgsSC7l9tEN0CJRy6sCuGDjS05dL7+6bwOKJolIJBxQPYWHLXupHj2Nfa7gnTo+hcsmtJYNIMH0Nti4j/XpFZyrvRMv8N4dr6jO1CyI4eP0Sjjelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8zyDtJkK/MRG9K0MifIV6yLWLcAcbWnoeh552BQWWs=;
 b=fjU0rQVXsFl/FtidQ1FNWtrxAep989A4Qqh+MI5C0jL/Qbi6SJ0sC9EPXejIRolfoMyHgMNNavYq9b5xqhHrc0y56yl57vrQaybQoFjx3Pn0zl83li6bPmWS24IsOL7ijSP1I2EsMaoMTMbjUXyq4LbGO6w1qZWV6UA8Ci3EIs7uQmsHWo5923ZDp67MZJKrVkUq+MN9Dx8L2d7Bh1YWNqeJdfJyR3QHpu6CsIDa06ptBP5ADQ9C3/WitXvXGFv2417sqNNqCyrblOah7Q3ryoFaH/E2Ao+CyfB+hwg9MDG64KirfPe34qOgKrqUqmLtK9ddbjDXmM8J1WN7n9A0ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8zyDtJkK/MRG9K0MifIV6yLWLcAcbWnoeh552BQWWs=;
 b=pMxm4Dh4cQgIn+eYF2Sw6LGIoEq52IJGwG5bCmWnP/Vx0w8NHmgaQt1o08H1NdJq8rxnu3vk2KtjkpSRu3/RO/YnoZZO2eh9haX79kuiaLTKGJLPMyWtgY9mtzRebYkGclP29DNcMj3wplTvvOwet2qT1Z/sgkc5l15KjTorUZU=
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 (2603:10a6:800:52::15) by VI1PR04MB6799.eurprd04.prod.outlook.com
 (2603:10a6:803:130::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 18:03:51 +0000
Received: from VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::ac2e:fc4e:176c:f891]) by VI1PR0401MB2495.eurprd04.prod.outlook.com
 ([fe80::ac2e:fc4e:176c:f891%6]) with mapi id 15.20.4690.016; Wed, 10 Nov 2021
 18:03:50 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "hugues.fruchet@foss.st.com" <hugues.fruchet@foss.st.com>,
        "jacopo+renesas@jmondi.org" <jacopo+renesas@jmondi.org>
CC:     "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "G.N. Zhou" <guoniu.zhou@nxp.com>,
        Manish Bajaj <manish.bajaj@nxp.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH] media: ov5640: Fix set format,
 v4l2_mbus_pixelcode not updated
Thread-Topic: [EXT] Re: [PATCH] media: ov5640: Fix set format,
 v4l2_mbus_pixelcode not updated
Thread-Index: AQHXz1oggrymDrE8dUCnWSJc/piMAKv7SvFmgAHQ+QA=
Date:   Wed, 10 Nov 2021 18:03:50 +0000
Message-ID: <08d2044ef00b438df4403e8533d6d07b37be4bee.camel@nxp.com>
References: <20211101195251.700674-1-mirela.rabulea@oss.nxp.com>
         <PAXPR10MB4734B68AC186DCDA40A97CDFFE919@PAXPR10MB4734.EURPRD10.PROD.OUTLOOK.COM>
         <7f74b844-809b-6255-fe4a-e4cef55cbae7@foss.st.com>
In-Reply-To: <7f74b844-809b-6255-fe4a-e4cef55cbae7@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6696fa75-059d-4311-c259-08d9a4747369
x-ms-traffictypediagnostic: VI1PR04MB6799:
x-microsoft-antispam-prvs: <VI1PR04MB67990F3E144BD4266E0503328F939@VI1PR04MB6799.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v9xaD6eMSK2231KxVbhg4F11bdAAhau3D+KY7WbiKRfxnNsjQZMam8xCQTVpF3U/xezq9c1FuH3f4dOY0/i/8rjXgzgrNtUovD5rOpYnF98eoQEL2zH68XKUKOzWOpYtbRXMwnO6kQvxia3XwsVmehkzr66AaI+Ohp01Faj6m9HIwAs76ATZYBfuM3CwEAaCGBp0b7iuYsYLMbRsphwkeUiruHPoW2aeDZlAZLHwgF7iZpOoZACWEnbMXlmWEVg7CqqgTPPMcerk3SNMjE1hSwQfSKA4OrtA5eJlNL8WI+pRhK9++/3cjhgEQmVhftmJPNYbuMUyGGxZLXe1T+LOTJ61ZB4Fb6aMr3F3RN+vnwtqCauAU+nxGTGze57Szke/FdsxdX4bhIS2YZ0tYB8wdoH5fCd2hp3ea8/g5MOD1EgIfP0S34uY2TaxrrUUSYEfK2Hs5tmlZxK7L+p5dG0+lJUQu9HSI2AcjX1PB62YsqFabIskMX+OEIjmRGC5U7NGAhpJoFsAQ2mnXSlilwdGVqe8A+SZRPzRjWxG2R+C73uWopFnyIrEhlbH5oE+5nwiUx9W4WmOJJGSq5HYY5+oJFJIYiqRSsXCzVRY0WzLnlrNPSsL4AIGXOYd/vwxdZzh6NgSZrjojjg4lfDbUk8RorM0ckXcODlHa4+wGkaQ9GjjZ1yzJFf1AVV0mUfLfJvp6LEPf8N0R+6f/7J1mQjcug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2495.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(71200400001)(2906002)(54906003)(6486002)(122000001)(83380400001)(66446008)(66476007)(76116006)(53546011)(2616005)(316002)(38100700002)(38070700005)(66556008)(15650500001)(6512007)(36756003)(6506007)(8676002)(186003)(64756008)(26005)(66946007)(4326008)(5660300002)(508600001)(44832011)(110136005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlpmOXplS2Z5eU56RVZDVHVEYXd1V3NoVUtoTG11Z3VLaFZOVDZSeE1pTXNY?=
 =?utf-8?B?bUxuZG9OMkdTZzVwb1h4aWFLNWoydUhadk9LM3l2Y0RzRjgrdkZaYThhb1Bs?=
 =?utf-8?B?UWZZUGR2QzVCZUlCV0liYlo3elcwOEhtL2piSVB3bW9Jak4zUGlyTkpXRWJT?=
 =?utf-8?B?THBQL04xTm9vQmI5UGRYeUVENjNxeEluRkpXaXZQa2tRb1hUdVdjZVk1aDN0?=
 =?utf-8?B?NEF5UVkvL3N2ZDhRd2lWdC9OQjh5TDd1UjdmUzZpQk1nTWdkUHpEdDhkbXdh?=
 =?utf-8?B?VVlYWkRMWlpWQlRoS3Zoa3FLQWZxOXFETVMvSXF2S0NQUDJiMUV1alpnWUh1?=
 =?utf-8?B?YkN1RW1ySEl5dkJ1ei9la3ppSUpXWXZlb2xjZlpPNU5zVGJKdG5YSXdrZlNa?=
 =?utf-8?B?eFpEQ2FDWGMxWnBEbFo5K1pGczdhOEoweG9ic1FOazEycm51cVJJcnFQekxF?=
 =?utf-8?B?OUFwNy9SVUZaMXUveGh4eksrc3V4SUNYUDc1RzJvbEhINmRacWY1SkE4TERy?=
 =?utf-8?B?a2NnWlQ4U3FISjFmYklpbVNDc0RxNVRPQ3JDYk94WjZBZWhsbmtqSDBMejls?=
 =?utf-8?B?bXpUOE9FRlhDWGpQVG1EZkVNOVpITGprRnNqaHd2aUZqcnRwQWw3Mk1nN3Jy?=
 =?utf-8?B?SVZxMnY1a1BCbmx2QmpVWGFURE80dktGUHhHVTBwZ2tkdm11aVhSRXNBQzRH?=
 =?utf-8?B?RlR3bHFrR056YkUyTit5SnNUQlk4NjQvNTdpeU5RN0d4d0drSlhyemNCY3hp?=
 =?utf-8?B?aXgvWlYyckFSREY4NmhPZml6NzRXRTRvaHg1ZzQrTlU2bFU2dDh0YnRacnE5?=
 =?utf-8?B?V3h3TUF1QVB2WFJaS3pHMG9FTEtYS0pZTXNmZTBtVHliSGk0MG5nYVN3WWlF?=
 =?utf-8?B?S0RLY2ZES2REL3g1OHFlMCtGMGY1Q3ZqN2w4WjNjMHNpN2RPY3JRcHZtSFd2?=
 =?utf-8?B?anJ1cUxLV2xTcDlvbzhOa2hPc3Nsak0rSm5pZHpuOWNTcVJ2UEE0Qm9Jc1Iy?=
 =?utf-8?B?SGxOb3BFZjB1dUs0aTNudnRCQThCaHZnQVdhdTNJbUx0V084d21wSTErWnE3?=
 =?utf-8?B?Y3lITW1OQlNjOGI1SUJkRVRhRi9wQ0h3VjBrekRDL1FjVDI3Tk5mVFJhN0pZ?=
 =?utf-8?B?OEpla1A4YlY1QU5nUnRzU0hLQ21Oemc0cmhIYmJ5RUNoSnRwUTlhdWlBT3Ba?=
 =?utf-8?B?b2ZCY1NQaWU5dkxCWEptTjNRUTVuYkJLSHVRNGU2ejBDTTZ1Z1F2bmQvaU9S?=
 =?utf-8?B?WTNpZjQxclJpQ1BXWnFXd3FGeFUxeUtiYXRMVHJIeThDT3FCMlRDbUdqa0hE?=
 =?utf-8?B?L2NLbmtuYkx1ZURxaVA0b3JQN09GZ0VpbGRub0l0ZUJ1Q1FibWVJK0dXNEp2?=
 =?utf-8?B?K0U0N1J3UWRCQ256b2tic0JtOGV1dVM2b3Y0L2ZHRDNGSE5GazZTeG1ZYjdi?=
 =?utf-8?B?bm5aNjN6ZFFwNjN4WnpwWUhDc0NGeUpyams0VlVPNkFUcUJQTmNnRHRDV1ND?=
 =?utf-8?B?ZWlQZDFyZWl2MDMyQ0Y2UGY4UXhkUGdITmQzY2VuN3Q5aDkzS2JnOTZOVUhk?=
 =?utf-8?B?QmdyMDY2TUNyRGcwODYvdkpjRzNyTlR1ZEc3S1I5OU5vWThxdFFOOExTajdD?=
 =?utf-8?B?RFJEcVJTMGRuTVo2L0JqTGpNQk9IbFBZQ2NOYTBNakRoRlkxR0xnTVNOV3No?=
 =?utf-8?B?MjE2L1FuS1dKM0RtNXloSVVEbTc0N3Z6MkVRbDd5K2NHN1NQQWsvWVVmQ3Rp?=
 =?utf-8?B?dTFIOHl0SGdvcWowcmhHa29yYWM0K3Z1NWsvZ0dUK00zZkU5eklDdUtkbmNX?=
 =?utf-8?B?Q0JkVmJacnZHbzcyV2J1ZlNMNlF3NktyOU4xT3RVNUM4K2ZiUEZCZ1grdlRI?=
 =?utf-8?B?V2c1M0FoZ0V5SjRoTFRzbWRXbGl3bEE5aEFVMkRrald3VVdMQXlCRjdwaWxV?=
 =?utf-8?B?LzI2K1F5aWVjQmxzSk1SZFV5K1B5Z2xkWXdzWXJNTklUajdRMU9seFZBNmRX?=
 =?utf-8?B?NUU4SlNzcHpaL1ZGZmdtUTlCbUZzOElvdzVUQnZIMW41YWU0TGpKZUdmZkJr?=
 =?utf-8?B?UUJ2Y0ZoNWJia0hkVzJJbGxOVk83R3dnajE1SzBzRTdxdTk2WEdOZTNEUzk0?=
 =?utf-8?B?ajhFM2x2TGdIZXRxWlNSTlFCbjF5ZVRMcEdVYnk1RWVaL0hiZDlmOHRyenU3?=
 =?utf-8?Q?AI2atJ9o7qeBhzGuc049H0o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <39C786E22C417942898A55A886FAB171@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2495.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6696fa75-059d-4311-c259-08d9a4747369
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 18:03:50.7369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PvWs+Ii8YDzz5GgmOr1Aem6jL/O3qGrufOoMBNLoOUZ1Ooomsf5h69MCHQ1I8WgbI57p/nmOXk9utIYhn3HK1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6799
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSHVndWVzLA0KDQpPbiBUdWUsIDIwMjEtMTEtMDkgYXQgMTU6MTkgKzAxMDAsIEh1Z3VlcyBG
UlVDSEVUIC0gRk9TUyB3cm90ZToNCj4gDQo+IEhpIE1pcmVsYSwNCj4gDQo+IFRoYW5rcyBmb3Ig
cGF0Y2gsIHRlc3RlZCBPSyBvbiBteSBzaWRlOg0KDQpUaGFua3MsIGZvciB0ZXN0aW5nIQ0KDQpS
ZWdhcmRzLA0KTWlyZWxhDQoNCj4gDQo+IEFja2VkLWJ5OiBIdWd1ZXMgRnJ1Y2hldCA8aHVndWVz
LmZydWNoZXRAc3QuY29tPg0KPiBUZXN0ZWQtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMuZnJ1
Y2hldEBzdC5jb20+DQo+IA0KPiBCUiwNCj4gSHVndWVzLg0KPiA+IA0KPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogTWlyZWxhIFJhYnVsZWEgKE9TUykgPG1pcmVsYS5y
YWJ1bGVhQG9zcy5ueHAuY29tPg0KPiA+IFNlbnQ6IGx1bmRpIDEgbm92ZW1icmUgMjAyMSAyMDo1
Mw0KPiA+IFRvOiBzbG9uZ2VyYmVhbUBnbWFpbC5jb207IG1jaGVoYWJAa2VybmVsLm9yZzsgSHVn
dWVzIEZSVUNIRVQgPA0KPiA+IGh1Z3Vlcy5mcnVjaGV0QHN0LmNvbT47IGphY29wbytyZW5lc2Fz
QGptb25kaS5vcmcNCj4gPiBDYzogZ3Vvbml1Lnpob3VAbnhwLmNvbTsgbWFuaXNoLmJhamFqQG54
cC5jb207IA0KPiA+IHJvYmVydC5jaGlyYXNAbnhwLmNvbTsgeGF2aWVyLnJvdW1lZ3VlQG9zcy5u
eHAuY29tOyANCj4gPiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IA0KPiA+IGxpbnV4LWlteEBueHAuY29tOyBNaXJlbGEgUmFidWxlYSA8
bWlyZWxhLnJhYnVsZWFAbnhwLmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0hdIG1lZGlhOiBvdjU2
NDA6IEZpeCBzZXQgZm9ybWF0LCB2NGwyX21idXNfcGl4ZWxjb2RlDQo+ID4gbm90IHVwZGF0ZWQN
Cj4gPiANCj4gPiBGcm9tOiBNaXJlbGEgUmFidWxlYSA8bWlyZWxhLnJhYnVsZWFAbnhwLmNvbT4N
Cj4gPiANCj4gPiBJbiBvdjU2NDBfc2V0X2ZtdCwgcGVuZGluZ19mbXRfY2hhbmdlIHdpbGwgYWx3
YXlzIGJlIGZhbHNlLCBiZWNhdXNlDQo+ID4gdGhlIHNlbnNvciBmb3JtYXQgaXMgc2F2ZWQgYmVm
b3JlIGNvbXBhcmluZyBpdCB3aXRoIHRoZSBwcmV2aW91cw0KPiA+IGZvcm1hdDoNCj4gPiAgICAg
ICBmbXQgPSAmc2Vuc29yLT5mbXQ7Li4uDQo+ID4gICAgICAgKmZtdCA9ICptYnVzX2ZtdDsuLi4N
Cj4gPiAgICAgICBpZiAobWJ1c19mbXQtPmNvZGUgIT0gc2Vuc29yLT5mbXQuY29kZSkNCj4gPiAg
ICAgICAgICAgICAgIHNlbnNvci0+cGVuZGluZ19mbXRfY2hhbmdlID0gdHJ1ZTsNCj4gPiBUaGlz
IGNhdXNlcyB0aGUgc2Vuc29yIHRvIGNhcHR1cmUgd2l0aCB0aGUgcHJldmlvdXMgcGl4ZWxjb2Rl
Lg0KPiA+IA0KPiA+IEFsc28sIGNoYW5nZXMgbWlnaHQgaGFwcGVuIGV2ZW4gZm9yIFY0TDJfU1VC
REVWX0ZPUk1BVF9UUlksIHNvIGZpeA0KPiA+IHRoYXQuDQo+ID4gDQo+ID4gQmFzaWNhbGx5LCBy
ZXZlcnQgYmFjayB0byB0aGUgc3RhdGUgYmVmb3JlIGNvbW1pdCAwNzExNTQ0OTkxOTMNCj4gPiAo
Im1lZGlhOiBvdjU2NDA6IEZpeCBzZXQgZm9ybWF0IHJlZ3Jlc3Npb24iKSBhcyBpdCB3YXMgbW9y
ZSBjbGVhciwNCj4gPiBhbmQgdGhlbiB1cGRhdGUgZm9ybWF0IGV2ZW4gd2hlbiBwaXhlbGNvZGUg
ZG9lcyBub3QgY2hhbmdlLCBhcw0KPiA+IHJlc29sdXRpb24gbWlnaHQgY2hhbmdlLg0KPiA+IA0K
PiA+IEZpeGVzOiAwNzExNTQ0OTkxOTMgKCJtZWRpYTogb3Y1NjQwOiBGaXggc2V0IGZvcm1hdCBy
ZWdyZXNzaW9uIikNCj4gPiBGaXhlczogNjk0OWQ4NjQ3NzZlICgibWVkaWE6IG92NTY0MDogZG8g
bm90IGNoYW5nZSBtb2RlIGlmIGZvcm1hdA0KPiA+IG9yIGZyYW1lIGludGVydmFsIGlzIHVuY2hh
bmdlZCIpDQo+ID4gRml4ZXM6IGZiOThlMjlmZjFlYTUgKCJtZWRpYTogb3Y1NjQwOiBmaXggbW9k
ZSBjaGFuZ2UgcmVncmVzc2lvbiIpDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWlyZWxhIFJh
YnVsZWEgPG1pcmVsYS5yYWJ1bGVhQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL21l
ZGlhL2kyYy9vdjU2NDAuYyB8IDE0ICsrKysrKystLS0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1
NjQwLmMgaW5kZXggZGRiZDcxMzk0ZGIzLi5kYjVhMTliYWJlNjcNCj4gPiAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEv
aTJjL292NTY0MC5jDQo+ID4gQEAgLTIyOTMsNyArMjI5Myw2IEBAIHN0YXRpYyBpbnQgb3Y1NjQw
X3NldF9mbXQoc3RydWN0IHY0bDJfc3ViZGV2DQo+ID4gKnNkLA0KPiA+ICAgICAgIHN0cnVjdCBv
djU2NDBfZGV2ICpzZW5zb3IgPSB0b19vdjU2NDBfZGV2KHNkKTsNCj4gPiAgICAgICBjb25zdCBz
dHJ1Y3Qgb3Y1NjQwX21vZGVfaW5mbyAqbmV3X21vZGU7DQo+ID4gICAgICAgc3RydWN0IHY0bDJf
bWJ1c19mcmFtZWZtdCAqbWJ1c19mbXQgPSAmZm9ybWF0LT5mb3JtYXQ7DQo+ID4gLSAgICAgc3Ry
dWN0IHY0bDJfbWJ1c19mcmFtZWZtdCAqZm10Ow0KPiA+ICAgICAgIGludCByZXQ7DQo+ID4gDQo+
ID4gICAgICAgaWYgKGZvcm1hdC0+cGFkICE9IDApDQo+ID4gQEAgLTIzMTEsMTIgKzIzMTAsMTAg
QEAgc3RhdGljIGludCBvdjU2NDBfc2V0X2ZtdChzdHJ1Y3QNCj4gPiB2NGwyX3N1YmRldiAqc2Qs
DQo+ID4gICAgICAgaWYgKHJldCkNCj4gPiAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPiA+IA0K
PiA+IC0gICAgIGlmIChmb3JtYXQtPndoaWNoID09IFY0TDJfU1VCREVWX0ZPUk1BVF9UUlkpDQo+
ID4gLSAgICAgICAgICAgICBmbXQgPSB2NGwyX3N1YmRldl9nZXRfdHJ5X2Zvcm1hdChzZCwgc2Rf
c3RhdGUsIDApOw0KPiA+IC0gICAgIGVsc2UNCj4gPiAtICAgICAgICAgICAgIGZtdCA9ICZzZW5z
b3ItPmZtdDsNCj4gPiAtDQo+ID4gLSAgICAgKmZtdCA9ICptYnVzX2ZtdDsNCj4gPiArICAgICBp
ZiAoZm9ybWF0LT53aGljaCA9PSBWNEwyX1NVQkRFVl9GT1JNQVRfVFJZKSB7DQo+ID4gKyAgICAg
ICAgICAgICAqdjRsMl9zdWJkZXZfZ2V0X3RyeV9mb3JtYXQoc2QsIHNkX3N0YXRlLCAwKSA9DQo+
ID4gKm1idXNfZm10Ow0KPiA+ICsgICAgICAgICAgICAgZ290byBvdXQ7DQo+ID4gKyAgICAgfQ0K
PiA+IA0KPiA+ICAgICAgIGlmIChuZXdfbW9kZSAhPSBzZW5zb3ItPmN1cnJlbnRfbW9kZSkgew0K
PiA+ICAgICAgICAgICAgICAgc2Vuc29yLT5jdXJyZW50X21vZGUgPSBuZXdfbW9kZTsNCj4gPiBA
QCAtMjMyNSw2ICsyMzIyLDkgQEAgc3RhdGljIGludCBvdjU2NDBfc2V0X2ZtdChzdHJ1Y3QgdjRs
Ml9zdWJkZXYNCj4gPiAqc2QsDQo+ID4gICAgICAgaWYgKG1idXNfZm10LT5jb2RlICE9IHNlbnNv
ci0+Zm10LmNvZGUpDQo+ID4gICAgICAgICAgICAgICBzZW5zb3ItPnBlbmRpbmdfZm10X2NoYW5n
ZSA9IHRydWU7DQo+ID4gDQo+ID4gKyAgICAgLyogdXBkYXRlIGZvcm1hdCBldmVuIGlmIGNvZGUg
aXMgdW5jaGFuZ2VkLCByZXNvbHV0aW9uIG1pZ2h0DQo+ID4gY2hhbmdlICovDQo+ID4gKyAgICAg
c2Vuc29yLT5mbXQgPSAqbWJ1c19mbXQ7DQo+ID4gKw0KPiA+ICAgICAgIF9fdjRsMl9jdHJsX3Nf
Y3RybF9pbnQ2NChzZW5zb3ItPmN0cmxzLnBpeGVsX3JhdGUsDQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG92NTY0MF9jYWxjX3BpeGVsX3JhdGUoc2Vuc29yKSk7DQo+ID4gICBv
dXQ6DQo+ID4gLS0NCj4gPiAyLjI1LjENCj4gPiANCg==
