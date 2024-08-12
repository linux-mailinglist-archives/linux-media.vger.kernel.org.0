Return-Path: <linux-media+bounces-16109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C46CC94E76D
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 09:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 475291F22ED4
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 07:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEE915C157;
	Mon, 12 Aug 2024 07:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="JCyQTjSk"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021080.outbound.protection.outlook.com [40.107.42.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12169152790;
	Mon, 12 Aug 2024 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723446527; cv=fail; b=KIWZ86aKs5jj8Ue/e3ZkRH3qmzS772OWBVzpWbAEMG/kjHU0Bk+sALwScSnmEESeqLl0Ot5r/We7IXZA7bXnGaxf96tgRB503F6LQtEeNzcfuEQe0klGr5CMFVcJnjuesyoevZ6MT8NtZK/bTx2c8vapFrsDISx53d4kz1CAf1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723446527; c=relaxed/simple;
	bh=kSDctqTnLEaMTcIwVIkXuc+h23dPmZ7zEJMLWdW9WEs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q8AMi5Xl3OUty8fUwknLz7zJGObV/odvgTETmWj5Jd9oznOJCaJce1wjbhNTeljrW4nCgkXnCt5cAV+17WaeGWpDOAgJN8g/VrLWmkfHa2Nit4yMhCHZsEFj9qy6YgEHlbkAHcAJcJm4IvSvUvQhCRzCX+uL7ITzBLOd/CD1SOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=JCyQTjSk; arc=fail smtp.client-ip=40.107.42.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjOPLkhL34oLvfSyainq6K+alrJq05vnIbMTyWfcKqRrCR+ao9zIve1LEEvoLHIEaQb66U4/QexB3H7TRBvDuqz6LpJBEgCfzDlfShPKPlrLHsStm4Gg9VMQTYSzPtqiLZ4WDgY+Ry0Ov+TsmLtshEE2CXUwv8shXN1m6c/Rd9H68HgQJBoB08NGUjXOgS2/9hWh6N+tqSogiD1Gw9PfgSKATIBjRZZ8f4+2lQ7h1tZj133izwnfq5I77c9JMGnzjTmlo+SsDZMQMAc3e6yJ0arQQaBC0DvrQU2DKU7KoMhe4pjfSiGrRgG5pE2YmCynI0DHABYmuGl2bN13o/mgpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWbNLWskET9h61KXYtOCGImr7d5KzHGfun3x8NvAomQ=;
 b=qZh8CBv5r3+kqp1I7DHrUuHhEPezutK4lMTFsfLY6vwxNw54XUlDLEqUumNgJn5gK9AZsUSVnnaok0NYQOmCYQWlIvGMqkr+Sg/Y1EYqCILrcAc9Y41IGQZ+3e/+NtL0nnSGcNbcKlieyn4AtUiWMrOg+K5ngrEE65jQ4vn0BDOx/+wPrF0xK0kndRTyA/AjcuInG4+7zhlCKz/FkQfESuxhR1F7MuHIS8xOW/sywgnqgIMOZZe8Sg6LkpKLa7e6Y05ooBc/O2hcvoCHlPMPdvDRGlt33A0eDTvJmWmpK6sHZWi5U3al5kfxBavyPG8smNq0jjLNpOWSy4jcstSexg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWbNLWskET9h61KXYtOCGImr7d5KzHGfun3x8NvAomQ=;
 b=JCyQTjSkDQFKhNsrRDiM7yZc6qXVh8a6OCP96yzTwqdiF6DWcsblyT5DFkoDfyeBdlcxETd7Q7prsGDHggMPwbSOmpSm+vnOVH8cP4ECtIoGcprKPklt+TcOyQDea3/l+oiTY2t9pPQJkanjU/eVCPmeQytSnZnWAYOhk1EyF3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB1530.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.20; Mon, 12 Aug 2024 07:08:39 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%7]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 07:08:39 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [RESEND PATCH v7 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
Date: Mon, 12 Aug 2024 16:08:20 +0900
Message-Id: <20240812070823.125-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
References: <20240812070823.125-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0154.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB1530:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d12b3e3-dbc2-44f5-e21c-08dcba9d975a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DAJp01uaWpVAZwAr508ayXNkopfRBnKZnLHvHzFX6EHTkCySmz4rdM21wH49?=
 =?us-ascii?Q?/b2lb8dgeIiCiCCaBcFLS637PUTTV6x4ELQSZH3g14lFb2KRoqmZ/wUlXAPT?=
 =?us-ascii?Q?IAJ/xV0SxyS5QO5G22RzMp77+5RAf5jVz3zqW7htdGQEY/SoH3fLMnxqNiKn?=
 =?us-ascii?Q?4YRyfTQLCQuT0VW3DCzXHgsiHIfe5j6ahAbDqHJWurdC53cs7PHpqwJ0pq+b?=
 =?us-ascii?Q?TTV4HjX+/ll1FPg1cSsIf3DT03yljnbB6VhRBydbelB0btXg17W4WF5VYW6u?=
 =?us-ascii?Q?lkilu/BqXsKVWyEkVjAKAKEuQNQXE/f3GdKQGIhU3bKNXh1dv05hM+vl8m+w?=
 =?us-ascii?Q?1VtXokEXmtmgc58ElJR1Zdf7i0NQ8NK6KZ4C8h8/X7ZZXf0khPuGNZ9EUBHj?=
 =?us-ascii?Q?nssx6M8dISQd8/OcDFJTULqIdioggmrwmIWXGV6lQlKPYVPe48l/edSt0Lt1?=
 =?us-ascii?Q?bxvuC8ps4jg9WD7eb8OkckxefCETqHe7DJmThAAIz1oUSQYU5ownj2pntJLy?=
 =?us-ascii?Q?QO2BjPKxwNxVTlgD/VHkhcav8veuk1SlpBXKqbBq0iA8jtiRbk/hjMFx4Hp0?=
 =?us-ascii?Q?oKAvRCmOO+PJe0nHU70btWj/1ioP1cGia5RSD5DM+CFfZX1/hq7wyPgZQMTG?=
 =?us-ascii?Q?Doe7FSWkbggURduEv7vK3YS9KHAIeEn9rm8X3dxYQngrxAbq8bWDdU3/ohuR?=
 =?us-ascii?Q?Gi8iAiF57KnkJR/IYZrWT3QASi6WN2O8Bf5Et6XZtREwLk4mGE55JOUWVixu?=
 =?us-ascii?Q?G29VxclxyrqVQ9tsFdn/jw6NRMle+Kk9wk1N42+gUmNCvkJ1N9qPWHW3Z7Vu?=
 =?us-ascii?Q?BeF3tVE1Pw2JKSBDTr36TxpC7lpKISwDHuGSaz+djRDqZuJsLHUgDOGWkj39?=
 =?us-ascii?Q?FLlh7NFVsonAcbgVLVR8xanLAVrVbp24L0tXeVl8IiHvWFPuL19DOD7RT1sj?=
 =?us-ascii?Q?r3N/PKypsmu7BmfEUC9/RD2ZiXYrzuEKDvBsvwOZyEy0PIvBYR3/0c8xBERf?=
 =?us-ascii?Q?fGOC+jCqbQH9qERZSzgq0FdAhVNrIqlDRZD6GPUgA0ABdmAN7CTW5mv/H4s0?=
 =?us-ascii?Q?ZsIRiTfea2d4GiWjsAFBTH+gMtGjj+UKKkyj+t1DoBks5UOsGMZ0kHKORJ22?=
 =?us-ascii?Q?mQ1orkxXxXRyUwrP0k8UAGUeYxrJDcJ9Kkz/o+2CPgezofeGA1X+PLYHJLQP?=
 =?us-ascii?Q?XQ8OILE90JLSJTbjVaB8w3CVxkMqBoCLeDR5XveUL8NDRrPn0ehAlM3oZg/P?=
 =?us-ascii?Q?XpvnIBGUOUrMkB8b2F/S9+vrolo1TrCXZRO5hXQ/z20N0V+F+ztQGdThybS1?=
 =?us-ascii?Q?NnLMj76odOMhtB8LbxvwvHGRXj1pnCoGBIwVtn6wR5QFbm/Eni6TWc2M4bFy?=
 =?us-ascii?Q?ksrrmNwaJcq3tayCSU9JpI3dycT507ALvKLOV6wUAxDPUH9Wug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hlkJrfIOlqDhICXjXNP5U8dJT6Wyh3fghU0/ijvAwmzhYVzswBTX6+2bAazH?=
 =?us-ascii?Q?KAi7a8eTWbZug7vEmYojGCC+Nt7uYhiARkKJP/lO2wxUfXp0fJDorESJw5gf?=
 =?us-ascii?Q?06N4CGJj45OZI6M32Whm12nsMhIVo1GwkxsHQGH3C+9FeKWKK9+wZwQ2XCo8?=
 =?us-ascii?Q?9o3BnTVq3AeCKy/Inx07CNR7vlT+o+5JaMIbhO6A0jl4AuGYUvREF+41aguj?=
 =?us-ascii?Q?AbroloHJiy9A+Xa6AzSzoz0QtHpBUO4DEQX2c/GP2+UoeuoKB7GEu7oBFfzb?=
 =?us-ascii?Q?hSUhbg7C85+4cPNMAwYyJHFhnQLzsbDQqFMLRjnM1H+taz303G42PCVsNASQ?=
 =?us-ascii?Q?IA9UO31Ly7gb7Y9rYHI6PlCLWB4p8rBIylHtkdkiutlYX32h3/XixQD75EoQ?=
 =?us-ascii?Q?gKG9Xfr5ojt8mQG3Cy0HY6TFJkdImumPcvWWtBA9307sPGx1stOGEqgsjjEJ?=
 =?us-ascii?Q?JW3m+QmCbRD8hSHV9cULOw0TUq3k5n4a1pC3qZJUB3TjsiHu6zkF4vwa2zJ/?=
 =?us-ascii?Q?dI4e4Uwk2JPv40MKy6e+h2MKEl9vqTgUYbqAuWLy4oOFN8mfMzJmyfzTRF4C?=
 =?us-ascii?Q?W3BR3IV1k6hERAcRoFQF3K9tSFow2SO44x+2KLZDunEEtQB6VC3/q4VEd2QF?=
 =?us-ascii?Q?4YMrORKxFKF27h7Kpc8Wy9D1TOWygQe8Osz8Wf5Aj8OeibkOG+BJu8Uvswnl?=
 =?us-ascii?Q?0Pq05fUbj0MXk2lNIOprNDNKAfre/Rn7D8ZamU4sAWT106ceMRtVktkBwc1J?=
 =?us-ascii?Q?d+IUrDrtAid7VJ9B8Zd0zY1xnIp+HnQlfprhJARBefcazTR6DLkw64JVIhk1?=
 =?us-ascii?Q?6mhh0V0IooA+D2PN3UHYPPqvmQWQQInvdej+v2CTkcIoPj1c5bY6QircF6SW?=
 =?us-ascii?Q?ZSQBl+wl1e4kbOAPW2GY5M366aTjvkUeTCgBysFGOczCXOQHv8J4WByLVx+v?=
 =?us-ascii?Q?NSC2GQ8+jjtDZen7uZFqWf45YegYOW4KpvSvXLxJ7j5CqbC4hZDjFDWfR/nU?=
 =?us-ascii?Q?GS8Neoi32O9lRJCxM43mrQQTBXSIQUwYXpEac0zlSCOU85JJkGr7FylKB3up?=
 =?us-ascii?Q?rOcr+z0I+LmFUaROazmKZQYcFW4x1v5yMRhyjEzMBm9wWTb6wJZp4veaChy6?=
 =?us-ascii?Q?LAzO53ujyn72VPcsATklOVet5eGae/yj0Iz/lFaJ2ZipGNVOpJV7+jaQpird?=
 =?us-ascii?Q?S+TvGzzOnw+KMIE/J+ctPDB41W4PJH301YXxAA426CBSfhNsxehiYgB9Sapx?=
 =?us-ascii?Q?cm6M/PsWgpNjO17zTQ8GqwWWk8BRzarHjKXJ3IQ88MJbY1KYuubxGb6JZKFe?=
 =?us-ascii?Q?1SnroY4ZUSUrc5Pjs4wduox4L9TQdit0GTtgo9CnzlRwZYyFBhNbtGsQ/PGu?=
 =?us-ascii?Q?ooZoIjWaIg5LBu5NLeddH58PXxMnTXtczd5/sTuDc5+6NTKcbAteec/9T4nu?=
 =?us-ascii?Q?dWhkFtZC3m8PoHXI8nkGVlihiT+eyjpqE9L/VdP8Von8sDfyUCDjMS4LJHlN?=
 =?us-ascii?Q?fik/dS/iP2GaUnvpqYwTuzyCnTmJ0OeGVHCrgWqQ2PjpWZFqRIFRcBbOYLcQ?=
 =?us-ascii?Q?gSrnHcgrULhp1wXyU5E5cHV1L4zwaU4KbOrQI1cjWeMzwOrkOtrLiLesEQ9G?=
 =?us-ascii?Q?cw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d12b3e3-dbc2-44f5-e21c-08dcba9d975a
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 07:08:39.2770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saglZGyhyMzJuYLLKS73HdSUm83vhChwOWdKHmHX8E1DsJgzrraNtk1oI70SE0mUxEsH4clfIRlw4ufkN4yYSArOg42zG39bGMA8xKzvuaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1530

Provide a control to toggle (0 = off / 1 = on), whether the SPS and
PPS are generated for every IDR.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-hw.c     | 26 +++++++++++++++----
 .../chips-media/wave5/wave5-vpu-enc.c         |  7 +++++
 .../platform/chips-media/wave5/wave5-vpuapi.h |  1 +
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index c89aafabc742..2a98bab446d0 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -23,6 +23,15 @@
 #define W521_FEATURE_AVC_ENCODER	BIT(1)
 #define W521_FEATURE_HEVC_ENCODER	BIT(0)
 
+#define ENC_AVC_INTRA_IDR_PARAM_MASK	0x7ff
+#define ENC_AVC_INTRA_PERIOD_SHIFT		6
+#define ENC_AVC_IDR_PERIOD_SHIFT		17
+#define ENC_AVC_FORCED_IDR_HEADER_SHIFT		28
+
+#define ENC_HEVC_INTRA_QP_SHIFT			3
+#define ENC_HEVC_FORCED_IDR_HEADER_SHIFT	9
+#define ENC_HEVC_INTRA_PERIOD_SHIFT		16
+
 /* Decoder support fields */
 #define W521_FEATURE_AVC_DECODER	BIT(3)
 #define W521_FEATURE_HEVC_DECODER	BIT(2)
@@ -35,7 +44,7 @@
 
 #define REMAP_CTRL_MAX_SIZE_BITS	((W5_REMAP_MAX_SIZE >> 12) & 0x1ff)
 #define REMAP_CTRL_REGISTER_VALUE(index)	(			\
-	(BIT(31) | (index << 12) | BIT(11) | REMAP_CTRL_MAX_SIZE_BITS)	\
+	(BIT(31) | ((index) << 12) | BIT(11) | REMAP_CTRL_MAX_SIZE_BITS)\
 )
 
 #define FASTIO_ADDRESS_MASK		GENMASK(15, 0)
@@ -1772,12 +1781,19 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *inst)
 
 	if (inst->std == W_AVC_ENC)
 		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM, p_param->intra_qp |
-				((p_param->intra_period & 0x7ff) << 6) |
-				((p_param->avc_idr_period & 0x7ff) << 17));
+			      ((p_param->intra_period & ENC_AVC_INTRA_IDR_PARAM_MASK)
+				<< ENC_AVC_INTRA_PERIOD_SHIFT) |
+			      ((p_param->avc_idr_period & ENC_AVC_INTRA_IDR_PARAM_MASK)
+				<< ENC_AVC_IDR_PERIOD_SHIFT) |
+			      (p_param->forced_idr_header_enable
+			       << ENC_AVC_FORCED_IDR_HEADER_SHIFT));
 	else if (inst->std == W_HEVC_ENC)
 		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM,
-			      p_param->decoding_refresh_type | (p_param->intra_qp << 3) |
-				(p_param->intra_period << 16));
+			      p_param->decoding_refresh_type |
+			      (p_param->intra_qp << ENC_HEVC_INTRA_QP_SHIFT) |
+			      (p_param->forced_idr_header_enable
+			       << ENC_HEVC_FORCED_IDR_HEADER_SHIFT) |
+			      (p_param->intra_period << ENC_HEVC_INTRA_PERIOD_SHIFT));
 
 	reg_val = (p_param->rdo_skip << 2) |
 		(p_param->lambda_scaling_enable << 3) |
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 3e35a05c2d8d..b731decbfda6 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1061,6 +1061,9 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
 		inst->enc_param.entropy_coding_mode = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:
+		inst->enc_param.forced_idr_header_enable = ctrl->val;
+		break;
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
 		break;
 	default:
@@ -1219,6 +1222,7 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 		else
 			open_param->wave_param.intra_refresh_arg = num_ctu_row;
 	}
+	open_param->wave_param.forced_idr_header_enable = input.forced_idr_header_enable;
 }
 
 static int initialize_sequence(struct vpu_instance *inst)
@@ -1701,6 +1705,9 @@ static int wave5_vpu_open_enc(struct file *filp)
 			  0, 1, 1, 0);
 	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
 			  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR,
+			  0, 1, 1, 0);
 
 	if (v4l2_ctrl_hdl->error) {
 		ret = -ENODEV;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index d2370511faf8..45615c15beca 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -568,6 +568,7 @@ struct enc_wave_param {
 	u32 lambda_scaling_enable: 1; /* enable lambda scaling using custom GOP */
 	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8 transform */
 	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
+	u32 forced_idr_header_enable: 1; /* enable header encoding before IDR frame */
 };
 
 struct enc_open_param {
-- 
2.43.0


