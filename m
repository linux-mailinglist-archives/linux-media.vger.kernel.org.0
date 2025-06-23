Return-Path: <linux-media+bounces-35704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8473DAE538B
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 23:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBBF64A6CE8
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 21:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5912D223DEA;
	Mon, 23 Jun 2025 21:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oDTrW5IB"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB6B19049B;
	Mon, 23 Jun 2025 21:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750715640; cv=fail; b=tIQ2R3WH8+T5ZysYrH6Ee4Gv9g8z3lKBEK96YMTVAfdv3/HR6Dn8bNFmQZErSmWwpSE72i1XGBEy90tUzWMkojnvtyONJiXvJ911o1noLaB1Pi6+WfBufLZdi72pyeZxDDdnjpABflxpEa1OxcAvWD1xd03Vtqv1uiKDEwJYe3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750715640; c=relaxed/simple;
	bh=3XWp6iSCPCiv4A/tGKaFClU7Y5IAo38P+jiuMmVCZdA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rM1dN1TGFpFnn5FFQIdlrV/db98r27iDVnWPnC+f9g1MYxrZIf/VKIRy5WUuj2tTThTtbm5ZgDQPIuE7gta1Gv4AQkNzkaQ0hBtjf8I4FzWWLwXEoYcmacLiDcg0qjfr60srKi6mXNhiEVsNIv9WbE00A4BJ6nHu1vndjxdL4wE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oDTrW5IB; arc=fail smtp.client-ip=40.107.95.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vECy3/4lAyAGa95H3cC5EFJBEja2E97qNFdQMC1/s6D+XdCO1Co0kyTC3xjf11rfFl33+Ww2LxeH5iHMfr3KsnwGd6URElzTEtA84HgGsT2pPBjW/c9pW6lP2NuMoNOnuuKMtL7U4660uyRhEQx6yH47VsoT4mPXCnZxwWNOxbbQrhSxqaSSZHovCf4Di3d1rNWdE/wPDNfmHOYl0/EndyxFR9RFmgdPPexxGls+OKi2mwPneWVSRJ6bC7Vx88SINjK4IYjv7oZ5nVIsZmS6Bb0+iVmkLpoHxRDYyUCjcuysjnfbSbNbPTglNCJJKEUbBJj2lleU+lDBlq5S3YmzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBtLHvU2YtZrDkFMRGUVPkjEgsrqMw21mHkTcg35zuI=;
 b=xLJu0ALm96lMonVNTWRKU/feN4d+qkly0OrvvSyvHJwtWDyWQBIKSyrTx5TY2/6AyQvH5J3ecILGLwSRxFO4x41UqzL+c12hTedZV19s2iPcKHjzkDal7DYdpCmzMGZ1rVoFBw5Lu5FGbIbkc7tRfquL6bu61AQn9mv6g+Kki5STb5SPOXkIdr9Nbd4D6iqlMleg3SvGtGg4Q3grRL9lFVKd/f33EP8fIhiXaaDh2wzLBfDFCe8+OeV0XFaxDddMOO1hFr7wyn8sItqo0bf4k5Vo/2u7zoAajj3ckAZxYMJ+y04AifUPzUrRWbj+zxmuHSR6ST4RZIOWBYpHjtZvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBtLHvU2YtZrDkFMRGUVPkjEgsrqMw21mHkTcg35zuI=;
 b=oDTrW5IBSodoNNx39xXAiQDwOq5++HzYkr1SdrqHRM4IIOgszSsnN10yR1mxX1atZYTCYrDrnF3ycsLjAf+JCOa/9P02DjTMTCZ4k0FxoIE1uKqDM0w3LlBxlJ603Ln2HK8ZH/P0mjp9oDH613xhkBMmZfAqY35PlV4tMnpOrQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 23 Jun
 2025 21:53:57 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 21:53:56 +0000
Message-ID: <1ca1c306-ab79-4a4e-a8a8-1e1f691ae720@amd.com>
Date: Mon, 23 Jun 2025 17:53:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
 dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com, Svetoslav.Stoilov@amd.com,
 Yana.Zheleva@amd.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <20250614225257.GO10542@pendragon.ideasonboard.com>
 <aFk6K4mYtq24MnNj@valkosipuli.retiisi.eu>
 <20250623120613.GB19319@pendragon.ideasonboard.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20250623120613.GB19319@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: RI1P284CA0039.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:10:154::12) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e50c2d3-d5a9-4834-415a-08ddb2a073d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVFHQzV1VmVvZXJic3NZeXR1enhZZUR5d04xaDh3Lzlsd24rdHYxRzl3MklW?=
 =?utf-8?B?ZDVrUEc5cE9PZktKbU5ZdHVoWWxwYmxpVWJwMVJQUVZzTS9BZ1lqenlEZm1P?=
 =?utf-8?B?MGlZZFlyNTFNakdUMDJ4T3hNc1hjVWFrbGVSOFZrL3g1RmFDZ25OeENXNjly?=
 =?utf-8?B?ZVV4c2ozTVhRVytzblM2dTQyZGtKUklpNVJBZEhxVFZEVk9GQ2Nnek5JZERo?=
 =?utf-8?B?SUpQd2xwbWpXV25XMkUxdFRmMzFiK3RXNXd1L2UzbGFzL3BRbkJxcCt5M21n?=
 =?utf-8?B?b0hHcWtsdHh1elpRSHJvL3Ztd2RDMlhxdTVlcWlHYnJGampmYjdvS1kvSWRh?=
 =?utf-8?B?eWRMWGljaFdEcXc5dW5rbXRpeFVoVm0xVnhET0VQNHU2MDBUWUpjUmR4N3ht?=
 =?utf-8?B?SE0yT2FWWGtiTWhMYnl2K3V2TEs3aGlJYjF2dzhFZHBQWWxERCt4OUlvWFF0?=
 =?utf-8?B?WjVlcTBOcW54ZDdaU1VFaVpOY3pnRTZGRm95ZGVCU2Rnek5DRS91RlNEZW9P?=
 =?utf-8?B?SDlvalduMkQwbkRVRTVVN3gvNEFhWDJZL1Qrcmc5dXZ4VW9Gb3kvL2I4eVFI?=
 =?utf-8?B?UG1TQnZlcEJtVzhUMm5tWk13RmUrRWdSVWVQTjFGWERuU29OZXBGbVVQU3A1?=
 =?utf-8?B?RS9RdEx2K1VoRDV5dkpQUHR6eVZ5czRyNXJ1QXRoSTJta3Y3UGtRZm9SOWk3?=
 =?utf-8?B?Y1F5R3dSRHJHN09zOXhwTDBHVzY1UWVPb1BhbzgwUGZXRlB3aFpJZjUvWldz?=
 =?utf-8?B?dURtbFg0Ukpta0tHTHppMzNoU0drS2cyaEMvZ0pNUUcraEZrYnRTdWNvUDFO?=
 =?utf-8?B?M3Fmb2RrallINWxydUd3M28yTVc3K3krUXNVY0Zhb09MTmJIQVNtTXRVRGx4?=
 =?utf-8?B?NFM2REg4SGtzWW1KZXBUQXNJb0l0N0FDN2N6OEZGUTl6YjFTNmo4eEFGekp0?=
 =?utf-8?B?Tjk2QUlpMkRlQUN6OWxwL1B0ZjU1RnphQ05uZU83WXh5SE9XczNYV1FOSjVU?=
 =?utf-8?B?L3l3ZllqNHNtS0RMMyt4S0tWdG96VkorMzdqSURtK0xmU3Q1KzEwUWhmamFm?=
 =?utf-8?B?UTZrNVJWdlZiOUlhdG9rbmRLNUF6NE83QTVJUnh3Vys2THViS2N1Q3Zyciti?=
 =?utf-8?B?S0N1b2VZbUpmdWtlTzdGTHdXWDdnK0VrZHRCSzgwZVR6OW9sbTc5ekU0OTIv?=
 =?utf-8?B?NnBjbnNtVExFeXN3OW5XdDE5YjFiUHNMWWp2MGxzd25tVk91Q1dOUGFHT0tS?=
 =?utf-8?B?eWtFYXhYeU9vMis0cWxjTGg4UlZqKzNnSDlKUm9NaDZhSENEektlQ1ZTZlNa?=
 =?utf-8?B?UTBxRDBWZGt5Wm1kbTYrN1ZqOVpNM0R2L25IU09KeGpmb0tBZmEwZE4weC9a?=
 =?utf-8?B?bStCaEk1VGtjeGVYZE1SdStmbzlUK2hLV0pwVndjaUdsSnlWNUdrUWRqbWV4?=
 =?utf-8?B?M2ZqTERhOGhWR04zeHEyZTYyYy96Vks4MFU1NjREUmJ3eklhUnBFV01mQkpL?=
 =?utf-8?B?SVlrNEZQSzFJZ2RmTnRQbWtBOEJTWDYvMXpmQjl4MlJqcXJyazZoWE1sUU85?=
 =?utf-8?B?RG9XbUVWUUtMUWM5L0VoTlpmemR0VldwSDNJcTU1cVMwQW13Y1cxRStsNG9h?=
 =?utf-8?B?cnJBRzhVK0RZTkJIRVVpZ0VpdVFIMnQrcHYyVktpcjlwSDhKbU5tQTVYR1Rm?=
 =?utf-8?B?UUVuMEU5MEVibWpZbVdGelFMSUlSWTRLSlpSREhJUWNPTzV2bUxIT1kvS2ln?=
 =?utf-8?B?OFUzalpFbFB5WDJDZlU1eHFnTUg5Y3VQNGNaUTlncmRJa3FyREc4KzZnd1Fo?=
 =?utf-8?B?UTlRaTBUYnFUZHJQbjdrRkhnb3d4YTJtRHZ5UHVYMXIreHlQVmRvV3AvUEVW?=
 =?utf-8?B?bmVQSHdnZ1pHOUQzUVdhYVJ0eFJLZWpZQTBvYzY5dW5od1QzSVVyY0VKa3Va?=
 =?utf-8?Q?4LoDJhGwN40=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0VYUUpRQTFlbEVsd2g2WkR3TE1NWjJ3Vk9NTjJyRDlRLzFWUE5tM3JBVlVj?=
 =?utf-8?B?WENjblBDcTYxS25NcjUzYXZqazEvS05wQjY3bGF0T3hnYVBVRG5vT09JdUEr?=
 =?utf-8?B?elZZUmVWc0NCMEVIR0NocWpQV1RCdWFaNHp3ejBUZkNuWklqaVowUmlXV3F5?=
 =?utf-8?B?cnJFTnpWVlhYMWNLWC9xM3k1dFJvTnprWkpYVlBNOGFEN0dtWGlQdlhhejhr?=
 =?utf-8?B?TTFuUGR2ZGZoWUxJR1E2RURJVXpWSzNXQzU3c1Zyc2g3c0lqMGhtUmJZV3Bt?=
 =?utf-8?B?V29zQk9sK0k4a0pwQmJEckRlZit3aVhvSnFGblEwMUo4WE5MOW50SW1leFpk?=
 =?utf-8?B?bFhpa3lsZW9DVjdVUjVpQUdkNVZXODNpWHNvaWVjeDh1UzNGZnhWNDltRzFH?=
 =?utf-8?B?clRZS2VITm9VZUpCLzZCRXJjWHlnbkd1SHk1eG1zMXRYQjhXV2dGVlhNVm9Y?=
 =?utf-8?B?R083ZkZFVkszVENET0UrTVdhTXBGZWE5djBZTzh3YWNhRmZ2aHA4NDJhZ2cw?=
 =?utf-8?B?czA2enZmMHRuYzlUalJQMFdpeVhubXdYTFdkdU5zM25pT0dKQnY3M3ZRMUJz?=
 =?utf-8?B?SVdoaUE4WG80TVd3dnMyS2RXSEszN0REUzZybVI1VnJUaVZMakQzRVhIWDhU?=
 =?utf-8?B?MEdUcTFzdDQ2dWkrWDVzb1pkSEdLdWJDL2YxcGtXUUJRZzljSUk4TWpqUGtJ?=
 =?utf-8?B?cVlHTnVqNGV3am9CU2VRQ0lGVTA2eDY5cklHSE04ak4vMGNDQy9IbTkzSEZ1?=
 =?utf-8?B?Q2I0b2EyNmNqQ2pxWTlxekJEdzBabDlDVkdrWVF3NGRFT21jcUxSbGdSV0h4?=
 =?utf-8?B?WTZ5bHk0UzdHOWtRdnNhWGY5NXZINVlHMTM4bWhFNStYWktwWjd6WFQyT0Uy?=
 =?utf-8?B?aWFoSTFaUFZENzFwLy8rd3RNa0wrY2JiWVpOSVRtWFhpNFo4VE4vN2c1N2Vz?=
 =?utf-8?B?VzRhSlBaNjArdUQwSTFScVM3Yzd5WGYwc3pBYi9VdDBYVk5POVpUemRqeHhu?=
 =?utf-8?B?dkp5NjJ5a0pqSER5MXBwdVd6aFl2eDVpTThaTGVEb3JwSnR6ZzhLdEMxQlZK?=
 =?utf-8?B?MkRhNjZUN0tudE1IcTBlbEFyOXRTa01OT1FGWWl5VUpCQk1ER1ArbFlxZXVa?=
 =?utf-8?B?VmZDamFzZHUycjFPMGcxUmcwNFhYd3NnbjBWaXRJdEVIYVMyN1ZZZnNnOXls?=
 =?utf-8?B?bGpucGVXU1RKaTNSV3pMMjJUL3pVNXlQWFBoY3Ftckd5b3dQY0IyZTg0bUpn?=
 =?utf-8?B?L2pCNWl1ek1ZSVVEbnF3UWl0NkJjRThhdVFJek4vbUp5ckc3Q05TNy9qelRT?=
 =?utf-8?B?OHJIdTZ1cFFBSzNMbXZKQnJXYit2WXBDSUJ4cVM4aStVZmQ2ZFZsTG80KzF2?=
 =?utf-8?B?NVRjczRBSC9FL0QrNnBTKzg4THdiUi91ek01SGlsUnA2eXlyakVpUGQ3RG9M?=
 =?utf-8?B?dFVqaDNWMm5qN2E3MjNLZ3dob0IxVHBjMFNOL1NMbktVVmF0RGJpTVl2ZEZ5?=
 =?utf-8?B?Tk0zbUdhOENYaXdrbWtQc2h5UmNjUEl3bjFwT3RwWXdDTVFZdWRuZW5PamFI?=
 =?utf-8?B?RnVvTU5BamlpKzZtekphbEdDRlBhTjcxMTlJbVZRNUNmWmdnZFoxS1Z4d0lN?=
 =?utf-8?B?TUZ1NUFycVZ0UDZYYWUxQ0NIdXVoc3NDV2JabW4rMndXckJ3TFRvcjF4MUVC?=
 =?utf-8?B?aWdsYm5KMVZlTllhcVN2dzRGYTF4Skk4SG5WMUhqZ0k5SGpkQU5JOFNHM0FE?=
 =?utf-8?B?aEF0NEhzOXJzOHpYdzRlNnM2dXFiMUdnNWEyTzFESnJIQXppR2pqbEtTR21K?=
 =?utf-8?B?dTkzVFBGZGdTM3dNdTJIY2ZHeElGT0NjTVpKTTd3SWQ3TVJzT09FWVg2UXRy?=
 =?utf-8?B?NTBJVFNySXMwTGNHdEI3b01uWUZ0dzJzaW1jUmZTU2VTb0lMdm5sd09Jazc2?=
 =?utf-8?B?cktkS1g5cmc1STZRUXp3UUZwNFpLaTlNbTRYMTNIVmN6YnpjOVV1MkVRek1V?=
 =?utf-8?B?S2JraS81aFVnK3h1d2ZyNER3U242RmxSdXRBVkFoS3BvUEoxV1Y4dGZTQmJF?=
 =?utf-8?B?VGhFc0RVYSt0UERHS0tBSFpERjhjbUlCbGFvY0R5aHZFVlMwcjJoQ1k4UG9z?=
 =?utf-8?Q?NY1rx4T3T3kqqSI7sukKeJdoB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e50c2d3-d5a9-4834-415a-08ddb2a073d3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 21:53:56.7844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBHVka6ugvUO2/tahZn85RdjbnB62OScdHg0gDZSjJJz1fDferOLLJ9oeJmolfLfBKnqqtNk6nZcXVgNaoCFSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879

Hi Laurent, Sakari,

On 6/23/2025 8:06 AM, Laurent Pinchart wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, Jun 23, 2025 at 11:27:39AM +0000, Sakari Ailus wrote:
>> On Sun, Jun 15, 2025 at 01:52:57AM +0300, Laurent Pinchart wrote:
>>>>>> +#define OV05C10_REF_CLK                      (24 * HZ_PER_MHZ)
>>>>>
>>>>> Seems your module use 24 MHz clock input. The Dell's modules always use
>>>>> 19.2MHz, which means your the PLL settings will not work on Dell's.
>>>>
>>>> This is ok as further work. Please send a patch. :-)
>>>
>>> The patch should calculate PLL configuration dynamically, perhaps using
>>> the ccs-pll calculator if applicable.
>>
>> As much as I do like your suggestion, I don't think it's really feasible to
>> often do this for Omnivision sensors (most others largely do just work
>> without much hassle wrt. PLL, as long as a PLL calculator exists). This
>> sensor's PLL tree is different from CCS and badly documented, as expected.
> 
> How much do we know about the PLL structure ?
> 
sorry to inform we don't have much details, we've consulted with the 
sensor vendor, but they are not willing to share specifics regarding the 
PLL calculations, register details, or configuration settings. They have 
recommended reaching out to them directly for any PLL configurations 
required for the modes we intend to support.

Thanks,
Pratap

>>>>> Seems there are already several camera sensors using page-based registers.
>>>>> Is it a good idea to add page support in CCI interface?
>>>>
>>>> Sounds like a good idea as such but I'm not sure how common this really is,
>>>> I think I've seen a few Omnivision sensors doing this. If implemented, I
>>>> think it would be nice if the page could be encoded in the register address
>>>> which V4L2 CCI would store and switch page if needed only. This would
>>>> require serialising accesses, too. There's some room in CCI register raw
>>>> value space so this could be done without even changing that, say, with
>>>> 8-bit page and 8-bit register address.
>>>
>>> Ack. I've worked on a driver for the AP1302 external ISP, which also
>>> uses pages registers. The full address space spans 32 bits though, but
>>> fortunately the driver doesn't need to access anything above 0x00ffffff.
>>
>> 0xffffff?
> 
> Yes.
> 
>> The current CCI register addresses are limited to 16 bits. To
>> support that, we'd need to use u64 most likely.
> 
> I handled it in the ap1302 driver, by using bits 31:24 of address to
> store a 8 bits page value. It's a hack as the CCI helper currently only
> allocates 4 bits of the address to driver-specific purpose.
> 
>> For 16-bit register
>> addresses and 8-bit values which probably are the most common, that starts
>> to appear a bit wasteful.
> 
> It is wasteful, I don't want to turn the register address to a 64-bit
> value.
> 
> --
> Regards,
> 
> Laurent Pinchart


