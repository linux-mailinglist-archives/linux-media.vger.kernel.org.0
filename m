Return-Path: <linux-media+bounces-16079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBE294DD04
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 15:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 743CC1C20F55
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2024 13:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6683F15885E;
	Sat, 10 Aug 2024 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="T+RvZSWO"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2091.outbound.protection.outlook.com [40.107.94.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B97D4502F;
	Sat, 10 Aug 2024 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723294991; cv=fail; b=MsCacdhm+hswcOONp5h5P+R0KEsPzbDutpJ8miOgNwpALu7+YPN1CYwcsnUwWShb4kk8IWYi3hLPdKJMByyTb3Gk0E9hvBAZvWLv8MK1JNQZ2hDgkzzW0EIWQVxZ1U6OhbuaOa/ETpGFFSjccogiNWgRpmAWMu/CQlQUlC4zR10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723294991; c=relaxed/simple;
	bh=CCax6PUQJudRgfeGWjyKvrUXpiOh6wt8+DGVolxIVhM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YyBbfES0f4uRm6wWL6k3G6qdOtwPR1qjEj/1xG0MLmN2KXk8wi1G3kAQXyECa9LWfai7jAmIl8koR+1rW3ZJuzBxfKQDqmY/dvcCdNo/JqHfTF/qFbXhJuA0HX8nwh3crFKjdhvXKCQv/uRxeYBJq9aXVj9pk+pmJD9i5PegffE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=T+RvZSWO; arc=fail smtp.client-ip=40.107.94.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wH/h+FcF21w7FHpQboV3U6YYpcWcwP5CXrNokbQAv8mvyUKzl/XHeMc64Eg4SRWwBbvGNqjJ0dNAO8CPJpJNd/OLr+Z6GWyT981Cz9Y0tmp+eNkAve6G39/c08/qeTIqYvHYpkzc6QTlzcb0dls6W0QLvwRegPzvVCLzDq9BA4s3KAxbN4TvbNz67wN5NMCT7n9MicU9LNbaMK+odwgeEgf5QiRUzYgFpC+JyTsesny0+9wlEI2rBF2jtzLENyQYOYP9V80MAsp6XDKPt++JsjVk4okDNFIPR3RKhnkHy6QpEjZW/6wCf7f9FlCnSzwzscq/0sRkezv5hqksAybFNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgPNBFcSiGwGsDOLdjttGKBM7fKNio7mPdTx/h3Q3Ek=;
 b=NoVN5R6PvHVyMz8R4/SeB+8bRMmSTvsIe24qHBdWhUJxJJI6K+jUer1LxA32DfEZX7n0BlD/PaREOISdykbBnQp+CpBIGIuOIdXjD/yM5xbK/xIHB5kxTifOgZ2B6/IoAh9MDQGnziVNcPDlCbI27vDgwz26QCs8RyTtRGA0ddCxc51WOuuXqZhUsbRL6yEVzXq19X/tl/nTwP+QmJcFxRxCscwgG+B2IYSI1n/ElGPYkViZUWU1LpJsO1lB8ZYt7M0cEUJ15uolGX6xwibgj3SlBERZx9kLX5QU+qlCsuw5iChAFyNMtjuDxcXBANDuvTPmQH/FneHIFUZoNuVu9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgPNBFcSiGwGsDOLdjttGKBM7fKNio7mPdTx/h3Q3Ek=;
 b=T+RvZSWOcB6dotImvMMi7a7UNt5l9D3fsph/T91phV9cYOLKGI69BWcDzHNUcKUFoc6DBplPqBgGZeCh7+yjTFqKuME+ZJJLQCJSB/1vAtlqou6wl80ts5yij4mQqIpT77ot4tyFiWPbmgaydgYx/VwhKQrIBOxgVGK0nL6f3lc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by LV3PR08MB9290.namprd08.prod.outlook.com (2603:10b6:408:216::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.19; Sat, 10 Aug
 2024 13:03:07 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%4]) with mapi id 15.20.7849.008; Sat, 10 Aug 2024
 13:03:07 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: linux-media@vger.kernel.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: rockchip: rga: fix rga offset lookup
Date: Sat, 10 Aug 2024 14:02:54 +0100
Message-ID: <20240810130254.3338363-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0235.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::6) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|LV3PR08MB9290:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df1648c-1087-4caa-c665-08dcb93cc737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CXvg+LR+lsc1s+dP7U2S5fF1Gom22MU0NNlpaSnd/nNe7zE5FlaymncW6tIk?=
 =?us-ascii?Q?7o9Ptr1uJbmn27SKMbK77TN9X72i2/0vcwEnjlwg823IwY2aNKMZVKtdteMI?=
 =?us-ascii?Q?IZf/rUiZU1P1nlnd+RV0lL2LQqCpS9k3dYyGWl3jsXp/ZWDQVSMV1YDiVlxz?=
 =?us-ascii?Q?3UXXkK08paYdjJ/beCtwBEepRrIEk51qIwho7IkxNbFOHiY2NCWueKmkUsxS?=
 =?us-ascii?Q?V/sf72AwZfWG1a2+tpMy0BcMaUGVtCLsTEAEIjF7ElLCFHJtF+1OkwAbx0yV?=
 =?us-ascii?Q?xAMolfhDSGVovFWFWfNLeU0aGPh9rPJ65bwPntokb7sIFb56qT/308pbUjD2?=
 =?us-ascii?Q?lxkcBOadIVUbq2XccZo6nJoCbfS511nlaGE8Tx2lloUMGRsxIQggI91FVz+g?=
 =?us-ascii?Q?NZZjm91xiWMxY/nRV1o0oWcMOsQ4rpfUWZR64qadwM3vwHDkGFE6/qQKhseG?=
 =?us-ascii?Q?WBRFUR3YuRrywIRtLo7DZUNWpf6eIlZPakhkE46fp8qAaFSW8BLv1JZfaHXG?=
 =?us-ascii?Q?CSdt/TrvmQkrlPcHtvhEQy2zidu2WU09sv9NtOfW3AptdejuRzUGOWT+qEmy?=
 =?us-ascii?Q?T8/a4RHH/cSzOWHildF88aZ9idQ0YkjinEAcueYFWX12ia965dgn76MIHU4n?=
 =?us-ascii?Q?1DPSyF0l8m3N64tn1nun3H0SddJLuwtQVvWtqAZgNt5zcLrUOR5IHKYaC94C?=
 =?us-ascii?Q?h9G/DcV79u8To+A28Ud11GG7VuOc8SEFWa5bZUa9gD+77M7BWL6ctI6+2Ko+?=
 =?us-ascii?Q?TtFbpJQA9pHBG3mJ5w8e5aVPrLVQPAC6Ld6V958Mg9IYQc57Dq8mHTytpHj7?=
 =?us-ascii?Q?Y3xiI19MaaBbzqQfexou0xH5qvXinLYh2co51XTSQF+J34baLHsza+CvW0YA?=
 =?us-ascii?Q?sLa7u6rCV16rYcHh7XT1/RBUUPdfRBy+HiL+8EJb4iwyKgC6UK7Y0qGtMzdb?=
 =?us-ascii?Q?elucv/4PrSwvF3QKblnVMYwiu3J0MH3KPASREuEG7+YsyR15uU6Hgh0Ljbvx?=
 =?us-ascii?Q?bsuaKNoZxoYK8BoISAeKNc3PRl8IvewyeZ93n8AkMPDjC8vFq87K1nu/tQHC?=
 =?us-ascii?Q?b4q1P1Loorc06ADgG46fHNSfp37PkXHZ2CPnQQzjRX4wtMxNLBhCy1Vf/n3v?=
 =?us-ascii?Q?10ARB++HP/LnCV6e4uChM3bF3O/FkFvyu7MxnSm+2Tve66vyEsPYoyB6fw3h?=
 =?us-ascii?Q?hDEWKhD45CrVU5zK3zBpCaDpVGD5cfrPnNf+WwLDjyh7NogN0YK/JEs0hcnH?=
 =?us-ascii?Q?kru3j9XCzcYtu7Yu7OUpQlrlm5dgmd6wNfPce4VTYb+2rfUYUrFLhYfZyoP/?=
 =?us-ascii?Q?TbrFtCAQ6DaOZvFR0OSwcwsCnKqmtuhjVqUB+ICQMSp0UIvZCw4fQiVLTR61?=
 =?us-ascii?Q?I9dpIz4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JDG3fJFjGb3h1/QijdTKYBEjKj3y0/pL1cQ6RIYEML1f5FVFo6VpQaLTJrll?=
 =?us-ascii?Q?lV5er5u8EnfhPzA+1Rcx7f1PnA3Ut8QAGpmAC29oKjchmgK7XXdV0yYWCqQE?=
 =?us-ascii?Q?AM4xxaRPKJkgu6ddOeXAntHgeTGVZ/iHAcYNqaDLaGCJ8+cxNxSQlwZXXhB5?=
 =?us-ascii?Q?FRRt2DPoXr5wRxXfSE2Jn5Gb4vJrj9S2NGhCcbnxc2S1R/y32TrhRvltxWab?=
 =?us-ascii?Q?Si1gonzn1B35Mn+ICKSA3K//M+50nDtHckRWzs3GAoN+JAjiogV8DIMXYnAN?=
 =?us-ascii?Q?cmAAsbb6PdCZUfYFCeFjiNgWEO1189l4JkAkAaz9zAXAUAHiqhu5tbeH+4el?=
 =?us-ascii?Q?8Pey+bDEBEVURNRChdxt6MhAd7LVgOohqaX/A60pdZGUg4xwdq3babaTV6X+?=
 =?us-ascii?Q?grJ60EuALEIgoDurl/OKKOmcX34vgEJi5W1Hm4Jftuda347+RNq/L275KG89?=
 =?us-ascii?Q?4EpPneS0OnuMPqpTXIen6kklaL2bA+/qB/ipyp3AJiqBPsEY/SZwGvCnPydS?=
 =?us-ascii?Q?GzD5/Tgk+TdpHzVxWiyX1zk1N+SHB5zicnAZhBD2MGXNJk7GW1BVa71e7xAj?=
 =?us-ascii?Q?mA5SQTFR7023Hx1fLoJQQBymINnBDg09NIaIANyWPCnzZYjJDySrt6N86dkU?=
 =?us-ascii?Q?Z8pjNmY3HPFvSFmbsR4tEAgzrJ3mR+6XTrcEfWu2Du08y3ahOIzGUDzVYvpf?=
 =?us-ascii?Q?1vNgMowby9CWRqGDLw0QA/aSQalzGs8hMIUR5h2u3n4Ch56ppRqOIwnyfshY?=
 =?us-ascii?Q?47OfWKcJuWZEnbRLUUJgKCp+Fy1MlOfJV6GZQysnfwW65CuZLns/ys5pNxNc?=
 =?us-ascii?Q?bzEm85so7DOm1RyozOMjGAa0aqbysW3OjfBz55dQy5HGlcn/bJtElMVwKsBu?=
 =?us-ascii?Q?l4Wma3RdvDe9a/CWLlOcIhwhvCxJmnVNTOeVTKx44l2fpbiEbHYmUL1w4/tY?=
 =?us-ascii?Q?L7wsSq/zOmqEkUM4U0jiplckZQsFRi1HoZn2Btoa49hArxTB4+Mnb3q4ujr6?=
 =?us-ascii?Q?o+rS8otaiXGnEQ+hMAEnWOirJRDJbL/yJ6GQP3+l/bmvhyvkhlGMuVOBzvuI?=
 =?us-ascii?Q?aS9Av82/IzcIXx3MpAPdEsskIjrFcxGWOSTo3RwahK9trocaYwmqiwmPZ1ZW?=
 =?us-ascii?Q?mMObgO1p3r0xLF0GDYnzw074TfmD9lcRM6re0cE/kTQVtPtqjrGWZYNL69/R?=
 =?us-ascii?Q?HyI4qeC3orVGnfkuK6E3+GcniFDQgGxVHoJs6Ij8c5EYW3Z5scOmiTvVafQm?=
 =?us-ascii?Q?WQTvfu6JAAbhs73+9UwC3lN9bm8sREhQ1Og70TTPwrn7La6zbfdW6ubKwpxK?=
 =?us-ascii?Q?S4/lCRvsEVBI033Echs3fLBmkCdeh/1iSKCU4sDw18tNrAE51LI/sAG4GBo1?=
 =?us-ascii?Q?+7ZP4vqa3tA8hNV+KyPn3bwJuxx5N0UDNkIawbVWwXrddKZ3l2sP6kb+Qnfh?=
 =?us-ascii?Q?Y8YGv6tTGBX8jYYSJos6mUcQ4FBl9fkBOPxrv1nWeU5i3AtGal33fbAfCjll?=
 =?us-ascii?Q?mX7Xx6TjNpPAUOCOo8a0s11u0nB25b2qdWUuRll5ZEy6FMV6Z4c5j2obNAlX?=
 =?us-ascii?Q?fuqsx2Tsau33pk72HU4NygJNBDW8qN8Nifbivzz+6uNX6FmhcTq5a9p7UerJ?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df1648c-1087-4caa-c665-08dcb93cc737
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 13:03:07.3689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEdTV65q/ScwOQ+N30dll3i2HZ8l7cAquUfgq4eIY9+9432S2GjufuK1Q2PlmpBp6tqO3BXQN9Bt71MJYxJcVt+4guWbcWsO01thdz0PPX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR08MB9290

The arguments to rga_lookup_draw_pos() are passed in the wrong order,
rotate mode should be before mirror mode.

Fixes: 558c248f930e6 ("media: rockchip: rga: split src and dst buffer setup")
Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 11c3d72347572..b2ef3beec5258 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -376,7 +376,7 @@ static void rga_cmd_set_dst_info(struct rga_ctx *ctx,
 	 * Configure the dest framebuffer base address with pixel offset.
 	 */
 	offsets = rga_get_addr_offset(&ctx->out, offset, dst_x, dst_y, dst_w, dst_h);
-	dst_offset = rga_lookup_draw_pos(&offsets, mir_mode, rot_mode);
+	dst_offset = rga_lookup_draw_pos(&offsets, rot_mode, mir_mode);
 
 	dest[(RGA_DST_Y_RGB_BASE_ADDR - RGA_MODE_BASE_REG) >> 2] =
 		dst_offset->y_off;
-- 
2.46.0


