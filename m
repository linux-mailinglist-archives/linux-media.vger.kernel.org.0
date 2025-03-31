Return-Path: <linux-media+bounces-29046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65312A76493
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 12:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4BED1888368
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 10:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF881E1A08;
	Mon, 31 Mar 2025 10:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="EACzoH+G"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2126.outbound.protection.outlook.com [40.107.215.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FAC1E04BD;
	Mon, 31 Mar 2025 10:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418426; cv=fail; b=fJwKuYzRQ0vVbvSWXgtRbT+Jj/1k5TsSc/DSk41u1wCU16VB3atNhGBB6TVy4vakibjIXJi1LLyo2E7Q5iOF9X5fbnGPq7162kfQ+ppZWp8qiUd/lbYaOGXs5GFyCSZ4j53a+hkeEFLaY0r47lmNX1oWpTHtlpG5AbLUcury27g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418426; c=relaxed/simple;
	bh=d8StOTtrFnUMa1TXrOUUE8U+aRNKnwJi0kXS+S21CTc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FUHONdD7Kn9dGK57H/QBaSZnxO8FVM4n+vVXkI141CWtDQ3UeS/1zP4NE6Az8JEm7cPmxRSwK7QjY06OTTFWLN/PmqU6aCWWA73CLcN0pAIMg6+vkSswcFxuj7cFbiK1DwEEU7FAi4GUJ/zo/eQ0O+XT0NaSjQyS0ACnAQaMGek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=EACzoH+G; arc=fail smtp.client-ip=40.107.215.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvHbOFbzg7OnFA/p9aMynTcDO2qPnFr8X1s/B6LXnBCbRDkkh9IhAPUJhfcPqYLCepgS7itEgltm77m3N0u+oBR9Or4tf5gij8iDixYaT4ZEyP1JXEqCbYzYSqfk+ArGt/Tvc2B3C32W/WdwxT2EUc9KfipP73Iyikk4FLb77VQqV0xARiHEE6wLBKU9SZ0SlY7yY1bvCjtsaN4077SZkbJU82iIy/UA1HO5+Kmv6MCQjNyKm0Uutyi3SDkCHy54l1Zf4wl+Tu9h+9lDAGjErf3ue3fO6468WSvi/7T6GeMw9vfEyCMP1XWbppl0xHxcA3NHhJyg5V3K6Um7Pk29Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8StOTtrFnUMa1TXrOUUE8U+aRNKnwJi0kXS+S21CTc=;
 b=KniUxGK+ucNxJkjr+Moj2fdTXyv9Jr5IqvgADVzgDJXSeDZtShXdykTGzSTaDtu5F+znmS10cDRz7fgyy05K6JjFFLMyLv/g4+wrQ3cS3s1rVt8wj2ei9HELerv2s2KMQ7tnLF2Bt5IvB/v1zkgY66r3LOQOjj+dFgs9Yr8v2/vpQuki3hYwtGfq7hpZUfnTYXWWtw6A/ueP7YRA3CP9NO2RWwFglkk8hbdvAH4PZs2RrxJ7uT97pswZzb26zt98psJ0TIYkw59iD6OY+SOE5f7LWkWBNSv3reqlNbwB41yV6whTGFH+Qa/Jp9fA88sen5w7pYsaBLTo8mGaLrCiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8StOTtrFnUMa1TXrOUUE8U+aRNKnwJi0kXS+S21CTc=;
 b=EACzoH+G8jljYrWqw7CmeQfwfq/JeczgseW5UDgm/43gBqcmbiwI3jthVyehirs9/Z6IgVgv6TDtDklMiJMkzBUhUQMJikPNNVkLcBGMhsF/CRkX39/Gi9VsJquTxQz3dKZ2VOJg8UMoa8UarLMmLOpJR77t5tat9dEAmPCGG6FRya7ShJ8qU8/xp0Hqf0mjumNhgduJme1jDdMucTt6gioM36AXNi2CJ3/qzzDUimoDuYWLTbN/MH3GH9mBsijMu+sDZTQsG/ghPDZK+kSEUcVfz3ykN4knJ+/5F++RqmirKvIXzN4ByTYsosDHoJpDySA2Aa6utrI0qe2XL9M/Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYZPR03MB7130.apcprd03.prod.outlook.com (2603:1096:400:339::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.28; Mon, 31 Mar
 2025 10:53:40 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%3]) with mapi id 15.20.8583.036; Mon, 31 Mar 2025
 10:53:39 +0000
Message-ID: <78674bb4-925f-4b1b-939a-7fc2adf1de64@amlogic.com>
Date: Mon, 31 Mar 2025 18:53:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 08/10] media: platform: Add C3 ISP driver
To: Markus Elfring <Markus.Elfring@web.de>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250311-c3isp-v7-8-c3551bed9005@amlogic.com>
 <6ff5acac-4d41-4d4a-853c-9902e9673ef0@web.de>
 <e99da06b-acf6-490e-b39a-a283bdb2415b@amlogic.com>
 <eb8dbf9a-50c9-4bf4-b967-d6478caacaa4@web.de>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <eb8dbf9a-50c9-4bf4-b967-d6478caacaa4@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0220.apcprd06.prod.outlook.com
 (2603:1096:4:68::28) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYZPR03MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: bcdf1d7e-33c7-4b32-8094-08dd70424b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVBucHp2bVRjYklkR2Ftb3MrUnBlQjZRand1U2ZmeEVmMFdMOFpTMm93aUVU?=
 =?utf-8?B?SFNTM1E2eTF5RmcrQXZHcVBVQ29VN05rL1hna3JGYUhyT2R3Snk2T01kZXMw?=
 =?utf-8?B?Vk00NW9hVXNNZVJQc2hLOWthU2pyK0k3d3JrUnUxYzZGTUtmNUZFL2dCRk5Z?=
 =?utf-8?B?ekpwcmhWR1NzWW1rU3l1UjB2bDMrYW1iK3Y4eGdJZVpZZzVsRlgwZm9Jclh6?=
 =?utf-8?B?dUNZN05RY2I4Z2E1OWY3SU5jU1pMZWFPV1gyQVFSdUwyeFhNRk1xM0VELy9I?=
 =?utf-8?B?SXE3U3A4alFsbEVmR1J3VWltSnFLazNkODArWXFpTUFPNU16b01qR3JRdWoy?=
 =?utf-8?B?Zm5YaGxFNDkyT0RieEhCcmxSRVE3TXh5Ris4V0ZHTDJhNHF2R2RGOGVGUEpX?=
 =?utf-8?B?czh3eGw3U3B6YkFJTStkL290OHhMdncyUXNNMzZPa0szS2srbUxVNTJCWHd2?=
 =?utf-8?B?R0RIVkZxVEk4TXViUU1aNnd4ZWtqK0lObU5NemNvMVowaENrMW05Z3dUZFoy?=
 =?utf-8?B?MjZXMUpOYTNzT0JHYmhHeERNaUt3anozQ3lCK01KZmdiZjlESTNURklVM2xF?=
 =?utf-8?B?cGFGbEtyWW94bjVabjc1Z1A2OVZpeWR0aXVVRFYrd2IxaXFucjk0TWlCdmhr?=
 =?utf-8?B?c0lnSW1kVjR4REMzSmVqdWkwczZwdGoyYWxHU1VZUjRGanBYbWFJc3ZTTXE3?=
 =?utf-8?B?VWVOSnhIaXYxMHhiWHQ4WGlnbzlSd0loTkg5SUlVSXJxeFRSdml1a2FNZnpu?=
 =?utf-8?B?T0k3Z2xpUFV5bmNSeGpvOWtPcjhuWEhlU3A4MFhpN25sQUF0SC95dmNXQW1n?=
 =?utf-8?B?elZ5QkNla242QTlDbjczZ3ZxbllsVHJGMEpUSjVCeFdJK2lYeElGWXlFbDVr?=
 =?utf-8?B?WngzU2NTRW4zY2M4eEU0aldiMXZsS3ZUOTRhNHpuMktxdy81Rmg4Vkd2OTlP?=
 =?utf-8?B?N0JoL3VGeW9EeUhERUpucVBiTlpGRFpYRDhqeHh0Z1k3U3pUU0NuVVBlZk1N?=
 =?utf-8?B?VmpnVDYvY2s0V2NHZFNtbjE0NVdqS2xiaytsbFZyNW1wemFwL1ZRMDE1OFp1?=
 =?utf-8?B?Rm1SRHNUNmF3TzNYa2RrUXJ6OFZmUGtpMUVBVlNqbkp3STZxY0NBWFh5K1NN?=
 =?utf-8?B?eEtDNUJ1TjlBOC9oa2huQW5xQ2crUnQ0TXhQbHpDSEJsV2dhQVVRL21tNjlN?=
 =?utf-8?B?RFRpL3BJZTFUa2dZcGRlZ2lqT0lTSUJUNGEwWWdhWmRjT3RINGV1MytXemYr?=
 =?utf-8?B?djVhVDh2Sk1NM2NaTzFPNUZrVWpzODZDeERVNENTdWp0ZkU4VDlnSHlhb3Zi?=
 =?utf-8?B?VllVN1RMNFd2UGlIUFZxVXlJZWdubmx0SDFKSDBVQXFpUXJxOVdhWU9JamVV?=
 =?utf-8?B?eHlNYXowMjdKcDkyR1JzTjV2UUM2VFcycEtOSHNwaHNoOGVETWdaOHp0aUNm?=
 =?utf-8?B?bHhZcXgvcHpKVU9relRnWEZzSGFwTGN0anlqaGFxUUk1Z1ZISzNsZmVhdjY2?=
 =?utf-8?B?MDd1djdsZ1FjeG90Yy9TenpCVGJVY0JRd0FURDExYWRCS21zZ0xheXdJTFgy?=
 =?utf-8?B?R2pvUkxpZzhOQWkrZEU1ZHhodFpYekNNTTlKRndBeTcvRFl0NHRoUzJjblFx?=
 =?utf-8?B?djFHa1pFK0pYNkpZMmY2UlBhQ0FMNktpbWdUQzdOTXluTDVPSzVGYWdXZlcw?=
 =?utf-8?B?by9WNS9hMkpaeHdpQkJROWhEbldNU2VrK1loRm9VR0FydjBaaWt5UFlGOEln?=
 =?utf-8?B?SDdoN3pGOHJFUllscnpwZENVbGtlemh3Y21jWVAxQUpGOW9TcGhoSkpZWFhX?=
 =?utf-8?B?emdxUm9XdURXMVpYSkJzWTVtWmJOWm5pMUpzM1d4emRzMUxqbjNSNW5kbUVP?=
 =?utf-8?B?WVRPVXRuNGFDN3g1blhDL3ZubFV4b2Y1RUQ5VlQwUEZLR25pSEZ3d3Jialk2?=
 =?utf-8?Q?/lIAVanMpnQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVllWG9GZ1l6N1FWcHRaNXI5cml1OGVRWXo3ZjB1VjZiWFRGaHdOUVdXMW5P?=
 =?utf-8?B?NFFHem16bVBQQVFHUkxsZFJlMU56RVdPUmdydXRQMFl2aURCUko4VUlKdWFN?=
 =?utf-8?B?WW5nampwaGswcHY0NnJYWWdQdFhFTVIzL1VsSjdCMU1zMnoydjNUMXJPdHpv?=
 =?utf-8?B?ZVB0bWxtYXY2ZUsvdWhNcktQc0FtSFk3YW43QkxrOUVqaEl0aFdKNHNPVHpz?=
 =?utf-8?B?MkovRUVySXpxT2RUK05OSVh6cmdaL3pmSGhaUXN3bmM1Yk5jV0JkRVl0TzVJ?=
 =?utf-8?B?Z3BFN200TDZTVnRwUkVRQXp3NGp5MXV3NTFUc1IzZGJKejRmTVJVZXY4VmNi?=
 =?utf-8?B?UENDTHI5RVBmNHEvZVBtVzMyU3V1eS9NQVVWRGhjTHI3YmRqSnhKaFhrNWFs?=
 =?utf-8?B?SWJFWXZINjhiNFAvRjlSUG81WW1PR2w5RUdVQzJFbFkvaGpXbUlhUGU3ZGpQ?=
 =?utf-8?B?THc0Z3VzZCtBRzIwRS9BQ1kyZlQwdWt6ODlnWTUvNGlTNThYdmVIQkZSTGJC?=
 =?utf-8?B?Zm5hZ3BQSlY2VHFySy9aQ3NmZVAzVEtqUEpZdFBBVFBrRy9GVnRRTGNPajMw?=
 =?utf-8?B?dUJnWjdTVkc5UnBXdUpaT3BNc2ttMGE0ZjVaeERkYTcrQSs4bExid3VFZ2NQ?=
 =?utf-8?B?TDJ6NGlxVzk4aU1CQU5BQ0luWm1ZYUt6WmljUkRVd2tBdjY3aGFCYkNkWlNx?=
 =?utf-8?B?aFZ3L1NVTy9GRGRMeEtpTEs5aWVnaGEyZ0pnSXRtcmRMd1VFV3RIWUE4Kzkw?=
 =?utf-8?B?Z1Z0dGF1UVhNL3BSc0dZM01SNGJBMkM1N2R4ek93UU1jVnpZSWRBWFplelIw?=
 =?utf-8?B?M1FGUG4zY1YxYTNCZVdMN2V4RmhOa2ZRQzlSclRSNWU5S0FrdW9zMmYwUVpl?=
 =?utf-8?B?UW5qa0FyS05yWVlpOW5EVUQrTzh5WHBCVHprbGF3S0Zjdjc4cCtHdHE0bmpF?=
 =?utf-8?B?Nzd2Si93M3pnUnRlQm1XQnRuTkRnWUJrbXVzSStQV3RJVEd2WlcrZE9sQWhV?=
 =?utf-8?B?MHNobmt0SnJSNHZDOE5aT0k0Q1NwamF2KytDRGpCWDdYVWJZZEJiQ2dqSnRX?=
 =?utf-8?B?b2xjZU1WSDg4NzQzdWwzMk5ZUHcrbURzSThOcUFGNXdzQXhZQTJMclJvVjNo?=
 =?utf-8?B?VmR0NUQvditlbmRBRXZiVEpsT0VGbGJwNnIwWThtVXVVMzRpQUk2THloaTRC?=
 =?utf-8?B?dVlTN2JxNUdPdUQyRG1ydXRPZmNwMXpZZW8rbk0zb1JuV1hoakdZd0loNzF5?=
 =?utf-8?B?cW4rMVczV04ydHNwS0tLQXdENEhjcFJLMEo2YUY4c0d4bEZXeWpxRXc0VFQ1?=
 =?utf-8?B?OFZOa0tLU3pNVWpWSm1LM1RJbEh1bWNkUEJ3VEdHU1JRVWVQbzYxUldLa1Bt?=
 =?utf-8?B?ZEM4ZlR1REF4ZHZKOEw5M0dpT0wybHdPL0VkUFlEOW1SWTAzZXVmb1lnb1NO?=
 =?utf-8?B?aDQvWmxRNTFveGhwYzFGdnpobTFjc1VHRWpCbUdsWjFlb05DTldTNFVKWTdm?=
 =?utf-8?B?OHVUQ2kySlRPYkVPSE05bkhuM3lBRlovRm1ycWI0MjFDQ1l4b0FCdjZHNEZk?=
 =?utf-8?B?ZGo0MmZObzN2WVpjTElqN01JQ3VWaG43SEFjbXVZb0RqMm9OS2NNZ0VnUzhz?=
 =?utf-8?B?WVBhRS90Nis2N3UrYlppbWNYSkEzVkFDd3lwNG0rVGhDeVJlYzVPNGxOdW8v?=
 =?utf-8?B?amRaVEdnY0NMandNM2V4YzQ0MnoxcXFTa0w0K3hETzM1RHQ4VEg2bkZlNi9h?=
 =?utf-8?B?MDl1TU5rUHRFR0VCM1h4eFhBYTU0OVZBSmFoazdYZVhyTFVCUHh6SGlkTTZK?=
 =?utf-8?B?Z1RCaU9XTlR2SHZlZFRYcGtqY0VycDNCaWdQb0JCMXBUcG1ZT0IyK1ZEbE5D?=
 =?utf-8?B?N2VtMjNpeW9zYTFXM1lPMlR1VTFHTit5NVR4WmNGdE5ubUtIL2RtWVFjSGNM?=
 =?utf-8?B?eG4wZkZrVWs4THNUL2Z0MVhHaXZTRlhpMUhWcG5HNXl0ZzBHMHkvNXhQUGVl?=
 =?utf-8?B?V3BrbTVnQ3c1MkhpOXFIKzB6cm5Kckg2L1R1VDgvbWtWSVAvODVNVTFRYi9J?=
 =?utf-8?B?MHVQSkdwZCs2U21CRS90dkh6ZjZHK1dFK2RVYlhETDRpWXVLekJvS3drN2p4?=
 =?utf-8?Q?bYl6+xG9QTwPo3qPsauMj7Uwg?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdf1d7e-33c7-4b32-8094-08dd70424b67
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 10:53:39.4117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oacdm2w4nAWDPQlfL7Dp0vpmZGtkHmok9GwNc70VJvmY1lr9dkbUoFlO9E4WS3PWJAjE2WY4rjnpxVQA/JqJ1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7130

Hi Markus

Thanks for your reply.

On 2025/3/31 14:10, Markus Elfring wrote:
> [ EXTERNAL EMAIL ]
>
>>> You may occasionally put more than 60 characters into text lines
>>> of such a change description.
>> Are you sure the character limit for a single line is 60?
> It seems that you interpreted my patch review for this issue
> into other directions than intended.
>
>
>> I find the description 'wrap at 75 columns':
> I suggest to benefit from word wrapping adjustments accordingly.


OK,  I see.

Will check the commit message.

>
> Regards,
> Markus

