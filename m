Return-Path: <linux-media+bounces-47351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CCFC6CEED
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 07:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 7C2032E04A
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 06:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB06931D757;
	Wed, 19 Nov 2025 06:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="CM1mtJkj"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021073.outbound.protection.outlook.com [40.107.42.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4600631D723;
	Wed, 19 Nov 2025 06:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763533574; cv=fail; b=bZfojCx3VbZrYarZoBfOdjYGvuwJi+M4v6jmUutKdZpBAIMJBSdC2IIrPzFRldUc+2BbLgNiCqM4yHplVz5WDiZQaRdzVgzHxflRkptZ35O5dr3O6jqenQCAvPYup20giz1qECLpWCCxOX4AwjTWpccS6FNY3iIJh+SWAUsrIKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763533574; c=relaxed/simple;
	bh=TUOZWFog8cuGr8/2USfN0OMdVbQNkfCH0PHlfgWSM2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lLJWNOAziktugi0PYL+Rqn+pnSgn3m5NoPJn5wMsERO1Bk3rG/c5V0mSMw1gnqqqEKtJPRvwgIlowQqSieCp5vTWDU4i5S1qUOHVMcgl8i90xUMSpR1lGIpEF/BJ+zHvRzCljuVngaUHwqu948s0xHJ9DyyKqjLh0Kc9cm4OpBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=CM1mtJkj; arc=fail smtp.client-ip=40.107.42.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvV6M3NhDk7RTjgr6fmVDmGTR6J5f9KS7BYXZrlqIEiQ7mSGjzU/48pz+/0VUIRXf55HHhEXGVhuy627VkjmXuKjZx3M/caUoIx6Ubt6Kmx1iXJUOsNxnGZk3RowLGyyPHQPANM+BSAhDutzJAcBjcvfXQGiWwv2jPyfXK6FEeeflZEPg1ejGF7PYQZ6lEhHEOLZfw/lt4CkS9V7g0xiRpiBd/2CcOVhoh0mizKRbPFX72qx7VTts8/lQBNcbOnNyO+mDd3tD0IH0PSMR0nynDasgWHxqrKj7grcxfSYgTydxW4EfwShvU/5PuFwD6ES8Nr8XauRsVF2isNgilJbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qGfKNOZ7ZzMKseBL4ukPseWIPsLpbocHvdclnb9w0w=;
 b=LPGdHPJA9NrFOgKVUqLwwnV4P3ahM+7rYdvI2Y5I5KVVA9vP2XkgN8n+tJGhXUnROVpN5XYvtYq4XSWJODxdUdHUw0EJOJtz7dXW7wGHUDWrCktFnfZ6tdRefWZtotXi44ZlnVe2PpzakUCxz70fZYpB1tQehexxq5GoSD4XTE+67nxeItm6W8gck4TEsFd6l25ZqvWDKP8bnfvwwrbRk1xQQ6LODUe+KXMJFLZbL9jz2DrGU1j7aN9VcoFz5NHIk+reBG4thoAb7vYc98dxj53FGi4rITNjDVr9Q/LruiOncpLfDHcnZfME6PJdbJwr7cgc0Mdb4zwvBKSQgXSOXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qGfKNOZ7ZzMKseBL4ukPseWIPsLpbocHvdclnb9w0w=;
 b=CM1mtJkjTrR6W5XIMRpYGfJp5mZdk8qHh8pw//segT7bydO1Tb6QGPauaBtQG9ngHmQA9RY8KzMkO5cqSqRZMOgBQX39Pf2p6vP3//CAlpGezSakRU4dAIiygXIXESXGpLLM8uYpYvwJzF15+3TB/IW5o1m0NAOsIJxDWKc2Ovo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE1P216MB1996.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 06:26:00 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:26:00 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v7 2/4] media: chips-media: wave5: Fix Null reference while testing fluster
Date: Wed, 19 Nov 2025 15:25:47 +0900
Message-Id: <20251119062549.51-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119062549.51-1-jackson.lee@chipsnmedia.com>
References: <20251119062549.51-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE1P216MB1996:EE_
X-MS-Office365-Filtering-Correlation-Id: a95145b2-09f6-49c2-0dd4-08de27348103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0wQ0473poqanY8wDq2/X235gK0Nyyi0R+1LsNcdn/YBnDLSCHSF/sPmTmBPK?=
 =?us-ascii?Q?SQgXGP7fsle4ZRQd70zoPtddk9t3LWqCRtKnLfCXFsAfkYpVqcGihSRIjmNV?=
 =?us-ascii?Q?MVscrJTpoFQTj2UzYcpKBqijEJWuEnDJJcEx1K5ftsEBXvGHdCjfRpIwcj8Y?=
 =?us-ascii?Q?1NgTmmVqfTb3kOOOGnxrHmX/Wj70J7dYdI2QXkH5gfz0rhId4gWOlRZ2DvBb?=
 =?us-ascii?Q?D1esyNOzRmmDjDe1a/Ev2gS7koIOT+ELZ9ZTLIxhqjCyxm0EQ3M3jwXS1qXT?=
 =?us-ascii?Q?CxguXp8jHrlA6j2BVLgGCVr4krC0A6Lohl9EM9c2avkGpv3AABonBQLS8V2s?=
 =?us-ascii?Q?bfy2HKitg+5V9aQwsQg0jtWbO9jWeerLAspiXqhOFT9uUuMr4yAPob7LveSJ?=
 =?us-ascii?Q?Cf20JBcbgGBOOWn15vW48zYKJJz2UYhilrsxyrc1kK7F1/OFwMTCMJMVVqzT?=
 =?us-ascii?Q?vYyASMU2J/ie4EJPgWeO3WMfEQr7cSbrlpSwXft0DyVxmZFAzgIf2gGQZxKh?=
 =?us-ascii?Q?GXKOURQNPrAdL7x6GikwHA4O9Zg/VSkM7/9ybSX2zuopBecj99CmhO1N55CU?=
 =?us-ascii?Q?8MN6siXQAFWFvlTWisoFpTKjKrZFwbRQrPry11F+jD4/YvTTfU44zIDZM3pF?=
 =?us-ascii?Q?P5VgzybVVXFzJOSTknlvsrckp3FNqbZNe0kmpvWgmkR/UZjeqlA8WU93d0+I?=
 =?us-ascii?Q?gUhVWjLu/IzyjcFYc7Oi7opSUQbW9OtbCl+OVyMp4EHcdIk0ji1Wd0ApH7SX?=
 =?us-ascii?Q?HfiB4YQXqZcRXIX+dIu5AvEZB9LmOYmuOMfzRYJhA0OViwGr5gcU5EnWEVha?=
 =?us-ascii?Q?kwSaInSC3FeKi5e6a9zdHRb2XZe54zk1sYSYIYjIHeC81Uv6YlkAUP8qlNuM?=
 =?us-ascii?Q?sGB4lcyVdiYmsmYPzHUKoNdUvsXLtT4aImy6x7U7O/rmOt8OTGOE3dbxY+OL?=
 =?us-ascii?Q?MgQjRK3KKgAjAeOfn7JXR/fsAOkFKQM5bivz42ZNWibUc523UKOMrh8Lh/bx?=
 =?us-ascii?Q?TXv2gSoy/TSd+TRRCwZ/PF9spNbZcek5I0afwgVFcvP1LU+SezAYWs8BXZCu?=
 =?us-ascii?Q?tD6ZIpwRZ2Fy5iZVIgiLOqg0EU0CXyv4QtlsZrogC3exFpjuFlUGviY1G5qU?=
 =?us-ascii?Q?k6K07uct8USv/h21EkjJNKXZikqfP8nWCaNgKvHz01ikZ2yTN2xQ0q1ikBU8?=
 =?us-ascii?Q?BO+rw0/j0wCQj51U+7wEUGHai+YKI3YZ3S02L6wLT8/vNrvGwQSaavQv9MPG?=
 =?us-ascii?Q?/YwqDobqKYhxtv7CBmXo/oAdaSN9kZnbjRxnom20ima4XrV5Wnl2FyHQ+9IG?=
 =?us-ascii?Q?Xo3bN/cs8yjkm/uArXVTBktMBtVgvHRchd15NQNEsG2ZZE05EZTHoBmqMZlh?=
 =?us-ascii?Q?uazd6TmrhHPV92Gk+TftJuD99wgpm9YQOkU7S6MJ16+CB1nJ55e9dDrEE6x1?=
 =?us-ascii?Q?5t9wxA8NAIIDnbs/IWEo0NQf62u3DMKtvFEjzykuTAxtSeD/D18MHcl4D8zJ?=
 =?us-ascii?Q?oX/gWwuJlCF9eWGE59ZeiFOMs/S4e9UNFfja?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fa9xPGIbOBKJlYVK+Ton5+D4Nvs5rZRfG8lgKRHm1pXCfaiiGDx6sAesFM6x?=
 =?us-ascii?Q?wWNlA0EDAfu/qLmZB767y1a6o7q3qPSpLIVwDrCasWRgxUEf9XhSscw+LUy5?=
 =?us-ascii?Q?IKkwa1kmsNIyNjwPpBKrQlZBPiW9bK4zQxQBZFdS/muvbyXtSWK/I2teyiNP?=
 =?us-ascii?Q?rUQOUw5JViEdy1/P/dd3wDX9KUw+KMkzEkl4pLfcHDnUa+D+PALWFaEv8FB6?=
 =?us-ascii?Q?FIn1IKTimIPMhIz5Dwx/LLSxR0FzapUKR9RVn9j7kE4wnerKlguMLtQW0oLV?=
 =?us-ascii?Q?zeuhF+YoDHCHAHb0pqQHXtcdRUcQdaO06XO0bjmm4SRZXz+zZdHTRSdejb9m?=
 =?us-ascii?Q?f5Xz/A3tffHFvErquq1JtAwhCnSPC95oFJ9y59YkqgumZvfE8d4mNqg+uGFx?=
 =?us-ascii?Q?NEcubTNlCBGS05bheeJXZOjBU2+wZT3HV9u5jGUt/1f88DmIf3xsRS0qfooy?=
 =?us-ascii?Q?aNf9n+1sT8AfHjxkG1/f0twX0Zg7iFfibecvoHEawJbgxB2NIIui00OztEsz?=
 =?us-ascii?Q?0XkMEz/3A8mCocud3pu5nIVZNJw12bg7EPCWsNkcx95VrU020SI0nM52XWR5?=
 =?us-ascii?Q?ZeJtpjDZp2Awlzu6/q6JY2Y6BfSIrO0StY81wsB6xMCL6K57TrmME87hIogV?=
 =?us-ascii?Q?v7CJ4p/U4JUSmu92EEladfbw6Z0iorcb1bQoKUFQdeHeAdUwU/URfjl2nhVq?=
 =?us-ascii?Q?ia0IaXQREW4ugtqW6PpHoUl3INXg8GJ2JYILwmxNZYcIOR07TEMVwTRyz3tG?=
 =?us-ascii?Q?e8tApAMa2dGYcWzYmteIn18qTTi4nRIrbudtVl2vz/z0hoNy+kgwK46KnF6A?=
 =?us-ascii?Q?hY0I0pE2hg0IJDZ2W6gbmtAILhW51DgpQ5ZjBXSgUxSG+mf4liobSP5lKkrp?=
 =?us-ascii?Q?CcyUuE5gNJXDo6b4F7GBKXJ9Y7j8MfhE1HWcgqBRONrGnFDyPTTc4kkBBojJ?=
 =?us-ascii?Q?n5vJXtaZdAS++HrN2sQMRQZg+SUQbHWiBem0J0Em4PKSqR58nDi81sWlukEW?=
 =?us-ascii?Q?zqIDzHkM29zq8hzxg1em/9E/g/Z0R2O4zMwufdm5MeWjtkUrep7JSRj9FF0F?=
 =?us-ascii?Q?TGc3o2srQd9g9keQ0Mh4nojFdd4ADDS19SAHZPbeabNKdYUf41ACn9mByhiM?=
 =?us-ascii?Q?TJhXQpqxjNXxJA0x2xrBM8WNr+kAx1p6JXrUxvnj8MwEHncArzzskc92PmZp?=
 =?us-ascii?Q?WX8TRMShoViZ33Ft9uRBde1Cey9fdHB68MBzA680QOrJlIZjNwuPLSQrpbOM?=
 =?us-ascii?Q?F97RZdFCEttny+yF/3NDDVVHKFLTmfdfmdxRIv7/HHedsWiZIDLTCksXCqd0?=
 =?us-ascii?Q?EbawqJYTEqcfwRSZ9LumwewbVS/mkOi8/www/Nutsap3QKl87sX6bnIy6s0H?=
 =?us-ascii?Q?wh+tZnl0tN/FzyDiaK4UAu3gE+GIG53LWx2jVhU1LKu3C2nMCLusOW9tIQBe?=
 =?us-ascii?Q?28d/uXBhYWkHTSSDHPNmwc3vh8O4sWqsYTQjOMIj9ppZBuC770rPUcFG4M6u?=
 =?us-ascii?Q?xNtJcrvEoZaRRk8TnhoIW4+R1IjRPtT8sUudzpM3SiUpc7B9IfXfohRd2ge8?=
 =?us-ascii?Q?f8eKAg09AnpGL0aH5I6V5n3c2vXdybEbIkf/0fvwpa7s5zcrRMlKynRN7EBB?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95145b2-09f6-49c2-0dd4-08de27348103
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:25:59.0520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L42P4fkHaNUuxv2As2iQgKW9TWbLTFFiH0HPflJdge5zOx4ddCantO7gz5kEvVuDk6GhdqCzyzihKKW200IZUXb5BlEcOmPa3Azv0+mGJsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1996

From: Jackson Lee <jackson.lee@chipsnmedia.com>

When multi instances are created/destroyed, many interrupts happens
and structures for decoder are removed.
"struct vpu_instance" this structure is shared for all flow in the decoder,
so if the structure is not protected by lock, Null dereference
could happens sometimes.
IRQ Handler was spilt to two phases and Lock was added as well.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-helper.c | 28 +++++-
 .../platform/chips-media/wave5/wave5-helper.h |  1 +
 .../chips-media/wave5/wave5-vpu-dec.c         |  5 +
 .../chips-media/wave5/wave5-vpu-enc.c         |  5 +
 .../platform/chips-media/wave5/wave5-vpu.c    | 96 +++++++++++++++++--
 .../platform/chips-media/wave5/wave5-vpuapi.h |  6 ++
 6 files changed, 130 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index f03ad9c0de22..53a0ac068c2e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -27,6 +27,11 @@ const char *state_to_str(enum vpu_instance_state state)
 	}
 }
 
+int wave5_kfifo_alloc(struct vpu_instance *inst)
+{
+	return kfifo_alloc(&inst->irq_status, 16 * sizeof(int), GFP_KERNEL);
+}
+
 void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp)
 {
 	int i;
@@ -49,7 +54,7 @@ void wave5_cleanup_instance(struct vpu_instance *inst, struct file *filp)
 		v4l2_fh_del(&inst->v4l2_fh, filp);
 		v4l2_fh_exit(&inst->v4l2_fh);
 	}
-	list_del_init(&inst->list);
+	kfifo_free(&inst->irq_status);
 	ida_free(&inst->dev->inst_ida, inst->id);
 	kfree(inst->codec_info);
 	kfree(inst);
@@ -61,8 +66,29 @@ int wave5_vpu_release_device(struct file *filp,
 {
 	struct vpu_instance *inst = file_to_vpu_inst(filp);
 	int ret = 0;
+	unsigned long flags;
 
 	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+	/*
+	 * To prevent Null reference exception, the existing irq handler were
+	 * separated to two modules.
+	 * One is to queue interrupt reason into the irq handler,
+	 * the other is irq_thread to call the wave5_vpu_dec_finish_decode
+	 * to get decoded frame.
+	 * The list of instances should be protected between all flow of the
+	 * decoding process, but to protect the list in the irq_handler, spin lock
+	 * should be used, and mutex should be used in the irq_thread because spin lock
+	 * is not able to be used because mutex is already being used
+	 * in the wave5_vpu_dec_finish_decode.
+	 * So the spin lock and mutex were used to protect the list in the release function.
+	 */
+	ret = mutex_lock_interruptible(&inst->dev->irq_lock);
+	if (ret)
+		return ret;
+	spin_lock_irqsave(&inst->dev->irq_spinlock, flags);
+	list_del_init(&inst->list);
+	spin_unlock_irqrestore(&inst->dev->irq_spinlock, flags);
+	mutex_unlock(&inst->dev->irq_lock);
 	if (inst->state != VPU_INST_STATE_NONE) {
 		u32 fail_res;
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
index 976a402e426f..d61fdbda359d 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
@@ -33,4 +33,5 @@ void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
 			  unsigned int width,
 			  unsigned int height,
 			  const struct v4l2_frmsize_stepwise *frmsize);
+int wave5_kfifo_alloc(struct vpu_instance *inst);
 #endif
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 528387c6ecf6..b10396fa2379 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1808,6 +1808,11 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
 	init_completion(&inst->irq_done);
+	ret = wave5_kfifo_alloc(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 1bf1b92147bb..7714826277e6 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1754,6 +1754,11 @@ static int wave5_vpu_open_enc(struct file *filp)
 	inst->frame_rate = 30;
 
 	init_completion(&inst->irq_done);
+	ret = wave5_kfifo_alloc(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed to allocate fifo\n");
+		goto cleanup_inst;
+	}
 
 	inst->id = ida_alloc(&inst->dev->inst_ida, GFP_KERNEL);
 	if (inst->id < 0) {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index b3c633dd3df1..c00595b43bd3 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -51,8 +51,11 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	u32 seq_done;
 	u32 cmd_done;
 	u32 irq_reason;
-	struct vpu_instance *inst;
+	u32 irq_subreason;
+	struct vpu_instance *inst, *tmp;
 	struct vpu_device *dev = dev_id;
+	int val;
+	unsigned long flags;
 
 	irq_reason = wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
 	seq_done = wave5_vdi_read_register(dev, W5_RET_SEQ_DONE_INSTANCE_INFO);
@@ -60,7 +63,8 @@ static void wave5_vpu_handle_irq(void *dev_id)
 	wave5_vdi_write_register(dev, W5_VPU_VINT_REASON_CLR, irq_reason);
 	wave5_vdi_write_register(dev, W5_VPU_VINT_CLEAR, 0x1);
 
-	list_for_each_entry(inst, &dev->instances, list) {
+	spin_lock_irqsave(&dev->irq_spinlock, flags);
+	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
 
 		if (irq_reason & BIT(INT_WAVE5_INIT_SEQ) ||
 		    irq_reason & BIT(INT_WAVE5_ENC_SET_PARAM)) {
@@ -82,22 +86,54 @@ static void wave5_vpu_handle_irq(void *dev_id)
 		    irq_reason & BIT(INT_WAVE5_ENC_PIC)) {
 			if (cmd_done & BIT(inst->id)) {
 				cmd_done &= ~BIT(inst->id);
-				wave5_vdi_write_register(dev, W5_RET_QUEUE_CMD_DONE_INST,
-							 cmd_done);
-				inst->ops->finish_process(inst);
+				if (dev->irq >= 0) {
+					irq_subreason =
+						wave5_vdi_read_register(dev, W5_VPU_VINT_REASON);
+					if (!(irq_subreason & BIT(INT_WAVE5_DEC_PIC)))
+						wave5_vdi_write_register(dev,
+									 W5_RET_QUEUE_CMD_DONE_INST,
+									 cmd_done);
+				}
+				val = BIT(INT_WAVE5_DEC_PIC);
+				kfifo_in(&inst->irq_status, &val, sizeof(int));
 			}
 		}
+	}
+	spin_unlock_irqrestore(&dev->irq_spinlock, flags);
+
+	if (dev->irq < 0)
+		up(&dev->irq_sem);
+}
+
+static irqreturn_t wave5_vpu_irq(int irq, void *dev_id)
+{
+	struct vpu_device *dev = dev_id;
 
-		wave5_vpu_clear_interrupt(inst, irq_reason);
+	if (wave5_vdi_read_register(dev, W5_VPU_VPU_INT_STS)) {
+		wave5_vpu_handle_irq(dev);
+		return IRQ_WAKE_THREAD;
 	}
+
+	return IRQ_HANDLED;
 }
 
 static irqreturn_t wave5_vpu_irq_thread(int irq, void *dev_id)
 {
 	struct vpu_device *dev = dev_id;
+	struct vpu_instance *inst, *tmp;
+	int irq_status, ret;
 
-	if (wave5_vdi_read_register(dev, W5_VPU_VPU_INT_STS))
-		wave5_vpu_handle_irq(dev);
+	mutex_lock(&dev->irq_lock);
+	list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
+		while (kfifo_len(&inst->irq_status)) {
+			ret = kfifo_out(&inst->irq_status, &irq_status, sizeof(int));
+			if (!ret)
+				break;
+
+			inst->ops->finish_process(inst);
+		}
+	}
+	mutex_unlock(&dev->irq_lock);
 
 	return IRQ_HANDLED;
 }
@@ -121,6 +157,35 @@ static enum hrtimer_restart wave5_vpu_timer_callback(struct hrtimer *timer)
 	return HRTIMER_RESTART;
 }
 
+static int irq_thread(void *data)
+{
+	struct vpu_device *dev = (struct vpu_device *)data;
+	struct vpu_instance *inst, *tmp;
+	int irq_status, ret;
+
+	while (!kthread_should_stop()) {
+		if (down_interruptible(&dev->irq_sem))
+			continue;
+
+		if (kthread_should_stop())
+			break;
+
+		mutex_lock(&dev->irq_lock);
+		list_for_each_entry_safe(inst, tmp, &dev->instances, list) {
+			while (kfifo_len(&inst->irq_status)) {
+				ret = kfifo_out(&inst->irq_status, &irq_status, sizeof(int));
+				if (!ret)
+					break;
+
+				inst->ops->finish_process(inst);
+			}
+		}
+		mutex_unlock(&dev->irq_lock);
+	}
+
+	return 0;
+}
+
 static int wave5_vpu_load_firmware(struct device *dev, const char *fw_name,
 				   u32 *revision)
 {
@@ -224,6 +289,8 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->dev_lock);
 	mutex_init(&dev->hw_lock);
+	mutex_init(&dev->irq_lock);
+	spin_lock_init(&dev->irq_spinlock);
 	dev_set_drvdata(&pdev->dev, dev);
 	dev->dev = &pdev->dev;
 
@@ -266,9 +333,13 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	}
 	dev->product = wave5_vpu_get_product_id(dev);
 
+	INIT_LIST_HEAD(&dev->instances);
+
 	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq < 0) {
 		dev_err(&pdev->dev, "failed to get irq resource, falling back to polling\n");
+		sema_init(&dev->irq_sem, 1);
+		dev->irq_thread = kthread_run(irq_thread, dev, "irq thread");
 		hrtimer_setup(&dev->hrtimer, &wave5_vpu_timer_callback, CLOCK_MONOTONIC,
 			      HRTIMER_MODE_REL_PINNED);
 		dev->worker = kthread_run_worker(0, "vpu_irq_thread");
@@ -280,7 +351,7 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		dev->vpu_poll_interval = vpu_poll_interval;
 		kthread_init_work(&dev->work, wave5_vpu_irq_work_fn);
 	} else {
-		ret = devm_request_threaded_irq(&pdev->dev, dev->irq, NULL,
+		ret = devm_request_threaded_irq(&pdev->dev, dev->irq, wave5_vpu_irq,
 						wave5_vpu_irq_thread, IRQF_ONESHOT, "vpu_irq", dev);
 		if (ret) {
 			dev_err(&pdev->dev, "Register interrupt handler, fail: %d\n", ret);
@@ -288,7 +359,6 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 		}
 	}
 
-	INIT_LIST_HEAD(&dev->instances);
 	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "v4l2_device_register, fail: %d\n", ret);
@@ -352,6 +422,11 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
 
 	if (dev->irq < 0) {
+		if (dev->irq_thread) {
+			kthread_stop(dev->irq_thread);
+			up(&dev->irq_sem);
+			dev->irq_thread = NULL;
+		}
 		kthread_destroy_worker(dev->worker);
 		hrtimer_cancel(&dev->hrtimer);
 	}
@@ -361,6 +436,7 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 
 	mutex_destroy(&dev->dev_lock);
 	mutex_destroy(&dev->hw_lock);
+	mutex_destroy(&dev->irq_lock);
 	reset_control_assert(dev->resets);
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
 	wave5_vpu_enc_unregister_device(dev);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index 45615c15beca..bc101397204d 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -8,6 +8,7 @@
 #ifndef VPUAPI_H_INCLUDED
 #define VPUAPI_H_INCLUDED
 
+#include <linux/kfifo.h>
 #include <linux/idr.h>
 #include <linux/genalloc.h>
 #include <media/v4l2-device.h>
@@ -747,6 +748,7 @@ struct vpu_device {
 	struct video_device *video_dev_enc;
 	struct mutex dev_lock; /* lock for the src, dst v4l2 queues */
 	struct mutex hw_lock; /* lock hw configurations */
+	struct mutex irq_lock;
 	int irq;
 	enum product_id product;
 	struct vpu_attr attr;
@@ -764,7 +766,10 @@ struct vpu_device {
 	struct kthread_worker *worker;
 	int vpu_poll_interval;
 	int num_clks;
+	struct task_struct *irq_thread;
+	struct semaphore irq_sem; /* signal to irq_thread when interrupt happens*/
 	struct reset_control *resets;
+	spinlock_t irq_spinlock; /* protect instances list */
 };
 
 struct vpu_instance;
@@ -788,6 +793,7 @@ struct vpu_instance {
 	enum v4l2_ycbcr_encoding ycbcr_enc;
 	enum v4l2_quantization quantization;
 
+	struct kfifo irq_status;
 	enum vpu_instance_state state;
 	enum vpu_instance_type type;
 	const struct vpu_instance_ops *ops;
-- 
2.43.0


