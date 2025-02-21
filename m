Return-Path: <linux-media+bounces-26531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E19A3E97B
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 01:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB749424C4E
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 00:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A752AE8E;
	Fri, 21 Feb 2025 00:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ZLgnvd26"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02olkn2012.outbound.protection.outlook.com [40.92.43.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6171F94D;
	Fri, 21 Feb 2025 00:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.43.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740099274; cv=fail; b=Jm0YqaY5TZ0Njv2am2ib/8I0qM0Y/8BBxt5gejEjyeFg14/QQh/lhSC6dL9k+NZsVZVKz4vv7d3vpZMHGb2/X1RrDcosDpWAPENk+PCYKq0mdUmFZ2GyCpVlZUXCTn3bAETiEJD6Oei+PkBcCnc4TcY22nkogj4Pe4zjhZBwSa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740099274; c=relaxed/simple;
	bh=GJSaO3hARN5/DwdPWRL1Buw44aX8Zdupagzp1e2pKSY=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ABmkyWoMapgS95YHdVxmVlEMZnGk91A26U+RBwe0/4NlYrz3MKhHTSTPEAq6GdLEIEoO+/kR7u4wrYRRw2F8PW6qWQyaI7BadjfD6MAJIf48TsSkMVwbzuOahJdLgWTUlEFefGQn4GlwjkwJSUTI5xuev6UrDfCRLyrebmGXAJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ZLgnvd26; arc=fail smtp.client-ip=40.92.43.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZ8LrczRf6lkjt2umFlcJbqk3+PosmN3vuOcXQosu4DMW9P8k31SD2J9N1xZZHRN+n5Zle87nKAj2CLQ7VqcyHPmNUFmWTmTDEOievS8nlaWH0qN3cJejVr7Sbqb9Yzbgq+Rb/wS8+5yZD8c7YHGA0LqmedL8EJlvT4Qwgw/JxnbR0QLqlj9XafeSvEwraO6JDergAMNGOWOhRPOzhCLmJbUGMM3Sa7FPttWgAPUJnfCFTWwhSg/HMjUW0p9+lMRo60v7pFm0eXNI49hfYKqCc5xtbET0M0CuA3ytFYrTNgd9IWrMocKBc7xxx1bSETr30+m4FF83g22YH5hw5iPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJSaO3hARN5/DwdPWRL1Buw44aX8Zdupagzp1e2pKSY=;
 b=wyoQdFXIeTErjnPc0JQC0LJC+fybpsNn/rvMVFm34OSbHoBm4n+MGRhB0i4AtafBYahiMPD8mCpcPF3WNAHaDir7z80NQwT8QWFM+qaCbOcMgvK1qX+JSy6Sl8dLwLzObyookoABsvZP0wmm21gFhdKjWupWAxa5EJAyex0z4JkTQhde5pYNNuQjCgpfjYyD3wUK11/OvRSNDkzMM3/gJLr8Wv1lq2nKwRekx06QPHiAtYWTtXCe1UkJvAA47ZfQaLFnNcB1m6FhrSM2++cblF2O76Ycx37C/GG+4rOoojyoWPQ7m2TlCzHDwxOzxV9t7bZY4b9L93R0F8MxluQtVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJSaO3hARN5/DwdPWRL1Buw44aX8Zdupagzp1e2pKSY=;
 b=ZLgnvd26ZT3hgLdNv3gOrADHcH0Fq8F/MjtIaNn+CRWon/7FRL0MrBi+ecw+t01Jl3toCemJ9hB2EfNBT130S30ZTrtxWQF+8aL6YZ2tkDCEejkiuLoM82npvdxpwPvj1Bm7rtxz/TnHJQIIv0DWAzcl4oBjmN8NGu2hWHRygrTizSQKDe9IQzVuI5SxyioJXvAbgsCmTrJuAIKHd7ls+JzUQ+CFYvdB0qgHoHMEY7FxEZtTg7wSQ+PixBEktt3u53U4otePDEfUm3oDo3akE+1Cuji7hEIzGz0sCiltxw04j/lq0PeXw82Q/fXgVMyQL56JmmWJMYFygzXFTNkW0A==
Received: from PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 by DS0PR12MB8069.namprd12.prod.outlook.com (2603:10b6:8:f0::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.15; Fri, 21 Feb 2025 00:54:29 +0000
Received: from PH8PR12MB7112.namprd12.prod.outlook.com
 ([fe80::527b:a523:24c6:a1d4]) by PH8PR12MB7112.namprd12.prod.outlook.com
 ([fe80::527b:a523:24c6:a1d4%4]) with mapi id 15.20.8445.013; Fri, 21 Feb 2025
 00:54:29 +0000
Message-ID:
 <PH8PR12MB711248C9379A3EED49D05EBBE6C72@PH8PR12MB7112.namprd12.prod.outlook.com>
Date: Thu, 20 Feb 2025 19:54:16 -0500
User-Agent: Mozilla Thunderbird
From: Randy K <linuxish@outlook.com>
Subject: Re: Avermedia DVD EZMaker 7 video distortion on capture
To: hverkuil@xs4all.nl
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linuxish@outlook.com, mchehab@kernel.org
References: <56c81a10-4058-49e3-95f5-f8823072e350@xs4all.nl>
Content-Language: en-US
In-Reply-To: <56c81a10-4058-49e3-95f5-f8823072e350@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0462.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::13) To PH8PR12MB7112.namprd12.prod.outlook.com
 (2603:10b6:510:22c::15)
X-Microsoft-Original-Message-ID:
 <f015b78a-76c0-4c58-b63a-d580c1234737@outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7112:EE_|DS0PR12MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b3162e-3a0a-46ac-0984-08dd52124bf2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6090799003|5072599009|19110799003|8060799006|15080799006|7092599003|440099028|3412199025|3430499032|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjRwaGQ5RWNiTTRJMlZ2dXBXeDdrTktxMzRhUTZDN08zMmdiMU5MOXpyS1RF?=
 =?utf-8?B?ajVFbVBBVGpnYldZTFZCRjlhSFVWRi9FQXF3dWFJUml3VDk0R0lPM1V5a2VX?=
 =?utf-8?B?OUtHYjdCWDJTTXVRbW5WcFE1WmlHSGhNVU4vZ2pEYVhJQkVER2Y2d1pTZTky?=
 =?utf-8?B?RCtCaHRXNGt1WTl2RHAyNHJUa2l0cnFnNjNTR1hhcjRQTGNFdE01ZGY1MHRh?=
 =?utf-8?B?bHZOS0xsSmw4YnhaaWxtcFZSYVR3T25IZi8vdlpFaGhEbllpa3E1UHlxWWRH?=
 =?utf-8?B?aXEydkhoNnZiRnd5M3c2bzl4ZnI2cGErZjB5ZHNxTW83V2VLSHRIVGJ3Q1JM?=
 =?utf-8?B?elUvUkxpSjhRZ3NGOE1ZeDdQR1FLNE5mYldyRktRUU5LYXJvMkd2TXk5cTBM?=
 =?utf-8?B?aE9Pb2xpNmJxVTNWWms1emhud2hNVmxaV0pUQUMxMEZ3cDBDNEs4Zm5tUjJB?=
 =?utf-8?B?cm95RjBNYy9IQ250SnVDUnpRTkNod0VVdFJMSFNYTmFwcGtyRmUyckJmakkx?=
 =?utf-8?B?M0ZLVFdWU1VzWWdzend1Z1pjSno3UzRQR1NjZWx5WnJvQ21CZldNdm5Vd2FH?=
 =?utf-8?B?K1BHWGt5d0p5YXRqSXNqa05tdVI1QytUTldXTnNMQU9MSmlpWlJUbFRZYmhk?=
 =?utf-8?B?OUhCSDhQbVNLTERpMmJKOEV1bkhvUitJZzA3cVM2MWJMcC9aNW9EMFZjVlVs?=
 =?utf-8?B?NjFSVG5HdHhjbXMwNkhPb0tVYWZsNE9hR0N2ZjJEMUpIL3FTSnMrV2phaWhs?=
 =?utf-8?B?VmtWaDhRYWU0d21xbm0raFRvc0xRMmlROHh0MjZEWWI5UHZoaUVyblJ5d3Ey?=
 =?utf-8?B?SU5aVE5EQTNjS243MFhEYXlWR2dTdDhDR2xuU1FNZHQ3QUxRVC9SMkcvVS9s?=
 =?utf-8?B?UUg1UkdEdy9rdUM3SEViQjZoZjU2U21JU1NuTW9RUVV2ZnVEL0p4dWwwZVRR?=
 =?utf-8?B?U0pMOWltZjhzYkZJak55SXRNa3hRck9Rb25HWjJqdG5SS0FWM2ppOWFYb0lj?=
 =?utf-8?B?Ly9SS0lkMTRFME9HRElLaVFWWHNwWlN5Z1VLSk05d2hmT24welNSTWE0WTIw?=
 =?utf-8?B?WlVMVnVNLys5eDZwZ0V1ektDenZyZjRXbXZIVWZWZGsxTnB4cmVvUnFKcUlO?=
 =?utf-8?B?bHY0K1FpMCs5YXlZazd2TEduTG5QWGZaMnhNejUwZnZkUnByc3dHR29XQVll?=
 =?utf-8?B?ZEZ5eUpTL2h4eTFOMkpXN0J2WlVmTTFNQTFnTlRvTDBCOTBOM2d4MjdqVUhY?=
 =?utf-8?B?NlBzcm90M3luODcyWEt6MFpGL0hnZ0RPdnYzdERiRmRURTg0S1phdVhwQWJ2?=
 =?utf-8?B?MVoyNmJBalRmQzJ4SDB4QkxEM0dMeWhiMUVjdmFHRXhOUVhCYW1VcnNDMkRZ?=
 =?utf-8?B?WDRxb1Z5cDlQM2pmdjBJaDFXcU9ncmRpUDhESHRnY1lUZjJnQ2NiWGkvOEs5?=
 =?utf-8?B?cTRHYWNWSzIyS3ViQWxtNGZEM2FEMEs2Q2lkNHRPWFUxMlZIUmZtTTFwWHBK?=
 =?utf-8?Q?x6QZVHszWYqVbwigFEziWIUi/rL?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0tjT2M1cGllc21tN2o5M3hSR3FpTVNQZWx2QkVqeE1FR1RBS2x4ak8zVWh5?=
 =?utf-8?B?aXNUUytvaXVwRUFJUnhtZEtEL05PTERLSGFpWWJzYmZtOERDZ2ovd0I2b0xj?=
 =?utf-8?B?T2Y4NVVaTS9jb0IydjlNaE8zZUxiamJGVEZIVjBEUWNiZXRlUVlSY253cklr?=
 =?utf-8?B?bnZGSVFVczBVdlVlZytuZjVJdFZ2SXhUcDZsZGZvRm0rb2xHMU5TMWZXR0R2?=
 =?utf-8?B?YkpORDFxRWtwclRyMDJNdXM2Y2xJelAwODdBbFo3S0tXY3hzOFNrTkVYQkps?=
 =?utf-8?B?bHdFVGszNjVjcDduMkg0dVlkZjNtQm00bmcvNE9QWWRkSGZhQ0VUc2ZvZjNY?=
 =?utf-8?B?aW55Uyt4SHdDbFlRbWpodXEwU09FZUh2eUp3Qk1WejNKQTltYm5CUXJ5Y3NC?=
 =?utf-8?B?VStja044ZEcxT1JoTE5qZFcrWElNeEFsdHJ6WDEzY2UrQ1BxMG8wTXkrNmJy?=
 =?utf-8?B?SEZvaG5NZmVJNjdoREh2bmhUMVFNeG9HTnF6RDRTY1RsakR0M1JzalRncGNt?=
 =?utf-8?B?eHAwT016K3ZiQmdFaCtqY05Va054RlFJVE1kU1Ftak4yZ2taT01EVW43U3JJ?=
 =?utf-8?B?dXFaaUhGSmRYWHhMMHZjN2wzV0k3R21raERCZE40V0dKbGdqd2dTcncyU3RS?=
 =?utf-8?B?TWdnZVJWZEg4L2l3NmFxTGFlTDdjRkxrSmtkcXJpamw4SWdpZEtGQXY1Q2wv?=
 =?utf-8?B?bE9GT3ArSEJnYis3dG9oZ0tkNHRESWI3Q3MrUVJ3L0NwZWFaNk9FbjI2RHZv?=
 =?utf-8?B?VjZ4VFRqWFR1anVvSjZZbjJmOFFLVDBzaHIxdFV3RVRFNGdLK3RXcGc5YWFW?=
 =?utf-8?B?amRRaHhmMXo1eitaRFpmdjVDLzlnQ0YrZ2g2SEVYRFFqSURhNlFxcm1wSTlM?=
 =?utf-8?B?Q1Z6VVMvWDd1azBqSmdxbmJwTTQ5dkt0bnZ4c1NxeG84Wk5DTXE5cHpYdUl4?=
 =?utf-8?B?bmNHaTd3RGFBTDk4bE0rQzhWVm5lMm9uVVZVRDJaQ2dyNmxwRlNCVm05ekti?=
 =?utf-8?B?MWtzSC9QMDlBcGU3U1ZqeWYrT3VoWU4ycWw1M3p5bTJUa3RqbmVJRXoxWGdV?=
 =?utf-8?B?WkVibUduRHhyLzhsZUlta2RERlh2L2hoRmh6WUl0TVZydXJUNEl2Y1B4S1Bm?=
 =?utf-8?B?cnRxM1B6MXpyWGQ2dnYxQ2UyaHNTRnprS0IxaVBjT0s0Tm42SEhuMUVkR1J4?=
 =?utf-8?B?c3dnYWNzMDdVMlQrUjhlcVZaVFBiTmwxNlZqQkJLTy9laHRzc1BNOFhUVlFT?=
 =?utf-8?B?d2Q2VmR1czdhU0ZHaVNPZUJhU0FCWTRhVGlYdDRHRzZtcTBtN2FZY2NZNnlp?=
 =?utf-8?B?dkRxeHQ5a254VmlxcHZ5ZVo2YXFnS1hIdndrS3ZBc01WL1BEVW8zS3lHQ3Rs?=
 =?utf-8?B?RWVhcW9VL1ZTVElNdUNHRGZ1Si9XWlpxQi9EUXBWRU5obUsrRUdlWGdrL3d3?=
 =?utf-8?B?NTN3UnY4M2VIKzQ3NzFZc01OU2NBV09HT1hGenNaSGhBZ041SHhtdXBJTTBP?=
 =?utf-8?B?V1JZSm1hdHlTY2liRGpFMm0wRjZzbXMyeUxyd2dQNTdjRHRnRjBwL293dlZw?=
 =?utf-8?B?NzlkWXdXQ1J0MDNRbmVleWlRL3BQbDJKOUFCTzJGSkdOV1lJUVpKVEYwb3Mw?=
 =?utf-8?B?NDlNLy9hK0lMa1puOUpvVW5qVndCaWZYR21ObGN5V0lVb0pzUXUxS3YrM3J4?=
 =?utf-8?B?Q05VcG5sUDBtTjR6RzR2TlJYcEFjR1kvdk1wRGRKM29JemxJbG5acnFBPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b3162e-3a0a-46ac-0984-08dd52124bf2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 00:54:29.7836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8069

That would be great, thanks very much Hans, let me know how it goes.


Thanks again,

   Randy


