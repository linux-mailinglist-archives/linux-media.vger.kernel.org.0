Return-Path: <linux-media+bounces-35013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A721ADBD77
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 01:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 597B73A63FD
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 23:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B4B2264A6;
	Mon, 16 Jun 2025 23:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wnFF8+2n"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4546C35947;
	Mon, 16 Jun 2025 23:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750115743; cv=fail; b=DNcHrBQGZRPWTtUhSQxe3G0u8Iafnhz9u9llpOLbs1xdbMHoeuLb2a7fbJ/Tele3tDQWiux/hrzTpGiesN4JZozr9M/UGHCGTH6a7/WYEYus4t4YHsOERJ38Ir93XH6Hz7fS7H4HXzJmhHUQ0n1ZJUw/nywAY8RhthOWuD+wHvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750115743; c=relaxed/simple;
	bh=D7mSR2KNeqRg+aFZ5xXyymq07haG3Wk0gsOvD9l2GN8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sovbzfcNtrCW5fHvymeMjmtnbgM2mibCX28jqrPi/3GTGCl3IYhM7jcNmM2hbHVwUb/WQz1YlNQcs78WSEYE+dddXg2SEf3jZvRW1RrsfGMGNQ4YkDFaCMDegzZn3FGqqGg5qVuaECAP62PKQzZbM1XJ2fBYRoYFSkUC0l97RiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wnFF8+2n; arc=fail smtp.client-ip=40.107.93.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5rC780WuuPLGDQ/+FeaamOsijZ0RiMxUMy+gEa46rAuZenBoOm/mATa/AoT/+Zs/BzN2heVxiqVq9EUPqUNW9a3eBuQs/dYIzVYqW1mNEh2ulhJSjRPt8oyQKaI1K0+iB4d+7HoIJmFAo8KPqn62csJeJQQCkHRDotpGBRys90JSyqZ63GkHwbiqzpIrmKrO30CilHd0T9ZQg3uTiE8kr7xDiVTDJgqh+ayktapIEl18cMurVXUWhAbqG05PhJ7qpCc1F+etRDHaokGLwIbFAOG0oTK95L17UoFNmipECRHtiUHy5b6vE3ADigDn4brHrOlIBBbmg2WGzlTnNAzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXeoQ1d+l0pusTrH2HycLMbQKLXLAJNxq2wjiRszNO0=;
 b=vhqNExkmkJNH0U47aAPKf0Bpt5LNw5m33gRIEsRAUu695t27xxx8QRi7FoDc/hIvtcUpJqsjRMp+IJ+0kXMi5aTB4t39SAkxgxaKvBoj5n7Jml79FLGnPc3H8GU+FK06HhNAgSHSZJh535IuYOgFwcvEv9pbWjgJqDmA/hzE9QExyUnAZkI7k6s54MqRn2693L94WoLRWspuG+3fsjRw7tgrzpiFjnuSPZPzIoXr8dBmFskkjoH7yAnKIQDfwowWNwh18CMC+pCPzZU4S3peX1tQfhcPVfErV7vjAkhAMR5OmLV0W0Zfk8tmzxzABp3jlmt2lZLT8ZR4N1rvEvh5iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXeoQ1d+l0pusTrH2HycLMbQKLXLAJNxq2wjiRszNO0=;
 b=wnFF8+2nBqk5yeLKlRn9V0vOW3IYznYY35A2sqKRjv9Tqze9iYc6l0AP1/SCj0Z8PvpTYMXT21HjBMUcG0Z+oee5J2o4336dbZkEzdz1OP6PtdjRXCSl2Uo5sTv3XPX8EIfm449xcY6HGzWaiRas2v5XJNf3FotI6s+xityVgyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SA3PR12MB7782.namprd12.prod.outlook.com (2603:10b6:806:31c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 23:15:39 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 23:15:39 +0000
Message-ID: <9862b2c3-346b-49c5-80a9-37aac7e7b811@amd.com>
Date: Mon, 16 Jun 2025 19:15:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Hao Yao
 <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil@xs4all.nl, krzk@kernel.org, dave.stevenson@raspberrypi.com,
 hdegoede@redhat.com, jai.luthra@ideasonboard.com,
 tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 grosikop@amd.com, king.li@amd.com, dantony@amd.com, vengutta@amd.com,
 dongcheng.yan@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <174981257597.425770.15369432320575770694@ping.linuxembedded.co.uk>
 <37eec3b5-1e57-498d-8ead-891d1e5f96d4@linaro.org>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <37eec3b5-1e57-498d-8ead-891d1e5f96d4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0169.namprd04.prod.outlook.com
 (2603:10b6:303:85::24) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SA3PR12MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0ff415-c1a8-4dc7-1544-08ddad2bb554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1hHMU15eTRIUFVKZTdQQ0NkOGoxSWVwYkdPNEVvVGRINjkxNlBrSjQxL1Nw?=
 =?utf-8?B?MERmeVg4OFMxS0xnYkhlTXMrQ0JCQVRMZW40RlAyR1dlUjM5M3hQcVB5ZVJM?=
 =?utf-8?B?bmtjOGxDRkI4bWhVZXVjeEdqT3dZVE1WaWQyRGkzMXpTSjlCOGtLcXdYMnVP?=
 =?utf-8?B?b01OZHJFcnd5TFhrOW8xTjBJYjR5YWZlRXYrMTNJUlVob2o0QklRalQzMzJ0?=
 =?utf-8?B?dFA2azdYWThsOXZxYnlDcFJuYmRUL1p3dGFGMTBhVHpMMEhJWEN6NnFhbzhH?=
 =?utf-8?B?SFhYSkNJOW40WE1JcWl2UDlLUVEwQ3htQmhLaFgzdjFEQ2NHbDVCb0hTRTlr?=
 =?utf-8?B?amtUaTB1a2NUeEhsUXV6OHNtZlBMYVB0Si9DYkJjd2Q0dUVEekoyd1pDZk5h?=
 =?utf-8?B?RlVzTjlRYUJSZW51eUVUOUdURHU0VHVYOEIxcmRIdnNMTk40cDFsR0swYzhl?=
 =?utf-8?B?K3FteXkrNi9xc1JBZVRhMHdKTmEva0tYZTJpcGJOc3l5dXEwWExjRDlVRC9Z?=
 =?utf-8?B?bEprZkhOSzZrZHRVa1JRWnBqaGEwTERXeEZGUFBxNmxxNW56SDBTN2lyTWdn?=
 =?utf-8?B?MHZsME0vVlNzZDlJejZYdDNDNG5OdUVJRDNMcUh5Vmd1WVg0R2RFRlE3NHFJ?=
 =?utf-8?B?TGxTSk1OTTV2b1IyNUFDWCt2RTVsaFE3QmgyeW04Ukw5U3I0dHNFbWpaVHNQ?=
 =?utf-8?B?MWNPT05ienQ2UXFnMmEwQ0ZLd094aXdCSGtRT3JzTVZQNTE3Y1hnRCtpSzhy?=
 =?utf-8?B?eXBDN21zRXdmMjQya1hCZkxWdDVkQ3h6S2RiQzhRQkl5Ly9SOXpvUE04S3RE?=
 =?utf-8?B?UnIwbS90L1NNSm42eHFRb0ZYdEhqeGt0SmVpMmRaMWltUTZJWURST29OOFRE?=
 =?utf-8?B?QVhmakVRU1NrWi8rdkNQVnZ5NndyNkgvYWMweTBMUkF3WDd6eHEzNTN2ZUND?=
 =?utf-8?B?dHNBTGVwM0hTU3JUZHU1U0RWQU12alZHbE4ydjMwcnQrTmNRVDBXbjBtcDQ0?=
 =?utf-8?B?M3FIUWFWU25JRm82Z0xQQmRXZ0ZBZlVTaWdrbXhKbjJVbTJQdVdFazJHbHVR?=
 =?utf-8?B?bnRmWllSdHdqcU96NGRoSnFRN1d5eGRRaC9jUTdPdThNeDgrZ0YxZTV6NE5v?=
 =?utf-8?B?akNMZ1V5eCswUFFpYllzVXFxcmh0THl0bXlLcm0xUVdaYXpJTVZXbHRValJW?=
 =?utf-8?B?UGdJZzBhRWZMZXgva09lSy9oR0M4NmVuT2RLdklBTklPQlZyYkorQ041N1RF?=
 =?utf-8?B?ZnJVVkorWFJvazBOQ1o4alNXQTA1ZlkwTy9EWjdmdmNYTGkzQkI4RE9CSnhR?=
 =?utf-8?B?c0lERVpMVEhQVmt2NjRvQlBBZksrUVErRC9PcG5pNVZqaWlQY29DZWVrOTZH?=
 =?utf-8?B?WWN2dndVeXBzNXNXZWYwVGdPT1d4UU9jMU5HZDh1SzM0S2lENEJMb2NKQUdq?=
 =?utf-8?B?T085Y0pUalU4KzRla01Ua3lPTTJkVzYxbnZ3UktLOFdZS05ISG55UEp4ekgx?=
 =?utf-8?B?SFNNdDRnRU0yaVFrQjJ1cFJWbElPN3RGa3V0WEdGaXJhY0pzUm5sTFI0YzBp?=
 =?utf-8?B?Y1hpcXAwbnY0RzRyOEpTV2xNUFZlSG1JQVlOZEp6aG9WejRic3FpakZWb0ps?=
 =?utf-8?B?VGNmSlNjVDREeldjS0JUTVF2bEFqQ3hLOEladXNOZnJkWHNINUFVZUxzWlJP?=
 =?utf-8?B?TC85Vk9STkQvYW1xQjcvUk1CYVN4enpJNGxqZkhLZlRkL01IT1FtQ1ZvVC9m?=
 =?utf-8?B?eEFiM0lWclczWlRqQlJsNi9GazhJbFZsVnpFUFB1dHVJOG1YeURTci9kcWtk?=
 =?utf-8?B?ZDRxU1FVV296Y0NFZ09VSGwydk12Y0I0YzM1Z2VPbU51Y0NuNlRYQkYreVUz?=
 =?utf-8?B?SjNvdEgxcmU0dUg5azduSmE5OWo4K0lHT0tacUxJVDdYNVJsZDdwM1VyN3l5?=
 =?utf-8?Q?ha9SLMN0ftY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmdoWDZjOU1sZlRqais2T0xBYTZhclFYVHlGck9Pc2VmZnJUTm0zZkoxTkZn?=
 =?utf-8?B?WHRCTUQ2SS9KOVRuZk1jSFMzVzlPRjlxcFQ3eDhaRHpNU3Q1bVl0bzBTeDJx?=
 =?utf-8?B?VVVGMm56WitickZ3WjA4SzZwRCtaNUMrTDNYMk1CdjY5YnkwR05tUnZROEFZ?=
 =?utf-8?B?RWUycXVPckdvMEh3VjdYUUZSYzRHUnB6S0JyZG5OWkdUTzJFWUVQem03Vis5?=
 =?utf-8?B?MG9OMlZRM2kxOGpxS21VMU9ZM3VHVEp4dTh5QlMrZjVTWHVjS2JWVjdJaFhp?=
 =?utf-8?B?UW5haTJETHhiWHNoVFhZclI3MGxnMjcwenJMTnJGTG0xWjY5dFpHazl1TUx4?=
 =?utf-8?B?cjBDalNjWHh0T2I1WDN3NjVqVHlFbk92aVpZcmhKT2REQ0NXYXRXMFBkTVRr?=
 =?utf-8?B?MVdoM0RhUVA4cm1SZk5zSFUwdWdzbVFFZGY5U2VXUmNXZGIvNTJDR3R1cXNE?=
 =?utf-8?B?NzN0aXl4d1RiOG9NQTI5U3J2d1dKWGc1a2VJMTJHMTZSZWdxWWlnTldJeC9O?=
 =?utf-8?B?TW9OUm1ucm9US1pUcXhTS1FuazlSemZyMjlpc3RJZUFGSGh4ZTJKZThhSnZX?=
 =?utf-8?B?UTdNYkVZNnQwdUJRd0tlTHlGTmRFOWpwaVVXZm5GY09HWUVrSUZleWVaZ3Bw?=
 =?utf-8?B?ZmdHUnh4MXB3ODRpd0JuVUsvUEZ3WGJSS1RUdUl5UjkrQ1UvN2lRc0hqUE8r?=
 =?utf-8?B?MDZabUxtQkk4V0RkQVFDNEZaai9mdHBDS2lVbmhIVHBxUm42eTUyT3dxWHIr?=
 =?utf-8?B?NkEyamJ5aHJtU2s1SWQ2TjVvS3RDaDZBTDRSN2xBQVNIRnQ3SlhhTHRFZnEv?=
 =?utf-8?B?d0FaSTQ5eWNWVERWSzQyaHM2Vk05Q2Z2aDBUWDRFRHdUV2c4dFhQK1Q3T3l3?=
 =?utf-8?B?Q25FRnp2VG1BRmhxbis3M0Y0dFEwK1I2QXNkVEFWWWRyRjRGVjJQSnFnNlRI?=
 =?utf-8?B?bThtZHl3ZUtJdWUxNCtWZzI2SWdWSklpZkFvL0h6ckdidytEc2FnaEsxRWY3?=
 =?utf-8?B?dXh1M0MxUyt2NTB4NVB5TkpkMUFBL0dqRFd5UU4wVlM1U0puS3NZZExJQ1Zj?=
 =?utf-8?B?M2FuREpMUFcrYTFYWnJmMm04eHhEVnNlVFIrblNhYi9oRlpFeE91UGZkZ2x1?=
 =?utf-8?B?ZGFMSzVqZ1hRTlZGaEtPUFo0dC9pYlNDd1dFUjZaaGFrejFBOXFYY3Btanpn?=
 =?utf-8?B?Y2ZXV0ROMDJDM283Y08rcTVOM3ZoYjJuMXhrRHdibEtMS2R4c3k1TkNITDVN?=
 =?utf-8?B?SEZTdCtQMjdXN01QTVRnQWpEbHRXSkpnNVdheCtFaXNyTHBBTTBLdk9Vd3Nx?=
 =?utf-8?B?L0JaSnArVDlCZW51SWloWmRIRCtNVE5WVFRkL0M3b0hkeml3U1pFNDhGcjBk?=
 =?utf-8?B?eDViKzU1cVlydHNxYzVPdmNYOUdTR2JqdzQxQmNVYnZXWkVSVDhpSXljOWY1?=
 =?utf-8?B?MWlINzJvamtNU210N3JvajdLS0VDdnE1a0hYRGYyRWYyK0xhTG8yN1R6NkdJ?=
 =?utf-8?B?RFdKYmtiTlJXQWNJSVlpUkZkS1ZhTDU4a3FobVp6dSt0ZzVmbDMyTytIUk1o?=
 =?utf-8?B?a2d1aEZ1dndlOGsyVnFKellibnUxcXQ5OXh5TUd3T2t4ekFWSFFWSEdicE1p?=
 =?utf-8?B?VzYwM29oK2xyUWpUUnRCNVc4d0xoYy83cDZSdkh4QmVCWTRvWjJsN1lrMmhI?=
 =?utf-8?B?eHJuRDFZWXVsVi9vOFYzeitXR1RleVRXT21jLzN0NVh2elJmTmxMVUg2WVdT?=
 =?utf-8?B?RHJWdmZ2dVJqMmYrQ3d1QmZxMHhDTVFrQ0xra2thdExKL0J0R2pHK25vNEZQ?=
 =?utf-8?B?bzkxQ0psM2lUazB6TGdXbjl5K0NGeUdBVWdLSGVOd1U5NWRQdER5eUxKSjRz?=
 =?utf-8?B?d2cyQTNZeUg1N2hHbVozcnI4V01jR0ZBNC9XVXZpS1lvNUVVZUpQUFFKZ3A2?=
 =?utf-8?B?K3hoaDdUSldVVlZDeTl4VWF2UnBzQmtyNEZHMWNIOXRaTVYyZUFsKzEvamE0?=
 =?utf-8?B?MEtheVF3MmVHMys3cVQ4b1dlMDJzMHJXTFNPWEgzQ3BneThiL1Bya3l6Nmh1?=
 =?utf-8?B?STlYNUNscktJYTI1SmRlcVliYUQvUDZ4b2x2NklJdXVYbHk1VU1WSVZTWGFq?=
 =?utf-8?Q?dsjhCfabootLD1obitVU0iEzw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0ff415-c1a8-4dc7-1544-08ddad2bb554
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 23:15:39.5271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9gIfFfJuogqrWoou8VS3D0nNdSqxExE3osjbilMs6TtaYpoetdVm2RLclXDfOHdPmVFPC1EiQlclOtl9TY15Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7782



On 6/13/2025 8:05 AM, Bryan O'Donoghue wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> On 13/06/2025 12:02, Kieran Bingham wrote:
>> Quoting Hao Yao (2025-06-13 05:55:46)
>>> Hi Pratap,
>>>
>>> Thanks for your patch.
>>>
>>> This patch is written for your camera sensor module, which seems very
>>> different from those already applied on Dell laptops (some of "Dell Pro"
>>> series). Looking into the driver, I think this version will break the
>> Have there been existing efforts from Intel to upstream support for that
>> device?
> 
> FWIW +1
> 
> Qualcomm devices - Acer Swift 14 AI, HP OmniBook x14 both use this sensor.
> 
> I'd expect though that aside from OF bindings, regulators and clocks
> that any upstream configuration with the right number of lanes would
> "just work", including this one from AMD.
> 
> That has been the experience picking up OV02E10 and OV02C10 from the
> IPU6 repository where its ACPI binding and repurposing to OF/Qcom.
> 
> So how incompatible could OV05C10 be between different x86/ACPI systems
> ? Less than the gap between x86/ACPI and Arm/OF you'd imagine.
> 
> Getting any OV05C10 driver upstream would be great, we can work from
> there to bridge whatever gap needs be for !AMD.
> 
Hi Bryan, thanks for your support and we will be happy to contribute too 
to bridge the gaps and make the driver as generic as possible to support 
both AMD && !AMD platforms.

Thanks,
Pratap
> ---
> bod


