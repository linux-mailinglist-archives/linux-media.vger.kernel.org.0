Return-Path: <linux-media+bounces-65722-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jchPKxZ1PmrLGQkAu9opvQ
	(envelope-from <linux-media+bounces-65722-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:48:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEA06CD237
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:48:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="QEsM/T5N";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65722-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65722-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B49F302BFEF
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 12:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C843451BA;
	Fri, 26 Jun 2026 12:48:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011066.outbound.protection.outlook.com [52.101.52.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695503E4C87;
	Fri, 26 Jun 2026 12:47:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478080; cv=fail; b=UgjskUEHsXk6VkR6kncHh39NgbbgYkt6LcN+Op6g+B1DPqRyBH2ERCHJVKcFrJaJXZTMj7hQb6m9vSblT5mY3L+sqwPNPR7l3LFP7yPQFr14shSHkgeMCaMMRSDdnzGxLMvPS80D48wSovcycZn81n20HJ7NrUnr9n604RuWuPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478080; c=relaxed/simple;
	bh=Q8xFtsb5mxnTEwRkJdomwc+jgVXRCiUnvfvp2yh2Pvo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JAmvLuKmiMC4uHf6DIEwC1/4R4gbuoIVUDPwV1dl7nzkn9lFFbKKyMqPX4GqhEgDTQ4IsnbghjUAGdeXRMUmjQrjrwr0U1g5TWyz0Ej8W81p8hMcFL/vLfC7B859xIDkEc3IykaQLbgLavO/Qqxniev9AnpOBDfEvD6iksgp1Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QEsM/T5N; arc=fail smtp.client-ip=52.101.52.66
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfrh1rt5NtjOYn5ra0qo9ayqwGvMu6ty8ffz/QGWdytYFbCdAgy7EnXBqihYfrT8t9kel3Lu89ycYLF5fUXNTTql1kJyC6GXSE6xRMwXxOrF6jpqaw+o6PC9E1hs8v4MQSYT2nWfWoDuHqKskgEQ/dUaqA6xxynBgmHUk2GKU9TUcjuq+SKnBiJTHlFQF5TumXIeYjHpWd9YC5j3BRDbS3W83qLJ3lKosZClBkoT5VmvsAiPMMiW+ecKsjI7flIcQNWMFbUvcimDsDMmjHCOAeA8xASMXyQJoyoU/XZ/BANjceG6xPM9kTw/1tViMmHDSP535wjz+DGKY7MuQRdzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9AUdNGNKupZUUBrcI+nBGbrh6vdXHBFVgrpJjCDwCg=;
 b=j1MvD19mS7SlmJF/T+1CdhB3p/45gxmpd5fFnntcbbh0o8aeKY2rns1w458R9MFI3VbqSXXjNZNaKchU8D0O330+1nS8IXa/yQTo9HmluJUz2vjUcEDIoTfetYkHr42p2b/SIi9tGV1icB8KWMZiXJSeYnSBJ9JaDuxBLCsCUr9Dr2mjiRvSeowh71SAHsBCqo7wsKFqZykOzMISUBv4vs12Th//a+xGuM7KDlrspzKu5NmI3xis/chQLrSRAQ/pveVECx9w9XdignsozSCPEiiRW0h2tOi53VBQQPpqbsjEuxrIla6PAFYQECvLsidK8pf81QEbPgg2ap9CH5jrWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9AUdNGNKupZUUBrcI+nBGbrh6vdXHBFVgrpJjCDwCg=;
 b=QEsM/T5NknEmWfFhKOv7OSBJ86r+EGIPujDOOVIEh1T3Xln/hdoexIKqY9xLtdtvrEUZoN76STCxQORY8DqCktyzSx59nPJoLnnaECCzDk9vl0NZ3R9ulgq60GMIKzZc8QFYLT1p3ucXGsRrIvzhFsIBnTGXCPmKT3nLSn2NN/I=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 12:47:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 12:47:52 +0000
Message-ID: <5180c887-c879-440f-a58b-1cad96b7abb1@amd.com>
Date: Fri, 26 Jun 2026 14:47:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix: dma-buf: unwrap_merge_complex: dma_fence_get_stub
 reference leaked on all paths
To: WenTao Liang <vulab@iscas.ac.cn>, sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260626122836.35856-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260626122836.35856-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0422.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 0205992c-ea4e-4deb-9603-08ded38122a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	r+a1zf7U/g2g2OmnsX4wwBE2n4Hc9NRTulSF5m5xCUJB7gF34TkRqX1W5PJDpDL1WU7sKHS3FTvRbI/RAOouAFQKwgSDdM74YvkML26omvCUr287CFUNUyOiEdeQHzfX2s+3/jNlVA3N+W7CCKTwhA4mXL1eSv6OwP8pRBH4FOxhUz/uT8pBvbO981fyZLvvBqk2PvbutHGxzxETdF3aDFh/oqRzuseoCcUCvRPXXRy3tCrRl0gFvBx4AYMpzBlXP6NW5o4c6dcIh6n1LGTpDfCywAXVrjsh2YFDN/TTMzqpzFfG0vX7LOEKZiAq5h16C/85z8o+RHE1Fg1Og5AsjKv+xuvxzauZ1IowOSMr7C+Lvo+qQzwUy8wpQADTRGhOZrNM8t/c/GhfyZ6H7xR2lxv/sva5cIVtNEryp+W4TKqbVt3/lmDFzPmq/DuUqD9KiQ5BupHPZRG1bTPw/k0/DCVO4/sHEM2HZNnvSLh3+uLJI+ok2+3FRsTqwfHqKQypbl9EM4CloAc6UkCip0EdgezefMrwsCQcUpKPhP47WiVPkI4Lb6CFuYBOj+mtcowsAY/l2iEzez8VV+HZN8SMz8YytmCq+e+bLXfyVG39+CSnQgYFb5Z5dgnv/f6VrOxOV1/eRXtsPRShCJwIy+uCwhy86SaeMxkFax6WBr5ItUM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk41azdEUTFtRVJXNTZxTk5oZSsyNkdpWVF3aUZOTGtUQ0tyZDN3MUMvQkFB?=
 =?utf-8?B?WHZXalAvdlg0Nk9QNzZHYllwQldjMDBFNmdyTEdZYkJNUXZ4aDA2a0plblRF?=
 =?utf-8?B?SWlkbTUvR3lOVzdyZm8zZmIyUHZrOG9zYTBCL0tVaXRjTmgvSjEwaTB5alFw?=
 =?utf-8?B?M1B0c2NIQTdGUTJBaXlMOGVlWHd3NW4zYXgwTm1BbTRyc0VoNk0xeHZiQ29B?=
 =?utf-8?B?bTY3S09scGhaemZyM1A3aVVhWGJ2NzdDZXk1K1ZXYURKQk1aMEZhMHBkRDRo?=
 =?utf-8?B?WDU3M1YxRXFlYmJlR2YzcWhiQjFSdElLRVQwNE1aT0RLRk4ySTNGdWtDa01o?=
 =?utf-8?B?djBxamFnZXV4OS9VeUN3TXZzNWdMZndnZXRlR1NFMTQycWV4RERLSytmU0xM?=
 =?utf-8?B?QjJPUHN0eno1ZWVHRVdPSWpTalBFZHMycGowaHJFRHIyYkxxcS9SZGtDTmhK?=
 =?utf-8?B?dEEwK3kyZ29nTm1VdjZLTk5ncFpncXowZ013eHl2MTNSSU1YZHozNFF5MUpK?=
 =?utf-8?B?TUQvWVBwZVVHUkd1VklFdWpBbmdhR2lBaDRQQlluMUprSnc1b0NLbGhYeUhK?=
 =?utf-8?B?bmdsdXpTcEZId1FjZnMydGJKWjVKdFVhRXpyTExCQjZXSmovcFlkVmIxRzU1?=
 =?utf-8?B?bmdFSG5XdTV6cFRoYjZFUjgyejBPSXlTdUhqUUthMGhuTHlSS3ExVFpxNTNI?=
 =?utf-8?B?L2paOWYzUXp0OHpnMml1NGRsQkp5NkRsWlBUNHE0aEQzdElQYWlLeEl3ZEFq?=
 =?utf-8?B?NEo5MDlrcFVpWTNsWnFtNEpuWVZraXJpeGRYSEIxa1lHU3JKNFNDamt1d3Vp?=
 =?utf-8?B?a1NHM0x3enp3OEVEczBWbzMrQ1JOeHhpMEN6TGl0TklndmtVaVc3MHpFeVJx?=
 =?utf-8?B?eWFQZWRBbE8wNldnQXZoTlgyZitsNFYvVEprSHpjLzRkWDlQWS9QU3BDaFBo?=
 =?utf-8?B?T3R6QlJkNDBzWEMrdUZiOTA1WW1rNVRnRHhvN0dUdjF0RGVCaXowUXRnWVdF?=
 =?utf-8?B?N0JKNXAxeHlWNnVpSVl5QzQwUkRjaFZxV3lCTklKd2VvNFRRRkpIenBlQjJW?=
 =?utf-8?B?ekhZTzdFYkhOVUR6czhVT0RlRWlvalZMV0lod3FzV2pLdjQ3UGs4dUhudEdN?=
 =?utf-8?B?T2JEeURjSDdFM2VxOTdJcFdqUUhBUG5CQlAxR3Zmb1orbkpyWEQzcUhMQW5x?=
 =?utf-8?B?ZUtqWUV4a1dkMVNOTGNxNFRuc1N1Z2FIeDJBZVAvUmhzM2hRMC9MQ3BYQjBY?=
 =?utf-8?B?WUFTbmxtRGdJa0JGY3RrNVpiOVErZ3QvWisvNU9nY2Y0NEN6S05JRDFzeXox?=
 =?utf-8?B?d0dsdk9ubEg3SWsvMUFybEVXeHM2c0pzQ2FBeHFabmc5bGlCVmFPcHNPby92?=
 =?utf-8?B?ekN5T2FhUWJuRzdISml0RFNMbVVTNjlGSXo0d1VhaXUzYkdIQ1NMQWpWT01H?=
 =?utf-8?B?M1JOM2ZCY2JHM01MN1A2cWorWEQ4TXF1YllQc2JVYXVIc3ErZnVZcHN2L2lt?=
 =?utf-8?B?R2tiV2ZUNUZtc2M5c3N3N0J4Qm92LzhuUG4vbEFmejF1TncyTndLSFNqcXVO?=
 =?utf-8?B?b1NWTGVLbE9rRUJmRUZqQXluSEdWZy9pUU5BWCt3YndKSGVQNDI4bXBjdFpF?=
 =?utf-8?B?RTYvOUJ2dTNQaHgzbEtKNitabGgxUEYrSWYxbldScU54OC95YVFBdGtBSUJM?=
 =?utf-8?B?d1RhLzdXbWxJd1Z2cHY5cW5DZndRUGhvaDV3elFCcWR0c05kMm54NkxBb2xP?=
 =?utf-8?B?bWFOQjFLNTV0SUJMY2g4NHFTbU4zcFliRUJleEpFeFcyUEIzRUYxMnNYaEh4?=
 =?utf-8?B?bDZ2MnQrUmZJOEdZSFRzWXZtaldJMzM3MjFVZHF6UWV2ak9sWlJNS1pyR09y?=
 =?utf-8?B?Tm5ualdteS9PaWdXd1VHNEZ2QVdXMUlRbUJ0dkdJZnpxUEhrVHdMbnUwMnF1?=
 =?utf-8?B?aHlXWkZqS2NJakFIL3FTSGpDRFlDMEtveTE5SEp5Zm5PZFNpcXZVWmFiWmd5?=
 =?utf-8?B?ZzQrNk1yTWMyR2FacmpZSGxKNEVNM3UwWS9ucUIvV2ExWFcxREprbzcxNWQw?=
 =?utf-8?B?T1hKd3JtNy82SmQ1b1FJNzBiV3YzK3JBdTJLWEt4Ty9URGFRRlRuTzNRT1J5?=
 =?utf-8?B?cVpNbENLVmRWV1YxcElZdXljTm1kMWIvWnZOLzRRUHJLaTFCMzBnVFVkNk45?=
 =?utf-8?B?VENVcUdFQjFOWnlMV2NIYUZFc3hMR0cvQVdId2F4ZjNrQ3pNcnpPNkxvZjVC?=
 =?utf-8?B?WityK1VINUlBdWpLSnJkc2czS2hQQVN5NklPWkZjU0lkcUdpVklTT0NscGs4?=
 =?utf-8?Q?BeMVp4kIr1lpkTxYoD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0205992c-ea4e-4deb-9603-08ded38122a5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:47:52.0013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWwoNMEPf/qfC0KdJEV1qogXMRd4brK28gt64RcFe0u7J3kE9PC21ZK5yJTc+/8g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8190
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65722-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iscas.ac.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EEA06CD237

On 6/26/26 14:28, WenTao Liang wrote:
> dma_fence_get_stub() acquires an extra reference on the global stub
>   fence, but this reference is never released on any execution path. The
>   stub fence is filtered out inside dma_fence_unwrap_merge (already
>   signaled), so the extra reference is never consumed. Both success and
>   error paths fail to call dma_fence_put on the stub.
> 
> Cc: stable@vger.kernel.org
> Fixes: 245a4a7b531c ("dma-buf: generalize dma_fence unwrap & merging v3")

Just drop that, the stub fence is a global dummy and leaking reference to it is harmless.

But just in case somebody uses this code as blueprint for this own implementation we should probably clean it up.

> Signed-off-by: WenTao Liang <vulab@iscas.ac.cn>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/st-dma-fence-unwrap.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 72ca632e3981..b9ed85570211 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -483,7 +483,7 @@ static int unwrap_merge_order(void *arg)
>  
>  static int unwrap_merge_complex(void *arg)
>  {
> -	struct dma_fence *fence, *f1, *f2, *f3, *f4, *f5;
> +	struct dma_fence *fence, *f1, *f2, *f3, *f4, *f5, *stub;
>  	struct dma_fence_unwrap iter;
>  	int err = -ENOMEM;
>  
> @@ -508,10 +508,11 @@ static int unwrap_merge_complex(void *arg)
>  	if (!f4)
>  		goto error_put_f3;
>  
> +	stub = dma_fence_get_stub();
>  	/* Signaled fences should be filtered, the two arrays merged. */
> -	f5 = dma_fence_unwrap_merge(f3, f4, dma_fence_get_stub());
> +	f5 = dma_fence_unwrap_merge(f3, f4, stub);
>  	if (!f5)
> -		goto error_put_f4;
> +		goto error_put_stub;
>  
>  	err = 0;
>  	dma_fence_unwrap_for_each(fence, &iter, f5) {
> @@ -532,8 +533,10 @@ static int unwrap_merge_complex(void *arg)
>  		err = -EINVAL;
>  	}
>  
> +	dma_fence_put(stub);
>  	dma_fence_put(f5);
> -error_put_f4:
> +error_put_stub:
> +	dma_fence_put(stub);
>  	dma_fence_put(f4);
>  error_put_f3:
>  	dma_fence_put(f3);


