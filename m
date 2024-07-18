Return-Path: <linux-media+bounces-15107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B819346B8
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 05:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F347AB22C55
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 03:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8967D34CD8;
	Thu, 18 Jul 2024 03:28:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACBA7E8;
	Thu, 18 Jul 2024 03:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273338; cv=fail; b=VorjEl6KM20LlMlvFCX7iYVWm5JX4fh8j5BxrBXQ48g/6FwORf02Ao6uLStCd/sWUYCihdULh+0clpWUR4Jk1NrcqpJahp2YeNEx/RR6unZmYH9ZhaV9Vozr4stUSA3b37daU2y41/WkKyhTQCDdTzhtDT9jvzWeNTJMYsOjMDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273338; c=relaxed/simple;
	bh=BHPxJsW/s01B8jimg4O58Ul9iYfrotTN6UJwjta2b7M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fiSne1RompraKGweoXcKUGbdtq0yU7xGyI41aYS9MsFjZcJz0i4EO8O7X+d7gQk3u6QIC+dHpfLCc4VMauXNaykHv8uHEoiaY2jjbtBIxLT4BLCEjv81nUjfdYpWJ2Ued2cMab+T8NLK+fknPekwYO2jkOEsl/Ul9zVZYKz5WJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuKQzeW7jzGs3bPMvn6MR4poO85QX+pQc27/ApRFad5qFiax5GCEHo3ywdqnjK1gB+vqUz2RiKZvLoEwtQ2zPph2HHEE0JUYaBSG8C9iCFCT+19KPK7pHsdxbj1unwbLWZLxYe6dLGDbRWs8eMOLyv7HcoazaOdETl9KEP1RpuY+yfr7ireiw3ADavIQ6s+gQlPm24Xbb2WwU0fbPjFNrocRkvQ53YGYnCloJ/kp4E1+lwjSDz1VUWxdJQb3GbTcMcRkuZQkpjfUhVlZmCxQAQ6RNPJrEMndYWY1LAqdTEGvY/IhOdCpk/Q76X5An2zedp66Ysb0IXwAGAOv5dzl7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAGygx8LAbtirZP/dKyw4jRz96uxGQoBxvz+tD3VZ+g=;
 b=d2mu9Vcese9ritUB5YVkEjbOWrSixk1xBe0/Fv+DVYJKHAVtYo7TWZDZHxSvN6EW3GglNqJB3t64Lhsyqrp366aMEFMeGa74z+EhGl6ZbuOE44mXsLcArziymOG3bVdBFXJfE+eqhUuMWXVtywMQTYo/oJ4VFGW4XoZAwBczC6GHWaHBsF7inTdjiaFbYUMLRUOatNLvUbrCKdh9meeIwswmOF0ZdkSPLGd0JN3JaMzlVFCSYNDpmd2S/GOFr7CwfTb7aLxz+tpMA72nRIyyWsTlsbhJRawi3GJHSmYxobHIy1xH8f+W3J/c6bkoa2rb9Y2tQw8aO44NMYoa+QCiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1238.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.46; Thu, 18 Jul
 2024 03:28:41 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.044; Thu, 18 Jul 2024 03:28:41 +0000
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
Subject: [PATCH v2 0/5] Add StarFive Camera Subsystem hibernation support
Date: Wed, 17 Jul 2024 20:28:29 -0700
Message-Id: <20240718032834.53876-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1238:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e4df15-a841-4516-b3dc-08dca6d9b871
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|41320700013|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	pbtx7OxS+CK8ARSwncwib99rP1P+UVo2JxWjhS0QI2EaAP/Rzdu3AspXsVGthN4hygetbbfLp6snfvCkGNk2xGPYbwkYrmujNw0l9fX7Tw4L8HLfRZH0CJDr/a39/HoLsIu9RhIZHMgbQaqXlZ8xXQ9t/3fc5yTxnJWylMP0eDZ9haKiOxKlkEjbcVc+yZSfKUkvs0fJJRLrOqdUvuAmDt/9pzLXxSc+cHIWhryjFvAJG4lO4AQlBBxQzcH+0HgvnvTjC0NudDl4OMNBmWNiNLWbUlKTu2kf20r+HA6mMHHu8xC9Oct4UrZ56FLeM7qhq9Pqe8m1AkvafqvwiaVeCse/IfPL/dGC2b0MIoVUBrUYU2gBmq2GPutRJG6qfvCZ5z+vXTR22IjAoBzRYld5iLORSLNJVg4cwgmMKOYiY9NPimD2qY1WxL1a1DmFwvuRiU5mVe/ByaC3u0jTM+J77kWVu3ek2SgF7N+Ls3eD+kKZTo9DS6D3axnNNyGGsNj6CUO9b58HfFRXRwe6tG7jUICZNYEbWfJG9MtYFe7OfPIUz6kQQg4lIkJAltV3PHhH2GqGa4mFTRKIuPNgkBk3K2IrrE9XRRGx3e8+7cTsbpDaefHb0WHWXng15o4MZNnv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(41320700013)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vc5bde06Gy8ujzqz7APnWGKHl4IPB2LcisbGV7TmrYV5P55hameesNQZApQ1?=
 =?us-ascii?Q?2b/qMXXhK/ySCwggW6ZConc3uPASqj2eL+CLDa8/Ay7uOWL3bR2edBquc+vG?=
 =?us-ascii?Q?MM+fmX9AmoopgCpmYa0brCg9SisN2fqTTvGPc2ygdu1EGNw2V8hLf8Tedewz?=
 =?us-ascii?Q?liPXJOfGUy+VlKUV7cLA45MZyK5bNsAua5qrcV7glgEhj3SCjP5zq2rhpRTm?=
 =?us-ascii?Q?+JZKg6SepZeIYakABieelthq9Tbjbyr8gIMyCoU2xEY3RgAg4Cp5jevirbKP?=
 =?us-ascii?Q?t7HqS59Ub76x3CpPT80reQP1f3/F0EOZ5bCPrzB7Jz/D0DRhmvY5c+yaKsVa?=
 =?us-ascii?Q?ZPFXJdQobv1pOFoTVQ3PVbyouwFFKuGuJSamqJ3L/TrLWyjhgy0EyF4ptgij?=
 =?us-ascii?Q?coYAYXYeNaboZjZCIFBPs7XerzeVrbK03BK8wxJLRJyA0AKDn/KxSIX0RQoy?=
 =?us-ascii?Q?8DxlX+uqIPBgDI68mcmG9e8Tw/oGmIUsiNx4cTgplyQ1EBUqjsCofo9FLxHR?=
 =?us-ascii?Q?O59Sm4e3+wYaJPqwkH/zhuM2P4vU00Ulu+FKa16q9rJOc6jq9RZJVCTUm0OB?=
 =?us-ascii?Q?9xiFe6Fb2D2gCuAFdw/LPAhZBLBrQ/yXjJD+IP/51WSaQr13TOM3suUFp93y?=
 =?us-ascii?Q?a1+BFGklhe5bK752/e2YYhMg0hghmacrMA5VXO+cwUFtzAH1QmSdYeWUs+uX?=
 =?us-ascii?Q?IRy0Nbv4th5JlTPSgKXyN8rIIlLhEJwj3SQN3zsG9tUcnDgnOpEqjTLvGCCg?=
 =?us-ascii?Q?ubltvi4DSADO4gBkM3kZ/WT/sxIl4ZAb6gq1OGii05bnYy320K01z8BNZQN2?=
 =?us-ascii?Q?A84hwByjTxd7SarFDduB87fpoC25hK0feK3KZW+S/BwmgHmmn560V+w9D23a?=
 =?us-ascii?Q?eLkLw6omqSUCHnLCYjvqjp30IytPnGa+TyGNgsmsN7A+OArSPHbOYrIMQNhn?=
 =?us-ascii?Q?jmpECHsFw2tkUeBo/h3gLg+gRrAw7GP5l0jMbuAqDLWq6wZsx0YN3YEmXfiC?=
 =?us-ascii?Q?kBJ8W763BkeyB1Bt6r56PlzZTr5C+AzihH5NOfqIYfJaHQhE0QzsgcUTtHI6?=
 =?us-ascii?Q?Xr4fmsMK9yg8tE7Jf+dk3+3oaNthpOr6Lp98YvSDqVcLq4jN9+dTUDgzk3iB?=
 =?us-ascii?Q?IvO7jtj1RfePxP2SCDy9CRh3fPpxNCTj1DljsxSIj4du8AM1Mtx3nOREvbpB?=
 =?us-ascii?Q?wBBakNaRRjndCLQ4z4+LCyig+tK4SesHjCm/3gAeT3tAbyItDHupVwkM0mMc?=
 =?us-ascii?Q?U6WGZUM8/SbYY14TXoEkHlHcFlzDMVAaxxaWdbHFbnd7u5f+Rnr5HERNfHS6?=
 =?us-ascii?Q?zZXl0YyYb7nOQiBz+UKjJ9IBMh5PwabK7YbfdPCJBb+4hdDYUgSVDOLmS/dQ?=
 =?us-ascii?Q?cbbxVv8G+4dwPaIABZy2q5A+g2o+F4z59bOidEf/9Uahvw8qEwgVxTK0wbzH?=
 =?us-ascii?Q?ajmw/LCmmWNqKSuVg121/bCYGIr7Ozv4Q9JWL1u1reHRGApwSNk1Xgwi4WL6?=
 =?us-ascii?Q?CryV/smTha7NnqhMn56x5yWUTdM3zhizc8OZ1P7QG7KwKLQB2q6uIHBKhJgB?=
 =?us-ascii?Q?kQyGs6PTo1cV4ZfvuGalFQWWAE+pYUAcfMTPr1Ha+s7Mx2EkpjQXvCb7lMg3?=
 =?us-ascii?Q?980Qx5LNziQAxFhTGm+Nvi8=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e4df15-a841-4516-b3dc-08dca6d9b871
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 03:28:41.3578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAPdG6QDunqZ79UyECJ+ILvlIw6Y0DETc+Vsi3bsHG7ax/4qsjlGxTBE4kNpjTUqN1WTOYCB97THw7hO/VMk0j3uBsWOPOKTRw1vXW2Fgzsy4k3N4cJhg/ORSMe12HAO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1238

This series implements suspend and resume operation for StarFive Camera
Subsystem on JH7110 SoC. It supports hibernation during streaming and
restarts streaming at the system resume time.

changes since v1:
- csi2rx runtime PM not control the streaming.
- Introduce streaming for ISP subdev due to the struct subdev member
  "enabled_streams" has been deleted.

v1: https://lore.kernel.org/all/20240326031237.25331-1-changhuang.liang@starfivetech.com/

Changhuang Liang (5):
  media: cadence: csi2rx: Support runtime PM
  media: cadence: csi2rx: Add system PM support
  staging: media: starfive: Extract the ISP stream on as a helper
    function
  staging: media: starfive: Introduce streaming for ISP subdev
  staging: media: starfive: Add system PM support

 drivers/media/platform/cadence/cdns-csi2rx.c  | 153 +++++++++++++-----
 .../staging/media/starfive/camss/stf-camss.c  |  49 ++++++
 .../staging/media/starfive/camss/stf-isp.c    |  27 +++-
 .../staging/media/starfive/camss/stf-isp.h    |   3 +
 4 files changed, 183 insertions(+), 49 deletions(-)

--
2.25.1

