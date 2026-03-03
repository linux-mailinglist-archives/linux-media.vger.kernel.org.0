Return-Path: <linux-media+bounces-54407-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yWn1DoZtp2ndhQAAu9opvQ
	(envelope-from <linux-media+bounces-54407-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 00:23:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D711F8531
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 00:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4E90303EC9D
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 23:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C378333F377;
	Tue,  3 Mar 2026 23:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WwL3rMq2"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011062.outbound.protection.outlook.com [52.101.52.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA431B114;
	Tue,  3 Mar 2026 23:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772580226; cv=fail; b=fV5+v8ybXw3gnDijiaNztk0lkVL/JcAyC64geXf4IB6uPLV8KTvziQGM8Svy9HWM5CQHsNourHOZYnuKMus1FM9JjKbQE7pI/UATYXK2bJFY3MAW6ThGTeFo7/9CK8a842//Vyi6UZkzfsth/gO+8PjXKvPCID4V3tavfBLZ0xY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772580226; c=relaxed/simple;
	bh=QJOGZBoFksqo5sxsssKZisUvuWBs6t7VUn0wGE/no5g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S6mO949V9uebmJXfpxaq+b+t+9wabuylv3GUKPScoTs4GuLcoiuUkEabIPq93xRlIpxihaOY/3GJo4lFBbhY0bv5I44DbTyj/bfUaAs6QkvLxTQcWx0L2iOVy3eWJj+sg1/OGAVU32oQf6iae9r9ZTtWcDC6ozFrfAI/t8D67qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WwL3rMq2; arc=fail smtp.client-ip=52.101.52.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehVw2sFoxg4r/v3KM0GodhUFSkcatz2N972HnMNameywJ8aTFzG9bpPGBee5I92HZX1Fg03PYIBzmTJes+vmmPLpijLPy/NGQjUMjM3ng8cGIIiy8KtwqMwbieu5XywlJ9gVPIp7JIBPu7+DzlkHSt8zEFB+FGThR6qbVuTn2f6usjohjccY28g1sLbcu0IzR5Ik8iqZ5rTEP9z8mR/EPoz4te8dSDAi4XXzkjPzjpnt4gDJFwlTa3q0nXA/ltMRb32+aDTfu3qEF7jeAVYdHcT5djX0gVBJkw4TgszyEeBGgfcUKkVWdZlwzsN6LkRBSd+xCzcGv3DQ/JSWDAXQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2OgBm4sklGTa3Cmh1XnKcwhiL+iMx4IWUdoUYZaZb8=;
 b=wqayIohLnHG1MdiSouQ/oTX+PW3ZUr1/YQew5KmyZZruJcmN+wcl7dBq/6/v4t/YLNg3NVTDOpcropY3PzaugdTyZYzF+CRHTi5ijXsYv9JcTO/sixUD1r5j5XeDoPhB1T/q2Vpne2mbg0xyqbdKVI8FAcxOqU0X3yY6LllfFiAjKHPmdjgP7fyoXJ4q5nz0xrSbG3DTwXMD8CYUr205FZeiZXz0qjOWVxqvwdOIJeN/OgXHdSmBkz4Fehzvbdq4HEhiOTWrb4ETsZNNk4ouDMywzMNmObz2soVH0BXiAsq64ZK7Rew9wVMliv5dKZFsDfm87DlvpYxgg+wCFsk8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2OgBm4sklGTa3Cmh1XnKcwhiL+iMx4IWUdoUYZaZb8=;
 b=WwL3rMq2wpmwbiBwrzBWSNxnwv3/jbkmFW/fpTGF0niObD8CTDejYSkQEUXQpb4aXfiNCxkDub9GR4QkbCB7aRejvlGRYD+I60DYY7jgw0BL2IFx7Ony7dq4Zp88ENngcYq5S197MJONqUoqpbBLPY8tbQ6rrIJTbCec8/S/7Po=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB9501.namprd12.prod.outlook.com (2603:10b6:8:250::17)
 by MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 23:23:41 +0000
Received: from DS7PR12MB9501.namprd12.prod.outlook.com
 ([fe80::4564:457c:524b:6b96]) by DS7PR12MB9501.namprd12.prod.outlook.com
 ([fe80::4564:457c:524b:6b96%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 23:23:40 +0000
Message-ID: <bb892e59-8fc9-4d1b-94aa-996a66392405@amd.com>
Date: Tue, 3 Mar 2026 18:23:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: amd: isp4: add system suspend/resume support
Content-Language: en-GB
To: Mario Limonciello <mario.limonciello@amd.com>,
 Kinn Coelho Juliao <kinncj@gmail.com>, linux-media@vger.kernel.org
Cc: Bin.Du@amd.com, pratap.nirujogi@amd.com, sultan@kerneltoast.com,
 linux-kernel@vger.kernel.org
References: <20260302073020.148277-1-Bin.Du@amd.com>
 <20260303224433.87242-1-kinncj@gmail.com>
 <41a26229-821c-4535-bfe7-1901d0968371@amd.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <41a26229-821c-4535-bfe7-1901d0968371@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0286.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::15) To DS7PR12MB9501.namprd12.prod.outlook.com
 (2603:10b6:8:250::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9501:EE_|MN0PR12MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: efeb83cd-5ab1-4bda-8b68-08de797be75b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	ptaOelqQ9ZjSW51Ubyh19OHIKwNmTQ1IHgbri2QDgrYd8Pdw2eSQ7xsVWERgZckA97uUT6B9jq+kjoj32vATS7r4il8mxZIWx08ZUDtGOHWrWs8Em3ExFSMxBg6wZqJs5SvLDuLYWBmvjWkYEfEA8BJEzzCyUFiIUkprbn6n74e9/+laNbnPlg6lAZKoogrH89fsFGeQZmYNqQ1io2z7PddMILtwZ/0U3/b0c4KM8A/VPZq9p96OlrK9nfRdmzgQha3VpGkFeCpnfaoVDs4lSzJC5f8VujPFnFu4ckIUeg6QZXyGdUlYXNBCf7Ny+cQiTmKuH6tX2eth3VVjTmGNEfvPgXfGkZRB9H3BzKKTMe5TwB8pYJsCVgJQx3TF8LfhhmGkZrREpM7k3WntD3hxh3a9JxOmZZOcgFrw+nd6pUbTYDpFJNfq9NvAgKAyF/jXDscz8B52bmUf8N0o4sQO49NTth9IOZ7LuA2T+pTKQ1HYiRZ4gH/zfUK6AyuaCwQmopFM5C7aIajKizxueHm5uarx9Gv++r8YrpuzqRwhBFNjMID960CjsJ0INgQUjXYCHgXxEaY5dkqlOnpOxyPVJSWN7kWRKffaICRgtztqK9bNsP2h1dMVJHK3COWzEelVWveIE19OhhilB+7Kuv848uIajvqTdr6tlkjJLBVYUaFFz6iLY96UA4CK8612P/YlQImU8AkUiThm9JQXmbUxRMHa2yLN1pQCjTjsUm/MVWg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9501.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ay9CdEQwTDlNaUVmL0o2Z3RlaTJjY1EzTXg3Yk1nd1plajBja3hEZGdPZmZ0?=
 =?utf-8?B?aUhINzI1T2NCTmdrMWhJL2NXN2MwdlpoTjRjK29rNlZQcm10OGVCUGQxVXA2?=
 =?utf-8?B?cnZleEhQOHRtMmVvbDNWM08xeWVzTFlJanV1Si8wT1FYU0RBcEo5UkF3c3A2?=
 =?utf-8?B?bUZqa2tQWjE0Q2dMdzBQRysvQWJzRmtDWE90WTczdEIweWJZQzQvdlpNb2xE?=
 =?utf-8?B?Z3JTbVZaT3YxYzVIeHpWWFJ2aEZWaXFsTUc3cHdIR0VXMUNIaXJQVTNXbFE0?=
 =?utf-8?B?RXp3YndPWlYrK1RIayt0cEpXT3RIdkRDZWlkVkdqMWRicjV4UDZSQzI5Y0x0?=
 =?utf-8?B?d0o2SUp6SjI5S2NyWVNpZklyNm1xS1o1OHVXdUxxdVh1bFBrVE1Hb2ZraVRF?=
 =?utf-8?B?M3dqVUFuVWVEcUFibTJEWlhRNVIwWi9IbzBsR2Z5bS96dFNZMGdZbFVDbFdQ?=
 =?utf-8?B?bkxlY3VGT3NUNTVTT0ZHZTVnS1VsYlJYNEVwV09XYzFoUWJzdHlDV2N0MnJh?=
 =?utf-8?B?SjQyeFhWS3lqeWJ4dTRoTkUrcTB6cjB2S3JxZStnSlozVk5MVDc1bHhZRE5L?=
 =?utf-8?B?bS9mclFyZUprb1M0MHJDSENjYzdJYWJzNW5MeCtSWXVxd205RVBYZWkxd2ZM?=
 =?utf-8?B?U3ZaL2RBV0xzcTVwTU5GLzExa1RqaHdvTlN3cGVHNEtYendmekh1L3hWV1hW?=
 =?utf-8?B?WlJGK3c0dWtiK2ZDQUZTNzRmc0ozYVFJS1BSSUk5VnNJdDNJQkRhbmpOVUcv?=
 =?utf-8?B?RjNTMy9iK2V1eXZuVUZ3T2dsbXVyazhhUzhFYURiVmgycURoTEl1ZlVHY01i?=
 =?utf-8?B?cW50YWM3Yzd0eWU1aUhXSEtKTTFTT0pYT29LL1dJUW1HWFhEaklsekg1RVZj?=
 =?utf-8?B?WTlTcHpScWp4MEdhUVNnNkJzYnZMYis3MjZHM0RoUXZCM1J6c01lNmU4ejUr?=
 =?utf-8?B?VFdyb1ZFbnZiNVVoRGJFZlZHdFR2YWxoeEVYZVJDZ0ZKMmRPRnRVNFRTQktT?=
 =?utf-8?B?SGpocUF4ZllScWZFREU3WjcvSVl5S2RCbE5uOHpOMlY5ZWJ3RXBZS3BESnkz?=
 =?utf-8?B?R1lMZVBsMHRJZnRHekxqNVRqRmV5aUFNOG9qN3JueFlZN1ZYcmZXYzJIM0pF?=
 =?utf-8?B?OHFrVkM5aXpXcW1ocDgvUy95YUVQckhucjJKb2sxSGZhQTBmeklwbGZnWmU5?=
 =?utf-8?B?RGZQaCtubGpKbFdwcmFKcjB5Si9ybG9ibklsdy8rMTJpc1o5c3k2dE1OS3JO?=
 =?utf-8?B?eXBVdmhmWXQ4d2RZY2k0eDVaZU5Vc1NlcG1kUFJlZGIvZUllMWdNMGQrekxj?=
 =?utf-8?B?YmlIKy9xbi9lV0tlN2tMVnIvRG8ra0xzODNnOXlRN1hzWXV5QkFBZ1VnSG9E?=
 =?utf-8?B?Q252MjM0NkFiVkFtaW5QZHNLenpGd09qZjhZMGdaR2hRMnI4ZHFNLy83YVkw?=
 =?utf-8?B?ckJ5N3VWMU5aMDk3a2NMUnl0b0hhdyt4cE9EbHFsdzB3akJYWW9xRVhWS2Ra?=
 =?utf-8?B?TzRja3RnWFZVOTVXbTZmODFtZVpDZzFtWkVxK3FuOC94TFdIaUp4eDk4TWlJ?=
 =?utf-8?B?Qzg5L3AwNTY0ZWd3RzRib3J2WlF5ZHFQWElNSGE3SXhlR2g1VjdNRGQ2QldB?=
 =?utf-8?B?QUFGK0hwTlVYQ0ZDRUlIQnFoZVhWUHdJMEN3cjNOVVZaSUo0ZmNIeVI5SzJG?=
 =?utf-8?B?Wi9BQndhcTZpbUpVSmJWaW43dVBlYWZkQW5vOWhwWGdyakp3dnpxVkUwUWU4?=
 =?utf-8?B?TGgyYmRMMzdET2pNTXd2cldMM212aFJhbXBYcUE1Rnl2MnZqblJkQXIwbENM?=
 =?utf-8?B?eFV4NWxKWjVmSCtEazlPQXJCbGtMUVB3c0dpUW5KN1NGenA4WEsxcnJVcnln?=
 =?utf-8?B?dllLVFhUd3lhVEloUlJVeVFPc3k0VklEQ2RNamdoZXE2N251djhkeXFISEg0?=
 =?utf-8?B?Z09LN2JTYWkrRzFXVS9ad3BWUE9wUFJiYmlTeXNFSHI4b2pFM0MwUlRNM0F6?=
 =?utf-8?B?Q09QU0dmbmdYRjgxSDREL1NnTmcwUUxaQlAxOUlYakRReW1pTTlERllhL244?=
 =?utf-8?B?ZGVNRHFLZzJydTY5cFlsSDFFWURtNXc4VEtvaWF6NlorWHBNbERlQTlSbjhs?=
 =?utf-8?B?MVN6MHlvdHBkSHM4VUlENEpFRnhPcXZKWXFJdVFnNnRaWVFnRHZLUVhmaHNu?=
 =?utf-8?B?aUlnQXVZZEQxTllGTWE4ejRvanQzbFZuakc5aCttdWZhUEtyd2tSb0FIRTB0?=
 =?utf-8?B?MHdpRUhPMHlIakUycVg3WnNVcUFQN1JWMlpKNzdFd0wxbzJnenE4OVM2QlBY?=
 =?utf-8?B?MXcwc0ROMVBQd0dRUVJ1cXZRZHQ0ek5iK3ZpUnRmcktQUFVOZG5UQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efeb83cd-5ab1-4bda-8b68-08de797be75b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9501.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:23:40.4377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swEf14QTjGYBeSrET605gsxiyihJ25oZ2Iec8z+2eYbCQcL8HaEnMvPWIIhNR9CuHjPRHMhqN7UkUQSDG+HiEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246
X-Rspamd-Queue-Id: C8D711F8531
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54407-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pnirujog@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action


On 3/3/2026 5:49 PM, Mario Limonciello wrote:
>
>
> On 3/3/2026 4:44 PM, Kinn Coelho Juliao wrote:
>> The ISP4 capture platform driver currently has no dev_pm_ops. When the
>> driver is loaded during a session, the ISP hardware is left in an active
>> state on s2idle suspend, causing the system to hang and requiring a hard
>> power-off.
>>
>> Add suspend and resume callbacks that properly tear down the ISP 
>> firmware
>> and hardware state before sleep via isp4sd_pwroff_and_deinit(). On
>> resume, the device is marked so that userspace re-opens the camera,
>> which triggers isp4sd_pwron_and_init() to reinitialize the hardware.
>>
>> Tested on HP ZBook Ultra G1a (AMD Ryzen AI MAX+ PRO 395, Strix Halo)
>> with CachyOS kernel 6.19.5 — multiple suspend/resume cycles with the
>> camera active before suspend complete successfully.
>>
>> Signed-off-by: Kinn Coelho Juliao <kinncj@gmail.com>
>
> I'm a bit surprised this is needed, I thought that we handled this 
> from amdgpu side of things.  Will let Pratap and Bin comment.

yes, this issue was addressed with this fix in AMDGPU available since 
v6.19-rc5 onwards.

https://github.com/torvalds/linux/commit/0288a345f19b2162546352161509bb24614729e1

ISP suspend/resume is managed as part of AMDGPU pm_runtime to ensure 
that the ISP is suspended before the AMDGPU device. This sequence is 
required because, in the AMD hardware architecture, the ISP is a child 
device of GFX, and all child devices are expected to suspend before the 
GFX device. If this sequence is not followed, warnings may occur when 
the ISP remains active and attempts to access AMDGPU resources while it 
is suspended.

Thanks,

Pratap


>
>> ---
>>   drivers/media/platform/amd/isp4/isp4.c | 48 ++++++++++++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4.h |  1 +
>>   2 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/media/platform/amd/isp4/isp4.c 
>> b/drivers/media/platform/amd/isp4/isp4.c
>> index bf6b8e2..3e2c3bc 100644
>> --- a/drivers/media/platform/amd/isp4/isp4.c
>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>> @@ -4,6 +4,7 @@
>>    */
>>     #include <linux/irq.h>
>> +#include <linux/pm.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/vmalloc.h>
>>   #include <media/v4l2-ioctl.h>
>> @@ -221,11 +222,58 @@ static void isp4_capture_remove(struct 
>> platform_device *pdev)
>>       media_device_cleanup(&isp_dev->mdev);
>>   }
>>   +static int isp4_capture_suspend(struct device *dev)
>> +{
>> +    struct isp4_device *isp_dev = dev_get_drvdata(dev);
>> +    struct isp4_subdev *isp_subdev;
>> +    struct isp4_interface *ispif;
>> +    int ret;
>> +
>> +    if (!isp_dev)
>> +        return 0;
>> +
>> +    isp_subdev = &isp_dev->isp_subdev;
>> +    ispif = &isp_subdev->ispif;
>> +
>> +    if (ispif->status == ISP4IF_STATUS_PWR_OFF)
>> +        return 0;
>> +
>> +    dev_info(dev, "tearing down fw and hw state for suspend\n");
>
> This is probably a bit too noisy for regular every day use.  I would 
> just exclude this message.
>
>> +
>> +    ret = isp4sd_pwroff_and_deinit(&isp_subdev->sdev);
>> +    if (ret)
>> +        dev_err(dev, "suspend teardown failed: %d\n", ret);
>> +
>> +    isp_dev->was_powered_before_suspend = true;
>> +
>> +    return 0;
>> +}
>> +
>> +static int isp4_capture_resume(struct device *dev)
>> +{
>> +    struct isp4_device *isp_dev = dev_get_drvdata(dev);
>> +
>> +    if (!isp_dev)
>> +        return 0;
>> +
>> +    if (isp_dev->was_powered_before_suspend) {
>> +        dev_info(dev, "ISP was active before suspend, camera must be 
>> reopened\n");
>
> This is probably a bit too noisy for regular every day use.  I would 
> just exclude this message.
>
>> + isp_dev->was_powered_before_suspend = false;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(isp4_capture_pm_ops,
>> +                isp4_capture_suspend,
>> +                isp4_capture_resume);
>> +
>>   static struct platform_driver isp4_capture_drv = {
>>       .probe = isp4_capture_probe,
>>       .remove = isp4_capture_remove,
>>       .driver = {
>>           .name = ISP4_DRV_NAME,
>> +        .pm = pm_sleep_ptr(&isp4_capture_pm_ops),
>>       }
>>   };
>>   diff --git a/drivers/media/platform/amd/isp4/isp4.h 
>> b/drivers/media/platform/amd/isp4/isp4.h
>> index 2db6683..f39be96 100644
>> --- a/drivers/media/platform/amd/isp4/isp4.h
>> +++ b/drivers/media/platform/amd/isp4/isp4.h
>> @@ -13,6 +13,7 @@ struct isp4_device {
>>       struct v4l2_device v4l2_dev;
>>       struct isp4_subdev isp_subdev;
>>       struct media_device mdev;
>> +    bool was_powered_before_suspend;
>>   };
>>     void isp4_intr_enable(struct isp4_subdev *isp_subdev, u32 index, 
>> bool enable);
>

