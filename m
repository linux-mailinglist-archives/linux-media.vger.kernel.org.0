Return-Path: <linux-media+bounces-35830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52681AE7041
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 22:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ED1717C6D4
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE79E27F4F5;
	Tue, 24 Jun 2025 20:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Fct24DC2"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65916224B12;
	Tue, 24 Jun 2025 20:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750795323; cv=fail; b=QfO03dk8PDh/u/I6qgmmtExd9szXvJt/7r7ou5j/Hn5Gar7ejSmOtQftqe6/NDOsyBlaRJ3VAKkIPPIgnjGq4DXWO4sZ1g2qk3d2aCH0WWS9LV8B2i2zSpSV1R650iQD6Y8mRbNtRuHCCbKF56M/ASqvTsC0/DFWYzuFXJ/WJTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750795323; c=relaxed/simple;
	bh=N7kuuD1d91dZljNf730McRkNVVTCb7fbMUJ1562OAzc=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pSFJ/TCCPZxdt8cmfVOtfE2LNelrXxoJ7PfTbJvH+4aLy9GCJZzD5qxyGj6Q8sc6xx1qiMvmTONDi5LsNyXhwI+FtelGyiIQ4hzZ314vx3owtaf8hSjdvpI+AUv+6V8ON6xtBn7ea87GLIDrYvYi7xZDgpupNdshl0vmhFLclSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Fct24DC2; arc=fail smtp.client-ip=40.107.244.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQQUGTe3923jJSrluLDlZkLNW4z5IMi0nRmIaVJJKvb1PucXqIjf0YbWJ90uVqxubP6Er6qKOvon12fdeYHjbR66OZbuIajs9dLt6RYTI2VTpPr9MLjpGXrS31t3BQE5bSI7uDwEsWs/T1qePl6y20s0ApMUOpFk9WEDipKNGmcbFHllLjp2F4jBXqlWuq/a2SUHSSCAxpdLjgCXSVBs2OKcsyri4ImO03TGwj/Xg8uqxfyKaQdVK8qZBH1Av7oLAfzHAi18rFyCK3686Ok8TUdkz3T8OK5+V0XmvJ7/vL4T7u0hf4iUgZsi0+KIwwxYA1ALo3gtOWJde8Jt4PhILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCW34otVNaBbUQoUzbx4noIj4Ubpy7nPlbvhQ9QjBHk=;
 b=ZsZTbncsWIENgN6SiCGnIudN7BJCuc5BUn7InJ92ljpShCtuNSG1XFNR9M1xBWuyqxzcqjWZsXkXf7pVWC9zMHRcE3EEwwvcPOx7eQDxL0wemv3GheTlxNzif7+NKdce57mWbOeQ8QJgqjQ92x5EVVxSej1dCucQpNSXLbnif8FP2jJQZ18QLf6Xyb4EVwIi2iI18QzMLmzjTag/EMPgUA8ddAZpoQGY/PVWx44HMEk45LKzeQPmiFLWcM6XbDkeU5i72eehHbQTY3zH40RqTT+FV/w3RJ2E/hpH98cTOr0XepfijNn/C5OHbzLwk0wRFBPMFChBMH76mLVtAS9CUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCW34otVNaBbUQoUzbx4noIj4Ubpy7nPlbvhQ9QjBHk=;
 b=Fct24DC2x+XWOt/Hv4VlOW/nq3ZoIuFXGhdh5q0Fx8SX+B71H2iwMAP5lfIg3UgCD3pM1kz+hiQIS2biOlKouuzgIc58uN7BdMIgcpManNKFmsQpvzh2+JA7M6zuaRkUyZl6enZJgvROpVvQq0/E7F0sXZJkRZO7js5MYd+Tyn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by IA1PR12MB8223.namprd12.prod.outlook.com (2603:10b6:208:3f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Tue, 24 Jun
 2025 20:01:56 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 20:01:56 +0000
Message-ID: <db804aaf-3842-471b-874a-08d5374a76bf@amd.com>
Date: Tue, 24 Jun 2025 16:01:51 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
 dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, Svetoslav.Stoilov@amd.com,
 Yana.Zheleva@amd.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
 <20250623220503.GA15951@pendragon.ideasonboard.com>
 <425j7c6xvbbatdhxgjgjawzwfnjmjetg6rpnwfudbtg6qz6nay@dy5ldbuhtbvv>
 <aFp7tuXkU1jayPum@kekkonen.localdomain>
 <aFp78tqHhe_IhV6d@kekkonen.localdomain>
 <20250624102745.GG15951@pendragon.ideasonboard.com>
 <nixg4efp3zkdpd6h7kp6wkvam63batpoknov2nkgu36voks6bk@gzuackzl3l5g>
 <892063b4-165a-4d6e-a6bd-94ef58c0ee73@amd.com>
In-Reply-To: <892063b4-165a-4d6e-a6bd-94ef58c0ee73@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::20) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|IA1PR12MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e3540bb-009d-45ac-b2d5-08ddb359f87c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFNPcnZzaEdxZzJpNm1GTEpsWjdEaEJybXZwZ2Q1UitNeERIQTBmSXArZTF2?=
 =?utf-8?B?OUtFOFFRM1kwcEdhZnBDaDJvSEhkeGhhUWl2ZHRKYUxEVWpYU3EzRHhDajY2?=
 =?utf-8?B?TkNFZFpqWDJLWUNyK3JBZUxuenpjeXA0YlVBb1dkU1d2Ums5Q3M5NFZiU0J2?=
 =?utf-8?B?SjFHYmlwaUs2MkJJWlU1UzNEZ0NadFdrNzNsNzBrNXFWcVRwc3NJUGVlMHdu?=
 =?utf-8?B?b08va3pYV1NuQnBYZ3UyekdnV3ZEWEM1dnV4L0FsL1JHeVJvcXVGeDlIdFR2?=
 =?utf-8?B?NHN3Q3hLdWcvcTNteU1RTzRsRjFsVlNENXpIbkRvUzlLdVZld0lUVGlhWDhu?=
 =?utf-8?B?bHV0N1MzY09jcTFtYjJ4cjFOa2ZDUjRVclV4YjdkYXV5bXhxNGhnMDhxTFFF?=
 =?utf-8?B?OFNpS0ZvYlF6elVQV2g3QWdzcm5NOWp4clVrb2pFQ0pISXNjRy9UdlZ0WEJJ?=
 =?utf-8?B?NVIwWm5iWWFndWNUczJTR0ladkFQdnR5Qm1xV0dBemZZbzd3YkVIL0NicVpG?=
 =?utf-8?B?VGZudVNpSThsN3dqbTlDRTFJU3RMaERpNVlUdm5aK243TnM5YUVHVTl2MWVv?=
 =?utf-8?B?a09jRWRoOTNkL0g5c2xpSWJQQm1BU3RnKy9IS2ViQ0syUk8yVlRRQm9JVGwz?=
 =?utf-8?B?enVUbmxZbTFSOVlid1pQakI5ZzlSK2pVYmk0V0U4bzZtejBuTlp5S0l4UWti?=
 =?utf-8?B?UXQ1ZEQ5WjZLb2U3Ymd0R0ZrdStWdE9GTUN1UkZiL3dZMklTYXgvcGtvVVNC?=
 =?utf-8?B?TDMyRWRUWFkyWFptWkdKcHBKVjd0SktMaFBiaW16Vzh2N0JZcDVXUFRteDFl?=
 =?utf-8?B?UnYzc3N3aXVnU2VmSmRYK2JNS2xSWVFKeUUvZGtiSDJUMDBsbitQaXlrYUJJ?=
 =?utf-8?B?UTlPR0NSZmxnY0c3NmNjYWdiaXkxbHY1NlZ6MEpVaVh4c1d2UmpHaXU3eXZW?=
 =?utf-8?B?ZjcrR3RjU25DeHYxRjNqNUFncmhvL1hNVGZ0SkFPRE04dUUzVFFUOVhhRGhW?=
 =?utf-8?B?T3RnR3RPZHBQRHY4Q3VYWFNOeWs2dlkwa0xxRkcyWW5DSzdIb1BCUDh3aHcy?=
 =?utf-8?B?dW01YitWdkRKVWxmdzc2VmtySVpQUFd4TGQrRy9JVnlCT2ZkakE1RnZCL0J2?=
 =?utf-8?B?aDNxMTVjeHBtTmFoNkpmNVNLTmVXNWJ2bmRTeWZld0xWck1jdG80d1FDdUZp?=
 =?utf-8?B?T0ZHbnpzU0kwdHpGNVVYc0VTZVBydS81TVUvbFJUeWQ0YVNMU1FNMzFKMUJV?=
 =?utf-8?B?QlNtREdjQjY3QmdTV2NEdTVnOWZQdEU0SHZyOERJWkdiTEtmczlGbDRoTzg5?=
 =?utf-8?B?WjRpUjFBVFhHZzJGVkFaUWtPOUxYd0JjZ0s1MUdzZHB6TTdxSjZZV1l6Nkxy?=
 =?utf-8?B?M1dKWWJuYVBjdDU4V1ViN2JQUTgxVExMZE5mN0ppWmFyK3U1bUY4VmJDM0hH?=
 =?utf-8?B?M1p1b0VTMDE4NVIxKzB2Tk1qUE5xQ3p6cTgyVzRxSVRxdUw4dGxCcVZiV0pU?=
 =?utf-8?B?V0pzWXY2NHpHaklESG1sV2J4VzZnV0JqWEFRMkk2TVNCWTJFVHNkdkF2MXBq?=
 =?utf-8?B?eEM1cG8ySWsraVU5SW1MSGVBQjZUdGxFVlcrWU9teEMwQ2U5Sk44aU1IYjNW?=
 =?utf-8?B?cVpsMjRlN2lLS0kwZ0dldXkrYkNGWEVUenNCUFAvQ3o2bTg3U1lsOHo1aWpa?=
 =?utf-8?B?bGhrSUE4ME9KOFMxZ0UxelhsNkdWTTZSSlV3Nm9MMnFKL0tCdnhyVUZURzFm?=
 =?utf-8?B?bWJwdHUzUXJ3R0xYTDJIM0VXZ3NQaTMrY3pEVE13ZmlvaTBVeC94OURNWGNy?=
 =?utf-8?B?L2VmZS8yTHpvSE16UnplNjJXNmNYRTBicTlIQ3lPVk5LM3VHbXFGV1JheFpT?=
 =?utf-8?Q?o/LhRoNuoUP5J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzNRTk4zUit0eWNuWFU2c3RoWHdXSlJmY3JBNUxUSURwL1Q1UUpFbmlpV1FX?=
 =?utf-8?B?cXFJbWZXSnFHMVRQMkxTY2FhMGtnUG5KN3BnZVF1ZVI0aGl5YW1mWnZDZ0Vo?=
 =?utf-8?B?VEV4RTM4ZldlQ2JEWXY0S1Q3S01nOGd3R3BYVzlwQ1JHRml1QzB0d05oMW53?=
 =?utf-8?B?d1BQTlU4MkphWkt6TG1QTThWcU8rNit1d0JHRHBmVmR4a2VTY2hOUDZyM1J1?=
 =?utf-8?B?RnZlcTNpcGpQRE51dXQ4UDNZTGJVaHJyQmJibk1RNHRvUFJGMkc0eVVXUnBI?=
 =?utf-8?B?Um5wTkNlbVFqZ0pDVGI5NEg4eEFpK1ExUFhYMWVlSE90YXM0ZEtTTDhXQlJy?=
 =?utf-8?B?WWRZRTM0a2hmdVgrbVc0VFR2Z1JpUlhrMFlHQzlUbTgxTFE5bEhZeTYwMVIw?=
 =?utf-8?B?RGllZHVjRklueXNacjBhaCtrZVZLUE1ybjhiaFV6emFaa0lWUEVLMmdRdjkx?=
 =?utf-8?B?d1FYUEVFOVBCZWpjU3B3em5XRE82NlJNUUg1VlM3WjRnd3ZFUVVXK1VLZlM0?=
 =?utf-8?B?aGM2bW0rZ0ZHdVE1eVh4ZGwrQVRxMkpWWVRCU1lIc0hOblhmdjlONFJvSTAw?=
 =?utf-8?B?ZUhyYUppNWdqSHhtQ3p2bFcvelNiaGxubEo0MjduSmw2RTlkcVRZT0Y2dVVW?=
 =?utf-8?B?N3lrQ1N0K3hGV3FiVGJiN2RRSm5MZmxpSGc2andvVlV4ei9nY0Vhbi9rZnhO?=
 =?utf-8?B?b0ZEanJXOE5RSHNCQnFBTG1SakpuYVpETkxYSEgvR1MrOUVvT0NhbnRwKzBW?=
 =?utf-8?B?a3VYcEM0UzZuYldzTUhnNngrSGlORDFiR3F5YlY1TmtUVmU5WWVBSlhVb3F0?=
 =?utf-8?B?dTFvaG84RXhmMjAvZVJvSlM5S1NIK1djbVhsbXRmcExuY2NiSEN2cWU5N1M5?=
 =?utf-8?B?dnBESGZsVHFjclBzcEJFd1lxOGQxK2Q4SnovcDRYdUtUVnJWRk5UaVFSbGl0?=
 =?utf-8?B?SldydXdMWXVEZjdyU0cvTnRiMjhrdHM2OHBISlREL2NEZGc2NUJGS1RWVW1H?=
 =?utf-8?B?cUVRZm9MaTk1VC93dGtnclJnRlNWSmxuNW1TK3VqNGxaY1ZCYzA1TW83SjE2?=
 =?utf-8?B?QWc3dEV6RXdYa250azl0MDIrY2plSkxMbkFxVzhxV2xzVnZCeHFLcndEUjY1?=
 =?utf-8?B?eWNGdXRpT2IzZGtZY01ETDFZNjhQOVcvNTY1N3V6ZGpRNWtMVU5tWDJLQ3Bj?=
 =?utf-8?B?dTQ4cFVBanovR08xNDVVdFJYb1V2NjVyU3FISlYzRm9RamxRV0RxdzV1QmU4?=
 =?utf-8?B?eW9qdmFYZFhDOFZIbXR0ZzA1N01YWUFaUzRxR2tOWFpoUHdFanFIcmRzam80?=
 =?utf-8?B?SkFyZHlhdVU2Q0tRdDFWRDdkallqTG8vOCtINXlSai85bUFHL3lXaGtrTnUx?=
 =?utf-8?B?V2RBSUJmam5jSGlJYXA5YlNHUHExUnNtU2tpdFpXbE1OVi9ndGduNlU3Uy9w?=
 =?utf-8?B?QkdTMjNuQjZYUDJrRWl1RFkrVzJya0NBTWdPVEo1bS9iYVpnRlUzT2k1bTZ0?=
 =?utf-8?B?QVVKL2Z6enlpK0NVd2RmdVVkYW5lWXkzOXA3dy9aUzJ0UUJ4QkRKc0hrN3Na?=
 =?utf-8?B?VXpZS1c1Ry9MVlhrcWVBK211bXBlaklTa2RUbHM4d0lKNzBxVncvcXAzVzdU?=
 =?utf-8?B?cGFwWnUrSHpNMVk0TjhXZjRkaXlGOStZYVl4L0twaHZ2Tnp5eVJGcy9zM2to?=
 =?utf-8?B?Z0lLRTZtb1Qvb2dnM29aMTUwRXRVK3JDelZhdDFCNmdzbDNKUzFyaVpzVGps?=
 =?utf-8?B?V3ZKMmJoUzFrY1llbVdHeTRVY3dQYkdPWlBlMUNkQWFvK2s3Znd5MW0xd3py?=
 =?utf-8?B?UGtiWmYyQzdlMDVLeE4ya2FZMXpzNU1vM0FzUVJUaUp5eDhFc2pram5iWlIy?=
 =?utf-8?B?ZEllQTVCTFd5V3hCMW15RFZadk1TaFVsdUVYVFFsMGEvdmRna01jc3lTVWtL?=
 =?utf-8?B?Q0FBZld2byt4UXp5Zk5FSER0WjlsMkxvTlIwRmZaZ3VJS2FlUmEwb3JESkpF?=
 =?utf-8?B?QzJDYmg4RmRZNTIzZzZabyt6M0E1MUVvRlFyNGYxaVpLK2lzUFkvbGVPdkhO?=
 =?utf-8?B?Y2FYUmRhRlJSK1BCd2t6RVhNNlp4cHZxYVdLNXY4ZE9kekpWcm01Rk1WNHhw?=
 =?utf-8?Q?YfeBls9B/7l5gW/T/hVIc1Cm9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3540bb-009d-45ac-b2d5-08ddb359f87c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 20:01:56.1564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJZCdrnfUwF3/TQXaMZw5kuHgzhAHcXSRhhqmhRGd7O9QLH7AKc6AmPAZU8819dPUlemkzJJsJjOiAksI1aLYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8223



On 6/24/2025 2:26 PM, Nirujogi, Pratap wrote:
> Hi Mehdi, Sakari, Laurent,
> 
> On 6/24/2025 7:27 AM, Mehdi Djait wrote:
>> Caution: This message originated from an External Source. Use proper 
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> Hi Laurent, Hi Sakari,
>>
>> On Tue, Jun 24, 2025 at 01:27:45PM +0300, Laurent Pinchart wrote:
>>> On Tue, Jun 24, 2025 at 10:20:34AM +0000, Sakari Ailus wrote:
>>>> On Tue, Jun 24, 2025 at 10:19:35AM +0000, Sakari Ailus wrote:
>>>>> On Tue, Jun 24, 2025 at 10:35:18AM +0200, Mehdi Djait wrote:
>>>>>> On Tue, Jun 24, 2025 at 01:05:03AM +0300, Laurent Pinchart wrote:
>>>>>>> On Mon, Jun 23, 2025 at 05:51:48PM -0400, Nirujogi, Pratap wrote:
>>>>>>>> On 6/16/2025 6:49 PM, Nirujogi, Pratap wrote:
>>>>>>>>>>> +static int ov05c10_probe(struct i2c_client *client)
>>>>>>>>>>> +{
>>>>>>>>>>> +     struct ov05c10 *ov05c10;
>>>>>>>>>>> +     u32 clkfreq;
>>>>>>>>>>> +     int ret;
>>>>>>>>>>> +
>>>>>>>>>>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10),
>>>>>>>>>>> GFP_KERNEL);
>>>>>>>>>>> +     if (!ov05c10)
>>>>>>>>>>> +             return -ENOMEM;
>>>>>>>>>>> +
>>>>>>>>>>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
>>>>>>>>>>> +
>>>>>>>>>>> +     ret = fwnode_property_read_u32(fwnode, "clock-frequency",
>>>>>>>>>>> &clkfreq);
>>>>>>>>>>> +     if (ret)
>>>>>>>>>>> +             return  dev_err_probe(&client->dev, -EINVAL,
>>>>>>>>>>> +                                   "fail to get clock freq\n");
>>>>>>>>>>
>>>>>>>>>> Let's try to land
>>>>>>>>>> https://lore.kernel.org/linux-media/20250521104115.176950-1-
>>>>>>>>>> mehdi.djait@linux.intel.com/
>>>>>>>>>> and replace the code above with devm_v4l2_sensor_clk_get().
>>>>>>>>>>
>>>>>>>>> Ok, we will verify on our side.
>>>>>>>>
>>>>>>>> We tried using devm_v4l2_sensor_clk_get() and found its required 
>>>>>>>> to add
>>>>>>>> support for software_node to make it work with this driver.
>>>>>>>
>>>>>>> Why is that ?
>>>>>>>
>>>>>>>> Please refer
>>>>>>>> the changes below and let us know if these should be submitted as a
>>>>>>>> separate patch.
>>>>>>
>>>>>> The helper is still not merged, so no patch is required.
>>>>>>
>>>>>> I will see if a change is needed from the helper side or the 
>>>>>> OV05C10 side.
>>>>>
>>>>> I wonder if there's a better way to figure out if you're running on 
>>>>> a DT or
>>>>> ACPI based system than getting the device's parents and checking 
>>>>> which one
>>>>> you find first, DT or ACPI. I think that should work for now at least.
>>>>
>>>> Or, rather, checking for non-OF node here would probably work the 
>>>> best. I
>>>> wouldn't expect these to be software node based on DT systems ever.
>>>
>>> Until it happens :-) And we'll handle it then.
>>
>> So we have the following:
>>
>> - The problem with this driver is due to lack of proper ACPI
>>    description. HW is already shipping and AMD will work on better ACPI
>>    description for future models. See [1]
>>
> Thanks Mehdi for clarifying and providing the reference from the 
> associated x86/platform driver patch.
> 
> yes, thats true we have to add software_nodes to mitigate the issue 
> caused by incomplete description of camera device in ACPI tables.
> 
> For future models we are working on a plan to address this issue 
> following the MIPI DisCo Imaging Spec suggested by Sakari to properly 
> describe the camera device in ACPI. Please see [A]
> 
> Once again thanks everyone for the support!
> 
> [A] https://lore.kernel.org/ 
> lkml/2a9ba94e-7985-4ba9-88c6-45b8cf4d001f@amd.com/
> 
>> - software_node can also be used on DT systems
>>
>> [1] https://lore.kernel.org/lkml/0d801367- 
>> da24-4596-83d9-08ccd89ca670@redhat.com/
>>
>> Now going back to the helper. If we want to support this case:
>>
>> Approach 1: software_node || acpi
>>
>> --- a/drivers/media/v4l2-core/v4l2-common.c
>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>> @@ -682,16 +682,17 @@ struct clk *devm_v4l2_sensor_clk_get(struct 
>> device *dev, const char *id)
>>          const char *clk_id __free(kfree) = NULL;
>>          struct clk_hw *clk_hw;
>>          struct clk *clk;
>> -       bool acpi_node;
>> +       bool acpi_sw_node;
>>          u32 rate;
>>          int ret;
>>
>>          clk = devm_clk_get_optional(dev, id);
>>          ret = device_property_read_u32(dev, "clock-frequency", &rate);
>> -       acpi_node = is_acpi_node(dev_fwnode(dev));
>> +       acpi_sw_node = is_acpi_node(dev_fwnode(dev)) ||
>> +                      is_software_node(dev_fwnode(dev));
>>
>>          if (clk) {
>> -               if (!ret && acpi_node) {
>> +               if (!ret && acpi_sw_node) {
>>                          ret = clk_set_rate(clk, rate);
>>                          if (ret) {
>>                                  dev_err(dev, "Failed to set clock 
>> rate: %u\n",
>> @@ -705,7 +706,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device 
>> *dev, const char *id)
>>          if (ret)
>>                  return ERR_PTR(ret);
>>
>> -       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
>> +       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_sw_node)
>>                  return ERR_PTR(-ENOENT);
>>
>>          if (!id) {
>>
>>
>> Approach 2: of_node
>>
>> --- a/drivers/media/v4l2-core/v4l2-common.c
>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>> @@ -682,16 +682,16 @@ struct clk *devm_v4l2_sensor_clk_get(struct 
>> device *dev, const char *id)
>>          const char *clk_id __free(kfree) = NULL;
>>          struct clk_hw *clk_hw;
>>          struct clk *clk;
>> -       bool acpi_node;
>> +       bool of_node;
>>          u32 rate;
>>          int ret;
>>
>>          clk = devm_clk_get_optional(dev, id);
>>          ret = device_property_read_u32(dev, "clock-frequency", &rate);
>> -       acpi_node = is_acpi_node(dev_fwnode(dev));
>> +       of_node = is_of_node(dev_fwnode(dev));
>>
>>          if (clk) {
>> -               if (!ret && acpi_node) {
>> +               if (!ret && !of_node) {
>>                          ret = clk_set_rate(clk, rate);
>>                          if (ret) {
>>                                  dev_err(dev, "Failed to set clock 
>> rate: %u\n",
>> @@ -705,7 +705,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device 
>> *dev, const char *id)
>>          if (ret)
>>                  return ERR_PTR(ret);
>>
>> -       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
>> +       if (!IS_ENABLED(CONFIG_COMMON_CLK) || of_node)
>>                  return ERR_PTR(-ENOENT);
>>
>>          if (!id) {
>>
> Thanks for proposing "approach 2 using !swnode", I verified and confirm 
> it works at my end.
> 
sorry,  fixing the typo - I meant "approach 2 using !of_node".

Thanks,
Pratap


> Thanks,
> Pratap
>>
>> -- 
>> Kind Regards
>> Mehdi Djait
> 


