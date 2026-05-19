Return-Path: <linux-media+bounces-62098-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB43JBILDGo5UQUAu9opvQ
	(envelope-from <linux-media+bounces-62098-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 09:02:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C085788EF
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 09:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02826306D17D
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D803ACA7F;
	Tue, 19 May 2026 06:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="U/PHLc9g"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011031.outbound.protection.outlook.com [40.93.194.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38FE3A641C;
	Tue, 19 May 2026 06:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173766; cv=fail; b=CWs7T/BtlxEpLyjX+2miwpWmwNa6Te7vyEBgFey09DTyGoXJ3rgyfSLHQub53Yz/b6WxrwhOzFIoxR0UW85cvjE7TjO/x96bVEfadgfgIue1cuXpBHcDolB/0DtaYtbJQ/QxN+ztLbBYtEpjjMEhNu0jTd9mjWVAtkOi6LZua10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173766; c=relaxed/simple;
	bh=NvLGog5guvBsNtWIYZL2sYmCbxQXuhmn/YNuNKw6+kg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E7gL7XsmUTJp1irqRwU19w37OiCuvAkeLgCWbDxKDBF0Cuu0m10xMY95r6QQBfVyykLKBkQXR9hgKZCtgO1R0rWWLu7OLU8lZ4JFeMXNninh1sw4YTdFaVhpPCmkaEZ3/8tVAYsrG9yyVcfzcWyHcQ0RK+tiZGHjoFM8muaHs/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=U/PHLc9g; arc=fail smtp.client-ip=40.93.194.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdokSt1yZsGJFDYcMB33owMvD7MuiRXIgiIpZLVMf1DatzA5gOulV0gWG6bDQa/nJBDWYrPOfm7Vgzj6ac7VdAcjI5CXMryW2Ikj1NdrqH+PHE684L4xcuKB9GWpOc9dxnHAWA7hv9YUaNcTZd7k9YlKcZVAJ8Epi9lHf+eYO/qqr6goJksdXYngfeL6Eq5M7gYXB8WiEMRieKmf9xWO3jLQiZpyvQLkWxFHLjihdbP2aYAfhZz794vp6P5itZDYGzrCw1UdykhAiiqUzIHtZcJp3oJtz7L6wp5aVQeKSAO+PhDz1Gh3ow2p5jWGayF7kXq/ghv1onHb1SYgtkkevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dPTcpgYP58Fn8g8lsr/QkbegNZcqXAY6L0txl+Xr5M=;
 b=vYw9JR3JhYi5E7oEvx6KvpiXbMbkiG5rpfsnIr+oUc6pwD5fj7GTacxiEIumRlk836LszsXn6qb/MR0jUCSfalOYqY3W+xCjdphS9fHmeGac2vIx5+RuvyujZ1mDeqjEl9o4Vib9YmXAKgGIGQrielGaorM1W+lxSgHS3C2z7GsS4Ej5qKrBKsSvjSyuOW8TTTi5Z6QdbmGOfTDxyRfNxQF8D/0TIyRASqKw/ZbYrCPfrv8iBuMnef8piB5fwPy4Wbrj7Yt+JUnQ9MN2lOnBy0S0lVzar2VpQ2o0e2ZdxY34+blnRspLdq+y+am0GI9p/5lfpzJk+oktr4RKy07e9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dPTcpgYP58Fn8g8lsr/QkbegNZcqXAY6L0txl+Xr5M=;
 b=U/PHLc9gmjqVmto244VF3xtAPM4lMSFaTk22BUiUAitrv635uUGaFpVsrKN2qOS+W+0dmPMcXEtTVSr7+f7NvZG3YVoW4YH5nx0qi4aTjta8g9pJGFQfOcjrrMcFGIjzZdz/VxZ/mTMkpH7HcdJTk7yOUZPa4kE+Dsp3O6G9XdM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Tue, 19 May
 2026 06:55:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Tue, 19 May 2026
 06:55:59 +0000
Message-ID: <3dddb7e8-5837-4038-9823-ce419cb49ec2@amd.com>
Date: Tue, 19 May 2026 08:55:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] accel/qda: Add PRIME DMA-BUF import support
To: ekansh.gupta@oss.qualcomm.com, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
 konradybcio@kernel.org, robin.clark@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-11-b2d984c297f8@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260519-qda-series-v1-11-b2d984c297f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: d67e8fb8-5c69-4d94-9f89-08deb573aeb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|3023799003|11063799003|56012099003|22082099003|921020|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	cJn2LctKy85V/PUuu2UThq8KGOGt5ovmONaHgkEFOCM94SC91z9jxsVQTLwzh8UsBDPMGkGQx8AV9w6YyztlgPH+a1Fe0Pd4dNSRQyRpBlZ5l+9W98FlRV7gkhpQDyiAxuJIZ2a2NOEJPjyvpcZX7egtAaoy/9YCaqR1l1a0CcWlpu+/ghWTlJhcR+3FUopDr/RTdkuP6PCIfa7WtCsk7FB7uzp9ueJ/I1o4Ioz7eQdt/qDxlJZiwOav/q/5CL0fE8c9k5sj59kXfaLvcJN0nsDwoJc5ucIk8vxIK3BL55DVmGvAA1E87qA4aOi5U6d3KKidiT/fPFTf+KWBI6+uLlgucy67PkJlStNA13yctCKHbXJXqQY9MNJg7L0TZOHKSXlFyhQvU3QFd3ALH9J2ut5xGSNGfGXOPVaLN4Hhwgnj/8Vmb5xHwdRGcYKn29gdoIOumbfJh3sWsWE8l3T3IY0DDU9SMNRR6E8ncweDrKK++hWEUjo4vjfBvv/xXBvGNdDL6igBX+MkFbKy7TEa42AMG5d+gE5EvGvlhgpa+h3mRQClMyX+DHqJxJzBUnUG5KTeuoTkMV2qxB6QItD00Sh7kdfQYaK9eNs32iLkD9GHtzsGFFKRHx7bWptVMUOR5V0MwRauCnb7FcWOD+yQ1cs/ILqEPYdXeeoscjubYHcuEXXQrVzWM8WzdZIL1s/wwanedpimJP9tdjMStEPo1UJiG2DxtJL55LvFgD0RahQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(3023799003)(11063799003)(56012099003)(22082099003)(921020)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qy9IeUtrRWtia0ZMS0tFdFNyZXBQSGFFRnZlWFBWSFpkaVpLa0N5MzlsKzFj?=
 =?utf-8?B?UWxXS21KWUZuVm5YQzlTbWpVUGZ4NU1hSGlSKzhHM2w0R05Ta25ReXFNTE1i?=
 =?utf-8?B?d1RTSXlDR0U5NlJpeUdGQjJ3SHd5OGJnaGxibUZ5RkR1amgyK2dSQmliSnE2?=
 =?utf-8?B?SGJGUU5vZW1yaUxidUtMdVZIdFZnc3JqODlva1FNekxGY1k2QmxDU2VDdXV4?=
 =?utf-8?B?Z1FQWG5zQndxMEdjS2NYWnFzb3BMQ09IZ244UER4ZGtYT0RCallwM1hYUW9i?=
 =?utf-8?B?NzBqaER6ZjJSNnZvbUxhV0gvU08wQjNSR2J1cklmN1h5SE8vbFBaTXRMSitq?=
 =?utf-8?B?bHFxcUdYRUJSWVl5emcxVkt2azVaNDI1ZjRWbzgwSGFpZ2pXZEd0UGZ2UC9D?=
 =?utf-8?B?VDJOSDJzY202dmtoTDQ3amNabFpTTm1LNHRDS0tUbVovNmlNbXhvWUxNSzNV?=
 =?utf-8?B?U2RkMnl2bW1oSzlMOG1YNk9ycHE5ZFJwME9uR1lTMlp6VUVkc2ZkV2tTNm9M?=
 =?utf-8?B?eHlPNEYrWU1PZEhNc1VMK0hSRWxGNStCYmsrQUJpbFZYMGhqWlMxaTk3cnox?=
 =?utf-8?B?b2YwZ0Y3ZFFzNGpBZTR5TTZDa05scTJPVURzSmhEODhLdWxhSXRvLzI5dE1a?=
 =?utf-8?B?MXhUVUdXWUhyL092WitPWWtXMFA0S09YMCtjZUM5R1JhUGxZWEpONUFjQXdL?=
 =?utf-8?B?cWxUUlpFQnN0NW5tMEx4aU4ySElVUkVXQU1NdytFSDRpK0N1RWk3RC9kcTBM?=
 =?utf-8?B?TGRNbC8yYm1QbUVLRExpWVhPQWZaQS8xOXZTVEhBYkpYTVQyajNUbFVIb0Nn?=
 =?utf-8?B?eCtBQjhHZXY0clk3M2N0L1pZNTZ2USttWStYY3M2bXNNSlU2emxBNlFZZGl5?=
 =?utf-8?B?bFc5N2UxenFCVWJ0VGl3bUZOY1R1ZVZoTitTL0FhYTBzT0VOWEFyaStyRFdY?=
 =?utf-8?B?cWJLUnVNMEZtTWxUOFEvei9ZQTRLeGdtYzEzS3ArU3NYSmZscEh2cUZNbk1T?=
 =?utf-8?B?cm5TNHRIdWxFKzVmWlVSUkNLaXExdldQWVE2dE5lL1NteWVid1Q3QlBFRWRH?=
 =?utf-8?B?OFI5NUdsRXNUMUd5UThZNkdzcG1nZ09nS3pZczhyWXlpeVJNMmdRRnRtaGJh?=
 =?utf-8?B?bFRYc29KRHFoTEN4K3JwSUFDS0lPZ09odHQ0cGZQb0h2YUNtVDVFbUZPakxN?=
 =?utf-8?B?Nmx2bnZVcDhDdERMSFZwc3FydXRHZWdRck1icU5CZjBXMGl2aFR1MlZhaDNK?=
 =?utf-8?B?aGQ0cEdyNXZQOVhtVHQyUExuYkJqdTRiK3dkVWZYZGFqMzBqalNGRHh0VFN6?=
 =?utf-8?B?RmVjRlYrY2ZEWk55M3ViNVJESFhmUHA1bXdWYlhZUlhQYUFnY0lmS3ZrUGNm?=
 =?utf-8?B?MGVaWEVRQUo1OExZemtCajczWkNLNzc2bjl1OGRVcWxPaDlETDhxWkI2RlNE?=
 =?utf-8?B?WUw5U1pVa0xuWEhmVWtuOTlOQ3ZzeWFnK0VCUzhXSGdtWkdxYU9TeGYxWXZq?=
 =?utf-8?B?N1lTMkNqSzFWNzA4Qm52UHFUWVkxL1NUOVAvN2VBbDRkMWtUaU41MmcvYXNq?=
 =?utf-8?B?RjJ6NS9rZ3dUcUtrTlVwS0hUdVRCVTc0dnFGcmxlbG1uYjk1cHRiYXk3YTk2?=
 =?utf-8?B?YkY1NmhWSC9lQkxqalZ2Y2gvUUREVnZSZ044Y2w3MXdjOFcxbytiZFVLYXVG?=
 =?utf-8?B?U1BscmNyVzl1aW90WVhYNzBhSXVXekQzNXhWNml2M3ZPK0RzeUpZL0VMOXda?=
 =?utf-8?B?YVcvOEs3Z2IxS01wSm5lRWk1TnhRcExMTGt0bTJMK1owS0FoLytzdzJnenJS?=
 =?utf-8?B?QmQ5TXd4TGgwejU3RkVTc0EyRU9VVUlXd2JYYzl3QytyU0o1Q2RKK1VTOE1v?=
 =?utf-8?B?R3NUV1NRNUE5MHlkRytNVnF6bjh2Qjl1QWI3blg4TmlEWE16Sk10Z294VVA1?=
 =?utf-8?B?YzVlYzFqR3lBMkdJcURncnJUS0VhYytCRklTc0JrWTc0WjVDaDhKd004VnZp?=
 =?utf-8?B?M2lGZEpLbEdrMG9pZXNGRURvMUpjR1diSHBFN01Lb01DOHhLcEl0SXh5bnF5?=
 =?utf-8?B?V1NZdUxtbTIwbzgzYStIK0VVV093aGhkV2Q5VzB4SGlJSGMzQ09SZm04MHZk?=
 =?utf-8?B?Rk96Z2FpSWxSU2F2OEk0QmdnQk0xRytMTjBzZFpsUFJDUldVM0xJYWRkYUFu?=
 =?utf-8?B?TitodnlSb2RJUlhFZUdDZXJWWWw3YTNOT2tEekh4N0YzV1MyL1pLbVkwSjdK?=
 =?utf-8?B?Q1g1R0s1dGFkKy9CNDF6RWp3ZW91V2swWlRlMlhXRWs2cXhsdnlWaWlBR0Ur?=
 =?utf-8?Q?gzUTTB0HiX3NAN/wd9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d67e8fb8-5c69-4d94-9f89-08deb573aeb4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 06:55:59.1429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ujcqz4Ew1bmxbZkYnpykleJNnr+qHe+rUftvl5nIRSXnaZX0JS5jcUQeD4hf/U3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62098-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:mid,amd.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 03C085788EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 08:16, Ekansh Gupta via B4 Relay wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Allow user-space to import DMA-BUF file descriptors from other
> subsystems (GPU, camera, video) into the QDA driver via the standard
> DRM PRIME interface.
> 
> qda_prime.c
>   Implements qda_gem_prime_import(), which is set as the driver's
>   .gem_prime_import callback. On import it:
>   1. Short-circuits self-import: if the dma_buf was exported by this
>      device and is not itself an import, the existing GEM object is
>      returned with an incremented reference count.
>   2. Attaches to the dma_buf and maps it with DMA_BIDIRECTIONAL via
>      dma_buf_map_attachment_unlocked(), obtaining an sg_table whose
>      DMA addresses are IOMMU virtual addresses in the CB device's
>      address space.
>   3. Calls qda_memory_manager_alloc() to record the IOMMU mapping and
>      encode the SID in the upper 32 bits of the DMA address, matching
>      the convention used for natively allocated buffers.
> 
>   qda_prime_fd_to_handle() wraps drm_gem_prime_fd_to_handle() under
>   qdev->import_lock, storing the calling file_priv in
>   qdev->current_import_file_priv so that qda_gem_prime_import() can
>   retrieve it (the .gem_prime_import callback does not receive
>   file_priv directly).
> 
> qda_gem.c
>   qda_gem_free_object() is extended to handle the imported-buffer
>   teardown path: unmap the sg_table, detach from the dma_buf, and
>   release the dma_buf reference.
>   qda_gem_mmap_obj() rejects mmap requests on imported objects.
> 
> qda_memory_manager.c
>   qda_memory_manager_map_imported() records the IOMMU-mapped DMA
>   address from the first sg entry (the IOMMU maps the buffer as a
>   contiguous range) and encodes the SID prefix.

No it doesn't.

>   qda_memory_manager_free() skips the DMA free path for imported
>   buffers since the memory is owned by the exporter.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/accel/qda/Makefile             |   1 +
>  drivers/accel/qda/qda_drv.c            |  12 ++-
>  drivers/accel/qda/qda_drv.h            |   4 +
>  drivers/accel/qda/qda_gem.c            |  25 ++++-
>  drivers/accel/qda/qda_gem.h            |   8 ++
>  drivers/accel/qda/qda_memory_manager.c |  47 ++++++++-
>  drivers/accel/qda/qda_prime.c          | 184 +++++++++++++++++++++++++++++++++
>  drivers/accel/qda/qda_prime.h          |  18 ++++
>  8 files changed, 295 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
> index a46ddceecfc5..fb092e56d7f3 100644
> --- a/drivers/accel/qda/Makefile
> +++ b/drivers/accel/qda/Makefile
> @@ -12,6 +12,7 @@ qda-y := \
>         qda_ioctl.o \
>         qda_memory_dma.o \
>         qda_memory_manager.o \
> +       qda_prime.o \
>         qda_rpmsg.o
> 
>  obj-$(CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS) += qda_compute_bus.o
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> index c9b9e56dcb28..ef8bd573b836 100644
> --- a/drivers/accel/qda/qda_drv.c
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -7,10 +7,12 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_ioctl.h>
> +#include <drm/drm_prime.h>
>  #include <drm/drm_print.h>
>  #include <drm/qda_accel.h>
> 
>  #include "qda_drv.h"
> +#include "qda_prime.h"
>  #include "qda_ioctl.h"
>  #include "qda_rpmsg.h"
> 
> @@ -64,6 +66,8 @@ static const struct drm_driver qda_drm_driver = {
>         .postclose = qda_postclose,
>         .ioctls = qda_ioctls,
>         .num_ioctls = ARRAY_SIZE(qda_ioctls),
> +       .gem_prime_import = qda_gem_prime_import,
> +       .prime_fd_to_handle = qda_prime_fd_to_handle,
>         .name = QDA_DRIVER_NAME,
>         .desc = "Qualcomm DSP Accelerator Driver",
>  };
> @@ -100,6 +104,7 @@ static int init_memory_manager(struct qda_dev *qdev)
> 
>  void qda_deinit_device(struct qda_dev *qdev)
>  {
> +       mutex_destroy(&qdev->import_lock);
>         cleanup_memory_manager(qdev);
>  }
> 
> @@ -107,9 +112,14 @@ int qda_init_device(struct qda_dev *qdev)
>  {
>         int ret;
> 
> +       mutex_init(&qdev->import_lock);
> +       qdev->current_import_file_priv = NULL;
> +
>         ret = init_memory_manager(qdev);
> -       if (ret)
> +       if (ret) {
>                 drm_err(&qdev->drm_dev, "Failed to initialize memory manager: %d\n", ret);
> +               mutex_destroy(&qdev->import_lock);
> +       }
> 
>         return ret;
>  }
> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> index 8a7d647ac8fc..96ce4135e2d9 100644
> --- a/drivers/accel/qda/qda_drv.h
> +++ b/drivers/accel/qda/qda_drv.h
> @@ -47,6 +47,10 @@ struct qda_dev {
>         struct list_head cb_devs;
>         /** @iommu_mgr: IOMMU/memory manager instance */
>         struct qda_memory_manager *iommu_mgr;
> +       /** @import_lock: Lock protecting prime import context */
> +       struct mutex import_lock;
> +       /** @current_import_file_priv: Current file_priv during prime import */
> +       struct drm_file *current_import_file_priv;
>         /** @dsp_name: Name of the DSP domain (e.g. "cdsp", "adsp") */
>         const char *dsp_name;
>  };
> diff --git a/drivers/accel/qda/qda_gem.c b/drivers/accel/qda/qda_gem.c
> index 568b3c2e64b7..9e1ac7582d0c 100644
> --- a/drivers/accel/qda/qda_gem.c
> +++ b/drivers/accel/qda/qda_gem.c
> @@ -9,6 +9,7 @@
>  #include "qda_gem.h"
>  #include "qda_memory_manager.h"
>  #include "qda_memory_dma.h"
> +#include "qda_prime.h"
> 
>  static void setup_vma_flags(struct vm_area_struct *vma)
>  {
> @@ -25,8 +26,20 @@ void qda_gem_free_object(struct drm_gem_object *gem_obj)
>         struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(gem_obj);
>         struct qda_dev *qdev = qda_dev_from_drm(gem_obj->dev);
> 
> -       if (qda_gem_obj->virt && qdev->iommu_mgr)
> -               qda_memory_manager_free(qdev->iommu_mgr, qda_gem_obj);
> +       if (qda_gem_obj->is_imported) {
> +               if (qda_gem_obj->attachment && qda_gem_obj->sgt)
> +                       dma_buf_unmap_attachment_unlocked(qda_gem_obj->attachment,
> +                                                         qda_gem_obj->sgt, DMA_BIDIRECTIONAL);
> +               if (qda_gem_obj->attachment)
> +                       dma_buf_detach(qda_gem_obj->dma_buf, qda_gem_obj->attachment);
> +               if (qda_gem_obj->dma_buf)
> +                       dma_buf_put(qda_gem_obj->dma_buf);
> +               if (qda_gem_obj->iommu_dev && qdev->iommu_mgr)
> +                       qda_memory_manager_free(qdev->iommu_mgr, qda_gem_obj);
> +       } else {
> +               if (qda_gem_obj->virt && qdev->iommu_mgr)
> +                       qda_memory_manager_free(qdev->iommu_mgr, qda_gem_obj);
> +       }
> 
>         drm_gem_object_release(gem_obj);
>         kfree(qda_gem_obj);
> @@ -44,6 +57,10 @@ int qda_gem_mmap_obj(struct drm_gem_object *drm_obj, struct vm_area_struct *vma)
>         struct qda_gem_obj *qda_gem_obj = to_qda_gem_obj(drm_obj);
>         int ret;
> 
> +       /* Imported dma-buf objects must be mmap'd through the exporter, not the importer */
> +       if (qda_gem_obj->is_imported)
> +               return -EINVAL;
> +
>         /* Reset vm_pgoff for DMA mmap */
>         vma->vm_pgoff = 0;
> 
> @@ -143,6 +160,10 @@ struct drm_gem_object *qda_gem_create_object(struct drm_device *drm_dev,
>         qda_gem_obj = qda_gem_alloc_object(drm_dev, aligned_size);
>         if (IS_ERR(qda_gem_obj))
>                 return ERR_CAST(qda_gem_obj);
> +       qda_gem_obj->is_imported = false;
> +       qda_gem_obj->dma_buf = NULL;
> +       qda_gem_obj->attachment = NULL;
> +       qda_gem_obj->sgt = NULL;
> 
>         ret = qda_memory_manager_alloc(iommu_mgr, qda_gem_obj, file_priv);
>         if (ret) {
> diff --git a/drivers/accel/qda/qda_gem.h b/drivers/accel/qda/qda_gem.h
> index bb18f8155aa4..0878f57715f6 100644
> --- a/drivers/accel/qda/qda_gem.h
> +++ b/drivers/accel/qda/qda_gem.h
> @@ -22,12 +22,20 @@ struct qda_gem_obj {
>         struct drm_gem_object base;
>         /** @iommu_dev: IOMMU context bank device that performed the allocation */
>         struct qda_iommu_device *iommu_dev;
> +       /** @dma_buf: Reference to imported dma_buf */
> +       struct dma_buf *dma_buf;
> +       /** @attachment: DMA buf attachment */
> +       struct dma_buf_attachment *attachment;
> +       /** @sgt: Scatter-gather table */
> +       struct sg_table *sgt;
>         /** @virt: Kernel virtual address of the allocated DMA memory */
>         void *virt;
>         /** @dma_addr: DMA address (with SID encoded in upper 32 bits) */
>         dma_addr_t dma_addr;
>         /** @size: Size of the buffer in bytes */
>         size_t size;
> +       /** @is_imported: True if buffer is imported, false if allocated */
> +       bool is_imported;
>  };
> 
>  /**
> diff --git a/drivers/accel/qda/qda_memory_manager.c b/drivers/accel/qda/qda_memory_manager.c
> index 82111275f420..d2aa0e0e65f5 100644
> --- a/drivers/accel/qda/qda_memory_manager.c
> +++ b/drivers/accel/qda/qda_memory_manager.c
> @@ -202,6 +202,41 @@ static struct qda_iommu_device *get_or_assign_iommu_device(struct qda_memory_man
>         return NULL;
>  }
> 
> +static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
> +                                          struct qda_gem_obj *gem_obj,
> +                                          struct qda_iommu_device *iommu_dev)
> +{
> +       struct scatterlist *sg;
> +       dma_addr_t dma_addr;
> +
> +       if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
> +               drm_err(gem_obj->base.dev, "Invalid parameters for imported buffer mapping\n");
> +               return -EINVAL;
> +       }
> +
> +       sg = gem_obj->sgt->sgl;
> +       if (!sg) {
> +               drm_err(gem_obj->base.dev, "Invalid scatter-gather list for imported buffer\n");
> +               return -EINVAL;
> +       }
> +
> +       gem_obj->iommu_dev = iommu_dev;
> +
> +       /*
> +        * After dma_buf_map_attachment_unlocked(), sg_dma_address() returns the
> +        * IOMMU virtual address, not the physical address. The IOMMU maps the
> +        * entire buffer as a contiguous range in the IOMMU address space even if
> +        * the underlying physical memory is non-contiguous. Therefore the first
> +        * sg entry's DMA address is the start of the complete contiguous
> +        * IOMMU-mapped range and is sufficient to describe the buffer to the DSP.
> +        */
> +       dma_addr = sg_dma_address(sg);
> +       dma_addr += ((u64)iommu_dev->sid << 32);
> +       gem_obj->dma_addr = dma_addr;

That handling here is completely broken since it assumes that the exporter maps the buffer as contigious range.

But that's in no way guaranteed.

Regards,
Christian.

> +
> +       return 0;
> +}
> +
>  /**
>   * qda_memory_manager_alloc() - Allocate memory for a GEM object
>   * @mem_mgr: Pointer to memory manager
> @@ -237,7 +272,11 @@ int qda_memory_manager_alloc(struct qda_memory_manager *mem_mgr, struct qda_gem_
>                 return -ENOMEM;
>         }
> 
> -       ret = qda_dma_alloc(selected_dev, gem_obj, size);
> +       if (gem_obj->is_imported)
> +               ret = qda_memory_manager_map_imported(mem_mgr, gem_obj, selected_dev);
> +       else
> +               ret = qda_dma_alloc(selected_dev, gem_obj, size);
> +
>         if (ret) {
>                 drm_err(gem_obj->base.dev, "Allocation failed: size=%zu, device_id=%u, ret=%d\n",
>                         size, selected_dev->id, ret);
> @@ -262,6 +301,12 @@ void qda_memory_manager_free(struct qda_memory_manager *mem_mgr, struct qda_gem_
>                 return;
>         }
> 
> +       if (gem_obj->is_imported) {
> +               drm_dbg_driver(gem_obj->base.dev,
> +                              "Freed imported buffer tracking (no DMA free needed)\n");
> +               return;
> +       }
> +
>         qda_dma_free(gem_obj);
>  }
> 
> diff --git a/drivers/accel/qda/qda_prime.c b/drivers/accel/qda/qda_prime.c
> new file mode 100644
> index 000000000000..acb0ac8c40fd
> --- /dev/null
> +++ b/drivers/accel/qda/qda_prime.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <drm/drm_gem.h>
> +#include <drm/drm_prime.h>
> +#include <drm/drm_print.h>
> +#include <linux/slab.h>
> +#include <linux/dma-mapping.h>
> +#include "qda_drv.h"
> +#include "qda_gem.h"
> +#include "qda_prime.h"
> +#include "qda_memory_manager.h"
> +
> +static struct drm_gem_object *check_own_buffer(struct drm_device *dev, struct dma_buf *dma_buf)
> +{
> +       struct drm_gem_object *existing_gem;
> +
> +       /* Only safe to access priv if this dma-buf was exported by this device */
> +       if (!drm_gem_is_prime_exported_dma_buf(dev, dma_buf))
> +               return NULL;
> +
> +       existing_gem = dma_buf->priv;
> +       if (existing_gem->dev != dev)
> +               return NULL;
> +
> +       if (to_qda_gem_obj(existing_gem)->is_imported)
> +               return NULL;
> +
> +       drm_gem_object_get(existing_gem);
> +       return existing_gem;
> +}
> +
> +static struct qda_iommu_device *get_iommu_device_for_import(struct qda_dev *qdev,
> +                                                           struct drm_file **file_priv_out)
> +{
> +       struct drm_file *file_priv;
> +       struct qda_file_priv *qda_file_priv;
> +       struct qda_iommu_device *iommu_dev = NULL;
> +       int ret;
> +
> +       file_priv = qdev->current_import_file_priv;
> +       *file_priv_out = file_priv;
> +
> +       if (!file_priv || !file_priv->driver_priv)
> +               return NULL;
> +
> +       qda_file_priv = (struct qda_file_priv *)file_priv->driver_priv;
> +       iommu_dev = qda_file_priv->assigned_iommu_dev;
> +
> +       if (!iommu_dev) {
> +               ret = qda_memory_manager_assign_device(qdev->iommu_mgr, file_priv);
> +               if (ret) {
> +                       drm_err(&qdev->drm_dev, "Failed to assign IOMMU device: %d\n", ret);
> +                       return NULL;
> +               }
> +
> +               iommu_dev = qda_file_priv->assigned_iommu_dev;
> +       }
> +
> +       return iommu_dev;
> +}
> +
> +static int setup_dma_buf_mapping(struct qda_gem_obj *qda_gem_obj, struct dma_buf *dma_buf,
> +                                struct device *attach_dev, struct qda_dev *qdev)
> +{
> +       struct dma_buf_attachment *attachment;
> +       struct sg_table *sgt;
> +       int ret;
> +
> +       attachment = dma_buf_attach(dma_buf, attach_dev);
> +       if (IS_ERR(attachment)) {
> +               ret = PTR_ERR(attachment);
> +               drm_err(&qdev->drm_dev, "Failed to attach dma_buf: %d\n", ret);
> +               return ret;
> +       }
> +       qda_gem_obj->attachment = attachment;
> +
> +       sgt = dma_buf_map_attachment_unlocked(attachment, DMA_BIDIRECTIONAL);
> +       if (IS_ERR(sgt)) {
> +               ret = PTR_ERR(sgt);
> +               drm_err(&qdev->drm_dev, "Failed to map dma_buf attachment: %d\n", ret);
> +               dma_buf_detach(dma_buf, attachment);
> +               return ret;
> +       }
> +       qda_gem_obj->sgt = sgt;
> +
> +       return 0;
> +}
> +
> +/**
> + * qda_gem_prime_import() - Import a DMA-BUF as a GEM object
> + * @dev: DRM device structure
> + * @dma_buf: DMA-BUF to import
> + *
> + * Return: Pointer to the imported GEM object on success, ERR_PTR on failure
> + */
> +struct drm_gem_object *qda_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
> +{
> +       struct qda_dev *qdev = qda_dev_from_drm(dev);
> +       struct qda_gem_obj *qda_gem_obj;
> +       struct drm_file *file_priv;
> +       struct qda_iommu_device *iommu_dev;
> +       struct drm_gem_object *existing_gem;
> +       size_t aligned_size;
> +       int ret;
> +
> +       if (!qdev->iommu_mgr) {
> +               drm_err(dev, "Invalid iommu_mgr\n");
> +               return ERR_PTR(-ENODEV);
> +       }
> +
> +       existing_gem = check_own_buffer(dev, dma_buf);
> +       if (existing_gem)
> +               return existing_gem;
> +
> +       iommu_dev = get_iommu_device_for_import(qdev, &file_priv);
> +       if (!iommu_dev || !iommu_dev->dev) {
> +               drm_err(dev, "No IOMMU device assigned for prime import\n");
> +               return ERR_PTR(-ENODEV);
> +       }
> +
> +       drm_dbg_driver(dev, "Using IOMMU device %u for prime import\n", iommu_dev->id);
> +
> +       aligned_size = PAGE_ALIGN(dma_buf->size);
> +       qda_gem_obj = qda_gem_alloc_object(dev, aligned_size);
> +       if (IS_ERR(qda_gem_obj))
> +               return ERR_CAST(qda_gem_obj);
> +
> +       qda_gem_obj->is_imported = true;
> +       qda_gem_obj->dma_buf = dma_buf;
> +       qda_gem_obj->virt = NULL;
> +       qda_gem_obj->iommu_dev = iommu_dev;
> +
> +       get_dma_buf(dma_buf);
> +
> +       ret = setup_dma_buf_mapping(qda_gem_obj, dma_buf, iommu_dev->dev, qdev);
> +       if (ret)
> +               goto err_put_dma_buf;
> +
> +       ret = qda_memory_manager_alloc(qdev->iommu_mgr, qda_gem_obj, file_priv);
> +       if (ret) {
> +               drm_err(dev, "Failed to allocate IOMMU mapping: %d\n", ret);
> +               goto err_unmap;
> +       }
> +
> +       drm_dbg_driver(dev, "Prime import completed successfully size=%zu\n", aligned_size);
> +       return &qda_gem_obj->base;
> +
> +err_unmap:
> +       dma_buf_unmap_attachment_unlocked(qda_gem_obj->attachment,
> +                                         qda_gem_obj->sgt, DMA_BIDIRECTIONAL);
> +       dma_buf_detach(dma_buf, qda_gem_obj->attachment);
> +err_put_dma_buf:
> +       dma_buf_put(dma_buf);
> +       qda_gem_cleanup_object(qda_gem_obj);
> +       return ERR_PTR(ret);
> +}
> +
> +/**
> + * qda_prime_fd_to_handle() - Convert a PRIME fd to a GEM handle
> + * @dev: DRM device structure
> + * @file_priv: DRM file private data
> + * @prime_fd: File descriptor of the PRIME buffer
> + * @handle: Output GEM handle
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int qda_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
> +                          int prime_fd, u32 *handle)
> +{
> +       struct qda_dev *qdev = qda_dev_from_drm(dev);
> +       int ret;
> +
> +       mutex_lock(&qdev->import_lock);
> +       qdev->current_import_file_priv = file_priv;
> +
> +       ret = drm_gem_prime_fd_to_handle(dev, file_priv, prime_fd, handle);
> +
> +       qdev->current_import_file_priv = NULL;
> +       mutex_unlock(&qdev->import_lock);
> +
> +       return ret;
> +}
> +
> +MODULE_IMPORT_NS("DMA_BUF");
> diff --git a/drivers/accel/qda/qda_prime.h b/drivers/accel/qda/qda_prime.h
> new file mode 100644
> index 000000000000..9b3850d54fa7
> --- /dev/null
> +++ b/drivers/accel/qda/qda_prime.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QDA_PRIME_H__
> +#define __QDA_PRIME_H__
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <linux/dma-buf.h>
> +
> +struct drm_gem_object *qda_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf);
> +int qda_prime_fd_to_handle(struct drm_device *dev, struct drm_file *file_priv,
> +                          int prime_fd, u32 *handle);
> +
> +#endif /* __QDA_PRIME_H__ */
> 
> --
> 2.34.1
> 
> 


