Return-Path: <linux-media+bounces-34699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E04AAD8132
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 04:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AC5B17B7C3
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 02:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A97B244666;
	Fri, 13 Jun 2025 02:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HtzI6lwk"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0056123C51A;
	Fri, 13 Jun 2025 02:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749782618; cv=fail; b=kwaNO7wmxJbZo5etWEBPWUUXdM4h/5yoqWu+e6BMKDecdgJX1VG6TfGpPeDaM+RqzT2Ajsq1miBlTb9aBxnHwU4VGFLleQK27CDmMb5hIDluEcuvbEZINwI3EF7cEtDhApSnThGf4R+siAsJcPZ4bFGYtmFCpNQuCtR57u4suxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749782618; c=relaxed/simple;
	bh=KyImf6SF4MpAtEufHSGy2uCWDiJZ12uPwaJ5Qu+UsXk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VoWqmIOTm7HPEwDTu6benzx1dzb9+lwLLt8BT4yswyrXQW77mft2N/aklzgWewnW2UTqn0hH3kc2u+QM3bknQUh3mERKATNPyp8/6GJat7KU+ogzBYNAsqtyx53YK6GKXxepGKmsr6cv3h3psCIj8VDEN92pWG57qNnVbs9CX/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HtzI6lwk; arc=fail smtp.client-ip=40.107.244.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyuZVe6AkDypIpSGZ2qgX7o4ZUplVQy3R+vfbtmWX79lr6Tj62aZ87Hh0u9C0XCMl8zxNeJU7akPXXd7dHRz99JnZAPsKd+P2wvZF+ced1u01cHvvXwdB8hw/YIHLAWp9oi6b23kGNcu06MIeOrbgWGTFEkvsy3nPUzxTmL97XUL7Uvo+LMsLTBjeQG6UtVcuwB2Nqb3APr64juOk+J4JOckWI1t4aHv+z2gE+E2cD9ASnaTUKFjlGBpFiBD2/fu/UXtj/w14CPv2CBbbZcPmHAGoaDVxeplnRcWjDCrwhK8tajlKINMiD4GoA8S8g+deRm6qgQww0LreKvy9FUoEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yc2bcvAAU49I7KfTGL09P4WlGaqh9t98ueoJ8zHtcpo=;
 b=wXmvFnByCbHTQL7UgnTufaPmlKARPQTrVDSaPLDkn3HZvILsHZTCEDPo5WU/eNe2NQrsh6W2jepRQd1/WRcXVuDQr/w2EAzpFPwRBi9Os+4j6CbaC4+NgxwLStv9Ylf+Lkfku6Yvf8538dggmVw2H0tmiNNAqo4eGJp1FZQ5E25ZVlH9VYZU4V02xbS3OEmTGF4VwCWFqgYVZz8JxlIXul0AFM3R+8zQ/ZdUeZ9RPUssoNleMYkpYbwpVGcwsGA06j8dDYxN2XFoMST+rpTirrsP3nQD+IVo5k9WC3/tblnmuhO8zH9Sc+YT5oiJEOrUfVfDqdtv2rfI1D5o3RlfhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc2bcvAAU49I7KfTGL09P4WlGaqh9t98ueoJ8zHtcpo=;
 b=HtzI6lwkMgGKyevDTVmh1VYRJW24Z6JUPqXfXHcJsY9FqscKuAhtb7R/18+/ASorC2VuqXiWIBF9St2QCr93hvEYq3ojXct95iy/pOW3FkSAz9FYxrk9Gub2W1vau9/IqgFYU2HweFUxNWCqCtYZa/zncxGVBxLfydurRAHNU/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Fri, 13 Jun
 2025 02:43:34 +0000
Received: from MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137]) by MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137%7]) with mapi id 15.20.8792.040; Fri, 13 Jun 2025
 02:43:34 +0000
Message-ID: <2b86e89b-6816-45b6-864a-712353c0e5b3@amd.com>
Date: Fri, 13 Jun 2025 10:43:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/9] Documentation: add documentation of AMD isp 4
 driver
To: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250608144916.222835-1-Bin.Du@amd.com>
 <20250608144916.222835-9-Bin.Du@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250608144916.222835-9-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0199.apcprd04.prod.outlook.com
 (2603:1096:4:187::13) To MW5PR12MB5683.namprd12.prod.outlook.com
 (2603:10b6:303:1a0::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5683:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 5205d216-37f8-491c-6fa0-08ddaa24172a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmRoZUFZbjJmRDVsQ0MyVytlUk1UUXErbEhEalZKdHJSMTI1d3JXSVNtaHBu?=
 =?utf-8?B?QVFMWTlrNGdSMUJvUDE5Vm04VUROamtqMmlndE5obERaWXVxcmh0OWphVm1P?=
 =?utf-8?B?eXE4bFlhbWJOYksvL2RCcklOZzc1VlhjbVZSUFluT24xYjczOHNUUEs3TU5t?=
 =?utf-8?B?Z1dVVjNuMWVGUS9WNXg4TStBRGpheHVpSzNlVXFQOVFIbmV2M0tRbUVJT2xj?=
 =?utf-8?B?THdwdnFUbzFmaW96TTBXZUtWNmJNb1FhUWI1U2VMN2VERERRb253MnRKMC9J?=
 =?utf-8?B?d2I4TVBjakFOYUJRRXJIbk1hU0M4T3dTb2xSWW9RTXdubkhzeWhXM1ZkWFBt?=
 =?utf-8?B?UzNZMklxS0d1VVhBZ0Exa2JuSlNjWldTL0wwVGozVDFRSjQzL1FVL3U5d3FR?=
 =?utf-8?B?VlpQaTdNOUxCeFU3aWpHU3dDZXFRa2orak80bk4xVFR6djc1dkN4QkZQVWRq?=
 =?utf-8?B?dWNvWGEwblJ0V1JnS1dpeXZtYS9HR2ZqalBvaDkvdnlpYmRLd3gxQVMrYThW?=
 =?utf-8?B?TDNjNXNLTDNrZjhoMS9qRnMrNXkrNm5MMVpiT3NNV1dBSlYveTBKaEo5dHcv?=
 =?utf-8?B?RFV3dWZQNnpmKy9EYy9MSVBZdVg1WlV0enVUcENZR1NVRmlrWCtmWjlUSG56?=
 =?utf-8?B?VGpzVlRsL1VJbHB0VVV3NXRoNEpyTlNRV0crMm45blNJb3Z0T1pDNDN2cDcy?=
 =?utf-8?B?VFh5OUVUMldSTGhLcFh5eFowVkpKOE1zT2VjR1JUV3h2TXp4Yk5CTGkwYWVX?=
 =?utf-8?B?RnA4MHJ4OVNlUVNsVlFzN1NnNjdnSkZkeEYwSVJSZjdHNFBhMTdzdGE3eDZO?=
 =?utf-8?B?T2pGYjdVY28xMXhuOTZKeW1HRTZvallPZ1pIRUxtUFBURWJ4c1k4bTUyZTZw?=
 =?utf-8?B?cFgrbmdBQlVqa2k0Y2JpQTNkbUV5Z0NRdHY4TnBCMmx6bWx4cHBUYWVrSUdw?=
 =?utf-8?B?bVZqYU5KME9iN2F2bnRIVFJ1TjBpZDBDbVBEZGFGN1hnZE81QW5vVnlWWGdH?=
 =?utf-8?B?R0c5czJGaEloZHRDRnRkaU1lQVp4OUg1WGFkWmNUKzZaYUczbVJLVmhNMlpG?=
 =?utf-8?B?aUNIN3dVdHRlL3QxMnZucmZNbTBqdnl4S2xYd04vSGMzU0g5c0M1aEhZZzVm?=
 =?utf-8?B?OCtvS0phbEMycHUxOCt4VzNkaFJRR3QrcTh5enJoOVFhN1VEV3pmelBsUHI0?=
 =?utf-8?B?b1dXYVN6eDk3bXVxdUlHMnF3WTMzY0ljc1djVnZwZ29YcGZ6Y2VvZFoxMWhz?=
 =?utf-8?B?OHBHZkhCcG5JRm4xYUQxSnlpMzlGQ2RTckR2QThCRzcrQk80b3hDWDg1b3ZN?=
 =?utf-8?B?bmlNZGh1bE5NTnBCSG1sbU10eFptMTZIMVNZZlRueTVRREtVakZ6SXNqRGNL?=
 =?utf-8?B?d2VTTjY4WWhtOG5TL081VXllbElKNkZpN1lUQno3TTNab1VYQ2ppSTdadVpu?=
 =?utf-8?B?VkJKQkt4SEViUHZ4U1pLQTlJR2VZU0RpRFNjS1ZSZWtsMkNSMmJOUDZBOEFP?=
 =?utf-8?B?ZVRDSjY5bjhkSTFwWHI5eE1SVGM3bFF3eTQyR1NHaHhFMXg5WXJHRVBVTzd5?=
 =?utf-8?B?NlN4ZnpsUTVHd3FHMGNqT01QZUo5eXVQYkJEOVo3TVF4dWx1ZEpoL0xqQW43?=
 =?utf-8?B?Nis2eUMvTE9nVjRoUXYzbExieDl1Y1I3ZjI3aTBzTklKSHQ0ZWV0RytjUGE2?=
 =?utf-8?B?SDZZWUlxb2FLcENWaEwxY09wcCszM2JicVJodHRSYjdMQnFjb3hNS2g2NlhQ?=
 =?utf-8?B?amFrbnFyS2JyT2N2bDVMUml1dFZrRE9TZU8reW1NT0ZKS0FsVEdKbVg2aXAx?=
 =?utf-8?B?WjZVbjFFUnRUNW1QUjAxM25UNmZadlRGQ0owOHI2MUdGM0xueEtLRHc4MmpF?=
 =?utf-8?B?TnZTVnJ0MndZMWVhbTRtNzFmZ2ZxUDBjQmNTUmp6SXJ3cE5zclVOb1VoZnhL?=
 =?utf-8?Q?JuxHEQxbmNQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR12MB5683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajNad1pNeklMN05hSWI3QXU1N1ZsWW5PMTh3SG5hZWhOb1dLcWorTmFIMmht?=
 =?utf-8?B?T1NMNnpyRXdZQVBIajZZQThPdDlaNWZUM0svNFVDMHJuNmdnWkd0Tk0xa3o0?=
 =?utf-8?B?VFlINTBWc01EUlNNODZidjBYOXJzRlVSam9seUVqRkNvN3VMSHVMT3lUdkpn?=
 =?utf-8?B?N2RuSVdXRlRKRXpvdlAzRERvaktDUFpxeFd1ZHhlOWpzK2pqSWd2VDJIbzJ1?=
 =?utf-8?B?bXFQRVFRS3pwNFZKMlk5VTRtTmozQ0trSmYvbHIrV2NvclNCOG0yQVNxTnBY?=
 =?utf-8?B?dTF0dndoSGtWM2hIQkVzNkdscm1zWlI2c1ljRGpRYkhkS1ovZXA4bmNkWDdm?=
 =?utf-8?B?SkNSbFVJaXQ3Z1lwVGoyRnhOa1Zsak5vK2xUYjFjaVV6VTU3aXNpd2FNL21E?=
 =?utf-8?B?RDRHb2ZVWC9FbXhDVGZrVTdadkhKNXp1elRTZTl1ZnBFMmpLN2JFYStrWGlV?=
 =?utf-8?B?eGJic0xsSG5oTU5JVDNqSktCdXo2QTNoM21sa3lVcVFLY1htNWhlTFYzR2ZK?=
 =?utf-8?B?QVZYekk2R0F5YytrRFM2dzk4K2thUS9RSTA4SWllcFRYaUZ1dXFoZWdOaTQr?=
 =?utf-8?B?c1pIMWlpOWhPOHFKUTE3cU9TL3hVSFdhcVJqN1FpdDl0UTNaT3Jqbkp2RUJD?=
 =?utf-8?B?YjdTM0o1Yld1MTJ4c3pjZ0haTWRRU093VXpSS0UrRlN2OTFta05Ua2pxSlNw?=
 =?utf-8?B?RGZ6M1pSYnRpb0oyQ2o0QWoxaWFLQ0dXQU9MZDJjWHQvK1ZwYXp2NllPcnZW?=
 =?utf-8?B?RkRNRnpvdnVKL2JYNkw1U1VFanhVUjV1RHhFbkw4aXJ2K2h1NEp0VkpJS0Zk?=
 =?utf-8?B?ZUVaM0dyb0xOWmtEK2t4dUJnRFdXVk9wckFZK05zVmFXT1Y4SURabnE5MzZt?=
 =?utf-8?B?Yit1T3NFVEEydE90azNzNjRZN0FNOE5tcUJxTWoxcDVURWpnMHJ0VzBORnhw?=
 =?utf-8?B?NXUxbWdvYW5LRGVCWUczWkN5VU9ESnQxa3ZGdE93cWxUdEdzblBCTFAyTW5p?=
 =?utf-8?B?SHF0OFhJNUpQbGFpMGhOcEljQ3htbnZJbnlMUU05V0l0RmlFN1h5UkhHN3Zr?=
 =?utf-8?B?b1hYd2FDaFpjRVZrdHpXQVFONllaVGh2TVZudGRwTTFFRUxmZ1JDQ0pjaExG?=
 =?utf-8?B?V3JHUkMxRmtmWHVieWllSmIyN05Qa21BdEYybTVrSi9NakVEVU5RVmV3cDVR?=
 =?utf-8?B?Nk1tb0Z5N0JQOVBRaXAycVFmS1pPMjl1cXFWWWJ2VlhSZE1wNUNNaFEvVGls?=
 =?utf-8?B?Tm1IZGNPVEloMm9maVE3YlhteU5rLzl2anFhT1llY1dWemw4djF2bVNwY013?=
 =?utf-8?B?NjE4S1V0dVZobFk0czQyTEorTVJSakhDdTBQZG9XUk1ZNWhTdG5WKytkN2R4?=
 =?utf-8?B?bmRjUktGVmtTL3FVU3dEZndUZjh3TzEvYUpiTjNaTTZMcDdtMkJlYTVRL2Mr?=
 =?utf-8?B?RGpJbVBPZGs0N3VRQTZVOVJ1Wk9jWVNPOHQyZ0tFa013cm5OR1Z3TFZhOGNl?=
 =?utf-8?B?b2NXKy9EZ2NSZzFEZ3ZiTi9US2VhNEtPcnA2dDlJK3pHL0EzM0RreFk0Sm5F?=
 =?utf-8?B?WmpCUDBxVXNxWktsVzdHYXJOYVNHd0djbkdxaytyRHpmYWMrRjByRzNNSWFH?=
 =?utf-8?B?SGl5QnMrOG05SjVzdmhkT0lYSXVSY2FRcVd2ME1uM3o4VFpBWHJ5L0dIOVYv?=
 =?utf-8?B?TGprTlR5NFk3eW5MQ1lGUi8yaHNPbkVZMGVtUEJId1JIc1hhUFBpSXhEL3Mz?=
 =?utf-8?B?UTMwZlFSWHU4Y2xJckowU3hJQ2xRRGJOV0VacnVEY0hvckhPdmc5OHlNTnli?=
 =?utf-8?B?NVlBV3hmWXlZdXN2ZGlHckVkYjVVVG0vZm03bktJL1BzSXR3Uk9Zem1rWlV5?=
 =?utf-8?B?REFWa1ZRRmJmbFI0ZmgvSG5DeUx5Ym9BeSs0eWZISTdwUzZlQysrRGptNmRQ?=
 =?utf-8?B?VjRVNVBGMkw2WWo0NDVQZHN1T0s0NHhkTjJ4MHUvbG01ODhJRkErM25hcFoy?=
 =?utf-8?B?QlY5dytqakY5YUJmZTRBcitOekxuWG54RlFDM0JYdjhpcXQzbTZBcHBydUlQ?=
 =?utf-8?B?Nk03WDRTclJnVjNSVHd5YXA1ZEtaQ3pkZjlaUHBGMVRVOWpaTnU5TElQKzJ0?=
 =?utf-8?Q?C1p0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5205d216-37f8-491c-6fa0-08ddaa24172a
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 02:43:34.3823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FALtubVODmA9teYl6Lwsy3PhTkFnHQxxgHdpY/712x1KJ/qOW27ySvLP2M8z95qy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796

Change-Id should be removed and will be fixed in V2

On 6/8/2025 10:49 PM, Bin Du wrote:
> Add documentation for AMD isp 4 and describe the main components
> 
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Change-Id: I61dfb3a39e5ae372ed48f156a81ae81ee17734b2
> ---
>   Documentation/admin-guide/media/amdisp4-1.rst | 60 +++++++++++++++++++
>   Documentation/admin-guide/media/amdisp4.dot   |  8 +++
>   2 files changed, 68 insertions(+)
>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
> 
> diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
> new file mode 100644
> index 000000000000..c933e7ae171d
> --- /dev/null
> +++ b/Documentation/admin-guide/media/amdisp4-1.rst
> @@ -0,0 +1,60 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: <isonum.txt>
> +
> +=========================================
> +AMD Image Signal Processor (amdisp4)
> +=========================================
> +
> +Introduction
> +============
> +
> +This file documents the driver for the AMD ISP4 that is part of
> +AMD Ryzen AI Max 385 SoC.
> +
> +The driver is located under drivers/media/platform/amd/isp4 and uses
> +the Media-Controller API.
> +
> +Topology
> +========
> +.. _amdisp4_topology_graph:
> +
> +.. kernel-figure:: amdisp4.dot
> +     :alt:   Diagram of the media pipeline topology
> +     :align: center
> +
> +
> +
> +The driver has 1 sub-device:
> +
> +- isp: used to resize and process bayer raw frames in to yuv.
> +
> +The driver has 1 video device:
> +
> +- <capture video device: capture device for retrieving images.
> +
> +
> +  - ISP4 Image Signal Processing Subdevice Node
> +---------------------------------------------------
> +The isp4 is represented as a single V4L2 subdev, the sub-device does not
> +provide interface to the user space. The sub-device is connected to one video node
> +(isp4_capture) with immutable active link. The isp entity is connected
> +to sensor pad 0 and receives the frames using CSI-2 protocol. The sub-device is
> +also responsible to configure CSI2-2 receiver.
> +The sub-device processes bayer raw data from the connected sensor and output
> +them to different YUV formats. The isp also has scaling capabilities.
> +
> +  - isp4_capture - Frames Capture Video Node
> +-------------------------------------------------------------
> +Isp4_capture is a capture device to capture frames to memory.
> +This entity is the DMA engine that write the frames to memory.
> +The entity is connected to isp4 sub-device.
> +
> +Capturing Video Frames Example
> +==============================
> +.. code-block:: bash
> +
> +         # set the links
> +
> +         # start streaming:
> +         v4l2-ctl "-d" "/dev/video0" "--set-fmt-video=width=1920,height=1080,pixelformat=NV12" "--stream-mmap" "--stream-count=10"
> diff --git a/Documentation/admin-guide/media/amdisp4.dot b/Documentation/admin-guide/media/amdisp4.dot
> new file mode 100644
> index 000000000000..a4c2f0cceb30
> --- /dev/null
> +++ b/Documentation/admin-guide/media/amdisp4.dot
> @@ -0,0 +1,8 @@
> +digraph board {
> +	rankdir=TB
> +	n00000001 [label="{{<port0> 0} | amd isp4\n | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n00000001:port1 -> n00000004 [style=bold]
> +	n00000004 [label="Preview\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> +	n0000000a [label="{{} | ov05c10 22-0010\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +	n0000000a:port0 -> n00000001:port0 [style=bold]
> +}


