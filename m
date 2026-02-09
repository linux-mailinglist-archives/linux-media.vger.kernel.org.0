Return-Path: <linux-media+bounces-52454-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKkIHUMpimmsHwAAu9opvQ
	(envelope-from <linux-media+bounces-52454-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:36:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FFE11398C
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A3B330219AD
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424A43A0E98;
	Mon,  9 Feb 2026 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qekkYYja"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012062.outbound.protection.outlook.com [40.107.209.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD6C30E826;
	Mon,  9 Feb 2026 18:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662167; cv=fail; b=ld+mPBL1PKVmo42UX+uzy4O1+V142dhhPrhXOsLnlv0P5vsi/IMXnzUbUrL32/a5XAb+ol8s7tf88F0oIsyqq6q97Ku7nU9WqwYY7Nj78gce2XX0OVJD2KxIXBBvLmjh2yXwEtJXq9VpuKYnrB7BM1l9Zjr0LgLRQu0ybsj3Pys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662167; c=relaxed/simple;
	bh=IH3F7G+w5fetQiIALjKxf847cLClmOHyl7UDjNgl4Ss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UBpZ6tu4rDYdWU3R1iJ2cl3HVYdcFddgB1Y48X9ONSG8FMQB4pTXjk7UtP1cg0QnGJ9q2XlW7k6MgaUU+ml7ob6ERus+7mufBIW7+PbgQDUDJ+CTrhEKoX6wMXTO4NwjSvZRotB7go4hs+0dmugL3AqLqVGMBbzK9sckEt3H9aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qekkYYja; arc=fail smtp.client-ip=40.107.209.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKILI93FCxE/g1SnyreKK07dRf8hRCQVfE3YiP6Xk4gAeYWE9s2GJrK6Wc7rmjExf1JbD+u1MrMZxAQfknHcINMi81y6VYeHPYvwuP1WDwq5BHfhI2KqxJIB5e+Ez0WlY7wMo6lY/Lsz6s1qgO4w1liCysN/yShkSGlkBAI5tkux0wPJAqQRws3dd+nFzncRrukBTSZDvsKVh3+0mOMdBpNHARSHn4mLmya/8+7Pa4aG/tYqp0Rwxub1UUwsgi4UU/OcX9rAj/mhjlPv74wrFt0FVeCxWs7UN7NdLi4n6oj/ajc9uWEUouU3rS5nq9FuLia0PcEGKyBDa5gIJqhZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ9vYNcNXMmrBjisIAL1F3J5QBDB51ZpGQQJNhw5C3M=;
 b=virzYAcBei8N6tss37LLmBvWnUt7r+mj6poyHvzr9A+zoJcxi1yxV2WJX8eMgaPiwRy9awYh3Y4EKdd51L+XX/dMdlnNx8RYgV/AR4UcAJnIpJcCx6YtjYy9th/TZJqE1Rmed2HwnsW9KkJY3AaFXkETOyd7k8LWR8BuUjlZqKDBRTrG/ZNJ5sC2XsJ8VDTLrWK4hCdEwKmc4tyh9MokKNmevghJ35/3EaHpJL+Vj2eekgXPexvHGYn0piLhKurfWAfXVWWWcUVBHg+ZiynJoYaubizLULKMZxzcOEJyhT4Co3tRIFeVqH4F5VipMAjGIbjNjAWgUCXv7XaMlP6H4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQ9vYNcNXMmrBjisIAL1F3J5QBDB51ZpGQQJNhw5C3M=;
 b=qekkYYjafzJv1vfKFSm0bL7vwDvarECg8zsii5ItioYR5idKf2nQe/zbtLn8RLo0VOlfNRCtF/Az2mQW87BRRt9k8+yrq89O+32QJJFRLzF4pkEcc8Bcc4V9+gedf1lBuwg/aO1dNb4pn81hyb7vZAtpd4kfda9i+zkT/mTnzyM=
Received: from SJ0PR05CA0171.namprd05.prod.outlook.com (2603:10b6:a03:339::26)
 by LV8PR10MB7798.namprd10.prod.outlook.com (2603:10b6:408:1f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 18:36:05 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::80) by SJ0PR05CA0171.outlook.office365.com
 (2603:10b6:a03:339::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.5 via Frontend Transport; Mon, 9
 Feb 2026 18:35:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 18:36:03 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:02 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:02 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:36:02 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvt52052904;
	Mon, 9 Feb 2026 12:35:56 -0600
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v11 09/17] media: cadence: csi2rx: add get_frame_desc wrapper
Date: Tue, 10 Feb 2026 00:04:48 +0530
Message-ID: <20260209183456.1906327-10-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209183456.1906327-1-r-donadkar@ti.com>
References: <20260209183456.1906327-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|LV8PR10MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e824a4-d685-4649-169b-08de680a1445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hWY+BlsRsqZCK7cghumpGpzhhwokVrA6C1h6lvdGVUlReuI+1ZdIucyec4o/?=
 =?us-ascii?Q?cKo7/dAkAUUa0YWjqCPwQALDbWnj85l57ON2qT/lnjaoJ6QyP1IfAxcJc8Uy?=
 =?us-ascii?Q?T7Yoq1OAHK5O1rcOlERNkS27jKTluD9QH7JExry/M92VrGyPyfT1wLx/MTI8?=
 =?us-ascii?Q?6kHty+nJUe+BApWARZxz5m5cdYAUvMiXESHqD0YwNtwvGB2A74K33N0l3TaQ?=
 =?us-ascii?Q?R6IpGMliLE97E44UxGjXqwI2gF5OzQ4IJQMuX+r+ssvobgBpd0K5Cd/IMBYY?=
 =?us-ascii?Q?xuMwUOKwDu7uiYE2FX2eyayC0Rlzk3ofaSWhzmEDIqyJlyBfqEatrQWC9usu?=
 =?us-ascii?Q?jHeHwBYm+NKndy/ermhimqnRFJ27HtiS01QuHXplg9i7lBVnsz6EZkT6udJi?=
 =?us-ascii?Q?iMsE9LJsbSTDRzOYjydBvOn4mLrvaX9HXJuzYVifcMrpnkIVs6ACAR7clGcG?=
 =?us-ascii?Q?cx1/7Nd7QWBnkt7U7tonF9QPwoxaWIqZTo1YgoYML1KWwjOyMt+HrkbQGbKe?=
 =?us-ascii?Q?F7rB7grBDjWqyNIzIqfiZaMXeiweZCZIbqktgp5JdYlnwvSOPOZ0Evl/0kjO?=
 =?us-ascii?Q?70KtrNaREX/CC1lNI51MI5Jz8id8H4ONpuyNuaYiXZWqyQps4mJ7jbni1VrU?=
 =?us-ascii?Q?BuCGB7cih4ZfcG8ryhS+3DoC3+cXre60jOWw5r7Wz+B28zRn5RohOU0kv6tw?=
 =?us-ascii?Q?6aeoQ8JJL83JVJvnyN+AbAGVSOQnJZTUzWy2gn1zmNU4huj0D8UZnrzkjVre?=
 =?us-ascii?Q?V6ztW5m6Ms1RpGgYD2KObc0vHKJEs2Y+nO2vNoIJTgyQoobAgUKjimgkNz9C?=
 =?us-ascii?Q?eFYJap2Itsp4XdZ/615mQX4DnkWa8DlLtebFpfbSeF2XACr0Ubw4u3vm294E?=
 =?us-ascii?Q?jQR72ZVkXP+NnIhT2Ec7qhq+MetTXVL1vAUkiyI4HrMx0vn6z48U5Bfeq4i2?=
 =?us-ascii?Q?WLf87po39AQk9LuakPdZslJrXD+7j5ql9V5JnbbGGtjcLTgItXkEBx/F9zTe?=
 =?us-ascii?Q?7JTt42FL7XTyByJwocJuLvuBSV3jyeMiihugPvrMYd7Sj9q1Ar9pzBzhvftI?=
 =?us-ascii?Q?FbXCs6Y62eoblg0ViU5Wa0+R/y1Gg9nN/p1YR6pQzz/ou2Kb+Y2FMsobIuHB?=
 =?us-ascii?Q?UibQFMkWPWDQkrkiwccHTEjIZ1Nwk75GvzWeFQ3QjKvrtI0yus+0Nnwn4y68?=
 =?us-ascii?Q?JdUtyTeL9Pno+iBwljVn5TivuWw677BwiOK7HFo1RGwvW5bYNKYAnAw+s78J?=
 =?us-ascii?Q?CG2R8aG2i37p3+kb2yDyt9qUJHEW95pqDeySdE0q6RikrDbZS+k5Jb01Iir2?=
 =?us-ascii?Q?RKz9ATuHGIBFKNbPoPUsztkHjAfxrU3WoU5Z2bZg22uKnLe8UoLTrUVAPdMI?=
 =?us-ascii?Q?+CIZAHNHjfbb/K54cvALWrQCCgrW8WKM/5IaxkxKpzJL47t2/YU7WSqCQ3Y8?=
 =?us-ascii?Q?0DAdspYx6uuj3o6nO/O3Wt9pvNgA21H8iyjIyze0Cl1HtAjjZtJqabKLq41m?=
 =?us-ascii?Q?8y+HjjgSNqgNxS8BbxGOdec95P0jjtupZ6VScfT9xyYv5xYi8s3nnE5CLJuO?=
 =?us-ascii?Q?f4O0fcXA6UqPjUIT3QX982P2JSHpAFWv6HB9O9+FOksMEAYpCPufRB8z6ZS6?=
 =?us-ascii?Q?5kmpu4sCJdYNOUBehGd9iV7/XBzhpPQ7J8A6YdrMf+FBtxUa5OzMnajxzA2h?=
 =?us-ascii?Q?BG2HIQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lE9SCIFPrGECivZuoaibdeq7eBB6x/y/hPKx4rrqRA0q5SfeLhSX0Ww+7VmwgiZqkD7XjZ3EQQTfda8TH2jxe5MMRqkJxc8AGOGWtgVZyx682gxEcDY3rA0NAwpm8QsAscTKJTaT1eAMW46kdP3bnB/df+o6pGlYwk/BpsZwIPwKEHeka8DNnY7VcW3KSL0E3MAqUwFN/8cRcjCIRdOgkaLIofN0awMXv70rtzTZ30heZJVJGYyChoIVutipzf9YZ4IGR7mNkEQaEcdj/hG5D/B8RW1gEy3t1FzZ0OFgjqfnf221m3suOCPRiQzXliTHLYEhN2b6N/dwJBfzwvSOSqhV46T+Wz3RGOTx6+CS7wXD4dCCMIKsVU5Lhkm1n/w04+f8ixgNTbVgSv1Tm3d7cJ1rtUhKh16nmrMnmq+YzKcsBgGm5PwTvorDbWsYrflq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:36:03.1466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e824a4-d685-4649-169b-08de680a1445
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7798
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52454-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,starfivetech.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 24FFE11398C
X-Rspamd-Action: no action

From: Pratyush Yadav <p.yadav@ti.com>

J721E wrapper CSI2RX driver needs to get the frame descriptor from the
source to find out info about virtual channel. This driver itself does
not touch the routing or virtual channels in any way. So simply pass the
descriptor through from the source.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 8e7af2da62262..65c6acb02f85b 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -229,6 +229,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
 	return NULL;
 }
 
+static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
+					     struct v4l2_mbus_frame_desc *fd)
+{
+	struct media_pad *remote_pad;
+
+	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
+	if (!remote_pad) {
+		dev_err(csi2rx->dev, "No remote pad found for sink\n");
+		return -ENODEV;
+	}
+
+	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
+				remote_pad->index, fd);
+}
+
 static inline
 struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
 {
@@ -611,12 +626,21 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
 }
 EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
 
+static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+
+	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
+}
+
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
 	.enum_mbus_code	= csi2rx_enum_mbus_code,
 	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= csi2rx_set_fmt,
 	.enable_streams         = csi2rx_enable_streams,
 	.disable_streams        = csi2rx_disable_streams,
+	.get_frame_desc	= csi2rx_get_frame_desc,
 };
 
 static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
-- 
2.34.1


