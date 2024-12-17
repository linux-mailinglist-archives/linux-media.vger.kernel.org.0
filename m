Return-Path: <linux-media+bounces-23529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6259F41CD
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 05:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B124188E87A
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 04:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C70159209;
	Tue, 17 Dec 2024 04:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="fvr1bt+W"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020132.outbound.protection.outlook.com [52.101.156.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCBB155A25;
	Tue, 17 Dec 2024 04:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734411109; cv=fail; b=eD5FSm3Pt2JbCz0PqmiaG8JuLwKTtzcoTf/tc5dyyI89aOs+xetlOT/rRAQdDE/Bip9Awnys6hvNUl4BDjc56dSW/Tn0ocqZXJoCNFGFdcaqN7PGbqWZgwBAm3HZZh0WT8nDWk7/dDSWqjYcYa+0ad4+ZwJyd0uBB/kYsfjnoNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734411109; c=relaxed/simple;
	bh=N/kDL/M46APGpERYI5QNOsggYxKWL6GSnib2hhV1woM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BkayCUZpxt+uPn+6cDYq7AZktGdJhFlZx78JJVBLM2Hq3MhyK5mNchqrXPvI/QFDo9Q4vUcq2M5upLL8VTr/jwF07Hc6BOJuoJG6QDbcSN5uHA2ZqodbwktMZuOzr5yPWhSC9sMopSbY7ikgzDhcND3HW/yvGRDCgq9UphqJ1p0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=fvr1bt+W; arc=fail smtp.client-ip=52.101.156.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZRz0NfUE/l2Prq/uBl5pwIcn/f8uKneNdZfaxa4gjqJyh+EgX9YCUAejPhfafavtJ93iTkXbbEV+x3M8cVtb6zdcaWVQjuffjBzfQlMeKd7vWETMc8r5wskOVFkBlkCy+Zb9mBTXiTpA12mU8IQZwgRAk517V8Hb3TDhw9qTaAw9LAEU7saYGSbYneWdFG6ZYGpyft+l3ZJmagj/tqMYmblb4hAGS/Gat8F7hOG8mf/1CEvxJJ4TLjyeq3kTnpoZw1x/Nq2aOtbT2yPQZCeuc+jV4yvm0AtYI/t4GFRs5Ioz8kMm6OOvkWwt1TwIhjveBYTCttLriC3Xb+TL/Bi7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=703e1Q6GHj9NjwCtlnBJViw8CAo/jXD+TKCrZJ7WoLw=;
 b=fE0ER6rlABvgV7cVibFdaic8saA621bF6CaViVNR2AiD/pyCaubVLxyjbzuvwxJhh5xHPKwe+PPNy2dpn9VgTlo0mvkujysZ2zl3JokMaojhjsQQuNeUb6XEJ3d2Jd0HYtJwf4C1WBAXkPWmu2sg5hSJcjfjJWzbpzin0E1jaw868way/fVc+sPPRVTgmBZF9phvLgGq0iS+Ksqq1x3Z6UwuTK9ogLZL8OctcsZI+MLC7WGee27APsPAByOUcew1KoHeoylnlpCLVLOE7x8h+fmQgYo+8GDLzwWwR5nGA61V0qq5Z6xqJnVW2vYrsLduircJ3u9gJGmAR5X2ZfNywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=703e1Q6GHj9NjwCtlnBJViw8CAo/jXD+TKCrZJ7WoLw=;
 b=fvr1bt+WwlgT9IMYBAWxIg9lNUiktGz1DfzUlhBOIk4+T5VcQzSEpVrVWqinGVlHhEe8zBWEGu4zsXXKW0cMiidgRoIM39psjyGSkWLKROkVi/Ac+bAKS+yQN64FAo4oBz0uPBcZBIVSqPM8Q9GzXjn9uXpgYGd/4lyrrArAQTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB1872.KORP216.PROD.OUTLOOK.COM (2603:1096:301:109::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.22; Tue, 17 Dec 2024 04:51:36 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%3]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 04:51:36 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v2 1/4] media: chips-media: wave5: Fix to display gray color on screen
Date: Tue, 17 Dec 2024 13:51:22 +0900
Message-Id: <20241217045125.58-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
References: <20241217045125.58-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0103.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB1872:EE_
X-MS-Office365-Filtering-Correlation-Id: ba6d0d87-2760-4080-1a6f-08dd1e567c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6iZ35ThxvuIF3Pw4aDP9uPHGuS0lUuC15kWb6FQHdgTm6XszV2/+N5IKUNR8?=
 =?us-ascii?Q?qyRwSZeMSory1n7lVtvsP/9ssh3/lJSo33L8IKU8wE6de/GUVl71mqWdYK6i?=
 =?us-ascii?Q?S4DuQui8y+AhAe3F/sd5bdVx9MNdKBcK1sBlG5paN1iw2Aa2fKKkXBIiOcxF?=
 =?us-ascii?Q?5sFFZsXCM3tDa+QIo9lBPLw1uovwHEs5rwAxgEnOdM6WkJyowmGwcqaD1uGd?=
 =?us-ascii?Q?UAswBAilwwAGuzG4KshAs4wagFUUyRyzhcMLq0B3eaffUDjb4g65SxqeoxGJ?=
 =?us-ascii?Q?n6kXIr58LUPimcraUPExljDMYaRy+QaartMvGocC4RXFP7TCmddpJpgntnDD?=
 =?us-ascii?Q?msbltdXHdOLRvi2TNhytoU8qAIRvvkyfAcsCgQPmJxvmvF2sTVEgZrOv3SeO?=
 =?us-ascii?Q?2EzKykJDvw5aaakdHWdT0RX0E96j68v3o58jPVIXV3O6wAqnLMtcoXACcfc5?=
 =?us-ascii?Q?WOxbp03lTadz1gvcduwN8yGWWk48PY+K4LHZdoJZYn+KfhYXZj1KjiuvBmM0?=
 =?us-ascii?Q?BAEOpgpSygQR+Z3Ksshnwl/l/vfBydPPWhr5awtmMi/lg9KZs3HEeZKY2kzx?=
 =?us-ascii?Q?5MchaFCdtxFXNRArgeD636NluEoTNY7BkaksJjjFgJFk7FLQMx98Xq8/6yAm?=
 =?us-ascii?Q?O4CeJmd0yvA+7PSDa+UBzuiUVFd6bORxww7nyUJ+y13G064k7kPp3dDNZVZB?=
 =?us-ascii?Q?hz7f0O8WuOVgkSHDKaIB0hiiG05MMhmNR/ASbvid5yNxezISBMUO1WwyE2kY?=
 =?us-ascii?Q?jpc4lkZMjKNE2Mm+fAVh+77KdJPAPJv5I+ONuHKFcWSLuEo5n6VAaEQi545E?=
 =?us-ascii?Q?IUPzVw5a6caqeLjCLcSV5nTngafLSou1j5QiPkprGWEjqKvYYpyimQqu4Unm?=
 =?us-ascii?Q?v3WucnjSyv4WvQMHg9XD3yN6ux9uOSIDWpvZZ6xZd3Ox8DSxL91EFylg1zPc?=
 =?us-ascii?Q?Fxyoe37iDRz8Q1hDuFsoVzdHUq0HSbsggGDpBFlhFJFUkUPIzfGRU6UhsqOZ?=
 =?us-ascii?Q?Z36MJcJjwnGI4CRzMmJzEQYE6MazivEA57NygRD0SpGBo+tC/9cD/30sEPc6?=
 =?us-ascii?Q?zZUyYWE7EJXcJqIAZ4g6fXzKGheel0mX1/ADS9xRBt7L7GCfraFPgrH0xGtY?=
 =?us-ascii?Q?VnOxXuqIpIbGLtiBdptscnCnl1YRq7eE89MdJ+uiS2dvmApsDW119/11gNdb?=
 =?us-ascii?Q?aFdiAylwBpbIIo7ezni6mluCqcUQoz54oV4W4U2BdWCrTzyshyP7sDmK7XEL?=
 =?us-ascii?Q?PniO+fOCy1GZsyl4BuRQJsYgtq3DcFLbkhFVpSuO62tjI/PYr4k6F4GGjKVT?=
 =?us-ascii?Q?h+aoC5W0+339oBVN56/sEzcQxa8VvcrNxXrUXJF4twsOzLHwJCQY6BRDVV6I?=
 =?us-ascii?Q?GQAtJ3Qv6nukSyvfxkrJJ1ocJddQfXAitC1+RNZwvsX0mQIkWq6Ke09OscSX?=
 =?us-ascii?Q?Ww/qqeQM1GvJv426e3ZzFWQxPc/p12O0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nB3YrZW/YKSQnIXm1+E0BTxNhpXhEOF79xhM+Qmvac3hu0fVxLTsk66PlzT7?=
 =?us-ascii?Q?qskoSnNdMDBWBtZdTYVWV6ULZRi/8wKxZtAsSr8F1x8YABnsZynj7+i/BE9C?=
 =?us-ascii?Q?w7y1iELXG4ZBLIOEPRuHvzMOOMWzgxmPETcpSmpw0CgpeKtQq6MGsmC3JBHL?=
 =?us-ascii?Q?VcPHH0lMgvpdOpq7x4PIluzpEMU9/YUZzw/XLytfQebMMAod0jWN+7pLuf4a?=
 =?us-ascii?Q?snHqlV8EIQ3B7vMUzgI9F2aV3XgCYzR72lZCpSU/Q8RzrT2xlBQ2/p194nqc?=
 =?us-ascii?Q?9HBku6F4X8Dwl2lhGSpmWALeJz/dwv/0jX++QIGhzQq9+/FcZM5tmJ+0m5zu?=
 =?us-ascii?Q?9FuXFQgKfsnX3AQGQHg1DeJw4QqaZSZKuGu/qz2VZD4GMe7PbmrWvq/y7CFQ?=
 =?us-ascii?Q?fjLxAzRa/GrC51CmLhk0IW0AbYnjTzGhQxDdd1UfM+iB/Cm9i1FpQyremNuD?=
 =?us-ascii?Q?x7F2aqZ28iezOqrIFnj7kevSTsE5JMC9CmZzps6GR/UYPpsSkkJB8PCfSNtc?=
 =?us-ascii?Q?SaZvR1S+WrKtF8Klpzov8/jn1aFq80BBjfK4MphZGbnMTNCMVJptUfcbxRQ+?=
 =?us-ascii?Q?E3UoiuhboYqhjWsuGTvxDaPXdAnKYpIaWHGKf16c9OlvkZE+TPC8civjm+QD?=
 =?us-ascii?Q?TxOWmwrR4llqxEHRgbUSX4YTE/V9XQYNjZSF46rZlVsluCg+t1OAKlZgZYJ/?=
 =?us-ascii?Q?HQyHhJW86oHklQAfr5MjsVQ4zZt4DD/hkE90OmjmCSyxMP117KqsHWBwCg1A?=
 =?us-ascii?Q?7PGArN+nI024Z8SzLxjx3KYjuJaUm/o15wCnzehU0gu1VAjnIbWSXnQz8Szb?=
 =?us-ascii?Q?+Gug0KcyspXwo9R/+rf/AD0vKN/N6AgDfQPnzLq1YRubDoCbBmPUJRGJeOcM?=
 =?us-ascii?Q?RuBmPILVF3t8ZoAO8xq1SednVquFof0ak9Gv10SePbGc2sgdahyEbZY6bGXG?=
 =?us-ascii?Q?l3sTYN7t7Dh+Lw1zbKwHMektqg0GWGpS+G3H6gq1g9CwnkUQ07zlZiWcYvCc?=
 =?us-ascii?Q?b6YuA4v9Bw5x+On31SiTXue4Vyz10hql82mFBs2why+7V3EMiOp5+WoJiyj3?=
 =?us-ascii?Q?GLgnm2hRUjawg4E/0Vm6QhWaDr6MLpwg0BPxtymBTL250UKtMgW+NJRXDLuX?=
 =?us-ascii?Q?bS+VdUwshMeVX/At6rjOBqq/nBQ/0AOiDIS7QmdfEAx2h1kLevI5IIJH1RY5?=
 =?us-ascii?Q?BvH7hk++cI3btZhXdLgqnZuVnwp8Sd8TyYxryX65qYLHbLP9mFC8T+/SCY+O?=
 =?us-ascii?Q?mEWSpCQAO/Baad892EjWMyWZkVhTWWGhgyUdm8qJkkhZ6zKpJUH6rwju2VJL?=
 =?us-ascii?Q?QXJ9VzZk3OtvzLe1A1/58j6LBNntyPM9YhqNbhcJh4XkkZ6nQz5aMV8vP1rn?=
 =?us-ascii?Q?JWrwrZ5pmwePUyg3PM88K3rvpsfnVGlKMePBALdnHmT4hJyBUyWg0/J64LAE?=
 =?us-ascii?Q?wmVuUlI0OADBbiTcdhNgQRPfhvdjLZZrNirQjrN204tGp2P7StS/cHl0x9d0?=
 =?us-ascii?Q?fRuHfVLnnLHBudNBfL/yA5dhtNx5OgWFlRG1lUPZZndaJzlZU7LKgGFBaxI9?=
 =?us-ascii?Q?1aXRZHcQvYbUTp0+sBqXeb9xSUjHC8u/SsVf9T29Qj+qiUHNrjYFCDkDTWPr?=
 =?us-ascii?Q?ug=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6d0d87-2760-4080-1a6f-08dd1e567c7c
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 04:51:36.2130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RdyETGAmDz7Yw9+/3wpqLqKSwKJNuixKhfg5nRdW07cs8pIG3gfnHgLrIO5eiC/BXKjFAFQS+l5zZ6kYR8ziOYj/pqhntL2Dm1bmdzXP5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1872

When a decoder instance is created, W5_CMD_ERR_CONCEAL register should be
initialized to 0. If not set to 0, gray color can occasionally be displayed
on screen while decoding.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/platform/chips-media/wave5/wave5-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index c8a905994109..d94cf84c3ee5 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -585,7 +585,7 @@ int wave5_vpu_build_up_dec_param(struct vpu_instance *inst,
 		vpu_write_reg(inst->dev, W5_CMD_NUM_CQ_DEPTH_M1,
 			      WAVE521_COMMAND_QUEUE_DEPTH - 1);
 	}
-
+	vpu_write_reg(inst->dev, W5_CMD_ERR_CONCEAL, 0);
 	ret = send_firmware_command(inst, W5_CREATE_INSTANCE, true, NULL, NULL);
 	if (ret) {
 		wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_work);
-- 
2.43.0


