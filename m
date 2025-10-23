Return-Path: <linux-media+bounces-45354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4983C00353
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4B0A8359331
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 09:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB46302745;
	Thu, 23 Oct 2025 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D9RND69r"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFBF2FFDE2;
	Thu, 23 Oct 2025 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211175; cv=fail; b=hAOhZrMfjpkzZ/0wscBqGk8l4U3NOfRAl7M/JUmXbwJ2OEDoLQ66V3tmu17D4do+oiYr0Cg6DSLte8i5Yc9S5LHs875xy9w/IMqIKYXiJN0KVkhoNAOZhWb2q5ytmnZhU3XQB8RJ7FoSolT0GsRUo/S7jIualDna1vg1GgV064A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211175; c=relaxed/simple;
	bh=YVr3fqOlpsBgVl/d5UZLnojIrLndUPE9rfd+gQtUbuU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ewvjD19KmL3aoeKOiwpiR6WqLpWnGDKbSSLhjO8pW77D0bjGbIgH7KQb7lt29qo8VveEjpBXl6yhimwmwkYbAB/FVdgFWgAPRezj0p2NGjiSdXZoVaDh+Ec6iE6SkRkr0Dwca58iNTw1pONW72d6Cci6qJEtGUPk7xFfx0c0rsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D9RND69r; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ijn9jO1K4MeKYmMraYylG1c5CWu1qSNNbqjvFw0d+kv1CjNcmOQ64CfzNx1lQ0uc+TWKwcbkE2ozvIvNwlWymrVDq4qOlKFjqTIdh+yeoPN5HiJdnLB7PAk+yD8cmbudEw6gB+9tWF7XphIvtFTzA0VKDrDxebnnBWeVlo8ekEFFabS6yHiBmfYGYzFtIikiv1Uy1ZtDVz5hOBuyYl6bojuikdfAv9HhTlAK7LXDyrKKRbB6dXBSb/mYTatachjhJcaesEQ93h1ChPxCgiwwsUrAwnTYfc+oNy7V3RKxqzynsAia+ChsnNrtgffGFO4UCPyPFeT1Quns6VwQ8IbVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ppjog+mOeSq4ozW0qTTJ503opcoAlgIlM1nlHJJfu48=;
 b=rR9do/CMu2OuWND+wTRwMhMAJoFlqLVqNUbzhTsb/4rA6Z3ktKf0dECCZIwMYxoz1Y3rpjteL2e6l/FnanOWdMc1O3ixprTeRToRnfLZ1tOSBPWl5YQBlnNlChFy/fsvZRg0RUPPsdvbyc9r+Gjo3bspEdeg/9T15B5L4OzmpBhPWCzJFLMxr6mZWvsq2OYMLQbocCv9URg7ddp3ILl1vOmoNmAJrvIRJmkq0GW1A22hPo9VMqXYFBOY2ewZpDdofnCr473sFtTadbYrszwGYEjC+mZI+jaA4Jm041LsbilIRmgWAteeyz5nIVDse7fl6ASim5fLXqpJYca7t3UOog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ppjog+mOeSq4ozW0qTTJ503opcoAlgIlM1nlHJJfu48=;
 b=D9RND69rke8URt14mb3Wd5i4J/jci0qXh2WpvPQkyBZG+bkAYFHLuIQhCDk2aRIPptd5bZ84F5tzdUMoGJYccS9hp3JQxL7qYPZEcCRyn/2Lsl3D4XTaAqxMyySiLFr18gM5uo6TGHvqfdacSWmYDgZXkZ5n+JEZQg9xuzEj4OhRoTb1FFqpSAD6Q5Rr7QfW8hnFK011zMZ0uca37L2A5hhfiAwrmzH0Bsz6yVC00wYtCn+guw9kaUZ2R2mXSb15Q+a7WHFcwWUac6TIUECVg3uoAPPD4Vl3AiHzGuK7xKEgdGT86HBNlfQITF3S+5S9oCIIZHIAB4BoV7Q8QjnHNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:20b:44e::21)
 by PA1PR04MB10556.eurprd04.prod.outlook.com (2603:10a6:102:48e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:19:30 +0000
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798]) by AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 09:19:30 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Oct 2025 17:19:42 +0800
Subject: [PATCH v7 1/5] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-csi2_imx8ulp-v7-1-5ecb081ce79b@nxp.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
In-Reply-To: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761211202; l=2934;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=z5WnucQVO/HatQGedaSyW+LSLwijEVjBxdDK3NKDcGo=;
 b=/3IHS/6qadpGbJiPtNRl8Tc5lXNPgqShBZw2b9hE695QOi+ZS5Fvzisqht9DNR7h60vgvR2xp
 FDTI370Jdi/D3MJ/0H3gnL6hQ3T730zXsI445nWRlk8Xr0OrrXPCFMM
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To AS8SPRMB0023.eurprd04.prod.outlook.com
 (2603:10a6:20b:44e::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8SPRMB0023:EE_|PA1PR04MB10556:EE_
X-MS-Office365-Filtering-Correlation-Id: 09066115-0a7b-43ac-42ca-08de1215457c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QURZdW5kQ0grWmlzQm5LaHZvdHZJbDVPZzZTOXlXeXkrT1NwSTFQcmtFMS9P?=
 =?utf-8?B?VThyWHVlMUlYZllOUjNyWHNUTTJBajlHb0c3RVIrVHlKQk5tVlFJeWdlVjl0?=
 =?utf-8?B?MXdxUGdLQXlscjdhNC83ZW16Rm1hQmRhWU9XTWNkL055RWVVMEFjV1Irc0FS?=
 =?utf-8?B?K0FWU1BtSGZWSG1LYkE4LzQxTTVRS3plNENLWWVaQjBDZDhzQ01YRmZSYjhm?=
 =?utf-8?B?eTlsaGQ3VTJkNHVHZC9yZDNpd3FXdlpmMi9qWEV1dnFHRUJ6RytKanhnTmJm?=
 =?utf-8?B?eWFlQVZpaTU0bkFXeWpyaC9CNmZDNjVkZnBHbTZITHRtMU93UVFUR05nSTVG?=
 =?utf-8?B?ckNrQkZhbDFIOVZtRXQ4TkozejQrcmNQZHI2ZUJCTEFsaTNhTHlyOHdvMDJI?=
 =?utf-8?B?ekZwL3U0WnVYdHpPQytnd0NnQXJFdkYrUEYrNmNiVVJ6RW1CQjB5Qlg2aEQz?=
 =?utf-8?B?VjBwb08vWFVINEIwOWo3cmNra3k5YU4vRitBZ1AzL0FhblBUWUJJdmVkMlM4?=
 =?utf-8?B?d3EzcUN4NkRyM25xR1JxbHJUaUt1N1VjRzZiSWpFM0p5T2djemFHRjROZlJ2?=
 =?utf-8?B?NVpSbWZSUDlNYUlSWEtMbm02Vi93S0NqOHM1MCtLcXJQUkxqTUt4dUpPay8z?=
 =?utf-8?B?SXhhR3ArTkRLY29kN2JORWNpU1U5a3ZOTXBRczBhYmJhTXg4TjdsTFpFNzBo?=
 =?utf-8?B?M1dwMTg3UVhUU25mL1VxTUs4bVVYYUJyaXlLd2lwTXdlUGxLK1k0eFkxaWpE?=
 =?utf-8?B?OUNjWXAvYkdFQy9jeUQ2M014aGtHZmQ5a1Nqa3FRZ1YwQ2hodXRZbG5XTnJD?=
 =?utf-8?B?NUE1ZXFIREtaUnV0NXhRaThGL1o2aStHM0VIQ1lMSGN1SGg0L2hvVmROaVc4?=
 =?utf-8?B?OENieEdwWCttNTJHWXYwTlZTeWIvK2NrdVExZGoyZ2FYZmlnKzBxNFlxR3Rk?=
 =?utf-8?B?VHNBNSsvRXg4Ry8wWmJYeXFGamFJeTFvME9LOE5xK2p5ZUZsQkxvdHozMjJp?=
 =?utf-8?B?WEhJVWN1SnRPRGR5Ris1aXJEeHArbkZyQmd1dE5SaWVwbXpyTTNXUTlGbGl4?=
 =?utf-8?B?NEpqVUN2aktGTUNoRm1mbmJZRmduUVNrOEpCSk1TaEpsV2sxYzhrOG5UNVR0?=
 =?utf-8?B?OUJWYUwvR1poS1pCUmxGRTJnUkMzVEIrTUt1V0hXVlliUTByOXR5bS8yK1Y1?=
 =?utf-8?B?Sit5N0RhZVdabmt1OFVJZG9nWkQ1cFEyeWMwSWFVQ2ZueW1lbHh0bS9td0dL?=
 =?utf-8?B?T3VML2JJdDBxc0ZNR1UvVm5qV1VBeVk5LzM2WUhUeVp3QW11VlJ1TzRPZzN1?=
 =?utf-8?B?Z2JQMDVTSGkxVGRYa2l0WDkvNVNSMnRlWWh0cGxKRGFCdnNhcURzbXQvWGtx?=
 =?utf-8?B?Qk9mcWN6WXEyUzV5UElRSXhTRHdQLzRKa0hUU2JnUTR1cmRTcytVbVdHYTUw?=
 =?utf-8?B?UWtpZFBlQnowbU12clcySHduTFA0YVgyS0dlUXQvdDl2ZmQzNUFuUitlQ3I0?=
 =?utf-8?B?ckVEZlFVcWNERE5DRDhsdVdEZmhtRG5YalV6OURmR0RUT0N5TkY4aUFYK2ps?=
 =?utf-8?B?aUxlOTVWUjhFTHBwWWwxaVZtL1Z2VjRjZ2gyK1JaUitlT1h2Y0h5a1hZRFVF?=
 =?utf-8?B?RXhzdFdSZGRuMEk2MnU2bGFoNUpDUlRkSUoxZWxlNjZ3eUxlL1VydXJIWTZL?=
 =?utf-8?B?M0s2TzRzbDJiRHREVHpsRnQ4WXVSK3lQNmJzRDJXRWFleE9sUndxdzdnR3Jw?=
 =?utf-8?B?Y2NBSUYvblppWjFFUnZRMnJlU0puQzFVN2dyV1B1MEd3MnBQZjdybEVrNjlo?=
 =?utf-8?B?NmhCWWlsUjUwdytyK2VNZkR4VkpSWnR5cmpoNGdUT25pQ3VqNmk1ZmU3dVZt?=
 =?utf-8?B?V3JBaVVoekpFMkhXQnRvbUd2UWIxWnFyd0hFNm5qY1llcmhMY1JaOENLZGpB?=
 =?utf-8?B?RXNxNGQwSU81c00zbEZrU0ZvN1FOY2lVUUx3NDQxUmFiQlBPQ0ZDMmFnVkJN?=
 =?utf-8?B?L21QcTVoYU1OS3VoUmtieDlZQy9mZDJGK1Q2YzBhZnlpbVhidVlSL3o3eVBE?=
 =?utf-8?B?UGJrZEpVL0N0SjVqK3F4SFZaSWgycDNKdGlBQT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UUZnVDJqdGFEcmJndFBDL1VIVTN2cFdxaVUrdGZ3MytIeWNOVVM2WWVuWm9i?=
 =?utf-8?B?Mzh6b2FseTNPTUU4cklzSVBPV2hiTWpLUjlZZVBpaXpQcEZKc0lRRW44SHdm?=
 =?utf-8?B?ZS9oVEQ4TXBVNktSdmZ1WWZnU1RHbW9zcDg3VTlPTE1aSEwyb2FZWkx5SGt4?=
 =?utf-8?B?VW9VMkJpSDdRNm5LeDZjZFhWSzFCc2N2NkI3K0RCS0VJQit4dnhDZFQvcTZa?=
 =?utf-8?B?ZnROc21zbXAzczcrMlRudERjVzhWaXppeExtd2FTNlh1YUJiQWIyVHhmeTVE?=
 =?utf-8?B?SU9BeGNPSzZHYXNnS0txZEQwNFVMRllLMXJlSjJRVE5qeldmQTBHdGxIaElU?=
 =?utf-8?B?M0d3K05KSlY3SlF3anBYM1pFa3MyYmo5bXQ4SjFyN1BLWVNaUjBqSG45WUZi?=
 =?utf-8?B?bDVGVWtiMmdaVnZzMnVCdEJZYmRESXFuL0sxakZUcE85TGIwOEhnZUVteGU2?=
 =?utf-8?B?UkVVWlVEMjdTNzFrT2E5aVMvY2pBcU5panJpczluL0x6Ti8zU1lXeDZiUUs0?=
 =?utf-8?B?emJjUlpqd1ZPY0ZGRlk5d2pVRWNrdUFNZStidmNldm1tc1JlN2tjemlDK0ZN?=
 =?utf-8?B?bDJaOGxPb0k3UFFkeGNoQ1dnREhXZEtCKy9LODlnblVYNkp4OVNzKzhvZTlU?=
 =?utf-8?B?Z1M2S2kycnBSZXFRNGs4NW1vbldXUEZYWHFtekgzTFhWOGxQMCtQWUwwR2E3?=
 =?utf-8?B?ZWtMTDR0aFk3dFFwbDlNaDF3b25HTHNQOEkrVytURC9zd0J6dGVyOXhvY0dY?=
 =?utf-8?B?RlEwMEhhQXBFUVRYQWpWR3REOFVDSW9zUlNzYVI4K0Y4UnlNQ3k3ak1lR1VP?=
 =?utf-8?B?Qmc1NWNoRWxnalc1ZkZkTzJlMC9YUmNYYlpZZlRIMktINzVReVNvbXVMZ0Ix?=
 =?utf-8?B?ZG5ubHV6VEw4TzB4QlgvS2VIQ2h2Q0F2RGVtMXN2MWxQQjFNUkFiTmEwNVFN?=
 =?utf-8?B?Ylg4RFV4TEs4SG5uVDE0bEhYME9mVkxKVnNPUlE4SHVKMzI0b3BKaFgyckFt?=
 =?utf-8?B?ZjFwYjNYVWcrVkt2R1RXZjBZc0tQWndxM1EzZFY5SWpsNllmN3hKZjh1Nmp1?=
 =?utf-8?B?b1M0RnBXeWZRbjB1OVF5K29xaHVQWDRuVkdkbjEzY1lIV1lYaXRmVDNVRTdS?=
 =?utf-8?B?NXNseWpiMXNwSHNZbHRTTkc2QW5CeU5ReVhRNmI2TDBlWTZlcmtYZ0FiY1lj?=
 =?utf-8?B?dVZXa3A1amZndmkvbmR1MG1KUDh2WXdDSy9QYUxTcmhYZjFtbXVpaDU4Zncx?=
 =?utf-8?B?WUR0QXI1YUtlR3d3UzNNT3ZzeDZrVVFGR1dJRlBVN2hCNW1ld29yMXNmdE5a?=
 =?utf-8?B?cjZERjJvUERSOHdzWDZKTDNVVE93T3FLQ2UwUy95Smp0cG1OeVp3MWw0WHFq?=
 =?utf-8?B?ckt1MzRBSVhVQ3BpWnhOMms5SU81YTZwblo5R3ByTVlUNlp0WVZOYlNoNm5B?=
 =?utf-8?B?RTBranAxbTVTT3M2L2NpbHpZZDJUOUM2Q09nZW1FVzdMUkE4dFFrcGorbS9x?=
 =?utf-8?B?RkMxZXVncUhyT3N6YWhKRUN6SXBuTkFNTm9kVHJLOTVmZXg5R2JBdXF6RUcy?=
 =?utf-8?B?LzdzNWwvaFdaanYxSTZ3NTZsVEQ0QysxUXdUKzIrcnhIYkxaQUczMkw4SGVk?=
 =?utf-8?B?YkowSFZsQ2ZrMWM0TjJ2QVBPYzFIRXdvMTV4Yy9sUHdnc1k3eVBwVmpHTG1l?=
 =?utf-8?B?dGJFc2pPcmw3SStBc0IxM0RFc2pjeU4vOGlCOUpwUlFza0JCODZNdklHREdQ?=
 =?utf-8?B?VmFFTkhlRTFkVGtGWUg4NEpFUjdxSktwODdDZnRjVGNSVDhQanhXNXJlL2Vo?=
 =?utf-8?B?SWg1cUt4cWRFUHRkNDA2bUduZE4wVlFWMFRRVXdzZzVYVjJIN2RsbEZJT01I?=
 =?utf-8?B?ZWFDdWJnYkk3UkJwMDNZcDQ2VVArNWJVWVUxZEpXZnhpcmx4MDRsUDNrZ2Rj?=
 =?utf-8?B?ZFRzaTJNQ2Jjd2FXT0hxelgrclhhV2RJMWxMc1BqWlNlV2FvRzE5cEtmU0Fi?=
 =?utf-8?B?cjZDS2ljR2M1Q3F2YURUcHE1SWg2Z1Z4L0ZCRVl6aCtwMmkrMkRDNFR1cCt6?=
 =?utf-8?B?ZjU3Q1ZJc0FSYVd2VTNWbHBQdkFiSjJYTzU4a1hUWXM3ek5HT0t3UklWWlJH?=
 =?utf-8?Q?bFQi8IKiywaS5x6J+QNXva55G?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09066115-0a7b-43ac-42ca-08de1215457c
X-MS-Exchange-CrossTenant-AuthSource: AS8SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:19:30.3715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPsrqKz+qzqxSPGuxq0wVDOiypBMDNGoK822nMIP4LVohjtrqRVebgMKJ679HVYYEPgMg/rIHKp0GK+JAKCSng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10556

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 receiver in the i.MX8ULP is almost identical to the version
present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
clock as the input clock for its APB interface of Control and Status
register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
same restriction for existing compatible.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 41 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 3389bab266a9adbda313c8ad795b998641df12f3..da3978da1cab75292ada3f24837443f7f4ab6418 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - fsl,imx8mq-mipi-csi2
           - fsl,imx8qxp-mipi-csi2
+          - fsl,imx8ulp-mipi-csi2
       - items:
           - const: fsl,imx8qm-mipi-csi2
           - const: fsl,imx8qxp-mipi-csi2
@@ -39,12 +40,16 @@ properties:
                      clock that the RX DPHY receives.
       - description: ui is the pixel clock (phy_ref up to 333Mhz).
                      See the reference manual for details.
+      - description: pclk is clock for csr APB interface.
+    minItems: 3
 
   clock-names:
     items:
       - const: core
       - const: esc
       - const: ui
+      - const: pclk
+    minItems: 3
 
   power-domains:
     maxItems: 1
@@ -130,19 +135,51 @@ allOf:
         compatible:
           contains:
             enum:
-              - fsl,imx8qxp-mipi-csi2
+              - fsl,imx8ulp-mipi-csi2
+    then:
+      properties:
+        reg:
+          minItems: 2
+        resets:
+          minItems: 2
+          maxItems: 2
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qxp-mipi-csi2
     then:
       properties:
         reg:
           minItems: 2
         resets:
           maxItems: 1
-    else:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8mq-mipi-csi2
+    then:
       properties:
         reg:
           maxItems: 1
         resets:
           minItems: 3
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
       required:
         - fsl,mipi-phy-gpr
 

-- 
2.34.1


