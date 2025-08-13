Return-Path: <linux-media+bounces-39802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67088B2481F
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 13:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23B1C882565
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8816B2F747F;
	Wed, 13 Aug 2025 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="COGVIJM9"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022114.outbound.protection.outlook.com [52.101.66.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0965B2F744D
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 11:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755083532; cv=fail; b=uAr81e1syrN+k5c1Qb8PTzeu9yGhhPAarsMXzZCHaQQOXvwFRcQFNQBH4LZPBmpu/ymV27ZRWh9srtBjqNiZmXTm6jLpSdlQj7z0XvgsN8v13viAlDWUVjrQI7pvCokrfLqTTOnPC6I0qBkOxILpN9sRTz3weGdtJdHohCKiS1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755083532; c=relaxed/simple;
	bh=yZAyOqMkm3uijsEp+X8GLxAVKfr7UjN3QgAaZjBQiU0=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=ZnegJVjhBkkGy4T4Kf/7LEzdS8WLl9kgqQm2OodMKLhkcf+DJfzaC8X4RStBh49DPBTs+0eBXfRTN6/4DZvmY4BBiSGYj8DgyQwHa4gB08tIpgHrVsxl7p1INBKb7ispF3pep+PP8hNT3Au8XuzvOEDevElGw3RL0U4k1Jy8Abk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=COGVIJM9; arc=fail smtp.client-ip=52.101.66.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD6W+ybPHqwktimo9b/0wKZgrftEBK22vHaUxf/rFly9qXB1gFiwelvnFCTjHDzU8lH5D0tsxCBKysRA1c+J9Muqw5gfN69Ewj8hzz+G4WsrVuoBLMFWGeWU0IBzyP6iJCoHTq4SKMrwdh7PfZKXnt4eFS4Hl6tsfYh4gvnzplVcJj50GqYdt/I5qJ4sqjPVNedAzMl0jAQw2CxkQJPtkJ+bnEzSrViosb1k3Mq47sF+yCn52sNH+zz2EofZBqP5TK2iPTEjrVr3Lkzy13Ewk8wx8Gr4CcQm5JIF3qWBVTpDqsQL98WT87Brb60z7hzpdM5TgWSDSQXR/GAXtu7Z+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyRBgGNnt8QqACzZsOo4Tsd+t+7zxFNY2l+OeKOb2rg=;
 b=vq0a5nG2u2wkmAqlyZjca94EuHfvMaIWm0utT28BpovzrhM252cjq6E/r16Ot89T0RrnZtIdnaJal4O9rKIUnAiizoxnOynzrezbGIdnJEU5XhAqNGTQbFJm0rvokTTx0qrK+8Mlkp10Kg47MdkkHjp5ZnkBOQ//bV31QkaBL15nldvlw3wMker9S+vji89zSozKPrEdf2awbTMd/lQ6Wxva+Ckdp8BPEF5HRgLRzli9X2bntjX4yBNC+XI8O8qsg1ujZlf4PuDYwXyZV8j47IzpCOrDuyrbwz+3BIWQr100MMMar/fqOebkckdVpmsAKXEDOsAx88SNr5EZ9waSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyRBgGNnt8QqACzZsOo4Tsd+t+7zxFNY2l+OeKOb2rg=;
 b=COGVIJM9rkbUdcOCVagdS6w4XrNZBu+9iq16ZY0nWkvbITLF+gTASXIud39ZAN6H6lrqUtfB5VbAh5uYyelvJVcX/dqDxzCFb/483JDwjjiWbZIwg8fAp70OcRnBO3vFeu54DOQVGQE2ekaMgD0aWru5ghY5vqPRhRGl9LKruEBID0yUy0it6X0EiFX7t3i1QKHDxwoNgfk9pNPLVC6pj+QaWA1GpDO52vM1D3mOJ7o1JQfdfPEXPyoWuP+FU/HjYrbCg2NpqOWEeyq6XlzDCfmh3A8lQXNlWjqVKy3f4rj4aHWypKgc3HdO7yIxvtgXTz9bH2P/3ZFJGJ7tnpcZ4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by GV1PR04MB10308.eurprd04.prod.outlook.com (2603:10a6:150:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Wed, 13 Aug
 2025 11:12:02 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 11:12:00 +0000
Message-ID: <1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com>
Date: Wed, 13 Aug 2025 13:11:59 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev
From: Maud Spierings <maudspierings@gocontroll.com>
Subject: Kernel Panic when trying to capture camera with ffmpeg on imx8mp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0028.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::16) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|GV1PR04MB10308:EE_
X-MS-Office365-Filtering-Correlation-Id: de667e20-37cd-4b13-794e-08ddda5a398d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDVYWjVKOVoreE83Z240OW5Yc0g5SE5hSkkwai9mNVpaZkhCc1BwTGtlWGNa?=
 =?utf-8?B?YzRUUHlNVlluUzFiOVpINC9SOHJ6TlF4Y0RVczlJeFMrc0hPay9WWUJQcmVl?=
 =?utf-8?B?RUVLeGErM2ZZd3cvVm54a1IvR0xUckNMd3RYVUlMUlh4ZnFuQlhiUHRwUytz?=
 =?utf-8?B?aFFwZ1o3RmtHdVBOWmRxWHUrYzBiR2RuWDB4Y1RpWWdBSlg5Q05JMUtGVEFP?=
 =?utf-8?B?eEYvT2ZDc28wSG5vYTBwVG1WOVl0dlU3WDJZaCtPdzkzRVZMbDIwL0E5dWw1?=
 =?utf-8?B?OURuMUd6bVhzd2p4MUt4SXdBWTdkSi8rTm1wTWdOZ0pMWk5UNGlOZ1hJVVdu?=
 =?utf-8?B?ME14dFRROWRlbElPVUNXeW5IU0loUFNrS0szZnZRckxKQVZJb2tCb2dOQzY1?=
 =?utf-8?B?N09xTnZXUEZxNHR4akdOeTkweUZvdzNTZERGbmhER1ZjMmdKb3NjMzRibTJU?=
 =?utf-8?B?WDhpdFRtcmV1UnE2QmFuUHh2eDFPSUF1aVo1eDRvRENDQXM4RmJ3TGk1Q3gv?=
 =?utf-8?B?VkFkTnJmMVNLUi9jWEdWMkdqOEoxb0RUQzBPYzAra0hJZG5UdUl6dkhLWlRF?=
 =?utf-8?B?WHhZekJUVGRsSHNpeXpiWURBZmNUS3l1ekRUNUpxL3NjZkhlQ0FwWVF3Zi94?=
 =?utf-8?B?WnRaZHNMWXhHaDM0RDZvUm9WZU5vcFdyY3RvbFJpNmtsaExscFBoQXlpNlZt?=
 =?utf-8?B?QlZoOWhQN3NkWFNKYXU0RjBPRGtCU1VORERZTlJlcEYzMjVoVFZycnZtM210?=
 =?utf-8?B?dDhuZVlhOUdNQzNtQm55NnVCZ2VrbkYwcVJiVng4ZVlxR2paQmlXOCtUa0pS?=
 =?utf-8?B?Y2FPTEVEMVZ1OTViUUt0Zy8zMGl2NVY1dXFHWExiWGhoTHBHSWI4b3pEVnNV?=
 =?utf-8?B?d3Z6S0R4RVYxZXF3a0xpVy9PY0JlbmZjck5yMEVxZGV6YU4rQlFXQjF5aC8x?=
 =?utf-8?B?RElMUTY4WkJyTWttR3NpNzYyd0lSaEFqK2s1NW1BUDcyVWlwZnpPY2FNbE0y?=
 =?utf-8?B?NHFqT1ZKR2pyTEsvdWZQWXlqenJCV1k2dVUvOFAvdWlYeDh3bVhFWVNqOE5V?=
 =?utf-8?B?WXhuazFGZXdxZG9FWkF0ZmdVaFZWV292L01pVW0rMS9VT0YyUUk3bElESW9n?=
 =?utf-8?B?WHc5QWJwK1lQNnlLQUlkSEFxaGRqNnlHZzYrd29ZOW1uTUF3VGNOeDMxWHdy?=
 =?utf-8?B?OEMwSXlGVS9aYk9oZE9QWjVpMjl5Z01qaTljRHpVVEVFbFBGeklvdEhWTUhC?=
 =?utf-8?B?Y3VPNWRlaDByM3V6ZmNSaFpheHIwZE9sNWRzZndaSWtnR1dvbFRBY0piVVZn?=
 =?utf-8?B?b2M0WTg5TjNOVC80cFFiV3NkRjNxTXZBZEo3Wi90ME1VeERsK1J1TTJtSGJK?=
 =?utf-8?B?YkpPUTllRzh3UENBZ3poS2tBaFJHVDVyZkIzSjlFOTBkVzBGWkJVcy9ubTZR?=
 =?utf-8?B?Zjg4bmNLZmliY2M0YVcvVFhVTDdxVDBrakw1TVVVOFpoNzVZSitjeWNHMElW?=
 =?utf-8?B?elp6UnJjeHVqeUpSeGRuMTk3RTZJaUxxR0FVbDFqSGJkWXl4S1pkTENsZXJh?=
 =?utf-8?B?UlZRdXl4QWgveDFIT0crNmthZVVUOGNMZDdNUG9RSkVXNDg2NHQzU3M4aTRo?=
 =?utf-8?B?RlB4SUI1cTlvalJCYmlmMzdQSjU2QVlVNENwWmtyZlFLTGYrdUticGZRa1Az?=
 =?utf-8?B?dkZCSmdkcnJ1M0hjNkZjcmNrSjVtTnJwQ3hxb0lDN0U1d1Nja0VzelZ6Mzcx?=
 =?utf-8?B?TENPMjRrR3pOZHQ3WEU1QkF2ZWZESXlBdmYxbVpQU21rbFM3aWxhU29IWndJ?=
 =?utf-8?B?Skcza2xFS1FTNVJ4bHI5RWMzM3F5b1RIRWkxaU1od2gwOXM0RDhGbXNoaEhD?=
 =?utf-8?B?WjN4SmlYNXczanlNbTV3MVJHV1N5Z1BZaGJScVJ3ZXJEV09DeUtGZVpVWkll?=
 =?utf-8?Q?RerBT+/h4x0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S21iRjVrUVp2dXRpY2tPMW84Rjd5dUZYRU0vTjRacFQ0ZWpQckpBQzRvVXNp?=
 =?utf-8?B?U3Y5dElQUFBVY3lmNjlIeXllTThZcUdROTV5bGdtdjJjRWZiNXpCVzdaUUdu?=
 =?utf-8?B?ZWxpVVMvRHpVbm0xQms3Si9zRW1BTWVoYnJZZGl5RkNOdTRMcTVITWF5Wm5V?=
 =?utf-8?B?YkFUZVRvVDhHRWhIQ2dDMFpQdmJUS1o0WTdVTzZaeWZrVThYTVFqa2ZNdGgw?=
 =?utf-8?B?VXcrY2JaekxyVER1UmhzVy9sNXArUjcySTBGcjhJSXJyN1FSQ1o5M3F0WW9w?=
 =?utf-8?B?RmxiZDJaejJvUDhnZi90UHRzeDE1d1NHaThGaXVkWmRwWjdJYTlDaENKL01Q?=
 =?utf-8?B?ZE5ML2svcG44ZTZIbDdrUGhpblQ0ZHlud0FGWlBHeFNyVURVM2tNc2MrRWs0?=
 =?utf-8?B?eGR4YkFHUVFvb3hmNFJmSXNRZ3JBN2ZuWDFhd1M0Q3B5TCtTeG44OTFRNlBo?=
 =?utf-8?B?bU1nc0lqWnhkNkNMaHA4MThkUGU2dnpHd3pjTnpJWmVRTDRXTWtCUkozWkQ3?=
 =?utf-8?B?TWdnNzlSNVY3R3hvbS9NTGdjRmRaY2szd3ZsRjBwUjBMTHZvZXVkL3czci9V?=
 =?utf-8?B?SDF1WSttVzhLZjhFOTllMlk1ZEI3bU1QbENuQ0NVUmFIVGptWGdRZEhBMzdp?=
 =?utf-8?B?UHNGaDd1bE5GL0dCQ1BIa0FGNVNoSEdLaTAwZHVqdHB5aytFTGpCNDJHQ0sz?=
 =?utf-8?B?VVRXWEpiaDBJUW9zUGtQV3p2dXkvVW4xZTN1b1hXL2lhaGp4cisvT3FuelFL?=
 =?utf-8?B?YmY0STRnTW5idUVBbzJvVXBNanRXZkZXTjF4d2ZHZlE5eGtpTEljb1piMnUv?=
 =?utf-8?B?SjJUbHBCUGNOcG9rbGpIN1pPUlpyR1dmcGszbFlnam9ZcW5UME1CdWp4NmdF?=
 =?utf-8?B?Y2VwSXZjOHZoRUdHRUFneHVta3J0bjZIZkFvRFUxTnhwOFVLOER1ZmI3dTY5?=
 =?utf-8?B?aWFCT2tkUWpwUXhhZXY0ZnJTZTBiS3RUVmZQWFRpc0IrZGJ3aWV4NUR1c21C?=
 =?utf-8?B?VnpxdVBJM1dKYkMyNWhjTmZFQzk5UVJvZmlKUFVMTG54SUJHS0U1YkJFSkJE?=
 =?utf-8?B?cHYxSUtWVytybnIwclhNaWRWekN6ZHJ4QlZ0TVNzRzgySTYyc2F6UG1nVnhJ?=
 =?utf-8?B?MDhXcDEvUC9aNW9wWVJ6ZldKK1g4azRoNWEyUTBjQkdiMUw5T1Q3U1l1ZDhJ?=
 =?utf-8?B?MEFPSm5uSDhoYzEydDdkdHBNazF0aGpqeDhMQlF5RE01bEU1Ky9BekZzckxr?=
 =?utf-8?B?aWZqV2FrTkFxdUx4VHJOSFVDTlRjSXhTVm9JNTNuSSs2QkVLRTEvanR5c040?=
 =?utf-8?B?NGtpNVFSQ1JIOHV6WmRFMXFGc0V4QjdPT0V3Z3ZlMVVoaVIxMDA2ZGxGZHQ5?=
 =?utf-8?B?ZlhtdEZzZitnRXhpM3h6c1duYXFtYjdueVI4cmNIckgrK3A5QTZBS1RXWk00?=
 =?utf-8?B?RTZPMVRJaU0rcXpNeFBuc1pxQ01DS2FRdEZUNE4rVWRVcXRzSE16bWRPcUdF?=
 =?utf-8?B?eXpTU211eWRDNWgzU0p4TCtUT290OGwzeVhoY0pSa0FIYS8weFQxZHZnazVn?=
 =?utf-8?B?N1hRSVczM0VSVjlmZG9YWFFRaTZDUE1sZzZhWTVscXNIdldMTkpoWFZZaStN?=
 =?utf-8?B?MjA4NHVWZE1IeVFWRFhGZGpoQmp0WnR5UnY2L01MSXRsMEs3WURtSGJDTmsv?=
 =?utf-8?B?L0pXUXNnYlVDMHlVc1k5ZndKUmpqekRlZ3lnL3BMNXlFSXBmN1M3ek82WDRB?=
 =?utf-8?B?OFJjemkvU2plUG9TVHRTRXVJNXlOVkJLam14NWFpQm5FYlVhWDIwZ1drZGxa?=
 =?utf-8?B?elJBVDNQK051L2ladWI4OEkxN0IxdmdjYXhOY2dsNDZDZUdlKzVFNjZKMWJk?=
 =?utf-8?B?MXZqTjhwWWozUUpnTDhKOW1SL1FyRmtGeGxlZGF4MVo1REE3RENmcWFPQ0gz?=
 =?utf-8?B?UkNHaFhzeGhyRVBPVEk4MkdlTktvSGJzWHYxMTVnMmJtT1Q1MDdHcFZ3end1?=
 =?utf-8?B?WkNzMEVhQkZFOTVKR1VFWnBiQ3dCRFljYjVJWE9tOTdrS05CanZBL2FrbUlO?=
 =?utf-8?B?cEY0bThFV0hpVytuNXhjR1NxRDRMak5lSGplbGVrWXdmSkVUU2JhVTdKMGZs?=
 =?utf-8?B?V1R4N1NGdFV1eitQNzA5ckVnblVVY29UdTcvL2lUOVBoMXY5WEFmc1I3S1pU?=
 =?utf-8?B?UjZDN0VkK2xIbTdQQW5VbUhFY0lHRXZ0bTdZWGw1OTVZYm1NSXd2R25GdnVI?=
 =?utf-8?B?aTRhb3hwVEtaQkljQ3ZROUhxV0tRPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de667e20-37cd-4b13-794e-08ddda5a398d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 11:12:00.5535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGtcwzWByZ5/Fo28dHVrKTbIDpfTcdCrlmGuNGNfuf1t5s8Gc789DBfuoKqWy8CUP1RKxUZUQkAIs2S67H0nxvsspNfpVWuk3bxawHsRNUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10308

Dear Readers,

I'm attempting to get a raspberry pi camera working with our imx8mp 
based platform. However when running ` ffmpeg -f v4l2 -i /dev/video2 
-c:v libx264 -preset medium -crf 23 output.mp4`. It results in a kernel 
panic.

Kernel version: 6.12.41
ffmpeg version: 7:7.1.1-1+b1 (Debian Trixie)
v4l2-ctl -d 2 -D:
Driver Info:
Driver name      : mxc-isi
Card type        : mxc-isi-cap
Bus info         : platform:32e00000.isi
Driver version   : 6.12.41
Capabilities     : 0xa4201000
Video Capture Multiplanar
I/O MC
Streaming
Extended Pix Format
Device Capabilities
Device Caps      : 0x24201000
Video Capture Multiplanar
I/O MC
Streaming
Extended Pix Format
Media Driver Info:
Driver name      : mxc-isi
Model            : FSL Capture Media Device
Serial           :
Bus info         : platform:32e00000.isi
Media version    : 6.12.41
Hardware revision: 0x00000000 (0)
Driver version   : 6.12.41
Interface Info:
ID               : 0x03000017
Type             : V4L Video
Entity Info:
ID               : 0x00000015 (21)
Name             : mxc_isi.1.capture
Function         : V4L2 I/O
Pad 0x01000016   : 0: Sink
   Link 0x02000019: from remote pad 0x1000014 of entity 'mxc_isi.1' 
(Video Pixel Formatter): Data, Enabled, Immutable


Panic:
  134.378107] Unable to handle kernel NULL pointer dereference at 
virtual address 0000000000000020
[  134.386921] Mem abort info:
[  134.389717]   ESR = 0x0000000096000004
[  134.393499]   EC = 0x25: DABT (current EL), IL = 32 bits
[  134.398835]   SET = 0, FnV = 0
[  134.401925]   EA = 0, S1PTW = 0
[  134.405068]   FSC = 0x04: level 0 translation fault
[  134.409956] Data abort info:
[  134.412841]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[  134.418345]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[  134.423414]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[  134.428749] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000044ffb000
[  134.435225] [0000000000000020] pgd=0000000000000000, p4d=0000000000000000
[  134.442047] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[  134.448326] Modules linked in: g_serial
[  134.452176] CPU: 1 UID: 0 PID: 445 Comm: ffmpeg Not tainted 
6.12.41-GOcontroll #36
[  134.459750] Hardware name: GOcontroll Moduline Display with camera 
test board (DT)
[  134.467321] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[  134.474285] pc : mxc_isi_crossbar_xlate_streams+0xac/0x170
[  134.479782] lr : mxc_isi_crossbar_xlate_streams+0xa8/0x170
[  134.485273] sp : ffff8000819738d0
[  134.488586] x29: ffff8000819738d0 x28: ffff800081973948 x27: 
ffff800081973950
[  134.495734] x26: ffff80008197394c x25: ffff0000028ab0a8 x24: 
0000000000000001
[  134.502878] x23: 0000000000000001 x22: 0000000000000001 x21: 
0000000000000001
[  134.510023] x20: 0000000000000004 x19: ffff00000351c458 x18: 
0000000000000002
[  134.517165] x17: 00007dff35433000 x16: ffff8000815df000 x15: 
0000000000000001
[  134.524310] x14: 0000000000000000 x13: 00000000000629fd x12: 
ffff8000812ae000
[  134.531455] x11: 0000000000000001 x10: 0000000000000001 x9 : 
0000000000000004
[  134.538599] x8 : ffff000002610d2c x7 : 0000000000000000 x6 : 
ffff80008197394c
[  134.545742] x5 : ffff000002611e40 x4 : 000000000fffffff x3 : 
ffff0000028ab110
[  134.552887] x2 : ffff0000028ab110 x1 : 0000000000000000 x0 : 
0000000000000000
[  134.560034] Call trace:
[  134.562482]  mxc_isi_crossbar_xlate_streams+0xac/0x170
[  134.567626]  mxc_isi_crossbar_enable_streams+0x50/0x18c
[  134.572859]  v4l2_subdev_enable_streams+0x180/0x3b0
[  134.577740]  mxc_isi_pipe_enable+0x1e4/0x260
[  134.582018]  mxc_isi_vb2_start_streaming+0xa0/0x108
[  134.586898]  vb2_start_streaming+0x6c/0x178
[  134.591084]  vb2_core_streamon+0xd8/0x1bc
[  134.595094]  vb2_streamon+0x18/0x64
[  134.598588]  mxc_isi_video_streamon+0x318/0x3a0
[  134.603119]  v4l_streamon+0x24/0x30
[  134.606615]  __video_do_ioctl+0x40c/0x4a0
[  134.610627]  video_usercopy+0x354/0x658
[  134.614465]  video_ioctl2+0x18/0x40
[  134.617956]  v4l2_ioctl+0x40/0x60
[  134.621276]  __arm64_sys_ioctl+0xbc/0xdc
[  134.625202]  invoke_syscall+0x48/0x104
[  134.628961]  el0_svc_common.constprop.0+0x40/0xe0
[  134.633669]  do_el0_svc+0x1c/0x28
[  134.636987]  el0_svc+0x30/0x100
[  134.640136]  el0t_64_sync_handler+0x120/0x12c
[  134.644497]  el0t_64_sync+0x190/0x194
[  134.648168] Code: d37a7f00 8b000020 97ff155f aa0003e1 (f9401000)
[  134.654264] ---[ end trace 0000000000000000 ]---
[  134.658883] Kernel panic - not syncing: Oops: Fatal exception
[  134.664630] SMP: stopping secondary CPUs
[  134.668558] Kernel Offset: disabled
[  134.672047] CPU features: 0x00,00000080,00200000,4200420b
[  134.677448] Memory Limit: none

Other ffmpeg output:
[video4linux2,v4l2 @ 0xaaaacfe2bc60] ioctl(VIDIOC_G_PARM): Inappropriate 
ioctl for device
[video4linux2,v4l2 @ 0xaaaacfe2bc60] Time per frame unknown

Likely I'm doing something very stupid because I don't know what I'm 
doing. But all the other /dev/videoX entries just result in an error. 
Except for this specific one that reproducibly panics.

My devicetree setup is practically identical to the one in 
freescale/imx8mp-venice-gw74xx-imx219.dtso (different i2c bus and 
regulator gpio only)

I'll try and figure out which variable the guilty one is.

Kind Regards,
Maud


