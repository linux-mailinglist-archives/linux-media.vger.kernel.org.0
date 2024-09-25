Return-Path: <linux-media+bounces-18538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4251F98536B
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 09:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A17B1C2349B
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 07:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6110D156237;
	Wed, 25 Sep 2024 07:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="haH670w6"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2082.outbound.protection.outlook.com [40.107.255.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE7E132103;
	Wed, 25 Sep 2024 07:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727248199; cv=fail; b=iArUVszNz3XQ5rqIW48ZrqZwQh+fi8qNTK/1Khg6zpjqYrcIqkLtH7cCsrW7hLYVbMSzCXpWf6cmYNuoM6TBa4NOuul/BPf2t3sE40UTlOLqegWM4JKzJeE/8m3oWlYp5H6ZVjgnsLONEQKioTfJpvDk4s9gi7aLFsaXmiVbiJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727248199; c=relaxed/simple;
	bh=PRXcH/vCK6kajm/wN5ztXlb4KyV7u89aPADsKaoITaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=I33LIzKixra+jLKf2PUquTqrGWplQX3p/cEMAmx9iCECGmmf5KmoizVELvjbd13kFZiRDi+V+1Av4gtXJlQ+VQyQicQJxOmLldd5OkH4XNZzANVM5sJ0BJRZKiJnEGeVHYofhoAnyAPnvdVk1s0imTYORZMzxa/ailpsGk2322s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=haH670w6; arc=fail smtp.client-ip=40.107.255.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXEygFBWBqICFLjZfdtxCHrAgKQToJludB9wgWcib/9e3YHFDY8nXu63T86d3NY/HxPbjPS5HaITzrgkEWg3YZBmUs6GXk2r7rDvEGFCa3OaGiFLiUsj7cvq5vsk+b5u+HQckOAebshqLWhU0aoWtbvanrzTj7MH+10Py33YxgCtmP5m74GJkivDOz2hRmtbYp1ORyXCtP9SpGuRtZNUWxgvvyt1dltfZQ86dZoPWqdfF3j3rbMEz4ISWR1vv3BKzzUHqGIptvrwDS7WK6Lz3DCB+BXTB3IJt+6vbtjPMgEclXIwcHYnBXqzNCB++cy3T8bjDM4AFKpbzq+Q685pHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLMkHLK0mKWMqok5JcQDcXoi3eGIlWQL3FDHYTg6RDo=;
 b=R2s1VOmkAn8wIaoPC+6mC3+ZexTkGyLXKuzULGadM/BE2P70xDyFEPXrGnZbNsP71kC2vi1859SAucpqx6UHZmuCb2q80mB1gDGPnJBq1UMAnlck0+PQ6T3vS+3JxS0it3JKQSJ14mTNBd/iq33BE93rdVMfRN0xqbCam8TSQguFHT/kl9Kngd6QDlxS+B2yjowT75eznkuoCUXULypI8wrLMK/KfQK5vrsaadBjPJ33ojDhujplGVd6CIiXeKdFEpdbmm7obRat8QcxVsfB4PekzwlmUwKHozGXu/DzpQxWvU1XYKh/9JAcdHVGGa0f1+ZZGF5/6826MRjelIuaTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLMkHLK0mKWMqok5JcQDcXoi3eGIlWQL3FDHYTg6RDo=;
 b=haH670w6uu5dk4jOJaujXx2DD5Kxnv1BIFhncAkKohGKG9/hC0/jP+w8ypx0fTkY1IFvG22xL3O2IJ15DPKb3pOQaciYvFYcmvnmtFjAH4kP1+bDeE5rJfvwEVWSgaUfQqXi2aKsuc+QLW51Vu2TVMzGIPfU4J/7ZAU8UnRNFtQe72a4/b4jCRh1wH01K2BzC8sQlLt5Rhi+HIzJpjlPlhX7Je00FYVY3vnb80Sl3QDBwcwg90QJWfOh7GrxnGjfpHT56mcfkoYUlyxcrBi4etH0uOkzEtzlNPkg2TJA/vBC2zImsTStpCDo7eMWvdlPoz0n7YO0K+PLCJ+pkk8N+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by PUZPR06MB6102.apcprd06.prod.outlook.com (2603:1096:301:112::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 07:09:53 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 07:09:53 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Akihiro Tsukada <tskd08@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] media:tuners: Fix typos in comments across various files
Date: Wed, 25 Sep 2024 15:09:13 +0800
Message-Id: <20240925070920.3304189-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|PUZPR06MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: 4401cfae-47bf-4540-7aa9-08dcdd310db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h+C5vHFsQ9Epujr8f450oH8DJfwTWbV1J+yR/6y+widcA2QsyumLMIkxzF6B?=
 =?us-ascii?Q?KW+RAjq/xR2xjUmAZp6HWmsZyaQ4nTx5KCP3wtqcRvdoSZ6GQj3Z4Z7l3yu1?=
 =?us-ascii?Q?zpYvDz3XaeTFlQGQjIuaAvGmhw7dCpyNIYevaz1FYPyv5Uom7UYVVbZrYGcr?=
 =?us-ascii?Q?qr7NGMAFISEo6T6+1hacKbXZhJ1v/F+3o5Rx0CTBghffydSQYXi4V9ZOQGlF?=
 =?us-ascii?Q?qpvx3HwJNDIteYlcQIqLiBjRLHEsL3VA7PWW61zucl4t8XEGNNGdBEUCehFE?=
 =?us-ascii?Q?FJ+cIbwo3EEx9zWRUFgRIEp/0dN0YOPlZ0+Ynt+5ebCk5j44xQ2rE/+HIDRA?=
 =?us-ascii?Q?wcLNRR+wX8ZeninkQm9c+V+2T9TEk0eezI5RkOrY0buLvQ/gqWxFdrAkxkL0?=
 =?us-ascii?Q?O3siiAujyzLFUvsdJ9RfswyC3upevsmlAhn4mjvzfkMl7krPw1PVMDzqXiZD?=
 =?us-ascii?Q?5ZrJ/iu0BWolHuSPmx/Hw9JLaBB4Y/blFGsvo90UKhvTuNcE/4elqUYo+Vo+?=
 =?us-ascii?Q?rRSuLG2jQwsuoelHiSz1Sn6D9YcMI37qhEfiJDfGvDGrdIG7IuDSmx+450hv?=
 =?us-ascii?Q?zX124y7wNCRdcbHuYNZq2x8jsktFwV5XTa9epTzBmEdNn8Zbh+/tnmrg0m4A?=
 =?us-ascii?Q?bRYCoRivJB+pB39Aj6wYT/skodijPqsTqu2yGw66+4NtdfDbT8HwH0nBLEyb?=
 =?us-ascii?Q?i51KNB2YCaGPrHE/dTpA6hjqVWuzCzvgHxqg4ZNEgwFuAZXB8BXu9+VLf6Nc?=
 =?us-ascii?Q?0mMqArBHzcnIdapQd0xHQSVGBb+4vq1FeaPuzKhWklS8BqZpvBBz34gN1cT2?=
 =?us-ascii?Q?byAosnbcd0ZdolsVW5Dg10MyiTurVRMYuUMNrFsLDC1XH0GT7xDV2BJytJZU?=
 =?us-ascii?Q?0jIU57SGmZTC54vPi5dmrC6YMCizdGpGP8qjovx2afEKoRBhArm23oHfHvld?=
 =?us-ascii?Q?19ZM5DIIYBRssidov4YC2t33pGogQFwkKqan6ljAku34LPrqKlBjNvMQuA6M?=
 =?us-ascii?Q?Qz5labsNJEyqnNSC0IoXmcJNmxThILzP5XuRw0pyCedPF2IGctbbsIO5AUNu?=
 =?us-ascii?Q?KkRJ78ughlFGtc0CcLOtIwuOXBxtghI6DeKIPjFtpkW1za/3FSYZ03UJnwQ0?=
 =?us-ascii?Q?UmPggvXKU3pvMrtA7MkQ08/TM+x9E7RUbU2A6S00HnFqxFtMhYaeaz0w7oAi?=
 =?us-ascii?Q?gnCUSBxEzjPJZoq/8YZaVBLfWr5JzbnzXiGJEm8heeTmM41Zq2Vl/lPszmOy?=
 =?us-ascii?Q?FZnL3b2035YvOu5v/ZsQIMno7WNJM2teKLNQ8J2+ZxrEJ5hUVA25Q3TIrlWt?=
 =?us-ascii?Q?OMrZBvXE/mn6E6FOiFY9L1OozmSMgZRnt3ciOYYpyqkw1KlvNpj0Sw4cXXaB?=
 =?us-ascii?Q?gYY1f7I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+qNxeB7ofGgzrjfLLoltQXghIH2mKePePci+/pqKLfg5qTo4ukIXJ4McYQWp?=
 =?us-ascii?Q?9WHyWTN5h17uXa+2eCIh+H1L+Vce5BxMe/H1rBKPYRyQMW6bTVczsXo//DXV?=
 =?us-ascii?Q?pd9EguzkaJANOgC5/APt5k5hO9Y9SosgnPdMZjNrvzEdBkbzAoxAD0+7uP2v?=
 =?us-ascii?Q?GaFahOPHZ1uRmV7ueFRXGQJHchvwuyzychCU/XjTVfZdRRvbzjctQZ7RBKdX?=
 =?us-ascii?Q?+zYtn16m3gr56Vz0jefMzHi96U1t+Zr5SXDUsTive/NqD52KymNXmh0zqov0?=
 =?us-ascii?Q?0FLBLQjYki6nltIOZpY5SfLhKj0MA7OeiH7OLNdfldxXiTaHwa1WZYk3vLH/?=
 =?us-ascii?Q?rrF+FgpaabanEObvYjh9tLUFscqDCf+pLURZ+0ugxgUTs9zEqkfVC+AxkNPs?=
 =?us-ascii?Q?d6N4ME+Jo5eN22xBtBxW97dcEDAwBd1ua6dqddAZs3G1HZ76Uk5CEmxyRrxY?=
 =?us-ascii?Q?dzwHgidZoon0w9Nk4EZbajRnMJzMlZDFmCyzH1rUBUWEtahG9knLvSMYe/iS?=
 =?us-ascii?Q?nCLV4qVJ8QMiMuupHeYhvqI1y7Qqb0YB0uf37mwUBT9MHw0yuQmo2ifOG5rb?=
 =?us-ascii?Q?C/lD+dL7pEUD7TF01Rtt+WLQU3v79ZDGoObnfPCATWeqpbNF2zzoKEh+N5Ww?=
 =?us-ascii?Q?HzTw296lsTMOVgqCA1g2rspnJYCjCkICHiJq8E9L4FQ+rUKcI3iHNEr8jXUu?=
 =?us-ascii?Q?lPQYs1wrNwoIQ3Ww1ObzzRC+oBP2/sQZiDFGlpSMLrHgII3xpZGpTrXRfX8O?=
 =?us-ascii?Q?CNEY4O3H4IFRKBrt8EOkt2XgeTXRJaWiFC4CtR0J+3WwFCY1pGrd4tf8b68D?=
 =?us-ascii?Q?pn+f4LclRCEHpJTi1vd3R/W+l1AqOVLhVhlyVxwHtQfDIxdHAgkjTNRqd8iZ?=
 =?us-ascii?Q?cmLdZDQweMNrr3nu5W8dZlHMVXcBxQwGW+67OuFwQL7JdUARXi4ZDWM+J0oM?=
 =?us-ascii?Q?4pgu/NV3K37K7PysBswAV6UhxjZvyuYnMsQ12lkUEe7HHbiZDaALdzNpEoMy?=
 =?us-ascii?Q?nn/xSAS6jwCvz56bQoLG5ecqLxGrcwxeJRQIeSOycRUjKH0ixqR0NuwD+1QP?=
 =?us-ascii?Q?3dvuulD2rvfMu1DBhQIocoXa7E2IUbETYvOlQmQ5YfvFM5hYNWJ3MwgZQBdb?=
 =?us-ascii?Q?RoIaXO5sKUZS6SruerW39+hogPkSRe0lxL2ILknimsLAwSSU3piqTpe3M14Q?=
 =?us-ascii?Q?qQeeZlUOZPmFdrNbccPgBNqV1iqOAkYd5v2ZET8W4Ve/7gvi+Ryc6YF2moLV?=
 =?us-ascii?Q?3FnKGht7rl3+qw43klyF0LJaub+5YMAIE6onkrRpHKioHdSIxXL1sqgRvY3O?=
 =?us-ascii?Q?wknJQmdtXcJjxLql3ufoPBSrMAgftt8G7cp7wgNuZDkABeWuxX0ClbZqEexA?=
 =?us-ascii?Q?rFfpjwjVIe4ZgeiFSmICz8etAOfPkr0fVdexGJIIytCX+IFYhc11wdU1Roqf?=
 =?us-ascii?Q?dwkcS+khRTkh4li5PDjgcA2llpvsiGQj0V+SRdK5JLPUM7o2xhaC6huXtQjQ?=
 =?us-ascii?Q?rpmHQKASyQ5pi8/9ULM5UjftGsUi5NHELu77xm54+EEXA+rKk/94dMBIXYs4?=
 =?us-ascii?Q?c3tZ1jz/SY63patudsE5clLLVtYe8fPlK77owcLP?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4401cfae-47bf-4540-7aa9-08dcdd310db7
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 07:09:53.4360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PB9RxANT75VdPwZQtp/w3Nj5OYxjJTSy5+q65rqkiB+Q5G87ox1sSSaP7E7Fq5pVn73dzo2musw+EqPY/fJlqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6102

This commit corrects spelling errors in comments within
the media/tuners directory found by codespell to enhance
clarity and maintainability of the code.
This change does not affect the functionality.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/media/tuners/mt2063.c   | 2 +-
 drivers/media/tuners/mxl301rf.c | 2 +-
 drivers/media/tuners/mxl5005s.c | 2 +-
 drivers/media/tuners/tea5761.c  | 4 ++--
 drivers/media/tuners/tea5767.c  | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/tuners/mt2063.c b/drivers/media/tuners/mt2063.c
index 6afef11a49cb..2c8ce74ddca4 100644
--- a/drivers/media/tuners/mt2063.c
+++ b/drivers/media/tuners/mt2063.c
@@ -1476,7 +1476,7 @@ static u32 MT2063_CalcLO2Mult(u32 *Div,
 }
 
 /*
- * FindClearTuneFilter() - Calculate the corrrect ClearTune filter to be
+ * FindClearTuneFilter() - Calculate the correct ClearTune filter to be
  *			   used for a given input frequency.
  *
  * @state:	ptr to tuner data structure
diff --git a/drivers/media/tuners/mxl301rf.c b/drivers/media/tuners/mxl301rf.c
index 7c03d4132763..3b61c3afed18 100644
--- a/drivers/media/tuners/mxl301rf.c
+++ b/drivers/media/tuners/mxl301rf.c
@@ -64,7 +64,7 @@ static int reg_read(struct mxl301rf_state *state, u8 reg, u8 *val)
 
 /* tuner_ops */
 
-/* get RSSI and update propery cache, set to *out in % */
+/* get RSSI and update property cache, set to *out in % */
 static int mxl301rf_get_rf_strength(struct dvb_frontend *fe, u16 *out)
 {
 	struct mxl301rf_state *state;
diff --git a/drivers/media/tuners/mxl5005s.c b/drivers/media/tuners/mxl5005s.c
index d9bfa257a005..0e811c5eae6c 100644
--- a/drivers/media/tuners/mxl5005s.c
+++ b/drivers/media/tuners/mxl5005s.c
@@ -2639,7 +2639,7 @@ static u16 MXL_TuneRF(struct dvb_frontend *fe, u32 RF_Freq)
 	E5A = (((Fmax - state->RF_LO)/1000)*4/((Fmax-Fmin)/1000)) + 1 ;
 	status += MXL_ControlWrite(fe, RFSYN_LPF_R, E5A);
 
-	/* Euqation E5B CHCAL_EN_INIT_RF */
+	/* Equation E5B CHCAL_EN_INIT_RF */
 	status += MXL_ControlWrite(fe, CHCAL_EN_INT_RF, ((E5 == 0) ? 1 : 0));
 	/*if (E5 == 0)
 	 *	status += MXL_ControlWrite(fe, CHCAL_EN_INT_RF, 1);
diff --git a/drivers/media/tuners/tea5761.c b/drivers/media/tuners/tea5761.c
index d78a2bdb3e36..425e9fd3f3d4 100644
--- a/drivers/media/tuners/tea5761.c
+++ b/drivers/media/tuners/tea5761.c
@@ -46,7 +46,7 @@ struct tea5761_priv {
 /* FRQSET - Read: bytes 2 and 3 / Write: byte 1 and 2 */
 
 	/* First byte */
-#define TEA5761_FRQSET_SEARCH_UP 0x80		/* 1=Station search from botton to up */
+#define TEA5761_FRQSET_SEARCH_UP 0x80		/* 1=Station search from bottom to up */
 #define TEA5761_FRQSET_SEARCH_MODE 0x40		/* 1=Search mode */
 
 	/* Bits 0-5 for divider MSB */
@@ -132,7 +132,7 @@ static void tea5761_status_dump(unsigned char *buffer)
 	       frq / 1000, frq % 1000, div);
 }
 
-/* Freq should be specifyed at 62.5 Hz */
+/* Freq should be specified at 62.5 Hz */
 static int __set_radio_freq(struct dvb_frontend *fe,
 			    unsigned int freq,
 			    bool mono)
diff --git a/drivers/media/tuners/tea5767.c b/drivers/media/tuners/tea5767.c
index 016d0d5ec50b..ef4acb1f1bfa 100644
--- a/drivers/media/tuners/tea5767.c
+++ b/drivers/media/tuners/tea5767.c
@@ -44,7 +44,7 @@ struct tea5767_priv {
 
 /* Third register */
 
-/* Station search from botton to up */
+/* Station search from bottom to up */
 #define TEA5767_SEARCH_UP	0x80
 
 /* Searches with ADC output = 10 */
@@ -183,7 +183,7 @@ static void tea5767_status_dump(struct tea5767_priv *priv,
 		   (buffer[4] & TEA5767_RESERVED_MASK));
 }
 
-/* Freq should be specifyed at 62.5 Hz */
+/* Freq should be specified at 62.5 Hz */
 static int set_radio_freq(struct dvb_frontend *fe,
 			  struct analog_parameters *params)
 {
-- 
2.34.1


