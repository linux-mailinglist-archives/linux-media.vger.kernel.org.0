Return-Path: <linux-media+bounces-38816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5688B19A81
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 05:32:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5631E18978D4
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 03:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFBD19B5A7;
	Mon,  4 Aug 2025 03:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jcTtA7T/"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BC62E36F6;
	Mon,  4 Aug 2025 03:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754278345; cv=fail; b=kRFd9NyI3EqonKaPhMlSfeX8BcGTJZpJgHFmeT6EjHmUPodNS0olOKubTIwnrlp2PW7rczwbmIrmGanJpokXdxXi+1fupoF350FumCSRiAsRmiRc/W+kquwwoDc6OP48+Sx3nFFpA2DzrymhLJDEjo6HcBHfe11sw96scKHdbXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754278345; c=relaxed/simple;
	bh=glV7VZsMd5mUx50t5Bf3YOhvEl2GT+lOP/ijmOEPEUM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LS+drDEwhElOtCflleut2aqHRkuat6Xuub1AnoXoZQ6o6BR1XSPvaoOv7KIVymcX4vWqQ4OYH9QzrxhAaAvSazcNUMsUNDNzxFzsWrSxvziD6eKpJCp86qrrMALejjg2vhlD+E19d2Ds4jOtYwr8yHT3sB5Wyf5/hpclQmBxEP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jcTtA7T/; arc=fail smtp.client-ip=40.107.93.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0U4gJkF5k1KaYaWiju5psxyIosTx5gW6CcFmQE8a2EHTje3b2lMJvXptHWQzjUFORGVXF37EFRbAAMgem3k1WXC6m6Jn6UAPXHKBdVwXTblX4h3osvzXKiPR5E1Gz27RMoxmD0wJn5e4geX9m29iMJ/ta3nOZt1P1sZS26+wo2Rd3gWt/7IJfoUNYKu8EohtHri/F9KkoRpGBe+3hNLDVEOHduTJkjJSjZB572luyh571kZo2viS104eqcr3rwwD+eabUYOmXzVapjqIUELxuFz8gpNlMpP2N2GrpjDyqi9/X6Z8y6XbDwy79iPNMtAo4Qt+OCZKpd66ZwbubTKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBiDTY0OomDTlHHY2KkMtYMZzEyIvnjYMgCUtapFFBk=;
 b=eZkT6yCf2+iv/lHB1n6x1nZuT0G/fmXyhYLjGmOPeCZycB0MJQUSwqdG0xrYMOwvoh+Olo0/e3Z1rijyNkQGE/yMnPRbSFJ21Q9nDKJAup58QBSOr6Qa1vvzVyBXYPUFzhElv6B52HDXxgZdntwFpMWlWyne9ny/BCF6fzhDM9qCaylSZqpgQHzGabO4aeBrGy+SlFuBIgDG3McXt4OzCyLUe6LBJwuyDo2C4y7SBYK0N4jLsU+6OFUSTnzKarFA5XAXz1YKKCXMmC9Ip7G/VBLgx6Zs0xj/YQ5f6GyvcMn9D8P72NXCqQDiz+i++liAQKUJJzbHMyrC1ilZ9PuAUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBiDTY0OomDTlHHY2KkMtYMZzEyIvnjYMgCUtapFFBk=;
 b=jcTtA7T/0Oa2pYn9FxpsHhiyE2DskBOw2YAKQDrCrZJ1Z1UQvWwN1hEDruKAQdkixHi172jwmsnoejvmXhkWg686F1oHfOwGjmErOHc+THKX3DxufrhX9iU67XWV2d9niQYt+5KkEle/pTYokbsiapJXagkaV2lNcGFidOpBqk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by LV9PR12MB9830.namprd12.prod.outlook.com (2603:10b6:408:2ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Mon, 4 Aug
 2025 03:32:20 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.026; Mon, 4 Aug 2025
 03:32:19 +0000
Message-ID: <d8c99b00-e8f2-49bb-8c72-ebc4e783e51d@amd.com>
Date: Mon, 4 Aug 2025 11:32:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aIEmJXNpNN0QF233@sultan-box> <12fb4d09-6b94-4f54-86b8-8a3ac0949151@amd.com>
 <aIVXVpg_9XxRXUAH@sultan-box> <b02d0749-6ecb-4e69-818a-6268f894464d@amd.com>
 <aIh7WB0TGNU15Zm1@sultan-box> <aIh8JPTv9Z5lphRQ@sultan-box>
 <751e9265-889f-4fbf-acf8-7374311a6b6f@amd.com> <aImvvC9JEgQ2xBki@sultan-box>
 <a3272335-1813-4706-813e-a79a9cabc659@amd.com> <aIq5EyQ_uuO63dJb@sultan-box>
 <1a9a4beb-97ab-4853-8201-bf08f1a030ab@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <1a9a4beb-97ab-4853-8201-bf08f1a030ab@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|LV9PR12MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: b5eee6e9-fbd6-410e-8ac1-08ddd30783eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cy91YXhjU3R4NFRRaXprVDlxL2hzRHJHeGJqRWlwd3RJVUp0bTBXeGdORDF1?=
 =?utf-8?B?eTVTaytOWnFnTFRUTXZoLytmN0ZjSTJaeUlMRzFZNklrbVNDQXRzZzRSUGxi?=
 =?utf-8?B?aDRHcHdaa29jcTJ2UjdZZXNiSlpqL0FYT2xmbVBtL3BCMnFEOCtPRmxnWDJD?=
 =?utf-8?B?Y2JuU3dRRTlkNWdtQU9SYXhFNWNSRXN1MFo3NWJpRVQ3bW5xdGdZRkx3NU9p?=
 =?utf-8?B?WEk3WUoxbkZhQlhoenBzSklWdUZsVGtoVDF2dm9tTFRpWU1LN1pjd21qWGVF?=
 =?utf-8?B?eU91eFc5T0diaDBLbWg4RmNORTF2QzhBb3NSaWZXU2kvUS84NFVoUkZwcERq?=
 =?utf-8?B?bzFzSnA1WEVpRElGelV3cmpjaHVYZzBweXhaakdEUG1pL0JIQXJVakthSC9R?=
 =?utf-8?B?b1hKTzlzTUY0aUxWNE1DckJMdDFacXJqNmV4TWZzU2xwYW5Td2JVcllWN2tn?=
 =?utf-8?B?YkxxU0xibDd6dVFoN0xCQkwxMXFmTm5RZXlPYjdxcXdHN2UwUUowRmtmMi9H?=
 =?utf-8?B?Z3FMVU1qK3JOUDNmUVROVUJOaHZtTExSY0RmOFQ5ZGxwWGlPRFJRZDRiZDlL?=
 =?utf-8?B?ak44b0JhRm9CZVlrcFZxUE5tQjdzNGdPVFJvL2lhOXREWHE3d3htZ3lXUzFm?=
 =?utf-8?B?NkNXN0g2RXBVaGhYUkhjMHF2RndSS3lQSUE3MGFndWxHMjFnR0lhbHF0SnBo?=
 =?utf-8?B?S2xLSlp6NkMzMGoxRS80S2lOcnk5QkdvZVFUY0tPTXJZakpHUWpvU2N2NjBs?=
 =?utf-8?B?akZzU1hWT25rS1hsd3dlQWdNdjZDaE5DN0QzSkQ3TEY4MysyZC9ub1E5Snhm?=
 =?utf-8?B?WlhkSGlUcVZQV3Z0SG40RHQyVFJBNzF2Ty9HZHdLS1JLNVdCTSthdFlzYUdo?=
 =?utf-8?B?aW1HQ1Q2di95Q2ZyWVFRbXpNODM4R1hITHdmeWxUYkdoOVBjUVlNRVdaYTJn?=
 =?utf-8?B?ZXI3a0lMT0JIbld2bnlNZjhhM2pHRlVJd1cvamdaM0hXaTkxTkNiV1RMVXJ6?=
 =?utf-8?B?aHc1UTczR2tCb1Y2WkVIRmRobTJSR09hNkRrV0hqMVdybjQzRDB3bm41eVhs?=
 =?utf-8?B?eWNPKzE2d09ZNFc5ZHhiZDJyaUs2TzQ0UmJEZ0IzMnlFZ3lDQmJ3dnRlMzBL?=
 =?utf-8?B?S0FqQkp5d3dlMHlpQ2lvMnZhWVA5azNQWnpFSkhQcVc0N1VnaUVXRzAxdUhk?=
 =?utf-8?B?ZlR2SmlTNnM4eTJqUzQvWDV3N1dOMXVmK3JUUGZsbWVNNEsyZXNrSlpsQlB3?=
 =?utf-8?B?NU9GS2IwVFhWdkdVb2txbzMyc21WdmhoclJlVkU2eDNZS0N6KzA4azEwaGUz?=
 =?utf-8?B?bzV2aC9rblh4Y2NEN1U2VVV0ZWtnMlhwZk5BMG9OMHV6eVdjU2t1WUsxdzhP?=
 =?utf-8?B?TnF6MHFDTUNmUk52SVBRY2FLcjhZTURTNHc5WVRPYnRHb1JMK0JCSlJyb1Z1?=
 =?utf-8?B?TlR2bXhPak5Ua0IzclRHZlVocUN1aXBHWkd0QXN4YlVBSUVrZzV0VHZIZkxy?=
 =?utf-8?B?dHd5VktCa0dxdkhBMDNCYnFPWXFiRklOcHBqT1d1RzZOeGNBZHZYdzArQ1pw?=
 =?utf-8?B?RHVjempFN3B4ZTNhaFB2SEtOVzNiRzJZYjFYVjZJU0g0RFhWSy90SUdhclJk?=
 =?utf-8?B?ZTk0eUc3SGxVbHIxcmxTYS9XRVF4ZndRYjJzUm05ZUVHS2hVZ3FEWVNoZlRG?=
 =?utf-8?B?dUhYcS8vN252WFJZMmo2TUI4TTEzckhaamhadkFONHlIOEJhcTgzZ1k4NmV6?=
 =?utf-8?B?d3FsYTZGQTlZQnBCb1haUjhvVmJpZFFJbnhEQjNhU1J3QzVLZC9Nd3V6YktL?=
 =?utf-8?B?K3dTYjZYcXZCWHR1ZG9SczRYNFYveUp4NW9yOFJMN0tmMmdrT2ZHN2ZkR3M5?=
 =?utf-8?B?bUZRb0xmV25aNWRoRUQxWjQzeHFValdmeHpoUmZkb2VDOVFmL016dG44My9R?=
 =?utf-8?Q?JOtJbyJYIc8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEkzZFQ2U3hLeU5acXhnTVJjUEZGVFA4TTNUanc5aUR1RkdNWGYrdCtYU0RO?=
 =?utf-8?B?UzFuRXRnOCsxWmhIZDhmTzFhZ3NTbEFsbmRFeHcrcjFJWUZnSHVUWVNpZ1Zk?=
 =?utf-8?B?YkdheU1acVlNcWRYeDM2WVZpVEErV3Voemh5VExHcjdvT2h5VFpOYkRJNHBB?=
 =?utf-8?B?MVhpa09WZ05kelVTaURGYk5FQWRkNzZSMC9FWUVxbndMZWNmMDV5d21HcHg4?=
 =?utf-8?B?anpCUkJCQ3BRQ2Z2RGp5V3BTbnpBS0VnWVpYcWIwYVpzWHpxc0xIWjV4VEpy?=
 =?utf-8?B?SWQxUFF2bk1pQmFpcHlNazlPbE85UlJiTjVWRmF6TVlkUmFSZnM5cjlGWmVG?=
 =?utf-8?B?UjRwTzJpc2E4NUdsUmpKN0JoNzVvMnM4alFoSm80Zm5CZVBOZGZmVWZwN1dP?=
 =?utf-8?B?RUh0c3NxZEx2dllnU2pRQjNBckdwd3JQL2xscks5UE5HSy8zRmVhdTdJNG1h?=
 =?utf-8?B?bk9TUkRjNGRDMmJHbEhOelEyMUJMS0ZCendFd2l3THZXSmNXbWROVEF6VmVK?=
 =?utf-8?B?VnBiZGczV2NoYzNRZUtpcDFoU1pUUFVhRkJsR3VRaGZsUzlIVVVPS21DUUhr?=
 =?utf-8?B?RnE3TzZnOFkyL1o1YzlyOVZKdU90b1JkRE45dWJJczRIc0hkdFRNWVRDeTNn?=
 =?utf-8?B?bUJwY3kvOEpjWmFDdkxYSXlFcmNyY0g0eFAvcjJXc3AwK1NWNG9MbURNSTdS?=
 =?utf-8?B?anpxWmJKM2dsWFhKeFdkRXhrZGpuZDk1OTVVQVI0MTNadmNFNlpnalJJOE9W?=
 =?utf-8?B?aTJybjEwU0RFdXJJc29ZVDBqeG8rakZENmVzOFl3d0RlY005RmlYdW9ZUzZE?=
 =?utf-8?B?OWx2V2psRnZ0ZlQ5R0ZrZGprTk5mbnFydTRsTDh5a3AwemNhcks3SVVBazlD?=
 =?utf-8?B?aVBSY0VObG85RVJDQlBma2I4dzQ5ZHlOUHZQWml4aWkxUlhrMzUrZmxQdElT?=
 =?utf-8?B?dHZZZDQxWnk1cVJtZDNCUlJaNWRHMW5yOW1RRlhxbWZKeVRUazlHa3BOTTFR?=
 =?utf-8?B?cThmNXRocUZacWZaWEIxakNJd3Iwb1REb0lnc0pNaTRseUVHbmF5K1VlT2Jv?=
 =?utf-8?B?MkZUTkpiV29pcDFSVFRwaVJtV21UQjgreGV1eGhaKzlvMWN6bWFsYzNpWXpQ?=
 =?utf-8?B?cFJMZkh6YUxwTnJMY0R2U3J0ZncvQmdBU0Mwb1E4cG9SNytTQXFMQjFLNDJU?=
 =?utf-8?B?VU0zKy9wYjg4cndaMWpqQlVTZGxZRmY2QXR4OWNyeVZOenVKOUpORmY1aytw?=
 =?utf-8?B?QUMyM003cGNCS3FFZEFuditpdjNmZzZieXdFUXFqaFgvVDBlYllTUnVqY05V?=
 =?utf-8?B?T0ZhNWRnZmVFbnhYRDY0T21qNEZKbXpYRlJwWG0zcDJhN0Y0R2Vvc0lzK0lq?=
 =?utf-8?B?clVaVmxrUnFjSUttcXpxTUhXbUszSnlnWG40STV3NmNNQ0g5K0dkSnFES3Vx?=
 =?utf-8?B?MFg4SUF2MXR3WG9nVG9QRWM5ak5ZdlZkYmcrSkRXQmdFTllwd3BhYnQ5djBX?=
 =?utf-8?B?cG9FYUM3bnZ1NHVLWk81RnkrWVd0c0UrQytiWkZtVkNjUFZPUnNqRGx4V0cw?=
 =?utf-8?B?OHkxbWh0dWQ3SlhQOEduVGxUZ2xKbTRNRXRjWDVyazJzZ2cyRkwyUlRzN0Rs?=
 =?utf-8?B?b3hKYlkveFd6WWxxSEJ1L3Z1bFNZa29TaDd2WWhrSXNwUVRjeTJGWjllMVhE?=
 =?utf-8?B?KzgrVnpGR09QS1BRa1h2QmdhOGZQUkRSR2I4MUpHR1pkWEo3dTVUNDVTRDQ0?=
 =?utf-8?B?WHMzMEhkVTJNSHBkRFJ0ZUc0VEp6OXl0eFNWWG1Qd1o4ZUUrQnVWaHJqTWVN?=
 =?utf-8?B?ZHVDa1FpdmR1Zlg2dFFkcW8rMWVRUnhXdGdJeVdwREhGdkp5REQ3UjlOay9T?=
 =?utf-8?B?N082VFJZbGk0cXN5UStoYVFnSWNzaHZzcSs5UEZia256dkJZdy9XUDlraHV3?=
 =?utf-8?B?bXBXTTR0aEZZMURxWWRReCtseDJ2RllFZTZmN0JkNUlBeGpwTVY4VDZRL2xj?=
 =?utf-8?B?dkRiU1RwaC9PUjZpeGFPNmoxdHV6dUprS0pqOSsrWCtNUVQ4dUN6WkdDb1NH?=
 =?utf-8?B?bVhnSzFsbW9EMHNmako3cUpWVEV1VW54M3FKTEhHTERXZ2RMamZwWDNIYk9N?=
 =?utf-8?Q?JNHc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5eee6e9-fbd6-410e-8ac1-08ddd30783eb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 03:32:19.2668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/go6FIfK2xMiVUSuN+3NUZsIxdSmaKtiZkm7ljfQixPJFBgu4HjG/0kaJum+w9P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9830

Hi Sultan,

This is the conclusion of your test,
Driver: 
https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
[1] It works on FW      8f070131(ext):39b00736(int)
[2] It can't work on FW 1cc8c1bf(ext):50582024(int)

Would you please help to check if CONFIG_VIDEO_OV05C is defined not in 
the .config file when building the kernel? Our assumption is to make [1] 
work, CONFIG_VIDEO_OV05C shouldn't be defined. to make [2] work, 
CONFIG_VIDEO_OV05C should be defined.

Regards,
Bin

On 7/31/2025 6:04 PM, Du, Bin wrote:
> Thanks Sultan for your test
> 
> On 7/31/2025 8:30 AM, Sultan Alsawaf wrote:
>> On Wed, Jul 30, 2025 at 05:53:58PM +0800, Du, Bin wrote:
>>> On 7/30/2025 1:38 PM, Sultan Alsawaf wrote:
>>>> On Tue, Jul 29, 2025 at 06:13:50PM +0800, Du, Bin wrote:
>>>>> On 7/29/2025 3:45 PM, Sultan Alsawaf wrote:
>>>>>> On Tue, Jul 29, 2025 at 12:42:16AM -0700, Sultan Alsawaf wrote:
>>>>>>> On Tue, Jul 29, 2025 at 11:32:23AM +0800, Du, Bin wrote:
>>>>>>>> Thanks Sultan, please see my comments
>>>>>>>>
>>>>>>>> On 7/27/2025 6:31 AM, Sultan Alsawaf wrote:
>>>>>>>>> On Fri, Jul 25, 2025 at 06:22:03PM +0800, Du, Bin wrote:
>>>>>>>>>>> I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
>>>>>>>>>>>
>>>>>>>>>>> I cannot for the life of me get the webcam working under 
>>>>>>>>>>> Linux. The webcam works
>>>>>>>>>>> under Windows so it's not a hardware issue.
>>>>>>>>>>>
>>>>>>>>>>> With this patchset and all of the patches you link here 
>>>>>>>>>>> applied to 6.15, I get
>>>>>>>>>>> the following errors:
>>>>>>>>>>>        [   11.970038] amd_isp_i2c_designware 
>>>>>>>>>>> amd_isp_i2c_designware: Unknown Synopsys component type: 
>>>>>>>>>>> 0xffffffff
>>>>>>>>>>>        [   11.973162] amd_isp_i2c_designware 
>>>>>>>>>>> amd_isp_i2c_designware: error -19: i2c_dw_probe failed
>>>>>>>>>>>
>>>>>>>>>>> With the old ispkernel code from February [1] applied on 
>>>>>>>>>>> 6.15, the webcam
>>>>>>>>>>> indicator LED lights up but there's no image. I see these 
>>>>>>>>>>> messages at boot:
>>>>>>>>>>>        [    9.449005] amd_isp_capture amd_isp_capture.1.auto: 
>>>>>>>>>>> amdgpu: AMD ISP v4l2 device registered
>>>>>>>>>>>        [    9.489005] amd_isp_i2c_designware 
>>>>>>>>>>> amd_isp_i2c_designware.2.auto: The OV05 sensor device is 
>>>>>>>>>>> added to the ISP I2C bus
>>>>>>>>>>>        [    9.529012] amd_isp_i2c_designware 
>>>>>>>>>>> amd_isp_i2c_designware.2.auto: timeout while trying to abort 
>>>>>>>>>>> current transfer
>>>>>>>>>>>        [    9.554046] amd_isp_i2c_designware 
>>>>>>>>>>> amd_isp_i2c_designware.2.auto: timeout in disabling adapter
>>>>>>>>>>>        [    9.554174] amd_isp_i2c_designware 
>>>>>>>>>>> amd_isp_i2c_designware.2.auto: timeout while trying to abort 
>>>>>>>>>>> current transfer
>>>>>>>>>>>        [    9.580022] amd_isp_i2c_designware 
>>>>>>>>>>> amd_isp_i2c_designware.2.auto: timeout in disabling adapter
>>>>>>>>>>>
>>>>>>>>>>> And then the kernel crashes due to the same use-after-free 
>>>>>>>>>>> issues I pointed out
>>>>>>>>>>> in my other email [2].
>>>>>>>>>>>
>>>>>>>>>>> Any idea what's going on?
>>>>>>>>>>>
>>>>>>>>>>> [1] https://github.com/amd/Linux_ISP_Kernel/commit/ 
>>>>>>>>>>> c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
>>>>>>>>>>> [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
>>>>>>>>>> Hi Sultan,
>>>>>>>>>>
>>>>>>>>>> [1] is for kernel 6.8, believe it can't be applied to 6.15. We 
>>>>>>>>>> didn't verify
>>>>>>>>>> on 6.15 but we are really glad to help, would you please 
>>>>>>>>>> provide some info,
>>>>>>>>>> 1. Suppose you are using Ubuntu, right? What's the version?
>>>>>>>>>> 2. 6.15, do you mean https://github.com/torvalds/linux/tree/ 
>>>>>>>>>> v6.15 ?
>>>>>>>>>>
>>>>>>>>>> After your confirmation, we'll see what we can do to enable 
>>>>>>>>>> your camera
>>>>>>>>>> quickly and easily
>>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> Bin
>>>>>>>>>
>>>>>>>>> Thank you, Bin!
>>>>>>>>>
>>>>>>>>> 1. I'm using Arch Linux with the ISP4-patched libcamera [1].
>>>>>>>>> 2. Yes, here is my kernel source [2].
>>>>>>>>>
>>>>>>>>> I have some more findings:
>>>>>>>>>
>>>>>>>>> Currently, the first blocking issue is that the I2C adapter 
>>>>>>>>> fails to initialize.
>>>>>>>>> This is because the ISP tile isn't powered on.
>>>>>>>>>
>>>>>>>>> I noticed that in the old version of amd_isp_i2c_designware 
>>>>>>>>> [3], there were
>>>>>>>>> calls to isp_power_set(), which is available in the old ISP4 
>>>>>>>>> sources [4].
>>>>>>>>> Without isp_power_set(), the I2C adapter always fails to 
>>>>>>>>> initialize for me.
>>>>>>>>>
>>>>>>>>> How is the ISP tile supposed to get powered on in the current 
>>>>>>>>> ISP4 code?
>>>>>>>>>
>>>>>>>> You are correct, yes, i believe the I2C adapter failure is 
>>>>>>>> caused by ISP not
>>>>>>>> being powered up. Currently in latest code, isp_power_set is no 
>>>>>>>> longer
>>>>>>>> available, instead, we implemented genPD for ISP in amdgpu
>>>>>>>> https://lore.kernel.org/all/20250618221923.3944751-1- 
>>>>>>>> pratap.nirujogi@amd.com/
>>>>>>>> Both amd_isp_i2c and amd_isp_capture are in the power domain and 
>>>>>>>> use the
>>>>>>>> standard runtime PM API to do the power control
>>>>>>>
>>>>>>> Thanks for that link, I found it along with another patch on the 
>>>>>>> list to make
>>>>>>> the fwnode work ("drm/amd/amdgpu: Initialize swnode for ISP MFD 
>>>>>>> device").
>>>>>>>
>>>>>>>>> Also, I noticed that the driver init ordering matters between 
>>>>>>>>> all of the drivers
>>>>>>>>> needed for the ISP4 camera. In particular, 
>>>>>>>>> amd_isp_i2c_designware and amd_isp4
>>>>>>>>> must be initialized before amd_capture, otherwise amd_capture 
>>>>>>>>> will fail to find
>>>>>>>>> the fwnode properties for the OV05C10 device attached to the 
>>>>>>>>> I2C bus.
>>>>>>>>>
>>>>>>>>> But there is no driver init ordering enforced, which also 
>>>>>>>>> caused some issues for
>>>>>>>>> me until I figured it out. Maybe probe deferral (-EPROBE_DEFER) 
>>>>>>>>> should be used
>>>>>>>>> to ensure each driver waits for its dependencies to init first?
>>>>>>>>>
>>>>>>>> amd_isp_capture only has dependency on amd_isp4 which is the 
>>>>>>>> ACPI platform
>>>>>>>> driver, it is init before amd_isp_catpure.
>>>>>>>> Do you see in your side the amd_capture probe failure caused by 
>>>>>>>> failing to
>>>>>>>> read fwnode properties? If that's the case please help to check 
>>>>>>>> if amd_isp4
>>>>>>>> is loaded successfully
>>>>>>>
>>>>>>> I got much further now: there aren't any driver initialization 
>>>>>>> errors, but when
>>>>>>> I open the camera, there's no image. The camera LED turns on so 
>>>>>>> it's active.
>>>>>>>
>>>>>>> And then shortly afterwards, amdgpu dies and the entire system 
>>>>>>> freezes.
>>>>>>>
>>>>>>> I've attached my full dmesg, please let me know what you think. 
>>>>>>> Thanks!
>>>>>>
>>>>>> I almost forgot, here is my current kernel tree:
>>>>>> https://github.com/kerneltoast/kernel_x86_laptop/tree/v6.16- 
>>>>>> sultan-isp4
>>>>>>
>>>>>> Sultan
>>>>>
>>>>> Thanks Sultan, yes, seems much close to the final success. Will 
>>>>> have some
>>>>> internal discussion.
>>>>
>>>> I got the webcam working. The same bug happened when I tried 
>>>> Ubuntu's linux-oem
>>>> kernel, which made me think that the issue was firmware.
>>>>
>>>> And indeed, the culprit was a firmware update from February. I bisected
>>>> linux-firmware and found the commit which broke the webcam for me:
>>>>
>>>>     commit 1cc8c1bfa11251ce8bfcc97d1f15e312f7fe4df0 (HEAD)
>>>>     Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>     Date:   Wed Feb 19 12:16:51 2025 -0500
>>>>
>>>>         amdgpu: Update ISP FW for isp v4.1.1
>>>>
>>>>         From internal git commit:
>>>>         5058202443e08a673b6772ea6339efb50853be28
>>>>
>>>>         Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>
>>>>      amdgpu/isp_4_1_1.bin | Bin 4543184 -> 6083536 bytes
>>>>      1 file changed, 0 insertions(+), 0 deletions(-)
>>>>
>>>> Downgrading firmware to before that commit fixes the webcam. Any 
>>>> idea why?
>>>>
>>>> Thanks,
>>>> Sultan
>>>
>>> So, can i say the working firmware binary is this one?
>>>
>>> Commit 8f070131
>>> amdgpu: Update ISP FW for isp v4.1.1
>>>
>>>  From internal git commit:
>>> 39b007366cc76ef8c65e3bc6220ccb213f4861fb
>>>
>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>
>> Correct.
>>
>>> There are too many changes between them, so i can't tell exactly which
>>> change caused this. So, from my side
>>> 1. Will try these two firmware to see if we have the same issue.
>>> 2. It has been quite a long time since last release, will see if need to
>>> release a latest one.
>>
>> Thanks. It was a quick bisect for me, so I'm happy to help test if a 
>> bisect
>> between those two internal git commits is needed.
>>
> Really appreciate your test.
>> In case it makes a difference, I have the laptop with the 2.8K OLED 
>> display. I'm
>> aware there is one other display variant on other SKUs, which is a 
>> WUXGA IPS.
>>
> Good to know, I believe it won't make any difference for ISP
> 
>> Also, with that old firmware, my camera only works with the old isp4 
>> driver from
>> that Linux_ISP_Kernel repo (which is the same isp4 driver used in 
>> Ubuntu's
>> linux-oem kernel). Does the new isp4 driver you've submitted here 
>> require newer
>> firmware than the old driver located in Linux_ISP_Kernel?
>>
>> Sultan
> 
> We had a try, yes, both of the old FW can't work on the new ISP4 driver, 
> as you know, for the last months, we did lots of driver modifications 
> for upstream and cause it incompatible with old FW.
> Now, under internal discussion to upstream a new FW to support the new 
> ISP driver
> 
> Regards,
> Bin
> 


