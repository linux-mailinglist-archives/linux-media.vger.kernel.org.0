Return-Path: <linux-media+bounces-66940-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bg5TDIe4TWrt9QEAu9opvQ
	(envelope-from <linux-media+bounces-66940-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 04:40:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F639721379
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 04:40:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amlogic.com header.s=selector1 header.b=fEAO7yGc;
	dmarc=pass (policy=quarantine) header.from=amlogic.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66940-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66940-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C8D43019C97
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 02:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3C03B8D4A;
	Wed,  8 Jul 2026 02:39:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023122.outbound.protection.outlook.com [52.101.127.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F38420896;
	Wed,  8 Jul 2026 02:39:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783478391; cv=fail; b=KLvw/2b2U3zqbX88LDq2r4aSgeBtu9Y2ObKprbjtdu8rvyrt5IHxRO8+PTGYcGp/siD0pN+LpwAexDLXsw7MXGc7aW9T6zZAuK0GhHFkUhIRNDIYD4S1wBIB6dZIGhdKDekg/D1OYdUZFraVB0OH22S8otrBtyrxuCcPAB92c3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783478391; c=relaxed/simple;
	bh=Q53OWrzxGvT+w2fKK1ReTVHv4e8VayF42i10AF8cOnU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vA2TXe7qK019azQOq64qZEMf21SdxFGTD26LqrqJ0NXRNl0RHYbQR6k6DWLqzlvC3G1w6umSAq753oB5okybFm/BmtGNNkvLvVPEPukqD7GDrV5dJqMa4CkNQuljYT5Qxx9o0XUb59nqFuGGsHurhqsVdG/TGevHB38IyyY5SpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=fEAO7yGc; arc=fail smtp.client-ip=52.101.127.122
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqaR7LK7pMJdUgbJ93QY51j/ok5wLWVQajPbjDE1Kx2cD0o7qssIUm0CGU0pn30KYz8VhLXugvOKPLqshRkfOQZxcN/4y2bNDa/zutHfPgKEOODYpku4uSlGfZUDuS4smByuEXJozzpqbAEte4N2V269nUvlGmZHMjhI6qO6Ch54vmT6Kv29z7b445jvv6AI8I7n4fv1NbOWspYlBAfKx6QQCIoOC5WgKvJJOtIJCqjWXUslsmQGHlvQtSwzm8s+2R9rc9G05I1LGtzOR0ICRjRjZcL8Uw/Ct1mPTxaDQy2KR8MGR8nLOkoiuyPsFnWPB8WU0deJsZnSCgHTLSOEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FufjdPLBpsDHClc+lnDtzfI2yraf02W3bWAQ5sARqFI=;
 b=d4hOkW+MqOF2gEi/4vOZSnu9HAtJjW5VvWzygvvFcRciu1JfgfwhBJ4Z1P3p2PptR8TFPQ8X+uokC98A2sLJh77Ssa4AePLY6LyNTrF71uU3vKrCJS5UgOlONfO+NAY9j33rLlZsUbIX0Ln9rwT3UeuUqqQiba173XWEWoTq1BZ3CeLvFq6KldKYq/s1TGrTD3VQGiK+MW8NCd3zz3ouWhCJo/GUIUklyFIg3Pz3d/npAZRPJ9CIHrONZnEpyMGaojlpdN2oVBRnuLZLPZXchd8Q0MlANx+HbBYh1k83GqT09PgDfy8bdvfir9CYBCy/9jGEXayzv8VlVUES4DQQ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FufjdPLBpsDHClc+lnDtzfI2yraf02W3bWAQ5sARqFI=;
 b=fEAO7yGcXII2omoWTW01mdeVYArZlnQqU4t900bzE4G4r2WrI9U9GhJAv6jZ9y2UZn7BRsuh2EcBxIpGhwhAI/MV5L8huGnvpqQ8pPe05/MOX5i6FaeMJzpwfj3135cgBp3Ok8Hyw+Mxvhgzg3pRwfOe6BceiyuBNkCFUkRs4ueeJB/W3j3eP7FqoSrR7DgBSgJSLuE7G+rS7U+qLMfPySmCgcWtyA5lpuE9WSQ6GUp0yZBZU9dHyOIo674QJJgNv6+KO/D3IMaKhlze/xsLZuDGfW0OrPEzWqZoNKa10FNoj3aUeBoURBoyjtPkZmSdcLPU1VUE6lV4q2E81XMwUA==
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by JH0PR03MB7908.apcprd03.prod.outlook.com (2603:1096:990:34::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 8 Jul 2026
 02:39:47 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 02:39:46 +0000
Message-ID: <74fc6cfe-f844-4cbb-bc1e-0ad96af37040@amlogic.com>
Date: Wed, 8 Jul 2026 10:39:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: a9: Add IR controller support
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
 <20260706-a9-ir-v1-2-4f082ca8aaf1@amlogic.com>
 <CAFBinCBbRrt6jWj4pczE=-j86Sw2aiAaBpUoTx1x9XErw5NFpQ@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAFBinCBbRrt6jWj4pczE=-j86Sw2aiAaBpUoTx1x9XErw5NFpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|JH0PR03MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: a7bf7faf-b96d-48fd-4017-08dedc9a2cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|22082099003|3023799007|6133799003|4143699003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	SXqrmr6lg7SlqP4u6tOlDP9KVnPIRUvzzgnSwuz4njoI3ARSMRfofENMdhtuwbYyXoTuPoxyQRl0q5F10/gDYO1O8ee4gqHO8m8MykS6rft5IauJKr1vy/P5O9tFEJZv9+Plgp9Wk7VzmwR/LUEa5stTp0cresq74bj5f+EZ3pSSPcN+BDpshayLS8jqXg6Dg5TA0f9uUuYe/603UTRysMipWBU9i3LHilEaoLp2xmFxqKeECAz4guiBN7rogveH3tB5rfQ/G4bpelNNx5fPBFvgO9YfNKzSYIJsTYgXAa4SU1xN8oItffxzVmuuvNWKs83LDK6pDpmT3+1KVGsbVONMCbAMlncYPEfzSYGZ2sKK0b0iBczZnjRq50LeUHJxIlprIf7wCLBwO6GQX1iikx51zSQTgsvcGKfIiY1d4qMA9E2eDif5m54HFPvjIvEhDQtMwFLxuhASOmRUxt5DiZUnNMUuHpKRGTD8hl7Vjfm0udlNn0pEu7d/wLe4Q3Xt8kpzwTgLyYofjL5boYAl3WjYWnjYHxGUAOgx40nVnQ2V+lkf9CylHQg1C4NOqZvnbnPEHzCsglR9Nh2k7J8dL7X6gGSDDIMdqhHIrli554V67IyvKpzOxMz/Hvn7kaslF2yPE1Nxs7+cVDSb9Dc4R05u6YIDIpAAyWsCEgITAME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(22082099003)(3023799007)(6133799003)(4143699003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anMzd0E2Q3hKZkpuY0VDc2Q4VHR2M2tEUk9qMVpDeU5xWlQwQ2Z5bXBkRitt?=
 =?utf-8?B?T08wRGRuZkpJVDhiVFRYWlk4RVpjZ09SN2RFOEtEeG5QTk1oWjN1VXA1MDUr?=
 =?utf-8?B?UXVIenhXcS8vcDdQMk96OUs5MDFYOUxJb0xIRHFSWjhqNlNMSWNUQXBNNGsw?=
 =?utf-8?B?b3o2MFhnb2w1ak9rZnpqcGNQM2lhQTJxa21zQW91M1pxWFVnUzdoQ3lzQWx1?=
 =?utf-8?B?dHRmdlpMK0FrZTkzUnJmMWJCQW5SUFdjc1luSWxWWEVsLzROcWNRdUJ0VVhE?=
 =?utf-8?B?Z1Q3QVBNbnR2MUZzZUVEUnFNN1BDeEpReUYvMnV3VXl3dEo3a2F1STl6RUJU?=
 =?utf-8?B?aHYrc2crajVQSWswK1RiRmhwVUNZZktQbkZ6eEozTzRiOWpKanhiUmZFbERy?=
 =?utf-8?B?T1pxVVRyQm02Snh6RG9EemJtMzlXT0tjUk0xanVNV3FxTExobEFvS09DTGgx?=
 =?utf-8?B?eS9pU1g1bStNcWhmKytEQWNkRnpNOU1zMDcyNzk2WjJEd1dWOEgvUysybEhT?=
 =?utf-8?B?eHFISHRWb01aWG1ZVXRJQS85bC82NFhhVDVNT2xrRkxocUdwelBpR3p4OTha?=
 =?utf-8?B?bURqbjBRL2cxZEVGbFV3MzE1WkdHbGNOQ290OVl1bTVLcVRQYjR6VE9NMGVq?=
 =?utf-8?B?RXJUaE5jL1ZDQlZGVC8rbCtCWm9IWHREUE5TSzhhWUJjVEpBWlVVV3ZWVmdB?=
 =?utf-8?B?Z3pRVEg3ZUdpVkF1THQzZzg3ZGt3UTBYZUYwL2Z2a3NzZ2dtTXlLVm1ZWDli?=
 =?utf-8?B?N0JsSTU1NEQyZEptM0VtQ2RNd1NGMHIyUys1NE5rekVnOFFMeWVxbE9Jdkts?=
 =?utf-8?B?MmFCZ1hwZ1dhN2FndnBSVnBrSTE3VGJLd0lONWVDNHRBWWFsNVpYNzV4VExS?=
 =?utf-8?B?M0JGeVExSGVGZnhwcWR5SWd5NzR1QkNyUitNbFZSN20xVWpvM0RzMmkycC9C?=
 =?utf-8?B?YzNPcFZsSEVNQnVockdrOTJHYmxDL0xidjFETUdnWFg1a1gybUFLYmg1T1Z2?=
 =?utf-8?B?NmVYbXlnZG1VY051WWhIaHhDL3dkTVU1dFA4d1BhRHVYUTBiVTRKVUhERHR0?=
 =?utf-8?B?aDVlWFNmMU0zVGNZUnBVL0JHTWhDZS9NOWtGRGlWcU5pRDJGRmdKNUJkWXZN?=
 =?utf-8?B?Uk9VRVg2RE1kK3FLcktSWXgwWnoyQW81c2xuL3NXN1R1VzZLRWdtdkRaWUd4?=
 =?utf-8?B?ekkrbm1hYlA1a0d4OUVrRTNDNEN6SWtWbmo3S0xJaEQ5dGNiTFVWcG1SVDRH?=
 =?utf-8?B?NnZiMExLdWw1SXA1bGt1UzdDMlBld2tMTzhtNUV6NjNwUWZsY3QzczFJOXE0?=
 =?utf-8?B?eTRZdVlwZldoUWhvSlVkWERGaDRxdCtZOEZCcmVWNXlpS2VhOStaaVZra05K?=
 =?utf-8?B?cXpXRkxhR1E5M28zVHRGWStRRkZXTW5KZHBjOHU3OEl1ZE9PVHFySXNxa2Zu?=
 =?utf-8?B?REVld3ZlZjIxVk1lKzJQN3g2VFZIOFBNa004VVBKT2FPTjBwbTREVVEvMy9D?=
 =?utf-8?B?UEdhRlpaM25oc2lBMmF5a0RvVWk5em9rb0I2WG1DQ2RHcjlDR2lFWW1ybXds?=
 =?utf-8?B?UjlmaStJckZtd29pOE9Pb002Tk53akhrbnJJbVRMUmZsN20vcEpmWEdXU0lO?=
 =?utf-8?B?ZTltM2dQSjlXaUJYMW94N1V2dTY2YXJmNTJMMkpKRWpnT1dvc2VRSi8wN3Nq?=
 =?utf-8?B?UElUa0dRNDBBZ0xuR1A4Z2Zzd2J4SFFXaHZudzRqTDB2N1BCTXYrQWFITkYr?=
 =?utf-8?B?SnNqcEt6Y0FrVU9mcDBsRUZsRC9TTkY4VENzMWJiNTBsUS9lV1lkVDRNUTh0?=
 =?utf-8?B?cUczalEydmFoNm1FcnNiQm5xaW1QMHlWWlQwQ0lCR0lKeFg0MjRMTVQ0VVl0?=
 =?utf-8?B?Z2JrQndzeitKcVJvR05RNWZ3NW1Rb0pYZTQ3Zmk2Z0ZuWWVkZU5rYitlN2VM?=
 =?utf-8?B?dWZLc2h3eHp0UmwvYXZtdFRXR29zcjFZYmcvVDdrbEZHaUttSi9ycDZtMlBr?=
 =?utf-8?B?cm44eUo5ZUM1UHRxREpjTjRsUnVzV3laOHJOUXdKaUd6ZFFOaVkzOTFvTmJ0?=
 =?utf-8?B?L1dDWEt2aHRweDM0ZHlIM3QyVkcxQU9tOFNzVm1ORWVoUXkyVzI3dnFLcjM3?=
 =?utf-8?B?L21jNmhLZmVTV1lkTDhOdFcwUjUzVy96dEhCbUs1ckZsMVkrRVBYL25nM3Mw?=
 =?utf-8?B?TVFIT0NSdW04amYxT3YxdnpGVklVZURpM0E4Ukl1a1VoNTQvdGdNVHR0UllS?=
 =?utf-8?B?ckpmblZhVmE5MVhuK0xjcDQ0bVpNa1dSb2tIdGZqZWNTNld5YUdQd3E5Mk1a?=
 =?utf-8?B?eGtqL01hUkltRzFBaGtVOTBzc2RCUjF0ZGVHVmc0aHdqRkpQd1JmZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bf7faf-b96d-48fd-4017-08dedc9a2cce
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 02:39:46.9355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZfxdM5BxJeILg9pRir7rdHzp04iMewIyJxAfnFWijhWSoHaQIjH3zm3QhMfSXq9tmiwp4rnjfuzupN9ywRP5dy2lVAPzBvpyhFaNEleDSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7908
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66940-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:martin.blumenstingl@googlemail.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:martinblumenstingl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[xianwei.zhao@amlogic.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xianwei.zhao@amlogic.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amlogic.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,amlogic.com:from_mime,amlogic.com:dkim,amlogic.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F639721379

Hi Martin,
    Thanks for your review.

On 2026/7/8 03:33, Martin Blumenstingl wrote:
> Hi Xianwei Zhao,
> 
> On Mon, Jul 6, 2026 at 4:43 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
> [...]
>> +                               func-ir-in {
>> +                                       remote_pins: group-remote-pins {
> Can we keep the established naming:
> $ git grep remote_input_ao_pins arch/arm64/boot/dts/amlogic/ | wc -l
> 37
> 
> I'm worried that adding IR blaster/output support at some point will
> then lead to confusion.
> 
Will do. I will rename remote_input_ao_pins.
> 
> Best regards,
> Martin

