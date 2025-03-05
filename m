Return-Path: <linux-media+bounces-27580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DE4A4FB8C
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 631631891F41
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28FC2080FE;
	Wed,  5 Mar 2025 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="sJUcAkLb"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B80E206F1B;
	Wed,  5 Mar 2025 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169750; cv=fail; b=W366Ofm5DJr8C0JkaOJiCBLP6L9TY2c2wnbhGFj89pBCKN/F+8s6LdWJ69xLDD+1+4qYMPO54bRW/Tn4Qi6xnA3x6BGiR1jjrZ+pdkqoCJnWFWu4Pq+kSwg8utrQOpZJxKqvadkS+5BK+V4vbjT0IQhNBEKsGFvPZVb0fBNRD8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169750; c=relaxed/simple;
	bh=HYwjPouo5PqXlBaVkKr2PMe8LuxOydElL1w+AICaYqM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j8mu7/CPjajZH25LMz34pHQBrcbpM+BwGWxreGcuFZyfjv5MvZTu1SXkjhpgkivaRxu1y2xwkuSSvR1sGCI54Gr3gpPcMAcKEAiihW08q+XtQPWWLVHIQzGy1XkafJb4s64Us1mr838kuzRaRHA9I9gwemq86WgZOqvX5fTlUmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=sJUcAkLb; arc=fail smtp.client-ip=40.107.22.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbPnlK+766Cyn7beXwu759RhlHN9PXZeFNI2EyoQB1JjzcFKSbFvKUm7XZHJushfyUMTSjLWaiQE8U8DLRShgR8ozqBBqOPQfasYWQ7B46eAmLrEovQki+P2uOzlDoJfqu1Vf0fmrMsX0UGg4J01dhF7echs8jJhgpPmxNmVg2YmptBvl/zip0OzSUWno3CP9NqTnMhooeZxGyOAXlUYPvaXJk4ZjFt4hk8ixjLUhp/4RgJJSF5rDbR+ZJAsiKWDrO1Wy4mS6nYqcEw6ls4pWY45o1Wdi4ZI3c1U0aEHvYjscE8VfksEvdhWgi1aTCndLXjs7TmN4iR22g/AAMQyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kor3lTNIKR1gra6DwDrdViuy7QPKz38qsXiT/yG3VRQ=;
 b=Y8WjeTf3Q5Zg53HrSGV5PvQHTDJVfaWMi08CgovL9zDr+kq2JrVxD5Ti+79TZZBL4SrFZM71MXyXk50fomZiJuPGbJ3cohKpoIKGXjBV9zMX4PVhnZDlvmXrZFG0AmRFHwErv4ak4dOIfZ6SLOMawpp84Fbd5jhxJbFSBBri559rggajhLGpL68p2iwus6lY0aB55AsyBNCWYKl5F0fUADlZuCLSFaevOwbJgakacgLGqNl0b7rvulw70MSyGEmMupwvXe6Q9LHMj018BP6WjvPIXYaMkL9CCnfZjulPCP5481TBiizRqmKkqUF2BmNV5qJfKFaFWI1ruatAyYJ/Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kor3lTNIKR1gra6DwDrdViuy7QPKz38qsXiT/yG3VRQ=;
 b=sJUcAkLbbq7XFQHfJDRb9XjL5DQMATtoO7R4PsKMWpNA3kqJ2/JLb+KLdCIBlSF+nvKeNY80MM1AL80m7YqM4s2YT5OQNad6ny53B4PdxeIId5tWRUWOnXyBcO4M0JV3YHq5ZotrWJHtQMqcqI1AleRsv0NgwxyjvvNJJ4AnpsxanrAI3rN0dFkYh3kPXPu5rBckb0lI4ySIRSaLNhmyOG6UlrqEuQfAKMsGj+m5aniCvka/pQDqAlQA0HlQT98Hvzp2TV2pb4HeJagqqO3mNvv5LGb/x9iODpsHCXMk6/pkmQUH4nvA+LyKyGQ8Ru60IHgCRUxG6JbB8lS7IKMxKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AM9PR03MB7266.eurprd03.prod.outlook.com (2603:10a6:20b:261::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 10:15:45 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:15:45 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v3 3/6] media: mt9m114: Factor out mt9m114_configure_pa
Date: Wed,  5 Mar 2025 11:14:50 +0100
Message-Id: <20250305101453.708270-4-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305101453.708270-1-mathis.foerst@mt.com>
References: <20250305101453.708270-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0013.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::23) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AM9PR03MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: b82e36d0-7bf8-4b6d-c8b3-08dd5bceb10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V/9tdXObp8bWQpjKagV0+tReZIcITw1Pw0UuOzF74TEZ8oxiQmd3Qk6qJFvZ?=
 =?us-ascii?Q?5eBz6FANs+P/++nGCLDrA8pjR3Wbp5ZjqlDF1eZC68YoddeYSP2iOBt6+YBk?=
 =?us-ascii?Q?6HQPx4xevTXT6Ru4V1FA5vUueJKTjk09DQgdEjf5I6eWn40KkYOgyqTuKzsK?=
 =?us-ascii?Q?6ypyfYt7mIeZyZLjTQQUtKD2wmwfTm2oSmNCBRCTaeKrmMFZ8ISa+sYJJk96?=
 =?us-ascii?Q?JXY3z7griWjMg6UVhAanhn6EwhoID8Mc/EJqDD5J8lhZYNQTlVkCbSEXK0k0?=
 =?us-ascii?Q?Obbjw7sAgt3xDE3RAPk6EC9e5APxhNX18ruGeL0ZDA7Kd1f4EVNtlSXzEEik?=
 =?us-ascii?Q?z1RgoHvTiiBzCrZYqN/AK2F6+trEf0oTAvmksRXSU9n5ZTVtaEuXjgvdkt8S?=
 =?us-ascii?Q?eaCy0R2x8t8e8ay1EMvtVn7sLO8yK7mMZrGXeY2HzO+3XjQN+Z1wgQj+oZ0o?=
 =?us-ascii?Q?uMEyM6+quVPyGhSdYUi/xRpdW3VSt9lNREJKRGCeOTQfEL/fmbw0wIecfwVl?=
 =?us-ascii?Q?XOBfTAtpsKW1FN6mqFuDeCtcqKlMbETFOEEvpZov68gr/hFPjoVlZufmOkTm?=
 =?us-ascii?Q?C24ummxzm2x+RZoVsZcEm9NiHtzkntn/7SU949HXyeWKEo198WDbPahXIz8u?=
 =?us-ascii?Q?Gc2ZWoNn0Y45XKEksWMmz2qa9tMn0Qd+yUaGsLnggRkJTFBzJ2EARtLWQjuM?=
 =?us-ascii?Q?7Ek4kwvLGMBO7ZK7G+h2G9j4eqKzES9XAzgPkO/bG2tFw8rFY82rLMbOecnr?=
 =?us-ascii?Q?CzRM4Z0ihmPYJX9xnqFFhWwOU3G+mV6h1QJP7bL9aYOe1FPSiM/zD7nr1xrf?=
 =?us-ascii?Q?dqjBmcR72gkSMnO8HiNJghU31/q1yq5C2SS22r1uGJWBKpBfZw679aj+A3rN?=
 =?us-ascii?Q?BILxMDj4klz1id3Udb6IJukOe6bpSY3FtwuYuNd6kRwti4O6mTIbHtpVvam4?=
 =?us-ascii?Q?iIPsv84OQcs6ZOwUK0fLEgrhiYjiWJxY42A8a/TmL6ZEsBFtXwdpkzf3c65W?=
 =?us-ascii?Q?n6NZ46qUBIJrrgwyPoXwA17AD4pAN/ydi6fsr1vo58s+JpF6jDOFLP8yYd1i?=
 =?us-ascii?Q?Bl2iwHrN0IjBQNHl9EVy99YI8xvUFR7YO9V3P8EvUxuydxpipmBCCmiZJsFj?=
 =?us-ascii?Q?3L2TMjXdY92jiWkWkCvE3Znhurz5TYcOloMcgtfHhgfhdPfgrly7kP7mHmb4?=
 =?us-ascii?Q?O1pcJBjrb9I4UlGXWQyVQ1WI5OMDyLTMOS5CJ/kS1JkbKTqHjnZSF0wtqIAJ?=
 =?us-ascii?Q?hoEJFJibtsAIzaR7bBD7v0pGH3FPRYyoLUCUFO8FcDg0vwvp3EYmATsEe4PL?=
 =?us-ascii?Q?dqSm9OLRTQtyA09ATqahxh1IYX3stT5AUp0Z/matxBwsoyhyC43Rf3Tnr86n?=
 =?us-ascii?Q?piPXbJbsF9ir3f4GgkSvRbq7mNwPEpKWjUn/nNCqATjNeGtV7WGos/75rXpx?=
 =?us-ascii?Q?6QBsLt7S2cBtyQBrkdTTLUwL8KarRKA9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P77Xo2zmdOaWZwhLsnYcyFIhiLjw+7PLLap1TmjzkXwTx+feBSD5l7ZdOUR/?=
 =?us-ascii?Q?RXJVmlolSXoG0Lh2VAE6B2Wct+msVlLTB4xwxkhlW6tvXeja6i76LypIc+iN?=
 =?us-ascii?Q?VtDEMl8nXhAJ4MN06M1O2WoOgsBuQg2QfD124Xwl/3jmgtW3x/j/+LuRGF4O?=
 =?us-ascii?Q?v+ct9Zx5oMFo4XeuMuV0tT39ESA7sGAbrytesXijbjsiBef7CL+K3g5SNZfn?=
 =?us-ascii?Q?qXyBEapM3iShDqaQZxv05lXjftZJ6kRW/IgPb9lbg2FfQ5oORuIGmU/QHh5S?=
 =?us-ascii?Q?T93h357mqvEGiwjKXnj0rJZt9eZ53AOQy25lyxxjL4/JzL5atvWW3b5EcpoP?=
 =?us-ascii?Q?7jtyFZyUufs7UIMX/6awcl0po2rWaTRg8uQ3a5uJOGD8ADJ/ug4xmUoir0KD?=
 =?us-ascii?Q?xSi0mtCdZ95xB07YazbrNG69ZClFRn7gWcA08x214QyOjDjirkdXBiJgWCaB?=
 =?us-ascii?Q?xz7WxXr16BUiMlHkz3gdilg9OVOdRvl3iBgobs/oKb0OXif7vDpTEnhwDefN?=
 =?us-ascii?Q?o+b18BvZVwU63rqYXjFpS8egtwFLN8OPY2puP8B11UO3jcb/S+cKypQDJmAq?=
 =?us-ascii?Q?Dhw4fBX49HbZ2ku4SOUqZbZ1Z/zULJEgzOOZSx6VsDJrRZ5Ote1/FoOorn7z?=
 =?us-ascii?Q?3HFQe+EYcVWvugmlB+6ApezZKdX8eYkl00DPlD0EiJcJpOMSxQXHikvrJmxz?=
 =?us-ascii?Q?QbPS9fXScZhS9XAxnMCuncEi0yhGzPuv1VSQJhRrZLerCfgziNMjaii0q6IK?=
 =?us-ascii?Q?Lf2S8trGoR45FniYMWpg7gKZJt0hrwKTDYpRBYOEDqjRqc9TTNN70jzj4hE+?=
 =?us-ascii?Q?VPSkqRPIiUqhi6CF/4vvYwSMKW6yiz4B9elzLARpmNzmI/ibcEYDWv4MxrTH?=
 =?us-ascii?Q?GKEgF0oplj+eNLknUqJd9mDdeooiUsrn4WV9nCBs++nDZfRbgj1yZ00AK0hD?=
 =?us-ascii?Q?GIo0RzBCKx70yeloqu3NhCob5FKLGHWf2Htw0swMFyMATfVD6MJPjdheTtSh?=
 =?us-ascii?Q?6CeBbdq8trdCGYt3/peF8UjzBNJKsGfWXVYOs65kPXtsQZWUmNJdRgCVxiKC?=
 =?us-ascii?Q?dG3umTEcoXpIpMzSQRGJDqLsrx7u3aaTK1VOXB+Ou6/zUHHKrOgVF9aKBK1h?=
 =?us-ascii?Q?i1ZMI/sw+AIhYjbzMCxllgvchmTxVuJoabSfffzQzrBwqKZIq/RLjhVogoeH?=
 =?us-ascii?Q?64A0C4xw6b6qBG0WQ7mXxb4Kjh4wOWLsNAnOcWp18qKgb0ZA29AdFySY1ki6?=
 =?us-ascii?Q?6ACN101SH56+yvBaNYlq62ozmqAkpmIWd1KPHvpBqeCZ4X6WWiFgYKEyH9uD?=
 =?us-ascii?Q?Q/j4bDr5VMVlosirc3A7GnPQyz/4Uv7CekNs+P3kyiu+9oLKZCMqs6/dPUCW?=
 =?us-ascii?Q?mUDgrLMAJnj/F4f0V03TMgo6g1z1DMY+TJ0qLE6NbnvN1YHkZmltInMR0/7+?=
 =?us-ascii?Q?lJT9i0TmHGJ0FigWPfwigGRkXngFZEAn2PAvjQw7+D/dAJMWvrezFoOwj/MX?=
 =?us-ascii?Q?UTUWHJY1ZS4bJmUA3cvo+rXsrcUrOS7GlEQ1b+dbFL+Usom3NrTN9bPrGRUO?=
 =?us-ascii?Q?Ysi9x1g6kdyjeYondnGYIbT2RZ2dI+7PWHTE8TiI?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b82e36d0-7bf8-4b6d-c8b3-08dd5bceb10b
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:15:44.9753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhKybMYkJQ2em+0yNjWOullYKKpDtJ0VMiZevLryYYXRd3HXOhlElG+yhI0NuBVyxzuzvZ6yhBIZ/YW2QpkQ9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7266

The function mt9m114_configure writes the configuration registers of both,
the pixel array (pa) and the image flow processor (ifp).
This is undesirable if only the config of the pa should be changed without
affecting the ifp.

Factor out the function mt9m114_configure_pa() that just writes the
pa-configuration.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 49 +++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index b06003b69f6f..9a49dab65180 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -789,39 +789,22 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	return 0;
 }
 
-static int mt9m114_configure(struct mt9m114 *sensor,
-			     struct v4l2_subdev_state *pa_state,
-			     struct v4l2_subdev_state *ifp_state)
+static int mt9m114_configure_pa(struct mt9m114 *sensor, struct v4l2_subdev_state *pa_state)
 {
 	const struct v4l2_mbus_framefmt *pa_format;
 	const struct v4l2_rect *pa_crop;
-	const struct mt9m114_format_info *ifp_info;
-	const struct v4l2_mbus_framefmt *ifp_format;
-	const struct v4l2_rect *ifp_crop;
-	const struct v4l2_rect *ifp_compose;
-	unsigned int hratio, vratio;
-	u64 output_format;
 	u64 read_mode;
+	unsigned int hratio, vratio;
 	int ret = 0;
 
 	pa_format = v4l2_subdev_state_get_format(pa_state, 0);
 	pa_crop = v4l2_subdev_state_get_crop(pa_state, 0);
 
-	ifp_format = v4l2_subdev_state_get_format(ifp_state, 1);
-	ifp_info = mt9m114_format_info(sensor, 1, ifp_format->code);
-	ifp_crop = v4l2_subdev_state_get_crop(ifp_state, 0);
-	ifp_compose = v4l2_subdev_state_get_compose(ifp_state, 0);
-
 	ret = cci_read(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 		       &read_mode, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
-		       &output_format, NULL);
-	if (ret < 0)
-		return ret;
-
 	hratio = pa_crop->width / pa_format->width;
 	vratio = pa_crop->height / pa_format->height;
 
@@ -853,6 +836,34 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 		  read_mode, &ret);
 
+	return ret;
+}
+
+static int mt9m114_configure(struct mt9m114 *sensor,
+			     struct v4l2_subdev_state *pa_state,
+			     struct v4l2_subdev_state *ifp_state)
+{
+	const struct mt9m114_format_info *ifp_info;
+	const struct v4l2_mbus_framefmt *ifp_format;
+	const struct v4l2_rect *ifp_crop;
+	const struct v4l2_rect *ifp_compose;
+	u64 output_format;
+	int ret = 0;
+
+	ifp_format = v4l2_subdev_state_get_format(ifp_state, 1);
+	ifp_info = mt9m114_format_info(sensor, 1, ifp_format->code);
+	ifp_crop = v4l2_subdev_state_get_crop(ifp_state, 0);
+	ifp_compose = v4l2_subdev_state_get_compose(ifp_state, 0);
+
+	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
+		       &output_format, NULL);
+	if (ret < 0)
+		return ret;
+
+	ret = mt9m114_configure_pa(sensor, pa_state);
+	if (ret < 0)
+		return ret;
+
 	/*
 	 * Color pipeline (IFP) cropping and scaling. Subtract 4 from the left
 	 * and top coordinates to compensate for the lines and columns removed
-- 
2.34.1


