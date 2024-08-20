Return-Path: <linux-media+bounces-16540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4C8958628
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 13:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 308E7283CCA
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 11:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2EF618E768;
	Tue, 20 Aug 2024 11:53:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2126.outbound.protection.partner.outlook.cn [139.219.146.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50EB14B075;
	Tue, 20 Aug 2024 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724154795; cv=fail; b=qIcxnVnoQxu+IE+MUDpPNvvOW/ImC9UOrYxRPL0/3WauSHnIkAVre6dCrjbYxPiNxMSwlM4CSobtgOazhXhFwM/Y0CJMDdvJzViyUaOFe9J3ecOEh6570auFtCpHTFc1gNYWA+n3rll08PxBtc2soDpXnI0hUEZSNgRsNCTYj8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724154795; c=relaxed/simple;
	bh=md1ZiH41YjRoCvIDTOpyyAQicQCtgt7pbVGuWk+noVw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=N/x/WnV1cVa0rjw56fWhWEgSjX8kEegaLlqxKjCmUA/o48KkvsjDE6ni60ZiyPr6ayIsEfOzLf6Hs1GEPoc7IeAwtQLbBGKKobMh2PZ+Wz5K7m03MDYZEXuWlDUJ3YJU/Pejp2HtnzkDiKuNLrQ8qFzuSY88PKPi3+PhYiJv7UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9CEdevEVx92aO3Bn8S5JDF8FqGcA4pwF5RthxQe/uaVL3qbYYi5b9u8feN+YKjgDxy6rJB6kgIFb+yXXDL86SzUt1ED3HdWQjQrdY+9FqIvcwU6HblFs2hpLtm9Snm8qlQ2X5F1RtU3stoZ1Wmzh4DykkjoMRQEUjAYoXu5HYT4RZDgVdVIZZEEeNnzn037doHC1vwzFo/Hc90hkPiNUTxt2BPBlzbFYH0rvEqmtDzxcZ+Vk7ZSr+0KUeO9xIazO61WwhkFNL3ocgLRGi3DzfW/0IeKxA6GOtuEbVNpWrUmMHn2Q26uHMIOXhCDEcKAc/ey2jHT5bf+Q14tmPyWzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugAnj0BPZz5ykIJbMuSuXvCrYsjSsTf+AClzGKBFTZc=;
 b=HZuTqslHOplaQFk4BIzDdBW2iLJPrmkDQreQhHWBOMNLhZdm0I2Nm2hDSkGxMjFtbALweY/DYpfmNDcKKHxk2Jkf9WZxP3gsBK9w0upXyUDB0kCO/pu7bN2IfKgZwr6puiUDc66lG2+2kkUfIBGkwbhgxl6bJRd5CDh1rBIUalvm355Gis2cymmfF24po2nwad94mSLTF3CuYvRkpfDSZHg4hHfqZN6mMvjAmpLin+lSx5lfTWMRcBGwmde2LVmPFPX/t8q67sX4+pWu1eUlxFl1XfXh4wMW2J2zRMd74OoW34CjwfuHEHr3eWj2ebEh0g4/W6MXgWLp77eNstWkFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB0998.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Tue, 20 Aug
 2024 11:20:09 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.7875.023; Tue, 20 Aug 2024 11:20:09 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [v3] staging: media: starfive: Add the dynamic resolution support
Date: Tue, 20 Aug 2024 04:20:02 -0700
Message-Id: <20240820112002.560432-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB0998:EE_
X-MS-Office365-Filtering-Correlation-Id: 770ef356-eb52-42e8-c82c-08dcc10a0d3b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|41320700013|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	C2HAD8SGM4EsclIt19/tHMH0p9SAuS8bxJHdowS+nrOSdTXSz5EUpIwnUvdZz9azlXvNimq5GOIn0mN61kU//tOoXXRNZoRNV+aQiHVBznF4I/E1o+3WQqQErzRcUxnJGUDfw9raDaT48DpEZQuqdhnLwY7H/UflJnk0lBFcLitbEHCpOb+Yd1QaZxCVHjgHrJsdb55MV8pMKIgJwH04Zm1+kgf9pBSsV96pfdtAP9zoad2LNXJRSlnOwYjy3ardCioDCYM0w9lb8Ke7ZNfGR7zhDN6fRvnWxjEtK4OiUqhGGe0Klr4DgNi86vGEhoO6wLm5VbtS+m2CjKSWR4qYFM5HGH6AJDaMsU2vQJ4+Jf0oOaSu9miGkHSuNE19/DxQh9820Ohxq3j8B/d0aY/3mQZJ74hvE4DFnNlh0T3yFjW3amKXoVB/HShx2jGgHkHFfCre4ghZodRtSmq6jdk5Kva+1vaRasyaZ4RNdqvh3Z8cdJ9Iao0BYNyz2d0mEBBz1fmlDq5LxDIN0YCXzdO556Xd8au3n0kwQoMmCYivcGaWuyJ5j8Kik0BRAAxX6fqfNoV4PdiaU2oI0N4BjgQ9VR/WnhsXpF6QIo3bbFIV2UQloRMRyPRLXclRppx46z0m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x/5836mXriU5xlAZX86a/1QSWZdWV9fy6JDOywh+2izwpJxo5wSrQcJGL995?=
 =?us-ascii?Q?2z3NIPBJ5coOjcAP6sRKibjvzcs92Rxs0GOQIHAauXxqd6UFFocqkFOgqSrg?=
 =?us-ascii?Q?oaeasqw6Izq8ZVoBAozGlzGTw4cK3RRLwBPyKn3NCPME6dMLF3TitFIorD2f?=
 =?us-ascii?Q?ccM8iCD+3gtzZHuUC7Ema0d01Iu3OnKNtB4t6H3W8Jr+zVxNrZ1e+vKFcDQb?=
 =?us-ascii?Q?vXDzH4MrPX9SVy/ine8Z/83DYX3mldz5NWuY+i291c2FHgdJB9S6/lt0Hdvd?=
 =?us-ascii?Q?8RiF11YHMQiYKC6BYqBGdneFLxU4P7951nOGUfOAxm0Jl5W49IBoPOhisWss?=
 =?us-ascii?Q?Y4UcfjHVRymux+Ffp9TZhqG/emvqqymTaTuzZez/3c1fp4hyjFAIb4ZTx3pM?=
 =?us-ascii?Q?Y2Cs6dDbph+aHOcOpM6nIEsl2nd+YAa8ACj+JEjKCoo9Vq2JQ8Fyd0CtshDy?=
 =?us-ascii?Q?VgLO50z6HWUvbYYDBOKoxFQs7Dq5RUOKrU1AAq8HW8yclHH5O63LD6vZLFYt?=
 =?us-ascii?Q?KVUBpI0pvErumWYo+GbSPfxw/irG8QV0reMjdS+pu0vzaRnGQYUnMaxVyrcw?=
 =?us-ascii?Q?Lt3KUed2JszjsbPaTv9IRUxogoXvwz3+d+wTaVoB0/OQr6RNHXtdg8+OmolX?=
 =?us-ascii?Q?rdKAKpDKC8BUr2P6qm+/bVvwtUgWX6SazKdYkArz/qeJo7OUNch+fwvtUpjs?=
 =?us-ascii?Q?4vnZhKBxknWKYTItfpwJDfSEMUmtJKe3w5XEvPz0r2dqlslCQ+X/7hOxfj1B?=
 =?us-ascii?Q?P1TyRcjC1L7r+Hq+1J6l6JjI5HqlzbLV17KJxoNjNbyLH/Fpdz1DOWpGVfCP?=
 =?us-ascii?Q?ZP8O2dBs3awv07vrnlx+0kLm/cMorjWzyg0vPqlaQtwhI3gV37XRNvTp2AqE?=
 =?us-ascii?Q?8yOFZNLzD7V6qzIInk4N7Ml1riRkpbg1/ewh31EPAZdlcRWTdLbPw7mtyuSw?=
 =?us-ascii?Q?MCZm4zRk7poVcMRcQRRc90u4Ph+ftxEsweq9CMjL9rg7NsXXuPby8O2ItgFN?=
 =?us-ascii?Q?Nz7nLpWYKhynMCVOjEqTlsR4k560OffvCTmg53Q7SMnYOTxtWZLgAjZ9kax5?=
 =?us-ascii?Q?UxXQen6O4kFe4KH1rT8R7S8TCwPHZGy4N3Nx6x+WeFHFc2xVjDhE+UBuziUx?=
 =?us-ascii?Q?yyK5CkXSfLBd8etROjfzS59RI2ay2eq9dgNLUyeX7/JdzR0izmhoZQvXbWwC?=
 =?us-ascii?Q?BU9lXviCJcNoKyCDpzNtdym55xdr78Az47PryMyasUp01sApsJYjnODmH6y8?=
 =?us-ascii?Q?pq/onkZV43FtJGv+0Qx2ClxkTJeq724UH74t/aENcbpfyV70HmXrm3gw9Irs?=
 =?us-ascii?Q?dM8goG0WIlFyivlHucNWyRevicK0nsqVGA7HFfO6SBMOA5f6IykzZsf7TOIk?=
 =?us-ascii?Q?CwzzL2XeJaYqqg9K9eiw2nHuVi2lDVi8do91W+8r7qyqVyr1TGxEabdMZIww?=
 =?us-ascii?Q?1MJT3pUdCYocw57UAqHBvLmZyIUFMhAvhEfQ4ctid2dMoBIg0dETmQ7zgdVk?=
 =?us-ascii?Q?DyhjLCr/1rCuUhaTqmDTR1c0gyiTEQlNMX5dx9rXMxNj2tWzO/ki2IFH6rgP?=
 =?us-ascii?Q?Xjsa14/8QesqytOX0eZFInb+6YJ/TrxzN4LgXkBCIjneVD53ctyLFEZOrLUY?=
 =?us-ascii?Q?WtVc6T+TdiTFWmw+zm7luUU=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770ef356-eb52-42e8-c82c-08dcc10a0d3b
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 11:20:09.6917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JURwem/LgupypA8aAbmU4TukZUQ1LKClojhoDUxNSr/0FifW/BsaK1OeznFzgcfUbv81YmDzDneFeoqcka5XiY391+j4Ni9yag+ykoWqLqaZq972/7D9stc8JrHfRDN4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0998

Add the dynamic resolution support for video "capture_raw" device.
Otherwise it will capture the wrong image data if the width is
not 1920.

Fixes: e080f339c80a ("media: staging: media: starfive: camss: Add capture driver")
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
Hi

v2 forgot to synchronous description with v1. Now send a new version 3.

Best Regards
Changhuang
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


