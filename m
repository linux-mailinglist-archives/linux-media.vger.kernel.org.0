Return-Path: <linux-media+bounces-29014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A0EA75DD6
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 04:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B78F07A3605
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 02:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0868486347;
	Mon, 31 Mar 2025 02:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JU9Dc44d"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3291520E6;
	Mon, 31 Mar 2025 02:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743388033; cv=fail; b=T43zEuttpYQk0MSW8kjAu3VtGjKUfFJfuAg5tlhkZuK2z3ui5rP4JVhvDhBP/PWTmd53YA5O1zfPK3WJxdzSLwTcywkuXRHSZ85lvNVTZsYjZZsyKXsiC32SAZodMqc2XPeGJ49ha+MbiKjRJ6q3LzW3sNklvIGFmtCe3IvO0Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743388033; c=relaxed/simple;
	bh=KB1BI1pwsaBOJCecNbyVja5MO7cWGO0GFdu124/G4Hg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PJVr7ElI4XXfpGZZR5htUF6uTMSxGoTtPNW/UnQpBjLZjjOMNn1guBp9NLGHEtKOFAjONE6OvI54ZUDuMtHuuP3PG0rPcivnxPHPnyVarKn8fH1T2asuCJlIuE3LMH6QbgOxCtEW9dpDXv2gwD8/pSfeOFHbOTALlhl3xhTaI2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JU9Dc44d; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbToMpP+fdSCnlzAuWFrStj2P9ZDj+sF9UCWw4hWyFgIffMQsknCm4Wms0ZZY1/NNlvB8p1msaKrfQr7N28bzI+9RUJpvAXtAPNObQiSnkH3dZoCtgLrCe8YxPEiHmpqxDOsZwFrf/JvhOjWmGiDQNoH8VLoXtFdhLNmX7m02U8UtMI2h8AgG1uhIyjK732hAR/e3AXsJ2ksnPFytOlDgMCWrTpOz5S2gSaFzjoN9LN3NaNNImLK+Nx9NI53o0W1J3ZJsUvnxkhQIsfdFqnEHYIcGtNhgZNnkfd06SHjihROr5x91ZIwRSWyLJ246XM6JG/zHy5wq42uzrpz8X5SrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cH6dkjRq59e1coZ4b4b0PxK51P/uCDZll8krbzk7HhY=;
 b=uwlPUGkJ6i4yk7iYy12Yw5dnPkK0EVN+Ws85hDZZzDpQDFH/Usc0Hicq3filMOI6TOissah7gb8bw56uBMVZVBDLdyIb8fkdtRqGfpqPk+/ngXjBmYoOmvT9PZWOLXCuk6+8XIV01EiaxOnVGL89jklLrDZqaLuT0DlvIOREOGRy9wG/7wM1+MBL3T1xZQ3YYuEiDYJ9py6vLDHLdZzF9tSxRSpODCHf7yGJLgyqZ9YAoyWtZ7mJ5BauHqKQT1qBrmCanejGPLpUoCXdFOmc8l9Pb2LtATcvbsJ9xIbxbHa85ShLmnN1SJaAiypP2JFCucAc/7nCBNOCNEFbsLMdhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cH6dkjRq59e1coZ4b4b0PxK51P/uCDZll8krbzk7HhY=;
 b=JU9Dc44dUdiWf1p+Mo/Wry/sHPkkV+R4jfVbu5KRXfNZxFrfKQbUEB/1dLsbtY1CdFzHzsXvJ7U+0OkspEbRXSlUGQjGoYwi7LsIAL6svj7V6Yt/fj4uyKDRG4eZhASmDR5qNL3o5XuUQJaTUVpa3wtx/sGsiZcGoWHrXOiT2KnJ7OJhGSV9wLeCLnoUEKHdOGUKU+lAmpHpWclnYPdJIfN2AmjiColc65CxV1o32twjReUIhBElaxH7DdAnlfIzQIGeHLaDuZTu06+I+l3jXlyO5KeVO6T9bQqO2njvNA7xy+GwL8b6cpi2HT/RijZ8SbIAYhtV5TJx4Nbcvjd/Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.53; Mon, 31 Mar
 2025 02:27:07 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.052; Mon, 31 Mar 2025
 02:27:06 +0000
Message-ID: <9747b508-ad9a-427d-b35d-9bb55952ad62@oss.nxp.com>
Date: Mon, 31 Mar 2025 10:26:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: amphion: Reduce decoding latency for HEVC
 decoder
To: Frank Li <Frank.li@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 sebastian.fricke@collabora.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250328064819.784-1-ming.qian@oss.nxp.com>
 <Z+aw6bFdwTsxwLTa@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <Z+aw6bFdwTsxwLTa@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0003.APCP153.PROD.OUTLOOK.COM (2603:1096::13) To
 PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU2PR04MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: 9992a077-da4d-4e96-8b80-08dd6ffb87fe
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnRaNTh6ZmRIcXUxTTdPWlAyUDBxQUg1a25IRk1ocVZwcnVOVXBCdzBsVFJa?=
 =?utf-8?B?OXo5OXZkWlJzWXN2NGY2TWR3OGdLUURyc0FVMCsrVitNRGZyc0JLT1NaY3FT?=
 =?utf-8?B?TldBd2xnekcxcXg3TXB6NmZIdUZjSW80c09UQkI3ODZvLzZ3NG80TFBBTjBk?=
 =?utf-8?B?L3VwdUMxWUlDV09WdEQyRkZPTWpxejRQaXRwSDRnYnBRVlVZbG5rd0NuSy9v?=
 =?utf-8?B?eGlqREIzYW1rUmZXWWZ1OWxKNmM5MTNWSEpvOTh5ZTNrRVJsVE9DdFVZRmwy?=
 =?utf-8?B?ZzY2dnFzK2F1bVFxdEdXK0JMZGJwM3ZsZlhRQloyUEZodHJvVjBuYW9JUGhS?=
 =?utf-8?B?bUJKLzZCRlV4TlZ4VjJCZFRoMGgzWklEWXVrMCtXSzNuZ1JzZDBSZWtWaHRo?=
 =?utf-8?B?cmpMN1dBaUVHY1VXUTBGclpXam5HZkhhSDU5dUtPNHVKNXZqdzRQUW9zUTly?=
 =?utf-8?B?WHRwNlM2aEpiTzVjS08rU3d1VE5lU0cvUFZyRkprLzUrYlhkQmhTSzRuekY4?=
 =?utf-8?B?ZXNzWWxyUjI2Mzh4c05zSHpyQ3lpQXFMdVRBYTkrV0tGWDgydWgwcnZGalZw?=
 =?utf-8?B?aHI4OEpOb0VGRDJBbno0bVFrOUFBRnRjcStWQkFCSHRwSHUrVG9ub05VSW8v?=
 =?utf-8?B?K000cDBOelFhUndYQWk0RStGcFFDWE1qa1VGMGwycy9Yc3FNS0Z6WjNQbE14?=
 =?utf-8?B?R2pmdm1mcTU2ODYrWmZZUW42OGxRTjhuRUNvdndVVE40emFjdXlVQjI5c01X?=
 =?utf-8?B?b0lEQ2I1WXNCZ2pMNVJJRVZrUHliM0tpY0p4SUQraVBiZTRGc0FBZFNZZ2ZE?=
 =?utf-8?B?UTYxWTFSTm52YkZaSGVSUkovOHFwTnlURUJ1aUpLWkdDa3lTWEJncW5handl?=
 =?utf-8?B?WE1RMDRjeE45U2tZNC9WdlZPcUxaVUhJWXlKdTJIUDgwT3NtZGo3LzB4dXRY?=
 =?utf-8?B?Tzh2T2RqbWtFSmxZaVdMM1labU13VGFqS2R6dms0QWxyVlFGUmRyYUppR0I2?=
 =?utf-8?B?MjR0Wk52UllIc1UwVk15RitNOGRSVFl2dTVCbTk0UjlMWW5xSWdneGlqcGli?=
 =?utf-8?B?VUVLLzk4NFlkMnYzN3hZdzJQWlp2eDZoaDNQemdoanByU1VkMXpKVVBhNzU5?=
 =?utf-8?B?dDc1VlQ3d3A5OU5lb2c2ak9zSEkyQXF0QnFNMWpTZGt1UkNtMUJydDVkTzJO?=
 =?utf-8?B?SGErR3lwR3FPT3pVVkxzZGtZTVlQZkp0Vm1NYU84WXExM1JHK0twM2FNTFZC?=
 =?utf-8?B?WDRyWlFySVY4WE5hOG1FRkxzZHhrVFVVbDMvUkZ6ckIrN0FTdXh3cmNTY1ow?=
 =?utf-8?B?U282TkNZVTVJVlZodjZVamNVWlBtODBVckxPMjBvM1drZW1URm9OdDBvWkU5?=
 =?utf-8?B?T3paZmxka3pmMlJxcEcvZ2FjNFhPZllLWHd0LzlkM3NJbzZLeXBTa2lDRW9u?=
 =?utf-8?B?SkRaMGdURytsdjJ4NllVNDBRdWFBNC85MHp4Rmt1YjdEOEs0dGIwUjBJNHo1?=
 =?utf-8?B?aXJXa3hZbkpwZ2xRZngxdVdGaTdJd01wRE05K0xGSVFlYmtsK3hlQlBhdzZJ?=
 =?utf-8?B?MEd0b0xwQUsyMkMxLy9XUWEvVk12Z05EcUpFblIzak54WDlQcWtENm92Z20x?=
 =?utf-8?B?S3NPaG0zcjBGeGxDd0lya2dpNGFZeHRsTFNLSFlBSUl0Y2ZibVh5UXVPT3p3?=
 =?utf-8?B?eGlKc0d3MHNrYVJITmtWQkNxVVgrUGRZV3BkanlTamRWZnZXemJDTllRVTVh?=
 =?utf-8?B?QzVHbWJKUXJyeTMrRjFXRHFZbmIyWFJoZHZsZ205OVZsdUsvYXdXWC9XWWVh?=
 =?utf-8?B?UlBpUjJFOEF2MHJScVdlTWt1Mkd6MHBwQk5EZ0ZUSTNaUGZoODBldGRMaFZq?=
 =?utf-8?Q?EEh91r0ZZuiBA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXBGOUQ2cGh0UmVUMG0rbmk1UDlDbU9vdkRVOG16ellWdHdwSkRlZjB4QW5X?=
 =?utf-8?B?cGRYS01jT3RvUHlXaWxIRzA0OWlQbE5vc2lTTyt4cjhwb0xoMFU2bThITTVz?=
 =?utf-8?B?amdsbEM5aWJSNkphWVg0MEkwdldsL2pSNHJPbXRnWFFsWjZUdmJKcDBiV0M2?=
 =?utf-8?B?MzdPRVpscW9uOXIrdWdJTEVQTTdVaFVXcEgxMzI1SmNqT0tDZVNSVGZKQXY3?=
 =?utf-8?B?QUJLZFZVT1o1K1UzTGd0aHJZSEhuTmFsNUswUzhBcDlnMkZ2c0V0REpBaStY?=
 =?utf-8?B?T0Vsd1R6eUhNUzUzazY2OGtTeEpMY0E0eWxBQk5vdjhEeTFUNzBsSUVPb0FF?=
 =?utf-8?B?R2Q0NkNydVlrUldJSWhDcFljcUdubzhYWDNSNUkyNzcxNW1OQjVJL202UnZQ?=
 =?utf-8?B?SlBuMElXTTR4ektlYTNFWkVUQ1k1dW4zaVVnbW5jYnFCNWZvSm1BL2xDcytC?=
 =?utf-8?B?SnMyMnNDaWhSa3Z1WUxnMmx3d3Z0Q3drcTlreGNPeVFpT1RJOVBGdUFGemxo?=
 =?utf-8?B?TXYrYlNFeEFGUVRVRWExRVJWV2JWTWVmM3RsOHhPM1paeW9SNE9FSno5eG84?=
 =?utf-8?B?UWNTMzFuT2hMU2RPODJJTjlYT1ZuRHBDalZyd2Zxa1hTdDRXbDh6blBmV3Jj?=
 =?utf-8?B?eHVvY2FvMktqNmpZL3lDcmxXVWg2VWh2cG9semhDcXM1c0J6Vjd4WFBFQ3Vx?=
 =?utf-8?B?dWg1MlV4aGQ1QXRRV2hzSzdGYkJQRkJ1UlNFS1dwMUhiOHdqNnkrVTR5R2JB?=
 =?utf-8?B?RnJHUndyVDlKa0ppZVlFaExhelIyOEc2ckRuaUhJYlY2YmJ0U21pcHg2dnRK?=
 =?utf-8?B?MnFBOUpWSjhvNHBiKzUrNFFTUGtoRE9CVzZ4OE5oQ3hQSFg2N1VtNWFoellE?=
 =?utf-8?B?TkZtdDUyNXR6enZvTmFVYjlzUkd1eFU4WG9qUFl3bVFOVFJ2SEdURjZ2M3hI?=
 =?utf-8?B?NmVSSWRLWTlLc2I5cXFpQXlCald5RytseGZNakNSaXpUSTM4aXNSVm95L2tK?=
 =?utf-8?B?UWVQZFhNRkJsOVJTdmZDaGl6VmlZWlpYOUJkdWRQQ0hEdG92OXFPOTZ4bVVt?=
 =?utf-8?B?Qm9SSDcrT1B0dTdCNXhoa0tYOU82b0RWK090NDVnWXlVVTllcHR6RzA0OUQ4?=
 =?utf-8?B?TWtDK05ENDdraG1vWEpYUXl1Z01SbUprNEdydUN4RGQwMEFrTjVoZ3VlWGQ0?=
 =?utf-8?B?ckZEaGl3STg4WTRZM0V1V0lpdTZTTWNuODJTeDdWTFdMTlBlYWhmQ0J2Q1g2?=
 =?utf-8?B?eFVCR0sxbVUwemliVU1WVlEzdjlsNGVsVHQ1UHh3aUxnVXRLLzRST3ZqbVB2?=
 =?utf-8?B?MXlHS1ZCbUlCcXhVaUYrcGVaQ3JyZit1bUNYeVZXK2RtTFdya1NQZzJrVG02?=
 =?utf-8?B?YnhENnRqczV1L2dONWJWUFFHcm5UZlZVWkE0K1ovT1lFZWh4ZDA3eElqeUlS?=
 =?utf-8?B?SzZJU0xPQUxuY0Fielk4dk53RkVVdHNXc1ZuR3Q2NHNSS21pQm1pZk43OVB3?=
 =?utf-8?B?ZVRnY2RjNWdPZTFKSU9ueVF0bFZPcTFNNVJDYjE5Kzk2cXZSNk9xd2JGMUxJ?=
 =?utf-8?B?bkNZa0xmcjNaRjBiTU41Nm4yUGxtd0h1cFNJM1NpTFRPNTZBLzdWdWNvQVlv?=
 =?utf-8?B?eTZrWmxHdmtGZDF5NjJxSVVoeHJSREF5NlA4cFVWMTVxaHc4L01xUTBpb2NW?=
 =?utf-8?B?c0JTUGcyODhjSFcvemIrL1hEazhzcTZNZWRGNW1waU9tR0Jnay85NWNzREZZ?=
 =?utf-8?B?ZTl0ZFJMZVVpRW9RZGxVS2djdldoaEpGd0prWDZUalFMYVgwcm4wa2pFbllr?=
 =?utf-8?B?MlpQRHFWN3FiVi9jdU45Wm11L1R2MTR5MWZPVkVtNWx6aUt2NWR4c0ZWcUdF?=
 =?utf-8?B?d09IVHAzTGdVeU1GK2pQb1g0V01kaFM1SThvS0pJV2tQYjh1Vy9aVXBJM0Iw?=
 =?utf-8?B?aDdPdEpJT3h3SGlVMFFvWmRiUVc1UEJLbjlEQW50TTdMTGlYQjFEbmFJV05i?=
 =?utf-8?B?ak9nMHJpdzdxSW15d2V2QWgzWk1Cd1BVSCtHREFqQmUvREVsMnBydHY3Y2Rw?=
 =?utf-8?B?clJ0OVpwY3JIRGc3Y0V5Z25RcVVMcTdOK1BCYWRJM1oydzlQeTROSExMeHRH?=
 =?utf-8?Q?dVRgaP8jpu+dAd3IqAkd4+VoV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9992a077-da4d-4e96-8b80-08dd6ffb87fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 02:27:06.8684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuYknrvEtSp/MhTurmrBxkzTLJA9FD8mu/Z0yOdosKNlarXRys/Z/FBVgmz1eSvzcSZ7VZ3WIUiGY4AJIpodlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8822

Hi Frank,

On 2025/3/28 22:23, Frank Li wrote:
> On Fri, Mar 28, 2025 at 02:48:16PM +0800, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> The amphion decoder firmware supports a low latency flush mode for the
>> HEVC format since v1.9.0. This feature, which is enabled when the
>> display delay is set to 0, can help to reduce the decoding latency by
>> appending some padding data to every frame.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> ---
>> v4
>> - Add CHECK_VERSION macro
>> v3
>> - Improve commit message as recommended
>> v2
>> - Improve commit message
>> - Add firmware version check
>>
>>   drivers/media/platform/amphion/vpu_malone.c | 24 ++++++++++++++++++---
>>   1 file changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>> index 5c6b2a841b6f..88f8c16a451e 100644
>> --- a/drivers/media/platform/amphion/vpu_malone.c
>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>> @@ -68,6 +68,12 @@
>>
>>   #define MALONE_DEC_FMT_RV_MASK			BIT(21)
>>
>> +#define MALONE_VERSION_MASK			0xFFFFF
>> +#define MALONE_VERSION(maj, min, inc)		\
>> +		((((maj) << 16) | ((min) << 16) | (inc)) & MALONE_VERSION_MASK)
>> +#define CHECK_VERSION(iface, maj, min)		\
>> +		(((iface)->fw_version & MALONE_VERSION_MASK) >= MALONE_VERSION(maj, min, 0))
>> +
> 
> Suggest use FIELD_PREP FILED_GET macro because it can check input value
> exceed the range.
> 
> #define FIELD_PREP(_mask, _val)						\
> 	({								\
> 		__BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");	\
> 
> 		^^^^
> 
> 		((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);	\
> 	})
> 
> Frank

Sure, I'll apply it in V5

> 
>>   enum vpu_malone_stream_input_mode {
>>   	INVALID_MODE = 0,
>>   	FRAME_LVL,
>> @@ -332,6 +338,8 @@ struct vpu_dec_ctrl {
>>   	u32 buf_addr[VID_API_NUM_STREAMS];
>>   };
>>
>> +static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt);
>> +
>>   u32 vpu_malone_get_data_size(void)
>>   {
>>   	return sizeof(struct vpu_dec_ctrl);
>> @@ -654,9 +662,15 @@ static int vpu_malone_set_params(struct vpu_shared_addr *shared,
>>   		hc->jpg[instance].jpg_mjpeg_interlaced = 0;
>>   	}
>>
>> -	hc->codec_param[instance].disp_imm = params->display_delay_enable ? 1 : 0;
>> -	if (malone_format != MALONE_FMT_AVC)
>> +	if (params->display_delay_enable &&
>> +	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
>> +		hc->codec_param[instance].disp_imm = 1;
>> +	else
>>   		hc->codec_param[instance].disp_imm = 0;
>> +
>> +	if (params->codec_format == V4L2_PIX_FMT_HEVC && !CHECK_VERSION(iface, 1, 9))
>> +		hc->codec_param[instance].disp_imm = 0;
>> +
>>   	hc->codec_param[instance].dbglog_enable = 0;
>>   	iface->dbglog_desc.level = 0;
>>
>> @@ -1024,6 +1038,7 @@ static const struct malone_padding_scode padding_scodes[] = {
>>   	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
>>   	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
>>   	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
>> +	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
>>   };
>>
>>   static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
>> @@ -1058,8 +1073,11 @@ static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
>>   	int ret;
>>
>>   	ps = get_padding_scode(scode_type, pixelformat);
>> -	if (!ps)
>> +	if (!ps) {
>> +		if (scode_type == SCODE_PADDING_BUFFLUSH)
>> +			return 0;
>>   		return -EINVAL;
>> +	}
>>
>>   	wptr = readl(&str_buf->wptr);
>>   	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + stream_buffer->length)
>> --
>> 2.43.0-rc1
>>

