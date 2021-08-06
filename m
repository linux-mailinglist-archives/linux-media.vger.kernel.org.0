Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A573E23A1
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 08:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242656AbhHFG7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 02:59:16 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:35796 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S242554AbhHFG7Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 02:59:16 -0400
X-UUID: e94c1f061504489cbbe1bdf7395b73fa-20210806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5VnQKLAVhpkMAdtkDmJy5/WOd/F5Rxd9yxEytBXwVcs=;
        b=CXfnpIZVqO8WTvIOs2LQSeXBktI5qZRk6MEyPKlHQsMKzpKuiGp1JcOG/Pplw+tGVVUGC/QG3RMSuD3QVt9BsCrAKuapF30EYWUfj0U3tGz/+sdIXbddGundf0BaXMDFHqLGw5six43E29nGHDDh59Hg2zi28i8BQZSpDubYlZs=;
X-UUID: e94c1f061504489cbbe1bdf7395b73fa-20210806
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 630496850; Fri, 06 Aug 2021 14:58:56 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Aug 2021 14:58:54 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 6 Aug 2021 14:58:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kERa7iKNhf4SbMVjaktZALW6yz97Ffw06rp3dDg6qSNotKdDwBwWcUO0x2uZDquPesGA73yzpMUL63SRghtj5zL1Bxtpret84YGn+OKMO0QOyz9QPq9jP7b3sZoeaYsNWg0AVX9/pUab0D/2R/ObJw7uSzf8vifvlNHutjs1kB9rG3OERKwM5NC0sMCk1Hho/8MqbBO7MksaanXxuv5js9bf0fX3ryaeCFqB1/2KYNWgIDhr21xXxqekUUDLehF0+UI/ElgRJz3LORxPViB6V6be8xBE1tZTviOEyFBuFRcbcsuXKd7jfy4ME6R/q8Sp5jbTEMMdubOmNENh4zJJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VnQKLAVhpkMAdtkDmJy5/WOd/F5Rxd9yxEytBXwVcs=;
 b=DboEwpYICuPnuxfLeMqTwGPvMafGhcewIO1Za9YPdE8sNU4yGFS/1adIDMZkylabPbzgv0P0NgbsYb/TJe2ymRASb2/AV+eNyP3Gat3g//rTSDBVQaW1+iwn/sjb0Rblp8y5DKN3Lv3dnot8BnDBKVqh+hovVDVFbsLa7ouKigawV6EGtacgZ/wAkByhCgyrZ4WhB7Faf7dDacHxdu2PGbHgIJEOb4g8nccS4HQ/rQ4heMErgErJgv7SOFf1RTpcJPeOXkZ20HI9mZDgYb5YORtIYkQTzVonLyPZVsDGqyIn7cNqi081wwozIOxgAtJuuc8OoGPAGfXD4azaaL2X7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VnQKLAVhpkMAdtkDmJy5/WOd/F5Rxd9yxEytBXwVcs=;
 b=IgR2c9PT4iwOYkHqmxYim5h18nxV5UMNn6zqixlUdyktk9LXcwh+O0NLAgEBSclaisRlTT8plt7xy2xOipyrr17bjYkJbf0wGtXArE0Wc6zEvT8K6SiFhn/i3q86cNVmWls+6KbRx8dO1MnMfmkBrlrte/wWAr2Fn7huk+JdTO0=
Received: from HK0PR03MB3027.apcprd03.prod.outlook.com (2603:1096:203:50::17)
 by HK0PR03MB5171.apcprd03.prod.outlook.com (2603:1096:203:ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.12; Fri, 6 Aug
 2021 06:58:45 +0000
Received: from HK0PR03MB3027.apcprd03.prod.outlook.com
 ([fe80::75c1:f372:499b:7e13]) by HK0PR03MB3027.apcprd03.prod.outlook.com
 ([fe80::75c1:f372:499b:7e13%3]) with mapi id 15.20.4415.007; Fri, 6 Aug 2021
 06:58:45 +0000
From:   =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>
CC:     "dafna3@gmail.com" <dafna3@gmail.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        =?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= 
        <tiffany.lin@mediatek.com>,
        "eizan@chromium.org" <eizan@chromium.org>,
        =?utf-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= 
        <Maoguang.Meng@mediatek.com>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= 
        <Yunfei.Dong@mediatek.com>,
        =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
        "hsinyi@chromium.org" <hsinyi@chromium.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        =?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= 
        <Andrew-CT.Chen@mediatek.com>,
        "acourbot@chromium.org" <acourbot@chromium.org>
Subject: Re: [PATCH 4/5] media: mtk-vcodec: Add two error cases upon vpu irq
 handling
Thread-Topic: [PATCH 4/5] media: mtk-vcodec: Add two error cases upon vpu irq
 handling
Thread-Index: AQHXiT0nYxLHauJx00CoptCt2futW6tmDoMA
Date:   Fri, 6 Aug 2021 06:58:45 +0000
Message-ID: <81524c608e9ef640e71d969aa83d1a383e687b0a.camel@mediatek.com>
References: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
         <20210804142729.7231-5-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210804142729.7231-5-dafna.hirschfeld@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46bef514-5d71-423a-27c0-08d958a7a25b
x-ms-traffictypediagnostic: HK0PR03MB5171:
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR03MB5171094545C33F74367909BA9DF39@HK0PR03MB5171.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:55;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0ShjNoeB4Oih4L3VQEXv5phl+7mgBWWVhgxzc6+jBmHvOykfUXF29JtysVwBv375Gazr4QP1WgRChwOaET5+z4fKQa/X3ZomLmf4wAhb8Jo/mBgrTbwR8yzYCLzdLcqy/U7xbbXSE0U26gjA7BRXA5HnCgswRCupW/c73rfAI8hNLXWF5HdEx17ZFRYCJzz4S289KjfMmUh5VhXhqzEPTnh/t0/65XoddiRgR9laxKrpixs3eAntmKiWr02qmQ5wEhraDPmmbIEsM6Mf+CRBY1by6i6QUR4KUtxOmnEgJPk6qQTR+kgf+YusuydMBFq1eTr6XaZ1NvrWyWwosyZST//dn1EYrUr11FGnyJwnnuHkx2zMwxRrlsNHEO/gTX1cQoSKK3NkC0I8cT/30OlTnvegCS5vM62u9Xy7b3+GcJ2RKnZWXIFZiCUtiDabmxm9uOpoK2UYcvTWekkCGkRkt1BwghdH1NErt2mRURqjTiRL3RrF39z0TZKwzjJHWewCtSKADzPTZEPhHXELvRJTGscxZjctHyJ/RPlpKtuC5d+xhw2TNo4EwGH2UQRBgi1BTh1Jd1baDRuVNxSFC6o7esF3ba280Vjv4cow+HeY3dSPnOZsl/Rf9PO30vpKuaVOIVuAyznVgjbUaeF7vj4Q9DwR3IIqz7O70NgT70LMtZlRyySOihmP0IbBdSXmjCt4itQd7Af452AFWNu3Ig5LXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR03MB3027.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(85182001)(26005)(76116006)(54906003)(38100700002)(122000001)(2616005)(71200400001)(2906002)(66446008)(36756003)(6486002)(66476007)(86362001)(316002)(64756008)(66556008)(110136005)(66946007)(8676002)(4326008)(186003)(6506007)(508600001)(38070700005)(6512007)(8936002)(7416002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDh0Q1VoV3JBMk5jK2t4bFYrS25jckhZWUp4OE9YSzl2MkFIYjZvME95eUJz?=
 =?utf-8?B?cXVWRFpuaXZLNm4wbVZHVWxkckR0azBiVERFSjgrR1Nva0w3M2JHR0x0Y05K?=
 =?utf-8?B?T0J6MmI4Z08xN3B0ZEtiRFlxaU1HMTFWM2F6cWowdnNPZ2hFVzNXb3RWK2Va?=
 =?utf-8?B?NUgrWDl4WDJidzV1VEE0ZzBUWlNHQ2RuL3V1QlZnU09RcTk4UCt2Q0x4aWIz?=
 =?utf-8?B?TkRubDJFUlM1Sm1NN1hnWGpCcU40S05UeEJEd2JMVXVGb0tNdEwyK1RmR01y?=
 =?utf-8?B?VHlBVU9jUllMeUN5NlhNdW1vQVNMVlEvb0RTK2ZUWUg3ekpzQ2oxZDdrUGlJ?=
 =?utf-8?B?NGZ5dmtVdDFMUzRPMmpmeWtVQUVnRlNpQmVEU3VxVDI1QisyZXJOelhYTWZT?=
 =?utf-8?B?SjRvRSt6T2I2MVpqeVlYelNINi9ETkVBcUhWb1RsL29oSUFnbksrZkFjY0xs?=
 =?utf-8?B?U3VtVHEzU0J2NDJ4cjM0R042a3RmOXFwTE1Uek9VdWp0dkh4VUlaS29veGE0?=
 =?utf-8?B?RHlkNFhEeFlyWUI5YjYxSW40aVV6RUxJNzhmMnFIWk1NVWJVNUhRLytYaGEy?=
 =?utf-8?B?UTAzVWpNTzBYMTdrd0VSallFbjlHWHBzUlBiMGF0M0xSdVNhK0hGYzN2Qy9r?=
 =?utf-8?B?V3JYSnNwRWhhN0Qrcmd0cnowN0psSmNwNmxtVUdkdFJoK1Z6ZUhmMXM3ZHE2?=
 =?utf-8?B?aXBod1BycHhQM2pLYUtPYUtoUjFHajJ0YnJidmVvY2x3cXA2N00yUU5CR3N5?=
 =?utf-8?B?MFJaWktxWmlpd0Y0T3VuNjgxVFJ5ZXp1MUU2cERyUTZLNk44cEpTeGc2NVRG?=
 =?utf-8?B?ZFlVaVQ3QUtzRG5nVnU1VTZ0SnFXTnpNMGFpdzJrSDBzdHVVakdEVGgzeVMr?=
 =?utf-8?B?VGt6elR3RUxyZ2FyU0oxRTV2Y2dKRXp3OGlIaTN5a0svZDRWT3JQaU85WVpN?=
 =?utf-8?B?Z2J5d0k3Q0I5azdnUlh0U1ZCNGkrK2h1dmswYWp4K1dxU3JzK0FEMFp4MVo5?=
 =?utf-8?B?aTRHVjIwNS9pNkFwNVZPUXM1SG84WWlCRHN4QlpCVW1tQjhIc3REa0ZMcTNw?=
 =?utf-8?B?SUZ0VWRKWGVKV29UTTVxTU1QQ1p3aS9zUUlaeVJOUXBKVUVYVWFWNHF6eVM1?=
 =?utf-8?B?cUVRZjN6UkQ0Y3UwSnEra0ozd09ydGJNZ2ZVNW95SE54STJ0Z1NvU1hmeGlu?=
 =?utf-8?B?YTJ4NGd0VWNmdTQ5TEcxRGcwbEZkOXpBSkxxKzExdmtQMFFENUtoYkpRSWVn?=
 =?utf-8?B?YlVxUDJaWkNhT24zbXAvMThmaFE0Q2V5TlJZK2JuSjdkZVUzdGhybjZ0UXRG?=
 =?utf-8?B?Z1dmWnI0djY4c3pES1dxR2w5T3hFREkzTFVZQ01VYklvRUhiVkl6YUxUUnV0?=
 =?utf-8?B?SUtKL1JPNEtHNnVFd2tZL2p5RFQ1WmJQaVhOQnRZd1JBdXF3ZmU0T2FxTC9T?=
 =?utf-8?B?SHVHT0svZVFnRiszTTEyZWFLZTYxbTZHVE5Gbm5Qb1J3ODYvN0p4R1N1anpi?=
 =?utf-8?B?ZlU5QUsvbXltSU9pdjJxZVlJYU83MFB2eFVrd1QxdWFZdlB4aTgzL1dmczA0?=
 =?utf-8?B?enNyWWV1ek03WnNrU2p6TUNhNThQcTVEcVFUenJBM2tzcjJ2T0ErUEhmeld3?=
 =?utf-8?B?RG1hZHdOSE1nRi9wL2RKS1dDdHAvODQ0ZmtlN2F0Vk1ScW96RmpFamRRa3pH?=
 =?utf-8?B?WUQ5NURPSVR1M1Qyd2tGSmZHTmVLZUcvWitxY0xDa1lEck5UZ2JPQ1ZDcnox?=
 =?utf-8?Q?zOe1MQ+2FWFQmwWkxGzghi4rA7IkianBG6Gy2VY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F238797725A1443B635ABDEDCF9E0D5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3027.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bef514-5d71-423a-27c0-08d958a7a25b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2021 06:58:45.3812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OmTv1lYRHTvDEum3tqcxw88lzbVfU1ctg8ASxjif7lPmk+PvQtaSGdGvv+IwT98i4jcJEyEyjBQwWF7QgNqBdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB5171
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIxLTA4LTA0IGF0IDE2OjI3ICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiAxLiBGYWlsIGlmIHRoZSBmdW5jdGlvbiBtdGtfdmNvZGVjX2Z3X21hcF9kbV9hZGRyDQo+
IHJldHVybnMgRVJSIHBvaW50ZXIuDQo+IDIuIEZhaWwgaWYgdGhlIHN0YXRlIGZyb20gdGhlIHZw
dSBtc2cgaXMgZWl0aGVyDQo+IFZFTl9JUElfTVNHX0VOQ19TVEFURV9FUlJPUiBvciBWRU5fSVBJ
X01TR19FTkNfU1RBVEVfUEFSVA0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGFmbmEgSGlyc2NoZmVs
ZCA8ZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZW5jX3ZwdV9pZi5jIHwgOCArKysrKysrKw0KPiAgMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZW5jX3ZwdV9pZi5jDQo+IGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZlbmNfdnB1X2lmLmMNCj4gaW5kZXggMzJkYzg0NGQxNmY5
Li4yMzQ3MDViYTdjZDYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LXZjb2RlYy92ZW5jX3ZwdV9pZi5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LXZjb2RlYy92ZW5jX3ZwdV9pZi5jDQo+IEBAIC0xNyw2ICsxNyw4IEBAIHN0YXRpYyBpbnQgaGFu
ZGxlX2VuY19pbml0X21zZyhzdHJ1Y3QgdmVuY192cHVfaW5zdA0KPiAqdnB1LCBjb25zdCB2b2lk
ICpkYXRhKQ0KPiAgCXZwdS0+dnNpID0gbXRrX3Zjb2RlY19md19tYXBfZG1fYWRkcih2cHUtPmN0
eC0+ZGV2LT5md19oYW5kbGVyLA0KPiAgCQkJCQkgICAgIG1zZy0+dnB1X2luc3RfYWRkcik7DQo+
ICANCj4gKwlpZiAoSVNfRVJSKHZwdS0+dnNpKSkNCj4gKwkJcmV0dXJuIFBUUl9FUlIodnB1LT52
c2kpOw0KPiAgCS8qIEZpcm13YXJlIHZlcnNpb24gZmllbGQgdmFsdWUgaXMgdW5zcGVjaWZpZWQg
b24gTVQ4MTczLiAqLw0KPiAgCWlmICh2cHUtPmN0eC0+ZGV2LT52ZW5jX3BkYXRhLT5jaGlwID09
IE1US19NVDgxNzMpDQo+ICAJCXJldHVybiAwOw0KPiBAQCAtNDIsNiArNDQsMTIgQEAgc3RhdGlj
IGludCBoYW5kbGVfZW5jX2VuY29kZV9tc2coc3RydWN0DQo+IHZlbmNfdnB1X2luc3QgKnZwdSwg
Y29uc3Qgdm9pZCAqZGF0YSkNCj4gIAl2cHUtPnN0YXRlID0gbXNnLT5zdGF0ZTsNCj4gIAl2cHUt
PmJzX3NpemUgPSBtc2ctPmJzX3NpemU7DQo+ICAJdnB1LT5pc19rZXlfZnJtID0gbXNnLT5pc19r
ZXlfZnJtOw0KPiArCWlmICh2cHUtPnN0YXRlID09IFZFTl9JUElfTVNHX0VOQ19TVEFURV9FUlJP
UiB8fA0KPiArCSAgICB2cHUtPnN0YXRlID09IFZFTl9JUElfTVNHX0VOQ19TVEFURV9QQVJUKSB7
DQo+ICsJCW10a192Y29kZWNfZXJyKHZwdSwgImJhZCBpcGktZW5jLXN0YXRlOiAlcyIsDQo+ICsJ
CQkgICAgICAgdnB1LT5zdGF0ZSA9PQ0KPiBWRU5fSVBJX01TR19FTkNfU1RBVEVfRVJST1IgPyAi
RVJSIiA6ICJQQVJUIik7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCg0KSGkgRGFmbmEs
DQoNClRoaXMgc3RhdGUgY2hlY2sgaXMgdXNlbGVzcywgdGhlIGVuYyByZXN1bHQgd2lsbCBjaGVj
ayBpbg0KInZwdV9lbmNfaXBpX2hhbmRsZXIiLg0KDQpUaGFua3MNCg0KPiAgCXJldHVybiAwOw0K
PiAgfQ0KPiAgDQo=
