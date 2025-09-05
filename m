Return-Path: <linux-media+bounces-41802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA46B44EB3
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 09:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7583A08280
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 07:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2612D481D;
	Fri,  5 Sep 2025 07:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MW9No31i"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B3032F76C;
	Fri,  5 Sep 2025 07:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757055945; cv=fail; b=SoNoVFZM2DqT/kPF0aOwum5nTPyrZYnekRxQpyo6G9XpEjsbJWna3DJrExgOzdvCxQXBAGYI7uhC3Vn4TZcfN060WzkfvvbNbUYNeYVAtRg6ZoxnuwN4ZFO/q0co3tLudMUeMTOeVa9xHZSTx6nEzmu0Nmyyptm+V0uZ/B6PT3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757055945; c=relaxed/simple;
	bh=rEcLZfKvg7llMiOwRmyMIJ3CQjkyo7ycDhlGunttWf8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iEYQvR09gY4rivoHxKsAaITf95dE4XvvWXAI80OAAMK7ZAfxJWqII87c+jzBN9CzdVz3qVEHp6S/myutj2z9MQPcZRCZIVqYA1h5xTyyDbItpvA3Qook/+FRGskxwV8rv7cc6AdXSjPVyg4kLYyLacfvoZD53gvy+uxXBXlrlrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MW9No31i; arc=fail smtp.client-ip=40.107.236.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jm4J76qQjEIn9LZGN1KcsV6KmM+giCJ3dmvATnOsnJMq8AfMo1xDhUdwrp2wSwX2Jq23trfjbEWWr5aGN/5NraqPaYjM9rrvA7HYnv2C6LQVLiAB6Y+1GYhUtLcui8NRItZsVsZ+A4bkFLj+GIuzKuzM4ua2yoawUISpiCYWm1reMWaKl9+/vN9t8RQbclXD3LlaPNlCeOfbFasVcbwgTNZqJgDRq4eZrYD2dmPkcI4Y6r/LmbsMMiALtEY325pU2+eJ/GKCtr2eA6Ts5vq7a9NGMWpaMmKV4kB0X1CrHVQgeO5gxbl63l+4pwpPdW8QDOGbThQcd4ur3uuSdq69nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FLfC2WrJVHxB6AjeEH+OmawVa4jIlEmo9NYC4qNbHY=;
 b=y13aO4dFNgNw8IY2yZQAbXCQfjtY3kERyAwdKoT11h+fJolPAvzDK/JgysLdQ/JT5TWI6aIUZIMJCfk2jwrCu2owUMtxjYp2vI1uRnyqLeHsKjfps83uMlUw2s0lfohZYzpDvR40IXUaUd/neW5Cf4ac53urmIR+n0ZtJzSDtMDfY0YrtegKkLwXDtVCuEWjJhxqqzI4eg8pufok5mUBq3WiN3j1t1gQHnjX1A9Zykp8WUt+D1qrLv+TDEkLLigbWRzkSkcYrkVggJ2sqBfb4980YMLrNo9nY7x9376HjQ3G6iUJ/EEgqo2TmJrLdsyBXD3/bbXs1B13VtyaCPl+aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FLfC2WrJVHxB6AjeEH+OmawVa4jIlEmo9NYC4qNbHY=;
 b=MW9No31iBtu9Jlot98TqrakYVe9JL/vE20Fd4gekwus/+0hV8O/wSnB/rh6QpjmPuVnkDIJSH6twmTUk/C9Vo60tjIcuKJTesvcWFrBb5qPYAINLM84lJYEVlTwiyV54Ce7Oa4IXmbyASxWlwZvVLVY9uUa49jIYfRp+0uamnlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by MW4PR12MB7168.namprd12.prod.outlook.com (2603:10b6:303:22d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 07:05:39 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 07:05:38 +0000
Message-ID: <da070ae7-6347-4ce5-a0c1-11d1b0e491bf@amd.com>
Date: Fri, 5 Sep 2025 15:05:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] media: platform: amd: isp4 video node and buffers
 handling added
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
 Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com,
 anson.tsao@amd.com
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <20250828100811.95722-5-Bin.Du@amd.com>
 <20250903100841.GC13448@pendragon.ideasonboard.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250903100841.GC13448@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0121.apcprd02.prod.outlook.com
 (2603:1096:4:188::21) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|MW4PR12MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 86908a6d-c1be-44ad-a02b-08ddec4a9dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2pCNDBzc3RUMmNQOVNLZnl6OU5yOWpxeVJSWCttbU9NR1pkN0RXUGxzV0VI?=
 =?utf-8?B?Qk10STI0K3VFNkhGcHprS1NpTFBiZXRjbkdWS0g3Q1U3VXJBRi8wc3NsRDFV?=
 =?utf-8?B?VVpCTjVaTEtVbE8xdTA0c0tMMXhXU09KcnlCK2JMQXFNanRibFdvcjdkTVh0?=
 =?utf-8?B?dENPL3gvMmpXelNJVzE5bHd5V3p6dTVUR0ZlWjhqRlpROS90VE1qeEZsTXpK?=
 =?utf-8?B?TUxJVXpiaHZKTjJFMjZsQlQvMUtPbnNnV3lEaUFXdHM0U2JycVJxeDdDM1pP?=
 =?utf-8?B?YlVZNGpYV2dMUFYyQmo2ajMrOFFuWk9Gd083QTFhV2hiWjdWUmk3N3JqdXRp?=
 =?utf-8?B?d2Y0bDJUWXloZmFUazJWMHo4ZWZyNGFBdDhnU2xyTGFLb1NKdFpEVmk5UTg0?=
 =?utf-8?B?MG9lS2RWdGlvR2wxdVFDUXUyZjIwQ1ZleEJKU1RaN3Vod1pTUmcrWWZvT2Zh?=
 =?utf-8?B?SjZJZm90eHFkSE00MVl5akh3cDMwazA5QkMwWUUwZFdkUWVPZzBKUlY3Zlp5?=
 =?utf-8?B?R3JHMDZxQ0NvcDFXcGVhVnJYK2FTRFFaelc1eGdSdXFlcHlyTmVNbjNZWm1B?=
 =?utf-8?B?SVgwZWdpVEpFOWxjR1M2aXpHV2owME5XQkxZTkt2L3d5UkY5ZmRub0FTWEhR?=
 =?utf-8?B?WjF6VlJEN2R5SlpWNkpzL3RXdk11dUZFMHdubDUxUUV4N0ZkOFZ2RXAxVTRW?=
 =?utf-8?B?N25ienBpcUFpOVhXRHR2RnR4Q2ZtV0tMNkwrVjZOTXNJVFBwL2RjUitzcDRk?=
 =?utf-8?B?L09LOFh5RDQ0anJEQ3RIKzdsaWt5T1YyOEh6ZEU4WGcxSVZ6VjhGU0FxVEE4?=
 =?utf-8?B?aWZBemtXZjA1Y3o4OU5GT3BKWFAzRkVmK2w2bHpOZEJaZVNLVk14Y05LSlhs?=
 =?utf-8?B?S3Rlc0l3Z2ViMVJrTmRrRk9YdytKRGMyMGtHZmRxcEtSay90K3BEeDQ0T2dk?=
 =?utf-8?B?KzA2OU9qdE9mTWE1L096WVFjVzVvQllNdy9MeldWR1ZDbXc0Zi9MTGd0eXky?=
 =?utf-8?B?Q2ovVXZDM1dIL2paVUtxS0NzSzZXUWpic3dmOWduVHFjVVBXMC9yQzc3MUVL?=
 =?utf-8?B?aFRWeDJFN3dtdktKYlg2ZlIrb1FaMGgxRHdkYmQxMjBObE1RNnBkQVVxK0dL?=
 =?utf-8?B?ZGVCKzZNdUQ0NTBYRVVrN010THBKeUZEUWZuTndhODY2UWRZUEVmanVRYUdQ?=
 =?utf-8?B?ak9uT2ZKZTNadU10VDYvT1AzejBVR0tlS0ZhQ1RGeWMyQlJuU2xUMkRTY2FJ?=
 =?utf-8?B?NksxR0M3aE5oR1VvdlBTRElLbjdYbis2T1FpOWFYU2ZJWlpzS3BJQ1lITmFm?=
 =?utf-8?B?ODhzalVvcS9paDlrQkR1bkFDcDlIVEVKZ2t4QTZVeHZNUm1VMmJ1c1kxdWtV?=
 =?utf-8?B?YXFjTzl6SXl3YXo4SUl2c1kxK3g3aytDK3JNMjk0aVp4QTNia1BDaVlGR1Zz?=
 =?utf-8?B?REFUNFBENktVVS9EVUYydG5ybjl2QkNHZHMyRHVaOHQ2VXhwUmtQZkg0bGhO?=
 =?utf-8?B?U1RqQXNSZGlCUyt1dW43V2RMaDVaL1JGMGdrTlJFNFE0SXd6aUJ5MWxWVno4?=
 =?utf-8?B?Uy95cGEzdDFUc09sL2JQQTBaQ2VGeDJvcnBJMjk2VEVlSWk5cHJ0YVI1c0Yx?=
 =?utf-8?B?SmZ6S2NENUhIenp2akdKSlZiSVIvbUpJVkswRGZkQllKRFlFTXJ3QzJCZlFx?=
 =?utf-8?B?OG5DeUY4eitjRGFCZTBiVXJhL0tlU0VMYVJHSjBLK2NUY2hGZHFkVU5sd1cr?=
 =?utf-8?B?eXpXQWxWRFErYXdrbmIvY0RPTm56Ty92WUtQdDBESzFlVVRPbEVzNnYwdTVK?=
 =?utf-8?Q?jXdHcthvbh8k63C/z8i6YTEsBeEaBEgOqGaic=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y000QzFPelduRnVETXE1ODByYUJEZGVTZ09BdTBLZG0ya0w4MHpialBKaFdS?=
 =?utf-8?B?dENFNWtTSUJROVpPTEpXY0tFRHhEbzl2QVdLQTJVS1JXTDdCRVJ5ZXZESlMw?=
 =?utf-8?B?UkpIeTltbW5FTkJwdzBydHJkbUdsaUhiUlFqbjVzNTVIbnZIR0Q4NWlsajBT?=
 =?utf-8?B?NXluK2ZmbStTMFlzZzRZN08yR1JUKzc0R28xeExXWWg1RFhsd1VTSU9GSWVh?=
 =?utf-8?B?YjB4N2RrMHQ2TStlZHNmREhGWFpkQnFVV21kMGJiZkNudE5XbVY2M25RTjEr?=
 =?utf-8?B?Q2lUMUN5bEx4RkJzN2dpaGlpVjh1YXMraVg2RFgrVFBjWUR6SXVoL1FUdEtq?=
 =?utf-8?B?bEpKa3B1RVUyd0x2YW9xMHhLQkIwUG9mR2xyWjRveHRrWWs4TVVCdXdDUWND?=
 =?utf-8?B?R2lmb2NrUDNQZlJ5NGZFTzh2c3ZTTkNCTHZja3JCb0N2TkMyR2ZEL1pHWW5D?=
 =?utf-8?B?a1M2TFBzcXZNQjhlMXdoaDVsWlAyL1V5MEVFdHVzNzRvdE1tTFNzQS9qNDV6?=
 =?utf-8?B?TnJlWVJzdk5ta1JmSUoraXhvWUl5S2ZCbm45UEJpcGJiK2F5dzI4OTllM3I1?=
 =?utf-8?B?YXJ5OW05L01rQ2pXajVkVHNCVGJJRzlGOUU2YlRvbDBDRnBIQmRMdU9sMWtQ?=
 =?utf-8?B?NlJPQTJoczhNWEx5SEQxbU12S2phLzJJUG1IOU8xajNGRnd4cnRnb3Q5NGRv?=
 =?utf-8?B?djVZN0pmWEVtTXpmdWVaOHUrWjdLR1ZIVlFIQmxCc05KM0xwUWd6QkNDRnNI?=
 =?utf-8?B?VVBWZ24yT0IrRi9yZ0dRbjhrZVkvdExTYVJQODR1UHVVektQZWMreGFXZkZX?=
 =?utf-8?B?YmZaY3puSGVEbzFNeExIUSthcitwRHpMVXlPNW1JYW9QSHhwdWRVM3NndkNu?=
 =?utf-8?B?WmkrRmlpNEtvOEQyRTNVa0d0azlvbGtldThrc0tUN21FczNuamNrbzNSVEN1?=
 =?utf-8?B?WVpYS1dDTnMyd29pNlZIRVRJUjVobmE3amtJa2c2N0JGc0MzL1Eyd2ZPN29a?=
 =?utf-8?B?cTBpRlJWT2VPZjJSQ0prZ3pzWDdSakxVVE1VNjFWNUZTQlhZUjUvWnV4YVZ5?=
 =?utf-8?B?RC9MRG5UVmp2K3FueWh1Y0RueGJmQnAza2RKUXlDRHI0eFdydUVQNzRqN2Vx?=
 =?utf-8?B?ekd2NTlzcWIrdVhxcU0rSHFZZkNlaERvMEFxYm9PMTR6VUF5U1V2ZlZEQm9o?=
 =?utf-8?B?d3k0SVU3bG1VQ2d2TkgveTQxanpaZFRIRHU5K2U2ajhTOTkzenJvMHlDOHE0?=
 =?utf-8?B?aDF1ckdHU2FRMk5qVndaUFlxTEVXOXl4YkJBN1d4c2U4SFdXOXVSZmF2Yzd4?=
 =?utf-8?B?UFExRTJLdUNLVlBzbzJXMisvQ2Z6NDk5dUtOekpJK2ZWRXV6aEJIVzhPa2hR?=
 =?utf-8?B?T3JYMEZwZlJqRkdVU2x4Y0RrajJoOHkxbEJMWkVCM0dGWUx3UmM4aVFQeTdO?=
 =?utf-8?B?VktwZ3ZobUdrZTFXekhXalUvTDhJNWNxVW5lUHg3TnNNOWVuNk85Nzl4bFlr?=
 =?utf-8?B?em5ESG40QnpLdkZ6OHd0OFoweFYyeXJzdDg2em15MUJ2WU80VExLditoVmFj?=
 =?utf-8?B?VkVJdWtTWkU2VjlZVmIwT1FINHhVOWl5WEVLSXJnUzVFUXZvV3ExWUVTNFUy?=
 =?utf-8?B?R3hZVjN5cjZwaDArNWNJa2lDMG05NThFdjNkK2pRWFRpVDdRbE0ySlNOMW0z?=
 =?utf-8?B?T2R6c0p4ZjNzR1c4bm51L1pob0twR3p6QXpTOWJndnJWc2hjbUFXWDA5Qlov?=
 =?utf-8?B?T0xXU1NKNmhKWkxuN0tOUytIdHRiWGZsRjd4c3NMcFMrY1ZQcExRUlVUUThx?=
 =?utf-8?B?bE9MbktuRjVoUkJXY2RDM293aHBSaEJNM2ZvcUtCcjVXL2JFK0s3dks0bzky?=
 =?utf-8?B?M1hzcjVzV0cranpLRENyTG1taTE0NWVrYXlQemlLcEFCQjNVQTJoUlFIc2dP?=
 =?utf-8?B?MFpZZzJlYldjcHJLYVlDcjQwOGhNSWRweVBYd01YRmpPY1FTU0NCc3hKM21N?=
 =?utf-8?B?Sy8yZ0h4KzRoOGx3aGpvbkdLQ2d1UGwxb0JBb3BodVNXeVJBV2ZBSDF6b0tu?=
 =?utf-8?B?eTlST2pGMkpMZk5hSmhBQlhlWXY0aUZ1eUtXYnhsMnc4Q1BwdUVmV1N3VHM3?=
 =?utf-8?Q?tLQQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86908a6d-c1be-44ad-a02b-08ddec4a9dd9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 07:05:38.4291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CClCA3ihUwIqhAzjaN3VIXdmZInE0UkniLE4QK+JS8FYqwPDWqCatj9ReCc+1hQ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7168

Thanks Laurent Pinchart,

On 9/3/2025 6:08 PM, Laurent Pinchart wrote:
> Hi Bin,
> 
> Thank you for the patch.
> 
> On Thu, Aug 28, 2025 at 06:08:09PM +0800, Bin Du wrote:
>> Isp video implements v4l2 video interface and supports NV12 and YUYV. It
>> manages buffers, pipeline power and state. Cherry-picked Sultan's DMA
>> buffer realated fix from branch v6.16-drm-tip-isp4-for-amd on
>> https://github.com/kerneltoast/kernel_x86_laptop.git
>>
>> Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
>> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> ---
>>   MAINTAINERS                                   |    2 +
>>   drivers/media/platform/amd/isp4/Makefile      |    1 +
>>   drivers/media/platform/amd/isp4/isp4.c        |   10 +
>>   drivers/media/platform/amd/isp4/isp4_subdev.c |   95 +-
>>   drivers/media/platform/amd/isp4/isp4_subdev.h |    2 +
>>   drivers/media/platform/amd/isp4/isp4_video.c  | 1213 +++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4_video.h  |   87 ++
>>   7 files changed, 1406 insertions(+), 4 deletions(-)
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
> 
> [snip]
> 
>> diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
>> new file mode 100644
>> index 000000000000..642faff83287
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_video.c
> 
> [snip]
> 
>> +static int isp4vid_ioctl_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>> +{
>> +	struct isp4vid_dev *isp_vdev = video_drvdata(file);
>> +
>> +	strscpy(cap->driver, ISP4VID_ISP_DRV_NAME, sizeof(cap->driver));
>> +	snprintf(cap->card, sizeof(cap->card), "%s", ISP4VID_ISP_DRV_NAME);
>> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
>> +		 "platform:%s", ISP4VID_ISP_DRV_NAME);
> 
> The bus_info is set by v4l_quercap, I think you can drop it here (please
> double-check the result).
> 

Yes, you are definitely correct. bus_info is set by media_set_bus_info 
call in v4l_querycap. Will drop it in the next version.

>> +
>> +	cap->capabilities |= (V4L2_CAP_STREAMING |
>> +			      V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_IO_MC);
> 
> You can now drop V4L2_CAP_IO_MC (and there's no need for parentheses).
> 

Sure, will update in the next version.

>> +
>> +	dev_dbg(isp_vdev->dev, "%s|capabilities=0x%X",
>> +		isp_vdev->vdev.name, cap->capabilities);
>> +
>> +	return 0;
>> +}
> 
> [snip]
> 

-- 
Regards,
Bin


