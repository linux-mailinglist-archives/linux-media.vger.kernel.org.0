Return-Path: <linux-media+bounces-38445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 403B3B11AC1
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23540189BFB5
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 09:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC302D0C7D;
	Fri, 25 Jul 2025 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gl14akNn"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74576285053;
	Fri, 25 Jul 2025 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753435374; cv=fail; b=a78+pWSt9aZ0G0Rbhx2odm9/kng66TQrI6tJzjTmHx/soeVwiWtkCm/Xky6rYWmFl7l3I0ihNTo/d20OZN1Kz8q9e3P+BZ7OLqSl9dBVl0jCElVw+I7Ka96yk+pCF0wsffiuLuI9I97WE+JkoHbD++irBUJzIl4UCgHiBWifoWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753435374; c=relaxed/simple;
	bh=wBO6SMaAbKK3d9Dy8VfZVeXK3u/mkg/XGo4Qveo82lQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mc3CzOW7NVL0j64YalQLkOf8Wr3ziSzqEScq0TkS8oVIDCiI1c5JMYhmNo56YYKyKCFiBj2CQxTAV8bMqeoBC2aYOMztwNJs0vLJHnZ4vscw1Wkvukz+hwkPyanJiZ/+kTxzkQRXpc/OVxnRT+LkS+kQxjQzBYYso6vFrCRt1To=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gl14akNn; arc=fail smtp.client-ip=40.107.94.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlAQlM1gS5Sg1wna+V9Or7IW/MC5/+ETSZ8ytSgpYrLI6a48NpwEJMtYFvQuZwWb0gbcxUpL9xUwWzMMfWd2IxNoMnFWAwarKS5ShUPCQc1IlqAmk3ox88qBgpqF1Ah+3KweXp1kYAQn5KyoG3IHL12fVD/mhQUcnBE/m6jWfPnwgRaiaGzQ3+/hhOTGSGVkLS7XAbbyAD5JOB333MW2UkFW4scswcRUczPludLDK7WjtZgCIVX5Ka9bSgzBeHeX2C7CCzVngivkWFt+exONfheREMM2vu7U4z29de0GTNkZBlV4+jgPU9eyQitKZYTSw61vsc8q63M3K5q9lw5j8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MYJWocqT3hwPeiSE1v9bXr6xAEtSw14WxrPNcYKa0k=;
 b=LfE15wNh7ZfAW6sEb8MkCdEbWnOp5fNsVfir7hcMdkLX1wonp3+pT3uvX7cyl6gSqZfGljCp7NJQRoQOsRgBFEFP3J1sVDf9nOUOqLgxI2d2es2oumSGfCVpfKISWnQ8SJevKlcVcKZy9ZAIiBupRqxCgQpogeZom9czXEBxCWVe38FFJlUItAQRdBduY1OgQH+9NU+/ynFn75WBF/mBkGsChjBRPFIAy9HtT8lSpPhjeHGHH/bqFB6e+UKoV8cghpnPRaSnLupPFAHRSpE2gdbe4j2ztQc5WtUI8KqauoN/7r42GcaV2+q1UGDL0d79eRLkqtF2xsjN20ydPwTkIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MYJWocqT3hwPeiSE1v9bXr6xAEtSw14WxrPNcYKa0k=;
 b=gl14akNn2j0GxLzcytNgKQgT51ZUzd3fbmz5Jwmk2jQvanGh3O8TRC5/oxfb/E1i8vqzCA7W20EBHG7ME4GX5KE98920kp2ey3ypIAfYZAZgCFbqBFiV+W3+vgJL/j62LY5ZAc6AXIKWz5ys8q4bMV3ZtkETAVsiAUkYFuegpmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by IA0PR12MB8907.namprd12.prod.outlook.com (2603:10b6:208:492::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 09:22:49 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 09:22:49 +0000
Message-ID: <ff2f17c6-c5e4-4b7b-b897-8abb4cb79c35@amd.com>
Date: Fri, 25 Jul 2025 17:22:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: platform: amd: isp4 video node and buffers
 handling added
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-7-Bin.Du@amd.com> <aIEiJL83pOYO8lUJ@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIEiJL83pOYO8lUJ@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|IA0PR12MB8907:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d68cba3-d30a-46f5-3d45-08ddcb5cd2cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bThHa0xBdUd5U0RCY3NEbXMrNnhIdkFjaHVHSGx2S3hMSDErN1ZZdW1BYytk?=
 =?utf-8?B?NUZtYzcxSm52ekwwWXdZMnR5QWpVeGphVnZzZmdFMG9ETjVDSjZrbzk1eU12?=
 =?utf-8?B?Q1RnTktBbVRZRE9ncDlua1g2aVh0S0VSRlVQMzZKamxCOVF2MjE2ak41MzNa?=
 =?utf-8?B?Y3M4TEk4UXQ4cEV5TWNGVmdleUJLalhGQTFsRTF1QmVZMHhJT1ZFb1BtMStG?=
 =?utf-8?B?OWFqZVVzdm1XcW5naFd4blBaTyszOGx6eTduRDRjUGJXT1J3UTBYRlM3T3Jq?=
 =?utf-8?B?N2hhTWZSaFM0TktKWTg5ZHVsMzc2M1l5ek45Nit2c0YrMXdKZXBwMXpVRUFB?=
 =?utf-8?B?NmdaUTlFU3VsUUlWdDhCQVJiQW5yVWRHbko3YjE3SzFLY2pkWS9QMzViSkdG?=
 =?utf-8?B?ZFJtRkdPbFpWZHhzV01hVE9sRHZvalhFUUh1aElSTzVQdHIwRG44YVNDOTVJ?=
 =?utf-8?B?NktoNDhXSEdnR21uamNGU0V6K1Ftby8wK1pwczhWZXc5QjNpbFVBNkY5Z3Bt?=
 =?utf-8?B?b0JKKzJsOFA3QzZrQXVxeXRiTHVpalhRa0xsL3liYWplQzNKa2srZlpHMitL?=
 =?utf-8?B?cytHVXJGdUNFVEdzbjJwSksrZ2V6cVRiUUZKdk5vUXh4QTI2TktaVWV1NDhR?=
 =?utf-8?B?c3ZxQldFVnd0ZGVRWTB0QjNWV2NuaGJ6TGgvTmRlSnhoaTdxTDM5QXl0Ni9m?=
 =?utf-8?B?aTZtLy9xdkRQdllKMVpkVng4ampTV1FIZkxqSy9EeDc2ZERkN3JQVGlFYnRw?=
 =?utf-8?B?eFE1anZLRXJLUHFwanRySk9GYmtldHZnOE9SQS9SVTJmRGNxZy9kNUFIeTBG?=
 =?utf-8?B?K2c2NzlkWFlOSUZzSm94Z00xTSsvSW1sT01yak9YbThFNlh5TlRibUNEdllx?=
 =?utf-8?B?amxabGJXRXRreXNia3J2c0dKRzhlaG10SVVOSTVTOTdUTjArYlNxeGVCckdM?=
 =?utf-8?B?OWlPb2pzc2Rtb2ptZmVqU0tma3pNYWtPV05Pd05VTVF1SjZKckNpcTRNWG1y?=
 =?utf-8?B?byswUHk4bThzT210dERSZU10eGVaOVAreFJiODFzTHk0YVZ2U1B2cmFIZWdJ?=
 =?utf-8?B?RW1pMDVDWCszSExZYnNva1hJZndXVkdaVWs0SCtNeGRCNHZuNjZGRHNYcGtW?=
 =?utf-8?B?cDVwUWl6cDN4TXhWN3dLaVFsbkRtS3AzT01XLzNTZjlxZXVNRU81Yi9PbXdF?=
 =?utf-8?B?R1drUUtyemdka3VKbTBGWjBqa1JVcGxxS1hFZ2xwVVhEWU1GNjJ0Vmk5dFN4?=
 =?utf-8?B?M2k5UllyZmZXbDRJbFZDKzFrVlY3Vk93S2NQV3djWWJXUi82czBlcGhUUEk1?=
 =?utf-8?B?KzRKZm9sai9IWXdEOVNTVFNoTHFYRzhLcXhQRU9zT1BUL2hONHRoTGhVdVFQ?=
 =?utf-8?B?aHQwOEpYUFVUVnduTmpDVmZSejZ5TmlBbmFKb213WVNqbXVlT1VXS3JXMkNy?=
 =?utf-8?B?T25hai96cG1za1doa1NUVWZXNGlnQVJoREhWbWhTOXFhTU5adDhhbDVsMk04?=
 =?utf-8?B?TktnTjkreUd4SDVta3pYNmZjNE9PeHk3NUx2d3hnRUlJQ0dLRCtZYzlUY1lR?=
 =?utf-8?B?R0NGSXJ3L2ViM0loSUtQZmROUXVoQkFzTm41clNNS25uTDVLeGxxUnFlSkdS?=
 =?utf-8?B?cjVtTEZPa0gybm4wQWpXSG9kUTZwWnlVZUw5Zmo0TTJSOGQ1eTZpeEZORlVa?=
 =?utf-8?B?MzNOekJZU3NjcU1BZEpzTlNzV1hZdzcrWXE3ZFc5WW9TU3pjcFRkcEdROEFX?=
 =?utf-8?B?Rm1SSEhaTi9LRTZoUmRVWlhwUXRZb1FSb0dYckZTUXJtL29FTUh6cW5BM2dJ?=
 =?utf-8?B?QTNRSjRLcnZwamxHYm8zSWRiVTM2T0tiSmtSYUFlR1EwcHZucWFEL2ZVYXVS?=
 =?utf-8?B?YUlDOENKdGovUThuU2V6MWZLUm50QWZyTjVKeC9aODBoRDJEeHE0ejM3dTd3?=
 =?utf-8?Q?GfQWxc85Dwg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHhaNnBubG1tUlFGMFlxRjYyKzF2WWRiK2FVMUZ6VlZoNEt6QVV5U0Z4MERp?=
 =?utf-8?B?bmV4ZkRpTG15SUxDZEQ2dEUxbnd0U2ROMG92UEhQRnkwSitER2ZYbnM5L1E1?=
 =?utf-8?B?cC8yL0NxTTdQaWFzeW5vMzJ6cW80SmU3a0M1VjllQkRNaDAvNHdqSHFlQUFI?=
 =?utf-8?B?RnpxZlhGYlJIYkxkam9pUUVhc3NWcEMrOHJoNUJpUUxVeGpwcFRMQUZ0NElE?=
 =?utf-8?B?cVRWYXh2dmZYdU1qRmx0QUdlNWNqUkZmdlE5blh3RWUwYWw2SlgyY2Z3YlhS?=
 =?utf-8?B?UjNlZXB5c3hqUkh0UDBaY0w2dDRZREsvdTk3WDh6QlZzMUM1d25iSE5rc2k5?=
 =?utf-8?B?bHB2UXowb3E4bTFXdW43VytzdmFRbVhwbEVsb2ZwUzlCN21jWGx5VHdqd1oz?=
 =?utf-8?B?OWtJd252VDBpditrMmZOSFloNHlaT1NZN2ZYdDNGZzFkVy8vcUU1QTNoL21l?=
 =?utf-8?B?eXpzbnZmSGVNNEUzSThxaDg4YmNNVDV1LzczQUN6L1ZMT1RHRDlRUmZ6Q1dL?=
 =?utf-8?B?V2FvNE4zTFNkbllwdE93dHZmUlpTMTNDRXRxTWtKVVprWmkrdTZqV0tGYkxi?=
 =?utf-8?B?WTJsd3NGMndOVm5aSWdIRHdoQ25XRlBRS3ZnMnY0OHhjb1BvVW1DekYrMktz?=
 =?utf-8?B?cGZkZnYwcE5QRmpGNmo5M3VlRStPdm1oZk5MdGZpRHBQZjFPWFYyMURvWG4z?=
 =?utf-8?B?N3QxUElmSkkreG84QUcvQXA0VW5SVWlRWHJkMEQ2aDczZG5KV0xOaE1LZG96?=
 =?utf-8?B?L0JMeXlaNDRLcWl2YW5ta09rNHZpeU1xMkJIOEVISUdXRnBUMk8vaTFpK0xJ?=
 =?utf-8?B?Q2t4dStYbDN4OG5IRFdwSWNwaG9uNGF3SDIxVGpBQkh4eFRlTm00UzlQaUl1?=
 =?utf-8?B?RTVhQ2w5ZnhpSUFZTlZRSHVYSDF2Y0JwdjZFOVdXQytkL1dpQTYrOUJNanlH?=
 =?utf-8?B?M2dnMHVZSWJJL1QwWFVnaEVlTVlCSVRKdzhXdFg5NDZXL3FqYk5sUC83aENR?=
 =?utf-8?B?RE84STlZeVlobW0rQndsVzJiSlFhSUl0MWdTZFk3Z2w0a09zY3R1VjgybGFR?=
 =?utf-8?B?VHFyaFUyYXY4SGwwT3VOUTBJZFR5dFpXclpKeTdHYlpwLy83dGZyeDYwdHRO?=
 =?utf-8?B?ampSM3BBOGRoU2tLN0haY21RVGVlQnNoVDJGbXVVTno0ZFJhRkY3R2hkSkNY?=
 =?utf-8?B?S29TeFNmS29PMGJSS01vTzZZamF4U1ZvR2I1b1R0eDF0eFhSL2RVTFpseFk1?=
 =?utf-8?B?YnFtZ202aG5LdlQ5TVVtQWo1MTBHMUVzZjZPckdCZi9kVWs0RzlDU2lPZ051?=
 =?utf-8?B?cU5HQjRSOTc0T2hTQjk5eWNqUk93RVRqN0p2aURKbTl4bXlJaGl2cE1kalZF?=
 =?utf-8?B?S0hzWnlFY2UxV3JvL01TV3dRZDhyTGZ4YU9mL25udEx2L3hKL2ViNGRnOGRk?=
 =?utf-8?B?OHhCV25lNC9Xc3NQcGY1cnpqUEVNWmt6REhCTkdGUmIwZGZhZjhpMmxzN082?=
 =?utf-8?B?cENrNUFRVTI3dXQ5ZWNNZ201VDZiSlV2REcwSlNzaG1nZ1hhLzVEUGt6dFB6?=
 =?utf-8?B?MG9iTlVsYkFOUHkzY2ljY0tFZTJxaVhQdHlnMkgvWDB6bEE5L005S3pocWxv?=
 =?utf-8?B?M1hvWDI0ZHZnbllhVEpKTkN1ZWNPT3NaS2ViY1ZJNE9HSmNtV1dkNTNGVTJG?=
 =?utf-8?B?NHBPaGhRUm5mOUIvWVJUam9ROWtJUmFuWTFPZVJPYTl0ZzVEaDVJaXIyVW4y?=
 =?utf-8?B?YUlHVmZFS2wrY3padHlkY0o2M1cxdEV0aHBMRkt1Q1NHTm02UDZ0TW5SMmpS?=
 =?utf-8?B?YzdFZ1oxSzc3MXREa0pTdlhjVFFkb0EyUFpiTEFnMU93L1FjTXM4N3NGUUcz?=
 =?utf-8?B?VElJYkN0SDN6aGJJdEV3ZlVnc1E3aXhtRkt1bk4xWG5PNmY0RXEzbVhWZzBO?=
 =?utf-8?B?TWxRbVdxbUN0VGN6QSs1T21JSzR3eklaQXNRMEZyRXdLSTZSTVZRNUpVSGFZ?=
 =?utf-8?B?S3p2R3o3S1dqTTNmL0tWQWdXWlUxNjRQSE02bEliV0FCb1pNYzEzckZlQUpi?=
 =?utf-8?B?Q1NsdEI4R2N0dU8reTlicmVyWVlsc0Z3UFRFaGQ1Z0wvK1V6OW90ditOQThP?=
 =?utf-8?Q?TgcU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d68cba3-d30a-46f5-3d45-08ddcb5cd2cc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 09:22:49.3937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkATilumCfqYjCx/aPDwNRdctg3MxC+ZAQ6ZFxtAMl7blZnB+4nS6cMrpqLDC4Kz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8907

Many thanks Sultan for your so careful review.

Regards,
Bin

On 7/24/2025 1:55 AM, Sultan Alsawaf wrote:
> On Wed, Jun 18, 2025 at 05:19:57PM +0800, Bin Du wrote:
>> +static void isp4vid_vb2_detach_dmabuf(void *mem_priv)
>> +{
>> +	struct isp4vid_vb2_buf *buf = mem_priv;
>> +
>> +	if (!buf) {
>> +		pr_err("fail invalid buf handle\n");
>> +		return;
>> +	}
>> +
>> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
> 
> Variable declaration mixed with code, move the variable declaration to the top.
Will fix in the next patch>
>> +
>> +	dev_dbg(buf->dev, "detach dmabuf of isp user bo 0x%llx size %ld",
>> +		buf->gpu_addr, buf->size);
>> +
>> +	if (buf->vaddr)
>> +		dma_buf_vunmap_unlocked(buf->dbuf, &map);
>> +
>> +	// put dmabuf for exported ones
>> +	dma_buf_put(buf->dbuf);
> 
> The dmabuf shouldn't be put from the detach_dmabuf memop. Remove this.
> 
Will fix in the next patch>> +
>> +	kfree(buf);
>> +}
> 
> [snip]
> 
>> +static void isp4vid_vb2_dmabuf_ops_release(struct dma_buf *dbuf)
>> +{
>> +	struct isp4vid_vb2_buf *buf = dbuf->priv;
>> +
>> +	/* drop reference obtained in vb2_isp4vid_get_dmabuf */
> 
> s/vb2_isp4vid_get_dmabuf/isp4vid_vb2_get_dmabuf/
> 
Will fix in the next patch>> +	if (buf->is_expbuf)
>> +		isp4vid_vb2_put(dbuf->priv);
>> +	else
>> +		dev_dbg(buf->dev, "ignore buf release for implicit case");
>> +}
> 
> [snip]
> 
>> +static struct dma_buf *isp4vid_vb2_get_dmabuf(struct vb2_buffer *vb,
>> +					      void *buf_priv,
>> +					      unsigned long flags)
>> +{
>> +	struct isp4vid_vb2_buf *buf = buf_priv;
>> +	struct dma_buf *dbuf;
>> +
>> +	if (buf->dbuf) {
>> +		dev_dbg(buf->dev,
>> +			"dbuf already created, reuse implicit dbuf\n");
>> +		dbuf = buf->dbuf;
> 
> The dmabuf is reused here without taking a reference to it. When the get_dmabuf
> memop is called by vb2_core_expbuf(), it assumes that a reference to the dmabuf
> is acquired. So you need to add `get_dma_buf(dbuf)` here.
After test, we found we can't add get_dma_buf(dbuf) here because it will 
make cheese APP fail to open camera with following error:
amdgpu: [drm] *ERROR* failed to alloc gart kernel buffer (-28)>
>> +	} else {
>> +		dbuf = isp4vid_get_dmabuf(vb, buf_priv, flags);
>> +		dev_dbg(buf->dev, "created new dbuf\n");
>> +	}
>> +	buf->is_expbuf = true;
>> +	refcount_inc(&buf->refcount);
>> +
>> +	dev_dbg(buf->dev, "buf exported, refcount %d\n",
>> +		buf->refcount.refs.counter);
>> +
>> +	return dbuf;
>> +}
> 
> [snip]
> 
>> +static void *isp4vid_vb2_get_userptr(struct vb2_buffer *vb, struct device *dev,
>> +				     unsigned long vaddr, unsigned long size)
>> +{
>> +	struct isp4vid_vb2_buf *buf;
>> +	struct frame_vector *vec;
>> +	int n_pages, offset, i;
>> +	int ret = -ENOMEM;
>> +
>> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
>> +	if (!buf)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	buf->dev = dev;
>> +	buf->dma_dir = vb->vb2_queue->dma_dir;
>> +	offset = vaddr & ~PAGE_MASK;
>> +	buf->size = size;
>> +	vec = vb2_create_framevec(vaddr, size,
>> +				  buf->dma_dir == DMA_FROM_DEVICE ||
>> +				  buf->dma_dir == DMA_BIDIRECTIONAL);
>> +	if (IS_ERR(vec)) {
>> +		kfree(buf);
>> +		return vec;
>> +	}
> 
> You can combine the error handling here with the error path at the bottom of the
> function instead of duplicating the `kfree(buf)`.
> 
Will fix in the next patch>> +	buf->vec = vec;
>> +	n_pages = frame_vector_count(vec);
>> +	if (frame_vector_to_pages(vec) < 0) {
>> +		unsigned long *nums = frame_vector_pfns(vec);
>> +
>> +		/*
>> +		 * We cannot get page pointers for these pfns. Check memory is
>> +		 * physically contiguous and use direct mapping.
>> +		 */
>> +		for (i = 1; i < n_pages; i++)
>> +			if (nums[i - 1] + 1 != nums[i])
>> +				goto err_destroy_free;
>> +		buf->vaddr = (__force void *)
>> +			     ioremap(__pfn_to_phys(nums[0]), size + offset);
>> +	} else {
>> +		buf->vaddr = vm_map_ram(frame_vector_pages(vec), n_pages, -1);
>> +	}
>> +
>> +	if (!buf->vaddr)
>> +		goto err_destroy_free;
>> +
>> +	buf->vaddr = ((char *)buf->vaddr) + offset;
>> +	return buf;
>> +
>> +err_destroy_free:
>> +	vb2_destroy_framevec(vec);
>> +	kfree(buf);
>> +	return ERR_PTR(ret);
>> +}
>> +
>> +static void isp4vid_vb2_put(void *buf_priv)
>> +{
>> +	struct isp4vid_vb2_buf *buf = (struct isp4vid_vb2_buf *)buf_priv;
>> +	struct amdgpu_bo *bo = (struct amdgpu_bo *)buf->bo;
>> +
>> +	dev_dbg(buf->dev,
>> +		"release isp user bo 0x%llx size %ld refcount %d is_expbuf %d",
>> +		buf->gpu_addr, buf->size,
>> +		buf->refcount.refs.counter, buf->is_expbuf);
>> +
>> +	if (refcount_dec_and_test(&buf->refcount)) {
>> +		amdgpu_bo_free_isp_user(bo);
>> +
>> +		// put implicit dmabuf here, detach_dmabuf will not be called
> 
> Comment style (use /**/ instead of //).
> 
Will fix in the next patch>> +		if (!buf->is_expbuf)
>> +			dma_buf_put(buf->dbuf);
>> +
>> +		vfree(buf->vaddr);
>> +		kfree(buf);
>> +		buf = NULL;
> 
> `buf = NULL;` here is superfluous; you can remove it.
> 
Will fix in the next patch>> +	} else {
>> +		dev_warn(buf->dev, "ignore buffer free, refcount %u > 0",
>> +			 refcount_read(&buf->refcount));
> 
> This refcount_read() is a possible use-after-free because `buf` is accessed
> after isp4vid_vb2_put() puts its reference to `buf`. So something else could put
> the last reference to `buf` and free it after this refcount dec but before the
> refcount_read(). Maybe just remove this dev_warn() entirely?
> 
The warning is important to debug mem related issue, plan to keep it but 
without accessing buf or buf->refcount here. Do you think it 
acceptible?>> +	}
>> +}
>> +
>> +static void *isp4vid_vb2_alloc(struct vb2_buffer *vb, struct device *dev,
>> +			       unsigned long size)
>> +{
>> +	struct isp4vid_dev *isp_vdev = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct isp4vid_vb2_buf *buf = NULL;
>> +	struct amdgpu_bo *bo;
>> +	u64 gpu_addr;
>> +	u32 ret;
>> +
>> +	buf = kzalloc(sizeof(*buf), GFP_KERNEL | vb->vb2_queue->gfp_flags);
>> +	if (!buf)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	buf->dev = dev;
>> +	buf->size = size;
>> +	buf->vaddr = vmalloc_user(buf->size);
>> +	if (!buf->vaddr) {
>> +		kfree(buf);
>> +		return ERR_PTR(-ENOMEM);
>> +	}
>> +
>> +	buf->dma_dir = vb->vb2_queue->dma_dir;
>> +	buf->handler.refcount = &buf->refcount;
>> +	buf->handler.put = isp4vid_vb2_put;
>> +	buf->handler.arg = buf;
> 
> What is buf->handler for? I don't see it used anywhere in the entire patchset; I
> can delete `handler` from `struct isp4vid_vb2_buf` along with these lines and it
> compiles.
> 
Yes, will remove it.>> +
>> +	// get implicit dmabuf
> 
> Comment style.
> 
>> +	buf->dbuf = isp4vid_get_dmabuf(vb, buf, 0);
>> +	if (!buf->dbuf) {
>> +		dev_err(dev, "fail to get dmabuf\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
> 
> Doesn't free `buf` or `buf->vaddr` on error here. Also, comment style.
> 
Will fix in the next patch>> +
>> +	// create isp user BO and obtain gpu_addr
> 
> Comment style.
> 
Will fix in the next patch>> +	ret = 
amdgpu_bo_create_isp_user(isp_vdev->amdgpu_dev, buf->dbuf,
>> +					AMDGPU_GEM_DOMAIN_GTT, &bo, &gpu_addr);
>> +	if (ret) {
>> +		dev_err(dev, "fail to create BO\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
> 
> Doesn't free `buf` or `buf->vaddr` or put `buf->dbuf` on error here.
> 
Will fix in the next patch>> +
>> +	buf->bo = (void *)bo;
>> +	buf->gpu_addr = gpu_addr;
>> +
>> +	refcount_set(&buf->refcount, 1);
> 
> This discards the refcount inc triggered from amdgpu_bo_create_isp_user() when
> it calls get_dma_buf(), leading to a use-after-free. Move this refcount_set()
> up, preferably right after vmalloc_user() or right after `buf` is allocated so
> there's no risk of this issue occurring again in the future.
> 
Ignore it as you did correction in another mail.>> +
>> +	dev_dbg(dev, "allocated isp user bo 0x%llx size %ld refcount %d",
>> +		buf->gpu_addr, buf->size, buf->refcount.refs.counter);
>> +
>> +	return buf;
>> +}
> 
> [snip]
> 
> Sultan


