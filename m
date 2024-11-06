Return-Path: <linux-media+bounces-20975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A63939BDE8A
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36A241F2472A
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 06:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A89198836;
	Wed,  6 Nov 2024 06:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aZe6zRz2"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2044.outbound.protection.outlook.com [40.107.105.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546081922D0;
	Wed,  6 Nov 2024 06:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730873322; cv=fail; b=Z2JD6BNBRdSbWi94EvyZzbAeXflje2cSqJxi32ps9IVgiakWFdJP9oekCNLdSZjI2nzG4eRSKMV/tlAmgiNdrUNtztd4L9BL/LHqgOe9ozpo0IeQeivfN9vqNdqtBw7Rl+hP9iHEZR7eVlYCdKqb56+eOJe65DZZHaz5Qg2Ets4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730873322; c=relaxed/simple;
	bh=V9uQS5qYmiXssOXx3/jo+h9bUk3tmEJA4+u5KYczP+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f1kZuc73GcbzL0rsNrCk4bB3LF/QZR6b/kdgnucxijibpKP5zakn2FqKiu2UHRK4g1uFkAUkfxtLOddlVW1QPNPnbgNgESeelwwKl91q6/EDu4h6sfPibPsmGpxoWP9eGBHWQd7btFVe8urh7Lw3Hn1ZE0De+bBIlt4JQmgYG08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aZe6zRz2; arc=fail smtp.client-ip=40.107.105.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdjw9ly8B8kPyf5KH75DC9CqJU3feyB9uR+65iK9X6is44tfPsccYZvRIZjsOJ3inG8J61scZwgKRoHeYvluMJ/Q4tKU5B61vVHeMKSugLX//cIdJW+8ZAvyIElA+5nq/SOIlJIP27mZqyJmnFPCLcNHyrrymSGAJKAvnx4gvYSu3iurb0mO2q2qmcEzkALphgTWNdTAazckVww7pk6d4UKM3wyzgg3MEXDAh1QiS9J4cajglaYBgY517LHZlnOs3M7OGzqVDEKtcBEhYq7nk9bkAZVpgcrevLllvLx77Ih+1Zcyn08jzOatwdHroyJgC+Nljexrs6sJBHwc36j8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3oKuxRFkA9yHb1hrfi99zYa7fO58IZs40h8sxAWj0U=;
 b=nPdiPrnb8fon063dJIfc1eAOfer9ip/d5yi5D2vhUlFODQKuEmje1BYyUxMp2EkITK2RoVxDNeFNMY95uMkmGx79duzn8JlUHdoJJdfuZuJ6q4VmCsXX5hvV4p1myGErduBrrlTDYianDap1agRqGgZlsMdvPMfPHyNl1GKxghrzJeiXJMWl3qaEq0VBePVTPQmtA5hkFS6vO2JeLM3ACLAeqs1/jEHOQPeqEBkx0iB7OHHeD4mar8mL4PcnzUaiZBxUKd0jT88cnza2y2Fsm3E2EJB5cmWyJHnaw0AcsNUrztNyH7FhX1t22vXY4TfNc2R64xv7TFtyi4xUy+4RTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3oKuxRFkA9yHb1hrfi99zYa7fO58IZs40h8sxAWj0U=;
 b=aZe6zRz25BnyL99xSzmk4gbC3Zhw+b786qY4Z+bwaRQXkl/gbN1xWDwNjjQc4WWcLbE3bGnaSTEApS6r+04PtFCA2epHpDP3goymvtuj3mqapmhSomU3K7uX/tafK57elDpXZIe3rHPsG95/LpANT3IVPf6XdWSo8mMJ1ms8iy1b7/EBZbNSXTwb7NSRaUFtd6N9A9n+5hd1XYPKVUFx9vLXcx1ph3nm04oZC3/COn1Crbc3aezgTkD5QrVmK1G1DMxskJiLADlhaKgxn9YUGWcw/S7UGOXlecLr20exTY/aiQNGokQlhp2WnUKr51GLnLF7GdLR04PZfgdUQ2rX5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PA2PR04MB10506.eurprd04.prod.outlook.com (2603:10a6:102:41e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 06:08:37 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 06:08:37 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/4] media: vivid: Add an rectangle control
Date: Wed,  6 Nov 2024 15:07:51 +0900
Message-ID: <20241106060752.205074-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241106060752.205074-1-ming.qian@oss.nxp.com>
References: <20241106060752.205074-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PA2PR04MB10506:EE_
X-MS-Office365-Filtering-Correlation-Id: ec54c818-56e6-49d7-7dd6-08dcfe297411
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TR6XBap2c8sgr9e8Tlfiopmx7iADuAnYFs8bOlu8sgbFZLzLSWJkKTKqMt+l?=
 =?us-ascii?Q?nfnXByzW93bKazwnguL0OzyKHyeT98nb0r/VPGS4KHl/gLid0rNM/JOmkNHT?=
 =?us-ascii?Q?0sYX8v5DdBSbj4cLmUQmepgUagIAFZyLnXcwUikoyD1ijaeDnu9PgmRPpBPD?=
 =?us-ascii?Q?1lqDD5yZMwgw8XJb1Vzz7OewyZmhWW7vRb7tZZxfslMwci3SOAZj5vkizIjo?=
 =?us-ascii?Q?XcXnYt9qb8pFLImqPJcAvof0nepifMFeRQ09DA2pF4kOAUvtWEF5U3MctPkx?=
 =?us-ascii?Q?1y7bRteGbwWk3tJkEd574bSAEpfzTQOmmk7FuZB+UXfPXnY7J50kG2gPpmpQ?=
 =?us-ascii?Q?0nfH7eGROshrAcuBJ+3+sSDJGUHUmplcTQ3Oge0M5WVTEm1aFKi74Now3wud?=
 =?us-ascii?Q?hWIutkJxELJYKku8fLdvrfTL/1iyTyHyeh87yOlTBB+gtqvZWu1bdy9ITbkK?=
 =?us-ascii?Q?Zh0xjV2kqyz06FvDeVkqP27GN2Wx+eYgFogJkcOKcKzg8tM379c9fSE0rYni?=
 =?us-ascii?Q?rQH0bzqamd8VEAOc2NdQmQ431aPRbuX8NtX0Nfzoj2iluXDPdQbDQ4Yz4FdD?=
 =?us-ascii?Q?geY7bADN0Of46VS2SCi2WcnOGKWUoG3gGploZBniQBRHW2EJ1L6XZS1XUQJ/?=
 =?us-ascii?Q?e7aa/QJKq6i+pE8KDskkDKZqbFVsCk5bybQ9aR4B7gKI1k5Og7rJ4C+c0gfR?=
 =?us-ascii?Q?svn5RLh7zArCK2WFye2PMRvoTiVNehooORf0X4cmVXD3Kh0pMZsszfbyb5FH?=
 =?us-ascii?Q?ZhkFgK/nD48mh5CODFP+TNu1+iZttAmV2nbGE1B7vj0MPiIrtTYi9DFOnrm/?=
 =?us-ascii?Q?ny8Qvnp16w9+Kh58SVpKxdRmOIYn81rRE7DP9t3yMQIaQ7GWp2owiesEgEzE?=
 =?us-ascii?Q?xOou0vjECPm4R75Fe2fSlkj6lzs3ab/i4tWwrjE8pNrgARCGeGyhVINW166j?=
 =?us-ascii?Q?KLtMgu/YN1moQ994C4uYXQxiuvMfLBKINWZ9vVXpr1RK9kBa8r44fq4TROmM?=
 =?us-ascii?Q?UVA+wMKKcNL/k5fUDICt5Ackq/VDODSr1pkipmp1AO6hfRyc0SAdmW2gmhb2?=
 =?us-ascii?Q?JGZfrFQEypYVmENJ+ZP2HTMAyu4E7SMTIafxtVtUBLAP7suGD+4JFGicQzGN?=
 =?us-ascii?Q?asoORwyijB0m7qpxjfwVa7PDF1qaYeOrvRr5a2Ixt6E8D3jIamtMaE5nLAJo?=
 =?us-ascii?Q?WKYCcVvMdV6RbrBuWPD3P9fa9MQLGSfo/JpdD0bIO42uwn+lBdDSqprNv7jA?=
 =?us-ascii?Q?NUVxhC+OFot2Be7lyAfxWeTuRvE/IJzC16dEhfOI/oLQd1BKSTTWQRyP2axY?=
 =?us-ascii?Q?1Lg6xgyEWcZBW7T6nIJykA4+eQsyLxGTH61ybNm+xPHnPRDtrkXVHLEnKCAk?=
 =?us-ascii?Q?wymyVXs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+H+MkrcnwkQdXqsGYqHwSnjGVVKa428gP6WIsLnddeRg3o/HJx2CcmFDVfxz?=
 =?us-ascii?Q?jvFPjerJAqj1cmoWlufxV5Amz5GM/xGZiUCiiAknW8AtCf1l5mkEneoJpyNA?=
 =?us-ascii?Q?wbuzYkLRT4m0kikcXqHBAH28b104mwtg2HE9gC/tKqH7WpGUAAzFMFMxdW6w?=
 =?us-ascii?Q?Hi6TDEdIabC/pLQOo88SazCdYINASMnBNUJLmQ5S2CuruPD/9htMyCZsQNXh?=
 =?us-ascii?Q?2MLzhlUYugp+CFee0XbqlCHwkZMY4e1h55rzhwpb7qcOpU6Ylv60RvYh9iDl?=
 =?us-ascii?Q?auCXbVMMye9I87FqicsSpQC07VG7PmDJEqBoklm+ns8TZzSycb+DwVIDDnvR?=
 =?us-ascii?Q?cH/PuI7CgRAm+/X+hyIZsV35+6ojJKrfTYd3dF14aTmf76IDs+i664j+dBqJ?=
 =?us-ascii?Q?omvoCXmQMXSwWEcUgkZXysdqFOGaqR+070g+PxyZIHCHkxWxKbf4ql+oXFVw?=
 =?us-ascii?Q?xKZCPVmxuixcQIGGJpzP33VDCwoikc6MksXZO6krzr4Dinxwxnuye3Gz8nIz?=
 =?us-ascii?Q?k7WXsJue9gI7ZsM7Kb11Zjc/qaGdV6kkkUxn5ytDwHox/3j5SX8cpfphhppO?=
 =?us-ascii?Q?arF2GKG9iY0E7fwVJXf0IK5bbgE9V0M8tNXdBmggCxmsHdyu880cEaLgxdhZ?=
 =?us-ascii?Q?gECteqaqoLrkeY+1ENOkPuYpiCkITebTCYmmdMGGSA1SyggpBejkEeWD0dz/?=
 =?us-ascii?Q?JEiDN9De95sbGSmYtipr9kbjpBD9g285LijrZA6g0iF1xPRf2BV0+m11Hgc6?=
 =?us-ascii?Q?KZWuD83MMnvkipbpNZQJ00X2aB+pvVNA82uV6clhd7EnY0CNcAgeZ017jOFH?=
 =?us-ascii?Q?GAhXLNIVeBJpKdvLSuRXiBmF6yJUI4f/uGMCHdoKeLB/07wrsyPBvWNoC70l?=
 =?us-ascii?Q?Py2D6lsBovvagcm593d1YwAYix5TyM1t8wG6EL5c5jPQj/wQ9sIdPe6Ay9UG?=
 =?us-ascii?Q?Shx5KAo+0Dqv9dWiWP2ltTaoBO6wCeyQde9vRi3s3H7a+HFH6eaE7hELuA/S?=
 =?us-ascii?Q?WyigDAjBAoyrjjpi0UROgUs8yTNYlA9td5s6FRO9swrx3sW+95/BxUhqJmzM?=
 =?us-ascii?Q?5Q5t6F4iyFd4cEshLqRniSqXDR4ZjDTJqVEwtBjtZKg4MXxAj78qTvRbzA62?=
 =?us-ascii?Q?wlwz9F6aKHg2haZYSBnCeQiRbdHJ/uO8AWTpLDbBYaHv2JmRIE7sOaMpiMrl?=
 =?us-ascii?Q?fStMImmBIRMvRuyXR75pdLL8Z5UfncfBJUoygvolat9SorxOthxHJWmwHZDW?=
 =?us-ascii?Q?KVYeuvEDroA7Kv5k4N0tkvaOz7GzCAfrJy02/kcvxdpuqqKaH9vXzA7GLXDq?=
 =?us-ascii?Q?RjkwcktYvgt3VNbNt7qxCLgacQi7atdHYAkJaMoHhkmrEV4/8V6x/p1+vLSr?=
 =?us-ascii?Q?+lkXycXlvrYfhtGtlU8jzmFjcREh/FCmh4Det5FA0vwhLH5E0DlBXHjiqA33?=
 =?us-ascii?Q?sVwe5kyClniHKcot0rWLtm43SosOPZZZo0qV0YHPdz5W9adnWLeREELvJMsY?=
 =?us-ascii?Q?m7tUnwAjiHYgInlyxGvOVCHSYIEN8n6wWfZ8C5/kC5HhCE+NTMhK8qwDjTk0?=
 =?us-ascii?Q?CreY/4oW5GoT8a17E0HCxNjqn1I+trWWsD6FiQfg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec54c818-56e6-49d7-7dd6-08dcfe297411
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 06:08:37.6056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLLElCa8QRSa5oyt5D92HInnt/mjGbScv8kBIRY63b7DTAUnqJ9aKVu6O3eMagfmh8vvum4POpP1EFAfqoVoCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10506

From: Yunke Cao <yunkec@google.com>

This control represents a generic read/write rectangle.
It supports V4L2_CTRL_WHICH_MIN/MAX_VAL.

Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/test-drivers/vivid/vivid-ctrls.c    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index 8bb38bc7b8cc..bed5f4fb0c69 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -37,6 +37,7 @@
 #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
 #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
+#define VIVID_CID_RECT			(VIVID_CID_CUSTOM_BASE + 17)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -360,6 +361,38 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
 	.step = 1,
 };
 
+static const struct v4l2_rect rect_def = {
+	.top = 100,
+	.left = 200,
+	.width = 300,
+	.height = 400,
+};
+
+static const struct v4l2_rect rect_min = {
+	.top = 0,
+	.left = 0,
+	.width = 1,
+	.height = 1,
+};
+
+static const struct v4l2_rect rect_max = {
+	.top = 0,
+	.left = 0,
+	.width = 1000,
+	.height = 2000,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_rect = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_RECT,
+	.name = "Rect",
+	.type = V4L2_CTRL_TYPE_RECT,
+	.flags = V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX,
+	.p_def.p_const = &rect_def,
+	.p_min.p_const = &rect_min,
+	.p_max.p_const = &rect_max,
+};
+
 /* Framebuffer Controls */
 
 static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -1685,6 +1718,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_rect, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
-- 
2.43.0-rc1


