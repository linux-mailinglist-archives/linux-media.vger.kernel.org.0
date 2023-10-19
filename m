Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1390C7CF18A
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 09:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344886AbjJSHo7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 03:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234920AbjJSHo5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 03:44:57 -0400
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16EB8123
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 00:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1697701492; x=1700293492;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=fdcL6EvE3CumNtCeY/M47PaRS3udeXioMDl6Obp26ZU=;
        b=iXKFwsCYie1qzi0HJw6GREpteBZXTaOaZSFHKscTZGuLW7YXGhu90jk36uPR7wZ4
        j+OnD9z3u5H0d5tbSbXnVpqqVGZBmaGBg1dEzHGiCambTU8nM2Wm6HN115a2PKlY
        Wue2KMiieYEUUlO1hIGqIcsRut9fTdg4Gspqf/D32/Y=;
X-AuditID: ac14000a-6d65670000001e37-bd-6530de7490c1
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id C7.64.07735.47ED0356; Thu, 19 Oct 2023 09:44:52 +0200 (CEST)
Received: from Berlix.phytec.de (172.25.0.12) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Thu, 19 Oct
 2023 09:44:52 +0200
Received: from Berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4]) by
 berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4%4]) with mapi id 15.01.2507.006;
 Thu, 19 Oct 2023 09:44:52 +0200
From:   =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "upstream@phytec.de" <upstream@phytec.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "martink@posteo.de" <martink@posteo.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "kernel@puri.sm" <kernel@puri.sm>,
        "rmfrfs@gmail.com" <rmfrfs@gmail.com>
Subject: Re: [PATCH] media: imx: imx7-media-csi: Sync frames to start of frame
 for MIPI
Thread-Topic: [PATCH] media: imx: imx7-media-csi: Sync frames to start of
 frame for MIPI
Thread-Index: AQHaAbkGFvtAMNVMikKKnLlRyYX9ibBQm04A
Date:   Thu, 19 Oct 2023 07:44:52 +0000
Message-ID: <ecac5edfa99e0f41eeba6a6176f5ed1c0da949d9.camel@phytec.de>
References: <20231017150854.270003-1-s.riedmueller@phytec.de>
         <20231018114819.GE11118@pendragon.ideasonboard.com>
In-Reply-To: <20231018114819.GE11118@pendragon.ideasonboard.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.0.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <29F2D89F86367543997911CBD46E7AA6@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsWyRpKBV7fknkGqwYReXYuHV/0tVk3dyWIx
        v20Gi0XnxCXsFl2/VjJb9GzYympxbcVEVotlm/4wWTQueM9i8Xf7JhaLF1vEHbg9ds66y+4x
        u2Mmq8emVZ1sHhvf7WDy6P9r4PHrsKjHox23GD0+b5IL4IjisklJzcksSy3St0vgynj9dilL
        wQ35ikvTWtgaGD/IdTFyckgImEisvXyOqYuRi0NIYAmTxMSFB1ghnPuMEssuvmSHcDYwSty8
        38UK0sIm4CLxue0bWxcjB4eIgLfEzzlOIDXMAr+ZJRpef2cEqREWiJS4/e0LM4gtIhAl8Xfl
        ByjbSOLOtmVsIDaLgKrE7q8XmUBsXgE3iZu/9oLVCAmUSDxunckCYnMKOEjsPNwHNpNRQFai
        s+EdWD2zgLjEpmffWSFeEJBYsuc8M4QtKvHy8T+ouLzEiVvTmEDuZBbQlFi/Sx+i1UJia+ta
        dghbUWJK90N2iBMEJU7OfMIygVF8FpINsxC6ZyHpnoWkexaS7gWMrKsYhXIzk7NTizKz9Qoy
        KktSk/VSUjcxgqJehIFrB2PfHI9DjEwcjIcYJTiYlUR4VT0MUoV4UxIrq1KL8uOLSnNSiw8x
        SnOwKInz3u9hShQSSE8sSc1OTS1ILYLJMnFwSjUwslzryzGzeGyRutPxcfcRIbdOnv+cHm//
        6mn89lx+sDnpds2Hu86FzfqVP/e3PTBcfSnqrvWVBgbTbu8JHqpWsvYTvbOnWPE0KfzzXnGR
        u7D3Uq3YV6E74h/2PEovl7iUumLmcf7y6FlbLi6apV3h9rT39p5I783TvIIk3Xaukuk+rVi8
        f+IiJZbijERDLeai4kQAJCID3ugCAAA=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmFudCwNCg0KT24gV2VkLCAyMDIzLTEwLTE4IGF0IDE0OjQ4ICswMzAwLCBMYXVyZW50
IFBpbmNoYXJ0IHdyb3RlOg0KPiBIaSBTdGVmYW4sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBw
YXRjaC4NCj4gDQo+IE9uIFR1ZSwgT2N0IDE3LCAyMDIzIGF0IDA1OjA4OjU0UE0gKzAyMDAsIFN0
ZWZhbiBSaWVkbcO8bGxlciB3cm90ZToNCj4gPiBUaGUgZGVmYXVsdCBiZWhhdmlvciBmb3IgYSBi
YXNlIGFkZHJlc3MgY2hhbmdlIGlzIHRvIGRvIGl0IGF1dG9tYXRpY2FsbHkNCj4gPiBhZnRlciBh
IERNQSBjb21wbGV0aW9uLiBUaGlzIGNhbiBsZWFkIHRvIHRoZSBzaXR1YXRpb24sIHdlcmUgb25l
DQo+ID4gY29ycnVwdGVkIGZyYW1lLCB3aXRoIGxlc3MgbGluZXMgdGhhbiBjb25maWd1cmVkLCBy
ZXN1bHRzIGluIGFsbA0KPiA+IGZvbGxvd2luZyBmcmFtZXMgYmVpbmcgY29ycnVwdGVkIGFzIHdl
bGwsIGR1ZSB0byBhIG1pc3NpbmcNCj4gPiByZS1zeW5jaHJvbml6YXRpb24gdG8gdGhlIGJlZ2lu
bmluZyBvZiB0aGUgbmV4dCBmcmFtZS4NCj4gPiANCj4gPiBGaXggdGhpcyBieSBjb25maWd1cmlu
ZyB0aGUgYmFzZSBhZGRyZXNzIHN3aXRjaCB0byBiZSBzeW5jZWQgd2l0aCB0aGUNCj4gPiBzdGFy
dCBvZiBmcmFtZSBldmVudC4NCj4gPiANCj4gPiBDdXJyZW50bHkgdGhpcyBpcyBhbHJlYWR5IGlt
cGxlbWVudGVkIGZvciB0aGUgcGFyYWxsZWwgaW50ZXJmYWNlLiBUbw0KPiA+IGhhdmUgaXQgd2l0
aCBNSVBJIGFzIHdlbGwsIHNpbXBseSBjb25maWd1cmUgaXQgdW5jb25kaXRpb25hbGx5Lg0KPiA+
IA0KPiA+IFRlc3RlZCBvbiBpLk1YIDhNTS4NCj4gDQo+IEkgcmVjYWxsIG5vdCBkb2luZyB0aGlz
IHVuY29uZGl0aW9uYWxseSBhcyBpdCBkaWRuJ3Qgd29yayBvbiBzb21lIG9mIHRoZQ0KPiBwbGF0
Zm9ybXMgSSB3YXMgdGVzdGluZywgYnV0IEknbSBub3Qgc3VyZSBvZiB0aGUgZGV0YWlscyBhbnlt
b3JlLiBJJ2xsDQo+IHJldGVzdCBvbiBpLk1YNy4NCg0KVGhhbmtzIQ0KDQo+IERvIHdlIGhhdmUg
YW55IGJ1ZmZlciBvdmVyZmxvdyBwcm90ZWN0aW9uIGluIHRoaXMgbW9kZSA/IElmIHRoZSBzZW5z
b3INCj4gaGFwcGVucyB0byBzZW5kIG1vcmUgbGluZXMgdGhhbiBleHBlY3RlZCwgd2lsbCBleHRy
YSBsaW5lcyBiZSBkcm9wcGVkLA0KPiBvciBvdmVyZmxvdyB0aGUgYnVmZmVyID8NCg0KQXMgZmFy
IGFzIEkgdW5kZXJzdGFuZCB0aGUgaW14OG1tIHJlZmVyZW5jZSBtYW51YWwsIEkgdGhpbmsgdGhl
cmUgaXMgYSBidWZmZXINCm92ZXJmbG93IHByb3RlY3Rpb24sIGluIHRoZSBmb3JtIHRoYXQgdGhl
IERNQSB3aWxsIG9ubHkgd3JpdGUgdGhlIGFtb3VudCBvZg0KZGF0YSB3aGljaCB3YXMgY29uZmln
dXJlZCBpbiBDU0lfSU1BR19QQVJBLiBJZiBhZGRpdGlvbmFsIGRhdGEgYXJyaXZlcyBvbiB0aGUN
CmJ1cywgd2l0aG91dCBhIG5ldyBzdGFydCBvZiBmcmFtZSBldmVudCwgYSBuZXcgRE1BIHRyYW5z
ZmVyIHdpbGwgYmUgdHJpZ2dlcmVkDQpldmVudHVhbGx5LiBTaW5jZSB0aGVyZSB3YXMgbm8gYmFz
ZSBhZGRyZXNzIGNoYW5nZSwgZHVlIHRvIHRoZSBtaXNzaW5nIHN0YXJ0DQpmcmFtZSBldmVudCwg
dGhlIG5ldyBETUEgdHJhbnNmZXIgd2lsbCB1c2UgdGhlIHNhbWUgYnVmZmVyIGFzIGJlZm9yZSBh
bmQNCmNvcnJ1cHQgdGhhdCBkYXRhLiBCdXQgYWxsIHN1YnNlcXVlbnQgZnJhbWVzIHdpbGwgYmUg
b2sgc2luY2UgYSBuZXcgZnJhbWUgd2lsbA0KdHJpZ2dlciB0aGUgc3RhcnQgb2YgZnJhbWUgZXZl
bnQgYW5kIHRodXMgYSBiYXNlIGFkZHJlc3MgY2hhbmdlLg0KDQoNClJlZ2FyZHMsDQpTdGVmYW4g
IA0KDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBSaWVkbcO8bGxlciA8cy5yaWVkbXVl
bGxlckBwaHl0ZWMuZGU+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL254
cC9pbXg3LW1lZGlhLWNzaS5jIHwgNiArKystLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDctbWVkaWEtY3NpLmMNCj4gPiBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbnhwL2lteDctbWVkaWEtY3NpLmMNCj4gPiBpbmRleCAxNTA0OWM2YWFiMzcu
LjBjOWUzZjAxZTk2ZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254
cC9pbXg3LW1lZGlhLWNzaS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAv
aW14Ny1tZWRpYS1jc2kuYw0KPiA+IEBAIC01MjksMTMgKzUyOSwxMyBAQCBzdGF0aWMgdm9pZCBp
bXg3X2NzaV9jb25maWd1cmUoc3RydWN0IGlteDdfY3NpICpjc2ksDQo+ID4gwqAJCXN0cmlkZSA9
IG91dF9waXgtPndpZHRoOw0KPiA+IMKgCX0NCj4gPiDCoA0KPiA+ICsJY3IxOCB8PSBCSVRfQkFT
RUFERFJfU1dJVENIX0VOIHwgQklUX0JBU0VBRERSX1NXSVRDSF9TRUwgfA0KPiA+ICsJCUJJVF9C
QVNFQUREUl9DSEdfRVJSX0VOOw0KPiA+ICsNCj4gPiDCoAlpZiAoIWNzaS0+aXNfY3NpMikgew0K
PiA+IMKgCQljcjEgPSBCSVRfU09GX1BPTCB8IEJJVF9SRURHRSB8IEJJVF9HQ0xLX01PREUgfA0K
PiA+IEJJVF9IU1lOQ19QT0wNCj4gPiDCoAkJwqDCoMKgIHwgQklUX0ZDQyB8IEJJVF9NQ0xLRElW
KDEpIHwgQklUX01DTEtFTjsNCj4gPiDCoA0KPiA+IC0JCWNyMTggfD0gQklUX0JBU0VBRERSX1NX
SVRDSF9FTiB8IEJJVF9CQVNFQUREUl9TV0lUQ0hfU0VMDQo+ID4gfA0KPiA+IC0JCQlCSVRfQkFT
RUFERFJfQ0hHX0VSUl9FTjsNCj4gPiAtDQo+ID4gwqAJCWlmIChvdXRfcGl4LT5waXhlbGZvcm1h
dCA9PSBWNEwyX1BJWF9GTVRfVVlWWSB8fA0KPiA+IMKgCQnCoMKgwqAgb3V0X3BpeC0+cGl4ZWxm
b3JtYXQgPT0gVjRMMl9QSVhfRk1UX1lVWVYpDQo+ID4gwqAJCQl3aWR0aCAqPSAyOw0KPiANCg==
