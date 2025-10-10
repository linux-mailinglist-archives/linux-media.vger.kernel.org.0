Return-Path: <linux-media+bounces-44181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A01BCDC8B
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 17:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E627B3A7208
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 15:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBF82F9982;
	Fri, 10 Oct 2025 15:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fAT4tEwZ"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D402F60D5;
	Fri, 10 Oct 2025 15:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760109422; cv=fail; b=QzKq5oxG+tdW3sE0P8MKNSUsExMNTDtYNSbIlDU96qsl4fN8YrywNfnIf2xG8Z8VGKitxaG6ZejT3ZQx7Pes63td7fYUV6sPfMdS1Z0wMoQrRPkjypEUitE3iV38xBWz6dsaE1wRCbPmoXgME1g8qx9yJ8fCuxlwIuQfcEYK0dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760109422; c=relaxed/simple;
	bh=IoNttQ/QJp2UV3iUfuxuHAF15O9dXllVCURFrThFYC0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mUAfaJk2AixFATlWRZkLQQS/27Kgn0GbQ9I3rHrO6+hCXPXfZWzToG/RgGYjIFv9mrAmmJz0+OJU4WzDP06d16OphseNH0iSm5NK5SN827tWvIRNMbU2sFODcZ5hXFcWPEJKnQbl9K6bLMePsFPvi4V2/1qOOMYaHA/SpLGgChw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fAT4tEwZ; arc=fail smtp.client-ip=52.101.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPlsA5i40VLsX9DoBGqf3iFd2UIrg4Ameultn//jmMMckzj2OscRMypy73SY6Eu8ZQgTOKCZcUAMYrfgdzhDwtxgsUxPiP1N0BiGycP3KldQN0c/af23/WnG+2nFYv8eU3euk7807p2qBQSDl0Szs8xppB1G/M5zdSjr6CC5jjQOg4mSyOr01xYBAEWeP+gCD7Dcuc50V3Ix0gobjCbysWQoTzFz/yvYm+bEuK7zvGO3RxFsyZzI/G8NalSfeV0ti9wZrBDPXWUsjRZzZCQOrTlgLkLja3YFGzyFCqu/IGiNGrEt6BdGt0X7PhtSbjsel0DK3U9U2Oo+hA5mN8bRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xZDPoMO1Rcd5G2MPQR9OdcP0HjFgh3iXuP6VCXSdbE=;
 b=Ro5Io2kyA5S67GBcIbZWj/tlTJEcPAwTMddqohdLYLP2m/UnIZnJcd4rR3vwqhLnucDs4pLuUJH8g/N1bqcySGHIFDWoGihBhB4Ezqry8CzBHaizd3FA6qFdCQ4EplriWtGzgkvcDxmvaZ9TjHJOjF+yYm/AIYHUfwggG6lHKHCX9GE8UAkLEiAZGSub5UAUU+M6CW3iFgOJl2TGQeUpm/0bUIc+vFCSeYt6U4V/DxiGEdM7TtnvPflT/KuSJN9dM8xTJZ553s0zjA4JJiYD448TuqsJUlJoHTaVSPb1Ney/PiOKCb8zZs6DyAayJfp+enN0bb+0vVxgEUyIMTegsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xZDPoMO1Rcd5G2MPQR9OdcP0HjFgh3iXuP6VCXSdbE=;
 b=fAT4tEwZmKFq0c39+5HAWJtQHH1md5TYcbqPn7+aEPUoIlO3fP/nHTdVSGvxSpODXnhxlN/zl4cSmde+wIShnixzlfT2qHTuA4+8x4JQKuU+pORVqplclLd4vVch7UykKfpmDc+A+3IpvY5WBnf3IGllQ0lQRyxwQYTDE/2KpfJ49oUnxVOiqwYQgPHnHFkdnPA5w7nlQ6j+V4pDlVqBKDJ5FrloC6M8hWh3FVR+PkaW9qRyzqagMnC18EJJIVjmk1H0T9dgCKsDRvFKfZOeg1wXvCLtSggmeZKByMyK3neaSGis6BmYcCICOXaBC6J5gTZHpzCCI50sdNDqgPljvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS1PR04MB9310.eurprd04.prod.outlook.com (2603:10a6:20b:4de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 15:16:56 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 15:16:56 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: media: convert nxp,tda1997x.txt to yaml format
Date: Fri, 10 Oct 2025 11:16:23 -0400
Message-Id: <20251010151637.2061727-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0104.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::45) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS1PR04MB9310:EE_
X-MS-Office365-Filtering-Correlation-Id: 766665cd-9483-44d0-1636-08de08100cf9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?W5VPVQpmjg7FTxnDjEhqavSRfYavEy7UswQn+FzOWoQgH2fQ/jMn9m0Y3d7h?=
 =?us-ascii?Q?DD4iUwERRMzb5NRmOS0vT31OoQInaPMPDFE/3vVHQGmce/+VFDxCamVLVvf8?=
 =?us-ascii?Q?fbPjE0SwblSSaXERC9YscS5/6ndugx528GotQgzI7SRf+Mus+t81sUoWRuK/?=
 =?us-ascii?Q?gSg7ah9xf4AHUN6uIeydnwIN8mdUKcIZbl5g0fmfmHSaOtAvCO4TkbqTvgP8?=
 =?us-ascii?Q?JoUxxlj4S0u7HJgxBB40ch7usJSVK93HXvK3+HwUUTWORnt5bkUifeADnWPK?=
 =?us-ascii?Q?UK2gZjeqDuJqRYaLzBQdNB+l+qjdWoULKM+61niXV4Kuacx2KMcSdItxOS19?=
 =?us-ascii?Q?38+dvc3lH7ewzFyzLHaATjVIENfgvltbK6Fwqp7yfEcOEyVsmFLaoF1ie/C2?=
 =?us-ascii?Q?TdhwSu+BatEMJFMBotjqb1mbyyJ/BYps1d+HWgpFc9guhsn24LckNNndYnAr?=
 =?us-ascii?Q?dwuvXiGUJnUybZZ8CgGJINaYQLx0y6Kfzv11Li8GWsJSOPnOHa8MsyJOYia8?=
 =?us-ascii?Q?JE7INTvZqrBkHFC4eK1HbgBNiiKN/hdrc5w0LCsGOt8bcSe3viiqYzSGCfuc?=
 =?us-ascii?Q?UMlKXgjUqIyTInYNjRX8tQ96wg+gNSyL95E5rH5TF73Ai4xNlwHxw4WSUVXS?=
 =?us-ascii?Q?V489vT62spS/7mnds3LaiAyoWbFFgjGH/04F/W6WlN40KvCj4AN7av/dwshH?=
 =?us-ascii?Q?e+VfEJLwlprPINQPAJJClVj0o7tDtA1+JkbyZinzRHyeGsGPACXlVnrRwxHJ?=
 =?us-ascii?Q?ubbb1CG3ocNkmWOe8dg/MSsqsg5kkUkr5YWvnOGOmXlM37nun3jJaeLaRfal?=
 =?us-ascii?Q?X7lPiE/vPLrTMfVzl+Ka7edwDyPMnEwdeegkQQSE4tWJdXjemT2fTKseM0c5?=
 =?us-ascii?Q?/qJ1H0P2T4WdjwuUFuJyzwtWlviXwQXuIes8t1lW3PKHaeSanOjVsYK+9TcP?=
 =?us-ascii?Q?8nf8GiyaqEVib7+aUejU9R3eGr9Y6+1Mf757mJpTksrMBY4+bORcUtq33w+W?=
 =?us-ascii?Q?Ek98FMtTA25vjJ1gRbLspLqt4o4OANxTdLCp8G2Lh8W+vjjhn/oC02kGhVNT?=
 =?us-ascii?Q?NTUDtVwDlwlY9bdCSgoKPF/yyS6w3YJsfTPqbW4/LSTot6FVLIECyj+6WNg0?=
 =?us-ascii?Q?76ssAzD6P+8u9Z3aMUO/vbgZgcH4kVGdXSTY/08pt3eg78wqQQZDzy3MzA+x?=
 =?us-ascii?Q?xYxTlGfT1KhRdhMpXmZTpSiqMZEn116SNH5gIzYJnrwg6ef+BibScneZ1s8L?=
 =?us-ascii?Q?BZHgtSEDaFwKbXzcdd4ndZaXOGstQD/csB1gslzS4+CpGir3bu9JX9nxo1uN?=
 =?us-ascii?Q?JHxmcoB+TDBXh+6hKa61AdbGT7KCGbDYBLe0T7eOjo9WWaJkSnAYXsKaUjSj?=
 =?us-ascii?Q?9G0ydnEmlbiC7ZADvou1lz6UW2JF6kesUPXi+crcJTOsaAj+DU381CweKYSW?=
 =?us-ascii?Q?qJugme/fYyaPMoozpF+QITJ8C5IpdNdy8rDrVnV64rP9UNdDtbWyDQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?U8a0YywIHpVo6W0dDYqAHXUbot7TBPtGhmg5lFqxn4FdZ56CGkaV94a4looh?=
 =?us-ascii?Q?exVEOyTb9NOddXte/1DHFAUw+vAfNGF/IGzKUv5FdojFRPeEJMzQN2DS7C5z?=
 =?us-ascii?Q?2UwTzwEyxdeDv6HhsZ/G9bB2e4zKPiOAISHLtlOlZFldB/xQPZfYfOfbJRl+?=
 =?us-ascii?Q?BLot9+DBg2cJ4EQw0ixS5ckeXVlpy52j4bZo3ubAVqFDocZLIv88Pnpcnsgj?=
 =?us-ascii?Q?9RbxRWXmIHOVVeU97WPGQI9O2hKEc1TCCQ+hMvnHeV2rQS1W3esuus/fzIX/?=
 =?us-ascii?Q?FjL24M+Hp/wdd9mvAZIB4Vz9jn9pcq6c4cEisp8MjKhZ0Yg19x8kEmccndKk?=
 =?us-ascii?Q?bDS5vIZfdXTqiEUbc9F//bzdsr35+OL8KM2y2VelvEg0mJY3aIat3GAvhH7Y?=
 =?us-ascii?Q?NKnAeuOHpKWiNMaewmwfw3uVRuboI+5Va1Ozcz4v1+aHkoNYV/xOkKNROmK0?=
 =?us-ascii?Q?Wr8kPSKDmVOwz9WFG8kaHneFOA857+v9HEzKuOgPIu1HuulM4D3VbuzWDXuS?=
 =?us-ascii?Q?6nvrp1NLslgv7Z6az6+lW1uYj3TiRR2HEBatKlg2kzRzMYe7KsFv8vgqpPPm?=
 =?us-ascii?Q?DwZOQGyJJBljilFSGtXWU0kG5N2yzpmCe/l0NjN4mjYD/dIBkJ01KVog3Vn1?=
 =?us-ascii?Q?mO/YNuuhzepx6EnLYFDQ5pWlRR5QipG9rvNpOvsyCnXkXq+LMzJ/NOB/QZi1?=
 =?us-ascii?Q?yUPgE6Fy5Xq5pGzN4GBK/n1vQuat9R0T1kpc7SNIicMpgYJXjN4weQwgi4z2?=
 =?us-ascii?Q?6Jtr9I4/InYMEJuzCzt5iVcLqXbAX7jAHPXA6qX9+8r9Vf0cX6PqPAABJSeL?=
 =?us-ascii?Q?n1ia7ke5NsXGMsa34AVbSfgcJLLf7itHgPO5MeFmYZKdyjwpq8hCaGcvv5p8?=
 =?us-ascii?Q?Ryfu/+Y5VFi3ZImmA4xwVEk0n2wyhw6M51706l/s0jP6E6RuDpq9LEhLoeuQ?=
 =?us-ascii?Q?X8BjsorPMyi12sPOtx5nSlWNYudFnwmWZdyr6/Xm1ZHAbzrIw9zV/jg31d0o?=
 =?us-ascii?Q?FBy8qCBuKBwIb6Oig1Uv7DqXoDxt9EjP5a2sy23cr2nctjxT2pSm4vLe//ik?=
 =?us-ascii?Q?Pdg7Pb0Ad7vcJB52wTFSsOC2u5I8//jHWVWkRwcbl2l7m8EeEzWfIt7eCyup?=
 =?us-ascii?Q?VgBJ5ctlwCFP6wjKmTzdkBzpjXoSCNbJL4+F6zIOiB1vdZXeaex7OGrKIDSq?=
 =?us-ascii?Q?GqOgFv6rjTjY76XrRh3wZ8LLs1f1f4irjH+v86OszbEXL80fl3xL5DcoURfo?=
 =?us-ascii?Q?HjP3x4J7UirE34UsUbZ6WiG23S0tGBFiZPBI8r0di0ndcNPdeKCQDQR1qxQU?=
 =?us-ascii?Q?P/ARULM8La698ImAlZr55oJC0tdUGSXfziNCJif/e4/UBrM9vH/+iUTLE1SY?=
 =?us-ascii?Q?Ce6rAE52OU8CDQlylKH8NkwQlTS69eWcG38n/APCqJ8ZKRfeHjqfJc3dykYJ?=
 =?us-ascii?Q?Q5k02nbwF9FsfNPGaTERK9IoRLkVFzyKPMkYBjmUK3Q4etxXidOdLGK0Q+IX?=
 =?us-ascii?Q?FWHbWb/vYQ0unKBf+tqmxkFveMv13CMRbvU/JkJVN7Dnc5Riqli4EhwkhOxo?=
 =?us-ascii?Q?bCAVG+miiiFIOkWI+mI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766665cd-9483-44d0-1636-08de08100cf9
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 15:16:56.5579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAu6gFkD3E1EmpcW8l86fVfgB8j7gLW7IKYmN3T09tJTFC7emvNtcROVZpju+QhREDG4gWF8sN52zgZi/JB7xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9310

Convert nxp,tda1997x.txt to yaml format

Additional changes:
- update audio width to 8, 16, 24, 32.
- keep one example only.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/media/i2c/nxp,tda19971.yaml      | 158 ++++++++++++++++
 .../bindings/media/i2c/nxp,tda1997x.txt       | 178 ------------------
 2 files changed, 158 insertions(+), 178 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml b/Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml
new file mode 100644
index 0000000000000..7624391e1c1e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/nxp,tda19971.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP TDA1997x HDMI receiver
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  The TDA19971/73 are HDMI video receivers.
+
+  The TDA19971 Video port output pins can be used as follows:
+   - RGB 8bit per color (24 bits total): R[11:4] B[11:4] G[11:4]
+   - YUV444 8bit per color (24 bits total): Y[11:4] Cr[11:4] Cb[11:4]
+   - YUV422 semi-planar 8bit per component (16 bits total): Y[11:4] CbCr[11:4]
+   - YUV422 semi-planar 10bit per component (20 bits total): Y[11:2] CbCr[11:2]
+   - YUV422 semi-planar 12bit per component (24 bits total): - Y[11:0] CbCr[11:0]
+   - YUV422 BT656 8bit per component (8 bits total): YCbCr[11:4] (2-cycles)
+   - YUV422 BT656 10bit per component (10 bits total): YCbCr[11:2] (2-cycles)
+   - YUV422 BT656 12bit per component (12 bits total): YCbCr[11:0] (2-cycles)
+
+  The TDA19973 Video port output pins can be used as follows:
+   - RGB 12bit per color (36 bits total): R[11:0] B[11:0] G[11:0]
+   - YUV444 12bit per color (36 bits total): Y[11:0] Cb[11:0] Cr[11:0]
+   - YUV422 semi-planar 12bit per component (24 bits total): Y[11:0] CbCr[11:0]
+   - YUV422 BT656 12bit per component (12 bits total): YCbCr[11:0] (2-cycles)
+
+  The Video port output pins are mapped via 4-bit 'pin groups' allowing
+  for a variety of connection possibilities including swapping pin order within
+  pin groups. The video_portcfg device-tree property consists of register mapping
+  pairs which map a chip-specific VP output register to a 4-bit pin group. If
+  the pin group needs to be bit-swapped you can use the *_S pin-group defines.
+
+properties:
+  compatible:
+    enum:
+      - nxp,tda19971
+      - nxp,tda19973
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  DOVDD-supply: true
+
+  DVDD-supply: true
+
+  AVDD-supply: true
+
+  '#sound-dai-cells':
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+  nxp,vidout-portcfg:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    minItems: 1
+    maxItems: 4
+    items:
+      items:
+        maxItems: 2
+
+    description:
+      array of pairs mapping VP output pins to pin groups.
+
+  nxp,audout-format:
+    enum:
+      - i2s
+      - spdif
+
+  nxp,audout-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8, 16, 24, 32]
+    description:
+      width of audio output data bus.
+
+  nxp,audout-layout:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description:
+      data layout (0=AP0 used, 1=AP0/AP1/AP2/AP3 used).
+
+  nxp,audout-mclk-fs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Multiplication factor between stream rate and codec mclk.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - DOVDD-supply
+  - AVDD-supply
+  - DVDD-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/media/tda1997x.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi-receiver@48 {
+            compatible = "nxp,tda19971";
+            reg = <0x48>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_tda1997x>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+            DOVDD-supply = <&reg_3p3v>;
+            AVDD-supply = <&reg_1p8v>;
+            DVDD-supply = <&reg_1p8v>;
+            /* audio */
+            #sound-dai-cells = <0>;
+            nxp,audout-format = "i2s";
+            nxp,audout-layout = <0>;
+            nxp,audout-width = <16>;
+            nxp,audout-mclk-fs = <128>;
+            /*
+             * The 8bpp YUV422 semi-planar mode outputs CbCr[11:4]
+             * and Y[11:4] across 16bits in the same pixclk cycle.
+             */
+            nxp,vidout-portcfg =
+                /* Y[11:8]<->VP[15:12]<->CSI_DATA[19:16] */
+                < TDA1997X_VP24_V15_12 TDA1997X_G_Y_11_8 >,
+                /* Y[7:4]<->VP[11:08]<->CSI_DATA[15:12] */
+                < TDA1997X_VP24_V11_08 TDA1997X_G_Y_7_4 >,
+                /* CbCc[11:8]<->VP[07:04]<->CSI_DATA[11:8] */
+                < TDA1997X_VP24_V07_04 TDA1997X_R_CR_CBCR_11_8 >,
+                /* CbCr[7:4]<->VP[03:00]<->CSI_DATA[7:4] */
+                < TDA1997X_VP24_V03_00 TDA1997X_R_CR_CBCR_7_4 >;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
+                    bus-width = <16>;
+                    hsync-active = <1>;
+                    vsync-active = <1>;
+                    data-active = <1>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt b/Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
deleted file mode 100644
index e76167999d76c..0000000000000
--- a/Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
+++ /dev/null
@@ -1,178 +0,0 @@
-Device-Tree bindings for the NXP TDA1997x HDMI receiver
-
-The TDA19971/73 are HDMI video receivers.
-
-The TDA19971 Video port output pins can be used as follows:
- - RGB 8bit per color (24 bits total): R[11:4] B[11:4] G[11:4]
- - YUV444 8bit per color (24 bits total): Y[11:4] Cr[11:4] Cb[11:4]
- - YUV422 semi-planar 8bit per component (16 bits total): Y[11:4] CbCr[11:4]
- - YUV422 semi-planar 10bit per component (20 bits total): Y[11:2] CbCr[11:2]
- - YUV422 semi-planar 12bit per component (24 bits total): - Y[11:0] CbCr[11:0]
- - YUV422 BT656 8bit per component (8 bits total): YCbCr[11:4] (2-cycles)
- - YUV422 BT656 10bit per component (10 bits total): YCbCr[11:2] (2-cycles)
- - YUV422 BT656 12bit per component (12 bits total): YCbCr[11:0] (2-cycles)
-
-The TDA19973 Video port output pins can be used as follows:
- - RGB 12bit per color (36 bits total): R[11:0] B[11:0] G[11:0]
- - YUV444 12bit per color (36 bits total): Y[11:0] Cb[11:0] Cr[11:0]
- - YUV422 semi-planar 12bit per component (24 bits total): Y[11:0] CbCr[11:0]
- - YUV422 BT656 12bit per component (12 bits total): YCbCr[11:0] (2-cycles)
-
-The Video port output pins are mapped via 4-bit 'pin groups' allowing
-for a variety of connection possibilities including swapping pin order within
-pin groups. The video_portcfg device-tree property consists of register mapping
-pairs which map a chip-specific VP output register to a 4-bit pin group. If
-the pin group needs to be bit-swapped you can use the *_S pin-group defines.
-
-Required Properties:
- - compatible          :
-  - "nxp,tda19971" for the TDA19971
-  - "nxp,tda19973" for the TDA19973
- - reg                 : I2C slave address
- - interrupts          : The interrupt number
- - DOVDD-supply        : Digital I/O supply
- - DVDD-supply         : Digital Core supply
- - AVDD-supply         : Analog supply
- - nxp,vidout-portcfg  : array of pairs mapping VP output pins to pin groups.
-
-Optional Properties:
- - nxp,audout-format   : DAI bus format: "i2s" or "spdif".
- - nxp,audout-width    : width of audio output data bus (1-4).
- - nxp,audout-layout   : data layout (0=AP0 used, 1=AP0/AP1/AP2/AP3 used).
- - nxp,audout-mclk-fs  : Multiplication factor between stream rate and codec
-                         mclk.
-
-The port node shall contain one endpoint child node for its digital
-output video port, in accordance with the video interface bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Optional Endpoint Properties:
-  The following three properties are defined in video-interfaces.txt and
-  are valid for the output parallel bus endpoint:
-  - hsync-active: Horizontal synchronization polarity. Defaults to active high.
-  - vsync-active: Vertical synchronization polarity. Defaults to active high.
-  - data-active: Data polarity. Defaults to active high.
-
-Examples:
- - VP[15:0] connected to IMX6 CSI_DATA[19:4] for 16bit YUV422
-   16bit I2S layout0 with a 128*fs clock (A_WS, AP0, A_CLK pins)
-	hdmi-receiver@48 {
-		compatible = "nxp,tda19971";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_tda1997x>;
-		reg = <0x48>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
-		DOVDD-supply = <&reg_3p3v>;
-		AVDD-supply = <&reg_1p8v>;
-		DVDD-supply = <&reg_1p8v>;
-		/* audio */
-		#sound-dai-cells = <0>;
-		nxp,audout-format = "i2s";
-		nxp,audout-layout = <0>;
-		nxp,audout-width = <16>;
-		nxp,audout-mclk-fs = <128>;
-		/*
-		 * The 8bpp YUV422 semi-planar mode outputs CbCr[11:4]
-		 * and Y[11:4] across 16bits in the same pixclk cycle.
-		 */
-		nxp,vidout-portcfg =
-			/* Y[11:8]<->VP[15:12]<->CSI_DATA[19:16] */
-			< TDA1997X_VP24_V15_12 TDA1997X_G_Y_11_8 >,
-			/* Y[7:4]<->VP[11:08]<->CSI_DATA[15:12] */
-			< TDA1997X_VP24_V11_08 TDA1997X_G_Y_7_4 >,
-			/* CbCc[11:8]<->VP[07:04]<->CSI_DATA[11:8] */
-			< TDA1997X_VP24_V07_04 TDA1997X_R_CR_CBCR_11_8 >,
-			/* CbCr[7:4]<->VP[03:00]<->CSI_DATA[7:4] */
-			< TDA1997X_VP24_V03_00 TDA1997X_R_CR_CBCR_7_4 >;
-
-		port {
-			tda1997x_to_ipu1_csi0_mux: endpoint {
-				remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
-				bus-width = <16>;
-				hsync-active = <1>;
-				vsync-active = <1>;
-				data-active = <1>;
-			};
-		};
-	};
- - VP[15:8] connected to IMX6 CSI_DATA[19:12] for 8bit BT656
-   16bit I2S layout0 with a 128*fs clock (A_WS, AP0, A_CLK pins)
-	hdmi-receiver@48 {
-		compatible = "nxp,tda19971";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_tda1997x>;
-		reg = <0x48>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
-		DOVDD-supply = <&reg_3p3v>;
-		AVDD-supply = <&reg_1p8v>;
-		DVDD-supply = <&reg_1p8v>;
-		/* audio */
-		#sound-dai-cells = <0>;
-		nxp,audout-format = "i2s";
-		nxp,audout-layout = <0>;
-		nxp,audout-width = <16>;
-		nxp,audout-mclk-fs = <128>;
-		/*
-		 * The 8bpp YUV422 semi-planar mode outputs CbCr[11:4]
-		 * and Y[11:4] across 16bits in the same pixclk cycle.
-		 */
-		nxp,vidout-portcfg =
-			/* Y[11:8]<->VP[15:12]<->CSI_DATA[19:16] */
-			< TDA1997X_VP24_V15_12 TDA1997X_G_Y_11_8 >,
-			/* Y[7:4]<->VP[11:08]<->CSI_DATA[15:12] */
-			< TDA1997X_VP24_V11_08 TDA1997X_G_Y_7_4 >,
-			/* CbCc[11:8]<->VP[07:04]<->CSI_DATA[11:8] */
-			< TDA1997X_VP24_V07_04 TDA1997X_R_CR_CBCR_11_8 >,
-			/* CbCr[7:4]<->VP[03:00]<->CSI_DATA[7:4] */
-			< TDA1997X_VP24_V03_00 TDA1997X_R_CR_CBCR_7_4 >;
-
-		port {
-			tda1997x_to_ipu1_csi0_mux: endpoint {
-				remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
-				bus-width = <16>;
-				hsync-active = <1>;
-				vsync-active = <1>;
-				data-active = <1>;
-			};
-		};
-	};
- - VP[15:8] connected to IMX6 CSI_DATA[19:12] for 8bit BT656
-   16bit I2S layout0 with a 128*fs clock (A_WS, AP0, A_CLK pins)
-	hdmi-receiver@48 {
-		compatible = "nxp,tda19971";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_tda1997x>;
-		reg = <0x48>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
-		DOVDD-supply = <&reg_3p3v>;
-		AVDD-supply = <&reg_1p8v>;
-		DVDD-supply = <&reg_1p8v>;
-		/* audio */
-		#sound-dai-cells = <0>;
-		nxp,audout-format = "i2s";
-		nxp,audout-layout = <0>;
-		nxp,audout-width = <16>;
-		nxp,audout-mclk-fs = <128>;
-		/*
-		 * The 8bpp BT656 mode outputs YCbCr[11:4] across 8bits over
-		 * 2 pixclk cycles.
-		 */
-		nxp,vidout-portcfg =
-			/* YCbCr[11:8]<->VP[15:12]<->CSI_DATA[19:16] */
-			< TDA1997X_VP24_V15_12 TDA1997X_R_CR_CBCR_11_8 >,
-			/* YCbCr[7:4]<->VP[11:08]<->CSI_DATA[15:12] */
-			< TDA1997X_VP24_V11_08 TDA1997X_R_CR_CBCR_7_4 >,
-
-		port {
-			tda1997x_to_ipu1_csi0_mux: endpoint {
-				remote-endpoint = <&ipu1_csi0_mux_from_parallel_sensor>;
-				bus-width = <16>;
-				hsync-active = <1>;
-				vsync-active = <1>;
-				data-active = <1>;
-			};
-		};
-	};
-- 
2.34.1


