Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 681CE59F5B4
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 10:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236222AbiHXIuN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 04:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236054AbiHXItr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 04:49:47 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2125.outbound.protection.outlook.com [40.107.113.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437D6786EB;
        Wed, 24 Aug 2022 01:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQB5+SH92lB98iwPK90N0d0/9amHewXJuTbf45tZS6S/Up91rbdr1lKT/peR69Giiea7zlW/QG4FCm/Oe536GmcNgsBgBM1+BWTCanjzh4X+SZrsSJIkZ3wBqewdOYcQhRBMI9tPB+TIaU/XnsK8kE4837h7TIfilW83LxY+MrQmdT8wi2L+IA7jhnI/7sCK5D9+QfMKJZCi2SFZbg8klYm1JqZCn/Ylc4WvKDyGTjY/EKmDRd2nFvG1uSf7VpsGvuXhwnwI63QgvkFAFsA/puzJ0AJqxMxDW2Wjsmr4ikRUEfeDaRP2gwxk6+9uHFfCZTeqs3lXqGk7iOCJOts4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aURiPN/xgCmLsKl5oLmmvncltZF57UUw5j0fzeergRk=;
 b=TmsLnRSWA8R29/LYTAUOV2+ET64xbuCcuPF2JJ23qFyp4F3altAZJWsEIQVx+z1obYR4GlUmYQDRnmM1QUoqLHXX8N8QxxfSzdKp3bksQALjwOs858Zd+sEf05RMaUqtO/TIPkkGCQDeL8PUhKDRHubWUMrOqUm4XaWhvzJM/+nDBjMmDUmwbYjw2g9F2KIAyJ4QJkIWmVDDFhMKOUcFQ1yAHkiuA3ZsLndgnnbSi1J6DVXd4lABAVctHMJMg5cJ/94OUASbra1nMajfm6ith+EiHkgyAo32LfXlu2CD4DnQl7p7YjeogWaaUBtSkHl0v2arKCUgpYEj+RVzDy6Ntg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aURiPN/xgCmLsKl5oLmmvncltZF57UUw5j0fzeergRk=;
 b=ERktt2/h8GIzD/w1MEPJDtQGcUSePvsHwhP0PUf5ArDr9lYiWCR0A2slrzyRnhkP3Ea0/fDFHLY6GYBm/bTIA3czIXhD3M1aw0kIgOlGiqkb0PwmIiarilXcF3xRZDHZ1ybEImoC8ZoZ3kVYxPv+UXyWLO7JlL1zbotYKmEkB6o=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB7527.jpnprd01.prod.outlook.com (2603:1096:604:14d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 24 Aug
 2022 08:49:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%3]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 08:49:38 +0000
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
Subject: RE: [PATCH v12 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Topic: [PATCH v12 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Index: AQHYner/IaeevbAdTE+5wP1XgI2qHa20gzoAgAltncA=
Date:   Wed, 24 Aug 2022 08:49:38 +0000
Message-ID: <OS0PR01MB5922A5AC43B2F67B368840DF86739@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220722164907.16587-1-biju.das.jz@bp.renesas.com>
 <20220722164907.16587-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdXNNqgc=JU=UdnFRGRTCp484wjOqFc6M6J4Oq=-91Xbxw@mail.gmail.com>
In-Reply-To: <CAMuHMdXNNqgc=JU=UdnFRGRTCp484wjOqFc6M6J4Oq=-91Xbxw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7740564-ccd9-4262-0005-08da85ad9416
x-ms-traffictypediagnostic: OS3PR01MB7527:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EY3s8boyem56gJD3erLGYI0SeF4Q8jUSlMIJaDiEyE4BvzSK4jNLTLVqVtWsqJr1Fze9Nd9EomS8TyZIAP7ovzyPbTVYEP00T7kICC0SGu/ouH63rnZgczifqUsAS72f0kkct5n0t8zzCoSaCe807I5qHRTEqIn8olhvSxcfPQ7Q7IPK97EG4XqtddVw56H84ZZnoWk6FI9MV2k+9AaKzPEPWAzBQlJ89lQ7ulMaEVHTOb4xbS4HEivyd4hgILAYQ/4QpXPKCuafd9ydgh+S2z/rubkNv4tjKBVvZYBwBAXL0Dr1sdOlZ9gtYwTu9zujeHm3aDy+ev8YNk4kCbq8tazApiqvcRvKoVOlWpxHonr+9UFxias/Pgcimbse/prz7WwL2emBvYIipTg0WrZ1WDKWB8mkhyIBQo6AOjmjWdtY55x/5Gr6XrQFINPSndLsxqXXhhR8AsZC0DW9l+D6WVjCeUYY/aeiQc6GFK4Y8UfIfr+UQnorTS1kG6G8FJ4skOqs/hFvKuxGAvOsZuTfE0sm1vLQk7vmuJSMAkRwRazKCBRtpFBHhLOnV/1BTqyEoTmipuW7wkbucT+WiZtEbtUYsbK28dE6SQL/wmTHzEzQku6i+7Z9MMaZIZjaiXDmNnzW3mRWXkwx/EDVGvnr6MuY6rPhjYH21hBBjECkyny8vmkuLmHk7L1A1s0QBynFAwZQjyhfv9LVwOmTQRax/SUGh7gUaeeMy9tx7xVcoV9YsqTjq55O6COk4g0clftFdjrr0lmJooDEuWmyBe/mKw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(66556008)(316002)(54906003)(55016003)(86362001)(8676002)(4326008)(64756008)(38100700002)(66446008)(66476007)(186003)(66946007)(76116006)(6916009)(41300700001)(6506007)(53546011)(7696005)(26005)(9686003)(38070700005)(107886003)(478600001)(71200400001)(8936002)(122000001)(52536014)(2906002)(33656002)(5660300002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WStjOGp1Zjg1K1JUbjhkL3R1aU9sNTBnR2Y4SWR1akdBSmNwUnRvOFFYbEow?=
 =?utf-8?B?L0liSnlXRWRPMkZMa1NkNnJQdm1ZdGphUW9NbGgyc3daOGl3Mk54eXh3Z1N4?=
 =?utf-8?B?eWNQeGlDalQzV0IvczgvRCt2MlhqdDlYTGlEMU52UEcrNFBSMEF3b2hobEhB?=
 =?utf-8?B?NGVpdUw4Qk5Menk0aXJ2NDZWMnUwTDRac3p5Z3B6U2dhVHBEemcvNHBGZ3pM?=
 =?utf-8?B?T01KSUxVeDZJd3FHalBJMFNreHBCRnZ6Vnhoak9ubHA2L1RIZEJOVTVkWFVn?=
 =?utf-8?B?V0h1N1IzSjVxUC9lWFlNSmRBME9GS0xGRzlGYXFkNGJ6OWdUYWJ3Qms3N0RT?=
 =?utf-8?B?ZWdmajdvMEdwOVdUUmVBTUd0MXIrSUtIMzlTOWI1ZUVhSHR4TG9YTjF6UjFX?=
 =?utf-8?B?aDcxWWdWQkd1bjk4b0NLVEMzQzdvODFoRitRQmM3Y0Yzc0FQREM1eTNua0lM?=
 =?utf-8?B?aGNFU21hSlU5Z2lUNW1YUFpRNXRFTG16TkZFakE1YWdibzZVZkFibUdzTzMw?=
 =?utf-8?B?bkJCQk5NQW9vdWNNZVRHbFZYSXUyRDJZWjkyN3piNVc1NHJQaURCellBS1JP?=
 =?utf-8?B?ZXlxMS9RN3U0U2w1Qnp6R1B6azU3UFl3SEVOWDVncEFQSVlGZHQ0cU5HcWZX?=
 =?utf-8?B?UUtER3FGMW9sOHNQTUpvSGg1dHN4cnp3Y3RjVXUwd0tFVG5ORXowVHl6NVZ6?=
 =?utf-8?B?Y0YrbkoyQ2JVdGp0cFNuMmJFUnAzTGJZOWVaVW1OOStjcHVwdzhURW5QenVG?=
 =?utf-8?B?LzBiU3p3eDRZTko3R3dubERaZVRUeWRLSmN1RWkrRVdySGpvN2FmQU9pcFlR?=
 =?utf-8?B?M2lPQmpsMGM2bWhseXZSY25HMWVwcWt4cEtkdDRLcExWUjBIMnZEWmtqYW5t?=
 =?utf-8?B?a1VZUWVCSUJhYm01NEFEZ05JemFyQUdpQzk0d25oY28wV213dC90clhNUUxR?=
 =?utf-8?B?OEQyNm9VTExwSFRtRUJnRU1ZTjIyRFJLYUxmcWpJUFhWaHR6dEloRXpsSmF3?=
 =?utf-8?B?ajZPUGg5Ny9JNzZvZ2Rua1ptSHdsRU9obzVOakNNNDJhMC9jUGJTaDBvd2Ux?=
 =?utf-8?B?UEFKWkh0ak11TFM3VFRHRkYwQWV1Rjc3OUY5Wmo3bkk1cGtsbjJ6NjFyUVdS?=
 =?utf-8?B?N3poQzFjempHdVhXVkFBMDhDNnExdnBOcHowM1lWV0M5OTMyUHErR3JRdHc2?=
 =?utf-8?B?QzVPU1Z6Wk9wb3MwSGtwOTdrQWpYMDRZL0FGSVAxZVJsSTBzNUJicTBzQUk0?=
 =?utf-8?B?QVNBWmc0U0p3WjJ6UDRJRGtvMGVJYks0S3RCM3RMejUvRGpwRER1a0ZnRjU0?=
 =?utf-8?B?Z2NJb1ZBYUdQWnJETmdzV0NCSENtWFdLZi8xSi9BSWtMOUthc3BaclVLL25r?=
 =?utf-8?B?ZEhUU0MvcVk3bEh4V3AwVCtTTmpoQ3RzLzFvMVJ0VUpLUDloTkYwbzBydGc1?=
 =?utf-8?B?L2VZUm15NVgzVnZ5QVlHRXlvUmRHM0FHWUZlUmZRaGUwRDFrSDYralp5MkUz?=
 =?utf-8?B?N2NVT2haVzNGc3VPem1zeTF5czdpcmowSlhtUm9YMUtlQm02aVE1K3ZyMDVE?=
 =?utf-8?B?QVllY29ZaGV0MDdwZU9OZEx3WWZlQ0lNRnl4TjQ2d3RqTGhQK1MwTFdKTkhD?=
 =?utf-8?B?QUdabE1TbmluQVJDUmROc0U5ZWhPallPYitJYXRUTlBlRnFkOGdUVGluTkJ1?=
 =?utf-8?B?M2dBQk5lODlaOUM1QVRPTjFwZnNFM3NmK2I4QThhQWpJQWFDU1NDTXJlVUxy?=
 =?utf-8?B?QkxXaVc1RHVrWWdhWnBBZVcyMXBjNmN5L2o2c2dJRkEvSndIb01LS2VmbVdT?=
 =?utf-8?B?dnlYV0JFcDAvZytnbkJUeG5XN2NwbXMwL1NzV2tQb0l6UlUzUGdwQjNXWVla?=
 =?utf-8?B?dUxRUmRIQmtLT2hJWklzK28rQVlkRDBwVy9hVzh4cy9aYzdUNXFoOHQ3TG1v?=
 =?utf-8?B?c1FPRUZxbFVUd3REaldjZlMwUWhrL2tYbGU0cDg2MVJEZDlDNEFLUEtXVFBX?=
 =?utf-8?B?ajBGR0UrVS9vVExIRVVQdHo4eDZOVWxVK0lsMGVEWE9ZNGROei95bTllaG5J?=
 =?utf-8?B?OVE4YTh3Um1USVE0dVAyY3V2Nmpaa3NQckRCK0hDU0JLZHU5NFF6cWNabXFa?=
 =?utf-8?B?dDc4d1UxSFlrbkMydzd0d3hTTk5UN0ZldThxOUcxcHk3MVhLaE85WmNtQ2ZC?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7740564-ccd9-4262-0005-08da85ad9416
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 08:49:38.6340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R90igrpsQpjRPNklQjACoDipVcCbXhrhv8JNP2vT1Mm+EhPfMtyQAMmBOiy+VWsSkUbh7cMNMcnhJTe5DbsEGArrMlpj06hXH92J1k6nNp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7527
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjEyIDIvNV0gbWVkaWE6IHJlbmVzYXM6IHZzcDE6IEFkZCBzdXBwb3J0IHRvDQo+IGRl
YXNzZXJ0L2Fzc2VydCByZXNldCBsaW5lDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gRnJpLCBK
dWwgMjIsIDIwMjIgYXQgNjo0OSBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+IHdyb3RlOg0KPiA+IEFzIHRoZSByZXNldHMgRFQgcHJvcGVydHkgaXMgbWFuZGF0b3J5
LCBhbmQgaXMgcHJlc2VudCBpbiBhbGwgLmR0c2kgaW4NCj4gPiBtYWlubGluZSwgYWRkIHN1cHBv
cnQgdG8gcGVyZm9ybSBkZWFzc2VydC9hc3NlcnQgdXNpbmcgcmVmZXJlbmNlDQo+ID4gY291bnRl
ZCByZXNldCBoYW5kbGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHBy
YWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2MTEt
PnYxMjoNCj4gPiAgKiBSZXBsYWNlZCByZWFkX3BvbGxfdGltZW91dF9hdG9taWMtPiB1ZGVsYXko
MSkgYXMgdGVzdGluZyBvbiBSWi9HMU4NCj4gPiAgICBzaG93cyB0aGlzIGRlbGF5IGlzIHN1ZmZp
Y2llbnQgdG8gYXZvaWQgbG9jay11cC4NCj4gPiAgKiBSZW1vdmVkIFJiIHRhZ3MuDQo+IA0KPiBU
aGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vcmVuZXNhcy92c3AxL3ZzcDFfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL3JlbmVzYXMvdnNwMS92c3AxX2Rydi5jDQo+ID4gQEAgLTExLDExICsxMSwxMyBAQA0KPiA+
ICAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5o
Pg0KPiA+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51
eC9pb3BvbGwuaD4NCj4gDQo+IFRoaXMgaXMgbm8gbG9uZ2VyIG5lZWRlZC4NCg0KT29wcywgZml4
IGl0IGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICAjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+ICAjaW5j
bHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9k
ZXZpY2UuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPiArI2luY2x1
ZGUgPGxpbnV4L3Jlc2V0Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC92aWRlb2RldjIuaD4NCj4g
Pg0KPiA+ICAjaW5jbHVkZSA8bWVkaWEvcmNhci1mY3AuaD4NCj4gDQo+IFRoZSByZXN0IExHVE0s
IHNvIHdpdGggdGhlIGFib3ZlIGZpeGVkOg0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9
cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3
aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVu
IEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNv
bWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMNCg==
