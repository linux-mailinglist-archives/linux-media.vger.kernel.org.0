Return-Path: <linux-media+bounces-27390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3252CA4C6AE
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58370189856A
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575A123F289;
	Mon,  3 Mar 2025 16:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jSu9+whv"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DFB21B9DC;
	Mon,  3 Mar 2025 16:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018224; cv=fail; b=EKiTHuDR6MFaA/OKzPNw3yw64yyCwbAGc+YZbGXAh7rcAu0GVa/uwsOX5AHSI7DXEDDcrM7ulId7OKkiBwoLgx7gVzl7pbmrYltI2TfKGQaVvWSLJn2dKAcz7KOOIg0ot1KoZKCNPgCB9j2vWLK++nI2fM+B3PnQobkBZyKpGi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018224; c=relaxed/simple;
	bh=64UM6fkOuHAU7eNNKixZni2Q8U8k9E1uHxCnW7dmHTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YixtE/QNQTxyi/e8mFlvKD1K8QyT1SesiuI+cXH4r1YceHziAN7Mk6Gp2VmrsHpB05UZ8Vq/ucY4rw6lJxJ/Z32VvmIu5cTK6V+OR5aC9TDgTlFXqVXvbWQVIJNS8zZF/LgC7e22i5L3G/k57QdaUczP1mwVzo/F2Ou14kUKH7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jSu9+whv; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwngJ6NnUM6bQZ61ztbB4jrBE/FRAJa1uO/JkZN9uTFnvwkmoHrjrKc+grDwE2gmjgVMCFUdK6P36lfo95VyM81MW0/6FgU8CILBQcuJYtpg8Lj1XTv3rCsjHyUGH195L2LBLsEp4BANgRlWp3fbjQioHUV0uZc05qD/tH5G69I/a68WgwreCd8KQm4QzS0W32aGYpTIZyOI/b6WVBdcxn774d8asYusy/i5d4McOtvrFjjHo1hPF0N41xynLPwSjYEpZXtU47p962Lkr3kR4QmvpXxcDKC0fvBuYI+cQFhG3e0xGdh6iWiv6HkHGcXf42nJcYDxuQAkOpn0KuprAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fy7n4PKBO6cWSpSVqQV7RaACCwuH//pMEbcPtRekwd4=;
 b=ZCDC2SABhizwXqqJMdONoEdw4S2IMTQ+fWWHe7WUaMgLDXWyH/FHUi3I6UEJIzl52UqW1NOHd4Y/RGVfzvqKQgBx9MgoIqS9/nFxVhjpIkUFYjyxvPQrmFpyBWaVH+bPDfUnzDUQhkZt0ipIisYq3wtWua1VcvdtK8pN/SXoUxHkHtSWkp6Jii8UhIeXp82957HNqEFdkm23JJeGxeyZYy+m6j5bkhLD8p/bTnWv8Jj2ttzUXTJqoxkZ25b783PvQnJB7pH7fFooMIX810Bhr9hSO7BYlWhzZWwmK/AgCvur3rqxlqtz3O/U4caeYRyWg6fUH5AWu63RJYeyCOym5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fy7n4PKBO6cWSpSVqQV7RaACCwuH//pMEbcPtRekwd4=;
 b=jSu9+whvRi5kWBSQCQQ2si9nowRhTwhaMbUpNOlBlSE8whhU32CqLoWnAX36vZ6kr4LDqIDBFKD25rPNsnGWiub4VM76TSkdghFrcZMU8bPUnC59q+M5TxTj54mfUICIU6GAdqFpl79XhHtDH04FWyuoL8RtYEW5EL83hQEOjHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:10:20 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:10:20 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/17] media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC
Date: Mon,  3 Mar 2025 17:07:49 +0100
Message-ID: <20250303160834.3493507-10-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: a6dcf5cf-cfea-41dd-756d-08dd5a6de570
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gEnygJOBaoKeiMYPL/QYo94aIBtptTWmk3jPsYEtT+oxmuCgYWTsDyyaf9cJ?=
 =?us-ascii?Q?gzk2zhhmUEu5HHx7jWHjg4TA5kDD7VIkIPThuPMb4BAC3iusnY38EiLpIITA?=
 =?us-ascii?Q?xDmS25RAuMYRC9gt7fRFfr4Jo52tCzg58pT6KQyzgUrLcrtdskEUdXl55r29?=
 =?us-ascii?Q?SSNUxOlcjryDHrZyCE6q5/OH9mR48dKTRiVxbigoInOPxo/aUVJbmnj3D/O9?=
 =?us-ascii?Q?Ck/Il50S/ShYcDeFxDdvjZ5ouI1jXB11MRpB3H8a/FjDxaAAJqav8TCLHx5h?=
 =?us-ascii?Q?mjkiMb4AAe3kPUzxPtnUPtXcx1LJoT8mz9cQtsiwfA9oqNfR4QZyOA2gNBib?=
 =?us-ascii?Q?bNHZk8t4jl2dsM+QzlASZ4OqSo1R45uT+VOKX+F9VbZ90dDTl9MfhvopKIsl?=
 =?us-ascii?Q?3mXjnaMozaNd3zNycp/Nx5Pi4xur7nZNp2DHhy4axdWffVch1xOaGLpZ6Y68?=
 =?us-ascii?Q?IByQXZ0NaMdUe+SCxN+UzbThmSQpfDfG9IsLi7mYwWFSgEgTCj5Lnh9sHs49?=
 =?us-ascii?Q?m09WlfS1FYpZ9S+9iYB/SXuLi9UDLijg9Q0y5Me8YlS4TrJptLScIjDdIHuw?=
 =?us-ascii?Q?F/7ljl/pVIrKuhweHRuWg55CNOJlqbABd+XmH1Oq9OVgDf3QdzUkHRLh20KM?=
 =?us-ascii?Q?XC7LLCYsUaUkVoMWlVVUhveH0J4oqD0+KGDU1mMCD1v5jRKcKeQRofiFdrgz?=
 =?us-ascii?Q?Dfm9DVLJSSLKIrmKu/EfFcc1iSQTMmjmKem6GSMN9bccEFDQgKJoXWt+jax+?=
 =?us-ascii?Q?5FqgwQv+eygFVcsehWGhDRdKEfbqD9dAkgUyyebikOFtKACNwgK24to54K33?=
 =?us-ascii?Q?71pUnOw0k8pYnLLyKozbX3sxTUzLNUgroHCUlEm90cmZ14yZLN5xupv3F84+?=
 =?us-ascii?Q?KQpatNAc7dTUGOj4B/29wKBHYvjB6tXLvVs5nxEGeTTSIrW2dyA2UrdKJTlw?=
 =?us-ascii?Q?ERybW3Yld9oSf6KSqo+Nj919R4Z2ychMNHtj+xKXrCQhtkhkyIMGsfOFvCF5?=
 =?us-ascii?Q?E6FZPKISuJcZj+FvvklhX27Imna6TVHUeie9p4ktuTOGbHTFL0xZx+w8ZCLu?=
 =?us-ascii?Q?93i7A9iZnMclvJUZzs6Aoz+ws66UfWxqVvRmaHEzGTe7pu5ouVQpjuKhLoBH?=
 =?us-ascii?Q?DnHRUj8LSDraxjmxpveYCNdOaRCg7qkmNhik+PGad7HButXyWlAYPnfZe4pd?=
 =?us-ascii?Q?F29v+4EFt2SI7LSQbO8uXiVLA85V4mJk2uCy+t6yP2CWo99OmcacRp+8mdyz?=
 =?us-ascii?Q?StKIwyt4qDjK+LHRxa1CC5liKif9jzLF6WnZsJqOtvn6eAU+8vpsmwjVLg+9?=
 =?us-ascii?Q?7i2gK/BLYemtRGvL18LSFnrQFJubLVkTs3eNcCe1Aa2cxFU643MBd8XLHyUt?=
 =?us-ascii?Q?90v7phIi0NJOLQcFTsfabnA2vCFG0E+X/MNXtGlmWq+zB8AeK2a4+Duqb6Fm?=
 =?us-ascii?Q?kpT8RzuyK8k2MWIrV4OZPG42TZkXk9JY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SyPTP534tuc6e/58aLbD27XhkAV4NT6B2FIKpa/vz0ggfUetIKZ/CBnHrbh1?=
 =?us-ascii?Q?6TDcnm1eqi2lVHzsQZQRf130x5gjirXUTHe/c6ouI7nsvC1HWQd+4vaJoZfS?=
 =?us-ascii?Q?4cNKtGr6bg0VvPp1YriJ3FGFiN4+UDGLAeRTBYAyHUnvNR7ePSdHI6E26G9F?=
 =?us-ascii?Q?aEBBksFVZGxFxRiJvD8KmUxJHUBL92E3oU671n80aQjhrFYiP9ptUgO9aWx5?=
 =?us-ascii?Q?AA27LjIoWtUPXzon0zkFUd9T8idsOUpD1+TX/xSzbCV7c7RouLjjyPVUGmBK?=
 =?us-ascii?Q?TSt/Udg4kIxcQLWewk5EJMLDDfDzHd3EuiglkY9wYxjv9faLvXNJVQVjyGWb?=
 =?us-ascii?Q?mZtEpEhfEAZM/CkA67UqZyrE5S2IbqEMS8hCqTD1X588dk9HMxugDKCOHaiR?=
 =?us-ascii?Q?Bqo+g3gBQdakYaM6VrWv+yf/wMLm+MBli5drT9FPIhSTpMyNflf8GUIdaYEe?=
 =?us-ascii?Q?zfGvyELbROsx/18772PZJtpaNAqPvO8zAgQv7wO1iU0oLnnjedHKdM6TL28l?=
 =?us-ascii?Q?6uohXl9SQJ0crLYGHnZQexdjA9SFXIueFgLZS3CcbkNckF4dQNXrSaLaOzcy?=
 =?us-ascii?Q?/fJZSd1MeUyqgwbEZPI4cOe1jSWTvyhWxzo3QrqA6duOGKYPI14elrgtM7co?=
 =?us-ascii?Q?SgrjAaRreBXuAI2s22DQwEuS6KEuAc60BseKp1Cc9FGxPBihdskr0pSL0SR9?=
 =?us-ascii?Q?ajSCLYvr9NLoC3L1DU2FzN7PlHjPJs1RR2cpZm5Qw/Ok+YoLhAUVzPKvXav1?=
 =?us-ascii?Q?PFIUEblgvTM7RjSHO6LnT9rWGslGO51KDF9aZySGMJ5vzJrFRgpzbg3JpXEc?=
 =?us-ascii?Q?CCklqgv8WXTE+PC6xxbAIjGfIG+FHsKv8kRNgxGbeUL4siv0nGH0KMG3RnHi?=
 =?us-ascii?Q?K5k0AEcujsHLOpN1iE4TbgMy9PjtVSrSrNm94hrzaSfRmRyXNFm8NkPCVFLW?=
 =?us-ascii?Q?XOESoEBHWtqkmln3sRmPYm9sV//W5pTpzxp/a2HiV1vVBxbbvMUZhjv547Wj?=
 =?us-ascii?Q?OQQQRYLpbuRHcxBtE9de5mtQlixii2A7veyvwqWSHIsBPNz6jRJFytcX9sQC?=
 =?us-ascii?Q?KKhlNJj/ldwbFcwpOo2PcL5bElCJscYbcU6+0kWxTAKvmbHZcv94n4hh3g/7?=
 =?us-ascii?Q?GNZ+R0ewv+XabD8XSnPukaAMJhO2cLYt3Lgo3EMAIxTcQJ3er6EGVsgmA8Yg?=
 =?us-ascii?Q?vIcS7Kzs+OObKTXFTMAB+Dr4b9WaMS0tqe8GZZ0dvODBc03Sk0tDO/+oxjfw?=
 =?us-ascii?Q?zAHrueGCzsGss3uAwHAqkVGx06C4HYOU9b5zLcOPWni2X2MVb1itMaLZdipe?=
 =?us-ascii?Q?ggaBbQFUUKO5ouNZJkAEVTOmq+Hs0odlpwONxJPCqIwipCMBL/6MvHYODRqj?=
 =?us-ascii?Q?4pI/FvMryj0YvldISeArhwa7wtPVfSf52t8ISyJP3mZjxkbbJeOgSEp3EN1C?=
 =?us-ascii?Q?wbZrg1os+mKKRRPvDjiDu70lWnwM227MDF19SLrXFBdUJdNDBC4YOO03K8vx?=
 =?us-ascii?Q?A0B2N10d1f1DPCH/IenCxVojjIMaPwin2HAdJS6KLASLrL2tMtnB5FP4R2oR?=
 =?us-ascii?Q?tBJfFewyaGQA9AZDRkM1d90/XIydChEekVTpjRbkPX1qpT3xSegN75XpxDj1?=
 =?us-ascii?Q?XYIJgbyr9/TIbSXr5CfGdvE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dcf5cf-cfea-41dd-756d-08dd5a6de570
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:10:20.6955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3ybdttiMPZjuRMUSypjd0u+wwpj5XhsFKol9T2qj+8TilGAaE5OdhYcRlYjFsgehgN+raYOwOvXKzr7bGvj5lJS06NFpsXEI+p7oopW6C8DW3QoQIOV1S19Ylrt6TwA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

The RZ/V2H(P) SoC does not require a `system` clock for the CSI-2
interface. To accommodate this, introduce a `has_system_clk` bool flag
in the `rzg2l_csi2_info` structure and update the rzg2l_csi2_probe() to
conditionally request the clock only when needed.

This patch is in preparation for adding support for RZ/V2H(P) SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Added has_system_clk bool flag to the rzg2l_csi2_info structure to handle
   case where system clock is not required as suggested by LPinchart.
 - Fixed commit body and msg

 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c    | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 4aa5d58dde5b..e4781105eadc 100644
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


