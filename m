Return-Path: <linux-media+bounces-39486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53248B21BAC
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 05:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 235352A00BD
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 03:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FC62D29B7;
	Tue, 12 Aug 2025 03:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uVzujczk"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62101E5B7A;
	Tue, 12 Aug 2025 03:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754969799; cv=fail; b=TXeFUvwfAb2C4xtnQX3qJirOcVQ5na4uQ4KgGK5sC+kVAlUTPSPC/FFCrP3mdH/VZ/YLcdS5dJKHciMOfzw2ICtWplLfalipFi8k3YNyuQ5+JG9hKuqrdVjM96OnBFCEDLO1MIByyNsrBzHKrs9wcHQCCp3jN0Fy2UJdcvsNSMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754969799; c=relaxed/simple;
	bh=SqWC+RWd1cheqPQtTHdam/np+7aGBUl6+TggZlaNEEo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jLQdOffUeh4BtCJvNUprSmr+GToSCUTVepLnrlBf+kjsE4W4RG7rCQfWNskgqd0lwt8iw95QWBvkPwLgWw7dJT0trVQHjLMJk0eRFrazhc0jF+81m9ZQX2VVWtlAmPvLbcWLvdTSoW4VmLKLFLn7sqKI+3fhLRHxZoFmB4AdOiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uVzujczk; arc=fail smtp.client-ip=40.107.220.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i23BT4GosAf3/eBM17LCg96UESof/T2dZQzWNjOPQx1Nqjw8ClGNrRL+SbWAZf/ynlXVRdidaqFr9X5l7ShhSXpI1qeSN7ryEFv+Gko/tjJNO/EAeQ9Y6juWnSdfzLuqgYfhPTlfbFAKstryTLmg4Z/6sOBycn+zdlq94xZwvyMwuWD6inPpwfhcfOZFSjxzjpl2neAQOCrIFxApBCE1KKWVwQpxnd1P/3yKYKit09qQC8rZ9gNQ5hdlmVMS4SpYcO6AoxQVBKSoHmVl6QxxiMTtBU9obATBfxogR8G5P4Di5BXX0WG+7V06u6DckWPoNRqXyLHfmeDgebjy8OvcFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlaFlTI+LuDu3EihSYe9BgV1weToAo6akEML1SmRzro=;
 b=S7kZn9shE/hfMWZW+vHAvYni2GVVNwJ5DzIXkh1RFZCNc6OSwav4NyzZircbfuB5vbLfQjbf5JrhJpVAAbAM6WGcuGYWZlJfkmuMqawLd1PEnZUv8NIqA8503OzXzn3InOgylHxCyl1JEKIZAwFidNwe+9PjshWrRR+Uvuj9QyLzeCbcjk/NtGiTIM5GD7tk/Q/oBo+AIxLy1yLuLnMB/17/P+keEP+XFyvMz7n8zA18+EQ704QS+ltDxZoAkFAJc8wlO2RWIPpL3f+opkT7xnYhNXXqYETwD27XnmlM0ccMHOfFCRm9/LTwjdY6sYe3A/3O0Xhym2KWDyjZKFrfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlaFlTI+LuDu3EihSYe9BgV1weToAo6akEML1SmRzro=;
 b=uVzujczkpbPwOovmpf1WPqcD7C5C9OYcTiHva+wlPG8HnpG2H56FjLSaYzC+GnpQ0F7Xmq3+/dmAzO+8+Y4lnSnBcuxIv0EBXJQfSkRR7bMfbTrw0ZH6Q5492iXd/xVLxtZbEnPWD3l9QuuErCipfwplZJywkISoNV2mGb6Kh2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by IA0PR12MB8227.namprd12.prod.outlook.com (2603:10b6:208:406::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.23; Tue, 12 Aug
 2025 03:36:34 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9009.016; Tue, 12 Aug 2025
 03:36:33 +0000
Message-ID: <50f0958b-5234-4a89-a57e-5d330cca13af@amd.com>
Date: Tue, 12 Aug 2025 11:36:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: platform: amd: Add isp4 fw and hw interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>, Richard.Gong@amd.com,
 anson.tsao@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-5-Bin.Du@amd.com>
 <aIclcwRep3F_z7PF@kekkonen.localdomain>
 <b033bf6c-c824-4f6d-8025-b6542ea8f35f@amd.com>
 <aJnYE2Z7F-PK1VHL@kekkonen.localdomain>
 <20250811123102.GC30760@pendragon.ideasonboard.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250811123102.GC30760@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|IA0PR12MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd5763f-c34b-415d-764a-08ddd9516f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjU4aFFma2ZWMFU5MFRyVWVVaWNYY0hJZllwZFFKUE55VG1uWHMzQmVtM0VJ?=
 =?utf-8?B?UjJ4QnM2anI3bENDaTlxcGZ1eCtaUDFyeG9JNE5GdFZXQUJzUURBQzdsd1hC?=
 =?utf-8?B?VG9KdU5TWkJ6Y1pneUtDMy9TbDFxYXJlUFJzeER5MWE4ckM1d09tQTZ1S3Bm?=
 =?utf-8?B?b0dQV24xUXJuSGs4ZEJpbWtZMlhwSWlZQWxPWkl3WUtJZ1RWd3VxZ1BLSlpD?=
 =?utf-8?B?bzNzYkZMMzUxTVYyYUVUNi93QW5aQ3B4aE13d09DQzljRGxPUXlQWk1wRlRG?=
 =?utf-8?B?dUhzQ0JURUJwWkZqS05EblRhNDNueVpETXZwV3kreVRnZTEzakNZVFlnZk10?=
 =?utf-8?B?NkNXbE1MUVplbURnN2ZBWjlxTm5EczN2L09LOHlXM2d1LzNNZXBack9ZNFlX?=
 =?utf-8?B?ZVg1UjF4dXpPMUtkWGdCd0tISHlUS3doS2tHYUpFT3VHNkYyNHFIUjJJWUQ1?=
 =?utf-8?B?QWp3UTVnSXYxWUZ6cDhQKzV5Sm1NMVY1d3lxVzdSVmNGZUI1aHlGZ1dEVmh4?=
 =?utf-8?B?TjM0QzREUld0MXJQYmtMZ25DdXhOdWNSU1hlUUlJQ3paaGgzcmlBSHFMM0xu?=
 =?utf-8?B?bFRrZ3g5aWhQZ2xiLzVXT3lxZWdKTXFkNUMzNUtLNzJ5MHZrT1d6aVJIREht?=
 =?utf-8?B?ekplZ1JCZHNNQkpzMzhaTi9yY21TeW1Pdk9SY3R0NW1aMDI2bFVYeTVqN0Y5?=
 =?utf-8?B?Nk1Ka1UvUG5tQVFJSkN6eFpGcDRmQ0ZHM1c0VFJGVER1Ylk2WHFIUjROekh1?=
 =?utf-8?B?Z3gzN2c1VlpKRXcyY0NDRWUrRmxySTltbUtQUGdSQ1pzenlDUjBBZ3NwSE9T?=
 =?utf-8?B?RUhLY0hSRXM3eVpPWlcvejJUT2pCWUlydFFhQWFPWmFaNURRdXQvaG5zU2VC?=
 =?utf-8?B?bHpudkViTnBXL3Bld0pucDZxelFRd1RldVNkSS9MQ2xBYnB6TDZpZmVWTVZw?=
 =?utf-8?B?NytUdWFzbml0Q21jMEVzSVdhRXR1VVpBaEZZZXN4SFZJeGRSeWZ2MnJqcGJB?=
 =?utf-8?B?b2hCSG1YT3psVFAxQTJBTWhZdklTekdWbi84RkFBWmpiL0NzL0YxUUhNUzRG?=
 =?utf-8?B?VU9FVjErOXRsMjJLT1BUZ043Q2EyZ0VTK0ZlS1JhblB0Nk41T2diRWZacWlS?=
 =?utf-8?B?ZWVQSjhNNmEvcU5XUnlVZUN3aERwVGlNYmVsdlNxSGRUbjByNnhMa09lRFBJ?=
 =?utf-8?B?NFEvRjlKTURzYzRxajVnTkxkN2JReEQ3M21VS2d2WnlLbXRzMzhGcHJMWGQ3?=
 =?utf-8?B?Z0ZOQjdXOTZmSVVFQjVHUHFPY25mUm1YQ2hkbW9LcWhZcjZEdUJTc1RHNmZC?=
 =?utf-8?B?Uy9ueHYyMHBINmxWVWVaS2JWTUwvcUxuSlVoWUhyUzBJTVBuek9IS2U0eEVh?=
 =?utf-8?B?WWlMRVVzQkkwNkpmNHgwZndVZmszN0lYaVU1Y2dqVTZKR3dzeVgzcmpwMzcx?=
 =?utf-8?B?cDA5YmVzL3NHZGsrWmhPU01WL3Q0R2dOTGpDeXZPdFl4dzY4aEVxRmxPVDda?=
 =?utf-8?B?ZlY1ZGJYOFVKVzRvNkt4UGdPcDlBbEpDN29DYnhsTlp2QjVyYkFnS3hXamtO?=
 =?utf-8?B?bXpZajFnZU5HWlhEaXZmNzNuT0hOQ09WRDhjSWgyRHhidEs0LzFQcTNvaTdB?=
 =?utf-8?B?ZkhreTVRbnpIWnpLZFBsb3JVdHh6dWFFVGJ1ZDkwRzdBMVJXL2d2SHkvMGR4?=
 =?utf-8?B?bGdCaTRXdlV4ZDV0WVlpdTM1S05vejRwNVBVeTJXOGpFNUFoRm9BQU5HUmwz?=
 =?utf-8?B?V0ZoL00vNkdkYTRwTDQ2MWVLckZtcVFlWHBkcmJ6UlFNNkI1VWpIOFN3cEp0?=
 =?utf-8?B?OXFGSDV6am5BUDFCVHEvemdiTElzZ1BRM0x3b3ZJUmtnd1ZrQ08vVjZLeW1V?=
 =?utf-8?B?TG5zbTVvcmxES2tOdVJqazV2Z2p2ZGcwbnhJZmszeHFiaFhXRVpQTmJLK1pO?=
 =?utf-8?Q?Ucsj4zWxFk8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2xiR0xmZ2ZEYTEyYXJIM2JmeFFIcjFRRVlyV1d6THF3Y3dpcE9aZ3YwNXkz?=
 =?utf-8?B?MDBDeUZ6cnhiSGQ5WVV2dGIyOG41cnpqVk1GSU1qTmo3c2k0RlZmb0FtTkNj?=
 =?utf-8?B?QnlrU3NkNnZEbVdXb09leFA4VGVZdUFMRGlTelpWSVl4S2o1Z0ErQm9hQjhX?=
 =?utf-8?B?bUV3ZmFRQWdRdHJvYUF6ZjUxenlMWW9ITnJ2Z0JXRC9HRkhHcit6Qm4vRUhR?=
 =?utf-8?B?N0FZUnI3ZTc3Rk1MMU5zNFoxTXlySGY2S295VjYzWnZTRDRVLy91QUp0MTM1?=
 =?utf-8?B?dUlWNVJzL0oyazYrWXoybmxRbHdIRjlqMEpWUXU0YnE3cW16UHhIcXU4RHpO?=
 =?utf-8?B?TXV3VVBHcTVLbHhpK2ZrTXNQd2F5UldoUllNaUpMZ3R6MTJEVTBrQnowNE5R?=
 =?utf-8?B?bWo2OWNEYUtiWVlVRXZxb3IwMUdTeG8yU0N3QWZQbU5RK2xaZ0U3T2N6YzB0?=
 =?utf-8?B?VUdiOXdIbFlyUjQ5TDBTZWdsZHAzdzRQS0g3OWRSdDF6d3BFeFcxclFuU01i?=
 =?utf-8?B?N2FUWitWZVVyVnU0YjhwMVFxSTdyNGZzam5TVmRDL3VsRGxOSStZT1B4a0Fz?=
 =?utf-8?B?Y2RBODN0L1ROZ2MrdGZRN1c2Z3QwelN6aStmWmpMeng4TTg1TEdpRHlZZzVi?=
 =?utf-8?B?cXZVVG9WMStnYzFKcDRuSDFXeHZyNys3TmpwL2FUb3NGWlJaSCtjQ2lPUkxh?=
 =?utf-8?B?a043Mm9oTGovRXV6NzVYelRyanMyQ3lHbkx5ZmFHYUZKZ2FQTW9tbk1FSWF0?=
 =?utf-8?B?d0NlaUcrZ2hsd0w2MmN3TnI0cTN6MGNPWjN1bWNQVTZ1NmhVT2x2bGZMdU9r?=
 =?utf-8?B?bWI4SUx3VEJYYUY2MjhYQmo2S2VuWHZwL3lLaGVZeFJVUVppR1J6UzRBdFVW?=
 =?utf-8?B?N3JUK3VySWtjSEUrdUNYemVwSHZmTkhnTytoNUl3MjVzUTU1ZVJRRERyRmdD?=
 =?utf-8?B?bjE1WFpkZlNxRlZYWUpsYmhOT1hld2cxTWwzUlZFNit2TEMwenkyd29ES1Bu?=
 =?utf-8?B?M3hIenJmNnd3TU1LcHk4cjhLempSb0c4NDI0SXYrWCtGQTE3dHdOUFZnSWV3?=
 =?utf-8?B?L2xMcU1pSmRtbkxQNHZSYzRCQlVXeXlKeEZ5RURoWG9WZzFCZG5PZFNqYmJ5?=
 =?utf-8?B?c2FJUmNvUDV0dFdNS2FCczFpNm5xdmF4eEQvMjhQaFVmRTV6Z05rTGoxMHRP?=
 =?utf-8?B?SHpDWWFjQmtlYlAvb1ZhckxrZkc3QjZLVjc2THZZWFZ6Ni9hTzdMcTVZaTV5?=
 =?utf-8?B?dWNYYyt0UERSc2k0MkpPb1l5NnhwUVZXczFQeCtCejFiL1hyb1l4MTJOcjRj?=
 =?utf-8?B?M3BzcFVkeDl1d0loblY3b2Q2Z0s5QmR5c0tvaFVGTHNML205SmZqaUNpL3dk?=
 =?utf-8?B?TTFRemw2SFByYUFTbmdDSVQ4aUxIbDVqMUx1enFCS1JHQ25qYng4dkNrNEdH?=
 =?utf-8?B?V1luVmIyNWI4Q0JyNVg0cXYyS1U5OCtBSEsrWEdScUx4Yi9tN25wbU1EUVkz?=
 =?utf-8?B?K2pCeEV4WkNwVVhndVVRZzBlUGw2QXFIc21RUHdRMmhhUy8xcWxONmI0WVlU?=
 =?utf-8?B?WGwzZjNDZC9TdWxvbFR6OG9pSHVpTGlkWFdydGFNN0NJaDlHQ2Y3VEZCNEhN?=
 =?utf-8?B?VkJzdTk0SVQxWXVYaHoyTVN0U0ltWkloS3RZYkZWWTFUbzNmYk9EVVF3WEFB?=
 =?utf-8?B?cktXbjBnamc2Mnd2RTR5N0NJRG9JcWNjS3lQQnhJeEFqckhLQXE0Sjl6QkQz?=
 =?utf-8?B?UTdZQ0NQYzgzNTI2aTVlZHFqd2c0Qm5Ib0J6czFybWcxdXd1ZUd5czIrZEpn?=
 =?utf-8?B?QXVRSXd3QWMrcjFrSW5UZi9TTlhXaTY5dzE3aHFkSUIvY1FGaWM2WGsxOTdu?=
 =?utf-8?B?cVhDYytDakdRQjBVV1hlR09zNUFMcXZnUjFwNWlMaXpsRGo5WDZXTVdtUGtj?=
 =?utf-8?B?SFBFdmZoWUl6UXZEZVZrK0h3c014cVc2Wit3bFpDSUo4TEl5M3E1TUpSV0E2?=
 =?utf-8?B?eEcremZBYWpXSDZhNU5pSFM1Vjk4bGV2bW1oaG1OeWhHZHE1aldBVzJ6QlVy?=
 =?utf-8?B?VVBlaE1BbEdvaFFFVUNOaW5lUHdGd2g2MlcrbDhFbnF0MTh6SzhLVGxyb085?=
 =?utf-8?Q?Dcw0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd5763f-c34b-415d-764a-08ddd9516f09
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 03:36:33.8717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwuaNy+d5X0TsCj273qMC7130BwlZWYHvs5qnQsM0khPsPSn5o3l1lVGKth0DXhh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8227

Many thanks Laurent Pinchart for the comments.

On 8/11/2025 8:31 PM, Laurent Pinchart wrote:
> On Mon, Aug 11, 2025 at 11:46:27AM +0000, Sakari Ailus wrote:
>> On Tue, Jul 29, 2025 at 05:12:03PM +0800, Du, Bin wrote:
>>> On 7/28/2025 3:23 PM, Sakari Ailus wrote:
>>>> On Wed, Jun 18, 2025 at 05:19:55PM +0800, Bin Du wrote:
>>>>> ISP firmware controls ISP HW pipeline using dedicated embedded processor
>>>>> called ccpu.
>>>>> The communication between ISP FW and driver is using commands and
>>>>> response messages sent through the ring buffer. Command buffers support
>>>>> either global setting that is not specific to the steam and support stream
>>>>> specific parameters. Response buffers contains ISP FW notification
>>>>> information such as frame buffer done and command done. IRQ is used for
>>>>> receiving response buffer from ISP firmware, which is handled in the main
>>>>> isp4 media device. ISP ccpu is booted up through the firmware loading
>>>>> helper function prior to stream start.
>>>>> Memory used for command buffer and response buffer needs to be allocated
>>>>> from amdgpu buffer manager because isp4 is a child device of amdgpu.
>>>>
>>>> Please rewrap this, some lines above are quite short.
>>>>
>>> Thanks, the line after the short line is supposed to be a new paragraph?
>>> Should we put all the description in one paragraph?
>>
>> One or more paragraphs work fine, but a new paragraph is separated from the
>> previous one by another newline.
>>
>> ...
> 
> Paragraphs are defined as a block of text that convey one idea. They
> should be visually separated by a space. As we can't have fractional
> line spacing in plain text, paragraphs need to be separated by a blank
> line. This is a typography rule that maximizes readability. There should
> be no line break between sentences in a single paragraph.
> 
> Whether you write commit messages, formal documentation or comments in
> code, typography is important to give the best experience to readers.
> After all, a block of text that wouldn't focus on the readers would have
> no reason to exist.
> 
> 
> Now compare the above with
> 
> 
> Paragraphs are defined as a block of text that convey one idea. They
> should be visually separated by a space.
> As we can't have fractional line spacing in plain text, paragraphs need
> to be separated by a blank line.
> This is a typography rule that maximizes readability. There should be no
> line break between sentences in a single paragraph. Whether you write
> commit messages, formal documentation or comments in code, typography is
> important to give the best experience to readers.
> After all, a block of text that wouldn't focus on the readers would have
> no reason to exist.
> 

Really appreciate the detailed guide, will follow it. May I summarize 
like this? 1 Separate paragraphs by a blank line. 2 Don't add line break 
between sentences in a single paragraph, an exception to this is commit 
message, because of the 75-character patch check limit, line break can 
be added, but it should at the 75-character limit boundary

>>>>> +	void *cpu_ptr;
>>>>> +	u64 gpu_addr;
>>>>> +	u32 ret;
>>>>> +
>>>>> +	dev = ispif->dev;
>>>>> +
>>>>> +	if (!mem_size)
>>>>> +		return NULL;
>>>>> +
>>>>> +	mem_info = kzalloc(sizeof(*mem_info), GFP_KERNEL);
>>>>> +	if (!mem_info)
>>>>> +		return NULL;
>>>>> +
>>>>> +	adev = (struct amdgpu_device *)ispif->adev;
>>>>
>>>> Why the cast?
>>>>
>>>> adev isn't a great name here as it's usually used for struct acpi_devices.
>>>>
>>> In the next patch, will use new helper function for this and will no longer
>>> use amdgpu_device
>>
>> Use correct types when you can; either way this doesn't seem to be changed
>> by the further patches in the set.
>>
>> ...
>>
>>>>> +static int isp4if_gpu_mem_free(struct isp4_interface *ispif,
>>>>> +			       struct isp4if_gpu_mem_info *mem_info)
>>>>> +{
>>>>> +	struct device *dev = ispif->dev;
>>>>> +	struct amdgpu_bo *bo;
>>>>> +
>>>>> +	if (!mem_info) {
>>>>> +		dev_err(dev, "invalid mem_info\n");
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	bo = (struct amdgpu_bo *)mem_info->mem_handle;
>>>>
>>>> Why do you need to cast here?
>>>>
>>> In the next patch, will use new helper function for this and will no longer
>>> use amdgpu_bo
>>
>> Not quite, on top of this patch number 6 adds more of the same.
>>
>> ...
>>
>>>>> +static struct isp4if_cmd_element *
>>>>> +isp4if_append_cmd_2_cmdq(struct isp4_interface *ispif,
>>>>> +			 struct isp4if_cmd_element *cmd_ele)
>>>>> +{
>>>>> +	struct isp4if_cmd_element *copy_command = NULL;
>>>>> +
>>>>> +	copy_command = kmalloc(sizeof(*copy_command), GFP_KERNEL);
>>>>> +	if (!copy_command)
>>>>> +		return NULL;
>>>>> +
>>>>> +	memcpy(copy_command, cmd_ele, sizeof(*copy_command));
>>>>
>>>> kmemdup()?
>>>>
>>> Kmemdup is to allocate memory and copy, can't be used here.
>>
>> Isn't that what you're doing above?
>>
>>>>> +
>>>>> +	guard(mutex)(&ispif->cmdq_mutex);
>>>>> +
>>>>> +	list_add_tail(&copy_command->list, &ispif->cmdq);
>>>>> +
>>>>> +	return copy_command;
>>>>> +}
> 


