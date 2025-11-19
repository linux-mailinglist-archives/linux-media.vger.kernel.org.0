Return-Path: <linux-media+bounces-47363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F7DC6DEC2
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 11:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 7306524276
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 10:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D8C349AF8;
	Wed, 19 Nov 2025 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O/2Anfgn"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048FB34889A;
	Wed, 19 Nov 2025 10:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763547273; cv=fail; b=ryU9pN6vRpTrpYY0J/m7s9P3K1hBy9fN9yRIu5SO1UY74Iw78feum/8KeSvlO00SO8/XAqRK1shVeo/wvSADyOwy3+YZzXCtGB1m85dOWt115LTF9zB9K6v9omfO7o0+yMEubkOiPgou+wBWEwFICpP7+B7XuNX3s6iwEURi2II=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763547273; c=relaxed/simple;
	bh=Oc78vFtPiGGSK3ATVrY7EM3FA/339/599D4fKcsYMps=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EAAvvVchTMijZnGwWYUlgMj1cXJ3ffq599cIiyO5F7x+oFM4YjRmjOyWNJxre/YlwJ/EFZyJotc4P2G6J+M4WFQJcxW5PnQJjpnI5eZ/eExTw1lLHudjY7pxV1nTqCdbvrwrq5EglG6sSfyoLayx9ddjAgGvkLJOqcXsnUdLZkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O/2Anfgn; arc=fail smtp.client-ip=52.101.46.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htqoTnscj3O+1f4Z7cj5+c1VJM1cyAWdCW4xeO738hr/t36kLCCrPkaoqLd8ogp447yDjR71HiBY6mzRkhAqfzohYjmUIPWX8P2MpdMmwvCfVgXACpNvqEnyZpasEZsfAwgXmHuqoimbedWeBGTFVDm2pzox8X8nDoLzM7HscNAI7PlwM3ec094euenJY7k5aKE943Xzi1g6hd2R/ogCGFUF9qLUg1h9Cd/a3oDhuP6G3zs/mrLUef43GH+slkciGddCx3K3DFi4QXYGj8GrYxXILnXe4MuZzgC74GsenFUt4BHtWZ2mVCNEE+PR3TEI1Hm/DeHoIk2pcN0mesCh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcuudmfgHjN/WWdB9qYdOMp3DyBQmKyUWZd0fiErMk4=;
 b=Yvz7mPt2Wpbq6msvAGq3R8IyMaHB1s+XbniEXTwJr5JoMCoymYGllFso0OkvHFMTRRk1hkS4D0M4SyyAb9nfCoscDdDbGPsyQakabBjxOYSg8LMT+T7WFeakdeFsH3WxnJbmtdPOOxR04WxFgRxOWr7CwruEv1yULK4RE/FRTWegj81qZsPgvHOX4MgxParO32JV0BXnJBrnZXmbPMEvn9DzfRK5rXo+Ly67VlOArk/EZhyKHTmvnMZTVrWm2fLbQQLwW7T/s4E/7o4DnNJHSc6hjpfrfZ4J5oe/BH9Baft6BZ4NUBkSzJ8Z6Ikg8lTvBVV0iB/EcLLedgVBARfzkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcuudmfgHjN/WWdB9qYdOMp3DyBQmKyUWZd0fiErMk4=;
 b=O/2AnfgnJhKFcrLqNuH6iYmII2m/YYR2uSbxkjBfyRetSKipTUtszbrptuL6XrRFyCFOqOkdIAmfQyWWnrAL4y2DTCCpAk/ALNE52o+CEjsNjbTA3DPP2ZPvVl6RlianL86sDhnJmhg3WqyIyqonPldwE7E9iIVEthRYJYN1m0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by IA0PR12MB9045.namprd12.prod.outlook.com (2603:10b6:208:406::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 10:14:25 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 10:14:25 +0000
Message-ID: <8288a5b3-6e56-4c9a-a772-99ca36bb7c52@amd.com>
Date: Wed, 19 Nov 2025 18:14:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com
References: <aRGjX1pv0y_lVext@sultan-box>
 <c41df0f5-b2b5-49f1-a49e-8750e55975e1@amd.com> <aRL8ZPwXSeKD4Qmn@sultan-box>
 <e09207fd-1879-44c8-a5c1-838a140dcd4b@amd.com> <aRPH1hV7bEfagPtE@sultan-box>
 <aRPhMCwJjpMqAROG@sultan-box> <d9afc6db-fd8a-4069-a8a8-1e2d74c1db3a@amd.com>
 <aRQyAdyiQjhsC11h@sultan-box> <aRQ5aA4Gus4iCVLp@sultan-box>
 <591efd28-805a-4a13-b7e2-0f78a3ca3eac@amd.com> <aRwhuNmPRlPGxIia@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aRwhuNmPRlPGxIia@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::13) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|IA0PR12MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: ec822f43-30a7-4a51-7fb3-08de27546a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qy90eVdvdEFjTFlpcm5UaHJOemJ0dEYxbGM1OW9IWXd1MVZqTjh0YzZGUEw3?=
 =?utf-8?B?Mit4T2tEZkVLS3p0azZWc05kNnVtSVJZUjVmUDh6cFk0TGZKdnB5bzdocWVv?=
 =?utf-8?B?S0EwOG1WQWlTVWNkQm90azJ3dkw0VENYQmlZRG4xY0dGcjdWZzJOVkJjVWRQ?=
 =?utf-8?B?bnAwVHZtdHU5L041WVFMVElsdmsrVlZ5dVZVQmtUWStHQlMwV05MZkVkUEp4?=
 =?utf-8?B?djVXajBtY085RUhLWDZxM0poVXdqdU82SnpLU29vTkVyaUNkVHdtMURmcGFD?=
 =?utf-8?B?aFRrczZ5MmdWS1VjMUdnczUzRXFydzZicndJejZIenBWNHEyckRWQlY5LzdZ?=
 =?utf-8?B?dXN4aVpLUk1lQUFhNUZSWTQ2SWdpb3dvRVFGZFcyemZkaFZzZ0wzaEFpbjQx?=
 =?utf-8?B?STNUd3d2R3Q1ZDkza1cwclNhZy8vNFJkV0Ivd1IzU3JUbEZPZ3ZabXdiblYw?=
 =?utf-8?B?NzlYbkYyUVFmWVorSnpLOVhOeDFyUTdBaU9oUVRQNnI4RzFnajhlOEpQVWlk?=
 =?utf-8?B?MU0yU0tlYWRDdStJbmdCNEtKVVdoNi9LbWdVbGZHL1hUK0F1U1NBVUc2bGZo?=
 =?utf-8?B?eE9YblY4NFJENTF3cW9OTzNVSkRVNnRLUFVZbWxxcjJ2MzFlNXFBZy9aUkV4?=
 =?utf-8?B?WjdneFBrUi9BaVViWEZ3Ni85MlN5WUZMZDhrZjlGZmRFcjd5cG5zeDlkSTlE?=
 =?utf-8?B?UWlFZEJuS09iTzM3QzI0TnE5UXB5VXdrOWpPY2Y2Vkt1UWY4T1Bsd0VqSnBx?=
 =?utf-8?B?ZGlDUGUvUHlRNlJUNnkxOG5xZlIwdGRQY1VlWUxMcjN6Y1RQK3p0NzFiM0cy?=
 =?utf-8?B?QmFRNE9wYjNJaTlIUyt4cHZ0RUpzOXE2MTdkcWtuZExkYitCZzFYMEsrM0Zh?=
 =?utf-8?B?Nmc4UmRWSUk1aGxURGNTWE1WcklWcEFVWHJ0UjVhSUtuVFluWFlKZkxHbm95?=
 =?utf-8?B?TGRSV2F0eU9QL2toa0ZWdE00eVdFaXdoa2l0NFZ5WGsrM1pocW5nbUw2N25o?=
 =?utf-8?B?OEMyOGR4b1phbWxQUjZHM3lLWDZTVStOODZuTjhwQWhYa09CWnlRRFBrLy91?=
 =?utf-8?B?MVVTT0hydWhGcUN4ajhJcjZuZE5pSVRsUUlEcC9hWmtxTzJqdnU0RGJoUk5h?=
 =?utf-8?B?VVVVaFhIQWZ5bC9qWTNJTWZPaWtySXVoMUlLSE42UElCWHAxZzZST0ZmTkJs?=
 =?utf-8?B?anQ2dmg2YmNzN285c1dTMW1OTXNnNW5qTHRRQmR5bWlrVDJielVVUDVDc0pB?=
 =?utf-8?B?aFRQQWZtakM2anRKb0RwUFpiUE5zMzVObmlVcVgrY2JvbFJvcWN5V0p2Sy9K?=
 =?utf-8?B?NXlUTWd1MFhBZFdlRVRxYUgwL0dBWEJqZDJOTnE2bXdLWnBibzMwVzZmZ1RR?=
 =?utf-8?B?MWppczljazVNRHZUUklBMnJFREdCOEsvaDRCWUNwUDU3OXY3QVljMStyMGhR?=
 =?utf-8?B?eDJKYVNLWUdsYzRIMitOVU5hbHdtdjNDdkxTVHRDOHQ3UXI3ZHJBR1Zic2Z2?=
 =?utf-8?B?R2ZhOHlHa3k2eldCcHNXSG9QOGRnMmI4eXJ6T2ZpQkhzUlVRWHQ5NXUxNzhF?=
 =?utf-8?B?RFpRdXNzajUxcEtKNURFQXFkSW1QK25RcEI0bWdaYi9aUjhrUmFuSWpVMDlD?=
 =?utf-8?B?VFBqTElaTXFXMk5SVVlHNFJqWGtwa01KVW12M2VuU0dNUk04WlFRTkpMWE1V?=
 =?utf-8?B?WXBBOWhJbzJHbG8rWFc1ajVLT2N1MjZNMmU4RDN4d280VnlJdHBMUFNSYVVq?=
 =?utf-8?B?c1luZk1EcWMzelVjRWpDZ1pIalE3M2ExMmpqUVMvWXZ5QUxCWWdXVGhpT0RK?=
 =?utf-8?B?aUt1UitSMWQvek80SFVzZFQ2K3NPTUltaDk2VXJFcHNqZW5sOXNFb2Y3VUE4?=
 =?utf-8?B?ejJFVU8wM2lwYVRpN1czNXV0cE9vcis2QmE1RUw4SWVoMUlncko1eVMvL2x1?=
 =?utf-8?Q?l9JXPomalPcifQS95pFWKwebSapldyWH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXcxOUVXd2hyYjduTy95U3RTWTZOUGVZeFZRUnBrZ0ZQREY4SUhJdnp4b1Zx?=
 =?utf-8?B?dkhkMlRNanI0OGdURzlpUXcxbWRFRHFMQ0tjMCsxeG1hNGxUemlJYnVHcjZ5?=
 =?utf-8?B?T0JLRWlGUG84TUl4cThkNEMyWU5jZllFbmE4c1pYVWNkaUIxUUdxMkxnMWJj?=
 =?utf-8?B?TGkxMEQ5L29tOEVsWXZRWUtkRndrUGd6RHZsalhpRGZZM1paTVJNQm5pcURw?=
 =?utf-8?B?OWJ3bEgyYXFUOGFNNWk1TG4vcllsUHp0cUZ2VVU1R0NGeG1QelRFUTJYZnIv?=
 =?utf-8?B?ZlFHaEdZRnpvV3kzcTJsRitkWDZ4NFVzaDVIaUsrRTIraVZGRmszZnQ0amVW?=
 =?utf-8?B?c2h4VGExWFB2dFFxR2F4eEhUQWxDVG9VakU2NTY0Y3ZDVkI1aWhFZk02cXVF?=
 =?utf-8?B?LzdwcEp3aHJmamwwWFkva1kxWXZML2dlS1lsMWVmNVNDaTAybHYxTlBoRXIy?=
 =?utf-8?B?VFF4NEJpMEJudDNvWi83b1ZvdzVWOWdYL2ZRT1pWVkc1WFdvRktabGxzZlp5?=
 =?utf-8?B?SURqU1gwMFBLRFFRTVBSUUNGN2prbkdSbmxxQ3VMRkZ6QVdwWUYwNTIyQWJn?=
 =?utf-8?B?UjNlSWE3YkwzMlJrNnJ2dXkvZ3JGcDFhdWhGZTBBZU9IYkVrbHY5blB6cEor?=
 =?utf-8?B?clg5NVM2a2JDeXVjZzRCNGpTanNtQkJWcDQxZEE0cGx2a0ViVExGUUp5Nmtn?=
 =?utf-8?B?Zml2ekRtNDcwZjlyNk50QWNxL2VHbzg3VzVQVEdNOWpDd0thWTFVNldDdFZL?=
 =?utf-8?B?cy8yNWp5UEdPYXVnT00rUmdlbTBQazJlMHo4VVorTHVVYWRoMG1QMXlEYTY2?=
 =?utf-8?B?U09LU2FFWFBiekE0ZnhWcHdQY1ltclk1cG5VbitoUHo4RlRQbHVvUGFYTVFl?=
 =?utf-8?B?VlFFaVY0eDRPSnNZVytTb2c5azlIS2Z5N1hMNElSY3VIWjNNcTE1ZmYvcW01?=
 =?utf-8?B?WDMvdUFHR2xBL0NYRDNLd25Ia3d4OFJJYmx3OXR0RGxVUnpkNDl0L1VDb2s5?=
 =?utf-8?B?YVFmVVd4RzNPL25MWVMyUUtGQWM1TVZuOGxDQkVYc1FQOUltTGducVo0QUNz?=
 =?utf-8?B?eFprd3JHWEt6WEo4SU1iMkJSY05XVW5tNlloNjArS2d4OStCc3RYdzdMek5D?=
 =?utf-8?B?eWxkTEFvZ2ltUVdNOXBQMUtvdi93VnFCWEJCQiszbm1BbEJNUEtiY2RRMjRX?=
 =?utf-8?B?dFdtb1V0NWYrVTl5TDBvcUxZNmdzckE3QWNmZmZiNWZVTjcvbWxCNkd6eCtX?=
 =?utf-8?B?ZHA5UUZsL1ExbUJoZkZZSkhlUldkVkw5dnZ2eE4vWXg0bGRkaEl2akFRY1Jt?=
 =?utf-8?B?NDlKTUJNVEF0bHJiMld0L1ZtM3oyc2VlTktYMEFYRVN5SkJNY0hIeXdQNjBQ?=
 =?utf-8?B?VHJ3V1Nnd0s4a1BKU0hOWFI3SXZxa2VJU0FraUorS1JMWkg5SlFZbklUSHBP?=
 =?utf-8?B?MnNDZGxDQVBZeXRNbGJISGF5ZjBnY0hsV2hGa0RqYmt4WFJnbjJkSnV2eE9W?=
 =?utf-8?B?WEFzOHZ3WG5ML1NaTzZZN1N5TjJKaGNTb0J1UVJpUVpVTkJSMDIrT09OZ1NP?=
 =?utf-8?B?RGpUUXFpUTFwbUg1MlNyQm9vNTBnV25YMzBQQlR0L2g4VjRsY0pUZkNSM3JX?=
 =?utf-8?B?b1k3bGQyTjdwYThzZU1VK3V5bGIvSCtLbXVtRCtZN1NWSFJKT0pLdWNWSklC?=
 =?utf-8?B?aVZwbVUzcEpDZzAzYVZwTUdzUUpvcTFxM0NXNysza2FITnBRZjVmeFExZzg0?=
 =?utf-8?B?eFNZTFppeFh6Qkg5c2kyYU5oNFpNK2QrS0t1WVpsSG5nUnNqT2NtcXovSUFy?=
 =?utf-8?B?eUl1a0cyN0NzaHFkdDhRSzM4bGZrZlI5bnF6OXR6ZWRZcVMva2h4cmdvOVRz?=
 =?utf-8?B?K0ZSR2U1ZDJPeXBlUHUvNkQwcU4vL1FXanYydHpaOHRtOWF1UUVzaEZPbmkz?=
 =?utf-8?B?UlBleEw4amlEN24rTFNKWm1XUklYWFlOSksyZEJuQ0ZnUXpNWU1Yci9iWWtH?=
 =?utf-8?B?QzA4ZkJDS1RUMzI3VS9SUzRxRUUrbkJKS0hzaG1acVR6MlRxV3ZLNXlGZlNF?=
 =?utf-8?B?MURKVG8yZjErQmk0ZHpNZmQ5bVZXVVJieG5PVzZqUUg1WXE1dkRzY2dSZi93?=
 =?utf-8?Q?9k9k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec822f43-30a7-4a51-7fb3-08de27546a76
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 10:14:25.1674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+I9cEFaMCzFYDweD1dBtNN9wX33Mod5nZQppzCsoL9e++l74cJws4fHPuCIqM0m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9045



On 11/18/2025 3:35 PM, Sultan Alsawaf wrote:
> On Wed, Nov 12, 2025 at 06:21:33PM +0800, Du, Bin wrote:
>>
>>
>> On 11/12/2025 3:38 PM, Sultan Alsawaf wrote:
>>> On Tue, Nov 11, 2025 at 11:06:41PM -0800, Sultan Alsawaf wrote:
>>>> On Wed, Nov 12, 2025 at 02:32:51PM +0800, Du, Bin wrote:
>>>>> Thanks Sultan for your information.
>>>>>
>>>>> On 11/12/2025 9:21 AM, Sultan Alsawaf wrote:
>>>>>> On Tue, Nov 11, 2025 at 03:33:42PM -0800, Sultan Alsawaf wrote:
>>>>>>> On Tue, Nov 11, 2025 at 05:58:10PM +0800, Du, Bin wrote:
>>>>>>>>
>>>>>>>> On 11/11/2025 5:05 PM, Sultan Alsawaf wrote:
>>>>>>>>
>>>>>>>>> On Mon, Nov 10, 2025 at 05:46:28PM +0800, Du, Bin wrote:
>>>>>>>>>> Thank you, Sultan, for your time, big effort, and constant support.
>>>>>>>>>> Apologies for my delayed reply for being occupied a little with other
>>>>>>>>>> matters.
>>>>>>>>>>
>>>>>>>>>> On 11/10/2025 4:33 PM, Sultan Alsawaf wrote:
>>>>>>>>>>> Hi Bin,
>>>>>>>>>>>
>>>>>>>>>>> On Wed, Nov 05, 2025 at 01:25:58AM -0800, Sultan Alsawaf wrote:
>>>>>>>>>>>> Hi Bin,
>>>>>>>>>>>>
>>>>>>>>>>>> To expedite review, I've attached a patch containing a bunch of fixes I've made
>>>>>>>>>>>> on top of v5. Most of my changes should be self-explanatory; feel free to ask
>>>>>>>>>>>> further about specific changes if you have any questions.
>>>>>>>>>>>>
>>>>>>>>>>>> I haven't had a chance to review all of the v4 -> v5 changes yet, but I figured
>>>>>>>>>>>> I should send what I've got so far.
>>>>>>>>>>>>
>>>>>>>>>>>> FYI, there is a regression in isp4if_dequeue_buffer() where the bufq lock isn't
>>>>>>>>>>>> protecting the list_del() anymore. I also checked the compiler output when using
>>>>>>>>>>>> guard() versus scoped_guard() in that function and there is no difference:
>>>>>>>>>>>>
>>>>>>>>>>>>        sha1sum:
>>>>>>>>>>>>        5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // guard()
>>>>>>>>>>>>        5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // scoped_guard()
>>>>>>>>>>>>
>>>>>>>>>>>> So guard() should be used there again, which I've done in my patch.
>>>>>>>>>>>>
>>>>>>>>>>>> I also have a few questions:
>>>>>>>>>>>>
>>>>>>>>>>>> 1. Does ISP FW provide a register interface to disable the IRQ? If so, it is
>>>>>>>>>>>>         faster to use that than using disable_irq_nosync() to disable the IRQ from
>>>>>>>>>>>>         the CPU's side.
>>>>>>>>>>>>
>>>>>>>>>>>> 2. When the IRQ is re-enabled in isp4sd_fw_resp_func(), is there anything
>>>>>>>>>>>>         beforehand to mask all pending interrupts from the ISP so that there isn't a
>>>>>>>>>>>>         bunch of stale interrupts firing as soon the IRQ is re-enabled?
>>>>>>>>>>>>
>>>>>>>>>>>> 3. Is there any risk of deadlock due to the stream kthread racing with the ISP
>>>>>>>>>>>>         when the ISP posts a new response _after_ the kthread determines there are no
>>>>>>>>>>>>         more new responses but _before_ the enable_irq() in isp4sd_fw_resp_func()?
>>>>>>>>>>>>
>>>>>>>>>>>> 4. Why are some lines much longer than before? It seems inconsistent that now
>>>>>>>>>>>>         there is a mix of several lines wrapped to 80 cols and many lines going
>>>>>>>>>>>>         beyond 80 cols. And there are multiple places where code is wrapped before
>>>>>>>>>>>>         reaching 80 cols even with lots of room left, specifically for cases where it
>>>>>>>>>>>>         wouldn't hurt readability to put more characters onto each line.
>>>>>>>>>>>
>>>>>>>>>>> I've attached a new, complete patch of changes to apply on top of v5. You may
>>>>>>>>>>> ignore the incomplete patch from my previous email and use the new one instead.
>>>>>>>>>>>
>>>>>>>>>>> I made many changes and also answered questions 1-3 myself.
>>>>>>>>>>>
>>>>>>>>>>> Please apply this on top of v5 and let me know if you have any questions.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Sure, will review, apply and test your patch accordingly. Your contribution
>>>>>>>>>> is greatly appreciated, will let you know if there is any question or
>>>>>>>>>> problem.
>>>>>>>>>>
>>>>>>>>>>> BTW, I noticed a strange regression in v5 even without any of my changes: every
>>>>>>>>>>> time you use cheese after using it one time, the video will freeze after 30-60
>>>>>>>>>>> seconds with this message printed to dmesg:
>>>>>>>>>>>        [ 2032.716559] amd_isp_capture amd_isp_capture: -><- fail respid unknown respid(0x30002)
>>>>>>>>>>>
>>>>>>>>>>> And the video never unfreezes. I haven't found the cause for the regression yet;
>>>>>>>>>>> can you try to reproduce it?
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Really weird, we don't see this issue either in dev or QA test. Is it 100%
>>>>>>>>>> reproducible and any other fail or err in the log?
>>>>>>>>>
>>>>>>>>> Yes, it's 100% reproducible. There's no other message in dmesg, only that one.
>>>>>>>>>
>>>>>>>>> Sometimes there is a stop stream error when I close cheese after it froze:
>>>>>>>>>
>>>>>>>>>       [  656.540307] amd_isp_capture amd_isp_capture: fail to disable stream
>>>>>>>>>       [  657.046633] amd_isp_capture amd_isp_capture: fail to stop steam
>>>>>>>>>       [  657.047224] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
>>>>>>>>>
>>>>>>>>> When I revert to v4 I cannot reproduce it at all. It seems to be something in
>>>>>>>>> v4 -> v5 that is not fixed by any of my changes.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Hi Sultan, could you please try following modifications on top of v5 to see
>>>>>>>> if it helps?
>>>>>>>>
>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>> b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>> index 39c2265121f9..d571b3873edb 100644
>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>> @@ -97,7 +97,7 @@
>>>>>>>>
>>>>>>>> #define ADDR_SPACE_TYPE_GPU_VA          4
>>>>>>>>
>>>>>>>> -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
>>>>>>>> +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
>>>>>>>>
>>>>>>>> /*
>>>>>>>>      * standard ISP mipicsi=>isp
>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>> b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>> index 248d10076ae8..acbc80aa709e 100644
>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>> @@ -697,7 +697,7 @@ static int isp4sd_stop_resp_proc_threads(struct
>>>>>>>> isp4_subdev *isp_subdev)
>>>>>>>>            return 0;
>>>>>>>> }
>>>>>>>>
>>>>>>>> -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>>>>>>>> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool
>>>>>>>> irq_enabled)
>>>>>>>> {
>>>>>>>>            struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>>>>>>>>            unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
>>>>>>>> @@ -716,8 +716,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev
>>>>>>>> *isp_subdev)
>>>>>>>>                    return 0;
>>>>>>>>            }
>>>>>>>>
>>>>>>>> -       for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>> -               disable_irq(isp_subdev->irq[i]);
>>>>>>>> +       if (irq_enabled)
>>>>>>>> +               for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>> +                       disable_irq(isp_subdev->irq[i]);
>>>>>>>>
>>>>>>>>            isp4sd_stop_resp_proc_threads(isp_subdev);
>>>>>>>>            dev_dbg(dev, "isp_subdev stop resp proc streads suc");
>>>>>>>> @@ -813,7 +814,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev
>>>>>>>> *isp_subdev)
>>>>>>>>
>>>>>>>>            return 0;
>>>>>>>> err_unlock_and_close:
>>>>>>>> -       isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>> +       isp4sd_pwroff_and_deinit(isp_subdev, false);
>>>>>>>>            return -EINVAL;
>>>>>>>> }
>>>>>>>>
>>>>>>>> @@ -985,7 +986,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int
>>>>>>>> on)
>>>>>>>>            if (on)
>>>>>>>>                    return isp4sd_pwron_and_init(isp_subdev);
>>>>>>>>            else
>>>>>>>> -               return isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>> +               return isp4sd_pwroff_and_deinit(isp_subdev, true);
>>>>>>>> }
>>>>>>>>
>>>>>>>> static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
>>>>>>>
>>>>>>> No difference sadly; same symptoms as before. FYI, your email client broke the
>>>>>>> patch formatting so I couldn't apply it; it hard wrapped some lines to 80 cols,
>>>>>>> replaced tabs with spaces, and removed leading spaces on each context line, so I
>>>>>>> had to apply it manually. To confirm I applied it correctly, here is my diff:
>>>>>>>
>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>> index 39c2265121f9..d571b3873edb 100644
>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>> @@ -97,7 +97,7 @@
>>>>>>>     #define ADDR_SPACE_TYPE_GPU_VA          4
>>>>>>> -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
>>>>>>> +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
>>>>>>>     /*
>>>>>>>      * standard ISP mipicsi=>isp
>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>> index 4bd2ebf0f694..500ef0af8a41 100644
>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>> @@ -669,7 +669,7 @@ static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
>>>>>>>     	return 0;
>>>>>>>     }
>>>>>>> -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>>>>>>> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool irq_enabled)
>>>>>>>     {
>>>>>>>     	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>>>>>>>     	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
>>>>>>> @@ -688,8 +688,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>>>>>>>     		return 0;
>>>>>>>     	}
>>>>>>> -	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>> -		disable_irq(isp_subdev->irq[i]);
>>>>>>> +	if (irq_enabled)
>>>>>>> +		for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>> +			disable_irq(isp_subdev->irq[i]);
>>>>>>>     	isp4sd_stop_resp_proc_threads(isp_subdev);
>>>>>>>     	dev_dbg(dev, "isp_subdev stop resp proc streads suc");
>>>>>>> @@ -785,7 +786,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
>>>>>>>     	return 0;
>>>>>>>     err_unlock_and_close:
>>>>>>> -	isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>> +	isp4sd_pwroff_and_deinit(isp_subdev, false);
>>>>>>>     	return -EINVAL;
>>>>>>>     }
>>>>>>> @@ -957,7 +958,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
>>>>>>>     	if (on)
>>>>>>>     		return isp4sd_pwron_and_init(isp_subdev);
>>>>>>>     	else
>>>>>>> -		return isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>> +		return isp4sd_pwroff_and_deinit(isp_subdev, true);
>>>>>>>     }
>>>>>>>     static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
>>>>>>>
>>>>>>>> On the other hand, please also add the patch in amdgpu which sets *bo to
>>>>>>>> NULL in isp_kernel_buffer_alloc() which you mentioned in another thread.
>>>>>>>
>>>>>>> Yep, I have been doing all v5 testing with that patch applied.
>>>>>>>
>>>>>>> BTW, I have verified the IRQ changes are not the cause for the regression; I
>>>>>>> tested with IRQs kept enabled all the time and the issue still occurs.
>>>>>>>
>>>>>>> I did observe that ISP stops sending interrupts when the video stream freezes.
>>>>>>> And, if I replicate the bug enough times, it seems to permanently break FW until
>>>>>>> a full machine reboot. Reloading amd_capture with the v4 driver doesn't recover
>>>>>>> the ISP when this happens.
>>>>>>>
>>>>>>> As an improvement to the driver, can we do a hard reset of ISP on driver probe?
>>>>>>> I am assuming hardware doesn't need too long to settle after hard reset, maybe
>>>>>>> a few hundred milliseconds? This would ensure ISP FW is always in a working
>>>>>>> state when the driver is loaded.
>>>>>>>
>>>>>
>>>>> Actually, each time the camera is activated, the ISP driver powers on the
>>>>> ISP and initiates its firmware from the beginning; when the camera is
>>>>> closed, the ISP is powered off..
>>>>
>>>> Hmm, well I am able to put the ISP in a completely unusable state that doesn't
>>>> recover when I unload and reload amd_capture. Or maybe it is the sensor that is
>>>> stuck in a broken state?
>>>
>>> Here is the log output when I try to start cheese after unloading and reloading
>>> amd_capture, where the ISP is in the broken state that requires rebooting the
>>> laptop (annotated with notes of what I saw/did at each point in time):
>>>
>>> ==> opened cheese
>>> ==> cheese froze after a few seconds
>>> ==> closed cheese
>>>     [   34.570823] amd_isp_capture amd_isp_capture: fail to disable stream
>>>     [   35.077503] amd_isp_capture amd_isp_capture: fail to stop steam
>>>     [   35.077525] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
>>> ==> unloaded amd_capture
>>> ==> loaded amd_capture
>>> ==> opened cheese
>>>     [  308.039721] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
>>>     [  308.043961] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
>>>     [  308.044188] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.044194] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.044196] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.044197] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.044199] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.044201] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.044202] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.065226] amd_isp_capture amd_isp_capture: power up isp fail -22
>>>     [  308.174814] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
>>>     [  308.177807] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
>>>     [  308.178036] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.178043] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.178044] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.178045] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.178046] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.178047] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.178049] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.198776] amd_isp_capture amd_isp_capture: power up isp fail -22
>>>     [  308.306835] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
>>>     [  308.311533] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
>>>     [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.311724] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
>>>     [  308.335281] amd_isp_capture amd_isp_capture: power up isp fail -22
>>>
>>
>> Thanks Sultan for the detailed info, I agree with you, tend to believe it
>> may related to the sensor, I will follow up with the FW team to investigate
>> further.
>>
>>>>>>> Thanks,
>>>>>>> Sultan
>>>>>>
>>>>>> A small update: I reproduced the issue on v4, but it took several more cycles of
>>>>>> closing/opening cheese and waiting 30s compared to v5.
>>>>>>
>>>>>> Right now my best guess is that this is a timing issue with respect to FW that
>>>>>> was exposed by the v5 changes. v5 introduced slight changes in code timing, like
>>>>>> with the mutex locks getting replaced by spin locks.
>>>>>>
>>>>>> I'll try to insert mdelays to see if I can expose the issue that way on v4.
>>>>>>
>>>>>
>>>>> Could you kindly provide the FW used?
>>>>
>>>>     commit a89515d3ff79f12099f7a51b0f4932b881b7720e
>>>>     Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>     Date:   Thu Aug 21 15:40:45 2025 -0400
>>>>
>>>>         amdgpu: Update ISP FW for isp v4.1.1
>>>>         From internal git commit:
>>>>         24557b7326e539183b3bc44cf8e1496c74d383d6
>>>>         Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>
>>>> Sultan
>>>
>>> Sultan
>>
>> -- 
>> Regards,
>> Bin
>>
> 
> Thanks, Bin. I looked deeper at the code and didn't find any reason the issue
> could be due to the driver. Also, the problem happens outside of cheese for me
> (like in Chromium with Zoom meetings), so v5 of the driver is pretty much
> unusable for me until this issue is fixed. :(
> 

Oh, really sad to hear that :(, there must be some difference between 
our platforms because we still can't reproduce the issue you mentioned, 
to help on this, would you share more info like your Ubuntu version, 
Kernel version/source, ISP driver version, BIOS version, .config used to 
build the kernel, FW: commit a89515d3ff79f12099f7a51b0f4932b881b7720e.
Just wondering, if possible, could you provide the kernel image either 
so we can directly test on it. Also, the HW is not broken, right?


> I've attached a v2 of my big patch, which includes more improvements and another
> ringbuffer bug fix. Please check the ringbuffer logic on the FW side to make
> sure FW doesn't have the same bug, where it may let rd_ptr == wr_ptr upon
> filling the ringbuffer, even though rd_ptr == wr_ptr is supposed to indicate the
> ringbuffer is empty.
> 

Thank you for your huge contribution. We'll review, verify, and merge as 
much as possible into v6 and hope this marks the final significant 
update. We typically avoid large changes to reduce regression risks and 
minimize additional debugging, testing, and schedule impact.

> Also, I have a suggestion for a FW change to improve IRQ handling in the driver:
> 
> 1. Change ISP_SYS_INT0_ACK behavior so that it also clears the acked interrupts
>     from ISP_SYS_INT0_EN.
> 

Based on my understanding, this pertains to the hardware design and 
cannot be modified.

> 2. Change ISP_SYS_INT0_EN behavior so that it only enables the interrupts in the
>     provided mask, so RMW of ISP_SYS_INT0_EN in the driver won't be necessary to
>     re-enable interrupts for a stream.
> 

I'm not sure I understand your point. Are you saying that 
ISP_SYS_INT0_EN only considers '1' in the mask and ignores '0'? If 
that's the case, I'm curious about how to disable an interrupt. Also, 
this is also determined by the hardware design.

> Sultan

-- 
Regards,
Bin


