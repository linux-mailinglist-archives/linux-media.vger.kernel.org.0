Return-Path: <linux-media+bounces-37327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68472B00631
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B08B7B7391
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 15:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20EB2741CE;
	Thu, 10 Jul 2025 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="JGCPFz1w"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E452F56;
	Thu, 10 Jul 2025 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160516; cv=fail; b=IrUukYJo9AHlgClhjPXE0GGVq9JcC3tCLAm1Hxi2KXJwWykfxxugGiONkrGSmC1PnOhWBfAKz3kYF3QSl0GzvH1mdi8wjiC13v7GJMWoTY9z83yiJ2efu/NIXvxSoiQh8KGS51nf77THKTYVt0hnIkcqD9JiqgdNCMdFpOuXQ40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160516; c=relaxed/simple;
	bh=mRLlaPMcaz8NO+jtGQ0j9vhcADj+rpGOTPk0Rnijx8w=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=E7MdrSqLZOGnL2GNqsk9OzOnQC+kkP20IT36RGxzXlzF3BQkdlLJTPlQHQ0wY9UaJfPgsvkv7HysDY0BLkXpTsUQI889kxtpyLpIEWmwcU8hHhT6dz7UAl1aPGcL7pse6LaShUa8RGaJtkHSXGHICqWeVRq/NnKWC5PA1M272Qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=JGCPFz1w; arc=fail smtp.client-ip=52.101.69.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rP/itWUhYcv5v3PrSuuLN7+6emamLQLtBfTrN0NKMxFGB26awIZ4AWrWdv+REsSmN+KqFE3QwxuWTis5qqaXBQ4QXCJQESWHGdmVbknW9zDtAdszPH6m6Q+b2OYmMsohzc1ZDPe7ZgZspmcCp9Lx+BwqyyKfIsdMppCHrmd6qdRiajfcONKEp4kYmsxKR70A3Eb38Tyiti3ZYx4T3AVCqGO/Kh7y7ly2tahkPLx/s3fx3FjTEpKDuYP5FMHphSG5Rsx0l4rQIfIMx+10eG6+Aite4bDBB6Lp7861oeFL1dqyAgDMEV4E1tj3+DTvK+BTp2/rj9b7dCWSO//6y7jEuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tscc2b+OF9nreEidB1/FyHXhNb6kCotbfUkvyKUTUcs=;
 b=n15MGm2HVF3wqZWJYRrGk6bU0nFAceB2aIZMffcjmzAsaKe+DkZwfS6VPhEhIxtbOvpaoKx+ruNnyEcK+i2uYNcNc5eotLWB8tl52pd9jBal2KLkGrMGfvk6o3+0rCNnFMqf7d3bdxOjfIFuuOqr7ZHFaXAT0RsOgqOyYVPGWrS39QgNAKkBEQsWqzHRbYCcqY9ecSfGRgCOBpuNusMo1BRK2DnG6OWmU9JGNk4iXCVhLeQYrbkFuX7Y9izJmZndekTthGlcHDCsCwS2t6dgjVg/ARAwOcmSwxtv+PzlePOy+JrRV2kqDl5Mygqa86TPgXRWfk9j/B1g4Ollej6FQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tscc2b+OF9nreEidB1/FyHXhNb6kCotbfUkvyKUTUcs=;
 b=JGCPFz1waxMG/aDhuJHrd1A5FchdyzIuwTO5BvsHOLgOdxWSOR3CRuToT4woRATwEXiiv3zIORNyew/yIFjnfWIZMoUr5VHub+901d2HC6wYvKoMq78c/4NxXApJeJVXo/mnOYrpefD7uVydcdV0ZGXa7I18YqPELRjlg9PSZmYKJ1ql2AI+cTuYyFUQ+DPBTnQSte5VRqGfB3odilr9aqu954dNIa1g7lEGUXxen2YL/T7TmNr3z/wLuxZAOgJO1D/e0Z8Zc519HQ2pg2NrXk+IaVqdmV/vL7BNshRA/Cm7KAKRPMSL//FMoZs4zqpm71kf7kwh5bTirzuvEcn/EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com (2603:10a6:10:2cc::22)
 by GVXPR03MB11034.eurprd03.prod.outlook.com (2603:10a6:150:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 10 Jul
 2025 15:15:10 +0000
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54]) by DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:15:10 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v7 0/2] MT9M114 driver bugfix and improvements
Date: Thu, 10 Jul 2025 17:13:38 +0200
Message-Id: <20250710151340.496218-1-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0057.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::14) To DB9PR03MB7755.eurprd03.prod.outlook.com
 (2603:10a6:10:2cc::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB7755:EE_|GVXPR03MB11034:EE_
X-MS-Office365-Filtering-Correlation-Id: c683ec8f-bca1-4939-666e-08ddbfc48fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vgZLzJAqp9x790vuO435FTMoUqGj9BcBjDGmsD9Riq6eC1Ljzkl6pcsVmEyq?=
 =?us-ascii?Q?IzqRhcQWaNchGlQMvem6nbdxGmef59+u9MLp46CZg1j+PG+wDSmniHqX5//C?=
 =?us-ascii?Q?trXAt6fXL22VuTJam6WLqn9WTC+mnUNmFjRIjNY7I8RYygMmboXQ2xq5bq8T?=
 =?us-ascii?Q?NirHkLHzyZJuNu3W7dQw3uC0Kj1qN9CyKKjdiLqRzjds2PrfDfYP2QHTmF/n?=
 =?us-ascii?Q?U5tHfaxGgeuZjxjG3dUWr41+KWsIe1SnuDo1mIOubGP6q24nR1gTBhHe9/hv?=
 =?us-ascii?Q?LuwQ8m1UcpHpxBvhMlYqkF6QQ33PAN0t1sXemqCjpZpFs7tKx0xtye94TdTI?=
 =?us-ascii?Q?j0YlMqzMHj9RST247gOFd1jHK5CdcFVadEyseMDLlYaIVtFN8usLf/k791+O?=
 =?us-ascii?Q?ttCp35FsLHL3zKqCWqZqBBxaYcIFGzZDjIOMtamemClGJqLjoRA6xe3iZPH7?=
 =?us-ascii?Q?Eq70mixFjoaFbN4jIz5yrs3jnjqe6Oz3WXxkNX6C7If+7GkKEVem0/9SeryC?=
 =?us-ascii?Q?2zBcxJ4HeScoeJt/uaE75LO7bIMfK5pn1mrWdDS9IoFrsDByp6+w5uBoWVV7?=
 =?us-ascii?Q?wPIkncNCwDCBDLem+IhXomjXXXSGLwdsjUNRCnzghWy5ErX1B40Lvmywsc5N?=
 =?us-ascii?Q?uYgimKfB32ZdB/hqoHNwlfcaYBRum6+GQk+3wjf3jSKpo9Lal+S13qqHdgza?=
 =?us-ascii?Q?Y06V1fni8e8Mkbe2qiGMgBqYel4NopxSFHYfwiMmggaowwqwX+Nu2OwhToLu?=
 =?us-ascii?Q?hvqc9KlAoi0GVBDDj0ypKiL6MFph//gqVOulISghq+HLI9bsK01elcVr+Dx7?=
 =?us-ascii?Q?pCmrdC9iID07IElt/xHMkS460S08xNQ+HFfSpcaZws5F6y7x4EafcfvyBO0I?=
 =?us-ascii?Q?8Rr6zHS0S/Q1hORz7kHBzF88yZM61xl05qlyerL27TrzN9sxyg3mjuKffEaK?=
 =?us-ascii?Q?uHxz5IzSJAmgAvHzX2ft9UhURTgYPrTbEDyRSX9ualf8Phb1+lLms1pje+1l?=
 =?us-ascii?Q?On/PSc1zCXidToIoF5z1dN4WW/iKcTXywCbrZGqB6uBgVwvzuPO0FbEq0yrZ?=
 =?us-ascii?Q?aXCNTJHuho5BrNWNv4W51b2wgXg6FO/6a0AzzaAjxpEsZj7HUVqeoeSqXQ4P?=
 =?us-ascii?Q?kO083KxsPLMDlBk/+Y5PSfrP696PlwfyxADK2Y7z9u266OinKzOZMsSZhk7t?=
 =?us-ascii?Q?auBdnAapHp8NH4FNNHndco0UttQmQY2xjMSPUF3xM+4mlWnxjxKFSpNuu2VL?=
 =?us-ascii?Q?gUoWeDMzXpcxX6qxCSYyyWJQwVWDZ2GuMYBpCha0NdewU834ud+QZGDWIRuk?=
 =?us-ascii?Q?xxEW1IP+nmzZptZJtNZEctgTWPGofDSvvPZjX18xRhie23ISz5HN+r7VDTsd?=
 =?us-ascii?Q?4U/A+WNZOHoSirPj1znhYNlGlEj8zX5eHXf5X+W7+UQ5lPDky4GYmxXTFL9q?=
 =?us-ascii?Q?RExQz78zaku9UXtt70LfrJJ0UNKyUHttZGmV2QaPRUlIdEucSYUOiGVzOpxJ?=
 =?us-ascii?Q?aeHmNVBDLtHiyho=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB7755.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GiEs3nJtVVQI4WmhZGojlbr9JnY3XEowpImP046AzVT5JIwaXUnAnEAYYaKD?=
 =?us-ascii?Q?21acSRBdKaMicj23UKgC00zgCyeioHS3BF++WBhisJi3wVu2cB2KeNacqR8j?=
 =?us-ascii?Q?ZWJRHRMYQbGDQNPWZcUHVOXsWuEyhVimB3GrFdhLjE8gVBF9+N0UpPo5Hds5?=
 =?us-ascii?Q?kMEKDCoTL7nD12n1ONxk9aYaoOvLKkbGKWnAZAT/GqlLIyfdSwUviS9zeHZc?=
 =?us-ascii?Q?Goq0ObuzGHQIIgexU1HOSZi61ZU/KI0vcov3H636N3KG/SLEKfn/6U2K0e2S?=
 =?us-ascii?Q?7kqNnZZ7mHMpyesa31Lwh+VscbTQ6+WfDndf21bodCBGQKEdiBdE8Q6y3yO5?=
 =?us-ascii?Q?z89I7xGTW8eO6GIZmbQWPOOjfFr+iV5Z6mUI86B20cR4TTNlr7Aug0bQn93b?=
 =?us-ascii?Q?kYmT5ad5Yzjtn0U2dmBLCw4J4hke3q3gu+fOwbUmMZp+tOlKeH5DH87FsWZ6?=
 =?us-ascii?Q?eC37cDRivbX8sQJM6ZsE5imWZB0Ok8HCci3qNl/BFh40H1blHnqQkLOcBD3X?=
 =?us-ascii?Q?WDHAkwFoMQBz3hYv1X8i90BKSb7VJNvMQToRxVX50KBOlOF5gej3DGPBMbO6?=
 =?us-ascii?Q?+uMmGq+2VQNbYc3F9G6YmD2gXhoxK++u2mymp8ynbSu0dotrIy+1tu1h/sP+?=
 =?us-ascii?Q?vf0Vn26G4fxw3Z5D1tPxHop2RrPQOckw/1GPYt6VlSmLoUA8svA+TJm18Ngy?=
 =?us-ascii?Q?SmUO2E+nNdmSUzkEQFakz4VTcssXCWQ2xhojivlIulce8wzcHTjIO5vywynq?=
 =?us-ascii?Q?pf9LiCqodW+w3ye3b7uVaPnyblcdC4rzkj91JV1WLtjvT3GyM7mzt87NZFhj?=
 =?us-ascii?Q?ukc+PJDxGi0EwOrvSc9JVb1Ie7iTdFgrN/z4aejM2frWBFaCqZkF7mj/M78M?=
 =?us-ascii?Q?MV8taUnv/PJPNBXfJddS1MsSShizMx2lA6Dn4/sxiJxH0BUrB/gndsQTYNw9?=
 =?us-ascii?Q?g5HR0SL5z5lQxF6zUvbxhQfomakT9jEps34lSRBGsY8ZXhzEXIreDJuOxYXG?=
 =?us-ascii?Q?m+LgX+o4OWrQ00SonXJgwatDgbSCALHhSOseWZRAdLsF4+QL7svT351vWw3z?=
 =?us-ascii?Q?Vcsy+j1xlrQfhpnvE537rYSf7DW5QYBRpP1r7wXaECV5i9iVOfFUefM6CINs?=
 =?us-ascii?Q?ZmkNLsilT4svTv37JNynrukHyMfh1kCunpSsfraXYAPiOROLUvGwBnX8UAk6?=
 =?us-ascii?Q?vjaBFr2y3FnYI+3u1gvNVupQCAFvJUZRHZm5r9F+P96X2YQXj6Im+TjEaikf?=
 =?us-ascii?Q?LDpE84C9La9UdXOzx2rE7eBD4fJR/f5Vfze3TjZfmwgwp5XksWIesHQrciuJ?=
 =?us-ascii?Q?N/v5wfgKGgO+7SPkJmkgXXQpVRvhAYgHmx0ghkSLPY7LfzB+4zit2B8iFMcw?=
 =?us-ascii?Q?/IUmjc7U6YGuVTQUoJoa8YdcUstoOrrli2pZ5LheN57e4jpw2R/5ipn0pysA?=
 =?us-ascii?Q?PUXedD67mGNV1Z5EHHZCESdm3SAdJflMDcd/ccu5PA52sqTsB489Xek7IxKa?=
 =?us-ascii?Q?0+hYCMfWAdk05W3e2GgWXhUHLWRpGtkDwzAjpCQ6zFvqF4RGLnrUmCx/tQi1?=
 =?us-ascii?Q?6JjqKnA3dNQYOOJoAgrrntlnGgYSBh8cCTUl3j0Y?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c683ec8f-bca1-4939-666e-08ddbfc48fc5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB7755.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:15:10.4792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LlCDxDr26aPplPXGC8DA+Ar0OK1V0uJbA4amueGvbWDBovtvi2v9SVNYSdPM93SVCTdnEQ+eH7lIKJWVp/KWSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB11034

Hi,

this patch series contains the following bugfix and improvements
for the MT9M114 camera driver:

Changelog:

v6 -> v7:
- Remove already picked patches 1, 2, 3 and 6.
- Remove patch 4 as suggested in review.
- Fix formatting issues
- Return -EBUSY from mt9m114_pa_set_selection if the cropping size changes
  while in streaming state.

v5 -> v6:
- Add 'Reviewed-By:' tags. Sorry for forgetting this in the previous versions

v4 -> v5:
- Apply reformatings and small refactorings as suggested in review comments
- Split PATCH 4 into two parts: One for applying HFLIP / VFLIP while 
  streaming, one for applying set_selection while streaming.
- Add condition to apply set_selection immediately only if the size of the
  cropping rectangle does not change in PATCH 5
- Use device_property_read_u32 instead of of_property_read_u32 in PATCH 7

v3 -> v4:
- Rename DT binding from "onnn,slew-rate" to "slew-rate" in PATCH 1 and 6 as
  requested in the review comment.

v2 -> v3:
- Dropped PATCH 2 ("media: mt9m114: Add get_mbus_config").
  Based on the comments, this issure won't be fixed in the MT9M114
  driver but in "imx-media-csi.c" in a separate patch.
- Renumbered patches accordingly.
- Fix the incomplete renaming of the DT property from 'pad-slew-rate'
  to 'onnn,slew-rate' in PATCH 1 and 6.
- Fix checkpatch formatting suggestions in PATCH 2 and 6.

v1 -> v2:
- Fix the subjects of the patches
- Dropped PATCH 1 ("Add bypass-pll DT-binding") as it can be automatically
  detected if the PLL should be bypassed.
- Renumbered patches accordingly
- Switch to uint32, add default value and clarify documentation in PATCH 1
- Add 'Fixes' and 'Cc' tags as suggested in PATCH 6

Link to v1 discussion:
https://lore.kernel.org/linux-media/20250226153929.274562-1-mathis.foerst@mt.com/
Link to v2 discussion:
https://lore.kernel.org/linux-media/20250304103647.34235-1-mathis.foerst@mt.com/
Link to v3 discussion:
https://lore.kernel.org/linux-media/20250305101453.708270-1-mathis.foerst@mt.com/
Link to v4 discussion:
https://lore.kernel.org/linux-media/20250307093140.370061-1-mathis.foerst@mt.com/

Bugfixes:
- Fix a deadlock when using the V4L2 pad-ops get/set_frame_interval

New Features:
- Bypass the internal PLL if EXTCLK matches the configured link_frequency
- Make the slew-rate of the output pads configurable via DT
- Allow to change the cropping configuration while the sensor is in streaming 
  state

Thanks,
Mathis

Mathis Foerst (2):
  media: mt9m114: Allow set_selection while streaming
  media: mt9m114: Set pad-slew-rate

 drivers/media/i2c/mt9m114.c | 68 ++++++++++++++++++++++++++++---------
 1 file changed, 52 insertions(+), 16 deletions(-)


base-commit: a8598c7de1bcd94461ca54c972efa9b4ea501fb9
-- 
2.34.1


