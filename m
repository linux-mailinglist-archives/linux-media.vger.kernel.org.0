Return-Path: <linux-media+bounces-27090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F64A4686C
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 18:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFDA93AE058
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 17:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DAB22A1ED;
	Wed, 26 Feb 2025 17:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="GOl9Y6Yi"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2092.outbound.protection.outlook.com [40.107.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D34224AE3;
	Wed, 26 Feb 2025 17:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592265; cv=fail; b=HP/YLBwa/d4vKRaDPHAqgFuDWaw+2qmYw7npDLBrEpOpJ1UlP1Je3nr0xOYl4NsUhAFe1ynH7gvFkE29OUp4DcXSLg/Rhd+xNH/2+SL4ZYRaXu2D8e0ntoesPk4fnW48OwoLvPoVxsPR/e1LzmQMr14B8N8zYrAdJdL0UPDHTnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592265; c=relaxed/simple;
	bh=3lTxIeUcY+PUOs4FqsWtE2xciduaKwkxQoVhHG4ZCMY=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=JFiplBNIunuwnWJA5A6FgcE88eJhHGReJP3YkClIZaiaCfoRlwCXeGdbK1x5K/LRJn2VjLSi+uTnlgiWW0/wspgEle6bwSvhVqoLRW2amcyPrwKILg8K4jKOjhSR2vBSWBdHpMbQNkoJWlVo18oqKbeEE6hSP1IRx3FU041DR0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=GOl9Y6Yi; arc=fail smtp.client-ip=40.107.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=to/INBCILdo5eP9MuXyYwU/vQa3st6LNIvuoxWOMSpkEAKYdjLYABKrPT5rA7ijzMd3GrVGN2ioAXYe4HdH64unZgX4UZttUtNoBn4wmzWy/DgMAqL/qcgW2DBuh8sFP1s33h5lbYwz916MNRffPqnr18K4zJI8a2mydtVVEhOXj/0CyRtDOPkJXJEksNN7AtdFYYiBGYLSkZpMU8d1avyvfEWGS54yF3khkzp3kW1Kgssz9LCKEcgU8dXTybPLeTecPOJSuei2mV6TY4waaOx6rN5ajMxH5e9D9T4aCZDwzCx+gSSGoC8jOyvtNxusDsOu1VY37BN7atIPhSfjEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bgdk7uINQsV+4jCWFJCrf6hGSs7ExccwaZIU9onwWd8=;
 b=HtoEOZf9ulFlhGdf8AsAmWGEbTYNMCESMP+wTaQIeP5YnjD63TlDsZCzG6gzWwtg6JwCnLO0wdpklueI9YbhJGVLCPofublwMuP4ZeotZpD9yO7orTOkWLbaIK3620hO4f5rZSd4K3qa/f7mpFG07eHrEvrZQBk3aLEYjooVZ3phdkFqUYsbXZg3xZTp3VABCt8fdwCB0b7lZIqi1lve7v1/3/B14PSe8Nz0jf69fNekEXa7M6XIILsmhug1cubyvvjO/KCX3YSyil2/5xLpUyIwf16LQwEv/XU3T7Ld+79UCWzvvlE+4FB/2UY8Zi/59oOqERFi9to0ykpyz7ULgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bgdk7uINQsV+4jCWFJCrf6hGSs7ExccwaZIU9onwWd8=;
 b=GOl9Y6Yib0rFfePAG43/38DNwa9w1BanEXQNXdgoMBF3IbhR6xEtSp+VI5KsYi4yIZ61JrVdwgKPF/9zEPGXriLNv9JVExSeFoZf7XaI4N0faa/wbzz4M57t/pOLdbQ64cUmuN9S2ROrEsBiNom+01aCh7RpAEyL+hf+yq0fSx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from MN2PR14MB4207.namprd14.prod.outlook.com (2603:10b6:208:1d6::13)
 by IA1PR14MB7175.namprd14.prod.outlook.com (2603:10b6:208:44c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 17:50:59 +0000
Received: from MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7]) by MN2PR14MB4207.namprd14.prod.outlook.com
 ([fe80::1232:fdf5:3cae:d9d7%3]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 17:50:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 12:50:55 -0500
Message-Id: <D82KGJEBFQO0.1TX611HMKWB16@d3embedded.com>
From: "Sebastian LaVine" <slavine@d3embedded.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
Cc: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, "Abel Vesa" <abel.vesa@linaro.org>, "Achath
 Vaishnav" <vaishnav.a@ti.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Ard Biesheuvel"
 <ardb@kernel.org>, "Benjamin Mugnier" <benjamin.mugnier@foss.st.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, "Bjorn Andersson"
 <quic_bjorande@quicinc.com>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Elinor Montmasson"
 <elinor.montmasson@savoirfairelinux.com>, "Fabio Estevam"
 <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hans
 Verkuil" <hverkuil@xs4all.nl>, "Javier Carrasco"
 <javier.carrasco@wolfvision.net>, "Jianzhong Xu" <xuj@ti.com>, "Julien
 Massot" <julien.massot@collabora.com>, "Kieran Bingham"
 <kieran.bingham@ideasonboard.com>, "Kory Maincent"
 <kory.maincent@bootlin.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Mikhail Rudenko" <mike.rudenko@gmail.com>, "Nishanth
 Menon" <nm@ti.com>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Rob
 Herring" <robh@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>,
 "Stuart Burtner" <sburtner@d3embedded.com>, "Tero Kristo"
 <kristo@kernel.org>, "Thakkar Devarsh" <devarsht@ti.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Umang Jain"
 <umang.jain@ideasonboard.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Will Deacon" <will@kernel.org>, "Zhi Mao" <zhi.mao@mediatek.com>
Subject: Re: [PATCH 1/4] media: dt-bindings: Add Sony IMX728
X-Mailer: aerc 0.20.1
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-2-slavine@d3embedded.com>
 <20250213-shrewd-tacky-chachalaca-778a50@krzk-bin>
In-Reply-To: <20250213-shrewd-tacky-chachalaca-778a50@krzk-bin>
X-ClientProxiedBy: CH0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:610:11a::31) To MN2PR14MB4207.namprd14.prod.outlook.com
 (2603:10b6:208:1d6::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR14MB4207:EE_|IA1PR14MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 418c2b18-d82d-4a8d-d3be-08dd568e2081
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cEhlaDlJSUcwT1ExVzFoWGg2RnczT3ByNENxdVlkWTFyZ2NXY0h3N1k5cWo0?=
 =?utf-8?B?R2tHMnBlR2E3NWtZVVhYWWQ0VklFV3d2eFNmN2lSbnNJMThTYTNRUW90SEF4?=
 =?utf-8?B?WEcwVEZ3b1lnT0pJYUlvZEh3T1FkWWxEZi9td0djVGtLZWVib01aNWlCMzZU?=
 =?utf-8?B?bDlkWHNRaldCQnZScFFwQ25YQ2FLNXgza0JNckNKRCs4cUxVc3dMV0d0TFRR?=
 =?utf-8?B?UXVQMU5wNGE3ZGRJM1EzTllJSEdHK0VlMVVlVVh3Mk1PYW4rQ0UvanJSSWFC?=
 =?utf-8?B?VG1aTDkxUldXU0xOSVhFNEpxclJ3ZHZRRnEzTFVjZHFtT2tjL0tvTVg2dXlM?=
 =?utf-8?B?cTRLM3FzY1Niamx5Q2V6b01aQnV4Yk9BYmpzdVE3VHl6amJpV0cvZzNVdWNY?=
 =?utf-8?B?eUFSVEZXaEIrRzMrM2Y0Wm5odmJmMkQ2Ri9pVFhwSFF3b2xzd2gwYWZkUzEw?=
 =?utf-8?B?WDMwaENzZDRUY3BIZ0NRRXVtV2dHNDB3eHFsaHZqbS9tbC9jTVZHS3JxMFJC?=
 =?utf-8?B?Q0VYRjRKb0dudGpuTDUvN0xyV01XWDlZZm13cmpvWXNXUTNycXVqSll2ejF5?=
 =?utf-8?B?aTNyWXoxcTRacVRDMU13QWF2Sm9ScnpmOXptZ2VlaWFLQnU0OGNvYWt5Z2pn?=
 =?utf-8?B?blZVS1JYZ2V0LzBjTVM4UVBZM3hVVHAwNVRTd3ZnK2ExYVFOUnhMSllrWkFV?=
 =?utf-8?B?QXNuTUl0ZTc4djdSaG16VTlKd3lUZzRpTjBGc1Zubk9iNDVxY3lPOGJ3R3pt?=
 =?utf-8?B?SFBYcmtoUUhKQXR2THVyMUhDbE94bkNmTFh1bSs1NUgwNi8vSUluVGpLemUw?=
 =?utf-8?B?QUZnVzRiVkt3OGpqdkhuMGFHWDcxaFkyTjQ2VEwwbTNqSFd0MGdwSlI5blVv?=
 =?utf-8?B?VE1TMUtKUU1JNmJtMEJ6QlhEV1FhZVQwaVFXb0FrVnhyeHJXWE52YnB3TkpH?=
 =?utf-8?B?MnMyQnEvYzVXNTgveVB0VTJLeWg1ZTVyekx5b1hKaUlCbXI3bEN1MUJUOW56?=
 =?utf-8?B?UVhTUTBlMHdSckxpR0hob0pNVk1qTUNPZDBaUlBLVGIyYU5GY2ZIVGx6V1Ew?=
 =?utf-8?B?ZENqZFR3VTJPWk5YS3h5VHlFdm5lQjJkbXVJY1dEQjlBWnNFOHd0b2UvdGZV?=
 =?utf-8?B?K1QyNkdFYXRWd1dka21UMlNwQnZCaUdCaXdYRmkrak9uWnhzaVYvWEJ4SWpQ?=
 =?utf-8?B?SEtsNkRyNlphYW1JUnFmOFJFWnhBdkhwRXRmNkd5RVAyRXExUkZVdUVyaGUv?=
 =?utf-8?B?bHdhcmxmbW8wWk5qV1ZtMHRVbTdBcVA2MHVTZzZSK0tIeDRzSm51MTd3WVBo?=
 =?utf-8?B?djR1MEtJWXNXZWdoMlovZmtjUzVJZXoyS2RSK2pFNEtQN3dFS1NXSmJiYi8y?=
 =?utf-8?B?Z0RlVkJpc3p5YStNWjdWNkY3Q01wM3c1cmx6M3hZamtLR0Fpc05OL3dHdEpI?=
 =?utf-8?B?Nnp6Y2l2NW4xTlN0VWpYUHE3SkhiOXU0bDF5TEN4VEpyaml1NnFHUnRreWdz?=
 =?utf-8?B?T1VNZW5pNEhTMHh1dFk3NzRsTVpkY2tYcHM5eHB5cEhYbEd6Si9LKzA1RWN5?=
 =?utf-8?B?UUxNUWp1SkxYT3VXaVgrNXdlR2p6WDl6SEhvdXlNVmtQb3J2TUxCdUR1YWlP?=
 =?utf-8?B?a2EwZ2ZRVXl1MHR5RkZ4ekh1cVZnME1EcGg3dHdKOXZCeTZQRTFGdjA4bFhU?=
 =?utf-8?B?akxTbVk1L3NkTys4WWg1cHErSXlJSldTMDBpNFN0aUZ6UHV5WmpKd01YRFRu?=
 =?utf-8?B?YWgxL1pZSjR5eDlUK3o2U0owc3lXMmpjRVNtWGhEOXFnVXdSZFFFQ09hdXg4?=
 =?utf-8?B?SDZNZTZmYVkydys5WHZQaWZqa2pFRVJoUWNSbElKZVVjcSswYlovRURTeU0v?=
 =?utf-8?Q?l9De/r4X6UsoL?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR14MB4207.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YlU5WENkVmNjNWQ0RFJyVTRYWmlEbS9tMGlBZXYxZmtkM2o3ZG1pelljdlo0?=
 =?utf-8?B?RVpkYWpKd3lPVVRsR3ltRFczd0pTNlp0c3g5dzJLRkhyM3Q3NlRaMzFMckg0?=
 =?utf-8?B?alFBS1BxMmlVU05FdHJqSitTZ1ZYY0grRFJzcit0bUtnZzhPSjU3NTl1SXZT?=
 =?utf-8?B?SUtPOWNSaUJ6d2JIRCt2TXNlSlBjM1M4UStFVThFcHlZTUpxM2huOGZ2Tm11?=
 =?utf-8?B?MUZjTWVORS84a0M1VDNvbWpPRXlVVE9QbXlDMW1lY3FUdUVqNDFsZEVBU1k1?=
 =?utf-8?B?eEV4OUplaGUyeGluU25CY1dpakNlQjNHWVp1RXJJQjU0Y05Zb2tYMmlKcFdn?=
 =?utf-8?B?Zmt0WTkyQ2xjZUN3eXFzdXRNaHZVQ3EzUHg5WEY3L1dGZkRZZ21PdGwycVlV?=
 =?utf-8?B?VVlLVWZ4ZnI1RFdxdmtscDY3V2hRV3JXVHVoRzhuYkZkRTZVNURCeGs0Nmhv?=
 =?utf-8?B?VDJkMGd0OVg3dTFTS2xxeWJMTzZOdDFpKzhWOVg4cndkUkp4bFpBa0U5K0pZ?=
 =?utf-8?B?dC95Z3Z4a2k2eWEweUtKQksyNkNEY3VyRVZhd05DemVZSEZVVkRRaG1yVmVB?=
 =?utf-8?B?SjlqZFZsSWpTdkdCVThRMFRiRmQ1TWFSc1pzeG9uZUVrNnJZcGtpbllwSGJl?=
 =?utf-8?B?VEVaaFpTdHlUa3hJVlhiVnNYUVIySUl3SjFyUm9LRjhnMGkwS1R4MEl4L2pn?=
 =?utf-8?B?alFzWlZ3UG9VVjdsVzZGb2FGbG4rSTJWRzQzRGFNK3REb3hQTzZNRlF4dVpW?=
 =?utf-8?B?YlNUSzJXb1JqMEZqODZkdFdlSVhRWFFZRTdGcCt5L25qcWF1MHRPblVGclkz?=
 =?utf-8?B?REM5bS9nTHdoUTlhU08wWG5xa3VGSGVlWUlkaUFDUG0vZHJwSFN2Y1J6UWhz?=
 =?utf-8?B?UThhZGw2WURsb1NObmdINzRnaXhjVHZqRkpPODZFV2tzZ2pCNVNUTUJpWGV0?=
 =?utf-8?B?RXhSWXNiUUx2VlVGVUljUzB5RHpWdGh3aWkyNG5XWkE2a0RDemZ6b2VDbWpz?=
 =?utf-8?B?TTNmcEg3YVIrc1R0UVgwUjVHS2pEWDk5S2ZUYVF1ckFQWDArTGRXZllSZ2x6?=
 =?utf-8?B?bFcvV0RxUDYxK1B2aVhFdDhKaE9sSnduRjhaMFJWd1Q4VnFOOFpoU1BETFE5?=
 =?utf-8?B?d3RXeGJRb1ZzbVM5R3JSVWsrTVkvbE5VaEVOR1Rma3g0N1oxSWlMQlhNbGw3?=
 =?utf-8?B?WG1iSzI5QWFaWFYzakVHZnFDQXUyVEc0bGNzRXBXTnJacUVIUEF5TDhzWFB6?=
 =?utf-8?B?b2xZVUFTYmxMOEZ2UUVRaEMzK1p1Tm9OSVhzUk54dVorZ2ttOFUzMkZDYXpN?=
 =?utf-8?B?eG5Ta1UxL1NQU0JGNXhmT01ZSFpadzJ4Z1haSkNzU3prbzFsNndkejFhd2pW?=
 =?utf-8?B?VEtEUmZ4eDM3eGZvcGIwL1p0TXNHOGorcUxzVlYrTGZPRG5GclpCUjRGSnBW?=
 =?utf-8?B?dFdpbGU1VHIweTlYTk43ejZFQ3hKV2t6aW9zaGlzUGMxa0lBQzFweGVYR3dC?=
 =?utf-8?B?QmNBN3EzdWZUQStGZDlUdlErTXRsVkpjYWtpcmZldjBrYUQ4VU8yc2JadHRr?=
 =?utf-8?B?eXdweStKZ3luR00rQVhwSzhpRUhPZ0pzRVhsSkdXMVh0ay9YeFo5WjNDd2li?=
 =?utf-8?B?c0FyYnlpN1Z0b0IzL2lrVSs1YlpqUFVrN2QycFZIR2MybjM4N2R2NmozdjNS?=
 =?utf-8?B?ZFVzSVpZd09zTXR3SXM1QkFGUVVVSjZWbEhkN3VpUThoNDQxdnVhdU9adFIw?=
 =?utf-8?B?U3M4dVJiNTNhS1FnTzBIRDlscDYxdGNUVFpTZmxKNGc3b2MzbUYvb1lJRExw?=
 =?utf-8?B?WkUwNk02VTFkbW9DdjFPZXpHWWxydDk1UVpxdDdjQkZsNTNoV0VRUlp4bTNi?=
 =?utf-8?B?TzNjVllMdUJiMlNOeldzcW5FT2UyQUNyZHpSL2V6WVhpWnhsWnlSV1B4TkVH?=
 =?utf-8?B?RUN1U1ZKV2hoRlpLQWpZaitvcERsU2YzWWxTM1dZRGd1SHp3dmN4VGo3WEt1?=
 =?utf-8?B?YlpYNWIvamlCZitCT09BZmJjdFE5bC9RMHZheldJdFBRS3czV1RFYitEWFBL?=
 =?utf-8?B?ZHVZTXFjU0RoeWRhUVhHOVY0WnZIaGZGUktGbmFNMWpOaHprN3pPZC9XUEZZ?=
 =?utf-8?Q?dKMiP2i4wxtFOPsQ74c/vYTVA?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418c2b18-d82d-4a8d-d3be-08dd568e2081
X-MS-Exchange-CrossTenant-AuthSource: MN2PR14MB4207.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 17:50:58.8629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43Z2EShqUoKz4kSE/OXIPDd7Ae5/9kz3g8SVotLggQXbboCMp7pHfXidTX28qi/3Sn1AXW9Hh2G1aB+k8nIi9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR14MB7175

Hello Krzysztof,

On Thu Feb 13, 2025 at 4:26 AM EST, Krzysztof Kozlowski wrote:
> On Wed, Feb 12, 2025 at 02:56:53PM -0500, Sebastian LaVine wrote:
>> Adds bindings for the Sony IMX728.
>>
>> Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
>> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
>> ---
>
> Please run scripts/checkpatch.pl and fix reported warnings. After that,
> run also 'scripts/checkpatch.pl --strict' and (probably) fix more
> warnings. Some warnings can be ignored, especially from --strict run,
> but the code here looks like it needs a fix. Feel free to get in touch
> if the warning is not clear.

The only output I get from scripts/checkpatch.pl for this patch is the
following:

> next$ scripts/checkpatch.pl --strict  patches/outgoing/0001-media-dt-bind=
ings-Add-Sony-IMX728.patch
> WARNING: Non-standard signature: Mentored-by:
> #9:
> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
>
> total: 0 errors, 1 warnings, 0 checks, 108 lines checked
>
> ...

I can change this to a Signed-off-by from Stuart if you would like,
though I feel that Mentored-by is applicable to this case.

Thanks,

--
Sebastian

Please be aware that this email includes email addresses outside of the org=
anization.

