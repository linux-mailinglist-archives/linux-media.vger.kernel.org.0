Return-Path: <linux-media+bounces-32733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F58ABB455
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 07:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD2443B7B9E
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 05:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0B11F2BB8;
	Mon, 19 May 2025 05:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="DM43X9b2"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020143.outbound.protection.outlook.com [52.101.156.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307E51F1501;
	Mon, 19 May 2025 05:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747631309; cv=fail; b=jW+ZmKR60mcVDFCocRSDycDOFKy8hF1ykpWDctCyD64BrPOu/74yoPw2uaOlMpKGSDACDop4HcK4ki3ayA7e2K6rg7NFIMsHhFh4mtud8WV1I052FUOHx/uF9EFCc2vRVCpZJqhKJes1ibnw3V7lx6IBYFMzagcd4q0gY+TgN30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747631309; c=relaxed/simple;
	bh=6JWdi7khWNEyPg58tVhmdz2Hg661C70G4n3rh34lU8A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lMrkUhlVebGHvaYU9tOM6tRTKzzgD4DsXxjW9ZiCGXoxClKMULDNNJ12PNrzdtcHO07Zf6xJ4RoZloBGVjU6kANqW6GWyFohJLlUaynma/JU/YuG1emgCwEelVBdN8uNs3cWFEJO7Y7m6Ic7Rl2j9y+K4aoeIWXrlonfzyg7iZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=DM43X9b2; arc=fail smtp.client-ip=52.101.156.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BeTgjZ2r/Us9Gp/QlhAduEJgz5O6Jo3/BLUl61pup1M6aIH+KQu4XGQoICnATJq9h2DzKkYYP6ZbYpc5fVDndeayZ6Ie7fJrQkJUBgQeGs7AxAp5ph+O6FBsNC5Flvg0QjkR8sW3d4kCfnja5SfRmCTIlHeTcEEAUI5tVKrxVik85ycyLAs25fQ9AEG94jizgdcg/Win2saY2u7Y+GiW5lvPXxFLPYQsex9TlO45zOvypvw3mnkomEQ1YMO2srHxOBRj48KevNvreIDLQqYQQieZzQBuJ3yDktqKXjFysnDMZSYtDJSXsxjWqaIGsMlhF9r4ZGNVWukN3P3OCFpvVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6Q1EepZQVCYtXCjaEuOFUtLlwhUTm+wtIh5uugoHU4=;
 b=wvi9yEaGoBHN3rVupy5p+gI4S/Y0ljkQfsP6WIupYHnQMs4jELEJ0TkuTvhdG/SRoegqAMS1RS5WjVMJqQKK8EQmx5Amonvwef5JE8U1cKnx5L0m1lBMEwo/s5d+Pn1efjMZapdhGdPN8YyDqQEecHPYO8cCd/RiLXYWtIsOoX0DPIpGRUFq67ao+lNEzXXtVaBemm+NIO2mxdULkRgkpLEp+gPRKI4tH6+5SzHzDdMep+xoW108MK7J0n+4Ee7FuvohUiSuXb0+IVzJxQSmuyXnu5E2j0vN1RvB5M2nfojNdlyRJGM+YQfumg93QsaRNIVXB/FFYjI1cgsniscKsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6Q1EepZQVCYtXCjaEuOFUtLlwhUTm+wtIh5uugoHU4=;
 b=DM43X9b2ERNuE4DxPw2el3Xi5E+cbqjuEg3WMuJMGQy/3YSe5o9oR1feN30rdyMxI70ec6HxAqzJ2lQca9C4YuS/MVNpJxo1aMQWbLrTKZh/d9HhZzlvHbbwcKo85c8T/fxF8aL8zKuqLBRmjXwV13EvTwFpXW9Vj6+1T/hb/8c=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE1P216MB2083.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Mon, 19 May 2025 05:08:24 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%3]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 05:08:23 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl"
	<hverkuil@xs4all.nl>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
	"marex@denx.de" <marex@denx.de>, jackson.lee <jackson.lee@chipsnmedia.com>,
	lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Topic: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index:
 AQHbs2lXzy1gLrNeZ0ijKXj6PUT3srO0NFSAgBWF9JCAAHRxAIAFp7/wgAWGbQCAA/TX8A==
Date: Mon, 19 May 2025 05:08:23 +0000
Message-ID:
 <SL2P216MB1246B1DA93D85C1536476D74FB9CA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
 <20250422093119.595-3-nas.chung@chipsnmedia.com>
 <20250425-romantic-truthful-dove-3ef949@kuoka>
 <SL2P216MB124656A87931B153F815820BFB8AA@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <f1073f21-0885-486f-80c8-00f91dfd7448@kernel.org>
 <SL2P216MB1246002B8EFD5CBE69E447ACFB96A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <cafba18a-5391-4d9d-aa4c-2f06f93af0f8@kernel.org>
In-Reply-To: <cafba18a-5391-4d9d-aa4c-2f06f93af0f8@kernel.org>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SE1P216MB2083:EE_
x-ms-office365-filtering-correlation-id: c3509634-61be-4afc-3d4b-08dd96932e5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HZQg8HhDrru0BHek4K3IOqrEE5bxcrUcAZvKHCGFnKwiW1Il41LFBA7mXyF4?=
 =?us-ascii?Q?FtoiA03LoJ5WAd563kQjlP47bGuGRmLAEeivoMUcYa/WKPQLouJ/KEPZACTD?=
 =?us-ascii?Q?Rlo/GhXjz+YrOUND6n2HpSdH4+h89InStSGru4PzMnNceH9uqmjMODp0B8IB?=
 =?us-ascii?Q?ChnLRfQwEMN+UAqDyRy27qjdDodbKjr1TsqCSDQS8SY8uONa5FmmBJzirEPE?=
 =?us-ascii?Q?kicmdRmQSn5PWnOctuA27vdoe8rpr3unWkh1B9lVmRNAQYdrUx7pPNVIUoWy?=
 =?us-ascii?Q?75as6CBGYKQCcbsvQItAQkrVlBd49K1IMUzsM4Q/h6nHHAXIY2yeaog8G+GG?=
 =?us-ascii?Q?DQ/Jn+GcXtnWj/d9iRyptsUw9dsqvQgt28HPPkvrTcKIhan7LIhkUI53ZamC?=
 =?us-ascii?Q?ykyLjjHg66OFoNoSbkJpC+Dmoce7nVpzKqR/ZQEAkhzxNgIOhnAOBNzpxu8e?=
 =?us-ascii?Q?OQX+Hw1Bj37yUBesC74/oyMyL4J1FwYdzjWnG/9le21tjNNup3cWtYC+YXV/?=
 =?us-ascii?Q?KaqlPLlC79jAQHA+6bwOKilr4ccLLC3xoM13HftUh7py2VmfbwOB5JdKJMyA?=
 =?us-ascii?Q?QOL1kEkrwlwruXnBDMl4HXwRRVW7Y0/SCtJlZRwG1GaYIw5uId8WbH1d59HG?=
 =?us-ascii?Q?3kjMbEL1gDY8tlYGY8Z5vI7HHfI/ZU/DXEWCQVRYT9oncgiykzTSOXoshYUN?=
 =?us-ascii?Q?6EsJRdGudYSinUEvJPEdPdnFlgnv32yymeE5J//QDPzzCemWhetpXBZK7Hxo?=
 =?us-ascii?Q?nJe9H4kq8QiFmAZvU0R/l9OI2lSaXyjl9Hv1hVpoitwyvi08LbfbiJAFmP6Z?=
 =?us-ascii?Q?l5VYUdvkkX86SsFCSYeYwMln2SGsBhHSw77Te4S3KAvlpmX+kAv0zyTVDPe2?=
 =?us-ascii?Q?OQalK1sFyNHwLfSq44o53Sxm5EGIeDjQGYZ8RSLfMCxWrH0yFCwtg2ZBOZEg?=
 =?us-ascii?Q?cVdtCkgL/altjHtZfSfAm+jFjJCcvGJm6Dj4V+JY+YjRKwZsaQg+Lmzcu90E?=
 =?us-ascii?Q?bIZH/6ndYTxpJRLZhSuUp/pjX/gpEz0y5TNUfRzxe+wzgD0DhgJgDT/FCktW?=
 =?us-ascii?Q?pdH1kwamsBrLWCQhF88727cer4aKHWdgkbeQrNVviThZxnzrLNHpiUlSWGEi?=
 =?us-ascii?Q?DyahSKvcOcFMsYH1tvufdmESYUUIZdni5/dTiP6a7hugx8M0bscgEoYolaVy?=
 =?us-ascii?Q?CSeP5bC8VDVzFE5ld6jtpfUYy04esCAe6lwCMdh6rNBpWe7gBWBSHf82TWLh?=
 =?us-ascii?Q?N8DzjOOh5qRJdSIwsZX9L988xOUWCqX/0V7B34d+P1g1pI+UcRteb05wnRW0?=
 =?us-ascii?Q?/Yi0JFd0kEQ+n6ontB/4UcXsUA5juX0fvX3VxZAc6/f/v68t3JpFesrLqdhQ?=
 =?us-ascii?Q?nHN0B6rc/8ZbzKY2GbT2UAn/KFuftdcrUCH78dBsLtAX7wZ33cbPth0wrylR?=
 =?us-ascii?Q?QtIc8w6lz1gMrqSEDoD6A/aOXl0Y6Iyinvd4BZv5uuXt6Gw6tiNhAg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KoGN/MJp3FkKLxJQcyJ5rMS6ITootUOwEjUL9kKlta10VASyE1YoIskWeLM9?=
 =?us-ascii?Q?WFlQg5mh39KihzYOhEsoj5Uu1IE8xOpF3gXAv5t3dLzxF3Vi5dIQyi5BfBpY?=
 =?us-ascii?Q?aRNATIqhvUU7+zPhBbw17GKW/i9RTl1hP5NeJQwWUpbDIxNT7T3D3eiNpkQy?=
 =?us-ascii?Q?zeXzyk/5AdY+Ntksl77Q6NK01FCLXeN2RuANDk5L3wfpVyfF1d3cnvBxVUV/?=
 =?us-ascii?Q?vyIxB8k7ZboeDUjvZAeofPVZ9VJNCd1b+5LCUifoGhBc10GYM0AhFeX2J07n?=
 =?us-ascii?Q?rLtsjPjRM2+GpJTrdxTY2drwxAH9Zlyjb2Py8H2JwZOqAfwhHkToDtFeoptx?=
 =?us-ascii?Q?T/PM2otBiNXEmx7b7pxwmKcbP1/xQCpmsahAJ4rAirn03/qKnogAiU1h0cwA?=
 =?us-ascii?Q?UxVJQXJ7skJQbpc4rXdluqE32rSsjrIRqncoRkdahsz2BVWE+U07IIGVIXRx?=
 =?us-ascii?Q?ZaKLQy4e0Pa+xmACXjvUhAJUC195z9np994yoMHVClZ80BGq0tlGB1TajZZv?=
 =?us-ascii?Q?QAARWL+grbVJuosUSqbTPjCctkfwgIurqu9nsU1E39eC1RB8u+0FP3hm1AoR?=
 =?us-ascii?Q?1GYb+o+Knb7T8+CJmOGorvbTJ3Zx0JnH+VK2qN/BvvIvj8bbqNWFxnsG24cc?=
 =?us-ascii?Q?93+C2iewBbcyHTm7QIVaU/NfHja6klORDQkO+iFE2NJ6j6lTnhfXH1Nk9bQW?=
 =?us-ascii?Q?UxTmQXKqBQNhahVXqSCscOHGF9gnDHLtA59zPmVpE1YoCFJ5saiyTnG9BUsd?=
 =?us-ascii?Q?tYe9xhzK+znLQS5u5GxHoEUbrf0ILiTmVSjtl8UWrHHxhOp5E3T92/iQ8aJJ?=
 =?us-ascii?Q?nNnW281eWhwYKTZwDNo/sRLiV7BEABksPUauGwfPe0ReGKWfZuvygYZz59GZ?=
 =?us-ascii?Q?D9/ZSPn6E/2bzk/BN1NBz3OIvjqpyZ4h8wF+cH/yCjreUaLE6g7sXjFYaNWh?=
 =?us-ascii?Q?bw3McyFk85ZQ0SfVLkjnb0oYEyQrmpk14Urer7cCkcJ/XK5my9dLn6XaQRZX?=
 =?us-ascii?Q?K2pabnNASCH30Cep7s8UW6q38ajKe5ctf2ft6lYmOPKoNhu8vcY++h9/v5jb?=
 =?us-ascii?Q?dL2uTWfKiiOlG6fGiLz3pDy5V3NrCX9R+CMcinxPBYlyKCrQ+HE1o804ZNTn?=
 =?us-ascii?Q?z+NbDYEV4wz600MBKpI7PogiKo3L7e80bO1AvQEyZtA0ovmbLG8w4inRLEd8?=
 =?us-ascii?Q?2GkF6JMLuQsynBrLAIy/4W8UrXd9MzpXe9OYlTAzw7HZvGmjKHtGc87Ab7wM?=
 =?us-ascii?Q?mhSDWK0KZzZuutDr03KtwGKUJo5C/LLOuxl/WpMXCBL8/cth6syKBaeZsG4b?=
 =?us-ascii?Q?F7pxILNQNy2gifWBMejKCEtFWzAU+hPHHm+y1xF2vKpNtFdd5Z5m4z+XNpub?=
 =?us-ascii?Q?uzZrxrshbuyw9PKz8J8gq7AcmSXvAMrsTwq0/hBfJiyjspoZLRVXv4Z1DQM/?=
 =?us-ascii?Q?mdcvMf6StU82g1OeiL7FMH8qs3gkVZ5RZ6k3NR1fLZ/IFH56mUVF2ItN8Rrq?=
 =?us-ascii?Q?Xz1lDik9IaMChinGRCrWq7fxJ5asHBZ0I0eobg+IG6J/mED+M4nbja+lEAGV?=
 =?us-ascii?Q?aqBw+UJ3Ii53hY9FpRf8J1zkka5G1nviwu8/LDvp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c3509634-61be-4afc-3d4b-08dd96932e5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 05:08:23.8358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n9F1LF0JX1mIPYYkbeeUWJEDShw4iThNZ3H/Qv20yMt2p0xV5NmoT0euuwaXracSbog6nBAM+acqAgKdV4cLUkLJP0qdpUiFpCYOuEkXq2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2083

Hi, Krzysztof.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Friday, May 16, 2025 9:56 PM
>To: Nas Chung <nas.chung@chipsnmedia.com>
>Cc: mchehab@kernel.org; hverkuil@xs4all.nl; sebastian.fricke@collabora.com=
;
>robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org; linux-
>media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; marex@denx.de; jackson.lee
><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: Re: [PATCH v2 2/8] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>On 13/05/2025 09:39, Nas Chung wrote:
>>>
>>> All of above are wrong for the SoC...
>>>
>>>>
>>>>         #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>         #include <dt-bindings/clock/nxp,imx95-clock.h>
>>>>
>>>>         soc {
>>>>           #address-cells =3D <2>;
>>>>           #size-cells =3D <2>;
>>>>
>>>>           vpu: video-codec {
>>>>             compatible =3D "nxp,imx95-vpu", "cnm,wave633c";
>>>
>>> What does this device represent? It is not "ctrl", because you made ctr=
l
>>> separate device node. Your binding description suggests that is the VPU
>>> control region.
>>
>> My intention was to represent the MMIO VPU device, which includes
>> both the core and control nodes.
>
>Then what is the VPU device if not CTRL? What is the CTRL device?

The VPU device represents the entire VPU hardware block,
which includes 1 CTRL component(node) and 4 CORE components(nodes).

The CTRL device represents the VCPU, a 32-bit processor embedded within the
VPU hardware block. This VCPU is responsible for executing the VPU firmware=
.
The CTRL device is in charge of tasks such as firmware booting, power manag=
ement
(sleep and wakeup command), and managing memory regions that are exclusivel=
y
accessed by the firmware.

The CORE device represents the Video Coding Engine, which is the hardware c=
ore
responsible for performing the actual video encoding and decoding operation=
s.

I intended to represent the VPU device as a single grouping or parent node =
to
reflect that CTRL and CORE are integrated in a VPU hardware block.

Thanks.
Nas.

>
>
>Best regards,
>Krzysztof

