Return-Path: <linux-media+bounces-36361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D84AAEEA7D
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 00:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6956F423333
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10834242D75;
	Mon, 30 Jun 2025 22:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ba8KAf/d"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2057.outbound.protection.outlook.com [40.107.101.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BD24502F;
	Mon, 30 Jun 2025 22:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322723; cv=fail; b=anF6fzTGuhxnYvjFiLb2Er8FfbZeWpMu9W8b5iM4t7ueHdlBqILeUJ/35Sely2YETUijrPey7TjORJ34+dUZMPnLBB3s81G6i1t/zYVIGXb3Y8kgxOV+/MuNc43q517aOCSDtSnUkIF/c5Ge0aeIoXhvap9e1G8WilVv78xV6so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322723; c=relaxed/simple;
	bh=rj+6N4sWw6gQ2KzNRWC2hfAVldoy5TC6UeWZU8wZAhE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SilSn4hbYe+BD/SrDBamHdoCM4rPj7RyAen8JmR8j1L6I1mIUVmA14bqAjSQyDS6UES8o6esptzqCP4zu9vRAj5nCxHDO3TaoR0PUEo9Ek0udrSXVH+M3MXiaOWMBCaRNP/k1zsc9jWOX0iOVzAq9jhoPm6rG1iXFS0cosrGpWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ba8KAf/d; arc=fail smtp.client-ip=40.107.101.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wvl2p3uSD0YokVnumTYF+k5fum++O0VLEc6iauJrC5v7owS2ivUcoNlYK1KKCXwX8tSkepp4z4abUcF60RA60629cseBl8ZwL3wtFUMQypHSutUYjMzZ7KYnZFKiQqGPvbhJPTD3+ZHtKoRcU4shAYq33X09MjTdHSnt5r5Hr+GxneVn4EGGzJ3/+Mk6tZLCNuO6+yIaZTYqDrftIDsNHm55ERicinaZ1mt17EcR5jthNwzJ/6C06oqntH3rxZlGJi78imDXYG6RIS6ENailR6MqE1rQqZCy9LAWW2tlJKYLw9q4ontmBUCMKTNgFpJrJSKcObinIbP4xXXQ7xWBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEJU2LFD1vkYXrbPJak/0ihp9oGmrRiV8dxtm4fiC9g=;
 b=gF35D8ZVJnlXTAvSUqYGKrKWN2tCEGhrlET6sXpWbENJWwOdl2VZqkOxr/rUYwrrR/Ykln1q6MaQfKyzKdiIkonctluehD7Mu1GpFmrTOeMPNCmPpVVybKjxn0iI7E5WG0cpDXB+Yl8VHZX42nXjBxAGIXO2wc84dr5K0OvO2d7Iuf88N//HaDOIL6xSuJ2oud8tkUC/u5e0F4CuTx6OJFdouXWbakI5BMnJnGEwViYzBNoSTK0PV4GNRmF6zpiaCT9D9ON47IqPu1GjvBho2pb11jVQqMke306wHqE6NDpg5HsXYztUCC5x0trwhSrpfLOCMBeXwMdChQQtktRbsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEJU2LFD1vkYXrbPJak/0ihp9oGmrRiV8dxtm4fiC9g=;
 b=Ba8KAf/dkwfTD/4MTlAVye7dPD0NuDIloKtlvbt2Ii2qxD4z9rcGHUDdHfhKJVu3xPFSCEEfBZrZCNosQTtg3vYfvQdeJ62PoKO19o+NYlt5GMW99Xwu76Q3/+/98zeigcEbDrENJF9zgaP202mmISffK0PrMeRnx2WkIdapdZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Mon, 30 Jun
 2025 22:31:59 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 22:31:58 +0000
Message-ID: <702594a4-ebc3-471e-8551-d94f0dee2982@amd.com>
Date: Mon, 30 Jun 2025 18:31:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 krzk@kernel.org, dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <20250614225257.GO10542@pendragon.ideasonboard.com>
 <f6d1d8f7-d953-4f86-a196-f713726bd5f8@amd.com>
 <ec790d0e-4bdb-49b9-80ad-f44e1b700a5e@linux.intel.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <ec790d0e-4bdb-49b9-80ad-f44e1b700a5e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0049.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::6) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SA0PR12MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9bd5fd-5fa1-474e-b4d1-08ddb825ecfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEg5ZmlIaVYrcVBmSkdabXE0WGIxMzVXcCtBVFdxSnpxdmZlRnBpdGZlWTlR?=
 =?utf-8?B?TGE5Rmo3QXBsTmgwNW9qSUZFWG92S0hGRzVWREthNkJPaTVZREFMVzgwQ0JB?=
 =?utf-8?B?aWlNZENMMFBPUFlBREwzMFNmbzZkS3I2NEl6QUUrWWNtQ2FJSUZ5QmZUT1RR?=
 =?utf-8?B?OSs5WklKNityZnoyNmNYSEd1YlVoNGdDOWp3ZlE3QWRUSUpwVWtwSGoxZ05S?=
 =?utf-8?B?S1BobGlwL0xZWXl1ZDIzZHRVc3oxcXNTVlhlK0dKUVVJWUYwWnliZnJIVDFK?=
 =?utf-8?B?RWNZdEZIR2RseTV1blo4b2NjN0VDNWhPYkw0MFJXbE5QNTRzWWk5YmlRVXMx?=
 =?utf-8?B?YXJuK2hacjhhcXlqbG1aTDZUZkQ1a1BMcHczd3hhcllyT1Q1Y2xzQkpCVDR6?=
 =?utf-8?B?R3oyaGJDT3dVbkxPeDFHc2xKWkpHNjRaenVmYVRFM0N1VVFpTDh5dXhVMk5y?=
 =?utf-8?B?NEpEeUtTYnNLL2J1U0pOUldlajR6Y2ZJN1Z6ZDZiRUk5MlFaTkhtbE5YZmk2?=
 =?utf-8?B?MG1ENUJjM1Y1OGd1T2NPVUJpUXFXMDF5ZEZ3cURWd0NJZFVHOXp3MUZzSit2?=
 =?utf-8?B?dCtUc0w1Tk04ZGpIVkZZYjJ5T3NrYXdOZHkyQVJTR05Ga0c1RFRRWXBIT3Q5?=
 =?utf-8?B?d2FGMjNVL2hsSkxnV01CYTR4SytnenV1RmRuTWNnYzliQkVrNXplMEF3MFpU?=
 =?utf-8?B?NzRFL2hERHdMZGhhMXVtSWF5dzhSek5IaFNGaWh0MDRmT0NDZXJQN2tXMkRC?=
 =?utf-8?B?aHdIeEtCd3BnR0dGc2xkRVRzbUVsSWxvUHd5RHBHNDJuU0Zib1YyaktpL3B2?=
 =?utf-8?B?UjhNTTFWN0R3ZEdWK2ZUTnR5TGJWQVZicXdZRk9INVQ0dUE4TERtSmhJbFFx?=
 =?utf-8?B?a3hWK2cwZnFrVnVUbDF4VFhJSFh3aXdjdk5nWGJlUUhiWFkxa0VuRWJCQS91?=
 =?utf-8?B?V2Evb1hXSXpoV1hpU0hVcGFxZjcyWWFOay94N0hzQjVYT1h4a3lBOWF0Tk8v?=
 =?utf-8?B?bTJENDAybllRcFRZRmJ6cDFZT0ZuV2oxU3ZxM3FCeGJ5OThXRFhKTXA1VHUv?=
 =?utf-8?B?dTAzKzU5V1VTMHVlSUlnQ0NQZzhwTVZtZ1V2d0RTcTlaRWE3NldBVnd3dE5m?=
 =?utf-8?B?OGZpdDlqdy9iSU42QmNTRDdIYkNsdG95bHhZd1pvRktKWk0vb3pxa2puMDU0?=
 =?utf-8?B?dFYzVHdScXo2d0JsYm9mWGVYNlk3Y1FpVXNubTJsNm5vcHNZM2xZR0pURXh4?=
 =?utf-8?B?Z2o2RWl4dzRZc2IwRWtkdjZLV2NQQ3J4Y283ZVA0SXIwaXRsNjRCY3NDNFlX?=
 =?utf-8?B?TndFYWREZ1lhbWlUYkpjcDJXRXBDRjhHL2Y0Qm5zSUEyc2YvQlR1OHN4QmFR?=
 =?utf-8?B?aUdkMzkvVjJ2YWFvbFhuQkZNWUl1MHVINysvaThIQWxObE5jZUJ6Q2o5U0p0?=
 =?utf-8?B?cjl0andkYUxxK1ZHWDRpUEdaajNyLzBiMVZ1UXR6QWNxWHVTK0p4cnY5YzBy?=
 =?utf-8?B?M3JnZ1ZqVTJqcWY1NmJyMWc5RjN2T2ZScXVraVR6VHhvTWlXanlQZG50WDVC?=
 =?utf-8?B?NWlRajVpREJIeWFJTWJDamFOdXhNaFQ0RDdncWdQWnNmbGpKRVVvSDkzVWJz?=
 =?utf-8?B?M2wwZ244OUcrNmhEUkpIZGxmbU5jbGFYY1paL2dGcFFRemVrQ05QZFhFRFg4?=
 =?utf-8?B?MFZnQ052K2ZmRWwzcGl3U3NMdm5raFkxWmNSdkJqRHpIS2xQSHI2VWNnT0tO?=
 =?utf-8?B?N2VGM2R4cG1samt6bFBpZmNDeDFuOWpJY1BYeDY0NGdLL1RDOVVZT1V2NzhY?=
 =?utf-8?B?SlRsR21lL2NLaWhkSkNqOHZlUzJpclR5d2EraUR1U2RVd2tLMDFCZ3hvbW5q?=
 =?utf-8?B?SVpuWnlZTGdwTnIzSy9USWZHMWpXUzJReVFzSVN2cGxhRHBSNUxXTjNJWkQz?=
 =?utf-8?Q?tPxRMdkB1YA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V01RUERSc2ZrTXFNcmFhb1FxWEQvakJybFR1R3F5OXk1a3NtRFQrd3FZOGRj?=
 =?utf-8?B?SEF6dGJIR1p1RmZyRWlzU2s1Wm9pY2txSmRJNnFRVXQ5dUxHd0RKTHJERTI1?=
 =?utf-8?B?dXFZV3lpL3N4cFJlZk85bTlYcGdiZ1N3dHVrcUpEV0V4OEdxMTdnRmhBZTVm?=
 =?utf-8?B?QkUzUEhndFV6enBCcitxU3BLOG1WWlpES0g2MGNweGhydjlCL2V4MVhqMWFm?=
 =?utf-8?B?WmNZRVcxR2tRR1FXTzYxeWg4Q0lGTkhNZmdxUUlOaTltUGZjM0xwTkdPY1NQ?=
 =?utf-8?B?ZEh3MkdMZDEvRHlSanJmVG1vNG51RFVGb2lpWUhqcjJZdlozS2NsRU9nV3hE?=
 =?utf-8?B?aWlOQTFOcG00R3dPRzRmY2YzUUM2QnVlMmFTbURNWnc2TUFUcjVQcDhBL1NQ?=
 =?utf-8?B?ME1iblB3Sis0d2FYK1RNalhpLzJXbEs5NytuU1gzNFdJUnlseFlHTGhLOGVV?=
 =?utf-8?B?T3FiR1JGUCtJSldIbWszaEswQkFQQlJ2SFVwYkJ0cHRtTW8yWjBwNWpDMzlw?=
 =?utf-8?B?cHFuRXpUNGhRU2J4bEhaRnJ6YVllZUtSa1YxSlJIRS9mZW1DZ1l2c2tOZ0NG?=
 =?utf-8?B?WDhjN012cTNGczd2emh3VUdMY0xNcTk3cUFGSzdacm8wRkJJUHNmN0ovYmc0?=
 =?utf-8?B?bFNZamdNZ0JKMzFRZzBvK3h1Mm44YjRDaUlnclh3N3ZyZHRYRmZTMEZNNmQ1?=
 =?utf-8?B?ZEJqWVJIc0xXS3BOWHh2d0hiaFVPT0RXeXJOQU9UbXFLbTJIT1hRSVpsTFJi?=
 =?utf-8?B?ZGJUa2Nzdnl6UG1NTTBWdXpDLy9mdWFteXBuN1JSbE9rdnpnT3FUYU51c214?=
 =?utf-8?B?WnZaUGdST2Z6eDZxdzZlajFFOXVISjUydFFEQW1XRGllTzVTN0tiY3JwQTlh?=
 =?utf-8?B?aThqNWMxU0YwZEVzWGJHQjg2UGxqQ2pXV2xZV0Uzem16ZTRsVnQ4ZHI0enlT?=
 =?utf-8?B?Wm1OZElvNjF5Ry9ISjl3YWFvZzNnT0hpNWRtRFFLcFNLd211b1c3c05SMlFk?=
 =?utf-8?B?TEpZcjdoSHlwcjVzZ2V0UGxlWHNiTTZMdGZzcDRnVU91Q00xaCtlVUxZYjlV?=
 =?utf-8?B?bFUzWTU3UVF4QjdJZlR6L0VhamxFR2twSDgyeEFrYkJCY3o4cjQ0Q0dWS2Vn?=
 =?utf-8?B?eGpQcGVNWnU5RHJGdENVT2U0RlNoUUZIMCtJd3hOUnpubFBlT3FqYmdCeVJS?=
 =?utf-8?B?VWJZdzIyRCtIMFVOZzJqc1M1YmRBMHBCUzVPa0dlc1VycWFnV1F5UjNHQjhT?=
 =?utf-8?B?Yk9HSlg3OFUxRUdWbFVQM2NkYmVYbnFSUWZTNVNzcllYMnRoUXIzZkxYUmxS?=
 =?utf-8?B?VTNaanhkdmlTVU1uRWFvekZyd3BJRVdiTXVHYmlheVJ5Z0h0b1BmbDc5NUhU?=
 =?utf-8?B?WFcxc1ZlUG1YNkczV1JaWEhwTjhiZmkzclE3S0hVdkluRGlQbERDbTVEVHVD?=
 =?utf-8?B?Q29rejExUERpSDlwcmhTdEhGdUJlVFNQUUh3TXZ0OXF6UGZHNjJOcEk2Wk9o?=
 =?utf-8?B?L3E4cHlCTUVDa2JHTGVlcnYvRmNVN3VwNXBsWEJtRW05WWZONjNmc0Q5YkpW?=
 =?utf-8?B?TW8yTlVsdTVpcnAwclpmKzlMZWVZbjdNSWFRV1BBSHF3NnNFQXhKUFh3OTQ4?=
 =?utf-8?B?RjIySzI0TTd6U2NOWHlQaGJCNUdhcU8rSGZLR0FrNUpsWXVlZFlFZGVtMDVX?=
 =?utf-8?B?amxSeklvZURDUFJId3RUem05V3JDWFdBYk9aQ0ZsWkpWSUtjYUFoTEVXYjI5?=
 =?utf-8?B?VFlITzlrZVdCZzM5TWplVHdYaERRY2hlTi9pLzVETFpSU1orN3hqNzVhRmRm?=
 =?utf-8?B?Q3RPSFRrTkNmSHFwMUdhelA5MHp5T0xCOGhTdnB3aWZJMkhSM3pCa1FRYVhq?=
 =?utf-8?B?ZmxmQThKMVNQRmpuUUc5TVUyNkpBcnU5dHROaHRxQmtRRmM1a29BWXdLekxS?=
 =?utf-8?B?ZG8xd3R1Nlg0endlNVBxM0RORUNFWUg3dmFHR3dKZWtsbWRPa015UThLUXZl?=
 =?utf-8?B?aHhnVnNOQ012QjBzaS9MVGFlc3NXNjVoTE9qUGFWOG5PQTRNWWlZR2xNNnd1?=
 =?utf-8?B?WWFNdnNNQ2xsUmNxVG50OVUyQ2lXb0dYS0JGOXBBRmd6WDVJbklwVG95a3k4?=
 =?utf-8?Q?edPwem2YQ0wRRojstu34GNXDc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9bd5fd-5fa1-474e-b4d1-08ddb825ecfd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 22:31:58.7780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: or8GlZgzblJvS7uSIU4OsEcHEU1S59xJ7svWpbZS1x+CyLMrvQam/RAojVjvPjS9QTU2EZjFaTzuCSq3FTfHoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479

Hi Sakari, Hi Laurent,

On 6/29/2025 3:40 AM, Sakari Ailus wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Pratap,
> 
> On 6/17/25 01:33, Nirujogi, Pratap wrote:
> ...
>>>>>> +static const struct cci_reg_sequence ov05c10_2888x1808_regs[] = {
>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>> + { CCI_REG8(0x20),  0x00 },
>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>> + { CCI_REG8(0x20),  0x0b },
>>>>>> + { CCI_REG8(0xc1),  0x09 },
>>>>>> + { CCI_REG8(0x21),  0x06 },
>>>>>> + { CCI_REG8(0x14),  0x78 },
>>>>>> + { CCI_REG8(0xe7),  0x03 },
>>>>>> + { CCI_REG8(0xe7),  0x00 },
>>>>>> + { CCI_REG8(0x21),  0x00 },
>>>>>> + { CCI_REG8(0xfd),  0x01 },
>>>>>> + { CCI_REG8(0x03),  0x00 },
>>>>>> + { CCI_REG8(0x04),  0x06 },
>>>>>> + { CCI_REG8(0x05),  0x07 },
>>>>>> + { CCI_REG8(0x06),  0x44 },
>>>>>> + { CCI_REG8(0x07),  0x08 },
>>>>>> + { CCI_REG8(0x1b),  0x01 },
>>>>>> + { CCI_REG8(0x24),  0xff },
>>>>>> + { CCI_REG8(0x32),  0x03 },
>>>>>> + { CCI_REG8(0x42),  0x5d },
>>>>>> + { CCI_REG8(0x43),  0x08 },
>>>>>> + { CCI_REG8(0x44),  0x81 },
>>>>>> + { CCI_REG8(0x46),  0x5f },
>>>>>> + { CCI_REG8(0x48),  0x18 },
>>>>>> + { CCI_REG8(0x49),  0x04 },
>>>>>> + { CCI_REG8(0x5c),  0x18 },
>>>>>> + { CCI_REG8(0x5e),  0x13 },
>>>>>> + { CCI_REG8(0x70),  0x15 },
>>>>>> + { CCI_REG8(0x77),  0x35 },
>>>>>> + { CCI_REG8(0x79),  0x00 },
>>>>>> + { CCI_REG8(0x7b),  0x08 },
>>>>>> + { CCI_REG8(0x7d),  0x08 },
>>>>>> + { CCI_REG8(0x7e),  0x08 },
>>>>>> + { CCI_REG8(0x7f),  0x08 },
>>>>>> + { CCI_REG8(0x90),  0x37 },
>>>>>> + { CCI_REG8(0x91),  0x05 },
>>>>>> + { CCI_REG8(0x92),  0x18 },
>>>>>> + { CCI_REG8(0x93),  0x27 },
>>>>>> + { CCI_REG8(0x94),  0x05 },
>>>>>> + { CCI_REG8(0x95),  0x38 },
>>>>>> + { CCI_REG8(0x9b),  0x00 },
>>>>>> + { CCI_REG8(0x9c),  0x06 },
>>>>>> + { CCI_REG8(0x9d),  0x28 },
>>>>>> + { CCI_REG8(0x9e),  0x06 },
>>>>>> + { CCI_REG8(0xb2),  0x0f },
>>>>>> + { CCI_REG8(0xb3),  0x29 },
>>>>>> + { CCI_REG8(0xbf),  0x3c },
>>>>>> + { CCI_REG8(0xc2),  0x04 },
>>>>>> + { CCI_REG8(0xc4),  0x00 },
>>>>>> + { CCI_REG8(0xca),  0x20 },
>>>>>> + { CCI_REG8(0xcb),  0x20 },
>>>>>> + { CCI_REG8(0xcc),  0x28 },
>>>>>> + { CCI_REG8(0xcd),  0x28 },
>>>>>> + { CCI_REG8(0xce),  0x20 },
>>>>>> + { CCI_REG8(0xcf),  0x20 },
>>>>>> + { CCI_REG8(0xd0),  0x2a },
>>>>>> + { CCI_REG8(0xd1),  0x2a },
>>>>>> + { CCI_REG8(0xfd),  0x0f },
>>>>>> + { CCI_REG8(0x00),  0x00 },
>>>>>> + { CCI_REG8(0x01),  0xa0 },
>>>>>> + { CCI_REG8(0x02),  0x48 },
>>>>>> + { CCI_REG8(0x07),  0x8f },
>>>>>> + { CCI_REG8(0x08),  0x70 },
>>>>>> + { CCI_REG8(0x09),  0x01 },
>>>>>> + { CCI_REG8(0x0b),  0x40 },
>>>>>> + { CCI_REG8(0x0d),  0x07 },
>>>>>> + { CCI_REG8(0x11),  0x33 },
>>>>>> + { CCI_REG8(0x12),  0x77 },
>>>>>> + { CCI_REG8(0x13),  0x66 },
>>>>>> + { CCI_REG8(0x14),  0x65 },
>>>>>> + { CCI_REG8(0x15),  0x37 },
>>>>>> + { CCI_REG8(0x16),  0xbf },
>>>>>> + { CCI_REG8(0x17),  0xff },
>>>>>> + { CCI_REG8(0x18),  0xff },
>>>>>> + { CCI_REG8(0x19),  0x12 },
>>>>>> + { CCI_REG8(0x1a),  0x10 },
>>>>>> + { CCI_REG8(0x1c),  0x77 },
>>>>>> + { CCI_REG8(0x1d),  0x77 },
>>>>>> + { CCI_REG8(0x20),  0x0f },
>>>>>> + { CCI_REG8(0x21),  0x0f },
>>>>>> + { CCI_REG8(0x22),  0x0f },
>>>>>> + { CCI_REG8(0x23),  0x0f },
>>>>>> + { CCI_REG8(0x2b),  0x20 },
>>>>>> + { CCI_REG8(0x2c),  0x20 },
>>>>>> + { CCI_REG8(0x2d),  0x04 },
>>>>>> + { CCI_REG8(0xfd),  0x03 },
>>>>>> + { CCI_REG8(0x9d),  0x0f },
>>>>>> + { CCI_REG8(0x9f),  0x40 },
>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>> + { CCI_REG8(0x20),  0x1b },
>>>>>> + { CCI_REG8(0xfd),  0x04 },
>>>>>> + { CCI_REG8(0x19),  0x60 },
>>>>>> + { CCI_REG8(0xfd),  0x02 },
>>>>>> + { CCI_REG8(0x75),  0x05 },
>>>>>> + { CCI_REG8(0x7f),  0x06 },
>>>>>> + { CCI_REG8(0x9a),  0x03 },
>>>>>> + { CCI_REG8(0xa2),  0x07 },
>>>>>> + { CCI_REG8(0xa3),  0x10 },
>>>>>> + { CCI_REG8(0xa5),  0x02 },
>>>>>> + { CCI_REG8(0xa6),  0x0b },
>>>>>> + { CCI_REG8(0xa7),  0x48 },
>>>>>> + { CCI_REG8(0xfd),  0x07 },
>>>>>> + { CCI_REG8(0x42),  0x00 },
>>>>>> + { CCI_REG8(0x43),  0x80 },
>>>>>> + { CCI_REG8(0x44),  0x00 },
>>>>>> + { CCI_REG8(0x45),  0x80 },
>>>>>> + { CCI_REG8(0x46),  0x00 },
>>>>>> + { CCI_REG8(0x47),  0x80 },
>>>>>> + { CCI_REG8(0x48),  0x00 },
>>>>>> + { CCI_REG8(0x49),  0x80 },
>>>>>> + { CCI_REG8(0x00),  0xf7 },
>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>> + { CCI_REG8(0xe7),  0x03 },
>>>>>> + { CCI_REG8(0xe7),  0x00 },
>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>> + { CCI_REG8(0x93),  0x18 },
>>>>>> + { CCI_REG8(0x94),  0xff },
>>>>>> + { CCI_REG8(0x95),  0xbd },
>>>>>> + { CCI_REG8(0x96),  0x1a },
>>>>>> + { CCI_REG8(0x98),  0x04 },
>>>>>> + { CCI_REG8(0x99),  0x08 },
>>>>>> + { CCI_REG8(0x9b),  0x10 },
>>>>>> + { CCI_REG8(0x9c),  0x3f },
>>>>>> + { CCI_REG8(0xa1),  0x05 },
>>>>>> + { CCI_REG8(0xa4),  0x2f },
>>>>>> + { CCI_REG8(0xc0),  0x0c },
>>>>>> + { CCI_REG8(0xc1),  0x08 },
>>>>>> + { CCI_REG8(0xc2),  0x00 },
>>>>>> + { CCI_REG8(0xb6),  0x20 },
>>>>>> + { CCI_REG8(0xbb),  0x80 },
>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>> + { CCI_REG8(0xa0),  0x01 },
>>>>>> + { CCI_REG8(0xfd),  0x01 },
>>>
>>> Please replace these with names macros where possible. I'm sure quite a
>>> few of the registers configured here are documented in the datasheet.
>>> The registers that configure the mode (analog crop, digital crop,
>>> binning, skipping, ...) should be computed dynamically from the subdev
>>> pad format and selection rectangles, not hardcoded.
>>>
>> I agree, but we get the sensor settings based on our requirements from
>> the vendor, i will check if we can get some more info regarding the
>> crop, binning, skipping etc...
> 
> Some of this infomation should be available in the datasheet. Use at
> least the register names that can be found, for those that can't there's
> not much that could be done.
> 
Sorry to say that I don't have the details in this case. We have 
previously reached out to the sensor vendor, but they are not willing to 
disclose any of these details. We hope for your understanding of the 
constraints we're facing and truly value your support.

Thanks,
Pratap

> -- 
> Regards,
> 
> Sakari Ailus


