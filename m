Return-Path: <linux-media+bounces-21108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F19C1744
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 08:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FC69B21897
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 07:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0C41D1744;
	Fri,  8 Nov 2024 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Tzdk7iZF"
X-Original-To: linux-media@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020142.outbound.protection.outlook.com [52.101.128.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806A717BD6;
	Fri,  8 Nov 2024 07:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731052150; cv=fail; b=GQe4OlX2RxSwJK38aqZm0ke81Rkg2g4C0Ezk8JHpU7i20kRF3j1n7bIM94Ax2oIOCf8Rm/EaqB1ZyCZcDdRLZ+tS8JIH8U6JWD9/DR19ADx+Z5Hd/KmJrrteTywq7AYnTGyzMLGKV5B93pnXAjl4t5zEILxJ7WW9fITcFuR0geA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731052150; c=relaxed/simple;
	bh=ZVDCkP2pIGiHZlC0+9JitEA/ymNOjesjQlfJy6HWIM8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lyb753HEqJIeNwlom55LiBcKkYEBL5RGJsQlFk14xho+msyZUqHgA66SE06eb53JRS4mQVpn/QoheYB7S8Ne5xM/yiv1YVZJIvkuBBUMcJY8ofqyhLtNdjXUM3MwWJQPKlvEomjAS7Gsohp8a7l/24WhdPoIxdA0zjgzwl8a2gA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Tzdk7iZF; arc=fail smtp.client-ip=52.101.128.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opLq/rpiCQr1hMwTd8t0FgCSQbkJ+4FhhkoO631E56btuFHSKk+LXt32yTotnmLP3x6iWcyKs8VBxJFH8dyCfpluKhDqR5wTEKjuFa6yRnQDV5pvq/OVt992LilmcGq1y41wA3T9/PftYO6Rh+VBf52I9a5iTjZuGuLJ1nk8360M9VCgTFOuKUyHGVUMwaakpt3FpEkYpCiZbQzQ65gonl0qyk8WGuBID8z3EuN9lkp5TYGSeFCdJGhcKS7Kx1tBRtj+yAVq7VveclLK/eYYAyz7jN8xy4W8il/ARACF6tv/OuYkp83+NcLgBb+T8hZjjER2chw0OD/ZtSZfitiMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3HaDHqzTeOP8Hl+l7YIJ91X/osoKZLnHKxdfBH4SS8=;
 b=e1+4iEytPSQTOesP3B5s/qvEsX+cGIOk3PJMUMO2bUIEyuPMrKoqoUcQn+ZYZggPKve3ZZlbSFVBg39qMWIYDyBJwzv28FY22tFYf2WvskkZ9NzZapILFi1A5UY0/TaS1grluaoFtK30F2T2imwuA9A0oPm6DEIiOxcyWYhr6QvHG6wt2uiltQGBt/SNaGHYVdBO5nozSSdRNDZQGOV3ckP1T6p7VFNhBuLIoTkQ+GE0Lv+N9SpnTJRLgHBEL5PTgV+1KIHCAiMWrjB3BMy032sUpqpw5dYNH9RfboNJUwXDtSfpeWEqU5hD8WMbJP5455i0Sra+a0+onPe9CxmsGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3HaDHqzTeOP8Hl+l7YIJ91X/osoKZLnHKxdfBH4SS8=;
 b=Tzdk7iZF3o81yCMj1+U/yw+djltPTM0AE+rC+dJI8OIMi6lC4ptu/essZF8arYrWOTq1IW17yOjleVhe5vidUzm/HnWw8+EOyCTCqoA+TYRoFg8dEs+dHS8bnzeAGFrzO0M8DUR38LZtgBn6iuBojIsjZ7MO3exY5W4XbM23CkVsNw4eN6ZCvgbWwVeevASl7Oe3bTBAvyDlR0BpoHj96nloU84lBa+DVr5vhcXd6BSKjxGB/bH0yoCj6TExaanIBgDLuQjwTA507/qp4OjfXAqZfY6FlVXySzAKtqn+LcoS4SdA33pB55dXqgeWz+AHu2jXBI7mTLDVySFmpJyMNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by SEZPR03MB8358.apcprd03.prod.outlook.com (2603:1096:101:192::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 07:49:00 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%3]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 07:48:52 +0000
Message-ID: <5fb48b6c-2c05-4f02-b600-73df30ce13b3@amlogic.com>
Date: Fri, 8 Nov 2024 15:48:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] media: platform: Add c3 mipi adapter driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com
References: <20240918-c3isp-v3-0-f774a39e6774@amlogic.com>
 <20240918-c3isp-v3-4-f774a39e6774@amlogic.com>
 <b6jb473565arawtxojycdwlffjws7jhev4gaakc2u5qhebndae@hpeppsgmjrvo>
 <e8430e0c-d6ba-4ef4-a495-cbc2f5c951e7@amlogic.com>
 <genj72cfdjawemablqdhtfz4gbsd6mje6moau3owlgalmhomj3@x6tsebwum5mu>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <genj72cfdjawemablqdhtfz4gbsd6mje6moau3owlgalmhomj3@x6tsebwum5mu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0119.apcprd02.prod.outlook.com
 (2603:1096:4:92::35) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|SEZPR03MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: fac3c3fd-e6c6-42ca-2075-08dcffc9b8c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEwwOTQva1hRRDg3aGFteXk0V2RWYWp2ZndLR3djRFgrWDBUTWxlZjVWL1BN?=
 =?utf-8?B?clVqbFgvRDN4Mlhmai9WRmdUV2NoY0orNG8zNHRvUkNTc2lHZTR0QkNINGF4?=
 =?utf-8?B?cThMenQ2cFkrcDc0dUNNbURyZjRXVzg3MTV0SUlXeUkwQWhqbnExRWhJMEY4?=
 =?utf-8?B?cmhwcmxhMjVBa0RRWk5GSGRwY3ZOVDhSZGNsU0hsMCt2Qk5wOUo2OTc0VlY0?=
 =?utf-8?B?Q3B1b0txKzNtNmFQWWd1dytibEtGSE14RWZVRHU5WDJCVzRGZENJQW5DVnVk?=
 =?utf-8?B?N282TXRkcUlSSE00NVluMkdnOTBmY08wakVWbk5sV0Z6ZGxkT0p1ZXVGekxs?=
 =?utf-8?B?bEhuMDM2bVY2dHI3ZnZpZ0tYQlh0bW4weHFjaTU2WGZ4cUVqMjRaOXNKZkEy?=
 =?utf-8?B?WC9INkNPOTJ1UWJ1blNXNkJKa3c5aGYraXNCMDA5MzJCWVJIaVVLSGRwUzcz?=
 =?utf-8?B?cUdMZS9NUU40enJhV3h6d1lpemFzR29nZFJJSzJMak5hd3ZWbVBQVWlGS3I2?=
 =?utf-8?B?Q0U4UWF6NWpEdnVmUlREditXa0t4N0p0WmZrdHlYTTVvNDJmSTdpdG92ZGd0?=
 =?utf-8?B?TjlZT0ZMYzJNUUl6UUtWYVRYd2hvTkp6STBEVi9MMkVpbnBIYSs2ZHpKeVZU?=
 =?utf-8?B?VGo1T2V0dEJlRmRENGNNM2hIQ1UyWGtGZURGL1FEc1RxdjE5WmlDK2M4QlBC?=
 =?utf-8?B?dXR1S1N2Skg1Rnd2ZDNyKzYvMWVjVG1tVmlheHBocUdmZnBQZ1B2dFhmS3dy?=
 =?utf-8?B?a1JCV3Izb3VZWTM3c0R2T0JCZEpUMDZXTWUxNWZjNEkvaDEvYU90RDUxbDVt?=
 =?utf-8?B?MDdXdVVIejgyblJhMVVBeTJsSjkwWUVJT01JSFFmdVJJRlRVYW41bW15RkU2?=
 =?utf-8?B?MjNlaVBiTWhxZ2l5Z0kzZ3dtdTJpMkJheGhiZUFsNzBtS1UwOXdYZUdGd0E0?=
 =?utf-8?B?eFJzM0FzT2Q0QWZkS1dqUmw0a3NQRFRJWS9HbzBpSFZBdEF2UFFpNFRjOXh5?=
 =?utf-8?B?WGF2bVdnQjZmUjlDSGNHM0c5Ym9ab1YyQWRQbkFueXA0TGgrazhiYk5NSTBu?=
 =?utf-8?B?SUM3SFpYd053WDVqNytKNDNBVlpxcjVqMVlSTHZSVDBpNG93UkNBOEFsOUF6?=
 =?utf-8?B?MWZ2akNyZkEvRGRtN241SHpESFkvSmFUaDdxa01nNGdKU0R2MzRLNkN5cldU?=
 =?utf-8?B?Ry9zR0ZoNnBXRUhvMTJqQ1VPZGdPN3B3Q3kwVWZYTXZJdWJwMXEvaGloczQ0?=
 =?utf-8?B?Y3BLUllrc29Ddm9BK0trZDlsQlBiUm9GR1llNXJvOVFVeGJGSTEzeXE4UlhH?=
 =?utf-8?B?dEE3RHFWYk9Oc1ZtckcvczJHUlpJanlSeVdudVBxYmxwM3JLVWEwaFltc201?=
 =?utf-8?B?dnMybWRrUzJVb1NYcXNCbWRITXlIWnkySFZaVktuRm1ORHdaWHQ5ZlJaVWFp?=
 =?utf-8?B?VVpuazZtOGlxUWRmMUJ6djlxVXdkTkJCMTNJSnhTVkRacm1pMmhZTFI5VGlH?=
 =?utf-8?B?Tk9qeE82RnVkWmY0YWo5Rm8yZXNpTjNJSk5Jb1RJK2t5U1ZxVi93a0VBV0dw?=
 =?utf-8?B?MStzQVFZZlgyQXkrMkF3NU9qL3N2T2FuRUNWNFNrYjRmWVVtcmtxUlBpUlZr?=
 =?utf-8?B?d1NRcEU5THZTbFdPRXZ2TEtQYkV3ZERmWDhCTkRzQ2xYVFFzTjdEbDZ5MTBr?=
 =?utf-8?B?YmJBUnpBTEJXZ3VZdStNVWsvWFBiRTNaLzVkbE9LSjlFY1lmakRidjk2Tmsv?=
 =?utf-8?Q?LpELjiExO2xZYRjQkBTDHmA2YfON25ZbdC0GOtj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0luUmVkL3RWMHYyUm9uWmFLcWpuQkdvRndzOEpjT1JMS0tKU3IrS0FnTk80?=
 =?utf-8?B?b3E0Q1ZnVnl4V3dFZ0dIamZnLzFKMkg2ejJieGVBL3FkOC9LSzFlV2dOZHhj?=
 =?utf-8?B?RXZuUTBDVkhnRTN5Vk5EdzEyWWVaWC9sQndUbmI0bDc1OGIzd3lGbDFadWd5?=
 =?utf-8?B?UExoUEZFZ3pFM1BFMWFMbUdVc21IcFlnYW5UdXRKVXZETjBQOVVUNlBYdDFX?=
 =?utf-8?B?a2d2Sm9pZEJoZFdWSDRlTDlXYk9GUU54MTV2d1lxd01SOGxxclpibWNxZ3Zh?=
 =?utf-8?B?RE80RlNKVGpHSXZjRCtJQXRTVnUzbGZOZTByQjZMREcrbzZPUG5uY2NEcjF4?=
 =?utf-8?B?UnRRS3Rnd2g2ZkNMUW5lQkNzRGpMUyt1NERnVWsrNHZ0RG5jbXQvMUxEaXRT?=
 =?utf-8?B?NVQ1VmhqaFFJbllCWGhsbDJ4SUFaTUs2akJWUUIwb3loQzlwRWJXajRFWFBl?=
 =?utf-8?B?QXdxalRyeHZ0U2hzNDFUMWJ5eEV6c0tnWVNtRzdjb1dtQkJpVVZDalZTdVdI?=
 =?utf-8?B?SUZDdWxMWWFKS1JjMnVwdlM2ZlpPWkFDdnFIbDlpUkNGVGlpWElRbWFCbjZM?=
 =?utf-8?B?T0h5RE1kT3BxQ0kwcGl4ZVVrODFmaWRiT1pZZTRHZDNhUTl2emcrVjlwYjVl?=
 =?utf-8?B?YXFidTBKOEY2NTJtSjI3VkZYMzNjVGY4NG04T0ltTW1tTFhLaGZDUTR0QjBv?=
 =?utf-8?B?Yk5sbnMxY0VKVm93RlFhTHJIcjFNSG5MOFNSTUhicU5YOEhUem9sL1V4RGVG?=
 =?utf-8?B?RnlCM1VrYTZsSzBia2o5a1BjZkVTbDVzTzBpN01kL2k5bG9TWFJ1Z2VTbDJw?=
 =?utf-8?B?N3BnNmRZN3hDaHpLZ1psU1A0ZGI3bENNanRaalB5cGh0eHF4UFNhU21FOEVj?=
 =?utf-8?B?ZTdkejdJMnprczJ1RVJ1VXBMeGVOTFhKQTczaGl4WEwyVWdhZmFLVUpBWTRu?=
 =?utf-8?B?RHdqTjcrZ3NhRXRpQ0FIYUFPWDVIZWRtcklqZEZJWmZwRmtBQzUyN1VoUTVl?=
 =?utf-8?B?cC9zcGx6cFloaURWVW1YMFUzRy90TWZlbWNWMGFPaUhHNlFQRkFvZzJINjhL?=
 =?utf-8?B?VVBza3N4SXlZZVpXb1pwYWR2YVRIamVpemFSYnZ3cnNoT05WK3BnK0t1R1Zo?=
 =?utf-8?B?MHk0LzJJZW9GSjd4UjFDUXBDeTE4b3A5R2ltdGx2ODBFbHJVbjROVkh6QlJQ?=
 =?utf-8?B?eXVHRG9WODU5TWR0K1U3M1hLQnpEekt2UHFPZXA5dlVyZitGNTA0VHV2aURM?=
 =?utf-8?B?dzZwM3loOXRBemxlV3VzNUphdVRXeUVvSTNMaFh6NWoyeFhHUjFuUkhqRkk4?=
 =?utf-8?B?RVNmdm9ZTko1OHN1YlBlZ2FvZkxJYWF2Nzc0bFUzL280V1dRNnlNNkFRR05s?=
 =?utf-8?B?NHhEak5qTDc2WUQydDNrdDVpdEE0c1YyRUlYT1YrUWFSOFRkSldGK1FwTGNU?=
 =?utf-8?B?dFc4UDVUaGRqTGkyQzh0SkJMUWk5dTcrRDZ4Vk9wSE9VNHViYzRoWVZ6cUdK?=
 =?utf-8?B?YXFPN1lYQkxmY1BoL3FaVDh1Z1dYQWdUTTdUSEJha2FqdWttMVVtcnV4Z1Vw?=
 =?utf-8?B?czJhVlZVTFByMEQvWXR1NzU2SENISjVva3FBNEF1YThDUW5FR3ZuaTdIN3VI?=
 =?utf-8?B?RjE4UzhoNVJ2Sll4bUVMenorMDdlcXptMnhnbHFHeHprbmpSYW5XUW5JSjN6?=
 =?utf-8?B?MGx5VlBxWG1nWVhyenpmMVpXRnB4QmZyejlmYlhWU29zZzRJL0Y0UnNiUzJo?=
 =?utf-8?B?M3dTdThkYVg2dGxYZlJObVphS3lGQmZ6UFhMVElOZzlUWlhaYUpXOFNnV1Y0?=
 =?utf-8?B?Q05nQUo5K2JRTlBiaEUzZXNqclFzeUpzZWxUYjVKS2tPMkgyaXVtNXN4Y2hG?=
 =?utf-8?B?akRkRkx6b1BwTk5kRnowdFV6UHNHTVZxa2U5MmJNQTRkY2Zscy9DaTJWSUt4?=
 =?utf-8?B?NS9PRUFWUVorTy9TaWdOdVVZUXl6dnlrdXQzUTdDZW9ZK3JNNlgzeGVHajYx?=
 =?utf-8?B?cVRvbTNxK2pZS2twcjlldDRHS2pEdVJydEE2Y0lyd2NXaFA3LzR2VXZKVmVW?=
 =?utf-8?B?aFN4Zk9QQTljYVhXc2FQMTJjRkl4akc4djA2elZMekI3UzZTQ1NFaHlLU0Ew?=
 =?utf-8?Q?GlJzORHv9v4H+GZSb6sWgTqo9?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac3c3fd-e6c6-42ca-2075-08dcffc9b8c1
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:48:39.1679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXpOU8q2oDiqGky/JTBZ8b5EhhhwoULABKyHaJ3suDPHR5o2t0zONQ3qddcvO/MCOfIkULkFeZREmiETJ2A01g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8358

Hi Jacopo

Thanks very much for  your reply.

On 2024/11/7 16:48, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Keke
>
> On Wed, Nov 06, 2024 at 01:32:58PM +0800, Keke Li wrote:
>> Hi Jacopo
>>
>> Thanks very much for your reply.
>>
>> On 2024/11/5 19:24, Jacopo Mondi wrote:
>>> [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> [ EXTERNAL EMAIL ]
>>>
>>> Hi Keke
>>>
>>> On Wed, Sep 18, 2024 at 02:07:15PM +0800, Keke Li via B4 Relay wrote:
>>>> From: Keke Li <keke.li@amlogic.com>
>>>>
>>>> This driver mainly responsible for organizing
>>>> MIPI data and sending raw data to ISP pipeline.
>>> A few questions on the design of this subdevice.
>>>
>>> In my understanding the adapter provides several functionalities:
>>>
>>> - Data alignement to match the ISP size constraints
>>> - Read from DDR memory or from the CSI-2 RX (direct path)
>>> - Write to DDR memory or to the ISP (direct path)
>>> - Split data streams to DDR or direct path based on CSI-2 Virtual
>>>     Channel and Data type.
>>
>> Yes, you are right.
>>
>>> As I understand the current implementation only supports direct-path
>>> to ISP of data sent on VC#0.
>>
>> Read image from DDR and wirte image to DDR  are used in WDR mode.
>>
>> Due to the lack of WDR requirement,  This driver only support direct-path.
>>
>>> Do you plan to expand the adapter subdev with support for mulitple
>>> paths ? Is this why you are supporting already a routing table ?
>> If there is a demand in the future, I will support multiple paths.
>>
>> But now I attend to only support one path and will drop the set_routing()
>> interface.
>>
>>
>>>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>>>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>>>> ---
>>>>    MAINTAINERS                                        |   7 +
>>>>    drivers/media/platform/amlogic/Kconfig             |   1 +
>>>>    drivers/media/platform/amlogic/Makefile            |   1 +
>>>>    .../media/platform/amlogic/c3-mipi-adapter/Kconfig |  16 +
>>>>    .../platform/amlogic/c3-mipi-adapter/Makefile      |   3 +
>>>>    .../amlogic/c3-mipi-adapter/c3-mipi-adap.c         | 913 +++++++++++++++++++++
>>>>    6 files changed, 941 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 9e75874a6e69..31168c05f304 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -1209,6 +1209,13 @@ F:     Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
>>>>    F:   drivers/perf/amlogic/
>>>>    F:   include/soc/amlogic/
>>>>
>>>> +AMLOGIC MIPI ADAPTER DRIVER
>>>> +M:   Keke Li <keke.li@amlogic.com>
>>>> +L:   linux-media@vger.kernel.org
>>>> +S:   Maintained
>>>> +F:   Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
>>>> +F:   drivers/media/platform/amlogic/c3-mipi-adapter/
>>>> +
>>>>    AMLOGIC MIPI CSI2 DRIVER
>>>>    M:   Keke Li <keke.li@amlogic.com>
>>>>    L:   linux-media@vger.kernel.org
>>>> diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
>>>> index b7c2de14848b..df09717b28d0 100644
>>>> --- a/drivers/media/platform/amlogic/Kconfig
>>>> +++ b/drivers/media/platform/amlogic/Kconfig
>>>> @@ -2,5 +2,6 @@
>>>>
>>>>    comment "Amlogic media platform drivers"
>>>>
>>>> +source "drivers/media/platform/amlogic/c3-mipi-adapter/Kconfig"
>>>>    source "drivers/media/platform/amlogic/c3-mipi-csi2/Kconfig"
>>>>    source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
>>>> diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
>>>> index 4f571ce5d13e..b370154b090c 100644
>>>> --- a/drivers/media/platform/amlogic/Makefile
>>>> +++ b/drivers/media/platform/amlogic/Makefile
>>>> @@ -1,4 +1,5 @@
>>>>    # SPDX-License-Identifier: GPL-2.0-only
>>>>
>>>> +obj-y += c3-mipi-adapter/
>>>>    obj-y += c3-mipi-csi2/
>>>>    obj-y += meson-ge2d/
>>>> diff --git a/drivers/media/platform/amlogic/c3-mipi-adapter/Kconfig b/drivers/media/platform/amlogic/c3-mipi-adapter/Kconfig
>>>> new file mode 100644
>>>> index 000000000000..bf19059b3543
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/amlogic/c3-mipi-adapter/Kconfig
>>>> @@ -0,0 +1,16 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +config VIDEO_C3_MIPI_ADAPTER
>>>> +     tristate "Amlogic C3 MIPI adapter"
>>>> +     depends on ARCH_MESON || COMPILE_TEST
>>>> +     depends on VIDEO_DEV
>>>> +     depends on OF
>>>> +     select MEDIA_CONTROLLER
>>>> +     select V4L2_FWNODE
>>>> +     select VIDEO_V4L2_SUBDEV_API
>>>> +     help
>>>> +       Video4Linux2 driver for Amlogic C3 MIPI adapter.
>>>> +       C3 MIPI adapter mainly responsible for organizing
>>>> +       MIPI data and sending raw data to ISP pipeline.
>>>> +
>>>> +       To compile this driver as a module choose m here.
>>>> diff --git a/drivers/media/platform/amlogic/c3-mipi-adapter/Makefile b/drivers/media/platform/amlogic/c3-mipi-adapter/Makefile
>>>> new file mode 100644
>>>> index 000000000000..216fc310c5b4
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/amlogic/c3-mipi-adapter/Makefile
>>>> @@ -0,0 +1,3 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>> +
>>>> +obj-$(CONFIG_VIDEO_C3_MIPI_ADAPTER) += c3-mipi-adap.o
>>>> diff --git a/drivers/media/platform/amlogic/c3-mipi-adapter/c3-mipi-adap.c b/drivers/media/platform/amlogic/c3-mipi-adapter/c3-mipi-adap.c
>>>> new file mode 100644
>>>> index 000000000000..b64eb417c2e2
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/amlogic/c3-mipi-adapter/c3-mipi-adap.c
>>>> @@ -0,0 +1,913 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>>> +/*
>>>> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
>>>> + */
>>>> +
>>>> +#include <linux/cleanup.h>
>>>> +#include <linux/clk.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/mutex.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/pm_runtime.h>
>>>> +
>>>> +#include <media/v4l2-async.h>
>>>> +#include <media/v4l2-common.h>
>>>> +#include <media/v4l2-device.h>
>>>> +#include <media/v4l2-fwnode.h>
>>>> +#include <media/v4l2-mc.h>
>>>> +#include <media/v4l2-subdev.h>
>>>> +
>>>> +/* C3 adapter submodule definition */
>>>> +enum {
>>>> +     SUBMD_TOP,
>>>> +     SUBMD_FD,
>>>> +     SUBMD_RD,
>>>> +};
>>>> +
>>>> +#define ADAP_SUBMD_MASK             GENMASK(17, 16)
>>>> +#define ADAP_SUBMD_SHIFT            16
>>>> +#define ADAP_SUBMD(x)               (((x) & (ADAP_SUBMD_MASK)) >> (ADAP_SUBMD_SHIFT))
>>>> +#define ADAP_REG_ADDR_MASK          GENMASK(15, 0)
>>>> +#define ADAP_REG_ADDR(x)            ((x) & (ADAP_REG_ADDR_MASK))
>>>> +#define ADAP_REG_T(x)               ((SUBMD_TOP << ADAP_SUBMD_SHIFT) | (x))
>>>> +#define ADAP_REG_F(x)               ((SUBMD_FD << ADAP_SUBMD_SHIFT) | (x))
>>>> +#define ADAP_REG_R(x)               ((SUBMD_RD << ADAP_SUBMD_SHIFT) | (x))
>>>> +
>>>> +#define MIPI_ADAP_CLOCK_NUM_MAX     3
>>>> +#define MIPI_ADAP_SUBDEV_NAME       "mipi-adapter"
>>> I would add a "c3-" prefix
>>>
>> Will add "c3-" prefix
>>
>>>> +
>>>> +/* C3 MIPI adapter TOP register */
>>>> +#define MIPI_ADAPT_DE_CTRL0         ADAP_REG_T(0x40)
>>>> +#define ADAP_DE_READ_BYPASS         BIT(3)
>>>> +#define ADAP_DE_WRITE_BYPASS        BIT(7)
>>>> +
>>>> +/* C3 MIPI adapter FRONTEND register */
>>>> +#define CSI2_CLK_RESET              ADAP_REG_F(0x00)
>>>> +#define ADAP_FD_APPLY_RESET         BIT(0)
>>>> +#define ADAP_FD_ENABLE              BIT(1)
>>>> +
>>>> +#define CSI2_GEN_CTRL0              ADAP_REG_F(0x04)
>>>> +#define ADAP_FD_VIRTUAL_CHN0_EN     BIT(0)
>>>> +#define ADAP_FD_VIRTUAL_CHN1_EN     BIT(1)
>>>> +#define ADAP_FD_VIRTUAL_CHN2_EN     BIT(2)
>>>> +#define ADAP_FD_VIRTUAL_CHN3_EN     BIT(3)
>>>> +#define ADAP_FD_ENABLE_PACKETS      GENMASK(20, 16)
>>>> +#define ADAP_FD_ENABLE_RAW          BIT(16)
>>>> +
>>>> +#define CSI2_X_START_END_ISP        ADAP_REG_F(0x0c)
>>>> +#define ADAP_FD_X_END_MASK          GENMASK(31, 16)
>>>> +#define ADAP_FD_X_END_SHIFT         16
>>>> +#define ADAP_FD_X_END(x)            ((x) - 1)
>>>> +
>>>> +#define CSI2_Y_START_END_ISP        ADAP_REG_F(0x10)
>>>> +#define ADAP_FD_Y_END_MASK          GENMASK(31, 16)
>>>> +#define ADAP_FD_Y_END_SHIFT         16
>>>> +#define ADAP_FD_Y_END(x)            ((x) - 1)
>>>> +
>>>> +#define CSI2_VC_MODE                ADAP_REG_F(0x1c)
>>>> +#define ADAP_FD_VS_SEL_VC_MASK      GENMASK(19, 16)
>>>> +#define ADAP_FD_VS_DIRECT_PATH      BIT(16)
>>>> +#define ADAP_FD_HS_SEL_VC_MASK      GENMASK(23, 20)
>>>> +#define ADAP_FD_HS_DIRECT_PATH      BIT(20)
>>>> +
>>>> +/* C3 MIPI adapter READER register */
>>>> +#define MIPI_ADAPT_DDR_RD0_CNTL0    ADAP_REG_R(0x00)
>>>> +#define ADAP_RD0_MODULE_ENABLE      BIT(0)
>>>> +#define ADAP_RD0_LINE_STRIDE_MASK   GENMASK(13, 4)
>>>> +#define ADAP_RD0_LINE_STRIDE_SHIFT  4
>>>> +#define ADAP_RD0_SAMPLE_SEL_MASK    GENMASK(27, 26)
>>>> +#define ADAP_RD0_DATA_IN_VSYNC      BIT(26)
>>>> +#define ADAP_RD0_BURST_TYPE_MASK    GENMASK(29, 28)
>>>> +#define ADAP_RD0_BURST_TYPE_SHIFT   28
>>>> +#define ADAP_RD0_BURST_TYPE_INRC8   3
>>>> +#define ADAP_RD0_FRAME_RD_START     BIT(31)
>>>> +
>>>> +#define MIPI_ADAPT_DDR_RD0_CNTL1    ADAP_REG_R(0x04)
>>>> +#define ADAP_RD0_LINE_SIZE_MASK     GENMASK(9, 0)
>>>> +#define ADAP_RD0_LINE_NUM_MASK      GENMASK(28, 16)
>>>> +#define ADAP_RD0_LINE_NUM_SHIFT     16
>>>> +
>>>> +#define MIPI_ADAPT_PIXEL0_CNTL0     ADAP_REG_R(0x80)
>>>> +#define ADAP_PIXEL0_WORK_MODE_MASK  GENMASK(17, 16)
>>>> +#define ADAP_PIXEL0_DIRECT_PATH     BIT(16)
>>>> +#define ADAP_PIXEL0_DATA_TYPE_MASK  GENMASK(25, 20)
>>>> +#define ADAP_PIXEL0_DATA_TYPE_SHIFT 20
>>>> +#define ADAP_PIXEL0_DATA_TYPE_10BITS 0x2b
>>>> +#define ADAP_PIXEL0_DATA_TYPE_12BITS 0x2c
>>>> +#define ADAP_PIXEL0_START_ENABLE    BIT(31)
>>>> +
>>>> +#define MIPI_ADAPT_PIXEL0_CNTL1     ADAP_REG_R(0x84)
>>>> +#define ADAP_PIXEL0_X_END_MASK      GENMASK(15, 0)
>>>> +#define ADAP_PIXEL0_X_END(x)        ((x) - 1)
>>>> +
>>>> +#define MIPI_ADAPT_PIXEL0_CNTL2     ADAP_REG_R(0x88)
>>>> +#define ADAP_PIXEL0_FIFO_SIZE_MASK  GENMASK(9, 0)
>>>> +#define ADAP_PIXEL0_PIXEL_NUM_MASK  GENMASK(27, 15)
>>>> +#define ADAP_PIXEL0_PIXEL_NUM_SHIFT 15
>>>> +
>>>> +#define MIPI_ADAPT_ALIG_CNTL0       ADAP_REG_R(0x100)
>>>> +#define ADAP_ALIG_V_TOTAL_NUM_MASK  GENMASK(15, 0)
>>>> +/* Need to add a default blank */
>>>> +#define ADAP_ALIG_V_TOTAL_NUM(x)    ((x) + 64)
>>>> +#define ADAP_ALIG_H_TOTAL_NUM_MASK  GENMASK(31, 16)
>>>> +#define ADAP_ALIG_H_TOTAL_NUM_SHIFT 16
>>>> +/* Need to add a default blank */
>>>> +#define ADAP_ALIG_H_TOTAL_NUM(x)    ((x) + 64)
>>>> +
>>>> +#define MIPI_ADAPT_ALIG_CNTL1       ADAP_REG_R(0x104)
>>>> +#define ADAP_ALIG_HPE_NUM_MASK      GENMASK(31, 16)
>>>> +#define ADAP_ALIG_HPE_NUM_SHIFT     16
>>>> +
>>>> +#define MIPI_ADAPT_ALIG_CNTL2       ADAP_REG_R(0x108)
>>>> +#define ADAP_ALIG_VPE_NUM_MASK      GENMASK(31, 16)
>>>> +#define ADAP_ALIG_VPE_NUM_SHIFT     16
>>>> +
>>>> +#define MIPI_ADAPT_ALIG_CNTL3       ADAP_REG_R(0x10c)
>>>> +#define ADAP_ALIG_FRM_ST_PIXEL_MASK GENMASK(15, 0)
>>>> +
>>>> +#define MIPI_ADAPT_ALIG_CNTL6       ADAP_REG_R(0x118)
>>>> +#define ADAP_ALIG_LANE0_ENABLE      BIT(0)
>>>> +#define ADAP_ALIG_DATA_MODE0_MASK   BIT(4)
>>>> +#define ADAP_ALIG_DIRECT_MODE       BIT(4)
>>>> +#define ADAP_ALIG_VDATA0_ENABLE     BIT(12)
>>>> +#define ADAP_ALIG_VDATA1_ENABLE     BIT(13)
>>>> +#define ADAP_ALIG_VDATA2_ENABLE     BIT(14)
>>>> +#define ADAP_ALIG_VDATA3_ENABLE     BIT(15)
>>>> +
>>>> +#define MIPI_ADAPT_ALIG_CNTL8       ADAP_REG_R(0x120)
>>>> +#define ADAP_ALIG_FRAME_CONTINUE    BIT(5)
>>>> +#define ADAP_ALIG_EXC_MASK_DIS      BIT(12)
>>>> +#define ADAP_ALIG_START_ENABLE      BIT(31)
>>>> +
>>>> +#define MIPI_ADAP_MAX_WIDTH         2888
>>>> +#define MIPI_ADAP_MIN_WIDTH         160
>>>> +#define MIPI_ADAP_MAX_HEIGHT        2240
>>>> +#define MIPI_ADAP_MIN_HEIGHT        120
>>>> +#define MIPI_ADAP_DEFAULT_WIDTH     1920
>>>> +#define MIPI_ADAP_DEFAULT_HEIGHT    1080
>>>> +#define MIPI_ADAP_DEFAULT_FMT       MEDIA_BUS_FMT_SRGGB10_1X10
>>>> +
>>>> +/* C3 MIPI adapter pad list */
>>>> +enum {
>>>> +     MIPI_ADAP_PAD_SINK,
>>>> +     MIPI_ADAP_PAD_SRC,
>>>> +     MIPI_ADAP_PAD_MAX
>>>> +};
>>>> +
>>>> +/*
>>>> + * struct adap_info - mipi adapter information
>>>> + *
>>>> + * @clocks: array of mipi adapter clock names
>>>> + * @clock_rates: array of mipi adapter clock rate
>>>> + * @clock_num: actual clock number
>>>> + */
>>>> +struct adap_info {
>>>> +     char *clocks[MIPI_ADAP_CLOCK_NUM_MAX];
>>>> +     u32 clock_rates[MIPI_ADAP_CLOCK_NUM_MAX];
>>>> +     u32 clock_num;
>>>> +};
>>>> +
>>>> +/**
>>> Here as well you can drop one * from /**
>>
>> Will drop one  * from  /**
>>
>>>> + * struct adap_device - mipi adapter platform device
>>>> + *
>>>> + * @dev: pointer to the struct device
>>>> + * @top: mipi adapter top register address
>>>> + * @fd: mipi adapter frontend register address
>>>> + * @rd: mipi adapter reader register address
>>>> + * @clks: array of MIPI adapter clocks
>>>> + * @sd: mipi adapter sub-device
>>>> + * @pads: mipi adapter sub-device pads
>>>> + * @notifier: notifier to register on the v4l2-async API
>>>> + * @format: save sub-device format
>>>> + * @src_sd: source sub-device
>>>> + * @src_sd_pad: source sub-device pad
>>>> + * @lock: protect mipi adapter device
>>>> + * @info: version-specific MIPI adapter information
>>>> + */
>>>> +struct adap_device {
>>>> +     struct device *dev;
>>>> +     void __iomem *top;
>>>> +     void __iomem *fd;
>>>> +     void __iomem *rd;
>>>> +     struct clk_bulk_data clks[MIPI_ADAP_CLOCK_NUM_MAX];
>>>> +
>>>> +     struct v4l2_subdev sd;
>>>> +     struct media_pad pads[MIPI_ADAP_PAD_MAX];
>>>> +     struct v4l2_async_notifier notifier;
>>>> +     struct v4l2_subdev_format format;
>>>> +     struct v4l2_subdev *src_sd;
>>>> +
>>>> +     u16 src_sd_pad;
>>>> +     struct mutex lock; /* Protect adapter device */
>>> Most comments on the csi2-rx patch apply to this one as well.
>>> In this case, you don't need locking for functions that receive a
>>> subdev_state
>>>
>> Will remove this lock.
>>>> +     const struct adap_info *info;
>>>> +};
>>>> +
>>>> +/* Format helpers */
>>>> +
>>>> +struct adap_pix_format {
>>>> +     u32 code;
>>>> +     u8 width;
>>> I would call it bpp
>> Will replace width with bpp
>>>> +};
>>>> +
>>>> +static const struct adap_pix_format c3_mipi_adap_formats[] = {
>>>> +     { MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
>>>> +     { MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
>>>> +     { MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
>>>> +     { MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
>>>> +     { MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
>>>> +     { MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
>>>> +     { MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
>>>> +     { MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
>>>> +};
>>>> +
>>>> +static const struct adap_pix_format
>>>> +*c3_mipi_adap_find_format(u32 code)
>>>> +{
>>>> +     unsigned int i;
>>>> +
>>>> +     for (i = 0; i < ARRAY_SIZE(c3_mipi_adap_formats); i++)
>>>> +             if (code == c3_mipi_adap_formats[i].code)
>>>> +                     return &c3_mipi_adap_formats[i];
>>>> +
>>>> +     return NULL;
>>>> +}
>>>> +
>>>> +/* Hardware configuration */
>>>> +
>>>> +static void c3_mipi_adap_update_bits(struct adap_device *adap, u32 reg,
>>>> +                                  u32 mask, u32 val)
>>>> +{
>>>> +     void __iomem *addr;
>>>> +     u32 orig, tmp;
>>>> +
>>>> +     switch (ADAP_SUBMD(reg)) {
>>>> +     case SUBMD_TOP:
>>>> +             addr = adap->top + ADAP_REG_ADDR(reg);
>>>> +             break;
>>>> +     case SUBMD_FD:
>>>> +             addr = adap->fd + ADAP_REG_ADDR(reg);
>>>> +             break;
>>>> +     case SUBMD_RD:
>>>> +             addr = adap->rd + ADAP_REG_ADDR(reg);
>>>> +             break;
>>>> +     default:
>>>> +             dev_err(adap->dev, "Invalid sub-module: %lu\n", ADAP_SUBMD(reg));
>>>> +             return;
>>>> +     }
>>>> +
>>>> +     orig = readl(addr);
>>>> +     tmp = orig & ~mask;
>>>> +     tmp |= val & mask;
>>>> +
>>>> +     if (tmp != orig)
>>>> +             writel(tmp, addr);
>>>> +}
>>>> +
>>>> +/* Configure adapter top sub module */
>>>> +static void c3_mipi_adap_cfg_top(struct adap_device *adap)
>>>> +{
>>>> +     /* Bypass decompress */
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DE_CTRL0,
>>>> +                              ADAP_DE_READ_BYPASS, ADAP_DE_READ_BYPASS);
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DE_CTRL0,
>>>> +                              ADAP_DE_WRITE_BYPASS, ADAP_DE_WRITE_BYPASS);
>>>> +}
>>>> +
>>>> +/* Configure adapter frontend sub module */
>>>> +static void c3_mipi_adap_cfg_frontend(struct adap_device *adap,
>>>> +                                   struct v4l2_mbus_framefmt *fmt)
>>>> +{
>>>> +     /* The default value of BIT_0 is 1, so need release reset firstly. */
>>>> +     c3_mipi_adap_update_bits(adap, CSI2_CLK_RESET, ADAP_FD_APPLY_RESET, 0);
>>>> +
>>>> +     c3_mipi_adap_update_bits(adap, CSI2_X_START_END_ISP, ADAP_FD_X_END_MASK,
>>>> +                              ADAP_FD_X_END(fmt->width) << ADAP_FD_X_END_SHIFT);
>>>> +     c3_mipi_adap_update_bits(adap, CSI2_Y_START_END_ISP, ADAP_FD_Y_END_MASK,
>>>> +                              ADAP_FD_Y_END(fmt->height) << ADAP_FD_Y_END_SHIFT);
>>>> +
>>>> +     /* Select VS and HS signal to direct path */
>>>> +     c3_mipi_adap_update_bits(adap, CSI2_VC_MODE, ADAP_FD_VS_SEL_VC_MASK,
>>>> +                              ADAP_FD_VS_DIRECT_PATH);
>>>> +     c3_mipi_adap_update_bits(adap, CSI2_VC_MODE, ADAP_FD_HS_SEL_VC_MASK,
>>>> +                              ADAP_FD_HS_DIRECT_PATH);
>>>> +
>>>> +     /* Enable to receive RAW image */
>>>> +     c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0, ADAP_FD_ENABLE_PACKETS,
>>>> +                              ADAP_FD_ENABLE_RAW);
>>>> +
>>>> +     /* Enable virtual channel 0~3 */
>>>> +     c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0, ADAP_FD_VIRTUAL_CHN0_EN,
>>>> +                              ADAP_FD_VIRTUAL_CHN0_EN);
>>>> +     c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0, ADAP_FD_VIRTUAL_CHN1_EN,
>>>> +                              ADAP_FD_VIRTUAL_CHN1_EN);
>>>> +     c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0, ADAP_FD_VIRTUAL_CHN2_EN,
>>>> +                              ADAP_FD_VIRTUAL_CHN2_EN);
>>>> +     c3_mipi_adap_update_bits(adap, CSI2_GEN_CTRL0, ADAP_FD_VIRTUAL_CHN3_EN,
>>>> +                              ADAP_FD_VIRTUAL_CHN3_EN);
>>>> +}
>>>> +
>>>> +/* Configure adapter reader sub module */
>>>> +static void c3_mipi_adap_cfg_reader(struct adap_device *adap,
>>>> +                                 struct v4l2_mbus_framefmt *fmt)
>>>> +{
>>>> +     const struct adap_pix_format *pix_format;
>>>> +     u32 line_size;
>>>> +     u8 data_type;
>>>> +
>>>> +     /* Data size for a line, unit: 128 bits */
>>>> +     pix_format = c3_mipi_adap_find_format(fmt->code);
>>>> +     line_size = fmt->width * pix_format->width;
>>>> +     line_size = DIV_ROUND_UP(line_size, 128);
>>>> +
>>>> +     if (pix_format->width == 10) {
>>>> +             data_type = ADAP_PIXEL0_DATA_TYPE_10BITS;
>>>> +     } else if (pix_format->width == 12) {
>>>> +             data_type = ADAP_PIXEL0_DATA_TYPE_12BITS;
>>> You should use MIPI_CSI2_DT_RAW10 and MIPI_CSI2_DT_RAW12 from
>>> "include/media/mipi-csi2.h"
>>>
>> OK,  Will use MIPI_CSI2_DT_RAW10 and MIPI_CSI2_DT_RAW12.
>>>> +     } else {
>>>> +             dev_err(adap->dev, "Invalid raw format width: %u\n", pix_format->width);
>>>> +             return;
>>>> +     }
>>>> +
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL1,
>>>> +                              ADAP_RD0_LINE_SIZE_MASK, line_size);
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL1, ADAP_RD0_LINE_NUM_MASK,
>>>> +                              fmt->height << ADAP_RD0_LINE_NUM_SHIFT);
>>>> +
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL0, ADAP_RD0_MODULE_ENABLE,
>>>> +                              ADAP_RD0_MODULE_ENABLE);
>>> I'm not sure I get this. I read this bit as "Enable reading from DDR"
>>> while I thought the adapter receives data directly from the CSI-2
>>> receiver
>> This place is a bit confusing.
>> I will check this issue  and add explanation.
>>
>>
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL0, ADAP_RD0_LINE_STRIDE_MASK,
>>>> +                              line_size << ADAP_RD0_LINE_STRIDE_SHIFT);
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL0, ADAP_RD0_SAMPLE_SEL_MASK,
>>>> +                              ADAP_RD0_DATA_IN_VSYNC);
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_DDR_RD0_CNTL0, ADAP_RD0_BURST_TYPE_MASK,
>>>> +                              ADAP_RD0_BURST_TYPE_INRC8 << ADAP_RD0_BURST_TYPE_SHIFT);
>>>> +
>>>> +     /* Set data type and work mode */
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL0,
>>>> +                              ADAP_PIXEL0_WORK_MODE_MASK, ADAP_PIXEL0_DIRECT_PATH);
>>> Ah maybe this setting "RAW from direct path" enables direct path from
>>> CSI-2 receiver
>>>
>> PIXEL0 is a sub module in adapter and should be configured.
>>
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL0, ADAP_PIXEL0_DATA_TYPE_MASK,
>>>> +                              data_type << ADAP_PIXEL0_DATA_TYPE_SHIFT);
>>>> +
>>>> +     /* Set pixel end number */
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL1, ADAP_PIXEL0_X_END_MASK,
>>>> +                              ADAP_PIXEL0_X_END(fmt->width));
>>>> +
>>>> +     /* Set line pixel number and reader fifo size */
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL2,
>>>> +                              ADAP_PIXEL0_FIFO_SIZE_MASK, line_size);
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL2, ADAP_PIXEL0_PIXEL_NUM_MASK,
>>>> +                              fmt->width << ADAP_PIXEL0_PIXEL_NUM_SHIFT);
>>>> +
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL0, ADAP_ALIG_V_TOTAL_NUM_MASK,
>>>> +                              ADAP_ALIG_V_TOTAL_NUM(fmt->width));
>>> What are the ISP alignment requirements ?
>>>
>>> #define ADAP_ALIG_V_TOTAL_NUM(x)    ((x) + 64)
>>>
>>> Are you aligning or just adding 64 here ?
>>
>> ISP hardware requires at least 40 v-blanks,
> Ok, now I see the requirements: 40 v-blanks, 64 h-blanks.
>
>> so here add 64 to ensure ISP can function properly.
>>
> However I read the register ALIGN_CNTL0 to be described as v_total_num
> and h_total_num which makes me think the actual image data are
> expanded to the desired values ?  Or maybe it's just
> to add enough processing margins to the ISP ?


Yes, the function of ALIGN is to align frame to meet

the requirement of ISP.

>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL0, ADAP_ALIG_H_TOTAL_NUM_MASK,
>>>> +                              ADAP_ALIG_H_TOTAL_NUM(fmt->height)
>>>> +                              << ADAP_ALIG_H_TOTAL_NUM_SHIFT);
>>>> +
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL1, ADAP_ALIG_HPE_NUM_MASK,
>>>> +                              fmt->width << ADAP_ALIG_HPE_NUM_SHIFT);
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL2, ADAP_ALIG_VPE_NUM_MASK,
>>>> +                              fmt->height << ADAP_ALIG_VPE_NUM_SHIFT);
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL3,
>>>> +                              ADAP_ALIG_FRM_ST_PIXEL_MASK, fmt->width);
> This is also something I'm not sure I get. The registers seems to be
> there to skip reading a number of lines and pixels at the beginning of
> the frame. It however only take effect if frame_sync_en =1 something
> the driver doesn't set ?
>

I have checked ALIG_CNTL3 register.

There is no need to configure ALIG_CNTL3 when frame_sync_en = 0.

The default value of frame_sync_en is 0.

So will remove this configuration.

>>>> +
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
>>>> +                              ADAP_ALIG_LANE0_ENABLE, ADAP_ALIG_LANE0_ENABLE);
>>>> +
>>>> +     /* Select direct mode */
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
>>>> +                              ADAP_ALIG_DATA_MODE0_MASK, ADAP_ALIG_DIRECT_MODE);
>>>> +
>>>> +     /* Enable vdata 0~3 */
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
>>>> +                              ADAP_ALIG_VDATA0_ENABLE, ADAP_ALIG_VDATA0_ENABLE);
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
>>>> +                              ADAP_ALIG_VDATA1_ENABLE, ADAP_ALIG_VDATA1_ENABLE);
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
>>>> +                              ADAP_ALIG_VDATA2_ENABLE, ADAP_ALIG_VDATA2_ENABLE);
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL6,
>>>> +                              ADAP_ALIG_VDATA3_ENABLE, ADAP_ALIG_VDATA2_ENABLE);
>>> For my education could you tell what these bit do ?
>> Will add explanation.
> Thanks, I presume it's about controlling the internl bus between the
> adapter and the ISP. A comment on how it works would be apreciated.
>
> Thanks
>    j
>

OK.

>>>> +
>>>> +     /* continue mode and disable hold counter */
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL8,
>>>> +                              ADAP_ALIG_FRAME_CONTINUE, ADAP_ALIG_FRAME_CONTINUE);
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL8,
>>>> +                              ADAP_ALIG_EXC_MASK_DIS, ADAP_ALIG_EXC_MASK_DIS);
>>>> +}
>>>> +
>>>> +static void c3_mipi_adap_start_stream(struct adap_device *adap)
>>>> +{
>>>> +     /* Enable to start and will auto clear to 0 */
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_ALIG_CNTL8,
>>>> +                              ADAP_ALIG_START_ENABLE, ADAP_ALIG_START_ENABLE);
>>>> +
>>>> +     /* Enable to start and will auto clear to 0 */
>>>> +     c3_mipi_adap_update_bits(adap, MIPI_ADAPT_PIXEL0_CNTL0,
>>>> +                              ADAP_PIXEL0_START_ENABLE, ADAP_PIXEL0_START_ENABLE);
>>>> +
>>>> +     /* Enable frontend */
>>>> +     c3_mipi_adap_update_bits(adap, CSI2_CLK_RESET,
>>>> +                              ADAP_FD_ENABLE, ADAP_FD_ENABLE);
>>>> +}
>>>> +
>>>> +static void c3_mipi_adap_cfg_format(struct adap_device *adap)
>>>> +{
>>>> +     struct v4l2_subdev_format *format = &adap->format;
>>>> +
>>>> +     c3_mipi_adap_cfg_top(adap);
>>>> +     c3_mipi_adap_cfg_frontend(adap, &format->format);
>>>> +     c3_mipi_adap_cfg_reader(adap, &format->format);
>>>> +}
>>>> +
>>>> +/* V4L2 subdev operations */
>>>> +
>>>> +static int c3_mipi_adap_enable_streams(struct v4l2_subdev *sd,
>>>> +                                    struct v4l2_subdev_state *state,
>>>> +                                    u32 pad, u64 streams_mask)
>>>> +{
>>>> +     struct adap_device *adap = v4l2_get_subdevdata(sd);
>>>> +     u64 sink_streams;
>>>> +     int ret;
>>>> +
>>>> +     guard(mutex)(&adap->lock);
>>>> +
>>>> +     pm_runtime_resume_and_get(adap->dev);
>>>> +
>>>> +     c3_mipi_adap_cfg_format(adap);
>>>> +     c3_mipi_adap_start_stream(adap);
>>>> +
>>>> +     sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>>>> +                                                    MIPI_ADAP_PAD_SINK,
>>>> +                                                    &streams_mask);
>>>> +     ret = v4l2_subdev_enable_streams(adap->src_sd,
>>>> +                                      adap->src_sd_pad,
>>>> +                                      sink_streams);
>>>> +     if (ret) {
>>>> +             pm_runtime_put(adap->dev);
>>>> +             return ret;
>>>> +     }
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int c3_mipi_adap_disable_streams(struct v4l2_subdev *sd,
>>>> +                                     struct v4l2_subdev_state *state,
>>>> +                                     u32 pad, u64 streams_mask)
>>>> +{
>>>> +     struct adap_device *adap = v4l2_get_subdevdata(sd);
>>>> +     u64 sink_streams;
>>>> +     int ret;
>>>> +
>>>> +     guard(mutex)(&adap->lock);
>>>> +
>>>> +     sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>>>> +                                                    MIPI_ADAP_PAD_SINK,
>>>> +                                                    &streams_mask);
>>>> +     ret = v4l2_subdev_disable_streams(adap->src_sd,
>>>> +                                       adap->src_sd_pad,
>>>> +                                       sink_streams);
>>>> +     if (ret)
>>>> +             dev_err(adap->dev, "Failed to disable %s\n", adap->src_sd->name);
>>>> +
>>>> +     pm_runtime_put(adap->dev);
>>>> +
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +static int c3_mipi_adap_cfg_routing(struct v4l2_subdev *sd,
>>>> +                                 struct v4l2_subdev_state *state,
>>>> +                                 struct v4l2_subdev_krouting *routing)
>>>> +{
>>>> +     static const struct v4l2_mbus_framefmt format = {
>>>> +             .width = MIPI_ADAP_DEFAULT_WIDTH,
>>>> +             .height = MIPI_ADAP_DEFAULT_HEIGHT,
>>>> +             .code = MIPI_ADAP_DEFAULT_FMT,
>>>> +             .field = V4L2_FIELD_NONE,
>>>> +             .colorspace = V4L2_COLORSPACE_RAW,
>>>> +             .ycbcr_enc = V4L2_YCBCR_ENC_601,
>>>> +             .quantization = V4L2_QUANTIZATION_LIM_RANGE,
>>>> +             .xfer_func = V4L2_XFER_FUNC_NONE,
>>>> +     };
>>>> +     int ret;
>>>> +
>>>> +     ret = v4l2_subdev_routing_validate(sd, routing,
>>>> +                                        V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int c3_mipi_adap_init_routing(struct v4l2_subdev *sd,
>>>> +                                  struct v4l2_subdev_state *state)
>>>> +{
>>>> +     struct v4l2_subdev_route routes;
>>>> +     struct v4l2_subdev_krouting routing;
>>>> +
>>>> +     routes.sink_pad = MIPI_ADAP_PAD_SINK;
>>>> +     routes.sink_stream = 0;
>>>> +     routes.source_pad = MIPI_ADAP_PAD_SRC;
>>>> +     routes.source_stream = 0;
>>>> +     routes.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
>>>> +
>>>> +     routing.num_routes = 1;
>>>> +     routing.routes = &routes;
>>>> +
>>>> +     return c3_mipi_adap_cfg_routing(sd, state, &routing);
>>>> +}
>>> Same comments as per the CSI-2 Rx, do you need to allow set routing
>>> when a single route in enabled and valid ?
>>>
>> Will drop the set_routing() interface.
>>
>>>> +
>>>> +static int c3_mipi_adap_set_routing(struct v4l2_subdev *sd,
>>>> +                                 struct v4l2_subdev_state *state,
>>>> +                                 enum v4l2_subdev_format_whence which,
>>>> +                                 struct v4l2_subdev_krouting *routing)
>>>> +{
>>>> +     bool is_streaming = v4l2_subdev_is_streaming(sd);
>>>> +
>>>> +     if (which == V4L2_SUBDEV_FORMAT_ACTIVE && is_streaming)
>>>> +             return -EBUSY;
>>>> +
>>>> +     return c3_mipi_adap_cfg_routing(sd, state, routing);
>>>> +}
>>>> +
>>>> +static int c3_mipi_adap_enum_mbus_code(struct v4l2_subdev *sd,
>>>> +                                    struct v4l2_subdev_state *state,
>>>> +                                    struct v4l2_subdev_mbus_code_enum *code)
>>>> +{
>>>> +     switch (code->pad) {
>>>> +     case MIPI_ADAP_PAD_SINK:
>>>> +             if (code->index >= ARRAY_SIZE(c3_mipi_adap_formats))
>>>> +                     return -EINVAL;
>>>> +
>>>> +             code->code = c3_mipi_adap_formats[code->index].code;
>>>> +             break;
>>>> +     case MIPI_ADAP_PAD_SRC:
>>>> +             struct v4l2_mbus_framefmt *fmt;
>>>> +
>>>> +             if (code->index > 0)
>>>> +                     return -EINVAL;
>>>> +
>>>> +             fmt = v4l2_subdev_state_get_format(state, code->pad);
>>>> +             code->code = fmt->code;
>>>> +             break;
>>>> +     default:
>>>> +             return -EINVAL;
>>>> +     }
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int c3_mipi_adap_set_fmt(struct v4l2_subdev *sd,
>>>> +                             struct v4l2_subdev_state *state,
>>>> +                             struct v4l2_subdev_format *format)
>>>> +{
>>>> +     struct adap_device *adap = v4l2_get_subdevdata(sd);
>>>> +     struct v4l2_mbus_framefmt *fmt;
>>>> +     const struct adap_pix_format *pix_format;
>>>> +
>>>> +     if (format->pad != MIPI_ADAP_PAD_SINK)
>>>> +             return v4l2_subdev_get_fmt(sd, state, format);
>>>> +
>>>> +     pix_format = c3_mipi_adap_find_format(format->format.code);
>>>> +     if (!pix_format)
>>>> +             pix_format = &c3_mipi_adap_formats[0];
>>>> +
>>>> +     fmt = v4l2_subdev_state_get_format(state, format->pad);
>>>> +     fmt->code = pix_format->code;
>>>> +     fmt->width = clamp_t(u32, format->format.width,
>>>> +                          MIPI_ADAP_MIN_WIDTH, MIPI_ADAP_MAX_WIDTH);
>>>> +     fmt->height = clamp_t(u32, format->format.height,
>>>> +                           MIPI_ADAP_MIN_HEIGHT, MIPI_ADAP_MAX_HEIGHT);
>>>> +
>>>> +     format->format = *fmt;
>>>> +
>>>> +     /* Synchronize the format to source pad */
>>>> +     fmt = v4l2_subdev_state_get_format(state, MIPI_ADAP_PAD_SRC);
>>>> +     *fmt = format->format;
>>>> +
>>>> +     adap->format = *format;
>>> There is not need to store the format in the driver-specific
>>> structure. You use it c3_mipi_adap_cfg_format() called by
>>> c3_mipi_adap_enable_streams() which receives a subdev_state where the format
>>> is stored already.
>>>
>>> Thanks
>>>     j
>>
>> Will remove the adap->format
>>
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int c3_mipi_adap_init_state(struct v4l2_subdev *sd,
>>>> +                                struct v4l2_subdev_state *state)
>>>> +{
>>>> +     struct v4l2_mbus_framefmt *sink_fmt;
>>>> +     struct v4l2_mbus_framefmt *src_fmt;
>>>> +
>>>> +     sink_fmt = v4l2_subdev_state_get_format(state, MIPI_ADAP_PAD_SINK);
>>>> +     src_fmt = v4l2_subdev_state_get_format(state, MIPI_ADAP_PAD_SRC);
>>>> +
>>>> +     sink_fmt->width = MIPI_ADAP_DEFAULT_WIDTH;
>>>> +     sink_fmt->height = MIPI_ADAP_DEFAULT_HEIGHT;
>>>> +     sink_fmt->field = V4L2_FIELD_NONE;
>>>> +     sink_fmt->code = MIPI_ADAP_DEFAULT_FMT;
>>>> +     sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
>>>> +     sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
>>>> +     sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
>>>> +     sink_fmt->quantization =
>>>> +             V4L2_MAP_QUANTIZATION_DEFAULT(false, sink_fmt->colorspace,
>>>> +                                           sink_fmt->ycbcr_enc);
>>>> +     *src_fmt = *sink_fmt;
>>>> +
>>>> +     return c3_mipi_adap_init_routing(sd, state);
>>>> +}
>>>> +
>>>> +static const struct v4l2_subdev_pad_ops c3_mipi_adap_pad_ops = {
>>>> +     .enum_mbus_code = c3_mipi_adap_enum_mbus_code,
>>>> +     .get_fmt = v4l2_subdev_get_fmt,
>>>> +     .set_fmt = c3_mipi_adap_set_fmt,
>>>> +     .set_routing = c3_mipi_adap_set_routing,
>>>> +     .enable_streams = c3_mipi_adap_enable_streams,
>>>> +     .disable_streams = c3_mipi_adap_disable_streams,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_ops c3_mipi_adap_subdev_ops = {
>>>> +     .pad = &c3_mipi_adap_pad_ops,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_internal_ops c3_mipi_adap_internal_ops = {
>>>> +     .init_state = c3_mipi_adap_init_state,
>>>> +};
>>>> +
>>>> +/* Media entity operations */
>>>> +static const struct media_entity_operations c3_mipi_adap_entity_ops = {
>>>> +     .link_validate = v4l2_subdev_link_validate,
>>>> +};
>>>> +
>>>> +/* PM runtime */
>>>> +
>>>> +static int __maybe_unused c3_mipi_adap_runtime_suspend(struct device *dev)
>>>> +{
>>>> +     struct adap_device *adap = dev_get_drvdata(dev);
>>>> +
>>>> +     clk_bulk_disable_unprepare(adap->info->clock_num, adap->clks);
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int __maybe_unused c3_mipi_adap_runtime_resume(struct device *dev)
>>>> +{
>>>> +     struct adap_device *adap = dev_get_drvdata(dev);
>>>> +
>>>> +     return clk_bulk_prepare_enable(adap->info->clock_num, adap->clks);
>>>> +}
>>>> +
>>>> +static const struct dev_pm_ops c3_mipi_adap_pm_ops = {
>>>> +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>>>> +                             pm_runtime_force_resume)
>>>> +     SET_RUNTIME_PM_OPS(c3_mipi_adap_runtime_suspend,
>>>> +                        c3_mipi_adap_runtime_resume, NULL)
>>>> +};
>>>> +
>>>> +/* Probe/remove & platform driver */
>>>> +
>>>> +static int c3_mipi_adap_subdev_init(struct adap_device *adap)
>>>> +{
>>>> +     struct v4l2_subdev *sd = &adap->sd;
>>>> +     int ret;
>>>> +
>>>> +     v4l2_subdev_init(sd, &c3_mipi_adap_subdev_ops);
>>>> +     sd->owner = THIS_MODULE;
>>>> +     sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>>>> +     sd->internal_ops = &c3_mipi_adap_internal_ops;
>>>> +     snprintf(sd->name, sizeof(sd->name), "%s", MIPI_ADAP_SUBDEV_NAME);
>>>> +
>>>> +     sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>>>> +     sd->entity.ops = &c3_mipi_adap_entity_ops;
>>>> +
>>>> +     sd->dev = adap->dev;
>>>> +     v4l2_set_subdevdata(sd, adap);
>>>> +
>>>> +     adap->pads[MIPI_ADAP_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>>>> +     adap->pads[MIPI_ADAP_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
>>>> +     ret = media_entity_pads_init(&sd->entity, MIPI_ADAP_PAD_MAX, adap->pads);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     ret = v4l2_subdev_init_finalize(sd);
>>>> +     if (ret) {
>>>> +             media_entity_cleanup(&sd->entity);
>>>> +             return ret;
>>>> +     }
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static void c3_mipi_adap_subdev_deinit(struct adap_device *adap)
>>>> +{
>>>> +     v4l2_subdev_cleanup(&adap->sd);
>>>> +     media_entity_cleanup(&adap->sd.entity);
>>>> +}
>>>> +
>>>> +/* Subdev notifier register */
>>>> +static int c3_mipi_adap_notify_bound(struct v4l2_async_notifier *notifier,
>>>> +                                  struct v4l2_subdev *sd,
>>>> +                                  struct v4l2_async_connection *asc)
>>>> +{
>>>> +     struct adap_device *adap = v4l2_get_subdevdata(notifier->sd);
>>>> +     struct media_pad *sink = &adap->sd.entity.pads[MIPI_ADAP_PAD_SINK];
>>>> +     int ret;
>>>> +
>>>> +     ret = media_entity_get_fwnode_pad(&sd->entity,
>>>> +                                       sd->fwnode, MEDIA_PAD_FL_SOURCE);
>>>> +     if (ret < 0) {
>>>> +             dev_err(adap->dev, "Failed to find pad for %s\n", sd->name);
>>>> +             return ret;
>>>> +     }
>>>> +
>>>> +     adap->src_sd = sd;
>>>> +     adap->src_sd_pad = ret;
>>>> +
>>>> +     return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
>>>> +                                            MEDIA_LNK_FL_IMMUTABLE);
>>>> +}
>>>> +
>>>> +static const struct v4l2_async_notifier_operations c3_mipi_adap_notify_ops = {
>>>> +     .bound = c3_mipi_adap_notify_bound,
>>>> +};
>>>> +
>>>> +static int c3_mipi_adap_async_register(struct adap_device *adap)
>>>> +{
>>>> +     struct v4l2_async_connection *asc;
>>>> +     struct fwnode_handle *ep;
>>>> +     int ret;
>>>> +
>>>> +     v4l2_async_subdev_nf_init(&adap->notifier, &adap->sd);
>>>> +
>>>> +     ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(adap->dev), 0, 0,
>>>> +                                          FWNODE_GRAPH_ENDPOINT_NEXT);
>>>> +     if (!ep)
>>>> +             return -ENOTCONN;
>>>> +
>>>> +     asc = v4l2_async_nf_add_fwnode_remote(&adap->notifier, ep,
>>>> +                                           struct v4l2_async_connection);
>>>> +     if (IS_ERR(asc)) {
>>>> +             ret = PTR_ERR(asc);
>>>> +             goto err_put_handle;
>>>> +     }
>>>> +
>>>> +     adap->notifier.ops = &c3_mipi_adap_notify_ops;
>>>> +     ret = v4l2_async_nf_register(&adap->notifier);
>>>> +     if (ret)
>>>> +             goto err_cleanup_nf;
>>>> +
>>>> +     ret = v4l2_async_register_subdev(&adap->sd);
>>>> +     if (ret)
>>>> +             goto err_unregister_nf;
>>>> +
>>>> +     fwnode_handle_put(ep);
>>>> +
>>>> +     return 0;
>>>> +
>>>> +err_unregister_nf:
>>>> +     v4l2_async_nf_unregister(&adap->notifier);
>>>> +err_cleanup_nf:
>>>> +     v4l2_async_nf_cleanup(&adap->notifier);
>>>> +err_put_handle:
>>>> +     fwnode_handle_put(ep);
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +static void c3_mipi_adap_async_unregister(struct adap_device *adap)
>>>> +{
>>>> +     v4l2_async_unregister_subdev(&adap->sd);
>>>> +     v4l2_async_nf_unregister(&adap->notifier);
>>>> +     v4l2_async_nf_cleanup(&adap->notifier);
>>>> +}
>>>> +
>>>> +static int c3_mipi_adap_ioremap_resource(struct adap_device *adap)
>>>> +{
>>>> +     struct device *dev = adap->dev;
>>>> +     struct platform_device *pdev = to_platform_device(dev);
>>>> +
>>>> +     adap->top = devm_platform_ioremap_resource_byname(pdev, "top");
>>>> +     if (IS_ERR(adap->top))
>>>> +             return PTR_ERR(adap->top);
>>>> +
>>>> +     adap->fd = devm_platform_ioremap_resource_byname(pdev, "fd");
>>>> +     if (IS_ERR(adap->fd))
>>>> +             return PTR_ERR(adap->fd);
>>>> +
>>>> +     adap->rd = devm_platform_ioremap_resource_byname(pdev, "rd");
>>>> +     if (IS_ERR(adap->rd))
>>>> +             return PTR_ERR(adap->rd);
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int c3_mipi_adap_configure_clocks(struct adap_device *adap)
>>>> +{
>>>> +     const struct adap_info *info = adap->info;
>>>> +     int ret;
>>>> +     u32 i;
>>>> +
>>>> +     for (i = 0; i < info->clock_num; i++)
>>>> +             adap->clks[i].id = info->clocks[i];
>>>> +
>>>> +     ret = devm_clk_bulk_get(adap->dev, info->clock_num, adap->clks);
>>>> +     if (ret)
>>>> +             return ret;
>>>> +
>>>> +     for (i = 0; i < info->clock_num; i++) {
>>>> +             if (!info->clock_rates[i])
>>>> +                     continue;
>>>> +             ret = clk_set_rate(adap->clks[i].clk, info->clock_rates[i]);
>>>> +             if (ret) {
>>>> +                     dev_err(adap->dev, "Failed to set %s rate %u\n", info->clocks[i],
>>>> +                             info->clock_rates[i]);
>>>> +                     return ret;
>>>> +             }
>>>> +     }
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int c3_mipi_adap_probe(struct platform_device *pdev)
>>>> +{
>>>> +     struct device *dev = &pdev->dev;
>>>> +     struct adap_device *adap;
>>>> +     int ret;
>>>> +
>>>> +     adap = devm_kzalloc(dev, sizeof(*adap), GFP_KERNEL);
>>>> +     if (!adap)
>>>> +             return -ENOMEM;
>>>> +
>>>> +     adap->info = of_device_get_match_data(dev);
>>>> +     adap->dev = dev;
>>>> +
>>>> +     ret = c3_mipi_adap_ioremap_resource(adap);
>>>> +     if (ret)
>>>> +             return dev_err_probe(dev, ret, "Failed to ioremap resource\n");
>>>> +
>>>> +     ret = c3_mipi_adap_configure_clocks(adap);
>>>> +     if (ret)
>>>> +             return dev_err_probe(dev, ret, "Failed to configure clocks\n");
>>>> +
>>>> +     platform_set_drvdata(pdev, adap);
>>>> +
>>>> +     mutex_init(&adap->lock);
>>>> +     pm_runtime_enable(dev);
>>>> +
>>>> +     ret = c3_mipi_adap_subdev_init(adap);
>>>> +     if (ret < 0)
>>>> +             goto err_disable_runtime_pm;
>>>> +
>>>> +     ret = c3_mipi_adap_async_register(adap);
>>>> +     if (ret < 0)
>>>> +             goto err_deinit_subdev;
>>>> +
>>>> +     return 0;
>>>> +
>>>> +err_deinit_subdev:
>>>> +     c3_mipi_adap_subdev_deinit(adap);
>>>> +err_disable_runtime_pm:
>>>> +     pm_runtime_disable(dev);
>>>> +     mutex_destroy(&adap->lock);
>>>> +     return ret;
>>>> +};
>>>> +
>>>> +static void c3_mipi_adap_remove(struct platform_device *pdev)
>>>> +{
>>>> +     struct adap_device *adap = platform_get_drvdata(pdev);
>>>> +
>>>> +     c3_mipi_adap_async_unregister(adap);
>>>> +     c3_mipi_adap_subdev_deinit(adap);
>>>> +
>>>> +     pm_runtime_disable(&pdev->dev);
>>>> +     mutex_destroy(&adap->lock);
>>>> +};
>>>> +
>>>> +static const struct adap_info c3_mipi_adap_info = {
>>>> +     .clocks = {"vapb", "isp0"},
>>>> +     .clock_rates = {0, 400000000},
>>>> +     .clock_num = 2
>>>> +};
>>>> +
>>>> +static const struct of_device_id c3_mipi_adap_of_match[] = {
>>>> +     { .compatible = "amlogic,c3-mipi-adapter",
>>>> +       .data = &c3_mipi_adap_info },
>>>> +     { },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, c3_mipi_adap_of_match);
>>>> +
>>>> +static struct platform_driver c3_mipi_adap_driver = {
>>>> +     .probe = c3_mipi_adap_probe,
>>>> +     .remove = c3_mipi_adap_remove,
>>>> +     .driver = {
>>>> +             .name = "c3-mipi-adapter",
>>>> +             .of_match_table = c3_mipi_adap_of_match,
>>>> +             .pm = &c3_mipi_adap_pm_ops,
>>>> +     },
>>>> +};
>>>> +
>>>> +module_platform_driver(c3_mipi_adap_driver);
>>>> +
>>>> +MODULE_AUTHOR("Keke Li <keke.li@amlogic.com>");
>>>> +MODULE_DESCRIPTION("Amlogic C3 MIPI adapter");
>>>> +MODULE_LICENSE("GPL");
>>>>
>>>> --
>>>> 2.46.1
>>>>
>>>>
>>>>

