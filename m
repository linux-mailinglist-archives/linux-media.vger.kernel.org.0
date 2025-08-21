Return-Path: <linux-media+bounces-40535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8CBB2F196
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 10:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8957CAA3B2B
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14182EE5F8;
	Thu, 21 Aug 2025 08:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="oQYJckOl"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013068.outbound.protection.outlook.com [52.101.127.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C2C2EAB7F;
	Thu, 21 Aug 2025 08:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764304; cv=fail; b=I96ItrjlKqG+THVXkHMENX9coTsAXQ8Fwi5gWg/GobQ4aOvhmUzuMalsYmckK8D9F33GR72kBMI2L+jwqbqmpiC8aqGJPkufZfo8UgOaH1j/fM+kTCLha81DVByAq0N70vG91eRQXzCjBMbC7pU2VX818R9/epimXXsqQa0J8YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764304; c=relaxed/simple;
	bh=gGOFoMEmQJVHpLvbtcn3VprjM9WZG7otggXRbMeydKU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nTd/1y+jCvUV5MZq5yyWFiVQZ/d1wQramKE96kKnhqu2LQ6YZ/Fycs8qPyeldR69cmehpMc4WdUoHF+ls2/qdRUEG5Sv76VJ8NQcSbFteBROw34xe+cVWtc5P7+rf2D51LyCwRzWjxJ22PSiJgwIAVRV1neG0ndWMlmqAc3jUTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=oQYJckOl; arc=fail smtp.client-ip=52.101.127.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6Ltdtl1GlbUdNll2xgF8NU6ryD08LThM3PhNXWPfOiW3zOldO+UeU7XYZep2msrgQmFGd9PvJ6h55LMK2Sv2kBoHsdyE31RrI6TDEAuicaDzqJaD7gFleQqlMwpQCKi7qmar7NVMrcXauOQUjDFKT1T4ViAC2Mk0rGYTLhvB70791fnMBKR8FRy3jOTf/FL+QPCMHMNPqhIASn3gCw60zvzqH3Z4a4PRl/hgUjjxGWGAHSMMJrZVUfLdKWsyKq28lhUPmpIstckoYqYbyKLlSJ/eEvdsZxsoseXHrftzd7mGaX6qIU5Lit5K0Y/+ewU5zNxYOgolg7ckJ83HST4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPRkwRUWpnE3bc8qU/Vq6k1kfyOSMPRKeNh6gpUeoIk=;
 b=fnfNr29VNvywBgSLqph1en0mhopdt83NID5PGUJLGjBCN0fgyKdoyFEuQXCVVmTwrH6lLq2myKcucrb+M1tNR1i90iyGd6r7+tD/3rvquWmiGWUNiGmw3ToR97eY/ddFFky/WhRtN/WG1sMHfYYam7rLcsPs6QkH9BHjZbgZa+/XrgJKLZkiw5b+zcZHfDXlR2c+BbxC45SVWtREXY9ZKoNsGWPmGiNx98WWZ/fD9IvC4e3d2MoPANl37UJgg+TKT4Y3qfmlFsKxqQTQxtnp/Ul39tPgme6J/OKbUCu8nNOG2T5VWaDvamz39Gitc/V4uD6AcmDEQDHjSxNltUceRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPRkwRUWpnE3bc8qU/Vq6k1kfyOSMPRKeNh6gpUeoIk=;
 b=oQYJckOlJr7q7hahyibB8ESJTnwDggbsol2mUkbRIU0uAxo21C2gWFx9X93TcpkZFtZ1eoepOIrBKWSPlr9+JEcFMUmsdhwanFDfu+q9Zb2fPOFWqKCRHdvbfNBAmZFBSYDQNaklcFQWabYu4+DEf52ZGtfXZXfMtEuJfEgldsmm9a65i3GX1rnvZQ33fkIE9qLkllCXx0dFCwa7t09tW8uYiDZ04VVK25AO+4gsjzBIh5HqU0qQE+3KcdLAkxLZV+30kXLZ5+EvpBRYHbj4pWwHHEVK36DrRblGqrWVs2qWEYPXYvchm+pjaIsCuIKp0dYe8JgU3NiCBhkxh9+ZFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TY1PPF2322611A7.apcprd06.prod.outlook.com (2603:1096:408::90a) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.22; Thu, 21 Aug 2025 08:18:18 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 08:18:18 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] media: atomisp: use kmalloc_array() for array space allocation
Date: Thu, 21 Aug 2025 16:17:42 +0800
Message-Id: <20250821081746.528018-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TY1PPF2322611A7:EE_
X-MS-Office365-Filtering-Correlation-Id: 09428704-e371-44e7-b32c-08dde08b4897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Mjt6t/8VvFLYGf+7PeI0/r1tsovhAw4i0DCPWGilOU0xgJIF5ZcBsW514Y7?=
 =?us-ascii?Q?kD/hSo78Q7Dwyz0CnDNKZSZZr6nKVBpFbAVi2WxxMNSG3fKvCovSZh4Y7w6t?=
 =?us-ascii?Q?SoNyDsa3dFtVKkWy5KRjN9WbOhATXIQvCuHe/sPQumy9ZM6NSIpZH63kV66F?=
 =?us-ascii?Q?4w35YVWnr0YBCGldg4IxigRdIglUW+oRbPS1et44i1oL4V/hOhw5ZGOMwMt4?=
 =?us-ascii?Q?iSE2bDczPQCPrl9X0Bg8sHUUbhjXIdmy0zegTHvyQ94V4kn0B2plXKct54MT?=
 =?us-ascii?Q?Xc9kXQwAHt/dCBY3n2+zsh47gziMGpLemJ1fPbaB/JEm69KTDMiMmXpgE5Cb?=
 =?us-ascii?Q?XdmakhqxTFt0EqcN6mAwNkyAIbuMB7w5sCB+FkJafOYSDxZE5I0eW+HqA653?=
 =?us-ascii?Q?9G7I+cT8EFrW5+uS1124quUqBLN8rAvxyacMJ0b4s2eHPX9JC62G9XN35hDv?=
 =?us-ascii?Q?FerorVlsYrSrJyJm6A9BkqFVGGBv4199iBoJ9St6/oT48gd0AErrzhpOnwIX?=
 =?us-ascii?Q?CIaRnMsEQQREyQ5MODWIrnwfyp0N6d6g0uJGWnll+j7s7VAmp6h9sWvk8T6L?=
 =?us-ascii?Q?U994m3QT7RGgPeA+gkLII0cAxQAC745A56GdFpDGgrifC172g9C69qBvFSsg?=
 =?us-ascii?Q?MOJQVL1mQxodcmM5nRVgnjpZ0HYuZmnmts7R8i6TtFrpic0bqlsgyVkt8hKJ?=
 =?us-ascii?Q?EmeiQUSL/G6njoM6SKHj+rTc7LpelUrtW+m/U2GGpEDhHXNJd2USca876VOh?=
 =?us-ascii?Q?17MeihUU3qfkfJUCGXAdL3rFBiwgsLeHLlkrXGkfyOSJoD1eWnJ5e9rVWIIw?=
 =?us-ascii?Q?TUI19s89kzasaXrZNW3+GL8rKZWxouH6DP09qUPGTblMfdz2Ffz6unOxYdu/?=
 =?us-ascii?Q?UYQ2Agyt9iAEUL85NLki4CIPkMlIMK1BKOFy3m9FFEYM0S8nT7U/3mY6lthF?=
 =?us-ascii?Q?xfZw5z6RqnAk3Ke9Cx0hUrVsuWhtHc7S28RgdYlS7asY//LXxKt5v+iE3s/r?=
 =?us-ascii?Q?faiB2ePz8swH08840KunWZSspv6g1IgSt5gTC4vTTZEDySrJQ9dkB6a/8YEY?=
 =?us-ascii?Q?i1yg0ka56r5KqqKG17Eb8kARk1PR3OwV0qU0W6jgSo9ANNNAnhZCbW+BZe0M?=
 =?us-ascii?Q?Xz2kE5z3jjs325lE8BVN4L/eA6RAGGyXK7QlGlH66Rzh+N6r3elyinoNXDto?=
 =?us-ascii?Q?069ci5JjcAU55FcxQHBcTOM/+ZhoXCduGJHUamU0EpW+sArFnPuJ7ZJmmJ7s?=
 =?us-ascii?Q?fsdlrQkQCrOKpd32QSKvOxbG25DB/5AcQ8I7kvvG006T88EexL+TGRLr3yH1?=
 =?us-ascii?Q?/aNQyulMz/OFUOItf2RpSFsUYcfEOaed15pES7PlU9bK52hbrlQUg3kctiAo?=
 =?us-ascii?Q?+cI7R/q7Cd9g5OgV1EH9kNNKhckrD2ZIKVEMwz0BEDECeKYCC6M6z9qDuN8K?=
 =?us-ascii?Q?Ikr9pmFHZRbt25VynwdzUBk4uVoCMitraMfHRBWEIS2cezeF3jofNWDLdpe5?=
 =?us-ascii?Q?h0MMkpJUJEOV43E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S3Bh5yPL+xBaujHrVHTq5zsHx2Mqoiz0BriRgZfUn2iXRfqrFlAS47RDMnDT?=
 =?us-ascii?Q?WdHn8mcru6+iiIhnHqg3s2rwwg75Sa9t4P621HPg+mgzW4LCvYFcTNDJfi4g?=
 =?us-ascii?Q?caKT3dhyGFmk7PcCWTkKEk7RjAPJAAONu0Pd5TewAcjDlEPIiVEhNUF92zQ+?=
 =?us-ascii?Q?weCnvQm2FJWI8FUcMUCg3eds/XQOeyCxJ/z18McoiSft61J4oPn5laZ3/v0i?=
 =?us-ascii?Q?9E1xLQgUODE+nXkItinE5nZI/jdga52+VnArK+6jtUrFXF/25xJdIH/sdp+8?=
 =?us-ascii?Q?baAxjgDwOP+d+YfjQ6MRj8wVdTM1Q/sXOpcIvvCP+Gz7sLnMPL2ox2ig17HD?=
 =?us-ascii?Q?DNpUygNaUXQsQAW2tD7HM6lMuAIkYDVByk5EQ/uFx+AHTNYzFw78hLNwZkmv?=
 =?us-ascii?Q?+JqF3/LgQiLc0+rSxHMPSON6sY8rEqq16hjaVUuLnfJB9ToccqEpuvYLf63c?=
 =?us-ascii?Q?0IASwyR9Zmg4uvIvgqlul3nMFJTiSBzW3ELhsgNyjD+3CyryFgnGCPXA5C1/?=
 =?us-ascii?Q?OzkI5FxAkRqVLbo4gXMVnJmEUxOxEWtbIsKFFEDLLznh7qYRqeyNHXmw/a3W?=
 =?us-ascii?Q?XuDY1Bj2HcIGSOy0t9vxKGvESVqGQrBGIMF/pWpjO6+94zi3GjshtMwej6ty?=
 =?us-ascii?Q?Rvb+65nJLNityVdNb1bgNYX8rSJzDoYmzfKhyySwCZQOZ1Pk08MFrx/OVxUi?=
 =?us-ascii?Q?xibXjAYTxZ3sUJktWukeTY3yMYVVG40QARkN4JChR3y02ESgww/ZpVLzo5F6?=
 =?us-ascii?Q?b+eu86f/41qOhWiCewYdM6tWuW1aJyopSiPVxsBE54HX2T9IDCaRulGnsmjU?=
 =?us-ascii?Q?2Fi0HWKuoOBGgLuSWfFHtf5tYWBGP/lDGgEn7/sx3tYBvfAbXwj4LsDL8rrG?=
 =?us-ascii?Q?I4TbeXAnqNkeNsv5dVqu0DrZsDoHrZfx7EvyVvkQiABTWpx5Qq0EKzXrUHnw?=
 =?us-ascii?Q?UUFbeziQviBp31jCoqFBwrwD+S9pQU68Hs3w199k1tOtXaIQgvYUDpAibc9C?=
 =?us-ascii?Q?prj6BHU627AY4JRltyLAqSiuKlHtXt34CbTJNqZk9+3UTw1lA/II8UFuwOv8?=
 =?us-ascii?Q?Xm3uY3Pxe5ngBRVq9iKJRnL1oFouXozQJbGgx0prN1EL+TWGKtwNeNqlOlyo?=
 =?us-ascii?Q?pUt6gru0/HceRO04ys+CO3uT7w/Wo11SeUhk2bnXfVhSYpRlwvIoQhc7i2NB?=
 =?us-ascii?Q?cF/qQoH+xXhKcCKGbAXItKRHLjFGo5A/qwsOCbPfo1oVylNlghqb4oXr8X0Z?=
 =?us-ascii?Q?LaGvPFfAABupaj2ztrEyT2kzSCubiGemSeXu+uMVbPC34eLd5rnAtNeGh4I2?=
 =?us-ascii?Q?tktdSOQ773GvrB5rHSflF0ypBF/RnytMhNXjpdq2J5R09t46kEPqGtM2nnY0?=
 =?us-ascii?Q?AP6Kv19iwW43/i4nQz8mqu+kt8XM9J12iDD2APgvpMqO+ukNgatAJ20TgMML?=
 =?us-ascii?Q?f6pw7npqPtJblteZNuwhKQl04TH8ySETMjy6yQJnkgRUlj/v4ivXy3//YZQl?=
 =?us-ascii?Q?33Kk0JozvIbsZEFaLgv1fpcwW7e7tvbUNNJKcvWuhArnnmwjGVAJfGWaX/jM?=
 =?us-ascii?Q?MVgqwSAO1C+fClm/gRY6I+0inxe5nGaaNcDiyZvY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09428704-e371-44e7-b32c-08dde08b4897
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 08:18:18.2729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k37T4jEFkpxKS5WyY31qeau9bC6JI72WxP7c1uut2/zJ/pCog7sPZkP/zKmc2NKQgblDkJEwG+v6nWKpkpoAag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF2322611A7

Replace kmalloc(count * sizeof(type)) with kmalloc_array() for safer memory
allocation and overflow prevention. Additionally, replace sizeof(type) with
sizeof(*ptr) to improve code robustness.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
v2: change sizeof(type) to sizeof(*ptr) to improve code robustness as
    suggested by Andy.
---
 drivers/staging/media/atomisp/pci/sh_css.c | 54 +++++++++++-----------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43a8c..61df1bf2bff5 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5821,36 +5821,37 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 		i *= max_scale_factor_per_stage;
 	}
 
-	descr->in_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->in_info = kmalloc_array(descr->num_stage,
+				       sizeof(*descr->in_info),
+				       GFP_KERNEL);
 	if (!descr->in_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_array(descr->num_stage,
+						 sizeof(*descr->internal_out_info),
+						 GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_array(descr->num_stage,
+					sizeof(*descr->out_info),
+					GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_array(descr->num_stage,
+				       sizeof(*descr->vf_info),
+				       GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_array(descr->num_stage,
+					       sizeof(*descr->is_output_stage),
+					       GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
@@ -5971,35 +5972,36 @@ ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
 	descr->num_stage = num_stages;
 
 	descr->in_info = kmalloc_array(descr->num_stage,
-				       sizeof(struct ia_css_frame_info),
+				       sizeof(*descr->in_info),
 				       GFP_KERNEL);
 	if (!descr->in_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_array(descr->num_stage,
+						 sizeof(*descr->internal_out_info),
+						 GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_array(descr->num_stage,
+					sizeof(*descr->out_info),
+					GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_array(descr->num_stage,
+				       sizeof(*descr->vf_info),
+				       GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_array(descr->num_stage,
+					       sizeof(*descr->is_output_stage),
+					       GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
-- 
2.34.1


