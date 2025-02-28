Return-Path: <linux-media+bounces-27179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40976A48D99
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 01:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 368F13B47E7
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 00:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC841119A;
	Fri, 28 Feb 2025 00:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="YYg0xe4l"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2038.outbound.protection.outlook.com [40.92.41.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABECBC2FD;
	Fri, 28 Feb 2025 00:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740704353; cv=fail; b=BC+2dexaA36HbRzesI/l6Tpeb7JAGLnE5qSeN12iGPLhm+9WDl2NSLcUEp1Xo+7tnb7mlOv6If355EyRhTPhCYe7E3dOZupquDeZkm2s+K1kpHmk+j0nYNnf+L8xk742GmdwB1ukjcnIOw6n3NWHa4/m56D6yWW0/9xmCThxiMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740704353; c=relaxed/simple;
	bh=m+KE4YLjRji8O+4HHIz+GIi8Q+13u/Frf8plE0F+B0I=;
	h=Message-ID:Date:To:Cc:References:Subject:In-Reply-To:From:
	 Content-Type:MIME-Version; b=e3U9SoBssQKhdJbzfRyE8et6QP4G70XXCtIpKGqphlcQhsrVWe2R4aPJp8ENYoaxXgEk6sw+GxA3HJTcEN/SqlTU/werghLEPRqPUoVGQoZo+LetUced+E/jxQeug3yoUaC822vSi8Evr4Jn3J+hZMaSM5wyaJ+qXPTCkPiGpXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=YYg0xe4l; arc=fail smtp.client-ip=40.92.41.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opQIRDGRZoYFezWi4dX1FP0MsXPpLhItyeO0tOJGIYqiNzBus/W8yUf3riRJnPSoLP9jEh8Pyv30skUZ5MXa8s8YZ7Rh0i0L61JXIT6we3mH8D7ZVT8TLtJ3aOBq5pel1mjT8q8voptmp2cV4OOglk7MrRMx5m8QxRYGFB/xv4gY/McvQkuNzlY/3tYc3vLr/PHGjoQXOWjsbdPppPFDkhRQdudk+UkM0YQ5PfcXRMrMETiIIZLFvFK5ZQZch/K+qtJaotkyNHB7tRwb3CX8DVoLGGsvWARWt51TeCCuYofcaw8R90W8zItgEbnPuyRmvRsg0UqtZpECqOrgrdJtKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yc5ODcdSxpYb3o79BL0IJCH9WapZbYAu0OSFja97vTY=;
 b=UuAMT+w/71iZW1+nmIqQM86CcFxmXGV+PeS3OAGrw9ycDzlHJbqXqKioPr0sudksKtMLtIv8lvj3QCz66foUZ7bdCG+MlaH9/OoekuC2AAqJxqnG5/bWVCUeI3rCJCL3UfiaMfyqpbbs5OUVG9SESx0ZR4rBFEEbFUOhtesc7SNOq1MTU4BuoDxCRogIKUughby4+urUvIqqLj6G/lApL7X+RjHjYfbBJ5+q+U1n9YcZBhasSqGHzbUgh+L9VPE6Ru0UwM7geOA3MXDnp1AZguh/sE1mPZixLg/woUbnr9gCBvgJHrxxGJuE/2OjtZxcQUf41VDaVEah0DXS1SKAGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc5ODcdSxpYb3o79BL0IJCH9WapZbYAu0OSFja97vTY=;
 b=YYg0xe4lctUzrPdBO1zew3EDOgEHNgFa/+Q9a9cCdgzF4AM6YFtFsrskQbg3FwAUoX+4LKQCFbkx9pxB/CbsWl3ykIdLwadrJ6wVH1SNHDkIv084S25SmV8lQcQE6W7iFVjFoXd7lQDUTI1SlmneU/zRqCxrkenUZQCbQVp8eajKQYNWKqpddyFtmm5H4bdYO7hUH2s2y6bIjO3XvafDZTlXbKxFB7oqy+koUQHw9jZl1v4HHyy7n1biL+VoJ00/azQD2gLxbD1xFNUrErCaBBNRU+tI/5W1wn5rs6d8SrG/XAqKcbG+48eJ13XtQ+IiNN0az/ReA1AoAgSkaWvCUg==
Received: from PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 by MW4PR12MB7336.namprd12.prod.outlook.com (2603:10b6:303:21a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Fri, 28 Feb
 2025 00:59:09 +0000
Received: from PH8PR12MB7112.namprd12.prod.outlook.com
 ([fe80::527b:a523:24c6:a1d4]) by PH8PR12MB7112.namprd12.prod.outlook.com
 ([fe80::527b:a523:24c6:a1d4%4]) with mapi id 15.20.8466.016; Fri, 28 Feb 2025
 00:59:09 +0000
Message-ID:
 <PH8PR12MB7112FFF11030DA5FB31A4DF7E6CC2@PH8PR12MB7112.namprd12.prod.outlook.com>
Date: Thu, 27 Feb 2025 19:59:06 -0500
User-Agent: Mozilla Thunderbird
To: hverkuil@xs4all.nl
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linuxish@outlook.com, mchehab@kernel.org
References: <99cc3844-54bd-44f5-88c5-9570fae709a7@xs4all.nl>
Subject: Re: Avermedia DVD EZMaker 7 video distortion on capture
Content-Language: en-US
In-Reply-To: <99cc3844-54bd-44f5-88c5-9570fae709a7@xs4all.nl>
From: Randy K <linuxish@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0135.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::32) To PH8PR12MB7112.namprd12.prod.outlook.com
 (2603:10b6:510:22c::15)
X-Microsoft-Original-Message-ID:
 <a2fd78b3-97d8-44af-a50e-725e7b9e7eaf@outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7112:EE_|MW4PR12MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c1ee5a-2c61-4f51-5ef3-08dd57931b76
X-MS-Exchange-SLBlob-MailProps:
	uxBZ0XvJeHAmcrVv8d6gCuVw4bM+sLD7nR8tozHOqsadVqdx5IBqGOQPxsnPhL5dbWwjj/I4Hx+rpU98szxzVmXkySK0vEPRmLEJ5ySkLuRnPKq/UFRBJBXxMJ/twDQrjhL+Z00ObEuYsmauq6jeXVSGvGndAiHceV6uQEwOn/SjF96BZOMiNHEoi4cAbx9kzF/5QFpaMqTG1R2DcdqWPUPcASMbhPRNyWLsTaJgNTRaFlv4SMRfZzyLQac/YJeEL5gPUfrEX451bxYRbsrUOf7pdAAY0dNvijgdAOsMsZRPhitIDZ1jf21ZX+/oXMH6/CFaLMkomLJkEqz1ZitOoLs6onsrM0FIRsSjD51yanSvbj9X5vcrx2RIEkUbdaBrrKimES0922zqITmrH4IVnoS0i3x9Cx0+9NHNaOB50O9A+7CtUZliN/copXxLLd38IQU8Sz1e5R7HEsUanCEyAxflTP8rJQUHON8Ye9yRGxOOnFBXaep+xaAR3HNs9diUYHr+g1fortWgHBVZFgDEiWl3rBXJEFiaUfc+iAFHNNigOUdcJX3sFednhsY16xGUH3TH6ixixsh8K/6QeSnlZ42ncF7anton3W56KmsSpWiWzf4PmZOUg/baPT9/w6+tyGUgvnnFJ9ONhynpmmsCMw==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|7092599003|15080799006|461199028|8060799006|19110799003|6090799003|440099028|3412199025|3430499032|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3JOWUY5QTNZSzZEK2U4MllQc2lOWTE5bmd3YVl6bm1pV0F5ejE0MEowazBE?=
 =?utf-8?B?MGNOSUFRcHp2NTB5KzRXMFd3ZTJOVkYyNk1PM3hHRGorUzB6OFJ6RG1LaGVN?=
 =?utf-8?B?andDWlVkUm0wWDFMSEJiL0tNaVZMU1dvMzVLRlVnZWtTTE4vRWR0bWplVUx4?=
 =?utf-8?B?Q3ZRZXNvSk53aDlaVTc0VGlRWkZSN0FvZkFmcXJWamJCZlRkMmhnRDlRYU16?=
 =?utf-8?B?d21SOGFJMldiWUpZRVRyR1JMOGo0NFJ5Znl3dmlDQVNUei9XM1R2MmdGVnE0?=
 =?utf-8?B?RjltdFFvbHYwRjlQRU9PRTZ4SjVuZjFmRE5mblcvbEFNc2JzSFFaL3EzNmFC?=
 =?utf-8?B?RlNROVpnQS9DcXZvRExmWk10VkxBaGFieGpZbnFzczdIT2Q4K0k5Lzc3RW5v?=
 =?utf-8?B?K1NWbDhaalF2MFM1THBKRGVrT2k2WGZDR3AvU25KdDVrR0hrUk1IdjVZclZw?=
 =?utf-8?B?akVkVGVGOWI5Rktac1JiSzBvcDZyMVM2OTYzelVZY2lTNTh5OHROQ29mcWdk?=
 =?utf-8?B?U3ZuR3V1bUgvUS8rVGQxZTB3dWVnU1pmU24yUE9hVVFZbEpxdlFOTWFBVWl1?=
 =?utf-8?B?RWd6cEZsRW5GUFRIUTZOVEovdkF0ZnNmWUpLLzlCUnN0TERzRFhSSEVZc01L?=
 =?utf-8?B?UXVNUmdYNm1tZlVraGJvZVVnL1owdTRBeCtkQmZ6d3hpZnN3SGxFU3hyK2ZY?=
 =?utf-8?B?Ynh0ek4zTXk5Z01FZEVnUWgwVUNkVVR0ajhrYlZIZGdSLzl0Q1VMbzN6QTE2?=
 =?utf-8?B?UGhzRk9VVlFBTFoyQU8xSGJBSThISUVNQnA3TUVDU203RUlaZFhnYnI3U3NY?=
 =?utf-8?B?OEY0V1FWOXlGS2Fibkk4eUpIZzN6V1pVWnVyN3pUSEkzMzN5Q3RseUwzRWZL?=
 =?utf-8?B?a1RubXpZc1piN29WRUdCRkFUUGpqVnRsR2xxdWdPTDBKZUpjZnIzT1cvVFRn?=
 =?utf-8?B?SzlZTDRybE1BUmRpd3E2c3I3RDhWVjY0N2RaYWZkL3Q4aDZ6WGl2anQwcGt0?=
 =?utf-8?B?eGdBRUs4TW5POXRleDJtY2xpbnFqd0dzQUFIZURDUUJHc3pFQllYUmZXTmtM?=
 =?utf-8?B?OEUrVC9IK25td1V2RnBoMHBuWjQxbnl4anJHL0tTS0lwTm8xd1pDSkZHM3VF?=
 =?utf-8?B?TGxIRzJZRzhTVDdSK3RZdWNSa2RXY29tTHZCdGtMNjN3bm94dDdFYWJMOTU0?=
 =?utf-8?B?Sy83TjYxNTFKL3BDOXZqd3Ftb1ZNUVpYcU5aRnJkcm9maXA1b21uMHRKYzRL?=
 =?utf-8?B?aWJQWFl6SFZydTlwZjNabDBOU041eXF1UDFvQXdDU3R4RytmKzYzZFQ4OWRR?=
 =?utf-8?B?d1k2OEZXS3BBTzY4MHY3eGR1MjFRR25qak5yWlFVQXBUdENyWjIwMnBPTjU1?=
 =?utf-8?B?MGhXTG1PNTVaN2RQNHBzdEJYQjJWdFB6NHZuamkxdldPNWlocUoreDBxQ0lx?=
 =?utf-8?B?VGtFQ0xSZHl5TktPOHRDNC9PdktjZUg2cjV0SWd2ZkVOSTJXaGJXbGN5eUtF?=
 =?utf-8?B?Q0VmTDhhYXFqYWEyNDdCS2IwNTJYaWRpeVdLeEtBdVZEMTUvVnZXMTRGUXBr?=
 =?utf-8?B?R3Z0Zz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFc3OENDZFE1Rk96VURDcDhtUUVtM0M4a1NUWGJHS1dyM1Y0cG5ZeWcrdURP?=
 =?utf-8?B?ZDhOSFdMQ0xVYllFcGg1QWdQU1JNV2pBU2g3WDZWYWhXcVVkK2YwN2hmZWFU?=
 =?utf-8?B?ZmJJbHR5bGlwbXByNGpWOERxUlNBU1BiY3RxYUI3YmR4SitZVFVXM25VVDd1?=
 =?utf-8?B?OTh4ZG8yN1VVUkZOdStvVGw0YVJFNnZ3UVFOaTFVcU1NL1JtWG01dE5hSkcv?=
 =?utf-8?B?K0RiK2N5akpERVhlZ2hXK05NL0c5czR1dEZzQ0RqR1FUU0NQTW1VdHNCbENR?=
 =?utf-8?B?Q2lNQ0EzOE1NS013MzRCZzFPSFBuSFMvUUlQbC9XQUdiSW81OEN2MkpXUTR3?=
 =?utf-8?B?dVA2cXZUajE5UitCalpwYk9WdE9JaXR6MnBtVWJQL1dlSys5Zml1N0tIaWRG?=
 =?utf-8?B?YW8rbkdMQVJmU2Z3dTM5SXZIT3ZQZ082R0IvVjE5NU5TVFhsNXRTV3RkekZT?=
 =?utf-8?B?ajAyYjhnNVJMSDVQTE5Vdmpua3lHWDBoQ1FjRFhQZHZaQ0dFWnF5TDdFRzhD?=
 =?utf-8?B?L3FGWGNFZDNQYW5LcU13aS9iWWZNalFEZ21vZFFiM2oyNTkreE9xTkVNcTA1?=
 =?utf-8?B?aEc0eHdYdjZzc3dGNE9wTCtnM0ZiTkNyNHlUV2tqeWlydG9UQXVTU1VwcFBo?=
 =?utf-8?B?ZHF4VDQrQjdIUHc2UGxES05OOXVuc3ZvVzdLQktXdnpXcWtJT1JPQ0FJTHh3?=
 =?utf-8?B?R1FIMmtEYmJ0QUU3N2dPaENnazhIcjJnNDdvamxGdmpNeTJJeEZsWmttSGMy?=
 =?utf-8?B?eXN0VmRRa0c5ZXNKSnJxMlRTdS9XL0RqTzM1dWh6b0pOOEx6UnVWRTBYSEFl?=
 =?utf-8?B?T3FKYnRRRGpIeHpMQU1SWGpKZFgxRnFSUEpTWW5CQzg3U0VIWVF5aVBlUlUx?=
 =?utf-8?B?cDZOaUpidE93T2tUMytEMGFtN2hJNHlEUkdsbSs1OTF6aHhyR1VWdk9ORzBx?=
 =?utf-8?B?UGtmblJuKzhCbGROSndqQmJWRW9mZ3ppdWRwbzNXWmNRTUF1VVdONmtBM2FV?=
 =?utf-8?B?NEgyYmNRK0xWeFNRa2VNcFkrTkg4NmJ5dEdydTh6bCtCWnZWY0ZSSXM3ci95?=
 =?utf-8?B?ZEQyZ3ZNa0dLU0pMZHJnS05rbzZNM2Frc2U1Z0I5WU0xb0pkMDAyR1pOVjIv?=
 =?utf-8?B?TjZtQTdiLy9sa3Fzek9lYkhqeFJSWXJINjZNY0dLZkRMdFoxY3R0ZkgzejFk?=
 =?utf-8?B?cFJWL2xBMnV1NDdBQ29CS1ZHQVl6SmhqMCtmRjJuT2wxaGpZOUVlNEloRVJI?=
 =?utf-8?B?UEtxY0RjM3doQkdMMVk1ZVdVT0JSYUhIUXFnMVFPSDBCT3RGdFBZSURFbllu?=
 =?utf-8?B?TSt1RmJ1cUpkUVRlWUVMRGdaMldtTkFOWmxFK1BmRUlMeGJpbmgrb2doOERW?=
 =?utf-8?B?VmxabExLbjdGL3lOMEo4QUozeS9NUW5WYnpGMUpvZ05ybUdZVlN4eTFmSUFP?=
 =?utf-8?B?eHA2VGE1ZUE2TSs3a2p3WDRBY3FRUXZFL2x4Ty9OVHJlRUV1MDZvelp5MzEx?=
 =?utf-8?B?RmxlVFZzZy95SmUwSTlmZ29yTUlWYXMrb3RVak1oZnl1TWNlT08rTHgxenZ1?=
 =?utf-8?B?NTZZSWVWd2FZRWJkVFJZYTBPNnplVEpyMVVrNERSRnJqWjhqREpYSzJpeFht?=
 =?utf-8?B?c01Ea0M3UDVlRU1wa2psWjZ0aytpalhsa0s0cHVvODVraG1VSDdKUzhlNlBr?=
 =?utf-8?B?Z2lEZWxXaDdOWkVxNnl1ZDMyWCtqaWRsS2E0cG5xdW9LbjBGaFA0MTRnPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c1ee5a-2c61-4f51-5ef3-08dd57931b76
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 00:59:09.2997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7336

I mailed the INF file to you Hans.

Please take a look to see if you find anything there that may be 
helpful, and of course, your help is very much appreciated.


Thanks again Hans,

   Randy


