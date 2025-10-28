Return-Path: <linux-media+bounces-45760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADDDC138BB
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FCD33BE210
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B8F264A65;
	Tue, 28 Oct 2025 08:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r0Q7pT/K"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010048.outbound.protection.outlook.com [52.101.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25B313D521;
	Tue, 28 Oct 2025 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761640232; cv=fail; b=GLWvnLjtfByACBw1MEMG/OfoHJ9PZD1hx5KNq1cyN43fF2jvH1eWQ/Zxt+C8mZprXwbYtt4w5O0VPZwqPXB2ZJr3TsPE1+ksLJlx15Oxo5r67Car1Tf+1l3UIc1KdgQ0T2fDAR8H0OGimaWKBIXiYw+wqnrTd1qmqdjg2jAMKiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761640232; c=relaxed/simple;
	bh=jdTZ8Rk392upYszVIUFLG1fsVjo8btf9NxVC2iTyRKA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ejl+mlGlnsdegicYIKlgHePj7omYRV65T4LQ9XZ+0njjwqrskT/Bmd0F3FzcyKxTorYspLCAxHpDc5HahgyEstIFmZcjc49kSrWESpeAOXEnOlhwfAFqhIesCM+UyNdxQ6Z0oMl6JFs9jLolbuugwDK9a73EfB0GxV5fnuTg1JU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r0Q7pT/K; arc=fail smtp.client-ip=52.101.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXNvmK9dHN93b7wJPTkzOfLOcb9mtKPBbr8h/cfORCSPlutj58WJCRSviA6L3i3NnBt73OowinAXiyY7atEmM8w0dnl2BFg9GkCN1VM7gFd9bKFoFLIs/RLCe3vUSNjXTsak8pVt3br1oGEDRpeCciFPZMRqPLiecn7a0nvNBHgUGqpVkpccrCxqReV+wHCVqSwTI9+fowYZ2sGDEJPGZPVCJCMaiILz5CZiYlrgmB+bx+xUYYzdQJJKOEL+dcGn4QQCh95qWbkMjM9SzvvUV0XpPngaS2JE+3uGtt/9c9lD5VSEBQ8kk9BC+zk9QODsRJyJO/CK/HnFOJI2dQjK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fVGm9k51k5rcSQcgKWGWmIhd8iOkpihAqX6WdTd/yI=;
 b=uWC81aPjUHNHSv6pVIzBsz7u5Za/FqmfBMpCQKrtyBkuj2quvXmtXxdamNp58WDb7gwLW3iqalUt9PLSBVgh4dcQbaujw26IfCRfpfWju8rN8TFXSmBI5W1XTzI8TfPkiON1MNMXbawemrQUadTWyCG7RsFkN/TjftU6L4eqMh+r1ueCoh6vegaYk+29PXQnomOiQrzAKyLIK8Mja0iKNxytsq6RVIm3gmxqvzdiBBtGkhUMasLWh4JwNGsXPI/NVe7UuKn3xg/1HFg6j/fYlQLFypOy9A3wDlY7jYsvPpSN+auPC1h83kh7E2U3qtQ/vd0dZm3E4g2SQLxZUwMQYA==
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
 2025 08:30:28 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 08:30:28 +0000
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
X-ClientProxiedBy: TYCP286CA0371.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::7) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e172cc-76e9-40e2-2331-08de15fc3fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDNWQzdxcTJDYlErQ21ocDY4TGdUWjZrWldHR2tGeTljWlJBUlJ3aS9udjl3?=
 =?utf-8?B?L2NyUnRkcjhNZzlTZ2RmVGVuZitYR2lPajFkMmhkdEVFWU4vemZOZ3VBOEJj?=
 =?utf-8?B?T3Z1U0w5ZUhLbkNGZlZNMXVVWFZPMklkMTMza3lFSjV6VmF1TElJcm1ncDJW?=
 =?utf-8?B?a0ZDOEk3S2N2bEp3VDVWbE5VYnBoYVdBV3Y0dFcvRThJTDhxelRvM0V0WU05?=
 =?utf-8?B?YnZJelVYSHgyYjRKcUZnTHRVcGJ2VTJZMHhRemlGSkdRQU1rUUIxM0JDeTFx?=
 =?utf-8?B?ajBBdEo0OFBjTWpJTXdRcHpKNUJ2a2ZUSnE3Q2QxV09seElSL2twV3E0a3VQ?=
 =?utf-8?B?Zm1xcGVzcXJQblE0TXZ3Tjh0a3BWUG95d0lSdFdGeHBTU25aSXpNYUprVkdq?=
 =?utf-8?B?OUtoWGRWdys3ZFhsVUJTZlR4ZEFicGtwbkZiZWFVdG5YeExwaWI5TktsZmM5?=
 =?utf-8?B?OEpZUmozdGdXS0h6amlXTkUzaU9tdTd1a3R0aHlWcjJQQm1wRVRFM3VHeFJB?=
 =?utf-8?B?SUh6a2g0RGhJdTdlUjNNMlJ4ZzJSM0l3aG9VeHp5UmlNN1lkMjlYSnY0T1JG?=
 =?utf-8?B?WUhVOHlJM0x0cWRXR0dBTm1Dc0twUE1vZ2orUEtYNnBCOERGSFFTcEVITW5G?=
 =?utf-8?B?UXpDQmtybFpwa3FPS2F2K1ZiM20xbkNQQWNYdEl4L3NQRCt6dnpteFc3RXBa?=
 =?utf-8?B?MWtONlZYZXNzYzlOOENMbXRldm01MGdaS2MvZTRzQzRES2JBa2VDSVZyT1pa?=
 =?utf-8?B?cThiR0hsS2pZVFJrYVYvTS9helZPT0dsRng1KzNYSUNUWkNwRVdIbGVGcHM3?=
 =?utf-8?B?RG5pZ2dDbWxndUdxMXdWbzY5WFRla1p2K0xvSmc4aUVQRW9BR0pveWY0TDhC?=
 =?utf-8?B?OFc4TnF0d1NUZmorVjRBSmJicURvSmxUa0x2b3B3TmE5RURKQU5Pc1BBSWRS?=
 =?utf-8?B?WjRPL2JoODVIcE5hYmxOd2c2UVRnTTJMOCttSlFPVnZnOFRLRlYwOHRrbFFR?=
 =?utf-8?B?ajRrNjJDdWZObTg3TDBLTGs2SjI5bUQ1bkVqcnJVbXdwMmRBTUoxVWlCZlF2?=
 =?utf-8?B?c01FUFBYRlJ0WU1sZjVuSVYwenM5WkFRN1daalQzaUJTL2NSdVB6U1lMSjBy?=
 =?utf-8?B?RUt1NmYveE56ODlBNmtFMkpta20yeDVaSXlFbG1VV1NLUFN6U1FmQ0gwU3A4?=
 =?utf-8?B?WE9Zb21rdlBSUlNqcU9PZ0RCZnlQVXN1dmsza2lzcUMyUzdTR0dUdkpQL3dp?=
 =?utf-8?B?Z1YzRVZySHFwRHI4QzhzVmlJNCswL0N6aVA5Z0tzV1hoU1c0bklzWkpZTk9p?=
 =?utf-8?B?cGYwcUhUNEZNcUtXTkxGbnM2WjBDR1FHVHZzVW0weWlNSlNRVUtETGdSa2xt?=
 =?utf-8?B?Y3QyWUZRcW9BQ2xFNzdqdTQrSmZZOWxlVVdOS25qRS9uOURLTlFLeTUzam11?=
 =?utf-8?B?Z01DdzYvdzdhbkxXdmx2eUwwcGpPVUE3eTNMbU9ZcjUrTGFUQXI3QzFUSFZ5?=
 =?utf-8?B?c1lUMEFqeTg3Qmo4Nk9UdDdTcEk1cGJNYjlFanYxWnBVUEFIMk5EVzUvb3V1?=
 =?utf-8?B?dUs0MW9wMGtwYnJ1a3kzN1RJYjhNYmNKejFoeWQ4YzM2U2V2b0M0blZ2N3Zm?=
 =?utf-8?B?Nng0L3NIRnlHcUxMWkdpOVlOT2pqLzNOYVdZeElSa0loMmQ4SWI2SWZuOHU1?=
 =?utf-8?B?YmwzYWtrd1JhamZUZDlyOVNBZkdadXpGNitpLzl1b01LZXRaeHF3MC9SUEVE?=
 =?utf-8?B?UnlTUDVXZVZ0ZDZwSGUrdkJVdTMrYlN3eUtSaUIxKy8ybFNmaUllbzFGMHFr?=
 =?utf-8?B?SXRqY1N2ZWdHTERFTU9vVUVDVDhXd3hjSStFVCtBd24zZzFRQ3ZWN2N3Y1lp?=
 =?utf-8?B?V0JyRXd6RWVtTkRXQjZaTmI5Q3MwMnYxbEU0SkFkY2M2UFYxdXZ2K0ZuaFdU?=
 =?utf-8?B?OXZVM01kM1hqTmk5TlM2MG1TOGFLQTdsTkZ3NDlkQVJpWmdaUW1Rb1BxanR2?=
 =?utf-8?Q?R9mHpjqdEOh8LeBjlkTs+ULKEdnSx8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0VhaldUOXE0NWQxNE55ZkQ2dEtWTE1PRjRDZEk4VVVuNmxQVUxDRWg3WDdX?=
 =?utf-8?B?SVo3SG1zaVM3c1BQaCsvTUhaMWVORmlKZFB0akc0cElES0FESlRPL2gzVW5B?=
 =?utf-8?B?bldXNkY0bVBuU0d0cExjeFg5VVAyT2Uxc0locTUvOHplRkh4QU54ejBheHhM?=
 =?utf-8?B?VzhpbUJUdVFxWjJxSXdhZ3lacGNmZndQVlVFSkZMUk1PeU5JSE5oVjZHQjR0?=
 =?utf-8?B?cW1RYUYrRjVzMzBJNU5ZMlRZcjJVWk9GbXorRXVBakU5b3JkelcxTzlQTTFW?=
 =?utf-8?B?SEN1WWNYcDFVbFJQWEpneWlXOGRPZ0dSS25mYmRqWTQ3WUwwOXdyNk1hQk1P?=
 =?utf-8?B?Q2llK281VXJlbGNWTm9aV3RRYkd3QzBlems2VDdaOFJtbFU1OXZKRlRIQTFE?=
 =?utf-8?B?bklDZzlaLzlJbTJGbjIzWDdDZ3lUSU04ejhuTGovMzdHaDZHajZhRjg5Zklj?=
 =?utf-8?B?RDBZaHByeDlrWEI1NjFCejMyWHNtb1JGbFNOdzR5RjlJaDZ0OExwN3MvNWtD?=
 =?utf-8?B?aXdjMTFhRlNrVUNBRi9sVHcyYUtOcDZ3SHg1bmsvQ0daTWtTVStndlh1eFVB?=
 =?utf-8?B?QjFmMXlldWYybGRsVXJ2c2MvOGUxc2swb21YQklReDRzenl1SHhNMG5aZUpT?=
 =?utf-8?B?ZXNYVjlDdGxZRUg0Umsyb2g4eUxldXZUSVVtNjRFdmV6K1JBV3FWdmxkU2Js?=
 =?utf-8?B?bUJxRW5zc1h2YjAwM2pnalI0R2RsUXVvVFBZd0crc01iWTAxZ2tSbEdNMzVO?=
 =?utf-8?B?a3ozczBweHBBNGdpUC9zamQ1b3hmVzN0Tzlaa1JrWWRuMFBwVm1adjFBbEVI?=
 =?utf-8?B?UUJ3dHNzckYwR1NzWDhqazhWUWRYWG1tb0xnd0E1VWNVRHF4dms3L3NERk1O?=
 =?utf-8?B?MDRoS3ppU3p6VUJOSVB2TXk4NlFWaks0bENoV3pDLzNGMFZQZDNKYXFIUjQ1?=
 =?utf-8?B?Y0RvTzQ0V2RLS2hIQytpK2VpdUExc2lTbmloLzREY0pvdXFOdlZjdHpBSGk4?=
 =?utf-8?B?U2xhdFU4QlF6ci9waEhqbjR4RDY5ZkRZeUZGeUxzQ1lnMXA4SERiRm4vTDdH?=
 =?utf-8?B?ZUpiMDRUTk45L3NNOEhSNjhWbWFnL05iR0FMREpOd0RMV2ZBMVBucGlMbWJS?=
 =?utf-8?B?UDNicUlFNy82MnNkdmttMU5QN0xCdFlqTWt2N0tyS2d4cDJ5aFk2RitFUW16?=
 =?utf-8?B?ZTkzaEx3c3FCUldCdFZ4ZXRsbDNVMTRkMytObjJuRnVZRjlUYS9Cd0E0ZUsv?=
 =?utf-8?B?ajd4MFArdEdnRFUwVmJBN000eFhXS0RGdGNlZE0vRVhTRW8yRXpNR3BtNzli?=
 =?utf-8?B?RUxEcXlhdzdSdGZwcCtLOXJPQ2Y1QWxwNS91OFQwRlFQVkdtYzJ6NWJiTmRy?=
 =?utf-8?B?UWFVd1g2MmdEcTRMNGxlQXlDcWE3b2VKQWFvK3JJQXNsanBWUDlQSitsZVRU?=
 =?utf-8?B?VTVJTFBDamJ3SG5NY2c4dXZOUE1TMWpMTUFyeVBkVnBsTldoWTVDRk45TGtY?=
 =?utf-8?B?T1ZXcVFRbGFPMG5FZnoxY1VHdWIxUUtmblVnY2JsQTdKQmdGK0w2UFVzZEhE?=
 =?utf-8?B?VUQ1RXdhZkpMVDd0WnVFdnVDWnBxdWhhQnN6elh3UW5peXVsV003c3NDZ29r?=
 =?utf-8?B?OHo5MXhmTkROVkdncDVINmJIdENJc2tWQ09DMzFSZmFKUVpZeDNocXp5ZTFZ?=
 =?utf-8?B?ODJjekFDaTlnYmVUNFBKaGpRZkVKN1RDdm1VbXpZY1ZOWWtxYk5CY2FSRWVR?=
 =?utf-8?B?SmlER0l2OEZpY3hld0oxQk1TR2Urc3ByalVJYWM2aVpRdWUxVnhONHNTaFds?=
 =?utf-8?B?SGRBUHNTUXNZeUtqWXdraUJOU2R1NHdzVThtV0JsSSs0Zzl4RnB6RzhVb1pl?=
 =?utf-8?B?THZtUlB1aDk5RlFZMVRxdlJMVkJsU0J3ajkwOXFDK1Jxc1FHT2MvSXRpcjVm?=
 =?utf-8?B?amYrV21IN3E3em5KVHAyOExONis4NU5vWnNwanc3cURzTXowbStOUHppcW45?=
 =?utf-8?B?NThUdE1xNlZOeU9SUmF4cndDREptdTVwZkJsVnhHeTlMOXYxcHZlWEkzZzQr?=
 =?utf-8?B?NzFlalNNa3Z5bFAySVVZYngrV2NWZWJTaXZWM2dTRHl2WENkajg2b3QxbG9z?=
 =?utf-8?Q?7x0o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e172cc-76e9-40e2-2331-08de15fc3fa6
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 08:30:28.0073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sh566hnkk8wmImaYOUMScYLv6IeilYF51oz4vZv0LuB+/TyEOZjQCVWTDixYlZPH
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


