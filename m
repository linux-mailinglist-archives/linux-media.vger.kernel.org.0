Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A26125A7DF9
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 14:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbiHaMvh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 08:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbiHaMve (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 08:51:34 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2103.outbound.protection.outlook.com [40.107.114.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DEF1B8A68;
        Wed, 31 Aug 2022 05:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzFwvP8TKRBUdFA18cszVfy41UJucs0AOFhIwxtGZaV+ryLeSO1joB6uLyP52F4e8fzmV1p1xL5OMSTpYMxIyT4kQi02Sfsmv9W6JhxdwGIfudi+kFDgJiOmE6NlMv3Jv1O+BqKBUJXUfpWF24+1DKa2QFEKZ1lDSrWzHZp0DaykFbPXy+jhfQZf6sePwUxTAJSe7fItc7Ok05UGT4M9CYKNG1Bdc6kH6IViKmN0YiX7F4v1isYFFBDJRDJvzA6J2M7Vc6p5Cuam4xNlkQ7yc1UtzxHDs/Gdp+dT6tZXODuhVCVzJNS/MGL0oUI/jKvZ69QLVmUR8ke7PTfmaSwVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7n9EwRk87BWhNRvcWWF4NnWRqN+2PAI7AFXugXO43rI=;
 b=OvhtLb04eIV4TEz8b8uzHN157wxxenqj2LIYRC0IL6PXYIbxPVbjbPIPIu3wa431hpi5TapX3bPZafNK5pxRzEkSqPZ6YRBCHQBrMKmvQchqFLHsYj9QvSMSia2+qArTczE2w/Z/nD0OgjgMHZ26ei0T+D8aSPE4qDZrlN4Dh0lLuSPZk5kvrYcORDOkhmDvghJjOTmAf+jW+ZBw99UXg1ln5z7ZsbNtqxw39qUVBPRLu6ZwpYSgQbw+wzNYHdyevwhJRyVrKcc+hWjbpLW9nEezceXG5o1IYR/k6/OzDJQwwCETOTd/p3+2+Z1o2l3QcK1F971ASHDKG/f0Kov+7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7n9EwRk87BWhNRvcWWF4NnWRqN+2PAI7AFXugXO43rI=;
 b=JT6hd0FMIsnshxQLfevC3E9YZpUIFW52IeDCPJBqcusrSSurxgDFXsUiArufJCLtD83C/77bBRqiWR/VMimO04x1Ojn79eE/Xi2TlF3EVJiOCX5cwf+1nqhGpkKhTN38gpaJl7px432Kbf3j7CAMdtS05sE2Tei+96vHkIjgNVs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB4848.jpnprd01.prod.outlook.com (2603:1096:404:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 12:51:17 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%4]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 12:51:17 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 1/3] media: dt-bindings: media: renesas,fcp: Update
 maxItems for the clock property
Thread-Topic: [PATCH v3 1/3] media: dt-bindings: media: renesas,fcp: Update
 maxItems for the clock property
Thread-Index: AQHYvSG/eDWawvuveUaooXr5/3mHSK3I9VoAgAAAWDA=
Date:   Wed, 31 Aug 2022 12:51:17 +0000
Message-ID: <OS0PR01MB5922FD8E2374FBA8364F82F386789@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220831100913.1731285-1-biju.das.jz@bp.renesas.com>
 <20220831100913.1731285-2-biju.das.jz@bp.renesas.com>
 <9f5b5d88-c941-0fe7-d79c-3e1043bc97c2@linaro.org>
In-Reply-To: <9f5b5d88-c941-0fe7-d79c-3e1043bc97c2@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2391cd16-9838-437b-12b0-08da8b4f7edf
x-ms-traffictypediagnostic: TYAPR01MB4848:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /ge3zE0tkFzrh42ZI3zcTq81gqyfDZIP2hRcBneHKxLD5VMt5YfP0OkwcBcyHB1oaDqLAz+v3Ha8XgyDG4rKVvrOxbrmy1UhyYZogfEMw4mOgBX13CEGFZaUdVRdu2W3y0tzIcDSnoTFu59zh4pxZwVSmUyxiKLlPlZYnJH9SfK4sk2ALmKNdm14XsHnlMxV9H8GoYESp/xnRK5cvrhmWsLerNgi29H7MCWx+1i1784PhgIM86UMtqNYD2uSuZMwJx00xGSBR38b4vHytgTgt3CVCzSqsTZ4o1NSKOZ+iFUEamNdT/mFXP8UfvQXviM3OryrPWonAeXh90zcD7rVp/KF1GfD6y8qJDzlvLXroOfujn6K0tlizwvwC7A58VBKIRJovBBi87cbPcPQ4I9y4e+x86ZSd8v1w0nrxmYP2xp1s/BkkXgKnStMgXD6XgxBm9TknjQY0RTxJsQZiP/WTQXskEtgMKS5HY/w5Ak5iaV/yaH/2qGAdM7YdCEgpdIT/0rpTb/bNHjI/BMQBd7QCsAbGj6hvMwGae/sWXLEJLXDKjB/KVZwFquhMjMF3lERl6ICtrQgdLOWOFiMdYkqWz8vqaqzeDOXYj0BmlXcWMS5F0cYcs4WMFZsShlQqqrTYyKrKBS9gLqpSFfIx08b41Vv2gyRnPpldqWog3optIyxb8M8LGln/0C3aeIYLaelhhvTZL2xerNCE/MGEgf9JP5RkD8sfUG2DuqpOY8harDk1RsI/eR9QEUqLV4rXFthCNHXVT+e3DSh/evvhqjdFQoXUaY8uBVulXTmkYZL+Jg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(110136005)(53546011)(8936002)(38070700005)(41300700001)(52536014)(9686003)(83380400001)(26005)(6506007)(7696005)(966005)(478600001)(71200400001)(33656002)(186003)(66476007)(122000001)(38100700002)(76116006)(66556008)(66446008)(66946007)(4326008)(8676002)(55016003)(64756008)(316002)(5660300002)(86362001)(107886003)(54906003)(2906002)(15650500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emZMNVhFdVpTblFZclRDdFVZTFJNRjluMEhkelZkbGdPaVlyWFExNnhVdTFp?=
 =?utf-8?B?STFjUG5yRStvTnFnaGcvbStPdWVSV2JwekgzeUxUcWVWdkhWSGRBTTB5RzRP?=
 =?utf-8?B?MUUrZXJ5Ly9ybzRCb1FSMTRsZGxwQXlPb3EwRThUMWlMM1MzSkhGdTFWV1h3?=
 =?utf-8?B?MEtsU3lsUHF3MHZ0T0J2UHZOYTdiUjBzWDlaWTRvUkorbjI2MTQzZkZMSHUy?=
 =?utf-8?B?UzdWRnk0UGNxSDRQTlZ6RWIvOVFiWnFJVmt5VDdLU3BxSFhLMENZRUZOMlNH?=
 =?utf-8?B?dG9QSlEvL1F1bmdUVFBoK0x1OW9aa2dDSHBvWHNDcGdTbXBXMUY4MFZnMlRr?=
 =?utf-8?B?ODJ6WlRNam81OXl4U2JlL1puSXNwNzRqR05EWkZNVFRuSm5BMTdWWkl6K25X?=
 =?utf-8?B?NXkrSGJQMUtFUFdlVUtGZFNUejZqekJJRU9wQXp0SndUUGVkVEpieHA4ei9C?=
 =?utf-8?B?N3VtWENGeVBwUFdsc2ZSVkovVFYvdGVyTUplV1dpdENOTGFSQXJNSk0xZmZX?=
 =?utf-8?B?TXFGR21NWlE3OERlOEx6cTVyOXYzc0FKRnQwM3dUcVNmZERkdjFZN2cxZENG?=
 =?utf-8?B?OXZsUXlCNkRVNm4rbHl2Z21DME1QWmthbm4vOHRhVmxXZ0d4S0s1S3B4ZUhO?=
 =?utf-8?B?VGEyWW5hSno4S2pHZzV6UDk0TTBCOVAvY2FnLzVNZDdhbk1ETktJOTNyNTNw?=
 =?utf-8?B?eG5PWWszWWQxZGFYTFMvcmNzUVAzQWhDcWVCYjdCVDdNVDQ1UDdBeXFxaTNu?=
 =?utf-8?B?cUNLK1pONUtWTGUzYkVZZFdkOVQzLzBOc0htOW82UkZ3anJvK1NkWlFvM0Nj?=
 =?utf-8?B?OVBZTDV5Y085c01tdHlCZnlOeHBRZGFBVUkwQjJyY3FlMjBRTGpUZmYyWlFz?=
 =?utf-8?B?K0h3emovb1c5V01PMkFkS1pEUGdNL0VURENFcE45K2JJOE5yQzA3ZC9HVHZT?=
 =?utf-8?B?cWVQQ1g4Z1pkYlJZU1Z5SmF0RkdaWHhLeG1qL0YxdmduZEtDK2ViZTkxQnMv?=
 =?utf-8?B?UGEwNEc0dlo3Sm9MenZZNGpxY0VzYU5wN1pNV29rcXhyY0sxaGx2cUhWeDM4?=
 =?utf-8?B?V3VwMHY1My9FMXFuWTlPZ3ZSZ01lWnlMdmREeWllY0lZZ1o4M2U2dy9QcHlv?=
 =?utf-8?B?VWQ4OW4zRFpscDh2ckZlM2lvZWprNEp1bUhCcDFOaURyVzl4K3dBMmo1RFdN?=
 =?utf-8?B?bE9abGQzYVBJMFZoaE1ZUEQwZTNWM3dFVGcxMlBpVjB6WlpkOTlVNVcwb21X?=
 =?utf-8?B?WmlpY0tkMmJoaFpJTjhyVzNoL3d4YjNoQkd0cmx6cGdpcXZENDU2M0FZZE9T?=
 =?utf-8?B?NDRGL3JaYVMxRDFYSjlWbVJlTEgrVXBTazFhYTIvQWVmOHRqdFRUb0FYam1s?=
 =?utf-8?B?dXpRRjJnYVU4SktWOE5HcDNiTnErcFBmQ2c3V0RWZVczQzQ5cEFoOTFQWjY3?=
 =?utf-8?B?UjFYcTFaMjZwWlE3QVBsdXY5aDR2N3krSC9ZS2hRZ293Qm9JWHNMQ1Q3Mlpr?=
 =?utf-8?B?ci9LN3d2aGxJRnByaW9RdncwVk1xSEJoSHBvUU0xTi9iM0JIcWJua0FLQS9v?=
 =?utf-8?B?SWE3Q2VwQ1JNK0EyazJ0SjhqeVZwL1YwU01tUEJacSt2S1dKQi9iaW83WjQ4?=
 =?utf-8?B?TlZGeSsyZXBZd0x2V2pmT0xib3hOdWo4ckRrNit1clUvR01DRDA0SVl6dlVD?=
 =?utf-8?B?djFVYXVBNnhHaXJWMGVxcFV1aGY1VE5VMzdqZFVINGxua3VhUXVFSTdnbS9t?=
 =?utf-8?B?VXBEbXc3K0Z4UGJ6aVVIL0Z1dGZiVnpRamt4dFh1MVRGTDVzWUVsOVZNSVF1?=
 =?utf-8?B?VEtDQXZwaGc5a2VOVDkvY3NiNVdXRkl6dVpYUDR2ZGFkTkdVaUREbGo3R25S?=
 =?utf-8?B?b2gwNExUckhBRldlVFJRTEYrK2xjUGZ6SjA3eWw1VXhxWU1wNDI4MWJGSmdl?=
 =?utf-8?B?Vkt4Tm5zbkp3UXpQY0hjZ3NoV0U3V21VaXNqQW4ydDJXS3NCQUJnNjBwdE1N?=
 =?utf-8?B?eWNnU2wveGc1a2IyNjdYa3BFbC9BTnQ5TS9GUThLaVNXRndEMWhwRktUQU9R?=
 =?utf-8?B?dHAyYjZiVUJnSGxiaGVmUHVJbUcycUl2Y3EzQ3lVa0hqU3YvM212NTVuaTUx?=
 =?utf-8?B?SlU3b2U5SkwrczFWamlKKzA2b251UzN3MzluTlRiN3plc1RYb2dKRmtnYlVj?=
 =?utf-8?B?QXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2391cd16-9838-437b-12b0-08da8b4f7edf
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 12:51:17.2947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: trOlQP5GfDgqPBID3x3VJL9HyKI3lqxdt+EEXZ3eczkcx55UZ5a685Jpbfvw8eRDNdKLD8QZyI/2dHvT6BRqNA5xAMxakeuHsi5xMfJl27Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4848
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MyAxLzNdIG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6IHJl
bmVzYXMsZmNwOg0KPiBVcGRhdGUgbWF4SXRlbXMgZm9yIHRoZSBjbG9jayBwcm9wZXJ0eQ0KPiAN
Cj4gT24gMzEvMDgvMjAyMiAxMzowOSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gUlovRzJMIGhhcyAz
IHNoYXJlZCBjbG9ja3MgYmV0d2VlbiBkdSwgdnNwZCBhbmQgZmNwdmQuIFVwZGF0ZSB0aGUNCj4g
PiBiaW5kaW5ncyB0byByZWZsZWN0IHRoaXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9yZW5lc2FzLGZjcC55YW1sIHwgMyArKy0N
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9yZW5lc2FzLGZjcC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVkaWEvcmVuZXNhcyxmY3AueWFtbA0KPiA+IGluZGV4IDQzZjJmZWQ4Y2QzMy4uNDE5YjEx
MGUzNGZlIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9yZW5lc2FzLGZjcC55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL3JlbmVzYXMsZmNwLnlhbWwNCj4gPiBAQCAtMjksNyArMjksOCBA
QCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgbWF4SXRlbXM6IDENCj4gPg0KPiA+ICAgIGNsb2NrczoN
Cj4gPiAtICAgIG1heEl0ZW1zOiAxDQo+ID4gKyAgICBtaW5JdGVtczogMQ0KPiA+ICsgICAgbWF4
SXRlbXM6IDMNCj4gDQo+IFRoZSBjbG9ja3Mgc2hvdWxkIGJlIHN0cmljdGx5IGRlZmluZWQvZGVz
Y3JpYmVkLg0KDQpPSywgV2lsbCBEb2N1bWVudCBsaWtlIFsxXQ0KDQpbMV0gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9j
b21taXQvP2g9bmV4dC0yMDIyMDgzMSZpZD0xN2I1MTc5ZWY2Y2Q2NDMwOTQ1YzFkYTQxNzRjZWFm
NDNjOTNjZjFlDQoNCkNoZWVycywNCkJpanUNCg0K
