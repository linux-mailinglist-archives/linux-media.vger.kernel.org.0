Return-Path: <linux-media+bounces-23531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B14B9F41D1
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 05:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F38157A5CAE
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 04:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2A214F108;
	Tue, 17 Dec 2024 04:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="H8bRCOwm"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020132.outbound.protection.outlook.com [52.101.156.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180D715D5B8;
	Tue, 17 Dec 2024 04:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734411113; cv=fail; b=eUvNoklPc0e02C6R+qoSxm3bqdk6kStBcFNRe2dbIMI0Bm15gzHhjwUByDeH0R0hsvLZYpWqb0qPjzOXZnQCoNllXqMbQ+WW2R4Pu6R+dMPEI8KgSKqEL0vJzDVgsGBadNCrbsSgxfPslMmvKqwFB0lCzDyJrHVsvG6M8iZswZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734411113; c=relaxed/simple;
	bh=GwCyJykW/j7mm1IYILfLg3lCqLDdoNYN7BmqDvz2d9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TbvRTaKydnY+TQcSw28n1qhI75Qz8Bh/3tM9ZC9sd2TwQ2/OqJpIQC20VGMpM5b53DSISEAZcI9iqvyfU60wrzIlKIgyJEvPN3KAvcgEG3XYiGCK+Z9via1/NEegzihFR0eTncxR3e63KnJ+bzuUukC50I3FWLG3zqiYxzcxPBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=H8bRCOwm; arc=fail smtp.client-ip=52.101.156.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCfw9jtj52h4lXnfa5sOoCH4QJi8tUeqKwqd+fGaPlQ+v/1gkfYdpY7ROQoCruzyJLblo7yGdMJ+EnbzrAjS4jgjgf2tGEbaJgQDl1bfVDki0Vw/wsZ4Df3dFz6Ga119HtWAbz/KfyHLg19a+OYTr0rxBLClWovyQbdPCVSY/twhPHFkgOjf4VOPFOQ2uw1tz7lc6b5tWvS9d1Cr8jGnxU4XeT+IlmrRvY0XIT3iQLcBlU/+2Jkyo+KPwwzkqysFE0XUwrnabk/mqIHUrQcESFsyczSf3XqZiuMo3ufE4u+9AcLRi5DjbGvwhqONhKDZq6kXyQciAfT4OQOK4aahBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGOcEZ9ZD7xca8dvy0mYczqK8/P23isIo3fwi5c2Z7k=;
 b=rKX1YVZvpHJmZJdHfKGPl4KBZJ+Q7CBtLwWDGnJQTR1MHSTY2HHIH9P6bgihkXoig5TYN6zHUepGXDmWiGk2BUGsrEi/TIHzuaZNdK9g3y4GHLTfB6Zqct0BBRLVHKMROpDsgchgO4p/1j8rg8h9unIjbOiW2gLNmn5HrCpG2MttivxolzdTmg1gmX4GmLyr05T6OpvdHaKtrWwXej1PHz5xB5+JycNyMApf6roJeUDqYd8G5tzAqPcZDUtmNfJdtnA7ssG6q+zeDMobbgLYmmlstrEq2jeS3ROg0uGDjcr6o0x1AWwu6LXNE3Iw9n+MFsaPNLUn9gRGj11nn6om0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGOcEZ9ZD7xca8dvy0mYczqK8/P23isIo3fwi5c2Z7k=;
 b=H8bRCOwm6Bl0drTwQJjMb2sbEDi7QNfrlqGFGyeZgFHKUVBfv5mLZFSmM/1PE1m8QlgAQNi8Db1UYHyJrJpcxOtsGQwYDfqphHqqeR3QFjfCqDHY0DjXtDDUM3l6Dvc6My2b15d2vgHn8+6T9R1GlPjxNi1ZrO0GFZhNOAPHtY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB1872.KORP216.PROD.OUTLOOK.COM (2603:1096:301:109::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.22; Tue, 17 Dec 2024 04:51:37 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%3]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 04:51:37 +0000
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
Subject: [PATCH v2 4/4] media: chips-media: wave5: Fix timeout while testing 10bit hevc fluster
Date: Tue, 17 Dec 2024 13:51:25 +0900
Message-Id: <20241217045125.58-5-jackson.lee@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5bd88f19-8382-418c-030e-08dd1e567d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WUb9o6RM+8ZrEq3TXYaXUbuIwUKexsi/mU/wii8iIFM3BvT/AeXLwhvW4Doq?=
 =?us-ascii?Q?F+a45a8LlvgJzE+GC4Kxnafnc3QEE/bPVwMBVFc4u9OtsnNzjK55/tQdu4pT?=
 =?us-ascii?Q?uvLt/TyPxzl5Xv66Q5T/SXb4yfnQD7he1l2zr7eH1+plnuJgDn5QkgfuQA86?=
 =?us-ascii?Q?GiMUr0iEM74GOq0z0TUrIiLfTgadBU4EatM2TQDVz6PHRrtGKuvfAJg+0XaH?=
 =?us-ascii?Q?qyLPfy0ZczbOr3aI1HHCp6zsNN7l9DZOlZTajPwKriufw1LaVMmhLEEYbxPT?=
 =?us-ascii?Q?lHX9VQvLiiJCqzTfRvtpKCrdZ9fzpUSFAQj/oY8fob7YiWLPLe1+j0vLiyOK?=
 =?us-ascii?Q?SSIcdSaly75lDS5W5ee4pxRTdRmdCgweXNN/SUh8Itwqs0GzsiDU7rDBUrmX?=
 =?us-ascii?Q?36RysuRMHV325AWzZxr0bZlxWM8al8r8L6Mg5DTHOIv6CiYFL2jQLfDbWGGL?=
 =?us-ascii?Q?lyexGR0MXJyBe7yn1RnIh0cbygVtfGxbGbPpwKLcubrLomI3NVoi2CRsLJK6?=
 =?us-ascii?Q?fdztwz/e8Arw9Qu7ov3KDFuzZtOy6kF0ESgIGSQeiv/EiItthXt9JzkMu/lQ?=
 =?us-ascii?Q?L2CggALONIPGUKIHsLAJ1CZzut8gBPfJKBRmxihY6ngGoO75B4ippPAkSGJL?=
 =?us-ascii?Q?XzARH1BeQZo+YJ9Oe+kwRHhsY7dfq54yF46lcDiZwfO4BrKrH0sIjAYFGHV0?=
 =?us-ascii?Q?zLKT141yjT4XQs9t7ms4DCJG50fBpHyT6go7awylvGdr6fhsNUF2gQhPMsNM?=
 =?us-ascii?Q?uLIFULVQwaQI9BgNY9C7B8ze4IH1nzOBo3WrC4FBl/JwveIN4nNgML92FUqK?=
 =?us-ascii?Q?U2eU6LXs+iicZYlvIPgVCAFSnGJyE84aY//hBLPB2o2htu8ghlUay7cXsKaw?=
 =?us-ascii?Q?tP1g4aBYDHXtGxUo47kGMeQug7wo5ncz41Ag64v7hF7NCaYimR0U0gSgUvwn?=
 =?us-ascii?Q?AMCGWtC4hqo3tdlDI1LcrLguM5wF1DlIfe7FK2Xq+1YFyn+goQGrXkA5mitq?=
 =?us-ascii?Q?NqALo6f9XI3LT9CYdv9fSMqR06wtZFKDVrFa3/7cTaWXbPce+RF7dQtd/uas?=
 =?us-ascii?Q?H4fGEPIDQgnINEk6X5TJxfZxf+DOYdJ3Goq/yA3TkpyQk+/nA3L68NI7XGw5?=
 =?us-ascii?Q?ELkXPbROQOE+AaKBrqqChhZaaQQCWtrEe5DbRXKvh0xfcPJDiTgfyK/VZ78h?=
 =?us-ascii?Q?McWsNsdmaRUrOoGBR7Q7IFtJohVgBeNERnV0tubTebdP4+jM91eOPG8akIaS?=
 =?us-ascii?Q?TVKIiP9UfQ2f1w5tvwUUHbGVz4Gwu5RfW3rbIsZ2zsC3D5/qvZjtsBCMWMd7?=
 =?us-ascii?Q?OhYUv0By4Zy407nFsTg3jQGi9MOseEcP2mPYBkQIviaTtsyfg4aTnyUogygV?=
 =?us-ascii?Q?4Kj6QCaKEmiMlYZ0IvF8f9L40ul+Q3OOMtymyg4cfRO9//4dGCPUu8f1GG8+?=
 =?us-ascii?Q?gdwusSWMrQArzJmNG2aC4HeIMzdzSPHe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R9PStP4WTjtswFv56FjkaD/WDxJJGTOaBjhqByE1ZTSjJzMgPS+TtVRWw6qE?=
 =?us-ascii?Q?kdKY1ivXzoKdY64WJjOLr9xJ94v60u9Xq71/52T8FsC4Z1KtF1luTvSBaw+1?=
 =?us-ascii?Q?j3wkFGJ8z7qup2b3QFgpd9UlCbhXytcTZo43lt1G3Z1H8Q1ZmF2u407oI4x8?=
 =?us-ascii?Q?gUghrVaByWACXb0ndeg0gXuvTgPFzegrK5Bqzp+mcvBYJ4ZP3q1YLWPxjVKT?=
 =?us-ascii?Q?2CPGw1bQ62+9By7i/6IqVj/qE76xXfw+eMRo3qxhPhvlcOyvKRHTaL6GqSZT?=
 =?us-ascii?Q?33P0JJP8iVOeMmEKXGjmi9srBGkTmTJvV8c2F6c2YCcCELCT9A65r1iJlTL4?=
 =?us-ascii?Q?5Aej4Hi3fejHPfJCCngxPhFNuPFi71eli4DwCPImn33IvpDSQWScIHeuFb+p?=
 =?us-ascii?Q?1Wsyv/p97bBI5W0rO/+LdPjY9YLgTJn9EDPm8UdB5UbdkyaLrrLwnZpt9gL5?=
 =?us-ascii?Q?fe7Ao4R4Ag3ce7+aD9rf0z4uJQCTMuTthD4v9jO99GyFWWkdldesj8CLZZn6?=
 =?us-ascii?Q?C5xQC06zjMaqHWYCh/jRMWelRYlfbTRp98Mvcx7wPo+WdntFbfcaxfOqHj8B?=
 =?us-ascii?Q?alotdNG+5V2VFCm4ODt+591oiLToPhbZMRn26O7rd0tIZCgS96VUfdoRv5tC?=
 =?us-ascii?Q?8RTNntbQoHywALAoWHRCp0GVVv/HeFp2oiGS9PAydslIXzfUPFt4OriW6L3a?=
 =?us-ascii?Q?odP9FeUpa78rES0ffK2rIKK6tRN3UmCEL4GllQBmnoR6pxFU1Q43kwuz88FI?=
 =?us-ascii?Q?aFjBqOvfTWIif464XDsIR9TwdlZIi2RbxxwHoJkFQEOdD0A/lAUrXsYFWWeV?=
 =?us-ascii?Q?8k77p7nFdTpAPuXeKPTaNs4v26+aNs9jSL55IzjpcWBYxeI8bk/XuJlhoGX4?=
 =?us-ascii?Q?7B1er+UEXi2lEDHlKnC6MtMWxIyTm7Z1WR1MYRGNqGhsaSYBsRdxfAKgJaI1?=
 =?us-ascii?Q?jmktRqklIlJZo1jzw7GVDrEQGXd9wmGyjk/hPe0qqHcxRJdfpwLFnr+o+OGo?=
 =?us-ascii?Q?ZBDmJL5HyOlR5Opq+tYcJsqXW3LXj3tIxLfAJinZByZObXRkY3i1zfgqFKAq?=
 =?us-ascii?Q?MNxxWIY13wLuLTykbsHm1RcGxDQ2zW/+DQxsxe1oSWsxZjSUUpZ65YP21oSA?=
 =?us-ascii?Q?BFDLlgdeOAYGiLhGfjMftxwg2M3uqCKjsICVQO4SKf+36haBhHeJWjZUsyKE?=
 =?us-ascii?Q?osqSTjXpMRFoVcFIc28BWRd0m8ymG08BFQjoDnnps9wX39cGoYLdcCliFddH?=
 =?us-ascii?Q?kzkiSIg7gLDGEoT8dmjMF6edUo2vZ9ykCk9tys/7h55mue9am/kYMjoGXTax?=
 =?us-ascii?Q?ztm09aELoXowWQqzErZA8Z30/vuDtgAIBRgzxczfQg+Lu1od88OEAm7S/ycS?=
 =?us-ascii?Q?X9TqYdKQ/QnQFSCVjFBdJqeyRKMaVOjqa6eAkdDHHbLaB3z+u+lKr9w6Nf6u?=
 =?us-ascii?Q?KcxR8+1pUra8T4b3mKwuAQGyvDX4E9bfcC8UxF63K+/a369LDiGnNrMp+LAV?=
 =?us-ascii?Q?OuqqgBKJFvr/62h8fw2BouBKZVMfWhbvZt8JqfM7uXgggyqf+4/qeq05fQPW?=
 =?us-ascii?Q?WTz87ancI7IBwDaDjdQmpozxeTV81LkOC7eRTPQbjdtGk2OF+O4Y1tTOdv8q?=
 =?us-ascii?Q?kQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd88f19-8382-418c-030e-08dd1e567d37
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 04:51:37.4232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pclAdXDbm1iDYXRRPdaQTzmajh6aT+LyXTL3/HSaDusvKRRBpTI4Ibt7Wclt/ss8ruHcv3Vyqvkcj4H6a6L3m6OE2vXf1zbSjiRBobSLFe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1872

521C Wave5 variant does not support 10 bit. When 10 bit support for 515
variant was added, the code which returns an error was removed. While
testing 10bit hevc fluster on the 521C hw, timeout happened.

Fixes: 143e7ab4d9a0 ("media: chips-media: wave5: support decoding HEVC Main10 profile")

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-vpu-dec.c     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 882d5539630f..fd71f0c43ac3 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1345,10 +1345,24 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 		if (ret)
 			goto free_bitstream_vbuf;
 	} else if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		struct dec_initial_info *initial_info =
+			&inst->codec_info->dec_info.initial_info;
+
 		if (inst->state == VPU_INST_STATE_STOP)
 			ret = switch_state(inst, VPU_INST_STATE_INIT_SEQ);
 		if (ret)
 			goto return_buffers;
+
+		if (inst->state == VPU_INST_STATE_INIT_SEQ &&
+		    inst->dev->product_code == WAVE521C_CODE) {
+			if (initial_info->luma_bitdepth != 8) {
+				dev_info(inst->dev->dev, "%s: no support for %d bit depth",
+					 __func__, initial_info->luma_bitdepth);
+				ret = -EINVAL;
+				goto return_buffers;
+			}
+		}
+
 	}
 	pm_runtime_mark_last_busy(inst->dev->dev);
 	pm_runtime_put_autosuspend(inst->dev->dev);
-- 
2.43.0


