Return-Path: <linux-media+bounces-32252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D84AB2D95
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 04:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DCDB1899DB8
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 02:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2FF1E572F;
	Mon, 12 May 2025 02:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="PeihrAII"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023131.outbound.protection.outlook.com [52.101.127.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC208286A1;
	Mon, 12 May 2025 02:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747018078; cv=fail; b=mW1ccQj7NWco74ldWBjA24a0NdMi4j/UvhBq0/vvPaeYifWOK4gVRDC9yzcZz2EQ+3f8MkWpMjrYrZtltAHoRvMFFAuKhXs5YzL/vk2qf9/FhmyQroYasa79neYWrtZ85xzIB0DxzqTxqe8s2PEH4L62E1zPxtggyRR0jKAYtQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747018078; c=relaxed/simple;
	bh=jx5KSdjY0XhfOPhm5ICKcjzxsa4tH2kafaX5x7Ci3e4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fQdKzJtl5O/J0XBdluKwxOtHHMELt98SPtWm8fcNABDp1m3b4Xi0YS6xECTeT+LNcU79ZqNTIpFJ+UD+qpsf28On8cP+lmxh4r6hKgtDfq/ih9jJZZAVuJ1P9xcAzW4rvFz1raDcEFaq/vKyBAL1H7oh+J6ULo9CIi7gj75ynSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=PeihrAII; arc=fail smtp.client-ip=52.101.127.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsmnZotXocpY8zKZCa9/wNEvLb4BGocv6ZtSQ/R3FyqBzBBjq7znbautzoLFL4WGPS3akbcWQ46TvTMNcyVJUoqWxHVKZAUPzsWPOt5eCY6efEgZHsY6Scdbryih4ImbTQmOSfZF74ANYzDNEEXD9fzOKeI4viEI9SQBTw/GUfoWk85SUKlBuZNVdt3KdHGa3UYVgBGdx7txV+X2ii70ebUEIo5K+PmKdk1Nd/Eyrwhi9M9JQm0EpkfuZDHyJ8K/RVYV8sxI7igXVwR4umnsJ0waiK7RqWx+K/d72DBMUSqQIfmCN1PkhlA6Ui6HHkxnnde9If5QWqqDxK7XNOZbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGqi+kp4ZhsbslyPnK+Sk3yTD/C6hgs0nTKBPiz+uiI=;
 b=VSjl1gAIFkhAVJRTF2FFKbjCtJIo67T+GQoZWx2AkduZ5ulfBSoFHTiypWMMjzoyNVcnNo3E64AMY1sgB/heNQULq5z+eewCNvE0u14zO1qzQF5LHUVvsPyMZbtRPdf4PMH2SI8pRQwZGdwx+SddfjjfnJWa+Ej+StIPYI9sCou59ydiq5jrvOiZET3fCgUnl2J5tKfFJXrSQsMH+Tpd1yE+6SdI0jKWRjYeR0i9n8g6YysA0v3cm2jlVJG9WgDnFQtzRNA18Cur9uNGE9lx6OaPOEyTQSnlb0KXh6mb0VO+vpSWmdodq5qB4nk7Eq8DSAlTl8tzVtQFsSYAEsrElg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGqi+kp4ZhsbslyPnK+Sk3yTD/C6hgs0nTKBPiz+uiI=;
 b=PeihrAIIwzCgQcj9NxRZoT+aidwmlr28Zv3o6hXmgJqotTQLHNU6Bw4ukb4qaIi7st98YByv0rkTeOlom9sKgRoTB62MGYjq9VPpHm32URLtqpCSkbNd6iElG+dtK49y0wN7kVopGSquh5hR02NZ39R1zFD5RWPnFnYocmfrRFAfjgVxdbxaTloLs3zKIC5Ld4Yj4MKX1skzjbVlP3cYtfUjGVsYg2UZIeK9JtqonTmfC8Ub0nkXc53YI6XrYfPy6VGGuF0+YHRCejRZNql+vpoRFuBoar4R4ZT4VOImjvnsy3nWqaS0j8goKs63KUceiBbajtvjAk9tM4CIhz/Qpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by OSQPR03MB9396.apcprd03.prod.outlook.com (2603:1096:604:427::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 02:47:53 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 02:47:51 +0000
Message-ID: <042c2c0a-f9bf-4ca9-8c53-fa39d4edc5ca@amlogic.com>
Date: Mon, 12 May 2025 10:47:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: amlogic: c3-mipi-csi2: Handle 64-bits division
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20250510-amlogic-div64-div-v1-1-e475d4de721f@ideasonboard.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <20250510-amlogic-div64-div-v1-1-e475d4de721f@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|OSQPR03MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bd74c77-296f-498e-43f3-08dd90ff62f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEhDdS9kQ3V4a2NDUWZvdlpjbUp4UzUvQWFXOHRWUE5vNm5ZZjMzV0V0L2dP?=
 =?utf-8?B?d0JCNWsrYnR5YWh0aUorY3hTc2VqalB4NjExN1h4dG5WT2lnQXRRMG8yY3k2?=
 =?utf-8?B?Z0dVQy9OTXBYd0JvUHhpOCt4OHlGRkFaNnVnQjc5S3VXTE5JYm52Y1VzejU1?=
 =?utf-8?B?aDAxOXQ1Y3NHaklrb0ZyS0Uvd3ZSUXdQVHNmZWZ5TGhnQTY5Q3dWNWFrSm1W?=
 =?utf-8?B?OXByQ3BZL2o5NlNKcktENENPWUZ5OHk0ODdVWk1PcnNMQkt1QTUwRGtpOFRD?=
 =?utf-8?B?SE05am40OVNIN2R4aUppQ2N1dW00bThJSndFUkxYZVhiYzRMWSs1dFh0RUZi?=
 =?utf-8?B?NVQzR2ExMU5JcVdVUVErekdIMncycDRCZVZtOG1UdmU0UUltUEc0V0pJNEx4?=
 =?utf-8?B?YlAzZDJxSXhNcGJQUDFNMjJkajMyNlA2US9YLzRBODZnT29tRU9GZWx3LzAy?=
 =?utf-8?B?UmV3QUxSSklkOWl5V0NwTGsrZm5MR1FsT05lckhCbFJiaDFabHdGVGxYV1oz?=
 =?utf-8?B?TG83U0VpaGpWYWNLbXJscW0xTTRXY2J2bEFja09aOTRaSk1xdmlSaFpGMUYy?=
 =?utf-8?B?dzR4dWtpUDhhUkpOVFk3YUFaUGRkazNJRFhpK2xEWTRsMlQxYTNyOWw0ZnVS?=
 =?utf-8?B?T2FnaXNGYU9ma2JwU0NTOEMwbFY5MFROYmNCRHlzNUZRYnByY3RiZXBBdkxv?=
 =?utf-8?B?UHlHR3Rma3ZsUnQ4NG1wckp6bFQydGFoNVgwR0hkTEtyMGhYNDlweUNVMFcx?=
 =?utf-8?B?UDQ3UHRRcnJpc2NVVi9uakk0d0FLemJMT3lvTUdMNisvM3ZGeDVzK2VtUHh5?=
 =?utf-8?B?alpVc3o0OUI0TmxOb0R1NlFzcXdVeE5iK0hMNGp2QTBlRmlQczVFQXVsMk1V?=
 =?utf-8?B?U1hmTGdBMnRvUXdxd1Rsa1EyNUpuRng2eGphbWgvMEJxMlgyRWx0VDdwd2ta?=
 =?utf-8?B?L2g2aW5QeW9DY0pLWkxmR1NhbHhBM2xhRGVxWGlZejdhN3J4MExGaHJWSncz?=
 =?utf-8?B?V1VFNytOMHppY2xvY1FzYlkya0NxclJHQyt0K0NORzRvL1F2cnN2UXlKZjE2?=
 =?utf-8?B?azAwR2YrSzZhNEVVYnBrUHByMXpVZ1dxQ25KVm0xbTRyaGJJK1U1WVdEQUhL?=
 =?utf-8?B?TVUrTzYyRGlhZWQybnNZOW9rT2lnNkYxUThrK0RLRWVWUTl3QlR2NlRITXJj?=
 =?utf-8?B?L2tZNG44R1ZneHZOL0NDYzZqRDJZc2VVbGVMSzF0d3Nja0N2NnB1SGtwMUFa?=
 =?utf-8?B?blJ5akRNQnAzZjFOcHAwU3VselZ1cmhFVFdaQXV0RFV5ZzJyenhlNHE4Nm5u?=
 =?utf-8?B?K2U5NlpaVllja0k2aEowK202Nmdnc2NmZGgyNlAwYTVTSmtqM3hEdzZaRGVT?=
 =?utf-8?B?M0pvdHNaT1FlamtDN04rQzRFcnl3b0RiWmpNOENqc3dTVHdja2t3UFdtdVF2?=
 =?utf-8?B?MTgxaGRSSVdrdGY1Qnd2Qm9Ia0FveVkvdlJwcWsyc0grZHlHNHhEc1FsZUdp?=
 =?utf-8?B?eU5NZDFIdGZjYTdka1NmUkNTSSsvbm5LRGw1K0grWm1kc3BIam55UTNTTjNt?=
 =?utf-8?B?czlKeVJKYVRGUGR5ZnZWcGd4QVBaNzM0VGcrZW15MUxRMmNzVGlFNy9QMU9C?=
 =?utf-8?B?Wkt1QXZvazVqekxKSzhnSWxaV2JLdjJtK2RlcTRMdlVMM0dWanJKY3dhZzV4?=
 =?utf-8?B?Zmd0M3l5ZmVOOWJUbmlTK3VtWHVTYnoxZmRqOHB2R1JFMldrNTIwVHh2MXBD?=
 =?utf-8?B?R0NVSzdkMUE4L1hSWks1K256VjkwdGo4RS9NcUpYQVFOOERYdThTckFmR2VW?=
 =?utf-8?B?NC9idFV0RHFLcG90UThsT2hsK1ZoQ3V3ZlFaaHVPK0x2RHZrUGg1bDA2Um9M?=
 =?utf-8?B?clpKL0hYWnMyN3dDRmVkTlRteEJUdVpDdUordzNuem9iOGVFMFRaalk4VDJy?=
 =?utf-8?Q?X5T6t1Ispgo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUJvWEZ2SVI1ckZmeG1ac2JvTDJUaHpzb3Nob203WThmY29rZDRkamV1OFpT?=
 =?utf-8?B?RmpZZ1lxNjY5R2l2dURjbzM5anJaOTdUNGw5QzZxV1I2LzdETFJpN1hIM283?=
 =?utf-8?B?M0xoOG9vcGVVUVE4YnNCTWppNDVPZWdkbHRBOThZelBCUy9SUm1sUzNZd01E?=
 =?utf-8?B?YUtaalpDOWhkbGhPWE5wS2RzaUNHTjlHY0JBVXEzK0UyOHZpV2JZT01waDNn?=
 =?utf-8?B?d0NoQ0xGRllPWlpwbVBGZ2VCdDZzR1U4QzRzU240WHIxaXF0SVhuZzM3RENU?=
 =?utf-8?B?NmhXOFBJLzFrQlRDVFhPTjlVUVh6eG9VZThMTkNuMUM5dXBNRTVhTnEwWkNq?=
 =?utf-8?B?SEhPNTV2aWFObDFyUGtyZ1cwWS9hVFUwUEtXaGRLT09zL2lCcFpLVnlFNWdK?=
 =?utf-8?B?NnlPYkoyWCtYblI4Y3J4UjVhVnVwR0FtYmo0WldRUk83cnNiSTdnaWpNWDhG?=
 =?utf-8?B?OVFLSTlwNGtQQS9HK3lJTWJtdE4zdWZWYVhCdTJiQUN1TjljY0pNVXBXTkZi?=
 =?utf-8?B?SU1uSWJJRXQ3L2FzYUlCZjVoMllxWERuZXQ4Z2N4TmR1dVJMZ3pJUTJrdjM1?=
 =?utf-8?B?TGd0Y0FqVkJxbHdEanFhdVdqR3k0NDFCSFlkUE4yQ05rTWd3WW9ucHBPZW5z?=
 =?utf-8?B?bEI3TEs1dHVJTExUaVczYVRUeWhOS0Jub1lLbEl5ZWJwSWdrQ1lId0lwQkdF?=
 =?utf-8?B?N25mUEpkYlQ3U0JORnJnTzVyUHpPTUZNK3o3MHVKTDhqR0M4NmtxSVpYUTdZ?=
 =?utf-8?B?UFdwbkVnNlUwaTV1bUpLVDZJS3NESUZ1Qkw4ZEhaU0NJQnhCZEowWTZ2a1BM?=
 =?utf-8?B?T0tJS25zYlJZbmExbU1KaTdieDBEREY5ZjFoOFBublB1eDJ5STU4THQzK0Jn?=
 =?utf-8?B?WDFMY2hyMGxTL25kYlNtcVJpVlpHbzNKRVRqZmU1cjVYZ0VabUVHQ2xwZzRH?=
 =?utf-8?B?OHZuczlUN3d1UzZDUmtzMGFKamJJeExZR0hRck93dlB2T3JiM0M0TDN6aUsr?=
 =?utf-8?B?dWVmZjUzdVJqOHRnYjhOODRveG52dE5oN0dqQ1lVZWp1M0QwMXNqck04WHc5?=
 =?utf-8?B?dFNkT3prR2FkZ3B4cTV2MnZyV2h0R0JRaGFCbzZjRTR6QXBTTWRqd05JZDli?=
 =?utf-8?B?SnE5UFZWOGZGVTRDeEE4MFhYR0R6UVdDeUxBY3pFcHViQ1Nzbi85R3ZqM2dv?=
 =?utf-8?B?OWxJbWp6TU11NDloNjd0WnBSRCs3dzhoWk1Lb3o4MXI5ZkVCNU03ajdHSXpE?=
 =?utf-8?B?ZjhxR1dWZnliWFBaWnRKZzN5ZS9INE9hdlprMVhJOTJSYjlweVhSMjhBdHc3?=
 =?utf-8?B?R2g0QUcxbjlxRERXOENpMUhEd0h5NEptcVAzZlprUmN1SFh4eTV0cFYrYmRj?=
 =?utf-8?B?ZEZmR3l5dk41Q0NDMjlONk1mbm8reFA2ZmhVZVhpWWl5ZDV6Y3RxUHhMbWhF?=
 =?utf-8?B?T2JkdVBhU3M4di9CK1ZvNTFackZGTldOZXlSQXAzNEVXSWZRUEdySG5BMkdJ?=
 =?utf-8?B?QmpxajE2UUVSZkdkd3c4K3dxM0NPakJSRCtyT3pPOFBwSDd0RVAwcWlvZk1y?=
 =?utf-8?B?a2laekJwZU5Sa21mckF2RlRuKythejRZWnJjZWx3MWt4TnRKUGxmNnNaV3N3?=
 =?utf-8?B?NVBqdUpacnRhcWRDbmxlNEhDM0RFMUc5YitubjhoUmpIVlV2SHhRdE16eEto?=
 =?utf-8?B?dVd1NW04d1N0SDBIS0R3VjcwLzhQL01FREU4TFEwSXpOU0RObjE5bW5sR2Rn?=
 =?utf-8?B?b2JBNS8xalc1ZjZHQ1VMT0dWbjJZdmYxc28rWFNnV3pPR0VMNjczT0V4TTlE?=
 =?utf-8?B?dCtFYVdTVDRnak9wTGVrTER4dnNQVGt1djJRbEFIc2huTTd3c2xCbnVvVFdF?=
 =?utf-8?B?ejRPYlV4ZklmcE1NM2M1MTVjendPb0J3dkh1RHJ0K0kxZlVaR2V0WDk2N2Z5?=
 =?utf-8?B?a1lzdEtrdHc5QUVJcytySms3RS9sQ1hTdWVjeWpyYS8vYTVNdE56Vk82Yk9R?=
 =?utf-8?B?czIvakJVZFl6MGNsK2l2bGpCNlRib0M5Slk3Vyticm1ZQzdwUzhjaExLY0x4?=
 =?utf-8?B?YjNHUWlXUmJEdHhDY0JpVTVFTXBpa2lESjY3THBxN2FXL2J4TGk0MW9JN3p4?=
 =?utf-8?Q?2tbWXY+QDHMgjzxQ8D3uRWPkN?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd74c77-296f-498e-43f3-08dd90ff62f1
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 02:47:50.8794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9byfBNY68EvKDGshyjZhPeHcl+1LxFOMyU6BZP/0ORN/T6qb2OVwSTQXCHcQ/K6RXjT7iR4PXeaShFojgZvPdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB9396

Hi Jacopo

Thanks for your patch.

On 2025/5/10 16:48, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> The kernel test robot reports the following error when building on
> Hexagon with hexagon-allmodconfig.
>
> ERROR: modpost: "__hexagon_divdi3"
> [drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.ko] undefined!
>
> The error is caused by using DIV_ROUND_UP() with a 64 bits divisor with
> a 32-bit dividend, which on Hexagon and clang-17 is resolved with a call
> to the __hexagon_divdi3() helper function, part of the compiler support
> library and not available when building Linux.
>
> Use DIV_ROUND_UP_ULL() to fix the build error and avoid calling the
> __hexagon_divdi3() helper function.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505101334.UHxNcUUO-lkp@intel.com/
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>


I agree with you.


Reviewed-by: Keke Li <keke.li@amlogic.com>

> ---
> Hi Hans,
>     this should likely be fast-tracked to land in v6.16 with the Amlogic
> C3 ISP support.
>
> Thanks
> ---
>   drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> index f92815ffa4ae..1011ab3ebac7 100644
> --- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
> @@ -5,6 +5,7 @@
>
>   #include <linux/clk.h>
>   #include <linux/device.h>
> +#include <linux/math.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/platform_device.h>
> @@ -321,7 +322,7 @@ static void c3_mipi_csi_cfg_dphy(struct c3_csi_device *csi, s64 rate)
>          u32 settle;
>
>          /* Calculate the high speed settle */
> -       val = DIV_ROUND_UP(1000000000, rate);
> +       val = DIV_ROUND_UP_ULL(1000000000, rate);
>          settle = (16 * val + 230) / 10;
>
>          c3_mipi_csi_write(csi, MIPI_PHY_CLK_LANE_CTRL,
>
> ---
> base-commit: 3328eb4dfec23cb3055cda24087cd1cdee925676
> change-id: 20250510-amlogic-div64-div-6d0d5a6ec566
>
> Best regards,
> --
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>

