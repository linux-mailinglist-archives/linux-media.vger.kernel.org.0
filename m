Return-Path: <linux-media+bounces-65159-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f9taHKC9M2qzFgYAu9opvQ
	(envelope-from <linux-media+bounces-65159-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:42:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A2E69EF61
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:42:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=fIa3d+CK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65159-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65159-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B38CF304817D
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 09:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E3A3E0C68;
	Thu, 18 Jun 2026 09:39:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCD43E0C46;
	Thu, 18 Jun 2026 09:39:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781775555; cv=fail; b=N06PXXMn6j633WkDjw0e056CpKVI8ojR/6gUH66MUQGzwuhohj2elRAGouHPFYcZX4wlGaaUKWgy4H5MkXe2N6e2VIEVve2+5IFjAPccQVcygNa1N0pTKM7QvKvBxgzzZrPx72nUuJ57T7XuPz9o6L2zzJffG8dzXdJ53YG7Vbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781775555; c=relaxed/simple;
	bh=ClZyJnblBpIsK0WzKjTpZfBVbnpKQs7SDZ56rwAsrKE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aeC71Q03wSz5QiZVIGxjuvGw17PrNYIwGr7y/PtdscVeswOnxMGZMUBzsfGAY4XNvlpgYzsmpEDzmrmUGjz2d45VarCYiviOEvVICf4sO+1yFop7eNiycFmSOERrG5Gbj6uBB4emsOjdnK/42fH7wp+HS2Vffc3/VkjTPcbnxtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fIa3d+CK; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1KxhgI6hj290SqC+1DcdwrggQKBu2EFXHUOEwszXpuB//N5ckvAEYMiENiCNqddGqA8I1ONJ7ZS7mwjOP5nd+BkjQMO/L0JdA0wggNXFQOJ+fdQLx9yT6ymPfXrXJTzcQ7qIEpMtRv1KgedxzWP8pQ2uA9ZTyiqIyDKNiS2W4/XjXfdCjNom3a1Ysjv2EsuHU+zRS/GQMJXzjyiZ325lHLIrVv1Gx7GVA8isE69hH1k72tTYB8YNvX09ONo5qbOcclq0Hjqt9elRUsuQn8Da9ZPklyVYc7s9pN141jOtsP+yd/qWAiX4DCvkLTDLK5R7Bbx9ByceJWen5qbHPrp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jbch1a4RgwuZXfI0tzAI4d0LMqkT9DQBwZ91+d947WA=;
 b=Ir2ezrA7Bd3ANDfLC8Fg78D2z47OLvDxvB1gBCV0CUD8SDh2ytn3GhacarAMHjVYXXlzo0byh1eWCUIur3w1Nb7Opa0FpZtrs+Q9BSkvGTxv2YpYWmtJkxnmnCt+YpT92Fk9t/ZuOxQbHtBhQ6QDj0TGuvX+MUaCpiAjhZbZVp/6zDNsLt7/VRGN8aEJkr/ny5dCZgwX7aqoxiD5gvu1IJYDwyZg5NprSS13t9rtpH8HrVM7+xZb08O9CiSU2/N1ZuMCCL+IayjMK3/lQr3KeyyfrxyJAFI7UFUitEI88NW9NW80yFnSwj1FdhFZmCNOctqleV2Jjc8tidQq9I4z6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jbch1a4RgwuZXfI0tzAI4d0LMqkT9DQBwZ91+d947WA=;
 b=fIa3d+CKdZK+cK2Xk+bemxfDBlR68DrgmeLC9CyqcNNXR/63nTFJGM9XypbV0v7ITYlPvTKjLhdDXK36si5uQI1Qm5mqRZpyk4ya6ISWPSNH7J7PSzJnxSPg9wD381shx6Cblfp5/zLNnV+5+LIEEGrNCR/S5O/L26DaMbSZ9SlSNYf6DmMocjZ2fTtxpS1C3o+1A5E+sHHimrurl2Yia6YCvkE/hMq6kmG6NCDrCuYdFpbwIIZ6iJXl7bc59Nx3I9Cei4N5x58r2acjlIUj6jySZpz8lh1UJHTxrT5O5DYe2PbOmQkJgD+A7hlvphXKaM+Pp3IBu2TqwXZTEHAfbA==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PAWPR04MB9813.eurprd04.prod.outlook.com (2603:10a6:102:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 09:39:03 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 09:39:03 +0000
From: guoniu.zhou@oss.nxp.com
Date: Thu, 18 Jun 2026 17:41:37 +0800
Subject: [PATCH v10 3/4] dt-bindings: clock: imx95-blk-ctl: Define
 formatter child node schema
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-csi_formatter-v10-3-f23830312ba5@oss.nxp.com>
References: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
In-Reply-To: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781775717; l=2949;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=2BG7cz25yffoQg26lQnddfmE81KQCQWZCjvhtWLeh9Y=;
 b=Gz7F0zvr/5p9EnyYwX4zNl9AmTjhuuxvgUTyynoatBv2r5Fsg67+arcT7HmS9XucViGEd3hKc
 8IckP1H1kW8A+GDfzTUrKo48p1zingayNS9KPQTyuWuAOsH9CQscGDl
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::9) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PAWPR04MB9813:EE_
X-MS-Office365-Filtering-Correlation-Id: 29577961-9857-4858-1131-08decd1d6efb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|19092799006|366016|56012099006|11063799006|22082099003|18002099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
 ehmfRIQYK2GmQ0IvmfuZ2jAbfIWdRTRHZTDadMN+0ipI14GOotYGo1gwuQ74XGmRNIy9yF5Wdy/nyRCC0vMCsiYev99HqjZzaeUAGuznyE8Rm3ZNMYbhU7+hpJckpUCT10EOke9sgHamXyaMTnQMp1Ur1QCkEgtUgRLpBi2Inb+nUZYGkyfRCWrcx01R3qVAzw52r2X4Arq7sLzTM2D/GrD9j5CKfbk0Jpgp9DWdd1kQoA5tqw3KfFwl/tbBuwYApW2mA2EetNrdqPm+M1LcaouaKEY+eT/I6FsTwZ0EiksvjFUzwR7sKZ0E2eL5LvcmBO674LW1SvPiyFyT26zkS+GzleJSbcWGDMCW6Pkt5VoRqUCnrn9BSgrRWiLPC5MqiuUoAD1OznGqvUKKr9OML45Eik/1LdxlijE9tjcXrJjsTULpuyIB6A+iNFwMdDTHPEhE1D+HLJ8kjTmPKCs0sRb+q66LkYkF+eQ/8khBKgUCmWIu9x8slTDuaxA3eZUS6rf8Z4cyEfWpbfEgeUm6fYCHgviMp5vi0LkIu7auLF+n/kUna51TRkNhezqyJGTyZ99P9ZPrwmy8qk/1zcWJpDkOx6L7SI/ovf9/1yvKX8M7I6UsC/qCOVTauWNHnQZA8oapG/P8tEHweDvfj1uzj7JgIdj95Z8XLIQl/e3yUjvv/6KZfhczIxrkzoQ/LTKWc8E5hVcH2KyPK3gA8jNXrV3vmOGvIST1wlQ2wofz8w8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(19092799006)(366016)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?S1ZEaWpsV2FHdVc3UmZwWGJCaW9QYXFSOHk2S25PTmphUkRSREk3dm1JNEFr?=
 =?utf-8?B?RHBlYThyQjNUbTlVS2czTERSUzhJMmp5UXNxSFlQb09lTkQ2MkNDNjNiOWNr?=
 =?utf-8?B?S2JqZ2tmcEdnc3hyd0hCekNhODZrNnFwMytFYy9uaUNHcXdQWFlQUzloenhG?=
 =?utf-8?B?aUtUdnRkbE9tVjhvUzhMUVJUL2dGTGxoZTJFdnVhblFjTVM4RkZZYXVFMlBC?=
 =?utf-8?B?U3UrRHlpbU9kU29hbnlGVSt6NUxqVGxQbUpudFYvMmdYSUVSQk4vclhnaTdL?=
 =?utf-8?B?aEFjZzhjdDJTazNoWHcwRkVXZDdMbWhBTU5oZjgzZ1NMaGtBNjA5NXQwV2Zw?=
 =?utf-8?B?ZWdqUUFJcG9yV1g0Y241ZjNFaml1MzRvcFJna2hSdVdrRVFHc0dnZnN6MkNp?=
 =?utf-8?B?N2JRbHNpaFNLQWpWc2V5TDMrSzRlTGZ4bTJTRk9BR2hyNEQzNGFyRElJQzQ3?=
 =?utf-8?B?ZEc5d20rQkJzNXZsRmNoMk9KQ3FrQ1lEVlJUWkNybXpZOGVhQmpiZWc5Sjl4?=
 =?utf-8?B?TmdFS0NITHpwYnRJQ2tYemlyQkFOeVlsY1lMK0RVRndQZEtIWDFlL09Xem82?=
 =?utf-8?B?VXdpcld3eHNDTUMra0RKWmNiMmZWdFlON1g0eEUwcVdEWEFuSWJTblloaTZB?=
 =?utf-8?B?NjVzYTNyYVlWT3lHT3B4VFRTRGRGQS8vTE5PZmdjNXlNa0E4eUNIM0pUNDZR?=
 =?utf-8?B?ZkxVWEZQam5kQzFHK2U3b1ZtdklYbEJJY21vaXhPY0x5d25SZU81VTlDWXVD?=
 =?utf-8?B?NUlnTldnTm5FYjNwaUhvL3A4MW53ajBQaVhlNFVjRkpYWkZtUkRyaERxWTBl?=
 =?utf-8?B?MTk1Uk5KblNEU0V4cE5kYXprVGtVT0djb292bjFlYzA3cWo1UWFKTzRSWGVO?=
 =?utf-8?B?enc0dWlycWJuSTJzanBuZHRZSHZrelZNSDd1cTIrSlRzQVZDVTFEalpxb3hG?=
 =?utf-8?B?VjFDem93S3AvTVRsdUk3Ry9HRXgxNTFsakE2ZW5KcVR5YXdtaFpIR0tVcjZq?=
 =?utf-8?B?dlVlS2RmWEtGU0RzVTE3dU1Makt2N2V4R0lReTExaU94ZkRzdUhxMTNlaUZp?=
 =?utf-8?B?M1h4ajVjUE84YmRyWTN1TjBhVEhmVk42dk5ZWXhNcEZibUtQZm5JaExKclEz?=
 =?utf-8?B?MEtPY3RIK20xMTZsOUY4REdXNG5EQ0dMVDNlaG1tMEx2V0lNR3pWeEhrek9O?=
 =?utf-8?B?UlBMc3NIOEs5eVgzTFE2dXU2SlVHdEl5b2EwdkRSVFA0aExOanh6TDdZNVIz?=
 =?utf-8?B?QnZ1dG90dExXZmsySDBlNU5kbllxMUNzTVBoMG0rYllMUm5ia01IUHBzTTd0?=
 =?utf-8?B?RXpsdHp5d0FIOXdQQWNEWFVkZnBuQ3lrZURUcjVrOVZPTE5VcUFFVWc3Vmxo?=
 =?utf-8?B?Vkg3dWNEKzBqNlF3eU1xcWlPTk04WlV0aGtWNFpyTklmRnNkaEtMa2Z1UmtF?=
 =?utf-8?B?aVU0Q0xOWFNRYUFCeEJCTWpmRTZiSmZJcnc3WG91dWdaQnB3QkZPeFh1Q1hL?=
 =?utf-8?B?MUJDM2pJS1ROdm9Xa0VRT3hXcjhqUTgwK2xjc0crVVdxa2RURG5ZZ0ZSVGp1?=
 =?utf-8?B?anJQK0JEbWVjQUpEc3NSTlRaUWtGd29NTGt1N3RiTjlxWGlOOXhiV0o2dnRl?=
 =?utf-8?B?SnJlSkZEVjNibW1CU20xdzRld0RNYWJBUSthRlNTNEJBMjN5TUVPYWhJejRm?=
 =?utf-8?B?Z0hLTEVuaTJjNytvMXZRL01TeklDaGtvVm9sOFdGcjhjK2M5d1N2a1NJK1Jn?=
 =?utf-8?B?S1FoRjk4eFdUQUZzUjBncXJZSjBWWUNGbDVlTEx2UFpYZkZvS3NlUkdWRmZV?=
 =?utf-8?B?VnZEQzQ0WDA5UEhlTEp0eWc5MFRWUWZiTlp2Qk1obXNHUVI3OTdrelVBNFpS?=
 =?utf-8?B?ZVlQR091L1AxVE1adFVUdmorMklXcFplWmw2ZDUwdXdYS3hpVVNWNVdPWGg4?=
 =?utf-8?B?VzhZNnFYR2xvbDNZSWdlOUdrWWdmSStZdHAvMVl6Ym81SzcrazYvNmp4OTBB?=
 =?utf-8?B?a0xaTTdzTHUxS2tpOC9CRlh2c1lhWWVJVFFJbzZmNzdkYVpFOWs1cFBIZHdJ?=
 =?utf-8?B?UFcvR2ZZbDRyczNNTGwrRjR3b09iWkxZS0tVK01qaDViYnJJQWZwZlJXZWZS?=
 =?utf-8?B?U0JiWUlsMTFXUUdkSUpFQ0R4amMvTDd2SXJYVlQ1c3EyV0phRllaVjdEUExQ?=
 =?utf-8?B?T1RCdWVuNngzVEo2Njc2eDE5RXNaUFVlMVloUnpJMlQwVGdRUlVIcEgreE1B?=
 =?utf-8?B?L0gzaEFiemdqOEMwQS8rVnJHU2pVaFZrMTcvWkoyd2cyRzhFNE01UVhnVE1S?=
 =?utf-8?B?WmFNdTIwTFA4UzVkKzkwNnNqZ25uTkxldnZmbVEyN21SSHk3Znl1aENDck1z?=
 =?utf-8?Q?HE0IWZlK30QgR1XNKTe6FKPPI2wjufyCvhh7s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29577961-9857-4858-1131-08decd1d6efb
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 09:39:03.4919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GnTibWKy197PNeu1djgTsq84UbpaOX3KwHoTMQXdRqrT0/kN73hrZyi4ndqe7gSko8HYGd6Gjv26YA4Xq19eIB9GHctGGCaUqXyGV4mOJ6RVKBNElmc4NX5kEgflqzN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9813
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65159-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:laurent.pinchart@ideasonboard.com,m:frank.li@nxp.com,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:guoniu.zhou@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,oss.nxp.com:from_mime,nxp.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7A2E69EF61

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The Camera CSR contains control registers for multiple CSI formatter IPs
at different register offsets. Each formatter is an independent hardware
block with its own clock input and media pipeline connection.

Define schema to allow formatter child nodes under nxp,imx95-camera-csr,
with 'reg' property specifying the formatter's register offset within the
CSR address space.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v10:
- Use single quotes for regex pattern to be consistent (Krzysztof Kozlowski)
- Add formatter subnode binding and camera-csr syscon example
- Update commit title and message

Changes in v9:
- New patch to address the issue of formatter acting as a child node of syscon
---
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 64 +++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index 534fa219d9f9..b4d0a7670fac 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -46,7 +46,27 @@ required:
   - power-domains
   - clocks
 
-additionalProperties: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,imx95-camera-csr
+    then:
+      properties:
+        '#address-cells':
+          const: 1
+        '#size-cells':
+          const: 1
+      required:
+        - '#address-cells'
+        - '#size-cells'
+      patternProperties:
+        '^formatter@[0-9a-f]+$':
+          type: object
+          $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -57,4 +77,46 @@ examples:
       clocks = <&scmi_clk 114>;
       power-domains = <&scmi_devpd 21>;
     };
+
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    syscon@4ac10000 {
+      compatible = "nxp,imx95-camera-csr", "syscon";
+      reg = <0x4ac10000 0x10000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #clock-cells = <1>;
+      clocks = <&scmi_clk 62>;
+      power-domains = <&scmi_devpd 3>;
+
+      formatter@20 {
+        compatible = "fsl,imx95-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            endpoint {
+              remote-endpoint = <&mipi_csi_0_out>;
+            };
+
+          };
+
+          port@1 {
+            reg = <1>;
+
+            endpoint {
+              remote-endpoint = <&isi_in_2>;
+            };
+          };
+        };
+      };
+    };
 ...

-- 
2.34.1


