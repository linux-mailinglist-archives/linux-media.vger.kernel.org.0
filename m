Return-Path: <linux-media+bounces-29686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD36A81807
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC26B449803
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3282580E4;
	Tue,  8 Apr 2025 21:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b3GFbAEC"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2080.outbound.protection.outlook.com [40.107.247.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A9D257ADE;
	Tue,  8 Apr 2025 21:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149271; cv=fail; b=W1nTu5cmmrRLKufdWa0uI5BdWTwIxmyxhcCfCK8Y0DN4OEpp5fvsXwV9NWdrxDaw68vlR1prDicbb3OWwIs0KX49KZEY24U8GqHg4NgrEGXyaTv8J3IRlcKEvpQxE/nFOkeCgKWqEOvfp8UA5R1VJt4btpUpmBNcgMwiBaurnxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149271; c=relaxed/simple;
	bh=gT7TQyKgYZuetnnl6gwDMCC6/lEUHqBeUXW9L55spUc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GigCeQYERfy5Og1DtFtfTRDGV9tkTczVWbunma2kXWNvFpktU9gbGIbHgdmo1k2TVI/VgQaETO/ttMR2Ttme2oW5GgVqa8EwfKM4N0LQ2SI/difuLRhOgZKV5wZgOvKs+QONeanCaQr+eomAkjKAdSY7pJQy13YACuYw6UkrWPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b3GFbAEC; arc=fail smtp.client-ip=40.107.247.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZU2PHPOqJmAtPPmKqkypyk0rAlX/EsmE2p6/xetMqqU9dOYD/iUovDjqhdg0edz/TLGgBrkpZBQKAvcWoP49qEJNp7JPYcny0a1t4I/W4KRlBf4Q8QJG3pI0GaMdnrAF2JmFio72vWABbMu9+dfLTc2poPEunKEJ2bDoQRgvteQqVsh21kci2cHzsnxOob+q3gqarVCiwCP+sXmIvZlb/el9yZ5PvNR2tNIGTEo4em5xL5/+Q6NzCixK+1T0LzIr0didDQ9TB6rDoDeIJFqY3CBKwPLdr03EKnCart96/+eHWxqjseD/ELGmSyGUgKEKLwFwgFWNTCGQH2K0i05xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0njBYaDqHi0STH6HD1Pn6JF8CKUVA1NbQ/MTWrJq4Io=;
 b=uAjtBfdIGP0Zt6+AlZJ35SMm4Htby+pnJooMvd7Bg3aW8YcLnPPfPU1XtOwrP8rqAaD8BXvQONTkYj724y2d9tK5ZaRdHEUo9oZVmN54YCxSzBBMWjuDKZ5WvytZK1AdrOO5S8XYSBsVPQxLDfAhRq3HWGyapXLrICGJUoSlQAGyzUQ+4S+Jxu6sPUBUCNNXuK4DIgwIK8sr6hy5km267v9qgJvC66w0RMX88q3drRUxq1lQyCZW36X/4zypXmZtyMU4WPDEeUil6fJT8RfZerDBPpDZ94qMzu98276zRMUp/7AOK6SjpZUUwaLROXX3aDKjmF4WHRBA9TySwLuvDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0njBYaDqHi0STH6HD1Pn6JF8CKUVA1NbQ/MTWrJq4Io=;
 b=b3GFbAECyGYAPm1ghdX499w/zNBKuyiv5+IOBfdgvt81V4Mii2NrkrizO+Zbx2H9ybyz6fgKPQP59N6OuCthmvGvVW041A+J6VpaWFWEm9nt0Zwv6gQjtqU0kPwZ5tOLfQuXAfLcfSti0J3k7VGCgyaH7s+fpXEgWNBb+QxXc6VMzZeDZ4E8WrszWzWOZwAgrrY0sfuFyhL4bH+0epTChVIkv6tWUyeSv1lZY2f6ySUi0rhQ55mf7tp7r/N4RA3cSUBbxQr4ifOhZV7Qvl+5d4XkBA54KQcYew1l4RBR5WdmRTeEGHNCd5pBMtHOCqwJJk4P7lAGffvw24eGUhfW7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:54:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:54:27 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Apr 2025 17:53:06 -0400
Subject: [PATCH v4 08/13] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8QM(QXP) compatible strings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-8qxp_camera-v4-8-ef695f1b47c4@nxp.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
In-Reply-To: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=2959;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=rNuCdUc5m2jz4Pb3frjMkhoKTZ+8o8wBPm05WwQ2lJs=;
 b=kRErM+hYLJgap+J4w4k5MHS/ajaEeBgtqECyyo14IK4tQ3m66nfC8nJJr59KzjgoOmWpfroEW
 CuBr7dsjp2UAKZAO+rulVdAHMEIzGm9bYNPgPGdV4aQNS9skJZvE6Mb
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:510:2da::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c75894-e619-4c27-8856-08dd76e7eec7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eThvOFMySzUvZm5VZDZCOVplOTF4SlZsQzJwV0JLY1JjMzM1TVJERmFKTnlN?=
 =?utf-8?B?cFhpanBaOU1pTldnOUVXWGNwRWRHVDE1SEFZL01qZUNOS3cwZlF5VGFIQmg3?=
 =?utf-8?B?aVZveE9KY0xFZEZxNW9pdEgrd0IyRmdmT1IrYmpIRE9NbE9hcWZlZjZxaWFP?=
 =?utf-8?B?OXhkQUJLQ3pWOFJETHNWYUQ5NXcveGdGUzlOYjk0WFVOc1c2a1VZUVYreXNO?=
 =?utf-8?B?bmNHeitVem13QnNkLzdwS0xIRiswTFhCRkxHUTc5RVZVcFF2am5iRW1wVFZN?=
 =?utf-8?B?N2dVUnZRQytrOEZuRVVmcUluTXlwUzJyaGFXMW9XNU9NN2NpRUhzK2YwdVZn?=
 =?utf-8?B?NFdCYTRJRW1BaUdIYWhsVFUwRTNpUUoySFcrYU44ZVBIQlIyWTNoaGNPRU01?=
 =?utf-8?B?SWJMajZWeFVLUXlua1lkdTRPZ2lvL3R1R1Mwa0d0OW1GQVptMEhtei9DcjNn?=
 =?utf-8?B?bVdreE0zNG9iUjJpK0l3UnU1N2NWcWg4U1RMbjg5cnMrejlvMlBwd2hnaU5F?=
 =?utf-8?B?NkpIZUhJbk03YmEycGd6dWFpWnNneE5NS1Z5Q1hIWUREZzhvSDdIZlUrRTZK?=
 =?utf-8?B?aThPYThJeGUyT2lIT2NmeDMxc3ZkYTZsTzRCenFXamRxcUN0ekhBRFdVeml2?=
 =?utf-8?B?Ti9DTm4yQmNrd256YitTblNBcjNnTVViT2QzRi9MeW9sZHIvUDR5UC9TZHJX?=
 =?utf-8?B?dnZMdWNFdERXVnMxSHlsSEpGa2dqS3FIUnA2cklIS25jbS8yN043cWs4bG50?=
 =?utf-8?B?NS8wcGZSalVFRFlYU1JmenlRckVzQ0hxNWRLK2srMSt5Y3RoRmwyWlA2ZEU4?=
 =?utf-8?B?ZWlTYm9OTkg1L0hvUnRwNklyRWZ4ZDR5bG1rZDVla3ZjemZaQk1LOEZteWZw?=
 =?utf-8?B?bG83YktTeGlEM3ZVZms2bGJNL2VtUjU4dkd3ZkxyUHAxVkZWMllkNUY1QVRi?=
 =?utf-8?B?enpvbTlPcXBZRVp2UUdObVdYOFE2Z0ppWFMxM0FCS3NySlYza0VFMk5zMFpY?=
 =?utf-8?B?S0J4bVBCZ2lQOGxNcHN5VG16Q3hZeGpiN2lrRmt0bml3QmxtV0VGYXlKdnNt?=
 =?utf-8?B?MVF6MitnQnlFeTNXdHZhNUdlWnRIY2pNRFJ1Qm9OaTdPUUFDTlJSdGIvei9Y?=
 =?utf-8?B?ajVXTFYrdlhCaGx0emZxbW12anB1RGo4STNhY0NVckxVZHM5RmQvMTlURS81?=
 =?utf-8?B?eEtHUzBuVm50VU5jNWFxMWJPNldDL2lsckNjb0lJN1BObWpHbEZBRU1CTkYx?=
 =?utf-8?B?bHZUQ1hwVUMrSHZRVSthRHpPYXNveVNDSlNMTEMvRjNxcU5mcWFLSGVaak9o?=
 =?utf-8?B?YjFhK1FVQlBHMHczOUphYWZLSWVyTGZYOEJwNTczSHVhcm45aHcxbTdEZGE5?=
 =?utf-8?B?STZ0VlRYUnh4QmJKb3FMR0pkNmRWUUZ6S3VvT3RydE1QSFUvQXNYUUo2SUZ0?=
 =?utf-8?B?dFZYVGdPZm52QWR4RlphUXFOcCsxUUd2VFg2UkU5ZFkwT2pPckFkU1gyejZX?=
 =?utf-8?B?OVU5bFVaWGNWc3hIc1hHdTRlejJEVEtNdkN2ZEVFcms5NGlkbzZtZWJPcXFF?=
 =?utf-8?B?ZVg5SDVlTG9HQ1VHdFJHKzFBYjFDSmVhUG1MbENQSHRsdlYxMTJqV09lWFI2?=
 =?utf-8?B?dWFDNEZLaFR2cEx2SWFra0hVWkZpQ09QdjFRYjZCNlJtaU02MElGMURYaFdu?=
 =?utf-8?B?UzhnVnJGdUF1UWhHaisxSVdLckR2Y05aSm5iSWJvRUtPbDZBdG4xTEg1UGJq?=
 =?utf-8?B?Ym8waTZUS1JzRUF4QUpSYXRMTlROK25XcE9mWmxYc3dxbDlZYWErcjJ1WUdO?=
 =?utf-8?B?aktCMUdVeUZ5eEhsZ1luVFVLMm4rbE1YOU1raVpSTjM2OE1pMmtVSkV1end3?=
 =?utf-8?B?em5IdG9vMXNVWlUyU3FZRENQYXhkeEpzeWFlMjR0d3NTVVg5YXZGSnF1Z1BF?=
 =?utf-8?B?V3lDL05mcFZjL0Z1dnBlc0tMMEU3VWdFYnBTWGllSXZDcXRaYTlEYnp3Sm5Q?=
 =?utf-8?B?Z2R2dWVFY3V3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RTVwR1VYbit3ZkJ2RjdDSnlZclU5VEhvL0thdWlXVGxzbmJlbkhXRG5KMENS?=
 =?utf-8?B?RHRKU25ZUlNQaDZKcG1NZGVjdzhiQVM5VHlvUkwvZ0p4Z0dIUmMrMXVuSi9y?=
 =?utf-8?B?amxKSXBDTElKeWxJQklTbjNTSGUwRkcwcVI4OUsrbFVZcFZEMmk1MnZJSFJs?=
 =?utf-8?B?OW4rNG5FdVNRcy9jM3JUcDd4Um1EeExZdnpMdnVqT0hWWmZNMnJnL2h3OEZ5?=
 =?utf-8?B?Wmt5bERKOUZwdHd5eFhENkE5MkV5VWZ5RFBacXFUZzVBTEZjSE1zSzBUQ1kv?=
 =?utf-8?B?Sjh4YjRBQVlxYTU1S0hrcHZNTUZLdHBlcnQzTit1NGkyU3JJV0w0RVFlaWcv?=
 =?utf-8?B?RFJnZkdQOUVPQVpSVE5EUlR5M1UvM3dudmJ6WVdMNnZQVzMyTWk5NU84TUlk?=
 =?utf-8?B?UzJJbnJiUUM0VEM4VWNaZHdQWndNVmhBTWFnZ0F0SzFsY2swWjc5VHNVeG1K?=
 =?utf-8?B?MVZiRGM3Nm41RExHZ2RONndPSkJnNWlVdXJKeDU2NVNRVWxWLzM0VSsrZGw2?=
 =?utf-8?B?bllxRFpwQm5TVkpjaWpHUzRVNERyc2lBcmMrVUpxN3dUc3IxWUFUR3YvT1l4?=
 =?utf-8?B?amdYd0NFUDk4a1Q5amxKSUlkZm9vSHYxK3FsMWE3MnFkRWlHZWtEalNFQlgz?=
 =?utf-8?B?a2dXdENXS2d4VHJEZDM4WjQxZy9YYzAzRHR3bWlFdHl2Smd5cXVvSGhXbXYr?=
 =?utf-8?B?Y2ViczBYQUxSWS9OR2ZMb0RZK3dkcFVFZ2crRHM2RG9DU3Rqc0VxOVUzSHBk?=
 =?utf-8?B?KysvT3dCa2hDMzBtTENRbTJ4T3ZNcXNHalQrNCtsN3A1bHNuN2ZWMkNPeVJ4?=
 =?utf-8?B?VWJFZGVzY2FCSFhnTXpvMythSmhzK2ZzcmlJa1BlUERraEtSMlZPT3kyaUFn?=
 =?utf-8?B?S0VSOEM0K0lzQ0RiQzBnQzA5d1YwenI1ckJ5WlB6SUhmR3AxWWZaZGRmTXlr?=
 =?utf-8?B?S085bTNMNTB2czBUWTdTODFlTUx4d21ldVBBcnIzU3lBVy9kM1FqK1NLbDNl?=
 =?utf-8?B?REhZRk9sMFlkUVJDYUdXR3UzTWMzYUhFTDFubWp0MU84WHdWQkpSazBZbUcy?=
 =?utf-8?B?azQ4VlQ3M1YzUDdrVUx5eWh0QnVGYzZYYjBqMUFBR0M2RFhpVDRmbFh6b3J5?=
 =?utf-8?B?aEpKZEJTcXpmTlhMa1Q0QVgwb2ZXalNUMStJK1ZNOEF6alc1UHVDOFhjK2xT?=
 =?utf-8?B?aWVZQUk4b0UrVXQrYVlweUk2TlBTSjVncE00elRqVHd2a0F6S2ErRDBEV2hG?=
 =?utf-8?B?bDdPUEVTSldIZlM5SmVmVTRlNEtUaXZnVmFnT2FiNDNrMnlkazZRUHg0bDlF?=
 =?utf-8?B?K2pXNWVCVWdCUHlRU0lENDgvUkFCUW9sRTl1eXJSUzZkNmNtSllUZElZaHhx?=
 =?utf-8?B?Q3BENVJvbzh5WXRkZjRiazZIRXErcUprb1BwWjJuLzN2TDZ6dlVlMjQ0SjFo?=
 =?utf-8?B?czhzWkhlaTRUS0ZtZjlteHhmdk9jeEF2K1dTSnZlZ0pFRkhDS1UwNWpBWUVj?=
 =?utf-8?B?b1I1SlFvWG0xM29mbWwvYTlyWnVnSEV5RzdhaitiVHNkTDRpUGEyelI0c0Q1?=
 =?utf-8?B?RmJXREJnWGtWN0kzQTVCRTRpN1pNUCtMWEtsbzlrUjZRTktLNEg5bjdMREJB?=
 =?utf-8?B?aitZbDgxS0c3VlYxRlZVQnBIR3ByNkY2RlR0MXR1S093QU9YMGtGK2xxNGU0?=
 =?utf-8?B?bFhqZy95ZXVtSUVyWHNHVU96N2FCc1VnQkJEOTJEUFB5dmh1WWhyWFE0OVFP?=
 =?utf-8?B?ZXZpU2k3VXpiclNjTXVQbzlOUVFENTc3ZFdaaFN0Wm9KVG1ua0ZweU4xeFBM?=
 =?utf-8?B?L2ovNDhLQjZjeGg5Qi9GMlMrWUxYR3o2bjlDRTZ6UW9meFArR1VDcFgzVzda?=
 =?utf-8?B?ZEtrVzE2azFWKytqdlNGL0tKWTF1Q1J2a01zQTVWamFFVlJUNnh2NkwvaDJt?=
 =?utf-8?B?VkluNktDWTRabldZYXN1ckY4T1Y3SzFKUEppSkE2aFB4OUtrOVVlUkJubFUz?=
 =?utf-8?B?aEFGQURSVTVISVhOY1BiejV4czBweFkvZ0c4MmNuZU5sMHBCaEdQQlJFSVow?=
 =?utf-8?B?QU5XRm1iVlJqaFlLZ3FLY2d6R1pORlZuVHp6WHJ5ZjhxT05hd2djaERTU0pW?=
 =?utf-8?Q?v9xoNNrrhzJabrRdMKGnkeJBy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c75894-e619-4c27-8856-08dd76e7eec7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:54:27.3924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjUTN60pdLCCU963M2ww40e8K5SXZf40dTwimuGwfmSpG2IJamCJOXH2QBWiWFhJbdq7Li0r/NGCum87y0z98Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

From: Robert Chiras <robert.chiras@nxp.com>

Add compatible strings for i.MX8QM/i.MX8QXP platform. Remove
fsl,mipi-phy-gpr from required properties and add new reg space, since
i.MX8QM and i.MX8QXP use dedicate control and status register(csr) space.

Keep the same restriction for other compatible strings.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v3 to v4
- use MIPI CSI-2
- Add Laurent Pinchart reviewed-by tags. Reset description is not very
accurate, but it should be good enough since use SCU reset. SCU reset do
reset for PHY and controller.

change from v2 to v3
- use dedicate csr register space
change from v1 to v2
- remove internal review tags
- remove reg maxitems:1
- remove 8ulp part
- add 8qxp compatible string and make 8qm failback to 8qxp
- limit reset and power domain number to 1 for 8qxp and 8qm
- remove power-domains change because 8qm/8qxp only need 1 power domain
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 2a14e3b0e0040..3389bab266a9a 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -16,11 +16,19 @@ description: |-
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mq-mipi-csi2
+    oneOf:
+      - enum:
+          - fsl,imx8mq-mipi-csi2
+          - fsl,imx8qxp-mipi-csi2
+      - items:
+          - const: fsl,imx8qm-mipi-csi2
+          - const: fsl,imx8qxp-mipi-csi2
 
   reg:
-    maxItems: 1
+    items:
+      - description: MIPI CSI-2 RX host controller register.
+      - description: MIPI CSI-2 control and status register (csr).
+    minItems: 1
 
   clocks:
     items:
@@ -46,6 +54,7 @@ properties:
       - description: CORE_RESET reset register bit definition
       - description: PHY_REF_RESET reset register bit definition
       - description: ESC_RESET reset register bit definition
+    minItems: 1
 
   fsl,mipi-phy-gpr:
     description: |
@@ -113,9 +122,30 @@ required:
   - clock-names
   - power-domains
   - resets
-  - fsl,mipi-phy-gpr
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qxp-mipi-csi2
+    then:
+      properties:
+        reg:
+          minItems: 2
+        resets:
+          maxItems: 1
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        resets:
+          minItems: 3
+      required:
+        - fsl,mipi-phy-gpr
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


