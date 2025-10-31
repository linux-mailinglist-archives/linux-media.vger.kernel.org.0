Return-Path: <linux-media+bounces-46071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CEBC24DAC
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 12:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ABA2560CC2
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 11:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7C4346FCF;
	Fri, 31 Oct 2025 11:49:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020138.outbound.protection.outlook.com [52.101.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791FF346FA8;
	Fri, 31 Oct 2025 11:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911344; cv=fail; b=kcAgnuH8Bc8fGX6iRJVCn0oSAMKXYBvDswpBjsQEN1Vn6JsZ0dqWDSEUNQnKm0JE+lX60vgoMlWD8RRQzWSW06/RurMR+bnl2UclhzTbfjn31lzAh7AZsz4dUd+f4FdQQSHrNWS9QkdcGY5kJw3ShF68lHhhPjTr2i2GneE7e3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911344; c=relaxed/simple;
	bh=9IVFyBxW2Rx6pUv1O6i3rfd6zK7CQREVcgpF7X9EaPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bLKbWxCkww8a1dN6mYqV9kWXGUNoFzNltke7YHBAj6eMLp/tmsCcf56ueh7BIAJJgFG4VxJEf/tsz6kvVp8RD9nZXAno9mjUuZIO6L6Icj7tsCjKD6UcvZrPUGXJrnEJw/O8U0IqjvV2zKMYd/a9wE2ugMQ5FegO2/TNcwDH0fU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4ehzcfMddOxT36LpEu1lSH6JjjnpgOMLRc34Q30K7uvrRR5rUMZ9K2F2mQOwz5uWP3hxm9Iog+sZOLLcv3E40vOzeUdrIoS5i6oXzjkYY2W+/gz5O99AHTy/sCTp7DHI1omMUlbnhSCFHq14yp571zn92YPkof+01r3UTHMbA2gKit+EP3VLDEhsh72cFlAXlp3C2zi78pTGL9yi0rZ0eF9gvLngeGB6ulFjATtr93ITrTHWx8uRx7+nM3uVU6Hy11tj1vxD6+KH9ILLqeNjJxWAEVclnIAgJDJ8xcrKAROmI4R5nXBJuRrobAnH8uVQFHG+C9wRJq0TC7SyLETzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5a1QP28q+R2mBQkwLgxywfaqPWjsfgf6ygdX5Mxom90=;
 b=SpcM3JWVQ143u46kbWSTRLNcJw9+B6Q3RO6xg8/55mGtwrSYArzWLEKtamLwKs59LJwzDAh+R4E/NOHkOhz8NrjqF0GSgoNHJuGvKqoC/Xnmn171g31c0uTHPgMPkhnz9RLdHBY0RROJCa7UYoHlzHw3ZDKqwgfdzA5Lrvt3rJeUmLvpSW+28T64Gg8yh+rLGDhTIIFrpWCSIJFK5ARP2CjfnW+F5Yr57A+hRJagKmOcbTT/c/fh+UqczjokC1qS/jlsK0Y9U18y0J0YRitScKotWoRcmI0siObSpJK5yCcG9El/izJlsIpoE1YSUpCu+ICFLRmSBH+T/QlNlSK9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB5137.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:305::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 11:48:59 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 11:48:59 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] media: i2c: imx219: Propagate errors from control range updates
Date: Fri, 31 Oct 2025 17:18:34 +0530
Message-Id: <20251031114835.113026-2-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031114835.113026-1-tarang.raval@siliconsignals.io>
References: <20251031114835.113026-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0220.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::18) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN4P287MB5137:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fad4611-8c55-4e15-2b9d-08de18737acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PutEpGijjRGzc1ryU2lwc21qNpfh5Is9FDxC4FATDcu585Aubd8dn3DVo4qg?=
 =?us-ascii?Q?uCLWfeHUyGRx+RPd1baPoFHIGec9M4GtVtRJkxY9vtActcIsJZNeD1jLnSSg?=
 =?us-ascii?Q?rdsbYCgNWBYIT9SpFVbRIb22kH/DBTAvUq1g5JTo94Y/K+hgpb3uVgzd9NlE?=
 =?us-ascii?Q?sJWPfJrI6gQzXnWQWcoSw7pdc+oRqSVC4dn/2Ru5dz8u6YLw1Sms2UhngfE1?=
 =?us-ascii?Q?g4KIyE5JSrEBbpqRPiKdd9/j2lVb+irDRxTn+nnuP1YfmY9bg4fE2rTVjG20?=
 =?us-ascii?Q?i/EjK2v6l+ZuaeQsoSEzDxpkEeCMtsiBuuRwYR4shcgWyiiFGrvNf7Fy7QNz?=
 =?us-ascii?Q?Bk9tkCgvuqnV+T0Nv0vKK7jxmpFVPaVtXeT/GE+qWhRF02qE6o0kOpiLtt6y?=
 =?us-ascii?Q?YiogapqcXxvszhp36h91/LvQvlz4YeMauDZ6fp20yFC1hhkgFzbj9tsgW7fq?=
 =?us-ascii?Q?ekbUjTi/HtBAvVLaT5WyBsur6AkQu41ua805m+2wMxCUl1vj4ezzLDgYgyUq?=
 =?us-ascii?Q?KEtq1BKf+6BKQ3KyvhG947fQA3F+JOZvB2Gdm+ZkPAJtnJVvzT5TW+WYTlsf?=
 =?us-ascii?Q?11CYpatdxmcL4zhWKJ2gAu3wXuLXX+fXvDrtMYu0ypxNdGe1v+t5wV9p7twu?=
 =?us-ascii?Q?FXOT5E/vegjihOEOfmLiUJakOyGT8NChTXYPV/7zjKgYZWLATgqYYjk1uVj1?=
 =?us-ascii?Q?39dgDlxVtiVo8u/9zCnhlAxZ0s4p2aRfX9uSot0N9xPGUliZOVYBeFabG/DO?=
 =?us-ascii?Q?r6CthOcmLfo5yTfudcG3vhKIvC0k1+0W+ZAdy1dq/juwx/PtGEAy/Fht/PLY?=
 =?us-ascii?Q?k4iFTvHofoV108i66ob4Qba3tUv+wmr6V+nsUaGLf4SvTwcj0PfP0syplKyI?=
 =?us-ascii?Q?0pulBmYQHF3T9Pwv567qMEOAKtdC83VorQf99lgq+okYCn6/cmtX+M9ix62f?=
 =?us-ascii?Q?ahApyvuggXfu3qTuq0MRg73IYtjUYeSjS8eL50y0VEPKarYJuOqAMv+SIqtH?=
 =?us-ascii?Q?5cVqCy7y/SHegUnZ2H/qB66FbJmDXWcjP4oQlfS94VlORwZxPDYN5cTWzp24?=
 =?us-ascii?Q?SNwVxC83bqS+HJjK6U37zcBw/g+5m6b8a1oSlKViyGmVq2ucWWlmkvUVuaPA?=
 =?us-ascii?Q?U3vb7DM7yrrFy6T8pPCzb2J8Vi/utprfyOKgzssxH3/De4sFnz9ZOhQwFzYT?=
 =?us-ascii?Q?9pNV3zxFPNP/1+9eHxttF5ZcYZsKF4eKCMqt0X2a+fzz4WS2Els/gFqCz8AB?=
 =?us-ascii?Q?OvM5eyYO8snorw7oZOgC6vS+9yAKldlZuOfgrKWT3J7FuishdWGsUbV8VIO5?=
 =?us-ascii?Q?8pkpRcev1PFQvhk1Pt9PikmQD2v8W3Ien0e+8UJCDu9wjYUyMMhhS2M/Hpsy?=
 =?us-ascii?Q?8n7MEPd/o1tA+M/BxOBfI0irPw/1C5Cs2HIk4tzkN2qCzCAXlSey8bx8oq6X?=
 =?us-ascii?Q?IS+HN1zkzFGYkZj98EFYI0OeDv0s7je+ZwVzzArEAp9v4hahwFEj5bV+5MWp?=
 =?us-ascii?Q?Ou9g0IcAPT0nQlRI84monD+P9cUbW58VoW3Q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ELBDPcSEBq4I2L6ZYg8+aYlNqzyf04W7ZSk/ghF2kOT2fbfszeEIDZZ1BiZY?=
 =?us-ascii?Q?+C/RSJSegRnz0y0T2dlG3EqGtiVCwr/4ARiGMlFCzmmwI/bo9cU5iHEf4bmy?=
 =?us-ascii?Q?n48i6sR6AyM+KcmHSY29u+IheGRktYhvUnYu+dFitSanrw/VnPehTPgas+j/?=
 =?us-ascii?Q?m11G0hO6MQJhcOOZ+OmK2B/HWJer6IBMH83xNHw+AitcZd6S8wCK6aor72wC?=
 =?us-ascii?Q?Pih6bokP1nhJFf0CDVXBTy06+hjveGIL+His6sxx8wgKxfsFI+vOhHs0ip9T?=
 =?us-ascii?Q?TjAYbOViF5XX/DlaHT3vhEDI/e8SaLY9aVITGjLSyUlBRXtGZIz4q8/bkjSO?=
 =?us-ascii?Q?oSH0WgPRa6lAbe6L36yXkKy2CkQODbbmsaXiygU5WMmTertb783X0GYycW9/?=
 =?us-ascii?Q?yfHjwddLBUvfEwBxjPB86hEpgBLFjZF37vUnTzgmQZ1vbFYgZ9Li7zgWUQXX?=
 =?us-ascii?Q?zWUxzfeN4RRa7DjVzifsXb8ww5PCEUgUyz1mDPHYbpVclt6DR9s0X5D1gJd7?=
 =?us-ascii?Q?+2CRt+oWImAT2QGoJ+sgESUnsDV6MroeuHQkGMme8aGqq3xY6PXfy2Saegt3?=
 =?us-ascii?Q?IXwwvSLMKPouSGMfwxF8YAZ6VCsXucgOYL4ZAi1XMurPMIJNyd1kKCaXpMlO?=
 =?us-ascii?Q?f5t1Ab/TYeVvT9N4oeIjomqof52GFEvPTSzImUkosMfVHsglPUIkWDXbWaAE?=
 =?us-ascii?Q?ZpTAWrxFJl1zI+drMBo/cuwodSVtUvnhW9JPerv5y0pMCIY8womDntrREiE4?=
 =?us-ascii?Q?3/DoCo4MbwO8jomoCCgLvXyfHG51NNwb60CCg3Tv1Un2EnTTucCbSLoZ9Akn?=
 =?us-ascii?Q?sXacjhwEzMCowlhs3zNY8rjEg3+3btEmZ6HA/aI3n1JzIgGUkSrUwpG32NTg?=
 =?us-ascii?Q?cPGbGky5VwfMeGGxD+PSlfpahT5LNS+H/o/l0xoIqo+odcmFvBV5hpKcHRVS?=
 =?us-ascii?Q?YjF45OKt9giOCaWJZ7yaDyuCjPoxT8aC2s4hbQeCBaZA3ywMoDPj0kw4X1+0?=
 =?us-ascii?Q?AUrb91n3uES6GR5cYvejZ1xBA15gwPdOMMXtTsKEoLM0Z6A2gGEDw7kos7hd?=
 =?us-ascii?Q?YgzWQ0SuYtcukkmOCVWdnk9wkbchsJ1MPbcwS1hTrFoM+yDtzSSvwe6OYBtj?=
 =?us-ascii?Q?zV3cX6Jh5x4g3+ss4Ou1sLjOoM3MVYHbN+gGu97u7msd8P/qMBNlgYKg4eIE?=
 =?us-ascii?Q?HpCneId7Z+VZm5DfINyEYezeSpkZRUZuPRdj8za+r3V8kY5cjx2P20r/IWjs?=
 =?us-ascii?Q?/uFH5XVY2CAL9kfX2WMHOtwpxFrKPZnuvD5m6g9XQBCaQI7005oxNj66/1iN?=
 =?us-ascii?Q?9W1AZ8tGSoZVhVzPQfolB7UV+2Z+XPaz/NZSrvV3DeInTXTdVUrnsmarCrEJ?=
 =?us-ascii?Q?IGlMakb/JVBCpqtM4Yv9/b1Gwwvik8shxiMUTxUmSwEL/Niukaq4iEllNOwS?=
 =?us-ascii?Q?LNxE8E6X+p5zaZ8DNR95QiOavQ+mbELqf2YldLRgbYQMSCYsT+rInGw0XTta?=
 =?us-ascii?Q?09J6vDMgycJK+toZP7cFtAj945u7TPY3Bj3WvGv+6S/ihlXEwID2WDdWrNrF?=
 =?us-ascii?Q?KyWzAP68fAjDE2rHteHwP3CfXw/2GgDM3kuU2AYNZOnR94gwYzCBi0eK3Sdh?=
 =?us-ascii?Q?Iw=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fad4611-8c55-4e15-2b9d-08de18737acf
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 11:48:59.7845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYinZdF76tKu+aa7Re3GmseRj7oGCcdhJly05dALt7rqwSvaSQ0BAJakCsvv5CwY416+HZlwfaimrn2T+nFwlX78l62fj72k2kJGUvqTJKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB5137

Propagate return values from __v4l2_ctrl_modify_range() and
__v4l2_ctrl_s_ctrl() in imx219_set_ctrl() and imx219_set_pad_format().
This ensures proper error handling instead of ignoring possible
failures. Also return the result of imx219_set_pad_format() from
imx219_init_state().

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx219.c | 61 +++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 48efdcd2a8f9..40693635c0c3 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -453,10 +453,14 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		exposure_max = format->height + ctrl->val - 4;
 		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
 			exposure_max : IMX219_EXPOSURE_DEFAULT;
-		__v4l2_ctrl_modify_range(imx219->exposure,
-					 imx219->exposure->minimum,
-					 exposure_max, imx219->exposure->step,
-					 exposure_def);
+		ret = __v4l2_ctrl_modify_range(imx219->exposure,
+					       imx219->exposure->minimum,
+					       exposure_max,
+					       imx219->exposure->step,
+					       exposure_def);
+		if (ret)
+			return ret;
+
 	}
 
 	/*
@@ -848,6 +852,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	struct v4l2_rect *crop;
 	u8 bin_h, bin_v, binning;
 	u32 prev_line_len;
+	int ret;
 
 	format = v4l2_subdev_state_get_format(state, 0);
 	prev_line_len = format->width + imx219->hblank->val;
@@ -883,19 +888,28 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		int pixel_rate;
 
 		/* Update limits and set FPS to default */
-		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
-					 IMX219_FLL_MAX - mode->height, 1,
+		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
+					       IMX219_FLL_MAX - mode->height, 1,
+					       mode->fll_def - mode->height);
+		if (ret)
+			return ret;
+
+		ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
 					 mode->fll_def - mode->height);
-		__v4l2_ctrl_s_ctrl(imx219->vblank,
-				   mode->fll_def - mode->height);
+		if (ret)
+			return ret;
+
 		/* Update max exposure while meeting expected vblanking */
 		exposure_max = mode->fll_def - 4;
 		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
 			exposure_max : IMX219_EXPOSURE_DEFAULT;
-		__v4l2_ctrl_modify_range(imx219->exposure,
-					 imx219->exposure->minimum,
-					 exposure_max, imx219->exposure->step,
-					 exposure_def);
+		ret = __v4l2_ctrl_modify_range(imx219->exposure,
+					       imx219->exposure->minimum,
+					       exposure_max,
+					       imx219->exposure->step,
+					       exposure_def);
+		if (ret)
+			return ret;
 
 		/*
 		 * With analog binning the default minimum line length of 3448
@@ -906,9 +920,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		imx219_get_binning(state, &bin_h, &bin_v);
 		llp_min = (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ?
 				  IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
-		__v4l2_ctrl_modify_range(imx219->hblank, llp_min - mode->width,
-					 IMX219_LLP_MAX - mode->width, 1,
-					 llp_min - mode->width);
+		ret = __v4l2_ctrl_modify_range(imx219->hblank,
+					       llp_min - mode->width,
+					       IMX219_LLP_MAX - mode->width, 1,
+					       llp_min - mode->width);
+		if (ret)
+			return ret;
 		/*
 		 * Retain PPL setting from previous mode so that the
 		 * line time does not change on a mode change.
@@ -917,13 +934,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		 * mode width subtracted.
 		 */
 		hblank = prev_line_len - mode->width;
-		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
+		ret = __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
+		if (ret)
+			return ret;
 
 		/* Scale the pixel rate based on the mode specific factor */
 		pixel_rate = imx219_get_pixel_rate(imx219) *
 			     imx219_get_rate_factor(state);
-		__v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
-					 pixel_rate, 1, pixel_rate);
+		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
+					       pixel_rate, 1, pixel_rate);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -972,9 +993,7 @@ static int imx219_init_state(struct v4l2_subdev *sd,
 		},
 	};
 
-	imx219_set_pad_format(sd, state, &fmt);
-
-	return 0;
+	return imx219_set_pad_format(sd, state, &fmt);
 }
 
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
-- 
2.34.1


