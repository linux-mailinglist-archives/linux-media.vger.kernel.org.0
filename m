Return-Path: <linux-media+bounces-27071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A51C6A464C3
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C26B4208E4
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6286A22A4D0;
	Wed, 26 Feb 2025 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DbSdvn2G"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0FA22A4C5;
	Wed, 26 Feb 2025 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583615; cv=fail; b=g/+JfUhrv04y0TEySMeOcQic/NZ+PcugRD4vU0wzdAo0qrO2geEuL5ak6J2pqJlOqBfWeG0Wi4bOjRaMnnG5EaKR0mpbQd5xxw0qcCbEqXkTt6MtYxgQC5X/BUbhVEG4Fvf6Q+ulJRc9S9tsopGLA0Xh8XQQHftJ9VbINVqxiG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583615; c=relaxed/simple;
	bh=R7e8sBeHKiF4O4mbOmtYo6FhJ/lbF58edsaRTia8At4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ttM98ToxxvzqtWfM9OhkLe72rhGra/1VOnlDJcSRLvNI1n+uCZ2RdxjbJrEblQ9pRjX7I6EBgmEzgt/+st2tyaVPYmvciBIcAr4c1jWmA1bq1qQwL8jp7YoEsxvj7rDJmJznEb7jDfpGyXKkeLoA1UzLTfGXLvuPGWnh4aLxDKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DbSdvn2G; arc=fail smtp.client-ip=40.107.74.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sp4hQHbG3M4LSDFR6lYmAPksXwjL1VH/SKg4uC64bChOJMGRlacE9kKOdarzkKigaZ9wOCFfjIdoIiKkJrxgkeejLtMQIk+4FWO/fWgZKXTFrqL4zZWpoQf0i2leBiCIEPIeJrGv6Yc/lZV7CqqMQZgckn08RhHxGO0LOAjWvYyQ1fzFrzlfQSgIL38l6/IMh7PNKyTvyoiws8p6K+IqiPlJ8x6M0XBmBRd+uky1pVy6YY9xZjO2k0zrBPLwU7OIgs85vXgQiHx2QZAndPaH3T1UcErBhBQ0ZXQT54F07jLXKCF2iKn8Iv6cz+OHIXQQea7cxvMWM/nelVTUgZPqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15/v3wlFz+7cQaYOHIKZDPeGhO6EtfNUagjuSLzJYj4=;
 b=HxzvNYglFBTPRjkqX91zNqX9f4sttOXtS7gQdFMvWXX0ot01SaoZsxOzrDH5fYDdJxmy/1AwAM9+zGwEfu9TW3VPA/0ldKHzOiKc1Kub2MP+rgs8eZ5PMmLR4jqpvJNedkPnzFN+XhdVaTfdrhuHn3GsfLqKulCo3EyxuM0X8bEAko5Xh2wZdpj0HQDYFH6dLQZMahs33+z8f5nh/vx5Xbr+Uh4Q+zakdK7GNJrYM3qajXR7U0VHm4A0N3FiUJUrD4bf0vLackkn2o9+SEZLB+fCZzwltgvBR8/ogMr4eYsQLwUqR4L587DtLqIsxZxsRBF2by+hqidBDgt2hPV+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15/v3wlFz+7cQaYOHIKZDPeGhO6EtfNUagjuSLzJYj4=;
 b=DbSdvn2GYddPAJxKIqhNHylepnf6lUxEJs8oKqil7s6OgdPZvghdoluyUc1nArrq4qxVY0MhSX8d8oW6taI3k4WpwspiWTGm2bigEOhzoemJAydoNMYk3v04spjG06EdqzFpIA0eDyaVZOvyJjJq1VIaImrOIvI3Z/WQN4ExXHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:26:51 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:26:51 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
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
Subject: [PATCH v3 12/17] media: rzg2l-cru: Pass resolution limits via OF data
Date: Wed, 26 Feb 2025 16:23:36 +0100
Message-ID: <20250226152418.1132337-13-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4b85e8ab-4fb7-45ff-e506-08dd5679fe3b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3R3pJp9hlaW78YaATaA8lvMGvwzF61MRmUtDwx4A0hsVYjN14uSAF1Q08quJ?=
 =?us-ascii?Q?LKohbO1JdUzYPd3ZXgrj3K/T+t1WdXT2O9gQG94cCzep/iRj2tVoekkdGFQo?=
 =?us-ascii?Q?nh5OkjV0umZSr6znHLjqisK2/4iFgYMJ1AUxeF8F6Qu5aIIlziFli4imyran?=
 =?us-ascii?Q?9Ot0Dhtt6TQdtiL47aHK1LJedB0HqSSQxCb5XT565uz4lG6AjC1WKon6nGAE?=
 =?us-ascii?Q?uCs3VgcpBQ7wzffAFC+hv0WK9k1b0BhceFYl3vGIand+0GHbeb2cDWpIxtXw?=
 =?us-ascii?Q?yP4E1fbU3kQezgTqEXZ5I8mjNufCRP7LeBdGevKfnp/qdDhaqAKmDOmeaOFx?=
 =?us-ascii?Q?MkV8XyMJx4RuysPEm/k8F0pDHRZQH1bz+PIO+RxCmbtiZDn7nlqdm/mRGHlF?=
 =?us-ascii?Q?MaRS4YhzYw5RvHqJgHIVy4XQGgi+OFJoIvYE/fCja35z7t3Hyb87pQ9t8q+x?=
 =?us-ascii?Q?O9F3TV8Jas5gzxGqe6ir17dNnbIOHRQ6ekfUod/1nmGkO5rEZVf4Rvg6aN8t?=
 =?us-ascii?Q?jQhPE8gzk2n5VeQ0nOUZFgAX/F4nVR80/dAJbN86W/sb79Bw4RDUtUdkwZXW?=
 =?us-ascii?Q?azkvdRv1IwdON/VtuDr5A7HFKZOCLUNiGLVj+wKJ/Ul9tlry0RbLeyhEHzOc?=
 =?us-ascii?Q?cYriegsOwPn3d4tW210KtDEQIZZaJZuAwrXhjFvMmodDlEJ46KV82LOC7wQP?=
 =?us-ascii?Q?y3tiZYvpP1+ZwZtbGCZY5EugNDyZ2nwWnipFKRDgtiaIVCZMLY3HzsEisSQk?=
 =?us-ascii?Q?DiOTVLUTjxYhy+Ow5o6hREzfC3egexS+TIkBPZfNYyfqnT1vL+nLW0aCd1UA?=
 =?us-ascii?Q?cv+oXeoYpiilmUsBVBJab5zm7pbmavYHA9nqKI7ng/rItDnaQaEVIIjvqBzQ?=
 =?us-ascii?Q?wHp8DZfH6Xt4PfqZKuU8L0Flu1h3LZzkJOxP5wgxNC6A2h34i6ArEVXy6kC/?=
 =?us-ascii?Q?gbHi2hl7w8qTx/6Z8YXhIAJn/Bcx6Dhoi3QyUL8BtEm5yvlxZBKiRke9Js/N?=
 =?us-ascii?Q?ceCHJzQwQXN6Y3RraqKO7m1DNZYam6cV6lfbc9yZPyY0nWGSrJxZ1unyOfju?=
 =?us-ascii?Q?Jzpib1MDt48SdgaXmJKn1UTzKcxEDmzK8W4mpZu26kt4cFMrV+I+DT7vBOzt?=
 =?us-ascii?Q?Cj4b7N6yNje1QWipKubgMI1ZOILOqAIBcf/sLTiSSSnLBZGDFQlSyphwvA+L?=
 =?us-ascii?Q?xAsXe9nfm4f15OzcZPtJltGQYo6385jW6GSKGLzlCeR22QU4Mkvbp0CLhjhG?=
 =?us-ascii?Q?yokfeviR5Skh3Z2BAbuToco4+haDH5gzRldfjT2vQO5y0PGHw5ktbTgtGUFi?=
 =?us-ascii?Q?P72p+ZjVVITqFt6Of6aVs7vIRMeLgZDV1UNK2N7gftZeBo4QQchZKr8VKSn0?=
 =?us-ascii?Q?JQrjasj23dIl6o+TOlPH98M4IW068KStt6Bi2mMpVwJmyfILKmHkFtf1lqwg?=
 =?us-ascii?Q?bKDaih6S6ziOUlk0A/A0I8xbISB+0uRl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2h/ZrGpi2rk9X2q5vQJUEi2OGqAYhHLpUuyY5VZG+/c7k8bdYDds4F1goNwl?=
 =?us-ascii?Q?l2oGI3vut75gSz+hZ948QpB15dYlbgBRQhLJgTQLr2FNgOHvyJquxJnmtoB5?=
 =?us-ascii?Q?JU36ad/5XObOfHxnzvxHOk9o8Nxg0+iVK71OEcWtPj40TCAu+zxR/B2pMk5d?=
 =?us-ascii?Q?BubEuAyQYoGYymqWmq9P2w5V5s2St/Yr30rfKs4pMWk2SXdcVzLIYS6zMH+u?=
 =?us-ascii?Q?oaJPUegAYrcLd2JE+H3glLC3QQyuFq/iHodLJuWcZDX73tOJeVAoNMArchc+?=
 =?us-ascii?Q?mHFlULww0oV6oMRV81+k3WKa9aapPdmqTt2Pg36C87Tfgj0ba95qL5iPuyiC?=
 =?us-ascii?Q?Fpt89lsrYx//1lZ2/dGGm27yg3v6nPI5Oowgp0Le68wPEIDMnYaNILVQWCL0?=
 =?us-ascii?Q?U73838kRfn3pYp401XPwYFeL6N+NA45UsYDCJYQXFCIJ0Qho+IfGWuK4tFOU?=
 =?us-ascii?Q?dGyyYVEqHfTglSnUTbwuGcqVEbwoWTJg9EJAmZHR1sD5xIF22JxARREkiC6q?=
 =?us-ascii?Q?4/DFpP9hLVGHIPzI7sZcWWJZDCb0veKH7FTqXLU973c0TanziT5h3NrTOxeL?=
 =?us-ascii?Q?2tucom+hZELKho1kTXat41e/zgXvgWV0B2tFmLwPcEXDL/b3aEWRbhYh43PT?=
 =?us-ascii?Q?5dL0eH4qtsWYWhhwhd2AjfvL0uiqBaFeHvjRLHuCvyfUSt8JnttAO7elNWjb?=
 =?us-ascii?Q?IxJ+jRqONz4fawgSpDlCfEX/eozUmcvOwlcCf8SSSkctUwKifV5zT5z5iYAe?=
 =?us-ascii?Q?2LoYGqUceGYX6KiqXafb/Xgsy/iJ3BQ1D3nWFqtR+DqchXzd9BvGGpbhAkYj?=
 =?us-ascii?Q?O3FeOvf2hVOXGWWfz3Ik94W3mgwnpQXiReYnH9+LOViI+sxYCQBaRMtUnjY2?=
 =?us-ascii?Q?2x3F+RyCVSGAcgkDNEySWIOpEoHosdR2Pu1tuDdbijEVRX5MezRhH+9Lh//D?=
 =?us-ascii?Q?Zt+nar0YF1ONKg4ymGVynS7v8uXMnlNvDDKxX7IHVy51a0TNwK0exmyOyq7K?=
 =?us-ascii?Q?3aieUCCUomyQZy/J7+UHdCjplB/pYvBOg6BMaVeiy/WPo1A5XOEqvhV2AYjh?=
 =?us-ascii?Q?obvpE10iFo9Xq93D5rg8tdsWxo5cUGY11o750D75EUY6v5VKAiNA8+149PeW?=
 =?us-ascii?Q?m1iWEH3gWcCOVNkZvZ7Jbm/cL+ukQL9gi3p9dTizHMNYKYrcQNaBx5LkuvnC?=
 =?us-ascii?Q?UU7BcIPxrADbsoAqDrdSf1qwLsarZA8tByC8zuPvGpTwB4kmx0RYslAJA4n6?=
 =?us-ascii?Q?mTw1131sAlI9t7QnRjJgRgeBH0C6/18nOmStgrB2HyX54+wpyNlHPgRcy85l?=
 =?us-ascii?Q?yO2nekSvNMCsuy2UvGdsG6qGx2RIUFoqENRmrseTeG7/lF+UFJbF1hLwRNZH?=
 =?us-ascii?Q?Ymr29xDUuVcKshZA9t4lMMUxSKZUUbGpipIj/LSv2ojPuO7aPJhXrkaD5tgf?=
 =?us-ascii?Q?wfc4XcON+8FVOtXKy6oVegrqJGavWwpXuO2vWUgRLuKfRUqOFF8Z35+asONi?=
 =?us-ascii?Q?awS3649xziMs/nN1sZP3ukX227khvd6UkFNLD9ZWmzrhQ33jp0sPXmvdQfwU?=
 =?us-ascii?Q?RkLJqv4mvbrZ9KQBKC++8MoLdtX85DFssIuqviUuzthSF9pI65FD/r/Ms3WT?=
 =?us-ascii?Q?M0ExV93DztfL+r8jX1XCSKo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b85e8ab-4fb7-45ff-e506-08dd5679fe3b
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:26:51.6205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: md+dOmXY+VCY6uexHD9qaNFqQ1Ik9ThVVkdVgTUPxohmG7by9qLaIjqYAeZqL/EFxw3Y3XB+BNwH5Xt5mgxPQkeuftKIqixCnBZOm2KTvCVGX0CdkTjqHZPyPW7hlglY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Pass `max_width` and `max_height` as part of the OF data to facilitate the
addition of support for RZ/G3E and RZ/V2H(P) SoCs. These SoCs have a
maximum resolution of 4096x4096 as compared to 2800x4095 on RZ/G2L SoC.
This change prepares the driver for easier integration of these SoCs by
defining the resolution limits in the `rzg2l_cru_info` structure.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Collected tag.

 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 ++
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++--
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 13 +++++++++----
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c  |  5 +++--
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index abc2a979833a..19f93b7fe6fb 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -355,6 +355,8 @@ static const u16 rzg2l_cru_regs[] = {
 };
 
 static const struct rzg2l_cru_info rzgl2_cru_info = {
+	.max_width = 2800,
+	.max_height = 4095,
 	.regs = rzg2l_cru_regs,
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 00c3f7458e20..6a621073948a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -27,9 +27,7 @@
 #define RZG2L_CRU_CSI2_VCHANNEL		4
 
 #define RZG2L_CRU_MIN_INPUT_WIDTH	320
-#define RZG2L_CRU_MAX_INPUT_WIDTH	2800
 #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
-#define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
 
 enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SINK = 0,
@@ -81,6 +79,8 @@ struct rzg2l_cru_ip_format {
 };
 
 struct rzg2l_cru_info {
+	unsigned int max_width;
+	unsigned int max_height;
 	const u16 *regs;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 76a2b451f1da..7836c7cd53dc 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -148,6 +148,8 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *fmt)
 {
+	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
+	const struct rzg2l_cru_info *info = cru->info;
 	struct v4l2_mbus_framefmt *src_format;
 	struct v4l2_mbus_framefmt *sink_format;
 
@@ -170,9 +172,9 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 	sink_format->ycbcr_enc = fmt->format.ycbcr_enc;
 	sink_format->quantization = fmt->format.quantization;
 	sink_format->width = clamp_t(u32, fmt->format.width,
-				     RZG2L_CRU_MIN_INPUT_WIDTH, RZG2L_CRU_MAX_INPUT_WIDTH);
+				     RZG2L_CRU_MIN_INPUT_WIDTH, info->max_width);
 	sink_format->height = clamp_t(u32, fmt->format.height,
-				      RZG2L_CRU_MIN_INPUT_HEIGHT, RZG2L_CRU_MAX_INPUT_HEIGHT);
+				      RZG2L_CRU_MIN_INPUT_HEIGHT, info->max_height);
 
 	fmt->format = *sink_format;
 
@@ -197,6 +199,9 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 					struct v4l2_subdev_state *state,
 					struct v4l2_subdev_frame_size_enum *fse)
 {
+	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
+	const struct rzg2l_cru_info *info = cru->info;
+
 	if (fse->index != 0)
 		return -EINVAL;
 
@@ -205,8 +210,8 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 
 	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
 	fse->min_height = RZG2L_CRU_MIN_INPUT_HEIGHT;
-	fse->max_width = RZG2L_CRU_MAX_INPUT_WIDTH;
-	fse->max_height = RZG2L_CRU_MAX_INPUT_HEIGHT;
+	fse->max_width = info->max_width;
+	fse->max_height = info->max_height;
 
 	return 0;
 }
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 792f0df51a4b..93a105dec8f1 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -736,6 +736,7 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
 static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 				   struct v4l2_pix_format *pix)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	const struct rzg2l_cru_ip_format *fmt;
 
 	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
@@ -758,8 +759,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	}
 
 	/* Limit to CRU capabilities */
-	v4l_bound_align_image(&pix->width, 320, RZG2L_CRU_MAX_INPUT_WIDTH, 1,
-			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2, 0);
+	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
+			      &pix->height, 240, info->max_height, 2, 0);
 
 	pix->bytesperline = pix->width * fmt->bpp;
 	pix->sizeimage = pix->bytesperline * pix->height;
-- 
2.43.0


