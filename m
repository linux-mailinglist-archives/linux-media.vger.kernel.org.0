Return-Path: <linux-media+bounces-49891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E89CF2C90
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 10:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D181A301472A
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 09:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6007E32C31C;
	Mon,  5 Jan 2026 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="aZAE4Lcg"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021089.outbound.protection.outlook.com [40.107.51.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8950E32AADC;
	Mon,  5 Jan 2026 09:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767605696; cv=fail; b=V0nl1jrBe9ni+c/yyJb7vuB914rIQQY51qfdfw7JpLDB6PpfxnqI3LOjfbzpZn70HpQ8u0ILZ6SA9P6Nm+0g/7QQM1+hC4jcxoPupqQkPiqzSdiWOPXqABfbnncgBGQBJAZru4G2sxS1kg1/ukDAC8tz0OMdMWrfu016E4JKbB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767605696; c=relaxed/simple;
	bh=47SSyVudXDRrhJNX/vzDB1u23YTxGvliOMofzZQP9zY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XheoV49yWD3BgOqhOnz/ICeorR/24EAyw4CT42IPcLFo6GxA3Q1cwuYlUaSXrUlw/Up6Renhxekw2xaKq6Ga7z4dt+oURra6yTtog5MARCPWkQovzscQ82s/AK2TPQWqvkFoOiAjeA2qNHoHvjAt1stTCI9vD3Pnw/8mAwdXW/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=aZAE4Lcg; arc=fail smtp.client-ip=40.107.51.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y79IoYEkc0Dh18ApRHyydzF8ooEUAKAuQL9siQX3I7G4XB+Jiz6xgN5P2LUHYoFfwQMERGB2y7V0ThugPAi+Mn6bMih8bmwt3FLX7sjLLEVUwXBFjJya235Mx5BcnkuPxI1iz813rRKbiHHUAAKQA/+w+rkuXhrEM5mLLchUk4KSmJJVmzhpOTpF6MI72mEvd8QBSJWGlZ3XYHyLpWdskcRRXiMkaXXRFrek13XatfhqzVuLLNZ0tE6ptX/vPb+uUrI5vFyWOV3TiOerhTK3pTlwTaHsMviVqXwZwdbPkKqKOW7fxCvR+ozarhQOSuuUcBiHR4Z6TOwzP0l4JPdVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvDDL5PnNI7GJl/6ikk2eDmXVtp4qruiJvvL3iEuqx0=;
 b=Wl36MDOw1eLYqNdGodVVEbaFkPsxR+iaAZ2yS05Z02XbQiPhZqYjBxvhLiUZsjRZpsNninSofZy/2JwyFJOVScvJsL3ao0DAyH/xz2R0CIVOSngD8GfSQZByG7pKEH25laW1eJKiL8nwc7przkOE2KJJchobpbS5jQmcV8SbLxoH8rnJV9/GPhhlv+sINBXMjjKuBwGQ2sj4SA8p0hOCZoEjOJCppHIjhvqh+4EKhJ/LKKa9X+3+wuUEcvRMY+1Po4NPxEmmNj22K7rrc5B2scqYF4DFw0+HWIdue2qUNDd3vNw/I1zbvBN34ADh5FD15mjUW6+i6xMGBVgIUkqk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvDDL5PnNI7GJl/6ikk2eDmXVtp4qruiJvvL3iEuqx0=;
 b=aZAE4LcgNav7RpkEEJSo4yyNOhwYEwteYB2SxfYLZwugTR9JcND6AxRoae+1ieqemuTaCiwGXpdl8XFuhf82sHwPtViDRwjBr5veEqaANHRZInJSw3AGj8B4F5a75Nvi61dt+oOhVjbm4jl4N+eFRXlOnCXvpvKy/V9I2i/WpuhVVV5dPzx4c8UwsIui5Ed9Mqliwqn0O75lromsAjzdJ2KKEHuJTwl+VAlSJtP5w1AAfL6NsHHU071ZxFcZLPlaq/0MJnvnGtO5sjdiTh0Jo484CfnKeXKRhksneKkgVoXqK7DMEu0P3L8y4pZO11nkrestARTFoVPCGmOOZP8fXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PNZP287MB4122.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:282::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:34:47 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:34:47 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v9 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Date: Mon,  5 Jan 2026 15:04:13 +0530
Message-Id: <20260105093420.110973-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105093420.110973-1-himanshu.bhavani@siliconsignals.io>
References: <20260105093420.110973-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::12) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PNZP287MB4122:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b483e5-144f-446e-36ed-08de4c3daa6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BpO5501y5aa1UqvBVMNxEkB5xa3JecrwJCXHFyyvBO+kZCCaUbBcYBfAtKty?=
 =?us-ascii?Q?zMgSFwrLKGqgTXSUKYrmWn6P4ULCzT9No4KnT196zSA/wyIakPb959rqQCR4?=
 =?us-ascii?Q?QIk+HD+T0weL0kbelzMxjtqZ0FAMw2m00So1GqHG7klF6dpCNa2S4AmtkrQ2?=
 =?us-ascii?Q?ruFjsq0i41Avq/XCSWkTlfLM/3XCO0zwQFE7tyf/hVoPXoaA0MqzyPPeI5t4?=
 =?us-ascii?Q?iH3fD0spkgnQbcyTBmwwAKrFeGDX3NINxUdAwe/R9lmRzqlaKyjgWXO3o3ZQ?=
 =?us-ascii?Q?A+FqES+A+Z7TpvYeXLHjDtXLWVzwROSZa9L8lnjtBbLecZYNKA5PzE8uvxwX?=
 =?us-ascii?Q?ndok8Tb1ziS5WB/LU4/wvWxzLWeLC6IOJB366tWY4yVF7/1B32mZB+t3PQqi?=
 =?us-ascii?Q?bnikgRa5T/I6VVMHD7w02Nl2n1MZTNNBhuUgNA+t53/dGX7OCKtvZ6Oi/IOH?=
 =?us-ascii?Q?Bh4sAA22LMOhw7OWQTbUqqmlw26HEV8elGIJVc25/eoMWGxLz/nc1rON2OkU?=
 =?us-ascii?Q?Itcxc3BE+Fsu0zYhJqX1FNwjj3v/nNErZ8XjchKOLcs7/5TGj3EtaH7aipnL?=
 =?us-ascii?Q?qpTghgTvy1DWlpP1cvg4SElKiToq9CMrbrlIq6NdCXL4Ejxp1jymVBz00kpU?=
 =?us-ascii?Q?TP+QiDTKkNnJa/XXIq98rvFmQSfhFcPtm+kQkSPo+Hp4BVUfbf2fJxNUKWW0?=
 =?us-ascii?Q?LrBQNAoexii6ZPgQLmah0Zp9in4B1yNwfyG7qOkmBXZvUuyzf0SQ5d9IC48X?=
 =?us-ascii?Q?/whxryh5uERN2NkKxqxeuJBk78vJA7Y6M7r+NuJbAWBDR6Kf3H3LAoelLSZr?=
 =?us-ascii?Q?BoEcOAJC7WR9CSl4eoBcBu06vqD/Xrc4qyXNmVkKkUj9GKzPZzoY+xBjwVXs?=
 =?us-ascii?Q?xK3blh/X9EMfaHhYS5MYLjEMVEIjO3K3Mf6Mb+tjR/OkeGzTwYsEwj7e+F/C?=
 =?us-ascii?Q?9rIb9HO2kPTj/odlDMOg5Ip/hdmYhJzZxIc7VuT6t/Nz/8r1RfHyAmw3QmQ+?=
 =?us-ascii?Q?I9SDDk00CpnPf5HC//fCTJ0e6rKA/ppElO3r5WOKfLXS91CklTOKF1hjJQYA?=
 =?us-ascii?Q?cAT7GoPRxr9v4Vi2nJ0thmEyrP9WHeb4aNVMF2f24k2VK4Uw2kgcNl0sWPTn?=
 =?us-ascii?Q?Q9WNFttOPcUAxHgq5xOqlwopiASQM5OjycFtPipscQYMgmnfOS3gPUvxEqPd?=
 =?us-ascii?Q?il44RpaW2csF04WWxMonZW1emryei59OuCQWKONVO7JDqDZDJQkF3iEa0pb2?=
 =?us-ascii?Q?wh8CqsxUM5eExgTLJgVcIFGuVKX2moU6x4Tx3pesu/Hsgcpms5YczWcPLiqR?=
 =?us-ascii?Q?rBcpp+MDhT3mSm5IU76gl/k9FPA5CULKun8BPOUfhYkWClIhUzvGE/D/I6ZS?=
 =?us-ascii?Q?VeNDq5h2U7FDyYinRlMiT2ZzzophhsR3vcUpBXXYkasMriZdZo9NQ1T0mdY8?=
 =?us-ascii?Q?yVZwkXtQVelJdzESMfmPkwMgejLWHCLHY54xX9kK8Y4NfSXW5y4YCnPYb3xP?=
 =?us-ascii?Q?yLgEBUEYMkq7NmP/GADqrAkQbUDrvAXMXb/e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R+aMwalopzttxvsm/DynqSCwsjWe+f2LHfvEcpx/f/IFNQSSTv3jkeexb8id?=
 =?us-ascii?Q?j3tm4IopCPmDS87ZL1PT3MBt9dxP9lEpjdxc8c8XKPbUW95PKjAB8C/5OZP7?=
 =?us-ascii?Q?QU00U/EK2cljSyEa9Eg5DRPt85cbJMQOmuX2wUHnXF8HsekFiWcFCmMFGByY?=
 =?us-ascii?Q?Fey6u4GTGyJAhOrI4xsWmsoIaLmcTBKmk9wSgPyZPTO99MPrHkt+ASDq5JyM?=
 =?us-ascii?Q?N0pNvECR/Qlz9mNcoGjXuhG8J/vgF/5NYrkxRwwe3lX3HpgXYK9LrNS5jekp?=
 =?us-ascii?Q?VZMGAjBv2EaqqsJqX2qu8/PpeYDakvf9k8soM2fp9nWesOpju7M32HLacQCH?=
 =?us-ascii?Q?/l21bYQCeT1nYvyA17GDa9Fo+3cesYd5yJCN9p/uPsETdwQRRNACwVJTlO5q?=
 =?us-ascii?Q?TDGAtnOyRLn6rf5iK1Msr2gaBP/xH7CRxQg2FUQ7zClUKQIh2akzhh/oNVKd?=
 =?us-ascii?Q?nnxoUXd4Q+GPR96PSA6aQ4aRq/M7jZ1f9LvzB/jQ/SrFEMkNJ4X3l2tgB8R7?=
 =?us-ascii?Q?1T+yO6+gzGufOyuY9niIqzITKjt4d2r6BAZRpdG6YFI+H4yvnk/YeBn8zgSi?=
 =?us-ascii?Q?Oo8RXeuldWyJPY0YNRVXYssdMgNZRHFnV5lhfx+GOTBr8Yt9OSYuJqmHFWDo?=
 =?us-ascii?Q?grIQIjpaAyUEUlkVDAgoMV6oqUqDaSybnDZgc+h3h9VTBj+0rFuukAxS+C2V?=
 =?us-ascii?Q?eZOEUBgzSZ0m0qzavuPe4dvsq2v58UpzKekq1kaooG+Z9KXx5oZ5T3aVar67?=
 =?us-ascii?Q?G1DQexxikBMDbSwQW2xNFGoI4MXyapsq/J/Up+FAkmg24KUTsPrnfbiwdSUU?=
 =?us-ascii?Q?56xwox9rFKuB85Rdy4rFWfF6he5He9ljx+NdCvsu/QxpNk8cfpIvE5vTpCj8?=
 =?us-ascii?Q?6XozYEtclZ7saU4ehx+IcQGM7jXM+OXYylBFQsHEl8HF3UzLG2UNzAJ5txjk?=
 =?us-ascii?Q?nCzM511Q0p1t9DHpxg4Ce0vE2DmMmFyGgbiR9dal5nI+Yuy9dpfxIkPl/Eno?=
 =?us-ascii?Q?7y/CGwco3OfI9OywYzgxXziSzv2W3a+IGb/cQvfPkG86DwdKtzpXeTMDx2/j?=
 =?us-ascii?Q?le2xrrYNuEBP7Ty5C0LghMJuFNqwyjWpVpNQjsB5kJladOUyo7m//wpg9V0n?=
 =?us-ascii?Q?xK9rM3n3B8GWyW+XW828RL9uoJHVgqvCNmByMywYq0WJKqeTXp6tdDD2LRH5?=
 =?us-ascii?Q?vsJZwQsXg6bIDkMvS0Fl6M+Adtkr7lOkNJy9x7/IZVQa//N5VioEWaoMyRnY?=
 =?us-ascii?Q?pejRPcAtNVBNRlJNqkdR6N/ev88owDaELqLfU67njSyGBp5z2B9ahZFw7Ouu?=
 =?us-ascii?Q?P6B/+qoB16Oo0Uh2/nwiPAksedcoTgd1Yxo2OTWA1g77dKV7SQZG3djGNwKj?=
 =?us-ascii?Q?ECXP8gUIQYvnDFhzuDiCcrM+xey6EFEFlYmGJUKqoJeT3WqxBE0BWFJNv7j+?=
 =?us-ascii?Q?PrmvJAeS7jtabf2AZVU6jxbQqMRazucdTw7MoL+55Gh56lHEiNLB9Q/cpGwA?=
 =?us-ascii?Q?bMYN4jnlRQt5mYNTsDeJXCm9tFtSqSSnL6SG2W43laJE/iICBdl+4mISeP0B?=
 =?us-ascii?Q?rAhB9WBtdKwkWBNh30u9Bp+vkbhb/ZPFontOTmuifLXrC4j58+EsUH1sABw/?=
 =?us-ascii?Q?8s8a5qNPt0gau6UgIJg/ZHbvC89h3Ox9f+j0DNRMBuTyEjU14sPKnOB63A6X?=
 =?us-ascii?Q?3A9A9YzVA+WmM05kWL+W/ktCdmMy46W4lSWB2cvMHmMfxrhLpTp6wUs52TY6?=
 =?us-ascii?Q?qMQG/RNAQxpQOrwa0mWq6dCNLF3ny8w=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b483e5-144f-446e-36ed-08de4c3daa6a
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 09:34:47.1164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxXKMexnUx41MIqYkmC0D76lScuw1BpgcmeNuuC+SDItdgNANqoLRNDYK+aoBJWg/G5iHVRur2Zao/n/iP1XD593EOvgsN4yMGdS1Xc3cItnjnW3sjOjKqu6rYbaSQu5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZP287MB4122

From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

Add bindings for Omnivision OS05B10 sensor.

Add MAINTAINERS entry for Omnivision OS05B10 binding documentation

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/media/i2c/ovti,os05b10.yaml      | 103 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
new file mode 100644
index 000000000000..b76771d81851
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS05B10 Image Sensor
+
+maintainers:
+  - Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+
+description:
+  The OmniVision OS05B10 is a 5MP (2592x1944) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10/RAW12 format and uses a
+  1/2.78" optical format.
+
+properties:
+  compatible:
+    const: ovti,os05b10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.8v)
+
+  dvdd-supply:
+    description: Digital Domain Power Supply (1.2v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@36 {
+            compatible = "ovti,os05b10";
+            reg = <0x36>;
+            clocks = <&os05b10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os05b10_avdd_2v8>;
+            dvdd-supply = <&os05b10_dvdd_1v2>;
+            dovdd-supply = <&os05b10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <600000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 663e86eb9ff1..c85915d5d20e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19234,6 +19234,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c

+OMNIVISION OS05B10 SENSOR DRIVER
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
+
 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
--
2.34.1


