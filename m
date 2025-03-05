Return-Path: <linux-media+bounces-27571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6119CA4FA82
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21C0618924B7
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C07205E21;
	Wed,  5 Mar 2025 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TSFb9AVs"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9C020550B;
	Wed,  5 Mar 2025 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167874; cv=fail; b=l/vORHux40KlMhVfQE5D1n1TDpZcQWNa/G1Xs2ecI3O5I+n0SXxnFlrCyyqZAU6nKqulQm2VnCXQBOEtZt4UJCGvMy1aplaomIzGy0cNvvxtQVRgi0xGYmior1PTFfCuclsU1ksL6LcW0x45YuGHw6bh8zS1uu4+43LhbZEXsco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167874; c=relaxed/simple;
	bh=32+AoM0MMugXR+uUiyT8tZ3oEGU2UUcg71nTF0FmFoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IEvdW8hG8L3fK5CljJgAq3qfcov+ZWqwAkEHwamVxafRccpRDTA/l5wMyHHj/sPu+RnVdwKq6UxIH+ISniglS3DeAGcNpkgM2r5IHtH0DXPbgFZ5O8Ioyov7LLC1gV/O08giMiUCaaamdATbVC5bU1RDOeGaKfhMWpWaCO+EMGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TSFb9AVs; arc=fail smtp.client-ip=40.107.20.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXG/9XYvzfd9tJAhT2vo2tg6tKHVZMPyfhzTcNJD8TiIcwrO1s/xHSYXmxv9V2imhIRONJrBQC1H4OsjVK2GSoFzmcVCgj8hksnPWP4I1HwRJEfKnO3/3krA5BR8nku2EQChAledORcHJYHD8h+I8wu8SP0zE1z6b2Mqf0pqHG6U0RzHr0ALPMX6G61iQT4+TffGYpXLOBUTeKbyriHWNWQQas1TcX5IT15bA6B+YejsNub4gY1ltZ9dktKfz3WXuXl8XJcvA0kMIQjdE1lYbO9uRJLP4u5294dQPkGrIhNbism4Q3sph27w5tyJuY1YbN+legCkR2UKZrvOzffThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxFnatKXiLI8qCxQz3BKdz38DFyYjZ+GYT4T6CJy6bs=;
 b=e4uwFa3gysSY29coqlQH/o21DEmcoRAr/B9OrI1vnteZci1HIgKCc2kfrO4FDURqzJkSHGgHe9+0fEN+5KNTue+g48s3RzdgSoWAkdFZugH/K2b7eyeDaqJuulsGcUMaO8LqJwAz8BaQGsD6tLSpON15rr4Htzopq5DLDW+cVlW5jZ8FmovKXU0+57/aEkYexEIuUh3B877un6TYm1KJGI2D/wya1eo+63vJ6wUMKBK2EmsnBueIanIRbOMAHB1k4fToMDGr5Jv7HBMYEC+CEe8DSK0K62Hrrd0z8IAb/LuUA82iDmzExJhcx7P5bZgK3TNXiy01gTI9df4pO/daVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxFnatKXiLI8qCxQz3BKdz38DFyYjZ+GYT4T6CJy6bs=;
 b=TSFb9AVsztrR153O2ysSUxGB2Sku2FcdmdRRK8NTOZn8WZTbhfuHbK6HE8CVKLRmemtZNdK4+zIFv2fJQTNZRDTaVr/aqEyH5JPcTPT5z6kFizAkP8drCn3BDYFez9/sfRxbzAUShy2s46uZuV0o/2E9fr7R+GQb+1Izlkm1fIGWYu94WPA5L8M7mRtYw2JWJlVgAV0EEu9SKowewzCfrwuftD8ZRm8579HlnUz+WoiqwZ/sxfJp3mNUXGiax9C92+ifMT3m663utAlMtj/kpNYj/2pmdM5aOSj2PPTG3mfM2FpPzhPPBBprIoEZRsiG4rSa1JYIFpEwK6KK0r7ebg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM0PR04MB6945.eurprd04.prod.outlook.com (2603:10a6:208:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 09:44:27 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 09:44:27 +0000
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
Subject: [PATCH v4 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor driver
Date: Wed,  5 Mar 2025 11:43:57 +0200
Message-Id: <20250305094359.299895-3-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305094359.299895-1-mirela.rabulea@nxp.com>
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM0PR04MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c9f203-2f2b-4c94-0972-08dd5bca51ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mrywWlfLHLJcNfuErsvSEppWWY0akzBgNwXD3oOCCBlUs4Mhm1mOosk14BPU?=
 =?us-ascii?Q?URHSMD8OSaVQCHM/AZ7/40blNU02bX7H8JU1tZ0LjMcJqxsAvSOF7zC3Tn0w?=
 =?us-ascii?Q?159012wRik8x2fRIcE5mE1UoPfi9V34s+/9Fx7rGHsTUuOAmVmYmMrT1II28?=
 =?us-ascii?Q?TFRfNAmZiEKnIj28Zr4VsRSqNE3+paQg4nbri7gKALvymgUettUu0jPMh2pc?=
 =?us-ascii?Q?9MOvWv9tmzFfghRNgr5WTTH4gIQKueyw2dJkQFc8dVRrycfqnFiwap8A+M/q?=
 =?us-ascii?Q?2e+7ZHWmwHJYkCIRDqAYPAHEGCzVxtsZaekK/w0CqoyMEZ0Sr1p/71fK56ZV?=
 =?us-ascii?Q?B2e1ZsDz/gM42nbbSkNTdVUvZjgVB/5nxC0waDqiWYIFbiBXJ9bXCIQp6R5q?=
 =?us-ascii?Q?8cKF+g/bZ+FwyLvezxyMcE0pOXtM3dc4rboDVH73v093M6rI7AuBZzYRyFDw?=
 =?us-ascii?Q?Fwu3fUvQ5CW5eY5LOHPqLMV8I9N5aHwQR7w7kCkBB7bfQw7s+D53Ln/qpjmw?=
 =?us-ascii?Q?W3ogD1PQ1UyK1Dj68TIhUtXJ/Mn8BPytK+8Cp+vVWNxGiTeEs6zxx6q+3YAG?=
 =?us-ascii?Q?JGYSm0Bpi0Z/wpjomrVu6ok4+1zk+UN+HCWoSDhSRQmFT/EDSBSWZWS09oqh?=
 =?us-ascii?Q?MW+CWQKjQlG8HnUdAyOu4lNTCfziEWn2B6iGHa96KFVhtkdFCdGc9ptsEup9?=
 =?us-ascii?Q?19LfUSCQBO9ISF2vJvJDvyvR8PQj6CfA70JqkfypHQ2Vnm7jDiR7B42BDL5l?=
 =?us-ascii?Q?8sw756GTwTca1PNKn03otjvsS43ZP4su4P0R0USV3bttYz/HNQMh19wb+PiH?=
 =?us-ascii?Q?nIL8BbUGqfX8uVdABrnNrpYzQAqsTU08IhJH7Vx4FU1tDvQCFvrY7TkWdjJb?=
 =?us-ascii?Q?V6nU/Y5EnMDb0UTVonWnnH29MNiDsosxfrhwlGRSiC7LT2SEwK3bD1yxnc02?=
 =?us-ascii?Q?F+XP9itpLcHtFMg7QO/AXjF5sBxQTfFBQLpCFPJKVR8hiT2zSvIihEV5o6HO?=
 =?us-ascii?Q?vgIg3Q7HUUkBdcbGTUWwtYII37eBfE1Kg8hYFoRWxRfNRlo2P6QJp2732onR?=
 =?us-ascii?Q?OXTYU271yTu3RwYVenoTOmyfZ+DYJ8lxy8GcdC//S1INDlYkpI1e37od1fKt?=
 =?us-ascii?Q?YsaWCU48MwBHalyMsTKa1S3kg63Q59UKPNau32STdbe7cQOe4eJk9or0+yFu?=
 =?us-ascii?Q?ujv0DcaFeVGVmY1jPMcsZGD97ioRNlpkchWsZDk5N66wH29cvoAU/0I5UHRM?=
 =?us-ascii?Q?6Sriuq8M0qBf4Hw9bQQ5tz9XCxEetTwWARsj8wX+6hp+Mt1ZU4Nzolbioi/q?=
 =?us-ascii?Q?NOv74SLQzFsqA1WlYmdId8HqpxrTPs6eYMIs9Qsx/L0m8rmNFRKAkVE5HwrA?=
 =?us-ascii?Q?T3hdZj3bYt+XRxO5CimC4HmUbb5F4Q1d03YUWkGLJ0UZOkGXTfnrZnN26HTK?=
 =?us-ascii?Q?rS0umBPsg4i+XbLR97Z/PFm0ClUMz6f9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RxutOJAfreBHNSH/9GmpA5PuD9o0P/9i4E8xb2yZ6WQLFhp+2vTlhISzvtK8?=
 =?us-ascii?Q?7NXmU0IS7AoHlZTl4++VLHiylsj/bArz4GoBQVf4bQ0FdRU1QmD31pzuq9A+?=
 =?us-ascii?Q?SYkVng9Fm1P/MLWztdNjNa+yOdiAlU2wgURuD0Ex4ERkKhmPjRNcY1OPbW3x?=
 =?us-ascii?Q?wQOiSNcVUWpurOkFvVIo8uuWhy+6z1LLNFzwxzbAB70QmIjbLdU+rsXpfi0C?=
 =?us-ascii?Q?/BYgiD0JoskinGjIreKVCVBnX7tzKbcYSP6IIdPiHGzfZvU3riWkfRakiCYA?=
 =?us-ascii?Q?ww/7hvnGvx2bKVrAzTQt9cbxDXvYJbvdJRnhBDgdkClZuNq+gY8PNDg5aZyR?=
 =?us-ascii?Q?tVBvx3LpyTdxF6Xx+p5BnU6VQF8xBtIe/zgqdvTGxgNM0L+Gkmha2CLgrqI3?=
 =?us-ascii?Q?V65jPc8LDNj7+6geSGb8bmi7Nm9z5dCgWxcoZSN+nE/EnEgSusKrE55r2T7c?=
 =?us-ascii?Q?iYb/OKRj/JFceKPccPpMyfUDsIyPzv7JRdGGDd/uRAJ5uYcv1xdKiz3/gTic?=
 =?us-ascii?Q?2k1kdf6YVgAINAJ7X9GxIPWo44Kcy9XmIgu2HAKX3DqhXEDisipdKhdnbZZx?=
 =?us-ascii?Q?WGZdbW3N/GBzK54zNZ29VzkCvJRHCuiZCq8VzR/BltKJmAKkf7Zj1gRx4Ikc?=
 =?us-ascii?Q?IPdd3xn0biVp7apLvEvzoo/WD7dFd1NSTthlMDptDVlH8ApND42UrR02WTPx?=
 =?us-ascii?Q?yWimTHZlbfVEsATJC9Ifmp41gKxk1g2b2bPQDZvM/MfPGpZnNP1/qVZwYw8V?=
 =?us-ascii?Q?MQ9yN0Pe7QFQ5fNefLp3pP6N6WuHTfFVEq1Wnr4ugCu2BD6aEz2H1neWTYd9?=
 =?us-ascii?Q?u7hI32Q9EayLQpyLH7ocf3BhlS1eDritH/wriPpzLpjnLQnq3AHosmhl9Oyz?=
 =?us-ascii?Q?SRKjz4XLy9K1dJ7KUVbHbteba1oFUdVvfYZKJioCuIcgvtfLmBTu2cTKkxlL?=
 =?us-ascii?Q?CDmIfne9kR5NxyXqtyj3umfa+1Rvxoas3ZpX+nyL0bgSeECFUZ+P4DZlmC1C?=
 =?us-ascii?Q?tjIIgccQ8tVGlO/bQn36JZiVv08gjuw3t3CYz2p26ag9+giedVtLUY0AyzxF?=
 =?us-ascii?Q?2+BCJ4xnOtjdPJovLqaoI/YwiP0JDcgMg+S0eJuCyhVBT8rIpTXQ2FQQJtyi?=
 =?us-ascii?Q?pzUfHk7FVju7vx6O4syjTHorTxjlexl/6buI49uSva07BLcaLLSmxNcYsBWw?=
 =?us-ascii?Q?2X2xqSnQasBw4JOOCjUyrijwHPPvu9m2zWBlgfF99P9CznYDoIOzXadR8LWO?=
 =?us-ascii?Q?TGqNldiEyRyvKx/HfcNfNtS7x8rriPQ5zhwNI1Ezi6h2hVfO2FwZEnzeUb7g?=
 =?us-ascii?Q?xwCh1dBTpu4LRlOGjQwGr+PSZeJIwi2RxLgmo4LbloCMtqsvpJGnHzSdBdVY?=
 =?us-ascii?Q?dJhC3uRjCdB08OFKTN67kGPas+oJUIPL9zL+73T+6upCfxI6N2Oe9RCrEkS4?=
 =?us-ascii?Q?J7LB/f0bXy1FokwoGfLx2Hk/c2J+KIYVMo/aU2ln6vIMINGBRIPbBLvdB7du?=
 =?us-ascii?Q?vZ9m/MNw2LTf8cJmWKIUz6FNaj+uqFJn50Fwd0U3/l1xebRkZQDRTm5+lDhv?=
 =?us-ascii?Q?z76WEhCpJzdqhUcrs+o7kSi15ndGr/w33m3RRVua?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c9f203-2f2b-4c94-0972-08dd5bca51ba
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:44:27.3768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84DzASuLO15B+MCxAevuK6EtlGGVzVf5c42lKsW1CIrSAZ3m+Ubti3g0rep+upzQ+V/KW6Qic9QSmDo5wmYH2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6945

Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.

The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
active array size of 2592 x 1944.

The following features are supported for OX05B1S:
- Manual exposure an gain control support
- vblank/hblank control support
- Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v4:
	Switch to Y media bus codes. The CFA pattern control will be implemented when patches get merged, or maybe separatelly as RFC?
	Add pixel_rate member to mode struct, remove fps member. We do not have information how to calculate the pixel rate from the PLL parameters that can be made public.
	Use register macros for the registers that are documented. User register group macros, where individual registers are not documented
	Remove some uneeded local variable initialisations
	Fix extra/missing spaces
	Add missing ending \n
	Use return -ENODEV & return 0 to ease reading
	Rename retval to ret in probe for consistency
	Use devm_mutex_init instead of mutex_init
	Replace more dev_err's with dev_err_probe
	Constify more structs
	Remove some unneded ending commas after a terminator
	Fix smatch error in ox05b1s_s_ctrl: error: typename in expression
	Fix a seeries of smatch warnings like: warning: symbol 'ovx5b_init_setting_2592x1944' was not declared. Should it be static?
	Shorten some more lines to 80 columns

Changes in v3:
	Use helpers from v4l2-cci.h (drop ox05b1s_write_reg, ox05b1s_read_reg, ox05b1s_set_hts/vts/exp/analog_gain, ox05b1s_regmap_config)
	Don't hardcode timing registers: remove timing registers x_output_size/y_output_size from register configuration list, add them to ox05b1s_apply_current_mode
	Remove HTS,VTS from register config list as they are written by HBLANK and VBLANK controls through __v4l2_ctrl_handler_setup
	ox05b1s register config cleaning (remove all registers that were at their default value, and more, keep only what seems mandatory to be able to stream)
	Use const for ox05b1s_supported_modes
	Device should be silent on success, use dev_dbg.
	Drop unneeded {}
	Fixed an error introduced in v2 in ox05b1s_nearest_size (set_fmt for 4k BGGR12 mode was stuck)
	Fix an issue in ox05b1s_set_fmt, the format was saved in subdev state only for _TRY, save it also for _ACTIVE

Changes in v2:
	Use dev_err_probe for missing clock, since it is now required property, and use NULL for devm_clk_get (no name for single clock), remove check for non NULL sensor->sensor_clk
	Remove dev_err message for devm_regmap_init_i2c allocation error
	Added spaces inside brackets, wrap lines to 80
	Remove some redundant initializations
	Add regulators
	Make "sizes" a pointer
		Use struct v4l2_area instead of u32[2] array
		Remove the count for supported_modes[] and supported_codes[], instead use sentinel element at the end
		Consequently, update ox05b1s_enum_mbus_code, ox05b1s_enum_frame_size, ox05b1s_nearest_size, ox05b1s_find_code, to not use the count
	Remove .h files for modes, however did not move this code in the driver file but added a separate c file for all supported modes
	Refactor register lists to allow multiple register arrays per mode
	Use GPL-2.0-only instead of GPL-2.0

 drivers/media/i2c/Kconfig                 |   1 +
 drivers/media/i2c/Makefile                |   1 +
 drivers/media/i2c/ox05b1s/Kconfig         |  10 +
 drivers/media/i2c/ox05b1s/Makefile        |   2 +
 drivers/media/i2c/ox05b1s/ox05b1s.h       |  22 +
 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c  | 951 ++++++++++++++++++++++
 drivers/media/i2c/ox05b1s/ox05b1s_modes.c |  77 ++
 7 files changed, 1064 insertions(+)
 create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
 create mode 100644 drivers/media/i2c/ox05b1s/Makefile
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 8ba096b8ebca..5cda062c0463 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -700,6 +700,7 @@ config VIDEO_VGXY61
 
 source "drivers/media/i2c/ccs/Kconfig"
 source "drivers/media/i2c/et8ek8/Kconfig"
+source "drivers/media/i2c/ox05b1s/Kconfig"
 
 endif
 
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index fbb988bd067a..028eb08e648c 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -114,6 +114,7 @@ obj-$(CONFIG_VIDEO_OV9282) += ov9282.o
 obj-$(CONFIG_VIDEO_OV9640) += ov9640.o
 obj-$(CONFIG_VIDEO_OV9650) += ov9650.o
 obj-$(CONFIG_VIDEO_OV9734) += ov9734.o
+obj-$(CONFIG_VIDEO_OX05B1S) += ox05b1s/
 obj-$(CONFIG_VIDEO_RDACM20) += rdacm20.o
 obj-$(CONFIG_VIDEO_RDACM21) += rdacm21.o
 obj-$(CONFIG_VIDEO_RJ54N1) += rj54n1cb0c.o
diff --git a/drivers/media/i2c/ox05b1s/Kconfig b/drivers/media/i2c/ox05b1s/Kconfig
new file mode 100644
index 000000000000..48fcd04b20d5
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/Kconfig
@@ -0,0 +1,10 @@
+config VIDEO_OX05B1S
+	tristate "OmniVision raw sensor support OX05B1S"
+	depends on OF
+	depends on GPIOLIB
+	select REGMAP_I2C
+	help
+	  This is a Video4Linux2 sensor driver for the Omnivision OX05B1S RGB-IR sensor.
+	  This is a 1/2.5-Inch CMOS image sensor with an active array size of 2592 x 1944.
+	  It is programmable through I2C interface.
+	  The output is on MIPI CSI-2 interface.
diff --git a/drivers/media/i2c/ox05b1s/Makefile b/drivers/media/i2c/ox05b1s/Makefile
new file mode 100644
index 000000000000..0b38dbf98bcd
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/Makefile
@@ -0,0 +1,2 @@
+ox05b1s-objs := ox05b1s_modes.o ox05b1s_mipi.o
+obj-$(CONFIG_VIDEO_OX05B1S) += ox05b1s.o
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s.h b/drivers/media/i2c/ox05b1s/ox05b1s.h
new file mode 100644
index 000000000000..2a87d69864f9
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/ox05b1s.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024, NXP
+ */
+
+#ifndef OX05B1S_H
+#define OX05B1S_H
+
+#include <linux/types.h>
+
+struct ox05b1s_reg {
+	u32 addr;
+	u32 data;
+};
+
+struct ox05b1s_reglist {
+	const struct ox05b1s_reg *regs;
+};
+
+extern const struct ox05b1s_reglist ox05b1s_reglist_2592x1944[];
+
+#endif /* OX05B1S_H */
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
new file mode 100644
index 000000000000..1026216ddd5b
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
@@ -0,0 +1,951 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * A V4L2 driver for Omnivision OX05B1S RGB-IR camera.
+ * Copyright (C) 2024, NXP
+ *
+ * Inspired from Sony imx219, imx290, imx214 and imx334 camera drivers
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <media/v4l2-cci.h>
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#include "ox05b1s.h"
+
+#define OX05B1S_SENS_PAD_SOURCE	0
+#define OX05B1S_SENS_PADS_NUM	1
+
+#define OX05B1S_REG_SW_STB		CCI_REG8(0x0100)
+#define OX05B1S_REG_SW_RST		CCI_REG8(0x0103)
+#define OX05B1S_REG_CHIP_ID		CCI_REG24(0x300a)
+#define OX05B1S_REG_TIMING_HTS		CCI_REG16(0x380c)
+#define OX05B1S_REG_TIMING_VTS		CCI_REG16(0x380e)
+#define OX05B1S_REG_EXPOSURE		CCI_REG16(0x3501)
+#define OX05B1S_REG_GAIN		CCI_REG16(0x3508)
+#define OX05B1S_REG_X_OUTPUT_SIZE	CCI_REG16(0x3808)
+#define OX05B1S_REG_Y_OUTPUT_SIZE	CCI_REG16(0x380a)
+
+#define client_to_ox05b1s(client)\
+	container_of(i2c_get_clientdata(client), struct ox05b1s, subdev)
+
+struct ox05b1s_sizes {
+	u32	code;
+	const struct v4l2_area *sizes;
+};
+
+struct ox05b1s_plat_data {
+	char				name[20];
+	u32				chip_id;
+	u32				native_width;
+	u32				native_height;
+	u32				active_top;
+	u32				active_left;
+	u32				active_width;
+	u32				active_height;
+	const struct ox05b1s_mode	*supported_modes;
+	u32				default_mode_index;
+	const struct ox05b1s_sizes	*supported_codes;
+};
+
+struct ox05b1s_ctrls {
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *gain;
+	struct v4l2_ctrl *exposure;
+};
+
+struct ox05b1s_mode {
+	u32 index;
+	u32 width;
+	u32 height;
+	u32 code;
+	u32 bpp;
+	u32 vts; /* default VTS */
+	u32 hts; /* default HTS */
+	u32 exp; /* max exposure */
+	bool h_bin; /* horizontal binning */
+	s64 pixel_rate;
+	const struct ox05b1s_reglist *reg_data;
+};
+
+/* regulator supplies */
+static const char * const ox05b1s_supply_name[] = {
+	"AVDD",  /* Analog voltage supply, 2.8 volts */
+	"DVDD",  /* Digital I/O voltage supply, 1.8 volts */
+	"DOVDD", /* Digital voltage supply, 1.2 volts */
+};
+
+#define OX05B1S_NUM_SUPPLIES ARRAY_SIZE(ox05b1s_supply_name)
+
+struct ox05b1s {
+	struct i2c_client *i2c_client;
+	struct regmap *regmap;
+	struct gpio_desc *rst_gpio;
+	struct regulator_bulk_data supplies[OX05B1S_NUM_SUPPLIES];
+	struct clk *sensor_clk;
+	const struct ox05b1s_plat_data *model;
+	struct v4l2_subdev subdev;
+	struct media_pad pads[OX05B1S_SENS_PADS_NUM];
+	const struct ox05b1s_mode *mode;
+	struct mutex lock; /* sensor lock */
+	u32 stream_status;
+	struct ox05b1s_ctrls ctrls;
+};
+
+#define OX05B1S_PIXEL_RATE_48M	48000000
+static const struct ox05b1s_mode ox05b1s_supported_modes[] = {
+	{
+		/* 5Mp GRBG10, 30fps */
+		.index		= 0,
+		.width		= 2592,
+		.height		= 1944,
+		.code		= MEDIA_BUS_FMT_Y10_1X10,
+		.bpp		= 10,
+		.vts		= 0x850,
+		.hts		= 0x2f0,
+		.exp		= 0x850 - 8,
+		.h_bin		= false,
+		.pixel_rate	= OX05B1S_PIXEL_RATE_48M,
+		.reg_data	= ox05b1s_reglist_2592x1944,
+	}, {
+		/* sentinel */
+	}
+};
+
+/* keep in sync with ox05b1s_supported_modes */
+static const struct v4l2_area ox05b1s_sgrbg10_sizes[] = {
+	{
+		.width = 2592,
+		.height = 1944,
+	}, {
+		/* sentinel */
+	}
+};
+
+static const struct ox05b1s_sizes ox05b1s_supported_codes[] = {
+	{
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.sizes = ox05b1s_sgrbg10_sizes,
+	}, {
+		/* sentinel */
+	}
+};
+
+static int ox05b1s_power_on(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
+	if (ret) {
+		dev_err(dev, "Failed to enable regulators\n");
+		return ret;
+	}
+
+	/* get out of powerdown and reset */
+	gpiod_set_value_cansleep(sensor->rst_gpio, 0);
+
+	ret = clk_prepare_enable(sensor->sensor_clk);
+	if (ret < 0) {
+		dev_err(dev, "Enable sensor clk fail ret=%d\n", ret);
+		goto reg_off;
+	}
+
+	/* with XVCLK@24MHz, t2 = 6ms before first ox05b1s SCCB transaction */
+	fsleep(6000);
+
+	return 0;
+
+reg_off:
+	regulator_bulk_disable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
+
+	return ret;
+}
+
+static int ox05b1s_power_off(struct ox05b1s *sensor)
+{
+	gpiod_set_value_cansleep(sensor->rst_gpio, 1);
+
+	/* XVCLK must be active for 512 cycles after last SCCB transaction */
+	fsleep(350); /* 512 cycles = 0.34 ms at 24MHz */
+	clk_disable_unprepare(sensor->sensor_clk);
+
+	regulator_bulk_disable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
+
+	return 0;
+}
+
+static int ox05b1s_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+
+	return ox05b1s_power_off(sensor);
+}
+
+static int ox05b1s_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+
+	return ox05b1s_power_on(sensor);
+}
+
+#define OX05B1S_MAX_REG_BULK 16
+static int ox05b1s_write_reg_array(struct ox05b1s *sensor,
+				   const struct ox05b1s_reg *reg_array)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	const struct ox05b1s_reg *table = reg_array;
+	u8 vals[OX05B1S_MAX_REG_BULK];
+	int i;
+	int ret;
+
+	while (table->addr) {
+		for (i = 0; i < OX05B1S_MAX_REG_BULK; i++) {
+			if (table[i].addr != (table[0].addr + i))
+				break;
+			vals[i] = table[i].data;
+		}
+		ret = regmap_bulk_write(sensor->regmap, table->addr, vals, i);
+		if (ret) {
+			dev_err(dev, "Failed to write reg addr=%x, count %d\n",
+				table->addr, i);
+			return ret;
+		}
+		table += i;
+	}
+
+	return 0;
+}
+
+static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
+{
+	return &container_of(ctrl->handler, struct ox05b1s,
+			     ctrls.handler)->subdev;
+}
+
+static int ox05b1s_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	u32 w = sensor->mode->width;
+	u32 h = sensor->mode->height;
+	int ret = 0;
+	u32 hts;
+
+	/* apply V4L2 controls values only if power is already up */
+	if (!pm_runtime_get_if_in_use(&client->dev))
+		return 0;
+
+	/* s_ctrl holds sensor lock */
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		ret = cci_write(sensor->regmap, OX05B1S_REG_TIMING_VTS,
+				h + ctrl->val, NULL);
+		break;
+	case V4L2_CID_HBLANK:
+		hts = (sensor->mode->h_bin) ?
+			  w + ctrl->val : (w + ctrl->val) / 2;
+		ret = cci_write(sensor->regmap, OX05B1S_REG_TIMING_HTS,
+				hts, NULL);
+		break;
+	case V4L2_CID_PIXEL_RATE:
+		/* Read-only, but we adjust it based on mode. */
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(sensor->regmap, OX05B1S_REG_GAIN,
+				ctrl->val, NULL);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(sensor->regmap, OX05B1S_REG_EXPOSURE,
+				ctrl->val, NULL);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(&client->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops ox05b1s_ctrl_ops = {
+	.s_ctrl = ox05b1s_s_ctrl,
+};
+
+/*
+ * MIPI CSI-2 link frequencies.
+ * link_freq = (pixel_rate * bpp) / (2 * data_lanes)
+ */
+static const s64 ox05b1s_csi2_link_freqs[] = {
+	200000000
+};
+
+/* Link freq for default mode: 1080p RAW10, 4 data lanes 800 Mbps/lane. */
+#define OX05B1S_DEFAULT_LINK_FREQ	0
+
+static int ox05b1s_init_controls(struct ox05b1s *sensor)
+{
+	const struct v4l2_ctrl_ops *ops = &ox05b1s_ctrl_ops;
+	struct ox05b1s_ctrls *ctrls = &sensor->ctrls;
+	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	struct device *dev = &sensor->i2c_client->dev;
+	struct v4l2_fwnode_device_properties props;
+	int ret;
+
+	v4l2_ctrl_handler_init(hdl, 7);
+
+	/* we can use our own mutex for the ctrl lock */
+	hdl->lock = &sensor->lock;
+
+	/* Clock related controls */
+	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops,
+						  V4L2_CID_LINK_FREQ,
+						  ARRAY_SIZE(ox05b1s_csi2_link_freqs) - 1,
+						  OX05B1S_DEFAULT_LINK_FREQ,
+						  ox05b1s_csi2_link_freqs);
+
+	/* mode dependent, actual range set in ox05b1s_update_controls */
+	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
+					      0, 0, 1, 0);
+
+	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
+					  0, 0, 1, 0);
+
+	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
+					  0, 0, 1, 0);
+
+	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
+					    0, 0, 1, 0);
+
+	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
+					0, 0xFFFF, 1, 0x80);
+
+	if (hdl->error) {
+		ret = hdl->error;
+		goto free_ctrls;
+	}
+
+	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ret = v4l2_fwnode_device_parse(dev, &props);
+	if (ret)
+		goto free_ctrls;
+
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
+	if (ret)
+		goto free_ctrls;
+
+	sensor->subdev.ctrl_handler = hdl;
+	return 0;
+
+free_ctrls:
+	dev_err(dev, "Failed to init controls\n");
+	v4l2_ctrl_handler_free(hdl);
+	return ret;
+}
+
+static int ox05b1s_apply_current_mode(struct ox05b1s *sensor);
+
+static int ox05b1s_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	int ret;
+
+	if (enable) {
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
+			return ret;
+		ret = ox05b1s_apply_current_mode(sensor);
+		if (!ret)
+			ret = cci_write(sensor->regmap, OX05B1S_REG_SW_STB,
+					0x01, NULL);
+	} else {
+		ret = cci_write(sensor->regmap, OX05B1S_REG_SW_STB, 0x00, NULL);
+	}
+
+	sensor->stream_status = enable;
+
+	if (!enable || ret) {
+		pm_runtime_mark_last_busy(&sensor->i2c_client->dev);
+		pm_runtime_put_autosuspend(&client->dev);
+	}
+
+	return 0;
+}
+
+static void ox05b1s_update_pad_format(struct ox05b1s *sensor,
+				      const struct ox05b1s_mode *mode,
+				      struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->code = mode->code;
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+}
+
+static int ox05b1s_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	struct v4l2_mbus_framefmt *format;
+
+	/* Initialize the format. */
+	format = v4l2_subdev_state_get_format(state, 0);
+	ox05b1s_update_pad_format(sensor, &sensor->model->supported_modes[0],
+				  format);
+
+	return 0;
+}
+
+static int ox05b1s_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	const struct ox05b1s_sizes *supported_codes = sensor->model->supported_codes;
+	int i = 0;
+
+	while (i++ < code->index && supported_codes->code)
+		supported_codes++;
+	if (!supported_codes->code) /* code->index outside supported_codes[] */
+		return -EINVAL;
+
+	code->code = supported_codes->code;
+
+	return 0;
+}
+
+static int ox05b1s_enum_frame_size(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	const struct ox05b1s_sizes *supported_codes = sensor->model->supported_codes;
+	const struct v4l2_area *sizes;
+	int i = 0;
+
+	if (fse->pad != 0)
+		return -EINVAL;
+
+	while (supported_codes->code) {
+		if (supported_codes->code == fse->code)
+			break;
+		supported_codes++;
+	}
+
+	if (!supported_codes->code) /* fse->code not in supported_codes[] */
+		return -EINVAL;
+
+	sizes = supported_codes->sizes;
+	while (i++ < fse->index && sizes->width)
+		sizes++;
+	if (!sizes->width) /* fse->index outside sizes[] */
+		return -EINVAL;
+
+	fse->min_width = sizes->width;
+	fse->max_width = fse->min_width;
+	fse->min_height = sizes->height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+/* Update control ranges based on current streaming mode, needs sensor lock */
+static int ox05b1s_update_controls(struct ox05b1s *sensor)
+{
+	int ret;
+	struct device *dev = &sensor->i2c_client->dev;
+	u32 hts = sensor->mode->hts;
+	u32 hblank;
+	u32 vts = sensor->mode->vts;
+	u32 vblank = vts - sensor->mode->height;
+	u64 pixel_rate = sensor->mode->pixel_rate;
+	u32 min_exp = 8;
+	u32 max_exp = vts - 8;
+
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.pixel_rate, pixel_rate,
+				       pixel_rate, 1, pixel_rate);
+	if (ret) {
+		dev_err(dev, "Modify range for pixel_rate %llu-%llu failed\n",
+			pixel_rate, pixel_rate);
+		goto out;
+	}
+
+	if (sensor->mode->h_bin)
+		hblank = hts - sensor->mode->width;
+	else
+		hblank = 2 * hts - sensor->mode->width;
+
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank,
+				       1, hblank);
+	if (ret) {
+		dev_err(dev, "Modify range for hblank %u-%u failed\n",
+			hblank, hblank);
+		goto out;
+	}
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.hblank,
+			   sensor->ctrls.hblank->default_value);
+
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.vblank, 0, vblank * 4,
+				       1, vblank);
+	if (ret) {
+		dev_err(dev, "Modify range for vblank %u-%u failed\n",
+			vblank, vblank);
+		goto out;
+	}
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank,
+			   sensor->ctrls.vblank->default_value);
+
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.exposure, min_exp, max_exp,
+				       1, max_exp / 2);
+	if (ret) {
+		dev_err(dev, "Modify range for exposure %u-%u failed\n",
+			min_exp, max_exp);
+		goto out;
+	}
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.exposure,
+			   sensor->ctrls.exposure->default_value);
+
+out:
+	return ret;
+}
+
+/* needs sensor lock and power on */
+static int ox05b1s_apply_current_mode(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	const struct ox05b1s_reglist *reg_data = sensor->mode->reg_data;
+	u32 w = sensor->mode->width;
+	u32 h = sensor->mode->height;
+	int ret;
+
+	cci_write(sensor->regmap, OX05B1S_REG_SW_RST, 0x01, &ret);
+
+	while (reg_data->regs) {
+		ret = ox05b1s_write_reg_array(sensor, reg_data->regs);
+		if (ret)
+			goto out;
+		reg_data++;
+	}
+
+	cci_write(sensor->regmap, OX05B1S_REG_X_OUTPUT_SIZE, w, &ret);
+	cci_write(sensor->regmap, OX05B1S_REG_Y_OUTPUT_SIZE, h, &ret);
+	if (ret)
+		goto out;
+
+	/* setup handler will write actual controls into sensor registers */
+	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
+
+out:
+	if (ret < 0)
+		dev_err(dev, "Failed to apply mode %dx%d,bpp=%d\n", w, h,
+			sensor->mode->bpp);
+
+	return ret;
+}
+
+/* similar with v4l2_find_nearest_size but filter for mbus code, needs sensor lock */
+static const struct ox05b1s_mode *ox05b1s_nearest_size(const struct ox05b1s_mode *supported_modes,
+						       struct v4l2_subdev_format *fmt)
+{
+	u32 err, min_error = U32_MAX;
+	const struct ox05b1s_mode *best = NULL;
+
+	if (!supported_modes)
+		return NULL;
+
+	for (; supported_modes->width; supported_modes++) {
+		const u32 w = supported_modes->width;
+		const u32 h = supported_modes->height;
+
+		if (supported_modes->code != fmt->format.code)
+			continue;
+
+		err = abs(w - fmt->format.width) + abs(h - fmt->format.height);
+		if (err > min_error)
+			continue;
+
+		min_error = err;
+		best = supported_modes;
+		if (!err)
+			break;
+	}
+
+	return best;
+}
+
+/* get a valid mbus code, either the requested one or the default one */
+static u32 ox05b1s_find_code(const struct ox05b1s_plat_data *model, u32 code)
+{
+	u32 found_code = 0;
+	const struct ox05b1s_sizes *supported_codes = model->supported_codes;
+
+	while (supported_codes->code) {
+		if (supported_codes->code == code) {
+			found_code = code;
+			break;
+		}
+		supported_codes++;
+	}
+
+	if (!supported_codes->code) /* code not in supported_codes[] */
+		found_code = supported_codes[model->default_mode_index].code;
+
+	return found_code;
+}
+
+static int ox05b1s_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state,
+			   struct v4l2_subdev_format *fmt)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	struct device *dev = &sensor->i2c_client->dev;
+	struct v4l2_mbus_framefmt *format;
+	const struct ox05b1s_mode *mode;
+
+	/* if no matching mbus code found, use the one from the default mode */
+	fmt->format.code = ox05b1s_find_code(sensor->model, fmt->format.code);
+	mode = ox05b1s_nearest_size(sensor->model->supported_modes, fmt);
+
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.field = V4L2_FIELD_NONE;
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	*format = fmt->format;
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	sensor->mode = mode;
+
+	/* update controls that depend on current mode */
+	ox05b1s_update_controls(sensor);
+
+	dev_dbg(dev, "Set mode index=%d, %d x %d, code=0x%x\n",
+		sensor->mode->index,
+		fmt->format.width, fmt->format.height, fmt->format.code);
+
+	return 0;
+}
+
+static u8 ox05b1s_code2dt(const u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_Y10_1X10:
+		return MIPI_CSI2_DT_RAW10;
+	default:
+		return MIPI_CSI2_DT_RAW10;
+	}
+}
+
+static int ox05b1s_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				  struct v4l2_mbus_frame_desc *fd)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	/* get sensor current code */
+	mutex_lock(&sensor->lock);
+	fd->entry[0].pixelcode = sensor->mode->code;
+	mutex_unlock(&sensor->lock);
+
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = ox05b1s_code2dt(fd->entry[0].pixelcode);
+
+	return 0;
+}
+
+static int ox05b1s_get_selection(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = sensor->model->native_width;
+		sel->r.height = sensor->model->native_height;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = sensor->model->active_top;
+		sel->r.left = sensor->model->active_left;
+		sel->r.width = sensor->model->active_width;
+		sel->r.height = sensor->model->active_height;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static const struct v4l2_subdev_video_ops ox05b1s_subdev_video_ops = {
+	.s_stream = ox05b1s_s_stream
+};
+
+static const struct v4l2_subdev_pad_ops ox05b1s_subdev_pad_ops = {
+	.set_fmt		= ox05b1s_set_fmt,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.get_frame_desc		= ox05b1s_get_frame_desc,
+	.enum_mbus_code		= ox05b1s_enum_mbus_code,
+	.enum_frame_size	= ox05b1s_enum_frame_size,
+	.get_selection		= ox05b1s_get_selection
+};
+
+static const struct v4l2_subdev_ops ox05b1s_subdev_ops = {
+	.video = &ox05b1s_subdev_video_ops,
+	.pad   = &ox05b1s_subdev_pad_ops
+};
+
+static const struct v4l2_subdev_internal_ops ox05b1s_internal_ops = {
+	.init_state = ox05b1s_init_state
+};
+
+static void ox05b1s_get_gpios(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+
+	sensor->rst_gpio = devm_gpiod_get_optional(dev, "reset",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->rst_gpio))
+		dev_warn(dev, "No sensor reset pin available\n");
+}
+
+static int ox05b1s_get_regulators(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	unsigned int i;
+
+	for (i = 0; i < OX05B1S_NUM_SUPPLIES; i++)
+		sensor->supplies[i].supply = ox05b1s_supply_name[i];
+
+	return devm_regulator_bulk_get(dev, OX05B1S_NUM_SUPPLIES,
+				       sensor->supplies);
+}
+
+static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	u64 chip_id;
+	char *camera_name;
+	int ret;
+
+	ret = cci_read(sensor->regmap, OX05B1S_REG_CHIP_ID, &chip_id, NULL);
+	if (ret) {
+		dev_err(dev, "Camera chip_id read error\n");
+		return -ENODEV;
+	}
+
+	switch (chip_id) {
+	case 0x580542:
+		camera_name = "ox05b1s";
+		break;
+	default:
+		camera_name = "unknown";
+		break;
+	}
+
+	if (chip_id == sensor->model->chip_id) {
+		dev_dbg(dev, "Camera %s detected, chip_id=%llx\n",
+			camera_name, chip_id);
+	} else {
+		dev_err(dev, "Detected %s camera (chip_id=%llx), but expected %s (chip_id=%x)\n",
+			camera_name, chip_id,
+			sensor->model->name, sensor->model->chip_id);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int ox05b1s_probe(struct i2c_client *client)
+{
+	int ret;
+	struct device *dev = &client->dev;
+	struct v4l2_subdev *sd;
+	struct ox05b1s *sensor;
+
+	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
+	if (!sensor)
+		return -ENOMEM;
+
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap))
+		return PTR_ERR(sensor->regmap);
+
+	sensor->i2c_client = client;
+
+	sensor->model = of_device_get_match_data(dev);
+
+	ox05b1s_get_gpios(sensor);
+
+	/* Get system clock, xvclk */
+	sensor->sensor_clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(sensor->sensor_clk))
+		return dev_err_probe(dev, PTR_ERR(sensor->sensor_clk),
+				     "Failed to get xvclk\n");
+
+	ret = ox05b1s_get_regulators(sensor);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
+	sd = &sensor->subdev;
+	v4l2_i2c_subdev_init(sd, client, &ox05b1s_subdev_ops);
+	sd->internal_ops = &ox05b1s_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->dev = &client->dev;
+	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	sensor->pads[OX05B1S_SENS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, OX05B1S_SENS_PADS_NUM,
+				     sensor->pads);
+	if (ret)
+		goto probe_out;
+
+	devm_mutex_init(dev, &sensor->lock);
+
+	ret = ox05b1s_init_controls(sensor);
+	if (ret)
+		goto probe_err_entity_cleanup;
+
+	/* power on manually */
+	ret = ox05b1s_power_on(sensor);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to power on\n");
+		goto probe_err_free_ctrls;
+	}
+
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_enable(dev);
+
+	ret = ox05b1s_read_chip_id(sensor);
+	if (ret)
+		goto probe_err_pm_runtime;
+
+	v4l2_i2c_subdev_set_name(sd, client, sensor->model->name, NULL);
+
+	/* Centrally managed subdev active state */
+	sd->state_lock = &sensor->lock;
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Subdev init error: %d\n", ret);
+		goto probe_err_pm_runtime;
+	}
+
+	ret = v4l2_async_register_subdev_sensor(sd);
+	if (ret < 0) {
+		dev_err_probe(&client->dev, ret,
+			      "Async register failed, ret=%d\n", ret);
+		goto probe_err_subdev_cleanup;
+	}
+
+	sensor->mode = &sensor->model->supported_modes[0];
+	ox05b1s_update_controls(sensor);
+
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+
+probe_err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+probe_err_pm_runtime:
+	pm_runtime_put_noidle(dev);
+	pm_runtime_disable(dev);
+	ox05b1s_runtime_suspend(dev);
+probe_err_free_ctrls:
+	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+probe_err_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+probe_out:
+	return ret;
+}
+
+static void ox05b1s_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	struct device *dev = &client->dev;
+
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		ox05b1s_runtime_suspend(dev);
+	pm_runtime_set_suspended(dev);
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ox05b1s_pm_ops, ox05b1s_runtime_suspend,
+				 ox05b1s_runtime_resume, NULL);
+
+static const struct ox05b1s_plat_data ox05b1s_data = {
+	.name			= "ox05b1s",
+	.chip_id		= 0x580542,
+	.native_width		= 2608, /* 8 dummy + 2592 active + 8 dummy */
+	.native_height		= 1960, /* 8 dummy + 1944 active + 8 dummy */
+	.active_top		= 8,
+	.active_left		= 8,
+	.active_width		= 2592,
+	.active_height		= 1944,
+	.supported_modes	= ox05b1s_supported_modes,
+	.default_mode_index	= 0,
+	.supported_codes	= ox05b1s_supported_codes
+};
+
+static const struct of_device_id ox05b1s_of_match[] = {
+	{
+		.compatible = "ovti,ox05b1s",
+		.data = &ox05b1s_data,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ox05b1s_of_match);
+
+static struct i2c_driver ox05b1s_i2c_driver = {
+	.driver = {
+		.name = "ox05b1s",
+		.pm = pm_ptr(&ox05b1s_pm_ops),
+		.of_match_table	= ox05b1s_of_match,
+	},
+	.probe	= ox05b1s_probe,
+	.remove = ox05b1s_remove
+};
+
+module_i2c_driver(ox05b1s_i2c_driver);
+MODULE_DESCRIPTION("Omnivision OX05B1S MIPI Camera Subdev Driver");
+MODULE_AUTHOR("Mirela Rabulea <mirela.rabulea@nxp.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
new file mode 100644
index 000000000000..9a1f3a89077c
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Register configurations for all sensor supported modes
+ * Copyright (C) 2024, NXP
+ * Copyright (C) 2024, Omnivision
+ * Copyright (C) 2024, Verisilicon
+ *
+ */
+
+#include <media/v4l2-cci.h>
+#include "ox05b1s.h"
+
+#define OX05B1S_REG_PLL1_CTRL_REG07	CCI_REG8(0x0307)
+#define OX05B1S_REG_PLL3_CTRL_REG4A	CCI_REG8(0x034a)
+#define OX05B1S_REG_PLL_MONITOR_REG0B	CCI_REG8(0x040b)
+#define OX05B1S_REG_PLL_MONITOR_REG0C	CCI_REG8(0x040c)
+#define OX05B1S_REG_SC_CMMN_REG09	CCI_REG8(0x3009)
+#define OX05B1S_REG_GROUP_HLD_REG19	CCI_REG8(0x3219)
+#define OX05B1S_REG_ANA_REG		CCI_REG8(0x3600)
+#define OX05B1S_REG_SENSOR_CTRL02	CCI_REG8(0x3702)
+#define OX05B1S_REG_TIMING_CTRL	CCI_REG8(0x3800)
+#define OX05B1S_REG_MIPI_CORE_REG02	CCI_REG8(0x4802)
+#define OX05B1S_REG_MIPI_CORE_REG1B	CCI_REG8(0x481b)
+#define OX05B1S_REG_PCLK_PERIOD		CCI_REG8(0x4837)
+
+/*
+ * Register configuration for Omnivision OX05B1S raw camera
+ * 2592X1944_30FPS_FULL_RGBIr 2592 1944
+ */
+static const struct ox05b1s_reg ovx5b_init_setting_2592x1944[] = {
+	{ 0x0107, 0x01 }, /* Reserved */
+	{ OX05B1S_REG_PLL1_CTRL_REG07, 0x02 },
+	{ OX05B1S_REG_PLL3_CTRL_REG4A, 0x05 },
+	{ OX05B1S_REG_PLL_MONITOR_REG0B, 0x5c },
+	{ OX05B1S_REG_PLL_MONITOR_REG0C, 0xcd },
+	{ OX05B1S_REG_SC_CMMN_REG09, 0x2e },
+	{ OX05B1S_REG_GROUP_HLD_REG19, 0x08 },
+	{ OX05B1S_REG_ANA_REG + 0x84, 0x6d },
+	{ OX05B1S_REG_ANA_REG + 0x85, 0x6d },
+	{ OX05B1S_REG_ANA_REG + 0x86, 0x6d },
+	{ OX05B1S_REG_ANA_REG + 0x87, 0x6d },
+	{ OX05B1S_REG_ANA_REG + 0x8c, 0x07 },
+	{ OX05B1S_REG_ANA_REG + 0x8d, 0x07 },
+	{ OX05B1S_REG_ANA_REG + 0x8e, 0x07 },
+	{ OX05B1S_REG_ANA_REG + 0x8f, 0x00 },
+	{ OX05B1S_REG_ANA_REG + 0x90, 0x04 },
+	{ OX05B1S_REG_ANA_REG + 0x91, 0x04 },
+	{ OX05B1S_REG_ANA_REG + 0x92, 0x04 },
+	{ OX05B1S_REG_ANA_REG + 0x93, 0x04 },
+	{ OX05B1S_REG_ANA_REG + 0x98, 0x00 },
+	{ OX05B1S_REG_ANA_REG + 0xa0, 0x05 },
+	{ OX05B1S_REG_ANA_REG + 0xa2, 0x16 },
+	{ OX05B1S_REG_ANA_REG + 0xa3, 0x03 },
+	{ OX05B1S_REG_ANA_REG + 0xa4, 0x07 },
+	{ OX05B1S_REG_ANA_REG + 0xa5, 0x24 },
+	{ OX05B1S_REG_ANA_REG + 0xe3, 0x09 },
+	{ OX05B1S_REG_SENSOR_CTRL02, 0x0a },
+	{ OX05B1S_REG_TIMING_CTRL + 0x21, 0x04 }, /* mirror */
+	{ OX05B1S_REG_TIMING_CTRL + 0x22, 0x10 },
+	{ OX05B1S_REG_TIMING_CTRL + 0x2b, 0x03 },
+	{ OX05B1S_REG_TIMING_CTRL + 0x66, 0x10 },
+	{ OX05B1S_REG_TIMING_CTRL + 0x6c, 0x46 },
+	{ OX05B1S_REG_TIMING_CTRL + 0x6d, 0x08 },
+	{ OX05B1S_REG_TIMING_CTRL + 0x6e, 0x7b },
+	{ OX05B1S_REG_MIPI_CORE_REG02, 0x00 },
+	{ OX05B1S_REG_MIPI_CORE_REG1B, 0x3c },
+	{ OX05B1S_REG_PCLK_PERIOD, 0x19 },
+	{ /* sentinel*/ }
+};
+
+const struct ox05b1s_reglist ox05b1s_reglist_2592x1944[] = {
+	{
+		.regs = ovx5b_init_setting_2592x1944
+	}, {
+		/* sentinel */
+	}
+};
-- 
2.25.1


