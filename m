Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D2B51B9A5
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 10:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346444AbiEEILY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 04:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235053AbiEEILX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 04:11:23 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498933337C;
        Thu,  5 May 2022 01:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzn44bzK0bJQejuPl+a7+8LXg5XYRmfpuWb0DE6EP3FnB5Z/9dWZOq1lKzkMQu0L5C+PxKpfSoudVOEEgSfc9RuMn26XWIJv5kXmDGOp38yYllRgDQZ//AotV6VCG0e0o8ZRJ/ysYMJAswBS5NtjhiCzRhD/qG1wm7IwP/pQZcW5wL//6+ZyiKp8xivjORYH3JEs7G9bU9b1mtass8d/NIcTYLRbdAOeXCPpO9yNf3sTGp1fvyyTvhw1ZAa+5VDNpi4201I/gN4i9/vY1gi1qJULINwSebuycbwaabFb2O/sj10hSTcxDo/kEKjgJAW8L49AFl/V2fKMCaIiIdK1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPKHX0hvFEp7rnbjXr5e9s+NBYUTw7S/qTFTHIubfHo=;
 b=VLXSL8im7KjTfmzU6MUs1Zqf5L1sXAYy1tSjezZNY0+RmNKJ41NtpFrPcLwym0VAPmsc0hL5TvNLYUSu2UmjaXi35ZrWkyApF24eCom1dUBt36vS+A7pVdKLd1x7DrEbfwQEn8BXh6bGtRxYOnaPSrPwMwyNpQwBcC9IJg4KCzWgmbGNmenJOF3jBrk+NsvKhFSz7IqeFTGcRQGk/7hw63tcYpH9xxLduBHLvRgWPpMuWzhGuNdKqlN4j7laXNszkmavNgerL71F69gFkShZSOJ5bc8Af52th7FbXKHA8FbkT57gboJAjIycWveqw/hqo8CS9OWAarvz7QodjI/kAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPKHX0hvFEp7rnbjXr5e9s+NBYUTw7S/qTFTHIubfHo=;
 b=fxBC7l7cq7MaJovP0Hhqey48WV3YjOTHTyrwapAU7FbiUxSrggEPxdjRqcSr2Fujiy/8pVZJndGwsAIyGB2xMxbU7SFwZPAX56W0j6JEWTEVhSj+aREf1RAV1hKvYsUvvKjhCIhdJobyWA9bILXLapkZZ4g64GOM1L91oormnQ4=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYCPR01MB8240.jpnprd01.prod.outlook.com (2603:1096:400:105::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 08:07:38 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::541f:37c5:2149:bbb4]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::541f:37c5:2149:bbb4%9]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 08:07:38 +0000
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
Subject: RE: [PATCH v10 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Topic: [PATCH v10 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Index: AQHYX+oNNJ1geqaIPE2ZjIQkArNElq0P4hOAgAALW5A=
Date:   Thu, 5 May 2022 08:07:38 +0000
Message-ID: <TYCPR01MB5933CBEB60F2F023E9F014E786C29@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220504190609.94375-1-biju.das.jz@bp.renesas.com>
 <20220504190609.94375-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXGkd=fqvj7Yue7Q6RhuhrgxCrB5BhV-6Q4F3evY1g=qQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXGkd=fqvj7Yue7Q6RhuhrgxCrB5BhV-6Q4F3evY1g=qQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bed9144a-cd1e-40c0-6453-08da2e6e521d
x-ms-traffictypediagnostic: TYCPR01MB8240:EE_
x-microsoft-antispam-prvs: <TYCPR01MB8240E488A175089C224BB37986C29@TYCPR01MB8240.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T5oKpvUYiSaJB95rjaei2xUyJJgaekg0wDUiL6z8oUrGOvNVKk+Tn9nz+zOBjGfGni1CFs80cmEn3nuDsv9dGSkn/EJ7Dr3LTU2iUdMsuEzSFdEMuh358wGfY2Pjb/vB3lTIqC5a3QwVLAWl7tUy2GudY1aC4ANndPm21FMkWexxAXYnHwzfwuDjlYDhKAsLVknvMzlfl4MhupYOclq5FupWpX64ZcV95mkPhvpnJRwsPqfRclEzbW2bWG4XK5IJ1gSROteL7HVNxadbrLfW8q+b9wGyni7iBg2hd6VjQ/9ytmMM77UtT81WXUoLFGLcyk9HTgcxjusbos21LdG+BnbiYfrzahA6GAqpIRey/5WWz4w4QnxGjKGzok3PSsAFsGzkq0aqsOXCCgjQKjwmd4C6i83IEsLtk+GMCt7fL1skdiWNPuEQo/vFlBiDAdSFuHQegTFl5g7si7udW/UJ6OEd0iqc9gXP0VJHb0kjzYAgB0yoxNgVJPYMfq5k4l5o9Pbf361aA/5vaJs4aNVkDNb3In3XXOkKIS2DU0BCnAtl4U9Z2xH1iRYVkIZQH718iN3pF3vz4p1RqLmWH7TzghVcS/svyYyegEAaPx3MRmQuDx6otnNXMT64iOdi9ijTKxla+7IhXJ/NnL+pAF3r9/4unEoWXszyYA+94h6c5mtJJoApRFdCNZjuIUos7372MnDTgLL0ixLnoHM6ZPg7Vg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(33656002)(53546011)(6506007)(186003)(54906003)(55016003)(7696005)(2906002)(122000001)(52536014)(8936002)(86362001)(71200400001)(6916009)(5660300002)(66946007)(76116006)(107886003)(9686003)(8676002)(83380400001)(4326008)(64756008)(66476007)(508600001)(66556008)(66446008)(38070700005)(38100700002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OE5WNm5veHdSOU1wWG5NajYvYWZZeG43ZnZlS0hQTjlqdzJTVG9KKzlTc2wy?=
 =?utf-8?B?STZUMjhCbjhzdDd2QXZxMkpsQllDOGk3Y3RQdVJ1QnZCaHhLbU11Zm96V1lz?=
 =?utf-8?B?d3JheWc5ZzZFRnNXS000b1UycWRtSVFwR3ZmdlJEV1ZqcEhzaVp6anBWVksv?=
 =?utf-8?B?YzB3RW5scmNXYVJYWFVvanowakZtR1lCUTd6czdlaWc2SVdCMkZ1RWMzaEw3?=
 =?utf-8?B?cjVPQVVsb2FJTjNXS2NXM0Q4MTdEQThtb3BxWFFhTTlBR1cxd0ZXTy9EL3JY?=
 =?utf-8?B?akFFQmhocGVYTW1yaktrdG9IaUQzZkRzK1lVQTlHRlR4SEduYm1sV2JMSXg1?=
 =?utf-8?B?YXFpTklKMWY4anNHdmgxbUxlcGU2YWcyQzljTkRaS3RKbTNqeHFKb2RzbEo4?=
 =?utf-8?B?Q0FlRFBQbkp6ZWFEV3ZWdjNxWlRORjBrbjBMeWMyNkx2dkt1UEVTMTJXTnN4?=
 =?utf-8?B?Z1BGc1lWd3JJSHpIQ2tjV01aVUVWUndJR2JoQnpmOUdGZXYrYnBwbFlZcFpv?=
 =?utf-8?B?Wjl6bTJSSko2TFNJQ213QzVWb1NZSXV3aVJPK2NaZEhQVFNmOUs3aFlNbnJr?=
 =?utf-8?B?ZVp0aytGODF1UFFaOGY3VVQwMTBLR3NEcFUrRUJtWGxXWVRMaDdUSUswZnZJ?=
 =?utf-8?B?WDhKQ1dCcitsdU9XeXUwalBUckNJbGxCOUJYbGI2MjVBV3dwVXVvbmttL3cr?=
 =?utf-8?B?QU9qcHBKMUs3WGx6bUg0cElMalkvdFpJR1NaYjVEWVBRRUdMa1hqQUNqUkdQ?=
 =?utf-8?B?TmE2bXhYcUg5d3hmVmtINkJ0MFNaaWZrU1grbzhXZk1FWTViVGNoM1dFWkVK?=
 =?utf-8?B?amFZVmFBeHJVRjJDNFRrajZwMXhYaWNvQUNuY2NYbE5qaExEWlUvK0FBL0Zm?=
 =?utf-8?B?YitpUXFEMUlCeDZSM0lCUXJKM0lwUFo4NUFpWGRxTk5BM1V1UUZxeTFXVXkv?=
 =?utf-8?B?MnM4ekYvSXJFWkYyUDVCdUhiQU9RUWxnYy94cDd6SmtvTlllNiszTlpvOTFN?=
 =?utf-8?B?bFdIeUpVenpibVNsNkdJSHR4dE8wY3F4Yk1ibHJ2azkycTIySkNsTmE4MDF0?=
 =?utf-8?B?NmMrU3BRV2FlbHhLNEMwMnV2bkU4KzE1NFpsMExSOHZWOG1IYW13cXlKR2pi?=
 =?utf-8?B?b3JEYmpXVnlibnkvSUgrajNXSllOam94RVUwN2hSSWFQQmVJb3RMWTVQMStl?=
 =?utf-8?B?eFRsTGJDa1NPd1dOWmJNTDhWdm9LemdITWNBQTNmdG10ZCs0eXgvbTZDd043?=
 =?utf-8?B?ZDZjM0F0ckkxUlRINEJGYXhuVlg2NmFDdkljMmZZM21aR0R0MGJMUjdrUkp0?=
 =?utf-8?B?bWhkbHUyNUZmajROdVN0bHRwYnRUeVhWUkpXM1NqKzVyYkFwdDRHTVhoS1A4?=
 =?utf-8?B?cVJ3ZzRGOVVXSlRoaTlMUUtRdXVIZEtGMHpSN0Jyd3pkbkxnSHhOcDZ4Tmg5?=
 =?utf-8?B?QnZPcVpyT3p5ZTcvS2tJaGhSUTk2NVNCTUpFNTNseU5nSzQzR2U5czk2TkVZ?=
 =?utf-8?B?UVNwYTQzM2ZwcmcrdG00VXRMbEZIVjRBTTFWNEwzWTBoY1ZOUWRpRjZseDZv?=
 =?utf-8?B?VFFwRzJkdUc5aEtEc0VZc0x3S1FaOXI3UCtoTDZsbEFoeXRLTEV4ay8rejBy?=
 =?utf-8?B?aXYwdVprdVg0U1l3VklaOElENmpTbG5Rb0VXMDVWQitXNzczdnoycXVoQmlN?=
 =?utf-8?B?OGRMS3pCeFBxV1d5OE5TN1FtVDhhMXROV0FveElaUFYxbzFQUHpyRzVuM0Rt?=
 =?utf-8?B?d0hNeGJCbnZoekhhZDJSTmRUWC82dDQ4YzVqeWdwck1sUWJDNGpvTnZsVmNr?=
 =?utf-8?B?NDN2dE1FZldBTFdySEE0SXR0M3FNNmdBeHJ4RG9Ob1dIQXVyakN1VHZPSjBN?=
 =?utf-8?B?N1Qxa3l1RFcvMTVOaDJFNWVFREtKNmVpTVBtUEh6S3N3clJmUVhEeVJOdWtl?=
 =?utf-8?B?YmVFMTVCSUdJMTEwNThhZFZQMFhLeENSQ0RsVi9QaW4rR1oxdU5WMXdFbTYw?=
 =?utf-8?B?SFNPNGROU1dlR1F1aFJldytTTldxVW9WU3RvVTMrRmFmcTExRDlQVUp3ZTk4?=
 =?utf-8?B?cVVSaEFRMG9SbjVCczE4U2k2c0tjYzU0OUJpOHFyOTdEcEYvUm03c3JFZnJM?=
 =?utf-8?B?VjdqVjZCRW5XTS9qVHp4VXR2THowcmhKMWJrNU5ycUdKU1VqMnpjNklEeEY5?=
 =?utf-8?B?am1PZGtFY21zWlQ5cEcxNk9zVXlmd25oOGRkbzRyWFVzT0IwSUlmcTNrU2I5?=
 =?utf-8?B?TjE0aWxHSXhuZDBhWlZLVXltbEl0a2hSSTFYOVVZUUJlOEVMNzR3bkljTGRK?=
 =?utf-8?B?cDFXcUxtdStSS2wyRDhFZmw2K2FzMXFUTXBMZkg1bmZjL3dlRGxJOEJGMHJX?=
 =?utf-8?Q?lfxk9XNfLomNLQms=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed9144a-cd1e-40c0-6453-08da2e6e521d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2022 08:07:38.5128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JhZPwwaNFdOg2nrjtYBcfeZK0zZQbIJPyOCzis2IEDMnR487FqqwOdKHdL2Qu0uAxeLkZDO/d/ZXlrc5Sx68nhd9pnkLm5+F/2zYiws8s2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8240
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
UEFUQ0ggdjEwIDIvNV0gbWVkaWE6IHJlbmVzYXM6IHZzcDE6IEFkZCBzdXBwb3J0IHRvDQo+IGRl
YXNzZXJ0L2Fzc2VydCByZXNldCBsaW5lDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBN
YXkgNCwgMjAyMiBhdCA5OjA2IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4gd3JvdGU6DQo+ID4gQXMgdGhlIHJlc2V0cyBEVCBwcm9wZXJ0eSBpcyBtYW5kYXRvcnksIGFu
ZCBpcyBwcmVzZW50IGluIGFsbCAuZHRzaSBpbg0KPiA+IG1haW5saW5lLCBhZGQgc3VwcG9ydCB0
byBwZXJmb3JtIGRlYXNzZXJ0L2Fzc2VydCB1c2luZyByZWZlcmVuY2UNCj4gPiBjb3VudGVkIHJl
c2V0IGhhbmRsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhh
a2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiA+IFJldmlld2VkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+IFJldmlld2VkLWJ5
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+
ID4gLS0tDQo+ID4gdjktPnYxMDoNCj4gPiAgKiBNb3ZlZCB7ZGVhc3NlcnQsYXNzZXJ0fSBjYWxs
cyB0byB2c3AxX3BtX3J1bnRpbWVfe3Jlc3VtZSxzdXNwZW5kfQ0KPiANCj4gVGhhbmtzIGZvciB0
aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMv
dnNwMS92c3AxX2Rydi5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2Fz
L3ZzcDEvdnNwMV9kcnYuYw0KPiA+IEBAIC02MzEsMTMgKzYzMywyMSBAQCBzdGF0aWMgaW50IF9f
bWF5YmVfdW51c2VkDQo+IHZzcDFfcG1fcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2
KQ0KPiA+ICAgICAgICAgc3RydWN0IHZzcDFfZGV2aWNlICp2c3AxID0gZGV2X2dldF9kcnZkYXRh
KGRldik7DQo+ID4gICAgICAgICBpbnQgcmV0Ow0KPiA+DQo+ID4gKyAgICAgICByZXQgPSByZXNl
dF9jb250cm9sX2RlYXNzZXJ0KHZzcDEtPnJzdGMpOw0KPiA+ICsgICAgICAgaWYgKHJldCA8IDAp
DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICAgICAgICAgaWYg
KHZzcDEtPmluZm8pIHsNCj4gPiAgICAgICAgICAgICAgICAgcmV0ID0gdnNwMV9kZXZpY2VfaW5p
dCh2c3AxKTsNCj4gPiAgICAgICAgICAgICAgICAgaWYgKHJldCA8IDApDQo+IA0KPiBNaXNzaW5n
IHJlc2V0X2NvbnRyb2xfYXNzZXJ0KCkuDQoNCk9LLCB3aWxsIGZpeCB0aGlzLCBieSBhZGRpbmcg
Z290byBzdGF0ZW1lbnQsIHdoaWNoIGNhbiBiZSB1c2VkIGZvciBiZWxvdyBlcnJvcg0KaGFuZGxp
bmcgYXMgd2VsbC4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiByZXQ7DQo+ID4gICAgICAgICB9DQo+ID4NCj4gPiAtICAgICAgIHJldHVy
biByY2FyX2ZjcF9lbmFibGUodnNwMS0+ZmNwKTsNCj4gPiArICAgICAgIHJldCA9IHJjYXJfZmNw
X2VuYWJsZSh2c3AxLT5mY3ApOw0KPiA+ICsgICAgICAgaWYgKHJldCA8IDApDQo+ID4gKyAgICAg
ICAgICAgICAgIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KHZzcDEtPnJzdGMpOw0KPiA+ICsNCj4gPiAr
ICAgICAgIHJldHVybiByZXQ7DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IGRldl9wbV9vcHMgdnNwMV9wbV9vcHMgPSB7DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4g
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
Zw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGlu
dXMgVG9ydmFsZHMNCg==
