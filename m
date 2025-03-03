Return-Path: <linux-media+bounces-27384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247AFA4C6AA
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E917D7ABDA6
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E190523645F;
	Mon,  3 Mar 2025 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qZ4rCcwY"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0845A2356AE;
	Mon,  3 Mar 2025 16:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018175; cv=fail; b=aBhDNzXzNA8HxaqK2jBA8Yzbf7aNhcEQpdg29eFMKiMqw+VJeQIj+d5hAjop4P8lHQHssB2G5SMqcEsHq619ax9/5ThMbbkYV0SwPtloXx5XNJcLVdjYFBvvQ0d1JXWV/YpSCnnsCcb9rv42eQyqKZHsQvPRF8GWfpRoVRRydHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018175; c=relaxed/simple;
	bh=cF9wpA8XAhmDShSXhU2RlgzRnvv3u+SXE4OSiXkNLPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qpeMRohbimTBNXojr/tT44Wz45XpVh11miih6QDiV2JvL7KIEb9DTLKp5RxmXI6wm6dT+d3e62fRcng1x3JEbPO9fJ9XCraNxltfgqwiTp59UXmg7DXjurnbm14tGLH4dwhWZUn2Co2ROJOnpv1Ba8PumkhmDrza8VMmMpvh2ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qZ4rCcwY; arc=fail smtp.client-ip=52.101.229.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eu2Ml8cvSG5IhIW8ahox7zqfVvMklBSEsCqmjo4KpjeAq9rxyJrsz4MNiabxOGcXIhfZgb/l82Lgo4DDRdIxAazWDMgFgVsNVRQe1QTMOcyMevjIbPtr/W0Y1Yh7kc9e4O+SNSKErMDowpGFEcpDFnavEPZOoMZ+KqxGfULChL0SojacNRFoW9n24KBfqgxWsuARseTkn6lgnf6VRny4Q/+XXSj7++awOOO2KxrBR7M02+p09kKgO+RMX9E+pa/C73VCpPlQAbQb/k/m0w7f+2ji9O52YbmhtWI3OwF8IxVWiWs/WSz+cE5xdPLSx1yubF9I4idKJLAnpttKnUaYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUdNFuf+p+rt8Ez7EJQNxigIcs88ficfH2BK/x1Kdm8=;
 b=WHp3e/cwH/FB46Bq+jqYu+QIihkF7QSaZY0iY1xMwosBK9CSozsNjXikl1xGR3VVSLpIaNXfnLIu4b0HxgJSa749ZcSJgUT4A7n38X91EOVBy2dDoSFAxOv9qyUjrfHlHTMdIp1cfbZEgCT955XgPcJLe7zptDi7anqvDAc2XKYqeVmsVR2z5eR+/7imvT5ty0wOfCePg4FLPFLK/hYJrH3/bRVS+7xEqh5F8ew5arYFTTYwZB8zF8p9vKd0Gs33XPOa14+hTrKPRvrx4n6s2CzzSt1VN0mzQ2fikivoDExac7cegjsdUxJmINEw6djOh47zN2naLhkmgAjxaVz0ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUdNFuf+p+rt8Ez7EJQNxigIcs88ficfH2BK/x1Kdm8=;
 b=qZ4rCcwYfSJVZSGyjyCQqxJuvAYVSVdXqexo0/u76niJT9U0sErwSgsgEJcXKm/2yrzgH32+5o6o6DwdJekr6BBgnH7QPSbcpfWtaX7EglDq+ggweL8HTHxtEZCLNmBYSO565YdmdBMfgbS8cElv6f2fnQ8cQbWqvPta/6i36ik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:09:31 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:09:31 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/17] media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
Date: Mon,  3 Mar 2025 17:07:43 +0100
Message-ID: <20250303160834.3493507-4-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 340fb3ef-88f1-45b6-9db6-08dd5a6dc7c3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mM3Ewk265BN6IgfG1a9ogVNGpnBZAGQEr+neVFSZDBuJL5Hk6NUHZzgY4B+U?=
 =?us-ascii?Q?3q8yCqQG981Qmzfek+0U1f+fiElr8ZzOuv14jSzDvVBPguqj/ZMJmo68dQfJ?=
 =?us-ascii?Q?blxNxz9FbSO/8daDVpNK9EED+fMjYbBpWxVJbQduO4mgU1+YTVZfGoqhSimu?=
 =?us-ascii?Q?SrLBPZekYq7YAL28Vp3vZ6dRtnIXsXksHX3swWcVMrz1gjRdZRDMZQs261le?=
 =?us-ascii?Q?uEL+hFAbPhbr4H4zGp029RMshJsI8It+VudSEz9XVHtw1rZ1zQOACj/aHMdM?=
 =?us-ascii?Q?P6eUBJSz5p596Ssj+cXPBxVWhcov2yUZkvUA6L3fnxE8DG3qg/Uu6lyl4/HU?=
 =?us-ascii?Q?WZZe+g1yJageQUzdyC9iIOAStNSGjyFgGs9IT/ieH7LX3v89ux/rX2AydZ6g?=
 =?us-ascii?Q?aMtAoho9kn0RD6UY5ofYBVw5q0UB+nvTmD+68kXVQex7neRd9DC356m92QXa?=
 =?us-ascii?Q?kPv6R0Lgl91c1NCO39q/zhX/ynDq8is9UtuBZs8b4gzx4/fbjqPN8RHZNb2N?=
 =?us-ascii?Q?NsLz/ZzFQeF/cYnaFpDMk9bcVvujTHR4PJZA72ACz+C8dTLhOjz9reWlXxou?=
 =?us-ascii?Q?gvCJFi3VzSgfm5gBRio/SRY2DAc/08oburanMm7LBXOaaiJe2VOD2qMrwaKu?=
 =?us-ascii?Q?GM4Q2i5uLWWmjwYccfmUwT8QXrDd5CctEV07tt+iEz0k5mz1nzIa8cw+6Zdr?=
 =?us-ascii?Q?FF+jmnW3AjceDEbLKALcECuAdPVs2EL3Ef5FGaKmnAFaMYscsRssOK59ClJ3?=
 =?us-ascii?Q?GjqsPkO6CWhM9JFVEDfWU3LJkuoixeh5tk9R9exkr4vpy2kPix6VUiVxBreI?=
 =?us-ascii?Q?BuGR9BMq5AOZktY06X1Tv7UAC/8yWPHQOW9tqctbNmnVw4zl6VuBFBSGA16h?=
 =?us-ascii?Q?mOXmjfek6cISnHNsa1Cgth58QD6YsRLqMFbxr1Qm7Y3H46nOApR9ZTY30FN0?=
 =?us-ascii?Q?jAErMqYGKnFdRq01iwApqXyu/fLW8F9aLt4qZ34KlA90CkIs8BhP1QiQgJiW?=
 =?us-ascii?Q?ZfQRGZY0W1mIhWzg3006R9KlRta/hwe282o8xmpXD9s1qKv2UA8DxC9XRFhr?=
 =?us-ascii?Q?jKTQijdZP5XFKD+0qR7wQxSKErjdLFq+XmC6hZEcRLC8r4If3rhWQR9B4oTv?=
 =?us-ascii?Q?pf4pVadIaeJSD47sG1i+n336vHG145lNAz31jUBdEJIiJbt947i3rVzfdl0w?=
 =?us-ascii?Q?DtvbOOquv1QPqP2YAMD2sGFvCjx1V2FRv5Y2X7LhHLm/pENAV4Cgm5XwfBki?=
 =?us-ascii?Q?kX4rzxF8NcTLSHxHbfp0niRURruuFRzo6anMEwSgF4Hl0Yfeu+XyfSelXo7n?=
 =?us-ascii?Q?L1p+rNYCox+OK2oDKL7oN0KsrV1A9dz7WeA87oWdKN6c1/hUOsONixKC8bu9?=
 =?us-ascii?Q?iAlkSa5GrSCOd1JFDeFOsmDlqse5Dg9RN4B1rxr/ACY0Q9o/N8Pxr4lCjPeY?=
 =?us-ascii?Q?e+nvEkwFl8XjcQEba19HBzjG+n3l2sYK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BKtDmSAycziH+imGHsSdp1bt4tWQf8sJ+bUNwh+75OovZryeoRmanyRPiToT?=
 =?us-ascii?Q?seaa+CsI5RTAKzVk7r5rqCApucuaBwP//hwNNFa6XJG+7uduwMemfQHiITUI?=
 =?us-ascii?Q?6X8xvRcdnRSwcvFQE2R41D4Ed+tDcnmyIQk/XPCHYQI4MidAZJ+OW7kpx+24?=
 =?us-ascii?Q?eZ6ktSDymhuADYBMolEIOlaoAnoOMCtoNC9pjqaY2+2kQfRD4QuxzqjretFh?=
 =?us-ascii?Q?fMgz9yeGpM+AIgL6OJLUVvB+orAIMLMABwHmVPAvILGD+l76IRlmxePhn52/?=
 =?us-ascii?Q?sruXXY+nvPN5QJ/qKMeVwp8spQYztNI3TUjBGfDVaWdpQE6Qh/DNlpkk4+Ks?=
 =?us-ascii?Q?mcjJXFmnIZcPMqO2+HzS+XHf5H4Ruhm3kb+d6yu2UzYeH3CB0IFUuEyXj2pt?=
 =?us-ascii?Q?nYCqI6KBpY6SpPNetsn82de8k25VzXaRq3byzqg5EPt0ktERFwnRJribMgr3?=
 =?us-ascii?Q?1DGNjX3op0hTyMDzNmNfFiUTU0055xV67WbZUSVJmMlkPFUAj4G+HGDCAXlq?=
 =?us-ascii?Q?UpQ2B2qKXLIu6pk8jzc8EqOdlHR11WHzOnxx+Vg8g1f+x/hfbUGfspLZwMXh?=
 =?us-ascii?Q?sQE13rriGD36n0oSK3S2csAsganYtyQz6K9VNy8c2vvcMIFRgg8IJbi2PGU6?=
 =?us-ascii?Q?DX1yRQHx1qLr1XHGmGghfltjjMrflDE/Epgro/cZNcu+U+uEIFIhD43f97Pq?=
 =?us-ascii?Q?r0+bq7QqCWFyCCCx+5vrOZzxlxm495GVyR+HxsgD4gmtMwAp08dnYQUNLEnx?=
 =?us-ascii?Q?BUY4nH2BxDRjVPNs0jeBYfIWWZwTeLjgCWLkfjh3NOZZUhuXR1zp0GNwdJmH?=
 =?us-ascii?Q?m8wGc8459pXKbZTbesWi6oqxvNdqeXUAT0m9Qo623/kAV5maqHp32+RWfAxJ?=
 =?us-ascii?Q?EFTNjQThBHpa+wYOMn0SS0BnH6na25I2koTNPus9yCeNDoa5XCIi+f7rwrgv?=
 =?us-ascii?Q?vcWU5KLMdYNLd1Jj8JjNqwZ6FGW7CtUQja1sqNgNe9qo+xJ8lHKuST/tph5v?=
 =?us-ascii?Q?x3kmSrWsIRXCbLTrdjx5URVBhNgZPrSs84FSpES4eD3UnwD1qiC6rVno95go?=
 =?us-ascii?Q?oBx0HUKXxzy5JxUJahTrnM1utDjk1zYmBqIArrVC5jPccGxlIsZn9In6UyvJ?=
 =?us-ascii?Q?dCiNSRIk7O6qJ+cCy7a6Jn5i6i4IzxnnJE2IwxDn7AJdp6gKDvGewdl9RPEX?=
 =?us-ascii?Q?Z6w1A9I9S5WB0Hr2mwXPBvPXvFAhqV2Qtexb4KKKRsBU5C+67lsjg2DFL48W?=
 =?us-ascii?Q?DawnJ+DltfzIzZAkj8JLdhdouXyIvxxhx2oz0V50ciFGJ9nNdclF6wK4YJJ5?=
 =?us-ascii?Q?IxaU+8XQcds0yefdTJmeFXCLGMmEOys0kE31J0Eiqwh97a2akCX38+wDjLZ3?=
 =?us-ascii?Q?C/DfFY0oPNy//EW33M6ZmY1Q43O9tlip3VI5szwpbjSbSSW0rVYFpdx4LOMN?=
 =?us-ascii?Q?3sFH6aAsaXNC1/WxiRqnCupcekuvRskt1FdGlnAkou3eGYZBz9C/Cj5h/9El?=
 =?us-ascii?Q?kwKG0XkuEB0q3mmDjsDq+rBG3p0fM5YrEXfujs7pWMLB0JdH0P75L0W+M8fN?=
 =?us-ascii?Q?KyXsQ4/Jir0hAa2jbEBgmnbxbGr63Q6mFOweo6lASwvK/tGdTC8EuSNOOQo6?=
 =?us-ascii?Q?cly0NvYjsU7iZPd55NY2O/U=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 340fb3ef-88f1-45b6-9db6-08dd5a6dc7c3
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:09:30.9157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTNU8nSlc+KaEwEuNamfFYD3uQJmhxt0sUZhU81ZjuiDM41cqiO4S65PMSO1JUJnu/0wPftjywxf1VeoMq4tuBcZtmSlZiaWCEyvmB5J0hErYU9UH2NVwxARfcqVBka7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

The CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC has five
interrupts:

 - image_conv:    image_conv irq
 - axi_mst_err:   AXI master error level irq
 - vd_addr_wend:  Video data AXI master addr 0 write end irq
 - sd_addr_wend:  Statistics data AXI master addr 0 write end irq
 - vsd_addr_wend: Video statistics data AXI master addr 0 write end irq

This IP has only one input port 'port@1' similar to the RZ/G2UL CRU.

Document the CRU block found on the Renesas RZ/G3E ("R9A09G047") SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Use oneOf for interrupts and interrupt-names
 - Handle interrupts and interrupt names base on soc variants

Changes since v2:
 - Collected tag.

 .../bindings/media/renesas,rzg2l-cru.yaml     | 65 +++++++++++++++----
 1 file changed, 54 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index bc1245127025..47e18690fa57 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
@@ -17,24 +17,43 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-cru       # RZ/G2UL
-          - renesas,r9a07g044-cru       # RZ/G2{L,LC}
-          - renesas,r9a07g054-cru       # RZ/V2L
-      - const: renesas,rzg2l-cru
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-cru       # RZ/G2UL
+              - renesas,r9a07g044-cru       # RZ/G2{L,LC}
+              - renesas,r9a07g054-cru       # RZ/V2L
+          - const: renesas,rzg2l-cru
+      - const: renesas,r9a09g047-cru        # RZ/G3E
 
   reg:
     maxItems: 1
 
   interrupts:
-    maxItems: 3
+    oneOf:
+      - items:
+          - description: CRU Interrupt for image_conv
+          - description: CRU Interrupt for image_conv_err
+          - description: CRU AXI master error interrupt
+      - items:
+          - description: CRU Interrupt for image_conv
+          - description: CRU AXI master error interrupt
+          - description: CRU Video Data AXI Master Address 0 Write End interrupt
+          - description: CRU Statistics data AXI master addr 0 write end interrupt
+          - description: CRU Video statistics data AXI master addr 0 write end interrupt
 
   interrupt-names:
-    items:
-      - const: image_conv
-      - const: image_conv_err
-      - const: axi_mst_err
+    oneOf:
+      - items:
+          - const: image_conv
+          - const: image_conv_err
+          - const: axi_mst_err
+      - items:
+          - const: image_conv
+          - const: axi_mst_err
+          - const: vd_addr_wend
+          - const: sd_addr_wend
+          - const: vsd_addr_wend
 
   clocks:
     items:
@@ -109,6 +128,10 @@ allOf:
               - renesas,r9a07g054-cru
     then:
       properties:
+        interrupts:
+          maxItems: 3
+        interrupt-names:
+          maxItems: 3
         ports:
           required:
             - port@0
@@ -122,10 +145,30 @@ allOf:
               - renesas,r9a07g043-cru
     then:
       properties:
+        interrupts:
+          maxItems: 3
+        interrupt-names:
+          maxItems: 3
         ports:
           properties:
             port@0: false
+          required:
+            - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-cru
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+        interrupt-names:
+          minItems: 5
+        ports:
+          properties:
+            port@0: false
           required:
             - port@1
 
-- 
2.43.0


