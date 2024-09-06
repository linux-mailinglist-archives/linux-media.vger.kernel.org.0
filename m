Return-Path: <linux-media+bounces-17778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E471D96F53E
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 15:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CE0E1C21D59
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 13:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC8C1CE701;
	Fri,  6 Sep 2024 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="riEO3u0Y"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2070.outbound.protection.outlook.com [40.107.95.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127212F5A5;
	Fri,  6 Sep 2024 13:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725628856; cv=fail; b=PDobRDeieQrdlc2O1CD2dqBW9Oj2Z77lFNk1NI2tdw1jA4mbJQipCneic82Kp/+ajOqNoqp54Qc44A0UlwWEaEKAC51LeJ4k42EkmBXQLxt+ncWFR5oj7FnzQi1H/oGtFHOC+sWm7rj7ono2onyiGJhhOxBqFusmLQ+FmgTM3Co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725628856; c=relaxed/simple;
	bh=INvUd6f3W8C4m1X0kpRGxcj+HHVJTeR7jlxKAsq6C88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=thyhLfUEIikpkGSzcYgVCAK8zAByb2mBqGnL5I4/Mgcoqmy+Eu0yb3A1zXwmrUDLEOYje9ftqmPn3+M3p8En2X4uuHA6i6Rs1hY6GMXmZoXFFKzF8FXeH3yCKjJ6HAfKSkA1Y2x0u+/NMX5UQ/2bo0kT7ZZnC18c+XokAUWYKpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=riEO3u0Y; arc=fail smtp.client-ip=40.107.95.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkJyqjROKCZVvk4udOLHri8keYD+GubJPpyk3TpPOmAW0GcwThWputzX8HFU06q0aQtFGkxvzEDd9Pn1YLDsBAIoYWtRxZAC6isMxwucGe3tZVEMmjp1DsQCMp6anrAzwzzs+1dxI0bJnDW4Sw21qX61HqZE3u7R/QlVfGgCOFOj9nhbZB+a5ev+hJHizpVQagLqRF9nmfee3rYXOvl7h4VhmFZArjxULtnr0goi0L0Z0EctXV9s00yDdue8DGFn4mH1YiK9/KDLzRE1DFHsNb4aDSAAJYAKfreB+owcKM9d1y2ML7zgtcP+amGWp9x0zyyqtJEJKaNFKZoLZ5RMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6FTr56g8KUsb5RUo5wq/ALoxye8LyZSXT9uT+7k+dU=;
 b=qq4J+4/p9M/oGT8Z69jqBpynRcAg3Vf1pJN7fhvTd1WVqzGlD8D6yGpPdX79g24eXP4Mevnzxl4Xx9pwzjkHcIpHgxn9dVt5KjvC/Y+jmJ+L4D/KDvM/ZONcQvUuc2a/y5/wJtVV0y97agYUkkHjpFwfifQGN4B3JAN6FFbNtz8eCS8boaCq0OWdq9DIksclnzeImXzzAPxCBRrpNetcOMgNAmhL8gTL2jhXU+dgpIbVPV6QbpQpxI/no73pLH7yxno/0O3/anLKtxwozrhh7R37+JITTXmYWxxrhf5sFlfrMsq7/+PxVevmkJfl4iDspkPnZJS5Zo4JfejEmKpi1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6FTr56g8KUsb5RUo5wq/ALoxye8LyZSXT9uT+7k+dU=;
 b=riEO3u0Y2x0jA3uBZ049AuRtWvVwYknO/ZEW9KQlsUmwoODaFXuSFUMHKDJ9sAcMLZcXoYKk0+O9IFJXsvT5Ann3O00aoVnn5FVY2bUahfb5/ZLlEQ6QeevYTXgHh6gCshZ+kUJfxyktF/FmOvrbIyQieXhllEYUplfoTX6e/UfmiTJA7a2bDl4mi4RdvMmadjml5sA2NNvOchUkWwL7J/K7pujVn9qi4LT/Ply1V/u9YHSXNP73mig0AG0kcUdQM1ro1qwpXO8aiNV1pwFeR5CBLRuPaNmt9tFW6sLsk1Iax6YnsD8i4K6s9S2rXX1KLHvJS6AWpPAzu0Lr/Sx5LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB7763.namprd12.prod.outlook.com (2603:10b6:610:145::10)
 by CY8PR12MB7363.namprd12.prod.outlook.com (2603:10b6:930:51::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 13:20:50 +0000
Received: from CH3PR12MB7763.namprd12.prod.outlook.com
 ([fe80::8b63:dd80:c182:4ce8]) by CH3PR12MB7763.namprd12.prod.outlook.com
 ([fe80::8b63:dd80:c182:4ce8%3]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 13:20:49 +0000
Date: Fri, 6 Sep 2024 10:20:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Stanimir Varbanov <svarbanov@suse.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: venus: firmware: Use
 iommu_paging_domain_alloc()
Message-ID: <20240906132048.GD1358970@nvidia.com>
References: <20240812072105.9578-1-baolu.lu@linux.intel.com>
 <20240812072105.9578-2-baolu.lu@linux.intel.com>
 <c5141c18-3f7b-41ac-a064-9911873d0bf9@gmail.com>
 <20240904121614.GA782327@nvidia.com>
 <d6d5490e-7270-4391-b91a-72af551c6e7d@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6d5490e-7270-4391-b91a-72af551c6e7d@suse.de>
X-ClientProxiedBy: MN0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::6) To CH3PR12MB7763.namprd12.prod.outlook.com
 (2603:10b6:610:145::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB7763:EE_|CY8PR12MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f5372d-0d20-4ba5-6c99-08dcce76b9b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QS9hYWwrb3FZVld6T0RtSVBTTzROQzIzZzBQWkdGRDFnMXg5NjBuazU2VEJ2?=
 =?utf-8?B?ak5qRDdKNC8zOCtYbWpHZUVzNUJ5LzJlcE5JM0lDREgyUHdVWElwTnBiYTFx?=
 =?utf-8?B?QjRSc2JDcWx5c3NmRmlvWVV5QWsybjFWSGtDMlJhZUZra3hORXM5bGs4Y2xQ?=
 =?utf-8?B?VHhNamlNMGQ3dFYzZmdzWE12UHIra2ZDaUVlRTVtVjlhNXpDWWxGbGNvc0Iy?=
 =?utf-8?B?VTArdEJpVERORVl0QUhBT0ZWSEpjYnhzaUg0TitGWVo5djBtajBSNC95L3R2?=
 =?utf-8?B?eGIwb2dNWVJ4Qk5aeDVzWTZhRC9mUnpjcnRhTVlBTFd6eDVEMm5rZXcyYUo2?=
 =?utf-8?B?SnUyK1Nta3VYK0RBdkg1cjhrRUd4WnRSMHRBQjFTQzZGeXlNNVVJR1lROG10?=
 =?utf-8?B?eHJTaHBGT1NyaVhBSWtZdCtDQ2dNd3pabHpwckkxVHNQek81dHpISmhYY094?=
 =?utf-8?B?dFd1dXdkZW5Qb0NCR2IvZ3Q2WDkwNmVGRzBJRU5rai9iVXlRQkorMnZhaGVX?=
 =?utf-8?B?QUJkUnRFUUhWczlrNHVNY2ora01Dd3hPOGNuakdmc2tvN2FzU05wVDR6UXBy?=
 =?utf-8?B?MDFOeFM2T1I1eVcvYW5xTWJ3dEFtYzRVOEtMMnFVNkhUUGIraHFPL2ZCc1Fu?=
 =?utf-8?B?Q0ZXMm9INHRvTm4vUENSN3BMK2UwaVVVcnN6UnAzbzlJUUhhaFB5QUF6cHZr?=
 =?utf-8?B?TS9yMDdkQlZQdVJhRHFiQm1YbW02dmc0RCtSSkdqNUdBdExWRkpsUE95MjVn?=
 =?utf-8?B?ampRNURIZXBwR1h6ZkZuY1ZhalA4a2t6WU43WTZCUCtyWTQyN0FGV0tIdEtT?=
 =?utf-8?B?bVFmUUlJWE1FRXZsR0tBLzdEZUdvVXB2WWUvVFNXR3V1YmY4NzBUTUNlK2JJ?=
 =?utf-8?B?aFJ4OUN6dEE1RjQ2UTU3NkNHZEtqZ1hWbjVpV2l0SGJnc2wxUHVkcUR1cE9y?=
 =?utf-8?B?VTRKcXB5ZXMyNUpPQmIyVWpXaEExYjNRZ1BzY0JtSGpsd1FGb0swNi80UlpY?=
 =?utf-8?B?ZHgwWXAyMzQxNS9QeXlDdmxLbmZSMUhHS3htU3JaQnQxVHRPdHE2Z0R0L1hL?=
 =?utf-8?B?aXM1cDEzSUNQTlY5UzFlQXZOWUgzeWdSKzFQRlhXRllReDVTQWFQdEJDREND?=
 =?utf-8?B?QkNYcjM5SmpMQmQ3dlNlc3NEbTJSTFNQcW9QSkZiU3hqaTZ3T2k4Vy85Wms4?=
 =?utf-8?B?cFVycEROejAvdTJaT2huNFRMbDVWK1NZRUd3Znl0aFhHM3Nva0RpaTkvUlZW?=
 =?utf-8?B?QzVSbFJuZ1ZIcDBCbGdwN1FUb1o3NUVRL0hBaG5GdGpwd1p4b2hpTVJJVzNW?=
 =?utf-8?B?QW5CcGF0SmVPWUpMdHR4NHJUN1g4bWVzb3VkZWQ1MXlvZExLdjRUdmlMbCsz?=
 =?utf-8?B?K3I0ZXY5R1U5TVdhTVFwanRWL3lBN2lBWVJ5SXdBdTRWMUdqTFhXaVNyQkI3?=
 =?utf-8?B?TzI0MkZiRnI2ck1HRUpCcDdNdEtHelFWK2tlWUxhVlFNWjUvSUZQcjg3N3U3?=
 =?utf-8?B?aGlCZlRLekk3VWx6bkUwQVJYWC8ybGl0VThPMnQ5SC9oVGJQMWtUdXg3eFVV?=
 =?utf-8?B?Z21IeU5TdTJhUGlNaWdnWjl3SkZsSGE1dlhVcVZNdHZLZEZBODd5VFlmUUI3?=
 =?utf-8?B?R3JmcTRkUWtpV0FuQnFLNDV6L2l2YXI0QzFCWmxnSm9nT1QxVjJacm1iUmc3?=
 =?utf-8?B?eDV6RmVTTGs2RmF2ZEtHalppM0JvWHRLVmllbUdpYWpkL24rR0FTVVdFM2o1?=
 =?utf-8?B?WURzek1ORDdUSWtRLytkTjUzeVEya1J4R01jZ3AyY2hic29BK2Z4SzhKVTM1?=
 =?utf-8?B?YjU3SDdhcTA1dFNLdzlEdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB7763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE41NG5wRWVZa2w4eCtkN3dUSVdwUlpwL1lsVXE5MFdkWk5saE5pNCtTdFRo?=
 =?utf-8?B?RlQ1dzU3UWVDOXZrZ3dvbmxUZ1h0UFlTcXdBeXIwRXMvb3F6TnFnRHVwVXpO?=
 =?utf-8?B?ZzNsT3c4K1FjR2dxQkdJU0pZZi90TTdHY3V0TmY3aktRSEZqQ1Fad01JMnJu?=
 =?utf-8?B?dkpRNVBQU3dvQ1E4MjBsdFplYjFzRGRXTUhjQ0pYelRKWjd6U2xmSFh4Y0NF?=
 =?utf-8?B?Q2VlR242bHZTRkpTK2V2YzkrcHNtMzdRYzJva3FjRjVrWFltMVV0d2N5a0hm?=
 =?utf-8?B?OEU1NkZSK1VsSlhHbmFzeWhCL3piemdXWmFOL3pFUlFxRzRiSm12M0d1WFNh?=
 =?utf-8?B?bXJGLzY3Yk1zbmJMV2huMHdOVGdtZ0FjZTN5YzlzdlB5OU9lL05RRGtxMXBQ?=
 =?utf-8?B?MG1oSFhGMjBocEVqdWZxUlFhOUwzZk1NamFmSGRPUmZ4b3JOMnB4UzhUaVBm?=
 =?utf-8?B?TjFvYUh5T2FHRWlRc08wNTVRMHJpTXJ6NzFyTjZ0M3ZFZWtLVGpJUW94bklD?=
 =?utf-8?B?UjM4NHA2V1pXd0gzMzBGNGw5c1ZWWUJvSTlNdjMvY1lhaHlBbkxxMEx4UGRB?=
 =?utf-8?B?dVFsQWhHWHN4M1VRSzY4dGpTUVIzYW83TDNmcjdvWml3MEZmYTNoNEtDZk1a?=
 =?utf-8?B?Y21TbWJxeU9rbnpwYjBsQzlXVUNlOEhPNC9FYS9RVW8rUHpjT09hVGs3U0xk?=
 =?utf-8?B?aEkwcWIxMkxLdUlrcFU0OFRvQjJKSjhQYVZKYWdNV2lWS3pLYjh3ZTQzUWdB?=
 =?utf-8?B?WE1kbElxTE1iOGoyZ0NGVHM0czhQQVB2WVZnaEdJNVNHU0xVOUpkRXJiZXZu?=
 =?utf-8?B?Vk95UThaV2NFT1BQeUQ5Q3Y5UUdkaDhyQ2Q1SUYzbWJpZ3Z4aWplTkV4bkE3?=
 =?utf-8?B?TllmekxybE1XMW9jbWVDTmZMWWVDM2lLWmt5a0ZDanRFWGR2Y3pBd3NuYkcx?=
 =?utf-8?B?SnIxbVZFWFY5eU9mZXVzUGtiRGNwZGFBYXMzU3MwVUswbUdGQ2Vzc3RnR2o3?=
 =?utf-8?B?MmJUOFpxZVZYZjVHS0c5ODFYY1JQZEVGdWxHTXduRllDMjNNSWFPeHYxQzIy?=
 =?utf-8?B?TFRsWFd3bzNhcXFRN0VlSzFKc0YxVUttR3krQ3RDbFBjSEh2c1BkNzFtVVUr?=
 =?utf-8?B?ZmhvNDNPS1pjbXBLaHk4bUEvZ0hEZHU0cDJpZStRdzgveUhzTGpsYjBGb1A3?=
 =?utf-8?B?QjhpRTUwOW1ZckxtaWIreWtrczBmdXhlNXpyalVySk83QWpGRElDaklkVjQy?=
 =?utf-8?B?RnFtcGNsUlUxOXJGOG92eWI1YVVFT1p2VXVTbWdHSks1V3pYRllSV0JEeHIw?=
 =?utf-8?B?MFdua0llcVA4ZWc5WHUvOWFLT0d1aTFaVEw0c3hlYUw4NmowcEZYTlZNT2Fq?=
 =?utf-8?B?RlZlNmR3ZmIwdC9xa3NIbWt5NDkrckxlOVlzcUdqWUs1NGRKeG9WdmxCUm5K?=
 =?utf-8?B?Zmh6cVUzVUNtcVZhZk1uLzZseVlSVzZIRlZLTHg0WlZ3bTNxSHpIZVA0VDZ4?=
 =?utf-8?B?RzVZbkxhSGNXbllFeXY2Z3dpSFJCdzIyS3IwMHZGSEJ4U1ZTcWJ1N3Via1pp?=
 =?utf-8?B?Q1JlZ0g2YlBTR0doSmREWStlaU9XVHBvU2pUQnMrZnVJd2wrOURrb2xNZ3Yx?=
 =?utf-8?B?OTF6emgwTHNwUm9ZRzcwUXFvcEpFa24vU1RQNE5hVTRSQ3pnNVMzMWRrOXBX?=
 =?utf-8?B?WStJSkFEWmlLSjVncXVUd3kyQTlqeFV0S1VrN1ZqZG9YdXZaM3dmemFRV1pM?=
 =?utf-8?B?bDVkYXRwZHE5YmQ0NDZlclZIMTZVcUY4bCtXTFdyUjBCaWZjbVNmeWJjMUEz?=
 =?utf-8?B?YzcrYzVISHZYUkJ6M1Y5TEliV25iS21DNHpHV3NQbmphREFyQjdlQ1JzTUJw?=
 =?utf-8?B?RVJiOFRqNWlqRU9OVFhuSCtGMDFyOTRidUdrSlFXN29LN2l6SmxSdmxQeDhO?=
 =?utf-8?B?NmRBYUJmQ29Ib1Aybk9PUFFHZG5VZVhWb0J4djZqQkVVOGZ1SlNUbUpJd3R6?=
 =?utf-8?B?UlZjT3pFMzJaWjZoekdvbE5ueFFWdzVHcGxicE4yempveXhML3NBUERYTXNL?=
 =?utf-8?B?NEd6UkxkVWRGVDVpY0F5UjhyVjRHbGNXUTNWSlIwaXFqVVpIN29xaFBiU09T?=
 =?utf-8?Q?m1zJMBsX5jWnB09fF3gcbjdDw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f5372d-0d20-4ba5-6c99-08dcce76b9b5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB7763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 13:20:49.8816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fjNGyGbpj74xs0VSzMk2//kLo5PsVudtfGjhxobaOvVE3kGOhOHHnLr+KtLkMAZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7363

On Fri, Sep 06, 2024 at 12:51:08PM +0300, Stanimir Varbanov wrote:
> >> On 12.08.24 г. 10:21 ч., Lu Baolu wrote:
> >>> An iommu domain is allocated in venus_firmware_init() and is attached to
> >>> core->fw.dev in the same function. Use iommu_paging_domain_alloc() to
> >>> make it explicit.
> >>>
> >>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> >>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> >>> Link: https://lore.kernel.org/r/20240610085555.88197-10-baolu.lu@linux.intel.com
> >>> ---
> >>>   drivers/media/platform/qcom/venus/firmware.c | 6 +++---
> >>>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> >>> index fe7da2b30482..66a18830e66d 100644
> >>> --- a/drivers/media/platform/qcom/venus/firmware.c
> >>> +++ b/drivers/media/platform/qcom/venus/firmware.ced
> >>
> >> Acked-by: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> >>
> >> I'll take the patch through linux-media tree.
> > 
> > Did this patch and the 1/2:
>
> 2/2 is in linux-next now.

And 1/2? Can someone pick it up too?

https://lore.kernel.org/all/2o6gpxknio4kvf5fmqgai5jaov65semmw3wvtmt4gdauwzhbti@ii3ydtlmp2sb/

Thanks,
Jason

