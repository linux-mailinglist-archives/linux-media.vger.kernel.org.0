Return-Path: <linux-media+bounces-12494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B95A8FA9C5
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 07:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E49911F248D8
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 05:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D201813DDD3;
	Tue,  4 Jun 2024 05:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="WTCo9tNe"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022018.outbound.protection.outlook.com [52.101.154.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A3213DBA4;
	Tue,  4 Jun 2024 05:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717477904; cv=fail; b=ZinZKtdPC48dpocRZfpcE46JyTGxds0mkyWjBi/gIyqsmAnPI/qnVVgqZR/S+fhPsQkBda7BLS9Whb/kxquWT1jeJpb4KaxC17l1IZlFQICbQ5h8WJLnk6NM2BFMHQlH/mudKoc2sfNwSw9/ebbKLFIGUQjUJ7bhpCJ9+fmHJ7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717477904; c=relaxed/simple;
	bh=7cJfdK87ftfvhKD8heJ0+NI98EwfX/oBDqQnG+UwBWs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YJa3XM7IipZ6c0W1h1hTHafuU0gxn6B5LvBrnyplgqppoCW2/QuU8sn5AKvC7nfFpVv3jAHQ20T+tZwjiu70BOwdPFnUqxjPZXXlio0Alv0b7PEs/Mq8keCX5OWTqJ9fqOAYjXNoWjiKvg1BlrwobXhSjHEoN54zlI0Mnopvm6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=WTCo9tNe; arc=fail smtp.client-ip=52.101.154.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHEkVQGwhCwsdDU8o+SW+95Jvh+Abw8qoy4/uqh9/YtJbr5EbPBBFP16kH3/50x+Jdntp69PWFv/GWukVdglSuc6X00A3u30/UC6TGAPIkvjCawYsqe4nTT1KdsbsINPrvhpuNbw98EPvpLPkI86WypyQVk0i+XV9khodbwmCIIWKR1+atkQl1/RXIRxtQNMfI6VLr6TWzOvh9YXaGfda4PdrpqdwRtR1/K/+FFKwG0bO/4g7/Ecl1BY5cL/Qv1Kgk1IdjDgi8LSOKHbTCZDnmG4kmdiGE+xdbLUUeFtii8yll/eQbnm4Q+n3ITo0u0xxqRAx+c7myUJJF6AlHz6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoCXtRmruLooNqkHk/hITgSWUp+4gmZn5RIctzBMGA8=;
 b=esQzSg1xk65i5znE2ei93zijvUN8k9gZnTmOfH8OIqk85f7gLAggoxEdz6AT0TydkmZjRcT7BHA+ZrcdSkmDfCfxAjnye5+20ztfwJoE0aMjdnqtW5d9UHlfv5LVgp7Rkp5DWfTkjTgTfOVvlPW9x4Rd8VlEYjRgGyCVq0drzj1K310DC3qCg/yV6KN4Fb04m0rhpgqs9A8YZUkG6hC7FZ91KmjZ6B+yF+ETzy9t9T/CuOeHT9WYJmeORdTf+x9Thy8flW0OwSjvCE7Fr7G+mc8n6rnHLnf3BfwlJDsCfVqbYLKpCrcZ1xjqlZzMlUwm5AO2ggBoB6Fb49zO81URLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoCXtRmruLooNqkHk/hITgSWUp+4gmZn5RIctzBMGA8=;
 b=WTCo9tNexSEKPxLCe08saef8Konzlo5S2S/FQ70yk4cbSlQTRPeOZ0SP3cKwUIPv7bgoCXgTTQCIGWVRwOKUB63y1gdPq9mrT7Dd0BMHBPqRi+ZSkWWg6AsXBcS8/GiBbDacnsA004tM3SxnHRXjhaX4buhwBCMoO7LGw74ov/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB1537.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.27; Tue, 4 Jun 2024 05:11:37 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 05:11:37 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	bryan.odonoghue@linaro.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v3 1/3] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
Date: Tue,  4 Jun 2024 14:11:18 +0900
Message-Id: <20240604051120.9441-1-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0068.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::11) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SE2P216MB1537:EE_
X-MS-Office365-Filtering-Correlation-Id: 422e6d6f-6303-4fd0-a96c-08dc8454cf60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|52116005|366007|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HPuT2trc8kOi23WLMHZ8kPU6QMeun5f0qMcbxKGcQrH7owuFWkusrxxm9ahz?=
 =?us-ascii?Q?DlnTA9tbQRUIHWswQujtLE8qDcXI8sZhW9l13JpaX6kHlRBzEmc1VJhnMC9g?=
 =?us-ascii?Q?G1uw/RMjR9wRDFiqtapKKMvmEwpZbpdCPEJwwb518A9W6PHFOk9+6mmC3g05?=
 =?us-ascii?Q?TFqTtpHQN5Bh3Ws5HFNtdlasrDqhXL+hffjwYyfVgi3lt+GS2wHKRmdGfbOR?=
 =?us-ascii?Q?CaVwQfygCmYNvr//z0+vu3JrHt2SCRvNluVmgdmoHEckgHYa1P7oKJJB2bvb?=
 =?us-ascii?Q?TCSrG7PbS2LrQDyDLVvObXoyZM46SAxgPhPya+DNUuzGk4OXRcrORlEoOhxN?=
 =?us-ascii?Q?n1NpyJqZMRTHwCNQyft4nG11F5JGa+qt/YSsBZovdHOOG2htZhxK64YaZEhl?=
 =?us-ascii?Q?pKjOWoy5bz77IQqiJ3pFIJYj3Fm2Y7TwA0h27iFTQMP6U0KeytTc+msqUbCt?=
 =?us-ascii?Q?iW26YmeCZgkSRqFEkmYRx8oQ09Cp8qWX8XAX0ul1u6w9MgUFkygsPBeHp2pw?=
 =?us-ascii?Q?KklUwQZYnikSSkFlqglXKSeMWfsZOf3aGImy+miMTwxwSLDANOae6QAcTxD1?=
 =?us-ascii?Q?Y3aCPJWX5mFSlD5gCJndOuAE4kRVW9V/hFjCjtC5AL1gjfO3mhyQNnm59JnT?=
 =?us-ascii?Q?f6e4bvznfJktDzKCFXCX9ZNJM404oiuqrO0/u2fW9x0d7J33s2WdXMyAj4+9?=
 =?us-ascii?Q?QxnEE69AnYMxd3WzSHbCeDLZ8g6gJwM0UZ2ndXYrzHBCf1suqkO3QbkNk+BE?=
 =?us-ascii?Q?oruqKtok/1D/6mnITn5n6livfefBMVQHgp6VsMw3T9F5xmtdFUg6QFpoUbnP?=
 =?us-ascii?Q?gw7/GXkfBSXf+TNCzwxbIP4UK1VitcjxPkRL8MszUzrkSOmPqfUzISB3+1Wc?=
 =?us-ascii?Q?50QhLaFKki3BGwNtj7Od6OJEmlMkHHuSjb9zC8MCRWzNK/CUps7+/dJ6NbGH?=
 =?us-ascii?Q?Om2Azjplr7my1qrCttW8oeA5o00XMwzUxQupAU2TQTr4dRSmTPDmAgR5lOCM?=
 =?us-ascii?Q?eR3iA6roapyZkqFgVrmBVoNIg+UVST651nOdFP8mxAXsgzEmQU9n0ZpyIhpU?=
 =?us-ascii?Q?lsxHMnY16gjeSP/J+x1Qp9RiUPdeJvaxZ3tSIdYuY8pIB4o3UQo6aCXIA6j7?=
 =?us-ascii?Q?l6fdOsNMGTqImsOj+k6jtFvm5EGVV3BLh2VgW4WCUzCvIzTo2Fe7hHYmrALb?=
 =?us-ascii?Q?PJJKKxGi3we4jWpQPNxQX8pXun8+fe4wZuvZRzHUZKnfGeHvSdYazLfvPijN?=
 =?us-ascii?Q?W303ZXT+dS8r705T4ENu6IqXpC8sd5Wi6hW+87wB6fUm5mTceMMhvimYKvJy?=
 =?us-ascii?Q?DeJpnZyW9NF7Eof8x5hHfUoMhdQazit9brDHgiLQbWWlOA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zY7PKxnEyNIVSOfeQ5xnQYiKZDBFYLwohsu1Ni3/j303xf46XyYzmyewSpSP?=
 =?us-ascii?Q?26vyhdnCFaxk5jO2olFQnWBCQypfbn2f9d3JfVHt9EEQ0uEtFbbSXwnCwUxg?=
 =?us-ascii?Q?7iftd4jjSnUN9w4bgvYmrASSp0xSBD3WrfvLu3GLHhx7o/nkXf8JhgQRB9mF?=
 =?us-ascii?Q?UebX2gj5T83xUSZGe4WIkM/6ldiLtOPIEnJfXa4GeFQVnVfNYSVkTLTYSvRs?=
 =?us-ascii?Q?onVOkPl4D+dOGyaGnix1YO5JnEDs3vRELlsVzAuk7JUq6sedEScBdx4J9k8s?=
 =?us-ascii?Q?U1Fg3f89iw4dRITBQdvFbmxApL9/q5t3H1c6QSqPPN+bCp7xAlyaxB3USLen?=
 =?us-ascii?Q?s6b38aJGYngWWKDbfi7eLi7jylE8Xsp3vK85Fw5hLn8S9US7KgU6pSG+fUHj?=
 =?us-ascii?Q?EHoQXJVHErV0uySMHaPd4WC8mug6BDq4pxIHXZFEVtiX6SX3cnPG9Exn9PrV?=
 =?us-ascii?Q?K5XRvyH/7722FCcl9VIXvT4YJahqLQ8dtTh+1mzEfEN0Z2kJ/1U5bVoEaKbf?=
 =?us-ascii?Q?8V62+WW5l13vBE8IxDPRyBsq1iknGugFpBMSyDaq5d8ile5Odkm0oxpXQf1w?=
 =?us-ascii?Q?67zEmj9U8u9IynTGUvjNV+yxcnyeQ7Ib97ogxeF/NkGH/vmK2AJhAxmmQBzE?=
 =?us-ascii?Q?oBo8ttgcnkX4Mf14ndsw8SeaWAFS4xuu0kpLHLCGyMI2wcIdPB3Pa35cQVz+?=
 =?us-ascii?Q?ZNWbBNQCaa0B0cuz08/UZgNoEM2mqVXRUoPFJCclMoCwvIGpluAEtB2zdKcU?=
 =?us-ascii?Q?9RXPlVvcnDDqV5mis6KEvJyCo1qWfuv/VaV12al7CttCDaUj+UgOUo28HQoP?=
 =?us-ascii?Q?afmUDvbr8ReDEf+Eg/u0S/zqu6WsFqpGDoIcvXc6Mi0ZcPOmvT65ppI9lcmG?=
 =?us-ascii?Q?Psapjexloe+Wo5GY0dDAQl+Y9oRYXe6PlHDE4/r1GFikNJytDx0240VwwxWm?=
 =?us-ascii?Q?0ELX+xVTYypTUOAqb5VJf2lo6sjalkhCEttNB0A6nfvsuSOuGCskzygRJQWI?=
 =?us-ascii?Q?4C/MBUBRwGTGrlMvXU5gK7KW9e7Y/WWU8IMPI3G779Vhn9QyTkveH5/vws6S?=
 =?us-ascii?Q?bP8HcdYFQIBMg6a5bUDwqzAPoFqRop4BOeYXDCACNV80HXO0j/Ynf4w/VZ9H?=
 =?us-ascii?Q?oeTtMzhTs7NtYThk8jQDJtedZPC5P7JRye51zW5NTDq7DMCajxh1cuM5w1WR?=
 =?us-ascii?Q?NqQdyckyLtVQBWUKnP2sGsMTgX7eCqOTMQxNpA1pV8uuu3uvFw1lFNrVtGgO?=
 =?us-ascii?Q?t8r0PrqogIBfpEU0xMJIMvUyNLwqJHc+rjEQN3D34moJvClK8+1yJgmWo8qC?=
 =?us-ascii?Q?ez/r4oPgmuAMpLQV4adLaBAlPqo8EuNBl1qWBbIEeNYNUBdyi3WbDt4R4SNe?=
 =?us-ascii?Q?4t0wB3k2TmPuthdyfEcajDxN4GfFUf/1jgzF5aQiBZTzPkIre04Yis7A5OY6?=
 =?us-ascii?Q?Inh7bqpfRxlnwk/8iI72y+G1lsH/3gNT5LE76SRQ7h1Vi27r2AwR1ASvTVfs?=
 =?us-ascii?Q?yvFxBkNp+YeU0wvoIBlslxaSxfiJAXGWuTG1Q0A3niQ4TPfdUQB2u5mGtthL?=
 =?us-ascii?Q?3StLcC3QIPxfGCUVk9AFpN0toxJZ6FYdd869YjnqQrZvISPA74PvDI+e6Q0K?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422e6d6f-6303-4fd0-a96c-08dc8454cf60
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 05:11:37.2333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WnKv7SQFALFlk/4H9gzA/DtJqrzrGAoNRTPRWz6lmO2u+Ku4xz11zR6e9oj8mia8E14ubX6o7Ib4zE9FCMTUxS9o2mN5FkBLgXlgjILa0ME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1537

Explicitly compare a buffer type only with valid buffer types,
to avoid matching a buffer type outside of the valid buffer type set.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
---
v3
- Address Han's feedback

v2
- Improve commit message
- Add V4L2_TYPE_IS_VALID(type) macro

 include/uapi/linux/videodev2.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index fe6b67e83751..51da63173a98 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -153,10 +153,17 @@ enum v4l2_buf_type {
 	V4L2_BUF_TYPE_SDR_OUTPUT           = 12,
 	V4L2_BUF_TYPE_META_CAPTURE         = 13,
 	V4L2_BUF_TYPE_META_OUTPUT	   = 14,
+	/*  V4L2_TYPE_IS_VALID and V4L2_TYPE_IS_OUTPUT must
+	 *  be updated if a new type is added.
+	 */
 	/* Deprecated, do not use */
 	V4L2_BUF_TYPE_PRIVATE              = 0x80,
 };
 
+#define V4L2_TYPE_IS_VALID(type)		\
+	((type) >= V4L2_BUF_TYPE_VIDEO_CAPTURE	\
+	 && (type) <= V4L2_BUF_TYPE_META_OUTPUT)
+
 #define V4L2_TYPE_IS_MULTIPLANAR(type)			\
 	((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
 	 || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -171,7 +178,8 @@ enum v4l2_buf_type {
 	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
 
-#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
+#define V4L2_TYPE_IS_CAPTURE(type)	\
+	(V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
 
 enum v4l2_tuner_type {
 	V4L2_TUNER_RADIO	     = 1,
-- 
2.25.1


