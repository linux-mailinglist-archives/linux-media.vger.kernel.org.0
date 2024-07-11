Return-Path: <linux-media+bounces-14918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 791CC92E73A
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 13:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 303D6280DFC
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 11:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB819158DBF;
	Thu, 11 Jul 2024 11:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="htmRoY79"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021074.outbound.protection.outlook.com [52.101.70.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7336E37169;
	Thu, 11 Jul 2024 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698088; cv=fail; b=OeqrYAGcXMPuGEtuV/aLhARl/yVF22g4u2iVsO5/FFXY4wCzjeHFEr2xd3KR1jYP/PWCa7ZbBVfiUf5YsBSFAvLHl7vZ/FaCwbaohq6wyuJ9XfsgSbaE3jBYA/HColYS7WizF78hoBSrMos+dTxAEb+t4I5grPVMkHiLSX/oyuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698088; c=relaxed/simple;
	bh=RabkEaVhJWxH8bxR2esFJD4iQotVcvsjjttFFR6dR+M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CxKTxhXbRV1hOPEEAkXF0fyDfTF+jbSMk4t3vIU+Ee6f9nwzhruOkTISiKhQie6lFZLRKx0KVx7DNKKQdmhH3aHXcPLH9E3XaZ+VayP0JmHD7KKiXCWeUajOz60tBqN4sOWF9f0ocBAbUBRC/lENkgClCNHt2r7JzcWfZiyZb5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=htmRoY79; arc=fail smtp.client-ip=52.101.70.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9wZyhdukFGSp1+Ru4P5DXmSUQM9GG1v6FH5kaR9U+D17EBfB2ikb6lvVbEMkVwoBJQVH5cIc4pO9ArDnZElfdyHlf+MEs8NLrtGFS6ppmRKjYecVJ7AlWNK3VWoXJxBEsLixQgeRtFK7JGw+JSIYi2YiQqRnByArHYXKRlocoZnmJp2iRxLpRumKVfYILNlWudBbM58moPJgzKt/C5o6nSD7uzybWr/nZ1ntP+QAXz8n2PaC0Ux6GP3dOkVFmIxPDwTsNraAGu6vm00JEIh+nniNJmFTPaAsIEExTkBI7JRz43JtBqe2ss/skxDUuG/zaZJK/36a+bxIju3kPCEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jaj+mHWrHsJ0QBdhVTGVm0zMXmiWLnPWm9GYy2yXsBM=;
 b=niO60urxnng1P0jv3I7v/QNF834urhYgx67Aw2qUt29thU5CEBLet0kUXbycy+AxgWSfVic6lXEWIK/e9qY9oyWo8c3OMb653LAUkJdvjlQo+hmlWHdLKP9O7Yl56YdChsuL49Gf96G+ej3/0xlzX8hqxUDoEKYcPhV7UOKWRSXxtx+dib8Dw9qNfEmBRMlG8aq1yKbl1QB5XwCopT8cwaLR3wBZ9074MUDnzDBbk5V1g1EyVrR/xMLyfqf/YD23ClzZDbHySp7QXTdPauODix3vdvi98SwAoI5gSjDDFy0MT1qn3A38uPwwZ5kbSYZ1LBDe/ahMAtGxkmS4XBv26w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jaj+mHWrHsJ0QBdhVTGVm0zMXmiWLnPWm9GYy2yXsBM=;
 b=htmRoY79mlTPQgiSBzuceeLeJEHfPZWwG5bwb/6FCWQDs73n65WfvSrwUUbOu1dZQjbW9QHCPk52A7w6kRLaSKeuXHRgf2/WMjfMCv3pclOMh/cxIswD5yVVXulON6mNNbcuCs9iQeE/Qo+4Q/16KmXZLA92ZK31gCI1Z8JZg1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com (2603:10a6:102:20f::22)
 by AS1PR04MB9285.eurprd04.prod.outlook.com (2603:10a6:20b:4df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 11:41:20 +0000
Received: from PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8]) by PAXPR04MB8912.eurprd04.prod.outlook.com
 ([fe80::7a71:bd84:cbb9:add8%4]) with mapi id 15.20.7762.020; Thu, 11 Jul 2024
 11:41:20 +0000
Message-ID: <1051b88e-d6af-4361-a4de-95a28ddfad69@cherry.de>
Date: Thu, 11 Jul 2024 13:41:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ov5675: Elongate reset to first transaction
 minimum gap
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Johan Hovold <johan@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dave.stevenson@raspberrypi.com
References: <20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org>
 <20240711-linux-next-ov5675-v1-2-69e9b6c62c16@linaro.org>
 <fcd0db64-6104-47a6-a482-6aa3eec702bc@cherry.de>
 <aa20591f-3939-4776-9025-b8d7159f4c63@linaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <aa20591f-3939-4776-9025-b8d7159f4c63@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0221.eurprd08.prod.outlook.com
 (2603:10a6:802:15::30) To PAXPR04MB8912.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8912:EE_|AS1PR04MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 183104d8-7680-490e-7245-08dca19e61fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TG1KY0FYRHFqSkJQd0RtOGV4QkNrcWo2Qy84K2xRdzhQTk4yUkg2M29NaVZN?=
 =?utf-8?B?SjExYlJjWVcrdlN0TjhXRCs0YW1JMlRPRzZybnhFcWZncU1MRTVYbGpMVUR4?=
 =?utf-8?B?UHlDN2pIQXJoTmRTWmgvL0E5bE5VUEtnc3ZtTG1iWHE2Q0N2SUJ1MFBLZzJ4?=
 =?utf-8?B?ZlJ0b2lBMk52ZnBxMWJ6OTBpNFI4dk1IQjBnK2szMkRxR0NQLzRQdHNOaHdz?=
 =?utf-8?B?V2lXOHJNK0lIOHNlRlYxL0lQMlc5U2JDbWl6NFZ6Z3Q5Wm5LcU1kb1dBdSs5?=
 =?utf-8?B?eFlPN0x4WnFWMkxKb24xNW1ybnNxUzRteWhaemVQc2J0alRkRHExdU1jWGpk?=
 =?utf-8?B?WXVyem05UndHenN5OTZRTzNaZEs4UWVyU0tsT1psMktNcW9QSkdHQ0UwenVT?=
 =?utf-8?B?Q2EvUUxvclo5MTQ3YXBXcXBnMWU2TzU1VWFzS1VBbnVvekZkTi9XUlJrZFlJ?=
 =?utf-8?B?RTN6VjRUZHpFMXNFSzROeGFqbFFVQ2N1MWpUOTRDTDZGWi8vTXdlQlNMamVD?=
 =?utf-8?B?NlJoNDlzblFTaHh6WGJGdmVGcWYzS3lWM2hCVldPdVNwYlg3Y29abGYyR2pL?=
 =?utf-8?B?TGtseG1HV1BlMnU5Rml6WTBWQUJ5UTdEczdaUXZRTVZIMFlkWjBEWERQQis2?=
 =?utf-8?B?d0RQV29HWE5ySStaeHJmODFjbmVPRTNkVFNxdi9IekZWUXdRaldLTVlpVC9u?=
 =?utf-8?B?blNDMmFiVVRVRkRCSUpWTW1PbTd4MkFrQWhVL0NZRnhvdm50KzVMSHNLN3Br?=
 =?utf-8?B?Q29yOTBwZ1RKNm1ENEI4MHc4NUJPcDhTcStQQTZsWGwyUHZEU2ptejlaZFdp?=
 =?utf-8?B?Y1JENGsybk5mNEk0UmFYbHVvdjRXdS85KzRmUGlBQnYyTWk1dEt5dUNoZEJM?=
 =?utf-8?B?TVhKb1dGd2FDMXhySmRvNm1OVy9Sbk5hWmZwQzNpOGpxSjI2TVNXb0wrM2lM?=
 =?utf-8?B?VEhpQVJnck5OYTRrVGVVWWNxUFhBWTR2N3VoNEpvUzVldGM5ZXN2Y3hiTXVZ?=
 =?utf-8?B?U1daMk0wSEJpaDRNbjNSczBYbzdzWGZURGVZZmZUMk5lL2s0Nmw3SERSaGNy?=
 =?utf-8?B?Qi9QcmlKUlVZakVvQk9HZ1ZzaDhZdFRYZGhIY1ZpWjdqaVFoc3ViRzd6WC9H?=
 =?utf-8?B?SmJGNHR0RXlmZFpaNTJNYzhFNEVJUlBXeW9PZ1RtMVl1UXVaQ1NXUTl6TFNl?=
 =?utf-8?B?bG9mUnpKQmJ2NmtkQlRSZ2NsN0h2UlE0VDJhSTFOS0hKQzNFL3F2b3hnRmlw?=
 =?utf-8?B?dG9PbG1LcW5NL0RoOVVEd2ljaXdhbnNvR0ZGRDJybENwZktlekliNkJsbzFK?=
 =?utf-8?B?ZXk0YzBTaU1BVDc1UDB1c2tpZzFzd3BKdDJ3bDNEUG9kMlF4U1B0TFc0bkFC?=
 =?utf-8?B?YmRmUnkzRVBzRUpwMzIxTnBlcHRwVC9uZjB0VDQ4MHRYWStqSzVFNnMrOGlx?=
 =?utf-8?B?VmFYUHlrMXltTkVSdUgvd09yUEM1YnlvdTJkOGJRVVNkUWlJQkw1Q21FaC8y?=
 =?utf-8?B?OU9Cd2J3a2JqMWVGTFJ1Z3YwT2tuODFRY056UXNBUjk4aGlvdGo3TWF0ZnBW?=
 =?utf-8?B?N3gvbDQ0WmlnTjU1Nmxnd0tUMWNONDRPMXJBclNRWk5GaE1kTlJXRnhOL0tu?=
 =?utf-8?B?UnFMWXJlM3NwNk1JK1NIR1cxQThud0RBQ04rUVpNeGp1Q2N4RHg2cEthMThQ?=
 =?utf-8?B?bnhQN3VOTEl1VFdhTjJQVE1WRkI1YVhYMkJnK3VqZHdYZlA0MVRvVTRWOWpQ?=
 =?utf-8?B?MVRyM1cwWUlGeWFnT04yUHBKWVNzSm5rTVNnd1VwUVY0R1dKOU9sNE5jZXFs?=
 =?utf-8?B?TFZzVlFVVE5yREliSnJTZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8912.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlBGdGpOYStyNytUSlF3blczWDdlR1FjQlNyUElhVkJYRndTOXpWeGp6WGdY?=
 =?utf-8?B?VVNQTTNRQmpnb25ya3JGMTd0NFRkdkhmWkp4bTJlWG9BL1NtdmFBUjJoRnNp?=
 =?utf-8?B?SzlUYkhUMW1vYktyUWVpa1Fsdnh5M1B6bjhka2pRRndHQ0RHV3QyVFpYUTlx?=
 =?utf-8?B?dkxYYWZtdnVGVVJMdGhaNndSMWduMzNWYVRZSVUrUExkck14RGtaWU42TjZn?=
 =?utf-8?B?TXkwendaV3V3YkpKYVJ6WTUyV0kySzcxUlNWelduajVXMWgzL0RlR3FCSHMz?=
 =?utf-8?B?Q0Y1UWpCQjZWcFVoN2dSNTI3S2VNQ09ZQkpRdkVJNjFxWWFCZzBQWVdVTXZO?=
 =?utf-8?B?UmFFd1JiMVB1UTNFZ2tjMGJLUitxVmkwSVlBV01XSlQ3Qk9PUnFMNmpyaGIr?=
 =?utf-8?B?RGgwL0RsYmM1MTFuaTdNcWtZSTBWZHZJUmp2K0c5cExKcGdYL2tlRkVrcXhP?=
 =?utf-8?B?VEhUSEltSWRYcHc4RGF1MjJhZ0kxWHhVMXJhR3ZadFpXZ3cyY3k3NEdwZlda?=
 =?utf-8?B?dFZhVk9MQUpQUUZxcWE5b250dU0zNjNhcTY0UHBZTy96OTZUcUlhU3JES0V3?=
 =?utf-8?B?RTJRbkxtUEE3VGQ0VjdBMlFlNnViRDFLU3d3YVhTU2NRdjY1dU5FMEZQSlR5?=
 =?utf-8?B?N2xqdm02ZTZtY2hZSlZIK1NFektaZjZ3Nm41Q2NGbW1kU0xBNk1xODFlTTNP?=
 =?utf-8?B?Z09IR3dSVFNGVTVqRGhoWUVLajZTenlrN3VzeVEzR0xkYWgzaGxyZTlRVk84?=
 =?utf-8?B?dytZOWhwTVQzSGV5S2szbmZpbTFFNHZoZTlLZDhKd0JRM2MzL1psZGVybUN5?=
 =?utf-8?B?VWRQcm9OSS8vU0Vmb0tLUmRSUjcwbURSNjhJWVFHeFVjbUdNQWZJajlTOUQx?=
 =?utf-8?B?bXRTUjRwQW9wTmc5UTBWeW1ZRjJBT0Q1aHRMM3B1aFkrOWhMRmZUUWtqZFMw?=
 =?utf-8?B?NThsOVhqUXFHOW9LN2dyTHZGQWlkMXg0TnZtT2NBdTc2d0dLaE9ncGFOYm5L?=
 =?utf-8?B?UW9XbFE2S3BmMFQ4Nk0wYVByUEZHNkdsalQzQ2R4OTZnUVpBWmgvcWxrcVNy?=
 =?utf-8?B?ajlVT3YzZUdCMU4zci9zYzdCbHpsQlJDM0Q4WHFLZDN2NVZacG9vbjhreEV1?=
 =?utf-8?B?TWVwTlIwNWpDR0tORmxTSnpBNXVhV2ptVFBGUXpsRllqZmE4VjdKOGwxM3Bi?=
 =?utf-8?B?NXpWUUpTRUExeWk2OFJ0TDRPOVVkWUtodldoV0txUk0vQnlZU0p5b0pBNDBw?=
 =?utf-8?B?Y1dVVmNuZVVZa1UvVnY3ZkwySU0ycjEzWFRpRWZzc0JSRnlYZTRBRFhIemtN?=
 =?utf-8?B?ajNRejdvdWZ1L1pGWUIwY2JLZlNZZS9MTS9vd1Jkem5sWEI4bzVNVTRkWUhO?=
 =?utf-8?B?bFFBZlg2Z2ZhMkVhVk9NWjdGc3VVamxsdkRzMjhIa2RPWElycG9qOTBLKzI3?=
 =?utf-8?B?RzNuS0FPb1BDbnhrcFN5cjVFRHNIWG1vczlBUzl0eXp1amhHS0tiZ1cxcGZI?=
 =?utf-8?B?WXBCcWFGK1k4aFhSZXNqUHpLeXYvRnRIdVFnaElmd2RKODNXNjhma01INWhB?=
 =?utf-8?B?NnlxZ0luYk1sOUlRYmpYektBK2xwYTM3M2FGMDRiQ0JLUUxFUUQ1TlZFTzFu?=
 =?utf-8?B?MDZPSk5rSFozTlMvQ3o1K3I4Z21UenFpQTRBZHZNQ1oyMWFWZUlNbzg1akNo?=
 =?utf-8?B?VWF0aDB4UjBQdlVKdDQzMlhkMFRwdHMvbXRLbTh3N2JDS01SNHFabUZoVFlo?=
 =?utf-8?B?c1VrZm5pR1hudGZXcCtrSzdOL015YlBwME1sSVVOSTJPT3lvMklYT25uTFNP?=
 =?utf-8?B?NU9WaVB2QWNIZEYxNGxWUjZEd3NjOXZOdy9DVG4yU2ZkVGN2UFpyeGc5d3Mv?=
 =?utf-8?B?RVZUTnBIUDNGelhHNFlCRmZrSGhET0JrMm9nQUFQSUxOSHk0bGtYNVFSaXc5?=
 =?utf-8?B?Y0cvZ0ZGL0N2WXpkNWNvdTlhZVVaMUZmTnJaaENtTW1WYXljaVlleVBmZUpv?=
 =?utf-8?B?ZURBelBQSlhKV01ubWRWTjFsUlluclZJdHVDQmRienB3ODgzN1hIa1RrcGhZ?=
 =?utf-8?B?MytDUm45WHFOYmVLYU1IQ25vODErN2xTZWJrT2ZZSys2Qld1WlpPVmlvSE9u?=
 =?utf-8?B?SHNDZFEyVmQrOFJxbmVZdHJmNDIwcnJUWEI2LzBOdWVFam9YSjNtLzlqNGQv?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 183104d8-7680-490e-7245-08dca19e61fb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8912.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 11:41:20.1854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHaX87TLRXIKmXykpvqawiiVDI1G9xRJEyA0kYkEoxKVJQ8zc60xK33WT1SSLQv/pmNKYRJ1uIcsteVfNB+gZmq8aFt+dSNZgoI9uUguUpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9285

Hi Bryan and Dave,

On 7/11/24 1:22 PM, Bryan O'Donoghue wrote:
> On 11/07/2024 11:40, Quentin Schulz wrote:
>> Hi Bryan,
>>
>> On 7/11/24 12:20 PM, Bryan O'Donoghue wrote:
>>> The ov5675 specification says that the gap between XSHUTDN deassert 
>>> and the
>>> first I2C transaction should be a minimum of 8192 XVCLK cycles.
>>>
>>> Right now we use a usleep_rage() that gives a sleep time of between 
>>> about
>>> 430 and 860 microseconds.
>>>
>>> On the Lenovo X13s we have observed that in about 1/20 cases the current
>>> timing is too tight and we start transacting before the ov5675's reset
>>> cycle completes, leading to I2C bus transaction failures.
>>>
>>> The reset racing is sometimes triggered at initial chip probe but, more
>>> usually on a subsequent power-off/power-on cycle e.g.
>>>
>>> [   71.451662] ov5675 24-0010: failed to write reg 0x0103. error = -5
>>> [   71.451686] ov5675 24-0010: failed to set plls
>>>
>>> The current quiescence period we have is too tight, doubling the minimum
>>> appears to fix the issue observed on X13s.
>>>
>>> Fixes: 49d9ad719e89 ("media: ov5675: add device-tree support and 
>>> support runtime PM")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>   drivers/media/i2c/ov5675.c | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
>>> index 92bd35133a5d..0498f8f3064d 100644
>>> --- a/drivers/media/i2c/ov5675.c
>>> +++ b/drivers/media/i2c/ov5675.c
>>> @@ -1018,8 +1018,13 @@ static int ov5675_power_on(struct device *dev)
>>>       gpiod_set_value_cansleep(ov5675->reset_gpio, 0);
>>> -    /* 8192 xvclk cycles prior to the first SCCB transation */
>>> -    usleep_range(delay_us, delay_us * 2);
>>> +    /* The spec calls for a minimum delay of 8192 XVCLK cycles prior to
>>> +     * transacting on the I2C bus, which translates to about 430
>>> +     * microseconds at 19.2 MHz.
>>> +     * Testing shows the range 8192 - 16384 cycles to be unreliable.
>>> +     * Grant a more liberal 2x -3x clock cycle grace time.
>>> +     */
>>> +    usleep_range(delay_us * 2, delay_us * 3);
>>
>> Would it make sense to have power_off have the same logic? We do a 
>> usleep_range of those same values currently, so keeping them in sync 
>> seems to make sense to me.
> 
> I have no evidence to suggest there's a problem on the shutdown path, 
> that's why I left the quiescence period as-is there.
> 
>> Also, I'm wondering if it isn't an issue with the gpio not being high 
>> right after gpoiod_set_value_cansleep() returns, i.e. the time it 
>> actually takes for the HW to reach the IO level that means "high" for 
>> the camera. And that this increased sleep is just a way to mitigate that?
> 
> No, that's not what I found.
> 
> I tried changing
> 
>          usleep_range(2000, 2200);
> 
> to
>          usleep_range(200000, 220000);
> 
> but could still elicit the I2C transaction failure. If the time it took 
> for the GPIO to hit logical 1 were the issue then multiplying the reset 
> time by 100 would certainly account for that.
> 
> // BOD set the chip into reset
>          gpiod_set_value_cansleep(ov5675->reset_gpio, 1);
> 
> // BOD apply power
>          ret = regulator_bulk_enable(OV5675_NUM_SUPPLIES, 
> ov5675->supplies);
>          if (ret) {
>                  clk_disable_unprepare(ov5675->xvclk);
>                  return ret;
>          }
> 
>          /* Reset pulse should be at least 2ms and reset gpio released 
> only once
>           * regulators are stable.
>           */
> 
> // BOD spec specifies 2 milliseconds here not a count of XVCLKs
>          usleep_range(2000, 2200);
> 
>          gpiod_set_value_cansleep(ov5675->reset_gpio, 0);
> 

I meant to say this gpiod_set_value_cansleep(), which is logical LOW and 
not HIGH, brain not braining today sorry. But the question remains the same.

> // BOD spec calls for a _minimum_ of 8192 XVCLK cycles before I2C
>          /* 8192 xvclk cycles prior to the first SCCB transation */
>          usleep_range(delay_us, delay_us * 2);
> 
> The issue is initiating an I2C transaction too early _after_ reset 
> completion not the duration of that reset.
> 
> As I stated in the cover letter, I tried a longer reset duration, a 
> higher drive-strength on the GPIO as well as I didn't put in my cover 
> letter, inverting the logic of the GPIO reset, which unsurprisingly 
> didn't work.
> 
> No matter how long we hold the chip in reset, unless we give more grace 
> time _subsequent_ to the reset before initiating an I2C transaction, we 
> will encounter transaction failures.
> 
> This is a fairly common and logical fault if you think about it.
> 
> XVCLK is providing a clock to the ov5675 core to "do stuff" whatever 
> that stuff is. Bring up an internal firmware, lock a fundamental PLL - 
> whatever.
> 
> If we start an I2C transaction before the hypothetical internal core has 
> booted up then - meh no bueno we'll get no transaction response.
> 
> That's the error - speaking too soon.
> 

Yeah, that's what I meant sorry.

> A little like myself in the mornings, cranky before I've had my coffee 
> and unresponsive.
> 
> ;)
> 
>> With this patch we essentially postpone the power_on by another 430ms 
>> making it almost a full second before we can start using the camera. 
>> That's quite a lot I think? We don't have a usecase right now that 
>> requires this to be blazing fast (and we anyway would need at the very 
>> least 430ms), so take this remark as what it is, a remark.
> 
> Not a full second, a millisecond.
> 
> 8/10ths of 1 millisecond instead of 4/10ths of one millisecond.
> 
> 19.2MHz is 52.083333333333 nanoseconds per clock
> 
> 52.083333333333 * 8192 => 426666 nanoseconds => 0.426666 milliseconds or 
> 426.6 microseconds
> 
> So our post reset quiesence minimum @ 19.2MHz moves from 426.6 
> microseconds to 853.
> 
>> The change looks fine to me even though it feels like a band-aid patch.
> 
> I mean it's not a second - if you feel very strongly that 426 
> milliseconds * 2 is wrong, I guess I could add some more complex logic 
> however I like this simple fix for backporting.
> 

Somehow I read microsecond, translated this to ms and then translated it 
again to millisecond. Don't ask :)

So, maybe this is all too complex for something that could be as simple 
as 8192 XVCLK cycles for 6MHz as Dave suggested I believe. And have some 
wiggle room added in case we ever support 6MHz and it has the same issue 
as you encountered with 19.2MHz (or whatever was that rate you were 
running the camera at). 1/6MHz * 8192 * 2 ~= 2.7ms if I'm not mistaken. 
So maybe go with that with a comment just above to justify why we are 
doing this with hardcoded values?

But ok, almost meaningless time increase in the grand scheme of things, 
so fine with me :)

Cheers,
Quentin

