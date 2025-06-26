Return-Path: <linux-media+bounces-36039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FAEAEA662
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 21:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C68464A81B8
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 19:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6545B18A6DB;
	Thu, 26 Jun 2025 19:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aZZRAVh/"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BD42EF9B1;
	Thu, 26 Jun 2025 19:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965710; cv=fail; b=qAXLEsVsYIjAL+cHNeKiqXtwuKKRdgM6DKi2/ZiQNpx6qkIBY2XW3mJSwIOss+MQILH16D8jWbGZk/cqD4H9Lld4wnupE6sADERRx/BZHcFggyKfMZttbuL5BQ1ckJ4Anma/QQOMxHrCJWXGeHtCmwsFsu/SGAR5LJ1SnlvtAPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965710; c=relaxed/simple;
	bh=aBkZmy5wQVNGOvKZMfyc0ty2+tW+s6heIv0nexsKxJc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MbuSj+YbQZEsbrh4yAWC7pwzT6tgso8oub2MNFHlBSxd1zl2JsLOu01X1E05Fn5W6y369AIiASDZW64ZpOYao41JP1Fk+7YSAmU6Cf/2n3KpTXU6j56GbnYjuiajBmU9O+MMaEQzGZ1Rjt7YbsI6+D+cfj8+c+IXK/QLI3j2HMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aZZRAVh/; arc=fail smtp.client-ip=40.107.244.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9XKyuGekwkVyxM4erBYQZAVGHMQ8iTgPyy44DI0h2+vB7fCtVnMR1QDAt+Vq0bJp6Lu/4+XIDuDvF0E7CRTlYDLivCATR7eEKzjSPaOLUvMPXiQBWlQsjNh5pntzalqv4A7xE0MxpW0+zNO6gFVzQpCpsdTqJ06Rwh5v/NTyzlyKxOo3i6YlzFLxGWPNQ21m4lqpos3ulzOtWLpi737FlC57AVEBRgex08/LrdUHw0+rpEGuiRucOcj6vJMGZbRFDAXjn7uMcNVI7ARjZo/rCqZm6bw5MS9JnVPj8QENne/dIEsDxogJzQHlrtLT5joLPyToP1A81XK4qRQF+48ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulD4xeTDK+99jo9tZaLJt5MFZOOQtsIXPBdyjTfcaB4=;
 b=iINZbFjCC3U+sfmzjbCqWwHnHrufeNTQA4dFwDvvw+Vb8N9Wbmo1ooRkWvA06g95xUC9ERxgZ0jM97uED/5j5wdYNct+I5we6CXZ+CeF9PdzikkuAq2qUxft6viV0nQ7XMI4Y3StiWgUs3/0uX7XSFG8Ua/JNhylJ9jA/kVedLFFVM388CdQLYJX5M8AALGbrZIwlgmDfZqJRbSpPQCZKbr03jDigabHAPCBIdttmOQvgECJI/sx5GiTh0+sAC6OISLMfi4vQcBtnrnDmjsOb2IEDDNNtBBZ50xnf2xQk+cgugVo2N3g9L2C1xFmmiL8fzlmvxZYo7k1cIbwhN9+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulD4xeTDK+99jo9tZaLJt5MFZOOQtsIXPBdyjTfcaB4=;
 b=aZZRAVh/J882qTqtONBxQbt1Wk6DUkixkHCtVdiJ4xNHNBHxA5h01D71DDfFi/xu4N1tVmuxHpvtJqIBSein+bJoXEmT4dbTZtARB4nAkUCAYVmCNyj71NkcH5kM/gV/5bPVXLihFKdUBqsCshQbbvknijVa+gkiA697H8dOWTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by CY3PR12MB9607.namprd12.prod.outlook.com (2603:10b6:930:103::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 19:21:46 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 19:21:45 +0000
Message-ID: <4402c585-5cc2-428c-be3f-5f08eb53e97a@amd.com>
Date: Thu, 26 Jun 2025 15:21:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
 dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com, Svetoslav.Stoilov@amd.com,
 Yana.Zheleva@amd.com
References: <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <3e8364e8-22e4-42ad-a0f0-017f86fd6bf9@amd.com>
 <20250623120929.GE826@pendragon.ideasonboard.com>
 <aFlU-E_GCHWBXErq@kekkonen.localdomain>
 <20250623134200.GB29597@pendragon.ideasonboard.com>
 <b6425dbe-44e6-47b4-a06b-b9a172a8cac4@amd.com>
 <fb719113-513f-44d9-82ae-63ff6aaca142@amd.com>
 <175093628786.4005407.10292502794888309807@ping.linuxembedded.co.uk>
 <20250626122306.GI8738@pendragon.ideasonboard.com>
 <f59e0cdd-e41a-4865-8f11-9508b598e6b7@amd.com>
 <20250626185647.GA30016@pendragon.ideasonboard.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20250626185647.GA30016@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0020.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::19) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|CY3PR12MB9607:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c0da79c-9b5c-4640-1af2-08ddb4e6b060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHlpMXN6UXZnRFhsaFZuWTQvQkRSL28yWUNEN1FGSFkzclNlbGJHcHcxeWQ5?=
 =?utf-8?B?RXl2VzBDVlB2Z3RuNnY0SUxDd1pHY0NJUkZ0dkFPMXppZ0xGd1BVMDNHWmhq?=
 =?utf-8?B?RjE3YytiVDFEdGdyRFJKTVZ4M1F0cDdPK21PNW1pMmthMUVEckJQK1MxT0di?=
 =?utf-8?B?NnpUTSt2K0FmdkZGWjhYUVRkbGdRUkkzS05oQnc1ZGdqcUtvNXFIZkRUd0RY?=
 =?utf-8?B?OS9peDlLd0FXYWtnM2QrZ3Z3OGdZUjhuU2h5STM5WGVOOUZJR2VRaDNmWmV3?=
 =?utf-8?B?OU5TcjhJRUJUa0dYNmc4QzZXbXNYdFM0dGNYbkUvRU1RcUZzc2RWSnVicTN0?=
 =?utf-8?B?bFpsbUJhVEQ5aDhnT3F1UG1lcDlpUisxUkV1WmVGU2R4ZzQvdXJCK2xGZDVI?=
 =?utf-8?B?c001QWtmZGFxeVdyblNZVzh6RjVmcDh3ZVBTcEkxMVd1UTlNTUlVTEhiL25w?=
 =?utf-8?B?ZHgvVEsrWWZkTzZ5d2wwSW41WTNvU2I3bnRYQ1pMZjVqSUE5WTY2cndSV1dt?=
 =?utf-8?B?RTBBNm5NZTN0MWJNUG40a3pEUjRodUM4Wm1yb3ZaVVgzbmVyUlBsOFFFbmM5?=
 =?utf-8?B?dnlPVzZPNlpaU0hoK0g3dlhXdXRXLzZTd3UyQ3JUaVEvN3dzUExWcTFjOWdu?=
 =?utf-8?B?WWEveHZ2bDI1Q0dBNTJxd2s2eHdnUklZQTZmOHl3S1VBUkROQmZLZWNxQ00w?=
 =?utf-8?B?bTlFRGo5aHh0Rjlucmw0MWdTaEE3MlpyeGlyMGxycnljajNweVZ0UWN3dlAr?=
 =?utf-8?B?Z25aOVZnU1F0Y3UvaXNHWU5qNDNERVdLdzdOUjUwMHM5N1JFQkhORHlKRlpV?=
 =?utf-8?B?MDhnQXJHYnlhS3BTcWZsQWZOdmVVQWJZMHE3NVQrS3JzbzRERmI0RVNHdUo2?=
 =?utf-8?B?NUNGdlJyWmV2UVFxY1V0V2Z6VWlYdGdUNmRYejY0U3BCTjM5aitsejZnbHk5?=
 =?utf-8?B?YWo4Q29SMTlRNEpSeERscEJqaGZuaWF3cU5OK2toSGtyRDVrZWh3UUdVUUlj?=
 =?utf-8?B?NmR4Z3BwaDhLQXczQjJPMld6aitUa2s0ZjRvb3JKMk1oUmgwM1RqSkdYalJw?=
 =?utf-8?B?UnJnSVkveVE2ZnBQVDB4TXo4dDZSekhZY25SNm9uTUdzcERXZVFjVWUzUElK?=
 =?utf-8?B?OW5qYXZUTTl3aGVBQ1d0eVlXdnJGWUlTdTVtYjBUSk4xdXBQQTFNVVBwM1ZR?=
 =?utf-8?B?UVR4MkdWYmNaT0lrQ3dCYnJBRGtWKy9EdzJFUUE2R0FTdCt3cjhnTUpJNTF5?=
 =?utf-8?B?SE13QzF6anNFY1NCZEVNZlhHWUVZVzRMVGQzZ2JISFNPVkp2Q0NXNEdmb2k5?=
 =?utf-8?B?QnJIdjJUWGhjSGs3YldqazRFSFVUZTdQUGovYkFIQWFnTkluL09BZVIvSVFV?=
 =?utf-8?B?eVVTRFc0MW5qVzhCYnpvL3ZjbFAyRHhncU1QZUJNR2JOQzdzTU4vT0hiS2pt?=
 =?utf-8?B?Q3lzTXZxaUs1YW9ZWjdWSGd6cTdmVXJpWE1aYm5EQlhacXU5SVd5WXJzNVJ3?=
 =?utf-8?B?eUk5TTB2aEtBSUpKMjg4L3hkZkU3SjJQU0trR0xlUkZXT0VHMW9HcEJZa3hr?=
 =?utf-8?B?d1VzMGViZ1d6MzVoQzZxZ3h3Y0R6STk0aDRENVRTcnlMRFVKUUtNSXpPSE9I?=
 =?utf-8?B?L3hWS2JQdytITjFWVm9MSkpqWi9MMVg2SENJaG1sb0VkeUhEQ0h6dlhZclBY?=
 =?utf-8?B?Y0RWM0FWek5vT0UxZVFxQmRGYlFzeDVSRTgrNFF5M2VRKzV6eXo1V1BLOXQw?=
 =?utf-8?B?TEordUlNcmVJbUVuQUludm84ZjhQVG9sVllFQWl3RCtTdXJzaXZkdkFhcVdM?=
 =?utf-8?B?TGZxTFFXc1hzL0FSQkV0cFY2UEY4S1IxY21KQnRiSDk4eG9rVTJ4d09OVFFZ?=
 =?utf-8?B?aXhxVHI1dDgwY1hjbzY2cUJzQ1lLL3JPK21wTHVnbVpucU1teG1ySkdLUUpx?=
 =?utf-8?Q?37dXiuoLlaQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGxCMUp6OFlKTC8velYzYVZETlhCc1gzMTNNYUo0SEFCZW5HNGJiSnNXMzYv?=
 =?utf-8?B?NXdxUldkZzlTRkdRSE5WQWcydGN0MzRDM21mWWQyN0tVaEtsbDVMNVdqMDdv?=
 =?utf-8?B?ZDNXajdNWTNzTy9oRkdBTUhmVXhZbEhjVlRzWmxsbHBDV2c2ZUpZMloxNC93?=
 =?utf-8?B?SUc3RTdtdGNmaStCVm56d0o3OStiUVdHZUtqbGE3RFNDYTFCblZVczlzcDVs?=
 =?utf-8?B?NHVRZ21oMmhIVDB3NHh4eFdPQUNaSHpKWFplclFsTjltNGVMN1VOdGRpcVZk?=
 =?utf-8?B?SkxCYk5aL080MXRmdk9mYnZNMHpLbHpOZkt2cHdNRFg3MDRsZmhXWUMvT2wx?=
 =?utf-8?B?dkxNVGVCMkp1eWxmSkVxc3VYOUlMWlVvZ05UV1VaSjQ5VUNDNHBEZ0xCQmdN?=
 =?utf-8?B?ZytWQjJhd0srSWJTdUlCSld2TnlYUytXU05UVVBhTFdTaXh0Qm5MRnJVUVB4?=
 =?utf-8?B?T0IwSzFyVS9JdE1VRkRCSmlmYnF4MjJHS0hqcUtFaW43akpqWG9GSC9xbmY3?=
 =?utf-8?B?VGM0TXhzaWdjN0RoUEJJRmxzcEYwOGxyTjBFb1Y5V2NuNGRCQ0lnam04Z1BU?=
 =?utf-8?B?eDNZUlVFZGFRSkxQS3NuUlprakpheE9ESWg1YzdJek54TWh5cy8ybEZGWkth?=
 =?utf-8?B?UjQrSjNubFk0WFVVYUVFQlF0a0sxTXVLZ2ViRWtBOEFWVmRFekdBTDN1SFlr?=
 =?utf-8?B?K2I4QSt0MlFvSTBOanBXTkRsWXhNWElUbnhtc0VaeXMzWlMwNzJmakNRd280?=
 =?utf-8?B?R3pMaXVWOXNFMURCTWV5aWxZMnJhcGF2azllTjZJYm9GNVgwMWVrdHpwbXFU?=
 =?utf-8?B?MmFiekg4TUM5Nkk2NHZFd1NteFU4TTBRdFVPcmNXRWl6eTBac3lKbXBoS2lM?=
 =?utf-8?B?SGJvUXU2ZWJpeFVRLzNhNm1Fd3F2UVFya3BaSmlHT3llYlcraFlBSkVyTHRt?=
 =?utf-8?B?em9tYWQrcC9DQlVtem1lL3R1UDk0aTBWMFFXcklscnRoZXAydVNaSVE4aTM4?=
 =?utf-8?B?UmprcGxQdVh0dDR0ZlFLaEt5MzNhWm1JU2dNemM0SW9lZXpWTlJsRTR3bXJS?=
 =?utf-8?B?V2xKR0RMK3h4UnNCa2VHVEVUT2lrMTlvMHc3MkZORWRBelNvNzFMbisrR2Zp?=
 =?utf-8?B?ZWRxdktTamFFalFqcUlhKzRCYjN0KzlYL2Y4VWVDTVNQc3Bsb2p6Wmo5R2Rn?=
 =?utf-8?B?MFNZenp4NlUyWE5ocEFCMkZhSFphZFhjL0FDdVFmNXVNOGRhQklRV1ZJOGxq?=
 =?utf-8?B?K2Z4dW00OWxDckl3V2FUUVViMkFzZDNxM0oyVnR2bVhVTlZUWkxLNS9VQTg3?=
 =?utf-8?B?ZnhHQVdTb1UzL1VzZWNzU0hIWTBuOTlOcTB3SG41ZVQwQVVOM0svdEJzdkF2?=
 =?utf-8?B?UWpWZTRHNVNsTW1sb001bGRHZXFoUkpIcEFVZFR4bDhtN3R5Mk50MFJkU0xP?=
 =?utf-8?B?R2pXVFE2M1RjTXpjcmwwSlRMZmNiNHpVdTNaNjc1RFhkd256RkxjM2FPK2R1?=
 =?utf-8?B?bWt2K0dHSTRpYlhIbWR6QjZPMVBvcnlYVjNyR0pFNmwwNWtOaE9kdVk5YWlX?=
 =?utf-8?B?SjhLc2tKSHMyVjlwTWxQVnRyK1I2SXFwRjdndWdnMGg1TnJEZFVvY2hua053?=
 =?utf-8?B?bUZXYWNnd0gzbmk5SEhTTFNYbDRJcW5pOTdKazlUYmRnY3U5bk9uZmwxRWFy?=
 =?utf-8?B?MjRhL2pJS3VBbHdDSThVeTF5WmhSbjRBam51UWs2aDVReFFRUm1adlpGNEw2?=
 =?utf-8?B?WmMvUEx5U1FsUWJCekRWd1d2UmdiSGRNT05hQVRZc2Nudm05Y1dpK3ozVzZm?=
 =?utf-8?B?ZHhmNnkzbkpHVVdzS1AzeVZyeWdESThUM0V6S0xuZHlZUWk3bFdITS9EZ0hN?=
 =?utf-8?B?MnM3STdWNlQwc0djYzhpM1FyYTUvZzFZcVJQRXNTOWNwVS9Id2VCblc1aG5I?=
 =?utf-8?B?M1g2MUdHck52YUdTc0V4THJhU3hlalBvdUJiWGt3TWh3WVhuMVE0a1RPWktM?=
 =?utf-8?B?Y1pJaTVYNk9uTXNUd1IyS0l3VTZOM2FqVC9FQVdKRENIUXo4RTAxeW52SlZR?=
 =?utf-8?B?TVNBWm90WU05L3VJNU5pejJjS04zRTkwNkZSQTQvR015U1JXV01aVmxOV0Nx?=
 =?utf-8?Q?Hsz7Qmra2Y0xzbgmPRAKsqKU1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c0da79c-9b5c-4640-1af2-08ddb4e6b060
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 19:21:45.2857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZeTJi28o+kVg/DIIR1It8aTmoKfmqq/wNFxSZwpgyvs478fcLogUlHaztj6ncjSdyW/fLjK5tYQTiTcX1ircpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9607



On 6/26/2025 2:56 PM, Laurent Pinchart wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Thu, Jun 26, 2025 at 02:22:00PM -0400, Nirujogi, Pratap wrote:
>> On 6/26/2025 8:23 AM, Laurent Pinchart wrote:
>>> On Thu, Jun 26, 2025 at 12:11:27PM +0100, Kieran Bingham wrote:
>>>> Quoting Nirujogi, Pratap (2025-06-25 23:06:01)
>>>>> Hi Sakari, Hi Laurent,
>>>>>
>>>>> On 6/23/2025 5:55 PM, Nirujogi, Pratap wrote:
>>>>> [...]
>>>>>>>>> I think it can live in the driver for now. Given that the device uses
>>>>>>>>> only 8 bits of register address, I would store the page number in bits
>>>>>>>>> 15:8 instead of bits 31:24, as the CCI helpers do not make bits 27:24
>>>>>>>>> available for driver-specific purpose.
>>>>>>>>
>>>>>>>> I'd use the CCI private bits, the driver uses page numbers up to 4 so 4
>>>>>>>> bits are plenty for that. If we add pages to CCI later, this may be
>>>>>>>> refactored then.
>>>>>>>
>>>>>>> That works too.
>>>>>>>
>>>>>> Thanks for your support. We will add the page number in the register
>>>>>> address 15:8 or 11:8 and will update the implementation accordingly in
>>>>>> the next version.
>>>>>>
>>>>> I would like to share the approach we are taking to implement the CCI
>>>>> helpers that support page value. Could you please review the steps and
>>>>> let us know if they make sense or if any adjustments are needed?
>>>>>
>>>>> 1: Add new macros to embed page value into the register address.
>>>>>
>>>>> Ex:
>>>>> #define CCI_PAGE_REG8(x, p)             ((1 << CCI_REG_WIDTH_SHIFT) | (p <<
>>>>> CCI_REG_PRIVATE_SHIFT) | (x))
>>>>> #define CCI_PAGE_REG16(x, p)            ((2 << CCI_REG_WIDTH_SHIFT) | (p <<
>>>>> CCI_REG_PRIVATE_SHIFT) | (x))
>>>>>
>>>>> 2: Create V4L2 CCI context. Initialize page control reg, current_page,
>>>>> regmap etc.
>>>>>
>>>>> Ex:
>>>>> struct v4l2_cci_ctx {
>>>>>           struct mutex lock;
>>>>>           struct regmap *map;
>>>>>           s16 current_page;
>>>>>           u8 page_ctrl_reg;
>>>>> }
>>>>>
>>>>> 3: Introduce new CCI helpers - cci_pwrite() and cci_pread() to handle
>>>>> register read-writes updating the page control register as necessary.
>>>>
>>>> Out of curiosity - but couldn't the existing cci_write and cci_read
>>>> already be used by the users - and then the default behaviour is that
>>>> the page isn't modified if there is no page_ctrl_reg - and by default
>>>> CCI_REG() will simply have (initilised) as page 0 - so the pages will
>>>> never change on those calls?
>>>>
>>>> Then the users can indeed define
>>>>
>>>> #define TEST_PATTERN_PAGE 5
>>>> #define TEST_PATTERN_COLOUR_BARS BIT(3)
>>>>
>>>> #define MY_TEST_PATTERN_REG CCI_PAGE_REG8(0x33, TEST_PATTERN_PAGE)
>>>>
>>>> and can call
>>>>    cci_write(regmap, MY_TEST_PATTERN_REG, TEST_PATTERN_COLOUR_BARS, &ret);
>>>>
>>>> with everything handled transparently ?
>>>>
>>>>
>>>> Or do you envisage more complications with the types of pages that might
>>>> be supportable ?
>>>>
>>>> (I perfectly understand if I'm wishing for an unreachable utopia -
>>>> because I haven't considered something implicit about the page handling
>>>> that I haven't yet used :D)
>>>
>>> I don't think we should implement page support in the CCI helpers
>>> themselves yet. We have too few drivers to look at to understand the
>>> requirements. Instead, I would store the page number in the driver
>>> private bits of the 32-bit address (that's bits 31:28), and add wrappers
>>> around cci_read() and cci_write() to the OV05C10 driver that handles the
>>> page configuration.
>>>
>>> Once we'll have multiple drivers doing the same, it will be easier to
>>> see what requirements they share, and move the feature to the CCI
>>> helpers.
>>
>> Thanks for clarifying. I agree it would be simple and safer approach too
>> to handle this way. We will add the following macros in v4l2-cci.h and
> 
> Please add the macros to the driver instead, not to v4l2-cci.h. Once
> multiple drivers will implement a similar mechanism we can study how to
> generalize it.
> 
Thanks Laurent. That makes it even easier - all changes can be included 
in the same patch. Its clear now, we will finalize the changes and work 
toward submitting v4.

Thanks,
Pratap

>> update the existing wrappers ov05c10_reg_write() / ov05c10_reg_read() in
>> the driver to retrieve the page and register values to call cci_write()
>> / cci_read(). We will add new wrappers too wherever necessary in the
>> driver (ex: wrapper for cci_multi_reg_write() on replacing CCI_REG8 with
>> CCI_PAGE_REG8)
>>
>> #define CCI_PAGE_REG8(x, p)           ((1 << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
>> #define CCI_PAGE_REG16(x, p)          ((2 << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
>> #define CCI_PAGE_REG24(x, p)          ((3 << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
>> #define CCI_PAGE_REG32(x, p)          ((4 << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
>> #define CCI_PAGE_REG64(x, p)          ((8 << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
>> #define CCI_PAGE_REG16_LE(x, p)               (CCI_REG_LE | (2U << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
>> #define CCI_PAGE_REG24_LE(x, p)               (CCI_REG_LE | (3U << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
>> #define CCI_PAGE_REG32_LE(x, p)               (CCI_REG_LE | (4U << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
>> #define CCI_PAGE_REG64_LE(x, p)               (CCI_REG_LE | (8U << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
>> #define CCI_PAGE_GET(x)                       FIELD_GET(CCI_REG_PAGE_MASK, x)
>>
>>>>> int cci_pwrite(void *data, u32 reg, u64 val, int *err)
>>>>> {
>>>>>           /* get v4l2_cci_ctx context from data */
>>>>>
>>>>>           /* get page value from reg */
>>>>>
>>>>>           /* acquire mutex */
>>>>>
>>>>>           /* update cci page control reg, save current page value */
>>>>>
>>>>>           /* do cci_write */
>>>>>
>>>>>           /* release mutex */
>>>>> }
>>>>>
>>>>> Similar steps for cci_pread() as well.
> 
> --
> Regards,
> 
> Laurent Pinchart


