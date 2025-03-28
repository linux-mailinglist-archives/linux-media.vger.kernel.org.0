Return-Path: <linux-media+bounces-28911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AAEA74405
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 07:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 776AD3A376C
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 06:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF156211A11;
	Fri, 28 Mar 2025 06:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aCsNsIBH"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2052.outbound.protection.outlook.com [40.107.249.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F48211A0B;
	Fri, 28 Mar 2025 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743143528; cv=fail; b=guuzgvG82l53ItT4o6BoMo1WAS8AwRD+OR3xiC0ENQ9RuLk9EAW5OeInkedfg0hgbhhlAz0143Ff/79p8rXl3WN+P1jxoyYGnPMdVNbrujGmbpiixkHFrvd0ZlZg/YwOwthdYERvCKDY2qghAIUIuEh3CE3TAa9y0FoPMiOkK3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743143528; c=relaxed/simple;
	bh=DcLfPpJBX/s6HFqh68Gf2IwE6C9LPHVOwZjMn0BdApc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qOUECR8HSK5rRfd3k0Ch0SnmB7ttLWw14E/raKcneCMVn+E0NyKmthAVTbHI7H2JPceHMqhm6ZqKljwv8S6P31X022n/suZUnzO+4BKifDHU5gVnu4LwDMAOwoNdFuidc+Bjp4JPy69OcZgvFy9JcjkVZvSTxEHGoU6zOf24jUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aCsNsIBH; arc=fail smtp.client-ip=40.107.249.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPAAzp+PNrHnWVDQlPdSeaFdwX1+5bCLQ8Kmnvy4DBJ7JNwtEcDQp+FUziejXdgX+y8aMAkpJ7PeOUZi/OrGqEzCkR90kFza1boXc6D5krnxA4cBxBIRN7gPmjj+x5y6mAyO7TX5dLhkXHDOmtFPmFgnEEkMWo6bN+HIsnDAsD/k+eB/r4cJWl7efEQlg6ueHGg+7Pk+e7/zokWjbFNmCefIJ0ZzVBzbjfkocsvPQfm9TYMfKWnMUuYbOJBsg1X6EduwaeWwZli5zQrQH3oaor85gf1FFraYSFnR80uqUuX8m53kXqyvoL4TuHDfGTjdseLu1kBp+a6lIwN0jw2hKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPnvWE5QENGii6ZSjAFH+QbOTyDr/ND9h/7PKP+rXJw=;
 b=qwQmCly+ZF7f4aTNDb/CeuVojo9ICGLvobM0E3GoNRNhtM2c7Kyu2xSw1WOkdaBvjpGcytnYm/TL+CYY3qNxE9MwGgqF639sk4tpwyGjFRXQ6sXqgFKW/dqx7sxGAP7aXOMCfwFsxhBbBjvmlRbD47VT142ZbWhYARGI2OPNHDbl2BMRulGYnvEPllXFsLYhTc4+UvGMmJMNqdUdTBcpDgM6v2d76qUFag4mlKFg8aKeA0b3QSWY4xkwIWMRqRGNZDNHlhH4CJyGxiWwNQ0s02zb4yOdC9Rt/iYcMwLYiH/e07n4auOBKZ0ZoifqhlLfRN2rDkPblVc3ZKWd34Bljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPnvWE5QENGii6ZSjAFH+QbOTyDr/ND9h/7PKP+rXJw=;
 b=aCsNsIBH8pL9wWTQPVbY64XH/KU8sKx2oeKbUEWuPqy/Dnu9C0CXOslyHgYTJjbd/fXLRxsof91ZzwaBuaurFv8oFRHsLJTUS2Hb5Cv5TYP0dSdd1ilC7/Kge2uMBpl5KHj/glJ+jdZgS+4RLQrQkswv3sLwuHMnphMLTdR36DK6aH3qjDxUVcQIaxdy4oeC9vGkgluesHi7EOjSKx/KauC62IBYFRMOyzCBVJZRiWDsZqK0osDrlJDhANO3BJESi8SU9TACDDLJPJjFmZ/D9zn6xnTzRmPqHHqGuxVXBo5CavI5S1clhj+P0UwbuilIBhNUAHJdiY5O1fasaF0czg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GV1PR04MB9117.eurprd04.prod.outlook.com (2603:10a6:150:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Fri, 28 Mar
 2025 06:32:03 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 06:32:03 +0000
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
Subject: [PATCH v2 2/3] media: imx-jpeg: Change the pattern size to 128x64
Date: Fri, 28 Mar 2025 14:30:51 +0800
Message-ID: <20250328063056.762-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250328063056.762-1-ming.qian@oss.nxp.com>
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GV1PR04MB9117:EE_
X-MS-Office365-Filtering-Correlation-Id: 496c90cc-1ba9-4371-b91b-08dd6dc2404e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qrBIdWTZRZE0UFRCygGI8pfHPmmEEnHRUKNxkp4tjdrwmwhgMJiojKDT+0/4?=
 =?us-ascii?Q?EAMPB4EoKjiBeaJMQL2fmP7osjgPB9TgHNRi/S3FFEEDMaV9gg0FU2y06guU?=
 =?us-ascii?Q?qzsVwPB6CBJxMxMOjsDga24sHTckxD+sfQeOg4aMjgzfKL/uc8uAfizXIw0X?=
 =?us-ascii?Q?tSv4zlp/OCd9YDOqwZdI+nxpRX41Awa+6r6pP8DdOB9aP46jgE6gF7QLZ9E2?=
 =?us-ascii?Q?ph0L9EnYpWl5hFomgo2tDkHv1uUEjRft3hMf350NKvkTEE7KmH24F2A+FDIY?=
 =?us-ascii?Q?kzbHp4831lhKiYczyd4wLuXIEriQSWQaTIepuFbL6mb0BH9TPVSGj4LUF5aL?=
 =?us-ascii?Q?Mr7oROBpPpQaNsbr1EKi91ZQEJCFdARzT/FqnCPOZREPAFZheyQVvXoWbnOX?=
 =?us-ascii?Q?Gus+l6E7j7QRruKfXkeGl2gTXVJZNgpKLuhDDSS9DPBl7bvHdIEtlSKrd7gT?=
 =?us-ascii?Q?aS+GKGoua7e2hfULdpmo8T2MT99tvf/Mdd7nFMsHrjtJhvPfOYYGs78CN9Lm?=
 =?us-ascii?Q?ivi7XHouP06xxj6whDyxA5inmJG2bv7HDimo1TNl4BOloqp8JryPefRAp3yu?=
 =?us-ascii?Q?6p3zIaQRh9LDzzVLemuB+OCjHGDvhC4XaFhR2chokygGO30emY6YNLRdlmcW?=
 =?us-ascii?Q?W1oRku+GU5IuGZnjFtXLkHIa6bQ6p3S7ptWnwdFAXdGyer6fFRSmY1TwbG2X?=
 =?us-ascii?Q?4t7RQzS6GzJmcT3W86uweo2UbMRTfHK0UZnfSsyJUMTXoEexLI03sSCwdr/i?=
 =?us-ascii?Q?VuK/osN0Ytns43qEry6uP4Q5wi8QGovuwGuZPP53ykaXr8yvQ5joA6eIfHpI?=
 =?us-ascii?Q?3/9s2TvRtRi7DspHA+g9X0t5x5tNfQps1/6a8wVRIv4cY0yE1J8wIzD6iJdl?=
 =?us-ascii?Q?exX3xStuYtjtA9RR7UxZo903xgaxYmUOWStdocnM+kCGRWvZtzPs6le/lnDE?=
 =?us-ascii?Q?sRRsujHwtj4fqDfmUBkNi4jpKcJ5fXKSS++1DPIhTY9aAS70NnY8Qk8kymOt?=
 =?us-ascii?Q?Ma5WGdfZ8+W9sKsQwcwZgYcKM0J3RUZDN4w4Z9D4HKaZDUA/YnjsSs+GMHzd?=
 =?us-ascii?Q?bMTrKSbr6WTamaKoWBz+s/RVivzeEq7RZ3QUr9W1fy9Lk9+PSvwNPwhwYHcv?=
 =?us-ascii?Q?1/A5R15vGK4DpgpistGO5oRi+yP8LkxBQZy+JmCNlcZE33vWIoQB8lhucCKR?=
 =?us-ascii?Q?W6us2UW95feEP9dyprVl7ItROQu7YvpOX9y34AyHm86yEoB3619K6wEyqMAQ?=
 =?us-ascii?Q?cTmlu4O/SLPxxarN91Kd+oFCjU/ZqiiE/DKQPOGI3qLBlGCCK6eK1y/stjem?=
 =?us-ascii?Q?FrT6WvL5ovxWNhN+4vxGLGLm13ct0r8QhgRbjT9y4VJmx/NrZFTshXnwiVJn?=
 =?us-ascii?Q?trYrTyTQ9UE2yJ1mi4s3Uw27uC6Cv1+bSqT98D5CWSzpvkqel3EI8oSc5EWd?=
 =?us-ascii?Q?kMiPlbCsOT2tx97eVgMhNGt2JppHkNfw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QXxdTLwZE8wovageYjpMh3AwDGrt/TCzWc3bqyre3eU620LdvVunbi8vsifd?=
 =?us-ascii?Q?SjLVW+Y7Xq1Pi2ls4pi3DtFCBjRM7GtjfSbYzEGMEUCeC14f1EzV1ezjsRxy?=
 =?us-ascii?Q?SXphzQMvMdSBK/aWDEkjIDzgpJcTgaPfrmSRZU9FQwTY00W+YUVc8LJEhA5U?=
 =?us-ascii?Q?c+Fmf7ezwiGyVDQhcWQoZZz3+bJKYrTHXTHF2hxPF5jYYEwVqfXp86XtK/ZS?=
 =?us-ascii?Q?s1+xPCk72kNjgBOAdfAtjkaKPJgScPc1vTKxH4uW0bEhrn9FGGzIUPsV34IS?=
 =?us-ascii?Q?Ci5FEvMHI6oGwv+OrXCTpgqJ9R5VmPBKRZchMadq81wSlOqgo0vlGAw+9hXP?=
 =?us-ascii?Q?MXAR+ZAFUsu3d4kgNFHgYxsA2ptjzhngQB267mzfsAe8iUurgizji8reGyaa?=
 =?us-ascii?Q?3XFtNGlq9WNnP2Hw0E4NVM/dKwzd/PGl6vwvDymIERkPHkZ9Utor1HhE2abF?=
 =?us-ascii?Q?QJlK4bcMqSuY3BU8FShSCdyK8lRXpicOmBfBFN1fM4TMc2K7LzFnAoY3cW1i?=
 =?us-ascii?Q?LksQpHzoCBS2CFBN5stuND0/WeNEmHKpItveFZPKH1bSsNeetBmx3bLv571w?=
 =?us-ascii?Q?DcW8csz5wj2vmvVEQhAP7B+Cfl9EHfHmSteu/kSGoHaBjIedx4Qzrexs/33b?=
 =?us-ascii?Q?wXYy8Ati15sb4F3HtOqmgtVQ9DDCTgAtMDtTwXrXEorGPqWQ32oCPBVaMUlH?=
 =?us-ascii?Q?HhtJeUrgk799m6SgkwVIbW0a0VKxTF/iOFCmzZevuOYnhtg3f3BwzhxVBXjJ?=
 =?us-ascii?Q?a40tqNndOeOLcxwwsquMCvh0XCEljMJbcGH0fTY673HVG9dplaRH7jmHfY4c?=
 =?us-ascii?Q?jBNaSfnNlGq4b/63nr4rv+PpRUodvRH/xDoIPee/mFpYuE55uWdB4kHk9Qvi?=
 =?us-ascii?Q?pqDmaenOpSiAiduSnLlgFcRGO1y5zT9n67TL9pyJZyIr5pHUHH+c48n3owLJ?=
 =?us-ascii?Q?dr7tmzlLcRpncMbxWkMqmoxdIYf8AZE4JlP4dM3h9nxL2Bjw3OucQNfhyG3G?=
 =?us-ascii?Q?BLHiKZx9sE/UGJQA5YdcdO6rpXMw06O+IcwKys2khaJ0CAj8CCYDWXy6v6k5?=
 =?us-ascii?Q?EF3AFR+ibHVlSCu46G/ipMYoLwlb6EuMgYsSBFOAg6d3oF2L9/4os/VqDQ17?=
 =?us-ascii?Q?17bKzWcpHG3D+U1A3aA3M3xsvtGAQShDTJTTp2LrTQAkk7LkP2LNiCCTMLiv?=
 =?us-ascii?Q?XSgLKyRZbl5vElcy+BN5DC3Fp8JmX6mYeX9tR4UZGBbUVHquCYx0brHTIuoD?=
 =?us-ascii?Q?wxNU65XLYjSsNXFi8Yw8sNp2Y0AGt7qLtmNadIsynuay5iAmOjcMFAZSy0Yl?=
 =?us-ascii?Q?r9ezrN2BX1IEsZ7B3FvUBdCcwgBJjy0M12ub3hd5sk1OL+M/PN7TJAG21Yih?=
 =?us-ascii?Q?qfzpGNtykIysG9aUUpG0WdqQi9YSaLyXHM4I5Skxhm2ptFEBxXAUBvuCTUy5?=
 =?us-ascii?Q?LuRA+iHHernzeh3ZB8UeMbZU2HIv2gj+eERv+9bIrUDMWd684vUHdVE5Ikdj?=
 =?us-ascii?Q?kPwb6LaxRWQG6xzs0N2+nx/OCGPjsW9CDmAGTNtzlry2wKDmfqH0RM8Xm2uk?=
 =?us-ascii?Q?vsUe9TFCyzfELzsaICRjbHv022jKgPLS0ZSZRxFy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 496c90cc-1ba9-4371-b91b-08dd6dc2404e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 06:32:03.0264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDkFY2Tq0cQnaGdH2V1Uui0LIbflJ+CvHvfGqP/IuIC42QHnnIDq9XKn6FKe5aPO50ifFVKjbD4KpKFlowGKuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9117

From: Ming Qian <ming.qian@oss.nxp.com>

To support decoding motion-jpeg without DHT, driver will try to decode a
pattern jpeg before actual jpeg frame by use of linked descriptors
(This is called "repeat mode"), then the DHT in the pattern jpeg can be
used for decoding the motion-jpeg.

To avoid performance loss, use the smallest supported resolution 64x64
as the pattern jpeg size.

But there is a hardware issue: when the JPEG decoded frame with a
resolution that is no larger than 64x64 and it is followed by a next
decoded frame with a larger resolution but not 64 aligned, then this
next decoded frame may be corrupted.

To avoid corruption of the decoded image, we change the pattern jpeg
size to 128x64, as we confirmed with the hardware designer that this is
a safe size.

Besides, we also need to allocate a dma buffer to store the decoded
picture for the pattern image.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 42 +++++++++++++++----
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    |  5 +++
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 12661c177f5a..45705c606769 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -535,7 +535,18 @@ static const unsigned char jpeg_sos_maximal[] = {
 };
 
 static const unsigned char jpeg_image_red[] = {
-	0xFC, 0x5F, 0xA2, 0xBF, 0xCA, 0x73, 0xFE, 0xFE,
+	0xF9, 0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28,
+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
+	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
+	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
+	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0,
+	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
+	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
+	0x8A, 0x00, 0x28, 0xA0, 0x0F, 0xFF, 0xD0, 0xF9,
+	0xFE, 0x8A, 0xFC, 0x34, 0xFD, 0xC4, 0x28, 0xA0,
 	0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00,
 	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
 	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
@@ -545,7 +556,7 @@ static const unsigned char jpeg_image_red[] = {
 	0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02,
 	0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00, 0x28,
 	0xA0, 0x02, 0x8A, 0x00, 0x28, 0xA0, 0x02, 0x8A,
-	0x00, 0x28, 0xA0, 0x02, 0x8A, 0x00
+	0x00, 0x28, 0xA0, 0x0F
 };
 
 static const unsigned char jpeg_eoi[] = {
@@ -775,6 +786,13 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 	jpeg->slot_data.cfg_stream_vaddr = NULL;
 	jpeg->slot_data.cfg_stream_handle = 0;
 
+	dma_free_coherent(jpeg->dev, jpeg->slot_data.cfg_dec_size,
+			  jpeg->slot_data.cfg_dec_vaddr,
+			  jpeg->slot_data.cfg_dec_daddr);
+	jpeg->slot_data.cfg_dec_size = 0;
+	jpeg->slot_data.cfg_dec_vaddr = NULL;
+	jpeg->slot_data.cfg_dec_daddr = 0;
+
 	jpeg->slot_data.used = false;
 }
 
@@ -814,6 +832,14 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 		goto err;
 	jpeg->slot_data.cfg_stream_vaddr = cfg_stm;
 
+	jpeg->slot_data.cfg_dec_size = MXC_JPEG_PATTERN_WIDTH * MXC_JPEG_PATTERN_HEIGHT * 2;
+	jpeg->slot_data.cfg_dec_vaddr = dma_alloc_coherent(jpeg->dev,
+							   jpeg->slot_data.cfg_dec_size,
+							   &jpeg->slot_data.cfg_dec_daddr,
+							   GFP_ATOMIC);
+	if (!jpeg->slot_data.cfg_dec_vaddr)
+		goto err;
+
 skip_alloc:
 	jpeg->slot_data.used = true;
 
@@ -1216,14 +1242,14 @@ static void mxc_jpeg_config_dec_desc(struct vb2_buffer *out_buf,
 	 */
 	*cfg_size = mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
 					      V4L2_PIX_FMT_YUYV,
-					      MXC_JPEG_MIN_WIDTH,
-					      MXC_JPEG_MIN_HEIGHT);
+					      MXC_JPEG_PATTERN_WIDTH,
+					      MXC_JPEG_PATTERN_HEIGHT);
 	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
-	cfg_desc->buf_base0 = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
+	cfg_desc->buf_base0 = jpeg->slot_data.cfg_dec_daddr;
 	cfg_desc->buf_base1 = 0;
-	cfg_desc->imgsize = MXC_JPEG_MIN_WIDTH << 16;
-	cfg_desc->imgsize |= MXC_JPEG_MIN_HEIGHT;
-	cfg_desc->line_pitch = MXC_JPEG_MIN_WIDTH * 2;
+	cfg_desc->imgsize = MXC_JPEG_PATTERN_WIDTH << 16;
+	cfg_desc->imgsize |= MXC_JPEG_PATTERN_HEIGHT;
+	cfg_desc->line_pitch = MXC_JPEG_PATTERN_WIDTH * 2;
 	cfg_desc->stm_ctrl = STM_CTRL_IMAGE_FORMAT(MXC_JPEG_YUV422);
 	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
 	cfg_desc->stm_bufbase = cfg_stream_handle;
diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
index 86e324b21aed..fdde45f7e163 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
@@ -28,6 +28,8 @@
 #define MXC_JPEG_W_ALIGN		3
 #define MXC_JPEG_MAX_SIZEIMAGE		0xFFFFFC00
 #define MXC_JPEG_MAX_PLANES		2
+#define MXC_JPEG_PATTERN_WIDTH		128
+#define MXC_JPEG_PATTERN_HEIGHT		64
 
 enum mxc_jpeg_enc_state {
 	MXC_JPEG_ENCODING	= 0, /* jpeg encode phase */
@@ -117,6 +119,9 @@ struct mxc_jpeg_slot_data {
 	dma_addr_t desc_handle;
 	dma_addr_t cfg_desc_handle; // configuration descriptor dma address
 	dma_addr_t cfg_stream_handle; // configuration bitstream dma address
+	dma_addr_t cfg_dec_size;
+	void *cfg_dec_vaddr;
+	dma_addr_t cfg_dec_daddr;
 };
 
 struct mxc_jpeg_dev {
-- 
2.43.0-rc1


