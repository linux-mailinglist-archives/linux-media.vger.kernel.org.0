Return-Path: <linux-media+bounces-44871-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56968BE7E6E
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 11:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA84050890F
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 09:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CA02DBF43;
	Fri, 17 Oct 2025 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YqIFN1CK"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA662DC784;
	Fri, 17 Oct 2025 09:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760694823; cv=fail; b=dhEVunLaRATyAC4XofJdltC/tNMYmnL53z13k8ET80EXvbs+KpXidSx1OK7bb5Wvcvg20rt8y6vEzllxDTp/R9gQ0sTNKG0mPWB52O4fszpTcJvMrdPLXMNacMqE/pyXB53J5GKUSYgqcnx6sq6VTX+DgpilnCsIIiE9oKtSPmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760694823; c=relaxed/simple;
	bh=4ElGMasYCmczrybYfho9hww1EJInIDQsKBMAVVtIg9Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HgBMAwLh0n4AlZ93OM0HfIwSa3+uqsO4jMCRpz/JG6W5asaAqC9a+OIQOtJ09QtwFgklMnScIFx2kaGYzTZ68TKAtOmBR6e3y/y/TkDunv/742Tv5E8FaIdqjI3dkPlA3k+bRqv4c5h+QWO0fD1m6QGN5Sr0Y4FFpJv8p480aRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YqIFN1CK; arc=fail smtp.client-ip=52.101.46.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oF9YQXZYDWI8XLMLlLcSD2fD8ShHK6pk+VlPZFvkBSJLp+Y5Pff19KQjwiLdzDzy/EmrudE/k5zsmzAGWFixTM5OTy/iKb9Q/Dxc51Td5k2DhmAwEiWqwgjTU/ryFwJNs5ijyQUenm7rg4dQaxXUNX+IBkDz95+sWVHSO+vx4qET1F9s9z/TQGm/yIfLVr57Sg4x20Il473YyxdmIp7uoqYiWBbiD5Ww8IHHWAiglRRgPy5pNSRpoLDWTQ7MYFe8jVy8req4/1mae7GKrpkXpQcPjcBFKcSAukyqD1Jx4JRFssHWUDGFVucplKLpH+d5c5WGYA9xHz183ot3hbsepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks7oZ3aVxalVcELMLYRv1Qj7LipvThHRbZRmZXW8e1A=;
 b=GzHaXZecMLvR1NRvwcuhomoqGi4kOVtej7OV5qFQ9azfxZ/HZK7v70u4+fxFIrpjDMmkY0hVkTwpjvgO18pKCvio8G1nKk74QPN8FWXbEQMJ2WGlZbj5u6vQwbupgtb2g8IienOB3erzRkrVfeGlpVkKh88bUx7eKHNm0XZ58td8l7FJremP21TcYUPn/xfg+7NM2+Uw1nH5H5tcE5KbhXPmCqgEqiIxYbySEa2y3atihym+tEDJdKW2fQKk6zkiTSU6tR3Qs/iEba9jVD5JP7DPtL2mmXoECyZP2QsP563ST2oPDwZy58VRkbHcyoHj/3mLTgDsk8K8BcWMwB+UhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks7oZ3aVxalVcELMLYRv1Qj7LipvThHRbZRmZXW8e1A=;
 b=YqIFN1CKaeiPY8mi7jr9PK7kGmYDCLp1c8jwBGHw4c1vplwnmpK0RHtmr4+02ZIqbhQEwSC9AI5+TPGoJXhms5HZu2pLK1FhpQz5UovGigMj2qAq29Wz2VERCPdAeaVrDfmtXBqtu65Fp+VUktS5WcSI687SHwZfSDh4/9WBn1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by LV8PR12MB9641.namprd12.prod.outlook.com (2603:10b6:408:295::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Fri, 17 Oct
 2025 09:53:38 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 09:53:38 +0000
Message-ID: <3ff43351-9236-43a6-aea8-ab492cc86699@amd.com>
Date: Fri, 17 Oct 2025 17:53:27 +0800
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
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-6-Bin.Du@amd.com> <aNzP2LH0OwUkMtGb@sultan-box>
 <c28eb905-b578-4512-aa9c-37281d3a0ee4@amd.com>
 <51c24e3d-be89-44c9-8247-95fb776aed78@amd.com> <aPH_iHmPFWTrrOQE@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aPH_iHmPFWTrrOQE@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR0401CA0033.apcprd04.prod.outlook.com
 (2603:1096:820:e::20) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|LV8PR12MB9641:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c3a5a9-0464-4aa0-bf72-08de0d630bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d01YM3Q0M1I0KzhEQ2svc3BZcVM2WEZZVTB2Wk5vYllqbE5vZkxaYzljelpT?=
 =?utf-8?B?U2crenY4RitsYjYzdnJpRjJlU291cy9Fdm0rQWxBNDRhaUpPemZFc1JLZG5k?=
 =?utf-8?B?bXpCdHFGLzJuZENFUTg3ODQ4ZkxLekpIcHE5Z0VhdHVickpPR1Y1NVZFQ0E1?=
 =?utf-8?B?eWdHdTJLajNMTi9LVFFxR0w3ZEZCeElVZFZ6NFZZUEF4b29NQnNoa1c1NzVI?=
 =?utf-8?B?OGJMdy9qeXkyNEwrMFRPK2lRZU45dGQ4VW10Rnl2NURjbTg1eGhveHo1SnFx?=
 =?utf-8?B?UXBDYXUzRnVPSzVDdXdjNFNPejJJM0ptbUZ4c3ZhVEduVDk1bDVPTllPZkZl?=
 =?utf-8?B?QnlERHRVNi9STC9KOVdsWjBER3dFbUJPT0c4by9xNEFlN1YvSGN3Zm1tVlVG?=
 =?utf-8?B?T3hFaHpTRDVuZHVBWUF2OUpmZnZVVlZHYzRMZm1tMmVFWkl5MkRHOTQ1ajZP?=
 =?utf-8?B?b3Ewb3h2QXcrcVZ3VVhucll4d2FFOGRaSWRQV3ZVWFkyVG5UdWM5NW1YYmxI?=
 =?utf-8?B?T2ZXVEdHVnBJY2ZUZ3JvOEd5WmRpbnRXZ1RLbk1lMXVlUkE0Y1VYeC9zRXVK?=
 =?utf-8?B?SVBpVGNHSlIvbmxIY2JSTDE2MXMweGZNL0ZiZ0R3QlluT0FNMm9iaUM3cU9x?=
 =?utf-8?B?d09UU0tiTmRXRlUza2FHS0ZlV202WXB1aFpKTnpUampmVVZKeVdwSWRuMmc4?=
 =?utf-8?B?bDEwNHJiYjZLai8vbUhHRkxuaTVTQzlYVWJkVWZ4aU1GYlBDNlN1Z2NvN3BL?=
 =?utf-8?B?Y1h4aFROVVdHdElEUHZ6VldzVkhEeVQ0OGxaL1pmaTZ4UktSRWRwcTJBRVpY?=
 =?utf-8?B?ZDlXcTZhTVFkYXlPT0JkNHJYQnIyeFNNS2FPb1E3MFZsUmw0aWduUmlrN3h6?=
 =?utf-8?B?bDVrb25oSGRPZ3dodVVGVm1laTQ2cjZ4MEloZUEvaS82b2M3V0QyZ3EzeGxn?=
 =?utf-8?B?a0JFS0ZBd0hRaDU4eWM5ODQrcmxFcmNETmltdVFMaDVUcFBlWnBVbzdJV1p5?=
 =?utf-8?B?M3ZlNWRBZ0lmMWpTWFpTMHR6QnBBbDJLOUpPcVZQOERUeEpDNjdaOXdFOHY4?=
 =?utf-8?B?SFE2c2NhdHNTcVNuaEtaZDduYXJqdytyYTcycjBXU2Y0WEhGZTVUaHlja3BU?=
 =?utf-8?B?M3pGWUdEVzZDT1k1ak84NDIwaXFFMlVuc3ZxVHQzcFBrWGQzYk9ScVZoV2Fa?=
 =?utf-8?B?c3VOaXZOMmpWSUdValJueTR2bkMyY3UrV2l1dmZ4RmtWYlkzb3dHMG9DYTJp?=
 =?utf-8?B?elRSQnBOOVU2ZHh6RFdoeDNmcGVSUWRYM1VTMHQ4Qm9jQnNpTHc1REdJbmtE?=
 =?utf-8?B?ais5Yll1VnBtd0tUM0Juc0ZEdVdTbDBmOENHRXZLTnpYUmRCa0RWb0xjVDZa?=
 =?utf-8?B?Q0kweFFLQTdSdjhoVGxQWkdKTWQ0TlRLMUVrWm9UanlCTlN6c0lCRnptT1pO?=
 =?utf-8?B?YjBDWWpVaXhPRzF0Wk5qWE1nOG0xWnJHRDdkUGZBMVJrNGxoN0RqNjdpMGZE?=
 =?utf-8?B?OVBwbmtqM051Si9Na1YvSnRrclZ4YUxDOEtYdmdORWxzZkdma1BlT1M0cUNU?=
 =?utf-8?B?dzRGVW9qaitKUWRQYktvTUgvM0MybG94b2RoZU43Y0J3ZDFWSTlpdVMwNFRr?=
 =?utf-8?B?Nnl6MytESlgzQVFvVUxUaVRWQUtSR29JNzlTYkZLdWtqNmZYUU5rbTJVa0tC?=
 =?utf-8?B?WEZ3eEg1R1NEVGk4RWxtYWV3TThTZ0pWTzh6MXdObzV3djNBanlySGZwMklB?=
 =?utf-8?B?VVI5M1J4UFFDcTZPNFRjQ3Nkay81S2VlUldWT2dUVlFmMTNLY2haNFNBTzlK?=
 =?utf-8?B?Nk9oN08wREMvRnZ0ZGJkc0hoYlhES0VScjd6bTUxWGttMk11ZU9VVDhnb3Bp?=
 =?utf-8?B?QnlCMzJmS2taeTE1N3F5aFYvMmMwQjdHVWZWeWJhNStwdXc4eVBhSG9TclRm?=
 =?utf-8?B?aGUwR0ZZOWZBckdHL2Z0UnBVdVI4cFhpT0c0Nm00VFRsUmxvTWN3RkUzWk45?=
 =?utf-8?B?SnNzMmd4VFlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFdORlJZUHAzVCs1RU9lVVMzbUtDR3UvSkZOLzcyTWhoV3dZTTBsZ2xid1B3?=
 =?utf-8?B?U0ZtQW9UVjhFeHM2cyt3TlZveU1GZG85S0VQSUY3ZUJTTlRuSDR5TjBpcUxM?=
 =?utf-8?B?LzJKdlU5QjJ2K2lROU1FQmhFVDd1eGM4T3JOS2RXUGhYaVljRUhVd1VKKy9r?=
 =?utf-8?B?LzdWK2EvQjB1djRKR1hTQzV6L251cGltNGdtZ1BLNStYV2ZYTkw1SEU2WVZP?=
 =?utf-8?B?YjZHdEVZYTU4Z2JGMmxBSWV2OFcydnZWZDRiOWsySG9ONmhHRS96NVlSakJ0?=
 =?utf-8?B?aXJvbEZ0S3V5TTQycHkzM2FFbkFLdzBoZzlkWUpRNzJaZTZZdk4rTk1BUUJB?=
 =?utf-8?B?VnpZc3hrUENFSjdSTnJKdldybCsxcnFUOWtCaVJZdzBMMzNZK0M2enU0QlJD?=
 =?utf-8?B?MXowUzJreEVoVXdzazNlaXVMNFo3RTFpSGphMU1ZQVJHT21iUTdsOXNpdHFK?=
 =?utf-8?B?K1daSU1ma1k3bXRKbitGNjV4WVR0bHluUDZZSkJLaXEyekFKbUMrWGsrbzRK?=
 =?utf-8?B?TGIxQ3M2dTNZZEo4QUJReFV1Vm5Uay9IM0RPYVN6YlV0bC9nSGRyWGw1MzZL?=
 =?utf-8?B?aFFEdGFCV0FxakcrRlhvNFl0cjR0SkYxUzVtNlUyT2J4VWlvemVwMUlDZVBa?=
 =?utf-8?B?Uk9DWHJnKzBKMm9mREZxTXNOQlNidGlUNzFPZU9kTENzV01Fc0p3S3MxNSs1?=
 =?utf-8?B?VVFEZ1pHWU1CRlNxQWp6YnZDd25nK2NSTWNTTERkajJNK3BZMWVyU25QUjZN?=
 =?utf-8?B?SmNENFcwbXphaDd6Nzh4RHhrR1pYYm94SkNjMXovNHlTOGtZT3dSRnJ4c0dR?=
 =?utf-8?B?N0hJZU9nR1VlTmlDV0t0MnZ6a0FEdTZ2MmEyZjFPVk9oUmM4T0xhZWUxWFJq?=
 =?utf-8?B?akFHUEJIWnBiTm9RYjI4SkdaRTZITDNkS3EyNStmc1B6K1VGNE5tY0tUYTVu?=
 =?utf-8?B?Q2FoTHA0WlhpRUdzNUtRem94b2tac1QxUmdBQ0RLNmdMalo2citRTENWZFMv?=
 =?utf-8?B?c0luVUkvcFpTbENEUDRSZnN6M0w0SWM4SnJEZDhGTXFLMG0yVjluQWh1T0JH?=
 =?utf-8?B?c2xQRStSazhYQ0VWTWlNNkNWYWh3c3FmdWNiaTkxYmZBaDdHNHFyOUUwMlF0?=
 =?utf-8?B?Q21OblFUMWRTUlg3ZXpqVmdaRmhDSEZEREkyQ1FLTnF1SFdNMlFIdzIvd2hW?=
 =?utf-8?B?ZHlPdnZJdUlSelNMZ0NyVmhvaFdJK0JjcW5CdnJBS2M5cXFuOEdXY0NyYVJG?=
 =?utf-8?B?WUNDTVlyS0R1dHhaaXRPYlgwMnNLQVNISHRVVDVuQ0dMNzIwc3hQRHVvWTlZ?=
 =?utf-8?B?MUxRUFB5RGFwY1Brd1ZTZUpCb0lBSnBWdkxzOGVPM3ZwbVVtUHBzYmJld2lD?=
 =?utf-8?B?a3BHV0RtelNjOFJRNG43K0YveXJCSFZxMGF1SDNidm4yblJCRWROd2s5L0l6?=
 =?utf-8?B?RUhpRTJPOEpHNDh2K28zTzVKT3h1SU5RQzd4T2FSNTZhekJGMXAydXVWTmxJ?=
 =?utf-8?B?ZXJrMjZBWmhpVGMrT3dMait5NEt5VUN4c0dQY0VyWTVldm9qbm9LbUtJbG5s?=
 =?utf-8?B?VlpTZkhFamp1VzBISUxoWmY1NjhWZ09MV08rWUdvejdiY1VFZzdSV2FYQThC?=
 =?utf-8?B?d1hGQ2d5SlFZOXRzNFFXT1psMkVPNDlJVUVFVXZsd2hCV1BucmU0dmZWVGlI?=
 =?utf-8?B?aTQ3RGdhdTBad1czMVZGRVMvYjJLU09UbjYwVG9MMmVkWjFmajlsUHhpMDUx?=
 =?utf-8?B?amhIbGJGNnp4eHVQM3hRVWZnT3piaFlYZlRQOCtNc0g2VUhBVHdpcnMveW80?=
 =?utf-8?B?Z05yMTE1cHhFUnFWZzBUa3NQTC8rdUZWaHpDSmRRMG03anllcGc3TjB0aktw?=
 =?utf-8?B?c1Z6THpKcHlUSWF5eTVtZVNITzVKNzQ3Y3owRGpHUStudDJFS2Y4MXlMdE4x?=
 =?utf-8?B?aG5XMFdsanBmUVRTUXNlK3M5OWNaL1FxaFJJeXNmN1NEYWs0VGk1dE81ZkFZ?=
 =?utf-8?B?ZVVzT08zMm1tU3NWQTFwSFVXSERHcER3dkJvMThveVliZXAza2J2WDhoYnZ0?=
 =?utf-8?B?ZzM2aUNRVkRkWnNiL1RmZ2toUThFTUo1U1N4Y3pXU0QzUEs3N3luTXJyUGNS?=
 =?utf-8?Q?PfDk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c3a5a9-0464-4aa0-bf72-08de0d630bc6
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 09:53:38.7111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJx2CwZa1DzFfUeQX4ySMVhdyFA86MtwnMEYSjv67ofENR/IaHL8fGy9CiFEjCwF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9641

On 10/17/2025 4:34 PM, Sultan Alsawaf wrote:
> On Thu, Oct 16, 2025 at 04:13:47PM +0800, Du, Bin wrote:
>> On 10/11/2025 5:30 PM, Du, Bin wrote:
>>> On 10/1/2025 2:53 PM, Sultan Alsawaf wrote:
>>>> On Thu, Sep 11, 2025 at 06:08:45PM +0800, Bin Du wrote:
>>>>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>>>>> @@ -178,6 +178,16 @@ static int isp4_capture_probe(struct
>>>>> platform_device *pdev)
>>>>>            goto err_isp4_deinit;
>>>>>        }
>>>>> +    ret = media_create_pad_link(&isp_dev->isp_sdev.sdev.entity,
>>>>> +                    0, &isp_dev->isp_sdev.isp_vdev.vdev.entity,
>>>>> +                    0,
>>>>> +                    MEDIA_LNK_FL_ENABLED |
>>>>> +                    MEDIA_LNK_FL_IMMUTABLE);
>>>>> +    if (ret) {
>>>>> +        dev_err(dev, "fail to create pad link %d\n", ret);
>>>>> +        goto err_isp4_deinit;
>>>>> +    }
>>>>> +
>>>>
>>>> Two problems with this hunk:
>>>>
>>>> 1. According to the comment in include/media/media-device.h [1],
>>>>      media_create_pad_link() should be called before
>>>> media_device_register():
>>>>
>>>>       * So drivers need to first initialize the media device,
>>>> register any entity
>>>>       * within the media device, create pad to pad links and then
>>>> finally register
>>>>       * the media device by calling media_device_register() as a
>>>> final step.
>>>>
>>>> 2. Missing call to media_device_unregister() on error when
>>>>      media_create_pad_link() fails.
>>>>
>>>> Since the media_create_pad_link() will be moved before
>>>> media_device_register(),
>>>> we will need to clean up media_create_pad_link() when
>>>> media_device_register()
>>>> fails.
>>>>
>>>> The clean-up function for media_create_pad_link() is
>>>> media_device_unregister().
>>>> According to the comment for media_device_unregister() [2], it is
>>>> safe to call
>>>> media_device_unregister() on an unregistered media device that is
>>>> initialized
>>>> (through media_device_init()).
>>>>
>>>> In addition, this made me realize that there's no call to
>>>> media_device_cleanup()
>>>> in the entire driver too. This is the cleanup function for
>>>> media_device_init(),
>>>> so it should be called on error and on module unload.
>>>>
>>>> To summarize, make the following changes:
>>>>
>>>> 1. Move the media_create_pad_link() up, right before
>>>> media_device_register().
>>>>
>>>> 2. When media_device_register() fails, clean up
>>>> media_create_pad_link() by
>>>>      calling media_device_unregister().
>>>>
>>>> 3. Add a missing call to media_device_cleanup() on error and module
>>>> unload to
>>>>      clean up media_device_init().
>>>>
>>>
>>> Very clear guide, will follow your advice.
>>>
>>>>>        platform_set_drvdata(pdev, isp_dev);
>>>>>        return 0;
>>
>> For 2, we found when media_device_register() fails, calling
>> media_device_unregister() won't clean up media_create_pad_link() because it
>> simply returns without doing anything(see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/mc/mc-device.c?h=v6.17-rc7#n797).
>> Therefore like other kernel drivers, we'd rather not call
>> media_device_unregister() in this scenario, it doesn't cause issues, but
>> it's not logically correct. Cleanup for media_create_pad_link() occurs
>> during error handling via isp4sd_deinit()->isp4vid_dev_deinit()->vb2_video_unregister_device()->...->media_entity_remove_link().
>> What do you think?
> 
> Oh, good catch! You are right about media_device_unregister() not cleaning up
> media_create_pad_link().
> 
> But I don't see how vb2_video_unregister_device() ends up calling
> media_entity_remove_links().
> 
> It looks like media_create_pad_link() is actually cleaned up via
> v4l2_device_unregister_subdev()->media_device_unregister_entity()->__media_device_unregister_entity()->__media_entity_remove_links()
> 
> And I mentioned before to add a missing call to v4l2_device_unregister_subdev()
> on error, so it looks like that will cover the media_create_pad_link() cleanup
> and therefore you don't need to call media_device_unregister() in this scenario.
> 
> Does that look correct?
> 

Yes, Sultan, we moved v4l2_device_unregister_subdev to isp4sd_deinit as 
you suggested, so current isp4sd_deinit() looks like this
void isp4sd_deinit(struct isp4_subdev *isp_subdev)
{
	struct isp4_interface *ispif = &isp_subdev->ispif;

	isp4vid_dev_deinit(&isp_subdev->isp_vdev);
	v4l2_device_unregister_subdev(&isp_subdev->sdev);
	media_entity_cleanup(&isp_subdev->sdev.entity);
	isp4if_deinit(ispif);
	isp4sd_module_enable(isp_subdev, false);

	ispif->status = ISP4IF_STATUS_PWR_OFF;
}

You are correct and I believe both isp4vid_dev_deinit and 
v4l2_device_unregister_subdev can cause media_create_pad_link() being 
cleaned up. Because isp4vid_dev_deinit is called first, so the link will 
be cleaned by it, here is the call stack FYI, does it make sense?
[    5.198328] Call Trace:
[    5.198329]  <TASK>
[    5.198331]  dump_stack_lvl+0x76/0xa0
[    5.198336]  dump_stack+0x10/0x20
[    5.198338]  __media_entity_remove_link+0xdf/0x1f0 [mc]
[    5.198342]  __media_entity_remove_links+0x31/0x70 [mc]
[    5.198344]  __media_device_unregister_entity+0x93/0xf0 [mc]
[    5.198346]  media_device_unregister_entity+0x2f/0x50 [mc]
[    5.198348]  v4l2_device_release+0x112/0x190 [videodev]
[    5.198355]  device_release+0x38/0xa0
[    5.198358]  kobject_put+0x9e/0x200
[    5.198359]  put_device+0x13/0x30
[    5.198359]  vb2_video_unregister_device+0x8e/0xd0 [videobuf2_v4l2]
[    5.198362]  isp4vid_dev_deinit+0xe/0x20 [amd_capture]
[    5.198364]  isp4sd_deinit+0x25/0x80 [amd_capture]
[    5.198366]  isp4_capture_probe+0x1ec/0x2f0 [amd_capture]
[    5.198368]  platform_probe+0x3f/0xb0
[    5.198370]  really_probe+0xf4/0x3b0

> Sultan

-- 
Regards,
Bin


