Return-Path: <linux-media+bounces-35914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD3EAE90C1
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 00:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A066D172F5D
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 22:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7696D26E6ED;
	Wed, 25 Jun 2025 22:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LRd3lLYS"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F60C3597E;
	Wed, 25 Jun 2025 22:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750889169; cv=fail; b=e37afKdofsQbP/37nYn+49+YrDfsANlMKnSEXKZIswH6zWLNULh3soI26h679sKYSULGbUA9MKjZrInDw0fo7t4s5GAWMxAz3RgNplsh2gReCMh3pvo3I6A6qfaEhO9s5AYBbni21iFNoy+5sKqU4kl997cqi/4I9gSSTIvc3aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750889169; c=relaxed/simple;
	bh=1oqnAVoQ1BfZIfVZQ0+ngiJM6K/oj4AqavUnVOZ0Ipk=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ckBjGZAoua/jK/WAxKnrt7oLBKPPWFMTreAzdjk/2XGnmAkiflhXrQycwUfQBAJjITQDGpSjwQ+1NEeixmkQqje056Ys202hoNFSgR/HTkWzQmO33KpYKr0A6653rUhsqJvl8aolCnF/nM14Ihvi1h3PBryCSnbvMtJXtfLlJUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LRd3lLYS; arc=fail smtp.client-ip=40.107.236.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ie0K8j9hFt4DwUCy2RYLc/4rOs7p8gg+eb/M5S3ncEY3qxycJiOJrzws4+TErr1zsZjK5JoBvvExEKUXXb4ENXgrwLCfpLuPpwVyNqBjhreeYAIJcgFctHZ7jCu+vM1chNKjfsRmvvSDMHdzOglDS3KwmhfC1cysU1mxBuWv+KPqb1m2OxeKtjpUJLEfnvEKH6NMFa3ZR83Kt7Am6uXkwKztXqGBNZHnm7qrZZxMTtEymrq0Djk45AnG5mBkuiu+ldIc4w2LJ3a7aP8KlY1n0hxBNoHRrH/xjcDJJUqGgBlPwuMC6PcowIDl+TnxxRMBX6qJ52WSrEibKr02uBdCkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yleEL7fA1Wyg3qYOB5IYvFaAD/dEX9xOBzvrUQJTwpw=;
 b=ekmZulJHloWmd0naz9JLXN6O3s54CE+qNJkUdVSY0n2Ai/kDp6M1GC0UVmDm+dqPW9iJ1iGhavN8Hb0uiulsC3kYSdNwiyrNoOMn+FFwZwAH2X2UThppBQrZttMFzf0N1bB9kVSwv9Gp1lvDyvEsmGwRre9KfAQtB5bRu2sszJ7tCpjjR2LlFUcl7YiwyoEBfUoBVh71q6owsZ7jj2Gs+OKKgDGMalYzuURV3yNqtfyiH/Atj5rMU8EWdcYDORqlqdt0iRFPNUeFvNpBdmmeK8zxNnA6FLu7wvLi7HA9ySngjPSYgtaXfk6Hq7Pps+1HqqoMeowHht/5hAQsm9aDFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yleEL7fA1Wyg3qYOB5IYvFaAD/dEX9xOBzvrUQJTwpw=;
 b=LRd3lLYSnPF9hKl8MMwd+MygJMbUZ+a6xM9Jn5E84OfokXKZUmxsOmv2qOGrzJWMo4yQOnm1DCkO5kiSZFd6hwaxsiu1VSH+Pvf25+1BjO0lfG+c6cvzeCFsCoCVsd0rBbiUhyqBkxuJC9ASb6yeIRyiuAxiUDvWVsA/c01S27I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by CH3PR12MB8536.namprd12.prod.outlook.com (2603:10b6:610:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.32; Wed, 25 Jun
 2025 22:06:04 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 22:06:04 +0000
Message-ID: <fb719113-513f-44d9-82ae-63ff6aaca142@amd.com>
Date: Wed, 25 Jun 2025 18:06:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 krzk@kernel.org, dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com, Svetoslav.Stoilov@amd.com,
 Yana.Zheleva@amd.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <3e8364e8-22e4-42ad-a0f0-017f86fd6bf9@amd.com>
 <20250623120929.GE826@pendragon.ideasonboard.com>
 <aFlU-E_GCHWBXErq@kekkonen.localdomain>
 <20250623134200.GB29597@pendragon.ideasonboard.com>
 <b6425dbe-44e6-47b4-a06b-b9a172a8cac4@amd.com>
In-Reply-To: <b6425dbe-44e6-47b4-a06b-b9a172a8cac4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0269.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::25) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|CH3PR12MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be3eb7b-e85d-4119-c5f0-08ddb4347a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2dpVDhtaTVQVjBaM0ZtVm1TSHM2S2NEcW4vL3BTYkJHRnBSaktYWnhxZ2Nq?=
 =?utf-8?B?eTdVUGVvMTUyaDhLVmgvcWhSMjBWYTc3ZUlKOGMrSSt2UEhkYXM1bVlxS1BS?=
 =?utf-8?B?blhaSmluejdZVUZxSFRmelBXNk5vaEZzYUljQzUzbFlITnZuS1dCeng1ZXh4?=
 =?utf-8?B?anQ3SGdOTFkzN0xudHgza1hMY0VIcm56a3VIUVNRa0xVUUJ3MGtWa1Q0WmdH?=
 =?utf-8?B?VkgybjViTWdwT2lTd2ptbVlZL0JSK0FsSFNoYXRsTG1VMDBJa3hUKzBWNStY?=
 =?utf-8?B?Z21Db09tWnJMcnU0NXFvczJIV01Ja2cxeUk3TWovZGl5djBKVlFpdThjY3BU?=
 =?utf-8?B?aTZLZzF5dzBMMUhQR05vQmNodjFOZzk4MzJkbFZTOVhYNnFZa2kxL2RhSlJI?=
 =?utf-8?B?Ukltc0YrS1NmeFgwcHNlblQybHFlbEkreklaVDI3Z254aU8xa3JHeW02SUh6?=
 =?utf-8?B?bVI3YUFpbno0VHdoQTc4bWxSaW9JVTFNT00yY1hMVVJNbnF4YktZaUp6VHB6?=
 =?utf-8?B?WHRBYjZ0b3pzMjhjQVRraER5b2swdU9DTmY4ZlRvNGVwcDZzUWR5QXROTG8z?=
 =?utf-8?B?akxHMUw2WVJDb1pnSTF4eVFNOXp6MGJMVzJoSjEvdW1ORjNwRkFLQiszcG53?=
 =?utf-8?B?N0h1VDQ4bjlvbEZkcEcvOW1UTDVIaGVZKzNRbkdOeDRaWUw3aEJ2dFdXTXJQ?=
 =?utf-8?B?T0FRdXI4NUhxR2tDemM3U01ldVBEOFVDUVlnUzVKcGttdkxrZ1k2b0ZmVmhI?=
 =?utf-8?B?c1ZNcmFodkZQQWgzOUpzcFR4cXUyei9uMTg5MEJabHBIbjFRUWJ5T1NiSGNs?=
 =?utf-8?B?eThSUEpQTFEwNmRuMFVWaGkwOU43QjNSdkNWVzkrNC8rRVZyQUFhbWdNQXZS?=
 =?utf-8?B?ZlZvZ1cvc01ZWThVZE8yRDNSYkFRVWdkTnJoUGNacTlScTNZQjRLVzY0U3A4?=
 =?utf-8?B?anFJR0hVRGkrcnVVMlkyMG1Xd080RmthbDhGYXdiNHVPTjhPcEd4T1ZTcGN1?=
 =?utf-8?B?TVFTaDJ5Nm1OVTIrZkprL3U3MnROcmczUGE4K243dXhMMFdVbWNVY1hKZDlh?=
 =?utf-8?B?a1Q5TW9FMzY0RUZDK0hBQUx6NzZ6V2lTN1d2WWtVS2ZXaHNBSlJSL0c0UDlH?=
 =?utf-8?B?aS9DUHY1UGprcEZiYTZBT0hyV0NqbEh0WWdORHEwcXowOFZoZ2pwVHZmQ3Y0?=
 =?utf-8?B?SWcrbGQzSkVncG5rT1pma29BbENrQjFsUEoydzhGN3JRV25GNVQ3U242TnNW?=
 =?utf-8?B?a245cXR5dFBRM3JRYWEwU1Y2eWRpTENNWXV0VWMya1N3M2NGTWtQYVNuUlJx?=
 =?utf-8?B?dnRTeVJ6eU40NWxIZm5jelY5VjdrRDBvR092YnhOK0o0eVlKbXBEVlRXSWw0?=
 =?utf-8?B?OFdZTlpOZUlJQXpsV0Y3UFVva21rODBnZXl0Mzdud1dZb3dFdDc0b0hOUzZq?=
 =?utf-8?B?ODBwZDBPd2RYVjZheGthcllEN3gzSi9VVnJEVHZaQUc5Y2J2dnhMK296TkNH?=
 =?utf-8?B?QkhwbnlGQy9XUzY1ZWhTZEl3MXpIaktBaUZ5L2ZHQ3RIaktMU3lTMnpBcHpB?=
 =?utf-8?B?TjFrSUg0a1hZWFdySmwxMlZkdGp3Y3dQaFZIaHZmaE41T2R6R2plQTJjSVY2?=
 =?utf-8?B?dUZBNWY3bDl0K1Q4N0R6dHF3ckFha0FpRHQ1bEhUR1VnS1AzemJTRjZDSzlr?=
 =?utf-8?B?RHNQOThMaDQ4S1c1ZEIwODVYaUFWeHBPZGtqa0xnWVg5ckZscEdvaloxMXdr?=
 =?utf-8?B?UDdBWXFhYVlkbkZCOTVPRFlVbldXbE51UXJuQkFyQUZTSlNvdXZyMXdYN0Q0?=
 =?utf-8?B?VEthMGpsNm1FeXVLWmY5NDErelMvVVoxMXJtRHozZDlYbHhPWkp4d2hSU2N6?=
 =?utf-8?B?S09KbVAzaE9VZ1c0YVI2cG1LNDN4VExOcHo3bWpkQkFxaThmVGdRNXNNT1RM?=
 =?utf-8?Q?jhEZO88a808=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2VBbUhDNmZLSmhFQWZ3R29KVEpCZC9JVC9Xa0NsR2x4MUtsNzljU2plV25u?=
 =?utf-8?B?azFCY3YyT01UNWJOUTBrZWk2L2ZhN1hJaTk2Y20xZ0lsUnhHR1ZFeExRdmhV?=
 =?utf-8?B?UTE4bTh4WFJzdEFFc2ZUTVN4MlQzS1dtS1NWWVU3NDFoVUZPOTNaQ0VQZzRX?=
 =?utf-8?B?eEkrQytTL2loYk1SWUlVaDVyTUFtK2E1d1JPNmliVFBPbDdNMllHbmlZTkFY?=
 =?utf-8?B?Zk4vZDlYYXpmRmljNG9sLy96S01jNDd3STVqYkVCSGNuTHIyaHFSM0ZTUzRR?=
 =?utf-8?B?UldCYUJvZTd1ekxXUytxb2R5UlhBR29GY2UzR2srZDBQcjVWbTZnRzJPa3BK?=
 =?utf-8?B?eHRMWExETThOdXhGeWs5UGt2VHBCT0dqaThReGN6d0ZDVmpodjN6a0tPT1Zs?=
 =?utf-8?B?dEppdTdURGFYYzAzKzdXb0YxeDlmcjlZSDRlcTQyNktrbzdRaVk1aHVxenEw?=
 =?utf-8?B?L2Y1R0YwWTZpWjB4TUplMFhreVdoL3hQUERVT00yTlZ2NWlhWFJqSEdEWjlO?=
 =?utf-8?B?NnlGaStpMjVEUWRkSDJrbEZNaVgzWEg4aFNHMGNSNHl1U2MwSnVGNDcvbFJS?=
 =?utf-8?B?bmoxZTF4emt2WFl2OWd6WlNSR3hQSUpRRmJaUzlsTFdmRnJIR3JISlg1dWFC?=
 =?utf-8?B?a1Y2cHhNb29tZFhTUlMvOTRORURuMEM3QnJvb1RGS2FNMVFVRDZlekZ5Sk9N?=
 =?utf-8?B?YW5VUU8xVmw4bVpZWi9xRTltRWVyMnB4SFZUNmNLQzFCb1pyQlVRWGt5MDUw?=
 =?utf-8?B?VFdZV0s4Y1RNcWFhOG5aL0p3RFNiOFpHRFdzeGo1dENiMW4vSU9XL0MrTEY5?=
 =?utf-8?B?MzJHRU5pdEFPSHFjdlJjcW05T2dkRTFrQ1p4N2NSaGdNU1VobFhiR2w4bXZN?=
 =?utf-8?B?d3lHc1R5MHpmV0xuaU9RejFuUVh1RU1jWS81UXdhRjBiYWhoSGw1ZU5QRnF0?=
 =?utf-8?B?Q3NkSHhYUlB4MTgxM0xqL0kyM0tLbkJ3ODE0N2JPTGRzRUVxRDRXcjRUM2VE?=
 =?utf-8?B?c0JiT3hUT0xrT1BVYXpPRzR3aWJIcmtUNDhxQS9VV3VVZHJQVS9vSTFXazlk?=
 =?utf-8?B?RWdQOXZRWTAvNWVYeHVnakdRdzZvRUx3Zk5nMmxHazJ4ZGpSK3VjNTk5SmpG?=
 =?utf-8?B?UTdMUGwwL2NIRlZxWkZnckZOZ01FV096Rk94RUN6WVhGZGpVRjdFRDJRZFRy?=
 =?utf-8?B?T3Q4c3d2YUIrcWhBcitKaVZTWlRPMmp2MytEVUhZMVVESXl4dnE5OWw1R0ow?=
 =?utf-8?B?alU4OHo2Tk0zME9IUDFUZDI5MnZncE9RTDFiWTViZ01GMTl1VWd3Ym1wU2pK?=
 =?utf-8?B?YUpqRERYYS8waTVDM0dldjhheDU2Um1QNmdGZkJxSUNmMTF5dzFrTTBpK3J2?=
 =?utf-8?B?NHErTzkvWU8vN2RaVmRWaURzdFppYlI4c0k0VFVBVmhHL1JSb3drYTNFSlJC?=
 =?utf-8?B?S0NyNGxyMUlleHhwYk1rQzlwNWFoSFFiK0NZWFZ1TDU0aWk2ckNlSnZ2aDZP?=
 =?utf-8?B?UnRoQlpUZTAxcldaKzdYTHpBU0dQQlJRV2Naamw0dUtrK1pPajZMSFV1Ukg3?=
 =?utf-8?B?ZEtlU2lBK1FjRkJlQjhRbHMzZWZlZkw0SjFoOStXTmpFblVuTSt1WFpLRmJS?=
 =?utf-8?B?SU5QajBDaFNPeFViVy9xdWJZajBmeS9BWVUrYmZZSEMyNWY5Y3BpUFZSekRB?=
 =?utf-8?B?WGs3aFdEZElwbkFIbmJlaytCajNEeGs2eU9BM1ZOeUtsY0FKajYrUllUekJw?=
 =?utf-8?B?VFVjUjRqUkl2RzFYYmp6VmpmRzBpcTk2MTh1UGVGeW5SRFBaa3V2R0hBM2R3?=
 =?utf-8?B?amp1ZDJDbThsL3BKNGI1ZllscGdVR0JUUlZMSjNITjZtMy91b0J5YzRXZnFQ?=
 =?utf-8?B?eHFQY3NpWDZXM2ZmYUFBRlU5cDZxNWlSVHhFdUUwTlpHYzVBMUVnRm9oOWti?=
 =?utf-8?B?RjUvMnhBT0lBTjd1NjQ0Yi9DWEE1OEFHSEthRmRQN24wS0NWOG1PaE55M3lP?=
 =?utf-8?B?Vy9kMEVDMXFoaUwzZlVoL1lNQlJLY0gzY1NrMkViSHRGYUhFdWlubEJsRHl5?=
 =?utf-8?B?V3JUWG4xamczYkVGbksrZCtoRG9jMEtLSjdod1FiOWFMS2pWcVFHN2k1MEpK?=
 =?utf-8?Q?/0v3t8Ky2ne7HGayDyG9oHA+v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be3eb7b-e85d-4119-c5f0-08ddb4347a57
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 22:06:04.1801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZdCr6Phnd3UlDwMAN/XMK2zP0dPfJqoW++u0Dc5MFuRqXH40J7pk+uTvDiia/GLPHFFN/wiCtZ4WCmn8FRtNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8536

Hi Sakari, Hi Laurent,

On 6/23/2025 5:55 PM, Nirujogi, Pratap wrote:
[...]
>>>> I think it can live in the driver for now. Given that the device uses
>>>> only 8 bits of register address, I would store the page number in bits
>>>> 15:8 instead of bits 31:24, as the CCI helpers do not make bits 27:24
>>>> available for driver-specific purpose.
>>>
>>> I'd use the CCI private bits, the driver uses page numbers up to 4 so 4
>>> bits are plenty for that. If we add pages to CCI later, this may be
>>> refactored then.
>>
>> That works too.
>>
> Thanks for your support. We will add the page number in the register 
> address 15:8 or 11:8 and will update the implementation accordingly in 
> the next version.
> 
I would like to share the approach we are taking to implement the CCI 
helpers that support page value. Could you please review the steps and 
let us know if they make sense or if any adjustments are needed?

1: Add new macros to embed page value into the register address.

Ex:
#define CCI_PAGE_REG8(x, p)		((1 << CCI_REG_WIDTH_SHIFT) | (p << 
CCI_REG_PRIVATE_SHIFT) | (x))
#define CCI_PAGE_REG16(x, p)		((2 << CCI_REG_WIDTH_SHIFT) | (p << 
CCI_REG_PRIVATE_SHIFT) | (x))

2: Create V4L2 CCI context. Initialize page control reg, current_page, 
regmap etc.

Ex:
struct v4l2_cci_ctx {
	struct mutex lock;
	struct regmap *map;
	s16 current_page;
	u8 page_ctrl_reg;
}

3: Introduce new CCI helpers - cci_pwrite() and cci_pread() to handle 
register read-writes updating the page control register as necessary.

int cci_pwrite(void *data, u32 reg, u64 val, int *err)
{
	/* get v4l2_cci_ctx context from data */

	/* get page value from reg */

	/* acquire mutex */

	/* update cci page control reg, save current page value */
	
	/* do cci_write */

	/* release mutex */
}

Similar steps for cci_pread() as well.

Thanks,
Pratap

