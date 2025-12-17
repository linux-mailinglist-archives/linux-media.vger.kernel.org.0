Return-Path: <linux-media+bounces-48977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17478CC723F
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 11:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B859B3062BFF
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 10:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F246398B7A;
	Wed, 17 Dec 2025 10:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tsBGbBpK"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010068.outbound.protection.outlook.com [52.101.56.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1109538E155;
	Wed, 17 Dec 2025 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765967372; cv=fail; b=MHodr6Ln/N4xAJCQR0cMBZSSeLC7rXW6mWJ4EF0sOadoDIC/m8V3JPFqf2cqyVImrNhCTD+QqDSM/B0mIX3SBTPsw2iYNebhPFx0vmgRCkhZop8ciaPp6tQ2LSrTL5qs284/fCyx+qX9XTfH6q/eF4rfKMNxZnAmSnX9T6h7Rks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765967372; c=relaxed/simple;
	bh=4WeqagVMf/Eil/1yzYI03M8Zg/it4OslxhNNVmGvgIE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cxqDHBS6NnU4/7g41e2hDGKdxKgZBNUL5hKuZkuhvytig0MRdRRfBGPOEtwh8XQQkrqLegfGHY/IyKwHfZpgsZEEMqzdUJb7GVVhCZwtsorrxc/IGDxFi7XRZhFlWLNx0L+PjErB5qk7Gg/IMQzgkHmyYxcA0u7iEKLxzHhVduo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tsBGbBpK; arc=fail smtp.client-ip=52.101.56.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ex/xgfUuySOz480/UU6h2SFO6aJJAP12a/nMNUn7YLj3VwhUo64El8m0pBi1JhDHG+jQoC0ZE+HtAJ3UNPYmD+YavR0wvNlxcOl/kZXnWJiDB+rdnvV/uWYyMPIKvBpOVzOkgVN+e041Kq9vXq4Rw09CYdJk4g3fefjXSDT5xDuiUQHvApfBmiB/wk6ZSwcPp9JB51jG1ENO2TDiWtTvgFIuzf5LJaFIVdauslOIqzig/tTPMi/55FYpbu8OhmTzAnrnYQD7aFGJtq+MIgY0OG9YB6cyMVCoPpAK/42Z+0W6B/Bc//SVYXkz99rBprkzvHsc4AXGM5YdvlgirZeZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtCB7JNiIq39QD6lRSvY7VNc2qdS4x4ypSAsKGwSYxE=;
 b=l0nVNaOCbfvVMxWP8OxAUoLhV/IoaWloXaQu/1HEb4mE4gmVKenc25FaC5gjdy7O2U70G+BqaoCHC7r/IY8wgbxQpfQB6GZXwyZN4ISDWdnof+4wKQSKWnyVj9Pwmj1/i4eKc9FDPjMZFW6Z59HsAs/lJJwAk8iCcEk8sH3qMDaosEF1b62I9/S+mh4S531X1u+VvEZdfwPip6DOiWZo+MTEh6EHVOb2GHD3z7itU9B4iHvLti7YfRUTwf93DQJi2H6Z/4DXx4EKwVIP5Z/dIVHXXZ6jl7CHGOL5HHvnlzdkW3mf4SU/IWTSOoh7HDnXeDfcTohruDmh+FVlSZJN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtCB7JNiIq39QD6lRSvY7VNc2qdS4x4ypSAsKGwSYxE=;
 b=tsBGbBpKeMrlLXPZg6jYan2L6DbMoclMLWTDY8W4p72dbOkD3yxAt0Gmcwdff5cq/3ub/rJJUNhBiu1VQpSutjeGfz2cAWcj0HtOJtNfGlewu6iG8lPLYx5z7D06D5lC/xTycybskiYSK9TzHoK16b+dqQQ1WmX4p7CiZOmMnAw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by CH3PR12MB7666.namprd12.prod.outlook.com (2603:10b6:610:152::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 10:29:28 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 10:29:28 +0000
Message-ID: <3ceb88e2-48d4-46aa-826d-be372ee0acb5@amd.com>
Date: Wed, 17 Dec 2025 18:29:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Add AMD ISP4 driver
To: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com
References: <20251216091326.111977-1-Bin.Du@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20251216091326.111977-1-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KUZPR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:d10:2a::16) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|CH3PR12MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b06816-5b51-4de0-00af-08de3d57283c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmQvT3hrbG5LTEhVNGQ3RFEzZFA2VFVacHE2TFd1Sy9UQk8xRzNHdzJoSzZI?=
 =?utf-8?B?eWFBd2hlZ0VlWEUyb0NDcS9qODRVUkVlazllZGpGaVVmdXlXdGp6MnU4Z1dO?=
 =?utf-8?B?cVJPRWJRTFV1ekpPOFJnK28vTjJtQzVZOUJwRktMa2RRVTJTOXQva1RTR2N5?=
 =?utf-8?B?emZOdDRIZEZ3MDIwWG1DRTFacXZud25UM3lWT3dQa2E2YTEwUnlsQkx6dEJE?=
 =?utf-8?B?YytycWtCd3NQTWNqa2dWNHVuUGpjTGNjaUd0MmVQekFhZUR3YzI0YTU0YWZD?=
 =?utf-8?B?RS9sZkR2TjA2WVVGeXllYSs5eVU0bEpNalpBNTg3MDFpVXI3c1h4aVQyNFBS?=
 =?utf-8?B?LzNnbHUzRzNaVjBQbmZkaXhyTlB6Zi82alIxaXNpS1BKYy9LaUgrSkUxZ21n?=
 =?utf-8?B?VzhCdFdKSlRSWlo0WXNiaTM0Qk5ldTZqS2xjcFhxejZwNHhNRzBGTFExZER4?=
 =?utf-8?B?YlNtbzBDZHRGMHJqYTFVSTBlT25idDAydDA4M0w2amUrYlUxMm8reFpONVoz?=
 =?utf-8?B?Z0Ryc2NoMHlxNUF0Y2x1b1V3aUZweTFJTWZHdDk2cmtRbXhUTURENjVESmRq?=
 =?utf-8?B?UXhkVmt3MmlxcnY1T21pSU1YS1dqUURKbmhKYTBna0lWZ2NXamhlcjg2T0pW?=
 =?utf-8?B?dFJHMFZCYUZSK29NTUx2YXZUdnR1MXJ6eVBoQWR4NHVQSGxISW10d2xJd3Fy?=
 =?utf-8?B?VmQxc1dLZVAzTkprMHlSQzFrL01TNXdvaSt4MS8rWWprM3dIVFlaVjV3ckRp?=
 =?utf-8?B?dGU0WHZHVmtRWVc1WXY0cWdhQTM1d016Y1I3emw5RWVDdUlWZDUreE13T3li?=
 =?utf-8?B?bWtmalA5YmN4S3lmTXROMi9WQjdjMnVzRHVzSC9MOFBJSjE0dFJLdk8yYVRa?=
 =?utf-8?B?TFRkSlJRMVVNQXJnVVRKNlRVQnZUOUVkOTBYSk1LeDJkYzdUTHMvMzZEOGdw?=
 =?utf-8?B?d3pGa2t3Tm1HU3RvOTVoMlpXR1hPMk5FeFhVcncyYTNBTG1MM05aOVFKU0hp?=
 =?utf-8?B?Ym5HYk5WTEVGRktnSUM4U2QrdUJJc2hNOEFKMlY3TEdNNG5hY1UxK0czTXpW?=
 =?utf-8?B?eGJHcFRwMU5pcWs0aFljRks5OXRaOXR6RmMvcXVGSXJTc1VWZ2RheDRLenB4?=
 =?utf-8?B?RTJJWjkwZDNKVFQvbHk2WnBETDd6YVpiZHdwZG53NGJsWW5hZDdWc3JYdlcy?=
 =?utf-8?B?SUthOUszOEZXcCt0L0RjRlE2cDRNZUp1ZjFiZmp0U1g2SCtoTGc1V3ZvQ1pL?=
 =?utf-8?B?a3QvalFNTk9HVmoxbVBaOUR0WWswbVRKckRIY2RZcUtmS3VCMTNtSlRqR2VD?=
 =?utf-8?B?eHQ0Z0RsR2wraVdqWkt4QWkxNGM4aVB2bkQ5aG1MazJEcllpM2QxYVEwZVlL?=
 =?utf-8?B?ZFlxbHovWkI0bmllMk5ncjRVNS9LTkMvQWgzRDF5TVM1UG9ISWNxbzY0MDBw?=
 =?utf-8?B?SW0yKzZaVDFxVDJFODlNK0swUnBqbURsMksrWHUyZ0RDSU1ydlpwbG1IQXo0?=
 =?utf-8?B?cXFkRDlGbzlXbXpzOW1JbGF4Q0IvNlFyTExISDl6Q3hMb3Y3TkhEYzhQWWVr?=
 =?utf-8?B?cG1BUTIzMStZeE1RY1dtVWppMlcrSENiazRzRWpOaVNQQmZwam5tY0dRM1hB?=
 =?utf-8?B?UGc4MnpXMERSZ21YeDBrdXJ4Y2VSckQwYkZ1UDFwUVR0Yjd3RHlROVBYZ1By?=
 =?utf-8?B?S1VNUUVMT0VJOHd6TmFYQUR3c1hBM2FzSzJaNlpMaGxHdHh4NXRINXVwaitM?=
 =?utf-8?B?eGMzUnpQZlZlK29QNWpyREhzcW8xYUR4bGNlYVY4M3pqaDRVQjEzR25VVDRU?=
 =?utf-8?B?MDFKMVVnUXNNbWxNOG96MnVsNWdiMjI3aGFSZVljdENDeWl5OTYySEE2NVA1?=
 =?utf-8?B?c2owVFpDcDJNZjlOZVpMeXo3Ny9HazlUOXJuRHMyY2cydStwWlVETnBjSW1p?=
 =?utf-8?B?dDg4Z3YvS0pEbE9aTUJxVVRCSXVDM0hCaUZKMTlyTWIzc0FQQ3JJLzJIYVIx?=
 =?utf-8?B?WUV1YjZtUENnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aURHSHpWR0RTeGhWVFBRQjE4TG9OYmVlTW9qT2tWc2ZNeFNrRjFoUjhtZ0ps?=
 =?utf-8?B?bzBzbm5JYUk1ZGQ4MWZRdTVrRWFXZkd4U3M3bU9taEIvN0h2Q1FzcnRvUTlP?=
 =?utf-8?B?U3FvZTVaK1RxSkFGV1dSdmJFVm9wUnhzMnR0YlozdGs0UzFPT1BDVncyY3dq?=
 =?utf-8?B?NjBzOEdidDQ2ZVdtYVVTMUw1YWxLcjFJTmhicFI4UWcyclNSRlRHR0twa0V0?=
 =?utf-8?B?YnFSa2xaVzFLZk9uK2Vrb05JZk0rN2hNWGxGdjZQSlZoOFdIdGxVVVJMQWww?=
 =?utf-8?B?QTNVUVpWK3B0OGplTXBuM0g1VGFFOS9Ga2hiV3VPdVFBaVNsa0lWdlBYc1NT?=
 =?utf-8?B?eUdyajhURnczZ0VlVnoyeTU0Mk5zRS9Ob3grYVFkNFJ1bXNRY1doVld3Vmh6?=
 =?utf-8?B?dmE5SlZreGY0cWFTTDMrRHZkR1RFaDh2ZGYzYmxCUjhkSEU2NUliMStRQkdW?=
 =?utf-8?B?NUpSM3NGaURXTXpKL2FWWUtEanlaMklxdXJiYUZjbWJGMzdoNWpnMHNacG1C?=
 =?utf-8?B?cmpvL2RqU0NMWjZEaWN6bUNtYWNOV0lsNDlianFYWnBPek1IYnBGUTRDK3I1?=
 =?utf-8?B?N0JVRllmYm1pUzdHbGxDWDIrdFkvdklxY3ljUk5nb0w3UTU5dWZWSTJnTHJG?=
 =?utf-8?B?aWVWWGZacjRjTXpFSlBUSVFwVlZnVnhVWWdDRUtyNWk2WElGTCs4OHY1a0cv?=
 =?utf-8?B?NmxUaHQrcGdHTzF3dWVMUFpSSXZmWWRHbVRqYVlITmRjTllMMzZJNzZmZGtJ?=
 =?utf-8?B?WWlXNEl6LzAzVUkwWFNwWVp1QjdmejJiU0NMNEgwdjVpMmgwVFFBMnBXSjU4?=
 =?utf-8?B?U1dVNEtKOGROc0hPVGk4MnhCeVFDVFE1dGszOU1iMS9QM1Bxa0pBTkJ4MmZm?=
 =?utf-8?B?ZUJkaWg3OFhWaVZaMEpicU5yZ2RWTVlPb2x5Tk5tNEwwYStmc3ZkNWY2ZUlx?=
 =?utf-8?B?SnNTWitNaTltNXlMaG1oakIzNTZaM0hLekNtNEFac1BMOXZSMVdrT0xYb1I0?=
 =?utf-8?B?VWF2SlVDUUMrQkwrOGEyMWNyREtVWkttTzJXaVhqSlJLdUU3ZmI1b3VrTE54?=
 =?utf-8?B?K2xSUE5mQVJiejVvbVNxVUxqV0g4UE1nT2haTmhDR3hrM05ERzU4U1owUHhO?=
 =?utf-8?B?QmRTMnJjSVIwSlZ6SlNMaUdYVUhZdkd1Vml0SnJwTlNmQjdjZEVqRTMzOWNX?=
 =?utf-8?B?ckNvMk1sMlJsLzNLMWsyQmFMdVhzbEw4L292SnpnK3p6WUtFOHRyS0VrWHcz?=
 =?utf-8?B?MnJKd3NUa242K094cUJ6VGNNbkFHd2g1ODF4YzEveHBGRTByWitDUXc5ZG12?=
 =?utf-8?B?ZXZDRXRGeUFjRmtNenZ1aUtoZkVHYmd1enU5K2tOUXpLMVJFZEUrbWhaUVVP?=
 =?utf-8?B?ZGFuK2p6MlkxSFd0WnpKUjdnT0o5S0pHRnRvZXI3K1I2d3Zld21UZGJFYVZl?=
 =?utf-8?B?T3FaVVptSkNsaTRSZU5qaFBjRTUzRjZnWU9YckkwOUFQNGVUTUI5RW5XUWhj?=
 =?utf-8?B?MjMvQ3BBTnhlMGlYcGhURzVDOUhZU1RLU2dWSDg2a1N0L2gxT2xSMGd1emN3?=
 =?utf-8?B?QjQzRXBVelFvSzQ0MTFPaE51dWdwOExZUW05a2JsR25MWWpjaVhJSmxpeWww?=
 =?utf-8?B?WjVoRU9NZjF4L1BnUG5yY3ovelNJYmxFN1VZQ2ZPVDA5OVVzOWI0WWpEeTNV?=
 =?utf-8?B?eXcvN2dXT2hLZllqUVNXeWZBdnZLL1BPNW8xWVJKTWlRM1c1WDg2QU9LclNx?=
 =?utf-8?B?ajV5UGZLeFRPUjNJNkI1WDNYZjJob2pEbG5wbmJRam8yWW5FWXQxZklEbmRI?=
 =?utf-8?B?RENRUGFtZ2FrQWFENE5IUUgvWnljY3lDMlVoSW5kYmFTWXNuWDB4VmQ1cWp6?=
 =?utf-8?B?NVJQUUpNUy9qYWp6bE1Wemhac2FMR3VmOE5YVkpwL0RYZTJNNy9TQWVvVkdW?=
 =?utf-8?B?dUoyWllxeEhMemxwazhjMGxDR3dQeHBwckFtcG5iZk5nRmtHUTlnMy83dGdz?=
 =?utf-8?B?Vis2NlV1ZkFmbVFEY1ByYm81TmtXTy91eEVZZlpEYnlZYzcvMXdZWnp2VzRn?=
 =?utf-8?B?NzJEczBaZkxnVmNUbUJuSFJiYnhDaW5GZEdoZ3Q3R29ONVdIaFJaUm9ieGI2?=
 =?utf-8?Q?4Wn0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b06816-5b51-4de0-00af-08de3d57283c
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 10:29:28.2669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3W6GqDPcqikf7gcXB1J5H/5Ga7MFvQvexbOrmZq7SBtYFVLrIfYD1fDINEIy3j5z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7666

Hi Laurent and Sakari,

Apologies for the gentle reminder, especially during the holiday season. 
If you have a moment, could you please take a look at version 7? It’s 
been significantly optimized and improved, and I’d appreciate any feedback.

On 12/16/2025 5:13 PM, Bin Du wrote:
> Hello,
> 
> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
> (https://ubuntu.com/certified/202411-36043)
> This patch series introduces the initial driver support for the AMD ISP4.
> 

[snip]

>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
> 

-- 
Regards,
Bin


