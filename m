Return-Path: <linux-media+bounces-26600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C76AA3FA4A
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C53743A71B1
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A8C21765B;
	Fri, 21 Feb 2025 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="S+3gwj2g"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2701216E01;
	Fri, 21 Feb 2025 15:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153416; cv=fail; b=PmEGPJj9+7+60IrFwm47WUsABsug/puJuBmmy6EhXwK9ieGmj1H92a2MRMi27LDZUq7mkTjtZLZ4+zIWq36R1L2/L7zp43DBl4ViAgvJV/jrXg/aLjZKzEvkCH1akxYQZckcqdrtgPQlA9LoiLl3NZZvhtf+mjFXmnhOjpH6n9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153416; c=relaxed/simple;
	bh=slh3G2oieQgOUg5Vt9FbUp4o3cMZXXgHJGb1/tpQk9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gj6UtHuR2YtC4SQxMxTv2OH5y2qbdsub71+T7+N3BnS96NW57cH97Ppb/IUNkCLiasUep0Bh1aoUOck9jI5xp5OgP6FnFbD0EMqJSAeq7PY2Y5BtoJoOkJu6vpZa47kvKnMK1FSHkxlkKcD6afLFoOPAaeqHJcBYiGbzBAlWXz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=S+3gwj2g; arc=fail smtp.client-ip=52.101.125.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNP1MHrgv5NFWYK3EAZP7aCyetPWY5YoeOPsriGsJY5VpfXj/kvb0nMY1wU7uB5VOmxH5AGo08ojq3w+9aU/MKNgtyS9CTrL43CJTQjoWJCvDO/W/EQQ+apjsjuPaJeKukOMPbZ1fXU8fr6Oi7T6TLaJQ9KAPq7mMaRKDodWTPa8GQuJJYi9OLXxE0/pvXigZ9CgZavJiKP6D138XlkgQ/+dgjaf9EdgoUSWqQcEPjfr2p8RWWc74UQsSTnj9rpkygMK8d8RFZ0HUy4tfniJBbXSzhbby+yHfcLMAWuLofjARhhTWJRzDHYPpbfPaSmntK4Pn8pLgolVAEJZRtKL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8NpoojfVYRTwDwpmwwW3haaNs8+dqmsEy3CQ7ATX0o=;
 b=o7UnVC9GfvBAo58da4hgidlCv03pZHPTVcjQMJ3EP7B6AT/3FJ8WISie5+16rADQyvlYRwIRD3rhBQnS8Q2oKv5BD3NAQPxtladjmOZ+sHTALWJ/kXN8hYHO7JzF6ePTgjUgydWmm+AELjbFXBwst5/1nK1jHekHiqYyKtlkNJCUfCIW8bNngiR0khAvzMJ8oI/sv64U5gsYJPdwgry8dBU/0s64JvTFFGw8u3IjPZ7xWb27eWvyb5KZBd7sS7IlXqKlLag3T0e9sFVBPYQz0dz8i0GzXvXGxSSNiyGC05tLiWiDGnsKhNJTQL8sJGfgVc3CV6PQrwFAsojlCBwzEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8NpoojfVYRTwDwpmwwW3haaNs8+dqmsEy3CQ7ATX0o=;
 b=S+3gwj2goKVr3TPxJth6MZAFwF1YCdfeAwjqxRIXT0CalCxfgIAza2z/ZB0UHxxdupuj5Fiv4Zrhr4DZ09jA+IvoAuFdpFxY0uVaCB1mEIFqMkh3LHfL41ua326eBDSVUULGFJ/Kkb1yW5sqna6DPUYupovsDam2YfZ/Mmyq7YA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:56:51 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:56:51 +0000
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
Subject: [PATCH v2 07/18] media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
Date: Fri, 21 Feb 2025 16:55:21 +0100
Message-Id: <20250221155532.576759-8-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b521cfc-99b3-4f49-7ffd-08dd52905b48
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xkY/pHjfMd27qConoW5IIvTVMbknrOBt/ZpGruQ/y7FexmOc9Bq9gjHBSqTu?=
 =?us-ascii?Q?3YHBsRkKtrKKjhCG0oAg6B7l20DRuQZ3Wx22UfW2daeKJTfADu3bWTGfXoQJ?=
 =?us-ascii?Q?vdfNgqvNv0rzi/o4rGmoaOW8YDM5i6a3qYlAYFVGUv3GJK3M6UCEDNee1tQ/?=
 =?us-ascii?Q?Ew2c8VZr2iDtDDBlXr33GF5nkWqqvuC4aPOhaYj5n5dE330arb9J5B+AMxFO?=
 =?us-ascii?Q?Qz6KKv1M445s6Jz3w3KHE8+xBCTM8KeQfe2DKMVcZmwwbl1rLx3MBF5Ktfsz?=
 =?us-ascii?Q?YiEIbPvGIyZQyDCbUmDIOcOK/9XVV4HZ+BP0OlBFVFbiZmoc7MnphQx1xQNx?=
 =?us-ascii?Q?AI32CbXJIk4Ar3XoiNF2yLyzqsZ6mu2uftKFUY5Kpy/VGhBAJrvnBx8xJgmd?=
 =?us-ascii?Q?vuvHd+zyRP4+WA44eei45SsIZcbXlCL/SU47rw2SZOG+PirI8k1rLkgjvHNP?=
 =?us-ascii?Q?RvjtP9ursHf2aDOHoghJesup7T/z3ZE4ZgeRcB7NfhFdpLFdGD4Ap2yfTrK/?=
 =?us-ascii?Q?I74RfOWO3fEoAcx/yE0EZCiM8SOmAdBvShhkpYmo4N8gJTM4GwdRyLyuBPLG?=
 =?us-ascii?Q?JsUdb+PGuXzHRAK6uqwiPFWhR5bhjnEcaLUPq8hTIpMF+edB2Ep2m/+IV3+D?=
 =?us-ascii?Q?2A22Z4dFoU88e7U6JjHaHOKHFQ8oW68FmmX34ivmO2jBB/NoCaENqY8o/Mli?=
 =?us-ascii?Q?pMa9cILVrO2vMr2EkoYkUp9xBw8LSR87WI3XFxfmf8oDFyZLLH/ZK206vTX8?=
 =?us-ascii?Q?Wwea64nqS3Rz5RRGgmLhV0zDztPTbMNN62+JxeaMt4DT/0ILJ7kUm+onSSOH?=
 =?us-ascii?Q?9dSueUguGl1Npkaq6un/vE2CClsKtc1VmmHg19qOgKf+29wzMpxEsXsrV2MJ?=
 =?us-ascii?Q?np9U4A3/Eh+yfcZJkM2f9ix804G7s2a/1SeUi6FYAys21Lv95m/K7A/8LoU7?=
 =?us-ascii?Q?UhDibzMkUVkRkrFj+Owy0FfqAdlh4kOVJ8pCGNlJB7BG1TBHHp6hmfs9bhkw?=
 =?us-ascii?Q?9p1iB5/mSpZiOb5Dkfy4sZhVBrcNCoQ1f3+keLxV9344DjUofb4ID97dhy7U?=
 =?us-ascii?Q?lELm7iV5v9NJfAHiCmB5Xglr2BEB97Jq5fH8z+AErz3PQ7l1mmW+lm6dVIYT?=
 =?us-ascii?Q?AsUQQpQTU5vhhM271iwiI9R80CYrnvjon7K3xuZ09+csDo6EdJW84K/WtVBX?=
 =?us-ascii?Q?E8ee2yFlJOdFfjdCsFkQ/Q+tsu/1YRZpjpENxep442YGUKPCI8bjNbCZKMqD?=
 =?us-ascii?Q?ZCfgohQgeXvRQkLvGg14Csh83LB7/lkCgA2L293IUInsBjtufiq7ylUqRKHe?=
 =?us-ascii?Q?2f2p5TPJo07zyuH3e+jBs5p/YZsDGw/7dPUgGSf7UPUttUgP2K6qDH+texco?=
 =?us-ascii?Q?rT8rziFczMUBWb0dT8161mmCrAZXVnl1JozrKwyLiTHG/imsGqX+i3eRfkKC?=
 =?us-ascii?Q?w2ce5kDuK0LOh8jzHDICajEFEAzumjU1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KigRZOiRqD6J74xFYN01twcCDqBSG4Dzu/oXLNcUtQRCzngdSw3R8vpvGmlx?=
 =?us-ascii?Q?VWWsXYYsXW9gcB8TacidAmxy1cGEr2egBMFCItBs1wYHEt0yLOegaVBuhmBk?=
 =?us-ascii?Q?5G8mjqdN5PKSS0jeYUEg3q60VwGiiSPVuusju/UvVyFCkkGZP+V60UuY2GJt?=
 =?us-ascii?Q?dPNg2I5CxsPMyEFk/kebP0z3wEU5ZD2p1H4WvVku25lxlpd0DALG/A4FZR31?=
 =?us-ascii?Q?4BqMY6qvOWL2lmwJIl96Ewr7LD8EdKYjoB7jITGsyr7MFttl36QAzvL99ipf?=
 =?us-ascii?Q?Zzhc5LlHmu1dKorq1sTtdfZN65kidzZPgmswaGziylrYwh9xldyBCPfQdLJB?=
 =?us-ascii?Q?pnSbO/T9SRLIdHpoWTavA1897DOOaOBpqZW5paKT/LfXFXkz5veAOxPhXWJs?=
 =?us-ascii?Q?ihRE7pKRdPv0TBpZoyOapwFxbSF8gSgqz0QZORDiVhS9RN+ZPNsazuK6sCP5?=
 =?us-ascii?Q?NYcVrJbjAkciak8KXb7pXiZ2jN1hq3zQ1JA6pvW2cTHLbAu+9Af76y9v1fb5?=
 =?us-ascii?Q?Bfw+Ep+lLGkcShb6o11ulNOhhRXeVJpZ15lVuaowoa+Jz/PMwza/QuDzE5sx?=
 =?us-ascii?Q?F7lbJq/3PoGxwZgUl6Rt5bDsr94caXd2T9EFypZMm0vXtjmoDscC2yhrBVt3?=
 =?us-ascii?Q?IohnA2u6MeEiEABA4PlNajrW7+bIqlHLC0Mz1AaGXm0PZiPt+rj2PVbvAyRf?=
 =?us-ascii?Q?bcvzxTOMz6XSePiNNZRfFVQ2y0G0Jx1O12iWkbg2mb6/BQfUHUsI61nq/csJ?=
 =?us-ascii?Q?rl5zxUxMM8UvdmCBvLQG+48BhEcW1q0WRolfamip63YDGKXY6JemY4vCR+pm?=
 =?us-ascii?Q?j+mClQ/QKBrpju66SH11GzxZmm5TRNZvnqcym2pY1xTtkjJ8v7xyoG8pALVe?=
 =?us-ascii?Q?tud+yAe0md4Ta5E2RnSl5q9zH8KT4zdMapifDTM0lJagXypVW8NzjtHv1//i?=
 =?us-ascii?Q?svD4g2RsDcF9flHU1EgtWrlr3SSVzwMlkn/rpiTJ3uX6HeA7lukAtnsRVZjx?=
 =?us-ascii?Q?iooPKmC2bvIDsrVuJl5FWZ6gxN2qeiWvUpY7tHTX6u4tJQEA8/Ba7XVzzf0e?=
 =?us-ascii?Q?fl46xWqPSRuGfe9pq1Bw9AFVTfwrJbIOJxSigfeSFYKEu9NHn3jo1ZMH/n/d?=
 =?us-ascii?Q?1wNvy07D5AUDdWVitdMdKpNLCIWuxyZWIw6n7rBANFSQUKxBsnq0FY2uZ8c+?=
 =?us-ascii?Q?R4JHbXov5dlc3igyVHlAUqjmpL7YQIqQLzkE7Y5y6T6Tnfw2bZNWLMPI4PpN?=
 =?us-ascii?Q?I3A+cCnzFBgj2wNcDT+RlJ0wRuD7Z6QaEJsu9Zu9HffQFxs4izw5Nv7wjLGV?=
 =?us-ascii?Q?8+8nJtlp6DAcDyMmHGdMipwK1wbok8PreusQOAxYVK9j06QfQ7Gkx3UdUXpY?=
 =?us-ascii?Q?DdfgTD3GtMeGGPUsuzhD/xtxOW/wumBGLmBgb4j61TkZjg4/WF4fUjxYeqcd?=
 =?us-ascii?Q?LDstsArcIohZRJEZ7UtJLBr9EUoimViNNqdvZp6d9TZXMIWWAT0uCouDdQx/?=
 =?us-ascii?Q?KJoMfhq5xACqn/Ew98hpfta+ZtI4PS0KpuwxqKSiVVQRlRdlY6juS9lGmEoG?=
 =?us-ascii?Q?ver3HIL55VxBg6/+4O4cFEmUZTZEFFIouWwwm8EKg6YDLYsj3tzajFz6QILX?=
 =?us-ascii?Q?9QDURYnxzveqxxqimLD29Tw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b521cfc-99b3-4f49-7ffd-08dd52905b48
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:56:51.7595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tz/uh5QHM+iPm+Qbl3jbMfl1FtLTx410mT/0ippMhPNMv43JX7RYLO9zA3a52XUKoAzgslvLWI4ZRMkcevCfSuNqgadyPpIO+aXEGon03npT7Vc4NJbF6dYiV1w8DRFc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

Use newly added devm_pm_runtime_enable() into rzg2l_cru_probe() and
drop unnecessary pm_runtime_disable() from rzg2l_cru_probe() and
rzg2l_csi2_remove().

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed DMA leak as suggested by LPinchart
 - Collected tags

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 70fed0ce45ea..eed9d2bd0841 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -287,7 +287,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
 	pm_suspend_ignore_children(dev, true);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto error_dma_unregister;
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -297,7 +299,6 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(dev);
 
 	return ret;
 }
@@ -306,8 +307,6 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 {
 	struct rzg2l_cru_dev *cru = platform_get_drvdata(pdev);
 
-	pm_runtime_disable(&pdev->dev);
-
 	v4l2_async_nf_unregister(&cru->notifier);
 	v4l2_async_nf_cleanup(&cru->notifier);
 
-- 
2.34.1


