Return-Path: <linux-media+bounces-28973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5CAA75451
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 06:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C712318949DF
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 05:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F146B14B08A;
	Sat, 29 Mar 2025 05:45:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021076.outbound.protection.outlook.com [40.107.51.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813B635;
	Sat, 29 Mar 2025 05:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743227113; cv=fail; b=Po0VOdSf1Qi+hEZG+zfiSxzsEY6a+U1r/kOl9AAXDNX020EKzQ9WSRNBt+5wGM0D7dKvwG71ak7nC7mXK3Ge0X4onspf4F97l6UoaJx4QlUaTB0ykARvu/eRG2Hcj+U4QoqX28EFjc1HmzLRCLzHTeRbqMKuSI8iMNJ+j+mS1Bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743227113; c=relaxed/simple;
	bh=qQdArGgCGz9qNQuFAQJziaxvX+P9/ZOof8l5juubiCw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WhgcEVCDAdGxEbvTK1X3hvKFAyNU90RytDC7/ocikgw+GKV657/Kz+yFliwuzl0zfBLNQW7A+8JGobMIWyZgmQrG55f3k0rz05KDWSF5VCliQSe4X2bnHoxQ6XaWbjCliL/nX0ZFtJlwAWWvL5BMGucVBh+r9+1czWuPxzLRwns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwHMhyKAEUTOG897DHdGGGW3zpZ2XIin00sPTqfdOj59iKy7qpP0GdWk4emc5lV6OOWzAABg5DbFRIBUZr0foMr6UB0aNuG3YM541eovdQMxZ+/zJ68D2CtT2nIt4Pg1ITbW+4407onwXDtS6f597/yJACq8AzcTmEdFZAMf1BtN2GG3872vt+/VmANWVhh2nq9ucftmqZ6lwf5IAX/Rp0a3tpMfkn3TV/B6v0Gv6Dczg7HXHu+CSdJVMcx9wLsYhd9a39KXSSINlWyISxCT0bvCgZaVWo6RIAgqVVhANzAissGllUkiz8CFm7IvJ1LCQWUT/LqpGrJlmv7qiZbqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFg5I6UVDOm1lyhpCs+XxKvQ9WCNGqcaRSZH4CzijM0=;
 b=v45IXwPWB/qxHTRl0P02SCg/ftGN0YPmsZWh1psaHoA89+0d1stZn22S91UqfLK6wwvSuPa6Iiizc8uf74pibHjNTBRON/HVX9O79XjhDsaaBiSpuxrm9aiNnpRXZZ7DqmM+Eu3Oa5ihbFBrZJhk+anXcrhf+URmzvZjBpNTYRjPAylvcY0eNDd9B1x9tpUBg/FbdysZcjf5IK1DdFeXk3s9+TJo66SbWsbsOtPhNWbGxwyOhu45fEWMGIllZt6sKRFC1AiebZHf01BMdLVwMeN1wwyEsq5IV+NzM5uigbH4HzPdIIGipiWwpPhfg8U3euX7fLKAyEtUTFvXDZvXKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1842.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Sat, 29 Mar
 2025 05:45:07 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 05:45:07 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] media: i2c: imx334: Miscellaneous cleanups and improvements
Date: Sat, 29 Mar 2025 11:13:22 +0530
Message-Id: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: c7045549-0ceb-44da-c17c-08dd6e84dca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cKrQWgAILQQni8xwaY150g/hotF+Yzc1TkA97YpepARRLIf47eIRE8mPUnIY?=
 =?us-ascii?Q?jHy550JHx2/xHiSOjK5IL0/8FKSPeM6sAxaOBann0YF2acxbFsCzeKuo1M17?=
 =?us-ascii?Q?iR3RVAXJwHv7o+kzZ6sOvF2xNcv/wIvPoa19y07KGCPrbMLBFpQsGYhVJgHL?=
 =?us-ascii?Q?7NVnmNSZM1FWdbRavI7uhuEwbBZU7eCgFw9BDRu01Qm0uCzrKplIR01gDyPC?=
 =?us-ascii?Q?IMItbtklu/VeQs2todJC9KQlp5I60uvwTNbUyxk3hi9uf+YfIpsTZYSCLjdN?=
 =?us-ascii?Q?UEuHGfHBusJiiVQSMjo0pt5HShZfVZCG2WBcULqFjAD3gvu+gnI+jpqf4Xoo?=
 =?us-ascii?Q?g69b3ItOed509FA662MYSE9feoVPebIaCTZjE4ROvoKyqDEb+/nfZHFfJt61?=
 =?us-ascii?Q?TYtvWrYXZD5wFSB5o7HHgmv3nBZF2l25C4qxdo/Lrq7MNWphbZDXvSE+6yG1?=
 =?us-ascii?Q?iqQDtMdP/GYc4P06DF3zY0FHuzU75OXWQOLzHZHUV4/B9WZ11x8uxz88SxJI?=
 =?us-ascii?Q?V2fS0UqkVm8+q0s3VQTQiwwjyT7FgDfVAmkZJo+0nBjjFfJfSy7V0o6K4AIy?=
 =?us-ascii?Q?LvGwmjWZHxhf1Du9eD0v/6K7dR0HPG2WRA+8bFWAE1JzEJxjC0WyJgK+dhsO?=
 =?us-ascii?Q?dfSGc6Uju63tow+E3+1di/HmNcacoIWOH3g5EdzyarbFbOEYntweLxSaqW+E?=
 =?us-ascii?Q?IAZz69uC7dgFMWTY52usYmBTCCuqoAfyLKYaZVs6xRnnvlXR2BCiGtT8NPEY?=
 =?us-ascii?Q?UqXBnDuFt/BzzWm7Sj4aZn8L81keUXOJ4KFjfPVkLw2RrPG3yP+L04/j0btp?=
 =?us-ascii?Q?IwiDbonhxD+SCBbaV1+dMkFx8ETBDq+9Vf0sh55/zZI33MY/OiHb85YVW4SZ?=
 =?us-ascii?Q?3sZdPszVutb7nwpc7aOrl3KijSFiip2Uu+FYWEUERzFfE7KFCkwjvOgXhSiu?=
 =?us-ascii?Q?odt8CEFEGT/OQX85yWgVRUh9ntwyV3HShYuCT0jCarJtV6B3lQkvvQ5wki3A?=
 =?us-ascii?Q?s4SIGdj4bXoBYmmBvbSGjDl00zImmdju59X41uWI2bAfknWZCbDaExrqD481?=
 =?us-ascii?Q?uS3jtoPLt+h3Q3vNl/52SNAXAuf292AsPsreD78vh9QsYY3N9fsxeFzvVd4J?=
 =?us-ascii?Q?Ijxg5XSXaL3liXV4A6gRv9n/g+0GCp/Kfq4lfR6IWLVEGb/xO9Bb2s2Kwd/w?=
 =?us-ascii?Q?GJ7Xs3SFoQbdugmlJHQ/ZP4vLfm2y/KKdrMJ0lDk4zc4wwbRovaHXSOIWUOt?=
 =?us-ascii?Q?0lwfDKo9loqDiq4WpCG/2FqWn4gXZw29uAK/r8whFKiEBjmTdRTIJCECb7kn?=
 =?us-ascii?Q?8Y7mmH6Q/G48Xg7wdyN/k3rP3vBLN1RRWQI7OqCp6Dkjl9quqEfJgSNC3q7U?=
 =?us-ascii?Q?BVM3Z6GGjL43StWld3/9J/yKIGrAFS28GzWF7Q9kjcva/zTuIprg9epVqjv5?=
 =?us-ascii?Q?YmAX7mOUnZU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rSmQ07/xzXhBun3NO5FzYgyf00nIREG6VXmCoudJLfqIc/l1xwUsQ9NCouXJ?=
 =?us-ascii?Q?1cceivVJT7p2RAkyauJzZsI2ZIr9vqIgkSMGx8JZ4mfsnk3vlzVXXO6aSLFt?=
 =?us-ascii?Q?Wo8IWn61nB/Ud4trFcPESB6+gCBlGYKoBkj7a8WWzob4lTCmWdE+rx3a4gQG?=
 =?us-ascii?Q?WB1kSwwujJlGCCwVykz+HpasGHOCXHHsDiY05lFrxF7Gru2vPJxqjd3KTjje?=
 =?us-ascii?Q?2n2NfD+9SGrictETsKXixtBElmzfhUy+cynHVKuiIAY9YFD0U7fRC6fZnceK?=
 =?us-ascii?Q?6/8GKq2qD9gjaIvCJA+Q2c1aangPtJEwUKhY5eD191jCq7KJRDVV045arxwg?=
 =?us-ascii?Q?XctB113L+vWCoSb5X8e3/KvmR1Ayd35/JlXHclmYiyjlQKnm30WAc3Ti/Y6p?=
 =?us-ascii?Q?OCfPeI23gCqSuAJUifSt4nUkbyaF3Yb0ld6QqrYBkpugKzgAgXrC2oQTtY+R?=
 =?us-ascii?Q?3y8PsuIhk4/cggtg3TvmQzK20Zzxk+HSCIKTZ9a/2o9vvx47Nj4MPUQJqpLR?=
 =?us-ascii?Q?2BssWjK2IfT4y8/XQzpLF7DuVZogvIYjUnwPqlm+AcRv028tNSs11hZ+rBU1?=
 =?us-ascii?Q?UZia63aTo9CccKDGQ4O9nk5/9v47VztSJuxFqocwkBiOE8YW6QQMY+TUb5Qa?=
 =?us-ascii?Q?LcHH9+v0IpyWm9NBHvcFSAVCA5z1TmXmqK5EObY5kP8uSOqCPhH2pAR7itlo?=
 =?us-ascii?Q?1cF82vtSD0okCN06/49ATjrpL/GGvLme4tG6f3DPZIf31G94C0nhYsOieO4n?=
 =?us-ascii?Q?U9dpgNKf0kTlVJG0VmdG1yQ29zcDzjubEHYtR6BXzb/baat5SOjiKEEdXYwd?=
 =?us-ascii?Q?YaEJ+ZZhpbnOIigQVziAAvldQjo/DkOuKhBEdcSGEvZSg01Z6tKQ2Yk2v961?=
 =?us-ascii?Q?CYL+VLsTwPAjyQxfmifbTXy9SFUKA6/QWIRS9hT0OOTB5vB680jA6UeKM4SL?=
 =?us-ascii?Q?2cNYNhmblzkpBxyrZMK1uLv8GsWuF8ZW89HWAKgP7lxA97hVHOIcEq/a+FDz?=
 =?us-ascii?Q?8kotCu2sOnNag5drakhA+8290e6WQgWcSJVQfZrh3zVZF/5WnUWsqGeX1lio?=
 =?us-ascii?Q?oqFYG8jig08GgFNl7wJ6BmSQlrpkD0rmz1VNBOttj9N9Ng+++MxBG06jQCpT?=
 =?us-ascii?Q?72Nj02BZ6cReaEHgCWTgfmFzduuflXdExzC6Tq124dElUTMTHKS3jnfgBGqt?=
 =?us-ascii?Q?yxidAsrBDxOrut+vN6ZJKNR1Z5MNucDcOJdSL9fEXYtlqGdJicYNA6lV1/sm?=
 =?us-ascii?Q?c9wTJavW6REJyQ8lnXBeDrcXcqOKeC7P3GpA4E4O+HNiuAGJEJqlwzzBi8xp?=
 =?us-ascii?Q?rqz7Ha5fsY1KLktkK1/WeA+Ad28LUZlPJ6bc32fuiOxEqObRc6CklDFMedvR?=
 =?us-ascii?Q?aQx6R/2lpIS67sCtd4J5n+3IE0wg73JDVCsC5jAduydLAoS+atKdDpsam19f?=
 =?us-ascii?Q?alsvNvfwT+s7ZAmyJXGE6iyorvCiaX+cZbRGjUNUB70j3X3lb/sgJyvOYj2T?=
 =?us-ascii?Q?GkUdjkCT7reRcLgluiBBWXmt0ggKXmnqW1apErr3jKQjf9IrIDVjCyNO/r0U?=
 =?us-ascii?Q?mRcohx/oyf1WQVDZpP8TWExCQtlFtYto7LptpcuGcd/ukIR/U/jw4sabpl7+?=
 =?us-ascii?Q?2Q=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c7045549-0ceb-44da-c17c-08dd6e84dca4
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 05:45:07.4444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYSwL4okUroSAuil8IZF8eY4yUg5k3afbCYaXoYs+lmZN1Qi/o246t7AI7wh21QVZ2QLwhYfr8eBnMeYc7ewqSrgK6eC+kXbeBZXlUz6fMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1842

This patch series is a collection of miscellaneous cleanups and                 
improvements to the imx334 driver.                                              
                                                                                
The changes simplify error handling, optimize register access,                  
enhance power management, and add support for different lane                    
configurations.
                                                                                
This series is on top of Shravan's patches [1]                                  
(media: i2c: imx334: Add support for 1280x720 & 640x480 resolutions)            
                                                                                
Link [1]: https://lore.kernel.org/linux-media/20250305051442.3716817-1-shravan.chippa@microchip.com/T/#t


Changelog:

v1 -> v2:

- In patch 2/9: Added space before braces.
- In patch 4/9: Corrected the commit message.
- Added new patches (6/9, 8/9, 9/9): Fixed PM handling, used subdev state 
  lock for synchronization, and switched to {enable, disable}_streams.

Tarang Raval (9):
  media: i2c: imx334: Simplify with dev_err_probe()
  media: i2c: imx334: Convert to CCI register access helpers
  media: i2c: imx334: Remove redundant register entries
  media: i2c: imx334: Configure lane mode Dynamically
  media: i2c: imx334: Fix power management and control handling
  media: i2c: imx334: Fix runtime PM handling in remove function
  media: i2c: imx334: Enable runtime PM before sub-device registration
  media: i2c: imx334: Use subdev state lock for synchronization
  media: i2c: imx334: switch to {enable,disable}_streams

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx334.c | 959 ++++++++++++++++---------------------
 2 files changed, 421 insertions(+), 539 deletions(-)

-- 
2.34.1


