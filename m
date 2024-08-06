Return-Path: <linux-media+bounces-15835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E64948C62
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 11:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1F581F252A0
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 09:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C771BE24B;
	Tue,  6 Aug 2024 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="IjIQNtyY"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2098.outbound.protection.outlook.com [40.107.236.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F32415B153;
	Tue,  6 Aug 2024 09:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722937741; cv=fail; b=ZQm/RzZGXTBJ+8/cU1Kthk+18fya1Mmfhr+mPLHSlDPqhkCsLIcSesewfsBebxZtVaMj0YXJ3FEiO5P9YHwdSszuzW9bNIayJqHYbB8HAegU2JW0S8m18Ro8JF94lRbqRG+s9kPG2PsIM2FuvtbSRXAsYbc6iNP241fVWIdPsRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722937741; c=relaxed/simple;
	bh=kOXgOSR3RO+adKK9/CnCNo5ui3L2UmlsuurmWxCljxw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IFOBaSvlotM6hGTq3J99zidYNj/pNtyMO8tHVXvJ+hwFItv/LVWN7ICFoKjtK8Ph1z4G8//nStzeF7xTtcGwrBj9PQml5OqHX62XBuPC/PLRczIUNXWmlFoausiWrqzQEuClPxmxGSn17OR3SYdjxx8azv2M80q1DgCf2WlCh1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=IjIQNtyY; arc=fail smtp.client-ip=40.107.236.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rdgw4xZuJvzHmi6U/Afhckkq5Jyrlj+geD+tu5902DrUYKpaB3ywQcKOGleR4CsbctDxF0W0GQSTGwb2rWZ8P9hIQi5dEvhetbPmwfkDttkrrsj3KWhWHbc133u3AMjppcmaVrIACFlEfz/yOzkUzI0785kItJyXnNgzEnXmdNMkxqptHkyfGitVWjbZxeITVlgUiE3YiB+ZDtaMhZSCRkTrNJsT/2vQjSIdv+IkeXADxThIta8elH3lyv5dFpUTlVmcxsYPgNvV+GwmMHqxo4veBQoy4y9wXMtUFv89sEO9Y/y+Bec0LAmR85bn8FNUxhzCknqZuDWiKtK4EgCISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2DNrsT7boz+6SG4Q2aI2WTjTtQgsqASHAfi/s5KNDg=;
 b=hVnWugriEqlDTw/bKrb0h6YCbglifHR/VvHEavPPjUpoSjB0pj7z7Uu/72xhC2CZ5FwpZC9ie3HFKwtOavWk2NLf7V69vJSi1z/bn57HlJDDo8LJKJXeRILD0/osjQjg3X0wTuP1L+FYhFYDavWsUTR2oykqab6cMiRHhvoSmHFq4rN6HMZhnNsIYIFzpFsiA9crS9LkiXX8/kiYMUuPMiTSHjh3Rvvf/4DSjIt6LdokWZGH6+uJKCnPv4FFtGWrXKfEDE+0US9vbnkf8t4aweMz08IBF1sPO+DyaChMaFtClgduJwi386Y6ihJ6QRhWg+UBYtkKopDCvTI5tTKvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2DNrsT7boz+6SG4Q2aI2WTjTtQgsqASHAfi/s5KNDg=;
 b=IjIQNtyYwgd5XcYso+stu8zs01458FAiv8nXvG3QiESevEEsCsauyE+h+hO74E9ndge4tJNKxkdPxXLzqKDO3OZ7ApAJ7vpVKdtOwPh39yoKrKwxbKN3o/RJC1GC3bSB26iPuDo3XDz4h0GxErvSKBw6+VnUNCJF+Y4swOnLbCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by LV8PR08MB9392.namprd08.prod.outlook.com (2603:10b6:408:1fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 09:48:56 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%4]) with mapi id 15.20.7849.008; Tue, 6 Aug 2024
 09:48:55 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: linux-media@vger.kernel.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rockchip: rga: fix offset lookup
Date: Tue,  6 Aug 2024 10:48:41 +0100
Message-ID: <20240806094842.248775-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0648.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::19) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|LV8PR08MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 8809edd6-89dc-44eb-d7dc-08dcb5fcfc78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4D87bPOL0mcPGGWh5rr1KFei8WMNijWnzaM7YtQXJKDKerD+H9akZicp1Avx?=
 =?us-ascii?Q?8uC9HdE1IhmvYNCecWIgbgBc6X7O3p8Pe9sYjWYclYVfEabcE2O+0qFtXQIe?=
 =?us-ascii?Q?yYsKaHgadv1go3jmsglsT+5wC5MkNZZvEYa41I67q8ry3uOHlqTJLbqUc1nH?=
 =?us-ascii?Q?hDQ1xC4kYpaUX7AZH006j8bRfM+7wkJ9f6jcG4uvhYTdCDbpfxOonLJPrZ9P?=
 =?us-ascii?Q?bRvLmXUS5YYRbyTVZ+pRgTbvUDN5PcbmTm74Zo4lyXOyiHu8/ysBCuvTh+Qj?=
 =?us-ascii?Q?ME59n87gR2iYC3+48ED5xDJbccTXsQUJlOztBRAX22NZ/oy0xyUrYLcpNlmb?=
 =?us-ascii?Q?/uHVWabf7rgmOrxHOLWu6kNCfOmsUhaySwk9mejXUlUl+NDbGRLVnU+ZmhSs?=
 =?us-ascii?Q?wGJlcZAfEvYOQ5lPRi/qm+MGwAJFvKXB1fcALbPyu1cXbvqJQmj2eE4gtgHn?=
 =?us-ascii?Q?LLFgnSGLomQVtE/F7I6ZSnReYc0tNgIQ2lcp55j/SSLmb7dSET+6aNkFYY0T?=
 =?us-ascii?Q?XtHq6EuBQHfeHV4yYHbd0hnDHxdZtWUMRF0fh5dB6L2QWPndtqN3FILvkRhk?=
 =?us-ascii?Q?JLx8s5l1HVlf1kfemY+eem+XlRF4nHQH0BRhcB/DtuzNG2ldc3DraqBcNJYc?=
 =?us-ascii?Q?ABTFQK0KR6U1OE3DVkoeiFP1VYnwkkt6YNSDUKbygUZruw+ETx6JwyDhQdSW?=
 =?us-ascii?Q?EXUNTpI7cjf6aYFY3dFZ2e1u8WhSbDBTPrUjwkEkQrSjZ3rkEx7kNvL9hN5P?=
 =?us-ascii?Q?segaZdBsUJtz2EKAf2Xk8g2afoYTq4xrAkKaSp8zNqXRHRcqOAF96jAHc4Cp?=
 =?us-ascii?Q?n+YcfI2aNOuhpU9lUgEFE7ZnY3sppjNys3Ogc1emLhNkMT4uCsV0lB0EK6Zh?=
 =?us-ascii?Q?eO7qxq/wHV39YiXnaFPDowpZmOZJnC8uA0ua/n9J7HESFT+74ZFu+VBX7LFL?=
 =?us-ascii?Q?3XipGp8sFD/sCtFSzcnjcxc/Qjl/I+U0wY4oR26Ex8wIy1G/8TAzUfSIdBk9?=
 =?us-ascii?Q?8UOzdbr++0iRE95U2D2T8JU4S1gegZaVZJeqMYxqIz9rv5wwF3Za/Xwu/7B8?=
 =?us-ascii?Q?9c0cGT0nriezGQ6bXsg4unfnIfrbskecBAGYWW9koqBnZfgjjU16EjHXbPXR?=
 =?us-ascii?Q?mOTgXqOuCTsmOqjFNMn920JqcMscLnTGxBmzl6v49Av5lrIfDgKzXksV5AxI?=
 =?us-ascii?Q?ZzUhitktVv9N5q4EFlzMj5pDYGcJD2oWR7knXEbi75Tk0vsK9zgA28VJ7AXY?=
 =?us-ascii?Q?f5pcJUc7IdYE/nDi0u9q4Rb3BcTNy2qlFSJWzFeH9Y+63LwpT/9Cg4x5YiOm?=
 =?us-ascii?Q?Wk4RrgTTWsVpjvSGmp/Lzm93cVK8uyyX2HZr/jVXeXKKycCUkSSIqlWT6ECt?=
 =?us-ascii?Q?NVSHvIV9ORVlRIivd7d5sZFa6nhsbEK+kgSskiBSSS53KW5xog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PLVqeM3PZ5d/PK93zCZktHXqDyfuI1qiLeSzCzCUp6gJf/h6v9deiNdYHFkb?=
 =?us-ascii?Q?mQupMyRCGYy2UwusbOBLASlCk9oUccHxJpQJkoufZM3D1LpigXD96sW6nw4V?=
 =?us-ascii?Q?LzQb72NhBL33qLDpZBRl5lhFjVkoaCe93eOr9deeEf/zEeFnsj8RfmHnNScw?=
 =?us-ascii?Q?z7SUslKADtmMDx/YRzfaXXSP0MMvqOaUZrpJChHBDCaKE9eaxXN7nlul0LdY?=
 =?us-ascii?Q?8z9e8LD3yTjHw4J7xO80AEDRVyBsTrEm8KLt+HGKCOzRZ8NeXnY7DQnR3cQD?=
 =?us-ascii?Q?/xrGTOKxUBzlAYDvaj5niEvHPWddrnlTDmj4FJVWQqLN9JlG2UHLMpteEScO?=
 =?us-ascii?Q?F76RaJZx6fVUgrSxHg9pXMv3UpM/HaPtkLSfjQsb2aT2ixwGFfLv+AP2DQeC?=
 =?us-ascii?Q?EdzO6T+G5pza6OYiAG41WmcVjYScXvmRl5BGDCLxcPVN6YWJIAZ07p9L8ROJ?=
 =?us-ascii?Q?KTIaidWYqCo1Z09ieqh8RFMgVW8THgWA4dy+UBoy+b/9Esgp7xlgZmnMdgVj?=
 =?us-ascii?Q?qQf1QT/qxbj15ZDh2yq7E2RdKrWjwzf+RD5geqES6uQxtuwqcZM2YPtoqOmv?=
 =?us-ascii?Q?FkXcdEth+fyKMlzNTRMexc9xWaUit2eR7z/GZ5dC8MzX3o2uqFgpnmXUO2/E?=
 =?us-ascii?Q?xRc8ZT+O2mUMpoeVrsJ4CkSHrhC4SmyvEsQD9+kkgM1Vzm6eKT5sngAzkQor?=
 =?us-ascii?Q?nhCxsxbLvBoNmBghB5Mn3N5k79ag9fgwlEwmSg69wP7Jr05f4uj7oKVLMMuf?=
 =?us-ascii?Q?+5MF+eFVIP4oNYGamGvvbdKQC8lCYtsnhEZtfTvMPI665InVCUcaLLsjiJWo?=
 =?us-ascii?Q?uMcPygMU+tdvjgAW3+ycSo26p0oELyQNlr7P81pd4y9+Ezb9FejrbbiDBrx7?=
 =?us-ascii?Q?SVxXElSbu1Jr15l3Xt/J7PU+noO2YVrGyqgoJOZ5pxCgKDUCCAOtu6fKUhLg?=
 =?us-ascii?Q?yJekIdgcUevreZVoQHisq5CiIJfN0W7a0wuC4CNDYN7TDtVVSLIxRhPMPy65?=
 =?us-ascii?Q?Q8EyvU3ZRpjBCXqbH9D8cf8nXkx7PN0tl1wL/TWEzUVFX9m0UetGn35NGqNl?=
 =?us-ascii?Q?AVac78MrUiw54DCwn5hflU+FIdX8wfFMZtso0rK09EEI7H6VLJFUJujzpskB?=
 =?us-ascii?Q?MxV1Vah7yJd5jyJgpWHdowi82DN2RPB2EMOMnPs2PNZbEL99S95kVmjqYv5Y?=
 =?us-ascii?Q?P4Us6lFvZ1pTG0uxqEYFj8uMGaTgM5Alb27XztUuPxlukcjUPqD9xENmNR8/?=
 =?us-ascii?Q?3ywNScRtA8hXA0k0BssRzYgMBh8Imcb4V1yTYpUOndVvJSboQZ/EuUAQzoRq?=
 =?us-ascii?Q?IdzbxTHay9AuVKteOIGvoCXrBXC2MB2Ui1gksiBGiPS5KRIfc1VTgRVhOlT9?=
 =?us-ascii?Q?EvoQk7d387TOz5dBUS2UbntxA472QGU1ZDaOEPZz82uPqu3BhN7r/4Npkfg+?=
 =?us-ascii?Q?JbcBgvS2VMPBmFmW18RwOCEaRQgsMuffCqHOLvn3U2QWqH2lnvnZRRjBgbkU?=
 =?us-ascii?Q?EPn0pI3FJmg1Lz7mIsEvEPANxceGIVDU4R2cAk22eKCpt9DYMrk2Pt7a9x2M?=
 =?us-ascii?Q?qKJlVev5jYzE7zo3l/Bi38KlE6M5CBD0q+B3a/d3tVGc33CxFBvj216ZaKZP?=
 =?us-ascii?Q?KA=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8809edd6-89dc-44eb-d7dc-08dcb5fcfc78
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 09:48:55.4802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0chzgFAp/un0hzlbAC1cj2fzGzCkJ4Z6IUMVquznixCb+hMw/knMgVRhmWNBYcQkCt6Yf4+ejHP7GPY9IIE6MeHDjjcX7ziILxRzR27A5fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR08MB9392

The rot_mir_point_matrix is arranged with the rotation values in rows
and mirror settings in the columns.  Fix the order of indexing to match
this so that the correct values are used.

Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 11c3d72347572..b7d51ddb10fa4 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -97,7 +97,7 @@ static struct rga_addr_offset *rga_lookup_draw_pos(struct
 	if (!offsets)
 		return NULL;
 
-	switch (rot_mir_point_matrix[rotate_mode][mirr_mode]) {
+	switch (rot_mir_point_matrix[mirr_mode][rotate_mode]) {
 	case LT:
 		return &offsets->left_top;
 	case LB:
-- 
2.45.2


