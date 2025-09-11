Return-Path: <linux-media+bounces-42272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC830B52C1A
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C60691C26CE7
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADC52E8892;
	Thu, 11 Sep 2025 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BzQH6HWj"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0207A2E7646;
	Thu, 11 Sep 2025 08:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757580321; cv=fail; b=exjVqEGFiyOLC5MNsBusaanfnmC46fl20Fpd3jDvRGNrg74SYZDibNnnNJKX7CoLdyQ15r+KBsXI6n+c293eVhYeBHo0QgdKfGLKMBumS3QUndlSBmYe8zkLGa8mxqzvKLI3NHpf6pjmOnQevxB81ITlsZ8z9w/F5uRs/xlgMUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757580321; c=relaxed/simple;
	bh=6d3mWuUYDw8tnTR38YyF26BnpnRjF0qjmAf8kf5BO+A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Hui5gGgkZK1se2suVUOMvWJdXrtOLpPGqa0T1KdRMZtTFMkcUw/zyz4b1E9rU9rFMm7H0Dc8OcG3hP2w46Pa/xfp7YL18HmAsf0WH8dLqH4pDKfP2lxPRKxXsc9YX828QXJqa1nwc6qg0vAMxQroODGJ9B5VdpMJoG7QiknkkoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BzQH6HWj; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQceY57OFkZFCjaq1diY1fmaqNSQDj10uz0qWyGcYBNXxl/36gf7zFbYMTim8MptheEQ5W/EmXnAirR3Qpluon+bnTL4frQXwXU4LHSQcjxiko9PgbkxqHnnglr5oswe6uZ+1H9T7pc0fWYncOK5m0Sf1zyejSd/aSM5wRX16Sgdb58fgbIKfH3rbbA8ZKQ0Fx0WNtzAgJdunphMII7m2CX8Qag1DFD7XBvfr9Zr+C9YBv3n6IyvICzKbYTLipR5vGpl3fYEFnVv8MtT2A9OyUtcD/eTAgywMHVX/VNQKeal2hL/UKdmNeVrfWBQa4th1SZYRoAKST1Cxy5bIkq5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYoYb7iV4ipkKuNy+CDk55YkqOIsyYZqytIIP544B9k=;
 b=j7QKM2VByVZifA3br+R9cwHcVUbgUHz0VfknWe9icNRYTtb9yhTxz6NAnRbynLF5ayh3Y7foUfDfIX8GOnyQl2w4RmoNezfqkir/8zp0bSgAsaarmDQnS1h/koRhF7Lyo0xdcsqntw10Kcf/MyKwGXZaODwi8UfNPyfvAmvrS8yb01jBjn+SBpD8eoagREud3jqoB0+qi5qmT3JaOIy1we/Ty/QBumApQAURUsKi1h83rDlR7DALsP9/9+qcog8lgCUKdYU9BfTrfva2szc3qD3SB0zQGWD3u9L6TnLTRJVaWEC96A3Att8zOxVNVS0FsNQ3oQxoaZ9MRMBcRFVlJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYoYb7iV4ipkKuNy+CDk55YkqOIsyYZqytIIP544B9k=;
 b=BzQH6HWjN+bJ0T0QfPKyGG55RH6GZ7SKdnTMuxBki6zsreCmeyrfm+tWjzeYCgn0LJid0+ltN+MljA8FHcHPe7MbD+uJ5AWYOhQL31T4O563hke4I4K99c4qpliv9mOLSpEnHmAQm46LlT0gEajI0QB5GRnbWGGccwBRCnctN07uiA0V3V23LZvBKD1DgTtl9MsDjw+vSkjo96i3bCJR8Z821tcctNwEH64CmMFbB7w2jJRzTg6BKnaHeF9456NF6DiZ4Zpn14NF3DfPEcUT35RkYpYM5Alqifae1GXXkSbgZ8Khzq1lATjoShvLsQF6Mom/b6pKwpFP88402ZOOsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB8364.eurprd04.prod.outlook.com (2603:10a6:10:24c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Thu, 11 Sep
 2025 08:45:15 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 08:45:12 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Thu, 11 Sep 2025 16:44:25 +0800
Subject: [PATCH v2 4/4] media: i2c: ds90ub953: use guard() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-ds90ub953-v2-4-03ee76eb6b59@nxp.com>
References: <20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com>
In-Reply-To: <20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757580308; l=3324;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=6d3mWuUYDw8tnTR38YyF26BnpnRjF0qjmAf8kf5BO+A=;
 b=kJunZ9RMtc/G+tPj1BU7s7zX5oird7AEsi4iQwiXtxUgil+IXq25Gmsq/lq7Bq/t3HxL8rIxr
 yG4tWY2z0R4BWdnxE9XfeW8Yor6xh3al7crUJ9v+AGDZyuD5wKKhg28
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB9PR04MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e6bf1bd-14e1-4b38-2783-08ddf10f858b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUMyYUFMbzRscExUM3cvSXNZSW50S0QyOFg3YkhMRzJPdlFBaXRxbUR0MnF2?=
 =?utf-8?B?RW1NVnRiK1FvbkFhc08yT0N6ZkZOTm9zWHhvazBpTU1TeXpvMHVXQWI4SzlO?=
 =?utf-8?B?R3ZxTjFHNEFGaDJKd2JHRXFEdTBBWjR1Qnk4YkoyenJHMncwWjdzSVlYbW5j?=
 =?utf-8?B?L0dtMThXNjVyU3dkNDVnYmkzbkNUWUZaM3Qzcldjb1g3Ty9XcEVtUGs2eThS?=
 =?utf-8?B?bVZJSmJwQjZjbW50TXJkdFVKQStsdWlKbWZTcm9sbE5pcXQ5ZVlwSWlOY0x5?=
 =?utf-8?B?REQvYnQwRkErdUk4V3BTMjNMNkFuTmo4Q25OdGFIOC9DbWNwOUhnL3p1YTV4?=
 =?utf-8?B?bnQrOU9QK0gvL0E4K1hFMDlLRWRIcHVGdUpsR3dDdGpOakRVZWdJL1M4Z2Vm?=
 =?utf-8?B?MlBRb3FGRGlLbWM5MVA3NDFBMFE4MFRNdldXTHhXOWxIcllpSlNJRDhjWGJ5?=
 =?utf-8?B?ZTRTR3R4TVJFMHRhWk1xeDVXUm4xUkIwUDBXSDNZbVRlRFVuM3oyZTAyWlFE?=
 =?utf-8?B?Skw1R1N4ajhJSy9OYzNnY1pKdyt3a21odzhYdjBVZ004TFM2WE1NVy9HRXQw?=
 =?utf-8?B?UnNnZUtkbXNRang2VWJ6bkFaOFh1MzAxMzR4MnpGVGw5THBKb0txbXFRZzFx?=
 =?utf-8?B?QWlxcG1KREptcWpIdmJjR3ErWEtITDVKempzL1V0b2dzK204TVhGV3IwV3Ix?=
 =?utf-8?B?VWtZVlJ5Z1loNWsyVmc5SG1DYnBNVkdNQnJaY0VhWElNWlBJL2t3QS9OVG8z?=
 =?utf-8?B?cFFWbW9VcTlDK2E0Szd5a2hDUGV0YnBmM0xiUUxPU2NrMDRBUjNlWG01cWFo?=
 =?utf-8?B?THQ4dUNFQmI3SFJCS0xkSzNvbjdPMjBIdE81bWV1VlRQbERmZ2JCVXNzcGJr?=
 =?utf-8?B?RWMzaHVJQWM4Nmh0NlJnaFFCZ2xMeERPWUw0VEtQU3ZHaC9vT3kwOExCVW9v?=
 =?utf-8?B?MkFCejdHUWdjUndVMTVJRmZpYW0rbEc2VXdKMXFtQWlqYlV3d25BQkVxeW1q?=
 =?utf-8?B?aEVuV3puZUw0RS80RzJyajZBREpkbzBtWVBIOERFcERNNS9tSlZwWWlyY3Bp?=
 =?utf-8?B?c01uSUJldXhyVDRsQzEzeFhRbllzL1hsNmFVdmhja21udkJJSlAxOGZUbU1V?=
 =?utf-8?B?TDJJV2pqVDE3TTZRZ2M5Z0MvUHRMMUZvaFZNQnBlb2NBTHRMOGxaenFWUGll?=
 =?utf-8?B?OUtKY0hPbmQzM0pYMkh5UTFkN05yb0d4NHY1aWk1dUljWVB1UzJnMG9TUmVC?=
 =?utf-8?B?dXpIL2dvSTFFUUxQZC9WcDZLL0NaTTgxNkFveFV5WGd0VEovenZrcWloR2xy?=
 =?utf-8?B?MytTdnFwUWVFRDFqbnlGMHozb01jMkdVL0QyZjJHWEVJdllwQi9qM0dqL3V1?=
 =?utf-8?B?Tmc4enkzMGpDdTlWZTJyelNKeUxiUHhsWkJrYTlXT3c3QXZqVXM1WTliMDU3?=
 =?utf-8?B?VHZnb1NvcDF1UVRYSHEvSWVUUk9qMytLbzZUakpWMEdaanZXOU00MStaMTV2?=
 =?utf-8?B?N0FhNTBzTlBsdzJHM3VSUkp0bU9KVDF5aVk1YXFlcENaUFRRZjN3RmI0L1c1?=
 =?utf-8?B?STJBd3ErSXI0N0YwbVVVc21JZkRzVWtXUFpTS0xDWUtWczQzcm1mSzJJcVRK?=
 =?utf-8?B?cDVyU0U0Ry8vWXJzbDJjaENOTWJFenBLK1VWZGxYNkJ6R3dNZ1dKa2w1bWdw?=
 =?utf-8?B?SW10TjMrWUZSdktnZ1V4Ym5KZHlnVHlma1RsL29XcGZGZ0FOek5CVENKK3hu?=
 =?utf-8?B?ZmF1c00wYUtlbXJJcnozY3dia1hEdWZTUXJrQUlJdFVXeWZIVlpRR2l1WDli?=
 =?utf-8?B?elRNQ1ZQTml1c0svR25aYStWdFk1OVlxMjU0ZEhQVXNuMTQ3OUlNMUtCNDFX?=
 =?utf-8?B?TG5RVnNrc1ZNUVpwbGkvbWxMRlhZNWFCQlBlUTU2WVZFMU0rTFJuU0I3RUJY?=
 =?utf-8?B?MVNBaHFPTERUY29JSitENVF5ZElhbnZFOE4xZGx4T0Z3emRDNy9yWGp1REMw?=
 =?utf-8?Q?ThxRgN25lp+EcfSGmnprhhjX10+CEE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGdidE0za2F6Vk01TGgzdGdrdVpOL3g4L3JjcCtrQmdMMFA5WUJoL2xnM2hT?=
 =?utf-8?B?SWxPZmorQVFvbVBWSGlBMFM1K2dJUHFkcjByaFpHRGo2MHR2RXVnYkExSWdS?=
 =?utf-8?B?czFRWkNhTXN2VGNvZmZHMldNT1ZEUmx2T0ZNOS90WjByZW1RdklmbjlhQ25R?=
 =?utf-8?B?M3puQXJES1o2WkMzcXh3V1dwOERBMk5uR2huRWpWRDJmSVY5bVR1VEgranQw?=
 =?utf-8?B?eUx1cTFvNVBpdys4M3c3bUNFNXFoczJiK0pBTUhWdURmbFM1MHB1SkEwWmhT?=
 =?utf-8?B?cWozWmNXV3FJRStST3gzUGJRdXYwQk9rbWJBK21SaFRqYnB3Y2drbjBUUXJS?=
 =?utf-8?B?dlhXdklhbDd2eEZMWFNid1R3VkxIZ2hlWE9YVmZJaWFXcSt6ZEZ0ZVhqR1RD?=
 =?utf-8?B?WVNTRGx3b0dPNzU3WFIrbUNJdVF4cHhIU0FaWWQ0MWlnYU1IZGI0RjkzKzFU?=
 =?utf-8?B?SFhmWDN5WVJTenNuN3k2Yit3N3JSVk1VcUo4STJwMktpYkwvamRBWWpFdis0?=
 =?utf-8?B?MUo3WTFndEtxbFUvOTN6dXlEMkZwRHh2eUtXYXA4S1p4eWtoT3hBMm1VZ3F6?=
 =?utf-8?B?eVRSaVRUd3ZWcVk4dm5HdlBjOHNiUW5NYkRUbkRaTnlkT05kOHdLWEpFTzJQ?=
 =?utf-8?B?RUJ2eHgrakRnREJhWFd1aEZXZXo2UmR5ZDdWTC9OcnlBWHdubUY2L0QyVGJI?=
 =?utf-8?B?Q1JOVlZrQmkrMTE5QjhqRHVOdCtFNzlxcm5QdklPdTVpQ2lWdWlRMUVkNWRu?=
 =?utf-8?B?dk5BR1lIakZQbUFvZ2d6OWdwY0tLblRMazFyN0diS1hqaUdMVEFBa3hwd05O?=
 =?utf-8?B?d3hjNGZTcUkzdEN2cXlZVGRoR3g3QmwreVdFSUJSR29ZZnFsZnFQVG9Wc1E0?=
 =?utf-8?B?RU5VNS9iWFdac2NJTzMvSDIrcU5iOXFZS0IzRHFveVB5UlYzcmxrNjRKbmp2?=
 =?utf-8?B?S2dQTmFOMGF4TTFKaTZCeDg1U0NSUmNDVjA3SUtPTGxIMkR1WUdIQzlQeVZP?=
 =?utf-8?B?ek5TTnNxQlNtOEJhUHk4dnRNTG96dHBQQ3pWRENoVGJwNnEvUjJpY2hXRkto?=
 =?utf-8?B?cm5CKy84L0hRK0ZRb0tFV3JibXpkaFlaQzJuQ0tpMy9raUR1U2h1SHo0MzRh?=
 =?utf-8?B?dm9vaHd0ZStuaUxpUjRIb1BTOWRPTnpEUWJDT29ib0VrUW8rbDQ5cTJDbkUv?=
 =?utf-8?B?djJGc3VtOG45REVlUVJLNks2Vkk4WHMzRFBTeGo3TitSWTh2SkFMVUI3T0xZ?=
 =?utf-8?B?WmNFRlJZOWY5akk3UG5zV0NsWGwvQ045Ti94a0dnczNJQ2lDZUpwekZFaCtt?=
 =?utf-8?B?QkJJU0F0VXlpYktjWm9tbmZ6c1MzRlFLR3RLaTdaeDg5WEZlYXZvK0VzQVNx?=
 =?utf-8?B?UTcxOGNldStLYWd1OXZBSE1uSWNmK1Jua2pKMTMrYUpLMHR5eVZjY0QraFBW?=
 =?utf-8?B?NUs4b3h6SVZrV3pGdy9LSGtKWlB1NWJIRkY3S3crWkxYanpVVkFOdXBuQWZR?=
 =?utf-8?B?bWJZQ0RTRlFkdXNEd1JnNjhkUGNIN1Yzbk9aOEUvbS83bEtsSFIrU2Qza3hV?=
 =?utf-8?B?RnZmWVU4eVZBczU2VWplR3JsRHd3SjFjRitLbTVtR2p5N1JyNVdiY295QjJK?=
 =?utf-8?B?MTUrZ2dTU0tFNG9iTjZMSmtFN0tHMllIYXRPM1hjNnRqME53bjVzUUJGbC95?=
 =?utf-8?B?RHFJSkltNHUyVnlQaWxOeWU5SFJRbUtISFgvMlFMdmpyejlGb3JQNnJmMmZM?=
 =?utf-8?B?dE1wenBCSzV5TVJrbEVheS9acXVJWmhVWXpsN0d0ekNNelQ3WU05d1drRll1?=
 =?utf-8?B?cHZpTUh1QlNOY0pNSExNNzg2aWRPTXJYY1UyMWtFbTRqOVFCa3BvUGtLcGtX?=
 =?utf-8?B?ci9LRWRMaExVTFhyRmVvY0pGNEVOREx2MG1WcWRTRnU1M0pYa3NRcU1sN0l1?=
 =?utf-8?B?MDBQSDkrMDVsTmRTMVg5Y0tuTDhGUTdMb3cvUHlmUGtqeFVPd3NDc213dHl2?=
 =?utf-8?B?ckpUSjNHR1Y3MVFaclMweC9wQ1JtNHJHZWRWNXNkeVA1ZW4ySTROMWtWU0cx?=
 =?utf-8?B?cXpNVExrOUJVbVhVVzk3MDIxOWcrT2l2akgxbGtUY1JVL1BjMWU5R3dSdnlt?=
 =?utf-8?Q?eydukmIXRdL5EocZDaanx1BwV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6bf1bd-14e1-4b38-2783-08ddf10f858b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 08:45:12.5699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TzKozHpZ9QPyWYoV4IXJ0IllmttxFZ4SANKEPieF671K+SaNRjL35ft1PS27/2LrQulImoydJRVCym1CswKBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8364

Use guard() to simplify mutex locking. No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ds90ub953.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 0e3b9796dc1aeae58e626e06e7068b20b40dd213..defbd728a0389219397578feee2d3fdc4042bd31 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -112,20 +112,18 @@ static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_read(priv->regmap, reg, &v);
 	if (ret) {
 		dev_err(&priv->client->dev, "Cannot read register 0x%02x: %d\n",
 			reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 
@@ -139,15 +137,13 @@ static int ub953_write(struct ub953_data *priv, u8 reg, u8 val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_write(priv->regmap, reg, val);
 	if (ret)
 		dev_err(&priv->client->dev,
 			"Cannot write register 0x%02x: %d\n", reg, ret);
 
-	mutex_unlock(&priv->reg_lock);
-
 	if (ret && err)
 		*err = ret;
 
@@ -184,18 +180,18 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto err;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
@@ -203,14 +199,12 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_DATA failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 
@@ -226,18 +220,18 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto err;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when writing %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
@@ -247,9 +241,7 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
 			block, reg, ret);
 	}
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 

-- 
2.34.1


