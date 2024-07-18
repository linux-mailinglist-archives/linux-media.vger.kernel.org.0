Return-Path: <linux-media+bounces-15113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE9393475B
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 07:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C03C91C217E0
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 05:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07387481A7;
	Thu, 18 Jul 2024 05:02:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2108.outbound.protection.partner.outlook.cn [139.219.146.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D871C41C7F;
	Thu, 18 Jul 2024 05:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721278976; cv=fail; b=cObrTrN+08PyLodqvmK0iNXeXUcDnSBtlypaOGoAykn6kcn94/yhoEsbQ3F6+gysVNSMxxzdhsQ+xv1iaeR83CMWyVOyUMOuGpdBH5VkSZRQYBLkrNym+JtbghI7AGI818rLm/AN7LgkYlTh6JYwM7oFR0q0og6GkdR928oPuHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721278976; c=relaxed/simple;
	bh=3ALIIwaquQs4Ms4Lp4N9MuFsYbjraB6dnxG6CEfEyF4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DQe3SrA0bva3DTgjry4qsXZzuhBK0CyL7NaGhzRk3CdV7QZvzBKkNyfUEvby3Nq4hO7J+GiV1U5R+KrWJW0HNoMP/Xb0kB3ofUnyxCQSaF54D1vnkEUdovXYYovc2aaGDsktwTQvILMnb1zMGgeBUbRX9CjOdktPw2a+ckKkFms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oM5Z+qbRJrCnTrm/QU989AJyEIeZ3b8PvqCWBfoTWbZ37no6m4USshcDCmCmBbuvczxw4DF5pEJ7x1zTbuL4Ps3c6d+mDSFbtQD9ABXZgtgNbFPPdA1KMjUdYLuV+Xx0d/I/xuwE0Z6GxfAMNBBLKe59NT85rPM+O35vN3Kbtu4S3Wp29vxNLWkve7Z7pKJXOQ9yTIxI6FEVh3ns3ZEo3NZneO8FcneaLqhLZwKp6tvaZ8g4IqX4PuwMs76HvrDnGIO0ub+R/PJ6ZFW6cEK7eRd+AsfTnXyKCKQLJphXg/4oIgQ4tJRTtAC5ulTsZiOsK8N3DbM3y7mqbaZrQIzfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51NUMLFUOslcX5PgbS299VUsPDMwW+amx2sRqAl03fQ=;
 b=EYa8I9l5oP50RqNgqXFgEH0t7lJtHCvfdBIJdPdwGilQ4R5zesNGStY5W5XTpc96CBHJ7pM+3wWHok+FclQ8lpo7ARza7YAMdME1G9mONXYNOnyPLNhFXZaG32RF3PKgQRsXFjlnyPON2vwyN7F/JDaPdc7DflUNLks1fcn93RBrdItuJ26e2oxsz/KkVdG3cs7v3a2qiK1qBEb4DINN4Zm4pNKoCYCNZMoMbSey4AjsV8mt9cI+LXJIl/Gj3NG/ozi7Dh3BmNzGeksd7O1gUPMMYOxDAHYVgSHerKP3N3J3sAcML7kxf11ZLjgsBwDc0adY5Q1ihaUTYT2zzlUdWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1046.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 18 Jul
 2024 03:28:47 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.044; Thu, 18 Jul 2024 03:28:47 +0000
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
Subject: [PATCH v2 5/5] staging: media: starfive: Add system PM support
Date: Wed, 17 Jul 2024 20:28:34 -0700
Message-Id: <20240718032834.53876-6-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 00fe384c-a902-4976-4716-08dca6d9bc1a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|41320700013|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	81rzuWjzaYgsvPdhEzC/RfB1iEE11XZKkurrP0Wsm9Wzo4Xj1EuW2H5opsraTBfncfvZjpX5Nyj5+8AmHzrG5SA8YZPo4gaLRR33QFCs1aZupqsGrp3xbvGOKcqx8TUN0qfj52GZmhMXGh6Ep/euaQpq+5RhCQ9yNlD6pAMblSmKpovlp1rp7wHNUpk14Xu/niK59eVph3KC2ru62f1g+W0GwwsW7ERgcYhEJ2l00WIjcz51b0Cdcz2x0eupE+FkyelV2FpnzxQsxrrQWPbj2coSvO/tfuPaB0qFPfngRolHD2FRNEjVW6FLZwAOWkW9Us2ZnQxensewbkmWH/Pu4kLBiovEiA4VOFsRD04aBQ1CN9/uqk8UVmM4hEHyq3oUkiiHqzSFOQWNXujV392Wn3blIriQNRlGTFja0nkdibxvdcAnc7jsiDE15heQVvbIqSpAvr6HcJU/1kuInV4BqPscFtieF9agwGdnDIkSP49l1eBWNgJG547bDAPkq3s97mYC062QZIz1f347UqgyKU9NwhcNgJGn6B+JwB3yptoZouob6qg4NoD71pwMmWAI7Uvm6XaAa3lBFBxk3Fx8Zit5OUmi2Juafg/Q5HME7P0SgAVDHa8gEHvzvoixv3aO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(41320700013)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?whqkQN7gAsT3TJ4u02KlUZy68hEDIsY2/+JxsmqX3gbtffwq8/WqC7DmGHPb?=
 =?us-ascii?Q?3BmB3n2jU1ljqOlW1PLFcMW6WkYvvKPIH9wYxuQDVuO8HndJEBy06ZMXpeec?=
 =?us-ascii?Q?mwqEcusfu9vWtMUvueK1OY+xyppVn41fsIL0n8Go7F+tOB5uQh0Uey+bkHhc?=
 =?us-ascii?Q?PGucRXCbLt98QfCPOXcwuup2p8V6kwLgX+JPutNU00PdAQR5j3Mot646ohg8?=
 =?us-ascii?Q?CrDZ+nuL1zyJ5waZQNcfaaokLE/23FGTJ93tRJJfZ1AoN1VsMqyGBQrrh74W?=
 =?us-ascii?Q?ONZ9j5iXKcmB8K0EBcBtZ6n5wFSlGWzLM+TDENUvPGMd0fUsSgtxH4lL4Qot?=
 =?us-ascii?Q?u5jYyvjYb9xGpcWw3Wu1fnqTWUxT3C0+b+jkfkBW/aBtz6uQpPu5LoCv5Clm?=
 =?us-ascii?Q?Wd172Js1amBvKWxphUz+ixufYh6S7JJzFPofeULZvk2+1UL3VfCzBGN0guOf?=
 =?us-ascii?Q?b45NtOITHByhj0w581YRjpE/7euPOfStPdO2TtE2zu51+oX+5pz5qxfYQgf+?=
 =?us-ascii?Q?ET9nO6KBiDeup0klf7RKDyumHWI2cPACLWH6MLGRuBsaJHMHAtvuhqXvhoUw?=
 =?us-ascii?Q?cbLx7GHNx4cmBYaUx4epDFHxI9eXvxJhg6vtgbFYxpWKBdyvVU49vpfozKNM?=
 =?us-ascii?Q?ULuT7PM3w/p+NKabS5i9zJZ4UxDRUr0v+LSYPitwSIY7TStZ43Po08yBzd4a?=
 =?us-ascii?Q?6QXwFM2ALuNbYVZMEoybRd5zRXbaOZAuKgfmdmvJAj0h85qL58m8ED9Fxx6F?=
 =?us-ascii?Q?oA7aBL4ziduKFDcwll0OhqkFymUPxPTub2g+riH4NrlExpcisM5vKU5TvJF4?=
 =?us-ascii?Q?uq00rTFFH46j9O/EpsMCZL2Is8B/7ldNO3roIX37co48FtMiLc6d+aTBOSs3?=
 =?us-ascii?Q?GZi5MwdFIoKhHrln6A0Vqcd4yBi6rSF9UyJq5dY5gNHV9VhCylzxTER/W1iU?=
 =?us-ascii?Q?qM3jvNABpIRydTkmhJQO7bMgznUWtrPVWu0/RHfRb69XSy9Qq25Q8MtzzWJ9?=
 =?us-ascii?Q?M0ex3fBig71yBJTvlpA8DIsjhRz7mVgxcYDfsR2RyyaHhw2Gg7vc/TCVstPo?=
 =?us-ascii?Q?XKE9nw7iRqg9q32iij2aNZ7im0wF/rIOl8sG+mUXAcj+cuvmCKPH5aLygXJp?=
 =?us-ascii?Q?WqYCfrrd6yGbkV8fSgYGufqN3mAo4BM3U1ZPEdoHYdbcQ/fCeZzQ1ggNZTPN?=
 =?us-ascii?Q?ynkF7/Kw23Ryo0DQeAUhUxqqdjC8to5m9NBxOREvWWjEuILRf7rcMhxfDpiR?=
 =?us-ascii?Q?FE1kkjhos+JryDsOySUG5/vILinjehpddbIKFpvB/1ntGA2srBAgiWcGHRmm?=
 =?us-ascii?Q?pN0WqYHhM3AdDHshrTUUMwbo2bgqG6domObPBnAXCu8xXO781OoHnhFJE8/c?=
 =?us-ascii?Q?PH5SwFp1+6FAvW0WE/GzAAKZWc4wF1U8fvIUhhoJqZ+3q5E08/U4hjMby9Yt?=
 =?us-ascii?Q?yrcGnbMlaRZgGFhroytIK5W4+fU7o4GQFkS/zVY77XZsPKhRiGD0Y1bz2WJU?=
 =?us-ascii?Q?vwwuQtRYkUuXl26rjujtitTksnFRcmApDTKaqsAL8Z3QmipU6GnWP6fdseTc?=
 =?us-ascii?Q?Lc9fvAEGYdI1UPN5S6cl+fIyOxuE1HH8LXBpfUlnFV+zaedd6db58r9Z6N/r?=
 =?us-ascii?Q?8tsKHbJ60ZHFEBmc+Pr1FrI=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00fe384c-a902-4976-4716-08dca6d9bc1a
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 03:28:47.4993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTMJcpFQyHjwPh5ob1ouEaAME9wa6NN544I0QKOECbZArCdjwzxe8z0W6n+WID4caOcEoqmlLvOt/N/zgR2vwfkMtTTv34JCrG8bHhU6gMwmyG1wuMmVRE1A9aJXwthr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1046

This patch implements system suspend and system resume operation for
StarFive Camera Subsystem. It supports hibernation during streaming
and restarts streaming at system resume time.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../staging/media/starfive/camss/stf-camss.c  | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/staging/media/starfive/camss/stf-camss.c b/drivers/staging/media/starfive/camss/stf-camss.c
index fecd3e67c7a1..8dcd35aef69d 100644
--- a/drivers/staging/media/starfive/camss/stf-camss.c
+++ b/drivers/staging/media/starfive/camss/stf-camss.c
@@ -416,10 +416,59 @@ static int __maybe_unused stfcamss_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused stfcamss_suspend(struct device *dev)
+{
+	struct stfcamss *stfcamss = dev_get_drvdata(dev);
+	struct stfcamss_video *video;
+	unsigned int i;
+
+	for (i = 0; i < STF_CAPTURE_NUM; ++i) {
+		video = &stfcamss->captures[i].video;
+		if (video->vb2_q.streaming) {
+			video->ops->stop_streaming(video);
+			video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
+		}
+	}
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static int __maybe_unused stfcamss_resume(struct device *dev)
+{
+	struct stfcamss *stfcamss = dev_get_drvdata(dev);
+	struct stf_isp_dev *isp_dev = &stfcamss->isp_dev;
+	struct v4l2_subdev_state *sd_state;
+	struct stfcamss_video *video;
+	unsigned int i;
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to resume\n");
+		return ret;
+	}
+
+	sd_state = v4l2_subdev_lock_and_get_active_state(&isp_dev->subdev);
+
+	if (isp_dev->streaming)
+		stf_isp_stream_on(isp_dev, sd_state);
+
+	v4l2_subdev_unlock_state(sd_state);
+
+	for (i = 0; i < STF_CAPTURE_NUM; ++i) {
+		video = &stfcamss->captures[i].video;
+		if (video->vb2_q.streaming)
+			video->ops->start_streaming(video);
+	}
+
+	return 0;
+}
+
 static const struct dev_pm_ops stfcamss_pm_ops = {
 	SET_RUNTIME_PM_OPS(stfcamss_runtime_suspend,
 			   stfcamss_runtime_resume,
 			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(stfcamss_suspend, stfcamss_resume)
 };
 
 static struct platform_driver stfcamss_driver = {
-- 
2.25.1


