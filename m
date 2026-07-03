Return-Path: <linux-media+bounces-66437-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iZVmCA93R2qkYgAAu9opvQ
	(envelope-from <linux-media+bounces-66437-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 10:47:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D407003FF
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 10:47:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=DoWf2q64;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66437-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66437-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 385CE31AE941
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 08:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2956234EF0D;
	Fri,  3 Jul 2026 08:26:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010040.outbound.protection.outlook.com [52.101.56.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3621D318EDA;
	Fri,  3 Jul 2026 08:26:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067200; cv=fail; b=Ig1HoczHvpATJuCC0t789u6xgN5xQ6tcYyhMuRlkWdkcrW/vu0nWCY3TX9EYDzc+7nqgovd4R3pOx8zkCt14yixpIPOOQIPUwc+uRgEqrouvrgoWSMik1rqtBON34dgL50tk1lW4UEvJjQzU/rjtEA35Y8hXT+o+SCfNvzyuJs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067200; c=relaxed/simple;
	bh=2Xnmg8JmyRgOghHPkp+mbGP61rl/9rxUA+i/sc2pSlc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lPBOl2httKLpo5HWjzk9+1cKDdNLCeYUkdSXlnGL44SCwyqz91EdeKiv56z+XBTD2shSqjdR6h6QvA2ISDZ/d0Jm++/KL5fwifq4x6wN8OkfNM9u+BqESDWDNmGZHOaVW/8J6aEvYm8KzaYcaWrlxNVYDtzLV+goZk0kYYg5pmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DoWf2q64; arc=fail smtp.client-ip=52.101.56.40
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIfvRs2kbNI7XplTZEvkYhrvNBIHAAEwZee4C970OiyBoXzRibZHHffAlBHiu0rjnPFK73W2ROP/n6Cf/w9uj25H+9jFC1WDMQ1iQIGbZQ8mMEhZ62/tObYccgXk958+oqq2QtSEcjzlyKheLeBpY0Z2R51+tcQMzJgOOPYFEgUf1XnZfUfJhtLtiWlnbElOC4g+Y09VbLaO8sw6QRpiOQSJ+sxGKivwX9wNp9VObSvNBHVSbOeoPaRU/1qv/Uutu7sIpTC5HdIAK2+yzWIV71/rcz1gq/hK46kqOESi6N8kW7l+NLHpMuzbps+eYJewTKVyJK2Y6BEVb0CjcygOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsbTAma5wnmnKIF3LWtDilAPLqboMjU1zIfjk64iKck=;
 b=lnFtF3zGp67ocO7NiYlT3/X6tp3Q74jpl7ZuN/uiYg670wIqtlI9fgM1W4dRtjv5UVME+1BAMyQmLmVzia5re4QgZCxGFg07nsdvQ8+ktBp6iLr7pyfOmxG2Ys0YhdPbE9zN+gSDMWWpf9arj5JjMUBRgdr5pTFSItIQbwnYouCTqQPV8bnnqhusB5H1YRZlAsvGDMCsP6Bq/QdSnDPr/fo18MWqHxz7Fizl1DAPz5lk5eg2yQyuhFdWcHZvrZh2Sy4rWQ/6Qqz0elXk8nkhoAi0LHrzaaTrKQ0cLvJYO+UP3vwofCCorGwMIW07+LIB5MiNor/dLG7kxZoFaavHRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsbTAma5wnmnKIF3LWtDilAPLqboMjU1zIfjk64iKck=;
 b=DoWf2q64tHHlIb50PQTIq5EiRDmhNgrB+7j9JIlWY6NtzGEcUVgxnCY3GdvDAzxjci9/XJNZHcOldD6+c6qNg8qtoXaMtE9d85O+uiwJxMpaw7SR2qeInzcHWYkYnAgNpIMePF0zQ29p3oTpmcYGik0xj5ikE4tLuYklqzEapSc=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5954.namprd12.prod.outlook.com (2603:10b6:208:37d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 08:26:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 08:26:34 +0000
Message-ID: <175e98de-f414-47d7-81c1-c0fe0a8f7f62@amd.com>
Date: Fri, 3 Jul 2026 10:26:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: dma-heap: close installed fd when copy_to_user()
 fails
To: Baineng Shou <shoubaineng@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Sandeep Patil <sspatil@android.com>,
 "Andrew F. Davis" <afd@ti.com>
Cc: stable@vger.kernel.org,
 "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260703080922.1838362-1-shoubaineng@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260703080922.1838362-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd89407-6482-4272-4b1b-08ded8dccb18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|22082099003|18002099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	d4FAhzzMWb2D70cslM1MBUkvwiaS/kktfKx20IOBEX2fClBdniUgxolcvjsL2WJaJzC48nW67FK2EoiASsnWTi4d8DChkxTL3KGLhI1IH1F3uCI4WpZ8ED+0o1lu/w47YLb6MExLLpqY2odDcqtN5ttj0OGZ04/k+oM0lhq7LXWPsMITZRtOGyjAdpUkBzdSabxuVTu09T25glVBLx8D9G+w1tVm8dxqo83nTfd2qtASo6PqcUg+2Wr6sc7Of8ojpHhNEoGZ699wQuMf1fdFRst8SVfX617WBodl09mkpI38XIc9aSAIMSZOjaWRYETYr276+Pgile+7gP9dJ1KkFObS47Cq8OO0R4O83yI5RoqyCuCBHbhddo1UXudkIjuY10uSo/WQc3HU7ys+o5f6tI4n5H7olfZeBbQCpw2vUeIVetnU759XiQ46m4WLoaQoV34VaX0K6lcdnZBd5F+bHw9Ggy/7Zu1P8F+AljNVO6rwph56IahG6La/BXbIwMTAenp97sXaNF0rsmT7dtfsjYMVXseDielwbPqvFLMfEtl838AQAvgxspeFgtcnc0ssI3kObP4WdhkC+yz0HTFYyRFsMPG3cHoaDT/jn36HmHKtkXqvQc/CemZT8g1ELYB0xNROZRpszgwiGtQtqjbbXMmFnOAH+cpG3XG9HBd/E5Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWFWaEhORlovN1NXQnR2cGt1RTRmeHRDbGJmdjRkNWwrWTY3bHhSRnIwRmZL?=
 =?utf-8?B?aEh1azJLS0tSelZJbTB0MElWMmlUZlZnYXFvZmdTUWxic3RGSXpiV0FOcU96?=
 =?utf-8?B?UDFRUjdqaUREcmlOenpTdkZUQS9rSFFWRUJyMWtWcXFzNVJtTHJxWHB0Q0k2?=
 =?utf-8?B?ckExTTJrV2I2U0Y1eHdrU3ptNmkyMENuSVEwNHlKREFIVSt3VjFJOWg4R3hi?=
 =?utf-8?B?TlM0VmtNSUpGaVZ4UHhqVXNTSGJSd0Q3eFExMm1xMGdJUGZoOTZlWkVZZGdr?=
 =?utf-8?B?YlR3NVE2MmdZT0tVSlVZcVdGSHFPMm81VmU5N3FrMTdkSzJ1cXA0ZnV5NGE3?=
 =?utf-8?B?c3lJU1JLRVRRVDY3VXo3TDdzczJCRjk2dnhxYzIrQm8vTjdiNWZFMmF3MXBU?=
 =?utf-8?B?TnZOOFlyN2RiL0t0UGlwSzZWSmw0cFFGbFRVY3ppWG1kbnRiT0xCUUlPODk3?=
 =?utf-8?B?L0lDZE5oMHdlOXI2V0lvQUh2UldlUzJvVFY4RjZ0TU8yTEE2QXhEOWNDYzBM?=
 =?utf-8?B?bVdJZ1NZZTF6VTVFbGZXNUMzWE14aGF4UGl6dnZPNUJiNFovZzlaaXJaRGRO?=
 =?utf-8?B?dmp5Y2MzRGo4QmMrRXc3MnRkOTRXak5SQVZNUDZlV2FZNHN3R1FlbmV2dm1M?=
 =?utf-8?B?WWFNNFdTYnQrMk5BbmtoVC9uTU5CcTN5QXlZNEgwQVRWeDJuTk9aY1I3cHZV?=
 =?utf-8?B?UTRQSFk3RGQ1K0hmSm1POVFHVUJuTGRKdzJZRHlPVkdTK0h5SXprOGhCNU9s?=
 =?utf-8?B?NFZ0WCtkQWQvZ042ek5qVzdQTEM2RTFMdkZscEEra0tienBmb2FHU2tsc2J6?=
 =?utf-8?B?NFBFV3R4WDBFcUZQcC84WnczQTNjazRrMG9pNWFCTkhJUis1QXUvRXZnd1lz?=
 =?utf-8?B?cXlCQmNzSFZ0Mk45Z2J3ZzF5MTd2Q3p4TURZZ3JSQUJ5VmhLL2Q0MUowRjQ1?=
 =?utf-8?B?djBXU21CVDJMdWtOMnZncUJ4VFN3cU1SbFlNdTlPYXlWWlVXSk9hcVdBSGJs?=
 =?utf-8?B?aEJtVkx6Q3kvSzBKZ2ZtQUJMaGFSYXVzdDZJWXQwWFM2Y2JWbFNMeTZJL2dz?=
 =?utf-8?B?R1dGdG1rUW9FMDJnVG13bVdWeUFxN05iUzV0dXI3bW1LTm9XT1pCUHhKb0V0?=
 =?utf-8?B?M0k5VWVYclNsczNsQkMwYTZ0eHhTZ3pHTmd0RmsvV0J3QkoxZVBPVTVFc0pW?=
 =?utf-8?B?d3FJbXp6N0ZVNVY4cnpRRDhkT0IzN1ZxaWtqSkc0Q0xNaTVlUW5BUWRFa0l4?=
 =?utf-8?B?VzhMQ3o4RHFXYlp5MXU1M3R6VUZyQjZxUkQzQlEvRFluNGxnbGhvUlVueVcr?=
 =?utf-8?B?WkpHMkw4SExSeFFJQ1pkNUtwUUpkNGxMZGdFRzhoTC8yU2pCREhiSEI5UVhH?=
 =?utf-8?B?UjExZEF3NVg1OEF6Z0NyRXRFeDdqYmd1Z29yN3p2SDQwd1NUSGZvb1Z0Zkty?=
 =?utf-8?B?MzNRRjZMQTZYVDFhOUc4QkxBK3ljZkFZUVArdVFSZllMancxeVNWTlhtMFcx?=
 =?utf-8?B?MTU2OHNEVFhyVEJGZnZIVmVaUmNYSkVOY0JuSnBLcUo2a0g0SnFMSkJZcW9B?=
 =?utf-8?B?ZmMrblJPSFdlWlZBNHliSzY3d0xucWxpY1k4a3ljVXBObXZMZ2tSOFI0YWpL?=
 =?utf-8?B?RHJRQlZhYkN0VjE4TzlGaWRuYWlOVVpJSFJ5aGhITWdNZFhyT2JIc1pvcmdW?=
 =?utf-8?B?S01SeU5hVzluSm5NbUJZUHNzMXF4bkI5ZnJlZnFPVEQ0UWFVZU8veUVVbHpi?=
 =?utf-8?B?YmxyUE8yQUVGNndXdCtsejlVSzBER1l0MDRSUkdOUEpDdDBObkRrU25HcVhy?=
 =?utf-8?B?QmpuaEJtUXdQdVlVUjRxZVpQbXI3NjZvS210Q0ZVa1p5aTJ3eXdSYXZzSnBk?=
 =?utf-8?B?cTJNUHJiMDF2Z3ZrZVZTKzNubHRmZnoyUmFoZHNSU0swMDByZXo1ZWE5S0o5?=
 =?utf-8?B?RmRaaElNTktyeHpNUmlPZlpycllCVjNYd3lCclJXS1g3TWhORWRURWdMeWFX?=
 =?utf-8?B?QnN3T3crZDhuRG9LLzY3dm1SODRBeG85bGZuWjIwdk5IcUlkbU1sUWdVNEt2?=
 =?utf-8?B?UElscGpYaEt6RHl6cW9sTm9IN1ByTjlpQTVuSzNEYUkwSUg3bVVlYksvNzhJ?=
 =?utf-8?B?dXhlNGhkVkl4YUVVVG1nQVJoYmtvaFZoNklqRUt4aGZBY05JNFRMT3EwY3JY?=
 =?utf-8?B?TWZoRWRMMEtVbjUvcjZJb2Y3UGxxSE9ZU2N4M0RFT0ZydzAzWE9MMWNtaGpY?=
 =?utf-8?B?NlF2UUZ6M2g5QUVBampqclZjL2p4N1didmc0eEh0S1lOb0wyVjFuR3JORStx?=
 =?utf-8?Q?v0RA9gsIlRUtq/WElF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd89407-6482-4272-4b1b-08ded8dccb18
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 08:26:34.6712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KO4btgzrW7cSZrWQ6KhPblCcfoHPc6M5knD6hhvXcssfjHQy3QBt0cJwCwWNjbN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5954
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66437-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shoubaineng@gmail.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:sspatil@android.com,m:afd@ti.com,m:stable@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,collabora.com,arm.com,google.com,android.com,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63D407003FF

On 7/3/26 10:09, Baineng Shou wrote:
> DMA_HEAP_IOCTL_ALLOC allocates a dma-buf and installs an fd into the
> caller's fd table via fd_install() before dma_heap_ioctl() copies the
> result back to userspace. If the trailing copy_to_user() fails, the
> ioctl returns -EFAULT and userspace never learns the fd number, but
> the fd (and the underlying dma-buf reference) remain in the caller's
> fd table and are leaked for the lifetime of the process.

This came up many many times before and is the completely wrong approach to handle that.

Background is that this opens up a race window between install_fd() and close_fd() which is much more worse than the original issue and can be abused for a couple of different things.

If I'm not completely mistaken we now have automated checkers in place which find such use case in the upstream kernel and complain about it.

IIRC the correct approach is to call get_unused_fd_flags() to get an fd, do your things, copy it to user space etc... and then finally do the fd_install(fd, dmabuf->file) when nothing can go wrong any more.

If an error happens use put_unused_fd() to clean up.

Regards,
Christian.

> 
> The failure is easily reachable from userspace: pass a struct
> dma_heap_allocation_data that lives in a page whose protection is
> flipped to PROT_READ between copy_from_user() and copy_to_user()
> (e.g. via mprotect()). Each such ioctl leaks one dmabuf fd; repeating
> the call quickly fills /proc/<pid>/fd with anonymous "/dmabuf:"
> entries that only go away when the process exits.
> 
> Fix it by closing the installed fd (and clearing the fd field of the
> kernel-side copy) when copy_to_user() fails after a successful
> allocation, so the error path matches what userspace observes: no fd
> was returned, therefore no fd is left behind.
> 
> Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
> Cc: stable@vger.kernel.org
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
> ---
> 
> Reproducer (full source, gcc -o poc poc.c; run as root):
> 
>     // poc.c -- leak one dma-buf fd per DMA_HEAP_IOCTL_ALLOC
>     //          when copy_to_user() fails
>     #include <fcntl.h>
>     #include <stdio.h>
>     #include <stdlib.h>
>     #include <string.h>
>     #include <unistd.h>
>     #include <sys/ioctl.h>
>     #include <sys/mman.h>
>     #include <linux/dma-heap.h>
> 
>     int main(int argc, char **argv)
>     {
>         int n = argc > 1 ? atoi(argv[1]) : 100;
>         long ps = sysconf(_SC_PAGESIZE);
> 
>         int heap = open("/dev/dma_heap/system", O_RDWR | O_CLOEXEC);
>         if (heap < 0)
>             return perror("open"), 1;
> 
>         for (int i = 0; i < n; i++) {
>             /* Put a valid request in a page, then make the page
>              * read-only: copy_from_user() still succeeds and the
>              * dma-buf is allocated and fd_install()'d, but the
>              * trailing copy_to_user() fails and the fd, never
>              * returned to us, is leaked.
>              */
>             struct dma_heap_allocation_data *req =
>                 mmap(NULL, ps, PROT_READ | PROT_WRITE,
>                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> 
>             memset(req, 0, sizeof(*req));
>             req->len = ps;
>             req->fd_flags = O_RDWR | O_CLOEXEC;
> 
>             mprotect(req, ps, PROT_READ);
>             ioctl(heap, DMA_HEAP_IOCTL_ALLOC, req);  /* -EFAULT */
>             munmap(req, ps);
>         }
> 
>         printf("done: check ls -l /proc/%d/fd for %d leaked fds\n",
>                getpid(), n);
>         pause();
>         return 0;
>     }
> 
> Before the fix, ./poc 10 leaves 10 anonymous dmabuf fds in the
> caller's fd table:
> 
>     # ls -l /proc/$(pgrep poc)/fd
>     lrwx------ 1 root root 64 Jan  1 00:03 3 -> /dev/dma_heap/system
>     lrwx------ 1 root root 64 Jan  1 00:03 4 -> /dmabuf:
>     lrwx------ 1 root root 64 Jan  1 00:03 5 -> /dmabuf:
>     lrwx------ 1 root root 64 Jan  1 00:03 6 -> /dmabuf:
>     lrwx------ 1 root root 64 Jan  1 00:03 7 -> /dmabuf:
>     lrwx------ 1 root root 64 Jan  1 00:03 8 -> /dmabuf:
>     lrwx------ 1 root root 64 Jan  1 00:03 9 -> /dmabuf:
>     lrwx------ 1 root root 64 Jan  1 00:03 10 -> /dmabuf:
>     lrwx------ 1 root root 64 Jan  1 00:03 11 -> /dmabuf:
>     lrwx------ 1 root root 64 Jan  1 00:03 12 -> /dmabuf:
>     lrwx------ 1 root root 64 Jan  1 00:03 13 -> /dmabuf:
> 
> After the fix, only /dev/dma_heap/system remains open; the
> anonymous "/dmabuf:" entries are gone.
> 
>  drivers/dma-buf/dma-heap.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index a76bf3f8b071..0dd7a84b06bf 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -18,6 +18,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/xarray.h>
>  #include <uapi/linux/dma-heap.h>
> +#include <linux/fdtable.h>
>  
>  #define DEVNAME "dma_heap"
>  
> @@ -181,8 +182,16 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
>  		goto err;
>  	}
>  
> -	if (copy_to_user((void __user *)arg, kdata, out_size) != 0)
> +	if (copy_to_user((void __user *)arg, kdata, out_size) != 0) {
> +		if (kcmd == DMA_HEAP_IOCTL_ALLOC && ret == 0) {
> +			struct dma_heap_allocation_data *h = (void *)kdata;
> +
> +			close_fd(h->fd);
> +			h->fd = -1;
> +		}
>  		ret = -EFAULT;
> +	}
> +
>  err:
>  	if (kdata != stack_kdata)
>  		kfree(kdata);


