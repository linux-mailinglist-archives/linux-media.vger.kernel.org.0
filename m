Return-Path: <linux-media+bounces-42143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D38B50AEA
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 04:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEBE87A8993
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 02:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E43F156F45;
	Wed, 10 Sep 2025 02:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RpuXjd/K"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9951E5219;
	Wed, 10 Sep 2025 02:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470520; cv=fail; b=V7Qv2TmU+UI3AWSh/ZdQrK5ka6pQKA0xOUD+3wsL8Pxma8+hDZT1aOlTSQhcA3EiFyc5vn2xkBW+QTZGlo+qnMl52YLwTIvyiCPYud9ikRbyTJk/V6Aebm7D0thKFmI1pKgmJUVMmhfHIGrxBWZl5t4CicJSWJ6QGTyZc+EVnas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470520; c=relaxed/simple;
	bh=RrntnRyrKrB2FibXPHqiKcYQIS0p0maakGerHGzXtNA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=um2b/mLDEHR+6PnLTjXbJ0ozj7bvEqJ3INd4B/+4iuOd/K2or40xLvsHtvk1rdR5HXtd1gy4eiXxdyqVPMu6G2XqHnauSRPuBKEHXxUwdSMtoDoyPNPRGfcW2KtVoFp3GYZAadin8uJTFxq1oQbNcv98gJ3i/PaY21yHtBQbHHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RpuXjd/K; arc=fail smtp.client-ip=40.107.237.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJjeP97n6we+SeF5Q9CTDF+jCVUXDL4hA4Qxreetwz60Dr4b/HdUQsZ82UXwSTg+xCpkL2IKZbQ/jSEZ+G6InMswyXuH0ZBTr8oPeDrNMRD8ca/iLi1hBTO5NRNNPmciwa5QIlWN0RinF13ZAj3F2KHFtzm1UvmLzEe87uWynzK4JuoAj7Mj30f7S2j+J0yUu9nLUPeifTq60I9prHW2hg7zcqHk/296Mt/QX611hh14JTpvyN6ZkzemtnmmtiY81vZpUvIkiiJUuTGcdyDDcexrv34MkL3zPhD+xs3JM0SyEY0bF71FFHoXKQ8sq0tVpooAJz9N7/rzvdwTuFv+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68VIC+RuYJq84ZTjVflymUv+mrstehWlCSJ3ZqHf4E4=;
 b=Sd8Hq59bUVRvGUgX4CeWB5v/ALtR6DYGaYE/nd5nnkwdOT9tPvkCGk2u7JHk8htIm/2h4jU9JMm0OaNwINFxZYAdIUY/aeW5xJSiqZvaIy6MXf+P4OKXwtbT/u0x5saJlQaOr4AgIsnR6LCqsUdFosbdAQ+yxSGXabizky/VVYxLOKbDYzCwE2vGUGWw6VdSCD8AoNqtSiSx5rPjD3HpmjnR+WNq59zTVU0HCkOG6ZNOLnYXaolm28rf3Cj5uoF55ftigpH7mkBKZyxH7tBa9XYQMCyFGrgckV0IDW89Z1q6OvqrolJDS2f/qnb3BZkal36VSmzw2USxYrT3Qh2sTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68VIC+RuYJq84ZTjVflymUv+mrstehWlCSJ3ZqHf4E4=;
 b=RpuXjd/KEsUeMaD2BoyCe+EiXiVffp57BjFW1Me6E6pXpwFUvk2ytEjvJ4FTB6+SGkdTmOe6V3iRTxkp9rDZyRgWlhorzCTtRr865ZSxPCCymmUt4qz8vvzTHppVBa6kd06sjlkalA+22yzMuKn5djjR4KBVG1TuSusSdn6bsgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by IA4PR12MB9786.namprd12.prod.outlook.com (2603:10b6:208:5d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 02:15:15 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 02:15:15 +0000
Message-ID: <485f202e-de42-48c0-bdae-52d6290fd7d3@amd.com>
Date: Wed, 10 Sep 2025 10:15:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add AMD ISP4 driver
To: Shengyu Qu <wiagn233@outlook.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com
References: <20250828084507.94552-1-Bin.Du@amd.com>
 <TY4PR01MB1443251944E84D91018CFE8DE9802A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <TY4PR01MB1443251944E84D91018CFE8DE9802A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0176.apcprd04.prod.outlook.com
 (2603:1096:4:14::14) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|IA4PR12MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b3e4eb-7761-4842-9ac3-08ddf00fe14e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGEwMDl2c2FrVG40SXdTdXRPSjZLSWpYTUZtNHhmQlBQeGNpcllONE12ZkZ4?=
 =?utf-8?B?cE9zU05oZXVQNDEzZHdnSzlNd0dPYVR3WU1GR0JDN2hNM0YzWWp1ZFdrVXNn?=
 =?utf-8?B?QWZaZmJsMTI1Zzg0ZDFLbUNndCtQVndiditoQ24xRkRVQllmNkhwMnFrTkFt?=
 =?utf-8?B?MGdVbVZHYUFWNFhwRHJldDdBSytBcEdmdWY3aUhzSTFOcDk0bkZvMkVFODIv?=
 =?utf-8?B?MnV2ZXNpTGh0NzUrV2ZuNkVGZmp2bWo2dFl4dkhlMDdRZ1dhaXJjUUdHbUdl?=
 =?utf-8?B?cytqcGIvYzliditkRjF5VWo3MkR5cHRsMnBzeEVMVkJTLzRjUENTaE9CaFBq?=
 =?utf-8?B?ODliSThwa05Yd3NzT2RIMVNPZ2xYa0JhSFFURUhVcEZnc2xXT216N3VidGo1?=
 =?utf-8?B?MnJEbjFWRW14WENoQkVwUW1FSlgvM3h2RGp1UFQ2VldhQWRvcUhObG0vRjZq?=
 =?utf-8?B?dDdtWmxTNUJ6enBxUU40RkYreU1rUUVaTUdvd3hackkvZUpKSC9QeWFVMmJs?=
 =?utf-8?B?Z2lXRXNwQnlVOU9NUStFYjZRenB0bHV6WUhnVTU0OGdlckJZT25sOEhncUhQ?=
 =?utf-8?B?eDBwNzdMSHZFaFpFbmhXUnNoenR4cDU3ekNjVFRjQXBsNnhLTGMrS3NXQ1Ji?=
 =?utf-8?B?U0huclVUOTNQcEtwUTkzZklqcE1JVGtNUzJScGFjQndnTHdNbElSZjRoemFu?=
 =?utf-8?B?ZWttcksvb2NTQ29rYTh5RHNLUUhhN2FOaVZEa0srQU5VOFJoWFdFRXVmV2ky?=
 =?utf-8?B?YjJvR1l5c0FWenNhN0lLUksrTDJ0a29CM1ZRV0tnK3hrSUxhdCtUb3g0NHBR?=
 =?utf-8?B?Z1lSeGp0TnZhUmYveVc3L1VqMHVhYUxpQVpNVlkzQS9VakI0dUVWRjByVCsz?=
 =?utf-8?B?V0ZJaDI0QVVEUjI5eDdudXpreHRuUGE2ZkU0cHZvdEpSWUVUeXJpNnZhY3ZZ?=
 =?utf-8?B?OFVWendOQ1p5a0JOb3RrR3FVME4wZ1RnZ0VaVmdXV1JDTGxUY0NOdEVWcHBJ?=
 =?utf-8?B?MFdQUlVrU3Y2VjZVYjdKNWd5Vy9qYlJ4ejM0VXhBZ0JWK2VHU2YxRmpNMTMz?=
 =?utf-8?B?YUhKVGJhb2VMeVVHaVI2UXZ2U3hPMUMvN1h4RVhzRDB3amRyR1BmZVh4aTk0?=
 =?utf-8?B?OWpWT3pHc0RBZ29PSlV5TGNZM0NtUW4xNG9xSjUzSVlvL1B2czV3Q1NTRHRO?=
 =?utf-8?B?NHJwYWVvRGd6YUZPSDRvTlQ4Rjc2SVFMUWZnVTRteGlTR0FhZmNjTmp0S0dV?=
 =?utf-8?B?eW9ibzRuYzk5KzBwOWllWmhwNkF4QjErWXREL2ltOGREMStLVkp2UzBGOTZX?=
 =?utf-8?B?MUZuZ0VUcUZlYWJTZFdPQ2lleEJxV1J1NGdJOExTWVVzelpQakc1NFpWVmFY?=
 =?utf-8?B?aXJEb2tRamZhYlhGTHNuYU5UQVd5YnJ5L2NkbzFOWThTWm4vcUtsZkdrb1Jh?=
 =?utf-8?B?RXg1UHFsUzBuODZlbWMwTVhvYVFPRndZVXgxTHA3N1hLd3FyZm9yeUdQSGpR?=
 =?utf-8?B?YVRZaDRyZmlVVW5iSUxhdEx0UEcvMVRRTlFjTDFyS29LVk9YQjJKd2lLdCtG?=
 =?utf-8?B?amJNRkRlUHVNb1BISjdyVW45allvMEY3SWJCK1RFM1BQUERzanRMOFNRdzc1?=
 =?utf-8?B?TlRNOGtoZVhEUVhIUm5pSTZGR0lqSmF3OUFHczhLdmdEdHFudGpYdklxQmNQ?=
 =?utf-8?B?bEZlb2Q3Wnhhai8xMXhJNlArZFJhUThZNVZoODJ0ell3dkFCc29uY2JqaTVI?=
 =?utf-8?B?dVhiRnNKSHNCODFNUFUvckZnTzd2eStHZEtPdnMzL0U2cUU3S0pubmRKOFFF?=
 =?utf-8?B?RTk2UzN3cnVwYnpFN2s0MC85Z3YweGgzN2MyMmkvZEVNell3a2s0RGJOWHha?=
 =?utf-8?B?U2J0dFRJbEowZ01GTDdZZW5KRlM0ekdVV1ppVHVuQ1o1c0xLT3VBRkVCMmhp?=
 =?utf-8?B?cHF5bTNuaEFSZVFWRGJpUDg0N0Z5Z3d1WnVRUWxMUDYreXNuclJtd1NnSElP?=
 =?utf-8?Q?UAnFCnxJJYDvlGxbQDm80LUL+cW+Q0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmJ6YzlJYXBlTERyRVdWZXBoQy8yRlBQZTdkVktMNXIxaG5RV2RRdzdyN3Nh?=
 =?utf-8?B?T2x3elQvM2xXU2Fqblg5bUdlQWN5U0pLSlYrcFZJK1JlUDllb1BJTk1IREJQ?=
 =?utf-8?B?d1BPbU12ZTEwSytPSklqRm8ybHFTcUt3eHZPclRKT2VvTE82S2UrRmdzcFU3?=
 =?utf-8?B?dDhiTURmek85OGYrLy9TU0tvUEpRTFM0dWdFcXRxWkVHZlI4RWN4ZW9xZndI?=
 =?utf-8?B?TTdKM2FUdVRWZFg0dG5VNFNIN2JFcXV2U3R1WXlxSUF4RHg2UFoyWGNQKzBE?=
 =?utf-8?B?L294QlJCY1d0OSs2anRtZ0FaV0VFcnhMbmJrMXdqUjRvanlhckhHczN6WnMy?=
 =?utf-8?B?N3d3TWdHelVQVGxKb05DWWJvN2tmcktuS2JaL2RUMWlCRkFtNzUwMTJhSEFk?=
 =?utf-8?B?NmFJM1dqUGtVZERXVXhyTEdYOCt1M3hjMXp2UmMwZHpOeHpjZDZSdFlrdEZX?=
 =?utf-8?B?RS84Z3ZETVFPU2laS09CRXZhcVNteUNpT1lTWXM5VlBtYWhsK2cweE5CaUhn?=
 =?utf-8?B?UzhwbTZlWHFKT0RBUjhkZlp5YVhBdmd4Mll6bnh6QThMU3g2RW5OOUJNNzdY?=
 =?utf-8?B?S1ZTTEJGaloraTYvZ0Z4WS9aMGoydnVxSWR4TG9jT0ZmbGZZYk9VYzBGUzdF?=
 =?utf-8?B?Z0N0dkcwOThhd3hxazZ2RHhLa0lVTk1kMGpMc1ZtTFpqL0E1ZXJDMXd0REdH?=
 =?utf-8?B?SHl0L29LdU1DTnNtVS9EU1dkQitoTmlVN0t2b09WdSsxRlVuNVczQlk4L3RP?=
 =?utf-8?B?aUlLVjlGZVM1TWV3MFZORFhnTWVCczdzcnZ5aGY3YUMyVG9qc1hNVWduVnhG?=
 =?utf-8?B?clY5b2k5d1M2T2lJQ1pXT09CM3ZvYTVwTlNxcGYxSHBDalcwbG1RY3ZZc0hh?=
 =?utf-8?B?ODJReE5qSUxjU3M3Vzdoc0dKdzNjc0xaRHA0b2hDcUZneDArRGdSMUlRSXEv?=
 =?utf-8?B?WmNka0tNZmRSZ2VCZERjci9hanNjYTAzazhlTzNaajAxakJHVmtvMkVnNTND?=
 =?utf-8?B?Q3pxK3VuOHd0b1hvYWxjRlZRdE83SmtjQnpwUXFnN3J6YTVDYWw4bzcrQ2Yw?=
 =?utf-8?B?eTBGeDdWU2xTMDNMeGpFQkJTMzdaMmdRVFRWMEw2ZjBwYkxFRlBhMmE5Qk5Y?=
 =?utf-8?B?N244WHI0OFlNYjRFN1BVMkh5WUNPVE1LaTVJc0dtRUNaQXNwQzBSbDhyTUhG?=
 =?utf-8?B?NXF1WGtOTEFjQ21JcHZoa0N4d1V1bmNTbHQrTmVvTTZKNXdlMkErcGlkWVk0?=
 =?utf-8?B?YjhyODdxNEcyUEwzZkJxa1J0SWtKb01Zc0hpa1VnUDE5L2FGNC8rcnJwWnpw?=
 =?utf-8?B?SzUvSUVwMFlNbDlBRE5xRWg3UTQ4MEZhQ09jWXB2YzRKejl1ME1mVzRmaWIr?=
 =?utf-8?B?b0xMRnJDL1hKKzJyTjdoTzB3SGl2OU9Zci9Nc2p5UzdCUmRlc3YzTE1wVlhZ?=
 =?utf-8?B?UUJJSXJHaWxqTlpLRStTeGsvSzhuVksrSUY2YVJFQXM1Z0JIczZUTEtEcnhF?=
 =?utf-8?B?akxiVmthbmc1WDRjNWU2dDRBYXFMYnFwa25xcFlGN2U0a3FjVFhpUzhQc09T?=
 =?utf-8?B?Tnc4UUYrbThRQkFpZjRUb0hGOEtsYzEwYVBUVmpQU3N6Q3hCYkJSSzlRYW1S?=
 =?utf-8?B?cHl3SFk0MDVtME1oUVAyV0daU0RmWXIxbE11M3pUelQ5OWRMOEpCeDBCOTF2?=
 =?utf-8?B?anpKcDNxTlFoWlBkV3hUeU9OeThRd1N5cVNmSGRFK2dsS2E3ZWoyenc5cWdl?=
 =?utf-8?B?VERESGNzbjlaaTJXdFVtVVk1TlNpL0h3VElvaU01dUU1M2xNdkxXVnR3cUdW?=
 =?utf-8?B?TnVlYWZ4NVBCcHNnMDVHTkRmMTVLRDl1SkZ6YllJN1FCeldqSWh2ZytYektm?=
 =?utf-8?B?UmNJZWhFYng1UHNRc0xIZlg1cmQvdytQQnRNUlp5eEhtb0pMdHhwRDZvT3ZL?=
 =?utf-8?B?dldJaytVS3B0djhqd2xBV0ZoT0NoYUplQ1VrakFRMnRtbFR0ZlRjSEZWT3Q3?=
 =?utf-8?B?OFR4WFJZTkVCSml5THpVNDFRaVpvOEpSM0hpc3R6bEY2c2dLMSsxWWVvWWh1?=
 =?utf-8?B?SG1jZi9oWlNBVXVmUmUrWnlTV2wwZWVPYU9ReTJ4KzkxUFNkUFhYS25FNFNK?=
 =?utf-8?Q?ptYU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b3e4eb-7761-4842-9ac3-08ddf00fe14e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 02:15:15.3590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gv7HUcK1q0MDBLLVNEbuHbZ16jRu/jpAYwnQCB/2aX37HAtjCODme/2W79eSO5As
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9786

Hi Shengyu,

On 9/7/2025 2:40 AM, Shengyu Qu wrote:
> Hi,
> 
> 
>> Changes v2 -> v3:
>>
>> - All the dependent patches in other modules (drm/amd/amdgpu, 
>> platform/x86, pinctrl/amd) merged on upstream mainline kernel 
>> (https://github.com/torvalds/linux) v6.17.
>> - Removed usage of amdgpu structs in ISP driver. Added helper 
>> functions in amdgpu accepting opaque params from ISP driver to 
>> allocate and release ISP GART buffers.
>> - Moved sensor and MIPI phy control entirely into ISP FW instead of 
>> the previous hybrid approach controlling sensor from both FW and x86 
>> (sensor driver).
>> - Removed phy configuration and sensor binding as x86 (sensor driver) 
>> had relinquished the sensor control for ISP FW. With this approach the 
>> driver will be exposed as web camera like interface.
>> - New FW with built-in sensor driver is submitted on upstream linux- 
>> firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
> 
> 
> The sensor is MIPI CSI and controlled by I2C, isn't it? Then why we put 
> all control logic into FW rather than driver? Any existing CSI camera 
> ISP support implementation are not doing this by FW.
> 

Yes, it's MIPI CSI sensor and controlled by I2C. In AMD ISP 3A algo 
architecture, part of the sensor control resides in the FW and in 
previous version, sensor init control is put in the sensor driver. With 
discussion with the V4L2 maintainer, the current approach starting from 
V3 is to move all sensor control into FW and remove the sensor driver 
dependency. Please refer to 
https://lore.kernel.org/all/63949b3b-ca2d-42aa-bc8d-43f2952d307a@amd.com/#t 
which provides the context and background on how we arrived at the 
current architectural change in v3.

> Cheers,
> Shengyu

-- 
Regards,
Bin


