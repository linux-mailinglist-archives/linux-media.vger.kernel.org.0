Return-Path: <linux-media+bounces-15110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A392C934700
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 06:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4715B21634
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 04:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1B828DB3;
	Thu, 18 Jul 2024 04:00:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2135.outbound.protection.partner.outlook.cn [139.219.146.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC2629A1;
	Thu, 18 Jul 2024 04:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721275248; cv=fail; b=UvRZNOBbVbnVz/s/K2jSsWujyNoq4Yx3xTe2wAZHFcxBAYuuermlTrrilmUS4KhfsAecQeiAecQx/PLYNfjZp8gRhD973lanoDyujTXWzAQVrcACYPooRdP5EpeyQE+6IyWpoW3mYQKiJdT+xw7nHp+MT0bWucRBv4u5BhR16CQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721275248; c=relaxed/simple;
	bh=HIciiOD7hp+BcewcEPvoUXiLMrTywFcCkDf5a9hIbB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nMsOLAELOZJGknEJGsMaiC8kJ0aAyVXaxmv3ofuuQ8z6HAZQ/dVk12X/52vP4v8uO/nOgbPNy1bkthxlBXWWLspr/F6a8kvx01X8yUTMM/0KjPsJg4ftW4I7sW9ipOPOYlVPbyUHWl03Lo9MnKGkXl8ZN68bGO3DS7XzcLoiAtk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNJ86a/Jt/IuZn91ThTDLLz3dkLn6rWFvQS/DIhYvu0NACMsavb1YJL7iGUy1oQnvoxstbm77B/+EYf8EPgibpp/c+dlxdLijcyo3UCYHkJnQYhi9fWfALdVVSK6CuurtDXk6kWaPTCP8lRLyyiO5E/t2GezoZrU83eX7K6B69gSCxC9EjDGZCmdFDxuNin/iPEAF8Zur031tNy2FdnQGftb5d7A3lHuhgipQafKrakfmF6S8LM+6wlymPsz5QADguLA4gqvIkgqqwgevWgCPcAbRf1OQOsv82cAw+2CECb6PUog37IZHUwyuI07HAeO85hf0B4ayv4AlGHP3arTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddjJ1l1tFX8PlnZ2moNGBlgsm9lxfZM595j++Kw0u+0=;
 b=cl1PrjrbKCkQgbhxGAWbkjlT+q7AEMbyOMsaRyXOjx7VRwYWWVHlHCXYo1P0BUoMErnUuj5E3b9ycFrZpn7xGjOYQbV4WtXhOv0fMhqBp61VMkuaJOAue72EBalxbfGpxRIKr23yr8+NBQfwmHiAJZPy2TicxnstWweGfOj8Tnk9SaLK8f19SzHw/Cope8TSH8JJJr12a5eUeq3Axt1YwjKX6blZfN0UzKVBJ8PRO4nEvK5ZH5khco3q4ejHx2nHVHK9zIw56iFv9NRzMknN5TilfHPeZhRcn0oIm4Y32u4hSTCmpnksM2p3lJljcz55wiibuvdQFOAP65kz3iADvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1046.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 18 Jul
 2024 03:28:43 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.044; Thu, 18 Jul 2024 03:28:43 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Jayshri Pawar <jpawar@cadence.com>,
	Jai Luthra <j-luthra@ti.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 2/5] media: cadence: csi2rx: Add system PM support
Date: Wed, 17 Jul 2024 20:28:31 -0700
Message-Id: <20240718032834.53876-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
References: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::14) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1046:EE_
X-MS-Office365-Filtering-Correlation-Id: 663452da-dd46-45c4-2f21-08dca6d9b9ee
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|41320700013|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	22rUrY8pge3un0ZLhD/DEC+rrotOWbE9Z7hBWCV1etkEDnH5M9L1Kwi2qbbQqcSpBSKnbGFkMjHyyyWvKwoseE09Ms23rOe6OgmT1x5KO9X/Odu5FN/zokFllX8YH1f1vNIhttf8TVRF4afFUE7qsmq/o4rwS9HQo9MY0c0QE+5bKgYpVmWsiTqI1ybljdYgV+P7Im/BhLIQVsvn1Qxjrrpa3upuLMv8uU6L/Bejnu/RVNwKJuFKTRn5aPKdkh9S+X1VCr80D1JYfCiM5MlFlLROrwCKOxgZ54BEOYIbHhr+0L91yAqKA+dmHNUfUYy8xQIv8pcZBE12n+dbOiOwni+0fnEtqHbmCriSXdQukgtx/5LWlpQKyz1W7eaq/dEw2d+lqBqfxqErWwq4mrvYysxMHQocik9W5fNqchn4FcrrLkEJheTh1YIRCnIZBkDxERgMuATuXe5gbuomXqkc6VRdEoBFmkIaokHkk3t4UxejQIHmMKvBdOm0dOVRRYySl7bDBRoeQxwLBBkAn0WS1c8NfF2ZS7fXBT3P0XwOxe+b1yNA/aR6uYSxr7FMO3tUQ0EIxytY4TGD9MnJPHI38Pf4hOP3Fybg22POKybL4pokn2VHwDgDuvZX4NqwddWT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(41320700013)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c1fLn69RH4ctQ2zN6ymZcr1KmXj+8BNld91YohbDwEnmeKpZZ+WF7GFp7wrc?=
 =?us-ascii?Q?xImwR/HBMzyFslwiveO8wOb8ODtvHwzj3eT3eyQjNvWmDL7LFxtlwxf8v7LO?=
 =?us-ascii?Q?r1QGTsw4+kCz6RvDa9tWV4hVKjUCX4IK13nOQOxoylJNzjP0xdlSf+mSBvIE?=
 =?us-ascii?Q?tt9nHLcPuMYsso5YlXLb7E5sZZtbizhg4vobx60pbIwp6bOZoijuX9CaInRO?=
 =?us-ascii?Q?6N+k4JIsEZgSHaPoEiBV2d0JctazPf0zS2d0cp2ORdEwqHt3x1xpJLJMZNdu?=
 =?us-ascii?Q?I8ipF9NiDnhd8WAR3C0ygHOfcUwtk5NSwCxceDIEPI68WVY1QrwTxZx7hr3P?=
 =?us-ascii?Q?em5qfgsiZ5ddvcsAN5BZObOFvEdRjfOainUKOiw5q+z1wFDl00GzEGl/bhIR?=
 =?us-ascii?Q?sLg73UQelRYfuKzHvQnHQ7Sdvgh0IrViatpAAHx3LA5aR6DcajRMWXD2YBg0?=
 =?us-ascii?Q?EoVNjKoDnnmUbwxc4VcBlW81qnkiFqm+lCz9NJ8o2guTxHT90ds5kYtdx3nb?=
 =?us-ascii?Q?4L2vCgR5VJiM/ky44E6DlrAB78MrAOfQTyRS7kTPF8BERM2mY1Fg/sYeZuUD?=
 =?us-ascii?Q?lq9NV9+EVHpru+zVBvVXD3DlbvNke1MIRLT2CtGWorzXk9zo5MO9KBqDSk1d?=
 =?us-ascii?Q?Ex+HDz91/xRNXuUy81ROE093U/8LM+cc9TJ0npyTmsiDPY319ELHOndSDFBc?=
 =?us-ascii?Q?BocQa9dQQYUXrYVvuN48WpM4RTBA07faO/HZzGiQkUptTVA6mN2ev0toFsnT?=
 =?us-ascii?Q?UXTnRlOaufyNPUjbxa22rMBpLDoOa+HTGmJFBPuzilyYuaGXpad+ATTMwmlL?=
 =?us-ascii?Q?rxYyFV9FP+5Aw52CFdjcsCEvHXQg3wbBkCZo9N2/tkabSYNh6P2RL5u9sL7A?=
 =?us-ascii?Q?SfRcEi2UPbF5XnM65vjcpJEYW1QnCjamoNG5fRT0yDRnMutCrIux+/vVHEZf?=
 =?us-ascii?Q?75uV7OnPsIetI5tq3TxvEtSy+gDNa3b4r/M8O0xsyedHMkCgC0XzdTNBr2/A?=
 =?us-ascii?Q?r+5byDG69biDjCTiY/+iNQMcBOV18hW+9HRuZt+sPnQodNGLERc1tX8FLC81?=
 =?us-ascii?Q?NtCCYxtqMVu11VVZLZ+dfKV9ASH1PuM5AIn37YAnABTPv95tGgOKObVNSwMt?=
 =?us-ascii?Q?NfUI25OTleWLODGtT7l8ITAlLkF2WH/3n7VcstOnS2si+EDJo8pj6ZrqohpF?=
 =?us-ascii?Q?kQwlIs+BVPQWG44u/+i4VITOYhPmY7axu/t6sZkuixoi35ZsfWScauAs7fty?=
 =?us-ascii?Q?USGXw+jOwN/Z1u8esCEWr9/WsW9QWNGRh7lRYHRjcOnCNYlHjuuCyImpHB9C?=
 =?us-ascii?Q?M4cSBu0S2WFUqGbz5RZfRQZrz6+wR6hY+fFcBujk8wLsl3s9IrXJ8eDNQW3h?=
 =?us-ascii?Q?6obE8V0HcWNaswOrGbpv5egNl6M2UUQKwy0m+H9PBTGEOM6oLtk9sU/iIrsS?=
 =?us-ascii?Q?pzVHnclUpjIcTLOSh+NduzODl7QSmRP7wxbHLZRm7IFkq3GA2qABPtiSLVKs?=
 =?us-ascii?Q?P8c8UPWK9qIvqTSbzgxp8PNGsoE6zC01y+y2LBfuU06VcRv5PrnOC4kSFnsg?=
 =?us-ascii?Q?xgQrU3gZso0icJW1KLGwS3G2k+8Dq9tRKIiGOVLevzKpmvqPq5MrhNx4aq+M?=
 =?us-ascii?Q?FOhHmTiQDoNqgyHiTtWqCaU=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663452da-dd46-45c4-2f21-08dca6d9b9ee
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 03:28:43.8229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: extmWOJYAqiEGvwmT9V7o0UfbyUNC2LG9kKdxj/l4FzhvuepXRZUiak251y23Pb432d7vxur/rF4jXuphQijLyUTSvXYbqqxwBVtr12uE5jdR0JfyTqK78f5YZECtzam
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1046

Add system PM support make it stopping streaming at system suspend time,
and restarting streaming at system resume time.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 981819adbb3a..81e90b31e9f8 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -776,8 +776,40 @@ static int csi2rx_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int __maybe_unused csi2rx_suspend(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+
+	mutex_lock(&csi2rx->lock);
+	if (csi2rx->count)
+		csi2rx_stop(csi2rx);
+	mutex_unlock(&csi2rx->lock);
+
+	pm_runtime_force_suspend(dev);
+
+	return 0;
+}
+
+static int __maybe_unused csi2rx_resume(struct device *dev)
+{
+	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	mutex_lock(&csi2rx->lock);
+	if (csi2rx->count)
+		csi2rx_start(csi2rx);
+	mutex_unlock(&csi2rx->lock);
+
+	return 0;
+}
+
 static const struct dev_pm_ops csi2rx_pm_ops = {
 	SET_RUNTIME_PM_OPS(csi2rx_runtime_suspend, csi2rx_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(csi2rx_suspend, csi2rx_resume)
 };
 
 static const struct of_device_id csi2rx_of_table[] = {
-- 
2.25.1


