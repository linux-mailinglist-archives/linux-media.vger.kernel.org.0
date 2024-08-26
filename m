Return-Path: <linux-media+bounces-16754-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CFC95E76F
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 05:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7299A1F215AD
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 03:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4CA376E6;
	Mon, 26 Aug 2024 03:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ppyzt47z"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2083.outbound.protection.outlook.com [40.107.255.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0A86E2BE;
	Mon, 26 Aug 2024 03:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724644035; cv=fail; b=Kw4+JPiqN+GdVPxPdodt+hs5AldsmkRO+J6372cR52wfOxOz2J1UJm8AJcLEM3LE1k1tEcWenfAqZUTaHTnxQAwOMJUEfqntryL5AR39ubyDuENpbIbWUBY1q26n36WlHFUtBxkOHPwYktX/HXwzI6hJM3rRYiGVfk9aFcSZ9W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724644035; c=relaxed/simple;
	bh=+GWIGyt/pR/FZAZHpoZdL7Cp5RwPimB4PaK5GR+fgRE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HKJoCxtb1cu9/dvPnKkohwXwEO7J9cN4XqMr7l8WPVyr/K2N/vfmNLNIEmA/L1BXA7qLH2pxULT5SCl6aCi6Jo+poz7mB2wdr95etGw1RCUTGUtrwA4OJ50GbieAjK78o+0iBj8bBPbD1Z2bHk7P7FCzKnE38jTd2+YaAkKeEME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ppyzt47z; arc=fail smtp.client-ip=40.107.255.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwGfJcROTEZAEBBdTY6v9ft2MZHoo0b/Yyepr49saws5AXXxl6IqSWO1BM/hbEl8bE1DLATLrH56ryexdDh+qIkVAuhMcBMisdIljw9KjCWx8G8TGPSn2dwr11dMuvKkc8gqEpb8QQavivOUihrxKBfriRZEbJbON5mfE2CRsYTqrRwRvJ/y2Z+9VwKF4uyI1HUQxAG7J5wGp2L6X1R2Solh8kzxBBdPvJAcVAmo1w8fXeEaInncvvp/kCQPdOyCuvwBOhf6eEQuGww1Ike30hXZ7U1h5OX/mixbZFMVU7LFa3WK5WOeYiYgMng4bQepdWwygVxya8TVueVnwFYHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QIo0m2MUHICEEKde5H7Zf6/eURSZlHqu6kjtXE6g0w=;
 b=ymJEnL3B4LQMN9KASM2giAESnFj7B61AZAPO6LmW3VSKejFWdZC3KItLmJXMD+E5Ov/cTiM4qmbDpL6ktidjtGHy/xDlwoctBujTYBCmVCNBhxEcn7WTump2LtNOl2sgQiQjUNtLnZLaa7MKJSTPSH5HoQzyAdTYWo0RujYSE8bBKo8RUT/bBCxySyrJbG51aKC/VdFpmSdRA8jnZsY66awx78ifEUeKZkpm3R1K0P1UoVUFZOq3lCDGz8BoWVq8bP9UZbuJe0mL5ytqgMFjXwEz9DmehTWB3axd3fVfsUqcxPdwZx+emkMYaYj/Btd/90Rz/AqqQD+AwePU7APzUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QIo0m2MUHICEEKde5H7Zf6/eURSZlHqu6kjtXE6g0w=;
 b=ppyzt47zMgZ/Qa6sOYxZm0s/GV6z/QX+fyV/eo8w6Qm4/dFBuUi9yYMr9ObslITdlDoB58kwn6iZ2yQ3s9iB4HgRa2g1x1H3nScmw04VqgrQbPTGRgbfykWcvtW6t5deYK10Di0yYxnSLuPW9XNEKgCjkWycYVvoYxMxImLuOJjrccqJwNUHAMxI1HRSz7onaOaQFgyKT6RO/ElnqovT2nX+YN461acnsllDCK80VwhBv1rhbUD1k65NDECf/17cd2WBxABwTNxgC9gIINlu7SlwAWsGW6Pj4SizHJiAY0/uhSjwSxph6C1YLpLOxH7/zAocLI2mfdiKv5qt4LpsuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by OSQPR06MB7280.apcprd06.prod.outlook.com (2603:1096:604:295::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 03:47:09 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 03:47:09 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: isely@pobox.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] media: pvrusb2: Use kmemdup_array instead of kmemdup for multiple allocation
Date: Mon, 26 Aug 2024 11:46:38 +0800
Message-Id: <20240826034638.2837-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|OSQPR06MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aec5f33-b50b-47d0-d806-08dcc581c310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bga+X3H4a3cAcDfQL/2OVCIhvkq9+0+cCs/Sh57yJPpyDKazw83fVkYXFQ8g?=
 =?us-ascii?Q?QRvt5e5aGKYanx7X33bYpbOQuBAqZWYLNx7SdlXOUy98tzjtT2MCjShDUTls?=
 =?us-ascii?Q?djMtGcAgg0+a8fBHsXdS3XJZ2JI2Mfcr8ShY01/cPtBwncnmf17+T4pVKd3q?=
 =?us-ascii?Q?T2yQJ5bIbnko7+w93C4ldGN+NLRILaob+J093c94wBBHHTm0a6zKoPso4C70?=
 =?us-ascii?Q?Ta8vZLUgsDHW7tKl/D6cW7/lBY4PDqVyYzr19i9BuIs25ZolwqNH9uPkvyPw?=
 =?us-ascii?Q?lz8g/ejg3xQ4hOk8P0KDYi92YGSJMcIPNqMIEQTJ6868sqqL4UQoo9v5jYFY?=
 =?us-ascii?Q?+sQNDteMMB8J6rtYPewBF9t3tk/CLsWfk4SH8CiMQA2vZrUUo04+lJrHHiCd?=
 =?us-ascii?Q?oZWVoDEmQcPvCVFHlAi20/P//Ajk7eoGucywCrtugOHbc7w+iQ1NCOv2lK27?=
 =?us-ascii?Q?q7qQA+gHTgWZFdRooXSWzG0ZyXm6X8JNwvN5h8AUNftLtUmy4v/OyhKtlsaK?=
 =?us-ascii?Q?KZCp4opdjMcGuhPSp5o1uOp3PpXzzsh+MFPA3sFP0gnJVub24xp40HWziHVq?=
 =?us-ascii?Q?nmswvqf8Q1TDqlc78BSHDiLYXZ/HEe7bGO3Ib+7Fe/zo4OBs/0CoMgF9I93g?=
 =?us-ascii?Q?0APJEarzIYuUz8JZhm9kQ6ikXl//iOVki6eF8HCqndhW+G9Z+k8k1YzhF8Lt?=
 =?us-ascii?Q?n4JXsxLMtefCRaKubadSDF2xh7ZHwDgcGRb5ln8mrRYvC2Cpr/c6j6Ud7dxt?=
 =?us-ascii?Q?4UuCb2eSKX8cQbxE7SLmsy2YxcmKgmEX9eHSBeYiE14MLpipYEzfCO9jjxw5?=
 =?us-ascii?Q?PgKoO28FnVVx9Lb6zLlAcdHkS+YyUNcKVQCQglDWGLh78QZ+AiQiut+3+67X?=
 =?us-ascii?Q?4RaKeWr1HhvHbW3ll0e35iyIRc+14dX2yrBIMMcsqXz9YEJHBw1PDBrY7oa5?=
 =?us-ascii?Q?DtDfBNhm+Ws81Hd8OTWshjp3TNkGyxUSlY2t7/SBxTozwff8f2Nnk2swxJPG?=
 =?us-ascii?Q?0aGXx3P1wwHqyAM4NFwgNsfvs5OVYuNE6C68xMJWrztt/Nt6bpYxWb8Tn8U3?=
 =?us-ascii?Q?/5cWvdZm8MeJHpK7A9v16cP2ckhCFeb53T4Ootuz1V+aFBa0vuvjf0GWx8pf?=
 =?us-ascii?Q?G5g72vHYd1eBI/gSC7q01lg40Pdu14ttSL8DjXsntCvPeM5jRQSY3r9diqUA?=
 =?us-ascii?Q?9mBwxHDua+zvC862wNxfgz7Lga8cjHfjYkhh+HpndjP3s5u1b2mu4OmarnP7?=
 =?us-ascii?Q?PJGJ6MZ2Uw5ECAUXI8jxSZ7r0fk+eMy0Ujdja7awZFsPKuonp+0inZYjboxB?=
 =?us-ascii?Q?rbPtJSHU8Upc3YmV7vOFD0KpQMcVDIn/jaimbi9lKHrn+8wzt7Aw269yN8h4?=
 =?us-ascii?Q?YvTeHbtfrWFbQvHUtlGtJ7v2oDuA1g0bSYOxVNp6DL76dVcyBw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PcRSJX2PPGebtEOkqAc4mh+eE+11Wlk2UoSs+D5YKE1vZ/rugzSuqId3//pW?=
 =?us-ascii?Q?DfJNGHJfvPkrTqVLHkYFu9tYsgc/r+OHAudqz2vgKFUChRGFWFO18YInh7d8?=
 =?us-ascii?Q?S5exHGeM0XrGRT3QV/wgxvrwrXUZfKZ4eP5dROodt9caSXlOI9PTLEbBxN9P?=
 =?us-ascii?Q?lmDx7awgZCYjHBHB4S8HOHyntKbFzqAW4m+TrX6jmGUJpgKfUmRFuzihCeMs?=
 =?us-ascii?Q?jEK1t5SNnZs5U1tZPG384f7CQLvtZj0/7x7atM+9g+kmjnLo2x7zUi1OXzcY?=
 =?us-ascii?Q?13LXetkBgbiRd37Y1Sxt+ZJ4jkfMYSuFq15pZXPIrBif6k6WNRdif2w9mD/s?=
 =?us-ascii?Q?BxuAa1yQSGxWTHB8EChzIVQe9cisaRwR8cToOkg4JJcBX3JEIyJwHiwlk8Pl?=
 =?us-ascii?Q?eKqhv6LREsI55yS/y2wBCusmXmTIYE9u8mLM1AxXOoZ1U+zQR/500IOzhHA4?=
 =?us-ascii?Q?ktUT0Mw0F2cRN2a+3FfY3pJQ9UBad2ON69St0bOsWbiCZAYoBwM4F1WtWJZU?=
 =?us-ascii?Q?KhO4/WtpTnKM4cKJnlBN+2ZuW3d81ER4Sdat2A7GzwCUe7/2uSxHGlRLr/Z/?=
 =?us-ascii?Q?XpMfXB24la5vSyHkalUmooepHUA+6VceT0GtBsOqPpSl/xPHsbzp0fkeaKqK?=
 =?us-ascii?Q?4hDubjiXGo6iAAqB4R48Fl7qijAhqG9xnrk/dn9ag9gHpL5CXkVa1UVTTr7t?=
 =?us-ascii?Q?t3aDXEpgFSD2t/7AcEuDM2i8q9p7b65S+DGLf6XZG/Wlt0Un6uym4Pf7Fl/U?=
 =?us-ascii?Q?Xqk/r/cxlnhO8eiM+O92+3S545m6HuULmDJjbiAWI2gRVmddSg/MuaApDp41?=
 =?us-ascii?Q?sewPvScHQmt9633yZXSgnqOg9Nt0WC2nMD6VGj1LI7+RikWXBMZQBj6Rnsya?=
 =?us-ascii?Q?rYX9ybB3AoRBhwBPxBK9/MjD8SbywD1NpjtY4e0AG32A/v+ybL1VuGGuCeGS?=
 =?us-ascii?Q?0DKBlmsGKfGKqVOSJob23tmctKOsXTgZ0ajJSicQx0y8B7WeFPR4YV5YQhxv?=
 =?us-ascii?Q?CdPge4t4X8tClv0QkwX8iby+x19tB9ccIb/XnURNnr6D1w+wsRwx2EQPXf8y?=
 =?us-ascii?Q?FxE1TJ6X09ozeLEla5vHLGV3FHWNoHIhGrrmalZOsQd84rpBmtF5JieDmtKJ?=
 =?us-ascii?Q?RxgXWq5jtL+269Sc1i0etCP+HIywUWTxE6dyEIspf46aXm4GUW378It8Eej/?=
 =?us-ascii?Q?gevGnzuoPVwtJ/DzqpK/uUdne4FzrlKtTdXPDR7504lPmw8calti45R5XLIv?=
 =?us-ascii?Q?WfW8L5GIX4Ovjv8cbp0PfMKY1u+CB3TKfhLMzstSvltT91kAKqCLpyJ/a2In?=
 =?us-ascii?Q?CFiFKz1P8TLdZNw8wcMqYg0z+EUXVztyK8NBUxUYof9g0/papwO2o+1beRna?=
 =?us-ascii?Q?zf/gefobgZu04NwRlGQLUkpsS3GhAl6fjjiW3ZyI/UMuNUnejJfRBcunS2Aj?=
 =?us-ascii?Q?Aoxqe6DQ1HmNw6cWrQ5l3dxm1lX+mrJqMf5xgAZNYxicbAm/CMA7g/ekGUlX?=
 =?us-ascii?Q?KK3tO9iihu/YcSIF/AEKM4qGm8E6BpB6CFUegmvlF+iskSuCyPXZzS93MsG0?=
 =?us-ascii?Q?ibPy82l6O4xNS1Hp+tmvfuQaUSR/Lm4i8pDY/izX?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aec5f33-b50b-47d0-d806-08dcc581c310
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 03:47:09.5934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thtbdfx6do34rYsHX6qOjlMzra5UufuUMBFoZl41aywAenSw1NSX+VdLMeMx1PZ+RzaUx56VFkLKjeOuw6ssyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7280

Let the kmemdup_array() take care about multiplication
and possible overflows.

Using kmemdup_array() is more appropriate and makes the code
easier to audit.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-io.c b/drivers/media/usb/pvrusb2/pvrusb2-io.c
index 675dc7153e2b..28ffe7981f8c 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-io.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-io.c
@@ -335,8 +335,8 @@ static int pvr2_stream_buffer_count(struct pvr2_stream *sp, unsigned int cnt)
 		if (scnt < sp->buffer_slot_count) {
 			struct pvr2_buffer **nb = NULL;
 			if (scnt) {
-				nb = kmemdup(sp->buffers, scnt * sizeof(*nb),
-					     GFP_KERNEL);
+				nb = kmemdup_array(sp->buffers, scnt, sizeof(*nb),
+						   GFP_KERNEL);
 				if (!nb) return -ENOMEM;
 			}
 			kfree(sp->buffers);
-- 
2.17.1


