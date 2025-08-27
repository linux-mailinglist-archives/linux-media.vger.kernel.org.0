Return-Path: <linux-media+bounces-41153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9ADB37FEB
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 12:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A24246869C6
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 10:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040A12874FA;
	Wed, 27 Aug 2025 10:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O30vN76y"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F7621ADA4;
	Wed, 27 Aug 2025 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756290629; cv=fail; b=LkUaUQdIg3ik5qfjrGdgucxIAz1wjFwKtpjdcE8ZDMdyjE3DaH3tmA1SA5PuiRYXTDmwVqtWKQGSwXCuVR2AKpER+YW5/t6UwYPWm2A8bgHz3VUBtAwm51LRKektoiFQoQzZmi+ZlHK6KYnVwv339W0CZmxXWWigXf/Xm5sJ0E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756290629; c=relaxed/simple;
	bh=KhZJ3kDxsHFz2ty5A99jkppDO5IdlSHTG+TTggzCByA=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AJhM4Sp+UGBAm0JoHSluPpMkzoyIHdDEYEmlpZCMVgpxJMmeduP0cGirHvikHS0mkUGgQqN42YCe8e9mYGzVCsAmbKoWfNCndpvTIXuaoon7QGetjKhfXiLfrpp7zHL5Xi8NW3aDzJOBJRfTLbOd37ARYIervhjzgySSglDwUUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O30vN76y; arc=fail smtp.client-ip=40.107.244.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GR8MMFZL+/hy4V20l3eY/574BJn0LWPNm1rYOeZlZB8evIo4046fSHL9CFxTnkhaGiwz7hhqFi94buAckqByjfsWFXVvKGl6NFceZHKMYHuc2gjmY2Yhl2z5dpCn+Nfqf4HlUbBxax3fpEviWfOKHY3jOzZr1Awc2Qvrf3uCnji38iieB8sOybRkB6aNy80a4C1sC5VWaEUBB4oFjBv6iHQTORkYg9JMNxlfKTprYamwqCzoK1enApK/n0NV535CRD3aunxXTkdsv4HD5JO4w65kSdd+0lS60lrGsqSfFG9BwTSOCOcY7onjkGCCe/i2uwseBjoxSNMAFaBsiL4Csg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jgu1mfM9aVma2k8+9r01Ky+tr1Tr0cCwLmMO1zGa6M=;
 b=I/vp0GWwmpQq1cteF/PlMoyWTWMxM1QjCrcWajQlpaHlGyydc7wzHSBcBeJkTutv3OpNGikkIEAZ9dSYLtfZgD5Fa4G4dVrRQMwLAwokObo7P4AOyUwwSCHgxLCkWXuLbj2RBx94VNXxrEouFJf74SdiT/O99uVgq3KcgI++nLpQavMcqKflXasKua8kmdrjWbXAppSS2VvEQ8K6OEDzkwnNPqZFUeSKxpTcGv3OJDL1poXYVcZWiK8zK9muR3HlKeLaQANq3Wjdl53Td/qizy8imDvcmN6Ob7qm5bSH41rokT+78ZLZaI9tJ81iFN1nHMuK6RGXWGkRSRwUisrPnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jgu1mfM9aVma2k8+9r01Ky+tr1Tr0cCwLmMO1zGa6M=;
 b=O30vN76yUz/O+vMP2VIovHlPR9oxUvnTKgXI6pGSVt0kQaA2nUsbYQ5YCpxRUw3HEhOHqVwmt8505q7wBlU4WQAdo6KUiCloglf/FtRdivkNilzJPiE06xBhqGJvUqHAo6ghnSq94X4FEl8NC3ZasH2T/fuj9uVKbLKRJyaFEAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by CH3PR12MB8306.namprd12.prod.outlook.com (2603:10b6:610:12c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 10:30:23 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 10:30:22 +0000
Message-ID: <1633b6cd-c84f-4cac-9f87-9dbfd0d2847c@amd.com>
Date: Wed, 27 Aug 2025 18:30:14 +0800
User-Agent: Mozilla Thunderbird
From: "Du, Bin" <bin.du@amd.com>
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
 "Li, King" <King.Li@amd.com>,
 "Rosikopulos, Gjorgji" <Gjorgji.Rosikopulos@amd.com>,
 "Jawich, Phil" <Phil.Jawich@amd.com>,
 "Antony, Dominic" <Dominic.Antony@amd.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>, "Tsao, Anson" <anson.tsao@amd.com>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aJ2H6CIyZvN8W2sS@sultan-box> <ed9deffd-296c-465b-ad8a-314ed0968390@amd.com>
 <aKfqVNk_WSEeBxlz@sultan-box>
Content-Language: en-US
In-Reply-To: <aKfqVNk_WSEeBxlz@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|CH3PR12MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: a89b1ea8-0930-4005-c112-08dde554ba4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NG15UUJ0VWhVa0Q3NDQ1TUNXUHQ2R2w2aGFQYnRTeHJlSWZLSHIzMVY1THpx?=
 =?utf-8?B?czBBeXExUERsY0FRTFcrN2JpNjZtK0tIUW92QzBDeG11SktJeXZpNlo4RnJM?=
 =?utf-8?B?d3lGT25ydFl4OStLb3ZWSWZMLzlmdjZ1TFR1SkU4VmFZNkNORWd1aUtqWG1x?=
 =?utf-8?B?UFRrZTZpRHpaRmRnNnR1cDJUZVpvZkk2YXRYdjkwK0xUZjBDOFliVjQ4RTNK?=
 =?utf-8?B?YmlvNFJ0enFBaHZiMTFuNU9TcUozMExlNlFsVklybzI0bllObndXZU92VHJN?=
 =?utf-8?B?dW9VNmV0ajJnYWVLRDNjN0pjanhUM04vSXIvd05GSmFhaWhPU0R0bmg2cGRk?=
 =?utf-8?B?V2U5KzdRbTMwR0tWSlZSRlIvL2RaS25IU0JpRm1oM1Vmb2Z0TFRWRTFNcVBx?=
 =?utf-8?B?c2NYOHNxWU1oTE0xMVNGWURaM2R0R0kxeDd4NDExSXp5SkJQNFdHMEY3SEsy?=
 =?utf-8?B?Tk9RM0VVMUIxeTAzV2JBY3RYV1hKUzByRXdLZ3ZlcjBtKzRJUHlsTlhrYm1X?=
 =?utf-8?B?T2lSRGxXS0NENlJ4Znh3VVQwdXVESHk1M2RGVEc5elEzZ1kwTnpDT2VNclhT?=
 =?utf-8?B?ajMrTlBRSElWRXRSRHRsa0RobXpuY1lEbytveDUrRVM5VlJ6Zy9QOGtYSCt1?=
 =?utf-8?B?ckJPVWFPYVcrOWF3S0JJRGdoTElob3dWRWJtK2hweGJwc29NVWJzN2FTczdQ?=
 =?utf-8?B?d1hMVENqQmd1R1VBZzNaWU9zMjFCa2Z6bXFON1IyMWxuVHBsaDh2N3J5bmZZ?=
 =?utf-8?B?ckZTclQvR2lrbFQzNVVnWnJQVGZvb3hXcTB5MGJmdU8zRFBLNFJWeVdROWpt?=
 =?utf-8?B?QWR4Q0JjaFdWekhKb3VtdHZVTndIb3NjbzhLdW1IR1JtenJ6MjlhTnVOTmlQ?=
 =?utf-8?B?STg0Z2NZNFIvSVI2NElqZWprekdpWDU5aWZKSU5nbC80QjV3Yk5TRVVoa1Bk?=
 =?utf-8?B?QnM2YkExa1VmWXNyYjk3WmtwejY0TDNSYldRbjI1TDczSWdXc0diZS9wTzFw?=
 =?utf-8?B?Ukl2UzlwUElreWcxYWlERi90N0JSZ0JXQ0RuUFg1N0Vva3BwcWpUVkR3cUIv?=
 =?utf-8?B?aWxPRFpmVnlPdmEwVm9MU3lsL3RoMVJVWHY3U1hXNm5kMmlvK1hidW9rZlpF?=
 =?utf-8?B?UmVnb01aSHNURFRFOUladG5NQjc0d2NhZEJRWklGVkI5Z3pBVmMxM1NPR0ll?=
 =?utf-8?B?bEVQUUpMMXRNODZJYkhuV0dlNUZIRFdBemtFcjYvVWtZN2F5Zi81NUVzdE1N?=
 =?utf-8?B?bGEyMkcwelhaWXloNWRtVDVNNjQwckJWVWgveW5BLzd6WlZVV2dMOS9NNXBy?=
 =?utf-8?B?aEpoQjlaQW95NWI2b3hnRWd5MWRjS05xVTNxUHF6OG1RTFVLWHNzMmlxOGxQ?=
 =?utf-8?B?OFE0cmhjSGQ2dDJkUTJLbUlHNUFxNWZaYXV3eGEzMjhtQ0I2U2J5bVQvR092?=
 =?utf-8?B?M1lIRFVneWN6WFg3bWg0TVhzSWFEckZYMzFwcTAzV2lydGMzdFZPMTl4ZUJY?=
 =?utf-8?B?RTRvU3psTUdlenQ3SEc1WGd4L2VGL2JhQS9Pd1Z6SlhXTndXSWJhbnBLZlBH?=
 =?utf-8?B?RU9ZcUZwTmVYZWVnRTBYYTFlRCtEclJ6NDhEbGJOcjQrZmczRVlNdUFFUVVq?=
 =?utf-8?B?ZjRLaE5idG94MGxPbmY5SHFNTVBZZkJRVllyZEprNXF3cU1QdzIvZWt3Q05o?=
 =?utf-8?B?WGtZOUQwTW9uZDBZVC9XYmxYTVBYMEZtem41cXlLeElUbGxNRlZzclpQZCtT?=
 =?utf-8?B?SGQva3JQaWNsVWt1aTdOVFZHN0Y5dlVtdm1vM2JoOGxKZzYzN1QvTnp2RW5m?=
 =?utf-8?B?aDlDWHZjTWFsZEY0WWNaMEYxZFBuQThDNk5nWkMxYmdqcXZQN1B3bStOaCtD?=
 =?utf-8?B?R2VUVTFGYjZ4bkFwNzZVeHBybzBsbjJBcmtLTndkeVBCdU5EZ0RRWUs5VEtN?=
 =?utf-8?Q?9FGJFvAkGpA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEJxRlRTZjVlTHZFeThWUmVER0FJdlB0RG9tdVZFcEhNSzVXSkFleEZMM3R0?=
 =?utf-8?B?S0liZXpKdjZ3Yyt2bFRmQ1RkL0hPRUZyTUR0OTVXU3pSdWlzR1JFaTNRWnM2?=
 =?utf-8?B?VksxaWFiOVBxUXNiVnpjbVNudnJOZ3lGSzM3VE5SZW9mUFlxRHdNNjJOMytM?=
 =?utf-8?B?dFVVY0ZJZ2x6TUs2Y3R6RGE4c3NsNjJIZDlIZi9DQWIvL3NLb1VJRk5ZRWRH?=
 =?utf-8?B?WUYyR1pPQ1RkZVVreFJLc1NuTzNWanY0N24zaFlpSzdNQXo4NTdsQ0dOUjc5?=
 =?utf-8?B?QTZ5MmhFLzVZNDcrcVYwZ1BlTHY3RUdzaUtOeGtyVU5rcUErMW9QYyt6TmRC?=
 =?utf-8?B?MzljTTRpVmp1VWgvRVFyRXlNL0daM0tHdTdIQ1pNelY5N21TWm9adXNVbnZw?=
 =?utf-8?B?UDY0WVU3SFFBOVAxUU5YdXg3NmhnZ1I4Zmk2V3pENy9YUVZkK25FVEprUXRj?=
 =?utf-8?B?eTZhZTZsY2hiUUtNZStSS3FveG1mdU13V0VXK3FBNkdrOUZGT2c0L04xNmEw?=
 =?utf-8?B?aWl4STN1eEJKRSs2WnZNd0ZxdSsvK1BFMG95NkVXRFpuMkJIMmNuTlNmTEZn?=
 =?utf-8?B?bHpFWEVmRVlXbE8weTVSZGRuK3ZQQ1lZSTJoYitMcjB4clRGdzFvNVgweWRT?=
 =?utf-8?B?THlHOWhzMTREc1JlZlgybDJ6dHVpYktsb0RjK2FlTmhwWnNnMEF2TWNWR2NH?=
 =?utf-8?B?R2wvYXF1RTdsaHhMRDl1SE1HUzRuMjNselM5aVVaK05peUFSQ1RFZVh3TkhM?=
 =?utf-8?B?M0dvemxwQlZaS3hMMmNkK2Q4aUVnWjdOcG9rK0hzL0Q4QW5rczdxY0dtQmNW?=
 =?utf-8?B?SjN4Rkg5L25MbFJmUW9OWld1MXFuQzNjQ3BkTmdmNUhyQzZ6VVdkRXBWUU5k?=
 =?utf-8?B?MVQreXJzL1UwdEMvOVo2T2JrRG5HamZhYlR5OFJXMXNUa2FjV3N0UnMycGJn?=
 =?utf-8?B?TjVnUTFuT1NSM3hvcVJHaEFBWXFGb2N6bXNQaDRVb2IrRU42S09QcExQRDBY?=
 =?utf-8?B?bHRQK2h2eUVvdm5nZnp4NWQ0cExhN0g4a1FMQ2p1cGMvcmJRK0tOMEx6SmtC?=
 =?utf-8?B?WC90NU5sdFNUSTFzeXlNN2V1Zis2QjQvRGg4Tm9uaWVUTElva05HaUlBUTJM?=
 =?utf-8?B?MEZHc01sSG5HTER6U0pEKzVrUzRLR3dsOUdXcW8rbFRQaXQ3RlZGUzNQazNy?=
 =?utf-8?B?NERDV3Y5ZFRFeXRaY0tZTVdvdjlxeW5wb1lVcmxoQ3dWU3dQa1B2bGpSQkRQ?=
 =?utf-8?B?MmtoKy8wb2FCT0llbmxrblBZdERmMnNsRGpCd3czeE5UMXNhcy9LaVZXcCsx?=
 =?utf-8?B?KzhTbDBtQVhmRTQ3d2lLVGl3RFdiWjhaS2xENXQyU3JWTk5CZWpNSi8xQ2xR?=
 =?utf-8?B?dkU3ZUhnZzdIWTUvTFUzODZwZHRXbDV2ckFZMWF2SzhXNWRTS255TDR5aTlO?=
 =?utf-8?B?NnpBeTkwTW55eXFIOWQzUkJWUHpubStaaVNJcEprQ0txRFNPL2xBUkFxSDdp?=
 =?utf-8?B?MVJHY1FOMEllQ25acjZwWmJVV2F1T1hvWU52VFpqR2FVMTZqUVJwTStpN29y?=
 =?utf-8?B?VnpCNURZNE5OcDFSaTU5U1dibDdpM0U3LzMySmcxUG5PQ011NWlvakFYc2NY?=
 =?utf-8?B?Tm5abWtESHJlVXBPTThXMkZSTVA1S3JJSnlPTnZSck9pL29IK1B6T3hGNGwr?=
 =?utf-8?B?NFhpaEkrUFZERDN5SGY3NG1jdE9PVWhFLzlmTVQ4SkJtcHp0Uk4rMllFaC93?=
 =?utf-8?B?MlNNc3pMa0lOVThsMWx0cWswWFRqc2VZMnZBVXdOaVhCS2tWMlAwOXFrRTg5?=
 =?utf-8?B?dEl0dGp4NVdheEhEMU9NdHRkamo4S0wzMlBKdGMwbTE0OVpZekVIVnNKWHJq?=
 =?utf-8?B?ck90UHdGWUhGUlVGSGlMQVFSWWs2a1Zxc1JqWXFQZW5nMFJSTkNiSjV0d0ti?=
 =?utf-8?B?aGYwRWQ1NFVITWNPS0s3TTg5a3NTK2JLOG5hQ3BrSmRUekFISFVCdThHYjg2?=
 =?utf-8?B?clhQamV1WC96NFVZTWd1QW9iZFdvOHZLclROV2FQcGljTTYyZ1lnem5lMVhF?=
 =?utf-8?B?alY3MlpiQ01ReURmekRHTHhUUHBzTTdHS01lSkZEYXExdmJETjJBNWppTFdX?=
 =?utf-8?Q?cMXY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89b1ea8-0930-4005-c112-08dde554ba4b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 10:30:22.8580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FMUNbTQYNNKddP1IoE3840MaEJOazjgWystsx2CtDyro7hwDapGPsJq8DW2V6Ae
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8306

Thanks Sultan.

On 8/22/2025 11:56 AM, Sultan Alsawaf wrote:
> On Fri, Aug 22, 2025 at 10:23:48AM +0800, Du, Bin wrote:
>> On 8/14/2025 2:53 PM, Sultan Alsawaf wrote:
>>> On Wed, Jun 18, 2025 at 05:19:51PM +0800, Bin Du wrote:
>>>> AMD ISP4 Key features:
>>>> - Processes bayer raw data from the connected sensor and output them to different YUV formats
>>>> - Downscale input image to different output image resolution
>>>> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc
>>>
>>> BTW, another problem I have which I would love some help with: may I get the FW
>>> commands for setting basic 3A parameters?
>>>
>>> It seems like the default AE mode does frame-averaging, which is really
>>> unsuitable for video calls on the webcam. My face is really underexposed as a
>>> result during the daytime because there's a lot of ambient light in the
>>> background.
>>>
>>> The webcam on this laptop also has a very wide field of view, which makes my
>>> face appear small and shows too much of the background. This also exacerbates
>>> the AE problem.
>>>
>>> I'm thinking CMD_ID_SET_ZOOM would fix the FOV problem, and then either
>>> CMD_ID_AE_SET_MODE to change the AE mode or CMD_ID_AE_SET_REGION to set the AE
>>> ROI would fix the exposure problem. What do you think?
>>>
>>> Thanks,
>>> Sultan
>>
>> Thanks Sultan for the suggestion, sorry for the late response because we
>> spent some time internally to discuss the feasibility.
> 
> Thanks for looking into this!
> 
>> Yes, it's really good suggestion. Because current V4l2 doesn't have standard
>> ioctl for like region setting, to support it, besides adding FW command, new
>> customized ioctl also needs be added and no existing APP can benefit from
>> it. So our idea is not to add them to our current upstream driver, but we
>> would be really glad to help you to enable them locally with dedicated
>> thread, suppose it can help to improve the IQ with correct input setting
>> like the correct ROI region, but we aren't sure because we didn't do that
>> before on Linux and would really expect your test result and feedback.
> 
> I'm happy to help develop this and even help write the code. :)
> 

Thank you very much for your consistent help, that's invaluable.

> I think a lot of useful functionality can be put upstream just through V4L2,
> like V4L2_CID_EXPOSURE_METERING to control the AE mode.
> 

Yes, that's feasible, the consideration is if we add support to control 
AE mode, as a complete solution, then we have to add support to set 
again and exposure time in manual mode by FW command , besides that, 
extra work is also needed from QA to develop new testcases, all these 
together will cost more time. So, our current plan is first to upstream 
a version with basic functions, after that, we can submit incremental 
patches to add more features. Does it make sense?

> For advanced functions that don't have a standard V4L2 control, maybe we can set
> some defaults in the driver to improve the experience for front-facing cameras,
> i.e. webcams.
>> Depending on the features exposed by FW, maybe setting a ROI for AE isn't
> necessary. Is it possible for the FW to do face detection and set 3A according
> to the face landmarks/ROI?
> 

Oh, so sad, our FW doesn't embed algorithm to do face detection. :(

> Thanks,
> Sultan

-- 
Regards,
Bin


