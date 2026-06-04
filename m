Return-Path: <linux-media+bounces-63719-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ld2UCp/dIGp/8gAAu9opvQ
	(envelope-from <linux-media+bounces-63719-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:06:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B263C5A1
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:06:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=fKaWDuQo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63719-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63719-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42FB130568FF
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 02:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440672DCF52;
	Thu,  4 Jun 2026 02:02:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021077.outbound.protection.outlook.com [40.107.42.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E182279798;
	Thu,  4 Jun 2026 02:02:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538533; cv=fail; b=Zf5FW94xPzW5Is1eihdLCrPRDsM2hEFPbtsOfLdikZLztaeDXMBrRP17sWZGvs7eGPpuK7M0d2sulMcPmTnwSbKJ7oIVkkAS252k0DjXSKn9CK4x9r0IUJ+1eq/qVvSLyTWtVkQQYc3fAk58MoDjitMva2qyqtsis+Lgm96MuzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538533; c=relaxed/simple;
	bh=zcPvfiRcYqz3kJVOhLlXIzomKp15ysn1IshX1c1OZq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XfD8tZgEa7+y+oeRwv84JQZxMP+FCc4mMZfWJ0xPT/RuUvu4QUA4QnEiXg5B4OfjjYtC9aRE6r6IgHFf/oPN1A0GCQhErBG77t0iLygnQolz55SHywRh+/JDKGaPVnukx4b4xEokybgajXKjle1BbnVYZt3R8PRApL5l1mp6nrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=fKaWDuQo; arc=fail smtp.client-ip=40.107.42.77
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HI5X73zLzqKP/64A5MMzdsg002LXYgv4kAGcITkoBW00ZkKuO8hlRKYKQOureoaMR3XrKBwDb3at8CxXZ+KgDkqoucNyCkMQmfqKUcjkiOGJBc0PNFNY5oKQYQVDqjbF3ZgpmBqF749AXz3x0xYn94fsxNBKZZFtyYZ6NSAej0yQpAaG6jVirSqo2tnSCFop1bF+eHfo/abB71eBiwtsey2rzLzO0aSomn8kK0v2J/bOAgtMdER+hAQ3l5AetnFrF34EwMp7FRAjiZGYS8IdkwxpcPr9vaiwGP3aWssB2uFbM6GycJS+SubweDs256V636F/M3jjjYMOPaEnXclZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xo6+lmL1NcNGXYM2WZtWU4HhIvAPLCRMTpr/Zolt3xY=;
 b=wn1l5i+3aoAX5OD+JWqFYfp+cd/UejbzeKw8Nv0aAAvomfFKfgP/gORbI3ylCXO7QJ2ZFq0YpsXFeFlLFZGwLsicfDz9XbgJ3CdKMwE5BH/MJ7U6Z/hJDR/uWUF9/SOOZrUzJtgICy/khoolc9ZAe0zsOeQlAvJLMFFEo00MsN3PyIy+V5Y09iu+x7hTKtlPL9p2nc69hVyWmUvItmlXhzwKGV9UpfIzNMBhPGBKCqDRNEyh7W0erme2DxDEYFJ4yiHNn+kqoKjWqs2a99l010VuHjuW2TgVkHr5P5YAX24BO1za7f4Higz+h/hP57c2WmEcLGkrncuDBlclekQ+Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xo6+lmL1NcNGXYM2WZtWU4HhIvAPLCRMTpr/Zolt3xY=;
 b=fKaWDuQoT56PyLUCHoSMesLX3M4dfsnDRLGesIdZ0JVv9sKGYmXcpXESGZgJ94wk9zhtwh/ilNrRAXZCPgQvoFJn1WZXz++b5UfqOLi21SKnkGtacYIQUfNmwsDJVnxP9I7h4qIVZUsX/hgDxHmYkVPygcB/+in0ySr+HmEU2dI=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE5P216MB3229.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fe::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Thu, 4 Jun 2026 02:02:06 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%4]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:02:06 +0000
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
	nas.chung@chipsnmedia.com,
	stable@vger.kernel.org
Subject: [PATCH v0 2/4] media: chips-media: wave5: Set inst->std during default format initialization
Date: Thu,  4 Jun 2026 11:01:53 +0900
Message-Id: <20260604020155.77-3-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604020155.77-1-jackson.lee@chipsnmedia.com>
References: <20260604020155.77-1-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SEWP216CA0024.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::6) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE5P216MB3229:EE_
X-MS-Office365-Filtering-Correlation-Id: 11bd11f5-01bf-4fb8-2a57-08dec1dd47a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	htZfiHLnCzFz1X7boap3jUeABxoio561Vfj7e03z8TZjBwh8XpxBq1zSrbOT+ZzxzUVg9ML96kNRLP+VaKXdLlaYnVjJhHmR4/3qM3BYFdNcCUbgGdC8giIvPk5TYCaLjJp7gwOpkZH5fbpHbTE9P8HDq6UhOO9BGhd/lTgnIlE0C25QrzQduHUfBaEG+D3NOzEJZ0FEb35ntPBMCm80KK6NRYauUrJkkTH8dEzhvah5O/b2qYWMEvXXc95ijN1ETL3NDY0iaYsXX5iKBezn8kxV4RO8KTt92/tldLh86ckN2Zxst3NJo3Q/kCU58QRfV1ZXNjhQLaxrBQaih2Cyi9fjdX4ygMpz6qHd5fuHpI3+lcEhkb/8TynkGluoHJkPa8p4YuwfpS4vGLhj4QfnqottdtSTYOHbR2nATCeBgTnji9AP6VUJK/Z0EoDOC/bfUqB4r1g4ykWXi9uh4C+abQEVEt6f6DqfmWZDENwtt0zInc0xXLFTwHJgAdd85P1dnA6OsqU5JYTNP6x6DUnQ8g2d3on1ssX6vb5rZsUjM53eaeaUONpR4G85AMI3hOBbNMJgacAUP916LQRBYFecuz87fn20Ns+uuOtMAkxLd0xtVwcHBpR8s4icuBtE6F99hay06kbvx2vxGgf2fIu4s6ke020eoYzFbuH15T4rPCatJLo0nEf45Ji2XcLCcON20mf+bqCs9jJNUfQRvOF9Mkt0JBdTO6Sb7c3Ci2nAKrGeBko1HR7+At2xBbfns5mz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVdaWkpjUUhKYmVJTllNSWFiMklmOUFsbTdUUmRtamlDazFqZzVwZzhWTW9R?=
 =?utf-8?B?MndMcjY3aEpaK0p2OXlHZnZYeXBJM0N5TkQyQXpqdjQ1akZnQm1yOTFJRGh1?=
 =?utf-8?B?Q3djaTdObXhPQVhPU3M4YkNZZi9UaXlJVEVsa1hSNG85VnZDdDVzNVRIRFBS?=
 =?utf-8?B?ZW9EbjNaazIxQU02WkhUYUFpbmJheGt5WStkUGNNbjdLWnplV3ZINkhIODBl?=
 =?utf-8?B?MmxmbWJDVzVPV1FTR1VsN2Q1YTJhY1Z2MlI0dW1QaTBOUFphSWJRWFc0K0FQ?=
 =?utf-8?B?Q0Y2MUtpYUJJZ1ZIN1RtbDhkZUlJeXovbjMwYVMyYy9nSHhMcWUwRStLUk5S?=
 =?utf-8?B?UGd1Vm9aTis0ZkJrRXpWK3ZGWmJCeS82ZnEvUEdmZ3l3Z2UxVGJ2SzlUU1Ev?=
 =?utf-8?B?MDN6ZW1ISmRlbVR6NHdPN1V5eVdhYm1Td0ZGUmpUWGNRdXN5YWJjODJiQXhK?=
 =?utf-8?B?M0t2ZElneFhtVUY2bktsRjdFaXJIK002WDNFR1BMY21xUlpkM1c5UGNuUmg0?=
 =?utf-8?B?REVmYU9rVHFlWitDdERZaVcwVnNCNXF3WTg3aDNmS3RMNTF6cmR3YUhuZDlS?=
 =?utf-8?B?VkZGZGc2NWtJQ2M4cmc5T3RxT1hXYlFkL0o1eDVzS3FHY09jZzA2WEZlSTF1?=
 =?utf-8?B?NDBVTndnYk1QU0JTV1RpdVRqZXFEVDlwbXJWUWpOdW5oVGtGeHVOdUp0SkI4?=
 =?utf-8?B?QUpGRXY3NGFvcTdMckxtUzhOZTYycTdpN3kyUTV4QXFkVzk0OFVJSU5qMDM3?=
 =?utf-8?B?eTBlTnhNYkxqUzNjOWtJZEdWM29GMkVtWGhEYm5jVFREWWtwdHBHVUpra0N2?=
 =?utf-8?B?dEVOWGIyTmlxMHhVRVRxZ2pDL0VjVWtyVG9EVDBuSFowN3U1T2I2VFllWHVY?=
 =?utf-8?B?YXBGSG9mRkdnYXFKTFZWZnl0bm1Nc0pIQ25OaGVaWUR1KzQwSWF5cEhIVTc1?=
 =?utf-8?B?QW44bndrM2VzSnBOK1hNejEvQ1lnbEppYmxmNWh5VlF4WkJJTWtsVUNwbFQw?=
 =?utf-8?B?bGpBbFBhQnBQUm84NDFRV0RtOExiVDZwaWhhUWFpTG0razM1djRUQStaT3l1?=
 =?utf-8?B?R0djN2RQMHVOeDB4YkIzM3Z0RzBYSTMreEZ5TkxFSlYxQzI2bkM4MWdoeFdP?=
 =?utf-8?B?SGRyTDY1akV3TWQxTjh6cENZTEx0Z0pBN3VoZ2lCS0FvdzJhMGZnWUJESjRt?=
 =?utf-8?B?NkdUWUY1Z2lsV3M1djhtZ2t3RVY5dVJEOXNYOHp0OVliZFVpbHdRTG9LQkc1?=
 =?utf-8?B?WTNlT0FyaG8wT2EySGtUeHQ1QVRONjZESSticjM5Q1ZWMXBYQTJyUGJsQ0VS?=
 =?utf-8?B?U3BsbWRrZk9qQTQ5Rm40RXgzaG5uR09VSmthWXhMckd6SWVUY2tMTlRGMkJC?=
 =?utf-8?B?YUtqdS9wUWlNU1lkTUgwTURWdWJTcnlOeUZwZHRkZFFrVThWaGgxNTBWZ0lm?=
 =?utf-8?B?TkNYbllzYXdLUDcrU3YvL2laZ25TNWdwOXhNa1ZxYkIyeDNSWWxBakZRVzBV?=
 =?utf-8?B?WVVKRlROb29DWkdFYU0rVWRuR1YzTlhpR214QTBZaURRSjdRVXhYMUwrVlV5?=
 =?utf-8?B?MEphdWZtcDQ0a3g1Mk52OWk3Nm5mYWdDL3NMQnRBblFrWEZFVXZRS1pMK1lX?=
 =?utf-8?B?aWppOG02SitLTG1vSW5VdExFVnlaVWhDT2EwV0psb0VweHJybmFVOG9GMTlR?=
 =?utf-8?B?c3QzdWRXYW5pRXViNFFOVkVJb1VuZXU3UHRvT2N6UDlmSXp1bG1TSGIvT08z?=
 =?utf-8?B?U3RrOG90M1l5UW01N1ArTTM1angxdlRCMzJici9jMWxrQ2hPb3JCZGpXaWx2?=
 =?utf-8?B?YkFwcEpPQkxNNUhxYVNTSERkc3dVV09UL0ZYMUFEVTE5eXRBT0pFSE1nRFp1?=
 =?utf-8?B?WEpaTUlnaVplT01mdG1aWnJ6aEYrOVpJR3Q5WUJaWW1PSEF2Y3NVRGtrSEtL?=
 =?utf-8?B?eDh3UkZoWEptcW5tYkVFeE5veW1mQklxcEI0YWowZ0pmUlFDVkpZcVVqeVcz?=
 =?utf-8?B?NFdPVE4zUktkWnhZbzEzVklnVnJGU2hmVTdNWkxWL3FwaUliRW1pcVQrTGcw?=
 =?utf-8?B?c3ZSVzlYUnA4empSUE9LSnlqQ1pISytmQnkwVURwYVVVczdaeVZDaUkrNjIz?=
 =?utf-8?B?YnJQeWJZb05aQkFsdkczZnhtSElMSGhzZTgwYUs1eDJJZW1Sc2p4RVk3ZkVo?=
 =?utf-8?B?THFBUktNNXhIdHV4OSt1eUJBbS9yMEJ5d0RHYXZxZllsbFFCZlVGMVBkOEM5?=
 =?utf-8?B?NXNOS2ErUkJmNXRPZ0l3c21sMStyeFlNMGRKTUYvM1N5dXZiYitESFJBeVZD?=
 =?utf-8?B?eDBLUjQ4b205Y3VjUHdSSjM5Q3ZweEp1Vy9TT05QRERMRHB1RG8ycDRwWVNp?=
 =?utf-8?Q?mSR8yvZlgAO7dwKA=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bd11f5-01bf-4fb8-2a57-08dec1dd47a9
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:02:06.8220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9yIFffRCnhDN5u8XuOYMiBigldS8MS0lGHgi8DgYZBxc3/6jLZ1dkt2aPe3I7YCTAPzDk3PmgQuV9Ex4+XEBPzUVwqGy3AXi3cVlcLayiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3229
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63719-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil-cisco@xs4all.nl,m:nicolas.dufresne@collabora.com,m:bob.beckett@collabora.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:b-brnich@ti.com,m:hverkuil@xs4all.nl,m:nas.chung@chipsnmedia.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[chipsnmedia.com];
	FORGED_SENDER(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:mid,chipsnmedia.com:dkim,chipsnmedia.com:from_mime,chipsnmedia.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 246B263C5A1

From: Jackson Lee <jackson.lee@chipsnmedia.com>

When the encoder is opened, wave5_set_default_format() sets up the
default capture format (e.g. H.264) but does not initialize inst->std.
As a result, inst->std remains zero, which does not match any valid
encoder codec.

If STREAMON is called before the user explicitly calls S_FMT on the
capture queue — as v4l2-compliance does in testBlockingDQBuf — the
codec/product check in wave5_vpu_enc_init_seq() fails with
"Unsupported encoder-codec & product combination" because inst->std
is neither W_HEVC_ENC nor W_AVC_ENC, returning -EOPNOTSUPP.

Fix this by setting inst->std via wave5_to_vpu_std() in
wave5_set_default_format(), so that the codec type is always consistent
with the default capture pixel format from the moment the instance is
opened.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Cc: stable@vger.kernel.org
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index e6c94b6f2671..f9fcdf4c224b 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1494,7 +1494,8 @@ static const struct vb2_ops wave5_vpu_enc_vb2_ops = {
 	.stop_streaming = wave5_vpu_enc_stop_streaming,
 };
 
-static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
+static void wave5_set_default_format(struct vpu_instance *inst,
+				     struct v4l2_pix_format_mplane *src_fmt,
 				     struct v4l2_pix_format_mplane *dst_fmt)
 {
 	src_fmt->pixelformat = enc_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
@@ -1506,6 +1507,7 @@ static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
 	wave5_update_pix_fmt(dst_fmt, VPU_FMT_TYPE_CODEC,
 			     W5_DEF_ENC_PIC_WIDTH, W5_DEF_ENC_PIC_HEIGHT,
 			     &enc_frmsize[VPU_FMT_TYPE_CODEC]);
+	inst->std = wave5_to_vpu_std(dst_fmt->pixelformat, inst->type);
 }
 
 static int wave5_vpu_enc_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
@@ -1770,7 +1772,7 @@ static int wave5_vpu_open_enc(struct file *filp)
 	inst->v4l2_fh.ctrl_handler = v4l2_ctrl_hdl;
 	v4l2_ctrl_handler_setup(v4l2_ctrl_hdl);
 
-	wave5_set_default_format(&inst->src_fmt, &inst->dst_fmt);
+	wave5_set_default_format(inst, &inst->src_fmt, &inst->dst_fmt);
 	inst->conf_win.width = inst->dst_fmt.width;
 	inst->conf_win.height = inst->dst_fmt.height;
 	inst->colorspace = V4L2_COLORSPACE_REC709;
-- 
2.43.0


