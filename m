Return-Path: <linux-media+bounces-65681-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QqSXKHjUPWqN6wgAu9opvQ
	(envelope-from <linux-media+bounces-65681-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:23:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6476C966D
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 03:22:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=temperror ("DNS error when getting key") header.d=chipsnmedia.com header.s=selector1 header.b=AkAtJuil;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65681-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65681-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B85B304A6B3
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 01:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5B02D877A;
	Fri, 26 Jun 2026 01:22:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022102.outbound.protection.outlook.com [40.107.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF91E1684BE;
	Fri, 26 Jun 2026 01:22:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782436969; cv=fail; b=sb8x7l52qjdE7ZKGCqqzmvxy1RPfB25mifKFUt1ApQ1Ux5ItAbMvRVKIcq4kvdtWfzESfOl2a6UjMDQpKgG3ldMsiWZRSBDLf1pGUfesBq2Fayzfe5D5o99gAowEjsTWmiHdxThuRO/attIa0UJiOBupsb6kqbI8JVj4CEkKVV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782436969; c=relaxed/simple;
	bh=22MK4GtgwonvFC5xcwZf4EPoY9wTqwKv0JTAIyLdcfE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jlT2Ch4xv12IAknR0V34xz9iyAEnZ4gnuvE4MaWuxu6t0XaL9hxImK27oWcOmxR0YL4t/cNtmP1DmS7NByK1I92RepVOSL9Cq0/HG/GrcSj2JP4/EbKUwUdkQKBROCiEE+ar+WA1boXaYZJfjZ+AR/Ds4M39qFMZTJfvl76LO9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=AkAtJuil; arc=fail smtp.client-ip=40.107.43.102
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nauHNf7vi8x55/P/LLXolkpB5iz8zzsEjEOoSPeHx/uRdP6/zEFxy2+qwbdOG0oSVqWL+Beazqy1W1QDvAVTW8J5Q9/BR4kdjUu/VBm/fhnQdzyg9GX6uD5YADA4NL6kFMPFJhU7l6Y4nwNBdEYITfQr7GpR0SM32ItRCNl8zCrB54xiBCOcqEqK5EhZAbd0a4zkgOUKCehTh+gonF68E66+KKKbWqArt7FoJunv/OQ4PLKmSEdlJcAQzvUSYtmvAfzyjAFgrgtvRth90YFWKXSxerYqOCoF6TYiWF1cSP+tZX34qGs8pTeeP3/R9vLHtPlXa2xQQ/VJDsdpAFxXQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sho6dOJp35kTjzDaYZb87FfZ1twntcvmK0iBIbbjiRg=;
 b=WJwdfIXLxx1mqji2fzMkrd7gyWK/geTKnk4R3+7CbFqscBUG8QWrYU6jKbskAr/gG7D2/yn+xP3q7O1SmouOlBHpFpR/9nP10VUR5wwiUht83rRE++jHqBYZS1jT+KN6IBZY2XebNGQTC25jLe/bS4Kl1I3PwEW+oUf8mrGBwtMi9xdRnMIsSqppdEHZApPNarnVmHsi/6BqZ6AnKNEWTjQ0EbDtPHtYuOP9wpjf+vwOci/VzCkVwOE2KLYSYLR7ZKscR9XK2SOEJI1VKFNqRGbxpNJZdZcpHcz5ZxKdMX9UYs1OpFZao4ADl0Gik6ySY/fD3oaVG3aklt4eliCqvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sho6dOJp35kTjzDaYZb87FfZ1twntcvmK0iBIbbjiRg=;
 b=AkAtJuilTHBQhUWwSNKda+cL1ggwCpAsZDgF9LacYdAbzXgKkYZZm/muHI+l7hm5M+1JLvLwHG8tkv+3KFsCqfglBhes07+CJe4rSiBb0d6FVr6ZsIi8q8epZKUjA/IT7aDLDHBksxAv1YvEAHE/rZNS6VFoALUFwPMeYZWHFUc=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SEWP216MB2955.KORP216.PROD.OUTLOOK.COM (2603:1096:101:295::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.17; Fri, 26 Jun 2026 01:22:41 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 01:22:41 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v1 0/7] bug fixes
Date: Fri, 26 Jun 2026 10:22:25 +0900
Message-Id: <20260626012232.111-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::9) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SEWP216MB2955:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef9a3a3-9234-4afe-e1ab-08ded3216a95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|18002099003|56012099006|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ADYXndaquRZyBOrDimBKucFjLfEBCFoJ3m7GqoGvw8oycuJB5ZaAJ/z6bp6MNntZvRsUFDuH8lOaEcyx7AGrGdiAEGYEomdFfqKu4G/HTgWmfTQ53NQyf604tRj3lsr/5XZxBGFc6D3Y+9aqygh67pyun5n+jNjxvqbvwOhf9Ez9Ba+4KSE7WzHoOnMjlga1q8ZM2kLPii3UywCmovlV0wY8yIesWHkYkzIRbn10GI+QKWt3sCbqu5qPBy2ehpWsxaTfRw4V8FAXo6lwIHnh/znUGKO5bIyYiTM79LofI6IqjC3NrWbKk2dAUQ/i2CKHdmC4jlrlhEHqcJyu+HUdRo51V5hQvhmJMtJhsgQDPXL3N2NnhEh1CvKxlQS0XiHD0m7NLvk/y1115ugTOr+Eyiu8z35eImP5sxgessVMs0Gvf3/w3pgjvjDcUQPctJqEMc5uDWf9teAz9+7napeP+toZkjYYmW6/J0QWsxlq2o52NJDfbprJ0G1aOjZ+YHSJ/rBOr9HMqGsamMR+jrGp0ijMWpab4LPNV9r2diyG+41wQMUjSIQ0DeiJs7GMfkDua5bXV963lEJGz8nKVtNEk7PR56Cffl0rlLUBghhRxVxUfp1fOqLFtpx2VPiZ8paAiY/LkpNRdERw9CBmTFlTczSkDqArXm282C0jpCVQlsogdpBveYbOXNJDjh5F6OfMKqx2XwPPHbH4W0/0x40AciWjwFHbb2fYb03c6Hi3PSo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(18002099003)(56012099006)(6133799003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU05K1B1TVVUc2d6Z290ZjVMZGJtQ0dFeHZLQ3Ivb1JSUGxEeHFRRlRjam5k?=
 =?utf-8?B?d1hiNXRxS0UyS1Q5eHhmTEZwc3A1SEJobTc0M1lad3U2bVVVSENTZFZnMUln?=
 =?utf-8?B?SjUwYnBpejJ4b3J0UVZHWUxXK0VKSVJQdEdDSXRCRTdqN0xtbzNXWUUvZXh5?=
 =?utf-8?B?NGhqYTAzUGl3Q05JV0EzanRyS2hIUjVsMmJqeFdYWHA5Ynhlbmx6czdjQUtM?=
 =?utf-8?B?TGsyWEI0SzB4c2JUM01hNnZnYjFJNXlHZ2Fiejd2d3M2REZKdDBLYXZIbHFQ?=
 =?utf-8?B?a0ZKTTBBUFZnWG5FbjdPQTJvTTVvUVQzYnJlNVg3bEtvUjFBQyt3VjVQNktl?=
 =?utf-8?B?eEJEYVhTZUlwQWx4SEdwb3Z4Y05KZW15anFvVkhuRkNxek51OGU0TGg3Vjhz?=
 =?utf-8?B?OUVUR1htVlVTbEROVEEzR3NBS2hGVEdSQTVPV2w5TUMrcUJEMzdIY2REVGpk?=
 =?utf-8?B?dTFocmRNR0kyTjlQaGlaVDJqL0dIZmIxekZsZGZ1ZTI5dDE0MXNjZkkzUnRh?=
 =?utf-8?B?alVmWHE1UkErcy9wNzRrdWJmaXQzMEtTTkhhZFZZYVlsSDFCNUVNaG4wMVdN?=
 =?utf-8?B?Vkdudm1ackJURnhYbjRGSDFRaDNYVHRqU2phSkhuRG5hbThBQkNJWW1jdEJn?=
 =?utf-8?B?QXhocjFDY1EwUURkUUF1MkF2TDRDZHBRQks2SW1aS3JjbW9nOG5NbkdhZU1J?=
 =?utf-8?B?cnNnbjJVM1NzRW15YjRPK25MY3BQMkRlWk0rK1BnM2JxZnZtZllDUGR1dklB?=
 =?utf-8?B?bFRxeUIwelJEVmpVZ0Y1dS82V1FTbStzai8rdktQN0xkZThVaHk2RUM3WlhS?=
 =?utf-8?B?d3pzZkRrdVJZeG9aaHk2K0h2bTlqVGlLc3ZTWm0zNDUydTBkbm5UM2FFT3Nn?=
 =?utf-8?B?SU1ydVQvQnhGMWcxVURBbGtxcGtBdmZvVkVXUGgyOHI4ZURzQUZ2OVpHakZX?=
 =?utf-8?B?VkViWnkxcGd6WmgxZUwzdDE1aDZLYmpjbThVZFQzUGZLUXQ5MXhVVjFRMTM4?=
 =?utf-8?B?djVjZWovOUJIZmxUVlVZNUZTVzhWVkdJSmFYb2RqUm9VVlZsNURLdEFuSVBZ?=
 =?utf-8?B?OEdPY3hsSGdaNnRSaEt0SUxMRkRRQUR0R2t5YWd1UDVJM0dZU094WDdtMngx?=
 =?utf-8?B?MDUxYUdzMTQrRmh4bzUvU1p4Sk9PelZLT1ZpQURtakJ1NzdDd3lIdFNlWU5K?=
 =?utf-8?B?OHZyZjZpSFVURkJHVVh0TFM2b0tCa2ZDZUJ0YTRYbVAzNGRmc2hSVnFCQlkz?=
 =?utf-8?B?dmN1Mk5uaSt4R25hWVBYeGMrNkJMU0U3NUVaYys1UzlaZWd3aE1aRjFhTGFT?=
 =?utf-8?B?R3YxZzZ5cDdvLzVFSnVpd3gzYWlSdE96cWZ5K3NKUDA5YnJ6TWVMOTVZSUYz?=
 =?utf-8?B?dTZVM0tSWkNuM3FLSjlWek9JWUI1ZW5zei9wbFY5by9OZ3hSNTF0MHMzcGxD?=
 =?utf-8?B?aS9zSGhvdmJ6emhpUGxlNzlqaHg3K0FnMWtNTXNlZ1dYRXoxdnpzUk8razRq?=
 =?utf-8?B?dGtnZktZWGdYeG05TExZcWQ3Y1ErOXJOR3M4bjJKZURGNEl0ektiOGhmdlhk?=
 =?utf-8?B?S0hYL0NwUVo0TnNaNDlyV2ZuWVlzbVlneEkxLzRIdmlzd0pGM2g3UjJkb0cx?=
 =?utf-8?B?ZkZ1M21rVHVxd2FiRDM3aXp5dHNyOHVpQ0N4NkNEdzlsQWFRSk9tZ0c2S1JM?=
 =?utf-8?B?VHhRTU04VGF6OGZDeWNscWUxa1dsZFVScWc2MmRqbklSNkwvRWZUZFc2bkNk?=
 =?utf-8?B?cEw2TXA0QkUrZ2U5MHRYQWlZREdmWUo4c1MxMVd4RnRVekVaeU1uUHI2RlpR?=
 =?utf-8?B?UFhWbWs4MFlUSER2MnA5SkpLN3FNWjRPeXBRakJVZjd5bTBOQ0U3eWJ3RlU2?=
 =?utf-8?B?TDhudTc0dlhJSktldHJwMldQcHFkUlUvK3ZvVVFvcFNLbWc3cExUMWkzUDJ1?=
 =?utf-8?B?eXBYZVRNZ1BwZ0tvK1Y3aHZEcTBmbER0RjhieEo0elpYS0V6eWVPVk1PZG9V?=
 =?utf-8?B?dWNoZXlGWGo3cFBGK0xjbjhzK1cvaHR2UWxKSHYxWEdMTmp5SHdyTXByMlRn?=
 =?utf-8?B?UXRJcmVycUxoalhURnNBbG5oSC9xdnNwd0JqOGNmMW56N0tmamdQQTJ4TFZK?=
 =?utf-8?B?MW00Z3MrdFVIdFJmVTZtaFpOc1hnZkUyUWZjclZWcTlOdXhKamEyb3l2SkRD?=
 =?utf-8?B?SERrRzI3ZytUc2JseXBlNU9sTnhwQktLNERnWmtydWNjUkN0Yk9iMkU4SlRN?=
 =?utf-8?B?M2g1bG9JK0hyU0RHcmo0dTRjVFdTSVl5TDBDdXRwSWovWWJKZkQ1ck03WTly?=
 =?utf-8?B?OVRlSmpzYVRqUWZIUUJIRTg4K0tZZDE0T2NrYmVlS0lXRUtleDdZeCtUUTcz?=
 =?utf-8?Q?f9UOjEnlAeuNwsh8=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef9a3a3-9234-4afe-e1ab-08ded3216a95
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 01:22:40.9932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7FDCZZRWksoEnbixFko9Pata/ha78xg9WWTcP9HBiuGygb9ip3ubBnhXTo3bYvTeleXet1jbfNtMDid8lhuv8+/Ch8nmABfNUhnyMv0AYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2955
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65681-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil-cisco@xs4all.nl,m:nicolas.dufresne@collabora.com,m:bob.beckett@collabora.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:b-brnich@ti.com,m:hverkuil@xs4all.nl,m:nas.chung@chipsnmedia.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[chipsnmedia.com:?];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_TEMPFAIL(0.00)[chipsnmedia.com:s=selector1];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,chipsnmedia.com:email,chipsnmedia.com:mid,chipsnmedia.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B6476C966D

From: Jackson Lee <jackson.lee@chipsnmedia.com>

A few independent fixes for the Wave5 VPU driver, covering decode setup, m2m scheduling and stop_streaming robustness.

v4l2-compliance results:
========================
v4l2-compliance 1.33.0-5476, 64 bits, 64-bit time_t

Buffer ioctls:
                warn: ../utils/v4l2-compliance/v4l2-test-buffers.cpp(813): VIDIOC_CREATE_BUFS not supported
                warn: ../utils/v4l2-compliance/v4l2-test-buffers.cpp(813): VIDIOC_CREATE_BUFS not supported
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for wave5-dec device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 2
Total for wave5-enc device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

Change since v0:
	* For [PATCH v1 3/7] media: chips-media: wave5: avoid skipping device_run while VPU has work
	  - Remove to declare q_status
	* For [PATCH v1 4/7]  media: chips-media: wave5: Add timeout while stop_streaming
	  -  Bound the queue-drain polling loop with a timeout

Jackson Lee (7):
  media: chips-media: wave5: Guard bit depth check with
    initial_info_obtained
  media: chips-media: wave5: Set inst->std during default format
    initialization
  media: chips-media: wave5: avoid skipping device_run while VPU has
    work
  media: chips-media: wave5: Add timeout while stop_streaming
  media: chips-media: wave5: Defer job_finish() only when a DEC_PIC was
    queued
  media: chips-media: wave5: Fix pipeline stall when queuing fails
  media: chips-media: wave5: Resume device before setting EOS flag

 .../chips-media/wave5/wave5-vpu-dec.c         | 64 +++++++++++++++----
 .../chips-media/wave5/wave5-vpu-enc.c         |  6 +-
 .../chips-media/wave5/wave5-vpuconfig.h       |  2 +-
 3 files changed, 57 insertions(+), 15 deletions(-)

-- 
2.43.0


