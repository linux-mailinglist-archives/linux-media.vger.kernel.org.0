Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44DCF3F6D47
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 04:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236930AbhHYCFL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 22:05:11 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:39976 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235663AbhHYCFK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 22:05:10 -0400
X-UUID: fc088b3df7b241d49890aebf772d9100-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=t+ak9OpOfhwSY2btt/poDPQxmEOcETX5fkGdJK/kiYk=;
        b=iwh3hsCwmLjBaupVY0iAMSFvGNudQVCxZq1sEp6I/KhRdUuVkIbH1K8NTIUpId/dWp30W2SRnT+rZ+4dpz02Kxe0Swcv4gCAga7+ttyHS+u1wppLzY52HpPPDkh/JJL3E+GdAe04WfuwJFzTU33i9cR59GKDI+VBiCClyb32glU=;
X-UUID: fc088b3df7b241d49890aebf772d9100-20210825
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2073569179; Wed, 25 Aug 2021 10:04:22 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 10:04:20 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 25 Aug 2021 10:04:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jo0CcXg/zuz9bzZFUDWptwBL+39AlrAjzv2QIQlhBocrRNVCwJh02jYliIkaekie/EaeRU77uEO2u5y61ZyyvJ640mHnZEXlTEA6rj53REDUNF6DyYx3fx6Ggg/7QkBHCtn4TirEQmoL5P+p7PTzlKdfBPC3yCaT8LBjLXracac3n6tsIHh74T2dKHr+eHRJrQCXpmFHYaXHBi84+/fCLalhGvNcp5/12WgUNjVAiop3PnBKW1jC8qTIMdjPpaNwtM2N80mqhsdgONLm9SMp4WJDmv2aKyCfg1QO3KZ0pEUcMX/GQ0kxGeQ+CeUQUpkVxLTgHxgL4gHA89TCwD5kEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+ak9OpOfhwSY2btt/poDPQxmEOcETX5fkGdJK/kiYk=;
 b=K+rhkx+Y8WG0mWT3f9jO2HXTFmViyqpHX0cJ7uqB0gov1pOpOtzCrxuGSemURrux3410lf7DweunnnLV6k8y6lBfoiE+sqcpY5aja/2c3fbF3RK+e/dQykeflmQkaJ4tJw3Me3tenv7UARzFL1s4epHqH+oN/izD5qFbekkAlj2GQUxpX5MpZOhk0YXj2jmbwOFlKFzLNMMKo3/DEP2+vESdYIzAzHi8LODNMVpibb0M5fxrNyvtnKqfMBhE1J3m0P8lweaRdQJ/WzcO8IV/inqrZJc7l5MSsc60sQ6LREO0Vuj3Ar6BIvnw7SiqkIQDtmY/g+VmJFL9HzG+E0+YcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+ak9OpOfhwSY2btt/poDPQxmEOcETX5fkGdJK/kiYk=;
 b=ik2EqZvRbsdatGjuUFrSdbAWnNj4aI8EHSGfmL50/4UCoFq6QwUNklPmc01AtAnLYZKmTe/sSG1b3vNJag4TGceoWRMiRtbQHzPVc7NuLuMfkXEVSeA2hXiXGAsaJ481zwH3DXrbyZRduLfRUIPRc/7/+gWV4bxsUv1XV/5WAEU=
Received: from SG2SPR01MB0012.apcprd03.prod.outlook.com (2603:1096:4:26::11)
 by SG2PR03MB4213.apcprd03.prod.outlook.com (2603:1096:4:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.16; Wed, 25 Aug
 2021 02:02:54 +0000
Received: from SG2SPR01MB0012.apcprd03.prod.outlook.com
 ([fe80::91aa:fc28:8acd:e3af]) by SG2SPR01MB0012.apcprd03.prod.outlook.com
 ([fe80::91aa:fc28:8acd:e3af%6]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 02:02:54 +0000
From:   =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To:     "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        =?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= 
        <Longfei.Wang@mediatek.com>,
        =?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= 
        <tiffany.lin@mediatek.com>,
        "frkoenig@chromium.org" <frkoenig@chromium.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        =?utf-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= 
        <Maoguang.Meng@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "tzungbi@chromium.org" <tzungbi@chromium.org>,
        =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= 
        <Yunfei.Dong@mediatek.com>,
        =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "tfiga@google.com" <tfiga@google.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "hsinyi@chromium.org" <hsinyi@chromium.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        =?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= 
        <Andrew-CT.Chen@mediatek.com>,
        "acourbot@chromium.org" <acourbot@chromium.org>
Subject: Re: [PATCH 1/9] dt-bindings: media: mtk-vcodec: Add binding for
 MT8195 two venc cores
Thread-Topic: [PATCH 1/9] dt-bindings: media: mtk-vcodec: Add binding for
 MT8195 two venc cores
Thread-Index: AQHXko4soSn03rWNh0qD4Nm01TfBfKuCihAAgAD7dIA=
Date:   Wed, 25 Aug 2021 02:02:53 +0000
Message-ID: <6efbfdbac55c5c8175168be96d3a2e63b4ac0f07.camel@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
         <20210816105934.28265-2-irui.wang@mediatek.com>
         <CAAEAJfDoSW3F85bFKTRvvGZXTZbCBRpUwZzEyx3zhrA6psiZfA@mail.gmail.com>
In-Reply-To: <CAAEAJfDoSW3F85bFKTRvvGZXTZbCBRpUwZzEyx3zhrA6psiZfA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vanguardiasur.com.ar; dkim=none (message not signed)
 header.d=none;vanguardiasur.com.ar; dmarc=none action=none
 header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63222a20-d316-493d-095c-08d9676c736d
x-ms-traffictypediagnostic: SG2PR03MB4213:
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR03MB4213908A6C6EB8A98B3A301B9DC69@SG2PR03MB4213.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zWzBrs0aaGTpINtFth80FKqeP7sPi46w1APBkebRxTruqw08Y3nfjiWod/LDq2b0e6BcyH6VVJA6cSwseqSATBsK1eD28U1A6qrsE55lGy8ZdlyS3y7p6in1sETI655YF7WmC18wESwqfW8g/FgF6WXoU+TRtIltFLY5dX2reFBrpC61bcXcgg7F60JZJr8fB1oqwGspxw2Dl9z46FjS0HE1vaZQh1yZXIrGotxTWl/1E3HGAWzzpPtwAQMd0WJWafHjcZBzt+IswtCTHUv86tEZFP8MvDtCWc/oZemT9iTK1HJCALNDmggHwkI909KutayhVEIv6Z/H5OOhn4kP1dvrZ9W3LSehwlV3keduCsYn0dJwmBYxN22q4VFH8sZccR4KXtSXgoqdcoQfM3BMce6ggQVKlRWpZhj7fm7hRaJrdlcAR34hnHC+IY7plB1cUcLFUTdVIN3lO+9/fOAfsNdtnAjtDv22JicUApKFUUoUXWzjjnpc+hgVyS3KaQtsmTadOW+cZtUrQ+M4c7YN+ibYtBUOlzpdTnx4ZvGmwL5baiMj+dSM4UzpYskPW2KJyQ7YmzbtMhOqD1MM+cOLqHs5xQaVXv/2iktXXbmTAdezN+zCXV4FQIuPpxcD83051fqtoXgcm4uJzvclEaES92uOV87Uw+qC1xZsNoC4IJAy2cv4m4ZTfK4f0/+viTcaxcz+N1wi6B4TggUW3TFBhw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2SPR01MB0012.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(6506007)(6512007)(36756003)(6486002)(4326008)(66556008)(66946007)(26005)(66446008)(64756008)(508600001)(7416002)(5660300002)(83380400001)(2616005)(316002)(38100700002)(2906002)(54906003)(86362001)(122000001)(6916009)(71200400001)(76116006)(38070700005)(8936002)(85182001)(8676002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGFKTThvZThRMUpKdkVMMXRXMC9sbTRwK1ZLSmp2SERZd0ExTyt5MW1DalJC?=
 =?utf-8?B?SWc5dGhEYlRoK3VRb2d6K2QyWGtYMmllK0I2Sm5nQ1Z4WjVSb0k1NWhVZ1VJ?=
 =?utf-8?B?NkJvT2d4WHV4ck9Qcm9KT2ZzaGRXcGxIbHNhVDRaazhWTUlnOTFrQTRWSEFu?=
 =?utf-8?B?WTFmZU1sUHhEeCtUUUpsV0s0cjdKRXZrYkdPSmMrWFFSbjFMQVN1bFM5M2t1?=
 =?utf-8?B?bkxSUC9zSHU0a1c1RmlvcVArWnhKcUdrZkJLU0xkYzBzKzA0SzNwNGJwNVJs?=
 =?utf-8?B?UUQyK3NBUTdndCtGSitUekVqb0ExaUpYWi9sUnhaU2U2aXYyeGx4TnJUY0Vi?=
 =?utf-8?B?bkhraURYdHhzeXV1SElERFdTTVRabTNDS3JsSVIxQTRyZDBJWjVySlFWNHFz?=
 =?utf-8?B?TjZnaDZ3U0M0Lys4RFY0T0J4cks0dklxWXg5STdtS1h4N09kOWVEamZscEJP?=
 =?utf-8?B?dnNQL01Rdkxtalc0bWpuelZKSFJzbXVaZ3NuZXkwTy9vZU1MOXZEWFVMSmF2?=
 =?utf-8?B?dktsSzhqNU13WmQvMHFHc3FoU2lwamhpenhjdlJoRjNPNFJIc3N6QkdsOWgy?=
 =?utf-8?B?NDdBNTVyTWM4NlRwejU4anRRTmRJdFdUa3NrWitDZXFNTEVmZGJiODFQR29B?=
 =?utf-8?B?dmJ4em5xUk1SSi9HeGQ1N081L0NwTUVpUkl5WXFmaWY3MXdkb2l2VlZjSVZW?=
 =?utf-8?B?ZzZKQWJlRS91d0xETGQrWUFxNER6WnFaTVZ6QVNraXlZTGJzM1ppMVZNaHZl?=
 =?utf-8?B?SVYvVzYzcUpSdnZ0MWtwb0NrZDl5ZFFGM2FTS3RNbHRNOVU2WDBKUTNJTVlB?=
 =?utf-8?B?M01pczAvK0tYTHNHQi96VWxyUURMOW01WkdVc2lPWHFtdERHZ2kyYlg1dFM3?=
 =?utf-8?B?Qllrb3RmaCt2aGx1MFUxd3pIdXkrNzlqT29FYXBGdWNZemFxek5ac2tsZHpm?=
 =?utf-8?B?cUR3b2pMZDlBYlAxUDU2YTBrUVVQOHBSYzNNSzZMSXJMd1EzVkp2UGhYUFpk?=
 =?utf-8?B?STBuRk8xZWJkb1h0dmFFVDlXOURCTnJPc3N6bjEra3RENzd2MGtocHF4Wktj?=
 =?utf-8?B?M0tsV2I3S29CaUZJU3FhZGp3SWUzRFA3VDN0V0FZaXdoRzIvWHllUS9WNUpx?=
 =?utf-8?B?eURCZGxMU2hWMEVqeVVndUNScXJUczFVTnF6L2premZPZjg3M1FuYkhKb0lt?=
 =?utf-8?B?NnRQbEd0N2VUeVFmMXdBeUVLS0tLQW9ncHR6bTM2VzdtQzJqeVlVeE8yMTVC?=
 =?utf-8?B?aHMwa1VzdUJucW5DemhzblFERHVBK2ZjZ2V2SmV4d2xtOVBhZFpNTGJtZXVR?=
 =?utf-8?B?ei9nVWt0VjU4TmV4Q1FKZU1OWkg4dlZOemo2a1VqSzNaRG1pQUxTRUFUdmdn?=
 =?utf-8?B?S2ZRaGN5LytTM09pSU50aDNvNlFNNGZuMHZSY0hqdHgwb3JrU1JTRE9GeWVj?=
 =?utf-8?B?R3VkYXZPS09CYVA0Q0tnUG5NVkRzL2h6R1JLTWVTM3J1ck9JaUFWZ25pZll1?=
 =?utf-8?B?UjBIUHVUNkNjaWYxd3djaDVMeUJPdjRNTkJ6ZVlKb0lud3A1RERLMll4UFpY?=
 =?utf-8?B?NVE0OHVVS1lZN25WRU02MjVxdjdoMzFWTERFcEliY0puV3kzMnozSC82d2Ew?=
 =?utf-8?B?SUNLSzE1U3VjSmdRS0lwT01ObDg5YzVTQm9GWGFoa29LV1I1SGF2TlM4dlhk?=
 =?utf-8?B?TU1DQmtYWXpISzRVMHR2aHA3ejZtUVZleGtxWkdxWExHdUVTVmpXWUJQRHpn?=
 =?utf-8?Q?J6q1pv+aNHN9m3zRITTSTLG7o9sbXpYF8iWSwsU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0A0C99842E6414987DDB0EB2DF09EA9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2SPR01MB0012.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63222a20-d316-493d-095c-08d9676c736d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2021 02:02:53.7022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: df7e6GlNfPZx7hgKn1YcRGkIclxJI3JTpngG2R5qyg0DT6AostkpY8iBaxhupgJLnCtTuFEoKYCgi4EAaNrXsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB4213
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksRXplcXVpZWwsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXdpbmcuDQoNCk9uIFR1ZSwgMjAy
MS0wOC0yNCBhdCAwODowMiAtMDMwMCwgRXplcXVpZWwgR2FyY2lhIHdyb3RlOg0KPiBIaSBJcnVp
LA0KPiANCj4gT24gTW9uLCAxNiBBdWcgMjAyMSBhdCAwODowMCwgSXJ1aSBXYW5nIDxpcnVpLndh
bmdAbWVkaWF0ZWsuY29tPg0KPiB3cm90ZToNCj4gPiANCj4gPiBFbmFibGUgTVQ4MTk1IHR3byBI
LjI2NCB2ZW5jIGNvcmVzLCB1cGRhdGVzIHZjb2RlYyBiaW5kaW5nDQo+ID4gZG9jdW1lbnQuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSXJ1aSBXYW5nIDxpcnVpLndhbmdAbWVkaWF0ZWsuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
bWVkaWF0ZWstdmNvZGVjLnR4dCB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstDQo+ID4gdmNvZGVjLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay0NCj4gPiB2Y29kZWMudHh0DQo+ID4g
aW5kZXggZGU5NjE2OTliYTBhLi5lYjJlMjRjMzI0MjYgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLXZjb2RlYy50eHQNCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWst
dmNvZGVjLnR4dA0KPiA+IEBAIC0xMSw2ICsxMSw4IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+
ID4gICAgIm1lZGlhdGVrLG10ODE3My12Y29kZWMtZGVjIiBmb3IgTVQ4MTczIGRlY29kZXIuDQo+
ID4gICAgIm1lZGlhdGVrLG10ODE5Mi12Y29kZWMtZW5jIiBmb3IgTVQ4MTkyIGVuY29kZXIuDQo+
ID4gICAgIm1lZGlhdGVrLG10ODE5NS12Y29kZWMtZW5jIiBmb3IgTVQ4MTk1IGVuY29kZXIuDQo+
ID4gKyAgIm1lZGlhdGVrLG10ay12ZW5jLWNvcmUwIiBmb3IgTVQ4MTk1IGF2YyBjb3JlMCBkZXZp
Y2UuDQo+ID4gKyAgIm1lZGlhdGVrLG10ay12ZW5jLWNvcmUxIiBmb3IgTVQ4MTk1IGF2YyBjb3Jl
MSBkZXZpY2UuDQo+IA0KPiBXaGF0IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gY29yZTAgYW5k
IGNvcmUxPw0KPiANCj4gVGhhbmtzLA0KPiBFemVxdWllbA0KDQpCb3RoIGNvcmUwIGFuZCBjb3Jl
MSBhcmUgSDI2NCBlbmNvZGVyIGhhcmR3YXJlLCB0aGV5IGhhdmUgdGhlaXIgb3duDQpoYXJkd2Fy
ZSByZWdpc3RlciBiYXNlLCB1c2VkIHBvd2VyLWRvbWFpbnMvY2xvY2tzL2lycXMuIFdlIGNhbiB1
c2UgYW55DQpvZiB0aGVtIGZvciBILjI2NCBlbmNvZGluZywgYnV0IHRoZSB0d28gY29yZXMgY2Fu
IHdvcmsgdG9nZXRoZXIgZm9yDQpoaWdoZXIgcGVyZm9ybWFuY2UsIGl0J3MgY2FsbGVkICJmcmFt
ZSByYWNpbmciLCBhIGhhcmR3YXJlIGVuY29kaW5nDQptb2RlLCBjb250cm9sIGZsb3cganVzdCBs
aWtlIGluIHRoZSBjb21taXQgbWVzc2FnZXM6DQoNCmNvcmUwIGZyYW1lIzAuZnJhbWUjMi5mcmFt
ZSM0Li4uDQpjb3JlMSAgICBmcmFtZSMxLmZyYW1lIzMuZnJhbWUjNS4uLg0KDQpUaGFua3MNCg==
