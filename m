Return-Path: <linux-media+bounces-59568-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB6MNPb662k1TgAAu9opvQ
	(envelope-from <linux-media+bounces-59568-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 01:21:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8148A464059
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 01:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3629A301CCD4
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 23:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAF937F73A;
	Fri, 24 Apr 2026 23:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="GU6otv0T"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5617E363C4A;
	Fri, 24 Apr 2026 23:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777072860; cv=fail; b=Bwps8PVHwR/jykppUApFn+EQFTgwzrVOvF9fdfS2zW+n2q0sPl3tfYpeZ5TRHfEOO9HOC/AmGpitbf0yDpFMJaDcmGXVkzfOFcno63NVOIEEoNfUrEE6UClkKUa67U6ojRrvuwsXNW9BNpTxJz9q+2+ExZtjXTLA8ao+YJ6aX+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777072860; c=relaxed/simple;
	bh=teEe8pO+Jesi5W2aOoZ/7/pWz1XVhE1wkeUHNple6WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=emB0Z37Vg5VgR6ftB0/sjrm6MULf1WGbWwFhTYfu3OScQhpK/lu+60wnjAHtjkdEp1Jq/AxllAwPJHe2Mt31rda7ebZurU4I8vDpX2kKeJAN6KBLP5bKAuR65NKhnEUJWA/Jw5CuDljtrLcQiZjBks83P8U6ChDOEHrEbWKaGjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=GU6otv0T; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OCSR6f2707038;
	Fri, 24 Apr 2026 23:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=tSVZCreDHdfHSj5YXvYg/9zgTn5tioIwxJqmjz5Ir8o=; b=
	GU6otv0TMPcNmNhr3R0k+Wsfjx5z5lRTcDLj8YEIv5UARcXWbHQAdiQfH7zMXLLG
	6ekt/NCWuZH/pI5VZu4F3uRfjAqDKkWp5dJPCgzGAC9eFF0Snd2x1q4yvmPEiF0a
	JN2c92mZFpiSJvmxlHbc9BYXCqtLfHoX5GgoljpHXSLfQ/7n/gckxw4Q8EhjLP/O
	Rfaf4IINusLWe1+2Ov5Rta5EXbgAnb4Ma5M8WmsTUXhZ2d6hhb/F0hBGfsgDCb/Q
	uUPn1y/43R1fg7iCnP/08UDXsTEmVU+0OONXp61qvT3W4PnUBzmTQA8duvJcMSR2
	tuxVjzyhoA+/eqz7NoxG1Q==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8u8an4y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 23:20:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjzxA5Cq/FAYceXkDKui4xOvldzlAHcfYwyWstFfWDxz3s5+Wd2ZKIIV4SGBMTZY3GqnhRcKTk3GwE+XYkhb20ZoOkFooj7+W05H3ZBHxdtkjNY24yq6JdJNk5mxuCwLH3b2BpGZSw64lNXWh4SjD7tH8OEFn8donLXEBNt8vzTJCtJDqSqAGCcOQaCvNiFYO/RArdR7tdlpsAZyMLw4BqrsPeGny6WZquJ3p9F29F3QDxqdD5INZOHYm2c+1b/ediZDAzOyLPn9cMJXLwZ6NEtRu5Zz/a72RYOzlL44fJUgOC3mQsE8V5DQjwxhKFNmOhKftZGVYrtyDLSDcw72cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSVZCreDHdfHSj5YXvYg/9zgTn5tioIwxJqmjz5Ir8o=;
 b=mK1YyWxlaeWS5pel3phZJ/jpcBtc4qIy985brEhX4PePkRHeMeD7yc5LB1n6fbAoPON6uBClSY23YCoAsLC6N8Q0oB19UNpnZTmQsTLQNtZAZjwfzIxoBADmtMgQzZ6btwFppD3jLLS2QlJHW3FR3NGrXr+Ln60lOw+CdCla3thtdaL1zKazxRROxZqon1trBtpLpy4lqWiFhJJaR43HDe+WrIvjyQbBmrpxdsKl/NuKOFp1w11jnCxD/eW6JJ5jbKegY5nhH65678HHMUgQVYIrVXQI03XqiXRyrTe5nfePGFVnzI5X9q+a0Cno/Ee2qN/GUDnG7ACbYXglnnTUig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by PH8PR11MB8061.namprd11.prod.outlook.com
 (2603:10b6:510:250::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 23:20:08 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::b919:1e6b:48a6:f655]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::b919:1e6b:48a6:f655%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 23:20:06 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH 2/3] media: imx8-isi: add missing v4l2_subdev_cleanup() in crossbar and pipe
Date: Sat, 25 Apr 2026 07:19:25 +0800
Message-ID: <20260424231926.406079-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424231926.406079-1-xiaolei.wang@windriver.com>
References: <20260424231926.406079-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: d8dd905f-e6de-4078-e892-08dea25804fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|56012099003|38350700014|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	VGHpf+NHGm4xiJa7CnakZXu7lS1jPL5QxOHeIK5fxeGoR2SS+hOQkg1CNyRQrXVrvMDUlr8a+2c30+4URAx1Wob6geLLS/DkfAm94NS1gMfueQx8h40Ch4/KKZHIWc65ZyUPtuZGkmz2PKbsLqEbE2uaiQLtZ6qkM+DN8BibK0Zd5NqhS1x5qHbaTMounDvenrZ1uz8g+7DIqGHWPOmPuHgoDGIJX0B8gwizTe/3gfy8zrfxSoDwJ+OIWBE3OmdT2hq/0/MdPBeJ//HI9IEqvXrwNs2MJl8ZDcV7PtLZLwZaQUGfLXhD56vHH4Ewg16aa+bixZNGW5RG/wKf/++tymqQyH4T80u++Ki8UhAQ6mucnpVwSztgv7Tm6eYbpV87llixWhi6zp52QM0glNzUKz1odhwQh95AHBvVCdhC7rIx83T6ZjfmarpIX2bskuZEZMpjmcxVtdRJje0FS3T1f5BqsISOlieomqpQHTbYSahDr0xwhXVyXWYYbEv+R2TJpSj0APTH9dHZLL8pB8PiGeqwF9NS5Wlr7futiBm12lmThxWbkT9AV4mrKR66DaP+gTTBE9Xgx39Ma7tqPPfMTmf4xyl1IG12H7H34/9itgVY7ZpJp6I+Jz179eR+drczDk+Qge9YeFUlfaNbhB+NXF1gPnb8YHOnfr8c6CIrFu6ytrU4MuCiPJ6z7kKCtQv3D+0jVaTckoEWTU+t+QJ/IEN6pdqhHVLh+EQojkHZB1Rz3FyLljHBqcUQ9uvzQxX8aHJGeznbGOE6I68AMvsEOKSXBH9Zb4fhNu7lm6upShgsVoOW3ocJPCqYB6SUk5g8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(56012099003)(38350700014)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7bH7auqLlAhigBLsetu35AM8XVKEs/PzwGrEj/jeXEqGYHEaoDNSNaTVPNG2?=
 =?us-ascii?Q?gFDvgMmtQCHNJE4ZQkUjQPFVLgbgMmjpsJsjNpqCNwLyT+n8N5Uc92DCiK/3?=
 =?us-ascii?Q?ZnPpovn/EfXGsOXKgOIx6qDMnktAQqGNXahulzqziaBnh0OzfTZ/HMCe3nqw?=
 =?us-ascii?Q?VGIxWlItjTCynrK1kQq5rMvD10IPwTw02Yd38sKndFk9W9pJqiZIIViW+24U?=
 =?us-ascii?Q?6k+G0AvzM55dj71LazvETpLsQOJv7T1oNomCqXmRKNYbswQTjZylO+8DWTFt?=
 =?us-ascii?Q?l2zNU7yhJXhe9ekIsOHJWAsVCH8/hOl2dp4kbrtBhdABJnufhUGKoa1nsaQM?=
 =?us-ascii?Q?XjlX2grRyE5UrFocWEoRpnkhn1PpwPywX0Du8SGX6OszN+SggIVUklkdm9b6?=
 =?us-ascii?Q?s3ZvyiLLcjsC/zoft2xV1v9ohHZq0ogVpm+C6nPd7MEYwgsSoY/AuVEmFz+q?=
 =?us-ascii?Q?9pxw0ePgu3610KQGPOozptDqQOKaL0vjAnnpwqg/sKULJdLKDvEWQYGtywoN?=
 =?us-ascii?Q?709USRrcHpPne8IiatzA+MramBaJZUPzFbDlpstS6RwOJOymOZsYf/HPvv0J?=
 =?us-ascii?Q?jdKOP+plN6zl5UvAciaUEbLOZ/T6lFNiNORmAtay2q+yrlDbvufVVVBtSrZV?=
 =?us-ascii?Q?fbVZnsYby6JMRfaBb1G7OTgVqpThgEJtkiG5/fC5N1+sV4NBXyKQfMQIpkp4?=
 =?us-ascii?Q?+b1qbkwkeDE5/mbYYueH7xvYTT6mC0K2w0Sveyilb4pFiJw7ZIdya47HsbKv?=
 =?us-ascii?Q?fKkxoAcQThDrmwjE6p5YLPkSP7ZqEBFilJUNryDsx+I08J27NOTK2mAd+cr2?=
 =?us-ascii?Q?B6LJNqyLT9SV/j8+A5kOika89Q8q7cRRubEWjQY3gCejt/sXU9YXFzSmYU0s?=
 =?us-ascii?Q?P0FtpEEcpBH5mTX9D+s2ka/f6gNedyqJBwQDi/htSTsTVC2l0+cf4iLvooCU?=
 =?us-ascii?Q?kxjHJjbc91GiD3SX/MoE1OTW+yYNY0dNFHU1IOHfpEz73EvflXqbHnlMKsS+?=
 =?us-ascii?Q?beJ8sk2Ym5le1ZcA04dJj175e8jK0AbIx1sH7Wnxi2QumeRU+33fJB/X/LTl?=
 =?us-ascii?Q?vtuMSVuFnADm4wm4Jui+SCz9PZu7qAg1XbY3o15pGrmKrA7FDEfELGYSC/kY?=
 =?us-ascii?Q?KNts+uqWE6LUq678M/FwVo++Zlwf/2wZMgXmHC9bFHkXFNsf3dhTCChZ8gxw?=
 =?us-ascii?Q?SptlJe2dyvI1409TXWLWSi78RbncxMES7P5nRCB8mZTjlWxrr9Bpp+DdEaHj?=
 =?us-ascii?Q?0U6gJ04E/t1crrfkgRNMhSV8Hj935XUbQPp6YEha/Jx2YYPanHV+cBYXSJLC?=
 =?us-ascii?Q?G7T8IxbN95nn/cIEmGTymq6sDh4sXhS2Ut0m6UJjC/3uUe++WZ1r0dkyRMT8?=
 =?us-ascii?Q?B3Tm7N5dGis3cUt/KovNwHdWgBYZx2HOoqU30YcD7EZv/3mF4IDGWdQnP6ME?=
 =?us-ascii?Q?5g7Kn8YuOfmtjWJ+ol+pnKrhU/hboiuYnIQz8Bqrlc0a20Hjct+UFgGAHEhI?=
 =?us-ascii?Q?FuQIzXSub2kva0SpAMzUl1Oq72QK4zMEL5YiITiPMCVteLA+b+tfX4EKHeY6?=
 =?us-ascii?Q?zo2uVfEBjnku6Ct8wyFEwFSkDmqv8lojJ05wEoUxGDmYNfvEFGze8Pw0Xtkw?=
 =?us-ascii?Q?PWOMKPr/JSeA0zr0w0oD+aH/pvPIAechnh31JjBJ6uNBBrao5ZEnQvxiAEB3?=
 =?us-ascii?Q?44J8TtiSfh2PyrvgPDY9aZFtFLZ0XhcsEiYLabtbvks3fX79C1UjeSjtcIzo?=
 =?us-ascii?Q?ha1l5WdM3a5uCOX/xOoxUa4NeJ3vx9k=3D?=
X-Exchange-RoutingPolicyChecked:
	bIqqA8G/iV0jwA5vaTovmsKtLUwgpjh1wEC208P+CLNJhjkIlWbt7MXlA3oUglf91QTJB/yhL2ec/560qL0FPnn4nDS0wPw2ifTbsRKT7i0DPC7+siy7uUvc6Tlqrhr5zF1OXRJevNC30K0bCq2evR5PEiYqK/K5OepbceuA4RQ9jGgPsHkxjCo2N03F8TD2cGVnO9G52VPImWdt7fvL8gaKNQKijkzHAFHJ8ZyNiT2UKN/Lggr2OwSdQkL8IejK4ZLTCArdAkVS0995aCn2QknSrT+iSCFkbrbOYg6vGq15PYfLoK/rY/CfI6q7Df7ynQmE9fwfJbd2ePHr7fqcvA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dd905f-e6de-4078-e892-08dea25804fe
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 23:20:05.9967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0a/GyLLpBkeBkwa65LvqLc5DTe4T0ioiLS4C++g832yeVdGGrLxHYzQd8S1PZhYwC7NR/onkjMsy8qjHlvGvZXz7rdXTndLTdrW60IIZCdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDIyNyBTYWx0ZWRfX03zLmQ4/J0O5
 DipEHVTqcVUoHiL1A9FAXzXNqSprQq/0/BEcnicoQTsonRdOQYuO4e0xuc5ih3EiwW9tA5RvY/p
 MouRmIdfok+au+tdp/xFv0+Ohe1NeNFAV6FA/1o2av0yPZHsJDceBiB0FNwM0CVQdulAXWXKdE0
 xJbxqq49B0sOpoQyXN3EMydLegc7BgoKiuTX/FS+UKiL93RjrhFLuqsYQzLpAkPsKfF5wRGrcVp
 PXAk6RCWcywB+1s6rH4eij4TsOS91c7ntGsi80B7nTroHqV0cOSfgm3iVrmZXfcajGEHRL8Fa7F
 W64bS0O+oHWkAve0w3lU74hWn2hAtYHD8TpyJcCDPKBCcTjQzoeVB+fd0r2Myw95J6xAuc7jrqJ
 65dMlPOouDDIdIzsznTHWazZMt4i14yDsDLVeQX6KB7kAeS4g0EvGYxOId0GSdh5hew8HrZMtJD
 6UhWm15loxu0/8R9IDQ==
X-Proofpoint-GUID: Ha8Ni8d_VI9B7kwSzQzO3Dz2GEo1TBXw
X-Authority-Analysis: v=2.4 cv=WLNPmHsR c=1 sm=1 tr=0 ts=69ebfaad cx=c_pps
 a=xOYz1KraVtwoi73AohHYLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=lgr16xn9cv1HVsKBfnsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ha8Ni8d_VI9B7kwSzQzO3Dz2GEo1TBXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1011 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240227
X-Rspamd-Queue-Id: 8148A464059
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59568-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,windriver.com];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:email,windriver.com:dkim,windriver.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]

Both mxc_isi_crossbar_init() and mxc_isi_pipe_init() call
v4l2_subdev_init_finalize() which allocates the subdev active state,
but neither mxc_isi_crossbar_cleanup() nor mxc_isi_pipe_cleanup()
calls v4l2_subdev_cleanup() to free it.

This causes a memory leak on every rmmod, reported by kmemleak:

  unreferenced object 0xffff0000d06fc800 (size 192):
    comm "(udev-worker)", pid 254, jiffies 4294913455
    backtrace (crc 36eeae58):
      kmemleak_alloc+0x34/0x40
      __kvmalloc_node_noprof+0x5f8/0x7d8
      __v4l2_subdev_state_alloc+0x1fc/0x30c
      __v4l2_subdev_init_finalize+0x178/0x368

Add the missing v4l2_subdev_cleanup() calls before media_entity_cleanup()
in both crossbar and pipe cleanup paths.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 605a45124103..c580c831972e 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -491,6 +491,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
 
 void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar)
 {
+	v4l2_subdev_cleanup(&xbar->sd);
 	media_entity_cleanup(&xbar->sd.entity);
 	kfree(xbar->pads);
 	kfree(xbar->inputs);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index a41c51dd9ce0..cb50af2270f6 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -819,6 +819,7 @@ void mxc_isi_pipe_cleanup(struct mxc_isi_pipe *pipe)
 {
 	struct v4l2_subdev *sd = &pipe->sd;
 
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	mutex_destroy(&pipe->lock);
 }
-- 
2.43.0


