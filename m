Return-Path: <linux-media+bounces-29884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7629AA83C57
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56C884A784A
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB3C20AF8D;
	Thu, 10 Apr 2025 08:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vFDUIO2q"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2903E20D4E7;
	Thu, 10 Apr 2025 08:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272864; cv=fail; b=T8/ro0Mgtbx1ERRb03DZuQDYtN3PX1j3JqoAzU3Y9jkClCLTZJCC8MmN/rcHAr4OeMXT1AjAAiaN5v58vpCJHhodRAgXS8m6IIHY0ufA9mjbyxAnyOCiDqk4KwaHwzDPF8qB6QPiuBRX8cRFuje4HpfxoT1TefdimoGF1f9ufBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272864; c=relaxed/simple;
	bh=+itG+lsmYTQWPhloQpRkN/MtqYNEE1GiS4/fCACV2Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qY5/YbXOKCuDLarjMijdxNA9R1nMcH3V1dAwrvXzIF40WHQsxSohJb97QxZkZ9uLaXuFIW+zPnZtOfREAzHu5CPtzgEw0+nLfKOB91hOK/sQggakSEIBeCh5TThvVK2o7BYAjjYJ4vDwxdIlaFqWKrkgpJzABq8X5/EBRivldMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vFDUIO2q; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiBFyNzMlsGtAv5yrWTK1Zg6Czhvx2TJ7bXD7CucVyDEd9NHSGYWqgenrrJ/7aT28p1Gse4T5KDub18sH6f7LVIWySoeoFWETP59sD9rNGahOv5xwKGWQzdHbi7SZLPKVB7VKpqumeGzkqZ0M91VaYR5tJp6WA0Va0QqFJS7VFhO8Z64bgxqrRPgVP+Hl/6ynBeceQYATO0Rqwoqddf6ew4XVvbmBh04sOJMCQb5txx20gjuACMS4uns031C8986YgoZnrVIKRtN85/ctnoLqPCTjzfMeJEL6MQNHsCVp0/udTbf5brrexveSqGOgHegB8xeY0kOwcXp9tQLlWWpWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9n1Jn/LuzaoqA08KS5D9g3uz8mHrNSl6RXD3nCLm00=;
 b=CwUFkxm9RFU/m64U9ftcN2uuYWJlm7gI68iUBgSo+p7y7wOLTGU5lm0I5Oz/3oHf3YlmWh6HlkgxJ2sw+fYKbuNH92XyXFd8eJbob6LkdHjVx/uJTzB1cnxF75I2dSsjaF6mAxTMe5znxNPazf2hMTTWjiRtaFsrkxE27/2U/kOF9qbzo+RP4SP9SWaYRi6ok9BO/bKSq4tFLqajzU6RTFYcRRLbg72vsbZkn+tae/MyVlhcPNiZrDECokb7iVoKFBfTGiAVo6hPlHqplJyVL/hRHXXbwQ2H0bz4yrAMuDwNskPZtzKQnDJ6ckowpZnoZm+y25aN+UwclHxWkLbEyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9n1Jn/LuzaoqA08KS5D9g3uz8mHrNSl6RXD3nCLm00=;
 b=vFDUIO2q376OsINRIowkeufZql4yFp/ogdbJ5AceFrBcdrO2NDQJv0Dxx3iKXZKOoDAHmEdHtjP2N4Ug1sAeMLd8w7c1K2lv6igvBbu8LWaeAdURTI2WIWV3t0slSP/tQNtvupwnCbCzT4BBpabZeyO5XajsKyK6stVThNHS+QU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB5660.jpnprd01.prod.outlook.com (2603:1096:404:8059::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 08:14:13 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:14:13 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 06/17] media: rzg2l-cru: rzg2l-core: Use local variable for struct device in rzg2l_cru_probe()
Date: Thu, 10 Apr 2025 10:12:10 +0200
Message-ID: <20250410081300.3133959-7-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYAPR01MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: cd800b48-4738-42e5-2c6f-08dd7807adbb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FuS+GGdkhSeVrwUGaaQY4SttvivAkeOCFwFlH0+SX49MBC5lLrAzQDrv3qqz?=
 =?us-ascii?Q?LpgVvXZSMnn7M3Q5W9vciJPH3Ked+cLT77qt//ECmrZ+yh4gzkuMmV6m9e0M?=
 =?us-ascii?Q?uQ0TypBhQNq7Hkat5rSmFag5lBA5kfW9GI+0J6o6JgtQsEE9fYb5snlSJwwc?=
 =?us-ascii?Q?7f9/AsuRuLpOnGPdO7WSfBB3Lv5Dp7brfwd+F7Rgg2pkSShy7NQ6OsFxHpy3?=
 =?us-ascii?Q?aW2b6hoep+Tf9F12DPfXbtiu5A6CToVWiOA1fGvGxe/LpuqhMBJBktDlfecS?=
 =?us-ascii?Q?Tz77qQdhAumNA8aKxGys2lAQJbyJdNZYirNNIXSq4X57Xf0EMgNwPywvp/J3?=
 =?us-ascii?Q?VVS0nyJVi55NXPfYYXDpb6MbEv7ERUVAk+yPHtZGmNs6Z1amWm06CFNM+nNe?=
 =?us-ascii?Q?5l1IlydrYiiSv3xkgiHajmrafKPvkZ9BZkGwiKk2AutAONkW9eQ98wUpfY2z?=
 =?us-ascii?Q?Y/kJ+mCR3HID6h7eVrIWuQB5eLnV8ak1O+Pyv4JhlSB6Tsqwn0+sHyvaTN3b?=
 =?us-ascii?Q?j70wN3YJWHK1FdAhbKvgWVdguNvDwQ6QJT8rrQYQwGDxm++K81uy+EeSRs6k?=
 =?us-ascii?Q?tP90yxXwn0F9BXAAXKEBiWxBMUIw0Z7oeXoNcsRJ2OPJuRRkfMRm2NiyIz1R?=
 =?us-ascii?Q?Wk4NBCNMDB7pIDGjNDKtEE+42CRKWRozYJSPyrlSeP9DwQtHuk9T+E81FBYE?=
 =?us-ascii?Q?a544iQCrUh0Qg3fYpbuKzvSxYibBbRPcIkt0KEDbYZ0Wr1BrT7FtKomtDFU3?=
 =?us-ascii?Q?GCL50JJqtWx1tR7eEugTDGqHiPk0PylYJVXfLedij67NDKPov4rIrwEmeJt/?=
 =?us-ascii?Q?YPZQz/3YttLUWZNDdx3ze0bYaxlLVJtzoOdnVUNMgZguFdHfnIbuZoFCW1p1?=
 =?us-ascii?Q?eof/pzlWRTCWU321FfA9x2UJQPNfyfqKnV75FDVm8Sj1Rm4D1RXshxhRoZpC?=
 =?us-ascii?Q?pKiaK+PIa50jCTMPj47dIWJm3vkNLkcKrVRgHdm+LoOsIg9pq6G+VEByqaDt?=
 =?us-ascii?Q?f1tfkTIXNBUh1CWX4Wlwdlxcb/2HB7WDZaZLCouTaZCsO5CtJC51+dKYREuq?=
 =?us-ascii?Q?ZunK8TbOk7lJBi6kdxCS+6a0MEz6CyMwJ8+Sa0JVj/0E3vtY3Ta5IDar2mh1?=
 =?us-ascii?Q?mmDnUvtdckOFOtj+R2tI2o+k8SXQRqIUSQCyLEjLGJRGRgYKsWaCijZH4Mlw?=
 =?us-ascii?Q?4/41SuUqM5Pvd7CbFg4WCdUbkDa1iu3dl1o2zFajDzbp9SNOLj06fC7HE+f9?=
 =?us-ascii?Q?/id1sy9Hm673hm6p/SsnxcalDofHXFXCShlaB5aruLUnOM0FiuKMkudHqo/X?=
 =?us-ascii?Q?rS9W9NvaNRDVWtg1nOQ3CLFDIauDbOAIgm+ulWxOTWCAmBK/TFv9bS1Dwqh6?=
 =?us-ascii?Q?EnNaqplbXBtuGjZFO9QEFZxGDz8QN+N2B1Ou2OTyUu1Da2xvJ6HzwWSlq3Pg?=
 =?us-ascii?Q?DkVPAk+2pvElpeYqjth3OvQeMKRsSsvH2Y+qnnLk5VeBxPnR9VOi7w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gcb2Ne8lqK5P7/6/t24qTCe3MAspypcBY/WEfPHcZZCR9mYTl7XW0l/Qvr0e?=
 =?us-ascii?Q?cTF83YBF7jnSxwZQ9M//4iPyAt38bGwbRaW0yZ2wjOB5QeIgir6JWq+jsJ1H?=
 =?us-ascii?Q?nSyj2WFvB00+B1FP0cJVJbZVk7tmeuSri5eAm12nRHoZqmmrUWQ3ttavv1JV?=
 =?us-ascii?Q?z5IGZXkUqMmYaWtmQQe04xZJ7G1fkKCwGm838/2o5lonaUoEgzcolhQw8SVz?=
 =?us-ascii?Q?bnY8WRS085mccsKQU6yTyH7hpG3esEQNA4+afp4bFCTHwSMWlX6dHynbis/e?=
 =?us-ascii?Q?SzkOVGijzOspIAlRnyX4q8UOP554lItyTMPX/IUsbC/TqVlnwyjyGKEjzEpg?=
 =?us-ascii?Q?QvN2t/mhayHjWiL3wRk8W1QHoiIDhuUYJVVg5enZ+iYCm56zyGQx9ltpKvUK?=
 =?us-ascii?Q?6DtMgxMbHlYJlDWJ3vUv6pkW8MgnT84hdLBMmmjbtsYVoBamw3Pqrpwp4sQt?=
 =?us-ascii?Q?0SdSn9GjQU1VCKXh7aHK4LkaXiHwoW0XuRFSd6X4iVZqD7DysQkNXcey04ip?=
 =?us-ascii?Q?/fkNiMzKShvUhDXVm/es0VsnxZcUYkac+8Ro4oNJSSIbXvFPzBDGfY341Je+?=
 =?us-ascii?Q?N6aeOp8fduUqskZbUjMd1JFAhD1T3hALon68qxzVV2TdIIBQYkc+9sLScWnN?=
 =?us-ascii?Q?CDZ6cO2roQlIUi9Cshv++Hp2ieWoxWOU/YkG+EDnTAj0aUHqgadHJW1dxcjT?=
 =?us-ascii?Q?3zP2nB/yWPoVZZQNeuMfUQTkJK3pp69GWLj8c9yM+TH6QhdlOWMC3cHhvJbu?=
 =?us-ascii?Q?bQ8mkXBIlxy1/0K3kFBy4+yMiyP2tOZ+Xf4Ho8ZJhqKxuNxd+rQi1whnANvJ?=
 =?us-ascii?Q?MmmYvvyGnpINH4Br/g4gWP8Td1dFYN3V81n0rIUAYXX7x2TcKKJExBd3MlES?=
 =?us-ascii?Q?2sNWYxdGf1Wz6w9ZyvSKjYZvqOmuL5M7exzRjmA5ivF3UpJHXb9RfxfIE0xq?=
 =?us-ascii?Q?jumyydqZirAV/gQs5Qkut/yCM45clTj2CfqNf0gXBSCIQ1flg1bdLv7ol09a?=
 =?us-ascii?Q?px4eQaBnOnGDEaYAGMXJrGWC4Tpe210js+qQtwc/trPyFpvyhRRrkoC12YSN?=
 =?us-ascii?Q?xz9Y4vSO1NRPckW0kiQpi9zW9pllxptvutUloJTrmXKQ5XlWRyoZp2LzKwNJ?=
 =?us-ascii?Q?97+FW0WiNYUQ5SxppUU8lt1gjblyT22UXjKrQI59yrUhBrEVwiJhJQrJ0nWq?=
 =?us-ascii?Q?b9yWQBt2/R9fqECJuiFu4+j0O8zTORL3fwyhnxC3mB9S0rA/Qzy2XmMCUGj2?=
 =?us-ascii?Q?KOc9XMgikgiej/fDNZqJAIMJ22e9INRGtvWt8N2LvvCOsd33PL61EA5uUcCY?=
 =?us-ascii?Q?VD7T7k9YOPsTR5LYUe1DmeoBkVDIxgEeUbeAo960rNxvrbqG4kTLsKgqWZ/e?=
 =?us-ascii?Q?ERS4L+wk44wp3AeMHB2+u6jl0NpEiC2uf2WjWWYRsNYlGJnR4ibM2/8WiURT?=
 =?us-ascii?Q?OMbL7eAQdJeXLnj0/Ap9z4ccdtb1UO3SHlsISbFqITgumCkz1c/RoQHX/GDQ?=
 =?us-ascii?Q?6/eVQXStx7lzRyQUhZEmQGgILEuOMNmEKVqUrcTR7b2QAI0LAu0rTcyhxNOx?=
 =?us-ascii?Q?5sbVm0j/jAtXe91V5o3G5ardIxwpeXA1YKc3HX9lvdn9QT9XEFAoMeVhes1x?=
 =?us-ascii?Q?OQNjocvxyzgYyTW6MDT4LjQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd800b48-4738-42e5-2c6f-08dd7807adbb
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:14:13.4594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fgj8q4jwredkU62vYqS5GhkAqQwMSgj9+5kQ5nMJCBc+rWYbgAe/80jBYMIeya3KllyOdQ7Uo3VGR7Ga+yRi67QWdWkc5M1Ep0dZBPuqPHkFzqChArQMg+njVVePc6J/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5660

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local variable for the struct device pointers. This increases code
readability with shortened lines.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed commit msg and commit body as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 89be584a49885..70fed0ce45ea0 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -240,10 +240,11 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 
 static int rzg2l_cru_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rzg2l_cru_dev *cru;
 	int irq, ret;
 
-	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
+	cru = devm_kzalloc(dev, sizeof(*cru), GFP_KERNEL);
 	if (!cru)
 		return -ENOMEM;
 
@@ -251,32 +252,32 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	if (IS_ERR(cru->base))
 		return PTR_ERR(cru->base);
 
-	cru->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
+	cru->presetn = devm_reset_control_get_shared(dev, "presetn");
 	if (IS_ERR(cru->presetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->presetn),
+		return dev_err_probe(dev, PTR_ERR(cru->presetn),
 				     "Failed to get cpg presetn\n");
 
-	cru->aresetn = devm_reset_control_get_exclusive(&pdev->dev, "aresetn");
+	cru->aresetn = devm_reset_control_get_exclusive(dev, "aresetn");
 	if (IS_ERR(cru->aresetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->aresetn),
+		return dev_err_probe(dev, PTR_ERR(cru->aresetn),
 				     "Failed to get cpg aresetn\n");
 
-	cru->vclk = devm_clk_get(&pdev->dev, "video");
+	cru->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(cru->vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->vclk),
+		return dev_err_probe(dev, PTR_ERR(cru->vclk),
 				     "Failed to get video clock\n");
 
-	cru->dev = &pdev->dev;
-	cru->info = of_device_get_match_data(&pdev->dev);
+	cru->dev = dev;
+	cru->info = of_device_get_match_data(dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, 0,
+	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
 			       KBUILD_MODNAME, cru);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
+		return dev_err_probe(dev, ret, "failed to request irq\n");
 
 	platform_set_drvdata(pdev, cru);
 
@@ -285,8 +286,8 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 		return ret;
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
-	pm_suspend_ignore_children(&pdev->dev, true);
-	pm_runtime_enable(&pdev->dev);
+	pm_suspend_ignore_children(dev, true);
+	pm_runtime_enable(dev);
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -296,7 +297,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.43.0


