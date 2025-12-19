Return-Path: <linux-media+bounces-49140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C09CCF059
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 09:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEC5D302145A
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 08:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D06231858;
	Fri, 19 Dec 2025 08:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="d0Aj+KSu"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020078.outbound.protection.outlook.com [52.101.225.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB29B2C0262;
	Fri, 19 Dec 2025 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766133969; cv=fail; b=UsPEH4w77ZUT5oJYfurFUaHagd8Vu2/8LVy7tapmicxF74mAdjo4MhC8bgn+SldsbgUpdDu6666kPGfBy4Wongsx76mCKPN3JHH42ZbJxon9zVGjoYXGDAldZt8ByPZlOde+fJFfUEeVzANbEfDcjJMHYqnyHroka4ftt+Owjbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766133969; c=relaxed/simple;
	bh=bevhPsYZ/oK1lBXSYQVYlIrCzKiYnWkS9nR+rDDmaO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fii8Ua3ZZaaCd8lxQnbRUfMtiIw9bweAkw+rKz4EcN7CSpuQ9c76A+FhLtUFZdOmmZxbt2ju+eHC4VLuBqKqpDdNn7p8bPHJLyEpyD8xFyUIptlQG5CAljAzKia0E4lBvkdBTEGzLhZn+SNpvqKAD1pXBJ1RY3+uCzqbIquH7cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=d0Aj+KSu; arc=fail smtp.client-ip=52.101.225.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYyoni0yoMgoSsyecmuZqIFD85r/Im7ULmJy3aQf4InDsqv1zqGr7G1nTOOToLiBYBu+g0HT0CeH4hsJq0LsdJLm/3yyNB+nE+okqnyalocj7MeRLFnVrtWMhUxTSKMbPglfTedwBLQJ/Hn30NlH0YIKfdlu40Zl+ynZZD1JaAIcPLVOyZ4Y7dnOc/CUc2nnEcC5uD8RL3O6sdmdfwJf309eTrgXc5AVygcigfpAph0+jY4mt1YZ6MTQOw2vM0nolLxws1oGZPlGEpbsfKXDCa+V/w5DY6QzgOApX/ChB4yt0X0UnyfafmuxG21DaEUJ2zyn+2pWxYnuOhMaMNGujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNi+Vupn7pBcM5J5PpVLOGSHoh58/s6dKoBSEd5NVtA=;
 b=M0ZTd2/jyN+Rw7nhzOaUr1TMjMhS0HTmaDoccYeEAEFuWBf8z4okV1eT601SOb2T4DhpoDOpRRBHESPVr9gJQs1I1l9TppxR9bhEgGuF1EnUeunNRtfOpaO98avyKyDLs9UM2LB59HPfu4UJJLba+3Ng6VNzERQM93ZbZjc9kDB+KX3im/bYCmrWs9w48q4bJUwHAOQLgrcRZH7YrSYA7gHtQLY3L+BTj1Ig2cusoj9SotModyfLfd8nLDq68wUVcWoRe/i8Gu6yvJgsNIuJM0mXS4x7o2BW9csRe54Ktej6MKgiIACzPP/hf34Zhkq4xy9I6Yh40jWwIkAtIgcRAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNi+Vupn7pBcM5J5PpVLOGSHoh58/s6dKoBSEd5NVtA=;
 b=d0Aj+KSus2jG4LeVaWbjY28wdhFZfde+mcyFKG5vpPh/CXnlLQ8P3FLey7s+Y7QX7PWqzTYorABhw+77kn///RZP4JPzUP3OP1BuD2rnw0l9V3qJk8XhDvrX5bfeoEIT2zfQlvJ6lw9UHqBhOWp8GUWAMS1m+b0cLPXKHyUn8kbX3nOPfYOuyqZs4yYG8ZTrlFrtKjSxHZGRuAO9u4jO7/8/bLtu+aQQ+sGI+0nXj7drBWG6xifn9li0x/VqXhjWVhNvnMDDbDOYQI+LNDZ5y/AstrF8PDIsnN12ozeD5SjWuN+j7SEdgsnVJMbnJZWu9xmqfn2+RXJiUgY/rsu1mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA0P287MB1066.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 08:46:02 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 08:46:02 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] media: i2c: add os05b10 image sensor driver
Date: Fri, 19 Dec 2025 14:15:19 +0530
Message-Id: <20251219084526.22841-3-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219084526.22841-1-himanshu.bhavani@siliconsignals.io>
References: <20251219084526.22841-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::9) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MA0P287MB1066:EE_
X-MS-Office365-Filtering-Correlation-Id: ca07de80-32a0-4902-c306-08de3edb0a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sM7xu/oSVBw83WD1u0iNlH16qwjuPqIIl0LVidyb/fXsQBkkDVpCpO9zx+0V?=
 =?us-ascii?Q?ttvHQaQ7gyqe0MfjNvGMzi9DjpHxg3xIOdsJgDSma2mjlwIenHPorlO/xsOi?=
 =?us-ascii?Q?1UhsFuTmgDthj8MA24luu8CHMyOshcYhfzVg5Gp/Obwk5vbCXsz42YritG7M?=
 =?us-ascii?Q?kA835LOLD0TZFmPyHOHDoxHj2y2eZatppCooYZiKNM7PqS9pXip0iPxM+l5f?=
 =?us-ascii?Q?CGLZZIEy/a7+wJiD6Eloub1gtZsRn+GeLRKtTzPfnTY7COp9P8ZI1GuEKTjr?=
 =?us-ascii?Q?/Ww1G/OXIZfg5VdILcRsWaifNwcpgblHxK7azgJT1UOlExswupsJFmKcuvNU?=
 =?us-ascii?Q?H6Hge79H/wcg90KaHYLpdJ31MdQhkV898fkcHmI2bPsjVk0DYGnEA/OgVNC3?=
 =?us-ascii?Q?yHlAP8GI241dSax/Z1E/B8CaT6/RqNhqzDTptI1mkss0WAlMTl+b4FMpty7h?=
 =?us-ascii?Q?A9RefNqrQakFNl5voIsq2M3SPI7tK9yB0gmNcyDvUK2o2G+5fYs8YrtSH93U?=
 =?us-ascii?Q?5tBwE1hb5Zflytn/L9IafXuHzq7HU8l554ECgME/drc7GjklBOoJXwpnsgtj?=
 =?us-ascii?Q?SXllQRzz/seTB53X6Q6yqvoOHGwKFdU9mFZmR/+PKLooZ9DHNjQfMxhcxwBT?=
 =?us-ascii?Q?QAkvXMdVJz+sLA3ArL5Qf1zIShIdJx7Q4gRGIJlGxcCk/zzwg6z3aVi7CA5G?=
 =?us-ascii?Q?YVD3jbjhqdU46JaPxsbl4aLPPVy3E2t5CKDOzpw/0BKx3rfcEMzKmkHuuMDU?=
 =?us-ascii?Q?10RQNz/LpWz8gmBCwYdisxIa9GGOPk1a6SsdXwo9ZxY4k0AVaCvVUme0VNpX?=
 =?us-ascii?Q?p5GvuueSlxEPNFGPD0jHWgEy8V9lUYps8gs6TrEATXJIw5dbtRBGrLxubnAL?=
 =?us-ascii?Q?UQm8wbsfV5a26M2uxj5gekDBMh6EZAwCI3yXXe+lblrWxoYY3uLNZUZz7HNi?=
 =?us-ascii?Q?DDgRESZ85MC7Bf2+7EGoP8Rv02fe3IDvZCG7Obo6BgVDdLiNPpt5GphSP5J4?=
 =?us-ascii?Q?7iVccQz5ukBZ1i+6PAw77Rlg8InXsybyLWh7SteC8LKk57a5xNtG7RFS8zaX?=
 =?us-ascii?Q?wer6XNdHJy2M5+cAs0NWWCFCMzgu3qXP2fYXZdUTC/Rqa8HLx1tVHOwZjZ2Z?=
 =?us-ascii?Q?KDEVBU2VHy/1A1h0n3eeTgqRV8mM7spgdUKN9GtBMgI8pTvBvMJM5pCdD1lC?=
 =?us-ascii?Q?QMmg5G1GW228mwhLxvJXY6UEujtlx3NOnXUHkT0zYvtW9ickuxnWpBR0a/31?=
 =?us-ascii?Q?rXiOWOPGpc1vml6ySl07DweTaeIgykkrkdLal8g5rXvqYSq7DJaG8aFBpUa8?=
 =?us-ascii?Q?V6YwqK/H4PBbrzZrnpKp5G70i0BGiHpDXErmHvUrXzfIZA4UDQ1NHCVl2icY?=
 =?us-ascii?Q?2s5irwFyPYChbeyAWjfgvWe6iFxamFwnmPm1YX/X/jqay6FTPdtIYQhfV47G?=
 =?us-ascii?Q?Pw58DU/1nDW2+PxCj84SEnzegVqrM6/sIyRJmkR0f8ezwRErAN8Q0zxYnCW4?=
 =?us-ascii?Q?cQ/LII9bvv9zHNRj5N7FQ/2wj6AMbbiS7X4u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4rHvU0K0fMG9fsvnjv/1qQqHGfiohamuhUhFLMN2C5C4XUxWDTEH7FfSeZ9U?=
 =?us-ascii?Q?Xotx+8+IgkJxSHl2nUtlxXl/hjlfFCS4Qn2oW5QTeFyYSC/XvzpsSKxCPsyZ?=
 =?us-ascii?Q?RSv0mR5P3pMzC0c4UmjHXLLoqgi8IdUhfB0/ZTYEmsYiTd9NdRlA8RMaBOx7?=
 =?us-ascii?Q?AgwPjLlv71gWBRr4gWmvZcdS9ZpaQxwLVUowvsqpYsM6s/QrS04cgPIxN+oO?=
 =?us-ascii?Q?KHwkZ4Voq+RcOzcnv2gGRMqN1ipHlTj18MMW5jCIHhVReEdszh3TMiIUSRP3?=
 =?us-ascii?Q?IMhYVTAE81zZQAtcg76Y1gZIOZDDO6F52l74raQ1rnG+R6qYmahLSdinTWL5?=
 =?us-ascii?Q?Q2KZhJB/ls2NFMz5pyPlSqzBNOdifWEMEFEa3M0lJpCPxDGcLVK5rbF390gw?=
 =?us-ascii?Q?gnx8XBUbU0f0LQg1I6KBTl1vwqxHkV764j3TRUG54w4YKHVkOkyf23O3Hqpu?=
 =?us-ascii?Q?nB/Bnc4UXE0oxPmQuJky6vuufRscrvbuiswSyoVNDzVva1sSFSj4LtzeZunS?=
 =?us-ascii?Q?LrbF+mfKHpnYxiXD3MBszcy+xr0OfzWkBEuWuWGWLcc2dnTVSZ7iGAbk3Nq5?=
 =?us-ascii?Q?jprllGKmg7P01zxDNyZidvf3a7RHG670+mVf3tv4EaNn6ZPnVStq1Smcnh06?=
 =?us-ascii?Q?dgETDsH92s+k/R/ahEEQqc6B8prPXgAP1r0a3Mhi5iLkDLGW0vXv+siSL1Fe?=
 =?us-ascii?Q?tuLGl4R/lwt7Apmyl2rJ3A2Odo5nvH1d393lEgR4X8Nc9ASVeAd+uKhjmz93?=
 =?us-ascii?Q?bdXiiwwkS+VSNueffhGpRl5i6G0XHepnNXsBMPgRDwtA7NnibFF72OaAibUV?=
 =?us-ascii?Q?YiS/+XOUvUazBEEhIVzz6s00WOJDKB3FxJ3y6Cm8JbAqftuDss3nUNME9sP/?=
 =?us-ascii?Q?vCTedN8yoVBLQx2ql5qmbnYrLvExBpMh0VwQfazahSR+jcmB7WAXU5Hm2Mn8?=
 =?us-ascii?Q?40BExG74tiJ+1D8Z6L9Qq3PVglEJ5Z/bjseLBFC+J71ZKiyDdjRY3g0pBGWb?=
 =?us-ascii?Q?eEnVTPAayDfaNIQ1jeU4xWe6P3x3WeDIc6aokzQ8JZDjxMrEkMdX4xBbaDrv?=
 =?us-ascii?Q?bS11fOGoaP8nR247Zj4DlVnGu2vOzxUziPXmPkX+9aRf4ZYNXLI5pvn6zIiE?=
 =?us-ascii?Q?X1BG+6WGcCIscrcr68RBquOavRIYI3RHEpaeMNy7ywfM+IaiWHTacksh5Csv?=
 =?us-ascii?Q?/Vaof1Kd+yR5vZ1hK4HFhifsD/OeYQhjyV5NaH/Kozw6V4+nzPpCqH6csOxN?=
 =?us-ascii?Q?v1Rn5OzAm1JBcHPEx2X0jOAYkTxQZhj3eNtrTGrMCJBaP/CqB/HvlqR9eAUY?=
 =?us-ascii?Q?8dMnZbF8yXHXHbUCu2jiEL7VCEofdrO2dlJmuuKQd9YsOqC1a74ws9EMHEKB?=
 =?us-ascii?Q?IKNNLf9crfQz4Ajur3L8vkKIG1pH9jsSVZ5oxjVeDw0H0GcyzxUkRxzMx5ww?=
 =?us-ascii?Q?izVyZiBhi0wom6Jvia6DUbnAHUHnSnKKI93Aa8L+DCQ7qJJyPgm7GTgpolTZ?=
 =?us-ascii?Q?JTszOwwrjIvkpCD8zO0GDdbsUNMrtx1aiGjuOYxorerdI+iTJk4v5I+bORnF?=
 =?us-ascii?Q?JcBCPxfhpH92H7pI7jZWbFEG6yWoR89C8h0k8hpGYwzqPJfIPa8vKlzFAdnl?=
 =?us-ascii?Q?R5VbqaSG0YyxZNkoMUU1his=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: ca07de80-32a0-4902-c306-08de3edb0a12
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:46:02.2831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EA8mJtijijT/cB4994s/48KSYgtQ3Xo13Tu7ncAH5YQbACdcymiaySLlrltlStr8zie2ey3/+ys32j4ZghTf+z6aE9a46DfaHHChc5i+Aay1dTIuoGFeUYlY+9FMfhU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1066

Add a v4l2 subdevice driver for the Omnivision OS05B10 sensor.

The Omnivision OS05B10 image sensor with an active
array size of 2592 x 1944.

The following features are supported:
- Manual exposure an gain control support
- vblank/hblank control support
- Supported resolution: 2592 x 1944 @ 60fps (SBGGR10)

Co-developed-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 MAINTAINERS                 |    1 +
 drivers/media/i2c/Kconfig   |   10 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/os05b10.c | 1108 +++++++++++++++++++++++++++++++++++
 4 files changed, 1120 insertions(+)
 create mode 100644 drivers/media/i2c/os05b10.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c85915d5d20e..c48d04ca38d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19240,6 +19240,7 @@ M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
+F:	drivers/media/i2c/os05b10.c

 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4b4db8c4f496..9800ba50b9a6 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -371,6 +371,16 @@ config VIDEO_OG0VE1B
 	  To compile this driver as a module, choose M here: the
 	  module will be called og0ve1b.

+config VIDEO_OS05B10
+        tristate "OmniVision OS05B10 sensor support"
+        select V4L2_CCI_I2C
+        help
+          This is a Video4Linux2 sensor driver for Omnivision
+          OS05B10 camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+          module will be called os05b10.
+
 config VIDEO_OV01A10
 	tristate "OmniVision OV01A10 sensor support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index c5f17602454f..561d37939875 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
 obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
 obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
 obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
+obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
 obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
 obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
 obj-$(CONFIG_VIDEO_OV02C10) += ov02c10.o
diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
new file mode 100644
index 000000000000..ec3be535ca2b
--- /dev/null
+++ b/drivers/media/i2c/os05b10.c
@@ -0,0 +1,1108 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * V4L2 Support for the os05b10
+ *
+ * Copyright (C) 2025 Silicon Signals Pvt. Ltd.
+ *
+ * Inspired from imx219, ov2735 camera drivers.
+ */
+
+#include <linux/array_size.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/device/devres.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/types.h>
+#include <linux/time.h>
+#include <linux/units.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
+
+#define OS05B10_XCLK_FREQ		(24 * HZ_PER_MHZ)
+
+#define OS05B10_REG_CHIP_ID		CCI_REG24(0x300A)
+#define OS05B10_CHIP_ID			0x530641
+
+#define OS05B10_REG_CTRL_MODE		CCI_REG8(0x0100)
+#define OS05B10_MODE_STANDBY		0x00
+#define OS05B10_MODE_STREAMING		0x01
+
+#define OS05B10_REG_VTS			CCI_REG16(0x380E)
+#define OS05B10_VTS_MAX			0xFFFF
+
+#define OS05B10_REG_HTS			CCI_REG16(0x380C)
+
+#define OS05B10_ANALOG_GAIN		CCI_REG16(0x3508)
+#define OS05B10_ANALOG_GAIN_MIN		0x80
+#define OS05B10_ANALOG_GAIN_MAX		0x7C0
+#define OS05B10_ANALOG_GAIN_STEP	1
+#define OS05B10_ANALOG_GAIN_DEFAULT     0x80
+
+#define OS05B10_EXPOSURE_GAIN		CCI_REG24(0x3500)
+#define OS05B10_EXPOSURE_MIN		2
+#define OS05B10_EXPOSURE_STEP		1
+#define OS05B10_EXPOSURE_MARGIN         8
+
+#define OS05B10_PIXEL_RATE		(480 * HZ_PER_MHZ)
+#define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
+
+static const struct v4l2_rect os05b10_native_area = {
+	.top = 0,
+	.left = 0,
+	.width = 2608,
+	.height = 1960,
+};
+
+static const struct v4l2_rect os05b10_active_area = {
+	.top = 8,
+	.left = 8,
+	.width = 2592,
+	.height = 1944,
+};
+
+static const char * const os05b10_supply_name[] = {
+	"avdd",		/* Analog supply */
+	"dovdd",	/* Digital IO */
+	"dvdd",		/* Digital core */
+};
+
+static const struct cci_reg_sequence os05b10_common_regs[] = {
+	{ CCI_REG8(0x0301), 0x44 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0305), 0x32 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0325), 0x3b },
+	{ CCI_REG8(0x3002), 0x21 },
+	{ CCI_REG8(0x3016), 0x72 },
+	{ CCI_REG8(0x301e), 0xb4 },
+	{ CCI_REG8(0x301f), 0xd0 },
+	{ CCI_REG8(0x3021), 0x03 },
+	{ CCI_REG8(0x3022), 0x01 },
+	{ CCI_REG8(0x3107), 0xa1 },
+	{ CCI_REG8(0x3108), 0x7d },
+	{ CCI_REG8(0x3109), 0xfc },
+	{ CCI_REG8(0x3500), 0x00 },
+	{ CCI_REG8(0x3501), 0x07 },
+	{ CCI_REG8(0x3502), 0xb6 },
+	{ CCI_REG8(0x3503), 0x88 },
+	{ CCI_REG8(0x3508), 0x00 },
+	{ CCI_REG8(0x3509), 0x80 },
+	{ CCI_REG8(0x350a), 0x04 },
+	{ CCI_REG8(0x350b), 0x00 },
+	{ CCI_REG8(0x350c), 0x00 },
+	{ CCI_REG8(0x350d), 0x80 },
+	{ CCI_REG8(0x350e), 0x04 },
+	{ CCI_REG8(0x350f), 0x00 },
+	{ CCI_REG8(0x3510), 0x00 },
+	{ CCI_REG8(0x3511), 0x00 },
+	{ CCI_REG8(0x3512), 0x20 },
+	{ CCI_REG8(0x3600), 0x4d },
+	{ CCI_REG8(0x3601), 0x08 },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3611), 0x24 },
+	{ CCI_REG8(0x3614), 0x4c },
+	{ CCI_REG8(0x3620), 0x0c },
+	{ CCI_REG8(0x3632), 0x80 },
+	{ CCI_REG8(0x3633), 0x00 },
+	{ CCI_REG8(0x3636), 0xcc },
+	{ CCI_REG8(0x3637), 0x27 },
+	{ CCI_REG8(0x3660), 0x00 },
+	{ CCI_REG8(0x3662), 0x10 },
+	{ CCI_REG8(0x3665), 0x00 },
+	{ CCI_REG8(0x3666), 0x00 },
+	{ CCI_REG8(0x366a), 0x14 },
+	{ CCI_REG8(0x3670), 0x0b },
+	{ CCI_REG8(0x3671), 0x0b },
+	{ CCI_REG8(0x3672), 0x0b },
+	{ CCI_REG8(0x3673), 0x0b },
+	{ CCI_REG8(0x3678), 0x2b },
+	{ CCI_REG8(0x367a), 0x11 },
+	{ CCI_REG8(0x367b), 0x11 },
+	{ CCI_REG8(0x367c), 0x11 },
+	{ CCI_REG8(0x367d), 0x11 },
+	{ CCI_REG8(0x3681), 0xff },
+	{ CCI_REG8(0x3682), 0x86 },
+	{ CCI_REG8(0x3683), 0x44 },
+	{ CCI_REG8(0x3684), 0x24 },
+	{ CCI_REG8(0x3685), 0x00 },
+	{ CCI_REG8(0x368a), 0x00 },
+	{ CCI_REG8(0x368d), 0x2b },
+	{ CCI_REG8(0x368e), 0x2b },
+	{ CCI_REG8(0x3690), 0x00 },
+	{ CCI_REG8(0x3691), 0x0b },
+	{ CCI_REG8(0x3692), 0x0b },
+	{ CCI_REG8(0x3693), 0x0b },
+	{ CCI_REG8(0x3694), 0x0b },
+	{ CCI_REG8(0x369d), 0x68 },
+	{ CCI_REG8(0x369e), 0x34 },
+	{ CCI_REG8(0x369f), 0x1b },
+	{ CCI_REG8(0x36a0), 0x0f },
+	{ CCI_REG8(0x36a1), 0x77 },
+	{ CCI_REG8(0x36b0), 0x30 },
+	{ CCI_REG8(0x36b2), 0x00 },
+	{ CCI_REG8(0x36b3), 0x00 },
+	{ CCI_REG8(0x36b4), 0x00 },
+	{ CCI_REG8(0x36b5), 0x00 },
+	{ CCI_REG8(0x36b6), 0x00 },
+	{ CCI_REG8(0x36b7), 0x00 },
+	{ CCI_REG8(0x36b8), 0x00 },
+	{ CCI_REG8(0x36b9), 0x00 },
+	{ CCI_REG8(0x36ba), 0x00 },
+	{ CCI_REG8(0x36bb), 0x00 },
+	{ CCI_REG8(0x36bc), 0x00 },
+	{ CCI_REG8(0x36bd), 0x00 },
+	{ CCI_REG8(0x36be), 0x00 },
+	{ CCI_REG8(0x36bf), 0x00 },
+	{ CCI_REG8(0x36c0), 0x01 },
+	{ CCI_REG8(0x36c1), 0x00 },
+	{ CCI_REG8(0x36c2), 0x00 },
+	{ CCI_REG8(0x36c3), 0x00 },
+	{ CCI_REG8(0x36c4), 0x00 },
+	{ CCI_REG8(0x36c5), 0x00 },
+	{ CCI_REG8(0x36c6), 0x00 },
+	{ CCI_REG8(0x36c7), 0x00 },
+	{ CCI_REG8(0x36c8), 0x00 },
+	{ CCI_REG8(0x36c9), 0x00 },
+	{ CCI_REG8(0x36ca), 0x0e },
+	{ CCI_REG8(0x36cb), 0x0e },
+	{ CCI_REG8(0x36cc), 0x0e },
+	{ CCI_REG8(0x36cd), 0x0e },
+	{ CCI_REG8(0x36ce), 0x0c },
+	{ CCI_REG8(0x36cf), 0x0c },
+	{ CCI_REG8(0x36d0), 0x0c },
+	{ CCI_REG8(0x36d1), 0x0c },
+	{ CCI_REG8(0x36d2), 0x00 },
+	{ CCI_REG8(0x36d3), 0x08 },
+	{ CCI_REG8(0x36d4), 0x10 },
+	{ CCI_REG8(0x36d5), 0x10 },
+	{ CCI_REG8(0x36d6), 0x00 },
+	{ CCI_REG8(0x36d7), 0x08 },
+	{ CCI_REG8(0x36d8), 0x10 },
+	{ CCI_REG8(0x36d9), 0x10 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x3703), 0x2a },
+	{ CCI_REG8(0x3704), 0x05 },
+	{ CCI_REG8(0x3709), 0x57 },
+	{ CCI_REG8(0x370b), 0x63 },
+	{ CCI_REG8(0x3706), 0x28 },
+	{ CCI_REG8(0x370a), 0x00 },
+	{ CCI_REG8(0x370b), 0x63 },
+	{ CCI_REG8(0x370e), 0x0c },
+	{ CCI_REG8(0x370f), 0x1c },
+	{ CCI_REG8(0x3710), 0x00 },
+	{ CCI_REG8(0x3713), 0x00 },
+	{ CCI_REG8(0x3714), 0x24 },
+	{ CCI_REG8(0x3716), 0x24 },
+	{ CCI_REG8(0x371a), 0x1e },
+	{ CCI_REG8(0x3724), 0x09 },
+	{ CCI_REG8(0x3725), 0xb2 },
+	{ CCI_REG8(0x372b), 0x54 },
+	{ CCI_REG8(0x3730), 0xe1 },
+	{ CCI_REG8(0x3735), 0x80 },
+	{ CCI_REG8(0x3739), 0x10 },
+	{ CCI_REG8(0x373f), 0xb0 },
+	{ CCI_REG8(0x3740), 0x28 },
+	{ CCI_REG8(0x3741), 0x21 },
+	{ CCI_REG8(0x3742), 0x21 },
+	{ CCI_REG8(0x3743), 0x21 },
+	{ CCI_REG8(0x3744), 0x63 },
+	{ CCI_REG8(0x3745), 0x5a },
+	{ CCI_REG8(0x3746), 0x5a },
+	{ CCI_REG8(0x3747), 0x5a },
+	{ CCI_REG8(0x3748), 0x00 },
+	{ CCI_REG8(0x3749), 0x00 },
+	{ CCI_REG8(0x374a), 0x00 },
+	{ CCI_REG8(0x374b), 0x00 },
+	{ CCI_REG8(0x3756), 0x00 },
+	{ CCI_REG8(0x3757), 0x0e },
+	{ CCI_REG8(0x375d), 0x84 },
+	{ CCI_REG8(0x3760), 0x11 },
+	{ CCI_REG8(0x3767), 0x08 },
+	{ CCI_REG8(0x376f), 0x42 },
+	{ CCI_REG8(0x3771), 0x00 },
+	{ CCI_REG8(0x3773), 0x01 },
+	{ CCI_REG8(0x3774), 0x02 },
+	{ CCI_REG8(0x3775), 0x12 },
+	{ CCI_REG8(0x3776), 0x02 },
+	{ CCI_REG8(0x377b), 0x40 },
+	{ CCI_REG8(0x377c), 0x00 },
+	{ CCI_REG8(0x377d), 0x0c },
+	{ CCI_REG8(0x3782), 0x02 },
+	{ CCI_REG8(0x3787), 0x24 },
+	{ CCI_REG8(0x378a), 0x01 },
+	{ CCI_REG8(0x378d), 0x00 },
+	{ CCI_REG8(0x3790), 0x1f },
+	{ CCI_REG8(0x3791), 0x58 },
+	{ CCI_REG8(0x3795), 0x24 },
+	{ CCI_REG8(0x3796), 0x01 },
+	{ CCI_REG8(0x3798), 0x40 },
+	{ CCI_REG8(0x379c), 0x00 },
+	{ CCI_REG8(0x379d), 0x00 },
+	{ CCI_REG8(0x379e), 0x00 },
+	{ CCI_REG8(0x379f), 0x01 },
+	{ CCI_REG8(0x37a1), 0x10 },
+	{ CCI_REG8(0x37a6), 0x00 },
+	{ CCI_REG8(0x37ab), 0x0e },
+	{ CCI_REG8(0x37ac), 0xa0 },
+	{ CCI_REG8(0x37be), 0x0a },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37bb), 0x02 },
+	{ CCI_REG8(0x37bf), 0x05 },
+	{ CCI_REG8(0x37c2), 0x04 },
+	{ CCI_REG8(0x37c4), 0x11 },
+	{ CCI_REG8(0x37c5), 0x80 },
+	{ CCI_REG8(0x37c6), 0x14 },
+	{ CCI_REG8(0x37c7), 0x08 },
+	{ CCI_REG8(0x37c8), 0x42 },
+	{ CCI_REG8(0x37cd), 0x17 },
+	{ CCI_REG8(0x37ce), 0x01 },
+	{ CCI_REG8(0x37d8), 0x02 },
+	{ CCI_REG8(0x37d9), 0x08 },
+	{ CCI_REG8(0x37dc), 0x01 },
+	{ CCI_REG8(0x37e0), 0x0c },
+	{ CCI_REG8(0x37e1), 0x20 },
+	{ CCI_REG8(0x37e2), 0x10 },
+	{ CCI_REG8(0x37e3), 0x04 },
+	{ CCI_REG8(0x37e4), 0x28 },
+	{ CCI_REG8(0x37e5), 0x02 },
+	{ CCI_REG8(0x37ef), 0x00 },
+	{ CCI_REG8(0x37f4), 0x00 },
+	{ CCI_REG8(0x37f5), 0x00 },
+	{ CCI_REG8(0x37f6), 0x00 },
+	{ CCI_REG8(0x37f7), 0x00 },
+	{ CCI_REG8(0x3800), 0x01 },
+	{ CCI_REG8(0x3801), 0x30 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x0b },
+	{ CCI_REG8(0x3805), 0x5f },
+	{ CCI_REG8(0x3806), 0x07 },
+	{ CCI_REG8(0x3807), 0xa7 },
+	{ CCI_REG8(0x3808), 0x0a },
+	{ CCI_REG8(0x3809), 0x20 },
+	{ CCI_REG8(0x380a), 0x07 },
+	{ CCI_REG8(0x380b), 0x98 },
+	{ CCI_REG8(0x380c), 0x06 },
+	{ CCI_REG8(0x380d), 0xd0 },
+	{ CCI_REG8(0x380e), 0x07 },
+	{ CCI_REG8(0x380f), 0xd6 },
+	{ CCI_REG8(0x3810), 0x00 },
+	{ CCI_REG8(0x3811), 0x08 },
+	{ CCI_REG8(0x3812), 0x00 },
+	{ CCI_REG8(0x3813), 0x08 },
+	{ CCI_REG8(0x3814), 0x01 },
+	{ CCI_REG8(0x3815), 0x01 },
+	{ CCI_REG8(0x3816), 0x01 },
+	{ CCI_REG8(0x3817), 0x01 },
+	{ CCI_REG8(0x3818), 0x00 },
+	{ CCI_REG8(0x3819), 0x00 },
+	{ CCI_REG8(0x381a), 0x00 },
+	{ CCI_REG8(0x381b), 0x01 },
+	{ CCI_REG8(0x3820), 0x88 },
+	{ CCI_REG8(0x3821), 0x00 },
+	{ CCI_REG8(0x3822), 0x12 },
+	{ CCI_REG8(0x3823), 0x08 },
+	{ CCI_REG8(0x3824), 0x00 },
+	{ CCI_REG8(0x3825), 0x20 },
+	{ CCI_REG8(0x3826), 0x00 },
+	{ CCI_REG8(0x3827), 0x08 },
+	{ CCI_REG8(0x3829), 0x03 },
+	{ CCI_REG8(0x382a), 0x00 },
+	{ CCI_REG8(0x382b), 0x00 },
+	{ CCI_REG8(0x3832), 0x08 },
+	{ CCI_REG8(0x3838), 0x00 },
+	{ CCI_REG8(0x3839), 0x00 },
+	{ CCI_REG8(0x383a), 0x00 },
+	{ CCI_REG8(0x383b), 0x00 },
+	{ CCI_REG8(0x383d), 0x01 },
+	{ CCI_REG8(0x383e), 0x00 },
+	{ CCI_REG8(0x383f), 0x00 },
+	{ CCI_REG8(0x3843), 0x00 },
+	{ CCI_REG8(0x3880), 0x16 },
+	{ CCI_REG8(0x3881), 0x00 },
+	{ CCI_REG8(0x3882), 0x08 },
+	{ CCI_REG8(0x389a), 0x00 },
+	{ CCI_REG8(0x389b), 0x00 },
+	{ CCI_REG8(0x38a2), 0x02 },
+	{ CCI_REG8(0x38a3), 0x02 },
+	{ CCI_REG8(0x38a4), 0x02 },
+	{ CCI_REG8(0x38a5), 0x02 },
+	{ CCI_REG8(0x38a7), 0x04 },
+	{ CCI_REG8(0x38b8), 0x02 },
+	{ CCI_REG8(0x3c80), 0x3e },
+	{ CCI_REG8(0x3c86), 0x01 },
+	{ CCI_REG8(0x3c87), 0x02 },
+	{ CCI_REG8(0x389c), 0x00 },
+	{ CCI_REG8(0x3ca2), 0x0c },
+	{ CCI_REG8(0x3d85), 0x1b },
+	{ CCI_REG8(0x3d8c), 0x01 },
+	{ CCI_REG8(0x3d8d), 0xe2 },
+	{ CCI_REG8(0x3f00), 0xcb },
+	{ CCI_REG8(0x3f03), 0x08 },
+	{ CCI_REG8(0x3f9e), 0x07 },
+	{ CCI_REG8(0x3f9f), 0x04 },
+	{ CCI_REG8(0x4000), 0xf3 },
+	{ CCI_REG8(0x4002), 0x00 },
+	{ CCI_REG8(0x4003), 0x40 },
+	{ CCI_REG8(0x4008), 0x02 },
+	{ CCI_REG8(0x4009), 0x0d },
+	{ CCI_REG8(0x400a), 0x01 },
+	{ CCI_REG8(0x400b), 0x00 },
+	{ CCI_REG8(0x4040), 0x00 },
+	{ CCI_REG8(0x4041), 0x07 },
+	{ CCI_REG8(0x4090), 0x14 },
+	{ CCI_REG8(0x40b0), 0x01 },
+	{ CCI_REG8(0x40b1), 0x01 },
+	{ CCI_REG8(0x40b2), 0x30 },
+	{ CCI_REG8(0x40b3), 0x04 },
+	{ CCI_REG8(0x40b4), 0xe8 },
+	{ CCI_REG8(0x40b5), 0x01 },
+	{ CCI_REG8(0x40b7), 0x07 },
+	{ CCI_REG8(0x40b8), 0xff },
+	{ CCI_REG8(0x40b9), 0x00 },
+	{ CCI_REG8(0x40ba), 0x00 },
+	{ CCI_REG8(0x4300), 0xff },
+	{ CCI_REG8(0x4301), 0x00 },
+	{ CCI_REG8(0x4302), 0x0f },
+	{ CCI_REG8(0x4303), 0x20 },
+	{ CCI_REG8(0x4304), 0x20 },
+	{ CCI_REG8(0x4305), 0x83 },
+	{ CCI_REG8(0x4306), 0x21 },
+	{ CCI_REG8(0x430d), 0x00 },
+	{ CCI_REG8(0x4505), 0xc4 },
+	{ CCI_REG8(0x4506), 0x00 },
+	{ CCI_REG8(0x4507), 0x60 },
+	{ CCI_REG8(0x4803), 0x00 },
+	{ CCI_REG8(0x4809), 0x8e },
+	{ CCI_REG8(0x480e), 0x00 },
+	{ CCI_REG8(0x4813), 0x00 },
+	{ CCI_REG8(0x4814), 0x2a },
+	{ CCI_REG8(0x481b), 0x40 },
+	{ CCI_REG8(0x481f), 0x30 },
+	{ CCI_REG8(0x4825), 0x34 },
+	{ CCI_REG8(0x4829), 0x64 },
+	{ CCI_REG8(0x4837), 0x12 },
+	{ CCI_REG8(0x484b), 0x07 },
+	{ CCI_REG8(0x4883), 0x36 },
+	{ CCI_REG8(0x4885), 0x03 },
+	{ CCI_REG8(0x488b), 0x00 },
+	{ CCI_REG8(0x4d06), 0x01 },
+	{ CCI_REG8(0x4e00), 0x2a },
+	{ CCI_REG8(0x4e0d), 0x00 },
+	{ CCI_REG8(0x5000), 0xf9 },
+	{ CCI_REG8(0x5001), 0x09 },
+	{ CCI_REG8(0x5004), 0x00 },
+	{ CCI_REG8(0x5005), 0x0e },
+	{ CCI_REG8(0x5036), 0x00 },
+	{ CCI_REG8(0x5080), 0x04 },
+	{ CCI_REG8(0x5082), 0x00 },
+	{ CCI_REG8(0x5180), 0x00 },
+	{ CCI_REG8(0x5181), 0x10 },
+	{ CCI_REG8(0x5182), 0x01 },
+	{ CCI_REG8(0x5183), 0xdf },
+	{ CCI_REG8(0x5184), 0x02 },
+	{ CCI_REG8(0x5185), 0x6c },
+	{ CCI_REG8(0x5189), 0x48 },
+	{ CCI_REG8(0x520a), 0x03 },
+	{ CCI_REG8(0x520b), 0x0f },
+	{ CCI_REG8(0x520c), 0x3f },
+	{ CCI_REG8(0x580b), 0x03 },
+	{ CCI_REG8(0x580d), 0x00 },
+	{ CCI_REG8(0x580f), 0x00 },
+	{ CCI_REG8(0x5820), 0x00 },
+	{ CCI_REG8(0x5821), 0x00 },
+	{ CCI_REG8(0x3222), 0x03 },
+	{ CCI_REG8(0x3208), 0x06 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x37ab), 0x01 },
+	{ CCI_REG8(0x3790), 0x21 },
+	{ CCI_REG8(0x38be), 0x00 },
+	{ CCI_REG8(0x3791), 0x5a },
+	{ CCI_REG8(0x37bf), 0x1c },
+	{ CCI_REG8(0x3610), 0x37 },
+	{ CCI_REG8(0x3208), 0x16 },
+	{ CCI_REG8(0x3208), 0x07 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x37ab), 0x0e },
+	{ CCI_REG8(0x3790), 0x21 },
+	{ CCI_REG8(0x38be), 0x00 },
+	{ CCI_REG8(0x3791), 0x5a },
+	{ CCI_REG8(0x37bf), 0x0a },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3208), 0x17 },
+	{ CCI_REG8(0x3208), 0x08 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x37ab), 0x0e },
+	{ CCI_REG8(0x3790), 0x21 },
+	{ CCI_REG8(0x38be), 0x00 },
+	{ CCI_REG8(0x3791), 0x5a },
+	{ CCI_REG8(0x37bf), 0x0a },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3208), 0x18 },
+	{ CCI_REG8(0x3208), 0x09 },
+	{ CCI_REG8(0x3701), 0x1d },
+	{ CCI_REG8(0x37ab), 0x0e },
+	{ CCI_REG8(0x3790), 0x28 },
+	{ CCI_REG8(0x38be), 0x00 },
+	{ CCI_REG8(0x3791), 0x63 },
+	{ CCI_REG8(0x37bf), 0x0a },
+	{ CCI_REG8(0x3610), 0x87 },
+	{ CCI_REG8(0x3208), 0x19 },
+};
+
+struct os05b10 {
+	struct device *dev;
+	struct regmap *cci;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct clk *xclk;
+	struct i2c_client *client;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(os05b10_supply_name)];
+
+	/* V4L2 Controls */
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *gain;
+	struct v4l2_ctrl *exposure;
+};
+
+struct os05b10_mode {
+	u32 width;
+	u32 height;
+	u32 vts;
+	u32 hts;
+	u32 exp;
+};
+
+static const struct os05b10_mode supported_modes_10bit[] = {
+	{
+		.width = 2592,
+		.height = 1944,
+		.vts = 2006,
+		.hts = 2616,
+		.exp = 1944,
+	},
+};
+
+static const s64 link_frequencies[] = {
+	OS05B10_LINK_FREQ_600MHZ,
+};
+
+static const u32 os05b10_mbus_codes[] = {
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+};
+
+static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
+{
+	return container_of_const(sd, struct os05b10, sd);
+};
+
+static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
+						     struct os05b10, handler);
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *fmt;
+	int vmax, ret;
+
+	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
+	fmt = v4l2_subdev_state_get_format(state, 0);
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Honour the VBLANK limits when setting exposure. */
+		s64 max = fmt->height + ctrl->val - OS05B10_EXPOSURE_MARGIN;
+
+		ret = __v4l2_ctrl_modify_range(os05b10->exposure,
+					       os05b10->exposure->minimum, max,
+					       os05b10->exposure->step,
+					       os05b10->exposure->default_value);
+
+		if (ret)
+			return ret;
+	}
+
+	if (pm_runtime_get_if_in_use(os05b10->dev) == 0)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		vmax = fmt->height + ctrl->val;
+		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vmax, NULL);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(os05b10->cci, OS05B10_ANALOG_GAIN, ctrl->val,
+				NULL);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(os05b10->cci, OS05B10_EXPOSURE_GAIN, ctrl->val,
+				NULL);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(os05b10->dev);
+
+	return ret;
+}
+
+static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
+		return -EINVAL;
+
+	code->code = os05b10_mbus_codes[code->index];
+
+	return 0;
+}
+
+static int os05b10_set_framing_limits(struct os05b10 *os05b10,
+				      const struct os05b10_mode *mode)
+{
+	u32 hblank, vblank, vblank_max, max_exp;
+	int ret;
+
+	hblank = mode->hts - mode->width;
+	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank, 1, hblank);
+	if (ret)
+		return ret;
+
+	vblank = mode->vts - mode->height;
+	vblank_max = OS05B10_VTS_MAX - mode->height;
+	ret = __v4l2_ctrl_modify_range(os05b10->vblank, 0, vblank_max, 1, vblank);
+	if (ret)
+		return ret;
+
+	max_exp = mode->vts - OS05B10_EXPOSURE_MARGIN;
+	return __v4l2_ctrl_modify_range(os05b10->exposure,
+					OS05B10_EXPOSURE_MIN, max_exp,
+					OS05B10_EXPOSURE_STEP, mode->exp);
+}
+
+static int os05b10_set_pad_format(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_format *fmt)
+{
+	const struct os05b10_mode *mode = &supported_modes_10bit[0];
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	struct v4l2_mbus_framefmt *format;
+	int ret;
+
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
+
+	format = v4l2_subdev_state_get_format(sd_state, 0);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		ret = os05b10_set_framing_limits(os05b10, mode);
+		if (ret)
+			return ret;
+	}
+
+	*format = fmt->format;
+
+	return 0;
+}
+
+static int os05b10_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r = os05b10_native_area;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r = os05b10_active_area;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int os05b10_enum_frame_size(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index >= ARRAY_SIZE(supported_modes_10bit))
+		return -EINVAL;
+
+	fse->min_width = supported_modes_10bit[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = supported_modes_10bit[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static int os05b10_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(os05b10->dev);
+	if (ret < 0)
+		return ret;
+
+	/* Write common registers */
+	ret = cci_multi_reg_write(os05b10->cci, os05b10_common_regs,
+				  ARRAY_SIZE(os05b10_common_regs), NULL);
+	if (ret) {
+		dev_err(os05b10->dev, "%s failed to write common registers\n",
+			__func__);
+		goto err_rpm_put;
+	}
+
+	/* Apply customized user controls */
+	ret = __v4l2_ctrl_handler_setup(os05b10->sd.ctrl_handler);
+	if (ret)
+		goto err_rpm_put;
+
+	/* Stream ON */
+	ret = cci_write(os05b10->cci, OS05B10_REG_CTRL_MODE,
+			OS05B10_MODE_STREAMING, NULL);
+	if (ret)
+		goto err_rpm_put;
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(os05b10->dev);
+
+	return ret;
+}
+
+static int os05b10_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	int ret;
+
+	ret = cci_write(os05b10->cci, OS05B10_REG_CTRL_MODE,
+			OS05B10_MODE_STANDBY, NULL);
+	if (ret)
+		dev_err(os05b10->dev, "%s failed to set stream off\n", __func__);
+
+	pm_runtime_put(os05b10->dev);
+
+	return ret;
+}
+
+static int os05b10_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *format;
+	const struct os05b10_mode *mode;
+
+	/* Initialize try_fmt */
+	format = v4l2_subdev_state_get_format(state, 0);
+
+	mode = &supported_modes_10bit[0];
+	format->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+
+	/* Update image pad formate */
+	format->width = mode->width;
+	format->height = mode->height;
+	format->field = V4L2_FIELD_NONE;
+	format->colorspace = V4L2_COLORSPACE_RAW;
+	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	format->xfer_func = V4L2_XFER_FUNC_NONE;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops os05b10_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops os05b10_pad_ops = {
+	.enum_mbus_code = os05b10_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = os05b10_set_pad_format,
+	.get_selection = os05b10_get_selection,
+	.enum_frame_size = os05b10_enum_frame_size,
+	.enable_streams = os05b10_enable_streams,
+	.disable_streams = os05b10_disable_streams,
+};
+
+static const struct v4l2_subdev_internal_ops os05b10_internal_ops = {
+	.init_state = os05b10_init_state,
+};
+
+static const struct v4l2_subdev_ops os05b10_subdev_ops = {
+	.video = &os05b10_video_ops,
+	.pad = &os05b10_pad_ops,
+};
+
+static const struct v4l2_ctrl_ops os05b10_ctrl_ops = {
+	.s_ctrl = os05b10_set_ctrl,
+};
+
+static int os05b10_identify_module(struct os05b10 *os05b10)
+{
+	int ret;
+	u64 val;
+
+	ret = cci_read(os05b10->cci, OS05B10_REG_CHIP_ID, &val, NULL);
+	if (ret)
+		return dev_err_probe(os05b10->dev, ret,
+				     "failed to read chip id %x\n",
+				     OS05B10_CHIP_ID);
+
+	if (val != OS05B10_CHIP_ID)
+		return dev_err_probe(os05b10->dev, -ENODEV,
+				     "chip id mismatch: %x!=%llx\n",
+				     OS05B10_CHIP_ID, val);
+
+	return 0;
+}
+
+static int os05b10_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	unsigned long delay_us;
+	int ret;
+
+	/* Enable power rails */
+	ret = regulator_bulk_enable(ARRAY_SIZE(os05b10_supply_name),
+				    os05b10->supplies);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to enable regulators\n");
+		return ret;
+	}
+
+	/* Enable xclk */
+	ret = clk_prepare_enable(os05b10->xclk);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to enable clock\n");
+		goto err_regulator_off;
+	}
+
+	gpiod_set_value_cansleep(os05b10->reset_gpio, 0);
+
+	/* Delay T1 */
+	fsleep(5 * USEC_PER_MSEC);
+
+	/* Delay T2 (8192 cycles before SCCB/I2C access) */
+	delay_us = DIV_ROUND_UP(8192, OS05B10_XCLK_FREQ / 1000 / 1000);
+	usleep_range(delay_us, delay_us * 2);
+
+	return 0;
+
+err_regulator_off:
+	regulator_bulk_disable(ARRAY_SIZE(os05b10_supply_name),
+			       os05b10->supplies);
+
+	return ret;
+}
+
+static int os05b10_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct os05b10 *os05b10 = to_os05b10(sd);
+
+	gpiod_set_value_cansleep(os05b10->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(os05b10_supply_name), os05b10->supplies);
+	clk_disable_unprepare(os05b10->xclk);
+
+	return 0;
+}
+
+static int os05b10_parse_endpoint(struct os05b10 *os05b10)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	unsigned long link_freq_bitmap;
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_next_endpoint(dev_fwnode(os05b10->dev), NULL);
+	if (!ep) {
+		dev_err(os05b10->dev, "Failed to get next endpoint\n");
+		return -ENXIO;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+		ret = dev_err_probe(os05b10->dev, -EINVAL,
+				    "only 4 data lanes are supported\n");
+		goto error_out;
+	}
+
+	ret = v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_frequencies,
+				       ARRAY_SIZE(link_frequencies),
+				       &link_freq_bitmap);
+
+	if (ret)
+		dev_err(os05b10->dev, "only 600MHz frequency is available\n");
+
+error_out:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static int os05b10_init_controls(struct os05b10 *os05b10)
+{
+	const struct os05b10_mode *mode = &supported_modes_10bit[0];
+	struct v4l2_fwnode_device_properties props;
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	u64 hblank_def, vblank_def, exp_max;
+	int ret;
+
+	ctrl_hdlr = &os05b10->handler;
+	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  OS05B10_PIXEL_RATE, OS05B10_PIXEL_RATE, 1,
+			  OS05B10_PIXEL_RATE);
+
+	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
+						    V4L2_CID_LINK_FREQ,
+						    ARRAY_SIZE(link_frequencies) - 1,
+						    0, link_frequencies);
+
+	if (os05b10->link_freq)
+		os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	hblank_def = mode->hts - mode->width;
+	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
+					    hblank_def, hblank_def, 1, hblank_def);
+	if (os05b10->hblank)
+		os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	vblank_def = mode->vts - mode->height;
+	os05b10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					    V4L2_CID_VBLANK, vblank_def,
+					    OS05B10_VTS_MAX - mode->height,
+					    1, vblank_def);
+
+	exp_max = mode->vts - OS05B10_EXPOSURE_MARGIN;
+	os05b10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					      V4L2_CID_EXPOSURE,
+					      OS05B10_EXPOSURE_MIN,
+					      exp_max, OS05B10_EXPOSURE_STEP,
+					      mode->exp);
+
+	os05b10->gain = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+					  V4L2_CID_ANALOGUE_GAIN,
+					  OS05B10_ANALOG_GAIN_MIN,
+					  OS05B10_ANALOG_GAIN_MAX,
+					  OS05B10_ANALOG_GAIN_STEP,
+					  OS05B10_ANALOG_GAIN_DEFAULT);
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
+		goto error;
+	}
+
+	ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
+	if (ret)
+		goto error;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
+					      &props);
+	if (ret)
+		goto error;
+
+	os05b10->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+error:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static int os05b10_probe(struct i2c_client *client)
+{
+	struct os05b10 *os05b10;
+	unsigned int xclk_freq;
+	unsigned int i;
+	int ret;
+
+	os05b10 = devm_kzalloc(&client->dev, sizeof(*os05b10), GFP_KERNEL);
+	if (!os05b10)
+		return -ENOMEM;
+
+	os05b10->client = client;
+	os05b10->dev = &client->dev;
+
+	v4l2_i2c_subdev_init(&os05b10->sd, client, &os05b10_subdev_ops);
+
+	os05b10->cci = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(os05b10->cci))
+		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->cci),
+				     "failed to initialize CCI\n");
+
+	os05b10->xclk = devm_v4l2_sensor_clk_get(os05b10->dev, NULL);
+	if (IS_ERR(os05b10->xclk))
+		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->xclk),
+				     "failed to get xclk\n");
+
+	xclk_freq = clk_get_rate(os05b10->xclk);
+	if (xclk_freq != OS05B10_XCLK_FREQ)
+		return dev_err_probe(os05b10->dev, -EINVAL,
+				     "xclk frequency not supported: %d Hz\n",
+				     xclk_freq);
+
+	for (i = 0; i < ARRAY_SIZE(os05b10_supply_name); i++)
+		os05b10->supplies[i].supply = os05b10_supply_name[i];
+
+	ret = devm_regulator_bulk_get(os05b10->dev, ARRAY_SIZE(os05b10_supply_name),
+				      os05b10->supplies);
+	if (ret)
+		return dev_err_probe(os05b10->dev, ret, "failed to get regulators\n");
+
+	ret = os05b10_parse_endpoint(os05b10);
+	if (ret)
+		return dev_err_probe(os05b10->dev, ret,
+				     "failed to parse endpoint configuration\n");
+
+	os05b10->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(os05b10->reset_gpio))
+		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	ret = os05b10_power_on(os05b10->dev);
+	if (ret)
+		return ret;
+
+	ret = os05b10_identify_module(os05b10);
+	if (ret)
+		goto error_power_off;
+
+	/* This needs the pm runtime to be registered. */
+	ret = os05b10_init_controls(os05b10);
+	if (ret)
+		goto error_power_off;
+
+	/* Initialize subdev */
+	os05b10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	os05b10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	os05b10->sd.internal_ops = &os05b10_internal_ops;
+	os05b10->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&os05b10->sd.entity, 1, &os05b10->pad);
+	if (ret) {
+		dev_err_probe(os05b10->dev, ret, "failed to init entity pads\n");
+		goto error_handler_free;
+	}
+
+	os05b10->sd.state_lock = os05b10->handler.lock;
+	ret = v4l2_subdev_init_finalize(&os05b10->sd);
+	if (ret < 0) {
+		dev_err_probe(os05b10->dev, ret, "subdev init error\n");
+		goto error_media_entity;
+	}
+
+	pm_runtime_set_active(os05b10->dev);
+	pm_runtime_enable(os05b10->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&os05b10->sd);
+	if (ret < 0) {
+		dev_err_probe(os05b10->dev, ret,
+			      "failed to register os05b10 sub-device\n");
+		goto error_subdev_cleanup;
+	}
+
+	pm_runtime_idle(os05b10->dev);
+
+	return 0;
+
+error_subdev_cleanup:
+	v4l2_subdev_cleanup(&os05b10->sd);
+	pm_runtime_disable(os05b10->dev);
+	pm_runtime_set_suspended(os05b10->dev);
+
+error_media_entity:
+	media_entity_cleanup(&os05b10->sd.entity);
+
+error_handler_free:
+	v4l2_ctrl_handler_free(os05b10->sd.ctrl_handler);
+
+error_power_off:
+	os05b10_power_off(os05b10->dev);
+
+	return ret;
+}
+
+static void os05b10_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct os05b10 *os05b10 = to_os05b10(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(&os05b10->sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(os05b10->sd.ctrl_handler);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		os05b10_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(os05b10_pm_ops, os05b10_power_off,
+				 os05b10_power_on, NULL);
+
+static const struct of_device_id os05b10_id[] = {
+	{ .compatible = "ovti,os05b10" },
+	{ /* sentinel */ },
+};
+
+MODULE_DEVICE_TABLE(of, os05b10_id);
+
+static struct i2c_driver os05b10_driver = {
+	.driver = {
+		.name = "os05b10",
+		.pm = pm_ptr(&os05b10_pm_ops),
+		.of_match_table = os05b10_id,
+	},
+	.probe = os05b10_probe,
+	.remove = os05b10_remove,
+};
+
+module_i2c_driver(os05b10_driver);
+
+MODULE_DESCRIPTION("OS05B10 Camera Sensor Driver");
+MODULE_AUTHOR("Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>");
+MODULE_AUTHOR("Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>");
+MODULE_LICENSE("GPL");
--
2.34.1


