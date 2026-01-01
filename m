Return-Path: <linux-media+bounces-49816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B611CECE03
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 09:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DE513009AA9
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 08:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C0F23E325;
	Thu,  1 Jan 2026 08:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="CwUfq2nZ"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020104.outbound.protection.outlook.com [52.101.225.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07067238C23;
	Thu,  1 Jan 2026 08:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767256995; cv=fail; b=N6GltsFIMYSARRoSe5Eui5Y/JhpLTL/8JOma4S44Nu3q2RVldwpdHRa2suM5X9IuVYCkGAF6lb+AIKqtwxf9endYsSZ/1FfCAyuewu/EsxtKCLzOaTJzdojzUQDr8JXmFoYpoKLphT6I0bAs54tTadbUPUPLwgX/rGIOeU1ZY0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767256995; c=relaxed/simple;
	bh=4ekUpYqrbIDtXYIWPT9FscCUL9qfAt+yv36O81UUe1c=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fG8XApbmvOCk5AQCOvAeTxy6i9NXm3IwYyZEngXVQ1VTwc2dVciiB9UutQvbnDdj1XrLQOQZVpS9mXVmdGW3nzv4f/01sICgP3C2kfU1i13pp35B2+Aky7rgGVbUj/GAk9A83rCujQ631w1gaNyXIVQp6/gnDvfFnOb9gmvEJLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=CwUfq2nZ; arc=fail smtp.client-ip=52.101.225.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRdIzm1OfBY3gAS2N+SY4CSEnyoM7SIg+3Tg8q7VLtYqi/t6yIzNqGAf6799iHUm574ScwaugRiM1e7uN1h3s4xjzpGITRXxy5Uu7kFAVXCLOgCxTsCiJR2KRr1q5yVDC+N3vQHF1r3UvG3Eg0HvPQpkBSraG8yiv0F19/4zy10a/tPU9Lbq7OwPj564iVTe6g9TDw16Gq9W1p6CArqt11eYLH17Xd9FjwYpTHcYxpp5LJmvupVQnf39LPyRPt6U0sfUibwbxr4P2+hZfJ2Z0dB/YQcRJxrLztLoiIPlY/BKaBx+q+15SniEEimJGoDrOQz0BoJSKKhc54MRsTIHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lpb1u3DeevbALCNMqll6ZJW8/ZAvBMM7gkU8rhYoKzI=;
 b=gt0frBKEbkyTQeUvk1DZNZ7p8hI44lY55Lh0ZFCrTGJ7ZXmPNA/6seHRlLqYp4zxKUEp8+wfmXsulq+mzBvg0F9YppFgJbcmlqa8TRmqoiMziz6od0rWCjCENcN1MfxYjevpJRJKcUzymPy6ORBXHK9HtIXikCwKuZNliHmJ6mu1OA07hnWSSANU957dxHCCyjBAF7ECVAmTUX//yYvkrKs6Ulfh8XNAP+74k4572+Lzo9cju7DCxk8Ni8Z4jh89c42ILXAjRU5uOxq3nI/savSAFV2ypFi4IvLxpfjuMh3FemQx6+WzgVfNbPXOsVSPX9w1YwMAycA9WKhdflIVmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lpb1u3DeevbALCNMqll6ZJW8/ZAvBMM7gkU8rhYoKzI=;
 b=CwUfq2nZtb8D0FjWrn7LiKnZFDOBia0NInOzPO45imegDQe+U3OWbVqUFedDRhedWGr9SKhQiGKFO+Kne9UBXNjseSE5Q4dnH76f/sEFHecxTy35SCUmH4DnIgdZsHlY2mPyOAy140myHUrR2PrjjGDD8tqTQDuyzZG2UiI17zDdxDf89l2+TIOq8WOWzrnUnIzcEiGpNQRLhgJvmWYfI1sQNSbSYBPtozY1AFnzVJjhuEf/DS9g6Azm8W9E1Nk6aQb88JbY6LFmrgJ6WeATTuOaDB059JPZm2pjIIXiVVWwOHj/EOvJdowi1gv2rbILU9uUY6CPmLs0yz2OSrxT2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA0P287MB1159.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 08:43:08 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 08:43:08 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/2] media: i2c: Add os05b10 camera sensor driver
Date: Thu,  1 Jan 2026 14:12:45 +0530
Message-Id: <20260101084254.20014-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::17) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MA0P287MB1159:EE_
X-MS-Office365-Filtering-Correlation-Id: 671f1dd3-7cbd-46f4-72a5-08de4911c9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D+JQv5EU1LJwGze7PnKup7utIUqpwjfgplGbQx02pI9Q3N+Pzislh7EFDLkK?=
 =?us-ascii?Q?eIfPHIJ7MYxjvu9qCUsFsUGi7d3n5P6JhOnrb0ZTl69FLB9o8sWABgdWN4aZ?=
 =?us-ascii?Q?+m1Ni0bWFNqba3PfT45ww9mlfIgQwhxjJHejgdIA0EoIMIv4zZ7+Xq60pVNH?=
 =?us-ascii?Q?J3ESapMY2xoBm/W7vBU1Lsc4p8E9YqOg/Tgz5q4X6+/Axa0sY3fnXrmwzyJC?=
 =?us-ascii?Q?/xdK7wNwHg79UJyJoiQbCNynFFgeXCxDmh33vZUCGFhvNz2XT7TrEJ7QF80N?=
 =?us-ascii?Q?GH3miQUJTL0XdGT4P750D9NNEb/5/cBrf0IHn9KFfgY9H21cGLwDUZG0X5sy?=
 =?us-ascii?Q?FxEf5DTRe2dN8nKWfj8FM0bT5yFcJoPM7le27M/fMR1G9/mk0qKWzpS/p4ID?=
 =?us-ascii?Q?sNV6jDLfZoIidczWUKKddyCG5ofYxevaLhJrWcERYQnMvOhyTydc68/ZwQOO?=
 =?us-ascii?Q?FmyXY0kbtzuD3YSpNasfBhmlKPEYXPQ3bA2oA35344zXjvAnjBhCiREoZujm?=
 =?us-ascii?Q?sU5XsDikLOjyK810Caky5XVBU53t3Gz2eq2ZSnb9LEcLaPER7EwY5obbuoJ4?=
 =?us-ascii?Q?/qKwRQaqpCFpgZBbiXZ151kJL/3WJUvySpkqUBQWgOACXrzUwd+d/oEzx65p?=
 =?us-ascii?Q?FdT0C/Q9MG3sRgs86V1SIX/p+UP4zx0uw9qUTO3dhJjKe9kame3Mc7b//+Ud?=
 =?us-ascii?Q?GBBL2a1eNiwKz3k3QsGwVt9d49tWdCLfKGcLj+iRDrtqvJ6ZuJn4rrFQvAfW?=
 =?us-ascii?Q?FLwl86gyrI4icL3U9dhJftctc4+yErPnvzTlxOTT6kEY8qHeYgKMWDp861hk?=
 =?us-ascii?Q?MhRQnmPaXD1rHgw5F5+mvbBdq6Hq/ib8CslaukQ4lNP+jlbARKw3U+VCmWqZ?=
 =?us-ascii?Q?7ONZA7ztdy7efae3g0s7E1MxqIqZ9uHXhjEUVg0IQ6jYWspd/u4RdxibTUkh?=
 =?us-ascii?Q?/5EWHwFYQbntArXAB/CGDZivhSaPbtJo1Xs0S4G0QzNMmCPeatLqpghKOZ4j?=
 =?us-ascii?Q?NVB1N04mHfmjA1XVZWZ06UHFn+sZRrVNI60NKkTRoeJwQ/qaC9N2jYWll4fi?=
 =?us-ascii?Q?ErDxhmlgytwPoP0pRZun/FEJV0Pj7zFPzptwS0dAR6LQRMdEVK4gaC91nQ2v?=
 =?us-ascii?Q?MrbxlQGq0H848yO/NMsflpx8XpXH2wEz4J1FpfbusVJ2UGiCxrLYp2Rit82p?=
 =?us-ascii?Q?fLAiXPw6Ssv1YSNBAMJNn7U6XvKANN2fryUtwKORd62zEpK9H/P+nrxHejRV?=
 =?us-ascii?Q?ETAERtUYVGl9G+gZrFOM9yj1j6yie9LmiEaPOv12jeUlC7LKodBfzi6xk1Px?=
 =?us-ascii?Q?o1H6/Fytb8/TOvRbz7pNd4wMiDy0nYVxzTnCSowOOLkJISmvp/YHC9bdSaus?=
 =?us-ascii?Q?KgeFqb6funyidkfZTl5DX52nz4cFpejkYs4Jnt2PFwTxx5ljaQq9fF0lDdRs?=
 =?us-ascii?Q?on6ef7QI6cVEEvVXNhKeLyq3tQbYKQLap9XFCWyDLM0A69wL8iduGBRdG23m?=
 =?us-ascii?Q?RplMvIe1anh4pEwGd7xiIBUjrzF7ZQED/A32?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LpKma2XM0CJEeqm/q+NjAHPzRa24/L4eKMyyymMS2ecv8/syxUNJACpudbeS?=
 =?us-ascii?Q?hRtcPCeLCZpIAhlz4nB1Tq/8j1VGS9ZCpJURgaDYMlFrvOTXZGvXG2VPqghR?=
 =?us-ascii?Q?ly1BRQ91NlWxnmtghWlQQobVy5suPgMEOAsXRMIGBxh6UDIq/qm6einU/Syi?=
 =?us-ascii?Q?ioXmtKMqcGpturqybASNjFe4Z5lCAKqlb7SrOgo4uM61uAwfMfcTXwj3kroO?=
 =?us-ascii?Q?+MDpf53Jf6fzgZ0JejA4GVuOj9UnM9X6w430D483W2YA+fLJrCmxmfq6bUfv?=
 =?us-ascii?Q?GEMjLadd4+aSPUDgKNjbw0g7+9k/EEgWDg6GCgI9ycbLx40RHVwXOvlB6Urc?=
 =?us-ascii?Q?SbVHrPCaQoJlnm6tJTpj/WkNG0H7glRkxM8Fo7Gyj0Z4xULfj9PapF5kkLkH?=
 =?us-ascii?Q?ahv0cILcJyeyG8wJO8odhEUSX6PYT+EokLA3RtBFTA6kBKsNku0nzzj56DfF?=
 =?us-ascii?Q?NX5BmMcZJXMEo8xHQQ3SnCwg9CWlhqeG8+pJDjkEn6+p/0bXwhKyqmr4yvh7?=
 =?us-ascii?Q?XMvvyfzdDK+ksPqvT143gyWrXqe9p0o8xITQPKNIX1n8R3Xuxqe/vZbuVhyR?=
 =?us-ascii?Q?jwx8k4sd6mNe3OGlglqkHwwN8X13qWtwVYjZyrw9lHfXdWkzJTn9sJzcKsLm?=
 =?us-ascii?Q?h3DpjKUfQ0FcTq+qoGgOHHyO84zRI/CnMOQy1Z2dyxtF61mgVhFQTi3akd0/?=
 =?us-ascii?Q?RBoVpRj9brDtRJzzAlNUd+kQoY/AO1S6OYANR5hFhDn7NFWt5EFKKDCqgiJ5?=
 =?us-ascii?Q?kimPCiH37vyh+pJSuAPQ1i3ptVOYC+SsDWpt7zMGLb29JJKk2EfhO3Ttq70A?=
 =?us-ascii?Q?fCnL41okLXogd6Jh9Kf8YjzLbTLekdcumB9q6yaH8VJL78GWqtFQAV6TGUKw?=
 =?us-ascii?Q?HFFNIRr7MAfvQP11A0qHx4d0uwTor9rGzZxqSCYrROCZY1OAoaAnV4Peia/h?=
 =?us-ascii?Q?UH8VymKLDREuFupT9Yedl/EphBxW+4pxwplLemUUwtYTEZx+Mq82mflU6dL5?=
 =?us-ascii?Q?MYZZOhf1bBPyv5RZxsPZfSlspL04pQD0LPN67eh7mv4qP+9KQdrgWGnEwMj4?=
 =?us-ascii?Q?vadB+MUOznTFWlNirpMZk2wt4+hgwst+t4TfSfsOwPTGrBaeXJW5c+ML9JfB?=
 =?us-ascii?Q?3gvNdAy/8OETxBM2i1tvkQTMdKmSrBAeHPFJSdYBhQHB7qwf8FaCkNBpjaDJ?=
 =?us-ascii?Q?jUZsjO88+GOdhQP0akzhJlwlvAtnng4CGy3Ya5KxwFw1MVz0QYZouRWuxUDL?=
 =?us-ascii?Q?mV8GtWEjXxmFIfN/Zr18LLy8U0cvHEjE9u7sz6HHwSbCfAxXi/w+Hjn4i6aq?=
 =?us-ascii?Q?qdUymTfntSNMws2QYhn+8/bgs7cYcYMSsSVcsxonMujI2Z547GGEmcFKFjnX?=
 =?us-ascii?Q?hwcydOdPPxM8jniUoTICRI5gppS7h00BFRTB8iEe4hSBy+EN4LDBPxCKSxXX?=
 =?us-ascii?Q?SoNrdEUQHgEtJOIV2AHKnyIA7CWu2dDGsdu2hAMpq93xuyKZZan0XptDvcnE?=
 =?us-ascii?Q?eRZCkkZCViF1RUnkaXvjGqgpDq+zRt1o9/MGtGYtunrInTOxWMcwAMkdfSZm?=
 =?us-ascii?Q?+hExIH7Pmc9YXVfIPlbg0mFLWRTZR5AbCpcZid1kq8fslJyR+DTz0qXJ48Zc?=
 =?us-ascii?Q?boRlWCnOQ/BgWL6qpys7qEvdNGZVHcZcCacxj9T+KWRQiqKEb1O7R/Un+59k?=
 =?us-ascii?Q?RMHhlg6tB8lD8ZezU5jQCOm7L0DDS9trJ/3yPrWTK3WVy+ODMQpSrGS0gYSp?=
 =?us-ascii?Q?zJlskNJ0V+O8fhSln/+O6LkcYSb+VXPaytZ3+I/XOf9OOzn7gS1/?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 671f1dd3-7cbd-46f4-72a5-08de4911c9f7
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 08:43:08.6069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MszM/XjIr7TXXw75u1m3L57lETqIhOqp7LRh3quRFuY5F5xUgFjT1n13rl9RIq7dvYTUektnhoZ4+Yy++4tISIrBOaprGjK6PoipOJgmTASrs0kWPAWMOFYiOVzQMqgq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1159

The Omnivision OS05B10 is a 1/2.78-Inch CMOS image sensor with an
active array size of 2592 x 1944.

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Supported resolution: 2592 x 1944 @ 60fps (SBGGR10).

The driver is tested on mainline branch v6.17 on IMX8MP Verdin Toradex.

v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev3:

Driver Info:
        Driver version   : 6.17.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev3 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 9 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev3: 44, Succeeded: 44, Failed: 0, Warnings: 0

v7 -> v8

In Patch 2/2:
- Reordered registers by address
- Removed redundant control registers
- Fix HTS mismatch with CCI setting
- Set reset GPIO to HIGH to keep sensor in standby at probe.

v6 -> v7

In Patch 2/2:
- dropped __func__ from print statements
- Switch to fwnode_graph_get_endpoint_by_id().

v5 -> v6

In Patch 2/2:
- removed the unnecessary header includes
- Misc cleanups as per review feedback
- fixed reset gpios to devm_gpiod_get_optional()

v4 -> v5

In Patch 2/2:
- removed the unused link_freq_index

v3 -> v4

In Patch 1/2:
- Move supply voltage information from driver comments to DT binding descriptions.

In Patch 2/2:
- removed pixel_rate pointer as control is fixed.
- fixed default statement in os05b10_set_ctrl() to "ret = -EINVAL"
- sort the list in "reverse Chrismas tree"
- remove redundant check from os05b10_enum_frame_size()
- add a check for number of data-lanes

v2 -> v3

In Patch 1/2:
- Fixed space symbol is missing before 'optical'
- Changed the reset pin control to "active low"

In Patch 2/2:
- Correct the module name in Kconfig
- Fixed use of dev_err_probe() on endpoint parse failure
- used devm_v4l2_sensor_clk_get() instead of devm_clk_get()

v1 -> v2

In Patch 1/2:
- Fixed indentation.

In Patch 2/2:
- Fixed bug in probe() removed unused variable "ret"

Elgin Perumbilly (1):
  dt-bindings: media: i2c: Add os05b10 sensor

Himanshu Bhavani (1):
  media: i2c: add os05b10 image sensor driver

 .../bindings/media/i2c/ovti,os05b10.yaml      |  103 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/os05b10.c                   | 1109 +++++++++++++++++
 5 files changed, 1231 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 create mode 100644 drivers/media/i2c/os05b10.c

--
2.34.1


