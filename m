Return-Path: <linux-media+bounces-27853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78113A5738D
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 22:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 911E1178C8B
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 21:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F5925DAE3;
	Fri,  7 Mar 2025 21:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b="KhoTttBw"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2129.outbound.protection.outlook.com [40.107.220.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920E425D53B;
	Fri,  7 Mar 2025 21:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741382481; cv=fail; b=P4JXXdRWL5KTO2d1OB9pp/44WPVYebxXuQyxIde+rav4lDDC1RWQd4j245WiZvFw2vXNC9ubUm03DIqb8lo4bbYkaWngnL/qUrz5zvg+sEWJTXt+dM82MhTfB6Ud3n7sx9hGCnP1HIiy3Yc+p0SN3D9Iind6BqlQhklvVem0lek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741382481; c=relaxed/simple;
	bh=ORDDqV6XYo0Ls0oc45qCXSZphWVU2IG5bUsmHYP9J0U=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=N0uxtKR6ndg8V4FJ8vMxQkQvSm1uQNTdXlIYp7THoNdJfL6qtT5/AtsrSpGmENW3JuLfMTdBZrwD4DPkIdcK/9GwmhSCKAukeVSPRyParZO0Bnfg1z+99DOjP7b3GHp0QHI6Mfk4Y2oLQXZlcY+FR+RJlySetGnUCBfegUyBOjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com; spf=pass smtp.mailfrom=d3embedded.com; dkim=pass (1024-bit key) header.d=d3engineering.onmicrosoft.com header.i=@d3engineering.onmicrosoft.com header.b=KhoTttBw; arc=fail smtp.client-ip=40.107.220.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3embedded.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bynzdKR+F5qRE0Fai+ArcoDUBFPgd4ctZqVYZX2sP9V6aUlwCa4BHZ41XKEKbHWPSrtsxcwajR1WGTAYY+gUd2FHgDUqBnFHNYD8oWvo5agIhymiqJjEKG7x3H0yrfTkRZwK1p8te3Vzdxlqlu6l7DqiZm12Zsrll8aygtJFzNECebLef5KLMSva/P9uDMFNNlmHsV0EB0oncnz89oxDK3ujq0VE5w+7Iw0gPriB+lZqDyEOui77Ube98je/511e2LBL0IPWAGaqxP4g9XNZXRnBPTWq5BKh4HDAFgbFdCyE40ekhrWB/M5rbPawuXZoHdL0sAbLDArGHkn+ItJPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKBsNQNu7EgwdJ9mezfJK3/YtwYfn9rAHb5B3qRECv8=;
 b=skACrX4jIK8EcKlK6Obp1/zdNCZkvQe8mT9+HfexJSBPV6Cxhw147uQOAhhs8C81DBR3yfkWdipz7PqRFuGGqkh2D05W6T61B/4UuuanfGXr6u9/TW5nCAs+scWM8u9UUw8krjHVKRPAinHV9ao1oFwIGpTyShLU/PvMe995A4iDAH/iGGkfRNmtbCwULCtJLQRfnUVO65pCNKuVtFAPXayvlhrpSdgchU6cKHKe8+O9OG37xveHrNCq4L+FN+1Tt5/sp0aeavpF2ov6bCntIf8R9zSWFZGu/+eSzAlJKU0KMrUE0XT5vy64s4bEkkks7eC30dXCktKnlAP1ozboNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3embedded.com; dmarc=pass action=none
 header.from=d3embedded.com; dkim=pass header.d=d3embedded.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=d3engineering.onmicrosoft.com; s=selector2-d3engineering-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKBsNQNu7EgwdJ9mezfJK3/YtwYfn9rAHb5B3qRECv8=;
 b=KhoTttBwMZMTmCnOgzAcodxULrqUTgLZWbAV1EeE/yFUy5sbCHWS3xPzISanDP2Sfh81HdSCQw9urJTWu4vVZHEp/d3NW384D8dBdivqh+nl7y6aT4AmOFRDwBUjOWqdDHJDHiNAl6Yw+knau8Pf/YGR3jEfZYmjNMIq9UFZQks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3embedded.com;
Received: from BY5PR14MB4194.namprd14.prod.outlook.com (2603:10b6:a03:20a::7)
 by BY5PR14MB3670.namprd14.prod.outlook.com (2603:10b6:a03:1db::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 21:21:14 +0000
Received: from BY5PR14MB4194.namprd14.prod.outlook.com
 ([fe80::8455:2eef:6470:1665]) by BY5PR14MB4194.namprd14.prod.outlook.com
 ([fe80::8455:2eef:6470:1665%4]) with mapi id 15.20.8489.025; Fri, 7 Mar 2025
 21:21:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Mar 2025 16:21:09 -0500
Message-Id: <D8ACKEK4QS1G.2QTKXG691PVZY@d3embedded.com>
Cc: =?utf-8?b?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Abel Vesa" <abel.vesa@linaro.org>, "Achath Vaishnav" <vaishnav.a@ti.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Benjamin Mugnier"
 <benjamin.mugnier@foss.st.com>, "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Bjorn Andersson" <quic_bjorande@quicinc.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Conor Dooley" <conor+dt@kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Elinor Montmasson"
 <elinor.montmasson@savoirfairelinux.com>, "Fabio Estevam"
 <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hans
 Verkuil" <hverkuil@xs4all.nl>, "Javier Carrasco"
 <javier.carrasco@wolfvision.net>, "Jianzhong Xu" <xuj@ti.com>, "Julien
 Massot" <julien.massot@collabora.com>, "Kieran Bingham"
 <kieran.bingham@ideasonboard.com>, "Kory Maincent"
 <kory.maincent@bootlin.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Laurent Pinchart"
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
Subject: Re: [PATCH 2/4] media: i2c: Add driver for Sony IMX728
From: "Sebastian LaVine" <slavine@d3embedded.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, <devicetree@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-3-slavine@d3embedded.com>
 <f18d5d31-09ab-4422-b56d-3361e4d3b9c8@kernel.org>
In-Reply-To: <f18d5d31-09ab-4422-b56d-3361e4d3b9c8@kernel.org>
X-ClientProxiedBy: CH0PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:610:76::16) To BY5PR14MB4194.namprd14.prod.outlook.com
 (2603:10b6:a03:20a::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR14MB4194:EE_|BY5PR14MB3670:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ef69cc2-639e-480d-5f97-08dd5dbdfd98
X-LD-Processed: b7153db5-3376-478b-b601-92ce9bc0d3bc,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eWswdWFudS8vVk9hb0lKM2EvWmp1QlNEdDZpbmRyUWdKQVhIbWRoem1Pb0Iv?=
 =?utf-8?B?UWxIWEY1ZDZtb1o3WDZ6UUVrdm9UZTkzaE84RmltbGFJelpJNHhzNHd4aXBR?=
 =?utf-8?B?amNrL3ZYSFZsVzZUNnZkRzVoMEgxK2c0THk3dUZXQmpSQkI2cFQ3Q3A5QnhL?=
 =?utf-8?B?VytqMzFTTTEzdXNycTZiallqSHlkQTIvWjFVSzR1R2M5LzZocU1UT0Jrd0RI?=
 =?utf-8?B?UFhqQVJqOXp2ZUJUT3dPSVVKQjhwRHBsZjVVNnZZeEZQaG96UGI0cU5ab0xj?=
 =?utf-8?B?NHRwdHkrcjAwZHRCclN4aG1nbDlPNUttMVV6OVUzSm1oWnFINzA1TlhxeDdF?=
 =?utf-8?B?aTJobGRmMW8yT1JOM255UVpRdlFuTEJLbzZaa2NBT09naE1ZMjcyMTZIT3JM?=
 =?utf-8?B?Q3NFbml4R0M1Zm1ud09XeVJoS1k2SGJlN0w1eUVWWkpydzdnVEFSbjI0dXFO?=
 =?utf-8?B?aGF2WHhjczZTUFlpNHJMRk5iVzQ3TElFVlZ2eDR2NW9EVGNPKzZqOFllMkpJ?=
 =?utf-8?B?Nm13WVRaaGhqaW1DTEQ4YWQxbU91QjAybk9wamNzRnhiWEpsWndHejhxemhk?=
 =?utf-8?B?OXRLQ0M5dEZYNS92NkhkdzViY2pOSkMwTlhHUGQ3MGdmbC9PTWI4a3RjQVU2?=
 =?utf-8?B?Z0Y4RmFTcGJNVm1hMm5Xck84dGdqemNINTRPd1VueURDeVNUZjU5azk2Wk1k?=
 =?utf-8?B?NUp5MXFtTE5xM1pYOEJWY2poSUZZc0JoSXBOM3V5Sm96R01QbUVwbG96SUdh?=
 =?utf-8?B?a0d4SUcxRzNBM09UaFZpZkxBeXFzMlJqVmYxTXpPWW1uQUFnejdLdng0N3NZ?=
 =?utf-8?B?bUZYQTIyaTVzWFduZzhFMi9HRnRzTmRzd0tsUFRpZkx2MWZpd2RURERjRk1Y?=
 =?utf-8?B?SlM2UVdFTTZXaXo5Y0xUeWlQUCtBaHRVTFFyWHowYVpjWUVTejZpcTM5YVh4?=
 =?utf-8?B?VzdPTWNtSjl4TzJlVTY0bzFTKy9ZdjBBR3NMMjNBaThPcCtENlZKYkdiSmpP?=
 =?utf-8?B?RmxDMlA1RlAzVVhnZDBiRHkxdGM3bW9oL0hwazVpQ1dyNTVYcW1KU2QrejRr?=
 =?utf-8?B?Mko2eG54eWtvbk82cFdXWlZRb0NYelBJcGJrQTZBamluMXNJWlNRbnV2clFN?=
 =?utf-8?B?cTI5amRoVFA5MDdua0ZpNDZMTS9yem9GVWViYi9lR21MbTllOEZqQ1pOUnB0?=
 =?utf-8?B?MVFRWVluWS80RlFYdjRuV2s4S2R6bzF1eGxYcXhpWEdwS1pFQkhvdi9aMUxo?=
 =?utf-8?B?V3FwS3pXdFFpZVA0SmZTK28yYlIva1Zud3FzdXV0NmxQSlBTYW10TWNDNkJ6?=
 =?utf-8?B?NmxUSktrQlArbFZkYlZQRzJDTGdldm1qcUxONlpmeGpud3BUUW0wcHBaVXNO?=
 =?utf-8?B?REI3QlN5YmRTcnp5RkEvNFVNM1FUNWJ5c2pzbHJXWnlaL2hjejcxcTgwWGtC?=
 =?utf-8?B?Um0yMDRveGVXbVlaT2RacFdJbU9kNTRNZ0RXV3NkNHNXTmg2NjZnOWs0NUlC?=
 =?utf-8?B?ZlVzRXpQMVlnK1lSaE5jMXZJaFhyS0x1UUIzbXFhTXlsdTEzOHlFcnpnSmlX?=
 =?utf-8?B?aFBHQ2Uza040ajBHMmxoR1ZhZWd0MlA2OGxwb2loZlhpbytiQVBrOG5Ub0hC?=
 =?utf-8?B?aUJHMW1ieVB4bWlGbm9aQldxeks5WHVxZCtOeENjWVJOSXIxcW5LZVZBbUps?=
 =?utf-8?B?SDBmSXVDNFhJVTBBRU4wOFByZk0rZEc3VVNaQ1VNUWoyOUxsR2VMRnZJdWEy?=
 =?utf-8?B?M1g4V0x0K01MRmdDZm9SN3RJaXFTaCtPOGZCNkhEYWszS1JNTlIvc1l2blM1?=
 =?utf-8?B?a29rd2E5QlBNNkduQXNteFVoZktxTTc4bTdYKzBhZStQUWtIRWtGY2lYQXZq?=
 =?utf-8?Q?1gfTIPfsngzl9?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR14MB4194.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UDBwVmdPSVlXejQva1ZpVVhJUjRGRzVUZm9WczNoOVowWnBtc1FGbU96U3Vj?=
 =?utf-8?B?YWJnY3Z1UzJONWVKVXhKQk1ZY0g1QUc5bmlPVXVXUDBLQlRGaVdUcmVxZkZG?=
 =?utf-8?B?R1N5UUl0TzVXL2JGY003TUVLRkdpRWhTamRqamlXaWxvN1JBaE1wTGxnc3ds?=
 =?utf-8?B?UlNTc1lOK1dwWE13MzlCeEh2Z0dUU2JlNDVFcDFYbWZTM1JzaUhXMnU5U0Mr?=
 =?utf-8?B?b1dEKzh5ZjBPOEVwMXFWQ3IvMHlTRm0raUtmMHcvMnRsM085elRiRUh5cjVk?=
 =?utf-8?B?V3ZDeS9XdStycXRvWGFzMW41SWlUVFNkU1dQVkJTWkp5Z0JxNHJlUzYrSU9V?=
 =?utf-8?B?ZFdXd2F6WlBsNjlia3JpK0swOVltd0JHb2NKR2x1QzVDcGpQMFhqUzZaeFlZ?=
 =?utf-8?B?bHFiVW5LcVQxVU5Jb1hMRFJONUZYaW5xSHFvWUR6N1hmNElQWk1uclNEY093?=
 =?utf-8?B?Mi94WDNUSkorVWhXL2Q5c2tRcmlmVkZ1VXE4bytmZ2tmTGhSelRkRDJ3ai9s?=
 =?utf-8?B?cm1Bcm5Yb0Z2TGI2cmRPMjAyYVpuN0g2M1FDeFNNcTdZT2dEN0VjTENGdUtt?=
 =?utf-8?B?a2tYYkJjTWdJbFZHS1dseGc3SzFJdEE0elg1MzE2QnovSDg4c2M3ZVd4ODJJ?=
 =?utf-8?B?U2J1dFA4VGlpWXZ3YXlXaXNGZEJkSGIwNDhnOXJGZ3lhckErRjhKZVVtaGsz?=
 =?utf-8?B?bXBYdG1jQWJab25TbnE1RGZVeVJpY3lkZ0JtOS9HSm1XV0o5ZFBsZE04NUxi?=
 =?utf-8?B?bU9HU1FKWThPaUE2VWFJNjFpS3JEVjI5RDZrN0J2VS9MeEV0anB3VTR3WFZ5?=
 =?utf-8?B?czFLbXhld0hPRW1wcEUrTkxHSkVwSS9KZzkza2oweSttSWptRTNTb3EvUzE1?=
 =?utf-8?B?UEIrUXd1VEFOc0RJRVdPcEhEVXNSZThFZUZMZk5wOFB1QUxzNnUxaGx1SUpv?=
 =?utf-8?B?ZlBuNUNxQlpEeTlTeUtVSFRCM2QzZERxem1QSFVwTkthanprVWkrN1BmN2Vi?=
 =?utf-8?B?aVBKRlYxOTVFSVJVaHlFZnFnUDl5OS94Z212WXFqMWpwT1JaaUhwR3ZZWDZw?=
 =?utf-8?B?NFNIcGZyUVpCT0tpcmdCRGhWM2NKNU1hdzB6UXNIZ0dtR1Q0MDNzNWJwRFRa?=
 =?utf-8?B?dk9NcCtmd2xmVjFibHJ2c1pXMHV1c011T3JyZGY3YUZWTkFlVDlIT3licVc2?=
 =?utf-8?B?OWxkVDlvbnhZcTM3a0FoTTJ2TU5qMzVtOFdOa3l1WGhTTVJjZHZMZ0YwNlVT?=
 =?utf-8?B?Yi9DK3puN2F6NGVjSk9scWdKcU1pOFJoUTl1YUt1TzZ3WHZSMlk2Y1NucUVP?=
 =?utf-8?B?THY3TS9mSE9LN1JwUC91eTBIMVE0QU1qYjBnVlNyMEZzZEJIL2ovbGhSN0k0?=
 =?utf-8?B?ZzI3NEhvcUJUeHB1OFZNU2xCVFdheGtjeTROL2I4cGtyTkVqU3k1L1dkMk4x?=
 =?utf-8?B?Mk9ZRGMzY0JMV1U4NkJiWFhMVzBjWFNpTWJCQ0xFT3phQlBnZXQxWUI0SDlu?=
 =?utf-8?B?VlZnTDZISy9WMG5DRGFaQW4yTWhraDNac2x4OGZjdFlmQkxtZTdRYk5BSGpi?=
 =?utf-8?B?YzhpNTJndlh6Q01yVHdHUEljbVAxR0FIMXR2RHRZdzlhN0hVTnc2ZDJSaTQ4?=
 =?utf-8?B?RFJwaGRHeFpMYVBzL09BZ3QxMHRlVTNGL1poK0RyOWQwNno5NHJDWXVnTndR?=
 =?utf-8?B?VEJyUzhsSFRuOVFBQlZHRndQRHVPajlYdHM4Mll0QTRyRUV6SXEvNm9ab3JK?=
 =?utf-8?B?OEJWcjZvVU5JdWxRWWlyRVJTaHVWVkdSajZKaVRYM2NFRG9UVHFhVnQ1R3Rk?=
 =?utf-8?B?a21DSy81ZGNmUHFjRDFxT3QxMjhlakJuSnpjSHdvMUZFVERhWTU5dWE2cnpt?=
 =?utf-8?B?Q3N1QnVkM3RaVEM2L2t6YzA2cVlpZU54emZBcWJwS21aWGt5bVpPZm1SbXNo?=
 =?utf-8?B?VlFOY3NIc1gyUERFSGdzTWdvVE1kRU01QVpoQnhCeHU1ZW9venBOcEUvbGwz?=
 =?utf-8?B?VXVmeERMYTFVMkdTUEk2NUNqL2FaRE54dC9jalFXdnNaRG9CNXBWOFk0NUZj?=
 =?utf-8?B?WnZXZUNCTU1UZStLa2hSTmJ5aEZNTm5MMjRjcWtvdjJZRmJLWGJpVmFWYjJW?=
 =?utf-8?B?RnhBK3h1eDZ0NS9iQXZ1TGVtNTVBYVRQd1ZqcGhvcTlDQTJaR2I3eWdVdDdG?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: d3embedded.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef69cc2-639e-480d-5f97-08dd5dbdfd98
X-MS-Exchange-CrossTenant-AuthSource: BY5PR14MB4194.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 21:21:14.2567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tv7hRG6iWaihLVvyVV3IMiDPKZYK4twDIK6UmWzGyAHVQGWB/vSedw+12L//LYqH7TOrXaRqas+ByFEuoTBpKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR14MB3670

On Thu Feb 13, 2025 at 1:19 PM EST, Krzysztof Kozlowski wrote:
>
> ...
>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index c62831e61586..0ff578bb4645 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -852,6 +852,7 @@ CONFIG_VIDEO_TI_J721E_CSI2RX=3Dm
>>  CONFIG_VIDEO_HANTRO=3Dm
>>  CONFIG_VIDEO_IMX219=3Dm
>>  CONFIG_VIDEO_IMX412=3Dm
>> +CONFIG_VIDEO_IMX728=3Dm
>>  CONFIG_VIDEO_OV5640=3Dm
>
> This is not related to this patch and should target different subsystem
> with its own explanation why you thing this should be in common defconfig=
.

Thanks, I will remove this in v4.

-Sebastian
Please be aware that this email includes email addresses outside of the org=
anization.

