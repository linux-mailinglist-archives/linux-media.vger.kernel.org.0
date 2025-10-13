Return-Path: <linux-media+bounces-44260-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5F5BD2652
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 11:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6139834A1F3
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 09:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221E12FE05C;
	Mon, 13 Oct 2025 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uczACu1s"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E8D2E5430;
	Mon, 13 Oct 2025 09:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349341; cv=fail; b=V/8EwMG9o23DpjB/vwEe6mEBnKE42NsHeyKgq+gD/0bEzVrmCR2mn+BNpYImhRRY6JtaWREncxcjN/nCYAgAJp5wB1cxURJtpPdndmX5M71ddqGcAqPLwPqFPBqUZbC/hdLF+XJOM+OdubsJBOTWg14tgbQTPqN2WUZ4d3CadaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349341; c=relaxed/simple;
	bh=h0rF8lBw1F31okB2aSa1wPZ2l6wDhaM64cyVHBHNquo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AO1Qw8bGm/bzNH8jH/U3GpbyYHUdZyaH922ryj+YYIQFV56HWUcRb2izNZIzpnSDquPZL+pWd0GMnS6a7X/ks6AWW331kKHnC0f31yG5qHntCfUl2mT3xArTjOmL9Xm3fjLvkUiy5xWzJbGwzEUCDUmbCaLeNS5jH5JiR7QmyNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uczACu1s; arc=fail smtp.client-ip=52.101.43.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ry38w0ujZFL/pV3OU2b2iDf3s+czl+qH/G4wksnJF5N3dnTyyEOFLV/rR0+hFhVQBBAEkoAEX/5U8k90zlWReJhvHV0kexvmqkM+L8qu3LqucVZ8nCkmL067hY57c7wVeBDCJuni0oCI/UHkOBGDnAJlytUa+Hw4UD86F5x1m/Qehy2VzOtDTlNhgbjBkf06bGgepHlePgiBi+0z4lEX9uEDN3CnC8191QnOI7D9YqOixA8qBNOzEi15dKisYjvaywOGJqkAbCqGP8szH7m0Qfu4+EMyUrKlXDhCxm0F9wg+HecBozT3LjnF0vyvXOU2xmrJ++Z7B8WscYE4+/bGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyoUOvVARRmd4glp47W0ZmOSnVc32ZIMJ4p5DsHkcMA=;
 b=mfJEPTNR7d/hKHuGE15YpywmyNpyQrOsPKtbDHeogVjTKCFRyLe0rRiCtaang/v43CXly63X8KvdMu7x5bo+Uxbbbmrgl9Ieocl1AXHFWKotuwLxhnIJo2/ll/OEQFc7ZrM9sM29iodX60W4dmefaXD0jpl/elURNSKPH+l8XWEIDTEhutJrsbwgBhZdqOfEWHnhlyTg2UnB922nR30jsZaPlepxzqymp4ztR8MJez1YFrwddN+TOcUU3mC8CqNoVKZt1dNC998PNviiJXV6W9UNxtNS1JUmLl13Ebb2MLlwCf6wyRn99uIFTlre+OPuOFk+TROYDj1F4yBzmD0g5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyoUOvVARRmd4glp47W0ZmOSnVc32ZIMJ4p5DsHkcMA=;
 b=uczACu1sFPFhFEJjXDfYWikhwnkJZSfSd6vDQMQ7991r32EyzIgNvpjhPqhrEjULlL6GUKkvhqffMWBKYnNdTjL3OryN48HFXAPgIVRpPZFqYehGZUBdPHdMdoZZmEG5VJkcu13zvYCU/G4cmwZwm/v3b7X0/6yjM09YKjmDzr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by CH3PR12MB8075.namprd12.prod.outlook.com (2603:10b6:610:122::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 09:55:36 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 09:55:36 +0000
Message-ID: <d0e66d15-f710-41b9-aa31-7648430034a9@amd.com>
Date: Mon, 13 Oct 2025 17:55:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] media: platform: amd: isp4 video node and buffers
 handling added
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-6-Bin.Du@amd.com> <aNzP2LH0OwUkMtGb@sultan-box>
 <c28eb905-b578-4512-aa9c-37281d3a0ee4@amd.com> <aOtF5C2p0KGTQSji@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aOtF5C2p0KGTQSji@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU2P306CA0079.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3a::18) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|CH3PR12MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c18c13a-c293-4889-ef55-08de0a3ea87f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmlHdC91ODYyWUx6TWJNM05JcXhHNXlhYzRvdlp3aUVWYjZHWUVTaGtMNWhw?=
 =?utf-8?B?RldtdXF3R1ErT2FMeFlYZ0FxYmJ5OStid0JiRk1MVzA3R2N1a3Q4MXdaakw3?=
 =?utf-8?B?M3g1aXE0U1pNN0ZxWlI5SGp5RGtVa2U0WnFiZ3JWanF3UzNlMjlwa2UrbVBU?=
 =?utf-8?B?Tm9mL0J2VUZxUjJEQlFSbzFObWswQXRKZU5hYzhKSWhpZWk1K3dwQU10Q1Br?=
 =?utf-8?B?QnJlTmttK2dNL003L2RHWG9uQW1hdVkwNSthNTJXRlB2VkFiNVcybXFkdWpZ?=
 =?utf-8?B?T0hCTDc4YWtVbnRqOWc1L3l2MkN6cVorT3I5VjNVWFhFaVpCNGE0QXlrbVlT?=
 =?utf-8?B?SE1XWllqUzFJZnMxaHpzbURFQWpydDBTSng3a1ZkMkFTa2w4VjNCTzFoY2x0?=
 =?utf-8?B?UGF1WHhML0NsUzNiZmV0a2NER2g2bkdUaFR5WXdmOXZSZUlxeUZIMDZmMGlH?=
 =?utf-8?B?Nlc1aGFZNWVyMGE5VFRJMDRYWG5uR0FqU1pLbjdweTlCdDQ4NFNNTjhkOWRZ?=
 =?utf-8?B?U2JCY0grQWN1SGhhZmlNSXA0Y3NyelZRbmpIaDJVK3djWWZYdWcrQlhET2VF?=
 =?utf-8?B?cXBBanl0WDdGNncyTTVCSWdFMndreGRjdEEwdXV2Q2JjcEptZVRkQUxGNGxr?=
 =?utf-8?B?UjNLMWdPUVRMbzhVRUZQdUx3V1RnNDFVMXhibmpKYm9iL2l0QSs5RzcrVWZP?=
 =?utf-8?B?eitwb0N6VlhicENDTVlSQk83ZnRnbldhZFhaWSt5LzFzUE5LTkdmTWd0bEhm?=
 =?utf-8?B?R0lpVW1EbGYzeEJ4eWZ1U2xlMTR1OWNraDNia2NMOHhWQXFiS2craUh6cEdX?=
 =?utf-8?B?U3BYeUg3QkZXak4zcFJkK0szeDdhTDVSWUNsMFZmVmJHcUprV0NoWEw2ZGtr?=
 =?utf-8?B?b1EyNDl4ZUg4U2hpTnlDZjdIUmRXclRRd3Y3S1U0VE1ZRktSVGVQRHBNZGJq?=
 =?utf-8?B?REVHL21PejYxREV6U0ZENHI1S0ZMZXBPc1QwMkhIditnRWNaTnNTUDRxekJr?=
 =?utf-8?B?Sks0bXlmUGl2Tll5TUt3TEZyL3h6QU1FYXZiZjg3Z3FYams4UHZUd05qMzBF?=
 =?utf-8?B?OS9qNXZER1VWc1crUFpHQzk2YXhWT2wydEFRMlZaUDExTlpXSkh6alBNYnVJ?=
 =?utf-8?B?RmFSZFE5UjVCZFBTeUovZS9vNmZvTWc4SlVnczF3WmY5NmR5eWZiOFZGYlRG?=
 =?utf-8?B?eUo2dGpMbEFIazU3aXpOZ0VmZm5kZGgrL2tteUR2VWNqWWN5RUNrOWx1QXFL?=
 =?utf-8?B?T2twdk9wTUZEbWhLeHN0cWlVcDlaYVNiTHZ3czBPdFA5U2RWQ2d0VFdZL3R6?=
 =?utf-8?B?VlZZODU2OHZ4c1RxNmdXa2VGeUs5UStsM3YwVFpVSWtPSU5abXJIYmU2a0pX?=
 =?utf-8?B?dEdoQzVkL3RaMlgyekZwLzBMSlBmempJUVZYWGxvajdjWUdoWk9yTjdQSi9L?=
 =?utf-8?B?a0VUL1ZlR2gyakNEWFJBcW9vM0w4MkdBZmdlbXpxb1htL0tUVTdvb0tqZ1R5?=
 =?utf-8?B?dlZuY2tHdWJsR3JubU9saWM1RHJwUzNqUFFGd1BxclRsRE5ibS9wWTlIM3k4?=
 =?utf-8?B?cWZwL1h0TFNmRkhlYUorc2lWOEZtSlZ3L2N0OVBLc1lXS1hMQm5nSW93OUlX?=
 =?utf-8?B?cC9ya1ovbEpScVFHTVRSVGtKRFFvWkJkZEFsTEs3cVpmSExiajlmRjE4Wi9j?=
 =?utf-8?B?c29jN1dSRHpTdGMxSnVyUk1nVEYxYkpVZVlTNWZnQnlrcTVzTk4vaTF6Y2dI?=
 =?utf-8?B?Q2k1dDl6TmVKWFRPNk9aWi91T0tCekwxemRyTnhqSzA2WGE1ZFRFU1E0N1Q0?=
 =?utf-8?B?TWY0ZzAxN0ZmYUZ1YVYzS0lGNE9SM1Y1d2E0RzJua1B2SW9JdG5MeDMrSGxw?=
 =?utf-8?B?TnFsSG5DdXY2eUJwTDBheEJTZ1pVKzAvVEl4cjhITm1OTVJpcEJDV2NvaDIz?=
 =?utf-8?Q?sYrlj6Vbo0g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWh1ajJOb3pRYVJoc2tHU1JhUlZ2Y2E0RjZ3aS82aVErZEo1Qk9qOUtwRmFD?=
 =?utf-8?B?bDFZbHZOK3haUVNXYjVPdHBKcWpteE5FeXFlc2dIN2h6Y1ZNY2FYdG5rOXdO?=
 =?utf-8?B?eU55c0RSemNQQkJHM0xHb0llQUZQQTBOQ2pSNEgvYlgwZEI3VVU3Z0Q5dm4r?=
 =?utf-8?B?QWpxZGlLYWNUOFoxWXVybkl4QnBEYlNtcUM2T1pYSWg0alByQlhRZy9QTCtP?=
 =?utf-8?B?d2ZMYnJkWjBDUyt6dnZmejVVV0hsdWlSSkt6ZWNMaW1qUWVvcEJ5WkIyNnJw?=
 =?utf-8?B?VzF1MWRZT2pvUjNocnFPaU9lb0tjZmdRa0FuY0hkQW05UyszWWRZcXpTdmx5?=
 =?utf-8?B?aThqTXNzWkhYRFNNWkRpRlBvdlpXRWNHZ1NtU3F3OEVTV3Y3Mi9xVVJNejYw?=
 =?utf-8?B?TFVLWk9DalpocEdHaXpMQVdCYzYxdjI5c0xVeXA0bElzeE1ES3RiOXcrY3FQ?=
 =?utf-8?B?QzJwcloza0g4M0hwZjlhWXlpNFZtZTB6ZmdoYVVjdGpvUFZiVGJnUEVrOE1T?=
 =?utf-8?B?UnlhT1ppNmV2bjRhRVdVSVVlZmFYcGhmTXpYT3NXUmZTYktZemk0RGxmeENK?=
 =?utf-8?B?NDlpNEZ1bkhBdEpvMzFmMUFPSTRTRnl0b2lCMXlKdE8vUDZvQ2lNME44SGNh?=
 =?utf-8?B?R0NiOHV3LytqazNQbXd1bWlKdk1sVEJkRzVON0IzTjVMRjQ5TEdXMlg1M1ZY?=
 =?utf-8?B?QmxUQkRxNWw1bGdtQzFleXFxUjNJWXFPUjVCNGY0MFZWM1dYNC9HaXppS1F2?=
 =?utf-8?B?Q1NHNWpuS2piam5tMVpQZUVWSHZjT05iUmxIUGRTWVZYRy9QVENMdmdkWWxs?=
 =?utf-8?B?dC85aFZDT3F3MncweTdDc1R6dERUN1VadXNJM0hzeXI2QmxkSzBkN1dPZm05?=
 =?utf-8?B?bE1CNGswbzJNVTY5M2o0T2cxV0RuSEsxOTZ3MGlnaUd0TVhmbG5uVmU1dzRM?=
 =?utf-8?B?SHkvL1RzV2M5QVo5TGx4c3E3TkxHVVEyNXZucnZQczROZnpqcWRnbnVVSmpz?=
 =?utf-8?B?SGlHSktlbFMrSTc1NllWSEcydThVK3NtcnVDaHJWbFhqSEVMN1ZMSkd6SVJm?=
 =?utf-8?B?MVdnZzN6SGU5a25OM01UajRta0RnZGZuZjg1dDRMWVprZG9oRU9JWGFaSGRJ?=
 =?utf-8?B?aXFneXg5UVF5UDlEcS9tbk53ZE1HQ05IZ0lnZStDRTRrdjQ5TUhyQXpDaCtV?=
 =?utf-8?B?M2hKcXNhUXI0eFRpSGJNRWFTLzJ0U2RkSXMwMWJ2QWFEbUwyMTU2NEJkYkdz?=
 =?utf-8?B?NU9IZ05pV1RvVnNZbWtJQXFGS251YmVPT3RpZXg3M1dHNThwZjJFUUtBUElh?=
 =?utf-8?B?bnNyYmpVRHBDMW5LMHA0TXZHS0JXalZRNWU3ekxLTStGU0ZYejdyYkxaL2VI?=
 =?utf-8?B?MzhxVS82L0h0dk9VT0V3c0NyZklONjlzUEs3QmFvUzFkbmMveVpyN1ZLRmd2?=
 =?utf-8?B?Y01BdFBXNlAwQmFkR0JUZ1VlKzZwQTM1c054Zm1yVHY5WlBjZXljK3RIdG1T?=
 =?utf-8?B?ZVo4bjlSVVhEbzFPVzloSW5TV2JNdnp5cmZ3NDc3ZGYxY3Z3Z2M0SWpxS2xi?=
 =?utf-8?B?UTlHeVAvZnJOMDhUU2c3Z0Q2SzlJUkYwUDNIV2xlVmluY1RKdXY5ekM2a3ZC?=
 =?utf-8?B?WFFRT1hkcVJtNmtUZlBBU00rTGswdnFNZy8rMmliaVovREovMW1XcGJXbStj?=
 =?utf-8?B?LzlmbFZGODVZUy9UL3dld3RWVFpZMVFnNEt2bzhHWGJWTXk3anc5d3lPY0FV?=
 =?utf-8?B?ZVovUzVoOVNKa1ZJUEw0NjB1cllOS0ZtY2E0VGJ5UHp0QmIzVzR0Y1M5eEpQ?=
 =?utf-8?B?Q1AyWFY0QXNlQUl2MGdrU3BmRzNUclNWbU1VS1h1Wk9OKzNJdEJlMmNOTldI?=
 =?utf-8?B?OWpCUkhrYlJHVEVCbkd5N20vQmRmOTFYY2pqWDBPemlVaUVhYWQ4bktqZVBX?=
 =?utf-8?B?YVF2djMzdmUxZy9OYi9ZdE5vV2JXbDdicE40QzJUbnNwZDNIcmJNNXRreEF4?=
 =?utf-8?B?bjNGWVpmYWd3bGg5b2JaMGVqbnI1NXdXbzdzL3dGSTNZaUV4VXZNNEh3QlNm?=
 =?utf-8?B?NnZpTDF6Q1kvN25JUnhpZTRqdDAreXpXVTdUY3lFdURUUTZyUEVyemowRFli?=
 =?utf-8?Q?uZFA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c18c13a-c293-4889-ef55-08de0a3ea87f
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 09:55:36.7946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAoSmOKGUyLr9EgZWzMmDrLDa9ff2PU3OywaeFWYEd3hHZ9TG+C7gBmpIMxlY4o3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8075

Thanks Sultan.

On 10/12/2025 2:08 PM, Sultan Alsawaf wrote:
> On Sat, Oct 11, 2025 at 05:30:43PM +0800, Du, Bin wrote:
>> On 10/1/2025 2:53 PM, Sultan Alsawaf wrote:
>>> On Thu, Sep 11, 2025 at 06:08:45PM +0800, Bin Du wrote:
>>>> +
>>>> +/* Sizes must be in increasing order */
>>>> +static const struct v4l2_frmsize_discrete isp4vid_frmsize[] = {
>>>> +	{640, 360},
>>>> +	{640, 480},
>>>> +	{1280, 720},
>>>> +	{1280, 960},
>>>> +	{1920, 1080},
>>>> +	{1920, 1440},
>>>> +	{2560, 1440},
>>>> +	{2880, 1620},
>>>> +	{2880, 1624},
>>>> +	{2888, 1808},
>>>> +};
>>>> +
>>>> +static const u32 isp4vid_formats[] = {
>>>> +	V4L2_PIX_FMT_NV12,
>>>> +	V4L2_PIX_FMT_YUYV
>>>> +};
>>>> +
>>>> +/* timeperframe list */
>>>> +static const struct v4l2_fract isp4vid_tpfs[] = {
>>>> +	{.numerator = 1, .denominator = ISP4VID_MAX_PREVIEW_FPS}
>>>
>>> Add a space after { and a space before }.
>>>
>>> Also, it is more common to see v4l2_fract initialized without specifying the
>>> struct member names.
>>>
>>> To summarize, change to `{ 1, ISP4VID_MAX_PREVIEW_FPS }`
>>>
>>
>> Will follow your advice. Seems no explicit description about this in "Linux
>> kernel coding style" and both spacing options after { are common in the
>> current kernel code.
> 
> True, it's not explicitly stated in "Linux kernel coding style", but it _is_
> specified in the .clang-format [1][2] via `Cpp11BracedListStyle: false`. And in
> my experience, it's much more common to see spaces padded inside braced lists.
> 

Thanks for the reference, yes, will add space pad.

>>>> +};
>>>> +
>>>> +static void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
>>>> +				      const struct isp4if_img_buf_info *img_buf,
>>>> +				      bool done_suc)
>>>> +{
>>>> +	struct isp4vid_capture_buffer *isp4vid_buf;
>>>
>>> Rename isp4vid_buf to isp_buf like in isp4vid_qops_start_streaming().
>>>
>>
>> Seems isp4vid_buf appears to be more descriptive, plan to rename isp_buf in
>> isp4vid_qops_start_streaming to isp4vid_buf, what do you think?
> 
> Either way is fine so long as it is consistent. It's just my own personal
> preference to use shorter variable names, especially for pointers, which is why
> I suggested isp_buf. :)
> 

Yes, will make them consistent.

>>>> +
>>>> +	buf->dev = dev;
>>>> +	buf->dbuf = dbuf;
>>>> +	buf->size = size;
>>>> +
>>>> +	dev_dbg(dev, "attach dmabuf of isp user bo 0x%llx size %ld",
>>>> +		dbg_buf->gpu_addr, dbg_buf->size);
>>>> +
>>>> +	return buf;
>>>> +}
>>>> +
>>>> +static void isp4vid_vb2_unmap_dmabuf(void *mem_priv)
>>>> +{
>>>> +	struct isp4vid_vb2_buf *buf = mem_priv;
>>>> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR(buf->vaddr);
>>>> +
>>>> +	dev_dbg(buf->dev, "unmap dmabuf of isp user bo 0x%llx size %ld",
>>>> +		buf->gpu_addr, buf->size);
>>>> +
>>>> +	dma_buf_vunmap_unlocked(buf->dbuf, &map);
>>>> +	buf->vaddr = NULL;
>>>> +}
>>>> +
>>>> +static int isp4vid_vb2_map_dmabuf(void *mem_priv)
>>>> +{
>>>> +	struct isp4vid_vb2_buf *mmap_buf = NULL;
>>>
>>> Remove unnecessary initialization of `mmap_buf`, and combine it onto one line
>>> with `buf`:
>>>
>>
>> Sure, will remove unnecessary initialization of `mmap_buf, but i'd rather
>> not combine because it is mentioned in "Linux kernel coding style" that "to
>> this end, use just one data declaration per line (no commas for multiple
>> data declarations). This leaves you room for a small comment on each item,
>> explaining its use.", what do you think?
> 
> Huh, that quote is odd, as it's quite common in the kernel to declare multiple
> local variables of the same type on one line. In fact, Linus has done this
> himself [3][4].
> 
> I think it's better to put `mmap_buf` on the same line because the type name is
> quite long, so declaring `buf` and `mmap_buf` on the same line makes it easier
> to see that they are exactly the same type.
> 
> Also, creating a new line for every local variable declaration would really
> bloat a lot of code around the kernel and hurt readability. That quote from
> "Linux kernel coding style" was added almost *20 years* ago (commit b3fc9941fbc6
> "[PATCH] CodingStyle updates"), so maybe it is just obsolete.
> 

Will combine them, thanks for the clear explanation.

>>>> +	if (ret) {
>>>> +		dev_err(v4l2_dev->dev, "fail to fill buffer size: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = isp4vid_set_fmt_2_isp(isp_sdev, &isp_vdev->format);
>>>> +	if (ret) {
>>>> +		dev_err(v4l2_dev->dev, "fail init format :%d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	/* Initialize the video_device struct */
>>>> +	isp_vdev->vdev.entity.name = vdev_name;
>>>> +	isp_vdev->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
>>>> +	isp_vdev->vdev_pad.flags = MEDIA_PAD_FL_SINK;
>>>> +	ret = media_entity_pads_init(&isp_vdev->vdev.entity, 1,
>>>> +				     &isp_vdev->vdev_pad);
>>>> +
>>>> +	if (ret) {
>>>> +		dev_err(v4l2_dev->dev, "init media entity pad fail:%d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE |
>>>> +			    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
>>>> +	vdev->entity.ops = &isp4vid_vdev_ent_ops;
>>>> +	vdev->release = video_device_release_empty;
>>>> +	vdev->fops = &isp4vid_vdev_fops;
>>>> +	vdev->ioctl_ops = &isp4vid_vdev_ioctl_ops;
>>>> +	vdev->lock = NULL;
>>>> +	vdev->queue = q;
>>>> +	vdev->v4l2_dev = v4l2_dev;
>>>> +	vdev->vfl_dir = VFL_DIR_RX;
>>>> +	strscpy(vdev->name, vdev_name, sizeof(vdev->name));
>>>> +	video_set_drvdata(vdev, isp_vdev);
>>>> +
>>>> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>>>> +	if (ret)
>>>> +		dev_err(v4l2_dev->dev, "register video device fail:%d\n", ret);
>>>
>>> No error handling?
>>>
>>
>> Not necessary here because the caller isp4sd_init() will handle this.
> 
> This doesn't seem to be the case; in fact, isp4sd_init() doesn't seem to handle
> any of the error cleanup for isp4vid_dev_init().
> 
> I started looking deeper at it and saw that vb2_queue_release() is never called
> to clean up after vb2_queue_init(). See my next comment below about changing
> video_unregister_device() to vb2_video_unregister_device(), which calls
> vb2_queue_release().
> 
> And isp4sd_init() calls media_entity_cleanup() for the subdev, not the vdev.
> So you need to add `media_entity_cleanup(&isp_vdev->vdev.entity)`.
> 
> To summarize, make the following changes to isp4vid_dev_init():
> 
> 1. On error starting from isp4vid_fill_buffer_size(), call vb2_queue_release()
>     to do cleanup for vb2_queue_init().
> 
> 2. When video_register_device() fails, do cleanup for media_entity_pads_init()
>     by adding `media_entity_cleanup(&isp_vdev->vdev.entity)`.
>

Thank you for identifying the missed vb2 queue release and providing the 
modification guide, will follow it.

>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev)
>>>> +{
>>>> +	video_unregister_device(&isp_vdev->vdev);
>>>> +}
> 
> I just noticed: isp4vid_dev_deinit() should call vb2_video_unregister_device()
> instead of video_unregister_device().
> 
> See the comment in include/media/videobuf2-v4l2.h [5]:
> 
>   * If the driver uses vb2_fop_release()/_vb2_fop_release(), then it should use
>   * vb2_video_unregister_device() instead of video_unregister_device().
> 
> Since vb2_fop_release() is used, vb2_video_unregister_device() should be used.
> 

Yes, vb2_video_unregister_device() should be used in this case, will 
follow your advice.

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/.clang-format?h=v6.17#n61
> [2] https://clang.llvm.org/docs/ClangFormatStyleOptions.html#cpp11bracedliststyle
> [3] https://github.com/torvalds/linux/commit/fe673d3f5bf1fc50cdc4b754831db91a2ec10126#diff-b7746cf0f2ab471c30d08fe3391b7d3ba45adbe7616e4fae0504b29f40b49dd5L1747-R1747
> [4] https://github.com/torvalds/linux/commit/d7fe75cbc23c7d225eee2ef04def239b6603dce7#diff-b8c8d3c5770869f743e155faac7cccc97082918c3e092ffdf592efa796725c79L2019-R2019
> [5] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/media/videobuf2-v4l2.h?h=v6.17#n360
> 
> Sultan

-- 
Regards,
Bin


