Return-Path: <linux-media+bounces-64392-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l1JWHGUsKWraRwMAu9opvQ
	(envelope-from <linux-media+bounces-64392-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:20:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F1B667C2E
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:20:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=ZBr8TtgQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64392-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64392-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD065302E0EC
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 09:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970ED3B9DA9;
	Wed, 10 Jun 2026 09:12:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8353AFAF9;
	Wed, 10 Jun 2026 09:12:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082778; cv=fail; b=TLFmek8+t27MMNn6PfNtESL2jXddKz8QD3WPe5RQKxDDe25dJ4pHXLhtqgSmFa8w+47e3jCIItsa5cxeJF7tkPkjTQFNnHP4L1EDdA6mQ/XAW1ZdsHKEL+zIiUUTdSsm606fxPmMhVSVKsMuwjh74TzdHy9anLkfRynwZk2ldDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082778; c=relaxed/simple;
	bh=YC87491SlrgtPQnqScswNATpfxAJXLL136OcwJGiTO4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jQ0gLsk3lWEqbwucQQlf7+O5SJyclThOZsp52ernL86MA4qaEcJdMIfwTIKQnuifvN1e/MBK92P6BjA8nUFkilePbuR7MNXAREt/6uR2ivul3uN7K91A8LxRdmKeYvFjGSIX/aagAb9qV+WYaseaXp4L9iM3R1RhsH4+c/SkqGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZBr8TtgQ; arc=fail smtp.client-ip=52.101.48.58
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odqy/eMGnAoNmJEJeNAHWAfNIl9r9g0HuLNXacbxZWmwvLzQfIf82olID+WieizfikThZpP/Qr5ocYqNp9KfVM6gCd3SdKqNxxlL47eQt4CXOCC5cnfycqQu6S5fBvqKl5oj88q1IznGnai8KXUpuvX8g3Fmkk4yyu+7813Ix30mCscxgRyjeGhodjWrsoZEj1bXfDHljl/k7MxSRi23WD70ERziY+Kgi0/bJ3EK8xkUY2/wM48HRy1UmI0oaDxYE2oyRn2A8i3Rq6ccRQPdYL4SNNU4mcV4JIt90GxY7v8JbLjvXu0UKF00/pvtyEc/DdMhSvDUh6/1+Q+XUzmwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlWrHUinfWyOsgh2U3AirqBlQMjF4JGd5UjNeM3VMtg=;
 b=h82EtVtOa7az4rBXpj5T6znrzCWjpk2aUkwcby/3nVzDDdkdhXf7EmBAV9gVKHQVSwR13J89sejm6lKoCMQ+UURhq2pNHt9gOmwSjJN7rDeFh1PA5tIR+DtoYakLs2p7G1+7n1gjSeFXhdSFj34SvGuKhJ3pvklX8CHc5Stp3Yqf86FkIfrQgNNjP2Vomd/cDwQS8RE27pxcl/2ts5IdTsz7dWD8VVZI0pBjX9mujKMiP1nwwJE6+42RjJgYcpgdo6ILNFgd57WsRGOilo3ZVnKdaUaDp9vw5wn+zGV1Nu4bNJZ3LO1fY9awuDmwaR/vtz8jOn0GXpudLGNabAuv+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlWrHUinfWyOsgh2U3AirqBlQMjF4JGd5UjNeM3VMtg=;
 b=ZBr8TtgQ6fojGTDNLPgW37HQh6r5QG0MlwBpqVV2ukwKZZQAhOd92qWhYRyPIxqH4Nf31LRxCDpBzFtus39iLmzTV6GhFqktyjHE2IsLE84VSYg7okg7dn+AlfbEdOqQI4AqOis3BxbCqyke3fqKL1xyew1jssW8MSRJyz7by5A=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8241.namprd12.prod.outlook.com (2603:10b6:930:76::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 09:12:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Wed, 10 Jun 2026
 09:12:54 +0000
Message-ID: <0b2d96b0-59c5-4ca7-9404-90f313725ba9@amd.com>
Date: Wed, 10 Jun 2026 11:12:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Document weird looking bugfix
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260610082602.1292853-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260610082602.1292853-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d1786a-4fed-4ed0-dbcc-08dec6d07443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0Jgjf8QkzcrWjivmk6NRhcq7jdWQonDfgRnOKX6A/w4rTPJ8Go2LM6O3bCwoS6bymOWy6JEAu0SJ6JIF3lulrqKByLhiEPH/fm+j3lEheNR0x0c1Kvp2NSaUzaM2H2gZdtPD4GoO9pYkGlmFoVXpP5atV92VghMzVZ4YtO3Nw2do3O3Lp3/d2ifZZIbqJzj3TEU9UPnZw9GeKpxE6H+wTZsI7xJCY1Rk6LhXsFRrqReMtFBPgPyTvPgr7pjvaYtdDEXJUGC0HA6BdS9FkyOSXAuPu5/NdLvNQoH8k5NSDDt4sieq/elIPquStzeHhiEi/dMoTH2F0EbAQg69fj/vT7r2C3f1vbq44RqkqEJ2nvabWZlpdvtLgA+kk1f+SDvlmKPE2gt27E6qeXesKmr8OQbZQ4mQ5aCWPsBa4XyIZMJQHH8Se21rSvnWcuk90N2AfRI6awANwVkbcAxIrgUTuZkRaSiL7deSAo1q/OQo/4g4DlxsCn9BEWlshNPG30ZpoCs6Sz/+GJrQZX7iO+ZzGCgftH5KaF1oW3zEnRdxXxEkuQPG0YfScOCvt01bb4PnWfmFku43JSLBCjGyxZUU3SCw28H6+sNsKTwWifVh3/U2Mn//Ayoy22wO02XIn623XJ53PVp2D9n4HMQND94+9WlwLwQWIIpYektMZDZGpgdug5h6UVAuoOqk03toOEXB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVRoVVFVWC92RDdjUExuT1Vhek1ZWGpKb2ZqYW1wL1dJNDNEQVFCN0pyZ24w?=
 =?utf-8?B?Q2ZVVUpqdEhML0FZeXBCeWhGSXJBa3JJNGtHZkc5YWxrMXpMbzRKS1lzMFRP?=
 =?utf-8?B?dytwSlR5Z1lDOFd1K0FiekhIZmZFckJUNXV3ekpiTTRQK0RtTzZNRityaW1O?=
 =?utf-8?B?aFdibm9zYk9ZdnNwREFma2I1eFJadkpvRERLU0E4cWJ4UjVPQXNOalNzWHFO?=
 =?utf-8?B?a3dFREVPQ0hHaVZVTGg2MWFGajJkRzEvQWREZjlNbkRZQmpSYnltU0FqREZI?=
 =?utf-8?B?bU1sd2pOZXh1MkpPOWp0Z1EyY3hjZDhzOEJrZUphR1ZNSjlZKzh1ZmFDcCtv?=
 =?utf-8?B?TnBCSHVNcnBRSXEwZGltSkx3SlR2Qm1qa3RhWml1SGR1Y1RFVlpqM2g3RlNv?=
 =?utf-8?B?UmlQL0JEY21BeWJkVDY2YlIzdk1lZm4vVGphYTVJeEFpOE12NDBmYm1tdG9m?=
 =?utf-8?B?aWxYbEdCM05QakhFSXBvT0ZyUi9RenpHTkJ2RmR0RjJHaEdZTlhPOC9IZkdU?=
 =?utf-8?B?NytpNENxK21RZkN0MHJuK01KRFJ4aTVObTNEVERDNEJlUzZnZmVyUGhxYUN4?=
 =?utf-8?B?NUlpKzdXdXhONlZBVlBGdGh4Q3IyMEpZbTFFNklwY1hrREs0UkRiVVBPSXpt?=
 =?utf-8?B?QnY4cGdvVnIySXJGVEdhMWsrUWFlSjVHTys1Lyt4OXd1Y0FMMVozd3FLQnhx?=
 =?utf-8?B?UHNZbW1idUc1eSt5SFpxYTFITGlHQVoyUFBaTS80SEN6bFdsSlVZVUgyMkE3?=
 =?utf-8?B?MWlkVkNIZ0UvYmZxaXlITVZIUStrSDNNWkllcHVIMUtrS2RmZ3V3OW4zTW0x?=
 =?utf-8?B?SjYzZEZFVmg1SG1xTkVCdmVJWDg3L0ZjMEV5bWc0REM4a2hVdGdjbzlENktL?=
 =?utf-8?B?RitabVdQQ2dFcU9yZFFhSDBUTjg2WXZ2WGNaa25vZFFWWmNpOXJvRDZZV01z?=
 =?utf-8?B?RHpaZUVnazF1c2RPL0E2QUs3emxYaFRwRmFGWUxQazl3ZldyWmppSE5xYWRO?=
 =?utf-8?B?SndTUS9sME9jKzBsQmZ2NFdSdXRCOTN4RTI0WTFrTVJUQjNpb0xnaHl1clQr?=
 =?utf-8?B?RlZWMWlNbzBmQ0pxOFdqTXBydk54VDBuTnFGSHFoYVZObC8raDNicW00K1lK?=
 =?utf-8?B?NytSQ0szSGZiMnZzRHN2Z1lEbnpCMHJzeVZmVnJQdDh4QnIxUk1PdDMyWDU1?=
 =?utf-8?B?VmlWcFhxUHNwcTkyZk9zYWZacW9YOHJBMXdVcGRoUHR5YURUMm9zcmxjdnRN?=
 =?utf-8?B?VW9ZZGpKakNrL0hlV1NjUlgwa1I1YUcrVURwOHFJcEpWanJRRm5iYWM0cU5z?=
 =?utf-8?B?VzJON0NxTFVvODdseXM1bTY5a3M0UGRvbmpabW5RcnVTSTlhR3dLd3pHT25S?=
 =?utf-8?B?c0FCaVA0ZTlwS0pwT1pobGhvN0hYbkR6Z2FFOUFtSGM5UktzTW5RdFZnQUF5?=
 =?utf-8?B?U0VPSjV6NjlIYjlMNktCWkh3Z3dFRFVsSVY1Z2hYc3Evam1CUWI0OTIxYXFS?=
 =?utf-8?B?QzFwQmZrMThVR3JTSnE0NFg3cENWaFAzRUxxcTB5djR4bU9HS0VPVVk3U0Rp?=
 =?utf-8?B?WjZEUWdBbVc0K3hFbUtFREJXVEh4SnQ2dVdhSVVLZDY4RnBqUWhVeWdTbEZP?=
 =?utf-8?B?QU9Hc3VwZFJ5VERhVHZrU0JBUDBXV25GdTNRSXNJOTBzbDk1OWk2d0Z5QVBO?=
 =?utf-8?B?N0NyNHNpWExwR25MZUhPUG41Si9qeFR5R3UySmp1OTZsTUxnL3RiSVhZZXB1?=
 =?utf-8?B?aWRaVlNGN013enhmcnd5Mk5DYzhFYW1RRFBKbWJVaGZKUXQ3TFRGSSs2RVJw?=
 =?utf-8?B?M3Vjd3hxUHB1b3BkVjZvOUpCckhhYnI3UlE4VmZxdEJ5aDNyUUtVSjhXSHlS?=
 =?utf-8?B?R3RXeFhWdUN1Wm1iZVFIWjlhU2M1UDRMZjFNK3F0MklvZTh6b0RWa1NGQVhX?=
 =?utf-8?B?YzZpbERPSk1wZXVGaXRtekN0QmFVa29EWFNDa0pvU1VJTTFnMmtMazcwNW5w?=
 =?utf-8?B?bU9SN09wNC9oVk5ZQVN1eEVFalV3VmpDK2x4bHlDQVhHZGQ1aGl3M0JPZE1t?=
 =?utf-8?B?dkpKSzFKKzJCV2NwYm1XVU93Q0w0TTNXVE9oa2JZMUliUkpUMFYxdkhPNEZG?=
 =?utf-8?B?ZExXTXFPRVdrdWE2S0dweEVzZzJ6UFFJZ3ltb2VybzROY1ZHcGphdXdaNkU5?=
 =?utf-8?B?Q0ZqeE5PVUd1YlVXUXhpQ0RZVVZBTGRPa1dnSWFXamFkZzJSSnRIeVhtZjFv?=
 =?utf-8?B?WC82K1B0VXRUWjVZQ252UVdQM2h1L21xWDJtWVozd2dJejFtZXg0NVpMVlZw?=
 =?utf-8?Q?rcpLlWm0TTze5YRD2n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d1786a-4fed-4ed0-dbcc-08dec6d07443
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:12:54.0430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEfDSzadS1ivWowybTIp/JDxofPcqUST45nGDo+/icm8Ei9WIEVs9+++C0nVUgnq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8241
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64392-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:dri-devel@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3F1B667C2E

On 6/10/26 10:26, Philipp Stanner wrote:
> commit c8a5d5ea3ba6 ("nouveau: fix client work fence deletion race")
> fixed a race. To do so, it replaced the automatically locking
> dma_fence_is_signaled() with manual locks plus
> dma_fence_is_signaled_locked().
> 
> For someone browsing through the code, this reads very much like a
> cleanup or rework leftover. Future contributors and / or new maintainers
> not familiar with the history might be tempted to remove that bugfix.
> 
> Document the bugfix.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> (I did not test this)
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 42a81166f3a9..519a0c164a72 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -159,6 +159,13 @@ nouveau_cli_work_ready(struct dma_fence *fence)
>  	unsigned long flags;
>  	bool ret = true;
>  
> +	/*
> +	 * This is not a cleanup / rework leftover, but a bugfix to prevent a
> +	 * race with someone signalling the fence. The locked
> +	 * dma_fence_is_signaled() cannot be used. The dma_fence implementation
> +	 * is not fully synchronized with locks, but also uses atomic bits,
> +	 * which can cause the dma_fence_put() below to be executed too soon.
> +	 */
>  	dma_fence_lock_irqsave(fence, flags);
>  	if (!dma_fence_is_signaled_locked(fence))
>  		ret = false;


