Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3679265C18
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 10:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgIKI70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 04:59:26 -0400
Received: from mail-eopbgr1410120.outbound.protection.outlook.com ([40.107.141.120]:8928
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725783AbgIKI7S (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 04:59:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JR9SjLUuKqN7D2TtQ79L27e+635nEiPTgRW8YNS4uTbJB3DijDXUNxjvBzyVEXZ1i91mjkpGEUbAem9X2bvNZhzaGFtkbH/kH1Ce3BeO/8x5fkQJ3o7ZufdXx3S46UScjl6KbOtstIEquN/Mxk4xidDJc9tT+0GCjfGf5TdBJ6Tn/2vJr2L2j0VYT+Ky3CPpMsrGzqiFlRJ3Obm06OZYHKhLq3bJxLyOw6Q2Q79mrz075IwEWOQZDvlIRW+hhn6FwE9HiOu/xdjj94XqDDELr/Pu+uzFxhO572DyrObj3RhNcm3G/1AzbiaLLoiMb+QCa0lvTH8PmjUfyKxdpzJmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TmDflnWz40M7ga8eJq74wW1IWiW2z2NHf6I7rjeY28=;
 b=e5wNwwoQUxpDippiyJ0yBn6oH1cV9FEhybhHNjG0DLFfqlm/RWa11uHlGII8Jg+U797rdnGkDt91jrdZOZosyr6pkEFZiTQLx/AeY9/HRv/CT6tPeKgUm39A0r9bfr8NxDnKm9EpCtFtDT0sp+bMcRp0L65zPG+8luohoJpRZUbvT5zPPBovs8R+onQqEYGLTUvmmtDEmNzrQlJ8wh2pFG9y6C/x1UTUF3WvU26XvuMTWLr3r4iljoMjMAzGCZi+8nL0smMcz4rIotEyPzC9oHuygjK0E5I72GSLANqoniKH4PuMm+yY7kJ78++G2BQrLNO4X3Yqu2G+LoLcCeWHDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TmDflnWz40M7ga8eJq74wW1IWiW2z2NHf6I7rjeY28=;
 b=b7+DvHV685vf3U7eO6SYdgngsVtjPDHoFPfIQFpzu4k6F7c7yN0lRyPP3MnqgtiKS2MvYEGj8aIcKz/psMPThCELI12QxP3Klt9XUknpk1gpkd4jlUl3gjUhJqgr4tZs+oUahPXKQxJgvja8OYnOa8Eh402wj4D/QGLDNaUzKbc=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OSBPR01MB5046.jpnprd01.prod.outlook.com (2603:1096:604:7b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 08:59:13 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::cdbe:6988:b51c:51a3]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::cdbe:6988:b51c:51a3%6]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 08:59:13 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v5 2/3] dt-bindings: media: ov772x: Make bus-type
 mandatory
Thread-Topic: [PATCH v5 2/3] dt-bindings: media: ov772x: Make bus-type
 mandatory
Thread-Index: AQHWh43k71JChNqS1EGqGfC4KPnIw6li7EyAgAA4EID////lkA==
Date:   Fri, 11 Sep 2020 08:59:13 +0000
Message-ID: <OSBPR01MB5048CACE31FB094F753F4F55AA240@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <20200910162055.614089-1-jacopo+renesas@jmondi.org>
 <20200910162055.614089-3-jacopo+renesas@jmondi.org>
 <20200911053757.GF6566@paasikivi.fi.intel.com>
 <20200911085837.kyxx3p465ovowcel@uno.localdomain>
In-Reply-To: <20200911085837.kyxx3p465ovowcel@uno.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 50379594-c299-47b9-714f-08d85630f48f
x-ms-traffictypediagnostic: OSBPR01MB5046:
x-microsoft-antispam-prvs: <OSBPR01MB5046CBC891A0375D5BF2AE04AA240@OSBPR01MB5046.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JOPP9pXGkQBEJ/Z4h3pwj6YWxQjIcm1ZGAW8KIc1dgHBbWO69eUtR+kh4Mk24r/VSXQo7Uy/43LvbJX8e5ZCxZ1T6RxhqhIxB4F3SLfk9N7CV8Y6Ye5WFrqfuygTFpEQYbKHcTwckcT6jBT/BtGvZyDh2Ut1YhAJlv04fMkwgdVAIpnJvqLeZhzvV2Ez8UTaWz9q5ta3GjJZVKR8d9xqy7/byVlZAsk8fyvC//x7qQAZ5LDVJevREzFvAl1WEdHyfYTjdIJrNfqjIdJgaM5hWUo+dCeSSE8BpWMnBIcjocoPjfXyjelBBQTorAGOjW0Yh/dvbxg6taIaQ+ntp34Scg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(110136005)(5660300002)(2906002)(6506007)(86362001)(8936002)(478600001)(53546011)(66556008)(83380400001)(316002)(7416002)(7696005)(54906003)(33656002)(71200400001)(66476007)(64756008)(55016002)(26005)(8676002)(186003)(76116006)(4326008)(66946007)(52536014)(66446008)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: GJzo2/0Tj+6URqOm+ekfVlMXpf+GqRF9v+uKY+4f+Hc8NHnf+m/1O5m9TjXXx15cStrkqlwpnPq7/brD8I6dF/ZFkN37SWC6GpONrcq+h8qhUk41rBwKpNfpTWg8qA8anzSYOd37bouuexfuJfvWuABtSH9KgdxfQLSNUDVK1gmys2ypHgUeTbLnNqK1FFS1ALW9NFZMFF9nhFLmRnNQNGPgM75RnjMGh4LlZLxbhIe9cSiHVhmQu6YRBvlNJR66MG9NHj31YtrWJBm1ZXBWuRxdbb5m7AsaHUTGTLb37+3dsB+8GtpgPLX75XXjKczKtPrDFNS5bG5no4zqGcyaZk8oNZfJ0gDxl8LdGPm+h7pBLCIk4XJVGXmd04DRq1cL1OOl+/p9Qe2RXLPf1Jd11kbuLHBRq3mtTq11LvVZ/cZ2ELf6oyuRIQEAVGLbgwmDKWooO+e2jJTLLf+lR+n1bYplH4m1062FVqDAeQS9GAD9A+RGiXHN5mAvg0iyza1J8ag3ngOnWYpSiYdWhWSEyY1dhScPqRVsVNV8VJRmzj52q2iuNgcmbALXbYQBlW+4ybNKTqposctGlFZBoPdPdnP/PptFWIPSOzC1orp1tk9sQ+K8LRhDiS75kZpJ8szXtA29riqjFCQmScYpmx+HKg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50379594-c299-47b9-714f-08d85630f48f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 08:59:13.0827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 92xdwTIm8V0udqAb6s8dyIY5uBp08kC/FvGXDa91Br4L/osryDAejR/JTQ4G7YUybcQujLwcQL9x71h6vknkyM3h9Wei/86kL5TIqzQvEbB9CEWIvUiLuhquoEtmGU0r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5046
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSmFjb3BvLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphY29w
byBNb25kaSA8amFjb3BvQGptb25kaS5vcmc+DQo+IFNlbnQ6IDExIFNlcHRlbWJlciAyMDIwIDA5
OjU5DQo+IFRvOiBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+DQo+
IENjOiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+OyByb2JoK2R0QGtl
cm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1tZWRpYUB2Z2VyLmtl
cm5lbC5vcmc7IExhZCwNCj4gUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT47
IG1jaGVoYWJAa2VybmVsLm9yZzsgaHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sOyBsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb207IGxpbnV4LQ0KPiByZW5lc2FzLXNvY0B2Z2VyLmtlcm5l
bC5vcmc7IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBQcmFiaGFrYXIgTWFoYWRldiBM
YWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2NSAyLzNdIGR0LWJpbmRpbmdzOiBtZWRpYTogb3Y3NzJ4OiBNYWtlIGJ1cy10
eXBlIG1hbmRhdG9yeQ0KPg0KPiBIaSBTYWthcmksDQo+DQo+IE9uIEZyaSwgU2VwIDExLCAyMDIw
IGF0IDA4OjM3OjU3QU0gKzAzMDAsIFNha2FyaSBBaWx1cyB3cm90ZToNCj4gPiBIaSBKYWNvcG8s
DQo+ID4NCj4gPiBPbiBUaHUsIFNlcCAxMCwgMjAyMCBhdCAwNjoyMDo1NFBNICswMjAwLCBKYWNv
cG8gTW9uZGkgd3JvdGU6DQo+ID4gPiBJbiBvcmRlciB0byBlc3RhYmxpc2ggcmVxdWlyZWQgcHJv
cGVydGllcyBiYXNlZCBvbiB0aGUgc2VsZWN0ZWQNCj4gPiA+IGJ1cyB0eXBlLCBtYWtlIHRoZSAn
YnVzLXR5cGUnIHByb3BlcnR5IG1hbmRhdG9yeS4gQXMgdGhpcyBjaGFuZ2UNCj4gPiA+IGRvY3Vt
ZW50cyBhbiBlbmRwb2ludCBwcm9wZXJ0eSwgYWxzbyBkb2N1bWVudCB0aGUgJ3JlbW90ZS1lbmRw
b2ludCcNCj4gPiA+IG9uZSBub3cgdGhhdCB0aGUgJ2VuZHBvaW50JyBzY2hlbWEgaGFzIGJlZW4g
ZXhwYW5kZWQuDQo+ID4gPg0KPiA+ID4gQmluYXJ5IGNvbXBhdGliaWxpdHkgd2l0aCBleGlzdGlu
ZyBEVEIgaXMga2VwdCBhcyB0aGUgZHJpdmVyIGRvZXMgbm90DQo+ID4gPiBlbmZvcmNlIHRoZSBw
cm9wZXJ0eSB0byBiZSBwcmVzZW50LCBhbmQgc2hhbGwgZmFsbC1iYWNrIHRvIGRlZmF1bHQNCj4g
PiA+IHBhcmFsbGVsIGJ1cyBjb25maWd1cmF0aW9uLCB3aGljaCB3YXMgdGhlIG9ubHkgc3VwcG9y
dGVkIGJ1cyB0eXBlLCBpZg0KPiA+ID4gdGhlIHByb3BlcnR5IGlzIG5vdCBzcGVjaWZpZWQuDQo+
ID4NCj4gPiBDb3VsZCB5b3UgYWRkIGEgY29tbWVudCBvbiB0aGlzIHRvIHRoZSBkcml2ZXIsIHNv
IHRoaXMgZmVhdHVyZSBpc24ndA0KPiA+IGFjY2lkZW50YWxseSByZW1vdmVkPw0KPg0KPiBTdXJl
LCBjYW4gSSBzZW5kIGEgcGF0Y2ggaW4gcmVwbHkgdG8gdGhpcyBzZXJpZXMgdG8gYXZvaWQgYSB2
NiA/DQpJZiB5b3UgZG9u4oCZdCBtaW5kIElsbCBoYW5kbGUgdGhpcyBhcyBwYXJ0IG9mIGJ0NjU2
IGFkZGl0aW9ucyA/DQoNCkNoZWVycywNClByYWJoYWthcg0KDQoNClJlbmVzYXMgRWxlY3Ryb25p
Y3MgRXVyb3BlIEdtYkgsIEdlc2NoYWVmdHNmdWVocmVyL1ByZXNpZGVudDogQ2Fyc3RlbiBKYXVj
aCwgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0L1JlZ2lzdGVyZWQgb2ZmaWNlOiBEdWVzc2VsZG9yZiwg
QXJjYWRpYXN0cmFzc2UgMTAsIDQwNDcyIER1ZXNzZWxkb3JmLCBHZXJtYW55LCBIYW5kZWxzcmVn
aXN0ZXIvQ29tbWVyY2lhbCBSZWdpc3RlcjogRHVlc3NlbGRvcmYsIEhSQiAzNzA4IFVTdC1JRE5y
Li9UYXggaWRlbnRpZmljYXRpb24gbm8uOiBERSAxMTkzNTM0MDYgV0VFRS1SZWcuLU5yLi9XRUVF
IHJlZy4gbm8uOiBERSAxNDk3ODY0Nw0K
