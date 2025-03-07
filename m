Return-Path: <linux-media+bounces-27813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67010A563F7
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20C081781F4
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163222139A1;
	Fri,  7 Mar 2025 09:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="rSxH4JQD"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE22F212FB1;
	Fri,  7 Mar 2025 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339928; cv=fail; b=PyDuTJoza+Gucbsgpi/Ck8+1zNJdLlYlOBXGq+gFioy0IjJ9MC+Tsu4FN+GdwgYzBWdb3vaTEAxz9NN1d2Hccx41vdc0Zj+l6MphwvX1shSehbmyWpJMrEdoqDYMo1h6mMG5eiiy6dt44jtabsYz4dDxw4Pw6UvnQrmZKvn12sU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339928; c=relaxed/simple;
	bh=Dkr+pAnHom+1qnjfXIntxIyeinqj6BxatODxq71cc6A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gcvhj7kkEqLaNnOBmC1YVa0OdNxWdd1FJ009jcq0wN9Nxu/3ACnNQ4wrIfiyo/r2+yUXxUGJTJAajCCPu0ZpPApKyCifCTExc2lZeOsiCu+uX9GB52Mj/nGG4uEn1jdVazVTcXVHmaNsJwLYXAOJV7BREWeRls/glYIfGKx7oWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=rSxH4JQD; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MH9nlUtzdj5w115g53DrrorSh0WdT3hgAwylmZVMtEUWQWiJTB32xuGtllC/sbkVFZGwXJzIyMArSinfK0+oZRsSuhdSk60TkrrChciF/LQ/2utk23FWp8VB5Gw1G0TUnP7nnkK86M6LHbQJuIdWGZKRQMTDRQtzUcUeN9AczjdQemDK+4VoCRvpBKjaGBiVZTmtYtA4SH8pZ/PKdwJ+sphLa7aY6EZxliPujZzAgIoavtjXWhTOdG3TtJ1eLnqRWIHHmxVtLxNKKPsfMwDcBGGGTSgfPFy91La7/su6ehITk9v7h4f8EyF0rAi0aWXMQfuiFtuXrU/R4suCjAUHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBj7Rt7rd2WVhxT4Ohiz7RBupOnBbZRC2Aazq7L+16E=;
 b=aluEgguhz031vorSVrkiZfqrzFCPLGg+DlGHIKXEWYcd9iCAQTZeQjk9YIH/VK2y+Ec67ZGx1rZX7exTQTGEXTo/xwqvbecl6M3gnXh4a3OeCTRjm5el0IBB9LilEouB4T+C698AMVRttMfioCvw+6zsXA3a66otOP6E/CwDz3E1FRTHP/xaKtkGKFyCGJLjPKiHGlbsPJttObSp2a6eYMFPiKw7CAx4+fcDls2A/Ukx2a2AH+9RR89eCbpgWkZFdLXQBHNUy2kVXqVwg+KiD/isXUm4L3VK/xQphHwNJTRAfpUznqILp/w7FCEVj5AeVWYneFsKpK5xIdXgNwRLGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBj7Rt7rd2WVhxT4Ohiz7RBupOnBbZRC2Aazq7L+16E=;
 b=rSxH4JQDzvLDMeowKk15QBYf6JqJsxDmK0h44D/ehI6xZWd0ocITE7Ievk7V7rq9Uo6P/4JBAbynp53FcvKlXZtSUQY7RVm21D0lXjhKor6AQTYqEOR9QMzgOvxaxMEJuGQ6VqX1hsEuF28+e/5yePDQIDeQ3aJIOccoaHG82Kv7Xu+pwB8HuBxMNuW6SBFMhWkAa5U8Qg/Wt7JwKR4GgPaeZTLZyIwtGlvHfBImJ8mCmvM7jYH5mw8Y91JI1cVEmXiLn/P2bvIxCqJdcshu2YAoeKLuhV4jGoC7oNbdLTmCPdhKI137pt0SIyqwMmneCtrCR+gJTTKpU/yxh6MFvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by DU5PR03MB10443.eurprd03.prod.outlook.com (2603:10a6:10:529::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 09:31:57 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 09:31:57 +0000
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
	mathis.foerst@zuehlke.com,
	stable@vger.kernel.org
Subject: [PATCH v4 5/6] media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval
Date: Fri,  7 Mar 2025 10:31:39 +0100
Message-Id: <20250307093140.370061-6-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307093140.370061-1-mathis.foerst@mt.com>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0011.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::16) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|DU5PR03MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb0f31b-05e8-453a-a09d-08dd5d5ae788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4oE+z+33tHvWMU2Fyc3YPw3FLIGOgMk6/u6agwbY1MI11xguRd5jQRP3yszg?=
 =?us-ascii?Q?8kFkZhZTEyTq51YHiumuHfRNN8mG0oszvyiwlGWHfR6Sfm5VFAadbQ57Ej57?=
 =?us-ascii?Q?bHDS4rHjCyortE/DN8MAveaPT0eVfLWA4uRfCae/FXQuhSERE92qpdWSpqHB?=
 =?us-ascii?Q?KMTJohVTJZjbIEM4zdAEShBoqjc1O/h8SJJb6ZTgMZUvW7tZF0a7wQLOWgwl?=
 =?us-ascii?Q?pgmKLsn0jMc4+QZngxsDG/s+cYHY28pgiVkTxh9t9gC3Yp0YrDwhU9EEyidn?=
 =?us-ascii?Q?cPrqABiViRva4Ed98t2H8d5waiVmGwfyckMtW6lfZjB2RU/B8h7x38jjGUTf?=
 =?us-ascii?Q?2sC7qmrZf7qzfg3vGeyh/jOyfOrMg6TEkM+PvLuL6cypiV4bDYO62sGLj8XP?=
 =?us-ascii?Q?7KvikDtWQpWa51AGkDPsFH+Hb+eQElj9MVDklSxYscSf58H8iqLjWcMQ6X9u?=
 =?us-ascii?Q?v5m3d2uiqSaldWAL4LpzoOnT0BJX9AEH7nYpkgHgkzhterquJx01iCe+uiGk?=
 =?us-ascii?Q?QR0zRqCIXO/sonzXc3GQ1flPIZWD+ZWI9nZXaayokj4OvKoXACKuFXFQW7zu?=
 =?us-ascii?Q?YzZjfySySs3+XRZwR2Wf62m+r/rMNPS9vzPjwD/cp7TGFljGEVqwP0hs+ZBt?=
 =?us-ascii?Q?OMg/AFFfe6O8n8igV6GJdZk+Dr7TKALP+pXRK37OgoJ+aEKtuz4KGDvTxWx2?=
 =?us-ascii?Q?O80RSUMBTfUnMg+LhkitpX1xu7ywYxl+uzbABkazpvO+JBR1l8wjHwCJ9AIp?=
 =?us-ascii?Q?arO8vfgPP7raPq9sFU2bI6yG3wtYmUU7hsSMLicSRQUFFTBXqSGid/tcBRVd?=
 =?us-ascii?Q?Dc2PvqGKf8X8kDzBOEhW3m/4jL8P5tQD/HZyBpxI1N6BjU1rA2qi0wtgM0HB?=
 =?us-ascii?Q?ZDrcPm73OlWy0JZoFdOnRJxyCX1EWAnDjz+ugcRtd1F0/79YAvKlcM1pHYOq?=
 =?us-ascii?Q?t+5KEZWLgHKM4Q5FZSM1rsRJZazj/E3XwVJvdDd0WZsb+Yyk2KEB+NLOkiUq?=
 =?us-ascii?Q?gG0fLTIysGZBcrYvWR/g4UAhoQqz0bIGX0IyBGXMkt7drg+xxa3+baZ93VRL?=
 =?us-ascii?Q?6G+XEfaQ1NK0b0iSv3ZkoEQNpCyoKtNxfDzqkbD8twH6kKv3fc2uxsQviUFs?=
 =?us-ascii?Q?D3+Gx36afspwr4xHFEs2d1j2km8MGs3cdpfxQHv0HojdnnkzD2MdzsDb+GKn?=
 =?us-ascii?Q?dlsGA1LwTAojlTy1TclVyH/fIHJ6IQyDIrUirNFtXL8VqYfBpISlvH68+JKj?=
 =?us-ascii?Q?AWQeHF/el4BD6Z4byj5D1m4zXZ4O3Ljr2DcA1WCz21J7ZyMhzO+CjX7blCW8?=
 =?us-ascii?Q?EPVipeV1ECSWAaaEQg4rnQZ2lqbesINxpAEPgj1mTFRY5TwOv3ptH1L0Ow1a?=
 =?us-ascii?Q?/ljIClOhzXbWN9DJFuKReR2dVQp6RjxR/6c/wBh2VcMah906q/pspO3sgIEk?=
 =?us-ascii?Q?mRrkPz9+6YZkLUQiYNOcbs2Ynyw0O4Z6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h5Ks7aL+poQa5/JSMt3sNwX818/3FSIFc4oAaskNsdj39vyfQVCWstE5JR6t?=
 =?us-ascii?Q?NKS2+fX/1UV8UBYgYqYMAf5YNXzHnWh95nx/cgbWLN8Kx/KKc0TLjhnpzGU9?=
 =?us-ascii?Q?bBSHgCGvWcFQS4ZYmPuoGKmtuLcvYui/KOVDZf58VmevuHyQBz2axwmNT/RY?=
 =?us-ascii?Q?I2fsjPKPhWb5dhefEP1TrQtiEyYqGfBX2ALU1Lt2Gaqkg9X6WI0US3ASgt7A?=
 =?us-ascii?Q?YzbCzo2gCGh5hD+9eJLToMxyiplwZMPd2IZsrckVNU5GTQJGd2aUvxaycK/q?=
 =?us-ascii?Q?7cYVn6wVGlIPEFr+6a4zHJ0RCcWLoxFzVRQjmJK/38HIoxqlWdbCzNP/t6pb?=
 =?us-ascii?Q?qZpj7SFy2PFUMuu6w5cmjKvsJUA40wM8aiPmDFBQ5KeFbBQB1rOGYlUh5w11?=
 =?us-ascii?Q?RqeMl9pC0bYr5GjrBl99mBlUjGErkx1DfqoAJt2augmgyKDGFYRrWsG3HeFZ?=
 =?us-ascii?Q?3frBx3jR62SCUJqOQT32Ssbe/A+hd+37NiX2SMRQVvPagNHNYdoLQTt0NIE1?=
 =?us-ascii?Q?689qtGsZBBj5HwX4HSZoRk+foeEfcqTekOC3bH0JNbGowcqK5HAVnfi8FPk9?=
 =?us-ascii?Q?7HyWgJbC+wYrGOLjnN8SfyoscfkTx/1m5DOOyRtffZjf+H/0H33lZ8Vbalwe?=
 =?us-ascii?Q?5yKXp6ZyacjQvHECvKMpRfhUrWMhD7OQP8h1cikpVSDojZRNmt0QXLYeNmKW?=
 =?us-ascii?Q?HdjTkVBvFpZ1rhNpDowU22u6K9zZxantr3bxSw9tubWeJX4FmahJwhWA15Bp?=
 =?us-ascii?Q?Jh0OWzv/a26siHuXEuWocZ2FMnBPYPzqfeTgzPqNMj60+YLGdUMKVjn3ctcS?=
 =?us-ascii?Q?QJxtNZkrMkBMeXWiOiHEInLLY8NJzjGpFCOSXtY7iVkP0S7hyx0EfTivsRxQ?=
 =?us-ascii?Q?+O10Yl1HGapVdNUlzcDYyl63OJz793EmD0P/SlegmdHnmbFLZPeBICpZtVoV?=
 =?us-ascii?Q?uLArJvpj8mA+hzPhO9xF3D22AvtZh20jn8H7peeZofyivlo1MQNo2gZOWypz?=
 =?us-ascii?Q?6kRUnfRfVL78KlyNrpzoKOs8xI5FcuIuVRPC9huK/blB9/kARs23ZeoqNE0J?=
 =?us-ascii?Q?NUIIHcZDrEPaQ/RouoIENnOPSMDKsu/RGJMVE+j9VBxoPqhGvum+gv4X8sm/?=
 =?us-ascii?Q?BucU1CaK82M6KIDaWWqAQJq6Y65mzUYMc7xm9a7zQaqN8DhxdhY2M04vavPr?=
 =?us-ascii?Q?skqTSxadHpA1SAq37t8nMGTwhGXslONfgmGh3L2/6afZet2Al14Y3tADUTeR?=
 =?us-ascii?Q?nI+UpvpLdAcTptZOHP7otPX6v/DtTZU1+VHkK7f/686fAtB+viqJ5/eGscUZ?=
 =?us-ascii?Q?Yg0TpWhT35ImTaOJt/gWwmjk2/W67PuD6tD8t9cj4uXh23YgspTu8o+X93ez?=
 =?us-ascii?Q?wX+eRjScuVtSVK3+vZ1IXkVwfwwIbxbAnT6EZLgtLOZgwp+iazJpVi4r77kf?=
 =?us-ascii?Q?UpFI/GfMbJzzD6u1FR9noP7F9EWQkv+A7onHVWqRteYKv2k2M4QYOAbvPZI9?=
 =?us-ascii?Q?aCUD7Thfr5tV2zpXJN+yhyFAuxxeh+uSg6BnNz7b5saTzSQ7uck+rvUoencw?=
 =?us-ascii?Q?BIwztSHkrZbDW1bDlUatdHLllFJuHfQf/J6oMH1g?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb0f31b-05e8-453a-a09d-08dd5d5ae788
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 09:31:57.0709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMHDvOnYCNlk0LV5CAgfTBh5v7TcYPWhKTteypSHH2U4xP5GZCqkx/6JX6QY8mRI2aK5AdwSbzf/pBVyKVi9IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10443

Getting / Setting the frame interval using the V4L2 subdev pad ops
get_frame_interval/set_frame_interval causes a deadlock, as the
subdev state is locked in the [1] but also in the driver itself.

In [2] it's described that the caller is responsible to acquire and
release the lock in this case. Therefore, acquiring the lock in the
driver is wrong.

Remove the lock acquisitions/releases from mt9m114_ifp_get_frame_interval()
and mt9m114_ifp_set_frame_interval().

[1] drivers/media/v4l2-core/v4l2-subdev.c - line 1129
[2] Documentation/driver-api/media/v4l2-subdev.rst

Fixes: 24d756e914fc ("media: i2c: Add driver for onsemi MT9M114 camera sensor")
Cc: stable@vger.kernel.org

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 65b9124e464f..79c97ab19be9 100644
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


