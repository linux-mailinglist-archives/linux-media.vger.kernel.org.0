Return-Path: <linux-media+bounces-29097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71427A773D6
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 07:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B524167D5C
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 05:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210561D7985;
	Tue,  1 Apr 2025 05:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sw7kuUyy"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011018.outbound.protection.outlook.com [52.101.125.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA4117588;
	Tue,  1 Apr 2025 05:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743485019; cv=fail; b=scEEYDw6JnBUxbuqrrHasQ1mMOZO8yZV31kGtlS+GmBocAx/OfKT9La0KZ0qOHgEP70hK2k+lbkkPbGprlye+tMmN8c3yVSn3rBZE07nS4IyhgLFBenB9sVfx/8dk87iMBu+Ah4HQlC5Moyf7bl7nuPmoMXW4FiEQzB9pY0BHII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743485019; c=relaxed/simple;
	bh=gldIXmgW+k4upGLRqPteiPmKRWEJUzo6+7IsCJKGx50=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tjrcKFlELB8WF/1K4fy0PHLFVMRZGZEaCPq2QERVSkTG+tEcz/Tmb/m41o4gpcq0F0VmFELc+Cxn1N0O4byUixLcZljjBYl9vzahrIk+CPtm/4jxKewIVke8K501iS1n90/n7c1lXu50YOx9vOwlrdZHyeIX2127PligTK5qBns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sw7kuUyy; arc=fail smtp.client-ip=52.101.125.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EleFIhLrZ02apcGU7UqaToM0uTFTU5wyqHZlVg2DJOcl5cYJs+SAq9EEkTdlfNeqdsYYtuQQsi37U8rz0vEHtGEYVhRX+pZa8Fg2xgMF2jHfbglO0TbLXOVXMnQw2K0BloPULxb4B1sWyBFvVaOm2wqAyktAVd7MoIOvBnXMAngOxNwqasILl3mWtYh5VbUJ+/ZtI+9SbVdr8AD/d6krwqGycYtUlrehfAEapMug8b4en11kME64jd/IUmsp7XoukbK5Urxw7vAgKYpa743P1+ql96qIfgMNEA8eh/mIsBCImzsEzQXZMyY1CY4dNR4uJWx9MEaCzhKv5jZm1kYIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gldIXmgW+k4upGLRqPteiPmKRWEJUzo6+7IsCJKGx50=;
 b=S1TiCumnXb0oTSUVCqGj2Wbb2us3OmJPW00N87OmbBMgV1XohBkZhdZ9dyadO61F/lOLis0z81xcih/CEEE3DjUSKz8YCcjR/gkrCfEgeqQv/ZSXDFHzOkP5SiheoKWK2HhtooqEssdS7HVS/wuRa3mBLzLTf6ioPCZBqzNkdQcHCUadzF7aWuYVx3dWjnvDMmgwLjC0ZULhbQcg4bVGFGJspZwP4IjjNRHQ5amRuJbZuvbmBVSy1+Ne0YsWAyWcFFLl5GoDr4ibOmv9UIs6yvWdfxCBrnt7neg9jCza19slxkSU1typE/zqaYMyu4cwgL7zKRq/4N2WamHJUMZobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gldIXmgW+k4upGLRqPteiPmKRWEJUzo6+7IsCJKGx50=;
 b=sw7kuUyy/RR7J51Z+xuvDPCzFv34PIuFRG+2eB+83vO1OsYUEXxu1RIlT0QLQFfS/LnGbA0A9ORaPRoqpcCiSvyjwkBCJ2rS5QYevKQaiZZWeei+L5aGcdB/9+bUq2J0V1gOp9oPVsnunTU3ppUUZnSMVi6pl9tbUrTQ0ShK36Q=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB8664.jpnprd01.prod.outlook.com (2603:1096:604:184::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Tue, 1 Apr
 2025 05:23:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.038; Tue, 1 Apr 2025
 05:23:23 +0000
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
Thread-Index:
 AQHbobffKVZaNpzzt0OUbkVl0xBRjrONLy9wgAAXaoCAAANnEIAACUcAgAAApbCAAAtvAIAA6JeA
Date: Tue, 1 Apr 2025 05:23:23 +0000
Message-ID:
 <TY3PR01MB113468BC5564207D6DE745B1486AC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250330210717.46080-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113463B37FE6B1AAE8CF0F51F86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v0K_tWA=LnyHDptoBjtgPHSbgwpJp4L1rw4Uv6KC+-JA@mail.gmail.com>
 <TYCPR01MB11332F548F3770F0C70C9051A86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CA+V-a8tVQaDBzLXVJUonmV6eW3i_KLTTjVm3L0Kf2A1xrMoUHQ@mail.gmail.com>
 <TYCPR01MB11332EB9F2552938B490E62F886AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CA+V-a8uh-LUmLEs_85dXwuiYecJTyLt3zd06vyGE749Ye+9moQ@mail.gmail.com>
In-Reply-To:
 <CA+V-a8uh-LUmLEs_85dXwuiYecJTyLt3zd06vyGE749Ye+9moQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB8664:EE_
x-ms-office365-filtering-correlation-id: 28f6ebea-11c1-4e76-4aad-08dd70dd52e2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?THJXV004RFZUTzNLMDF6S2tZY2VVSlMzeHZJOTVzUG1WTGJpL2tFL1NPdjdr?=
 =?utf-8?B?NlRkQXpSQmYydWgxYnRZM2VSbzhMQTNaQ0RQWWI1REFJRnhpMXBnMy9aNk5p?=
 =?utf-8?B?SjRvOEN1d1B0Uzk2K1k0MHZ5MkQrb2FqM3JiSlhDZHJ5L29ZMkhlaDY1UTRE?=
 =?utf-8?B?VVVTbUsxWUU1YXIyY09hbi9Tclg4T0MyUW9vVk5UbDZPQnV3Sk50cTlBdG1q?=
 =?utf-8?B?Y2JFOEVDNFMwSzVCZjJ5MWk3dTV1dFNWd3NqYnYrTHVzdlRrNHdRblBSN3dw?=
 =?utf-8?B?dGRCdnFZaThHdXVISGpLSWh4a282bjFVYTQwQkU5N0lJZFlJbnNFVEIzcTBs?=
 =?utf-8?B?bERPQ2oxTU9FL3d1aWNYdjdmU2Y2TXlwNzY3U1RHTnBMZjJOREZ6RUJveUsv?=
 =?utf-8?B?QWtVQ3ZLQVUwNEpjUG9kbitLN2wrckFGcXhoMFdMTGF4c3lkQkpZTDdtVWMv?=
 =?utf-8?B?cVBmTWR0S1FvTHhOZC9NUXJ5MzdXZFM4cFltaHFJNWRleDgvUGxCRlhzTkM5?=
 =?utf-8?B?UW1OUlIwbUU3QTZ4UFJMMzVNUHJaVFlvbWFrUHIzRWNzcTFxWFJMdEwrbThZ?=
 =?utf-8?B?YWZrMS9lU3FJRUo1NjNodTZoeTZSUTRuUHpScm5FZlIyZEJuQ0ZBRVZrRjQ0?=
 =?utf-8?B?UmR4d0pWdk03Rms0Ym9uMmU5ZVRCOHpMTkhkVGJSSVpEQkNpbUFNZ2tvckRw?=
 =?utf-8?B?SWU1SE1uay9tNjNIWmJwS1lOdjVtdFQvOEg3SEhyNUdSTkZwWS9GYktWeWVt?=
 =?utf-8?B?VjVPbTl0VmJuazUwdGFLYUp3V0xDaU9BTjFiazVCMjdiYjY3eDJyc2ZuQ3Iy?=
 =?utf-8?B?N0puZXcyMkc3aGM5c1dzVEJFK1p1MmxlMjlOa1hsbFU5YXErak83cEY3ZTR1?=
 =?utf-8?B?Ni9HSEdEUWY5bWdjNXYzc2JsbzB0bFNKdTN2VnpneW5sRFFZTm90aU41Nm4x?=
 =?utf-8?B?S2FzdnBiakRGRTVEWTV3Zjl4OWdFaHNYcnplVHNVWHBQaWpJcW9SZU5TTUxW?=
 =?utf-8?B?SGN1MXlId09uOEFlZ0hYeTBnRTZjb29FMW5DbG9GZTZLTkpCdFdoaEFERk9N?=
 =?utf-8?B?RmMvckhhUmFyTGVTeXcwUnF4VjhlN0ZBdlBzNlJBcnp2Yk1BTStxVkE1L1BI?=
 =?utf-8?B?VWxhZUJ6SERkeVFVMnpEazN6UTdrY1htcnJNMmxNNnBoMTBkeDBsSmZVKzhH?=
 =?utf-8?B?dVB5aEw4Z1llNWpDTTZEMWNmYnVPdEVGSWxhcFlFK3lNL2NvUlEwejZQdzdw?=
 =?utf-8?B?SlAwU1JuczZUWnNTZDFCSE5uQWRDeUhIOEl0akRiWHNrMDVNR0lnR2dJMlcy?=
 =?utf-8?B?SnFvL2d6MDBJLzlxQmttWVpQaWNsbXIrU0FOc2FKU3NRWFJzTnV5R3J6dWxR?=
 =?utf-8?B?Uk5hOFhZbG0zK0xRNXVXN2M2R0F4M2tnYlkzeW40ZGhGWTRJTkhjckU1Ymxj?=
 =?utf-8?B?V3hLTFNjNGl3SURBR2hDVnB4RHJPZGVRbXVOY1gwZk92Zk8yWVpGWUZqRkhx?=
 =?utf-8?B?cDVGUnZ1OHdoUVI3ZFFvdmJDbjgzWW5oT3VCRkZTSlhmMXMrMXhRblY1SG04?=
 =?utf-8?B?M0g0ZDFGemZLNlljKzRJeDh3Y3NDL2g2R0Q4UXdVTmlnc0xndkZmNWhkZHpo?=
 =?utf-8?B?MWdDZzM3WVVOdWw3d2E3TkIwcktqUG1CU2VjUE92SVBTbVdYRXpWTnd3SStT?=
 =?utf-8?B?eDhkd2Z4MDQ0N0ZIZ0RReUptaEVRRXAvc1R0SGRZb09tK0puT0Y3MVUzbjFE?=
 =?utf-8?B?cDdybkVxaW1BOTBoc1I5RThKbXUvZDZadzVGMzdKU1FmeUVPaG44V0tsNE9m?=
 =?utf-8?B?cEpvb01EVWRCL1hOZ1V4UXo3UTJodko4NkZ3akxvSXVLdTBoajBkYkNpTE9r?=
 =?utf-8?B?eDE5eWNYdW9NN0I1NHR0TmNKR2o5Z0tqbDBMNCtYeDNIZUFCSUNuL00yZW01?=
 =?utf-8?Q?V1yn/EIZogZ+/tRZ5HtrN2BlLbIFozzQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NE5IaWM4dCs4U3lFb3BQRnZ4eC90VURIbGJXakZKYkFlc3M4WU80Q2dqb0FK?=
 =?utf-8?B?R2ZMSjFOVWxlTzZNZDRhQUFSTGtoMmtCUVBtVmp4eTBKdzFyeXlqc3NmK2pm?=
 =?utf-8?B?QXFheFgzbFZua2djRGlSUGFsR0tVTDhKNXJaOVg5RGxGbnZCQmJuVkxaQzZi?=
 =?utf-8?B?V01JMytlUWllZFpsRHBFdDRpdW1Yam5XRWVHWUpHL0NEREYrS2Rscnpib3Ux?=
 =?utf-8?B?RVNpWEZHZGdrK3BCeWdKZitybzMvZkRhYzRRdkwxRHNxMU1uckpLWHp1Nllx?=
 =?utf-8?B?a1dmSVNhOWEzb2ZFQWZleUdWTGtFd0VUYittZ0pLK2dnZCtpaG5WUlhLdnJj?=
 =?utf-8?B?eWRKcGdnd2duZE1ydlJoUlpoSUkxeithT05zQlo4TzR6Rm5iRzc2bzdQNVF5?=
 =?utf-8?B?aTByck0vUENTdTlxcmhWVDdUVHlFaGE0Wm13eHVnWjFHTnFKZTNJQUlaUDJH?=
 =?utf-8?B?OXRDTWV1ZEdSUWp0ZUJROW5wQTJJQU1KMWF1Vi9wU2ZjZitBUzhzaXVUWllo?=
 =?utf-8?B?Q0NHMjNXTkppRTV6b0NFSWx2L2hwU1VBbHVtY1p0STdWZGl3aUhOR1lUU1Nh?=
 =?utf-8?B?dlVqY0twWTB6ZUQ5b1VGbWl0bWhHaUJXRDhSME9YVFhPakhuSnlCS2hlaXJh?=
 =?utf-8?B?Zm1qS3JsaDlSbU9tT21jY3dReTZuREVXMWZSemJneXhhRVJmTW0wTVE1YmdE?=
 =?utf-8?B?THhMeTR0aEhaM0JIcXhsbU56bzRxdmFpdHJVNUtFeG9qT2Y3RUptdmtaOXli?=
 =?utf-8?B?QldHcVB5OUlISzMxK3U2dFN5SzVwRzRtZ0Y5QWV0bzNJd2IzQTV1eFF0MEFJ?=
 =?utf-8?B?WTd2Vy81bS90S3RDNTIzWDkvTGhOOHZEOXorbUlVeFJuT0gzdzFPaExxTnpP?=
 =?utf-8?B?S2RYNUtTQnhTcm4xV3NOcGhFblBGL2hORm4rOW1QUGYxeFZrMmdTUjF4MEtI?=
 =?utf-8?B?RzQ1ZCtKTk1nUDUzLzRqSSs3c3RJaXlwbHo0eGNBbzNSSDRiQU1mRGlLVUZn?=
 =?utf-8?B?WUFqUU5nRXVvbWdxY0lITmNSd1c2a2k1VjA1SDh2bjhqeENLdXU0WUx5Lzcv?=
 =?utf-8?B?eVJYY3JoMFo5UjJpM2luTU9rSGRDTEowZkMzcDNFZGpuV0YwQkNvSUU0aTBJ?=
 =?utf-8?B?QUt4UHRISkwrN2x2TkUxZzc3am1ua214alJWMkdyNkhkd2grbUVGQnR1ZWxn?=
 =?utf-8?B?enlNZ3Y5anVTSlhPeUVrVlNRV2I1eWJEaEdoSTNrSGM3azdoc3BScUpvSlRv?=
 =?utf-8?B?ZnFUSjMwSlVhK2NWclQ0SktUOTl5bG5VMlVLYTZpeGhLbWNabUg1QStwU0RY?=
 =?utf-8?B?YlpzOFBVbnpMU3gwVFBCdjJQejlXcEhYcy8xanJOSS9ZMjNXU0o3YVBidE45?=
 =?utf-8?B?UEhHYWRqUzdyQzVKUjlKUWpIN1hLNS9EMEVpSW9TczJBcnZEaGU4N3FSTm9Q?=
 =?utf-8?B?Z1dORitNNkN5MVRFREJJRnhmU0RuZlJEc2c4OUVYQUoyZS84cXk1aTVzYTBG?=
 =?utf-8?B?UktiTHc4Y2NGVjdZOGhwNThOcUZFSXM5Qm14YmlqUUJHNzkvUVp3TjlIQmRl?=
 =?utf-8?B?QktnTGFjNGIwWjd5RzkrME9Pd3ErNktyRzhzbEFieUxXVk41TDAwNHRQbkVI?=
 =?utf-8?B?WVdLdjIwWnJteDN5aW02bzNNL2RHcXhCWVB0b2RDdWl0UWxTM0p0YlBMR3V4?=
 =?utf-8?B?aGh3bTFoYXhGVjcxU1RoU2xKU0d4TksvZ1V3bldValYyQkNCcnJDd3V2RU9Y?=
 =?utf-8?B?OFV4SG5PS1J5dWlSUlNEdDE4d2EwWXphUVQ5K21GZC9xNWxSckI3R0lBVzVL?=
 =?utf-8?B?ajdJS0hpMW5kK0RxVzdyakVSNFo5Y1ppQ2Q1Y0FrclJLdXErVkQrbHFpYzNI?=
 =?utf-8?B?NkZmT2RPcVRpbHdtaE9oY0xlLzJaSENndWhZd3dPMUVPQXNUWlZxS0huU1Ez?=
 =?utf-8?B?MzNTM3JIR1NBd1llTUs4S2IrZldaVFo5YVlka2RhM1dTWVVlNzdvNjdQNHhI?=
 =?utf-8?B?bVNvV1I5ZnBIMGFGWmdkaENMUmQxUENqY3VEd3lmY0drbFI2MnduMURndUox?=
 =?utf-8?B?M3ZQdnVXTkJleGYyZ1pUZ3REYUw4NnNEdHRCSGR6bzRpV0ZPZktGUEJnMjRR?=
 =?utf-8?B?a3ZjUXBKNXpsK0JleWFBNXdyTmNFMmhqTjBYZFZFUWZBU0pLeVdmZDRzTnpN?=
 =?utf-8?B?MWc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f6ebea-11c1-4e76-4aad-08dd70dd52e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 05:23:23.6526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CcNj5jAKGmsaTKj6YZ8Uk7KxH91HwWtsCfC2PRlS8G2A8faMDO5zqlJQTp3ERnIno4AcTqH/F7k7xFIsyo1WWImjyCvpdLLfOlAi9aQK38Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8664

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMzEgTWFy
Y2ggMjAyNSAxNjoyNw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDExLzE3XSBkcm06IHJlbmVzYXM6
IHJ6LWR1OiBtaXBpX2RzaTogQWRkIE9GIGRhdGEgc3VwcG9ydA0KPiANCj4gSGkgQmlqdSwNCj4g
DQo+IE9uIE1vbiwgTWFyIDMxLCAyMDI1IGF0IDQ6MDTigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgUHJhYmhha2FyLA0KPiA+DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogTGFkLCBQcmFiaGFr
YXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiA+ID4gU2VudDogMzEgTWFyY2ggMjAy
NSAxNTo0NA0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAxMS8xN10gZHJtOiByZW5lc2FzOiBy
ei1kdTogbWlwaV9kc2k6IEFkZCBPRg0KPiA+ID4gZGF0YSBzdXBwb3J0DQo+ID4gPg0KPiA+ID4g
SGkgQmlqdSwNCj4gPiA+DQo+ID4gPiBPbiBNb24sIE1hciAzMSwgMjAyNSBhdCAzOjE04oCvUE0g
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4g
PiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
ID4gPiA+IEZyb206IExhZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4N
Cj4gPiA+ID4gPiBTZW50OiAzMSBNYXJjaCAyMDI1IDE0OjU5DQo+ID4gPiA+ID4gVG86IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiBDYzogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IEFuZHJ6ZWogSGFqZGENCj4gPiA+
ID4gPiA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+OyBOZWlsIEFybXN0cm9uZw0KPiA+ID4gPiA+
IDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsgUm9iZXJ0IEZvc3MgPHJmb3NzQGtlcm5lbC5v
cmc+Ow0KPiA+ID4gPiA+IGxhdXJlbnQucGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT47IEpvbmFzDQo+ID4gPiA+ID4gS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPjsg
SmVybmVqIFNrcmFiZWMNCj4gPiA+ID4gPiA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPjsgRGF2
aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47DQo+ID4gPiA+ID4gU2ltb25hIFZldHRlciA8
c2ltb25hQGZmd2xsLmNoPjsgTWFhcnRlbiBMYW5raG9yc3QNCj4gPiA+ID4gPiA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0KPiA+ID4gPiA+IDxtcmlw
YXJkQGtlcm5lbC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47
DQo+ID4gPiA+ID4gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3ps
b3dza2kNCj4gPiA+ID4gPiA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5IDxjb25v
citkdEBrZXJuZWwub3JnPjsgTWF1cm8NCj4gPiA+ID4gPiBDYXJ2YWxobyBDaGVoYWIgPG1jaGVo
YWJAa2VybmVsLm9yZz47IEtpZXJhbiBCaW5naGFtDQo+ID4gPiA+ID4gPGtpZXJhbi5iaW5naGFt
K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT47IFN0ZXBoZW4gQm95ZA0KPiA+ID4gPiA+IDxzYm95
ZEBrZXJuZWwub3JnPjsgUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47DQo+
ID4gPiA+ID4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7DQo+ID4gPiA+ID4gbGludXgtcmVuZXNhcy0gc29jQHZnZXIua2VybmVsLm9yZzsg
bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPiA+ID4gPiA+IGxpbnV4LWNsa0B2Z2VyLmtl
cm5lbC5vcmc7IEZhYnJpemlvIENhc3Rybw0KPiA+ID4gPiA+IDxmYWJyaXppby5jYXN0cm8uanpA
cmVuZXNhcy5jb20+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQNCj4gPiA+ID4gPiA8cHJhYmhha2Fy
Lm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMTEvMTddIGRybTogcmVuZXNhczogcnotZHU6IG1pcGlfZHNpOiBBZGQgT0YNCj4gPiA+
ID4gPiBkYXRhIHN1cHBvcnQNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEhpIEJpanUsDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuDQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiBPbiBNb24sIE1hciAzMSwgMjAyNSBhdCAxOjM44oCvUE0gQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBIaSBQ
cmFiaGFrYXIsDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2gu
DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+ID4gPiA+ID4gPiBGcm9tOiBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29t
Pg0KPiA+ID4gPiA+ID4gPiBTZW50OiAzMCBNYXJjaCAyMDI1IDIyOjA3DQo+ID4gPiA+ID4gPiA+
IFN1YmplY3Q6IFtQQVRDSCAxMS8xN10gZHJtOiByZW5lc2FzOiByei1kdTogbWlwaV9kc2k6IEFk
ZCBPRg0KPiA+ID4gPiA+ID4gPiBkYXRhIHN1cHBvcnQNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gRnJvbTogTGFkIFByYWJoYWthcg0KPiA+ID4gPiA+ID4gPiA8cHJhYmhha2FyLm1haGFk
ZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBJ
biBwcmVwYXJhdGlvbiBmb3IgYWRkaW5nIHN1cHBvcnQgZm9yIHRoZSBSZW5lc2FzIFJaL1YySChQ
KQ0KPiA+ID4gPiA+ID4gPiBTb0MsIHRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG1lY2hhbmlzbSB0
byBwYXNzIFNvQy1zcGVjaWZpYw0KPiA+ID4gPiA+ID4gPiBpbmZvcm1hdGlvbiB2aWEgT0YgZGF0
YSBpbiB0aGUgRFNJIGRyaXZlci4gVGhpcyBlbmFibGVzIHRoZQ0KPiA+ID4gPiA+ID4gPiBkcml2
ZXIgdG8gYWRhcHQgZHluYW1pY2FsbHkgdG8gdmFyaW91cyBTb0MtDQo+ID4gPiA+ID4gc3BlY2lm
aWMgcmVxdWlyZW1lbnRzIHdpdGhvdXQgaGFyZGNvZGluZyBjb25maWd1cmF0aW9ucy4NCj4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gVGhlIE1JUEkgRFNJIGludGVyZmFjZSBvbiB0aGUgUlov
VjJIKFApIFNvQyBpcyBuZWFybHkNCj4gPiA+ID4gPiA+ID4gaWRlbnRpY2FsIHRvIHRoZSBvbmUg
b24gdGhlIFJaL0cyTCBTb0MuIFdoaWxlIHRoZSBMSU5LDQo+ID4gPiA+ID4gPiA+IHJlZ2lzdGVy
cyBhcmUgc2hhcmVkIGJldHdlZW4gdGhlIHR3byBTb0NzLCB0aGUgRC1QSFkNCj4gPiA+ID4gPiA+
ID4gcmVnaXN0ZXJzIGRpZmZlci4gQWxzbyB0aGUgVkNMSyByYW5nZSBkaWZmZXJzIG9uIGJvdGgg
dGhlc2UNCj4gPiA+ID4gPiA+ID4gU29Dcy4gVG8gYWNjb21tb2RhdGUgdGhlc2UgZGlmZmVyZW5j
ZXMgYHN0cnVjdA0KPiA+ID4gPiA+ID4gPiByemcybF9taXBpX2RzaV9od19pbmZvYA0KPiA+ID4g
PiA+IGlzIGludHJvZHVjZWQgYW5kIGFzIG5vdyBwYXNzZWQgYXMgT0YgZGF0YS4NCj4gPiA+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+ID4gVGhlc2UgY2hhbmdlcyBsYXkgdGhlIGdyb3VuZHdvcmsgZm9y
IHRoZSB1cGNvbWluZyBSWi9WMkgoUCkNCj4gPiA+ID4gPiA+ID4gU29DIHN1cHBvcnQgYnkgYWxs
b3dpbmcgU29DLXNwZWNpZmljIGRhdGEgdG8gYmUgcGFzc2VkIHRocm91Z2ggT0YuDQo+ID4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPHNuaXA+DQo+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4g
ICAgICAgcmV0ID0gZHJtX29mX2dldF9kYXRhX2xhbmVzX2NvdW50X2VwKGRzaS0+ZGV2LT5vZl9u
b2RlLCAxLCAwLCAxLCA0KTsNCj4gPiA+ID4gPiA+ID4gICAgICAgaWYgKHJldCA8IDApDQo+ID4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZHNpLT5kZXYsIHJl
dCwgQEAgLTcyOSwxMA0KPiA+ID4gPiA+ID4gPiArNzUwLDEyIEBAIHN0YXRpYyBpbnQgcnpnMmxf
bWlwaV9kc2lfcHJvYmUoc3RydWN0DQo+ID4gPiA+ID4gPiA+ICtwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ID4gPiA+ID4gPiA+ICAgICAgIGlmIChJU19FUlIoZHNpLT52Y2xrKSkNCj4gPiA+ID4g
PiA+ID4gICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihkc2ktPnZjbGspOw0KPiA+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gPiAtICAgICBkc2ktPnJzdGMgPSBkZXZtX3Jlc2V0X2NvbnRyb2xf
Z2V0X2V4Y2x1c2l2ZShkc2ktPmRldiwgInJzdCIpOw0KPiA+ID4gPiA+ID4gPiAtICAgICBpZiAo
SVNfRVJSKGRzaS0+cnN0YykpDQo+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgcmV0dXJuIGRl
dl9lcnJfcHJvYmUoZHNpLT5kZXYsIFBUUl9FUlIoZHNpLT5yc3RjKSwNCj4gPiA+ID4gPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZmFpbGVkIHRvIGdldCByc3RcbiIp
Ow0KPiA+ID4gPiA+ID4gPiArICAgICBpZiAoZHNpLT5pbmZvLT5oYXNfZHBoeV9yc3RjKSB7DQo+
ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgZHNpLT5yc3RjID0NCj4gPiA+ID4gPiA+ID4gKyBk
ZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZShkc2ktPmRldiwNCj4gPiA+ID4gPiA+ID4g
KyAicnN0Iik7DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gTWF5YmUgdXNlIGRldm1fcmVzZXRf
Y29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlIGJ5IGRyb3BwaW5nIGhhc19kcGh5X3JzdGMu
DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+IEFzIHRoZSBkdGJzX2NoZWNrIGRvZXNuJ3QgZW5mb3Jj
ZSB0aGlzLCAgYGhhc19kcGh5X3JzdGNgIGZsYWcNCj4gPiA+ID4gPiB3YXMgYWRkZWQuIFJlY2Vu
dGx5IHRoZSBzYW1lIHdhcyBkb25lIGZvciB0aGUgQ1JVIFswXSBiYXNlZCBvbiB0aGUgcmVjZW50
IGNvbW1lbnQgcmVjZWl2ZWQuDQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gUlovVjJIIGhh
cyAiYXJzdCIgYW5kICJwcnN0Ii4gU28sIElmIHlvdSBhZGQgInJzdCIgZm9yIFJaL1YySCB0aGVu
DQo+ID4gPiA+IHlvdSBzaG91bGQgZ2V0IGR0YnMgd2FybmluZywNCj4gPiA+IHJpZ2h0Pw0KPiA+
ID4gPg0KPiA+ID4gTm8gd2UgZG9udCBbMF0sIG5vdGUgRFQgYmluZGluZyBpcyB3cml0dGVuIGJh
c2VkIG9uIHRoZSByZWNlbnQgZmVlZGJhY2sgcmVjZWl2ZWQuDQo+ID4NCj4gPiBUaGF0IGlzIHN0
cmFuZ2UuIEl0IGlzIHRyaWdnZXJpbmcgd2FybmluZyBmb3IgbWUsIGlmIEkganVzdCB1cGRhdGUg
dGhlIGV4YW1wbGUuDQo+ID4NCj4gQWhoIHJpZ2h0IEkgbWlzc2VkIHRoYXQuIFRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIGlzIGJhc2VkIG9uIHRoaXMgY29tbWVudCByZWNlaXZlZCBbMF0gKHNh
bWUgYmVpbmcNCj4gYXBwbGllZCBmb3IgcmVzZXQpLiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91
IHN0aWxsIHdhbnQgbWUgdG8gdXNlDQo+IGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxf
ZXhjbHVzaXZlKCkgKGFuZCBzYW1lIGZvciB0aGUgY2xrKS4NCg0KQm90aCBPSyB0byBtZS4gQXMg
RFQgYmluZGluZyB2YWxpZGF0ZXMgb3B0aW9uYWwgcmVzZXRzLCBJIHdvdWxkIGF2b2lkIHJlZHVu
ZGFudCBjaGVjayBpbg0KZHJpdmVyIGFzIGl0IGlzIGFueXdheSBsaWtlIG5vLW9wIHdpdGggb3B0
aW9uYWwgY2FsbHMuDQoNCkNoZWVycywNCkJpanUNCg0K

