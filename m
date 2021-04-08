Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60AC358E47
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 22:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232236AbhDHUYA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 16:24:00 -0400
Received: from mail-eopbgr1400134.outbound.protection.outlook.com ([40.107.140.134]:27983
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231451AbhDHUYA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 16:24:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ru5qF3OEGQ9PnO2VFMz7sTGi6amHmmRGMsGG+wHTbCDqE+n40rKZOfHc+cmyoJJH13/hudT0aJoGNJd34BG+m7jgkR+ZyubhROK37cV+4gqRpq7yKo6t3kjwxBjfx9ERgcr/rf8uEi7B9ExiyS+VF/m0cwInYTcNI8x/6dcENWzaQ03kBCqOrYoYeEMRIR2M+ZxSL3buOFGzrx/HlywycXTiZ59hc9pptfq+ZqQwrikwORgJSQizSv+miT0srYJ72gxGgyESQhjMH7qxO3MOCECfteoocHRDa+KQe/snJ+K/8I4EVqaQkNCN/vwHWHeyPzmNQVpffORlMwS0x3jCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScVmpyi59xPi6tgrq+QdS8MkgCYbbJlsDaHO/VfxI1Y=;
 b=h/Hr9zYEG0/mkQvQauhR/65ZPoOcWJu6A34GzawIqkqD+Zw4JSLY9gdtckqTo3qIjA5PLL8R2iXNd6r+PlB1w5k4AVVu6GseVH2+CPfc5Tw1Fa9dv+Is0kIMijvMGWQHqetBd/55MiJzQWdEL31qF5GZ5iBQeoUVDPNKhGh0eMMo6QBK2MSql88WrLNSdn806QfmiMEa4ZHV/A/8GgP3Y1Go6rzsoM7sQjIxBAb8MClErApuzOznE/HRhyFxSlqSr5BIeqbVrn+B8xrJZv12G6375KOvu/H5bEAapm5pK6ziqIN7tNaSleXVQPJOg24xfOFfwSyluOCZoPrLsDm6aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScVmpyi59xPi6tgrq+QdS8MkgCYbbJlsDaHO/VfxI1Y=;
 b=J2s5QSOfq8AVFtwjj8GcCKWV3SIdxh70egkeLKIaz4R3T+xDj+KaeJ6UPMz3v6PR4UEHity3AhAteaOReNIcOjk1xEEEqErcYlFEkV4PtsBowjv8EydzLHL5qK4QHRa4EQ2rx9LJ6S+h2ez/RJ4LZWyF4VQAyMSrpAeYlVm/2gY=
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com (2603:1096:603:38::21)
 by OS3PR01MB6135.jpnprd01.prod.outlook.com (2603:1096:604:d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 20:23:45 +0000
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::4d2d:3155:768e:50e0]) by OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::4d2d:3155:768e:50e0%7]) with mapi id 15.20.4020.016; Thu, 8 Apr 2021
 20:23:45 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: RE: [PATCH v5 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Thread-Topic: [PATCH v5 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Thread-Index: AQHWp7GZa1JNKQqPtk+I2E/mnD2fUaonm7MAgILMIoCAAbKZoA==
Date:   Thu, 8 Apr 2021 20:23:44 +0000
Message-ID: <OSAPR01MB2737E11A8935D571A9C96005C2749@OSAPR01MB2737.jpnprd01.prod.outlook.com>
References: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
 <20201021135332.4928-3-fabrizio.castro.jz@renesas.com>
 <CAMuHMdWj_Gm6vwOF9Akz84WakA3KTcNTRHte6ukEF_U5=Q8xFA@mail.gmail.com>
 <CAL_JsqLgSjOxc8uoicSLE8nR=EKGpzK31CyHgdp5xarLtMV=9w@mail.gmail.com>
In-Reply-To: <CAL_JsqLgSjOxc8uoicSLE8nR=EKGpzK31CyHgdp5xarLtMV=9w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [2.28.163.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 401cf3f8-9214-44b7-bf47-08d8facc3587
x-ms-traffictypediagnostic: OS3PR01MB6135:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB61359D733114EEBC3B01E3CFC2749@OS3PR01MB6135.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MpQnpt7BDZ1r42wuApsGW1nw8Ck65gHSati6j55kY0I0iqlHdjPKpZMoDPW/GY2fWIOdkwB4nwV/mDr/XfAqWHEnUfNaBkrQOe14S9ojLeZVaJtshJysrvg+slz8Hx6hKamnA78Or6Gqt0UMqHZgjuKInRlHKSpS7RjjZS+UVzu9uWIpN9jED8paC3aaQzpU4w4RW8KnZEDGpBmMtAYfhiiTiTa4ji/DaQpMDzB+K4tT/lvRyKC5bdoVUuUtDGpXzyw8tLz2xq+V4E+sSY6CvWjngUOaOWFIqB1XC3TTeXDcTfZuwBB+Th7A2e/opSXjswezZuPRow7M3/6npPxpog/iEbhxq+Mv5lVGhXgDUejf7lZ5ePvVaaYZu/y3ByDSHt84rCaDofnOq0/E4ZeLlYsx4o83ya9Zj1LvQy4Zef9L2b8OlagB8yNIULV/LQ1lejaNPkR9In8niHBzUrWNdxw7upWyHmdD0wmOmkpWR2PABgu+niSSI9Pve1/F65i3hBaTX0DUcqY/OdP1q8NuoNN5ymKuJ0Od+LvAdDcxDqd7XjoyaVBOVAuFeGNfAoaUSSyN9zqU0iDl+SM4GhETxiriVQ9tC0N6NiKf+0xaMW+6sIiwFnvJ+sGjDCGvodLa2/NxNguiNJyZwgxPGNIFlrLOfKlX5q8rS5vPn8/UtKE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2737.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39850400004)(346002)(376002)(64756008)(71200400001)(76116006)(66946007)(66446008)(33656002)(66476007)(66556008)(8936002)(478600001)(9686003)(4326008)(83380400001)(54906003)(7696005)(6506007)(53546011)(316002)(38100700001)(110136005)(5660300002)(7416002)(52536014)(26005)(2906002)(186003)(55016002)(86362001)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?cndXYXo5S24zUDJBbDUvVVJSdEJ3YnVha1pmd0FZUVkxRXNZc2VaUzFvVkZq?=
 =?utf-8?B?WUNSTjBOSWpabmpic0hldXhqVERHbU5sUWJBYmhra3BXY1BrSXpIU0JuSnFM?=
 =?utf-8?B?cTRPRmdsUTE3bCtIK1d2YXkxa0pPRUdsSGVxR1BVMzFqSGMzZWZDV2ZuQSt4?=
 =?utf-8?B?bmx2WmVqTDEwR1Q5RnRPaVUxcmliemx6czg5aG9mZ3NleHVrSlJWTWZJSjJj?=
 =?utf-8?B?djVGYUhwZkY5NU5hdU14emNidDlCclVsUm1oQ1Iwa0liVk85d0VRM3cwYjAz?=
 =?utf-8?B?SlNkMlhVVFBQdE1RbmZuT1daTkhXR1ZDa2plUkpON2NKVENPUjRmRmZwNkZj?=
 =?utf-8?B?czhjNGJlYzJVbzBkZ002TXNtU3lvRHdwZjgyTTZXRzNTdG0wdTYxYm1GMVZq?=
 =?utf-8?B?dlZMSEpQOGRRWnZZdllIQkRZNXJ0Slk1RkhsNUlpa3N2Mmw1ZkVHcTFXR3lh?=
 =?utf-8?B?NTM1b0tEaWpYaGtVSlNhcDFJbTA2UHJVa3NmZ01qc0c0RGRRRHkwV3FtUlVH?=
 =?utf-8?B?blZrRk43YWhRNFpBODA0UUFvNlhtZlhyRUhaeVI2SmkrVkFFQkVIMEo3Smc1?=
 =?utf-8?B?SDNlNGN1K3NxSFVld1U2OHl0dWxsb3ZYYVo4Y2dQbXE5SW1RckJZN1AvRU5i?=
 =?utf-8?B?Qm5zVm4yaW5yNDVqNjdySUd6cUlPc1AyWmR5cEl4NmhOcWwwOFFXdkVuY1Ny?=
 =?utf-8?B?eXlMT2NWeXpSSTh6TFBDMVpkUldMcVFURnRMSjBGYjl5dEQ0ejkxdTBhRTVK?=
 =?utf-8?B?RmdvNEVXWHhBaFJCUDR6RCtZRmkzbzhnb2ovK0VrL3JmQ1lTcHl3ejJMa1lI?=
 =?utf-8?B?OThxWGhXdnVvait2ZzU0Znh4bEl5V1lua3JhZjdBeUJGMmw3alBuUnA0ZFZt?=
 =?utf-8?B?RERPQUZYcXJTRVhaN3lEcnRPVTJvbG9zK3ZQY1dRS2hKZHl6ZURLTVVrbTRs?=
 =?utf-8?B?dXlKTkpwMlpuWE1lenZpTGZEYmlUT0diS2lqL2JlR0d6YlpVeldtaUhTZFhk?=
 =?utf-8?B?SVpldDV3RXpTSld3eCtXc3F0dEE3WGE1aSt6SzIxYWNZMno4Qm5VUmgvT0ln?=
 =?utf-8?B?b29ieGppRjJHTmJDWmVZOEx6SGd1V1ZRaE9xSERGbXZYYjVQZ1JOS1BNaXBr?=
 =?utf-8?B?S2syd3E0L2lmTFJXc0NlSm9QZGJHSTBKa2NocDc5UFI0ZUVLVFFjcmFEQzdW?=
 =?utf-8?B?M0VkbGlORmNzaHhHYjdUMWpEc2RRLzBBdVJWeFBUcTU2YTVpOXQvem5EaVdn?=
 =?utf-8?B?aVp5aS9ob0xNSWVCNlp5L2k5ampoQjlua1grYjQraEE1a3ZEUDJhM0w3bzBO?=
 =?utf-8?B?OEZYRUJLODB3eWJHcGRRY1A3THRNM1ptdks2Ly9VOUY2S0ZkVmNWMy9SdXo5?=
 =?utf-8?B?aW9yR0l2SlJhNXlkS3hjdUxMckhtM016eWlPa3lSR2M0ZDBxYWxCb2QrSCtu?=
 =?utf-8?B?SExUNzlrT1RQSkNiUHFPMVBuL0p5NXM3WDV3SFJYL1g1enFzTjVIMVVwSXZh?=
 =?utf-8?B?RUdRYjVKSGVGWmgwWlhhWGFJcllicXgzd253WStmb1V3d0xxRm1PNko3UGsx?=
 =?utf-8?B?TTl5WnNLTThtY3ZjcWtCdWJuVHE3SXRUSFBhdFNGVk1rQnpuM3o3eVlJS3kx?=
 =?utf-8?B?Ykx4MHNUTDJ1WC9yeG1SbmhkSTJ1VlIybGI2L0R1eTQ1YXg4Y0I0UFVoUVVX?=
 =?utf-8?B?Nmk1R2syc01mQVUyVXVremVFYlNxU2RTUkhMMTVpREorVkljWkVqM05aVFcv?=
 =?utf-8?Q?015B9+E2fP7rC6eFZY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2737.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 401cf3f8-9214-44b7-bf47-08d8facc3587
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 20:23:44.6908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgedTfGE9vs4XHKQ99O58MTNU7YOsXRngGlAZfZnGt6FemksexLkMvYr0exJxHbjrfFsEDFSzc51j8sWC7F5grpmyDkmGxKEYtJeGP/x3Ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6135
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUm9iLA0KDQp0aGFua3MgZm9yIHlvdXIgZmVlZGJhY2suDQoNCj4gRnJvbTogUm9iIEhlcnJp
bmcgPHJvYmgrZHRAa2VybmVsLm9yZz4NCj4gU2VudDogMDcgQXByaWwgMjAyMSAxOToyNw0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY1IDIvNV0gbWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTogcmVu
ZXNhcyxkcmlmOg0KPiBDb252ZXJ0IHRvIGpzb24tc2NoZW1hDQo+IA0KPiBPbiBUaHUsIEphbiAx
NCwgMjAyMSBhdCA3OjAyIEFNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5v
cmc+DQo+IHdyb3RlOg0KPiA+DQo+ID4gSGkgRmFicml6aW8sIFJvYiwNCj4gPg0KPiA+IE9uIFdl
ZCwgT2N0IDIxLCAyMDIwIGF0IDM6NTMgUE0gRmFicml6aW8gQ2FzdHJvDQo+ID4gPGZhYnJpemlv
LmNhc3Ryby5qekByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBDb252ZXJ0IHRoZSBSZW5lc2Fz
IERSSUYgYmluZGluZ3MgdG8gRFQgc2NoZW1hIGFuZCB1cGRhdGUNCj4gPiA+IE1BSU5UQUlORVJT
IGFjY29yZGluZ2x5Lg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3Ry
byA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPg0KPiA+ID4gUmV2aWV3ZWQtYnk6IExh
ZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4g
PiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+DQo+ID4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPg0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+DQo+ID4g
PiAtLS0gL2Rldi9udWxsDQo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvcmVuZXNhcyxkcmlmLnlhbWwNCj4gPg0KPiA+ID4gKyAgY2xvY2stbmFtZXM6
DQo+ID4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gPiArICAgIGl0ZW1zOg0KPiA+ID4gKyAgICAg
IC0gY29uc3Q6IGZjaw0KPiA+DQo+ID4gV2l0aCBsYXRlc3QgZHQtc2NoZW1hLCAibWFrZSBkdF9i
aW5kaW5nX2NoZWNrIiBjb21wbGFpbnM6DQo+ID4NCj4gPiAgICAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL3JlbmVzYXMsZHJpZi55YW1sOg0KPiA+IHByb3BlcnRpZXM6
Y2xvY2stbmFtZXM6bWF4SXRlbXM6IEZhbHNlIHNjaGVtYSBkb2VzIG5vdCBhbGxvdyAxDQo+ID4g
ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9yZW5lc2FzLGRyaWYu
eWFtbDoNCj4gPiBpZ25vcmluZywgZXJyb3IgaW4gc2NoZW1hOiBwcm9wZXJ0aWVzOiBjbG9jay1u
YW1lczogbWF4SXRlbXMNCj4gDQo+IFNlZW1zIHRoaXMganVzdCBnb3QgYXBwbGllZCwgYW5kIG5v
dyB0aGlzIGVycm9yIGlzIGluIGxpbnV4LW5leHQuDQoNCkknbGwgc2VuZCBhIHBhdGNoIHRvIGZp
eCB0aGUgcHJvYmxlbSBzaG9ydGx5Lg0KDQpUaGFua3MsDQpGYWINCg0KPiANCj4gPg0KPiA+IFVz
aW5nDQo+ID4NCj4gPiAgICAgICAgY2xvY2stbmFtZXM6DQo+ID4gICAgICAgICAgY29uc3Q6IGZj
aw0KPiA+DQo+ID4gRml4ZXMgdGhhdC4NCj4gPg0KPiA+IEhvd2V2ZXIsIEknbSB3b25kZXJpbmcg
d2h5IEkgZG8gbm90IGdldCBhIGNvbXBsYWludCBhYm91dCB0aGUgc2ltaWxhcg0KPiA+IGNsb2Nr
L2Nsb2NrLW5hbWVzIGluDQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy55YW1sLg0KPiA+IEJlY2F1c2UgdGhleSdyZSBwYXJ0
IG9mIGFuIGVsc2UgYnJhbmNoPw0KPiANCj4gUHJvYmFibHkuIGlmL3RoZW4vZWxzZSBzY2hlbWFz
IGhhdmUgZmV3ZXIgY2hlY2tzIGFzIHRoZXkgY2FuIGJlDQo+IGluY29tcGxldGUgKG9ubHkgYWRk
aXRpb25hbCBjb25zdHJhaW50cyBvbiB0aGUgdG9wLWxldmVsIHNjaGVtYSkuDQo+IA0KPiBSb2IN
Cg==
