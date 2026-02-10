Return-Path: <linux-media+bounces-52528-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDC/BkNoi2kwUQAAu9opvQ
	(envelope-from <linux-media+bounces-52528-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:17:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 861D911DC79
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4B9D30BF9FB
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 17:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2B8385EE9;
	Tue, 10 Feb 2026 17:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WnCEBoMW"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB14F3815E1;
	Tue, 10 Feb 2026 17:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743568; cv=fail; b=dNxSipZCHitptUBF55V/QVqY0LDovJeNDR5pTFsigexTp2HgHs0Cxagp8mhvdx+Odlz4PQwju4PlCrI2NRHLwYgzjJRdNSLSCMqNLYwwSxeCFF8B0FN2QtEt6jtwptxb8JhKE5LdgozmE9qkcia76rJCGTYkYrvT/emyIPFG/Mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743568; c=relaxed/simple;
	bh=wK22ox5/Dyvfm0P0CojYFSybGGnjqtg+m31J8bLRiFI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=af9OjzxLrKN1YKq5YfwRUwQjHifXXhTbUMPBFzsScSikCpGAYvHufyJJ4yAM+IYh2iibQUn6BKE/RluomK7SXbeRYKM7AeOT2QQNTWeiuPH09xAAMgX7AKMcb296Pv3bP01d0mrrfsNiYANL9pW3Fn6er2fTJqgm20xPpDYlGXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WnCEBoMW; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPdSwbaCFLAELxzOwTr25m7pSxoXPHpSfDnHzrPVwl6JQGPFUZ3UfML97NiVA3yDa9W0DcoBZAbhTtiRXBIPcZXkDDB59Umz8lCYwF0aQ1Zool188sM2cB8wiVu5RO4XoiqZ4DUUEHP6NnYMfr5bsrs3FMpkSE1TDCudPLoV6UgPW0nqYtqImxxQK5eSBcAKzrflfkfUIEi/XU5lKz4bpwh5hSFZlPkk9mntxCrozIaEjLcZJcmioRPwPqi38POS4s386P7xLsRqKGs+QZrt0tYsP4Ups7rrMCPPB22+xfpGHTm9gM8Sa/79FZKZZVo1ylGF8l/a7ilmv9SpCRBPzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihtCsL1EPJofh6h5aNLbvxvqCCJZ2ykvv/8Q6fj3iQs=;
 b=rO8qMJ972V4Smu/N0Ytycw416JWSspaw9svFa6FNSUeagqlXEVVDabJZygkFPKKGGmaKPyZn0vcRG4PoXz+WdRD29/uG98130qUXyCJwJZpLOpGCR+MAA+qVXNYPZPlfuVAx4+ah6YscwR0mApYt9lJuN7UkbRCad6Ie6h8RKcaIdlKPyj1jHgm4HVDzN/9UgtmqdLGIMJN2x0Od9DDuUEaow7h5JzchQ81kwQXIl4XifX+0LDe3y/Qs5fH6KMl83p9yxwnHwRs09mVy3gIn1EM2GejIvoC2CUNNQtZdR7ExkZagTLrNZ1iI4mI5XCdN3OoQCyJ5/7+j3IniR+iX0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihtCsL1EPJofh6h5aNLbvxvqCCJZ2ykvv/8Q6fj3iQs=;
 b=WnCEBoMWIF0PFyR5ypGPplDZJ3VfP6MR1zonW3ecsYa6Bt9PNrpMNnNgESG6dU10307bR1AanVQbZx0s8EFHRWtPw2Ab05huQbevy6BiMjn18Uclb48X85JYsPVxosGGhKFJ19G5njRCkwO3di21ZPb+An4bS4grisXbpyFs7kLGZU5GrFlTHJeXq1dY5k3Fs/QqEYTR/mYWHIVnwZ537QqO6sRwk0W41nDjWCn3lEwI4I+Enx1mtgDVEF1OOJuS30GB7YJXtULCHbJ5Jrx9fB3+ufMQQIRaOaseQDBbUIT6CviIH+v94xUjmBEw076Mj+G4YaYSF9TkRCKuoXlvag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8428.eurprd04.prod.outlook.com (2603:10a6:102:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:11:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 17:11:33 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 10 Feb 2026 12:11:08 -0500
Subject: [PATCH 1/6] media: synopsys: use
 devm_reset_control_get_optional_exclusive()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-imx93-dw-csi2-v1-1-69667bb86bfa@nxp.com>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
In-Reply-To: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770743486; l=1171;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=wK22ox5/Dyvfm0P0CojYFSybGGnjqtg+m31J8bLRiFI=;
 b=ed0GSAd6A2P6u+Ho8uBDtTDglUz3RlqOqhORONOH9nuDS6S42VpN2NmCh7LxQi4jdjyzduFde
 J3EBphw2a6nAYjRlNYXT0WEZeOVnzQu6OEOi2P0VB9amhu72VhYX6ss
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0102.namprd11.prod.outlook.com
 (2603:10b6:806:d1::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8428:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e4e945-5384-49b0-e3ff-08de68c77079
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MDl4eFdWQUY4WTJQNEQvM2ZBdUR0UDhBNEZMSGFBSjVReHBZMHBKckNDQnRL?=
 =?utf-8?B?WkVSV3FaZGNWcTFrMzdYVDRJbFU4OG8wWGJtaXBXTnM3L3NHUThPN3J4VHcr?=
 =?utf-8?B?SWtBclg4Y0VGL2JYM2JwejFjZ3A4c1QyS0pia1NUdjBvUTJtMmE2eGRhSUc2?=
 =?utf-8?B?cFpFVGdjL092d2xHeWtCbFlFdklQSkY1MVpBR3ZadlI4SDZCMk5aNnFyMmhr?=
 =?utf-8?B?RkhFdnZyQ3hjbUZqbGtOSWM3MnlkOTREMC9MMmxpZDZWVDlkNmFab0R3ZkU0?=
 =?utf-8?B?MmkwQUV2QmxWTzBONWRpcWtPNGYxRTNBZFNBTmVteXlBaU12UXZjVlNQUDRU?=
 =?utf-8?B?NjlsSUlPK2FqSjJiUU83UWhvc0p0akNuNnNrZStlY055VjNZN1dLRHVIVkw4?=
 =?utf-8?B?V0tHN0hWbkUvR1gvM2hXRW54d0lrdzdWem5tUGNWam04cVNGdGY5bDZyNlBT?=
 =?utf-8?B?dlBQaHRSNWFHRVJnSFU1ZjRzMk41SXFmNXAxWmc0bk13ZEQ0Vlg5Z3lvVzhD?=
 =?utf-8?B?cFg2ZWxiZTcwR3V4ckdHbHZONmxMVENISzdidVI0NVpHMzRVTUU4S0tISWhs?=
 =?utf-8?B?OUY1SUNzT0tTR1VOSXREVVBsYzN2eEdScDEva2VDaFJwT3J0eTNJQTQwc2M0?=
 =?utf-8?B?RmJkK0NQQy9lWkxFUk95RWVKaXVyZUk2RVR4M0JBTlZIaHM3aSt3ZEIyR0hy?=
 =?utf-8?B?MGE4SUlEVFhMdWZ5SUo2aEVUQ2RQNVRuckNybWVaSjUxNWM1OTY0S0pYUGdZ?=
 =?utf-8?B?ZlgrN29Kdmw0TWFLMUh0MlZ6NEFaMm5lTVUvbjhSWmdCSDJzUWpXZmtDZGNV?=
 =?utf-8?B?SDFTRXhObnlXWWI3Qkx2ODhvMjhYOGJ1Z0NZVTZ2cFNSSlhVNE5YelVYcjNl?=
 =?utf-8?B?cWFqcEgxamszdnhnR3Y4MHI4NUN4WCtGdDFvVVkzblNXNmtZWXJaQzFqZmhn?=
 =?utf-8?B?cE1lbXVvR21icGhmRVZMMlh2WTErZ1JlZ0NqR0dRQU1MNlhONFdMMnhTaVRG?=
 =?utf-8?B?dzBWWW8vc1hqN1JWS0d6LzNxaU1VWmxHMmVML2cwbUx6TVFTaGZnK0JVQlNk?=
 =?utf-8?B?SWs3RHRidmRlbkhuWHJWY3JvQ1IxR016SDJIa2gyZUNtNFRVNHVPanJYM3dY?=
 =?utf-8?B?WDk1M1FlTmF0QnZhdjYyK3h0OWVnVmpNTXo0RGY0QWowbE1hc3hYWkN5c0cz?=
 =?utf-8?B?M1JjQVBBZTJxbHkyZXlhVzBwRWo2Um9vQi90WXVmWFlXdmdIcTlqVExjeG43?=
 =?utf-8?B?L1RUWHYrSEpuL2NkcjNCN1pGQmR4ckMrQmF4RldUQVF0YkNVdmFvWFAzZ3Ur?=
 =?utf-8?B?UDJhU2ZlT3E0VFhZVWEraFdhWnIvRklId3ZVamJ3YlFLbnVmYVlXa3pVWEhP?=
 =?utf-8?B?SHBwa1JQWTl4WldlSkFNWkJOZUJFQzZWRFNOWVZOeTlDbStlV3l0cGhaM0hq?=
 =?utf-8?B?Z0d2SlVKQjlEUEw4UE1HRnpodVVHdVkrTDEzMjhsalg1VHo1MVpkOGpkUnZ6?=
 =?utf-8?B?VnFMeHo1b0tHdnBtK2dqb1dWMExxTVZUeE5WM3dPMFRMYXJCV1hBYlF5VVhX?=
 =?utf-8?B?bUg2bUV2azlNT1A4K1FEa3UwUDhZM0cwdVYyd2lxMGJRZFYyWHpwNFZ6bDha?=
 =?utf-8?B?Sjk1dXl0c1FaajhLOFFacUQyK3VWSEpVd3U2ZWh6WnlVd3FTem1VTklGQ3Y1?=
 =?utf-8?B?R2tmNTJtdTVhRjJ1OFdzeTlkc0wzUzIrN3A5WVNGRHN1VUpoSG5ZVXA2N05D?=
 =?utf-8?B?OTNDTkc0bzlqKy8zU1R5c0NFVThrdkR5Nm13eEZFQVdJeklSdFRRcHNBV1N2?=
 =?utf-8?B?dWZWYitTSUU4WDNOZVN0VmxBeE5uTjNwclRBMlRwN0FnaW16cE5tQS9hNVBK?=
 =?utf-8?B?aFJmUWhKTjE0M09ucXlOcHYrWlRmV1dxaEVpUlVnUkQxRlZud0RlZ3Nsajhx?=
 =?utf-8?B?NUNWUU5OcFByKzgzVUt1V2FJc2xqOGljQ1dBSUxkZzBEb2ZZZWIvMDZQSWJY?=
 =?utf-8?B?NkRaM1RkdkZwQ3dDNm5NVC9OTVh2aFJvUEs5ZVlNQnhCYmVzMWpQM3hUci9y?=
 =?utf-8?B?TW16cEY5Myt5UG1IbDhDbDFNTTVrT3d6dWxxaHhWVVlueVJiVUE5VzlHRExZ?=
 =?utf-8?B?YjBraTVkNnA0WnZoQ1hGcTJRVExGV1VDcFowYTlCOWZpNkE5WTFadFZwRU9K?=
 =?utf-8?Q?eX7o6gkAcJabEUTJ72Nd9eo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q1E3MWptMFBBTklPMVRtYU9zTzVTY3dBR09UNXY3SE94RU1vK1JUem9pNk9K?=
 =?utf-8?B?Y2ZBOUZjcGhtb2V1cWVCMWFZWlYzQVNlc0lmYkd1V3JMV3NXNU1DelduS3V2?=
 =?utf-8?B?RnNlTVZzRVFkL250d1hzV3luYmRaZjFUcEowWlUxcW9MMXJGZmRKRVZHSFNy?=
 =?utf-8?B?Zlh4ZkpJWjhvOWxaaXJ0V3orK2VoQndVTFMwYmMzbzVXWmdQSzU0V3NxY1Vl?=
 =?utf-8?B?WXdYOHhOSGQ5SGgzYU9lUWFtRHFzRGlrMWd5eVhNNEpNMERRZVI5ZERnM2tF?=
 =?utf-8?B?TzZVRjIzMnV3UEY1aHAwME5YTmZrSFA3K0diWTNEVS9VY1FmSVZsbHdjN2tM?=
 =?utf-8?B?WHJrYThncGR6cVYrOC9Dc2ZPYlk0aVBGTjVOTEJOQ3pXckt4QndRa0s4bUlU?=
 =?utf-8?B?MjRyNmlmazk2WitDQXd5QktFUjVFWlg1N3lCODdKdDFxcVhCWHZiTHVxMmpF?=
 =?utf-8?B?cG5uZnZWVWtBVXZyZlljNHNCTmx1NUFFczNYNlpmbEpWT1pQVTJzbEVvSlVz?=
 =?utf-8?B?YVcyYktZbVBXL0Z2TmJhTWpKMVlSRXAxZGtqWjJqNDQ1VVNIRFlaMExWZENl?=
 =?utf-8?B?SlgvZ2o3bmRvNTdzd1lISGxTY3MxTUUyQitKZ0JMSUlaZ05rVGxZb2g4ckRU?=
 =?utf-8?B?cmFpbEtRY0xNODFuMitEdHJQMTFCYkdvUkhwWFV1V1pxNnIzNGJtQzd2WEpQ?=
 =?utf-8?B?UW44bmNxR1pmRHFWVVFrZ2lUSktNVjM2RHFGUDlCb095NUt5MEhDakRWQkE2?=
 =?utf-8?B?TmlyNTJSWUV6T3RQdmduVFhYK1FqdGFLQTBXREpQTlQrV3FyeGU0SWEvUTJS?=
 =?utf-8?B?VHZKRXI1UzZoSlVUd3dWejA2Wmx5QkdGY3YxOGR3TmR0ZEpBWFZDNnFxMkhp?=
 =?utf-8?B?QTlqV3BiY25aS01YRWhwWmgwZ3RTL3FOdWJ5R3JtNnBsOE0wMUdsaUNWSUhD?=
 =?utf-8?B?dW4vQ2dkcWRNbmxIa2VWOUNSbmdJTVd2NnMxL0xlcFE2ZjlvMkgrQkxVdTlU?=
 =?utf-8?B?b3kzaGl4TjZxUmF2Rk9ZQjVycnMwdzR5Z0tWUGZBOWV2L0pnZnR1dmNhL2Y5?=
 =?utf-8?B?emF0SXRSOVgvTmVBditLeTNnY294dDNRWm0vTkZSalY3eFRPUUJLNlZjSmlQ?=
 =?utf-8?B?VC9ueS9YOUJpbDVPV2hwanBmN0YxTUJaSFUzaEdSQ1dxUXBOL2R1dG1Wd2pm?=
 =?utf-8?B?N09xMzdLT0g3d3kxVEdzanA2dTdITk5zWGY1ak9sMTNJeHRMUnBHd1QvY1JY?=
 =?utf-8?B?eGFtYUcwQWRuQ0pmZndaQjRPWkRQSHhZaW9UcHZjYXJJQ3FVQjlQdk5kRWdi?=
 =?utf-8?B?NElPRXNLVm03QTgyQ05oVjJKcEZXSXZjQmJhWk9xYTI5UmtUcEFzNTc5ais1?=
 =?utf-8?B?SnVISHZnbUlYZnRJZDVUUGVnb0U5cmR0TGViL1lsR1RIVldQbmhBV1h3ajQ1?=
 =?utf-8?B?UU1HUU5vb0QreS9DSmFTN3FMTlQ0ZStmY2hQWVcrSnlabjcxYU5mbFozaHdD?=
 =?utf-8?B?SEI2enBXNUlySEU3dUFjUk5wQmhlYktwU1dyWjRrWFRyU1E0NTBkVUlDV1pD?=
 =?utf-8?B?TkxFckxTUzBCK2tITG5URnB6VHpXU0VmRXBSUVd4UWloTC9MSzYvMHZhejlI?=
 =?utf-8?B?VWNvMENRaXBCNUxPMFNHd3MyRkc3TXRucmcrc1NqWDJQeTNjWXZCVG9EWmFn?=
 =?utf-8?B?YkZkODVOekY3aWVITTM1QWR3VXFwbjRRdnFOemdmWEVLeTAyaHhBSFlHa3Jp?=
 =?utf-8?B?YURNdnZKOE1mY2kxQVVIMVZRME5FTzNybmQ3ZFJwaVJ4MGpjQUg4YlJaRWJj?=
 =?utf-8?B?YTlDSElQRUd2eHFVOHQ1UTZ0ek8yOGdZRDM5L3dHZDYyU0VKdnpod2dibSs3?=
 =?utf-8?B?SGJTTGd5dzBRV1I4VldjMUo5NFhjcTNsUkpteXU5SUFybEhkTjIwcXdKZ2tz?=
 =?utf-8?B?WWdGNUFRcjY5d1hOYXh2ZWRJNlIyd2pUTVBNYzFZOVpBUVZ3VzNjRHkrWlhO?=
 =?utf-8?B?aW5OZVZSamsxd0NTSmtKdGx6ZmEzdGF1eXV4TEI3cVB5N3ZVM2tlSnh6WHUy?=
 =?utf-8?B?bWgzQVZ6M0EzMmVCVFdvQUplQzZNbEcwL09jRXBtZG55NzZaOVkxZ2NlbHdC?=
 =?utf-8?B?RXovaTVOQjVFU0lxRTUrWWxXaTAvRWR5RmozZit0R0tYTWZPbWVnZ25VU0FV?=
 =?utf-8?B?YWlDRFlyRkRzdGl6QTZuRXhQWlM5YnV0NENsa0JkKzl4TVZWaUxwdkZVL1dw?=
 =?utf-8?B?S0JPbTdhVEFuSTdabmxYbHVyMnZ5L0FyNFZzeXM4SktxRGZENW1pbDNKL2RN?=
 =?utf-8?Q?SvOnjcKLStEyC3ZII0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e4e945-5384-49b0-e3ff-08de68c77079
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:11:33.0011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KM+wZz2cD6JGGTgUxDDZZfL7QPBHe+5Cl3/o/punS4UBy4o5AdjI/UZjeyfWpjQn/pefGgBBBiyi9wKHdlhKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8428
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52528-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 861D911DC79
X-Rspamd-Action: no action

The DW MIPI CSI-2 RX is used on different SoCs, not all of which provide a
reset controller. Switch to devm_reset_control_get_optional_exclusive()
to support such platforms.

Reset presence and numbering are validated by the DT binding.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 170346ae1a599e43bba9d19476ee4d65124303bd..0cc892f4a1b3c6ce575a5d4fca7acf7057f7b7f7 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -639,7 +639,7 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(csi2->phy),
 				     "failed to get MIPI CSI-2 PHY\n");
 
-	csi2->reset = devm_reset_control_get_exclusive(dev, NULL);
+	csi2->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(csi2->reset))
 		return dev_err_probe(dev, PTR_ERR(csi2->reset),
 				     "failed to get reset\n");

-- 
2.43.0


