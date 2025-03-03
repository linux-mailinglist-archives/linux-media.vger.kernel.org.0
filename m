Return-Path: <linux-media+bounces-27382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5DCA4C667
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D8503A6543
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E77233120;
	Mon,  3 Mar 2025 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZpHNcaNC"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454F5230BD0;
	Mon,  3 Mar 2025 16:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018162; cv=fail; b=OfYUMAaYP0B2eOLdNX2m1uy+CwttB3C+uYXLBAVPZitjpapQi9NUnWVFNGHX9ZmrOZnzBdVlnPrstl6U++Ia6qk9E/2nzCsXCEYWTP6QPGkMBVjkhytnp/Ou4ptpEDyLP3Ii5O4GccVLZlL+71pEnLgzTda3oQX9x89xGspzvYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018162; c=relaxed/simple;
	bh=TaCvgP5xQ8sp2vFACfu/gZiyIRAm3Fw5HwkIDXpsGOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CUapL8/WMv+ORqX++KhsIG9+1t3UXrSfOgKXYNUj1nTaB3DA42som78ontvoCNqMJtiiV5uLXshIi0rL+6vGlztLB0u5BD531w4DCvT6cNrmE8/cgqj7GAewFTI+BO+P7L4HYS6NW8cnQHCrX9svBb/06cD6K8zpu5oIaSjk8uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZpHNcaNC; arc=fail smtp.client-ip=52.101.229.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/fM/BMkdxnk286RIH9q7TroqhoPWjNR/VC906BzulFNofdvKAUeXDqGplnQpUDDT5FTVyaD1L4o47DCVYGTnMsG7bScII73sGhkyKEOazDiZBhw2BGJpzwFltJLGjOYW55bTAI2ZMFeFZu/kY9cekelnBLJCuI5aJScdLk/dSaxfuALG8dVmZshxtwun8GjHZHTvez/fNHN1m6npSsQk9u7J6ixk4CIXKYezksN7F76xPOkGoedIX3qiwytVtzCvz67DWDamxmSmFMuCOED/o29l/y+JrScYJFI2kgY7t05VNC0+oO39aM2yjb6q+Y9HZ9/I8FlS8+7q56p4PO0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/68r7nlrAN2KRykrPOV+mQNExeJc7+w7krTb2qcMkg=;
 b=xabr1hgsBp8kyCu5QMd+vOyRYJxTrBsY1fJLEL1bM++5aq4pz1hRKl+nsJXwS729If2F1X2wDyz5R3rDFlegRy9A2yKRJIMfebQeKWdUYKKFHxoiv/K6D5d4SNIgC3sZbQsSeCE3xRjzIyaNER1ytsKhxtGfZA//cJCYoDDINMa1CXxyd+RXMnzftc0kvJT45usMQrzz79cDUeCLTERCte9ujYo4SpcSMFt4CMNT0tPUyVVMHgtqAGacfg6RjfUOfsXwXg3hJiUBwfYr3j9LYpxLlpjk+zEe+You23DvXZpmXOXbSLanvgXsx/rk8JqK8jZjdFz0Zo3/rEhPnD+0pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/68r7nlrAN2KRykrPOV+mQNExeJc7+w7krTb2qcMkg=;
 b=ZpHNcaNCJcM135RExM39uhL8en8/Dr+onOMm4Vc0+Q9Xc5H6v+/m+Kju80BvtYhVrsaVvVyTLYwVMw3S0IOgTZHAi7iUDsSayh8adkHcu956bZ5xi89ZucKTFIRZRAkwHlfyTPh902NeG7H2Ymx6N0+UD/LU0bmprmMQFMintD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:09:18 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:09:18 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/17] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
Date: Mon,  3 Mar 2025 17:07:41 +0100
Message-ID: <20250303160834.3493507-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 78502ec9-d2ab-4dd5-2a79-08dd5a6dc03e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N/hE/8oBmAIEl2CWfTLJxEAZ+2Vzd7gqqqoUZeGbRJxIdXLMY9aMFJGxsT0B?=
 =?us-ascii?Q?LuGhCg68S3KBLFDv6bFwq3DG1AEEilS38P0WgQdoeI/7ZrA/ySrqz8S7o0cT?=
 =?us-ascii?Q?01HiMvsTVOw7/0sn8qi/qXmnDCAzfb7ZlL1ptlkYTsERFLnVlYEHJsnF3giJ?=
 =?us-ascii?Q?jAA5E8QAGRd4ner8ziPB1o2YRe9Olx/sQK2jcpnSbD6xkygC+cVco2TzX4x1?=
 =?us-ascii?Q?cZJxDHTYduehlYa9F2BcJ2Jh51r9Nx6xk4TTN8x/Baazh1veKDMLnZPFo7xe?=
 =?us-ascii?Q?c2fuz0tPGth085mbXb40bynkpYQjCf1GZeB0wBYeNMUDIgAy+lYfNDr3PdF/?=
 =?us-ascii?Q?Fc2Ox6DIsBvZMpoOf0QNiIsgWgHdzylCJpIlrH/Px/aMOwxd+GGwqvi6dANZ?=
 =?us-ascii?Q?uBQExmmUf8iF9LZODIbDeti0FBJl62kBTKSyA41HNITuj8aQZfj8l+X4BE1j?=
 =?us-ascii?Q?kL175v4U1Wlk13LtMk7JHk1dH59oVBZufj2gzdALKhQJuE/IMoFV3jnwL5pe?=
 =?us-ascii?Q?Fr9/h0390iorBgTDL5ruc5DTcR8Y2Qql1aaq+vJA+AGR3+spzzH+LUWDHPB6?=
 =?us-ascii?Q?NnUPptGd8Tx9y1OtGjMccLc8SozJm8Zs1w1XT4dm2ApLR4ps9g2PYZKuKIaj?=
 =?us-ascii?Q?EjeIArk7Hw6kItnQJuTaTcoqf8wULJnM3eM8HIgR09pffhaYjrcTDV/jdShZ?=
 =?us-ascii?Q?A+UdOjENnybKpo9+21pV7SWQatr7/h6e2py6bpN6lV+9VixZCCM0QqoOWVXl?=
 =?us-ascii?Q?VbXWpDlmrU7Jp1FdRRaYPXXRxwCeYIEdYDDtkTmtFz4ZDETeiS2+q4Ynod7i?=
 =?us-ascii?Q?TszHV+dQLMuDvFY2vrXviHK3EVh30c4wXf2NGFbHGiOMmKYds90pgbAxDB22?=
 =?us-ascii?Q?eShU7kx/MT4HhqP1FxAAAFdz3wDAoyYanIwnb6aEl8oi+Qv3uqwu2ppvYNKT?=
 =?us-ascii?Q?xRVA9rov16URbnfV33Y7dZbUCbsTrGaj9+JN5Iw6UqtRz9jvj9hjxLuX57SX?=
 =?us-ascii?Q?8Yg67W8HfsgVmuvh8+zFSHZONo+OHZkTGh7g9XBJDpsbGuUXRHrEkeLahN4o?=
 =?us-ascii?Q?h+cJDipX71VzlTYix4ZdkxOvrqX+5ai6N/Rj2T9i34Y9a4lLZD9uQFg34jra?=
 =?us-ascii?Q?WFJGtzCo5LwkjuIHqW+LjAou5GAdHRyCkodQAziKzWbnFKL2o9j1ymeL9BCg?=
 =?us-ascii?Q?Rylg3+wQUAbDu2tnKkcTz05oM3gqjHtieE5BCi4etHoZWUn4CflI3KmhbuHf?=
 =?us-ascii?Q?vLRr3FwnytWg7d+YZSHAQP0uaVFovzETf2MMwGyBTpmiPC8sEM4gT9Jhofio?=
 =?us-ascii?Q?GQ4chuaQlFSCuvV9BAQ4YLNpYPsUDP3Wo29P6ruqvWLsyHNZmUa7qniQXmsU?=
 =?us-ascii?Q?EXDn8MHlAmoNET+K+Cw2az/i1jx7mvdIITR3Vk2+Y9Vn1DGi2eWljYLdTBz9?=
 =?us-ascii?Q?E+leU4B+K8jgasS7yO2/mti3orLOJh8n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pYbQ2N3i7Upv+oY5xPrhvMJhZkxK9DabF7s0kSIKYbk1mlfUCjX8MoJA1Ihw?=
 =?us-ascii?Q?8kPTUvonImd0v6BkAWOpQVcEGSV87+kMOLwHlqYCUEpCbZbgHSAYz+H9DrZ5?=
 =?us-ascii?Q?IS+FMo6RCnQjN9ddUD7BRajbWRNsLzVkYmbYg5yHaNnW9Jir5lzbKPxltBE5?=
 =?us-ascii?Q?AtAEiRIggs495NGJ5MS9Ibrm1Y0BZj5YoKBPE2Y+H77EwOjKPxPkCkx8lop6?=
 =?us-ascii?Q?S4y5BnPelCiRybKlKJ5hZzXnROF7+HCO1U0qPmE0wvMYOM7yEZCcTDHLtT2h?=
 =?us-ascii?Q?J31ddI87gCBKBtmzJ9hqL8TaI1o97PGGsobSrM9Pk3m9i4ehIrQOA3SUGx4Z?=
 =?us-ascii?Q?Iqk7vyhPMWj9dMIVeJvsyJ1GiKAVQ+QU2C6KlUyUnIu44V1S5gh0901rkKe6?=
 =?us-ascii?Q?E81za9L3ZKFdXZlRccrqRLh9eoG1BeAnAl6qx0AW37A11ZTK6bydrrcsfJlY?=
 =?us-ascii?Q?RxOOJixm9FavYD0i5aiXqd3cu+phu8MTrzuUGUHGrNbglVhkKpxhpnxJb7Ls?=
 =?us-ascii?Q?choLBB/A1U4w8jqYy1JDJkaUdoQKeDcjj+ttiP3OeXhHQTQCwTOGT1XUUoJg?=
 =?us-ascii?Q?mMXqLiVp2HLcaPalKoOvxFsMUcMf4ZmMYJPkgVqhySjkbyKWWuzIXZ2pQ6fe?=
 =?us-ascii?Q?sK5/BbJ5P1Nl5W4HihEUqD6tJwVwqGUPWuVdWEjixyhieYSkTjsGG7pzpjtx?=
 =?us-ascii?Q?zaZ4ihAv3u4xYis8/Wv548agwVq3X8JMtZ5WofGGYM+Cv9l/tptFwVqXneqD?=
 =?us-ascii?Q?6RAHgIh6yWNwS/KgMkJ5WnpR7/EZ76AYpJ4unHnneoLSLVorF1h9csNA8IgN?=
 =?us-ascii?Q?v2QnB+3ZJdVVyF9a1VU451mITCjVI4ShppDRQNTkMOjn03bn+XO7/ioEDoLM?=
 =?us-ascii?Q?mV4MxI41Hu9c16AY7rLeBvPKsTi/p7+44rjWAmD8TvqiWYZmZ/5TUVApDltG?=
 =?us-ascii?Q?G11r8Tr+d4whPWt6uAlKi9fNc1gLsKiKlk2/0GlSEyu8fFSeKIAeMLedRcfR?=
 =?us-ascii?Q?j4yJLEDqvEcEPbhl8E60olmhDloZo9FI+s+lfWAI4NkqcKHTkVHmieE4HDYM?=
 =?us-ascii?Q?r80+zFX45XGyrscKCH6pkX30Qls1DtJ4tkEZouHA9gDxUIzpzlbbyXchbl61?=
 =?us-ascii?Q?iYS+cb1N1CzFkFsqO4oY/D980kpN/J1RtpAgm+0utoxxcogm1c3uyEA66m4i?=
 =?us-ascii?Q?g6oE/izYt9zfBngLhBmeQQWKmFDi6U8BX8Fafy8nXOJmEIejZXviDlAYUtSG?=
 =?us-ascii?Q?JITOU8qcJZOXPBwmD91dx5/ypvwjONrJOgIz3Bhh5qzTNBc3o7w9MSO5VsSL?=
 =?us-ascii?Q?R7Jl9GPBC7olRf90wg00KTJM3L27AckIWZ1a+MLWY7GxdUAvAVpIWi83gvHT?=
 =?us-ascii?Q?/VRVzZEHiuqU9KEGOAt83l1ngRKbjE/Azxep5f3bYYm5DDaa3QOST47w5mf6?=
 =?us-ascii?Q?2WZR/kYErO+wPNrS5N4MKl7RKZqcEM3pAck5faYQp7q7Lp6u0q3Fl7cK7o7s?=
 =?us-ascii?Q?EZQxAeF57xQ5adGuQZPirpeygVYmEXE6dOcH9AhNyEXh64xYEwU3eqTJso5U?=
 =?us-ascii?Q?8goR8akyJk0CxlYpc6+MKXqoRm3h8WxirUtbi3TxUyCQGHapd6g+YORznBTb?=
 =?us-ascii?Q?HHhMhGiedN8pAIWE5bPDrfU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78502ec9-d2ab-4dd5-2a79-08dd5a6dc03e
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:09:18.3886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvzFZR+BuJQgYdGzvBLbcmjzsBWnUoZC8+k56Ik0qmNMgGVDOE2fIvV+yKkTXTIiB+ry3r4665qTRqRwhbybNVP1JK7kfPfO1cY5sAOhdcqXFFYvF3hzxr+r4oTzqjhY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
found on the Renesas RZ/G2L SoC, with the following differences:
- A different D-PHY
- Additional registers for the MIPI CSI-2 link
- Only two clocks

Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Dropped empty line as suggested by LPinchart
 - Fixed minItems into else conditional block as suggested by RHerring

Changes since v2:
 - Collected tags
 - Fixed CRU_CMN_RSTB description as suggested by LPinchart

Changes since v3:
 - Fixed CRU_CMN_RSTB description as suggested by GUytterhoeven

 .../bindings/media/renesas,rzg2l-csi2.yaml    | 59 ++++++++++++++-----
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 7faa12fecd5b..1f9ee37584b3 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
@@ -17,12 +17,14 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-csi2       # RZ/G2UL
-          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
-          - renesas,r9a07g054-csi2       # RZ/V2L
-      - const: renesas,rzg2l-csi2
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-csi2 # RZ/G2UL
+              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
+              - renesas,r9a07g054-csi2 # RZ/V2L
+          - const: renesas,rzg2l-csi2
+      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
 
   reg:
     maxItems: 1
@@ -31,16 +33,24 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Internal clock for connecting CRU and MIPI
-      - description: CRU Main clock
-      - description: CRU Register access clock
+    oneOf:
+      - items:
+          - description: Internal clock for connecting CRU and MIPI
+          - description: CRU Main clock
+          - description: CRU Register access clock
+      - items:
+          - description: CRU Main clock
+          - description: CRU Register access clock
 
   clock-names:
-    items:
-      - const: system
-      - const: video
-      - const: apb
+    oneOf:
+      - items:
+          - const: system
+          - const: video
+          - const: apb
+      - items:
+          - const: video
+          - const: apb
 
   power-domains:
     maxItems: 1
@@ -48,7 +58,7 @@ properties:
   resets:
     items:
       - description: CRU_PRESETN reset terminal
-      - description: CRU_CMN_RSTB reset terminal
+      - description: D-PHY reset (CRU_CMN_RSTB or CRU_n_S_RESETN)
 
   reset-names:
     items:
@@ -101,6 +111,25 @@ required:
   - reset-names
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-csi2
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+    else:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


