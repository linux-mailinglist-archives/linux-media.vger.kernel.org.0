Return-Path: <linux-media+bounces-52075-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPr8CCWYgWl/HAMAu9opvQ
	(envelope-from <linux-media+bounces-52075-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 07:39:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD22D55F9
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 07:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0515030891EA
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 06:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC163806C3;
	Tue,  3 Feb 2026 06:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Yk40cgxg"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010042.outbound.protection.outlook.com [52.101.46.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DACB37F8B6;
	Tue,  3 Feb 2026 06:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770100388; cv=fail; b=MuNauzqLT4gqBEwNo/zk+rvWp3KNS7dXitjqZbq1yMSbH5BYHem+K7U/ms/+PrpdkhUdZ5wIYAdgGH7q1EWxxGkY55ULYEd4Ii7rHorWFuq6W3haWSEu8MtN/QCRaFQ/bpQykiRgbcIOObfdQCBoWNQB8F1aEQi7PSFPzJCwdVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770100388; c=relaxed/simple;
	bh=1bNqvO8bfNo1KJun/UtSY+rBJpgIlf3pAdtosLx3+Zs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fXVLml25E/sieMC6aT6kQEmCM4L7lxeManWRuQymsVzulAhh2tpoJxM/WZzLzyTx4pR2uVJLIh2dr5LhZSkCHVRF68MhCKtZb3k+pRo6avZ+bSfFAaSShE7wCWKNKsHk5Bg6t5QDaZOEkuzwrosdv9qy96WEEWAOXdyB1QvCstE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Yk40cgxg; arc=fail smtp.client-ip=52.101.46.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXHiUu7gEoDyxHaFibYl9LTxyFWd01MDaC38+DbgBw+VVNs/4osHDLdgv7GCjnuxSB/progvVloeBJ/dFoTuJPBbXGCmPKXPoXSnLnBiRiBsyzzd9nIoVV8G0e7BcyIye0KJybkL4Q4buqABnAEVY417yB1WyZISEcfHhtP6rxkt2ofdQD+Wg+pbr+5rs0AT/Kj4rMvk8mcub2GyR+VMQtJ/WrH/xs8qEakSemSEcCB4Wl3tffnyvYmcUx3wHHTiRZo08cYAMzCmQyHxLWLlIrkEq0BUUeierq64noF1YMvYGaRURvLU1dWIFUl6CZRHB1wth3NjLbZZGYtX32xaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTZt0Yte1HYYvt+JLEr/OkG6wvbn/8DH+7y0rzXyxJY=;
 b=VPb/M6LqfnwIdEJsvTxKkC8aHMFzOFNVgB11TzMik+wy6EhORyJUnM5GDUaIahs7jMSCKBgAptphMSEIfNpT6So1XYZqD5/TeCxxk9xORf5zSubXtoKGtss1gcB0WhmvSgH79x7fJ1m038HShSW0zfJ3W2uhpxfwlvJJC2H6AS3YYLs54xjr71MzKtajg5aj40y5J0oj3+FYConSyoAd+2D1cEypWxrta6ZZOTnMNXRNWc/Cxm2IfFGmgnbU9Ycwo39xboHojJ3tSsux+LP7j7MptFcKJpuTR0qIj5imaKYewy9eFbZYZETdLXfdKSK5xw6aFur1Fv8NjBqoIrkSNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTZt0Yte1HYYvt+JLEr/OkG6wvbn/8DH+7y0rzXyxJY=;
 b=Yk40cgxguITAl1KNL4LJ5ZC7bcclCjE63IWMENh5uLSYBKVngCwSsNODCyHwbz3ow0f8kEJnw/emW/wg7QQgGXLQ/YkUZc4YtZTRsjQES79KaatAaIpzi02FcGdHHaYEq5THw8h389uGVxCo45ZcsvmdNYqj+fOGY0UIA5Z6yHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by IA1PR12MB7568.namprd12.prod.outlook.com (2603:10b6:208:42c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 06:33:04 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 06:33:04 +0000
Message-ID: <35075404-d0ef-4571-bb86-05f63f95a444@amd.com>
Date: Tue, 3 Feb 2026 14:32:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] media: platform: amd: isp4 video node and buffers
 handling added
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
 "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sultan@kerneltoast.com" <sultan@kerneltoast.com>,
 "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
 "Li, King" <King.Li@amd.com>,
 "Rosikopulos, Gjorgji" <Gjorgji.Rosikopulos@amd.com>,
 "Jawich, Phil" <Phil.Jawich@amd.com>,
 "Antony, Dominic" <Dominic.Antony@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>, "Tsao, Anson" <anson.tsao@amd.com>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-6-Bin.Du@amd.com>
 <aUl61d5mQq2ep8qE@kekkonen.localdomain>
 <f62729ba-a271-4f3f-a929-4f07ae3368b2@amd.com>
 <aXvOfXNn2gGsmkfg@valkosipuli.retiisi.eu>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aXvOfXNn2gGsmkfg@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|IA1PR12MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: 406a9a86-2b37-486e-51cd-08de62ee15c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFZEcmR0ckdXN1ErNmgwR0VJOE41UGljTG83OTZ4aDQwbk5Cdmk4K1ZQdVlS?=
 =?utf-8?B?SFBseWlMZ1ZXVmczdENyNWZqejJwaVp4QmFzdEU0QjhoLy9tUUxuVnp1Qisz?=
 =?utf-8?B?MjU5dDh3UDdJdU5paVlEckRhdGJTUjlBdzlGMm5ZV3ZaSXlHV0IvV3IreEhp?=
 =?utf-8?B?azVyaG13ZlBmUHNhRjBlNUZMcXNlSmxWSXUwTVd1QzBwQWJUZ0RCa29VMlBN?=
 =?utf-8?B?R2drVERHZlVSSUN6NmE5TEtzamptVUdTWmxOc3ViOEFSblBZaTNmMGNPSXVW?=
 =?utf-8?B?ak80WW55Vk9xeitMWjJJTEZDQUplNlAybno0VVlabVFDelpkOFZkeGhzTW9D?=
 =?utf-8?B?RWRML2h6SGZ5bTN1M3ZFVXJBYmNtSzRwdUdqb04vWUUzWWlhTzgyRWtNV1FX?=
 =?utf-8?B?MjIybklaMGE0SWZJVFp4Ky8vRVlsWU01bndxM0tUM3FTdmR5T2lsRnVMWkE1?=
 =?utf-8?B?MDJ2R2Q1QTdmMGhNZEY0bUliUDYvRmFreHhiSWZZMUcrT1BXeGdpcmVPQjJH?=
 =?utf-8?B?aXllVENwTG1nYlUyK0JJU2FMbi8zVUpoZlJMeGNHNWNyZm9rU0d5NFkwSncx?=
 =?utf-8?B?eVdpTFFFalNFN2RIbCtvTVFjbTdGVGoxUVpjVmZTdzB4UElhVkdHaFVscXBr?=
 =?utf-8?B?UENGSlM4MlgwODlITXVRVWs3SWNsRHNMcmpkc0JjcUExYkR3ZmFqbXJkK09H?=
 =?utf-8?B?cXNpbnVqNGI4Y1V2UERjZ1VCK1IyUVFneEtaNExwclRCWk94V0d0dmxQbUhL?=
 =?utf-8?B?czlGUjY1SHYzcGRrdGxobEFmeG52d1hPYWRYNDdheGlHdnhKcm9RYzRPOEVs?=
 =?utf-8?B?NmFlbkN4VGZqbmFEb1djeURGd05yQk1PczJhaUhPR0JwZDVrRGk2S2RXczB0?=
 =?utf-8?B?MzlQVlhncWQzNXJOVjJTVGk4czFQSXVUYVpaU1pDU1pWUHBCaUVVRWFNUzZN?=
 =?utf-8?B?TTFvaE1Lem1qWUdRRE52NGJzTlBkUFZTUnpuaXhabkk2WENtNmFCYTQzZnNF?=
 =?utf-8?B?eHhnbGtWZG1nQ0ZrUXVLR1R5UEdObDk5L2paNWZNSDlHZ3RmZFJtNFZkVzNB?=
 =?utf-8?B?T2g3d2dCR0grMlhtMjZKNThyYlA0Y0hXSXl4bC9JVytiT1ZMdzZuV2RjYW4w?=
 =?utf-8?B?anpOdDFjaUZ1UVpzUXNZNmR2NFNBdTUyWWFlb2s2K1ZvM3hVQ3hJeERrd1pj?=
 =?utf-8?B?UUlydGlSVG55Ym9KUWZJUXlWZTVabE5QMFgxa2kyUVBZTzhuRzAzOFk2RVhN?=
 =?utf-8?B?anBtRkdlMHpmUTRSbHRMLzFpdGVWRXBieXV3M242bGtrZmN6aVM5YTNyUmNv?=
 =?utf-8?B?MFNMWlJyU3I2V2tRV1FUOVhZbmN3TERqMkQvZk55OXBUQ1Q4b1BxbHFERElL?=
 =?utf-8?B?Y2JiRW5mdmtOTndxc2xva1hhYSs3REk3dVVnNW1jYVFJeXN4ak5scUtvVHpw?=
 =?utf-8?B?V3V0b3Ftby95ZWpBeG5VZkwrbUkzbmpwMjIySjNQRUJjdldPQ2RGa2szZGM3?=
 =?utf-8?B?WlJjaGlLMURERnF3V24zMmxtcEZVVnErWS9Ha3pEbERuaDF2L0tuU0VTTmZO?=
 =?utf-8?B?THkxRVZFRlhjUDJ1YTEvZUg3WW9lS3I0QTVjUHo4VXRRelI0ZmNzTDZQRmNL?=
 =?utf-8?B?bUdNWW8yWW1PN0NsWndDUVhoQVEzKy9oS3JnU1pFenZxb0pXSi9Fbkt4SVZJ?=
 =?utf-8?B?ZWp0TC81SzRmek1hMi94bWwxYjMyWVp3d1JqbW1EZFFRbWc5S3d1ZVlmQjFK?=
 =?utf-8?B?MDFuT1IveTNneUxKR1hqRC8xR1FrTGxzSHlBUUVPTStlY3N6KzQ4V2crMS9Z?=
 =?utf-8?B?cVREODh2YmMvMmpObVZXWkxYcGFoeUV0Tm51bHB3SGNRcGxIeXYxdzRQSDRh?=
 =?utf-8?B?Z21aUnpyZGNaaWdaZGU2Q2FrY014NDA5L3dMZjg1cnFJcEdVTkZvbVdKc1U0?=
 =?utf-8?B?ZElWVEdUaEZ3NVI0SGlmbDZheHlJWDlRQjJTNDVTMXJkdjZVVEtaZnFWNmNT?=
 =?utf-8?B?WGpqdkVzZHh6L2d2bWZqTE93MXhLR2k2bVoxUjlyQ2VFK0NrUFNWK09BWGZk?=
 =?utf-8?B?NnpXSElGSFhyc3ROV0oyREM0QmhwaktQNnlIeDM4TTkzdWt1cSswS21BTkVw?=
 =?utf-8?Q?mdJA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGpuQU0xbld1YXd5MFVZOHkxa2IzU2pNWnF5YmFUTUlBVXcxZ01oSnFqVllD?=
 =?utf-8?B?dndpSzJ3a0tPQi9aOEVYVVc4OVVHZHRsNS82UFNFeFgrQ3RFUjFhbDNaNHk5?=
 =?utf-8?B?QWNQNkRkQTcvRDQ4Zk5iTWlrV0kxM0k1QjJWZkhyallHb2U3aUJLYzJZOURw?=
 =?utf-8?B?T3g2bWZMSnpBTUZ2a1dBeUk4TUJoc1hpaUFWclRUazMrMnNVOWdTOEc2TXRs?=
 =?utf-8?B?ZkMxbEhaS1JPRitxM1JraTY4QVhsNkFMWlVBZXp2bFlGM1hnRkNtc1dhVS9W?=
 =?utf-8?B?Uld0TGNRMVFTU21oQ2g2RHFja2c5T01UankyZlFER1lRM1RwbzhDTFlSeDY0?=
 =?utf-8?B?M2ZVWGh6N0FmQVZuTXNpeEM4bXFzQUdycUdqNk8wMEYva0NsRUdRd3N2Yk1s?=
 =?utf-8?B?SkFGQjJCcnVldkJHRXloMUxoYUtRWG0rT1BPY2dPSndOOXRoZm5RbUZydzBH?=
 =?utf-8?B?UlYzQ1NqM2FVeFNObDdLTWU0WjZrTWxubnppc1ZjODh6QjRCa2hvV2lvOHVi?=
 =?utf-8?B?UHVTMXVaK1ZoTGF2SjdLK05vV1NKdUQ4QVRnTDdzWUs4VVYvSGwvVGlLZ1g4?=
 =?utf-8?B?N3ZrbUE1N00yajdrc0dodW1UUFVXdmJEU2VHamdKZEVvQWdGMWM1UlZYQWQ2?=
 =?utf-8?B?K3VCMXlaWUtCb0hRTnhzZDkwTEVHLzkvbXppMTRIaWNxQjA1U0dicTgzNHVs?=
 =?utf-8?B?bGkyMW55ZEduRkJRUjhPV2hmRnNORFdMblgxeFpNOEdJZTNkOXR4aEJIcVBB?=
 =?utf-8?B?YzN5ZS9oaXJnVDVUL2RtUDJtTW03SnZMeXhiOUtMb0FqakpNRnVEejFOMGh2?=
 =?utf-8?B?Zms2aFAzUzJZR2luUm9vL1ZJMHNFcmFWYkdJQmFxdW55WXFxeVhURjJwRjVy?=
 =?utf-8?B?elM1eUF2Z0JpY0NTdmtGNGtFbXpBSXNqTXkzOTNNVCtUa05IelJXQm9mWVBC?=
 =?utf-8?B?U21KVlVvTlk3aW5EK2dMWmxQbkNFbFBaZ0ljSTVWdlM0M3IxQWxtS2luMHdl?=
 =?utf-8?B?SWhVb3FIQ1RvV1F5OUJJd0gydXNsbWFmRUZkaDJDZDdOcU5vWEhVdlMyWHdh?=
 =?utf-8?B?Y2x3L3U2MC94bmo1TnpFTmZQWnA1VGFGc1VXR2U1bWlwZVBVNkRzMmlsNFhn?=
 =?utf-8?B?SlBCQlpoVVk4Zm1VSjZMMDN6Z3ZKUHU1KzBuMkJrdzM3cjIwK0RCL0xVSGhz?=
 =?utf-8?B?Q2VxYWdGYlRLQTlqLytHY1FZdlhXSUNuVUZoYlBXVDZMVkxoakl2c3hIQ3Y4?=
 =?utf-8?B?bk5YY2V0dzIycitCS05MSzg4SytrWDR6TkhaUzF6RC9kbHNSQ3BZdWtRMEY1?=
 =?utf-8?B?clRWTFcwb2Z6cEZGaHNUMWZTR1dqUTJxUlk2MUIxMFpoK3ZIOXhZSVRidjRa?=
 =?utf-8?B?RE16OW84YTZKL2Z4cW5IaHhWYnRGVDVBbENscCtHRWhuZE9TTTI4VCs1OXFR?=
 =?utf-8?B?OUxYQjBKQXRFckxldEwya1dTSWo4M2NzNUUzZXRNbE1MNFF3ejVZQXNaRFlh?=
 =?utf-8?B?RjNqbnQ3VERvVWliZGFCaEFrank3V3pXc3Z6dUpYeW56OTJ1SjhvcUcvbnJS?=
 =?utf-8?B?a1lrTk9MMlhKcGNHdWNWd0ZvNVlXSWVsaXpzQXM0bWJxZXZURWJHRExteFpa?=
 =?utf-8?B?M3JLY0wyVG1mdFpvRWJDQkxuSERoN29mZklxeElIVmpYcGlwUVZzaDNoQWJD?=
 =?utf-8?B?Q1pqNWJNUDI2QUdleHVYZXovNlFxN2pNb1lBbHRlaHdVaHRscm1GcGVpSDQx?=
 =?utf-8?B?L2lUK2xMSG9uN1FVdTNkVnJLb0dkY0Q4SzRLQUQ3b0RoMFk2MVhBNUk2b292?=
 =?utf-8?B?L0VVRU13TjdqWEZ1NDV1YW9zOEtJUzUyVUJHQmRGM3VOREs1d2w3TnJQZlZt?=
 =?utf-8?B?QjcxRlBsbVJ1dSt0bFZqeHFWQWNWTng1dlhnMVZFdzJRV3F4dDBNUEM4S0Rw?=
 =?utf-8?B?SS9sK0JtU3hlamJXaFh0dUNhT3V6M2dzMFl2QUxDM3pzOEZJYkVkQjlJTU9U?=
 =?utf-8?B?UXV0VTU2UjRFR0VraE80UGc3ZGRITzdNeWs3dG5mTUxpZUxqUWttUXF2SWQz?=
 =?utf-8?B?RTdMNEM0b2VaTlpmYkJrQnc0UHhBRDF5RkdIUVY4K2VxK2puMDM5ZlFPNm54?=
 =?utf-8?B?QlNhWi9INDJCbWVPbUFGZWJEb3NxRWs4aU9KbGRyeXVvS0dGL1FhbEptY2dt?=
 =?utf-8?B?SEMwR04xRTVaUDhpQzBMNjJnWXdhdjZFYVovZDBIdmZJS3dBdlkzQ0tTcXBH?=
 =?utf-8?B?OFNzUTVUSjQ3VnBaZWFSTGhINWRBMXp1ZmIzbzVrbm00RCtXZldiSXJYbnMv?=
 =?utf-8?Q?q2Oz0lmRqvWaZTcSVs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 406a9a86-2b37-486e-51cd-08de62ee15c1
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 06:33:04.3341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51cVgxi01vMVNckCPLTvTaygCA9PdBo61+4uFOZ8wQ15WDDIQHimZBbYfopYhU/0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7568
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52075-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com,amd.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bin.du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: BDD22D55F9
X-Rspamd-Action: no action

Thank you, Sakari. I sincerely appreciate you taking the time from your 
busy schedule to provide the valuable feedback.

On 1/30/2026 5:17 AM, Sakari Ailus wrote:
> Hi Bin,
> 
> On Fri, Jan 09, 2026 at 06:08:00PM +0800, Du, Bin wrote:
>>>> +static const struct vb2_mem_ops isp4vid_vb2_memops = {
>>>> +	.alloc		= isp4vid_vb2_alloc,
>>>> +	.put		= isp4vid_vb2_put,
>>>> +#ifdef CONFIG_HAS_DMA
>>>> +	.get_dmabuf	= isp4vid_vb2_get_dmabuf,
>>>> +#endif
>>>> +	.map_dmabuf	= isp4vid_vb2_map_dmabuf,
>>>> +	.unmap_dmabuf	= isp4vid_vb2_unmap_dmabuf,
>>>> +	.attach_dmabuf	= isp4vid_vb2_attach_dmabuf,
>>>> +	.detach_dmabuf	= isp4vid_vb2_detach_dmabuf,
>>>> +	.vaddr		= isp4vid_vb2_vaddr,
>>>> +	.mmap		= isp4vid_vb2_mmap,
>>>> +	.num_users	= isp4vid_vb2_num_users,
>>>> +};
>>>
>>> Could you elaborate a bit why do you need your own videobuf mem ops?
>>>
>>
>> Sure, ISP FW/HW can access system memory only via GPU VA, not system VA, so
>> vb2_vmalloc_memops can't be used directly, we need to base on it to
>> implement our own videobuf mem ops to support both GPU VA and system VA.
> 
> It's fine to use other virtual addresses than system ones (a lot of other
> drivers do in fact, e.g. IPU6), you generally don't need to add new memory
> types for this.
> 
> ...
> 

Thanks for the guidance, will work on it.

>>>> +struct isp4vid_capture_buffer {
>>>> +	/*
>>>> +	 * struct vb2_v4l2_buffer must be the first element
>>>> +	 * the videobuf2 framework will allocate this struct based on
>>>> +	 * buf_struct_size and use the first sizeof(struct vb2_buffer) bytes of
>>>> +	 * memory as a vb2_buffer
>>>> +	 */
>>>> +	struct vb2_v4l2_buffer vb2;
>>>> +	struct isp4if_img_buf_info img_buf;
>>>> +	struct list_head list;
>>>> +};
>>>> +
>>>> +struct isp4vid_ops {
>>>> +	int (*send_buffer)(struct v4l2_subdev *sd,
>>>> +			   struct isp4if_img_buf_info *img_buf);
>>>
>>> Is there a reason why isp4sd_ioc_send_img_buf() isn't called directly?
>>>
>>
>> In our design, isp4sd serves as the upper layer of video. Therefore, isp4sd
>> can directly call functions within video, but not vice versa, This callback
>> mechanism is implemented to support the call from video to isp4sd by
>> indirect way.
> 
> You still have a single module, don't you? Thus you can make a direct
> function call. Only use a callback pointer when you actually need one.
> 

Yes, exactly, will switch to direct function call which is more 
straightforward.

>>
>>>> +};
>>>> +
>>>> +struct isp4vid_dev {
>>>> +	struct video_device vdev;
>>>> +	struct media_pad vdev_pad;
>>>> +	struct v4l2_pix_format format;
>>>> +
>>>> +	/* mutex that protects vbq */
>>>> +	struct mutex vbq_lock;
>>>> +	struct vb2_queue vbq;
>>>> +
>>>> +	/* mutex that protects buf_list */
>>>> +	struct mutex buf_list_lock;
>>>> +	struct list_head buf_list;
>>>> +
>>>> +	u32 sequence;
>>>> +	bool stream_started;
>>>> +
>>>> +	struct media_pipeline pipe;
> 
> You might not need this for the time being at least.
> 

Sure, will drop it.

>>>> +	struct device *dev;
>>>> +	struct v4l2_subdev *isp_sdev;
>>>> +	struct v4l2_fract timeperframe;
>>>> +
>>>> +	/* Callback operations */
>>>> +	const struct isp4vid_ops *ops;
>>>> +};
>>>> +
>>>> +int isp4vid_dev_init(struct isp4vid_dev *isp_vdev,
>>>> +		     struct v4l2_subdev *isp_sdev,
>>>> +		     const struct isp4vid_ops *ops);
>>>> +
>>>> +void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev);
>>>> +
>>>> +void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
>>>> +			       const struct isp4if_img_buf_info *img_buf);
>>>> +
>>>> +#endif /* _ISP4_VIDEO_H_ */
> 

-- 
Regards,
Bin


