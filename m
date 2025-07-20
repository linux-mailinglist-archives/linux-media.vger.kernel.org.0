Return-Path: <linux-media+bounces-38120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC5CB0B7DA
	for <lists+linux-media@lfdr.de>; Sun, 20 Jul 2025 21:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3DA2178B78
	for <lists+linux-media@lfdr.de>; Sun, 20 Jul 2025 19:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E3B21C190;
	Sun, 20 Jul 2025 19:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nOa3RFBv"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3065208A7;
	Sun, 20 Jul 2025 19:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753038141; cv=fail; b=ZfJpceLb+ipwWtAC2OxidS+cZUjWCcrCwpOrzVI/sN6KZKfg3P0hBe8GVpUn/D4RFBgwK8a8V6DYqiS31UJa+4YhFvah+GaleAEtVhIOARtoVK/7MqKPX4zR6bg1uZVzPNduSVS9TCbG9a5WFb84JN93UhYrVObEyDcBV/0orZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753038141; c=relaxed/simple;
	bh=0GyzglOlFqY47MjnXkNtsLn/Z8KlyzccF24wV8lM9ug=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tsOZVXOrHtNH+9d67sSyOfoCZvZSUMXOeXy0nBfsVn0+DaVcpPYc9Fxh0KRfgSN2sl8bQqOzdeKrEnI8yF/wMbpzKu9h6RSl+Vk8AHXQyDd9RsW1EAjhFePvoUOuFH7DHiCcwfN11sDGxj/XW5A05e87QhTBqTcbidzJGEaar7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nOa3RFBv; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIojQJhhti9VETJDsn51RYREpKGILKprssfE68rTs209MlZS57t7wPJevA5BsIsQOPSyq6Vuzw0bnQjSXXBFPhm5ZH0JKBBjHa34u/OwVczHseQbaiL9E9qYPZz5/UlVV0WdzxhGwvnyIeTXP9rExAzgPRO/CiIANdfAyPB6C2WVKWuLKJ9xnmutL7lB6b37Jj9pIQXOEjyFqYEtnZTmcbC95Y2mL4u6U0EvQhw/7K7cCVPjJ43zkzWPIJinsMIdcpAwViZk33B9ITO4tLixJL1kfh4sUZEKpa/sAlh3At3dn2b/jYAkAoIGGjXkc2+VVfgQYVbyywGi9RHeYjJdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIuwK6NvSPBDpDQzPz3DJlzLGoY77RsquHnQkxv44Ug=;
 b=m8MggMXb4kMobblYxkVSZqJrWsHwTIm7CaoVkO9jzH4K07kRbPwVJAZtpO8+uR56uFDhcl6DFkcSra0fu2ovZGhWI0cTZn06OkAnbLb7AJbxx9hCK4JFd7miyG7VUD6HQ7EhsCntfyVlRkdiTGCP8NmbUkVO72YDHbslRjwNkuyJKyVNAOM5moeiAanUZZ7WEzGNLjdrfgmTRI0YAlfk9d4wv7hYQsi72I6TGyXHJ2vO5D5XgE+SzbbIKhwzFHCJt7/kmaBnkl5jB4sDednXQ8Fzvfr8jm2RtDOUz9gpiAqSg7PX3m+zXYKj1YJoOXkvRKfti7Zl3rSKayZv+K+rOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIuwK6NvSPBDpDQzPz3DJlzLGoY77RsquHnQkxv44Ug=;
 b=nOa3RFBvlpgN3+uN9kGRmg6LiI+y98Xa6czPmBQJ+rX+JOgqsajyKHrBKpYDy+PbbhjtyG62cP0jy6AdIPORZEozd+NOYe4kyH6VSWNh2pxyh0GU6DboOqOhqipgcP7b9mNk001QnAKtJlriENEEaAH/BGbF00n+7iukshzXtFbCU6PA5fu2a3qqYnwJeOsPkkX+FwxIpqUTsWPkclUZgNTXrUUbJvrIziUyq2BUJIHNayG1jMOUK61xswV2efkHeMam5K2hJ5/4+f5+GTAvZ/xgGQCNAz7YJl9aBGeBfEkxHBbuj9AFDGyvktwE9Ns8nyZR+kskBjHIOncRyETUKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB8335.eurprd04.prod.outlook.com (2603:10a6:102:1c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Sun, 20 Jul
 2025 19:02:15 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8943.029; Sun, 20 Jul 2025
 19:02:15 +0000
Message-ID: <fcb87e2d-5ddf-4f33-b5f7-5af67c438af5@nxp.com>
Date: Sun, 20 Jul 2025 22:02:13 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [RFC 2/2] Documentation: media: Describe exposure and gain
 controls for multiple captures
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, ribalda@chromium.org, jai.luthra@ideasonboard.com,
 laurentiu.palcu@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com, julien.vuillaumier@nxp.com,
 celine.laurencin@nxp.com
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250710220544.89066-3-mirela.rabulea@nxp.com>
 <20250716000738.GF19299@pendragon.ideasonboard.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250716000738.GF19299@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0047.eurprd03.prod.outlook.com
 (2603:10a6:803:50::18) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: 23eeb8d8-9f51-41aa-b5b6-08ddc7bff10b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?b2NwN1pSbmNXSXBpdXVCays2VGtIRzhEQWdUUlZYNDU3MlJJclVibzJEdXdX?=
 =?utf-8?B?Zk81NGpNYzk3SXZpSEcxT1plaDBBdVJMY1pML0dVSnFtMWhwNS9kMnpTRVpy?=
 =?utf-8?B?UFIyMTNpeXN0QzBQUHY5amNrV1RFaWlHSnFpeVRkQUNlMUwwdTI1WVU3b2FJ?=
 =?utf-8?B?bUlNVDNZN3FpWmVhQXFzRDFzaWpjTEJjQ2pwSlIvSmdEVnRzSmQrN21jYlBB?=
 =?utf-8?B?NVJCQnMxckgwUGl0RFhZNXRLVnhLQTBDcnJvcmJQSHByMGFyNVZRVlhxSXJu?=
 =?utf-8?B?VTNlazNhZmJLb1N0eG9obEV0djNFR0dZczZuSnU0eXc0dmFoUytQTEhScUpx?=
 =?utf-8?B?R2pLb1VYcjNMSytQb0V2UXVCclo4K2Q0YmlIR0lCdzh2Uy9QTE9OSURRaEpl?=
 =?utf-8?B?dG50dWNaQmlqYVdvODFuUWFhTElJaVJ4WFB5WVpGdHk4ZUV1Zi9YNUdQb0d2?=
 =?utf-8?B?SG5EN3B2ckVSZmZUd1dHWmhaQVEwQysvUy9oR1FHbmpCaXFQbjZhQ2ZCRTYx?=
 =?utf-8?B?WjdwVnR0Z1IyaTJ6Z2NIWXA0bUM1czNuVnhuREkvdjJxdkpjT3lNa2dUMS9a?=
 =?utf-8?B?Q09YVGh4djdJQXhrL1pVT0V1NVVKTlN4d2hvamxaazVTclFqakZoUFRkWnVH?=
 =?utf-8?B?RCthSXFiRXpMeEhVbkh4MWkzVFdPQktqK2llMk5qa0xpd29hWkIyc01hN3I5?=
 =?utf-8?B?RVZmbm8vd1ZQZi9CdU5uVnprd0NCclMzUDdrRElLV1EzVHpkUU4wU2RGRDFs?=
 =?utf-8?B?MW9UVk91RVRRWEV6NHYvMFk2dTZxdmcyMnE4R2hza0hNWGFyUFFLSzNLTWhH?=
 =?utf-8?B?bjc4WG1mTEZkcEZjRUpvTGxzVUJscnpNbmFFL2g2RmwrcHdKWnBCMUVMQXFp?=
 =?utf-8?B?SEdRSDloZWZnc3ZsLzBMRURla3dUcUhGK1BVY3phNzNwZDFNbnJJMVVZRTRw?=
 =?utf-8?B?UlI4UktyRnp3UGJZaXUxZmsxSkxGK3hMZkNseTdEYlZHNlZxK1NHWEh6TmYr?=
 =?utf-8?B?c1ZvU0pIbXgxb1VOd1lvWS9zazJ1dFBuWWdKeTVPZzk1SWJ4ZlBoa0dUbkpS?=
 =?utf-8?B?clFPTnNNbFY4RzdORnEyTEVUMkJLOG9WL3NGNFZRejlEOVI5Q1paZnJsaHBY?=
 =?utf-8?B?bkJYMTd6RUFPR3BKYUpxUkpJTXNJTnZOZG9uOTZ6QzBDbTB3RmxabUZraTh2?=
 =?utf-8?B?RGRUdkY5RHdTcmNiQnhVS2lneDZhZzJpQzZHckd5V0ZYbnRFZ2tBYUlDc0ZL?=
 =?utf-8?B?ZXUzaHRSSm5ZQ1dROC85OVdBNzNXVG1zMnJDcXZTTUhLcGdJbkxRRzY2RkpT?=
 =?utf-8?B?bVFRRFpWa2R0NUNtNTQwRklvbHFHQ05yWHhGVmxsVkpYU2hnaWVRUFdFQlYr?=
 =?utf-8?B?YVhRTktQYTNLamR4b1pJS1gyZGh1bkR0UVVjSStXSzR5bVBDZUVIKys0WGxW?=
 =?utf-8?B?M0t0YUcrcXZBaVA1TWdqRDVCOFdXRGtXTlNGd2lISVh6a0dDb3dXTms5cGpO?=
 =?utf-8?B?eWlOUzJmaFRYb3pSbFUyK2J4WWpQQXV3RnhJRzhuL1lWemV0NktDTTVuS1Jw?=
 =?utf-8?B?bTViVnNUUTVkTVYwUTh2ZFlLQzBTQ1JrNk94dklWNFlxdWkwd1krSk5xWEts?=
 =?utf-8?B?NnQrb29BbDlwelNmR08xajYrNDloRmxCTUJCZStkdm03QlFwNjZHSXU3elNw?=
 =?utf-8?B?SllQTlR0RWVwUW1rMFBvMDJJUVErOTNpMkdJWG5hcUdxR1VDSVBIVzdPZDhy?=
 =?utf-8?B?bTBIQXdNZUVaN3RSV2xKTUVXUjFxamZlNE9MMlg5TmR3SmJPZFRUQ0lad29G?=
 =?utf-8?B?M3dVR1pNbjRUZXl4aytxaXpIM3pYaCtsMk40SkJyTWxCOXdIc1FiZXF0S3FL?=
 =?utf-8?B?S0dDVzFwMFJFMENTNHZFMnk5cUNZeFVnckJoQ0xuZWJMUTZuN3MyK2NCZlgz?=
 =?utf-8?B?dXlKT2FDTlBEc2ZzL2x5NHZBSVc5dmhFak5Hdkg0Yjh5VDZQZk1qdmVtbHN0?=
 =?utf-8?Q?PXHN5ywIgyqLI7G61zi9YFG+noCtQo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QVRmTndmcWpGaXRSOUpGTWF2TnozRWgzZVJONmVRNjlFVmVPcC9SUHE3U3R3?=
 =?utf-8?B?eWdhN1gra0V4cVZRRUpKZy9HSG51dVBJTkNSeWw2NEJRb3JUcGlnMzIrWjdz?=
 =?utf-8?B?enI3QmZFNjFGVng5UkJGeXdKYkNhM2tHbXhFNWVUMjl5d3pCc0FKZnhuTExZ?=
 =?utf-8?B?MkJ6N251ZEQyVDlQZTVHcCtNZDVYcTMvcnhJRnVTb3psOVhqUzErc2NrMm0x?=
 =?utf-8?B?M21WTHNxSE90VGszYW1CRUF5OUQ3d0x4bFRRdkJwM29nWXNPMEdrWXNZRkR3?=
 =?utf-8?B?aXkyK3NGalpueTkzc25INVpmMUN6dCt0RTBTODVhbmlTSVFIdUNNandnemti?=
 =?utf-8?B?blFCdHQ0VmxOMEZYZytVTnNxWWIrT3AvMXZYbXg2eUhGVEF1L3VaR2IxOU1Q?=
 =?utf-8?B?dFc1dHBOWXhjUGQ5UnJVMDJNbm1iN1dWRHNycnY5OEYrUnNBVVBLdDN4ZDZq?=
 =?utf-8?B?VEtaVHNkbVNtelZNOEhyQU1SRVhIMmw0VGoxMVZMaC84OVhUMHBoRzJEWmEw?=
 =?utf-8?B?UFE2bWlXazlFYlFDOEZoTVFUZjhwTi9qMFlIQTNjVmJvZlU2N3I4YjQ3QlAz?=
 =?utf-8?B?TEtia3RiaTFnQXVSSlNNNU4zamp0ZmN5M0ZvK1NmbHNsUXQvRGFWZVJhc1lh?=
 =?utf-8?B?QmlnR0N5SGRjbzJLRnpOQlZTNFNDQmFUNmFzVU52YU9wdFF1T252NkJGTGcy?=
 =?utf-8?B?TW9ITmZvOTVkM3A4QzlmWk9rRXVyeWsvUTVKL3Nib3Zhc0liV3NXL296cThR?=
 =?utf-8?B?bFpCQkdrWll4Uzk0ZVBGSFk1STNmUXVCam1MVTNhT2w4cnE1NHJjTVRlZDc2?=
 =?utf-8?B?WTF1TEw5Nmo5N0ttTVZqellCK2xJYm9ZeVAxVFd6R3VNK1VucmdVNkFOM0dw?=
 =?utf-8?B?OUFyc1hyQzFUTUtsVUdYUE1Ob1NJSDZJa2l6NFlxc29KN2xIaDR1c1NLMTRI?=
 =?utf-8?B?Q2VlVnY4RVZVSWlNd3VXRmlZbHVDemFGc0MvSGhqbm0yalVMZEwwQnNNMzFG?=
 =?utf-8?B?MnRVbEFKVnA4OXZLR0JReGNhNWdKdlVVZTZXNmVvbC8rN1pSMi9rUHhDRXFS?=
 =?utf-8?B?ZUVUekZHSmQ1WDltVGtXUHR6NGh4dnp5QTBlcnQrYndDQzZLNGJpQXo4QVBL?=
 =?utf-8?B?Y0x0MlVpUW9NOWp2eU1CL1JSeEpvQ3ZIQVZCdk1ESi9PMXk1ZUZEWUFxeHBh?=
 =?utf-8?B?NmVZRXBvOTkzY2pKZE4xdnNDSkhNa2w2TG9qUVBBYVdUYm1idzVqeUllaURS?=
 =?utf-8?B?bUhLS1ZHb1ZMSlpEdmp5cVF3TzlXT1dlT2haUkx4VzJKbWptVHNXUkg4Vks1?=
 =?utf-8?B?L0xnVCtGWnhkRG8weldxVkQ0a0hLMmp1VFVaNmkvM3ExUVhUaDU4TGYzcllZ?=
 =?utf-8?B?bStzaGhzOU4zRDk0MG5IZUVudE1qcXNyK2p3VHpWMWh1YjNjd3l3RkdDMU5X?=
 =?utf-8?B?eGxlOFMxMnl1UG9hNzQ4L2NjbkR5RmVQRTNpcU5zR2MzQ0Zrd2J0czVGMlU1?=
 =?utf-8?B?cDVXMzBZODU0WWdUbkIwWC82YnJiR2QxV05GMVl6ekZjWXlJYWVkS2dnVmlR?=
 =?utf-8?B?NDI4ZnEzcGp4U0xSdGVBUmpxSUNyQ1FmOU10a0pTdHg1SDVvTmo0SXpxZmlw?=
 =?utf-8?B?Q3NCV1NJTXExbExadDFKdXJFeElXVHZWdjNjT1FOaldEOEF5c3c4R1UyemNM?=
 =?utf-8?B?OTFtOU5UV2Z4L0ZOVm5CTmVWNmxHTS9FS283MHF6ZVZhYUFtblladnN0VTNl?=
 =?utf-8?B?eCtUdGxMV1R0N096c1JRd2luRVZOWEQ5N0g1aU5OWVJwRVNnTFc0L0VIQTBV?=
 =?utf-8?B?V3JDUm9OcGlpSTZKMExkTGlvWEZmZXZTS2RWTU9KU0FQcFJ1RmJWT3BhWnQ1?=
 =?utf-8?B?cE8zSldsQzY3dlhzUUlFRjBWMkM4U21CNTF6WS9vRlRLNWh0OVg5VjUxYXVG?=
 =?utf-8?B?aHdTdWdpWjZIbDR0bGxDcGlXYWtzTXJkWGpvV0VlVnY1M0ZMNHhZNEFyTWZR?=
 =?utf-8?B?TGRBdmV4NGpGWXFIVERqTm9iVmV0Q0hqUUlmWURvU0J0YjJmSEZFVGdQZzlK?=
 =?utf-8?B?M0NCUW02a2laMnlwdUh3VlRia0tvNEJ4b251MkI2VkcvY0NtT2ZtejkvNjc0?=
 =?utf-8?Q?J9Lq4blxOMCV8JH1u8x7SW+/p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23eeb8d8-9f51-41aa-b5b6-08ddc7bff10b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2025 19:02:15.4799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZQ/9FcoznLVVKl/N3CHXniyVXU95p/AXENr8kv4vAHeHbTFeXPygJixsHzn4jRHLGj0KoeBvMdVF3Vrb56i5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8335

Hi Laurent,

On 7/16/25 03:07, Laurent Pinchart wrote:
> 
> 
> Hi Mirela,
> 
> Thank you for the patch.
> 
> On Fri, Jul 11, 2025 at 01:05:44AM +0300, Mirela Rabulea wrote:
>> The standard controls for exposure and gains allow a
>> single value, for a single capture. For sensors with HDR
>> capabilities or context switching, this is not enough, so
>> add new controls that allow multiple values, one for each
>> capture.
> 
> One important question not addressed by this patch is how the new
> controls interact with the old ones. For instance, if a sensor
> implements 2-DOL, it should expose a V4L2_CID_EXPOSURE_MULTI control
> with 2 elements. Should it also expose the V4L2_CID_EXPOSURE control,
> when operating in SDR mode ? What should happen when both controls are
> set ?

Yes, it's a good point. I experimented with the option of implementing 
both, at least for backward compatibility (libcamera requires them) and 
kept them consistent, I mean if V4L2_CID_EXPOSURE_MULTI values change, 
also change V4L2_CID_EXPOSURE and viceversa, so basically keep 
consistent the values from V4L2_CID_EXPOSURE with the values for the 
first exposure from V4L2_CID_EXPOSURE_MULTI. Also, I had to check if hdr 
mode is not enabled, do nothing in s_ctrl for V4L2_CID_EXPOSURE_MULTI 
(cannot return error, as it will make __v4l2_ctrl_handler_setup fail).

> 
> There are also sensors that implement multi-exposure with direct control
> of the long exposure, and indirect control of the short exposure through
> an exposure ratio. The sensors I'm working on support both, so we could
> just ignore the exposure ratio, but if I recall correctly CCS allows
> sensors to implement exposure ratio only without direct short exposure
> control. How should we deal with that ?

I'm not sure I understand, but in case of indirect short exposure 
control I think we do not need these multiple exposure controls, we can 
use the existing ones, as only the value for the long exposure is 
needed, the driver can derive the value for the short exposure using the 
ratio. In some cases, this may be enough, but when direct individual 
control is needed for both long and short exposure, then we need the 
multiple exposure controls. Do you have a specific sensor example in mind?
I think in the past we looked at imx708, and my understanding was that 
the exposure control affects only the long exposure and the sensor will 
automatically divide the medium and short one with the corresponding ratio:
https://github.com/raspberrypi/linux/blob/rpi-6.12.y/drivers/media/i2c/imx708.c

> 
> Finally, I was recently wondering if it would be possible to reuse the
> existing controls instead, allowing them to be either single values or
> arrays. The idea would be that setting the control to a single value
> (essentially ignoring it's an array) would provide the current
> behaviour, while setting values for multiple elements would control the
> separate exposures.

You mean to divide the 32 bits value of the current controls between the 
multiple exposures?
Just one comment here, we have encountered the ox03c10 sensor with 4 
exposures (that will leave only 8 bits per exposure), and the ox05b1s 
sensor with context switching and the exposure on 24 bits (for 2 
contexts, 2x24=48). So reusing current 32 bit controls  might not be 
enough.
Or do you mean changing the current controls type from 
V4L2_CTRL_TYPE_INTEGER to u32 array? Would that not cause issues with 
applications already using current controls?

> I haven't checked if the control framework supports
> this, or if it could be supported with minimum changes. The advantage is
> that we wouldn't need to define how the new and old controls interact if
> we don't introduce new controls. 

I think the same advantage will be achieved with stream-aware controls 
(no new controls, also the min/max/def semantics remain clear), but 
there is the issue we do not have streams if the sensor does internally 
the hdr merge. Does it sound any better to introduce some fake streams 
or pads that are not associated with any pixel stream, but just to allow 
multiple exposure control?

BTW, Jay, what are your plans around the stream-aware controls?

Thanks again for feedback, Laurent!

> Hans, what do you think ?

Same question from me ;)

Regards,
Mirela

> 
>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>> ---
>>   .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
>> index 71f23f131f97..6efdb58dacf5 100644
>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
>> @@ -92,3 +92,15 @@ Image Source Control IDs
>>       representing a gain of exactly 1.0. For example, if this default value
>>       is reported as being (say) 128, then a value of 192 would represent
>>       a gain of exactly 1.5.
>> +
>> +``V4L2_CID_EXPOSURE_MULTI (__u32 array)``
>> +    Same as V4L2_CID_EXPOSURE, but for multiple exposure sensors. Each
>> +    element of the array holds the exposure value for one capture.
>> +
>> +``V4L2_CID_AGAIN_MULTI (__u32 array)``
>> +    Same as V4L2_CID_ANALOGUE_GAIN, but for multiple exposure sensors. Each
>> +    element of the array holds the analog gain value for one capture.
>> +
>> +``V4L2_CID_DGAIN_MULTI (__u32 array)``
>> +    Same as V4L2_CID_DIGITAL_GAIN, but for multiple exposure sensors. Each
>> +    element of the array holds the digital gain value for one capture.
> 
> --
> Regards,
> 
> Laurent Pinchart


