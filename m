Return-Path: <linux-media+bounces-52069-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Dg+GO1PgWmLFgMAu9opvQ
	(envelope-from <linux-media+bounces-52069-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 02:31:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3415D3634
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 02:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 479F4301545B
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 01:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F52D23957D;
	Tue,  3 Feb 2026 01:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pAiSJijN"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4D2217F27;
	Tue,  3 Feb 2026 01:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770082238; cv=fail; b=fVE0tcRfgzgVTC+Bsxdv5y2XMUoZLOL8c81ouee703gZr7BZO+aKZXQavkdHclVvicFG1r0IUVO9aPhkCi/bdrbjp3AYz3/15AdA/y6OyqDuUeP1jQIzKNw3cL5lctKv2eAHkGSfnwZH2qHCqGk6p3rm4DltwTKRJRAcFVGGVbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770082238; c=relaxed/simple;
	bh=1RXY6xOkpiUtUcpIRydauPaJncqoaMo51fDws6MK7tE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z2zMv+4pPRvaVk7o4DQeG3LJKiRRYq/93kGbWkKdQBpO8n6i/NGwVUcst5YCL4QQxzcpD8fAaEcMZpTdXoz8p/cRZ+GjP57gTkO+3tW1a7gvbBnrHuEhvUNgxsCmfwLH2h9ck9QNvfgIJcmnxgRyyI1Js6qG7j/88QkJkVKCeOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pAiSJijN; arc=fail smtp.client-ip=40.107.162.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePB7DlLK8g3Ju0FauyiccYvd7T7wyDsjqtXOdPFaztLIJfCo4c2fmCFojJhuQx8g5w1+eaV1IOkS1p8Fz4kC+vzRUeQGVJfDB3nsiCbQWLbotBTkNV4wcQjbNLLv0t19VAFJ32wHG6l2rzlLHS8n8T+63qGKDnmOkZCICrlE0agFjAwLe1mo492Wjxh7QEXSuu3UJLvR121DKyi9qovL2zNpMsL+AY8oKhTpuvinnKWfIs7JKLpMJxNEyFNq9bcKpX+v+uZWLyGibqqJGHJ5nE9hxyrnkXFpqYV2hKovbQpmOymVce+XvAr8CYuVTJIavDinsftnvlcfwKoxV29/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQxL6EBN/0p4NHj0Dz+bUfcWM37b4Ph/vJgSJ/YRQAI=;
 b=n/TGctAQWMspLwg6xnXPendb6vy6mhhdITPjMkOo08WlIpFJ/6GS8JGt0ug4gMSXkY85saIx44CNNv5aVjrjphqVGmL2A40OhxqPkg/QkJG2rDuFp4pxfwsdGkvF6fyj9s/VSfjecTm1wtyXXlfsQZzsWAAWPIFGqYdMayjNyfmZVtMmoVMcH7iyg2m9M65SWFUaIIEmAlouotAie4hzFIRN34UFkjJq+smoLQvYuwc3NiU92hsiA05dnsf0USM2xl4ISIGMh5eyZJ07A/X6bq3YDAvS1GMv8YkN77AL6s+0uG99TSj8RJkVX2mLoPCj3EKexFFoXcbquBnCCQI9ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQxL6EBN/0p4NHj0Dz+bUfcWM37b4Ph/vJgSJ/YRQAI=;
 b=pAiSJijN3WjLHmEP2gdQ5dNV0w6XGKLRHIBkYS+IMuTQpz2ukp1cvRUCaPuQMmSXUZK0W5UOkFnH+Cx0a2sZTbyvtIx3iLR7bhABGrW4wxZzDvUxFzq2VA+wKCivFd16Nt+5N6CshDBc/RY7jPsfEFk0rHrfUrjPFUr9q2/VR1tX66WkhlsPB47t96LUBY+vvM0bR6s+UbIslijulNU07hwmqPps5IwpjnY137rY2BrJBe1J/kwrEXQlEX/C3sRJtqXCGKkhNCWDnHYiVvaVQYwDUoSdlusW1d4JnBKqJZ8F4cmRxD+YB3Db9sRTebGvxLottvpHpdiRmJdWO/2Lnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI2PR04MB10665.eurprd04.prod.outlook.com (2603:10a6:800:27b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 01:30:31 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 01:30:31 +0000
Message-ID: <f9f29a44-5125-463f-9d2d-0ed6e3a54e64@oss.nxp.com>
Date: Tue, 3 Feb 2026 09:30:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: mxc-jpeg: Add support for encoder v1
 descriptor configuration
To: Frank Li <Frank.li@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 nicolas@ndufresne.ca, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, linux-imx@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260202095843.1030-1-ming.qian@oss.nxp.com>
 <20260202095843.1030-4-ming.qian@oss.nxp.com>
 <aYDJAeJZ4f7u+yks@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <aYDJAeJZ4f7u+yks@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI2PR04MB10665:EE_
X-MS-Office365-Filtering-Correlation-Id: 509ac513-11f9-4ca9-6557-08de62c3d14a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTZCeXIybmFUU01TN3lUaitXTHBDOXBHME5CRUUrV1Zoclk5dmh2dElGTmp6?=
 =?utf-8?B?S0ZSdW5sOUtYbWpkVDhaTjQ0ZkFadk4rN1h3N0ZCSU83Z0hWZ3pLeWtOQ09Z?=
 =?utf-8?B?eEpGS1VNNU81NS8xTXFDVjlxdm5MeGlWM3NNYU05Z1RiU0YzcHFZTXE5SDE5?=
 =?utf-8?B?SFB4UVhtU0ZWelIvbTFPT3J4enlvU2szSWcvUnBaN0tmdG5ucjIwVHd5Y2lr?=
 =?utf-8?B?RERwUEVpYjdlVUh5YnBMYTZEcysyOWJ3aThhaEpCU0dBbThrYW1OajZKVXdZ?=
 =?utf-8?B?bXdHUlNjTXR2Z21qTUFUUVJiMlBMK0YzVmp2L3RoTm9mSU0wU0UrckpwZEN6?=
 =?utf-8?B?cmswcDVtSWtLUm1jaUxjTFFSL3RDNXRULzJsWEFEdjRHVjVVaWFWUzJtZVZv?=
 =?utf-8?B?VDlGTlN6UitkMzJoUlZKdlRrMGNoWDByNDhpY2dZbThTOWlCM2taR0s0RHJ4?=
 =?utf-8?B?enQ5SXUyM00xbzlHWEx6NkFUclBqUUM1cmt3L0htU3grMTZtUEc3UmlDWmVq?=
 =?utf-8?B?cGhzZStseG44eVMwekFnQXJZS3JZWjZMc2l5NVcwZEtvNzZwZ09OK1V0QzVm?=
 =?utf-8?B?WW5GZ3pBTG0zL3VYcjRGV0lZRmFJcTlWRlAwbnJ3aXdSVlduVjVuVHVIejQ4?=
 =?utf-8?B?RVd2a3A5c1Byc2UweFREc1RQNkM0andncmlhQXl1UWRaZmw0NGZTTkY1d2hP?=
 =?utf-8?B?T0JOVEIxQkZYYXZSd1h3emRYcHY0eURHa3prQjZIRllNam9wemZKVHFESjIz?=
 =?utf-8?B?TFQ4M09YcFJ0MzlMTmk1c0VXeUdma2o4NFVOcisyTnd1ODZqRGJ1ZDB3bGEy?=
 =?utf-8?B?VTd1Y2hkRkdyNVVOVTVXSm1sZTMvcXpvZTcvOVpNeitkN0VtYVpJcGpZck9K?=
 =?utf-8?B?YnFRS2NBSHBLdXplQ3gzNTY4UmpxM0NqdVAwN042ZzJEV3lTYzJtZDRiQVF6?=
 =?utf-8?B?R0tmM3VNVGlveDhoOXcwQ0V3VWNhcmxaVzhLZndSbjRWdFJUK25jUnFrMWVO?=
 =?utf-8?B?a0JKbCswUlNUOWkvdHUyNlpjSEl0dk40WFIzck45WHhPKzBOZ3FrZEpBK0NC?=
 =?utf-8?B?T3YvelFkZDdqb09yT2VpK0tzTTNyN2tRaEVjN0JqSGplNFdHNmtLeXE1M2RH?=
 =?utf-8?B?WDJMak9pZTIzTXprMHA4bWMrM3hBZWRhK2ZqS1hSVU9jbWhBd1NkbGl1K2x1?=
 =?utf-8?B?THNqbThPdm1OaTAwUldRcDFsWFh0d2Q3MXBUN0NKT1h5SlREQVh5QnhWQkJF?=
 =?utf-8?B?VktWYnFMay8xUzJPWVc2V1ZLajNrbjU2NVJ3RGZvK3czSVpzVHB1TW5UVWI5?=
 =?utf-8?B?MWd4dXpGL2NjV3YzN29YWHcvMG9JRDRCZTlhRVVKVXp4YVJGajdxclJIazR3?=
 =?utf-8?B?a2ZmRndDMGdwVkpuVTdFZ2RUamNRMGFpR01qSzFsL1FGaHhVZ0h5a2JCeXdM?=
 =?utf-8?B?Snl5Y2FqdFBGNzJSdHZPR3gzbC81YzlpR3NORWRubTJPejZyWTkzaEhodlEw?=
 =?utf-8?B?Q292d3FqS0Mrdjg2Y3NLUFllb213QzMybnI0Rlc5alErdk5WMlNaTkdOMnhO?=
 =?utf-8?B?MS9iWlJMdzNlSEdZdnNoR0I3ektVTHIrTjlCQ1R4dWRQWjlDUWUyV1ErNFVo?=
 =?utf-8?B?a01Sa3RqYTgyMkRrbVYrMng5NjZ0NHlzMFU4MGMvVmlpMGJ5Qll4bjJsd0tB?=
 =?utf-8?B?TXdyUHZmSXk0cUZKSERkaWRLZWIvNGlocllGNkhycTZOZGRlVXc4Zm55bXNC?=
 =?utf-8?B?V3dlNHJNOEpjWWtmRUVGZEpXQi9YaEc0bG1BTWJwNTB4RzNqZWxpRWlSODlw?=
 =?utf-8?B?QTR5UkdvT3llVE82eTY5bU5xaU0vNE5ZNlZ1OE4vTVFUdW5nWHprL2FiNWVJ?=
 =?utf-8?B?dnROYk1nZ24xRU9tWXg0cmhDMUNnUW9oOGhINU12Ymc5RnBTUXVabDZuYlFD?=
 =?utf-8?B?WDIzQ3o0M0UxSk5OL2lvTm1rQU0wNHZMT3BaUHlHczJ2eHRZV0tzTHROTGtI?=
 =?utf-8?B?cklmZG0vOWVpTFlMTys3QU42UzZWOVZEWmdBcWdpS0lMTldYcU9JWStyTjMx?=
 =?utf-8?B?T0J0TmdqM0VoL3hFM3VTZTZLSWRGMWtUVmdVMS9NNjBZWWlOTnRObWJYZi9R?=
 =?utf-8?Q?Yjes=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnhxQ1BtNHR4NGFrVGFvRFdyWjlBaWFHMW1iSzhrdkFKQnlZL2FNRFJNUHB6?=
 =?utf-8?B?a2VScUJLbHRldXFMTHhBSXQwL0crWGpVeDBvcDczejJ6N0ZrT3RZNmdUeG8v?=
 =?utf-8?B?ek8ybWpDbGc5TmJJVThJamtROFg2MzVCM0dkNzU5dEFqZ1lvcnZsS0llUzdJ?=
 =?utf-8?B?SGZRd1cyNzJBOURRd2J5M2FoOVZBZ1FzVVNZVmZkc05RVS9FTE9zajRwMHRS?=
 =?utf-8?B?TnlkS0YzVnBEMDB3OG5HTkEvRkRRV0UxLzhZTmdnSHF3d1o2L21xSU4rYlpw?=
 =?utf-8?B?VnYvQ2pJa1pvOHBSZjJyQXhUdEZCMkF3OHZrQ1hqV1FvTU1PSmhBaWNNT2Fk?=
 =?utf-8?B?OWkvM1J0MmRmVWphT1kvM0RZU0h1aWdpZituUXBVOFRVRFpqVWN2MkJmWVli?=
 =?utf-8?B?ZnlDcWh4L2lOcGFxZnVqNDlENy9TZUtFVmY5OFNLY3JMOUlLTWo3UUJPTWsw?=
 =?utf-8?B?OGpCN3B4bjduU1pmQUU3clkvOHd3UmpYNzdRS3hacHNxdTlLYlpvWnVTMTN2?=
 =?utf-8?B?ZHlETGN5ekJNNk9zK3dmRVQvMWpNcWdCZFl0Zm1YRytFVEhEcEgwbHBFaktC?=
 =?utf-8?B?TUdPSmY2czVuMFBEdzlnSi9HWjhkemRSd0RzUG1Gd0FQOFNhMkZ0M2w4OTZH?=
 =?utf-8?B?TnRISXFrb2dKY1M2dXE3Z2ZCd2MwM1NNUFJsU2RNd2JYN0g0QjlPMUZHTG9D?=
 =?utf-8?B?bmxvNCt0RXRsUElxK3ZiMm9pR1l5cXB0dDBJbnNDR2lpQmRPUEpWNFR6bUYv?=
 =?utf-8?B?NTlGVlo0SERQQnNvRGJVZEdOdzlIbmxsSFo1Smd1K0JyWG1za0lJRnRLeGFx?=
 =?utf-8?B?YWI0UUtUTFlNOWN4VElCK2doYTJ4ZlZkamxHTlpaczV2VjVnNGNWaFRETEY5?=
 =?utf-8?B?WUFtL0ZZUHFpZisxOEx6RlQybzkyVXYrbmZuVGVtNFoySDBMTGhWMnZmNjRY?=
 =?utf-8?B?akNLeFFWejdoTUF3VjA0NlJFWnpRWXdVSWVxNXY4NC9rQU5od2lEYmdtUWNY?=
 =?utf-8?B?dEh1RHorQUptb1FHMEdySHB0VjVtcHp5VmRLNlRLVitHblNucE9rczdBVFFQ?=
 =?utf-8?B?d0pyZ0xUR3ZrY3Q4Rnd5QjloYk1HWGVIR29ZQjAwazIreEQ0OFpFbVAxbTZD?=
 =?utf-8?B?Y0k0WFd6eVNBWkVlaDNxWGtjN1JwQUo1RzNsVXVUR1p3LzNCZ2hXWFVZaXZa?=
 =?utf-8?B?dHl0TW9MdFovRlgzMk0xU1dqWUt3OCtPaUpkZUp3YUNkVGVIaXBwV042b1Uw?=
 =?utf-8?B?VWpCcmJTNzJwb2lzZEIyRnhwcElmQWREekxuRGpCSTRYczA3YkUrckhIVkFn?=
 =?utf-8?B?bTl0d0pHaTltWnRGV2ozVjdwdnNSOFlkR3RyUk9COGM5aXRtN0VtTm5yNmIv?=
 =?utf-8?B?amtHU0JvTE5TV3BjZmdUNFdodzBaY3FtczdaRGhsRVF4Q2liWDZORVNLOEdx?=
 =?utf-8?B?OHhnS1lRRnd5QkV0dGF2MWRIakxCaFl3SUsyb2diZXJKM2ZiNlh2ZHllMW12?=
 =?utf-8?B?RkJ1aG5rbEg5ay9KMW42bEFwZTYwckhVTUEzZEk2VTN0dmtqbTZ1ZkUxOFZY?=
 =?utf-8?B?WktTUlZMNzdSRStJdnBrTDVMVjZkclhmSWFFR09CNjdxaVVHQlI3UitwanVJ?=
 =?utf-8?B?Q21LeEZOb2JqUFpEa0JGUEQvUU9VaTJ0VEEyZEdZMnppa1RERXk0UTZKY2Ry?=
 =?utf-8?B?ZyszOXRBb0poUEdVL2hiSUpTaXlBdXMvdjZRUHN6Tk9lWTN6SncyYWVEV0kw?=
 =?utf-8?B?WFllc2tBeHp1Rjd0RmN3QVhwNVo4d1NpTldwMVNNME1BeWRFVjIyNm80Vzdp?=
 =?utf-8?B?cnBOS2FZNGgwci9sT29QNXlMZjNqcVJyKzgxenpPaW85M053aDVTbDJFNm9O?=
 =?utf-8?B?N3k3bG13SS9IUmFBMTNYUXlLVEhJeXlNMm4wMTJ1U0tPT2tQaDVMSXZQUkFt?=
 =?utf-8?B?dU9jcThLSEJUb0hibzhpcklNRmQ3cERWVmtGN0VLNUpGZU9HVktVRmRpVFNB?=
 =?utf-8?B?VEczWXZBMjh3L1REUkpscVRMaUlUVk45aFJTenptMEp6ZWFBOEM5dFZraS9H?=
 =?utf-8?B?bTdKWXNYVFk3REdlT29yMTJFd1FaRXNOc3JCOXRWUXI1VUtXY0EwcGVrcStm?=
 =?utf-8?B?bWQ4a2lXRTVJVStSd3RvaEdGY0Q4eDFoQnlFSjBlVUwra1JZcVpWaWNId2E1?=
 =?utf-8?B?a0llcHVHQjI4ZGdkdWdYcURKUkZCalR2V2RVaEk3dGMrbkFDaUxwNTlmc0pO?=
 =?utf-8?B?TUFOUEpwQlZZdmJOdU1lRDV1U2FqRytUTFBsT3hyM2VFbjV3VTdSbkRnWU05?=
 =?utf-8?B?b2k4NkJUdjRxelNJbjQzK0RvR1hCYmdmKzBndkxMcXU4Vm5sQUZEUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 509ac513-11f9-4ca9-6557-08de62c3d14a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:30:31.1303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0Vjo/Ncco6xjROVDifjdJ3t33SqkR2V16VPP2P8BNEZw1/5R78MeTpPltz3RH9HBVYr5j8YLDLKQGVSEYMxGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10665
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52069-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,oss.nxp.com,ndufresne.ca,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: B3415D3634
X-Rspamd-Action: no action

Hi Frank,

On 2/2/2026 11:55 PM, Frank Li wrote:
> On Mon, Feb 02, 2026 at 05:58:36PM +0800, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> Support the upgraded JPEG encoder v1 found on i.MX952 SoC.
>>
>> Detect the encoder hardware version via the version register.
>>
>> The v1 encoder uses an expanded descriptor format that allows all
>> encoding parameters, including JPEG quality, to be configured directly
>> in the descriptor.
>>
>> This removes the manual register-based configuration step required by v0
>> and reduces the interrupt count from two to one per frame.
>>
>> V0 encoding flow:
>>    1. Write quality to registers -> trigger config interrupt
>>    2. Start encoding -> trigger completion interrupt
>>
>> V1 encoding flow:
>>    1. Configure descriptor with all parameters including quality
>>    2. Start encoding -> trigger completion interrupt
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h |  1 +
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 45 ++++++++++++++++++-
>>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.h    | 11 +++++
>>   3 files changed, 55 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> index adb93e977be9..0d78443cb270 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h
>> @@ -73,6 +73,7 @@
>>   #define GLB_CTRL_DEC_GO					(0x1 << 2)
>>   #define GLB_CTRL_L_ENDIAN(le)				((le) << 3)
>>   #define GLB_CTRL_SLOT_EN(slot)				(0x1 << ((slot) + 4))
>> +#define GLB_CTRL_CUR_VERSION(r)				FIELD_GET(GENMASK_U32(19, 16), r)
>>
>>   /* COM_STAUS fields */
>>   #define COM_STATUS_DEC_ONGOING(r)		(((r) & (1 << 31)) >> 31)
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> index ede422364f9b..71f4a1d292ac 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>> @@ -1417,11 +1417,32 @@ static void mxc_jpeg_enc_finish_config_manually(struct mxc_jpeg_ctx *ctx)
>>   	mxc_jpeg_enc_mode_go(dev, reg, ctx->extseq);
>>   }
>>
>> +static void mxc_jpeg_enc_configure_desc(struct mxc_jpeg_ctx *ctx)
>> +{
>> +	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
>> +	struct mxc_jpeg_desc *desc = jpeg->slot_data.desc;
>> +	struct mxc_jpeg_desc *cfg_desc = jpeg->slot_data.cfg_desc;
>> +
>> +	ctx->enc_state = MXC_JPEG_ENCODING;
>> +	cfg_desc->mode = (ctx->extseq) ? 0xb0 : 0xa0;
>> +	cfg_desc->cfg_mode = 0x3ff;
>> +
>> +	desc->mode = (ctx->extseq) ? 0x150 : 0x140;
>> +	desc->cfg_mode = 0x3ff;
>> +	desc->quality = ctx->jpeg_quality;
>> +	desc->lumth = 0xffff;
>> +	desc->chrth = 0xffff;
>> +}
>> +
>>   static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v0 = {
>>   	.enter_config_mode = mxc_jpeg_enc_start_config_manually,
>>   	.exit_config_mode = mxc_jpeg_enc_finish_config_manually
>>   };
>>
>> +static const struct mxc_jpeg_enc_ops mxc_jpeg_enc_cfg_ops_v1 = {
>> +	.setup_desc = mxc_jpeg_enc_configure_desc
>> +};
>> +
>>   static const struct mxc_jpeg_fmt *mxc_jpeg_get_sibling_format(const struct mxc_jpeg_fmt *fmt)
>>   {
>>   	int i;
>> @@ -2874,6 +2895,14 @@ static int mxc_jpeg_attach_pm_domains(struct mxc_jpeg_dev *jpeg)
>>   	return ret;
>>   }
>>
>> +static int mxc_jpeg_get_version(void __iomem *reg)
>> +{
>> +	u32 regval;
>> +
>> +	regval = readl(reg + GLB_CTRL);
>> +	return GLB_CTRL_CUR_VERSION(regval);
>> +}
>> +
>>   static int mxc_jpeg_probe(struct platform_device *pdev)
>>   {
>>   	struct mxc_jpeg_dev *jpeg;
>> @@ -3008,11 +3037,23 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>>   	platform_set_drvdata(pdev, jpeg);
>>   	pm_runtime_enable(dev);
> 
> Not related this patch. If have time, you change pm_runtime_enable() to
> devm_pm_runtime_enable().

Sure, I'll handle it.

I noticed a typo in the title where I mistakenly wrote “imx-jpeg” as 
“mxc-jpeg”. I will fix it with V4.

Regards,
Ming

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>
>> -	if (mode == MXC_JPEG_ENCODE)
>> -		jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
>> +	if (mode == MXC_JPEG_ENCODE) {
>> +		ret = pm_runtime_resume_and_get(dev);
>> +		if (ret < 0)
>> +			goto err_check_version;
>> +
>> +		if (mxc_jpeg_get_version(jpeg->base_reg) == 0)
>> +			jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v0;
>> +		else
>> +			jpeg->enc_cfg_ops = &mxc_jpeg_enc_cfg_ops_v1;
>> +
>> +		pm_runtime_put_sync(dev);
>> +	}
>>
>>   	return 0;
>>
>> +err_check_version:
>> +	pm_runtime_disable(&pdev->dev);
>>   err_vdev_register:
>>   	video_device_release(jpeg->dec_vdev);
>>
>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> index cdfefb68346a..c00c13549746 100644
>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h
>> @@ -81,6 +81,17 @@ struct mxc_jpeg_desc {
>>   	u32 stm_bufsize;
>>   	u32 imgsize;
>>   	u32 stm_ctrl;
>> +	/* below parameters are valid for v1 */
>> +	u32 mode;
>> +	u32 cfg_mode;
>> +	u32 quality;
>> +	u32 rc_regs_sel;
>> +	u32 lumth;
>> +	u32 chrth;
>> +	u32 nomfrsize_lo;
>> +	u32 nomfrsize_hi;
>> +	u32 ofbsize_lo;
>> +	u32 ofbsize_hi;
>>   } __packed;
>>
>>   struct mxc_jpeg_q_data {
>> --
>> 2.52.0
>>


