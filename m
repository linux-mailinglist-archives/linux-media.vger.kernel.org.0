Return-Path: <linux-media+bounces-44194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2644BCF2F8
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 11:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 955B3188B739
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 09:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B4622422E;
	Sat, 11 Oct 2025 09:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kNH3Wbe0"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010020.outbound.protection.outlook.com [40.93.198.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AAD4594A;
	Sat, 11 Oct 2025 09:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760175064; cv=fail; b=PKpTG+Zcd+X1eai1wvHjaLwfT6c4miu4Ui13Eal440fr1wNAYN/paBg9E+AEoR2xg8QA8vLUYAwKVssgA7Gzn5FAQqUQImhbwxGT9KzWN0mc4kdwYHN6Xyb9p2RL5YY7FXOyy795ECmWZsZ+D1woEWwwb+p9K7V3I7ZWWzZgYkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760175064; c=relaxed/simple;
	bh=B/K2wGrCAnEsegB+iucVLP6QqGN6et+T0Ldnj0O5VHQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=llYDnpEl1k3/U8i1nuLBDC1kOeWZoSGYQmul7ES4/n4pRAjdzvBOvgqQnuxdSpkIzx0crjwhuJ6YwAhHX3xcDrnzPPxrEBUEi26cTMNjdf4Gm3NrWmOtYY3tKBvLVCWFmM/cjFa12S0yoXCL5fvE152cqtCrdVkFF9eKY1wLXgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kNH3Wbe0; arc=fail smtp.client-ip=40.93.198.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKmtU87I9Ky3tM9Ra1hyuGuhOwSvlQW5yc0CYMhrtyMGKaSspszKH1Xre1tdt+Anu7xubISgwaEMsUK1cRRLW3NSrQAX4RX0lsLJKhysER8mvvXnwtHUfkfTfK22yr3ttDU5+1sJX2dnfzKGT2K/xtjPTuo/HNlT4Iy4jvNBNA1efhl8SZIRfcA9AI3zlOclUnvDtrcTtm8Jt/UleJuZIbcMbJ573VWuRN+HNfEKgZN60X3sgQ65XYBQfdGY5gpOh6urqPD0IwyKGUyT+cwAXCSFfaxvOq+gK3Yklc1UZCwpSySLbfl7r8LE1EX9vD1Rm/FaDZWuG3QL7ig3xJpEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfI2DAj8SMoR3gLoMBpNJDxycfmQUteCh0dKqFxm+dk=;
 b=NfISL525j2tFS7kPHzNiS/ePVXIrFpSu5a5MT75n89enBKixkcQSRVA+opyqkHK069Jmy1I+X+djA2pEvtxMDM0Q43Oilqm+/rLIyPEpCV/e0h8jHBAVBW/EDxsFQX+QV1XGJUcUrKQMMGsI9dx13ieAWOTv/vR8Z49frG1rGHXHSLi19QzBIhPUCiS0hSJ9iCq8GLfC+bLSp+lO5lS3R9wz+n/cUSLvop/8BnR8YHpB0DY2ELFxseuAmlHmINOvLdX3sJ9vWtzFJjQpei51JN+JHI+blY/Ku9PnUdqBxYTUtZJBQyXuEoBzxZ2dKPeoR+PEwC231MRv7IkO9HgfLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfI2DAj8SMoR3gLoMBpNJDxycfmQUteCh0dKqFxm+dk=;
 b=kNH3Wbe0ydrrR6LwJoJLnLVx40ZZJJnMg3jziRMfeNpKktr5nHI1olpyYYBu4MxEnzxyhLgYld+OhARxZQ1TaffF2qLr9c4yjrJ/uC/+a5xUug449CqJfP8f7iepU2L1FTEJliU4Kf+zffVe/SZ6N/cL4TUsm3eVmavg92jjK9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Sat, 11 Oct
 2025 09:30:55 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9203.009; Sat, 11 Oct 2025
 09:30:55 +0000
Message-ID: <c28eb905-b578-4512-aa9c-37281d3a0ee4@amd.com>
Date: Sat, 11 Oct 2025 17:30:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] media: platform: amd: isp4 video node and buffers
 handling added
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-6-Bin.Du@amd.com> <aNzP2LH0OwUkMtGb@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aNzP2LH0OwUkMtGb@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:4:188::8) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|CH2PR12MB4184:EE_
X-MS-Office365-Filtering-Correlation-Id: 012f4985-e30e-4f48-9f89-08de08a8e0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aitDNmw2MEgzWVF1elA4VzV0OTZvc2JWRVZFSXJrMWxvZGhGTjQ3dEFBMnRr?=
 =?utf-8?B?RkVqQlRFRGVwVW84Y0s0N1N6Zm1IRDdtOUJpTjh0ZUNRdk1Band6S2JZTThX?=
 =?utf-8?B?Vk82Q2NZVjZ0MEloVUd0WDFKUWR4eExWaWdmaHp4V1k4b2gvRkNSNklCZGVK?=
 =?utf-8?B?Tkd0VXhkRTZCMWtqakR1RGg1NDBaWlVac1g2eXdZUE1zWis2YnhhenhoMEVC?=
 =?utf-8?B?ZWVuYW8rd2s2OTFSYktsQWs1b3JYV1dVWmEyMVl0OEVYdnZJNUNDMllWdjBm?=
 =?utf-8?B?TmdMcFp6VElSYTF1YUtiNHBoZ3owc0t0UzJMTkJjUkVyRWhwZFA5aGJKdllB?=
 =?utf-8?B?bStVWXduRWR6dkhDWVhkSTRRblZFR1VuSGhPajdMQm1VNGwrVEdnaCtKWkNt?=
 =?utf-8?B?UUtwbjdaU2RTTFUzUml3SzNjbGtSbkxxRDU0VE9NTzgrM1VzOHZTcUJndXpO?=
 =?utf-8?B?MW1KTHE0RDYwNGd0eFFFRnpEejMyQnI3QU1sbXY0M1BiQkw3TVI0UE5KcnZt?=
 =?utf-8?B?d05IQWM1SGM4a1F3Y1FLbnk3UWY1d1Zycll3eW1kL1hvZnlwaDZOUVV5NGp6?=
 =?utf-8?B?U2RXdGpqT3JuVlQzNHBQRDkxUXNkcENFOWtWTEI5aVZlM1VjSk9jLytZNkdT?=
 =?utf-8?B?aWdDdjhGL0h1N3Vhck5tbjBSRktFc1FzU05YcE9lSVJFaDhPZU1jeVVIem5x?=
 =?utf-8?B?amRJNkdodndDSUNkRmlOTjZEZ1NCRU5STFhxK1JjVXdIU2VvbWJHZ2EzWTNx?=
 =?utf-8?B?Q21QRWtxalJrRjBmY2tjMGpSdUhhTE1kZzFzVkJjdnBkckNONGxFSlBnNld6?=
 =?utf-8?B?MDVmME1ua3N1YWtweHJHQzQ0TG1nblplRXlHVU1FQjEzVUEzMlljQmdtRU9x?=
 =?utf-8?B?ZzJ3WWhFRnk5M1RaRzdmOEJJSFNOdmFDNkVLU29HcloxNmEvN29reVJIc1JY?=
 =?utf-8?B?d2kwTXQzalpLU0ZtSW1oMlNIOTdXVStWNWRLb0o5ZURFVTVJYUMzTC9QcXNi?=
 =?utf-8?B?cjdSQitBazdiV2NTais1TGtvTE5iZURFUjliVXBUZFBSYUU3SHEvZkpLMUpM?=
 =?utf-8?B?N05yTVB4S3RtcjZ2aG9MbFh6NGI1YWRLUVA4M2FoRnQ5VWdWRHE3SC80VUI2?=
 =?utf-8?B?V2JQZ2p5ZWNGZ0xWSHJNbmVMSFZzUTROQXNZbHRzRXhpTm5EUXRkRSt3YjFx?=
 =?utf-8?B?U09henRPMk1naUxTYjJBT1ZXWWhYSEhDWEd5V0x2S0FSNXJycGpnS240N3lZ?=
 =?utf-8?B?eXAzOHQySDhQbE5ja0tKdW1pdFBObmNTQW5YOWVLY2pzdS90SnFoQSttb3px?=
 =?utf-8?B?TStSd2dkdmQ1MjlVVm5vc0djdHk0NlM0VW1vemRPYUFVeFI2SldhVllXZEg0?=
 =?utf-8?B?QjNLMys4K1drakVuaVk5cm10dWVKc0JGYUtYazdkM0drNXprVnoyUFpaZmRx?=
 =?utf-8?B?V0RFSzM2bFdkRU13OWIrb3ZHQ0dQUmt2M3EwS29sWjdVRTQ1cjNSSWd6NnNw?=
 =?utf-8?B?TWk1S0lHc3c4WnZSYWIxWDM5amZvSXRkUXJCRnJzUVJKdWxzclRNYzA0cFM3?=
 =?utf-8?B?NUMya1J3TTg2WGU5NDBUUjZURkJyZmhoUFhaZ0tQVzROTjR5RU5KSUdHUnUx?=
 =?utf-8?B?eE4xRWtNODBuQUtJY094Q1Y4dmp6UVhjaWlqd1FkMURyOUlmOThnWmNlVllI?=
 =?utf-8?B?SVdmTkNVcTZhUm4rd1NYOGQyODVabnVTQWlZSldWdlpnbXBBc0tjbnAydlhw?=
 =?utf-8?B?TEhWSnpsUythdnpiMVE1ak9JQkg5NDlkeDZrZVVJSnRRTHBrb2xQdHZ6SEhZ?=
 =?utf-8?B?U3dwV3JjYm03Y1d5OWlkQmI5RGk2bVdOa1JqQU5icTNTdXJsZUhXUUV0Vmgx?=
 =?utf-8?B?UFh1R2RFRGY5YnRQTXBTYWdxNFViSXczOENwZFhBZzRXNFdub1Y4dmhOUlpu?=
 =?utf-8?B?NWUra1c5dzVpSkp3S0tkcjlnTHlJZjdLVFBkN2lzenNRd1F6Q3pQTGNXNnFK?=
 =?utf-8?B?Z2NrOWN4a21nPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azdyQm5UTVprcC9BS3liWnVTdjF2d1JXWHZKbU9RQ1NGaDRIb2szNnVJdGFx?=
 =?utf-8?B?V3E5RnZlcVRTcmZvaUV5dndpN0hQakg1cmM5aTdKR0Q2MEN1QWcwY1NpSk85?=
 =?utf-8?B?Q1AwdlhPeFlySjJIZ1cxSWh6UWVuRWlGUHFtVDA2RzlubE1OdVl2T2VSTGNI?=
 =?utf-8?B?cUxZeHJncFpFenFGVmd1T3kzUVo2eEhLL0dORmNrTWRnYkFoS1NlVUdYemxt?=
 =?utf-8?B?TDhEV2lxQmxTUlE5YkNUZVNUU2tFWDd2SWMxV3JsVTlKUGVFK1paZmtJOWFi?=
 =?utf-8?B?RC9rSHowT2IzQ3lKWmN6a0NjOTlIWW8wUlZEdWFJL0M0TzJKbzF5V2c1S1N6?=
 =?utf-8?B?NEtnemRRWlRFbmZjaktpTXQ5ajZqUDF2TWtXSFNGcDVnQ0o4ZE5RTUlFOWRJ?=
 =?utf-8?B?bzBsanpnaEtaZVRqdWo3UDRQN0t0cmE4dHhnaHhXWGtsQTlhc2VkQ1hpQzg2?=
 =?utf-8?B?V3EwRGczenorN0Z1R1JpdjJROGV2dDlCaU0xS2QxaWdaQXZBUFUvSzNJdUh5?=
 =?utf-8?B?bDJhbUg3R0tLTytyTUFqSXVjdWU5SFB1cUhRUkpORnVZV05lb1dkTXFKbHFK?=
 =?utf-8?B?QlpxV0s4Q21kMFFmaXdiOW5uYUk1Q0NwdmdzWmFVYUw5TTJrcDhETDFDMU94?=
 =?utf-8?B?Q3lqbnNEemkwQy9qYUpVc212cytwUXUzWlZwMkM1ZFZCZ3BYQmVxTmVOT09Z?=
 =?utf-8?B?SE9EeGNMWmF5QTFTYWgva0sydS92UGF5dGViaG1HdkNuWXNTaXUwWiswZmh0?=
 =?utf-8?B?aWlkT000dU1jakdUeVRwRk9rWjVYZlFRdk05UmFHYWt4bk45akc2Njc4UFU4?=
 =?utf-8?B?WmtZMW1WejUvMXE3Zk9tUTJUYlpTQVJpL3E1TFdodEhuSWQ4N29UOFEyQ0V6?=
 =?utf-8?B?OWpwOGxkc2RUdWw5L2ptcmIrOHVhdmN2QTI1MEFIN1lmcXBESlhxNUYrejhO?=
 =?utf-8?B?eHdtY25jTTNQdE1sRmUwalE1SS9SVkdzZHlDbVV2MTh2Qm9RekgvTmdjeGIv?=
 =?utf-8?B?dG9vVFoyQ1VpS3N1ZG0wUGo2VllZZ2lIRkJzN2I1Vy95MGJhSlhWdWFRSXFt?=
 =?utf-8?B?cVNVUVE2Kzk0RU9iL3dyWkdZTXd3Z2J3MFJibjZmZjZOaGs3MmoyK1A2bEN4?=
 =?utf-8?B?QTFKYnFiU0JlcloxS2hWNGEwczFmNjZSWFlCNFJwM29YMVVSUE8yUFprcUYy?=
 =?utf-8?B?VkdXRHpHM1RGamhncEEvdmo2OU5iRlJHU21kbml6RCt3NmVsK2NlOE82Tm1J?=
 =?utf-8?B?VUhsdGxULzRkY1NCSWVJeU04cHRLYWY5VG1zMUd0b2FqVExuclF4SGQzVnZO?=
 =?utf-8?B?NW1FZ3lIVWo5YnNjbnozQ1ByWG1zblRuWUdSbG4wRFgwVlY4K3JPcUpXL2s4?=
 =?utf-8?B?YWNMUEY5NGpDZU5iMFZtV2JPUVp2Q1J1R0d2ZU5nazN0WjlLRDNMc1ZYanJC?=
 =?utf-8?B?RCt6YmlUdWRGdXJtV0EyUXRETEh1M2tKOEl4YUlPeHhoU29FdDJXV2JqWlVn?=
 =?utf-8?B?UStUcnpPeDZtUmN5bkpQYkNOeFlYYTZoalNib1ZicEdzMmh3R0lHTzNqejAv?=
 =?utf-8?B?TnZMc0N0eTFRUE0xNU5WSlFaaVViZHVSOFA5c2J3bGdLbDFGaDhnRGlnRWc4?=
 =?utf-8?B?aDU4b1hSc3hvTlJxYVB4MEdXL2xIT3RjUzAvSzNlQ2R2c0dYYktlMk4xOFp0?=
 =?utf-8?B?UEFHNEhRSHgzeHZZMjNRZjJER25pSjFmUGx3L0xOMHJIYjlmTjE4SmtRckZK?=
 =?utf-8?B?Rk9LQUNoR3FKM2thelVyaEZtOWU4MkpLQXZCL1Y1bEtiNXpiQWNhcktuKy84?=
 =?utf-8?B?blp1bWpkWUdHWUQrQ1psWUtQUmFMbVFqbFJrVTE1eFJFUVJpZWdGV3VsenlX?=
 =?utf-8?B?THlUc1FHUWo0RW9kdy9jUXpabjJyamxEVlZlS2RGMGFhemZZZFN2NCsvVndh?=
 =?utf-8?B?bnZDUlVXdnVpWlByczRMRjVpQmVPZjlFS2dHV0F2akYrak1PL0JmTkJ2Ti9D?=
 =?utf-8?B?K2Qra2t6NDFqczlKRkkvZm5MN3JuRmZyZnB6blp1UkRIWXNQd01RWVlJUU1i?=
 =?utf-8?B?SDNDL3cveG9HTmRzNEZPOGphdU9ONXgwTTMyTTlBZTVRNzN6ZllZOW5SNWM0?=
 =?utf-8?Q?zLx8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 012f4985-e30e-4f48-9f89-08de08a8e0c0
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 09:30:55.4855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7AkfUwsCep8MoPXzgamcclDSa5mqLea82gdwSEkCcS6Wiit73DHRAtO9rNbQnwf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184

Many thanks Sultan for your review, that's really helpful.

On 10/1/2025 2:53 PM, Sultan Alsawaf wrote:
> Hi Bin,
> 
> On Thu, Sep 11, 2025 at 06:08:45PM +0800, Bin Du wrote:
>> Isp video implements v4l2 video interface and supports NV12 and YUYV. It
>> manages buffers, pipeline power and state. Cherry-picked Sultan's DMA
>> buffer related fix from branch v6.16-drm-tip-isp4-for-amd on
>> https://github.com/kerneltoast/kernel_x86_laptop.git
>>
>> Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
>> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
> 
> [snip]
> 
>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>> @@ -178,6 +178,16 @@ static int isp4_capture_probe(struct platform_device *pdev)
>>   		goto err_isp4_deinit;
>>   	}
>>   
>> +	ret = media_create_pad_link(&isp_dev->isp_sdev.sdev.entity,
>> +				    0, &isp_dev->isp_sdev.isp_vdev.vdev.entity,
>> +				    0,
>> +				    MEDIA_LNK_FL_ENABLED |
>> +				    MEDIA_LNK_FL_IMMUTABLE);
>> +	if (ret) {
>> +		dev_err(dev, "fail to create pad link %d\n", ret);
>> +		goto err_isp4_deinit;
>> +	}
>> +
> 
> Two problems with this hunk:
> 
> 1. According to the comment in include/media/media-device.h [1],
>     media_create_pad_link() should be called before media_device_register():
> 
>      * So drivers need to first initialize the media device, register any entity
>      * within the media device, create pad to pad links and then finally register
>      * the media device by calling media_device_register() as a final step.
> 
> 2. Missing call to media_device_unregister() on error when
>     media_create_pad_link() fails.
> 
> Since the media_create_pad_link() will be moved before media_device_register(),
> we will need to clean up media_create_pad_link() when media_device_register()
> fails.
> 
> The clean-up function for media_create_pad_link() is media_device_unregister().
> According to the comment for media_device_unregister() [2], it is safe to call
> media_device_unregister() on an unregistered media device that is initialized
> (through media_device_init()).
> 
> In addition, this made me realize that there's no call to media_device_cleanup()
> in the entire driver too. This is the cleanup function for media_device_init(),
> so it should be called on error and on module unload.
> 
> To summarize, make the following changes:
> 
> 1. Move the media_create_pad_link() up, right before media_device_register().
> 
> 2. When media_device_register() fails, clean up media_create_pad_link() by
>     calling media_device_unregister().
> 
> 3. Add a missing call to media_device_cleanup() on error and module unload to
>     clean up media_device_init().
> 

Very clear guide, will follow your advice.

>>   	platform_set_drvdata(pdev, isp_dev);
>>   
>>   	return 0;
>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
>> index a9cb14de04ca..7d3339c915eb 100644
>> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> 
> [snip]
> 
>> +static int isp4sd_ioc_send_img_buf(struct v4l2_subdev *sd,
>> +				   struct isp4if_img_buf_info *buf_info)
>> +{
>> +	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4if_img_buf_node *buf_node = NULL;
> 
> Remove unnecessary initialization of `buf_node`.
> 

Sure, will do that.

>> +	struct device *dev = isp_subdev->dev;
>> +	int ret = -EINVAL;
> 
> Remove unnecessary initialization of `ret`.
> 

Sure, will do that.

>> +
>> +	mutex_lock(&isp_subdev->ops_mutex);
> 
> Use guard() for this mutex and remove the unlock_and_return label.
> 

Sure, will do that.

>> +	/* TODO: remove isp_status */
>> +	if (ispif->status != ISP4IF_STATUS_FW_RUNNING) {
>> +		dev_err(dev, "fail send img buf for bad fsm %d\n",
>> +			ispif->status);
>> +		mutex_unlock(&isp_subdev->ops_mutex);
>> +		return -EINVAL;
>> +	}
>> +
>> +	buf_node = isp4if_alloc_buffer_node(buf_info);
>> +	if (!buf_node) {
>> +		dev_err(dev, "fail alloc sys img buf info node\n");
>> +		ret = -ENOMEM;
>> +		goto unlock_and_return;
>> +	}
>> +
>> +	ret = isp4if_queue_buffer(ispif, buf_node);
>> +	if (ret) {
>> +		dev_err(dev, "fail to queue image buf, %d\n", ret);
>> +		goto error_release_buf_node;
>> +	}
>> +
>> +	if (!isp_subdev->sensor_info.start_stream_cmd_sent) {
>> +		isp_subdev->sensor_info.buf_sent_cnt++;
>> +
>> +		if (isp_subdev->sensor_info.buf_sent_cnt >=
>> +		    ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
>> +			ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
>> +						  NULL, 0);
>> +
>> +			if (ret) {
>> +				dev_err(dev, "fail to START_STREAM");
>> +				goto error_release_buf_node;
>> +			}
>> +			isp_subdev->sensor_info.start_stream_cmd_sent = true;
>> +			isp_subdev->sensor_info.output_info.start_status =
>> +				ISP4SD_START_STATUS_STARTED;
>> +			isp_subdev->sensor_info.status =
>> +				ISP4SD_START_STATUS_STARTED;
>> +		} else {
>> +			dev_dbg(dev,
>> +				"no send start,required %u,buf sent %u\n",
> 
> Add a space after each comma in this string.
> 

Sure, will add.

>> +				ISP4SD_MIN_BUF_CNT_BEF_START_STREAM,
>> +				isp_subdev->sensor_info.buf_sent_cnt);
>> +		}
>> +	}
>> +
>> +	mutex_unlock(&isp_subdev->ops_mutex);
>> +
>> +	return 0;
>> +
>> +error_release_buf_node:
>> +	isp4if_dealloc_buffer_node(buf_node);
>> +
>> +unlock_and_return:
>> +	mutex_unlock(&isp_subdev->ops_mutex);
>> +
>> +	return ret;
>> +}
> 
> [snip]
> 
>> +++ b/drivers/media/platform/amd/isp4/isp4_video.c
>> @@ -0,0 +1,1207 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <drm/amd/isp.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/vmalloc.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/v4l2-mc.h>
>> +
>> +#include "isp4_interface.h"
>> +#include "isp4_subdev.h"
>> +#include "isp4_video.h"
>> +
>> +#define ISP4VID_ISP_DRV_NAME "amd_isp_capture"
>> +#define ISP4VID_MAX_PREVIEW_FPS 30
>> +#define ISP4VID_DEFAULT_FMT isp4vid_formats[0]
>> +
>> +#define ISP4VID_PAD_VIDEO_OUTPUT 0
>> +
>> +/* timeperframe default */
>> +#define ISP4VID_ISP_TPF_DEFAULT isp4vid_tpfs[0]
>> +
>> +/* amdisp buffer for vb2 operations */
>> +struct isp4vid_vb2_buf {
>> +	struct device			*dev;
>> +	void				*vaddr;
>> +	unsigned long			size;
>> +	refcount_t			refcount;
>> +	struct dma_buf			*dbuf;
>> +	void				*bo;
>> +	u64				gpu_addr;
>> +	struct vb2_vmarea_handler	handler;
>> +};
>> +
>> +static int isp4vid_vb2_mmap(void *buf_priv, struct vm_area_struct *vma);
> 
> Don't need the isp4vid_vb2_mmap() prototype here anymore, remove it.
> 

Yes, it's not necessary, will remove it.

>> +
>> +static void isp4vid_vb2_put(void *buf_priv);
>> +
>> +static const char *isp4vid_video_dev_name = "Preview";
> 
> Turn this into `static const char *const isp4vid_video_dev_name = "Preview";`
> which makes the `isp4vid_video_dev_name` variable itself const, so that you
> cannot change `isp4vid_video_dev_name` to something else.
> 

Sure, will add as you suggested.

>> +
>> +/* Sizes must be in increasing order */
>> +static const struct v4l2_frmsize_discrete isp4vid_frmsize[] = {
>> +	{640, 360},
>> +	{640, 480},
>> +	{1280, 720},
>> +	{1280, 960},
>> +	{1920, 1080},
>> +	{1920, 1440},
>> +	{2560, 1440},
>> +	{2880, 1620},
>> +	{2880, 1624},
>> +	{2888, 1808},
>> +};
>> +
>> +static const u32 isp4vid_formats[] = {
>> +	V4L2_PIX_FMT_NV12,
>> +	V4L2_PIX_FMT_YUYV
>> +};
>> +
>> +/* timeperframe list */
>> +static const struct v4l2_fract isp4vid_tpfs[] = {
>> +	{.numerator = 1, .denominator = ISP4VID_MAX_PREVIEW_FPS}
> 
> Add a space after { and a space before }.
> 
> Also, it is more common to see v4l2_fract initialized without specifying the
> struct member names.
> 
> To summarize, change to `{ 1, ISP4VID_MAX_PREVIEW_FPS }`
> 

Will follow your advice. Seems no explicit description about this in 
"Linux kernel coding style" and both spacing options after { are common 
in the current kernel code.

>> +};
>> +
>> +static void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
>> +				      const struct isp4if_img_buf_info *img_buf,
>> +				      bool done_suc)
>> +{
>> +	struct isp4vid_capture_buffer *isp4vid_buf;
> 
> Rename isp4vid_buf to isp_buf like in isp4vid_qops_start_streaming().
> 

Seems isp4vid_buf appears to be more descriptive, plan to rename isp_buf 
in isp4vid_qops_start_streaming to isp4vid_buf, what do you think?

>> +	enum vb2_buffer_state state;
>> +	void *vbuf;
>> +
>> +	mutex_lock(&isp_vdev->buf_list_lock);
>> +
>> +	/* Get the first entry of the list */
>> +	isp4vid_buf = list_first_entry_or_null(&isp_vdev->buf_list, typeof(*isp4vid_buf), list);
>> +	if (!isp4vid_buf) {
>> +		mutex_unlock(&isp_vdev->buf_list_lock);
>> +		return;
>> +	}
>> +
>> +	vbuf = vb2_plane_vaddr(&isp4vid_buf->vb2.vb2_buf, 0);
>> +
>> +	if (vbuf != img_buf->planes[0].sys_addr) {
>> +		dev_err(isp_vdev->dev, "Invalid vbuf");
>> +		mutex_unlock(&isp_vdev->buf_list_lock);
>> +		return;
>> +	}
>> +
>> +	/* Remove this entry from the list */
>> +	list_del(&isp4vid_buf->list);
>> +
>> +	mutex_unlock(&isp_vdev->buf_list_lock);
> 
> Change to this starting from the mutex_lock():
> 
> 	scoped_guard(mutex, &isp_vdev->buf_list_lock) {
> 		/* Get the first entry of the list */
> 		isp_buf = list_first_entry_or_null(&isp_vdev->buf_list,
> 						   typeof(*isp_buf), list);
> 		if (!isp_buf)
> 			return;
> 
> 		vbuf = vb2_plane_vaddr(&isp_buf->vb2.vb2_buf, 0);
> 		if (vbuf != img_buf->planes[0].sys_addr) {
> 			dev_err(isp_vdev->dev, "Invalid vbuf");
> 			return;
> 		}
> 
> 		/* Remove this entry from the list */
> 		list_del(&isp_buf->list);
> 	}
> 

Sure, good optimization.

>> +
>> +	/* Fill the buffer */
>> +	isp4vid_buf->vb2.vb2_buf.timestamp = ktime_get_ns();
>> +	isp4vid_buf->vb2.sequence = isp_vdev->sequence++;
>> +	isp4vid_buf->vb2.field = V4L2_FIELD_ANY;
>> +
>> +	/* at most 2 planes */
>> +	vb2_set_plane_payload(&isp4vid_buf->vb2.vb2_buf,
>> +			      0, isp_vdev->format.sizeimage);
>> +
>> +	state = done_suc ? VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
>> +	vb2_buffer_done(&isp4vid_buf->vb2.vb2_buf, state);
>> +
>> +	dev_dbg(isp_vdev->dev, "call vb2_buffer_done(size=%u)\n",
>> +		isp_vdev->format.sizeimage);
>> +}
> 
> [snip]
> 
>> +static void *isp4vid_vb2_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
>> +				       struct dma_buf *dbuf,
>> +				       unsigned long size)
>> +{
>> +	struct isp4vid_vb2_buf *buf;
>> +
>> +	if (dbuf->size < size) {
>> +		dev_err(dev, "Invalid dmabuf size %zu %lu", dbuf->size, size);
>> +		return ERR_PTR(-EFAULT);
>> +	}
>> +
>> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
>> +	if (!buf)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	struct isp4vid_vb2_buf *dbg_buf = dbuf->priv;
> 
> Move dbg_buf declaration to the top of the function.
> 

Sure, will do that.

>> +
>> +	buf->dev = dev;
>> +	buf->dbuf = dbuf;
>> +	buf->size = size;
>> +
>> +	dev_dbg(dev, "attach dmabuf of isp user bo 0x%llx size %ld",
>> +		dbg_buf->gpu_addr, dbg_buf->size);
>> +
>> +	return buf;
>> +}
>> +
>> +static void isp4vid_vb2_unmap_dmabuf(void *mem_priv)
>> +{
>> +	struct isp4vid_vb2_buf *buf = mem_priv;
>> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
>> +
>> +	dev_dbg(buf->dev, "unmap dmabuf of isp user bo 0x%llx size %ld",
>> +		buf->gpu_addr, buf->size);
>> +
>> +	dma_buf_vunmap_unlocked(buf->dbuf, &map);
>> +	buf->vaddr = NULL;
>> +}
>> +
>> +static int isp4vid_vb2_map_dmabuf(void *mem_priv)
>> +{
>> +	struct isp4vid_vb2_buf *mmap_buf = NULL;
> 
> Remove unnecessary initialization of `mmap_buf`, and combine it onto one line
> with `buf`:
> 

Sure, will remove unnecessary initialization of `mmap_buf, but i'd 
rather not combine because it is mentioned in "Linux kernel coding 
style" that "to this end, use just one data declaration per line (no 
commas for multiple data declarations). This leaves you room for a small 
comment on each item, explaining its use.", what do you think?

> 	struct isp4vid_vb2_buf *buf = mem_priv, *mmap_buf;
> 
>> +	struct isp4vid_vb2_buf *buf = mem_priv;
>> +	struct iosys_map map = {};
> 
> Remove unnecessary initialization of `map`, it is initialized inside
> dma_buf_vmap_unlocked() at the very beginning.
> 

Sure, will remove it. Yes, map is initialized inside 
dma_buf_vmap_unlocked by iosys_map_clear()

>> +	int ret;
>> +
>> +	ret = dma_buf_vmap_unlocked(buf->dbuf, &map);
>> +	if (ret) {
>> +		dev_err(buf->dev, "vmap_unlocked fail");
>> +		return -EFAULT;
>> +	}
>> +	buf->vaddr = map.vaddr;
>> +
>> +	mmap_buf = buf->dbuf->priv;
>> +	buf->gpu_addr = mmap_buf->gpu_addr;
>> +
>> +	dev_dbg(buf->dev, "map dmabuf of isp user bo 0x%llx size %ld",
>> +		buf->gpu_addr, buf->size);
>> +
>> +	return 0;
>> +}
> 
> [snip]
> 
>> +static const struct v4l2_pix_format isp4vid_fmt_default = {
>> +	.width = 1920,
>> +	.height = 1080,
>> +	.pixelformat = V4L2_PIX_FMT_NV12,
> 
> Set .pixelformat to ISP4VID_DEFAULT_FMT.
> 

Sure, will modify.

>> +	.field = V4L2_FIELD_NONE,
>> +	.colorspace = V4L2_COLORSPACE_SRGB,
>> +};
>> +
>> +static void isp4vid_capture_return_all_buffers(struct isp4vid_dev *isp_vdev,
>> +					       enum vb2_buffer_state state)
>> +{
>> +	struct isp4vid_capture_buffer *vbuf, *node;
>> +
>> +	mutex_lock(&isp_vdev->buf_list_lock);
>> +
>> +	list_for_each_entry_safe(vbuf, node, &isp_vdev->buf_list, list) {
>> +		list_del(&vbuf->list);
>> +		vb2_buffer_done(&vbuf->vb2.vb2_buf, state);
>> +	}
>> +	mutex_unlock(&isp_vdev->buf_list_lock);
> 
> Change to this starting from the mutex_lock():
> 
> 	scoped_guard(mutex, &isp_vdev->buf_list_lock) {
> 		list_for_each_entry_safe(vbuf, node, &isp_vdev->buf_list, list)
> 			vb2_buffer_done(&vbuf->vb2.vb2_buf, state);
> 		INIT_LIST_HEAD(&isp_vdev->buf_list);
> 	}
> 

Sure, will do optimization as you advised.

>> +
>> +	dev_dbg(isp_vdev->dev, "call vb2_buffer_done(%d)\n", state);
>> +}
>> +
>> +static int isp4vid_vdev_link_validate(struct media_link *link)
>> +{
>> +	return 0;
>> +}
>> +
>> +static const struct media_entity_operations isp4vid_vdev_ent_ops = {
>> +	.link_validate = isp4vid_vdev_link_validate,
>> +};
>> +
>> +static const struct v4l2_file_operations isp4vid_vdev_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = v4l2_fh_open,
>> +	.release = vb2_fop_release,
>> +	.read = vb2_fop_read,
>> +	.poll = vb2_fop_poll,
>> +	.unlocked_ioctl = video_ioctl2,
>> +	.mmap = vb2_fop_mmap,
>> +};
>> +
>> +static int isp4vid_ioctl_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>> +{
>> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
>> +
>> +	strscpy(cap->driver, ISP4VID_ISP_DRV_NAME, sizeof(cap->driver));
>> +	snprintf(cap->card, sizeof(cap->card), "%s", ISP4VID_ISP_DRV_NAME);
>> +	cap->capabilities |= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE;
>> +
>> +	dev_dbg(isp_vdev->dev, "%s|capabilities=0x%X", isp_vdev->vdev.name, cap->capabilities);
>> +
>> +	return 0;
>> +}
>> +
>> +static int isp4vid_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
>> +{
>> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
>> +
>> +	f->fmt.pix = isp_vdev->format;
>> +
>> +	return 0;
>> +}
>> +
>> +static int isp4vid_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f)
>> +{
>> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
>> +	struct v4l2_pix_format *format = &f->fmt.pix;
>> +	unsigned int i;
> 
> Change to `int i;` for consistency.
> 

Sure, will change it.

>> +
>> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Check if the hardware supports the requested format, use the default
>> +	 * format otherwise.
>> +	 */
>> +	for (i = 0; i < ARRAY_SIZE(isp4vid_formats); i++)
>> +		if (isp4vid_formats[i] == format->pixelformat)
>> +			break;
>> +
>> +	if (i == ARRAY_SIZE(isp4vid_formats))
>> +		format->pixelformat = ISP4VID_DEFAULT_FMT;
>> +
>> +	switch (format->pixelformat) {
>> +	case V4L2_PIX_FMT_NV12: {
>> +		const struct v4l2_frmsize_discrete *fsz =
>> +			v4l2_find_nearest_size(isp4vid_frmsize,
>> +					       ARRAY_SIZE(isp4vid_frmsize),
>> +					       width, height,
>> +					       format->width, format->height);
>> +
>> +		format->width = fsz->width;
>> +		format->height = fsz->height;
>> +
>> +		format->bytesperline = format->width;
>> +		format->sizeimage = format->bytesperline *
>> +				    format->height * 3 / 2;
>> +	}
>> +	break;
>> +	case V4L2_PIX_FMT_YUYV: {
>> +		const struct v4l2_frmsize_discrete *fsz =
>> +			v4l2_find_nearest_size(isp4vid_frmsize,
>> +					       ARRAY_SIZE(isp4vid_frmsize),
>> +					       width, height,
>> +					       format->width, format->height);
>> +
>> +		format->width = fsz->width;
>> +		format->height = fsz->height;
>> +
>> +		format->bytesperline = format->width * 2;
>> +		format->sizeimage = format->bytesperline * format->height;
>> +	}
>> +	break;
>> +	default:
>> +		dev_err(isp_vdev->dev, "%s|unsupported fmt=%u",
>> +			isp_vdev->vdev.name, format->pixelformat);
>> +		return -EINVAL;
>> +	}
> 
> Create a variable declaration `const struct v4l2_frmsize_discrete *fsz;` at the
> top of the function and change everything starting from the switch to this:
> 
> 	fsz = v4l2_find_nearest_size(isp4vid_frmsize,
> 				     ARRAY_SIZE(isp4vid_frmsize), width, height,
> 				     format->width, format->height);
> 	format->width = fsz->width;
> 	format->height = fsz->height;
> 	isp4vid_fill_buffer_size(format);
> 
> And this will go with a complementary change to isp4vid_fill_buffer_size() to
> make it possible to reuse isp4vid_fill_buffer_size() here to remove code
> duplication.
> 

Very good refinement, will do it.

>> +
>> +	if (format->field == V4L2_FIELD_ANY)
>> +		format->field = isp4vid_fmt_default.field;
>> +
>> +	if (format->colorspace == V4L2_COLORSPACE_DEFAULT)
>> +		format->colorspace = isp4vid_fmt_default.colorspace;
>> +
>> +	return 0;
>> +}
> 
> [snip]
> 
>> +static int isp4vid_fill_buffer_size(struct isp4vid_dev *isp_vdev)
>> +{
>> +	int ret = 0;
>> +
>> +	switch (isp_vdev->format.pixelformat) {
>> +	case V4L2_PIX_FMT_NV12:
>> +		isp_vdev->format.bytesperline = isp_vdev->format.width;
>> +		isp_vdev->format.sizeimage = isp_vdev->format.bytesperline *
>> +					     isp_vdev->format.height * 3 / 2;
>> +		break;
>> +	case V4L2_PIX_FMT_YUYV:
>> +		isp_vdev->format.bytesperline = isp_vdev->format.width;
>> +		isp_vdev->format.sizeimage = isp_vdev->format.bytesperline *
>> +					     isp_vdev->format.height * 2;
>> +		break;
>> +	default:
>> +		dev_err(isp_vdev->dev, "fail for invalid default format 0x%x",
>> +			isp_vdev->format.pixelformat);
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
> 
> Looks like isp_vdev->format.bytesperline is set wrong here for YUYV, it should
> be width * 2.
> 

Thanks for catching this.

> Move isp4vid_fill_buffer_size() definition above isp4vid_try_fmt_vid_cap() so it
> can be used there and change isp4vid_fill_buffer_size() to this:
> 
> static int isp4vid_fill_buffer_size(struct v4l2_pix_format *fmt)
> {
> 	switch (fmt->pixelformat) {
> 	case V4L2_PIX_FMT_NV12: {
> 		fmt->bytesperline = fmt->width;
> 		fmt->sizeimage = fmt->bytesperline * fmt->height * 3 / 2;
> 		break;
> 	case V4L2_PIX_FMT_YUYV:
> 		fmt->bytesperline = fmt->width * 2;
> 		fmt->sizeimage = fmt->bytesperline * fmt->height;
> 		break;
> 	default:
> 		return -EINVAL;
> 	}
> 
> 	return 0;
> }
> 
> This fixes the isp_vdev->format.bytesperline issue too.
> 

Yes, will modify in the next version.

>> +
>> +static const struct vb2_ops isp4vid_qops = {
>> +	.queue_setup = isp4vid_qops_queue_setup,
>> +	.buf_queue = isp4vid_qops_buffer_queue,
>> +	.start_streaming = isp4vid_qops_start_streaming,
>> +	.stop_streaming = isp4vid_qops_stop_streaming,
>> +	.wait_prepare = vb2_ops_wait_prepare,
>> +	.wait_finish = vb2_ops_wait_finish,
>> +};
>> +
>> +int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sdev,
>> +		     const struct isp4vid_ops *ops)
>> +{
>> +	const char *vdev_name = isp4vid_video_dev_name;
>> +	struct v4l2_device *v4l2_dev;
>> +	struct video_device *vdev;
>> +	struct vb2_queue *q;
>> +	int ret;
>> +
>> +	if (!isp_vdev || !isp_sdev || !isp_sdev->v4l2_dev)
>> +		return -EINVAL;
>> +
>> +	v4l2_dev = isp_sdev->v4l2_dev;
>> +	vdev = &isp_vdev->vdev;
>> +
>> +	isp_vdev->isp_sdev = isp_sdev;
>> +	isp_vdev->dev = v4l2_dev->dev;
>> +	isp_vdev->ops = ops;
>> +
>> +	/* Initialize the vb2_queue struct */
>> +	mutex_init(&isp_vdev->vbq_lock);
>> +	q = &isp_vdev->vbq;
>> +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> +	q->io_modes = VB2_MMAP | VB2_DMABUF;
>> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>> +	q->buf_struct_size = sizeof(struct isp4vid_capture_buffer);
>> +	q->min_queued_buffers = 2;
>> +	q->ops = &isp4vid_qops;
>> +	q->drv_priv = isp_vdev;
>> +	q->mem_ops = &isp4vid_vb2_memops;
>> +	q->lock = &isp_vdev->vbq_lock;
>> +	q->dev = v4l2_dev->dev;
>> +	ret = vb2_queue_init(q);
>> +	if (ret) {
>> +		dev_err(v4l2_dev->dev, "vb2_queue_init error:%d", ret);
>> +		return ret;
>> +	}
>> +	/* Initialize buffer list and its lock */
>> +	mutex_init(&isp_vdev->buf_list_lock);
>> +	INIT_LIST_HEAD(&isp_vdev->buf_list);
>> +
>> +	/* Set default frame format */
>> +	isp_vdev->format = isp4vid_fmt_default;
>> +	isp_vdev->timeperframe = ISP4VID_ISP_TPF_DEFAULT;
>> +	v4l2_simplify_fraction(&isp_vdev->timeperframe.numerator,
>> +			       &isp_vdev->timeperframe.denominator, 8, 333);
>> +
>> +	ret = isp4vid_fill_buffer_size(isp_vdev);
> 
> Change to `ret = isp4vid_fill_buffer_size(&isp_vdev->format);`
> 

Yes, will modify together with above changes.

>> +	if (ret) {
>> +		dev_err(v4l2_dev->dev, "fail to fill buffer size: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = isp4vid_set_fmt_2_isp(isp_sdev, &isp_vdev->format);
>> +	if (ret) {
>> +		dev_err(v4l2_dev->dev, "fail init format :%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* Initialize the video_device struct */
>> +	isp_vdev->vdev.entity.name = vdev_name;
>> +	isp_vdev->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
>> +	isp_vdev->vdev_pad.flags = MEDIA_PAD_FL_SINK;
>> +	ret = media_entity_pads_init(&isp_vdev->vdev.entity, 1,
>> +				     &isp_vdev->vdev_pad);
>> +
>> +	if (ret) {
>> +		dev_err(v4l2_dev->dev, "init media entity pad fail:%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE |
>> +			    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
>> +	vdev->entity.ops = &isp4vid_vdev_ent_ops;
>> +	vdev->release = video_device_release_empty;
>> +	vdev->fops = &isp4vid_vdev_fops;
>> +	vdev->ioctl_ops = &isp4vid_vdev_ioctl_ops;
>> +	vdev->lock = NULL;
>> +	vdev->queue = q;
>> +	vdev->v4l2_dev = v4l2_dev;
>> +	vdev->vfl_dir = VFL_DIR_RX;
>> +	strscpy(vdev->name, vdev_name, sizeof(vdev->name));
>> +	video_set_drvdata(vdev, isp_vdev);
>> +
>> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>> +	if (ret)
>> +		dev_err(v4l2_dev->dev, "register video device fail:%d\n", ret);
> 
> No error handling?
> 

Not necessary here because the caller isp4sd_init() will handle this.

>> +
>> +	return ret;
>> +}
>> +
>> +void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev)
>> +{
>> +	video_unregister_device(&isp_vdev->vdev);
>> +}
>> diff --git a/drivers/media/platform/amd/isp4/isp4_video.h b/drivers/media/platform/amd/isp4/isp4_video.h
>> new file mode 100644
>> index 000000000000..fae7dbdedd18
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_video.h
> 
> [snip]
> 
>> +
>> +struct isp4vid_capture_buffer {
>> +	/*
>> +	 * struct vb2_v4l2_buffer must be the first element
>> +	 * the videobuf2 framework will allocate this struct based on
>> +	 * buf_struct_size and use the first sizeof(struct vb2_buffer) bytes of
>> +	 * memory as a vb2_buffer
>> +	 */
>> +	struct vb2_v4l2_buffer vb2;
>> +	struct isp4if_img_buf_info img_buf;
>> +	struct list_head list;
>> +};
>> +
>> +struct isp4vid_dev;
> 
> Unnecessary isp4vid_dev forward declaration, remove it.
> 

yes, will remove it.

>> +
>> +struct isp4vid_ops {
>> +	int (*send_buffer)(struct v4l2_subdev *sd,
>> +			   struct isp4if_img_buf_info *img_buf);
>> +};
>> +
>> +struct isp4vid_dev {
>> +	struct video_device vdev;
>> +	struct media_pad vdev_pad;
>> +	struct v4l2_pix_format format;
>> +
>> +	/* mutex that protects vbq */
>> +	struct mutex vbq_lock;
>> +	struct vb2_queue vbq;
>> +
>> +	/* mutex that protects buf_list */
>> +	struct mutex buf_list_lock;
>> +	struct list_head buf_list;
>> +
>> +	u32 sequence;
>> +	bool stream_started;
>> +	struct task_struct *kthread;
> 
> Remove unused `kthread` struct member.
> 

Yes, not used, will remove it.

>> +
>> +	struct media_pipeline pipe;
>> +	struct device *dev;
>> +	struct v4l2_subdev *isp_sdev;
>> +	struct v4l2_fract timeperframe;
>> +
>> +	/* Callback operations */
>> +	const struct isp4vid_ops *ops;
>> +};
>> +
>> +int isp4vid_dev_init(struct isp4vid_dev *isp_vdev,
>> +		     struct v4l2_subdev *isp_sdev,
>> +		     const struct isp4vid_ops *ops);
>> +
>> +void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev);
>> +
>> +s32 isp4vid_notify(void *cb_ctx, struct isp4vid_framedone_param *evt_param);
>> +
>> +#endif
>> -- 
>> 2.34.1
>>
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/media/media-device.h?h=v6.17-rc7#n204
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/media/media-device.h?h=v6.17-rc7#n289
> 
> Sultan

-- 
Regards,
Bin


