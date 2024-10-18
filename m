Return-Path: <linux-media+bounces-19822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 872DC9A3469
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E593FB2154B
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12C41865E6;
	Fri, 18 Oct 2024 05:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hGSBRlco"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0664917C9F1;
	Fri, 18 Oct 2024 05:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230346; cv=fail; b=M6mfYa+HcM1CQ6/nlKcU0fV9Bu4pylXldWBnmaSGhE5I1mGbVbYVcnAJ8VNJBD0Kdmm1oKCJmBoHelKRMYQXY5SM1cfmI0iblAsw+y14/TGq5QbQUr+doNe0Sucwgxi3xch/+INty82kKdgvQOJS4g5yVACqlQplKdaM9uvxqxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230346; c=relaxed/simple;
	bh=qlMctEd7HhmPLSLQ4UfA6kmjyFU0zrsFsFbe82VEEa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KoG/5zflgJ0df/YxojeEIYnZVRePyIZ6w5q0nDC56GxJWmKGcTlnK63Ae5BQ+r8vnYKDLRkgPuz/tz7pZOYwi9MRoKEU8MAasxUS2FRbZPud7QTFw9H4eGFXlDtBnSZIXHuBa5F9RgKZwkp/xz/UJlIvUCyu/U87riaYCHl7hCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hGSBRlco; arc=fail smtp.client-ip=40.107.22.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ua2rSwGCbewIaL6lSsKK7JhzQ7kIwRl2bgalStgO+hoMhOPLzaqROWU927yBA20nq0ai6lRAzRkDbys5Bto7sGa4ZKMvo21KclTCucKuC1eV2dv827Pr0y31JoqitHpINaEdopWGG/ymv4h8+ibyllVuO/Fx/XVErSXjAf056wOmBtJyCdzdsVpTEoZTSVj3zHqc+2IEhSyNLYwDZat+AEwr2pAkCYmKZw9d6i8p17BnW177Ft978rDJhw6OikxjK2RslSPEGqeG5AZEoly/N/xZvs6BuiglhYivMUZpZ5J4sZT5KW8X/gcWTPk/hIGFpai6L+UjAwRuWTc1KMVusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jzw5eWedJmMj6hhrqj55ALXVWPHESKXlNDMgQg+VhU=;
 b=df0uIzyMGFjO08/lpMmIx+HvWkp93823eAAOMSCB2N5DDPCEOWGCUAwKPlFjTfOTDgZ9gn/8u++WXXpGoN4eQjL4Vr8sGMrkq5FKtWPLMAJORE62ukJtLuPa5ZgqVSkjRQbHM+Hn8Xctxxnc0UfSfHhDTemSZRwO2M62hkcrSX2Edkvc5gsRZyMrcNJva0XQzbfEZ1LmK9se5em4tPHixLitTAf8P7r4QHz6xp05m0NDqpIAMKSo/BEjiKqFBb+bSkTi/KDkvntQK5nUdYnnKDQXrtk08yaEEnHMpX/B926AajPaBvN7wZMYQNeAtYaz4ijNmoHCR52iMrmkfmCUxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jzw5eWedJmMj6hhrqj55ALXVWPHESKXlNDMgQg+VhU=;
 b=hGSBRlcoerhLDRtgDZicCDyI07ai3VBdAEKVwbHaI4B0+KknDbFqCw0zm5Si5yBvFWqq1Hf629jcbCYYK+9JH5JZEv3nxNIeUXC+xX3BqRPGJU9072ZyXd/1Hv5FraVYHumdda1fnk/zg2YZFYQJKxE0RdOHmcq7QHTaUb1+DJdcZ+gj9bik7OSg7KdGiHNsmQnBpSagvHhjcCTbzky3Gxsd0H1irea3CDllfMfgClktb5qclBuEcVL/1hbsqzIRUlFglYsYBsYxjGagxnSPy6KI5yXV+YUiuw6K0sWUpdHJeyPCAzwJ9esF1xG5qPWEnkbLc+9VO+BlnK45NzhzSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 05:45:42 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 05:45:42 +0000
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
Subject: [RFC v2 4/6] media: v4l2-ctrls: Add V4L2_CTRL_TYPE_REGION
Date: Fri, 18 Oct 2024 14:44:46 +0900
Message-ID: <20241018054448.3190423-5-ming.qian@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: fc30868e-1e3b-4a8f-3736-08dcef381a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XZmCUXNElnq2KcGEzWTSuaYX74kZKS3IqYfGomtTqSHQozgFhZJR4BDrIf57?=
 =?us-ascii?Q?8xOmtYBNWHW0MMud3sNDBzpFnHqoY6OTMlmKDnCxMZvWmXTUU6q3AjM86LL9?=
 =?us-ascii?Q?KxHpfjFKAfWRy+8jti/0ZDxxiuT5FwsPuql+Yr/vVuwBCDsdv8dy8J1drkl6?=
 =?us-ascii?Q?I1mUloXNywMkGj1fR9NFxpMMJvxkAEj+J1jHJ2NWMvJeeiuq231qmr+2sLeE?=
 =?us-ascii?Q?TvLRNJcO3aNlVn8GBXoyORe52rnulLcKR7bmqjhzQ8MO4HZfCRQ4g9HVEybE?=
 =?us-ascii?Q?t5l8sKO9DUolmXUHcaDdTNu9/2V1RD/BvyGEV3x+bTXNZIU9cpjMhyz/R1An?=
 =?us-ascii?Q?FjDKPaO6gc+kYNkd4Xdtc4+6dN44ApIwfbNTPenhkEw3r94o1s+b6q7lZgEW?=
 =?us-ascii?Q?UkQAIpCurMa2J4oDvMW6UoSergbl3Q/iLKDG10eb6XOmMeTf6h+CzWr/YJQW?=
 =?us-ascii?Q?WgKB4fZUFZasgyebLdgkwUvYXBA9zDeylyWYMzl9Z085zK7jkXmYC/xUcBNj?=
 =?us-ascii?Q?XmSDvZHIfR3oe8mfcYxYdyUXP4KQqTypMgPX3z9SbLuBZo2wU8mMmgyYjTvM?=
 =?us-ascii?Q?s2NdZ1WXhBVgHQl7JT0PvLAMnnCtrasHfp3XDO5eu8QhaDk0SSI4Z1veLj/U?=
 =?us-ascii?Q?mAL6qHnf6Bv1e1r8pgjVdKFzr589TZ0ZvrZLRd/5gopK6dvDcH2kfVOfBQYL?=
 =?us-ascii?Q?OloCZT3JOLphJGwEGAbFbBqDGmNQb1QCENjaqM/upYJQcum5VbXbjh0UDkPo?=
 =?us-ascii?Q?Da0fZsH3cn6dGz6uVwe4F9bEMouPoNgUts9J/LGxblFtAowuSID3hUSpGIzZ?=
 =?us-ascii?Q?m3qbmxA7ZwtYqV/nqmyoMsorrIap3OVGxQD4w3PDrLM/FIC2jDjiamApFb9j?=
 =?us-ascii?Q?wm+cCjmD//BP4BYdjB4J9uN3L2kNc6PFqQDRJcqrCycsf3aT4MJnPbN22EB0?=
 =?us-ascii?Q?p79sTZ35m/NlTrcaWNQlLoF9rPrk6HXJmKB8ig1i98/RWEeCbkZHQ2QxW8aJ?=
 =?us-ascii?Q?2CU6b0/Uug0UeMwcWWFCQ7l/oRtziR44FgRmxsvrCarhA1wb4XQ/LwKPuwIk?=
 =?us-ascii?Q?MGdJCOGEdYzL5/yPmzfAj3al2bbaX/r8/11O7VPWnCmls8UBH+01tTIJPII5?=
 =?us-ascii?Q?JTz5Z7rmAaS69dHyhRTDJecSNK49d/k4KmjnoXApDqSsKfwbv986y/yVe+F5?=
 =?us-ascii?Q?bw2HwDQWBMxr26khp2gBZTtVOFLUs7Lqgco/CHenCEVlTUY+Ac8BlzjTibi2?=
 =?us-ascii?Q?sHxKOm4sU9S4QI8ZHfAhANIzZ+deBCgxKH648U2YLI8VfDywX+CNeOGt5Efm?=
 =?us-ascii?Q?YARfkJJFaQsaX/Dr6iu+zmSMMyW5LX0bgum966H2ZL9E67mSd0UmGSoVGuUH?=
 =?us-ascii?Q?kAANwj4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O8lAHFBhqCNKmOrJCkxLJSdWLZfNVh72/Lpz9Kk5C8DjMHUaeTzK2Wcx1U6K?=
 =?us-ascii?Q?DXZucYhWgisYArEN4fBJRlJtOk1FQX+uGP+lWpZoPMglB2HHwNbyZ4e1Gb+r?=
 =?us-ascii?Q?UkpkoMebT7KmgHHkWqzTpwd7s2D06rD798/LKd9rEOQYP68zYkBRXK7yBjcv?=
 =?us-ascii?Q?SeY4ZBg5aPN3K/zMRRlUkigXQqAtA24p2/RUo9bGpJd8FZmKuA1VFVixX0dq?=
 =?us-ascii?Q?GciuA40eIKl86YcCiVHs4ET8iykaWoa/f8r61vcTU8weRuONhAGJ1roiFRBH?=
 =?us-ascii?Q?qL0i/yJT7WlgINxMhc3n2GNIHOGbDZPDzk3UH70NoGw2aPk2Y/VXssZaibQl?=
 =?us-ascii?Q?f2lFnRHfe5RE9xQjA6nf4zVPooVsQxPBN7ld5C3uSQnt+eoVgAnZfhK7JDmr?=
 =?us-ascii?Q?asEz96F1uYNAOgJVPiofjjD5JeBEXj1ogXiwxANav4qw3XjxouKyvwub6M75?=
 =?us-ascii?Q?fA4LnYf1nWnLNyv6z3nOqoHsZ517Ap9rW00U1iTok2Qz6W0GYp2qKks07uhs?=
 =?us-ascii?Q?EuVHSpT6lrKE4uSSI9ppn1Vs2x0/Zdi05AxrXJ08Ybheo5HlvKJXoD1/GqMm?=
 =?us-ascii?Q?FPJ12yQweWTsUZDn6tin+GEQgVOjQnXwNyLc3pDEhmpiCrHfJNJRKtI2er5R?=
 =?us-ascii?Q?bjjgq5+3To8nbwd3zpHkGNAcDhW0fxE48hWIEL/XnqJn6m1fkYjdiGxNlrIQ?=
 =?us-ascii?Q?UE0hhZPVAR3gvFZq0L02jEHWrerevlrgltO0YUqp1AjXyxr4++tk5R+cS4A9?=
 =?us-ascii?Q?KYS4HEa3usNbMvd9fEGjyNBR3A5AiGk8mo2RMFszzCIe1zlFXZahu13xYn7X?=
 =?us-ascii?Q?yd6dRHmPj6dRWJffUiqVC5eWQ2V6m87qbEWBUUX4tnbV6+XZ345xhZyU/A43?=
 =?us-ascii?Q?5SOd4J33akJkzWLlMIc8JJ29IqtB9h8KyESTRZgjeApozg4vHi7weRWBNdaX?=
 =?us-ascii?Q?C72rFbxBvzorArQoO5LatiUUd1Q8fhPVdQjqh5xlBwau7L5zcrBcXdNrDHCb?=
 =?us-ascii?Q?NjKChJnyo2t2onXL1oedloT+6BQ2BXmzxQtoXHShmER+vLKuX9YnvKYv3iHv?=
 =?us-ascii?Q?oOWFc6Pwhn6j16KVQpx24OOZvO4v7TNdXVwsF1VAJfJU2C0IicunONSw1s1f?=
 =?us-ascii?Q?XGupGmDVvK6A3vX7QWmOGFonqmtnWYNcfoxT02hbgm6DPGuXxNYw5x5AREAt?=
 =?us-ascii?Q?YQD+nA/HzcGHZFJ9Wqg4ctoXGyblkkFTWx9DhTJ/aKsKfJHaCU9JbO9k7O1r?=
 =?us-ascii?Q?IMmTj/AAJGICJACx5YBaXKIniLRxG8TUmCI93dVgkR5AKSVO6XOu8jFVCw9R?=
 =?us-ascii?Q?P0OLWrv/uuVySdCeU24boePI0+Q5q5VRp8m46XW8GgobutBoqUnuadzUIEjI?=
 =?us-ascii?Q?g0QzKk3wOPvsACjxCXduKR6q3YbH/ObbynK8G8kqyTpDBFGLkvTPCjPbcBcm?=
 =?us-ascii?Q?9NxKTwnhBFwGJuZlJE+pv2B3Aj782BvrVa+fNHjjKroVJIcqw4P0GD8do4n6?=
 =?us-ascii?Q?pHw37iAvFcsRK3EoN1oOsMDz7CbcM433pnw5mWDMilDNgXbttsMVAAk4+tlX?=
 =?us-ascii?Q?TB1p8VXn9irsp0ZnVshSQgldy75cTBX64FdabNFR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc30868e-1e3b-4a8f-3736-08dcef381a3b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 05:45:41.8983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PuyoK3+pag38VryqPEaP3qM5RhvTFz4kPX6VLjTO+rr0f2TsCyt18FOjO1d/QuOVJP4RoCr9xdzvw/3gitIJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312

Add p_region to struct v4l2_ext_control with basic support in
v4l2-ctrls.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
---
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   | 12 ++++++++++++
 .../userspace-api/media/videodev2.h.rst.exceptions |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          | 14 +++++++++++++-
 include/media/v4l2-ctrls.h                         |  2 ++
 include/uapi/linux/videodev2.h                     |  8 ++++++++
 6 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index b8698b85bd80..f00c6d1f7784 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -203,6 +203,10 @@ still cause this situation.
       - ``p_rect``
       - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_RECT``.
+    * - struct :c:type:`v4l2_ctrl_video_region_param` *
+      - ``p_region``
+      - A pointer to a struct :c:type:`v4l2_ctrl_video_region_param`. Valid if
+	this control is of type ``V4L2_CTRL_TYPE_REGION``.
     * - struct :c:type:`v4l2_ctrl_h264_sps` *
       - ``p_h264_sps``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 3815732f6a9b..df3cd36b67ab 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -451,6 +451,18 @@ See also the examples in :ref:`control`.
 	``V4L2_CTRL_WHICH_MAX_VAL`` is optional and depends on the
 	``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX`` flag. See the documentation of
 	the specific control on how to interpret the minimum and maximum values.
+    * - ``V4L2_CTRL_TYPE_REGION``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_video_region_param`, containing a rectangle
+	described by the position of its top-left corner, the width and the height.
+	And a parameter for detailed purpose, for example, it's QP offset for video
+	encoder ROI. Units depend on the use case. Support for
+	``V4L2_CTRL_WHICH_MIN_VAL`` and ``V4L2_CTRL_WHICH_MAX_VAL`` is optional and
+	depends on the ``V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX`` flag. See the
+	documentation of the specific control on how to interpret the minimum and
+	maximum values.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 35d3456cc812..22307e029883 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -151,6 +151,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_REGION :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index a3abbde5379b..8dabc6a87126 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -441,6 +441,11 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 			ptr.p_rect->width, ptr.p_rect->height,
 			ptr.p_rect->left, ptr.p_rect->top);
 		break;
+	case V4L2_CTRL_TYPE_REGION:
+		pr_cont("%ux%u@%dx%d, %d",
+			ptr.p_rect->width, ptr.p_rect->height,
+			ptr.p_rect->left, ptr.p_rect->top, ptr.p_region->parameter);
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
@@ -886,6 +891,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
 	struct v4l2_area *area;
 	struct v4l2_rect *rect;
+	struct v4l2_ctrl_video_region_param *p_region;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
 
@@ -1248,7 +1254,10 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		if (!rect->width || !rect->height)
 			return -EINVAL;
 		break;
-
+	case V4L2_CTRL_TYPE_REGION:
+		p_region = p;
+		zero_reserved(*p_region);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1957,6 +1966,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_RECT:
 		elem_size = sizeof(struct v4l2_rect);
 		break;
+	case V4L2_CTRL_TYPE_REGION:
+		elem_size = sizeof(struct v4l2_ctrl_video_region_param);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 5c38d6d5ae5b..8b271a7485f4 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -57,6 +57,7 @@ struct video_device;
  * @p_av1_frame:		Pointer to an AV1 frame structure.
  * @p_av1_film_grain:		Pointer to an AV1 film grain structure.
  * @p_rect:			Pointer to a rectangle.
+ * @p_region:			Pointer to a video region
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
  */
@@ -91,6 +92,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_av1_frame *p_av1_frame;
 	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
 	struct v4l2_rect *p_rect;
+	struct v4l2_ctrl_video_region_param *p_region;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 4007041302d3..503cbb884734 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -448,6 +448,12 @@ struct v4l2_area {
 	__u32   height;
 };
 
+struct v4l2_ctrl_video_region_param {
+	struct v4l2_rect rect;
+	__s32 parameter;
+	__u32 reserved[2];
+};
+
 /**
   * struct v4l2_capability - Describes V4L2 device caps returned by VIDIOC_QUERYCAP
   *
@@ -1858,6 +1864,7 @@ struct v4l2_ext_control {
 		__s64 __user *p_s64;
 		struct v4l2_area __user *p_area;
 		struct v4l2_rect __user *p_rect;
+		struct v4l2_ctrl_video_region_param __user *p_region;
 		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
 		struct v4l2_ctrl_h264_pps __user *p_h264_pps;
 		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
@@ -1931,6 +1938,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
 	V4L2_CTRL_TYPE_RECT	     = 0x0107,
+	V4L2_CTRL_TYPE_REGION        = 0x0108,
 
 	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
 	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
-- 
2.43.0-rc1


