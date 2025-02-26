Return-Path: <linux-media+bounces-27082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAF1A4655F
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24FC43A4029
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9619A224AE9;
	Wed, 26 Feb 2025 15:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="Fi39l3lP"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B90D223709;
	Wed, 26 Feb 2025 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584410; cv=fail; b=ltDn202ra8WtcK9uTgjAROi6z84708oJ0gUfcLLhZ16qMNfXes/jyXIlOa5o+Y/EyuB7OHNerwVEfZTJhM3uPrjqsR8rr5S1qc0uWT0ogEnH1BZX6RQ0JJnfmlazq0JavlC6s8J0P8LOIcYpvst4ij/1w2eXvyfx9jr1l0wMsyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584410; c=relaxed/simple;
	bh=1JP7aWPO8k6I+YJFty9QOh8eNsl4CDSnlEphFYf4pDM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q27AMLEzM4QLMtowYWcCIUQB/fY9AS4QD5Vltgxa7PIQppdqiqxdMf7EqEVpQSF92RcN2HnY72s2yYH5DN+c9wUcgJmWoh2lIiSzkJBACrrDPff0xfBI0T1LHhpiBfrIbjD0sr9//v8H4rxM7LSPvafPUqhmnhY2FYIzHHSGppQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=Fi39l3lP; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JE2KFniN6mR5ACNAFodaIdjRIR2Jy82trLGevnsuYleEjA4pkdClxHeyfw+5DolmVqzy6qHuf1iBuMXQjmkFneckqMMd4VR3Zs+SchWO/Cga/LUCoCeK052gE5AXVVawlK2l9yEN4mgCKEa8Qe0TSI/XyhXiEzpLstexGmjGVo2IaQu1a/c58KTqQaDkUvmgmwRwLJ5ISKh3CeVbcUA5qIehM3hASQAfZXQuwm4dOpvI5CFGhBwKHAFaYRgoZPKkychyvHp7LqbCsVQ5QIbaVLS38thxk5lI39J9A8Ukuk662FONDGF72+FFXzZTtAN2M5D4JlLVyfKKZFAvEG3MPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T68x65wRt9cDRBjngyWaRSvAYHHwASzRV3dYdWYl334=;
 b=WiLCn8Ixz4DBPNxqBIlnjcxiWzI4Flww9bxXiqRCtzwz1Q00ne1asLCkcsmLFkP29FPOEuNlMLdi3bHUZwx0lmoF63hME7Z0dgI5DtQZnOaJYolQWULPM76kotMzrttd3TmXa1eCB+MdskOevMbEQa7gnIkvzsfp/ikA3Jj02btBJoPT8MMsj3hKi2uIcJ+Sz2NRmc4Aq5+hL6czsgx+QDKonRZ1RzxP6CY1Cgo8uRd/QYkL8o6wib3mwpuV55RJo9GDfdfRkVzvp0eds5BnMzoo8tvVZDPlFSFRFQTllMW6hQG6t+mMhYHIhdnBat7Uhd8RAf++EgRl5O98SESJXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T68x65wRt9cDRBjngyWaRSvAYHHwASzRV3dYdWYl334=;
 b=Fi39l3lPb8SU9uad96o1dNN4UQoADUwm8h1d0jmXCHF/gSnuLe/7hUmqp17LfLT8D47DGRqbR3oddIql1b5Nkdd7yKFMUgKA4GrPxJilUgvnZcb4pPpyzehakfwZvKGHyotIoWjnuoQL576tP9z7n0RomXGDQG6b2NsGppJq+HwCveWoZoTfay/xg3TNHk5snDlJBlkcj2OkvD7u8ik0QCRdYyFPty5gvh0bKBACsQ9D5ZeAjj7x+Is33VUwCbV10+G8fikEwhoN2u1/olOeDginR2VPdaXenY5CeyehuRHi+uNfF2KtpO/W9tV1uvTWLxgprOgx4YqlEsmk7R1V5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by GVXPR03MB10289.eurprd03.prod.outlook.com (2603:10a6:150:151::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 15:40:04 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:40:04 +0000
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
	manuel.traut@mt.com
Subject: [PATCH v1 7/8] MT9M114: Fix deadlock in get_frame_interval/set_frame_interval
Date: Wed, 26 Feb 2025 16:39:28 +0100
Message-Id: <20250226153929.274562-8-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226153929.274562-1-mathis.foerst@mt.com>
References: <20250226153929.274562-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0057.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::14) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|GVXPR03MB10289:EE_
X-MS-Office365-Filtering-Correlation-Id: 34030cd6-cef7-47a5-2e93-08dd567bd6ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MWsQgaihr0I22+uBIqT3WwTOAN7VRXNG32z+dE0NMQN1MTkTdSc3JTNKNAy/?=
 =?us-ascii?Q?kHMB1uWNcPcpa1yljL6gM5juA3/FKbLkGzpwDKMkACet3cjdnysrbzW05Pry?=
 =?us-ascii?Q?3UkfW+d8e3kKrsuvVR6vHdb+FKGDhmqvIC5ojhjLENG2Lwq85ST6QSKaKTfB?=
 =?us-ascii?Q?2+dqfzQcVkNg+OFYiqrk/tn/pLFISl9+vYKmXBCiZpdTfpWjKLPUNkfyNTz4?=
 =?us-ascii?Q?rmxifdRooj1lrgVKjvcfeTiP2EWZfdqGSzEW9GaGvgDGQSKvYnMBlCNfadAd?=
 =?us-ascii?Q?Ws1t5J7bMyuPKpWoHIzbzBtAD6eJeXidpJNAh9I8lQ4Dc0FuSQhBM1nb81FK?=
 =?us-ascii?Q?H+1Pi04zyct7YRT9BqA1zY9eB7pIzsbkaDhw+Pl3f+LuI2pByA5dTjvtOH3E?=
 =?us-ascii?Q?R6+6pNqWDzb9lD8CISjSBcORBalphJy9sve7o04T2wVW2boQL7gFP1OVM90Y?=
 =?us-ascii?Q?77AMYGOBFPcZVrHNWWqxRUEaurtYwzg1J8+dr0iI+b2dvzI9YBjVPzOsMIeN?=
 =?us-ascii?Q?bOOwoTxDMnc+T/7FTitUSRs35a6AtLSg0z5Fc8JSXol2eSwxQc7SRVPsYzbU?=
 =?us-ascii?Q?ro6fB47eiUt93Jkt/JWBS7wlF/XWxah/QArIQSi8VHLI1ZcY+uDO4KBImoHe?=
 =?us-ascii?Q?8UojEsiwxMnwuwmekXQr9CaNOspsK0xMUYvUY6kTtm3IBOiFJ/CyEqaK121V?=
 =?us-ascii?Q?ulvynamN779YEYrBRFhXVe5E+7ogl8IkROrCxQgZdWLly055Appd60z7n5st?=
 =?us-ascii?Q?gtvmXsrFuvbzrUkEypwxzFYI1hPnC+DiLeC8teLgJYv2cDaUXUSj5xTihjwK?=
 =?us-ascii?Q?htuCptY6ScdyIFXDRwT5Sn7aIDnQYTRukL6rDgQwJTgDbMJ2MFQE5cv8s2ak?=
 =?us-ascii?Q?aCL2qph0EAbwk1s51ajkwcBWj70/u1D4EYgaFD+dn4o4Qkj0niCO/LIKIdWS?=
 =?us-ascii?Q?BaeKpcNOV4Ym/n0evSt/h7y6cZ+VHkuRMvgMCUSPLjLZQSTntOlW/0TyCDCx?=
 =?us-ascii?Q?nvBrK6fYhIoLHeIvY+f90sG5/veqh3DuvgnkpWC2Mio5oqhYndV1tbC1Jwos?=
 =?us-ascii?Q?FtgtZ1pVt+SpNR5ggxYuOvIQ0aUqe7RKceURTz+SosmWeWEd0XPAPajO2LOU?=
 =?us-ascii?Q?2soaRcmt6UpETzx6PqYo6zEyFtcUY0KaS/QAd1/52aO2YCEJ6p6KHyxKj62V?=
 =?us-ascii?Q?QXqlAxSFQZ9OE7+YILCEh6nY4yuqqOG0d7qT/tvDvKS7eQi36/p263JGQGPv?=
 =?us-ascii?Q?fw/i9z1FE7y7OFxX6BhrTM7r5BzxKnSX+lxL9fS3zozxia8MKdTKysf+8byI?=
 =?us-ascii?Q?0ay+Q57lOLBKbzKSzwSeV4fUhucAo374c9d3k5jNSb/EokuNhbJg7wXcJagq?=
 =?us-ascii?Q?ebMK3SbS/jW/s/1kaB6I2wUafn2C+L5L4JIuzYMsCgFHCAbcKXogZXuqQTtp?=
 =?us-ascii?Q?HdeO030rpCttJSvp/A4zEsjXVDgXhU7x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N/kqhDbe0yKw7cGIxQYgLKM4/qu7zsD6N4XWYFY0k3tudzw3Ijy5lYH5oXIp?=
 =?us-ascii?Q?wgA1DIcX0+ab6WjbQWX7OICLXgRqAiy+krz7hJ92EFVLNPOXhk+QEE04Ru7l?=
 =?us-ascii?Q?YY70MVhpHl5YmUui8Y0c5d6mcYqaA9e89l8MjTgOZ9hznxRW1Eu7G8qR4qiE?=
 =?us-ascii?Q?fT4W510BT9gFWKhBOiwNnShg3RgRoaRBc4c3vb1v5mmm6mUzQXP07bKFnQ/4?=
 =?us-ascii?Q?rkagbME8HE6+MsroEmG5HVWIvDP7WhM3pnozHSDMix9lF/KHEEZwbErWBtvX?=
 =?us-ascii?Q?8FPHvVBSA8FnsaxWEajZehVaG1PmLpM8IZU7CNxFfRImJTchfgBXCTBjAkkV?=
 =?us-ascii?Q?U78T+pXcTvm5/PlH1bGcYFq6JLzjegd3b+zAj9++ssEaXhcaN7p8aOo7YSfP?=
 =?us-ascii?Q?AOwneAxgYjeuCj/YSUqaFt822tEmofELZ5TAQC02MVK0a+Xy875YFOYu+1ZJ?=
 =?us-ascii?Q?mvlrb3mq8sxJi3y0nSDp86m5/P315paoNxE+gzkE+b5BKR9fA9kZI9/+hfsj?=
 =?us-ascii?Q?5Zeq1I7D/bIe7Xt0VM6aUZdJrSBFsk+NtFkiF6abONIz2GxPREoyb8vzXCcX?=
 =?us-ascii?Q?6XDatduo0BVg2+MbrFcmgD/uoI02dc19+Na40OtVJR5/lE5+cJQhIW1BR1F0?=
 =?us-ascii?Q?FHj1bNyKwN2BxXJb6QUKsh+tlCT1atS8RnV/ygUGwxqOYGbsdOPVKScAZo2t?=
 =?us-ascii?Q?U7+D68ZsxNhViiO4Rff/lYTbgRLqskgs+qPhO/66Di84f57LTNWX8H81TFkF?=
 =?us-ascii?Q?9Tkr1p102RELw06zZb3kLTEeUqDZqTxzVcbdHLICTm9oK1T0mYQPABbSzNH+?=
 =?us-ascii?Q?ZuTMsFgtaGNLqe2D7u9S+ZnLpj48gOIwBzEi09ITA581sIe+WANqu/dTtA9u?=
 =?us-ascii?Q?VV7cOAmlXM2d7Bl6U+3hV+njtTeJAPSGBOpPi7JAk8PfSfM8a7geVJVS6HCx?=
 =?us-ascii?Q?d0O7NubLvNFsjA4ZEoRlecqYkzgifkWZEYwU1Y2oy20ZDLt4oqWPPio795dL?=
 =?us-ascii?Q?cm63wkQyKao8DbtjMI8G9ii4jwodC0jW3El0qkusuDEwwSe9D/LYaBvaqvCw?=
 =?us-ascii?Q?duEXxSqes3VnsVA55s7IAuUAaCxStkcFKXOz8OxglTyqFRVApIV8RDni0ggu?=
 =?us-ascii?Q?VQ1gLeJ23IOE92HxGYoc5mkM3YnYDjfy7UK9NzVSJ67+XK4Ph/tfSdWZuK8O?=
 =?us-ascii?Q?53ywL6CQJHunXjGoIBcOTJtEsizSzzdKDIP65Sb8GJvbQNRQfzOuUeRuV54e?=
 =?us-ascii?Q?uLj6JHI7Je8stlghuZpVOw64uCIs4WGG/VQfw/oLs6JpdZ4oPeIAjR0SRN3N?=
 =?us-ascii?Q?jJSKHHM7ZiPZ3n9jyYvfJsuHMcWWfGKeYlqlmm0YKyAGm46W+TFAmZzkcP/u?=
 =?us-ascii?Q?NKimsxaPyvnDosYLml3rWHRh0nfT/kkLuWzwlBpqZSnTpebd29k468DQ0hoH?=
 =?us-ascii?Q?YscvQZJlVAbl6uRDYgIzF8I+jVrraumoOPV6ZTyqyo03Exa03WTbrWcxr7kw?=
 =?us-ascii?Q?Gz3tGUh/05FaPvaxnLq2xifjxHF3HC1obyi3xq5Gig9ahhSCW4riwdmEePm8?=
 =?us-ascii?Q?ACGBBLcTwKNO/9hOB83gjPMy7oQIyQLdq2iCjtENReYuLrW9CP8/HuzQ+czi?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34030cd6-cef7-47a5-2e93-08dd567bd6ab
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:40:04.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpyC0pr0Pel6KfpFq1dy0ly21jy9AhOY0NvqxbzcU7M3OjieEeecizSyMLJehxoIHmh67h35UoAe0UjnaalOKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10289

Getting / Setting the frame interval using the V4L2 subdev pad ops
get_frame_interval/set_frame_interval causes a deadlock, as the subdev
state is locked in the [1] but also in the driver itself.

In [2] it's described that the caller is responsible to acquire and
release the lock in this case. Therefore, acquiring the lock in the
driver is wrong.

Remove the lock acquisitions/releases from mt9m114_ifp_get_frame_interval()
and mt9m114_ifp_set_frame_interval().

[1] drivers/media/v4l2-core/v4l2-subdev.c - line 1129
[2] Documentation/driver-api/media/v4l2-subdev.rst

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 5c0a8a940fd2..f96f6c010e1b 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1644,13 +1644,9 @@ static int mt9m114_ifp_get_frame_interval(struct v4l2_subdev *sd,
 	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(sensor->ifp.hdl.lock);
-
 	ival->numerator = 1;
 	ival->denominator = sensor->ifp.frame_rate;
 
-	mutex_unlock(sensor->ifp.hdl.lock);
-
 	return 0;
 }
 
@@ -1669,8 +1665,6 @@ static int mt9m114_ifp_set_frame_interval(struct v4l2_subdev *sd,
 	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(sensor->ifp.hdl.lock);
-
 	if (ival->numerator != 0 && ival->denominator != 0)
 		sensor->ifp.frame_rate = min_t(unsigned int,
 					       ival->denominator / ival->numerator,
@@ -1684,8 +1678,6 @@ static int mt9m114_ifp_set_frame_interval(struct v4l2_subdev *sd,
 	if (sensor->streaming)
 		ret = mt9m114_set_frame_rate(sensor);
 
-	mutex_unlock(sensor->ifp.hdl.lock);
-
 	return ret;
 }
 
-- 
2.34.1


