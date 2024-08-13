Return-Path: <linux-media+bounces-16178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A099500D0
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 11:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C02D1F2189E
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 09:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78307186E30;
	Tue, 13 Aug 2024 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Mj1aQv/f"
X-Original-To: linux-media@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010062.outbound.protection.outlook.com [52.101.128.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BE217C21C;
	Tue, 13 Aug 2024 09:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723539948; cv=fail; b=lK5vRQQPKHsiJw9JMYOexIPrL5LMIf1EQRTMirQS6l/SiQgP2507a8PpenH9JqZ3urjsd6nWkwPhHkT0K+GHdy5l4mTTLCbU859Y3Uws2gTVPaEmbrSEGXH0TEUCqAqsPhDwWqdBqSg5pOFx69WZRESzG46Wcv/AHd02NrrR6U0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723539948; c=relaxed/simple;
	bh=mM+feqFfQW7aNMcxMqbtw4wpsqTA043ex04aj4psU38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LtPVhd4MCyMZJA2XJt8wLUiy1ZrLmWeimSuPeQajED7UmvC/eFttZxan/W5pIynz/424XOqyiP8AONKDnf2nqCLCM+a1wxqiGW+UgObCI1kMeBbTcUDgIjeSbMaBkSMytdXU6w0tFahBdtYUKwjv9Ou5fY6cr9f9wkBNlcM2ZGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Mj1aQv/f; arc=fail smtp.client-ip=52.101.128.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxhIclmUSF6MwLLQE4gwMf2VRzB1ilgaOgaLpZKNTD3NE8TZWTqvvW6clRERB2di4n/RznjVGeA8wc/TPGsgBp8VpiNHmfkTHcb1xI37lGAK/AmEQgmM6XOdGTzFZcaHwJyyTBraHXwGaGfFM5lDtrrkHSCMaBxQF17XnaoDCOjee67E64VTHt/DluEBZ0EXTGEifX4Np03scB3ezU8GsZrIiWTE9Vrwnqqso9mbc3fwgYUla1iyLcTfkdEaCm0wYT+1ll9sAyWr2TKBE4ktUtiaPMvFstILtiCG+Baddw+vSmcYm+gnbK98wanoPUV4kJ0c6fPXWYnSdV0mwvWHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbHVesOajLT6BoqvW7mli+cTiCaZZJnwmj1hAE6QkLo=;
 b=juwqWCNghmwStliDtthSRB3DBuYrV+2iimR0XrEKpG4+cjUNDESqtxmLn/dDzVnvUJe1S4sqPAH6WOHefF+0uuIlAy44fNTfhpqocHf7xMiH69CN99uC9FXzPWpKL5UD0TZok/H1DuSf1c6paWNd3mL/BUYe7VkBmuCS1OzKH3uXEo65HSIYp/N0BaPzJSF1UGxGY3hE71aBt0yZLy2ko1JdHIVnxHO9tNUnd0dqU7B/XaHCgQM2OYq9Zrf5up66+XTowARA5veGvVzV3wXmERTSoXbWmdruzmN4eMQhYfbPqYfDicPqEhibDXFfFMIQtCWnU/Y/G+x/rtR4eamY2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbHVesOajLT6BoqvW7mli+cTiCaZZJnwmj1hAE6QkLo=;
 b=Mj1aQv/fUVtp8iANdjyzctBJGsHWdK/tmei84W9ZBjBYHwsRh2qkNQS3uX5CFr3I7dkCsVpfY6TPZLBG7ziukXZq3ce7WMELY0OGJ+xdnosZGZrUzaJZujJZKys8BebzXDpAufCXPjvf7x82HyLQTmdE/7wlUj29wwqOE5cJaLu2NurDY7Kx1hX1A3R218FoArj6E3PFCLu/fN63o1/rzgue7xgqeC4DFolyhEpx9cKymYDfykk9P+cu9fohWsX3rUuo/MOtsFebWukpWchsVgpl4A7iQu8sgFq5VeK0Qbtr5G5mW1dmdEmQ+r3a+ZqSJzTFkCtI+XRCLtMmD118Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEYPR06MB5400.apcprd06.prod.outlook.com (2603:1096:101:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 09:05:44 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 09:05:44 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH v3 4/5] udmabuf: codestyle cleanup
Date: Tue, 13 Aug 2024 17:05:10 +0800
Message-ID: <20240813090518.3252469-5-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813090518.3252469-1-link@vivo.com>
References: <20240813090518.3252469-1-link@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEYPR06MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: a92c7671-af66-4e60-433b-08dcbb771cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bFcxMPp3TafpKVFbccDXXgjZAedWga9v5rNlnedXyXs9MdTCDo+nlnHSqBbP?=
 =?us-ascii?Q?JEPJCRQwuaa8NugNSaNjs78MmcL4kWYfZsAfQIj40VsELVP6QFxTTeQ1rrtI?=
 =?us-ascii?Q?+dordDOoa4rU0jbb3AZjJVVsl8BSQj2QFXnymRuGOyWmeAX6mBsh1azOR/BM?=
 =?us-ascii?Q?TaeOfqLc6MPZOarlk++mx4UyqXl/6HwYiOh0vW9v+a1wwLwbwx2yxEqT3Sgo?=
 =?us-ascii?Q?HTgtJRWSsDP2XTvNBfo+AS750QCH6NvjzQYfLWej1lbjfJoBqxPnBg/gozBb?=
 =?us-ascii?Q?P1g1VFY7l4WLq/Q74XEni0873wYaxV3vQOzbBOVNbjvu7h2TbPl+fOuzHKLL?=
 =?us-ascii?Q?sGu0a0krxe1LSjToWdC6g8hoNy0EyN9vy+vy50wrnpi94YlLcCqun9/+9Ots?=
 =?us-ascii?Q?rnyTInauuwFV8bMohN92qR8bsAbUFmKcmrU+P1UrYFvLY/NOj5iMxqOyQzm4?=
 =?us-ascii?Q?uTxSuu35w0uwAncF7gJGPeusULDHosvZ7sMcBWRFQJSb0pYyDKtftQN6zys0?=
 =?us-ascii?Q?g2TUjHWedtR6rPEyfMNlc0xVK4RwweUadwHGk7pFYcbDRQK1YNqMioe236a6?=
 =?us-ascii?Q?38Ogmzrm9KLxzYDHXR9u2miv19If38Uc/2LKUUH/HH2nQn6glkN2AiQGM+xi?=
 =?us-ascii?Q?XDHbLSgWh2tfCzUsDSys6xggrdeiYFM/7dKVEVd6i5pnTHXlzADxyILgHuNi?=
 =?us-ascii?Q?Xgc7jdzjUkk6C3Qv0e9Dy+lTI5n5CmsxL5196QruRDNSgWEDLT7pVkWUd4+Y?=
 =?us-ascii?Q?5f4fokEmFl/j7UcITEGOE5mbSlc8XtfXPjsIDg2sNxSs/tx0zwebPMH6flHU?=
 =?us-ascii?Q?DZIBQuNM8UMsk0w4T9l5iUtLI33kMtM8w+hL6XrVOT3/GDXP8JIgKtQLokXO?=
 =?us-ascii?Q?Z4MpL1lfyIBpfn4WUhFd0a3cuQN9nVWn+KspLeZqqz5psvk5R3yv8ks3C8Nn?=
 =?us-ascii?Q?95jg0IVTVv7TF0UGvnzuPMY+Bhj78o3WwQ4QuZODDn12j0e3x74Ycec9nCUT?=
 =?us-ascii?Q?aWhQtNW1ON5UivBZ6AzG8YK2c8rB4VG1IU/ZxpSRevyHiJTwkIc6/wS4tIWE?=
 =?us-ascii?Q?U2Nji2u495GCHhMNyEZA4li7LteFTUzF8lhaQIyqtwG0HkTUHOAlZ5cxhEi1?=
 =?us-ascii?Q?7wYpGrxX880Iz2Zv17vvFbGPUqxJ5PMt9apvAw+LHhsI9yTdBB8h9n7cj95Q?=
 =?us-ascii?Q?n+yIlSOLAKmk2wQhj5a8mObkNkzjLrPvxxyRACo+8vFHOLmpj1LOYZl0unvy?=
 =?us-ascii?Q?j3qnONpnzdCR0ZvbkQg7Vh38ZiGN7+fztQEAYK1eNQXT4bt2SLyXIYFPpCJA?=
 =?us-ascii?Q?d40i8PmU8zktHe36ZxaR4haJ9CkhZSxqHnQDlkWXiLLEBDw94F3lJCSDWFYu?=
 =?us-ascii?Q?gb8VVD5oQs8vxKaWyvX95/0u7IujqGRpvMtrNNWhSvJ9O8ZGQA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+KkAzq3wWjjbv/uEiP9+TnIPpv8s2oYDItKnLwP9SR4Q3sqViq100uixLo2B?=
 =?us-ascii?Q?Kt1ipy/yf9DlkF8AoYHzUnZ4kKnBicpzLEiEC/g77W224i21CDfX+VD9MGZT?=
 =?us-ascii?Q?/beQEoU/P/PTE3+1ii4oPzaynOEHk82Gacv0752e9CATUE4I7qsjMb9VMzRE?=
 =?us-ascii?Q?I1Z7eDJtz6ugg/Ib49A1Hb66ihol17wYPXlQFVGR2sHXRzuwhtR1UZvtiOSt?=
 =?us-ascii?Q?22TCbxxoccTtUIjURHJvjjIhRgCg8wBPFUpBiBzmMi5TAgIEAXIKrRE/qUx0?=
 =?us-ascii?Q?RCncF0a4O3P+gce+i6nk7NIrJDDcH9elN2cvu2K3tAU5/5jwvl2rZR4p9fqX?=
 =?us-ascii?Q?WDXShK8TtSj03Yjwd4sIZNmfj987T1Zq6tCSnEQ4PZOHHSuaolF6KqQnWRef?=
 =?us-ascii?Q?Csr68irw+3mhbHbHxLTuiZuUFlw5nVL66pgZ7d+rBUGng0RJ8pKgUMw7p9cS?=
 =?us-ascii?Q?bioJnyJiZiHCcnJh8BKNc1bmjdEooGkWXb6aui83BH1CnOZyLmOvQK44cqPt?=
 =?us-ascii?Q?02Frux2epqpVmLUbAR1owl8jUdFs2YdiKYmavT1lC3SnPUj+4sKwnomYoZUj?=
 =?us-ascii?Q?zcftM78DqOCa2+rt89VmrVVNI4FJx7pmhkHK1Guq1XRE2AzQdD2FTAPyy8Ry?=
 =?us-ascii?Q?cgK0V6w6zyNtfA5YE7LXvbSH5b4o8vYosWXbAScIWtbw8mYXyAudZ52WQOZc?=
 =?us-ascii?Q?da3tjVkdgD6N6rwLpSzziGzx8udd3xXll5SVdVjwTtiR5EqkK5eLpDhiycd1?=
 =?us-ascii?Q?l07k//BN5FY9uObaKiSuEyueC7MpplQZ82KteEC02LZETQREqN/bxBeEwsxE?=
 =?us-ascii?Q?TjA2OA139UBsaFY9RRnQrAGQd7zXI+Q0AV54z+aHsJoXnvp6yH2FtgS6CaZp?=
 =?us-ascii?Q?1QIYgyCuemMlNG+QkjBclVJ7jp6sgWiQ20WoEkNHDj5tokk9pkII3XUJP9HI?=
 =?us-ascii?Q?b2UExtZB+Gs4Tn2s6ZcXXgDByKzJ3ahSmix3QRstRa0VuJK0tL16Ydlv/MAG?=
 =?us-ascii?Q?UhsM8+25eGed592jw8Uwtn/EeAWeOHSP0PAT3kx2n9/DjkdCCke/YB4l9XLp?=
 =?us-ascii?Q?D+bGjhA3v7RA0DZZs/yuYUdEa2D26V6/hrkm1/8dYG1PEnTJMeQGP0JzG/1L?=
 =?us-ascii?Q?f+yKHwoLAARp7Qo4tb2KmS5NSu2Y2r9Jgm+usiQ6DgO/R8FOsQOoO5QVxZNT?=
 =?us-ascii?Q?ZHffYgkW9ExyDoYogbP6WH4ml/kRdqVd55ZD/wDxPfOT5Ip5IBxbJ1IGnWmw?=
 =?us-ascii?Q?rGNXXwc2UPqIDNxpliRVhcd+35CKijuQ+CGVSQ1endWi6sfR1FBej1PuESl4?=
 =?us-ascii?Q?MguVehDc9mfQIirnoIVwqTIkweBZWQSxvsmFpbG+tfySBmdjm4F45aR1a3ls?=
 =?us-ascii?Q?uVf3ltc9n3b3F//FUf2/jnZ8Hw2lqjzGPwcdWi119LKNVY6YqUJvZjJgm3Q3?=
 =?us-ascii?Q?vslszy+SlzGV8TxgUM5pw8qWr7CHNX4RSszSu+8AF3s9nvJhZ5v+pzA9Lqt9?=
 =?us-ascii?Q?G0Ni493QtK1qZLK8JAwl4e0mK3wRN5MOlU4y3sOeYKK4z7JpJvSSAzJA7tAz?=
 =?us-ascii?Q?h/j+VNPOPRuTud924OeP3C0UITRw4xc6zt2MUswt?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92c7671-af66-4e60-433b-08dcbb771cf9
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 09:05:44.2639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vl3vCJQZuX52alBrZ51/bb1areNmsnRthrUHvuG+8j0WB0/tG9eOZEJkG/Q+7DRalCY6owxJzcFcUN6hx7u/Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5400

There are some variables in udmabuf_create that are only used inside the
loop. Therefore, there is no need to declare them outside the scope.
This patch moved it into loop.

It is difficult to understand the loop condition of the code that adds
folio to the unpin_list.

The outer loop of this patch iterates through folios, while the inner
loop correctly sets the folio and corresponding offset into the udmabuf
starting from the offset. if reach to pgcnt or nr_folios, end of loop.

By this, more readable.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 65 ++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 4ec54c60d76c..8f9cb0e2e71a 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -296,12 +296,12 @@ static long udmabuf_create(struct miscdevice *device,
 			   struct udmabuf_create_list *head,
 			   struct udmabuf_create_item *list)
 {
-	pgoff_t pgoff, pgcnt, pglimit, pgbuf = 0;
-	long nr_folios, ret = -EINVAL;
+	pgoff_t upgcnt = 0, pglimit, pgbuf = 0;
+	long ret = -EINVAL;
 	struct file *memfd = NULL;
 	struct folio **folios;
 	struct udmabuf *ubuf;
-	u32 i, j, k, flags;
+	u32 i, flags;
 	loff_t end;
 
 	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
@@ -315,22 +315,21 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
 			goto err;
-		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
+		upgcnt += list[i].size >> PAGE_SHIFT;
 		if (ubuf->pagecount > pglimit)
 			goto err;
 	}
 
-	if (!ubuf->pagecount)
+	if (!upgcnt)
 		goto err;
 
-	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
+	ubuf->folios = kvmalloc_array(upgcnt, sizeof(*ubuf->folios),
 				      GFP_KERNEL);
 	if (!ubuf->folios) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
-				 GFP_KERNEL);
+	ubuf->offsets = kvcalloc(upgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
 	if (!ubuf->offsets) {
 		ret = -ENOMEM;
 		goto err;
@@ -338,6 +337,10 @@ static long udmabuf_create(struct miscdevice *device,
 
 	pgbuf = 0;
 	for (i = 0; i < head->count; i++) {
+		pgoff_t pgoff, pgcnt;
+		u32 j, cnt;
+		long nr_folios;
+
 		memfd = fget(list[i].memfd);
 		ret = check_memfd_seals(memfd);
 		if (ret < 0)
@@ -351,38 +354,36 @@ static long udmabuf_create(struct miscdevice *device,
 		}
 
 		end = list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
-		ret = memfd_pin_folios(memfd, list[i].offset, end,
-				       folios, pgcnt, &pgoff);
-		if (ret <= 0) {
+		nr_folios = memfd_pin_folios(memfd, list[i].offset, end, folios,
+					     pgcnt, &pgoff);
+		if (nr_folios <= 0) {
 			kvfree(folios);
-			if (!ret)
-				ret = -EINVAL;
+			ret = nr_folios ? nr_folios : -EINVAL;
 			goto err;
 		}
 
-		nr_folios = ret;
-		pgoff >>= PAGE_SHIFT;
-		for (j = 0, k = 0; j < pgcnt; j++) {
-			ubuf->folios[pgbuf] = folios[k];
-			ubuf->offsets[pgbuf] = pgoff << PAGE_SHIFT;
-
-			if (j == 0 || ubuf->folios[pgbuf-1] != folios[k]) {
-				ret = add_to_unpin_list(&ubuf->unpin_list,
-							folios[k]);
-				if (ret < 0) {
-					kfree(folios);
-					goto err;
-				}
+		for (j = 0, cnt = 0; j < nr_folios; ++j, pgoff = 0) {
+			u32 k;
+			long fsize = folio_size(folios[j]);
+
+			ret = add_to_unpin_list(&ubuf->unpin_list, folios[j]);
+			if (ret < 0) {
+				kfree(folios);
+				goto err;
 			}
 
-			pgbuf++;
-			if (++pgoff == folio_nr_pages(folios[k])) {
-				pgoff = 0;
-				if (++k == nr_folios)
-					break;
+			for (k = pgoff; k < fsize; k += PAGE_SIZE) {
+				ubuf->folios[pgbuf] = folios[j];
+				ubuf->offsets[pgbuf] = k;
+				++pgbuf;
+
+				if (++cnt >= pgcnt)
+					goto end;
 			}
 		}
-
+end:
+		// update the number of pages that have already been set up.
+		ubuf->pagecount += pgcnt;
 		kvfree(folios);
 		fput(memfd);
 		memfd = NULL;
-- 
2.45.2


