Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD6AC7CD5E5
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 10:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344542AbjJRIC7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 04:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjJRIC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 04:02:58 -0400
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 155EFBC
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 01:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1697616173; x=1700208173;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+c5hQQZnUqwJW5VgfrtARDCsUaBoc+gy6NkUrro9jFY=;
        b=jwxpmzZpwLr0BkNm6GnloFHrQ/r+2Pc1YeThnlGEUUr3SBnUqFxJbQ9yCXZqwDVY
        whgtYa8unn4OKnNgOOtKQKAwYLlnI/psI4h1grtQQ5hc3MT91+dyNN9gMQfhfV87
        9CWPkWMY6K1w7NFPhVoPZA8lwyaaf+PlUs7R0nQdQjI=;
X-AuditID: ac14000a-6e25770000001e37-ad-652f912d9a67
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 70.F8.07735.D219F256; Wed, 18 Oct 2023 10:02:53 +0200 (CEST)
Received: from Berlix.phytec.de (172.25.0.12) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 18 Oct
 2023 10:02:53 +0200
Received: from Berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4]) by
 berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4%4]) with mapi id 15.01.2507.006;
 Wed, 18 Oct 2023 10:02:53 +0200
From:   =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To:     "festevam@gmail.com" <festevam@gmail.com>
CC:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "martink@posteo.de" <martink@posteo.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "upstream@phytec.de" <upstream@phytec.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "kernel@puri.sm" <kernel@puri.sm>,
        "rmfrfs@gmail.com" <rmfrfs@gmail.com>
Subject: Re: [PATCH] media: imx: imx7-media-csi: Sync frames to start of frame
 for MIPI
Thread-Topic: [PATCH] media: imx: imx7-media-csi: Sync frames to start of
 frame for MIPI
Thread-Index: AQHaAREcHXWyo39OBkqeluC/+qfsL7BPD1GA
Date:   Wed, 18 Oct 2023 08:02:53 +0000
Message-ID: <42d4b23505b300be9f3263865d8539a3aecda553.camel@phytec.de>
References: <20231017150854.270003-1-s.riedmueller@phytec.de>
         <CAOMZO5CcseMy+JmBM2R=NZR0UfiLCdHwAsTv4_JqPqtaXf6Ypw@mail.gmail.com>
In-Reply-To: <CAOMZO5CcseMy+JmBM2R=NZR0UfiLCdHwAsTv4_JqPqtaXf6Ypw@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.0.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0ACDB782C96B6A47B437CDFD057A4CE0@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsWyRpKBV1d3on6qwcUF0hYPr/pbrJq6k8Vi
        ftsMFovOiUvYLbp+rWS26NmwldXi2oqJrBbLNv1hsmhc8J7F4u/2TSwWL7aIO3B77Jx1l91j
        dsdMVo9NqzrZPDa+28Hk0f/XwOPXYVGPRztuMXp83iQXwBHFZZOSmpNZllqkb5fAldF6yrag
        hbfi08OpLA2MN3i6GDk5JARMJLp+PGQEsYUEljBJNGx27GLkArLvM0osuDSbHcLZwCgx98on
        ZpAqNgEXic9t39hAbBEBXYkVJ7oYQYqYBWaySGy+cJcFJCEsEClx+9sXZoiiKIm/Kz9A2UYS
        pxf0gK1jEVCV2LH3JxOIzSvgJrHh7Bk2iG2tjBIzW8+BFXEKBEpM2XgCbCijgKxEZ8M7sAZm
        AXGJTc++s0L8ICCxZM95ZghbVOLl439QcXmJE7emAdVzANVrSqzfpQ/RaiHx5eh0ZghbUWJK
        90N2iBsEJU7OfMIygVF8FpINsxC6ZyHpnoWkexaS7gWMrKsYhXIzk7NTizKz9QoyKktSk/VS
        UjcxgqJehIFrB2PfHI9DjEwcjIcYJTiYlUR404N1UoV4UxIrq1KL8uOLSnNSiw8xSnOwKInz
        3u9hShQSSE8sSc1OTS1ILYLJMnFwSjUw8lXfyvWqetJSnphVr3Diy9yEK2zzPjTvqLdWux2v
        +07wSW73iW/x38/M9S4SXR1eHDOtZNIT/vdJPMGPOFo/y/dL6J7RUvqbeVNCTnSlMve0hPiW
        B5s5WtfdOmm0pFH2W+USj4JVjHuuukRHnuv9ISproXp39XzxCh2ZoBeqc39dEtxQ5PNEiaU4
        I9FQi7moOBEAZz7eeOgCAAA=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRmFiaW8sDQoNCk9uIFR1ZSwgMjAyMy0xMC0xNyBhdCAxMjo0NiAtMDMwMCwgRmFiaW8gRXN0
ZXZhbSB3cm90ZToNCj4gSGkgU3RlZmFuLA0KPiANCj4gT24gVHVlLCBPY3QgMTcsIDIwMjMgYXQg
MTI6MDnigK9QTSBTdGVmYW4gUmllZG3DvGxsZXINCj4gPHMucmllZG11ZWxsZXJAcGh5dGVjLmRl
PiB3cm90ZToNCj4gPiANCj4gPiBUaGUgZGVmYXVsdCBiZWhhdmlvciBmb3IgYSBiYXNlIGFkZHJl
c3MgY2hhbmdlIGlzIHRvIGRvIGl0IGF1dG9tYXRpY2FsbHkNCj4gPiBhZnRlciBhIERNQSBjb21w
bGV0aW9uLiBUaGlzIGNhbiBsZWFkIHRvIHRoZSBzaXR1YXRpb24sIHdlcmUgb25lDQo+ID4gY29y
cnVwdGVkIGZyYW1lLCB3aXRoIGxlc3MgbGluZXMgdGhhbiBjb25maWd1cmVkLCByZXN1bHRzIGlu
IGFsbA0KPiA+IGZvbGxvd2luZyBmcmFtZXMgYmVpbmcgY29ycnVwdGVkIGFzIHdlbGwsIGR1ZSB0
byBhIG1pc3NpbmcNCj4gPiByZS1zeW5jaHJvbml6YXRpb24gdG8gdGhlIGJlZ2lubmluZyBvZiB0
aGUgbmV4dCBmcmFtZS4NCj4gPiANCj4gPiBGaXggdGhpcyBieSBjb25maWd1cmluZyB0aGUgYmFz
ZSBhZGRyZXNzIHN3aXRjaCB0byBiZSBzeW5jZWQgd2l0aCB0aGUNCj4gPiBzdGFydCBvZiBmcmFt
ZSBldmVudC4NCj4gPiANCj4gPiBDdXJyZW50bHkgdGhpcyBpcyBhbHJlYWR5IGltcGxlbWVudGVk
IGZvciB0aGUgcGFyYWxsZWwgaW50ZXJmYWNlLiBUbw0KPiA+IGhhdmUgaXQgd2l0aCBNSVBJIGFz
IHdlbGwsIHNpbXBseSBjb25maWd1cmUgaXQgdW5jb25kaXRpb25hbGx5Lg0KPiA+IA0KPiA+IFRl
c3RlZCBvbiBpLk1YIDhNTS4NCj4gDQo+IFNob3VsZCB0aGlzIGNvbnRhaW4gYSBGaXhlcyB0YWc/
IFRoYW5rcw0KDQpOb3cgdGhhdCB5b3UgbWVudGlvbiBpdCwgSSBndWVzcyBpdCBjb3VsZC4gSSdt
IGp1c3Qgbm90IHN1cmUgd2hpY2ggY29tbWl0IHRvDQpzZWxlY3QgZm9yIHRoZSBmaXhlcyB0YWcu
IEkgdGhpbmsgdGhpcyBpc3N1ZSBpcyB0aGVyZSBzaW5jZSBkYXkgb25lIG9mIHRoZQ0KZHJpdmVy
LCBidXQgSSBkb3VidCB0aGF0IGl0IHdvdWxkIGFwcGx5IG9uIGV2ZXJ5IHZlcnNpb24gb2YgaXQu
IFRoZSBmaXhlcyB0YWcNCmlzIHRvIHRyaWdnZXIgYSBzdGFibGUgZml4LCByaWdodD8gT3IgaXMg
aXQganVzdCBtZWFudCBhcyBhIG5vdGU/DQoNCkRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucz8N
Cg0KVGhhbmtzLA0KU3RlZmFuDQo=
