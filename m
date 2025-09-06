Return-Path: <linux-media+bounces-41912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89150B4763A
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 20:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43CE65A3C6B
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 18:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A2727E079;
	Sat,  6 Sep 2025 18:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="l+gQvgPS"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011035.outbound.protection.outlook.com [52.103.66.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266341F4CAF;
	Sat,  6 Sep 2025 18:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757184064; cv=fail; b=q2rQAT4cOF/pLMv+kZHMDJo1eSFNhvYwyoJu1Owe1z3OKcNGCTw3ngQAML+mAg8QuN2hq1WwbHtVDabC5irrRZdGSe2gqMKq5VSUkKUUtvTYlZ5WaOe8qyXers915d4jqWE/sypr0exRBDZrQoOiesow9cyMhsHB5cTS4X6MN2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757184064; c=relaxed/simple;
	bh=2gd7eOpbCpJ+lKSmdjaOxB3oFAt3nK/rx4n9Ayo+kJU=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qhF3nMQ2AL0TxsJshg+augoJ269IutqFIHPv1lksqjimXB2JuqdHJMzjpq4k02Z9paD6e2GYUQcj8XK65Zf2p+ivd9rT+4U0XcVBdVm6P5+L/al0XKKwwIFuj0aN3aAuaobsgLsZ1ybxJi6UhyPY8aPjE/loT8JJv3rKVb9Fru0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=l+gQvgPS; arc=fail smtp.client-ip=52.103.66.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jhh3T3fIHgsTHUDem3JDEaM4aYXQjQzQJCqfJ8LL4w/26iCsJ6L8O/JpuawhdzwZgICi1AqsAUUea7mhAIzqmbUVNhOr4aseu+g6sB89sqi0YXoFJ93rOAGlfw/lnXWe1cRBG4gb664gHlvrVV3eBC4aIrFqwkLCjekUZyd3tfXSeUeJ5r3OL137r2Fqd74e5M+jrqgHvqC3JNc+9GyihDK846iedY2GiXsdmNAseVdUp0E5BgeHcACyCT/EAWgFK0sYCWO/pI8lC1WGgKqKW4/GxKE2+iuikR/fEFnh3hCDuJWVEc+q5VJ1NGNoOs25spiisfVkgU+TOiNR/I3ggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gd7eOpbCpJ+lKSmdjaOxB3oFAt3nK/rx4n9Ayo+kJU=;
 b=R0VRPhzp6BgpRA9dB3zIiNwA+6EEKmP/iefZ5mTSa8wYjHGbQWguFbhd9VN7PxAyGvagnnoEXusRPtewR7PqpKAUptk6bwcmtyOFVqo+1AJag1DPFPtXyPeKC176nv0fVbUICaS0I1tsaMAM32XhldU+T1Uz6reJbUL+1F6j4Ab52pOrX6DWOVmCqxYqQBUaxevoLLJvrwWVrWNi2JbZ0/FM0Z1q3IQmEGey+gl7UcuzloXTLpkB4f/1p5YmYTopfW8Nm6ppWY0ievg0lNYyv7BaMg0AT0/fDoKgzlQexuS6e/t3uthn67Yt+qdpLjVqvt8ZLv85qpP0D0ZJUp6qbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gd7eOpbCpJ+lKSmdjaOxB3oFAt3nK/rx4n9Ayo+kJU=;
 b=l+gQvgPScKqL028WSVR+n4acRQN9m/XXg9f/rZ26rTgy2YgIBAfGRgdiOrya9wPCUMm5UnxqfRnVFj/mpISLNFwnJnPQS346xtHU1TYGqNuUNwFKa4LOGQtXDQIDa/8yXNvhIHI82xlNQCYLY1DAZ6v9q7o7O9PyLIG6tMyxXnzgeXYa82lsakaEctUAb9+ysDEhNWcxlRThuG1wfKwyuA4Yzzq+hlAfsuCVMhmRbuOPrFxp3G420z+jJHHcAFtxxfB2ool7gGcOXfvXLhlmNEmG2tAiyWfP19erZKCIW0m4Nj4QWYq4emKaLSSVnWrZcGaSAOYcBH68XujSW0PPrw==
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10) by TYWPR01MB10163.jpnprd01.prod.outlook.com
 (2603:1096:400:1e7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Sat, 6 Sep
 2025 18:40:54 +0000
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f]) by TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f%7]) with mapi id 15.20.9094.018; Sat, 6 Sep 2025
 18:40:54 +0000
Message-ID:
 <TY4PR01MB1443251944E84D91018CFE8DE9802A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Date: Sun, 7 Sep 2025 02:40:47 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
 Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com,
 anson.tsao@amd.com
Subject: Re: [PATCH v3 0/7] Add AMD ISP4 driver
To: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com
References: <20250828084507.94552-1-Bin.Du@amd.com>
From: Shengyu Qu <wiagn233@outlook.com>
Content-Language: en-US
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <20250828084507.94552-1-Bin.Du@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tv0GLPS9PJ7Z0uVqFY4p5wpS"
X-ClientProxiedBy: TYCP286CA0268.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::13) To TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10)
X-Microsoft-Original-Message-ID:
 <a5eacbef-c055-4eb8-b196-e0e1864884c0@outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB14432:EE_|TYWPR01MB10163:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf111b9-c5cb-40eb-89b6-08dded74e840
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|6092099016|15080799012|23021999003|461199028|19110799012|5072599009|1602099012|20055399003|39105399003|4302099013|440099028|3412199025|40105399003|41105399003|26115399003|26104999006|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mzk0UG8xYkh4aloyTTV3MUo1VldCUXVLTGRVc3c2MXYyV2hGT1NQa0h4ZEFM?=
 =?utf-8?B?RWkxbXhKQzdiZmVPclFGcktONEFMbHY1bGNERkNQSTdBakhzZlduZWtTdWNO?=
 =?utf-8?B?bnlnRXVHMkdjelpheDlIWXNZUUtXUFlySFcraXRXRmtTZE56Slgvb2YycEk3?=
 =?utf-8?B?Zy9vVkNvbVJMQjVpM0Q2Ui9leHM0R1pwRjdpdm91aVAvK211Q0tiYTRvZVQr?=
 =?utf-8?B?QlZQclBvSlNaRDBOcEZKRTdsUTA0TXM0YlFaRy9RWWt5Q0ovSHlncTVMQ2Fm?=
 =?utf-8?B?a0JaNGJRUmFQQ0prUlNWcGxsWVltRHRlNFFLOEZPT2lJLytmd1hTU3ZIVytY?=
 =?utf-8?B?c1NCTmRERjRBR2EwNk1pbVIzWllsQXdSQTBuRkxRa0ZMSG9TWC9rRFRISnR2?=
 =?utf-8?B?RUhRblNiMDFNTFJmQ1JKWlhacjdZSDNzcGhIU3JTUml4Snl1Z2NZUnhYa1Yx?=
 =?utf-8?B?MjAvTDRmOG9DSVo1T2d2OFI2K29KVVZTd0hjeXRUc25aMitEU3p4WkJ2Qm5M?=
 =?utf-8?B?OUtHZ2NKbi9YcjROSU5kVlBaWUpqNlppaDNNQnZDWlhXL3cyelJvWVpCYkVw?=
 =?utf-8?B?VFBWSFh5UnZGcjg5aDE5YmowQ2NQQTZYdlMwbkRReW0xNkIzOTc1WnViQkhj?=
 =?utf-8?B?dWlEQXJnUENuYVBFVDlHNHZMcnFYeXhLajgyK0dacVF2RWNhbXNFcWpZU0hu?=
 =?utf-8?B?VWJ1dnE1MGxTdUxYY1pKYkhnd1ZYL1pzMkp5TTZjVERsQjRwU3lqRG92N0JT?=
 =?utf-8?B?cjZTNUp4MVkrUkd5RkpRbDB0djdXZUFRU2Q4WHZFUU5EYXQ5QklhWjZabUdx?=
 =?utf-8?B?VU56eTVSdys4ZkFPZXIwaXdIN3I0eDFjOVNFMjhqeC9sOVZrQkthK1ZHVFFX?=
 =?utf-8?B?UVY5SDdTZldyOHdGcWdmRitmSDNkbll2anRZUTEzdWhRdnZtSTJ0SFdIK2NG?=
 =?utf-8?B?S3BkYnFaSnordm91RkViOVNsUDV4UWN2WXVTcGxVOU1kSGplamNVVXh4M044?=
 =?utf-8?B?YVUwSUh3S3VTd1FqZFZHZ2hKU2E2cWRDWXQ1dnpXaGFMa2krL3pWaDNpQWds?=
 =?utf-8?B?WktIL29IMXVFaElCSTN2RWI1TVc0eDRVVGp3NGxwRmVkSVhBM25kdEh4WjAv?=
 =?utf-8?B?VDFJdXlBOHN6UFF3TzFSbFc2TnpsVzZsZzNadmRHaENlSmVXbXIvelZ2U25N?=
 =?utf-8?B?WDlpRVRaL3krWFlzR1owVU9Vc1p1WjgvdHRncFl3OGEzQXVPMzFYcnFLRHpM?=
 =?utf-8?B?VHIxWjRVZHJUaDg5UnVCbHVGZ0NsYytZdFN6NkcvRkJqK0dNMmhIKzRjZTlN?=
 =?utf-8?B?bWFxY3d5WWxUejZJN0RFalJZdGNWTnZyc1ZKOHBKQlJTSXNUOXhSTUNHN01l?=
 =?utf-8?B?ZmU3cFdyQ2VaY3Vza2x3L082cVVoRFd0dENKOXkybmc4RWFPOE4zZllUMUl1?=
 =?utf-8?B?ZHVKY1djOHhRNDhMZDNRd1VIVTZLSmtWeG10aldyc09oSUJWZE5VMkZVOFJI?=
 =?utf-8?B?UWttTFFyWDkxSitFRjJEOWxGSVM1cWxOelk2cW5Eckd2S0lSUFFiS2Y0STFY?=
 =?utf-8?B?Tk1Jbk53VjNtSnlLSXB1NUV4aGgrYndYUDZUT2hWK202MGJ3ZkxmNWE5MWJO?=
 =?utf-8?B?dXhtRUpDMVhPT0xXeTcvV0ZPK2tzUk9FUHFld1hJeG93UHVSTHJza0JEaHB1?=
 =?utf-8?B?VHlGMUJPN2JkbGlMSVpNRVoxYU83L1pVNHA1cE5paUdwbU90NnlZenVla3VN?=
 =?utf-8?B?aWttbTlHYjZ5RTZtR2pRQW80MENzeTdzRXhHL1dDaTJLcTdkdktOR0VzaEZK?=
 =?utf-8?B?b0dpT1NUZkxWazQ3NE1hdDFteU0vWDI1aDJNT2p0aVBIRGY1NytickEyNXBV?=
 =?utf-8?B?UHcyU1c1eUtIRy9wMzJ0SjE5Tm4xNlBRbGVIM2xRRVZ3YnVVdThvS2d1K0xR?=
 =?utf-8?Q?P3IyDaT2CLo=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0FjcHhkL21HN2gzUVNNcHhVT1FidE5JVUdyUEhzV21mSGRNZ09URUg3b0VW?=
 =?utf-8?B?d3dzWHpra0FDYW9McjVyNFRFR2ZNNW9LNWtRVDFvSzBWTXBHSlU4RmlzQmVV?=
 =?utf-8?B?b0I2cWVZcnZ4QzZabVFyMDZSbkhhZk41UXE2NjJZYjF6dktNWGozbHFBc1JY?=
 =?utf-8?B?Vm9oMHlYRlF1c2dXbUcrbFk2bmlEcFd0SmVNUE1GUDB0cVlyVHQ1ZUlOUVhy?=
 =?utf-8?B?YXBVRFc2L3dCUmJESThWaENjKzdHUGNjZDNGZ29NelV3ckkwanZSQXNxMHdM?=
 =?utf-8?B?c2tJdWhHMFNvYmJPeW42ZGRRbHl0cEVEcEFQd1AzRDU1cDZSVSs1VHhNOXo2?=
 =?utf-8?B?aE90dEVhL0MzY2w0UDNIOHVxTkd3VHBrMDBNU1VQWE5UOC8ramRONm9zcklk?=
 =?utf-8?B?NjdFR1JvMFJIckpMcVI1aHYrWXhTUk9SU2V2Vnlla3ZUaXJCM2pYc1pTS2hT?=
 =?utf-8?B?aU5uUHBOZzF3K1llQlg3MzQrU1VwekhwL2xzU0hpbUFKeFc3V2Y3K2FyK0Mr?=
 =?utf-8?B?ZEorN3B1ZkEvSENYckdvQnc5eDhXelFiejJIV2dNMEJQYTlMTjdkZlE2K0hO?=
 =?utf-8?B?eWsyeHAybXpFSWp3RVM1ZU5GN0FZYVpVZG5GOEl5Wm5IU0ZqdHN1SUZhbTRJ?=
 =?utf-8?B?MUpMZXcyQlpNeVAwWXJWcmQrY04rQlNGUC9hTnFDM2taUy9zUVVuYTEwa0or?=
 =?utf-8?B?cm8vV2FWZXFoWWtrNC9hUGFSM1RQdE5KOEUrZFE2REp1Zk9IWkNETnQxbisw?=
 =?utf-8?B?RFBzYXlJZUw0dEJ2TmZjTWFVNDIxcW44S1VIYW5yU21mMDRmb0hmeHBJTzJk?=
 =?utf-8?B?R3YrUVF2aDhHQUpXR0hqN1VCbzFxUWdmSEVITDRjRk50RUR1RTRrdncrQnF5?=
 =?utf-8?B?cGdESkZzYmp4dW1tdWtnNGxER1Q5VExIR3hGMXJyeDRxSjBkZFhkelJnQ2M0?=
 =?utf-8?B?U3dhcjZxbmQ4aEFxcFpwVW1GbmVEcjR4WElxQkJxU3ArendseHNWNjdFQXJ0?=
 =?utf-8?B?b2hJUkEvTWFWVWQ3a3VoRWFkWnpTN3RxZGxQMnpVbmZqWkVvaXlydERSa0xM?=
 =?utf-8?B?Zk81dnRGVXY2R2twQkxkLzM3emhPWXpYcFA4UnY0bHFQTUlScHFRSG1UbC9s?=
 =?utf-8?B?RzVwUzBFZ0NidUt5bnBPSERKdDA5QWNLdWgvQzF5ckxubDRxQk5GSGdQdHZE?=
 =?utf-8?B?aUVINEtFVVhFVEptS2RGb0ZFbkZ4cVBOVkRheHdtK25YbGZGd1hsQjJyUCta?=
 =?utf-8?B?cnNGYTBhc3RJN2VhTGJjYm1SUVZjazVyM3RPcTd2eElYZmFWRWZrbHNtclJr?=
 =?utf-8?B?UmRQakhwL0pzc1NrMXRPOEJiUU5ldnlIcVhNWlpQL01BcHdvNVlIdktSWFVK?=
 =?utf-8?B?TEF1ZDRwM3dLR25zaHFHS3dDYUhaYzloQklpQ0h6ZmRXaFJ5SUxoMHROS0Q5?=
 =?utf-8?B?cjBZdnArTmVvaDlSMTRzNnRiWmxXdEhJOGNpNm9tUVJHZ1RPNGYxUHhRQlN0?=
 =?utf-8?B?UW52WGhiQkcvS0lURnBYV2dLbGU5enFkV1J0V28vWUhmbGhHaFFsdXQzRFV0?=
 =?utf-8?B?a3owUHBoV1A3L2FRaVVVWDhyMW5sVzV3SHpLYXhaK0hiUittaHNxeEFzN2Zm?=
 =?utf-8?B?aHhHTWFySmtoYVN0Rkl5YTJscUEzNVZUS3g1MnY4ZFBNVUdOM0xlcHlhMHND?=
 =?utf-8?B?d1FFOTUwcWh4L2lwL0dHTkZxblUvbXc2ZUlscXVPbTdmQUsySTUydmlNUFJG?=
 =?utf-8?Q?L2sleerv48xPWe5gKQ=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf111b9-c5cb-40eb-89b6-08dded74e840
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14432.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2025 18:40:52.8755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10163

--------------tv0GLPS9PJ7Z0uVqFY4p5wpS
Content-Type: multipart/mixed; boundary="------------8ajWmZvamk4EUvykJorJGEGC";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com
Cc: wiagn233@outlook.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
 Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com,
 anson.tsao@amd.com
Message-ID: <a5eacbef-c055-4eb8-b196-e0e1864884c0@outlook.com>
Subject: Re: [PATCH v3 0/7] Add AMD ISP4 driver
References: <20250828084507.94552-1-Bin.Du@amd.com>
In-Reply-To: <20250828084507.94552-1-Bin.Du@amd.com>

--------------8ajWmZvamk4EUvykJorJGEGC
Content-Type: multipart/mixed; boundary="------------4yIWq5FX0ogGb51UtlqM5fX9"

--------------4yIWq5FX0ogGb51UtlqM5fX9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCg0KPiBDaGFuZ2VzIHYyIC0+IHYzOg0KPiANCj4gLSBBbGwgdGhlIGRlcGVuZGVu
dCBwYXRjaGVzIGluIG90aGVyIG1vZHVsZXMgKGRybS9hbWQvYW1kZ3B1LCBwbGF0Zm9ybS94
ODYsIHBpbmN0cmwvYW1kKSBtZXJnZWQgb24gdXBzdHJlYW0gbWFpbmxpbmUga2VybmVsICho
dHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgpIHY2LjE3Lg0KPiAtIFJlbW92ZWQg
dXNhZ2Ugb2YgYW1kZ3B1IHN0cnVjdHMgaW4gSVNQIGRyaXZlci4gQWRkZWQgaGVscGVyIGZ1
bmN0aW9ucyBpbiBhbWRncHUgYWNjZXB0aW5nIG9wYXF1ZSBwYXJhbXMgZnJvbSBJU1AgZHJp
dmVyIHRvIGFsbG9jYXRlIGFuZCByZWxlYXNlIElTUCBHQVJUIGJ1ZmZlcnMuDQo+IC0gTW92
ZWQgc2Vuc29yIGFuZCBNSVBJIHBoeSBjb250cm9sIGVudGlyZWx5IGludG8gSVNQIEZXIGlu
c3RlYWQgb2YgdGhlIHByZXZpb3VzIGh5YnJpZCBhcHByb2FjaCBjb250cm9sbGluZyBzZW5z
b3IgZnJvbSBib3RoIEZXIGFuZCB4ODYgKHNlbnNvciBkcml2ZXIpLg0KPiAtIFJlbW92ZWQg
cGh5IGNvbmZpZ3VyYXRpb24gYW5kIHNlbnNvciBiaW5kaW5nIGFzIHg4NiAoc2Vuc29yIGRy
aXZlcikgaGFkIHJlbGlucXVpc2hlZCB0aGUgc2Vuc29yIGNvbnRyb2wgZm9yIElTUCBGVy4g
V2l0aCB0aGlzIGFwcHJvYWNoIHRoZSBkcml2ZXIgd2lsbCBiZSBleHBvc2VkIGFzIHdlYiBj
YW1lcmEgbGlrZSBpbnRlcmZhY2UuDQo+IC0gTmV3IEZXIHdpdGggYnVpbHQtaW4gc2Vuc29y
IGRyaXZlciBpcyBzdWJtaXR0ZWQgb24gdXBzdHJlYW0gbGludXgtZmlybXdhcmUgcmVwbyAo
aHR0cHM6Ly9naXRsYWIuY29tL2tlcm5lbC1maXJtd2FyZS9saW51eC1maXJtd2FyZS8pLg0K
DQoNClRoZSBzZW5zb3IgaXMgTUlQSSBDU0kgYW5kIGNvbnRyb2xsZWQgYnkgSTJDLCBpc24n
dCBpdD8gVGhlbiB3aHkgd2UgcHV0IA0KYWxsIGNvbnRyb2wgbG9naWMgaW50byBGVyByYXRo
ZXIgdGhhbiBkcml2ZXI/IEFueSBleGlzdGluZyBDU0kgY2FtZXJhIA0KSVNQIHN1cHBvcnQg
aW1wbGVtZW50YXRpb24gYXJlIG5vdCBkb2luZyB0aGlzIGJ5IEZXLg0KDQpDaGVlcnMsDQpT
aGVuZ3l1DQo=
--------------4yIWq5FX0ogGb51UtlqM5fX9
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------4yIWq5FX0ogGb51UtlqM5fX9--

--------------8ajWmZvamk4EUvykJorJGEGC--

--------------tv0GLPS9PJ7Z0uVqFY4p5wpS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmi8gC8FAwAAAAAACgkQX75KBAfJsRlk
Cg//f/fibW7lObTgHeEX4QLHTWwjqVhygIKL+VP8tlPG33lKiQOdt5MKaqVv+Lm1mNOspWv1jqxy
JwqIouRs1t0TF05KPPtuFwMNtowrRjpyHhktybEc1dmX8UQV9hNaPjBgIgWxqKHszN/0OnAQpyLx
7F7nmuR5x6z9QVygMA4XLjbg1dpN7Js5ku2a4LveHJrKjw/fJUE94Dy1nCJoSl/QYLJD39P2NR/R
ywmG+HLKXqHOWOkvIBvmO2cieQAbUJggayeWOsnbZPmXaf56rt8S42uatFeg+nTCI/3fGhxBIPvz
8lXquloSAF5YCXktjKWlyA/LfJYVcnSPoy6++zLggHzJ9YfmYjlwtKRdvvHkE2XrTrp9rDixiz/1
JHTfRJuuCHsEgL8i7bI/3gRcz9/twMiS1u/QdpJowXtMrylt+gMeLRdjkw0iAvkHxsctAjJW8ybe
IS6ZPC+yOa8iOBqE4yT/UdOra81Qa/4IjhVN76PS00DDzz6RTT5pBprxS3d8N5XQ9iWDLZwn+yLU
rXuA5H2aAjL1noauZHTubgfvMyYCA1ho97KCso3Bf6Z7jGRs6olDncC4DpL3NHNqyX2qlWviKOkx
gGY6iBssS9zL700zOqU/O3rqT49p1YG0HNJPixXdeyYvscCxOjF/n5Rv8XCmPXPucwf/J/252sjz
XAc=
=m1hO
-----END PGP SIGNATURE-----

--------------tv0GLPS9PJ7Z0uVqFY4p5wpS--

