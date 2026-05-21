Return-Path: <linux-media+bounces-62403-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCoEIK6tDmr6AwYAu9opvQ
	(envelope-from <linux-media+bounces-62403-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:01:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3551C59FCD1
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53C6E300C269
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 06:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C393B3019D6;
	Thu, 21 May 2026 06:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=symple.nz header.i=@symple.nz header.b="q3g+9oRj"
X-Original-To: linux-media@vger.kernel.org
Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazon11021143.outbound.protection.outlook.com [40.107.39.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA983438B1
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 06:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.39.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346778; cv=fail; b=a+Aj7m/7KSnwZS8+mgJrS4QECEVJNWQOycz7cbb//yI23VZ/opsw2LfEgeszx2Wced5wUZR7y96X00RPs1Q9j/28+v8XF7LQ6DVOB2mH4fFcWrciD0kCzm3IcDuD1M0Vd3XpuHfH2Wb/EA1lWrfZMn/ZwurU5FEMPiCLEvBk38E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346778; c=relaxed/simple;
	bh=mogblFUxPrxkpcCjWoZV8XEsmyVRh34VU4xIoTLqVGk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OYNS/ynnyM1smBfJ5RFr/LoWXTOqXM1kW6eclMe/MSanSMFdGb8wGxmsXbPGPx6i27q/9OfmvhIZgRNAqOi69ft2Z2PkDl2Sp6WglrEbpxx1btKFdebkqRQaQV17u4LqzbxOAKMLfi/TJ3ajU1+RTSMuFVmEfv8thqvEkcsJ5j0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=symple.nz; spf=pass smtp.mailfrom=symple.nz; dkim=pass (2048-bit key) header.d=symple.nz header.i=@symple.nz header.b=q3g+9oRj; arc=fail smtp.client-ip=40.107.39.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=symple.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=symple.nz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4W/niDw5+yTrGrLxuDvx3PQ527goAhy38vU27xe98iTitiSY0nLZJun8IVxYfZa00FfTct8EHQzbxxOvOj/EOzY4Rtps/Zih8Z9/08I1Y7mBq/PzVyBQ6+hjquVX8AdRKPqNiy3SehjgFfS3IRnXqpnEX6U9ij3rSh15N3wy2SsTPsE5dZ+1uiE9tPLcf/YCnaI4WtI3R/D/O7HBLBr5DTTOP895CJ+OsWIiRXqVjxIf/ZPopcQ9WAQVJBPy1oTnGL51WTC93Ec6xpS1h/lD52jyxS1AAIPYiH5qdq7Woy0OoKUXNFjc9kQ8acxpmRC1Vz86vwn6ASjsYDRwcFG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuLY1QVtwFR4tbv0LN+RrLaTvM2+To9ZzTMYk2/yroM=;
 b=Oh42xIAc2RSUaLJ1ft4Z4Uh7uT5xZm1QCNKdni6VhiA+K6+JZsBHwrgwJHXiW83N2BMcypJEdWABg9fhL7Ps9WAMOU29YOAYb9JCZ5ma+/RUoYPUGPgyPpLdnjn44jpvf6CLBBHggGwq82YUYKC8BRX5Ez9heYY3wlg/5h2bYCepsnIieQeaxDMW890RNxDk9+CWHiE0Heh/cAGxxvxGwoZBoaxU1C2taqI0sd40w4njJp6TJXB8JXZTnsMpHF2MwIBQffql7EjpMQ+x/8Zc5vyIrURpQmtfhOOl3+ffzluql//Q7xU9Uly8rCfIplaQwpnAk4OlN4FwbZk9rNFwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=symple.nz; dmarc=pass action=none header.from=symple.nz;
 dkim=pass header.d=symple.nz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=symple.nz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuLY1QVtwFR4tbv0LN+RrLaTvM2+To9ZzTMYk2/yroM=;
 b=q3g+9oRj0scVilZPr+/1qAROSLT9kRV816wPCYyzo9P1LBxSCZEwQUekSv3QMVFdUvBQdavdX8kAP3aBYzCZ3d6+Jbpr+QMoWFaqZbdXPNRMNn052sxRNZ1JUydgTyIcMdbgl9D1+lkTtbOnTzHDo0kwoyyM4XKaGK4FKK5eBIQdPU8P7RuzYXjnvttqjTXqPwAIgQILzMqgMAkYLCKI4Doaqx4ozF9m+Ykl3RF7tfop9KfDNrzedeOY7kOGx9Fqp6idJmzhssisLzB8P4OyWjz9yNDdF0PcTznMgrjjkFQNND3U4rv/Dh4bAmFrQvqfYOFyUHzxb8oJWw53hJ8wBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=symple.nz;
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:b2::11)
 by SY0P282MB6431.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:340::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 06:59:32 +0000
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834]) by ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834%5]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 06:59:32 +0000
Message-ID: <4358f22d-247c-43d3-89d4-27b57bbe90aa@symple.nz>
Date: Thu, 21 May 2026 18:59:29 +1200
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
 <5797ac61-dc61-4182-ac60-cc377564ff90@collabora.com>
 <2565c949-a558-415f-8c79-e47812db8341@symple.nz>
 <e3b93bda-fed8-4f21-b3d8-cdf28bfaba1c@collabora.com>
Content-Language: en-NZ
From: Simon Wright <simon@symple.nz>
In-Reply-To: <e3b93bda-fed8-4f21-b3d8-cdf28bfaba1c@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5P282CA0101.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:204::16) To ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:b2::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB2196:EE_|SY0P282MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 2217c5d5-c62f-41d0-4e6a-08deb7068211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|22082099003|18002099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	4Vap5umc0gW78fNbrgnSuhdiD7fgepeQ2bftw0qikUCrZIekySJe7hYHpYYgUgBadazgd6oJXOBvsWUHGGgKXMGqxl/ehXHI8r2EYOye5f2JaOaURF75ntM6vmi123JnYQhw4jMVlfMCyoZFT1Onxf8wL9JLx7tWwAYz7chsrJiT+fUTgeVukLT47V6D9TEQiXjj1wpMUmddM75VrQeTe8Vvk8g3zQwOS4lg+M6LJ9vnyBMGJGbVv984r2BBaeMfVM9vG6sQBwOQVbZ2S6ZHeJiwhDwmAh+iSsDavZpmLjeQ83AQstl38dCWd9acOEnemEOIwDdA9yKbARBJEmgSdiF/2IVNvU9Y3WGZfWd7Ngf/05BersyY7Zbg8PFO0gbtF7C0NSs3GASr1/mcEGDC8KiiS8HUmziaCQY+IIFl//+JkIylZLpIHcHeT54Uvqh0XNBbIPN35yzGGh1ii9TZ6vwauEGQJYfZ7sGxMweLNo32um99wZhjv+v8JsuSUMeAxEUENBdUNdsu1i0GVVcK0Ur/sTks/lrcQenyTXIZU3Ty8P48iY0qiqEs2Om/bm4VXY83gkZ8aKq3WgGvJmdAqGaNiYmrxF+CmhxkySC1OYMx7Gz9pP0ggiBASirjWenL8STlEkf8t8Wnr8YRMmHnrjox7LJzmpnVWw8zJoP5czNaHzRC4dTOv6jmJFOgFYba
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(22082099003)(18002099003)(56012099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk1DZTY3Q0NpSmFyU3JIZnEwTlAvbVRObCtId2FETDZocGwrRGQrdnl4VEY3?=
 =?utf-8?B?NkQ1OURnejZ2dU5wdjJpZVAvMnJTVW41NUIwOWUwRHhQTXpVWTI4elVBakZx?=
 =?utf-8?B?a2hRNldRUkxGelc3dVF0TlFwL3RIYk5NTXpLenpXSmhMQVc3R1htQi9ySmJy?=
 =?utf-8?B?NXNkdkt4a2hHUTkrWGtrcWEyU0tOZTM1MGN4UGNtYUNiRlZyblBZbWYxVjh2?=
 =?utf-8?B?T2tCdnVBeldXTXM3YXI1UEJkZVJXMUxVWVZiTVZrRWNQM2dGSHlXNSt5QndU?=
 =?utf-8?B?cDI2Yng5RTNXWlRVTllwblZod1EvYVN1V3YzVTl1K1FIMnRIWHRqVGtwVlIz?=
 =?utf-8?B?TDd4anBIYkc3V0E0S2lVbUlia2J0L2x5SjJUMENJa0NOY2FPTFNGa2VEL096?=
 =?utf-8?B?am52S0FjZEFVakFDTUdKbWh0U3pkTFB6SlF5aENxcWFUVVBmeGd2TGxNLzRH?=
 =?utf-8?B?NUZoemVNUVBNM3JEdDVTNFJ0VnRRSXpiZ0NVL0JMK245MEFoeHh3OXZackJ2?=
 =?utf-8?B?Nm8zNGs2WlFDbkk4MEdFUVhoOE0zM1hXRUpiZU1iZVJSYkkrdFE2ZW9Od096?=
 =?utf-8?B?TWdtcXZLY0xWT3llOE5kbEFsVmdvRy9Yay9Qd25yY2NNNVJjSzY1REtGa1l5?=
 =?utf-8?B?RW9icWpsM3k1Rzl2eTFjK0w0aCtNdDlwMHgwQkx4MWJZMmxrdDhlWUo5UjFP?=
 =?utf-8?B?MnFCQ3JDQTV3RlpKaVAzOHU2OXo2ekpneDhPUEY3ZHF5b2FNN3VYSG5KaHhR?=
 =?utf-8?B?eGJCNnAwMFl1elQwZFlJM0Jmc0VUc3RTbGdyYzhESHQzUllhU1FlUDlKVlBM?=
 =?utf-8?B?RTU3bjhBQVNUeHY3VDlCWG9ZZjA2T1U3VUltRlFXSGp2SC9qU0RQQnd3MG1P?=
 =?utf-8?B?ZDRyTFFlb1lzc3JHN3ZqcnFPTmFtb3U5aDBZTlkxVzBTM05RZWEyK004V2Ey?=
 =?utf-8?B?OUtnd2Z1U2pZMDNDbE51aElhclZ3VGRoLzlmZExUcE9xVmRyemxKSm9RVHFy?=
 =?utf-8?B?S0RLMmxoblFJZzNTTnVPMDA0SElkbjRZRyt3OEpiSWRWNWVFZG9CNWJMb2hw?=
 =?utf-8?B?QTR4WTY3ZEpNLzlObEpSKzlFVjg3UVFDTGFHTjkyajJGdVc0QmZaWFFPZ2hq?=
 =?utf-8?B?MUdpTXFMeTFFRTNPWHBhZXlHMktGZXJUUmlSLzYyeUtUSTFxWkQyZXd1eDR2?=
 =?utf-8?B?ckM0MFNwL3NFaDJqcUY5Uks5b3c3QW9aRWxpeTNjZmc5WEJVbzFvZkhDYnRR?=
 =?utf-8?B?RzJKU1RHZTBDeWNabDlOeUpHZDRIRlo0NStIdTBHYUN0WU12TEwrbXRKNXcz?=
 =?utf-8?B?Tm9WaElsNVZwVGt2eUcyU2JrSzI4c0pSMmRzeEF5MXg5YnJNYWg3ckZSWDdT?=
 =?utf-8?B?ZExPZXBIbHNXTmJLb3FTWGF2aXk3VjVHTCttaW5IYi9MY3Fabll1aWxuMjlM?=
 =?utf-8?B?RGRLaTh6L2Fadmh4TUliLzlua2MxZGJGQ2JjUHpWSUUyb05TYUo2QzJQQWFJ?=
 =?utf-8?B?NWgxYUVtcmo5TFkzZjNrWE5ac2wrVEh4eXpRMjNOcWF0a09OQmJQcE9MKzRy?=
 =?utf-8?B?c09QbGdpNTYza3FlTTN0L0cvTVZUZDFhOXFsMzEzZ0xDMEQ5L2lNT0h6aWpK?=
 =?utf-8?B?YVJvK1VlaTI1ZC8xQ0pkL013cXBFZW9oQUZ0Zzl6ZTNLZEhtTERjYUtmY3Fn?=
 =?utf-8?B?V1dSZFV4MzAxOU93NXl0TDJKWXBpTUllcDdTZkNPZUlNL1d0Z2ttRzVKS1p4?=
 =?utf-8?B?T0xKREVvWUtkVUNMRDlFUXA5bVRRMHRIa2VHM1VlN2Q4WU1ydEFZWCtsRHFT?=
 =?utf-8?B?Nk5DTXI5RlJ4VjNYQmJYRWFvM3FudHBmL1dmM3M0cFNyZmd6dDNkWFFmbWhX?=
 =?utf-8?B?em1OQTF0MDIzWk9yUlJodENUQXppdXRvQ0d1YU5PL3NVODhBY2ZlM3lkNjB2?=
 =?utf-8?B?RWMrSHV3ZDNSME5mRldZRTRySlNoSnJyZUQrczJLV3c2YUl2b0NNdC95clpi?=
 =?utf-8?B?eDN3TUowQ1VsN0d6SW5PRkNka2ZxSVhHRzdKUkJ0N2szQ0kzSStPcFNzeTZH?=
 =?utf-8?B?YjhVeGdQQTRheWFoaXhSTmlwYm1ZY0xOMFRVQzh6TTU0cEt3TzF0UUpQbUt1?=
 =?utf-8?B?YWhrWVY2UEhaMjd4bHYwR2x6MHdFOWJnbitxSERUaTJDUmZPYWtGRmNmeXE0?=
 =?utf-8?B?UUQxbUtWbENMQ1hRT29ETGZlNUxXMVhTYUczK1Erb2x5dHFQTHQ1QnhQbHZj?=
 =?utf-8?B?dURYYlM5R1NsdTFLb0VnemRLZ1pCdnNHTGtCZ2haVWVFbnhzalZFZVI4eUc4?=
 =?utf-8?Q?f6ahtf7NhGiREPaFfF?=
X-OriginatorOrg: symple.nz
X-MS-Exchange-CrossTenant-Network-Message-Id: 2217c5d5-c62f-41d0-4e6a-08deb7068211
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 06:59:31.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9531f271-068a-4210-b471-bd8da91491c5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hOmJH/P6TjVgy3L2kJ+uWDCDoDUbRdyBmXCd3tMn+q1Zrgkmda0iogPtcilnSZXI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P282MB6431
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[symple.nz,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[symple.nz:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62403-lists,linux-media=lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[symple.nz:query timed out];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[symple.nz:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[simon@symple.nz,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[symple.nz:mid,symple.nz:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3551C59FCD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Detlev,

> Another thing that could be helpful is information about BL31.
> Which version are you using ?
> Can you share the bootloader binary you use on the Sige5 ?
> Is the vendor image booted with the same bootloader as the upstream
> one ?

BL31 banners pulled from a 16 MiB strings dump of each boot device.
Our Armbian build and yours both carry the same derrick.huang
builder identity, so we're on different revisions of the same
upstream Rockchip ATF tree:

  Stack                    BL31 commit          fwver  DDR fw
  Sige5 Armbian (eMMC)     v2.3-931-g4d7e811c6  v1.20  v1.08
  R76S  Armbian (SD)       v2.3-931-g4d7e811c6  v1.20  v1.08
  R76S  FriendlyElec eMMC  (not in strings)     v1.17  v1.09
  Your Sige5               v2.3-859-gc481e5368  v1.14  ?

Sige5 Armbian kernel cmdline also carries
"androidboot.fwver=ddr-v1.08-fcb0cfd52f,bl31-v1.20,uboot-rmbian-201-
05/10/2026" which confirms v1.20 from a second source.

The pattern from four BL31 builds tested across both boards:

  v1.14 (your Sige5):                     clean
  v1.17 (FriendlyElec BSP on R76S):       clean
  v1.20 (Armbian, R76S SD + Sige5 eMMC):  broken on BOTH boards

That rules out PCB-specific factors (Armbian v1.20 reproduces the
bug on both a NanoPi R76S and an ArmSoM Sige5 with the same kernel
driver), and it also softens the original BSP-vs-Armbian conclusion
from my last mail: the BSP stack has a different BL31 (v1.17) AND a
different DDR firmware (v1.09 vs v1.08, dated 25/03/04 vs 24/10/09)
AND an old vendor u-boot 2017.09, so it wasn't a kernel-only A/B.
BL31 looks like the most likely differential given your question and
the v1.14/v1.17 clean / v1.20 broken split.

> Can you share the bootloader binary you use on the Sige5 ?

Uploaded everything to a public GitHub repo:

  https://github.com/SympleNZ/rkvdec-vdpu383-h264-bug

Contains:

  long.h264                    (the 1920x1080 SMPTE H.264 test input)
  sige5_armbian_emmc_boot.bin  (Sige5 Armbian eMMC, BL31 v1.20, broken)
  r76s_sd_armbian_boot.bin     (R76S  Armbian SD,   BL31 v1.20, broken)
  r76s_emmc_bsp_boot.bin       (R76S  FriendlyElec, BL31 v1.17, clean)

Each .bin is the first 16 MiB of the underlying mmcblk device.
README has the full BL31 / fwver / DDR fw table.

Regards,
Simon

