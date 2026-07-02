Return-Path: <linux-media+bounces-66385-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tK3nM2uPRmplYgsAu9opvQ
	(envelope-from <linux-media+bounces-66385-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:18:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8146FA135
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:18:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Cd2iJjc8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66385-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66385-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 106F43071EDF
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 16:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9470232572F;
	Thu,  2 Jul 2026 16:04:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F5231F9A8;
	Thu,  2 Jul 2026 16:04:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008269; cv=fail; b=SDzGG7W8bZtdydrvKR/POSUvyGh7MZuPjRKUrj+4/kOAKjxcTvDMW/YvLYPuplUsinDK4saIPzCpyHIUYmVA137tGsa9ZDXXB4/RiRj7SkLMCEoivC5p7YZIPQnspk2fFHS3pv+d7anlezPhHoc7Bq8Xx7r0SVFQwQTEjccLQW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008269; c=relaxed/simple;
	bh=Zd54xbvgjnHRBSpqDi5abCVi81GDJVdvf1irSRrbM1A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uxasanAGlJhahKl+LNZMFqqAt78GfJQyqoVDSUnpKPjY6SZVa0dVkpW7K/YASU3zHhWY6CgRKYSsWENzpbZnU4sst1ioj3iD8Nd7PQXtI8kfIJDXjAZlf8A4y5FCwJmFPDcEO3urkUH6iMbBPs7cvn4eXy6FmV2cEiFKtUP2pNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Cd2iJjc8; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6eJ7bsKpC+vMigycsWxpV13dtZPmDTavbPIuGBsWcW8zhDmh8yTljCgVatXjGoZXFmYW7VMbnlOH6NGa4sRqSQBCFaZOFUJ0f6eP1GPumo2lmDyaeEQaVAjdSuN8bv8mFPxREnZ2zqQha3hz/n/hfRNSaSx75OfB5NhEsEpPBAhauMzBQWKabZXQ1UmckBS36zW02p05lmJvnop69gos3JdB7uLMa40AUiz7QxH/u4E0nJrnIxbEqhkubD3q4GpdqcyIBFqF2AKRY7WKEVe5bEuzswF1y9csk/hudZurwLBUdydSOfizyKBhIhU81QyUlmfldsDCbjFopbkJkhCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5t+h4UumxBd1keq22YbApunTuuxZEC1WRRS2XH5/Rw=;
 b=VeCoogTB6Hpsxl0xlSf+wSzlfjZgfkiaeSbR31WnzeIJb1zl875DmHRpwcXlVFKcsqq7qlPcBVCoiB3r0qmEhA0pL9etXliFZcRVBSjtSJFGx34P7CXl/yuRxzpCI4M4ctEWRbrFJzbE0K404HtentQStsdZowF/MNceaesA6gve1JDPY5R3DiJZIbsoVvgYRARl3V0ZbFGKpM2BzyCVXniKTBvmovW1korDAEU8eFtygZLf4GsHHW6OsOizMXic3MqC18pv24a2yZXqrWihiw8DtphEIqWnjFLAgSgi8MHjxaHGmTnnoqba+KnMzBQp8iyo4OCSGIXX6VPiVf2B7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5t+h4UumxBd1keq22YbApunTuuxZEC1WRRS2XH5/Rw=;
 b=Cd2iJjc8H2daJ+EEcDhD9Mq620ocTrPcjTPxhGSwgu5t0FcPpcNnX69A8KaJY7MiY5EVii0OSLQ1IAfD3pUpmBnc21GgbNx3oNVaPaKR7sc2NzNuiYMpu+yxBBdSzCMPHNTRe0LsSVmEokZA3woOH7C0M+lQSio15y+0j39edradtUYQ+d69cPgKhyesIqNUUKdPWbhL8uuRBi34Rlgif1vohTPIGjGurfNIvZTBLyOP5hHnWMyA610KB6BSJvn3FZ0lhWzx7jkJ62gL750abtRyfLbLdDrI5lmvXzf5Yyn16LDtGcHThnJjW7jnTzx52P5gnEUp1ADvRD9UIt3jzw==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 16:04:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 16:04:22 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 02 Jul 2026 12:03:58 -0400
Subject: [PATCH v7 2/8] media: subdev: Add media_async_register_subdev()
 helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-imx8qxp_pcam-v7-2-b47d9e363400@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783008245; l=8219;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=xNoxnc//pejXz1SEVveO/usrL2OM+pKKJ+r8LkZhI7M=;
 b=Cy0dBdPTaxDL+fZ67y8KlFpv7a/dP8n26CgfqKXcATu+lG+ucL6nZShQ0Nd8SAt4TTftN3koy
 /CEyBVJwBUkAeIMQ8NbkezQtbDZ/oXjm5MfDh2b8qQLIe2UZOokblwZ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0001.namprd11.prod.outlook.com
 (2603:10b6:806:d3::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7a982f-d402-4b74-4e59-08ded85394ce
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|921020|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
 CSgZuJpdAOfJzsx86bFVNNY0f0XB2JSL7bZq3IOMnBvu0P7sCtEHxHsw8evpQIU8QBMKN3mQTPUoijJVyzb9eVJqjJ3aYUEB5geiX+HtMPmJPDkFPOphJiLNM41Sq17HE8FYy2dUXI5ROJwTtPg7TH/DFB80sEtgJ/MlL7mokDxYCY1x9NFzhdwhRs67pYgvnAJrSdYf275wg/2mrFSMBRh+eZ0V/fHWkS8GyY2cj0T0MYMeoiDLCTNNw3YTvVUoqmLseW1rMJ/fFZW6h805X6THm1ARNtq9GLhqp//oj8j3mrIc7R51m/vGqFEnpjrpJ3Im9Q0/hjTEGDzRO8uNsRA1+N1FKqDBqLYsB9ovYRnT3i49h0UldYqo39KHU7CoyejoY78R+ZuxRqNhN/rlYdyO4NdsN3iKgCuklH/lHgJxsTs8dS2bS3AJsvb2RZFRhib9oHdKWQyuO4eCIUo2Bh7WMUc3LLKzm0UwoX2YCm2dqj/2lH/bWZIM5VRue22asn/UlNjqWOaD7zQgqckfxg1+12wpCIRpxb2RNwEw/h0WL4PkMam0HcVB1mYO7GmPd9+HasGFH0hii3syAQ7XRdMD0VS0/RUBSJTlrVhRKTklDEVkem1HXabyQ6ctoM7Bv1yDMblJZ65Dd/3WymDvAPoChhJyCzpDxnAQvuN+4edajeIHHP+VIzi6Em+qNSZ+ChcD3+8PaHwmp+lc7wBaQw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(921020)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SERaOFZWM0locktVbkUxQm8rTzk0aldKT2N2Z1ZJMC9ndWtINTQwSFh0ZEFX?=
 =?utf-8?B?RDMzaUY3TWVGNEZyakU3ZDB1SjFWWUN1dEowRjN5c0JTT2daRGYvZkd6djcy?=
 =?utf-8?B?QWQ2SHUxSmhETzRIaWVOaUJZeStHKytDa1dLMGkyOFJLck5KaEI1Q0VVSDJl?=
 =?utf-8?B?UzJmTGdkZUQrRTRGd2dMWVB6Tm5FeTdkOG5mb3VoUG42bWpjS2xRcDVuaWhM?=
 =?utf-8?B?b1NGY2hhMmJaaDREU1pKd1VzUWxSV3pqQnA3V3YyeW50eDMzbkV1V1N4VXBQ?=
 =?utf-8?B?S3FhaE1VSUJOcmRKYVJvNGcxVGhLMTNCT0g3VEJ6MWtaUW1sWVMrZTAxMDJO?=
 =?utf-8?B?SXpNNHdtdjU2ZTlKNHVPTnUvNTNEY2JwTmRQMWdZOU1PdzYwZXlrajhWZDZK?=
 =?utf-8?B?RitoMGRadHorYUk4Z0dYVnl5QURQVnVZb01jVlRGeVBYNUNDSTVybUNjWDF1?=
 =?utf-8?B?Q1Q4OE9NNytlSzYrQ3pIUEFIa0lscTBXZEFiRXlNT2xZNFJqaG5Jak1JTi9l?=
 =?utf-8?B?YW9oZHRGb3BPQzhhTW42elVDTkh2V0wwZExsVXZxQkZTeEd0WkVmWmUyMmt3?=
 =?utf-8?B?L3FDZzZlWVdQMk9pTTc1eHVKSkI0WnJaeXl5aWZMYmFzN1U1bENQWVZnUnJ0?=
 =?utf-8?B?cXlzSHBBaXBuOWRBazFqRUtXSlFYa3VaTXNwQmQvSFNxVU1SVzg4N3JXSDZR?=
 =?utf-8?B?d0Fha2NJaVFYOU5NcjhZdW1IMWZPM0NDeGx6dDl1RC9OTzRBUDFQV1hCbmFS?=
 =?utf-8?B?VUdWSjQwaGlIWU1tSkJvOEhJdzVEVmRWR2JPSnBPbm4yWENJUEJUd0thN09H?=
 =?utf-8?B?MVNHS3Z0Q3hWU0dTK1h0K0tuejJOcklWMG02ck9ZeUNZYzlVbURmbDQ0MHNq?=
 =?utf-8?B?dEx5dEFEQU1qdXZuR3lXVU81UlpPbVRXU1ZMNlJ0endTMGUzS1JMTU9UcjNu?=
 =?utf-8?B?TWhTVTQvWUtyZVJFSWhMczJiZXFRUlEwOU02cms0dmRZYnVTMHRRUkxEQU41?=
 =?utf-8?B?WnZtMnRMNnZ2OWYveTQ4U0JsR0JPakNuTGJLNjVVMGVQcWNXdmxyclF1OE9t?=
 =?utf-8?B?N3ZYSG1jOHJDSHN2eGRnTVZCYnZKOUFZbng3UktDaU1GSjNkRyt1WjEzVFVL?=
 =?utf-8?B?TkN4MlByTzFJOCtZaVFHV04zeHoxSnMxRWM4M1FLR1RzY1FZVFE3c3F4RHJh?=
 =?utf-8?B?aXEyek5kZU5wYmJWMXgxSUVXUVhqcFhNT3RxMmVUNC8vMXpFMDBsZGx0dW5z?=
 =?utf-8?B?dEFobGJ5a3lQa3p2Y050akRtMFdJRkI5SXJNSUZKMFphdEZ2UWk2bVYvL2VJ?=
 =?utf-8?B?VzRUYUtKNThMcU9zZVpvSk9NTEtRWmZTaXREN21oK0Uzek5ia1dUSUE0SmJk?=
 =?utf-8?B?aDREQzdEdzJaeHdRVmFvcngyenpSeU10MUo1SDMvMEhueDZLUnE5OWh6MWFR?=
 =?utf-8?B?aHRHazZhaDNPNkp1SWlvQ3pxUlY1b2RoR3d2dEZBWTIzTXFzUlFyeHBNazB6?=
 =?utf-8?B?T2w2RWhsdG5sVUtFeGwyYjRqMmp1NjdtQzVKblh5eGN4ajhjTHVJd3hCTURE?=
 =?utf-8?B?dlRDRDQ1dU8yeVBXKzB3VHdRcXRCWmhGSEZPOWxJZVUvQUtaWUlKaFBzcDNk?=
 =?utf-8?B?UFVGaWNla2pZN3FKSGV3aG5UZ1ZlaStPS0NRUFBjYWFjM2VsWVVTUGZGVWJt?=
 =?utf-8?B?dExHQm9kcE4zRUxPakgvU0RUaU1wbVgzeVJhYkVEejlCMjBJTVVnY01UZzB1?=
 =?utf-8?B?dDNIOUhaQmZ2RVRXSmZTdkI0ZTRidlZHZ3pnV211cFlWNUtqYkJQcUVEVWx1?=
 =?utf-8?B?VHVuQVJFb0VVeFFSU09TS0k5akhmNm5zeWpReTErUHZOTjFxaDZPanhjWm1F?=
 =?utf-8?B?RHdwUEk0ZW9FSGtndUlZTEZ4NjFkbTg0SzlFbEo1K0JjY1Jrb1VoQXpmL3di?=
 =?utf-8?B?dXdiVFBkdG5ZSlFXUTJOak1iSWVtZzh1NnFHeVpBYXF1cC9yb1o5VTZTOXJl?=
 =?utf-8?B?TzA4WWtBMVlrTVNMYVN2aGJPazFHSk55ckU1d0Z0VkhFeiswMWZpTFBhRnNS?=
 =?utf-8?B?ZHBKSUMvYVluLzFDZTd3VFBlMkN1NFdTV1BJRzUxa21aVlVYVGxaZllxSC9G?=
 =?utf-8?B?RklrZklHOXFqN1gyRzZ0N1RQWVhxZ0o1c1ZVQit3eFZhaE05d2R2bThMRndv?=
 =?utf-8?B?K2RnT05JcUhTZGRHR0hHR0xESCtMV2xCMW5uN2Y0VTlJQmdjZUpSbGZmMkJU?=
 =?utf-8?B?Tk1kcVZOdDRUT2dlcnZUVW9RQjg2UzFqRTBmSTZ0L3lMRXBQVXhIb2pKSTNj?=
 =?utf-8?B?ME1pOU5WTm93SS9xa0NXVVpHUGloOTFxWGw3NWRkbVJJaGJ4ZW5RZiszVS95?=
 =?utf-8?Q?/YMtlm7+I5eri4ZbQVz9oLVeWb4VlAB1688y0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7a982f-d402-4b74-4e59-08ded85394ce
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:04:22.6731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qpox+8Rmz+a/Lpppi5OKD2fV0heInJAB00VeWYgnFjAYYyAEo99sjQyem3GWMzTnIsELYpg4Tm3hVz1vWwQGiaTxegwaVWdilja9mT5P0cW5dMpeouQ7KXjmTAALyv+u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66385-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE8146FA135

From: Frank Li <Frank.Li@nxp.com>

Add media_async_register_subdev(), a helper to register a V4L2 sub-device
with the asynchronous sub-device framework.

The helper requires each port to contain a single endpoint, with port
addresses starting at 0 and increasing consecutively.

During registration it parses the firmware graph, creates media pads for
all endpoints, and registers common asynchronous notifiers for sink
endpoints. These notifiers automatically create media links when the
corresponding remote source devices become available.

The set_pad_by_ep() callback allows drivers to determine the media pad
associated with a firmware endpoint and identify whether the endpoint
represents a sink pad.

By centralizing firmware graph parsing, media pad creation, notifier
registration, and link creation, this helper reduces duplicated code and
simplifies error handling in V4L2 sub-device drivers.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v7
- don't use saved vep informaiton from media pand
- fix sashiko report problem

change in v6
- new patch
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 169 ++++++++++++++++++++++++++++++++++
 include/media/v4l2-async.h            |  39 ++++++++
 2 files changed, 208 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 62a3a452f7884..4e15adc1af065 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -26,6 +26,7 @@
 
 #include <media/v4l2-async.h>
 #include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 
 #include "v4l2-subdev-priv.h"
@@ -1302,6 +1303,174 @@ int __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *m
 }
 EXPORT_SYMBOL_GPL(__v4l2_async_register_subdev_sensor);
 
+static int v4l2_common_notifier_bound(struct v4l2_async_notifier *notifier,
+				      struct v4l2_subdev *sd,
+				      struct v4l2_async_connection *asd)
+{
+	struct media_pad *pad = NULL;
+	struct fwnode_endpoint ep;
+	int ret;
+
+	if (asd->match.type != V4L2_ASYNC_MATCH_TYPE_FWNODE)
+		return -EINVAL;
+
+	if (!asd->match.fwnode)
+		return -EINVAL;
+
+	struct fwnode_handle *remote __free(fwnode_handle) =
+		fwnode_graph_get_remote_endpoint(asd->match.fwnode);
+
+	ret = fwnode_graph_parse_endpoint(remote, &ep);
+	if (ret)
+		return -EINVAL;
+
+	for (int i = 0; i < notifier->sd->entity.num_pads; i++) {
+		if (notifier->sd->entity.pads[i].index == ep.port) {
+			pad = &notifier->sd->entity.pads[i];
+			break;
+		}
+	}
+
+	if (!pad) {
+		dev_err(notifier->sd->dev, "failed to find sink pad\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_create_fwnode_links_to_pad(sd, pad, MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(sd->dev, "failed to link source pad\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations v4l2_common_notifier_ops = {
+	.bound = v4l2_common_notifier_bound,
+};
+
+/*
+ * The only one endpoint under one port. And all ports number is continues.
+ */
+static int
+v4l2_async_nf_parse_fwnode(struct device *dev, struct media_pad *pads, u32 pads_count,
+			   struct v4l2_async_notifier *notifier)
+{
+	struct v4l2_subdev *sd = notifier->sd;
+	struct v4l2_async_connection *asd;
+	struct v4l2_fwnode_endpoint vep;
+	struct media_pad *pad;
+	int ret;
+
+	if (!sd->internal_ops || !sd->internal_ops->set_pad_by_ep)
+		return dev_err_probe(dev, -EINVAL,
+				     "Missed set_pad_by_ep() callback\n");
+	pad = pads;
+
+	fwnode_graph_for_each_endpoint_scoped(dev_fwnode(dev), ep) {
+		u32 flags;
+
+		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to parse endpoint\n");
+
+		if (vep.base.port >= pads_count)
+			return dev_err_probe(dev, -EINVAL,
+					     "port number bigger than pad number\n");
+
+		pad = pads + vep.base.port;
+
+		ret = sd->internal_ops->set_pad_by_ep(sd, pad, &vep);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Can support endpoint\n");
+
+		flags = pad->flags;
+
+		if (flags & MEDIA_PAD_FL_SOURCE)
+			continue; /* Bypass source port */
+
+		notifier->ops = &v4l2_common_notifier_ops;
+
+		asd = v4l2_async_nf_add_fwnode_remote(notifier, ep,
+						      struct v4l2_async_connection);
+		if (IS_ERR(asd))
+			return dev_err_probe(dev, PTR_ERR(asd),
+					      "failed to add notifier\n");
+	}
+
+	return 0;
+}
+
+void media_async_subdev_cleanup(struct v4l2_subdev *sd)
+{
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_async_nf_unregister(sd->subdev_notifier);
+	v4l2_async_nf_cleanup(sd->subdev_notifier);
+	kfree(sd->entity.pads);
+}
+EXPORT_SYMBOL_GPL(media_async_subdev_cleanup);
+
+int __media_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
+{
+	struct device *dev = sd->dev;
+	u32 ep_count;
+	int ret;
+
+	if (WARN_ON(!sd->dev))
+		return -ENODEV;
+
+	struct v4l2_async_notifier *notifier __free(kfree) = kzalloc_obj(*notifier);
+	if (!notifier)
+		return -ENOMEM;
+
+	v4l2_async_subdev_nf_init(notifier, sd);
+
+	ep_count = fwnode_graph_get_endpoint_count(dev_fwnode(dev),
+						   FWNODE_GRAPH_DEVICE_DISABLED);
+	if (!ep_count)
+		return dev_err_probe(dev, -EINVAL, "No connected endpoints\n");
+
+	struct media_pad *pads __free(kfree) = kzalloc_objs(struct media_pad, ep_count);
+	if (!pads)
+		return -ENOMEM;
+
+	ret = v4l2_async_nf_parse_fwnode(dev, pads, ep_count, notifier);
+	if (ret < 0)
+		goto out_cleanup;
+
+	ret = media_entity_pads_init(&sd->entity, ep_count, pads);
+	if (ret)
+		goto out_cleanup;
+
+	ret = v4l2_async_nf_register(notifier);
+	if (ret < 0)
+		goto out_cleanup;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto out_unregister;
+
+	ret = __v4l2_async_register_subdev(sd, module);
+	if (ret < 0)
+		goto out_unregister;
+
+	sd->subdev_notifier = no_free_ptr(notifier);
+	retain_and_null_ptr(pads);
+
+	return 0;
+
+out_unregister:
+	v4l2_async_nf_unregister(notifier);
+	v4l2_subdev_cleanup(sd);
+out_cleanup:
+	v4l2_async_nf_cleanup(notifier);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(__media_async_register_subdev);
+
 MODULE_DESCRIPTION("V4L2 fwnode binding parsing library");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 54a2d9620ed5b..ca41820f776c5 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -345,4 +345,43 @@ __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *modul
  * @sd: pointer to &struct v4l2_subdev
  */
 void v4l2_async_unregister_subdev(struct v4l2_subdev *sd);
+
+enum v4l2_subdev_1to1_pads {
+	V4L2_SUBDEV_1TO1_PADS_SINK,
+	V4L2_SUBDEV_1TO1_PADS_SOURCE,
+	V4L2_SUBDEV_1TO1_PADS_TOTAL,
+};
+
+/**
+ * media_async_register_subdev - registers a sub-device to the asynchronous
+ *				 sub-device framework and parse set up common
+ *				 related devices
+ *
+ * @sd: pointer to struct &v4l2_subdev
+ *
+ * Register a V4L2 sub-device with the asynchronous sub-device framework.
+ * In addition to v4l2_async_register_subdev(), this function parses the
+ * firmware graph, creates media pads for the endpoints, and registers common
+ * notifiers to create media links between connected devices.
+ *
+ * This function also init media_pads.
+ *
+ * The sub-device is unregistered and cleanup by media_async_subdev_cleanup()
+ *
+ * While registered, the subdev module is marked as in-use.
+ *
+ * An error is returned if the module is no longer loaded on any attempts
+ * to register it.
+ */
+#define media_async_register_subdev(sd_1to1) \
+	 __media_async_register_subdev(sd_1to1, THIS_MODULE)
+
+int __media_async_register_subdev(struct v4l2_subdev *sd_1to1, struct module *module);
+
+/**
+ * media_async_subdev_cleanup - unregistered and cleanup subdev and media pads
+ * @sd_1to1: pointer to struct &v4l2_subdev_1to1
+ */
+void media_async_subdev_cleanup(struct v4l2_subdev *sd_1to1);
+
 #endif

-- 
2.43.0


