Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0303B70F0
	for <lists+linux-media@lfdr.de>; Tue, 29 Jun 2021 12:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbhF2Ku2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 06:50:28 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:34353 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbhF2Ku1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 06:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1624963679; x=1656499679;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OSbYvd2BCmSXGS45s+SgwcoWLF6L9/bOoqvid8SlZxY=;
  b=f/NGw4TynNtNY1rEdfPJgn9GpNZ7AAoD74fyO0Y+6SdLS+YF6gK6AbZu
   CdwSfGi+2HNuvlOyprbHK2fxf/YuJFy5+I8D/64mWXj8cj4tBpcqY3RHe
   H3q+iNWvCcje+Y4JWzFg1aNYc8yvi4Zgv4Pr2uSw7PpC1OopElENpaysu
   zTLUinV8bz33pYWH9vY6D8Q0mI/v8cEqr3i1ROddQoDXaFpZnpail0Ybw
   lbZ5hOBUM5LYoSh/v9D7CxbIiGBKh5ayqRMBE27/RMHm3X8PWTsN+K6bn
   04AvYU/v5yYjStmzfNmzAV48US5iWSQi7sp+a0gr3EsUDTMaTP3v1fEFS
   g==;
IronPort-SDR: B/JBgfpNmbxMtqTvBrevXvXWsRdUuuPDExBEmhKL5OQm9uuQOq6F9haOkc2dQZshmGIkdtsSyF
 LxTPkbGSEoMIGe4OmkseBp6cpITwFR4mPBE/zqAYpEfM6/fPgiEJ8ObqKD7M/pXFX6k3kqsepo
 vp5qduE4ft3nyQt1SAOn6uw00M8GYpL8BkujYe7t4/qmfJZ/THkpfwG9lpLfDoGqwl5/2opZ3R
 FCbyy2GQn4nmXTOhFZoi43PYnltscqSBitIO5gX4q7rmMNVshEGuNEqsx1cUh4OP1xSJ9aApha
 FeE=
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; 
   d="scan'208";a="60565358"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2021 03:47:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 29 Jun 2021 03:47:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Tue, 29 Jun 2021 03:47:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vr8vWz4VdZTQNmlnawYl4YmAkBG5yrLakOsi+EO60SjoeqDQG7plAuzbUyLPOH1EGlnRc82P0iwD769/xe0dB+OGsYE8Q+Z8Te/AKqMoR5kz8lZ0dq3XhUEdk/uSsrvjfewcAqg47md2LfhZjnvDqGQaMGCNQUUcYhbF4RlGVBHmAT1BvUkgwoDppWiFO0KwrXQMjrjy6qggUwrYiioPZd1JGbpVfhayc0KXiwRyZpeGWhnNNBBiwIGJRYjA7aPfhD6MBXU6corwIt+i0udY9SkYDZ/dO/Eu1nGwvpwCIwvN9yWJp0mS2sYRr1K1sgopcrj2vbhitwwdNS0+nDO41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSbYvd2BCmSXGS45s+SgwcoWLF6L9/bOoqvid8SlZxY=;
 b=LNjg+6drnpWZYKDVY235vjxU9BYUK2dw34IgJka0WlZTRbEOa1GHcRWNYFYXEuI2GmTj/O8sLpjju6xtK4v16hzk9bK3LJidPqQ/ZGfiL8Sx/7UTpHcVRa8TgcVCbZsszt+KR1wXOAtY36FF/z81KOSYcht0Xai1dj+Wkeef+m7jqG0nrf3snXITqVwI9DOpIYjgtSTgC/5gmuLhTIqlCL0Ny+LTX9TZgB4Yw8kXEqou5IIY1D7YsNeL3n5N+lzRo+iR6D1uzyUieX3DC2VGRIoXK7IoUX982hf4DjI70/cGnm6zBwV2p/a4oUAKWs+C21Z5TDAoGJhSQt/RBWca8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSbYvd2BCmSXGS45s+SgwcoWLF6L9/bOoqvid8SlZxY=;
 b=rrJZKJJH5Z4gLWHwfsi5gyK0tWu4fVtWwO8dfC2wX0U0ttwnXeLg5GQ7soocfCqonuR6ReaVlwho/OLoxjt1cMc9lsWPjYc6iaCN9BQFLjSkPU+zAqmsyYIDJZZ+2wE741eNNPSWZCzODXeJ7U0wlFmErlWoKVmorw3Jz46QVxY=
Received: from DM4PR11MB5519.namprd11.prod.outlook.com (2603:10b6:5:39e::7) by
 DM6PR11MB3643.namprd11.prod.outlook.com (2603:10b6:5:13f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18; Tue, 29 Jun 2021 10:47:56 +0000
Received: from DM4PR11MB5519.namprd11.prod.outlook.com
 ([fe80::f850:a0ec:53b9:606d]) by DM4PR11MB5519.namprd11.prod.outlook.com
 ([fe80::f850:a0ec:53b9:606d%6]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 10:47:56 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hugues.fruchet@st.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <jacopo+renesas@jmondi.org>, <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <slongerbeam@gmail.com>,
        <paul.kocialkowski@bootlin.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <biju.das.jz@bp.renesas.com>,
        <prabhakar.csengg@gmail.com>, <mchehab@kernel.org>
Subject: Re: [PATCH v4 1/6] media: i2c: ov5640: Remain in power down for DVP
 mode unless streaming
Thread-Topic: [PATCH v4 1/6] media: i2c: ov5640: Remain in power down for DVP
 mode unless streaming
Thread-Index: AQHWgvi4qdMvk8Y9N0iZFwzrul8/26lggxKAgcwfagA=
Date:   Tue, 29 Jun 2021 10:47:56 +0000
Message-ID: <3b54ab9b-4ffd-ab32-d495-fad6132ea504@microchip.com>
References: <20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200904201835.5958-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <8b5d4928-2921-b876-7d1e-04bb42eff4fa@st.com>
In-Reply-To: <8b5d4928-2921-b876-7d1e-04bb42eff4fa@st.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.121.125.103]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f37ef5a0-3fb9-4faf-3089-08d93aeb5aff
x-ms-traffictypediagnostic: DM6PR11MB3643:
x-microsoft-antispam-prvs: <DM6PR11MB364366A8569D3ADD6F4CB8D3E8029@DM6PR11MB3643.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i3A7Lz2xiBKlPBVQg+7OLoGtJpNbrAskQsDnE79XPb1ZQVTwpc6hJyUejMugbYMt+BQJUCXOV5yby+DBizHX+16beCXJ9BjlaNFlyX4BPOMBka4n63CEwss5DXzB3YnThQcfgYgimC7Dd/WIZS/RQOBljV2lYn2NJghmhMd+6lBScHl39Hn04uKq9aWi4S9s40suwyLZ/kpMZ1h0jjswn3zZN6kpI2OE4q1J0VKxqbPy0Wiu/U1BFFtrdyJciELvCXdS8LDddS7SnoikxZp8YPJ+vKWP41+Yyrrmq5u7zUTUiLOS/RHtJMm/6IiRTtD54WQYV7fKF9hrOD4W/u/6SnbLAU+M1mC3g2dbqgdQd9mHF3FGdHBRYaMEWI48P/wxE6fPziGf1BxJusrlX0CBjm7w/tt8nA8IqonHXAhygHbxeJJZGLzKkJkEokA4HiR/JrIXnWaUee3PanTyfcGWpY+Aa3dkbh4Tv3ZZeoC+/8o3hoKSwBOIVx39/oH+IqbEp9xldJDpWGDNaPojyuuYPM9/d5sxFUipIXnWkPEmn2mpevqDTQC862D9xEZZ2WdWF0ptiriyd+b85IydIYFQlClLNnpfJ+E1eP/0chHjemnnUvMy96gyWZbPKsZtFNQReuC3gQBtYa0Cueci4dUAad9KmjPfDvPkW1ShQQpyosDjgS8oEXDQgiN8zyYzZKG6niwrmAGsKcro6p6asWo7J7uKe0OxWYu50JMebAbrItU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5519.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(366004)(396003)(346002)(376002)(122000001)(36756003)(7416002)(6486002)(478600001)(83380400001)(6512007)(91956017)(8936002)(8676002)(6506007)(66446008)(64756008)(316002)(66946007)(31696002)(66556008)(66476007)(26005)(186003)(86362001)(31686004)(76116006)(110136005)(38100700002)(2906002)(2616005)(53546011)(54906003)(71200400001)(5660300002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0JFb0hxN0k3ZGR3VnlVMHBHK0hSbElBZEdHMWR3RDAwajlWWWovY0pDaVVV?=
 =?utf-8?B?TGxHQzVhMkY0RzB1NWJMZHpXVFJXWnRWcUc4YllWWnd2L1pRbDFvRVgxRFor?=
 =?utf-8?B?a0JvckNwcEJTWUZoNm5sN0E1bWxLeGVWTy9SUjB3dlpBLzdxZGpyc1M1NWNS?=
 =?utf-8?B?VWJoWjJWZ2RuRUpONkVIdm5uS0ZIMi9UV29ML1BRcGtkT2Y3b0hWdmMxSVZa?=
 =?utf-8?B?YWt0MHc2MnJRblJVSjZ1cjdzV0kzbkZEenQyS0lzZWtKaHBQTTRERCtFUjBC?=
 =?utf-8?B?SlZWVFZvNW95VjNpMlUzdldNVlduc0hNczVJNmFCdm9FdkVsZ2lyZEFhV1dJ?=
 =?utf-8?B?ZmFrY1dsNHNSNHhNTmE3Q0FXa1l0aU5NOFdYRGI3QVVneVMwd0xMVDNkR3VU?=
 =?utf-8?B?K0h1VnczR0VyTUw4ZDFINUIzY3gxNUQzanV0SUJKbjFteGFyVXFEd0RUTGFG?=
 =?utf-8?B?cHBlUWVZOUV5NFg1M0pNYjNQaW9wUTlJSGM0MitHdXlmUVc1d09qd0dzVEFS?=
 =?utf-8?B?cmxkN2tFOVh4dHU3WnpZVTAzZHZrc2ltZktiUDV2UTY4UGloR3pBSzBvdk1y?=
 =?utf-8?B?TXhOK3FmbmlxNWpQSEZoMGRQWi9SVGFSWVVwdjVXS0JsQVcvRHRVWXpRR1pZ?=
 =?utf-8?B?ZTdtYllMbnN2Q21taUhSc1hoQ2xEMTZCQUowWHN4b1FpdDBDdW5SbmhBMWQw?=
 =?utf-8?B?ODhhT2FqNm1YeVdEMmo1U2I1Mi9FYnVxNjVRbGlrRGxpc3NwaTBWU3BzeGVz?=
 =?utf-8?B?SHI4S2dNSFlLOFovVk8ra2k5QnBlbExJTm5WMFRKOXE5a0ZRc0cyYWM1bWtO?=
 =?utf-8?B?K3Y2NEM1VXVST2ZPRkJGM3psMVV5OHY2d0I2R2tVOFVXbmczTHpYM1QyYVR5?=
 =?utf-8?B?eEI4TkVwSk52eHVGeUViRE1leGJFMkRGUytoM21rVHZ4cHZKVUg4ejIwSnlB?=
 =?utf-8?B?NGN1ZHZiZVJyZGNCL2xqcll2NmxUdTdWb1hNa1NnUmxXdk5odjI0aW81WUdn?=
 =?utf-8?B?UlZvMDNVQ2R1SlYzYm9iS0ZRdGxMZWswNHZoeGlVYmZOTEJBcnFmSEluZUhv?=
 =?utf-8?B?djdoMHh4MHl6ZE54V3JNVjVic1BkcEQ4dmZDNFp5Z0srR2dzQzZ3OHgxbjJI?=
 =?utf-8?B?dGJkMmQzOVQ4WWlNeVVMZDFpYlAzM1UxdXhnMnVuMlJWeXVabXF0TlNIeGdD?=
 =?utf-8?B?TXdQWmcyTEc3ZGZISkI1ZVQrMlJXMzFaVFNpZTk2RGN1aXgwSkZWdmRWeExF?=
 =?utf-8?B?RFY4alRhcC94a3hTSkMzaGpyT3pJQmE5OTlkc0cxZXhUZlRMMlUzd0VRVzdh?=
 =?utf-8?B?aTA2ZXk1ZVZJNDEwRVcyaGVsdEFGTzVIc1l1NGdCRFBFcFpvQ3hlc1I3MUJh?=
 =?utf-8?B?WHpmSWRZM1JNR3hXcTUwRDJuaEZhT1NONjJrL3BQTWRmU0F0MVk1TG50NjNj?=
 =?utf-8?B?cG5qN2lCdW9jZThiWFoyT0pzbHk4VzhKajcrc1NaUFE5TUdzZkUyZzJHMkNP?=
 =?utf-8?B?dVBndGVQZXQwaHVaRy9uVmN5M3NNTW1kVFB6UXkvNHIwSEdyNXB1SDJPYkRo?=
 =?utf-8?B?MkM1eXdzSzhJUmpFcDdCVTI4eTBaTDJrZnR2VWlvQmFZeGlDbml5TzZvTnRr?=
 =?utf-8?B?NkJ6clJSRHpoWFh5TEdsMjdPODlMbVlsRytLYUFRa3RBMUlIUWk4WXYrTmFt?=
 =?utf-8?B?SzdibHREaFA4WWJ5WHR4VWg4WlZWNkVXb2tMTytNUUFjR0RMNC90VlNNVUV6?=
 =?utf-8?Q?XzQKAvuYMJ/x99Q+/SuOdgLL3QBRyNGNdMyOJ04?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <019376068C47FC45AC646449FF6EB1D7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37ef5a0-3fb9-4faf-3089-08d93aeb5aff
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2021 10:47:56.7517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h+XO/AuEqFIwIjtdVrmJWcjdxZZcSJNVv5cK9P/uQ/jOBbElGbKNoq5ze2nCfrJejmZ3XC3QN6CBB1GGDZnw0y0VLkPDl27f43hwH0YX6HY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3643
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gOS85LzIwIDc6MTYgUE0sIEh1Z3VlcyBGUlVDSEVUIHdyb3RlOg0KPiBIaSBQcmFiaGFrYXIs
DQo+IA0KPiBBcyBkaXNjdXNzZWQgc2VwYXJhdGVseSBJIHdvdWxkIHByZWZlciB0byBiZXR0ZXIg
dW5kZXJzdGFuZCBpc3N1ZSBiZWZvcmUNCj4gZ29pbmcgdG8gdGhpcyBwYXRjaC4NCj4gTmV2ZXJ0
aGVsZXNzIEkgaGF2ZSBzb21lIHJlbWFya3MgaW4gY29kZSBpbiBjYXNlIHdlJ2xsIG5lZWQgaXQg
YXQgdGhlIGVuZC4NCj4gDQo+IE9uIDkvNC8yMCAxMDoxOCBQTSwgTGFkIFByYWJoYWthciB3cm90
ZToNCj4+IEtlZXAgdGhlIHNlbnNvciBpbiBzb2Z0d2FyZSBwb3dlciBkb3duIG1vZGUgYW5kIHdh
a2UgdXAgb25seSBpbg0KPj4gb3Y1NjQwX3NldF9zdHJlYW1fZHZwKCkgY2FsbGJhY2suDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJq
QGJwLnJlbmVzYXMuY29tPg0KPj4gUmV2aWV3ZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4+IFRlc3RlZC1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG9Aam1vbmRp
Lm9yZz4NCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMgfCAxOSArKysr
KysrKysrKysrKysrLS0tDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y1
NjQwLmMgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYw0KPj4gaW5kZXggMmZlNGE3YWMwNTky
Li44ODBmZGU3M2EwMzAgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAu
Yw0KPj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4+IEBAIC0zNCw2ICszNCw4
IEBADQo+PiAgICAjZGVmaW5lIE9WNTY0MF9SRUdfU1lTX1JFU0VUMDIgICAgICAgICAgICAgIDB4
MzAwMg0KPj4gICAgI2RlZmluZSBPVjU2NDBfUkVHX1NZU19DTE9DS19FTkFCTEUwMiAgICAgICAw
eDMwMDYNCj4+ICAgICNkZWZpbmUgT1Y1NjQwX1JFR19TWVNfQ1RSTDAgICAgICAgICAgICAgICAg
MHgzMDA4DQo+PiArI2RlZmluZSBPVjU2NDBfUkVHX1NZU19DVFJMMF9TV19QV0ROIDB4NDINCj4+
ICsjZGVmaW5lIE9WNTY0MF9SRUdfU1lTX0NUUkwwX1NXX1BXVVAgMHgwMg0KPiANCj4gRm9yIHRo
ZSB0aW1lIGJlaW5nIHRoaXMgc2VjdGlvbiB3YXMgb25seSByZWZlcnJpbmcgdG8gcmVnaXN0ZXJz
DQo+IGFkZHJlc3NlcyBhbmQgYml0IGRldGFpbHMgd2FzIGV4cGxhaW5lZCBpbnRvIGEgY29tbWVu
dCByaWdodCBiZWZvcmUNCj4gYWZmZWN0YXRpb24sIHNlZSBPVjU2NDBfUkVHX0lPX01JUElfQ1RS
TDAwIGZvciBleGFtcGxlLg0KPiANCj4+ICAgICNkZWZpbmUgT1Y1NjQwX1JFR19DSElQX0lEICAg
ICAgICAgIDB4MzAwYQ0KPj4gICAgI2RlZmluZSBPVjU2NDBfUkVHX0lPX01JUElfQ1RSTDAwICAg
MHgzMDBlDQo+PiAgICAjZGVmaW5lIE9WNTY0MF9SRUdfUEFEX09VVFBVVF9FTkFCTEUwMSAgICAg
IDB4MzAxNw0KPj4gQEAgLTExMjAsNiArMTEyMiwxMiBAQCBzdGF0aWMgaW50IG92NTY0MF9sb2Fk
X3JlZ3Moc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwNCj4+ICAgICAgICAgICAgICAgIHZhbCA9
IHJlZ3MtPnZhbDsNCj4+ICAgICAgICAgICAgICAgIG1hc2sgPSByZWdzLT5tYXNrOw0KPj4NCj4+
ICsgICAgICAgICAgICAgLyogcmVtYWluIGluIHBvd2VyIGRvd24gbW9kZSBmb3IgRFZQICovDQo+
PiArICAgICAgICAgICAgIGlmIChyZWdzLT5yZWdfYWRkciA9PSBPVjU2NDBfUkVHX1NZU19DVFJM
MCAmJg0KPj4gKyAgICAgICAgICAgICAgICAgdmFsID09IE9WNTY0MF9SRUdfU1lTX0NUUkwwX1NX
X1BXVVAgJiYNCj4+ICsgICAgICAgICAgICAgICAgIHNlbnNvci0+ZXAuYnVzX3R5cGUgIT0gVjRM
Ml9NQlVTX0NTSTJfRFBIWSkNCj4+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4+
ICsNCj4gDQo+IEkgdW5kZXJzdGFuZCB0aGF0IG1vcmUgb3IgbGVzcyByZWdpc3RlciBPVjU2NDBf
UkVHX1NZU19DVFJMMCAoMHgzMDA4KQ0KPiBoYXMgYmVlbiBwYXJ0aWFsbHkgcmVtb3ZlZCBmcm9t
IGJpZyBpbml0IHNlcXVlbmNlOiBmb3IgcG93ZXItdXAgcGFydCwNCj4gYnV0IHBvd2VyLWR3biBy
ZW1haW5zIGF0IHZlcnkgYmVnaW5uaW5nIG9mIHNlcXVlbmNlLg0KPiBXZSBzaG91bGQgY29tcGxl
dGVseSByZW1vdmUgMHgzMDA4IGZyb20gaW5pdCBzZXF1ZW5jZSwgaW5jbHVkaW5nDQo+IHBvd2Vy
LWR3biwgYW5kIGludHJvZHVjZSBhIG5ldyBmdW5jdGlvbiBvdjU2NDBfc3dfcG93ZXJkb3duKG9u
L29mZikgdGhhdA0KPiBzaG91bGQgYmUgY2FsbGVkIGF0IHRoZSByaWdodCBwbGFjZSBpbnN0ZWFk
Lg0KPiANCj4gDQo+PiAgICAgICAgICAgICAgICBpZiAobWFzaykNCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0ID0gb3Y1NjQwX21vZF9yZWcoc2Vuc29yLCByZWdfYWRkciwgbWFzaywgdmFs
KTsNCj4+ICAgICAgICAgICAgICAgIGVsc2UNCj4+IEBAIC0xMjk3LDkgKzEzMDUsMTQgQEAgc3Rh
dGljIGludCBvdjU2NDBfc2V0X3N0cmVhbV9kdnAoc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwg
Ym9vbCBvbikNCj4+ICAgICAgICAgKiBQQUQgT1VUUFVUIEVOQUJMRSAwMg0KPj4gICAgICAgICAq
IC0gWzc6Ml06ICAgICBEWzU6MF0gb3V0cHV0IGVuYWJsZQ0KPj4gICAgICAgICAqLw0KPj4gLSAg
ICAgcmV0dXJuIG92NTY0MF93cml0ZV9yZWcoc2Vuc29yLA0KPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgT1Y1NjQwX1JFR19QQURfT1VUUFVUX0VOQUJMRTAyLA0KPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgb24gPyAweGZjIDogMCk7DQo+PiArICAgICByZXQgPSBvdjU2
NDBfd3JpdGVfcmVnKHNlbnNvciwgT1Y1NjQwX1JFR19QQURfT1VUUFVUX0VOQUJMRTAyLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbiA/IDB4ZmMgOiAwKTsNCj4+ICsgICAgIGlm
IChyZXQpDQo+PiArICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+PiArDQo+PiArICAgICByZXR1
cm4gb3Y1NjQwX3dyaXRlX3JlZyhzZW5zb3IsIE9WNTY0MF9SRUdfU1lTX0NUUkwwLCBvbiA/DQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPVjU2NDBfUkVHX1NZU19DVFJMMF9TV19Q
V1VQIDoNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE9WNTY0MF9SRUdfU1lTX0NU
UkwwX1NXX1BXRE4pOw0KPj4gICAgfQ0KPj4NCj4+ICAgIHN0YXRpYyBpbnQgb3Y1NjQwX3NldF9z
dHJlYW1fbWlwaShzdHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vuc29yLCBib29sIG9uKQ0KPj4NCj4gDQo+
IA0KPiBCUiwNCj4gSHVndWVzLg0KPiANCg0KDQpIZWxsbyBldmVyeW9uZSwNCg0KV2hlbiBJIHVw
ZGF0ZWQgZHJpdmVyIGluIG15IHRyZWUgd2l0aCB0aGlzIHBhdGNoLCBJIG5vdGljZWQgdGhhdCBt
eSANCnNldHVwIHVzaW5nIHRoZSBBVE1FTCBpc2MgcGxhdGZvcm0gKyBvdjU2NDAgaW4gcGFyYWxs
ZWwgYnVzIG1vZGUgc3RvcHBlZCANCndvcmtpbmcuDQoNCkl0IGxvb2tzIGxpa2UgdGhlIGN1bHBy
aXQgaXMgdGhpcyBwYXRjaC4NCkkgYW0gbm90IHN1cmUgd2hpY2ggaXMgdGhlIGJlc3Qgd2F5IHRv
IGZpeCBpdC4NCkl0IGxvb2tzIGxpa2UgaW5pdGlhbGx5IHRoaW5ncyB3b3JrIGZpbmUgd2hlbiBw
cm9iaW5nIHRoZSBkcml2ZXIsIGJ1dCANCndoZW4gd2Ugd2FudCB0byBzdGFydCBzdHJlYW1pbmcg
YXQgYSBsYXRlciBwb2ludCwgdGhlIHJlZ2lzdGVyIFNZU19DVFJMMCANCmNhbm5vdCBiZSB3cml0
dGVuIGFueW1vcmUuDQpIZXJlIGlzIGFuIG91dHB1dCBvZiB0aGUgbG9nOg0KDQogIC0tLSBPcGVu
aW5nIC9kZXYvdmlkZW8wLi4uDQogICAgIFRyeWluZyBzb3VyY2UgbW9kdWxlIHY0bDIuLi4NCiAg
ICAgL2Rldi92aWRlbzAgb3BlbmVkLg0KICAgICBObyBpbnB1dCB3YXMgc3BlY2lmaWVkLCB1c2lu
ZyB0aGUgZmlyc3QuDQogICAgIG92NTY0MCAxLTAwM2M6IG92NTY0MF93cml0ZV9yZWc6IGVycm9y
OiByZWc9MzAwOCwgdmFsPTINCiAgICAgYXRtZWwtc2FtYTVkMi1pc2MgZjAwMDgwMDAuaXNjOiBz
dHJlYW0gb24gZmFpbGVkIGluIHN1YmRldiAtMTIxDQogICAgIEVycm9yIHN0YXJ0aW5nIHN0cmVh
bS4NCiAgICAgVklESU9DX1NUUkVBTU9OOiBSZW1vdGUgSS9PIGVycm9yDQogICAgIFVuYWJsZSB0
byB1c2UgbW1hcC4gVXNpbmcgcmVhZCBpbnN0ZWFkLg0KICAgICBVbmFibGUgdG8gdXNlIHJlYWQu
DQoNCkkgYW0gdXNpbmcgYSBzaW1wbGUgYXBwbGljYXRpb24gdG8gcmVhZCBmcm9tIC9kZXYvdmlk
ZW8wICh3aGljaCBpcyANCnJlZ2lzdGVyZWQgYnkgdGhlIGF0bWVsLWlzYyBvbmNlIHRoZSBzZW5z
b3IgcHJvYmVkKQ0KDQpJIGhhdmUgYSBmZWVsaW5nIHRoYXQgc29tZXRoaW5nIGlzIHdyb25nIHJl
bGF0ZWQgdG8gcG93ZXIsIGJ1dCBJIGNhbm5vdCANCnRlbGwgZm9yIHN1cmUuDQoNClJldmVydGlu
ZyB0aGlzIHBhdGNoIG1ha2VzIGl0IHdvcmsgZmluZSBhZ2Fpbi4NCg0KSGVscCBpcyBhcHByZWNp
YXRlZCwNClRoYW5rcywNCkV1Z2VuDQo=
