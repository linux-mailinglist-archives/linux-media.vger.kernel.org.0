Return-Path: <linux-media+bounces-61236-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E2EKwPzAmo9zAEAu9opvQ
	(envelope-from <linux-media+bounces-61236-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:29:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E2B51DB76
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 11:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CB64309236F
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 09:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EC74921B4;
	Tue, 12 May 2026 09:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GlZy3rYk"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC8239FCC6;
	Tue, 12 May 2026 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577996; cv=fail; b=V4fk7vrUonfbPraZoRutVv3MLKY1r9h7PyfIBfZvJ6N4M/fO0FxItJ1fU5fzAe7wOmgBDcpcadLoYF3zORaEoG2S66Ei//fIplcw/WDrm0/J7UfeQpP3s/m3xb2V2vo4wH1wJeo4nxAP0gKDW4UCNWboGtB8RB51zD1dfOOggRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577996; c=relaxed/simple;
	bh=mdhSWvhOxotT+4j23B6khk5CfKe4fqYjVcjsElOzJPg=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TQilbLW9EElfmxEIEJjuD1j/IhEBIvGxNOVvcb3FTW6hJjvnfJ4N2+dSYPiubyjYt1QMWxZI9vO5N7mzydjn483QJVDt2CoYqXtTQGrKupknGP9D8vta4nfJfHoCtMDBlUIGngZ+5SOc3fU8bY6ejyXG3qgFdAW6wyyT+BkHeOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GlZy3rYk; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVmlEyhqiLF3qmbZwxJPh/sXagQ0z7+iFo0ITADCzisLfyFIjouz0GoX7cF9t54cxEao+5wEBsSzd9GS68Iwe7dBt+m4FQz3IHp6Zn5lEpoDRgtiz1IOfLjuPaxYP2Xhh+ELtx36NurW35w1ULnI2lihtyFna38qNdcWBzDBwW3agb1UGAr6153F6ewmFcHAmKzDCBeKa/JVwvr6JOWJsssx6o0sobiTaMINivxTWaaeX29GMMWPkOUlAbV3VhMpXomF5vm/w5xUld5Ab9imGCHHaekXBrPCLTDaUkQSj4Csw9Pw8rk8QKNGnVLA1KGdYLTkxc1fYNwaDV4aGMpV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vS0ZhRNiHdzREJUYOgictaA/c8MgKFLdUDNSbVwyqBo=;
 b=HJV6zIaT+pZZS7NkPD1nMCuqxIBFVjbVkIuOd1BXbudu8C32ZiI7LFf+Ok7bKE0MzD2FvVmhrim+AddpgRVC0BzZKrqF5fsbfhNOWAobpGT3d+Kau3W6d8x/1bAnmMAwv2zyGriRNLOcv7YUknEhIG+5kLG7QhtR1yjofXGjmjDeYUlav36aVEpzyOcHYuNDy1sf5JET9NZKQ7CTMXDLEIY5mk8KXmTtAfJkoTk0DEcwQQzVCePu5+ReneKieMIAWdUsduexp8JWx9mzek2xNFA+3jDqilZROr2u967xfEIBHxoVsr8i1L6UtMRjyKrltzPz01eXI4KJ/FFOE2dZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vS0ZhRNiHdzREJUYOgictaA/c8MgKFLdUDNSbVwyqBo=;
 b=GlZy3rYk0qMKEBrLPeA4oHzyV480J8A02IobyKHt+qiTNctJipWLZeevZPvqfDJWOsBJ5lAxRWIDH7yX4olXMZcIaVSHjPmxMVnWbWljEmWJ3YdPeNITJhtGRQYw5cFbxir+j9THKHKwnK4RSDlOgQjC2TGkmk5hj6wzg3zDka4XNLt/5UUfas0Y3L1w/NK2X0IxWDKPsHDi/3pQcugX8bIEKIc0ULvYyXtuVk3uxiyGD85mwmQ1KRtfgH1cxxc7ALYSPGMOTnuijWUNxktxk36sxdL1JkuUlBd/etl/Vebh1qqJh5uCAx2tJrF5LRIPXEa9ST0nW61BvE2ANshs+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AS8PR04MB8818.eurprd04.prod.outlook.com
 (2603:10a6:20b:42d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Tue, 12 May
 2026 09:26:31 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 09:26:30 +0000
Message-ID: <e1bb04b0-025a-44a6-91ab-edfa6edc1f64@nxp.com>
Date: Tue, 12 May 2026 11:26:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: v4l2-isp: Add support for extensible
 statistics
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <777ea8b5-b00a-40e0-b649-59324ff0188a@nxp.com>
Content-Language: fr
In-Reply-To: <777ea8b5-b00a-40e0-b649-59324ff0188a@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0319.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::17) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AS8PR04MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 56ada599-7be2-47fa-f857-08deb0088d06
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|13003099007|56012099003|11063799003|22082099003|18002099003|4133799003;
X-Microsoft-Antispam-Message-Info:
 BEiCg6fLzefJ6ZQ7L1IgC8Q/73mphcuLmQcrP6o4HwpTSwFEcaZ3288+tId8uKnT7rpO/GrKHtRH7A9jOQ+lcITnBxpednyx0UxooymoY+M2HWPJLrW+UAdnHzFv++p2Lzpc8vkepvPxIpxtZCp8wsbA9r0u3UjMVKy9jMjQl6ZnqRbRXyj6PXbD6ZlxrrEW1YF7UBTBA29V3vTze+1Uc0LpSEsiXFH68dM5xWtpfKUHuIySkysIL/u9bwYH3l0lpmDDkURYtw7uvaNmvJZpnGNiM4M+N74kakbdl//ToYyqOvq2cIeNz3PJiQ4FxglVl4+XHtUGqxULb5PIGq4u6d9yYDf2Fa9BzW5T8Y0QcooeLtXZ/TrnJAHsi9WRzqsVQ0f3wYSmiEjLE0l1yLQvLk4O2TEwRcZ+1NOfImlAqcq2eO9I/mdUIByETTjE7enGg6VPXCO6BfXqg6rWn6C/HhsliAP4pmPncmFSp99Tx6IdcNN3BHlp8jZPxsNsX3Ahkdtj0iPyLcl7QT6iEXB3124tzRHah+CBYAk5OJ9DjlXnqJqKWGBFAhrtIeTVOgfxstNzy8ZjZlYqVoKq90MGBo9p91wZnNrWUwekELmx5gDbzGyGkB4uODuF8PoBhb9nONNuqbiApqGSko4PSsR6cA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(13003099007)(56012099003)(11063799003)(22082099003)(18002099003)(4133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a1pYZ3FmdjdIeUZ5NlJ0N01oQWw3MkxOVEEyS0xFbzRlN3JrTzBIMHM0WnVx?=
 =?utf-8?B?cUxiWmJTOFB0dWltZDJ4YkM1RlhjUXh3ejIrdXMxSSt3bzJJZGZOWnJBT1M0?=
 =?utf-8?B?d01nYzZMK3B1WGV6SUc4TURwc0lLeDg3OEZnM1hkdHUxYlc1K3MwcktPRzVF?=
 =?utf-8?B?cnhWU0RRVlFiaGt3QmdjOEszYTdURWExMGVPVm4yakM0ellJVlphNDJpSmtm?=
 =?utf-8?B?dU5ST25Rc0UybWhlSTBJbk94ZVFORUpTRTA5K0h5bHZCUlJUa1VmR1d2Y2tO?=
 =?utf-8?B?SENDZVpWR05UUERCRHZUWCs2NzJOOTYrVFFWZjNQUzR2Yk1JakdiK2gzbDhQ?=
 =?utf-8?B?OTJNQzFZcXFvZ05UTSsydnRlN1FwYjBaKzYyTm5wSVBIRUpLUTlCOUlHTEVq?=
 =?utf-8?B?aEdtOUx0ZlorR0ZOQ05YamtocnJPSHpEVkZ5Y21zcExyTWs0TFhvOUVPMWN3?=
 =?utf-8?B?cEg3K2RWOUhUcnNxUEJZREVXTEV6ZC92dk5mN0hoT0xoRkhFUXByU1VDRi82?=
 =?utf-8?B?c3R1by9sc2NQcytCSWxKdVU1d29NdVNkNVF5bG1zaUUzSytLZTBoRmFBYldG?=
 =?utf-8?B?K3k5N3NMbEZwYUNPQUJpVGcrcmlhSlRNNWhsWlZqMXdKdHQvTTYwbzVqeitQ?=
 =?utf-8?B?S1g3eWFQUzNkNjNOR2QwT1BIaDdVTlllT0xUOTYvaVdqcVg5L3R1L2dVNG9r?=
 =?utf-8?B?Z2MrTm5yL1NhRzVPK1MrOXozVzg3MHo4ZHRnakhmQjR5VHhmTTEzaXJIeUUr?=
 =?utf-8?B?RHY5OGlpM1I0ak5sNVJiTWh6a25BRlNTTnVodmlpUlpNZVQ1UWZjWFNHZi9p?=
 =?utf-8?B?RDYyamhlcmRxZHl2TTZkeVFTTUdnN2F3UVluT2wydUR1dkhTYXNRc1dycGZM?=
 =?utf-8?B?YnJxeXVSUy9FV1RkdW5KSGF0aWtiRVoxZzZBQ2dRRDBQOHZmdTAyVnhqN1Ru?=
 =?utf-8?B?ZklacnZuSWpNbWFrdWxRNDdqTUFIbWcwemFSMW9yRE5CbEk5dTZMRUVhTFky?=
 =?utf-8?B?RjFzc3FkbVYycmdlWWxUWUVSSUEzbzZ6RHNjdEFhRVJhVU9OZGZCaUVDcEdZ?=
 =?utf-8?B?WncxRWpvdkN3b2NRL29meTRlUGRWRnppaXg2Q0tYVU1KV1grMDVpTFpiWEgw?=
 =?utf-8?B?UE5XM3EzZjJLdWQwRjk2T2NOQzVEQWF5NFk0Ukhyb01kdDZIZ2VGUlRLN3Bw?=
 =?utf-8?B?NlRsSkM2UU9zQ0oybktnSy9FaE43TFNkUzcxYTFBWHR4Nnh2NW5zdkdaYmhR?=
 =?utf-8?B?ekxjOFR3RWdDYnNjYVFTQWh4ak5zaHlxTm9sLzJqSUxFYmF1ZktvTzNITGhM?=
 =?utf-8?B?Y3dUei92TWlSeWhRWFRLbUVJaDNUQitRQVdXK0dodUdhYy9kSEg1UTZRWXY5?=
 =?utf-8?B?TDRvUlFHR29OSG9hVXJLVk8wTVNzdlBWcTZ4bGJPb0VBTWs0UUtMRFZCYW1j?=
 =?utf-8?B?RCtaSDE5Q2xpZjBjbloxT2FRQktZelNoYlVyTTlyajFMalM1VzFLVEFsT2NQ?=
 =?utf-8?B?Z3poQzJUeGdRbGtxRHBlaW80ZmlBZDJycGN5OTBYZGhRa2Q3aFVpb25XSW02?=
 =?utf-8?B?VEd4SXVncXJqUnh2cEhIVWZZbHJ1U05VZFdQNlFibzNONjBaMHFnekluNXFB?=
 =?utf-8?B?MERQdUROVVBnRkdJYVlveU42TnlBWFFvV3BDK0ZVZ002blZuWEJLVGxYS0JK?=
 =?utf-8?B?N1lqUTJqbmFYM0QzYVAwQnZKK0JmbXhLNUVuT2tTcmxDY2hGOVNmUytsTjZ2?=
 =?utf-8?B?czJDK1NBOGhWazZHUVFYMU9oVkVFU1NXbTY3dE9QMzBkeW9vblhNK3psbHln?=
 =?utf-8?B?R0FQNFhXbG5aUkhybUlubmgzQXlVck5hWmRtTC9JZ3VnQXlYU3FHNmc2ZmdZ?=
 =?utf-8?B?L0NjZ2dsbm9Xa20xTFB2QmlYZ1h6eFFhWWt5QnF3Y2pzZDRDckYvSUdMZnRs?=
 =?utf-8?B?QW1kM2czYjhZRy9MQ0VGbC8rMTA2ZlNnblVTd3dXZmVhN2xUcVFOZk9jTXFa?=
 =?utf-8?B?am4yTndSMVM2VzRGdVF1TWwrUDZMY0t4dGRXRWVEbHd0d0g2S3ovU21ZaVhw?=
 =?utf-8?B?NWtpaDBKTkhRV3RjMlN3TGRxQ2hsejFDS3RVT3ZFd3gzZk1WekxXQVBoY25o?=
 =?utf-8?B?QUx1QS9kakJYUHZTZ0pSbnArcEJkeTFBSFVKYzJFcEcxMDNTQlpHbjZFeHJn?=
 =?utf-8?B?S2o0b3d3bThkUjFZTHpoS1hlcXhFbWNQZWpyUXRYejlacVpwNmV2aUhvQkFz?=
 =?utf-8?B?MFlUUzJRYWZTUXA2S3BjWGhxYVNGTnF4enN4NjhPZ1lOckE3eG5FNU15VGcv?=
 =?utf-8?B?bzNjekd6RmtIVTNxWHpTMTRzVXNkNGRLYTEzNHg5Y0hrSlAyS3FOUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56ada599-7be2-47fa-f857-08deb0088d06
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 09:26:30.7007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvLxpmujrBITN9UxANImObq25CTiAMDxzM811shop7Gx8rpxVdG5emGWKqKaAESfR3t/jVIgsbehe39TDVM0Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8818
X-Rspamd-Queue-Id: 32E2B51DB76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-61236-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,outlook.com:url,nxp.com:mid,nxp.com:dkim,ideasonboard.com:email]
X-Rspamd-Action: no action

Le 05/05/2026 à 18:49, Antoine Bouyer a écrit :
> On 5/5/26 4:12 PM, Jacopo Mondi wrote:
>>
>>
>> This series breaks out from Antonie's
>> https://eur01.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux- 
>> media%2Flist%2F%3Fseries%3D24043&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605732002%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=FXaz7QYQvS3s%2B4l9AFMrGgE7kmXlEil%2FKD6DibB0%2FJY%3D&reserved=0
>> the extensible stats support and adds a few more patches on top to:
>>
>> - add support for per-block validation as suggested during the review of
>>    Ricardo's
>>    https://eur01.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux- 
>> media%2Fpatch%2F20260504-smatch-7-1-v3-6- 
>> fda125c30058%40chromium.org%2F&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605751612%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=AiRH8MhIbXt3dr%2B2r3I6STE6TJAChylnH%2Fz3tLdS36k%3D&reserved=0
>>
>> - add two helper functions to v4l2-isp to ease handling of extensible
>>    statistics for drivers. An early user, based on a preliminary version
>>    of the patches is available here as a reference:
>>    https://eur01.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux- 
>> media%2Flist%2F%3Fseries%3D24703&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605763086%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2Fpsb7Z3lb8ingDILxc3LoEWKTojl5BGMbk6FiR%2FcO9I%3D&reserved=0
>>
>> Antonie: I took the liberty to fold in your patches changes to address
>> my comments on your v1. I pushed an un-squased version of the patches
>> here:
>> https://eur01.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Fgitlab.freedesktop.org%2Flinux- 
>> media%2Fusers%2Fjmondi%2F-%2Ftree%2Fb4%2Fextensible-stats- 
>> unsquashed&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605775020%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=iF2BE0GZ8HcVPmOJDhbmLsXQDOXV9JvqfMK6DRPPvrg%3D&reserved=0
>> so you can easily get the diff from this and your version. Please feel
>> free to comment on these as you're the original author.
> 
> Hi Jacopo
> 
> Thanks for the rework and the links. I'm fine with your [SQUASH] commits.
> 
> If there are no other comments, I assume I can reuse the common patches 
> in my v2 then, and also apply the new helpers to neoisp driver changes. 
> They look very useful (especially to prevent out-of-bounds crashes I 
> observed when data_size was not set before filling stats :( ). I'll 
> check in your user example.
> 
> BR
> Antoine

Hi Jacopo

Do you think it would make sense to create a new generic V4L2_META_FMT 
too ? which can be used by all user of v4l2-isp extensible params a/o 
stats. To avoid each driver creating its own meta fmt with same purpose.

Or do you think it could have side effects ?

BR
Antoine

> 
>>
>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> ---
>> Antoine Bouyer (2):
>>        media: uapi: v4l2-isp: Add extensible statistics
>>        media: Documentation: uapi: Update V4L2 ISP for extensible stats
>>
>> Jacopo Mondi (4):
>>        media: v4l2-isp: Rename v4l2_isp_params_buffer_size
>>        media: v4l2-isp: Add per-block validation callback
>>        media: amlogic-c3: Implement per-block validation
>>        media: v4l2-isp: Add helpers for stats buffer
>>
>>   Documentation/userspace-api/media/v4l/v4l2-isp.rst |  45 ++++++--
>>   .../media/platform/amlogic/c3/isp/c3-isp-params.c  |  42 ++++++-
>>   .../media/platform/arm/mali-c55/mali-c55-params.c  |  12 +-
>>   drivers/media/v4l2-core/v4l2-isp.c                 |  56 +++++++++
>>   include/media/v4l2-isp.h                           |  94 +++++++++++ 
>> ++---
>>   include/uapi/linux/media/v4l2-isp.h                | 125 +++++++++++ 
>> ++--------
>>   6 files changed, 294 insertions(+), 80 deletions(-)
>> ---
>> base-commit: d9c8c4adf23d17549c0ec9c85b99d85a0ee6cf18
>> change-id: 20260504-extensible-stats-f2d6befcc1ce
>>
>> Best regards,
>> -- 
>> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>
> 


