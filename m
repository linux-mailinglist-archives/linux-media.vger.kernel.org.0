Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F753D5387
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 09:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbhGZGWZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 02:22:25 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:47568 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbhGZGWW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 02:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1627282972; x=1658818972;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vGcu35fxIvVYGcrCpa4K+PMUoH0afbbkkzm9QWAA0oY=;
  b=voEJKnxj8xkhfO72fZAm3hty8oU5gMPA5A6G0VnhQ0WHcydZYm4iRWvl
   O2kUgAssIuZKrws2lhRI1Ex2nRI0B4a8GBzLlcyP/tcM+oQFmym8Ul6k8
   LHFzQTgOdYLrPZWboYD8D2dAObTCFpBqKjqRIRqZZe4mWs/CaNor0y1VT
   9bFSuSFGTNiJlsehi/PP4ua1b4D3lDFBZI/M0kE4kon3/ZAtBunjjN/IC
   ZVzrMWiD3+/gc3RiXvm3X+Py36KtnsKIRtzlrq46iZsZB/5L8qHkKqUr8
   KfK7xuf9kM3W3ixO+MgPCziNbfNvYdcnjZVbMUra8DQfO2Q3YkRXfCe9l
   g==;
IronPort-SDR: D2SCYtKXKnxmy8VJVjNjjPqNvpSr5gGvVMFJx9ZUW0OShlGWYCHhwekJZlopXU+XdNBRCPZXOS
 Fbjz/h5loOrVerVv5yKPCFw3dz6cihEWM91ybVdik3yhwQSu4A4h+ABosUTgMSrNAb0DmWFhH2
 hrNxqpiDMCwGs3Z6On3kf0z0liH3pO1w5b9F1YbwEKG2Ks1BAYV5K+QUpY90pRF2yaqk3d8gwA
 nFenBjHMr5t+b+gQKV2cwjW0nvYrsU7V6hAdRE9lKty3L/6TZieRDlu0qxL5vq5YqvY4puPLQL
 vkc1MQT+jcz5v0vFlp0wjSDL
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="129783746"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jul 2021 00:02:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 00:02:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 26 Jul 2021 00:02:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVNTauP0DgvMs1IZSHVEMIkR++POHxDOS3NMbYV0MTny/ovbApuAbpaqTnNm0NFJVvJe5AC7Lnle0rl7Jn9BBtpC/LMR2xcbTYnIG2vn4nlugiqAUQjMVtCBgL3upWfdvhPpUslKBrv0PpJEujwA1WxMvaQqnvGIltS2u5XQr0C5sUH2dYOtW0WwID7Ic+vWAlbOjulRfOTMbLoNXriI7tAdpmF8KqPdPHlXEgTfajOUBP/XJADJToItoTY2C5pjNR749U9b9TuEyg4IDfAarYTFvweJgKdZL1jDytpNs7JyRrDubMmMdOki1Gs5u1LlmxAmbso5TAp+8+EYJj2drQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGcu35fxIvVYGcrCpa4K+PMUoH0afbbkkzm9QWAA0oY=;
 b=PUqaTVjdflz9sypqxHLCLwll7hGhaIGyEspHBAERIQxMTV4VDjRmgMv3qhXWZmzCbpyAXuBu2Gqk2oRTbP+R4FD0dWSlW2j2XCkB9bXkaR3qINSYAryo7nBHKqh8Zs0aIRjuSDJHoOFvyPldCj4y+QPaT6KSGHxu4JJWQWvx+EIel6jL0ahHzarOA7JPA4VDTnjhSHqRakFYfRtXc5rIS4Y9sXYbc04tmGEAhmXUQO0wTPJoIg/yyGSr2YsfMq1zT3xb1tudftQMOAKizOeSQZF1IBgib2PbS3U4+se9Ro20J9ujzdD1FsTeQ7QkpwVjE/ZIP6ywqlJ3ZZ0U9w+A4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGcu35fxIvVYGcrCpa4K+PMUoH0afbbkkzm9QWAA0oY=;
 b=Ec0Ox5BOTTZoJFfGjfpE5PTYBuuM7tPSGSZBCogiqYliNbQdI7HbZ2NIWC2WhhFQI9CA2cNz4t6elQidOabofJvmu5PxleJHADWio4iSDNoJmA1L1tO+NNQvs5YVkEchZqo0a3FHI/lIMqMQ84Fno4rxQMh5B+lt4hjwTSgNMp4=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN9PR11MB5291.namprd11.prod.outlook.com (2603:10b6:408:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 07:02:46 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6870:66e9:7cd2:ab12]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6870:66e9:7cd2:ab12%9]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 07:02:46 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <arnd@kernel.org>
CC:     <mchehab@kernel.org>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>,
        <hverkuil-cisco@xs4all.nl>, <arnd@arndb.de>,
        <tomi.valkeinen@ideasonboard.com>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: atmel: atmel-isc: fix build failures after split
Thread-Topic: [PATCH] media: atmel: atmel-isc: fix build failures after split
Thread-Index: AQHXfti1Mj44oiWvzUm96L0JaeJAs6tOt+MAgAAohgCABfprgA==
Date:   Mon, 26 Jul 2021 07:02:46 +0000
Message-ID: <85fb4ebd-e921-0ed4-3c99-37ad4203edaa@microchip.com>
References: <20210722090509.1054249-1-arnd@kernel.org>
 <BN9PR11MB5514AA62DD0F2A65828E62D6E8E49@BN9PR11MB5514.namprd11.prod.outlook.com>
 <CAK8P3a0xp9BxwSt9+WTngsb1K12NGkroBwEf9p5Wg0Knf5umNQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0xp9BxwSt9+WTngsb1K12NGkroBwEf9p5Wg0Knf5umNQ@mail.gmail.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db467352-3d22-4557-98ed-08d950035f82
x-ms-traffictypediagnostic: BN9PR11MB5291:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR11MB5291C445112304FCE38DEF39E8E89@BN9PR11MB5291.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CisMik5hPF00nLwfX6sh90Q/YQW5mda52u7yrG12gTXUChClPwwnIAFsTgP8TzwvtR1FSwhcHhQpTanm6jvhnxVF9Cs+5k+g4XDG3G3pAGLqxE1D5uShVmKciHEBMn+uktVhpMUUMBE6uVF0A9M3U/ht39D/Xb7JTn7eNNL8jWVC7HMjpcpLBg6/KCTFpRhWITGo9umLdM2hc52OHquOsTVwRQj2UZIjXZOuKjL8MuyiXVRSKxovxTYDGMWkP8o593Mb8z4sDSYswtTbZH7neCbDGGvtGgs0AEQyjgLCbgJ5sEPpCDqUUNGSnD7HLR3MOFNbIKp9T/0YBw1jbtwm0HNV01Dn+fakmxToOt5dPD6J/9j0uP+lB+COOe0SuEOSdyTvNItq5Sx/fdRSDpvi3+rL3ylgN5K/NVN+Ym1yEgne04kAwdu4FA9YG01YEeKR6eIACcnjnzsrENVSnedIT9u7a3/2OTuc4Oa93qCNbfAJ/eL6zHhBL/uZjsrC/xRSz9lopwLORst4PA8m8H84Y8AUnwcUnkS4MeiCAK0FEZtT+jGhdxClbBdj0ZhVQ0O+KRqQwRcip05yKaKgPTcY3rHCwesWkUDD2zoHJ/uNoRLUrvEUWAH7CM07fsmT9o7qB24znkExtIp4QRm+Hxb2OAHsBAtRR70VkxAt3KPdrH+fxmnVPyL1mv4/0aOmaaWdTKWEB/H9KMDpd3YWzbfkYvAtjqCqshzToHgQQWSnhNxM2i1pJQ+zTiXbc4qhxPacTrh9ujVRNsRw3KA+UR8Tzd+V1K3XDTacdermUL9bLPPgoXOjWiR+B0WVbazEwRnFGEqfGji1n+upI0b4PYmWxHFaM6fxsxyPd6NOE6f0qZw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(38100700002)(64756008)(66476007)(66946007)(66446008)(53546011)(66556008)(31686004)(186003)(2616005)(8676002)(122000001)(4326008)(508600001)(966005)(86362001)(71200400001)(316002)(6512007)(4744005)(8936002)(31696002)(6916009)(6506007)(91956017)(76116006)(26005)(6486002)(36756003)(2906002)(54906003)(45980500001)(43740500002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUNOWmxkN3hDalI4bzBLQjJ5QjVkNjRIMUg0VU5ZTDU5aVpVcnB0Q09TRHF2?=
 =?utf-8?B?Q1NwcmxQNGUwUlpsS3V4a1ptODhzVEx4M1REdEE5Zk9RTjRJcFFaZXNkbFZy?=
 =?utf-8?B?MWMwWFNQemxHZDBkeUN4bk5idkhLa3BMbXpuNjYrY1laZHV4emFvMEM4UDQr?=
 =?utf-8?B?T3g1OE9sVVhwS09Lcjl2eE9zb01BL0FuSW5LTHhFUTczVnVVZXBjMHhMWStB?=
 =?utf-8?B?TElZMnpZYlpzNlk3WW1zOHcxc1FwWUtBQnV0VitYWnkxeDJ6MzRWSHBpTzJw?=
 =?utf-8?B?aUhWblU1SjVWZlFIbkVOWi81L1d3RjN3cjhFbmtUYWtxYWc0MUg5eFZtd1NG?=
 =?utf-8?B?eW5lSTE0NkhSTHpoTTYrQnU3WFNlQk96Z0d4MG5Xb2dGZjdSMEV2RDJsU0o0?=
 =?utf-8?B?VXV1b0Vzc3dEMUM4NSt3aEJ0cHdVblJSRVJNZ2wyZ2FrQklQZFBuSGdjeUY4?=
 =?utf-8?B?NU9ZeVArYkpvNGUycytEQ21BaFllczB3aFo5a21QRlRUcGxlN0J2N2Z6U1FQ?=
 =?utf-8?B?N2FHdWtGemVrUnpoeHlhWUcrdEg2TmhrM0ZWSDNzWXI2SHkrZmIxaGRMM2F2?=
 =?utf-8?B?YXNYZnRjRTFxQWVaQ2k2b1h5bUE0ajh2N1o1d29CTlk4UjIzbmNoWjFyUlNM?=
 =?utf-8?B?aEo1VWdsc05JTUgrOU5BSTErY1VCc1VoaEVrbGpnZGJSZXVoT2J2VU8wWElG?=
 =?utf-8?B?VXBwbmJKYzVWT2dIQnRJQUhKNlhkODhCR0ExQXBRekxISFZWY1BhS1l1LytH?=
 =?utf-8?B?bWtRbTd3ZkJ3YWorTlpPU3Jwa0ltSDVjQ1dtNi8rREJBTGhUTm4xOC9ZYWtP?=
 =?utf-8?B?VUtGU2FsUTdOUEZrdWw0Rm4xdTNsWmxMalRGMjYxZ1NHcFhub205QzVzT3Rp?=
 =?utf-8?B?ODRJVEduY0daaE9CNExJQ3dsYkVxZkhKczdyYmlKRTRxU2w4TEFGVTM2NEVo?=
 =?utf-8?B?K3U3TWRRKzhMWXZqa2tkdjViWjI5UEtERFlVcVB0azlXNlNXOEwrcG9RblB2?=
 =?utf-8?B?NVliY200eDJGRitMMVU4RnkzcWhLVUFvQXNHNTRXRGQ5YjdEQXBjL0t2MUdO?=
 =?utf-8?B?U2NJRW9YaTIwQ1I1cEJkczBESzVTcXFTZVJxWXpvUzFzd0c0UCtXRWMrVEJN?=
 =?utf-8?B?MDZQS0RxRUNZMU9tOXVpZGFzNWYwMGlBc0NNUFhJQSsvSTVYcHJsWFVUVkdt?=
 =?utf-8?B?QmVZZTRURGxLa2FOM3hualhKeGxjUk1aakIwczFVRjlHZWNVRW5TeUhmNmFo?=
 =?utf-8?B?a0VHWHZrdUNoOTVpNVZ6MWdYK2d2TnNuQk1zQk9HdXZ5NW95UENUY0hkeVoz?=
 =?utf-8?B?b2orMUljRzdUM0tpSjN6amtaYTNTd0lyUWNEeklhaWdQbFlKY0RrUUFJb2U0?=
 =?utf-8?B?NytnbkxiQnN4NVBxTGphRHBLdUVoLzk2NTNBeGpBMzFrVE02ajNGY3J1WUNH?=
 =?utf-8?B?SWt2SjBGV1ZpM20wNnFXNTVsODRBWS9kbmdLM1ZlaWZSUjhVQWd4ajQ2TDNK?=
 =?utf-8?B?NklBeWN1Q1FPank0bTlpbVV5MjhaTm1GWDZlTTBvQ2ZzRWlWNHNiV0drWEdm?=
 =?utf-8?B?ekY3a0tHOGFjbzRRdWQyWEFqS3BiOGh0SXRzZ1JoM3VMRUJVZzlhNmYzM0NI?=
 =?utf-8?B?aDZucVpCY0h3SVJKc3ZvQXo1bEhoNUx6cnd6cGJ1enRBYmQ0b0YrcmdMdjdR?=
 =?utf-8?B?SzIzbm9Na3pTMWt1VkZMWlNPZDNEcitET0dVcVh6azU4c3Y5UUlGdkc0ZXBn?=
 =?utf-8?Q?OgMqCJZUcY38W6d/k8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABBF996EDCC8824CBE7450419D353ED5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db467352-3d22-4557-98ed-08d950035f82
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 07:02:46.5820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D7a7mmnsEfD/Lar0BS0qywmiPk8LgTzjLHpDg2kdRBNZLKAyo4xtCWYewsB3S8Hxz+aoWVVaaU0IKIKwtfSDXNWz3Whs52ys4kRwzWc+WmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5291
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gNy8yMi8yMSAyOjQ1IFBNLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0KPiBPbiBUaHUsIEp1bCAy
MiwgMjAyMSBhdCAxMToyMiBBTSA8RXVnZW4uSHJpc3RldkBtaWNyb2NoaXAuY29tPiB3cm90ZToN
Cj4+DQo+PiBUaGFua3MgZm9yIHRoZSBwYXRjaCBidXQgSSBhbHJlYWR5IHBvc3RlZCBhIGZpeCBz
b21lIHdlZWtzIGFnbyA6DQo+Pg0KPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJt
LWtlcm5lbC8yMDIxMDcwNTEyNTcwOC4xMjE5MDItMS1ldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5j
b20vDQo+IA0KPiBPaywgZ29vZC4gSXMgdGhhdCBnb2luZyB0byBtYWtlIGl0IGludG8gdjUuMTQ/
DQo+IA0KPiAgICAgICAgICBBcm5kDQo+IA0KDQpIZWxsbyBBcm5kLA0KDQpJIGhvcGUgc28uIEkg
ZGlkIG5vdCBnZXQgYW55IGZlZWRiYWNrIGZvciBpdCB5ZXQuDQpJIHRoaW5rIGl0IGRlcGVuZHMg
b24gSGFucyBhbmQgTWF1cm8uDQoNCkV1Z2VuDQo=
