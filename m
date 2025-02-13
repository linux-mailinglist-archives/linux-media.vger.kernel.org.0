Return-Path: <linux-media+bounces-26100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19479A33567
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 03:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA4B4167FB5
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 02:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28D8153801;
	Thu, 13 Feb 2025 02:17:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04B614A60F;
	Thu, 13 Feb 2025 02:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739413069; cv=fail; b=PeBJCXQNpPXuOpS0jOHxwU/ITPydRZ6W81wBmLmyw2+vb1shUcEg/YmbPn2rbAUXrsfTEV9ABZJdOXELE6CMpR8WmsY4Z7Cjr6qHeq8anEbaKfRfjnA5Ehef0PU1K31qjRMsZWs0LtsSibv9LTeD0NYaqiYMx9SXCFLMuwfNIBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739413069; c=relaxed/simple;
	bh=kma6rV52MOuiRgGyySgcQCUxRyttS59jmrFKgpeq/ho=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RCvIlc+ghAN0d807Sfk0YfQoRb8cBqK4nEyjJRd4leLsNcWCWVWMglwBPVswZG/HwJnh56sMG6546qAvDgvc42g/Ns+4tbnAIEt/YLy7UpxFi4itKSf7jo1WCqxGq/Y9GLMh1HFFtOkGiGbscG095xXtoRrOseN6fB0S6Wa0jnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D1i7u5002673;
	Wed, 12 Feb 2025 18:17:28 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwtqag3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 18:17:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uikhh32bzmaKle9TjzBDzOBnu05nRTl3N98aWIcq7KXFCX76ez7FI8h8/no8VJZ8NETZNyeB7dTihZgaRyppQHgIC9a4EDMCnaY9VoxwyUGVW8sZnivKidMNeZdYg0f8/D/SOO8XKxvI56YbZkpdHl9SWDJ1zVj4AlOCTTk2jwd8eJjbxxIO0rV+TvkT5P5kI3eMYKLpI2ZifHpuJ738IN9r+bx5wcQOF5ofBdlkgVfJrlicqmBEk+fHAm5TdS4ywu1QwjXnmsu/j6i5t8sQOnKpIo/3jz7k7II/nAXudvjthCTl8DnHU6jG+uLG1aeNbXpozEoWT/Y5FxEAp3rrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjbxLXKnEv4irgKL5/eGh2+iK1k9dX2QN903G4fDuUs=;
 b=AiVFqcUzzaWxAAsFkYudDGKx41E2VbVHPeDChfC47TNH3oqpP+UEryX8ZRIuynzi70sJB9aFp4SKE8UrDUBVQKGQ7Y9b5PYFq/5aZrc2zX9AMKbq2qNU1f+9nxj2s6//FiKMx0SmEITYEmVUE1Glu+ZrvTVsVTMMO4isWGox1sXPnaupnlLJBk+2U+GQzNu8QSCPN2L/GdAuVekFAOMQexEnj+uPjhZv9oo/rIha0GJgBcYkGn4HUF8RD0DagiuURaKXiEbecQL1x3p1XW1qoiG7z5n6RXlb07rpUCIU0dQ07XVrmoPT+nydWAXYsZRlww3GFXE4Jzd8pKoLdAa2ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by PH7PR11MB6546.namprd11.prod.outlook.com (2603:10b6:510:212::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 02:17:24 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%5]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 02:17:23 +0000
Message-ID: <0a2719ce-3866-474f-8c84-fa1fff2a0fca@windriver.com>
Date: Thu, 13 Feb 2025 10:17:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: coda: Add system resume interface
To: Philipp Zabel <p.zabel@pengutronix.de>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241221031455.1361778-1-xiaolei.wang@windriver.com>
 <e2cd8a249820913562350c786116d91d447f437a.camel@pengutronix.de>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <e2cd8a249820913562350c786116d91d447f437a.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::11) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|PH7PR11MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b02625-49c4-4840-902d-08dd4bd48d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1R6NTJoMGVrT29lN3lTem11TzF2bjd6TWhaa2RxNFAvS053ekxESkpPY0pv?=
 =?utf-8?B?VTdmMVdzVGtmSklaMzhvNnBwN0xZS3BVYzJzbnIxMGVXMndJM2duWmZSc3lU?=
 =?utf-8?B?R0xzZ1VsTkNTbHo1VjdIY0FoOHByUE1CcGlRdk9KQ3JqQjdHVW1oSG15aGk0?=
 =?utf-8?B?MFNHQnVZbFFMTW1FY29VVE9ZZlhsc2dORERrb1RkZUVFZ2dsREloVjF4bzVo?=
 =?utf-8?B?Qlh1b25YYktBQW15UmN3NXZqVE9wTFNXMXNDRmQ5dEVCN3ZPTHZCa0pjS3Jk?=
 =?utf-8?B?aDFYVk83YlJCUzdIcE9VQmZHQTNhU0dXbVpkOUJHVmRkNWNZUDJFKzVhTXgz?=
 =?utf-8?B?OUZzSXFHME1ZM0hka3I3clowU1Evb1k3ektuVHVpZENTZEtMMExKR0w0R3Qx?=
 =?utf-8?B?M1ZsSUlvUXluTmhmOWkxeXcyWU1vVmJiQ1BOcXQwSk1nbjBoN2g1NDRiM3gy?=
 =?utf-8?B?TG9mL253VmpOeHB0R0FQYnN4bzVwQ0NhWFVOeW1IK0xUTjYvME9RVzNURVgz?=
 =?utf-8?B?bXlWUW1jWXNOMTUya0RWck0wdmYwVUJtNkxsVmVDWDRFSi9aWGt1UXV0dFFq?=
 =?utf-8?B?czlMK3pnS2xIZVNXNkF6dnhTTUpXQmw0NGtvQ1VVRGtlUDFIZjB4NnBmMlNM?=
 =?utf-8?B?TytFWEovZ1RYZFFCTytuc0hlWEE3UURBS1U1djZSRE1SQnpWMWZyQml0bmNo?=
 =?utf-8?B?OXBzUElaaDhKY3E3bjk4d2lKbWdjZjV5RVAwZzE3T1F0elo3cVdRV0RMTElO?=
 =?utf-8?B?YW1NTm9aZG9hZXg5NVZ3bGNrUmRMZFR0czZyekh6UkZPM1ZybkpaenJpb09w?=
 =?utf-8?B?eDB5S0QxbFdzNVc3dkt5Rkl4ZVZ6OExIenJtS2RmRFpJM0ZDV1cwcWxVU24x?=
 =?utf-8?B?aVlFUlZXalgzQ3pNL0RrY002RktHQzBTazRuck5TNUNLR3JqbHVNL3VjOVND?=
 =?utf-8?B?NWZhY04xTXpTb2hhT2ZMOWdOL2VFWHU4ZHlIVnVSQzJFQnFxZnYwUWh3eVph?=
 =?utf-8?B?ZkowSG92QnBrZStwUy9FTDdyUldjN3dSYWdwWVlVVGV1VDZtdEhCQmM1eDlM?=
 =?utf-8?B?SDg5aXk4aGEraHlna0ljSkVDYWk4Sm9HUDFUaUJSYXMzbnViM2Fvbmx1QlFy?=
 =?utf-8?B?aUtKSllVUTh5bS9DM1plYTZ1MzZwVGEwSVNnaC93cTBPdms1YXNjdjIxWG1k?=
 =?utf-8?B?UzRuNUlQL2svRW8raUlvUHllaWJXYVhDM054cldoUXlnN0RRUWlKSjF6b01V?=
 =?utf-8?B?dGYrQThyWFRPNVJiN0JiNGZoN0NUTXVCaXdURk94UUtyTTV3RjM3TFZ4YVBM?=
 =?utf-8?B?QVhvUkM3OFhqOEpjZFNIMW9EbFBZdFR2NUlwVjNNYU1KdjRCTSs4RVcxdlp2?=
 =?utf-8?B?bU9VMSsrazhCeWkrWkhiWG1LSllIcktTVE5MNENoaEVqQUhaV084Z1VwTHc1?=
 =?utf-8?B?bE1wbWdId0dmN3RjTDFLbmZTdk5SMVJBbzUxZStjWnExQjJZYmxOczZKMzNw?=
 =?utf-8?B?TXpScko0eXpraHc2OXZnTW1tUWVzeHRFRVR0WGJzSlQ3Z2RnRnBVYzByUmw0?=
 =?utf-8?B?a25maC9rYUlmV3RpMDV6cmxKNzAwVTZxSEFydGtsakdGOUtpaUswL2JsbnI2?=
 =?utf-8?B?WlYwVVRra1dLU2lLOERhMTlBeFQ0WU1aRE1KZ1laZjA5elFaY2lYZHhsaExU?=
 =?utf-8?B?ZWlJTEJEYXpwSHJYWjRZelVQSUplUXVhLzR6QzVORlNrSGNiYnZRazNHaFBN?=
 =?utf-8?B?NGVYb0NiSnhTMTNHZG9QK2NwMEk1Q3A3aVkxTzlPdlcvejRtbmVvWXVhMHJ2?=
 =?utf-8?B?NWk3bTNjd216R0I4aThaY1p1WmRhbGEzdk41M2lKNU9hTjBvRm44Q3VJeUJX?=
 =?utf-8?Q?sjTt/BzlYoi0d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3RIeEJxWUZFNjgzM0VCbEM3Zm1pY3FrM2ZPL2lXdEFWUlB3MytXeEhLMzkz?=
 =?utf-8?B?eEdPc3dMY2orZjhKZXpkUzZuQ2F5MkZ6ZHZ5enhpbkJlRlZYLzY5UGViVnBt?=
 =?utf-8?B?RzZ5bS9BZWpVRVpGTTFTOTBQbm5RR01kQlk4ZFRiQTg5bXFJcUs2bTJJOVpa?=
 =?utf-8?B?QUF5SjgyM2ExalRnL203Q3M2UzRmWk51QXJNUG5ybXcvaG9RZVIxNTBnOG8y?=
 =?utf-8?B?VHJIcm5xNnhidmNlcDlOaDVZK29RSUhsaFQ5RWVKOGF0WFRSeVBnckhKS3VR?=
 =?utf-8?B?eUxUUy9yRWlWSngxeTRpZExhV1R2YjVPaklFQmF6T0d0eHVZM2lDY2ptOWhT?=
 =?utf-8?B?UUxWWnNvcU5EV20zZG9aaU9MQ3kwZzIwT0tRY1RiZUVReThmRUJsTk1Kb2Yr?=
 =?utf-8?B?OEpBanl4UHFGbmdhSEcvSEZzRi9JRzJCMHluUnhpSjJoUnpGeTB5UU1jaXMr?=
 =?utf-8?B?MWIyNGdKNForOHBYRmlZbVMxUWZBSmtuenhrZ0dDVzZOdTN6elRYMlkwWk9q?=
 =?utf-8?B?UlNUTm1mTkJkWURSRnRwYW1ZS2d1d2tnU0lQcVpQZTFuNWtWZlJnWDBPUm1x?=
 =?utf-8?B?c09WYnB1R09GaWpIaTJOaFlUanoxZGlaYm85MUNOZGRDWkdRcTNxRDJObFJR?=
 =?utf-8?B?VS9VdThRRmxTVm4zY3ZySjlZSUZkcGtna2hqOVY0eGVrLzlJWVJzWmRYWnM4?=
 =?utf-8?B?emJqZzZkUTU0ekUyMmJEN1pQNHRYeDMrd3ROTEF4cG4wVk41K1RQYS9hd3VM?=
 =?utf-8?B?eXVPeVY0a1p5N2ZHNENSdFBLVzlnV0RLNG5SenEwU3VWS2laQ0lyZS9tT0xs?=
 =?utf-8?B?U2hOZkdVNDFNVGd3NlBRdUVyKzJJbDZ2aldHY0dKY2VvVVk0aHBKZ084R1Ev?=
 =?utf-8?B?NDZvc0V6UUF2TU40b2RMMFZ2TXc1U3RSdVg4cVFnSXNXeTN6d081aG5DUklo?=
 =?utf-8?B?WDZ2Zm9CcXYxSzFSb2VXaTIrckh2YkM3QzQ3TjZLclBqN3hnblJ3ZFNvZklH?=
 =?utf-8?B?V3pCRWRXUFloWW9SSSt5WVRNcWpab0FaeWxFejBIckJUcVpLWGpUR2JITWMr?=
 =?utf-8?B?c1hqQjkwaWhWakx2Zk9OdkgzK3RPZ0tFMGpRRmZ3c3AxVnJ0V1dkU09FajFG?=
 =?utf-8?B?aWJqa1RYeEJsS1dmeXFEQThCWU9zOG1hOEhHeFduSGtUWGJVVVo4MHcvU0dD?=
 =?utf-8?B?bzdwd1lXK0ZiUTExbVBKbVRETDJ1OVJjVFZpbEZVMmFZVHhnc3RtTHJvLzVi?=
 =?utf-8?B?RTZSM1gxVGxZQlYzc2owNmt4bU16eCtTRVVMZCt4citubjNON1NaL0cxQ3BM?=
 =?utf-8?B?RFhiQzY2NWJoNW1leUZIVVdjcWR6aWVnWTlmbytmYzErNmE2V01JRkxhTS9t?=
 =?utf-8?B?R09xWjllOWNRWkVOVjUweUlONFRkR1d5MWR0MHhHQWh4OVN0UWE0NWNhcklG?=
 =?utf-8?B?a3R6Z2lZdUJhMUhUQStYc3I1Z1dackZ6UzJhTE85TjJOWGxOdEFKYVJSUkEy?=
 =?utf-8?B?RVAxSmxLYXVrOTNsaE5YZ3NJNEFiVFowbm9WS012MmNhN2tNbFJpRXNyTk02?=
 =?utf-8?B?QWVWd216eFY0UG5xZ0N2QVMyZ3dKS3JETnM5WGFuN2FaUEhGK2lvaFVTQXBq?=
 =?utf-8?B?SVhLME1mbU1zeE9XMm9BSlh3RzRWN0JyYlpWV3NvYWJjbWI0R09rQmoxWE8r?=
 =?utf-8?B?MW9mVHhDd2RvVGhQTU1uVCtXenhEQk1uSXY0M1hpZTVZWEludTVNTi9YRDl5?=
 =?utf-8?B?Y2RnTWE3dGQrOFNGREc5cHkvUWkrZzB3L0xTRlYxcUNaMzJVeFVYbm9CSlRM?=
 =?utf-8?B?Y0tWR1NYMnpkZTVOVkJ4ZzhTeis5V3RUaitleDA2bkdZYkRISjhRWk1KZnRH?=
 =?utf-8?B?eklzcXM4bU9xZVVmRzg1V28reC9RcDcwaUFhN3hRVjdxZittU2E4M1Q2UTU4?=
 =?utf-8?B?b2cxckpreURsTjVkT2VoSVF2SjBuSFZqaG1ZSUxETlNVeEhoV3ZjK25OY3BE?=
 =?utf-8?B?c2I1N3dYNFBuRjFOZHlQcFZUalo5Q0svMndKVkxYcGhLY0hVUlBXbUsxWjVU?=
 =?utf-8?B?UitydTY1UW13TEEwZGFlWTM4VFhDTmVoRVcxRW5va2JKTnRHNnprVWlwZnRG?=
 =?utf-8?B?ZVVPTk13LzRKeEh1dlVqY3lXT0JkUHQ0MWZ5UXRVZzRvT1lMNmgxdWlGYnJx?=
 =?utf-8?B?dGw2VXlELzZQNTB6REZwaGZ1RzZGd1NCTlZhek5SQnVXN2JKQlN6V05PSHc2?=
 =?utf-8?B?TlNKTVkwd0ZXTnp3M3A5UyszOHNBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b02625-49c4-4840-902d-08dd4bd48d5d
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 02:17:23.6095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKuCmTLAqBtj0tgTq54ge0xF+HV6XxHWzT0+XRqaoryoXZSVqMWDvOu0OcaMHMj8ihSy71bIkgGkaf186RmZV6/vFycd+ZwDwY4Jycdu/Gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6546
X-Proofpoint-ORIG-GUID: yuQkbrERWNjHuDiQRmkNvwaaaNWOdyyP
X-Authority-Analysis: v=2.4 cv=DNd14zNb c=1 sm=1 tr=0 ts=67ad5637 cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10
 a=t7CeM3EgAAAA:8 a=JAF4PBQRREuQswBUJFMA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yuQkbrERWNjHuDiQRmkNvwaaaNWOdyyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502130016


On 1/6/25 16:15, Philipp Zabel wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sa, 2024-12-21 at 11:14 +0800, Xiaolei Wang wrote:
>> When the system goes into sleep mode, the dependent
>> power will be turned off, so when the system resumes,
>> coda_hw_init() needs to be called, otherwise it will
>> get 'CODA PIC_RUN timeout' after resuming.
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/media/platform/chips-media/coda/coda-common.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
>> index 289a076c3bcc..e6e3f5ec24f6 100644
>> --- a/drivers/media/platform/chips-media/coda/coda-common.c
>> +++ b/drivers/media/platform/chips-media/coda/coda-common.c
>> @@ -3340,6 +3340,7 @@ static int coda_runtime_resume(struct device *dev)
>>
>>   static const struct dev_pm_ops coda_pm_ops = {
>>        SET_RUNTIME_PM_OPS(NULL, coda_runtime_resume, NULL)
>> +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
>>   };
>>
>>   static struct platform_driver coda_driver = {
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Humble Ping...

thanks

xiaolei

>
> regards
> Philipp

