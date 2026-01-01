Return-Path: <linux-media+bounces-49813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BFBCECC0A
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 03:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7269230115D6
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 02:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24F628727C;
	Thu,  1 Jan 2026 02:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="aCZ+scmO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982711CEADB;
	Thu,  1 Jan 2026 02:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767233041; cv=fail; b=EvqDoAIzoE7gHeXi8hLiHnN9mYxECxKb7aFEhT4BCjW3hMMBJIXwGo0EGGw8CBJuKZLxer37cQOQnXWqrvE7pbWf6FzjQkC2ctgzfhPtPAZz4csNwGjvT+F7Kg3bql7/WKRlTfVHSb0utIOimX6dytgBTuhvICbt0FmcEMTG7GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767233041; c=relaxed/simple;
	bh=ymFx4Tw79+Z6kQIBeF2i20+VyMmkLv1oQo0V2go0704=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aJ2NnSOpUKGYFAnTNJ/GP6g4pTJ6DXmATsXFdUN+xuvnV2wBf84fLtQR4EENxtGe3gwN6Bkc3GQ4lL5O1N2vT7Ckb5eb1u6ocaLVJd4tE1Bw1jBj0mfkBKmtxqUBRaSoVK8HcT2zJU8SMaOA8+6ZWnpAb5pUjpnangmN/Zhkr5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=aCZ+scmO; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6011w4Cw3318515;
	Wed, 31 Dec 2025 18:03:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=XOfSeDnZIcaYnnkJen9r+ds1kdZ/kasX8HEDFvX4xAI=; b=
	aCZ+scmOvMKEBe1mojP68YBVHPsncD8Ir4MPVDkUn/62DZW6LK1G4+qYWFb+16j7
	8jWcuApniFK6dycsClJqFRDZsrS3y8nfJOv2Ll3JcqUy4MVsEC3QHZzvm8fKSCh2
	mWqfcdMzSUj7Ni2+DtlYIIKoAjoJby+4ZpFZoCifuXlxioJmdgr0RIlr7iRmAfRs
	gkkmbMfWS814b6vy5JeCge6/aCdoS8/poWTXsYD1fl/vMpUwQhPKBrWoWzq3n4Ai
	Tj51OkyZ3TYQSS+7wqtkXgxec+XWKFrsByo8HSbWwNCpQg9cqtOZaxlGnihPkeQJ
	iRuLQJVcusFwUKS76G/Vjg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011019.outbound.protection.outlook.com [40.93.194.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafukc39u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 18:03:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cf+wV15eBlvAsw8sWBm3U2yrfDT/B+0+xmMcNnOlz5+Ad217q2joFICHnuV73YJh0m9iX/gw2ssJJRie1niVNQQCAQhbVoQQuWIWx93nJMxsxAflWvbREzPx1yyd1yWFN6/PJx8oG/rkt/c/maMbqmZzLa8NJ0CVJjEiR50+inyGrV8acZacrKXFf5+kSuS4b4zF6bfw3zv74Fl41L5e1SZERSDfQIC8TQ4+FAoMAK/+KkXyBdOrvCZOtGCghI6eWqvSkosPM866R5u0Gy9J03aHfeLs94eh80U0kiuUYarRzTVu+rIuRyjHpc+nU6i3vSsTZTaFWgShj7teXEQxxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOfSeDnZIcaYnnkJen9r+ds1kdZ/kasX8HEDFvX4xAI=;
 b=QHmMU7vfNHnz8P10f4hDd2r637Dp3X6oVZUVe34QVYNL0Jb3RgJzRCh+ULEZMNJI2vcA46DjnF+1FxSSwpmpPG2gLRZf63uefXb8yAWbTtOCv6ow+9Mya5MGj01DfF7Av/7b/VfvaOxfB2tQCOyoYGCxAKNALP/a7A3S+cpyH6UdeJvQ/g2wv1Jc4oFjuUhUnC4LhY6+zUbKCzLRKRo4Fuqi0lyWmo7m+MsAug1BpXrxPPWUwpHZZWZMThrYjcgnQy7sAyiZxpwnf5X/Cw4geghEg+B+mQgJifBslUY2K0/+js6DvWKf6CTF8j74xBM7DruGryhOwrMtsIRRwTMkEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by DS0PR11MB8069.namprd11.prod.outlook.com
 (2603:10b6:8:12c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 02:03:32 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 02:03:32 +0000
Message-ID: <5d6fbe99-e281-4ae1-b2b6-37cab726143c@windriver.com>
Date: Thu, 1 Jan 2026 10:03:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: i2c: ov5647: Switch to using the sub-device
 state lock
To: Tarang Raval <tarang.raval@siliconsignals.io>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
        "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "jai.luthra@ideasonboard.com" <jai.luthra@ideasonboard.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251231083924.2657165-1-xiaolei.wang@windriver.com>
 <20251231083924.2657165-3-xiaolei.wang@windriver.com>
 <PN3P287MB1829901790B279AFE53375408BBDA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <PN3P287MB1829901790B279AFE53375408BBDA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::15) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|DS0PR11MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3ce919-abb1-4175-2c3a-08de48d9f700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qi9WZ3BkVEJ2MEp0UnJOVzBGV3BSOXZQTlJuMkIzSHQveGxxblRWYnNtdnhx?=
 =?utf-8?B?OGtxOVVUdlVYR2NqRitOOTFvclhNWllpcDNqaWZVWXpvdWxNN0h0NFhPWVp1?=
 =?utf-8?B?ZVNlWmxmRGtvZWdoL2g4Z2NYVmZsZ2RheEhwYWNYYjZEWEFsVlZ4Qk91N2ZK?=
 =?utf-8?B?MVN1cWRUSlpjdVozR1NwWHZZdnkwK1dkTlB2ajdMSFNtL1hiNFRoTmJLbHZ3?=
 =?utf-8?B?TGZIdFVjWlVCVjNqR0UvVXVuOUxiZEJPN1VZazZOR2JGME5OSWxDYUlvdUtN?=
 =?utf-8?B?bmIwY0VaN2R5aWJNeElxcHp5aEt6WEVRTGlVbUtGWVBsOUhWQkRMbTRyNEIv?=
 =?utf-8?B?cUorYmZnclQrWDFXMGlUQWlycGVPU1FpZUprMjZtbmxBMW12YkRianNkc0Jh?=
 =?utf-8?B?dzlGUjRQTDh0OWdDbTFnSHRuUS9yeXA5S212T2NwbUJDakk5dnhXNDR2ckJu?=
 =?utf-8?B?RkpnUnFyamlpMjNTSWhFT2FFc0JRdzkwRXpzODRSV0F3RjdNek52U05lTDZt?=
 =?utf-8?B?MHhtUTNOMVNqcnp5RlFmOEo1TmhJN3VLQ3pXb0Zzc1B5dFpTNUJzQStJNEt4?=
 =?utf-8?B?cUNqTklVY09DRTdMbUMxbkl3ZUV4aG9rdTNOelJ1Sk1JVVhKYTFhNGd1WC9K?=
 =?utf-8?B?QU5pc1FRbjVHS0ZzSEVyT2JKdmNhb2loMWZEaHZkeGw5OTFYZHBzUWEyWmI5?=
 =?utf-8?B?b2tkejM4bExFV3pjWWtidmc2UXhoNmNHalZvTThaMGJsbXEycy9QRFcxNDJs?=
 =?utf-8?B?amhwZGdpY3FhUkxjYXdmRS94S0dyc3BBbkZFakl5RDJ2WmFLNXh1MVJlWVU5?=
 =?utf-8?B?OFJqMUlJVG1sSXlxbC9rWFk2QjArRmFmVkt2RDBvTnVEZk9SRUlVYXlFc2Q4?=
 =?utf-8?B?T3JEUTB2anRyQTRUeWtTVG5DWjhHeG53TG5vcW9BUG1uL0owZ0JDMDJreU1u?=
 =?utf-8?B?VC9hUnR3cTVtMkhZK1llcXo4OHFQa1ZtZXFhamM2N0RtMHk5dmpaYzgrL3Uy?=
 =?utf-8?B?V0lkV2xRa3FEMGJJNjMzdEF3UEIwbTJURjdxQ05lN0hxajNnUWRPOEx4R0d2?=
 =?utf-8?B?cHlVQ3FzNVVRYUkwdHRlZkc2ak81Y0l5eHFQTkoxTkx1d1ltc3ZCU0NCdy9J?=
 =?utf-8?B?ajFYcWtxMS9JS0NJY2JJaFRJWXZsczNzSW44RW9VMFZMRzl4dXg2NTE5ZDFq?=
 =?utf-8?B?UElzQ21jZVBnNkJ5N0J1eEJQYStibWI1czIrc0FmSWZJejhOd0hXQlFxWnBz?=
 =?utf-8?B?Rk5VSHpoTWJEclB4eWNSRHU5Wk5LdzFObXBNb2pkMEk5TDlveEhPR0p5UVRF?=
 =?utf-8?B?aWhzN01TSy9XbGdPWjNJSlZjSlcrNGdvRmQ5L1BFVEJyUXExSmxNdUFZcitH?=
 =?utf-8?B?NEdhSHNDMTVVS00yeU9PMFNIK3I1OGJBcGhFbTlJNkZmVHlHOXhIZ0twa2Vl?=
 =?utf-8?B?S0dWRXd5aUZ2YVB6SWVwYnRWdHV5a1VDa3N2MjZibTNtVTlQUE9GWVNJODRZ?=
 =?utf-8?B?cHNmUVV3bTFZQXBWZ0xPcmpVbmNOUVFjS0cwbjlPZ3RkR2tqZUNqaXBzMmZ0?=
 =?utf-8?B?RnpZcEE2YTAzeFNDakxKZHhtVm1VS0x1UVZMY0pNVXdXbk5QL2ZRTU1lK1J4?=
 =?utf-8?B?YTZldWY5QXl1MkIrNm9lSjNSU0cxWjZPT0R1M2F4dlNOREdyV1U3SEZhMjVo?=
 =?utf-8?B?c2QrQU0waWtJbmR4c1JtNUJsdXhZV0VzSzJNK25GMHQrRG9kVlI4Q2JWRjRl?=
 =?utf-8?B?VXM4QTNRYXpPbVBpYTA0VlQ1ZDZ4TVRLcVozYlFmbjgvNHpUVVhJQWJsOTBQ?=
 =?utf-8?B?UStGbXhNVUEwM0RHZ2JNeGw2emRpVE9sTkFNT1hhSU1pU3QxZ1dQTnRrUStH?=
 =?utf-8?B?c0lrUnVjMjUwVDBmK2ErcW43NE1wYm5uaWhySkxROU9qOVUzaWExMVZKNCtE?=
 =?utf-8?B?NmxtZFNtVjM2ekVVdzJ6amgvSmlLaTFST0FGcDIyV3p2R0tzbUtFU3BUbnZP?=
 =?utf-8?Q?Eihh50v3Yx9E/snGA5zExIlzq6yzPE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3hXQm4zU2hBd1hsckQ1OXNiTDJLOHh5Tm1IK3Y4SEI2QW04a3hmV1hPRFdE?=
 =?utf-8?B?Z3JuV2FoR0lEZzk5RUl4YWdlR20wVUNGQWU2cFRSSFJPb2tVVyt5aTg0NzRF?=
 =?utf-8?B?SFFHSHFRYjdCdm5KYWhUR2xiWm5nbHZ1Q1ZVbDk0ZUwzK2pwRWVOTDZvajI4?=
 =?utf-8?B?eUxJVzVlSGpJMUt4d3UrY2h0aUZwWjM0b0FGQXh0aFp1YWg0V1F2UmxQdDVV?=
 =?utf-8?B?VDY0RTcrVXhaazArQWpNVUdaa3RYWWhkRjIzUEZPeWZMMlBzaDdKa0dRZE14?=
 =?utf-8?B?RzN1SkFzd0dIK1VVUGs4Zjd4K2UzNTFLTEtaSTBVS0ZRVTdvT09iSnN2d1ZV?=
 =?utf-8?B?aG9IbWZHS0dZUVZMcGwzaHoyZkdFTGx5Wmxldm94c1Z4cERFSUtUWS9HSEFF?=
 =?utf-8?B?ZGRXRzdidkNGTHhiL09pMVU1KzgvREkreFJ6aTZsUVQwdlp4dHc5eG5DN0Rh?=
 =?utf-8?B?RWpqMkpvVkpsTjhWb2NqY2VKMnZrUHZ4VTZJTTZTQm9GeHJIWDdvSHV6N0xS?=
 =?utf-8?B?STBpbUsyUTEvVVdEK21PSTVZdi96U0dNMTFERXFwbktoK3ZUdDZ1Y1lwdmNX?=
 =?utf-8?B?alNNMWFWZE5qUENwYVowVHo0OVVVUUw3aFBmL2hiTXcza3pSRmdjdHc3YXAz?=
 =?utf-8?B?Yi9RcDl0UXhGazNQMGorVnNiMnRudXYwZFBjZHhWWGU1QjE1YWFTRjFTajFC?=
 =?utf-8?B?bnhwOUhOcnJQdE9FR2JDZjM5cHFHU0QrYnhTTW8xeTNBaXV5ZEp6RkhFM1J0?=
 =?utf-8?B?UzJFT0RXand2Q0hPZUhoZFNVNGllcDVkdXJxY0pZWXpVMllIMmQrWmtVS2NS?=
 =?utf-8?B?RGFWVVJ0UTJJWTlFZW91dUk0VUR5S0FhSlg5YS9NZ1V0bjBzQ3VIRWZwMzBI?=
 =?utf-8?B?c1pqM2Q5V2F3YW9seG9jaGNaL0ErRG9ROTQ4L3k3RFZIblZSQkRncm1xaGJi?=
 =?utf-8?B?TzBNRnlrQzB3OTRaRVNVSUFoN1kwZGpZaFd0Zk1IVERrcURuZ1l3c2xRSndE?=
 =?utf-8?B?R0tCcUpIaVlVWFBkMUlYczNVVU5IRXJZenMwY2drenRQYnZ3Nkt6bDk2RXdZ?=
 =?utf-8?B?bitJWHFnOXR2UWFNcldsQ1YvdVJRSitKY1Mwd3Q1V0JqNnFHNlFMdlhYK0F6?=
 =?utf-8?B?ZXhCcGQ5L09JL1hTRXFqbHhpWjdyS1JIQkd1V0tkVVRXbS92cWdWVm91WkQ2?=
 =?utf-8?B?eTB1akpyWXc2cDE5ZDZHcGg4Z1lTY3Roa1RlaWlZbXVMUjMyNDZhcno5Vm95?=
 =?utf-8?B?WU1lbjdRSURXYWxnYVlaSTYrS3RGZEcwT0hiNU0zOXFNbmg1WFlWZmdUM2NH?=
 =?utf-8?B?S2tQSW5hTy8wYkhsdHdMdWNSbkJDTTdvcDBDMVlKTnlaWlJpRThwenQvRnJq?=
 =?utf-8?B?VGp4TmdYVEl2eUF4ZElpNVZCWmp1Rkg1WG5DVUh5ZzNQWkV6Q1E1SEVHWTAv?=
 =?utf-8?B?dEtPUVZlWlVXeXpPZHk1UGN2bkM1TGdxelF2SHJ6QVpGNEdzY09xNzJidUFh?=
 =?utf-8?B?MExuNEVLci9POVpZeWFEWW8xSFlxZkNpdXNvbXd6VlZhc29iVjRmYWQ0aHRL?=
 =?utf-8?B?U091bVcwYU1nZGVzY1E1eUZwVHBjRDdwMmtxazhsenBOWllSSnc5S1ZiRktn?=
 =?utf-8?B?ZmtsYjRRN3pPZjVrczVlbVNuNEE0Mm9GNTNqNWxiQTU1NCtVTVdQN1NZemoz?=
 =?utf-8?B?NFYxb2pWVWlhVmZralEzUEhsNGRtdXEyRGVOVVZ6M0lJSytFTnNFNVg2WHc1?=
 =?utf-8?B?bkk4MFhHdkw4YXVhVTZ6eUVxQWY4YjZKYmhxQTEybnJUQVlhTENSMTkwUVFx?=
 =?utf-8?B?Q1VGRkpkTStLMElDbWtxWEIxWjBlOGlJWUZKYnlxTkdmUWlwOWxwekVQZ0hW?=
 =?utf-8?B?aERYZVRoUmJpMjlGRHRENVlYbWlvb3U5S2tmOHdZOGhJMEF4WVN5K2RBWCth?=
 =?utf-8?B?eWx0SGhqcDJKUW5XTUs1azVITjB6ZzlZR3FhV1BaRTBJVWg0d1FqUFc4emRs?=
 =?utf-8?B?SktNeFo1YzhrSlF2Mm93cUxQY3lIcW93M1ZsWG1SbGdsbE4rR3E3SXFsalBX?=
 =?utf-8?B?S3ZKSFgzZkRjTkY0bmhxYy82cFVHVTByaWVMazdxZDExMTY1MytveHV4TWZ2?=
 =?utf-8?B?ekdoQXE1b2N5SXNqWC9pUFpzbERrdk1iMUlDWUlXY3F1S1h4M3c0anFxWjlq?=
 =?utf-8?B?K3ZxS3VCQWlhbC9aYm1yYTZqVUFKYm13VjU5bEJnVVFiVFlQdERnbmgrYkVZ?=
 =?utf-8?B?TVRYTDNVcjd1cURncTVHTjQ4dE0vcGNIS2VIVklBTWpGTGViK0JjNG1RRmVC?=
 =?utf-8?B?dCtOaG5OYmlpL05HNGlKSVVxWm5sN0NWQ043L1hRVi84MUNSTzF4ckc4N3ZT?=
 =?utf-8?Q?Xcgp3m4Q1HGFeXeZItJUnramSr95nevnr+oixYo5fZuel?=
X-MS-Exchange-AntiSpam-MessageData-1: ysQ2G5Gfpx0vk9viUCVVKdzMMlCQExWhV7I=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3ce919-abb1-4175-2c3a-08de48d9f700
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 02:03:32.3441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGGdCI7YuwjKydGHl6Xdp7NmFT4zb+4ObfeXWJIHNvx9R7hpmzkAlAZrh7SxImfYhnlsLKMPNliPuGQvBkLjvuTD3ZXFQMItKxWBaTiiNZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8069
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=6955d5f7 cx=c_pps
 a=FOw1GTnNYXmOwZ/eduxC4w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=29NGGcOtenc5NKHxvQQA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7z2NyWYiWbPoHUC-C5JEf5r2SXLHrzaa
X-Proofpoint-ORIG-GUID: 7z2NyWYiWbPoHUC-C5JEf5r2SXLHrzaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDAxNiBTYWx0ZWRfX4O4NAOEVcqAl
 pD5SFBRcJDiQzn1lbFrT8H7EGkgFy1cYGxu7cJwyb/W891/vCXYPeZcTSvTx6nCoffFwiNZj+RT
 r47mJtfpnv87ohD53PIfArUYMnsUw7g6sgnt1wdqqgQFRjj/9MttcS98Vs9yL/aA0dQ5pCAyAEg
 Kz46z3pdAwJTpQnJnyup2JmCQXc49EZSswx+dwkmdFL9KsbMRb9SuV/vaLS/W+GY1b6GP9LCffv
 nR7/0SbIf8D8XMLt64CCRrEpXS/k7MLxFvJIvSt1Mbby+1swj0SSQqpkBwHpteDIdwykk4JW/mJ
 utxhM65DqjOoTdNRLCzm6No6b9IJjWxIyvlbtge1/1l4ZcDqaMWBRyVUtZfdiFxB0m4w5KsRZAN
 SE+umegwuQ2llekmuCMIusgRf1tM1qIVMYVX3VqHcH0BIMPdtXCr2RGvKyEL137a6U9ZCMlHcOH
 V7Pup0IG3dWlhSTtWtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601010016


On 12/31/25 18:54, Tarang Raval wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
>> Switch to using the sub-device state lock and properly call
>> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
>> remove().
>>   
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/media/i2c/ov5647.c | 37 ++++++++++++++++---------------------
>>   1 file changed, 16 insertions(+), 21 deletions(-)
>>   
>> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
>> index cbcb760ba5cd..bc81f378436a 100644
>> --- a/drivers/media/i2c/ov5647.c
>> +++ b/drivers/media/i2c/ov5647.c
>> @@ -92,7 +92,6 @@ struct ov5647 {
>>          struct v4l2_subdev              sd;
>>          struct regmap                   *regmap;
>>          struct media_pad                pad;
>> -       struct mutex                    lock;
>>          struct clk                      *xclk;
>>          struct gpio_desc                *pwdn;
>>          bool                            clock_ncont;
>> @@ -807,10 +806,10 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
>>   static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>>   {
>>          struct i2c_client *client = v4l2_get_subdevdata(sd);
>> -       struct ov5647 *sensor = to_sensor(sd);
>> +       struct v4l2_subdev_state *state;
>>          int ret;
>>   
>> -       mutex_lock(&sensor->lock);
>> +       state = v4l2_subdev_lock_and_get_active_state(sd);
>>   
>>          if (enable) {
>>                  ret = pm_runtime_resume_and_get(&client->dev);
>> @@ -831,14 +830,14 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>>                  pm_runtime_put(&client->dev);
>>          }
>>   
>> -       mutex_unlock(&sensor->lock);
>> +       v4l2_subdev_unlock_state(state);
>>   
>>          return 0;
>>   
>>   error_pm:
>>          pm_runtime_put(&client->dev);
>>   error_unlock:
>> -       mutex_unlock(&sensor->lock);
>> +       v4l2_subdev_unlock_state(state);
>>   
>>          return ret;
>>   }
>> @@ -886,7 +885,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
>>          const struct v4l2_mbus_framefmt *sensor_format;
>>          struct ov5647 *sensor = to_sensor(sd);
>>   
>> -       mutex_lock(&sensor->lock);
>>          switch (format->which) {
>>          case V4L2_SUBDEV_FORMAT_TRY:
>>                  sensor_format = v4l2_subdev_state_get_format(sd_state,
>> @@ -898,7 +896,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
>>          }
>>   
>>          *fmt = *sensor_format;
>> -       mutex_unlock(&sensor->lock);
>>   
>>          return 0;
>>   }
>> @@ -916,7 +913,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>>                                        fmt->width, fmt->height);
>>   
>>          /* Update the sensor mode and apply at it at streamon time. */
>> -       mutex_lock(&sensor->lock);
>>          if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>>                  *v4l2_subdev_state_get_format(sd_state, format->pad) = mode->format;
>>          } else {
>> @@ -945,7 +941,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>>                                           exposure_def);
>>          }
>>          *fmt = mode->format;
>> -       mutex_unlock(&sensor->lock);
>>   
>>          return 0;
>>   }
>> @@ -958,10 +953,8 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
>>          case V4L2_SEL_TGT_CROP: {
>>                  struct ov5647 *sensor = to_sensor(sd);
>>   
>> -               mutex_lock(&sensor->lock);
>>                  sel->r = *__ov5647_get_pad_crop(sensor, sd_state, sel->pad,
>>                                                  sel->which);
>> -               mutex_unlock(&sensor->lock);
>>   
>>                  return 0;
>>          }
>> @@ -1114,9 +1107,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>>          struct i2c_client *client = v4l2_get_subdevdata(sd);
>>          int ret = 0;
>>   
>> -
>> -       /* v4l2_ctrl_lock() locks our own mutex */
>> -
>>          if (ctrl->id == V4L2_CID_VBLANK) {
>>                  int exposure_max, exposure_def;
>>   
>> @@ -1316,13 +1306,11 @@ static int ov5647_probe(struct i2c_client *client)
>>                  return -EINVAL;
>>          }
>>   
>> -       mutex_init(&sensor->lock);
>> -
>>          sensor->mode = OV5647_DEFAULT_MODE;
>>   
>>          ret = ov5647_init_controls(sensor);
>>          if (ret)
>> -               goto mutex_destroy;
>> +               return ret;
>>   
>>          sd = &sensor->sd;
>>          v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops);
>> @@ -1350,9 +1338,16 @@ static int ov5647_probe(struct i2c_client *client)
>>          if (ret < 0)
>>                  goto power_off;
>>   
>> +       sd->state_lock = sensor->ctrls.lock;
>> +       ret = v4l2_subdev_init_finalize(sd);
>> +       if (ret < 0) {
>> +               dev_err(&client->dev, "failed to init subdev: %d", ret);
> Use dev_err_probe

I will correct this in the next version.

Best Regards,
Xiaolei

>
>> +               goto power_off;
>> +       }
>> +
>>          ret = v4l2_async_register_subdev(sd);
>>          if (ret < 0)
>> -               goto power_off;
>> +               goto v4l2_subdev_cleanup;
>>   
>>          /* Enable runtime PM and turn off the device */
>>          pm_runtime_set_active(dev);
>> @@ -1363,14 +1358,14 @@ static int ov5647_probe(struct i2c_client *client)
>>   
>>          return 0;
>>   
>> +v4l2_subdev_cleanup:
>> +       v4l2_subdev_cleanup(sd);
>>   power_off:
>>          ov5647_power_off(dev);
>>   entity_cleanup:
>>          media_entity_cleanup(&sd->entity);
>>   ctrl_handler_free:
>>          v4l2_ctrl_handler_free(&sensor->ctrls);
>> -mutex_destroy:
>> -       mutex_destroy(&sensor->lock);
>>   
>>          return ret;
>>   }
>> @@ -1381,11 +1376,11 @@ static void ov5647_remove(struct i2c_client *client)
>>          struct ov5647 *sensor = to_sensor(sd);
>>   
>>          v4l2_async_unregister_subdev(&sensor->sd);
>> +       v4l2_subdev_cleanup(sd);
>>          media_entity_cleanup(&sensor->sd.entity);
>>          v4l2_ctrl_handler_free(&sensor->ctrls);
>>          v4l2_device_unregister_subdev(sd);
>>          pm_runtime_disable(&client->dev);
>> -       mutex_destroy(&sensor->lock);
>>   }
>>   
>>   static const struct dev_pm_ops ov5647_pm_ops = {
>> --
>> 2.43.0
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
>
> Best Regards,
> Tarang

