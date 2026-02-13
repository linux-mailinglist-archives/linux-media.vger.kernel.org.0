Return-Path: <linux-media+bounces-52701-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Lx7LbXhjmluFgEAu9opvQ
	(envelope-from <linux-media+bounces-52701-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:32:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE69134156
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49ACF304C137
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 08:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F9933A718;
	Fri, 13 Feb 2026 08:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="E6jgzo3c"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023107.outbound.protection.outlook.com [52.101.127.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1968C2F7462;
	Fri, 13 Feb 2026 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770971508; cv=fail; b=Nh1fZDuyL5jJApFUVjLcpEuappqQt5+61781jg1+DLUmrb/OSMSun660INvXJ9x9kybR2IWbqa/kw2RtM7poCMx1QvDAkc0I9zV2Pq0MjITemtQOKkc6e1jtOiolBWzdL4LcNhnX4s4PVr0Ih6ePdtrME+uE/CHPS6g5WxHxCIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770971508; c=relaxed/simple;
	bh=Vj3O8k0nSv8rx7h45tL+V8yHsz8DRGyjEw20plrtf4Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ak2dZFOD43LUfd0p6m7M1HXb2l15R8q25aJrfgc9bH8w5RwImRNIgpz/FsLdvDArZumTHQChXD+kJ06kbPejEIJ1AOpoTlZ0jQE5hRqW4n8nbkxIM/LgVe1sSINELFa0WEaZwjLcbLrVg8fJ4MHdtOXjzq191WcIu+5cj5W2rhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=E6jgzo3c; arc=fail smtp.client-ip=52.101.127.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxSErRfg2MBb0q9sPEQ5YQwtm6Pm0E7ZTWxrCem19ASkEihMNPlVZb/PZl4CC7/iOnaToQ6VcTY3pBQKpJJYDwnW3gtCt7Dy1gdTRk50cVltxEgu8/47e+roULcPTras8S8l6J7SCuE3RMKH5jZSbblP14+Xt39U6D9u47hdrs+iIHZ3GofplLhGfdwB081xV6RQSuhM6RxatL6AEQRCqWLULmbDg0uPwmnBiqjJ0pHxb8a5UL/Pc1JumC6adkd77aRwSwraavZq3XJ5VSS4g6nC/WmgQ6m9nJvFnndxscSU+jKgoYLa2CCbxxbqsudSd0jTo35W5tEGYFBjPOxMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VriMFsqf9aneVXOeCM5JkkAlc2W4z1x5I8D9d7ey86I=;
 b=aCz3QfpN65Ra90f4QmoKBkODMGuvwQ2qmZCLvzAbxQL/JwzMupMQxB9B5N41TZcI88kDfJtwtZHVnerNE88MUSxk8SaODjky8noWgx1ECJN+27JRultu6sETkW+3lFjZtpBForu0/lDv8gik9Uzk3sqJl671qNd1DFJ5ug/pkTCIFSSzrtQ4epL7DqYh3Ujt2e1BrQGRuNCy7GhLWKkeVz+hZ+Bc7QKz4tcNFCh6vpc9EClk3oBK0WKuIT39JH79TPK0/NwQsmLHzWeyvqviSfEeXUChTuezRBAAe9efVFR1e0NuVR94EvCCcaxXHEg1A2VmEUNM5CQf5HFYFtq0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VriMFsqf9aneVXOeCM5JkkAlc2W4z1x5I8D9d7ey86I=;
 b=E6jgzo3c6MZDd6MIXmieaycdwT3vcCOVfCS71FugEFzMtWJ2jSZ5P6uVmMqCeeTRhj1cA0wVgfLF/rpn0Hdt33JmxcJBBoLZZdf246rtKt/OkafXYK20iPeBJSahM8t4KDenNPa4S42DW46vPQVSKlTLvTx5Yeu7h2MErkmkXRPjzPje76ISvo7luXI/JfS7MgpijCWUzY7QG9AheUki+Xa4WKsUxDmxMMXthb6MjssDzE56LQ97QfvdCBYLzmvGMhl7T8ehzXndg3phI8PSghHN8FwySWVQO/XenV8QVwQ/kj0WOCjzF1E5TAY48uFAiOx7LI8LBO6d6fDydGep4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SI2PR03MB6758.apcprd03.prod.outlook.com (2603:1096:4:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 08:31:43 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 08:31:43 +0000
Message-ID: <598c161c-d157-40e5-992c-912540589d7e@amlogic.com>
Date: Fri, 13 Feb 2026 16:31:41 +0800
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
 <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
 <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SI2PR03MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 9042d115-a77b-4904-cd5b-08de6ada517d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGZBeHRpV0dYSGY5QUwxZkcvUTMrU2wweXVMbzNDQmt3WFZiY0prZ3p1bTFJ?=
 =?utf-8?B?V1paUTdxMFVnUHdyRFFiQWVDNU8wZi93MWEwYXRQRTNSbHI1OC81MFBvSGhR?=
 =?utf-8?B?dDBNbTFlNzRLSGdzKzVLZU51TWs3clZ4QzdqL1IwQkRnVWw2NFhsak8vSlBJ?=
 =?utf-8?B?aG40SE5vby9NNzIzUzMwZjErT3NWWlZCc1ZwK0NKM3J3eHJkbUloblRBMU44?=
 =?utf-8?B?dmw5UnNXeFNRNFQyKytvUUtZYzA5Y1oxRnJwcnJOS0ZwbklDUGoxMEt3TmNX?=
 =?utf-8?B?V2U1ZG55em5kbHpHNGo0TlhPZHRaMUoxT3QyZWFZMDZHa0hKdExtM1RRb1B6?=
 =?utf-8?B?QmZTR2psQlI3ZndzSjBpL0plaTdGZTd3dTd3WXhNVlB1TXZQR3RJTmZ6aXZT?=
 =?utf-8?B?ZnZzOUc5T05pNlV0clN5cEZvSTRLK0U0UHhXWWdKc3Y0WlNzSE9YVWJsc0RC?=
 =?utf-8?B?VGlPNk5FU2NrQ3p4VnJDWlEvL2NrVlQ4WEx1K3h5UCtzNFhFYVFMdEtGVnNH?=
 =?utf-8?B?dFl4cDU2Z3FHTjFUU3ZYUmpCeEF1ZDVvTnRBRitsUjRtTzhhUkMwUUIzRlNo?=
 =?utf-8?B?Q2RHR0lqZmRBR3UxUHFtNFdZaDBFZ0MzL0xCOXFWOThqUHpUc3lHZzJqZU9E?=
 =?utf-8?B?TkhyVCsrSjBscnZ5NzFvV2lwSkR2YVRCUG93dFVrTjNFbVAyTXAyeDlJUllU?=
 =?utf-8?B?RUJOaVl1T2VVZkJlay9jWEhVMEhkbU1ta2NuVG14NE1NZXFDVFpyVGtrdW9D?=
 =?utf-8?B?cjlxTFlHd2N3YVpDaHBYSlRBL29GcDJXMXZvR0R0Y3RxUG1IYXl2REtWbW5m?=
 =?utf-8?B?WlB2MXN6U09vT2ZRUnVjZ05nTGpycDNndXgvOTJ6NWlsSjVWZ1JwUkx2Z0hO?=
 =?utf-8?B?SEhTQmVNNldnUHVrMElnQXprcjZOU3hnbmxRWXNlaHV3U2VNWHdnQXp4SGVB?=
 =?utf-8?B?NVN4MGNXZGUrOTg5eDV1KzRKYTB3R1JhNGFrWTBKRWJUMWZ6Nkc5cGdJbndG?=
 =?utf-8?B?NFh1T3B5amgyZ3ZhVHV0dEprcG15SlNoeGNxNTBrdFRjM3d0RXp5MzFXTFA4?=
 =?utf-8?B?c0lMQTRaNVlsTWsrWnZoSnJEVlBEWFM0c0x4WHRaQWxyRjdUdTdPTklkcm1a?=
 =?utf-8?B?MUJPYUVEd2xlaythQVp0SjRjOWFUckdCQlRMY0dlYVNJTEtkeTFyMGhDNmov?=
 =?utf-8?B?dndMM1hTalhadHcrV1FGUTc0T2d2VU5sMnd0N3hVZUtOMXdmamNVaU9tRkt6?=
 =?utf-8?B?WlpGWEV2WHd0d29oazVTVHlOdXdQUDVkM09JcUNCK1FWREQ1SEJmWVRINVI4?=
 =?utf-8?B?S1pGdG1XVXp1L0FpMzAzaUZ4U0NZVFBnb0phV2YxaDEvWXJRMkVGZ1VnSnR2?=
 =?utf-8?B?RHVRc2pjTy9keHBlU1hDTmg0eUVTRWdHNC9JYithVUUzSDltRlVIbjhTRXpq?=
 =?utf-8?B?REpGR0grQVVBbTlYRFZOMElFcnR0aHFVRnJHNDYrUW84V2orcFVVQXVySDVP?=
 =?utf-8?B?TnBhUXpjWWxZUUlwSHJPcjUvUk5NMWE3R0gySTQzV3VvRHJDQ2wvUy9Xdmo1?=
 =?utf-8?B?YWVQUExhTjlpSitTdzF6dGZEN00xS1c5VC91RTNtUHMrTnZYL093cVRUSHFC?=
 =?utf-8?B?ZWFwWGUzNTFoOFlZSzZRQTBKc1dsQ2p5U3dXYmdnajBGczh2dGZES0t2Sm40?=
 =?utf-8?B?ZXVtWFRKeHRuYk9Ba29OcjRJbGlUdDZhVnVRaU5jWlBZb3kxTVQ1S2JMK0xq?=
 =?utf-8?B?UWZ2RTRKalFRNmRsT3pwd2orUDh1eTcxejFQVmFuajdXc2xuMldqcVJDblp2?=
 =?utf-8?B?ZW1iakpIVTZtakhLN2ZsL0JyM1pINjRsTGRjL2N0TENHb2pXcVBlaEZ2MGdO?=
 =?utf-8?B?VFQ4MXVBbitJV3lQaEp4VXdlaGlxeUM1aHN4eWxpZmVoYlFrbVljckpmRnlk?=
 =?utf-8?B?SlJYSWQ4bi9Db05XNFVlQk94WUR3QmdTUHkrdklVaVRzajVnQmVkclEycXlw?=
 =?utf-8?B?b2VqSDUzYVNjZHNSQXRQN2plb3FxMnNKVXJaTGtHYlpqKzM5R0Mvc2UrRktK?=
 =?utf-8?B?bi9Pdi9oTFZkL2Fjc1NFZ3lOdkpjcllSaThCUEZodkl4QUVnTmNveTFKYzNy?=
 =?utf-8?Q?PGoI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWZNVTBEOTIzMC9PZXRYd0IzVjBFOUY0S21UNG9mMWlPeWVIeUdSN3pFMk1v?=
 =?utf-8?B?OWMrZUM5MWVRUzQyNTJhRnhPVmZ4SzJJNFF3VnNmVnNlQTgybnVEVGlmdTB4?=
 =?utf-8?B?cTVmUEZtdC93TmxBQ2p5Ui9oY1JJM2h2MUUwT0k5RVc5UXdHN1pPNHREbHJL?=
 =?utf-8?B?c3UrWm1JbEQ0L0JSQzRwaGNjRXZLeTFiRmRrTFFlQlRIWWpjRGJaTEtqVTZX?=
 =?utf-8?B?ayt0a0JVaW5PZWFSWmR0NUE1aU9FZFNVYnRzRXU2M0ZMRGs2VXllS1dYbUdE?=
 =?utf-8?B?RjVMV2VIT2dOK0Q0VWFseVAvY2JRSWVJTldZMTRHOVIyT293TEU3eTdhYU9H?=
 =?utf-8?B?OUtGSDJtNWFqUEszRHdKNDdleWw0V3BhMThPQVBJUGtZanoyR1I1T1hibEto?=
 =?utf-8?B?TllxdmZOaGZHdnNGWFhnRUQyMWQzRlAxQzJaVTZHSjA1Y0xBeDkzQXlCbC9H?=
 =?utf-8?B?T1FBcUN0ZXNGR0dDa3p6bjRDYzdBcGJsZVZDMWc2enFoN0o0RGFRRzJCdzAv?=
 =?utf-8?B?L25jb292WVFtdUNFRGtyVzhoNjdNVk94cjVVbnpxVXkyZDlZODVIWTU4VjNw?=
 =?utf-8?B?MENOclVQVFE5SkxLcXR5ZEFoQ01naGJXVnZvK2JyazR0b0tqL1hJRU8zZDNs?=
 =?utf-8?B?V1NvYzRLeWwzRDJ1SmdLSTZqbWNmVm13WE1qUlhlRDlkN2RGY3dtbTRsamJV?=
 =?utf-8?B?SmZKSVFPQUIwOEY2V2o4akFvL2loUEJVVUlJTy9sRE5ibFA0b3JqYW9MQ3FD?=
 =?utf-8?B?aE1MdkdyQk5DaDhPYjZXQTNNUUN0ZytGMUpzM3lwS0JpZVZUakc3NHdZK1h6?=
 =?utf-8?B?b3pJVG1oNWU4a1VBZ3FWR0RReFRkQ0U1OGh4QmRuUVRiZDE0bG5TZzdrTDN0?=
 =?utf-8?B?THFLMDZVbFNhSUVHd1RRcWFoS2ZJVUxQcjM2cnM4SklvbExDbzBpdWs3dHhn?=
 =?utf-8?B?cU9ZdE12eDBZZ25sU0VibXFQbXMrSVJyQXlxQ3IzMG9YMlZEMy93TFVBeTA4?=
 =?utf-8?B?UVIxR3ZmZXZGMFdtOXA0RXhRdFhnNmtHcWtKMmN0VjhoUHBCNlBtbWJxdGJw?=
 =?utf-8?B?dEp6OUpwV1k1Y3BwZ0EvaUlvWEtJbHBxT0QzL2RmUW5MNU51NDhnVHJ4Ym15?=
 =?utf-8?B?MlU5bVRvQk5OYTR6OGZNOUIzOEMrbTk3S00vODRiQjJIc3NYVFlFOWVEZmdp?=
 =?utf-8?B?b2wxRUl6QkFhOEI2T0F3cTZwdmdXZHZQdy8rYUxoVEQ5T2tSM2VnYStWU2lk?=
 =?utf-8?B?K3RUQmNOWWx6R0twMkp6ZnJ3OFJVKzdVWmlhU2d6OWpnQko5cENhQ3NyeEJO?=
 =?utf-8?B?ejB5TU5ZeVVQbTNiSzFqQkppT2Y2L3hlNjhpSGt1ZG1EckZwVXg5SWdOUm5R?=
 =?utf-8?B?R2N3YVBKQnN1ZitacURTU043TXI4VmFGQkY5RkdIYWJoY0l5U2oyWjJXTlRj?=
 =?utf-8?B?U1Q5SERkVnM1K2tyejZaVWJvblZPellNa1NwKzdES3oxcXBkRlkyQklBcWgx?=
 =?utf-8?B?blB5REk4a3JaOHA0dTlONEN2NnBmT3g2STFYbTFnSVJkcXFlUk1NdGNaN3BT?=
 =?utf-8?B?WFV2RW5HSDJSdmFmVk9qWlVTWFJkL1JnbHdEZ3cwck1sYkhldVk4Z2NCUENG?=
 =?utf-8?B?ZW4wNCtrZURwL25pUHlYOTc1bDgxWjZTeFFpZlZId1duM21JeStVVEpTb2N4?=
 =?utf-8?B?V2w1VVg4NDBtOGFTZGo2T2NOOWh5UVU5N1FJNU53Qjc5RUJrV2IxUDgwY3ZG?=
 =?utf-8?B?NTc2NUY2UDJvcXR4QW42NHFKVENzcjFhSzRseTRBT0ZwNWlNQ0pDVzk1SE9D?=
 =?utf-8?B?cDc1bHpSNzk3NVd6R1U0VFhSbFZNYVI5KzdHOUl1OW9Ib3U2U3lpcS81K3Qv?=
 =?utf-8?B?ZUllT0RKRWM4SlJOMFl2eHFYaUppQmU0MWo1RGpvd2h1bUV1ZnpqUmtZM1Fs?=
 =?utf-8?B?RFQ4a2NJTXpzc1RpSXRJMUhncW42cGozM2RMUmdsd1JVQUdSWUl0a2E0WUQy?=
 =?utf-8?B?NkQ3R0k5ZVNib0xBbkhDR1N1VnpiM2lIZWdhUk5vMUsxajdjYk9Sb3hqeFRa?=
 =?utf-8?B?bXlydlB1NERaK3FnU01seFFOYjl0UmdLOWZ1Y2MvRHYxNDFCbE92NkdHS3dw?=
 =?utf-8?B?dU5NbU1xV2k0YU43alNyMnM0WTVTMUJuZ3VqbHVqS25GMTBES1JEbktWbmhR?=
 =?utf-8?B?MDlVdExTUnJkYUphV0hjMXVRcUlhcWhSQ0U4ZnBhNnFxbkt5TERmc0F3NWNr?=
 =?utf-8?B?akRDVzhuVXdOVktOUlIrbEJYemlSLzBoUElNaE9Kc0VJdmxpVGhHUS9FaHFa?=
 =?utf-8?B?c3JKdm13NHhTeVkxdnJobWtoeGZYcnBvNHY1UGFRVlMxU3I1Qmtwdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9042d115-a77b-4904-cd5b-08de6ada517d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 08:31:43.6914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dWl8tZKTT1bKfDutGhb+a/nmguLCIIS8GcZGTca97lN/w11jgCXdq16HcVP4MtfzQCCIPmz8Lyt68+BmkZ2hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6758
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[bounces-52701-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhentao.guo@amlogic.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amlogic.com:+]
X-Rspamd-Queue-Id: 1EE69134156
X-Rspamd-Action: no action

Hi Krzysztof,

在 2026/2/13 16:16, Krzysztof Kozlowski 写道:
> On 13/02/2026 09:02, Zhentao Guo wrote:
>> Hi Krzysztof,
>>
>>
>> 在 2026/2/13 15:35, Krzysztof Kozlowski 写道:
>>
>>
>> On 13/02/2026 06:12, Zhentao Guo via B4 Relay wrote:
>>>> From: Zhentao Guo<zhentao.guo@amlogic.com>
>>>>
>>>> Describe the initial support for the V4L2 stateless video decoder
>>>> driver used with the Amlogic S4 (S805X2) platform.
>>>>
>>>> Signed-off-by: Zhentao Guo<zhentao.guo@amlogic.com>
>>>> ---
>>>>    .../bindings/media/amlogic,s4-vcodec-dec.yaml      | 96 ++++++++++++++++++++++
>>>>    1 file changed, 96 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
>>>> new file mode 100644
>>>> index 000000000000..88780514d06c
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
>>>> @@ -0,0 +1,96 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
>>>> +%YAML 1.2
>>>> +---
>>>> +$id:http://devicetree.org/schemas/media/amlogic,s4-vcodec-dec.yaml#
>>>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Amlogic Video Decode Accelerator
>>>> +
>>>> +maintainers:
>>>> +  - Zhentao Guo<zhentao.guo@amlogic.com>
>>>> +
>>>> +description:
>>>> +  The Video Decoder Accelerator present on Amlogic SOCs.
>>>> +  It supports stateless h264 decoding.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: amlogic,s4-vcodec-dec
>>> Why do you repeat "dec" twice? codec means decoder, so what is the last
>>> "dec" about?
>> In fact, codec means encoder+decoder, and dec is short for decoder.
> Yes, that's what I meant, so why do you repeat decoder?
Since this patch only involves the decoder, we want to highlight the 
decoder. We’ll consider a new node name, the current one is indeed 
redundant.
>>>> +
>>>> +  reg:
>>>> +    maxItems: 2
>>>> +
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: dos
>>>> +      - const: dmc
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 3
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 3
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: vdec
>>>> +      - const: clk_vdec_mux
>>>> +      - const: clk_hevcf_mux
>>> Name them based on their role/name in this device. Why this device would
>>> care that it receives a mux? Not a div? or not a gate?
>> Ok, previously we overlooked this. We will improve it in the next version.
>>>> +
>>>> +  power-domains:
>>>> +    maxItems: 2
>>>> +
>>>> +  power-domain-names:
>>>> +    items:
>>>> +      - const: vdec
>>>> +      - const: hevc
>>>> +
>>>> +  resets:
>>>> +    maxItems: 1
>>>> +
>>>> +  amlogic,canvas:
>>>> +    description: should point to a canvas provider node
>>> Why? What for?
>>>
>>> What is canvas provider?
>> The canvas provider is: drivers/soc/amlogic/meson-canvas.c
> What is this "canvas" device.
You can think of canvas as the agent through which the decoder hardware 
accesses DDR.
>> In short, canvas is a hardware IP inside the Amlogic SoC. The decoder IP
>> needs to access DDR through canvas IP, so we need to reference the
> Why decoder cannot access DDR directly?
The internal topology of the S4 chip is designed this way, we don't know 
why our VLSI colleauges designed like this. But similar designs have 
been removed in subsequent chips, eliminating the need to rely on a 
common hardware IP.
> Best regards,
> Krzysztof

BRs

Zhentao


