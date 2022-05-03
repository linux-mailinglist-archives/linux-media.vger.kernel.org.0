Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71377518941
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 18:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239094AbiECQGh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 12:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239090AbiECQGf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 12:06:35 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CEB19C2B;
        Tue,  3 May 2022 09:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zmg8MaJlAWyIBCkeS3FHkQtA9OZgt4DL6+36GBJgQatt233LKVvJLpO2zo4sJabfzpBSEibJpcVJC2vVM/Rrwfd4AAtjTL99ojKygEQNv/JayvVDJRv9ewXYjEkTjJA0ISdkREj73+90ZgEqPkXI8+Cp2GwRF8bpl8bohVDhrwa8Bgh1tvL61Ud6SbBtaUB/5kV4NVg3vuuOJFKjvu+kTUKtw5AOHfcOyoGmIiwKLJxR2Yfj8Se2oqkye9pVbmJbwVc3fydlv1ZEEVozaCSAYaorz5voxrRQOfQvZR3sEMGzDKsgOTktLSOhgLSGqTkF+BhcEoPCNsLpLhufmqPlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKuNtiphfPyD1aNZXSfQZW9vXAButNRFghhOpzrnP/I=;
 b=CXwdG6iXWVl/wEuD7vJ+9rBCCAJuMZp1Gk8upvaO2zqy2sDq2X2y+n13bP4u7hn4EYLp85efwXaQJt5Y1e/f+zPP2GbOZJzBSgZ0vN8BgVYh3UgQLfNKNi1jf4b9dEA2dUYXvwLWsY5MlWC2RDWMFDrFdb6BmrBODpEngowwSyoRpv6PLPQrszQIItfwtJqfKtjeA8uLQKQKkPMpvvh2ltryQ1tMwzZK1sJ9RJBU9qcvuwjxKknTUep69bSKJLwSWeodHWwxscBuI4F+F81nOOD5XIb750pMVc1+pQNvNaBs9yBTpKyqCjmaAi8tE4m0kVXBUC4tuXCX9XyD3dsWRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKuNtiphfPyD1aNZXSfQZW9vXAButNRFghhOpzrnP/I=;
 b=bYYDQzbCoWoQn6lq7dqwPXGCJI0wtMnBpuBqjXzhDIOAIHZs0v5+jEBmkm+1cQwMCUMeCiF2qWSNopJsjgdsMhcQR0tLk2F0XTVL9k0w9LPDeLUJO8F7weNbby1lGgKB9tyINvoiaknJG93agx9FJwuhcYvGACpBlnwkD42rhro=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB7385.jpnprd01.prod.outlook.com (2603:1096:400:f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 3 May
 2022 16:02:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 16:02:56 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v9 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Topic: [PATCH v9 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Index: AQHYWsy3VT/yOu3TOUKgkMrgny1rzK0NSoqAgAAM9+A=
Date:   Tue, 3 May 2022 16:02:56 +0000
Message-ID: <OS0PR01MB5922A4BB0AA5477409F8AA2B86C09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220428065333.3108-1-biju.das.jz@bp.renesas.com>
 <20220428065333.3108-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUBVGUsuiVdaG+y-+G2Wz3aiKovZsw1K_GvZ6Azgx_zFg@mail.gmail.com>
In-Reply-To: <CAMuHMdUBVGUsuiVdaG+y-+G2Wz3aiKovZsw1K_GvZ6Azgx_zFg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85543bbc-7a06-4f3b-cf9d-08da2d1e6392
x-ms-traffictypediagnostic: TYCPR01MB7385:EE_
x-microsoft-antispam-prvs: <TYCPR01MB73856DC2C1AF393D205B456386C09@TYCPR01MB7385.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +CpFlpuWqZaa1w6vpdlGO+se5sEm2q9vqHgZ3zN3wvLGexc7/PWknCkHD3gdgqDmRu+7gPPia6XOnT7KLvboOznRJvmvjBRh/ZMIxsz68LlltVoe5e+JzHXnrvF1JUXXZAjNEnz0PmoQ00AgFRv5E7HJOejTGawHJJzo/Ckom4VjMS4ng5ZijoAI8eE0uR3htbajw8iWXXnD/wX2zoFuisHQ+uz5J+BAavT1qjU9bbguF7WnAzvwxlRUrLrjrySaphHrM800AGfaP8FhdU6AJfiL5OEwSOfxfr+bxcVBqYgHWXplFbtQF8fafl30OXxYozx6EEma07dzyxosV7GQWJ5pU2M2UzwcJ2lkR+YnyhQs6hlPLjPAk+Fu5X/9p2BWuGlYQrG6UjMUi23XMEn4PtrSWBpLHf7+PsDRvAbVWEZSFmMHm/IakiIywCLYwSM7SaRSP9iy4ARldcCUWmFT8vvHERNkbrQlIYxmIU/eg1VY1Rp8mrcoZRBGVaIk8t+mvEo4/PDV7TYfWh9lu0j1bm8Ey3G6Jxro7sdwSCoFSchW/BkMVOJR+bd61oa3M/lRIW/+kwrogFpaKYrCDuSlFUybXLHiKdXQaaS6cnPpxEdam84CkbE7ZsMD4cSW3Xvxvv3RIc7zGYSvLE6byCbzIvzAkc0In97jBvd605NTtGOclGTmsEs6dimGfc0nYiPFiPCmKavNCq20gXx/pWG4hA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(107886003)(76116006)(66446008)(86362001)(5660300002)(316002)(4326008)(186003)(66556008)(66476007)(66946007)(6916009)(64756008)(8676002)(52536014)(54906003)(8936002)(7696005)(122000001)(9686003)(55016003)(53546011)(26005)(6506007)(33656002)(71200400001)(2906002)(83380400001)(38100700002)(38070700005)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0Y0WVNOSzdyUUo2Zyt6dHpFSXhaN3ltQ1BwN3JDSkQyeGhlMHlXVWt6cDJQ?=
 =?utf-8?B?RkEwN1JjNkl0UzlFeHkzekgwTHk1ZHRUMzZucEpkd0NHQU1HMG1Bc0Z6WnlZ?=
 =?utf-8?B?Ri9wUW5KRitlUkdzUjRpeEtNamh0UmRoSFRNNXk0by9QS2RSaHQvRythenpP?=
 =?utf-8?B?SEV6enJ0MnZEUldtS0doc3ZQN2xBU1MzZ2xXZEhac2J0OWZJWWFERklzVC91?=
 =?utf-8?B?TE1UVW8wLzQ4VFV0azRiTWQzS1NMOVdZKzI3cWZzWDhPZmNnYTlmK0craEcr?=
 =?utf-8?B?a3U0ZzdycEFJMjhDM2x0eDdrQk9LZ3dkdG11MENSNE9kUGdGZVlHT2ZiNVpH?=
 =?utf-8?B?RVY1cTY3Q2NON0hQUzVVUjhEYWhRanUycitCZmhkWXQwdEg5RWZ6SXZNR3ZO?=
 =?utf-8?B?d254UlBwb0kyUlJVZlpWMi81eFphM21VU3JIK2VXYnM5b1BZMVVHM1hGQ2Yz?=
 =?utf-8?B?NFBpbnBrUnJlbFFoS2hLQVZvMTBPM3VwYnhHakFOc3M5ZTdXRlpsMUFPeVJL?=
 =?utf-8?B?ZEw5TFN3cmxTMDhKZHk2RGVjSnJhVmhhaXRUS1BGQUtsQThjSStOUkhqSTg3?=
 =?utf-8?B?cnE1cXFyQmdYUkxJVTVqSVBselgvVVlybXQzckpYdDUybXRLY2ZVUE4xOFhz?=
 =?utf-8?B?YkZSS1VYT2ZzTkRwM1NyZHoxMUJWeE5DSHBIZ3ZXN1V1bEROQUIrRFZYV2Uw?=
 =?utf-8?B?M25SM0JpekZZdzZBVE8wNDY2QXY0Y0dla0cyRE9uRU9LMXczckJNa3BVNGFv?=
 =?utf-8?B?YjdkMmJ6T2pkclQ4TlhjVHpxTWpFc2tHZGp1VEJVcVVFYTZGbzVTQ0ExR0pX?=
 =?utf-8?B?NXVtN3cwWmtrcGdpM25hTUIrd2M3b05FY1lKa1hSMVpHbHljT28wQUgvbXlk?=
 =?utf-8?B?RXJRdHNUM0FHTjZPeDcyOERCOHJtSUh5d3Vxa0VkUk04T3RQbXMxUVNiZEdP?=
 =?utf-8?B?dHRZUldkZmxPRm12NUE0QkFueWF6K1pucFBPN2NCNTk4N3hSOHB0NnpIemlY?=
 =?utf-8?B?aTIrY2hTbmNyZ2FINDc0aFQrS05HQlpBVm16NElYNStZVlk4Yy9uNjVTVUcx?=
 =?utf-8?B?Y1dpMENpaEpmbUtZbTdJeXR4L2Z0bU5GdHZWMnEyOGlmSHdXNmhDL25tMElR?=
 =?utf-8?B?R3c5NFdUUGJwdnR1TVNGaXdTL1hiVlh0eHQwMng2RjhWZ2JqdGdCditZYnhX?=
 =?utf-8?B?Umd4TElzdEhLV3M2WkVWZ2JucThya2orWHk0a0twU3g5OU9tZ3pPRy9ZNEov?=
 =?utf-8?B?UGpDamY4NURVU29DNEQrZnpYMm8zdit2OHVPVno0WVdZMnc3dnExUEVFV0cz?=
 =?utf-8?B?T3VzbDdCcXIwb0dDTkdybi9RMURPWjVtSnhtTGEzWkNRN3ZxRDZaK0VXbW12?=
 =?utf-8?B?S1VjV1dWYkhRTloyalVjNUEzUitWSklrZFNQVVNTb1daVnYvUjQ0UHZPbVFW?=
 =?utf-8?B?bWUxSDY2ZW40U2lDOXpJdHJISlh0b3dBbFJHdHNSd0tSc0l4cTZsV1RzeEww?=
 =?utf-8?B?SU5MRFhMZDdxbnRWdlYxcmlicExLRjMyOGZ3bnh3T0V2bEUrYmtKVk9ROGcv?=
 =?utf-8?B?bm5qTE1uemVwK1ZWUmJmanlLbE4zNnpvYUUrS3h4TU5DYWlMdGg0aUJWRG16?=
 =?utf-8?B?OW1BMjNNV1Z3OWN2dG5CY2h2aWcvN2I1V3VCYzdYUHJ5MUZNQmIzb0JoSy84?=
 =?utf-8?B?S1dCUnVOWk9IZm1wL1VVSTNLb3FvOHJZSFk4ak1BSWJsNWZRckJxMnhjWDM4?=
 =?utf-8?B?UytjNjRyUDNLVU5sd3daREo1U0NLbUlPaldxZzdHV0VyNExjQlNQcEZGaTRn?=
 =?utf-8?B?aU0wam8ySjczeWwrYld6SmlXMDJDaHNpaU0wTFBqa3BRYU1xY3Rod2tESmZj?=
 =?utf-8?B?SkM1M3plQXNtdnJSQjdyR2xIc2pjbWtDZHJiOFovdHVOenNyY3ZsMUVmeitY?=
 =?utf-8?B?a2pmYTZabHFrUjIxNDZlOXdKa0V3d3hReTg2dXJxekM0aVlCNFpOS3poczY3?=
 =?utf-8?B?Z08rblhhRDYxKzkwamVuZ3djeXg5Z3U0WWdiQk9kRVVCUXVBWC80b2ZCMSs1?=
 =?utf-8?B?alF0TFR5eDFWcU9NSnJ6OTVYOWxtTSs0N1ZjaW84WXlZR2U1aUZzUDlOU0Zn?=
 =?utf-8?B?TUp3UkJCOXFjdUhSTWZxU1QvemdvRGlOc3ArQmZibFhGQWZNcTROOWtlZnFk?=
 =?utf-8?B?WmtaVzk0WTVpa0JJNTBPTCtncnR2Vk1xd0VjQ0ltRWdEelhPWkZka2dxNjEr?=
 =?utf-8?B?N0Znek8rTUg0V0dHMUtVbmZpZmVwNWVXTkFwbFpjTmRLMTlOUW53dTVrdjAw?=
 =?utf-8?B?cEZoQ1BMeXNzSW52Q1hhTGFCL1FtQ2RGdk13SStxRW9GejhScWY1R2R5b1RU?=
 =?utf-8?Q?+kvy6cjbnFFu1NRo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85543bbc-7a06-4f3b-cf9d-08da2d1e6392
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2022 16:02:56.8556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6cYKXTx/tOJYnOaWReQGQ7LxDCSG19nd2wKMutl/0kwxVj+dp+J1nFulgQkmBbRUVCLC4J0uvAV9qVsFh62Kgj+0UVaCfn0Wq9Rc91GO5QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7385
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjkgMi81XSBtZWRpYTogcmVuZXNhczogdnNwMTogQWRkIHN1cHBvcnQgdG8NCj4gZGVh
c3NlcnQvYXNzZXJ0IHJlc2V0IGxpbmUNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIEFw
ciAyOCwgMjAyMiBhdCA4OjUzIEFNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCj4gd3JvdGU6DQo+ID4gQXMgdGhlIHJlc2V0cyBEVCBwcm9wZXJ0eSBpcyBtYW5kYXRvcnks
IGFuZCBpcyBwcmVzZW50IGluIGFsbCAuZHRzaSBpbg0KPiA+IG1haW5saW5lLCBhZGQgc3VwcG9y
dCB0byBwZXJmb3JtIGRlYXNzZXJ0L2Fzc2VydCB1c2luZyByZWZlcmVuY2UNCj4gPiBjb3VudGVk
IHJlc2V0IGhhbmRsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBQ
aGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiA+IFJldmlld2VkLWJ5OiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+IFJldmlld2Vk
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiBVbmZvcnR1bmF0ZWx5IHRoaXMg
cGF0Y2ggY2F1c2VzIGEgbG9jay11cCBkdXJpbmcgYm9vdCBvbiB0aGUgS29lbHNjaA0KPiBkZXZl
bG9wbWVudCBib2FyZC4NCj4gDQo+IEFkZGluZyBzb21lIGRlYnVnIGNvZGUgcmV2ZWFscyB0aGF0
IHRoZSBWU1AxIHJlZ2lzdGVycyBhcmUgYWNjZXNzZWQgd2hpbGUNCj4gdGhlIHJlc2V0IGlzIHN0
aWxsIGFzc2VydGVkOg0KPiANCj4gfCBXQVJOSU5HOiBDUFU6IDAgUElEOiAxIGF0DQo+IGRyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy92c3AxL3ZzcDEuaDoxMjEgdnNwMV9yZWFkKzB4NDgv
MHg3NA0KPiB8IHJlc2V0IG5vdCBkZWFzc2VydGVkDQo+IHwgQ1BVOiAwIFBJRDogMSBDb21tOiBz
d2FwcGVyLzAgVGFpbnRlZDogRyAgICAgICAgVw0KPiA1LjE4LjAtcmM1LXNobW9iaWxlLTA0Nzg3
LWcxNzVkZDFiNzc1MzEtZGlydHkgIzEyMzANCj4gfCBIYXJkd2FyZSBuYW1lOiBHZW5lcmljIFIt
Q2FyIEdlbjIgKEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSkNCj4gfCB1bndpbmRfYmFja3RyYWNlIGZy
b20gc2hvd19zdGFjaysweDEwLzB4MTQgIHNob3dfc3RhY2sgZnJvbQ0KPiB8IGR1bXBfc3RhY2tf
bHZsKzB4NDAvMHg0YyAgZHVtcF9zdGFja19sdmwgZnJvbSBfX3dhcm4rMHhhMC8weDEyNA0KPiB8
IF9fd2FybiBmcm9tIHdhcm5fc2xvd3BhdGhfZm10KzB4NzgvMHhiMCAgd2Fybl9zbG93cGF0aF9m
bXQgZnJvbQ0KPiB8IHZzcDFfcmVhZCsweDQ4LzB4NzQgIHZzcDFfcmVhZCBmcm9tIHZzcDFfcmVz
ZXRfd3BmKzB4MTQvMHg5MA0KPiB8IHZzcDFfcmVzZXRfd3BmIGZyb20gdnNwMV9wbV9ydW50aW1l
X3Jlc3VtZSsweDNjLzB4MWMwDQo+IHwgdnNwMV9wbV9ydW50aW1lX3Jlc3VtZSBmcm9tIGdlbnBk
X3J1bnRpbWVfcmVzdW1lKzB4ZmMvMHgxYmMNCj4gDQo+IHZzcDFfcG1fcnVudGltZV9yZXN1bWUo
KSBpbml0aWFsaXplcyB0aGUgVlNQMS4NCj4gDQo+IHwgIGdlbnBkX3J1bnRpbWVfcmVzdW1lIGZy
b20gX19ycG1fY2FsbGJhY2srMHgzYy8weDExNCAgX19ycG1fY2FsbGJhY2sNCj4gfCBmcm9tIHJw
bV9jYWxsYmFjaysweDUwLzB4NTQgIHJwbV9jYWxsYmFjayBmcm9tIHJwbV9yZXN1bWUrMHgzZTQv
MHg0N2MNCj4gfCBycG1fcmVzdW1lIGZyb20gX19wbV9ydW50aW1lX3Jlc3VtZSsweDM4LzB4NTAg
IF9fcG1fcnVudGltZV9yZXN1bWUNCj4gfCBmcm9tIF9fZGV2aWNlX2F0dGFjaCsweGJjLzB4MTQ4
ICBfX2RldmljZV9hdHRhY2ggZnJvbQ0KPiB8IGJ1c19wcm9iZV9kZXZpY2UrMHgyOC8weDgwDQo+
IA0KPiBfX2RldmljZV9hdHRhY2goKSBjYWxscyAicG1fcnVudGltZV9nZXRfc3luYyhkZXYtPnBh
cmVudCkiLA0KPiBieXBhc3NpbmcgdnNwMV9kZXZpY2VfZ2V0KCkuDQo+IEhlbmNlIGl0IHdha2Vz
IHRoZSBwYXJlbnQsIGJ1dCBkb2VzIG5vdCBkZWFzc2VydCByZXNldC4NCj4gDQo+IHwgIGJ1c19w
cm9iZV9kZXZpY2UgZnJvbSBkZXZpY2VfYWRkKzB4NTYwLzB4Nzg0ICBkZXZpY2VfYWRkIGZyb20N
Cj4gfCBjZGV2X2RldmljZV9hZGQrMHgyMC8weDU4ICBjZGV2X2RldmljZV9hZGQgZnJvbQ0KPiB8
IG1lZGlhX2Rldm5vZGVfcmVnaXN0ZXIrMHgxYjgvMHgyOGMNCj4gfCAgbWVkaWFfZGV2bm9kZV9y
ZWdpc3RlciBmcm9tIF9fbWVkaWFfZGV2aWNlX3JlZ2lzdGVyKzB4YjAvMHgxOTgNCj4gfCAgX19t
ZWRpYV9kZXZpY2VfcmVnaXN0ZXIgZnJvbSB2c3AxX3Byb2JlKzB4Zjc0LzB4ZmUwICB2c3AxX3By
b2JlIGZyb20NCj4gfCBwbGF0Zm9ybV9wcm9iZSsweDU4LzB4YTggIHBsYXRmb3JtX3Byb2JlIGZy
b20gcmVhbGx5X3Byb2JlKzB4MTM4LzB4MjljDQo+IHwgcmVhbGx5X3Byb2JlIGZyb20gX19kcml2
ZXJfcHJvYmVfZGV2aWNlKzB4YzQvMHhkOA0KPiB8IF9fZHJpdmVyX3Byb2JlX2RldmljZSBmcm9t
IGRyaXZlcl9wcm9iZV9kZXZpY2UrMHg0MC8weGMwDQo+IHwgZHJpdmVyX3Byb2JlX2RldmljZSBm
cm9tIF9fZHJpdmVyX2F0dGFjaCsweGQ0LzB4ZTggIF9fZHJpdmVyX2F0dGFjaA0KPiB8IGZyb20g
YnVzX2Zvcl9lYWNoX2RldisweDY0LzB4YTggIGJ1c19mb3JfZWFjaF9kZXYgZnJvbQ0KPiB8IGJ1
c19hZGRfZHJpdmVyKzB4MTQ4LzB4MWE4ICBidXNfYWRkX2RyaXZlciBmcm9tDQo+IHwgZHJpdmVy
X3JlZ2lzdGVyKzB4YWMvMHhmMCAgZHJpdmVyX3JlZ2lzdGVyIGZyb20NCj4gfCBkb19vbmVfaW5p
dGNhbGwrMHg3MC8weDE2YyAgZG9fb25lX2luaXRjYWxsIGZyb20NCj4gfCBrZXJuZWxfaW5pdF9m
cmVlYWJsZSsweDFhYy8weDFmOCAga2VybmVsX2luaXRfZnJlZWFibGUgZnJvbQ0KPiB8IGtlcm5l
bF9pbml0KzB4MTQvMHgxMmMgIGtlcm5lbF9pbml0IGZyb20gcmV0X2Zyb21fZm9yaysweDE0LzB4
MmMNCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3ZzcDEvdnNw
MV9kcnYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy92c3AxL3Zz
cDFfZHJ2LmMNCj4gDQo+ID4gQEAgLTU2Nyw3ICs1NjgsMTcgQEAgc3RhdGljIHZvaWQgdnNwMV9t
YXNrX2FsbF9pbnRlcnJ1cHRzKHN0cnVjdA0KPiB2c3AxX2RldmljZSAqdnNwMSkNCj4gPiAgICov
DQo+ID4gIGludCB2c3AxX2RldmljZV9nZXQoc3RydWN0IHZzcDFfZGV2aWNlICp2c3AxKSAgew0K
PiA+IC0gICAgICAgcmV0dXJuIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQodnNwMS0+ZGV2KTsN
Cj4gPiArICAgICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0ID0gcmVzZXRfY29u
dHJvbF9kZWFzc2VydCh2c3AxLT5yc3RjKTsNCj4gPiArICAgICAgIGlmIChyZXQgPCAwKQ0KPiA+
ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiANCj4gUGVyaGFwcyB5b3UgY2FuIG1vdmUg
dGhlIGRlYXNzZXJ0aW9uIG9mIHRoZSByZXNldCB0bw0KPiB2c3AxX3BtX3J1bnRpbWVfcmVzdW1l
KCksIHNvIGl0IGlzIGNhbGxlZCBhdXRvbWF0aWNhbGx5IG9uIGV2ZXJ5IHJlc3VtZT8NCg0KTG9v
a3MgbGlrZSByZXNldCBiZWhhdmlvdXIgaXMgZGlmZmVyZW50IGZyb20gUi1DYXIgR2VuMiBhbmQg
R2VuMywNCkFzIG9uZSB1c2VzIG1lbW9yeSB0byBkaXNwbGF5IGFuZCBsYXRlciBvbmUgdXNlcyBW
U1BEIHRvIGRpc3BsYXkuDQoNCkkgY2FuIHNlZSAyIG9wdGlvbnM6DQoNCk9wdGlvbiAxKSBtb3Zl
IHRoZSBkZWFzc2VydGlvbiBvZiB0aGUgcmVzZXQgdG8gdnNwMV9wbV9ydW50aW1lX3Jlc3VtZSgp
LCBhcyB5b3Ugc2FpZC4NCg0KT3INCg0KT3B0aW9uIDIpIFVzZSByZXNldCBjYWxscyBvbmx5IGZv
ciBHZW4zLg0KDQpJIHdpbGwgZ28gd2l0aCBvcHRpb24gMSwgaWYgdGhlcmUgaXMgbm8gaXNzdWUu
DQoNCj4gDQo+ID4gKw0KPiA+ICsgICAgICAgcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dl
dCh2c3AxLT5kZXYpOw0KPiA+ICsgICAgICAgaWYgKHJldCA8IDApDQo+ID4gKyAgICAgICAgICAg
ICAgIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KHZzcDEtPnJzdGMpOw0KPiA+ICsNCj4gPiArICAgICAg
IHJldHVybiByZXQ7DQo+ID4gIH0NCj4gPg0KPiA+ICAvKg0KPiA+IEBAIC01NzksNiArNTkwLDcg
QEAgaW50IHZzcDFfZGV2aWNlX2dldChzdHJ1Y3QgdnNwMV9kZXZpY2UgKnZzcDEpDQo+ID4gdm9p
ZCB2c3AxX2RldmljZV9wdXQoc3RydWN0IHZzcDFfZGV2aWNlICp2c3AxKSAgew0KPiA+ICAgICAg
ICAgcG1fcnVudGltZV9wdXRfc3luYyh2c3AxLT5kZXYpOw0KPiA+ICsgICAgICAgcmVzZXRfY29u
dHJvbF9hc3NlcnQodnNwMS0+cnN0Yyk7DQo+IA0KPiBMaWtld2lzZSwgbW92ZSB0byB2c3AxX3Bt
X3J1bnRpbWVfc3VzcGVuZCgpPw0KDQpPay4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICB9
DQo+ID4NCj4gPiAgLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0tLS0tLS0tDQo+IA0KPiANCj4gR3J7b2V0
amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4g
LS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0K
PiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZQ0KPiB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
