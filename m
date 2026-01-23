Return-Path: <linux-media+bounces-51412-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFT4OlJBc2mWtwAAu9opvQ
	(envelope-from <linux-media+bounces-51412-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:37:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F3D73763
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 374913001CC2
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8915036C0D3;
	Fri, 23 Jan 2026 09:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gdBWD+s0"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86545369228;
	Fri, 23 Jan 2026 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160987; cv=fail; b=WA9BGY4woEe/P5Ak4CTv6jT+4i3eBBRDtR8GQUigo9QEAdFLXOHB6Zgjp62V0P7FL39yb7ZUMEbEZSOkaQHV8L6+/PdOIh4mE+jLQOa9wRk2SWfpNqIyIFFEcWaipCMiNvrC6Egb9NwiHGaj+xQ1/G2Gs1001CtiuIneMKwv7xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160987; c=relaxed/simple;
	bh=CQpod46MwEI/xAy58JYFl2KhxV+iz5zTR3j4GJLz8mI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kaLDUyYBq86XcJTcPxcjNGiMXitpFUJW1YCMHySxyEpVunpVCfYdaQtpY9qGy7JgcVQbTYFojCuJdhUjJbQ61+tiyZRR3TErP0qN80R0+KCDk3tn+SHsBxYNZw9DttVCnzYLXhJJkEox6eG/MokPK7xh5Ra8SFIGFNojVA5JwO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gdBWD+s0; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTTFmEHYGf3kun28mNGqTMB67EobSk9j7zhTQo6lUQHCLZFkrUN6lg5xMpvphfSia1AA7L17Zgmq2KEaerPOVIiNVNEPJPKh3mW4AGNIK7yBX/9nZkrJ9ksXfAH9MHR17h86NMsv8viEbiE7fMfsHGAKpGUNjss6pyRC/06iDZVPGQAJNajAo2wZ5pztqPS15RK+t60YyXpGIv+S82vstnbOL7r+Zey4Zx/8xbrHJ4ZSYf/qowvOXLEJX1Rwd1H4vcuqmTfvx6XlpAJ98fQvT0sk/TGGI1iDf6Nf1y5wLvHKWTWY/XgFgGPTpCnqPgToPl09uZdUee9CIxetuzkKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36Q1i6D4wAM8lvTM0CIMp0LiB0E2rvwOfEtpz0d71YY=;
 b=y+dATlH35VvxouKJYnfp89c+5eVMoELJ/BFE2U4otdb/atSZjEF9ONjJotS9VRGuDSLtlC16TMQKOX0n8EpJ72656is/vfLQxn+niYfmMhr5KUfhORL/4PAEr2y2dmpVol8HXaq4++mraJ807hqmMqZgjwrYxJ+ZBP8ZBPCGSiQKm78pE+kQAbS9MTLDyZL5lpAFM+hsISPnipz+Na2TLvsh1j4q6GkbvCfdkgso4FCg4mjWQHR9VrWH+UgTWD0yHjtVmWOdFfzZScpmrnbW4d/EaPVolWqm+2wTPs6cdGF9WcMAPnglsKb5y9c3+ZVxe+zGaJHm8SPz5LvFySCG7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36Q1i6D4wAM8lvTM0CIMp0LiB0E2rvwOfEtpz0d71YY=;
 b=gdBWD+s0W3/P8xRlXTisENvIWwcNd7QyVcgbxxnd4QDq6ViOl2qgEurbiaR+cGKMj9GCuBl2HPJurHct3Xh/s674H5lWXepUKl+cu+Hgq5yo6a3zBOu+dx0krR56r7v3j6qE+uKeJUT8XViFJC711CEg1fyGffysAWZwSXiP9rCClXMPRcGCNkj+IjAD0+ygUOyxL5gP3FDZapamdnK9t6hNvZ4WoCmMnJht7/VKWbcZB3saR7xOK2KiMUGhLEyazEkj1NkOSgJV0dhv6xlhdRchq0YIz+lSJslwj5WudB1t2EPiJrwNoMasyytK5NoVN9/Ksd6lIZLo9E5AP8EItw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7612.eurprd04.prod.outlook.com (2603:10a6:10:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 09:36:12 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 09:36:12 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 23 Jan 2026 17:35:17 +0800
Subject: [PATCH v5 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-csi_formatter-v5-1-d5b803f867bf@nxp.com>
References: <20260123-csi_formatter-v5-0-d5b803f867bf@nxp.com>
In-Reply-To: <20260123-csi_formatter-v5-0-d5b803f867bf@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769160965; l=2884;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=nH6NEgl59OPi9EkQLhW3K3B+dXPHxx3jMyor6yV6qDE=;
 b=Eos9y4dJG6+0Ul0UYrIPNCTtmxeNeu55SZ6wElGX0GKSdUoICvtcow0bAdfCezX5dNnFRFUe4
 SjFKKwJO4UrDRsoCo2VGgieqBadYn7CVrg7h//qae6BYebgjcPBKcT+
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DBBPR04MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d642f69-b405-4d7a-fbb9-08de5a62d895
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?aE9naGQrNFc0TjhlWlpCbkpuQzJKcWh3eFM0OEFuZGgvdDZCNjJtMUJFU1Ri?=
 =?utf-8?B?R0hUZ0czVkFnNncrOG44Mm41a0dOUXlJQnJEd0JTdnJObUZVTzZUQXpsVnZD?=
 =?utf-8?B?dXh3TWxyYnFJYmZJbW5lZVBDWXYyeEFMYkRpMll0VmhyeXQ5Vk9jTVVqUHp2?=
 =?utf-8?B?Y3huY2pnNWxiTHZZeWxXeXNLUE44aEFVa21wSy9VY3JxOEpCbzdkV0lQcVhi?=
 =?utf-8?B?RWl1OEhpNnVSdG00Wkx4S0ljbzA0UXpzeUxLaDBqV2wxeDVObVlobFlSeGpq?=
 =?utf-8?B?SlhwV0VnUjBVMUdzYSsySHlFMW55Yk9wODh6YjkzRStIK29EK1l0b1p1UU5H?=
 =?utf-8?B?S2pJeEdNR0E2UEhyRGxpQ2pMOFBVUjFjaE0rZ0RaTUlBa1JZd1BrcllyOVlS?=
 =?utf-8?B?OXE1M293ZHdWUWdQSitEb20xcVlrTVYyeWtncVpqczl2bHdoTDh2TGxVcWxa?=
 =?utf-8?B?dHNxREdYaHRjTmJiaUxPNnVaUlMyTjA3amFsU0xHeGxOVWtzSzZCUkhYTFRj?=
 =?utf-8?B?UTVpZDM1UU91Z3FGdnRPKzd0K2NvRTVOU25zellMbm02WFFmckZweS9DY1ND?=
 =?utf-8?B?TjlqWTFXb0Q1NnU1M3dKeHNNMW1CYU9oUG1XQ29MVzM2am1lVEdFa2ZETXFS?=
 =?utf-8?B?OGtENU9sMlppRjd1bmhQNWM1alEzUWw5UEo5SGZqSEswZ09sVmhKbTBHSkh2?=
 =?utf-8?B?NStjYVJwYmFYYXZZSi9MS2tWd0JkOUkwRENONy85MU0wM3BKNHJoUUZQNExI?=
 =?utf-8?B?Tlo4c1VVbzlVdWwvME9STjBzNXFCS0tkaWZ0RUZJREFoSEpJNnZzZnlUbG4v?=
 =?utf-8?B?Wkk4ZGUxSnBmTWl0VVp1VEZlMjIzVHhuL0NaNW85VUlCVGxjaGkrYWswSy9N?=
 =?utf-8?B?MXdnZDBHMENFdzg3L1lyQXd3M1ExS2ZpV1l3cDBYWDlXYkIvZUdpMWZLUzhY?=
 =?utf-8?B?V1VwRXZnckYrNE92UzZoeFQzaXRKWjdwaUNVSytid2hrNnlTUWtCSTBTaTZO?=
 =?utf-8?B?RzJjcTkvejVWL2x4QnkxYWVlT1VZYmVTcWkzRldEdHdBZGJEL0JXY05sa0ts?=
 =?utf-8?B?WUZQc25hb0FWeHFnbWRtSk1HNDZwcExFVCtwdnlVYTlLZmNQSmN1bnVpVXJ1?=
 =?utf-8?B?VnlQVVdhN25jRGd0YlgxeFdlRDNEWktVZncxME9nWHAzd1JabktsRkJXeUJr?=
 =?utf-8?B?bjZkVXRRUnh1UXFBaDFxWm1KbGExMWswQ1hSVEcrUmlVYjNVYVp1VTlNMXVi?=
 =?utf-8?B?R2JCTUVsR29zQmUrK05JM3BtUDBySUw2KzdhdEREMStDK1luaTVVWnZrL2Jq?=
 =?utf-8?B?RldoVHdDSlo0WTdXYUQ4bG1XcXY0RnAyL2NwQ0U5VnlLTmZUTUJqZ0tGV2w0?=
 =?utf-8?B?b0tCSzdYSEM4NjBqUEdPTVFxaEowMXBwc1VGQ1FHQW82b0J5ZzVha0lLRVFn?=
 =?utf-8?B?ZVpWT3RNZXBVd3JjQ1Qwa1o3SGlQdVBjWDV4bXlDR2gybnNlcGhxTmo2a2oz?=
 =?utf-8?B?a0ErRHl5dFJreHR6aEpEbjBrNnFJY1AraVNQeVhLdFlOa1VwbnVhczlIMlpS?=
 =?utf-8?B?aEFranlBZmlBTzdDM3IzY3k0UW5ZMlh6Y0RQcWpyWnRpVTJaamRJeXpkam9p?=
 =?utf-8?B?a0cxRWZFTXFsZUdzV0RPWUQrcjYrSVVQS25TTkFVOWEwcDBPMGdsL1ZBakFv?=
 =?utf-8?B?WWdwMHhNeWhTWVV2MWl3Z1k3K2RHWDJ5SW82ZGwvdUJSNk9MbGQwK2hOY2JZ?=
 =?utf-8?B?azJvUjBnNTBsNlZqaFZYVHZ0STJjQXBsQVZKZkxVdnN3YkxmNkp5N2dIemxq?=
 =?utf-8?B?dXpKcTdDaWlyTEMzSUs4ekpweGo3d1BZNjJBb2s3aFkzbGxBT0pJRnJqdlFk?=
 =?utf-8?B?QWdycHRHVHd0T2t5R1o1cTd1bmN2dnplQlFJdU5IenVJVzhNYmNGcnk5aVVW?=
 =?utf-8?B?am5CUUU4SVljOGViRy9TdmZ1YXFzWG4ySlc5ZVRVSGx3aHBKVS9wK2ZEbHZp?=
 =?utf-8?B?ZjNqZ2loczJRWDU2WStDWm1lRm85YTMwZzNSOHFHM0dPbWZGMmdITyt1N09T?=
 =?utf-8?B?bDR2MGY1TlArVElMbDJOSXU4NWVrNU9aemh4UndEaTQwS295VlRFTmRRQzhv?=
 =?utf-8?B?ZTQ5bFl4NU9EK2xPdU0wZE9HT0pIYS9xWVFoSTNMRndBQkVESzhnN1FCa3ZL?=
 =?utf-8?B?RUE9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RlpYN0ROZy9PUysrNENDTjlkMzU3OW5UYWVFVHBHcVF6YVgvVWg0LzdPV0tL?=
 =?utf-8?B?dG95c1kwNjRzanpWc0N4c0FCSEswN292MGJXQzlMMGRTeEJLZ1BPM2JqYTdu?=
 =?utf-8?B?QWpPOUlBRlF3aWdsMElleHZMT1lQdytpSURyNHlhdzhJSGl6d0k4RkpCelhC?=
 =?utf-8?B?emFhbTRBYXFPQ0QrSEtlcm1EN3E0UmVPYUV1TnpWdHhRUlF4SlJoWUhwQmwv?=
 =?utf-8?B?Sy90elIxbWtRRFZ0YjAyeEhLblVsSjRvWmIwOGRXL1MzbTArMnVHa203TXZu?=
 =?utf-8?B?V0preW5IZkpqR01HV29jdm4vVWpDS29zTDFBaHlmZUVIdGcwSUNYU0hseGNW?=
 =?utf-8?B?MzdTa1k4clRqZklxR2tLTjVQaVplK294VGpsNk52VDlnOFhFcEpuZXVFRFRR?=
 =?utf-8?B?NTd1M0lodlR2bEtuZnMxZk1GcVhMTjZHYmpGdmlLSVVNbGpnUXlZNlM1YjhF?=
 =?utf-8?B?WVNPSHM0Q1kzb0N1bTkrRCtNYkZDQXRmaytEdUp6MlZrZFhVTFVWeEFHaVZD?=
 =?utf-8?B?OGdPN1FUcFhPdURQY2hkZUVVeDdOVFhrNVM5UXNySnZHc1ZURHNBVDlCMlln?=
 =?utf-8?B?eVFLTWcvM2ZJUjZpM3BwSU5sdWpuMFVQN3I4cEF1ZmROb3RVQ0h1dWR3V3BJ?=
 =?utf-8?B?ZVVaejQrOGlKZWVKNVRkNkRIbjNyVVRnRUxCSXNFTUpNaHRabE1hQ1prUUo5?=
 =?utf-8?B?Y09wVmpNZlRXZUF1RXB6TEd1WXovUlFIMUw0YmdsdDAxUWZHTXljbU1mUWNY?=
 =?utf-8?B?bHMrQ0h1NEx2TnFWdXdQZ3BaQnAyRDZqeDVQeXJTR2Q3NXNPQVo1L1FqSEVU?=
 =?utf-8?B?MW1tblQvK21UUXEyYks3ZmttcWFuUGZuTmJsb3R6RlRzbitQZW45aTdheGFU?=
 =?utf-8?B?aGVWWTFDYUxqY0Z3bUlYWGhISnBLK2VEeHFrdHhIdy83dUFFNUVYNURSei9M?=
 =?utf-8?B?TzIzb3NSbXAwZ0h6MFN4OTk3WG1kSlZmajQvQ3ZmVy92dWpvMUhVMVZkamto?=
 =?utf-8?B?TTIxWVNOcHZBK1AvV1ZuMDVFSFZsNTdzQ3BodE1RRDFQU21VcDkzdWNJbmdv?=
 =?utf-8?B?NThhaW9rV0VXOEt5VnJLU0gzb2tCZ2JRYUR3UlZtN1dPVHRtbU5md3RNQWFO?=
 =?utf-8?B?M2lta3VZd3Y2M2VqV3dad3IwZlVGdWFPRzBVMy9jOWxkNXhyNVpqWkdaWVN0?=
 =?utf-8?B?Sm9IUmZ2WWZOWitaeG9lZUNrTVpxUkg5NkwxSXB1UWE0cW9CTE54VmRMeDBq?=
 =?utf-8?B?c3dIbzhib09wWDBQZ3hMM0d4WTdFYkMyYkVlZ0treXMwWEtLaHo4UlB5dktp?=
 =?utf-8?B?VmcwWXNuWG1EaVNWdCtHQ3VlNTZaOHVLVGlpS0RReTh3YkhmQWJINDRZc3dr?=
 =?utf-8?B?NjBwQy83c2xia0ZYdDV1ODJuQ3phazJLQUVGZTBaOS9VRFhPK2tTQ1pKbzVj?=
 =?utf-8?B?WXk3MkFTemJwemg1QVZ2a1VMZ0JuN3lDdno2Y2l1bjFCUDQrRWowT1pwZ0lM?=
 =?utf-8?B?aVNPenFZckhuSExFaklZSG9VTy8rSU91ODZRV0c4Qm45c05DRk9kUmE4djNh?=
 =?utf-8?B?aXBUY1RDTlBjNjFWN1ZtUWN0MkhEQXVSS1YxODFHRU5PN2o3Z2NoL29DeUZT?=
 =?utf-8?B?VzdBYzB0eUwxaFBLSGlKVXI1U0F6ZjZjT256WXdOMFZMbmJMZEtlRXcxR3Qr?=
 =?utf-8?B?RUtiMGlBYXNjY3AxdVYySVFPY2Vvc2d0ZTkyOENDWE8zOUF6bFVWNjlGSXE3?=
 =?utf-8?B?Zk5lOTMwTmRZa0ZNSE9XVmQvK3VJK01vTkdkREsxY3JrTm9nMmdIbkpod2Y3?=
 =?utf-8?B?OUJkTVNlTmRyNllxUzNJQ0hDVFliQXV0b2tDbnVpWjhZelZvZ3RteVBjYURr?=
 =?utf-8?B?MGhUNW9CdUdyR2FnQlpUR3QzNFBDUGd3RHpGNWJoZ2FiNldSVEFFSjJ3bC8r?=
 =?utf-8?B?dm0vVlBWVFRhL25ZVGE0S2RTWGt4aTEyWDJSK1l1Sm9objdCZ2txMnoxMUha?=
 =?utf-8?B?ZldKdDZQeFFvekhaMHhyM1dIcXljNG11SDRoUnpNRUx4eUlHVjlNc1ZPUGVB?=
 =?utf-8?B?WmxCa0Y0anlzem56eGlzSlNXSHY4Yk1wbXpxOFdxTEoydWFIWnA3NkJrcEtx?=
 =?utf-8?B?U3poZ21TcWRmZFVwaGhLclJCZmxmeE1UcVdXS2tIR2lHc3phVEZKUnovbml2?=
 =?utf-8?B?NmY0TWhVcDBvcFBQcWk0TlBWMVdBcUt2THhtUlF5TmZndVhNU0VHaVZBNHB2?=
 =?utf-8?B?Sk10a0c3cmVCWFlhc3FZTnloTDl5dW42WlJ5eUtHN1VGejlXQndGeVdDbEFz?=
 =?utf-8?B?eU0wWFh4N2IrcUNScTd5T1hwYnZqeWs3YUFWamlqT0F5VEdRa2Uvdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d642f69-b405-4d7a-fbb9-08de5a62d895
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:36:12.1693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayP0mNFY70LeI9x6HgRhDZBvnS5DWaWRnAP+fkLHdikA58DcMw82HI4xzs8l1DYfX1KZP2HBnhGNMBlW1rEMuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7612
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com];
	TAGGED_FROM(0.00)[bounces-51412-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.20:email];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,qualcomm.com:email,0.0.0.0:email,NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: 06F3D73763
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX9 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/fsl,imx9-csi-formatter.yaml     | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..774d37d2b987a679f0bb6378897a6dd196ea4f13
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx9-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX9 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description:
+  The CSI pixel formatting module uses packet info, pixel and non-pixel
+  data from the CSI-2 host controller and reformat them to match Pixel
+  Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx9-csi-formatter
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: MIPI CSI-2 RX IDI interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Pixel Link Interface
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    formatter@20 {
+        compatible = "fsl,imx9-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&isi_in_2>;
+                };
+            };
+        };
+    };

-- 
2.34.1


