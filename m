Return-Path: <linux-media+bounces-62220-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A2WDg9sDWrgxAUAu9opvQ
	(envelope-from <linux-media+bounces-62220-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:08:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 219685896B2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7BDDC3004F29
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847403A5423;
	Wed, 20 May 2026 08:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s49wCWXn"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010034.outbound.protection.outlook.com [40.93.198.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656DD33DED1;
	Wed, 20 May 2026 08:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264523; cv=fail; b=Nlv+w5WUiqlE5aEvecHpBmtZ5Z9CTVE1Ndju8l72ZrNigbohqn/3WmBo01cWfxw+ncGUbJ+xzdupxbDAkO35xmkdTSdHtvPHWzy/FMMKCdNxshMLZtXS3UXZk2TEbcdZE6z5rUE6zaxkXlG6L0VX5vp+8jIJR0Kp0HiQi+t97xY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264523; c=relaxed/simple;
	bh=w1lToDQgxD87gXOPK2+TQ4ofhmvdynIq149t1JwRh2A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XkJC6bc/07YZdPSbdaj+v5JWtekk3V2yusZ80iEG8mikFTxMqz9kl4adzmP1zL+j4NbGOg+bRvnZsLU9vlRfc1VForJXcBUqF5rjeO3T4FawtHFlxxX+WFSVPS4xZe6cgdZoedP74NybrCf8nVjdWDWyvRVr9/5qe026Rglg5mY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s49wCWXn; arc=fail smtp.client-ip=40.93.198.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkF5v82AwC2ZI+4LSSdjfQ6bVYzy5npAqa44zu9OB2sauwTHf36sE2qEoixqSoc52AvKIUYP19Rixo7xU/lUaxNaJm8Amvvi+tzGiq2/a7qR+xCwJj/x30Gai3Sswp/h+EHdop3QU3bNtLZ28XPh/TRoMkllgRN0prPkWthb/dLQm/IUbtDXgqwdcsbjVG7FftUjNemTTfj8VxM1/1Dt8DIZyCQMH6meraOjg0XTiWpK6Q5vvy9+H8At/5JDhFcI6ADV0QaIr5FB4ddc/6F/AWQhrmh9q1/E+j2BaGdDtEt1iDggUkN7lbaGcZKO7Zx0IQM49fEGWr9GJfW3OiLbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hBKWRv5jWQdOJicL3isVkToHsvYSbC9+TaQJw5Fow8=;
 b=d9+AlxA2Fmp75ReGFNlf5TF2lEJsiIRZyflguIWdnTfgdHqgAcUktguEKfQhThxt3sJKGXPxu/NcUapA1RtnJBarLbSWw6YHa62fVfhAizCqhHKngDrAY/jTTen013WWlcY1YBT4r+7lVWA6Wkyeq+6kCr9BsGbp4Z8Q7ksBEC9FLgFDraTng6VvRSl/rfLTlnw+HtMUYV/tcrmoT5NZvol+eSx9Ms4jzQHc2EodDtzOCiq2ItFHm+lLRSt5007OLpR91Hd8c4HgyupfGTmxibTr7DjoA9psl8Fk1jTfCuT6vypKq7PkEl2afWbsnovNYI7n8lreG/IrRQEJzEbthA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hBKWRv5jWQdOJicL3isVkToHsvYSbC9+TaQJw5Fow8=;
 b=s49wCWXnOF2uFF5iSN4VnN4Y51oJjbVav7AH6/PUYhtjXb618Nh5P/oFc0aOBjhRwZqseRszyTrJu/StVz0vIH8uuWpGg+DBT31SbFOx53xltR/M5jlqMdFRpM9IoL8srIWtYvxxI8jB5rdRKdRLpPOK8NxDhuF9PfLcNpb7d9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7250.namprd12.prod.outlook.com (2603:10b6:806:2aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 08:08:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Wed, 20 May 2026
 08:08:35 +0000
Message-ID: <53edf0b5-e733-4b96-87d7-3307275500c0@amd.com>
Date: Wed, 20 May 2026 10:08:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: Julian Orth <ju.orth@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
 <c6c91de9-a34b-4b50-a3c1-d42bf7631f8e@amd.com>
 <CAHijbEUzWZC4GAMU6YGV42gOYkrQaMZZPiwS4Erb4H1J-fh_8Q@mail.gmail.com>
 <69dcbcc1-da58-4d34-bfb0-5c8d33b75d59@amd.com>
 <CAHijbEWqc2+kSkk3i_LxB2PQ6XwUetw1UkdUdXJfdv3zgKd1kA@mail.gmail.com>
 <38551bfe-75e1-4978-b57d-adc43cebc85e@amd.com>
 <CAHijbEWHp960qvZFoK7+9ppHAqkAR7=UQhtMUccqWzGd_pFPQA@mail.gmail.com>
 <5ee6d5af-ac48-41d7-a19f-e08a3c5b7d19@amd.com>
 <CAFZQkGwmeipZnvmBkcE7KhvUSMkSE=fzLBZtiMyhv3mM04Vudg@mail.gmail.com>
 <dff60378-4e47-4753-8878-feec6e1c2690@amd.com>
 <CAFZQkGz=UJqaJ_eTwKBy1pAg5xL+PLibh7W1vYf7JD7Jrx-LZQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAFZQkGz=UJqaJ_eTwKBy1pAg5xL+PLibh7W1vYf7JD7Jrx-LZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: a483ca7e-240c-48a3-96f7-08deb646fdad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|22082099003|18002099003|56012099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	jlM1i0cTZqoehDVivXSEqJLoRlGUL6vTk03BFIGFSA8QwAK7HrT3eyytastgRgCsJy7CxaVQCubFAOTvBynvfUllzu4fBRdhwOCWrIq3okEsCA6E40u6SnQ1nzAys/36xDrEME2iSgpZeEXZYwQYGYWWwEsamLpTCLenKXreU0JVTj3qp1vCxAKOFRlEhXgId0b6pGiw7wDBb9pHCAV0kmyYE+6UrUuzt1wHXu6x8m1R1VdnP/V6lad07KswLslhmXRebzdxrbglG8Y3FbOLNdPg8vKpooe9d0KeDy2X9ickPo3zE6Jjwc/0YhaOcaErHkKhejkfYfLEYkvpKUqdgSkLyhCRXHG0vJP4jWOlsLx4jibr0LyfLhn93A/hAkuEP2JINjFmU330Wv4bNqbjhRXs9ytulnayzXmcNwaYW4ekY5QZJ9Tvs+7srz3bLNbNnSxtHYxe9ccKq0WVZJtfgExjgtjOI1sLsFPxGzfAtqSHso8lFDDPkTG3Ksg1kbpVtSqbWgfFZsglk9l3zr/5MXzknLGtK1PsfEYmUF7z43WT7n0/ZIm6jWho1f2YyyJpSp1RLn7UJqS/b0XlrdYQ/4+DQC/mcmFd4I4mcmDoLF+IqqmUAJ1eycAMKukmau4/SEhmnA5Iyd8KEXS9q47kLtYNWrh+CnDSlqjTHagzjSd/5wYiKXDe0YNW/jpjPFNd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(22082099003)(18002099003)(56012099003)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzFTQVMxZjBLQ25yeGw0MEpHeE05c2t4UGc4Tk9qaEEyTFB3ZUNuUU53c3FX?=
 =?utf-8?B?ZGJ1TmVzOGF1Rkl3RVRVc0VFR1NnYWpzWWt3dEdzeFNBcHFOY1UrWFlsaFpy?=
 =?utf-8?B?WkFrV0tKNERETUtXb1RhZzVQaSttaWZaUlA1bWpDY0t3VnRtZW5ha3FqbVBB?=
 =?utf-8?B?REwwU1VkWDI1RmpqS1VicUZnb3pyUUxPYXgrNGFma2dzeTFtMW5jT3NCdkRZ?=
 =?utf-8?B?OEp0djAxMkNHMmFPT093ZkNkNjFFdVpWUlZqSStScDNVRy8vTFVBdEllaUlS?=
 =?utf-8?B?MlBzYkF5dDhkZlo1R0UxWFhqR3puRDNRcXBBNzgwZmhGR3EvZ2ZYcXo1Nlhr?=
 =?utf-8?B?b2pSb0F3YXNIMlNLWHJlV0FrYlk3TmxDSXFEMkp5RWdNYzgzbWplTlZoM1FG?=
 =?utf-8?B?aHI4SHd2eUlhN3cvNk05bFloeVlraUg4YmlFcTJlRmdwQWlsSk9YZ1J1Tmh2?=
 =?utf-8?B?UTVJa21rellPUlVoQTZyRlJBQWdmek82S3UrY3VwSHJ2NzZ1QVl6czJqZmhY?=
 =?utf-8?B?NDh4blZvVU5QQy9rT2RBYjBvLzV1bGtGN0c1TmFScUp3LzRoYkt4TzcvS2VZ?=
 =?utf-8?B?S3F6cFFESCs4TlVEYUNEMlo5ZFl0NWFSdGlQOGNuZHl4ZmtYR2VEOEtZd1BJ?=
 =?utf-8?B?RnViSFpEcDFJQ1Y5Tk1HOXhkbHVjVGdUYXkwRzRtandPakRYa2Nld1JTTVN4?=
 =?utf-8?B?L0NVNTZsZWFhTjVFZlU3VWJkVXJVOUdDMjdJMlhhS1BxeE5IL0dVeTMyVmJM?=
 =?utf-8?B?MWNHT0dFSnRSN3NIMW1nR3VqUlRIVCsxbGw2eGhoZmR2RU1DNm44K0ZYN3Bs?=
 =?utf-8?B?ekNIaVN6WmkyOEM4UFArTDJuQUJhaUtwN1dOK1hlMjhiZXB5Y29HdDFnUHJt?=
 =?utf-8?B?djIxQnNSZHdzR05KdHZYdG5GWHZPVkpMZTVoRnpJR21mK2R1c2g5b29UMGJJ?=
 =?utf-8?B?QTRjNGVOR3RsOFN6cXpoZXVQOXJiTSsrOHZScnZqOUdlWUJBL0JvRkNaS2E1?=
 =?utf-8?B?ZFdVQlRudDE0U1JOMXFCOTZDQXFQTU1OZVpHWmRTQi9zcW96bVk5WndUbVps?=
 =?utf-8?B?QnV6YXo2TXhtZ3NZS2FKZHNKbStNVUJKUTFzdVRPZlJNSXlhWmVhcEh5b1V2?=
 =?utf-8?B?dkw0WEkvYWd2U3ZqVTlhbmdxa2JobUozNmVhczFBUThnZVNUZ2hDUG9uNEVE?=
 =?utf-8?B?NlJRNnRwYy9RK05mLzIxRFhiLzFBWlJoR24xL0xsNGs4MFFaL2M1cXNLbDNH?=
 =?utf-8?B?NXdIVFRZVW9ndFo3TWxaTU8xcGN1RzdrVGRGc3lNQ3ZtVWV5OUR1UUJiRExP?=
 =?utf-8?B?bXlJUCtMaVFmME5lTm5rSmRJQTJLMnJ6SjNGRVJYRDhXdElwRzcxRTFoT1Nq?=
 =?utf-8?B?NDRQOFg5OTBVVmw4My9YZkFtVEsyQ2I2eGpMbHpJS3JUcTc1WnVvMVJNNUZv?=
 =?utf-8?B?UTdtcUVGUnVzUlhieUZTZkVOOC9sQm9hWnY2ZURtTVZNS1RaQVVnMTc5SnhS?=
 =?utf-8?B?SVdkdjhEVTl5K1JyWjY0cXNwenVhS29zU3BCR3lSNFBWUk0zaDZYVXltOXJk?=
 =?utf-8?B?aEIxMDhGV2dESlVJcVJQSm9VNCtUVG8zUE5JRFhQK3RXYlBhVDJDN3dTSk44?=
 =?utf-8?B?L2ViTzUyRitMQjdVTm9DTFpDaFEwUjJnaVJpUlhtNnE5UkVaNDZSKy9JZDds?=
 =?utf-8?B?OWpaZ3VEd3hYSzdyMnBKMzdkRlBNeXhja0RmTnF1cFYvdlNMcXh4OE52SU04?=
 =?utf-8?B?bjdWaHhCMGdNY21rcW5wbjBWTVNtMFc0aGJna0JlZDA3R0VBYm5tb0JXN3Nj?=
 =?utf-8?B?RkloUmRPeFF6ZjBZU3lpTTFwNjE2RHVwUE0wOXlSV3VMSi9xRmVRT3pXU2tC?=
 =?utf-8?B?M2dnZzQwNVR0OWpSR1ZpRDUvTEN1OGg1L3lqQVFRVXBCU3pIZWcxYUlqVHpQ?=
 =?utf-8?B?bFU2ajdzWlo2Nm1NaFJDY1lmQjk0aWQ2YWlTQjNPcVJXaHZsUTZEVFBoZHgz?=
 =?utf-8?B?YzdkRFJmNzBCMncrcUNzbTJUSVFCd3p5eWErWlFocGQreHM3dHF0RVh5ZXdi?=
 =?utf-8?B?aG5scWg2emNjVUh2VjVSVUtXM0V5cTNOR2drazhnd1pRaEpKQlErRnNldGta?=
 =?utf-8?B?ek5yMTlveGV0U004bzIvR2FtWk90Q0NzMEFwc0psd29uVXE3QzR5eGxrU05Q?=
 =?utf-8?B?ZC9BS1Q3NDBPSEozL25pYkEzb2xmQkNhL1JZVTdHcklzNy9vd3lsL2EwQW56?=
 =?utf-8?B?U2ViMHZjRkxrcC9YWW1VWGU1YVJGQ3JJUHRWZFFwQkVEMWo0ck1pQmM3a1FS?=
 =?utf-8?Q?fgsWnUMPb/Uahuk4FN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a483ca7e-240c-48a3-96f7-08deb646fdad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:08:35.4429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbmXOW76spdaq0TAJiFJDp2MdM8gy5Bjyigf3mi9MQ3QP03IJ1srZgHMB7irmCgB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7250
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62220-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,linaro.org,lwn.net,linuxfoundation.org,arndb.de,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,mailbox.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 219685896B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 19:08, Xaver Hugl wrote:
>>> The part where we get this independent of attached hardware is quite
>>> important for us though, since we can't just ignore explicit sync once
>>> the device we previously imported the syncobj into is disconnected.
>>
>> Can you elaborate more on this?
> 
> In Wayland, the client is allowed to attach dmabuf and syncobj
> independently, they don't have to be from the same device (and the
> compositor wouldn't be able to verify the opposite anyways). The
> compositor will usually import both into the same drm device, but
> especially with compositors that render on multiple devices, that's
> not necessarily the case either.
> 
> If for example we had a system with one internal GPU and one external
> GPU, the client renders on the internal GPU and the compositor uses
> the external one. Now when the user yanks the USB C cable, afaiu

Well I would say the other way around is a pretty common use case.

In other words the compositors uses the internal GPU for composing and displaying the picture. And the client uses the external GPU for fast rendering.

> - the buffers from the client stay valid

Buffers from the hot plugged GPU don't stay valid. Accessing CPU mappings either result in a SIGBUS or are redirected to a dummy page.

DMA operations to hot plugged buffers from other GPUs (or rather more general other devices) are waited on before the underlying resource is removed (e.g. system memory or PCIe address space or whatever is backing that).

But no new DMA operations are usually permitted to start.

> - the syncobj stays valid on the client side
> - the syncobj becomes invalid on the compositor side

Nope that's not correct. The syncobj itself stays valid even if you completely hot plug the device.

It can just be that the fences inside the syncobj are terminated with an error.

> "invalid" there means either
> - the acquire point of the client is marked as signaled, before
> rendering on the client side is completed
> - the acquire point of the client is never signaled. Since the
> compositor waits for the acquire point, the Wayland surface is stuck
> forever

Both of those would be a *massive* violation of documented kernel rules for hot-plugging which could lead to random data corruption and/or deadlocks.

If you see any HW driver showing behavior like that please open up a bug report and ping the relevant maintainers immediately.

When a hotplug happens all operations of the device should return an -ENODEV error, even when exposed to other devices/application through syncobj or syncfile.

One problem is that only syncfile allows for querying such error codes at the moment, we have patches pending to add that to syncobj as well but we lack a compositor with support for that as userspace client.

> Afaik the latter is currently the case. The former wouldn't be much
> better though, not when it's preventable.
> 
> This is admittedly an edge case, but GPU hotunplug is something we try
> to support as well as possible in Plasma, and all the edge cases cause
> a lot of problems in combination and are a lot of headaches to handle
> (or really work around) in the compositor.

Well exactly that design is used in the Tesla 3 infotainment system for example.

So GPU hotplug is actually a pretty common use case.

> Another edge case is when the client asks the compositor to import the
> syncobj, which can fail when a hotunplug is in process, and ends up
> disconnecting the client for no fault of either client or compositor.

Well the question here is if the device the compositor is using or the client is using is gone?

If the client device is hot removed the compositor should be perfectly capable to import the syncobj.

If the compositor device is gone then you don't have a device to display anything any more, so generating the next frame doesn't seem to make sense either.

What could be is that you want the compositor to be kept alive even when the display device is gone to switch over to vkms or whatever so that a VNC session or other remote desktop still works.

>>>>> 3. It removes the need to translate between syncobjs fds and handles.
>>>>
>>>> That's a pretty big no-go as well. The differentiation between FDs and handles is completely intentional.
>>> Could you expand on why it's needed? For compositors, the handle is
>>> just an intermediary thing when translating between file descriptors.
>>
>> Well what we could do is to add an IOCTL to directly attach an syncobj file descriptor to an eventfd.
> That would be nice.

Take a look at drm_syncobj_file_fops and how drm_syncobj_add_eventfd() is used. Adding that functionality shouldn't be more than a typing exercise.

Do I see it right that this would already solve most problems in the compositor side?

Regards,
Christian.

> 
> - Xaver


