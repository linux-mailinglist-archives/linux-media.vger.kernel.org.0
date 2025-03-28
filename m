Return-Path: <linux-media+bounces-28937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7829A74F48
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A79B17349F
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1161DEFCD;
	Fri, 28 Mar 2025 17:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SV1YPa9n"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528D41DE3B3;
	Fri, 28 Mar 2025 17:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183074; cv=fail; b=KJ2mqktjnogSWCIlE4lc7OpfBLuP3DJn+acm5hyb2Il0/boQNOS5N6sVT7s41LwIllz4os+z9vxFpRV4BNN33L73TXLGHpR+dufWeAU9+zTPeHBPimlaxcxjEp32TjgS+8SzwpCK2EgO1lv0vpCN+G7H038HVYqIIBOn4Xk8PoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183074; c=relaxed/simple;
	bh=WB0gky+PvyKTq9GLo3NZzCeLeTxen0u7m3GVboV+bxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VW8QYRk/QieY+kwpBw4qFb+hf6PLXrfwJl8ISW4GzwpoOc/M91OJznD4pwO2/Q5hOOeNkZNqPLnvzQtUJC9oF5JldM+9WnobBpwekvmjvigLJ2Zc9eNGiIr3j74JoOhX/hNuJCLf7PxtPjNSG0OL6xPsH9joVNUDNO/qP+7L/cA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SV1YPa9n; arc=fail smtp.client-ip=52.101.125.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifTxXoxnRJEQgPaRh7/U38QZYhiIcg/ccjBYQvBszPH4V7wt6yU2E5OpOoxyIB88sV8TCAf9aTAwkq51WNl312IGdighDY1lTDKl1HNPqeeUom73vOgyZVrvix+x4/n28qde9czyxPMucuIEVv78kDIlBP2++D5geXAJdJcxy4aGOypaEpDv5AI5L875XzejBXYD32+NTMNeOJd7xKvftuD3/kDsqxr5KQ+d7OrrWzoew8x5b+MfZAkH0dG8wi6ROKkZOX6svj3Io4pIDi0UN0ovlj2pliWvOVo62Bb9S/4NyD7AdNAx9OSosAAIGguddFvxbhaNTfPvdR2ELggIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aYkYpLNwH4DvxRbvPmdoz+LCX596HB0t9+usGAwlmI=;
 b=X3HfzxqqXguFTzUuzCX1Be9NRCD/a0JyAERMQr5RERFVG1eSPtzVwrvYO/05T219XtG2iJ8Qp0VS/thTMhtlk90bxJZAghhGZP8cZeS04/MVWgV78UBbZgqrQ5Kzycm8ITmrqCDGpdnMYkc+5PJ02BH2AAMViqPeAb87fWv8l56KvboKCaSNo+5oET27JsWIF5iwcYuOidPZv8LK8qzSCSrg2+Lh0v3kS+8Nr4rmyl8NiLNouVcbTm8mcXPMCMeY1/pDky9H+N8D37VckYQjeJE8XyRJgMIYy1zqa0uxB9/Mvyhdi3VJUzGBGXlJypdwONLWx2Dos31gi8bmYTnLdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aYkYpLNwH4DvxRbvPmdoz+LCX596HB0t9+usGAwlmI=;
 b=SV1YPa9nfHtY13yLGLqJ30QwfRAa0t0h0P+Nf3A0mcaNusF3EgZ78CT0Ynzqh/YjFuMV1L+cCknPxizAWvSh6F985L+d/JhCydH18zVSp7Lv1UcaDpv3Gt9v1cdrQEuGO1k2gRSXA7X1sHf7unohkBQerQDlKeJf3X/ro45Tbro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:31:11 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:31:11 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/17] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2 block
Date: Fri, 28 Mar 2025 18:29:38 +0100
Message-ID: <20250328173032.423322-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b40037f-2a58-4fab-da31-08dd6e1e54e3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nVs2k7gXBKhT5/25gbWHYWj1DJNTh53bmmLkiL5MkDEmD9tDYHcB+mUlXWoy?=
 =?us-ascii?Q?WA4uoL989ED/wT5utVLXqXoSYzG1yYlS28FHSX3rfexYAMbRwjHqGBlb9igZ?=
 =?us-ascii?Q?NIbTMZ+J1GKbWOVJvtd27lFBNqRT7bNANCY5OE5hlgKTdbsuslB374jFKgQg?=
 =?us-ascii?Q?sTKH22XYCFlU0aMzFT9FGMGflQpwgLnpRcWkvCAhZz+dk4OGc48w+os8w3LS?=
 =?us-ascii?Q?nDuQI+0CjzEHEcZ0dARogtQe9tqWbaRfIZFbgmrnlR970DKf0eIs9uuGvj80?=
 =?us-ascii?Q?7y2ZKJo/C+4duMB2NeTc8VgoF2xkD2+VBJ7keGvs7ETGAyn7WijmwJYEbsp2?=
 =?us-ascii?Q?pn58ZEVjebCZlpPZtiBDOomxm+je8nmhhqZg2T/5y74x4w9HPTWel9qhFsMq?=
 =?us-ascii?Q?qzH/cUWM/D2MfLb+1WfvGfI7r7Uf459l++f3jVT+N58E4U1fip+sdftQajkO?=
 =?us-ascii?Q?IMuk0uryhla+MBzMzj5M5vDPqsiLZgHWjPNPSPQkK6PvfvVUK9TCFfXjk6ZD?=
 =?us-ascii?Q?5bpaSvl3Tl9l0r3tgAMqSaVQRdyWIPJ7oL5tjOO3XzRR6Eg5vJ05rHwHxHAu?=
 =?us-ascii?Q?J6O6A/CJil14fWtUftZE33dYcsk4zgxK2G/rjJjEB9MwTWgJ4PPxWRNnRbhB?=
 =?us-ascii?Q?7hgJYRu2jFhiY49diGEzyQhKF2sgWQvWE561sE1xD0cb70oXhKVSDi5aG+9L?=
 =?us-ascii?Q?w/1N/UXTGTRpymmk45G1RcRZF4X6L7Sm+sCC2ywx2VWBPM4SqOZ4HKdrjj3M?=
 =?us-ascii?Q?eOM0DBjg7DSEm5gvtfGPwIpzdYR1Cd07LNpqs0P1YDnEi36Ififx/N/43eSO?=
 =?us-ascii?Q?kYdW9GoaCZi+G5uELPJ/PGF1JoSl+3Z79li+01XADYicpzT+QYkNAgRIofnY?=
 =?us-ascii?Q?n+Evc67qAKJyL2ev503nkxtR+0nmPEoRGpDHg/c6KHAKoqip4IYavFb5qz7A?=
 =?us-ascii?Q?8UqC4KFO/95jzi0TU+YayU1OmFCrCdpIF2/QQGfFpwMVWtp7CBAOefxyntM2?=
 =?us-ascii?Q?kFB+pzZHRLpyTrRiUjTr/HqYkSogsVf4Uo+vYMZwjYUK+0+ZWOJc/xk1jk8W?=
 =?us-ascii?Q?M6KCyGdXOeDyg9eRuc5G30zMCinMrq/LmikwtkCQ2AYRoGQaIarEok2u3E+V?=
 =?us-ascii?Q?UMwWxOjqb0XeRdK4xcbitMA5j4/YLucLf9QGXO39RNwV9lvelOUP7CyWIKn8?=
 =?us-ascii?Q?j7VWPuwpjq5qdcTRQ44rUi74OyeV83E68mlWpXWlBiGE1ROG3uXN/xdWdxFm?=
 =?us-ascii?Q?q4RGF1UN64Z09xsmExqGnhNtINKze16TGUUpg2iJDOorYyMBhSEMRgtQ+OWg?=
 =?us-ascii?Q?mEsVnEIUP9Tr17POheBvvCJZyoM0PG3QfZDobeZU51NfGk2z1ToCquN6SnfY?=
 =?us-ascii?Q?W9VuV7kfuZw/DxTkEE5OHrpOMlhQvUrlm3CLuzx8+Nh8zI8oER+bi2yBcoIs?=
 =?us-ascii?Q?IKjnZPrWbJBinXUFEchZ9dCV3YYQfgtlH9tasxXoDzzjeQ/1c/WZOw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jwaU0U0ql6mOHqD+SyL0G+V0u288CoSsC8VH/p8CylnmPDz9OMiZszLXc2Kn?=
 =?us-ascii?Q?AET5QSCdKESnCv6JwygshPalODgl6jrTNYdEi0TOAEeH1qJelKdK4do3rmRk?=
 =?us-ascii?Q?vWXM7wLWRK5u277lxCiZ2F5twjhltgWUQjc/5NGofp4DBlY1BCdhK3C2riK6?=
 =?us-ascii?Q?Nv+PzKlN0/Dd+ebE+Aicqhl+5QTZjzUPXCIcuEUUOqqkzApeKsP5unptCb9d?=
 =?us-ascii?Q?szuUcuP77mnCE2ijkOWzqQbkWJJCeCiEbldGgiIuGlhVzerwo00g+H/zfrGL?=
 =?us-ascii?Q?dKJT4ZHEcNUgBnIDnTGgSz82XQkYsENXACn6J1k5U36YuKPy4cDx2srwlwnw?=
 =?us-ascii?Q?XA4sNm9oE5gNNjnlhD5HYkWL1dOHG5bxmnpYiP3E3j20n6Hz/ERitm7jY5IW?=
 =?us-ascii?Q?Ib3pv64vssmAN1XGV5FbxOnER2invfpi9Yrx65Y5KSDGeoVvSyGGngXnQqrD?=
 =?us-ascii?Q?od/6GG/pecnZibibGIwCpu6oPkbYj7zKsASsGDEv/jjSVjPkh1ws0uvF8mXM?=
 =?us-ascii?Q?Lhy9vA43pOnvXV0Bfzlcxee03cExlSnJOTzyqjtafQVhHL7surt0PGkj1xua?=
 =?us-ascii?Q?YCgI23IDy02eNKM599YgQ+7BG0MEyg8ilaieRqXBX3+nQvyVUoMTqKxwpka3?=
 =?us-ascii?Q?5r7OC3+N+j8eDrOy6hUaniXr05TZvpi+QrdJC53nXRnkhxWJg9IqOHVrO7te?=
 =?us-ascii?Q?ZOtUNmHBmUR3VUVyDjUnAOO2sQCjqTeFnG5FhESI0VIKkSbxC+1OtVUT60gs?=
 =?us-ascii?Q?f6e51CBu3BqgTqFZC13GimBWGZLMg9nHCGgC3m7Y/ikorzsf7u3mKYj55CSJ?=
 =?us-ascii?Q?yBV5SDq9Zqdc3lKFpQY1qjszRX9AyWwSKkbZwL9bskdDDdE2HH9jtRiDwVyQ?=
 =?us-ascii?Q?SkNSQKPyuKxbI92QXX1rSRvWX68hudE6CqCae6a3RvkhtVoV4x18odhcWQ0h?=
 =?us-ascii?Q?1jP7CxQcv4dJTEpY86ueKqWUCUcOaCQ1ZxK352d3kCOO/MLsSWqCTNJCzcJQ?=
 =?us-ascii?Q?o31YixTBXvU6sYUDVFG0+lix1Pa4dJpgXFTWQM3VP37M2m8nwKjjW3fjiEZT?=
 =?us-ascii?Q?tqgXSr56amgPuj3yu/LMuzus8qryL1rJ5d1s2hjpOxEGAsi/Cpweuv8nzGrB?=
 =?us-ascii?Q?ICs+tIVV8Lac0Za2n9f6BP+ZZwggd016hk/cDzmjjBMd4qeUR4J3N/SFy1ZN?=
 =?us-ascii?Q?4NmvkdiWY/ppQPyNfKH0o9wfhVyNr8hom+YOAR3NUM8FgukwRuKi5OAudFEp?=
 =?us-ascii?Q?IH3H6+hXXPOB3bhUU8H63ASCnJo8xCImGGEArx7YhOMIuKc6tDJbJVX+XDrC?=
 =?us-ascii?Q?WKhQfKvAZRw/Sxbs3aS6eEI3yufTlY6U8L/v4nMFRchGiXmp1HlSRo4p0Pv/?=
 =?us-ascii?Q?e3FptFsHBA1cyJPFKpbsNKxduJOeDnnMAvN5psqXtoBIm+dpoqAcCNmWrgky?=
 =?us-ascii?Q?bamAesRI1akdU3tkp7krca4YHRYIbu8sQBdy78pslEQepMYGi68BUnufC34U?=
 =?us-ascii?Q?kLJ0q4fvrK5kQrIcyZVSTlSaDFNSWmUHBwmQZOD5HhQtQb3UnRllEPllqrRy?=
 =?us-ascii?Q?OxibD7KZduViow4DAA6pbbhcKpZDgHND7CcbOLrDL8LRSSO7wuiRMUuPDluy?=
 =?us-ascii?Q?HicPghYABquDErftaCRf98w=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b40037f-2a58-4fab-da31-08dd6e1e54e3
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:31:11.2398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHqgfkJ1GFksUivTg0LGWXheo5xMfwSjAIkGsZ0PqePO2zvdPr9qjFGV7axhe9+oPn+5tdYBtuK5RRCeeUysmzzZPa+VZjIWuiQrF+Vw0NnrY0Tr+5PRU6pv25cO0YUm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

Document the CSI-2 block which is part of CRU found in Renesas RZ/G3E
SoC.

The CSI-2 block on the RZ/G3E SoC is identical to one found on the
RZ/V2H(P) SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Fixed CRU_CMN_RSTB as suggested by LPinchart
 - Collected tags.

Changes since v3:
 - Collected tag.

 .../devicetree/bindings/media/renesas,rzg2l-csi2.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 1f9ee37584b34..c5c511c9f0db2 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
@@ -24,6 +24,9 @@ properties:
               - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
               - renesas,r9a07g054-csi2 # RZ/V2L
           - const: renesas,rzg2l-csi2
+      - items:
+          - const: renesas,r9a09g047-csi2 # RZ/G3E
+          - const: renesas,r9a09g057-csi2
       - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
 
   reg:
-- 
2.43.0


