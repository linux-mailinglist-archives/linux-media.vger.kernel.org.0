Return-Path: <linux-media+bounces-41220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F30CB394F4
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 09:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A185417C035
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 07:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C5F2ECD14;
	Thu, 28 Aug 2025 07:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XsGqjUIw"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B16B2D6410;
	Thu, 28 Aug 2025 07:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756365542; cv=fail; b=AP99aY13E6lHU07emXJ9vr4xGstYNP7r5+ZivavLb5WQejdgSBCypas+R8rnFCwVnutM/B/BtNayDdoWAlyN+TW8nnDpezH9FVPx+xNl1fttqZL3Qzh6vxFjmLJvDAPgSO53Zq/ZsUDenxW3UjB2Y2wUzPGRucOAHfaKEQ3fUIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756365542; c=relaxed/simple;
	bh=Ag1sPLelcYnWzBZdsKbQ0WjA3PlOnGbW7Zj32b1hAMA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qVdGDmvOCvuNPv8PE13fr4vWL2t8E5Z0j6AUzHQpzxaL3teawbUMZFjHPLpbFA66NWQjPoIpKDP3NbFeKgni7gHGLPHsEKB9E44JH/IDRvNpE5FX6vKqkHShziZ+IcDMtrU4skmCuyGmiYXUWW7rSYvCZxYnAP3bBgK/obmOR90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XsGqjUIw; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAGhLJtlELWVAgXhp3AkX9TeKf0BsSla37TFyq2TmfigtbpFmEmqIxHsuJULHxIxoZXHeuxfiufnZW01OaL0G5vr9ziON/k3xNdWbfpG3EYkBsGnaR/kJpG7ZiLQLFWTa89DZhpfhFbc0/FPluktu979qCOJ6QcWnZJME28TZY+yDFBcKHWcuYrL9EybF7NuETiQ6U+1YaC0lYwHARypPJLHaDI6nT9Cq2LNrZWtm/Yntced4Pakpvrd9uhtF8t1NaeiOZ8slNTSoAGPq6Ej8egBFJidsUbn/RfWFCfMlY61ETmRi4hCESA2EOwfEqaQCTw/OG2zZF973eTtMLy6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrV43YVpug2qoLlBpnd5P8XCLKayNbe6sk52nDkNtF4=;
 b=PojA6QOmgJI8D+ITT4bsYV0Ewboj3vjGSbK23q4Moyqs6kvC2vPW1tgnyGkz4hsPANmhN7ww75uCv6gzN8Fel92iobpADNp2nZgSjtNBv5WjR6QGoKXZzvcP7SPIjs+0iws8FMM8igI9Mikp0BzHqaR0pivj+fSTOWp/LiqISb1DqDJ9bgFuxwZCYbGR2k4QO53wd1nA1uE3uXFM/i0KhkBKlQMrvitHMzPn/W4haeDa6AAAM9vcLlgJo0bSalK59ZqgnJg898Yt52b/7wPgVUYeWo/TSJx+w+EVsnoRKMgpiXedUWNtRSyBiCavBOdwSJUneT50uJJZItQAEVs8FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrV43YVpug2qoLlBpnd5P8XCLKayNbe6sk52nDkNtF4=;
 b=XsGqjUIwzp0i71Gcqglvn5y2gIuMYWb2v5k56iK1ItVvteseJc7xCBoF6vVN5hL/Uc6bBITBCLu3TZdcOZ8ecVX+VlR5eYpj5PELqsiPvHlAh2tXaxfrjFd+t85bv3pJBvqa1qPOWUc0gYtliag8Zabz2L7eqvEwz44ldolg/pATvnif5kE5C3TP344bFAKDEJsXGLeAsJC/dHjd2isJOPzRjBqzWhfTUWUgmNuY+j6EsWgc5JRk3LgmlTibv4rLqLjBw2RkMl9voZCTGXeP8wluqRGjLQASrVTCftHna6nCui4jf9ZNlGcNK8bpWX/AxZHf9u36IGD62d95pXY7EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS5PR04MB10058.eurprd04.prod.outlook.com (2603:10a6:20b:683::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.10; Thu, 28 Aug
 2025 07:18:57 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9073.009; Thu, 28 Aug 2025
 07:18:57 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Thu, 28 Aug 2025 15:17:36 +0800
Subject: [PATCH v4 4/4] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-csi2_imx8ulp-v4-4-a2f97b15bb98@nxp.com>
References: <20250828-csi2_imx8ulp-v4-0-a2f97b15bb98@nxp.com>
In-Reply-To: <20250828-csi2_imx8ulp-v4-0-a2f97b15bb98@nxp.com>
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
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756365509; l=3033;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=Ag1sPLelcYnWzBZdsKbQ0WjA3PlOnGbW7Zj32b1hAMA=;
 b=q/2EOllRI4VsTeT8H7J1oakqG2bRP6Vp883OtI7h+liSvkjoNlck/DUERUjXmEEYkIx2lY7Ou
 0zM8l+Z3rN/Aq069Wa6B9a6FF81eXpV90Nu5GGPXYClVWXT86J7wNov
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS5PR04MB10058:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e77e54e-0d63-4f3c-89d1-08dde60326f9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bWIzc0JlYi9qMWRKbnkxdVZoU1ZYOUQrY00zb01sMXdpR3N5clljNFZ6b0Ux?=
 =?utf-8?B?dUplMjNqLzJyN2NlZU9nVnd2RUd3L21GMHB2NHZSaWFoM1J4enZrRXdORHBo?=
 =?utf-8?B?YzVudTJHTVYxUTZLN3hsMG93K2Q2TjcwdVc0MkNKOE5tUlNsVXZGcnpqZjlB?=
 =?utf-8?B?Zk5BWjgyYmIrbXVzL0I0ZWFuQjJSQTdrVDlKODlCbkhUdGRyaEc3QUVLZkJh?=
 =?utf-8?B?bktieUhIMHNTS1V2UTBIdlNsZTA0RWN2WE1qYnd2eW5wZXZlVWVIUU9RaXgr?=
 =?utf-8?B?QVpnM0VNNm1Wb3RFM3RQclhSOHJEK1dBcDhjZDFUR2o1MktaR2pReE5tTlRu?=
 =?utf-8?B?ZHR3SjhUQ2FuQ2IrMGUxS1RRQThwTVRVajJtQ2U2WUZMVmtYNGxndDJLVmV4?=
 =?utf-8?B?R2ljREx1aEFybnhlQXBSa0poWkxxOEdFRWdjYnhQQjlJL3VlZjJOM0F5NDJ5?=
 =?utf-8?B?YjNMVGxNVEE3MURWMUxYWHZJM09FbFkxUEZKM2hxdEJhaHZRMUZZNVlBdENI?=
 =?utf-8?B?Qi95ZUdOQi9zTTYybTN2TTNJWkdSSzVjc3VWNmJ1SUJZdEZOams1SkM5QXdC?=
 =?utf-8?B?ZUJLWC9CR1phUzFGMy9XS3Z2VGdBYWxFcVM3ZDBhZXJzT292K09CcCtOM01t?=
 =?utf-8?B?Y2ZKMVFrQ0ZiekdpaUhBR2Rmb0RHdEZYT1lKOXFMRk1nZXVOdytaaXNmRGJv?=
 =?utf-8?B?Y05jdGRGem50Q3JPYmJGcG83TjRtM2xabFdJbUNEKy9oYzNZcEJoVWVHeGxr?=
 =?utf-8?B?bkVLQzFkbDlOemwrNmdJNnhiSDFHWDZUZ2Z4akVya2k4MitYWWw4ZFJXbjVt?=
 =?utf-8?B?RjRoOWhoamlaT3lCWnR1Si9vK0RNQXZTWlZsTDBTQnJTMjdMdEhGbDBUdkpS?=
 =?utf-8?B?YnhVbEJ4NC9EV3BqcGRjWGJDbVpjOUlzZ3BCRUhtSGJ6ekpyOXlYa0ZMU2Vl?=
 =?utf-8?B?c2FvR3J1TWpPdytyL2JaU2NWTFY3Rm9ZakJ1WEJTRVdiRmViUjVtZ2UyNjJM?=
 =?utf-8?B?bTB6RjFGRVNFZXFlbXUvQzV3NHhRRHp0b1RuZGtiY1VWenRoMGJnNG4ybTdS?=
 =?utf-8?B?Rno0aTBkQUt0eFlMaDBSazlXNVcvWWZBVXRDWkZJVUoyRkZaZXM2OUJoN01j?=
 =?utf-8?B?ZWgvSE9Sak0zUTlIbDJXeWIzd21BUmZOUnhzQm5GRlJQcUFUN0JoS3dkbjBN?=
 =?utf-8?B?eUlnT1NpRThRbnQ0Y0syRlpiM1E2a1hSUG9xU2hKVXdUNVVlWlB0TU94djhK?=
 =?utf-8?B?UStXWU5GeC90MkYvOVBJNEFNb1Rpa2h5VC9HNG5nMU8zZ3NtYVJ4ejNLZDU4?=
 =?utf-8?B?TFRoZzNhdTBmQmI4bDZvWWJqc0x3QVNabS8vYjhiR1BUU0NGb2RXSWdxSjBl?=
 =?utf-8?B?OG1TSTZBQkp0YmxiNUc1UU8xaXN3VzU1dDl5clROMXpiSFhXNGJ5ZEVXbEts?=
 =?utf-8?B?UEF6azA5Q3N6NVJXaVdPTU1adW9YcGU3dDJWRmkwRjNTOTlrY09KQWtid1lt?=
 =?utf-8?B?Zk13Y0lMMWFzVktiK1B2WE9yQm1YRHg5azZLdExLa3hxTGR6SjREallPRU1W?=
 =?utf-8?B?SjZORkdUdmxqREwvbUhiUEdHdEdOODBGbzM4SldOc0pYVFJsNXQ3WWxScEph?=
 =?utf-8?B?NzJ4SGw3eTFkdnI5TG04ZWZSYWZWb2xQU09OeDQ0WWx6aXp6RDBOOWhERXY3?=
 =?utf-8?B?Mk5pYTRjMFgxN3I5NlZqekl2dno2aEVGVlhNMzNJT3VwRlB6SGdXQ0tCcnR3?=
 =?utf-8?B?NlU0RjZzZTliVHFDY2tVVWIxQU1mN1NzL0VMMGxuV2MxVlNhUFZPRUxyVGYw?=
 =?utf-8?B?UkRZKzllVFIwdldaTFFveUFyVmRVamQwYlprdmNVZWM5MWtrVk53d21jQ3BE?=
 =?utf-8?B?NUQyTVk0eUI5MlVabGVYTnJWcGNtTXF6d0c2MUQ4N1M4UUo3RHc5TnpaUXdC?=
 =?utf-8?B?Q0lzcmRqaCtOZVhUbnNOVXJPM3B2dVlUanRpeE9VZEljSVliczVJaThKTHJv?=
 =?utf-8?Q?zoTyGOXzDC8j7ljsIEYBJrDBXBy1Zs=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QVA1Q1NuamtoYnZrT05scVhSZDVGTEVkRFdwcEJrLzlsKzBZV3RVdkZpUE9s?=
 =?utf-8?B?aHBNNVRsMmFrOEl1cG56RG9JdkdBaGtvUnZZVnJ2ZGZaSUQrYWJBR1lTeXRW?=
 =?utf-8?B?bis2S3ArU3NFeGF2MWdHTmxmSmxMNGM2L1hmcmNVNDd5aHpJb3RaVTFIcFVz?=
 =?utf-8?B?R3I0YXFnc3c0SW96ZDY5M1Fad0o2ZzFQZE5RODQya1pJZjB2UEl2T3Z0R1VI?=
 =?utf-8?B?MmhWdytxbmhpaHVRVDQwZi9tOUFFUnJ5STluWC9XL3VlOFA4WXRRTlZ1NThh?=
 =?utf-8?B?TGpldGYxZTVaaGJsbnNWSkc0RkU3MW5xMVRHMjNOckxHcEdLM2F0cTR2bUpR?=
 =?utf-8?B?LytGN2xpYmh5eE55cm9xT0hMbVBNbUg1QVRDVktiMTZEOE9sWTZIVFNWb2Ev?=
 =?utf-8?B?b0pQdm4vdmY0L1hEa1BQZjl4OWZiQmVuR3lKTWdDMGVLRnNpSU5Ba0hEOGti?=
 =?utf-8?B?ZDlabGlhaFFlWVZoNmtJUVhpT0NvRWdPcXYxVDltTFh1Q1lDOURjaHhpWkpm?=
 =?utf-8?B?OFRObzZqQTNHTnQ1cS9DMWEyN2h4bjJFaVIrWG5sU0NENDd3NG90STU2VHQ5?=
 =?utf-8?B?WWNLTDhWV2xSUjBGQmFheGs2R0J2NkpCZ3hUMFJZWjBNb1FqeHNSRkhBU0g2?=
 =?utf-8?B?Rlpzby9DWVpPUVVUL3lUT3V2QVg1Mm5EUU84c3F2K2RZTlhhQVdPMXY1TEtk?=
 =?utf-8?B?L0JnZTVWQ0dYVUFqWmYzZ2RSUHhXbjdaaFF3Ump0VVVHSVBEYkZWL2ZZOHJU?=
 =?utf-8?B?WndPZWZhazVLQVN0cU5NVFhxbVRFakRFU1U4QWN6cTZkbktWWTZFQW1FZ1hJ?=
 =?utf-8?B?M1VXSFYrdjB4UzN0LzhnV0pHN2dRQUgzSlJVZldNMFA1d1VOYzBCdjNqcm0r?=
 =?utf-8?B?Nnk2TytobzhtRGpaTmtmOXBWR3FHNHVXRWdGczFsMXJaa0JLUDdJU3BtQURo?=
 =?utf-8?B?Y1pxOGFvVW4xWUpPVUNtZlN1TTVraVp6K3FqZEhJRHpZVUVBaUhLR1R5Mk9O?=
 =?utf-8?B?VVhTUlNFNTJ5eUM4aHZsZUNDc3g1VFhmSVZLRjZsVHg4bHovMkxZMys4eTRx?=
 =?utf-8?B?SU9tbWtzK2pZbUVrbytrcFc5OHdyWE9KYW8rc29EbkY0NFp1Q1ZVODZxTjJP?=
 =?utf-8?B?UXo3L3hqLzJhQytFQ1lKdDl6anI3d0lUK01IMXZXQnlXNSt3T0VqUldNL3BF?=
 =?utf-8?B?Z0xOSmxsaWttSldkRDRaaWlWb3ZOMVoveFZKMzl6UjdNL3FuUEk3VlloYVhl?=
 =?utf-8?B?YjZSTUtibjh1aVdoZWlyeTVYazl5MVBHcXRmMG5SSldBVUdXY2paeTlMd0Jp?=
 =?utf-8?B?WmhSb241eThoY1VZcWtEOXhsNlAxMHpZRHJiQ0gzaXhnZE1Zb0V5TkRGbEd0?=
 =?utf-8?B?NVdyVkVsT3d1SFlHOW8zdmt0M1MwdURXaENDMUJZMG5SWkZmMU04bW1yOXVF?=
 =?utf-8?B?WVVlRkE1aVlxZXlwWS8rQnNZWTZOdmtWWGJ1QVJyK25OMFQ2T2dzNFlPSk12?=
 =?utf-8?B?Njc4MVdWd2Z0ZlFuVWhTNFdmOXcyNHhPdm4yM2ljeGM4QTY0ejZnemlkUnZD?=
 =?utf-8?B?MkYyUmV4NTltZERTRmFvZVFqQnlXdWtrNkg3bVpzSmlmdDRzRS9MTG9mNmpL?=
 =?utf-8?B?cGF6T2Ftc1FDU1cwK1k5TXI0cVZGNDRsamJEejBnTkNQc1FQNDk5QzFIRis5?=
 =?utf-8?B?NCsrREE1NUsyYlNDTmRwR3FlQTVNWGp3UGRkTmY2YnBxU2ZQa2JkdzJHaGQw?=
 =?utf-8?B?S1ZFMk1zdHBURHQ1bTZBTDZiem95MEFMZWFWSklwWXY5VEx4RHU4WEVxQXZQ?=
 =?utf-8?B?eFdBTHVOaVZPdnBibkthQzVjb3gzVVQ3SzRXUm9URklXY3JaZXFYYWphMldo?=
 =?utf-8?B?SGdodkZhNExETTZVZkw1cDh2cEIybWwybzg2VWtLL0ZHRnlMVDRZZE0vTVQx?=
 =?utf-8?B?QTFLT0VxQU9QSS9LSTEzbVZmdW9qRjlPWWRVa3EvYTVFaEVqcW5BZ1NCd01C?=
 =?utf-8?B?RGtzaTVVdW05b1pOaXBHbG5sc1hBS2Y3OWthdWwvVVd3VFVSaGM4eGZZZml5?=
 =?utf-8?B?WlBjU0tlV0pwUXU1dko1V0FyTEw4L2w4TzN4eEdhUTZ1d1BrUWUveHFOcFBR?=
 =?utf-8?Q?bt5rWl8sZpO3tt+9NQyHjnYP7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e77e54e-0d63-4f3c-89d1-08dde60326f9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 07:18:57.2253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FT5Bb9HjeYXC4IN0kS8DDmEFlHz3+wouqmtBHuv9KITQfP0wb2gGSq1ZmVLMJGVpPV2EejRJgnx+Wc6ZCbIFhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10058

The CSI-2 in the i.MX8ULP is almost identical to the version present
in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
nodes and mark them as disabled by default since capture is dependent
on an attached camera.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 67 ++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4950c37e72e04f6bfb5995dc19178..7981f7dc62f5dfb2dff051e2d91bde6a2498ac13 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/imx8ulp-power.h>
+#include <dt-bindings/reset/imx8ulp-pcc-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "imx8ulp-pinfunc.h"
@@ -842,6 +843,72 @@ spdif: spdif@2dab0000 {
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
+
+			isi: isi@2dac0000 {
+				compatible = "fsl,imx8ulp-isi";
+				reg = <0x2dac0000 0x10000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
+					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
+				clock-names = "axi", "apb";
+				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						isi_in: endpoint {
+							remote-endpoint = <&mipi_csi_out>;
+						};
+					};
+				};
+			};
+
+			mipi_csi: csi@2daf0000 {
+				compatible = "fsl,imx8ulp-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
+				reg = <0x2daf0000 0x10000>,
+				      <0x2dad0000 0x10000>;
+				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				clock-names = "core", "esc", "ui", "pclk";
+				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
+				assigned-clock-rates = <200000000>,
+						       <80000000>,
+						       <100000000>,
+						       <79200000>;
+				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
+				resets = <&pcc5 PCC5_CSI_SWRST>,
+					 <&pcc5 PCC5_CSI_REGS_SWRST>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mipi_csi_out: endpoint {
+							remote-endpoint = <&isi_in>;
+						};
+					};
+				};
+			};
 		};
 
 		gpiod: gpio@2e200000 {

-- 
2.34.1


