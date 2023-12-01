Return-Path: <linux-media+bounces-1469-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08683800AAE
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 13:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 085641C20A75
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 12:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16F525544;
	Fri,  1 Dec 2023 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=Analogixsemi.onmicrosoft.com header.i=@Analogixsemi.onmicrosoft.com header.b="b7mtSIKc"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2127.outbound.protection.outlook.com [40.107.93.127])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BFD1725;
	Fri,  1 Dec 2023 04:17:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aci2b+uTVU0lMlrUO/1q8NvJKoFntUW11qEYtqDzqSmej14+/9S4+4IUWKu5yoP5kmH22F5PJTds85mIcTpzr0u57E0giMeYkNTbLiJLpPo0RxJwwZc5XahHVGaeKR3UiQhOuQFH1wQc5q3SjolHh0xd+XrFnR5nQmQoq8xEXp/K5UQZe99TfnhKuP0eMDCf9HK6D7/naAHIpNAu6Z0R7ieR41TI5rxycWMmMDcz4Rlw93Q+/XscON3vLg/9PJ9h26Sp4GemimCS2qRgaDz9s4G3BeY1KiRdX1c00IkDqmuWrarFgu89m77VF6dAjt6o9F4bmHIZ+Z0uf8wBaVL0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZ7WQ2jDPsqUi7JpdabgQgKW5ufx5tWtBc0hyieHOnY=;
 b=nY5TXdSGVk5ecUh9tAdQnDMeyBnVICYsKl6BnDmZKHq/1JgBdRlQAkU8VHlZjelNHaBxirnM3cC1DualYQWrraJ3j6DdweYYYSMC79sBBaODeOltRp+98V0XcZ1eU6keGFg1hMfKcTPyrcpVT5Sp1e2JUc+G93fTCX64b3lxasGSIm9g2m6ITqj41yXfjNGaI4Cv3SyVKuEa9L0bmKcotyBADl0Ujj3aMIB7iyFucjcKH5I5tyY37Swf4To/19RShXT/P5UCvi3m1e3Xjb0S5KiuhFWT20mI1KjpZf9T3DuyDC3n/iIk5Av+4PBrRcwFNiaJYFJNhiPfz9tcMUllcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZ7WQ2jDPsqUi7JpdabgQgKW5ufx5tWtBc0hyieHOnY=;
 b=b7mtSIKc7nqgWlLGhch+6huQerPI9QYGEQXdhHr0+WOSr66QTVRpODvYpHEy0AqsXA9aF2r/u0+OiBwsDAPPqV65g02PhLMBbNIyzRjUxofw5G3Alcihue8swxRGVqeP8+ED8dExdRPQRNYlsNwWlCA/er96IxpBDdzncMmc4p0=
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by CH2PR04MB7030.namprd04.prod.outlook.com (2603:10b6:610:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 12:17:00 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6552:26cd:6ff4:9b3d]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6552:26cd:6ff4:9b3d%4]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 12:16:59 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Fabio Estevam <festevam@gmail.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"rfoss@kernel.org" <rfoss@kernel.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Fabio Estevam
	<festevam@denx.de>
Subject: RE: [PATCH 2/2] media: dt-bindings: Use bus-types definitions from
 video-interfaces.h
Thread-Topic: [PATCH 2/2] media: dt-bindings: Use bus-types definitions from
 video-interfaces.h
Thread-Index: AQHaIZI0L8jQTM3U4EuC6guyhXfSzbCUXOEQ
Date: Fri, 1 Dec 2023 12:16:59 +0000
Message-ID:
 <BY5PR04MB67390E694BD5C8FD21E584EDC781A@BY5PR04MB6739.namprd04.prod.outlook.com>
References: <20231126125320.4024456-1-festevam@gmail.com>
 <20231126125320.4024456-2-festevam@gmail.com>
 <20231128000033.GD25590@pendragon.ideasonboard.com>
 <CAOMZO5DMhTFtVJ8wnn9JNXtb5Rs7zatJcEkBBohVmz5vmwqTmw@mail.gmail.com>
In-Reply-To:
 <CAOMZO5DMhTFtVJ8wnn9JNXtb5Rs7zatJcEkBBohVmz5vmwqTmw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB6739:EE_|CH2PR04MB7030:EE_
x-ms-office365-filtering-correlation-id: 0cc664c0-09bd-4651-0961-08dbf2676b3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 o3YwfKT17On8S5QxfLJm46WGf5NIp5SvScX9jZ3FKayJEoCr5SYTyHa44o7GwSV5axUv38c02t6Ur3zWrmKj9hkkGoKwFKARdfyc729PV7Mj/6rWzlcX8aicT//oHwJOt5lHzJJPtTGt3yyseoW/+BeeBnCqvqc7a+Gs4XimyaEeGfkaMXzflxFFwjaDkRQSshf4ojB586hZH/gZevnQlCmDi7DABDP8O/9sgtIkeWzQOI9GriKcqvR21ZzYtJFiFcoeL3nb7O6vADJNDhlupVNiZP7qFUeYl8+FWu3OCKj4NgtZOx5gnGbHAaskfN5wRTCJxqg8sLWErgRcuHsjl78+b5f8KAPfyRkkIgkNPvoklqOgOBxQg+P0XJ8PQhg8ytzqZE7LmO+jHRd5nAJ85mNjw9o4ZpbmXK9lR2mSi4ekjMqruW/1CBmltwRwpqBG/oxLcPIIlJTuIREhYQZSl5+cjrO6wPMlXiCDsPRCPLVafGhYLzCrhLW/Tshn0LtTi3Tx+TbOuoPLXzipNNoEAMc2Lby5FCZswFLsLO515kVz7g1URUfUU7i6O208WAAqqtjAZEXBhRTQ8qHQDNTqrs0kk4jstZxdokCaT7z5s6E/pSMFfJgoq/0kyaug5wjpgcC4TwMRuCNy/JdDRj+nkjyyifC33vWJOFizhB3PRNA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6739.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39850400004)(230273577357003)(230173577357003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(55016003)(38070700009)(86362001)(54906003)(66446008)(66946007)(66556008)(66476007)(64756008)(76116006)(38100700002)(33656002)(26005)(83380400001)(6506007)(53546011)(122000001)(9686003)(7696005)(71200400001)(2906002)(110136005)(316002)(478600001)(4326008)(5660300002)(8676002)(8936002)(52536014)(41300700001)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NzdCa0JkdmxzOENiTVZ2WmtMYWliVmp1dXIzbkVWN2pBeDcxYnZ0d1FMR3JM?=
 =?utf-8?B?aXVmVG9EYUVyc1VpcjFPZ2IySTQ4dkY0SEpDRGFCL0FPSkZ6Q1gwMXlha2Rj?=
 =?utf-8?B?SUo3NEt3RS9PSmwvcVlTd3ovNExwN3RVMDFySi93bjRJcUo5SnBZYXdhL3cx?=
 =?utf-8?B?aGlBWmZBS25wWWVMZDIzUHdkL05xV011QnRDSjU4aFArT1hkbExjQ2xGbkpr?=
 =?utf-8?B?WlZua3dSYmlqVDBOMGVub2dQRkRrRVJGOTN6OE5pL0t0c1F5bTNGRnl6RklH?=
 =?utf-8?B?TVZHUDYwZ1FuN3F4TE81TVZzZFpPVks3L2NMMkVKTDBqeWFxUkttZGYvZkhi?=
 =?utf-8?B?d0RueGtKUUM1ZHJ1YmViTlRrUENCOXFBby9oT3l0ajNKQ29vbmhUSDBnTzRP?=
 =?utf-8?B?NEpIMXhXMjlhWkVsV2NSTDF2cWtsZHRSQ21CTEJpTDZnZVZKSExnQWF3ZXNh?=
 =?utf-8?B?QlhkWmp4MktmK0NzWmcvb3d2L0ErRTNlMGNjem1XcXU4bE9XVVF6a2VWd0tl?=
 =?utf-8?B?cVBBQmdjQVMvczVyZFVIMldSY2FqSTAxQ05qc0tKTmdoN3VIZVBYckU1anZO?=
 =?utf-8?B?bFJCS3Z3RHdkU1BwWFllbmRMeGZubVVQTmlqVXIyRXNhVFhIYmtZN2FrOEhn?=
 =?utf-8?B?S3JlZkdwTWppaUozR0NKbDJwemRXM2JMdzJBQm13UFFBSE1tQjlobVRNQ3Fk?=
 =?utf-8?B?OWFJN2FaQUFoQmcxRWFTaE9DT1V3dmcraENtR0hsWkp1N2RVSUw3SHVPakdP?=
 =?utf-8?B?RzRNQkRtRUdpSVNuczBNOEgxV2MwWFRVaUF0ZHhsWFVScmpjbmhROUFNZEl3?=
 =?utf-8?B?NDh2disweUcyazhkWnBvSEEvbjgySUlUV2pKWVhuemNmQUkvRUttZ1ZseGhx?=
 =?utf-8?B?T2ZDRlhQYnovWGdZa1REaWVNQ2hMQzNTejhZVjBUaGYxYnBjVU55ZXRSK2Yv?=
 =?utf-8?B?WmdIeGRLWGJUY2R4dVhNU3k2bVJScytmSHd5eEp6QXQ2cVpqc2d0Q0ZJbjRK?=
 =?utf-8?B?MEMwVDNuSXRZT1hYNkNaaXYwZ2JtUWtseExLK2NFdFRMSHVabXJhcjdHeDZF?=
 =?utf-8?B?WW9SM2x3V0Q3Mlo2ZVNucXZmeUtud0ttYVJZMG5oK3J1VW1IcDZzUGRDOVhN?=
 =?utf-8?B?YXlVckloYW5jdFpKRUQ0ai85SXdFcmY4VitBdU1zQ1BwQVdYTWtNYklKOGlJ?=
 =?utf-8?B?SFZCZTZaSTdhdTNFQW5vRDgyNnZMMGVpWGZ3YmZWSnFyTHhEelYyalU5QVF1?=
 =?utf-8?B?RWNWYVVyaHZ2alVjR3Z3TkFNcmRyUlEzY3NDWVBHUnIvcnlWV2tkWFdwcitp?=
 =?utf-8?B?VkJBOXE2b0N4N1ovbkdCVTZNNjBid0l1VnZSV3JqYkduOEJJZUhVYmIwQ0Q5?=
 =?utf-8?B?S3lMNFNhZlhWVEtiY3I1dFhCQnZySTI0ZU9xU1hRcklJT0I3d2xYMVB4OTBt?=
 =?utf-8?B?NitxVVgxQ00zNy9BRG9sTjhaR2gyU1lnQURZdlRNbkFXSGQ5V2hyQUQ3VUpv?=
 =?utf-8?B?RnF2NUJncW96STgyN2gzS1F2US9oMzlKNnp6Q05Eci9LVXg1aCt5UTNBNzBu?=
 =?utf-8?B?VmZrelFXL0ZPelZkMUMxRmxwWUpXcmkrTEpITmtYNk1nMWZ2RnQvdHQyKzZJ?=
 =?utf-8?B?T05sVnJRb2pFQ1VKOFM4a1BYSFJkUy8vWHc2Y3poaHQxYzNrSXVHNjRIWDNX?=
 =?utf-8?B?djVWOEV0NXN6a0d6aDE0M3lNQVRYWVprVlhXWUFRU1MyV0UxVHlDTUV4S045?=
 =?utf-8?B?SmppbGZUb08vcmZCS0hXcy9qVHJOUHFiT28vSVVmdEF1WS9JQ1M3WmJSNytW?=
 =?utf-8?B?bkFDS2xJOGlyMmJDd0lHeC8vR203Y3hxWkk0OFdrN3NhMnI4NGNHNXZ4ZHpj?=
 =?utf-8?B?NVhKamNTOUo2alpLVk9LcytRVnR6VWJ2dkQ0dGJrTXlJb2lDcC9qZFVrNTJB?=
 =?utf-8?B?SEJvOGsrUVZXQzVVMW1oRmRpMCtBR3lCOEt4aEQvaHJITlJwdXY0YVczcjh2?=
 =?utf-8?B?MzF5WEc2a3FuVUx4TzFrdTRPQitMbHhVc2JuSlRzc2NuVTZGYmxGSnJ2K0I4?=
 =?utf-8?B?eHFOK2FMK0M4NnB2aTZYUnZpQ3pSNngvN0FtVmhhMkZEQUpiSjhvUVQxZjVI?=
 =?utf-8?Q?fBA4pu+SwBV0E3ATh9ujmdVgT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc664c0-09bd-4651-0961-08dbf2676b3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 12:16:59.7395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zQJO7d88HrukBY5d/Q89XjfeFyZP5ZBmD5MEhUae5cXS17PO4ISoz3IBkTdX7fjG/msOdAecjExcZWXyss2d5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7030

SGkgRmFiaW8gRXN0ZXZhbSwgeWVzLCA3IGlzIGZvciBEUEksIHBsZWFzZSByZW1vdmUgaXQuDQoN
ClJldmlld2VkLWJ5OiBYaW4gSmkgPHhqaUBhbmFsb2dpeHNlbWkuY29tPg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWls
LmNvbT4NCj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMjgsIDIwMjMgODozMSBBTQ0KPiBUbzog
TGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPjsgWGlu
IEppDQo+IDx4amlAYW5hbG9naXhzZW1pLmNvbT4NCj4gQ2M6IHNha2FyaS5haWx1c0BsaW51eC5p
bnRlbC5jb207IHJmb3NzQGtlcm5lbC5vcmc7IHJvYmgrZHRAa2VybmVsLm9yZzsNCj4ga3J6eXN6
dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOyBtY2hlaGFi
QGtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1tZWRpYUB2
Z2VyLmtlcm5lbC5vcmc7IEZhYmlvIEVzdGV2YW0NCj4gPGZlc3RldmFtQGRlbnguZGU+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMi8yXSBtZWRpYTogZHQtYmluZGluZ3M6IFVzZSBidXMtdHlwZXMg
ZGVmaW5pdGlvbnMgZnJvbQ0KPiB2aWRlby1pbnRlcmZhY2VzLmgNCj4gDQo+IENBVVRJT046IFRo
aXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gUGxl
YXNlIGRvIG5vdA0KPiBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
cmVjb2duaXplIHRoZSBzZW5kZXIsIGFuZCBrbm93IHRoZQ0KPiBjb250ZW50IGlzIHNhZmUuDQo+
IA0KPiANCj4gSGkgTGF1cmVudCwNCj4gDQo+IE9uIE1vbiwgTm92IDI3LCAyMDIzIGF0IDk6MDDi
gK9QTSBMYXVyZW50IFBpbmNoYXJ0DQo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5j
b20+IHdyb3RlOg0KPiANCj4gPiA+IEBAIC0xNTcsNyArMTU4LDcgQEAgZXhhbXBsZXM6DQo+ID4g
PiAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47DQo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICBhbng3NjI1X2luOiBlbmRwb2ludCB7DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVtb3RlLWVuZHBvaW50ID0gPCZtaXBpX2RzaT47DQo+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgYnVzLXR5cGUgPSA8Nz47DQo+ID4NCj4gPiA3IHNlZW1zIHRvIGhhdmUgYmVlbiBh
IG1pc3Rha2UsIGFzIHRoaXMgaXMgYSBEU0kgZW5kcG9pbnQsIG5vdCBhIERQSQ0KPiA+IGVuZHBv
aW50Lg0KPiANCj4gYnVzLXR5cGUgPSA8Nz4gd2FzIGFkZGVkIGluIGNvbW1pdCAwYTYxZWY5Y2Mz
MGQNCj4gKCJkdC1iaW5kaW5nczpkcm0vYnJpZGdlOmFueDc2MjU6IGFkZCBwb3J0QDAgcHJvcGVy
dHkiKS4NCj4gDQo+IEFkZGluZyBYaW4gSmkgb24gQ0MgZm9yIGNsYXJpZmljYXRpb24uDQo=

