Return-Path: <linux-media+bounces-52545-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHA0Blymi2lOXwAAu9opvQ
	(envelope-from <linux-media+bounces-52545-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 22:42:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC3911F78A
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 22:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0469A3052359
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 21:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F99633858B;
	Tue, 10 Feb 2026 21:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aW1x+Yfz"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6789F335081;
	Tue, 10 Feb 2026 21:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770759765; cv=fail; b=eNru4eiNz0tL3Cm34QDiFyYx29eU1PtrMnNqrgxi+qjha8oFeTUdzrUB7t5kxzKy9U4P3FH3VWVHtgaTxQPMu159FwcUbcGrCoGpg/frLOxraDYqP7c/rVqmfESU0CSAGd3V5gLj9XS4LQ/QQuSMoZCSftKNkqoWhzaK6B3NDA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770759765; c=relaxed/simple;
	bh=rjy1WjXsfgMziQbBkTU1FAVllGBX7Y8R2Ui78vAjlAg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=O9O4XuZv3NtfCbJyQ72/G4TwDgkYKRESrwuOaEOqDZt7shoYCAwbqHqgxd7JtbBTWpvSljSEyf0yzZ3cUWcIJjGSHlB+iJGYsdy5/3jXfdk1yQcfCdOkaNrp1RT5bQGTa7QwZgw0Vl1uMGvrkYKpOu4rDXk/3oBpwtPLFq+GbVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aW1x+Yfz; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPq0byaHmgX0UCsPNlINQ0SYtLB4uJQ1pJj++uPY5fBDpA+gzZ3XrYh5O0Y5xwHfJPk777KKgz3iFzvwp1jktq6BIYK3A84zjRlsPNRRNT2ECUV85Z0uPdstPxZ/qcZntoNEsuPHwFAvqCmYCxqOreNyWGJJdkHViiHhDeryabKDdhq4ZGKv8RbiXV5G138dI0+NTLA/v+14W/e8Cia3jRCu4zdLqLbjLjiCo7QQpuQysDwzd5t3fQEGejSXe2qPbRe6mH9v0oCdE1ewMrCwCZEbDU7BG7etCzJfdut/E+GOYcrWJNle/k5438Joy7Fh2IkC/XMxThTzs12/ht1Y4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yH0cYpVCf88u+nsnUEzjkjhgOXm3zpyJGkyRwT+Y3/o=;
 b=nJQghui/4ry4DKPe5vPz36/FoU9d9ZOD0eaQ3PeS2DOA70Lj5m/0jJBlvjFxivRWvx6+ep+iBT2UmT4STfbmED8HWXlVd/G0Cq5FJY0GdtkUr6AiqkDdW9yXhL6jUNNk6cp0xs18tvhDfLMLX5p+7D9w1kZ5T6kMpZlLrITk6TN9phVc6y+2c6EKMXRl/E6h+2mtrPs/f//BuRWY2LsF5rlk1aqgqCtyLvVZUjgK5B45qdvgT8Ls+MzogkKYTwjmVb2q66hRKACb2+gHD4L6TDt2ZtbxgXnz6K/vNfMAnvOELHbLWh3oWbykZzo5Lpl9IlYG5Uyu3RtLw4qX+O0yKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yH0cYpVCf88u+nsnUEzjkjhgOXm3zpyJGkyRwT+Y3/o=;
 b=aW1x+YfzuAw++Z3f5JmizqXflbY3Db23q8/ROTF5hkvPoNoEl2JY3W+N07mNyqjpJS0qFPucQAhtLpKLazvL+QKb4WZJRklRhMbJKETk26GBeB5ww3NVTkNx0Se2bxZ3bad9o2yoP44wIDdouEKll9eCv0J/Z5SqwjIVwJ2ItKzL9sHizzuyYFR/Yh/jAwYZXKNYYHBkzlRKi3VyZKwVd8+1vR21u8rkpf5oR0G2gsOPXj2UZ+OLm988Fl/Kmh07tWQT4iDJRKTBPtI/QOxAghFdoR6UPBNdQGCE3y/b4r64+5+ZjbFIojD1AcQjihftPzBN+YOvj8kW+AUq5H0+zA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV4PR04MB11401.eurprd04.prod.outlook.com (2603:10a6:150:29c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 21:42:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 21:42:36 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/3] media: v4l: async: add helper API
 v4l2_async_pad_init_and_register_subdev()
Date: Tue, 10 Feb 2026 16:42:20 -0500
Message-Id: <20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADymi2kC/x3MQQqAIBBA0avErBPGIVx0lQiRnGogLEaJILx70
 vIt/n8hswpnGLsXlG/JcqYG23ew7CFtbCQ2AyE5JIvmHg7ykqR45U1yYTXILmKIyxrIQgsv5VW
 efzrNtX69NeaEZAAAAA==
X-Change-ID: 20260210-v4l2_init_register-0e6d0adcfa21
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770759754; l=1178;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=rjy1WjXsfgMziQbBkTU1FAVllGBX7Y8R2Ui78vAjlAg=;
 b=Zevv/1QnsPVWzN1Wq2VbyQ7YSKLFYR57TldRQFa9PaHd8fRmV0L4NgmxcIzn19hcoEU6CgYJz
 9feUgz+bK3cC60EC4HlAjPLP57ljGOX9G1ewySarCXLY3En0O5PefY1
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV4PR04MB11401:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d12f71-333e-4074-4d2a-08de68ed4e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Um1Bdm1KOWRrVEg3SldWUm5qdVZrVmU4Tm1TQjVHWXZXNXZZSjRWWUYza3kr?=
 =?utf-8?B?S2tzdnkvZXk0Q1Y1MnNRY1lJZW8xbEVZUzBkTnd4dnR5dThyYjNXVDVOMUpy?=
 =?utf-8?B?MlEwSnVSSXF3SGFreDJBWUVPZE1MencvdEhYK3VRb1BuUHprdTZoYnNNZjlO?=
 =?utf-8?B?M0lPdklBKytIUTJFSFJjRXNrNXkwRWRocjlEYitZbjNLczRuREdrMk5QVmdE?=
 =?utf-8?B?L2dUSVJidHdYNFB0eXNCM21XMjBHazM2eStIQ0RFTnYzOEduOThFOGhXbmo3?=
 =?utf-8?B?cytmRmJIV25RZU4rTDRyS0lVQjNrRkY3MEZ4WXd4VWgzS01mWGNwWERsUUhC?=
 =?utf-8?B?WGN2dmt2K2dqV2QrbUpHajVjdkpYYUVpdVRkT09qQ3VnOUtwKzBpNGJOZ1pD?=
 =?utf-8?B?eUpDRkxjOVJGNG1KOXZpTkxNNmQxSWxMQ1VMa1ZGMXVlWi9aQXoxamRQK043?=
 =?utf-8?B?RlpKb1V3aG13RHBvTHNqcVZvcndZTFNuVjArTGRjNTM4NW9EUnBmcmFUNnJq?=
 =?utf-8?B?bTRBZjJMQUF6b0MzQk1qVERyRnAxYkhSTXM5aGdFNFpjb3VPMTlEUUhwZVg4?=
 =?utf-8?B?QVdEc0VwaDluQkMrbUVkTXBZaE5uMmpneU5xZjRIbHhsdWUrTkVZK0tBWDIx?=
 =?utf-8?B?SjVJQ0tQbUZ1VldoNWZ4elcvYWkzZ2JkYXd0NXFVancrcFd0VFdiYUR3MUxm?=
 =?utf-8?B?aWVNMXo3MWdCVDIzZUhCUDZjeThnZUtqbXhrRTdkVjRyb0ZtM2hmeWdVcFBP?=
 =?utf-8?B?OXZiQzhNSU9Ub0Z2Y3plbUxJMDMrSFVhaEh5a2NTZ0xEdTVnUDIzRUZULzNn?=
 =?utf-8?B?T1BSeDRYWThYU0tXeUFpV2JjVHdXRmVEUFpZbWJpelIyUXpwMTdBdEVlcU9p?=
 =?utf-8?B?bmZIeHdtZCtFWjRaWC9QZm5FZEptYXBGMlZkbWlNRHZ2YWxzeDFmQkpRcDY5?=
 =?utf-8?B?UTNrM1RweDgxaUVSN0poWndYd1RJWTUwdWJsWWFQNmtzU25OMDhrUEc0alRU?=
 =?utf-8?B?N0wrWkF3TnRobFgrdS9wYnY5UFJjWjd4RUJ0UkE1Qmp4bnRKWDJ6b0RIUXlk?=
 =?utf-8?B?Rk8yLzJiRXBpK2lQS2Z0b2xlUkFSQUo4NFY2L1RUblR1ZGpRa1pDdSttZmRt?=
 =?utf-8?B?WnREV3NmZEd1SVc5cmJRajhMTGVpbWlaWjJwOVhlZzZZdm16MnVmYnJYNnVB?=
 =?utf-8?B?dlBqQ2phWHJlYkw3ajNZa2psNXBlWHg1Z0hya2hiczJOQW10Y1hJV2ovVVZY?=
 =?utf-8?B?T3Foako2S2EvZDcxTFg0M3F1NkhzY2dtTjdxb0QvRWhocjAxbG1YcjV1Qlky?=
 =?utf-8?B?MEU3emxtTFkwc1Zzd0dCRWdhNFVuRGVaM2dJYm55T1ZCTFFNTnZjQythMzkw?=
 =?utf-8?B?aU42dVhHME80cHByYnBPN2s0U2Rqa25IVStLMk84NzRML082cVptTUtyMVk1?=
 =?utf-8?B?bjFwNFZwTDkrMVZoekxObkVqQ016TmYwd3Q5eU1ZQllMVWVJRXNTdXBqTXFX?=
 =?utf-8?B?VEU0SFRoSHVpUzMxWWRlampGUjZIU1V1TU1NaWdvTCtzd3VhZVRoM2lLYVRU?=
 =?utf-8?B?U3Z5amFiU201YVlOZElYam5lY2t1anV4c2luMnBPdkxDcmZta3lYRjhQSmhu?=
 =?utf-8?B?M0VJTzhQQkZpTjhkOXo4ODNqdUZDSDMxdGlsMEkycGNVU2RLQ21kS09pd2xk?=
 =?utf-8?B?ZENhQXVvYkNNNjRUNm5XcVdiMk9PeENnTTFYeVBKbUk2bEdOMnB2VnBrMjlK?=
 =?utf-8?B?bjBLdDFpelRITU1tUnB4aGtUQUNVV1dod21RbXhXTC9ZakxBbkY2Y0ZPRW81?=
 =?utf-8?B?b243WnZuY0hWYlA5SXhZclVDWWo3QTk1N2gzQ1RHUGt2WDFPbzgyU3JyZzd2?=
 =?utf-8?B?RXBjVkdleXdRdUdCYkpoMGszWnZtcVBseElpc1NlbWFSektIZUl5V01sUEEr?=
 =?utf-8?B?MS9SUGZmUzdlZDNqMXZ4eDRtbkVWMXV2V0crTGxHNFR2enV1NllucFlIaGJq?=
 =?utf-8?B?ZG9vdG5tTW50dGNGQkNaWVFJaGR6dXBBaWtOc21HV1Iybm5KelcrZnFMYVh1?=
 =?utf-8?B?Y3pRa2xiYi8wRkZBM1c1c1M2ZG9LcklsMkNjSWQ2M0VEV2V6YlBPWGlCL3Zw?=
 =?utf-8?B?NXNsUlZFMzNTemFZR21BVlY0blEyR0lZWlBENllnYVZaUW9UQ1JYdVZROHRL?=
 =?utf-8?Q?S4G6iQIc5bOUOLaMPLHgXr4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTNhTkJEK0x1ejltWDNNcGxQMzhacWF0cGVJQmk5RmVRSy9BZjg2OE5TNTZF?=
 =?utf-8?B?MWFaOVkvUTFzTEZwRy9TQjg5VGdjenIvYUpmTURza2dJd0RUOVF3aHN1NGE0?=
 =?utf-8?B?cThQVHo1TmJGcTFhRk9tWkJSWmdKb0tML3BtOWlTSHdkTCsxNWJla2NWQVli?=
 =?utf-8?B?Qk5wWTZxenFRTS9INkpld00rOENBYVdiK1pxZGE5dmZkWVROei9lRkQ5ekRm?=
 =?utf-8?B?WHV1R2NjbmIrc0xUWlhYZ25pN3B2K2JBTFVGVDFNeHVJYm1mNUFPVFZKQWVY?=
 =?utf-8?B?K1paN29yUFprczYzL1hTOHNKUEF4WGtqUmpBdUkxNzhsallZVVRVYUpzZWVZ?=
 =?utf-8?B?alkwZkU2eVpmNzl5RXIzaWdSNWc5eU1sc2g5MnJlM2J2bXRwa0hwOHdPVEFJ?=
 =?utf-8?B?OUt1NXBxSW04WWkveHJJU1hva0dCb2Q4V1BRMENhYmk5VUMxc3A0blBBdVJh?=
 =?utf-8?B?TUlHTTNvZTB5ejZwUkgvVllKR0prS05sNVhDbmxWQjlHR1NtdVNtcCtIYmJa?=
 =?utf-8?B?blFLU2s5aktlaWdPOXI5NlZXbFIxcXJaT1dsdFVxYUljbW4xVGpOQk0xREw3?=
 =?utf-8?B?eFJBeVJHcG1XMjdFTkNKL1JJcGpqWVdRNVF5YXg2RWVZVUhqN3JqNjNjRWxo?=
 =?utf-8?B?cVFIQy9heWk1em44M1VKUFhtK3lrVmkzOEp0cjNtd3ZsTUtZV21OWU9FUDd1?=
 =?utf-8?B?cnJ0WE5nN3NoYlM3TVlTR3QyZUpiOFN0dzNGbHVCY0laSUE3Sk9MTGZqVWsw?=
 =?utf-8?B?ditjR2pvWmJBNmN3Q3Jnenl2RjdhaUZtR01ZQUtEWjZLeUtEZTJXbmtvN1Yw?=
 =?utf-8?B?K2E0bmJXdWp1ZWlXUEJMam9CQ3g4ZWtkenljbmtYMEVFckFDdExudDFXTjZD?=
 =?utf-8?B?bjBNMXdNd0VIY0k0SDVXdG1Eak1zY3BFK1BSeEFjOFRXZXd2T2NGUlFWZCtv?=
 =?utf-8?B?aHR4YmQ2ajVhd1RaYjFKTy9uNGIySXJCSlB4M0NIZE9sczg1MmQwdXphK0lY?=
 =?utf-8?B?cStjdGNsbjRyc3RHZjZrdU1DOHBDSEp1MkJreGF1bUR5ck8rYzNKeWkxSWNk?=
 =?utf-8?B?Rll4WVp2RlZpZjBXOEhlUGNnYXVMN0pKRHdmR0I0RDN1bHRLenFQcTJIQ3Vl?=
 =?utf-8?B?RVk2L1daRFAxdjljQkNQMU9vNG9TdUk4bnpJRFM2MllNemlQb2N2YzN2MC9G?=
 =?utf-8?B?a28vaFk4MlRuVlJ4RGVtc1R2QUJpOXpyN0NCeGpVcGs2QW1nTzNOeUFwQmxj?=
 =?utf-8?B?NzM4emtGdEF1Z3FWZlpWVlRlcWtuUmR0VGNQZzFJNTArRG4wcnprSzYzWFJa?=
 =?utf-8?B?Sk9rRTRYdnlxUkMveWxTd1A0cmltdWdSNjM2SU1iMUh5bnZwVnJwaUVOdVVo?=
 =?utf-8?B?ZnkrZkxHc1Q3WjBVSXl0bllPbExpZEpMTHZjR0dMcjNkdjg3a3Iyand4ZFMy?=
 =?utf-8?B?cnJveFRwNW9sVGdoMS80ZjFhWUg5UUZNcTZjZzdKWXdKWHVyWWJJQkhSd1Jk?=
 =?utf-8?B?aTk0MGlXZXdxMEpZWHhjNnhRdVRhNHpiUmxqWVlwUkJ1Y2tTOHdRWkZyN0No?=
 =?utf-8?B?VnI1eDMvYUFPNXh6NHh2eFpKdkovdWlpUk8vR09pNEsraXNZQXNZM3Z1MnFZ?=
 =?utf-8?B?MGlWN29sNGlZUGc0cnNhM001Rnludk5jN1IwZ3J2Wk43QlhxamFsZUVmWHJT?=
 =?utf-8?B?bW1LNk52aklueUZoRXAwYU1EaXFqQVhpWS9aWHJMc0NBVXdFOTBpSEpZRnc0?=
 =?utf-8?B?a3pYQVhGWlVvL0Y1RCtzTTlZVWE3cGFSWm9VTHV3NGNlU3l0WjQ2Q1JRQlly?=
 =?utf-8?B?Zm5TVTM3dmYvWExjV2xXSWR4ZnhYc2d5QWRzTzNad3ZIREhpWTBLTU5kTzEv?=
 =?utf-8?B?OVZhb0NSTUQrZEdFbkhrazlRdDd0aHhDRDI3V2VHV01OUlozUnc2cnpPZEhL?=
 =?utf-8?B?bHBxV1p0VFNWODgyRXc3Qk9PREp4NnR4ZE9KU1pVM3NvMDhXQ2lLOHpHSkNV?=
 =?utf-8?B?OUpXaGhLRjZWU0JadGlsY1NOUCtIZ2tqdVhER1Exd2xieVRBV25CS2dUSjRk?=
 =?utf-8?B?ckxpYW5sRjFsUnY3M3RBbC9jdmNIeTZ1WVhwRFRsMXlramtqS0JrSWNsZnNX?=
 =?utf-8?B?NWYvLzJFaFVvNmRDY3VVQkptUU9Yb0kwei9jQmdGTnZ0REFqaDI0Ly92dWRQ?=
 =?utf-8?B?ODdzR3JaVmFZSjlyL2FHUy9ya1MyNTdVSUtEY3B3ZXd1SUNnK0locVZ5c1Zo?=
 =?utf-8?B?bmkySkpCSGhPTGFqTGdncTcwZmw4dUt0UGpuK0lXVFl3ZTNPMldZNDRpVWRR?=
 =?utf-8?Q?dle7jijmpz6Mam7kYV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d12f71-333e-4074-4d2a-08de68ed4e5b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 21:42:36.6867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gb0fUHnRmjnECQIOp6EsiNSqwJOLXqCQVKeNCopt9J0rCbXCP5+LYxSUOUIQtl0S/oAX6N1zt5yOwiV4JFuh4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[bounces-52545-lists,linux-media=lfdr.de];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+]
X-Rspamd-Queue-Id: 7BC3911F78A
X-Rspamd-Action: no action

Add the helper API v4l2_async_pad_init_and_register_subdev(), which
combines media_entity_pads_init(), v4l2_subdev_init_finalize(), and
v4l2_async_register_subdev() into a single call.

Reduce code duplication and simplify error handling in drivers.

Only change dwc and cdns. If agree add API, more driver can be simplified.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (3):
      media: v4l: async: add helper API v4l2_async_pad_init_and_register_subdev()
      media: synopsys: Use v4l2_async_pad_init_and_register_subdev() to simplify code
      media: cadence: cdns-csi2rx: Use v4l2_async_pad_init_and_register_subdev() to simplify code

 drivers/media/platform/cadence/cdns-csi2rx.c     | 18 ++++----------
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 15 +++---------
 drivers/media/v4l2-core/v4l2-async.c             | 30 ++++++++++++++++++++++++
 include/media/v4l2-async.h                       | 18 ++++++++++++++
 4 files changed, 55 insertions(+), 26 deletions(-)
---
base-commit: bc0bfce7d0f8204e0bbadcee72e87ad9ec105c73
change-id: 20260210-v4l2_init_register-0e6d0adcfa21

Best regards,
--
Frank Li <Frank.Li@nxp.com>


