Return-Path: <linux-media+bounces-65721-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BKmICu1zPmpzGQkAu9opvQ
	(envelope-from <linux-media+bounces-65721-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:43:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D286CD17C
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:43:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=qnlmyxlc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65721-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65721-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2429F303C8F7
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 12:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E6E3F4DFE;
	Fri, 26 Jun 2026 12:43:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012033.outbound.protection.outlook.com [40.107.209.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9444B3F54A7;
	Fri, 26 Jun 2026 12:43:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477783; cv=fail; b=iRzkJyomHNd2YjBvvXaBgmdKphFmJZepWrU9jb2/AZbkak6v1vpGZyCOqTG3LdqtS+VHiRTeYyDreXwaRmt5+sWeyMeMkfj7Qvv+YbQ/Ikki919OeWTCb4EZryRDLhKjyp6zPAaZTIQnmK13b5866tQyYY0n60a3sDsFlaBQVfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477783; c=relaxed/simple;
	bh=fLEPGKYczTM89SErA0ohgXnP1FIx/XzVb+YpWkGyDhc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oKWU53E1Qzie0VrWoWHEsS23aTOxBMgvG8zW5N/Qxx1vvYmWvU4oI0XbRrizurGhtEA04QL6wo8Ztoi6WNuE4TP0rGdH37mCxrjHmvWgPPrR/p0lYGhhhJQKSsLPdjMNYfypY4GOaLRV5jmatgM5CMacS87CgFAQBx1QdBTRx44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qnlmyxlc; arc=fail smtp.client-ip=40.107.209.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaGxm+BxWrHr0l834SNGgVHrZ6GXf388Q5RFyeukfLS0gaq79hHPK53zYJsp2VhGOAHdLXKClZrYDugT9/0YdnrZ18Vn98FWRaOGFZoU3cC8idNkXDZ56R/XvVIszcgyU87deZWGXga/vvPUVaOEgVH0jkRvc3R1qGKRX0/w15FXm5IuuYztYaeuJQOzLVw+dkL5u7DMRVXGo6oZhgmPHAT0bTxxGfhZD4CD761FJv26HCxfs72ZFQf+C0bZKlKJHYgsL2Aph4+nXjUJuwIre1zV5qnCTi6QzNd7c968PwgecDpNHaKGY/i89k6qn/S7j87vglv1GL5Z9ZRI6EYK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeIKZBoH9QJ9FOobXdjkS2zm5mUreF0cEqUX8n7t3tk=;
 b=PyPVojkx/PFPbP3D1MHh3J7EM59YjG9u4dpB/zbbqZMQpFa56hBuWvn3D+jkNoPght7bFM8AqemOYWLNb0AgxoWkmg5zLq7nGoWJM/z3x8ZNdFqPblPmJrO59v7PDVD1Ar2MiYzkocV7EJ8RX9vcdEcpCS7sVTtRPeYJ/QIpNPWrKQJM8npYvfKCEt9l/qrmM18rp0tmaWSPicEoj9mSXoNeJPDL2xnV5mrWJmcxzi4TPjxbWD1k2Fu+PpJdyfEa1qaDSj9vVyDQySaHyH5FuQSbl0uicPvgeq3yEqUd6ZVdrm3Gts/zygIGxn6nd6VtwPtVO9x6AIdPBtTUXho59w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeIKZBoH9QJ9FOobXdjkS2zm5mUreF0cEqUX8n7t3tk=;
 b=qnlmyxlcjvduZzq80LTUTdt1jcmJBvA6ulX+xOnBoq2w+Ep/XjkvysNd7oYhzm6tWhUVDhI7wXkleYJnqVu3J1UbckHApUM0wA1vTqnnpQ3Yxgo/xRs9nba0D6PBZBCccyD0ULyrphusU+OmIlF7NfJ2yJxK6/0VfHxY1RNEFfE=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 12:42:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 12:42:55 +0000
Message-ID: <07a4bbee-ade1-4aa9-8d17-c9e57dcfe211@amd.com>
Date: Fri, 26 Jun 2026 14:42:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix: dma-buf: unwrap_merge_order: success path leaks
 chain and array fence references
To: WenTao Liang <vulab@iscas.ac.cn>, sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260626122145.35549-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260626122145.35549-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0854.namprd03.prod.outlook.com
 (2603:10b6:408:13d::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 3253b9c3-3869-4c8b-5ba6-08ded38071d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ewdHgOcBVFtJFNhoeGPY54e9NbZjxiOOjNyTFaTq9zZqxI5R5kEC/+E8/QKSpa5xxTn2l/l3uzO6B1ybIeTvEPx8H0x08i+sc2ExInfmuaGee4nBjFfCJ+gG27/hSdt1oYwYK6n/8Gytzqy70BLhZjl/o1BxHiKpRPW21hRn7Yz4xqKOTsWgMhMQV7k1Bek6s+iJM+qf8ZLG/F/szs0G3UWLuaoK/vMwMlH/8+zWgGuQNvfApScUUXDj6FvS4hLp2yva4LYBD7OBNtfXV/CQfAPUpwXT/teJtTz2kFD9dQx9rA0gHFU01LeaprIw2Zqd6Tk5kDzhBbFVNhT5U1xUk7MOn4Q5X2tr3/YkZ0+osdYxJwI9TgE8Q1ty7ENBOw+StkNaVWhzd2fxoR7sn2WcQzBcHtXYm8G1pYPzdMl7Ie6CF8Pks1016nQdTJvo2DwzYZIXCc03htCgFcsLl8sx8newJakiRciVLfKg+T8UvYFwnUzaTjJwigRsN+6/wfCMjdlq9csKc1UaVJFHov7FTco3v8mEJ/MYToE0mZY+I7i3CdwYOXSHtJS9AwN6fbM6kwQcugMJAODpc/Hc/0U74BRrMa7PoQGzCR5WsP05KVqPYKI1Jxc/FHaxXhYkjPVTnD6h9K1r2joNLlmZc6oPvhuI0FZoY6tFPnCik+rmegI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXIyd3Q4MWZjMnBmNXlVNVUvTEJ0OWRtazVmZmRqOU9pMEU5cFRDS2l1MElQ?=
 =?utf-8?B?aHQ1VmhTMlJaeURpbWZ3YjhGSWlmUkdWQ3VwK2FncEdhLzNXZk1TVkZPM0Fu?=
 =?utf-8?B?MlZNWHhyZUtKV1JWOU1SaVYyOEtwc1JGL0NBeVV3SjMzMllBejJNa1orRlRw?=
 =?utf-8?B?OEJzc3ZXQml0emxMRk92OHE2OHpyWWwrbzU1b05OYXJZSUU0NU5NdzZLZXRl?=
 =?utf-8?B?U3NqZUtQMUkybU5FbDhBdno5VEU2b1hob1ZlYTJ4V1JTMmpsRVBBQkVKWnVM?=
 =?utf-8?B?dUp5ZEFKTmJ2N2E1MGF4Q2FmLzJid2IwaExRckRtaVJVYmtFL3RQOFJPY1pZ?=
 =?utf-8?B?UHdZczlDc3BBaTZVeWFLRzdTd3AveVgweUNYd0RINDNuVHd6UlZjUGYycEs5?=
 =?utf-8?B?ZU1YLzE1ZmdqTk5pSGhrdElBY21Fc2kza0tJQktYS2JOdlUxSlVzSFFSM2Yr?=
 =?utf-8?B?ejAzWmx4N3VmMk81QXA5OXdtYk9UWXdySTVVcVJXL3YrM1JqNEtCblltaTFE?=
 =?utf-8?B?S3lVTlBKcFNpQXUxdmlhUE01YkVXa0FPc0NlMStNVVlLMmV3UjI0THVCV0lM?=
 =?utf-8?B?V0JvSWE0cExZd2duTzRZMjJnMWJYb2o3Zyt5OVo5MXFNUE5EeFdTQkdydFdx?=
 =?utf-8?B?aktvSWUvM1UzYW5TUldQTHFwU2Y3VEdhWEVQVXVOamlONmxUQVpZbFl1MWdN?=
 =?utf-8?B?cUcxYzF4dU9zNmxkbnVoRmxibU5pSG5RaFpZeFdORWxWbDFwQTZhc244U0J1?=
 =?utf-8?B?dzNXK1BIak5VVEhQNmZDSDZTUDRCY0oxVERRSmtjSkVMdDJpMlMvWlkveTJN?=
 =?utf-8?B?c3B3S0J0NnIwZTRYZEJSQ2poVjRPdUU5a2VjRFU2cWdzejIvVmFmVmcxQWZX?=
 =?utf-8?B?bmRYUjEvMXV1eFRLd2FuT3BDZjl5TndTenlMZGxQaGVNcWo5ZjQ4a29xeExq?=
 =?utf-8?B?dGlheTJZMHpONi9zdDZSYUkxMlJveUhjMVdXOXlESlFMYTNmWTVBeGc1bGhE?=
 =?utf-8?B?ZGkzOFE5RHlGZUVBZzBkcmF1YlphM2JyWnNOMEY0ZTI4S0lWeTdXNEpTZVBh?=
 =?utf-8?B?Zk1vRDdmdml6YUl6RXdtUG5iSlhDTlVBbUNvdWluL0VRbWRyeFY2Ni9HUExJ?=
 =?utf-8?B?M3M0R3dnWmo3bS8xakNkbGpINHdkWFJ1djBwV2NMalpQT1hUem52MjNjTXpV?=
 =?utf-8?B?Y2pHaUdMN080MDhaKzFVd0hjdEh3VEtIZ2NjTi9oMmduZGFjY0YyUjVWTGJG?=
 =?utf-8?B?aU15WGMwKzZybnpCdVlsZGViRGZzRGRGNHFUZWl1V2tGUEJ3RUFoN1UxdGoy?=
 =?utf-8?B?T0tZY01PSEZOL3NvMVlxZVFtL2p0WnQwV1hJZkdYcnVLd3U5K3J1TlZmVWh4?=
 =?utf-8?B?Rjlta2VwS2wrOCtoNUtzcmlMMXRZZzVaNVpiK1lNaVFiMko4N0hNVUR2OXBz?=
 =?utf-8?B?UFBpbEZhZWlGakRiZDVORnRsNHB0Q2dMbVBvMUZ5a3lEamRRVXFUWXFFeEcv?=
 =?utf-8?B?cG5jNlhMZkVlUUdyQU0zWGVGeUJxYno1VE5kYWdpcHliTUNzOStaMHpPVGxw?=
 =?utf-8?B?aUQzMGxCb09vUTVRc1AydGpUVjN5U2JDWmxhbHBTZGlqbjNIeDR5dndxamtw?=
 =?utf-8?B?dE9zWkFWbU5rR1FqMExRN3dKakd1TGIxcG52ZUIvWUdtOGdMK05VQWxBT1pY?=
 =?utf-8?B?RFdxNnpob2p1L3ZwTGxrZDROMGlISGV6aXdVUnQ5TjFIM0Y0eHgxT2dWZU5R?=
 =?utf-8?B?MmF2U1RmY1RBOGNselg4ak9KNUpWTkhZTi9yaDJlaGg4NmtrYXZTM1F5RnIr?=
 =?utf-8?B?RytOcmd3SDF0WlUyOWoyMkh1YVd4QlQ3dUpNZDg0UU8za3lCa1l3L1dpVUY4?=
 =?utf-8?B?N3lpaFIwM0s2c1BONkFLTHA4bXFlWXZ4ZFl5S21jYzFtWWpGSWRlUDFYQitV?=
 =?utf-8?B?ZEU2UXNUQksxdk9RS0tQTHE4YzFEM05pZjNmaCt1V1lIdFJHWUM2QjUxMFpp?=
 =?utf-8?B?TEFiRzJ3dzhjWjN5UU0rV2dvSzV3RTVsdEJzNFR1aTN4TkNZd2x3b0V0UWpu?=
 =?utf-8?B?MFpBaUxDMFM5L296SWVydDZjLyt3LzdJTzE3VllidFZ2RXh6Q2ZrUnRYN1B1?=
 =?utf-8?B?TE5palNNVkdwREZPWUtTdi9aVEJRZGRubjIvU3pKME9FOWplOWtSN3dRVW5i?=
 =?utf-8?B?dFBRSUlGUnlXWGhiL0x4Snc4djFGL3A3eG1jTnJJMDNWSVBtWnpEbVl0emdD?=
 =?utf-8?B?ditiNklYOFBsV1FEVVJUd0FXak1xU0tEd0ZFZFhCbEpzL3EvWTk5TFI4bkRm?=
 =?utf-8?Q?bhUuHOJClQwdxsIju+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3253b9c3-3869-4c8b-5ba6-08ded38071d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:42:55.4047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPDMLfWHV0TRoLtXQvkXoGb5w53JXE4MizysWcMGj3uGa6e2MH1J4AJFOEipN2Bp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8190
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65721-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vulab@iscas.ac.cn,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,amd.com:dkim,amd.com:mid,amd.com:from_mime,iscas.ac.cn:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3D286CD17C

On 6/26/26 14:21, WenTao Liang wrote:
> The success path only releases a2 via dma_fence_put but does not release
>   a1, c1, or c2. The dma_fence_get calls at lines 440 and 445 were intended
>   to pass references to mock_chain, but mock_chain already acquires its own
>   references internally, making these extra gets surplus and permanently
>   leaked.
> 

> Cc: stable@vger.kernel.org
> Fixes: b1cce631e61f ("dma-buf: add selftest for fence order after merge")

Please drop that, this is a minor issue in a unit test and not anything which needs backporting.

> Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/dma-buf/st-dma-fence-unwrap.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 9c74195f47fd..72ca632e3981 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -472,6 +472,8 @@ static int unwrap_merge_order(void *arg)
>  	}
>  
>  	dma_fence_put(a2);
> +	dma_fence_put(c2);
> +	dma_fence_put(a1);

That looks correct to me, but the error handler below is incorrect as well.

When c2 allocation fails we also need to release c1.

Regards,
Christian.

>  	return err;
>  
>  error_put_a1:


