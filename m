Return-Path: <linux-media+bounces-45761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E45C138D9
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9DCC3507F17
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C34821A447;
	Tue, 28 Oct 2025 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r0Q7pT/K"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013032.outbound.protection.outlook.com [40.93.196.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9AC1DB122;
	Tue, 28 Oct 2025 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761640238; cv=fail; b=XD1raDe6jFgRpa+ovn75oU44udQ7ERU5SmoJ/Aoe+MV0hy4KzIgN6hmERW3JY4ea3hF3eDn9Jtsri0vexxmecvVBTrviSd8/n2NIsUOsU9ED40cWstWxi06nHEkKUlLkgOBbcb5qxQMC5lmjRh7K3KlaYpxIb3mUMv5sENvFBPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761640238; c=relaxed/simple;
	bh=jdTZ8Rk392upYszVIUFLG1fsVjo8btf9NxVC2iTyRKA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K8xX/qqzYSIrRNXlELdge0YQ3Rn8ur+L1f7fIr7QhgiyPKKwjdlTxB46GGDNERDRNUpG8AxAq4E6wpeic1JOYNSCbuMBZBWZidj5GheznE+0y/MDwuRTiNozDG7Lf12uaYb4nFQWpYvRR8l7vQw56Xl+kG//QT5vGZMQ/JXiM9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r0Q7pT/K; arc=fail smtp.client-ip=40.93.196.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBF+lUBewQiPGMOkA3bg13+xhiNhKWx/Ousn4ahtjPHa3XU9Raf3lhNrMt6/mHjAwfwaMlwrWSGpKXT8NZGahcFT46bZlP6vtmciSson0g27RcGkV/RR69fuuC/Ym5Chh3kbcIbWUDRSghIXjJSef022yuRbLUj8MwqLmoNYdwzENjvuqT48Z9EFxcw+AfPQej2hrhz5ZhdCjNO19NO2482gTTKx091t3u8Tl1RJgtsBhOZqfDGxJ38aub3FwyEAeHilKfzHEFxmiKH/RZ311Usz6uj0ylwNbEXSxXetd2W4tJ4CPUT8fS8HIVFO/bpuQJSkAnPpARoXg0R3dqE3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fVGm9k51k5rcSQcgKWGWmIhd8iOkpihAqX6WdTd/yI=;
 b=pWjX1fy7rw40Ts/VvvHUm0/GBrc6+pWSmdSIGeHuDrCHME9t25QFxT1fQU3/xdRhsZ5lh3r9Ogd3PxLTyalUvdJM4+t8zYenqQ6WXIcR/HHeCKYWQ/briFG/VHU4v8Wxuc2scIrtFA03eJVBodfq2TDnVD64nlCDB0vCbX/UX2PT8MTd0mJSRj/40vrWjWccSMB5nV7vUBceRP8PbFTLr02mxQP1DIeq9soTya+lM8iK2maWvDFKT8irOZNxZZrH4UY+Agcs+G5MNQRpfRPfqnLDn38ObuV8x0fqo5hP5HBsYlNy0QwIH1290Su5tvZoiKdaqrVHwrFeeFNb4Lg39Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fVGm9k51k5rcSQcgKWGWmIhd8iOkpihAqX6WdTd/yI=;
 b=r0Q7pT/KwkGTIRbKn9Peb5sMauLqFQ9HcImDSUtaVc8h8uKanywC44UyDWbQ5QkBRZBxeQDlluNS2ZT7w+ZWavMJwC/2BAPHPBAbUEy3yk4nTjv4c+q9ENKiH2kLrpxyeipbMiSBuhgBgPmZza3W62LbV+rU5YLn7OykPKALcpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 08:30:33 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 08:30:33 +0000
Message-ID: <2c7ee056-546c-4891-abfc-c1d41e2c1632@amd.com>
Date: Tue, 28 Oct 2025 16:30:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Mario Limonciello <superm1@kernel.org>,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251024090643.271883-1-Bin.Du@amd.com>
 <20251024090643.271883-2-Bin.Du@amd.com>
 <93233d51-5ff3-4f10-96f6-a2957325f1bd@kernel.org>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <93233d51-5ff3-4f10-96f6-a2957325f1bd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0375.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::11) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: d07129d7-bfbf-4a8d-c7bd-08de15fc42d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEJQanlCUWtIOWFQcnZES3ZQR3czY0dNREMybWl2QUY4cVpWVER6ekJHYVRK?=
 =?utf-8?B?N0ttNzBJdTV5dWpPcjM5YnJGVSt0NXZIbDFaT0ZyMUNlVWdvVDhJYjA5eHRw?=
 =?utf-8?B?WnczR2RiVnE0Szk3bjlWMklzcDNoNU1rNmhodkNBclRrenZoYitZWHNTQU44?=
 =?utf-8?B?cjl5MFVPVHJ0VDRoSnJkUUwybWEyT0RxV1pyRE0zUjZnY1hzV3BwM3JvcW8r?=
 =?utf-8?B?S2N2aEh3SC9uQzN2aktYcXVNMUxCbTJzRjhsU3NVb3U2SEFjUDZIclltMCsr?=
 =?utf-8?B?eC9KSjU5MDJtUmk5dmZQaTQvZ0czb0RDTHlLUUU0ZDZTMzJjay9WMmp4ZUpH?=
 =?utf-8?B?T0ZRS2xFZU9SUVlVdnhETEp3NENTblRISkxwQlhMR1lvSkFETXNEd1FVOFBG?=
 =?utf-8?B?anAvdVVlMEd0U3UxTDlDVU5xLzB2cDJrNjdxWndjSmwwdWRJMENQNkdYQ2JG?=
 =?utf-8?B?eHdaOXVpVUF5NEs1Uml1Q2xEbER5bFo1Rk9Jb1dOdi8rN2JKU2ExWHBJM2p4?=
 =?utf-8?B?dTBQeS9BbVA4Mkx3NFpYNGtjOUdxL3hlVmlGaTRtekFqNS95L3NsRHpzaWRS?=
 =?utf-8?B?V1Z4bDRHR05oZTl0c004ZmpLYmdZMHJoNmZMVlRjWStSd21Xdlh2Sk5VWk94?=
 =?utf-8?B?cTErRTk4eGp1Sy95T284cEVrLzBaMjlEaGJTOXl3V1JtWGxYa3llQ2ZXRm5z?=
 =?utf-8?B?b3BqcFhTZ1ZqbGpYS28zWnlObTRuYTQ2OCtsTmFnTlhNOFc5SHQzUm9uaVZy?=
 =?utf-8?B?bExqbHI1dWhIMExTcnJHSW9HY0NndUZ3YXFHVkJYaXg2Rlo1Y0tzekY2UEtp?=
 =?utf-8?B?N05RNEpVM0E5MDJLSlhOaVczb0JRemlHaVBaa3FQMlJVMWRhMG16ZlFhSHc3?=
 =?utf-8?B?a1prWDJ1MGNaWktiN3lpSjg5M21oWjNOS3BhY1hpMXM2WHZybW0wM3BYMThY?=
 =?utf-8?B?bWdjVnQxR0gzMmF4MmJHeWo0OG1aNHd1Sy9sUVlQOHEwTTZLZktGdVUwclV0?=
 =?utf-8?B?NTl3ZTB0SDQxc0JEY2J1cUpDVnkvSjJLK0VGdENMUVh1N1Rhb2N6VXZDdWFL?=
 =?utf-8?B?T3NUQW9YRTJWT0lzcWk3b3RzZkJZcFFDRGhPaVk5bjRpMEZ4cjBSQWhhY1Z1?=
 =?utf-8?B?V00xRFAxeG9pcnIxdEZDOG5QY3RTRG1pVEZGVVZnWS9KaFhLSHIrSS9MUHIr?=
 =?utf-8?B?VVFYS3NKZGkvWjZJVGtBU0VCcTdMZktiRW9VZE1QeGpJNG9rOHZna1ZDMkU1?=
 =?utf-8?B?bVRhZEN3aEllOXhCTCtscHRmVEVBSkduTXRvdVJuZ1BhQkQ3eUhXS1loOE82?=
 =?utf-8?B?UXRiV3RRMEVpb2ErSU5HdGZZbzZDUzFXcTdMNFRjTUIzSjY1K2NvZVJacS9r?=
 =?utf-8?B?UDd0M2lsenFLMmJYOFFzaGxLR3F4b09OVXpGcm9yUXI2MXN4U3lMSFg1KzdC?=
 =?utf-8?B?MFplOTR5WHducFBWZnBHeTkzRkF4WVRGeVdtOXFNOGVXK0o5M3psaWFweXNI?=
 =?utf-8?B?blo0bGpkV2lRSVJ4UWYzeXhLczY1elM2KzN5MWREWUYvVklmc01rQ2FMNi90?=
 =?utf-8?B?WmVvY0VzVUtIc1hvOVZ1bjVsQ3JyeG42cEFZdllwUG5BN3d4Vlhsak1jblVX?=
 =?utf-8?B?c0t0UzhmNkVibGhaeFdKaVg0Smg4bzAzcHdHbGNkZjFOY1BrdEFEL2kwMlJM?=
 =?utf-8?B?Ylk0MThUWEVySnB3blY2VjNKbWNENjIyWDhkVXRpV2lVSXh0Vko3RWIwMEJI?=
 =?utf-8?B?clNMeGViN1ZEd3hPN2Z5b2xzcWhURys3bnJqeXQrQjJhaFhEWi9rVlJrNjhy?=
 =?utf-8?B?OU1oMVhtcmdGZ3hjRXBoQjZneVFwY04xaDh0bnVpdEdtalpxUkFNYkNwdm1s?=
 =?utf-8?B?MWxnZnBGVVEvbzZHNndNY3ROdG53UXZxUEgwN2FXMVRqS0ZHS1lSTExTS1Jr?=
 =?utf-8?B?QXB2NjlWajBuMW44MnpHS2xwT2FjNHhJZnZYQjRoaURwbEVqcmU5Q0ZYa1Zr?=
 =?utf-8?Q?FN2k8WtRKgT8Md8N98LbFhfU8xBCPw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MElZb3c4K0FhVWlIZU5KamlOcXRLd0JzeHdqa0lHMjFFS0FYSnhRbFZqMHdQ?=
 =?utf-8?B?ZVk3cEJaOGFHelNhekJaNkYwcGU2bkdXMWV3L00zdFhZdlBxL2ZCL0VtRnds?=
 =?utf-8?B?NUp4QTM2RDMyWStaaXRqQnNDRmRYaFFnTWlNSWppUlErc1pOY1Y4SUErbU42?=
 =?utf-8?B?cnpWV0tYMFQvaDJ5UDFqWFpjS2RDMWhLWU95NWRoZ0ZPVms4SUFwN2ZxNjY4?=
 =?utf-8?B?ZkxEQTc2clB6Z3VpTEpEZ3RWcUQ5TE4yY1VsVDlmNnpTOW9TRGdVSGp6Sm5o?=
 =?utf-8?B?cEFCL0dpT29TYjdJUXVaeXBYYzU1QXp4ek9hZFNZS1MzMWlvS3hSaG4rSUt5?=
 =?utf-8?B?TjJoRUlVaHVPU0dla1hRMG5OdU9ZQ1FiN3lpczh4enF0TVRhQ21Db2t0dllT?=
 =?utf-8?B?Y3JNNndCcklVVGp5dXgzNUp6UkNyQlQyZ2k3V3VJbWtCdThBNCtuUzZSeEhF?=
 =?utf-8?B?dWpBY3paaStpT1FOeG1DUGJrN3JRR0xhc2dPZGRpam8yaTVvWmxaVnpkUFd3?=
 =?utf-8?B?S3lXZHVncGtBZGVlbFIyOWhWSnFWWERvNzJBTkUxMWliZCsvL25TL213UVcr?=
 =?utf-8?B?Tk9CNEpBNmUrajVkUzRzR3pwalpIN3BTUzhaQ2hORnZuRElvY2ZtOGxmZ3ds?=
 =?utf-8?B?OWpmMGZrVFZ1U1N3MHVKTmMwT1lXRkdXNFN6d0lBR1Y5L0tWNWNWRE9pMEZ4?=
 =?utf-8?B?a1NsRG5pWUhMZnBZazYyM0NrRXJOYXlISEdxS09rTnFPTXN2M3pEZ0tZamVm?=
 =?utf-8?B?T1VJYkNsSkFkU2M3b3hMY1ZLQW9xM2VRMEQvdTFrejRQR1RieW9Qak1hVXB2?=
 =?utf-8?B?eURZVFltV2o5ZVc4UkZpSWx0YnZQS0hvQ0RhRG5hTGVGbVFVOHcrb1UwbVc3?=
 =?utf-8?B?UUI3L1VrNUcrSmovYk5jR1J1UVBqOTRkMDBZbFNMWFA5VGpQaERPU0RDUk9L?=
 =?utf-8?B?T1hoWlUxNVkxaFByMEVLWE1BRkh3UUZ2Z1ZDanFrdkh2bWtZcm1QQTBUK3l2?=
 =?utf-8?B?K3B4UWFwYTloS0JkWkorbk1FM2c4SU5rdlZHREVPSHFueE1aN01SUmtCNWo1?=
 =?utf-8?B?ZVNteUdqRWZWWDJ2K3hMb1prV1hMZjB0MjFMUm9IbG9Ya2tyTms4aEgwZm5t?=
 =?utf-8?B?eUJ1ODU1VHl4Sm1rY2FHRTF0MkdPaFc5WFZiS0hpVkZEQzZwaDgxcHZxdWR5?=
 =?utf-8?B?c3NSYTZ3ZlEyUlhLczFLQ3ZsSEJvZ1BOZ2VydjN0eERwYzJMcTArYzBldmtS?=
 =?utf-8?B?VU5UUWo5USsyYzZnZGVVOUdmbTE5YmpjNE9jWDVJZGZBbzJlSm9mTUNqSmlD?=
 =?utf-8?B?VTZ1RjE2aW9Za2RmNU1RNWNrUm5YUVg4TkF2RldVTWxQSW0vRUovb25RRDhw?=
 =?utf-8?B?azlxaDRCTDcreC9aMXByVGVLcmhjL0ZNNW8vTGxaamJaQ3dEOWNZWkFtenpQ?=
 =?utf-8?B?eTdtT1YyR3NJM0ZORXpjMUxHL0svb2dCaW1YQmRjcEU3WFRTL0hwOEFTb0ZP?=
 =?utf-8?B?MVNtRWJ6TUx1SzZuSHQyZ0J3L1h6S0ZuY2o1eFNhOXpnd1M4eHRVK2JZUWFq?=
 =?utf-8?B?cnQ3amJRNmd4aTRLSVZBbmV0b1F0ekdINml0UFB0WnFJdkRqcTYyWERwcmZ5?=
 =?utf-8?B?M3h1T2xSMktUNDZBTWdCT2FmT3FBVFBIZll1UHNlWXBoTHhaL0xJN0FoZkFO?=
 =?utf-8?B?T2JYUmVvelBLd2hNczlDc3Vhd25zejVLOXJkU1pyVzNwRE9FVi9LZmN6TVEx?=
 =?utf-8?B?UkdEeFdzQ0VMek1peGFVZGwwTXY0ODhUMjh5V0czS2MrNUhINTlxNEY2MUJ4?=
 =?utf-8?B?YXVJR3pmNFFsa3prRkJNMk1SWGNSdWJLdU1BdThpMWNqY3lzNVh4SDlOeHhD?=
 =?utf-8?B?a2gxaHZGQThGYmJDVWxGZXBWUHR1dDRoZEkraTMvdHl2M1pTMzVUNFRyekho?=
 =?utf-8?B?NVF2dkM1eG03Z2xIZi9uRXFNNjdlNCtPeGZMbmhubzhMSGdIWTJQMVQ2dHY5?=
 =?utf-8?B?ZU5rTDRPZE1PQXkrdnkwYVdMNUwxeXlNTkdabmJJYVZrWmE0Y1NzS283bkEx?=
 =?utf-8?B?bEFUWUVDVlBIdm15Y0d2UDFKVEZxRUFlT1c5UFVRZ2lya2liL3hiU1pBUk1T?=
 =?utf-8?Q?hwI4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d07129d7-bfbf-4a8d-c7bd-08de15fc42d9
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:30:33.3087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSaCbI5XLHbgbQ7ddtCZ8oKVUeLnXi78DYm8WxbAn1UeONqL6wE8a+zCCfF0nH7m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308

Many thanks for the review, Krzysztof

On 10/24/2025 9:57 PM, Krzysztof Kozlowski wrote:
> On 24/10/2025 11:06, Bin Du wrote:
>> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
>> new file mode 100644
>> index 000000000000..a3fc2462d70f
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>> @@ -0,0 +1,121 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/pm_runtime.h>
>> +#include <linux/vmalloc.h>
>> +#include <media/v4l2-ioctl.h>
>> +
>> +#include "isp4.h"
>> +
>> +#define VIDEO_BUF_NUM 5
>> +
>> +#define ISP4_DRV_NAME "amd_isp_capture"
>> +
>> +const char *isp4_irq_name[] = {
> 
> Why isn't this static?
> 

Sure, will set it to static and check other similar variables.

>> +	"isp_irq_stream1",
>> +	"isp_irq_global"
>> +};
>> +
>> +/* interrupt num */
>> +static const u32 isp4_ringbuf_interrupt_num[] = {
>> +	0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
>> +	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
>> +};
>> +
>> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
>> +{
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int isp4_capture_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct isp4_device *isp_dev;
>> +	int i, irq, ret;
>> +
>> +	isp_dev = devm_kzalloc(dev, sizeof(*isp_dev), GFP_KERNEL);
>> +	if (!isp_dev)
>> +		return -ENOMEM;
>> +
>> +	isp_dev->pdev = pdev;
>> +	dev->init_name = ISP4_DRV_NAME;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
>> +		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
>> +		if (irq < 0)
>> +			return dev_err_probe(dev, irq,
>> +					     "fail to get irq %d\n",
>> +					     isp4_ringbuf_interrupt_num[i]);
>> +		ret = devm_request_irq(dev, irq, isp4_irq_handler, 0,
>> +				       isp4_irq_name[i], dev);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "fail to req irq %d\n",
>> +					     irq);
>> +	}
>> +
>> +	/* Link the media device within the v4l2_device */
>> +	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
>> +
>> +	/* Initialize media device */
>> +	strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
>> +		sizeof(isp_dev->mdev.model));
>> +	snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
>> +		 "platform:%s", ISP4_DRV_NAME);
>> +	isp_dev->mdev.dev = dev;
>> +	media_device_init(&isp_dev->mdev);
>> +
>> +	/* register v4l2 device */
>> +	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
>> +		 "AMD-V4L2-ROOT");
>> +	ret = v4l2_device_register(dev, &isp_dev->v4l2_dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "fail register v4l2 device\n");
>> +
>> +	ret = media_device_register(&isp_dev->mdev);
>> +	if (ret) {
>> +		dev_err(dev, "fail to register media device %d\n", ret);
>> +		goto err_unreg_v4l2;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, isp_dev);
>> +
>> +	pm_runtime_set_suspended(dev);
>> +	pm_runtime_enable(dev);
>> +
>> +	return 0;
>> +
>> +err_unreg_v4l2:
>> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +
>> +	return dev_err_probe(dev, ret, "isp probe fail\n");
> 
> No, don't print generic error thus multiple errors. Drop this and keep
> informative dev_err_probe() in applicable places.
> 
> 

Very good suggestion, will implement it accordingly.

>> +}
>> +
>> +static void isp4_capture_remove(struct platform_device *pdev)
>> +{
>> +	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
>> +
>> +	media_device_unregister(&isp_dev->mdev);
>> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +}
>> +
>> +static struct platform_driver isp4_capture_drv = {
>> +	.probe = isp4_capture_probe,
>> +	.remove = isp4_capture_remove,
>> +	.driver = {
>> +		.name = ISP4_DRV_NAME,
>> +		.owner = THIS_MODULE,
> 
> It is v5 but you still did not run standard tools. You try to upstream
> 12 year old code without cleaning it up.
> 

yes, no need to set .owner because the core will do it. Will clean it up.

> Please run standard kernel tools for static analysis, like coccinelle,
> smatch and sparse, and fix reported warnings. Also please check for
> warnings when building with W=1 for gcc and clang. Most of these
> commands (checks or W=1 build) can build specific targets, like some
> directory, to narrow the scope to only your code. The code here looks
> like it needs a fix. Feel free to get in touch if the warning is not clear.
> 

Really appreciate the instructions, will set up what you suggested and 
address the warnings. Suppose it can catch the issues you mentioned above.

>> +	}
>> +};
>> +
>> +module_platform_driver(isp4_capture_drv);
>> +
>> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
> 
> You should not need MODULE_ALIAS() in normal cases. If you need it,
> usually it means your device ID table is wrong (e.g. misses either
> entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
> for incomplete ID table.
> 

Thanks for the clarification, yes, MODULE_ALIAS() does not apply in our 
case and should be removed.

> 
> Best regards,
> Krzysztof

-- 
Regards,
Bin


