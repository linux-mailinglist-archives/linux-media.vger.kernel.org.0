Return-Path: <linux-media+bounces-31418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEC0AA4799
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F79F3B12F0
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E45723506E;
	Wed, 30 Apr 2025 09:47:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020115.outbound.protection.outlook.com [52.101.227.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33E01C5489;
	Wed, 30 Apr 2025 09:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006477; cv=fail; b=sVmUfuD9YgbNOlMAauRfo17snEvt+LtwoknmdLAK4SbaPgkgfmrTAZLmc7G0+dmrQdgEsLpqPIZ9EKRKFX8GQgjCpEjsBxBy1my2VImqcON9oXwt/lA6t3fDNzmfj/QQy+ekIOXY1rN0ximFk8E8fEiUn3znowNyEmC9Gk6Noqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006477; c=relaxed/simple;
	bh=hmPCV4WpyrZftedpjsFQQb+z2MXP6o+WvddEfdjdTAM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VQFgy0qjAmLDoUtv2LUsFQLOaYRI4FBL5rqM6F7ktqylgFvKvJs4QISuV6b4j4twL23/hT2me5kYWv3x2zn+KUvQJFQUZ3TS+cdpwvgNBVHgTJ/jSCFepBduN+FWfrUd83W1qmKCOb+WAvYSl1NBl3pLB9EoEEmig3IyrOQFuQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7nF6UM1UUs/sFdNSS3myGWNraX6vJ2NPAicx+elPy72jsr9XnLLb1pxwaXetZbC8V+iQjIKttc8vQblRLfkmm4q/aB6kxyXfYFRPF37icweHj3t7vhBN4XQeZf5R3s4yIyic1z/JCawcd083UcX32bCIDk7fsF9wiDOTz/qp33ZZUuE2CKueh4wrWxfCrRbVFWYYWgGZ/yvGIbroWYeDwWyCwCZaZ49yddp5LzEXJ8h3I4ndynd7OBfUvI05UzwouFGRbHCaHH6IYTsUWfs7TkfRRrV1tDEV3ZbrpfKzY8WH+yEOlC7ovOrzEl5s74Pw+YJe1CsiEixShHCE78cFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmPCV4WpyrZftedpjsFQQb+z2MXP6o+WvddEfdjdTAM=;
 b=aZAjllIIDgh6r/N09ZFJfC641gDeFX3Q5MqpXNDqpmLjiLAUd27DGqQ2Kg39IMBDotkJioFXhc9g6gnptAdlwBXXGPRA1oEsphIrC8EkiqpL42p2QqB8Eogj1Q0/gyytZfSXFodYAquDblFTk+Chdp8s5RFL+lut39MJfe3IrLsjwn8YOrYaYEKH0YEhad/7/Jw2+F2sT5cTayPFcyb5s7F9oHH42FYLGcqSjGFNXMAGrORW0HUWbyRnykPd+5DunQCrohuxvQJrp7aWxOJ8qjnUayUDftDS/2JY2VSUfay+R7cK2rDskms/WBEy2315e7aBKLydsjg3wJm/N/h/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB2089.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 09:47:45 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%2]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 09:47:45 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Shravan Chippa
	<Shravan.Chippa@microchip.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] media: i2c: imx334: uninitialized variable in
 imx334_update_exp_gain()
Thread-Topic: [PATCH 1/3] media: i2c: imx334: uninitialized variable in
 imx334_update_exp_gain()
Thread-Index: AQHbuam9HPWFr4mYWUe6Kuzyvu63PrO78wVF
Date: Wed, 30 Apr 2025 09:47:44 +0000
Message-ID:
 <PN3P287MB18296802E1A6C2CD55997BC68B832@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <cover.1746001540.git.dan.carpenter@linaro.org>
 <ee811e7c6eabc390241e0227f7a26d1eaa7818a1.1746001540.git.dan.carpenter@linaro.org>
In-Reply-To:
 <ee811e7c6eabc390241e0227f7a26d1eaa7818a1.1746001540.git.dan.carpenter@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB2089:EE_
x-ms-office365-filtering-correlation-id: 62f5087b-a036-4b5b-6d1b-08dd87cc0ef0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?1D9YUhf/kLYelcQsGLhq7aSQh3OBQInACJR1rWs1J+7f74XWWMxdqUzE?=
 =?Windows-1252?Q?AUaZTI4b7Co1Fjx1yCacsA8BqvUlMi2opuCy1moQjW5dzha9hw15VUwg?=
 =?Windows-1252?Q?WeZiz4eas9UEvbj1S1n0Ajpmray1kglncnLAAU71P3+U+r7RPypFIEwp?=
 =?Windows-1252?Q?Qfpzudo4cwk0QcFRxa8l5lORIjZwbFSo9sYNJUl1VHEEZCP9Xv5V3yVm?=
 =?Windows-1252?Q?Th7AdjIsSAha5K3ZcYFZ3AlxdNJSaUYsyGvrnrhq1w69NB2mysjrwnKW?=
 =?Windows-1252?Q?ikjkrCj1OaUr+GOlyqYIkdLp033AgsE0mcZQihNzY91mWlls2enGMet8?=
 =?Windows-1252?Q?LsGHT9zXo71w5G/FTHz0vZiWsuHYYGYqaTxVQpPM3i8wHxeq4CiCWWiC?=
 =?Windows-1252?Q?fuGm9biirGtrthCKwBKRu38EEw8fkJlE+2+fGXp9mFnEhk8zFApvkSk+?=
 =?Windows-1252?Q?DUVlPqPpoyT0kHxYfvxX3MPucenu5udjPzMbC/xoeGz3NgTIH3vlZwhe?=
 =?Windows-1252?Q?uV4ZsZYzVCFfW5YwetJ+JKSE0c7RKhHvPmFDAu25QY/3BKYyOr2CkTcp?=
 =?Windows-1252?Q?P1rZU2GDHNCAzioSGPIlGO0fJQ/Tf761tmnzP/5N3y73v6+gCLHztXbX?=
 =?Windows-1252?Q?aZ7XLEzmgyuBEuGTUQ6jQu8ynENgmlwVxRpif2wK07sTWTRDbqYKxwO6?=
 =?Windows-1252?Q?DZ3e+tv3E8fKnSmnKMboooVg5wda9n8H+s3f0yua8q5pD4P//vQT1J/g?=
 =?Windows-1252?Q?OHESrCGru6UfGDO072+4thjpaFw8Swu8VJB1xfla7Kredm72F38OGMKz?=
 =?Windows-1252?Q?ESt9wvyPXOVD/2FaVRkKVKD25ldKbWw1Z6p/blrwResgjwOSRyFJkMKn?=
 =?Windows-1252?Q?jbOQLLhmgbxXRuvUiJojQngxEwOMH5+/XnTjSq3s7Y0Du6bIR2Jvrpj4?=
 =?Windows-1252?Q?RS9gN9MVRSylTiAt8lBVAFkA9ZlJAai9ZloQHV50THVK0P6VqdqNH69o?=
 =?Windows-1252?Q?xtp87Z130znSqTeGjeidzGrHeI6jM7QtZj+NsGj4UMQKqS3X/llOK+b9?=
 =?Windows-1252?Q?HR1clTfO5zE2+NXOMN9FCWPMFDD3kiekLOXSfgc7gz7wikV90slgme9J?=
 =?Windows-1252?Q?+90t4RqoIPpvMCdYwYEDySgRYcTLz5skVwqhSPbBhnKTVDej26UjTbN/?=
 =?Windows-1252?Q?ol4x+6PPYHHg2fINamHyUwinLfSFsZHOxc9qnpnET7yexL5Y+H9/MpgK?=
 =?Windows-1252?Q?UuegrTI4XmCWt++0m/44OqhuTjKu76cqINIPFkJNAGZ5JgttB8rYMNw5?=
 =?Windows-1252?Q?IsUZ6MJHwyUK62P0jQZiNDY92vu1C+61D5vHP2CZ6wJBXgAtM1HV/qrS?=
 =?Windows-1252?Q?rouC05iwnmItuvYm5SngyBi0XDhRCIs0iEOlIPXvc5u45MihpOfW6ETg?=
 =?Windows-1252?Q?6FKOUfRbXtskIfZiPcOyi2sxPYKiAbdPPCcQV5GTwmgl9IyEH68o/h5b?=
 =?Windows-1252?Q?yYSCgJqHYgIQZQ+0/oSXFM2coAXZ4ZMsMghI2DuUeYWtECCfM4tgCPzu?=
 =?Windows-1252?Q?FeMQZtUe0jgTORC6X733nUK1dWdF0EV/shCpwA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?sOL5Io8V9y5WGV7EfxSJcZ0/0d4dDsTLkX7RbydMq66loluim1Wj63wS?=
 =?Windows-1252?Q?gMN/pJoAxRYQg8S3pqLyBKyXfE/iBsLNe4X3NzPuP72+c8xtLhoumYyj?=
 =?Windows-1252?Q?GraAlE5FYhV2g53s6HNhuoBr2Ku7afvl5Xw/VOJk0rbi0uznivgo5Ila?=
 =?Windows-1252?Q?cn8ZPMUZ8tNKN+YH602cpxRdwIiuRB+FSBdqiTfCCDgrAD5XORflUSpE?=
 =?Windows-1252?Q?VY977HmiRWuC6o75SxALmiOZTLDy+5bcX3oyVP9Q0E7cHPLHrH6fKzci?=
 =?Windows-1252?Q?+AL+72zWVKWuQBfRP4DFprYWqS9inszh2HSSOti5msh/MzcVCEPa825r?=
 =?Windows-1252?Q?2RavJlDyePADi5DBvNZ4iqx74QC0MUrq1HwbxDSabtNvU4hZY2Gjb7UH?=
 =?Windows-1252?Q?92RFhUnKksCuAVnGgn8xM/7Q8i3qWjHaaweToeeehYxG6GBRDBcPuri6?=
 =?Windows-1252?Q?JXLsStbSVGCLMJYcaUvyJUCugc5x+XLDfh+WnNq0m5XofmfqWxrFi4G2?=
 =?Windows-1252?Q?zYnt9DNPvpV5znx2z7lhuxGPqduLlJZwfi0yer/1ALKoxcgV/0gHJu2k?=
 =?Windows-1252?Q?7MnJBfCPCjOATdkWEnVwsswRrpiumJplBAGh0mQ7iVXUggMUr6nhH0fP?=
 =?Windows-1252?Q?ptlHcy3OnicjbnYMkTBXyET5A+owEgokTT6hgdWT8Pxz5IOmr7sJzaNb?=
 =?Windows-1252?Q?3WbBMUH2lzM0zDSbR0GnNLs9URHIEL/iTICcHLnTbj6wG4ccpEy23+4g?=
 =?Windows-1252?Q?TLW9VE8zGKG0iEOXLXhtmfvz/ZRr47lzXU/u/C4QLnQQT6633QQlYUJb?=
 =?Windows-1252?Q?GYsXVVj/pV1PHzzEkdlp1p/qv3EQjLhLiO4TR1BKvHggFo+5wkVDJb70?=
 =?Windows-1252?Q?IXeiVjzbpVtp0Fsq5xTwpC7Le89NSnqq5ujK1t5YdRi2Ld/HlwH8oMUP?=
 =?Windows-1252?Q?feJwzr7hfKRpdMwZ3OFK8OHzSkJcP1bS6dcO4v4TcqNXltFiShnmncqv?=
 =?Windows-1252?Q?XlipblP2IhICPZIY0Q+Mz3cTRhKJIqjv8UXgtibPPIiJnUP2Cak+4NMH?=
 =?Windows-1252?Q?4G5VZefqi7L5Mgll74/v0r6IHBx4Zt9Fiv+M+EEYel2C87GT8yXDtip4?=
 =?Windows-1252?Q?ktHCaE4hI/gZS1ncjKUM3UjNGwPDvoq1w8g8VEDSZSkuiOvWEbRKgFw4?=
 =?Windows-1252?Q?EcZcGCbgCK3F30d4j9OajzK9elPv6O5ONhuCkjd9zuDas7RjPbkY2OZE?=
 =?Windows-1252?Q?baMTSoPB24wk8Wn0nUR2Yzn8YX2RSm88IjSwpLFoL66DxS/FxOasUu+X?=
 =?Windows-1252?Q?8rNTQKaGV/KjOQ6zTdkKPL6l3PEF9LG/TXYSpmiyWu1/+PA5kHIlQRtg?=
 =?Windows-1252?Q?Yn0bgH+B0rDU4f3WJcUVnvG99Pi/CFpUZ1Vu8gqJZd9MbCkOpQj+/nWF?=
 =?Windows-1252?Q?HC6jDxmJS9tlCVRSVEcK2/kVQfNoFsbKypG2u4Z6geX8KcI2OFWVo+T3?=
 =?Windows-1252?Q?jex3bmAoaAH6ffLzPsigbBJrv8p4alEakuN+TuFx533xgwXOP/EKYWys?=
 =?Windows-1252?Q?28mSUVetTKS55nVku3QA1fBpy3Wm7lGLkyJqy2oU+M31FWurirbMmgsr?=
 =?Windows-1252?Q?bLDUUjeocSfhEaorSVenfaOjBxtAaYlo2rs6vDJIgjUe3wXGpmkcFE7u?=
 =?Windows-1252?Q?Ae+AbH8Jm8r6IW8Q/Y0Oq/24Oyqm7PUSteScfSyILqCGBhBdF6gxKA?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f5087b-a036-4b5b-6d1b-08dd87cc0ef0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 09:47:44.9994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQ8btRaWVEtSWVH7FFCRIXUE6jV0pufKSxbYLEgVXzjBeT7mbnsSK+RV08sl91sFXFt6srBNmPbcleowH9b9IVL052ftcHpmOuqvBWWiq34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2089

Hi Dan,=0A=
=0A=
> The "ret" variable is not initialized on the success path. =A0Set it to=
=0A=
> zero.=0A=
>=0A=
> Fixes: 7b19b0fc8ac8 ("media: i2c: imx334: Convert to CCI register access =
helpers")=0A=
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>=0A=
> ---=0A=
> =A0drivers/media/i2c/imx334.c | 3 ++-=0A=
> =A01 file changed, 2 insertions(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c=0A=
> index fc875072f859..846b9928d4e8 100644=0A=
> --- a/drivers/media/i2c/imx334.c=0A=
> +++ b/drivers/media/i2c/imx334.c=0A=
> @@ -536,7 +536,8 @@ static int imx334_update_controls(struct imx334 *imx3=
34,=0A=
> =A0static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure,=
 u32 gain)=0A=
> =A0{=0A=
> =A0 =A0 =A0 =A0 u32 lpfr, shutter;=0A=
> - =A0 =A0 =A0 int ret, ret_hold;=0A=
> + =A0 =A0 =A0 int ret_hold;=0A=
> + =A0 =A0 =A0 int ret =3D 0;=0A=
=0A=
I think this initialization may not really be necessary.=0A=
=0A=
If all of those cci_write are skipped, then yes, using ret uninitialized =
=0A=
would be a problem.=0A=
=0A=
However, I don=92t see any case where they would be skipped in the =0A=
current implementation.=0A=
=0A=
So, is this initialization really needed?=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
> =A0 =A0 =A0 =A0 lpfr =3D imx334->vblank + imx334->cur_mode->height;=0A=
> =A0 =A0 =A0 =A0 shutter =3D lpfr - exposure;=0A=
> --=0A=
> 2.47.2=

