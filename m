Return-Path: <linux-media+bounces-27582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE58A4FB94
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6960916BBC6
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174FE209F41;
	Wed,  5 Mar 2025 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="uc9H8QI1"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20D520766A;
	Wed,  5 Mar 2025 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169767; cv=fail; b=dh0g0o7ahu3VzqF09S55ujnKZ3JsM9cnpjWwSbCEMRxDjW/o3bXWoQbaNH2iqb7JocGqmizrvfu3YiGi6X22gt5zJ0R/xTV28w6kXSbf6jZDas5RVLWRh845ArmzFw7dglR0kZFY5oJQgLt7CtJaZQwYRmRwdrSf69lgCOUe8N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169767; c=relaxed/simple;
	bh=Dkr+pAnHom+1qnjfXIntxIyeinqj6BxatODxq71cc6A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d6b1gv2VOdivYzzy7z9WkZERWSxejwuGA9hBAL/bCW866msWXKT6dpMgreACPVxllHtmMoaHaIhBLXA+Y7GZSlPtib+WpjwgTyah1Aphzh7IDoFifXoHoox7IwDkCZDn5U/S9m4omKFiUWNoyG7MX/4YhBFZUaRFq+3R60R4b8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=uc9H8QI1; arc=fail smtp.client-ip=40.107.20.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4Q0T7S52XoWxnof10gzXIIql7TfL5V6Gu6lh4WypkUJ0kPd/EzNQ/FcmJhveTIxelBI+IUGTFOhR1Kn/ejTpaNBkq34u7MGR8Ug7dSGrNs66zKphoOSaoSNrRa63Gx2ov9XmoD/U0up3sPTnqIhPVqoy6sKt2Tm2h6BXviHV0MZ+3+OBlSfKrpwJL5UchZFwkZaONqpcQXcIt6gA2YNUjCtFwfU/SycUpFohOBSWMrstw5edwMwHIty8e5wAklXJY2avfZWQjCHj/J+WtMtGTTe2dAFL+UDNgMMmOR3rak4ozGg/TAVIhbB722hqgA/OUlVpU5gjLGpZX8D0H39rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBj7Rt7rd2WVhxT4Ohiz7RBupOnBbZRC2Aazq7L+16E=;
 b=tfQyIQ+djqt3oMwubPFvL/T7z+YX44+pWtAEvT0uvQjEGTPs7gak1lfvsUgwXMePapdzSHs8WjWmbDBtcgMqbRnKo507YAFNa+EpO3jpnZu4PQRIK6fPohzQj1oZ1+D5ZT0JpaZDxIawPXe85/U1m9gsu0jF2JauBexz0gfzbKfp0atlIGHo+WSht3hKGRk8GthDtYb1YtFutW7EXMzNY36MUDnbPFsIbiDUV/X+RbN72LHt1ofbMsARMgyqM1OlnoWo9yMU/QJHlWSG0Tbm+fGhIlJGTVkVaQpU7ekWFcr1GNV54fHCxbk2sv3utVQSXU6alifomIlmVXOPUD0NZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBj7Rt7rd2WVhxT4Ohiz7RBupOnBbZRC2Aazq7L+16E=;
 b=uc9H8QI1PYS8IgBhl/icEMiXHJMpc1acU+kAJkShL5aFRSiE4XJu8aM+/9ia36yfZlJaFaUFm4hjBzWyBfZkAvQPXUkx6ZetRhS8v9ju2qMFk18ycVR5KsYF9vCn1I9tJFN2hePXL+6adudmOxcI4oU6pcDwIo9P1sy8SnIuVvqVt6Vun8P0kBHzLjYtKEB6jTV72vJ9gG4ScUVBvyS7HULMPCeetcjfNVi5x7u3nLx6if1eH6Ugaauo4rr+GbzDiSXYlv6WXSgYSnsMxNRDzvBj0haEP/v9Ly9YqtT2KBNfX+tZAjAnDeiUkWV8Bc7YIf9/7xxV79XOvtCFTihPTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by AM9PR03MB7266.eurprd03.prod.outlook.com (2603:10a6:20b:261::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 10:16:03 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:16:03 +0000
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
Subject: [PATCH v3 5/6] media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval
Date: Wed,  5 Mar 2025 11:14:52 +0100
Message-Id: <20250305101453.708270-6-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305101453.708270-1-mathis.foerst@mt.com>
References: <20250305101453.708270-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::7) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|AM9PR03MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd20a50-224e-43d3-b7f6-08dd5bcebbf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dDua4JKZmObYEIAK1LZwHkKp0AT68HhgUBsfmoroRPmOvkg2g3ATE80WFaDK?=
 =?us-ascii?Q?p+ef3yp8M4VJoTGNh96MdzwWAD7vS/dGWNHKm89jByvtgmx1Mtj+jwyUWxpi?=
 =?us-ascii?Q?e5sEIaQ1LVI4cz1JDLuVgNYSyFzOealIZA50otIXmJPvTcAq70fq9P9b4fEp?=
 =?us-ascii?Q?W/AzTd54q0dv0j4W//aT5IxA3iPVXIiMCsYTF1DP4M7hXHi0wi2Xn++nSd97?=
 =?us-ascii?Q?qnZf4xdUKLtyHccbsVYmFkG3RP4MfjvGKHbBGi+Pj2Ggu0f/OidHdwlljkTm?=
 =?us-ascii?Q?BXupQiJmQ7YlqnWqgdYmhmXwr2ATifSbkeaoRYKPCEq4QJvOHi26J2n/NH8r?=
 =?us-ascii?Q?SZUY1nbiZ5wXUVK3T0gULTe/zm6RkW2I4g24mCvYbcCQ2RPHam0yiMJu5iqm?=
 =?us-ascii?Q?aTHXQzgPxsb0zcU8hzWJ/68Dv6Co9aLpPq1okSHFAFB2O/92WnKRTTJoRv7G?=
 =?us-ascii?Q?Bx2EcV+b9A1h3LdNqONtpu2FytJM8oM1Pb1RKHKOALY3Kp1QTs8GxF4Uhtrt?=
 =?us-ascii?Q?ecyfNHaYJLSUPyfOAS9Ti+Je/dRV9LcvqctMaEANFdZDhrGxOaLBOOQQ5LWr?=
 =?us-ascii?Q?0bFj7Tp4UcgaOM52ZODQUd+T7/9NyKojDKUsiODvRKuwEJ5D6XXfwYGiNN9s?=
 =?us-ascii?Q?AwgZmVsILYPQiE3XqsciNgPt3BKQJElO+W0C5U6PWLGfmTTx2lzGunIMo9wa?=
 =?us-ascii?Q?uC1YLl/WaXzKrQKoA2j62robAtNVuwjfQRqdXuunMJzNPSeC3KscryeQLv4W?=
 =?us-ascii?Q?gZ5UCCxNjA9RbN5oH7D2kh855mNJJ68fv1i3FgizapSa50fmrcqekx5vm3Ie?=
 =?us-ascii?Q?tTeiUwylB1HH4QVdmX7pB9C9hyn5Br+lLmiX53cHlPSUqq/UrIKKtb047Woi?=
 =?us-ascii?Q?KgzGWDUKc8D1DPYTq8Oz1pLj4GCThOJJYdB7X8ajIiiqbNsvW9XMkbAshqPI?=
 =?us-ascii?Q?bAqFiVGizE6BX1V94RXDSACY/myosxQFAEb1vGbYPtfebUDYhY/SNeLY9geA?=
 =?us-ascii?Q?As8kJ7fnUCoZWAt0Y9Tr9r1h55YcohyyVQAPoW4sXb/yMJsMYjiY09/JIwDI?=
 =?us-ascii?Q?13QraB3dD7M2bJo7pUYsOhZt3pzt35Pt72uP5CR9IoJ5USjL3gx4JinZcn3D?=
 =?us-ascii?Q?lyA2TC88wQlSiPjxcVET+xFxi5SXvYgWNMWN4YVpp0lAnYm2UkNh53tz/rtS?=
 =?us-ascii?Q?fnw+eppJNv198c6465ZzLe+Un6GP1gGejjYr72MVkjM/lYPA+2r25paheTEj?=
 =?us-ascii?Q?ngmEVLqqHSx73ZoT6iBdtxX+/wg4h+pNRS9TvDRyH9XnbGKB1pPQsumqo1Lm?=
 =?us-ascii?Q?1ZG0TYixAORhYDKsr5hbYaaAz1x0SZfHrNm0/Q7gpXTAzG1ifnyf4uhkzBYA?=
 =?us-ascii?Q?Yp65A9CHrUmH6wDWizMLJdAp+Rb3dtU0l31ThZCaFMSAvsgRzXAqRmDg10xS?=
 =?us-ascii?Q?bywADeAQg+bdOh7dAegBEnNve/lwXXE2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/6ubdccQEFliGVxFKlq9R0rw+4OlckniOHnbnr2F/UCzSscewJQSEzwne9bZ?=
 =?us-ascii?Q?cgF/w4+tvCQKiHxcf0S2DkfU7+ZqZQNmpbxkIXAN6McXbE0itKU8KHAyV9Tq?=
 =?us-ascii?Q?gv7MuquMV8uwcrChECBzT/4+vx5LZuoP3/s09KBIux20Xhg7aPaBCrKb0maR?=
 =?us-ascii?Q?/0ONGLps0JzrA/C0VFcOKH8/bDgRldXZXrKxHQXiA2mVSP294gmlr3jZfZlM?=
 =?us-ascii?Q?W8nSDqjskU0ip8lLL3w3LkN62OFfS/aVB4A6z+5aselq+wrZZdRfQw64eaQ9?=
 =?us-ascii?Q?GvSCMFQQDxeP8r/IjAEKq/e0KA7QWGF/d21szTUrPjcKbhfrnFWZT93sZJ3R?=
 =?us-ascii?Q?MpuorVyuiX47oE6sD/r0adF4Pp80YlYA0d5QnNOvg10sCpfgclqP4ZHWPzdA?=
 =?us-ascii?Q?5EUWzxsd6QblVkFQUgWHMnUHTd0nfF4OOA+XSp5H06UhFtB1a5MNI8JSQwqs?=
 =?us-ascii?Q?ss3tJ3VBEV9CADyxCtmpABj06ZBGO20NMczWtRRb7tlgm4C6hvixtM2/7VGj?=
 =?us-ascii?Q?dbHu3vnsLe9fR2kDAc+D/gy3nm0g/lZ2kJjMpsMjmpeQ8qBnyaA0NWFjkvuY?=
 =?us-ascii?Q?8A++Aa7t7McE7pGmE2+JGKRtDTeMl1Ei81sMxqCsmSbyHmIYyJnSmurybtSz?=
 =?us-ascii?Q?mHNo60rlnBgRq4BiAu7BOb/qfqa5ZHQ9LVDBv9jLTaS9KvLZ0BJbbjgDWCX4?=
 =?us-ascii?Q?EMgXfXDa3GVY91asVA6K9AK7ucS0OrGO8BdEf1gXhAb0oG1gDD93Z84JLgCW?=
 =?us-ascii?Q?SkQc/3NUlQDyDoTl75L2KUs357w2HUzAyyXoTlfJMJSfq728k4m/AMpL83vo?=
 =?us-ascii?Q?8mcSVqvPw+u8KfwHheAGJUJpmthgqdVsFLFIcbiS2G93YZxWFYxL8ifol5hh?=
 =?us-ascii?Q?W33dfzYejJ+3XL6dF7Sd1wVMXURtL3W+AhDtRut/PUjLrjSLBxHtbRM2UQS6?=
 =?us-ascii?Q?Ohcj2LVZ2ievx5c/lG2vWt6DSziuAHVXETGkXqNuYOkOHTjanDIs+DeP2QZT?=
 =?us-ascii?Q?fXH4hVB+7gIcqPkiFL4XDbRzz/jMMgZGPIKKlG870OAx+mRbX9Nr0+kqJ1fK?=
 =?us-ascii?Q?woidshUzHU2cBBjggqI/GSrk7FTAoM9d/70KmQR1Zre6BY9Qn99ZKgv1WgP5?=
 =?us-ascii?Q?pXsvSZh+SVLuELA3TqDESZ1EQATjasVu1u9VCl0y0HNbxgZ6yKM3yKZYByvX?=
 =?us-ascii?Q?uEyzsS3mlmFd85o5XgzEpf8RYRlx8Rrs+3X/pK+laCah/EWS8+Wtgpf30TVq?=
 =?us-ascii?Q?NtQvnPFazwmsXaEslA1Roikw+OWc5dNltP1jCmcE6GUnINHZJNJ5vHsGXFK6?=
 =?us-ascii?Q?9Eh3j3jwHdZcHGg+XaLVvb3DLpN0a3NbnaPREOFGz70ohhCN7RF191V4zRAl?=
 =?us-ascii?Q?RmxaB0yTG1srKRdshJ8dXijfkP8nJTyQvRCPQhiUaoqpl4yKqwZCekl4/YLM?=
 =?us-ascii?Q?z8bjjw7drU2A2f3MEntzKPtXmSht/VgihD7Z0cCFLkivkLjAbL/uV+A88/CY?=
 =?us-ascii?Q?gGVB1LA7SV3ge6xqjQvRBFgGudMiMBGgI5HDWUXEFFRND7IK6NLUIts59bMU?=
 =?us-ascii?Q?7/NEvv6B7KndALmkTRCuMlym84VD88Kvbd7nb/o8?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd20a50-224e-43d3-b7f6-08dd5bcebbf8
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:16:03.2974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WZtqFICo/BYpD8P70Mm19LNdR48nyfUcbgPp1l8OzFq5KjITWDl+5VQ0D3EJH8Wn9fmgPKfy9vQlZseubNw7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7266

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


