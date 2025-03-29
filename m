Return-Path: <linux-media+bounces-28976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BC5A75458
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 06:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FEBF7A75A6
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 05:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774F218CC15;
	Sat, 29 Mar 2025 05:45:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021103.outbound.protection.outlook.com [40.107.57.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8119017A2EB;
	Sat, 29 Mar 2025 05:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743227127; cv=fail; b=EKnFHsj1apMqWqKs41pKkppKYDvzfh2mTuG3Nu9/h1Z6dBz4OS+GzzX3lzT6qoMnjQ69wv1Chl4dUjE08q+wtEPYlV+Zs/wQmD4v4XK1FyIAHhPAL4MOkf2g79+NScRZnP34EroAxyZCcBwx5QA+zPupHWldTlWiQJBjGcltOvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743227127; c=relaxed/simple;
	bh=YlmPko3/nQeVmDJbE4pB1TleSZAbfXDIq3eHRGgDdcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fznQqYTBowtT/vMRMt4ncsaVo3MPqwfu0EvLNNmtYhw/P2J32Z1LyDfKQ/Q6Tki8BqAaq0Pfb8TEzsiq8lIypCRM9JB0T076OenmYqSs0gEW+6+Z4hZbq2l6qUT+0x8OeGd7BkNPG8pIAAR8QdnniAY6OizE4h7jt7DH8bjhcPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1a6lyMjPXcto2uaE/oH3cK/KZYwEokOMXzoPKSGMtnqIxwI14zkbwTeSkDBexTDQ4ORMvx41vefbWp1libIqIBx5cWD8QyGa1wL0ptoH+c+1P+NTR9wFL8sSgvSXkJIUX+ekA/Y2nT4IoXS6oDKb39GaspsSZzkE6acaSZM1xr3h6c0CLav8NSPWxR87U8rRf0SVtATw8eBtZVC0p84+6lgr0RIOk1rTtB8SxrbQ+w4+jS2drbC/aUyM1VI5zM0ksPvO3XDFNtbpSR8dMK88+4TlFvccVwJWfTnslWDTK5UZEyRY5G/JHUSHVHGi5+yp9KkHwOJEPMs4PpYmoO83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOs9gIZA1Vw8GFD4bBb/IhhnlYXU0TbRMdbM9MeG9EE=;
 b=vqQD8G/pmE091j22nXFWW3FTS82I4qhv2MYGTQ3M+jVa4SLATyrY5xqP3ZqZ6Q1I78AqmRa/W/TEkq6g9JxnoZsxPV99Q/pfiTJndriqk1om8DPWNyJJopSHLhFk92FxpBLPxLO5Kxu/wT5u9WZrLxJe5QVMVKimJvsfkRPpTSoXjOTW/Y15cOvcK2Hh4QFqb5hupUbm5vbFUhDBL16GhqAI8yfBLa2kKmJ9cKfcwwr78AX5rha/3e7Oz7ABIYpN17yhKl42ECfZ5K7QsM/OsqLqnfUHNzgttjg0ycCgtDLUVaTtfh4YIbuNxLSxyccCKQHQ9fdkr504+PifIpRf7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB1842.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Sat, 29 Mar
 2025 05:45:24 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 05:45:24 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	kieran.bingham@ideasonboard.com
Cc: Shravan.Chippa@microchip.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Julien Massot <julien.massot@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Luis Garcia <git@luigi311.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] media: i2c: imx334: Remove redundant register entries
Date: Sat, 29 Mar 2025 11:13:25 +0530
Message-Id: <20250329054335.19931-4-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
References: <20250329054335.19931-1-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: cab5cb89-cba5-466b-0bbc-08dd6e84e6c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e0IX0q5lgo1YVmWtuSDc8HMsCkBw5N4wu40O6nCh9Y8FAUW4F2aDDnIm57Zw?=
 =?us-ascii?Q?BiPkXKs8+x2dgp5ojwPej+gXfKSMHcV8DErVbJHg4fS5pMmqzu+DawH4jgX6?=
 =?us-ascii?Q?mrJNL7LZmHoSB2ZlAuQYFb51JvDnZLKkstav+QvN4iL7rwl3h8cX6KjAEhI+?=
 =?us-ascii?Q?L+g4CwKBoHY8yD5q6IZouScYKYx5fcZX5+BQVZWlXe/OSjLuFgplH1ShYiEE?=
 =?us-ascii?Q?26CyqFUI5gFoL52y6Lq/ZDdMQhj9uFlOXsSwqJG8bcxwIqeYy5QbMlCMr0hT?=
 =?us-ascii?Q?1pNzxjOuiG3WG/9PcLhna1KRGG+vv/LdSCAn9AvWuxAccu+LZ+H6zELNGgSW?=
 =?us-ascii?Q?Ejy8ZciEsThJos0c+cWZaAfarWMFxCLQMwc43eqCYfRI7hkS3cRZfiieadoO?=
 =?us-ascii?Q?xE1TOaDGJl0PenO/9XRpqhDw780FhlFzKzVcCydNjkFE7eYI6k/Lkgsj3VFC?=
 =?us-ascii?Q?ED1b1zoxfA1mYkPbxkXEMveF2PEWi5frRGb1ujgg4+3Xu2iTTCZW2AXHqho7?=
 =?us-ascii?Q?iOrtCdwljK6aDLtnjCOvwQy+lcIZRSulVjR+qSULZ1f6IVxNlBTxh6Dp4nA/?=
 =?us-ascii?Q?3YO5XwN3Mg6Lzp0iAiZmOXfuL4wQitatUi6YpsjrDdcj5oYrjp/n8VEIl699?=
 =?us-ascii?Q?XSRqg8jpqdtZb7faAbR4x+2z4lfxKygDTNwmKnmDFfjEqE5dVtNkpU2K7FSh?=
 =?us-ascii?Q?f+aUc0xhEA4kBwtlQr/RlOmlDWZaIi7urn5waj3Gpjejpx12ryIrro8MSuZT?=
 =?us-ascii?Q?nVGPdInKHTJdXRtpog/CsVQpdfi7LRoZHrXSyXomAj4AiDSPasnrq4Ksmttj?=
 =?us-ascii?Q?h91OU/l8zMWsFmWOiy8VlP62vhKggTq5aeHmikJ0HvxasZ9ORpS8Z4X8uDoA?=
 =?us-ascii?Q?PjwqlLg9TjGoeW/gqdFBlZFP02hruiU4LVVfQ1h4IxQ06xhWYek7OxJnGnBJ?=
 =?us-ascii?Q?0yuRYAlzfYh3EouwWJDcJdgPdYzCU0bRF58WqI7zyGZqp//2TnOSDsNR/Jno?=
 =?us-ascii?Q?hXSRxtjTCOqDI+1PV132QPDO+dvBoV1OIPhZRisgrfB1beGBvCvEMqNqwcCC?=
 =?us-ascii?Q?4xsFRZ/yxVNuGD46NPFa2V6OaYX79DipexZdQQMdlnmd3rimxxJ6nRnnqhsy?=
 =?us-ascii?Q?0AG6IV4+fbdIzvOWdasksda4HOrey8BmdpxKBRVImTdMNiTHLyg3inBZ9nCO?=
 =?us-ascii?Q?8eQkpx6snrVRrb6+dNdTc17SVa79lL5eKekJ19qBNvyhtiJpT/xOITTpH2mn?=
 =?us-ascii?Q?IfXuX75c5sMPOn4TluXHdeOZZGTsq+0qNogCGPdO4EnlXcUL2+On/XwU3oXn?=
 =?us-ascii?Q?QkHUVQ/izOTz2gMCwe3XaShmrw9pGLL2b7NfHfL+ji5LpxnXgXPv0beH3Q5l?=
 =?us-ascii?Q?2h1L0iRyAqBYNm0fxet5N/MJaI610NMlSpt8o4iMCWJGQgP523m/bICv5N7V?=
 =?us-ascii?Q?r4zS8YPQkCSjN53upIxWe3Y+qqoXHyyPPrwHWH9ArvBqUgiUQu5B8g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DakAsyG/kYtPerX+RHLF6FjacMm5TDB2bA/kNnan9SEUyPE/IdLHTia0ZRp4?=
 =?us-ascii?Q?sNQuQXVIcvGQEfAmqgB0TLXzJmKTEiZIq53ddos1+qSp/IOva0yN0j9bqVQE?=
 =?us-ascii?Q?GWb19ywPVIo0LoPYP2wfGBFdUoO7ZV4mG6MQeKbhm2Hbt3PT+R41EUBSfFVP?=
 =?us-ascii?Q?kwneUr4svZnVWwpAsLmkSDgM656RWehDemOwj0vD46DmJIle9kOrPxE8fLLL?=
 =?us-ascii?Q?JISCxY6KmTAnRuAbZekt1tlm9NI2iaPF8DP71YfdJwpP7zrCYhNdm8HXFZew?=
 =?us-ascii?Q?Shvlbh3lQFP63QRrjyYxldiTHqatWteFerSGiIGCt9G0/uwXp0RnFON4bXXz?=
 =?us-ascii?Q?4HP2BiQtrzaWQk3wKClYI3seN7YsK3DKzxSD2cOzZTpA/c/WTZWwnEF/Uk1R?=
 =?us-ascii?Q?QipvGEl+M6jVn05hSaecDLqEI01jbreAeLyOk4JMb4dLogi2Q7LZsDzfGSg2?=
 =?us-ascii?Q?fr9CsAGagv/aj16hoKWECxttGLajxOEbewadFmNvtj5AF480t3E8PjPyaFOE?=
 =?us-ascii?Q?FoGLYXj80ZT4Uj1K3e1lYkNwBsg+B2qDCFbyWCwU6KbwBhl2dqWuC2jBwh8g?=
 =?us-ascii?Q?heB0/NV9wTph7lMIXz0VKy3k6ZNOjHfL6Dy2EE/ACKTzlFkp68N7QOKzDNK4?=
 =?us-ascii?Q?siGKPaxNnYhPkPb9wJZoUwe+vmiVQ+qf5F6P9pCKpuFW6icGu5i2k7b5k2jK?=
 =?us-ascii?Q?8NO1m9p5wlNHHnjGWdDyHRyP3DPdGOCrfYn0q4AS2LfWK0JJJdfSSD/h0i00?=
 =?us-ascii?Q?LiV0ETzijhrqV9kbLXuXMs+kT7gDZiNxcSMOc+B4Dn5eeuTDP7N/HzGbb52r?=
 =?us-ascii?Q?ZvAh2/oN0QMe55r4WJdewgeO2G+osTNFHRWAMc45/iD1Zb9ELj4xsucE3quB?=
 =?us-ascii?Q?2Y0SjDLI/jyb4VHsLd5a3wUssCSKHX+BWE9/R8K4/rI6uS6f6ER6vzrR2NHd?=
 =?us-ascii?Q?yOnQX+vZyuTE1X71gVfCfLT5t31tybnPcKVDs/s3U8bQ1HICqkIWlPX2zHb4?=
 =?us-ascii?Q?cbcFJ0GWUPHVpkfaebOXqMoFppd8vSNm4k7OG8hyhb42lxkM+I3HQq1bL9bj?=
 =?us-ascii?Q?IX9pkgMwqVhSs5CRY7hrBp8zMSt8sikT9AWYP00Djw6iVzEqe38fNfR4vXNp?=
 =?us-ascii?Q?8h8oJAqCDv2XJ3TirVbjmLqnoNIRaDHDRez9CTXAmimJDo2wT5I1jI/ERPHZ?=
 =?us-ascii?Q?Z8/4g77vMqiGbocy6VI7vZQNuR+12BME/Vh98uADIXyHzQbok5vbbAGhX+CD?=
 =?us-ascii?Q?9g2ZqLoHnokk19zbaI4N6Nn9fOzAKaYheKRj5ok1N+qNyYLAYxEz4XgLBWve?=
 =?us-ascii?Q?nkvWWjBStCXYWZk5G7Yu8zbDiUzaoZu2CSSe9T5G2PMYFv4x4j3ynGqF1Uy9?=
 =?us-ascii?Q?7Xm3bNZuyGlFSrAASR4+iYePDXEyvkuqLwxJ+a3AzscmNDHiDUiSus0F5958?=
 =?us-ascii?Q?0Plf6ligo+yUMe/NE/eJS5TSS2t8Z4nQi2dZL4wS2h5aL2OL0Itw0k6eZfEj?=
 =?us-ascii?Q?AQIRddgs8felwHcthhp8cRWXByeDxAWId5KW7lZQOXUkz3IUbGVkxFCfzBML?=
 =?us-ascii?Q?i/oUarWzskvbt3uGt8bCjgMvtLNsfuol5VfCGgNeMRHUFCC/5Dh1Lty3pEMI?=
 =?us-ascii?Q?Fw=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: cab5cb89-cba5-466b-0bbc-08dd6e84e6c2
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 05:45:24.4095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sFJpPuOSG2oQbOC3J7NMCJ3Mo2Uqzz1e1OdDEjR+oHI0gWu3TIclGebQ60u/mWXVwEdWZr+60xB9vlRLx2WW8Qsw0yoUyYQYUMcDhahJDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1842

IMX334_REG_{ADBIT, MDBIT, ADBIT1}: Already written in
imx334_set_framefmt function.

IMX334_REG_THSPREPARE: Unnecessary repeated writes removed.

CCI_REG8(0x3e04): Unnecessary repeated writes removed.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx334.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 0785bf213d91..9d4d15df8dcf 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -226,7 +226,6 @@ static const struct cci_reg_sequence common_mode_regs[] = {
 	{ IMX334_REG_OPB_SIZE_V,	0x00 },
 	{ IMX334_REG_HREVERSE,		0x00 },
 	{ IMX334_REG_VREVERSE,		0x00 },
-	{ IMX334_REG_ADBIT,		0x00 },
 	{ IMX334_REG_UNREAD_PARAM5,	0x0000 },
 	{ IMX334_REG_UNREAD_PARAM6,	0x0008 },
 	{ IMX334_REG_XVS_XHS_OUTSEL,	0x20 },
@@ -239,19 +238,13 @@ static const struct cci_reg_sequence common_mode_regs[] = {
 	{ IMX334_REG_INCKSEL4,		0x7e },
 	{ IMX334_REG_SYS_MODE,		0x02 },
 	{ IMX334_REG_HADD_VADD,		0x00 },
-	{ IMX334_REG_MDBIT,		0x00 },
 	{ IMX334_REG_VALID_EXPAND,	0x03 },
 	{ IMX334_REG_TCYCLE,		0x00 },
-	{ IMX334_REG_ADBIT1,		0x01ff },
 	{ IMX334_REG_LANEMODE,		0x03 },
 	{ IMX334_REG_TCLKPOST,		0x007f },
 	{ IMX334_REG_TCLKPREPARE,	0x0037 },
 	{ IMX334_REG_TCLKTRAIL,		0x0037 },
 	{ IMX334_REG_TCLKZERO,		0xf7 },
-	{ IMX334_REG_THSPREPARE,	0x003f },
-	{ IMX334_REG_THSPREPARE,	0x006f },
-	{ IMX334_REG_THSPREPARE,	0x003f },
-	{ IMX334_REG_THSPREPARE,	0x005f },
 	{ IMX334_REG_THSPREPARE,	0x002f },
 	{ CCI_REG8(0x3078), 0x02 },
 	{ CCI_REG8(0x3079), 0x00 },
@@ -339,7 +332,6 @@ static const struct cci_reg_sequence common_mode_regs[] = {
 	{ CCI_REG8(0x37b0), 0x37 },
 	{ CCI_REG8(0x3e04), 0x0e },
 	{ IMX334_REG_AGAIN, 0x0050 },
-	{ CCI_REG8(0x3e04), 0x0e },
 	{ IMX334_REG_MASTER_MODE, 0x00 },
 };
 
-- 
2.34.1


