Return-Path: <linux-media+bounces-62551-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOQZIa7GD2qJPgYAu9opvQ
	(envelope-from <linux-media+bounces-62551-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 04:59:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E845AE34D
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 04:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 740973025D2E
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 02:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B834C311977;
	Fri, 22 May 2026 02:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="QFyjyRUp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC97F347C7;
	Fri, 22 May 2026 02:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779418677; cv=fail; b=dyqR42qema1b4tN4/32OajNvUHX6ip9qfu/Kd1zH5enYY9+2pMatjjVC6V8zRvyExMczlXhXr4NJrtVU7h1OSy+8g6o7eZ5iPLz7CX72tFNo29+2KYnC1Nh+74E+PgPl1MGVZR8HXS/T4Rm22Jonr/j98LGsIyxLRqoQuZj8faM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779418677; c=relaxed/simple;
	bh=oNvVEcfIiq5ZxP9ECE5y+a0pGsRBN+oosvzZmz2J0Uk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m3SuUZeMzy8Dk5Eg3JzYUpz8pLqPBhCiVlT3PevuRW4YjWrUm8bMIfxZMx4bxIUVS0FnqoRny/9h7+i1batW43qsaU7cL+fY4+p2CBJU1e/15mWAbapxoglxwNT4ZoA5oux0OKT6gN5Pe0fYSjlqnLsa2vJt7L5RSj/nZArWpPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=QFyjyRUp; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M1ilAg1744849;
	Fri, 22 May 2026 02:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=YHn+a3bUe+N8hyKJ0akH3VsI5bMPuudYJuf+oUoZ+10=; b=
	QFyjyRUpmp3UNPYiNyXyhY9vgLmF3bRDmo48LzP8KlhZG9OwBd2RmlMT/Y7bDVKv
	zP4MJpRa7i3wB1LFT+l5/UrJqIc64Z+2BLuIMj/3XCkSpElctzjhxxVuq7/MhFWT
	ogZ+8dG0FUmFgNdNY0ZpaICgTxaUz2PRHbcSuph+v0n93UVdGp6RlSfVAvJdaIh0
	3Y93NY9gxheI6+MHpW7ZPXf7299lzv4OF9EdP5v6KH8c8inYeiMJGdFsv9A9JCkI
	QjIgQpN+zngrZwXFgnb85qXfiAoPRaix2YyE+Bg9Lrt25yHtyCnoE0IYXdZ+BXse
	v2FBzsTnaPGy83mI4aPUjA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e9xab1np8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 22 May 2026 02:57:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nhqk8p34rxjAPTOY5Sil7psOnLDrg/+GsXWMDKB4DV3J/KHERX6J0fWEOwXmaKyeqPeZtjToCZUPI9DFMyw+MHXmmhLj97Uew8inNCKoC+A0QR18Jqgi2ikfAJjD7a770quslgKDxB5xUdcW6RAVYmq9fjGO7pJdVJw2s/odFB0jFem5R7GtrdaDKhl6vZhJOagSuZNXdQ63zp8y+No2qpz19H/c8tpiOzg46MGXgH/KrexWr0QY7nB2WiOyGU9guLUtvrItTWObj9SWfOJ8TeeAyxjtTt3Db+wDaDGeFh/J+wxZXO2Cjp6fmoCMks7vwR2xkm2utj4DZb03G4vFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHn+a3bUe+N8hyKJ0akH3VsI5bMPuudYJuf+oUoZ+10=;
 b=aEEmr49FHogFm8B7BSaSwBPCNpUU9FQalvQ2wzfm52r3O0E7MnGvy45t5qLLGGiH7JoSU+kGLKPPY6v8TbfRM/+sagMclKl+I2tVP4tqRV83SHyUOqYDJtsXSLVcvlYWPB85eRVezjAhkpCY2sqkv7Va8EMQsD9254CGhKa24kNhs5sNJ+KMK8GlWebxRaaDz5aCNLE1P8htKuJB1SI8GcalJDUghzMVLdkgI/J+IpFo8cIVJ/xXE3fl0RkS+8kyvKtASjxEuvNOPkwpWFUMfaokSUshEBZzmvq421lq5oIEECsNvKYg0OoWOH7yJUWPgKAgCQFn72I40ib/93Gdyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5332.namprd11.prod.outlook.com (2603:10b6:610:bf::17)
 by DS0PR11MB8231.namprd11.prod.outlook.com (2603:10b6:8:15c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 02:57:20 +0000
Received: from CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13]) by CH0PR11MB5332.namprd11.prod.outlook.com
 ([fe80::8f86:8d08:45bf:ec13%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 02:57:19 +0000
Message-ID: <80cbb5c9-749d-417c-82ed-ba7d4362d81f@windriver.com>
Date: Fri, 22 May 2026 10:57:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: dvb-core: fix use-after-free in
 dvb_frontend_open()
To: Hillf Danton <hdanton@sina.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260519211520.829-1-hdanton@sina.com>
Content-Language: en-US
From: "Zhou, Yun" <yun.zhou@windriver.com>
In-Reply-To: <20260519211520.829-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0039.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::17) To CH0PR11MB5332.namprd11.prod.outlook.com
 (2603:10b6:610:bf::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5332:EE_|DS0PR11MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4d7f86-e289-4ceb-c9a2-08deb7add6c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|5023799004|6133799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WJTD9j+alNdsoRmq57AheOZwzJueXUw/wpwJ/LptzaZKlF9HZmq6TqN2ZZ/RDhtlIOky5XZuvzSE/5x6EG6JTtwGd3dLoadWQPZNMAMlsHhb8zkORMyyioaGwdgrP83/I0l3cRV+RRihnyehN6f7q0CfPeunUWM32LoUGGl/vz2fGFqj1IoCxD4W059LzPDvJFSsz18or4rkTSwLb2opYtaJSwc7ujdWr7Y0QAdLbAqINeWREyAA2JRZ/+aJ4FPWprsdF2IxZvVS9a3Xt6XspzKtV7gd55P8CZWR2n1edC0ytSZo4dU3i+bwlelK7Jr8B/i2jtUBnPZQ9lHM0hL0GI6fHJjJEKCmUoPJW9aKbuEA2q1dqCjQSjXMgNYaeRU+lVZ5m88kQsIIHFDauIPNDRGaoI/aio+w/sTmse46Ki2hTI4RkPCX/hW4thR98ar38evrHPzRRxjfSaiziM5gxxO3E//ztu+TgZHe7EODgHpEPHFottguGiPRKMedBU01t+KjjtMGJgaELejvf46VSxN4wFwS0q1vQ+ux0hlc8/+KlsI1WtD31m8kxfmPmGephuolmGTHtfN5FyyOUCwFY9EcSu3vNiITrfPOst30HIWCsraIc2f3mIm4V5AsxvqEU8x0y6pUqd3rYiGilApkAY6RmWGOxi2JrwBD0FAU6yoV+9ybdipnahO5tPHwhlTd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5332.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(5023799004)(6133799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azZYNWFtRGJaRFpua2JwdmZTTytwSUwxdkcxVlovOHJzMHhKS1Q0S0t0emta?=
 =?utf-8?B?R2lJQXlRNWJQVVdsRXh3bGNXL0ZYWmpCZVlrZ0w2SWtiZlF3VlhXOWlleXZa?=
 =?utf-8?B?djU1bTBZajZlb000K2F6ekszcGJPZVo0eDZwV0hhclZBTFlvZUc2QzlHVzJU?=
 =?utf-8?B?aDlXeXNQTlZwSGd0UGFmL3dPdUJ6bEZSU3Y0bGpyV3R2cUNxUG9zUWRWaWF2?=
 =?utf-8?B?UzA4b2VLbXk1LzVCT1J3eUJTR1ovbkZtR0hlMW1PeWFseW9FRzlMRUlIWHpv?=
 =?utf-8?B?WlBmVE1mNzVDZXZGNzBHekhtNE9GMStxNGlxM0h1VFpwN1I4SG9rMGJLVzdp?=
 =?utf-8?B?YmtqaXI4YUphejdTYXpvQ1FwZjY1a2EzaDk1N0dhT1RDUVduZmF0cFVEcERk?=
 =?utf-8?B?Rkk1a2JSaDVadGJsdlM0aHVMSVdLaGlmeWlWYU9LaE50NTArRjdYUTBwQldZ?=
 =?utf-8?B?TUp5K2NWUk1vZUloSjJaTWxLbzczL1ozQ0NNQTFRU3hCZTM3SVNpeFNDUmpp?=
 =?utf-8?B?SGdweFVVaHBVa1B0aGNUd2YwenNPdEFUQTNpOVlaZmtocmE2eElHaHU3czFv?=
 =?utf-8?B?RXBtQU5ERHU1MWUxQ1JlN1VDY0tUclNHbEJnaExRWUNDQnJTdUFzNkxaWlox?=
 =?utf-8?B?dXFPM0thdnlVVFNSU0dhZ3VMYzBHUUlHcEpzKy9EUTBjNncycU1GamN4eGlO?=
 =?utf-8?B?RHR5bWNJRHJGeDBEL3lHUmZLQWQ1MUVqeld2Q3BtcDR5NUlCYjhZd0ErZ3BN?=
 =?utf-8?B?UXNqNXQzS3BYV2JDMW4wMzh4RnRaek5OKzFWd2djdHM1R0hFbldnTnZ3aHJ4?=
 =?utf-8?B?alhpMnBvZW5NYkxqWkdyV2E1LzNWMEZKaWVIcmlIMkt2bHA5ZkQ0Qmd0Tmg3?=
 =?utf-8?B?bzFwelFFN3E3WFNiMU9yeFk4YmVRY0tpbS9OSUx1Ny9ZYWUxNDhPQVd0aEZ2?=
 =?utf-8?B?WE1rbWYvb1ltNmJKNW1GNk9rNlQzbHRnaXF1NEpXSGtGQmtHUTN6ajFkcjJ0?=
 =?utf-8?B?eHFWYTlXQ0ZNTCs1WUtvaGIvdUJpR3U2V2ozWGo4UlR6UDFHdGtjR3Jtb1N4?=
 =?utf-8?B?T2dSWExteEpNclVPTWptNUZxQkczeGJwUGR1Ly9zS2VjZldGNDkycmlZTEFr?=
 =?utf-8?B?Z2Vha1ViVy96ZUlDNDlwbXBqdTFGTllkVXJUZnhPbExmZ0cweEFiVVRtYTA4?=
 =?utf-8?B?Zm5XbTZwcFU1cUg2R3loL1YrZmppL2NkT0VPWlNpV1czaHRhcXVadGd2amwv?=
 =?utf-8?B?a3N1dFpOMzlQY3F4cnVRTmVSWE9DQmhjYWMwMWRuQUxRL1RpTzBJd1FScFk4?=
 =?utf-8?B?ek4xTzNwWk9keG5nenVVUndNM2tFSTBWbkswQy8vTktGSC96a3hWM1NMMWZu?=
 =?utf-8?B?L2Y5RWJUcEpONWZySzRrM0xyb0h0enVJSzQzREJVSVV0SnpJWW1ycG9aUnIz?=
 =?utf-8?B?dC9QWkd4UGlLbkd3a1VheFhYUXRPT2ZTTE1GMXJ0b3JOaDZnK0gvcTdCNUZW?=
 =?utf-8?B?blpHYmdocWVuTnp6alFCazZGdHYydHROOTlYV0VyOUo3VlEzN3YrZXJnZkNk?=
 =?utf-8?B?VFZuMUFoL0dYZ0t1c3VTTzJtZ2Q1UnNHcm5ZR2NrREZHc29nUlRacUJYMHR3?=
 =?utf-8?B?OTNpWm9sYm52dC9RbTd2aDZ0aHh1VTFFaktvYmlqMndORHFnbkhqbTZ6dmVM?=
 =?utf-8?B?WmYwLyt2S2tsakwxMDB2Q1hZWW43TWJqTGVFc0JETzU2MlZBTnVKbElPaEtZ?=
 =?utf-8?B?ellveUt4alRMbVhCczZ5TU1qOHVqbGZtQnZVYkVXbDhsM2N6TlVBSGNSSE4v?=
 =?utf-8?B?dnhEV3g1YXBoMG9wQW1ZcGlDd283d0VTN2hMUldsaU1GYm5CVUVQUzN3dm5T?=
 =?utf-8?B?NjhHTm5jbjFzZkYvWjhJSy93Ni82T05LdWlVMzh3UnJCYVkzdVpyZVBjcmFT?=
 =?utf-8?B?VlgvVGpUZkJlbXE5MWVrMlFqTHZnNVRKWGx6dWFDZ2NQWmU4QmExVmMxV0VH?=
 =?utf-8?B?WWlOOFE1SjhOVERZS2J4bXpCZ3g2dDc5QlFGZmpwVzFNWG5iMW0yNExSd3NW?=
 =?utf-8?B?dnhiOGRRQWtUYUJ2TXJzR2Z1MVpKSVRRYnBDNVpIdnJRT1JkdkxxTytPeG1R?=
 =?utf-8?B?ZHhjdkZLbHVhcW9KMG5vYXdGb09Ea3lnOElyTXBUbWRlUTFPdmlhSmxrN3cv?=
 =?utf-8?B?Smcyd0cyT012NXBNaUs3cDZQM0lmSUFyVXBjOStSeWxJdVNUd3ExV1NmYTJ3?=
 =?utf-8?B?bDJNbmkwcVRCSmlOaitjZ01uVkhLcDlFdnhHajczdWpxeFg2UDFlRlV5K3E5?=
 =?utf-8?B?WmIyMmpkNVRlQ082ckN4QzBaNFhVNy9xcjk0UDR5ejVyWjQySHRqdz09?=
X-Exchange-RoutingPolicyChecked:
	VBusWQXa1ZDHqlvfDf16MHIpgWOt3ymbxnfsH3moMaaL3wO8YqXBWsgZ6i/hIZlYZS0Sr2ZaNjjDJBzPQoZPakAMsJCdzKyTzF2qf3qScoEQbbp1yfVT2H0Y3sL/SQKPdIBetfJAKlFM0/p48HTJLCt5BJiQ+I59NfPv1PFrW3pglpZ0UmFfyCHc3HQ5QVFUgxlnR/V92nHYPvifGPp7cPsh9yxIrXbKpGvdc2EUeSsXvjbWXQnuXm1TcNBGzIoN+L9xQZyXBuhYV4aLKNFZxs/MeNjCJit+AsIV1QdNVh2JeCd5cTNFpG1yZbhe6X5r6hVMljt/fwJuSEBriZTt0g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4d7f86-e289-4ceb-c9a2-08deb7add6c4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 02:57:19.6651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pzrkOXgdbwgmyiXWfMNj5F1LWPdUyErez91/nRHE9Chw4/hOV+k6dDPByobbbmvGt0zZLyuWTryQahnnhRbEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8231
X-Proofpoint-GUID: GrkiISwiWv_VkD3EHfHhxSGjWHllYG1Q
X-Authority-Analysis: v=2.4 cv=ac5RWxot c=1 sm=1 tr=0 ts=6a0fc613 cx=c_pps
 a=qLcLqgYGKfI026PYVGi9KQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=0suDURjoWg09H4hC5cMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GrkiISwiWv_VkD3EHfHhxSGjWHllYG1Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDAyNiBTYWx0ZWRfXzhPLxddhCWxM
 AuGru63Sbsz2bxg9WV0NasTXWIEpF8H0yQ3kJTKC0XNpj/ZUTgOwUF9Hg8yLSmeA59eojEoUDAS
 asu4ffUcT5s8kpg9UGWR2q3ECRTXkDasTht5MBjDsCobeBpsLFyWhcTtJiXse+Ygl6fen/LfGeH
 U3GMjGclU03rkf0rS5ce+ecPN6jmCUi5I6tcyDIw2Tr1DK7HUjJNnoUs56IE5iJXQ5eR7gXUzrV
 6Ib/T+jqyta0nE2+DZKDbSfs1m+nfEGyFeMXZQenQWb48RocnwI5E3rZdJuNOEGmXSybrdhaukI
 f1kVLXNqenqI8L1QCoXKMHIeBuw4DSPNPa6YE2AQAeBlX3fgD4o8OAbcPJhF4uOh8rI1gD0mjAv
 /iXNcBu+YLSNZe8t/AMRNS6XVyB8T9civVnd1Ilx7gmTzCxrRSV1FYJvb3ssynn+b8SSAiRPsMM
 eayt40g2wyfgm59MmMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220026
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62551-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:mid,windriver.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[sina.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E1E845AE34D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 05:15, Hillf Danton wrote:
> Given the relevant code snippet
>
>          dvb_device_open()
>            mutex_lock(&dvbdev_mutex);
>            down_read(&minor_rwsem);
>            dvbdev = dvb_minors[minor];
>            if (dvbdev && dvbdev->fops) {
>              dvb_device_get(dvbdev);
>              err = file->f_op->open(inode, file);
>              up_read(&minor_rwsem);
>              mutex_unlock(&dvbdev_mutex);
>              if (err)
>                 dvb_device_put(dvbdev);
>            }
>
> a) the frontend open callback is invoked with refcount incremented, so
> why could a single put in the err path drop refcount to ground?
> b) worse dvbdev is freed without clearing dvb_minors[minor].
>
> One explanation sounds like
>
>          dvb_device_open(); // err with refcount dropped but
>                             // without clearing dvb_minors[minor]
>          dvb_device_open(); // single put frees dvbdev
>
> so a simpler fix looks like incrementing refcount before
> dvb_generic_release() in the err path.
Yes, this is a simpler way for the current issue. But dvb_device_get()  
before
dvb_generic_release() always feels odd and easily cause confusion for 
readers.
The most elegant way is to pair open() and release(), get() and put() in 
the same
context. To achieve this goal, the changes may be significant. However, 
I will
follow your suggestion to submit a new patch.

