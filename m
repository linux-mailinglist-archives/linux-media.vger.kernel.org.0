Return-Path: <linux-media+bounces-30002-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165FDA855BE
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 09:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 802424C4A02
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 07:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD433293B73;
	Fri, 11 Apr 2025 07:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x0etFOZt"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013046.outbound.protection.outlook.com [52.101.67.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3750A293B6D;
	Fri, 11 Apr 2025 07:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357479; cv=fail; b=lmdwBcOdgknxo62Y5yysBofyMV94dE73XebPfjIsTfY0y72+gJuYuLQMYwq+0gSeZv+Al/yvZQDHkumhxTFwciXJoLsoRB2DlgUp1qx4/huIzUilJ5oHUSuRIGTmKzAQEQHtv8KhElfKPoONLNckEzppqKPfaUQgyuqnlIRG0ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357479; c=relaxed/simple;
	bh=M8EMYRDnf7IYuxSOo96fLIou7nDjqk5IwOHm0aaAhqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=db+QEsL61wLrRI2VS945qmrlTXfpxWP/yUgttP5qoCRwQnH/pkOwIlL1omyRHwLlCGMI9uhiae8eWjd9UA2tvz0PwG55zsPuWi9J6kyBN9xNk40czMBW9VskP5eR6uT6ZdGTCHDjr+jDWVheTlj3nYM/O1gWZRfD0+o9FIwFTzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=x0etFOZt; arc=fail smtp.client-ip=52.101.67.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUUnaq47J/T3Tc8ouD/vDhn5ggmK5o7MAyuBGceo0q2VyF3YbYiIIQTRuZfrr2KCIHPU5Sji+TB2AGSsjym4KDD+O6AkH7zTp7pUZFwfr3t5vzZiuQ53+xjRD9f3heVNXToekpxd19rphG1S4jALf2z4A6utvQM0XvW62eBRyHOpGTgdjegCW6h2OaBGTEXjDY1uL7yqKv3Q5//KYuI68AFEYYvfJ+NWQow6Cu7MmK3atz2vfvTJroj/zQ33Fgtx4USUJnu30ikGkSeWGSiYO0Nr9qb40uwf7+R3KplGCgH13KNPydzdF75yEyZfG8Yc0Ehn5+OzCYR6IuhXYT4KIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbBELgs77b7lIUpwOS421z6ZzsJBpZxVQvu+YxmPQvE=;
 b=wySRgQqxGVW9ayuY82uq5f8G6DaKMbjragQPtvHf3M6YFvPKu1tKJRGOnusWPP5tNLH5kWPTu25lKWVIiYFpjnynaOw9tAfxMknd2F7Xi3rQw8jEGLg8mNjhfT5Nv6t9p3FZlkjGApn/R13u84XroWeCQ8+du2op5wc6LU/R7w10u1E0dTUI8js/7a0ukL3l9vkNcL5t5oQ2V185JYp8fSgdBB/J6pA018WthPnnURHaXxKaS2mFtXC6wc0r7LB3SUdEaJ0fwg34v9mE+GbhYuBQ/P1Th8lcpKUxlx+ALBdpLXf3XY7Uh/tcysv7lC6+kF1PC9PM44WmeQz9xnFdoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbBELgs77b7lIUpwOS421z6ZzsJBpZxVQvu+YxmPQvE=;
 b=x0etFOZtwI7Y0YtcXb4spo9XiZjdfNqjl/l6tNEdg26Qe5GqK58khSq+1133QprMo9MrFNyqGtXZgX31m/413tTxmCCc3YAJ79t8l7Nt1dyWoNZKyNiWFhPahfayq+vy+9LCRHzAVk24jvfOoYXDzZhK6Fzi/FljZpbgOR/lcq2XFDgP8XhaRgAk1qIeDfBLsJMxJGK1EL7AdCjuawpKFNCjQucCoXmJen2AvmHF98YGs6RJXsHEJbQeXQz4WE2ReLo68CcnwGf54gx6xzdsdvqGoHfO8rlIpr6d9dUg+MPmFC3t/PZtgqIaxgj19vq7Q/Tm7LAGxTzNsPLnNSSKGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DBBPR04MB8028.eurprd04.prod.outlook.com (2603:10a6:10:1e0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 07:44:33 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 07:44:32 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/4] media: imx-jpeg: Cleanup after an allocation error
Date: Fri, 11 Apr 2025 15:43:41 +0800
Message-ID: <20250411074347.809-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250411074347.809-1-ming.qian@oss.nxp.com>
References: <20250411074347.809-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DBBPR04MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c364c5-819f-4e5f-4637-08dd78ccb287
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7ncsjvC12aAUtRzxPnFT8qn64gJLvsCY0EKX3FIOT/ctL3BvFZi2I95eBCXG?=
 =?us-ascii?Q?A/wHdy2VegB+XgKf5Vi2eEWIaxv8bKd5sijBdamgzplg+w/6+rrtaaQ2e9ef?=
 =?us-ascii?Q?uYzrAy35IbZLfAgjAvlEG4Bs+i3ZNvOVndJuNz1w6mWEutbW/pY8KlH5IiRu?=
 =?us-ascii?Q?UyEJVmAlUYPr2G5GZtubmRvOwRj9R1lie4egM/SpSB+zJ1eveTWV7iR42xIH?=
 =?us-ascii?Q?U0/7NQv0MlS13ZyIuwFfc86Qv0eahZg28brTNvB0mpEZCSabAGVNXDm13FtY?=
 =?us-ascii?Q?AJ1hUqR7h66uWUFZmnagqTmHr+1Q3fBc+TPOw3P7osNS/bFFUEjOaS2hFOCk?=
 =?us-ascii?Q?gErqeP192e326ccxFt0Kn8P/4v9vIAsknWmqYWvuNmnVBl7nky8R5tjpcW+4?=
 =?us-ascii?Q?zN1btBeMFFcDMDPZA7yuVBb4rLpu3669ORaX/CnMkhcdUtHP5TLEA30cAvZO?=
 =?us-ascii?Q?FEz9bYeeMkb+XbZHDA4EGWtNgyeB9L4/7Ov01mGbjib7OaJVs6j7+quX1PfR?=
 =?us-ascii?Q?OCOOndpooBdfqwRHF+hNm4DZ8F5fPVSQ67Je1g6KAk3KCE0R6MlxQgXW7HnF?=
 =?us-ascii?Q?j5AWn89lNQJ12VcWSE7nglrLjG29GVjYlr8P1n32nl6baVyN5G4026AkVtzI?=
 =?us-ascii?Q?b/BEX1Z+FKrtoFSyQOvIgmjQTSuKqtvtHKXmifYL/JG/ld4aG2NC3n6mtCSa?=
 =?us-ascii?Q?iemOhcFM8SKLX6fDEPY7U8yVk3Xq0BWlRL5TymG6JADhJfTh/u1XSKHhA2Yn?=
 =?us-ascii?Q?VEvkrZ6TXDQEsK1QUe6hk4M76Rf7o7lFyjYRo/d5MqWGJLQf8vgOMESYYXa+?=
 =?us-ascii?Q?HXxHR2ztS5/RS7fWEPI+P7JIUU/P16E4BfgBbnHhubhPN6529Vx6Qma8GfUB?=
 =?us-ascii?Q?x4WKABjzHFxZOAgOoSnY4BDtkmyFbAnZBo7ePqmX4MQ07r8pnlNFUinndmmt?=
 =?us-ascii?Q?+r8mHt49aAQXf9p63v56L3dqyaFE57RsRAHOYkEYWLBJUAN6BIwM5b9zPZDC?=
 =?us-ascii?Q?Ik6OoARq20npuJmuTqWlFUVPaw1JbpahrcBn5Hn5Gr/aXK7g7Nd+XQqR1ocZ?=
 =?us-ascii?Q?nTpjzTNJb5CFdP2lxhE8P+HEJ1nMgLLc9mUwihxXs8OEo5VP5d5s1zEi/EDL?=
 =?us-ascii?Q?xATNvkp9VsHqcJKgxgAk5UJ7dXxYHqYTiS3nuQzm4FXYB9F3naksnMg/EW37?=
 =?us-ascii?Q?iFuiI7/A+ktcBjaFKHnHmn4gAMmxFJrT3/wJGLyuxERthPKq2nVaZnS2fx9i?=
 =?us-ascii?Q?Yx0lzrEBgE9lCJIeNC/GfWlEP/HLoEOFsAG1r2841GH9fLoDrnOFe9vUQwYP?=
 =?us-ascii?Q?fETs4zmfUOJvd8/bma0O4FJj0l033mrkrsY0vVSxaq4tCD44DnzCtOVRCOBQ?=
 =?us-ascii?Q?JWSJ2M38DffV0Ed9kiYhjn71/HG+0D699GoOzx6Ybek43Q9WS8TuaD4+D1W3?=
 =?us-ascii?Q?zuGzlHR5Tc4HAphqtvacnsOHrtax5ng3gsCPO9LG7lVjROdOMy8mRTNGX8ei?=
 =?us-ascii?Q?LO1OpFRAXyJoSyQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2fnlbW9mRyS1fDuhLogFYJc2dStdAy0gInTzAQ4ayM4ZKaGnz9NBaRVu+e4Y?=
 =?us-ascii?Q?MmuYiiVDA+8PL4RMBR16Kj2XmD6BEU/ESCsODwvP3Bl5PQChg7KT5mvpoEtI?=
 =?us-ascii?Q?e/l93w186MMgIz6gGopF/HWcevNTA/cDujUztR8Tb3QNC9d2wXL3esfgeS4w?=
 =?us-ascii?Q?YBQv3lT+SBRn4iYOF7UOzNaVnLwkgTj1F8BwsUPH9MiXvN4I43D6KCxIZVvN?=
 =?us-ascii?Q?/GbvOFx3oYuPta18piT6gMqEELmmkVo/9PRd9E0p/l2WuPnoGRybNx7oZfkC?=
 =?us-ascii?Q?7Mg1dcE7h6ZJkLTEmKBFm/w6H93rGJOlZG2sR6kpIrXu2ZdWIAeIgcVVlywP?=
 =?us-ascii?Q?6yFBmqyUAD65SKqo5Yfu/HDEZbYGBEtB1ENC0VFXiX+qMs3KU6hc7LKRGu6H?=
 =?us-ascii?Q?IjCf6SUoXzM/vHPi1LYf69bQbpfL7ib7/uyHNG6gZlDiNxciEi8yBt/pIHuN?=
 =?us-ascii?Q?K5FM/XSPQiBZe8HoSywQW7YxjDqMCv1EBXp6LsB2gymqa4a9HB6daKcDm6uU?=
 =?us-ascii?Q?Ey6U/SxzvzxOXVBjmVmo6bWNe9UQp2PKY4fLqcldECWfb1xNGbYA4K2ZYPXF?=
 =?us-ascii?Q?BP8sg1CnWrkXsnEaGCDcZkz0FwDbO8AFChVyxUzM4JNWnWaF0Q09I9rYW8ur?=
 =?us-ascii?Q?c0Lv5DDskbF9eIAUNfJiVrzwf2Zh12lxGDcWRCQV/CIrYuyIGWo31IyhvAwl?=
 =?us-ascii?Q?3/1PjR4a63yhC2aw+VVTREHnkIhCAyXhnM2P0P+eG4MwN/EWOeR2bbzo7D8Z?=
 =?us-ascii?Q?TVitHHqCg1LK0REYIooibgC34OEBO2qRqSMuS9fc2dJiDGBqIXp8H5RbXIBA?=
 =?us-ascii?Q?0TeJD6Qx5xq3hiDMgQNxlOVKfXXi07slDQU1TFFqs8djLKCKMOFGl7kOSCVf?=
 =?us-ascii?Q?8BfeDm1R1qru9DwGhYII5DBvWvPQr/z6h9FFRfhe2ThJllY2YcYxb9+1/Mly?=
 =?us-ascii?Q?4Y+5r17keqK5WXBKlXRkU3bom76b5H/j9LvsZ1+HM08AOjtRXcd4TVdMYtKy?=
 =?us-ascii?Q?R1JynejZ3irALqaBXiOCeqbL5K1izER2d8uBL7Kln9N/RnzbRU7DCJuEu2LT?=
 =?us-ascii?Q?lkIiRIpz9+h9IcF6wi5s17JyDTcuYEjL0EJq1eY0giY0dUnSckaKGvs5v8Oe?=
 =?us-ascii?Q?b4lzwIykzy/MFLC38WVoYDzyCWC9wa2X4/Ygs3Rscig7Xl11tH3I+blXOiRK?=
 =?us-ascii?Q?zPZ//5uANq864KTlDtlbwTsRmLJCe8WkzSI3F/d3V5+VVG94Jt6GKy3ehrgz?=
 =?us-ascii?Q?Xp9ZMllS2u0PqkmeeIt4leFdHQ34Z61pv/pcqmngvtxvCPwciNF/m5EpM5VI?=
 =?us-ascii?Q?AKWbfKVYm2dJMNATBifXNleb2SB3iyeSoh6B5p66+woT7qTNkVEC5FVSqZDa?=
 =?us-ascii?Q?1vslSmT6NWFS54KSqNfvqkZ5z6xOqlKHjd27B3JB5mDbwpaTn0XoSBWjLXVf?=
 =?us-ascii?Q?ilay0UylVaL6P+JqLI2w3oLyJIk3e/8zExmrwAhhUt8Jz1xVsnsucGakB0LQ?=
 =?us-ascii?Q?kxthn6FtVRBxI65vEXU4P9+2yO9H0aYMF8ik9c3hUxozCXByDj8rXHLx2Oo/?=
 =?us-ascii?Q?nwY3EZNp+x+pEHXjDuajT2Y/Vi3H2GyIDy4OrZvq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c364c5-819f-4e5f-4637-08dd78ccb287
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 07:44:32.5426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXOONw2APEw4jHpyW1MEiTS7TIYbJ8XIvrVjla/jVX71RsfF93dhZCf/xxv8sKkMNrcQYDONddv+AQzQArMXHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8028

From: Ming Qian <ming.qian@oss.nxp.com>

When allocation failures are not cleaned up by the driver, further
allocation errors will be false-positives, which will cause buffers to
remain uninitialized and cause NULL pointer dereferences.
Ensure proper cleanup of failed allocations to prevent these issues.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index b2f7e9ad1885..12661c177f5a 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -820,6 +820,7 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 	return true;
 err:
 	dev_err(jpeg->dev, "Could not allocate descriptors for slot %d", jpeg->slot_data.slot);
+	mxc_jpeg_free_slot_data(jpeg);
 
 	return false;
 }
-- 
2.43.0-rc1


