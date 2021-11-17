Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D48454B6C
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 17:53:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbhKQQ4S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 11:56:18 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:44505 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbhKQQ4R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 11:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637167999; x=1668703999;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AuCL/1DDwrXj22lurHARpVPzUY1vvt7c4uiZvxiHqCY=;
  b=OGaRL7JBK7Fvkjtjxy6yMV3OT2LXT03QIQbj339RDYoeotWXFX5sLFns
   /ADmEJsIhDRlz5n6pPw5OlS/rV5AE+1oFzsDgp8VIio6k8mypW672NrgJ
   r3+oB4dlxSHc4l4+3SPRuQ6bnBma1lfVBNDbsEmaP+Ix0Px68qX0PvVwc
   2Ni+2eJ22LtabyuWGHYeE0msuPtew9vRlmYstUoakmXGLxIvJHnf4K4yn
   0GTPGhdu6YiFmrmoN3/VS7MhVJsFjSVJYxsRnhAX7jmfWJnLOAb9o5Zca
   AEjog7epC9hiCa0o61NWHIwm7C8DVFdNcv8oRMPIAvvwRoVDBqgsdctW5
   A==;
IronPort-SDR: TXbbR6TGEQ/0MA7svgp2h2DRlxrVerHdPogWYE96nRlxMFOH+jvvxhpaYf5UZmQTuOmYrp2+d5
 Ch9zVa4vaTpiuHB5O+TPi8n+tlHYgWNk+tEdjJ3vSy9Q81LnUbKbB1iEW/donO43Bls5Bued1B
 7EKn5R5Y22/0TLnXHC+vmsSykpBCyi6zCqKQgT3mwg9cqAc4D8DjJ9FEuvfefEQb5Wz3267DPh
 6W4bUuaA+9ecYsvLfqROf2KyJaxHmJROMtmfxJfB8D8nxUBALDJzP9o6Tmcid8YMzsUbOutSJo
 TMu7+lRXYGxUVVO4JN7m784f
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; 
   d="scan'208";a="139454629"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Nov 2021 09:52:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 09:52:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Wed, 17 Nov 2021 09:52:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ye3WXUUG4cQyFWpELuwDguyWa2yrJNCAAK/i6djB5SN2b91CSiP5QpwgER80OaJKkH87fXLJEg+p4CMVUX6LGtnW6nkIUcZYt6NwfgQr28pOKgP6uFGr4a5ycmPN98oDWCEu98ozlQNByoqHSuiK2ZhX1cFx5RuR3YeLamLreiyyFkb4fnbidIgyVosgvIi69BeJK7HLmXnu/wDis7g1r6kqntRDJrcR8XcquBlzOzMSD+eLZQVR5sEP1ASgMlXQZnW/QxKkOcCebpfE49isM3QZVRjNbhPT1kvt5B1x7dSvX2yaL/V++dlYHjYFYxwzB/2MFE6UHQf+i66U6UIxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuCL/1DDwrXj22lurHARpVPzUY1vvt7c4uiZvxiHqCY=;
 b=O1nBuZrjmdS8t2OTDwU/ZnKdWlYfEfgbOD+4GBLu3kf2kYvlcE38k9dElvaGMcKL7rSVrHhtZtwdeBP+TBO/OuH5JCd8Tjtk0AV7/Hx+iptd4dblAUfzO5wA8iIIw8rb0aExHz0K90jg0IVFouRx/u3tYPszkRiIrBH+/n5L2C5klZH0kzIEjA/vdY6K+VDHql+uxZmJW9HPkSUIERdtgBNkAH+lS6HsVwP/jZqLkVsd/lFdRm9K38a7sEZvOqbDqFibWqqL8G71Sri/VjVdZfnWDh9A02sMDBfwVQYuvCINirf6Qd1EFD11ntlQcSpYAbi9zD5g2P0QsHtqrNNKOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuCL/1DDwrXj22lurHARpVPzUY1vvt7c4uiZvxiHqCY=;
 b=b/I0qUyffycl+T7cmsinBPWpAAeZ9BJHVWRyMpu3bApPL3+TwC/n26mNABYMfDZSzL6ao7Qvh5OPUgzkaSlRGIn+A0XXXGde8taFmE5nb1aU2PxqIYvPR4ytTqvHtq5FLRgYOy0Z3Pi/j4mOVlQqyjWNVL9/ZQEDq1tUgItf+hA=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN6PR11MB1971.namprd11.prod.outlook.com (2603:10b6:404:ff::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 16:52:40 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21%7]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 16:52:40 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <sakari.ailus@linux.intel.com>
CC:     <leonl@leopardimaging.com>, <linux-media@vger.kernel.org>,
        <skomatineni@nvidia.com>, <luca@lucaceresoli.net>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: imx274: fix s_frame_interval runtime resume
 not requested
Thread-Topic: [PATCH] media: i2c: imx274: fix s_frame_interval runtime resume
 not requested
Thread-Index: AQHX28l/Wm/VajvbQEOJ1wHtmH/bJKwH5ACAgAALfIA=
Date:   Wed, 17 Nov 2021 16:52:40 +0000
Message-ID: <97fbf01c-6cfb-7ab9-f045-383a1e4053c2@microchip.com>
References: <20211117154009.261787-1-eugen.hristev@microchip.com>
 <YZUptcn1isWQuCdq@paasikivi.fi.intel.com>
In-Reply-To: <YZUptcn1isWQuCdq@paasikivi.fi.intel.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d9e5224-3be5-48a5-a34a-08d9a9eaaaf7
x-ms-traffictypediagnostic: BN6PR11MB1971:
x-microsoft-antispam-prvs: <BN6PR11MB1971E43DA0945CF0AC3BFD27E89A9@BN6PR11MB1971.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rYpKq9qrzVbXUofML8FdeHZb84pQaGxu2XdTe0tXl0KFJjfPxLTD4euBNV1ktatj/tfk1+YzGX71fGnRIMh8/FQV3nAjH/36yx2zKMjZZ8b+UmwQzaAfmEwnStr7Py3+o0cJ86P8VxLSW5o+LKIgVKvk+VQMFDnP2UR3AdcUnljXPVMG3YNqktP9+c7PnO/r52pztexVeLqcctxXSbyYeP0Y1XBuGX+fVr/n+FHI2vuZBB3ceji4kZ1UGAGogZqQn5kD4mroWe58Z7wI9U5YRcmnVBmYWebhh5ras9MSkXaSzgjHURGF5tMqqovUPZP27fGcpX4wW4SnS9O9GpJ+TaG7cxzTykCGaFF2qZf0aHs7Hl9ExQT53GoN/Hb7a0VDJ9ySu0i5Mz9ZZlx2ENyWOFnysXj7NVxlOO9NYHVdiqELLBkX9qmYLA4aeb66Aof1Xf92CDD/Fk3sUVGDkjKL+CLeqZ6B3IFfvwCLkm0LcsxPgvXhy4n57cjy1KhhfkF/P/YDHpy1qV7XRZOfzDRzMvYrKsZwnQQE2Ywbk80zodyMh4Ugtz8h8EOj8GYGKFXnjT++1fUNXrkecqZpcQCw0oeP8PduuAsBMapda40abVnceuHH0jvK5H+0SQTbhngY9i2f2Yd4KCE7DWxCV9olf+EnLXOAYduwpG9dNPjb2a3d7IGGRHbO7EvU7AmaApvA2hVOn5HBG3H8WPx9FKKs03mAOYTWRccmn82yRT2VyxQspsPzan4g+zI9vCXG5twrNe7i9COhFnkJNmG0LYGnpA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(71200400001)(54906003)(2906002)(6916009)(316002)(83380400001)(38070700005)(86362001)(91956017)(5660300002)(2616005)(26005)(6506007)(53546011)(4326008)(31696002)(6512007)(38100700002)(508600001)(8676002)(8936002)(66476007)(64756008)(6486002)(186003)(122000001)(31686004)(66556008)(66446008)(36756003)(66946007)(76116006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3J5OURDYi9WbEo4RTI2ajhhOFNBaDhnbHhYaHJEMDJZblRRKzV0RFBqd1pF?=
 =?utf-8?B?eStxT3IvWDIybUZkRmNBNk55UVRZS09XNW1vYWNlSC9jak0xTndKRFBMUldD?=
 =?utf-8?B?VVpuM29uSlBDbkR5MGN2V0ltUDNaeVpWSFVMRHhDZXQ1eGVKMi95TFBBbXBm?=
 =?utf-8?B?dWhURE1tS0NkcFJlOFdNSkVKbGZFK2tmbktvSjRad3VNWTJFUk5JclNWbHZY?=
 =?utf-8?B?dXpJaktMOVBQUDdTclQySnJ6NmdaMnJLL204M29Pb0UvR0x3dCt2RzYxMHpZ?=
 =?utf-8?B?NVJ2S1lGVXRkZDlCaURPeVpOa0dwajZXcGd0d1dBZ3ZIOUpKTmZOT3BnRysw?=
 =?utf-8?B?YWFaZ1I3V09YbUFnNUVDOE1NTHdWQk1ZblhSbHF3dEVwSG1BbzRDSGM0eXZx?=
 =?utf-8?B?MEVCMk5HTXBBZ05qbkY1aEVsNGp0YUhSZXlkdi9LekRuU09sNzRZeW14Vmdo?=
 =?utf-8?B?ekQyeWZ3T2toZVorYmYwWW9FMDl1dTNKblhDOEhGK2o5VXhReS9TSXdhMnZp?=
 =?utf-8?B?YkkxdC8xOXZlQUcxdUt4S0pDaVVGcmZsTEVkYVRqOGxrczl2cWViN1ROSGU1?=
 =?utf-8?B?T0lkVWtScmhXQWZ4UDJLbytNeVBtZXhiTUVUc2VBelU2c2g0b3hjQTNWVEFk?=
 =?utf-8?B?VXFCb1dNSzkxd3NvYTJPYVMwVVlLK29tdDVhYngwbStadWt1SlYzYmdFZDlD?=
 =?utf-8?B?OEU2WG1iY2lvTUtOQTl3dHhtN0tWbStsempGTkRjeFN2NjVMSmMzck15OGlI?=
 =?utf-8?B?Wkc3VnZqaHFQdkt5SDEvQ0NWN2huSi9lNkRUT2xRUzZndU5KK0JudGFuVnlU?=
 =?utf-8?B?QUtjeHVBaHE1ZXhsNVc0KzlXM3RFNDd0ZGtHQU5CdjgreGtMRGQzVWJuNnA4?=
 =?utf-8?B?dncrMG04OGZZT3dsZmpLTEtWNXpLQm9PMW54VUVSeG04aCtYSVhvZzA1UmpG?=
 =?utf-8?B?cEN4WHA2OEFDckpjaDZ5Q3VIdC85cmowR1RhMzBOWlBucDhHZ091SlJCT3VN?=
 =?utf-8?B?RTFkT1BIa0lFbXppSkdWYzFrREZOazJSYkE4di9QMllJTHlvWEhnTHhPUUgv?=
 =?utf-8?B?VjRvL256N0Y3cEM0a2hTb0tpcDJSaUhicE9sKzlEVWhMQ2wySmRzNWJMcVM0?=
 =?utf-8?B?OWx3NWptemRkcVFNL2s1ZXRhSXF2MStoVnZkNFhpQ00zQ2pJQjZBcnRjcDFH?=
 =?utf-8?B?ODdWZ1lOUW5GbU5CN2hhNjUxQlh1VTJFSkJHMUozTndOSjYxTzRPaGVEWlRy?=
 =?utf-8?B?RTl3OFpPSVNTc1FseEZUTUFwenRQS1M3bEx4T2p2QkE0WFM1VFJ1TnlTNzNZ?=
 =?utf-8?B?N2Vxa1p0cHlwenl2ZlhtYUs0UEZDZnJvUjV2Vk1qUmNkbXZIU2Q0Ynlxc05a?=
 =?utf-8?B?RVpUQnl2dW0xK21TdzlhQmppdXZoTVN3MEtMZkdZNncyNmJrOWJPZGlDUnhs?=
 =?utf-8?B?NjR2NE9VcExIbXA2cnRrTGEyemZjRFdMbmE2VW9lbnFEK0V6QXczeVpndHph?=
 =?utf-8?B?dWIyTjhQREhWL0JsN1dZQU11cEpLQkZ1WWR3ZzBpeCtIQnZidzFaRzdRc1E5?=
 =?utf-8?B?cWxGZ004Q2VMeTFSbzU1TTdtajhwTGFqWUtXM2J3SnpDV1YvWlRuNkloL0cy?=
 =?utf-8?B?dVd6TjJMSnlGYVJoQUVjK04wTWVZRmUva2s2RHJDU1dvQUtuU2hSVzNrNU0w?=
 =?utf-8?B?NWM0SitQQy9DaWVNaWZzZDRiaVdrVTF3d1FGZExoRCsvYURlM1JlMmZQWEh6?=
 =?utf-8?B?Q0M2MUpCbkc0RS9ZSWlYWGZOKzRLaDFZU2FnQ2hIUHlzVm5zSk9QV2FmWXFv?=
 =?utf-8?B?eGVibDZ0dkZzOFVvMmI1NFNQQUtjSEtoTGFwQml4N1BpVFVzUENmd0VZVGZS?=
 =?utf-8?B?d1hucG1xaFRWczJMUW9SVk13ZXdlSUI4TXJ0K1FLZDZiTUhKcmRJN3QwTUdY?=
 =?utf-8?B?dU5KVU80eTVMZFM1VlVqRGNhMDQySTkyTXhVckZma2s4ejFuQnJ5ODZjNVJo?=
 =?utf-8?B?bGFnb1FVMjFIMVJHQVhRRTI1R2dBRkVCL3VJbFhrQTRLajgzMVdwV3R4Y2RP?=
 =?utf-8?B?Y01IS0h0MVZ2ZENNS0lTeVY4ZFUvQllUaTJSTHhoQVdvbnRSbGpKK2pOaThS?=
 =?utf-8?B?ZmgwRUJQbjRFSTVMRUNpYm5GZUF6eW5NbEgvSjB6REpTZmJja0ZXL1Q2NXgy?=
 =?utf-8?B?Uzk0bitJUWRUU2VuMmVvNVdKQlcyYUNiMHhWOGIxN0dIVmJhV1BicnpnenFX?=
 =?utf-8?B?ZDZWakhqUzY0NGIwOU9mR3RxYkhBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C585A073EE54F40B4413A71F87BA2AE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9e5224-3be5-48a5-a34a-08d9a9eaaaf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 16:52:40.4188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rKsui8Az8/ChZwff1tdCCBN5QeRQTTvRrUEh6smdCcmgYrKYlv2u37qzidORDkRK0ZastHJv/YRTqGkJoO78fG4L2rAgu1EGJW5gAZ2zZvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1971
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTEvMTcvMjEgNjoxMSBQTSwgU2FrYXJpIEFpbHVzIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIEV1Z2VuLA0KPiANCj4gT24gV2VkLCBOb3Yg
MTcsIDIwMjEgYXQgMDU6NDA6MDlQTSArMDIwMCwgRXVnZW4gSHJpc3RldiB3cm90ZToNCj4+IHBt
X3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQgc2hvdWxkIGJlIGNhbGxlZCB3aGVuIHRoZSBzX2ZyYW1l
X2ludGVydmFsDQo+PiBpcyBjYWxsZWQuDQo+Pg0KPj4gVGhlIGRyaXZlciB3aWxsIHRyeSB0byBh
Y2Nlc3MgZGV2aWNlIHJlZ2lzdGVycyB0byBjb25maWd1cmUgVk1BWCwgY29hcnNlDQo+PiB0aW1l
IGFuZCBleHBvc3VyZS4NCj4+DQo+PiBDdXJyZW50bHkgaWYgdGhlIHJ1bnRpbWUgaXMgbm90IHJl
c3VtZWQsIHRoaXMgZmFpbHM6DQo+PiAgICMgbWVkaWEtY3RsIC1kIC9kZXYvbWVkaWEwIC0tc2V0
LXY0bDIgJyJJTVgyNzQgMS0wMDFhIjowW2ZtdDpTUkdHQjEwXzFYMTAvMzg0MHgyDQo+PiAxNjBA
MS8xMF0nDQo+Pg0KPj4gSU1YMjc0IDEtMDAxYTogaW14Mjc0X2Jpbm5pbmdfZ29vZG5lc3M6IGFz
ayAzODQweDIxNjAsIHNpemUgMzg0MHgyMTYwLCBnb29kbmVzcyAwDQo+PiBJTVgyNzQgMS0wMDFh
OiBpbXgyNzRfYmlubmluZ19nb29kbmVzczogYXNrIDM4NDB4MjE2MCwgc2l6ZSAxOTIweDEwODAs
IGdvb2RuZXNzIC0zMDAwDQo+PiBJTVgyNzQgMS0wMDFhOiBpbXgyNzRfYmlubmluZ19nb29kbmVz
czogYXNrIDM4NDB4MjE2MCwgc2l6ZSAxMjgweDcyMCwgZ29vZG5lc3MgLTQwMDANCj4+IElNWDI3
NCAxLTAwMWE6IGlteDI3NF9iaW5uaW5nX2dvb2RuZXNzOiBhc2sgMzg0MHgyMTYwLCBzaXplIDEy
ODB4NTQwLCBnb29kbmVzcyAtNDE4MA0KPj4gSU1YMjc0IDEtMDAxYTogX19pbXgyNzRfY2hhbmdl
X2NvbXBvc2U6IHNlbGVjdGVkIDF4MSBiaW5uaW5nDQo+PiBJTVgyNzQgMS0wMDFhOiBpbXgyNzRf
c2V0X2ZyYW1lX2ludGVydmFsOiBpbnB1dCBmcmFtZSBpbnRlcnZhbCA9IDEgLyAxMA0KPj4gSU1Y
Mjc0IDEtMDAxYTogaW14Mjc0X3JlYWRfbWJyZWcgOiBhZGRyIDB4MzAwZSwgdmFsPTB4MSAoMiBi
eXRlcykNCj4+IElNWDI3NCAxLTAwMWE6IGlteDI3NF9zZXRfZnJhbWVfaW50ZXJ2YWwgOiByZWdp
c3RlciBTVlIgPSAxDQo+PiBJTVgyNzQgMS0wMDFhOiBpbXgyNzRfcmVhZF9tYnJlZyA6IGFkZHIg
MHgzMGY2LCB2YWw9MHg2YTggKDIgYnl0ZXMpDQo+PiBJTVgyNzQgMS0wMDFhOiBpbXgyNzRfc2V0
X2ZyYW1lX2ludGVydmFsIDogcmVnaXN0ZXIgSE1BWCA9IDE3MDQNCj4+IElNWDI3NCAxLTAwMWE6
IGlteDI3NF9zZXRfZnJhbWVfbGVuZ3RoIDogaW5wdXQgbGVuZ3RoID0gMjExMg0KPj4gSU1YMjc0
IDEtMDAxYTogaW14Mjc0X3dyaXRlX21icmVnIDogaTJjIGJ1bGsgd3JpdGUgZmFpbGVkLCAzMGY4
ID0gODg0ICgzIGJ5dGVzKQ0KPj4gSU1YMjc0IDEtMDAxYTogaW14Mjc0X3NldF9mcmFtZV9sZW5n
dGggZXJyb3IgPSAtMTIxDQo+PiBJTVgyNzQgMS0wMDFhOiBpbXgyNzRfc2V0X2ZyYW1lX2ludGVy
dmFsIGVycm9yID0gLTEyMQ0KPj4gVW5hYmxlIHRvIHNldHVwIGZvcm1hdHM6IFJlbW90ZSBJL08g
ZXJyb3IgKDEyMSkNCj4+DQo+PiBUaGUgZGV2aWNlIGlzIG5vdCByZXN1bWVkIHRodXMgdGhlIHJl
bW90ZSBJL08gZXJyb3IuDQo+Pg0KPj4gU2V0dGluZyB0aGUgZnJhbWUgaW50ZXJ2YWwgd29ya3Mg
YXQgc3RyZWFtaW5nIHRpbWUsIGJlY2F1c2UNCj4+IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQg
aXMgY2FsbGVkIGF0IHNfc3RyZWFtIHRpbWUgYmVmb3JlIHNlbnNvciBzZXR1cC4NCj4+IFRoZSBm
YWlsdXJlIGhhcHBlbnMgd2hlbiBvbmx5IHRoZSBzX2ZyYW1lX2ludGVydmFsIGlzIGNhbGxlZCBz
ZXBhcmF0ZWx5DQo+PiBpbmRlcGVuZGVudGx5IG9uIHN0cmVhbWluZyB0aW1lLg0KPj4NCj4+IEZp
eGVzOiBhZDk3YmMzNzQyNmMgKCJtZWRpYTogaTJjOiBpbXgyNzQ6IEFkZCBJTVgyNzQgcG93ZXIg
b24gYW5kIG9mZiBzZXF1ZW5jZSINCj4+IFNpZ25lZC1vZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1
Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL21lZGlhL2ky
Yy9pbXgyNzQuYyB8IDUgKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9pbXgyNzQuYyBiL2RyaXZl
cnMvbWVkaWEvaTJjL2lteDI3NC5jDQo+PiBpbmRleCBlODllZjM1YTcxYzUuLjZlNjNmZGNjNWU0
NiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL2lteDI3NC5jDQo+PiArKysgYi9k
cml2ZXJzL21lZGlhL2kyYy9pbXgyNzQuYw0KPj4gQEAgLTE0MjAsNiArMTQyMCwxMCBAQCBzdGF0
aWMgaW50IGlteDI3NF9zX2ZyYW1lX2ludGVydmFsKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsDQo+
PiAgICAgICAgaW50IG1pbiwgbWF4LCBkZWY7DQo+PiAgICAgICAgaW50IHJldDsNCj4+DQo+PiAr
ICAgICByZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCZpbXgyNzQtPmNsaWVudC0+ZGV2
KTsNCj4+ICsgICAgIGlmIChyZXQgPCAwKQ0KPj4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Ow0K
Pj4gKw0KPj4gICAgICAgIG11dGV4X2xvY2soJmlteDI3NC0+bG9jayk7DQo+PiAgICAgICAgcmV0
ID0gaW14Mjc0X3NldF9mcmFtZV9pbnRlcnZhbChpbXgyNzQsIGZpLT5pbnRlcnZhbCk7DQo+Pg0K
Pj4gQEAgLTE0NTEsNiArMTQ1NSw3IEBAIHN0YXRpYyBpbnQgaW14Mjc0X3NfZnJhbWVfaW50ZXJ2
YWwoc3RydWN0IHY0bDJfc3ViZGV2ICpzZCwNCj4+DQo+PiAgIHVubG9jazoNCj4+ICAgICAgICBt
dXRleF91bmxvY2soJmlteDI3NC0+bG9jayk7DQo+PiArICAgICBwbV9ydW50aW1lX3B1dCgmaW14
Mjc0LT5jbGllbnQtPmRldik7DQo+Pg0KPj4gICAgICAgIHJldHVybiByZXQ7DQo+PiAgIH0NCj4g
DQo+IElmIHRoZSBkZXZpY2UgaXMgcG93ZXJlZCBvZmYgaW4gdGhlIGVuZCwgY291bGQgeW91IGlu
c3RlYWQgbm90IHBvd2VyIGl0IG9uDQo+IGluIHRoZSBmaXJzdCBwbGFjZT8gSS5lLiBzZWUgaG93
IHRoaXMgd29ya3MgZm9yIHRoZSBzX2N0cmwoKSBjYWxsYmFjay4NCg0KDQpIaSBTYWthcmksDQoN
CkkgdHJpZWQgdGhpcyBpbml0aWFsbHksIGFzIGluIHNfY3RybCwNCg0KICAgICAgICAgaWYgKCFw
bV9ydW50aW1lX2dldF9pZl9pbl91c2UoJmlteDI3NC0+Y2xpZW50LT5kZXYpKSANCg0KICAgICAg
ICAgICAgICAgICByZXR1cm4gMDsNCg0KDQpIb3dldmVyLCBpZiB0aGUgZGV2aWNlIGlzIHBvd2Vy
ZWQgb2ZmLCB0aGUgc19mcmFtZV9pbnRlcnZhbCBkb2VzIG5vdCBkbyANCmFueXRoaW5nIChyZXR1
cm4gMCksIGFuZCB0aGUgZnJhbWUgaW50ZXJ2YWwgaXMgbm90IGNoYW5nZWQuIE5vdCBldmVuIHRo
ZSANCmludGVybmFsIHN0cnVjdHVyZSBmcmFtZV9pbnRlcnZhbCBpcyB1cGRhdGVkIChhcyB0aGlz
IGlzIHVwZGF0ZWQgYWZ0ZXIgDQpjb25maWd1cmluZyB0aGUgYWN0dWFsIGRldmljZSkuDQpBbmQg
aW4gY29uc2VxdWVuY2UgbWVkaWEtY3RsIC1wIHdpbGwgc3RpbGwgcHJpbnQgdGhlIG9sZCBmcmFt
ZSBpbnRlcnZhbC4NCg0KU28gZWl0aGVyIHdlIHBvd2VyIG9uIHRoZSBkZXZpY2UgdG8gc2V0IGV2
ZXJ5dGhpbmcsIG9yLCB0aGluZ3MgaGF2ZSB0byANCmJlIHNldCBpbiB0aGUgc29mdHdhcmUgc3Ry
dWN0IGFuZCB3cml0dGVuIG9uY2Ugc3RyZWFtaW5nIHN0YXJ0cy4NCkkgYW0gaW4gZmF2b3Igb2Yg
dGhlIGZpcnN0IG9wdGlvbiAoaGVuY2UgdGhlIHBhdGNoKSwgdG8gYXZvaWQgaGF2aW5nIA0KY29u
ZmlndXJhdGlvbiB0aGF0IHdhcyByZXF1ZXN0ZWQgYnV0IG5vdCB3cml0dGVuIHRvIHRoZSBkZXZp
Y2UgaXRzZWxmLg0KVGhlIHNlY29uZCBvcHRpb24gd291bGQgcmVxdWlyZSBzb21lIHJld29yayB0
byBtb3ZlIHRoZSBzb2Z0d2FyZSBwYXJ0IA0KYmVmb3JlIHRoZSBoYXJkd2FyZSBwYXJ0LCBhbmQg
dG8gYXNzdW1lIHRoYXQgdGhlIGhhcmR3YXJlIHBhcnQgbmV2ZXIgDQpmYWlscyBpbiBib3VuZHMg
b3IgYnkgb3RoZXIgcmVhc29uIChvciB0aGUgc29mdHdhcmUgcGFydCB3b3VsZCBiZSBubyANCmxv
bmdlciBjb25zaXN0ZW50KQ0KDQpXaGF0IGRvIHlvdSB0aGluayA/DQoNCkV1Z2VuDQoNCj4gDQo+
IC0tDQo+IEtpbmQgcmVnYXJkcywNCj4gDQo+IFNha2FyaSBBaWx1cw0KPiANCg0K
