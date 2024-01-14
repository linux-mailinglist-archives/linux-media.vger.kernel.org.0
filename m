Return-Path: <linux-media+bounces-3673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7EE82D13E
	for <lists+linux-media@lfdr.de>; Sun, 14 Jan 2024 16:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DDC2B2126F
	for <lists+linux-media@lfdr.de>; Sun, 14 Jan 2024 15:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7F52599;
	Sun, 14 Jan 2024 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="OXrntBy5"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01olkn2086.outbound.protection.outlook.com [40.92.53.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5248B2571
	for <linux-media@vger.kernel.org>; Sun, 14 Jan 2024 15:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOmVzYyuFlKL+Haa/JMRnL8nqiIi2er6POooqA9avZJD0nxQRQn8D7c3MsGP5nTncU8bRadzf4exu7B2h6Qlud04rFC3HuAzvRd1bhLOXtj5LVnvLf5R+KGfQ101lPPsEv0T4sHRdqHZ8N2+2vra4GWRFkBX+JKK7fsxZiZOJm2US31ZvDgozBrdFfaG6FtZFcBCnh/eUCqcecJhq1YICZD+SLEiTXMCWYA1ipwQ7lvK9yJq2Hk1qIOfixTd4u2xfD6RkSUJzcqkueAY6hkIGmx89kdMZBYtYqlCputa4l3WP3vht231Ng3B1cH6LrIqnd6gOyjUhQjyIuZVA/l5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPH+sO2QiWheMLXonMxKjDjv333IeBR04rcwN0eL2LU=;
 b=msGKlNtr4yj5MkbWAFBLU0RmS5VZHWBw24GoEdVlYnNbURD6R+l9twBB0txmlnA3BN0cUcc46rNdhe4JYbySGi5poereFmNAZ3pckMWcMBUpvpNvwJmC1Ltyx2iQZFlUlHdR+AZwko/4gxGBu6HxNCpfd6G5RXJ3NwTIvu+CL5Rr1mawCl1TSsdyWaEPYBeaXhQdboBGG3cNkOm+cQobVzBeQm3k69ZknJQG8XJxl4sQiY4kmD0v8w7LUhH4u1PTXajmd81X7Z/hhH8dqxALgzRvdm7C/29TFBWrC6xNaRvlig0gPgVODCjtK3KAfQmMQW/gYCC4aR5EKX2vr11fZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPH+sO2QiWheMLXonMxKjDjv333IeBR04rcwN0eL2LU=;
 b=OXrntBy57ZXHxJONtN1BNjGlF3Z40zNzQntQDRO7PHm3v2+VgCNhEKoGlTUdeC97lVpHw3SldI3f3lG//G5bT69qtuHlwJhVJBLhTHqbAWo+s14BQRh0k72Ryw/yJ3Tx/tN0tHaJbPgrLnfZC7SwbikkQDJkSzOZ2E2mK5wc9WMOBhPf68sFd8qo+sTKjlP8zf1YHEmVmd/5WgE2qG62kuCv3M0o2Tmok52+5WDzkmrDf4XoNyqtVgdAPw+Y9OnsPGfSkqxuNheZ8/8ZmG+uxBcf7KL4TykaDKpZRYx3rYy5H9IKQQE7la5eBLpNEE8k8JADOHlRpJzexTnyPYdSKg==
Received: from KL1PR06MB6178.apcprd06.prod.outlook.com (2603:1096:820:d8::6)
 by SEZPR06MB6157.apcprd06.prod.outlook.com (2603:1096:101:eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Sun, 14 Jan
 2024 15:28:27 +0000
Received: from KL1PR06MB6178.apcprd06.prod.outlook.com
 ([fe80::f116:c835:7a40:f79c]) by KL1PR06MB6178.apcprd06.prod.outlook.com
 ([fe80::f116:c835:7a40:f79c%7]) with mapi id 15.20.7181.019; Sun, 14 Jan 2024
 15:28:25 +0000
Date: Sun, 14 Jan 2024 23:28:20 +0800
From: Andy Chen <andy.chen88@outlook.com>
To: qianxin.chen@qq.com
Cc: linux-media@vger.kernel.org
Subject: find_csis_format(),fix return problem
Message-ID:
 <KL1PR06MB6178AEB5A5783EE16AB39AAEE06D2@KL1PR06MB6178.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TMN: [6U+iv99lc3HHuDMYD3jhNnNJ6wlP+T2MJ5cFWGbUxVI=]
X-ClientProxiedBy: TYCP286CA0300.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::15) To KL1PR06MB6178.apcprd06.prod.outlook.com
 (2603:1096:820:d8::6)
X-Microsoft-Original-Message-ID: <20240114152820.GA3382@ubuntu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6178:EE_|SEZPR06MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: 48406191-5526-4eda-6ad5-08dc15157351
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lIVxc7awuL2xdgJJAD7TYNLKHPr+PUWFQ2LIixta3zwXTjr4gqaQ3S4YklOLKac1W4UYPPrMaVFYy5085YnDlNGgy7yd1GWZuCJ+G9fbFXhLihJricrxZswFFwVVKBUK5yW04DSqb6stdcuG0JcO5EAH22+OEuh0L6KLXCFClAtfdG/QqkGLcPRZYQ743quuTNll6k1sIp9m2t8+EHjzMasrfV6xVVff3eDY8urup7pkXny13DRRrO+ZAGMV5cPNQFuC6mt7bSAdCGUX1ovj8uOGW3xAFaW+AKyvywN28E/U1TGEkWdWjvV9pGfgF3r4iYVJrNTRp46yGkecD9MRHs5FKkQvb+I3Sk9zv+R73GNwCt0ictwBM/Qu6DHo8lPUerDrw9iYWGpIuZoF8s9hOoXTDBxS0VI1RW0rCn03a7zh4Apjwi+FAmXpo1esy8HT/KrXRN2yEaYlRVBYEB4Z1tRNfamH/7AmBueCooZmfG5CCB0zmU9/N7+y2t3rFznMniZ8gdeK85xOU0iMIl1TpdNy7qtk9g8DAMgKNAv1/DW3NBFkPtv5NSbJatngcFQe
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qBq5HAcX9HdmRieIg+osfrDk+guFdqWMqyQxgXz5ZLx9BFvftlAw+z4vilUI?=
 =?us-ascii?Q?KcH5awonkJEqoqOjldybnTlVl3qjSQTVuudsksZ1O3UyYVrthB7WbObh9tcq?=
 =?us-ascii?Q?3U1DhX42k5Yh4+7InHAywOPOrK6mNWFwkWuy498v118Zci7FeKMibPSWqQ3T?=
 =?us-ascii?Q?fStNGwlycN2Ts4hFkkmog48pz5UDdw6xxl+pehVKX+z3GusvdjITHOvv4+4U?=
 =?us-ascii?Q?0reUzuQAc2NfBw6TUr0pMdBYmN2CD2hFJDPbN5YmJ0l5ZzXyTKpRhE3GZLmr?=
 =?us-ascii?Q?oYqsSd6DE+ON8wsTh/wfAo5fw4Lw2hFp+iJuNaTWwJAQ9nrWazifrFBVH1mE?=
 =?us-ascii?Q?WlBRxWhM9FG100rbzpqpmTRIkv8EzQr9KQDh96w5w7vE/j6LxFHzvfn3J30R?=
 =?us-ascii?Q?5+oWn33WhlCfke3mmcjaxj0fRkgWFg3kEKCKJjM3QceRpSKO7KRUAVpDwGo9?=
 =?us-ascii?Q?QzBKX/YVttsegNwZLNx6NJWTPTiGed/68BfPeoHEqob8EJ/qgIyx/DP3dTaB?=
 =?us-ascii?Q?DMBVpCiwX1whN8TugBt7g5EDI/cLmG+gqVKpaOd3BjtHZ6Fc9M+owagCtlh4?=
 =?us-ascii?Q?QqQYz4/2oPPYAMhca2wFTQj41L5XYTjUry7IB2gTcNNYWeKz4bP+X5Vun391?=
 =?us-ascii?Q?2TwXjrx526j42vLY3ZGQT1+2PP41G630wNGPTIKfilO/fppHbdwDVKa74bx5?=
 =?us-ascii?Q?trSZlk9hC5kWSjOY8R9YYO+qSIPAqK6JTD6g9gWE11luZyd9ckzfeHhd+y4d?=
 =?us-ascii?Q?Abs4HsbvHd31TOZ56puNjydMD3WAg2DYrMPDWXzNM78qPo3hN3jYrb79yAZL?=
 =?us-ascii?Q?9/FSj3PbIWKGh3hQ6rT5QTzCMFAym+l01LM0gs1fRHbSGXZdoFPuCWwtZkX4?=
 =?us-ascii?Q?mXBpuVfKVDFTxKdR7V/lTLZilLXVm05jJ7iNWREVJ/cDKKJ5rmeS8ERDG1/N?=
 =?us-ascii?Q?8pR0lXtQKTK9MdrwnsbJqH8hGH/DQcLectohIY2Jt3/Q3MAlz0cNIadvQbvO?=
 =?us-ascii?Q?PryhmnIdng78RH+iYKaMBrcLe/tRORJv1QLgaqqf7VnStzWhk1B8ErPbqGMm?=
 =?us-ascii?Q?X5LJWttrLVlaN9orzFHuGHEPUelCzvvcWQfoWjTu3vQM/fXJf5vVkMSbida/?=
 =?us-ascii?Q?mcDxuQdN9TgzHSxYbajy5XG+EiRHO/eO3w9auiZcJRpr+IKke5AwyzQGob9x?=
 =?us-ascii?Q?ts8AEGUmnj/RakJyTR/9afqti0cDgS7KXF8bw9FqJdsrId20WPPlPw0sIHM?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48406191-5526-4eda-6ad5-08dc15157351
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6178.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2024 15:28:25.8004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6157

find_csis_format() may return NULL, and we should determine its return value 
to prevent a fatal error when later functions use it.

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index db8ff5f5c4d3..ac867620e2ba 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -956,6 +956,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 
 	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
+	if (!csis_fmt)
+		return -EPIPE;
 
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
 	if (ret < 0)

Regards,

Andy Chen

