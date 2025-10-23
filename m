Return-Path: <linux-media+bounces-45353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F59C0039A
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 30E8756061B
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 09:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B8F2FE570;
	Thu, 23 Oct 2025 09:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ocu75XEK"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E582FB09E;
	Thu, 23 Oct 2025 09:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211170; cv=fail; b=GAOl+lV3PZ9+4e7YjyoD7e8D4X8kjS/mL/gucp2GVs252i+TCVidj31LMzbeYgPMB/mEk6HtYmZVTGoGBrzycPNER5GsYUcwnAGd4MPzZJxnXofn+B6tDj7jiyIFHWvcxEEJIby9oj7HVPOYSUglQ3XWCZPQ/iTntHHREC6Sho0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211170; c=relaxed/simple;
	bh=W210yvxgT8CXTcovjCjC1QQNu3yaXu1HzprMuyvqEtw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=h6K/yd2QTh/2Z6Nt8CZoPUa7q8wLsOtqYMtqAqcz5kljyiP9ND8eMc7nz/g2EknyZfM4qvUDn0y4M2MtLMxvnYuFZOTlZ7RBqLWugcmRtsmgcLIu+d0isyexFr27wK2u1z1h8j4RDDw3OLIdL7gU81a/Xm/nm+Z8qHxAnhL/ETc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ocu75XEK; arc=fail smtp.client-ip=52.101.70.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkJVZXb4RxJHvfCnTbPScMBcH5g8s7N1LqDt6GrcOVzIZ5uIslYlQvehccPMtiR+hsfibA7doHekDxfhcGcYSgOM5rWxeMnAYzfAB4BmNXB6c4aBTCjLtaQbRQ6VFAoCoOhyApAIVnfoU0YlL6RwWQXYu/5t45doPei205z50S7zJcmTLmSEsM/HO25IsknDujVYk5mCgBRmC37yMDdB6ZEm+lDw0/FbXBPr45Yj8FYQmaxt5tAQln9f53mIdZo5liDw6Nanbg2uwIPdXSr56Snl7VeKTXHI5v5IswWbN4QdjRnLEjd4kvHyVBeOBcf6tjoA0eRcL6JayLMWUm1FVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nl0jSy4Z3VzK7MtGN7lUzvL80Dco2juySfwPtB9LE1c=;
 b=V6LLuK0LQQfs42p3m5hFiG44ocrNB6d7VpA0SJ83J347w47NvLOIqSk4L/jJEF2ZTWWupviQYo8DUTuREbOlAfchYO5NcHE9K+9MzpZ9R8EhQBTplwxsRYb1BL29VOgXSSjQs2RrhkM4ScrXMNYxaQik8ETr60W0LtORRq4aer9AlkI0lFHB4s+y5k8jsEcOHGHyi0gK7Ni2gbcRRHK8s1fVO3kfQ0NBSqzAu4UJVu5c6af/xUceuc1KhNw17A6N7l6u0kx6ivuiguDftQIgnRo1Nsell3XK+89/J9EXcfJ33vP+bMhlh3WwgOsiXeruAfc5bV5EV0Ufsi8PyvQs7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nl0jSy4Z3VzK7MtGN7lUzvL80Dco2juySfwPtB9LE1c=;
 b=ocu75XEKvDCl8Gwt3oKsYQ+I2TtQvudK3CRMrIjIWyKRUznz20uDJ1Q6m7WxR99WJ8AvnmIr8MFxvv9ykxblk7XBqa8GetkSpwC/fEauzcTaguRlS0BqistpebjYHNI4xnz5wxtCxzIqjsJ9/iX1el9/9Myj3pwbR2IFaLTX/Lx659/elL+cb69oSdF4wH/eKXdehMxD5Ds5KguYgSlt1Czmdcth1emv1Yfm+AoieXwqUYaM8ANaPaa6wHL9iUGn/gA5YBV6tYD2B1wihPhp+yaUGKiCEYtScj5/5S3M7IituroYQWfKJzSEDNtZu2ZJUL95Touc7cCqhzCKnSJvEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:20b:44e::21)
 by PA1PR04MB10556.eurprd04.prod.outlook.com (2603:10a6:102:48e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:19:24 +0000
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798]) by AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 09:19:24 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v7 0/5] Add MIPI CSI-2 support for i.MX8ULP
Date: Thu, 23 Oct 2025 17:19:41 +0800
Message-Id: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC3z+WgC/13P326DIBTH8VdpuB5GDn+EXvU9lmUBgUqyioFq3
 BrffdhsqXp5Lj7f/M4DZZeCy+h8eqDkppBD7MvRvJ1Q2+n+6nCw5UZQA68lUbjNAT7DbZbj14C
 VNVQKa4WxHhUyJOfD/My9f5Tbp3jD9y45vY3AGgJakZooyjgm+DrGPozVTxfHS8y56uehauNtT
 XYh32P6fg6cYA3/ZQD2WybANQahGWNUMSX45b+yLpnolvIDpYVSLiXXRgsw7Z6yLZUHygrV4FV
 jCDdGyT3lL6pqcqC8UNEowSxhDfF0T8WGkuZAxfor1ZRzJcF5/6LLsvwCRjKjANUBAAA=
X-Change-ID: 20250819-csi2_imx8ulp-9db386dd6bdf
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761211202; l=3019;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=W210yvxgT8CXTcovjCjC1QQNu3yaXu1HzprMuyvqEtw=;
 b=7l8fH3vcjKPHdOqkiHpbN8+2tyCmVAsQN/yUf8NPip/mYJfk+jhAC5ovyHqBWA2lCTMj2c3AW
 Sv47Ntz78SEDx8K3Js8MaXDetDMDgfXBRbkIWZJzmy5+xWGxzPS0azY
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To AS8SPRMB0023.eurprd04.prod.outlook.com
 (2603:10a6:20b:44e::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8SPRMB0023:EE_|PA1PR04MB10556:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e9bc08-b538-4757-cb36-08de121541ec
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?YVJ1UjdPYSt3citkZmpRTDhhV3lpRGlVaDU3SklJTkhod2pscGh2WkpWOVpi?=
 =?utf-8?B?ajVkaStDaSs4OXM2bEhTMmRmcU1VN0NidEJNUklvM2VEWkdMSzZoWlBybnpp?=
 =?utf-8?B?cnIrNWRMUUxnT2xpa2RwOXhkZHFCaUVzZVRiUFR1T0V4T0duT0taN1E3N2Z4?=
 =?utf-8?B?QTVLTEdZaVlVUG9DRGgzRzJvZ1NGMlIzb2NKNW5pK20vTzlNRDZUQ2w5WjBa?=
 =?utf-8?B?NUtBRDVHMnJaMWowTW1UbmtTMEtQdThtUDBrY2t4SDVTZlNvNTlzZFhhQ1ZK?=
 =?utf-8?B?YXdkdFNnQUdjcHZyTEsrQTJCbWRKV3JVWFVuYjJ3Y3Zoek0yS1hqcUFWRWxt?=
 =?utf-8?B?dnQwR29lT0paWU16MmNlalVZUlJnVG9nQU9Bb01yRmprWmhwNE5XUTUxZGVj?=
 =?utf-8?B?dVJLbmhzdEtwbC9CTkJxYzBEYUNnenRIVkxDdFRGMnJpUVVPb1g3bEpyN0xN?=
 =?utf-8?B?R3J3dWpZYnozOVorSUpabDhkdEdESWhiTmRqVG5Sb1ZvWWNZY05jRjdCcnJ1?=
 =?utf-8?B?Y2VHaWRrdkNFUW9oRG1OS2xxcnQ5OExsWVJ3L1BoVVR5ZVE1Ym5xQzY4bnVE?=
 =?utf-8?B?MXVsR2NDU05SdHZKLzVEMmdubmJlaktWcHVwU3k2cWNiVVNjUHdvTmk1akVa?=
 =?utf-8?B?RlhDNThxUU03QXo4T0xkbnBqUnV1ZzBISVRmbWEyS1doODdaSlJGaXJoN0c5?=
 =?utf-8?B?eGVFajNXVzRtRTR0TGtYRzJBSk1Wa1Q0RWdiL2NtOEhDcE5abVhBbi9DdGdk?=
 =?utf-8?B?ZDk3ZUdQWk9JczJ5VjJ3RW55L0pUS3BoWXR3RWNGMjNFdXk5MS94WlpjaUls?=
 =?utf-8?B?NXZYVzM1YlRlL2pjSDdoeEQ0d1dKOURWQ1pDYmRDclFNQkVyajZwNElMZm9Q?=
 =?utf-8?B?UWZFTEVaeXZWS0ZIZ0xQVEhTeVlwSHdBRTh2b0o3TWdwamE0OFltWis1aElv?=
 =?utf-8?B?SmFseVVaalMxYk5LaHUzYkV0TnVZbk9RWEFWcHJ6VXExQUd6TngveksrK1lJ?=
 =?utf-8?B?YUpqQ1RrcS9rM1VmZmtaeFhDOU9tSVFWa0JqeFlEKy9UMk9pYnd0NHZ6QnlQ?=
 =?utf-8?B?NmxKWnJQZTF5b3Q1VGVGaHkwN29mZTBNcG9zQkEvVlFFTk1JWUNSOW9ScUsz?=
 =?utf-8?B?NGZlTVVKZGw1ZVNnWVRya3M4QTFUeTJwNU5WazJscUcrako1Tm1ycFhtM2ZS?=
 =?utf-8?B?R2dMdTZLQXNrc0lzTVd0clErZnBSbVBRL2p0N0tEeHdkWW1QandxeXJFaGZl?=
 =?utf-8?B?Wnh5NDRNWGFNd0NvT08xaDN5cVpkdXdsQnJZTUtWeVBGc3JQalFUZkhwMkhC?=
 =?utf-8?B?QnhDRGRQQ2pKa1dOK2s4QUdzVUR3M2xML0FUZ3JZbGovT2VkQXdWS2tReHk3?=
 =?utf-8?B?RytyL1pXRDVFK2IvUWlGZUhHVXduQkpRZXE4V1BOVUJTUTRLNkFUYThqZ285?=
 =?utf-8?B?MEszQVFtVzNOcHpER0VtRWdhMEpvV3FrVFVENTgrdG01cGxwU3F3S3BBTytK?=
 =?utf-8?B?cDhGNWtNWkFyTEUwbUxXUkY4YURzYWVUVml3Z2lIc2g3M256bytNK1VVbEt5?=
 =?utf-8?B?QVNpSmRLZGtFaEV3MENzdDdjOTFlTldtNG5id3h1WUdhdHdZOWtCUDJKZ1dm?=
 =?utf-8?B?bSthZy9Ja0NhUUdHRmtIMU9DQjVlQXRrd1VtTnhobUdoMkxhbUZid282S2lt?=
 =?utf-8?B?VVlkK0gyVDlTanBGdTFrR3MrYkFBMEhrVGRhaUlibDZDOUNyR3g2NkNmS3or?=
 =?utf-8?B?T2FoNS9VNk5GRit2YndNTkE5ZWxhV1EzWjZvMmN0dnA4UndrT0plOGt0R3FN?=
 =?utf-8?B?YThyQ2VydWhzTUw4SnRnYWhnYnRIR0FpSU1CTmdnbG5OMmViNDhqYzU4ZlNY?=
 =?utf-8?B?SHYzY20ySmdaTGRETFVXaVRHWDV2N1ljNVBrQWxhcVArT2V5bks4QUJqYzNZ?=
 =?utf-8?B?RXRaUGxveThocFYzenI4YjZDTXpZMWZmV1lieVNtbmFnMHhlV3hSUlBCU1FG?=
 =?utf-8?B?Y2Y2Nnh6UlZLY1VWL3NVei85c015YWRLR0VVbWxZL1dFOVJ5Y3ZQL1VINDFK?=
 =?utf-8?B?MmIrRFVOSTZFNHpNSTJlSEd0dnYrZU13ODNFQT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?V0lwWjlESVFBNXAxTFpWbWdVdW1LT2RGRzBpNmoyNmF4MlI4Mi9KeU1ZVnpT?=
 =?utf-8?B?eHFhSXBjUU9lY0U3SnFFbU5yeG05SW5Jd2RaUmNxbGx6L3p3M01vcXNUb2pB?=
 =?utf-8?B?aHdpZDlCRVNydjFZNTZReCtDUVcxM1p5R0wzWmtpWkI0RVBsb0lmb05PWXdr?=
 =?utf-8?B?d0xkYWtYdkNvVGJhWHpiTWwyMFRhRFJmWUNQUmZ1dHY2QmRaWTNTaFFDeXlP?=
 =?utf-8?B?UWVCQ3RKYjFnUHhMcjY0eUtLUXY1ZnZYR05jNFRFMVA0VlJha0VjWDZZNXcx?=
 =?utf-8?B?VUhDWWpEWFZSaTBzTjVpSzRNOHB3VGQxbktMWDdNanBVeUV0clNORFpKVG41?=
 =?utf-8?B?YTcxU29tN1k0NlhhMlhBa3lNZENFTkFFWnRJQ3Fqc1FWUnFrc0tnNmF6ZVg0?=
 =?utf-8?B?dTJCMFdueWlTaEFFL3RHTXJ6UmZHb1VtYlEvemdVRW1ZYlZKR0Qzd09zZ2VW?=
 =?utf-8?B?Wis4M3lhbnhDbXJ6eGh4VStsbTZuOUE2aHozNzdrSW1Yc1JWVjM0VnFFck1n?=
 =?utf-8?B?c3NBR2tMQ3dNRkFtQzFHZnRIZnJ6YnVGY2RGTnZYaHltclZuMU9VeXhMbXpn?=
 =?utf-8?B?d2dmbWNEdTE2czA4V0dhQjJ0cjZFbXJGYWlkTXorY1RkeUN5akJ5UFB2NDho?=
 =?utf-8?B?S284d3RVQU15SDZKb0s1Vm9Ycnp4ZzZ6N0w1Yk5SNUpmSkZEdzR6ZFVBRVVB?=
 =?utf-8?B?YThRa3ZEcTh6WmVQY2FjUDBleUR5RmtoYmdzZE1qRW5hUEFHMzlSUTFobHEw?=
 =?utf-8?B?L3liRi9jUUVOYnVsalp5bStWOHNNeWI3ZlU1MVdWc2R0dUtrUk1PdHFwU1Nx?=
 =?utf-8?B?UUlaNTdpeHFnRitkWmZ1ZUsxcWkybHlxWTNySG15NStRbWpJSVlUZ3oyMVk5?=
 =?utf-8?B?UDkzRWxjdGYwM3g2bDdkNkNWMDJUeFVDdHBjWTQyYzIxNm5EckxmWnhtMFA4?=
 =?utf-8?B?cDBQY0lzL3Njb1FXZytIT3pqNG1hT0FpS2Z3VWYyNnNpL0p1bWVidGZ6cS9H?=
 =?utf-8?B?U3ZMcXdzM2tXUzV1QnNkODRwRzFIejN2Nko2TEQ5UkpzcktQSUJQUDZzL3NZ?=
 =?utf-8?B?MkZrRThhMDhNTTA5Tk9mWHQ2S0R3cTBVYmlNNEs2MkxEd254dmY4VW03cm45?=
 =?utf-8?B?NmZaTy9TRWc3cmdIc3IvZGN5RU9HMVNibnkzeUZjZlh3YSs4Z1g0eUxzSE9k?=
 =?utf-8?B?Q09rOXhhbnhBcGpJNitkMGtTZU9TYkJENjdIdmNLdjcrM1VFQnRwVFcwOXVw?=
 =?utf-8?B?Nko1aG1yYTVZbG1JdGUwVW1RZ2Z2c2QyRm9Jbkl5c2hQckh3cS9icUJYZmZa?=
 =?utf-8?B?N2FhQU1VMUQzaVpUczhCVUg1SHRJZ2x0a3RYT3A3dHhnN3o4VnRMdmV5dHF4?=
 =?utf-8?B?Y3M2TXpsS284UEI2K0prWkZvbEZjUFpMcFBBazhCdVdMNzM4a2VzZW1lWml4?=
 =?utf-8?B?VmdKc2FreHI4SW1SVUsyMjlJOXdCc0FEUnpCSTlGNWxkR1JpMlNZS3VsTm8r?=
 =?utf-8?B?blM0dFFSdlNCMDlXK1FhaGNUc0hvZXMyRkZ5MDFnbWI1SUdTbUN3MlJrR1lJ?=
 =?utf-8?B?UHRtMjFZLy9ncmhTY0Z1VWUzSnlmRThqUlIyL1BKZHdkRnBjZnFaVW91Q3N0?=
 =?utf-8?B?KzVzQUg5dko1TWx2b0k1bVozM3RsLy9BcjNNdVZSLzRqNS9kSDYyOGE2dlQz?=
 =?utf-8?B?TmhWYm9IOERVYjlnR3VCN3ZlbzlkWGUvTi96SmdiVVdTcGhsSVNJaUU3ZlQr?=
 =?utf-8?B?a2ZUVWpXOGs0UitrcDQvOVhpbnEwY1ZJaFl2b1JxS29XWlNnWG9ndEgxZUdv?=
 =?utf-8?B?UjdFMnhZaFl5NytIOUV3V3FjWWZ6RlVUNWNYK3BRQmovZkNIdTRPamsxNzBS?=
 =?utf-8?B?T3BTZDkwZ2FkeGVGL3VpN2d4OEdqdmJadUQyMEhrVDZiU1dIWXJwK3E5UzQ4?=
 =?utf-8?B?M21YaWZpdWd0Wll4TlFPRnAwRnBVaTMyQlZZMGJBQ1E4YWdSR2FHVHBzTGhN?=
 =?utf-8?B?VkFvY2hpaTM1YUV0UDR0ZEdJUkZlVmtDall5aVRCdWNWNURtK1RDZ0h5SW9v?=
 =?utf-8?B?bFZFZ2pzZjc3VjFLLzVPU2RaN3hGRmxrRWU1T2VvYnorayt2MGJmK3l3MWQ5?=
 =?utf-8?Q?igBr6JIgz8Wh3hUnRr+TpBf2e?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e9bc08-b538-4757-cb36-08de121541ec
X-MS-Exchange-CrossTenant-AuthSource: AS8SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:19:24.4273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ac+UR4k/hnBDUvZae4WKnaM3hTk8SbQ72WD5ZVKh0R7ItHN4yDcAP1/eigJ5SQqQcIIeoypmomHiP9+qyVeDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10556

The serial adds MIPI CSI-2 support for i.MX8ULP.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v7:
- No functional changes, only move patch 2 after patch 4 to avoid dependency issues.
- Rebased on latest media/next
- Link to v6: https://lore.kernel.org/r/20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com

Changes in v6:
- s/existed/existing/ in patch 1 commit log.
- Delete the compatible between 8ulp and 8qxp since 8ulp need one more clock.
- Update compatible string in dts for csi node.
- Add one new patch to handle 8ulp in driver.
    media: imx8mq-mipi-csi2: Add support for i.MX8ULP
- Link to v5: https://lore.kernel.org/r/20250901-csi2_imx8ulp-v5-0-67964d1471f3@nxp.com

Changes in v5:
- Delete else: block and move clock constrains to each case.
- List exact cases, but put imx8qxp/qm in one if:then: block to avoid
  repetitive code since they are same.
- Link to v4: https://lore.kernel.org/all/20250828-csi2_imx8ulp-v4-0-a2f97b15bb98@nxp.com

Changes in v4:
- Change csr clock name to pclk which is more readability.
- Add restriction to i.MX8ULP and the other variants remain the same as previous versions.
- Update commit log in patch 1 to describe why add new compatible string for i.MX8ULP.
- Link to v3: https://lore.kernel.org/all/20250825-csi2_imx8ulp-v3-0-35885aba62bc@nxp.com

Changes in v3:
- Correct the order of "fsl,imx8qm-mipi-csi2","fsl,imx8qm-mipi-csi2".
- Correct the order of minItems and maxItems.
- Restict all variants.
- Change pclk clock name to csr to match IP port name.
- Align description about csr clock with IP datasheet.
- Add reasons for adding a fourth clock(csr) in patch 1 commit log.
- Link to v2: https://lore.kernel.org/all/20250822-csi2_imx8ulp-v2-0-26a444394965@nxp.com

Changes in v2:
- Add more description about pclk clock.
- Change minItems/maxItems to 2 for resets property.
- Better to handle "fsl,imx8ulp-mipi-csi2" variant.
- Move comment to the top of reset_control_deassert().
- Move dts patch as the last one.
- Add "fsl,imx8qxp-mipi-csi2" to compatible string list of csi node.
- Remove patch 5 in v1.
- Link to v1: https://lore.kernel.org/all/20250812081923.1019345-1-guoniu.zhou@oss.nxp.com

---
Guoniu Zhou (5):
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8ULP compatible string
      media: imx8mq-mipi-csi2: Use devm_clk_bulk_get_all() to fetch clocks
      media: imx8mq-mipi-csi2: Explicitly release reset
      media: imx8mq-mipi-csi2: Add support for i.MX8ULP
      arm64: dts: imx8ulp: Add CSI and ISI Nodes

 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 41 ++++++++++++-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 67 ++++++++++++++++++++++
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 61 ++++++--------------
 3 files changed, 124 insertions(+), 45 deletions(-)
---
base-commit: 1fdb55ed40fa5ebe6934bd6b93036c714ebb5ef8
change-id: 20250819-csi2_imx8ulp-9db386dd6bdf

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


