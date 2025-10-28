Return-Path: <linux-media+bounces-45799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 747C4C144ED
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DE5B466F31
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CA9304BC8;
	Tue, 28 Oct 2025 11:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Gw63gl+u"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022082.outbound.protection.outlook.com [40.107.75.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D7318626;
	Tue, 28 Oct 2025 11:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761650100; cv=fail; b=oR6Edl9XcQi/uULkq0klZDkb1tcGotb3R1XSH6kQzAbFB2kS6P/aoeav+t0CkXT5/kg6qoeE942M2wCxF3SG/KVALbUqYAuKlD8wZpYTDY0a+dsCWO+7mL+m1oHa0PpVhuPYqXZNyqAW+CoigNczu3CDD+AbBmdKKrnlmoe+Q8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761650100; c=relaxed/simple;
	bh=t/cbwZ2B3ct3oQf9lmfheaZM8TmdSuEA2dxE9ySITcs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bLCMQEGJrLLCQFPoNAcTjl6ztOW5V3LLqiUqI1MKGNaMUfPzG0gcizvhn5YLGrzb39hFB3T+xu2wwPCfVQAZ+hTW4+2DVTq+VwD7Kh1lQocibBHGFSJmmdoJXJdp47N6JduQ0bpzuA+k6uOKshiqWiJkmz/t9VgMXDg1KQm1doA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Gw63gl+u; arc=fail smtp.client-ip=40.107.75.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ien538nQl2Hq+GoViSLDyEEPnUxSD3Y2P9zcKKHwm27E2oARtKgEPZ7tVBzP/i696i+Z4muHMwAxfIMlOKVP76gcjm47Cwm0rU0DAPdJjhhpmcvOGTbtxJun51Pg2T46hb7iGfFIDn9nSgEmtdkxfehWUwgQd3z+djKl1KBwhCdP+oeuf08z+KxAm8s4GG0iQnuKFsbZ+X5qMNhv4gFZF85MD96anzbWRwxpAQ5Xh7kV7ChULtDc9jyW8aDWrZ7gke0cDE+XrqcqWa2vaqnIrpFPCvPNxVf6Ecb+gwfUuozpFzpWGyfPVjWdnnGNrdvkTYz5bumetH5r+RjV9yknhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTRiJP1UYJx6uio0SBD7PlsyuZ36Joz/3+3bRB/4zFI=;
 b=jkQyUCDMnedKqF9b5y2hh1R4fHMJdmW0QEZ8h85JchjBA/zRghofnCaaFIWOOvF8WZ1ZKV/0J4zY9SPr6FocTEPZzd/vTWoSmtXcamSDaxEpI6vGbPcY699a2aK4fXPNRTQogDUdAastS1O7YrSZBK5Gc5yDVVcz40rZBbO9gbXAF/JbfxAEkAbyRBOPMgsBinMJ8dBnCKyQ6qUPb7muam6oIS9LIe0YzfYVIbZx64nMaworQEZ5uElYmGNlQlGOLMVpeYaNxlev9Ngd8I1FqD+iX4UcPLrMYonlhMIoNwIklBKg2sAd43HN0BgSb9a5hjR6qostzkl8frgWbJcKNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTRiJP1UYJx6uio0SBD7PlsyuZ36Joz/3+3bRB/4zFI=;
 b=Gw63gl+uYpYHteRb41PAeqP5rASURCzYqaaKyhmjidBkXPW6J80RNg1xGUncXCzRQu5jHWfRTrkNt5069qdGp8DiIv7HEA9DoGJxBRLmHgHihb7qIWjq3AQso4JR82y/RpF9ys1Lxn+FlJ02Uricxgjhq+ngQjcIikIS2laiti/3c9v2X+lBfTPVJlO9zZXK3a/Q+qNqRsx5vegiXYLlnEVYqOPgNwT8JRCYcC0h6su8kTcriD6FG8svqmphsCQcJbeguo8bSNc2bQ0nT2Mgdpl366MYruawSF2KWWLYMMt6+/NXyTmykuQHT19clxUlLo1XC/wnEBjeyR1sNIf5ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com (2603:1096:400:5e::9)
 by TYSPR03MB7784.apcprd03.prod.outlook.com (2603:1096:400:42a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Tue, 28 Oct
 2025 11:14:54 +0000
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e]) by TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e%7]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 11:14:54 +0000
Message-ID: <40830266-692a-4731-8957-4462d4993746@amlogic.com>
Date: Tue, 28 Oct 2025 19:14:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: vdec: Add binding document of Amlogic
 decoder accelerator
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
 <20251027-b4-s4-vdec-upstream-v1-1-620401813b5d@amlogic.com>
 <b989fba3-223d-498a-8efe-7a60e26cf0db@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <b989fba3-223d-498a-8efe-7a60e26cf0db@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To TYZPR03MB5536.apcprd03.prod.outlook.com
 (2603:1096:400:5e::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5536:EE_|TYSPR03MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d068a2-7f2d-471d-ad80-08de161338d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzYrMXdCSWlvZW5hY0l0YUM1U2dCeCtkNFQzRDVCbk1GaEo5L3pFR0NLZjlD?=
 =?utf-8?B?bVlPbmUwTkZsSDI2WFI5bTNkRnZTRkwwNUJOQkczcmF3ZGpKZGtpREdTbzFw?=
 =?utf-8?B?WjV0RlBaWWlmUXBFOENkdi9xY0RGTHQwSXh2SUg1Mis5ZGROQ05KRnRaNUJx?=
 =?utf-8?B?YnRGUXFtNWY0U1R4cGpDdFhObDhueVBzVEdjUUR4WWdDUGkvRzJ1YXFUck5z?=
 =?utf-8?B?RmpnbGQ4bmRxRnpRSkdRdFJXU1BJRm40b0l5WkVQS1VKNURzam5FZUptK0NZ?=
 =?utf-8?B?Wkd3OTZON0I0M3BSd1Q3R2hNS09EQ3NQYWhNZlBqM2VJVCtZYmxWcTBha01l?=
 =?utf-8?B?QUpTS0t5eCtOS2dXcWhXdjZHTnJGL01mc1ZiZTlUQ2dXTHI2VCtDWWcxbzBK?=
 =?utf-8?B?MHpOMWVoZjhBREVqdXQyRUJrSldKWCtLVVRzT3ZoV3FZZEUzWjI0TUZ2QWMv?=
 =?utf-8?B?Y2Vla2p1cHcvZVZsdEZ4TU5tRlpmSXc0ZGxqUXM3QjlXL2hxQmhna3M0UWti?=
 =?utf-8?B?OHd1dzRLMmd2R2toQ2Q1ckhZRDBiMElCdHJwcVR6dEh0UTZUK3Q1QlRpZXlW?=
 =?utf-8?B?U0JpeUhXS094WjIvVlJuWVMwRTg3TXpENjBQeDNFc3Q4bVA5YTBHbXBJNE82?=
 =?utf-8?B?dHlrekxKSkJmRVNPWDdWRHlMZXNlTWdSV0tDcjhQY0lEUjhXRGhNV0VtbXgr?=
 =?utf-8?B?RHhtRzg1TTVjb2hxNUdJT1hxR2FNZ3hrM2s1ajRKK2I3TkVLSTcydTJsdlpp?=
 =?utf-8?B?ZHoxeTJCdHRhdEViOExpYm52UEZVZGVqem5iT2hRd2h1WHhKcWtJS0pFOEhF?=
 =?utf-8?B?MjArTGV2bDFFRGFKcVBydm1SM3F0UHlKUHNyNE9Tc2NvRG1ZRE1rN2ZQeHVq?=
 =?utf-8?B?Titjd2tqVFlPRE9HeWpLL2I5bFpVazlaQjBQNFg5SEh6WlFGdjJkZkplTU9m?=
 =?utf-8?B?eEg4bitHSU5kakZHRFpNT0ErL3N5VUdTQkVOa3pzU3B1VkdoV2lYSDBRU1Er?=
 =?utf-8?B?cUhYWWUzZXF1NU9Hc1J1NHFKbUozRTNRYTQvN2doTEZrZ2kyOWNpQ05NQ0wr?=
 =?utf-8?B?ZjUxSWJwVWJGNG9QQnVSdEt4ckJFODEvOCswelZjME9xakJ0b21vWFpyMk5w?=
 =?utf-8?B?dGVCcS80UUlXb3VXVXY1R3NYRWFoa0RwTTEvUWhHY0NxM0hxWUlvcE9DMUl6?=
 =?utf-8?B?QlZPc0pRNW84S2psc0J1ZFROdSttN0pQaHdUWG96NzZ1UlhaU1lBNmlZaVhw?=
 =?utf-8?B?MmIyRHlaVmo1L1ZaZmdGcGpaRUpKazgxcTJIaFJvTkVxNVUxNjloNFFLT1JZ?=
 =?utf-8?B?M21kdUw2d0JaY2xtSXl2TktxTURzNDRQYUZFTzNaL0o1WnpkcHI0aEUzbW1N?=
 =?utf-8?B?bmpDWmx3RmxEVWJzelQ0ZXlsYnVOczB1dE1FYitLNzlEVUFWbEMrOExPWTdT?=
 =?utf-8?B?UG1NRzE2R3d5ZTE0VUloSG85OHVaU2ovUmZkdmFyM0t1MUJ4QktoRDJINzhU?=
 =?utf-8?B?aXpzYXBSbSswUWpZUitXZjN1Q1pOL3MreW40UjE1VFFMUFZ1MDN2QVV2Q1Rp?=
 =?utf-8?B?TzNidGJGaW1zOXBzSjVmZlZKVTlpSEt0RlRRSGlVZm5SeUN0TzluZEd0aE1E?=
 =?utf-8?B?ZXdZYWFRSS9DeWZoQ1BVa3VhR2E3bGNqSk9jUEFmbGJ5cmVoRk5uRWJJL2RM?=
 =?utf-8?B?R2dieHg1QnRqajBtYmg1dUdycyt0U3J3dWJwLzhQeEtxbkhrbmVxRmMzcVJz?=
 =?utf-8?B?aHZWaklLUHZzRmZKcXpFcTU1NmVUT3dvczQrKzdCUVdIMm42MTBadVI3cVdu?=
 =?utf-8?B?Z2NRQkdqWldDRlA3Y1VnVjZ4Vk1nZ3FKS3pVZVAzNlNDZHRQSVJlNGlFaHUz?=
 =?utf-8?B?a3Y4cHZ3MW9kb2x5SERQc2NDYlZ3OVNNSDlPTjJudEJDelE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5536.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zkp0T0l3K09BUFVGK2t3NFBoNDVyWFloM1JCSWlRa0d6Ly93YVd0bjZxVGt6?=
 =?utf-8?B?Q0FMQzhubjhVWDdDU3Jaa1BkTkNBTkM0c0JSN2xTaUI5SXkyaGhhYTFtaWhK?=
 =?utf-8?B?MUk4R1BWWCthMDNhclhwUzVSRzgybDdYNk5sQ1luOVFseXcxOGVTbU1IanRH?=
 =?utf-8?B?RW1uNUZVZHIvdnNtL1lWaEJaMWR2Smh2LzVXNkxsWmZ6bWpCaURBMmN5cVMy?=
 =?utf-8?B?Zm5uek9USzhoaElkaHU1QTZHRDNUbzJMQ2RGQ3E1enlqZjJ0SnczZmNlUXRK?=
 =?utf-8?B?bG5oWVlBS1Y4akIzU0lZbXBOLytzT29JTW5jN1ZoRzZaY2JKSS90Uk9yNXR2?=
 =?utf-8?B?WTVLdzhFeW9jUm8yN2cxWm8ra2xOM21FQmlzMmZOOEJLeFA5RWcyOW1UdnRx?=
 =?utf-8?B?WjdXRnJLNHZUVDFSMlpFajNxeHRDaDdJSDczOXByYXpaQll6RDAwMTNGcUY2?=
 =?utf-8?B?UVBvSEFGNERXdmhkM29EektjdGIvdkNaQmdQZ0JITFk0anRzVGdrQzlHQTIz?=
 =?utf-8?B?eFV3SFZreTdqWEhvZzgzTk13OXQ0WnExc3BjOFRnakh5a0YvYVhxYXdFUWtY?=
 =?utf-8?B?bzFhL24wbytQNGlxMlV1a2ZncUR4Skk5cFlicncwMFJYVnhDV0c0TWxHYTdB?=
 =?utf-8?B?ZWhMRWJodkZhMWVTcnEveDJCakJxT2FxSnc0em5PZ3FZVEFIKzZMdWZIWkVU?=
 =?utf-8?B?NC9MSVY3WHlwallxVmtDRjNBK1JjVGhqRWh3M0ZkTFhvVkZicFpJeW5ueVVi?=
 =?utf-8?B?OEc0QXpqRWFDT3FlZGcyMEFjUVlXVWJZeERlaU5HZ09LUVlvNlpWL01RamRX?=
 =?utf-8?B?d2JpRkpyRGFrbDZLL3pzbFVWOEZ5UmVsbmNtd3gyZCtsWXloWjBhTXgvWnlq?=
 =?utf-8?B?dHBQTDIvVEsveU9uL3VwRHA4RWI5bEVxblZXUnFjemVhekxibWp0RTFwKzY4?=
 =?utf-8?B?ckY4aVhGU2F0WUY2Y1dVT1pYUDVRYU9YRG5GZnZwZmp3V3RDT0Y2amZYZEhS?=
 =?utf-8?B?T1JITXRhWGNINGpXdEpUMFhmazBsdURESHN5UXRlYXRxWW5haFpWYUd0elgx?=
 =?utf-8?B?NC84MWV1ZFNkSEU3eG11WFZhcDlMZ2dWTUU2TFdXUG9Lai9hRXNYTGxiRlN1?=
 =?utf-8?B?VjV4ekVRY2hCS1BSU2t3MzNaTE1KR3p5SFIvVkhhU1YwRWFkVUVydVhMeWNZ?=
 =?utf-8?B?UEdscVprQlZ3enlBc2E1L3FKWW1SK0RySkpaZUprWm5rd05waHJIY2tjaU9O?=
 =?utf-8?B?bmxoNmpEWmw3NmJpYWpTL2hBOFhHSDRGU0pxNUVIZnd4UEEvSlR5dERtQVZX?=
 =?utf-8?B?UlFrMVJHSURJWkJuMzUyTjRQQUpWNklNS3RZRXFXeVU1T1BMSE5NeWdjVWw1?=
 =?utf-8?B?T1VwSmh6ME5NaXV0aDQxZFhEZTh1Yk5vMUFHNmhDZ3RnY1dtZVdURDNodEJZ?=
 =?utf-8?B?N3plODcwWGRHK25DSzFTZGNCUGxuYnZxRitaODFNUFNLOThFOVFvRUljUmVX?=
 =?utf-8?B?WDhuOWZnd2NmNEsyM2xPcEJhN0VlemtxRmxYSVRMckVoZUJCdFZhakZua3pq?=
 =?utf-8?B?U0VEWUF6MW9xM1VmWEpLQXE2WEM5eTNCeEhEU2treVdxdTRlNGxQQUtURUFV?=
 =?utf-8?B?d1hCeGNjS3RBZVphTm9jdjZaQ1NPNDNyZWE1K2t3QmtHQkVLTUVCVmZKOHRu?=
 =?utf-8?B?VVJlMmE4M1ozOG5wcFdHMFA4cXM5YUFTUDczMHVoR25UYS9ZTlVNL3QzN0Z2?=
 =?utf-8?B?RlNaQUVoMlk1RENUblVmQTRpRVRyWkpyQUl4RUZOSys5d2ZEQ0cvT2dWdnJP?=
 =?utf-8?B?ZEJMc3lWdTZENkl1aWlCWHBLN2Juend6L09ZeVVXVGtFWlNLc3VsdFRsVEZW?=
 =?utf-8?B?ajgwcWhudEU4VVFtWFF5STU1M2llalM3dG1qSTRENk5MejhhYm9VL0JzY0E1?=
 =?utf-8?B?S3djckNHZmM4ZVdOQUoxYjNBT3JCNDBjLzl1bzhWZ1NHKzV1djdTT0c1VExL?=
 =?utf-8?B?K1VVZCtPK1lzblpBL1JmY2NDS2N1dVFpTFhIYzZCbnI4d2ZqckpUVnpSNlFo?=
 =?utf-8?B?UmtJTWtQQ2w4QWszNlNOMDlJRTBVNk90WXZkWUozdExxWkJ6blNNc0dsRTFU?=
 =?utf-8?B?K21Vajg3bXJ6OTBlSm1Xb1RnMEd2YWYrVU9XS2FJNEpSUzFlNHcwQnBBTjZY?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d068a2-7f2d-471d-ad80-08de161338d3
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5536.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:14:54.8293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENCNqNuPAh67TJz6A4Wcwdt3+6DjE1KmZ4OH2KWeZsHj8JSNyLm/jtj1NwTadzT4iJLsQ3Mn/tu9SscINaQ7sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7784


在 2025/10/27 21:05, Krzysztof Kozlowski 写道:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> On 27/10/2025 06:42, Zhentao Guo via B4 Relay wrote:
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> Add dt-binding of the Amlogic hardware decoder accelerator.
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>
> A nit, subject: drop second/last, redundant "binding document for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
Thank you for pointing this out and providing the guidance. We'll revise 
the subjects according to the specifications.
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>>   .../bindings/media/amlogic,vcodec-dec.yaml         | 96 ++++++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/amlogic,vcodec-dec.yaml b/Documentation/devicetree/bindings/media/amlogic,vcodec-dec.yaml
>> new file mode 100644
>> index 000000000000..6cea8af72639
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/amlogic,vcodec-dec.yaml
> Filename matching compatible.
Yes, we will correct this.
>> @@ -0,0 +1,96 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/amlogic,vcodec-dec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Video Decode Accelerator
>> +
>> +maintainers:
>> +  - Zhentao Guo <zhentao.guo@amlogic.com>
>> +
>> +description: |
>
> Do not need '|' unless you need to preserve formatting.
OK, I'll get rid of this.
>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>> +  It supports stateless h264 decoding.
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,s4-vcodec-dec
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dosbus
>> +      - const: dmcbus
> Is "bus" really name of this in datasheet?
No, it is not from the datasheet, in fact it was inherited from the
older SOCs. Do you have any suggestions about this?
>> +
>> +  interrupts:
>> +    maxItems: 3
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: mailbox_0
>> +      - const: mailbox_1
>> +      - const: mailbox_2
> Useless names, so just drop interrupt-names property.
Yes, we don't need the interrupt names. I'll drop them.
>
>> +
>> +  clocks:
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    items:
>> +      - const: vdec
>> +      - const: clk_vdec_mux
>> +      - const: clk_hevcf_mux
>> +
>> +  power-domains:
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: pwrc-vdec
> Drop pwrc
>
>> +      - const: pwrc-hevc
> Drop pwrc
Ok, I'll drop the two pwrc(s) above.
>
> Missing iommus. I really doubt hardware works without IOMMU.

IOMMU is not supported by Amlogic SOCs, the decoder hardware needs to 
use contiguous memory.

>
>
> Best regards,
> Krzysztof

