Return-Path: <linux-media+bounces-42650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18061B7C4FB
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 13:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EA2E162693
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 08:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E843090F5;
	Wed, 17 Sep 2025 08:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QN/zYbqB"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013026.outbound.protection.outlook.com [40.107.162.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4732730749A;
	Wed, 17 Sep 2025 08:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096946; cv=fail; b=D44/nUa81rB7vs/YLvtBS8BiYNJcYV0cXn1sEU0Rn5hed1x0Wx5w3A8A0dKuXc7vlO/0viw22wIqrjqXMB6dGLWH5JR4NqSgWpw1dcAEvZX/Dw+zYMEXc03Uq8V+59thvc5NNn8aqiOhyEks3u5NNiMmAlJ7blOu/Kd0HD3X3bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096946; c=relaxed/simple;
	bh=0zoa46QqDvh720IwsDHRqfwN17bmgMo2UriXhcIsTGc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZS2a/oBnheEKnjv9tgjn0yrbCmz1aHuqKQXawuPW9rp5z1Jed04jQnyxR7GlQFqI1yvEDeFGRIdwhg42VwaC5DDpuJMohVPe98axEP+k7zQG+T/9EPveu7gI6UqeZBuHdftZelGuVoSLBxoP0ztJZ/ooBfD7qX6OQvaMl75ajlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QN/zYbqB; arc=fail smtp.client-ip=40.107.162.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ay9RYcWRsjE2v87CNqm3txJmCIUuFiMk46Qir/4ECvBKTBHlYDB+U9wWO7UQC2alOWLGtYCJe6k4WI7X6FPoPlvDbX+AyWYuMJ1QRlZzbJhh3MI/v7W0+sOu+cGT7mXD7W9D+MQIyvtyB8IfwLbH2YNbG8Y0WnTacUQA8wiSYNUy/sSO+LWNq/+O9LBkwow4IwfUT5l3gVrOKXBPA2FdcRk0yvqGluDT2YWRUzAq9tzbfq0Wn+p4s21E2sFmrNm2J1OS+TXAvS6W62O5YerOxRx6cKR8FoK2uyQezVEONcbs+Rxtz3OMN8GosN6XiZAcT9V6aNbiR7/thze1Be0YFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ary5LyKhTHIRizYijtAufvWVa7OJjuJWaW9QtQTyt3Q=;
 b=Us3NaATNaLR0jC1N9EjHEoAdd6GwJPv7VP9YIHHgO+h+hGgumPQupx/dbBOxMRek28QxfOW5FHN9PQbWROZbfwleFMltN1lgYuku4xc5QnOCEzxv9+A2m6NAAtNnLuypc2c6I3k/pkJLQlZ+V1QJdVUtlTYKq6qAuyM38+/EfLQ8A0e81JhU8Vt9alK0v5xfwIpOBIejhTg+pcmYX2VhMCzySYSc8JP162ctKPIQhN3Wo/2qLu18rK1afNfGACL905eqLcpNx3cR5eaVVYRByGMsZmVHsFz3ZOqmPPT3sGXOOZQEh/I2cNuYQHbpO5gufiRrHY/qIllZhB064rwWuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ary5LyKhTHIRizYijtAufvWVa7OJjuJWaW9QtQTyt3Q=;
 b=QN/zYbqBKxTSlDx3wy8+EaUJievJJe0VMYpX64WQ2YY4qjPijrL8z045NyNNHcxYg3/G9Cahb4ebjq9wSt0A0t0bz11PzZsXv4nZXxzuBHpL2pgz0p4crCqQDBzAHO3qNQT8Tzm7AlBrFjSSu40T+1oAc6yAa91lB500LagTtiKeKbfjZFQD8GS6Mkb/1pjdxJsf8w6SpUkte5hG9Mi90JboKHgr983KLDYPL8JOLO8CennoU3ahCwqhKfzCC+ErsUHsFhPUvn5BPX6MiiLmn/HU1RY3ZbvVhXYcF1boum+5I6y/vnmkfE5/wqz0eepC6d4SYaI60zQXb3vMGdbH2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU4PR04MB10958.eurprd04.prod.outlook.com (2603:10a6:10:581::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Wed, 17 Sep
 2025 08:15:41 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9137.010; Wed, 17 Sep 2025
 08:15:40 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 17 Sep 2025 16:14:53 +0800
Subject: [PATCH v6 4/5] media: imx8mq-mipi-csi2: Explicitly release reset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-csi2_imx8ulp-v6-4-23a355982eff@nxp.com>
References: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
In-Reply-To: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
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
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758096930; l=1321;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=WSeNJ2vBfSwzDaPzg+hoduxcBQCgpmYVWtYBnayHsR4=;
 b=3xT+W4lRPToP5qEDi2ozSQ6mRrJ8J0S9msvy+1smDXCAIQlcV12WKHPKhl8epGPWHtn7dwLyW
 WdhR5AzruzPD2+yk7gVKCETM9LesAfx0RbsX6sOU2gBtrmMWWoKID84
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU4PR04MB10958:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a5c694-db23-4426-a12c-08ddf5c263df
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZEJ0dlp3T3RFK3hGd3hhMkRld0JzWG1iUHNVMVkxRGhyeVlBODVadW96Z3BU?=
 =?utf-8?B?V3JncWxSSW5qUTFlQ01mdmpIN0t6WkJxOFJPUnVvVkEzaHFOK1h2ZUJ5d1RO?=
 =?utf-8?B?T25NK3hHZ2N5d1Y1Uk8xVXhJMjhieDhIdmpsdmZjZ1NpbXdGZHdhQ3BtQzQ2?=
 =?utf-8?B?YWt2TGVzTG9qQUZEOTNWeG51d3V1NkRjMHBpanE3SHNJWVp3VktGMExmSFVV?=
 =?utf-8?B?UW9leWlYM2N0aDZvbTU2NmtQWEpRZy9lbXRZQlZQa1gzRnhBRnpDaXc3T01I?=
 =?utf-8?B?bEx3OEFuenBzOVo5SDZzQUJrMThMaXNGVkczMDdrM21WekRLVm9pWHpiNjVj?=
 =?utf-8?B?cUY1YmlsNlhQZ0JoQm9WS0hNQ2Z2aUFXOWhrdXJZSzNwdXA4QkMrYWlRbTZQ?=
 =?utf-8?B?cFZIRis0Z0xEcnBBM1VMakRQK2h0M2lMelRMSGljTlB1UlVqWS9vamY2RkdO?=
 =?utf-8?B?R2tvMXlYK2FhdFJ4b3kvWjZxeVU4cHgrYkxHL1plcTFVUkVwMWc5MjZ4bkJC?=
 =?utf-8?B?TW9TbTYwRmtEVEFhUUo3L3lDWXViT3lrYXRJcE1jWXp6TlhVdHUyK0JYZWpw?=
 =?utf-8?B?MUh5UGZNWW51VDBNV1BqcTIwQk1Md2V3emFiaGY4eFpKVFdFK3lqa3hNU3FB?=
 =?utf-8?B?NW40MXFUMDhlWVAxS3JkS2kyWnpLL2ZIVzZNKytBcWZHeW5Rd25Sd2JqaldM?=
 =?utf-8?B?YVBxT2I1bjg1bkYrS0k5NlJXbEp1c0hkL1R4cTZVc1U1RkVmdi90a0t0QU9R?=
 =?utf-8?B?bTdtdFE1ckhZRUxxMTdvd1hzOGhKUnYzbXpod1lYODcxZEM5UTZpTGlYbG1u?=
 =?utf-8?B?bDQ3TWt4dnBTOEJqQkY0N3NEWlpXZytUY1hDNTB4SHdUbUVuYmNWZGNyRkVv?=
 =?utf-8?B?dXo4UmNWR0lMUXlGV3p4NEo4ekJrUmVhNlJuSmY1NWV6K1FoSnI1Sk1Tc2Ns?=
 =?utf-8?B?T056S09IRHJwZS82TmhnSDFSWGxKc2lTekNCR21iUGNDalJ2Qk5CNXNtVlpo?=
 =?utf-8?B?MlBjdDlVL1VPckladkFuWFlRNlhUQ3BJazQzbWVkNTVzZTdWRmRQSnhjcklu?=
 =?utf-8?B?MkdWWTU5QlV2QVNoNnRHcnZQS3dEc2pZOUhJSWxhNGdJSVhIWlFyREt0S3Vm?=
 =?utf-8?B?eFJMUzlKTUthenhJY1VVWXp6QnJ2ci94aG5kRjVKSVhGTXJQMnhYU2ZneVp5?=
 =?utf-8?B?b1AzRGM0NWVRTkhrdTNsd0JsMFdBWGIxTWl2aGxTZWhpK0RWYW9iWDBmemlP?=
 =?utf-8?B?N1VZakttMktNWHd5V0E4N0dXUnpHTDEwT2xXNlZWTzJFUDk0UENGaHJyandP?=
 =?utf-8?B?Z0hRNnQ2Wk42am9qRWt3c3Frb1p4L1BVS2VPTDJ6QVJpejdvV2o2djhsZzU2?=
 =?utf-8?B?a09ldG9DR1JCMnJGb05YNG1uaGVwV2Fibm1uVzRrRVNmeEdJOE0rVUVqMFNT?=
 =?utf-8?B?Nm03L1NTb1B4T1BicDNlN091L29nSGdsd3NIektyKzJTMzdJaDdJR1YrcW9u?=
 =?utf-8?B?TDFwanlaa1p5V3RERkR6VWhwd2JvWmFmaWtRZFpIbUlCQ09CT1ZkRHI0R1lM?=
 =?utf-8?B?WlNyc1pJSmtHaVZ0YldOWk8yQkFKUjVxY2JTdHVBUmozSUdUQmZhbUhBMWRB?=
 =?utf-8?B?WlJRRnRoeU9xNnNHdExmS05jeU44d0dpNWpwUHdvbXhWTlE1U0JBMmFpNURh?=
 =?utf-8?B?Ynk3d2xUbmZhaGh1Z1Q1MEhwbm5HWGh1eVJLL1VUSEo0ZS9QaSs5anJvS3I2?=
 =?utf-8?B?WmFWN1BoRjRkTUdTOEFnU01qYWdGajV6dFVBeXFwYk05UTlQUDNRN0h4V0VE?=
 =?utf-8?B?dDBGbFRYWWo3T2JNTkRUSytQbFprQnNlVDY4MHdSSkV6dUppN1dzbDE5OFVK?=
 =?utf-8?B?WW5Zb2JjdWkzTmhldnNzYmhJT3ZEYkU2K0x1VWoxdWdQWStpN3gzUU44Y1R1?=
 =?utf-8?B?ditYR1VSSkQwckVyeG9wTU9UaDdTMVRqQ1g4R21wUkR6ZTBIQjNvek16N2Ju?=
 =?utf-8?Q?Uzm86l9Cfx0JHztISfJq6Jz3T658tI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RzZyUm9iNVBvNzhzOGtJZWhUcnRDQXhmZEp6TnV5elRoNTRUUWJFWmxiSDM5?=
 =?utf-8?B?cHBBY2xvbk5yQk1KQnhkRVJacWw1UTdVVkFUUlhsMGlLaXBkajRQcUt0SjF2?=
 =?utf-8?B?cUZ4QUh4NmtuT2tybUFCWUoybHZYQmJLRnptdHBxZ0k2NkxPQkFNQ2RKK1d3?=
 =?utf-8?B?bjlyWnJyZm5oQVIzNzBISnpOY3V1ZzRCa1RXU0RiTUdWNXUzUWMvSmpRRnpu?=
 =?utf-8?B?cThVSGFVYnl6N2JneGV5b0hnV1k5ZnBRUGZWeENybm1KNUZXZEJITEQzS3Uv?=
 =?utf-8?B?RFlBUkFoeHA5MUNvVC9TUUZYakl2QWpCcE9pZ3Fsa3l1VGgvWmJCNjEwSTVz?=
 =?utf-8?B?QmhHL2ZFWFFLNHM1b2xueWcybjVsQVUxeTM5SkFmTVNVYmMweEY4S2Y2QTBu?=
 =?utf-8?B?WGhKMFZYMTZnOXVwTXZ5Q1h5OWZhalVQRURGU1BrcTN6L0tSUGVYdUhWNWtj?=
 =?utf-8?B?bXlHZHQ4WHZrZ1o5aDZtTmVrVjdTNmc1d0dDaVhGaVJaQ21qMjQyQnd5Tmdo?=
 =?utf-8?B?M1FaVFcvU000dkl4dmxRbnQ1dC82aUplVGVNSm5kYWJ5citkUlhQNEVvZFRV?=
 =?utf-8?B?UzdIRzhycEtocEQyWmE0SDlkVGEybGdVYjlVT1VseW1tbmw5ZGtzK2UvTW82?=
 =?utf-8?B?WGFJN3JDb0tYRjBSckF0YWNGMVhHVjRpY1MwdElleE85a01TeFhWUDNndTFu?=
 =?utf-8?B?MHVRZXJ3QlBrbXg3MW40NUJadkxnK0RjZGtGM1lmWTA4TUVQaVhvaWFQWjUv?=
 =?utf-8?B?b3RwTisvdC8wYTdQZmZIZndqenlrc3JqbC95bmJ6aGJUWXZ0VlJIQXp1U3Z3?=
 =?utf-8?B?U3VoRnk1ei83MHZYRzZMRkNyeG5JZTlVY2E0clpKeVlvREk5N0N5NDRsWStW?=
 =?utf-8?B?emI4dXlWVTdsSUovTEFuSjBoNUd4ODVPMWsyR010VUJyY3IxN1EzRTliS1ph?=
 =?utf-8?B?K3psZW53dUltU2dNd3BZT0d5bDdXcVV5NG5tWWVGaTh0UEQ1cE1yd0JUbEVt?=
 =?utf-8?B?M1I3ekxoSFNwaEZCY1phNjRjZ0VYK1RDVy9DQU1pdjRNWGVCYWJhMDQrOGd6?=
 =?utf-8?B?V1ZGbndZL3JQek9XbTBheXVxTkFzenZSdzI4MDByOHVsY0hwcnd5VktMNGxm?=
 =?utf-8?B?MlAwQ255MWx1SHFGdytLb0RPWUticktuSnFrVTFFUEwvdFlTK2ZPMzZuRUtz?=
 =?utf-8?B?RHl4V1NYK1d1VktLN1VjRnNlYk5oSkFqNUc2cngyM28xSTBXaURNQzVWeExY?=
 =?utf-8?B?UG5vdDVKM2ZYcU0rVGxVSHBjeU1vYXJrcGEySlZ2L3g2blVyd3BWSmc5NFhx?=
 =?utf-8?B?VW1pdjArZm9hUU1BNjVHOE5XZ24yZEtqc0xXSXBGWVE3T0lEZk9ld3dHeXcr?=
 =?utf-8?B?Zm1Mb25DMDR5SlArZjJGcEJCN2Z4bEtzckJZbTd6SndhVVR0SWNNU1dsL1hX?=
 =?utf-8?B?aXBHVDl1ZkpWQVFVWFI5M1BWZXEvSzM1eWMvU0tRQ21DQjBjM0F3OVpGSFhy?=
 =?utf-8?B?S2Y2ZFN4MVNmNll2aUhkRlVIcUpPWXlRTm5LdkhvWm55YnZDRnhwWDVoQTEy?=
 =?utf-8?B?d1d2cWZCTCt1TGNudmRaV1Z5Rm82a2VPSXhDYjdPR1F3SGRLM3oydVBKQWs5?=
 =?utf-8?B?d2RxOGQzZUR4UU50T3BHUTFBcGdQT3crWnd4Zzdldys4THlWRkZyQkVPTmgv?=
 =?utf-8?B?Y3BJQ3BVRFRGR0Q5clhFTTVudjFDVlRzUTVGaTlydFE1dFdPQmt1TjBHSzk1?=
 =?utf-8?B?L0hRYVpIR21VUkhCM3RubHJUV24xdUZqcUlVMlZqU1E5SS83UGtJMk9nSE92?=
 =?utf-8?B?amxqQlBGcUt4bHJtd0NCdHRzZXFiKzJpOEUwWVdVVHBOUzZNVlRqWm5rb0VY?=
 =?utf-8?B?TUNWYjJGMzlUTkw2bSswQnBicTExRUg1cm1VbnBOOFJGaTE4a1htVGZlVC8r?=
 =?utf-8?B?V1ZxQy9QT0tzTkRraUIzWXNRMklEcDFZUkhBTnlYNTJZOTVVNlp6eExvWVpn?=
 =?utf-8?B?R0ZqTmcwS3lQWklJWHdqU3VMcHVHVUhyVHQ1eHlGYll4NENpS0JNWWpiMU00?=
 =?utf-8?B?TkxqVUpCWjRJU2tJd2g3TUJhS1BwUTNkRzdnWERtb1I5ZmVVTzN0OXRMOTBy?=
 =?utf-8?Q?h/BkaFw2lkl+CWZppf/cEkEiU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a5c694-db23-4426-a12c-08ddf5c263df
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:15:40.6643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgT4hGzoAvDRPTdCyrJZwNBR82htyKZclbdJU85hROaU4Hobfx+n5oYJfxnpAgY1hS1gGBNcflLgo+j5NN6uAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10958

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Call reset_control_deassert() to explicitly release reset to make sure
reset bits are cleared since platform like i.MX8ULP can't clear reset
bits automatically.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index fbad197733eef2e4ef44366e39c3d930d626ce70..4da5acebb7020cc23b77c1031c0b53a229d7f1c9 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -337,18 +337,14 @@ static int imx8mq_mipi_csi_sw_reset(struct csi_state *state)
 {
 	int ret;
 
-	/*
-	 * these are most likely self-clearing reset bits. to make it
-	 * more clear, the reset-imx7 driver should implement the
-	 * .reset() operation.
-	 */
 	ret = reset_control_assert(state->rst);
 	if (ret < 0) {
 		dev_err(state->dev, "Failed to assert resets: %d\n", ret);
 		return ret;
 	}
 
-	return 0;
+	/* Explicitly release reset to make sure reset bits are cleared. */
+	return reset_control_deassert(state->rst);
 }
 
 static void imx8mq_mipi_csi_set_params(struct csi_state *state)

-- 
2.34.1


