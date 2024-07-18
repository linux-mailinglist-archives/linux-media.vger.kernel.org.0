Return-Path: <linux-media+bounces-15111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E92934702
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 06:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABB8328151D
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 04:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5903A267;
	Thu, 18 Jul 2024 04:01:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2110.outbound.protection.partner.outlook.cn [139.219.146.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8035328366;
	Thu, 18 Jul 2024 04:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721275276; cv=fail; b=VSvu1Zeau73OORuk5tNFLSmKEyJrinJvxbP3KHXls/Ev6ZPV6H7nG18pwDn+2c3HchW7HvOS183E8BZlUCrocd7LQ/Yysd/UsIALfIPVb6LtYIXhU4+HGc4aiwi2RzQFCA9TgQdeIeMQX1EYzkO5DzWoyeWmAtMhBKD9qeUfOsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721275276; c=relaxed/simple;
	bh=oHnhrOBFfd6JOM6QcOedN0vteZsv7jxNwPs0DqzJqYk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QLsfbKH971hSsNzg71BgTW5ktvJGvzHq69gnubqdQKUfFxxHBPVZqXc8vkOUXTtnuSV+sWiJ6c+EPdF7zykv3FuU5R9n2Cf3vGty9IDbhUZabNGi6bsnD3C43NxLKELXtJIwLNO+39IT9xRuZHRUlmbw7s5kueIpZpttete2B5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dK0Vw7z4H3ciAbovjqO4Ohd73kkcdlJNTQAnAkjC1pS4EF7aMxi4dTzHUck0KZ0i4yt6pPYYUTEojnzmS1THlN0F4I2G3UDhZFMozgjj7CB2SGPYgSGEMcZNG1Xt6AGVj3lv/hhdhjh+NUF14pWJb0Sz7jyKyPck/hflhdHDxRM9pmKt6wNHd4buBkEl0kJRDQ8y3DkhJ+xNxh/+VjI0pef2EfkRCWAjZcshk8LzTPhttrX0LIoXS4aw3E2Lspk7AcFlCdp5NHaDj8+eliBiJ8SYaw1/wMAjRtc/EeGo+7bpkqCo1FITeBvWIbUANCHmLiIv16duJLrvQjcW25eHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSrFOBGfbgCUI+unAuWZ1XrSPb4kJg5v+m4cXld/C+Y=;
 b=C4a0OrAkKNN78HRrLMJ2xcGPoAxRMGA0lvArLqQUrrSoS1vXXcj/Nv8T4uURgriLUBAIQxOyICK3PcQphPFfoNx31ndoPAmISOTlctm08GPhGtBTLGQ5LeWsVBw1fcBDN22eqrpGa9ZMY3vJMGpUDFxNa5Kd07Tm21zUsjQAkgzALa2MTDDVeA2N3BlQYeEjUXUL/Xw4VlYaMPIfMxAdDP/Y1ICHZS/Us7CaN1jySOGkeKHncBP7+7M7O9DASEhRWrl9+nZV/KcijRvf4sLcxDqTciAUBBSqvh9ToOFG9EyPSl4HpMLec06+o9Q771sOk2lE1Hk4ts9X6oobgLdZvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1046.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 18 Jul
 2024 03:28:46 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.044; Thu, 18 Jul 2024 03:28:46 +0000
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
Subject: [PATCH v2 4/5] staging: media: starfive: Introduce streaming for ISP subdev
Date: Wed, 17 Jul 2024 20:28:33 -0700
Message-Id: <20240718032834.53876-5-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7d7bde85-deb8-44a2-178a-08dca6d9bb62
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|41320700013|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	0DY95Jjqulq8K+xVvx7pxwCNxq+0X1LrpKxMWOeoVU+HkmqIBW09Q2XXgVl3moH2hn7XS5NfoyWDSe7cLroRv5sE3SYQVRbXAlAu/OP8u/Jvnj1dbrlyLmVIWgYDcBN7pUXfrk6/1LJ/Mx1vBRtHpRjnYDO5sp4Mknkn6xeNeUobM+7//XkwXUGgzl4UqeAbx77NCyyvdX/Z9Dpb4rQXX5soo6XbFN/VDGb2J6UPf3qy3qYoEwt4nMYL0yMaoY5TdKSKtE7nIQq9Lw/qBgaOm/praxDkUUX8D0bBpREyFhvk09UnNqV1SnscIUIKHRN6xYNpGI91vK56s3il51oWU3baDKpWp6uY7dWstRlFKPsKRlQin0bhZSCxyO5G1+Ttr6eMY3dim6bHJGAJmJzFY4T6vW9ssFZncv0VQrnx3i1tk0kMn3lIQmLOLQwQk7Tz6cD+1oiWV6O2GkWFb2ZP7bN7SuumjLaX24vGrZsEz/ypDMVVF4itJZc8xmDDXa7mpxJa3UzCbxAhAdH9LSF2SrjNe+eBaggEd2lB0m5CHaDLjgRLgtnFvSSGBip2BkLm+di3KdGmq9qRf6QAPeerXmHdDCSbOuaYRKwwKP6O1EYA+m1a9wp9y3zCPeYnbyRs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(41320700013)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?negYN2tdQppCtqr8/Fa7xKaGjbVz5THdkotyGK92F4uPcUI8UzCRLy6Xx1Uu?=
 =?us-ascii?Q?AJcAMfYPMJRmUCqNcGsBqwpvQX6ghcSktD7g3v0U7835hPmd+4mIamPecVgl?=
 =?us-ascii?Q?SNabiB9C9BjUocptcT/UipOfqCfl3x3l3k/avy5869k9Z7jLAbOIXkGbl0c1?=
 =?us-ascii?Q?EPzfm2vetAqn/XmO0wjMA8A2HNTJ33Q6VOAsArmmaHAMPDgWC9vIFLTZvWmV?=
 =?us-ascii?Q?FbC6jTQbjQxtFDbKKsZXpbx527yzVjl2AUyPNigasVX4WdxtSHTdWypiGKBZ?=
 =?us-ascii?Q?ZCuwrw5rPXroA/AJVAVSWDJtZ1hevtoQkl+JTUOAfaO13rIQEKlpovMORwAm?=
 =?us-ascii?Q?1P7YDXsgYar6ouYkARHlgVv2Ypfuzs2yx9EueTWTDt3acx6/Vy2QMNgMDPMx?=
 =?us-ascii?Q?Rwvh4B4pVLg3tVd0wUd2kzG4wZphL35Cxug5Rbzwu0DZhJyETuXbLV6oG474?=
 =?us-ascii?Q?V5ojnDyON2+kf2hL358IrlUu1SPp48mvRg3e3vGOBBqnYM8OzsQfllCSnMAJ?=
 =?us-ascii?Q?3ktPfe2f4BwVkfmeJ6KpSGcelX+sIKU00siIRJTIXpvmZhlbYJAO8CYsH/FJ?=
 =?us-ascii?Q?Gej6x2q5Qo9BKYdNOEFsLoVry62DUBYVvIGIhQ5GJYtvcX42nfD1juTJW6GH?=
 =?us-ascii?Q?U00JWo4d9y++PpxsIyiOruBQWN6xjfHuX+d9hqUda0WUUqoVckQhGneArdMi?=
 =?us-ascii?Q?Vpp4va3m1kzdcfTz+XQxxddNBUQNkPLNEDf3jip7ADVG7EYkE9P2rEdUSbFw?=
 =?us-ascii?Q?ghogrP/xx07JQuKGy2G3CkTeOC/9QGY8RUzYT66l0eS3L8QPpgPejs0wYmln?=
 =?us-ascii?Q?Yw+FSvnSCrsskDpjRURKdL9GjV4lfiRiT0gbvlAMKQKQ/j68TQolM5a1iRrE?=
 =?us-ascii?Q?p//GXu1Z6bq5CfFrlKd7brqzkFpxeS1B1O4sWRnDHFKqx/Ub0TtlGdvwE18F?=
 =?us-ascii?Q?lNro8Bzr29mNsU7N0XIr1FMr0BeMswkRHhKWuETvoNHYgpRwTAjYcUgsc6It?=
 =?us-ascii?Q?fOaqdCiQk00BnQG1scFaD/cRruBXcBYwQXFbhZ6aLOj08nxaDaV6Rfc+IfO7?=
 =?us-ascii?Q?gfRrITlw1aCzxrOkYOONK/TcazlIS8lntEI0NkTEjQsihHMAO11+1El74cF/?=
 =?us-ascii?Q?SUrilkDnetfNc3qqk78R3oYaEiQPnO0arSlfd8vQ8ldaXmzRTUwIPzqebAGU?=
 =?us-ascii?Q?ixTxFyM+oS6sUhYV3LsJSeQhqYZmo+WMNQSqYPlU2GouA7jP8PJ1CqXXvbOr?=
 =?us-ascii?Q?H42MsZKGZ27ycJAKNhvmBTq8fQt/lFyYM0P0VZeVnPbzA47TsVd5xHndNLHF?=
 =?us-ascii?Q?w8SrzKxwBD8N0nbFSkoQGDk526y2jOg31DIQ3LixgiD778g2FaOKX7dxtNbQ?=
 =?us-ascii?Q?8Llh8OGZiPh2D3fwyZfQcyx9LNPlKDaVMfi0KQU2TcFTdZL9ZE3d5TzzVS55?=
 =?us-ascii?Q?7ggCDKcGASKLkMELDT6EiWj9qbwl/5TaCk2Bjdpgc+JahnuGrc5NalnVFHv9?=
 =?us-ascii?Q?P0W9yOOLjWNHCWyxUx8+8UvmvOtwQBz7OUAz1UwOsnR62LUf3ZZyvQ1ZYQcy?=
 =?us-ascii?Q?INitey6t0EEsdVm6yI5tVjf5JkjILnjTA770aKSQ3UYfyr8LdmkNGpY4hHlb?=
 =?us-ascii?Q?ApEjSGuUbI4hTyMLurErs3o=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7bde85-deb8-44a2-178a-08dca6d9bb62
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 03:28:46.2403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfV9cMm0sUR5zwLt5ZD4JvkF9xuhSYd+6ZQ7sI9x0QlpcZSYl9l2DgVGG05ZWfGL6KpN2xCtB/qbdf4XhaA/kOquAlI0Y7tmoZ/3Dx6BRSTg8zhPMtQ7rPj75R6NVw+x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1046

Use "streaming" to indicate whether the ISP is in the streaming state.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/staging/media/starfive/camss/stf-isp.c | 6 +++++-
 drivers/staging/media/starfive/camss/stf-isp.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/starfive/camss/stf-isp.c b/drivers/staging/media/starfive/camss/stf-isp.c
index 8c6388edf049..d71b95ebd3d3 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.c
+++ b/drivers/staging/media/starfive/camss/stf-isp.c
@@ -77,8 +77,12 @@ static int isp_set_stream(struct v4l2_subdev *sd, int enable)
 
 	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	if (enable)
+	if (enable) {
+		isp_dev->streaming = true;
 		stf_isp_stream_on(isp_dev, sd_state);
+	} else {
+		isp_dev->streaming = false;
+	}
 
 	v4l2_subdev_call(isp_dev->source_subdev, video, s_stream, enable);
 
diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/staging/media/starfive/camss/stf-isp.h
index 1a3e8cf7859c..85ca1c210639 100644
--- a/drivers/staging/media/starfive/camss/stf-isp.h
+++ b/drivers/staging/media/starfive/camss/stf-isp.h
@@ -414,6 +414,7 @@ struct stf_isp_dev {
 	unsigned int nformats;
 	struct v4l2_subdev *source_subdev;
 	const struct stf_isp_format *current_fmt;
+	bool streaming;
 };
 
 int stf_isp_reset(struct stf_isp_dev *isp_dev);
-- 
2.25.1


