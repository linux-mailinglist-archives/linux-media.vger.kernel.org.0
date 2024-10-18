Return-Path: <linux-media+bounces-19821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9161B9A3466
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CCE3285296
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A37C185B69;
	Fri, 18 Oct 2024 05:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mPl83Yf1"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BEA185B5F;
	Fri, 18 Oct 2024 05:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230343; cv=fail; b=CBUZX0M3WrATrcg0I2GZs6KPHbEK3XmnYf64mK6WynaxY/jn+BkNxSdq+GJdIrjV2U77z0/bJunpLNTu9yKXStI4v1oQDzIYc+P46gNEKmB66Pjh9gXMAHxZfuB0xRuo/4ABjr5hEp+kO+cyjcj9aDmbyOW2ujZtynhFXbMKflQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230343; c=relaxed/simple;
	bh=Jq8lblQML35Dds+bnO5KgLfE+H+HlP4a7EFb9RLK4SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t4Lf16tvE9bANa7biP2zBAwwwOXuTWV9GfQQBJ6+xH+6/U0iaedhHskY9L3BEiJsQFEa+7hqu8xZrRdGDAi/LbUPI7pWamUqe5O2ZaM62equ6A4JOc6vMFUc8rfr6xf52Mnsf5E2gW35EfkeSP6Sl5FU7x9kLNLR/tbzcuWB0+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mPl83Yf1; arc=fail smtp.client-ip=40.107.22.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrFGuIVEdC+OYJ0OedE9mYd2JEEbohXxlyhnDDP/TdBz9oV+hQADXhh6qFONC2oFpAC+G8ba+aTtc99Z351mU/q7GQp72OnCFW/9ZlN4rff8w3mtBIpMsPZ1Seew/VFGRnZC1m1CA/A3jJHhSS24mAiBLA/ee/fydmhJuCA5E2s+WLeIFKqcLyOYs/08LX/T6E3lUkXXNtXPahnrSSNz2lviAdW7iNCSzC3xpA4fStM6sj4rJoK7dgiY8YDANYzHkWTShDLtOr72Ib1h8cQ4tAQ1gWjqR4pKRJn0GHsZvKMpLz9RS4r7DLgHchEYzkfZwGIXkxOhirQYN0MtizYf6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvsynQF8VVK71701sFf8HsCW6S8mbO1IdG3lm0npjo0=;
 b=EIbtyJT03uQ5PXZdtdWJjm952n+15FZLAN1kYS6VkKGmWdMWyazHRSFUkQ0EJjIg+CYaY2AIBrVN/vAZ8HiOwkaeCUkcR8CC6VtUFw1qIGQ8dcivEfVo/YYPwrFdxzWh7EnMNWP3zNfoepo2WC7FbxEhObI8AcorS3TqTqmTCRqWvxmgyYZHz2nonZwxqegokhSfyc1aevL8QnN7x4w9qJHR4Nypv3AAgTDVjAy3exvKJhoJnePJeNgcvf8bFVTyWByp692F1YL+FdnCqnbzv47n4/WYp87iORbEl8Ghl7l3gqDkNt3ikGjWn6bL+2NIUkedns6iJjwMa4itwwS4gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvsynQF8VVK71701sFf8HsCW6S8mbO1IdG3lm0npjo0=;
 b=mPl83Yf1ggQio5xzzskoAgjW8xZkok4QwWBhv2TboMMn9gtwTnX5j19OyvjlpI7Riv9GtorMW95pfKFcfrHeXJLTfsjp3Fc+xrQvOYn5qhBIF2dl9Fhd9cX2iyUMjpiFpEzEhWS6UcSoZRgh0dOrpELH+zK8fQmvgUY1o+wC59XQGWgmpZVMU01fbjMW7itc8yVWCABzVrPeJBJZblZCZ0hwEP18Gt2tp++4U4rxIjYpbjT9Y3ZWvOMMsOvxj1m8I+2PrB5F6XZiH85PvGejn+Cc9aE026nOT/Ytpthw8vU6d0/ZL07M7MkxL6CLiOg2WY88QgUiN8I+a6EJbSfABg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 05:45:37 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 05:45:37 +0000
From: Ming Qian <ming.qian@nxp.com>
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
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v2 3/6] media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
Date: Fri, 18 Oct 2024 14:44:45 +0900
Message-ID: <20241018054448.3190423-4-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241018054448.3190423-1-ming.qian@nxp.com>
References: <20241018054448.3190423-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VE1PR04MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecd1ea8-92c5-44a5-dffc-08dcef38176a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TDMmkpsVgtbHcCMcIylpmilDho8QDl+dM5ldEfXniELPM0kipGCay8bCy6Ks?=
 =?us-ascii?Q?XpKjiHc3ZyKo1BMSnlDXboB4n60cL9Y130wO5SoyVIDb66GMBvk3XGBdIUAX?=
 =?us-ascii?Q?NMgFDmL4bi3EQi+zHAmj9HFizQlrSufQIN+5S2I8xQx4IN46bfrr8CNV2iFu?=
 =?us-ascii?Q?rUmjC6GZaBvQ03GYTR+pDNj435GgCK7LzgZYcGxHtojQ9OuJfKaNpeSXLiPn?=
 =?us-ascii?Q?vwAXWKocTftyK6HDEQVoyZG/al/wXJdIjo09y24zrFyXZKV2iCHx0QyVoqrQ?=
 =?us-ascii?Q?RAFPNJJsKZTCvBPXu5BmjUgAToz/cRVQzTS7Gc2k+kKoLft3+IXppcEM8aRX?=
 =?us-ascii?Q?80iuKY9FzS17GaxNRiydo3pNPQbhyC2fx5g3lGd2DCadt3aPUIyzW2x+awNa?=
 =?us-ascii?Q?WFCil8d74ce4IM2ZcU7Nya+yfvySqhXLHEJ+2teuPB9D7obozvymm2DpwiG1?=
 =?us-ascii?Q?ocmBJ/Z1IWVKcWpRoKn2ktfu4JCPj/xbEtz+qSO9QSOqyaLxOZkxo9O6xknZ?=
 =?us-ascii?Q?Las4Q9zCaxXwzq3VQNkxSIZo6KgeuFAzAGgpalMRUbzOW7jbQTNOLt9mMJSc?=
 =?us-ascii?Q?aKYevMZsS9U+tl14AIw+IYhgR5rZLOSMxbGTiZ5tdmJCgV7pZxJ7nAaw6QbJ?=
 =?us-ascii?Q?/dQA4x7+tZiuUavRgEC1vkRXWn380fOTibFNvdQBxKe4zHmi9f6sp9+6RcY2?=
 =?us-ascii?Q?rAbOcSoWR86srcjKGIkgrq1HEV1G6z7+zk5Z1qTw9w44myqQE2xH8VDm1eBX?=
 =?us-ascii?Q?NKIpG1ZO2MxYgKm4qOZyMof/2CgYCP1uyDRlj7mkjmuz1CMSpDocWeMy+RcD?=
 =?us-ascii?Q?YgFLN+WRnx4gZ4qv/eLBBeVtJ86rTW9L7RB3KGoRPEEr+nTcScaVD0HspZmd?=
 =?us-ascii?Q?bDDiGHSfVCSOP28YszHTGQ9OnfP8e3HLE1gkpUBubCkYtakpmVWqTIj76kCV?=
 =?us-ascii?Q?mLfgCBG/o5NzIxQo2zKoouZ4CX+39/dc/sgEOGqPIN0vltIA7PVbAt3ixbX9?=
 =?us-ascii?Q?u8eRTnkMYQn7hwuQtya5TLKHk4GsuBd1fkP58RWop/hImfxPjF37/EsRpt7D?=
 =?us-ascii?Q?4YD53zt53VJSTcRWmwxR2BboI0ogf7wGWe7qtVs4b7uYDYB/6THioS2YOg5+?=
 =?us-ascii?Q?3D0lULP2vf6RoOs8i7+Gwwypv8SqEWk7B9inTWVz2UaSDaWo7CM0kUyaQYJq?=
 =?us-ascii?Q?bJCGyIbKWecwNVt+FX+MxPSLSGAQJ/AAFGmtXu3rXXd0gJDn5Us0Aeuy61KI?=
 =?us-ascii?Q?edhRlgrFwovoU1LANhCnRoqjjArLZ87Ia3YthxNelWoDN3pc7IRQF+yQHZQZ?=
 =?us-ascii?Q?je/dvO+586vmOCn1wM/1HEHVauzb4ILTvdEXfmrrTim5ET/VT/Ien4thJjNF?=
 =?us-ascii?Q?1x72qMY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0+/THK0xsFlTQcX1U5yR+Vpl1qHSRjCTePUoXic/a3fplQRKNtkht+3kYcub?=
 =?us-ascii?Q?ck9peQstRTu4FMjf1O2UeXlgPaSphnzXgbzZDZwCRZExOgdjr7IUr57eHnoy?=
 =?us-ascii?Q?iKi5TEMJFEYuNRTHA0/n7xKbHFlAvJefJruN6F4UUvN/7I1ZQMH/pN3C9o0E?=
 =?us-ascii?Q?sPSXuzAaIyYoL1CILVhiWxhe1EMxGbgsS5aUBxoWIYuWYARvYa1aFN2ttrV5?=
 =?us-ascii?Q?zy6DdxE5oErKgNlpxO5GRrUsxZybnO2Harm8Qp99mRuW8PZYRB5uv0XO5sAf?=
 =?us-ascii?Q?wObmtpyCWc+QRO0wq121hWNIfQYln46hcpinA/j5zuzWFkYrsrkMtEH32HSZ?=
 =?us-ascii?Q?cBWOC9eqEtATXuL7DVo7JXePs1TRSOdQLyz93cTz5uqqkjEMyE3ru45IbKGD?=
 =?us-ascii?Q?ZRPa6fDqRh9+EqPaBh+XtPJ4wQocZPp+I05XiuENJJOzAG6mK5u6La4cDCew?=
 =?us-ascii?Q?59cFMJRffyFg9637FExwSYI8LGfNAkvv5epXbrAu5WLexueF+/g0ybN2X6js?=
 =?us-ascii?Q?a5rUnbfi6OhmAOkO5q+HBpyNI2xDI9azhM1gZ9UZG+Y8lN9PPU8kcQt3JyRc?=
 =?us-ascii?Q?5N3D++/GAZr33ZNqP6cYJN4dXiO5xLNPuFYcmdbwLtNSOei7DY2yRwQtrCHp?=
 =?us-ascii?Q?FxHW2HqJv8DaV3OXHVAy64Oy6ctDt/j5pi/CjKvIbZZvKBtMzWh9Ar4112WT?=
 =?us-ascii?Q?teJKyfEZauFyqNJS0rTwa/Ib6oBbiwEIQuI9EeJlZwrFdrzLumW6m+kP0a7V?=
 =?us-ascii?Q?Ks72Mm7pB9IPtLFLfL1Lag5XIzkaJPWEXIevBpwEscZciMttLOVzxin1ABOK?=
 =?us-ascii?Q?pAg4dUvjKZ9TFbBtB+ELmoLfIZTm6cqHVWFpZsNm6KHnKo5kAqZDliSwimAH?=
 =?us-ascii?Q?NPBGLt73EsoKjS68PDYqJERdbo+8aPD0JCsz09gpJ/v2ZxIw/frowmuTemyH?=
 =?us-ascii?Q?992/yeBQPhSt9I+r3iVVYXT30Hz8Yp7MFSEYGdLdgTRxajE+6glMtpEVRD2m?=
 =?us-ascii?Q?CGhDQcNT+PwQIlNEYoy5QfgEAr63uolMUsIOBxoy4YBVik1ZN506eOMWmH8/?=
 =?us-ascii?Q?Oxaxm327nqN9ZcjR4fiBIVImIwVNhC8MyFArqq8lRewcamBNGF+oMv1b2ICy?=
 =?us-ascii?Q?wjIAJYsV4uK9m113TA/bcEm+mqSiTtG/ttrVsc0mIqvuGm7WvrtTsVwjaweZ?=
 =?us-ascii?Q?maVOwdB7HsMNONIpedvD8naA5Ari/VukCoACpLvwcCqKnSuDeakMLqv568Lj?=
 =?us-ascii?Q?cQ+P7X7j3mlNLJtaacya/71TBDD6G9Pwh1Ih7B/mbNofx7U+Awr8gq++dUnA?=
 =?us-ascii?Q?ziYMAE/g2bIsrO0zr7ZViL7PWTnVbysPJthbA1laIdDtFCVACFThafz6++v9?=
 =?us-ascii?Q?stdarWqL4VQOkVvh05qZSr0zk6l4qeR5BgcjGWwK61gKs2ZgMxA/sC55naR3?=
 =?us-ascii?Q?kr7X5Rr6q7uYH6O3uh8KijNu4qdG9EKL3A7oTX1I154yvaGc0T8BcOI0lAwH?=
 =?us-ascii?Q?OkWr1nQkmYO/TubHr8mQkyVElWjJcWAEcVZKtF+tOtVXTWBu+VIRVLaOfARO?=
 =?us-ascii?Q?aHj4vB+Jrb5il6Uwtx/uF0hOvH1HaQUBbLNz6od6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecd1ea8-92c5-44a5-dffc-08dcef38176a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 05:45:37.2914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtCc760yg3DqVFgYifrMCuOFW/k8QWGBGzHllD5BSS73A25U+OR/6RPS3+ZcvWIpaNruvBoe6fpEkrEizDbpzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Add the capability of retrieving the min and max values of a
compound control.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Yunke Cao <yunkec@google.com>
Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
v2
- export symbol of v4l2_ctrl_type_op_minimum
- export symbol of v4l2_ctrl_type_op_maximum

 .../media/v4l/vidioc-g-ext-ctrls.rst          |  22 ++-
 .../media/v4l/vidioc-queryctrl.rst            |   9 +-
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/i2c/imx214.c                    |   4 +-
 .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 +++++--
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 153 +++++++++++++++---
 drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
 include/media/v4l2-ctrls.h                    |  60 ++++++-
 include/uapi/linux/videodev2.h                |   3 +
 10 files changed, 272 insertions(+), 49 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b74a74ac06fc..b8698b85bd80 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -338,14 +338,26 @@ still cause this situation.
       - Which value of the control to get/set/try.
     * - :cspan:`2` ``V4L2_CTRL_WHICH_CUR_VAL`` will return the current value of
 	the control, ``V4L2_CTRL_WHICH_DEF_VAL`` will return the default
-	value of the control and ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
-	these controls have to be retrieved from a request or tried/set for
-	a request. In the latter case the ``request_fd`` field contains the
+	value of the control, ``V4L2_CTRL_WHICH_MIN_VAL`` will return the minimum
+	value of the control, and ``V4L2_CTRL_WHICH_MAX_VAL`` will return the maximum
+	value of the control. ``V4L2_CTRL_WHICH_REQUEST_VAL`` indicates that
+	the control value has to be retrieved from a request or tried/set for
+	a request. In that case the ``request_fd`` field contains the
 	file descriptor of the request that should be used. If the device
 	does not support requests, then ``EACCES`` will be returned.
 
-	When using ``V4L2_CTRL_WHICH_DEF_VAL`` be aware that you can only
-	get the default value of the control, you cannot set or try it.
+	When using ``V4L2_CTRL_WHICH_DEF_VAL``, ``V4L2_CTRL_WHICH_MIN_VAL``
+	or ``V4L2_CTRL_WHICH_MAX_VAL`` be aware that you can only get the
+	default/minimum/maximum value of the control, you cannot set or try it.
+
+	Whether a control supports querying the minimum and maximum values using
+	``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` is indicated
+	by the ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX`` flag. Most non-compound
+	control types support this. For controls with compound types, the
+	definition of minimum/maximum values are provided by
+	the control documentation. If a compound control does not document the
+	meaning of minimum/maximum value, then querying the minimum or maximum
+	value will result in the error code -EINVAL.
 
 	For backwards compatibility you can also use a control class here
 	(see :ref:`ctrl-class`). In that case all controls have to
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 56d5c8b0b88b..3815732f6a9b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -447,7 +447,10 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_rect`, containing a rectangle described by
 	the position of its top-left corner, the width and the height. Units
-	depend on the use case.
+	depend on the use case. Support for ``V4L2_CTRL_WHICH_MIN_VAL`` and
+	``V4L2_CTRL_WHICH_MAX_VAL`` is optional and depends on the
+	``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX`` flag. See the documentation of
+	the specific control on how to interpret the minimum and maximum values.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
@@ -664,6 +667,10 @@ See also the examples in :ref:`control`.
 	``dims[0]``. So setting the control with a differently sized
 	array will change the ``elems`` field when the control is
 	queried afterwards.
+    * - ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX``
+      - 0x1000
+      - This control supports getting minimum and maximum values using
+	vidioc_g_ext_ctrls with V4L2_CTRL_WHICH_MIN/MAX_VAL.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 3cf1380b52b0..35d3456cc812 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -396,6 +396,7 @@ replace define V4L2_CTRL_FLAG_HAS_PAYLOAD control-flags
 replace define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE control-flags
 replace define V4L2_CTRL_FLAG_MODIFY_LAYOUT control-flags
 replace define V4L2_CTRL_FLAG_DYNAMIC_ARRAY control-flags
+replace define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX control-flags
 
 replace define V4L2_CTRL_FLAG_NEXT_CTRL control
 replace define V4L2_CTRL_FLAG_NEXT_COMPOUND control
@@ -570,6 +571,8 @@ ignore define V4L2_CTRL_DRIVER_PRIV
 ignore define V4L2_CTRL_MAX_DIMS
 ignore define V4L2_CTRL_WHICH_CUR_VAL
 ignore define V4L2_CTRL_WHICH_DEF_VAL
+ignore define V4L2_CTRL_WHICH_MIN_VAL
+ignore define V4L2_CTRL_WHICH_MAX_VAL
 ignore define V4L2_CTRL_WHICH_REQUEST_VAL
 ignore define V4L2_OUT_CAP_CUSTOM_TIMINGS
 ignore define V4L2_CID_MAX_CTRLS
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 4962cfe7c83d..b0439005ec71 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -774,7 +774,9 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	imx214->unit_size = v4l2_ctrl_new_std_compound(ctrl_hdlr,
 				NULL,
 				V4L2_CID_UNIT_CELL_SIZE,
-				v4l2_ctrl_ptr_create((void *)&unit_size));
+				v4l2_ctrl_ptr_create((void *)&unit_size),
+				v4l2_ctrl_ptr_create(NULL),
+				v4l2_ctrl_ptr_create(NULL));
 
 	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx214_ctrl_ops, &props);
 
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index d9d2a293f3ef..7f370438d655 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -607,11 +607,16 @@ int venc_ctrl_init(struct venus_inst *inst)
 
 	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
 				   V4L2_CID_COLORIMETRY_HDR10_CLL_INFO,
-				   v4l2_ctrl_ptr_create(&p_hdr10_cll));
+				   v4l2_ctrl_ptr_create(&p_hdr10_cll),
+				   v4l2_ctrl_ptr_create(NULL),
+				   v4l2_ctrl_ptr_create(NULL));
 
 	v4l2_ctrl_new_std_compound(&inst->ctrl_handler, &venc_ctrl_ops,
 				   V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
-				   v4l2_ctrl_ptr_create((void *)&p_hdr10_mastering));
+				   v4l2_ctrl_ptr_create((void *)&p_hdr10_mastering),
+				   v4l2_ctrl_ptr_create(NULL),
+				   v4l2_ctrl_ptr_create(NULL));
+
 
 	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
 			       V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE,
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index e5a364efd5e6..d44fbad95c11 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -94,6 +94,22 @@ static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 	return ptr_to_user(c, ctrl, ctrl->p_new);
 }
 
+/* Helper function: copy the minimum control value back to the caller */
+static int min_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
+{
+	ctrl->type_ops->minimum(ctrl, 0, ctrl->p_new);
+
+	return ptr_to_user(c, ctrl, ctrl->p_new);
+}
+
+/* Helper function: copy the maximum control value back to the caller */
+static int max_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
+{
+	ctrl->type_ops->maximum(ctrl, 0, ctrl->p_new);
+
+	return ptr_to_user(c, ctrl, ctrl->p_new);
+}
+
 /* Helper function: copy the caller-provider value as the new control value */
 static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 {
@@ -229,8 +245,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 		cs->error_idx = i;
 
 		if (cs->which &&
-		    cs->which != V4L2_CTRL_WHICH_DEF_VAL &&
-		    cs->which != V4L2_CTRL_WHICH_REQUEST_VAL &&
+		    (cs->which < V4L2_CTRL_WHICH_DEF_VAL ||
+		     cs->which > V4L2_CTRL_WHICH_MAX_VAL) &&
 		    V4L2_CTRL_ID2WHICH(id) != cs->which) {
 			dprintk(vdev,
 				"invalid which 0x%x or control id 0x%x\n",
@@ -259,6 +275,15 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 			return -EINVAL;
 		}
 
+		if (!(ctrl->flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) &&
+		    (cs->which == V4L2_CTRL_WHICH_MIN_VAL ||
+		     cs->which == V4L2_CTRL_WHICH_MAX_VAL)) {
+			dprintk(vdev,
+				"invalid which 0x%x or control id 0x%x\n",
+				cs->which, id);
+			return -EINVAL;
+		}
+
 		if (ctrl->cluster[0]->ncontrols > 1)
 			have_clusters = true;
 		if (ctrl->cluster[0] != ctrl)
@@ -368,8 +393,8 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
  */
 static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
 {
-	if (which == 0 || which == V4L2_CTRL_WHICH_DEF_VAL ||
-	    which == V4L2_CTRL_WHICH_REQUEST_VAL)
+	if (which == 0 || (which >= V4L2_CTRL_WHICH_DEF_VAL &&
+			   which <= V4L2_CTRL_WHICH_MAX_VAL))
 		return 0;
 	return find_ref_lock(hdl, which | 1) ? 0 : -EINVAL;
 }
@@ -389,10 +414,12 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 	struct v4l2_ctrl_helper *helpers = helper;
 	int ret;
 	int i, j;
-	bool is_default, is_request;
+	bool is_default, is_request, is_min, is_max;
 
 	is_default = (cs->which == V4L2_CTRL_WHICH_DEF_VAL);
 	is_request = (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL);
+	is_min = (cs->which == V4L2_CTRL_WHICH_MIN_VAL);
+	is_max = (cs->which == V4L2_CTRL_WHICH_MAX_VAL);
 
 	cs->error_idx = cs->count;
 	cs->which = V4L2_CTRL_ID2WHICH(cs->which);
@@ -432,13 +459,14 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 
 		/*
 		 * g_volatile_ctrl will update the new control values.
-		 * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL and
+		 * This makes no sense for V4L2_CTRL_WHICH_DEF_VAL,
+		 * V4L2_CTRL_WHICH_MIN_VAL, V4L2_CTRL_WHICH_MAX_VAL and
 		 * V4L2_CTRL_WHICH_REQUEST_VAL. In the case of requests
 		 * it is v4l2_ctrl_request_complete() that copies the
 		 * volatile controls at the time of request completion
 		 * to the request, so you don't want to do that again.
 		 */
-		if (!is_default && !is_request &&
+		if (!is_default && !is_request && !is_min && !is_max &&
 		    ((master->flags & V4L2_CTRL_FLAG_VOLATILE) ||
 		    (master->has_volatiles && !is_cur_manual(master)))) {
 			for (j = 0; j < master->ncontrols; j++)
@@ -467,6 +495,10 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 				ret = -ENOMEM;
 			else if (is_request && ref->p_req_valid)
 				ret = req_to_user(cs->controls + idx, ref);
+			else if (is_min)
+				ret = min_to_user(cs->controls + idx, ref->ctrl);
+			else if (is_max)
+				ret = max_to_user(cs->controls + idx, ref->ctrl);
 			else if (is_volatile)
 				ret = new_to_user(cs->controls + idx, ref->ctrl);
 			else
@@ -564,9 +596,11 @@ int try_set_ext_ctrls_common(struct v4l2_fh *fh,
 
 	cs->error_idx = cs->count;
 
-	/* Default value cannot be changed */
-	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL) {
-		dprintk(vdev, "%s: cannot change default value\n",
+	/* Default/minimum/maximum values cannot be changed */
+	if (cs->which == V4L2_CTRL_WHICH_DEF_VAL ||
+	    cs->which == V4L2_CTRL_WHICH_MIN_VAL ||
+	    cs->which == V4L2_CTRL_WHICH_MAX_VAL) {
+		dprintk(vdev, "%s: cannot change default/min/max value\n",
 			video_device_node_name(vdev));
 		return -EINVAL;
 	}
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 4c8744c8cd96..a3abbde5379b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -182,29 +182,64 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	}
 }
 
-void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
-			    union v4l2_ctrl_ptr ptr)
+static void std_min_compound(const struct v4l2_ctrl *ctrl, u32 idx, union v4l2_ctrl_ptr ptr)
+{
+	void *p = ptr.p + idx * ctrl->elem_size;
+
+	if (ctrl->p_min.p_const)
+		memcpy(p, ctrl->p_min.p_const, ctrl->elem_size);
+	else
+		memset(p, 0, ctrl->elem_size);
+}
+
+static void std_max_compound(const struct v4l2_ctrl *ctrl, u32 idx, union v4l2_ctrl_ptr ptr)
+{
+	void *p = ptr.p + idx * ctrl->elem_size;
+
+	if (ctrl->p_max.p_const)
+		memcpy(p, ctrl->p_max.p_const, ctrl->elem_size);
+	else
+		memset(p, 0, ctrl->elem_size);
+}
+
+static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
+				     u32 which, union v4l2_ctrl_ptr ptr)
 {
 	unsigned int i;
 	u32 tot_elems = ctrl->elems;
 	u32 elems = tot_elems - from_idx;
+	s64 value;
 
-	if (from_idx >= tot_elems)
+	switch (which) {
+	case V4L2_CTRL_WHICH_DEF_VAL:
+		value = ctrl->default_value;
+		break;
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		value = ctrl->maximum;
+		break;
+	case V4L2_CTRL_WHICH_MIN_VAL:
+		value = ctrl->minimum;
+		break;
+	default:
 		return;
+	}
 
 	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_STRING:
+		if (which == V4L2_CTRL_WHICH_DEF_VAL)
+			value = ctrl->minimum;
+
 		for (i = from_idx; i < tot_elems; i++) {
 			unsigned int offset = i * ctrl->elem_size;
 
-			memset(ptr.p_char + offset, ' ', ctrl->minimum);
-			ptr.p_char[offset + ctrl->minimum] = '\0';
+			memset(ptr.p_char + offset, ' ', value);
+			ptr.p_char[offset + value] = '\0';
 		}
 		break;
 	case V4L2_CTRL_TYPE_INTEGER64:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_s64[i] = ctrl->default_value;
+				ptr.p_s64[i] = value;
 		} else {
 			memset(ptr.p_s64 + from_idx, 0, elems * sizeof(s64));
 		}
@@ -214,9 +249,9 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 	case V4L2_CTRL_TYPE_MENU:
 	case V4L2_CTRL_TYPE_BITMASK:
 	case V4L2_CTRL_TYPE_BOOLEAN:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_s32[i] = ctrl->default_value;
+				ptr.p_s32[i] = value;
 		} else {
 			memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
 		}
@@ -226,32 +261,63 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 		memset(ptr.p_s32 + from_idx, 0, elems * sizeof(s32));
 		break;
 	case V4L2_CTRL_TYPE_U8:
-		memset(ptr.p_u8 + from_idx, ctrl->default_value, elems);
+		memset(ptr.p_u8 + from_idx, value, elems);
 		break;
 	case V4L2_CTRL_TYPE_U16:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_u16[i] = ctrl->default_value;
+				ptr.p_u16[i] = value;
 		} else {
 			memset(ptr.p_u16 + from_idx, 0, elems * sizeof(u16));
 		}
 		break;
 	case V4L2_CTRL_TYPE_U32:
-		if (ctrl->default_value) {
+		if (value) {
 			for (i = from_idx; i < tot_elems; i++)
-				ptr.p_u32[i] = ctrl->default_value;
+				ptr.p_u32[i] = value;
 		} else {
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
 	default:
-		for (i = from_idx; i < tot_elems; i++)
-			std_init_compound(ctrl, i, ptr);
+		for (i = from_idx; i < tot_elems; i++) {
+			switch (which) {
+			case V4L2_CTRL_WHICH_DEF_VAL:
+				std_init_compound(ctrl, i, ptr);
+				break;
+			case V4L2_CTRL_WHICH_MAX_VAL:
+				std_max_compound(ctrl, i, ptr);
+				break;
+			case V4L2_CTRL_WHICH_MIN_VAL:
+				std_min_compound(ctrl, i, ptr);
+				break;
+			}
+		}
 		break;
 	}
 }
+
+void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			    union v4l2_ctrl_ptr ptr)
+{
+	__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_DEF_VAL, ptr);
+}
 EXPORT_SYMBOL(v4l2_ctrl_type_op_init);
 
+void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr)
+{
+	__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MIN_VAL, ptr);
+}
+EXPORT_SYMBOL(v4l2_ctrl_type_op_minimum);
+
+void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr)
+{
+	__v4l2_ctrl_type_op_init(ctrl, from_idx, V4L2_CTRL_WHICH_MAX_VAL, ptr);
+}
+EXPORT_SYMBOL(v4l2_ctrl_type_op_maximum);
+
 void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 {
 	union v4l2_ctrl_ptr ptr = ctrl->p_cur;
@@ -1296,6 +1362,8 @@ EXPORT_SYMBOL(v4l2_ctrl_type_op_validate);
 static const struct v4l2_ctrl_type_ops std_type_ops = {
 	.equal = v4l2_ctrl_type_op_equal,
 	.init = v4l2_ctrl_type_op_init,
+	.minimum = v4l2_ctrl_type_op_minimum,
+	.maximum = v4l2_ctrl_type_op_maximum,
 	.log = v4l2_ctrl_type_op_log,
 	.validate = v4l2_ctrl_type_op_validate,
 };
@@ -1768,7 +1836,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 			s64 min, s64 max, u64 step, s64 def,
 			const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
 			u32 flags, const char * const *qmenu,
-			const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
+			const s64 *qmenu_int,
+			const union v4l2_ctrl_ptr p_def,
+			const union v4l2_ctrl_ptr p_min,
+			const union v4l2_ctrl_ptr p_max,
 			void *priv)
 {
 	struct v4l2_ctrl *ctrl;
@@ -1892,6 +1963,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		break;
 	}
 
+	if (type < V4L2_CTRL_COMPOUND_TYPES &&
+	    type != V4L2_CTRL_TYPE_BUTTON &&
+	    type != V4L2_CTRL_TYPE_CTRL_CLASS &&
+	    type != V4L2_CTRL_TYPE_STRING)
+		flags |= V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX;
+
 	/* Sanity checks */
 	if (id == 0 || name == NULL || !elem_size ||
 	    id >= V4L2_CID_PRIVATE_BASE ||
@@ -1900,6 +1977,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		handler_set_err(hdl, -ERANGE);
 		return NULL;
 	}
+
 	err = check_range(type, min, max, step, def);
 	if (err) {
 		handler_set_err(hdl, err);
@@ -1941,6 +2019,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
 		sz_extra += elem_size;
+	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_min.p_const)
+		sz_extra += elem_size;
+	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_max.p_const)
+		sz_extra += elem_size;
 
 	ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
 	if (ctrl == NULL) {
@@ -2006,6 +2088,22 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
 	}
 
+	if (flags & V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX) {
+		void *ptr = ctrl->p_def.p;
+
+		if (p_min.p_const) {
+			ptr += elem_size;
+			ctrl->p_min.p = ptr;
+			memcpy(ctrl->p_min.p, p_min.p_const, elem_size);
+		}
+
+		if (p_max.p_const) {
+			ptr += elem_size;
+			ctrl->p_max.p = ptr;
+			memcpy(ctrl->p_max.p, p_max.p_const, elem_size);
+		}
+	}
+
 	ctrl->type_ops->init(ctrl, 0, ctrl->p_cur);
 	cur_to_new(ctrl);
 
@@ -2056,7 +2154,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
 			cfg->dims, cfg->elem_size,
-			flags, qmenu, qmenu_int, cfg->p_def, priv);
+			flags, qmenu, qmenu_int, cfg->p_def, cfg->p_min,
+			cfg->p_max, priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
 	return ctrl;
@@ -2081,7 +2180,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, ptr_null, NULL);
+			     flags, NULL, NULL, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std);
 
@@ -2114,7 +2214,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, qmenu_int, ptr_null, NULL);
+			     flags, qmenu, qmenu_int, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
 
@@ -2146,7 +2247,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, mask, def, NULL, 0,
-			     flags, qmenu, NULL, ptr_null, NULL);
+			     flags, qmenu, NULL, ptr_null, ptr_null,
+			     ptr_null, NULL);
 
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
@@ -2154,7 +2256,9 @@ EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
 /* Helper function for standard compound controls */
 struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 				const struct v4l2_ctrl_ops *ops, u32 id,
-				const union v4l2_ctrl_ptr p_def)
+				const union v4l2_ctrl_ptr p_def,
+				const union v4l2_ctrl_ptr p_min,
+				const union v4l2_ctrl_ptr p_max)
 {
 	const char *name;
 	enum v4l2_ctrl_type type;
@@ -2168,7 +2272,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     min, max, step, def, NULL, 0,
-			     flags, NULL, NULL, p_def, NULL);
+			     flags, NULL, NULL, p_def, p_min, p_max, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
 
@@ -2192,7 +2296,8 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
 			     0, max, 0, def, NULL, 0,
-			     flags, NULL, qmenu_int, ptr_null, NULL);
+			     flags, NULL, qmenu_int, ptr_null, ptr_null,
+			     ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b9a3c6b20282..77d999380c2d 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -893,7 +893,9 @@ static bool check_ext_ctrls(struct v4l2_ext_controls *c, unsigned long ioctl)
 			return false;
 		break;
 	case V4L2_CTRL_WHICH_DEF_VAL:
-		/* Default value cannot be changed */
+	case V4L2_CTRL_WHICH_MIN_VAL:
+	case V4L2_CTRL_WHICH_MAX_VAL:
+		/* Default, minimum or maximum value cannot be changed */
 		if (ioctl == VIDIOC_S_EXT_CTRLS ||
 		    ioctl == VIDIOC_TRY_EXT_CTRLS) {
 			c->error_idx = c->count;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index b0db167a3ac4..5c38d6d5ae5b 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -133,6 +133,8 @@ struct v4l2_ctrl_ops {
  *
  * @equal: return true if all ctrl->elems array elements are equal.
  * @init: initialize the value for array elements from from_idx to ctrl->elems.
+ * @minimum: set the value to the minimum value of the control.
+ * @maximum: set the value to the maximum value of the control.
  * @log: log the value.
  * @validate: validate the value for ctrl->new_elems array elements.
  *	Return 0 on success and a negative value otherwise.
@@ -142,6 +144,10 @@ struct v4l2_ctrl_type_ops {
 		      union v4l2_ctrl_ptr ptr1, union v4l2_ctrl_ptr ptr2);
 	void (*init)(const struct v4l2_ctrl *ctrl, u32 from_idx,
 		     union v4l2_ctrl_ptr ptr);
+	void (*minimum)(const struct v4l2_ctrl *ctrl, u32 idx,
+			union v4l2_ctrl_ptr ptr);
+	void (*maximum)(const struct v4l2_ctrl *ctrl, u32 idx,
+			union v4l2_ctrl_ptr ptr);
 	void (*log)(const struct v4l2_ctrl *ctrl);
 	int (*validate)(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
 };
@@ -247,6 +253,12 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  * @p_def:	The control's default value represented via a union which
  *		provides a standard way of accessing control types
  *		through a pointer (for compound controls only).
+ * @p_min:	The control's minimum value represented via a union which
+ *		provides a standard way of accessing control types
+ *		through a pointer (for compound controls only).
+ * @p_max:	The control's maximum value represented via a union which
+ *		provides a standard way of accessing control types
+ *		through a pointer (for compound controls only).
  * @p_cur:	The control's current value represented via a union which
  *		provides a standard way of accessing control types
  *		through a pointer.
@@ -306,6 +318,8 @@ struct v4l2_ctrl {
 	} cur;
 
 	union v4l2_ctrl_ptr p_def;
+	union v4l2_ctrl_ptr p_min;
+	union v4l2_ctrl_ptr p_max;
 	union v4l2_ctrl_ptr p_new;
 	union v4l2_ctrl_ptr p_cur;
 };
@@ -425,6 +439,8 @@ struct v4l2_ctrl_handler {
  * @step:	The control's step value for non-menu controls.
  * @def:	The control's default value.
  * @p_def:	The control's default value for compound controls.
+ * @p_min:	The control's minimum value for compound controls.
+ * @p_max:	The control's maximum value for compound controls.
  * @dims:	The size of each dimension.
  * @elem_size:	The size in bytes of the control.
  * @flags:	The control's flags.
@@ -454,6 +470,8 @@ struct v4l2_ctrl_config {
 	u64 step;
 	s64 def;
 	union v4l2_ctrl_ptr p_def;
+	union v4l2_ctrl_ptr p_min;
+	union v4l2_ctrl_ptr p_max;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 elem_size;
 	u32 flags;
@@ -723,17 +741,25 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
  * @ops:       The control ops.
  * @id:        The control ID.
  * @p_def:     The control's default value.
+ * @p_min:     The control's minimum value.
+ * @p_max:     The control's maximum value.
  *
- * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks
- * to the @p_def field. Use v4l2_ctrl_ptr_create() to create @p_def from a
- * pointer. Use v4l2_ctrl_ptr_create(NULL) if the default value of the
- * compound control should be all zeroes.
+ * Same as v4l2_ctrl_new_std(), but with support for compound controls.
+ * To fill in the @p_def, @p_min and @p_max fields, use v4l2_ctrl_ptr_create()
+ * to convert a pointer to a const union v4l2_ctrl_ptr.
+ * Use v4l2_ctrl_ptr_create(NULL) if you want the default, minimum or maximum
+ * value of the compound control to be all zeroes.
+ * If the compound control does not set the ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX``
+ * flag, then it does not has minimum and maximum values. In that case just use
+ * v4l2_ctrl_ptr_create(NULL) for the @p_min and @p_max arguments.
  *
  */
 struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 					     const struct v4l2_ctrl_ops *ops,
 					     u32 id,
-					     const union v4l2_ctrl_ptr p_def);
+					     const union v4l2_ctrl_ptr p_def,
+					     const union v4l2_ctrl_ptr p_min,
+					     const union v4l2_ctrl_ptr p_max);
 
 /**
  * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.
@@ -1571,6 +1597,30 @@ bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl,
 void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 			    union v4l2_ctrl_ptr ptr);
 
+/**
+ * v4l2_ctrl_type_op_init - Default v4l2_ctrl_type_ops minimum callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ * @from_idx: Starting element index.
+ * @ptr: The v4l2 control value.
+ *
+ * Return: void
+ */
+void v4l2_ctrl_type_op_minimum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr);
+
+/**
+ * v4l2_ctrl_type_op_init - Default v4l2_ctrl_type_ops maximum callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ * @from_idx: Starting element index.
+ * @ptr: The v4l2 control value.
+ *
+ * Return: void
+ */
+void v4l2_ctrl_type_op_maximum(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			       union v4l2_ctrl_ptr ptr);
+
 /**
  * v4l2_ctrl_type_op_log - Default v4l2_ctrl_type_ops log callback.
  *
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4b12322be592..4007041302d3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1910,6 +1910,8 @@ struct v4l2_ext_controls {
 #define V4L2_CTRL_WHICH_CUR_VAL   0
 #define V4L2_CTRL_WHICH_DEF_VAL   0x0f000000
 #define V4L2_CTRL_WHICH_REQUEST_VAL 0x0f010000
+#define V4L2_CTRL_WHICH_MIN_VAL   0x0f020000
+#define V4L2_CTRL_WHICH_MAX_VAL   0x0f030000
 
 enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_INTEGER	     = 1,
@@ -2017,6 +2019,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
 #define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
+#define V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX 0x1000
 
 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
-- 
2.43.0-rc1


