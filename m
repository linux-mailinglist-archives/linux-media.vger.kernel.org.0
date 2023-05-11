Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEAE6FEE72
	for <lists+linux-media@lfdr.de>; Thu, 11 May 2023 11:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237471AbjEKJOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 May 2023 05:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237508AbjEKJOa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 May 2023 05:14:30 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2046.outbound.protection.outlook.com [40.107.249.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0253A244
        for <linux-media@vger.kernel.org>; Thu, 11 May 2023 02:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRVFqkHZfYy96ypwnzeggQWIvQOppgrvM6s2hHmtjrvbKSfvXp+GoCuAbrpkRFHw7jJdbtAAYlHo8R50jkU7L3bsD+KctYsRUzLyGxSBtKOftDdHbgsFihPPzakIc/vKghTxnSPT9dGrn+TA/i8MiMcpGacY+/w3ptg/TPx33pI+CV7A50D0jW/+LYNhYD05AzbuKkaGvLJxqgcSS7BOod66P5BbcqKWNzxk6wg5eRQFv6r1AiFj9absvT8UHmrOhB09Ti6I+DZLdKfDVXqZ/DoNNr3ctMDvTow+RiL9/74jJh7I/mRGMJO/jBcRij6V3wrJjxisuqBC31xoLpSLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZokQOFP9bYS7psmz9DyRvQAQJfq88+9qOolsjbjgqE=;
 b=hmQZW1Aktn8//5QV5B9RkGzdmbX73SVErqwe4VWWzMkmkMDVcLLZxcQsSj7Qn7Lb0LDWKChYr18TrViLI/jVbRNMk1ySJHv7VJmoYhKzyUHHjewjlysQkbejRfXNvdbTeMH15+krg0V0zm+vlB2loTSTvk84247XPtgxf3cio0nftwjE/CuQTGV7Ryj+m1JZp+ng4lAR5GbGUUeWEJ0IyJAZz3rHpUM3KMSJagG2dTjFkrNZuYb0KseBK0+OGrao7Y+Zm2KC9jyRDXOkpjP82hiTAq4/Sn+iL+Zre/PgHrSgJxd46zdH7JS5tG9ZZxcRUb7XTEFyE+jybPLFBh912Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZokQOFP9bYS7psmz9DyRvQAQJfq88+9qOolsjbjgqE=;
 b=gPITcCN/kH5enK+zjXlQi3TzB+gtfAn+e/fN2kx3WJ7Ez+bHOonwlEUMEQ0BO52wusZ9cB1UlB1HLrC4F19VQk41l9U0WWoA/9sTI6kiKz4tjySwa+3vgKNWRsV9x6+Wrbn5/4YpdlT/RYmRiRUzqNFGbUwGpawtQVMCVK0bhD4=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8623.eurprd04.prod.outlook.com (2603:10a6:102:21a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 09:14:12 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8%4]) with mapi id 15.20.6387.020; Thu, 11 May 2023
 09:14:11 +0000
From:   "G.N. Zhou" <guoniu.zhou@nxp.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>
Subject: RE: [EXT] [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
Thread-Topic: [EXT] [PATCH 0/2] media: ov5640: drive-by frame_interval
 cleanups
Thread-Index: AQHZfyGQI2JAdJOOSkG5qa4G74f/l69LUbmQgAmBafA=
Date:   Thu, 11 May 2023 09:14:11 +0000
Message-ID: <AS8PR04MB9080676E7B0CB32E37AACB9AFA749@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
 <AS8PR04MB90800B7B9BA75668DC82624BFA729@AS8PR04MB9080.eurprd04.prod.outlook.com>
In-Reply-To: <AS8PR04MB90800B7B9BA75668DC82624BFA729@AS8PR04MB9080.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PAXPR04MB8623:EE_
x-ms-office365-filtering-correlation-id: 953c3fa3-9fcf-4776-b8b0-08db520015a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0JLb8OSKDyEmyP2D8nYGa5qj7rVTfxHI/VFee67qNBuit0W8rNXzfdCN78yPTdJwBx0rgrsz4O91XiEBsrHhE1ABWQNZWn35FJBH7lwu2lQO33jAHO52VlS5ANOJtOBb9SOPXSnaFT/x5kJbI/cNClIauHY/oCdUkqW9H5X3gsF2NdlDX00iVHhAqpU2LsrVfSyWJ7cLV06GJEpJChtJDJ7z1J9s+nn7SOWatBIHxDrau3OH4ZfowH2GelSFaoZ0n240Wr/Y2BoKmSjCfoefy2KIUQSA0aIw81f77IGn/DU4m4BUaYbr0b88vYNpR9fICzGc/oTOZcD/B+UAZ5Y1P+So5Pp7TgvVW0blUAab6kM3y3B4M/dztCn6u486Mq7vakj3IPhGHCcqCkNhtU+TamV7Jm+yhus1MDmTUpeuDYt5fkOqXFFDqmUwkCR5DZxfV6klecz7ZI/VkcUs1k244s/FtGiYVuuvzGmBE0kGYzCvdoUMeJui8n6+nrkrqrOjyfJrmeA03MKfcG54i40gzT0wLiS8HAwFhwuwXNiEk/i1CMUNtd4+CbRR3xzv5seifn1iVyNFQMDBpuS8AyAfa6s4PXfIM6GyIHKAu4PRiPAHhZNahLbc90rQSV9v0t1e
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199021)(54906003)(71200400001)(2906002)(7696005)(478600001)(41300700001)(9686003)(26005)(186003)(6506007)(53546011)(33656002)(55016003)(5660300002)(38100700002)(83380400001)(8676002)(6916009)(8936002)(86362001)(64756008)(66476007)(66556008)(122000001)(66446008)(66946007)(76116006)(52536014)(38070700005)(316002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?TG9FWUZEWmNFWFRubjNWWUlwSysyTTRUSk11eDAvS0lWcGoyZFgzdVpuQnEw?=
 =?gb2312?B?QS9qd28vMzg1bmpoUGV0UlNXUUdvZWRLUEQyYi80SzZHWHdsMG9Mdm0xTWk4?=
 =?gb2312?B?RDlhWHhmdWQra2g2NjVyZTVoVjdpNEtObWVnbjR6bHl2VzhnL0J1bmV0YmFr?=
 =?gb2312?B?VDdMMGNxSmNmeHFzQUNISHRZT1NBZE04VTVtd09CSUczUmNIYlBDRDFZUk5r?=
 =?gb2312?B?TXZ1OUpydlVmUWIrT3dhSkFXMlVlT0ZubTNwODgzellLa291Mzl4TEttYXB1?=
 =?gb2312?B?V1ljNm1pOXJKNTB3VXdDVVhTSkN2L091bzNRMWdCWFlWVDZJcW81MlFwc3BH?=
 =?gb2312?B?SGZZZHk5QS85Z0VlTm5mYXNwQWROOHFxT0hlQXBsNkRoeGdzMVZ6QTVpdlRJ?=
 =?gb2312?B?YU1jZFBmM2RVeEoxMkRXUUIvNkU2SndOdjU2ZHhlalBCVTdydzBxVGNrUmwy?=
 =?gb2312?B?TWVhRk1rSC9YKzl5TERVUkE2QkxiZkxYcDlJNGVrOUhPaTl5N2paYzhIVHVJ?=
 =?gb2312?B?dWlTQ09hZFNiTGRxSjRkSWxmSm1udkxGSC9sMno4Q3M4c2M2elU1MmppT2xE?=
 =?gb2312?B?SHc3RFRodUZtakVqVVJUYlZ1T0hFOENpdHR4THFOYVFRMHA4QzZieW10a2FI?=
 =?gb2312?B?UjFQN1J4RjF1d1BwcGNSblFrOXBOY3ZHZkNqYWt0NTBiell3c09hM3R3QVlS?=
 =?gb2312?B?UG5IaU01c1dSZjVuRFI5R2hMLzhLWWI2R3lLSjNobTVuaVJBR1gyYmszOUFm?=
 =?gb2312?B?Ung4SUh6YXB5L2ZyQlo4WWV0NmJWajUzNElPSU9XSmhaSmNGSUVYakpkbEkx?=
 =?gb2312?B?cWxlSE16TENhMjNhcjgvWDRHYTNCaWNiUm1YNnZkb0d2dnBhK0Qya29hcEpy?=
 =?gb2312?B?OVQyeU9namNJbzY5d2dNKzlOSmtvNWpGTkRrcW1lRUg1aUR1MnFGaVl3ZHVJ?=
 =?gb2312?B?T2pLd1ZaYnVXSk01ZXpkUHZld09PazJRTTlWWnNoeERaSWNhZlhZbTAraTFV?=
 =?gb2312?B?RFFGS290c1ZjdUtud1ZHdFpwWGtlbEtFdXRxQ1pDZlNpZmZWNW5FRE9GaGdD?=
 =?gb2312?B?R2U4MFU5b3pqK0lwWUI2S1hQajBObmFFMWlUOFNCdVQ1MzI5MTF2c3FTMVdu?=
 =?gb2312?B?aENJUUM1N21peGh1YkhkR3FndTcyVkk3eU9hZkF2K0dQRmUvYXVhekhZRndD?=
 =?gb2312?B?OStGc1RacDBDQ1Z5cDJlWTJPeTBWa3FYMnAxUlc4VHI0MHpQUlRiTEUrbi9Y?=
 =?gb2312?B?WThFeWx0bkpDcUhZejJOUlFsOFZ3cUpJWG9oUnhUREQyV0h3ZHdBSEdmZ1Bu?=
 =?gb2312?B?KzRPZXhXNlR0cjg1b3J1UWN4SFZUT0xyU3FycTBhWURtZHAwdWFjUlgzYmFH?=
 =?gb2312?B?Z1pSY1BTeXh3TEJxRHZhd05LYzhYdVBpSWlidnd4aGhaZi9xZEdkcGIwY0ti?=
 =?gb2312?B?R2t5aVZ2dnFWUmc4VlB3YmFqR05TS0tLeHpMUTZVQzRtMW5tUTZmaStpcVA2?=
 =?gb2312?B?R2l5bHZBc3dCT0FyT3ViQmNxZnN5YWN4WXRGK2UxV2g2VnJlcWtlWmk4NnJz?=
 =?gb2312?B?RndEWm5scnVrYlZXaUg5WUdyYUtXZEowdGJnQ3NHVzRydkFPNGNVcGVhd3lX?=
 =?gb2312?B?aTJ4M2hrSCtlVkhVQmJ0UjdvMjFqYkl6YzBKUzdRWlJRbmdERnJUaVFGQm8x?=
 =?gb2312?B?eHFmRGt0Smt1Z3VweHFVd0xhb2ZPR2syQkk0T3JHVU1Zc0R2TkhJaHpiN2tS?=
 =?gb2312?B?YncvS1UxK21RWEVSOXpwek5JYnZGckh0QUUxYm1lUHp5TFc4OEY0WlpXZ3Zv?=
 =?gb2312?B?NlNmVXBhbXY5K1doYnZWTUNTYjJJd1ppQlI2NlZGUEgvZHh0V0dhQTROb2VC?=
 =?gb2312?B?V2FRbWVFT3ZRMjhTM1RZOTlxNWptRWVFNTVEWlYwVVFnRU5GZUF3ZGJLSjFr?=
 =?gb2312?B?VkdKNnFQN0xBZ3JHQm9ETWZCdE5rMld6d0dxVXhHS01Zc3dYMXhwVFJKcTRn?=
 =?gb2312?B?cGlWVXJCOGpJN29FS2VtWTllanhUU0hWa2pDUzFFNU0ra1BOS2RUcXBsU08y?=
 =?gb2312?B?RUJKaHhtMGNZbFJZcytJVXdqZUFjV052aU05WUEzOEdLNUJzdE0xK29rbTR5?=
 =?gb2312?Q?QyuY=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 953c3fa3-9fcf-4776-b8b0-08db520015a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 09:14:11.9210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zWJgWGTkIEN4yoIUDnY8wa1lkFPRKxbKWzumhyhPbYnBpF7R3OTCbL6n+BVGEdztg7seim+KU6o9XbYJu3+Wsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8623
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SSB0ZXN0ZWQgdGhlIHBhdGNoIG9uIE5YUCBpTVg4TVAgcGxhdGZvcm0gYW5kIG5vIGlzc3VlcyBm
b3VuZC4NCg0KVGVzdC1ieTogR3Vvbml1Lnpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRy5OLiBaaG91DQo+IFNlbnQ6IDIw
MjPE6jXUwjXI1SAxNjowMw0KPiBUbzogSmFjb3BvIE1vbmRpIDxqYWNvcG8ubW9uZGlAaWRlYXNv
bmJvYXJkLmNvbT4NCj4gQ2M6IHNsb25nZXJiZWFtQGdtYWlsLmNvbTsgbGludXgtbWVkaWFAdmdl
ci5rZXJuZWwub3JnOw0KPiBtY2hlaGFiQGtlcm5lbC5vcmcNCj4gU3ViamVjdDogUkU6IFtFWFRd
IFtQQVRDSCAwLzJdIG1lZGlhOiBvdjU2NDA6IGRyaXZlLWJ5IGZyYW1lX2ludGVydmFsIGNsZWFu
dXBzDQo+IA0KPiBTdXJlLCB3aWxsIHVwZGF0ZSBsYXRlci4NCj4gDQo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBKYWNvcG8gTW9uZGkgPGphY29wby5tb25kaUBpZGVh
c29uYm9hcmQuY29tPg0KPiA+IFNlbnQ6IDIwMjPE6jXUwjXI1SAxNToxNg0KPiA+IFRvOiBHLk4u
IFpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQo+ID4gQ2M6IEphY29wbyBNb25kaSA8amFjb3Bv
Lm1vbmRpQGlkZWFzb25ib2FyZC5jb20+Ow0KPiA+IHNsb25nZXJiZWFtQGdtYWlsLmNvbTsgbGlu
dXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPiBtY2hlaGFiQGtlcm5lbC5vcmcNCj4gPiBTdWJq
ZWN0OiBbRVhUXSBbUEFUQ0ggMC8yXSBtZWRpYTogb3Y1NjQwOiBkcml2ZS1ieSBmcmFtZV9pbnRl
cnZhbA0KPiA+IGNsZWFudXBzDQo+ID4NCj4gPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFs
IGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcNCj4gPiBsaW5rcyBvciBvcGVu
aW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcg
dGhlDQo+ICdSZXBvcnQgdGhpcyBlbWFpbCcNCj4gPiBidXR0b24NCj4gPg0KPiA+DQo+ID4gV2hp
bGUgbG9va2luZyBhdCBHdW9uaXUgWmhvdSBwYXRjaGVzIEkgbm90aWNlZCB0aGF0IHRoZXJlIHdl
cmUgYSBmZXcNCj4gPiBjbGVhbnVwcyByZWxhdGVkIHRvIHRoZSB1c2FnZSBvZiBmcmFtZV9pbnRl
cnZhbCBmaWxlZHMgZm9yIE1JUEkgQ1NJLTINCj4gPiBmcmFtZXJhdGUgY2FsY3VsYXRpb25zLg0K
PiA+DQo+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVuZGVkLCBqdXN0IGNsZWFudXBzLg0K
PiA+DQo+ID4gR3Vvbml1OiBjb3VsZCB5b3UgcGxlYXNlIHRlc3QgdGhlc2Ugb24geW91ciBzZXR1
cCBhcyB3ZWxsID8gQQ0KPiA+IHRlc3RlZC1ieSB0YWcgd291bGQgYmUgdXNlZnVsIQ0KPiA+DQo+
ID4gVGhhbmtzDQo+ID4gICBqDQo+ID4NCj4gPiBKYWNvcG8gTW9uZGkgKDIpOg0KPiA+ICAgbWVk
aWE6IG92NTY0MDogUmVtb3ZlIHVudXNlZCAnZnJhbWVyYXRlJyBwYXJhbWV0ZXINCj4gPiAgIG1l
ZGlhOiBvdjU2NDA6IERyb3AgZGVhZCBjb2RlIHVzaW5nIGZyYW1lX2ludGVydmFsDQo+ID4NCj4g
PiAgZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMgfCAxNyArLS0tLS0tLS0tLS0tLS0tLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE2IGRlbGV0aW9ucygtKQ0KPiA+DQo+
ID4gLS0NCj4gPiAyLjQwLjENCg0K
