Return-Path: <linux-media+bounces-42866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBCBB8EF19
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 06:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 383F07ADB63
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 04:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6389321CC5A;
	Mon, 22 Sep 2025 04:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="LQlqJhWn"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021127.outbound.protection.outlook.com [40.107.42.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F469475;
	Mon, 22 Sep 2025 04:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758515807; cv=fail; b=dv7GlRj+oQYLIBwJ5dWSkmLz6y3kSD6YnJ3f87lq7G7Nx9WaQj1y9IQd9cb4avAlDC0RVoNrHveJ36UMNmIxyRdL7pIt8TS4nXNODwmsFIotwzOWikCfG67tM6h0lb8ixXE+UqHwOs+2lfzFTlNNFbRDsyXXDdNesg2sBmABaWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758515807; c=relaxed/simple;
	bh=RQl0JPIm4DXUGoKD8Lqny40Lyo2ZsPsKTEgg1XnRB40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F4Qxy3WfCzaOc1oAHX3PawbUZ0SNriDOoUKa8LIN23k4WgVFVfGlgKfPUNxSeyl78dmQb+8W7SP0xIov2Oln++P9dI5kUiNhMx8pKTNk3Jpmt6hpcuFtyEb7V7QWkFvEoN5wvG6qWoE531Wng2T8CDHS4T/OAdRMK1uA68EVzow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=LQlqJhWn; arc=fail smtp.client-ip=40.107.42.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuBYniKmuiq1TxlOhE7VRx6xAvC9PWdu9qUVWS3qFKqBvfsD4OkMaErR8MvJ3+iG4jw6m8Bu1MswSsz82GhEMTyZHpX7LuJ0Bgi6kIf41/Fohqbw92EAVPa1mpJSCCkBo6YyU1GNERzruA7hv/PtnLsYDJ9JMDPpuwXyrUWDJovcb+DHKvRBlumz2dvRqOmeuc2RWwqu5a+6T/qc7DS1KPrqRuusayKlNKBXch3PrFOQg1TMW9TJn1kYR1UFYrsdHfyI0q0BrQmnGyd9iqwWJhdEyFtLzfKk2e5CZHM3s6b8iUpu0gjWnoN39lhzvVT717RAHAg4LZuq5WFYf+crGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qej6knGnE79bS40DsnYcieU0Sr87uDS+XRcLsEF7Rg=;
 b=NHqVVjOfvubr+FLepYLPu+Ej49c5sJwCO6QfFwGHUUhZnHXwymhLMUVpu8I/irENbWs93V599wCmPSqYYrv45t6hKkI4zGQJ1U16m1YVHJQPhF1mz0hRJh+YrTA1sLSCyS2/UEvQpEkXVnhWuQ4uVQqjuWYmQytfYpBwJAxKRLOs4fGmcDqE9Z7eJA77Lse1DyJs8OxeIf2kXverzhxDz47dzDqaUTvE+cjNwH0FmLD1+tT4oXwWK/8ThspdTjepoKUuCbQYxr4eczBd2cmC+yFkafkhYbzP/5qzCh2hjW41Yvibcfw9fvPiTKpbtvvu7eAe4ub2j24UhEsJ0zQ4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qej6knGnE79bS40DsnYcieU0Sr87uDS+XRcLsEF7Rg=;
 b=LQlqJhWnWpJEh9q55RLkgWLJiFilTHr++OUX6/WFcyxvtuihOsKY3rdvV5CWom4fjT7Z3LEjLseWkgPA8p5Jb2KDr0ECrWY5F5r7cLerNyaADEum6KQAH8zAIRdDafsYY4l1LTlMgb1QMXBKDblYNFUZoUJsH+Mk4l+lS4bNc/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by SE2P216MB2789.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 04:36:42 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d%4]) with mapi id 15.20.9137.017; Mon, 22 Sep 2025
 04:36:42 +0000
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
Subject: [PATCH v4 3/4] media: chips-media: wave5: Add WARN_ON to check if dec_output_info is NULL
Date: Mon, 22 Sep 2025 13:36:29 +0900
Message-Id: <20250922043630.74-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922043630.74-1-jackson.lee@chipsnmedia.com>
References: <20250922043630.74-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0023.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::18) To PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:72::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB1149:EE_|SE2P216MB2789:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0c6632-168c-4ea3-288f-08ddf991a0ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QajLA0w1v6tdUTb9VQ8160VaJwueRTpPl8JtjAiwCaSWDgU+voo/U1cjvNKT?=
 =?us-ascii?Q?6FaN9gLy833jcah0C+XmsOsfW+mn3zPoGh63wmnT7Ysc+4NHTAGlzbVCM6ka?=
 =?us-ascii?Q?QbB7Q7obuX4E9IXSQnBXGj8KVEKPVTCeQQB+geFFRuIO25/UBKmQ8rOHBAqP?=
 =?us-ascii?Q?FAJnO2k3cLuaG/NXFwlMeEp2uSbQFE2s/QMSA0Gc/rH1Ys4lo9ulbxy9sc41?=
 =?us-ascii?Q?U8ybwlq5HtJGgKAEkEhT1Le8JrphY9Xn1CuRtWJXfB04UxrCBG1t/thF9tyS?=
 =?us-ascii?Q?2DTegnqCZb4SCmkeZ34gEtB4ziwmJfFLQJWWSLAetgCjEkZql7UFYxFXfJuU?=
 =?us-ascii?Q?sG67DWk0kGVEjzE9LBz9d4+KcSWBNX2UjmJgfJoRbtLFT4CzwWMP8SqCblAn?=
 =?us-ascii?Q?cTPg6LEvKv0MMSwo5rpsf8jIKMW/4/0wrujDYO4gwGhExxpvwBNFMOz8tYEi?=
 =?us-ascii?Q?Yb6y7K2+IZxXRgfHovIJOkUUw910WLjfyjzKdErxkoD7vjOjf7lAYC6Hzo5N?=
 =?us-ascii?Q?cbnOQh9gf63ZZPiUIBfF+bJRTz/pU/Yr5n3aaXnxGLpaKGB2Jv6JtjHxK1ZC?=
 =?us-ascii?Q?DnipZZX8uQKnkKxFLnIyPNb2B13EU89JH3z6OjhIBkPrGLQVHxnKi5lg9Jaa?=
 =?us-ascii?Q?R1QrekGmd1H9zlJ87iP8pe5IqeF+rDvqdoXA9h2+dvAGMUvO+10deaIekXvO?=
 =?us-ascii?Q?e1KruG4uktTBDbbaS7b9QJKSx6Uq91j/JXsoyDURHIREFRCAYmhqx4/nvQ8F?=
 =?us-ascii?Q?bPqAuYM0Yo3nrt4jIlyWqz24mzJFxTDksGcCha88nbiScTyuhZgS8CUjne/U?=
 =?us-ascii?Q?uJvAZNevXbf5VoiIAuxLoQfXkjPK1Cfz7mgk4+nS83f2O8GEkbPVF9wzIlGk?=
 =?us-ascii?Q?UNKP/fJYsXWOQ+vfmg9gh9UGpKiIDqYCzEUPlhB082TJ0Kddbfs8y50d0a/L?=
 =?us-ascii?Q?oVNdvo6zupMmW7XlfZkct/Yn+gTT49hehUpTcaxY3FUCBVqUOsLid705V47I?=
 =?us-ascii?Q?8F8X9+uzVqd7rBSFijxpMYcovBAyxZK1IXUP8EQ0JKNe03Ga9M01J1jklFl/?=
 =?us-ascii?Q?pdMJwWi4P465f+E9bhpSdNbAdB/SVtmT8yof2HW4Gy/f/dVNmXv66wabE9ep?=
 =?us-ascii?Q?M6Kj9CrsPadW3XUOv17n6seW8jya2IhxbUv29/PFdXqyh4hQelr2aOdGmc7x?=
 =?us-ascii?Q?7/eNJAhPOtccognKisxJgmKczFgOvWvpCTbbw53vuXnKrimPPNq3foHj/ayj?=
 =?us-ascii?Q?VWPXdEjpy7EuNyEdSLZKv+/lyfGBVoanvRh5HVHKPVHKTNKIc+CjDYpnQYVW?=
 =?us-ascii?Q?G9IHafy9xNEHFRx1TOFF8daC9AtG/wqX9a8Gb3p6BTrVRdfFzLWznPIQCd7l?=
 =?us-ascii?Q?XMNmyh1/6vUcVKiZLQFRS1uwqOAethdiM6mXZSEXBYT1QOkLkfoI7KZruAn7?=
 =?us-ascii?Q?lkaVQF1DQ/h/csNf4o5aua5LlYayW1EpD8JVEgmBbJ/4my/Q5qb/cQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aPPf/k94UtqpcPL3SU1YG5+Z01qgpidfg6uS57j3fqcv1/EQu9V1iu6rA8ze?=
 =?us-ascii?Q?chHZffUfM54KzNNZdNYPiSc2yNMDlQ9+/OZHikJg1HCsjJWspU4WdBUspz3G?=
 =?us-ascii?Q?Ze8DK7SQaVVX2Gtq3B0xu62k1Ca+8eXcp3H0/wu4Akv4PXqVQpz8HwVtXnVS?=
 =?us-ascii?Q?GIZFUI/+nkFbg66fiE2yztJjRxas4g17hSyeVqfrAl5Sz6Xa70KTH31I4hxk?=
 =?us-ascii?Q?bLCvB4SZctuXBM8LskZerWG0B88UKHxhxQCPMrJ1n7XGf3ps3y9k5apV3Xaa?=
 =?us-ascii?Q?fBmbSnFUR3N6xjTdcuegtYjvzDNWxPjG7RT3LvjRZHUMcA5aAGebmnVIw1HQ?=
 =?us-ascii?Q?JtkP4IeKNVOJ51Z4r8gMb9xQBgz2lLxIWfsaAQnc0gfIBFXnrGeKV8Z4qXA5?=
 =?us-ascii?Q?Oj/68t115/bgemeW8FTip2J8Jv3HcWcfTDMvn62VlA6WtCL5UCK7sWLlm0Vd?=
 =?us-ascii?Q?k9l8WCiCHXsJ6CNzYD7WaJeFLyleV0Ej0fJP3s7roCdtzMhKsHyMTm9ODekh?=
 =?us-ascii?Q?eQIl54XbqFhk9cd9NWw5KvSA3pAy9GXjZJm4Hj+2a2xQ/hCGN4xcgT5eSxz+?=
 =?us-ascii?Q?gUs482nhAsL/aY6vQP5QtKeyiD9AAZhGffJFG5JGTw168Hu31LAVNeYap/XO?=
 =?us-ascii?Q?adIlXuPY6lYpHQZKYAFrU82D8ANNuLyL2D0c0MQxh3yJEn5AEIE4x2Fz2Kb6?=
 =?us-ascii?Q?2fnAPtixe4ZRZ3P0V6aZak858yhQDs9FuxLQA09o4JRKRQ645LGBqrF6H7C5?=
 =?us-ascii?Q?RnWi5Mqtn2bwZw+9B4LrSlBHfRNR1KmlMa4DrtuOJJ5qEoWdXmt3vGz+g7ym?=
 =?us-ascii?Q?5FZ5H7LaHzShcNY5NG3lJxEVTS6FNfBZ1h2XfyH7/8st10op43xtrazX1J6B?=
 =?us-ascii?Q?hvVa+fNpjMPzp3JldCI9xnD202tRjJk5lFIRc9KBT+248d2Ogai/qjIFncJ3?=
 =?us-ascii?Q?NVWPdP8LcopMZuZSXpxerSZ+5qNg8l+UE3VdUUlDvCsMBBo9n3vy9sH9XOUE?=
 =?us-ascii?Q?tiWGS4j08uQPlfi9v0JloXsVCXcILe7ueZ8RBtC54tS1XKNIFv45XamDVH9K?=
 =?us-ascii?Q?YIcR152mWuC49hNWgkYXYtDcHE9zfR539Fl8N7KejcjVo0/Yo76I4/c7s2j9?=
 =?us-ascii?Q?MwjGePLhbRdDzKhoyCxljOKp8ip4+zS8AroGndXGXTEgrShGMPWryMmyryUD?=
 =?us-ascii?Q?lL9tfddO6efpQOUg3H8oEM48vnnNzkko9Gg72/lMc3w9OsXvZS2ziPSTSVo/?=
 =?us-ascii?Q?CttIDt+rcwLb/DbpYhSpx2+Ec9UpemiBwH86k9SPNiW41ru8JXd4hUuaN0Wc?=
 =?us-ascii?Q?5Y2LErqIbkQsBO6wE3JJavoStrYMXDPpYcr5Ehc5LMBne2zun7xKciquVIKl?=
 =?us-ascii?Q?r8QCKKgC8Br6ZkTqcynga423YawBJzaUSqFk+SoDLCYZnZE7BEEkqe3zTqD3?=
 =?us-ascii?Q?+jd+w/9wKZ82GP7oAHl9sXCG28Mihwt2goig2KkkBFlXsVgzDHSibXrHJHcb?=
 =?us-ascii?Q?/n1REOsUmY6ajXq6yQXD3IACyU31y0mRXCVGq3vYzhUSJNmqoGUCJ5Uuv02G?=
 =?us-ascii?Q?JSfeRcpoI1vaaMT4Rog2aqXw9NYsTiEi3KELEnpfQpwXkQbtH+hNG6Ya5DTB?=
 =?us-ascii?Q?/A=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0c6632-168c-4ea3-288f-08ddf991a0ea
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 04:36:42.3793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6UfYFg0TQm0QoNb5c6Z6ZnNTgC6c0TRldtcbQCDEHO1v5scg3Q/SFyxr7hnDHBnrJ4p3MLcqXA3mS2CPXfbYChxjFlRa98SdzN3IZaOZjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2789

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The dec_output_info should not be a null pointer, WARN_ON around it to
indicates a driver issue.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e94d6ebc9f81..5b10f9f49b9f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -485,7 +485,7 @@ int wave5_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_i
 	struct vpu_device *vpu_dev = inst->dev;
 	struct dec_output_info *disp_info;
 
-	if (!info)
+	if (WARN_ON(!info))
 		return -EINVAL;
 
 	p_dec_info = &inst->codec_info->dec_info;
-- 
2.43.0


