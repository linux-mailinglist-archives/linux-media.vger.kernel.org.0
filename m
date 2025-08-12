Return-Path: <linux-media+bounces-39488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 746F4B21BDB
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 05:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D4C8628032
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 03:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041A72DCC01;
	Tue, 12 Aug 2025 03:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="aTipH3Zl"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012025.outbound.protection.outlook.com [52.101.126.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61931E1C22;
	Tue, 12 Aug 2025 03:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754970886; cv=fail; b=kYE/NOa8KlT8Wzs2XCMXTLc+9IxpHXG9gGnDAtAGvoDgVPWBDscr0dBy5y/OxGxHU+qaairE4TATyZSOu0reACeNCiij4kgrirbjgJ/+0W6B9LUiVKC8ZtNmRH79AwG/8aqTsTc5gAwgHoALNZY/tZFbOzdCMHk7CJQlIgoioBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754970886; c=relaxed/simple;
	bh=4zZYAQlO9N75ZhW42leeQxxYtXv7n+M+GY0MAelPcr4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=StMS9ZWjNZNCmzSP1oUODbEFStqXmC3mFFqqLaA/DzHs7lSIc61p9ptEwjt9hbKxTOrHhBzkBQc1xOkHTLEyLVte0crFrY9sARY4mRRUzCG/QapT+zt06B08yb/IALswvGf6Z2nmRxJY7LJdiXyxHhVMh7PraFU1+AMMr6buP7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=aTipH3Zl; arc=fail smtp.client-ip=52.101.126.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gH+iO9M6wlLxax0CwlehhN/uxhejigXCOfv/fk0/MZoileV5W/03nWcM7dY3GEopJZPIOaBLY+aul7uKDJNpPCw3avSNDrJqgnvzp5LbGwbREsiOSETGz4/K8p1yaZcVcrAYukA0LQLT8ZqRyRcy2Cxv6ZJZ5RY1iqf60bMZ/+5xpmeZ2fqlgj0Ux+/EnAN2sJF7bYFoksmY+0kiNoRdqTtJnt2srDoyAIy+DzLeW0tN5+91Uq8Si9t1RzfhuQSysCYF20z/vTOpLuOMAHIohWZ0rqOVzYVjfc4VbwJi7cGmAzf5pcVjROVS1sp9Dvv/37Hw8EmdqSbz0IUfECBU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbkOoNjQQvfqd3wiFJPdF2dm5Ke5y7edqwfm4q5FZmw=;
 b=gKbAgciziWWA6Gff5QeaK2NhltRe+nht6gfwluw0UHImxoVUIS5pWbLnM5OzO+bezb673jpsQKbLMzuAercfT0LbTu/dmTwC1OuaFWaK7FhYydctAg+Sdw+5F0Pu0P80adUeKvzQ80nP/6KaXfqocYbz8F3o1Tfb6cjxnk80te7ntFdplWJ//uf5UkE1y+Bi5ojVWDuOPEfT/BSSLgzm5nsKtOhrnpmiOIMPjZcYajtrgeyhr2hcbvEnjq0pcm+qv6LHVcehVf8cRYbssCNF/vCao8IpX6xefoDFHDfJbwUq6sQPDE1844NckQXOW5446VrAF1aaRC9+xVokvi4X2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbkOoNjQQvfqd3wiFJPdF2dm5Ke5y7edqwfm4q5FZmw=;
 b=aTipH3Zld/BFUvooQil/93yIuot4G4A72LsLJ/tOItgsePCtEnqdvhbweRbEqSh87uexlPpgNlijeZymLLNUQctQi2tE3UJHqPQStVgjUxyfvdhJjovL1ktaMxhmVsP5nfGTqcsbaN1ys3CiP1Z/4SsKgL0c4o5oqu0VKETAvFZr7hfBvkgYviP9U6rm2o+mH8xO3fQCLCFxxf3H7Z17w3MNwabcG8rbOQuczVQB/wGplfs8Tgd6SWTRzZnRSyGkumz+eA9E5roenrNhxiZUroVQl57QdCd+ozJb0n/sTjFj4v9gqAEILOathOjVbjAkZE7N7ARWugqAIqnfWMOtEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYSPR06MB7046.apcprd06.prod.outlook.com (2603:1096:400:46b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.21; Tue, 12 Aug 2025 03:54:41 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 03:54:41 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	"jieqing.wang" <standback@126.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] media: dvb-core: use vmalloc_array to simplify code
Date: Tue, 12 Aug 2025 11:53:02 +0800
Message-Id: <20250812035310.497233-2-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812035310.497233-1-rongqianfeng@vivo.com>
References: <20250812035310.497233-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYSPR06MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b0fe03-5cf2-4d2b-6bbe-08ddd953f6df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AIgapyOXGshRxpACmDjdnd88Je2adSZcYMffIPjGcHUNXWrPV68h6qQN6UDy?=
 =?us-ascii?Q?nq41trwkxuAt0O70RSEISSSM4xcLUZ8X+UazvZYDyKXVixwAwvOK+6nUbN1p?=
 =?us-ascii?Q?4O0Yd4geZ7tQMgEKGfeDRqUmenZbhvgemn+oosq76ZPkwQiXfnP3T3JS1ZRz?=
 =?us-ascii?Q?hNtnPstknp+sE9gz+mGQJ9dcI6H8iJpx+eLpQl+drNKyk/pY5qL7g+kqMyZw?=
 =?us-ascii?Q?AS2Ds2XE7I61qliFzRg0m0tcOP25vIaoESVsTxJRska56o6oAS1g7RKOcP53?=
 =?us-ascii?Q?z+04fzH+zc25swCUxBGG6hmx7GQwxcsfiwlX1BmOBOaztOvitDWMFzxyvln3?=
 =?us-ascii?Q?CT2cBZKmEhBf0g5c05whGUSXhf5oFefjt9qgM7UnYJKHs4luD/rmae6/v9BO?=
 =?us-ascii?Q?Iw6j48wrb8TJIO3m8SOBxg6daBxNZhx4LnbHvQgfD7e8bm+QyFB3+meqzr19?=
 =?us-ascii?Q?YOkp9JSEdE+SZqz9L4pwh+dYd7a42KtwKuqObHRoHfePOlt14VT8zWX40atZ?=
 =?us-ascii?Q?1UffGQKqoIFtbGm4NgqQuf1GIvC1r3YVPu/y4JE4m5bfGU734nn+KB+zZukT?=
 =?us-ascii?Q?6ALrb6J+ft/JlRhL0WRxOJ88hE183wm5sLyvVXQd7S1TmWhTJn4sqP3Jy4S/?=
 =?us-ascii?Q?SHIkLL4m2qwMMvu2wOjZ7MlUMV40YC+KcXa+AHInRqEkdHrCHCOOSvgkSTlI?=
 =?us-ascii?Q?7uYa40QzbmEytSibLRILEOT5E2cDYPxTzAcwznFRK0kG8UoN2dHdfty92j3L?=
 =?us-ascii?Q?SBXk24gOgsTexctZ3fP0XadlpgrXfxyd4+cajYc5XHCszlCTq+ODhBF63n/i?=
 =?us-ascii?Q?U9kuqhWQymuPxq548ejrbM70KUDpX9V44Y3Qlo4bt+rPGBw3Xs/O04ozleYl?=
 =?us-ascii?Q?UjyLrG6HGSc/kdeX95AFyBS1T2T/XTDGxmmvkLXnhF8aE051on6h2pny6jgN?=
 =?us-ascii?Q?0QJfGRpVR4ur6UztY0KENRLpfnsMgWkaiG++0o6JpgrfqcjHKvLJKWU80WNo?=
 =?us-ascii?Q?oDfejIIfNXi9Eg1sY8AcJeNUnoRiI9bDIJzSVGusl7EgyfVK2bgg9HomNMe3?=
 =?us-ascii?Q?AOn1bWpfzVeBq5iDWyRN/5TAso2VLt7S2/SaE7fjvDmpCCW3AZIQ/R+RKty6?=
 =?us-ascii?Q?fkDCCNc6X0nxsC/79rbgdoF6vZAcnZqjeJvel4mpL5nQVlW7U8QKJana4Wy9?=
 =?us-ascii?Q?sgpy6zPrfoRCHNqATmCZCf8FFzUPWiDtOb4P0H9bJxTXBaf5LqQnMxsTuVQY?=
 =?us-ascii?Q?P0jmziXgoHu2yu7g9RgoZi6aJ/1RG7WZe1zlKd31+6R+t4FWslo1m0F5Ugpi?=
 =?us-ascii?Q?zhu2sJo14hxteAIGSjTILKI9mxTd1UcP/IbzxnAvzejskSzmYJ2SjQrIkFxA?=
 =?us-ascii?Q?ZnohdcVnw1VzWj4hURCmpG6IiiHfWFyoAbwKOTGt4vHDZJV+BhrVOlsxcYcA?=
 =?us-ascii?Q?0U0d9/GrmV7w0BPUCDaMexmSymTYjQwRkGBOpReQ6/4aHov7SuOsAg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8TZ5Tg2dXX+rn8d68xXnjW2pGpk20KByOYbIUiBqyL/FSr8qwE0FJrQQR+tf?=
 =?us-ascii?Q?Pl4q4a1+Qta65dEs27xiAHsHPrWiNXNGaK/Z++yRZVJtBIoAjCLOVBdAuRMD?=
 =?us-ascii?Q?HG66tlTZiBPVX73Dq1uUw/nkBes3881gitGaA4bVP70bHQsVQ770Pi3N3O6w?=
 =?us-ascii?Q?yd2ZbrayLj/W4YoIrh/m5Spl/6cXu3hos51IfLXZYAYNWL/mDS7wte2AudQZ?=
 =?us-ascii?Q?VHiYb5dy8mZpUKp0jxEV0ldlQIXu5pAdxZCYwMq+0O0RlPEJO3nY3w1T5Ypg?=
 =?us-ascii?Q?5iipRitNAXnTcUHaRT7UOVFhcbvhr+KZs2qvC5hglFbL6Vj7DpAwNunYmXVS?=
 =?us-ascii?Q?D1EufFIo8KNW5VF/IKnETvraNsYwj+DrE+KQK7k5VzSO1I0iZi7B0O1DbOVq?=
 =?us-ascii?Q?bvttg67KvwXZm9OCqjFywI/87VmZGwL5kXpWAoNv+H5sHtWuGLm/8EYvZiYa?=
 =?us-ascii?Q?8qm9MrP1hI+Gz/IZYStC2IB47ITkpPUn1fSDV7ju08DJ2LdEjOHEZ3SK099s?=
 =?us-ascii?Q?DunJ8plnGFtZXXnWvNo8WIo/ACdcoc2uYEE01OA2Yzle3aTCZM350aDUFxrw?=
 =?us-ascii?Q?bV22hbcuHPjsEhWHTMXyJlRx6nyMkRrNDBfOnuFmborp1NEXE4nSotX9NzrI?=
 =?us-ascii?Q?9yOTRSkIPOpc6ObXwi+lnMt5yrc07YDbh8UyHaAnwXjvYrJ5vUpq+zpgeq+Z?=
 =?us-ascii?Q?RqhRPmV3vxsuW7zKxxmkvk21LWh8aAi1WjS5slLpdvoz1t35D8qbth01Mvnj?=
 =?us-ascii?Q?WPD+FsOqQkJ/tb/Kfo7jkCat1+oB36vw+RCVuc3JoJZv7Ma8P4xI2AER3vEV?=
 =?us-ascii?Q?sJ+LR/c2LJSeEy9JB0uHjaFb4Nc1X1rgZ5u4Zardwo3z256Fjtzw+MFrXL6I?=
 =?us-ascii?Q?hp/xea53qFOWXKOJfHT6zgQEv0nt+7Q41AOHZvV6AG7cRTa+QX9I9EQM2Eid?=
 =?us-ascii?Q?BjHVOdz/uzvsEwVTr67nrZfhnaooC1uYlEpYWHM8o7n6fupF6I2oUmf3LsXX?=
 =?us-ascii?Q?dMWfDmwv52fl+aceMYFSMx1Z9b2SwFn4Yr/P3YEG8u8eCPgaLosVGVbsa5Zo?=
 =?us-ascii?Q?N8ACc4gKFvjWu94KwO1rfNtFsSKN8vqE6Tc/I5rRX023UMrqphM+EEggi16k?=
 =?us-ascii?Q?26C56B4yJVt8gypG50OlB1tCeWXlaa7RZve1siiU/Q0R0XndBi6JPAT7IPOH?=
 =?us-ascii?Q?cd7tpf1Jl4MYfQCw+zA8hEPbAKWV7zybMXQPIXMsU2rcfrLahUh9BZAKd93M?=
 =?us-ascii?Q?Xc5QLIFwPZ/3oncL06NG7eeXIOJAdPNdzuI6NMqr6UAgLs9GzqKYNHIMypNR?=
 =?us-ascii?Q?DViqN7k2a6e5DInMYE8wIzWhfe0gz/Hf+fYLcWOgk8MpSaGYJ8N4YAjXCIq6?=
 =?us-ascii?Q?TYOgVo45BWeExmEf0FAMYrWyNxnimJ9ZgvU2UW8hk1M/aQci6eeYikzV49Mk?=
 =?us-ascii?Q?7NUzx/SI3zd+x2OkTYVGGfyZlHTzxM7q4waSRJ2Uvb58UWEmXSRbAb8Ssbo+?=
 =?us-ascii?Q?pZfV+Nh3hbblVlWGnQrDFnKkId5Fnd8kWRNkfKtM4kUIPinvkZT66qMwg2I4?=
 =?us-ascii?Q?Ww3QLm2sLi7NvG6/GHDn2EgVNF280SBIdYTBOci1?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b0fe03-5cf2-4d2b-6bbe-08ddd953f6df
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 03:54:40.9359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAZeeDY55VGa6yBDLpJldZ7q1is7VCkCBPAsjc+fQ88dTIUeUAM4nkbSBs1uQBoF7w400QzcLrPfG6cdTkBezA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7046

Remove array_size() calls and replace vmalloc() with vmalloc_array() to
simplify the code.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/media/dvb-core/dmxdev.c    | 4 ++--
 drivers/media/dvb-core/dvb_demux.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 151177e5a06d..8c6f5aafda1d 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -1414,8 +1414,8 @@ int dvb_dmxdev_init(struct dmxdev *dmxdev, struct dvb_adapter *dvb_adapter)
 	if (dmxdev->demux->open(dmxdev->demux) < 0)
 		return -EUSERS;
 
-	dmxdev->filter = vmalloc(array_size(sizeof(struct dmxdev_filter),
-					    dmxdev->filternum));
+	dmxdev->filter = vmalloc_array(dmxdev->filternum,
+				       sizeof(struct dmxdev_filter));
 	if (!dmxdev->filter)
 		return -ENOMEM;
 
diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
index 7c4d86bfdd6c..9667f8b7820e 100644
--- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -1238,14 +1238,14 @@ int dvb_dmx_init(struct dvb_demux *dvbdemux)
 
 	dvbdemux->cnt_storage = NULL;
 	dvbdemux->users = 0;
-	dvbdemux->filter = vmalloc(array_size(sizeof(struct dvb_demux_filter),
-					      dvbdemux->filternum));
+	dvbdemux->filter = vmalloc_array(dvbdemux->filternum,
+					 sizeof(struct dvb_demux_filter));
 
 	if (!dvbdemux->filter)
 		return -ENOMEM;
 
-	dvbdemux->feed = vmalloc(array_size(sizeof(struct dvb_demux_feed),
-					    dvbdemux->feednum));
+	dvbdemux->feed = vmalloc_array(dvbdemux->feednum,
+				       sizeof(struct dvb_demux_feed));
 	if (!dvbdemux->feed) {
 		vfree(dvbdemux->filter);
 		dvbdemux->filter = NULL;
-- 
2.34.1


