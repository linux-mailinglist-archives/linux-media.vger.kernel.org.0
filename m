Return-Path: <linux-media+bounces-41179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD51FB38294
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 14:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1787C7AAD9E
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 12:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C9D34F460;
	Wed, 27 Aug 2025 12:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="VVHLteJx"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012009.outbound.protection.outlook.com [52.101.126.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB26C33EAFF;
	Wed, 27 Aug 2025 12:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298382; cv=fail; b=AQI7dteFXr7DfP6WvbkxBsV3gy7xL54BzjOkHmuRv89FMo6/73BNABcPojLyyKClKGl9u5RuA0S77lOeV9bKC+aeAl63xqwu+O2JxW/GRJg6c3WqNfZFzrZyJ4z2BJVF1MlZ4Xv+Z3vpW9tDsHe7/nchhL8bKa8DgmnUekCCS1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298382; c=relaxed/simple;
	bh=JINE1CERO6fv6BStIe3ntJjCT8o2XKM4C1ypAHo4yrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i+SmtFDrhAUwLiKdNsWE7zT14rfInI7hBjVhlskbHaU8eUAInd8b86yvnzJReKm7Is8yTa5u4z6EN2JWB06P3SHr0NrgT5UF3Z5GTndndjLct0hnJMSj//SgdiuwFwJesQ+cd5GlrqUmVCc5qWiE9uJdXAzXrBa/XgUKAS9bCo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=VVHLteJx; arc=fail smtp.client-ip=52.101.126.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DX0ZH9frkzdulcOso3lvSiVHNBMUpFHhnbo+zsycbdHCGAAC7/VnfyQqekOdzt9ijm1f3pvvB1/RfJp0FdD4EAzS3bXC2UAVaujaf4JOTQaF8uU27RGxoavy81Vs1ojl+BrvW5PuwZoQwLXg5L1+8Eqet9gIFgOKlnhsdP5fyGySIjnNzwvuWxEnFTt0Fco5VcwXLX84v2/roliMqtmWysqdBGijysTNgG1C5+GP3+PiRXDfP1ch1DYArWPhBRbq9HCOyyw6Gr1qWcJJH2d9C9a3OWxgcENOeSO52XZBR/eTmHIoU6/3mwqKseLTHsyKhdIHPX8nuUtTjCp18qTIVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nf5DIGHoNIS5bLjn60h21foCkBGAHjnkH3z/TgcHr9Y=;
 b=TklEv/PHfZ1WlF/BMQ5vOs0uKB0ZR/96aEFrZI38tpFw3OqO3eB1x88uKCy0WBGPqb2BjihGQb9MgFjgbQeWg5ikRe4Zb+t+wP+p0PM7y3+wp+Z70XZlvWGPfdDU6w45OaOBKQVLoJUSfe0acLdAcSC5yH0cIFJnNn4iMgcXhSM5/Z10RF4WjrpdJQbC+qVHIOjpAZFeyhuENN854IFMIxdkG6YFmFwjmj5t2XavfHX1cHdo74GmW50eZmbFaFi7+8OBWvUtLvbAgm1qJymc0M1/7MuJD/HuLYUH3fo4QLEWj2OW1Vm+XjFKfk8k4StSznVPdpPuKIXe3yrij2My0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nf5DIGHoNIS5bLjn60h21foCkBGAHjnkH3z/TgcHr9Y=;
 b=VVHLteJxXnvpWIxOejsrItMKUT0qNuBFlqiNuALZRSbCtRRKvn1IMuiT8uzUwv1UQ9IzDWGiFu02uKC67F7S1u8xgL9QxOlrKxUnkgD5wiRf45U4lk7aKRNao2LWyyo+1IYJBjqQOE7ulNmiJ/c/bP35IvKZRqcEQHb2sI6deN9LfPkeGMMf8UxW0lgIQtDU+m8C8LmG7YCj4ZSzMomSm9eBmX+RcEwscdCy5uhjimkgEjD3HXDz2oeQTl6Fs914Tppe60S1fe22POKz+wqq5FwraRbY46n/cykYmMDnfxW2q9VvYzTsEazi60p0R0AL0/yXIiXvPkZzNk5GE6cUfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB7285.apcprd06.prod.outlook.com (2603:1096:820:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Wed, 27 Aug
 2025 12:39:39 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 12:39:39 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:MT9V111 APTINA CAMERA SENSOR),
	linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 2/5] media: i2c: mt9v111: fix incorrect type for ret
Date: Wed, 27 Aug 2025 20:39:10 +0800
Message-Id: <20250827123916.504189-3-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827123916.504189-1-rongqianfeng@vivo.com>
References: <20250827123916.504189-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4939e6-e81c-427a-5f3b-08dde566c9c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4UMAavYMGUHnbJb4KiJUh9JbJuh2vOJ8v8i+tRYOSPl9GHgpq5vsTceVFsHG?=
 =?us-ascii?Q?VgG/AuQhe4A2d5z7e6VtlD5Z6W+t1oSwtkxP1VUr4DeKioE1B2fKAQy4A63n?=
 =?us-ascii?Q?U0Sf+izgpSw6/fXhnLIPw0dmv/g2h/PvpqB1WdtZs5z6Xv9G9ZIjLRyABFhM?=
 =?us-ascii?Q?9OYKPLwqJuvVATbje0EFv0XA6n1N1GObi5BV0vIKrVjEiE3NFAs9DfyBJ/OX?=
 =?us-ascii?Q?SPYedOZ3TNYFsJP8jvg3r2CcjquZ52lwIXWZvyOeYBd3VSyOejs0/GT7WP5b?=
 =?us-ascii?Q?MrBuh3gS1N6MMCYsSKuZw8ToiW9mKAENxWv1h4obSxEykuVE+azSUMnK5EFy?=
 =?us-ascii?Q?OwzcFjQDNWw1CisjZSLp/JPJJeNWZ9OXeJFpi/ipwqSPeAUUTUr7VmRMrCft?=
 =?us-ascii?Q?m0Ir8OizxcwrYL9EARLRmhttvkzgZi0PjpGGlhDpOEmnSpk2l2iHHIXHiimg?=
 =?us-ascii?Q?BstAe3QgzZDLctCtYZ9n2CHGGs49UQNQj0pbpU47c7DZ1lgJbaG/BDEK6MD1?=
 =?us-ascii?Q?dtLXjU+v+MxHvcVdeCR7CWHgMPyS2R43xtwI2C0v8OpCkFxwACMB6O0W6+sz?=
 =?us-ascii?Q?vn390QKK9SVKIU4jt68U7Nbg4/l3SOJfsOv6d2QE9kHKwRMhiyKHdnvyVn8w?=
 =?us-ascii?Q?FHs0saY3ZJHGLy1x0w4NBk8xlULeNFg6kNYY0gNE4sgkUC9NjRn7DDGyJN+Z?=
 =?us-ascii?Q?U2pfz0qg0yMknYS1c/jsb1f6ib65VsNT1eQBrBUTobmRy+SucIlDfGi72z+W?=
 =?us-ascii?Q?d7rBikGOb22Dz1Yt0RckRUtecxEGWlYlPocamz8W7EngBUakT72LAqNCMyMb?=
 =?us-ascii?Q?kHriFXsgRpuzMPPBAW4tzLhT9qVOOthBfSqkAxfoJWApY52QYTiFflQjDJrk?=
 =?us-ascii?Q?0y83o8x+nRytx4z986NISXlWwOuZh2EU749AKbI7ojBtVsUJa9W/N02RmE1E?=
 =?us-ascii?Q?c0ofnf3T0M8+jLBIbosN6DAI6E96jJU9lfrFf7eQbm5WrBOXKsfPp3HDYbv7?=
 =?us-ascii?Q?Ep2jT+g7KenYJ74JadEDSPda30V3UfhsP+oxwoDuosjDNX0inCjU2NPLX6tc?=
 =?us-ascii?Q?dWIJSec8NK/eAMGkd1vJVGqg+xrjUKredxxcpo3RzQ0rOXjnVpb+TzooM9mw?=
 =?us-ascii?Q?8s+qkqt6AAfuKSiljlrznS34fYA5lKuTxkNd748xki4GDidiAPTSc9/dW5/k?=
 =?us-ascii?Q?4NOEGyPMVCyOC2M1qOHiLgOe2/CEhZbE9Ymi8v7kfVEtjubS4EBcBtfAbOyW?=
 =?us-ascii?Q?7Wdo667OrLV0J7h9eowz4bsUu0kB8ZETWSQzClGSbxMoBzZQV96qsF6c0zSN?=
 =?us-ascii?Q?B3DrdVqqxdwngVMsgkMsjIRFW50k0LupN7willeOTAXLJdUY7MnqcbXfvsCf?=
 =?us-ascii?Q?d4/keKMCWSEN9ff7u1V5U+AMlvgJzcrhfG7J50kZnrrSeEOVEoH6J81W733s?=
 =?us-ascii?Q?/K8jCOtcXROjk6KpOZx/CeNiO5cyLr24nD+7xIlHO1YJYRNKyheDcQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xp1xb4Pgh7tEbBXU2B9yKU2y1l/YKVGO+epBnAtI7P6xAwCTB1+lPl7SAJgO?=
 =?us-ascii?Q?ye41ArqLk9IuAtDVZLTDHh/eHGwGW20WPzCSI5LZMttjFJBPaMyGP14KYE++?=
 =?us-ascii?Q?ShvLcDfWek3riYlGpsjx8bKMWlfAfMdXUpxoWRQxOIaMBnhC/+EEaJ8pbpmK?=
 =?us-ascii?Q?1NTpMPdVFfdD1g/MrlzbvK1HxBPbE8Ft6JXfBgE13nOCHoTk2zaYyyIofdhU?=
 =?us-ascii?Q?0pdJ78WR8nzvg7DGk3SYZeg3RukC2oOssHX60XijdF7iUhLEpcMHyeWySUYD?=
 =?us-ascii?Q?VudRdM/ETLgFHMB6/B4dD1YWku/wsTsrDInTCv9KXkZ4TV/RZv6zMvydP3Ks?=
 =?us-ascii?Q?xVsugN6ctO4me0XGyu3cGhXvBvo2iZl7bu91lgFALj9Aj19QC82VOI6TADMD?=
 =?us-ascii?Q?CkgBb/ymur7wIi+z1CrkA/f4dg/fbzbFT6vXTAJ8J9X2NSPe408vJm3IAhfS?=
 =?us-ascii?Q?hOAC3/zteNxAwlT/1LivMlCSauFYrIWaFnwYFYZRKgi3VYNolMyxPNiTgq3d?=
 =?us-ascii?Q?EwOmOYg2UI9kA7EW3v7URXtQNaZFvbm3kw76B/H8+AbUCEZhppwUE0ppyr0g?=
 =?us-ascii?Q?t78d5nE6htCHn6COHj1NqcgiK/3Tv3WwirVHWtI6pRsX1EiKyJzf7RFnkO5C?=
 =?us-ascii?Q?wsW0DPWJCbWIJyFhGWDqXrcoXqLUpO3Mz1w29jrEM7FdFBZLlVVHuh5ZfuVU?=
 =?us-ascii?Q?fE/HWy6I21E+bGicFfcrOSoRLOT2LE3St+BbpBZS8Oz470HKB7V8f34tHbjh?=
 =?us-ascii?Q?VRtj2nmeWkVKn5h1RkZF3vuz/swQmkEX4o9SYTNKC6VgAKKwuIkMVic0YXbp?=
 =?us-ascii?Q?cNec+3YiH4Nd0Kudp6focnoXp4MR6Z9ZVvqg9AFyDq+b+nNjpmH+g5F2VBgS?=
 =?us-ascii?Q?pkD1xA5zEnJbbsiXtXPLMLyzuzWZKkJylR9jUi6f5ytjubOboUrfSlCUd4aP?=
 =?us-ascii?Q?QjaQmPF8AxsUhdMpNisxy4ycnq/FsB+nIU8vMrLsUZLfp5Fc2abYd6DleRbZ?=
 =?us-ascii?Q?mLpGneDigtuVq0B6CPAgoo6LwuNLlvgyyiQdYXhr0n2uBdCRQR1YtqqY7Sov?=
 =?us-ascii?Q?0WQH5lQJku+T10bzG7o9/hePYDF7ayKqXMpss9C5yXTXdfxZfjM05zEilEj5?=
 =?us-ascii?Q?zYm0IsKcIEJBtjYuqSCCpNiWtCWo++HkED/BCracu8S66cur6je+H5Ea046c?=
 =?us-ascii?Q?zBk5xdPEqoOBH2NjRP1KPdWAOBViDEnSlYeaUZxbU8mhX/c+5aejA7c+WyB0?=
 =?us-ascii?Q?Z+cA0r5A/bgqfLdxrkB7f0MRd0e6bwQ0E1O+NgG2zeXgK5v8UuAS43qaTKT3?=
 =?us-ascii?Q?es+XcsriWFiqcqHMWHzfgJqfrlgPZ6+WZHx1OGFuiQUxcArUPOFd1vSMdnzq?=
 =?us-ascii?Q?ibiNe9fcv+gzR8gcJY5pwI8BRchXqWU9vsoWX9YS+iHpquF6sq1uxWc5HJUD?=
 =?us-ascii?Q?Pa40BnScSnsvbvxubF50bvBEbcgG0UmIm8SlmSOXan+6x8aKq6BOmdM6dpzR?=
 =?us-ascii?Q?nmaRNp49F/oeO1SScHEm12k7q49Zm11sRqd27kNYLNeoR4jNPBivjfIAhqgL?=
 =?us-ascii?Q?nc4IuwVly5Gsbkfs6Q72zPC0KL+4wam+/2VgEeQB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4939e6-e81c-427a-5f3b-08dde566c9c5
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 12:39:39.3648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuSQpz0ATcOCL87qhrWQj58SAbNkxO9uZ+7dPUMZQGRgWDUbv5ZTwdEG09QeisxUKauMzqTv+O6flJSKvd1kIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7285

Change "ret" from unsigned int to int type in mt9v111_calc_frame_rate()
to store negative error codes or zero returned by __mt9v111_hw_reset()
and other functions.

Storing the negative error codes in unsigned type, doesn't cause an issue
at runtime but it's ugly as pants.

No effect on runtime.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/media/i2c/mt9v111.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index 6aa80b504168..9d724a7cd2f5 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -532,8 +532,8 @@ static int mt9v111_calc_frame_rate(struct mt9v111_dev *mt9v111,
 static int mt9v111_hw_config(struct mt9v111_dev *mt9v111)
 {
 	struct i2c_client *c = mt9v111->client;
-	unsigned int ret;
 	u16 outfmtctrl2;
+	int ret;
 
 	/* Force device reset. */
 	ret = __mt9v111_hw_reset(mt9v111);
-- 
2.34.1


