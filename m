Return-Path: <linux-media+bounces-30968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95059A9BCE5
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 04:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD2DB7A64E8
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 02:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9120B1547FF;
	Fri, 25 Apr 2025 02:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PA3kAnvw"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D4743146;
	Fri, 25 Apr 2025 02:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745548403; cv=fail; b=ZzhK1rKZ09q9qeInhAL0PACW2gfBL/DPlMTonv3zW5zFHikMZDcIMLeuPAZOyvJQP666pCUkCsuVoeykEQADmqGA7vumBl6om6PEQr5vPkKvoo1mCJjfTCBNamhL4F17n9e8kLYPx7u9gt0khyzad22vYhU6KvuAxIWb5vPWG1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745548403; c=relaxed/simple;
	bh=2SFp0Uv2HzPZGZ6PogM0pO+R7BAKh4YlidWGXDwaRIM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=efm7FlvAaMtiR7PskSh2+UubIZ7pxeXwLED+/e8mJmLohTyaI0gv9ZaEI6GHo1sNCyi9LgFd4GLZhUmFJZw71cLnmlONhNcCk6FfDEdz8h29kh8+gQLlqjZCp5gPKhXhvnjLvkJjsAypO4FnoEV+bkHiNIvJ3GCCcIIcTbxXgw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PA3kAnvw; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNJsCpiOOs5ecA8N2qa+ZIw7psyQTeol9+DbSDJ9KbRNz0XSHa+y09vd5Hf+yLjFpnsNxeGoUoHNCA3tobuZPTMpV1w9LPbfs7ZMn1/PGUSRA6A9L8tYbRaDDjJ1p2DnBpflm6rV9rRL8l3IZgTOubQdzgNICQfvorF7LYNzqDPyq1Uwoqj1qY1SVuvA6ZGBaqjTvY/C4tIHzu8WyoM8FHZO5qIKdr2VONqwZuBA5GmCk/Ni6MmfqAh0PxjGmPsMD/MfLaegrXe3q/TNP703m3gJ3OlKHp/+pjQWjfpq2BmKCda0hKb3HsXh3OKWQAADsQ8EWmWIXwudtQcbzmhF2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6JlE5duFyk+ALGpAvaEhpgkmw3hjM2fbd8KLJtFurg=;
 b=gJ5vtVkN81wcBRKq2hW8StH697yy/Q+cG+hrKMLxmw8qhgXDw3wnDhyEoc3Xz4WZXuzGS9U9nT/nXUKjfBdVCYBMlZCXDQBgT2IgXFnAHxS78au4BxFg5pvtyxHH2TwplQL1QI+EayQeqNWXk6cNcFGVjiGtW8aJYicAhiF7o5cuZCKEs5nJ0vY2jJEa9GLAcDu7oZu2601kgjW4M3V4kOuJoHkAP3qZ0gBTgPyH7Ic08uyz/h+mVcFQ6swT/Cpivxev14dIKrRxvQcfdClHbJd4OZTe9r7gv77BYPSReH55Xkc2JUHV9wXoFP9ZCpE/vQyRJ+k0O7osIPqZh8vBww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6JlE5duFyk+ALGpAvaEhpgkmw3hjM2fbd8KLJtFurg=;
 b=PA3kAnvwK4nk60kxXYJc/5hIA5DwAc4NoiYYMNV9sKJrteWDebN8VT+753mnXrYdSqjMIaC1LXyCczItU31ST+qfUNYXD7la0I/OL0lQt57cY945iAnPwwHjUWvDjYtUfcIRj2YCxAX4iPTGrW93WyxPFPtw8j1XbxhlLkMJo4UPl/LxTs1K8jj5GHDdfkpDqD5iPwUe3Nucg/oMbj0klovpsW7mGTNLOdjd12MPqQdUDp9k9MksOFm3YiFD0jy+pGXKVWaEUkGu+RWCZXlgmnbMppVh8IbAMgKIoBes+OMAv8G+nswsY3lTME6j84o9uxGe1WCuaRqBoaTYRRAKSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS4PR04MB9481.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 02:33:16 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 02:33:16 +0000
Message-ID: <a60b84d8-a179-4c33-aed0-1f2ad1857f7b@oss.nxp.com>
Date: Fri, 25 Apr 2025 10:33:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: amphion: Add H264 and HEVC profile and level
 control
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241210093337.3779686-1-ming.qian@oss.nxp.com>
 <74eb0589ae54855db1d2024591d501989e30027a.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <74eb0589ae54855db1d2024591d501989e30027a.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS4PR04MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: b18d2ec5-0fb2-44aa-04cb-08dd83a188b5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UEZBa0c1YkxuOUdkakxjb3dud2hraEtCTG9ueU9uS0R6bWVMRC9jeCtzT2xy?=
 =?utf-8?B?T21QaUt4bkMzNDdxRktXa2JBdlFVK0RnbExsakpCYVhlQWpDL1JuQW8xR2Vh?=
 =?utf-8?B?dUV3R1U3RGR0UzZBa0VrdEl2WXpEaXVJem1la28zYTZNVFduNGM0Q1dFUmtX?=
 =?utf-8?B?TEtpL3hUalY0c1NBY0lERHJ0b1NORVJXcjNVNkoxOEt1UGdVWTFrZmRkT0Ix?=
 =?utf-8?B?RmpYMzB6cWpOOTk0L0RNeW1NSVdjdUE4a0ZZaG5OOStPYjFKQi9EeXFpeGZr?=
 =?utf-8?B?WlY4YkJDWk5EQWNpQVZ1TE9BZ1pPNWdMMnVWYzV6NkhWZCtzN2kyZTBaSnJq?=
 =?utf-8?B?Vnc0TmhncDdxWkE0ZkFJd2NvQWh6Wi9DY0Y3aXJvd1o1b1RqOTVVTHFRUXZa?=
 =?utf-8?B?Umt5a0lvNG96Y0o5SHRkQUoyL295R0d3RGZZL1I2ODQvUmRCTXp3REQrN3lq?=
 =?utf-8?B?Y01CRVNzVy9QcFY5d1NGNWI0WThZbGtJbHNDVWQ2eEF3ZFlDbkRWT1V3YzQ2?=
 =?utf-8?B?YmZCaHRPZVZtekErMmJOTHpUMzlwYW90NXpuN1NMS0Y1eXl3T3dYbTREMFdw?=
 =?utf-8?B?THFlUmh0aEFUNmI3WG5NQ0Y0YkhIUVZtM1RLZjhqTHJVcklscVlIZllnUGpu?=
 =?utf-8?B?aENrdHNKM2N0dXJ3a2tyUFFUMS81NHVsc2RRM3VVbDdhSGtla3N4UXRqUGlI?=
 =?utf-8?B?eXJPd3ovbFg3MlNyN3Avc3FjODRON2tudis3MXQzc1Q1RWxhei9XRXF6S0JZ?=
 =?utf-8?B?Tk9VWFlLS3U3L1paeVd4Q0tGTzkwcVU4emFuSGxINVE3Ym9ncDdIRDBUbW9l?=
 =?utf-8?B?Y2V1WWxHK0NSd05maWNZQVI4MWFyUWZnUENJU0dnbGJFSCt6SW1IaGdOVHo1?=
 =?utf-8?B?WG0rQTk2RUkzT3VOai9oTnJpTXpjci9XWHVsZW1qT241STZkdXBjWkhNVjZ1?=
 =?utf-8?B?ekl3RDg3QUtReDJrcjBjaGVMaHRPVitsa3Z4ck04ZkFwaE5CMmZrWWFVZDRW?=
 =?utf-8?B?Q2s3SENrYkNvRmNuZTVIMWhaRVd2OEpwZTlTNHY4U1dycHhyYndVcklaTDFY?=
 =?utf-8?B?Nm1vWCtkZTBBOHBnS0xobnZPQnpKcjhJU0toMGpUVkRYSVViNXhGWE5ScWIw?=
 =?utf-8?B?Qm50R0tzcWh2TW91R1haOWpiWENTOVZJWGNMNHFnZnRoWHdkWkh4ZmNsTzBI?=
 =?utf-8?B?UnBJSDlDT0UvYnBRa285M0JWTVZQYVJGNVN6ek1CM21hRENCQ3VWR3hCSmdz?=
 =?utf-8?B?UWkyV2hvSUNPWTg1SEU3MDc3cXdvYi9ta05IQjBBVEJVc2hvVjV0UWxPano5?=
 =?utf-8?B?YVJ4T1MzeVAzOTd0N2FiaDB4SVR3a0NKc1d6dUdNQVdxQmtETVZ0d3VTNUNN?=
 =?utf-8?B?bHJ4eVNwT09lWlVsV1Z2OWZ4R0UwbEpXd0RjamlFNFE0aHRMNHhBU01WT2g1?=
 =?utf-8?B?RDZXQzFhN2t1VTA0SkZ4bWl4R3pxaWNvWm4rUndEejNuOHVwd0Z5a2Jxak0y?=
 =?utf-8?B?bEN2UjJDZkpuOWtmQkFVZlZTN21pdmw0R1V3dWNWTG8wMDBTQXNWMlZTNnc3?=
 =?utf-8?B?aC9vZVRCT200M2tuSEtKSFpQM0o3cDdaMGRkQTF0VTFHRzczbkJucFJRcERC?=
 =?utf-8?B?Q2hLYkJXT0ViOWJ5cFRlRUVscGVGYmZGNlBHVWpYKzI1cytWL0dMVkcwOUdU?=
 =?utf-8?B?OStFVTNuZzNTcHJsU2Fpc2lRMWFpNGNNbUREMGp1dU43V1VtN29YdFQvZ21I?=
 =?utf-8?B?UVdpWStWRytWUU9ZYXllMDVjbnFaMGNrU2tSaDV5ZkQxMmdzTU16djJ1RDRp?=
 =?utf-8?B?OS8xQ3hlRngxN0NhQng4THNNMDJ4Q0xLazN1ZCtxbXlldFJnUHhWNDIyTFRo?=
 =?utf-8?B?d2k5eGI1alRoa1BLakZ6ZmJReGdIWE1jcVlnT1F2bnlQSy9tUk51QWhXdlRU?=
 =?utf-8?Q?73HkvouSL5I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHhNNXZteUo3OTVWSmVlVmZQdEowcVY2cHY1UnRrcXVvZGJiRE43ajJWWHRj?=
 =?utf-8?B?SE03YldDNFpYUHJrVTc2d0ovMkFrMys1MzRJamlNTVBrbzF4d0VxRE5Sa1Ix?=
 =?utf-8?B?QVNlT2thMlRuNHI3VFVhbERQaXNWOGwzZ0t0Ynd0MzdsN3VRZm1OM21vWFFs?=
 =?utf-8?B?QXFmSFNFS0UwWUtXSXpZbk9LRXN6RU1Kb3pkOUdqdUh4a3FLOGR3bjBaNnNF?=
 =?utf-8?B?RjF4cUpLd096VFIzWldHalBHbjFDNW9BOUI4MUh1UUQwT3hYN28wR2M1T283?=
 =?utf-8?B?Tms0dWNhSnBycFJpS1hVWkVtWEpZdkRwbWVTczVOeVNycGQzUnlIWEpOMzZl?=
 =?utf-8?B?NVJjRXhKWVVtMVlXekZKMmtRbjVOOE1qQVRaVENjV2wwL0tWZ2ZFRWovNDJX?=
 =?utf-8?B?NW1uTmEvN2RkeDVrRVgrK1FZdjY3cjBTZklqQXpXeGpXbFRvRGpKb0NVdFdx?=
 =?utf-8?B?QmNPVXBlbW11b2o4ZDV4SkJzVGk0MHFqa2FybEZBa3BRenY1Y3RQTG5JT1gv?=
 =?utf-8?B?Ti8vVDFMdTl2QXdRYWY5dzF2TWFsSDdyWGxSTkNUa3M4SW9GZFJFOWZKQlM1?=
 =?utf-8?B?Y00wRnJiWmRpNmh1eENiTXJhQW5SOW9ESmxTd01TWUdOT0xlS01JeU80TzVp?=
 =?utf-8?B?eWgvaEk5T3VmdFZzc1pybTFyVlkwVE54bU40R0tXNlB0TTl6aTRsUFRvSTBC?=
 =?utf-8?B?Y1oxMHJEa0FwZHIrKzJGSEFmVmY2RU9teE9iUmhOUGxFS0R5TmVzWUF4WnZu?=
 =?utf-8?B?SWJseFRjTkVEUTVWUHUzQUpzODZHL3JhdEorT3ZUdVg1NEh6cmlVdEJQQ2Vr?=
 =?utf-8?B?OW5pSHBVT0V6Vjh4bG5wYkxQZ1dBbUVxeXZKalZjVit3bDhUT29UR00wcDVS?=
 =?utf-8?B?a0w2NkE5SlM3SjBpaEZHRHFhamVqZmJqSUNEZ3ZsOHRDdEFVTjdObk5sNk9J?=
 =?utf-8?B?ZitOOTNOU1U5T0hBWEZVOGNacmpNN2ZNbGZmUUgrYjU1dDhaeXZHV2wwUFo2?=
 =?utf-8?B?ZmY0RHlVN3E1c0tndWg1NU9SeUFBWnVTOGZOOWYwcXN3WDBuQ2hCV09seFNt?=
 =?utf-8?B?eDVwSXJJeFF3UTFnS2QwSzIzMUJFUGdqUHFmV3dMOUdwVWtqVnZ4UlVlNUp1?=
 =?utf-8?B?eXBRNUQ1cURmNDRZM29Ccy9xR1ZTY3picGdNZ1JWbkZnUERYQk4rUy9aeE1j?=
 =?utf-8?B?MStJS0NINk9uaUR4RjcvczdKc1lMeVlqL0EzOWJYc2YyZnc5SWUvaWRVaGZK?=
 =?utf-8?B?NElSdXArMzhxV0FwRjBzRm0vTEtZbGlLbkxacUY3ejYwZEVEeXpyOEpWVFFw?=
 =?utf-8?B?UklmTnM2eFFuWUJKMTJvYmhYY1haYXZzOGJYMDJpTkFTM1NUSnBzWUQrMjV5?=
 =?utf-8?B?MENRL3IyTFVTRkZxcGtWNXMxcUJ0bHpkUGpOL1RsTjZ6VmFXNDY4QXYxY1RQ?=
 =?utf-8?B?R0ZhT0l5SEdtemdmbEo3NkZGK0pkenBxT1pNSUo4VGRHUU1acE94ZlFKR3VQ?=
 =?utf-8?B?eWc5YU9paE9CcmwrUVdJcXJTZld4c3VReTFLZUVqOXBRYzJIYWx4UTZObXdp?=
 =?utf-8?B?WFkwdUxZY2JvNy9Cb3ZmZWJhRGs1Z2lFRWwvY0ZPdWZ4ZDJQZ1gxRFlHTTIy?=
 =?utf-8?B?ZDRzYWZkdWpGLzJlQjhXYldWazdHUHdSZVlGT3RVdEo2SlFiZ0lJRXJsZ3dC?=
 =?utf-8?B?cVNlazNJVmJEOFZqUStWU2psWTMxNWVvS2FiYTJiNjB1TGpEVzVMdExqRGQ2?=
 =?utf-8?B?MTgrVWdxN0QvRTB3UjI4ME5XZGFVV3JXcnRRYVMzMXM5L0x2a0dlekk2M2x3?=
 =?utf-8?B?SXV3dGMyVW5oUnlWd29yQ2ViNTA2d1VZQ2VRMWRKaW1Ja3J3OGx1UTU4QXdp?=
 =?utf-8?B?cmxQSWVZeUVTNHdtNEdLQXhnYTBlZTFJTkJWdE15VkNIVTRrNU1IUE1PZVJU?=
 =?utf-8?B?SkxMZU9DcXhEWHNIeFFJZEYrdVUyaTdtYkN6R2taNlhHNGxGeUFSdC9WbVAy?=
 =?utf-8?B?QXlZTi8ySmxtUGhDQ05zZW9za1FhWlpGK01INlFiVm80UlJBU3ZVcVVodjM3?=
 =?utf-8?B?dGVUc0J6dFFEVHlEQ2pEcE9hS0ZaTmRNelo3S3ZKU0NKN1dDT0hObkFQdjJD?=
 =?utf-8?Q?M+bkKLJ9mkygIpJIoPnNsEpTd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18d2ec5-0fb2-44aa-04cb-08dd83a188b5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 02:33:16.8019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2kc+El+0z6/6zIH8eAbP9eazR4TdsBb9cfadGYq17Omq+E9InS0xYQ9uSiC+OvqXOZEwW5gXeuWvggeNUbKuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9481


Hi Nicolas,

On 2025/4/23 4:15, Nicolas Dufresne wrote:
> Hi Ming,
> 
> Le mardi 10 décembre 2024 à 18:33 +0900, Ming Qian a écrit :
>> From: Ming Qian <ming.qian@nxp.com>
>>
>> For format H264 and HEVC, the firmware can report the parsed profile idc
>> and level idc to driver, the information may be useful.
>> Implement the H264 and HEVC profile and level control to report them.
>>
>> Signed-off-by: Ming Qian <ming.qian@nxp.com>
>> ---
>> v2
>> -- add support for V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE
>>
>>   drivers/media/platform/amphion/vdec.c        | 61 +++++++++++++
>>   drivers/media/platform/amphion/vpu_defs.h    |  1 +
>>   drivers/media/platform/amphion/vpu_helpers.c | 93 ++++++++++++++++++++
>>   drivers/media/platform/amphion/vpu_helpers.h |  5 ++
>>   drivers/media/platform/amphion/vpu_malone.c  |  3 +-
>>   5 files changed, 162 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
>> index ca8f7319503a..61d5598ee6a1 100644
>> --- a/drivers/media/platform/amphion/vdec.c
>> +++ b/drivers/media/platform/amphion/vdec.c
>> @@ -232,6 +232,37 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
>>   			  V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
>>   			  0, 1, 1, 0);
>>   
>> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
>> +			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
>> +			       V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH,
>> +			       ~((1 << V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
>> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> 
> You've added it here, but you will never report it, see my comment
> below.
Yes, you're right,
firmware can't report the sps_constraint_set1_flag yet,
so we need to request a firmware interface change to report the
sps_constraint_set1_flag.

If we remove PROFILE_CONSTRAINED_BASELINE here, then these streams will
failed to play with gstreamer.
If we keep it here, then these stremas can be played, but driver will
report wrong profile.

Maybe we need to change the firmware interface firstly.

> 
>> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
>> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED) |
>> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
>> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH) |
>> +				 (1 << V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH)),
> 
> Shall we advertise multiview and stereo ? My impression is that we lack
> a mechanism to actually signal the stereo layout, or which view each
> buffers came from. I'm thinking, you can can't test it, we should just
> fail on these ?
> 

You're right, they're not tested, I will remove them.


>> +			       V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE);
>> +
>> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
>> +			       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
>> +			       V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
>> +			       0,
>> +			       V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
>> +
>> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
>> +			       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
>> +			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>> +			       ~((1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
>> +				 (1 << V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10)),
>> +			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
>> +
>> +	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, NULL,
>> +			       V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
>> +			       V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
>> +			       0,
>> +			       V4L2_MPEG_VIDEO_HEVC_LEVEL_4);
>> +
>>   	ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
>>   				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 2);
>>   	if (ctrl)
>> @@ -1166,6 +1197,35 @@ static void vdec_clear_slots(struct vpu_inst *inst)
>>   	}
>>   }
>>   
>> +static void vdec_update_v4l2_ctrl(struct vpu_inst *inst, u32 id, u32 val)
>> +{
>> +	struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&inst->ctrl_handler, id);
>> +
>> +	if (ctrl)
>> +		v4l2_ctrl_s_ctrl(ctrl, val);
>> +}
>> +
>> +static void vdec_update_v4l2_profile_level(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
>> +{
>> +	switch (inst->out_format.pixfmt) {
>> +	case V4L2_PIX_FMT_H264:
>> +	case V4L2_PIX_FMT_H264_MVC:
>> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_PROFILE,
>> +				      vpu_get_h264_v4l2_profile(hdr->profile_idc));
>> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
>> +				      vpu_get_h264_v4l2_level(hdr->level_idc));
>> +		break;
>> +	case V4L2_PIX_FMT_HEVC:
>> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
>> +				      vpu_get_hevc_v4l2_profile(hdr->profile_idc));
>> +		vdec_update_v4l2_ctrl(inst, V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
>> +				      vpu_get_hevc_v4l2_level(hdr->level_idc));
>> +		break;
>> +	default:
>> +		return;
>> +	}
>> +}
>> +
>>   static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
>>   {
>>   	struct vdec_t *vdec = inst->priv;
>> @@ -1189,6 +1249,7 @@ static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info
>>   	vdec_init_crop(inst);
>>   	vdec_init_mbi(inst);
>>   	vdec_init_dcp(inst);
>> +	vdec_update_v4l2_profile_level(inst, hdr);
>>   	if (!vdec->seq_hdr_found) {
>>   		vdec->seq_tag = vdec->codec_info.tag;
>>   		if (vdec->is_source_changed) {
>> diff --git a/drivers/media/platform/amphion/vpu_defs.h b/drivers/media/platform/amphion/vpu_defs.h
>> index 428d988cf2f7..606f9d61a265 100644
>> --- a/drivers/media/platform/amphion/vpu_defs.h
>> +++ b/drivers/media/platform/amphion/vpu_defs.h
>> @@ -134,6 +134,7 @@ struct vpu_dec_codec_info {
>>   	u32 decoded_height;
>>   	struct v4l2_fract frame_rate;
>>   	u32 dsp_asp_ratio;
>> +	u32 profile_idc;
>>   	u32 level_idc;
>>   	u32 bit_depth_luma;
>>   	u32 bit_depth_chroma;
>> diff --git a/drivers/media/platform/amphion/vpu_helpers.c b/drivers/media/platform/amphion/vpu_helpers.c
>> index d12310af9ebc..108b75ceb4ae 100644
>> --- a/drivers/media/platform/amphion/vpu_helpers.c
>> +++ b/drivers/media/platform/amphion/vpu_helpers.c
>> @@ -509,3 +509,96 @@ const char *vpu_codec_state_name(enum vpu_codec_state state)
>>   	}
>>   	return "<unknown>";
>>   }
>> +
>> +struct codec_id_mapping {
>> +	u32 id;
>> +	u32 v4l2_id;
>> +};
>> +
>> +static struct codec_id_mapping h264_profiles[] = {
>> +	{66,  V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE},
>> +	{77,  V4L2_MPEG_VIDEO_H264_PROFILE_MAIN},
>> +	{88,  V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED},
>> +	{100, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH},
>> +	{118, V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH},
>> +	{128, V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH}
>> +};
>> +
>> +static struct codec_id_mapping h264_levels[] = {
>> +	{10,  V4L2_MPEG_VIDEO_H264_LEVEL_1_0},
>> +	{9,   V4L2_MPEG_VIDEO_H264_LEVEL_1B},
>> +	{11,  V4L2_MPEG_VIDEO_H264_LEVEL_1_1},
>> +	{12,  V4L2_MPEG_VIDEO_H264_LEVEL_1_2},
>> +	{13,  V4L2_MPEG_VIDEO_H264_LEVEL_1_3},
>> +	{20,  V4L2_MPEG_VIDEO_H264_LEVEL_2_0},
>> +	{21,  V4L2_MPEG_VIDEO_H264_LEVEL_2_1},
>> +	{22,  V4L2_MPEG_VIDEO_H264_LEVEL_2_2},
>> +	{30,  V4L2_MPEG_VIDEO_H264_LEVEL_3_0},
>> +	{31,  V4L2_MPEG_VIDEO_H264_LEVEL_3_1},
>> +	{32,  V4L2_MPEG_VIDEO_H264_LEVEL_3_2},
>> +	{40,  V4L2_MPEG_VIDEO_H264_LEVEL_4_0},
>> +	{41,  V4L2_MPEG_VIDEO_H264_LEVEL_4_1},
>> +	{42,  V4L2_MPEG_VIDEO_H264_LEVEL_4_2},
>> +	{50,  V4L2_MPEG_VIDEO_H264_LEVEL_5_0},
>> +	{51,  V4L2_MPEG_VIDEO_H264_LEVEL_5_1},
>> +	{52,  V4L2_MPEG_VIDEO_H264_LEVEL_5_2},
>> +	{60,  V4L2_MPEG_VIDEO_H264_LEVEL_6_0},
>> +	{61,  V4L2_MPEG_VIDEO_H264_LEVEL_6_1},
>> +	{62,  V4L2_MPEG_VIDEO_H264_LEVEL_6_2}
>> +};
>> +
>> +static struct codec_id_mapping hevc_profiles[] = {
>> +	{1,   V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN},
>> +	{2,   V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10}
>> +};
>> +
>> +static struct codec_id_mapping hevc_levels[] = {
>> +	{30,  V4L2_MPEG_VIDEO_HEVC_LEVEL_1},
>> +	{60,  V4L2_MPEG_VIDEO_HEVC_LEVEL_2},
>> +	{63,  V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1},
>> +	{90,  V4L2_MPEG_VIDEO_HEVC_LEVEL_3},
>> +	{93,  V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1},
>> +	{120, V4L2_MPEG_VIDEO_HEVC_LEVEL_4},
>> +	{123, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1},
>> +	{150, V4L2_MPEG_VIDEO_HEVC_LEVEL_5},
>> +	{153, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1},
>> +	{156, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2},
>> +	{180, V4L2_MPEG_VIDEO_HEVC_LEVEL_6},
>> +	{183, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1},
>> +	{186, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2}
>> +};
>> +
>> +static u32 vpu_find_v4l2_id(u32 id, struct codec_id_mapping *array, u32 array_sz)
>> +{
>> +	u32 i;
>> +
>> +	if (!array || !array_sz)
>> +		return 0;
>> +
>> +	for (i = 0; i < array_sz; i++) {
>> +		if (id == array[i].id)
>> +			return array[i].v4l2_id;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +u32 vpu_get_h264_v4l2_profile(u32 idc)
>> +{
>> +	return vpu_find_v4l2_id(idc, h264_profiles, ARRAY_SIZE(h264_profiles));
>> +}
>> +
>> +u32 vpu_get_h264_v4l2_level(u32 idc)
>> +{
>> +	return vpu_find_v4l2_id(idc, h264_levels, ARRAY_SIZE(h264_levels));
>> +}
>> +
>> +u32 vpu_get_hevc_v4l2_profile(u32 idc)
>> +{
>> +	return vpu_find_v4l2_id(idc, hevc_profiles, ARRAY_SIZE(hevc_profiles));
>> +}
>> +
>> +u32 vpu_get_hevc_v4l2_level(u32 idc)
>> +{
>> +	return vpu_find_v4l2_id(idc, hevc_levels, ARRAY_SIZE(hevc_levels));
>> +}
>> diff --git a/drivers/media/platform/amphion/vpu_helpers.h b/drivers/media/platform/amphion/vpu_helpers.h
>> index 0eaddb07190d..dc5fb1ca2d33 100644
>> --- a/drivers/media/platform/amphion/vpu_helpers.h
>> +++ b/drivers/media/platform/amphion/vpu_helpers.h
>> @@ -70,4 +70,9 @@ int vpu_color_get_default(u32 primaries, u32 *ptransfers, u32 *pmatrix, u32 *pfu
>>   
>>   int vpu_find_dst_by_src(struct vpu_pair *pairs, u32 cnt, u32 src);
>>   int vpu_find_src_by_dst(struct vpu_pair *pairs, u32 cnt, u32 dst);
>> +
>> +u32 vpu_get_h264_v4l2_profile(u32 idc);
>> +u32 vpu_get_h264_v4l2_level(u32 idc);
>> +u32 vpu_get_hevc_v4l2_profile(u32 idc);
>> +u32 vpu_get_hevc_v4l2_level(u32 idc);
>>   #endif
>> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>> index 4769c053c6c2..5c6b2a841b6f 100644
>> --- a/drivers/media/platform/amphion/vpu_malone.c
>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>> @@ -889,7 +889,8 @@ static void vpu_malone_unpack_seq_hdr(struct vpu_rpc_event *pkt,
>>   	info->frame_rate.numerator = 1000;
>>   	info->frame_rate.denominator = pkt->data[8];
>>   	info->dsp_asp_ratio = pkt->data[9];
>> -	info->level_idc = pkt->data[10];
>> +	info->profile_idc = (pkt->data[10] >> 8) & 0xff;
> 
> The data should normally also include the sps_constraint_set1_flag,
> which differentiate baseline from constrained-baseline. I would also be
> very surprised if the decoders supports ASO/FMO.
> 
> Nicolas
> 

As mentioned above, I'll try to request a firmware change to report
sps_constraint_set1_flag, then driver can report
PROFILE_CONSTRAINED_BASELINE correctly.

Regards,
Ming

>> +	info->level_idc = pkt->data[10] & 0xff;
>>   	info->bit_depth_luma = pkt->data[13];
>>   	info->bit_depth_chroma = pkt->data[14];
>>   	info->chroma_fmt = pkt->data[15];

