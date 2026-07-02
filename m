Return-Path: <linux-media+bounces-66387-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7XOfAnKORmoTYgsAu9opvQ
	(envelope-from <linux-media+bounces-66387-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:14:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFE36FA054
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:14:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=hDN3dmFC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66387-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66387-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7950030B46B0
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 16:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2632A33BBCC;
	Thu,  2 Jul 2026 16:04:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FCA33BBCF;
	Thu,  2 Jul 2026 16:04:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008280; cv=fail; b=aaoNjVFwBsJBXvrXKbL54NiTrZTD080A4Vz9Wy74tj9EBermDXCVLOqh9UsO9+aZyw4acPTpZ4jsr3MKuYXuHQ/3KESjwUkQPyyPfu6tEt/yfgAG0qvrbT1jr9E/87jcglq7wmSqsS91sygYM+nvAqr3gL1nyydtIpgBgM17fZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008280; c=relaxed/simple;
	bh=IcIPXIDichALXTF5/92wnwbacfluMgxEGKU+TSnATac=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Zcjn3+oXa/FP8Ag4KOdeLslx/qUckXTNSaEmC8xYxBhFXgC7WNIzRFRBVQo37oMGljBjlkZCwB/M7qcZNU9PnUVf8F97w7sjoaizZL+Q7VpybUYGY20Sp6pjpF14Es/LPrfurMbty8iS3w2sExuM2tpv4RzW7QYm9o7rXxmteWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hDN3dmFC; arc=fail smtp.client-ip=40.107.159.68
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nIwDaoC7AvCGVQvB9RBCLfs1vYY4qsoNmJd/PabWg0PpG72VuKkObIqzUJHMVHdqezdtEX4pHX/qtTKLP7wwy8gjjf3GxJfDob4DOcPJhhIJlEcj0IsfNGxRuDv0zmi+xeXHiTEYhge5zIGe3janMJuPhbNd53zaAdWwlnSGYJpNoyC4S8iLfmECa/DsnbRQkwtSSyJVXvkrMrFsHqcmD2q5tGgz/RSbXR1GbUM3lpQ+OLZwgvvWdCdlXvMQA+z5L4i+3a7Aq4A2Cp2o19RwcPN/VUnKZsWyLidpis9O/+dmhE2xx9zMUpCONTRjCZpLptP00gMmPyBEEJ13Vu2O+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufbbNqr+W3SshGzSLtabab38ZzhMtP7c5JJhG4P5FJk=;
 b=qCdTMwtpukf8JSI6lOxhJ+nb/M8P+thyAZwIImbub7TaeMW3p5fkj2RpmUEtPebg/vLjckuQq8ioM4B61BT+I9k3jN8WSJS7jV458VqdJk7jVY0+DXVMN+ZfDyKKVSM9VwGCyzMM2VWgUk/GSSI6ferT4tRQ3dVd8eWiVag3Q8mGIZMcsVG2WoCeP+PJH6IC6HL3eyrA/lBraaeM+6ydPwqtUIQJWb/i79cf4D3joxj20OLbcGarmC/O/OXk1hZ/dnPYH5tMXggbyKL/qg9EIXCi5vhWCxki8m2B95Uijom1eaKkdrlLkH8riSlXLGUGoK7pzb+bl80etJf9LLZBzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufbbNqr+W3SshGzSLtabab38ZzhMtP7c5JJhG4P5FJk=;
 b=hDN3dmFC3uFg43wyAi2Wzdf4AbMddbPIsxHg3H0/RGWzNucx2ZNd+GpbJtYks4XnHX5Jc7WpexyZvjF8Kx4vYuctuuFclS08xRXjp6A+HfSMpvqKqGHP6IHa1HEUr6YLFU1KNp+dL6y4YTAFrJgH8B40m1AHWAqLkdsE1biCN52ktDxlVPHlJ2aVK7+CaI4eciwlOA8ayGko820ztw5bqNWG4y7jKdb+EoPAVS7HPlUNci+06kYxOOxyRXt0ld3he2WSGw3n+J+kBe2MWQKydn+F522oaj9XyA1sFpUCQy/5H8UX+wJ6+c5QLtqtxyCz1dmvR6QoeZ8k4RMDXnZ1Gg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 16:04:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 16:04:34 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 02 Jul 2026 12:04:00 -0400
Subject: [PATCH v7 4/8] media: synopsys: Use media_async_register_subdev()
 to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-imx8qxp_pcam-v7-4-b47d9e363400@nxp.com>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
In-Reply-To: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783008245; l=10555;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ceYXWmNAGkwVi2tDJW2xepKi47AaU7AuCaa1cGYGUCM=;
 b=bQgiudGr0b7hawcFaToEzwLjz9Zky58AWyf+NR/qS5gllWMu0nlty0AlYrK0hGYu/DtgRM9ya
 m4sdcBsMxisBZrYJX1p+cxkNUrtiwqGfDwakaa+hNRh4Dso5N0KKE6y
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:510:23d::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8891a2-ef6e-4f50-aff9-08ded8539b55
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|921020|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 86TeopTkjUsGJ8TuoLwjw3WgbjLEQbN8/z4rzc/V61W1FH8HN+4wXaoWCy9Vt/gm7mv+p9H6hOhX4LkhfSm7+dLiXpuJlFfM8VevNmfI4oJ26FjbT9y5dyH/gWBhcWig8QT5y/DPc2fHE2G3g7jCO2iVzMYZ9Yz7GhU1PWZi2TPv+7xQPT0msnqVfwXv2Qf8JeDCeZGQzNQQlyNypzbSdi9b5Gdx15Gd/vUNxObhKHLQVUTQR6gbQ/UXY0hYXfNk9lgxCeTZTf8d/hKUMu/KVWP7dxxbjE58Mpap2+3/50cFoko5JgxQTsQf/tjeXPncx4dvjKzD7OaBHwKUZGVQja9oA48/KVlnO/iz4vddCcikkJXCIJi/iVOazyy6VXbFx9j3SmfYP98r4rTQsB32JaWQqh/G0ECVeQ/llCCGqPFatP0Z78YB9ct0AsmXLeCO2u363dETKVUmLFa0nEzeAf4SU9I1ZMjtrca6FD1MAE0VgZHvfuIsoEfsm5QuJUWmbaJIskvgQup8Hoz79uPTWYxIjY9yccCGtFY1C8HC+RUr29AZRvbhhFSOCzq9kD+CFXkh7ilrbe8t7H5HM5xmz3AqzTfz24oB1H0ie5OQ8eIhF25lDRYjgLyzcokfZYR7mRGtBcBPFiuwpQAEgp+TtUZ493JmWLHj00SC7l0PqP7uQoH0R1VFO1ElID6bbaSr7NZ0Ogn8mfruU+aR4uN1Cw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(921020)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?clFEdFNNVFZMNHN2bDk3ekEweXRsMTdGWDRhdy83V2pic09idUlxbC83M1lL?=
 =?utf-8?B?ck4wcStTamtyRFljYWFXZkNXem1JK1R2bExBOXNZbytMMGZiN01aOG9zRy9B?=
 =?utf-8?B?OWhkNTV4QzhTM0NzVDdGL2hTOCtQcXFacXcxOGQwUW42WjA2OFJnRDlzWEFI?=
 =?utf-8?B?QUczTE10Y3VrZGRsSXpXMTEvWEVPWGVreW5vbzBoNjhaekRORXBVTmdub0dU?=
 =?utf-8?B?UjRTYTJoYk1uby9FZWtIU3FiR1FqUHZlVjNuSExWNjl0YjA0TUJ0dzVLOXll?=
 =?utf-8?B?WHZEcnhpTlFHeUxYaXJwVTRBazQ4aXBuT1gra1dyVS9LSFA0ekNWOE03anpR?=
 =?utf-8?B?QjVHVExQclNzZTh2b2FLMm15QUpCeE5JNGx3a0JzSitNZW1kOStmb2dSTTFP?=
 =?utf-8?B?WTZTQVhQOUU1QTIyNVBNdlZmVW8wc25aazBHZkJMWTc1ZThkNkdZNGM1ZTM3?=
 =?utf-8?B?S1c4ajFOU2kxVUJlSEtFMjRmemd5RHlZZ1hJU1Q5QUdxMXVxb28wajdoS0ph?=
 =?utf-8?B?K2N6OWs3cDhXYjRVTnUzM3dockdTMU1vT2xwajF0akFSMitTTTJHaHZTQW5C?=
 =?utf-8?B?Y2dXUmxCY0lSUmZTMGJ6VlJsS0tNRndwRGJ6WTlMRk9FVzFsZ0lReCtVck9y?=
 =?utf-8?B?ZURmalJEbVVKN0RJdDJvVnFGaUJUSllhajlpQithVHVzUEtWSW1NaDI3VG1V?=
 =?utf-8?B?YTJvbUFPclZnQjYra2RUTllycGd3OE9mY0IvNlFnZTNVQmNkcSthYnRwL3Qz?=
 =?utf-8?B?VUJRWjc2Z1UxT0NiUGtKaHFYTEl5Ymc2K2NkWit6STJBYjkxWHpTVVJCYVo3?=
 =?utf-8?B?MytFN0hOdDJLSlAxc05RR1plNEZXZTV6anNFMW5GR2VoU3U5bVhNSmFqanA0?=
 =?utf-8?B?dGc4OFo5a1NnRGw0TS9vcVIxUlVrVkNQeFQ4c0FCU0lTQjB1R24yU2dSSUJU?=
 =?utf-8?B?WjdJWlFORGYwdzlrWE9iOWtkWEN1bFk5eDlOR1RtUjBJM2VZbGdNL3Z3NHlE?=
 =?utf-8?B?ck1NSG43SkxPNjVQb2ZqQ0gzTzhkTzllOVMzQXg5WC92UjZ4T3FZUXhUTTNH?=
 =?utf-8?B?NDlaTzBuMzR6NlgybVo3YkMrVmlSV0xLZlgvbzg0ZWhsYVYwdmlVdnZCMkp2?=
 =?utf-8?B?cnJRUE11czVNYWo5QlQ4aEpNeDV1T01HV1dVWUF0azAxMmlhdldzeUFLb0Zw?=
 =?utf-8?B?TStzYnVrOXRRQ0NEN0E0cjZXRzJ1WVJGRmNlNjZUMjBYMktZbC9GcWZ4dkVB?=
 =?utf-8?B?bHprWHFCMzVmQi9PZ2ExTzRxUU1IUXVWYzEwUmlqeHp6eWdwbk5IWFlSWndP?=
 =?utf-8?B?QjhpNzZQZnI4NU51WVYwWmc4N0w4K1ZlTFBTL0dKSjlPamRPZVJ1TC9ranhy?=
 =?utf-8?B?WVA3MTRRRGFwbkczUkZLYzJmbDhMN3Buck9SRXpPSUJIUkp4OWZZaUtXREdr?=
 =?utf-8?B?dkpPVDgzVXdVWkhRaHVVSDVGMi83dU91TzBGck5jYUhQVk5HSlVndmNEUFAz?=
 =?utf-8?B?K0dmMkJXTDRscTR2d2Q3NW82cUthdFl2NlVIWHhhUUUyNkFpQkxNOEpnUGFT?=
 =?utf-8?B?NlJGK0x0ckpseEdXTi9jRkpucWJSNkQ5UFVhVmdOMUhRSDg1SFUvdTRROENq?=
 =?utf-8?B?aUN4am5KUUZRRVlrOEtZajdPQXJMd2ZtRXdwTzNFdDAyNGk0QUxILzlYNWY0?=
 =?utf-8?B?dW0vSEJ5aXl4cUVZZ0U1eDVQNk44YTVrTzVGTGl4a0dYWGdRSHRZYjlVM3ZW?=
 =?utf-8?B?SmpoSk9DVCtHZWUwWnRHZnRRRC9raEpBUmYxVVVYeXp6UzFNNmJXc0MyYlJq?=
 =?utf-8?B?ZXFINzZvUy9CNU05RElWWmM1N2JuS1ZHaTcxS1QwTVN5VWhiYXlaMVN3S0xT?=
 =?utf-8?B?RkJnZmpWb2lWdTZBUDJnbkJ6RW41cXFjTDBwUHZGaXJVK2dtK042MUNwSWNJ?=
 =?utf-8?B?YXVnSDFwRnl1MFI1Y29KZlc2Z0lLTnZxRmljdDVqVVRSYThZQnVWcTNldjFY?=
 =?utf-8?B?QlhNZG1GeEg2ek1Gek5GbGQ5OFMwRjhscmdRRUZBTkJlQURZbzdxd2FqVkJn?=
 =?utf-8?B?OFp4d3A2WnYxTXdaZnBMOFpoaEM5UnpjRC9xdSt6Nzg3SnBwT05RS0lvYmEy?=
 =?utf-8?B?Y29LRGJ1a1FDbzJ4bDZDclBFLytyTkZtYys0b3A5TmhxaWx4K0FTVmp6dmFl?=
 =?utf-8?B?V2hJTUN1OXFBdEo0N2tOcUVHcjR6Z3d3T0lNdHZQZkd4Y1Z5Z3FWb3hYMGxa?=
 =?utf-8?B?cXVYRFd6ZXBVN1JSVE9EZXJFbEFOeWNzd3lKdE9mRFJTMUxlQ3NOdTJuTk9m?=
 =?utf-8?B?bHlweUhNZEtSV1JFalBuaklLS25UbEFYUlJBY3h3eXc1cXIzeHBKRXFuM0lI?=
 =?utf-8?Q?DC8Kw2wRzDwV1FCy+Z/7iCG+GcDHNZVIuwz78?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8891a2-ef6e-4f50-aff9-08ded8539b55
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:04:33.8708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeOsI7s2M1jQ42HkIvpZjd1MmxpmyUbIf/p0DKkz9uoLzabFbBy9KeP+4rG4LnHWYlS+nsyclLyB6DOIb7hL598CtBs38SgH4s4l81eFMkmJG5kFFQERHgHgw2z9+ZyQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66387-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CFE36FA054

From: Frank Li <Frank.Li@nxp.com>

Use the media_async_register_subdev() to simplify the driver.

Replace the local subdev registration and media pad setup code with
media_async_register_subdev(). Reduce boilerplate code and aligns the
driver with the common pattern used by simple subdevices that each media
pad has one endpoint in fwnode.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
chagne in v7
- keep bus_type in csi2 struture
- update set_pad_by_ep() argurment.

change in v6
- use media_async_register_subdev()
- remove sd_1to1.

change in v5
new patch

previous method:
https://lore.kernel.org/imx/20260226-v4l2_init_register-v2-2-902d7140f9fa@nxp.com/
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 172 +++++------------------
 1 file changed, 39 insertions(+), 133 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index f51367409ff46..0d8834e77a08a 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -78,12 +78,6 @@ enum dw_mipi_csi2rx_regs_index {
 	DW_MIPI_CSI2RX_MAX,
 };
 
-enum {
-	DW_MIPI_CSI2RX_PAD_SINK,
-	DW_MIPI_CSI2RX_PAD_SRC,
-	DW_MIPI_CSI2RX_PAD_MAX,
-};
-
 struct dw_mipi_csi2rx_device;
 
 struct dw_mipi_csi2rx_drvdata {
@@ -112,8 +106,6 @@ struct dw_mipi_csi2rx_device {
 	const struct dw_mipi_csi2rx_format *formats;
 	unsigned int formats_num;
 
-	struct media_pad pads[DW_MIPI_CSI2RX_PAD_MAX];
-	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev sd;
 
 	enum v4l2_mbus_type bus_type;
@@ -360,9 +352,10 @@ dw_mipi_csi2rx_find_format(struct dw_mipi_csi2rx_device *csi2, u32 mbus_code)
 
 static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 {
+	struct media_pad *sink_pad = &csi2->sd.entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
+	u32 lanes = csi2->lanes_num;
 	struct media_pad *source_pad;
 	union phy_configure_opts opts;
-	u32 lanes = csi2->lanes_num;
 	u32 control = 0;
 	s64 link_freq;
 	int ret;
@@ -370,8 +363,7 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 	if (lanes < 1 || lanes > 4)
 		return -EINVAL;
 
-	source_pad = media_pad_remote_pad_unique(
-		&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
+	source_pad = media_pad_remote_pad_unique(sink_pad);
 	if (IS_ERR(source_pad))
 		return PTR_ERR(source_pad);
 
@@ -458,16 +450,16 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
 	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
 
 	switch (code->pad) {
-	case DW_MIPI_CSI2RX_PAD_SRC:
+	case V4L2_SUBDEV_1TO1_PADS_SOURCE:
 		if (code->index)
 			return -EINVAL;
 
 		code->code =
 			v4l2_subdev_state_get_format(sd_state,
-						     DW_MIPI_CSI2RX_PAD_SINK)->code;
+						     V4L2_SUBDEV_1TO1_PADS_SINK)->code;
 
 		return 0;
-	case DW_MIPI_CSI2RX_PAD_SINK:
+	case V4L2_SUBDEV_1TO1_PADS_SINK:
 		if (code->index >= csi2->formats_num)
 			return -EINVAL;
 
@@ -487,7 +479,7 @@ static int dw_mipi_csi2rx_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *sink, *src;
 
 	/* the format on the source pad always matches the sink pad */
-	if (format->pad == DW_MIPI_CSI2RX_PAD_SRC)
+	if (format->pad == V4L2_SUBDEV_1TO1_PADS_SOURCE)
 		return v4l2_subdev_get_fmt(sd, state, format);
 
 	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
@@ -549,12 +541,12 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
 	u64 mask;
 	int ret;
 
-	sink_pad = &sd->entity.pads[DW_MIPI_CSI2RX_PAD_SINK];
+	sink_pad = &sd->entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
 	remote_pad = media_pad_remote_pad_first(sink_pad);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2RX_PAD_SINK,
-					       DW_MIPI_CSI2RX_PAD_SRC,
+	mask = v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_SINK,
+					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
 					       &streams_mask);
 
 	if (!csi2->enabled_streams) {
@@ -608,12 +600,12 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 	u64 mask;
 	int ret;
 
-	sink_pad = &sd->entity.pads[DW_MIPI_CSI2RX_PAD_SINK];
+	sink_pad = &sd->entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
 	remote_pad = media_pad_remote_pad_first(sink_pad);
 	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2RX_PAD_SINK,
-					       DW_MIPI_CSI2RX_PAD_SRC,
+	mask = v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_SINK,
+					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
 					       &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
@@ -649,9 +641,9 @@ static int dw_mipi_csi2rx_init_state(struct v4l2_subdev *sd,
 {
 	struct v4l2_subdev_route routes[] = {
 		{
-			.sink_pad = DW_MIPI_CSI2RX_PAD_SINK,
+			.sink_pad = V4L2_SUBDEV_1TO1_PADS_SINK,
 			.sink_stream = 0,
-			.source_pad = DW_MIPI_CSI2RX_PAD_SRC,
+			.source_pad = V4L2_SUBDEV_1TO1_PADS_SOURCE,
 			.source_stream = 0,
 			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
 		},
@@ -666,95 +658,42 @@ static int dw_mipi_csi2rx_init_state(struct v4l2_subdev *sd,
 						&default_format);
 }
 
-static const struct v4l2_subdev_internal_ops dw_mipi_csi2rx_internal_ops = {
-	.init_state = dw_mipi_csi2rx_init_state,
-};
-
-static int dw_mipi_csi2rx_notifier_bound(struct v4l2_async_notifier *notifier,
-					 struct v4l2_subdev *sd,
-					 struct v4l2_async_connection *asd)
+static int dw_mipi_set_pad_by_ep(struct v4l2_subdev *sd, struct media_pad *pad,
+				 struct v4l2_fwnode_endpoint *vep)
 {
-	struct dw_mipi_csi2rx_device *csi2 =
-		container_of(notifier, struct dw_mipi_csi2rx_device, notifier);
-	struct media_pad *sink_pad = &csi2->pads[DW_MIPI_CSI2RX_PAD_SINK];
-	int ret;
-
-	ret = v4l2_create_fwnode_links_to_pad(sd, sink_pad,
-					      MEDIA_LNK_FL_ENABLED);
-	if (ret) {
-		dev_err(csi2->dev, "failed to link source pad of %s\n",
-			sd->name);
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct v4l2_async_notifier_operations dw_mipi_csi2rx_notifier_ops = {
-	.bound = dw_mipi_csi2rx_notifier_bound,
-};
-
-static int dw_mipi_csi2rx_register_notifier(struct dw_mipi_csi2rx_device *csi2)
-{
-	struct v4l2_async_connection *asd;
-	struct v4l2_async_notifier *ntf = &csi2->notifier;
-	struct v4l2_fwnode_endpoint vep;
-	struct v4l2_subdev *sd = &csi2->sd;
-	struct device *dev = csi2->dev;
-	int ret;
-
-	struct fwnode_handle *ep __free(fwnode_handle) =
-		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
-	if (!ep)
-		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
-
-	vep.bus_type = V4L2_MBUS_UNKNOWN;
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
+	if (vep->base.port == V4L2_SUBDEV_1TO1_PADS_SINK) {
+		if (vep->bus_type != V4L2_MBUS_CSI2_DPHY &&
+		    vep->bus_type != V4L2_MBUS_CSI2_CPHY)
+			return -EINVAL;
 
-	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
-	    vep.bus_type != V4L2_MBUS_CSI2_CPHY)
-		return dev_err_probe(dev, -EINVAL,
-				     "invalid bus type of endpoint\n");
+		struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
 
-	csi2->bus_type = vep.bus_type;
-	csi2->lanes_num = vep.bus.mipi_csi2.num_data_lanes;
+		pad->flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 
-	v4l2_async_subdev_nf_init(ntf, sd);
-	ntf->ops = &dw_mipi_csi2rx_notifier_ops;
+		csi2->bus_type = vep->bus_type;
+		csi2->lanes_num = vep->bus.mipi_csi2.num_data_lanes;
 
-	asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
-					      struct v4l2_async_connection);
-	if (IS_ERR(asd)) {
-		ret = PTR_ERR(asd);
-		goto err_nf_cleanup;
+		return 0;
 	}
 
-	ret = v4l2_async_nf_register(ntf);
-	if (ret) {
-		ret = dev_err_probe(dev, ret, "failed to register notifier\n");
-		goto err_nf_cleanup;
+	if (vep->base.port == V4L2_SUBDEV_1TO1_PADS_SOURCE) {
+		pad->flags = MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
+		return 0;
 	}
 
-	return 0;
-
-err_nf_cleanup:
-	v4l2_async_nf_cleanup(ntf);
-
-	return ret;
+	return -EINVAL;
 }
 
+static const struct v4l2_subdev_internal_ops dw_mipi_csi2rx_internal_ops = {
+	.init_state = dw_mipi_csi2rx_init_state,
+	.set_pad_by_ep = dw_mipi_set_pad_by_ep,
+};
+
 static int dw_mipi_csi2rx_register(struct dw_mipi_csi2rx_device *csi2)
 {
-	struct media_pad *pads = csi2->pads;
 	struct v4l2_subdev *sd = &csi2->sd;
 	int ret;
 
-	ret = dw_mipi_csi2rx_register_notifier(csi2);
-	if (ret)
-		goto err;
-
 	v4l2_subdev_init(sd, &dw_mipi_csi2rx_ops);
 	sd->dev = csi2->dev;
 	sd->entity.ops = &dw_mipi_csi2rx_media_ops;
@@ -764,45 +703,12 @@ static int dw_mipi_csi2rx_register(struct dw_mipi_csi2rx_device *csi2)
 	snprintf(sd->name, sizeof(sd->name), "dw-mipi-csi2rx %s",
 		 dev_name(csi2->dev));
 
-	pads[DW_MIPI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
-					      MEDIA_PAD_FL_MUST_CONNECT;
-	pads[DW_MIPI_CSI2RX_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&sd->entity, DW_MIPI_CSI2RX_PAD_MAX, pads);
+	ret = media_async_register_subdev(&csi2->sd);
 	if (ret)
-		goto err_notifier_unregister;
-
-	ret = v4l2_subdev_init_finalize(sd);
-	if (ret)
-		goto err_entity_cleanup;
-
-	ret = v4l2_async_register_subdev(sd);
-	if (ret) {
-		dev_err(sd->dev, "failed to register CSI-2 subdev\n");
-		goto err_subdev_cleanup;
-	}
+		return dev_err_probe(sd->dev, ret,
+				     "failed to register CSI-2 subdev\n");
 
 	return 0;
-
-err_subdev_cleanup:
-	v4l2_subdev_cleanup(sd);
-err_entity_cleanup:
-	media_entity_cleanup(&sd->entity);
-err_notifier_unregister:
-	v4l2_async_nf_unregister(&csi2->notifier);
-	v4l2_async_nf_cleanup(&csi2->notifier);
-err:
-	return ret;
-}
-
-static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
-{
-	struct v4l2_subdev *sd = &csi2->sd;
-
-	v4l2_async_unregister_subdev(sd);
-	v4l2_subdev_cleanup(sd);
-	media_entity_cleanup(&sd->entity);
-	v4l2_async_nf_unregister(&csi2->notifier);
-	v4l2_async_nf_cleanup(&csi2->notifier);
 }
 
 static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
@@ -993,7 +899,7 @@ static void dw_mipi_csi2rx_remove(struct platform_device *pdev)
 {
 	struct dw_mipi_csi2rx_device *csi2 = platform_get_drvdata(pdev);
 
-	dw_mipi_csi2rx_unregister(csi2);
+	media_async_subdev_cleanup(&csi2->sd);
 	phy_exit(csi2->phy);
 }
 

-- 
2.43.0


