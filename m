Return-Path: <linux-media+bounces-27573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F7AA4FA88
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3361F3A9515
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4A92063ED;
	Wed,  5 Mar 2025 09:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X0+EGmBX"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C27205E37;
	Wed,  5 Mar 2025 09:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167879; cv=fail; b=gbVQR/aqOTYpohRncTiPMfTUpOXaEk3VfMp4gh6cMxZOm0qLOEJtcoNXKvC1m1EjT4AyOky4mvy0abHFaORHCIghBdW8ROLReFbCk4PPlxvz0q5KGevh0/zmNpbN27UXJmmlW6uicOxfUi8C+FxgqQIrXSBfJUkK0srbA4AIuWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167879; c=relaxed/simple;
	bh=xdQiYnmW+1jdYI0jrrwL8dhgU0rUxctuIcHw7b93Jzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r0ZU+0HqMgmSlsRTgHvtAI7qBbqGBdDpnywa8EicgkhX43PfemLvytx62e67IwR6ep1AT5ec4ywlTFzojhdludOlunNiVwvornKId47EUrNYlDShVocCJJmbm1SGD7kzeTyZIWRu7++PQvOvbyqW3DbHlkueSIaBOiz0blMEpLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X0+EGmBX; arc=fail smtp.client-ip=40.107.20.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5xZKQTodGW4PJAOXmE88y6ehYDSDkxuqwgKUvi/32PaOJnZc1lfIHPlMapLmKd532H2uK2eA7bC03Pfv2M9t+c8kHuNkGQBu8ZILqrGGy+7a/qkRhN1iqfy/iXvc+bN9drUNUWhryVlbvrtIEpQuY52ZjBdcYE/ztmPFWfh12ocgnvy0toC8HlhdjKH0aN9ZrIieYUePnveMQMvwiKBxk3eZwjBHtojg3cdd+WnLc4IU1Tk8PWwTrFmm6HeiRPwmxRxC+MJZt3mQ3nKYo7HMyPDx6aAlCRXDg1xrPsU8NfTNQEocmfHlft6tp1F6M2smYPULioVROnoL8VM7DoMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+qXry0OlSINWyyZfl3l9cH6iQdQxBxQQPHwBXGc3Dk=;
 b=uhITV2QhjXZ3NavWLXjnT0kFXq+k7+tplKhuSnngaDxVwhThTZDOOqXaTcqnul0hsO3wSjHOsCiI9RW0kc+BFs9tEdES4eBwDG2hsk5DP4jJ/MdsG9FeBVcex2p14c+WTVHWVx25WCjXxuiKLXvj6hXyIMGQ6ftKcQ6Oqev8KTcNc5ZuHqoKGF5qIvBb9+HSqy60Wb8ovscBGnpqCR6QPDBWsntG4/gTl4y4mGwEnSe2Y2RMYB9PkTQODWyUb6sBZ0xf8AytQaBAK2X2Akn9uAwljooFbJuGkgNJHFuuI1uar+gdvurLoCT3/1WmQDaCueQudzFBJ2ZXGoOlXxjudQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+qXry0OlSINWyyZfl3l9cH6iQdQxBxQQPHwBXGc3Dk=;
 b=X0+EGmBXmZD0ocPxDlW9vOZRE5ekOlYyvY13H2Ydi8viotM6iNtq0MOu2e5Jptu4kAtow8QX15053o6KC3wn2lqRBecmpJFvdXhiM5UDwC6K77YSHcMjK85aoMOpGqT87uVE+MkI8ktzPMtLeOYP+OiqIJIcZEJNix93i7V4Q+aJgkNLykq1/sNfzJJ/gc1mHoZDJJ3T4FtKxqTg9gRfyTjeG8kEipjSU69EaVxz9ntI1Erc//v89Z+iVLo+dT1WjsWQeMFQmPi1ZWwSpbxisIBcxxPUZd8/JLtt2RLJcI1Qmsvnce1+GBFEDdoGgrHEzvc9X/KxDb7n/EH2a9KOIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM0PR04MB6945.eurprd04.prod.outlook.com (2603:10a6:208:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 09:44:31 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 09:44:31 +0000
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
Subject: [PATCH v4 4/4] media: ox05b1s: Add support for Omnivision OS08A20 raw sensor
Date: Wed,  5 Mar 2025 11:43:59 +0200
Message-Id: <20250305094359.299895-5-mirela.rabulea@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: df9ac2c9-a32b-4664-086b-08dd5bca5402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UqT+eQLFzHXTyySyQwdmlFDefDN2B2Wef3D37dpNPoRK+HaqIuXUwksdHOII?=
 =?us-ascii?Q?rgIBu9LtlXT8x2IE/VzELqMZRkDlv1PdksvMXCWYOGSQaG18ZVhvu2YX/gJH?=
 =?us-ascii?Q?cmpTEy5JYQot5kZqUWLHfGajdZNnYb3Bo5TL+ZqW6vEggStCR/TIzex5awXe?=
 =?us-ascii?Q?AyUEtqc+m8V/ZrfiuaI00M0E2fuvTlIXy7i6Myrvfykuy93hnsA6LrflnSay?=
 =?us-ascii?Q?QKQsyPqaPxOS06MJ+9EW7smzb5WsCSRxfiitc43hs6fBT/QzKB+CmqtcCdA/?=
 =?us-ascii?Q?pwChML0fVnIL/cuMcHHKS37ZIsPENgVnkHAl4+6qaiUoAXzhXUbCFLBS9ej7?=
 =?us-ascii?Q?ylT6IfyC7nOU6TuGSJG/yqjM2FuZr9Vem3Zd52ZT+DTikbzhayM5yILpZWSS?=
 =?us-ascii?Q?2QH+cTd+YcblbbNZmB36WTggyU7F4CNGfuWQD7DXGXBBrPcE/QEJyXCzd4Jr?=
 =?us-ascii?Q?01VNHMphGQwonQ0josPV/fL5Gacw76xsfKKvjfxBJoogHioKJTKmbeJfwkZQ?=
 =?us-ascii?Q?Kj3+eqceGbnqtwcPqm46XeRlWWWaBXasT4Z4hW8XkJ41hhrrCWEfJnfAcLp5?=
 =?us-ascii?Q?AqUAAN6X4vuQvaqcXFbmu89KnN5tF3vHkatwyX318pe+iVnN9y4mKHq2GmTb?=
 =?us-ascii?Q?oijUw65VGwmxR4j5r28j2TTJvCnAGmThp92q3Nz2Dc40TfdU04bvZZZPglAA?=
 =?us-ascii?Q?9/RO3taPWd35mNVmFcEGOw3e/sNoVn8bssazHnecz2Y8Ste+djhp+WhPKzy6?=
 =?us-ascii?Q?xStKRww8ng900lcJjFURJ/IWxMuZsbhT6mrjNI4T8kB2+Nv36pV1yC+EBYfi?=
 =?us-ascii?Q?MHpTPr3tsm8T+YQ3fLkl1ih99AWOUZq+B/zYFmQJFKxHvOffGgTb+wFS+WHg?=
 =?us-ascii?Q?Z7d5uEPLUl77QKFzmQDrMfdTK5ApuAeCoPo33a4j3ll8AShgFNdPYGwUAOe1?=
 =?us-ascii?Q?jv88R/qiODWm8epDMnpbx4LDoK0wLrFhtAUu1Q2YMTO8W6ZVNkcbj7twiVSM?=
 =?us-ascii?Q?30AunHSa4jn/4mUi/7ZE/UhxVm7Ph3wWFkEYsi7a61r+aR4/kqFmkRM+As7m?=
 =?us-ascii?Q?A1TCAJAu82dVI2xXRDpXrUZ7P183mkqdt64qq3Cop4fTTzxvvgrwTKOP5LWH?=
 =?us-ascii?Q?lqaVS+xdhxVcjKPMsvNVL5RGL4BE4UWZ50n98qxXwQdM8mPyxSskL7Mj22Zo?=
 =?us-ascii?Q?+1QiCq4bOfbJn0XSkKPz2b4StCbS9UeMoMlxjTawzUa1UVyjo2FRzXD9+CV2?=
 =?us-ascii?Q?adIAr9OdIX0PSyXIWW+qxPiwxORVSNXBm2Na+eF/oqbBUvirLyNoMxl1QktO?=
 =?us-ascii?Q?KvDQV72aZQP/s3zmw7iIElglU/DRy43YOosUi+tEWlFOPkZ5omk1YAx+k5xe?=
 =?us-ascii?Q?UljNlAyUq/sFY32Svr/k2j4Eqd66Aj/uyjJhomJaaznfwCKbNo0otRm8sLbz?=
 =?us-ascii?Q?99i5Eu7n/thArniZj9NZfKI695wWyWY+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Odr/tW9Boa4NJIe5W/CCeu3YWP/36irj13J1a/O2UJgQNSJNzsFDooH/JVPp?=
 =?us-ascii?Q?UxFroi371QphhPHaLz7+uXHkhL33FpAZrKS2/CKnBtoodqKdDEjb95Psuc3v?=
 =?us-ascii?Q?9OoBGTxMCPjgVAfckTWcdF6tU+efGSnhcRtYibZd9y8O8jXQisockLIMXQiV?=
 =?us-ascii?Q?LQPYp7wAz7Xvbd5AAPs6SalT1XGnDh9SlxCUHh4z8yPgnrcGjTTcx32tvc2p?=
 =?us-ascii?Q?t9GNpLEFxWKgAKBAFavB7xUVmRmT2kNKsJSfO8xoaviFLQe23822uCMsR/YW?=
 =?us-ascii?Q?lxTTOhhHRliqhAakRGw5NgngBk5eu3BZFq9hGIDmWI0kZFzTDBPO4LB4K34b?=
 =?us-ascii?Q?UG9whTmBGKEVpw3qatsBk1biwWwJnHsO2a7+d6Dajhz+l8bEv9Uw3qarNA0n?=
 =?us-ascii?Q?/hZeO8NmCptLOCVt1QmTvOcpDOApDAwpmb7TiWHruo+ZzacXesQZRs65IPgS?=
 =?us-ascii?Q?k+BN863fM9ynQIJxjf6SIC4MOtoSLrp4IhPqwrDV6N2tZGb3z+4DDGIK8PZO?=
 =?us-ascii?Q?H/7aVy3bNPzAEhEBno7LNtlp/Aa3YtzbUNO6A0UacZ5Wh05cSHgpeJUfWy8B?=
 =?us-ascii?Q?C5RZZaaZJfRUrhMJOPW7DCXc7ALwfh1KVKU+wypt8dHuWzzaokykKkJNToL6?=
 =?us-ascii?Q?qyA8g5wfB+CkiPQaMTJSLphk42Lje0ZgEuQ3mjTWyckfFU/rBmNTGTB3lzgb?=
 =?us-ascii?Q?NJI+cjCIcid3S3v87X8di8S8DSRtNYJB6x1r/FtMNnbqbuAj08vr9PJQxzKA?=
 =?us-ascii?Q?gtMjRKYqUNndeEAWgszJLj2B1heendJbPW9BCga+OQ5253nkyHLxJzlsQaFy?=
 =?us-ascii?Q?xpxpIkx2zF9LJI4zRn26ApuwjhMZns17fAh5Z+T7cO/kOWtid8l/Krb//PX/?=
 =?us-ascii?Q?XVjXQjzPcds7FiSlFVKTs9Ego/mnsvMjYZi9alRAtXWrQrY4JBLhiJ/vzTVe?=
 =?us-ascii?Q?ehDUhIELAvMsXz8z3dZ9944cTTiDTde0jUwDGuo9n4Tn0M7ZzuS5974JB2D9?=
 =?us-ascii?Q?VJbtqEUKjD5vGVtDiaVvSdH4ti+NpLbrWEUVHnCCd21mk/pXirqgbIsxkF8P?=
 =?us-ascii?Q?nTmz7OEgaP3yiNfBFeIrJ+N7xW6e3NXbUr4pNfx61xobQMX145uK7O2D934Q?=
 =?us-ascii?Q?Gmprd+c0AdKJzvhjyC0Yv0tvOXbfnXJ41GK2UMh2/IO7P56U/KeazBN4V6re?=
 =?us-ascii?Q?Fq5ZvWsPZiXBPPaGn1cz6YzYODnq9jYalzCpZtu2R1tYwgi7Xnzrcw4kU7Vd?=
 =?us-ascii?Q?OD1qfAon2ZlRyRJb1uOPMqykO6lFVH6BGFI9cZeeaExdv9BQjlfZat3keAxY?=
 =?us-ascii?Q?5gLoDNymmNnr+savEPwx6KJYuknnmOnN/0zzYDlQxQjZI1NAfGacVFzMuCuk?=
 =?us-ascii?Q?/tGgwLhgdxhb0gu6z9vfRXP+iHwKCfNcGUn/FegKHBP+2BEW6vBVGkIm684B?=
 =?us-ascii?Q?QirO31FKjD2Q+Pbj5536LRj5Nc9I2f8p1xEY/7S+3ibPGKUFlIaK3QtdfKQg?=
 =?us-ascii?Q?1uIVnRuGJjuMST+dG5p9Pv/de7R9yLmVj3KNhTa8zRaXCFz1fpkiWgbgDbyi?=
 =?us-ascii?Q?BTaHvkIlv+B1sxBW3L08jjcuLOy5GzqcbOk5qLso?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df9ac2c9-a32b-4664-086b-08dd5bca5402
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:44:31.0150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiG5TMkXWM0CkqXgcntGhmWklHYeIA/ZAXpWF/HQq0d967FpyPmnKOIb1WcyikaRUDkqOJo1GuQhuTwD4swWwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6945

This is an 8 megapixel raw10/raw12 sensor with HDR capabilities.
HDR mode control is supported, with one HDR mode: staggered HDR
with 2 exposures on separate virtual channels. However, for now,
only one exposure (VC 0) is accessible via get_frame_desc.

Supported resolutions:
   - 1920 x 1080 @ 60fps (SBGGR10, no HDR)
   - 1920 x 1080 @ 30fps (SBGGR10, HDR)
   - 3840 x 2160 @ 30fps (SBGGR12, no HDR)
   - 3840 x 2160 @ 15fps (SBGGR12, HDR)
   - 3840 x 2160 @ 30fps (SBGGR10, no HDR)
   - 3840 x 2160 @ 15fps (SBGGR10, HDR)

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v4:
	Switch to Y media bus codes. The CFA pattern control will be implemented when patches get merged, or maybe separatelly as RFC?
	Add pixel_rate member to mode struct, remove fps member. We do not have information how to calculate the pixel rate from the PLL parameters that can be made public.
	Use register macros for the registers that are documented. User register group macros, where individual registers are not documented
	Constify more structs
	Remove some unneded ending commas after a terminator
	Fix a seeries of smatch warnings like: warning: symbol 'os08a20_init_setting_common' was not declared. Should it be static?
	Shorten some more lines to 80 columns

Changes in v3:
	Don't hardcode timing registers: remove timing registers x_output_size/y_output_size from register configuration list, add them to ox05b1s_apply_current_mode
	Remove HTS,VTS from register config list as they are written by HBLANK and VBLANK controls through __v4l2_ctrl_handler_setup
	Use const for os08a20_supported_modes	
	os08a20 register config cleaning (remove all registers that were at their default value, and more, keep only what seems mandatory to be able to stream)
	Let the 4k 10bit mode by default without hdr, all 3 modes are now by default without hdr, staggered hdr may be enabled via v4l2-ctl for any of them.
	Separate the 10/12 bit register settings into separate lists: os08a20_init_setting_10bit, os08a20_init_setting_12bit
	Update commit description: rearrange supported resolutions and remove 1 duplicate line, state HDR limitation
	Increase a bit the default vts for 1080p, to get exactly 60fps, it was 62.61
	Use regmap_update_bits() directly and remove ox05b1s_regmap_update_bits()

Changes in v2:
	Add spaces inside brackets, wrap lines to 80
	Remove some redundant initialization
	Use a loop in os08a20_enable_staggered_hdr/os08a20_disable_staggered_hdr, for that, add a register settings array for HDR enabling/disabling
	Make "sizes" a pointer
	Remove mode headers, add supported modes in the dedicated c file, ox05b1s_modes.c 
	Refactor register lists, for os08a20 use a common list for all modes, and also specific lists per mode

 drivers/media/i2c/ox05b1s/ox05b1s.h       |   4 +
 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c  | 187 +++++++++++++++++++++-
 drivers/media/i2c/ox05b1s/ox05b1s_modes.c | 110 +++++++++++++
 3 files changed, 300 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ox05b1s/ox05b1s.h b/drivers/media/i2c/ox05b1s/ox05b1s.h
index 2a87d69864f9..58454e10150b 100644
--- a/drivers/media/i2c/ox05b1s/ox05b1s.h
+++ b/drivers/media/i2c/ox05b1s/ox05b1s.h
@@ -17,6 +17,10 @@ struct ox05b1s_reglist {
 	const struct ox05b1s_reg *regs;
 };
 
+extern const struct ox05b1s_reglist os08a20_reglist_4k_10b[];
+extern const struct ox05b1s_reglist os08a20_reglist_4k_12b[];
+extern const struct ox05b1s_reglist os08a20_reglist_1080p_10b[];
+
 extern const struct ox05b1s_reglist ox05b1s_reglist_2592x1944[];
 
 #endif /* OX05B1S_H */
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
index 1026216ddd5b..bc578fc61f1f 100644
--- a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
@@ -40,6 +40,7 @@ struct ox05b1s_sizes {
 	const struct v4l2_area *sizes;
 };
 
+struct ox05b1s;
 struct ox05b1s_plat_data {
 	char				name[20];
 	u32				chip_id;
@@ -52,6 +53,9 @@ struct ox05b1s_plat_data {
 	const struct ox05b1s_mode	*supported_modes;
 	u32				default_mode_index;
 	const struct ox05b1s_sizes	*supported_codes;
+	const char * const		*hdr_modes;
+	u32				hdr_modes_count;
+	int (*set_hdr_mode)(struct ox05b1s *sensor, u32 hdr_mode);
 };
 
 struct ox05b1s_ctrls {
@@ -62,6 +66,7 @@ struct ox05b1s_ctrls {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *hdr_mode;
 };
 
 struct ox05b1s_mode {
@@ -102,6 +107,87 @@ struct ox05b1s {
 	struct ox05b1s_ctrls ctrls;
 };
 
+#define OS08A20_PIXEL_RATE_144M	144000000
+#define OS08A20_PIXEL_RATE_288M	288000000
+static const struct ox05b1s_mode os08a20_supported_modes[] = {
+	{
+		/* 1080p BGGR10, no hdr, 60fps */
+		.index		= 0,
+		.width		= 1920,
+		.height		= 1080,
+		.code		= MEDIA_BUS_FMT_Y10_1X10,
+		.bpp		= 10,
+		.vts		= 0x4d3,
+		.hts		= 0x790,
+		.exp		= 0x4d3 - 8,
+		.h_bin		= true,
+		.pixel_rate	= OS08A20_PIXEL_RATE_144M,
+		.reg_data	= os08a20_reglist_1080p_10b,
+	}, {
+		/* 4k BGGR10, no hdr, 30fps */
+		.index		= 1,
+		.width		= 3840,
+		.height		= 2160,
+		.code		= MEDIA_BUS_FMT_Y10_1X10,
+		.bpp		= 10,
+		.vts		= 0x90a,
+		.hts		= 0x818,
+		.exp		= 0x90a - 8,
+		.h_bin		= false,
+		.pixel_rate	= OS08A20_PIXEL_RATE_288M,
+		.reg_data	= os08a20_reglist_4k_10b,
+	}, {
+		/* 4k BGGR12, no hdr, 30fps */
+		.index		= 2,
+		.width		= 3840,
+		.height		= 2160,
+		.code		= MEDIA_BUS_FMT_Y12_1X12,
+		.bpp		= 12,
+		.vts		= 0x8f0,
+		.hts		= 0x814,
+		.exp		= 0x8f0 - 8,
+		.h_bin		= false,
+		.pixel_rate	= OS08A20_PIXEL_RATE_288M,
+		.reg_data	= os08a20_reglist_4k_12b,
+	}, {
+		/* sentinel */
+	}
+};
+
+/* keep in sync with os08a20_supported_modes */
+static const struct v4l2_area os08a20_sbggr10_sizes[] = {
+	{
+		.width = 1920,
+		.height = 1080,
+	}, {
+		.width = 3840,
+		.height = 2160,
+	}, {
+		/* sentinel */
+	}
+};
+
+static const struct v4l2_area os08a20_sbggr12_sizes[] = {
+	{
+		.width = 3840,
+		.height = 2160,
+	}, {
+		/* sentinel */
+	}
+};
+
+static const struct ox05b1s_sizes os08a20_supported_codes[] = {
+	{
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.sizes = os08a20_sbggr10_sizes,
+	}, {
+		.code = MEDIA_BUS_FMT_Y12_1X12,
+		.sizes = os08a20_sbggr12_sizes,
+	}, {
+		/* sentinel */
+	}
+};
+
 #define OX05B1S_PIXEL_RATE_48M	48000000
 static const struct ox05b1s_mode ox05b1s_supported_modes[] = {
 	{
@@ -231,6 +317,62 @@ static int ox05b1s_write_reg_array(struct ox05b1s *sensor,
 	return 0;
 }
 
+static const char * const os08a20_hdr_modes[] = {
+	"NO HDR", /* No HDR, single exposure */
+	"HDR Staggered", /* Staggered HDR mode, 2 exposures on separate VC */
+};
+
+static const struct ox05b1s_reg os08a20_init_setting_hdr_en[] = {
+	{ 0x3661, BIT(0) }, /* CORE1[0] STG_HDR_ALIGN_EN */
+	{ 0x3821, BIT(5) }, /* FORMAT2[5] STG_HDR_EN */
+	{ 0x4813, BIT(3) }, /* MIPI_CTRL_13[3] */
+	{ 0x486e, BIT(2) }, /* MIPI_CTRL_6E[2] MIPI_VC_ENABLE */
+};
+
+static int os08a20_enable_staggered_hdr(struct ox05b1s *sensor)
+{
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(os08a20_init_setting_hdr_en); i++) {
+		ret = regmap_update_bits(sensor->regmap,
+					 os08a20_init_setting_hdr_en[i].addr,
+					 os08a20_init_setting_hdr_en[i].data,
+					 os08a20_init_setting_hdr_en[i].data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int os08a20_disable_staggered_hdr(struct ox05b1s *sensor)
+{
+	int ret;
+
+	for (int i = 0; i < ARRAY_SIZE(os08a20_init_setting_hdr_en); i++) {
+		ret = regmap_update_bits(sensor->regmap,
+					 os08a20_init_setting_hdr_en[i].addr,
+					 os08a20_init_setting_hdr_en[i].data,
+					 0);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int os08a20_set_hdr_mode(struct ox05b1s *sensor, u32 hdr_mode)
+{
+	switch (hdr_mode) {
+	case 0:
+		return os08a20_disable_staggered_hdr(sensor);
+	case 1:
+		return os08a20_enable_staggered_hdr(sensor);
+	default:
+		return -EINVAL;
+	}
+}
+
 static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 {
 	return &container_of(ctrl->handler, struct ox05b1s,
@@ -274,6 +416,12 @@ static int ox05b1s_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(sensor->regmap, OX05B1S_REG_EXPOSURE,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_HDR_SENSOR_MODE:
+		if (sensor->model->set_hdr_mode)
+			ret = sensor->model->set_hdr_mode(sensor, ctrl->val);
+		else
+			ret = -EINVAL;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -336,6 +484,13 @@ static int ox05b1s_init_controls(struct ox05b1s *sensor)
 	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
 					0, 0xFFFF, 1, 0x80);
 
+	if (sensor->model->hdr_modes)
+		ctrls->hdr_mode = v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_HDR_SENSOR_MODE,
+							       sensor->model->hdr_modes_count - 1,
+								0, 0, sensor->model->hdr_modes);
+	else
+		ctrls->hdr_mode = NULL;
+
 	if (hdl->error) {
 		ret = hdl->error;
 		goto free_ctrls;
@@ -658,6 +813,8 @@ static u8 ox05b1s_code2dt(const u32 code)
 	switch (code) {
 	case MEDIA_BUS_FMT_Y10_1X10:
 		return MIPI_CSI2_DT_RAW10;
+	case MEDIA_BUS_FMT_Y12_1X12:
+		return MIPI_CSI2_DT_RAW12;
 	default:
 		return MIPI_CSI2_DT_RAW10;
 	}
@@ -768,6 +925,9 @@ static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
 	}
 
 	switch (chip_id) {
+	case 0x530841:
+		camera_name = "os08a20";
+		break;
 	case 0x580542:
 		camera_name = "ox05b1s";
 		break;
@@ -912,6 +1072,24 @@ static void ox05b1s_remove(struct i2c_client *client)
 static DEFINE_RUNTIME_DEV_PM_OPS(ox05b1s_pm_ops, ox05b1s_runtime_suspend,
 				 ox05b1s_runtime_resume, NULL);
 
+static const struct ox05b1s_plat_data os08a20_data = {
+	.name			= "os08a20",
+	.chip_id		= 0x530841,
+	.native_width		= 3872, /* 16 dummy + 3840 active + 16 dummy */
+	.native_height		= 2192, /* 16 dummy + 2160 active + 16 dummy */
+	.active_top		= 16,
+	.active_left		= 16,
+	.active_width		= 3840,
+	.active_height		= 2160,
+	.supported_modes	= os08a20_supported_modes,
+	.default_mode_index	= 0,
+	.supported_codes	= os08a20_supported_codes,
+	.hdr_modes		= os08a20_hdr_modes,
+	.hdr_modes_count	= ARRAY_SIZE(os08a20_hdr_modes),
+	.set_hdr_mode		= os08a20_set_hdr_mode,
+
+};
+
 static const struct ox05b1s_plat_data ox05b1s_data = {
 	.name			= "ox05b1s",
 	.chip_id		= 0x580542,
@@ -923,10 +1101,17 @@ static const struct ox05b1s_plat_data ox05b1s_data = {
 	.active_height		= 1944,
 	.supported_modes	= ox05b1s_supported_modes,
 	.default_mode_index	= 0,
-	.supported_codes	= ox05b1s_supported_codes
+	.supported_codes	= ox05b1s_supported_codes,
+	.hdr_modes		= NULL,
+	.hdr_modes_count	= 0,
+	.set_hdr_mode		= NULL
 };
 
 static const struct of_device_id ox05b1s_of_match[] = {
+	{
+		.compatible = "ovti,os08a20",
+		.data = &os08a20_data,
+	},
 	{
 		.compatible = "ovti,ox05b1s",
 		.data = &ox05b1s_data,
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
index 9a1f3a89077c..e17c32a90cba 100644
--- a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
@@ -10,6 +10,116 @@
 #include <media/v4l2-cci.h>
 #include "ox05b1s.h"
 
+#define OS08A20_REG_MIPI_BIT_10_12	CCI_REG8(0x031e)
+/* Analog Control Registers 0x3600-0x3637 */
+#define OS08A20_REG_ANA_CTRL		CCI_REG8(0x3600)
+#define OS08A20_REG_CORE_0		CCI_REG8(0x3660)
+/* Sensor Timing Control Registers 0x3700-0x37ff */
+#define OS08A20_REG_SENSOR_TIMING_CTRL	CCI_REG8(0x3700)
+#define OS08A20_REG_X_ODD_INC		CCI_REG8(0x3814)
+#define OS08A20_REG_Y_ODD_INC		CCI_REG8(0x3816)
+#define OS08A20_REG_FORMAT1		CCI_REG8(0x3820)
+#define OS08A20_REG_FORMAT2		CCI_REG8(0x3821)
+#define OS08A20_REG_PCLK_PERIOD		CCI_REG8(0x4837)
+#define OS08A20_REG_ISP_CTRL_1		CCI_REG8(0x5001)
+#define OS08A20_REG_ISP_CTRL_5		CCI_REG8(0x5005)
+
+/* Common register configuration for Omnivision OS08A20 raw camera */
+static const struct ox05b1s_reg os08a20_init_setting_common[] = {
+	{ OS08A20_REG_ANA_CTRL + 0x05, 0x50 },
+	{ OS08A20_REG_ANA_CTRL + 0x10, 0x39 },
+	{ OS08A20_REG_SENSOR_TIMING_CTRL + 0x5e, 0x0b },
+	{ OS08A20_REG_ISP_CTRL_1, 0x42 },
+	{ OS08A20_REG_ISP_CTRL_5, 0x00 },
+	{ /* sentinel*/ }
+};
+
+/* Common register configuration for Omnivision OS08A20 10 bit */
+static const struct ox05b1s_reg os08a20_init_setting_10bit[] = {
+	{ OS08A20_REG_MIPI_BIT_10_12, 0x09 },
+	{ OS08A20_REG_ANA_CTRL + 0x09, 0xb5 },
+	{ OS08A20_REG_CORE_0, 0x43 },
+	{ OS08A20_REG_SENSOR_TIMING_CTRL + 0x06, 0x35 },
+	{ OS08A20_REG_SENSOR_TIMING_CTRL + 0x0a, 0x00 },
+	{ OS08A20_REG_SENSOR_TIMING_CTRL + 0x0b, 0x98 },
+	{ OS08A20_REG_SENSOR_TIMING_CTRL + 0x09, 0x49 },
+	{ /* sentinel*/ }
+};
+
+/* Common register configuration for Omnivision OS08A20 12 bit */
+static const struct ox05b1s_reg os08a20_init_setting_12bit[] = {
+	{ OS08A20_REG_MIPI_BIT_10_12, 0x0a },
+	{ OS08A20_REG_ANA_CTRL + 0x09, 0xdb },
+	{ OS08A20_REG_CORE_0, 0xd3 },
+	{ OS08A20_REG_SENSOR_TIMING_CTRL + 0x06, 0x6a },
+	{ OS08A20_REG_SENSOR_TIMING_CTRL + 0x0a, 0x01 },
+	{ OS08A20_REG_SENSOR_TIMING_CTRL + 0x0b, 0x30 },
+	{ OS08A20_REG_SENSOR_TIMING_CTRL + 0x09, 0x48 },
+	{ /* sentinel*/ }
+};
+
+/* Mode specific register configurations for Omnivision OS08A20 raw camera */
+
+/* OS08A20 3840 x 2160 @30fps BGGR10 no more HDR */
+static const struct ox05b1s_reg os08a20_init_setting_4k_10b[] = {
+	{ OS08A20_REG_FORMAT2, 0x04 }, /* mirror */
+	{ OS08A20_REG_PCLK_PERIOD, 0x10 },
+	{ /* sentinel*/ }
+};
+
+/* OS08A20 3840 x 2160 @30fps BGGR12 */
+static const struct ox05b1s_reg os08a20_init_setting_4k_12b[] = {
+	{ OS08A20_REG_FORMAT2, 0x04 }, /* mirror */
+	{ OS08A20_REG_PCLK_PERIOD, 0x10 },
+	{ /* sentinel*/ }
+};
+
+/* OS08A20 1920 x 1080 @60fps BGGR10 */
+static const struct ox05b1s_reg os08a20_init_setting_1080p_10b[] = {
+	{ OS08A20_REG_X_ODD_INC, 0x03 },
+	{ OS08A20_REG_Y_ODD_INC, 0x03 },
+	{ OS08A20_REG_FORMAT1, 0x01 }, /* vertical bining */
+	{ OS08A20_REG_FORMAT2, 0x05 }, /* mirror, horizontal bining */
+	{ OS08A20_REG_PCLK_PERIOD, 0x16 },
+	{ /* sentinel*/ }
+};
+
+const struct ox05b1s_reglist os08a20_reglist_4k_10b[] = {
+	{
+		.regs = os08a20_init_setting_common
+	}, {
+		.regs = os08a20_init_setting_10bit
+	}, {
+		.regs = os08a20_init_setting_4k_10b
+	}, {
+		/* sentinel */
+	}
+};
+
+const struct ox05b1s_reglist os08a20_reglist_4k_12b[] = {
+	{
+		.regs = os08a20_init_setting_common
+	}, {
+		.regs = os08a20_init_setting_12bit
+	}, {
+		.regs = os08a20_init_setting_4k_12b
+	}, {
+		/* sentinel */
+	}
+};
+
+const struct ox05b1s_reglist os08a20_reglist_1080p_10b[] = {
+	{
+		.regs = os08a20_init_setting_common
+	}, {
+		.regs = os08a20_init_setting_10bit
+	}, {
+		.regs = os08a20_init_setting_1080p_10b
+	}, {
+		/* sentinel */
+	}
+};
+
 #define OX05B1S_REG_PLL1_CTRL_REG07	CCI_REG8(0x0307)
 #define OX05B1S_REG_PLL3_CTRL_REG4A	CCI_REG8(0x034a)
 #define OX05B1S_REG_PLL_MONITOR_REG0B	CCI_REG8(0x040b)
-- 
2.25.1


