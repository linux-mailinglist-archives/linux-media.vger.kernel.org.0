Return-Path: <linux-media+bounces-55868-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEmTLJnHt2kRVQEAu9opvQ
	(envelope-from <linux-media+bounces-55868-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:04:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D0766296A4A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DCB23014F40
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC54383C66;
	Mon, 16 Mar 2026 09:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="dTuHl/qU"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021075.outbound.protection.outlook.com [40.107.57.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382A8384244;
	Mon, 16 Mar 2026 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651702; cv=fail; b=D1KIqExSl78vxsjPDpLczsOPLV276QPUTlDqyMjGyE02yOKvjbfMBNt1cGu2p1oFOeEENkHqyhoLj1ZMfAoulgjJgr1ipg8q9E4dTbRPaVIahSIp1VfBufArGDM2nMatveXwPmxSd0MtpgFEhOod3SJAsZbX6sCEvZUGUegWR+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651702; c=relaxed/simple;
	bh=bh1yco4j5pEIqulV/7MeOId8lfWaDVcGSIhuhL69UcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FxNk3aBd6aVti5l7q7wyNyzY9rAfcMDoXmBV03/vIZLx/OOnqHKYSBhhl+gHc3AeenVjjmI9dTF6W7rMw/XAvxxAUKfU/H6qIR1EZ6gA2WMkOFFJqHPQcBb3Nnw4DU3pdhLZWzesYrP27TCKeoSBFAhKOyTxl9NKH1jtGtyMDnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=dTuHl/qU; arc=fail smtp.client-ip=40.107.57.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fE5Ue8IqmTgulbkLHoyLnABoEEy1pSChq0AhNaibzXHgiWKZgONsmuG7FAQwHDUEXACyl3AhZSWkMXIW+lRor5RMQh2d5jAW2Di3Echa/UzuOOq/58p91b01RSop9/ByNpSb/iKwL6ChM1hZsJFt9rUTsh9c4J4AovPKr4c6e/9v9jYe7VSLxKAbJ7VvZG2pYRl/f4GF+ARdpedK8KE2yRl8rITG4qDqqAJqfdrvgBSOMmOQMACZKlU0SYnxcQHrcRK1/ep2cm7iZLW1TjZ7O1DhNGj5URQp4UrGbAKt0dG5zFu7bIrAMTgvOTtS75zDrv2GAlc2yG0kBM+d83cTwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssdrlisL50z+Bbjnu2pAlfm+fgtw++0i5XwoGUjNjpA=;
 b=nFSpd8XFNJURVtZ3g96ZMRDdvd+qjTd/7aLhjwO/1QW6MAKGbHMzwVTdqB5M4J/VrSYTK82aXigKKktUEg3d3fcPymuZIRVfTaFd/O5qGZJbmUGlAOjCsot4q1l4s1YP2y6GYNiYwql+ywOke4pKsun35Fi6Optv4pDVeyhj7tZ/Vkk8Cn8wFGcXAGYbfhpJlo2auTzFgoLJ0CVRrhE2jUyZEDYpcSjTyPzPbCkWWfQrxsPWynqY1MmjuWCtjhKHhxE7Yq0SJ8k7m47uq6M6onnmtTwakr0Bu4cy0C/tZzgaUjUnOwAGPEPrL2cGe9xdkRpQkZqYkRxt9FbnriD3pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssdrlisL50z+Bbjnu2pAlfm+fgtw++0i5XwoGUjNjpA=;
 b=dTuHl/qUdzVIv1fg7oHhDulZ/bdk5Sgv+FwMCfSMJkhcj0QO1RqsqIK42mB345JrxWYhxPNJl0L0NYbdv8OY5cjFdJTdABjDjKGr6EMWEVIWJ8jh5TaJUX36CVXYXdp6QMi6Itv9jEUgPI7FFB2/PsiNBn8DY2R86LbH9UNeNVtOrKVbuQrckR/sm/1jRlT7wAzPUhCIVR9ApR85vJfUoSM/AopmzPMXDh5CPLyGy1WWk+jKqxx0lqQ0dbm0vx1RIC6CBfUtlpOCDkNm/WimlWlVk7j9XSO93R59NzRs3wMLznc3ytQ392Ndo1Ky45d064P77EL2JpyNxYivINekDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MA0P287MB1615.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 09:01:36 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%4]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 09:01:36 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: tarang.raval@siliconsignals.io,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] media: i2c: imx412: Convert to CCI register access helpers
Date: Mon, 16 Mar 2026 14:30:54 +0530
Message-Id: <20260316090059.121605-2-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316090059.121605-1-elgin.perumbilly@siliconsignals.io>
References: <20260316090059.121605-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::35) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|MA0P287MB1615:EE_
X-MS-Office365-Filtering-Correlation-Id: 43990dbe-97ae-4ae2-cd1f-08de833aa0b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	/jsc4HyJKlxz+53M+NygFSk/N3rO6TxGOa2n3NjRUImYrFmkvM3YveM3OxXghr0I/gIYGm+MqFZzEXB/hE90ZL5HtPfP/hFdPfT+oi1x03P23IWkGUWDZ68vPpa6bEBgSzutfGhwmxU7F5QkOgEgG4ZpA2VMcLliJ6mRTSK3uRQgh7EtQ0UqGBPIOyRG3bfsihZ8sWqi7LgvmgEIc28YETeIPblmC0EqNAl/frpK+N5pd+fb3HHWuS5CVlRgMzkdmQWRnPPSQZMQnJofssirN+NPx945sk6tbKj0Xja6iPGlpW0U7GakoM4W+1waJV1hRUSh9m8dzUPLyOZfnitCYuRYqasY3D4gQzgbZw55GIlv9fz1M3nqm6FZwZdvsjAsaVH9pkIEL7HNjMcFGJ9MhXIB74VGPNs2YNlYBJK7OguixGGu3VJHSjEkY0OEnJ3/w+/iff1Q3NZK78piSfS5oymSDXdkWQhMDyvu7e60ii9LAwOEmkaFO3QtarstHneUKxGF7o9uJdbCQgU1QKxr2tqUjOqTbPTWnUtudoCdHSNA6JdhCjd1nbMn2c/rWdR8V12orz7JCsjyyed9IXlVefbBn2rj9ztXeYdNOALkLN0gJrY/p1dzFgrg6z0MIn3VUrdMLCj0BvM7tcZ7WpOeJ9kvdZh1Kc5tsocv63Mqe41LrKW6dYcDzuJ5EOplLh95cfEhcaGeVDEAkYF/vIbyxpUrADotGWuHbEyXzaqLONdOtd/+Q9V0JYgmQBoKYrEM+Da4ePG8m430N5sIwz2Czz9uih4/x+A2j68CUgFQalo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7TbpNwGDvAJoB4skW9n63CSKdsCXBq2VF3d74+JIUsOKGEWCYz3PBMB4PIsD?=
 =?us-ascii?Q?KLrFqY81yoObYTmnBmiJl6TSPUCmceQ0mN9M9as0evvMrw1q2FveoKBQJehY?=
 =?us-ascii?Q?0XTByIGPI6HMQY+agK7FlWPBg8YHhWS70b9wyOJvqHJytENjJL84nj6pr4s8?=
 =?us-ascii?Q?7yaYuSsjJEwCqUiML++6mTF5I0G6akn+7R3guPPERGX7zWblyTxx4369mq+U?=
 =?us-ascii?Q?/JzOMBwxtLhpv7aQuJni++V4ymrJL8kPrWb3TiLdtXZBWSR04IcI8I+gRtVa?=
 =?us-ascii?Q?+MIZsmKEhAwKTeHkScBB7W3bdTz6+KHYzJb8K28b/Az2P6LW5jtCgSooqJsm?=
 =?us-ascii?Q?xlLF5aPgMTYUzq1l7WENXR+o5I9AMHY6Ixad1V25I0SnJ8ByEWAx89PxQRBx?=
 =?us-ascii?Q?d0I1k07fvkKLYCDEK6qTqWx60GtJ9FqhDHmVEcunq7spcJcMAKwZQ9Keu5bi?=
 =?us-ascii?Q?HYAZ1GWhr/PGOxaR5HIcPG9TuHIv9CaZpJ0nefr155u8rR3MJhj3iA/zBDo4?=
 =?us-ascii?Q?GLYSjNPjqL5qvRVAKlE5PC0JbMv+dG8M/insGek2Ki1vHdYO0kU3Qj/7O/qo?=
 =?us-ascii?Q?Kn3Q9g6VwyneFjHPPlAaeOVRy+CzuZJgpTcQmvzdANyvWXNGbL2Gho7xALwi?=
 =?us-ascii?Q?C/wz1XgTNXPVB3EuzsP5eyF71lB9DsMKuIpFCX6LhTek9/R9dzUN4Rx1u5cn?=
 =?us-ascii?Q?pR9Pnw6hMQtD7s+469wNuFOgLL9E0sS10t9jcb9iNaTwOUgcMrEdWI8pCUC6?=
 =?us-ascii?Q?MZnCwdGWnDE8VGlH6LlfpgVrejH01Z/rbmtnW4ZZk+hjc0wxsZ+HNl3YlIAK?=
 =?us-ascii?Q?d3NoHfn1LAPzTGw/29rCbo16w8KPsEHACCpgcX6Ec7UQ5Ei1JwDA7kRKKs2o?=
 =?us-ascii?Q?7JMASrJr8W2Qb35qBm74d9frVocC9ZrOnWKDTyK5gWvWwChuYIjCEx4+Yczb?=
 =?us-ascii?Q?UyPrxR5SH/X4k45HtD2G5nlZz0WCWlL3eminfXgnNBgRadJjglVRenj3vWor?=
 =?us-ascii?Q?QGaKBlVMtfVuz9lFXV7yNx8uQlcrMKSTBwt7ZGYsFCQiflIa4FzJqBEP9rac?=
 =?us-ascii?Q?xtPRdM++JChgVU6KC+rqJZvaey96MXDHoJJR73wAQtaTwxZoiJACQjNaqvKw?=
 =?us-ascii?Q?LZuKbgxaEXIB8WEHv/YJkjSD8deSfFxOzyQl/aAq4cDj5QnEo+XAoXmPcumO?=
 =?us-ascii?Q?xN7ejZQkU/WxmDgMUPRc0HfCK2J+arr0bwnybTjnZELruP1dC4af9o4HvKu9?=
 =?us-ascii?Q?TBK/AKRHxP3zpuW6eeTh3OoBoLtQHZ2V/p69CDvfe7ChIaF6YAQ2nhHBTZNP?=
 =?us-ascii?Q?wt3GLh5wPx8yBN8FEe/MqNdAqri0Zb/BlkRHjckhqkKcAFDxHuOAYtJV2kiy?=
 =?us-ascii?Q?y1cyfgwb+SUMQ9jwqRspNYCoIA9jCk5MPVIshpNR7quw45pbQvuCuijgLp4w?=
 =?us-ascii?Q?o5DjMoFjGdsGmZ63Rfk8TD6gbJmMO6BbRsWs7rfQACxuLXY13JCT+vD4EEG1?=
 =?us-ascii?Q?8M350MtTNs3ckitvYduH0OjvwMm4LXJHrAsXZbN8vMa26x4AqVVlQ6mHh0tl?=
 =?us-ascii?Q?SSYp3D3gcJ2D5Q3K6BlW2GPApn6/jn401za5NBqRJ6ya9mz+125zjF6Mec3a?=
 =?us-ascii?Q?NU//bEOJ9BIBBvpOdYL6bSmv7dB8eLomgqrfhSU4isRP6a88bzpTEe9S4s7L?=
 =?us-ascii?Q?/kO/jIhmTH/2L4OR0ieluRKFidcu3RB+ptVJDHSw+ZMo8Cj2PF5g/AfnV/HR?=
 =?us-ascii?Q?cE1qa78mEn+5J0SbKHHLF26Y4e8dS78=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 43990dbe-97ae-4ae2-cd1f-08de833aa0b3
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:01:36.2112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7HZrEV1RzNTaI1Vp/YPLE/YusYWrPDtpSLXM7NlICPYdqKyjaSj+zbBWba79iNaYVhIYnFJk7GYOrpZbW6YPUtMAgQvmmofGliyBIsfvkk5gVuvMcuRZly4m7QXTSin
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1615
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,windriver.com,ideasonboard.com,foss.st.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55868-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Queue-Id: D0766296A4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the new common CCI register access helpers to replace the private
register access helpers in the imx412 driver. This simplifies the driver
by reducing the amount of code.

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx412.c | 635 ++++++++++++++++---------------------
 2 files changed, 271 insertions(+), 365 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 20482be35f26..1881da7a3967 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -269,6 +269,7 @@ config VIDEO_IMX355
 config VIDEO_IMX412
 	tristate "Sony IMX412 sensor support"
 	depends on OF_GPIO
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX412 camera.
diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index e25e0a9ff65c..13d6fe79dcf7 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -13,38 +13,39 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>

+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>

 /* Streaming Mode */
-#define IMX412_REG_MODE_SELECT	0x0100
+#define IMX412_REG_MODE_SELECT	CCI_REG8(0x0100)
 #define IMX412_MODE_STANDBY	0x00
 #define IMX412_MODE_STREAMING	0x01

 /* Lines per frame */
-#define IMX412_REG_LPFR		0x0340
+#define IMX412_REG_LPFR		CCI_REG16(0x0340)

 /* Chip ID */
-#define IMX412_REG_ID		0x0016
+#define IMX412_REG_ID		CCI_REG16(0x0016)
 #define IMX412_ID		0x577

 /* Exposure control */
-#define IMX412_REG_EXPOSURE_CIT	0x0202
+#define IMX412_REG_EXPOSURE_CIT	CCI_REG16(0x0202)
 #define IMX412_EXPOSURE_MIN	8
 #define IMX412_EXPOSURE_OFFSET	22
 #define IMX412_EXPOSURE_STEP	1
 #define IMX412_EXPOSURE_DEFAULT	0x0648

 /* Analog gain control */
-#define IMX412_REG_AGAIN	0x0204
+#define IMX412_REG_AGAIN	CCI_REG16(0x0204)
 #define IMX412_AGAIN_MIN	0
 #define IMX412_AGAIN_MAX	978
 #define IMX412_AGAIN_STEP	1
 #define IMX412_AGAIN_DEFAULT	0

 /* Group hold register */
-#define IMX412_REG_HOLD		0x0104
+#define IMX412_REG_HOLD		CCI_REG8(0x0104)

 /* Input clock rate */
 #define IMX412_INCLK_RATE	24000000
@@ -56,16 +57,6 @@
 #define IMX412_REG_MIN		0x00
 #define IMX412_REG_MAX		0xffff

-/**
- * struct imx412_reg - imx412 sensor register
- * @address: Register address
- * @val: Register value
- */
-struct imx412_reg {
-	u16 address;
-	u8 val;
-};
-
 /**
  * struct imx412_reg_list - imx412 sensor register list
  * @num_of_regs: Number of registers in the list
@@ -73,7 +64,7 @@ struct imx412_reg {
  */
 struct imx412_reg_list {
 	u32 num_of_regs;
-	const struct imx412_reg *regs;
+	const struct cci_reg_sequence *regs;
 };

 /**
@@ -111,6 +102,7 @@ static const char * const imx412_supply_names[] = {
 /**
  * struct imx412 - imx412 sensor device structure
  * @dev: Pointer to generic device
+ * @cci: CCI register map
  * @client: Pointer to i2c client
  * @sd: V4L2 sub-device
  * @pad: Media pad. Only one pad supported
@@ -130,6 +122,7 @@ static const char * const imx412_supply_names[] = {
  */
 struct imx412 {
 	struct device *dev;
+	struct regmap *cci;
 	struct i2c_client *client;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -155,238 +148,238 @@ static const s64 link_freq[] = {
 };

 /* Sensor mode registers */
-static const struct imx412_reg mode_4056x3040_regs[] = {
-	{0x0136, 0x18},
-	{0x0137, 0x00},
-	{0x3c7e, 0x08},
-	{0x3c7f, 0x02},
-	{0x38a8, 0x1f},
-	{0x38a9, 0xff},
-	{0x38aa, 0x1f},
-	{0x38ab, 0xff},
-	{0x55d4, 0x00},
-	{0x55d5, 0x00},
-	{0x55d6, 0x07},
-	{0x55d7, 0xff},
-	{0x55e8, 0x07},
-	{0x55e9, 0xff},
-	{0x55ea, 0x00},
-	{0x55eb, 0x00},
-	{0x575c, 0x07},
-	{0x575d, 0xff},
-	{0x575e, 0x00},
-	{0x575f, 0x00},
-	{0x5764, 0x00},
-	{0x5765, 0x00},
-	{0x5766, 0x07},
-	{0x5767, 0xff},
-	{0x5974, 0x04},
-	{0x5975, 0x01},
-	{0x5f10, 0x09},
-	{0x5f11, 0x92},
-	{0x5f12, 0x32},
-	{0x5f13, 0x72},
-	{0x5f14, 0x16},
-	{0x5f15, 0xba},
-	{0x5f17, 0x13},
-	{0x5f18, 0x24},
-	{0x5f19, 0x60},
-	{0x5f1a, 0xe3},
-	{0x5f1b, 0xad},
-	{0x5f1c, 0x74},
-	{0x5f2d, 0x25},
-	{0x5f5c, 0xd0},
-	{0x6a22, 0x00},
-	{0x6a23, 0x1d},
-	{0x7ba8, 0x00},
-	{0x7ba9, 0x00},
-	{0x886b, 0x00},
-	{0x9002, 0x0a},
-	{0x9004, 0x1a},
-	{0x9214, 0x93},
-	{0x9215, 0x69},
-	{0x9216, 0x93},
-	{0x9217, 0x6b},
-	{0x9218, 0x93},
-	{0x9219, 0x6d},
-	{0x921a, 0x57},
-	{0x921b, 0x58},
-	{0x921c, 0x57},
-	{0x921d, 0x59},
-	{0x921e, 0x57},
-	{0x921f, 0x5a},
-	{0x9220, 0x57},
-	{0x9221, 0x5b},
-	{0x9222, 0x93},
-	{0x9223, 0x02},
-	{0x9224, 0x93},
-	{0x9225, 0x03},
-	{0x9226, 0x93},
-	{0x9227, 0x04},
-	{0x9228, 0x93},
-	{0x9229, 0x05},
-	{0x922a, 0x98},
-	{0x922b, 0x21},
-	{0x922c, 0xb2},
-	{0x922d, 0xdb},
-	{0x922e, 0xb2},
-	{0x922f, 0xdc},
-	{0x9230, 0xb2},
-	{0x9231, 0xdd},
-	{0x9232, 0xe2},
-	{0x9233, 0xe1},
-	{0x9234, 0xb2},
-	{0x9235, 0xe2},
-	{0x9236, 0xb2},
-	{0x9237, 0xe3},
-	{0x9238, 0xb7},
-	{0x9239, 0xb9},
-	{0x923a, 0xb7},
-	{0x923b, 0xbb},
-	{0x923c, 0xb7},
-	{0x923d, 0xbc},
-	{0x923e, 0xb7},
-	{0x923f, 0xc5},
-	{0x9240, 0xb7},
-	{0x9241, 0xc7},
-	{0x9242, 0xb7},
-	{0x9243, 0xc9},
-	{0x9244, 0x98},
-	{0x9245, 0x56},
-	{0x9246, 0x98},
-	{0x9247, 0x55},
-	{0x9380, 0x00},
-	{0x9381, 0x62},
-	{0x9382, 0x00},
-	{0x9383, 0x56},
-	{0x9384, 0x00},
-	{0x9385, 0x52},
-	{0x9388, 0x00},
-	{0x9389, 0x55},
-	{0x938a, 0x00},
-	{0x938b, 0x55},
-	{0x938c, 0x00},
-	{0x938d, 0x41},
-	{0x5078, 0x01},
-	{0x0112, 0x0a},
-	{0x0113, 0x0a},
-	{0x0114, 0x03},
-	{0x0342, 0x11},
-	{0x0343, 0xa0},
-	{0x0340, 0x0d},
-	{0x0341, 0xda},
-	{0x3210, 0x00},
-	{0x0344, 0x00},
-	{0x0345, 0x00},
-	{0x0346, 0x00},
-	{0x0347, 0x00},
-	{0x0348, 0x0f},
-	{0x0349, 0xd7},
-	{0x034a, 0x0b},
-	{0x034b, 0xdf},
-	{0x00e3, 0x00},
-	{0x00e4, 0x00},
-	{0x00e5, 0x01},
-	{0x00fc, 0x0a},
-	{0x00fd, 0x0a},
-	{0x00fe, 0x0a},
-	{0x00ff, 0x0a},
-	{0xe013, 0x00},
-	{0x0220, 0x00},
-	{0x0221, 0x11},
-	{0x0381, 0x01},
-	{0x0383, 0x01},
-	{0x0385, 0x01},
-	{0x0387, 0x01},
-	{0x0900, 0x00},
-	{0x0901, 0x11},
-	{0x0902, 0x00},
-	{0x3140, 0x02},
-	{0x3241, 0x11},
-	{0x3250, 0x03},
-	{0x3e10, 0x00},
-	{0x3e11, 0x00},
-	{0x3f0d, 0x00},
-	{0x3f42, 0x00},
-	{0x3f43, 0x00},
-	{0x0401, 0x00},
-	{0x0404, 0x00},
-	{0x0405, 0x10},
-	{0x0408, 0x00},
-	{0x0409, 0x00},
-	{0x040a, 0x00},
-	{0x040b, 0x00},
-	{0x040c, 0x0f},
-	{0x040d, 0xd8},
-	{0x040e, 0x0b},
-	{0x040f, 0xe0},
-	{0x034c, 0x0f},
-	{0x034d, 0xd8},
-	{0x034e, 0x0b},
-	{0x034f, 0xe0},
-	{0x0301, 0x05},
-	{0x0303, 0x02},
-	{0x0305, 0x04},
-	{0x0306, 0x00},
-	{0x0307, 0xc8},
-	{0x0309, 0x0a},
-	{0x030b, 0x01},
-	{0x030d, 0x02},
-	{0x030e, 0x01},
-	{0x030f, 0x5e},
-	{0x0310, 0x00},
-	{0x0820, 0x12},
-	{0x0821, 0xc0},
-	{0x0822, 0x00},
-	{0x0823, 0x00},
-	{0x3e20, 0x01},
-	{0x3e37, 0x00},
-	{0x3f50, 0x00},
-	{0x3f56, 0x00},
-	{0x3f57, 0xe2},
-	{0x3c0a, 0x5a},
-	{0x3c0b, 0x55},
-	{0x3c0c, 0x28},
-	{0x3c0d, 0x07},
-	{0x3c0e, 0xff},
-	{0x3c0f, 0x00},
-	{0x3c10, 0x00},
-	{0x3c11, 0x02},
-	{0x3c12, 0x00},
-	{0x3c13, 0x03},
-	{0x3c14, 0x00},
-	{0x3c15, 0x00},
-	{0x3c16, 0x0c},
-	{0x3c17, 0x0c},
-	{0x3c18, 0x0c},
-	{0x3c19, 0x0a},
-	{0x3c1a, 0x0a},
-	{0x3c1b, 0x0a},
-	{0x3c1c, 0x00},
-	{0x3c1d, 0x00},
-	{0x3c1e, 0x00},
-	{0x3c1f, 0x00},
-	{0x3c20, 0x00},
-	{0x3c21, 0x00},
-	{0x3c22, 0x3f},
-	{0x3c23, 0x0a},
-	{0x3e35, 0x01},
-	{0x3f4a, 0x03},
-	{0x3f4b, 0xbf},
-	{0x3f26, 0x00},
-	{0x0202, 0x0d},
-	{0x0203, 0xc4},
-	{0x0204, 0x00},
-	{0x0205, 0x00},
-	{0x020e, 0x01},
-	{0x020f, 0x00},
-	{0x0210, 0x01},
-	{0x0211, 0x00},
-	{0x0212, 0x01},
-	{0x0213, 0x00},
-	{0x0214, 0x01},
-	{0x0215, 0x00},
-	{0xbcf1, 0x00},
+static const struct cci_reg_sequence mode_4056x3040_regs[] = {
+	{ CCI_REG8(0x0136), 0x18 },
+	{ CCI_REG8(0x0137), 0x00 },
+	{ CCI_REG8(0x3c7e), 0x08 },
+	{ CCI_REG8(0x3c7f), 0x02 },
+	{ CCI_REG8(0x38a8), 0x1f },
+	{ CCI_REG8(0x38a9), 0xff },
+	{ CCI_REG8(0x38aa), 0x1f },
+	{ CCI_REG8(0x38ab), 0xff },
+	{ CCI_REG8(0x55d4), 0x00 },
+	{ CCI_REG8(0x55d5), 0x00 },
+	{ CCI_REG8(0x55d6), 0x07 },
+	{ CCI_REG8(0x55d7), 0xff },
+	{ CCI_REG8(0x55e8), 0x07 },
+	{ CCI_REG8(0x55e9), 0xff },
+	{ CCI_REG8(0x55ea), 0x00 },
+	{ CCI_REG8(0x55eb), 0x00 },
+	{ CCI_REG8(0x575c), 0x07 },
+	{ CCI_REG8(0x575d), 0xff },
+	{ CCI_REG8(0x575e), 0x00 },
+	{ CCI_REG8(0x575f), 0x00 },
+	{ CCI_REG8(0x5764), 0x00 },
+	{ CCI_REG8(0x5765), 0x00 },
+	{ CCI_REG8(0x5766), 0x07 },
+	{ CCI_REG8(0x5767), 0xff },
+	{ CCI_REG8(0x5974), 0x04 },
+	{ CCI_REG8(0x5975), 0x01 },
+	{ CCI_REG8(0x5f10), 0x09 },
+	{ CCI_REG8(0x5f11), 0x92 },
+	{ CCI_REG8(0x5f12), 0x32 },
+	{ CCI_REG8(0x5f13), 0x72 },
+	{ CCI_REG8(0x5f14), 0x16 },
+	{ CCI_REG8(0x5f15), 0xba },
+	{ CCI_REG8(0x5f17), 0x13 },
+	{ CCI_REG8(0x5f18), 0x24 },
+	{ CCI_REG8(0x5f19), 0x60 },
+	{ CCI_REG8(0x5f1a), 0xe3 },
+	{ CCI_REG8(0x5f1b), 0xad },
+	{ CCI_REG8(0x5f1c), 0x74 },
+	{ CCI_REG8(0x5f2d), 0x25 },
+	{ CCI_REG8(0x5f5c), 0xd0 },
+	{ CCI_REG8(0x6a22), 0x00 },
+	{ CCI_REG8(0x6a23), 0x1d },
+	{ CCI_REG8(0x7ba8), 0x00 },
+	{ CCI_REG8(0x7ba9), 0x00 },
+	{ CCI_REG8(0x886b), 0x00 },
+	{ CCI_REG8(0x9002), 0x0a },
+	{ CCI_REG8(0x9004), 0x1a },
+	{ CCI_REG8(0x9214), 0x93 },
+	{ CCI_REG8(0x9215), 0x69 },
+	{ CCI_REG8(0x9216), 0x93 },
+	{ CCI_REG8(0x9217), 0x6b },
+	{ CCI_REG8(0x9218), 0x93 },
+	{ CCI_REG8(0x9219), 0x6d },
+	{ CCI_REG8(0x921a), 0x57 },
+	{ CCI_REG8(0x921b), 0x58 },
+	{ CCI_REG8(0x921c), 0x57 },
+	{ CCI_REG8(0x921d), 0x59 },
+	{ CCI_REG8(0x921e), 0x57 },
+	{ CCI_REG8(0x921f), 0x5a },
+	{ CCI_REG8(0x9220), 0x57 },
+	{ CCI_REG8(0x9221), 0x5b },
+	{ CCI_REG8(0x9222), 0x93 },
+	{ CCI_REG8(0x9223), 0x02 },
+	{ CCI_REG8(0x9224), 0x93 },
+	{ CCI_REG8(0x9225), 0x03 },
+	{ CCI_REG8(0x9226), 0x93 },
+	{ CCI_REG8(0x9227), 0x04 },
+	{ CCI_REG8(0x9228), 0x93 },
+	{ CCI_REG8(0x9229), 0x05 },
+	{ CCI_REG8(0x922a), 0x98 },
+	{ CCI_REG8(0x922b), 0x21 },
+	{ CCI_REG8(0x922c), 0xb2 },
+	{ CCI_REG8(0x922d), 0xdb },
+	{ CCI_REG8(0x922e), 0xb2 },
+	{ CCI_REG8(0x922f), 0xdc },
+	{ CCI_REG8(0x9230), 0xb2 },
+	{ CCI_REG8(0x9231), 0xdd },
+	{ CCI_REG8(0x9232), 0xe2 },
+	{ CCI_REG8(0x9233), 0xe1 },
+	{ CCI_REG8(0x9234), 0xb2 },
+	{ CCI_REG8(0x9235), 0xe2 },
+	{ CCI_REG8(0x9236), 0xb2 },
+	{ CCI_REG8(0x9237), 0xe3 },
+	{ CCI_REG8(0x9238), 0xb7 },
+	{ CCI_REG8(0x9239), 0xb9 },
+	{ CCI_REG8(0x923a), 0xb7 },
+	{ CCI_REG8(0x923b), 0xbb },
+	{ CCI_REG8(0x923c), 0xb7 },
+	{ CCI_REG8(0x923d), 0xbc },
+	{ CCI_REG8(0x923e), 0xb7 },
+	{ CCI_REG8(0x923f), 0xc5 },
+	{ CCI_REG8(0x9240), 0xb7 },
+	{ CCI_REG8(0x9241), 0xc7 },
+	{ CCI_REG8(0x9242), 0xb7 },
+	{ CCI_REG8(0x9243), 0xc9 },
+	{ CCI_REG8(0x9244), 0x98 },
+	{ CCI_REG8(0x9245), 0x56 },
+	{ CCI_REG8(0x9246), 0x98 },
+	{ CCI_REG8(0x9247), 0x55 },
+	{ CCI_REG8(0x9380), 0x00 },
+	{ CCI_REG8(0x9381), 0x62 },
+	{ CCI_REG8(0x9382), 0x00 },
+	{ CCI_REG8(0x9383), 0x56 },
+	{ CCI_REG8(0x9384), 0x00 },
+	{ CCI_REG8(0x9385), 0x52 },
+	{ CCI_REG8(0x9388), 0x00 },
+	{ CCI_REG8(0x9389), 0x55 },
+	{ CCI_REG8(0x938a), 0x00 },
+	{ CCI_REG8(0x938b), 0x55 },
+	{ CCI_REG8(0x938c), 0x00 },
+	{ CCI_REG8(0x938d), 0x41 },
+	{ CCI_REG8(0x5078), 0x01 },
+	{ CCI_REG8(0x0112), 0x0a },
+	{ CCI_REG8(0x0113), 0x0a },
+	{ CCI_REG8(0x0114), 0x03 },
+	{ CCI_REG8(0x0342), 0x11 },
+	{ CCI_REG8(0x0343), 0xa0 },
+	{ CCI_REG8(0x0340), 0x0d },
+	{ CCI_REG8(0x0341), 0xda },
+	{ CCI_REG8(0x3210), 0x00 },
+	{ CCI_REG8(0x0344), 0x00 },
+	{ CCI_REG8(0x0345), 0x00 },
+	{ CCI_REG8(0x0346), 0x00 },
+	{ CCI_REG8(0x0347), 0x00 },
+	{ CCI_REG8(0x0348), 0x0f },
+	{ CCI_REG8(0x0349), 0xd7 },
+	{ CCI_REG8(0x034a), 0x0b },
+	{ CCI_REG8(0x034b), 0xdf },
+	{ CCI_REG8(0x00e3), 0x00 },
+	{ CCI_REG8(0x00e4), 0x00 },
+	{ CCI_REG8(0x00e5), 0x01 },
+	{ CCI_REG8(0x00fc), 0x0a },
+	{ CCI_REG8(0x00fd), 0x0a },
+	{ CCI_REG8(0x00fe), 0x0a },
+	{ CCI_REG8(0x00ff), 0x0a },
+	{ CCI_REG8(0xe013), 0x00 },
+	{ CCI_REG8(0x0220), 0x00 },
+	{ CCI_REG8(0x0221), 0x11 },
+	{ CCI_REG8(0x0381), 0x01 },
+	{ CCI_REG8(0x0383), 0x01 },
+	{ CCI_REG8(0x0385), 0x01 },
+	{ CCI_REG8(0x0387), 0x01 },
+	{ CCI_REG8(0x0900), 0x00 },
+	{ CCI_REG8(0x0901), 0x11 },
+	{ CCI_REG8(0x0902), 0x00 },
+	{ CCI_REG8(0x3140), 0x02 },
+	{ CCI_REG8(0x3241), 0x11 },
+	{ CCI_REG8(0x3250), 0x03 },
+	{ CCI_REG8(0x3e10), 0x00 },
+	{ CCI_REG8(0x3e11), 0x00 },
+	{ CCI_REG8(0x3f0d), 0x00 },
+	{ CCI_REG8(0x3f42), 0x00 },
+	{ CCI_REG8(0x3f43), 0x00 },
+	{ CCI_REG8(0x0401), 0x00 },
+	{ CCI_REG8(0x0404), 0x00 },
+	{ CCI_REG8(0x0405), 0x10 },
+	{ CCI_REG8(0x0408), 0x00 },
+	{ CCI_REG8(0x0409), 0x00 },
+	{ CCI_REG8(0x040a), 0x00 },
+	{ CCI_REG8(0x040b), 0x00 },
+	{ CCI_REG8(0x040c), 0x0f },
+	{ CCI_REG8(0x040d), 0xd8 },
+	{ CCI_REG8(0x040e), 0x0b },
+	{ CCI_REG8(0x040f), 0xe0 },
+	{ CCI_REG8(0x034c), 0x0f },
+	{ CCI_REG8(0x034d), 0xd8 },
+	{ CCI_REG8(0x034e), 0x0b },
+	{ CCI_REG8(0x034f), 0xe0 },
+	{ CCI_REG8(0x0301), 0x05 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0305), 0x04 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0307), 0xc8 },
+	{ CCI_REG8(0x0309), 0x0a },
+	{ CCI_REG8(0x030b), 0x01 },
+	{ CCI_REG8(0x030d), 0x02 },
+	{ CCI_REG8(0x030e), 0x01 },
+	{ CCI_REG8(0x030f), 0x5e },
+	{ CCI_REG8(0x0310), 0x00 },
+	{ CCI_REG8(0x0820), 0x12 },
+	{ CCI_REG8(0x0821), 0xc0 },
+	{ CCI_REG8(0x0822), 0x00 },
+	{ CCI_REG8(0x0823), 0x00 },
+	{ CCI_REG8(0x3e20), 0x01 },
+	{ CCI_REG8(0x3e37), 0x00 },
+	{ CCI_REG8(0x3f50), 0x00 },
+	{ CCI_REG8(0x3f56), 0x00 },
+	{ CCI_REG8(0x3f57), 0xe2 },
+	{ CCI_REG8(0x3c0a), 0x5a },
+	{ CCI_REG8(0x3c0b), 0x55 },
+	{ CCI_REG8(0x3c0c), 0x28 },
+	{ CCI_REG8(0x3c0d), 0x07 },
+	{ CCI_REG8(0x3c0e), 0xff },
+	{ CCI_REG8(0x3c0f), 0x00 },
+	{ CCI_REG8(0x3c10), 0x00 },
+	{ CCI_REG8(0x3c11), 0x02 },
+	{ CCI_REG8(0x3c12), 0x00 },
+	{ CCI_REG8(0x3c13), 0x03 },
+	{ CCI_REG8(0x3c14), 0x00 },
+	{ CCI_REG8(0x3c15), 0x00 },
+	{ CCI_REG8(0x3c16), 0x0c },
+	{ CCI_REG8(0x3c17), 0x0c },
+	{ CCI_REG8(0x3c18), 0x0c },
+	{ CCI_REG8(0x3c19), 0x0a },
+	{ CCI_REG8(0x3c1a), 0x0a },
+	{ CCI_REG8(0x3c1b), 0x0a },
+	{ CCI_REG8(0x3c1c), 0x00 },
+	{ CCI_REG8(0x3c1d), 0x00 },
+	{ CCI_REG8(0x3c1e), 0x00 },
+	{ CCI_REG8(0x3c1f), 0x00 },
+	{ CCI_REG8(0x3c20), 0x00 },
+	{ CCI_REG8(0x3c21), 0x00 },
+	{ CCI_REG8(0x3c22), 0x3f },
+	{ CCI_REG8(0x3c23), 0x0a },
+	{ CCI_REG8(0x3e35), 0x01 },
+	{ CCI_REG8(0x3f4a), 0x03 },
+	{ CCI_REG8(0x3f4b), 0xbf },
+	{ CCI_REG8(0x3f26), 0x00 },
+	{ CCI_REG8(0x0202), 0x0d },
+	{ CCI_REG8(0x0203), 0xc4 },
+	{ CCI_REG8(0x0204), 0x00 },
+	{ CCI_REG8(0x0205), 0x00 },
+	{ CCI_REG8(0x020e), 0x01 },
+	{ CCI_REG8(0x020f), 0x00 },
+	{ CCI_REG8(0x0210), 0x01 },
+	{ CCI_REG8(0x0211), 0x00 },
+	{ CCI_REG8(0x0212), 0x01 },
+	{ CCI_REG8(0x0213), 0x00 },
+	{ CCI_REG8(0x0214), 0x01 },
+	{ CCI_REG8(0x0215), 0x00 },
+	{ CCI_REG8(0xbcf1), 0x00 },
 };

 /* Supported sensor mode configurations */
@@ -417,97 +410,6 @@ static inline struct imx412 *to_imx412(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct imx412, sd);
 }

-/**
- * imx412_read_reg() - Read registers.
- * @imx412: pointer to imx412 device
- * @reg: register address
- * @len: length of bytes to read. Max supported bytes is 4
- * @val: pointer to register value to be filled.
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int imx412_read_reg(struct imx412 *imx412, u16 reg, u32 len, u32 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&imx412->sd);
-	struct i2c_msg msgs[2] = {0};
-	u8 addr_buf[2] = {0};
-	u8 data_buf[4] = {0};
-	int ret;
-
-	if (WARN_ON(len > 4))
-		return -EINVAL;
-
-	put_unaligned_be16(reg, addr_buf);
-
-	/* Write register address */
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = ARRAY_SIZE(addr_buf);
-	msgs[0].buf = addr_buf;
-
-	/* Read data from register */
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = &data_buf[4 - len];
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret != ARRAY_SIZE(msgs))
-		return -EIO;
-
-	*val = get_unaligned_be32(data_buf);
-
-	return 0;
-}
-
-/**
- * imx412_write_reg() - Write register
- * @imx412: pointer to imx412 device
- * @reg: register address
- * @len: length of bytes. Max supported bytes is 4
- * @val: register value
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int imx412_write_reg(struct imx412 *imx412, u16 reg, u32 len, u32 val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&imx412->sd);
-	u8 buf[6] = {0};
-
-	if (WARN_ON(len > 4))
-		return -EINVAL;
-
-	put_unaligned_be16(reg, buf);
-	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
-	if (i2c_master_send(client, buf, len + 2) != len + 2)
-		return -EIO;
-
-	return 0;
-}
-
-/**
- * imx412_write_regs() - Write a list of registers
- * @imx412: pointer to imx412 device
- * @regs: list of registers to be written
- * @len: length of registers array
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int imx412_write_regs(struct imx412 *imx412,
-			     const struct imx412_reg *regs, u32 len)
-{
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < len; i++) {
-		ret = imx412_write_reg(imx412, regs[i].address, 1, regs[i].val);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 /**
  * imx412_update_controls() - Update control ranges based on streaming mode
  * @imx412: pointer to imx412 device
@@ -543,29 +445,25 @@ static int imx412_update_controls(struct imx412 *imx412,
 static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, u32 gain)
 {
 	u32 lpfr;
-	int ret;
+	int ret = 0;
+	int ret_hold;

 	lpfr = imx412->vblank + imx412->cur_mode->height;

 	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, lpfr %u\n",
 		exposure, gain, lpfr);

-	ret = imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 1);
-	if (ret)
-		return ret;
+	cci_write(imx412->cci, IMX412_REG_HOLD, 1, &ret);

-	ret = imx412_write_reg(imx412, IMX412_REG_LPFR, 2, lpfr);
-	if (ret)
-		goto error_release_group_hold;
+	cci_write(imx412->cci, IMX412_REG_LPFR, lpfr, &ret);

-	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, exposure);
-	if (ret)
-		goto error_release_group_hold;
+	cci_write(imx412->cci, IMX412_REG_EXPOSURE_CIT, exposure, &ret);

-	ret = imx412_write_reg(imx412, IMX412_REG_AGAIN, 2, gain);
+	cci_write(imx412->cci, IMX412_REG_AGAIN, gain, &ret);

-error_release_group_hold:
-	imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 0);
+	ret_hold = cci_write(imx412->cci, IMX412_REG_HOLD, 0, NULL);
+	if (ret_hold)
+		return ret_hold;

 	return ret;
 }
@@ -800,8 +698,8 @@ static int imx412_start_streaming(struct imx412 *imx412)

 	/* Write sensor mode registers */
 	reg_list = &imx412->cur_mode->reg_list;
-	ret = imx412_write_regs(imx412, reg_list->regs,
-				reg_list->num_of_regs);
+	ret = cci_multi_reg_write(imx412->cci, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
 	if (ret) {
 		dev_err(imx412->dev, "fail to write initial registers\n");
 		return ret;
@@ -818,8 +716,8 @@ static int imx412_start_streaming(struct imx412 *imx412)
 	usleep_range(7400, 8000);

 	/* Start streaming */
-	ret = imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
-			       1, IMX412_MODE_STREAMING);
+	ret = cci_write(imx412->cci, IMX412_REG_MODE_SELECT,
+			IMX412_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(imx412->dev, "fail to start streaming\n");
 		return ret;
@@ -836,8 +734,8 @@ static int imx412_start_streaming(struct imx412 *imx412)
  */
 static int imx412_stop_streaming(struct imx412 *imx412)
 {
-	return imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
-				1, IMX412_MODE_STANDBY);
+	return cci_write(imx412->cci, IMX412_REG_MODE_SELECT,
+			 IMX412_MODE_STANDBY, NULL);
 }

 /**
@@ -888,16 +786,18 @@ static int imx412_set_stream(struct v4l2_subdev *sd, int enable)
 static int imx412_detect(struct imx412 *imx412)
 {
 	int ret;
-	u32 val;
+	u64 val;

-	ret = imx412_read_reg(imx412, IMX412_REG_ID, 2, &val);
+	ret = cci_read(imx412->cci, IMX412_REG_ID, &val, NULL);
 	if (ret)
-		return ret;
+		return dev_err_probe(imx412->dev, ret,
+				     "failed to read chip id %x\n",
+				     IMX412_ID);

 	if (val != IMX412_ID) {
-		dev_err(imx412->dev, "chip id mismatch: %x!=%x\n",
-			IMX412_ID, val);
-		return -ENXIO;
+		return dev_err_probe(imx412->dev, -ENODEV,
+				     "chip id mismatch: %x!=%llx",
+				     IMX412_ID, val);
 	}

 	return 0;
@@ -1180,6 +1080,11 @@ static int imx412_probe(struct i2c_client *client)
 	if (!name)
 		return -ENODEV;

+	imx412->cci = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(imx412->cci))
+		return dev_err_probe(imx412->dev, PTR_ERR(imx412->cci),
+				     "Failed to init CCI\n");
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx412->sd, client, &imx412_subdev_ops);
 	imx412->sd.internal_ops = &imx412_internal_ops;
--
2.34.1


