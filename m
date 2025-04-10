Return-Path: <linux-media+bounces-29887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5094A83C5C
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7FF91B66EC6
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E8020B801;
	Thu, 10 Apr 2025 08:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qi2Tkq9w"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C791E833F;
	Thu, 10 Apr 2025 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272886; cv=fail; b=LscXkFX1hXKU7jeqmIHiEXJ9WWgLq65CfuZA7uKXiILwBxncQP1OxoKIGQDgW7CyxABtrXPU7yXD5ata0XkAAavr/sOuvB5c2ikZFtfhs0sIlif+W9JrZ5svgriKNarmki02z9pFsLAeOi68yihPFM/Z9QVoE09Grc4Yzczvd+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272886; c=relaxed/simple;
	bh=WsTe5yqKNpbZhONBV9fetn5jZK327veD/arzfRgY/bU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=grvLe1vDIwKRq+D3SYHd+c+bveCvkrzmfBsRH/WWGLR/lHFq9v/xPJaZr/mfGJrVCrl68kSalXc8ttNx39k/9BSNysNI2zvkmM61iJgr4OCT+n8ABLQ1Wq0TLCzCujFFXE5NL8a0wiSDu2MoHgfuFTpgM61d8j9AkRI31WjwzXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qi2Tkq9w; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ktm0fDx89fL8rmj4Gy0Oj3nu/vJBEjn1TLIvMmAGyhgcDaq1MueORHNqR+U4NIHQa9wiJolYfnFPFVsjU0j/A+6kQX22IObcH+NNYQgEMTF00EFYgFkmIOQgYjgPfLUOoI53Lq04Q+ExtY8H/FdU2kfx2nlDR7pZ9NBOCKSuWEjxifwr8eIA5Rm+bNb5J7JR/mXjxQSGqPCV4j8FKPqR/nZ97/U3xMTudLtW5r5VX1WEfmy87wvwxvTFdsOAHg0nxngy+bi+Tc/7TNLNHlY+GATOR9ueauGjXxxxKRgUG3AJjnIB2ghDKhZadwV0njqecuYJv4qwcdbs5tcrRdn4nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JU2z6a883QLXEjVLggf/IXa/tCrpPjFJYi5Tqfv177o=;
 b=cr7cIUMLq+rmqWkS8KPIUROrZZDbmyVTW3PydyViHFULpH7m3bEAos2MiH4VxSuyBJpo6HFmPddlbQQ+zZ+7p0hHANRPD4oxgzQO4J+THqkAK901FtWHV0KcmFHm4bUlScB5XbmgOXMvtba2H/7c6bNLzFHzudB9Sj1pAAguYnFkVYSc+yg/o7Nn3id6on8MpjLhefnBydDJ3PSXuq1lClWDiI+xpcIhWF7k1Im0cRuSmtvfeVEgek1Xulp2NRK4i1MZpXrtpIlzgazJHKMlgxwrkr3GIXE4b2Kx2s2SHYDbrW4mscrkKH49oB81VtoYcOhPofKkUThbugUa2+QkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JU2z6a883QLXEjVLggf/IXa/tCrpPjFJYi5Tqfv177o=;
 b=qi2Tkq9wfVn8QGmmvWhb0bL/wIJE+M8evJL/4oVR6FFU6/UJgyoXFVSIGlZp3ZgpCIpiAUvMhIKK00+xNn9g/C9J8EpfvqQb6Aan1qV20KAm6G4CMl802DXjw6525lW53wHpJpXix2iSV6jFviCITND3qHow+SoCs48/JRj2fpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB5660.jpnprd01.prod.outlook.com (2603:1096:404:8059::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 08:14:38 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:14:38 +0000
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
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/17] media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC
Date: Thu, 10 Apr 2025 10:12:13 +0200
Message-ID: <20250410081300.3133959-10-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: c4baccb7-0466-4b1d-90a6-08dd7807bc55
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EC3RKBpQazAR3pNKSryI38Qe26FAsIsNqMjBs0Zij9TGV2ny1ZeeTH/hjCn3?=
 =?us-ascii?Q?EeDCyg5IntZ5u6w6xFUZFI0640C1HRbdOw8CI2Ryum4ttRx0LHMk0Vv6h+/4?=
 =?us-ascii?Q?zSy02pvSqfq63noxGQIP8m7GDySFgCXZAVMwvN2qdRwhZDHJf2jk8Gw6KYgk?=
 =?us-ascii?Q?6DhFawpC6ntFas9AVxJaCo753PmKFSeA0uifv5M/ZyF5wdTEQ6fOFeE1eXBf?=
 =?us-ascii?Q?M/PzKhDhSqKncsjh5Xrn58BQNHz1kui/LlZdITc30r+YVE2gogQQbnE080pg?=
 =?us-ascii?Q?Z7yeSfdJ1bXRPU0DlNC8sFnPtGU0VFw2g+NTG/B4VF3YrPgNhtbFg2XGTPrO?=
 =?us-ascii?Q?J2swVy8Qk1Q5nlsivNHPxC6tBrBLcafIe0eTbHFob9MFGleJ+6n5w1PKANVv?=
 =?us-ascii?Q?S1wqXQR2Zz9Np8SFfYxdxq8trm1Z38d/ftr/VTTB6f3rp6xClPJY8lR52z7Q?=
 =?us-ascii?Q?k9vR1KFRAe/E9mqh2i99+ZYzExojYmOivreZg4uddXxpXQ9dpCfQoCOI06Tf?=
 =?us-ascii?Q?A2ZtorlZ+dPlhJOjlcWLrRfG2wMrEOuYDNM8i2nTH41YxB3bln9WLpZT657g?=
 =?us-ascii?Q?lyECZXDSU3mRyxhb/TaUx46ajzRBq/N+h3V+iCbqIrWm1c5Btm8xuc82iE0F?=
 =?us-ascii?Q?mo3FI5mGOK09fFiJpEUbSZGSpwtRw/u/m9Ww7UGImUGTKB2YJJSGAqcP61Si?=
 =?us-ascii?Q?XVTr0GVUJ5UElL0SRte5kbbh2IFzI9DKGzlb5/IG+kpubVcBr2NCEtjyso33?=
 =?us-ascii?Q?w2HnpjU4qTOQSn7wQEHCd1a+C+C17prX4Y0z68hrLKpd9TGy68YUWq1b9pN5?=
 =?us-ascii?Q?w3NVJoWi8N6kQ+5HKoT369rd/3tm5sICgqA/5TKBuHE7VDDnD6qGCSXhmcdT?=
 =?us-ascii?Q?aUsEUhz6FKnp5p0Hk0IZo7QqmKcCaP7jLXDulWRkgiIBl80lEjBgQlr53rg3?=
 =?us-ascii?Q?vmJduQLgHUs3U5QRhdDD2+6DMqBYGYb1t2945qkY74Y6lxEIbcuviADVfTxc?=
 =?us-ascii?Q?NEzWz7PxY7Pd9HSxkbANe07TQ/z1M0mfgUAGhM3ZZVlbARktKE4xiVHotPga?=
 =?us-ascii?Q?R5rJQpGCxs7a+uxWb836PxVAyrdcAQ1xvfSAclXbmeB6kiUj8faWU+zD+Bo9?=
 =?us-ascii?Q?QNjCcLeloIO/3Vijvvh4y3oixh6JGppMy724hMEvxXIuBERQ45I70GA7vi72?=
 =?us-ascii?Q?x2aqw8hp4tn9vpOtVoM7ZTaeygTcdLtViE3TzMUAWTETWmvwfzkV+Cq5Le1o?=
 =?us-ascii?Q?ICryOvOW8XXGqtXIaes/F2nc6BMCHuBPJsgaFSKbO2lOR2QpcdyCTZDmpQQl?=
 =?us-ascii?Q?kqoOt8GjBjQm1Ir97fKYB7b8urEHlIOMAmETXwbcD53gJIFili6ifjAEc0FW?=
 =?us-ascii?Q?B2kkJ4KKEFcGUtnACcrPtTtPhamHQot+4mGorKhzo494S42FR43g2EZWqIZv?=
 =?us-ascii?Q?hKzl5dnFLizYj2TaIixmRre5jx7kH/MAhe1lea/52HxcomAzJUacPQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zI4ZAAKjB8vknH6abaq1fDHXzSP4p+Kj7D8WhwuNuqxn2Cvq3wLX5NDljHOc?=
 =?us-ascii?Q?WRiooMS91Y36V/wdFZnU3aZa05bOFL4Tj50+X44MMFK/iFj1V43Lxs6gxdpk?=
 =?us-ascii?Q?vVkIxX8vNaHkYzkU/OsMPFkdIBQVTniLTYtUdrRTWQJJ+HnqiCatr+SV2YZH?=
 =?us-ascii?Q?pY9DVtt/qG8c7ft6EYViTE827MY021Kv+O4aS/pTYGT9yjwEbrVSoDebGD4E?=
 =?us-ascii?Q?KzGjOXH/0PiYLaKeniiyjkjnKpUB4C2iHpTKG1kzlQj81gePP0I3+y27heFH?=
 =?us-ascii?Q?g+OaoVofExs33WGhzQUXrymsXZwWVISsFKn1eSqZw8bgxufADo6oEee1eGf3?=
 =?us-ascii?Q?x1ZVNx1nbuSDxu6JBOlwQRBVnAtm49Jbi4j/G7W9ci7A0hWfrXwCAh7jb5ss?=
 =?us-ascii?Q?k7FmPH+2SpDwuiJxpt3SC/aP1msjHyuaWj/uQHKK3r/h4+nk83Gch6i/eJcA?=
 =?us-ascii?Q?gz4a0rR8b3UD1ZKLErSkJHt2XRFbgfM1XNBoXFNsFiuh8lbk/QbbsgCxOdF9?=
 =?us-ascii?Q?fjSVujuKHglc9pGlgFQh+tNsczslWgWI5p8pR+2aDLC+e2w7UuqXwNOak00k?=
 =?us-ascii?Q?8TP3nVjmZCSnOKhwMP2LQE4Fn8fV7rbFARIm6SZ4LlxrJIHFTEC888HcxNLs?=
 =?us-ascii?Q?VWv4qllWNNieWBR4Q0geevbIWnyJSnfbku9I7T/7qkTaInYHGocyd6n1gd3K?=
 =?us-ascii?Q?m8/iyBg4M3z1vI/ibW6bQOk0cwQn3UL/B/hoqXCm+3TSkJJw0WbIz4ieQaBt?=
 =?us-ascii?Q?hjoIl+QoNH2KVg4VR+kzOw+QyBRGf/0ord33bvBlsjM7Mnh1weU8TCWsgU7r?=
 =?us-ascii?Q?tggOaEAoYLYninDn2zTVUI8vA/G+7yNLvQOpe/zTpZC4aF0ENdsa10FN3Mpo?=
 =?us-ascii?Q?FX/3yWOS58cg60DDHsywOTyxQtqRGvSS86pAgQNIwMvy42azeVA+kfMPohxa?=
 =?us-ascii?Q?GTf8HFWKGKd8bH/j9/yxnEieRpr2OtVCjwSaOs3QnQesuSDL9d0ZEv192N9m?=
 =?us-ascii?Q?HfoFp95VkMfPBDrI4ejoMrWvc65eggPD7fJCSvpMQW5Tfcn8MhdBpcS3jD0s?=
 =?us-ascii?Q?toKqProsJVkRqky5fUdtSDmSfTfOwAWNm0gLVcC2ao2y+sUAauI6/N4BAH8U?=
 =?us-ascii?Q?H+zg1RJ0XQtFV6BJbUOBFVIPlocAoZiyjazIANWe1TuMXt65hPZ/Nr4qASvw?=
 =?us-ascii?Q?bHXA77iF8P0L4oTUhtVOr2yzgRd5qqks9+JjLSVMHt1Ys93Z/RJNIuMZsCl+?=
 =?us-ascii?Q?pV6nYMiDXkrwzRdZjLEVVqP90norRJun1CblOAJvllKhabo1POOMQigXvCzW?=
 =?us-ascii?Q?m0alcde5lglWqqJ4k5i1X0bpr8VAHk88WDIeoyU1pO1O9ZflTRRDfgCf4oN9?=
 =?us-ascii?Q?fcn1sIuRGWCVwJ+9oISKgldRCjKTIiMqKXNeQB4ryHe0hwh2z8c4mfzoZg7L?=
 =?us-ascii?Q?yKK6jBCs4+S78VTAL9Qr+h+XGaYlDOfx5E4onmiqje1+A5l7u/VWVmG/DmaY?=
 =?us-ascii?Q?zATwHyGDc6KHMM2TsQ2Vve6++/5lz5xKVMePDPBBCn24UNy4YvG+s74BViL0?=
 =?us-ascii?Q?kMgSkA+0tlROkAy2Rim/pDbtk6SBFHPq4spomKoZ3rqk/Vr1kOpmwCpkY6SC?=
 =?us-ascii?Q?uLxrtGyklyX/N5jdoyZKFPw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4baccb7-0466-4b1d-90a6-08dd7807bc55
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:14:37.9865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUXF4BNdsbrLNBcmWoMZdubfz2ukMJKF9+gGgt+vdgqfuWMT4Ztd3wl/clQyQWPJqT6FGzHjpVIXvqbvKowGcPdmO2haIFklMPW9Xt9xk+0rwLzBHMQfbzsYuziRSQ0V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5660

The RZ/V2H(P) SoC does not require a `system` clock for the CSI-2
interface. To accommodate this, introduce a `has_system_clk` bool flag
in the `rzg2l_csi2_info` structure and update the rzg2l_csi2_probe() to
conditionally request the clock only when needed.

This patch is in preparation for adding support for RZ/V2H(P) SoC.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Added has_system_clk bool flag to the rzg2l_csi2_info structure to handle
   case where system clock is not required as suggested by LPinchart.
 - Fixed commit body and msg

Changes since v5:
 - Collected tag

 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c    | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 4aa5d58dde5bd..e4781105eadc0 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -127,6 +127,7 @@ struct rzg2l_csi2 {
 struct rzg2l_csi2_info {
 	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
 	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
+	bool has_system_clk;
 };
 
 struct rzg2l_csi2_timings {
@@ -364,6 +365,7 @@ static int rzg2l_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
 static const struct rzg2l_csi2_info rzg2l_csi2_info = {
 	.dphy_enable = rzg2l_csi2_dphy_enable,
 	.dphy_disable = rzg2l_csi2_dphy_disable,
+	.has_system_clk = true,
 };
 
 static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
@@ -801,10 +803,12 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
 				     "Failed to get cpg presetn\n");
 
-	csi2->sysclk = devm_clk_get(dev, "system");
-	if (IS_ERR(csi2->sysclk))
-		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
-				     "Failed to get system clk\n");
+	if (csi2->info->has_system_clk) {
+		csi2->sysclk = devm_clk_get(dev, "system");
+		if (IS_ERR(csi2->sysclk))
+			return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
+					     "Failed to get system clk\n");
+	}
 
 	csi2->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(csi2->vclk))
-- 
2.43.0


