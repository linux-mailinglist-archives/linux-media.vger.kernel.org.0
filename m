Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71AB3F703B
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 09:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239261AbhHYHRz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 03:17:55 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:36154 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S239250AbhHYHRy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 03:17:54 -0400
X-UUID: 2bf1863e704d4895a28e1afb4c33fa6e-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LzrrHo0ycb2nbda00kLN5DOLfJKiSjGRhFVxF2ZrfcY=;
        b=G7IQttLlJ685+IZAuxoQi9BLFPFqGfV588Of9/8A5WxcyhUty6YKygEooWwVfISMR2AHLyEx3+hzNFRekUYGsjnZ+ex2i7akp8xjyPmo5u/IMx3QQcYK+NSsStGsMW/cdJMb7ybPyu3clDJt+/Ipa3JLdDgcX4hMvtuFvIbq4Tc=;
X-UUID: 2bf1863e704d4895a28e1afb4c33fa6e-20210825
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1913259256; Wed, 25 Aug 2021 15:17:06 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 15:17:04 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkcas07.mediatek.inc (172.21.101.84) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 15:17:03 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 25 Aug 2021 15:17:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzVui2tAWpet9N8UeOUcWV8AVYx8kCEOw14Z1ZFQHKJlLOXvnKT1IQ0MuLL8Fbaj7XEjeQn/hb9ylO1GWrzvI58JryMusVHSK5HYLA7BqK10gQG2o01yBa7pTByU1lMPaDzgs2RJpKP/KyPf2LXStUrwEDItftBvvq5YPbC2CX6C9AkKtBSV08dZu3fX1cfse/0wCFzeFNn4rFlH2fwJ9fsz/DiGdOiurDnxC8/F7eWbEj3ZwZ+tnPYQMjPxNBseBbl+LX2G63BMFrAXpeJha/xPyjwpCv0ndfy6iIABR/twQXmu9fTV61+64War+KKx+gX46mdD7pC2Bk/5jrQ/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzrrHo0ycb2nbda00kLN5DOLfJKiSjGRhFVxF2ZrfcY=;
 b=BCtge+D+Wpt9vEUssw2+SCYd0hrC06zhxBT4A+nsL4dLhaoF0P5hp/miuHxrlPsVDq7rdFSzLRNdLKhkut1/hGS8hZ/DXMyflfOfEFm8/kJ5e/fhQ7+8b2JbilPbzq+LRft7/H61wyaPzk/qKI4IQXGyqzq/49K+ikTn2KAIR/Kfa8Sc7bAfTT/ndDgEfL+zTLqEpklNkffqButqu+V6lp6I26XCjweK1hfy/n/I7qURJZ6pzVixenvapANAVlySURt2dgVefo/ifaGs/X3rCMh23bMQSFvzOFUlacamxq6OJ0z1i3LbMdWpn0FWLqyl8TcR7h5xIQhcpWYgFh1qRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzrrHo0ycb2nbda00kLN5DOLfJKiSjGRhFVxF2ZrfcY=;
 b=ntVRQrNL2K0as+DQ9JABy3DY9xj66rNdcuuJ5Ot32SfbRJirAKhkM0uQkIAVirsdCBoeC5I3HWmGQxtgxQ+aYNAUVb3bQgkGOT+mNoa6gPgevHyGkbcJ7IhR6tQYHSrvcPVtOjX1+uWrDtsF8V+c1kk9YZYiMjF0qUVbDHD7Uw8=
Received: from SG2SPR01MB0012.apcprd03.prod.outlook.com (2603:1096:4:26::11)
 by SG2PR03MB4294.apcprd03.prod.outlook.com (2603:1096:4:2c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.14; Wed, 25 Aug
 2021 07:16:51 +0000
Received: from SG2SPR01MB0012.apcprd03.prod.outlook.com
 ([fe80::91aa:fc28:8acd:e3af]) by SG2SPR01MB0012.apcprd03.prod.outlook.com
 ([fe80::91aa:fc28:8acd:e3af%6]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 07:16:51 +0000
From:   =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To:     "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "frkoenig@chromium.org" <frkoenig@chromium.org>,
        =?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= 
        <tiffany.lin@mediatek.com>,
        =?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= 
        <Longfei.Wang@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?utf-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= 
        <Maoguang.Meng@mediatek.com>,
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
Thread-Index: AQHXko4soSn03rWNh0qD4Nm01TfBfKuCihAAgAD7dICAAB3XgIAAOeGA
Date:   Wed, 25 Aug 2021 07:16:51 +0000
Message-ID: <fb5fcb7b315f891a9bf87bd5bbe335ee46f5532c.camel@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
         <20210816105934.28265-2-irui.wang@mediatek.com>
         <CAAEAJfDoSW3F85bFKTRvvGZXTZbCBRpUwZzEyx3zhrA6psiZfA@mail.gmail.com>
         <6efbfdbac55c5c8175168be96d3a2e63b4ac0f07.camel@mediatek.com>
         <CAAEAJfBvWDqtb8oqxx9zosEbBhFVMiszG2cu=Y7OXx3-T4gAOQ@mail.gmail.com>
In-Reply-To: <CAAEAJfBvWDqtb8oqxx9zosEbBhFVMiszG2cu=Y7OXx3-T4gAOQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vanguardiasur.com.ar; dkim=none (message not signed)
 header.d=none;vanguardiasur.com.ar; dmarc=none action=none
 header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d52a9baa-5894-461f-2c54-08d967984f9b
x-ms-traffictypediagnostic: SG2PR03MB4294:
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR03MB42941BC2F162D9488EBFCC769DC69@SG2PR03MB4294.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VmH3Ph2TjZ4U0CJ2CYSJKetL6UtxoJyhTFtAAC1FQ+RPgOfulVf6c30QiZjAabE/EST63pU3gJbvcX4uddxTw4RnSkyNdM38udE25XPFmRKpkLMRHzEeyKjBbTM275z2mT8+qdTbDvbY5XSplzTzH1JW1T/DEnmfzcCT4JDpjmuIdp14Fid3/DojRUFYcpqdqfbJg4bgkTAW8sGw/nvshQOO70AvhouB5Yb+TE2Qgh5y82RDbtg8r2oZlv9uMhaGReItxZmNJ5hyDqPs4g4DiPKtiT3drLBO9kr3EoFfgeuJHKS1kLvYZPfCmArqQIsgmEqT6VS2PVpg7VNb65wYh9LnPbIn9YcRfrKCzbeIC0598fB73qh9JJZ16uMCeVSR0V89F9SaJRhyQ4GZ+xlNHy418jjRXesKRDNdF7p71OzG+Bs07WuFeo7yv2LkopBtf5ep2awDY6WlU/NjjBDYxW9CAA4MBbqdR00ZiuYmeN+Y+rAAYlb8Qo9JQ9YO/yV6gZ9IUdbXtrl41fZqQ4oeGy/jfg4o7jn1tvBFJ8LjyB1GsXb97AXAgk9i06fb7JlUdZ779MKX1TGR6TIEg/NzI6NUCVjSH4+gpSY7pzjtj+9fJUfZOkVe7BkHZbNkrXghblWRf3VdmN652ISPracz0JHWbQkxqSRFduiqP6+pmflKSHfQ47hDG8/kjIdwtNy2/WOQOnkO8S0cqLNHL5rfRA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2SPR01MB0012.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(83380400001)(66476007)(85182001)(76116006)(66946007)(2906002)(7416002)(66556008)(64756008)(36756003)(66446008)(6506007)(478600001)(8676002)(2616005)(6486002)(6512007)(26005)(4326008)(5660300002)(6916009)(316002)(122000001)(8936002)(86362001)(186003)(38070700005)(54906003)(71200400001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUw2dW1uWWRHcDB6d3Z5dmExV2lYVStRSHFzNG96WnUrWXpscHM0Z3ZweFN2?=
 =?utf-8?B?aXZ1dUZycFVIVmJLa09kNmZIOVFWdWZLdjFsRUd0ajdMd0dJRDkzQmlkSzRI?=
 =?utf-8?B?ZVgxT2xoQ0tyS3ZkU0R0NkJncEwrdlRnYW9SKzBEQnlLNVQ1T2xFQmVFRDdv?=
 =?utf-8?B?M1NZa3NrVk5UOXdTMitDd3JmaHZrRUtVVjhpVlNORGxQdk5Mbm5aU0Fhb3NE?=
 =?utf-8?B?Z3ZGeGxzVm1rS1lzN0pORm5DNjcyZ3RXTUhBWnFEdzNsb0tkbFB4V1Jic2Vr?=
 =?utf-8?B?TFpaZWs4cktIcll3ZXlnSCtSSjBQUUJyWm5wbkxoT2pJUTg1Q1J0U1ZFS0xZ?=
 =?utf-8?B?Y0VMSVJtK2Z4TitJVGVodEZmZGRZc25yZ1RxZGxQSkUrTGNFUXN0OTc5RkJa?=
 =?utf-8?B?YitINStLdXRobVN4bHREZlZMeDNJZnAwdWYwQmFaVWpta3lGeDdvdy9nbFhJ?=
 =?utf-8?B?dWlVUkluYWRXZmlhSmJ2NjdxVGhTd2dvT3NxeDNUeEVVeTdaQ0pLWEhUcjRz?=
 =?utf-8?B?Z2lHOGMxdDdkN2Fid01RMnBHVmQrYjRud25sLzBqTU1PT2RaMFRqOXRTWlRp?=
 =?utf-8?B?RzlMcE40ZERFOCtkTUpmSmN1eTRvQWdHN2tzQjl1WDhjWThWNURVa05sRTBh?=
 =?utf-8?B?c1ZNdFNmaCtLQ2RFbTRrZnh3K3gza3FuZWxSc3I0eEpjeFdtNW9SZzhnd1Vn?=
 =?utf-8?B?WmV3SEpSVFNHc0Q1TlNyd0tkQ3RJeUxxKzBDbTV2TENuZzhaNTlKanlHYmNv?=
 =?utf-8?B?YkxWcVJzaGVUOGtWZEVhZ2lZK0RpWGlrT1NxT2xvK1FiQ1NxQXZ3UjNHQWNS?=
 =?utf-8?B?Z3Rvc0pRc0N5OEZnYitSYmQ4RFJXZWNsM202U2xKWnRvSGt1U0lwQWlEOFZq?=
 =?utf-8?B?MmFzSmNSUTRBcVZIUVY0TTN0Y3ArV2FwaHhwb0dFRVJlaWpwRzJPRzF2d055?=
 =?utf-8?B?bUtTdDJiZVUxNUw2RWZKWURLaWc3WEltcVB3THI0cWwrUW5Rdkh4Qlo2NGRU?=
 =?utf-8?B?aUFrek9jQXBnR1JoazZ2NmIyRVhPc01oRktQbEdrcjlEUUFLM2FrcHZVbkk0?=
 =?utf-8?B?eEZIMnZBMTc0cDhsNytZNmNENHJ0dW1LeFVXT2JXdkpMMWZycmE4V3BKQVNJ?=
 =?utf-8?B?VUorVDVtdFVqWjh4c1FMTUtTSXBoaGFxSG9aMEVQYUlGTnN1Z3JTQWFQNEww?=
 =?utf-8?B?czZLK0VEWTYyTUgraHhqc0JQMkxLYmZuK05pWk4vY0kreWNBNHRFQkk1aTZF?=
 =?utf-8?B?dzk2NzcvNmRLRGJFbWFobFN2YUptVkhZZTJWSWR1ay9NZm9QRjkzYVp0RVZQ?=
 =?utf-8?B?Zm9FYnJQQUk2M0tkbXZ2U1JWcjFkMitDZXFSNEtldFFwMEVSUkxJcDhyRDBM?=
 =?utf-8?B?Tm5jSzhIY3NRTmxZQS9Qd1JVeWVRT3ZmZzhGZ2FaWkk4bmNhcHQ3VUdKNzRV?=
 =?utf-8?B?bjBTSndIcEltYkNxcE8xWnd0NTVNOFVvMmNkTktRcWJYREhSNXl4QzNZL3FI?=
 =?utf-8?B?MDU3Rk81ejRkTnN6OTFLbkJuaitlRzhMYmJKTTlxa1F2R0JEMUh0VjJGb3Fj?=
 =?utf-8?B?ZnlZcDdOTnh3eU5GRmg4LzVqajFYWVRrWEVWN2hyOS9sM3dCVkJGN2RvbTYr?=
 =?utf-8?B?WFdOQmc1dTZVQW8wcmw1NzZJMGF3eHNlZVl0TE5VZVg0WTVubG5TL3Ezd2dl?=
 =?utf-8?B?bUs5emlySllzQlRaM0lFRDd5Qi9LcFp5M2k1ZHlTMmVHcmp5OXRWQ1U4TzlV?=
 =?utf-8?Q?pXQ851BNuo9xkoZFUQ9OjN9COonN312sbb+9NgM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F91012F2FD3A20438F5DA5CB57D179FD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2SPR01MB0012.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d52a9baa-5894-461f-2c54-08d967984f9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2021 07:16:51.4687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TG9wAO1SuZofFA/yST+hAJxi4wdSLR4ZxVYzgHA59EC1HjP7rIz4yGCQdh7Od6Scwc14GOgR4RPzzfacWSPRvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB4294
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIxLTA4LTI1IGF0IDAwOjQ5IC0wMzAwLCBFemVxdWllbCBHYXJjaWEgd3JvdGU6
DQo+IE9uIFR1ZSwgMjQgQXVnIDIwMjEgYXQgMjM6MDQsIElydWkgV2FuZyAo546L55GeKSA8SXJ1
aS5XYW5nQG1lZGlhdGVrLmNvbT4NCj4gd3JvdGU6DQo+ID4gDQo+ID4gSGksRXplcXVpZWwsDQo+
ID4gDQo+ID4gVGhhbmtzIGZvciB5b3VyIHJldmlld2luZy4NCj4gPiANCj4gPiBPbiBUdWUsIDIw
MjEtMDgtMjQgYXQgMDg6MDIgLTAzMDAsIEV6ZXF1aWVsIEdhcmNpYSB3cm90ZToNCj4gPiA+IEhp
IElydWksDQo+ID4gPiANCj4gPiA+IE9uIE1vbiwgMTYgQXVnIDIwMjEgYXQgMDg6MDAsIElydWkg
V2FuZyA8aXJ1aS53YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiANCj4g
PiA+ID4gRW5hYmxlIE1UODE5NSB0d28gSC4yNjQgdmVuYyBjb3JlcywgdXBkYXRlcyB2Y29kZWMg
YmluZGluZw0KPiA+ID4gPiBkb2N1bWVudC4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IElydWkgV2FuZyA8aXJ1aS53YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4g
PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstdmNv
ZGVjLnR4dCB8DQo+ID4gPiA+IDIgKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstDQo+ID4gPiA+IHZjb2RlYy50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstDQo+ID4gPiA+
IHZjb2RlYy50eHQNCj4gPiA+ID4gaW5kZXggZGU5NjE2OTliYTBhLi5lYjJlMjRjMzI0MjYgMTAw
NjQ0DQo+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlay0NCj4gPiA+ID4gdmNvZGVjLnR4dA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstDQo+ID4gPiA+IHZjb2RlYy50
eHQNCj4gPiA+ID4gQEAgLTExLDYgKzExLDggQEAgUmVxdWlyZWQgcHJvcGVydGllczoNCj4gPiA+
ID4gICAgIm1lZGlhdGVrLG10ODE3My12Y29kZWMtZGVjIiBmb3IgTVQ4MTczIGRlY29kZXIuDQo+
ID4gPiA+ICAgICJtZWRpYXRlayxtdDgxOTItdmNvZGVjLWVuYyIgZm9yIE1UODE5MiBlbmNvZGVy
Lg0KPiA+ID4gPiAgICAibWVkaWF0ZWssbXQ4MTk1LXZjb2RlYy1lbmMiIGZvciBNVDgxOTUgZW5j
b2Rlci4NCj4gPiA+ID4gKyAgIm1lZGlhdGVrLG10ay12ZW5jLWNvcmUwIiBmb3IgTVQ4MTk1IGF2
YyBjb3JlMCBkZXZpY2UuDQo+ID4gPiA+ICsgICJtZWRpYXRlayxtdGstdmVuYy1jb3JlMSIgZm9y
IE1UODE5NSBhdmMgY29yZTEgZGV2aWNlLg0KPiA+ID4gDQo+ID4gPiBXaGF0IGlzIHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gY29yZTAgYW5kIGNvcmUxPw0KPiA+ID4gDQo+ID4gPiBUaGFua3MsDQo+
ID4gPiBFemVxdWllbA0KPiA+IA0KPiA+IEJvdGggY29yZTAgYW5kIGNvcmUxIGFyZSBIMjY0IGVu
Y29kZXIgaGFyZHdhcmUsIHRoZXkgaGF2ZSB0aGVpciBvd24NCj4gPiBoYXJkd2FyZSByZWdpc3Rl
ciBiYXNlLCB1c2VkIHBvd2VyLWRvbWFpbnMvY2xvY2tzL2lycXMuIFdlIGNhbiB1c2UNCj4gPiBh
bnkNCj4gPiBvZiB0aGVtIGZvciBILjI2NCBlbmNvZGluZywgYnV0IHRoZSB0d28gY29yZXMgY2Fu
IHdvcmsgdG9nZXRoZXIgZm9yDQo+ID4gaGlnaGVyIHBlcmZvcm1hbmNlLCBpdCdzIGNhbGxlZCAi
ZnJhbWUgcmFjaW5nIiwgYSBoYXJkd2FyZSBlbmNvZGluZw0KPiA+IG1vZGUsIGNvbnRyb2wgZmxv
dyBqdXN0IGxpa2UgaW4gdGhlIGNvbW1pdCBtZXNzYWdlczoNCj4gPiANCj4gPiBjb3JlMCBmcmFt
ZSMwLmZyYW1lIzIuZnJhbWUjNC4uLg0KPiA+IGNvcmUxICAgIGZyYW1lIzEuZnJhbWUjMy5mcmFt
ZSM1Li4uDQo+ID4gDQo+IA0KPiBJZiB0aGV5IGFyZSB0d28gZW5jb2RlciBjb3Jlcywgd2h5IGRv
IHlvdSBuZWVkIGRpZmZlcmVudCBjb21wYXRpYmxlDQo+IHN0cmluZ3M/DQo+IA0KPiBJdCB3b3Vs
ZCBiZSBpbnRlcmVzdGluZyB0byBzZWUgYSBkZXZpY2UgdHJlZSB3aGljaCBzaG93cyBob3cgdGhp
cw0KPiBzaG91bGQNCj4gYmUgdXNlZCBpbiB0aGUgcmVhbCB3b3JsZCwgYnV0IGZyb20gdGhlIGxv
b2tzIG9mIGl0LCBpdCBzZWVtcyB5b3UNCj4gZG9uJ3QNCj4gbmVlZCBhIHNlcGFyYXRlIGNvbXBh
dGlibGUuDQo+IA0KV2Ugd2FudCB0byB1c2UgdGhlIHR3byBjb3JlcyB0aHJvdWdoIG9uZSBkZXZp
Y2Ugbm9kZSwgY29yZTAgYW5kIGNvcmUxDQpiaW5kIHRvIGRldmljZSAibWVkaWF0ZWssbXQ4MTk1
LXZjb2RlYy1lbmMiLCBpdCdzIGZlYXNpYmxlIHRvIG1ha2UgdHdvDQpjb3JlcyB3b3JrIGJ5IGp1
c3Qgb3BlbmluZyBvbmUgZGV2aWNlLCB0aGUgZGV2aWNlIHRyZWUgbG9va3MgbGlrZToNCg0KdmVu
YyB7DQogICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtdmNvZGVjLWVuYyINCn0NCnZl
bmNfY29yZTAgew0KICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXRrLXZlbmMtY29yZTAiDQog
ICAgaW50ZXJydXB0cyA9IHh4eHgNCiAgICBjbG9ja3MgPSB4eHh4DQogICAgcG93ZXItZG9tYWlu
cyA9IHh4eHgNCiAgICAuLi4NCn0NCg0KdmVuY19jb3JlMSB7DQogICAgY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdGstdmVuYy1jb3JlMSINCiAgICBpbnRlcnJ1cHRzID0geHh4eA0KICAgIGNsb2Nr
cyA9IHh4eHgNCiAgICBwb3dlci1kb21haW5zID0geHh4eA0KICAgIC4uLg0KfQ0KDQphcyB5b3Ug
Y2FuIHNlZSwgbm9kZSAidmVuYyIganVzdCBoYXMgY29tcGF0aWJsZSBzdHJpbmcsIGl0J3MganVz
dCB1c2VkDQpmb3IgcmVnaXN0ZXIgIi9kZXYvdmlkZW9YIiBkZXZpY2Ugbm9kZSBpbiBwcm9iZSBw
cm9jZXNzLiBUaGUgZW5jb2Rlcg0KcmVhbCBoYXJkd2FyZSBkZXZpY2UgYXJlIG5vZGUgInZlbmNf
Y29yZTAiIGFuZCAidmVuY19jb3JlMSIsIGJpbmQgdGhlbQ0KdG8gInZlbmMiIGluIHByb2JlIHBy
b2Nlc3MuDQoNCj4gSXQgc2VlbXMgdGhpcyBzZXJpZXMgaXMgc29tZXdoYXQgcmVsYXRlZCB0byBZ
dW5mZWkncyAiW1BBVENIIHY1LA0KPiAwMC8xNV0gVXNpbmcgY29tcG9uZW50IGZyYW1ld29yayB0
byBzdXBwb3J0IG11bHRpIGhhcmR3YXJlIGRlY29kZSIsDQo+IGJ1dCBJIGRvbid0IHNlZSBhIGRl
dmljZSB0cmVlIHBhdGNoIGVpdGhlciBpbiB0aGF0IHNlcmllcy4NCj4gDQo+IEdpdmVuIHRoaXMg
aXMgYSBjb21wbGV4IGFyY2hpdGVjdHVyZSwgSSBkb24ndCBrbm93IGlmIGl0DQo+IG1ha2VzIHNl
bnNlIHRvIGRpc2N1c3MgZGVjb2RlciBhbmQgZW5jb2RlciBpbmRlcGVuZGVudGx5Lg0KPiANCj4g
SWYgeW91IGd1eXMgdW5pZnkgdGhlIHR3byBzZXJpZXMsIGFuZCBhZGQgdGhlIGRldmljZSB0cmVl
IHBhdGNoZXMgZm9yDQo+IGl0LA0KPiBvciBhdCBsZWFzdCBmb3IgdGhlIG1vc3QgY29tcGxleCBj
YXNlcywgbWF5YmUgdGhhdCB3aWxsIHN1cmZhY2UgdGhlDQo+IGFyY2hpdGVjdHVyZSBtb3JlIGNs
ZWFybHkgYW5kIGNvbWUgdXAgd2l0aCBhbiBlYXNpZXIgc29sdXRpb24gdGhhdA0KPiBkb2Vzbid0
IGludm9sdmUNCj4gYW4gYXN5bmMgZnJhbWV3b3JrIHRvIHB1bGwgaW4gdGhlIHBhcnRzIHRvZ2V0
aGVyLg0KPiANCj4gVGhhbmtzLA0KPiBFemVxdWllbA0KDQpZZXMsIHRoaXMgc2VyaWVzIGhhdmUg
YSBzaW1pbGFyIHB1cnBvc2Ugd2l0aCBZdW5mZWkncyBwYXRjaCwgaGUgaGFzIGENCnJlcXVpcmVt
ZW50IGZvciBkdWFsIGNvcmVzIGRlY29kZXIsIG1pbmUgYXJlIGR1YWwgY29yZXMgZW5jb2Rlciwg
YWJvdXQNCnRoZSB1c2FnZSBvZiBmcmFtZXdvcmsgY29tcG9uZW50LCBpdCBjYW4gYmUgZGlzY3Vz
c2VkIHRvZ2V0aGVyLg0KDQpUaGFua3MNCg0KDQo=
