Return-Path: <linux-media+bounces-30926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C69AA9A97A
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 12:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61EAE188B992
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 10:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA92221263;
	Thu, 24 Apr 2025 10:07:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021137.outbound.protection.outlook.com [40.107.51.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4991EB5D4
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489264; cv=fail; b=EgYPqy7ZZTitjk95Fh0qLM0iK2VPgokF6fyE7FAQrnWpgtDi6H5ZQFR8MGfoRig2PAwzo4XC4w4OOKW+uNHSr72rH277b23UxmNg65Y1BduujfRhUREknXc3pd/Rdy7OgAqUcalk2TXyzjJZTkpGo59C4fFmeDgnaAn9HoyxOE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489264; c=relaxed/simple;
	bh=GKMFPwooywJDAjL5Nzt1QeRpNI/AxR7LvXgzS7K9QKg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z2GibSbh2Frb5ssFLouVBN19bA+Vc7QQLFWdMoXICy8fOTcrh5vI66mty6yTbS32FfkXzX6q7TYoMTz5XakG1DFTn8nfCz1WOhP+5HWnNwYqUlSZpB9THoRhaxV8LZaMrNAEXQcwvYQQ3RNG9+k89TL1aikh3yXVop7xwTu3bQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqQEGQof/tsekT6AdPqiJSQoPE9stbWhrYgjS58yRm+L//fVVmvGnPwLVfYcQjHckcueaCc1DddowCF4zebCyTgDWxPaY827AaIXbFA4txRbzOUubORwc0dzh/2P1BIKZQL5lgBfuH604q565MIUdMMszSLMiyM1gZ5sseIse/TThy+KOGmUBbCqmpKtg9kMiM3k3uTie1QnY/hc6vEdew5cQCjbfytFhboKxFoGtlefxd1GXiKY13uE343N0XFIpZ7OAAuztMAkZhNETko8/Fu2Cj2pOcipR/3GXRlOEeUcJvW3vspRauK8q0w3T5dAsJMXylTQ9vrpttqEIOFj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKMFPwooywJDAjL5Nzt1QeRpNI/AxR7LvXgzS7K9QKg=;
 b=YxlXwQoxj7rhMeObcvq2/14AXMClPPX/ZW1ZCOcYnVaqw8I9jU7Pa/QREftn2wVZ/8QZE989W6JVxUoYF6hZwgDO9ta9QP0I0ydw3Wg3rFW2vpE8AEpmj8sMIsCHDxcVshVqW4QP/5jONS/gjABUvf3EQTN4rLRVaoFO+CeQ7FEqzWEjf6h1Z2fzaIMdrUy0m2YkuxQ9dvCEjUo/AJ2WhoZZ1cuXr4T1QHPwBWXOSPGzO1GZWSrsMupGeObolc2p6VeBQ/4wi/zUkIqAsRWCC4Y5WS9Cyv6eiQRCmpnr4d0haG8yRWaX4kG1S7nQXByLqH3q0L8lujsJxUrhcqE/BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN0P287MB1828.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18b::12)
 by PNXP287MB0064.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 10:07:36 +0000
Received: from PN0P287MB1828.INDP287.PROD.OUTLOOK.COM
 ([fe80::da15:e048:6f0c:8e48]) by PN0P287MB1828.INDP287.PROD.OUTLOOK.COM
 ([fe80::da15:e048:6f0c:8e48%7]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 10:07:36 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Hans Verkuil <hans@jjverkuil.nl>, Linux Media Mailing List
	<linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: mt9p031: fix mbus code initialization
Thread-Topic: [PATCH] media: i2c: mt9p031: fix mbus code initialization
Thread-Index: AQHbtPseEovoJXXRYUuYxAOL0W/HBLOylBJ7
Date: Thu, 24 Apr 2025 10:07:36 +0000
Message-ID:
 <PN0P287MB1828F1BD4A21423BC957AE228B852@PN0P287MB1828.INDP287.PROD.OUTLOOK.COM>
References: <130d46d0-deb6-4235-886d-af67b378907d@jjverkuil.nl>
In-Reply-To: <130d46d0-deb6-4235-886d-af67b378907d@jjverkuil.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB1828:EE_|PNXP287MB0064:EE_
x-ms-office365-filtering-correlation-id: 092c0757-5528-4355-c48c-08dd8317d685
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?1PXh6+GE0rSPRJ9jgTcRXG/gclrtClLzkAZorjT5ZrlKDXAQgjklNtL4be?=
 =?iso-8859-1?Q?BkMXClNxz9MmEeNr3eNvkBuWyJM8G7YAT4NwFZP7OsCxg70KZOysn8E6Bc?=
 =?iso-8859-1?Q?CBuRY/ZTj991F6O7t3Vv9BCPRbGg6WibjS0A4A8BYURIYrzDh7JB+BLeFR?=
 =?iso-8859-1?Q?7XUC9cKwAQf5/klaEnEBeg7lhje7c49920Ch/2ykObmzw/14UUEtLBIEoX?=
 =?iso-8859-1?Q?u9rDyoRfriEaabVHT3DThbIyyOkGiruX75cCI2HuMAqYG4Uyvtqs7qJSXc?=
 =?iso-8859-1?Q?jSb+A4saIqKSjCrUxX1mq4tchMYANRYjrImyZShdJIdkAiE4xvbD4zoFxc?=
 =?iso-8859-1?Q?s4qU/ozlC3Odrx3fLXJHTgI9L2+fXdr4EGpJXMhcepv6Vv1fecuu1A+2Xm?=
 =?iso-8859-1?Q?y8flgQB6N+NJnGdMYVw3Lb+TUJKw3//EaW/EO5Jygnx5qwpecVfVC6bSM+?=
 =?iso-8859-1?Q?ml4h/8kCh3uWLufMyNRrCf+np+yPf+X0ZRw3oapJC4ZVwAYeDp5DnTgGJ0?=
 =?iso-8859-1?Q?+5cQeCRbyx3oIiWLW/HnDZ9lrwtzUzfADEVFbtzYb+v6aFwQr3DdopRnb7?=
 =?iso-8859-1?Q?HTc26KBHYi1VrI6qEEQ7gpDMAHpnr/Nkbnpo4AWaRnwg9m3cOXMFVNb1Xv?=
 =?iso-8859-1?Q?ebbsHMsliORlRPQbVfbm2s0s8zDHaUL8OtwguhUnZVRYOkb4/iLvl/td+o?=
 =?iso-8859-1?Q?gJR4yENthjogezdUEDoJi9FBE9z4/T1YiqsKiFAardyk17wRurRod92Gwe?=
 =?iso-8859-1?Q?MgLz2dGUIj7cbT7bpOaN+zA2SQZIhJhQTWlOGlsi5jPitUzRyXeE/a7lb6?=
 =?iso-8859-1?Q?OGDll8teo8t6TdfWyPGGQ1FZpSD8QZE1ewYchPlNg2m0ycwmHHZ6ZuH4dc?=
 =?iso-8859-1?Q?iV3fLLP3MehVqGQNoPzyJYgjRdh6FySlTgZPRIHf00EvlKd2NT7m8wnvT7?=
 =?iso-8859-1?Q?c4JWasUxnpfWgFwqAw/eBqCwXCF40mipu5U7AoZGL+FuGozojoGThL1Cmd?=
 =?iso-8859-1?Q?z0tyUjvspWJeuyQvztHgrDspYVuVYE5iZWUqVsqpOcuTUTkSdAvWGp7hZZ?=
 =?iso-8859-1?Q?f7kDd2JvimyLYibVMGzYO4uGquhrJ2fPYkb49Wkzjo0wprBAUC8tY0O3yF?=
 =?iso-8859-1?Q?21hFOuGsfsvGcfzChfkJT126aEQBmTWuU9h7CwxLXhgO1DcAPzrRz3OeZ/?=
 =?iso-8859-1?Q?vt6JlvvtC9+Hm4+NPiqU/vWYn2QUIGuekthrbuaHtlE1NYss74zA22L83v?=
 =?iso-8859-1?Q?Qr3Q2BgZF5rUkgOGT/1Wzlczt/OaEAz3AaridL/ZM9/+XdRLFC+GW2HjpI?=
 =?iso-8859-1?Q?63azqn6+rHMyBLJfUX9qUX2yzmh8T92xGrErL0hL/0J24T93YrVnFXMnpK?=
 =?iso-8859-1?Q?sPvF3XQ+KimX+UQzMHhVXCDNm7q1oC5GL5gJLjnpTVNlnkTFVNOidZjjDy?=
 =?iso-8859-1?Q?kW5UA3b1xp3u9TdJT3pheKPVmVjaJ3aFeUg+qYN5OmAFNMmTegMEi0pGak?=
 =?iso-8859-1?Q?B0wWfekgiXPQSPI3wJ9OM9HWx5HPdGqlJ3U1Sgo7yBoQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1828.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0OLLKwo4xSyU6iIaYZzXixkLFThwEaHUGc57IpnO5SAgMbXNyNjZcAVSbF?=
 =?iso-8859-1?Q?zKRESnqI8ebRgOoH0ap4OmQNbYx77s5H1iJWYflGkQ7AcT1ITMonHXa2d+?=
 =?iso-8859-1?Q?3qnc47k2JP0Mptvl7cy7ji+4h/NW+w/YeNaW3oyavFPKNQ7yfQhCZGFwc6?=
 =?iso-8859-1?Q?R2hMAPvpmrWHdti1z+jDGl85sYw+k6LK5h4cwhBNWfaUDK9tzoeoTW7jCK?=
 =?iso-8859-1?Q?emkt22hepOBAEhmaCmaV4C92/oEZCUmPApadCbj9NxinSe62NMch+a1FFQ?=
 =?iso-8859-1?Q?HyJu2GdQKw0WMUfnPiqSLxJE++xuAwsyo4C34okU+yyyE6zNc4yoiTYVNh?=
 =?iso-8859-1?Q?gUE2bLtsv1UYLhmm1xTK7UAtgODZPzVHPnjBYsYUlyNsOneesb1EAjVDmV?=
 =?iso-8859-1?Q?7i0nEn01aPMOOMZPP5/5m9yIEUUFmeI/xG45XPNxZqtiynvFiqOQc3WK3j?=
 =?iso-8859-1?Q?fPdJhXIyR/wiGYvWWuyircL1qSVxVtulf53Z1uPOFsGO+Qk7oFaviWeR/k?=
 =?iso-8859-1?Q?K4A9U/z6OWlm7nZVrbkP2/35LEyCg1Xd9i8aJAciMBBmOtvhszENfF7gxp?=
 =?iso-8859-1?Q?s/cVSLOupSzmL88oFxIGkaoUCyWEKxMlbvnwGtZHEl2YxcZb7a1IpUmGKj?=
 =?iso-8859-1?Q?xYqYprw0INvswHMTgMAAVr0X4rDUXg9dSz7d7qFBTl/OquaqLLe7Hyh5Y8?=
 =?iso-8859-1?Q?zp2MxJR107ePA2whcoRYgB1WobBfFb2xM64tM7sqNviIm8UHUpi6mDDuNy?=
 =?iso-8859-1?Q?HzRbfvu3gxem76cy3qxPKQJkFxKhgOf8QDoCSsOBNcpM3keReIhCluv4Xu?=
 =?iso-8859-1?Q?URaDLcB/pAl6DqAOGo2NZRGx0rm1byjby7WvckoujaAk+b/TQDlmQhWwtT?=
 =?iso-8859-1?Q?kUjYayhNN9azuju/XZqp2WcTHEJTjfF52aoPOsQ2J9c8IY8jWP2fKoqKWQ?=
 =?iso-8859-1?Q?Daf71kiRxvkMs9KbY3N4Bmgqcn+OzzsNwOZpl/PQTS4gNUgyo5hH0t/Gcq?=
 =?iso-8859-1?Q?mE0FYiquBLF50Avhfsn0Zi9jCtu1l+eCZeVUjP9uRA/2BHKvTfgFfd0QIU?=
 =?iso-8859-1?Q?No6w6Y4UxWJ9NpzYUAZuIfsjuSeaDnyTZmrwvLloIteAMRArqSCYsQZML/?=
 =?iso-8859-1?Q?ahw+TBwQ9yTAusAzraUasErOXeTbmEJU5zRJPvJu7GwxWQ1NqAwenMKsNr?=
 =?iso-8859-1?Q?zwiU0552Vax29OWAvL/bUP1BQx+uiK43yT8pBW7jZ8vWsm3afiHA6l6qT2?=
 =?iso-8859-1?Q?QA5nIK2AZdLrrN72WOXfB4f/C5QdEVTX4h+Wvpk6TWA+J7eeZu4qXC6okM?=
 =?iso-8859-1?Q?HnqRjtU4k639XNeWbEc+BHwZL915ECqtur0sWABXbtcRbzJ6Bo83StwGhP?=
 =?iso-8859-1?Q?kpXMLzoeYwdpsZ5LnGd13HaHO3is+Far8wsLLfd3tkTUEQNhcMmKlXXRrQ?=
 =?iso-8859-1?Q?LPFmxPl1Cyb+gzHxOuiRCm0gHRCVt0iOCFssucJhpF3kWOrcQ08hoZ3TQD?=
 =?iso-8859-1?Q?0y+kMIAE12wVsArpSUQ22pxO2ja97j6eK5WBrejuIzldQq7Ryy+DK4JwOb?=
 =?iso-8859-1?Q?bi5156VXVcSfQwhzGxFyDdIXh9tOcl5k0z+OSaOAdx8lfcI88/tvy8878U?=
 =?iso-8859-1?Q?tqkFM0HwCSzq1SFYRndr8SPIWalmV7sOTyjBQBw/DY5+2D43qOcvKfOQ?=
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
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1828.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 092c0757-5528-4355-c48c-08dd8317d685
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 10:07:36.2610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 64wdOue96rqfsVz2NiyfU6W9fGYM9LOdKulIFgesBLX4zuRRzMOzqrwVCVMkxfoCaoHQmCbrbv59RCmiYrenCb5vQs2B7tQamH5K5sWZ9z8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB0064

Hi Hans,=0A=
=0A=
> The mediabus code is device dependent, but the probe() function=0A=
> thought that device_get_match_data() would return the code directly,=0A=
> when in fact it returned a pointer to a struct mt9p031_model_info.=0A=
>=0A=
> As a result, the initial mbus code was garbage.=0A=
>=0A=
> Tested with a BeagleBoard xM and a Leopard Imaging LI-5M03 sensor board.=
=0A=
>=0A=
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>=0A=
> Tested-by: Hans Verkuil <hverkuil@xs4all.nl>=0A=
> Fixes: a80b1bbff88b ("media: mt9p031: Refactor format handling for differ=
ent sensor models")=0A=
> Cc: <stable@vger.kernel.org>=0A=
> ---=0A=
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c=0A=
> index 4ef5fb06131d..f444dd26ecaa 100644=0A=
> --- a/drivers/media/i2c/mt9p031.c=0A=
> +++ b/drivers/media/i2c/mt9p031.c=0A=
> @@ -1092,6 +1092,7 @@ static int mt9p031_parse_properties(struct mt9p031 =
*mt9p031, struct device *dev)=0A=
> =A0static int mt9p031_probe(struct i2c_client *client)=0A=
> =A0{=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct i2c_adapter *adapter =3D client->adapter;=0A=
> +=A0=A0=A0=A0=A0=A0 const struct mt9p031_model_info *info;=0A=
> =A0=A0=A0=A0=A0=A0=A0 struct mt9p031 *mt9p031;=0A=
> =A0=A0=A0=A0=A0=A0=A0 unsigned int i;=0A=
> =A0=A0=A0=A0=A0=A0=A0 int ret;=0A=
> @@ -1112,7 +1113,8 @@ static int mt9p031_probe(struct i2c_client *client)=
=0A=
>=0A=
> =A0=A0=A0=A0=A0=A0=A0 mt9p031->output_control =3D MT9P031_OUTPUT_CONTROL_=
DEF;=0A=
> =A0=A0=A0=A0=A0=A0=A0 mt9p031->mode2 =3D MT9P031_READ_MODE_2_ROW_BLC;=0A=
> -=A0=A0=A0=A0=A0=A0 mt9p031->code =3D (uintptr_t)device_get_match_data(&c=
lient->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 info =3D device_get_match_data(&client->dev);=0A=
> +=A0=A0=A0=A0=A0=A0 mt9p031->code =3D info->code;=0A=
=0A=
Correct, mt9p031->code expects an integer value, but after my patch it =0A=
was assigned a pointer instead due to device_get_match_data() returning =0A=
a struct pointer.=0A=
=0A=
Ack.=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
=0A=
> =A0=A0=A0=A0=A0=A0=A0 mt9p031->regulators[0].supply =3D "vdd";=0A=
> =A0=A0=A0=A0=A0=A0=A0 mt9p031->regulators[1].supply =3D "vdd_io";=0A=

