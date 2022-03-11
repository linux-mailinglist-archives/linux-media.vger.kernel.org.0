Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB7804D6060
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 12:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348031AbiCKLHi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 06:07:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbiCKLHh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 06:07:37 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2127.outbound.protection.outlook.com [40.107.114.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0ABC186B9B;
        Fri, 11 Mar 2022 03:06:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egNaSqhb9ZTpNl/hJu59oZD0IzABPNJMzJ69ewtnq3CJBsC0H+tIpa0fxERgcwdGsTYuUSp2p6R14LTAEncI3RZlmkm2omLbY63rYvMDhPjcSCJr0EhVoNoTuyWDWf2QaBSx4HBfxaM3/cAylxQ/nwKzwyA1tRDR3VvJPAIg7WTUXNqdQXT+iFcksleFdi3duWMY/nb9NreFEVe8zoMwURyB390yv5m0y9L0YOUzPxMfO9W84lbHpGg9/ute9Ns4qS/s/k65ljDRZnSnNT4AT7u8VFf7zEbY0Pecv6ogPkgUoxspQzvIAjiykyNUOd8rxQmwXGqg1QK4oQsNVSPIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35VCvgaBpdw2ak7/qn7D9a5o29oKuLWQIGvVGAEjNR8=;
 b=W21gVQbLKiyUSrZ3ZwfdvrZg+9L/QpcDkWw1YQJBWt67tahxh+XdUVq3IVFEUCYGkDpLsnHWn2VmbBESmg6IQ6Y3ZoAp/DWKOhxk85uwtJVbm9tdVoOZaUVuXX+haT+4nwzMgBSMKEpHOoV0OskEZWWfgrp9piFyHqhF7ldHMsoAXn+NVQDfVXq6sc7TXGxjtfIhPxKsXcN2H/KdScJ9JvndLshDLKMkuSNqkZrrdOz8kBf4oUnHos2UkXH1SAXvPcaPsds/paExkZwAS7V54dESPVRqGDIz/FHnIkDKuTUIfwP6EhrDloebpM/QOwRYsTD4KI2vw58/iIaIB6HRLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35VCvgaBpdw2ak7/qn7D9a5o29oKuLWQIGvVGAEjNR8=;
 b=dIQjJtNy4hE8gTm4Bqokm1OzfAbmyl3IWY4Wg6fY+pv816xPNFrQfSPE/DZVGvlAGRaMoz3eDXUTxYZG1FA7Q5nO+1jZG7Vmd+W5Z6Zlux/ewIgXr4KGhwK1iiBUbhDCMUf3/GFk/5FeMGF/nxaK6UfESDaOwlc87pl9RtQQUHY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB3813.jpnprd01.prod.outlook.com (2603:1096:604:43::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 11 Mar
 2022 11:06:31 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.029; Fri, 11 Mar 2022
 11:06:31 +0000
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
Subject: RE: [PATCH v3 2/3] media: vsp1: Add support to deassert/assert reset
 line
Thread-Topic: [PATCH v3 2/3] media: vsp1: Add support to deassert/assert reset
 line
Thread-Index: AQHYNTQee8MEtI/CtkSPM9yAwV/z2ay6A38AgAABjoA=
Date:   Fri, 11 Mar 2022 11:06:31 +0000
Message-ID: <OS0PR01MB592245F8708436D7B8ED5755860C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220311103803.25239-1-biju.das.jz@bp.renesas.com>
 <20220311103803.25239-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVBt7vmKE7xeXoD+3ADLn90uvsn-=dv-_c41UWhTjzAaQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVBt7vmKE7xeXoD+3ADLn90uvsn-=dv-_c41UWhTjzAaQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9585507b-e1aa-409a-77ac-08da034f329e
x-ms-traffictypediagnostic: OSBPR01MB3813:EE_
x-microsoft-antispam-prvs: <OSBPR01MB3813E0C55907A445D4744343860C9@OSBPR01MB3813.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V6+Dmm+TCGyhGKczfqqY5az3RILBcH/dbPjcrkWW+isvRBDfENvYLPqgz3EajL3eQ5G7BWh2enPuJFNF0CY7nLpW4mg0rFc+kGfmToFUBmDEYkSYQYZAOdGChhiMkQBmev/2CK4wUNUofiUL95HYY+PbjK3Ey5Tw+fT2A/0b19KzZxGtlBcTG/eliu/8/TozOT5R1jkd3P5IaD/fSKuAhH8MAV1RBoySFKn4t/PfryYXSHwbFVZoZkYjdcXLoMeVPhL0gndtwUspW4mRevjf+f0kg94D89mckBifH6HVyXG8X8Z10j0I0hGsiE24MZ3YsQbTqkgqN5JzVhi+CxknSMp+7oKLu9w4bNTVgX7swfI22XriofGIkYdzoLvsPR0eIJOb4jfCVg4/oParekfVD0NHF/AE9Z6PBcvRyyGfXgDxqWb4Yw3EfTM4gjPoEqXvw5geX3s3W3sVkE8aX9a8Jj5m1NHKTwSr9feXe3utQh5v5Ytp1za4lxQeVwi4xMacbA1Ec0etexFgUyZ6dTbr+uSsl1HrKHUdMjPdvo3ygn9HaqeFABoYE4nl3E1que4jSiBzCWGmxoyrNcbjWjzVWLVD4PrXuKKtprWmH4ri8f2qHck9RAaC4Y3ON/Z84uWfQqQ9C5YeSWTGvKSls++Zq3geJ5fuIsaLQMU3T9t/O01ZPJ5KOBiEmjvGAOqBlPcs5z6KTN9Pb9HMRJ8YErjHow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(71200400001)(86362001)(122000001)(4326008)(54906003)(8676002)(6916009)(55016003)(316002)(66446008)(64756008)(66476007)(52536014)(66556008)(76116006)(66946007)(5660300002)(8936002)(38100700002)(508600001)(38070700005)(2906002)(83380400001)(9686003)(6506007)(7696005)(33656002)(107886003)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3ZkU2daWHhMNksyV1VidjQ4SUR2ZXVkNDRmMmdWZC9iM0JYUkI1bHE4Z0dy?=
 =?utf-8?B?Rkk3YlI3TG40bXZDcDhEVG15MzYvbStzSkN1V3U3aVFDOUt4dUZ0eWY1dmZR?=
 =?utf-8?B?ekoxekJPblIrYk5PTDJaU0V5YW1TR1V2OTg5TnVDM3QrQnA3SnZsYk5nT0Zq?=
 =?utf-8?B?MzYxRDQ5eFVXTzdiSFdxUVNWdmM4YmYwRmQvamlUT3NQUTUzek5UNmJTR2VN?=
 =?utf-8?B?YVN6dHV0NDhoaWpLaEhCUittbFZNN3IzR0FObjFxYS9PWkcxOS95WWtmYVYy?=
 =?utf-8?B?Z1g1OXIrNy9UVW5tV085QXg1S0hzeW9IaURZcHdPZjhGb1grSjdiWEw4YTQ1?=
 =?utf-8?B?RVdON0E5STNINk5TMlIvaWRiVks5T1FpNC9YS2dVT2JUSWNTTlNOSjNDdWlK?=
 =?utf-8?B?a1VTaGZTSVIrWHNyb0l2N01nS2FrdURJUFJQVjJEZmhuSTZrOFFHeTZSVlhR?=
 =?utf-8?B?NkM4bkpRUTEwREtwWnQwUzVPNjhpOUlzdkZWOS9OSFZiMFl2VEZ4cjc1bnYx?=
 =?utf-8?B?UkQwUnZxM2NHNFdVNDF0dCtqbXh6YkRTemFMVTFiaCsrYjlNTXJYMWlWWWJy?=
 =?utf-8?B?QXczbEk1UzNvV2xrY2FsYTBWUVRMSDBucytEOGlwTFlQdTlyK0VtKzBpWHNj?=
 =?utf-8?B?WVJyMjR2Y2RnR3NiSEpBOUpmcExPbS9rRWhndkpoT3VKL08wRE56ai9qTXBa?=
 =?utf-8?B?Q2FISGlERjQ5UDYxRm9xYUx3ZDRPaFJiZEQybHAwRVRETHhTTjBTVGg3UXNo?=
 =?utf-8?B?QVhtbjk2VEIzd0RSYTZZNDZCRWNzQnN0c0I2WnREKzdaYTRGT2pLbGg4WS9S?=
 =?utf-8?B?emdtdlg3MFpPZHNiZEg1QXNmZzZQUUV6MVBSZE5BWXAwd0MvbTBYN04zTzNw?=
 =?utf-8?B?S2N2NUg5bkZDbm1FT1RxdHNVTGFnTkFDY2EvM3FxYWhrSFM2VmlLWEcvR2hZ?=
 =?utf-8?B?ZTZTVmtQZEp1WGxlMWtQcEhnYUFHNkxFVXdCRGFWdmoxUXdJNThwWGF4cEdr?=
 =?utf-8?B?MTBKWmFqZGNpdmxubHBUMXl4M1dVM0VJZ3VJeHBGM0tFWDB5YjJxU3FFUnRG?=
 =?utf-8?B?TWtXNzBDN2ZENlVmdDk3UHZTeDZxQkg1VlFuZTdFcWcwVDhmdXcrRmt4V2ph?=
 =?utf-8?B?VEdyNnlYNTdoMnhnVk9tTHNRT3A4K2U4UDJBTWREam0yQ2tUV3d4YStvZDBt?=
 =?utf-8?B?cTlYcnRIN2g3TXE4ZldRSDV0amM3a1dXazZNN0FsbmdiMEhkOXhXaWphKytP?=
 =?utf-8?B?U0pNVjZ6ek1QYUJVN1k0T2xjSDFTekFWbE9icFNxVGthKzdNd2E0aUVPM1Mw?=
 =?utf-8?B?ZFVsaHNXMWk3UlY2cFN4MnBaMTlhVlExUnVhaXpOTlBlOVdXeHZ6WlVpZDZN?=
 =?utf-8?B?UGY0NzR5aG16cVh5dFRjTUJ0NXNkRi9DRTZDRjFFTHkybWlXajZueTVrVDdI?=
 =?utf-8?B?RUUzTW9YemZMNmhMdm5GSUVoWHpNY3lxb2dubHZyUG5wVzdDdEZsM1BXN3pL?=
 =?utf-8?B?b0NpK0pTRWwxN2NNYldkTDFMRzdJbUdhYjJTUTlQU2ZLTHNtUW82dW9SZWlm?=
 =?utf-8?B?NDc1RVRoNEo5UVBQaG83WFpBMHFpUkFZSEorWmp0UTRjSHY2bFk4OWRwMW9Y?=
 =?utf-8?B?NzRTUUpMTlRTMTdnYXEyR28zZ0FBMUIyNVVnZGxyc09nVU4wc3hOQ1NuUHdh?=
 =?utf-8?B?NEpRWEh0WVVJaytsbGlPR1FyTVdvcUlIWU5WTmlGb3dUVk5keU5CKzFuVVFX?=
 =?utf-8?B?aU1DdFVwbStrMlVGNmlCZHlvVFNiellodExJWXphc0hJTkpvK21jcENtL3M0?=
 =?utf-8?B?dmNYOXBsT0hWVTV5anlyTTFrN2IwOEhKTjVnbVhXbDlrSHgrRDlocHNNNHdY?=
 =?utf-8?B?U3daRWc5TjJkWmE4SDJaem1HSkFBOEpoRWhGTVBsMW9GVWIrcldUcEZnWGVk?=
 =?utf-8?B?akkwT3BBenV3WGZ5VGsyYXJ2c3pPU2xmRWdWYXl6SFdHOHJhdmlVN0tMdjNR?=
 =?utf-8?B?azlRaWw4NmU3V0M5K0oyNmN4NHRWQ0lhdGxjUittU3JqSXVUaGJJYnVkVHpG?=
 =?utf-8?B?N3VoUWtSN1RyOXYxNjhiZG04YW5Ka2Y4T3FOMGhSNndpVzJhZFM0L0ViajU1?=
 =?utf-8?B?aXB0UUlrdkdlTTY3WjVBNDV1MXRteEtUNkNaOUljUmpXQVVYS1kzSU0zeTBY?=
 =?utf-8?B?S3B2ak9qSmlMTXZ1bE9jV3JYcWRnc1k4cjQyUWZ0WWozTktSZlhHakc1YnFl?=
 =?utf-8?B?UDJncTF3OE1TOTRmUFRvRDNzdVdnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9585507b-e1aa-409a-77ac-08da034f329e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2022 11:06:31.2111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: azzfcQbxlbhd3a3te7id+fJ0kk5r6DCcFSQ8Dhbs0s/VuThazXgeMbb9KxIWD4FiRiUehDa8PVA41K7xz/BblceZAhqvxzTrNIxAXzOC2og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3813
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAyLzNdIG1lZGlhOiB2c3AxOiBB
ZGQgc3VwcG9ydCB0byBkZWFzc2VydC9hc3NlcnQNCj4gcmVzZXQgbGluZQ0KPiANCj4gSGkgQmlq
dSwNCj4gDQo+IE9uIEZyaSwgTWFyIDExLCAyMDIyIGF0IDExOjM4IEFNIEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gQXMgdGhlIHJlc2V0cyBEVCBw
cm9wZXJ0eSBpcyBtYW5kYXRvcnksIGFuZCBpcyBwcmVzZW50IGluIGFsbCAuZHRzaSBpbg0KPiA+
IG1haW5saW5lLCBhZGQgc3VwcG9ydCB0byBwZXJmb3JtIGRlYXNzZXJ0L2Fzc2VydCB1c2luZyBy
ZWZlcmVuY2UNCj4gPiBjb3VudGVkIHJlc2V0IGhhbmRsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1i
eTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29t
Pg0KPiA+IFJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRl
Pg0KPiA+IC0tLQ0KPiA+IHYyLT52MzoNCj4gPiAgKiBBZGRlZCBSYiB0YWcgZnJvbSBQaGlsaXBw
DQo+ID4gICogSWYgcmVzZXRfY29udHJvbF9kZWFzc2VydCgpIGZhaWxlZCwgcmV0dXJuIHJldCBk
aXJlY3RseS4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0tIGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS92c3AxL3ZzcDFfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL3ZzcDEvdnNwMV9kcnYuYw0KPiA+IEBAIC0xNiw2ICsxNiw3IEBADQo+ID4g
ICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiA+ICsj
aW5jbHVkZSA8bGludXgvcmVzZXQuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L3ZpZGVvZGV2Mi5o
Pg0KPiA+DQo+ID4gICNpbmNsdWRlIDxtZWRpYS9yY2FyLWZjcC5oPg0KPiA+IEBAIC01NjksNiAr
NTcwLDExIEBAIHN0YXRpYyB2b2lkIHZzcDFfbWFza19hbGxfaW50ZXJydXB0cyhzdHJ1Y3QNCj4g
dnNwMV9kZXZpY2UgKnZzcDEpDQo+ID4gICAqLw0KPiA+ICBpbnQgdnNwMV9kZXZpY2VfZ2V0KHN0
cnVjdCB2c3AxX2RldmljZSAqdnNwMSkgIHsNCj4gPiArICAgICAgIGludCByZXQgPSByZXNldF9j
b250cm9sX2RlYXNzZXJ0KHZzcDEtPnJzdGMpOw0KPiA+ICsNCj4gPiArICAgICAgIGlmIChyZXQg
PCAwKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiAgICAgICAg
IHJldHVybiBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KHZzcDEtPmRldik7DQo+IA0KPiBZb3Un
dmUgcmVtb3ZlZCB0b28gbXVjaCA6LSgNCg0KTXkgQmFkLiBXaWxsIHJlc3RvcmUgZXJyb3IgY2hl
Y2tpbmcgcmVsYXRlZCB0byBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0Lg0KDQpDaGVlcnMsDQpC
aWp1DQoNCj4gSWYgcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCgpIGZhaWxzLCBzbyBzdGlsbCBu
ZWVkIHRvIGFzc2VydCB0aGUgcmVzZXQNCj4gYWdhaW4uDQo+IA0KPiBUaGUgcmVzdCBMR1RNLg0K
PiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
