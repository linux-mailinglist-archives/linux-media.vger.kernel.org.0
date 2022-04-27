Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9725118F4
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 16:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235836AbiD0NRv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 09:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235806AbiD0NRU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 09:17:20 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64711A433B;
        Wed, 27 Apr 2022 06:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6nqdMmj/bLBmzcKrdaw2Pamvv3svlpY3SNB8ogic7pD8fpypJy3MRXKGZ/0mqRtTJomdOKJvRGE1EL/AsgI7jFcY5IusioP0rSpWMJlfXu7DUO+o1iCRbt24Qnosk6glm1oJ2jSO/VHDOhaWnRSCAfGGjIrekzrVxzSsgfx6/v+hsZjkEMaCSObRqSr12MuKdmBKu+aqgDqCnZeR11lOTnsykaoPwCeSx9NmVnZecyO4vxS7H1XFgKyn/hJiEyj54cJxspwfUwCaqeMomGflQX2TL1yOn1ZQzznZbvsoXIVyRo01g0lRE4PZJP+/12Kzlpu+g/iYa7TyCHHcdO8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVTZEylGgQOpBU0TMwkEL5Mmbkuk6W72jTHDZv89Z18=;
 b=eR53SKFcwTr3qE+5npWP968ZozslQFyszZnIaYA8qhBqh6TMcQDL6uFjO0edcXE5pGx3w/8oJnvIO7E1HBxRdplIPLsSZvUE96ucmclIvyCPV6wGxnko+wDcoMl0BjvSZzdp6XZA/DlD6dRNgM4S77ivoP5/9Sn82dLx7A8O6R9/u7tXEQzElUIP+ipx+H6YOroehSekQeOD70hJYcUpB7A+pVQcPYA7kljHhYBbDtKamDewJ8nl47quvJHZOy465gUEzvmQGMF2IxkZS1zmFhORigcda916EfGn1vXXFvWKi/eaNVje5dt0HC+kEg2ZWiojHhT3Hbn5YReqqrHfZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVTZEylGgQOpBU0TMwkEL5Mmbkuk6W72jTHDZv89Z18=;
 b=pxmfwnWP47YKPnD2OS5OaCE74ve9OjBfPFjCK6m3K+S4IYlOOp1Tr1P6b+TZBnOBV2lusGFKaZfKRmE9euP294DICt7zTm5ZRnVCiLy8eA5ZnryR4Mn8bsdGYiZxaRF2G52yer6R/ap8swk5Oz5lBxyjmmReN1UIpbEuYzhKJh0=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OSAPR01MB4116.jpnprd01.prod.outlook.com (2603:1096:604:32::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 13:13:35 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::541f:37c5:2149:bbb4]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::541f:37c5:2149:bbb4%9]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 13:13:35 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v8 3/5] media: renesas: vsp1: Add support for VSP software
 version
Thread-Topic: [PATCH v8 3/5] media: renesas: vsp1: Add support for VSP
 software version
Thread-Index: AQHYVBnYEHBJIAFT1UGp+0xFuCPWLa0Dv8MAgAAIcRA=
Date:   Wed, 27 Apr 2022 13:13:35 +0000
Message-ID: <TYCPR01MB5933049EDC3D9FA185F3672D86FA9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220419181757.63346-1-biju.das.jz@bp.renesas.com>
 <20220419181757.63346-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUXVrZNqeegRXXU-rVgyGMe2AdS_z-jstNapeLCOGpzEQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUXVrZNqeegRXXU-rVgyGMe2AdS_z-jstNapeLCOGpzEQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 640d13ab-7725-428b-ed7e-08da284fbc96
x-ms-traffictypediagnostic: OSAPR01MB4116:EE_
x-microsoft-antispam-prvs: <OSAPR01MB411631F51252721A864DD7D486FA9@OSAPR01MB4116.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Slh8w4q/ow4d//ASGCp5IUENcFWBGmJ73yF1GWcCes0icd1ZC/gA9Odru28UKfrjxhoW6pBv3XjrMKja4TMo6a1tVNhZN7/Lg6Hp2IamNR5HaX3dKsCAWu2jfnCTszhb/WVP0RfQc/LnoxfI3lLGwC0+c/46Hty/ARaVg7HsJHlfsiKKX9PJQNht30VbDsUrhOelHlYyoC3OxS+DgrLbPJHFmNSRNFok4K50fagR2UolasOi7OkoIzwcySNAbiNCux/p+l1YVQGLL7Yx6NfbDXF1UF6FgH9rzetUPDMrZ4vtRK5HciTu2LWB1tpnQJJ7lS3Wnd5hZH+Lej+K6j8RXcYVG4RtWF59PDyatlI3eMftOovdouZn3r3YBpLlmhYnmGUciVbCvcNmUwVyfdFsNtcLOybHIVhzZ63EXkV7oWtpFtGlRtkgzYqE6Dz731r7f4UwSlmD+/8WmDjhvHaQsGMPe4/PfVcY+1LLG3SJcMFlVNcnK1cJCVm30VaGyCgR5apvaG1swDrH1L88mE0JRzK4UDaykaZDD7lxoW38ptAYJjd17iBskLUuwo5XtiTNpLFwYMQa3cty3ShHJYr2IV+SzQwivaRby8SCzVvdbAeMzCHxvCbntHCQU9LgZQ6iocbMdtVH4qojfU/MyYNiJHJZbYLwddgwKLp4gGEi46A5aDmaAU1XSuWtt7PIwG4TyS2LteYxmw8K+1r58tT/yQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(107886003)(66446008)(54906003)(38100700002)(122000001)(5660300002)(38070700005)(55016003)(316002)(33656002)(6916009)(7696005)(8676002)(66476007)(76116006)(4326008)(66556008)(66946007)(86362001)(186003)(26005)(64756008)(83380400001)(53546011)(52536014)(9686003)(508600001)(71200400001)(8936002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlVGdTFVN3JJMWtRbGIyNCtRQmRHc3dON0F5cnZjVFdIQmZqdTVRZ2hQMnd5?=
 =?utf-8?B?blZTK1FpQ1BaVS95aFNMS3hxZ2FoUjdyd3JqaDhVZG1vQkxFaUwvdGRTeDcw?=
 =?utf-8?B?OWxlVkVqTW1YTnZzNXhZWjVYejdLVjFNUENsdHRDZ1FFNHMzNVVHYnQ0U3F2?=
 =?utf-8?B?V2N0L0ZudjhnTi9KbUl2OUNydnd5b09iMVZpZy91QXVBNHZvN3pYdWFxM1Fj?=
 =?utf-8?B?SGlTUlBVcVQzZllYby9yZHJERmFKcjhwVjFuZkNzbVpGZDU0czgwOGRFMXRl?=
 =?utf-8?B?VUpVQ3BiRHk2ekt0TitCcEhpa0JmQnhJdG9oSm53c2xpanBTckc5c2R1NGto?=
 =?utf-8?B?dmFwa0VMVzJ2bkRFZ3RZSUJKWk1IYWdid3BCZFlZMDBZbTQxYlNoSitDNTFm?=
 =?utf-8?B?dytwOCsvbkZSdGYzSVdBbllIdVJTM0FIM2ZXQVR5WExIR3BsckxwTmlzUzFP?=
 =?utf-8?B?SzZYZnNINUlWZnJjZnNQK0hqOGdoNThYUloveC9vdGh1dnB4QjZWRkpleFZa?=
 =?utf-8?B?S2RrTVZ3Z0k3ZDdpT01jLzJYSkIwR3k5S0huVGtEOVBnVHZTZ2RQZTMxTkU2?=
 =?utf-8?B?K0tkQVBWZWUxeHBtZU5NK09sSDhmcjc0bk42clZUU1cwNFRwQ2Q3ODN3NHVR?=
 =?utf-8?B?SzduVVBzVjJzM2p6RUgwQWNPdkZqbUtHSGZBY3hsVlBmQk1zSjhaWXNyS1U3?=
 =?utf-8?B?WE9WSnFoZTRScWcwNm1Jb1JSY2VEa2VBZUhZV1c0UGVtQzRGY0JZK0VnK0lU?=
 =?utf-8?B?OWpLMk13dklQODJzUSthbWtERldLRlZnTi9SbXNEUEoxd0k3SWlmcTQySjYy?=
 =?utf-8?B?TlZCSEo1WHBreUxzQnNNL1Rac01KUmxXbVBlZ0VLZ0FMRmt5Rk5lRzV3d0s4?=
 =?utf-8?B?Q2tGQklDVVdSOE9RM2RSSEVBZ3pwT1U0eTZVazNQd1hEQnE0dUhuN3QyL0FD?=
 =?utf-8?B?d1Fnek5XVDlsQzBmTUhWQ0liRnJkSmR4NG9JdUxRWnh4bGd6M1BzVlFPNHNP?=
 =?utf-8?B?cXdqdWFZandJY01kT3p0bk9rbjBwNmkyL3RMMHpma1d1aUZ6d3EvampXMWdB?=
 =?utf-8?B?SGdGWndTU2tvSUxJdXB1NG50clNDYTJLUmI0ei8vZ0h4NlFTNlpiemxTWlZj?=
 =?utf-8?B?aXFYQUR1bTA0VVhIekpXeDdTbVNkOWVHMVhBSHV5UVExZTBONlJPTWtpZGhv?=
 =?utf-8?B?MUhURjRxdVl5YnZiN0l1Q0VKRGhtdDBnWm5neGhGc0FGRGxxNVIwTTBrTlpN?=
 =?utf-8?B?Ty9oTGt3aDljSjFsak5uZmEycXhQWGR5UTNJeUpXbDh5aUE1WittWm9FdlBK?=
 =?utf-8?B?bHU2Y0MxdVRiUFo0cW5xdFRDVTJOUzZSZkpNa1pOUXNOalVndXBLZ1lhZ3JY?=
 =?utf-8?B?Vi81WDdpQk1tbEU4K3o0NVRaSG5SSUtXOStmajBDTzVnRDdkbnZmd2FRT1J0?=
 =?utf-8?B?N2Ixc2g3TzBXNWdMdDdSQ3pwZHFONTlOZW1QZ2JRVkUySWxIYktkMkpXcFpv?=
 =?utf-8?B?ekxEQy9ubzg2S3BGcU9iZUZmODMxU2JDTG0vMVh6dHVtbmp6RTgxaXZTaEpR?=
 =?utf-8?B?OElEekVIUjJxeklwTjFBY1RpQUVkWFEzSlZBV1c5clZCNGVvWjBFN0k0bkVT?=
 =?utf-8?B?VnN2K1A0WXZLMDRJN3Rod1Q4WUFKSmUvUXgzSmpVbHREZytMSDZkQXFmWHhz?=
 =?utf-8?B?U2JFV05JV1pRcW5zV1V0T0tNdVdiQ3BnSG12bW9nUjBobWl2YlIxMEk4MDRm?=
 =?utf-8?B?dXdycUJaQjRyNHBYV3owZnplYWhNV2FJeDNGOUJnWDhJV1ZvYmpzcHFRTEtE?=
 =?utf-8?B?ejI5aEI2SlhHRDlNSW5LVTB3aFpCdDF4d3l5S25sczNVRTUzUXFjRjFwZTlY?=
 =?utf-8?B?VVQ1aWtPbyttcVFOMGlEdTJaclVXUnpvd1oxQXJ0ZnpPYXA0M3lRUnZjREtZ?=
 =?utf-8?B?dEZpOHJ6K3RuRzl2eEVxOXpiWUlxWnowbE5XV3FzUDNPRGFTWFh6cmlSRXRO?=
 =?utf-8?B?YmNTd2FPRzVqd0JlbXdKR2VNeDZjVytkM29VeTBuZ3NScGJ5czNCSDE4QXNL?=
 =?utf-8?B?NlJ1czBWMWNxWTZyQkdVbkZUWmhYY05VSXd2NEs2aU15Wkt0cm9qRklPUXB0?=
 =?utf-8?B?K2o0bjhDT2J5TzdlNHRiUHljY2FZVjhjRzZLblcwbTBhMTJlaDM3ZXNsV3N0?=
 =?utf-8?B?MWphTUhFSXVMMlR3Vm9wOTFjdzBiWnhqd0FrVzZpT0M3eDhXa0c0MTdjVmhy?=
 =?utf-8?B?YWFFN3pQSXd0SXpkZFBZVGc3elRZSjgrdkFBMTJRSWVsN3gyVGorNUd3T3Rz?=
 =?utf-8?B?aENwNGd2RXFtVGJ4NUlKYm9ldmxVVVQ2aEg3ZkNIWVA1T0dIaU1XWXN4bHB1?=
 =?utf-8?Q?pyDrNxJDMS9fDWno=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 640d13ab-7725-428b-ed7e-08da284fbc96
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 13:13:35.7569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7yLgvK4/gw4fFjHSOFMTT4ho/hz9X7QyN9XWI1h3fRUmwXFUc6G8okpZW24st0ITUSxMX/+qgTXZzKkb1DLUs1mAz/HyE/xAvsnx3zCdbKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4116
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjggMy81XSBtZWRpYTogcmVuZXNhczogdnNwMTogQWRkIHN1cHBvcnQgZm9yIFZTUA0K
PiBzb2Z0d2FyZSB2ZXJzaW9uDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBBcHIgMTks
IDIwMjIgYXQgODoxOCBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
IHdyb3RlOg0KPiA+IFRoZSBWU1BEIGJsb2NrIG9uIFJaL0cyTCBkb2VzIG5vdCBoYXZlIGEgdmVy
c2lvbiByZWdpc3Rlci4NCg0KV2lsbCB1cGRhdGUgUlovRzJMLT5SWi9HMkwgU29Dcw0KDQo+ID4N
Cj4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgYWRkaW5nIFZTUCBzb2Z0d2FyZSB2ZXJz
aW9uIGJhc2VkIG9uDQo+ID4gZGV2aWNlIG1hdGNoLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHY4Og0K
PiA+ICAqIE5ldyBwYXRjaA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAt
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvdnNwMS92c3AxX2Rydi5jDQo+ID4g
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3ZzcDEvdnNwMV9kcnYuYw0KPiA+
IEBAIC04MTIsMTEgKzgxMiw0MyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZzcDFfZGV2aWNlX2lu
Zm8NCj4gdnNwMV9kZXZpY2VfaW5mb3NbXSA9IHsNCj4gPiAgICAgICAgIH0sDQo+ID4gIH07DQo+
ID4NCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCB2c3AxX2RldmljZV9pbmZvICp2c3AxX2xvb2t1
cF9pbmZvKHN0cnVjdA0KPiA+ICt2c3AxX2RldmljZSAqdnNwMSkgew0KPiA+ICsgICAgICAgY29u
c3Qgc3RydWN0IHZzcDFfZGV2aWNlX2luZm8gKmluZm87DQo+ID4gKyAgICAgICB1bnNpZ25lZCBp
bnQgaTsNCj4gPiArDQo+ID4gKyAgICAgICAvKg0KPiA+ICsgICAgICAgICogVHJ5IHRoZSBpbmZv
IHN0b3JlZCBpbiBtYXRjaCBkYXRhIGZpcnN0IGZvciBkZXZpY2VzIHRoYXQNCj4gZG9uJ3QgaGF2
ZQ0KPiA+ICsgICAgICAgICogYSB2ZXJzaW9uIHJlZ2lzdGVyLg0KPiA+ICsgICAgICAgICovDQo+
ID4gKyAgICAgICBpbmZvID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKHZzcDEtPmRldik7DQo+
ID4gKyAgICAgICBpZiAoaW5mbykgew0KPiA+ICsgICAgICAgICAgICAgICB2c3AxLT52ZXJzaW9u
ID0gVkk2X0lQX1ZFUlNJT05fVlNQX1NXIHwgaW5mby0+dmVyc2lvbiB8DQo+IGluZm8tPnNvYzsN
Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGluZm87DQo+ID4gKyAgICAgICB9DQo+ID4gKw0K
PiA+ICsgICAgICAgdnNwMS0+dmVyc2lvbiA9IHZzcDFfcmVhZCh2c3AxLCBWSTZfSVBfVkVSU0lP
Tik7DQo+ID4gKw0KPiA+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUodnNwMV9k
ZXZpY2VfaW5mb3MpOyArK2kpIHsNCj4gPiArICAgICAgICAgICAgICAgaW5mbyA9ICZ2c3AxX2Rl
dmljZV9pbmZvc1tpXTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgIGlmICgodnNwMS0+dmVy
c2lvbiAmIFZJNl9JUF9WRVJTSU9OX01PREVMX01BU0spID09IGluZm8tDQo+ID52ZXJzaW9uKQ0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiANCj4gcmV0dXJuIGluZm8/IC4u
Lg0KDQpPSy4NCg0KPiANCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICBpZiAoaSA9
PSBBUlJBWV9TSVpFKHZzcDFfZGV2aWNlX2luZm9zKSkgew0KPiANCj4gLi4uIHNvIHRoaXMgY2hl
Y2sgaXMgbm8gbG9uZ2VyIG5lZWRlZC4NCg0KT0suIFdpbGwgZml4IHRoaXMgaW4gbmV4dCB2ZXJz
aW9uLg0KDQpDaGVlcnMsDQpCaWp1DQo+IA0KPiA+ICsgICAgICAgICAgICAgICBkZXZfZXJyKHZz
cDEtPmRldiwgInVuc3VwcG9ydGVkIElQIHZlcnNpb24gMHglMDh4XG4iLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHZzcDEtPnZlcnNpb24pOw0KPiA+ICsgICAgICAgICAgICAgICByZXR1
cm4gTlVMTDsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gaW5mbzsN
Cj4gPiArfQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhr
Lm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRo
YXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMN
Cg==
