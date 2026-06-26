Return-Path: <linux-media+bounces-65714-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IhD6N6RvPmpOGAkAu9opvQ
	(envelope-from <linux-media+bounces-65714-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:25:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4230B6CCF4C
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:25:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=JGoZfS9w;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65714-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65714-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AD373027118
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 12:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61623F4DCF;
	Fri, 26 Jun 2026 12:23:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010045.outbound.protection.outlook.com [52.101.61.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA5637F007;
	Fri, 26 Jun 2026 12:23:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782476624; cv=fail; b=u7hoTQtw6xvIw4eugQYbHoo76877ADJiN16nuPu4MH0TvOhx7JFI6JrRBnzSut0zjyDBJmqcd5cdM/Ve7IV1qlaYS88raaAuOaeSFRTvfe2UFcKAeOKZ4I8BjWSf0Dh+pYg908t3Wr3OYNOKCoa1vMhBtU/8rDgAFis55plTclU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782476624; c=relaxed/simple;
	bh=Lsr1HMbnj+P/No3nZuUxIrLD5ZZEhT6l7l4jqoiyX14=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PZJlzfmiSjH/e5ax7evxJRNoZYuj9SKvzoghcdO2DAPsXPbc1tIC4e7vOI9h8FgE38KE1BtWOf5gcmdy4Dib4bhqiv1Dr4c4SFIMaDI8AoLmXRlcZoJJQPiilB6OpzS/Iq9y4HRuoMUkfe61/W8u8YmjVZfEyuLGMQzsm72/vKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JGoZfS9w; arc=fail smtp.client-ip=52.101.61.45
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLbgm8gqsFNtidvPY9gzsU4h/yLYE5w5jySlPMbjPT0KIZPAkNaydzISsp5L7OMH0eYJaY47m4Jfh5kn3hcgM/KdGXSzkgxH+lWEiwfOwuhcsbbx50f8mdXcJxhNXquTbU08Wzz5Q+xwawwrK0yNF6aKyUhfN7hEYdjhv9ghSS/DmUoeABd4fMaIC0T4ofOkB+n6gOZDDgaOUtgK04uBdaj2MHfBaSvVL8Piq+XsLNzQsHt6j/9qnb7YDJcHQsoXWGHpTkBV2RRG4LVF3AcqulmTmG9ZDQwGt4HePGvq+61OZzGsG5ZxFY9BNdeTIcN4NkOalj0ToDSI4Ro+iTcVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ae7JoDfAT4nZKqzKd5BpBO8QJ4B/Kb5cUylY7DAscVo=;
 b=Bi9PEcf3zyFKsKG3rQsOMsv8AjeJoxdYqPSvurBgFEQRobYO77HXwB3KXm2UO9LA0pvXjZToAEaqF3uEt+iTxqVHhplE80kzypCzj+5jPJJ0PXRjub03xbutBhx+Ebvtwt5AYySuNVw/KC6qVlG9z1OCiP5E4WAF9ty/l8eBpdzfI7Cct2nMThEeOeABvcM6aEfoQC1CwbOEmNRCjHWLXltr0FZ37qvPHvkSio0twqi+4mHCEBh7pen1BjHpZWi7n25yBzx1E2Z2SqJDfe8xPyjZPMNqnjVCA727C9So4+xMDGeO2pl3hKx3kBOVoitJR0nqsUpsbiczzoMNBBpqAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ae7JoDfAT4nZKqzKd5BpBO8QJ4B/Kb5cUylY7DAscVo=;
 b=JGoZfS9wjR4vW0bSvRO9YbbGP/7E9ISIIA7cIDez3sAZCCeUp7iYDjIh5uOooRaYeRt7qKVe+KMR8dSqab37/hLXaiGWZjjRDCf+LG4uChB5DQY38erE8DWlNoKNZJ+d8gqP9XuwZw6LoW5zSgfpGler/VqVDcH7qhj/7muq+MI=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Fri, 26 Jun
 2026 12:23:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 12:23:40 +0000
Message-ID: <dc2c1f29-5f1c-48fb-954e-46df677f35e6@amd.com>
Date: Fri, 26 Jun 2026 14:23:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: udmabuf: avoid list copy size overflow
To: David Laight <david.laight.linux@gmail.com>
Cc: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20260624125242.11232-1-alhouseenyousef@gmail.com>
 <06bddfca-d868-4043-ac6f-28ca103fff02@amd.com>
 <20260626123139.7d6ec6ec@pumpkin>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260626123139.7d6ec6ec@pumpkin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4408:EE_
X-MS-Office365-Filtering-Correlation-Id: f98e3006-81ae-4b38-53e6-08ded37dc146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|4143699003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	34iFshEyTJxYTubFETIKZLtG3cyLO9AaBGioCOh3V9JKjTz1q5Qg5vpZ9bQlCJN3TD+6RC9xpH+cOGiDSzjzaLWwYLDqcJtthZT7PHALaSObz8aYlfPgY70QYuTMbTfnIvDP4n+JE2eYu75lf6mGF2lxa4mKYi6K5K/gmLItfslpzSe6+Onz39VqvhB/KS/z1IcBo1ItAK1V8L0JdERTtc6tzcaT8eXP7lxNQlFYJ0eJ4eKrOwd6xGNx0s11CzATppEfRfaq3/TLom3q7tl93yMxR3+bRg0NzHEJftlcgOPKD8U4NmzsTDlXhMBAejv5u1Qmn/6BKqy+nXb8zncb2KL1KMZgydZcQxKspNmCK/kOcNLsfh6MdwGBiiTuOF+T0Sa6MnhFyB2RO4IiNHdgZxUTTmOjCiAdYU+tku3Hqyl6fw9BQJKyEglN2n0bVRqSXaepS0G/iBYxW3q10RtfSH2G19HHU9s93aYMo2CmcrKv+ysMxSjvbEfXx5VNF3fwfeQ81BmwpuDIm3Ssi65zxuznxP4nDhKyC4u+1LugWxIyoAFfq7+bG+OgpMuXCntQXaGMzyL7v8Wo4ibU55Rv7Gjumtc4wKfqH4GPjE48S06OsFmDX12CaXjpHC8WIH4Z6meWH2gLw57XbYcU6KcLPddN1ewOm4PCqygaTvTtknM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlNrek8rK2tnUndqOGhWdzBpcFJ4UkVwUFlYaFJXQkdhRGRHSWgyL293VUtx?=
 =?utf-8?B?M1hYbWtRWk1VZmxqVEFHbGxBaEdrUHBCZXBQVWhibTUvUnQ5V2ZOemNRaWU1?=
 =?utf-8?B?djZaSUpjQTNXbDVUemhNS1hscUplRVdzUWVhemZrRFYyY0RyUXdUdDNla3JY?=
 =?utf-8?B?WGJseDFyTDNveGkremx2bmYrRkgxOU9zeUVPc2NlY3A3aWs0em9UZGZOb1N3?=
 =?utf-8?B?KzA0cXk2dGQyQjZvZjJuM1M2S0RvNkgxRjROU0R3bVZqVTdvczRIVlBPMGxB?=
 =?utf-8?B?WVlFRlU0TjlNb1RuV0hrNWFzaDc0cHpKOFhlcFJ6QXdiM0lEdUs3ckE5TkJj?=
 =?utf-8?B?QVBYV2ltaFB3Y0JHMnpPMkhpVUNjOUlHTEh3VWZFSU5MSlBsN21hS0VOMnY1?=
 =?utf-8?B?MkZDQXVwczIzSG9aaHZxKzV1K2pwZzNHOEJVODF3VWdWN3dRR2o3SGl4NnVu?=
 =?utf-8?B?SWdJYjZuVEFyYU1yWHRnblgwMkx0aTBDRTFIQlBqdUdtY21iMXEveHhocXBJ?=
 =?utf-8?B?RmF5N0NmbjdJeHFNSjlCTHRRUmpyek9hclNtejFWYTEwNUVPZThWYjFLeEZL?=
 =?utf-8?B?MDROU1ltMVJUekFudWpwbVY1K0NSZUJZNE1ZbVhuNGtpbWl4SmttZXAxOWcw?=
 =?utf-8?B?ajlDdlNMVU5aZnR2MlRVbENqNVowZEdUNXA5bzF6aUxaUFZycndwZlUyMnNx?=
 =?utf-8?B?SGNFck03TGRoc3o4RlV5TVl5M3c4U0tOSjhPSWJNVW8rNVcxK3hiN2lPR2I4?=
 =?utf-8?B?VzZGWXRRZjdheUt0U1FSN1oxdWR3TWtnL05zT2JvZ0JseTR0dy9FUXJUZUhl?=
 =?utf-8?B?Tm1CMjZDbWxaWTMvUnZETUxVYnJSa0FBNTBBZTBnbWMyQUVWL1NJOTBtcG1t?=
 =?utf-8?B?MEo2RjVNeWJMRjM5b1VmNlVrMDFLRzZhRVkrWUZXR3hFNWpUeU5FUW43Vy9D?=
 =?utf-8?B?SkRpVFBZcG9ZeDgyaGR1WDVaaWpmMXQ4RXkrUVFkRWNjZlZJakRQRnRKTEc1?=
 =?utf-8?B?TXhCNFhGS0swTjJGTTFtYWRoSW92dDVTYllrWnEzdkVMTmhURk0zUStXcFBR?=
 =?utf-8?B?N21ZSk1qemwvRjMyWTZ5YVRRakYzZEtVNnYrVmQ0d0hGZ3haMzc4eFZFTGFX?=
 =?utf-8?B?RG1wRDVLUTRJV3Z1UlVZS1k4U3BoYmxaZzh4Rk43OG9wZWlMdXZoMWlMRUkw?=
 =?utf-8?B?MUdUK25IQ2hMNHM2bFFldTNaRHZqOG5ZcURSanZLYUZKbk0yZGIrODByNDBQ?=
 =?utf-8?B?SnJwcW5TTXRVaDZJaHl3N0ljS0tvWHNsTXVyOVNXUGx5QUYzbW9kWkl3dnNu?=
 =?utf-8?B?aGNOV1BSVGdJelplMkFKejYvZ1A3N3Y3K20yeWpoOC9DUktYMGZNbGdjbExv?=
 =?utf-8?B?Y2hUaXdjVEkybHFoSHV4WE1CNEJVWFhzS3ZIN2xvYVV4aGU1R2YzVC9Rdk16?=
 =?utf-8?B?WHNPWk0vczRXS040VnEzcnRXT2N5Snp0VHVlSFRwTjB5d1l2SjN1VFlvRnZp?=
 =?utf-8?B?dkNqS0wweEt0eVl6VWlTOS8yeWVlTWVvVnJTYU5uRmoyM2dTRHJyaVc5bmQ0?=
 =?utf-8?B?MUptb0tnNGd5TnBmTDIxVGNEVVVqT1ZSekc1QzBoNERwbko3Z2o2U3pqNEcr?=
 =?utf-8?B?OUUybS9CaFd2eWpXY1FuZDdpNFJHcW5yUnVRRXNJSjhOc09zWjhSK241TkxD?=
 =?utf-8?B?YituVDlqMURheDRtV0ZsZFRsR2RmMGJuYm54eExpa3poSEFodXYveWVzYWJt?=
 =?utf-8?B?MHEzRnBWNVZnNWxJL3V0ZkF6THVwcjlhTFl0Nk5Rbi9iL3o2ZFpQRUJWM1ln?=
 =?utf-8?B?dTFMVUZCdXZSSkpIVGprdHZUV3haSDhLNlVRekp4TGZ5ZlRGeHgvcy9pMmU5?=
 =?utf-8?B?ekhwNTdvZzhwWUFlN204QVNTWCtxOUJaNlJUNXBWbkhkN2FTM3VzTXN2SFA3?=
 =?utf-8?B?N2VNaFJzenlTdWRSekpiOUt4TXh0TGRSVVpGcjJHTnBLRVdMMHExSnpDYU93?=
 =?utf-8?B?OVFCcElDWHA3Y3VqS1k1UFFwTzQvRUtRQm01UTViRVZ4ckU2Rkt4Y1dKMzlm?=
 =?utf-8?B?eVFsL0duSURaZ1JBem4wUGc3YVNtdFFuN3dSVmxFVm51VmhXUEdYM0FDSzRQ?=
 =?utf-8?B?OVNTdGRpclliQWxCWU52ZVljM0NCczZ5WTNOcnJaK2g4QlVvZHAzL2V0U3E2?=
 =?utf-8?B?ais0RWV2YkdvQUNCcEtac2xieHBSZmF0eFlIdVpSUUlzQTArQmdQTWcwcWk0?=
 =?utf-8?B?UWlxVmdwMFE0QUx1TVhYUVQyMDdmLzdlNGpvSEVmVWd1OE1GUDBpenNwRHhv?=
 =?utf-8?Q?8nrzeDc1YBxolH5wv9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f98e3006-81ae-4b38-53e6-08ded37dc146
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 12:23:40.1918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBtqKWsJzyYMP5qVHsMST921K0K3VBmsCGQyofklXeU7u6ACqfcT2xc59QFlcr6R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65714-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:alhouseenyousef@gmail.com,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,intel.com,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4230B6CCF4C

On 6/26/26 13:31, David Laight wrote:
> On Wed, 24 Jun 2026 14:58:58 +0200
> Christian König <christian.koenig@amd.com> wrote:
> 
>> On 6/24/26 14:52, Yousef Alhouseen wrote:
>>> UDMABUF_CREATE_LIST copies an array whose element count comes from
>>> userspace. The count is compared against list_limit, but list_limit is a
>>> signed module parameter while the count is u32.  
>>
>> We should probably just drop the sign from the module parameter instead.
> 
> Does anything sanity-check the module parameter?

Do we need to? I mean shooting into your own foot is supposed to hurt.

Christian.

> 
> 	David
> 
>>
>> I don't see an use case for negative values here.
>>
>> Regards,
>> Christian.
>>
>>>
>>> If the limit is raised too far or made negative, that comparison no
>>> longer bounds the count to a range where sizeof(*list) * count fits in
>>> the u32 temporary used for the copy length. A wrapped copy length lets
>>> memdup_user() copy fewer entries than udmabuf_create() subsequently
>>> walks, leading to out-of-bounds reads from the copied list.
>>>
>>> Take a positive snapshot of the module limit and use memdup_array_user()
>>> so the multiplication is checked before copying.
>>>
>>> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
>>> ---
>>>  drivers/dma-buf/udmabuf.c | 9 +++++----
>>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>>> index bced421c0..b4078ec84 100644
>>> --- a/drivers/dma-buf/udmabuf.c
>>> +++ b/drivers/dma-buf/udmabuf.c
>>> @@ -469,14 +469,15 @@ static long udmabuf_ioctl_create_list(struct file *filp, unsigned long arg)
>>>         struct udmabuf_create_list head;
>>>         struct udmabuf_create_item *list;
>>>         int ret = -EINVAL;
>>> -       u32 lsize;
>>> +       int limit;
>>>
>>>         if (copy_from_user(&head, (void __user *)arg, sizeof(head)))
>>>                 return -EFAULT;
>>> -       if (head.count > list_limit)
>>> +       limit = READ_ONCE(list_limit);
>>> +       if (!head.count || limit <= 0 || head.count > limit)
>>>                 return -EINVAL;
>>> -       lsize = sizeof(struct udmabuf_create_item) * head.count;
>>> -       list = memdup_user((void __user *)(arg + sizeof(head)), lsize);
>>> +       list = memdup_array_user((void __user *)(arg + sizeof(head)),
>>> +                                head.count, sizeof(*list));
>>>         if (IS_ERR(list))
>>>                 return PTR_ERR(list);
>>>
>>> --
>>> 2.54.0
>>>   
>>
>>
> 


