Return-Path: <linux-media+bounces-47664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B67C80FA8
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 15:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5C9C3344EE6
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 14:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7763B30F532;
	Mon, 24 Nov 2025 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sSwwiFvt"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012027.outbound.protection.outlook.com [40.93.195.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08789308F32;
	Mon, 24 Nov 2025 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994128; cv=fail; b=AFHgMLQtwV4VV5Ci0nKlb/yKyQt/IYq/nbPcPFhB/NclBqbHcKvzZuavCliYit99yt0nGuKpefFbpWTTKmTVeq6gSDILQmd06iI3051+4zvcqhxO6Ow04rIdNzx/O4VM1HY1YLnvCjITwpfZXfF0hVvIiMmZ4ufJ+eMi02mTOsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994128; c=relaxed/simple;
	bh=LWwEnJJazHTEiFCkG3akU4Ver3roxupQvPRlnkBe1gI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s0Kxy7D+qpye1t5F/nlb5P14L9q3GiJ9fP2F7RqXe0DkR96QWJdbRu4cmyQPT8CKHbvBmMjZd8XVCP9NxYM39a+kp6oHVlfqEic0w64PbDoPdiUXXG/6J45ovjvpTggjF5hGiDiviopTrVl3bGsN1irthK4iJcdW/TLg1Z+KiRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sSwwiFvt; arc=fail smtp.client-ip=40.93.195.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NoxfIAiA6xkKrSsdshJcAQ2vRDi/iqkhnkkGTEo7XLkEp6NzEw8Lj/yVA3i87ZtPKiN78mknfpxef/l1JzqaIswQVFGa/VETSvszAr0naRNviqaupTpke1w/mqpyLWFyeizacwBHWrH3LMPvlxPKsFPXnCdCbMMGrWIWiZXtlycYdG9TRPnyA21zsSuvOC3MSMuVyZnu6p5hY4Xuq86mGmYZd1QQx0T5SRgLMKmKH0ykwvg2R2yl27MsG2Lmp2Zawgvql/aSzvLoqILrU2OuSYAw2fu0VgWwEzd77Ez3uEwQT+VnIJs5phXcm2UcS7p2H1+pA+qTELo0aXEbGxZ5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5aJ5IS+9XYMptGnPWEq1XA5vrzTvqPZaRFFsNXkJUo=;
 b=cPxweY5DNSI72jfZBC+lw+Y0j3cqelCAxK+lyjRy87a5apzHgBA3i7A78RZ4wEuNd30dOb8IcoKAokUibXwXviUJzBh2Y0EMZgzPC+IeUbdYEChSR0KQ8FWSM1mHVpia56STJyfN10ahxcEqwsW3LK8OViE9fby7zCfqIGGtmVxFrrYwfAPruIz9RjyYOj4KPyKaOHyjzWOxUCNFDUT+TUbf6q2U3le9lzcDYfh7PEEa83+0HeQ1Q3e6ffRV1SSfQF93zkupsNVX8pe5cb2eyb1gSMceMVDF4KLCudnCYk7POklBy5i/XegncHkec31xo2m22nw3pgcFF+lXXBxbhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5aJ5IS+9XYMptGnPWEq1XA5vrzTvqPZaRFFsNXkJUo=;
 b=sSwwiFvtzApXXIP2c2BN4pXfv8i6ho8B86QD0PiUMrP3U+OkOOEObNNsYnjewCtZVenVQvfjMEqh+XO2XZgtsvFFWiUu/Ju7ArAFXKA2tT770N2znzqaA2xTuuP254eMHhzFy6lYkBeB0Zt4JsbpJ2By2aZ6XYu+urFDg3atNJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6077.namprd12.prod.outlook.com (2603:10b6:208:3cb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 14:22:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 14:22:02 +0000
Message-ID: <3a1271f3-4c56-499b-b674-32299ddc72b2@amd.com>
Date: Mon, 24 Nov 2025 15:21:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: add some tracepoints to debug.
To: Xiang Gao <gxxa03070307@gmail.com>, sumit.semwal@linaro.org,
 rostedt@goodmis.org, mhiramat@kernel.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 mathieu.desnoyers@efficios.com, dhowells@redhat.com, kuba@kernel.org,
 brauner@kernel.org, akpm@linux-foundation.org,
 linux-trace-kernel@vger.kernel.org, gaoxiang17 <gaoxiang17@xiaomi.com>
References: <20251124133648.72668-1-gxxa03070307@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251124133648.72668-1-gxxa03070307@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:408:f5::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 57089a57-364b-4ce5-bf5d-08de2b64d645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkxOdmhpZjdXRzcyZ2k4KzdROWc2T0IxRXE3VE9IeXFhNnpYMGYwZHhGVHhE?=
 =?utf-8?B?KzY0ZVZBVWd3dkVhNVdTYlMzcXFUTjJ0S09QeDBXSndmcFFCQXRXUDdVbS81?=
 =?utf-8?B?amJKM21RandBY0V1UDBUK0hkZW53RC8ycU8yTVAzemovTmhnU09xTWF3YUFJ?=
 =?utf-8?B?aktDakp0b3lTYnFuN3hIVCtLQU1BYytCTlE5K2FmQkJXOWhEQ05XR1hPRnF5?=
 =?utf-8?B?WVB6U3NMV3RSdkxhcWdUQmtrdTNEY3JMOGJkb3pwVEZiWDFHL3hpWEd5S0t1?=
 =?utf-8?B?T2RaL1B2aEdDS3ZQblE3b2xja1ExRG5uM01uNlhQRVhRcFBEczBlRmJpRTlO?=
 =?utf-8?B?UURUajkxYnhuZWRHNmVaRUgvNGxWTDF4aitzNmpoVVRVZGNkZ2pGRmt3Zkt0?=
 =?utf-8?B?MnJZbGpQenJmQUNTNkY4K0ZJRzgvQlpQcWVWaVBKY25IRFhjSnlYdE5BNmd4?=
 =?utf-8?B?WWVhRXpGK0FVa0tQSlVaK0tqNVZSYW9jb2JFNkVhOVg4eFUxQTEzc2dsWXQy?=
 =?utf-8?B?aUJRbWw0dWh2RDBQL1EzOEdBdmljMzk0ekduNTByb1I4OXJFckFDVUxGd3A3?=
 =?utf-8?B?UmV6Ymhocmh3eDE1cWRsVHZ3M09vSUwvMnhJa1E2VURFSHBkVDFldG1xeWg0?=
 =?utf-8?B?WXYxSXdxUHpuSXZ3YmpxcFFlWmtqcTc5MmFXeEt6b1p6dFQ0WVpicVVLVnZu?=
 =?utf-8?B?Y0s5RmtnUktoUURtK0NhRE9saTVRVnJZdjd3ZlJNeWlwVW9CcTRqWTB3MGR6?=
 =?utf-8?B?bGtETFdFVDNDSkJ6clh2ZWlhM3owWmtxbmt1dmkxdnQ0d2VOb0tmTnBPMTl1?=
 =?utf-8?B?SllCdHUyL0liOU1jaVpQVU5HQWZCOUJNTU5RS0RONTFRSUphNFpWQkN1Vjg4?=
 =?utf-8?B?VnhjN21KUW1jSnRQc1BtUHMyZ3JvREpGNVFCdmxoT3c1VkhxaVc0S0tmcE9u?=
 =?utf-8?B?dFZtM2tGNkJPQWMrVmI4T0RZa0tqN3hjSjhrV3gxOTNYMU1EMkt6ek1tZGk2?=
 =?utf-8?B?aFJxWC9mSEZLa2VhaXQ1aytwbzB2cHI4WiswV0ZWajNKZ1ZkUmpLNVd1Y1BF?=
 =?utf-8?B?bDJpWWRCdlU4YXkreWhSSjVwUU4xaUxIWi9oVnpjTG9wZyt5ZXZaUmJVVVhM?=
 =?utf-8?B?LzFQa3ZzMEh1ZENpd1NiT3o0M2ZjdFBqQzlNcEtzMmN0d3ptUDB5VCtzR093?=
 =?utf-8?B?eWpHTDk2Q2lGZnFqU2xOdWNuQkFzeWhjYXRQUHhWVGFZZGlnblVPa1dCcHVQ?=
 =?utf-8?B?TW5ZK2M5TjZ2b1podExOdkprbTlHdkNUOXVMcXR4NHc1TGVjUmF2NDJ0eHZa?=
 =?utf-8?B?a3hpMGI3VTVSOUg4ZzlldVR5RG5mMFZ5dEZWNTAwQ2pOSWRJWjdUb2ZnYzFt?=
 =?utf-8?B?ZkJJbE02aWs1YjFYZFpscnlzcmFqdVVPUEFtbkcxUHl5eEN5bTBxMkVzb09Q?=
 =?utf-8?B?TUFZajZPbm9Nb1lIZ2JIU0NaRzJwbjdJak54cGQ2bW5ESi9EWmt0SjhIRHJv?=
 =?utf-8?B?OGp3R0w5dktoS1g5eVNQaVFha01kaXVNR3NtMWRhNThmbHpmNEMwL0NSQU1l?=
 =?utf-8?B?ZnRKd2R0VG9aQkROZjFGblFHR0tnTzg3b1lJc25xWFhELythdGJBYXBoNEpu?=
 =?utf-8?B?cDBMdjZtUmhyOVdxNkxvS0xsaGdxbG84UTZLWkQzeklLMXRTTjg0dFg3bW1s?=
 =?utf-8?B?Nkh0M2pZKzZkM3hlbis1V2c5R2xDSFh0OWl3M2R1N2xaZ2NZckNZQUw2cTJ2?=
 =?utf-8?B?SEFnZnhFeUFucUR6bmhOYnZQVnJCbDloL0l6emdmS2JsN2RYYWhJNEg5a1Vk?=
 =?utf-8?B?dkI4TVd5YUZ5c2dxRE1tSldHWm1FWktOMHVqR0ZwRTVrb2VWVDl6NjhkOHRC?=
 =?utf-8?B?MkhxSkNDZDhDdGNQbHB3MVUvN2ZuclpxVTdJbWtveHEwV1F6eGhBQStSRHJU?=
 =?utf-8?Q?n1OOdGcwRNZspaafqBVcNdid8gBS/G/N?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alRKZ25RSmxqelBrZXhtZk11c0NTUTE5WUlMRmxndi9NOHI0dC9vZ0RWR2dJ?=
 =?utf-8?B?VllBSFU1WEVqa2Vlc3JWLzlic0c2NUpTSkxPK2kydWJIQlY4N1p1dnFWVncy?=
 =?utf-8?B?VjVxa1hTYmllY1RhbWxyRjBoeWk3R2pUMzd5ZjhyTkZQTmlORXJTamlNUExi?=
 =?utf-8?B?Tk5oRlZFTUZsWklKRkhOcE0wbFdnQ1ZiKy95Nmhxd2FXUG9PZWtUVkdiVlBx?=
 =?utf-8?B?NmZsOWhRRHhTOU05UlNGVFJOTlBBWVo3UzN2bDRlQTZSS1poY1BKMXczdTRy?=
 =?utf-8?B?MGxadlU0MFFkN3pLQ0pyRnFDZGUwVnJjQ3JrZ2gvVUp6Q0ZKam0vb09vV25y?=
 =?utf-8?B?Z2NvYmVKODd2bVkwR2VKa1NkWDBmSjgrZDZ5ZXlTdzRid0llMkRRNDJ3RjAr?=
 =?utf-8?B?NTB2cGFac0h4eGdjOEhNVllxN1g5Wks0K0J6bHNHVEl2MGNRVWxOOS9kQ25r?=
 =?utf-8?B?aW5kM1JFTGVoUS9WcHJvWEloK2ZQWEMrZWdJd2R3OFZ2YVdpQkdYUE1HN3lS?=
 =?utf-8?B?ekYxZDNjV3J4OHFTN1J4S1l0QkNHSURkTGdrb3IyMG9qaEtJblZoRkdlR1dW?=
 =?utf-8?B?S0h2aXB1Nzg3MGo4UmozRHQzUS9tcVdRbG4wcHh1bEVnc1pBZ2RlUlMyb0lH?=
 =?utf-8?B?V1FBbkhJcXJTOU9iWUtwYS9teGNSVEVYRzdMdXI1MVpqejI3aHVjTWZRSG1N?=
 =?utf-8?B?ekRhMEJLNUZNWEtNVGw1Y0ZBYXVIL1B5T2toMmx2VlJPYlNYc3VObGJJb0F2?=
 =?utf-8?B?QjErc1QrYnVDU2tIWVppZmNjanFCZ1J6WWpLamNMU0ZYdDRaVzNSdnFIWVNJ?=
 =?utf-8?B?TTQxaGh0YTErKzhhS0tnN1lYZEUxL0szTjRuaTA3RmxRSEZTUHF3MFpGcTV5?=
 =?utf-8?B?bkpJWks1UHMxT25ZRTJmaTM2eU9nNnB2U0J6alZDeUdKNU5pUHRmRnF6VktX?=
 =?utf-8?B?RFpibzhOd2ZJc3BtV0kyL085cXZma2QyVWtZYmNlTThTeTZOM01adkdIRHZk?=
 =?utf-8?B?QTZaSUkrb1h0WHpVUGlOWDlVdlVBZmZRN1M0a0NiTHE1RU1NRjVlZkVuU1hI?=
 =?utf-8?B?T1NIdGFTelhQV1lSMUdJaVV5YjUxNXpzK0R2UE0yWUdaN0FHOE42d3VkMTZr?=
 =?utf-8?B?aWk5VkpaZDZQQ1J1NkVOc0xjeUdoZEtva0xMazZCVzBpT1hMNE0wcURoZHJm?=
 =?utf-8?B?dXVhOWRLWkU0MVVzQmJmYW5UTGJ0azZYenErSWRqa2gzRnRYcytnTlVLQ2hi?=
 =?utf-8?B?bzBTWFRrZ1k5OUMrUjJ3dlpGUmVSd2doM2txc3pIbnBRL05DN0JXcjRPYXlY?=
 =?utf-8?B?RjZZZTc3ZzF4dERDV3NReDBVQ2lTTGZubUJoTFVNclRjbWdXZkdxOHhpdytj?=
 =?utf-8?B?SlI3d0R1Y0I0ZnFPWnozaVlHcnByMVlYTlhIeWJycVpnVklHM0VrSGUvbklo?=
 =?utf-8?B?Zm8rUjNPNk5CZ29QNi92d3BHQVhRVW0xUGtlVVQwKzRrZ0U5UVZiT20wbThR?=
 =?utf-8?B?UE1MK1ZHNHB2dlQ5SkNFNHIwYzkzQjlIMTdJeXpBMmNGL3hxZ2JPWDVMTDBs?=
 =?utf-8?B?eFVKYmF1U0V4U1lBRy9hdlNZSGkxQmIxQ2dMaXpiWUZ5NXc4a1JySEtLRk9M?=
 =?utf-8?B?NW5aNDRBdXVod3R1V2JFNGwzVk5ydUFIN0hQQ1BRV2JCWWw5MXhqZUIvU3M5?=
 =?utf-8?B?MVNDZkJyZmZIalRpT1FVZiswcHlTb0hFV0hxTUNkR3Jjd1hETERXRW5WSGFT?=
 =?utf-8?B?SUJrMDZpTkNVV0tDUEY0TGVEZTc0TjJjOFprYitWUlhXT0dHWUNJVG9oRWYx?=
 =?utf-8?B?OHMreWFmZGRjcEtJUXJqS0hBMy9ING9abzE0ZHBTNHJRRjdMOGl6N0hxNEJQ?=
 =?utf-8?B?TWJIbmRKZmdWTXdHcE9LNEEvUlZGaW9ZQlJqLzJIV2xCOE1YRE5pRkhaK3o2?=
 =?utf-8?B?dHhzS0RneEtvVE1xaVB0TCtoTzFBRWlqeGtJbkJGMDc3RWhNbUk1WEkwc2lH?=
 =?utf-8?B?cHNYcHVkZDc0R0hoS1I0TDBRSlNRdUFKamhOY0pUM1l1aEJENjJjMFFBY3FC?=
 =?utf-8?B?bzV6azloWnpmUVJ4dVZZdU9UQ2MwU1lOYXMvNm15ZTl4c2NWVVRUemViU010?=
 =?utf-8?Q?e8AGwosWUnabuOC01rix8bt1e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57089a57-364b-4ce5-bf5d-08de2b64d645
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 14:22:02.6511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3y6mhYTYARPcO9Hb8X4g+bYv6Y0E2GG/30Pdo0L5uzpUTNxBiLvhifKzQ3NewFQu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6077

On 11/24/25 14:36, Xiang Gao wrote:
> From: gaoxiang17 <gaoxiang17@xiaomi.com>
> 
> With these tracepoints, we can track dmabuf in real time.
> 
> For example:
>    binder:3025_3-10524   [000] .....   553.310313: dma_buf_export: exp_name=qcom,system name=(null) size=12771328 ino=2799
>    binder:3025_3-10524   [000] .....   553.310318: dma_buf_fd: exp_name=qcom,system name=(null) size=12771328 ino=2799 fd=8
>     RenderThread-9307    [000] .....   553.310869: dma_buf_get: exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799 fd=673 f_ref=4
>     RenderThread-9307    [000] .....   553.310871: dma_buf_attach: dev_name=kgsl-3d0 exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799
>     RenderThread-9307    [000] .....   553.310946: dma_buf_mmap_internal: exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799
>     RenderThread-9307    [004] .....   553.315084: dma_buf_detach: exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799
>     RenderThread-9307    [004] .....   553.315084: dma_buf_put: exp_name=qcom,system name=blastBufferQueue for scaleUpDow size=12771328 ino=2799 f_ref=5

In general quite nice to have, but this needs a bit more explanation why you need it.

> 
> Signed-off-by: gaoxiang17 <gaoxiang17@xiaomi.com>

I have strongly doubts that this is your legal name :)

Please google the requirements for a Signed-off-by line.

> ---
>  drivers/dma-buf/dma-buf.c      |  19 +++
>  include/trace/events/dma_buf.h | 245 +++++++++++++++++++++++++++++++++
>  2 files changed, 264 insertions(+)
>  create mode 100644 include/trace/events/dma_buf.h
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 2bcf9ceca997..8b5af73f0218 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -35,6 +35,9 @@
>  
>  #include "dma-buf-sysfs-stats.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/dma_buf.h>
> +
>  static inline int is_dma_buf_file(struct file *);
>  
>  static DEFINE_MUTEX(dmabuf_list_mutex);
> @@ -220,6 +223,8 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>  	    dmabuf->size >> PAGE_SHIFT)
>  		return -EINVAL;
>  
> +	trace_dma_buf_mmap_internal(dmabuf);
> +
>  	return dmabuf->ops->mmap(dmabuf, vma);
>  }
>  
> @@ -745,6 +750,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  
>  	__dma_buf_list_add(dmabuf);
>  
> +	trace_dma_buf_export(dmabuf);
> +
>  	return dmabuf;
>  
>  err_dmabuf:
> @@ -779,6 +786,8 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
>  
>  	fd_install(fd, dmabuf->file);
>  
> +	trace_dma_buf_fd(dmabuf, fd);
> +
>  	return fd;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
> @@ -805,6 +814,8 @@ struct dma_buf *dma_buf_get(int fd)
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> +	trace_dma_buf_get(fd, file);
> +
>  	return file->private_data;
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
> @@ -825,6 +836,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
>  		return;
>  
>  	fput(dmabuf->file);
> +
> +	trace_dma_buf_put(dmabuf);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
>  
> @@ -998,6 +1011,8 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
>  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
>  					  struct device *dev)
>  {
> +	trace_dma_buf_attach(dmabuf, dev);
> +
>  	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
> @@ -1024,6 +1039,8 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>  		dmabuf->ops->detach(dmabuf, attach);
>  
>  	kfree(attach);
> +
> +	trace_dma_buf_detach(dmabuf);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
>  
> @@ -1488,6 +1505,8 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>  	vma_set_file(vma, dmabuf->file);
>  	vma->vm_pgoff = pgoff;
>  
> +	trace_dma_buf_mmap(dmabuf);
> +
>  	return dmabuf->ops->mmap(dmabuf, vma);
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
> diff --git a/include/trace/events/dma_buf.h b/include/trace/events/dma_buf.h
> new file mode 100644
> index 000000000000..796ae444f6ae
> --- /dev/null
> +++ b/include/trace/events/dma_buf.h
> @@ -0,0 +1,245 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM dma_buf
> +
> +#if !defined(_TRACE_DMA_BUF_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_DMA_BUF_H
> +
> +#include <linux/dma-buf.h>
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(dma_buf_export,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)

dmabuf->name can't be accessed without holding the appropriate lock, same of all other cases.

Regards,
Christian.

> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__assign_str(name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino)
> +);
> +
> +TRACE_EVENT(dma_buf_fd,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, int fd),
> +
> +	TP_ARGS(dmabuf, fd),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(int, fd)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__assign_str(name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->fd = fd;
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu fd=%d",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->fd)
> +);
> +
> +TRACE_EVENT(dma_buf_mmap_internal,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__assign_str(name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino)
> +);
> +
> +TRACE_EVENT(dma_buf_mmap,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__assign_str(name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino)
> +);
> +
> +TRACE_EVENT(dma_buf_attach,
> +
> +	TP_PROTO(struct dma_buf *dmabuf, struct device *dev),
> +
> +	TP_ARGS(dmabuf, dev),
> +
> +	TP_STRUCT__entry(
> +		__string(dname, dev_name(dev))
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(dname);
> +		__assign_str(exp_name);
> +		__assign_str(name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +	),
> +
> +	TP_printk("dev_name=%s exp_name=%s name=%s size=%zu ino=%lu",
> +		  __get_str(dname),
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino)
> +);
> +
> +TRACE_EVENT(dma_buf_detach,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__assign_str(name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino)
> +);
> +
> +TRACE_EVENT(dma_buf_get,
> +
> +	TP_PROTO(int fd, struct file *file),
> +
> +	TP_ARGS(fd, file),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, ((struct dma_buf *)file->private_data)->exp_name)
> +		__string(name, ((struct dma_buf *)file->private_data)->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(int, fd)
> +		__field(long, f_ref)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__assign_str(name);
> +		__entry->size = ((struct dma_buf *)file->private_data)->size;
> +		__entry->ino = ((struct dma_buf *)file->private_data)->file->f_inode->i_ino;
> +		__entry->fd = fd;
> +		__entry->f_ref = file_ref_get(&file->f_ref);
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu fd=%d f_ref=%ld",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->fd,
> +		  __entry->f_ref)
> +);
> +
> +TRACE_EVENT(dma_buf_put,
> +
> +	TP_PROTO(struct dma_buf *dmabuf),
> +
> +	TP_ARGS(dmabuf),
> +
> +	TP_STRUCT__entry(
> +		__string(exp_name, dmabuf->exp_name)
> +		__string(name, dmabuf->name)
> +		__field(size_t, size)
> +		__field(ino_t, ino)
> +		__field(long, f_ref)
> +	),
> +
> +	TP_fast_assign(
> +		__assign_str(exp_name);
> +		__assign_str(name);
> +		__entry->size = dmabuf->size;
> +		__entry->ino = dmabuf->file->f_inode->i_ino;
> +		__entry->f_ref = file_ref_get(&dmabuf->file->f_ref);
> +	),
> +
> +	TP_printk("exp_name=%s name=%s size=%zu ino=%lu f_ref=%ld",
> +		  __get_str(exp_name),
> +		  __get_str(name),
> +		  __entry->size,
> +		  __entry->ino,
> +		  __entry->f_ref)
> +);
> +
> +#endif /* _TRACE_DMA_BUF_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>


