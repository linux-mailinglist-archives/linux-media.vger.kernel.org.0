Return-Path: <linux-media+bounces-27060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8278CA4648A
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 233633B47F2
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BD5227BA1;
	Wed, 26 Feb 2025 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DcjvRCM2"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011007.outbound.protection.outlook.com [40.107.74.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF48221D3E7;
	Wed, 26 Feb 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583526; cv=fail; b=tIMupLBDOmor0E+R38hklcvQZpmngigw+jJEm+wUDNl+r6wucij2x311llPYXJWp23UIynjU8hBHPniI+vcRRZZVUhdSCYwgoTEYvLP6zYPj+KHVEgcqAs+rp3qly/WlTkzg5gFWtpviF1GGhlu1qGPbY1ZAq22A/uVeUr7EMVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583526; c=relaxed/simple;
	bh=dO8wJXyxuJjrbj/VsoL/Aj52CkSGklGdjMOzLN26zCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GFLvw2X/KB9UqYIn2rt5VP0Sw6tvO7EwSMnnaV4E4fEDyEg8faTFNHEmGt6plFuHupDkyDLmxJVM/HyJaEeSMERA3c9bYWP4P5DeTcWLz7zc5JIJSyk9pmBvYsuhd2R4+HPfuBtLuBRRJmxNYhbz7WR91Se6VCNlx6PLyzxN4e0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DcjvRCM2; arc=fail smtp.client-ip=40.107.74.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/NrvQrjhbQYUehjbNOrF9UkO1Xf/Xd9jESRwARKvDNhzeHDyVdkaSiLUoDO0GuEujOgxdLICCPInoPV2eqDTf5xMwgeM4bktovbiRzX+turc3mQ3fJBtMCC7N5/Hecyi4JuLnNXsnCkETMfKJcDYh6p1/4O3ZZHQQLNKSaK3KuRtDnaQtzDhLa3IVkgogxtepxyQPdz3Ik7cXNQGIxaY+xxgjy+8RVQISmHcbmW7xdlQe/fyCT/v8IYZNxHVLsrjBVS/n4Fz9GgQvvSnk5XFDh4opQGwi1h2bdXRw961B350rNoNJ90i6I7I04ErFtPMEbgSx7oyMPXQzMVkgcMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IC7ZTZXhR1ZCtvs4E7WEo/lx4IYGsVXWRPr359WfHmU=;
 b=x4QKaZ+KKBneuMkizYptt7LEpR62fN3+hx2cUR+ZRPvVrrRbBK1ncjDDxheAAVkrznsDcn1rCX3wLqrZH2Qsa8QbXn726+aZsGlwfEFH/et9jaAkvXjf/bsyU2KddAO9xErz3hYzTBUOMetU90MVnzsYHzFAn/lQEJfTI/P3tfs8+k64cfBriWTurdd5/sp5pim/VUTY9UmjlBEcysG0Dfw3iJCcNEuYe6iAjw2dqvBTGxtfdw+aVJqY5yTtKCF/1EFSsdjQWj0xizNvV/J0NI2Mpuc0Bo6YNkqaS6/wG5imzJ+33CDgcJHR9Rt/vt2MAcbI6HjFd6gq/BeHUEFFAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IC7ZTZXhR1ZCtvs4E7WEo/lx4IYGsVXWRPr359WfHmU=;
 b=DcjvRCM2vqM5kwGlNw1YDwg0n8mAUqTkRnOC5m3KlyptUqZYgJXa8SuvNPfFOfuLHyU/SJHuAomXq0+hIqUT6PW+AC+akNx4XjOOGS7GiINcvz9vZXBrJTtF0rR7oFOWPNb7wHe5kdpqX1EsFIIJ3DJn0Tom8Tdd9t2sMQGl1YE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:25:21 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:25:21 +0000
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
Subject: [PATCH v3 01/17] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
Date: Wed, 26 Feb 2025 16:23:25 +0100
Message-ID: <20250226152418.1132337-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e953801-3f80-451f-ebc8-08dd5679c873
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?94QW+wdjYkFrGiH2hlfFn+AHwFanXohKd4PQe8TCkoHAzmBeSrehrH8wFPq0?=
 =?us-ascii?Q?cOr+2x7WZiLZEZ9HswTHAOBEpG6gvvcdy0y6iYuySAr6XLVLNFpLuRK2SI4N?=
 =?us-ascii?Q?9VQGmoCMu0MIM1fCFv5eCSNFCDgDGfK7Hj6Ix5BynHrN3L/ViboRDlvZyxkY?=
 =?us-ascii?Q?m+dj+G6s33kqtiTRPLoPjHnV809AVk7ranhBSk1LJ59cd+FtXP/ZR0ZHasD9?=
 =?us-ascii?Q?kbyTYBufX+Oe9cUlXc/LTS3hSsB1tOHaTKPXdnsWQEPxZkXYO36D7Ny/1md6?=
 =?us-ascii?Q?ateeWOQrkn8rrKXaI5GQBDXOOA7o5BUCJbifllwIdT0vcN5G+xZLfTJRQums?=
 =?us-ascii?Q?epN62Ud2GAIK32Kk0bhUTlcWE+Vm+Y0drpereATHr8a2QNMZ0Ni16B+SknJA?=
 =?us-ascii?Q?iYDvTVKCEJrZheyVGJ9jQ2cWh7aCLCwBq6QjCQg89VIYOpcP7vlCTB4coUzD?=
 =?us-ascii?Q?zjoaJpFzz38ZCNyNLXA3gcvlr0/EWR5uazlaH5q3TXrCdiMNDuIfvVIezg8C?=
 =?us-ascii?Q?Mne33qoI73o2Me93zlekec5OOfx9gWpcMFyJR3WwVi5a/raJUZ/OVk7RIGPG?=
 =?us-ascii?Q?7d6yADHjoWH17+cBkmV+opAA+GUetqaJ2axV8Ta4HlU4ftq6C5mQVsfa6O/p?=
 =?us-ascii?Q?I20s2nt4sec8YCbfRrq8z+hZJM8zLxISXGDQygw6W5sMYnLHNFKWui5oj5Zz?=
 =?us-ascii?Q?kEx5ZM9weMjR5jaBGJHJI8Es/XFOEzFxTblAMAqjZRqKcHKPKIBqpF75QzdI?=
 =?us-ascii?Q?BdsNEJKxZB4TQSnQu03PJyXPN1I7pE5aqjStfydIX4WAHn7v+EMfobj/UQ8x?=
 =?us-ascii?Q?KKWqtMSuOn/NrRmJBcL/b70sQ3xfvrcmMLQfpmyVnaDRPvTjY+jY/yyj66i8?=
 =?us-ascii?Q?UKGKTWZ5aYSm8jnHL76P+o9PnLUu5D6B4ps7RlptX6njEPv52tyxfeq49bY5?=
 =?us-ascii?Q?wLWlBxEXrmcgtFGn2ax92rd4wYLyWXmTeKVgac2luftmwOtb4p5QBLlR0Xld?=
 =?us-ascii?Q?V/AL+P/We3H97crtBxqAspkkaScD59JP3rniSayEV4cmZQLzoDlniw+vHNwi?=
 =?us-ascii?Q?DexVcsU1nE2Uq/y8if7uDHa/agpdiTOrx0mWO50yejaly6CTEeU2k5zZDXuo?=
 =?us-ascii?Q?4+2uTOSvv3IwCSEGNNdkwpuYXzlC68MMf1rNXYqg3vQe2poyxUpd3HptSnk0?=
 =?us-ascii?Q?hSyft1EyLy7E+t6Vuf9PNKM79qwNKKVYbIbt155nbtetfLL0RWlPNa5acceZ?=
 =?us-ascii?Q?vMGDy/XsKb8JDwgEwxAVUmlgnnlXxkhgCWjdtgqid0DeqNnMcUn71AplEmhq?=
 =?us-ascii?Q?09rgUxXCAI4P+EmUVQqhfT9Mk6MgKqAa5cGFIR5hSz2JSfjhIYdy+95hc8Oa?=
 =?us-ascii?Q?SIT9waVrfqbPltbI1lMypYJfefqQO3+5BxeKp/eShmVlSpK4VJCthn0fluoe?=
 =?us-ascii?Q?VN7lpY88W5e1GX3pOcdfCy8IkdMJtAZl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k5/uH2vVpxBzSc8mSJcnkINtiQ3jTQkDT4n0qexs5h30SsfkHZiM5o3fIVto?=
 =?us-ascii?Q?OtPUFIELufX+L4kgluBoTsEonQf6ipMcWNmi86/LQaQmVv4RqREZ4cw/N2Ac?=
 =?us-ascii?Q?c+t8Xaf2v5VWcie39T/AuxG4wMk/mUM2drkaz6FEdtQxtVIhbUcZHz0Te8x9?=
 =?us-ascii?Q?CnkDlf583lad+GjpY9HtyYaNgqTbGUmcepmN2cuYFnIMEH3Wm429HOCfUzV8?=
 =?us-ascii?Q?HvcztLftmYhSY0RTQ79vmr8ofZ179VgzqQOuhzoifdu6c6yScmdJbaqHr9VS?=
 =?us-ascii?Q?kg4GUSs/mjZaMHeKlq8gV2EARLkh+q/WvMgwOHFyul5ZehLhGw2o2p9PeIik?=
 =?us-ascii?Q?QOuVTRdQZHptV0wz5hJxS/sN3UMthwC+GNUGBP1oEny5ZfEhBxlxnWcOyyRX?=
 =?us-ascii?Q?RyqoUlm6GO9paYBVrKHsMuwrAhACCXDFv9VWqk+Q81FxlWVYy0RhAtaPPFHH?=
 =?us-ascii?Q?HHC4Rn0Pj0I5OR1+DIOmAP7IquyVebo05hjy1qQZktBwQA+rbxtWbPfsTLtk?=
 =?us-ascii?Q?sb60dug6fsjT04JztJKBqBu05/vw3Fl3qy8mP9byf5KR1J/POT4O1bVmPfJe?=
 =?us-ascii?Q?VCT9V/Ri75X+RJCIxV3rQG+KUrb07gm93Ocvc5Cl5L0roVN1D8sErmW9g0yd?=
 =?us-ascii?Q?IRdB/a2+41MimJCtYlY3Pqr2nXAFxETv5VoyyT88zKp/lvcsg0El2MtiXHyB?=
 =?us-ascii?Q?/QeXFkwfTBnFD2PR79E2FNUKalrczXIJYj86Dxr+8zMennY+TvsiKX8mM2Of?=
 =?us-ascii?Q?sG8o4IZZ1Y1XX6xMelLZjpUAfHHkBQc9XMER6NCdog+U0AkvouQ9Ab30cKR9?=
 =?us-ascii?Q?UQwOttpOtnHOE7LaYwt5SE+enPcIUpbKwbBkNCaOxxBxJIsC2YzeWB+mvpOG?=
 =?us-ascii?Q?GWpmaNiDxtkUGXRcRoXGsrB3ceSdEe2qkHuTY5y1hu6V0jspr1xT8E0tF/AQ?=
 =?us-ascii?Q?pokvaLlozWnQ7Q/iBZq8k1kUicg/A337dKIWaX/zfwFpu+WqmZo1t53FbeSA?=
 =?us-ascii?Q?IE0OvQFBvJQt86sLcvJoP6kptROhLa4VKu3l3XoJ51ym/Yx35/F5vd+GNpbO?=
 =?us-ascii?Q?z7gqCpGUSuTCosSpNh9G0pg8rAESCLlbJMUpbnuJHp02cbbC5FhImECKRJRL?=
 =?us-ascii?Q?axtIfo3GZPQzfUqi8hDxz0tzILXQrG4GqyHXug8nd3m8BVD4NpoiSVtzxTms?=
 =?us-ascii?Q?MW0PFc1bgO/ek7djWavpHputRioibQTAN3yxYOvPVJcsBcZWEPY2lEWS5J2o?=
 =?us-ascii?Q?s4sRrIAFqVoh9ri9X4ibMBIrPYlg8K5r1lGOy/udTtmOuHF0DrWMMRfsDfsW?=
 =?us-ascii?Q?bFF+5LuhupVc5VFe2en8BX32zRg0FbHf4YqGCsv05vs62Bu7bn0wdBNzkzwB?=
 =?us-ascii?Q?giQ4YE4bHB0cY1NF4lqpLMnxP3cX0FgT6gxoSGi4YWIaKloEZf6wCesYb2nK?=
 =?us-ascii?Q?2T3nAiNgRm+2AXwR8yS0G/eIR+sK324K4VgKVRWOORQZEKdTnFvDNrcHnYEr?=
 =?us-ascii?Q?FwG2FqM0G9oHR8eH7so8E66Vam+4xEdUfNjpWI71vwDCj274JZnL9Q2DpbYF?=
 =?us-ascii?Q?2toxV3t30Oz6TJawdr0nk0Z7T0R3iqNMwFVQ/I8gqGLyKeptHCH8LlZWPVHj?=
 =?us-ascii?Q?1aDObMrOf1p635ZJfSkbs74=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e953801-3f80-451f-ebc8-08dd5679c873
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:25:21.3765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Hm9qHvRi/wN2unpAFgOZxYHB/gVPQTSY+ZsWr0CRvB+qWkZ5IZZ2yTLTLA715MVgd6AZH8rDsRMkloaSY1TI+4l6VCySqhEDhBENWjmXhSJi5LCbBAlfM7aE8AQ58Fl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

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

 .../bindings/media/renesas,rzg2l-csi2.yaml    | 60 ++++++++++++++-----
 1 file changed, 45 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 7faa12fecd5b..784ba88c9b8f 100644
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
@@ -48,7 +58,8 @@ properties:
   resets:
     items:
       - description: CRU_PRESETN reset terminal
-      - description: CRU_CMN_RSTB reset terminal
+      - description:
+          CRU_CMN_RSTB reset terminal (all but RZ/V2H(P)) or D-PHY reset (RZ/V2H(P))
 
   reset-names:
     items:
@@ -101,6 +112,25 @@ required:
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


