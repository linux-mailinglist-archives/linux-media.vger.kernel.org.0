Return-Path: <linux-media+bounces-41524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ABFB3F6D3
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 63E024E28AC
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEAD2E7198;
	Tue,  2 Sep 2025 07:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="hw6WZNX8"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020081.outbound.protection.outlook.com [52.101.156.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E856827F01E;
	Tue,  2 Sep 2025 07:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756798978; cv=fail; b=VurklnpBmPd4aag9YYj9XVgxz1ZEafnSssVvsacRQJvAtr0LOEFAEdCVep4ioc9F+9dwuPqlTTBRgsQvVt9/u2w65w3ku7DuXlZHjjxER54iiovpo4M5dSggrfTZLGF49Y22P77lVFqHQgvde+o1y4TktXM0mB2Ri5A0gPO3BIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756798978; c=relaxed/simple;
	bh=zc6LIMlo/fVZuy74d0L9DJ4nNaT8lpto1r7Dpt/LkOI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tvxo5hLLM+jNWxHy0eHeUENBS27UUq9CYSwV+kfjjARAlENjDJAbKyB/5lEg5IxQc11aONNyG3yaxLe1ZLZxeevzTFwj/m5JU2DitlFu2m+AO0kPcISgDqunt0N8asgsPwdirX4DAQK/tkaMrtH1yg/cdJoRYBt/xnUxjJ1gozk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=hw6WZNX8; arc=fail smtp.client-ip=52.101.156.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4D6MMVr25acA6P/346bHhSV820MVsdPp8f2lNXYp/gYRNjnrZ87NJmN01gaAYZRWLB9ikS/e10TBti2G4uC7XRJb4gjj2vE0eXDHVA/xwobYhrupirzjbJQptabxwMIP/fFj+w1LwvT0dy59uEbnUGaPvsm3X5e6ODgb57tPHQw2eAK8/JtU/u2L8644SgQGoncKD1jeSYf/mQbm9quB3Hy4sFH4Z7QgJeg350StO/njZS1mGkCpwB6+CaC13wYNkzEXYpfQN9/p7Kltjw3F6EDFtEUSxl9qeJZszdXkuWtROAX+8mHU0WzdtDRHXTGhP0TQDByQCEWDxChJfdY6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKI5gLGTj07P22khPJSte6uwbo2TpUQvafpvsUjktDU=;
 b=xna71hb+EFr84yyVjc6/baZ3es7o1uinAQr8SsoM20mzGSZufNhfkwlYG8IL7VNK24Sue51sWMEb+51JAVC/Al8VtxJtfpiqMcViKC258SCb7h24CQWclOKIfoS+poay9J9gDTuV+v6593QXbq++TTpvO/SvTlvMNrFCFKj8RudKUP3ST26Ic569gsdto8KhaffN0SV3nYO9Mznzv1Fanyd92Gp8T2QIw1HeyfgAi78kYjjrgUCj5/EjRuHQSy+55Tc55XvvcrIJ2MMFfzlmNLPVhRZC+Ao5GMRyr845Lrt9uez7Et2+AnsgKulh3ZSVrw66WH34KOZetagi87LxqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKI5gLGTj07P22khPJSte6uwbo2TpUQvafpvsUjktDU=;
 b=hw6WZNX8jtOqFYt+dtqqniwQBS/Q2owvMOBZbgVowStpCLEaZDqo8fmoElAUKSHhJcnYM2TEptW36p9cPIhfxhDH8Uq0P8WJXHX6eY6gpw467gOLEGGZKv7dGVDqG5BiRBtkJn52Dj55be6xS1Z1F211C3WbMxdRG5a2tnccB70=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE1P216MB1333.KORP216.PROD.OUTLOOK.COM (2603:1096:101:17::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14; Tue, 2 Sep 2025 07:42:51 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 07:42:51 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH v3 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Topic: [PATCH v3 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Thread-Index: AQHcGMGJZMRvpcS8k0m0pKjSJCiRfbR5qCyAgAWDqKCAAFVmUA==
Date: Tue, 2 Sep 2025 07:42:50 +0000
Message-ID:
 <SL2P216MB1246080FA1F1DE8B707A1C5BFB06A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
 <20250829084649.359-3-nas.chung@chipsnmedia.com>
 <22379203-94f8-468d-a9b6-de67f8fba495@kernel.org>
 <SL2P216MB12469B8A2DD5B2F6EA2F04DCFB06A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
In-Reply-To:
 <SL2P216MB12469B8A2DD5B2F6EA2F04DCFB06A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SE1P216MB1333:EE_
x-ms-office365-filtering-correlation-id: 9527069e-e006-426f-fcc5-08dde9f451c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3N+gRwLRu+Sb7ipBL2qukk610V1+haj3JNIQ4XSD9GKemJ+hISI5M1vZ7JxX?=
 =?us-ascii?Q?CfIxkYe7LqRbj++bj8ciqz2pWiZKGvlG6wxiEjDd8e8IhSikZ2iH5ma7teWM?=
 =?us-ascii?Q?vyUVfwZKrZE7fL7B6q77vg/zOJkC7nKlEVnWbighVYWkXPWq5zBNewyZA2FY?=
 =?us-ascii?Q?1EVFQfuhTCtO20byFSEH75SdbMDUWj1hedu9yHO5guaVmMdfLj++s51lIqlI?=
 =?us-ascii?Q?TGImCHpEa/OBhazlsXaP32wXx8OwXVgrFOwXHBKbHlbrPEd52s1yPzc3gPCD?=
 =?us-ascii?Q?lwzkK+omvGzJgbKFKUxrVBGlgTQvRStnCqafEHj6pKBR0NMYIz2plVK+NV/j?=
 =?us-ascii?Q?u3vhZMQ8Z5KuznEiJxU601sahucpP8/neHp9I7UqjvBkBHY6TwEXlj3+4tL1?=
 =?us-ascii?Q?a/jnKaDBIq0RJwneZToXFYYlbuwTXfyX1+v91QTlcA4O1rK+Cuwnt98rQqO8?=
 =?us-ascii?Q?ykF9piOMvkoEDeZDTVFQZatfpY58ykX46uYZASwxSTA214eXDOOY5BCxeUIv?=
 =?us-ascii?Q?pNS1rLVAvhouL6ZhPexOf58fMIzcn9YnkUV9NvMKlsy9WRVQTfkqjJSevZTQ?=
 =?us-ascii?Q?N3dhuJNKpcTE5SlOHszvCe+k/zsbBFvY0SvijJm3EjL+gOcKskp4ctuIMBeP?=
 =?us-ascii?Q?DXEEPrQKlULrBXpf9qNn/Vq5exv48zAKR0VXd7EVa15VT8bnYEp0hDN+UtjL?=
 =?us-ascii?Q?0nnIfzT2eAMvVL9YcbhGkScFQ/HFmSdzKfG9SYsCHRJd/v51F018Qf0yg6Zm?=
 =?us-ascii?Q?PVtU3MKK4blz9xKmiVG8YAk6X9cEBoiJ2FTrOb5epPaRw68mg3x17XGS36dV?=
 =?us-ascii?Q?UFjWUCjL3OcD655B7o0nYdjsnHDzDW3702ckmvqPYQoNhef1fPKRm6Nk0tso?=
 =?us-ascii?Q?9sE7bbiUicAXJj3SsppLOoy9eVQrj8oXTCXPKsPlRS/IoG26Z/deAiELGJIa?=
 =?us-ascii?Q?NqBaivL8lSy2R+dZfxuogryOfSNxQklDtnESL3fZ8njp9SlPu61XhJSoOOwk?=
 =?us-ascii?Q?JeoSPaLY/aVBbQBRoM9xwIjWtWJmJa4RLn0PuX+CtcSMAr+AJkkG0CIINaCX?=
 =?us-ascii?Q?r3Ganwv/OQ6cQpeTX1+68R2dLreM3y8WvKycKDXWd230e9ziVezLYQSbNY7O?=
 =?us-ascii?Q?nN0rIq0hABBnwLps32LIfY2Du0MCG6Accc40LNVOXBYZjdIHV8LKhC8ArkIV?=
 =?us-ascii?Q?p3DQP3XqSzn+tqwMr9S8PxX7Gr9xcp/pOpcdikDEMA9mMDbiCSi1PznTcKGU?=
 =?us-ascii?Q?XnUX564f8mhkM/Ad7tJ/gEFOw/ASLcifmOC7KpbqeusgNmJjiLX0EoSXmoaV?=
 =?us-ascii?Q?hZ1Eypwbnc3u/oHMp0pkJ67JjxIEVmrmwsIHN8hCmEPl6ITOXrCZurEHlnPD?=
 =?us-ascii?Q?VZ/wca9blwKbH1GvlicUVk7VI1rsvN/mrki/NCmpvWW0UEnDCx0UKVMoJaUr?=
 =?us-ascii?Q?JGsftCAfp2w4/zr04SqZpVKsH7u0Gu08FbVkmjupFc4Roxr8C2Ep7g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7yRn9ykNZ/6AnY6hYutlz4jNOVIV6E2HGkR1xwIS9d5Ul2LdF/T51OLVSMcB?=
 =?us-ascii?Q?Tw1bT5ykrAEBUccuTHi5iiEcvBCJU2UoeUPL6yG40JzgXe2orVOTykycdkRU?=
 =?us-ascii?Q?RY8Hc7wlEip7eVeYs9AEEV/Z+Tk+IzpO/c5OzryesxJv1tVnc3hl5zUoyeF7?=
 =?us-ascii?Q?DVADeV3TvkM+b/4+4bLCaNPaJAvpXX/UpOiixsEVlVh10nJNTQ8dK/GvvseN?=
 =?us-ascii?Q?dVqhhI/lKCM94ysunlqzRvtfwOKsSLyiCAH8mhM/oryxt5yLxEyFozGP0v0f?=
 =?us-ascii?Q?rjwDj7DN4d2Sti/W5+FczyT8I9xN6mlgrrKo9Sq73kGO/yaj03j35RT+iI8O?=
 =?us-ascii?Q?3ODkRdbZrprItWoOHJsE/t+Jl0zPgzA7zREnWK116QPM+G83G8Glb7wnihvg?=
 =?us-ascii?Q?WBhyZtWlpSKa/Ubeu10MY0pSgkJNE8qk6C5yw96nayZctAnLSTxTX+54L5Bm?=
 =?us-ascii?Q?v1M41VvkcR0nEsB3fNJnOMYITBRBy6pb5S1RXTgE6s7wA4/8ekEZS+/vG4U1?=
 =?us-ascii?Q?UPEfTDXk1zTAqxs/mLie+yUjwYcRPrXJyTk1MKg31MN2/AALoKlHjScVaEI4?=
 =?us-ascii?Q?j3ZY9WdQnYd5PhOcllGmK4pDnxbtYqLLqjNnm4HAYBtXEF4R4SGH5lroNgvX?=
 =?us-ascii?Q?lD9h74TCPX23ssLUW4s3VyAqn6NCth7apGPntR7R/hZHS5ZsPR87V7yQpjAL?=
 =?us-ascii?Q?B9o4tlk6f4IivYR68I+jAmI9/a75AUFG2T8P7hhdpCX1u1TojsQ5/pAVxbeJ?=
 =?us-ascii?Q?tho6Hh4LUQuWIOh9hJiT7BGrsPApXFnAamwFTH7GoJ/5ADlim0g27R/qjH/C?=
 =?us-ascii?Q?OTle5ZHrAq8gzmOctC0JnJOyWt4rkzD2opf8nPFjf6Vt/sMSGYaMxUMb0+90?=
 =?us-ascii?Q?1ZBP2/paYOuggLZK9pRy6Ykz6nBtbAbmHXwDeA92htEvgOJWi26u1AgTqa03?=
 =?us-ascii?Q?PE1hCVba8i2nn2g2ZGLijxgeS0uxOts1K77q7kRYzFsIw/XDZtACQl0I70Zy?=
 =?us-ascii?Q?W5pyl7q8iaFOJZCvkQ8M+gL67UTiU18/S8FNe8EfMhM6Wj6NCgWjhC0341Xk?=
 =?us-ascii?Q?8mY9XzTr6RmBEY+wiCr0wNBB3nFsrpfZn4AaufugZHz89DZATMMBkspfz4yF?=
 =?us-ascii?Q?CnuKk1EOARHZqsSBRNim2IA+OhIbPwrYx8Ehp09zMbt91vWarF6v9LTgkbRs?=
 =?us-ascii?Q?gJo7FZd/VfbIasHNG0cZgDxVVhgVVcWyJq08A+mOaVhCl3g87KVaNolxRFai?=
 =?us-ascii?Q?93IS4G8+gWD0pt+7nBQeuKzU86Jm6Zo09bDp1YSqKXc5qAgo9oqecmhVfiad?=
 =?us-ascii?Q?WPsI8jccF7kTJwlmKho5ggSPxDZah30j9j27UFEHgGmTDydHeofapJ+Pyy+o?=
 =?us-ascii?Q?7YF+tVyB0fz20sj+oHuzZJhU3wOOIAblpKFXAKhU7x2ftg3s+EmzCayomgP9?=
 =?us-ascii?Q?SBFUdhaqrbSH+PeSWJFwWhOA0IfZ648V6BnL7X1/kG+4d6kTZ9bi40S+5jln?=
 =?us-ascii?Q?z4r8DV/f30QoGjEqVaL4V6LbbNMmmk5l0xUteggg7Ham+g14fEFIar2+oXUw?=
 =?us-ascii?Q?Ew2daUshIva/0YrJqL1ubne4Af4wiPG5PfxE6pGJ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9527069e-e006-426f-fcc5-08dde9f451c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 07:42:50.8740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xkVfCsLxV4pcN13WWRbJ/m4Bu1s5NkLyPgLX5anfDlEcKCUYTiGGxYuY5nW5cZRBZKH7UpQQhtxVcLX/rIy/OCQPbZcPGCvpVvlO9vT/sVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1333

Hi, Krzysztof.

>-----Original Message-----
>From: Nas Chung <nas.chung@chipsnmedia.com>
>Sent: Tuesday, September 2, 2025 2:46 PM
>To: Krzysztof Kozlowski <krzk@kernel.org>; mchehab@kernel.org;
>hverkuil@xs4all.nl; robh@kernel.org; krzk+dt@kernel.org;
>conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de
>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>lafley.kim <lafley.kim@chipsnmedia.com>
>Subject: RE: [PATCH v3 2/9] dt-bindings: media: nxp: Add Wave6 video codec
>device
>
>Hi, Krzysztof.
>
>>-----Original Message-----
>>From: Krzysztof Kozlowski <krzk@kernel.org>
>>Sent: Friday, August 29, 2025 10:57 PM
>>To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org;
>>hverkuil@xs4all.nl; robh@kernel.org; krzk+dt@kernel.org;
>>conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de
>>Cc: linux-media@vger.kernel.org; devicetree@vger.kernel.org; linux-
>>kernel@vger.kernel.org; linux-imx@nxp.com; linux-arm-
>>kernel@lists.infradead.org; jackson.lee <jackson.lee@chipsnmedia.com>;
>>lafley.kim <lafley.kim@chipsnmedia.com>
>>Subject: Re: [PATCH v3 2/9] dt-bindings: media: nxp: Add Wave6 video code=
c
>>device
>>
>>On 29/08/2025 10:46, Nas Chung wrote:
>>> Add documents for the Wave6 video codec on NXP i.MX SoCs.
>>Pretty incomplete commit msg. Nothing explaining hardware, nothing
>>documenting resolution of previous discussions (where is all this
>>chip&media?).
>
>I see,  I'll improve the commit message in v4 to include hardware details.
>
>>
>>...
>>
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - nxp,imx95-vpu
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  memory-region:
>>> +    maxItems: 1
>>> +
>>> +  sram:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: phandle of the SRAM memory region node.
>>> +
>>> +  "#cooling-cells":
>>> +    const: 2
>>> +
>>> +  "#address-cells":
>>> +    const: 2
>>> +
>>> +  "#size-cells":
>>> +    const: 2
>>> +
>>> +  ranges: true
>>> +
>>> +patternProperties:
>>> +  "^video-core@[0-9a-f]+$":
>>> +    type: object
>>
>>Missing description.
>
>I'll add a description in v4.
>
>>
>>> +    additionalProperties: false
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        enum:
>>> +          - nxp,imx95-vpu-core
>>
>>Why do you need here compatible? Can this child be anything else? Can it
>>be re-used? Is it actually a separate block?
>>
>>Your example suggests that the only distinctive resource are the
>>interrupt and address space and that's on the edge of calling it a
>>separate device.
>>
>>There is some tendency to call such "pseudo-cores" a separate devices in
>>case of video codec bindings and experience shows these are usually
>>fake. It's not the same as DP or HDMI sub-block of display pipeline.
>>
>>That's why you should come here with strong argument what separate piece
>>of hardware this is.
>
>Thanks for your feedback.
>
>As you mentioned, I wanted to represent the interrupts and address space
>as separate "cores". This is because, from an external perspective (e.g.
>multi-VM),
>each of these resources is a VPU interface and can be accessed
>independently
>to operate the VPU.

Apologies, I forgot to mention one detail in my previous reply.

I did not include the SMMU-related properties in the core nodes.
On this SoC, however, each of these cores has its own SMMU ID
as part of the SoC's isolation policy.
This allows them to be treated as independent interfaces,
even though there is only one actual VPU engine.

Would adding the iommu property be the appropriate way to describe
this in the device tree?

Thanks,
Nas.

>
>However, there is indeed only one actual VPU processing engine.
>I understand your point about "pseudo-cores".
>
>I would appreciate any guidance on the preferred way to represent
>these resources in the device tree.
>
>>
>>> +
>>> +      reg:
>>> +        maxItems: 1
>>> +
>>> +      clocks:
>>> +        maxItems: 1
>>> +
>>> +      power-domains:
>>> +        maxItems: 1
>>> +
>>> +      interrupts:
>>> +        maxItems: 1
>>> +
>>> +    required:
>>> +      - compatible
>>> +      - reg
>>> +      - clocks
>>> +      - power-domains
>>> +      - interrupts
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - power-domains
>>> +  - memory-region
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
>>> +
>>> +    soc {
>>> +      #address-cells =3D <2>;
>>> +      #size-cells =3D <2>;
>>> +
>>> +      vpu: video-codec@4c4c0000 {
>>
>>Unused label, drop
>
>Okay. I'll drop the unused label.
>
>>
>>> +        compatible =3D "nxp,imx95-vpu";
>>> +        reg =3D <0x0 0x4c4c0000 0x0 0x10000>;
>>> +        clocks =3D <&vpu_blk_ctrl IMX95_CLK_VPUBLK_WAVE>;
>>> +        power-domains =3D <&scmi_perf 10>;
>>> +        memory-region =3D <&vpu_boot>;
>>> +        sram =3D <&sram1>;
>>> +        #cooling-cells =3D <2>;
>>> +        #address-cells =3D <2>;
>>> +        #size-cells =3D <2>;
>>> +        ranges;
>>> +
>>> +        vpucore0: video-core@4c480000 {
>>
>>None of these labels are used, drop.
>
>I'll drop it.
>
>Thanks,
>Nas.
>
>>
>>> +          compatible =3D "nxp,imx95-vpu-core";
>>> +          reg =3D <0x0 0x4c480000 0x0 0x10000>;
>>> +          clocks =3D <&scmi_clk 115>;
>>> +          power-domains =3D <&scmi_devpd 21>;
>>> +          interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
>>> +        };
>>> +
>>> +        vpucore1: video-core@4c490000 {
>>> +          compatible =3D "nxp,imx95-vpu-core";
>>> +          reg =3D <0x0 0x4c490000 0x0 0x10000>;
>>> +          clocks =3D <&scmi_clk 115>;
>>> +          power-domains =3D <&scmi_devpd 21>;
>>> +          interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>>> +        };
>>> +
>>
>>
>>
>>Best regards,
>>Krzysztof


