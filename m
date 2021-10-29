Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1861243F4D4
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 04:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbhJ2CMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 22:12:51 -0400
Received: from mail-am6eur05on2068.outbound.protection.outlook.com ([40.107.22.68]:35744
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231515AbhJ2CMp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 22:12:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQCdqJSUlD5JpVrRDNfSG1y6QCtr8czqezVNNRQvoMN9+gZupauXxp4FtAgWOkL3fmv9D0hdt2j37X/uqWpI0nUVC0JRR4FYIRH7/UcuD2wq+LtOEF0Rj92rRuNdNu8/BOgU62Hmhlu54G9Gll9oZ1QBYjt/YmV1mYS/p3gNOY9HgDvEa8qVnJJ3VxtpH2DBGxxG/voxszRLVZmBFFMiDNutRdfEbTdyKAQcF2rkTM2Ibr4uU1QTub/U8o2SvzMYjs+YRGoiKtcUISoAJqO60u9gpGrzcp2G+s4RwD4T+dZPgVV3yDL6DmuoRqhYWrLhgpoQV9DJSH/rCLmXhk58kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VEuPkwFGkFfJzJOVjYMLNnTyDRFXiwdVKkcEJa0WuY=;
 b=fTeDcxhh27BWm42PJeC9jgAn/3GcOk/F0gKZFKd+3+t1h2g6je+2X7sxvxDSJR97DqwV0zGd8vk1bilVcvA8oeBaHWZr2R+pChVwTDJ+HzkfYOL1qxWQe63rQq82ENWAAdRK7YXEuwCmCqaeAaLZdmND7ycUjMhG5FQiJVWjE+frELJotRv/9fe21vZTUC/9bDDJ6uPlapyfQj4JmGGpOAgc6nfdhvkmBPD9z7GkxgGE+eFMy4esE9LakaJKs/t9Q/5bG+cLAeXwD2O9G61ekDJJbF8J1Io8rsUekSx8vjuf2KLES7Hoe4pIdLIkQAlSxt3JGFePpeiji/SZasTKoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VEuPkwFGkFfJzJOVjYMLNnTyDRFXiwdVKkcEJa0WuY=;
 b=FznjhvSDAJFHWT5evPEmYHXuTA8q+LcLS88rOAy72jS0f2EQUMWOtC05HFXCoLc/vvXaE7dX/rd6dtWP05cDOfSDSIMdFP+hAhIR/3m2GiVMcoZzTI5/CbyL6vLusCDOxF+IEhSmYlSaa5CDbnjkkr/2S7X54DoPqZEonazIeQ8=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4021.eurprd04.prod.outlook.com (2603:10a6:209:3f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 02:10:15 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4628.020; Fri, 29 Oct 2021
 02:10:15 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Alexandre Courbot <acourbot@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH] media: docs: dev-decoder: add restrictions
 about CAPTURE buffers
Thread-Topic: [EXT] Re: [PATCH] media: docs: dev-decoder: add restrictions
 about CAPTURE buffers
Thread-Index: AQHXynNz04vuLxTdIEik9H7o+bstzqvpPgug
Date:   Fri, 29 Oct 2021 02:10:15 +0000
Message-ID: <AM6PR04MB634130FEB433CCA352CE98FBE7879@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <20211018091427.88468-1-acourbot@chromium.org>
 <9cb4f64e2ec3959df44b71dd69ef95697920dc4b.camel@ndufresne.ca>
In-Reply-To: <9cb4f64e2ec3959df44b71dd69ef95697920dc4b.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f1d7bf1-0602-4546-b7d6-08d99a813f50
x-ms-traffictypediagnostic: AM6PR04MB4021:
x-microsoft-antispam-prvs: <AM6PR04MB4021D9B3F2D5990AFB4B28B7E7879@AM6PR04MB4021.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mo/T65/tjdZ+8K1QS50mL41ha+nnEY0W+JUKnzYmxYnuPxm205cDSzIsLy+RCsvPsfd4FnfH4tKXj1a738gkMdtUbNV3fyhzJRAQki3P9fly7MqOvNPn+L1YXhN0JtaFKvsIRwo8NRS1Mx97qPvmfWeGC0ksR0IOLfrM9SCEsTtHwqDC94VoxKQJu5ZR2qmlOq0mHUlaxHobp02A+dyU0T1KLpLsaZGmwjMo7m5D990MTO9BeKgx7PcGuLrfWm1JZwuk40+El29lp1Ro68QXGqsBecuhWvtfNWaovQaQXTuiN2rmdaJAUPr+2J+8XAERsq/leVGxic3KBrqdMFfisZuCvPebXeWlLnJAIg+192iw/3G8tuW/DWGJfW7Mnl/RqkdNxvc/HdtBrcMaA6ndXn+GcFT7tEihxyvqNFC4XWdr2iX+LXtzmHPngWgEKRwwo2P3K6qa9YEFcU9jqM3vs0DFQxgb9PE1EyWT8u9h0wc5wVjsnPe3lQDQVSz9n7kg5XAQnyY4QxWpkmZK3xAwOt/W4pUgLvVGbXj2bM1cooykRW0qCyxbAMgk7jhQbeFiKI5MwMNrdNsikddztk1pbMmy99a+7OHC344WY26msoq+XI59578JHk5QWi9KzCYUsgQwvmWiVxIbZ0KpxD+bHt9y/RzkyxJDpwGzOzjrLnohhHIP5Kke370oCJy4nmpDSCeIRFzXfsik51vL/HD47g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(5660300002)(44832011)(66574015)(83380400001)(2906002)(66476007)(66556008)(64756008)(66946007)(4326008)(7696005)(316002)(8936002)(9686003)(53546011)(66446008)(55016002)(6506007)(110136005)(38100700002)(8676002)(38070700005)(71200400001)(86362001)(186003)(26005)(54906003)(122000001)(33656002)(52536014)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHJ6dE01VkVnbW0ySVBXV3hBdHZvek9pL2YvUVp2RjQ1VzMyVGZZZDlhdlVh?=
 =?utf-8?B?a1VsZlFxbnJ5RFRBVVA5WEpWSkdMakQxckwwOStwTU91ZTZTMmI3bjJGOFJz?=
 =?utf-8?B?T3VGL0gvcm85NlJXMzBvVXFPRDMxV25ObXBIbDhQNFJIV0ZxbXFpNU9KYkxY?=
 =?utf-8?B?dVh6UGNlVXFWdE16ZmdTT2FiN25MT2pGOHFsSUlFS0JXVnVnRW56YitZNzQz?=
 =?utf-8?B?NzVNUXpxMTNGN1ZsOXlUcllaMExNRDgrNUVMQUFqU1M5a0IwZUtIOWt4YVcz?=
 =?utf-8?B?YnFXUE9FNzlrTy9JZS9aZjRjWnBDeTFyUWRobkpyZXZFbjBjWWxyZ0RIQ0FR?=
 =?utf-8?B?a0dEb0ZUT2RiYm9kZnJIczBhTmpheHRHN3dVVTlGUG1PdXZQVFhqc0JBWVRB?=
 =?utf-8?B?dXB2VlJkekRTYkxpbW5xby9QbkFNNUNNSlRJb1hVamtYbzZiYmZUSUFiN0Ew?=
 =?utf-8?B?RVhva3lWUVN1UlVHaUJVMkVXUEpKeWVpUWpBRWpVQVVCaXFMYlNLcFUvc1dS?=
 =?utf-8?B?OFlvSVQyaHBmSkp2OE56YkFNUWpFUDlIcWdGaUg3VUpXckg5ZkZkdzFoaG9H?=
 =?utf-8?B?VS9DTTUyNEtnZ3Q1MjZoYlp2djA4aDY0NWUwZVJNZ01jZHJLUE03OTVvUXlz?=
 =?utf-8?B?MVVlQXJZUS9GR1Vja0s3WnNOOVF3NEp0VWRpaGxOaGdDQmJ1ZTRXTkNYTUUw?=
 =?utf-8?B?VC9MV3BkNXFhOGhLM1FUQmUzRk01V0QwMit1KzhoZ3o3dzE0bDR2TlY5ZzUv?=
 =?utf-8?B?Z01sbE5iaHlxZmtSb2w5aVJjSjYyYjV5b0U5TlVNbGhGR1Evblh6VTkxeWwz?=
 =?utf-8?B?Z2g4Q3hDZW8xUEYwU2RZM3JYQktFaWI0bFBsQlRvcFlWemUzUExPVkRzdjMr?=
 =?utf-8?B?NUlNOVA4bGxtNlFUUGVVbnducTBzeVRiRGpkRFdTOTFZay8vVUtVSlVoemZn?=
 =?utf-8?B?YTV0RXpOM0tzd0s3N0R5cHVrZXR5OEN4K2piK1FkSldGd0ozMEpLTWxhOUlU?=
 =?utf-8?B?U1BVSGw0N3BrN3VNRVlZcEMyMFYwTHN3UXVUSXB4djY4UFp4Rm4wSG9LM08y?=
 =?utf-8?B?SjNkWmk5ZFNUVG0yWU5CYTR2YVBucEVvZUg5dmlkUUdpYkwzOFp0YS9ZWkQ1?=
 =?utf-8?B?WHBjV3MweFE3SmpUWmJYU2VuQmZKUEpzTnQ3YTJieXplcC9GQ1NYTHhZNXpH?=
 =?utf-8?B?MmxFVXBZUVVUM2ovRzFrN1lPUGt5ZW5CZndQemhjY0g2ODQwTmhxaHdPN1do?=
 =?utf-8?B?aDQ3WjJHS3lDLys2blIxTHByZEx5YVhtNC96bE5CZHh1cC9QYS9JMmVZY2Nm?=
 =?utf-8?B?VHpzVXZnZVBhWkxraThqWUE0SmRwaEFIbXpCa2lraWE2VmRMcmRaRmQvU0FS?=
 =?utf-8?B?NW9GSSt2Y0FON2pvTVBEMFhKN0tqSENkK0xpbHF6TXNyQXc0VUl3WmY2ZXF0?=
 =?utf-8?B?TzNaT0M1MmxOQUpNV1lobytlSmtRazhQYVRjSWFkcCthay8zdy8wRUIrNXFC?=
 =?utf-8?B?dVQ1YjZoYWxtWlFXTDhtd2ZhUEFMaTlpczFQNFl6UUI2dG5lN05kV1Uxa3lk?=
 =?utf-8?B?SFNpa3RRaWIzQUpPOGFxRWYzcFRWOUV6MGo3eFBuRDFGL2t4VlFoR09DcTR1?=
 =?utf-8?B?WVJ2dVBzdDd5VDA3RVEycUsxajVVWDd1NjVkNTh3R0haU3d5MjMxaG15UXFm?=
 =?utf-8?B?MTJCalRyVks4LzJtaHJKaDl6Yk9UWVpGZDAxM21aQlZxVzA1cWVTTXNXVTFa?=
 =?utf-8?B?c3ZqOXowOW9wbFNzb2tHV1R0b1l5VnhFM2NwcmxKV05lK2Y0UE9QR3RmVk1l?=
 =?utf-8?B?MzJJT29oQ05rUmhoSm5hOVFvRkovZWM1b2FUNm9PTmR6NnZkNzBwWkZYVENq?=
 =?utf-8?B?Q29ITmREd3ptdXpCODhwVWlqOWJhYXBNeGxPSFN3Ky9vNHFuaVFocmxmdFN1?=
 =?utf-8?B?SmdpQi9oeG5RR3FSN1NjMHBLQkRLUCtLYk1pSjdKM2I3cElFSUE4TzBPRDVV?=
 =?utf-8?B?clZsNXV4ejNmSXhjNkJzbit4bENDWXd3RmFMNllaWmp0bE0yMlNmVE1wMGk2?=
 =?utf-8?B?QmRxSk1qUFZMdmxkZytWaktJOTdFYnNkN3hkTlNnU3BCQ3ZvM3pJNmpBZDdN?=
 =?utf-8?B?bzVpb0RjeTFNQ1B5eEhNblptRTZvSGs3VWNVTVUrc1hab1V3eTJjUk9RYjla?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1d7bf1-0602-4546-b7d6-08d99a813f50
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 02:10:15.2119
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /eHu8lIyaL0EjyIS8qAowWtv66JELUg9M0OFWsznh3lZ8xO1ZkEE798IhdE8kDUXbWQQm45GbP8fhqWS3i+Idg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4021
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOaWNvbGFzIER1ZnJlc25lIFtt
YWlsdG86bmljb2xhc0BuZHVmcmVzbmUuY2FdDQo+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMjYs
IDIwMjEgMTA6MTIgUE0NCj4gVG86IEFsZXhhbmRyZSBDb3VyYm90IDxhY291cmJvdEBjaHJvbWl1
bS5vcmc+OyBNYXVybyBDYXJ2YWxobyBDaGVoYWINCj4gPG1jaGVoYWJAa2VybmVsLm9yZz47IEhh
bnMgVmVya3VpbCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPjsgVG9tYXN6IEZpZ2ENCj4gPHRm
aWdhQGNocm9taXVtLm9yZz4NCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIXSBt
ZWRpYTogZG9jczogZGV2LWRlY29kZXI6IGFkZCByZXN0cmljdGlvbnMgYWJvdXQNCj4gQ0FQVFVS
RSBidWZmZXJzDQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IExlIGx1bmRpIDE4IG9j
dG9icmUgMjAyMSDDoCAxODoxNCArMDkwMCwgQWxleGFuZHJlIENvdXJib3QgYSDDqWNyaXQgOg0K
PiA+IENBUFRVUkUgYnVmZmVycyBtaWdodCBiZSByZWFkIGJ5IHRoZSBoYXJkd2FyZSBhZnRlciB0
aGV5IGFyZSBkZXF1ZXVlZCwNCj4gPiB3aGljaCBnb2VzIGFnYWluc3QgdGhlIGdlbmVyYWwgaWRl
YSB0aGF0IHVzZXJzcGFjZSBoYXMgZnVsbCBjb250cm9sDQo+ID4gb3ZlciBkZXF1ZXVlZCBidWZm
ZXJzLiBFeHBsYWluIHdoeSBhbmQgZG9jdW1lbnQgdGhlIHJlc3RyaWN0aW9ucyB0aGF0DQo+ID4g
dGhpcyBpbXBsaWVzIGZvciB1c2Vyc3BhY2UuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAY2hyb21pdW0ub3JnPg0KPiA+IC0tLQ0KPiA+ICAuLi4v
dXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvZGV2LWRlY29kZXIucnN0ICAgICB8IDE3DQo+ICsrKysr
KysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9k
ZXYtZGVjb2Rlci5yc3QNCj4gPiBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92
NGwvZGV2LWRlY29kZXIucnN0DQo+ID4gaW5kZXggNWI5YjgzZmVlY2ViLi4zY2YyYjQ5NmYyZDAg
MTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9k
ZXYtZGVjb2Rlci5yc3QNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVk
aWEvdjRsL2Rldi1kZWNvZGVyLnJzdA0KPiA+IEBAIC03NTIsNiArNzUyLDIzIEBAIGF2YWlsYWJs
ZSB0byBkZXF1ZXVlLiBTcGVjaWZpY2FsbHk6DQo+ID4gICAgICAgYnVmZmVycyBhcmUgb3V0LW9m
LW9yZGVyIGNvbXBhcmVkIHRvIHRoZSBgYE9VVFBVVGBgIGJ1ZmZlcnMpOg0KPiBgYENBUFRVUkVg
YA0KPiA+ICAgICAgIHRpbWVzdGFtcHMgd2lsbCBub3QgcmV0YWluIHRoZSBvcmRlciBvZiBgYE9V
VFBVVGBgIHRpbWVzdGFtcHMuDQo+ID4NCj4gPiArLi4gbm90ZTo6DQo+ID4gKw0KPiA+ICsgICBU
aGUgYmFja2luZyBtZW1vcnkgb2YgYGBDQVBUVVJFYGAgYnVmZmVycyB0aGF0IGFyZSB1c2VkIGFz
IHJlZmVyZW5jZQ0KPiBmcmFtZXMNCj4gPiArICAgYnkgdGhlIHN0cmVhbSBtYXkgYmUgcmVhZCBi
eSB0aGUgaGFyZHdhcmUgZXZlbiBhZnRlciB0aGV5IGFyZQ0KPiBkZXF1ZXVlZC4NCj4gPiArICAg
Q29uc2VxdWVudGx5LCB0aGUgY2xpZW50IHNob3VsZCBhdm9pZCB3cml0aW5nIGludG8gdGhpcyBt
ZW1vcnkgd2hpbGUgdGhlDQo+ID4gKyAgIGBgQ0FQVFVSRWBgIHF1ZXVlIGlzIHN0cmVhbWluZy4g
RmFpbHVyZSB0byBvYnNlcnZlIHRoaXMgbWF5IHJlc3VsdCBpbg0KPiA+ICsgICBjb3JydXB0aW9u
IG9mIGRlY29kZWQgZnJhbWVzLg0KPiA+ICsNCj4gPiArICAgU2ltaWxhcmx5LCB3aGVuIHVzaW5n
IGEgbWVtb3J5IHR5cGUgb3RoZXIgdGhhbg0KPiBgYFY0TDJfTUVNT1JZX01NQVBgYCwgdGhlDQo+
ID4gKyAgIGNsaWVudCBzaG91bGQgbWFrZSBzdXJlIHRoYXQgZWFjaCBgYENBUFRVUkVgYCBidWZm
ZXIgaXMgYWx3YXlzIHF1ZXVlZA0KPiB3aXRoDQo+ID4gKyAgIHRoZSBzYW1lIGJhY2tpbmcgbWVt
b3J5IGZvciBhcyBsb25nIGFzIHRoZSBgYENBUFRVUkVgYCBxdWV1ZSBpcw0KPiBzdHJlYW1pbmcu
DQo+ID4gKyAgIFRoZSByZWFzb24gZm9yIHRoaXMgaXMgdGhhdCBWNEwyIGJ1ZmZlciBpbmRpY2Vz
IGNhbiBiZSB1c2VkIGJ5IGRyaXZlcnMgdG8NCj4gPiArICAgaWRlbnRpZnkgZnJhbWVzLiBUaHVz
LCBpZiB0aGUgYmFja2luZyBtZW1vcnkgb2YgYSByZWZlcmVuY2UgZnJhbWUgaXMNCj4gPiArICAg
c3VibWl0dGVkIHVuZGVyIGEgZGlmZmVyZW50IGJ1ZmZlciBJRCwgdGhlIGRyaXZlciBtYXkgbWlz
aWRlbnRpZnkgaXQgYW5kDQo+ID4gKyAgIGRlY29kZSBhIG5ldyBmcmFtZSBpbnRvIGl0IHdoaWxl
IGl0IGlzIHN0aWxsIGluIHVzZSwgcmVzdWx0aW5nIGluIGNvcnJ1cHRpb24NCj4gPiArICAgb2Yg
dGhlIGZvbGxvd2luZyBmcmFtZXMuDQo+ID4gKw0KPiANCj4gSSB0aGluayB0aGlzIGlzIG5pY2Ug
YWRkaXRpb24sIGJ1dCBpbnN1ZmZpY2llbnQuIFdlIHNob3VsZCBleHRlbmQgdGhlIEFQSSB3aXRo
IGENCj4gZmxhZ3MgdGhhdCBsZXQgYXBwbGljYXRpb24ga25vdyBpZiB0aGUgYnVmZmVycyBhcmUg
cmVmZXJlbmNlIG9yIHNlY29uZGFyeS4gRm9yIHRoZQ0KPiBjb250ZXh0LCB3ZSBoYXZlIGEgbWl4
IG9mIENPREVDIHRoYXQgd2lsbCBvdXRwdXQgdXNhYmxlIHJlZmVyZW5jZSBmcmFtZXMgYW5kDQo+
IG5lZWRzIGNhcmVmdWwgbWFuaXB1bGF0aW9uIGFuZCBtYW55IG90aGVyIGRyaXZlcnMgd2hlcmUg
dGhlIGJ1ZmZlcnMgKm1heWJlKg0KPiBzZWNvbmRhcnksIG1lYW5pbmcgdGhleSBtYXkgaGF2ZSBi
ZWVuIHBvc3QtcHJvY2Vzc2VkIGFuZCBtb2RpZnlpbmcgdGhlc2UNCj4gaW4tIHBsYWNlIG1heSBo
YXZlIG5vIGltcGFjdC4NCj4gDQo+IFRoZSBwcm9ibGVtIGlzIHRoZSAibWF5IiwgdGhhdCB3aWxs
IGRlcGVuZHMgb24gdGhlIGNob3NlbiBDQVBUVVJFIGZvcm1hdC4gSQ0KPiBiZWxpZXZlIHdlIHNo
b3VsZCBmbGFnIHRoaXMsIHRoaXMgZmxhZyBzaG91bGQgYmUgc2V0IGJ5IHRoZSBkcml2ZXIsIG9u
IENBUFRVUkUNCj4gcXVldWUuIFRoZSBpbmZvcm1hdGlvbiBpcyBrbm93biBhZnRlciBTX0ZNVCwg
c28gRm9ybWF0IEZsYWcsIFJlcWJ1ZnMNCj4gY2FwYWJpbGl0aWVzIG9yIHF1ZXJ5YnVmIGZsYWdz
IGFyZSBjYW5kaWRhdGVzLiBJIHRoaW5rIHRoZSBidWZmZXIgZmxhZ3MgYXJlIHRoZQ0KPiBiZXN0
IG5hbWVkIGZsYWcsIHRob3VnaCB3ZSBkb24ndCBleHBlY3QgdGhpcyB0byBkaWZmZXIgcGVyIGJ1
ZmZlci4gVGhvdWdoLA0KPiB1c2Vyc3BhY2UgbmVlZHMgdG8gY2FsbCBxdWVyeWJ1ZiBmb3IgYWxs
IGJ1ZiBpbiBvcmRlciB0byBleHBvcnQgb3IgbWFwIHRoZW0uDQo+IA0KPiBXaGF0IHVzZXJzcGFj
ZSBjYW4gZG8gd2l0aCB0aGlzIGlzIHRvIGV4cG9ydCB0aGUgRE1BQnVmIGFzIHJlYWQtb25seSwg
YW5kDQo+IHNpZ25hbCB0aGlzIGludGVybmFsbHkgaW4gaXRzIG93biBjb250ZXh0LiBUaGlzIGlz
IGdyZWF0IHRvIGF2b2lkIGFueSB1bndhbnRlZA0KPiBzaWRlIGVmZmVjdCBkZXNjcmliZWQgaGVy
ZS4NCg0KSSB0aGluayBhIGZsYWcgc2hvdWxkIGJlIGFkZCB0byB0ZWxsIGEgYnVmZmVyIGlzIHJl
ZmVyZW5jZSBvciBzZWNvbmRhcnkuDQpCdXQgZm9yIHNvbWUgY29kZWMsIGl0J3MgaGFyZCB0byBk
ZXRlcm1pbmUgdGhlIGJ1ZmZlciBmbGFnIHdoZW4gcmVxYnVmcy4NClRoZSBidWZmZXIgZmxhZyBz
aG91bGQgYmUgZHluYW1pY2FsbHkgdXBkYXRlZCBieSBkcml2ZXIuDQpVc2VyIGNhbiBjaGVjayB0
aGUgZmxhZyBhZnRlciBkcWJ1ZiBldmVyeSB0aW1lLg0KDQo+IA0KPiA+ICBEdXJpbmcgdGhlIGRl
Y29kaW5nLCB0aGUgZGVjb2RlciBtYXkgaW5pdGlhdGUgb25lIG9mIHRoZSBzcGVjaWFsDQo+ID4g
c2VxdWVuY2VzLCBhcyAgbGlzdGVkIGJlbG93LiBUaGUgc2VxdWVuY2VzIHdpbGwgcmVzdWx0IGlu
IHRoZSBkZWNvZGVyDQo+ID4gcmV0dXJuaW5nIGFsbCB0aGUgIGBgQ0FQVFVSRWBgIGJ1ZmZlcnMg
dGhhdCBvcmlnaW5hdGVkIGZyb20gYWxsIHRoZQ0KPiA+IGBgT1VUUFVUYGAgYnVmZmVycyBwcm9j
ZXNzZWQNCj4gDQoNCg==
