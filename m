Return-Path: <linux-media+bounces-46176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23757C2A280
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 07:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 697E6188E93A
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 06:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0085E28EA56;
	Mon,  3 Nov 2025 06:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xkjBrY/F"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012002.outbound.protection.outlook.com [52.101.53.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8976F21D3C5;
	Mon,  3 Nov 2025 06:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762150684; cv=fail; b=vBdPEtLKJj6Stt1ZsSGj6qf6DFsS7s3uHUe1oUUKY7UOrJFpjgT8NKcB9Cw2fA/BHzxriP4RLLriKxuFSfZtfJwdsXVdUlTTJOK/W6magkYtti/qT/od1J6ph3XizRS/xU0X7flZgTC8gpAuypeCkM93CPlrfTtR4eoawn4KUy0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762150684; c=relaxed/simple;
	bh=KDvSjIFxCmiQNGBICzK2jMfAz3Xvw6jsBZopjN3eA5A=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gMSwfNMYKN3dNPk2jHidkvjLNeGD4wevdB+CPtplP3LLGs0qpvgX8SDxGLCunVgiUcZFPGJEqgwfDo4uap3UhNp6HF4trGPIqIym0wksUwwuXG4X50FgEJRRRuBCVt16lbW028ieRaNwaqRu295ajGNNxaEsk/ZwB0K19vkpcf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xkjBrY/F; arc=fail smtp.client-ip=52.101.53.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/1+RXRl/krJK87TDjvgWW1TLes8T3xHIR48PjfGSs/J1pERLqCyMVX3cL/yJZOwDCErV+kAqpHiQu+VjoEL9XqImwr4tOjKNZiXCYxTHrMVRBLPY9NKBUiNRYhwrgEjA/xtUfqqZGRMvnbaDe/xjZjMiiTaYwa+iNMHEiVOZJV3+GRFkCKBgMMrPjrvVLqvc5Qt0uoXCz/ucZZKkHd8HhVRViNgkR6w4jBO+kdnUkAPigmHeYK7AjCHCq1NJzdNjKPWCTesTOneDcUd8M0L9mrm6vpZB/iAY929CeFLENrNyByeLEj45darv0vgqU53xQD6OtfSafYJJaMebMCNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBLZFqYzGDQPhOS9h1VOybvsl/YjOIW0a4zNBJ4HM7g=;
 b=L00LH+vE8cbn6l1HsDEuSaymc76KJQ5FomR7G60oeQr/N6fc8ISswPxQSye7Ql/I1lfsX/YJMx0WtO52wwri+2oGW80OE2Z5TnotgVFn4AU9lyugkpj2RQv7Vh+lkyrSz0Hnre5k8JEaVm9loWXI3y4uo5iH0epddsDgvP3BRbuTFHmIhtUKErTHEuUTdtH+WFJlbe1tJq9v6hiyfKtNfghI8n14A2Ke9aWofhI6+ZUHmtvf9ds0rtknH6RQrBWW1E+3frJQy1infez0o2cZ1Jx3RdKGiAzF7llsoHjdiBys4jIz46VMDAxyhgCXWSBrHACDaHh3raL+jqY/CiD3EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBLZFqYzGDQPhOS9h1VOybvsl/YjOIW0a4zNBJ4HM7g=;
 b=xkjBrY/FR77SFutXan5tVZi8Skyes57lC6kLABUS1ybcHSTlH0Fq876U1jy7WsVEMQSvsc/NX9FkRWHg1efcqXZbpsO1FHYNUaxj3MBr14v08OpMT+760t/AFb5NAvvYHaZ1XwPHfM+rkaqvGP7EkCmYQuUL4xUPTeezruXKpJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by MN0PR12MB5956.namprd12.prod.outlook.com (2603:10b6:208:37f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 06:18:00 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 06:18:00 +0000
Message-ID: <c100f7b0-a4e6-42a9-b6f6-fbb4deea2b01@amd.com>
Date: Mon, 3 Nov 2025 14:17:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
From: "Du, Bin" <bin.du@amd.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Mario Limonciello <superm1@kernel.org>,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251024090643.271883-1-Bin.Du@amd.com>
 <20251024090643.271883-2-Bin.Du@amd.com>
 <93233d51-5ff3-4f10-96f6-a2957325f1bd@kernel.org>
 <2c7ee056-546c-4891-abfc-c1d41e2c1632@amd.com>
 <3194b3d3-5158-472f-9c68-0b0187e2c145@kernel.org>
 <7b20fb08-fa96-4bd9-8240-05b7f8f31681@amd.com>
 <6668e1f8-c279-4616-aaa2-02669895e623@kernel.org>
 <5dfecd81-4b60-4205-9422-43aceefd2316@amd.com>
Content-Language: en-US
In-Reply-To: <5dfecd81-4b60-4205-9422-43aceefd2316@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|MN0PR12MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: 462f4d8d-26c7-4f78-1107-08de1aa0bcb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlAwTktldVlPV3dQVEw0djJhZFFCYjFDRHhDblZDNlJUbjZ3VGdpYTU1UGNq?=
 =?utf-8?B?RjJUQ0J1RjJnMGRUamg1STJTY0lxSGJHaHZtdHlvMmhPTXVJeSs0QURzQzAv?=
 =?utf-8?B?dUQzc2tLMUx2dEY0OXNYalRUNm44RUZ0QmJ5MjhueWhJQTFXclEreEpkL2d3?=
 =?utf-8?B?cDc4TDhJUGMyeWlwcWFFWFBuajZJbTZxVlhzOC9yNmlWNnphaG5OL3FadUdE?=
 =?utf-8?B?SW5FY0ppbUZWK0xKdFhhekRRa2g0U0xOOG10K3JEamRhN0dhQmhIWGI5YVRw?=
 =?utf-8?B?RHJFOWN0N1FkL2Z3WDArNFV2a1FRS0hGVml2SDIrMytNbGJXN0txSTZJU2w4?=
 =?utf-8?B?bXFyQlZ2VFdSNmMrT2xlcDRZc3pyTG9lS0hSbkdXdkpldWZ3UXhHdGxXaGxY?=
 =?utf-8?B?UjlMcTNWanBJVWlnVGdKRXhiUDQ0SEhaYzBLYnkrTzZoWk5nV2RqM0JlZVNC?=
 =?utf-8?B?ZTV3VFFUL3Z6Z2hLU095VktzekRvWVRUK3l5TEwwR3BRTmtNZ21Qb2UxSHJN?=
 =?utf-8?B?cHc3TWxtZGdYU0JHOEN3REQ3ZTZCdUlEOFpoV1h5UjZxTGc5dER5K2Z6WE8r?=
 =?utf-8?B?QUlpOTd5aUNHV1pqeEhSU0pRRlJhSjRCcVlRU00wL1lzbG01V2JyMnF5ZmU2?=
 =?utf-8?B?aVNZM0pjL0doYnJmOWxnVVd4dmxrRU5JaDJSWnZ2ZG1YNEV4MEx6WFBQamRL?=
 =?utf-8?B?blg0YldWMjJWSmUwN3Q0RFhWcTZLNTNaWTIxcUNSczM5NmlXZ1BITUIrOFZR?=
 =?utf-8?B?QUVHY1IzSTVDU2x4RDNDeWpJMmhrWlRFTzlGejE2cVdQaWJIREMveHlsMEVL?=
 =?utf-8?B?d2FtVHVoamt3RVhlcnQwdjl2aDQzV0dyMHB0WS9hdHhHWnNxWUYzeWgzZWxk?=
 =?utf-8?B?WkpvUUJqOU9OOVV3SWhValBtQnFlbFV4Zk5yM1N4VTNHbUtCaTZxeUpacUw3?=
 =?utf-8?B?MndOSmFEUmVKMjZsOE1jdnllQkROWG1WMGtUcWNSVCsvdHIyWlhnSVhiZ1ZU?=
 =?utf-8?B?czREd3lFaHpMOHNEejZJUjJ2eHVZclNLS1lVcnJZbHBQMlBGN3JkcnlWc0FX?=
 =?utf-8?B?c2Y5QlB2T3hza0hzRm1FWVBsckZmSVBwOWdBcXRwQi9Ic2FyWk83U3U1TWZr?=
 =?utf-8?B?UmkyMFhmWEdvbWhiU3RkdFFiT2NzTklROVFOc0VYWU5GUkdRKysyK05zbXhj?=
 =?utf-8?B?TVA4SWZvUlVveFVIRXdod3AvaEhDQjUwbTFQZVBYdkFkcjNxYzdVV245aTNo?=
 =?utf-8?B?RHdUQ3BibFBuS09nYXY0b1RUNG9IZEExTkRPSlFEd3V2aDFjellaYTFXeHo5?=
 =?utf-8?B?U0JkN3I5V052Tk1ncVdFNUptWXNzdlR0NzBuclpiOVJuUTZBMWZ2QXJ6RWFI?=
 =?utf-8?B?TGR2aGk2S2pmZm1VRFdOL0padElQTGQxNTlLbE5xNUxOaktVYUIzVE5mODA2?=
 =?utf-8?B?NDNaTkgzZ2RFdDNvZDlGMG15R1JIamNiUjdnaWYzUzRxbzQ1RXduZHVIa1RK?=
 =?utf-8?B?TDRWa2ZuTnFPY1labTdBWEpoTUJFNjRHWFc1cjJKZi85Q0Q5ZnU2Z2Z4b2lz?=
 =?utf-8?B?dnpEbVRKRGpCNXRROE9xZEFJVVVzbk9RYjJkcU91RUJMaFhjemtaME5FZnI4?=
 =?utf-8?B?UDEycG9EM3k5QU5xLy9aZGljUTBHanlRRnlVODJJcUQwdlZtMnNodm5nUWEy?=
 =?utf-8?B?c1ZGZGFKejVoYkRZR1dTelVxRGRkQkgyZytlT2NGRElyaTlvQnA2eGt2Smx0?=
 =?utf-8?B?ZVR1L3VOR05VOVkwak1xTURHdmVaYmFJN3puSnM3OE9iV0RMYTJaRmNPak53?=
 =?utf-8?B?YnltdWtJRGNWM0tGVG1vYUVObFJmdmh5MEhjTDcwSmxMMnhhajdZckZVRlRj?=
 =?utf-8?B?L05KWXNrVFZGZVRuN0U1SFIraWt2STJwQmNOUm04dm5GRW5TRnVGNmFsQnFY?=
 =?utf-8?B?ejFIbHJlaE0vc3c1NnFOZXk3SEJuU3doaGdUNjFVR3dZZERCYmkzZ0RqUDc1?=
 =?utf-8?Q?M2O9p3ahP/w50gEvrh+8xDgB89aG8o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHh0bFFWcGNOVjFPSjVaci8xL3o4aFhiakF5TUxQYXNGTHRtRVpVcEgyT1hD?=
 =?utf-8?B?Uk5QSzArN1A5YmZVeEFzaHFvTWp3QXJTcElnaDA1NWQrU2IvYi8vY0VTTlhk?=
 =?utf-8?B?TzJjQ1N0RmpsaEdNOVZ5c3ExRDUrSUk0R0g2ZkJtbk0rVGhKTVd6YTcvaG5G?=
 =?utf-8?B?dGlWUGFoc0N5Ym9rZTdYR0tUSG05RnNtelZZZmZ5SW55MW5hbk10c2NSdDl0?=
 =?utf-8?B?bUVtVTdIZzFTVmxSTWR5ckNQT01QRUw5L3dxTnltdkNNQTJaMGttUUVybFlR?=
 =?utf-8?B?aVBoOUt1cnkycjJqS1JjMjB0eWpYRVpWd0hYWEJxZWJoejZ0R3JZTzVmc0RZ?=
 =?utf-8?B?dWVZb01WQUVjcUVVcy9xSk1FWEVvTHV4UzNIdVR0bTM4SDEwVk94VHJseER0?=
 =?utf-8?B?VU80YkRVQ2RqNDN2ZGd6V05uOVNMaTBQeUhpR0Vpd2RIQWVxR3k2eEU2aU5K?=
 =?utf-8?B?VE9zeTRpQ05qcFJqTlM4Wlk4cGJZUzczeHhEZUlJMDlaRmw2Ri8vWnY2RFJp?=
 =?utf-8?B?aEl6aFpYMExTcXFEMEVDKzRjMmcwTW9QZzV2Q0ZxcHNSczNSUHJINXRFYSt2?=
 =?utf-8?B?YW5UZHZ2TU5GRzdUby8vS2RkWFdNdzRwWjdtTzdSdzNLQnErSnh3bEZyUXZT?=
 =?utf-8?B?NmtwU1BEUS9MSWZIdEVydlJaMG9lWGttazNJYUEyaVNNM29Gejk5bkFsWHVM?=
 =?utf-8?B?V0hSUG5SaW9lRU91dVlvTXg1S3MrRkZNdkJZQlFrdC92bW1ZNkl1Z2pHUG9r?=
 =?utf-8?B?aHZXZE01SmdZL2VtOEUwVXBkQnU1TGo0dzhqblk5b3oyVUF1c1FUdGdTeTVZ?=
 =?utf-8?B?eUl2U1hINDc2Z2NtN3pDdFpFSWw4ZE9uWDl5MGl2WUpuWGVtOHZ1SjE0UVU0?=
 =?utf-8?B?dzNOZEtsZUZHOVBxcm5zaFhuOVJzdTVRanoyYXFjdFNWQnpUZ3h6R1VtS1Bj?=
 =?utf-8?B?c1VOVUdTdDAwVTgzUklVc0lTemprWFR5TlAxZ0tVbndIQ3FqSXhIdGRheTlB?=
 =?utf-8?B?MEFQM05zWHllN0JOVHRteUFmT2hldjNoWlgzS3FEYlRtVnk2bThoOUduQ1pl?=
 =?utf-8?B?STlPSVloRkpWNnNBb2Z0VFR6ckVFZ3JyYnQwZHh2MllUc1h4T3h4VCsxNUtX?=
 =?utf-8?B?MGJDOHVLRFRnbko5ZmpuVnFaSk1FMjcyNHU3b1RnZ3I4YkF6Zk5nZjdzUlNT?=
 =?utf-8?B?ak1yN1R4TGFnci9OVU9WN2RERklPd0pJYWc0YUxjejVKbGpVUGRvTVhMVVMr?=
 =?utf-8?B?V05sWGxrOWtweGpTdkFhbzhnbnR0VHlCTkFidVBLdzMxTkIxcWppOVZacGti?=
 =?utf-8?B?dTBZcnZWTGQxeXRpL2g1cUI2cjVUaGU4TlNjQ2dMOXlyQ2t2Q0VkaVArZHBX?=
 =?utf-8?B?MFF0ekRXZUdES290WER2SDZGdDMwZTVuejlYa1RuK1JIVUV4dHlwRCtqNnll?=
 =?utf-8?B?UzY3SnZGWlRuSEVpZjlObEVJeW9oZlQzek5jZWNHLy9kMVVJWjFlYlJyN2Jo?=
 =?utf-8?B?RDRDOFRrdllMd2Q0L1JWK3cvZmEzWFBINnJOVkdZSnY2Y2s2ZVkvL2VmZVlt?=
 =?utf-8?B?bFBKb0JQaGxVRHA4eHBVRFlmNHlYSkVOZWJ0ZUp3b0ZGR1JCSlVPRUFLSnk1?=
 =?utf-8?B?a3J4YlAramh3NzdmVDNCUWluNmZ6MTVHbXBGdWM5RU5hVjRvaFhxVGdTUDRN?=
 =?utf-8?B?a2I0ZnhYTVl3bytaNHNWdURtVkhoR2Vjd2pobWJoTGQzTEsvcTJkTGR4d1ll?=
 =?utf-8?B?Njd6dElCNER6bzF1YW03dE45TzVDYWg3d09PalBoTFY2bkF3SDJmT1kvUHlU?=
 =?utf-8?B?OTQwVVdiaW9HdXFZSUVpVStvdThtYm5DZmNRdDFWZks3Q1NhRWtkSXVGOE5s?=
 =?utf-8?B?Y3lydi9MeDdNS3ZHY3ZjM3pQWHMzaVByOXBSdWtSVjllZGpRNmtxYmdLQURF?=
 =?utf-8?B?OGlvdE1Ga3ZvbXh1bnRIb0hhZXZhdWZaY3FweFFwcXFveDR5SHlMUHFxbGh1?=
 =?utf-8?B?WG9rNFdITU5XSWU3QUw3aUQxSmFxUHVtR1hrSHpMdHJkRkl1YzVibXE3MzBa?=
 =?utf-8?B?d0Y1eGduWGtsbXE4VlExbmtHUVp4Y2NyVUNneFNhdGNmWkZLWnBWUWhhYURh?=
 =?utf-8?Q?TVWk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 462f4d8d-26c7-4f78-1107-08de1aa0bcb9
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 06:18:00.0046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqvRnnXgImNGKw4gybEala7huyGPW+RCA3zcGEjqIVtr0JEH+n7DPMRnk81vYU7q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5956

Hi Krzysztof,

We’ve set up the clang build and kernel static analysis tools and found 
additional warnings aside from those you noted. We will resolve these 
issues and submit version 6, including fixes for other version 5 review 
comments, by end of this week.
Many thanks.

On 10/28/2025 5:10 PM, Du, Bin wrote:
> 
> 
> On 10/28/2025 5:06 PM, Krzysztof Kozlowski wrote:
>> On 28/10/2025 10:00, Du, Bin wrote:
>>> Thanks Krzysztof.
>>>
>>> On 10/28/2025 4:41 PM, Krzysztof Kozlowski wrote:
>>>> On 28/10/2025 09:30, Du, Bin wrote:
>>>>>>> +    }
>>>>>>> +};
>>>>>>> +
>>>>>>> +module_platform_driver(isp4_capture_drv);
>>>>>>> +
>>>>>>> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
>>>>>>
>>>>>> You should not need MODULE_ALIAS() in normal cases. If you need it,
>>>>>> usually it means your device ID table is wrong (e.g. misses either
>>>>>> entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
>>>>>> for incomplete ID table.
>>>>>>
>>>>>
>>>>> Thanks for the clarification, yes, MODULE_ALIAS() does not apply in 
>>>>> our
>>>>> case and should be removed.
>>>>
>>>>
>>>> You don't have ID table, so probably this should be fixed, unless it is
>>>> instantiated by some other driver, e.g. as MFD. That's the only typical
>>>> use case for alias in the drivers.
>>>>
>>>
>>> Yes, our device is a MFD, so alias works for it, as alternative, we can
>>> add module device table, it should work either, could you please
>>> indicate your preferred option?
>>>
>>
>>
>> So it is spawned by drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c or
>> drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c ?
>>
> 
> yes, it's spawned by drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
> 
>> If so, then your code is fine, that's correct use of MODULE_ALIAS.
>>
> 
> Thanks for the quick confirmation, so, we'll keep it.
> 
>> Best regards,
>> Krzysztof
> 

-- 
Regards,
Bin


