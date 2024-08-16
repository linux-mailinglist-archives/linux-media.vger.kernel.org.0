Return-Path: <linux-media+bounces-16395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9016B954C4F
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 16:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23C491F279F0
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B719F1BCA0B;
	Fri, 16 Aug 2024 14:25:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF181B86E8;
	Fri, 16 Aug 2024 14:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723818325; cv=fail; b=ngpmlXEi1E/6pHMz6pjSdz3ru2LNa7qyEbt4pUV0hzybp/WwUAmAblW3TlBoAM+yTtqFd1U5at70/h0SgtsT2aY+NooWVYYe5YBv3DMGUVgFLzL+Bvd469nMz32KwNhE/K7l1zWCkvpc0VxwZOMKYr0NZ+iuOF8xooEAKvzYOyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723818325; c=relaxed/simple;
	bh=GHGh8QKpPsT2pQFQQyyYfdrZwK+hxqZD3Qe9kKKwqnI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nrcip0Z7svHH/3+NmDaYHjLpgA1ZF4RDQL1baTCux9jpQIs/W9OqDdCowhvgww6ChFEI8nT5GT34D1gONLlLTuzqb2mGkwBnjCbW2zlN7NUiykbwMLCgU1JdOLcKtsJ8+7Lzov1UCQ1CcVRkZuaDRjRZ2KNNzKRudQcqKMBLREw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQ7DLWMAeLGP7Ta17fA6gzj+pKEZ0YRjXBcEHO9sr2QY0hlQOrdAegraXR+/thNitTefrU/PpWJTu2IfXIlP6p97eou7q6W6O+uzIJbFZoP6eJa06wCBCzHj6YzXwy0YA1QHIOOZI+tkGG5N2CH+LTzACjnLr0DJCC29E4gsrBsVKv6paC9CIhe7yAMdl6yomqy4HB3GadFxWR95uvCgLA/Od5Wm2amgU4EmiOibY59OQ4zHh9Ced9HmNqRMowAPS4D0yGoKlWcx8NVDS4rYJw2V78Uc/r3yKCbvYzYW764gKgBBOTPiJLKxnLjA+301syqvmkrhMiJe759nDVrk2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MjX4M9UBbBwxG9Ib3oQ01rRe4udqJGHJwVScOeNhFM=;
 b=i38oplXT+Hem9WNeDXgD6T46Gl1eJScLO7dxpyNXGBDsx8e9c7LdxmcbH+89McSV96gfXVjk9bCrFu4syzU/bfJ1SS5dQ6hhakhwKa7xzB71mBhQqnQq+sQ4emOtqSstKnVXLg/0oIjeVuTUh/LEhRw6Xx5HZo705mWvN5r0VJBdjTPxUMkDdO+bK6favf/AQHauWndVZl1xLrrlqSqg1ZtLgrv5+Wn/L97URoIbdW6zdkOn/E8uQVWcScEdh4uCPikZAHEQGVIDgXg4shSakaIIPQAsl5NGU4O84PlCxcDBc12mH3cfSyNmTPw9aI/U/4EMkSGo+5x/5l4jcnlatg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1032.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.18; Fri, 16 Aug
 2024 12:51:39 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.7828.031; Fri, 16 Aug 2024 12:51:39 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [v2] staging: media: starfive: Add the dynamic resolution support
Date: Fri, 16 Aug 2024 05:51:32 -0700
Message-Id: <20240816125132.514488-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0019.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::28) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1032:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dda1f29-8d1b-4e85-224c-08dcbdf22be5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|41320700013|38350700014;
X-Microsoft-Antispam-Message-Info:
	WNpFhV39mjm60pU03lmgeENwRCeU+KJWeqC/RWG4Db3TT2BVmcMrbMUVcCzFfLqwYlmOBmwx5A4AttSQXwpOrU1rtdzWu71l9TguY7Hl/BpoUp10wzr4e5qhqyJLMD3VyOSyPqJ2bWlmSaZxJJGbtSUB3ASn1CzCzh/4V24fQujSMJW0uMgZ5+aFCLtg36zGjs4AY6JuUX+ogoL3QFOC2DcXBEyU3+m5pi+01IFRXERCryvBWPlq9bKEWoN3WpfMb9P6UGrfXV1ILwUDZOguQxgJpYr1S/o+auI6etXbcT4Up+2Lo7+0mqUwm/uume7BdDlgh5hv550OLL9+US0h2g8wzWtNvupHGJ7z/KSNjh4wlJgGUgOaxoGmn+Q0bOZaEtrHhO2PEz4ZgB+Nnl8OSUxoR/yoawQxLDeb13pUrNCPZCrdheAEkfeI74n8GXhok8ZGW+bRbdEtoBq/BVAkl3enMYX95I13CPoi0R2TqENzoR6938BcZ935QYN0twQL+NIjkU8d4+HN0LhGp+GTBkYSjA1n9meD7b4Y3sksdrTtCHILg5eYCX97hPBH8MxIJwsEQuGVYjz7kMMoWcqvbYxFqdiwus2Qbw4/75riKWjD1HpdymXlhEBt3f3FafZh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(41320700013)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wnyTjVxLB+tE7dgg8ywp5LZisMeWiufPlxhPxgHAm5R7phOZo9TlblWJhHtc?=
 =?us-ascii?Q?e57DpVsCP/LyCDpjJuhPTzFTQdug2siD0TXUqiug3PeCx6VWMU/j5yWIDsIR?=
 =?us-ascii?Q?72t0qD3liZrxCuC9PsQNzMBGaEi+34gyIyezU0HgeFVC+y2PUSoA24E49cs1?=
 =?us-ascii?Q?aoTOsLJq+EqGh1r4zP7qLUxW/Dl0kdTzi8JFoSCVIFxMBfcVFNvI0QAVmYUo?=
 =?us-ascii?Q?6uCdfougipGXqUVibhpAeVhSLzwJ/KtdsuPcrPlKcCa0cJoB4l0MfqjkpBeU?=
 =?us-ascii?Q?3fEgmXTNwV5vIqiBiV1sjVp5sPmNByvT8UDMnoT3PZSzGcQApwmbHWyPMMAs?=
 =?us-ascii?Q?cKcX66bDqzt2RyrWlkxe/vrRF6JSpUXyzzXGt/MjEkSPzxTN1Ee962G5xI9K?=
 =?us-ascii?Q?Z7XmmEr/YLkuuayApAYmgY1sNHiq4AS+adBvwlVkdLuBj7GgKT5cShjtea+K?=
 =?us-ascii?Q?sp3GwjYtmUM8oAI7iOBNMQoIAwDDeziNgvYiRdt0KUKGKB06V9/OEO+dCwgL?=
 =?us-ascii?Q?ELKWzmoPjEnoE6MxXFmXfEU8MQSaKP436AhXDxk5V7DFmNMWl2Iuy61WSKcI?=
 =?us-ascii?Q?XD/6A7laDrwmZ4RANloxRhMwGJrB63bBGLaC1/T+Wv3cp3Eq3rE70Dp5AZdc?=
 =?us-ascii?Q?CJFbGsKrXpUnLYDHqAGDiXtjo5p6X2+cDNlxclRbV9gqBHLVyzwKcfc3RiXL?=
 =?us-ascii?Q?Ho0655X9BiH9wiYbx1GuWmUijn7h44wTP0FPI0TDI1qIVxGlH+NSIObgo2e1?=
 =?us-ascii?Q?v7FPtywLKApcLeism6O3T9DsxqL10V9qEnkmtpQNXeWDGCQSb9EcB2B/Fc11?=
 =?us-ascii?Q?hS6H0vPQSqWZSIlmR8VscP8Xj6l1Pd4PqJPEXq5IUXoT7lPb+W3zOLPudWrM?=
 =?us-ascii?Q?tVCjjAqPKRoEweFZPiuOQKjJUAytvhvWsxcQLlgmwlq25DGJA38dVHSidRcm?=
 =?us-ascii?Q?fK1slF9Gcqd8OAFplbvXJZaokxWTXh8+uAgmSldP06Uw0BEBewYsjsP33Wq4?=
 =?us-ascii?Q?/RzvbADpTfIkhzowUyoUqdUSe8rLHlNBHLj0qetz9RXMR2jvw45NNz4S+Nvy?=
 =?us-ascii?Q?Mhol/n0/HynrST+Y2YjegtBst69/7vWjymHiw4JIw0N+kGfXLhGFEnYsFjSZ?=
 =?us-ascii?Q?+EsnSWv/UwzcI2ZOWK41CCe0jj/noiSBus6SthBjgMZCE6KkOrE1LcwU498g?=
 =?us-ascii?Q?VGClw1Un3PytCOrWhniy1ofDfdKdkVN9M44XF9ZgUUVoMyDeyF/rpEzJchpu?=
 =?us-ascii?Q?PYlGfip4LAqJ3bRUqTJZ0VdSYUmgyCTnkeJXcE6GRvZ4a1BUiCfpzR6HYwM2?=
 =?us-ascii?Q?XKMlr6ZfCKow0bX1iqr8aIQ6O7gq+wo0epLWBNeSj3VrbiR0yQPgiZyImQsP?=
 =?us-ascii?Q?f0M2qiZ2aEgZFgMOqOb7JsdZ2dMK8zCLCQIU7NWzMpu/3pQlChgdkhHb4358?=
 =?us-ascii?Q?AusucNnVBcSwS1lHTug/1fLE0eSNNP74so97qfV0MhZ+XqcwHDDAza/VfS3Q?=
 =?us-ascii?Q?qyepqxQCCdgP9HpY1IR8BZs4bCKPl+y+3OzTvCjNwJ/cbo1UpteJ00uXcjn0?=
 =?us-ascii?Q?aMzafxuz6u8lLcAdUcXQIvd/T0JIJ473cRREXPi3b4b6IlolwgMMOSO33YuP?=
 =?us-ascii?Q?OnGO8KZD4SAzAe3zEy7iTw4=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dda1f29-8d1b-4e85-224c-08dcbdf22be5
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 12:51:39.7586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6Ow//G3xNcTujai9QK8G+cRJT4Yi+KrbXqq9PTBoT/d1Cs96s0z95T0BDyziigsHsC3w6nh2XWNN+CREQJJBe9kkec5X5YvhjyY0IO+uj6LbWZVYuePS4qcJL7KnzXG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1032

Add the dynamic resolution support for video "capture_raw" device.

Fixes: e080f339c80a ("media: staging: media: starfive: camss: Add capture driver")

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/staging/media/starfive/camss/stf-capture.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/starfive/camss/stf-capture.c b/drivers/staging/media/starfive/camss/stf-capture.c
index ec5169e7b391..e15d2e97eb0b 100644
--- a/drivers/staging/media/starfive/camss/stf-capture.c
+++ b/drivers/staging/media/starfive/camss/stf-capture.c
@@ -180,6 +180,8 @@ static void stf_channel_set(struct stfcamss_video *video)
 	u32 val;
 
 	if (cap->type == STF_CAPTURE_RAW) {
+		const struct v4l2_pix_format *pix = &video->active_fmt.fmt.pix;
+
 		val = stf_syscon_reg_read(stfcamss, VIN_CHANNEL_SEL_EN);
 		val &= ~U0_VIN_CHANNEL_SEL_MASK;
 		val |= CHANNEL(0);
@@ -193,7 +195,7 @@ static void stf_channel_set(struct stfcamss_video *video)
 		val |= PIXEL_HEIGH_BIT_SEL(0);
 
 		val &= ~U0_VIN_PIX_CNT_END_MASK;
-		val |= PIX_CNT_END(IMAGE_MAX_WIDTH / 4 - 1);
+		val |= PIX_CNT_END(pix->width / 4 - 1);
 
 		stf_syscon_reg_write(stfcamss, VIN_INRT_PIX_CFG, val);
 	} else if (cap->type == STF_CAPTURE_YUV) {
-- 
2.25.1


