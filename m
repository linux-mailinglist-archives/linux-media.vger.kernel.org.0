Return-Path: <linux-media+bounces-39490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 387E2B21BDF
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 05:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D841B62809C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 03:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA152E36F1;
	Tue, 12 Aug 2025 03:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="rDymMK2t"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012018.outbound.protection.outlook.com [40.107.75.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABB72E2DFB;
	Tue, 12 Aug 2025 03:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754970895; cv=fail; b=nG+AR2VpSzTeinWU00FWt1CzrqBpcPYlcKGaP+A+lP81u4tHuwpcqgOAWHCoRn/U0r++L0qYkzZAF0NrJv3aTG0a6UFLbHavKxXzh4B8ZzQjZt4v9V0s5nIlDjV5RljZnX/oLMnXWXJINlf2K2HJdaUPnrCaaXxF7dZ6FIXtHSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754970895; c=relaxed/simple;
	bh=0yNFoAxoELtEZNVP6M0Gawg4KKIZbctdexaXuPYZchQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cREFsgos5EOfi1BkwfaC27PvQ8Aklm3edPHDm/kmL/WjYM0HlvjT17OqATq0P1jyNrbcChOjhHwPRpTPa1JD7qbcOBJOgVhd//b+PGiNODrJ+sqfKql/+bqFswi//H0EueZ0hAerQqoX/SOUWyHaX22HkwepIvRJDMPJofefFNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=rDymMK2t; arc=fail smtp.client-ip=40.107.75.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jI5PxcmqBKrAnsHTurPbGrbdCmZViHL+S8Sf27UiBQ6JHJ8PEMdf1ZkyhVSm/hAXqsilDpUVKcT9MQ5s3YsHentqwIOClF+Rxkma0n5PK/iuJKbcf7hPVxNqc5z0TW4Q+R1oeerOxfpofLnZiW0zJZOU/X/PrW0WSKIugIqXCONv5n69nvMdVDy2iovoCSNCVzWBID6Wn6igvDGJo8XkRePJtq3V98jHJcVojq/ztYt4dg1oo6+6++ub7WA8/w59fo/O3fviA1X2BnODA6X0GGO5crYneUygqvPNHqW1NP9RhqFGy2bNkJ+PdBSD71O0CQz2mrbqywMb6RyBAdmyzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Kfh8cm5tE2RgRhhTyiu06g4xbmBp91NGWX1sq4CLiA=;
 b=sO1JH8vz3aMLHaYkyqqmtbkwFdOVeVdntL59LWJFwXxpFK0JBedrCBX2T5YuNsvwUxCbTf5Ln/jll/J0xqIT0pashNJricraL5rF+zrHCnV0xelKp4rCJsTxdeEByi1rRWmhn/++FAjlhNZb2gHnB/GrjkhOm5iV5EoGSJhE3HPLLR/IQuCftVrKZaJCt2Xr7OcKrGYlJjebCIL/RGboLUFeJJEJ2lmYwdnfLn1iLfx5eOCWTXhajAvAkMVYxlllF1l08lw8r9NwXJZJ3cER17PjL2SgtOIlaUr7qIHTkM0ATVzSlzfHdumyxNU3y4Y84K6Sd2CufOOq/YoEzmCBRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Kfh8cm5tE2RgRhhTyiu06g4xbmBp91NGWX1sq4CLiA=;
 b=rDymMK2tnOffGnJcG9HHHaL2K1vvSiBxGXeLLrO8Bvk2LkcGCai6Z+RJgwKYxYTXnmR5dKRPFpnpz/M2XrXseorpuV+yYksb2oHshCk4LP7Em9LQDP4wdyJuUOlNIJwGJdLD82QB8IJ2lGLsP1FfX6NBFAfo1ttd75/1F0SKU+Uk2GPQvJqHsmJDwJHid0/YJZborBTMgTQ+r78E5Wjop2m6DriMjXO58ja7TolLYbLGmCMS+/A90pdaKgFAMGzIcYnN9hA2HqsOvho6c0WyLhCnGCkJ96g6mkAimmVa8EVLo0oT6TZH0rrIYOGyoY7PEhQuOsqdM6Cwaz/0zFMJng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYSPR06MB7046.apcprd06.prod.outlook.com (2603:1096:400:46b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.21; Tue, 12 Aug 2025 03:54:50 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 03:54:50 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:VIVID VIRTUAL VIDEO DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 3/3] media: vivid: use vmalloc_array and vcalloc to simplify code
Date: Tue, 12 Aug 2025 11:53:04 +0800
Message-Id: <20250812035310.497233-4-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812035310.497233-1-rongqianfeng@vivo.com>
References: <20250812035310.497233-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYSPR06MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: a0af71f6-83ea-4cfa-e1bd-08ddd953fcf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GC5DltfwIA5rfRDL7zawJrYDB4yVLYXu96lIzVnahZKPnkGK11pS21RUr0Cy?=
 =?us-ascii?Q?4wB9M37TK1RAIGVaeZ6XkjOHkGgV2ii+D+kR51S5iU5rPx25NR/hy/REASv1?=
 =?us-ascii?Q?0njdN4kluGDeBHnqxy0ylIn2a7gMP1PPeHthKhnxQzQthqJuXJLxpH4l2vfI?=
 =?us-ascii?Q?PybboonduleJyYBOLcqcm4sSxWm0IwLqmBA4AJn19GMV4PXDftCqExRgQKQ0?=
 =?us-ascii?Q?rDzpljMuik/of3EoJRTRx2YHtBk1ZTKfWtoXIXtPKib6zi1Ob/E2lh4k9I4r?=
 =?us-ascii?Q?JBYaY58kVuGjk4mx8JjHi+SBEfDsLsybG/AKNKQHIKzapl6xIkvGkR8jozS+?=
 =?us-ascii?Q?5pXeMKG7gFqEg16l6shLECKUpaomEkMl99MwlhrgoH484CdH01yJ6coxzYhU?=
 =?us-ascii?Q?i0mws6zIIWJlrZ1nSNXhMWNOmy9wziIH1Bdjq7HwjJCOl1LSvIpLyOezQzoC?=
 =?us-ascii?Q?Ga0GOhXqkNDxuCnDy2lodYPu9EaPGWfg53QfXYCpi7ZC+p3Rx3Y/AJRBlF7N?=
 =?us-ascii?Q?i1bwHuFsp5uK/SFeEC3LYNw2z1czCO/D3an0p6+ZZEbacsImMZ8yKDJsGpq4?=
 =?us-ascii?Q?4Vh4z1CoBhgQgIyZV596zHIcML48Sg4rs9vQvVbxWb6XbOBYQLSDFihVZ7z4?=
 =?us-ascii?Q?bepE9ee+WoQCC2XjYIcUDj7Nin/RAn+tx7CIg9ncgqR5x6VCtZlNAB20fnnf?=
 =?us-ascii?Q?qITxQrCtwqPAnIav3MUgs6SwIHHQew+uAHBBr4PLVQINNKyiybcJEFFby57I?=
 =?us-ascii?Q?vav4Xr/rqVs5rk3wTNvNeyQgmI/6gve9lPlEjV3ByJsScVNYQr3EKHJpXLbB?=
 =?us-ascii?Q?jkTzia2vCxU76b+fHpRhtUZQ+D1LnEYGNpEXrCzy1WdM82vUi1jAV/JRIlIU?=
 =?us-ascii?Q?gHWUvo5DHo04TxdLx+W5fewC7nXYponqrKV8cRn3QaqGLl2x+VPF8gWSfKKV?=
 =?us-ascii?Q?UZWrRGRWVtLRNfoaaXRNbX87GjdAiJ+7ir+LRhd7f79bxkX50pjcZSEz3EIa?=
 =?us-ascii?Q?eMPRMS+y+khCzw9sCEkOzZr50rXs7n7zHNTH5DgLSwweeKH1zTKK8kCwc0cE?=
 =?us-ascii?Q?0y92/bs7FtaHZ1m9Iy6DdzPJ1OyN8R7Mh/erLCatDXqQEdjsOx24+pfMnm2J?=
 =?us-ascii?Q?U+5dJu4aACU5vgQFwj6nuxsdFjvy+hUGU0GGqO/1gHOiOHGu4GjKdg/tn1j1?=
 =?us-ascii?Q?+mw5UdQB95UP3wJ9L2VZ/F65KOxR4fJmvpJMeO0OaXQE1QuJ2H+Vx8kl99tj?=
 =?us-ascii?Q?wyduCxhfZx8ZvfdIfgiYWpnvmhikATbMVhI919UNf76tJBn9e604nCvIAWI1?=
 =?us-ascii?Q?oGQDs6H6Yn2JZ3Lvye3kTNgh5erxsGvGDXhpZZT46yzuUc97QOW9WRXyUMBJ?=
 =?us-ascii?Q?uVS2a+JSIy3JsvScHcFD3HJ4TsZVYjwEh5+eZ22kNpUab1OcxBL5GlTKvgQY?=
 =?us-ascii?Q?aL9sMIqqkmi5rYQeujDJN5//ZVGn9qtQkFiydbi/0IgcKQqUwD4bbV/V1CAt?=
 =?us-ascii?Q?PE1Qae+fBtwgGOI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dlTpSk0pHl+VjRuNzUgDxgJuOMJk+QdT1W2MwFdu7poLhnLoxvbh9WZCvH7+?=
 =?us-ascii?Q?JDbkJlnDsoaJMbTCGlM2hTyuQ+8T/q2fWUQbytax4hMRkDamD4KLClB++w8I?=
 =?us-ascii?Q?JMNdK5qEZY1VXjjvGF+B2bzmLsRUabSEQt0VcR47FZvcC+VofLFXCulbQTIi?=
 =?us-ascii?Q?TkxyePW/OGPxDfLZRzFFvn4N2CQ7N2PK0wrB/FYoA5Y8CJcwWwbabv0ScI4F?=
 =?us-ascii?Q?FVtDDyHMSjYAS6j8EygVc/S3nZcYcZVIOMRH4HFQ+zRuIs9BqzQI8Nju4DKr?=
 =?us-ascii?Q?JXJM4F0nCkRVGWKeW8hAEmA0rxYnLrZZBruChrb0wA/L3RBqlE6yaPFriFRT?=
 =?us-ascii?Q?bxrox66HptybPO/4i2evmTI7iumD7HnZ98rWsowASfisNPp7hF1FT/CoDD1h?=
 =?us-ascii?Q?7JcZE6WWN56kBQPJHT3VKUhW2iVixJjQM6E+Vuwt4TJRcovZquwgJD0s7EKz?=
 =?us-ascii?Q?LWZbVtcnChFv0rIWtXjruLINctXK7+c4bTOjpOZKRWU+Lcm/a7YtA47sWQdI?=
 =?us-ascii?Q?rLXwI7mhPtIws62Q112gL/cHthy4PIHsZZScyq6pZm1OEeT/9dToZfwnVr47?=
 =?us-ascii?Q?Hn6IzOxBG0XD6eWa9WohaJjaLC/ZIvw0elg+iEgFOFaxKZxcC9nzK3e9WGTD?=
 =?us-ascii?Q?TUFa4Q259J5Fqx+2cBFUyxYs52u3K/pSgSPBmwb1CNR80Yx5rvdzz0MQ90+K?=
 =?us-ascii?Q?pxmZ7xMzU48wGSXXOzB5Ooy5EtxjTAHDsCq0OxyRjs7feX4PeZtbCKy22XNN?=
 =?us-ascii?Q?p0DSLQXcpkaei+9/3Eo5hdhR+61DIxcwUl1QeRrtST14pShKm7u8u7BPoXvy?=
 =?us-ascii?Q?kfaOerNn+JPJFS2HBS792QyZjIaIrb/lZpfWug9fsXGkZQykk/upeDr4JWf2?=
 =?us-ascii?Q?brLosK41giMZjePPKcjaY0xZjyeIzKHoy6Rzq3416nUjUyVncqY/oyjWcCrL?=
 =?us-ascii?Q?mOhlKcCUaONr2bQMEGyotet40Qhb01FLnVIiiCmvJO2N0xTyzMT3GE6JX8vR?=
 =?us-ascii?Q?7BGq7KotHyno95mX/9aZEn/etlv0mC9KgZNEMOhNsDbjR9rApzCGl6KjxUwr?=
 =?us-ascii?Q?wjpKiEYNRH8tQsx1XDrP7s18UOFsK8wZ4eIpE79ZCRwDFCmjFCVDFowof3uK?=
 =?us-ascii?Q?EVcqQUSkH+Wao5FPMAfUOyLW+TnLfHkPF3hdaHXF3qszRcDa6ZSltbY7pT2B?=
 =?us-ascii?Q?wM3uo2RkJQL7WB34B0pXeno95Q1c4nQYUZhZdUp2wTB43IVs/hDEPjyu57t5?=
 =?us-ascii?Q?8KwpoNSTcFr8o88lx6xuCFYY929YiPeVyrV6dwYgXeeAKjqRLkUgFh0PWPQS?=
 =?us-ascii?Q?aqRqWWqyqb3bCvAcOZn0lR4PSkABhjY6qClgFjBJocTIodeYjIs+cIn0recc?=
 =?us-ascii?Q?2by7+OcYzMcMcPs4Xyq58Hj4A3/qQiCXYDr60tMOdcw+GTv7/2Z0xgjP5EvR?=
 =?us-ascii?Q?m7CcsDBUQRfd7GrMB5zVCOXPm/ty9TYDCq6kez7x9Ifp/0QqjOFo88gb6q5M?=
 =?us-ascii?Q?wxOIFxNbOc2MeqIU/PsSK8ZW1dU264wXz0y/eWD0WnxkyeGZS0twU0L5brG+?=
 =?us-ascii?Q?BgnHEhyyiJY/qrQ4gmlVJEYXY6Qu/J4juiNofiQA?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0af71f6-83ea-4cfa-e1bd-08ddd953fcf8
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 03:54:50.7565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFqCIbwTamiwNmJt3PzAC2quHmV5hMzgP8Ag/Gy/qsnzBraGjzk8zhg60NofetKdUGA8UjAX+ZjylR5DjsRE9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7046

Remove array_size() calls and replace vmalloc(array_size()) with
vmalloc_array() and vzalloc(array_size()) with vcalloc() to simplify
the code.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 8d56168c72aa..f712bedcf2af 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1856,15 +1856,15 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	tpg_init(&dev->tpg, 640, 360);
 	if (tpg_alloc(&dev->tpg, array_size(MAX_WIDTH, MAX_ZOOM)))
 		goto free_dev;
-	dev->scaled_line = vzalloc(array_size(MAX_WIDTH, MAX_ZOOM));
+	dev->scaled_line = vcalloc(MAX_WIDTH, MAX_ZOOM);
 	if (!dev->scaled_line)
 		goto free_dev;
-	dev->blended_line = vzalloc(array_size(MAX_WIDTH, MAX_ZOOM));
+	dev->blended_line = vcalloc(MAX_WIDTH, MAX_ZOOM);
 	if (!dev->blended_line)
 		goto free_dev;
 
 	/* load the edid */
-	dev->edid = vmalloc(array_size(256, 128));
+	dev->edid = vmalloc_array(256, 128);
 	if (!dev->edid)
 		goto free_dev;
 
-- 
2.34.1


