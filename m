Return-Path: <linux-media+bounces-18537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EEB985359
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 08:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBDA71F24851
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 06:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E81156C5F;
	Wed, 25 Sep 2024 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="ToCP2tSy"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2086.outbound.protection.outlook.com [40.107.117.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB64156661;
	Wed, 25 Sep 2024 06:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727247567; cv=fail; b=r6OazzyKp+TOh5HKrHZP8mcbidonsYRyQVSnlYth1e+GpCEvNerO8sdhSkMPsh33gU1/2Ft80ijT/jKbxLYDAyqR7Nuema1kXi6eL/vnOAX4Z7Rd+dwyzKidmCKc7a7vQNdkLB8NJG/AA8FBj+xeVVY5xGPe/C3yVU5dkjnFm94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727247567; c=relaxed/simple;
	bh=OlC+cpY3d52WroPqIHiYRaSY1opMizM9Ulr+cXMIj8I=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=I7gUZqiaRUhyjYACV2WvE9THTYEiirELFxf0Y3Y6NqTNyb6hpWnUi5y52xFcmjeDaDbSrNMZFaVXQUL4XNg8MHI8urVPOAs4gzyeWhunIm1dWkaPE2om4hnPo/PWEr8nn2LPsId4u0JkaPuIiejzadD1t8geCzFew8bWIMcymUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=ToCP2tSy; arc=fail smtp.client-ip=40.107.117.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tc0ZM/scpLhMWouOUBNAYtUH98BxOGsnpxbPXsbin6AiNzT3b3kIFxo5pVpfKiJOWuoKIZSKQhM1VA+2eyniA2O3cjB9X23tsgBQLu9XCfdpA0wvlefpzKG6vzh5o4Q21rfic93BP5XikWgp+/lK8ICPU/DcYppFN2EePKFAHd/B5RAlpVatWMcoZoPNq6qtrvB+x7yDc7Py9xtq5sEQ432Aj+B933Rg5ejRuT/6mgJvFQPooQDMIx5QwsziDn75R8VlhzIb/SY42OnuUEoS1mDni9Wi5aMmnt4ihYdiEDyp62dqBswLIhGDcOdjSNOCB1ExgDRSeYeVv174nD9DEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMkr3k/PpgdLTypxInvHSW0jdR3m4zCZY/na/pccBeU=;
 b=Du9kZkjWT3wJA9lQpnskjckP5pjUqfz3KMg9kUBTd8uRXyLyJ1sE+fE/mi6j1qY4hoq0EjFLn+O91U/bZ9jcmeYG6GntIfz8KLxgH6XBMI9RgKTctGKt0GqjH44nYDuu1bD18q/ez4hOxnwc5mj4/12ef2fY6LLm/lWOQUDSmTW5ULwa0F0oKn3mMWNbq/0TJ9YA5sHmLVC5hEU8lMpXyKVkXVa/H0bYGQ4S36B+CD5POXBypinud/upG1C8vZEGM0+EFmT/kYaMJxtofrCWFlnu2azrAyjQ2YpcKxxWDUXRyPyflZRQG5iXAludx8GeigHnNfLUMd5Iy3veQEBFTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMkr3k/PpgdLTypxInvHSW0jdR3m4zCZY/na/pccBeU=;
 b=ToCP2tSyG0iVmmwov7zw/DSwMVXwROObnKhWbwyLCCLW10306oCoTGxjxwa9AI7ZNdSN8MjDSlvIo7KB0+9sOA5/PLSsmaKXTIOWFMNfqSctQo0NGTxCssU2lyiqVA9Mg2BtrhiZArBsjwaBxyd7JjNM4k2GkiQZhNwMRFYI1kmYHX7nfn0AGvDYN5orK48GM3H4LZ6oJntvdljBbhadMryBJCtizKuZEgEaz6WmqtrS5xZT5SNldaBkHUSIPDUKmnT/iJ1wBVo2WzzspHWp+3CAJ258HRev0jVfeF9tl7vuhcbdO45KpVWHeUBwo0fTGtnTVAwahBpsE293tFmmEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by KL1PR0601MB5567.apcprd06.prod.outlook.com (2603:1096:820:c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 06:59:19 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%5]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 06:59:18 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1] media: i2c: Fix typos in comments across various files
Date: Wed, 25 Sep 2024 14:59:01 +0800
Message-Id: <20240925065901.3303017-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0215.apcprd04.prod.outlook.com
 (2603:1096:4:187::14) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|KL1PR0601MB5567:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ece41f9-a217-4e16-536d-08dcdd2f9378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ppH1dqpgInxY4kuO87kYe9O6rMRhVSQj2iCefysMggxGD4P3XEKdT/T2dxO1?=
 =?us-ascii?Q?YtVfEkw05QZJM0lEMlh9aXRTH5R0xSf5vpeWKW4CuGNhuJMTpyXT/OlNnoRf?=
 =?us-ascii?Q?FxRdAYabWdkwiz8JM7SqeC7whDt0mybFuSLM97JxSNm30HHCjx5Cvu5bsjLx?=
 =?us-ascii?Q?JJgLNEPfZVtVuutaaQRDcsB7ud9hxm3s/js86bW9ztiqbqh0rfLWWmhLX0gs?=
 =?us-ascii?Q?FTSHW+7BXeHyhJkLV/imzD5IxZ8JgvHCOASG6C0vqgPFQJJejmy/ID4H8myv?=
 =?us-ascii?Q?rtrMyFHh/2gmFDQLUcSgJ1iObRAeymkdSm5MqcK5z6gxp5znQ995a/wco9FH?=
 =?us-ascii?Q?RaN7QN+aPH5eNclorSgL7oYsSV7f0XYJO5+/zJ71ppW5b2CFK308Wt8byUXb?=
 =?us-ascii?Q?BhDZpEn+zbHbOMKhst2LHJ8LMB+vafHVX7nhP9sifxXlG5vN6MMWPTmMWI4Z?=
 =?us-ascii?Q?zy/5L3qXtRs6CHki0Ev7sMe7g1+b+tAflEk3R/AX7VmtdgFgzyx/5kWyH6NB?=
 =?us-ascii?Q?a9nERsfN/7BGTck7G4JyVMWNIZIgZ8TFp+f2kNKo+9vDqc2hHV+BM66P2hQq?=
 =?us-ascii?Q?wZy2cwqVwLFHCWHD/Wnsl2JuA9Vjzp8Mw/b3hbovK3gmhhGSuFri64vU4SE4?=
 =?us-ascii?Q?uG02Pwv/KU/00nYhBzvsOy0P+st/x2ndLmVbDZnrfVWptP5PQrDhjPn+EffY?=
 =?us-ascii?Q?5BBSIZJyNvtgxuRSMLMFBclVhTzPsG0LMzATgj7m9e+zataSKpCp4NUsdjJ9?=
 =?us-ascii?Q?PY1lKhy64RABuR8OcinUW0WxBNh71x5Zuz37iXSzUysZKPItUHfaQpl8WnK3?=
 =?us-ascii?Q?l2xH94tZrPCT81d1ZHZHHUWyYQgZ28G6qxggFoErbiYhuBqlPr7IzTiWY3Js?=
 =?us-ascii?Q?fzWQqHuK55BSOnu+nF+FSO5IIR/2ypNhyp1f5qLoeyRQ8pLBE0yHRK16vPn/?=
 =?us-ascii?Q?IjDhsp/6zwyWvkDE4IEjdwhYSdjf19DkqejcCX+HZMMX85fciiIpPkH8GN4A?=
 =?us-ascii?Q?cOh4scZLT5+WFC6UTsxNwrBV+WKy3Rm0SEqmSkW5KR4XTsv5ph5GqBzuN2N0?=
 =?us-ascii?Q?CM42weIwMaYF8LbV1cE+RkKFm8hgx6h3JDSWbHbYBqiOjdKgwRfgWSXUiWGG?=
 =?us-ascii?Q?O82xtWX0n4MvGYswZya/vGmn9cVCZnZqS3w32SqDygmFQCoCGj5477M9S+E+?=
 =?us-ascii?Q?nMctL1yK0p4FTcqRCIVSMrC6YlxtW4emYYnKexOdRiu7LpGIiyU+1/a6g724?=
 =?us-ascii?Q?dmB26s2o1ugJiC2lyEjX2WFZ+UwUsN16LNtD9RBEZOI4c2rfrMdNKSG6IgVG?=
 =?us-ascii?Q?NJXV6VkX+Ywnfn2QhhI1ySuaRhOn+w2XlHeC7GsqyeilQjcJ78MEv89ZFLJt?=
 =?us-ascii?Q?smQGI4I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4461.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G4Bh3RSGD9rhXpR/9dfPgdN8g3FQRTmfkOUqGxoe2cFC1riRSXcjXra1q6XF?=
 =?us-ascii?Q?cyYsbdU6bX/wPl1w3oipMy0kyJEjA040Cp+9uwUNf7IfQ8dBmoGuBxlJrWec?=
 =?us-ascii?Q?xOG+oeYmnTUWB3kCenilZRMX5xz0ZvU/+ZSiU0AdkVK3sH3AloFxu3yDc2vD?=
 =?us-ascii?Q?zakzdZhGBSU9nb4lasBXOH8RCaDhkafzNwOMW9ZmWkSPvbFTOOZEMbDwBzLC?=
 =?us-ascii?Q?khauwuZEYphRXj6Z5vZFc/cdCfO+KxWY0KgbL6rE9F1PNzPQ74vkYpO/FkCJ?=
 =?us-ascii?Q?OkgMt9BCpGAepvjpG/lUfgjAnNYSZz+YRsfZ98Gw7NSwP3AgiNIv2CIbPpIH?=
 =?us-ascii?Q?SQ03IyERaGNrrCS8NHaqHdFgUWkdbm8FunwqirT2GeKdFZma/JwnFvKVSDot?=
 =?us-ascii?Q?B+AuNGgKdOUjhXkyipVLSbgY1xzmlhtea9xUvn6HvhX4JonTEK8iXSlz4jDO?=
 =?us-ascii?Q?BQq1uWiTE3cp/8yIsjH+ndOFJFYtwy9n16vCzDr7BORjEt3Gxlxt3VmsYE1K?=
 =?us-ascii?Q?NBZ6lfB8Rjh2bDfKY5tdnm5cKJtt36U64icW26MSi9vn8MDDXD9YBpl+qMon?=
 =?us-ascii?Q?pGiMhM8AJYE8l1pXOMdihX0xpDxAZbmcc9CsPVTI8SV7KnkF3IYsb6ij40x7?=
 =?us-ascii?Q?9fQle5ASc1eJ7lndIF42Jkm4DKEh2D0IEXuEnHifjCtSWAjPqo0PhvtfdgDx?=
 =?us-ascii?Q?UWvqF0S6vBmD1pfMpR1mp5e54RE0odu9hzqkF9PQFEq9x+gv+eL9z9wGuNFD?=
 =?us-ascii?Q?ZczwM2Ov6/NPgzdOai71pPH92jGMOxyLTJQjLyiKEKVivxnc6tNA7tf4+EPF?=
 =?us-ascii?Q?yhIktDO/DbwrYFhSQN1anZPjKDnZ+oBOjg/fF8LNh12peD7YASfWkpbls+oy?=
 =?us-ascii?Q?zPr/egKcZ5g9TnHbKtciPNT+jwQSMMYS8s/IOEBm8YDcT61bWjB///cO2ZCf?=
 =?us-ascii?Q?Q6MkvEuFdaF1+QQorgzuQdjKayKUAYVqpFqmSRc/cUDekhIF9qcfc5f8uCvr?=
 =?us-ascii?Q?/OqRjpAcdSr/kUScszAA+fSJcyvpToQe6QX+GXGY2y9DQMPP2GQMUNJB4Vj1?=
 =?us-ascii?Q?mBfTqFmhT35L0QT/xazWN0/8mBPocase+HK9BvSDLXMKOALfoxG5eWqD0lWR?=
 =?us-ascii?Q?usQuhrL+9AyDLdLD5/kuhRxEr4E25B9r2KNVq5trBgrSSWNBueS9irWYdBzn?=
 =?us-ascii?Q?39sCBL4JQ9mfGL0dgRh88gi0FZD73/3w2gUxftcWUE6LPzAtTMUB6DM65fZp?=
 =?us-ascii?Q?XhFghVLxwtLWHZztGvfPViaD3bSRq+GuQ8m42ctED+7eHwlelSZ6VdflAEZp?=
 =?us-ascii?Q?KBcaWQo4437iUEDPPf4u9mUAG/G88kHM8xhXqXC9L9rj0lJStgTF/PeXaF71?=
 =?us-ascii?Q?k/1HAdzbr4NpySoklaeNPIwsSnnYtqN652OZUyrYIzI8VQWupK7Nk9t88+/g?=
 =?us-ascii?Q?FRE/4+Sd2Mjwnsfzr/K6wblJjQYpxzNDNVuymPu/aQnimapJKYUcvZ3+vlqH?=
 =?us-ascii?Q?wUjmCj27QW0JmuBb+W9bnDciTldl+SITIMhIIPRwb77ZRkjwbuuphSCDUItz?=
 =?us-ascii?Q?ZDyLBWRuInhgJQoEeeiyiiWzZtMG6JkAKG6Gw7Cf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ece41f9-a217-4e16-536d-08dcdd2f9378
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 06:59:18.9191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4WwWEeIlRtxOjv62T4cP12xrEAcYo9aFu50nZ0XiVTI8xPd9s+ZrMfk5RjZJhkbA0VL0q3AJ5VxOzjJC70S5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5567

This commit corrects spelling errors in comments within
the media/i2c directory found by codespell to enhance clarity
and maintainability of the code.
This change does not affect the functionality.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/media/i2c/hi556.c  | 2 +-
 drivers/media/i2c/ov2740.c | 2 +-
 drivers/media/i2c/ov5640.c | 2 +-
 drivers/media/i2c/ov5670.c | 2 +-
 drivers/media/i2c/ov5675.c | 4 ++--
 drivers/media/i2c/ov772x.c | 2 +-
 drivers/media/i2c/ov7740.c | 2 +-
 drivers/media/i2c/ov8856.c | 2 +-
 drivers/media/i2c/ov9650.c | 2 +-
 drivers/media/i2c/ov9734.c | 2 +-
 10 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index b440f386f062..2aeaf8214bc4 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -644,7 +644,7 @@ struct hi556 {
 	/* Current mode */
 	const struct hi556_mode *cur_mode;
 
-	/* To serialize asynchronus callbacks */
+	/* To serialize asynchronous callbacks */
 	struct mutex mutex;
 
 	/* True if the device has been identified */
diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index c48dbcde9877..14cbf2d699a9 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -530,7 +530,7 @@ struct ov2740 {
 	/* Current mode */
 	const struct ov2740_mode *cur_mode;
 
-	/* NVM data inforamtion */
+	/* NVM data information */
 	struct nvm_data *nvm;
 
 	/* Supported modes */
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index c1d3fce4a7d3..da5cb5f45a4f 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -377,7 +377,7 @@ struct reg_value {
 struct ov5640_timings {
 	/* Analog crop rectangle. */
 	struct v4l2_rect analog_crop;
-	/* Visibile crop: from analog crop top-left corner. */
+	/* Visible crop: from analog crop top-left corner. */
 	struct v4l2_rect crop;
 	/* Total pixels per line: width + fixed hblank. */
 	u32 htot;
diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 2aee85965cf7..0a1d7a98bdf4 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -1879,7 +1879,7 @@ struct ov5670 {
 	struct gpio_desc *pwdn_gpio; /* PWDNB pin. */
 	struct gpio_desc *reset_gpio; /* XSHUTDOWN pin. */
 
-	/* To serialize asynchronus callbacks */
+	/* To serialize asynchronous callbacks */
 	struct mutex mutex;
 
 	/* True if the device has been identified */
diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 5b5127f8953f..b6f25bed43ff 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -510,7 +510,7 @@ struct ov5675 {
 	/* Current mode */
 	const struct ov5675_mode *cur_mode;
 
-	/* To serialize asynchronus callbacks */
+	/* To serialize asynchronous callbacks */
 	struct mutex mutex;
 
 	/* True if the device has been identified */
@@ -732,7 +732,7 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE:
 		/* 4 least significant bits of expsoure are fractional part
 		 * val = val << 4
-		 * for ov5675, the unit of exposure is differnt from other
+		 * for ov5675, the unit of exposure is different from other
 		 * OmniVision sensors, its exposure value is twice of the
 		 * register value, the exposure should be divided by 2 before
 		 * set register, e.g. val << 3.
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 3b0fdb3c70c0..062e1023a411 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -269,7 +269,7 @@
 #define AF_8x           0x08	/*     Add frame when AGC reaches  8x gain */
 #define AF_16x          0x0c	/* Add frame when AGC reaches 16x gain */
 				/* AEC max step control */
-#define AEC_NO_LIMIT    0x01	/*   0 : AEC incease step has limit */
+#define AEC_NO_LIMIT    0x01	/*   0 : AEC increase step has limit */
 				/*   1 : No limit to AEC increase step */
 /* CLKRC */
 				/* Input clock divider register */
diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 0830676e5d5a..1f1c0de8e510 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -117,7 +117,7 @@ struct ov7740 {
 	struct v4l2_ctrl *brightness;
 	struct v4l2_ctrl *contrast;
 
-	struct mutex mutex;	/* To serialize asynchronus callbacks */
+	struct mutex mutex;	/* To serialize asynchronous callbacks */
 
 	struct gpio_desc *resetb_gpio;
 	struct gpio_desc *pwdn_gpio;
diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 6ffe10e57b5b..fc45b6396cdf 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -1435,7 +1435,7 @@ struct ov8856 {
 	/* Application specified mbus format */
 	u32 cur_mbus_index;
 
-	/* To serialize asynchronus callbacks */
+	/* To serialize asynchronous callbacks */
 	struct mutex mutex;
 
 	/* lanes index */
diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index 56df97c9886b..026ea34d6291 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -286,7 +286,7 @@ static const struct i2c_rv ov965x_init_regs[] = {
 	{ REG_COM5, 0x00 },	/* System clock options */
 	{ REG_COM2, 0x01 },	/* Output drive, soft sleep mode */
 	{ REG_COM10, 0x00 },	/* Slave mode, HREF vs HSYNC, signals negate */
-	{ REG_EDGE, 0xa6 },	/* Edge enhancement treshhold and factor */
+	{ REG_EDGE, 0xa6 },	/* Edge enhancement threshold and factor */
 	{ REG_COM16, 0x02 },	/* Color matrix coeff double option */
 	{ REG_COM17, 0x08 },	/* Single frame out, banding filter */
 	{ 0x16, 0x06 },
diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index d99728597431..1809a82ff0af 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -335,7 +335,7 @@ struct ov9734 {
 	/* Current mode */
 	const struct ov9734_mode *cur_mode;
 
-	/* To serialize asynchronus callbacks */
+	/* To serialize asynchronous callbacks */
 	struct mutex mutex;
 };
 
-- 
2.34.1


