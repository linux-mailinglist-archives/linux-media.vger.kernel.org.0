Return-Path: <linux-media+bounces-66035-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JkDaGwRdQ2pZXQoAu9opvQ
	(envelope-from <linux-media+bounces-66035-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 08:07:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF66E09B1
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 08:07:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Xu9TzIVy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66035-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66035-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D2E330117B1
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 06:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197F7345CA8;
	Tue, 30 Jun 2026 06:06:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE7431F9BE;
	Tue, 30 Jun 2026 06:06:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782799609; cv=fail; b=qsrxAcbiJgRhgyeKLGO/hsi9zPeVJqdzilWtxRQmYbj7kYg4rsvOsoSI3RcRMOht5kESOMelvQyziJFM2xXhSzP0qhSkvXIhtZoGun4jTrqOEiJNTDUqg+UWLO+hNJesQgSRXd/fmZHAISqXnzUlBru6MDlX7frIfwmNr2RzQvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782799609; c=relaxed/simple;
	bh=AJyABz/wD6NByXIm8QOWOiT524xUlyEIGMmTzEsfe6c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aoEH1pAq9TGM9nHymOtHgUjsG6AfE9R58E3PKlkKRxerZSZFxwNqmRrRLJpWLicEgMxd2stb/S1ndJOZ3QXFCOu8fsVJX/r5syUeHOCxnpvSfCYe+RyDIJf+ib+021zNQ2/eTPTD9T/LzaxV7MLXMfLgq6wKt2B47JTF/9N2Bnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Xu9TzIVy; arc=fail smtp.client-ip=52.101.56.11
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jD8BMqSYrj6SS8b7TxKaIbvL34y50gZBp0iUSztiDqWWxTDvOqXsxcCe3iIzgqaeayWVA2/kELht0iHvL3LqR6lBKqnWm9M++9FOOo8nPpZp08rnjOlAFHQMvPxKYgvPyWvCVnTb6gamDlx3S+dVFqYnnFF+LNgYrMIQWg5yKbi0anjrVb/K4wXa4Jy9fHmTnZz9LmLLS6BdwCZqoY9h0dgGBIFidfhsWwXnHfP+h7nVtX6PtiZm4dIlOm2WG4osN93DzTlr0U91BxVSI95to1NHtsyLiD774syLdgSWx2O8EGzKDQu1xDteuzwbjQvjlzpg/g0z6lYYgYpyFYZZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4j7aeXz8jAUIpYSFJXFm2K9nCEn9xI/Tr2QmS9+DWVc=;
 b=Q9yXGrHTaBpXIjFWbbBGo+cFxMo8HUt05VX843nBNEw5B90PIxUotO8zUgQQA7khEhEm62Ng4fk5l/ho1nzDFINm+eSnFcYStH49K8Nqxf9fRQdeLam4VYaPrdVNWyyaR3g9JOlZGIQHK965wbr8puurhb/jdl7pbxIa3fHqLqU22CtWVrDtf4yi/GQxtVIZauULHFWR0CZ6ikKbFjmnZCvdKR+oHRwid1VSS0Set+Ibm0G81gxOimD09kNLfPZtHnfsVnE8GD4RRYB8m8OHjzN39jNkUnYg5G9TziBGAM4RSEObWFurwuaG9J/8QgxP+dwcGA2FHYDt+n4mq0COHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j7aeXz8jAUIpYSFJXFm2K9nCEn9xI/Tr2QmS9+DWVc=;
 b=Xu9TzIVybQ/RSwX4dHvX8RWHarC+bN3R/as78xQPQHxpHdVRwZWYoBGQqs2yntjcRNEHBHKPx5lcUFFB2+dYfXEhByG2yXCHjlleO+GyQZ4dr7eEYSNyOXJQv1ELLBSEaTQKeAvl7toFV7Nd7NgETwtyytu/2F/38Drm6bOl8lU=
Received: from DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
 by DS2PR12MB9821.namprd12.prod.outlook.com (2603:10b6:8:270::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 06:06:43 +0000
Received: from DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589]) by DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 06:06:43 +0000
Message-ID: <eab6abda-6f06-4dd4-9aad-1bcbf135f90a@amd.com>
Date: Tue, 30 Jun 2026 14:06:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] media: platform: amd: use refcount_t instead of
 atomic_t
To: "Nirujogi, Pratap" <pnirujog@amd.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Nirujogi Pratap <pratap.nirujogi@amd.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
 <20260629-cocci-7-2-v1-5-5884c80ee3b6@chromium.org>
 <8bb876da-5691-4471-8813-b12d07ca8ca4@amd.com>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <8bb876da-5691-4471-8813-b12d07ca8ca4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0013.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::7)
 To DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7747:EE_|DS2PR12MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: be49d8b8-f95e-4e12-c425-08ded66dc221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|921020|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	EzF5urj88eexhVh8307C/uwDe508k+fVy24d76AxNtq0hoSH5+UuMEM83eK77S3BpiijwXmz6o219Wh3Ys0rhPzqWUKGpPcwVFT7ZXsvS3KizVjjzBR25+kwzwmAKOKBKtcgFC1S6/zAp3u6meiIOG1HdpbLkP4kXdzCZiN42Pi39cpiTBF8ovSnqJ3ry4NavOzNFoCtJOh+c7NL6EFVuxlna/HrUOpsZ64XJIMumQUZFTuzSdYNrcgkoouaHltUW2Ao3MiFjJ5vMJ2jmICzESyoAkzPd8BE7X7AVC1VsiYngVM5f7SpmLy866QAPtacmOX2j8LCPPbxhlPX3TOUPhJPuF0SSVAY2ICn+y9x07kSFs2305wGNwXaljWnh6AwgOBGL7eK1LYbd94ILWfPce/D6YpQUjfMraq3f6kJEo0EEx3SdIV19JlyaOXCzkEeSzpTFb9c4ZbrRAvnlNjV/b1jMjWZI49nXV7LymBKiN+6nqXgb8ZgfA6evCjlSqN3UcRj+L1If/GEon2PJG+M/mzpZ3z9yJeU7coSyiYtQIdkCItic4lsc709oifwRWryPpDtT5xRX5zaCfW8LVKUx5RR4uPJdrnZlz8KnO65aGJJtn4nPb2iMt8mlgyEZWTSf3dYWit2tOdGnC/7F+gwdfMwO5m/yptUmHjLNnj7Ju3TP/7cqiIa4M3mpeY1FuUwirIUF5f1h84AAlWsNAYHtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7747.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(921020)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2hucW5KNmhiNzk4Y2FxSmpwNStndmN2czhHWTUzN2tCa0xNQ2g2bVZuQ3VQ?=
 =?utf-8?B?ZkFKRGlXWHFDdUlIdXpQYi8vRzlLdWRnbEk5aWpHNXJqbmJiZlhYNWlLWlhX?=
 =?utf-8?B?L1FxYW5pQm00QmJpNjVva1FxNFovejFpVzFVZC9NOTRsTnR0U09TWlJvYUdI?=
 =?utf-8?B?bHZtYnN3VmhpZFJ5NWs1Wk04MUZsckhsbVZPZHljUW1abXU4QUZtVU50bjRu?=
 =?utf-8?B?dEVmUG90aHo1VE1LMXZMWXlWeTRNSlJkS2VwVWdvRndGdXlLMU9rWUwxUGh6?=
 =?utf-8?B?WUF1UXUvNHNqam5EK1JmUERHMGErczNTcmpuRml5UDFIbHFRbjdwcFJjd296?=
 =?utf-8?B?aUFwc25Oa0tNQXNEdmdvQmJDR29RcGdyMkpLSVA0V0F6djgxcDJrWDIwSzNp?=
 =?utf-8?B?dXNFVlRXS0hmWDVuNUh3NkhQeDVjcDM3ZFlob2FqTWtnOEc0UnVkWWhwckZU?=
 =?utf-8?B?TUtSQ25CSTNNR2I0VTBWM0Q3RzB6OU1MOThZRXNjYWtvMEZ6TmxQK1VzK045?=
 =?utf-8?B?dG5zeW0rNGJDWTQwbGFLUzQ2SXNrZytvYWZTc3N0OC8vM2tSQU1iSU1zbXRS?=
 =?utf-8?B?VHpodHdwb2dUTlBaeVdTSzdUenRDbnRwN0Z5VkdpRXhwcmxmNHJaYW93QXVD?=
 =?utf-8?B?QmtGaGZJWjA3ZnRSRk1sNkZCbFpaaXo4dGRZWXVhZmdKVFFqZWlBaHZQTVF1?=
 =?utf-8?B?RUlQUzdaVkZYVlFEb0h3OGFsRkVqd2VzR01OekJQRTl4d3N3d1JzUEtacVJq?=
 =?utf-8?B?ZGRHaitWcXJXSnpHQkNwZ3hiYTltVWcxd0pRMkR6TnAzTjlUekFFQlY4SExl?=
 =?utf-8?B?eklWWEV3Qkc5RW1iQVZDMGtoZkJJanV4VWdReWU2QTlBQk1DejNsQ0tDQ2Z5?=
 =?utf-8?B?MXhybFZZQVc5TDNDSmRuV0ZJMkYzeHBzTERqeUM1enM2cnB0SGtvblNSUXlE?=
 =?utf-8?B?cjlZR1hGZ2Vybkk2RDV3RTFYNDExSGlxc1ZMcDlYQlU3TExLc3RUTnMrckJl?=
 =?utf-8?B?eHhweVR6SXlZc3YxbmY3UkI5aHVndTM5c3FmV0J4VzZTVlQrck5yNW8zdTJn?=
 =?utf-8?B?YlZPMlNsd2djV3QvKzVHbXRtT3FBUk5haTdTQmZad3g3OUUzN1B0ZmtzVkdh?=
 =?utf-8?B?b3gxSVNvNlBjNFkxOGVmTkprN3RVTUN0L3JGdFJRUHZ6aURabkNKTnVRZmE1?=
 =?utf-8?B?YlJ2NEh1d1ZQQ2dVOXh6RzFkajhoSG1rekMybE1XK2tkUFRDV1ZwS25rUkdP?=
 =?utf-8?B?SmxDWFpseUtyS3VKZXFnbG9IL0RQTitUVVdjTTFDTVl2K1FyOFdGemRDSUVT?=
 =?utf-8?B?SHdGeElNY0NCVVAvTmF6WWdSUkU2OXNCMXBkdkN6OVZsdUdXN2cyZmlFdDVH?=
 =?utf-8?B?djBLSkRNTnhZTFdGTGprU3NQd2hyRWZnUVozV0UzMkxUZStiejlHZkhvSHpL?=
 =?utf-8?B?M2VyNVlYejdpckZsTjc3RmNQanBjTm5ocExtWE14SDM2RjJwNWlqbElvZFBr?=
 =?utf-8?B?N3JCWFhhamFZMnk4emNVTzFpQmpRUHQzQmY4NDF4RSthTXRBSWdIZlMzNWsw?=
 =?utf-8?B?M21lbGN2NzRCbWlOLzJtL2Fub1NHcVdJWkhObk54NnUxeTE1cnJncUN2YUhY?=
 =?utf-8?B?WHJwZGpiTFhuTUNpVnFIb3M2S0tmcUVLYlVQL1E2eWEzdXN4c3N2a3YxMWs1?=
 =?utf-8?B?NG83UHFFcnJtNVN2aWpPUWJ0NDZpQXdoTEEyclZHL3pXTXkwckJhQ2FzRFk2?=
 =?utf-8?B?T1BqelJIYXN0Z3pXSzRQWUtpM0lMVy9jeGwyYnVFbjlXTmF5U3dXdVJiNHQ3?=
 =?utf-8?B?OEhVa2FDeElCMG5ZN0xBbXNIYm9ybjA4RUFFU2x3dUR5aEhDbmpzUEh6V1ox?=
 =?utf-8?B?VDNhYnZndHRaeHd3RmJ2NDlzU2ZzYllpekxNUXR4d25RTE5RQTZaVHBXMHkr?=
 =?utf-8?B?QUV3cVB2MDhQcFNoaDAydnVhRWZzTGUrdllSNDFPaVprTzd4b1ZPU2dMbUIw?=
 =?utf-8?B?T3hDVE5oWHZla3FNTEFvSktUTkQ2UkluMHhzVVZNQUcwbUJ5VnhabDdoU2tu?=
 =?utf-8?B?U0hhbEI4V2c3QmJzaVZwR2M3UVhMUWVUNlVnN1hoWUVJS0pUSnNKTHdpdDFK?=
 =?utf-8?B?TDJoVmtqMHpNMFhDRTFUamg2dUNRVWtXMlFJaXIrZHVyWEE1SU8zajJtQW5P?=
 =?utf-8?B?TkIrL0Jjd0FPV2JaeFRPanlaVXhLOE1DTC95b2xWQ0RIOFN5L0lxTCtLTHNV?=
 =?utf-8?B?b1pxRXUxb2RvZStQS1Z2ZmZ3STN4cUxkUVlMWjFHbWF3eFROWHIzN1MybHRo?=
 =?utf-8?Q?GSIW/tv9ETd4we2fxp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be49d8b8-f95e-4e12-c425-08ded66dc221
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7747.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 06:06:43.2686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htfpWxScfACjNeQVO94wnkeDZiulXUdv56IYGGFiZMPdV8wyu8v5woeQq3C2l8jY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9821
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66035-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pnirujog@amd.com,m:ribalda@chromium.org,m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:skhan@linuxfoundation.org,m:kieran.bingham@ideasonboard.com,m:pratap.nirujogi@amd.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:sakari.ailus@linux.intel.com,m:aospan@amazon.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CEF66E09B1



On 6/29/2026 11:51 PM, Nirujogi, Pratap wrote:
> 
> 
> On 6/29/2026 7:30 AM, Ricardo Ribalda wrote:
>> [You don't often get email from ribalda@chromium.org. Learn why this
>> is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Caution: This message originated from an External Source. Use proper
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> We are using the refcnt variable for refcounting. Use the refcount_t
>> type instead, as it has support for saturation and underflow.
>>
>> This also makes cocci happier, as it will fix the following warning:
>> ./platform/amd/isp4/isp4_subdev.c:394:6-25: WARNING:
>> atomic_dec_and_test variation before object free at line 395.
>>
>> Fixes: 4c5feef6a62c ("media: platform: amd: Add isp4 fw and hw
>> interface")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>   drivers/media/platform/amd/isp4/isp4_interface.c | 4 ++--
>>   drivers/media/platform/amd/isp4/isp4_interface.h | 2 +-
>>   drivers/media/platform/amd/isp4/isp4_subdev.c    | 2 +-
>>   3 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/
>> drivers/media/platform/amd/isp4/isp4_interface.c
>> index 8d73f66bb42c..00a817909292 100644
>> --- a/drivers/media/platform/amd/isp4/isp4_interface.c
>> +++ b/drivers/media/platform/amd/isp4/isp4_interface.c
>> @@ -375,7 +375,7 @@ static int isp4if_send_fw_cmd(struct
>> isp4_interface *ispif, u32 cmd_id,
>>                          return -ENOMEM;
>>
>>                  /* Get two references: one for the resp thread, one
>> for us */
>> -               atomic_set(&ele->refcnt, 2);
>> +               refcount_set(&ele->refcnt, 2);
>>                  init_completion(&ele->cmd_done);
>>          }
>>
>> @@ -455,7 +455,7 @@ static int isp4if_send_fw_cmd(struct
>> isp4_interface *ispif, u32 cmd_id,
>>
>>   put_ele_ref:
>>          /* Don't free the command if we didn't put the last reference */
>> -       if (ele && atomic_dec_return(&ele->refcnt))
>> +       if (ele && !refcount_dec_and_test(&ele->refcnt))
>>                  ele = NULL;
>>
>>   free_ele:
>> diff --git a/drivers/media/platform/amd/isp4/isp4_interface.h b/
>> drivers/media/platform/amd/isp4/isp4_interface.h
>> index ce3ac9b9e5cd..04db71cd54e6 100644
>> --- a/drivers/media/platform/amd/isp4/isp4_interface.h
>> +++ b/drivers/media/platform/amd/isp4/isp4_interface.h
>> @@ -68,7 +68,7 @@ struct isp4if_cmd_element {
>>          u32 seq_num;
>>          u32 cmd_id;
>>          struct completion cmd_done;
>> -       atomic_t refcnt;
>> +       refcount_t refcnt;
>>   };
>>
>>   struct isp4_interface {
>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/
>> media/platform/amd/isp4/isp4_subdev.c
>> index 48deea79ce6c..2a8bc1207843 100644
>> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
>> @@ -391,7 +391,7 @@ static void isp4sd_fw_resp_cmd_done(struct
>> isp4_subdev *isp_subdev,
>>
>>          if (ele) {
>>                  complete(&ele->cmd_done);
>> -               if (atomic_dec_and_test(&ele->refcnt))
>> +               if (refcount_dec_and_test(&ele->refcnt))
>>                          kfree(ele);
>>          }
>>   }
>>
>> -- 
>> 2.55.0.rc0.799.gd6f94ed593-goog
>>
> 
> Reviewed-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> 
> Thanks,
> Pratap
> 
> 

Reviewed-by: Bin Du <bin.du@amd.com>

Regards,
Bin

