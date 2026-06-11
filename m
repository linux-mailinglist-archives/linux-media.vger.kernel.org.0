Return-Path: <linux-media+bounces-64535-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tTXtOnhSKmqWnQMAu9opvQ
	(envelope-from <linux-media+bounces-64535-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:15:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DE766EF23
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 08:15:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=symple.nz header.s=selector1 header.b=Q7AVxd3Z;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64535-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64535-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=symple.nz;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A67E30DC569
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 06:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC1635E957;
	Thu, 11 Jun 2026 06:15:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SY8PR01CU002.outbound.protection.outlook.com (mail-australiaeastazon11020100.outbound.protection.outlook.com [52.101.150.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF7C356744
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 06:15:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158515; cv=fail; b=vB99WW8IUIdn2oNwo0wQAlOr7yrYIc8ZOQBdeEkmJR3akixONg+/VcxO7Q6bOpyFPIB3DlHeuQHFj6FnveAds7jbiWGAr6smcdSNQsop49AZsOVX3gmcRmgLtHhXBxVg/BaGDtu1baxAw2Ov+aYJTDp8tFbNk3j2rz7rYe5RIcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158515; c=relaxed/simple;
	bh=JuIyy/hfDpvbg6a9KrPHOnG5pUDAfKG2LcEuyAlzAWc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vFR8SeTxc65Tcot+tCWJrK5lqhX7shov5jeehE3Kel1GgcBBzlgzKy5ln4UAh6ym/0Jrn7ZfiFPW0k7Lily+jn1d+qHLxLqhFJhXgLDNlHICQM4wa/uhpbYbNFrpOQ2PunIbuTMev8zUm9rutlGC77w1IGnH5x7tqZVZL/bN+sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=symple.nz; spf=pass smtp.mailfrom=symple.nz; dkim=pass (2048-bit key) header.d=symple.nz header.i=@symple.nz header.b=Q7AVxd3Z; arc=fail smtp.client-ip=52.101.150.100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w47XS4HSJ1jmbfMzzl7IYwZo7mzprKD4avHdibFv0BWiJgwZO3o34jSJMVZcuD4aKmCixdTi079QavyO3W952RmS9HmAY8Tizm3qCwsoX5zetZ7b6nDyFTOLWKzZ+jEzh1bE5AcTl+sG3ZnXE5L+Zi46dfBtUfLbYXFoVPv7pFHUwgjhyyn+Rv5YMA/rUFzGNDM1qtZA0y88ZA/CVNI8VOyfUeapxm7go66H2ptoXVYSQm20xxG+K/YgGNVw7pFQthmAiab/LdC0C+FbbygXrqPMeLKdRv6NuXtv3ummKATed0ip1ZpTR5ODoWyoFNYeO6yZ2dMBpMNx/vmYoCx6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gi5KnmZcFPb7OLvmV6VyDVj7eemRIT+ZyY2EnvLU5Ns=;
 b=OqvQ2YvLJvCIkEosj5fpcWd4FF/BL8RozYeSE8HOvmNOz7em9sBesWBWluInDx4/6JMlSQZu6C2DBUeN5v2iawiRnu7TIi3czQh1xjhGzsuySFSQ0IkQMEdTorOfRzlhRz2ENO2YOjYmoSXe0atnlkEiZTBihgr1dDWtvPcrH1WH9XqR7vsBCZHeK0icQXvi8Xwxy1XZ1W+Tds/f+Bh8DA5+odSUKrFJjzK9vbq/bAvtULQw3+tet8UFxKn0/SftGMk9aWPTmLPOoqtXYyQyslHLZvkmrYIWovOmZ2ffWaz62yxlw2nm1P3TEZDhQDC5Y3YA7AHc4lEyWZv+se2RsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=symple.nz; dmarc=pass action=none header.from=symple.nz;
 dkim=pass header.d=symple.nz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=symple.nz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gi5KnmZcFPb7OLvmV6VyDVj7eemRIT+ZyY2EnvLU5Ns=;
 b=Q7AVxd3ZEJJOcR5x4IMm+OCNBs1b5rqN4gZpqj09GufnGHoE95k6ZIUjFBKoPih9c+ebgaqE7lBTwCeCzE0gwCso2O2LWb5C8Zi16dnJREd/wuB+TaDVzX2v+bAdffJ2lowXbUeolBp1L8DCkIjsfsTkMDhcNLB5F3vwFOqm1ZLxBZPivSc+wdYmFS4qcx3DXbRjf1AYnMEGUPd0+T1/GR/ZLB4bacEbJSY7rVtgM4OAPmop5KZSdEuoY/ZQczaJguNSF9oh3BNZb+CUzlRoyNf9lcCJGbXg4gcGC7asEH0bjAJq/v8V87Ywl4ZrFWtPtaI0C+VVVu14DTxQp7QWrg==
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:b2::11)
 by ME3P282MB1587.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 06:15:08 +0000
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834]) by ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834%5]) with mapi id 15.21.0113.011; Thu, 11 Jun 2026
 06:15:07 +0000
Message-ID: <1f178828-2cba-4120-bc6d-bb3be7b24073@symple.nz>
Date: Thu, 11 Jun 2026 18:15:02 +1200
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Detlev Casanova <detlev.casanova@collabora.com>
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
 <5939C396-3A70-458F-8E6B-A55319929564@gmail.com>
 <4b3a9f32-807a-4b9e-8df2-d22f872d288e@symple.nz>
 <2CB1844A-3DB7-4973-98E0-0C141DD38B45@gmail.com>
Content-Language: en-NZ
From: Simon Wright <simon@symple.nz>
In-Reply-To: <2CB1844A-3DB7-4973-98E0-0C141DD38B45@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AK1P299CA0016.NZLP299.PROD.OUTLOOK.COM
 (2603:10c6:108:17::27) To ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:b2::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB2196:EE_|ME3P282MB1587:EE_
X-MS-Office365-Filtering-Correlation-Id: eccf992c-4bc6-44e8-cf58-08dec780c78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	VSfx+C6f35fyB23iuFa1iXMBMTxB5Kgbr1c/8aaM3PODgD1G+6un0ZgE8mwc/aJWk+UXCohDKNUVIh2XMvklcpyKMS4tnxz4vEurv2IfL39r9PvS6yNuSn6uNhhd7ePfL7WirecbaeB99bpaikHLD77DTXYqg8RAKJSWv7AybfSrUn4r6fdQobV+JfIXL/18mJ/meTsRR9Wz9AOmIDH+jNNhjlimR1rysdQoFb7ARUsVN4cNxJbpwB6OcDJM16ns5EdOSPTA7o1e7WcCknaoYkea07QdNVVIyH8woe97J8zLoFKQBK9uJ9LEkeWDEd3OXjDRwDA68QJTM4cs6xPMt6lz7XLSdtBr8bn3m2TbeyB/FRDVKuzRmwU38zqZTHQf7/nOTrEVA70mdXdAr0fEQPeIesk2hHa7E204lanjcQDl8kTVUaZ0CCyHgnnheT0dHvyLdkf0p06QMsdOA7Cp0iaJI9Fj66spsP/PDtHM35J9s8ApuTJUMdj0eSKrTIYoPP6Dbxu3CzCPiSxPI5/HpcieaT3x5eet6/H9nt67COqE9TtMecmq6Ujmr15BgcrBer3dXrg+f2A/mY/7b6XwlcNSk+1Cr/+SB71q904IpcG4HtClGCuVwm/sF7pxkx2LODCKXyO7Rdv653dCUhJgWBYGfoKzVHdG+PF/gxKPjDtUao8eEYsDS0+ls/cyWJkkq77hBOSo0t4P+0m13FtyBw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3gxUmdtVGZEK21vdTZWVEJKVGlhWWovUjBVcXZXYk9EU1IrYjR3bENiZXV0?=
 =?utf-8?B?bWZKek1palJGRGtwcW01d3lxbjBrL245NTFsNjNmM2ZxaVQvQmkxeWpmSlJR?=
 =?utf-8?B?RkFyeThLODZ0OHNuOFdMS1F2OEQybERNZEtkYS9vYlFVQmFuQVVCaGovMHVV?=
 =?utf-8?B?dkZGWjZndlFmdTN5d2w3ek1OUjBld2YzUHY1em9Dc3pNMWZLdE9SMnk0Mks3?=
 =?utf-8?B?dHFuNG5WWXpFdWVlSjlNam42RGtzNzBHbEd2aFVpWFVyRzNvSGJlVFhpbE9p?=
 =?utf-8?B?dFlsWUdwQXdTSlBmdEN0eFVjMmtpRnNNcUJIMTFJSmVpNERBVm5leVFtTSt3?=
 =?utf-8?B?azh1MURLblkyYmhxK0Y2UGdzRlFwbVVSL3VjRUVZaTBuZGt4YkxMSEpPMFEw?=
 =?utf-8?B?WjFRaEdhTTlZeHNIbWVqaHNQTEtnMW5oRUpraDRKMWxJclhOTHlVM1JNcXJn?=
 =?utf-8?B?eVE1K1ZyQ1ZwMGltalRXaDVrekljT3lvcjU0VlBQVVc0blNNaFBGL3R2akdh?=
 =?utf-8?B?N2M2WlA2bDNNSEdhakhobTIvWmNQSzRsY014Ullkem04RGVMbDkzOUlpOGgy?=
 =?utf-8?B?RkNZdmJKODAxQysvZkRiVlJLcU9DMm93cVlmWXVwek5zVGRBZXpMNEEyR2Rs?=
 =?utf-8?B?UEd5MmgwTjlGL0hxbXFNQXU4VC9wS1BJcWorc0hyeEtXOFRPSGRGUHU3QXNK?=
 =?utf-8?B?QTVrcXVSdEpONXJxWVlXcTUzWUVjM2VmazkxeFZXTHRNKzU1ek1oSG05YllT?=
 =?utf-8?B?M1lnTnF0TFdTMlFTMUR0TG1xdGxVV0wrZzUyUXlmK3F3VDJZODlzV214ejZt?=
 =?utf-8?B?MEYzc3NvMmhUbWErV1d4L0dUTzRRYVRTUHdpSDk4YmlIMThQN01WYmV3bzNs?=
 =?utf-8?B?bkJkOVczays2SlNycTJ6dWhTSlpCSXZyWU51K3BoSEtHYjNZeDFMWWFrTXo5?=
 =?utf-8?B?NGJNZGJKOUxxazY3K21qeEZkVlh3RlZTUkpTMDVNejVSOHZKQ2tYSVAzK2N6?=
 =?utf-8?B?dFdKVG9aclF0ZmR5bnZQcXMvMEVHejZwSUx5em1rWncwRDZnQVU4ZmNPWitl?=
 =?utf-8?B?cjNJbFZDVjhMSkhHMm1ZWlVEcDIyN1gxbzU5akp3cklrQkN4aWlhVHpZdlBT?=
 =?utf-8?B?bCtDT21adzRzRTZhN2R0dG0rYStSM2Q0am9CaGoxOEx5dCtVSjI1ODNMbkxY?=
 =?utf-8?B?SFd0ZXJZU29GaE4ySmY4SjY1Nnk4U2kzVzU2R2RuV2Eyc2NlOGZ0V3lEU0di?=
 =?utf-8?B?VmpGRnFqd2hPVjZhWmlkMnVXbnpSTW9BUDI3aUNIcUpWNU5vck1EMU0xOVcr?=
 =?utf-8?B?cVc5MTVtM1prZWFFVmxISGlkTVVBVHl2ejN5ZUR1dFdEME9jZDF6NFl0b0xG?=
 =?utf-8?B?N0VPTWZxRDhTc0JWZlhmejNaeHdCenVrdDd4M2RrOFBSN0F6aFZTb1VNQ1hy?=
 =?utf-8?B?eTVkelNZcGs5N1NkQVA2L1hXVGtwaVpob3puM3g3UFhxdXEzblRJUUY3aDJ5?=
 =?utf-8?B?YkJWV3doQ2Q1Q0FDSmxldDNtL2lna1dnLzRVdFJPNENIQ0xtMFFUQWZCSzgz?=
 =?utf-8?B?eVJXZWpVNTVVM0N6T3duenZyRnRVYVA1MkJ5aGlUM1dxVTFyQm82eXBqWmNN?=
 =?utf-8?B?WThDalJtd3ExdE5CczhrekF4ZlMzVVh3dUEyRW5Hb04zUkR1VEt4K2UrNnVD?=
 =?utf-8?B?eHBlMzBIL3M4Q0NpS2gyK0pNUlhTT1REYUpobTdDNzRjRHVkY2pQU0RzWlp0?=
 =?utf-8?B?Wm1mOUZvUUZzTWpneU9zZk1ndHJRSStGdkJXdHZ4TGZpcnRoTzd4aXNTaW44?=
 =?utf-8?B?Vy9WSlpEcElDcm9EWEk2UkNzdFMxdjJwTEdRMFQ4TzNabDQwTERWakdkaG03?=
 =?utf-8?B?bUt3UTJGVkxkaTBGN1BBdXdQVUNXV2pBaG1OeXBTLzV4OTh2SVNMQTRja0NS?=
 =?utf-8?B?TXVjckNrNlRDVzdrcXBaWVg4T3kyV0NuN0FUSVlVa3pTRmtNeDN3VERraGdU?=
 =?utf-8?B?aUcyZWFXN3ZTcDdLRUxKSG5EVjYxTnFQUUw4MmZvYXd2YjcvazFUVFFscnZE?=
 =?utf-8?B?QWw3L3poU2VhclJnUDNlbTQweGlLMjh4cVFFN3I1UVdqVkR6NndNTHpIRmNy?=
 =?utf-8?B?b1VaVG02YzlEVFFYZFpnWWg3dVlkWEdDZVNEOHhlNEZlSjR3dm9yeGNhd1Bw?=
 =?utf-8?B?Z1NwbzVoVXFDc1M4L1BZbE15eFhxKyt5WkVVNStaNmpSajJYWWNSQnhrV2Z0?=
 =?utf-8?B?K1ZlTW4xYzBrNFFETmxLNHBkOFVGeUo1TnJ4a1ZueUQ2VGMrNUlQZnBESFls?=
 =?utf-8?Q?1pLT40wqD7O5mVieSO?=
X-OriginatorOrg: symple.nz
X-MS-Exchange-CrossTenant-Network-Message-Id: eccf992c-4bc6-44e8-cf58-08dec780c78a
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 06:15:07.3439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9531f271-068a-4210-b471-bd8da91491c5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5HjKTsxq4evv3ZOXiZI/7NVxGbwOnMSKVZu+InSGmgyEFZyLWMZfbb8iCJ4F4Jf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB1587
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[symple.nz,none];
	R_DKIM_ALLOW(-0.20)[symple.nz:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64535-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:piotr.oniszczuk@gmail.com,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:detlev.casanova@collabora.com,m:piotroniszczuk@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[simon@symple.nz,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[symple.nz:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[simon@symple.nz,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,symple.nz:dkim,symple.nz:mid,symple.nz:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34DE766EF23

Hi Piotr,

Short version: the in-tree port didn't actually have the warmup running (it needs a
probe-time buffer alloc + a pm_runtime_resume hook, not just the decode code). Rather
than pick that apart, here's a clean patch that wires it properly - and I've now
validated it on hardware.

The patch is self-contained and needs no devicetree change (mainline already maps the
"link" register bank it uses); git apply-clean on 7.0 and 7.1-rc7:

    https://github.com/SympleNZ/rkvdec-vdpu383-h264-bug/tree/master/fix

    git apply fix/0001-media-rkvdec-prime-VDPU383-deblock-warmup-rk3576.patch

It adds one file (rkvdec-rk3576-workaround.c) plus a probe + pm_runtime_resume hook,
scoped to the RK3576/VDPU383 variant. Confirm it's actually active before judging it:

    dmesg | grep -i "deblock-priming"
    # expect: "RK3576 H.264 deblock-priming workaround enabled"

I validated it on the two RK3576 boards here: on a NanoPi R76S the warmup takes BBB
from ~18% of decodes corrupt to 0/40; on an ArmSoM Sige5 the unpatched HW decode is
100% corrupt, and the corruption looks exactly like the photo you shared. Before/after
captures:

    https://github.com/SympleNZ/rkvdec-vdpu383-h264-bug#what-it-looks-like

Your board spread (nanopi M5/R76S, rock4d 20-40%) and ours (R76S 18%, Sige5 100%) are the
same timing-marginal race the priming settles, so I'd expect it to clear on your
boards once it's firing.

If you get it built, a quick "builds + the line shows up", and a Tested-by across your
devices, would strengthen this for upstream - multi-board confirmation on a hardware
workaround is exactly what the maintainers want.

Regards,
Simon

