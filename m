Return-Path: <linux-media+bounces-27061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4FFA4648C
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B22AD7A6B57
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94880227EA1;
	Wed, 26 Feb 2025 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AgjAx2n2"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14E3227E8C;
	Wed, 26 Feb 2025 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583532; cv=fail; b=Sbg0gFfOWOhdFL68nJiVe8WX3VdkyJ7YGyxepMWWoziTsZaOpCUPFjT4KDenAZ2T9X4eMGFNEU2roGUzourH9rhn9kwAGzJ0tBIRmCNq/OPA0/jsLZklSqAGHilHUOkthKEDP7rinUQ62xMvvSwV+w9DcyLWlmcuB2PPqPzHWxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583532; c=relaxed/simple;
	bh=PZtVuZgD0emfI/MeiU7kj8XJcg/h1dCcpCgIwdrV4ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nHAwyttx2I5EUWfuy8Z0u2XUrv+E2Ea7H0+Q0oVLcS2L+xLdwaxT18iim1AQlP/ndo1+R1+XI9Or0PPwbBvibXplyWTs2AaYPIVnlmgUuq1c0Pt2oXXzkMvjeQOhtZAm2gWI2pkyVxsnx6fVQ9/KjY1Wa/bQFlVCT/WBQM28jVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AgjAx2n2; arc=fail smtp.client-ip=52.101.229.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t2aFkVGXK+YA0v1Vam0q5zbWwqe2ZjjaT4OXxbDuLHTPlw4R0Fa1TZdKu7/btSapoETlCXf3Z0z2ePSBUzsxuNatAgUYz/NMhDUBWMwsEqcSBzFpvceHs4AlaIIEvVodK0Bh4so6aHbCkxrwypilxZalmXCUGRIFQRC1XpFqZYI97F3BTo8tnQNZZXirjuN6PNdQlvljUBm/nlmQ43u1NGFECpBrFfeG7RpLywdE0pjVWA/CrE+XBfMfBSYCVp/ZD97vSSpprDqrDAVV39AtS9iXNHOfWer7Smk5/h9TmsaUYjR57t+ZmHQnr3hzlaU8IExe33U6/Sch06w2ulu0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csEGu3K8RSPvn/cNhtYuZmSgd2SAWhqhRDaSl2VQfJA=;
 b=aT4PkEjiiIcqvgpQ2Z89Q1Vd5hZE0VI2rqUg1ZMweIVzwAZcE0mkvS/8m4qcDXmRD7TPi6bWVaBlSB5L6hzxhfeyQgo+2fBc82UiMhT2BZ+eqFoCEGfcGuYOyiGRqU9BmzMP9liLGKGLNV6VfmMWlEFq2WQ0TO2CQrYaGzMT3THmhRPZQKb+7JwaKxYuwwo1tk5DwC3CFV9hD7g3QVr+MSFOKxf2GYo+vmA1ZUeqj9JeRX22qwTNxYhpJPcF6K1J3NZMF/QiKzB3ITEsnoSBTGD6v0pEWDarXVohmL6+4MCNCsVMCxOv1ni/7cEVhIBJtjujHyrBQ86YOwzpzKNHBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csEGu3K8RSPvn/cNhtYuZmSgd2SAWhqhRDaSl2VQfJA=;
 b=AgjAx2n2WpT9d7+12b2GdEDI0C1T6Ghp63+A1b4aHyt0t3CJhD2IMPmvaSPTFQVGiyICo5uoawa/F2Qrh2/JLqPiSqQp6EE478O5ecu43wE1lB2WuDPGo27U1K8rQUfypxJC/Y0hvXF49W/PDuUPrrCAg/pjMu+GAApwCiiJRWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:25:27 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:25:27 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/17] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2 block
Date: Wed, 26 Feb 2025 16:23:26 +0100
Message-ID: <20250226152418.1132337-3-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 84b08753-74cf-46a2-d90e-08dd5679cc2c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z0ROyQxOEcUbSHNyAgnIBAXKF1sot4Fjoy+zARqqgL9DVWp/Kmw4r0/EQjPH?=
 =?us-ascii?Q?obLs0EKtlzBPBpAfVpuSAaepAsr9ZWztQFgUYebDViu7m2TWWzGG9FMC/HiL?=
 =?us-ascii?Q?uhDDVgHVTAWkscC1wxGWsDRa2/JUa/PqIlfw799oePRraRypXLJ3YIkutIgq?=
 =?us-ascii?Q?+0AmckF5vcCKWaHKKRzHez2i9XY5UI6v4PVyw77EWFGTql9Y9YGMtY57lXIv?=
 =?us-ascii?Q?ngHaz+mWphCrVyLu04CRsMoExPZhLXBu17foVJJrg/mM1Ll5WqEGPNR/h9/a?=
 =?us-ascii?Q?RODxMWbhzPOLN3Z/eLoOrE9Pn/HH+2ro/fx58lX/UPvE7BnkgXGXVx5dla/9?=
 =?us-ascii?Q?QvNC0KbIjJUNhYDrPWjgWmD18yIesmWlfrL5YH5OjNrn3M+2DFE8zpEHFAjd?=
 =?us-ascii?Q?o+Qe8RjdOU/no4UjjXU2GK4BKdSNQI+d22s1HEljsNAqDMKnVAP1eERNjx8N?=
 =?us-ascii?Q?ShwaNTMaCZjSXzn8FDWgROyYFycVNhLbz+/iQTzPUwjpRnNbULH2OCCchoXl?=
 =?us-ascii?Q?zm7LtwF49Ivrb2CDKfYtPep67XFS5/Qkb+fXSWr+/nxeLBkOdMFt1w5CbnY3?=
 =?us-ascii?Q?7r5BU4+Z/0oxyzFFQFSsTsC6brTfn0FnL7oBT0q0ivdLnSXNLLNd/mDdZC/Z?=
 =?us-ascii?Q?bCW8nYX25glJMWRPQdI2e4MdEC+zDXqDyXfbLMTS9U7TbDrLBoIO5sVx7uid?=
 =?us-ascii?Q?cMVS8r3x1nMlWk1VZvreaBM0Fer6mBadX8AsRcfQkYXvD0yW3SaftLqh+9Tv?=
 =?us-ascii?Q?TyCC9fhnZKXthzd1GNa1orwzgh9CuKWPeltYPCiVeOFf87tv7QYNEkj8DNGf?=
 =?us-ascii?Q?SzlmmOwv0msx2NRtx/01tliIPkwMMqWoDjp2Ezqv1VAH1+fvV8Kgnbt6Ys40?=
 =?us-ascii?Q?n2hMfm1WcpO54VnmF8lQw8XoM7bBNIVNu1Mp7BNPhwKGvejZ0Z4HRWqc/YcI?=
 =?us-ascii?Q?eptEV54sxM+Nlixi/O/C2azRWEf1DRcQXAS5kDkN5HocH60BRo5kQ/tmIiIC?=
 =?us-ascii?Q?fievkxntl1NRCQ7kKHgtTEKYHoWvVSlk6kvmVTw3u+MiiLQE0fB7qYW8yph8?=
 =?us-ascii?Q?ko4lduhDOQ90FwMjwHsCf5DQM2qaRXjVkVgZzKTJCyfrmzVLjhQPDVs2QATN?=
 =?us-ascii?Q?6QZI923NTKmT4hvpSMNH1nzfajbmXKq48E+ZI+sKJrYoj79AWcFKzVWe/11g?=
 =?us-ascii?Q?y+rmFFHFCDgCyhRprCJg4eeZiqQwHigX3XW5fZmyUmsjAQ7KbFALJKpKEF6t?=
 =?us-ascii?Q?5zBVn0SNcFLGo/t0SeY3XLnXH/dgJ/Uba3lhkdW4lSRGbuk78WqtYK2+PxhN?=
 =?us-ascii?Q?zy27O3RPTEPpAboEXK2t5H39vo9aT06+cxCxCjgu26S/Wyo1FD9q4pr5Xgl1?=
 =?us-ascii?Q?j/L1tOAViCoAACkeey7dBo75blmPSSlQPE2FeHseEd9VUcZf2T3fciBTqSDG?=
 =?us-ascii?Q?JrBqSvXXA6cB4sXdR3m5M0NhL7QXKkXT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?In8H+4J0m6HYbwMIQdVBtVv93fESOkn7H0Z68VCVxbg9MxzwNRleCdNItZg3?=
 =?us-ascii?Q?6NBiy/VCk0cTYEQaSKk3PIgrP7O4ZJmlpI4OHsC2kAI8eWWeBxcq1BcVGYUh?=
 =?us-ascii?Q?XCBzTEqAVEvoZEyP+oZIPoM9h8tgw7tZ/9paYgyIb1z0JxyAjTeuzE4UCzZg?=
 =?us-ascii?Q?l4yJXLwvYccgE8gN1XIYc2LiIcMLCzDxSSU8nV9vn60e218d0SJTv9O0cG1O?=
 =?us-ascii?Q?jHGYU4LhQNu62j3j5+/mVz74WtZplySd46CGvwBvhLqLm0DfbmavqvAbRTAD?=
 =?us-ascii?Q?tiiMs1X02iiVvl6u+NPJTXl84gb3ngwlWI7CF37GlNeZiCiiwK9TS/ruK3QU?=
 =?us-ascii?Q?K+N3hkXnzq24TxIKp42B0mXZhING3FeSqaYgcsWNEebZEgt4Q3e1MJ8Gv56k?=
 =?us-ascii?Q?+QIoVmavgJ7DtNG8VKszWPbxaD76WE8TjIWGllhcYJgARJ1ARawwpnZ/cQ+O?=
 =?us-ascii?Q?Mr/YmyU3RSEeBii07PKlN0poKAY9v794K40DNcliKOfRrzEsjf8v9DosATGA?=
 =?us-ascii?Q?L1msKIAlsJvYIje48gHrHjqrnnvXGGzWckf5lelvLS0/YUw8m8AEGfLXBis4?=
 =?us-ascii?Q?SwRcQyKfU1RdcYyNEauHyCIaTHH6cqbR9CrJoaQiOKXPQ+lgb3U1d9Ao6uC4?=
 =?us-ascii?Q?Tao8/6GzFXoNF20N71d1F/YhaIM4OmrMcOREbvLrl2HrnkNW+/eAboGmHjpq?=
 =?us-ascii?Q?CaESXBfIGYN1FeM2Wx9wIz4m5m+Ot9B+4lIHDPJx0ZM/eKZVBilRGi3qfMTf?=
 =?us-ascii?Q?Nu2uTOwzT5VMRrca/7bP7Y2pAs2yzGXV3FmJqBh15ELIDxpaEH+mk5eFnjpi?=
 =?us-ascii?Q?XVzQv2ec1s6G8aTu0Y0OBjYSe44AFEBCAaAInGndSFDperO1sfQiBySjdyKU?=
 =?us-ascii?Q?ZHtefc1Oaqip5WgLrOj4T6yxKfxQkcWLdtByK+AUp/KuRqLBKFUE7b3/z/D/?=
 =?us-ascii?Q?PpGx/eBGyitmrl2GvREppfxek4uho3LeJvc/1vpLMdmz2lWBl3SmKXLWRULz?=
 =?us-ascii?Q?Iykz2fqOQJDCB3g7gQQ3FwIBJqAXTImt8l5GUKuOabLBRAnS79StXGK6eqfl?=
 =?us-ascii?Q?oT/ut2PcEaGyS1AdAjK0DivgEOlfySktWCYwsU/ZVvoEDED13LQWnzpRuB+j?=
 =?us-ascii?Q?8f5XndJTPbeY/2cR5Bh3o2ONKAsw2WDjQpsvyEDhmRFxE8ZxWnDO6lrevlpo?=
 =?us-ascii?Q?/XjUO8R2CQ5LJAVCtx/f1/1Z04pfMGP3TKtV133nH4TZIFG8dlZLM3Jdwwt+?=
 =?us-ascii?Q?Hx7wxmQhP4g6qjgaWMpJ3WUqNfKAzqr6BEVgFHn+Qujs8JCymzPUkLw5inqR?=
 =?us-ascii?Q?V+lisc9EPSMoqOoGl66ZZy/Y999yPxwlvfKacpqNh1pbAc27Nr4oGFLHt26s?=
 =?us-ascii?Q?5QVC+okUpEzj56OQA3pZT/BEqTM3dfHnG9x2kn2N0DxCS9hxhTu4xbkMZy6F?=
 =?us-ascii?Q?j6TeHZWbz2cmsfHNoqRd+U6JCENa1RMnpOcqNMNq1FZEvozmTCZYUxW61XQM?=
 =?us-ascii?Q?B5ltbvuhxVTXuKQN51VRCfuRtJbMgZlSipQkcuSXPHrXrh1948rAHHGOwToT?=
 =?us-ascii?Q?nL87+j/Z2M26VPtvS50lIb4cFRFmXNbmrZeHpsCHmq9T6loJhAfFzV5Uht98?=
 =?us-ascii?Q?aSXhxnXbwrk/pW6YKejuEX4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b08753-74cf-46a2-d90e-08dd5679cc2c
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:25:27.3903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bED4QPfndob/uw2LlJn1ObaSbl2xvbj1PbeHNxEUNrvl/b+Z9WHpLPf4CnEIkujxursLvxJZCMHwvkHH0A0QfApAVzUG4a2UjCu8y4CgYPq2Pvatxzl5GF2wmtP6l7Js
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

Document the CSI-2 block which is part of CRU found in Renesas RZ/G3E
SoC.

The CSI-2 block on the RZ/G3E SoC is identical to one found on the
RZ/V2H(P) SoC.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Fixed CRU_CMN_RSTB as suggested by LPinchart
 - Collected tags.

 .../devicetree/bindings/media/renesas,rzg2l-csi2.yaml      | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 784ba88c9b8f..02297509a48e 100644
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
@@ -59,8 +62,8 @@ properties:
     items:
       - description: CRU_PRESETN reset terminal
       - description:
-          CRU_CMN_RSTB reset terminal (all but RZ/V2H(P)) or D-PHY reset (RZ/V2H(P))
-
+          CRU_CMN_RSTB reset terminal (except for RZ/V2H(P) and RZ/G3E) or
+          D-PHY reset (for RZ/V2H(P) and RZ/G3E).
   reset-names:
     items:
       - const: presetn
-- 
2.43.0


