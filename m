Return-Path: <linux-media+bounces-64113-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YkLrBExPJmquUgIAu9opvQ
	(envelope-from <linux-media+bounces-64113-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:12:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC23652BD2
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 07:12:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=symple.nz header.s=selector1 header.b=mdinVAmr;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64113-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64113-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=symple.nz;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E99083021714
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 05:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD123546FD;
	Mon,  8 Jun 2026 05:11:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazon11022110.outbound.protection.outlook.com [40.107.40.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCAE34888F
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 05:11:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895479; cv=fail; b=MblXr8/RN43OFCUj88vdHyqS+Lla2tx380RKPlIe2GJ3lSDY7TkjPVX9teHWqu/V5Ts6ES1OjCHPmwh1RtPLUaZ3VfsneEMGHglg1LxEK9Xl6V0KghswsD7AzjbXc0TkPaL2Yc3t6fp1bdCyVBZmpKow9XVtW3OtlL2UUM9b5k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895479; c=relaxed/simple;
	bh=m2RymFqP/uFxM25iHKOpUM635XvC1Qt+LGm+9fe2DGk=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tm1gaKi5uRAAZcc9fqyVD2voWpQeNWcyygIiQItqX1Yz4n4x1M26Mfxddcc/LYxc/dw1TM/XjZdOUyUm2PazfnKtw38fsdDN47XWZWowoUqJ+jxgyxJGXVg6vBTR3mG926Y6KE+9Q8pp0NmENRo9ZILfz6O2mtNqaKqv7kX/kR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=symple.nz; spf=pass smtp.mailfrom=symple.nz; dkim=pass (2048-bit key) header.d=symple.nz header.i=@symple.nz header.b=mdinVAmr; arc=fail smtp.client-ip=40.107.40.110
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCC+oaG1zWbdGbxw6mUh8XJ69tfpmwW8kTU4DQf6mPk8AsKz71ETNb5OWQom10SdFhO89o0k8wWjzYlAoZB62bc2QM0cjVoittOSNOl6431f4lX/XeTP4ExPiGuXY0789RPJKY2Eei+BlEMSdpty0oQeEV+uaFBQBUfaJ0NEgJRosm71F//whoTZoV+bWTlCbW7PSaywkNg768AVdPJ7Z1HK2x3NXEsfTfoY8l1o6+VE/tAEz4cW5i7CLQOHvc/WJ6ixHhk58xoC1PwCrONME87b71vpFBHqUuxEvgXT2F4lLY5nPZWXT7A0JGFk6p1wyMEwQdE3Jb8bt5Kt6j70Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjUGtaUTZCSQK2dYOeozhnePiwWcEprV69it9q3Q94k=;
 b=OMtgF6rvdvWRFmwt0fnFnxOGFdc5jsF7OAduv64Ajy5L3EQP/Lbe4nRImpgncKye5Q1ITkMYfkBAH0N7873ZSCDdEh4GcLmwLJqIj1ERULsfiKCRuRupWkI0mtrQZ+xJbyXn2TDydmBM5ODbiBBE4/28t73DPc0uNL+FOvmLDzyCu8VOM7zlbuUUtJdBtTtk6BaaJYYD2EbiOWEafqZOAeirIzHNCwBD419ewAOFEMdJuqbguuEjoczIbsRTXiQ9k76XBDIj+EPl8vqvkkkV8WkRizj8z+9tMO0Tt/DlDynVmAC15/KzcTHus8iw9vWCzAYFB65YtgTZOGPl8CzvRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=symple.nz; dmarc=pass action=none header.from=symple.nz;
 dkim=pass header.d=symple.nz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=symple.nz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjUGtaUTZCSQK2dYOeozhnePiwWcEprV69it9q3Q94k=;
 b=mdinVAmrRNdGh41oBiGLRjAhGwbruZIWBtkVUn3vf+1X41zFLms0Eusoss6uN7B9S0fllFxk+sbNHAj8cBRBoXVyXgwOb7e2b4Ihy+eWMrS7F+uIpX2uY/Bm0Ngm6LK31ccbEHMnPyCKwADQfJ/L4JXqG7gbJKIdzXzRT3xFu5LPx+x6xjqdnByVNlC2kgK+RMFwlDdB3nCB2aiYIg9JdSJMuX3Y12XBsx+YP84R9EXV6ShC2TqZAymw74YnG0xvf9gIMbqUTJxCDRPM8XkVV87YQqn+GjtbBqHO/OHvPn9AC1KzClRKe5tjEumr+94IVXpECrBo2kbFQvGi3dmKpw==
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:b2::11)
 by SY3PPF4932CA5E6.AUSP282.PROD.OUTLOOK.COM (2603:10c6:18::310) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 05:11:12 +0000
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834]) by ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 05:11:12 +0000
Message-ID: <66768711-6943-43f5-95fa-3d97dc638844@symple.nz>
Date: Mon, 8 Jun 2026 17:11:11 +1200
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
From: Simon Wright <simon@symple.nz>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
 <5797ac61-dc61-4182-ac60-cc377564ff90@collabora.com>
 <2565c949-a558-415f-8c79-e47812db8341@symple.nz>
 <e3b93bda-fed8-4f21-b3d8-cdf28bfaba1c@collabora.com>
 <4358f22d-247c-43d3-89d4-27b57bbe90aa@symple.nz>
Content-Language: en-NZ
In-Reply-To: <4358f22d-247c-43d3-89d4-27b57bbe90aa@symple.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5PR01CA0009.ausprd01.prod.outlook.com
 (2603:10c6:10:1fa::11) To ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:b2::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB2196:EE_|SY3PPF4932CA5E6:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a0c06b4-01c8-4448-027b-08dec51c5b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	V3UCBnSJwpR9ekEMftI89BXl3P89stAHhJzbsf1CWAF/7/8Kr+meva61VnuNfECP6pL73TgUpVsmdTnWpEHIx4jADjGGQk4oL9lEBiNFzSvMrQQUziNuW+XYFBPZINOQKlv7c/RzrHAmiQMJ8cKpUzeS6QspPxqpM2T7I30gKaZCKdBFfnT40iCqvtUfbRp2/eQbq3zU6GBUU3H1thIuj2UJlcoLpY2fkaHQGUFMYyNpc13OoIWMNnv0EbgGwyVbld3spctlgKi9YuYnTHRWSGviFsa3h9e6kK3L1YTdbMcqs6j+oPOdltWZifFdJiPVytzE+ylUkc9lyuxSOhkRjkzcBuKKAkc1N1Szn6syS4D8nGVAmUzf3hteWXZ2fhXWmxVpL53sFCh3FqeI3mN9sZGVtkCXu7miXG6rDXWWY2Jx4Z5u+u+NbYq+Aq+hRlzRC14P3bjBhuNYDQpYMkyWrkwA5kz1Bp84Vm7AzI1LYK9p64uyPT2JklMuQ40b6ZB9HRY7xVvxFN97r/xWLu8ZehtGzAKRa2R7rFDMG23WIaVaJA+E3hhdGRCFl0pGhqKMjYZ3JUZ5nWK65BI4hKsB5T+SWtfo1Ae5ef976b0dziu7hmVcWZ70NMWwsf81vrrGc/YD5PTdwuU8mg20i1LgrBBy6a36/zqSLvd7ofvxpnsyKVwOQ+pLT2B7JwLXwS+sOCfFfKW36zNgzUz8nu00EQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0VQZnJOUWpUclNrRmk4Uk5STk5yaHBGZmxIY3c1ZGFscHJOdkdJaTkvQk1H?=
 =?utf-8?B?TXBvMUorWE9DdDYrbGRtSURzOG9xdlNENkxRVkR5Qzd2WGVuUkloWXpEeTZk?=
 =?utf-8?B?b0N4S2QwcE12UXJxOHVVNWs5bHZXclJtdk5hb1hwUWtBcFhGRzkzVkJvSG92?=
 =?utf-8?B?UCtKTFE0Vlo1SHNOVGYwSUlZOVJaenRIQ3kwV0Z3UXdFOGtneFUyQWExc2Q5?=
 =?utf-8?B?K2ZDTlF5UUpYWkNlaENhY3FTT2RJR0VxbWVERHp5czJ6aVgrVmxTalJIRWxM?=
 =?utf-8?B?R0NGcWh3K3o4Vzg4WkhOUXdWR09VZUNNb0pZMHBPYU5PRkxoRGRRWG16WFhH?=
 =?utf-8?B?RjMxU2lnbVVYandINXFpUC9JUG55eWpEN3RnUm52RFhRMFJMYS9yaGc2dzg1?=
 =?utf-8?B?cktOeHhrTlBVUWJLQnFDV29IbGlsVDVSWXI4bFBXYUZEaC8yR251alFFd0wr?=
 =?utf-8?B?cnYzVTkyUHVIMUtYNm9aYWhybVd2KzNudkpua0F1RURZd1V3STBnZ3Q1RWhj?=
 =?utf-8?B?bEhhZkxaZ05YQk5wQlhQNGF0ak1la280ZFJORjljK0w2aHFxZmFFNmFkSFJP?=
 =?utf-8?B?aXRSTHNrMFlIQVFiU0p2UkpuSVNwSkh2cGRENUFzWHJyQVo4YnZ2RHdpTytr?=
 =?utf-8?B?aUE3NjlhUDg2ellJajF1dEpZM2RzRUxUczdwMVBEWGNrMkU1bFM4a0Zac3BL?=
 =?utf-8?B?azdtcFBsK3dNc1dObzVzQVAxNnlXY1Y4UzJJdDRlWWI0MnV3RmFJcnduMjB6?=
 =?utf-8?B?UGZVR05PV1Q4ZzVhb0krcDNWYXpzMnJTMXY0aWY2RlFhRVRqV0R3ZGRRNWM1?=
 =?utf-8?B?dmt4WmlhTHlyRU1nREthUllISDMvSS9QcjNPeUF5Yk5PY0QxTnJpOVVMVVZ3?=
 =?utf-8?B?ZFh2MXJPMFJ5VUFuNlBzb1lqWE5LKzU5Y3F3SXowamVwZmsyVUdIYzV0SGdv?=
 =?utf-8?B?TnBzd3dZWFhQUFA0RjlpdkpPbFkvYnlZbnJJWTVseERKY2xUdGRMTUh5QTJP?=
 =?utf-8?B?WUszTDVPcFJQMmhXYjNSMlRGVVpZL2ZOc3d3SjN2cmJTRTZFM09QNkp3UGRi?=
 =?utf-8?B?TldiVENNcWxaNlVUTjVIVUZOVWtLTk1QT3FkOENaL0NWOUsyQ1pEb3pVQ3BS?=
 =?utf-8?B?VUpHR2d6bjduUXpoMnBTTkdUMUJxbVFhL3lXZDR2aFFmNXh0Rk16MktSQURH?=
 =?utf-8?B?bXpxTWlxMjdPYVpTN29GUU1NQUpTaW5uZzUyMS91by9zc1hPWHFydzQxUDA4?=
 =?utf-8?B?dHp3SlU0cTBsMERkMFV1VGJmTkdhTURFYS9tTWREOHdCVkJaZ3Z1OHpiM2Nl?=
 =?utf-8?B?SXJ5bmdoWXFkQzVKaTFPQml5T215REd4VlpUeWwwTEpmdWlEZFZoZE1rd1dy?=
 =?utf-8?B?U3dHVTdBd1hNUlkwc1dtWFlDb1haUDhZTmVtT28wUm9zb2dKVnBNanRhT3hy?=
 =?utf-8?B?eXEycDVrR1BJdWpmZGtoSDN6UzMzRzJaN0lZNDVJcnM3c1EwWTRFblcwY201?=
 =?utf-8?B?azVQeE82cERETjdCWVkreS9rNWtRZmdnOUJKSFN1SnYrQUg0YktrQkI0OGYx?=
 =?utf-8?B?eU8wSkVkWXlkZVM2RUtXU3JHTVJQMS92RnZNem4yZUxvdGR2alI2UUsxQXpV?=
 =?utf-8?B?N3NuYXkyZXdPa1lNMXRMdXVhblQyVjFBSDlqRk9hbTd0V2RmbEsvOG9Wd0E2?=
 =?utf-8?B?TlFyRlBjK3diZlRyenVLVk4vWmgra2FLajdxb3FIMUVUdzFaczZKeFExOHJ3?=
 =?utf-8?B?TlJOS3ZtdG02UGlNa1lqc2VCeThXRHV0M2tLM0ZkYlo4R1VxeVFNNlhaQUoy?=
 =?utf-8?B?TXpxazY2Z3FZRWFQTTVBY0o4elVYbVI4Y0UxTXFJMCtRUU1KWitCMFAwL0NY?=
 =?utf-8?B?ZHdKQjg4Ym9HTmhWVkNPeW9DWW1GcmpvOXNYRnBRWFdKK1NUNktyM3phczcy?=
 =?utf-8?B?Y0dUNlFTVWdDWnRIRjNOYTlPMHEwT1UzaDlCY00vVVc0UHhob0prTVd6ODd3?=
 =?utf-8?B?RE9ZSFVtbU1wZWtyMytHN2U4eE5LVThDYUE3MVJMWDhFcCt6MDE0SC9SRkxm?=
 =?utf-8?B?cnNMdmV0UmNKMWtLaWRnV2syNXZhbC9HTnlYSG0vV3B2cllaaUZ4Z1lpZTZT?=
 =?utf-8?B?SXE4VjhhN3l0bTRxLzQxVkhxYVVLb01nQktHZzRIaDlLSVpUWnJuVlRQNVVu?=
 =?utf-8?B?ZW8xdW1OVW1PaGUzMTliK2hVemg0dlVrS1NuQm9FMWRSYUN2RlBvdEQ3VkpN?=
 =?utf-8?B?SFo2T0NOcDFSWFFmMGRQNlJYM095TVRHU2tWdmVEcC9Uc29mNzlOL3MxWnpi?=
 =?utf-8?Q?5+SoB4w/Aa0Yp6QUVc?=
X-OriginatorOrg: symple.nz
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0c06b4-01c8-4448-027b-08dec51c5b9a
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 05:11:12.2071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9531f271-068a-4210-b471-bd8da91491c5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/EnjFaT/qJ5EmLKyTR0PaBukIuXOxyG6BZVxrtvxZEyyFkKnA/HwOdPGs2U8+hf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY3PPF4932CA5E6
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[symple.nz,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[symple.nz:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64113-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:detlev.casanova@collabora.com,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[simon@symple.nz,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[simon@symple.nz,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[symple.nz:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EC23652BD2

Hi Detlev,

Following up on the BL31 lead from my last mail -- we dug further and
found the root cause.

It's an un-primed hardware state after power-up, not BL31 and not a
per-frame register. The Rockchip BSP runs a one-shot priming decode at
every decoder power-on -- rk3576_workaround_run() in
drivers/video/rockchip/mpp/hack/mpp_hack_rk3576.c builds a tiny
self-contained H.264 task and runs it through the decoder at probe and
on every pm_runtime resume. Mainline rkvdec has no equivalent, so the
first decode(s) after each power-up run with indeterminate internal
deblock state.

That makes it a non-deterministic power-up-state race, which is
consistent with everything in the thread: your inability to reproduce
it, the "10% of the time vs every time" split between the two reports,
and the BL31 correlation I sent last time. The odds depend on what the
boot stack leaves in the IP, which would explain why it tracked BL31
version -- but the warmup removes that dependence. (It's also why the
vendor driver is always correct: it does this priming; that's what it
has that mainline doesn't, rather than a hardware difference.)

The fix is to run that warmup at pm_runtime resume -- the minimal
sufficient trigger; running it only at start_streaming left a ~10%
residual. With it on we get 64/64 decodes bit-exact against a
reproduced baseline race, on the same v1.20 Armbian stack that
previously showed the bug; with it off the race returns. So it's
independent of BL31.

A reference implementation -- the DMA priming buffer plus the
link-register kick sequence, ported from the BSP -- is in the repo I
shared (the warmup code itself is in the sibling rkvdec-vdpu383-vp9 /
-av1 repos, src/rkvdec-link.c):

  https://github.com/SympleNZ/rkvdec-vdpu383-h264-bug

I'm not sure of the right mainline form for a vendor-disassembly-
derived priming sequence, so I've left it as a report + reference
rather than a patch -- you're much better placed to decide how, or
whether, it belongs in rkvdec. Happy to test any version on the RK3576
boards here.

(This is a correctness fix only; mainline VDPU383 throughput is a
separate matter and isn't affected by it.)

Regards,
Simon

