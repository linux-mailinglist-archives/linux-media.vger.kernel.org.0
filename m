Return-Path: <linux-media+bounces-12495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A060F8FA9C7
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 07:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D2F61F24D52
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 05:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C9713E40F;
	Tue,  4 Jun 2024 05:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="eu7lE/HN"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022018.outbound.protection.outlook.com [52.101.154.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC4413DDAB;
	Tue,  4 Jun 2024 05:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717477906; cv=fail; b=QfU6s9kcOYRU9FTopJZYPKqjNarGeTXWFv/etE33OVgrKWxVsS7YfMYgZWevuSygtQ1Jqq1jPL5+FfnfrXnNhZp7HENRI63Z/v3uC8qb3oXXvAYeATjqa2gKeFBpQx9QCzaqw+Gi3ZuXFIIG76ejGZvcxb5VVAm6hX6SK/ZomVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717477906; c=relaxed/simple;
	bh=fz8DxEF3MjNB5/0zQz8VN4EFVP81ZnD5LFAmEqE9fJY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kf8BoDxYnv7DcdgwurZhYQ3Xs2FH2bXftm6KhpVOqEVoAiLLXVW/DMPhnF10y2uWmtbQhdSXAYjwYYPf84WzRmHeKNlQUKuFy3c3BIS9IS8aInYsnL+M0PulAd5c3yPREVwaUNW3My92T+Mz0rdp3M8IeSZmondSgACRTNipdJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=eu7lE/HN; arc=fail smtp.client-ip=52.101.154.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjDakmg6smbeqE42FE88SKFMAvfEDGvB5F/9SOvNWdczXMHCqgDDdB72KrOGkkxWCfC9ZLX+iQF4pvUSt5A67/4D/2wWcrnfWvi2pyE+vKsOfcSUAC+brabpJcHlBVdCzcnAOAOAngdPdsBjqZrvncdP24mUjbPrIb5UILmUt90B1zEwPoxUh1VGuVUZAvpik8WDX4swz2xKX2C+RfIhKzsUI3R1vngwa+6xJpC5Zaqoi19PQLmxNO6/GZA3cQ75QPmelm9SveeQwfBJVjK3n11BEhVkMRsuMNlkl6pJpeGtyX+4t22c2sF4/AK0jSplUyk/SAtUvzKxIVwRfhvU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98IokyhvF5viXgCvgvP+4isEJFmV3dVZvFJiOFsVBkE=;
 b=DCVh36HekGNxI4+dxSqj5QhTXIekOyhbYlaIvVaOCmaqLiNkIphwPX7+GbXzkPfBq/XeG7Jrb13qwkCqfvUwOxO8nuoj0PmQoXC0cmUZ+IJaO90r8m1qFDkDgMtjiNmc2ZML+mmgXmdrwaWDx4I1RPciLpHmJZx0GQIGwgRXQZF00HbfROwY50p2I8gsZzMeBRlurCmDXyZAvmhUAO2Me5QkccTSjVvtPqlbflKO7sHtbP337TO54d0QTFsc5AVDexKoszN33U0sWQDOALiMpVbC7s8VCHNqFAfiJFxvpRDs+SRMuwFWP3XyrX/jBva7coC+Dky37fkHjfjlH+vNYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98IokyhvF5viXgCvgvP+4isEJFmV3dVZvFJiOFsVBkE=;
 b=eu7lE/HNHl+vDNU0ALcn1nhmVeHNd6StdrHdRi7ivlQEKAT8VIm9jVgpK/5jUrwuqgVgsk314hHJE4lY1sQ9q/Dz5ENOvMzZWKBaIW+g4kN7YFYSZdxXo9Hss3Nd61dCSlzbFc5EE0zTVrbzOhS11uKQXAURCv01Rf8OtmYP4MI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB1537.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.27; Tue, 4 Jun 2024 05:11:41 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 05:11:41 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	bryan.odonoghue@linaro.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v3 2/3] media: qcom: venus: Fix uninitialized variable warning
Date: Tue,  4 Jun 2024 14:11:19 +0900
Message-Id: <20240604051120.9441-2-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240604051120.9441-1-nas.chung@chipsnmedia.com>
References: <20240604051120.9441-1-nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0c2ee957-93d7-4623-b71e-08dc8454d1dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|52116005|366007|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PYAc6EHBWf6Ruq8/zF4XyV2dsi/BP1D00OB8XTF2bbSlo5NRRzOd7l41CYNh?=
 =?us-ascii?Q?xo/1MwSIDYAwUbuIM+/UoN0FLZSO1knNzuyWnQvm4KjqyvR9E21h4dDDPCIi?=
 =?us-ascii?Q?3RS25aX4tNaemGgXlYGNhjQiTp/+67ne/SSNc7O/BJ1PudcGjY3FWwRZxuPA?=
 =?us-ascii?Q?BX6F9Rt01rUJ+bvYDUltXKZnOayTeUU2gGoomZ5otmPy2hTcLpi6oMUvGN9z?=
 =?us-ascii?Q?pJYzu88T9YS9rXFtl+fnitqGcuQQKLYDEP410PPT4MTgBgEBJQ2Pm064m/3C?=
 =?us-ascii?Q?51V4l3LkBNFYLDU9eCeT4s+CuEI0/Em1Ow03hNv7xHqltmJRCUX73PXAIAJI?=
 =?us-ascii?Q?PQiqicK2wTPHiIL0dPrXXv7Yp/DmUcsDa+LFuhs+sGMcJxNDXl1dl758950M?=
 =?us-ascii?Q?aljWYUdGyEo9ywNT0hGkfSg5GeKiTbyjSlNi0uyoHVdniwL6Hb1uJb8XUyX2?=
 =?us-ascii?Q?eLGcUbzAkE/7AP01HTdHu6a21FHKLdMNrFVBE520uGUK0jeRh2J9xG63Bf4X?=
 =?us-ascii?Q?Ig9b1z78r3mk/igAOzsAGRZNB8z5GwWdXE9l+jCl4JBUooQ3e2ItDV5EaRsp?=
 =?us-ascii?Q?RPvSegjdyISEK7a67BZf2ZspnZpUwQd+nUH3szfcShCcB5cx5Oe1vpBbcoab?=
 =?us-ascii?Q?T9OUwOPslN5gAhnZC9fPcjBuKvNr6SO0hBPUx2xPAv5oRbbr0KMjnqt9dShm?=
 =?us-ascii?Q?izIBpJPxgr2B3Ybl0ctSVtu7JPVl/r6oJe2PQEJxm3noDUJ7/Ig/xHYaFzRK?=
 =?us-ascii?Q?3hPMiL1kgkfZgKrYnTO2LiC372FRdjSD1YWoJciygpMTeSQBjVcJTeOYs2Zo?=
 =?us-ascii?Q?XXpegPQcDzlRMD88igcDgRj4TpxXCA9WldeaqqNjmaJn5BPSlzwSp1Yc2d26?=
 =?us-ascii?Q?V6Wxh1oOKeqjoQN4PzGbz3I+RxCB50GJfXeeSZN73/2mfp4g8DV12ty1h5Dr?=
 =?us-ascii?Q?Yf7Ixr/JEHlNyJmKHKcBnHgqiw3q2n9hf2DHNAfoNm9IAP2uB0THAX2pdFXX?=
 =?us-ascii?Q?UjsDgJw6D4A4A5vUZWVeN4KI20dAF8FzdSMYq/PZWJzNRrQeeYumslGqsFB5?=
 =?us-ascii?Q?Tp4SXF+gMBwOcWw+HvhXdcYnsj1fYnb3YufbFuKyjt+PSR2cKeEzj5FaEMXt?=
 =?us-ascii?Q?7hhTbZYJAlW3fNdjJrCwbZR8HVKSLBMThaBlfvj0wMYg80pawoZjMZXxffPg?=
 =?us-ascii?Q?o+ezFjqZSVEfvC7cxpQZGAmczb47QaBF9BhVFCZSHKph/lcU4OkcPAHq8i8q?=
 =?us-ascii?Q?bPu6Abt0eG740jdz85oYI0u1MQH1O2Z+EbtVj6Uarb9+iLOG53C8H5nrVPO5?=
 =?us-ascii?Q?yP0Qe+i95t7Nrb1fukC7vPAf2/dxzwwJcSAuluWqfGN4qQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dg5NBeUreFMnKZ1qcxgIJhDqMbs+Ni8VyZzVQEdAiz5B9nRax3V3oO1Ef8mN?=
 =?us-ascii?Q?g8LZWCrbg0DjrZxzfTlPbJVhFa99BtAGBfKjJ2JXtkvsACGyu0V7RJrdEKgx?=
 =?us-ascii?Q?d5UN7t+/WAmNDe9bKN7O9rWNOw7spcWZvTCCTJYFhREv4IfKuyVZ/Ntjk50z?=
 =?us-ascii?Q?BzX3r3xp55qkp9KdRyRpqDMmIbFzh1Ansj8xPFrX5+mFL/orceh8FaNHul2x?=
 =?us-ascii?Q?IckrzCIGQOm4FmmQxGIT7AhH00ixa+Iyf8+aq7gWUq6yfk+jKrteaBTEGlT8?=
 =?us-ascii?Q?Hx2rXYqmZJ1Iaiu6Pvvm/jVWVWzakPtOmenXMiKNBj/bei+GE2wc1VdrxvPN?=
 =?us-ascii?Q?PS2TyaxGOs22GU3Dog/FDRVFARFJT8EBNU9iwPA5CN0yTABv746g540210ju?=
 =?us-ascii?Q?8hsvIXncoXGn4rPaaBNTZidKly+4IzNZXXTuWOvyNpLQUScUgTLz4pOdkJnr?=
 =?us-ascii?Q?DJ4z/eNJmUF6GJrXvaUoizeuMaDvHc/i5ElyX0jz+qsx2Ev8PXW+KEB6gem8?=
 =?us-ascii?Q?UZe6npL6eVc+9NArqQ4ZGepEnEDNYbWk9LMOUMWNRnyr0sfV3NvIVMvcnYDC?=
 =?us-ascii?Q?IcmoGc2fJhXzUNoSiA9G8kcKm56RPYR3s7PPcUSy7B+Kzqxf4MlXErqNgInG?=
 =?us-ascii?Q?QZnBGjzuDRdSR7KqGOoA8sWCnTfpja5LUStjMlgQz5L1CQihb7NpwzUN6bO5?=
 =?us-ascii?Q?FjvYrPAhdfdjp+f/UdRAhz8UfR80No5PIwwyzVpLtJBP8xWKL9nEOqA2FZn/?=
 =?us-ascii?Q?W770wQ4/Be+Pl8Ro0MBx06XP4Z4zzDPPLSP9rEm0X0LDPC+Ycu1bAy4gFovL?=
 =?us-ascii?Q?/Yxqllb7ICEr01xwgUynbSzAZIyOcDxOUp4rjblN1NPhCRRhdIZMN6TzY6AY?=
 =?us-ascii?Q?NPtew8ZF6+6hZINlpqbb1okHS0jmgb+imYkIdEIRKP+p5RYMGjD6gtAUmCJc?=
 =?us-ascii?Q?q1T0LxOj5H4MgG8OnvOHF9otHb3IqVtQzbzmwPgSyOL9LAJc9LctblRz45+2?=
 =?us-ascii?Q?f2Vx/9bjb50sxcBpfzvW6xhfidGcftz6P+phPzF6Ef8e6AK/FI5Js/SAgevU?=
 =?us-ascii?Q?0yd5LuuQEUAeT5j7yMv7DOT0X/50O7KP0+CnHdZcZFixr4ZdQBfkMSYNfHtx?=
 =?us-ascii?Q?mFSMkDqHX1PpJL3dOdbh0kqMo+1nbDVSIYSDO+4Eywhil5AlnmdgDO0j4qFA?=
 =?us-ascii?Q?4WPQBHnF+kZ3xXcw21h1PIcGkLiTFN+Sx/RzhFR8IRfP2atW5pJy3ZS1vPXb?=
 =?us-ascii?Q?1Hb730oABHHGSJd+maVWpG5MkkPqt2PgN9yewDAXztTrGVQPEZHk022HOkNY?=
 =?us-ascii?Q?z8wUHxeKaVPCRN5f3XrzR6fxumRSUUzhv3A9LeMhccQUbuuKMwf3XXw+kitk?=
 =?us-ascii?Q?zADKr6whwVeDHrEKW1BNQILNlkW5dYmvV8IdPjCD3KbByl3UQbSHhjXucmLx?=
 =?us-ascii?Q?b7QF01rSHxL6vKsAIakX3TcdtbKlGUw1R0ycd48AvRr7gQfFiqjfZzvg4j1U?=
 =?us-ascii?Q?2TDHufUeDvzxUcR2RxyvOUuB7B0Se6a6HqrkAQ8e8XKohwsStGc9+qOslW2B?=
 =?us-ascii?Q?aZtpK+T2wKJrOKaIzhxMQpD4aRvEocKQ+3DK4w7DpHUzNjRmoaxsE2IyPYI+?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2ee957-93d7-4623-b71e-08dc8454d1dd
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 05:11:41.4100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SART16oRmPqgXB/LIyfObE7SVKA2ZnYnU5ZUSsbgS0+8JCfOxMfU5PtCAv9vAtTOtuHo/brNDrpL+SZtwlJgoh2sEsNxnGIzkh9kKRsbvGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1537

Avoid uninitialized variable when both V4L2_TYPE_IS_OUTPUT() and
V4L2_TYPE_IS_CAPTURE() return false.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29130a9441e7..283d3c21c2b5 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -161,7 +161,7 @@ find_format_by_index(struct venus_inst *inst, unsigned int index, u32 type)
 
 		if (V4L2_TYPE_IS_OUTPUT(type)) {
 			valid = venus_helper_check_codec(inst, fmt[i].pixfmt);
-		} else if (V4L2_TYPE_IS_CAPTURE(type)) {
+		} else {
 			valid = venus_helper_check_format(inst, fmt[i].pixfmt);
 
 			if (fmt[i].pixfmt == V4L2_PIX_FMT_QC10C &&
-- 
2.25.1


