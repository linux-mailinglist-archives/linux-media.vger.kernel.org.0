Return-Path: <linux-media+bounces-28980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD72A7545D
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 06:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 749823B2E7C
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 05:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206111B3937;
	Sat, 29 Mar 2025 05:45:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020109.outbound.protection.outlook.com [52.101.225.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468743594E;
	Sat, 29 Mar 2025 05:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743227150; cv=fail; b=iv4m6dAGKy18n0IABO7iQTVccrlK+WtPyN6AyvpiV/lrcycpTCtyA/L7edBf06jr1tuvoOtQsTqOncf1FatOePTva3Rjr7XxPCLro4Hoby6iNq+EWns1vARZA6jUrp2tzpsd2jmFCC06O4o9Caz5Zi9nKfO/7RkyWOiVT3JxY+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743227150; c=relaxed/simple;
	bh=rPVwGWkp/okUYcUra2CDOnIa58+TCJ7ngyQn6wAr/7U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J9Nrz185PiIBlL+EOKh+tB3moUO9VEUMT1k9NgA465EEKgZgidTHTl40nrYaLw2Ya75oyjAX1EV15hFxrRVkeFSQyykETdBYL032o9dVh+IyURksHpItbTNXE4aoYmmdEpLDHj5DyrXQqBtHTikNzADx9bTVvWva0M32UHr1hLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZgdFC5nWkb/jgLII01LvrM+mHK+3IeNRkU0xKvNAPkD3tNwNC8jx2C8ftxO+OQ1/u8GXe+yiGXkX0R5G9+Wc8vqTSZx0am1djxGL0PvHe7dnDzo9FNfmVbBxuyN//n8FcA4X9frHKwcuqx/qSBi4TR6IrTwYuKBrjkwq+NsTeLKb/Sh280ij+67/yUykWrVEIRsgEvpx5DlDiGwRfSpmXvlbbLx4nIh0FSrCE1AhijABZNvbPbrVvmykuwU1ygy+MTd+e/DarMOtgqTV7dcYaqYqjIf80FD9mXu/VRkGgCJETa+iDEmz3yjeADQ/92BtzHgPIGcIADlmCN8H3ei6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTwa8Ntzxwdz8fe6nHNlrFg/3ZhPepbq1uokg6Dxtcg=;
 b=o2e1HpFDGABgZyf47bQcYAodZzFAhAIVN4i9kJNi6CkGBcESKUKhJk/cPegs2EjD7MWeH3peX/drZjWvpOwAeo+v7DnG+uazA8E8ZFE/k8Cc3bjSq/XujTLfGCzuA/JoyZ6Rh7BjsGLqa8Z5YrqDJ+P3bEdGCPqwP2ILL1TqozUSsa3yHxObos9SbhslvoitBAiZUtSk/Tn1He+JkQzqrUvoF4+T0W0uXwUm32eUSTmGemSskIMZfEWsvM6ChyDKEhWVjeRGs1lGOXKrLe/e65LNuiqX3Sf+95wX27vZIS3b8RjJIj2V+vdwVC79E7pJm6+/wlQSmWKU0P6GK91k+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1842.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Sat, 29 Mar
 2025 05:45:45 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 05:45:45 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Luis Garcia <git@luigi311.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] media: i2c: imx334: Enable runtime PM before sub-device registration
Date: Sat, 29 Mar 2025 11:13:29 +0530
Message-Id: <20250329054335.19931-8-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
References: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::36) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN0P287MB1842:EE_
X-MS-Office365-Filtering-Correlation-Id: 94bd6181-bcbc-43b8-5767-08dd6e84f383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WFZvgoFxFjMVQIOVuUlabb3pjabQUHYDvsPAEjVTTe/qlnVrbaPunb2eIXeH?=
 =?us-ascii?Q?29/so8Or+YdlmYqEJEkwwRO7S6E8Y85uDW2DNCDexLLSSnfdiNh839cOC0CD?=
 =?us-ascii?Q?ANYwSWDBr/8y31Wa27hpafPZ0IrbJRThUj6Ahai/dGvusmUa5NcKGbvEfwnl?=
 =?us-ascii?Q?2CkDc/TMaTicKjuXeyDgVnSgKn0uOeJlVxALivIsE2SkX8RoVbZufVedOv15?=
 =?us-ascii?Q?ZYvSZHCFpJ7pggqjtulj3pKPGoAEyRGaBqqHtKLYqD+mji7SdKtWbHQTfb1n?=
 =?us-ascii?Q?tvKFSguwN9H7n9c2NVRYcK1dgj45SvmdnKWBMfivtVHx6nyD/uLBl5SwSL0A?=
 =?us-ascii?Q?2bixVk5nz7d9oe3OxZMgb8XV3raZCYT3z771ubXsUwidYmVsCCaaoHpeDu9q?=
 =?us-ascii?Q?sO6iFojvlhhU8/6xilsw3vtqtSPs49Y+okBAqmBMOjl0FVzypnUEU00j+xUg?=
 =?us-ascii?Q?PsDvpmvnMQArRemBCq48iovI+l/jmBvTD6Kt2//JkNOB8gq8fWdr3aMWqnEw?=
 =?us-ascii?Q?xfPqnkYdE/sdLP+rJGZo1MA4GGmmkoPz5dxfdKa9Xk5UB198uRm2H0hhxKPO?=
 =?us-ascii?Q?s97o/CqF6YnUZ5+7BuVhsyUl04Pc7PUG7Tc4IClkh20scrKqP5PRDOypwY9Y?=
 =?us-ascii?Q?wNb7n7a/ZMM5boW6JRfySsEw5pLw39bEwzyyK/RBNWcnJlDCLs6MRxlGIeXK?=
 =?us-ascii?Q?LurTWbX0HaNaa0wmPHoH4RXP0VYCfnfn/wt81endOxRf4d4HgyUYTUydpChn?=
 =?us-ascii?Q?ll9X1DhtQVoguNB0txe0hq4jD7D2/KJ0kgeRQUeg/dSOxcena3aYwqRvttbw?=
 =?us-ascii?Q?2NoRNxVhX+b9k9U9XrjQFmCMipDxRYbvY2F2D4fuwklpeWO2bG4pQFjFPOMU?=
 =?us-ascii?Q?qTvlJSDKoBCqp4iYdPnmeukjzr/P7EDe1VtydK/Z+12ygg19Siz3exe1dyn+?=
 =?us-ascii?Q?Z6A7pH3X0J9COigkDjmOsi+4TT1qS/jstTU7b1d7gsg3UzI4zF3EOrx/44dE?=
 =?us-ascii?Q?2Rt0C/vl4TGgFR1Iw9bhJLrGDsh2ZKmwCi4kKkbE5gnlOyezjswnSrYHS0/n?=
 =?us-ascii?Q?T4WdTXcERq57hDhRaMMEZvbN1ySwdw881IYJk6BKF5XCLBpivlCqia7H2QdY?=
 =?us-ascii?Q?UMcBTKEs252PyrU6M2RSah6Z5hcrodLBOR57NCGMCFOLUH1hoK2QoNM+OUpS?=
 =?us-ascii?Q?ISaasgQSagJBHEbSITLAbBda/b4U1d88WYOHw0jWnh/cEtufn/cwb8kg7IQw?=
 =?us-ascii?Q?HmQTQz838NCvpB2+qvWz49EoQxr/zFW2OHSIyH4nqFMD61Ki206C9lSjMw+o?=
 =?us-ascii?Q?mr9nUVYRTEG5KkkRSbsq2PHNkfKYcidt9P5PCy/hZTdZACXdsx+gVGLjfmZd?=
 =?us-ascii?Q?hDG/ue3T1H0kIUtyvxUZUJp/0gMfkTb1MgLIovajujzyDm1ZJaLS+qtCTLBE?=
 =?us-ascii?Q?rUjjV/QrxX8EaufviABI15GcmDFmIbrkUM9T3pFNwG91+dufDjAx5A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tcxB1mv++ANr0wZOoZqRZssCJbl+w7LMLx+t/LVtXo+XBsYMaiiWpsTI4B6v?=
 =?us-ascii?Q?5RkSNMyWnhhd3CICp0O2nUYRZ4WKkg6IB/ThvxTy7pbOsCSHYKXul2mZFcvM?=
 =?us-ascii?Q?8e1RQ+5UTpQgcpyIyqR+D1sLKLP/yVi4v/vXkhZgMTZUKVSKHaLdXV+Vxe1X?=
 =?us-ascii?Q?2mF75pZ7DvNa8b6VeuoVdI+yFOr2fzYievBqOwBUWyJ/cA2GxEMn2IVKgEJH?=
 =?us-ascii?Q?99kuGp5eSTBqUdUjxyvI5p76Z9hnxfIGXloT+7LmjcSbxCc5/Czczjm+C/ZQ?=
 =?us-ascii?Q?4PPjUtZQRMjBjFMa/H3hMO2+rLp+k7K6GJ5Z6u019PoRCUBK2+XiZFAyHP5W?=
 =?us-ascii?Q?mGwEW0UVovEv1Jns7vbKhyfwPKsF/d3dJ8xqDg6BJithBNEDMTNNkPDBQqbq?=
 =?us-ascii?Q?rdNIxOF+KQLGxdtDfBRrge+ikFAs0Rg6IrCiaCgFBRShek9hHK51uMNJpYDr?=
 =?us-ascii?Q?TOKrKlNRoRqpeIVWBgdMQuhWHSP02Wa8xMMRHTuqNvjQXCYHCI7sxAErbYDT?=
 =?us-ascii?Q?Z1CMRHxEWhsQj3C0iysEyLAZEpEC5AubTTqHIp26CmDYNMaGt4YA6CO8Xj5k?=
 =?us-ascii?Q?KXVaxWWalL0Cig/lkGrGslHGd5po/TrCF272z0B0319A78R9u2GL3XXCbNwj?=
 =?us-ascii?Q?4n0CAztMG1Gtnh9HCDntyIlQ2cn+VNb472mc22QSOpNjbuiGON0iGuVQwOoF?=
 =?us-ascii?Q?/apd7N0M8XfT5+w1m1RSogbgt0mdrOW16Tbq31WzL4pJzqNabT0IRLo019IB?=
 =?us-ascii?Q?tVawDtC2gaWymsG8vAj3WPuWycx64Rm0IWnuze0y9WuyCisShjmAjq6e09nW?=
 =?us-ascii?Q?j2icqtA6acD3MjkTtlKoXb4msn9E67h1fjWDrilXW9cNcCrasN2l0z0pZMIU?=
 =?us-ascii?Q?/lod6c1mbjNV9Ot/AK7GCR9gZr8XsznXfy0tKU2WRyWBDYLb+IzIR8FNYI+1?=
 =?us-ascii?Q?AfG5MyB9aL24OljLAFPG9H2/85cVlckPd4oYbrwmxH4zud5d0lVA06f/HrOr?=
 =?us-ascii?Q?HXB3XiUwW6uPDIVdSrr/ZO4JGG7ugYEpx4QHTW4VUTAw8sW7QQ9QDffNYEqR?=
 =?us-ascii?Q?od8sR0qh+TQXl+f99jVTZb5nLHGq+yKB9U9ZYj/dKp1n3JFM4C5DjWUXb/wW?=
 =?us-ascii?Q?k700iLK1wFJWwiRgis1+jJR9Zam0gnY9xuAtrRWmfRnfoB4xgQU+rxCCX8Y5?=
 =?us-ascii?Q?5fggNOLoJtMCDhTdepH09KEm6ELJhHk3GdZt55r5S4TiaeQe9O//sGPcVMKz?=
 =?us-ascii?Q?LwKXeke9La3trtb78RXmPZbZi3WuQLWR11Ovbv4kQm05clVEe79YbNTicSsq?=
 =?us-ascii?Q?dV0gMv3VvOg9qFzvK6kPwgZlQwOPNMoWSSYdgfMYPHwErb62fE2QEEl/unPt?=
 =?us-ascii?Q?naO9tnaYmqpyMfj/qwD98Pwp+4LOjNhds7wuXvhT27W11eFdlN0IXz/m+Dhc?=
 =?us-ascii?Q?eKPKyCMdlGHvFV+FxE7rgZIVewCK0Ziy9IxsLPrQvG0im6BTJPFzuz99i8IU?=
 =?us-ascii?Q?9SuaonIYrr1IhCUdm4Qkzec/Ty6Hmq8iCL5lhg5n3fHETqI599AjajB4zXlh?=
 =?us-ascii?Q?QjMJFXUJ7c2iaI+RecHBfpqHq23d1IYlymDmc1kS/3fFNkraWxHGbJ6vZeja?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bd6181-bcbc-43b8-5767-08dd6e84f383
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 05:45:45.8072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QVdPRv5LrMowBbgb9DuIc8T4UKD7dvp0aHyIFkAKQYqKZ9Aqlhgd4bxIwRtpEmhXcXUfFDuOnCt7XPprE0O8/05qeoTYdKhd1CI52X/6Bu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1842

Runtime PM is fully initialized before calling
v4l2_async_register_subdev_sensor(). Moving the runtime PM initialization
earlier prevents potential access to an uninitialized or powered-down device.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx334.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index ad28f12c29b3..169c3c4ca9eb 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -1287,6 +1287,9 @@ static int imx334_probe(struct i2c_client *client)
 		goto error_handler_free;
 	}
 
+	pm_runtime_set_active(imx334->dev);
+	pm_runtime_enable(imx334->dev);
+
 	ret = v4l2_async_register_subdev_sensor(&imx334->sd);
 	if (ret < 0) {
 		dev_err(imx334->dev,
@@ -1294,13 +1297,13 @@ static int imx334_probe(struct i2c_client *client)
 		goto error_media_entity;
 	}
 
-	pm_runtime_set_active(imx334->dev);
-	pm_runtime_enable(imx334->dev);
 	pm_runtime_idle(imx334->dev);
 
 	return 0;
 
 error_media_entity:
+	pm_runtime_disable(imx334->dev);
+	pm_runtime_set_suspended(imx334->dev);
 	media_entity_cleanup(&imx334->sd.entity);
 error_handler_free:
 	v4l2_ctrl_handler_free(imx334->sd.ctrl_handler);
-- 
2.34.1


