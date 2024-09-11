Return-Path: <linux-media+bounces-18144-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2C6974888
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 05:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CC5DB24ABA
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 03:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24ADB3A1C9;
	Wed, 11 Sep 2024 03:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="mDO8G1ST"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2126.outbound.protection.outlook.com [40.107.215.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BAE18651;
	Wed, 11 Sep 2024 03:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726024487; cv=fail; b=awybmTJfVQEFJhR9SD3XqLBNb0dkSP9XqIbJtnhiZofE+Fnf4xoTTlbXCZXh89zM8ezSGEBlGIx+Ekeq98m5SLcK0kNlyd8Q2PdJSTex9fJwepR50MMIHGaxlEttd7sYZy4QXpB2NgUlkOjeJ/30jzYLlWYMefCGAoUy7QX4JH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726024487; c=relaxed/simple;
	bh=SnUffwUHxibSGJ5DW9YqC05UyzGIacYGd5jv6G7nyDo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dNYcjm8vYtVhvZNehY/2UM1oinD0+wUniOUoxLa0rkl2EEzOTqYZWaHgNEVEZTr7pLw8aXtcvKRPIFkOSSqUhFUFmMQMMW/dkezS6fjY+8U4WmxUvQEciyaMRczUJgmSHjdqQ+nbwBUK3EO19YNWe0Z3dfnO5ikKPIU1i0tB6/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=mDO8G1ST; arc=fail smtp.client-ip=40.107.215.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPVpgj6SLnKkZNPvbc2T7jDCC7LXyk5faUHVNzJZr7PKUNo/MolKwOQ6Xq7qlCjoVVw9hz8b9M2xb0YoGBAlrbHJ39LcYYhQuyuFa5bANksklyziH9FdIQB0n070BUHMN4zxNV6w6E/jsjPEoZupk8yQiHIn2jOG49e0Az4fU1qgKQP/RT/1PG8e+chjpuDurrVo1Z6L+0d4ITmH0XwBiPhyyiyO/M9XWNYT1yUwH6EhXUMmN4SCdOMS3jQBI8oSpts2vTVn7CW7QdM/h+bHIOqm2tdffziKv4Cb4VI2QUd+kvb9kO1Pyj9w+gRZNVm1xf8tZQM6WB4UIwCPUPG1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WJR0lr4cm4nzPN6msWE4IwOFMm/NnUmhM5eH1xlozs=;
 b=mmRFIdtMiMRXSUNZ99P+Hw1eEMh2aFf+vTsMYErlxjYcyCJ3Ylhb41ZCtoYB2Pf4QmVanYtZk4bTyHIBztWHzbZY6C8AzLgDHqzszbG9RVw/H9kukgQROwrC4GYCkvhLbc8RDoNcVz47oAaRN3Z8rg4WWmQZtDY1u/iGx5d/YdupniGf1E6+xPV0py2Je8lBA6SSaL9xPH1oCH4idpcJYTroGR/cwJo71A+YS1T05yFXEnadnApF7uY8M8JKO6VV5UIjI4SH2NBwsHV/aWvY8JXBZPJmuCb+cjQ1c8rJnvJKRxS7ItniGsrQ97/ICXFDzHq9eNcbQGmOwYUGF8Nclg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WJR0lr4cm4nzPN6msWE4IwOFMm/NnUmhM5eH1xlozs=;
 b=mDO8G1STMziJYD/ZQT11QrCb1qV501r5ndaw5+N4pMmiEJoHQEoVUDbknBuV7PlvSS93pcVibM9rZdgyxo8nnH7Wd2IiAE6lS7fobIq3FLZV7eXBnb/uqhqxh91X8YtRi1iupLNDNh7pdyfTDLFmvp3webCRy0A8ibXopli8gNsHfaMLxjX9HwpEjegV70AQyreGNxNI4/0SIhHVQQ+9u1htJH7tjeAkZb8ZSflazwwSo4TruLbSWrDSBSRlE7dBbtQRd5cM/jFCJuA1iOrcbADuUVSBy/3MQcEscPF/2OH/4E6ie27ubKEXzqYBdJPSeX5UdyLbtTWsPvNFSCFkAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYSPR03MB8787.apcprd03.prod.outlook.com (2603:1096:405:5c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Wed, 11 Sep
 2024 03:14:38 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%5]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 03:14:38 +0000
Message-ID: <f08fb7f5-95a9-435a-9bc0-317effd0eede@amlogic.com>
Date: Wed, 11 Sep 2024 11:14:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] Amlogic C3 ISP support
To: Dan Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
References: <20240909-c3isp-v2-0-3c866a1cea56@amlogic.com>
 <e43190e6-ab91-48fe-bfeb-487d52778c23@ideasonboard.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <e43190e6-ab91-48fe-bfeb-487d52778c23@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYSPR03MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: 47647085-f10a-41b4-9924-08dcd20fde94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHArUzZiNlBHbDR0Uk1qZzY5bHBrc1RFNHpXQmhwRDFzb1krQllYbEczUVdE?=
 =?utf-8?B?WFpaMjh4U2xTMEhRUlo3elU3YkY0MXdBTmVuekVhVlp3ajdUNkt0YmdhUy96?=
 =?utf-8?B?MmxFMmp4dkJHMTVYNnN2VkY1UDhvK3l5WTZJNWtGcmd5Q1Z5ZkpzUGpKTy96?=
 =?utf-8?B?bXNxMnhiRWdjcjJqNGxLM0FyUks0c0dkelJuSGY0endqekQzVHdaNFB6ZzhX?=
 =?utf-8?B?eXcvWDZMdkJQdEN4UUZVUm1qeGhXUFR0Y05tRWtpdk1EY2s1NmJHTUNxRUVu?=
 =?utf-8?B?a3RwalVlMmpQQzJ3QUgvS09iajhxK3RROEZpY2dWT0hxZC94bkY3Q05ENjBh?=
 =?utf-8?B?N2ZwL3h1SnhIeFNzTitrckxJS2NsZ3crbTVjYzJETlpzVmRRbXNMajU5N3lp?=
 =?utf-8?B?VDBieExGV2RYTzY2cmVtVUNIQ2YyQTdxWEgrZHlDR21BbGs4bmdUQ1NBQkxE?=
 =?utf-8?B?bjlIb2lzNU0wSUwrR1R2L3RzdTR4Sk5JQzNybVRFRjNoM3k0cjZhbUZtcUpU?=
 =?utf-8?B?d2RKNHAvcW9FSFR6YnJLSWJyUkV3a1ZWT1RQdXpWT1FvTk9uZXJrSTFLa2g0?=
 =?utf-8?B?R3Vpa3luRU9ORi9DcXpwQURXLzRFUTM2OVpNbnhwMzg2V3BIb0EycU8rRER3?=
 =?utf-8?B?MmhyY3dKT3dvM2VDR0tGZDM3WjBIREZXRS9ubFRpSGo5c0hnbFBJLzBKR2to?=
 =?utf-8?B?Mnphb2ttQ3FBQXY5Vk9mQVg5dW16S2ZXUjdQLzhlSVcrME5JN3MrZmExWFVn?=
 =?utf-8?B?SmZSVzRTVVJCSGZpV1lHUm1iME00TmxSWk1MOHd3MllnU1hxZXdJKzByenVB?=
 =?utf-8?B?eENEb0dDYTI0bkJPeUVubldvU0NYV2xCNFhmc1BrUU51WVQ0cHlkbTBNNjZy?=
 =?utf-8?B?L1prUXZLY2Q4VzRaSFArdjk0YW9hYTEzQzdrc0V6MGYwSWxNZTNldmg2OFlt?=
 =?utf-8?B?cEhlWDZIcnNQYlJ3Qk40VnhqMStlczRNTm4zNmRINGtJUnN4ZDZGVjRmV0Ir?=
 =?utf-8?B?dlNwdnlneUtmQ3RGMTlkNUcrSy8vWlZTNzdsaVpsN2dDdVJxT3RkMHZUcVhD?=
 =?utf-8?B?c291cStQa1J5clFkeFZkVVltOTdMOWQzK2sxVkptSHBaYmxHbzd6L2ZRNUlZ?=
 =?utf-8?B?UEU4cjZjUHhTOVRSSTN2d29tc1ZqcUdQNHFCMnh4QXVvTUJJTWNkYm5MbUhE?=
 =?utf-8?B?b0plMUt1Tnl3a0U0bkM2OW41NzBxbm9JaFZ3S0pZR2xLSlNDUXBoSDlqMURi?=
 =?utf-8?B?WFNpdktySVlCMC9oQTU0TVk4WXk3VElGdGJaVjc1ZFJpazBZODVBcUJoSzJV?=
 =?utf-8?B?Q1o5NjMvekt1bkx4M3lFbk9TNkVBRmxYSDhOU25FZkJJTXl0RFJjcnpTY2Ry?=
 =?utf-8?B?aWhmRHI2cms4bHRUbElwbjR2Qy8wdGttY3JpUWtMYUphWHJvaVVlNmE0VFUy?=
 =?utf-8?B?MUZaTFRLbWNFZTViZzlvb1dPTTVLdUVwN1pxekZ2MmhSejBYdDlYY0c3OFZ2?=
 =?utf-8?B?MGNJU3Z5OTFSYUlPNHZYcjZDcFRPem94cXZVUFZyc2JKdDcvNVFFMEpNTERn?=
 =?utf-8?B?ODZLak0ybkJhV1VUN2NiVlNQZDNMNFk3T1JCb2R5TXpjQTZJK1d3Z0I3Ukps?=
 =?utf-8?B?ZlhJc3hDN0xQUXVPZkJ2dkFSbkJVNXhCQUN3L3VQT2FuQW96am45b2FldUgv?=
 =?utf-8?B?Rk9pMDVaUUVWencxNEFoQnZyazk3OHpXTzc0TG9zenN1QXVrNGZaUDR6Qjhp?=
 =?utf-8?B?Z21RQjhRUTI0TGs0Z2ppdGRPUVhYWFlMeWNJM2JURU9lY3l1VTZVS0JkTDBM?=
 =?utf-8?Q?Vozul3wH5cUSEoVpe1lz7mYUIzxfjnQtwzFGo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXN1N3N0UFdPTStwRUNzMzMvdys0alkzWFBmQmlTTmVFZGtJUjdyNXpaVzhR?=
 =?utf-8?B?dFVtUnFLVHNLWnpMdHJ4L0lVdzZSWWdhVERrUzlxaDVRaWtSb3dEZUFSUXRu?=
 =?utf-8?B?YzNUMlNQWWxabEdUeEN2cUQvNnE1NExUU1VaNThadXNXcEtEeVptb203Z1JH?=
 =?utf-8?B?My92dzhPTEtTNU9iOExnQnVkUWdoclVqd01wY0h2N3NML3VFdi94VitaTlQ0?=
 =?utf-8?B?ZWNtYnp2U0V0czg1T2R6UGFBeGFuZG5SNVFHTThZbWd1NXpKdS9QcWM0amVy?=
 =?utf-8?B?bHM4MDU2bW1SZzdLL3MwU3gvWTBWY041NFpoQ2dDc0xaYXZQQnRmUitxWC9o?=
 =?utf-8?B?ZmxZL3M1YjQ0K1BJNU5LZTFaNWdVSnMvVVh3TjZjQnJITDJuVU8vZDU2c1lY?=
 =?utf-8?B?dWRIcllCRnBTVVRDL1ZLT0Y3c3pHeldjRG5JeTQ1S0Q1M3lHZkcyRlJjMVE5?=
 =?utf-8?B?TXppdnhWYVlPMSt4b3JmcU44S0R6cmtpeG1uQnFNYjNTWVpod2NxdWo4ak5j?=
 =?utf-8?B?SDlUN3Z0YzdlK2tZdGUwWGNvcWllRndpRkYvRmZUOUgzZ0xWbkRXYktMMjNI?=
 =?utf-8?B?VmpaZ2xObzBISzFUcGJha1lBMmdDaHRoWExrRm1uWnNWYzExSS9FSVNJdUN5?=
 =?utf-8?B?VjBLWVlQb0laTzJvKzlYTFprM3RhVU1oNTI1MU50c3JJcWd3TEJLRnRLWWJF?=
 =?utf-8?B?OGZLRUVzWVNCb0ZhVks0TFdJcm5Pb3VBK1g1VEZEWUpUVHA2RlRUTXBJajhI?=
 =?utf-8?B?OENmL254ang2MUNkaTkvWnNycmFIRjRhS29SUkExQSsxdTVtZEovK1hBVHdm?=
 =?utf-8?B?d2ZRY0ovbWg1NlVhbEYwZWxwMkJZdmhBcG1PSjg2dHB3bmU0cTgwemplM3g4?=
 =?utf-8?B?ZjgrMnJ2a0xMRlRjQlpQTjA1MW9rWEQ5UzF4SjV3RjB5WVFRQ3IxMEIrOEFi?=
 =?utf-8?B?OWFhc0RtQXk4bUsvNmJkVUR3cXVXYmNyaURhajgzOW1aK25kNWtCLy9uS09I?=
 =?utf-8?B?bDRtRXhiS2xFdTl6aU8vYkhnV2dLUzVUcVhCYkpGUGI0aFNBdStxWTVXNEp4?=
 =?utf-8?B?MHEwNndndElWUmQvOHh0RUY0Q01pN3dHQ3VnM0s1Q293ZkhCZHFaOUROWkFI?=
 =?utf-8?B?V1plc2NQOERHaGdaOW54MEF2Vm54SU5VZFlScGxPNDBaZVZBWVQ3V1JZdWJ0?=
 =?utf-8?B?MzFUTUV1Y2U2aXlUWVZHMTdIdDVKaUJXVWdNSytJZlcyYWFDcEhLTHJybnlP?=
 =?utf-8?B?Smt4MDlscThnQjBqeG9oRVJOb2FqYm9iL2RzSFlmOVdyV1RIbnlhOG56dVBw?=
 =?utf-8?B?WTc5QlRqZ3dCMHhVRDI3MWlMYVU5ZiswQ09LczA3RCt4RmsyWTlRczNPdE8v?=
 =?utf-8?B?bUc3MlNJWnh2ZTRsVWdDVGNRRGdTcnBFSGIzM05lV3Z5aGJTaGh6cGovR2dn?=
 =?utf-8?B?eHRmZ1R5azlPQjlFdTZqQTVnVHFsM2R6TWxXUUN4L1JTQkxucE1QUnI0YVRa?=
 =?utf-8?B?SGlCK2JuczJZeEhtTitPcnRTN0hkQkYzUlpFclJQcVVyN2hDNit6bjNxK3hK?=
 =?utf-8?B?eDlhdnBVRHhadGNkUXJFUU5IRk0xMEdRTllPVHhLYXlURHhMdkdzWjhuUlJ5?=
 =?utf-8?B?YUkzOWlRczNUUHJ4bHhHOTc1dk1SVG53dlA4STY2ejZnVVpGdjR1OGRoTzVR?=
 =?utf-8?B?U05FVytoSEFWOVhuaDcvcE13RjhkOFNBWGk2eGI3aS90MUt6d1VtY2NkUlB2?=
 =?utf-8?B?bVRSRGVuSWFTR2hOamNkRjN4VnY3YitVL2pyMzlqZGp0SjIvM25Zekhnd0Zw?=
 =?utf-8?B?S1pUWFl0YWxUQVVUaW1ZbVpiczhMZUxQTUk2RTBxRWRKdHhKNjZ0SXdyVEkz?=
 =?utf-8?B?TlIwN1dLS0VLbXNBVDVwN0t4QWJsNThqZ0Q0MWkySFgxWFljeW5yajJhUXRz?=
 =?utf-8?B?Sjg0YzZ5MXAwaU9NbDI3UlNmUWNjdmVBWHZKQVEzM2VBZUdNbXlUWitEajFy?=
 =?utf-8?B?TGpNNTRUNGZuN2lPa0hBR2NPbTM0UkxsUjV0alVGTkRPQURJNHZIL013RDNi?=
 =?utf-8?B?R3pCaU8wN3FWVkJkcFk1ZkhlSVV0MjRGUmFtNmxQQVVuNlpaZlJrMm9xOUJS?=
 =?utf-8?Q?9r/yobh1/FrAW7oGmeWay6iJ4?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47647085-f10a-41b4-9924-08dcd20fde94
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 03:14:38.2049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: De1/JxbmOlXBeyf9Zh/GPbRxbDsb5wfjfTMhyycLr/f/VvmC8ZTZr5B82Bc6aEK/uTf4JotckQc6S96RLc6PAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8787

Hi Dan,

Thanks very much for your reply.

On 2024/9/11 00:28, Dan Scally wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Keke
>
>
> Thanks very much for the patchset
>
> On 09/09/2024 08:24, Keke Li via B4 Relay wrote:
>> The Amlogic C3 platform integrates an ISP capable of supporting
>> multi-camera, multi-exposure high dynamic range (HDR) imaging with up to
>> 14-bit raw RGB Bayer data.
>>
>> Capturing images on the C3 involves operating the CSI2 receiver and PHY,
>> an adapter layer that integrates the inline processing from the PHY to
>> the ISP, and the ISP driver itself.
>>
>> This implementation consists of several distinct module drivers and
>> is expected to support different platforms in the future.
>>
>> The test result of v4l2-compliance:
>
>
> There are a few errors:
>
>
> Grand Total for c3-isp device /dev/media0: 613, Succeeded: 604, 
> Failed: 9, Warnings: 0
>
>
> Some of those complaints are about .get/set_fmt() and I think for 
> those the problem is that
> v4l2-compliance expects non-zero sizes for the 
> MEDIA_BUS_FMT_METADATA_FIXED, but the documentation
> says that that's right so there's a disconnect with v4l2-compliance 
> there - probably it needs fixing
> to adhere to the documented behaviour. On the other hand the errors 
> that are reported for
> VIDIOC_REQBUFS will need to be fixed.
>
>
OK, I will use latest v4l2-compliance to test  and fix the error.

Thanks again.

>>
>> v4l2-compliance 1.24.1, 64 bits, 64-bit time_t
>>
>> Compliance test for c3-isp device /dev/media0:
>>
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>>
>> Required ioctls:
>>          test MEDIA_IOC_DEVICE_INFO: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/media0 open: OK
>>          test MEDIA_IOC_DEVICE_INFO: OK
>>          test for unlimited opens: OK
>>
>> Media Controller ioctls:
>>          test MEDIA_IOC_G_TOPOLOGY: OK
>>          Entities: 12 Interfaces: 12 Pads: 20 Links: 23
>>          test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>>          test MEDIA_IOC_SETUP_LINK: OK
>>
>> Total for c3-isp device /dev/media0: 8, Succeeded: 8, Failed: 0, 
>> Warnings: 0
>> -------------------------------------------------------------------------------- 
>>
>> Compliance test for c3-isp device /dev/video0:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x84200001
>>                  Video Capture
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04200001
>>                  Video Capture
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000011
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x0000000f (15)
>>          Name             : isp-cap0
>>          Function         : V4L2 I/O
>>          Pad 0x01000010   : 0: Sink
>>            Link 0x02000023: from remote pad 0x1000008 of entity 
>> 'isp-resizer0' (Video Scaler): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video0 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>                  fail: v4l2-test-buffers.cpp(703): 
>> check_0(crbufs.reserved, sizeof(crbufs.reserved))
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/video0: 46, Succeeded: 45, Failed: 1, 
>> Warnings: 0
>> -------------------------------------------------------------------------------- 
>>
>> Compliance test for c3-isp device /dev/video1:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x84200001
>>                  Video Capture
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04200001
>>                  Video Capture
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000015
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x00000013 (19)
>>          Name             : isp-cap1
>>          Function         : V4L2 I/O
>>          Pad 0x01000014   : 0: Sink
>>            Link 0x02000027: from remote pad 0x100000b of entity 
>> 'isp-resizer1' (Video Scaler): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video1 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>                  fail: v4l2-test-buffers.cpp(703): 
>> check_0(crbufs.reserved, sizeof(crbufs.reserved))
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/video1: 46, Succeeded: 45, Failed: 1, 
>> Warnings: 0
>> -------------------------------------------------------------------------------- 
>>
>> Compliance test for c3-isp device /dev/video2:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x84200001
>>                  Video Capture
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04200001
>>                  Video Capture
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000019
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x00000017 (23)
>>          Name             : isp-cap2
>>          Function         : V4L2 I/O
>>          Pad 0x01000018   : 0: Sink
>>            Link 0x0200002b: from remote pad 0x100000e of entity 
>> 'isp-resizer2' (Video Scaler): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video2 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>                  fail: v4l2-test-buffers.cpp(703): 
>> check_0(crbufs.reserved, sizeof(crbufs.reserved))
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/video2: 46, Succeeded: 45, Failed: 1, 
>> Warnings: 0
>> -------------------------------------------------------------------------------- 
>>
>> Compliance test for c3-isp device /dev/video3:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x84a00000
>>                  Metadata Capture
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x04a00000
>>                  Metadata Capture
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x0300001d
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x0000001b (27)
>>          Name             : isp-stats
>>          Function         : V4L2 I/O
>>          Pad 0x0100001c   : 0: Sink
>>            Link 0x0200002f: from remote pad 0x1000004 of entity 
>> 'isp-core' (Video Pixel Formatter): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video3 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>                  fail: v4l2-test-buffers.cpp(703): 
>> check_0(crbufs.reserved, sizeof(crbufs.reserved))
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/video3: 46, Succeeded: 45, Failed: 1, 
>> Warnings: 0
>> -------------------------------------------------------------------------------- 
>>
>> Compliance test for c3-isp device /dev/video4:
>>
>> Driver Info:
>>          Driver name      : c3-isp
>>          Card type        : AML C3 ISP
>>          Bus info         : platform:ff000000.isp
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x8c200000
>>                  Metadata Output
>>                  Streaming
>>                  Extended Pix Format
>>                  Device Capabilities
>>          Device Caps      : 0x0c200000
>>                  Metadata Output
>>                  Streaming
>>                  Extended Pix Format
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000021
>>          Type             : V4L Video
>> Entity Info:
>>          ID               : 0x0000001f (31)
>>          Name             : isp-params
>>          Function         : V4L2 I/O
>>          Pad 0x01000020   : 0: Source
>>            Link 0x02000031: to remote pad 0x1000003 of entity 
>> 'isp-core' (Video Pixel Formatter): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/video4 open: OK
>>          test VIDIOC_QUERYCAP: OK
>>          test VIDIOC_G/S_PRIORITY: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK
>>          test VIDIOC_TRY_FMT: OK
>>          test VIDIOC_S_FMT: OK
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>                  fail: v4l2-test-buffers.cpp(703): 
>> check_0(crbufs.reserved, sizeof(crbufs.reserved))
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
>>          test VIDIOC_EXPBUF: OK
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/video4: 46, Succeeded: 45, Failed: 1, 
>> Warnings: 0
>> -------------------------------------------------------------------------------- 
>>
>> Compliance test for c3-isp device /dev/v4l-subdev0:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x00000000
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000041
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x00000001 (1)
>>          Name             : isp-core
>>          Function         : Video Pixel Formatter
>>          Pad 0x01000002   : 0: Sink
>>            Link 0x02000036: from remote pad 0x1000035 of entity 
>> 'mipi-adapter' (Video Interface Bridge): Data, Enabled, Immutable
>>          Pad 0x01000003   : 1: Sink
>>            Link 0x02000031: from remote pad 0x1000020 of entity 
>> 'isp-params' (V4L2 I/O): Data, Enabled
>>          Pad 0x01000004   : 2: Source
>>            Link 0x0200002f: to remote pad 0x100001c of entity 
>> 'isp-stats' (V4L2 I/O): Data, Enabled
>>          Pad 0x01000005   : 3: Source
>>            Link 0x02000025: to remote pad 0x1000007 of entity 
>> 'isp-resizer0' (Video Scaler): Data, Enabled
>>            Link 0x02000029: to remote pad 0x100000a of entity 
>> 'isp-resizer1' (Video Scaler): Data, Enabled
>>            Link 0x0200002d: to remote pad 0x100000d of entity 
>> 'isp-resizer2' (Video Scaler): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev0 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          test Try 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not 
>> Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 1):
>>          test Try 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || 
>> fmt.width > 65536
>>                  fail: v4l2-test-subdevs.cpp(370): 
>> checkMBusFrameFmt(node, fmt.format)
>>          test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || 
>> fmt.width > 65536
>>                  fail: v4l2-test-subdevs.cpp(370): 
>> checkMBusFrameFmt(node, fmt.format)
>>          test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not 
>> Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 2):
>>          test Try 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || 
>> fmt.width > 65536
>>                  fail: v4l2-test-subdevs.cpp(370): 
>> checkMBusFrameFmt(node, fmt.format)
>>          test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>                  fail: v4l2-test-subdevs.cpp(325): fmt.width == 0 || 
>> fmt.width > 65536
>>                  fail: v4l2-test-subdevs.cpp(370): 
>> checkMBusFrameFmt(node, fmt.format)
>>          test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not 
>> Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 3):
>>          test Try 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not 
>> Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not 
>> Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev0: 72, Succeeded: 68, Failed: 
>> 4, Warnings: 0
>> -------------------------------------------------------------------------------- 
>>
>> Compliance test for c3-isp device /dev/v4l-subdev1:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x00000000
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000043
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x00000006 (6)
>>          Name             : isp-resizer0
>>          Function         : Video Scaler
>>          Pad 0x01000007   : 0: Sink
>>            Link 0x02000025: from remote pad 0x1000005 of entity 
>> 'isp-core' (Video Pixel Formatter): Data, Enabled
>>          [  124.084364] isp-resizer0: =================  START 
>> STATUS  =================
>> [  124.085234] isp-resizer0: ==================  END STATUS 
>> ==================
>> Pad 0x01000008   : 1: Source
>>            Link 0x02000023: to remote pad 0x1000010 of entity 
>> 'isp-cap0' (V4L2 I/O): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev1 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          test Try 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test Active 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 1):
>>          test Try 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not 
>> Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not 
>> Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev1: 58, Succeeded: 58, Failed: 
>> 0, Warnings: 0
>> -------------------------------------------------------------------------------- 
>>
>> Compliance test for c3-isp device /dev/v4l-subdev2:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>> [  124.130974] isp-resizer1: =================  START STATUS 
>> =================
>> [  124.131838] isp-resizer1: ==================  END STATUS 
>> ==================
>>          Capabilities     : 0x00000000
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000045
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x00000009 (9)
>>          Name             : isp-resizer1
>>          Function         : Video Scaler
>>          Pad 0x0100000a   : 0: Sink
>>            Link 0x02000029: from remote pad 0x1000005 of entity 
>> 'isp-core' (Video Pixel Formatter): Data, Enabled
>>          Pad 0x0100000b   : 1: Source
>>            Link 0x02000027: to remote pad 0x1000014 of entity 
>> 'isp-cap1' (V4L2 I/O): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev2 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          test Try 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test Active 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 1):
>>          test Try 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not 
>> Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not 
>> Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test V[  124.177400] isp-resizer2: ================= START 
>> STATUS  =================
>> [  124.178270] isp-resizer2: ==================  END STATUS 
>> ==================
>> IDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev2: 58, Succeeded: 58, Failed: 
>> 0, Warnings: 0
>> -------------------------------------------------------------------------------- 
>>
>> Compliance test for c3-isp device /dev/v4l-subdev3:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x00000000
>> Media Driver Info:
>>          Driver name      : c3-isp
>>          Model            : c3-isp
>>          Serial           :
>>          Bus info         : platform:ff000000.isp
>>          Media version    : 6.11.0
>>          Hardware revision: 0x00000000 (0)
>>          Driver version   : 6.11.0
>> Interface Info:
>>          ID               : 0x03000047
>>          Type             : V4L Sub-Device
>> Entity Info:
>>          ID               : 0x0000000c (12)
>>          Name             : isp-resizer2
>>          Function         : Video Scaler
>>          Pad 0x0100000d   : 0: Sink
>>            Link 0x0200002d: from remote pad 0x1000005 of entity 
>> 'isp-core' (Video Pixel Formatter): Data, Enabled
>>          Pad 0x0100000e   : 1: Source
>>            Link 0x0200002b: to remote pad 0x1000018 of entity 
>> 'isp-cap2' (V4L2 I/O): Data, Enabled
>>
>> Required ioctls:
>>          test MC information (see 'Media Driver Info' above): OK
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev3 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>          test Try 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test Active 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 1):
>>          test Try 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Try VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>          test Active 
>> VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>>          test Active VIDIOC_SUBDEV_G/S_FMT: OK
>>          test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not 
>> Supported)
>>          test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK  124.223764] mipi-adapter: 
>> =================  START STATUS  =================
>> [  124.224637] mipi-adapter: ==================  END STATUS 
>> ==================
>> m (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not 
>> Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for c3-isp device /dev/v4l-subdev3: 58, Succeeded: 58, Failed: 
>> 0, Warnings: 0
>> -------------------------------------------------------------------------------- 
>>
>> Compliance test for device /dev/v4l-subdev4:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x00000000
>>
>> Required ioctls:
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev4 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not 
>> Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for device /dev/v4l-subdev4: 43, Succeeded: 43, Failed: 0, 
>> Warnings: 0
>> ---------------------------[  124.269696] mipi-csi2: 
>> =================  START STATUS  =================
>> [  124.270587] mipi-csi2: ==================  END STATUS 
>> ==================
>> -----------------------------------------------------
>> Compliance test for device /dev/v4l-subdev5:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x00000000
>>
>> Required ioctls:
>>          test VIDIOC_SUDBEV_Q[  124.273752] imx290 2-001a: 
>> =================  START STATUS  =================
>> [  124.274678] imx290 2-001a: ==================  END STATUS 
>> ==================
>> UERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev5 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not 
>> Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for device /dev/v4l-subdev5: 43, Succeeded: 43, Failed: 0, 
>> Warnings: 0
>> -------------------------------------------------------------------------------- 
>>
>> Compliance test for device /dev/v4l-subdev6:
>>
>> Driver Info:
>>          Driver version   : 6.11.0
>>          Capabilities     : 0x00000000
>>
>> Required ioctls:
>>          test VIDIOC_SUDBEV_QUERYCAP: OK
>>          test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>          test second /dev/v4l-subdev6 open: OK
>>          test VIDIOC_SUBDEV_QUERYCAP: OK
>>          test for unlimited opens: OK
>>
>> Debug ioctls:
>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>          Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>          test VIDIOC_QUERYCTRL: OK
>>          test VIDIOC_G/S_CTRL: OK
>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>          Standard Controls: 12 Private Controls: 0
>>
>> Format ioctls:
>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not 
>> Supported)
>>          test VIDIOC_G/S_PARM: OK (Not Supported)
>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>          test VIDIOC_G_FMT: OK (Not Supported)
>>          test VIDIOC_TRY_FMT: OK (Not Supported)
>>          test VIDIOC_S_FMT: OK (Not Supported)
>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>          test Cropping: OK (Not Supported)
>>          test Composing: OK (Not Supported)
>>          test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>          test VIDIOC_EXPBUF: OK (Not Supported)
>>          test Requests: OK (Not Supported)
>>
>> Total for device /dev/v4l-subdev6: 43, Succeeded: 43, Failed: 0, 
>> Warnings: 0
>>
>> Grand Total for c3-isp device /dev/media0: 613, Succeeded: 604, 
>> Failed: 9, Warnings: 0
>>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>> Changes in v2:
>> - Modify coding format of the YAML files.
>> - Replace dev_err and return with dev_err_probe in probe function.
>> - Change clock[] to clocks[] in struct c3_xxx_info.
>> - Change clock_rate[] to clock_rates[] in struct c3_xxx_info.
>> - Change clock[] to clks[] in struct xxx_device.
>> - Link to v1: 
>> https://lore.kernel.org/r/20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com
>>
>> ---
>> Keke Li (9):
>>        dt-bindings: media: Add amlogic,c3-mipi-csi2.yaml
>>        media: platform: Add c3 mipi csi2 driver
>>        dt-bindings: media: Add amlogic,c3-mipi-adapter.yaml
>>        media: platform: Add c3 mipi adapter driver
>>        dt-bindings: media: Add amlogic,c3-isp.yaml
>>        media: Add C3ISP_PARAMS and C3ISP_STATS meta formats
>>        media: platform: Add c3 ISP driver
>>        Documentation: media: add documentation file metafmt-c3-isp.rst
>>        Documentation: media: add documentation file c3-isp.rst
>>
>>   Documentation/admin-guide/media/c3-isp.dot         |  26 +
>>   Documentation/admin-guide/media/c3-isp.rst         |  96 +++
>>   Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
>>   .../devicetree/bindings/media/amlogic,c3-isp.yaml  |  98 +++
>>   .../bindings/media/amlogic,c3-mipi-adapter.yaml    | 108 +++
>>   .../bindings/media/amlogic,c3-mipi-csi2.yaml       | 124 +++
>>   .../userspace-api/media/v4l/meta-formats.rst       |   1 +
>>   .../userspace-api/media/v4l/metafmt-c3-isp.rst     |  39 +
>>   MAINTAINERS                                        |  24 +
>>   drivers/media/platform/amlogic/Kconfig             |   3 +
>>   drivers/media/platform/amlogic/Makefile            |   4 +
>>   drivers/media/platform/amlogic/c3-isp/Kconfig      |  17 +
>>   drivers/media/platform/amlogic/c3-isp/Makefile     |  10 +
>>   .../media/platform/amlogic/c3-isp/c3-isp-capture.c | 788 
>> +++++++++++++++++
>>   .../media/platform/amlogic/c3-isp/c3-isp-common.h  | 327 +++++++
>>   .../media/platform/amlogic/c3-isp/c3-isp-core.c    | 696 
>> +++++++++++++++
>>   drivers/media/platform/amlogic/c3-isp/c3-isp-dev.c | 486 +++++++++++
>>   .../media/platform/amlogic/c3-isp/c3-isp-params.c  | 888 
>> +++++++++++++++++++
>>   .../media/platform/amlogic/c3-isp/c3-isp-regs.h    | 683 
>> +++++++++++++++
>>   .../media/platform/amlogic/c3-isp/c3-isp-resizer.c | 778 
>> +++++++++++++++++
>>   .../media/platform/amlogic/c3-isp/c3-isp-stats.c   | 491 +++++++++++
>>   .../amlogic/c3-isp/include/uapi/c3-isp-config.h    | 537 ++++++++++++
>>   .../media/platform/amlogic/c3-mipi-adapter/Kconfig |  16 +
>>   .../platform/amlogic/c3-mipi-adapter/Makefile      |   3 +
>>   .../amlogic/c3-mipi-adapter/c3-mipi-adap.c         | 949 
>> +++++++++++++++++++++
>>   .../media/platform/amlogic/c3-mipi-csi2/Kconfig    |  16 +
>>   .../media/platform/amlogic/c3-mipi-csi2/Makefile   |   3 +
>>   .../platform/amlogic/c3-mipi-csi2/c3-mipi-csi2.c   | 937 
>> ++++++++++++++++++++
>>   drivers/media/v4l2-core/v4l2-ioctl.c               |   2 +
>>   include/uapi/linux/videodev2.h                     |   4 +
>>   30 files changed, 8155 insertions(+)
>> ---
>> base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
>> change-id: 20240903-c3isp-7cfe70bb2583
>>
>> Best regards,

