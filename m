Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18D023E2385
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 08:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236250AbhHFGvL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 02:51:11 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:53378 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229871AbhHFGvK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 02:51:10 -0400
X-UUID: 24b5e3bb666a4fdb9ffc8a7db7993280-20210806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=F7Vo6WOq1f5uWIPkH5X5HvBnpgh1DXAWfVKHo8EPl/4=;
        b=ICvVdNRtMVOydD/n2Lv2NOBgTRZVDqSioL+zUxGE2K3FhMcjncX9F/s68J8SOpVejavOnMWuObcr/2juMjeo1z6ZxFmumPAX3loMy7hNCJjGZlBy5XezXepLciikDuc9vXsOOg/odiih+seeZsVLOX1WXIq7iOrt4wdUhYlaRO0=;
X-UUID: 24b5e3bb666a4fdb9ffc8a7db7993280-20210806
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 679804046; Fri, 06 Aug 2021 14:50:52 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkexhb01.mediatek.inc (172.21.101.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Aug 2021 14:50:51 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 6 Aug 2021 14:50:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IT22fuLVHrAWiOTky9tY88pHh7bZryTWfrAB4SM3uQbG9U4jUryi5kFLeLMt0mY7hik8QRK/JDsurRhr5SX85JUC/2YCLG6Nd9STnevuRKzFCx835YzOY3nmo7Snhtf+hwFk4eUcbpEui6rbncbx7fr0ViMplpqYboWkCplhkX2q06G41CSCfNepd4FwcvuncVCOKXpw/COUmPhbv8gsQ56PcJiE0QWbPao1MhV938fjLRdeXdHRD85c7dYYx/LbSOQ3Bl/K0zl4yf+ehsGAyBrqcyZy8ol70HxtSeAkrPg5ibC/fWshcPo5UxGaoEj4T8pLzDk1u1IQKfGQNfPngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7Vo6WOq1f5uWIPkH5X5HvBnpgh1DXAWfVKHo8EPl/4=;
 b=MdzP6QSb8kP7PyYQQuuyEF+BFomUBqLy+6mT3vJlmfWlctXnhxPyybpiaMndJCv+nACuaiaqH+e01rW2U9g8noOXBK3P/mi1iDL2JXe10dbiAh/bmSM3EWD3b/ob9M0QV42nhtVTVvTko9fxev2YVPGsZlzi6RdNpwH1eKR6UGib7HWdrvOZ+5i3N+iwFhMaY1OU1muFYxwip8DwHkOct44oqFj8VNKcx+ofFxPBUXN9/xbwBqdac9R6/5l1n7i5nrZOGCohG//93pXLp6r2Gud7IyBmO8Ay+AqSc6Ux03R6WyaS9W12uGRhbj6VjzLDeKfDaz6yXFDrpogYnC4VZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7Vo6WOq1f5uWIPkH5X5HvBnpgh1DXAWfVKHo8EPl/4=;
 b=klg4QKgbOIig8wL5tuRbdBkM1/NklDO94JZCE/b5ctIRKZ5ah2X8aIn0BROp+m3QWH5bSNXVpt+v4rv47czZyGF0Fc1/7ZcKRLojoxTeL9ZGWhYURKcudtCJ+1SArdQpRWUYn3Oa2fId1a3wI1Knio/aMZRn378/csMAy9spuG8=
Received: from HK0PR03MB3027.apcprd03.prod.outlook.com (2603:1096:203:50::17)
 by HK0PR03MB3668.apcprd03.prod.outlook.com (2603:1096:203:73::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.7; Fri, 6 Aug
 2021 06:50:38 +0000
Received: from HK0PR03MB3027.apcprd03.prod.outlook.com
 ([fe80::75c1:f372:499b:7e13]) by HK0PR03MB3027.apcprd03.prod.outlook.com
 ([fe80::75c1:f372:499b:7e13%3]) with mapi id 15.20.4415.007; Fri, 6 Aug 2021
 06:50:38 +0000
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
        =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
        "hsinyi@chromium.org" <hsinyi@chromium.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        =?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= 
        <Andrew-CT.Chen@mediatek.com>,
        "acourbot@chromium.org" <acourbot@chromium.org>
Subject: Re: [PATCH 5/5] media: mtk-vcodec: venc: Fail if a msg sent to VPU
 was not signaled
Thread-Topic: [PATCH 5/5] media: mtk-vcodec: venc: Fail if a msg sent to VPU
 was not signaled
Thread-Index: AQHXiT02bdlB91YPVESjtje7F0wkzKtmC3cA
Date:   Fri, 6 Aug 2021 06:50:37 +0000
Message-ID: <6c56de481d7060b759d67417e9fa6383f6e2f418.camel@mediatek.com>
References: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
         <20210804142729.7231-6-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210804142729.7231-6-dafna.hirschfeld@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c581569d-fc8b-482e-f51c-08d958a67fe8
x-ms-traffictypediagnostic: HK0PR03MB3668:
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR03MB366811490CBB24204B24AB2A9DF39@HK0PR03MB3668.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CBIRngKDW07g/lyLE8keVk+VoJpiM3Epsrodxoy/6qUqRkn1jW4djMzlfyaxqXvKv3td3hyQXnco4Xljfwq4JWgJrzK+J5p4W0f28KpW46FNn16HCs3nuYiCyN61nuec96k1L7e1pVb+P3idH7h083Dz7w1OuyUsLbEjOiPwuzx7bMXbFlmSF4V0Sx2QDx8KlYwFtVSbFEPOcKnvItKxSZWgpSku8JuACJ0b58mI6NO9jYNMavG4q6TlKfXkepsxwuOrbwzYWpxpaKGDlJbiqE+8WZai2ODp+HudvzVSxyvwWyzfqtZ6VwEmjgEFvcYNML0KlPTphpXFJfG+WBZl1LYqCxWe9UGoi8ICclDKvH6dNjN1qL9UDArTQYGC2TpGSuxe+sahDXO59spZefuzcnUpJFm6dFt8v2tCcQpYtaTTeYw1P1Dx7+wVYtHYSIlXDiWEqqV9SsW5lfpEpywXHWykXacE+zbeQBE/JPvSuaPH80Q2HqeXmUFCbbA8nRFRQumxMKgyMUxGLSaOWRn9v/rZrttc0ACs2UWABmotw9XJyxpf1TfKmdhGSxo1TVKQYQ5vyTxtEzvZTAUgqNrzesdKJklpzVjfB8ERZyOavr2RWQvrppkBBFBHLIZZldSSyqec1ogklCmvhsw9af8aFNgbGOgwAQlx89S//k/loXTOoNo/4wLXEtcxTfhuM2P0SoqZJ1bZ12utUmsWnoThng==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR03MB3027.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(136003)(346002)(366004)(478600001)(2616005)(66446008)(66556008)(38070700005)(6506007)(38100700002)(36756003)(66946007)(64756008)(86362001)(85182001)(110136005)(122000001)(66476007)(54906003)(316002)(2906002)(7416002)(6512007)(8676002)(8936002)(4326008)(6486002)(5660300002)(71200400001)(76116006)(83380400001)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHc0akxiUnJTSjdrRmpXcFpJZkVhQUlSWnMvMTlNWkQxS1YvSnhXU3FrR3VQ?=
 =?utf-8?B?NkVPTVJkK1N3ckNxRDduVlFsTnA3Z3krVVY4VExzL3R1VWwzS25mOGN4N0ZK?=
 =?utf-8?B?bTBVZURDUDVKOG50cU1Eelg5b3ZmM0Y1c1gzNDJ4dFI2aTRGTHplS1lXcjUw?=
 =?utf-8?B?OXdIL2VvMDdpNmNhbnZkMEdnUGR4K01yL0d6Q1F2eDlmZlhkZGRrMkdBY1dN?=
 =?utf-8?B?MXRtZ2tyKy9WNGdzMXJHR1M4QUFHa21XQ3pIODhIbnhOUnlWR2tNKy9XY2Fl?=
 =?utf-8?B?a0QyblZXelpvdHRjRGtMc04xdFBobmtOeHUzREh5VEhtTmJuVENpQXZZcmxQ?=
 =?utf-8?B?dTdDT3Q1T29ncGlSWDhxeHh4Wm9ZdnpsRlFjbUJkT2dpcDEwNC9SM0MrdW9G?=
 =?utf-8?B?ZmM3YUJvZFE3c3o3RFI5NjRZOHpWNnhKdytBSWFpTVU5Q0hMalNFUzUwS3Qv?=
 =?utf-8?B?WllTR1Z2allXYkhjdDMveDVqNEFxVDQzMnFHWmhvaGl1TjNWTVFSdU5pRFBF?=
 =?utf-8?B?ci83KzJETk00SEdIaEtnU05mS0J0ZFZxdHZxc0VveDZwS3BZeTlWc3QwbDhQ?=
 =?utf-8?B?S0ZiWU1qbWd4bVZEc2NkMDlvR1Y4OXQ0NDM5dHl2NGo5R3AxNUR1NUlqTlZO?=
 =?utf-8?B?cHB5UGhQdFAvU2xhZTFYanNTZmpMaE8yMm1Ja3dPTFhZck40MUI2YlNuNnRW?=
 =?utf-8?B?OFRrY3hZRnBTdnZVekoxME1zbXo0dGUyc01tMlB4ZlFzZkdYWUQrSkwyK0w3?=
 =?utf-8?B?S0dDdHZlWjVvLzJUbjh6MUNmRE01b2RwbTNyV3pVNk4yQVFCcGdQSkVRQ1Uw?=
 =?utf-8?B?bjkxMmRuTllpRHlRQ3FGeHVNN2toS0gvNEoreC9CZTZxdmc5MFhaeWV6R2lJ?=
 =?utf-8?B?WXBFMU96TVVPSUFhSmpDZDBRekIzakwwMDYyWlBLZEt6a0k4OG9wZHJJcUhD?=
 =?utf-8?B?ZjM4eVVrd3ZuR0lyUWxpSDlxb3doTk5YQkU4OXpVTEFjcGpGd3Q5VXBLT2JG?=
 =?utf-8?B?M2xKSy9lQktlS0djbytNWTZmaDRtTktYMWNKdmxxVmhqVzRwVXNEQXFVU2RL?=
 =?utf-8?B?Qm9rOVZYcndka3VhN0VITlBLemtMOXMyYnFpdTFCMnF2Vk1kNXlDOGd5MG5j?=
 =?utf-8?B?SElCcFdRWGliaUc5bG0vdm9tUVl1cHVpUnJ1a3lTUktOd1kxSUxuRU1rRmJr?=
 =?utf-8?B?WHZUczRxaUdOYkFWRHFCWThrakVYeWxlV3FwUmVreFptM3g0dTZneEI3VytQ?=
 =?utf-8?B?aXFJVG5PZjYxVGJuMGo2d29OUkJUbk55R1hzWGxVbHd3OEFVdWdxK3k1dENn?=
 =?utf-8?B?bDdhRW8xNDZzWlNrdy80bG96bVRZMHh2a3ltb1NFVmcvNVM5MmpJL1ZyUFo3?=
 =?utf-8?B?c3V3S0h0ZjMrRFNYdGprT1VNN211MExPbGMzNTFUTm9TSDJHTjhkbjh2MHFw?=
 =?utf-8?B?QmwwRS94L1Z1dW55UWV3OE5YcG5LTjBSaWNaTjNlcjJFTE01MzJHS1VJMnIy?=
 =?utf-8?B?c0ZYZjl2anpkK0c5ZEoybUs3Vk03M2MxNFdMSVNXS0E1bHhmeFozT0h2RFNS?=
 =?utf-8?B?Y2R5dXBldnAzMVNiKy9VSzhiemZIRWU5VnFqb2t3QmtuU2FVaS9rblRmdTF3?=
 =?utf-8?B?b0Zsc25DL3pIemZOTm5ERjYxUmhCRThiY2VkYXdwdThUY2Rqc2dLdHVNQXlX?=
 =?utf-8?B?aTNxa1VXWkZZZnU3c201UytFZHlMNnJQTTJUMlVML1RnR05DZnFYWXJPV0or?=
 =?utf-8?Q?/DMvJjsrrUw6DXsw6uQr3tMMF91V2UXaP2huDFJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21E423194062D34483C5B45AAD4255D5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3027.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c581569d-fc8b-482e-f51c-08d958a67fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2021 06:50:37.9596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /L37D/HAwYXHHA1NMSBtKpUrimkY+mcKbT5IIMGhujaw9eczyXpPdF+ggdIZUn4oUGrHdpMgqB3E9O0DIz3cyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3668
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIxLTA4LTA0IGF0IDE2OjI3ICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiBFYWNoIG1lc3NhZ2Ugc2VudCB0byB0aGUgVlBVIHNob3VsZCByYWlzZSBhIHNpZ25hbC4g
VGhlIHNpZ25hbA0KPiBoYW5kbGVyIHNldHMgdnB1LT5zaWduYWxlZC4gVGVzdCB0aGUgZmllbGQg
YW5kIGZhaWwNCj4gaWYgaXQgaXMgMC4NCg0KSSBzdXBwb3NlIHlvdSB3YW50IHRvIGhhbmRsZSB0
aGUgbWVzc2FnZSBleGVjdXRpb24gcmVzdWx0LCBpZiBpcGkNCm1lc3NhZ2UgY2FuJ3Qgc2VuZCBv
ciBhY2tlZCBzdWNjZXNzZnVsbHksIHRoZSByZXR1cm5lZCAic3RhdHVzIiBvZg0KIm10a192Y29k
ZWNfZndfaXBpX3NlbmQiIHdpbGwgcmV0dXJuLCBzbyBJIHRoaW5rIHlvdSBkb24ndCBuZWVkIHRv
DQpjaGVjayAic2lnbmFsZWQiIGFnYWluLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYWZuYSBI
aXJzY2hmZWxkIDxkYWZuYS5oaXJzY2hmZWxkQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZlbmNfdnB1X2lmLmMgfCA0ICsrKy0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmVuY192cHVfaWYu
Yw0KPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZW5jX3ZwdV9pZi5jDQo+
IGluZGV4IDIzNDcwNWJhN2NkNi4uODMzMWIxYmQxOTcxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmVuY192cHVfaWYuYw0KPiArKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmVuY192cHVfaWYuYw0KPiBAQCAtOTIsNiArOTIs
NyBAQCBzdGF0aWMgaW50IHZwdV9lbmNfc2VuZF9tc2coc3RydWN0IHZlbmNfdnB1X2luc3QNCj4g
KnZwdSwgdm9pZCAqbXNnLA0KPiAgew0KPiAgCWludCBzdGF0dXM7DQo+ICANCj4gKwl2cHUtPnNp
Z25hbGVkID0gMDsNCj4gIAltdGtfdmNvZGVjX2RlYnVnX2VudGVyKHZwdSk7DQo+ICANCj4gIAlp
ZiAoIXZwdS0+Y3R4LT5kZXYtPmZ3X2hhbmRsZXIpIHsNCj4gQEAgLTEwNiw2ICsxMDcsOCBAQCBz
dGF0aWMgaW50IHZwdV9lbmNfc2VuZF9tc2coc3RydWN0IHZlbmNfdnB1X2luc3QNCj4gKnZwdSwg
dm9pZCAqbXNnLA0KPiAgCQkJICAgICAgICoodWludDMyX3QgKiltc2csIGxlbiwgc3RhdHVzKTsN
Cj4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJfQ0KPiArCWlmICghdnB1LT5zaWduYWxlZCkNCj4g
KwkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJaWYgKHZwdS0+ZmFpbHVyZSkNCj4gIAkJcmV0dXJuIC1F
SU5WQUw7DQo+ICANCj4gQEAgLTEyMiw3ICsxMjUsNiBAQCBpbnQgdnB1X2VuY19pbml0KHN0cnVj
dCB2ZW5jX3ZwdV9pbnN0ICp2cHUpDQo+ICAJbXRrX3Zjb2RlY19kZWJ1Z19lbnRlcih2cHUpOw0K
PiAgDQo+ICAJaW5pdF93YWl0cXVldWVfaGVhZCgmdnB1LT53cV9oZCk7DQo+IC0JdnB1LT5zaWdu
YWxlZCA9IDA7DQo+ICAJdnB1LT5mYWlsdXJlID0gMDsNCj4gIA0KPiAgCXN0YXR1cyA9IG10a192
Y29kZWNfZndfaXBpX3JlZ2lzdGVyKHZwdS0+Y3R4LT5kZXYtPmZ3X2hhbmRsZXIsDQo+IHZwdS0+
aWQsDQo=
