Return-Path: <linux-media+bounces-17544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C85FC96B5FF
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 11:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C91D1F24CBB
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 09:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B921CC165;
	Wed,  4 Sep 2024 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="VNF1fH14"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2122.outbound.protection.outlook.com [40.107.117.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F94146A71;
	Wed,  4 Sep 2024 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440852; cv=fail; b=f9o7jrJobIarRHvtyLTmYDTeKsk8FP6yRlezVjZk7yZ7BgzqDmqZCgVBejAfncjGaOsIGUg9WSl40YE3+/z6q94err+p5gN6l5QukF0ZV3zWXQQVbjh8eVOl4cEUvptWOkZ7116QcWiUScfmEjYZAnjMuz6GBMAA113Svz7ZyCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440852; c=relaxed/simple;
	bh=it809JRsWazaSCLNaDNCkRrChfD0qfLL+FBK0QnTjZw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iMEIhoEh97Msj8T3L5WTaN+IY+cVGCM+vn3lojBABn4roRT9k3si71YcJUf0i3EuWPs5AxQ5JKVSIcYEMqPHUMSEATXHewTKX/j5UPhw1c540aeYv0st6auYp1hdIJ6KSOG/quWQ96LyoMbs7lrjXhy9X7TqHgiE/DlYLRHyrEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=VNF1fH14; arc=fail smtp.client-ip=40.107.117.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qD5EXSg/VwYY6d05PET8NPpdEjS39GJ4xScgl6Wf3NOcWS3my4gD304upRBlnnt/Pvgf+ckzq3mcpvMkacO/JrmYJfeOXJPfYvK1EqwTOy8OX5SCy1JR1M3XUrIXRRkCZ8Uj+tUX8xMMNZ+OqpnFf8EyEjHRZ6+XxI/c292P4E5YVskMhc+C4hv88rUYqS75JfQHQdLHF93kuhdeUa/uzzdhZ26EdTqQETe/+nf/jh47p8rfwja0WGz+XMkug3qn5GXtEcbK8l7sZl8MJpfVGbvnlMUFovMBXxB+6Y9zefwYwJvq2ICiizNcI7CNounU3Y0qO1CuvFE9EhKkXysx6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuGxeIueiGZMpslRX6gJjGPuI0ZPSvj9Hw3erw7Digs=;
 b=Md0Saby7ToBX9ZRU7DyBivEOMdwuam2HVlrikYRxo0RUPX4LTWi5xoBQhud5BcpJlV1ibVPqqoy01m5kuqN0i91ws140BGOVJDoyFOsT0fFfcFfGGUVlNNQFuP89RlET7rsU2kLU1Pew8pH9RiGJ2bW3/JdIvmKEHAeRKifLdVXvZgJb4pkunyQz55BuhIQCM1AsDFL0XSzml1g7npc9DWz6EzoIckL7ru7kaF1Rwd9c+8mkPJEc6dmC4D4WGMJOQnDamRHKqnneEuhf4Bll0uJWEIh6Hx4XP/cLybiY97ti8vo+XNvJ9OkEWknc/xObXJdc+s6mqo/E0rJ3UBxndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuGxeIueiGZMpslRX6gJjGPuI0ZPSvj9Hw3erw7Digs=;
 b=VNF1fH14m0SE5t7UtRGJTRS8YQdzvr5/GtrrDv05yQvlUP1E3z0uOX9mP3RUBwZ6egBJ8dLbfsjkgW4rNYYxcy7/wT1oko58QMhMRti5KHLZjS4IdELGvdujK8KaL1m6k2a21nMoAsMTzP9ydei53rRT7JzB1DTY8PNqvHE4WvxecnURDp6TqgOTkjztPtUnCF3+67jC+45509DQBlgmpWDMnsYy6Rr6ZxZGv7MDGmna5aazEWiQhVIcQG3dSJyO6AXmRz2e7N8hxTDXI+eD8h/pGIbHKJ3R+b/ftJXqHn2uSZ4L2MRSMBxAZBnsuSYPNDS1ApfckM5bRP7Wtxns1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by SEZPR03MB8358.apcprd03.prod.outlook.com (2603:1096:101:192::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 09:07:23 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 09:07:23 +0000
Message-ID: <0631d298-2ecc-486a-a9c1-9b7662d6222c@amlogic.com>
Date: Wed, 4 Sep 2024 17:07:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: media: Add amlogic,c3-mipi-adapter.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
References: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
 <20240903-c3isp-v1-3-8af0edcc13c8@amlogic.com>
 <84c4b625-0466-42eb-be11-18b48228cf50@kernel.org>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <84c4b625-0466-42eb-be11-18b48228cf50@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:820:c::15) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|SEZPR03MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: c52d27c1-94ec-4e90-a008-08dcccc0fd51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OW1mbHlVdE9FdVJ4WmtzdVQ0M3dCZmFodmt4SFBkUzd5S0pHcXJHckhmWDkx?=
 =?utf-8?B?VzdLU013Ulh3bFN5c21aNyt6TEVSVk1iOHZLdHlTR3M5UHBjRE9PbHlpMXJS?=
 =?utf-8?B?aHdsZnBnTWdmU2dJL2U2VUVwTDlPZFIyZm4zenNUaHlIejhUWmNOVlJwQ09O?=
 =?utf-8?B?aDV6bUM2bU9PUGVzQUV4aUIwNlMrQzhzY3lSMENFZUxNTE9HNDFhQ1p0aGIw?=
 =?utf-8?B?ejFKVlZmdmVzMmd6VjI0WHgwUjgwNVkydE9DL29JZUo5UHpQUVIrcW9xZnQ2?=
 =?utf-8?B?OGJrWGtZV0tBbnBhSjBxeFpyTEt0aEtzaWVRRDgyblNETFF3Y0VEZTFldnNz?=
 =?utf-8?B?VEpGbE5UYSthSzFSZzduNlRnZm1QdFFDRWF2cklwY05TRHI0aFV2Y1FSdzZS?=
 =?utf-8?B?Z1ZlSU5NdEhQOER3WXpxUU5UVFozYzFDaU1tLzIwVVFnSU1tRmprb3dlS1hR?=
 =?utf-8?B?Wit0RW9vV2twdXAvOUtSV1JRb3plVytDRmFXUTVNamt3dmxDRnpPbmpFV1hi?=
 =?utf-8?B?aE5QL3N6VmdJNmV0bWtrdjY3eXRreVExLzBqWi9xbjdSL2U1M1JRTUxrb2U2?=
 =?utf-8?B?UHBHSmlxQW1ML0M5UWtIemxncmNhRXUrcXFCTXRBbXZ3d3lNNnpJWHJ4eVdu?=
 =?utf-8?B?M1pVcTBmVmI3Sjg3ZCtVQVVXUGJjL2ZwS2VGYnJRZjdNaUJVQ2w1TEJrb3hn?=
 =?utf-8?B?UGNqakVpdTljVGluMC9IMW8vMytYOExJZUtLSm41RFUrVUIxQ2EzTUNDYmc1?=
 =?utf-8?B?Rk1tZmlsTnFkOTY3OUdnaGNyd1kzMmNPT3VWcXUraDZXNVozZVhQZ1hXNWl6?=
 =?utf-8?B?dXFxY3V2Z25ldzRhUGd2QTkwYjVhc0VkdGpkazc0d1BQSmRQZTJGVE9sOFFr?=
 =?utf-8?B?NXNoL1BpMGxtMlZaeUsvelByZmNZVEFkZXJzQzhVb3R3UUFaelFwMFYzWW5V?=
 =?utf-8?B?SzdFaTlHNC9rMnZYUndJTEtCMXd5MU5YdUZiM1ZVR0liYnkrTDdScUlUcXZ2?=
 =?utf-8?B?MmNDZEkrdG5TeVp6STNzcUt2SlAzOVN4NFZlaXNTMnBKUFJKVjZiRkVtSGZx?=
 =?utf-8?B?aldYVUkzZDdOLzhBelBRc3c5RW1FYmpxSklCZDdqc0h3K2ZMemYwaGJBaVMz?=
 =?utf-8?B?Q3dXR1VrYS95ejE3UHExOTBXYXp2UDhWOVZQcGVRbTBZNkl0MjhLTlZPR29L?=
 =?utf-8?B?NnJlekdCY0dJYk56cTBER21UVzJiR0ZrQjJJSDFlUytQZ1VJR0tFMjJBTkdQ?=
 =?utf-8?B?NEFJZDVmMERBUitDRC9KcjNWY1duZUluUXFERWdZemphNERIWWVGcmpKVWVC?=
 =?utf-8?B?U2liRGlmbVhrNUdVNHJUN2E5VVJENWtkVFRzTzdPZFNRUWFnRFpESmRObXRB?=
 =?utf-8?B?eWc5cTdoZVVtOTBVLzE3SHd5NGpyUlJJS3FkdDNwZ3U1TllkV0ZUZXl4dFhx?=
 =?utf-8?B?SWp4K2huRWo0eExoczFoYm9RdmpmaGgyYU0vOStOM2ZlNUppeUJQOTl6bytW?=
 =?utf-8?B?R3RLUWJDY2ZDUk9YbG95emVkdFNpMzlZeVIrbkVlbllMTmRyenVJWUk4Q3BS?=
 =?utf-8?B?Wk1YZ0VkQ1lOT0JVUUhSdVB6WFYxQlluYkcrT3NmcVdKS0R1aVJ3UGdhaGFH?=
 =?utf-8?B?ejNxb0I5UkVEM3JyRlRWMGxzVHExK0NTUUExV0dDd3Y3NFN2QWZ6aG9VaWY1?=
 =?utf-8?B?YmZVTXBKSlVhVWsxakxpWUlvbXpjdzN0OHovODEwS0xVVW1QNE5lUXo1aTdh?=
 =?utf-8?Q?6Cwibwk6R/S00+jnYE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzU3QnhZbWtIcjNSMUVKNk1KcEZ0RjR2ekNtVTlCVERKR2JsditNTEpHMi84?=
 =?utf-8?B?U2Z6M3hFZDhVZlBHNEp3NHR0bm5wV1AvcW9PS0g1WDYrS2lldDhBVXduU0U5?=
 =?utf-8?B?NlZvdU9HZVYxNGZzSXY5SWwrbyt5WXp3dTNlSFlUSkNVS3JTVmZFUlo5bVJn?=
 =?utf-8?B?Q1NBUUZQSXJvcTVNVlYvOTgxUTVSUjJtSWI5Ti9KVk1zRTJxcUYrNWFqMW9Q?=
 =?utf-8?B?dWRGYTZjZ2ZxVWtRSVA0bUFnK2ZMT0JyN00vSGZXd1FqN3pDeTdIaHhYRnhR?=
 =?utf-8?B?YjdPd3VQcTB1cE1lNkdEb1IvQ0U5SWREOGhQUW4xZ0pCTEdtRmlMQTBxSjlm?=
 =?utf-8?B?MXRFZjdWczZFZTN0Q2R0KzM2MHpDRmVSRVErZGdGL2lBaUp1ZGUrZW5kelRa?=
 =?utf-8?B?ajVkOXJvNXBqSjg1MHkyK1YxeU14U1FXVmdnTEcySENQTWxZZkgvMFdPNWMy?=
 =?utf-8?B?NUNQbC9FZ084UDY2dHZvQjdodHlCNlIxUEZ0QUhobnFTZWtReHE0cy9vQ1I2?=
 =?utf-8?B?RmJZMEZkczJTckRSMTFhM3dZYzdOZTVDWjVqWTkxbEhmVXJxSDZ6NXBacnVT?=
 =?utf-8?B?WllnQTR0aFYydmMwODEwUHJNWEdCcHZNK2Uyd1FhU1BxemhZTEJTdzdHWVB4?=
 =?utf-8?B?dW4zRnhwL3ByRGNlblNReVJIL3pWV2RRbFo2WjVLZkhYTEE4MnBjNjlKYzZy?=
 =?utf-8?B?ZFpFYTVXcU9zZTNXeVlnN2NKVVI2VjIzTnNPSzlHV1liYlZtY1pYZm91UStJ?=
 =?utf-8?B?alErL3hjQmZSUTdOaUIya0UrR0twazhLamNyUHNkWXJHOFZhbStpczFwSEt3?=
 =?utf-8?B?NDRtWFJlVjVpZy8xaHRsdlpHZDk1T2lqZU9TYVBycmQ0VGI1VnpZbVpDWkVL?=
 =?utf-8?B?bnNIbjAvZVc2T2RScFB2dys3Slk2TFJUT1ZGeEtaUFp1QnF1TFZRZTJVMkVs?=
 =?utf-8?B?ZEZJZHEwckpVdGxpQzJlZGdVbVBrZjVFc1pBMTVtWlhlbTRnK0ZaakpOcGds?=
 =?utf-8?B?bGd3cGt3UmhOblVZVEJwZC9tZ3Bma1J0MzNjZjBIYUhxY1lFODdWd21SWWNE?=
 =?utf-8?B?TWtjeURBUFA4RitCN3lyQ2sxOWF1MG1vdlhMVXo1MGRLYXRaZ0RnYVNrc2Ur?=
 =?utf-8?B?VzRWQWFYcXJKREZEcTZGRFhHVlZTRnF1aVpOanMxZ1RYQTcxK25MUktTdTUv?=
 =?utf-8?B?a2NnTXA2WG9tOUYxZFQ3bU1UV2J3MmI1RmdqYWR5S2M5QmZhZHRucEcrc09l?=
 =?utf-8?B?V2pGUE9aeTB2M1NaV2xKek8vWnozZXlYcWVxbHhqWk9xQWgvMHFiclFGVzRB?=
 =?utf-8?B?Wkw3SEJXbHBFcm1kWnhtYWxuMDF6V0tVRnVTWG9PYWxjRlNrUnk3SG5uSDN1?=
 =?utf-8?B?OTk1Rmt1RXpyYUpjakRlUmlNMjZUL0FqZnNFeDg2azZtYTNJcEZCeDQvZldm?=
 =?utf-8?B?TWdCcStKdWxhSXRwRzdlZUpRbzVEbHp0UkJWdGdSaDVFR1g1SHh4VldZMjND?=
 =?utf-8?B?U2lHQVFXTENYY2RDS3lVdmNqVnlldTQ0eVFDY0xaazJtYjFjVlErejBHWTVp?=
 =?utf-8?B?UHh0a3VyVkdaam5PUE96UVd4b3FLVXZvQnRic0JhRGd4bXRjeFFGendhZExl?=
 =?utf-8?B?anppSTNQYXgwRXpqTW02ZHF3Y05uWTEwTzdPaXU0UXgrdEdoZEtOYjRtYzB1?=
 =?utf-8?B?eEZmMi9SMjNLelkvckxkUENFR1IyRzZPNHoyMXF2Q3pRUE9VOHp4VHc5L3pJ?=
 =?utf-8?B?ZFJXNzRuK09kZFp5YzFsRXlEOFVEdDFwRUd4bTRxY2ExRWsxN0svcFlITmQr?=
 =?utf-8?B?RXVkZ1gwai95N2U3OE9jT3NKTnZRY0NVYm9WdURxOHd0a2dwdHFQQ0VpbTl5?=
 =?utf-8?B?MFRlcUV3YnNMemhQRnR3OHRGQmd1UjNzdjF1Nmd3K0poSE10RkQ4Y3pTdDBm?=
 =?utf-8?B?bCtES09ueVdWVkZBd1dJVFJTQ2JacmxhdHF0VGdPYWc2Mjc3OTZIMm9xaGdK?=
 =?utf-8?B?YVR0SmxKZ0cyYWdLcFMxSnZLR01tUEJMQVd0ZkFTd2Fkd2V5aFRZckpNdnAx?=
 =?utf-8?B?R2JUcmR1N1ZOQzVWb3NrZkIyYmtPRmtUMlp5eFJ6YzQ2ME5TWWtxSzhTYklL?=
 =?utf-8?Q?CoMURNjnwDc2CzxPIEvBU+UYI?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c52d27c1-94ec-4e90-a008-08dcccc0fd51
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 09:07:23.6684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9uheG38yRiSDn+BdLYFBNWvKwMQPe+pOuOGkMGSbEJrRxywqhCq0k1+eGeLDb64yUj2980YihyprPEfVk5Elg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8358

Hi Krzysztof,

        Thanks for your reply.

On 2024/9/3 22:11, Krzysztof Kozlowski wrote:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> On 03/09/2024 08:57, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> c3-mipi-adapter is used to organize mipi data and
>> send raw data to ISP module.
>>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>>   .../bindings/media/amlogic,c3-mipi-adapter.yaml    | 114 +++++++++++++++++++++
>>   1 file changed, 114 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
>> new file mode 100644
>> index 000000000000..e1873fe829c7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
>> @@ -0,0 +1,114 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/amlogic,c3-mipi-adapter.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic C3 MIPI adapter receiver
>> +
>> +maintainers:
>> +  - Keke Li <keke.li@amlogic.com>
>> +
>> +description: |-
> Same comment.
OK,  get it.
>> +  MIPI adapter is used to convert the MIPI CSI-2 data
>> +  into an ISP supported data format.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,c3-mipi-adapter
>> +
>> +  reg:
>> +    minItems: 3
> Same comment.
OK, get it.
>> +    maxItems: 3
>> +
>> +  reg-names:
>> +    items:
>> +      - const: adap_top
>> +      - const: adap_fd
>> +      - const: adap_rd
> Same comment.
OK,  get it.
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 2
> Same comment.
OK,  get it.
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vapb
>> +      - const: adap
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: input port node.
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: output port node.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - power-domains
>> +  - clocks
>> +  - clock-names
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/amlogic,c3-peripherals-clkc.h>
>> +    #include <dt-bindings/power/amlogic,c3-pwrc.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        adap: adap@ff010000 {
>> +            compatible = "amlogic,c3-mipi-adapter";
>> +
> Same comments.
OK,  get it.
>
>
> Best regards,
> Krzysztof
>

