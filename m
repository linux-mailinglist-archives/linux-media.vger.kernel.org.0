Return-Path: <linux-media+bounces-4878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A294A84F7B3
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 15:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6B341C21D4C
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 14:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CCA6EB47;
	Fri,  9 Feb 2024 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="c9gozVnE"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2076.outbound.protection.outlook.com [40.107.113.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE7A66B4D;
	Fri,  9 Feb 2024 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707489390; cv=fail; b=Yls2gT8jfBsPVJee3zdogBEZzwp4JDjmZx60faLQEsXh7EyDcrgdARbGVARKecb6w2kA26oF4m8GlRY0i+2xiTOCk3Xe6isFpjwHWnyoAw9/y0g7HZCDQNZ8GDXSamU+G1OHc/EDi0QK8XadLEar5ejXzjaOhQil04sYyYX5W20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707489390; c=relaxed/simple;
	bh=ETJzyr7gx5qiHTf7X1jc1ZCsYdagoNS8xY88cn9nOlE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jdevVePmXnF6Um/2Dq0jEyzKuhRb/biHPNaTmIHQ4wNudaPVU4nWSjtu0n5F3gv7LzC1ttq7Fwa/EZ1+neNuKYwWDFK6lXAfN0Ka6cMyoO7dSJwQwzNq+RFUuQcEJISeImHUyGJme4xOg5+JN6totVVeEKFbdiRDQtcW6WGkleM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=c9gozVnE; arc=fail smtp.client-ip=40.107.113.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qsk+1SqQQtdQdEP1ekIEAwVicHX6+s3FzVra7J3D1EmbWutwZIHL87zNY7izjY0oMjYo9MC0D44aB1Lz3cAeZtbiZ1VE9jBM7kLAbl7nkqWEQMIdg2h8f37M4/92ZdXgQmo8OVBI6JE2LevUSrH5CN+MnWqfSieWBpd76hfo8Vcg95blSKSCur9tHl4SodZX7kRJE5CLDPZAINgmQjUAbgRoLIq6kWX+hCeF4HN0RD3zMeskig8xZ1xZ3ahU3giVyVki8Ib0ni5Ui8fTjU9IH/omSg+iddlWaXbVpzT7uNDdzGudG5Q/MNjLEfHvChs6KPFexdHwLYyO+KOifB2UgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETJzyr7gx5qiHTf7X1jc1ZCsYdagoNS8xY88cn9nOlE=;
 b=cEY4uzDJJP6JHPY+Ejz2AX6lD6UQZncUx0FbRUm1l2XJhbYXadBfkVuuFlZNKsv51plhku9SujYAzX/4iLI35+fmobZPIo2oWdcFOvSV5WRKHPrjkKrZlOE1HqJD9Z9bMVvFjlxsukupUwAsH9SUsRasntd/H00R/1L940yaP7K8Lm/6JRlJEwthRMcRi8K72El2qkqG9S5eKszka9405HBa+euumNQsk7fu6SuSu+3dVIUfBlZuF25SDNVWXAqrJVHmnF25zJtiAfPCVGqgFovbiok22ieUdYifB9Jfey+bFvMee5r5Da6lGb8rB7HH1B42GJq+MPit4C4HC/6n5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETJzyr7gx5qiHTf7X1jc1ZCsYdagoNS8xY88cn9nOlE=;
 b=c9gozVnE4SYom8iot6JKniIn54K84jTNIRFa8Ik6e8OUglQTTcPH7Sj7PFkla8QqCUj0F5msTXel7rcnPYJb/xybpTiYMryOVtyDaC4E2W8O9e0VZFaLvrgil8zfD+a7Kf8BwP9aLFA40EwERy8dDxGKeYIU2lgIoOVCFcLey18=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB10068.jpnprd01.prod.outlook.com
 (2603:1096:400:1e9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.44; Fri, 9 Feb
 2024 14:36:22 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7270.028; Fri, 9 Feb 2024
 14:36:22 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
Subject: RE: [PATCH v2 5/5] arm64: dts: renesas:
 r9a07g043u11-smarc-cru-csi-ov5645: Reduce I2C frequency
Thread-Topic: [PATCH v2 5/5] arm64: dts: renesas:
 r9a07g043u11-smarc-cru-csi-ov5645: Reduce I2C frequency
Thread-Index: AQHaUFwCasVyX+Z+l0SMEVmNhiL9xrDsHTmAgAAe0VCABi7lcIAPvXqQ
Date: Fri, 9 Feb 2024 14:36:22 +0000
Message-ID:
 <TYCPR01MB112693439518B0DA3E7E11693864B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
 <20240126133116.121981-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdUa+wd36-ErDRgb91KpRbryNYzA2Mmhvzjx0-_47=zfdg@mail.gmail.com>
 <TYCPR01MB11269FEE3A8C6D695CBBACEE086792@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB11269379C39A0242C9F87A40E867D2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TYCPR01MB11269379C39A0242C9F87A40E867D2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB10068:EE_
x-ms-office365-filtering-correlation-id: fc019088-8af4-4f09-c6b4-08dc297c7cd2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FJPx1/3pslKIQZMZnF02qsV3ERrZdUDXQAYi9jisMznSpj8vhXcin2oox8H+EaT0McZxDawe17TogT1qT9pVw1BLPSVJkffohYOiCTHIp9svg7mrgMa5hB5ZhlYchnK4jeLf2KGipOrb1fQq/CTPVSfwo7YHm5og+xCAf6Ih9V4dEhJA/TWsyjIENrZ2as3wlFEJdNcFkkuSZ8y9TxrsIa8qYJYw2LCi1KSRMqRWPNccOEuG39t2mB5fXJDA6tb3MB25bHjRJpYGP/sPZKJlItvR9kOnnaOjYfRgUKkfh5v61p0y+c9MIBIIFfqiNRJOIeZj80oPtjsRLmaHkCA+E2Ke6yzz16ake/gRJwQwcYJkIGoMmQo7hSyTnRv/iaQpds76+udRsObCvxa1tK53w01cDXlBS6pfZVbmzpNhbgl0FWqzIa11Ad+CEcMeCTe0+gEYSZ39TdR3E/4PnlJzNhM0jkrxiq6MmPEAJixtv1TVCQlICAJRsoOamT8uWqVRik8SW5DI6yrUfaiUSM1LGbIYlNmNvxM5K5tTs1YfnJvD3609WoksL28cFGrHSA4cIGIKZmqcRW9ZPpEQHcRZgQX/+FFjGzldwQTFYA/l5PtGH9nBy9JMsgrQXybZNAcc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(396003)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2906002)(86362001)(41300700001)(110136005)(33656002)(83380400001)(7696005)(71200400001)(53546011)(9686003)(6506007)(38070700009)(26005)(478600001)(7416002)(66476007)(5660300002)(316002)(4326008)(76116006)(54906003)(66946007)(64756008)(66446008)(66556008)(8676002)(8936002)(52536014)(122000001)(38100700002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eW51OHR2RENoUHo1cHE3RkVDY0RwaktBQWZNMDFicW9VQ0trUWhXT21oOEsw?=
 =?utf-8?B?aS96c1gzZVpkaGZHaDk4L1hnNStQQy9RZFBTdzBpNk5FVVdjMDVSTEJpeUZX?=
 =?utf-8?B?WmRyZThOM214NmZ3UkxpanJXTyt4ZWVld1EvVy9MdDZQbjJkQ3NJWTh4Nktt?=
 =?utf-8?B?QmkvY0tWQk54WlNLZW5VSkpSSjR3K0FkRHR0Q3F4MHRJcFc4N2wyb3ZWeVE0?=
 =?utf-8?B?bks1TS9zd0JLOU1FbTFjeCttdFVDanJ4Y0lwc1VVU2VGM2htZ2NyUTIvQXRw?=
 =?utf-8?B?TzlXMHF5L0NyS1o2cUw3K1JpM2tIbGZUUnhDRUdvbnZwWGpDWGp6RzBPWkN1?=
 =?utf-8?B?bEt5aXE3VGxiZHYvcm1zSTUyeUYrZFRHZHljOCtSN2JRVzdlSktmZ2J6c3Za?=
 =?utf-8?B?RGltVFRWNEN0RGR0RXVVZW0ycXp6RmZmaWNFdHhyVGVuWEVRWHdTNU5yZ3ho?=
 =?utf-8?B?VWJERXB5OVlFNGU3bDNOMk9lV3E0dFdYTlJKdm94UzZMdmk0UHkreStQOUZx?=
 =?utf-8?B?dlM4d1VmSXBabUFQWUtQMVFpZmpHY0pGaWUrQ2JIQ1hoMVRJeHZjSzFxLzJi?=
 =?utf-8?B?TUxOR0xiRzQzSlpzWS9SL043K1pzUHYvdXJwVkgrUEtrK2F3MGlTUTE2MVkv?=
 =?utf-8?B?dGtpS2xVYTk0MThjWjhOVUhtRW1RSUNTdGVFWlAvL0RuK2p3dy9aMlBSTFoy?=
 =?utf-8?B?SEtjbkdpbDJ5c1dWRVVjV2ZVcFl4cDFBVWpFUGczMjlUeDlGVVhyeGRURTVV?=
 =?utf-8?B?YkpNeDg4Sk9qZnpUclprM1pkYlQ5dmlCcnZPcThxYUVCTkUrOGhMTFI3WGRP?=
 =?utf-8?B?WkFFbUxjd3A0bWI4SklVaWc1TGw3cmw2Y3RkcFVBdEF3TkZNbEhXdXlqR0xk?=
 =?utf-8?B?RDZuUWZFQTNKT05zZldJZXR3U0wwdks3c1hUMy9uMjliZjNNcGZuOG5SUlIx?=
 =?utf-8?B?SVhCaEFZYnAwSTIxdXRlMG9qdGUrSU5OK3pFOXFMRmdkQjlHS0tFa2Jvcmsr?=
 =?utf-8?B?WGdpdGFuZ1lHRlV4S0NwbFgvelVZbWt1NVFGTnpzbkVZTWRNTjR4ZFJ4NHVE?=
 =?utf-8?B?bUQyWThnSmw5M0FJcFE2dGFQTlJGbVJaZ05INGVlSURKUkQydjc5U1lHZlcy?=
 =?utf-8?B?dm9oaWZkZ2F5M3ZoUjNaaFZnLzVyOHFQejBiM0FuaGVhRTZsRjZ6SUZhcmEw?=
 =?utf-8?B?UVRXeFEzTWU2TUtMbjlid29XeUgydDJ0ZEZvanZMWm9TM00zNklnaGg5WFhy?=
 =?utf-8?B?ZkF5NGM4YnMxUS9jUzNYekJvZ09XUXNzZkxoNEg2K29RZUg2T2RSZGJvY3RT?=
 =?utf-8?B?ZHZIUXZZUkd6U3EzZEtFRk5kK1pkRUVsNmM4czAyYmVaVmN2VFVtNktZOEhp?=
 =?utf-8?B?R2l0Z01JbGhCMENaalN0TUx0NzFUdGhOVGViSG9LM09MVVNva25hU0JuNktj?=
 =?utf-8?B?WGJEcWdRN2lreVFXaTFQOWdjVUJEbnpFTXpYQTBmWHdDTnkzc0xxOFkwbUMy?=
 =?utf-8?B?eU12anhSYWxBeU5heVdob0tpaExJOHZPRHRHNnZ4ZmxhL0tiQzV3Nm9lY0Fa?=
 =?utf-8?B?ZVZVYURVMTdHMlk2WUNqcy9vaVVHMFlNNmVFRzlNakVvenk4MFk1WFFZc1VU?=
 =?utf-8?B?TDh0ck4ybzJOdXg2VmdSMnRrS3NvYVZEU2xhMWsrblBwN1hJaStIMkh4bnhP?=
 =?utf-8?B?aDR1YStLL2tVc1ZubmZQM2ZjREFrWmR5SGpqSnFKc0h0UHIrKzZjSW5ZRUhS?=
 =?utf-8?B?V291SFhmTm5QUGlDNnNHN3orWnlCQWdGWW5xY1c3NVNDTlp5K0VDaDdVR0Ni?=
 =?utf-8?B?UGlkRjRJdU5yck9rUzJOOVVYUnJiT2ozbkEwME1sa0t3TjVsM2RxWk9kSFhm?=
 =?utf-8?B?eGRSb0Z0cEs4UHhtTnRmdE5BeUJIMUxSYXVEaEt5U1pPSjQ2cjkyaUtQTkJi?=
 =?utf-8?B?NW0wa2szYmlReTNDdEhPelJucXBpRU5Db3k5dVIvbEx4bXVoM29QaWNLRHZs?=
 =?utf-8?B?Q3JydHJLdlBGaXFSaEo3T2xrdTRDQmNsc1VHU3kwT0dsbGtnemV5c2YyRVU4?=
 =?utf-8?B?R2hHZkhSZDZWbkYyVWkzdVY3K1psamV0NTVlTzk3R1IvNms3ZzVaRDh0eWph?=
 =?utf-8?B?MjRLdG9LSWswcm8rUkh3bmV3RDlJREszN0gxNW4wTEprSC9ZRlRGT3hlQVhW?=
 =?utf-8?B?M2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc019088-8af4-4f09-c6b4-08dc297c7cd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 14:36:22.6194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /y+TOZ6ItNOxV+gLUT3Cdg/LyF/5OL5drRAvhzUa9v9UmJU6uSuka6m/JtWwAsuPcpyGVz5MfVynxCgZ4oxFeZDwGuSwMVqGMrjVdkoXc34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10068

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBE
YXMNCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAzMCwgMjAyNCAyOjE1IFBNDQo+IFN1YmplY3Q6
IFJFOiBbUEFUQ0ggdjIgNS81XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cwNDN1MTEtc21h
cmMtY3J1LQ0KPiBjc2ktb3Y1NjQ1OiBSZWR1Y2UgSTJDIGZyZXF1ZW5jeQ0KPiANCj4gSGkgR2Vl
cnQsDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogQmlqdSBE
YXMNCj4gPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMjYsIDIwMjQgMzo1NyBQTQ0KPiA+IFN1Ympl
Y3Q6IFJFOiBbUEFUQ0ggdjIgNS81XSBhcm02NDogZHRzOiByZW5lc2FzOg0KPiA+IHI5YTA3ZzA0
M3UxMS1zbWFyYy1jcnUtDQo+ID4gY3NpLW92NTY0NTogUmVkdWNlIEkyQyBmcmVxdWVuY3kNCj4g
Pg0KPiA+IEhpIEdlZXJ0LA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQo+ID4N
Cj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiA+ID4gU2VudDogRnJpZGF5LCBKYW51
YXJ5IDI2LCAyMDI0IDE6NTMgUE0NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgNS81XSBh
cm02NDogZHRzOiByZW5lc2FzOg0KPiA+ID4gcjlhMDdnMDQzdTExLXNtYXJjLWNydS0NCj4gPiA+
IGNzaS1vdjU2NDU6IFJlZHVjZSBJMkMgZnJlcXVlbmN5DQo+ID4gPg0KPiA+ID4gSGkgQmlqdSwN
Cj4gPiA+DQo+ID4gPiBPbiBGcmksIEphbiAyNiwgMjAyNCBhdCAyOjMx4oCvUE0gQmlqdSBEYXMN
Cj4gPiA+IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4g
PiBSZWR1Y2UgaTJjIGZyZXEgZnJvbSA0MDAtPjEwMCBrSHogb24gUlovRzJVTCBTTUFSQyBFVksg
YXMgdGhlDQo+ID4gPiA+IGNhcHR1cmVkIGltYWdlIGlzIG5vdCBwcm9wZXIgd2l0aCB0aGUgc2Vu
c29yIGNvbmZpZ3VyYXRpb24gb3ZlciBJMkMuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBU
aGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4gPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzdTExLXNtYXJjLWNydS1jc2ktb3Y1NjQ1
LmR0DQo+ID4gPiA+IHNvDQo+ID4gPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNh
cy9yOWEwN2cwNDN1MTEtc21hcmMtY3J1LWNzaS1vdjU2NDUuDQo+ID4gPiA+ICsrKyBkdA0KPiA+
ID4gPiArKysgc28NCj4gPiA+ID4gQEAgLTE5LDMgKzE5LDcgQEAgJm92NTY0NSB7DQo+ID4gPiA+
ICAgICAgICAgZW5hYmxlLWdwaW9zID0gPCZwaW5jdHJsIFJaRzJMX0dQSU8oNCwgNCkgR1BJT19B
Q1RJVkVfSElHSD47DQo+ID4gPiA+ICAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8JnBpbmN0cmwgUlpH
MkxfR1BJTygwLCAxKSBHUElPX0FDVElWRV9MT1c+Ow0KPiA+ID4gPiB9Ow0KPiA+ID4gPiArDQo+
ID4gPiA+ICsmaTJjMCB7DQo+ID4gPiA+ICsgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDEwMDAw
MD47IH07DQo+ID4gPg0KPiA+ID4gSXMgdGhpcyBhIGxpbWl0YXRpb24gb2Ygb25lIG9mIHRoZSBJ
MkMgZGV2aWNlcyBvbiB0aGUgYnVzLCBvciBhIFBDQg0KPiA+ID4gZGVzaWduIGlzc3VlPw0KPiA+
DQo+ID4gQ3VycmVudGx5IHZlcnNhMyBjbG9jayBnZW5lcmF0b3IgY29ubmVjdGVkIHRvIHRoZSBz
YW1lIGJ1cyBhbmQgaXQNCj4gPiB3b3JrcyBvayB3aXRoIDQwMGtIeiBjbG9jay4gTWF5YmUgaXQg
aXMgc3RyZXNzZWQgbm90IHRoYXQgbXVjaA0KPiA+IGNvbXBhcmVkIHRvIE9WNTY0NSBzZW5zb3Ig
Y29uZmlndXJhdGlvbi4NCj4gPg0KPiA+IEF0IHRoZSBtb21lbnQgd2l0aCA0MDBrSHogSTJDIGJ1
cyBjbG9jaywgQ2FtZXJhIGNhcHR1cmUgaXMgbm90IHdvcmtpbmcNCj4gPiBwcm9wZXJseSBvbiBS
Wi9HMlVMLCBidXQgd2l0aCBzYW1lIGJ1cyBmcmVxdWVuY3kgdGhlIHNhbWUgd29ya3MgZmluZQ0K
PiA+IG9uIFJaL3tHMkwsRzJMQyxWMkx9Lg0KPiA+IFRoZXJlIG1heSBiZSBzb21lIGhhcmR3YXJl
IGRpZmZlcmVuY2VzIHdoaWNoIGlzIGNhdXNpbmcgdGhpcyBpc3N1ZS4NCj4gPg0KPiA+ID4NCj4g
PiA+IERvZXNuJ3QgdGhpcyBuZWVkIGEgRml4ZXMgdGFnPw0KPiA+DQo+ID4gSSBjYW4gY3JlYXRl
IGEgbmV3IHBhdGNoIHVwZGF0aW5nIGJ1cyBmcmVxdWVuY3kgYXMgMTAwa0h6IGFuZCBhZGQNCj4g
PiBmaXhlcyB0YWcuDQo+ID4gQWZ0ZXIgdGhpcyBJIHdpbGwgZHJvcCB0aGlzIHBhdGNoIGFzIGl0
IG5vIGxvbmdlciBuZWVkZWQuDQo+ID4NCj4gPiBQbGVhc2UgbGV0IG1lIGtub3cuDQo+IA0KPiAr
IG1lZGlhDQo+IA0KPiBBZGRpbmcgYSBkZWxheSBhZnRlciBTb2Z0d2FyZSByZXNldCBtYWtlcyBp
dCB0byB3b3JrIGF0IDQwMGtIeiB3aXRoDQo+IFJaL0cyVUwgU01BUkMgRVZLLg0KPiANCj4gU28g
bm90IHN1cmUgd2UgbmVlZCB0byBhZGQgZGVsYXkgYWZ0ZXIgc29mdHdhcmUgcmVzZXQ/DQo+IA0K
PiBOb3cgYWZ0ZXIgT1Y1NjQ1IGdwaW8gcmVzZXQsIHRoZW4gdGhlcmUgaXMgMjBtc2VjIGRlbGF5
IGFuZCB0aGVuIGFnYWluIHdlDQo+IGFyZSBpc3N1aW5nIHNvZnR3YXJlIHJlc2V0IGFuZCB0aGVy
ZSBpcyBubyBkZWxheSBhZnRlciB0aGlzIGZvciB0aGlzDQo+IHNvZnR3YXJlIHJlc2V0Lg0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0NS5jIGIvZHJpdmVycy9tZWRp
YS9pMmMvb3Y1NjQ1LmMgaW5kZXgNCj4gYTI2YWMxMWM5ODlkLi5kNjdhNWUyM2ZlNWEgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0NS5jDQo+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvaTJjL292NTY0NS5jDQo+IEBAIC02MjIsMTEgKzYyMiwxOSBAQCBzdGF0aWMgaW50IG92NTY0
NV9zZXRfcmVnaXN0ZXJfYXJyYXkoc3RydWN0IG92NTY0NQ0KPiAqb3Y1NjQ1LCAgew0KPiAgICAg
ICAgIHVuc2lnbmVkIGludCBpOw0KPiAgICAgICAgIGludCByZXQ7DQo+IA0KPiAgICAgICAgIGZv
ciAoaSA9IDA7IGkgPCBudW1fc2V0dGluZ3M7ICsraSwgKytzZXR0aW5ncykgew0KPiAgICAgICAg
ICAgICAgICAgcmV0ID0gb3Y1NjQ1X3dyaXRlX3JlZyhvdjU2NDUsIHNldHRpbmdzLT5yZWcsIHNl
dHRpbmdzLQ0KPiA+dmFsKTsNCj4gICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKQ0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiArDQo+ICsgICAgICAgICAgICAgICBp
ZiAoc2V0dGluZ3MtPnJlZyA9PSBPVjU2NDVfU1lTVEVNX0NUUkwwKQ0KPiArICAgICAgICAgICAg
ICAgICAgICAgICBmc2xlZXAoMTAwMCk7DQo+IA0KDQpUaGlzIGlzc3VlIHNlZW4gb24gUlovRzJM
IFNNQVJDIEVWSyBhcyB3ZWxsLiBNeSB0ZXN0aW5nIG9uIEcyTCBmYW1pbHkgc2hvd3MNCndlIG5l
ZWQgdG8gYWRkIGRlbGF5IHRvIG1ha2UgT1Y1NjQ1IHRvIHdvcmsgQDQwMGtIWi4NCg0KSSBhbSBu
b3Qgc3VyZSBhbnkgb25lIHRlc3RlZCBPVjU2NDUgd2l0aCBJMkMgYnVzIGZyZXF1ZW5jeSA0MDBr
SHo/DQoNCkNoZWVycywNCkJpanUNCg==

