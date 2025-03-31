Return-Path: <linux-media+bounces-29070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A16DA76ADC
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 17:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EE233B23AE
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 15:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B0E21A44A;
	Mon, 31 Mar 2025 15:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QXKxcK9g"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B55621421B;
	Mon, 31 Mar 2025 15:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743433455; cv=fail; b=guQVTe9NHCInNyM6Pc/JL9F7mGcPAh2G350bnPxrYUdkwDi72dO2ngdfezr8kADUoiSfZjt/y3aOLT0DgvhZwKL8TH70enmfs9s+DIU2jbkQZRwK8R1XXsWT5yq0quDsLw38aObV5rt3tDON/tLzkoYBPHwe1Imenmp5cgRj9XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743433455; c=relaxed/simple;
	bh=EHP9gFKo0/HNg9BWiPu4KayeTMs/f+3BqLlaEuwN7Zw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sA7k9kDvVhHRge7X6pgZGr8LgP9qrJ7y2wxeYJ3hNUtGgzdH4oXtA5MNPeTKjEL6udZlRE0C1a53skZbsl4mkPnBXtrIw8TSMLIDPRZ/frcBKAE+bUft7vSkKl/nusIGqF18YugaJXQltY2qC99hfV07BW6icmod9aj7ug5ybkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QXKxcK9g; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKBhDRUed34iyOpwDlosfVaBartilqtWA8OcdEgckPV+ACzmLCiEZtV+FhHIseY7ALCeZbMwKb/Fk3JCPLXF0Pt4h1VUSk2ylWTxa/sRrqsW8+a13IKrqxemzKMJ+vDb45xZ+1XUZrKh+IKvbtk8lPcUyjY3KSAWFInfAc4vjqEjXhQObG2lMTlb5wFrAEQOrrHblaslHxu+9CDP0x3SDcAnPXkgr6ta5HaEg3OY6vwfdWjG2GiQ6Li/OW72UVyYSzbZWCdmFcDKs15lN6+efWFvMF+KkZ8hL2N7ehOoN+Ef/RXl6NeTfkCWarA5BrI8zBxLINaESsFcZtBVbbx7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHP9gFKo0/HNg9BWiPu4KayeTMs/f+3BqLlaEuwN7Zw=;
 b=CxhH2Up7JzWZve8MG03L6pNG9usu+T5zpTDvgC92Ki213BYTqffI11w74xgLObWPR0pE0z4BvQAv3xJigdJt/g6x0vQAf5xXm8Dnu8gS69Z9W0Zkt1ofFG3t/IsBSSgunnR8EwiKdTUtzL/SJ4UqrmG+AjFWulmNcybURFuenItfLrrNT5UAx4mLf9EPKpyVVToYKiN//5pnvaezsnZHmmLkNWOXNOgcUfeilqTvgZ/93G9uE5aHIhQE4M1/WjZaXG50AIZBaXDEziEJISJK7Y/+KEnywOm4x3YMuy4VzmzFxedXI7eKYVsVvikUz6yj6d/drwXBN/KlZZhBwuQUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHP9gFKo0/HNg9BWiPu4KayeTMs/f+3BqLlaEuwN7Zw=;
 b=QXKxcK9g6xwNBScVmXJxlFXHpVm510DdvwKuEzqfQm+/7F2NQLIeqFD+3YiuN2Lf/TgVZpC6ODqHELnHcXjslHwIUdCIJojg7w/G59iM0Vtg5oZGDzcyJAvlAoJWhhEiQ1Eqa00CLodkJ8fhHROUecHVaPxpS6AHOQIU8xNfaJY=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY4PR01MB14418.jpnprd01.prod.outlook.com (2603:1096:405:239::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.29; Mon, 31 Mar
 2025 15:04:07 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.8583.028; Mon, 31 Mar 2025
 15:04:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
	<laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data support
Thread-Topic: [PATCH 11/17] drm: renesas: rz-du: mipi_dsi: Add OF data support
Thread-Index: AQHbobffKVZaNpzzt0OUbkVl0xBRjrONLy9wgAAXaoCAAANnEIAACUcAgAAApbA=
Date: Mon, 31 Mar 2025 15:04:07 +0000
Message-ID:
 <TYCPR01MB11332EB9F2552938B490E62F886AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113463B37FE6B1AAE8CF0F51F86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v0K_tWA=LnyHDptoBjtgPHSbgwpJp4L1rw4Uv6KC+-JA@mail.gmail.com>
 <TYCPR01MB11332F548F3770F0C70C9051A86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CA+V-a8tVQaDBzLXVJUonmV6eW3i_KLTTjVm3L0Kf2A1xrMoUHQ@mail.gmail.com>
In-Reply-To:
 <CA+V-a8tVQaDBzLXVJUonmV6eW3i_KLTTjVm3L0Kf2A1xrMoUHQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY4PR01MB14418:EE_
x-ms-office365-filtering-correlation-id: ef53cc62-3741-48b3-5983-08dd706548f0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VjFxN0g2RU5kbDU4YlBvVGZ3NlhEOVMvaUU4ZkMvWEI0elFTRGx5aGFBRHFr?=
 =?utf-8?B?R2Q0REtoZU1zTmNhQVRPR2Vma0ZzSGM3Y0cvSm1oaFIxdmVjQ1VmZk96STh6?=
 =?utf-8?B?Y1pOcmk1Mkk1QnR3eGZzRWl4MW5sTldzTTlvcDNBYkprWUEyU0R1aCs0Zml0?=
 =?utf-8?B?RnpLc0FCSy9UV01LY09KUGRKTEdtUWlnZG82UTFRZkdERnBQYUxocXd2WFNj?=
 =?utf-8?B?cEVjKzYyMlZDWnh1MlUwd2xhZDN3U3dIZWIwY2pCbnNHMFhNTnMyblVkVnNY?=
 =?utf-8?B?NFZVL0VxZGk1dVZuQlVpeWF4VTgySmw1cTRBS09FTTQ3YlNSYzkzY3dsMUxU?=
 =?utf-8?B?TThDV1h5ZkFZd3J3bmdsaDVBRjNuMm9odmR6NXdTQ0dGRzhlQm0rOE8ydkp4?=
 =?utf-8?B?ZDBSV0Z0bUV6V1ZFTzg3TkdMV1YwSy9hQ09TMFl1d0N2eFpadEM2T1NCOWhw?=
 =?utf-8?B?cjUwL0Ezb0RUdy8zaGs2L3V5WmhtVFhJMnZmT3hUYnpGU1NWdHQ4MGpaazF2?=
 =?utf-8?B?dzJ2VWc1NUQ3bkFxMVVWYmc2TGFObzJleEpWY3NEUGo4dmV2bThMREszejVq?=
 =?utf-8?B?YWxHU2FLNm5JeUN6VW5mbURib0xBYVROVXlHTG5kOElRMlkwNnpxL01QSGgx?=
 =?utf-8?B?YU5KajhYakxId1gxSi9YZnp2bHYyVElvek1kKzFzdXNlNWtuTE9rWXFOS1Nl?=
 =?utf-8?B?ZFFoaXZaYStPV2ZBY2N0Rk1XYkhQU1RlTnN4aWtCd0RsZ1YrbHZFS1dSVnA0?=
 =?utf-8?B?Z0RiRmxVZCtzRFU5blFjVStLSXhQR0FaMnlQaWQ1NXRvMVBzMlJJeldDTWEx?=
 =?utf-8?B?dWE4UGRkanhON3cxd0diRCt6RUVUMTdSSlZQNWJlTTNMUk1BaFc3SmhWeGxZ?=
 =?utf-8?B?YXR3YzlwRTc2aVVuM1J2bnU1WExhYVFTRXZUeVJFeUdCWWw3NXU2MWVndCtw?=
 =?utf-8?B?N3JEaEdCZ09rMU8xNG15cGthZ2F6Tzl5V2M5ZU9uZmJBL3M3VU9UWmtLSS9E?=
 =?utf-8?B?RHpVNXhNN1krU01xekNuaWh4MlRZNG52ZE1QOW8zbDZKeFo1THBoU092dkpD?=
 =?utf-8?B?REh6c29pQzA2VzRoL0pvTG9jRkRjME5WWHFMV3dFNkJCcmJVNXdGNEoyVXJP?=
 =?utf-8?B?eWFQMFJONExIMWh3Ny8zbTNId2dXNGg3d21xYUx6RDNwZHR3aFg0WU1qVENT?=
 =?utf-8?B?ME9uL3huSHdnNWRaUWx1MXEzOW03a01rSG9yQTJBaTA0SjJyaXZ1THVBSWhZ?=
 =?utf-8?B?NDVUK3hVKzN5YUJSRHVjU2RPZ3lxcXlzelRTZVN0aURrM0NHSk5ibXVTeERm?=
 =?utf-8?B?dUpDdVZWaFgzUEhpUEttNDhwWHR2enVhRk1kaFpZa1lpdStkaStyVTYvWS9T?=
 =?utf-8?B?U0d1SUpZMjJNdTZ1b1Y1R3F0Z1RKWTcwdzJ5TlNVdXErSmhINk1meFJnZFBQ?=
 =?utf-8?B?dkZDZmZwZEpTTEhYOHlYZzBWWnErSEdzTlBud05PUGQxTnBxMGxySXhhYmNr?=
 =?utf-8?B?clBXNDdSY01ud1ViRnZnczV5ajhodWJaOFloNHIzdk1SYlBzeDRxZkRrdjlG?=
 =?utf-8?B?dVoyUVVpdmt6NVY4ODZ4VGpBVHYyeFZOWTBJeUVGWFZXRDcraXVUZmFBSHJp?=
 =?utf-8?B?ekNGNWl6SDFILzIyeUJBcDVjZWlxT0pFMjNRdjV0ODNKazh5L2dRdEVaajBS?=
 =?utf-8?B?SjJFTXJISjhuYlRlWHJqWkp6T0NOZ3p4WGlLZXZubWRYOERuSGZkbEFkMTVx?=
 =?utf-8?B?ZnR3Rk93bHNXS2RBWGZRMjUwUzRMSDhHSW4yTk9tS2FwWHhqUUxHZjlobzU5?=
 =?utf-8?B?cHh6M2F2U2RJVmlrZ1oyWndJQm5nakF1cmc0M3BhQXZQZFBGTy9KU0JNSFpK?=
 =?utf-8?B?M0U4ZHNZU2xHYmMxYXlpVE1obGlBWmF6TFBCV1lacGYvUGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TG1UazBScFRqem8yczlOMEs3NCtPNnNFR0V5RDk2SDgxOGw2RmZxNEJabk9X?=
 =?utf-8?B?eE5NazgwR0pKTTJTcTh4LzQ3R3VwcVZTSXJWSmIvWmdVWCtyRU9QSGRaZTZl?=
 =?utf-8?B?R0dQbHp1czdwNExGMW5ucC9yMkdLcktURWcvTUcrQ25ZOUJoY1NrdEQxelpK?=
 =?utf-8?B?QTFac1R2aU12TDYyT1RoczNONXZCM0U1WWI2cSs3c0VWOGdrWFdQYzRaaURw?=
 =?utf-8?B?SytCTlV2SHZYRGQxb25tcUdxYTdrekdWdmlpZWdWQ0xsRDUzNmF2RnZ3RHhE?=
 =?utf-8?B?eXd2c2RkM2xvNTFCQWltbXUyYk5wM01LRCtadWYwS0F4TXpVTFJzTCtaWHNT?=
 =?utf-8?B?Wjc0VnBmdkJJUkt0VGlsQTEvN2JkM3NZcGVid01FM2piemtsUUlncGRvZkRk?=
 =?utf-8?B?YS9KZUpKclZDY0d0aEMxUW1scXp2RExBZ1JMaDF1Qm9tSVBmODlpRmtLUlRu?=
 =?utf-8?B?YzNIb3FuTkd3VERNU0puTjQzYzRiZVREWVNnQmNOOXg4b2dRN1JieWlFU3Rt?=
 =?utf-8?B?U0JkSUhBcmFpVmpLVzNVQ0xnN3FrakFjMzYxQ1FYNEdIOFhrYndXcllXY3Ba?=
 =?utf-8?B?UGlQTGIrQlZYbTRvRGZVQk55VDZXZ1llc0VteVpJOXVub3o4N1NOb3ZjdXg2?=
 =?utf-8?B?YW90MGE0SXp3aWVUUTBZMGRVL0lxOEZHQlJHUk1vNEswa25aV0NqY25TK1k4?=
 =?utf-8?B?THJWQWRucmdNYmxweHQ0SHlPTk04QWNjL0txQzd0Wm1yQWZ6TjZQNklJQVB5?=
 =?utf-8?B?U0paVmRQZG5DVmhsbGtObGN6NWtYR3krRlYvdXRpMUNvVkdMN3NveERSRmZ4?=
 =?utf-8?B?YzZvMEM2dStqcmNWQ2xGMTlSZDhUc0V0Vnp2Ykw1VEFyaWVxZ1g1R1M1Ryt0?=
 =?utf-8?B?Vkwxb1hNOGZHZFpCWlpzUWNDMHlZTFoyb21ja3ljeUNraEV0TTJRbmp0QTIv?=
 =?utf-8?B?aGRnNGNDbnFKOEZRSHlOZml6MWQzaEdaSkxHdGZBdExleEVMVGtwdmt4NFZE?=
 =?utf-8?B?VmpOVUI5MHdycUdLU1hwSXUzT1ZWeXJzUExuWnREQ3RQTTI1am1BSlZzZm5Z?=
 =?utf-8?B?QnN5aFZTV01qZmZQcDBVS2JUdDhIa2h5NU4yUU1TUnhCN0ZJYmFuN2oxZTN6?=
 =?utf-8?B?L1VUZ3VSOFcwMEltVEJJY2ozUGZjUHVlV29FSi9pcU9TYlcvUEZmY1k4OU94?=
 =?utf-8?B?WndmdzdZRUdFdndlUzB5REUxY2xuT1BWNkRLN1ExRS92T21zVHR4eWNPU3Fx?=
 =?utf-8?B?MExLUFZXK1Q4K2xBWVBUVkF1Z25yT1NUekxKeEVTbjZJU21wakRiZ0p6ZXVY?=
 =?utf-8?B?NWJjdWgrRlFlZjNudzJxTXlRSk1BdG0yM3BWdWhlTlA0NTZZR282aU5UbVlL?=
 =?utf-8?B?N0JBWjBaQWVkV1A2NnFpSFYyUVhjTXRnNmtiWWhRSlE3SVJkbDQzYStldUlK?=
 =?utf-8?B?Uk9wcGdHU0VmRWQrc2lCMzlUcWdZRDF2ZCs2THVhakloNEJYZ1N4RVlpdGFu?=
 =?utf-8?B?cTcvU2czNEdES1BIdlNRZkg0SExoMmVCdTRtc296ZTQ5MFJka3N0QXpYeXJ6?=
 =?utf-8?B?V0xkMjNHcHpldi9QbWsvYzlSbjZPeG5ESllQME00bmlxc0pWK3JMYWNNeXhY?=
 =?utf-8?B?ajRualNibXY4dVdDM1BBWFhEbVpqNjRKRko4SWk5bk5KSUF0K0FYTmY1UWl3?=
 =?utf-8?B?cGE1SWV1U3B3L29LWENJUitzNUJHeldEcEo1bTZTb2Rmemg0bG9kSmZlbUlX?=
 =?utf-8?B?QUJaWEJJZk9SUC9GckppV2FSTG9pdzhoaHNaWHd6dTMwRDJIVkt0RE9rbFNO?=
 =?utf-8?B?VTljVUc4ekh4VEQwTkZpN2cvZTJ6ZFJZd1VYMldJclBHVHFxMGp5UWxBbjg4?=
 =?utf-8?B?ajZIQkV1ZXVucFpHeUllL1J3QzV4R0k1OHlOWU9lRUlKS0ZtZVpjcDhNcnJr?=
 =?utf-8?B?WWtnL0xvRmk3eVlYSUtxbnMvc2k2UHN5ZDNxOXlSOWJ0VDY0T2U5UlRhTzMv?=
 =?utf-8?B?aHVTNitraGFKb0EwTHJYdDFsQjBocXFPRENUZk16MFNTdEM5NXlXbk9nU0Zs?=
 =?utf-8?B?U1pCdmlJUW1Vd2EvT04yZ3E3OUQzZzV2bFlIVmtDK0tGK2JOUlFRaEhXS2JM?=
 =?utf-8?B?RHZjUzYyVXNUTnJFYmppMG1uNHkyaFVlNDBWcWozTWNBRkhCWElMUExCcmk5?=
 =?utf-8?B?ekE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef53cc62-3741-48b3-5983-08dd706548f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 15:04:07.3726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i46iopTfgzECUkj8jkntqRUc+gYKaxz3r80Wv14kb2YNLrfWO2pR3kK/v3lGM6X71PtJABtFBIG/Bzj0Y4D3OwK7h9EF+cMM/Xjfiaa3ZUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14418

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMzEgTWFy
Y2ggMjAyNSAxNTo0NA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDExLzE3XSBkcm06IHJlbmVzYXM6
IHJ6LWR1OiBtaXBpX2RzaTogQWRkIE9GIGRhdGEgc3VwcG9ydA0KPiANCj4gSGkgQmlqdSwNCj4g
DQo+IE9uIE1vbiwgTWFyIDMxLCAyMDI1IGF0IDM6MTTigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IExhZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIu
Y3NlbmdnQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IDMxIE1hcmNoIDIwMjUgMTQ6NTkNCj4gPiA+
IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiBDYzogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IEFuZHJ6ZWogSGFqZGEN
Cj4gPiA+IDxhbmRyemVqLmhhamRhQGludGVsLmNvbT47IE5laWwgQXJtc3Ryb25nDQo+ID4gPiA8
bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz47IFJvYmVydCBGb3NzIDxyZm9zc0BrZXJuZWwub3Jn
PjsNCj4gPiA+IGxhdXJlbnQucGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT47IEpvbmFzIEthcmxtYW4NCj4gPiA+IDxqb25hc0Brd2lib28uc2U+OyBKZXJuZWogU2ty
YWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPjsgRGF2aWQNCj4gPiA+IEFpcmxpZSA8YWly
bGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+OyBNYWFydGVu
DQo+ID4gPiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT47IE1h
eGltZSBSaXBhcmQNCj4gPiA+IDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IFJvYg0KPiA+ID4gSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsNCj4gPiA+IENv
bm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IE1hdXJvIENhcnZhbGhvIENoZWhhYg0K
PiA+ID4gPG1jaGVoYWJAa2VybmVsLm9yZz47IEtpZXJhbiBCaW5naGFtDQo+ID4gPiA8a2llcmFu
LmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPjsgU3RlcGhlbiBCb3lkDQo+ID4gPiA8
c2JveWRAa2VybmVsLm9yZz47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+
Ow0KPiA+ID4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7DQo+ID4gPiBsaW51eC1yZW5lc2FzLSBzb2NAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBsaW51eC1jbGtAdmdlci5rZXJuZWwub3Jn
OyBGYWJyaXppbyBDYXN0cm8NCj4gPiA+IDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+
OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQNCj4gPiA+IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpA
YnAucmVuZXNhcy5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDExLzE3XSBkcm06IHJl
bmVzYXM6IHJ6LWR1OiBtaXBpX2RzaTogQWRkIE9GDQo+ID4gPiBkYXRhIHN1cHBvcnQNCj4gPiA+
DQo+ID4gPiBIaSBCaWp1LA0KPiA+ID4NCj4gPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4N
Cj4gPiA+DQo+ID4gPiBPbiBNb24sIE1hciAzMSwgMjAyNSBhdCAxOjM44oCvUE0gQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gSGkg
UHJhYmhha2FyLA0KPiA+ID4gPg0KPiA+ID4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4NCj4gPiA+
ID4NCj4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+IEZyb206
IFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+DQo+ID4gPiA+ID4gU2VudDog
MzAgTWFyY2ggMjAyNSAyMjowNw0KPiA+ID4gPiA+IFN1YmplY3Q6IFtQQVRDSCAxMS8xN10gZHJt
OiByZW5lc2FzOiByei1kdTogbWlwaV9kc2k6IEFkZCBPRg0KPiA+ID4gPiA+IGRhdGEgc3VwcG9y
dA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1h
aGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSW4gcHJl
cGFyYXRpb24gZm9yIGFkZGluZyBzdXBwb3J0IGZvciB0aGUgUmVuZXNhcyBSWi9WMkgoUCkgU29D
LA0KPiA+ID4gPiA+IHRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG1lY2hhbmlzbSB0byBwYXNzIFNv
Qy1zcGVjaWZpYw0KPiA+ID4gPiA+IGluZm9ybWF0aW9uIHZpYSBPRiBkYXRhIGluIHRoZSBEU0kg
ZHJpdmVyLiBUaGlzIGVuYWJsZXMgdGhlDQo+ID4gPiA+ID4gZHJpdmVyIHRvIGFkYXB0IGR5bmFt
aWNhbGx5IHRvIHZhcmlvdXMgU29DLQ0KPiA+ID4gc3BlY2lmaWMgcmVxdWlyZW1lbnRzIHdpdGhv
dXQgaGFyZGNvZGluZyBjb25maWd1cmF0aW9ucy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoZSBN
SVBJIERTSSBpbnRlcmZhY2Ugb24gdGhlIFJaL1YySChQKSBTb0MgaXMgbmVhcmx5IGlkZW50aWNh
bA0KPiA+ID4gPiA+IHRvIHRoZSBvbmUgb24gdGhlIFJaL0cyTCBTb0MuIFdoaWxlIHRoZSBMSU5L
IHJlZ2lzdGVycyBhcmUNCj4gPiA+ID4gPiBzaGFyZWQgYmV0d2VlbiB0aGUgdHdvIFNvQ3MsIHRo
ZSBELVBIWSByZWdpc3RlcnMgZGlmZmVyLiBBbHNvDQo+ID4gPiA+ID4gdGhlIFZDTEsgcmFuZ2Ug
ZGlmZmVycyBvbiBib3RoIHRoZXNlIFNvQ3MuIFRvIGFjY29tbW9kYXRlIHRoZXNlDQo+ID4gPiA+
ID4gZGlmZmVyZW5jZXMgYHN0cnVjdCByemcybF9taXBpX2RzaV9od19pbmZvYA0KPiA+ID4gaXMg
aW50cm9kdWNlZCBhbmQgYXMgbm93IHBhc3NlZCBhcyBPRiBkYXRhLg0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4gVGhlc2UgY2hhbmdlcyBsYXkgdGhlIGdyb3VuZHdvcmsgZm9yIHRoZSB1cGNvbWluZyBS
Wi9WMkgoUCkgU29DDQo+ID4gPiA+ID4gc3VwcG9ydCBieSBhbGxvd2luZyBTb0Mtc3BlY2lmaWMg
ZGF0YSB0byBiZSBwYXNzZWQgdGhyb3VnaCBPRi4NCj4gPiA+ID4gPg0KPiA+ID4gPHNuaXA+DQo+
ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICAgICAgIHJldCA9IGRybV9vZl9nZXRfZGF0YV9sYW5lc19j
b3VudF9lcChkc2ktPmRldi0+b2Zfbm9kZSwgMSwgMCwgMSwgNCk7DQo+ID4gPiA+ID4gICAgICAg
aWYgKHJldCA8IDApDQo+ID4gPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9i
ZShkc2ktPmRldiwgcmV0LCBAQCAtNzI5LDEwDQo+ID4gPiA+ID4gKzc1MCwxMiBAQCBzdGF0aWMg
aW50IHJ6ZzJsX21pcGlfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ID4gPiA+ID4gICAgICAgaWYgKElTX0VSUihkc2ktPnZjbGspKQ0KPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgcmV0dXJuIFBUUl9FUlIoZHNpLT52Y2xrKTsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IC0g
ICAgIGRzaS0+cnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKGRzaS0+ZGV2
LCAicnN0Iik7DQo+ID4gPiA+ID4gLSAgICAgaWYgKElTX0VSUihkc2ktPnJzdGMpKQ0KPiA+ID4g
PiA+IC0gICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZHNpLT5kZXYsIFBUUl9FUlIo
ZHNpLT5yc3RjKSwNCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJmYWlsZWQgdG8gZ2V0IHJzdFxuIik7DQo+ID4gPiA+ID4gKyAgICAgaWYgKGRzaS0+aW5mby0+
aGFzX2RwaHlfcnN0Yykgew0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgZHNpLT5yc3RjID0NCj4g
PiA+ID4gPiArIGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKGRzaS0+ZGV2LA0KPiA+
ID4gPiA+ICsgInJzdCIpOw0KPiA+ID4gPg0KPiA+ID4gPiBNYXliZSB1c2UgZGV2bV9yZXNldF9j
b250cm9sX2dldF9vcHRpb25hbF9leGNsdXNpdmUgYnkgZHJvcHBpbmcgaGFzX2RwaHlfcnN0Yy4N
Cj4gPiA+ID4NCj4gPiA+IEFzIHRoZSBkdGJzX2NoZWNrIGRvZXNuJ3QgZW5mb3JjZSB0aGlzLCAg
YGhhc19kcGh5X3JzdGNgIGZsYWcgd2FzDQo+ID4gPiBhZGRlZC4gUmVjZW50bHkgdGhlIHNhbWUg
d2FzIGRvbmUgZm9yIHRoZSBDUlUgWzBdIGJhc2VkIG9uIHRoZSByZWNlbnQgY29tbWVudCByZWNl
aXZlZC4NCj4gPiA+DQo+ID4NCj4gPiBSWi9WMkggaGFzICJhcnN0IiBhbmQgInByc3QiLiBTbywg
SWYgeW91IGFkZCAicnN0IiBmb3IgUlovVjJIIHRoZW4geW91IHNob3VsZCBnZXQgZHRicyB3YXJu
aW5nLA0KPiByaWdodD8NCj4gPg0KPiBObyB3ZSBkb250IFswXSwgbm90ZSBEVCBiaW5kaW5nIGlz
IHdyaXR0ZW4gYmFzZWQgb24gdGhlIHJlY2VudCBmZWVkYmFjayByZWNlaXZlZC4NCg0KVGhhdCBp
cyBzdHJhbmdlLiBJdCBpcyB0cmlnZ2VyaW5nIHdhcm5pbmcgZm9yIG1lLCBpZiBJIGp1c3QgdXBk
YXRlIHRoZSBleGFtcGxlLg0KDQoJZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGRzaS55YW1sIw0KL2hvbWUvYmlqdS9y
emczZS1saW51eC1yZW5lc2FzL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9yZW5lc2FzLGRzaS5leGFtcGxlLmR0YjogZHNpQDEwODUwMDAwOiByZXNldC1u
YW1lczogWydyc3QnLCAnYXJzdCcsICdwcnN0J10gaXMgdG9vIGxvbmcNCglmcm9tIHNjaGVtYSAk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMs
ZHNpLnlhbWwjDQoNCg0KWzFdDQogICAgIGRzaTA6IGRzaUAxMDg1MDAwMCB7DQotICAgICAgICBj
b21wYXRpYmxlID0gInJlbmVzYXMscjlhMDdnMDQ0LW1pcGktZHNpIiwgInJlbmVzYXMscnpnMmwt
bWlwaS1kc2kiOw0KKyAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA5ZzA1Ny1taXBp
LWRzaSI7DQogICAgICAgICByZWcgPSA8MHgxMDg1MDAwMCAweDIwMDAwPjsNCiAgICAgICAgIGlu
dGVycnVwdHMgPSA8R0lDX1NQSSAxNDIgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQogICAgICAgICAg
ICAgICAgICAgICAgPEdJQ19TUEkgMTQzIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KQEAgLTIwNSwx
MiArMjA1LDExIEBAIGV4YW1wbGVzOg0KICAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gInNlcTAi
LCAic2VxMSIsICJ2aW4xIiwgInJjdiIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAiZmVy
ciIsICJwcGkiLCAiZGVidWciOw0KICAgICAgICAgY2xvY2tzID0gPCZjcGcgQ1BHX01PRCBSOUEw
N0cwNDRfTUlQSV9EU0lfUExMQ0xLPiwNCi0gICAgICAgICAgICAgICAgIDwmY3BnIENQR19NT0Qg
UjlBMDdHMDQ0X01JUElfRFNJX1NZU0NMSz4sDQogICAgICAgICAgICAgICAgICA8JmNwZyBDUEdf
TU9EIFI5QTA3RzA0NF9NSVBJX0RTSV9BQ0xLPiwNCiAgICAgICAgICAgICAgICAgIDwmY3BnIENQ
R19NT0QgUjlBMDdHMDQ0X01JUElfRFNJX1BDTEs+LA0KICAgICAgICAgICAgICAgICAgPCZjcGcg
Q1BHX01PRCBSOUEwN0cwNDRfTUlQSV9EU0lfVkNMSz4sDQogICAgICAgICAgICAgICAgICA8JmNw
ZyBDUEdfTU9EIFI5QTA3RzA0NF9NSVBJX0RTSV9MUENMSz47DQotICAgICAgICBjbG9jay1uYW1l
cyA9ICJwbGxjbGsiLCAic3lzY2xrIiwgImFjbGsiLCAicGNsayIsICJ2Y2xrIiwgImxwY2xrIjsN
CisgICAgICAgIGNsb2NrLW5hbWVzID0gInBsbGNsayIsICJhY2xrIiwgInBjbGsiLCAidmNsayIs
ICJscGNsayI7DQogICAgICAgIHJlc2V0cyA9IDwmY3BnIFI5QTA3RzA0NF9NSVBJX0RTSV9DTU5f
UlNUQj4sDQogICAgICAgICAgICAgICAgIDwmY3BnIFI5QTA3RzA0NF9NSVBJX0RTSV9BUkVTRVRf
Tj4sDQogICAgICAgICAgICAgICAgIDwmY3BnIFI5QTA3RzA0NF9NSVBJX0RTSV9QUkVTRVRfTj47
DQogICAgICAgIHJlc2V0LW5hbWVzID0gInJzdCIsICJhcnN0IiwgInByc3QiOw0KDQpDaGVlcnMs
DQpCaWp1DQo+IA0KPiBbMF0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xp
bnV4LXJlbmVzYXMtc29jL3BhdGNoLzIwMjUwMzMwMjEwNzE3LjQ2MDgwLTctDQo+IHByYWJoYWth
ci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbS8NCj4gDQo+IENoZWVycywNCj4gUHJhYmhh
a2FyDQo=

