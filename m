Return-Path: <linux-media+bounces-41815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F45B45309
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 11:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BA7D5C0DCE
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 09:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A508F3093AB;
	Fri,  5 Sep 2025 09:18:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021075.outbound.protection.outlook.com [40.107.57.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5BACA5A;
	Fri,  5 Sep 2025 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063897; cv=fail; b=YSIupmI6yCeIWH9cx4hgA3utwDHkGRYQEnh+cUDhZ8Sawcoitt8zVr24MagC3gVwaRlsWPHh0eua6jrwkKuolDY9Q8GkIPLcyZTm7la75tUL7iqkJUWagxc65TWf6Wxat8uUbLTauhYHsy8rWrTjJxxziAlFpL28urdoc4WMR+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063897; c=relaxed/simple;
	bh=YWSqOGcnKtSgAID9KOKw5wb1aU7+S4MeaZ/VB3eI83Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TOKW0d6aC+zbyPewxoS7jZ1eUvAiInh6/wwRAtdoW3yZ7Ep2R9Qc3TMq3bVNg81efhOlgvI5X/uRRzRPrQoR4zUK2K/Os/O+g9tvs+vLSdThvv1DYmoCj4wdH/zLuu5F7q7xl2zBHfD+6er9Sq3YHbZDf/gX4Pe8IzC0U9eLOks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTOfB6hhb98f6WyoHTNSozG3hkowzZbCvRrBfJPjEPiveg9VjtjoqPDtM/mo9uzUlYjImGHnpCRYCBiwba2YqeDSQTrHi/Mk7ZIgzX0sx6Lh627dy1W6ymHtphYXCdVgx/n4yTnor//lkd3LnEY1C/sHhVuhNwHSVek4doHcMsGUqa3bhjStrSuayCdP44SnoFnVd0hRDvP2B5eLsqRqeag7U7xBW7Cz6kibj2NQn5USWOkbjTlIO6hhmZeXe9i5yHfH7nAgb3jvaPOKA750YGVZb3WMT9y5jHUpcLU9mqdWOuQjugZT2OjxTNjJ9LqFPDhgizwxsx9V8gJ0u5PKbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWSqOGcnKtSgAID9KOKw5wb1aU7+S4MeaZ/VB3eI83Y=;
 b=bnlZii5h4oDQRwRikvBFsTopS14z18VyhD7DPRWGAObwOSODo/Sfb7aaDh1zZUe2Ockk+iB5/2VOdoziSYDyCEij9JLIn0tDow+K8pxcKLCLwKQxgObj1l87Lfh7iEulHjZPZ5EDV/qRc/d11hnSSSIKDZN3I2a/QL5tanMQdb+Z0g44+DLLuHNb1wSTymIVmWuFImzpPa2BJYAdhClA2MGaG9kefyO1+Phhb9unGPkI6gzzTuk+9cEZTGtEAxqOzBzvFN29viZFxgoYkTvJZBGKelumEsOxSQH/8tITSbY1JmuA3LKVERe1s2+71BD+LJKwLadFvSv9bLZY6lweiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB0656.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:164::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 09:18:08 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 09:18:08 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Matthias Fend <matthias.fend@emfend.at>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bsp-development.geo@leica-geosystems.com"
	<bsp-development.geo@leica-geosystems.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
Subject: Re: [PATCH v2 2/2] media: i2c: add Himax HM1246 image sensor driver
Thread-Topic: [PATCH v2 2/2] media: i2c: add Himax HM1246 image sensor driver
Thread-Index: AQHbzg6GKn3zTRAwOESLPs4RpQgVqbSDrM/a
Date: Fri, 5 Sep 2025 09:18:08 +0000
Message-ID:
 <PN3P287MB1829BA783455C6AB967AACCB8B00A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250526-hm1246-v2-0-6b882827a3a5@emfend.at>
 <20250526-hm1246-v2-2-6b882827a3a5@emfend.at>
In-Reply-To: <20250526-hm1246-v2-2-6b882827a3a5@emfend.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN0P287MB0656:EE_
x-ms-office365-filtering-correlation-id: c5d96d40-6071-4b04-570c-08ddec5d20f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MzRULszyHtozs9IGI7ZELUzFB7yf6qECVR7HFAbSFirRPqDaQSbh5PrlUG?=
 =?iso-8859-1?Q?OT2t2Y0pNZiWF+6lx53yZcmvJOpvOPaJ5+g8RcakkVMbaXCJa39QSOh865?=
 =?iso-8859-1?Q?tjeYN68REYHjHVHo5IfWDHP6uHT1Ky/nxmeZeSFSm/9I5gAxXN/U3tSagP?=
 =?iso-8859-1?Q?yK5gdl1C6tSXZt5uojoyLKwJhExIXTPVJ/DzSF4/UISCX5kzn/n8fmlbQM?=
 =?iso-8859-1?Q?9o0CSS58tbPKSdcJyHH+ctDpsNO0b4B5ifY3zceXRx16iPwGYOmxAlvQay?=
 =?iso-8859-1?Q?YN2qngX5CK3O9sjVYh7fAIbObvjynnJ9pqo8+Ps9V129vsA8C2lZrUD7Fn?=
 =?iso-8859-1?Q?t/ip49Zt7fLfDIFvXsMTwakiaMl+Igarb8n+Pc2iUCNvB1E6wYKRqbQv/I?=
 =?iso-8859-1?Q?6R9U+a8P52cWkhSa/LZLtytrC8JRxYNJxYlurCYmNjvZi3IeqniVZmXCJC?=
 =?iso-8859-1?Q?j6a/eNwbrAvRTwjy+r/MtJI3j+/oRa4HKVpfE+6TuyuFDlJkYftYWRzPqi?=
 =?iso-8859-1?Q?FwcGZzq/43lLVlh1XZ0oSyrJULhWEqKZA5LStRuPjzUNJwayayneNLU2dg?=
 =?iso-8859-1?Q?seZFhThui2/1t8zlowu0gStGLOjY8QsaP2rZEJb8erYFgLhGh3cK4NEWNQ?=
 =?iso-8859-1?Q?Y7y3sxdq934UBTGztw0ucdnISVePEwLrqQFjMYpPO8AbyS6rEWSJxLRgq/?=
 =?iso-8859-1?Q?JdoX0sQh+bwFBadOFSJLFNVOGK1qswyRcgNVqmO0KgqDZJqsx838GZ8kvJ?=
 =?iso-8859-1?Q?COZoZIi7WD1qDzrveBHRBXtoUo5QNMNUDv5y0mDeh+wH1I6k30ookmV8Ui?=
 =?iso-8859-1?Q?yyvDqvyEQ2wdpdYckszT597q8xNzPEaut+wtjY/mIY19LrdMfllrGnWQVW?=
 =?iso-8859-1?Q?ScanMcyZpuuULbD4iur7EHhjIhzAS+iqcrZgACgPOAFnlN1ki0tG6uytjT?=
 =?iso-8859-1?Q?dSynWGoXq39/vHqHT8b8OmdmFym5GrIgRnbSur5C0auq2zHuzIoo5dWdEx?=
 =?iso-8859-1?Q?qKh+RG3XwFirNxQqJ+vbbeQ+0zSmM0GKDynuX1Z1tIVo5/g4dC31iw1P0g?=
 =?iso-8859-1?Q?ezTUEC1jPcaCmd6kryAvMrDllHgvn/srrXYcahDmPfN4v5F4rZVpA2sq7n?=
 =?iso-8859-1?Q?ayCrmmi78hqaH0pu685FbD5BtvPoHDxjn0vo9mr/RzH3wJaPD/2qfLr/sh?=
 =?iso-8859-1?Q?YMo1v+67bMP0eoVYoXW5R0/pTPH/gne9w6fM+Z/oQNV7Q9zqADazp2+m4+?=
 =?iso-8859-1?Q?hS+XWLMjNOOUAZsPx1p3BgFyWGQG3uQrRJSxZXieBqWEbggKjeqab+O4OR?=
 =?iso-8859-1?Q?YzrEnZ4umuRoB3ygTaBQ3WCNzz9CS2MpIZVG47bxc6ZGMHILQzEE22uSRt?=
 =?iso-8859-1?Q?3gSp/L/Xy1FsiBXyyqN4Tf4pTb/6sSahxJdH1n5EjmdrrPPfTx7MrisFWi?=
 =?iso-8859-1?Q?f9vorOktKKdXu4jw0/IWzhp92X3CW3/zGHu7CkUrFjzy3doAvcFvjI3cB+?=
 =?iso-8859-1?Q?CA+P7Ghmj4x600T5LSJV3BiYT+c0rFzM7ruIKx92eztFt0F8g9j21FWn/x?=
 =?iso-8859-1?Q?rdrK77I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(13003099007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?CklTNME4oouWysyccQjrRz0zTN+0SPCr+FtChv1+HAGme6PdSxKB3R8M1d?=
 =?iso-8859-1?Q?BqoEjpi7xVz3HBhK0A8bFf+BEIWJ7Uxyok8ntQgO/P0rOjVSniB0tuc1yN?=
 =?iso-8859-1?Q?QUIILAUBRofOYQGXy/qNhNqLFUEQ8Fpm0iXUHrmnSMEGVKM8ROIGt1LUnc?=
 =?iso-8859-1?Q?Ko2HpwOIPvefMxSNffChdplyXit+Vur8youDBx7BBcDgGG68trsPDr920V?=
 =?iso-8859-1?Q?bki4N+jOzldquWQ+LzWrnGDfjfFnpSP+O0npdCqdb0BkVrGCE4e1HkWodI?=
 =?iso-8859-1?Q?ucvYJLPOaHEWJ+Bcwz1kYb6qVFzep4y147WBo2Z9wbWKuvp5n5soc0YgPM?=
 =?iso-8859-1?Q?ID+c3398NxNbPZpMfM4gOBVAPdGJuyy+CaBMybqXOpFmyIa2h4P/mv+wxt?=
 =?iso-8859-1?Q?lRD/MzVc7VYW7lktTAzxCcrYI8N+SWMGcz38FxmQci7B8cu+2mMxsfg1Pz?=
 =?iso-8859-1?Q?zGkg6FcdCTUyOlLPux7EIxk3k00GNLFwcUZ0En6Zgim0dLRz9xcaKB5O0p?=
 =?iso-8859-1?Q?SunTYoDSSEsjQ5rvAsNs9vtzAh1wM/XcshPvaZnoxtfZKzRDJE6CWwvT+a?=
 =?iso-8859-1?Q?3ugdsFyidXe9uIFwxaar/Agl6CYEwyXcHMrv6SdTXthVC82Xsor8QJJIFR?=
 =?iso-8859-1?Q?0bvk+BQBtXNW7gKMf/lpPUidCrDAhr9ZBhgpVRSQMxCUmPBQt45CkcJy/P?=
 =?iso-8859-1?Q?jxbAVb9gfVR9nHNaG59PLpKpDvfGJ1X6fDIS77N23tO2q7FwG3GiQ+S/qn?=
 =?iso-8859-1?Q?diNKwZ9hubFc/Hop4OGPY18e27eLKnePMhvQLgIaX01SK13VvjTXYLeZOv?=
 =?iso-8859-1?Q?94OczS1w81q0b52ZzYavo2PK7ZcZo9BiX2GVLhKbkYFhj5USav8sigrsfn?=
 =?iso-8859-1?Q?3jxBYkVj0yu3myBcH+USh5eWS7cqQghuh5T/nSp1AWQ7Wugq3Zn/hN/yRC?=
 =?iso-8859-1?Q?KnWfOpOQzrce2atgQ3WRa20OGJfioNQqruvyWc6KfDWoxM4qdlJUmJqbJL?=
 =?iso-8859-1?Q?zHoNYs8bapdGnqh4UZvNWKoN9VYObWrlJeHWhF82QujbvrM83rlFjL3qx3?=
 =?iso-8859-1?Q?XL4XLZDE7hM6GLeDMIyQepxUBK34s1V8E5PKVBO4RcIbbeoK5lPZb9NTg7?=
 =?iso-8859-1?Q?SsLolayQGvFb0oH2kpV7ydQfPO/IEDgsnQEmLvFDh+FWwLnvmLTkCj2Kug?=
 =?iso-8859-1?Q?JW7BJYITW2gfM1ykXm92Q+AJFo4CIxC9O2yf63cbiYIHRh9zHdFzsMWSLH?=
 =?iso-8859-1?Q?0v3yU9O4jawDleuqUugb5O6yLyo7rodynOsS3ZjjQHhPFWeKdwrgaTwT1C?=
 =?iso-8859-1?Q?2RPBoYrB/log22eLFapCp4UlOUzClvpMq9ESqlZn0CxhS3z0FTQLDXAmMp?=
 =?iso-8859-1?Q?48aCiKcA7LKVNnTYfCuCQAAjdxtbyOUoz2eX0agotigOVX05Bp2vHUih42?=
 =?iso-8859-1?Q?UqouT2MUXfWBrhSUla8U66UCSaDPpdtuO0eEpeC2k6jH3jEWEUbdoH6kBy?=
 =?iso-8859-1?Q?VL38uNs//1/5FyW2QovKaJW2tSsDzTK9abvu+yzp9XQXps2Vusrb1hhCl7?=
 =?iso-8859-1?Q?VsLQY5lkQKL2UrqxL72kNDSupgA1PLkbextGRmX8QVoQ+PjBrr3ZSbCZQ7?=
 =?iso-8859-1?Q?9OrKfK84m/UWMKTfblP7LMAI98IpdzC3Yn0Ffd0fns9JA7Wo/xX1OjTA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d96d40-6071-4b04-570c-08ddec5d20f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 09:18:08.5645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pZ+gwXiN0jlySoRF4RAylbaHnCFdPrQuvZKUWG92GYY2L8C/loP+u26BjVrGE1IXFCjd6TrFbEMzCzYBJ5iWpl+v946oGk7sCeiV/3nA0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0656

Hi Matthias,=0A=
=0A=
Use ./scripts/get_maintainer.pl to get the correct CC list.=0A=
=0A=
> Add a V4L2 sub-device driver for Himax HM1246 image sensor.=0A=
>=A0=0A=
> The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active=
=0A=
> array size of 1296 x 976. It is programmable through an I2C interface and=
=0A=
> connected via parallel bus.=0A=
>=A0=0A=
> The sensor has an internal ISP with a complete image processing pipeline=
=0A=
> including control loops. However, this driver uses the sensor in raw mode=
=0A=
> and the entire ISP is bypassed.=0A=
>=A0=0A=
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>=0A=
> ---=0A=
> =A0MAINTAINERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 8 =
+=0A=
> =A0drivers/media/i2c/Kconfig=A0 |=A0=A0=A0 9 +=0A=
> =A0drivers/media/i2c/Makefile |=A0=A0=A0 1 +=0A=
> =A0drivers/media/i2c/hm1246.c | 1421 ++++++++++++++++++++++++++++++++++++=
++++++++=0A=
> =A04 files changed, 1439 insertions(+)=0A=
>=A0=0A=
> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
> index dd844ac8d9107b0a9d1dd3cf592f0637bd6fdc38..12f156f742eddac0e41f6bb90=
9d0247cbc8ac2a2 100644=0A=
> --- a/MAINTAINERS=0A=
> +++ b/MAINTAINERS=0A=
> @@ -10642,6 +10642,14 @@ L:=A0=A0=A0=A0 linux-kernel@vger.kernel.org=0A=
> =A0S:=A0=A0=A0=A0 Maintained=0A=
> =A0F:=A0=A0=A0=A0 drivers/misc/hisi_hikey_usb.c=0A=
>=A0=0A=
> +HIMAX HM1246 SENSOR DRIVER=0A=
> +M:=A0=A0=A0=A0 Matthias Fend <matthias.fend@emfend.at>=0A=
> +L:=A0=A0=A0=A0 linux-media@vger.kernel.org=0A=
> +S:=A0=A0=A0=A0 Maintained=0A=
> +T:=A0=A0=A0=A0 git git://linuxtv.org/media_tree.git=0A=
> +F:=A0=A0=A0=A0 Documentation/devicetree/bindings/media/i2c/himax,hm1246.=
yaml=0A=
> +F:=A0=A0=A0=A0 drivers/media/i2c/hm1246.c=0A=
> +=0A=
> =A0HIMAX HX83112B TOUCHSCREEN SUPPORT=0A=
> =A0M:=A0=A0=A0=A0 Job Noorman <job@noorman.info>=0A=
> =A0L:=A0=A0=A0=A0 linux-input@vger.kernel.org=0A=
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig=0A=
> index e45ba127069fc0848f1a06ceb789efd3c222c008..70de3d5a186c0bfb439fc81b5=
2a221c2f37a2ca2 100644=0A=
> --- a/drivers/media/i2c/Kconfig=0A=
> +++ b/drivers/media/i2c/Kconfig=0A=
> @@ -127,6 +127,15 @@ config VIDEO_HI847=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 To compile this driver as a module, choose=
 M here: the=0A=
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 module will be called hi847.=0A=
>=A0=0A=
> +config VIDEO_HM1246=0A=
> +=A0=A0=A0=A0=A0=A0 tristate "Himax HM1246 sensor support"=0A=
=0A=
Please add:=0A=
select V4L2_CCI_I2C=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 help=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0 This is a Video4Linux2 sensor driver for the Hi=
max=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0 HM1246 camera.=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0 To compile this driver as a module, choose M he=
re: the=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0 module will be called hm1246.=0A=
> +=0A=
> =A0config VIDEO_IMX208=0A=
> =A0=A0=A0=A0=A0=A0=A0 tristate "Sony IMX208 sensor support"=0A=
> =A0=A0=A0=A0=A0=A0=A0 help=0A=
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile=0A=
> index 6c23a4463527cf762032df663bbfe26be29018c8..9a3bf03c0a4de318294be70bc=
ffc7df713fe7ef9 100644=0A=
> --- a/drivers/media/i2c/Makefile=0A=
> +++ b/drivers/media/i2c/Makefile=0A=
> @@ -44,6 +44,7 @@ obj-$(CONFIG_VIDEO_GC2145) +=3D gc2145.o=0A=
> =A0obj-$(CONFIG_VIDEO_HI556) +=3D hi556.o=0A=
> =A0obj-$(CONFIG_VIDEO_HI846) +=3D hi846.o=0A=
> =A0obj-$(CONFIG_VIDEO_HI847) +=3D hi847.o=0A=
> +obj-$(CONFIG_VIDEO_HM1246) +=3D hm1246.o=0A=
> =A0obj-$(CONFIG_VIDEO_I2C) +=3D video-i2c.o=0A=
> =A0obj-$(CONFIG_VIDEO_IMX208) +=3D imx208.o=0A=
> =A0obj-$(CONFIG_VIDEO_IMX214) +=3D imx214.o=0A=
> diff --git a/drivers/media/i2c/hm1246.c b/drivers/media/i2c/hm1246.c=0A=
> new file mode 100644=0A=
> index 0000000000000000000000000000000000000000..5fe228ae9a433fd5fc89d8f57=
f0a2fc7c16e182f=0A=
> --- /dev/null=0A=
> +++ b/drivers/media/i2c/hm1246.c=0A=
> @@ -0,0 +1,1421 @@=0A=
> +// SPDX-License-Identifier: GPL-2.0=0A=
> +/*=0A=
> + * Driver for Himax HM1246 image sensor=0A=
> + *=0A=
> + * Copyright 2025 Matthias Fend <matthias.fend@emfend.at>=0A=
> + */=0A=
> +=0A=
> +#include <linux/clk.h>=0A=
> +#include <linux/delay.h>=0A=
> +#include <linux/gpio.h>=0A=
> +#include <linux/i2c.h>=0A=
> +#include <linux/module.h>=0A=
> +#include <linux/pm_runtime.h>=0A=
> +#include <linux/units.h>=0A=
> +#include <media/v4l2-cci.h>=0A=
> +#include <media/v4l2-ctrls.h>=0A=
> +#include <media/v4l2-device.h>=0A=
> +#include <media/v4l2-event.h>=0A=
> +#include <media/v4l2-fwnode.h>=0A=
> +=0A=
> +/* Status registers */=0A=
> +#define HM1246_MODEL_ID_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG1=
6(0x0000)=0A=
> +=0A=
> +/* General setup registers */=0A=
> +#define HM1246_MODE_SELECT_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x010=
0)=0A=
> +#define HM1246_MODE_SELECT_STANDBY=A0=A0=A0=A0=A0 0x00=0A=
> +#define HM1246_MODE_SELECT_STREAM=A0=A0=A0=A0=A0=A0 0x01=0A=
> +#define HM1246_MODE_SELECT_STOP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0x02=0A=
> +#define HM1246_IMAGE_ORIENTATION_REG=A0=A0=A0 CCI_REG8(0x0101)=0A=
> +#define HM1246_IMAGE_ORIENTATION_VFLIP=A0 BIT(1)=0A=
> +#define HM1246_IMAGE_ORIENTATION_HFLIP=A0 BIT(0)=0A=
> +#define HM1246_CMU_UPDATE_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x0=
104)=0A=
> +=0A=
> +/* Output setup registers */=0A=
> +#define HM1246_COARSE_INTG_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x02=
02)=0A=
> +#define HM1246_ANALOG_GLOBAL_GAIN_REG=A0=A0 CCI_REG8(0x0205)=0A=
> +=0A=
> +/* Clock setup registers */=0A=
> +#define HM1246_PLL1CFG_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_RE=
G8(0x0303)=0A=
> +#define HM1246_PLL1CFG_MULTIPLIER(x)=A0=A0=A0 (((x) & 0xFF) << 0)=0A=
> +#define HM1246_PLL2CFG_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_RE=
G8(0x0305)=0A=
> +#define HM1246_PLL2CFG_PRE_DIV(x)=A0=A0=A0=A0=A0=A0 (((x) & 0x1F) << 1)=
=0A=
> +#define HM1246_PLL2CFG_MULTIPLIER(x)=A0=A0=A0 (((x) & 0x01) << 0)=0A=
> +#define HM1246_PLL3CFG_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_RE=
G8(0x0307)=0A=
> +#define HM1246_PLL3CFG_POST_DIV(x)=A0=A0=A0=A0=A0 (((x) & 0x3) << 6)=0A=
> +#define HM1246_PLL3CFG_SYSCLK_DIV(x)=A0=A0=A0 (((x) & 0x3) << 4)=0A=
> +#define HM1246_PLL3CFG_PCLK_DIV(x)=A0=A0=A0=A0=A0 (((x) & 0x7) << 0)=0A=
> +=0A=
> +/* Frame timing registers */=0A=
> +#define HM1246_FRAME_LENGTH_LINES_REG=A0=A0 CCI_REG16(0x0340)=0A=
> +#define HM1246_LINE_LENGTH_PCK_REG=A0=A0=A0=A0=A0 CCI_REG16(0x0342)=0A=
> +=0A=
> +/* Image size registers */=0A=
> +#define HM1246_X_ADDR_START_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 CCI_REG16(0x0344)=0A=
> +#define HM1246_Y_ADDR_START_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 CCI_REG16(0x0346)=0A=
> +#define HM1246_X_ADDR_END_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x=
0348)=0A=
> +#define HM1246_Y_ADDR_END_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x=
034A)=0A=
> +#define HM1246_X_LA_START_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x=
0351)=0A=
> +#define HM1246_X_LA_END_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG1=
6(0x0353)=0A=
> +#define HM1246_Y_LA_START_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x=
0355)=0A=
> +#define HM1246_Y_LA_END_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG1=
6(0x0357)=0A=
> +=0A=
> +/* Test pattern registers */=0A=
> +#define HM1246_TEST_PATTERN_MODE_REG=A0=A0=A0 CCI_REG8(0x0601)=0A=
> +#define HM1246_TEST_PATTERN_MODE_MODE(x) (((x) & 0xF) << 4)=0A=
> +#define HM1246_TEST_PATTERN_MODE_ENABLE=A0=A0=A0=A0=A0=A0=A0=A0 BIT(0)=
=0A=
> +#define HM1246_TEST_DATA_BLUE_REG=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0602)=0A=
> +#define HM1246_TEST_DATA_GB_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 CCI_REG16(0x0604)=0A=
> +#define HM1246_TEST_DATA_RED_REG=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x0606)=
=0A=
> +#define HM1246_TEST_DATA_GR_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 CCI_REG16(0x0608)=0A=
> +=0A=
> +/* SBC registers */=0A=
> +#define HM1246_SBC_BOOT_REF2_REG=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x2001)=
=0A=
> +#define HM1246_SBC_BOOT_REF2_PLL_LOCK=A0=A0 BIT(4)=0A=
> +#define HM1246_SBC_CTRL_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8=
(0x2003)=0A=
> +#define HM1246_SBC_CTRL_PLL_EN=A0=A0=A0=A0=A0=A0=A0=A0=A0 BIT(0)=0A=
> +=0A=
> +/* System registers */=0A=
> +#define HM1246_OUTPUT_PRT_CTRL_REG=A0=A0=A0=A0=A0 CCI_REG8(0x2F02)=0A=
> +#define HM1246_POLARITY_CTRL_REG=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0x2F20)=
=0A=
> +#define HM1246_POLARITY_CTRL_HSYNC=A0=A0=A0=A0=A0 BIT(7)=0A=
> +#define HM1246_POLARITY_CTRL_VSYNC=A0=A0=A0=A0=A0 BIT(6)=0A=
> +#define HM1246_PCLK_CTRL_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG8(0=
x2F24)=0A=
> +#define HM1246_PCLK_CTRL_POL=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 BIT(3)=0A=
> +=0A=
> +/* Digital window control & parameter registers */=0A=
> +#define HM1246_DWIN_XOFFSET_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 CCI_REG16(0xD5E4)=0A=
> +#define HM1246_DWIN_XSIZE_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x=
D5E6)=0A=
> +#define HM1246_DWIN_YOFFSET_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 CCI_REG16(0xD5E8)=0A=
> +#define HM1246_DWIN_YSIZE_REG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 CCI_REG16(0x=
D5EA)=0A=
> +=0A=
> +#define HM1246_MODEL_ID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 0x1245=0A=
> +=0A=
> +#define HM1246_NATIVE_WIDTH=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1296=0A=
> +#define HM1246_NATIVE_HEIGHT=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 976=0A=
> +=0A=
> +#define HM1246_VTS_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 65535=0A=
> +=0A=
> +#define HM1246_COARSE_INTG_MARGIN=A0=A0=A0=A0=A0=A0 2=0A=
> +#define HM1246_COARSE_INTG_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0 4=0A=
> +#define HM1246_COARSE_INTG_STEP=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 1=0A=
> +=0A=
> +#define HM1246_ANALOG_GLOBAL_GAIN_MIN=A0=A0 0x00=0A=
> +#define HM1246_ANALOG_GLOBAL_GAIN_MAX=A0=A0 0xE8=0A=
> +#define HM1246_ANALOG_GLOBAL_GAIN_STEP=A0 1=0A=
=0A=
I think it would make more sense to include the following 6 definitions=A0=
=0A=
in the 'Output setup registers' block. However, I don't mind either way.=0A=
=0A=
> +=0A=
> +#define HM1246_XCLK_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 (6 * HZ_PER_MHZ)=0A=
> +#define HM1246_XCLK_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 (27 * HZ_PER_MHZ)=0A=
> +=0A=
> +#define HM1246_PCLK_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 (8 * HZ_PER_MHZ)=0A=
> +#define HM1246_PCLK_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 (96 * HZ_PER_MHZ)=0A=
> +=0A=
> +#define HM1246_PLL_VCO_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 360000=
000=0A=
> +#define HM1246_PLL_VCO_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 680000=
000=0A=
> +=0A=
> +#define HM1246_PLL_INCLK_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1000000=0A=
> +#define HM1246_PLL_INCLK_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2500000=0A=
> +=0A=
> +#define HM1246_PLL_MULTI_L_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0 1=0A=
> +#define HM1246_PLL_MULTI_L_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0 256=0A=
> +=0A=
> +#define HM1246_PLL_MULTI_H_MIN=A0=A0=A0=A0=A0=A0=A0=A0=A0 2=0A=
> +#define HM1246_PLL_MULTI_H_MAX=A0=A0=A0=A0=A0=A0=A0=A0=A0 3=0A=
> +=0A=
> +#define HM1246_PLL_MULTI_MIN \=0A=
> +=A0=A0=A0=A0=A0=A0 (HM1246_PLL_MULTI_H_MIN * HM1246_PLL_MULTI_L_MIN)=0A=
> +#define HM1246_PLL_MULTI_MAX \=0A=
> +=A0=A0=A0=A0=A0=A0 (HM1246_PLL_MULTI_H_MAX * HM1246_PLL_MULTI_L_MAX)=0A=
> +=0A=
> +static const char *const hm1246_test_pattern_menu[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 "Disabled",=0A=
> +=A0=A0=A0=A0=A0=A0 "Checkboard",=0A=
> +=A0=A0=A0=A0=A0=A0 "Ramp",=0A=
> +=A0=A0=A0=A0=A0=A0 "Moving ones",=0A=
> +=A0=A0=A0=A0=A0=A0 "Blending color bars",=0A=
> +=A0=A0=A0=A0=A0=A0 "Color bars",=0A=
> +=A0=A0=A0=A0=A0=A0 "Solid white",=0A=
> +=A0=A0=A0=A0=A0=A0 "Solid black",=0A=
> +=A0=A0=A0=A0=A0=A0 "Solid red",=0A=
> +=A0=A0=A0=A0=A0=A0 "Solid green",=0A=
> +=A0=A0=A0=A0=A0=A0 "Solid blue",=0A=
> +};=0A=
> +=0A=
> +static const s64 hm1246_link_freqs[] =3D {\=0A=
=0A=
Do we really need signed here?=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 42174000, /* 1420x990 @ 30Hz (RAW) */=0A=
> +};=0A=
> +=0A=
> +static const char *const hm1246_supply_names[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 "avdd",=0A=
> +=A0=A0=A0=A0=A0=A0 "iovdd",=0A=
> +=A0=A0=A0=A0=A0=A0 "dvdd",=0A=
> +};=0A=
> +=0A=
> +struct hm1246 {=0A=
> +=A0=A0=A0=A0=A0=A0 struct device *dev;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev sd;=0A=
> +=A0=A0=A0=A0=A0=A0 struct media_pad pad;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 struct regulator_bulk_data supplies[ARRAY_SIZE(hm1246=
_supply_names)];=0A=
> +=A0=A0=A0=A0=A0=A0 struct clk *xclk;=0A=
> +=A0=A0=A0=A0=A0=A0 unsigned long xclk_freq;=0A=
> +=A0=A0=A0=A0=A0=A0 struct gpio_desc *reset_gpio;=0A=
> +=A0=A0=A0=A0=A0=A0 unsigned int mbus_flags;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl_handler ctrls;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *pixel_rate_ctrl;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *link_freq_ctrl;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *exposure_ctrl;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *vblank_ctrl;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *hblank_ctrl;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *hflip_ctrl;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl *vflip_ctrl;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 struct regmap *regmap;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 bool identified;=0A=
> +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *cur_mode;=0A=
> +};=0A=
> +=0A=
> +static const struct cci_reg_sequence mode_1296x976_raw[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 { HM1246_X_LA_START_REG, 60 },=0A=
> +=A0=A0=A0=A0=A0=A0 { HM1246_X_LA_END_REG, 1355 },=0A=
> +=A0=A0=A0=A0=A0=A0 { HM1246_Y_LA_START_REG, 0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { HM1246_Y_LA_END_REG, 975 },=0A=
> +=A0=A0=A0=A0=A0=A0 { HM1246_OUTPUT_PRT_CTRL_REG, 0x20 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x300A), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x300B), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50F5), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50DD), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50A1), 0x02 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50AA), 0x1C },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50AC), 0xDD },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50AD), 0x08 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50AB), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50A0), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50A2), 0x12 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50AE), 0x30 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x50B3), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5200), 0x04 },=0A=
=0A=
^^^1=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5204), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5208), 0x55 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5209), 0x06 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x520B), 0x05 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x520D), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5214), 0x18 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5215), 0x0F },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5217), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5218), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5219), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x521A), 0x50 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x521B), 0x24 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5232), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5220), 0x11 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5227), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5106), 0xC1 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5115), 0xC0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5116), 0xC1 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5138), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5139), 0x60 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x513A), 0x80 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x513B), 0xA0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x513C), 0xA1 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x513D), 0xA2 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x513E), 0xA3 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5140), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5141), 0x60 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5142), 0x80 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5143), 0x81 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5144), 0x82 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5145), 0x83 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5146), 0x93 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C1), 0xC3 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C5), 0xC3 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C9), 0xC3 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51CD), 0xC2 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D1), 0xC1 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D5), 0xC1 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D9), 0x81 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51DD), 0x81 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C2), 0x49 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C6), 0x49 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51CA), 0x49 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51CE), 0x49 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D2), 0x49 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D6), 0x59 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51DA), 0x59 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51DE), 0x59 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C3), 0x20 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C7), 0x38 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51CB), 0x21 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51CF), 0x11 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D3), 0x11 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D7), 0x13 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51DB), 0x13 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51DF), 0x13 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51E0), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51E2), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51F0), 0x42 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51F1), 0x40 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51F2), 0x4A },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51F3), 0x48 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5015), 0x73 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x504A), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5044), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5040), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5135), 0xC4 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5136), 0xC5 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5166), 0xC4 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5196), 0xC4 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C0), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C4), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51C8), 0xA0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51CC), 0xA0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D0), 0xA1 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D4), 0xA5 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51D8), 0xA5 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x51DC), 0xA5 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5200), 0xE4 },=0A=
=0A=
It seems that these register writes are duplicated (see above '1'). The sam=
e entries=A0=0A=
appear earlier in the code, so I suggest keeping only the last occurrence.=
=0A=
=0A=
There might be other repeated register entries as well=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5209), 0x04 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x301B), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3130), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5013), 0x07 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x5016), 0x01 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x501D), 0x50 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0350), 0xFE },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x0343), 0x8C },=0A=
=0A=
I believe this is a line length register, which you are already=A0=0A=
setting in hm1246_setup_moderegs. You can remove this entry here.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x2F03), 0x15 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD380), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3047), 0x7F },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x304D), 0x34 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3041), 0x4B },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3042), 0x2D },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3056), 0x64 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3059), 0x1E },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x305E), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x305F), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x306D), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x306E), 0x0C },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3064), 0x50 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3067), 0x78 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3068), 0x4B },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x306A), 0x78 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x306B), 0x4B },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD442), 0x3D },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD443), 0x06 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD440), 0x63 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD446), 0xB0 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD447), 0x60 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD448), 0x48 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD449), 0x30 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD44A), 0x18 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0xD360), 0x03 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x30AC), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x30AD), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x30AE), 0x10 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x3040), 0x0B },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x2002), 0x00 },=0A=
> +=A0=A0=A0=A0=A0=A0 { CCI_REG8(0x2000), 0x08 },=0A=
> +};=0A=
> +=0A=
> +struct hm1246_reg_list {=0A=
> +=A0=A0=A0=A0=A0=A0 u32 num_of_regs;=0A=
> +=A0=A0=A0=A0=A0=A0 const struct cci_reg_sequence *regs;=0A=
> +};=0A=
> +=0A=
> +struct hm1246_mode {=0A=
> +=A0=A0=A0=A0=A0=A0 u32 codes[4];=0A=
> +=A0=A0=A0=A0=A0=A0 u32 link_freq_index;=0A=
> +=A0=A0=A0=A0=A0=A0 u32 clocks_per_pixel;=0A=
> +=A0=A0=A0=A0=A0=A0 u32 top;=0A=
> +=A0=A0=A0=A0=A0=A0 u32 left;=0A=
> +=A0=A0=A0=A0=A0=A0 u32 width;=0A=
> +=A0=A0=A0=A0=A0=A0 u32 height;=0A=
> +=A0=A0=A0=A0=A0=A0 u32 hts;=0A=
> +=A0=A0=A0=A0=A0=A0 u32 vts_min;=0A=
> +=A0=A0=A0=A0=A0=A0 const struct hm1246_reg_list reg_list;=0A=
> +};=0A=
> +=0A=
> +#define FLIP_FORMAT_INDEX(v, h) ((v ? 2 : 0) | (h ? 1 : 0))=0A=
> +=0A=
> +/* Get the format code of the mode considering current flip setting. */=
=0A=
> +static u32 hm1246_get_format_code(struct hm1246 *hm1246,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *hm1246_mode)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 return hm1246_mode->codes[FLIP_FORMAT_INDEX(hm1246->v=
flip_ctrl->val,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 hm1246->hflip_ctrl->val)];=0A=
> +}=0A=
> +=0A=
> +static const struct hm1246_mode hm1246_modes[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .codes =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [FLIP=
_FORMAT_INDEX(0, 0)] =3D MEDIA_BUS_FMT_SBGGR10_1X10,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [FLIP=
_FORMAT_INDEX(0, 1)] =3D MEDIA_BUS_FMT_SGBRG10_1X10,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [FLIP=
_FORMAT_INDEX(1, 0)] =3D MEDIA_BUS_FMT_SGRBG10_1X10,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [FLIP=
_FORMAT_INDEX(1, 1)] =3D MEDIA_BUS_FMT_SRGGB10_1X10,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .link_freq_index =3D 0,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .clocks_per_pixel =3D 1,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .top =3D 0,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .left =3D 0,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .width =3D 1296,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .height =3D 976,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .hts =3D 1420,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .vts_min =3D 990,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .reg_list =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .num_=
of_regs =3D ARRAY_SIZE(mode_1296x976_raw),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .regs=
 =3D mode_1296x976_raw,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },=0A=
> +=A0=A0=A0=A0=A0=A0 },=0A=
> +};=0A=
> +=0A=
> +static inline struct hm1246 *to_hm1246(struct v4l2_subdev *sd)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 return container_of(sd, struct hm1246, sd);=0A=
=0A=
Use container_of_const.=0A=
=0A=
> +}=0A=
> +=0A=
> +static const struct hm1246_mode *=0A=
> +hm1246_find_mode_by_mbus_code(struct hm1246 *hm1246, u32 code)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 for (int i =3D 0; i < ARRAY_SIZE(hm1246_modes); i++) =
{=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (code =3D=3D hm1246_get_fo=
rmat_code(hm1246, &hm1246_modes[i]))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retur=
n &hm1246_modes[i];=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ERR_PTR(-EINVAL);=0A=
> +}=0A=
> +=0A=
> +static int hm1246_power_on(struct device *dev)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D regulator_bulk_enable(ARRAY_SIZE(hm1246_suppl=
y_names),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->supplies);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "failed =
to enable regulators\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D clk_prepare_enable(hm1246->xclk);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 regulator_bulk_disable(ARRAY_=
SIZE(hm1246_supply_names),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->supplies);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "failed =
to enable clock\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 gpiod_set_value_cansleep(hm1246->reset_gpio, 0);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /*=0A=
> +=A0=A0=A0=A0=A0=A0=A0 * XSHUTDOWN to crystal clock oscillation:=A0 tcrys=
tal typ.=A0 650us=0A=
> +=A0=A0=A0=A0=A0=A0=A0 * Sample bootstrap pin:=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tsample=A0 max. 2000us=0A=
> +=A0=A0=A0=A0=A0=A0=A0 * Built in self test:=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tbist=A0=A0=A0 max. 3000us=0A=
> +=A0=A0=A0=A0=A0=A0=A0 */=0A=
> +=A0=A0=A0=A0=A0=A0 fsleep(6000);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_power_off(struct device *dev)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 gpiod_set_value_cansleep(hm1246->reset_gpio, 1);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 clk_disable_unprepare(hm1246->xclk);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 regulator_bulk_disable(ARRAY_SIZE(hm1246_supply_names=
),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 hm1246->supplies);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_enum_mbus_code(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_mbus_code_enum *code)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (code->index >=3D ARRAY_SIZE(hm1246_modes))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 code->code =3D hm1246_get_format_code(hm1246, &hm1246=
_modes[code->index]);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_enum_frame_size(struct v4l2_subdev *subdev,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *sd_state,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_frame_size_enum *fse)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(subdev);=0A=
> +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode =3D NULL;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (fse->index > 0)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 mode =3D hm1246_find_mode_by_mbus_code(hm1246, fse->c=
ode);=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(mode))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return PTR_ERR(mode);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 fse->min_width =3D mode->width;=0A=
> +=A0=A0=A0=A0=A0=A0 fse->max_width =3D mode->width;=0A=
> +=A0=A0=A0=A0=A0=A0 fse->min_height =3D mode->height;=0A=
> +=A0=A0=A0=A0=A0=A0 fse->max_height =3D mode->height;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_update_controls(struct hm1246 *hm1246,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 s64 pixel_rate, exposure_max, vblank, hblank;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_s_ctrl(hm1246->link_freq_ctrl, mo=
de->link_freq_index);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "link_fr=
eq ctrl range update failed\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pixel_rate =3D div_u64(hm1246_link_freqs[mode->link_f=
req_index],=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 mode->clocks_per_pixel);=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->pixel_rate_c=
trl, pixel_rate,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pixel_rate, 1, pixel_rate);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "pixel_r=
ate ctrl range update failed\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 vblank =3D mode->vts_min - mode->height,=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->vblank_ctrl,=
 vblank,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_VTS_MAX - mode->height, 1,=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vblank);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "vblank =
ctrl range update failed\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hblank =3D mode->hts - mode->width;=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->hblank_ctrl,=
 hblank, hblank, 1,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hblank);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "hblank =
ctrl range update failed\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 exposure_max =3D mode->vts_min - HM1246_COARSE_INTG_M=
ARGIN;=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_range(hm1246->exposure_ctr=
l,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_COARSE_INTG_MIN, exposure_ma=
x,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_COARSE_INTG_STEP, exposure_m=
ax);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "exposur=
e ctrl range update failed\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
> +=0A=
> +static void hm1246_update_pad_format(struct hm1246 *hm1246,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *hm1246_mode,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_mbus_framefmt *fmt)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 fmt->width =3D hm1246_mode->width;=0A=
> +=A0=A0=A0=A0=A0=A0 fmt->height =3D hm1246_mode->height;=0A=
> +=A0=A0=A0=A0=A0=A0 fmt->code =3D hm1246_get_format_code(hm1246, hm1246_m=
ode);=0A=
> +=A0=A0=A0=A0=A0=A0 fmt->field =3D V4L2_FIELD_NONE;=0A=
> +=A0=A0=A0=A0=A0=A0 fmt->colorspace =3D V4L2_COLORSPACE_RAW;=0A=
> +=A0=A0=A0=A0=A0=A0 fmt->ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->co=
lorspace);=0A=
> +=A0=A0=A0=A0=A0=A0 fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;=
=0A=
> +=A0=A0=A0=A0=A0=A0 fmt->xfer_func =3D V4L2_XFER_FUNC_NONE;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_set_format(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 struct v4l2_subdev_state *state,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 struct v4l2_subdev_format *fmt)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_mbus_framefmt *mbus_fmt;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_rect *crop;=0A=
> +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 mode =3D hm1246_find_mode_by_mbus_code(hm1246, fmt->f=
ormat.code);=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(mode))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode =3D &hm1246_modes[0];=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 crop =3D v4l2_subdev_state_get_crop(state, 0);=0A=
> +=A0=A0=A0=A0=A0=A0 crop->top =3D mode->top;=0A=
> +=A0=A0=A0=A0=A0=A0 crop->left =3D mode->left;=0A=
> +=A0=A0=A0=A0=A0=A0 crop->width =3D mode->width;=0A=
> +=A0=A0=A0=A0=A0=A0 crop->height =3D mode->height;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246_update_pad_format(hm1246, mode, &fmt->format);=
=0A=
> +=A0=A0=A0=A0=A0=A0 mbus_fmt =3D v4l2_subdev_state_get_format(state, 0);=
=0A=
> +=A0=A0=A0=A0=A0=A0 *mbus_fmt =3D fmt->format;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->cur_mode =3D mode;=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246_update_controls(hm1246, mode);=0A=
=0A=
I believe hm1246_update_controls could fail, so you should check=A0=0A=
for errors here.=0A=
=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_get_selection(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_selection *sel)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode =3D hm1246->cur_mode;=
=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 switch (sel->target) {=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_SEL_TGT_CROP:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r =3D *v4l2_subdev_state=
_get_crop(state, 0);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_SEL_TGT_NATIVE_SIZE:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.top =3D 0;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.left =3D 0;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.width =3D HM1246_NATIV=
E_WIDTH;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.height =3D HM1246_NATI=
VE_HEIGHT;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_SEL_TGT_CROP_DEFAULT:=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_SEL_TGT_CROP_BOUNDS:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.top =3D mode->top;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.left =3D mode->left;=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.width =3D mode->width;=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sel->r.height =3D mode->heigh=
t;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 default:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_init_state(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 struct v4l2_subdev_state *state)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_format fmt =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .which =3D V4L2_SUBDEV_FORMAT=
_TRY,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .pad =3D 0,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .format =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .code=
 =3D hm1246_get_format_code(hm1246,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 &hm1246_modes[0]),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .widt=
h =3D hm1246_modes[0].width,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .heig=
ht =3D hm1246_modes[0].height,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },=0A=
> +=A0=A0=A0=A0=A0=A0 };=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246_set_format(sd, state, &fmt);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_calc_pll(struct hm1246 *hm1246, u32 xclk, u32 link_fre=
q,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 u32 clocks_per_pixel, u8 *pll1, u8 *pll2, u8 *pll3)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 const u8 pclk_div_table[] =3D { 4, 5, 6, 7, 8, 12, 14=
, 16 };=0A=
> +=A0=A0=A0=A0=A0=A0 const u8 sysclk_div_table[] =3D { 1, 2, 3, 4 };=0A=
> +=A0=A0=A0=A0=A0=A0 const u8 post_div_table[] =3D { 1, 2, 4, 8 };=0A=
> +=A0=A0=A0=A0=A0=A0 const int sysclk_pclk_ratio =3D 3; /* Recommended val=
ue */=0A=
> +=A0=A0=A0=A0=A0=A0 u32 pclk, vco_out, best_vco_diff;=0A=
> +=A0=A0=A0=A0=A0=A0 int pclk_div_index, sysclk_div_index, post_div_index;=
=0A=
> +=A0=A0=A0=A0=A0=A0 u8 pre_div, multiplier_h, multiplier_l;=0A=
> +=A0=A0=A0=A0=A0=A0 bool sysclk_pclk_ratio_found =3D false;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (link_freq < HM1246_PCLK_MIN || link_freq > HM1246=
_PCLK_MAX)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* In raw mode (1 pixel per clock) the pixel clock is=
 internally=0A=
> +=A0=A0=A0=A0=A0=A0=A0 * divided by two.=0A=
> +=A0=A0=A0=A0=A0=A0=A0 */=0A=
=0A=
/*=0A=
=A0* In raw mode (1 pixel per clock) the pixel clock is internally=0A=
=A0* divided by two.=0A=
=A0*/=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 pclk =3D (2 * link_freq) / clocks_per_pixel;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* Find suitable PCLK and SYSCLK dividers. */=0A=
> +=A0=A0=A0=A0=A0=A0 for (pclk_div_index =3D 0; pclk_div_index < ARRAY_SIZ=
E(pclk_div_table);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pclk_div_index++) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 for (sysclk_div_index =3D 0;=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysclk_div_ind=
ex < ARRAY_SIZE(sysclk_div_table);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysclk_div_ind=
ex++) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (s=
ysclk_div_table[sysclk_div_index] *=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysclk_pclk_ratio =3D=3D=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 pclk_div_table[pclk_div_index]) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 sysclk_pclk_ratio_found =3D true;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (sysclk_pclk_ratio_found)=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break=
;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (!sysclk_pclk_ratio_found)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* Determine an appropriate post divider. */=0A=
> +=A0=A0=A0=A0=A0=A0 for (post_div_index =3D 0; post_div_index < ARRAY_SIZ=
E(post_div_table);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 post_div_index++) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vco_out =3D pclk * (pclk_div_=
table[pclk_div_index] *=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 post_div_table[post_div_index]);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (vco_out >=3D HM1246_PLL_V=
CO_MIN &&=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vco_out <=3D HM12=
46_PLL_VCO_MAX)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break=
;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=A0=A0=A0=A0=A0=A0 if (post_div_index >=3D ARRAY_SIZE(post_div_table))=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* Find best pre-divider and multiplier values. */=0A=
> +=A0=A0=A0=A0=A0=A0 best_vco_diff =3D U32_MAX;=0A=
> +=A0=A0=A0=A0=A0=A0 for (u32 div =3D DIV_ROUND_UP(xclk, HM1246_PLL_INCLK_=
MAX);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 div <=3D (xclk / HM1246_PLL_INCLK_MIN)=
; div++) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u32 multi, multi_h, multi_l, =
vco, diff;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi =3D DIV_ROUND_CLOSEST_U=
LL((u64)vco_out * div, xclk);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (multi < HM1246_PLL_MULTI_=
MIN ||=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi > HM1246_PL=
L_MULTI_MAX)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 conti=
nue;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi_h =3D multi / (HM1246_P=
LL_MULTI_H_MIN *=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL_MULTI_L_MAX) +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 2;=0A=
=0A=
HM1246_PLL_MULTI_L_MAX) + 2;=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi_l =3D multi / multi_h;=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vco =3D div_u64((u64)xclk * m=
ulti_h * multi_l, div);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 diff =3D abs(vco_out - vco);=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (diff < best_vco_diff) {=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 best_=
vco_diff =3D diff;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pre_d=
iv =3D div;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi=
plier_h =3D multi_h;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 multi=
plier_l =3D multi_l;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!diff)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break=
;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (best_vco_diff =3D=3D U32_MAX)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 *pll1 =3D HM1246_PLL1CFG_MULTIPLIER(multiplier_l - 1)=
;=0A=
> +=A0=A0=A0=A0=A0=A0 *pll2 =3D HM1246_PLL2CFG_PRE_DIV(pre_div - 1) |=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL2CFG_MULTIPLIER(mul=
tiplier_h - 2);=0A=
> +=A0=A0=A0=A0=A0=A0 *pll3 =3D HM1246_PLL3CFG_POST_DIV(post_div_index) |=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL3CFG_SYSCLK_DIV(sys=
clk_div_index) |=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_PLL3CFG_PCLK_DIV(pclk_=
div_index);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_cci_write_pll(struct hm1246 *hm1246, u8 pll1, u8 pll2,=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 u8 pll3)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct cci_reg_sequence pll_regs[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_PLL1CFG_REG, pll1 },=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_PLL2CFG_REG, pll2 },=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_PLL3CFG_REG, pll3 },=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_SBC_CTRL_REG, HM1246=
_SBC_CTRL_PLL_EN },=0A=
> +=A0=A0=A0=A0=A0=A0 };=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return cci_multi_reg_write(hm1246->regmap, pll_regs,=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(pll_regs), NULL);=0A=
> +}=0A=
> +=0A=
> +static int hm1246_pll_check_locked(struct hm1246 *hm1246)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 u64 boot_ref2;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_read(hm1246->regmap, HM1246_SBC_BOOT_REF2=
_REG, &boot_ref2,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 NULL);=
=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return (boot_ref2 & HM1246_SBC_BOOT_REF2_PLL_LOCK) ? =
0 : -EIO;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_setup_pll(struct hm1246 *hm1246,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 const struct hm1246_mode *mode)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 u8 pll1, pll2, pll3;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_calc_pll(hm1246, hm1246->xclk_freq,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 hm1246_link_freqs[mode->link_freq_index],=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 mode->clocks_per_pixel, &pll1, &pll2, &pll3);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_cci_write_pll(hm1246, pll1, pll2, pll3=
);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* PLL lock time: tpll typ. 100us */=0A=
> +=A0=A0=A0=A0=A0=A0 fsleep(200);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_pll_check_locked(hm1246);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_cci_write_test_pattern(struct hm1246 *hm1246, u8 mode,=
 u16 r,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 u16 g, u16 b)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct cci_reg_sequence tpg_enable_regs[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_TEST_DATA_RED_REG, r=
 },=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_TEST_DATA_GR_REG, g =
},=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_TEST_DATA_GB_REG, g =
},=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_TEST_DATA_BLUE_REG, =
b },=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_TEST_PATTERN_MODE_RE=
G, mode },=0A=
> +=A0=A0=A0=A0=A0=A0 };=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return cci_multi_reg_write(hm1246->regmap, tpg_enable=
_regs,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(tpg_enable_regs), NULL);=0A=
> +}=0A=
> +=0A=
> +static int hm1246_test_pattern(struct hm1246 *hm1246, u32 pattern_index)=
=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 const u16 RGBMAX =3D 0x3FF;=0A=
> +=A0=A0=A0=A0=A0=A0 int pattern;=0A=
> +=A0=A0=A0=A0=A0=A0 u8 mode =3D HM1246_TEST_PATTERN_MODE_ENABLE;=0A=
> +=A0=A0=A0=A0=A0=A0 u16 r =3D 0, g =3D 0, b =3D 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 switch (pattern_index) {=0A=
> +=A0=A0=A0=A0=A0=A0 case 1: /* Checkboard Pattern */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 0;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 case 2: /* Ramp */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 1;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 case 3: /* Moving ones */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 2;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 case 4: /* Blending color bars */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 3;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 case 5: /* Color bars */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 4;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 case 6: /* Solid white */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 15;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r =3D RGBMAX;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 g =3D RGBMAX;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 b =3D RGBMAX;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 case 7: /* Solid black */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 15;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 case 8: /* Solid red */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 15;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r =3D RGBMAX;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 case 9: /* Solid green */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 15;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 g =3D RGBMAX;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 case 10: /* Solid blue */=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 15;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 b =3D RGBMAX;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 case 0: /* Disabled */=0A=
> +=A0=A0=A0=A0=A0=A0 default:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mode =3D 0;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern =3D 0;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 mode |=3D HM1246_TEST_PATTERN_MODE_MODE(pattern);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return hm1246_cci_write_test_pattern(hm1246, mode, r,=
 g, b);=0A=
> +}=0A=
> +=0A=
> +static int hm1246_cci_write_cmu(struct hm1246 *hm1246, u32 reg, u64 val)=
=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct cci_reg_sequence reg_seq[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { reg, val },=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_CMU_UPDATE_REG, 0 },=
=0A=
> +=A0=A0=A0=A0=A0=A0 };=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return cci_multi_reg_write(hm1246->regmap, reg_seq, A=
RRAY_SIZE(reg_seq),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 NULL);=0A=
> +}=0A=
=0A=
Do we really need this function ??=A0=0A=
=0A=
I guess In hm1246_set_ctrl after switch case you can write like:=A0=0A=
cci_write(hm1246->regmap, HM1246_CMU_UPDATE_REG, 0, &ret);=0A=
=0A=
> +static int hm1246_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D container_of(ctrl->handler,=
 struct hm1246,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrls);=0A=
=0A=
Use container_of_const.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 const struct v4l2_mbus_framefmt *format;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state;=0A=
> +=A0=A0=A0=A0=A0=A0 u32 val;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 state =3D v4l2_subdev_get_locked_active_state(&hm1246=
->sd);=0A=
> +=A0=A0=A0=A0=A0=A0 format =3D v4l2_subdev_state_get_format(state, 0);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 s64 exposure_max;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_max =3D=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 forma=
t->height + ctrl->val - HM1246_COARSE_INTG_MARGIN;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_modify_ra=
nge(hm1246->exposure_ctrl,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->exp=
osure_ctrl->minimum,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_ma=
x,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->exp=
osure_ctrl->step,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exposure_ma=
x);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_e=
rr(hm1246->dev, "exposure ctrl range update failed\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 retur=
n ret;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_active(hm1246->dev))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 switch (ctrl->id) {=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_EXPOSURE:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D hm1246_cci_write_cmu(=
hm1246, HM1246_COARSE_INTG_REG,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl->val);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_ANALOGUE_GAIN:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D hm1246_cci_write_cmu(=
hm1246,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_ANALOG_GLOBAL_GA=
IN_REG,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ctrl->val);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_VBLANK:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val =3D hm1246->cur_mode->hei=
ght + ctrl->val;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D hm1246_cci_write_cmu(=
hm1246,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_FRAME_LENGTH_LIN=
ES_REG, val);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_HFLIP:=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_VFLIP:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val =3D 0;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (hm1246->hflip_ctrl->val)=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val |=
=3D HM1246_IMAGE_ORIENTATION_HFLIP;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (hm1246->vflip_ctrl->val)=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val |=
=3D HM1246_IMAGE_ORIENTATION_VFLIP;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D hm1246_cci_write_cmu(=
hm1246, HM1246_IMAGE_ORIENTATION_REG,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 val);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 case V4L2_CID_TEST_PATTERN:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D hm1246_test_pattern(h=
m1246, ctrl->val);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 default:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -EINVAL;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(hm1246->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static const struct v4l2_ctrl_ops hm1246_ctrl_ops =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 .s_ctrl =3D hm1246_set_ctrl,=0A=
> +};=0A=
> +=0A=
> +static int hm1246_identify_module(struct hm1246 *hm1246)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 u64 model_id;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (hm1246->identified)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_read(hm1246->regmap, HM1246_MODEL_ID_REG,=
 &model_id, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (model_id !=3D HM1246_MODEL_ID) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "model i=
d mismatch: 0x%llx!=3D0x%x\n",=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 model=
_id, HM1246_MODEL_ID);=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENXIO;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->identified =3D true;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_setup_moderegs(struct hm1246 *hm1246,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 const struct hm1246_reg_list *reg_list =3D &mode->reg=
_list;=0A=
> +=A0=A0=A0=A0=A0=A0 const struct cci_reg_sequence modeaw[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_X_ADDR_START_REG, mo=
de->left },=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_Y_ADDR_START_REG, mo=
de->top },=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_X_ADDR_END_REG, mode=
->width - 1 },=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_Y_ADDR_END_REG, mode=
->height - 1 },=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_DWIN_XOFFSET_REG, mo=
de->left },=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_DWIN_YOFFSET_REG, mo=
de->top },=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_DWIN_XSIZE_REG, mode=
->width },=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_DWIN_YSIZE_REG, mode=
->height },=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { HM1246_LINE_LENGTH_PCK_REG,=
 mode->hts },=0A=
> +=A0=A0=A0=A0=A0=A0 };=0A=
> +=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 cci_multi_reg_write(hm1246->regmap, modeaw, ARRAY_SIZ=
E(modeaw), &ret);=0A=
> +=A0=A0=A0=A0=A0=A0 cci_multi_reg_write(hm1246->regmap, reg_list->regs,=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 reg_list->num_of_regs, &ret);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_setup_bus(struct hm1246 *hm1246)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 u64 polarity_ctrl =3D 0, pclk_ctrl =3D 0;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (hm1246->mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 polarity_ctrl |=3D HM1246_POL=
ARITY_CTRL_HSYNC;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (hm1246->mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 polarity_ctrl |=3D HM1246_POL=
ARITY_CTRL_VSYNC;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap, HM1246_POLARITY_CTRL_REG, p=
olarity_ctrl,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &ret);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* If the clock output polarity flag PCLK_CTRL[3] is =
set (high), the=0A=
> +=A0=A0=A0=A0=A0=A0=A0 * data lines change state on the falling edge of P=
CLK and should=0A=
> +=A0=A0=A0=A0=A0=A0=A0 * therefore be sampled on the rising edge.=0A=
> +=A0=A0=A0=A0=A0=A0=A0 * This is different than described in the data she=
et.=0A=
> +=A0=A0=A0=A0=A0=A0=A0 */=0A=
=0A=
/*=0A=
=A0* This is=0A=
=A0* the correct format.=0A=
=A0*/=0A=
=0A=
Correct this for all multiline comments.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 if (hm1246->mbus_flags & V4L2_MBUS_PCLK_SAMPLE_RISING=
)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pclk_ctrl |=3D HM1246_PCLK_CT=
RL_POL;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 cci_write(hm1246->regmap, HM1246_PCLK_CTRL_REG, pclk_=
ctrl, &ret);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_enable_streams(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state, u32 pad,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 u64 streams_mask)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode =3D hm1246->cur_mode;=
=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D pm_runtime_resume_and_get(hm1246->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_identify_module(hm1246);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
=0A=
Why do we need to check this every time when enabling the stream?=A0=0A=
Can we check it only once in the probe function? =A0=0A=
=0A=
Also, drop "identified" from the hm1246 struct.=A0=0A=
After the change above, it will no longer be needed.=A0=0A=
=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_setup_pll(hm1246, mode);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "failed =
to setup PLL\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_setup_moderegs(hm1246, mode);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_setup_bus(hm1246);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D __v4l2_ctrl_handler_setup(&hm1246->ctrls);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err(hm1246->dev, "failed =
to setup v4l2 controls\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_write(hm1246->regmap, HM1246_MODE_SELECT_=
REG,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM124=
6_MODE_SELECT_STREAM, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_rpm_put;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 /* Since mirroring may change the actual pixel format=
, it must not be=0A=
> +=A0=A0=A0=A0=A0=A0=A0 * changed during streaming.=0A=
> +=A0=A0=A0=A0=A0=A0=A0 */=0A=
> +=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_grab(hm1246->vflip_ctrl, true);=0A=
> +=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_grab(hm1246->hflip_ctrl, true);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +err_rpm_put:=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(hm1246->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_disable_streams(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_subdev_state *state, u32 pad,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 u64 streams_mask)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_write(hm1246->regmap, HM1246_MODE_SELECT_=
REG,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM124=
6_MODE_SELECT_STANDBY, NULL);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_grab(hm1246->vflip_ctrl, false);=0A=
> +=A0=A0=A0=A0=A0=A0 __v4l2_ctrl_grab(hm1246->hflip_ctrl, false);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(hm1246->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static const struct v4l2_subdev_video_ops hm1246_video_ops =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 .s_stream =3D v4l2_subdev_s_stream_helper,=0A=
> +=0A=
=0A=
Droup extra line.=0A=
=A0=0A=
> +};=0A=
> +=0A=
> +static const struct v4l2_subdev_pad_ops hm1246_subdev_pad_ops =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 .enum_mbus_code =3D hm1246_enum_mbus_code,=0A=
> +=A0=A0=A0=A0=A0=A0 .enum_frame_size =3D hm1246_enum_frame_size,=0A=
> +=A0=A0=A0=A0=A0=A0 .get_fmt =3D v4l2_subdev_get_fmt,=0A=
> +=A0=A0=A0=A0=A0=A0 .set_fmt =3D hm1246_set_format,=0A=
> +=A0=A0=A0=A0=A0=A0 .get_selection =3D hm1246_get_selection,=0A=
> +=A0=A0=A0=A0=A0=A0 .enable_streams =3D hm1246_enable_streams,=0A=
> +=A0=A0=A0=A0=A0=A0 .disable_streams =3D hm1246_disable_streams,=0A=
> +};=0A=
> +=0A=
> +static int __maybe_unused hm1246_g_register(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct v4l2_dbg_regi=
ster *reg)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 u64 val;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_in_use(sd->dev))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_read(hm1246->regmap, CCI_REG8(reg->reg), =
&val, NULL);=0A=
> +=A0=A0=A0=A0=A0=A0 reg->val =3D val;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(sd->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static int __maybe_unused hm1246_s_register(struct v4l2_subdev *sd,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const struct v4l2_db=
g_register *reg)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (!pm_runtime_get_if_in_use(sd->dev))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D cci_write(hm1246->regmap, CCI_REG8(reg->reg),=
 (u64)reg->val,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 NULL)=
;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_put(sd->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static const struct v4l2_subdev_core_ops hm1246_core_ops =3D {=0A=
> +#ifdef CONFIG_VIDEO_ADV_DEBUG=0A=
> +=A0=A0=A0=A0=A0=A0 .g_register =3D hm1246_g_register,=0A=
> +=A0=A0=A0=A0=A0=A0 .s_register =3D hm1246_s_register,=0A=
> +#endif=0A=
> +=A0=A0=A0=A0=A0=A0 .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event=
,=0A=
> +=A0=A0=A0=A0=A0=A0 .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,=
=0A=
=0A=
Droup this.=0A=
=0A=
see: https://lore.kernel.org/linux-media/20241029162106.3005800-1-tomm.merc=
iai@gmail.com=0A=
=0A=
> +};=0A=
> +=0A=
> +static const struct v4l2_subdev_ops hm1246_subdev_ops =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 .core =3D &hm1246_core_ops,=0A=
> +=A0=A0=A0=A0=A0=A0 .video =3D &hm1246_video_ops,=0A=
> +=A0=A0=A0=A0=A0=A0 .pad =3D &hm1246_subdev_pad_ops,=0A=
> +};=0A=
> +=0A=
> +static const struct v4l2_subdev_internal_ops hm1246_internal_ops =3D {=
=0A=
> +=A0=A0=A0=A0=A0=A0 .init_state =3D hm1246_init_state,=0A=
> +};=0A=
> +=0A=
> +static int hm1246_get_regulators(struct device *dev, struct hm1246 *hm12=
46)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 unsigned int i;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 for (i =3D 0; i < ARRAY_SIZE(hm1246_supply_names); i+=
+)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->supplies[i].supply =
=3D hm1246_supply_names[i];=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return devm_regulator_bulk_get(dev, ARRAY_SIZE(hm1246=
_supply_names),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->supplies);=0A=
> +}=0A=
> +=0A=
> +static int hm1246_parse_fwnode(struct hm1246 *hm1246)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct fwnode_handle *endpoint;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_fwnode_endpoint bus_cfg =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .bus_type =3D V4L2_MBUS_PARAL=
LEL,=0A=
> +=A0=A0=A0=A0=A0=A0 };=0A=
> +=A0=A0=A0=A0=A0=A0 struct device *dev =3D hm1246->dev;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 endpoint =3D fwnode_graph_get_endpoint_by_id(dev_fwno=
de(dev), 0, 0,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 FWNODE_GRAPH_ENDPOINT_NEXT);=0A=
> +=A0=A0=A0=A0=A0=A0 if (!endpoint)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, -EI=
NVAL, "missing endpoint node\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_fwnode_endpoint_parse(endpoint, &bus_cfg=
);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(dev, ret, "pars=
ing endpoint node failed\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto done;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->mbus_flags =3D bus_cfg.bus.parallel.flags;=0A=
> +=0A=
> +done:=0A=
> +=A0=A0=A0=A0=A0=A0 fwnode_handle_put(endpoint);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_init_controls(struct hm1246 *hm1246)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct i2c_client *client =3D v4l2_get_subdevdata(&hm=
1246->sd);=0A=
=0A=
Unused, droup this.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 const struct hm1246_mode *mode =3D &hm1246_modes[0];=
=0A=
> +=A0=A0=A0=A0=A0=A0 const struct v4l2_ctrl_ops *ops =3D &hm1246_ctrl_ops;=
=0A=
=0A=
Unused, droup this.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_fwnode_device_properties props;=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_ctrl_handler *ctrl_hdlr;=0A=
> +=A0=A0=A0=A0=A0=A0 s64 pixel_rate, exposure_max, vblank_min, hblank;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ctrl_hdlr =3D &hm1246->ctrls;=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 9);=0A=
=0A=
v4l2_ctrl_new_fwnode_properties() adds 2 more, so this should be 11. =A0=0A=
=0A=
No need to check the return value explicitly here.=A0=0A=
=A0=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->hflip_ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr, &=
hm1246_ctrl_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_HF=
LIP, 0, 1, 1, 0);=0A=
> +=A0=A0=A0=A0=A0=A0 if (hm1246->hflip_ctrl)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->hflip_ctrl->flags |=
=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->vflip_ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr, &=
hm1246_ctrl_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_VF=
LIP, 0, 1, 1, 0);=0A=
> +=A0=A0=A0=A0=A0=A0 if (hm1246->vflip_ctrl)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->vflip_ctrl->flags |=
=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_cluster(2, &hm1246->hflip_ctrl);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->link_freq_ctrl =3D=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_int_menu(ctrl_h=
dlr,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &hm1246_ctrl_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_LINK_FREQ,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(hm1246_link_freqs) - 1,=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246_link_freqs);=0A=
> +=A0=A0=A0=A0=A0=A0 if (hm1246->link_freq_ctrl)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->link_freq_ctrl->flags=
 |=3D V4L2_CTRL_FLAG_READ_ONLY;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pixel_rate =3D div_u64(hm1246_link_freqs[mode->link_f=
req_index],=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 mode->clocks_per_pixel);=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->pixel_rate_ctrl =3D v4l2_ctrl_new_std(ctrl_hd=
lr, &hm1246_ctrl_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 V4L2_CID_PIXEL_RATE, 0,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 pixel_rate, 1, pixel_rate);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 vblank_min =3D mode->vts_min - mode->height;=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->vblank_ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr, =
&hm1246_ctrl_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID=
_VBLANK, vblank_min,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM1246_V=
TS_MAX - mode->height,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, vblan=
k_min);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hblank =3D mode->hts - mode->width;=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->hblank_ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr, =
&hm1246_ctrl_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID=
_HBLANK, hblank, hblank,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1, hblan=
k);=0A=
> +=A0=A0=A0=A0=A0=A0 if (hm1246->hblank_ctrl)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->hblank_ctrl->flags |=
=3D V4L2_CTRL_FLAG_READ_ONLY;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std(ctrl_hdlr, &hm1246_ctrl_ops, V4L2_C=
ID_ANALOGUE_GAIN,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 HM1246_ANALOG_GLOBAL_GAIN_MIN,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 HM1246_ANALOG_GLOBAL_GAIN_MAX,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 HM1246_ANALOG_GLOBAL_GAIN_STEP,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 HM1246_ANALOG_GLOBAL_GAIN_MIN);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 exposure_max =3D mode->vts_min - HM1246_COARSE_INTG_M=
ARGIN;=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->exposure_ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr=
, &hm1246_ctrl_ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4=
L2_CID_EXPOSURE,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM=
1246_COARSE_INTG_MIN,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ex=
posure_max,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 HM=
1246_COARSE_INTG_STEP,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ex=
posure_max);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &hm1246_ctrl_=
ops,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 V4L2_CID_TEST_PATTERN,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ARRAY_SIZE(hm1246_test_pattern_menu) - 1,=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0, 0, hm1246_test_pattern_menu);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_fwnode_device_parse(&client->dev, &props=
);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_v4l2_ctrl_handler_fr=
ee;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, op=
s, &props);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_v4l2_ctrl_handler_fr=
ee;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 if (ctrl_hdlr->error) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ctrl_hdlr->error;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_v4l2_ctrl_handler_fr=
ee;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->sd.ctrl_handler =3D ctrl_hdlr;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +err_v4l2_ctrl_handler_free:=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(ctrl_hdlr);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static int hm1246_probe(struct i2c_client *client)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct device *dev =3D &client->dev;=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246;=0A=
> +=A0=A0=A0=A0=A0=A0 int ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246 =3D devm_kzalloc(dev, sizeof(*hm1246), GFP_KER=
NEL);=0A=
> +=A0=A0=A0=A0=A0=A0 if (!hm1246)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return -ENOMEM;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->dev =3D dev;=0A=
=0A=
No need for a temporary variable.=0A=
=0A=
hm1246->dev =3D &client->dev;=0A=
=A0=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_parse_fwnode(hm1246);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->regmap =3D devm_cci_regmap_init_i2c(client, 1=
6);=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(hm1246->regmap))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, PTR=
_ERR(hm1246->regmap),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to init CCI\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->xclk =3D devm_clk_get(dev, NULL);=0A=
=0A=
Use devm_v4l2_sensor_clk_get.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(hm1246->xclk))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, PTR=
_ERR(hm1246->xclk),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get xclk\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->xclk_freq =3D clk_get_rate(hm1246->xclk);=0A=
> +=A0=A0=A0=A0=A0=A0 if (hm1246->xclk_freq < HM1246_XCLK_MIN ||=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->xclk_freq > HM1246_XCLK_MAX)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, -EI=
NVAL,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "xclk frequency out of range: %luHz\n",=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246->xclk_freq);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_get_regulators(dev, hm1246);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, ret=
, "failed to get regulators\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->reset_gpio =3D=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 devm_gpiod_get_optional(dev, =
"reset", GPIOD_OUT_HIGH);=0A=
> +=A0=A0=A0=A0=A0=A0 if (IS_ERR(hm1246->reset_gpio))=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, PTR=
_ERR(hm1246->reset_gpio),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "failed to get reset GPIO\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_i2c_subdev_init(&hm1246->sd, client, &hm1246_sub=
dev_ops);=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->sd.internal_ops =3D &hm1246_internal_ops;=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->cur_mode =3D &hm1246_modes[0];=0A=
=0A=
I don't think we need cur_mode, so drop this. =A0=0A=
Instead, use v4l2_find_nearest_size where appropriate. =A0=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D hm1246_init_controls(hm1246);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return dev_err_probe(dev, ret=
, "failed to init controls\n");=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 V4L2_SUBDEV_FL_HAS_EVENTS;=0A=
=0A=
see: https://lore.kernel.org/linux-media/20241029162106.3005800-1-tomm.merc=
iai@gmail.com=0A=
=A0=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->sd.dev =3D &client->dev;=0A=
=0A=
Unused, droup this line.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR=
;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D media_entity_pads_init(&hm1246->sd.entity, 1,=
 &hm1246->pad);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(dev, ret, "fail=
ed to init media pads\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_v4l2_ctrl_handler_fr=
ee;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 hm1246->sd.state_lock =3D hm1246->ctrls.lock;=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_subdev_init_finalize(&hm1246->sd);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(dev, ret, "fail=
ed to init v4l2 subdev\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_media_entity_cleanup=
;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 ret =3D v4l2_async_register_subdev_sensor(&hm1246->sd=
);=0A=
> +=A0=A0=A0=A0=A0=A0 if (ret) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_err_probe(dev, ret, "fail=
ed to register v4l2 subdev\n");=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto err_subdev_cleanup;=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_enable(hm1246->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_set_autosuspend_delay(hm1246->dev, 1000);=
=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_use_autosuspend(hm1246->dev);=0A=
=0A=
Runtime PM should be fully initialized before calling =A0=0A=
v4l2_async_register_subdev_sensor(), so you need to move the lines above =
=A0=0A=
the subdevice registration. =A0=0A=
=0A=
Also, right now the device status is suspended, =A0=0A=
so use pm_runtime_set_active().=0A=
=A0=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_idle(hm1246->dev);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return 0;=0A=
> +=0A=
> +err_subdev_cleanup:=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_subdev_cleanup(&hm1246->sd);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_disable(hm1246->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_set_suspended(hm1246->dev);=0A=
> +=0A=
> +err_media_entity_cleanup:=0A=
> +=A0=A0=A0=A0=A0=A0 media_entity_cleanup(&hm1246->sd.entity);=0A=
> +=0A=
> +err_v4l2_ctrl_handler_free:=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(&hm1246->ctrls);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 return ret;=0A=
> +}=0A=
> +=0A=
> +static void hm1246_remove(struct i2c_client *client)=0A=
> +{=0A=
> +=A0=A0=A0=A0=A0=A0 struct v4l2_subdev *sd =3D i2c_get_clientdata(client)=
;=0A=
> +=A0=A0=A0=A0=A0=A0 struct hm1246 *hm1246 =3D to_hm1246(sd);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_async_unregister_subdev(&hm1246->sd);=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_subdev_cleanup(sd);=0A=
> +=A0=A0=A0=A0=A0=A0 media_entity_cleanup(&hm1246->sd.entity);=0A=
> +=A0=A0=A0=A0=A0=A0 v4l2_ctrl_handler_free(&hm1246->ctrls);=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0 pm_runtime_disable(&client->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 if (!pm_runtime_status_suspended(&client->dev)) {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 hm1246_power_off(hm1246->dev)=
;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pm_runtime_set_suspended(&cli=
ent->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 }=0A=
> +}=0A=
> +=0A=
> +static const struct of_device_id hm1246_of_match[] =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 { .compatible =3D "himax,hm1246" }pm_runtime_set_acti=
ve,=0A=
> +=A0=A0=A0=A0=A0=A0 {}=0A=
> +};=0A=
> +MODULE_DEVICE_TABLE(of, hm1246_of_match);=0A=
> +=0A=
> +static DEFINE_RUNTIME_DEV_PM_OPS(hm1246_pm_ops, hm1246_power_off,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 hm1246_power_on, NULL);=0A=
> +=0A=
> +static struct i2c_driver hm1246_i2c_driver =3D {=0A=
> +=A0=A0=A0=A0=A0=A0 .driver =3D {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .of_match_table =3D hm1246_of=
_match,=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .pm =3D pm_ptr(&hm1246_pm_ops=
),=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 .name =3D "hm1246",=0A=
> +=A0=A0=A0=A0=A0=A0 },=0A=
> +=A0=A0=A0=A0=A0=A0 .probe =3D hm1246_probe,=0A=
> +=A0=A0=A0=A0=A0=A0 .remove =3D hm1246_remove,=0A=
> +};=0A=
> +module_i2c_driver(hm1246_i2c_driver);=0A=
> +=0A=
> +MODULE_DESCRIPTION("Himax HM1246 camera driver");=0A=
> +MODULE_AUTHOR("Matthias Fend <matthias.fend@emfend.at>");=0A=
> +MODULE_LICENSE("GPL");=0A=
>=A0=0A=
> --=0A=
> 2.34.1=0A=
=0A=
Best Regards,=0A=
Tarang=

