Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB4AB5071DA
	for <lists+linux-media@lfdr.de>; Tue, 19 Apr 2022 17:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352531AbiDSPei (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Apr 2022 11:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235154AbiDSPeg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Apr 2022 11:34:36 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2104.outbound.protection.outlook.com [40.107.114.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D503017E25;
        Tue, 19 Apr 2022 08:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hv0mZ2VEEbSgsGlQkNPPR635gHpDobewIXvKrP+LWV383nKsbAxkpZ7OrqFAIyfN+HVQheQsTUFv0LESNQk3ehDh/HIGrpnncRQv1vuB6YRmLTAP2EQEC33DNJGd73fjzz1DUQhBZfi1LcL8hUjC/DAJMnYAHP0HEXR4kPkzqjFg7Ff35DFhlrtnF/Y1JxZyUPDKcow5mjjV2GzhKfHIgXYhy69QFTam6+PZBEkZPS3vGZYeVHh+a/gcvuqGJ1y389cJP9uFIH9IRL/vd2XyaH3mcPXPaY35RC8WZCkEjBH4KAmffQ/rpU3GZi6JZFkrXEgIvdXOITLWiUJ+Secu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XdgZpzleoyQQZgb3s8ZfOGl7IA73hIPpcH/agqJlRw=;
 b=i0WA6mLG85tKbs8OFarp5m6jsgbkXGSy689OQHhyb4wQjPd6M0gMMaP1lDXuLh99CFtpumZLjPiE4g9O9Qgua4aLLbHWL8+3dBaviJUfdYk7Pf5dhrtcjHzFM3B0WDlX+emW08AsD1tC8HL/ff3O1222G5yvkbAyef3Q9vrZiy1T2sFKg5Gy78lLQ53cJHGxV9rphLonKt7SGwRVAD5d9rmDZA5o7OxR0P4lbmXwRRYWHDh28RtRGBC2Jvd4UKcDsCvGHe6FYX63d3e9FrMcvGqeuhclqg+OlDw//dR1bebK5Fk2XJXbSlHANDDirZmZekpzYDAojy0/qVJZFlXobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XdgZpzleoyQQZgb3s8ZfOGl7IA73hIPpcH/agqJlRw=;
 b=gsWBoS8FqD9DkdX5llkd0291Y/iBXEKM7d16ICj3fQq+dSrql91ERhgWgmsZd1BXvangBOj8OantffgDjKyLiG2ijfgsITgu9Z4UMMoVcVySHHlzN5RTbqpVRvCUXpjOyC1WpRAnpFOgkGJMhNqcdjKzwAWn6o/UQGRFsmHi+IQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB7503.jpnprd01.prod.outlook.com (2603:1096:604:14e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 15:31:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 15:31:50 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: RE: [PATCH v7 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Thread-Topic: [PATCH v7 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Thread-Index: AQHYUAubtCG5Dt2t90GJ+fB9Qxz61az3XdOAgAAG1uA=
Date:   Tue, 19 Apr 2022 15:31:50 +0000
Message-ID: <OS0PR01MB592223E96DC0021EF20498B886F29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220414142605.26235-1-biju.das.jz@bp.renesas.com>
 <20220414142605.26235-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdVR4ONpLwPc59erG1adGQAn0iU4y_vH+4nYob-712pneQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVR4ONpLwPc59erG1adGQAn0iU4y_vH+4nYob-712pneQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a920913b-b620-4dd3-22e0-08da2219b958
x-ms-traffictypediagnostic: OS3PR01MB7503:EE_
x-microsoft-antispam-prvs: <OS3PR01MB7503DCC43BD934D156CB4CEE86F29@OS3PR01MB7503.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WQ1n2pLbpdRGvmIKBQqu9yO582kI0MaPIQYTMQcmYE1/hWd2Ia6tvk0CoxtrGmVsJYZ53yRdmADOr7zS2XmHmHQVPDVqIaUudn2fKpVfDMvX5MboZs9deVWzDYwEM4vmk6QlS1A0Fp+zujq0F9rAA7b9w1q1VzrCGW/z28YDMBhPW1xeAyzrBK+TBvTxTvXaEqR20DMXIE2AixWpBF0r2KJZtcRbxlMRyt0B/15WzlvMPeAvbOVgRsl9duZymP+7F8ZMOADqB3Ta177TlumwIR+hle+kNrcr0AE5za0a1KLrGHhsO4HAY1Cp8271dMhS14Z1IiPrnM4D2o2MWe58Xq8JxzvN5YbaTyywn5yihtzxG+MmoPyEhWj4GJllA1Hf0IZBUbtBh2D3oBf7XRLZnlf/EgCLGGkd4HcCgqYFGCLvjstwrEGszNhSMQsBsANijYQjBdQuTQ8R7afBOlG4BkgZk0oLgIIdqWCXksmEYuD8jPkKYOIAtCtTFglq9TEYWV8w04B8FRj6P0WHr3MdFF+/H460E4LpgmffvkO8H5VlXzjW8qCQTnwsPucamTGKBxcT3Q3r6aI29iB40MKRDy0+tjoHlX0ScyUE6wYzWX/LnD07GTp5bKkuL48IM/HuYibp87ppme8GXa0xgisvu757LsiAbD8KfiStT4oZ90yxfKXSQXCM63v0EyTdg0KVgh/TyG6qxbEv4cbp8ktOiA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(26005)(9686003)(186003)(5660300002)(83380400001)(122000001)(38100700002)(8676002)(66946007)(55016003)(33656002)(54906003)(7696005)(71200400001)(2906002)(52536014)(6506007)(8936002)(66476007)(76116006)(508600001)(4326008)(316002)(38070700005)(86362001)(66446008)(64756008)(66556008)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHRZemo4UGI3WTRuRy9PcGJMYkEwNmR5dWQxRVZWSFB2eERnY0oyRnFZTVln?=
 =?utf-8?B?K1Blc0VWUkU3cVpkREJmSHBGL2xyUDBkd0xhMWVKaWkreXdNdTIyYzZDWDk3?=
 =?utf-8?B?MzU5UVMzM0UzM3gvNE9QRG5mQzc0eVExbVdzR0hsa2dNdlRZY1ZuV2lua04x?=
 =?utf-8?B?bzVmZVVaeXIwdWpNNm9JWkV6SkhSbGxyQURjLzNEZXliZ2wvOWxyV25Xejdu?=
 =?utf-8?B?Ylc3TzZ3aVRqR1JUWlRDMFMvWm1xWDlwNldaKy9oeUVwQy9raFVjeWlmalc1?=
 =?utf-8?B?aVQ2c0tSMjh1R0lMVTRaeFJkSzJxYVpSa2dKY3laa2hpTVcxUmQzYWZOMTVy?=
 =?utf-8?B?SXZrVGkvNm4vV05xbXY2ZnhPb0xFZnpVeG9sckRMM0xaK3NNZ1pUMUswYkov?=
 =?utf-8?B?dFBMOWwvTis1a0k4bjUrcEEwNGNubCtZdTlQL2paUXdvTTBzdnFCOWR4SFV6?=
 =?utf-8?B?NUNRUnV5L0RJdzZQZ1Q0MGM5NTFOdjR3d3VNNERsdS9lT3MvZjFKQlJzNExT?=
 =?utf-8?B?SGlrV3FRVE5teS9TOXYveldUNWdZZUE0R2dJNkhHaW9NQnUyaThDUU1vZWt5?=
 =?utf-8?B?ME5JZUVMQXJ1ZEpHVTRzblpUMTFERmRaYVR6MEc4WldlU1ZpWXo5QkxnWUlq?=
 =?utf-8?B?ZTFuQnhGTG5PeHVOd0NJaytoZ1RHdmgwUkY5ZlFuVlZyZlpmWE5PV24vTVJh?=
 =?utf-8?B?THNJd1VYNWh0Z3puOXJ2c1lJYjFrcWxPclFQMkxjTjFjRXV3eVpnbHRxd0Rk?=
 =?utf-8?B?Y3ZobXZJYzV1SW5ZR3NkL1NrM0oxb01vL05BNUhvRWYvTzV1aThMdHVHdjZN?=
 =?utf-8?B?RVduQkgrTlBTdk5OZWplejUvTnBUUTlDT0c4VjdKejNRZC81R1hIcVJwVC9P?=
 =?utf-8?B?UlF0MVZ6Zktwamt5SGh0VHcwZm52eTlKWHhRZlphYWdxUkFBZEgwOGpMSHhH?=
 =?utf-8?B?SHYrY2VHTWt5QXlmdDMwL2xnUTBMcDNFOXdWODk1bElsWTJtUThhV2xxeTZ2?=
 =?utf-8?B?WGErZ1Vma3FhdU5aajVmZmtKOU4vYTY3QW95KzU4K0xQVU5FWm9kZ1Q4WllR?=
 =?utf-8?B?WnhwVWNwd0RFd05WV0hYS0NJM0g1cS9leGtybk8vYVB5TWNueVV6UUZBaUxO?=
 =?utf-8?B?RXcwUUFRWWlmOXZ2Um5YMUdGVCsvcDZvMlR0ZC9WeDVBU1Y5QnN2SGY3U3My?=
 =?utf-8?B?Z0xCaEU2L3A3K2d2QTBnejMzSUY4dFBXN3VWT1U1MW5hWjA1TWNsR3ArR0po?=
 =?utf-8?B?NVV2UVBhWWNHQm94Ym1jYmZYQ3dvdXlPNVJLK0RPMU1seXBkek9jeUhpaWJu?=
 =?utf-8?B?ay9NU29hZ1RZZjN0YkNvYnBzbWcvUWtaTERmUVV5MHRXSEord0MvL2RYSDdY?=
 =?utf-8?B?Q1dKSXhETXJrZm5RUUJyZmk1cDBBMkxicDRFZnRIdll4VC9lV3NveGdkaTdu?=
 =?utf-8?B?UUQ1OXAvVWVXVVdsVmxacXo5Y0o1RE5oRlNmdVNJeUJ6SFJIejQrUFZyWExs?=
 =?utf-8?B?OHZCU3FhRnFIa0drRWpLcjZXSFFFM0krNzhRTExSelNGalRpRmF5R1pzMGRz?=
 =?utf-8?B?NmhsQmtZVnlMZTFvd1FacnBnZHJkMmc1aVZqUzdWRUdrVGZjSmlrVVliVG9X?=
 =?utf-8?B?RmE0WlhXRFdzaUE3UDFLQkEvWFFzcGdTVlprYm9YT0tnTDBST1hOMjBtRFF3?=
 =?utf-8?B?ZWFKU3J0QzJ3S1RWL2d5bHMybTl4K3JFQkduOE1hcGdpRjdab09CaWk5ekhv?=
 =?utf-8?B?VGdETHZFNTBkbFM1NmFnU0p3a1dKSEhQN3F1QkFEeWhuWG4xZ1RiSXdVbWlr?=
 =?utf-8?B?UVh1S01iMWxnblZMUDdRbkxaUGFvcWVwSnJ6UnNydWJTQ003ci9BT2UrSjV0?=
 =?utf-8?B?bFNpMk5HazIxYjAvbWdTUVgzUHRwenR0V3R4MlZxMysrc0F2QThkOVdNdVdT?=
 =?utf-8?B?bk9NaXBHSUxDQ1NWVlJFQ0dwak5nVnExeExCUlVDY09sVkdxTjBudzArZk1l?=
 =?utf-8?B?YUVMa1lBL0l0TUI3ck9kb3owUHhQUU9ac0tUT1ZvV3hBVU8zbG41M05EaWZP?=
 =?utf-8?B?ZUtzR1d4dGhxYmxTN0x6T3ViekNoQ1JqOHkram5NdXJ4dXQvOEhhcFlMNzJC?=
 =?utf-8?B?OUpLNkN5SGJnaTJZa2RBbm14NFFnYmJGSFJDcy8yTnFUaVlEUmlHMmdHcWlS?=
 =?utf-8?B?OE50ajZQY1cvL1pwWUsxam1pd2trMzJCc1ExV0RuVWtjYmprVXVEWU8rdUtE?=
 =?utf-8?B?ZFVpL0N3cVJ5UEJBU1FpS0NEdHF5L0ZHQlpVa2lXbUlhRXdBaWxDdFJ1TUZl?=
 =?utf-8?B?MDhraGczdnVjeUpNMHBuUDZJbXphaXhsczVxaVI3ekMwbXZRRWUzTFg4UXI5?=
 =?utf-8?Q?kzHKWvr3+HepIkEc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a920913b-b620-4dd3-22e0-08da2219b958
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 15:31:50.4652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iawV3G9prn+DPCZo2/PakXYE2aPpMI3oi5+/I9SAESGJInEtXubLiJK2+IyGNxbQBUmjxqY2qbjYTZNqYvDfIq/GdLo7HUEPYlNYYClf+pI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7503
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
UEFUQ0ggdjcgMS8zXSBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiByZW5lc2FzLHZzcDE6DQo+
IERvY3VtZW50IFJaL3tHMkwsVjJMfSBWU1BEIGJpbmRpbmdzIFRvOiBNYXVybyBDYXJ2YWxobyBD
aGVoYWINCj4gPG1jaGVoYWJAa2VybmVsLm9yZz4sIFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+LCBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5vcmc+DQo+IA0K
PiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBBcHIgMTQsIDIwMjIgYXQgNDoyNiBQTSBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IERvY3VtZW50IFZT
UEQgZm91bmQgaW4gUlovRzJMIGFuZCBSWi9WMkwgZmFtaWx5IFNvQydzLiBWU1BEIGJsb2NrIGlz
DQo+ID4gc2ltaWxhciB0byBWU1AyLUQgZm91bmQgb24gUi1DYXIgU29DJ3MsIGJ1dCBpdCBkb2Vz
IG5vdCBoYXZlIGEgdmVyc2lvbg0KPiA+IHJlZ2lzdGVyIGFuZCBpdCBoYXMgMyBjbG9ja3MgY29t
cGFyZWQgdG8gMSBjbG9jayBvbiB2c3AxIGFuZCB2c3AyLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBp
bnRyb2R1Y2VzIGEgbmV3IGNvbXBhdGlibGUgJ3JlbmVzYXMscnpnMmwtdnNwMicgdG8gaGFuZGxl
DQo+ID4gdGhlc2UgZGlmZmVyZW5jZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFi
aGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZp
ZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmlj
YWwuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvcmVuZXNhcyx2c3AxLnlhbWwNCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvcmVuZXNhcyx2
c3AxLnlhbWwNCj4gPiBAQCAtMTksNiArMTksNyBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgZW51
bToNCj4gPiAgICAgICAgLSByZW5lc2FzLHZzcDEgIyBSLUNhciBHZW4yIGFuZCBSWi9HMQ0KPiA+
ICAgICAgICAtIHJlbmVzYXMsdnNwMiAjIFItQ2FyIEdlbjMgYW5kIFJaL0cyDQo+ID4gKyAgICAg
IC0gcmVuZXNhcyxyemcybC12c3AyICMgUlovRzJMIGFuZCBSWi9WMkwNCj4gDQo+IEdpdmVuIHRo
ZXJlIGlzIG5vIHZlcnNpb24gcmVnaXN0ZXIsIHByb2JhYmx5IHlvdSB3YW50IHRvIGRlZmluZSBT
b0MtDQo+IHNwZWNpZmljIGNvbXBhdGlibGUgdmFsdWVzLg0KDQpZZXMsIHRoYXQgaXMgdGhlIHBs
YW4gd2hpY2ggaXMgaW4gbGluZSB3aXRoIEtpZXJhbidzIHN1Z2dlc3Rpb24uDQoNCkNoZWVycywN
CkJpanUNCg==
