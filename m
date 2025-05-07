Return-Path: <linux-media+bounces-32005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE27AAED09
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 22:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2AC15070B8
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 20:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE7628ECC3;
	Wed,  7 May 2025 20:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="A4XuNk6Y"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E525928EA66;
	Wed,  7 May 2025 20:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649560; cv=fail; b=kBvgC8jB81cH83nNBKOzkG/3GWmlv8VqbQ1HYJrz+VxtcGSq7RodZ7vlqY7iDfR/IkIw5mVWy4el/Jr3WWNkq8kb2suX/xmkfQQuoU1oL1+oXd3X046uQjQPYcXNZXiJXkvcB0VPT5guW5DAN19uZ+G1jfRv58ia8eB3SMmjwKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649560; c=relaxed/simple;
	bh=IfT6BFLDAiq2/ykfzqUAY0fTLW3hIkqZ0H1q3tK9M2Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ugpWvlQfgMq1XUTRNMhLzvjSz8P59PAMNCzc4zAythN1x7a+APvMuqJ+GMGIv3HZ4cpU5fMfR9wPZ3hRsl9+wdq+bb/PJsuRuz/e1o0hKXt/QPwHxuWUKVjdMHZ4EMsHFz4T2f+lGZLkI+SLm4llqT2CUZP3vK6CespgzsmKRzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=A4XuNk6Y; arc=fail smtp.client-ip=40.107.244.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hARcNttUZTfVq9H2AEGuhIx5Fg7pNScQq3xPTn40KEESDCUka182NkPmmHmeyg0wJ8HqBZsD057Dq+wpmRYqpxwVtjn5IHJ0DgxbIPOGSen1Kj/hsvB4NdmVbXlyE4st/WgSqGkGDPAJYCUHBLZtl3mSHHw7DLSxWCbwiCgWGybhkZlpnpDNmuQt3c2yS5TJp97gQxoG4oRJjfZ8sG251OGo9gDtCY4Tq19r+B+Dotaa2AV5dYSqJ2Y+lK5msPWBe7FNhwNVl6IFMR10tmqjM9bYeZi1PCejdfncMymvqLmVsLTmURiG7mplk4/byhI/6nDWmkgzndXPlB7Ze/hBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeb1LijyvBQd3cOJY5NRSYejNbG6xuCKhpyU22E92mU=;
 b=WR98a5Wn+AomdAza+YKt0DneNDvEnZlcSx+4nGgmZkf/GrlgRl+r+S/7zCRGU0GMobSjOV7C4wtIH+muh3ZVoUDP23yKhWpfp+w3mp1aZvQEpRCj3MA5MUPQyIp0f+46Wbk1wqWXBkXbx83PFO9sjl2JPzX/AsYh//drjo+QzoHRNbIHRy8lQ1y+YZHtjWrnMtAC12fM7vLjtA1WSbwJw4/zs+36CxFyUm+UaIqXImU/j5lzaErxblggEWJ0JnKvymWOk+QV3kM4ql47S32TcHXcojO5DTxXKmra8n+m8K/oA8lS5dre0wSipC7lfWkL4LzMjFfd9zIDAhE5D9Hc7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeb1LijyvBQd3cOJY5NRSYejNbG6xuCKhpyU22E92mU=;
 b=A4XuNk6Y0LCJYVEk6iZXOcoCWb0lQnV+qqmeBHi57KE7+IX6rhkyeIjWFauYr4nRQDcq+mKqywq0G3Oq7SN1BX8AkzGMWhxQCNtgDHKQlD0eJd6NY20SiplEMOF4lWBWVGYYpbzgQZFSahiGqMP3AIHpCCjddKMwPFr40FcYthA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 DS7PR12MB5742.namprd12.prod.outlook.com (2603:10b6:8:71::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.24; Wed, 7 May 2025 20:25:51 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8678.028; Wed, 7 May 2025
 20:25:51 +0000
Message-ID: <6fec0499-035b-4d96-a7c3-6f1733683918@amd.com>
Date: Wed, 7 May 2025 16:25:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, dave.stevenson@raspberrypi.com, krzk@kernel.org,
 dan.carpenter@linaro.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 grosikop@amd.com, king.li@amd.com, dantony@amd.com,
 Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <MhUYQD7uWnfZQAPq7VslFWPHOmx2B2UfAIpbMhLq1-7GC_i5bI2hhns_-ov_AAVpEH_VmDDFYkS5aOKBwnY61g==@protonmail.internalid>
 <20250328214706.1516566-1-pratap.nirujogi@amd.com>
 <fef11ce6-b3b6-4677-9387-13332b9a9d43@linaro.org>
 <6ba024ef-4757-4db0-b12a-d56622329bb0@amd.com>
 <20250402012052.GG4845@pendragon.ideasonboard.com>
 <aBm-FEdHqERKj9Am@kekkonen.localdomain>
 <edd2d2a0-dc5b-48ea-a4fb-a9816e18a613@redhat.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <edd2d2a0-dc5b-48ea-a4fb-a9816e18a613@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0219.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::16) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|DS7PR12MB5742:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c917918-f553-4fe2-1375-08dd8da55bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGhIVVB1ay9jSmFRTmFCUCtpczJDNk1IYWRkVHdPYmFhWlNoc2lnTkFjTkxq?=
 =?utf-8?B?VWFZZlhBNUxham0wWW55NFh2WFVsaFZJc3dBZE85V0VVRTBJeUo5L1JENm9V?=
 =?utf-8?B?OGw4ZlhTN0I2NlFQK2hpSGk4aW5QTzRSQVhDZE9CZnhEbDdCRjJyQlVHMUln?=
 =?utf-8?B?K3JEdW5heHVENDQraWtqWmMxS2c5WFZZa1lnQWF5YWc2ZldhVzlKWUpLMEpS?=
 =?utf-8?B?eUdERVN0ZGxkMTAvUFlyc3RHRGg4Rit4K0ZISlB6RzBwMkExVTFPZ2pheFZI?=
 =?utf-8?B?TVpNQjBmdS9EWDB4MkdXeUtUYVpWWjlOZmhVR2pMR2YzS1pWQ1YvRm1Mc1Zt?=
 =?utf-8?B?ck1ndS8xTlZYMlVrRWdCNG1NQzkwbW43d2Q1MEJDY3JLcm1PSzk0cDd5MTdp?=
 =?utf-8?B?NjBsODFoWEtnMXFBdTBGSjM3dGVSd2JqbmJMbFJTWk5zUmpsVmVobko3TmpI?=
 =?utf-8?B?Nmx6UzRPeXpNZFBaQ2UzVW9pRDJaMHkycnZMR29sdUlDdmx3bWpodjVKMkRM?=
 =?utf-8?B?ekUwenZlOEJXUFZ6amxxUEIzcW1JUHdMekhRUWpuRHY4WjJncWR0dStxTTZU?=
 =?utf-8?B?OTFZVTY1Y1BLUWxTeU56Q3ZFSEZJQ01Ca000L1NMWmhLV09EVWNadlM1cU1v?=
 =?utf-8?B?WGdHQlBDNWRSR0FoVXROWXlZMnVrZ2I2ZzV6d0d5S0pkRzhXc1REd1dSK01W?=
 =?utf-8?B?TTl5aFB0ZmdBdEJ2NUdwOWZZem93aG1BRGc2SUJySmc5UEZTa2VJVVVuUWgv?=
 =?utf-8?B?QkFORW1QcFV0NHU0K0FoWkhzMkhKZTZTTmUzdFpWSWowRVlqUnRYMFlyMnNw?=
 =?utf-8?B?K05QdGNDdCs2dzRWOHEzMldWWFpTTk5ONW1QdDZNZ2wydXRMa3pjNFJTOEhB?=
 =?utf-8?B?TjZGUkNLNDFJUGZDb0xFQi9IUFF4WTh1NzBhVkNQb0NFTXFGMnJGaWU5U3Bl?=
 =?utf-8?B?dUlodXFUV3lRclVUQkRNSzgrRGgzaklGN1N0dnZnbUl3c0U0TzBuQVZTdGdX?=
 =?utf-8?B?ZklITEpKUWdISlFRRnZXRG0rTW5UenVVTHlpQ1BNeHdHeW1YbVlGd2xLampL?=
 =?utf-8?B?SnRXRit6ZVRTcnNvTzg0eUNyR1QxS1NOeHFubTBxUjFONWJVa3IxaW5BNE44?=
 =?utf-8?B?UytKOGEwV2dlQXoybFJGbUJiL1BHVkJIb05JOGZNejBFQjJrSzVkcS9BMXpR?=
 =?utf-8?B?eTM2Q0xvdWlvc0gyTnlobmdFNjN6Mi9tLzZvMXA2QUVNNU1rQUMwSEVjeVd5?=
 =?utf-8?B?akkzd3dOeFZrZngyaWxzeTFhMUd0RWNkNW5IZUtNVVhMTUVQd1FIekVHS1hP?=
 =?utf-8?B?YVdabTdRL05vcEJiN2FBYmN5SDRsMWM1QzNYSmcwa29BdVd2cDR2bWtpMzdy?=
 =?utf-8?B?MXV5VEprWmlZV2RobEtNcE5KeFUyVGFLbGlUK1dhS2lRVExQM0JtbHJxN1NW?=
 =?utf-8?B?VUR6TlRlT2FEQ0dqRURySWNybWsxNXNyOFpOTzJOdndKcC9wa1R0QnNNdDZj?=
 =?utf-8?B?OEo4R0ZpRDR2bkkwRTFxMEZHRTlNUmdIRUZ2cmkxa0ZPRy83TkhKVnZickc4?=
 =?utf-8?B?TStobDZBdERXM0tjbkxqcXhIdmJhK2cvOVdEWGEvYVdoZERmWklhdkZ3dVZ5?=
 =?utf-8?B?dkp5QmtpM2ZzNytOeG12dkIwSHU5OUpPTzdGQ1FNNnVhUWN3ckt6M01BY1pj?=
 =?utf-8?B?L1ZJazVab1RXdDNqZ3JjeGZHQTNmbnZVZVNyT3kvbEFiY3lFWDBtZ1FDanJ3?=
 =?utf-8?B?ekNtOXdFZ0ZqQVF5UTdjREc1NlI5cWJSR0REOGlWa1NaUEx4MXRMUS9BM3FJ?=
 =?utf-8?B?VGRldDRwSnFRRUt3TTdkVmlvY2crdXNwc1BuZ2lZQ29xc0ZxQnBNOGdlSjJm?=
 =?utf-8?Q?HuezQG5O4GnhR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0tqQmFMZ2lydEZRMkxleFphU1RWK1o5OWNWWTA0YzVxb0YvSWkydm9ZNDVZ?=
 =?utf-8?B?ZGtNelBVSlFBUSt5Wk1hMWc0NWZoOE5ZV3NQQ1FHZVNrRW5Rc05UQWtKbi81?=
 =?utf-8?B?Qlg4ckVUanIyMGZ0WXhWK1dNeGxSQ2dHeXR3QXZibmpTS09Vc3EzWWl2Ulhh?=
 =?utf-8?B?MGZqYngvM3g0RUY3Y245YnIzY0JqbkxMVFd6QlJNcUZIamg1VG9uM0JjZnZL?=
 =?utf-8?B?NDEzOTZlTWJtR3czSTEwQWJxREd4STVqZmU0VWRCTkJ6YjRsSFpzVEZzU2Rz?=
 =?utf-8?B?T1l3dk9SMnRPZjh3SEFzSFhyeFRtUnAvU0V0K0VtRitRZG1BUms0RSs1VXNk?=
 =?utf-8?B?dEVJa2hnTEJqL3FOUlMzRUVmK0hxUjFDUkoxSllKTEZxVG1IYXIvemltZ2Y0?=
 =?utf-8?B?RndySHo5M0VEMFRQTERWK044ZEtZbFJlUE9DZU1YMHdrUGppT0FtV1ZzMGh6?=
 =?utf-8?B?dnBTaXZ2VDFPdlJmclZpRFBtUVFpTDFmckZQVWJzRFVLL01Id2wxVTUrRUpl?=
 =?utf-8?B?d1pReWhoVHRPUlVVeEhFWlZSL2htMVZNQmlXNGxFbGJVWHA2Qk00L2h4amkw?=
 =?utf-8?B?UkVKNDlQaERqRzRKS0xRMEpyR216dmhycitwQnFUQlgwR0RUNUgwMTdXQWtU?=
 =?utf-8?B?T0dUWXJVNE1rUzU3OXZScUNxOWM3OTlpZUpNcDNOVGtYbTI0UnhQeUJvVVVy?=
 =?utf-8?B?c1lXWWZRUWtTdytkOG11MExuR0hKejMwSGRkNk9oK05ubEUvSlpLejhOQzBT?=
 =?utf-8?B?VGhUSktXYmtVK2hRSDZKakc5eWZrMkJXeWJlMmdiZ1FZOUNVQy9hb0RkLzJY?=
 =?utf-8?B?Y2lQc1BsOWNXWjZkNytyb3RIRGVyS0M5Tk5wSVJjS2IxQTQ1VFNYTTh1ZVRj?=
 =?utf-8?B?QjFlSC9rckk0bVJONTJlTWJ1b2hTYmVVTzh4cU9tcWhFTzRoWS9lNUNkR2o4?=
 =?utf-8?B?YXBrNXhqU2dRL1c2bXZtekd6VTllc1dLWjBPRWJ5SXBkaDRMVmlEYmdRenBL?=
 =?utf-8?B?NkMxS2IrQXR1eS9xRysyai8rWEwrU3FyZnZsMEdqUTluTTZUSFhjS0lxbW8x?=
 =?utf-8?B?VWlTWVhueHEvUXVWdUxXbTFhUTBpTDRxMlJlNHh1ZmhzM1UwQmJIclBrUHJW?=
 =?utf-8?B?RHpDekFRWERVc1NxMGMyRmtDbjBsRng0aEJZQVlZeUtRVVZ1V1pMczlHbjJz?=
 =?utf-8?B?enRNTEk5eUl2ZnV3N095d25HRm95OUxTM2xDZCtlRnRpYWJlNm53cS8wbE4r?=
 =?utf-8?B?MnNTeHlPT3FnMlVxTXdjU0tqallsdi9teUNZYUZkcE85OW9GUEhNeHpScWM0?=
 =?utf-8?B?bW9RSjJYdnlVSUcyUkFqVmhPMlZMRHpSY0hLTFdROCt1TVk4RWYzcXRvWlFN?=
 =?utf-8?B?bmU3VVQ3czBPazZ0NndrNWZZRHFSOStpeThHa3diZXFBbHdkSU5pUlJyWEdF?=
 =?utf-8?B?ZWdsWXZwUnE5REplZHQ3OHZDNVNzQTJqdUZERG9NVUQ3d2ZZU1lobUI4dmJm?=
 =?utf-8?B?eng3UW5kT0NZeEpiYU9Pa2V5MThOdFFMcUNWbEkrSVBaTFNwRmhad2wvZzBP?=
 =?utf-8?B?VlFMSVZjeTlnNlNyZEs0bk5sTG5iMmlIeFFyN0gybmVRZmptNTdJMnRsMVJP?=
 =?utf-8?B?d3JQd3pIcE5zak1wRU5lbDRIdU9jenByOUJiVXdJeDlqOVN4QUs1eGhwZ1VS?=
 =?utf-8?B?blZCUUpqendZdTVtMEkvVHZzNXlPLzBXcmxVVkl3NTFBNm1idHZUcFJPSkps?=
 =?utf-8?B?c0QwZU5aOXRaYkZwZHRvZTQwSDJVT2VjcGRhZVdJdGkrQURwZGRzR0xZR3dG?=
 =?utf-8?B?cGx2RlYxNkJGRGxvQkZKVDdnbUxCWC9RTmZCTWh3bXNvV2JRVlNtc2dkRHdM?=
 =?utf-8?B?c1U5RmRvazVqeXErVUx6dnhpTHNLeEcvSnlzb1JIM0duaDNoYlhyM0xuU2No?=
 =?utf-8?B?Q0pXRWI5aS8reGFUalpwQ0E2UWJSU2pTSE5lN1BmZkJvRCtNNUZHbnlwTTJV?=
 =?utf-8?B?MHRaWjJnTVgxTVVqQlVYdmpISWdQc3MvVzVJaXVlQlhkNDBQTUVBVGV5UHJ2?=
 =?utf-8?B?VlZ6d3Zqbk9pQWVERVVJSStEWjFQK21MWFloNGNOM1JTNG80VndmUmRJaGlR?=
 =?utf-8?Q?J6u3v2KXPO+hX6EyapNCq4AF5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c917918-f553-4fe2-1375-08dd8da55bde
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 20:25:51.1299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwLeRkpuZrjXM7yv7mXaBfrsaE8YhTYfJpx25ta5QAWxv+kY7FXAr/aUiKcoVt3nidc7kJ3CE37uF5LllhNU5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5742



On 5/6/2025 7:29 AM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Sakari,
> 
> On 6-May-25 9:45 AM, Sakari Ailus wrote:
>> Hi Laurent,
>>
>> On Wed, Apr 02, 2025 at 04:20:52AM +0300, Laurent Pinchart wrote:
>>> On Mon, Mar 31, 2025 at 03:17:22PM -0400, Nirujogi, Pratap wrote:
>>>> On 3/28/2025 9:18 PM, Bryan O'Donoghue wrote:
>>>>> On 28/03/2025 21:42, Pratap Nirujogi wrote:
>>>>>> From: Bin Du <Bin.Du@amd.com>
>>>>>
>>>>>> +static const struct i2c_device_id ov05c10_id[] = {
>>>>>> +     {"ov05c10", 0 },
>>>>>> +     { }
>>>>>> +};
>>>>>
>>>>> There's an IPU6/IPU7 version of this driver.
>>>>>
>>>>> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/
>>>>> ov05c10.c
>>>>>
>>>>> Perhaps you could import the Intel ACPI name contained in there too.
>>>>>
>>>> sure, will add Intel ACPI names too in V3. To be specific, I'm going to
>>>> add the below table in addition to the existing "struct i2c_device_id
>>>> ov05c10_id[]" table:
>>>>
>>>> static const struct acpi_device_id ov05c10_acpi_ids[] = {
>>>>      { "OVTI05C1" },
>>>>      {}
>>>> };
>>>
>>> You could drop the i2c_device_id table if you added an OF device ID
>>> table, but you'll need DT bindings for that. Sakari, any best practice
>>> rule in this area ?
>>
>> I don't think there should be a need for an I²C ID in any case, having just
>> ACPI _HID is fine.
> 
> AMD laptops with MIPI cameras (where this sensor is used) do not
> properly describe the sensor as an ACPI I2C device in their
> ACPI tables. So instead this is going to rely on manual i2c-client
> instantiation by some pdx86 glue code, see:
> 
> https://lore.kernel.org/platform-driver-x86/20250505171302.4177445-1-pratap.nirujogi@amd.com/
> 
> To have a driver bind to such manually instantiated
> i2c-clients there must be an i2c_device_id table.
> 
> Regards,
> 
> Hans
> 
> 
Thanks Hans for clarifying.
> 
> 
> 
>>>>>> +
>>>>>> +MODULE_DEVICE_TABLE(i2c, ov05c10_id);
>>>>>> +
>>>>>> +static struct i2c_driver ov05c10_i2c_driver = {
>>>>>> +     .driver = {
>>>>>> +             .name = DRV_NAME,
>>>>>> +             .pm = pm_ptr(&ov05c10_pm_ops),
>>>>>> +     },
>>>>>> +     .id_table = ov05c10_id,
>>>>>> +     .probe = ov05c10_probe,
>>>>>> +     .remove = ov05c10_remove,
>>>>>> +};
>>>>>> +
>>>>>> +module_i2c_driver(ov05c10_i2c_driver);
>>>>>> +
>>>>>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>>>>>> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
>>>>>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>>>>>> +MODULE_DESCRIPTION("OmniVision OV05C1010 sensor driver");
>>>>>> +MODULE_LICENSE("GPL v2");
>>>>>
>>>>> Why v2 ? Checkpatch will complain about v2 and BTW the IPU6 driver above
>>>>> is GPL not GPL v2.
>>>>
>>>> sure, will replace "GPL v2" with "GPL" in V3.
>>>
>>
> 


