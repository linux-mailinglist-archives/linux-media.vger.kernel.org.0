Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A02784D213B
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 20:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347820AbiCHTTJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 14:19:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346125AbiCHTTI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 14:19:08 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844FC37022;
        Tue,  8 Mar 2022 11:18:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3mw18m3nNmUGRm77sGq2X7L80nMseZJoy3SxdM9qrfvSfx5iZeLljc6sj62M0TUA1V68kgZlHs8xZr8p0Jo2g99C08sEUVfvRBzw+CcSQL8LxDcfGtUyc1OULF4UKUdOSk9sKNP9zvjcmsDNo+JZNtU6BdbBHc9jejFJvy+JAQxaV0vUrZ/Id6aebsXf/2+Pum3Pj4Dfy3VrZF+bSB3zsFDfppihYmTC3PF6K5dW+Sp39jcgSNmcnOFbWC1ibNG4apmxJGFddrO/2QPvm/AV6KiKX+DNmiQCoN5MKpXKVuef1z6FRwOit6W2IlVAXK7Nn9zulf2cfD39D3y5XPZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHYqAwgB2njd0cfCLh9t0W8vYXOCS7Y5Ga5PMjn+5fk=;
 b=hXKLrUB26EbMmhfeJx/bGLpEB6DURg1KtzySSA1IH6lu70upOk9l0q+BTiyt69dgl14DaiRRpwuciYv3Opmt0aAXIWen1gJ14EOkd7QesmZWe9Zp/5MMFoO19nDlbUoAyZ9kw6bxKH5qGMV3fiLpXB31WDK0rB4Hs5RykycXxCo56rfnKO7UN17JmFfIHHhRy32xs6Nk9qVXrU7XWr2+hGY412RtDHuMT8xKtxzUP9OwXab6HIUNE4YpXgorsXNeYHEPBhEfZPOHm2psU3Q9C14Xa5DuZUSrdH+NH/cQI5jZXjccZ+sKGFx2B0SJDNCSnMjfZ5/wZy3ntkzg7wFTLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHYqAwgB2njd0cfCLh9t0W8vYXOCS7Y5Ga5PMjn+5fk=;
 b=mhfqUdE9/zJCkuVR9CP05diqTfdAn3AH+jFQ83CYzqQLMmk3pdmAPcMPZf4U5v2B3MX4HktNTvs11JvqEFpaO53mfFG6VI3tKDuUIamsGAW0L/iPIu9W0LEDj3AjMgIbuTHe5kPgId1umSBC1YhYNtXQLTvPPhjraP8kwtX09IQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9937.jpnprd01.prod.outlook.com (2603:1096:400:225::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Tue, 8 Mar
 2022 19:18:05 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.023; Tue, 8 Mar 2022
 19:18:05 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [RFC 20/28] media: vsp1: Add support for the RZ/G2L VSPD
Thread-Topic: [RFC 20/28] media: vsp1: Add support for the RZ/G2L VSPD
Thread-Index: AQHYB9xvax2zB+OMhkOZ9EZKCG+rzaxv4KOAgADgKeCAASHzgIBETtfA
Date:   Tue, 8 Mar 2022 19:18:05 +0000
Message-ID: <OS0PR01MB59220EE2CBC3208A66F3863A86099@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-21-biju.das.jz@bp.renesas.com>
 <YeyuqbNfETGOxzfZ@pendragon.ideasonboard.com>
 <OS0PR01MB592252F975741BFF56CAFEFE865D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdX1-TNGmH0a6i6DKcsvk2VEeFyOvkyOaq0V5KDR-4kO1Q@mail.gmail.com>
In-Reply-To: <CAMuHMdX1-TNGmH0a6i6DKcsvk2VEeFyOvkyOaq0V5KDR-4kO1Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c05cb24-7791-4c30-5359-08da01385f47
x-ms-traffictypediagnostic: TYWPR01MB9937:EE_
x-microsoft-antispam-prvs: <TYWPR01MB9937164CF1BCEB402343C51386099@TYWPR01MB9937.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jLvX8dM6h6ZEoFZNg7aOxwy8tRal9Nft8DpAAwC5tIzLrRUOizl3Nl8RbB4J6gqlMU3dV8mpqHnKU1d2Z+cg6Ol5msgsvCyY5ja1VdBTZ9PzUpfZoptT0isfVjx4h//uKgqUwE95Zt3RaFg9lH9/jBa6/lKezK+bK5Ad8vvTkFZYVHwh6SvX4pu62+H9+dlXxMHPd1ZxdfpwwAjp3k9ok2UmtmLe/wUzZ15X11QX3OL+jBIJxn3ui81SiGilNwcSW/QKHZ5mqvhEHNNT2T4SK3qHGEqg0cUiex2YkXVhJJMKMI5Yw33Nlzf2gr2ZrE/Fpxx/QGofilzqBJSX+Dua3cTmkaNwv8BPFU7X/V5sHNQXQ70YLQk9PXBbh0U2S+5XQ30aTVrDd1hXLoZ9hmk9FDxpeSqVJyY6zv+9ejPIu+4Jzgksw/4nJGRFjPyd+WzATuF8+F9DjP94EaAhTQpRwNqzIun84urWbYhuogfkjMvqm0QIiIJxg7m+ru31Lv5D03jqVjYt9BaiLXZOAzpxo5tZT/nM94E2lsAVOzf0v1EYgvlql601gV5AeSvR87W0obTuSClPY4Uv5ap5yDQKQWtzGwofzqQq6he07bmtQD0yGn+qfRSCKI6Vu1Qpcvew3ZCmpVfFY+yuCKyuMNX1vymQiKg2SNAtV5QmXuJ3/7n/zbep6gZ+eyz4Mqnn2yG3PLiFLOestPg5VwvyBZUPig==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(52536014)(55016003)(71200400001)(38070700005)(122000001)(8936002)(508600001)(5660300002)(76116006)(66946007)(6506007)(9686003)(83380400001)(7696005)(66556008)(66446008)(64756008)(107886003)(4326008)(86362001)(8676002)(66476007)(26005)(33656002)(186003)(6916009)(53546011)(2906002)(316002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVFrQ09NV1RadkRpNmRjSGJOeTJyZmNia0dhdVRVL1ZUZXZQTzF0ci9pZ2Jp?=
 =?utf-8?B?MVZ6dFVhZzU4R0xTVmZXTGRrbHNCNVExZnc0aUdkM2N1WG9NVVhaaFExWjZZ?=
 =?utf-8?B?R2hIQ091bWtNSnh2U283dWhRYUJCQmszVFZzK2xON2xIN1piYTRUMGZZbENh?=
 =?utf-8?B?VjJxS3FRYUNQSy8zTkZuLzdHSjhxV2U1MUZHTUI2V2p6RzNvR1ZXNWNaTGsz?=
 =?utf-8?B?b1U1enZmTC9LazJnT2VvOElYZHpxVVVuWFNJRVJReUNUWDk0N0o4TUtMRHZ4?=
 =?utf-8?B?SE5hcUVjTi9OM1IxMjE4ZHYvaytGSUx2alpGb08vMTVXL2FnSmZtaVhYaTJo?=
 =?utf-8?B?bEsrQy9sbGVXRUVXOXBzM1VEMGpzTXVrUi9ESWNCVHc0QjZFSVp4dm9BMUlz?=
 =?utf-8?B?V040MTg1YXdNZDFQSGx4OUVCWU1qNTAzbmxNM2Z2Z3QvRFd3eFRlY0tWdzZX?=
 =?utf-8?B?Rmt6eWdhWEJ0VzQydVBYeVgrb0EwRzVtblBiS05RS0JOYit0Q2w1T0FQd0t3?=
 =?utf-8?B?RlVvOTVLaGRZSWQ2bHE4NjRvd0QvK0p5SmlKdXdWdmxGcUh5QzNkZWpvQTdo?=
 =?utf-8?B?cU02RjI4UzVJbHZVVVc3RGNyeEt2SkpKNGJHQkVBZndFSHcwTEVrOWpvcmhD?=
 =?utf-8?B?TEk2U0JpZVdUWmUyMk93K1lOK3BYR0lyaWhkdys3bk1kT3ZGMzJMVXJJVk9M?=
 =?utf-8?B?dVVYYjNzVStOeGdrUWZ3U0VYS3UxTVlKL1dzVmFUc0xyVVZxQ3JhWnc5L1ZT?=
 =?utf-8?B?cy9Jb1RkTWMxaWVERHdlcEFXZWdvZXNXRU5wNEVNSEVndG8rV29JNVJTUTB2?=
 =?utf-8?B?MnUxdEZxNENKRy9FejlKL3hiZ1Y3aUk0OTlYeUhQeTlNVzZTVXE0dEVIdHZa?=
 =?utf-8?B?aXVieW1pbnBrc2NJZkxobnJPS3VJTS9wanpHZXVDamduV1h3NFJsV21jVWw1?=
 =?utf-8?B?aEFsR1pBZ0hrN1ZCUERXandJVzE1NVJoRVNMWkZLZklLRHU5SDlOc3MvcTI3?=
 =?utf-8?B?RFE0Y0dDYXExQnNraGlYVzAwZVBXT2cvQlpYNmtUSm1QN1hyZzh5dSt1VGsw?=
 =?utf-8?B?VGd0UFpVb0s3bWFzK29PSWd6R0s5dFFVNVY3N1AybW0zcXNWTUpIb3IrMjRh?=
 =?utf-8?B?TmZGdG8wNGhQM1ZKWkw1Mkw4dVlMWFBnWENobDloZnJ3S3lVWmZ3cHUrOEoz?=
 =?utf-8?B?MytGdmVtTkZWbGdhQzF6VUhPd2RETkFwblhpTFRGVlhSMk5DRUM4YXdITXht?=
 =?utf-8?B?WVp5R1oyclVVRCs4TGFFUDBjT0lCNnphc1VtZnRVWE8rQjhjMDdIM0NDY25E?=
 =?utf-8?B?Wm1McFBTcGNWaVl1M012UW8wVWdRWDBHb0lsVGJGOE5zeU1CaXFrUHNrL2pV?=
 =?utf-8?B?WlFmS2c0VUlpRUsyWmI2SWpnL3JyK2dqRE1rajE5ZnhMaDBqL3ptQWkxbWVG?=
 =?utf-8?B?TG1jeWtOZ2NxTmVtM2tGcmJKVmd6OUJ2alVEMmlvYmhienJsN1JXd05QS0Mr?=
 =?utf-8?B?WnQvTXNOYkUvclRzSW9mbFA4WERBaEtkVjdsTEtsVzBRWmpSVEpGNzV6aUdV?=
 =?utf-8?B?c2swVzUxMW1hK2xETEcwUXVydWhYQm02T3NjQ1JnMmpkM0ZnL003SWlzM0FZ?=
 =?utf-8?B?NXlTakJIUnBlM3NSQWRlRGZhN0RUb0FIQmFkVGEyV3dPQmNZVTcyY1I4VE1I?=
 =?utf-8?B?VExYQnlXRG1oT3M2VmFNeDFIb1pqclRiejh3U0JtOWk5SXlHK1JrVGF1d1Bq?=
 =?utf-8?B?ZlFDd2txUzAvQUthN2dhZzZKU1JBNUZxOEFTWkd2MWxITjVGdDE0c1pZTTU5?=
 =?utf-8?B?aXViU2hDZ283YnB3Wjc3RHg2ZHVHbDBEYjUrTnhTVHVDdXNuT05NR2czcm1T?=
 =?utf-8?B?TWVkTzh6NTlBQW80MTRoMnNnTitLZTRUcXo2czFXMVhaQVRMNWVyTkZkdU9o?=
 =?utf-8?B?cGhERWJ4VW92bjJQQ2FZVjFoV3JIejgzcmx4ZjRtYXhVTWF6a2Q3MFUyYXE0?=
 =?utf-8?B?aXNCL2p5S0NRSWZWeEdmalowMFE3TmhOc0FJc0JtZ2NCWndXM2tBMG5lQ0h0?=
 =?utf-8?B?N0ZjSTh4WFVJUTQ1QzVIVmtmM1IvTlZ5UU5jcG94QlEwRG5NTWtaNmJDUTJ2?=
 =?utf-8?B?TStFWG1MbnY3aFBpd2FXUk9LdFJhRExyVzArYWRCSjdPZ0QzZ2k3N1lpOFB2?=
 =?utf-8?B?VzFVelN2MkgxSW5VRkRCV0FsTUtyRjFBdVQ3RmN4SDNLczN6bGpLRUJvSWNZ?=
 =?utf-8?B?cnp0TzB2R0FMMEdsczV6VDMveTlBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c05cb24-7791-4c30-5359-08da01385f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 19:18:05.4183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SXcS6/tKyzZXAUKrrr+YPvXHK0LvXSKMQGa7LHuxxpntcCqbfiEVw8NAVk4MLDBK3qtJVcSuwwQeQ+eoPWrYBG7HlD+q2fubRnzB32i4aQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9937
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
UkZDIDIwLzI4XSBtZWRpYTogdnNwMTogQWRkIHN1cHBvcnQgZm9yIHRoZSBSWi9HMkwgVlNQRA0K
PiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFN1biwgSmFuIDIzLCAyMDIyIGF0IDQ6MjAgUE0gQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiA+IE9uIFdl
ZCwgSmFuIDEyLCAyMDIyIGF0IDA1OjQ2OjA0UE0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+
ID4gPiBUaGUgUlovRzJMIFZTUEQgcHJvdmlkZXMgYSBzaW5nbGUgVlNQRCBpbnN0YW5jZS4gaXQg
aGFzIHRoZQ0KPiA+ID4gPiBmb2xsb3dpbmcgc3ViIG1vZHVsZXMgTUFVLCBDVFUsIFJQRiwgRFBS
LCBMVVQsIEJSUywgV1BGIGFuZCBMSUYuDQo+ID4gPiA+DQo+ID4gPiA+IEl0IGRvZXMgbm90IGhh
dmUgdmVyc2lvbiByZWdpc3Rlciwgc28gYWRkZWQgYSBuZXcgY29tcGF0aWJsZQ0KPiA+ID4gPiBz
dHJpbmcgdG8gbWF0Y2ggdG8gZ2V0IHRoZSB2ZXJzaW9uIHZhbHVlLiBBbHNvIHRoZSByZXNldCBp
cyBzaGFyZWQNCj4gPiA+ID4gd2l0aCBEVSBtb2R1bGUuDQo+ID4gPg0KPiA+ID4gRG9lcyBpdCBy
ZWFsbHkgbGFjayB0aGUgdmVyc2lvbiByZWdpc3Rlciwgb3IgaXMgaXQganVzdCBub3QgZG9jdW1l
bnRlZA0KPiA/DQo+ID4gPiBJdCBoYXNuJ3QgYmVlbiBkb2N1bWVudGVkIG9uIGFsbCBSLUNhciB2
YXJpYW50cywgYnV0IGhhcw0KPiA+ID4gY29uc2lzdGVudGx5IGJlZW4gcHJlc2VudC4NCj4gPg0K
PiA+IE5vLCBpdCBpcyBub3QgcHJlc2VudCBvbiBSWi9HMkwuIHRoZSByZWFkIHZhbHVlIG9mIHRo
aXMgcmVnaXN0ZXIgaXMgMHgwLg0KPiANCj4gSnVzdCB0byBiZSBzdXJlOiB5b3UgZGlkIGNoZWNr
IHRoYXQgd2hpbGUgdGhlIG1vZHVsZSBjbG9jayBpcyBlbmFibGVkIGFuZA0KPiB0aGUgbW9kdWxl
IHJlc2V0IGlzIGRlYXNzZXJ0ZWQ/DQoNClllcywgd2hpbGUgZGlzcGxheSBpcyBhY3RpdmUsIHBs
ZWFzZSBmaW5kIHRoZSBkZXZtZW0gdmFsdWUgZm9yIHZlcnNpb24gcmVnaXN0ZXIuDQoNCnJvb3RA
c21hcmMtcnpnMmw6fiMgZGV2bWVtMiAweDEwODczZjAwDQovZGV2L21lbSBvcGVuZWQuDQpNZW1v
cnkgbWFwcGVkIGF0IGFkZHJlc3MgMHhmZmZmYTQzYmUwMDAuDQpSZWFkIGF0IGFkZHJlc3MgIDB4
MTA4NzNGMDAgKDB4ZmZmZmE0M2JlZjAwKTogMHgwMDAwMDAwMA0KDQpCdXQgaXQgaGFzIHZlcnNp
b24gcmVnaXN0ZXIgZm9yIEZDUFZELCB2YWx1ZSBpcyAweDEwOS4NCg0Kcm9vdEBzbWFyYy1yemcy
bDp+IyBkZXZtZW0yIDB4MTA4ODAwMDANCi9kZXYvbWVtIG9wZW5lZC4NCk1lbW9yeSBtYXBwZWQg
YXQgYWRkcmVzcyAweGZmZmY5OTg5OTAwMC4NClJlYWQgYXQgYWRkcmVzcyAgMHgxMDg4MDAwMCAo
MHhmZmZmOTk4OTkwMDApOiAweDAwMDAwMTA5DQpyb290QHNtYXJjLXJ6ZzJsOn4jDQoNClJlZ2Fy
ZHMsDQpCaWp1DQo=
