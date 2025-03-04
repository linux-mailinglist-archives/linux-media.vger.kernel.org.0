Return-Path: <linux-media+bounces-27458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 409E9A4DB2C
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71C313B3A1A
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C472063C7;
	Tue,  4 Mar 2025 10:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="gSuplPGq"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D88202964;
	Tue,  4 Mar 2025 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084716; cv=fail; b=PZ8J3WJVrPaQoitg7OTU069L+LlQDsIkNLWnPnxRBnC9ZDNp7cuxElLu/ptyfPYHAEhthuBOORad2d8TTQPuHHYpwy8wLjmkVpBMInGxQY2tIko7FpOgAfhoST1Dweeaevl3MppFnhuGfNkp48HK58WXWzOq+2kmX5CbyuzJU2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084716; c=relaxed/simple;
	bh=3h/tOrfPNw+Iln9yjiDDqK8691nRjvFCH5PO5ZRuzdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZYalxLMk+o9HvOnvkG5hCZafvWx4CJdY+CgTkkP5q7eGnLkPkzV/kbWhHryXXqWDaLfg6Lu6YOGZpVyhCdLw7HfDDSrvNdVOA7gmhe0LvedVhB7RNCFUNRirOsWDOvN9/XfGI7akGaSrv5cBmS7nsU//pVH/cpvOe/ZjqF8Wl1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=gSuplPGq; arc=fail smtp.client-ip=40.107.21.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4ydpqUy64A6pWeTw5cz743mBix1cyghthLhppeyWfUeMcRsWEBn6nF4E4K8S6uUUQP35/n0IWIIG6qhfZ8DnO22PQR777uHKeAoENcB0hQh/xlsKSa/yC30TOY7hYN4LlRSslHBV9bN4KIf0Da2Jp+WyXsXX0Iavv0oHQrwA4m1ls276p/fALIj/NziGoScgDuegYxQYn8VACtxIRCy3Wsem1EpbqKTPL82I0i3eFatECunKapDllUTbgCcMJhSFlhpHd8cukT8rfj6z54TAivD2GbwON5UkzfimgTqcDiAHZts4BOa+nDowfa27F0jg6gYImKwNioFALxV6WmRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LF2d3dZHWL4GZh7gC1xWXm7kUt+pul+NNcIb0b8Mx2s=;
 b=vpBUaQS3JdNbFpF+TwGr5zfGJJwRn3V6mxc7lyfR15hLz6oFA+cS5VIQj3Tjb9Lwnl9Z3IVOBv3eH5LDbswHpEQJHE+mGPEpznKwpeDawVlqD0pceHulDLXfwozwXPZWLUORMYbV/Jv+jD6x7R8lWRgqEK/IQEopvMkZphMBiGzWx+Ai+nBHhVeI0PSydlaUSEfAY0MuNmcIeQrOff+DknJb0K1+K2tLXosJviMuPubyvS30M2AA0u1OlS3ZEXePPDSJh6Ynm2DW5GYe3KDmuATj2NAyQdHPFVlT6ttmkbvJZe16cG6RsU/Ti9zFk2RAPRsTWnyUdGMyvmmgr2EJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LF2d3dZHWL4GZh7gC1xWXm7kUt+pul+NNcIb0b8Mx2s=;
 b=gSuplPGqWy6lPrLJReZ9ufG5sN/+Z4cVnry9xeAsZvkWQ7PVOi/ikA9hFoUXVEklu8RaLSVFHtlrbvNe96/grInBwzZdyL0rUUmtgJ4lgtmo3vuHRGjUV5Gc52mY60c6os8NQ5Vb0YnwfSbusboLxhgmjMRRc4vXzRquPxRufwKi0QssAb2tKbX7eGPT8HJniND4KRXAnvpfj4e89zBSOavCFOBsKX87TT3LIvBky+WPn9RZiiS9Jp7fHnKaMbEw03GpQqUsaWBehf/5rWL5zg8fUPTdFrB+22/E2nkm+Ac+pin6QAzgaQnoGw7WS5OkYJim4mXopjMXeMh/G42raQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15) by AS8PR03MB7383.eurprd03.prod.outlook.com
 (2603:10a6:20b:2ef::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 10:38:31 +0000
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd]) by VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:38:31 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v2 7/7] media: mt9m114: Set pad-slew-rate
Date: Tue,  4 Mar 2025 11:36:47 +0100
Message-Id: <20250304103647.34235-8-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304103647.34235-1-mathis.foerst@mt.com>
References: <20250304103647.34235-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZRAP278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::18) To VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR03MB10400:EE_|AS8PR03MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: 47000a53-ba1b-477b-2e94-08dd5b08b555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k+MDBnLeFi9LMKO3m6ZiEwLg6gLnj06uw2u/BVlBag/nguvvyNLiJ+jg8hzk?=
 =?us-ascii?Q?fjD6yBlZLrmAiOteEaxnySclYb1iuj2vw33XMeA8ZP0hv4KyIPmeT//4r4xO?=
 =?us-ascii?Q?0YmeLq5ARMsVmySanA+iFDvVUN89hdeHfvK/xR4OVuL8v1wLyDg0C8wlMYjp?=
 =?us-ascii?Q?y+9q64pjjXvoQa1AOaYsDRU99UuEOs0c6sEc/ixBcnRLTrp/MfegXxhTeJGv?=
 =?us-ascii?Q?vwTtr/VRUfKNsvt7CbWFuoiPOSWW8hU/lOeI7lov1W4mGbKMFGOX1iJpFDK+?=
 =?us-ascii?Q?ALNjptdC7KHAgzGYDdmCTwDtoMXZFzxAio7bwa6Xh0PIq7dHWy4nMoeSONs4?=
 =?us-ascii?Q?pdYboIbFnkzigHuQQNU+hbO1M1IFw1xyFlCEY4mGUT1JR33UAaTdYvpa/Ykw?=
 =?us-ascii?Q?5yoMmJH3BgB0P4igxcN+4drCZKuRyCW5kCoHrgrWc1Th72thvQ+ycRkOJ1qs?=
 =?us-ascii?Q?UAjOpId6xxjbKBqb/VvdZ12ZqhMD8JBwi+/WWCLvTYw0t4O11KZJpSx6/yOS?=
 =?us-ascii?Q?z5Hpi0WVeIEcwFqQEoIkYgUipiXrR9NaxZ0kOrr3Kwn23ufyOhGxIZ3iVXBJ?=
 =?us-ascii?Q?Nsv/jU9Hay8fM/wgTU9wt0OlyvVQItVSHBC/ROv2jff6ATBquRlnisivPB3d?=
 =?us-ascii?Q?oAqj5lZZZR/c4ZTodYKi3caqJfiIFF2wgvamKjcXMzffJpgAZ6Yc4YUVUlde?=
 =?us-ascii?Q?fWNgJGvEPAjze0e+OPxH4DLzwiVURMFMEJeuqQC3SZ7KAyz/3bJMBslR2ao5?=
 =?us-ascii?Q?qlglqtW+/pwZQqD+JDaoylDu4P3FR25IUEVAVGbpV7ytOkZtL2crf6wzXpQI?=
 =?us-ascii?Q?T3fpf8BJ1ujs+5C/RVksgA5TtJ0qpLxSR1zgijjmEU6sItD2y9AhgijKshxr?=
 =?us-ascii?Q?C0WIRiNxiFqzLKB54h8XG2F1uMpinzFJrtuJR0XNnHFx2+kp2MTQSp+FfYlO?=
 =?us-ascii?Q?l1eEljkbyXDMs9ohQQdxrrdp5Un7tC2cZkXPRTACqjFv6xxNK9N7fQl8VBQS?=
 =?us-ascii?Q?GiEtJzJBdiTUNETPvfsv2iLWSUVao/aOItSHKK00fUMKcL4xpr6n1pLfLpe3?=
 =?us-ascii?Q?4FbOxXtWz5fUSetmhML36Wc2Hc7QPjxel7t/NqBaM4P88QJIt0TpX2ygUlgh?=
 =?us-ascii?Q?4LEKORLeuLVfJQwMUIoVWQGtcKkPoB8gIWDdFFDK5eqFS3+sqP2H94sHr6ON?=
 =?us-ascii?Q?YinDPAN3ow6SFHXJdxON6Dvcpbhy1XNbsZc7xlBXyKSeioQvQMNqmS9D8Wk8?=
 =?us-ascii?Q?sLr95KALIaC6+RuZ4gsJiWOsfQ5Xb3UhnAdNLdKR2Ds2Tvgp9lTTYW11+Efa?=
 =?us-ascii?Q?t/ZWga/w4fME/nYs+xLzhc2Met+8XykD+9B0C6DICfagYoq3wGfhUpkgFEOz?=
 =?us-ascii?Q?qpEcKIaM3S+Yc9Tp2xAmK8RlDyfEblgsOfgMtRAndvAry9k+gb3p/pev/2Tu?=
 =?us-ascii?Q?4aK5XydVI2agnmdkvv2SNfzf1W4Y0VLQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB10400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cL5qApNcYOt6/QSDUjNzXwn5PdTk/DUqjdeGfQaWAbupau7tYE7XnQhYSeaw?=
 =?us-ascii?Q?rsgf/9XzLs8GA1zlxgYKg1v7RoIDM8viEjjsKQ1Z9IohMw4lp2sSu7N7m3Ca?=
 =?us-ascii?Q?uKuj7l6aQgGXasjeie78EVdHcA6K8v131FuTFVVKaEx5NCJvsPSx42edD9GO?=
 =?us-ascii?Q?fPK482kzZix3jIPN5zJ/5mDY9pvoi6cNj6GubMIjPSj6SuJM0YWx5sfW85Ch?=
 =?us-ascii?Q?7oVYywHl/QxVzyoZsGNk+EvXdxd6kzk6mppw+unzGNR+RZ8xb3HHI2vK/pOA?=
 =?us-ascii?Q?81PJB3U1+6kPQ7FDynWJR1t3Iupfkoh9TwY+kwZrXSR7zDSmKxKyS+GnJ4nv?=
 =?us-ascii?Q?Uj2quizAHgob/824kjn0RH5C2K/FVCj7ziWU+yUkWGXJBmrNKyZ+ipaUyI+h?=
 =?us-ascii?Q?iTaA6g3/l3bAWcRSkmE0GxN6Um9zYwx/dE+mDveTejZQzH/4cDMvmyreZiED?=
 =?us-ascii?Q?TmIXgSHuy6uMVuUVn83JM2U7QbVbQEUYXodnQbe6LzX7HnADCcfeLBYiK8t5?=
 =?us-ascii?Q?KjKcJzyBOwMCfbLHDNWdKQruJQDXAqShyE86Lj0FDj0u4BUAACOBBIx+Ruyc?=
 =?us-ascii?Q?RCBx1v3XUzHGORcCA9a6YsxCldMtr7byjAyYhslIZvVNlI8esS/vci3aeB52?=
 =?us-ascii?Q?itRPN04hmZbqRlA3dwOEKKBu6wBUIOTn81fA4bgvU4wmDX5v2M7Hl59jt/zQ?=
 =?us-ascii?Q?FWl0Sp9e62NmnC4UrFsqqMbVuNOXbEBgeOvhwjKpdDwFIiflNCe3UkeBvkP2?=
 =?us-ascii?Q?DV4gGiwKBlhW1eem6p5HGPf/6JniaOt2l4JuNM8XBYZpq+ssPSu49w6D+r2X?=
 =?us-ascii?Q?VSWKQEqreSjMdgOchRL3hzIRz1axHCB/KiLEwELNjdfDfHR+ersixOwhx72m?=
 =?us-ascii?Q?azmi8jyJ3Rzar6D6NLGPqB+lnwiqm4jCo8p1optB5ekoDEN2iwpFh5z5V7Mf?=
 =?us-ascii?Q?IHN4b+ZqIQJc53WWiDPeJ4hpdNr9Wd2bkIX5AJny2qNtW1Fs3MCpT27aPlNn?=
 =?us-ascii?Q?lQoAJuOGi8WRu+2K4EMlUDj0DlvlONHW5drpI6OMNLK33bdSq0xdT2sBV87u?=
 =?us-ascii?Q?qk7ZwF8Hc5TVPuCrffWBoJxmyT2ojS5/P7PtdDW71sc4jR9kQVupyg9HV5Ja?=
 =?us-ascii?Q?5MqNz6C4AHGQK3mB/vnQgq5Hm2S4Eram4LAow+c/64+o2/Vsmnu0Wyvat40d?=
 =?us-ascii?Q?gHQSeISE0s59YLfk+eGm4BmzYs5CWcAUrOj4aoi6nEr80TCCc3vd2mdYmEwe?=
 =?us-ascii?Q?2Xd1/350UQhti97HbM+OVKn3c7B+AIozLkcHOllgOIafF228CXry49lk4kly?=
 =?us-ascii?Q?kOVkOM9u/pDKOBaHUck0X0wDvO9agN3aRVl3JJHyAntpuO1jYBQ/vmmHxAaC?=
 =?us-ascii?Q?6ujuZWL6t3pCWs4pS4qCb2UkHOlWHaR+cHY8S5vGb42Bas3GqzM/fJ1R+1xz?=
 =?us-ascii?Q?4YJlStJAUXgZgArK4DHQXqTm1CsnTAEWpywVXys3jod/ChJ089sEdi/w2mOT?=
 =?us-ascii?Q?3p/L9rvKEXRBEr/x2Bme26GhFAmsin03RCsalir27mjs6EftASm7DVrYqZR8?=
 =?us-ascii?Q?hNtXpcFtP43roZ+QAD2yzQf4/wPx3bZoRyerNXZW?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47000a53-ba1b-477b-2e94-08dd5b08b555
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB10400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:38:31.8188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9WdCv/G1x+VHM4GNw8hLEStg2PNspSUfqBxWLrcCmQyiEMHmrl9mYJWaeZ2ngK5OUoe6+H0djOztsrKO5n1I3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7383

The MT9M114 supports the different slew rates (0 to 7) on the output pads.
At the moment, this is hardcoded to 7 (the fastest rate).
The user might want to change this values due to EMC requirements.

Read the 'pad-slew-rate' from the DT and configure the pad slew rates of
the output pads accordingly in mt9m114_initialize().
Remove the hardcoded slew rate setting from the mt9m114_init table.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 9ab1147a9aaf..93e220854d20 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -42,6 +42,9 @@
 #define MT9M114_RESET_AND_MISC_CONTROL			CCI_REG16(0x001a)
 #define MT9M114_RESET_SOC					BIT(0)
 #define MT9M114_PAD_SLEW				CCI_REG16(0x001e)
+#define MT9M114_PAD_SLEW_MIN					0x00
+#define MT9M114_PAD_SLEW_MAX					0x07
+#define MT9M114_PAD_SLEW_DEFAULT				0x07
 #define MT9M114_PAD_CONTROL				CCI_REG16(0x0032)
 
 /* XDMA registers */
@@ -388,6 +391,7 @@ struct mt9m114 {
 
 	unsigned int pixrate;
 	bool streaming;
+	u32 pad_slew_rate;
 
 	/* Pixel Array */
 	struct {
@@ -645,9 +649,6 @@ static const struct cci_reg_sequence mt9m114_init[] = {
 	{ MT9M114_CAM_SENSOR_CFG_FINE_INTEG_TIME_MAX,	1459 },
 	{ MT9M114_CAM_SENSOR_CFG_FINE_CORRECTION,	96 },
 	{ MT9M114_CAM_SENSOR_CFG_REG_0_DATA,		32 },
-
-	/* Miscellaneous settings */
-	{ MT9M114_PAD_SLEW,				0x0777 },
 };
 
 /* -----------------------------------------------------------------------------
@@ -778,6 +779,13 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	if (ret < 0)
 		return ret;
 
+	value = (sensor->pad_slew_rate & 0xF)
+	      | (sensor->pad_slew_rate & 0xF) << 4
+	      |	(sensor->pad_slew_rate & 0xF) << 8;
+	cci_write(sensor->regmap, MT9M114_PAD_SLEW, value, &ret);
+	if (ret < 0)
+		return ret;
+
 	ret = mt9m114_set_state(sensor, MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
 	if (ret < 0)
 		return ret;
@@ -2376,6 +2384,8 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
 	struct fwnode_handle *ep;
+	struct device_node *dev_node = sensor->client->dev.of_node;
+	u32 slew_rate;
 	int ret;
 
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
@@ -2404,6 +2414,13 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 		goto error;
 	}
 
+	sensor->bypass_pll = of_property_read_bool(dev_node, "bypass-pll");
+
+	ret = of_property_read_u32(dev_node, "pad-slew-rate", &slew_rate);
+	if (ret || slew_rate < MT9M114_PAD_SLEW_MIN || slew_rate > MT9M114_PAD_SLEW_MAX)
+		slew_rate = MT9M114_PAD_SLEW_DEFAULT;
+	sensor->pad_slew_rate = slew_rate;
+
 	return 0;
 
 error:
-- 
2.34.1


