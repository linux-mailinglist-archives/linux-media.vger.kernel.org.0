Return-Path: <linux-media+bounces-52695-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB2aEi/bjmkxFgEAu9opvQ
	(envelope-from <linux-media+bounces-52695-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:05:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3B9133C98
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81CA33047037
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 08:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F6231984E;
	Fri, 13 Feb 2026 08:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="xa8lPT3Q"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022116.outbound.protection.outlook.com [40.107.75.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DE62F532F;
	Fri, 13 Feb 2026 08:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770969892; cv=fail; b=HKxOQnD1f/z0LAe7/8yy16xC1pKlU3fRL/WvJonlFrji0lDHBLDAwQf9bKGbIclbPzYdex8pMZMV/lRppmAEKnOWevawxiHb6suKgwhMgJrYX7gs4sx+zEDxabSw+atnqsIOCVooTu92jNXxL781fMH8eJhTaeySBX47pKN+KPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770969892; c=relaxed/simple;
	bh=bxhPGTqo11ZQsPHTBCwbBUkgXchoBNo8amnuWXllhuY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=agO7X6TqFVa2/YIcLLr4IxRpPA1SOnVsLE6cqdmIOnWgSaDLDGHauPkoORPfn8brw9GodT9dGoWIy8y3I7Bfd11IyiHp5WeITeIR310s8QB0M333aWUnDqOJ3p+iOMB/sEhhrFxTdPV9P3+dopnUYdJetuOlNy+JZCF+8pNMwPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=xa8lPT3Q; arc=fail smtp.client-ip=40.107.75.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBNNc8nJmBw47A/OZM4CwHpLnsGiK61N9NaWCXd3qpJbPl+WbeUG8KnUN728f5Hxv59ZZCQdAeK+Y1WYmJpKWD3/fJ6o1fwUhFaGhkAUWcibZ0Mdbc0z3HE+6Bl8vdftSaM4EjsEpwwiGGqa5fUBPJ66dtXa17BT5ZLiCCGm5ttv9Q6EJBmhrmHCd0pu6BqbZ//jZ33CfNlmu8fd2ChwQc8T1+qsSHc2xbQTkuZfJU7ODudDo/5Hwr40YRkrUA6eKTmoFm61FXJ9lWGB/m5T7ZkqCfGdYOA3NzeEaZNKAD5Sb7/4aXL982zHu1P13aC+ldUvPrJoyETOWXwT61bCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZmwKAJvmnP0kkVIQtzPnIsLb1mF9IK9U3BovZEA6JM=;
 b=oYLDOuoAnUh0JhFDdMyiJDeDnyTFPqNiyN1ZIF087wPLwtr46jSLd6ZEofLMvyqSZVMrs+RSOceRJCSqjFYxBkunZDxkv6mbaWku1h0+oy6bmQ+WZtrBI5UgifeZLZExZPPPpBfVi3C/r5SQpcGfXQvIGvi/LeW71iuCnhxWRiBfLrzGHmXMn3MeblrPxNIo9GKo32cEmPd+UQlM0tTDBab0kHPjLsFeeAQtviBlYkI93iGrvr6nBhe2Wjywsyx33ecPyZQVBtAIQApfPuTNNlRC+qbBxJrwEtFCQYyt8B3NUrdyMzvRb9XJNkEuODXm+ojntEmCe+jPLRWQJA+1nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZmwKAJvmnP0kkVIQtzPnIsLb1mF9IK9U3BovZEA6JM=;
 b=xa8lPT3QXRRmWGjUncvAWyIzHzRbjBO/M6bsOjPMDL3U5KXcg2G1s99Sc9rdf/+iygu/Nw2+lke/X9P4mAxTKnIunSnAzeL/FdTHbza39NXEsIpHGsFb/GWl+qdUnrlIfm0SZ2hH7vgg5ICWyczWjOr93ckxASLIlHu7U/c2MPYbNmpWETA+GLVfYag2QQN5ey18LCzf/oIGsZD9mkvd9C4qGGi+XsAr3ptmHMY2O63+ZE8itMRSrblSiqWNCGee9hhsD48IKr7yjplwqXViVhpXYvLvGeqR94fzUfh+lvq0meaYcoMVHvhQ12DgSYhG7WVaaIF+ZU9meirVbywi4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by KUZPR03MB9568.apcprd03.prod.outlook.com (2603:1096:d10:62::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 08:04:48 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 08:04:48 +0000
Message-ID: <fd56ede0-5d62-42ec-8d19-19552b246c7c@amlogic.com>
Date: Fri, 13 Feb 2026 16:04:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|KUZPR03MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: dba7c2c6-e8c7-4198-6cf3-08de6ad68e78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0dydmM2V0Z1WVRGYkd3V2hWSEdWbGpyUHBEN05ETVl4Rm11YjVIYnpwNmlP?=
 =?utf-8?B?S1RIbTdUQmVYbmlBZS9VRkdESi92b0pDSkFiMzJnU3VEZzdxaitzdmduajdy?=
 =?utf-8?B?RWlTQWJDd1ZpaFA0Y1k3c0NCRmJYdStKUXNickFEbGd5TU11RU44RlpmRGJr?=
 =?utf-8?B?RmwzZmEzKzMzU0J4SHVEbERqME8yUTMycUplNG8vNFVxVUFmZHNWODVrMW9E?=
 =?utf-8?B?OGYwdHEzQnd2QUh0MGVEZnJjQVRNVktXcHVHMjJNbmpnMk81UFVqNVdUQkVk?=
 =?utf-8?B?YThxTjdZM3d3b3VEbUU2b1JIVFM5U0oyeDdOQnlvamhOREovQVp1ZjhmYkJr?=
 =?utf-8?B?SENxa2plclNmRk1pRzJDenhDMzVFWU9rTHhvMWtpR2xEZDh4dExza0U2NkdI?=
 =?utf-8?B?NVhwVHZFUTJSbVZmMHJhU2xyWW96VDJ4dFJwOXV4N051WjZHNWhWRzlVVlMz?=
 =?utf-8?B?ZzRaejJKSUFpWnFNUk1Gd056blBvU080YVI3NDlQdEF1cjU3YXNxS3VzK2l3?=
 =?utf-8?B?TExCUjZWNzd3RExSKy9Eak9KOHcwRzhXeGpUVDFRdW0xMTJ6MzZIZ0Z1VmUy?=
 =?utf-8?B?Si9CVWRLd2crNnNnRmJIdWEvS21sQ0JCUGw1cjVwTE1PVEowaDVvNzU0NHJq?=
 =?utf-8?B?UmJIL0JiQVMzdC9nQTdGRjJFUXFJa0wrVitUdS9iYmcyakRCeTk5WUdCRTl1?=
 =?utf-8?B?b3B2Vk9YTlI2YjFEZFNiSVdCMGdlQ2JSM1kvTi8rcitYVlVsUXltWDNIdjhr?=
 =?utf-8?B?eFdFRGV4RTV1OHNEZEw3bEVTdWQ0cFl4cGFaUHBXdXJqZ2hGMys4VW5TNTcx?=
 =?utf-8?B?cWxiMEUvalkzRmJ6UjI1UVcwcWR5WVNzOGdFWDQ1Z3FoZjQxc3VYdFVTK1Y0?=
 =?utf-8?B?K1FrY0ZBV3R0T3g3N2x4TSt5NXBxby8ydDd3VXlqeVlSZDdBbFhNOGppUWRI?=
 =?utf-8?B?dSs3NTlGUS9ndTAwUS9xcWlRNFhkV2VndmF1YWdWMXlPdVdGbFI5WFlVM2Y0?=
 =?utf-8?B?YUJKV3JmZHpPTitIbmg4cjBmY2gyYU9lRTBIZURoSkMvTitmR3E4Qm1aa1V4?=
 =?utf-8?B?T2ZPdWRHM3dsVHJqYTA2U3JGWEovWklWWmhPaHQ1dWVZMXpoeGFUQTVyNDhC?=
 =?utf-8?B?RFNweTBwazVJejN0czJMeFpBN0Q4cFlXWnY4UVJ6NWZqOVJmaVROc0ozdE41?=
 =?utf-8?B?UzhPVXRkT05mR0pwVjlLQU9POGxRK1ZTMDFxZVRiTk9VOWVJZ3lGTnFTMUow?=
 =?utf-8?B?anNmUmpTL0V2L0E0aTQzTlpkd2ttRVh0NmdNN3R1MWh0MmJEUFRqWG5YSm1I?=
 =?utf-8?B?S0hWb3FwUmlWYWJTVUYrMjk4MzlnbkdZVDV1WTVhZjN2RHluUUc5QTdTWWpH?=
 =?utf-8?B?c1lpeU5JWUI3MlN4bzFNOFBDdFQ0NE5Kczh2R0dsM09aRFN2cTlVemovRGhO?=
 =?utf-8?B?Zzg5bEdrM3o0ZEpnMTN6dzI5YmZYMjI5eUZOeURna1l2T0F0RmlBWFNESWN3?=
 =?utf-8?B?T2FDV1pJeEIya2ZTVGM1b284NnBENGpQUEJIV2JjLytUNWh6M2ZLWWZ0Q0g3?=
 =?utf-8?B?dEhwYnhVVDFQYkQvdXZjNTBnTWFnVlBpTXdub2lDbFpyVHBWb1l1RVZNd1Nm?=
 =?utf-8?B?U2FzLzNKQm9mOG81cnJUckREa1BMamxhWk9EVEVEYWJremdvdHNhY2pWallC?=
 =?utf-8?B?eXRwaFcxaG56K01tdTBxZkNiVktyaUd1M2JQSVB6dEd1WllrcTNLbzE5eDhS?=
 =?utf-8?B?Mkg1Z3RSYUQ2enRWUUVHQWRPdXlDWDFJMzJUUHRoK0d2UlJsa05DVlZyc3hx?=
 =?utf-8?B?SDhwMk1ITWhnMEdLRFhJWjZ4ZjlpQjA3MVV3N1F4dzVDTWhELzFqOXdQdENk?=
 =?utf-8?B?Y0FEZjZQaW00K1d0OTBRRHdTQi8rS2UyKzJGTjY3UWRza2wvRnZRbHNGSm00?=
 =?utf-8?B?SHdSdlJEQVRVZlAwSW9wMXEwakdGUWFpdFpFdnlLMHlXNjFadTd5WHMrSGlk?=
 =?utf-8?B?K1AxMkVFMjRwL1Q4aGtkN0dNenVrTzVKZUgxdFIzVURvRGRLWEhDUVlLTWhz?=
 =?utf-8?B?WmZ5dWl3TFVwN3E1YVJjQW9ia2Y3RjlnSnArOWt3MjN6K0xCaWNydERzU3V5?=
 =?utf-8?Q?qaIY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVRwNUV6anRCSmcxVjkvZUpvdDhuMG1UVitlQUNrTTZieG9ncVMwR2M1SGF4?=
 =?utf-8?B?SFRkNGNQWElvOG5XS2Y4UnpsSUJ6bjd4dngxYUNNYWh1M3lhdTErMmhiR1pr?=
 =?utf-8?B?cEpUYUE3TWVtMXo1dTUvQWtxL2gvSys5TVV6RGZMMzlVbzNvaTl4VCtyLzB1?=
 =?utf-8?B?MEViSVFacThrenFEZDhrL1NSNGEvU2lsV09IWitBM29QbjZ5OXR1S2VGYzRG?=
 =?utf-8?B?MGpCSmpMVVJ5cERRSVcxcm5NYkx0QnZXSWh2YnJzaXo0bkorN01TM0xjMDQw?=
 =?utf-8?B?YWVpMXNaT21jeVpyVmF0THdIMXhGZDN6ZVgrV3pldll2S0dDR0xKa0lWcXNt?=
 =?utf-8?B?VzUwWkRhKzZUMTVqWGVLNkFsUCtSSXZBamxkVjhkdzRCRlI4OVFxcXYxalow?=
 =?utf-8?B?Z0FaNmpXNkx3S296Y0ZBNDFJZVowcDJNSmFxeUJFYmFka1FQMnRwZVZUa29C?=
 =?utf-8?B?ZGYrMnhSc3NUMGZBajJDdHpPM0hFbjVVSTBWWXFRZ0dlVXlDbk50R1k5OUx2?=
 =?utf-8?B?aWNXUEtjaTZMTFNXY0ZOazlZZDNJNktwZ2ZpMXQ4Yzc3OEV4ZEpMQmw3elQw?=
 =?utf-8?B?emtiRHBzUFh1ZHBYVGR4QXIxNFNnWFk0MlVCTmVuRVpKZGRYRTJsRE1ER3Qx?=
 =?utf-8?B?ZXp4Wms1WVUvU3dBdFFEZnpSSGlNdDd4TDFJMlNmNitxSXlBRzUrSUdvNXli?=
 =?utf-8?B?R3FvZ0hwWFRGMGQxSUN6bEN5aXhrOW12YTFsRG5pRmxNbXM2U294ZDZvOW5J?=
 =?utf-8?B?SVRUaldIamtOeUVlRTVuTUlxTEVXN3QrODBPZmJYTnVhYzNyUmZVclU3SmhS?=
 =?utf-8?B?UjY3RjM4T3g1TEszNUR5cUorSzdzdGdURUhMWURiMWtCQ3JsYzV5emVvYitE?=
 =?utf-8?B?c1RBYlFEeUxKRXhEUXFrMHVsK3ljSUh2UEhqbE9yOTg2NXdlbWlrOHJEZHgw?=
 =?utf-8?B?ZFlhL3AyVTIvQUxPWU9jcGZrN1FkRHdXTm0zZFo4SnBQbVd0WThBcGNLWjNu?=
 =?utf-8?B?MkI1UE4yUEU5VjI3cWVFSzdXc1JsUGNOTkprV3NEWmRvTEIwT0lHU3hCSEhx?=
 =?utf-8?B?eWNaMFF5QUkxaUVwdkR0eXUwNWhyRnh6cmFPV3FENVRLTko4eDZvVW95WUlI?=
 =?utf-8?B?enpZdVRlWlpVZXdKRStyZGlwdytnbzNEYkIzYVViS2dyQ1pPaTA3U2d0K05s?=
 =?utf-8?B?ZGlJbFJlR09UQ0lXRHVUUUxWQWNSanA2aks0NkRxM2EvNGxvQ0Z5T2N4UnJu?=
 =?utf-8?B?enQ1bndYdjBsQnZ5MFF2em4zNVlKSXY5WjJQdFJMVklwZ2VEUFZUUUlhbmlv?=
 =?utf-8?B?VkVBWDVIaDVtWVVhejcrUlBhbHRHUnlBYit3Kzl5bjk3TmduOEhXMElpaGdh?=
 =?utf-8?B?bWtWSFNFbHZ0dXNaSE8yaWljbmFjOUszV3Y5WHNnTzN6TVo3NHlEbTNveXFt?=
 =?utf-8?B?Tm9wWCtCaUl6OEpYK2tVdHhtYjB2Q29YVzlBVHFrZUdoSjNMVVZGOXJteE5F?=
 =?utf-8?B?M3N5MndwVXF3aTNsTzU2SXdsa1VMcG8rbHNyZ3NpcWxVS1pRRG9jM2IrVGx0?=
 =?utf-8?B?L1YrS3hhMTVXWklpeW1BajVmaTRMRmd1Smw2Qy81bSt2V0I4QmJ0blZsT1hj?=
 =?utf-8?B?cFZ1NjR1bXFQVTlkdHVnTlpPWjlITStLUWxMOEpTOElxTklGVlliOFpKVUI3?=
 =?utf-8?B?d0llYmEwU3Rqc1p0c3V0eGF2MFIzYm5WQnJQYzZwWWxMaGxJdmhCSHNTY1l0?=
 =?utf-8?B?RlBkdTNNekNUb3RIMEtHM2FtK3Z4U2dmcmlaNHJid0NST1NpMUFkOXRwS0l6?=
 =?utf-8?B?TlY0ODhqaVp2L0dtOUVXakZaRmpEL3c0UWhsazg5Rkg2dFpzWDBqV3JJcXpC?=
 =?utf-8?B?dHR2ejJxVE5hdmVqcit5czZHc1FtUXNyL0dUbG0yZjRCSVhMSnFEMUdVeEw2?=
 =?utf-8?B?TG14MHdxcExzS1hDYlpFZzR0eUJmQWE4SlRMcGhLSEg1dk5kYkI4aVNyK3VX?=
 =?utf-8?B?Kzg1R2V3eTdoUjE1MWhrUmgyUGk2dWwyYjRSa2JVUDljak9TYktyRkwvR2Ur?=
 =?utf-8?B?dkFzZUhtMTlkZi93QlA0ZVZpRHVrRDlsTHFzS1ZMY0xwQmk3Y01oK2RsS1Yr?=
 =?utf-8?B?d3RJMEkwWVZpVCtaeXY5dDRWcUJwdnFFUlV2MlZ3dW5PZXdLYzBnZURhUnVC?=
 =?utf-8?B?aFRWNzgwcGV6Z1RjTTA3TElmYTBILy96OVFBdW5DS0lycUU5ZSsvMnFpSm1L?=
 =?utf-8?B?eWUyZWlIOVVWM2d4STlwMU8zd09DWmdEQXJBWUF1ZnkxcHpoTkcvSS9nQU4r?=
 =?utf-8?B?TzNOQnFlWER0em5XbWRJaTJFRDRvaXlYeEllVzFHa1dsVVFSSnRCQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba7c2c6-e8c7-4198-6cf3-08de6ad68e78
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 08:04:48.0443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/D23GDokwLqDWFhhXguvS+2HfFc5JMFo4LpZ3X/84IoR2unTDhDY0Cd81EexyspKRPiFcxwKm45kIhPegg/yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9568
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52695-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhentao.guo@amlogic.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amlogic.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amlogic.com:mid,amlogic.com:dkim,amlogic.com:email]
X-Rspamd-Queue-Id: 9E3B9133C98
X-Rspamd-Action: no action


在 2026/2/13 15:35, Krzysztof Kozlowski 写道:
> [ EXTERNAL EMAIL ]
>
> On 13/02/2026 06:12, Zhentao Guo via B4 Relay wrote:
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> Describe the initial support for the V4L2 stateless video decoder
>> driver used with the Amlogic S4 (S805X2) platform.
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>>   .../bindings/media/amlogic,s4-vcodec-dec.yaml      | 96 ++++++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
>> new file mode 100644
>> index 000000000000..88780514d06c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
>> @@ -0,0 +1,96 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/amlogic,s4-vcodec-dec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Video Decode Accelerator
>> +
>> +maintainers:
>> +  - Zhentao Guo <zhentao.guo@amlogic.com>
>> +
>> +description:
>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>> +  It supports stateless h264 decoding.
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,s4-vcodec-dec
> Why do you repeat "dec" twice? codec means decoder, so what is the last
> "dec" about?
In fact, codec means encoder+decoder, and dec is short for decoder.
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dos
>> +      - const: dmc
>> +
>> +  interrupts:
>> +    maxItems: 3
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vdec
>> +      - const: clk_vdec_mux
>> +      - const: clk_hevcf_mux
> Name them based on their role/name in this device. Why this device would
> care that it receives a mux? Not a div? or not a gate?
Ok, previously we overlooked this. We will improve it in the next version.
>> +
>> +  power-domains:
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: vdec
>> +      - const: hevc
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  amlogic,canvas:
>> +    description: should point to a canvas provider node
> Why? What for?
>
> What is canvas provider?

The canvas provider is: drivers/soc/amlogic/meson-canvas.c

In short, canvas is a hardware IP inside the Amlogic SoC. The decoder IP 
needs to access DDR through canvas IP, so we need to reference the 
canvas driver.

>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - power-domains
>> +  - power-domain-names
>> +
> Best regards,
> Krzysztof

BRs

Zhentao


