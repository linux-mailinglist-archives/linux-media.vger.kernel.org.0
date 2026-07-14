Return-Path: <linux-media+bounces-67535-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qR/EOqXLVWoGtgAAu9opvQ
	(envelope-from <linux-media+bounces-67535-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 07:39:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87902751396
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 07:39:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=windriver.com header.s=PPS06212021 header.b=dkpLJbgt;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67535-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67535-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=windriver.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23C7730434EB
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 05:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C011349AE0;
	Tue, 14 Jul 2026 05:39:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5F3348C68;
	Tue, 14 Jul 2026 05:39:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007566; cv=fail; b=FQjSRGa7Ib1O6T94MfFoPDQjCVP3qU758OMFA2ns17+cGt7RkQhyK9RM0Dxz9sXEO9vW6ZHXmpMN+iTYxzWUxVg8nMD9oUQGqgI5nHAKXMpqKuy+ApedLzbEldRrjcOP1hSVhibIniVootycDYIFsDRHup+00WNWON0rRy5eYXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007566; c=relaxed/simple;
	bh=mDBbMdJJMCvtShUFUfHDGRDDl7e8UTsey4tLuT23Fd0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m+GAKWS830nDIXGybDHzr0+P+p4dZiV0vJJ1csrF7VSlV9/9GOJDDDJ1vCoiC7KAnrB+K6pti/kqgvlVeKaXoW2mpIvo+5N2Vk/bHRQQ6JTBcmSZGl/DQoTPYCocNHBJR16rmr8JYE+2wzkTLy5Cx5AuqtxGyHJxkQHnB4N2qa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=dkpLJbgt; arc=fail smtp.client-ip=205.220.166.238
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E4jY351226012;
	Mon, 13 Jul 2026 22:39:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ytuhS22cF+H5ve9faQgaPittdOfvePEdXhskFeUU2Vs=; b=
	dkpLJbgtuGHVUIxSZ0PPAiRDF0jYZlLjkg1mFQT+GQBi9/Mcll5kEMFZdOeuAYmS
	dCSqbz5exgOLTc4xREQxn/JZ4AIvoXbDiHx28PcElcL8HLRyoc6Pp2IN5FMXlqkq
	NbZE1p1uXwLf5V0LfwmNokI1LtVu9RrhNKdCSziEBwMlLtV+uY0MkVrcIEWzMRXx
	KCrnWY+fJqOnfLoISHRwC+CK0VkAOrzLgO3THUrdZvqZE9zf8jJV7+QUXJx6Fjd3
	AOA1lK/B22PTfDYmZLCq2ad3c+92QfkK85QLglxu5hjWL2+N4B+BaCRMrO4avm0O
	ndR0ReBLkXv1donf+JSvCw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbh40ugy8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 22:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sK52sgxEvjJzKT+uCkr49/UBD45jkwmfWsSv8/QxtFismnBt9t9o8+cTf14w5yhzCDZmY16gsRy9h4q3afjtjXJdXNysYzur6ZIZwkmQx2Vv7ADfsbswDxw0/B3Gm0smFyq8bJ1PKPZ9ysIW+znRx+TgcMcKPbvX+C55fNitsKthuMWoZSukd2dwVKVCs329Gdugsz26N9xutkr7UPmJYDXGwRYCJev0KIzEiPqXDD2bi/rL30NWH66S7WuQY1LwgXzCVwsyLNH3tb+XzX1zCwMjEcGTaySf5yts1gKRYEqN9lRl/Q+E9BdtNcapvP4BKvfJ+iy/noYi2fj+aL+oaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytuhS22cF+H5ve9faQgaPittdOfvePEdXhskFeUU2Vs=;
 b=yRmPwwef/IPyVtxSUjwXqTgDUtOB35PcnpNWrjb8pmOzEHfXaBcKWnIV2oyvfz888uybCTMWxaj3B1WfAItABnBHCHXKdy5CPx9UX3qT47yo39DNAngIpbV4Cgb//rwQdxe76nRc6RbdzvV6eCauwRn9GicJpJjzD4m+sty2LbxoA9K5x4n0txNQfYjWNxA2lq0DTEBVFJINPFp3CO/AcFcreB4W77/axxMXNMGZSJkwSe4Z8TL9Hxq2CWRsfv+/YV+giDWhevdLKlNfdgXNI3OTWRbUjB3I9pa5+ZvX3LHMn0ky3IieahG2yjkhKiCsY0B9MJJ9TgiOoJ4EMjNVZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by IA4PR11MB8962.namprd11.prod.outlook.com (2603:10b6:208:565::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 05:39:08 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13%6]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 05:39:07 +0000
Message-ID: <1c0aa133-b44b-4cca-91cd-82a80769b494@windriver.com>
Date: Tue, 14 Jul 2026 13:39:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: dvb-core: fix use-after-free in
 dvb_frontend_open()
To: mchehab@kernel.org, kees@kernel.org, linma@zju.edu.cn
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        yun.zhou@windriver.com
References: <20260610083055.3976083-1-yun.zhou@windriver.com>
Content-Language: en-US
From: "Zhou, Yun" <yun.zhou@windriver.com>
In-Reply-To: <20260610083055.3976083-1-yun.zhou@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY6P301CA0018.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::19) To CH0PR11MB5332.namprd11.prod.outlook.com
 (2603:10b6:610:bf::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|IA4PR11MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 1396c7d6-ac6f-4926-0f80-08dee16a391d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|6133799003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	aZYkiTcRewiCUpihSSSOK54UEXuRwjXitC5gPN14VKyaLcZPNZeHcUuZniF4ev8DPb11YVnF6gDC4QlQP/hKtfrE/Ok3BikXDPzDB4J56MnyfvybomswsxxgXOYD5Jc/pL7i4xWNpctJ5m0tHojy040U/z57MtSjjp0tsVOYDluaMwRdi9VF97eTYMJxSaAppvqjRZyalAYuMptuUUv5WhDAxuCitsZtUOrfhBYxpfO0aW3fj0T3t61zEH0TISO1cN5hbAt/DE4xnzVD6A6axctF/qZGYrUGUfK9T6QGDkVpEtt3iBpPGe+/H/moRlQVwNQYGtJaS6nEP4LuYeiGh1Utx+RJKYcpyZUDPqaWw106a40bNmLA8F3a0uqiCfvbtAnrzo8+vWwj3SbtjUMTIQOnyVJ3Gce7xRAilT7ep8iGS1N4gZduOcXoQ/7Zp4ZckBYoljuobYLpIrfAcoWCUwaAWGdM/cMNexatPbZkQdhrbOmaWjYTfMKzCox5jNFF3a0HGQqy4kdf1BO91nYwvQ6CZBwesV9BmnaCXk5RRST12N494AAeba88WxJdNgKTa/hcEvebvhqRyvSoWImMeZ4fnTzfbaQnii3+1/9zc85Toenw8Wr/+Q6FmQr3lGfN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5332.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(6133799003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emZKcU9zNkc2Tno5bVlTTHErRHhNRzZveEpmdmNFRG5lVnVjck9OejdiVmZp?=
 =?utf-8?B?S29wWWI1eG9NU09XRjN3dmwyaXAvb0NRNm5sVDdHODkyYWNyR3NmV3NZSWFJ?=
 =?utf-8?B?WGQxdG9PWXFGQ0l4alNjcmcxSWluUmxNRXcyOWVFT002b0V6aFdqcXc2VXdI?=
 =?utf-8?B?MUQwVWh2K1A1M1VRS240WGtWQVZISlVNN0RqMUFzdWJlUW9yV2NEdm9hUGti?=
 =?utf-8?B?U2RPSmF5WlNvWGhWRUdrSkhhZ28vSkRIZFZBQ1ZnYjNEWFU4cURkK3JxZklN?=
 =?utf-8?B?UkhTc3VreTh1SFRwNDlMRDhIUm94cTVpTW40d2ZteXBQaXNJSDd1VmQ1ck8z?=
 =?utf-8?B?Y3FNd2FuMW5teUlMZWN2ejZUY1dZMzMwNThwdWFzbUN3YUlGL3BEK1NXVGJx?=
 =?utf-8?B?S0V2ZG0waUdjcVBOVEpBYWExcmJYZk1GTWd6NGhlYVlwNCtwamlPM2ZCWDcw?=
 =?utf-8?B?NUkwQVNrWnlJN1Y3RDJvLzdqNnZ2eTNFZStid1pvN0xzVWhZWUFXN2NDeGd2?=
 =?utf-8?B?RFhicEJrZVlvWFN1WVBqbGRNSmdXN28vU2lsaDdsTC96SzZFOVFheUpPV0Yx?=
 =?utf-8?B?UTNySWhydzFVaXZ2cVJ0dGZHV2I5bVZKbWx2VlZUL0kzSEd4TTRUc1RqdzFa?=
 =?utf-8?B?bkNNam0wYzJ3elE0a1hxQmZhRFVjT25sZ2VyRnFYOFV6dzY2S0R4S0EwaEEw?=
 =?utf-8?B?R0l2cDhPakliQldDdWRxeWRmenhhT0QxZ3I3dzdWYkhpeFYvNVQyTzY3S2Vu?=
 =?utf-8?B?Y0hOMHBoMzE3QUpHR0VnemtiU3QxR3Y4UnBHdVJ2QlRHZEtVY21BM25CL0Jr?=
 =?utf-8?B?WWkvVWRDYndaWXorVWk3ejhIUnJ6eStBRzQvMkIxZ2s5bDdkeUM1Z29KendZ?=
 =?utf-8?B?QXR5TXQ2WFdMazZVOEdCWkxlNEIvQjBrQ2RMWjRUaU96WnVNb1hQWmxxVTdL?=
 =?utf-8?B?R3JBSUo2c2FkMVU5d0piOTRrWDQ2cGx2T2I5UXl5WkN1OGM3UXE3RktlTUNK?=
 =?utf-8?B?cDVNRUNGQ1Q3Tm1RbUlnRnd0VStLOWhRbnNWVno3cEgxQ2Y3YnpDRERONFFu?=
 =?utf-8?B?N2RkcGtmMDRTMm5rNWJZdGoxUG52V3AxTnE0QjdtbDlLSWRkbDFPbXdsc0R0?=
 =?utf-8?B?QUl2c1UveHZwS0R5aUJTVFpEQU5Ldkh3Q0VBUnpPSHFUazZpMmRFOG5YVjRa?=
 =?utf-8?B?OWZtUEUvR3ZSVFBzRU8yWldwcDEzK0xITGF6YXBNckVuaEhQZVNZUFJSU1RD?=
 =?utf-8?B?TDNFa3BBMEM1a0VzY0lIQTZCbmhrQllLVzI5em93THIyWFN0Nk0vZE1iMFdO?=
 =?utf-8?B?b0daWThKWk55OG1hb1ZMQ3JBSmxJanlqeG9vL292TG1LSXRzb3gvNjI1Z3Rx?=
 =?utf-8?B?dWlRNHZHeUM5Mnlza21lMURxWGRjL0tLK3FmSGY5bUt1VDlpM2hSUVdiWUhq?=
 =?utf-8?B?ckJzSXlnVG5UVTdKcitSVXlaOFZMdmtpN3JpSndTUWhPeHpjYTRRTmFOUUtz?=
 =?utf-8?B?K00zVU9iQ2xmK25ockszVnhuTFBiVW9VRTVEYjdrNlhoYlByaWx6MlhDQlFO?=
 =?utf-8?B?bFo3SDYvNXYzSXZoMlNPcXFkYmtCdkdOQ284QVdPNkRjeSsrSy9WUlc3Ujc1?=
 =?utf-8?B?cTEzZ3NQUjRYK1JNbkV4dUVXOXAySFJ5UkY2dWVPS3I3Qmxwb0JDRGhFajRw?=
 =?utf-8?B?c0dUNVcxRURXNFJyVS9POHREekRjb3hOQVZPSVdRa3dNd1FTZXh4L3MzTk9P?=
 =?utf-8?B?M2VscmNFOXVDTEdFd2tyM3IzNXRGQnJEbjd6bU1qanh5ZFZhUGw1UkV6ZEpD?=
 =?utf-8?B?L3lPWkRYNEN5QWg2NjhONGZZUExzOHVINjBxQ0JMb1JHSjQyNFMvaFZ5cXRp?=
 =?utf-8?B?MDhkRFFPNC9ROTBHd0NNcU0vMWJCUzFLM1hsaTFETTJZbGkrdlBxRmsxTkRU?=
 =?utf-8?B?eHhRTE5temJhMXJYQUd4d0UxMjcwSVBFZTVhaVB1bTd0QkQ5dlh5SG4wVlBa?=
 =?utf-8?B?dG1wdGZUeDg2dkprbEVoVm02Vk9wWDVPOGVkcUxCaFBudlVNMnJXSlRPYTNC?=
 =?utf-8?B?TS9UU1Z3cGNYKzZyMEFLZzdBT09mby9HOXZ4aWU0WFBRYUxUR0RnZWxkNzVW?=
 =?utf-8?B?RW41MlhOeTlHZi9JSUNjdUJpaFlSZ0poN2FKbVBrRVVPRHhCUklvSXg5MFZC?=
 =?utf-8?B?UUlYeEsxWGhOVFIxUzhjc3ljNm9tTHhLQVRuM1orYWsxTmE5aDRWK3c2ckY3?=
 =?utf-8?B?Y0xHZ25RSkd1ZWcyWXhXbDVZS1ZSais2cGk3TFlLOU02azFmK243cGZuZW1S?=
 =?utf-8?B?amgxL1FmeHJOTVRvMUdxODJFT3BTMlMvaUFRY21mV3NQVU1ZUDhpUT09?=
X-Exchange-RoutingPolicyChecked:
	RIrXX2ni/oO87CBiRe5qPGE03fNp3pJWyEA9DZNuZLHKSF+7BwNnnYKzFu4wP43oq3Zmyl/JMKmGVbefzITHFOWrztcYZTVa/rSFB+o/ULNDLPVSGa3oEIfT9Irn5vgrdWwSJywayFVdgEeNEIylfpMTGKpnsaVrW3fc7unPsnW1ZlYf/hj6Gbqna2p5uYvWN87aphdEfTIWol30+W9Rw9lLOlvv/SoDckvpeKOBa2s2hWPSwQAxQ3MyyTHkpkJMawXAZsRfb4HJR6FsixuKs5gbXPofJW3PjpIf2C2SOQZl1KGHEi6yimTqfC5q1eWj6AjO1nffqJ4pM3VlEjU72g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1396c7d6-ac6f-4926-0f80-08dee16a391d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 05:39:07.7389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MY1W5fYTPJV7iwoV8sZEUnaZw1223Nxe2rhdrfc/t+1PuzVg7TFOQyUv0F+tNU6eO/3XjNxgPinbv1sDVbPpSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8962
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1NiBTYWx0ZWRfX/fRziH50Tz+k
 5tqeRLxav653kJ5qC7vNe6MgzVHDQxO3CG8Z3C/a9gvA4C8KOBgRvqYb0J3ELpzQdyyQCQMDdQi
 hYBVAF59PYW0EEseCI+4ZOgzbLLeT99bBSZo6jYmSyYWhU4bd9FRaSD9nI/ZwzR58blGe8vzpcc
 2nYx1vtLQixHJ7XowH4EMNSFhCcFovlCCikAKQ29Lsln348rY9mWjDt3IJfryWeJjMCLyE7xZ4R
 Eww7jC+Z5WWWIbNfiZxPmEvh9jGmhKonlQL4M+CGc/bOJgDdW+tnhS1v+og9ntLfgpFd4rr57/i
 tczBjr0NU8ssznBkP2J0X01/gMpoR6jBGneeVTfOsMX2wfQP85vzaMTXZ13llOfoUSwGFzyi9uk
 Eijr0mU6Y3nSH614Oa1zcdexy6hFS1y9HhutPtoeIUDvgnAWIwn6gAy6rI8ODtcZkXXhPcwfCZp
 eSSyjUkxAw5gSdgqFIA==
X-Proofpoint-ORIG-GUID: QBZZ3NzuB99N66jMSVDwND61X1fOKiXU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1NiBTYWx0ZWRfX/neD11RVolE/
 unXOE7Tmo1lOmDCxzzp+NxH7Fnq3y2hGGGgtRyn4XeFu/ve5HO4+7jrHvHuRnZLMQTMR5ezz/xG
 H1LoZVvMv9+j84tamCQkq5Rl9LKA8OQoHEFbq6jmSwn3J8Fx4ueo
X-Authority-Analysis: v=2.4 cv=JbGMa0KV c=1 sm=1 tr=0 ts=6a55cb7f cx=c_pps
 a=M48x8qJemVpu2SzQJjJwbA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=6GENO9LqX87v1q-aSr0A:9 a=QEXdDO2ut3YA:10 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QBZZ3NzuB99N66jMSVDwND61X1fOKiXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140056
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67535-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,windriver.com:from_mime,windriver.com:mid,windriver.com:email,windriver.com:dkim,syzkaller.appspot.com:url,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:kees@kernel.org,m:linma@zju.edu.cn,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:yun.zhou@windriver.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87902751396

Friendly ping

On 6/10/26 16:30, Yun Zhou wrote:
> dvb_frontend_open() calls dvb_generic_release() in its error path after
> dvb_generic_open() succeeds. dvb_generic_release() drops the device
> reference via dvb_device_put(), and then dvb_device_open() drops it again
> in its error handling, causing a use-after-free and refcount underflow.
> 
> Fix this by incrementing the refcount before dvb_generic_release() in the
> error path, so that the put inside dvb_generic_release() is balanced and
> dvb_device_open() remains the sole effective put on open failure.
> 
> Reported-by: syzbot+40339ea82afa8184ad5d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=40339ea82afa8184ad5d
> Cc: stable@vger.kernel.org
> Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
> Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
> ---
> v3:
>   - Simplify fix: increment refcount before dvb_generic_release() instead
>     of introducing __dvb_generic_release()
> 
> v2:
>   - Fix Fixes tag commit title
>   - Add Closes: link after Reported-by
>   - Cc stable@vger.kernel.org
> 
>   drivers/media/dvb-core/dvb_frontend.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> index d082b6c57c76..608525d08277 100644
> --- a/drivers/media/dvb-core/dvb_frontend.c
> +++ b/drivers/media/dvb-core/dvb_frontend.c
> @@ -2887,6 +2887,7 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
>   	mutex_unlock(&fe->dvb->mdev_lock);
>   err2:
>   #endif
> +	dvb_device_get(dvbdev);
>   	dvb_generic_release(inode, file);
>   err1:
>   	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)


