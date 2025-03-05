Return-Path: <linux-media+bounces-27569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D15FA4FA7C
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F0441892427
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BE02054ED;
	Wed,  5 Mar 2025 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NbnPGReN"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901BD1FBCB4;
	Wed,  5 Mar 2025 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167870; cv=fail; b=k1ywtYodXFEq8eaBXF9F7SQt+KeST80C7tGyndl12IHE98XykbTKybDm7tRWobbL/9OlIy/MuoK4PymrUCssDzjsfS2Bb2T0chaWzxwkid9iiQTL+9QhUSFLNuXQyw1rWBn01EognEZJg5xpXmcmvKfa/N8THFLaL7YlECx80ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167870; c=relaxed/simple;
	bh=uqHdb/Hya1bDN1kcufVVPvZGvzfuCpyNuBDuxCWXCfM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UMo3cK+ZL3U7ulwquB1GsN+obrEMQamnelvMmRuL5x1TFBptov6CkHmyRxanI0mRM6S9Vr4tGWpBf9IYRuyURmPYz6c9FvRBYN8kP8FR/1DTsp3MKRZH/jDYnjh/XnzSPXx+NsJFGuBfCRFilRAE5NfuqxEAGBSatcfQj/UWbXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NbnPGReN; arc=fail smtp.client-ip=40.107.162.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUHy/xKs6te/8iOp2MD64oMyGywGYR1tI9RWiqqPf6YJ9RoIjOHgYPcHVNWFQjAbUqGVEl7CpTceHD2WZ+9oCNRxiazcKotmhVsKObC593o0L6xok3NbHsbaF2e5Gxu6Yd61w/IRngXpxE54F84bIHDmKd0YJXehmuWsODKKlG9i8C4SQ6YZFGQv6ZRA/XirM/BOcrP+PpCbii4FX6Hjae1cyyraa+i5y1ymJI3whj1VvrTrc2xJNx8VutVRfkjAR5QvFEgXpi0LHa9a3dAfk/MWo1cV9Q2ly+vayBqY+CX73eXvwbqDkS7/JKPzhLfFWaF+4MSRGk5zZNJd9mJf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiDu+wygMeKJ5qSZFosXdD4Ajlk2ndHNYqqbzFP0FAI=;
 b=F9Vlovyklg+62qMPQUlC43Wlj/0QG96xHuY49LUbGHIgMGqND8ugULTSFTQF1mx06FCYn9BbzLZdNUaOlvpY6WBIgK7ZoawpP0tH4SCimCQBpRbNzrWmCYrqpv4CJmo/inwDaNhE9ECvhFF13Yl2ADPkvKWZMVtNv/VEytBs+TQL9Fi9Z6ZH8ME5v108k6n7jInSlpYidVcQr28YsbKICA7jrwwSaPmYL9vB5fP1G4BmeRLhD0oFbfKrsm89eczpAWBXnS96XVy0kJKWci7a02bby0xoUHRvWia/E4UuKk3UnPjTJ4SEdP9rBTCZMPp/bX+AtaX0oRDKE5ZAkKwDgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiDu+wygMeKJ5qSZFosXdD4Ajlk2ndHNYqqbzFP0FAI=;
 b=NbnPGReNdLL4Th3Xls3EnO/lE+EIKSMYs5qc3BkWyc24/gVMQSW1uBWZSXn8pBz+3NDxCeBO15b/lm+mrpW0d/SlYGGYHoEO2rdJ/MbkTx04vSIfDcc3WoXWeRW6FQw2bGY9od0d2/hFyeIP312Ei7mjN1ZXoc4ZiM+GuwOCTnII4353mpkgYqdUMsfGl6fRqWGBoN2bnD+V4Q0fUyLGutmMk5nYdUxMVoSWnzQC7buXu6wGaMb0ha5EJ5YihycF5g3h4kq344l9Z4Z785IlAtdKoj5/YHIkahF9aUVhs7TvQrzlKh2NA1NtyMksJxT/qI+wfVXJsMC1e0KDcy9opw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DB8PR04MB7019.eurprd04.prod.outlook.com (2603:10a6:10:12b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 09:44:23 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 09:44:23 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	bryan.odonoghue@linaro.org,
	laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com,
	alain.volmat@foss.st.com,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	alexander.stein@ew.tq-group.com,
	umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com,
	festevam@denx.de,
	julien.vuillaumier@nxp.com
Subject: [PATCH v4 0/4] media: i2c: Add OX05B1S camera sensor driver
Date: Wed,  5 Mar 2025 11:43:55 +0200
Message-Id: <20250305094359.299895-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P250CA0020.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::25) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DB8PR04MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a7cd483-8e2a-41b3-b69a-08dd5bca4f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Goy9XLQ1moPClJfR+ogybl6Y6tLLCFfShmgyFyQhKFQ35cAUrvFb7avvByvI?=
 =?us-ascii?Q?bRyIJDuBALpbNLpuzG/phgRLNSnt74rvzBeiFVpDrX5kmkTnm3kAF165CHQX?=
 =?us-ascii?Q?Bbb/6pZ3bGfpKGSMxMVFQ4I5BVCSdQKn87qCL7O08EIDjc8FYT0sIPy+zpes?=
 =?us-ascii?Q?d7JQ8WkIZzGa6UdbmF36AU8e4/8vofItP4K/cyPj5xMJmq1BOXbOdIPzSBBu?=
 =?us-ascii?Q?bWqQ2PTt/QYT5j1OB8ZnDqid17nKGNyK5K/sLVG6nAei4F54XYIEGC/lTr4I?=
 =?us-ascii?Q?8l8E+iO0LTN9JI4U24FQpxGOiyh0zeplTgQsOGAn+f296Gn8LMZ/5kdkRmSw?=
 =?us-ascii?Q?b/uNbRfS+H5gfEKayXu+DaS8zCY7273IGtzY5IITAU1NTaOtfcelcTYa8afY?=
 =?us-ascii?Q?hXWK0RsF3aXweS8rlT4BlxK2yo5sFKbOHn0LGznuUkvuUuCQvh8mC88ZJTW0?=
 =?us-ascii?Q?kYdBIPG7ryuieaTmZMz4jIro88Efvj07EHyQwoZA2DBQFntPFMHhRWYnyYST?=
 =?us-ascii?Q?aqgBxqoJdbcR6fZ/4grZCZPau1gHZcu217ZydFGh0WlvFse40SayEQQZn5QT?=
 =?us-ascii?Q?J6b9jNdaibxT+WaVEkUayaNSrf228Ilbeb4qAWopgdKKEqOTaPFKLZCyMctl?=
 =?us-ascii?Q?MQJvThR5xxbfvL9HKJQcJacsqt4f82YbKyj9uQgrEAZpC5uM1dC+e/DXt7Xc?=
 =?us-ascii?Q?Jr/7wz05vMPaKuaBIFuwDA9C6t5CWDLBfEVOMfNI5oIG7AWH0WnUv1S7mud8?=
 =?us-ascii?Q?Xnuxgb4UJgwqe0u4lrAIkshV+bTXGNEP2T0br7bx6yDbbhWvxBffSaAOOHa2?=
 =?us-ascii?Q?jmjxlTaEaDMTUCXm0+slHEFloA8ytwdvkXviV/ggwwnSiPurg5JmYtYg5UPf?=
 =?us-ascii?Q?AGVW/zRPlqx+RjMsVtFnwCHmGC0GRNN7VRdyoQ1KMAufrE3PYF2N0SjZTc9b?=
 =?us-ascii?Q?EHaEt9BApXMwjjzCFrND95SBMf5O+9OyegPSIgOEyxMljPZPKGAxM/nmFvZ1?=
 =?us-ascii?Q?G022gQ1FAZqq0zDMj0L7iCLroOwzSvEL69ZRPqlTawC45kH7w2fAOk/FYbF6?=
 =?us-ascii?Q?CsIErH9BbdTHWYTZYRpkwMwkZcSJR+0x/Bu+CL7ZW6vJ6hRBRme1aCH6M5UC?=
 =?us-ascii?Q?2oQb9ngNbZmhJriw5hrgqOA27pqVeuEb2dz/zwmRjG2fnDk2kDE+Go4RKLkm?=
 =?us-ascii?Q?3pe4cGoquoMk8gcA1Zn6oVCwSA08zm0SIHH04a9JrXz2t4VdHmsY4j/Z7Cw6?=
 =?us-ascii?Q?4/nfLHzb1KNoMz9a2XANogf9Yft6hdEW/0zTZ0PP+4EKmNSGjBxjAYbnuov7?=
 =?us-ascii?Q?4znN5GhAjyQTafexJut820kw9UoPzoBML/UM+5EjlCbUW16LJsSyMT1S78Q6?=
 =?us-ascii?Q?i1Kxwkp6aiq5Kyucu8vKiFI/+WzTO/kORjc4E7igPm2cFarYY6CCrOQQQLwc?=
 =?us-ascii?Q?zLakgvtVEDZfxosvuRTp438NYMHNCNhv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DMOLcxh5W2kthM89/b48ShMfByEmY5CYkh3iX9YHlAbwr4bq4DQwQPnUHKYP?=
 =?us-ascii?Q?6FpQXYgd7/Lp97nSUDwJZEobu3Ph2sEfztgrTD3F2M9IoBdmv3ZSkSPgDS/J?=
 =?us-ascii?Q?dlulaQG/gpJfUUbxj8Swm2UppvC0cQVV6ZslKUkRz49xCbnojldN5jhRZf9O?=
 =?us-ascii?Q?imDUZdLUOkuZUvXc0RSMxfaNCFO+1p9W05b3NlVRBlYK9Sb+xmHoVZ5npU9U?=
 =?us-ascii?Q?YtjMSXyHeZPvDhqL5c6s/L2lT683Go5sassn6lHpnTAZAAd73oM7hAZYVTIT?=
 =?us-ascii?Q?MSb6gGpF0yvWN2SRMg6bQeGjU5RS6BvQj8fakwHooC/LOTG8gb3Tim8Vd4Fj?=
 =?us-ascii?Q?DT37qffwpqeZ9TRuO4bm8Y2r2HT79a7uLBviLVUD8OqEscXAMum/8japAjN7?=
 =?us-ascii?Q?j1mcP2JlGPNcelfqOQML8oYkI+Ad627DuevXLtCbCHAUUxFZAzRStwmGo//q?=
 =?us-ascii?Q?vO3M1fLwvDFV8MCuTgm8IwXNoVZzAXUCwIf7dao8iGPcNXUjnNHFM+JZpj/v?=
 =?us-ascii?Q?gkWJt9atAhmChXEhVzedayWf+G8tEPmmUYDpc9HUwWQbePqF22utVHoscIFE?=
 =?us-ascii?Q?InaEtPBvuo4iyuYdC3+TU5rihAuQEemO5JzJLlitOCMn8rsXWmP2CGzVvP5U?=
 =?us-ascii?Q?2ObbkWyL92KxksX04n67ultAIKLLuSBGVWpbjU8r5nFCfcF5NUtxlpy2BLuq?=
 =?us-ascii?Q?UfBgVWKMcFGyF6GhwajMURj3yvLpdHwn0dGJhrSUrYUsRLnIgayeutZf4r3S?=
 =?us-ascii?Q?GXOV4fFr7/lkdbJpdOs3daolEitQlMnvkMCzYKJVYbaAagZeusY6N4aWAeu6?=
 =?us-ascii?Q?OIPexXCYscKMHP26X0x8madcMH/py6UQWMjigkHFxNGHkPAyf/atbongl4av?=
 =?us-ascii?Q?dgs492g7S+QkWYpPqdY98J4AodcrjrBCmFxGvYiKwGzvoJRm7OaS46hy4UI2?=
 =?us-ascii?Q?FjRKW2/+BJbOJ/BaYCg9+gAhg3Rw5vBtnn1xJO5eo74PDYDdbA3u/6PxVV2i?=
 =?us-ascii?Q?MWj1vvL5pxJ0RwGkN03/MnINiDvLSw3V70qZnlX59owLGHvVU+i0H3AnLCbT?=
 =?us-ascii?Q?eg58uMzx2qQAGqhsgttmizP9WwwoUudtIogRkHtVp44CiS85x9uE3kUgbkGZ?=
 =?us-ascii?Q?1CNsqQ1ZGJPlr9B+XRM2eGnhyCn86ShXEJ6YsViVqLXyq66IHVLNJaMZJGPH?=
 =?us-ascii?Q?wADuz0vk82pbfE5PVSqFmtvHM8Jmx51Kozv68W07J9h7IhFRr4kpbD+C8C7S?=
 =?us-ascii?Q?lolTfBhCXqpe+tPAs/TdL9gcbLMrMz3Fez4Y+zGH6D7oFJhRrKThFKOWNFJQ?=
 =?us-ascii?Q?vYf4T1h/eFOjpQuum7q08/tRLEUnKuRKDi3VXxgqpPwK0U0ucmkJUFE1+ZkY?=
 =?us-ascii?Q?WrkBDLhTgxh9tcD79M211Cm3JWBbnkDziFFrRAzjF43Ekh+aV/8aiyJPd4ew?=
 =?us-ascii?Q?4u6Z0GnxTadFIkwChLhlja3FAdUslJLSCQcXg1kG19g4mBG+IUOBBG4SQymD?=
 =?us-ascii?Q?v3dymNAuQXBcDTg4BGwWuD0QB9CRU+KZovvG/VlYKefQQYervb6llJ9o2NSb?=
 =?us-ascii?Q?OOXvl1EKrltlvkXoSHP6VA1VTFkOva3zuQYMoD91?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7cd483-8e2a-41b3-b69a-08dd5bca4f56
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:44:23.1112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3fGKn4H4EStO9drQxRFtaQiSfXAZFohLlb37F/7hWUyVmmxpLuGrOvTjzDl+08MIEGXjkbDTp+PbqtzDWmSWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7019

Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor

The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an active array size
of 2592 x 1944.
    
The following features are supported for OX05B1S:
   - Manual exposure an gain control support
   - vblank/hblank control support
Supported resolution:
   - 2592 x 1944 @ 30fps (SGRBG10)

Support for another sensor, OS08A20, is added as a separate patch, using another compatible.
For OS08a20, HDR mode control is supported, with one HDR mode: staggered HDR with 2 exposures on separate virtual channels. However, for now, only one exposure (VC 0) is accessible via get_frame_desc.

Supported resolutions:
   - 1920 x 1080 @ 60fps (SBGGR10, no HDR)
   - 1920 x 1080 @ 30fps (SBGGR10, HDR)
   - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
   - 3840 x 2160 @ 15fps (SBGGR12, HDR)
   - 3840 x 2160 @ 30fps (SBGGR10, no HDR)
   - 3840 x 2160 @ 15fps (SBGGR10, HDR)

The driver was tested on upstream 6.14-rc2 on imx8mp-evk, but also on nxp tree based on 6.12 on imx95-19x19-evk.

The results of v4l2-compliance test:

root@imx8mpevk:/unit_tests# ./v4l2-compliance -d /dev/video0
v4l2-compliance 1.29.0-5342, 64 bits, 64-bit time_t
v4l2-compliance SHA: 0b852765266e 2025-03-04 11:39:48

Compliance test for mxc-isi device /dev/video0:

Driver Info:
	Driver name      : mxc-isi
	Card type        : mxc-isi-cap
	Bus info         : platform:32e00000.isi
	Driver version   : 6.14.0
	Capabilities     : 0xa4201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mxc-isi
	Model            : FSL Capture Media Device
	Serial           : 
	Bus info         : platform:32e00000.isi
	Media version    : 6.14.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000a (10)
	Name             : mxc_isi.0.capture
	Function         : V4L2 I/O
	Pad 0x0100000b   : 0: Sink
	  Link 0x0200000e: from remote pad 0x1000009 of entity 'mxc_isi.0' (Video Pixel Formatter): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 4 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for mxc-isi device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0


Mirela Rabulea (4):
  dt-bindings: media: i2c: Add OX05B1S sensor
  media: ox05b1s: Add omnivision OX05B1S raw sensor driver
  MAINTAINERS: Add entry for OX05B1S sensor driver
  media: ox05b1s: Add support for Omnivision OS08A20 raw sensor

 .../bindings/media/i2c/ovti,ox05b1s.yaml      |  119 ++
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |    1 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ox05b1s/Kconfig             |   10 +
 drivers/media/i2c/ox05b1s/Makefile            |    2 +
 drivers/media/i2c/ox05b1s/ox05b1s.h           |   26 +
 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c      | 1136 +++++++++++++++++
 drivers/media/i2c/ox05b1s/ox05b1s_modes.c     |  187 +++
 9 files changed, 1492 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
 create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
 create mode 100644 drivers/media/i2c/ox05b1s/Makefile
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c

-- 
2.25.1


