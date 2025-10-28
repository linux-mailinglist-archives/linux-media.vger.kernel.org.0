Return-Path: <linux-media+bounces-45767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 200C4C13BC2
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 369E41888540
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B152F2617;
	Tue, 28 Oct 2025 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iqMlVlq5"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245FD2F1FE4;
	Tue, 28 Oct 2025 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642652; cv=fail; b=ePJ1FRmzh7AkYj01H1sGAm95qNS0rc1ryfzrMpH3VvhlSmdCVMEh1Fikxd1cGk8zzEC07/Aewsb1T456N0rsdfVQejQcl8bflm8UbL4OjObs4Vsg+Hx525WpvE1ppUsS/Mpr1hPIclBWTYpbp8suRc/RxxHkb2i+gCezSmaTfH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642652; c=relaxed/simple;
	bh=td+yAGW/UiIbByASUQlzlBiQidMWxnVaT9LViRXU8nY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fWn193Hv2Ozs6V9k1Oqm060DIUWRaOlsRf4vcu7ILyTswu8kWWY3D1h7HfmOhnDJpYfub/kCEGFZyyIojw8TVpjlfmEi61jW7DrU1ffD6r7Ca5Mt/I8fxzaCpGx/5nZgcmuKAT8oHGfFGGAt0iLOSKkhufULs+3FHyYZgWySojU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iqMlVlq5; arc=fail smtp.client-ip=52.101.56.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QREjaqS11nEaS9JkwA+K31XTwHHGBWmk3YXdZs8iQ6hqddNpgDMOOn75hXoAQGdIXQoMfxF/0Jgk8mtu97Hv2Cpn6xBEUAyLswn8Q5rxflRwsnjfqaw/o7/5i4DywlP0w+x3i5x+pavwC/0xLA72T+fqF2aVYWj7kapxINFuqQPSQ/uIYGX6Gyc/UyQj3m8OVNsRoqAvKdN+bt608i+eIQ1rD6s/ilgIiLY0ib2sP+APaW1nJO6r+5EiyfGa85TLRikU9Z4HlT4yerORkzDSyPzYPDolmHTnIcPZ5yZ2sSV06mraHOvCBB32n4Pz1pQZtA6fCNVFvEfY0AQTXahPlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgmTAZ21JNrapwbhKnMza37FujZ/TmqBt51Gvtbz3nE=;
 b=KokSO/BIgL7MA/lKU5JQYKuMw11l/oKla2FSd/QvgCQ7l/en6DXWb4nGJpCakZzetLXFzad13sHSC/KXQEacu8rTAZNd842hOBKQ5WqlGYt+ca0/knMEy64ydta6+hwrQykGf3dN3gOPdFRmTbNbGUBAEJOVzgBPYjGtmBr2NuLByD7H4p70jWnyxECRYIrCMasmuaz+cMo7JNXJQCqDsuvD9ZzZH+j6FsKVkdyp/AGFtPDD0UBZD/6D62TV2l1IFGHseaF++98gDkhjr9x81sUy0J5lOwYfFQblpGnl37Lyf4ThHvCaqNRHYS50tE8i/qiTODt6pP/vatwZtH3Cwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgmTAZ21JNrapwbhKnMza37FujZ/TmqBt51Gvtbz3nE=;
 b=iqMlVlq5AFBjn7Qpv+O2jLttmtRfGmbAdaiCdynO7WUTlNJIWDTeTUvh/PWYGqBJT18k3p5rcyDcpC6HcsNJIf232m6As7zj92HXNJJX3M3OFeofXADp9Ewpq5Y5IxjAo2hXkYiDuD0Qmkgk8mpFTskeiu1NRshAi8Ndfw6t794=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by SA1PR12MB8644.namprd12.prod.outlook.com (2603:10b6:806:384::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 09:10:47 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 09:10:47 +0000
Message-ID: <5dfecd81-4b60-4205-9422-43aceefd2316@amd.com>
Date: Tue, 28 Oct 2025 17:10:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
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
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <6668e1f8-c279-4616-aaa2-02669895e623@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU2P306CA0055.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3d::9) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|SA1PR12MB8644:EE_
X-MS-Office365-Filtering-Correlation-Id: 09fcaf9d-29a9-4ff3-ae77-08de1601e188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTdGY0crM1cwdlBBdTdObnZoNFpPMmFPaS9BVWRIV2V5NEQ0NW5aeVFMR2RW?=
 =?utf-8?B?cGkyaG9qbVNzUTBLbmovYVQxak52T2RSTHBjRzIxNGlraG5uNmFMNmJmays0?=
 =?utf-8?B?KzM0cTBMdjF1ZTlDaUlKcTAyNFoybTFuejZoTUN3bzJFSGlDcGVlS1dzcDQ3?=
 =?utf-8?B?blhMa3l5R1JaYnB0Nnd5eVFyR2RFdjVOVEpTR1NZRk4za2dOMHptbHV1Ylpx?=
 =?utf-8?B?QzQvN0pOUmJSVVptSFk4dXJjUDA3Nk4wYlM2eHpYUHNKdFhXT3RBYzM2T0hV?=
 =?utf-8?B?NnRXanF4L3N4ejRlUXNDQ1MxWDZEcHEwWWFXSHhtUUpmYWR1S3FOenIxQi9r?=
 =?utf-8?B?V3dkZms4SmZPeWxZOWpkSzdxVU9JRElOcGl5cjZ3QTRZR0FsMlgzQ0g2bVo3?=
 =?utf-8?B?NERGaVhyRDBVdzlWSm9DakN2V1lRQmptalVLRFU3RVRKTUo1eDZJYnFyTy9k?=
 =?utf-8?B?aGpNdVI3akwwOFRBblNiekkzQmNyOXZoU3hpTm1GTXhZc1UvSlM2OTFRSzNK?=
 =?utf-8?B?emFVeGdLcEwySmQ4a1ZDTmEzT1FNbis1NS9NVGJBVkFvMUV2S1B0MDlTbXhs?=
 =?utf-8?B?WjhHUGQ0NjRML251MnFPMzZhWUFvb2J1WUpZL0hWL2dmRVJ2VlVOVnVWM1U2?=
 =?utf-8?B?VE4xT3ljVW91VjlTUHdCM0pTdkx3cTJPZG5SNFNpVFh6cFIwUGQrKzRkN3Vi?=
 =?utf-8?B?Z2h2WC9MV0tqQURMTmFSa25oQ3BuUUMxNEs3c1gzZmU3MXVTTHZGYmpiQ2Vx?=
 =?utf-8?B?eTEwZEZKcGtUajBKelVpSGc0YnNWODdwL0RIU05EY2N0YjgyR3NycW5aT1Bz?=
 =?utf-8?B?cXVFbDQwTDdFdHNTVGVyRzVNSVdROFdGa1hXcXprK0hBVXVsSTV3YldYcGpu?=
 =?utf-8?B?anRGblQyZ1o3bzBtOVVBUzVnMG1uUVU2Umh1UzJJOEZYb29oYTJ6eHRnMHhH?=
 =?utf-8?B?eERCd21jcDlvN3dJdndmOFlnZ1RuWkdhRE9kKzVtN2ViTHhzWlRFL1hxMmlm?=
 =?utf-8?B?UnVnK29FbEg3TVEvSG5MQVU0dFZFN1BhdWdrc2RwcFgyL0Z5ek14Y0E5TFYr?=
 =?utf-8?B?dmRPVUVETjhib2dyQkZBMG1JVHEwT0xrTnV0NTR4aU1OSVVMTmxSSmtNYmo2?=
 =?utf-8?B?eStJT2Naelh1dGJDV2hMU1pMMFBZK0FoNFhGa0FlaDZ5YUlKQ0JGbmtFV1BX?=
 =?utf-8?B?VEE3MDRtVDM2YitqMit5UlhuZm81d1FKWTJERUlYQ04renNnWnppbVJMRGZQ?=
 =?utf-8?B?TXZRODN0c28rdlhOUjVqdVM5NjRMdEdyalpCWi9vdWZUdmtaVUUrMEd6U1l2?=
 =?utf-8?B?U3NZZjhySEEwemdrcDhsT3Jndkc2V2k1dE5lOFFoUktwVVVpOGJ4U21mMjVl?=
 =?utf-8?B?WmpLQmprOVRSSXRtL0hWYXNCMkttdkVCL3VOcmJzenNRdFFzTUpCNWo4WEVV?=
 =?utf-8?B?YkF4bG8zSzZSamtzZ0lacEdEYWQ4THJwTmUwZ2FIYkdCMDA0blVBbzB1SnJO?=
 =?utf-8?B?OWpvWHpMdjVlTmNzaGg0LzY4bno1M21SdEVsQ0o2eDRuMWo2SFNGUkc2ODYr?=
 =?utf-8?B?WWhWWlpGcWJtMlF6emhuaS9RbnJiQTVyOHZSVVlLaVN6UVFmeWd2TG1EczFp?=
 =?utf-8?B?UTBaR1pmejF4eUZId1dLckVOL3VOWC9DZFV6OWxWdjFPQUN0U09zZ0VkcUYr?=
 =?utf-8?B?RlVzNUJtMEsxOEtvaURTS1VVbnJMVFIyUlVCZkltQlFMR0NJUXArdmFmM3cw?=
 =?utf-8?B?K2pTUzdHbXEwTXRwTDRMVkEwWFZKMEg4T1BxNnZKY2JZNUxZajJMV2YvT3dJ?=
 =?utf-8?B?Q1JPaXlpWFB1N2dLNWdCYXFVZGRhQXU0Rk9lbmlLWnRNeFVMbFUwWXR2OVEv?=
 =?utf-8?B?NUFidXRKeWU3b0RnVlByeXloeFROMHVuNnF5UzV1dmFOcWZGVk8rczQ4anVu?=
 =?utf-8?B?eEVpS0lDUzh3S0FOTjlVSXZMQmhKTzg1TXJoelRIb1Z1SFI2QjZQVWxiYXRV?=
 =?utf-8?Q?R1upvufhAs8nOaf2cwabz85rKPPPIA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTRBbHNZZUNHZ1pXNHJIOE9NeS8vai9ndUxxaC9UVkV6eXdqcWFGMGlxdkRC?=
 =?utf-8?B?MjJIaDVRLzQxQnZycDJ5N2dEdmI1RC93cHVHZnNmMTRnK0JZVEtNbTRXMVBQ?=
 =?utf-8?B?VWZzTFhtSmZTTWJ5ekNsNjFMRDFUTUJYaE44WGVOQWVYNFNOYjRyemxGWS8r?=
 =?utf-8?B?cFIyTDB6cFNDR2VGOTd3a2RodE1zc2dIUVQ2SHoxWE1rdERwV29sbGVvbDdk?=
 =?utf-8?B?cVg3V0VtQU5yYkExcHY5VVdXKys3d3pJakt1MkVoUFNqWGhtLzJsUHRSeFBm?=
 =?utf-8?B?V1RLR2RQY3pUMEtlNW0vaUMyK1hNS045REZEK1piSlVVcmF4aHJTZkN4WmxL?=
 =?utf-8?B?ZytmNlQ4TDNnOGhzdE5NSVpSOEZEbjAyTGw0MXFONDYrejdORjRkTXZZRm1a?=
 =?utf-8?B?dUMwbXdNNUVQWlVMc3orYnA5dStlL2NaNnRBcGh1NUVZYkpJNERESkVuL0Ex?=
 =?utf-8?B?M0NPaFBEeURBNm1kWDQ2eFRTeHU4RWlXQ0I0QnR3YXRPVVlPbW5SZkN3MEFX?=
 =?utf-8?B?ajl3dW42bjlHeDFNVTh0VTZicm9vMWxrUkZGbUdYYzZIdm5aRVJMaHpFclFn?=
 =?utf-8?B?ejRSRmtCUUVSWVFWTVNETHFCYUZsTS8wL1RVVHF4ZmVxbktxWEd2ZGlOTnZw?=
 =?utf-8?B?ZnNtWEg5TzFiQno2anovdlZwVGN4UnpqaTY0aFpWM3RBby9ZSDdyV0hYL0J6?=
 =?utf-8?B?QTFScERXODllcmJibnNIcjRIWk05Ui9PM241b2VsS2daSHdiV3h1eGlQMzlS?=
 =?utf-8?B?Qko3R1VLSmROdmVBRTAxQy9SdVFuSDVSbEJXSCtHRkZUaXdGNGZlZCtpeTd6?=
 =?utf-8?B?b3g4ZkVINVZjV0cyczdTR2h5L3FCK0M1cVZOMXRCdi9OLzRRVGJJOGlvY3Bl?=
 =?utf-8?B?amRzVWNDblloUUFqTFJSRWw2a2JYbmxSZllRa1JpNmdYL2hlelZYdTVjOVZ4?=
 =?utf-8?B?d1plenl6TzVFYVhGODdrczhNcTdRVnVReHpQTFNkOUt4M2RycHdNQmRVWlFB?=
 =?utf-8?B?bStXOUZ1eHVZdGtmSmVNYkVtT29qd1MxNHZwSHNtSDBDc3FJcm92N0ZPMGJk?=
 =?utf-8?B?T2o4S1d0aFNIN3JGK1h2R1QxUS9VZGZQQjRnOVR0eE5yTjFabFZteWVOYy91?=
 =?utf-8?B?RUNHRjY1bjZ5LzNQaElqVWI2WC9Ub1ZvMThsT0JKL29YM0dDUDBUTmFLU2hN?=
 =?utf-8?B?d0VxQlFkVzlLZ096RDdiZ0laY25YYzczSEt1WEhWMWF5dXRzRi9ub1N4L3kx?=
 =?utf-8?B?TWUwd3RncC8wOFIrN0hyWTJmOVZpdXBPcFBlTzV5Qmc3TXJWU2pDYlN0YTky?=
 =?utf-8?B?d25tVm5lc3M4T3BwcEN1ZkhWUU5nNTBjdXd6alBqOWdMVU5wYkhwQVROWXVM?=
 =?utf-8?B?QVJ0T2xxdWhpcnhEL05rKzB4SnZnZ2N0K3VXbUxZdW1UdUpsTDd5eEpKajVG?=
 =?utf-8?B?akppQVFPRlNNMi9zalB3SWdMbWxNZFpxQzUrVko3TmsydlNEWDZUTUh6YnlV?=
 =?utf-8?B?OW5rQmZoS2U3RjZZemo1a1MwY21WeTlheG1vOWN0M0ZObXBRL2huVUkwK3hm?=
 =?utf-8?B?ajNRb21PMWZxQnBlTzA3Z3RhOHJLMmdqSXlVNUwwWDB6eDFsdDIwQWtJOUtX?=
 =?utf-8?B?bkdISTJNU3ljdngwRXRndXNWdGdndHFvWWtqZ2pVR2ZoQUZrL2UzdXJ3YmJG?=
 =?utf-8?B?TzJ2alpOYlBvYWtmS2kwbTRNam1yWThaWjRiTXRGeXZObWpQVStzRy9sR2hz?=
 =?utf-8?B?ZmJuVzNaYjBMQ1h2MXg5T3ozaldmcVl4L01EdFZ3dnBiOXMvcXN0SkRtYytQ?=
 =?utf-8?B?RVJZblBXTG15VXBXL3pnNnprZzJCcC82UVFZSVhhN1pRZDlOS1VkdWg5MXdX?=
 =?utf-8?B?c3lQT2o4akEwZGJldGZjY0FSekpmYS9hVWJxNCtmMGNacFhYNnNHeUdYUUkx?=
 =?utf-8?B?L2tXakpIMjQ1blowRkFIa0hoRFBLS2FaOUNUd3R2ZExSZWcxU3hPa3hxbjQz?=
 =?utf-8?B?YmtXaU54VlFSamwvMjgxVmNmSWZYdFp5Y1o1ekI3cUEvaEo4MW83b2FuQnBQ?=
 =?utf-8?B?cElZeDA0ODh1dzRvS0lJd3dPMVdRWXVUdm9QYVkxdlQrdXBEemRZZEU3RVlJ?=
 =?utf-8?Q?0UVU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09fcaf9d-29a9-4ff3-ae77-08de1601e188
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:10:47.1102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcOQzQo5srM+sWG3gbnz0AAIS7ffn/FH7TIKLm09Glp3RHvYkRdFXHZYeefmRjSo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8644



On 10/28/2025 5:06 PM, Krzysztof Kozlowski wrote:
> On 28/10/2025 10:00, Du, Bin wrote:
>> Thanks Krzysztof.
>>
>> On 10/28/2025 4:41 PM, Krzysztof Kozlowski wrote:
>>> On 28/10/2025 09:30, Du, Bin wrote:
>>>>>> +	}
>>>>>> +};
>>>>>> +
>>>>>> +module_platform_driver(isp4_capture_drv);
>>>>>> +
>>>>>> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
>>>>>
>>>>> You should not need MODULE_ALIAS() in normal cases. If you need it,
>>>>> usually it means your device ID table is wrong (e.g. misses either
>>>>> entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
>>>>> for incomplete ID table.
>>>>>
>>>>
>>>> Thanks for the clarification, yes, MODULE_ALIAS() does not apply in our
>>>> case and should be removed.
>>>
>>>
>>> You don't have ID table, so probably this should be fixed, unless it is
>>> instantiated by some other driver, e.g. as MFD. That's the only typical
>>> use case for alias in the drivers.
>>>
>>
>> Yes, our device is a MFD, so alias works for it, as alternative, we can
>> add module device table, it should work either, could you please
>> indicate your preferred option?
>>
> 
> 
> So it is spawned by drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c or
> drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c ?
> 

yes, it's spawned by drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c

> If so, then your code is fine, that's correct use of MODULE_ALIAS.
> 

Thanks for the quick confirmation, so, we'll keep it.

> Best regards,
> Krzysztof

-- 
Regards,
Bin


