Return-Path: <linux-media+bounces-65586-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ioRjE2FAPGrNlggAu9opvQ
	(envelope-from <linux-media+bounces-65586-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:38:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 982986C1376
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:38:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=qoXLsREQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65586-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65586-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC92630453A8
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 20:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388E33E1233;
	Wed, 24 Jun 2026 20:38:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CBA37472F;
	Wed, 24 Jun 2026 20:38:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333524; cv=fail; b=FOrjoqgSRADPtB8LuQ/kNUUaf5FtxW058xk1S5toJgI+Lgzw/cujiCLu9t7oYq5vP6PgmYC5kmC3IFwIXfPEVDecEvrCUzNxgoyyAlxa2daa7h6KP/K/b6nyT3jbzAzRYewrlKNmnJpUnZwarw/C5ylXGyuT/jJ4neH/l/qOAdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333524; c=relaxed/simple;
	bh=LxDs34nRK4/bIne8Q5gm49cfE7k7r+Q/Lnr+1VdgzL4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=sgHawEW60CbcMJ5YtuuWCjDB272701pcI5SE1Jw7VMVXMngvZbqRYOEXDhfUbgxiM+Tm0RbU7ZskMGC9cT/TPWAuK8QaTo5ZciZ1eCa48MuxyGJT9e7dtwPWjXhU1i1ynclATz1Je9/Wp8kASCp+pmyIhqVD7+FpFIDlaayfmiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qoXLsREQ; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hly2yXeOUKZ/pLSzVXCpB8fQSsW3r/GS+ZCbBMf2504RuK2UtqwwiniHNYbCAUpq4HQv2ZUZ0bWL3JFBhxphl6K2tSlmbRxyPUTyyX8SmviKv9DvYre8DoRHtuPNZszyxl6UMmRjlNlWifzP4TA70v2M30nMtiCz1XDfYfzlhnjU4FOvAkS7Pf3Y7OCY9dMHf9ilRvzaPuw/xC8c2DJDVrURHqJmG/m6dS4nLXpzs+trEYD48y5kxKP5EknFmtx9gZq0Mw9SbBaGnTk1sy2JZKVQ725J9mhEZIcMvtFy+thbamrNgN29z5/aCU/RMJKJiiKlMgXYguYt2JPiMXjb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqSW9t1zPm7TS3HwkWOj73cx1GbU+9BfUbAhP9l77UY=;
 b=fOTfxLo4VyGO+C22Ep3xt2sliftCzVnzFDcSGBMI6jNkRed68Smt8PmkOycz6pCeGn7OK13DKcKlBLVUr3f9QLflKfiRiNti0Ec7zdY3uC2+E+1lR0BwJNlfr/xtlLR42WV1fmDYKhqHBf6J/ruDAAKfgBo9ZxNPDAu5FTsTTL54vu4TxogmRjz5NhWoLm7Tm7tc4nILvaTCO/gRPIkHLHr8KtiL67rmnAA+eEavlmDEZ77VKhZRxp1lBRf33YHJ3JwqLNXO0XcB9HRMQRFGt18jTv8Oozm5bc+BVbtqQjkz77EBm1YsWSXn+izMPIYRG8glxmj97a9rIbfQZWXHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqSW9t1zPm7TS3HwkWOj73cx1GbU+9BfUbAhP9l77UY=;
 b=qoXLsREQQsKTGAz5kgieANWa1XH6xaNhxqDZMRH8IOP91NdCqQPRGDurgm0799CS5xp8ROhQBZ7QPZ2YLmPPtKRO1mHaLKFEDYwRxIgrukat/koUJnh4e9B9UGFtH50OmvKlVm4xrgun0RpRGtBWtxoU8J/oYSc/sgB4c4oA3V/55AoZbjM/Fv46UAI5EwDKq28YRoJcveHNjvPEsg4Rl17tuq9YO+n1lE5x9z3Aqh7xt8cHXuUGHyf/n0pdjQ5wzKEzimX91AHapZcJRuWWGX+rBzg7qI9sl24N9c0TDCxZptM57y2UMMH4xAm7Gvb38R01Q4sI6ysMAcVqKcZV7Q==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11335.eurprd04.prod.outlook.com (2603:10a6:102:4f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 20:38:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 20:38:38 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH v6 0/9] media: add new API simple 1to1 subdev register and
 add imx parallel camera support
Date: Wed, 24 Jun 2026 16:37:47 -0400
Message-Id: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABtAPGoC/13My27CMBCF4VdBXtfI9vgyYdX3qFBl7HHxIpcmV
 RSE8u41CETw8hzp+69sojHTxA67KxtpzlPuuzLsx46Fs+9+iOdYNlNCGWGV5bld8HcZvofgWx7
 RSAUIGgKwQoaRUl7uua9j2ec8/fXj5V6f5e19hEC8h2bJBacQImBsGiXkZ7cM+9C37JaZ1Ys6A
 RVVhUrEE6FJwqaKwpZiRaHQgAaAtDCxpnpDVVNRXaiOKXhNUSV079Q8qRVWuoqaQl3yNiC5dPI
 buq7rP1VCKAOSAQAA
X-Change-ID: 20250626-imx8qxp_pcam-d851238343c3
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alice Yuan <alice.yuan@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Zhipeng Wang <zhipeng.wang_1@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782333513; l=6184;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=LxDs34nRK4/bIne8Q5gm49cfE7k7r+Q/Lnr+1VdgzL4=;
 b=Odnm3cg9RW8HXQJjly2o+dXcHmpIlYt8rYVF6/w+RvCQ+E4UO66wqFyEBTiP9lt3PolMK/vZ/
 89o9siOmzKyBWG6AE0uUOR9UmWSfjaNw1GPzB+iy93x9WDssCxbGAtH
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0164.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11335:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ebfb55-4d9d-4c0f-b60c-08ded23091e0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|6133799003|11063799006|56012099006|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
 Bjx7Nrd+9XhOZ5j1IRLsvb47ZN20zU7YFb5AG5rGHhxU/SBovsY6lKXzt3S7m/q3+W8ejhocETWPMFbZaQ0KvoMFx8n1s4I8ysFKmnufd0euMsPAQq3xT3c7x/1vGfP8D5VMdYN4CVhE1UPPE9KJG9Qn2GAfD1rFCr6txi69sG31olE1RHGV6Im0kb9neqws5yjbaHUuhSXuoqD6VCHxpnw9/TS245CM6lvAiMFgs23At8n9K+oS5sk9TALpM4sKm7wHRw/WoIxg77CWIqDrWBbC42GphDTxPHTqYuQ7UU3o4bju0V01yJT+ACwnBTde083BZ8dE1DU/ton5T88zg0CA6UTn3QJLLoLGjPuAqz/QKB4yD4mqxtAAoSqKfuq3gwyIihkjcoTIuaN0/YemBC1kS7TuE5ggtCKg+oj37DDxXWBTdMXElFyAkMZZCtYbojm3kpwMmlv9w7TFwnJOeckv7Umb59UM3o5iqsyk++UG5KYw8aBO+OVj1vpHCZdtm1ny6ibdlMTxcJBTBA4A8JqJUeINnCNPDObX3WnL5m0J5KD4heH9yKxoHmOLqRz/7Qp+jhVBpidKWRc+dmcTV2JLv8rEXs7nGnWrjXg9+ZTWeS0mt8vXKowF7qX8Xlbq+o6RYm6ntAgsq8v24aqNesNSujbPGqAexDLKatDpieU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(6133799003)(11063799006)(56012099006)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?d1dpRjJPU2Q1M0dYRWpuOVIvOGZ0ZW4rT1QwQzgrU2NGeFhjRHJUWHdlQ0Vm?=
 =?utf-8?B?YmxZdGFtU2dpMGFBcVFtNlM4Kzd2eXJiUVA2cTY0WWhhc1ZZKzFvdStyYnZP?=
 =?utf-8?B?dmxmbWFCc3l1ZEQ0R1k5MUYzcVFSeGZWRGtVT2kzMVdsSzFaUHRpaUlsbzNm?=
 =?utf-8?B?WFV2K1BpSmVqUlZKU0JpZ1BGcHJpM1BqdzVkdW5oTlZtaFY3ZFp2cUNjZ1ZF?=
 =?utf-8?B?WHV6ZmtHTGltTlBaOEp5bDMyK1dFeDJVbXZ4WUZiY1ExTWRIVjdpMzhzNHpT?=
 =?utf-8?B?SnFQVnVjRVNydlRYUUE5bkZLUzZYTDh0ODJkL1ZrZ1gyZlo1OTdtZXR2YnlS?=
 =?utf-8?B?R0tsRmpiZHdNc2FKai9XQWZRNnF6aitySGpsOHhvS08rMXFUQklyRFBRZHpj?=
 =?utf-8?B?ZTNQVjdaTWpiSStuNEVlMjArM2pnNThkQVhHVVpka2JVM3ErdllNcDhxdlBa?=
 =?utf-8?B?RW5iUHc5a1BiQnRZSytQQlM0V052TUxPK3NYaUROaUNtbmxBSjBuQkdWWVR0?=
 =?utf-8?B?cmZ3WFZZS3RXZWJXeHY2NkVxVUNhRnJXcUpRbmExdk1TUjJ3S1U5UVRwNVhU?=
 =?utf-8?B?Q3R3cUdSVEFYRmRZa2NHUktKKy8zK1NLSlJnb0RuNFViYUxSOG1LNkVLbUFY?=
 =?utf-8?B?SHBwWE9pL2NRbjVlZmpDNm50MXl4SW1FQzRwZDVDcmh4SFlSVjRnQ3B4b0tN?=
 =?utf-8?B?RjlnK1BZR3ZwcjIybE9Sd0JFdkRUMlI2MGQzMThkVDhwMDEvN2dFWEdSd0ND?=
 =?utf-8?B?VWlsVGdCK1d2OE1UYk8zYUZHeXhiMnhwNVFIbzB2UTlId1B1KzM5RmFwOXRP?=
 =?utf-8?B?ejBIbDBjZURMU0R2NXJnMERsVDhRZG9TMmtwMUMzS2dpcVRORzNsTXJyRlNx?=
 =?utf-8?B?T211NUVrd1h0RTZrZDBkWjRpaXFzbEhsS3Z0Mmh5aURtUXlNTFJFZDBtOHla?=
 =?utf-8?B?ZjEwYU9mVmZQNldiWUhoZFRSTklDUkxqNTZadGk5aHpKVUZIWVozbU1OdzMx?=
 =?utf-8?B?T2ZXYnM5TVNZckY5UXJsWm11eVllbGZJSTZ2SzBOQnpzbkdTb2UrN2JRM1Nn?=
 =?utf-8?B?WXM5SFljMjAwa21EQ1VkMFgyY1RqRFd3SVd0OElNZzZ2c1BqSEdoTnFTa2x6?=
 =?utf-8?B?MjB4UGJ4SHpENUd6NHBxSTlwb0dFbHUrWTlIR0NicDJPdloySlgyNVlKZmg3?=
 =?utf-8?B?ZG4zVG8yREFQVGlscG40K3dkRm1nMGZ5eHJvbFFiakxTOU1ZOTNENDFQSmd4?=
 =?utf-8?B?VW9Gc1NsRlMxTFBIdXUyVW54Mm5QcVFWd0FHNVIyNnRWZVpjYU9RUzhLQWND?=
 =?utf-8?B?UEt6UlhwRDVtd2JPQmJBUEFJTlF5TkJmRUU0ZnMwMyt2eWJKZVVTb3NJT0NP?=
 =?utf-8?B?TzZNOEE5aXZOUDJDSk1Cd0VNcGpobkQwNnc4SWEycTlnMGpBV2E5ay8zdXFR?=
 =?utf-8?B?cGk5emNtTGVWSFhZa1pRN1EvaHZ2MGVrOU9pOTl1VjVOSEo0bjZ4UjY5QVJz?=
 =?utf-8?B?K29wSUQ2Rm45MFRzS0pyRUE5d1NlZnhXdnU3ZEFNSmN1NUZ3QTlIR1FzL3dv?=
 =?utf-8?B?bHRTQ29CSWpxUEZ5dnlsZDZvOUxhRXNnenBSU3JUQzhnVUl3SjBscmlET3Yw?=
 =?utf-8?B?ckZMb2UwNXJxRlY2S3RMUmYwRktVRWtTRUlSV3BRYzk1UXkxYjV4MEU1Wmpk?=
 =?utf-8?B?eDFpeHVUckY2dnBDOFVyZGtxeFFmVytSM3pTeDFMNmZoRjdvUHhNY2dIaXJa?=
 =?utf-8?B?Y2tDeFpmVmg3QXJkOXVkMkR2RWpKSTJiTVZMNVpJRzBvdkd4TFBVRG5IbzVP?=
 =?utf-8?B?UVJHUjdNSWlmelc5Mm1OVnlXVlRLYVJBVUh2RFVzTHBCYUZIeEpvaDhCMHhv?=
 =?utf-8?B?QWpWbG5jS1hhRnFWYUJLYkZTZHF1Ymo1c29SL3dpTEpTQ0hhZFp2UGtYck85?=
 =?utf-8?B?bUtnR1ZOK0xuemp6NTBBeDJpYXNMR0tURkRLWENkaURGcTZpNDJ3RkVJVlJW?=
 =?utf-8?B?RUREdS9vNnhRVktoWVQxY2gxWjJUZFdkNTZLYXoxNC9SSFhoekttVUIwMW03?=
 =?utf-8?B?d3g5R1NzKy9ibzVxaXduNjRpOXpRZUJyMG1VTEx0SXltcU44R3VEN0RHaVZp?=
 =?utf-8?B?RUZpNDRsVTdxNlRFb3FodkJ1MGRtRnRjTVZ4bEdDZFBJZnk3WitySWVtZnB3?=
 =?utf-8?B?dmsrT1M2bEhSSUV4eDZNbEluQW5QdWlic0VXbk9USkpnRktRd0RWTmxtMVVF?=
 =?utf-8?B?WjdNa0tHd1kyRmoyUVZFUHlVTGdTK216M0l4Rk16Z1RjUVJCQlI5dlYyTUlH?=
 =?utf-8?B?cHVQWmlGNTRiUXpBMVgvYlgzUmhCL2x6VSszYUtybzg4QzBYYko1TzRDQWx2?=
 =?utf-8?Q?KRI+UhqfgtQCwUg7HY/kEOMP6XzkSX1B8tfLZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ebfb55-4d9d-4c0f-b60c-08ded23091e0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:38:38.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ldg4dXGJ7mDOrnl18xDi5jMMqTwVZA9HtOBIEUt7xf6NKM7iDAEEh9NfrWzT5tOq91kNYxjEok1ZiWkMU2lOy1+kCvA0ljiAPHRFxVhlMM8RAGG6OMINSiQAaYcJE4tv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11335
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:alice.yuan@nxp.com,m:robert.chiras@nxp.com,m:zhipeng.wang_1@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65586-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 982986C1376

Base on patches "media: add and use fwnode_graph_for_each_endpoint_scoped()"
https://lore.kernel.org/imx/20260624200237.GJ851255@killaraus.ideasonboard.com/T/#m7969735b6c236c6b3abc16b9f3f55ec0488dbe89

This patches base on previous' thread "media: imx8qxp: add parallel camera
support".

Add new API media_async_register_subdev_1to1() to simple 1to1 subdev
register.

Many V4L2 subdev drivers implement the same registration and media pads.
Assumes a 1:1 mapping between firmware endpoints and media pads.
During registration it parses the firmware graph, creates media pads for
all endpoints, and registers common asynchronous notifiers for sink
endpoints. These notifiers automatically create media links when the
corresponding remote source devices become available.

The set_pad_by_ep() callback allows drivers to determine the media pad
associated with a firmware endpoint and identify whether the endpoint
represents a sink pad.

By centralizing firmware graph parsing, media pad creation, notifier
registration, and link creation, this helper reduces duplicated code and
simplifies error handling in V4L2 sub-device drivers.

Add media_async_register_subdev(), a helper to register a V4L2 sub-device
with the asynchronous sub-device framework.

This reduces code duplication and simplifies the implementation of
simple bridge and converter drivers.

    In subdev driver:

    your_device_probe()
    {
            v4l2_subdev_init(sd, &dw_mipi_csi2rx_ops);
            ...
            return media_async_register_subdev_1to1(sd);
    }

    ...
    your_device_remove()
    {
            media_async_subdev_cleanup(sd);
    }

This API help reduce over line duplcated code in synopsys/dw-mipi-csi2rx.c.
And use this API at imx8's parallel CPI driver, which over 90% code now
hardware related.

And also benefit on going pix format patch
https://lore.kernel.org/imx/20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com/

It will also reduce missed media_entity_cleanup() problem at some error path
https://lore.kernel.org/linux-media/20260614202835.11977-15-birenpandya@gmail.com/

Previous do partial simpilfy at
https://lore.kernel.org/imx/aaisdJSsFE5-PLx1@lizhi-Precision-Tower-5810/

To: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
To: Martin Kepplinger-Novakovic <martink@posteo.de>
To: Rui Miguel Silva <rmfrfs@gmail.com>
To: Purism Kernel Team <kernel@puri.sm>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v6:
- Change API to fix more width user case, assume a media pad have one endpoint
on dts.
- other detail change see each patch's change log
- Link to v5: https://patch.msgid.link/20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com

Changes in v5:
- Add media_async_register_subdev_1to1() to simple code.
- Link to v4: https://lore.kernel.org/r/20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com

Changes in v4:
- remove imx93 driver support since have not camera sensor module to do test now.
  Add it later
- Add new patch
  media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
- See each patche's change log for detail.
- Link to v3: https://lore.kernel.org/r/20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com

Changes in v3:
- replace CSI with CPI.
- detail change see each patch's change logs
- Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com

Changes in v2:
- remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
  because pcif controller convert 2x8 to 1x16 to match isi's input
- rename comaptible string to fsl,imx8qxp-pcif
- See each patches's change log for detail
- Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com

---
Alice Yuan (2):
      dt-bindings: media: add i.MX parallel CPI support
      media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)

Frank Li (7):
      media: mc-entity: Store parsed V4L2 fwnode endpoint in media_pad
      media: subdev: Add set_pad_by_ep() callback to internal ops
      media: subdev: Add media_async_register_subdev() helper
      media: synopsys: Use v4l2_subdev_get_frame_desc_passthrough()
      media: synopsys: Use media_async_register_subdev() to simplify code
      arm64: dts: imx8: add camera parallel interface (CPI) node
      arm64: dts: imx8qxp-mek: add parallel ov5640 camera support

 .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 +++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/freescale/Makefile             |   3 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  83 +++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
 drivers/media/platform/nxp/Kconfig                 |  12 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx-parallel-cpi.c      | 629 +++++++++++++++++++++
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 200 ++-----
 drivers/media/v4l2-core/v4l2-fwnode.c              | 155 +++++
 include/media/media-entity.h                       |   5 +-
 include/media/v4l2-async.h                         |  39 ++
 include/media/v4l2-subdev.h                        |   5 +
 14 files changed, 1140 insertions(+), 160 deletions(-)
---
base-commit: c425f8be0326d40823cd93cbca633872d099df2a
change-id: 20250626-imx8qxp_pcam-d851238343c3

Best regards,
--  
Frank Li <Frank.Li@nxp.com>


