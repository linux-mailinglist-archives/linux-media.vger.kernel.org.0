Return-Path: <linux-media+bounces-33155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F24AC0E52
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 530307B1D28
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3400F28DF24;
	Thu, 22 May 2025 14:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="jNuVRMtA"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC22828D831;
	Thu, 22 May 2025 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924578; cv=fail; b=JCEBPC1FGb2VedAnKSSLwOqp4x4lmc1YFaxcbhwkEFaij7G+zdkYRO1SnIs5gXRTLKKGRqzDCSf9rJAaIDx0dMjH8s7WGXCxh4LFMahlL+gfZBVAZ1g9hqvWzoTya2Rl2wg+ug4YgnQKXwhdA6awHSJtjxCS5eW3EJaZIj3tTE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924578; c=relaxed/simple;
	bh=yynIDOVjmpFxfgOZTW5Fz6bmIac2z55qSPd9sXAN1vI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FLJljTuNQ9xBVwkSDEhpQRvMfVy/yD76mEcBrGiR9NjMv43brSKDblbFGtoQrXbCs+uqFo6vet2rDgtdW8MeadjjcrctmCC7N7AqmPowptiIZsQXbjnxGOCTyUFJDAhESMH8dvp8LW9ixFaGAhkdSbYBIghAn2+DmzVaVIK2ezM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=jNuVRMtA; arc=fail smtp.client-ip=40.107.21.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zH4FmRdDxoqS12nYlVo0IQsGewYTtO74pU2+WwrkoANS3BF6EYQJ21k54ZxWPNtT8FSdQlo5LDzvMumAwaObwfRcBgD49YW/AeA41t1zBYRWRIFcc078FCiK8tl4KkA16zSxJ9iGE4xfQINLsOu08eqTZzl3Imuk+5IOGMFkqU8gxBm2wjOV9QynoHYKc3KvT9T9X1ZeDl9Fetnp6znlXi16iohOHFqyBzTMF7PmwDwcGADNfRXZtaM0qT2QZR0Hta3Gz5fYWwq+e9fByKKy6wBAmn0Cpjs5Q0aXoNZx0+oklmMyPEw8a8edpSVErtQ9+OWNp6OMj37aM0Wj71vmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+gNzjTTFQkzpGpt+tdyw+nCIpPKRQUc4BxpCVaEsos=;
 b=fCRH9dPhbd7QGm8xq4w8J+a99ZvpIO+Aso55VZoYklhgsZBd0rcWLmqQNXsdyjzm9cY4NScd9KExYx+XiG3XREX5lC4lJpZphKTPRALlYDo0f6Fp+wfRNnWsxNQgbjnXGD/WtATkwWW9Xqd/wXWQQ5fOugsGb7OBduA9lywoTzlohI52AyKW+Ug9uNpnP2EIHJJdbQQgnvSCJXGwHKJkz0a5At06hdpdwjI/lDduZFNfleoVoR/R/nm7BrlQpHu265dpzxzYPEam7Xop5lKcpl0pOxi4k5riiXsAS/n0yh/ph9TvWTg/MIfaku6VhAlOojk2dXeTL5+pmrn21oUU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+gNzjTTFQkzpGpt+tdyw+nCIpPKRQUc4BxpCVaEsos=;
 b=jNuVRMtA7GHwI6bTvmaTGmq/6UnNjWDbN90am51rD3vepjeGXssTmnrLyE009g/6HAv5vy+uVfLXZt1e0tkbxqs+cb3jFa0hznXUOFDsEMsprors1tj/6u2t1s6EKr15vmhttMbo9TijpbImKk468IVHr25R0MWzbzj/5ytag2XDnD8fbRyU3jJzydsa4e1an9IhdNa1BrRmQZVmuae8SIcuHqg3s1aUlU5G5vEszjz5dae0YbvYs64+vIt9SKmLwnYXSy+A/O29N7x3KY0c9FFMoueiGCbzFxPxQ9sPDorSTf30/SoFal8WPGK9siXLbESfPJd41CRas076rMCz2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AS8PR03MB9912.eurprd03.prod.outlook.com (2603:10a6:20b:636::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 14:36:10 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:36:10 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v6 5/7] media: mt9m114: Allow set_selection while streaming
Date: Thu, 22 May 2025 16:35:09 +0200
Message-Id: <20250522143512.112043-6-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522143512.112043-1-mathis.foerst@mt.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0071.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::17) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AS8PR03MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dee3b22-2dfd-469b-8807-08dd993dff01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZMMCZPkfmyLKioqqVlA/Z4mRvh7Dma0QPTDDXZWn418Xy46ECiwK/KjaQxpf?=
 =?us-ascii?Q?3iRf630BpQ6pgueh7F3iXf+g03D45DbpNHvuqSl4VoyQmYcc8O0WyYSCUgOi?=
 =?us-ascii?Q?hOWLPBovJGINRF+sT0Bjc463w7L2CJKaqO2ZKVoUj09cb74YIEB3j1Eu3aNi?=
 =?us-ascii?Q?EzWeewklzHP9ET/m5EYNgbxo8AAg9ujx1lb63u3yCWNeavtgl72U7a0LR9Th?=
 =?us-ascii?Q?/p3jYlUX77nW1H17Y0uQ5h2bwtSHpjVVFDaO+TxNt+GjpYVdNZOH/fGVGIGi?=
 =?us-ascii?Q?+aKYjbd23CRGxzEGl0BKlDjJ1rm0OmEU9J9EkVceklyhK3VyK134GS/S/b7T?=
 =?us-ascii?Q?yY0bWHDvBkwZRj+zbWrB/r22mvosCFtRgmO3Ngjl3GplggMs5oMPgo8nDTT9?=
 =?us-ascii?Q?rZw7eZFZ56qo25oHPNXLoGrsePSa5JWg49P/7BxYemztwkWPW6UOwtfKeMBk?=
 =?us-ascii?Q?tPb2DnkqYjgTLmYNVZ6bEzEIzVGqzOzn3eeOxwTrf93/PPEKEgpzzdo28t4+?=
 =?us-ascii?Q?TrlTCpIXa1bBlg0g24/Y2KxHzHFbjUU8ZfwDASwGFBdlW/oiNn4+CiRzDEev?=
 =?us-ascii?Q?DpzRywC59jgrRFuQwY38wfKZUMaEVoBlllBrKV7ZGbEDa8LEe85GUu5fHvGy?=
 =?us-ascii?Q?rg+fvamXwjscBxjFKyouawz6hZT8ch7aStI4N9oilKMJRTBmHwDh/eSknLcc?=
 =?us-ascii?Q?BAByMdsudho7Jw1UAC+7YrptmgW2C8MczHuw7wmix/xpsKL+ewTjDUATAnh2?=
 =?us-ascii?Q?C76MaNZH4j5mvgcKcZHRaoqAgDGo0DrVZwZjVrbLiY435NiN9bzvABawQ4MJ?=
 =?us-ascii?Q?p3JSyr9rNxqIoGHkrGq6uZnNyzIiwLwhdl3iA1UIW+XoSEYcEs+QWov8uius?=
 =?us-ascii?Q?V0cL1Qn9o9bk3oXeWz72xAfTUDU97IzTMs6iyFfH7efsCSsemPUYsLbH2jiC?=
 =?us-ascii?Q?BIgPe9aQqzdqFkQ5zYFCT9OPFfjlXDP1vhwQQx6iMeisk9h/rmfFXhx9BH2m?=
 =?us-ascii?Q?akCTRrHaM+UrHJq8RLlmy6J2MkodaTMJ/BvZANxunzsbZFMNTE0YNp4QYlOD?=
 =?us-ascii?Q?+93Ps4WRyOwZU1iLVPf8ZoW9xILQ62K/6W9eER++nXVsDfDXi1Lx/TjNbJuz?=
 =?us-ascii?Q?hcImhIMW/OHNqGHb+OrGJg/zB0rtDvK0Or12kRkYs3OaKBjqifTfwWQ5yPEg?=
 =?us-ascii?Q?HMVBM5nXECJ3v32aYz0oM+cdETgsaHv2VEIAo6aWzj1XHg4uZ2XfMuUMootG?=
 =?us-ascii?Q?LNll1U0Rmpkc5m3UdG0utwc95gWDQ9NpN5YaeAEz1vM4OTmv+Za1Fmg3/UaB?=
 =?us-ascii?Q?M03mBsbwwN4iFhG07X4UsuFLfFeC3GxfP5SCEmipDrhAVhOxobOOXWUwjwMX?=
 =?us-ascii?Q?8BAN+fNgQGf6jfXyi8EdcimRYV7d8G1MgDmf7maxU4ZqU+b1EpZNIVuqf1M7?=
 =?us-ascii?Q?ZAjrBPx86mSX2lwFashEuTDO+ARUVnoCXCV7HNZXMDUfM4jALj0KjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8H1KM4mWF7QlFojQbZ/lQM3M69hrIj7ru3pwnhtZNDuTXO7FRC2oIi0SGaOC?=
 =?us-ascii?Q?ihC2NlCkXYabU/rTff9FBE9gx5sn6XSRfIVMX0/xdOSqhRQpigG+m9D09PTR?=
 =?us-ascii?Q?/4WFmCj/n1KSx6VJ821S7IHrWo/EfO5dpUq93i17+BgPYnGkxkRUy+iPPxFU?=
 =?us-ascii?Q?VVdlFPZyF3l6JQkBoYwrubho/VUEYre898oDHEHNeBUYwQePeuqc4ia7MLpb?=
 =?us-ascii?Q?2FE6d1bSUlPAbvnW0Bjr1MoCMlQ+TeM4zjEpz0pRBBcbH0FxSDAW9Tpzxqcu?=
 =?us-ascii?Q?Nn6gHJOoLvwMx5VuAZRqzxLerDezTSkk8iaFRxbnjltPkTUc1ojfrNX3L4pQ?=
 =?us-ascii?Q?4VM9NQTBO+TJtcnCaGthrOaF8VC+iKS+XtXYQFFIAzxD8tKdm4EnqzybsZB4?=
 =?us-ascii?Q?ZcI5Tj7qZViB0tR+Pq7ip/OPQphc5iWJK7hrmu5sA8luLDDLlYRHcFt72rrg?=
 =?us-ascii?Q?OxWBbtghyt5vsHqM3EBsw+wlmrWdvd5CIRtszSTQZ3gyuPBhADhuH91QmIhc?=
 =?us-ascii?Q?IG8XRUXH+qFZVN2282E3/0VPjuX+krYrGHuwQmKbQ18sm9aGBuou52JvW+z/?=
 =?us-ascii?Q?6IoncFryji5+OBj/qxTrogyUCdBpd7VLQJDqxfJbSRNoUgD9TvLve8/dfMyN?=
 =?us-ascii?Q?zEdyRGtG6nhdqgB/qX3DLnXHiXKmjevOJ+sRIW4AymAWT4o4jIgNfmeRwzCX?=
 =?us-ascii?Q?sMhDTUefNwkIrlZz029hb6V47toz9wy4q70xmm/lnjHx48rTbWtNLn3Gozcy?=
 =?us-ascii?Q?CzW8EYa7APSbXSVaEocDIZKCDybzvFq23Pl7iZS6orx2n2rKi+JFxxGqA8vT?=
 =?us-ascii?Q?MXeL1OLjprsNkVN9/Q/WJnlsAL4bXpEXEOn1J9rtLExZGweC03EmtvJB/+n5?=
 =?us-ascii?Q?qsHyRh+O1mJCyVqPhnXQYPdhu3Yi8j+4bZGIhk5u3pb42K5CcxuZI0Q4O4z7?=
 =?us-ascii?Q?qauUhx/dHzqIcKgSZCvf7WnIowkrhB9866vELhRgcNEaVdXul/W6kMi/FgDY?=
 =?us-ascii?Q?UU7mfNZDm/muBPkbccH1A32ufGS71du7aCxI8CyBUqf4vpdf3HV/R5iDNVIl?=
 =?us-ascii?Q?sQEI1FDojMr2jmxz2lFfVFfuKsMVBLYL9cBsxT6npQ7FA/tBYiR2x6yALS1C?=
 =?us-ascii?Q?M2H4H4MVrI/VWTeln7xCa4yFJKcCcSZNTBG5v9QRLC5EhaSJKMZUrDt1T1z1?=
 =?us-ascii?Q?SrmJ2jrwHSWrXdgjODn1WPie2Hhu9kmqFRi5ERz35VyWT/3EJi/9yoy9gWFb?=
 =?us-ascii?Q?zE/J7BX8K7skIqZMTEiVXcBaUJwKsRvsSKSrpRfhcWFkJIBhxNQDJv2FQou1?=
 =?us-ascii?Q?cSsOrEryDmVPGM2HYbESLEQ7TjnosLYzK9MxGfvIrk1lhDHq6FetvMYZCl+S?=
 =?us-ascii?Q?JiF/lDdw1XJhpWmIvuxfAVS1775ZhXuIPsxAqlXZ0LpwuuUh4CLnXCaLFm38?=
 =?us-ascii?Q?vLInoFs6bVUWvZTL+NSoeapHRjN7dzK46zcJgvL5BfkCpE7TbjDGaK2oAHqo?=
 =?us-ascii?Q?KsPhiLgiceLfYtsjYPz4n10fijZT948kFwPvRSk+laAhDJmObWZqgR3AMfHI?=
 =?us-ascii?Q?3/LzEKl/r3PK8ZeBGfqpaUJj2b+Zcj7tj5nvdeJa?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dee3b22-2dfd-469b-8807-08dd993dff01
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:36:10.8455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9IuvscEgPeGkIwRQlMqsI3L2RjWkHjeopFtxI6LmjEHo3Q7iz/ChD5+pmAsDaOFn8ySdg2v/VJKubp6ME2vhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9912

The current implementation does not apply changes to the crop-
configuration of the sensor immediately if the sensor is in
streaming state. The user has to stop and restart the stream for
the changes to be applied.
This can be undesirable e.g. in a calibration usecase where the user
wants to see the impact of his changes in a live video stream.
Under the condition that the width & height of the cropped image area
does not change, the changed cropping configuration can be applied to
the pixel-array immediately without disturbing the IFP.

Call mt9m114_configure_pa() in mt9m114_pa_set_selection() if the sensor is
in streaming state and the size of the cropping rectangle didn't change,
issue a CONFIG_CHANGE to apply the changes immediately.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 7d39978835fe..e909c1227e51 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1301,11 +1301,14 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	struct mt9m114 *sensor = pa_to_mt9m114(sd);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
+	struct v4l2_rect old_crop;
+	int ret = 0;
 
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
 	crop = v4l2_subdev_state_get_crop(state, sel->pad);
+	old_crop = *crop;
 	format = v4l2_subdev_state_get_format(state, sel->pad);
 
 	/*
@@ -1331,10 +1334,25 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	format->width = crop->width;
 	format->height = crop->height;
 
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		mt9m114_pa_ctrl_update_blanking(sensor, format);
+	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return ret;
 
-	return 0;
+	mt9m114_pa_ctrl_update_blanking(sensor, format);
+
+	/*
+	 * Apply values immediately if streaming and the selection size did not
+	 * change.
+	 */
+	if (sensor->streaming && old_crop.height == crop->height &&
+	    old_crop.width == crop->width) {
+		ret = mt9m114_configure_pa(sensor, state);
+		if (ret)
+			return ret;
+		// Changing the cropping config requires a CONFIG_CHANGE
+		ret = mt9m114_set_state(sensor,	MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+	}
+
+	return ret;
 }
 
 static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {
-- 
2.34.1


