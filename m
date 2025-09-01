Return-Path: <linux-media+bounces-41410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAD7B3DEE2
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 11:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9580A17C292
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 09:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0857530EF98;
	Mon,  1 Sep 2025 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dbQ9Xika"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E24E30C340;
	Mon,  1 Sep 2025 09:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756719723; cv=fail; b=aGXirk5tt4njeQv4bPAU5enPBEQ6I/ovt4sSo3Rj5FQq4705loZW0GpntXgrwoHd13Lc8GXFWkgjMKJK7VlLB+WmNNV9PKSvduXB4xem98tZ8qO0rck277cl3VIEH5rcCuo9/sFnT8pnuSOy3oOwVEVIprBH0QC46NwVsKYKn14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756719723; c=relaxed/simple;
	bh=Y9Wtiv7TVcL7OzxPsUvAMKYTCPDK1RaAR2z9ytw+Vrg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=khbKgoik8FHiQh8D9oLxwBcYDJER4zsIdaeK6JkFXdE18MBS4liDQwblIF5McOTNDjhyv6X917EDZUXp5rw/Rf6YDmN/8aH/tOoZPMZ8DWJ/+T908MWCMxP5N/j8PV1DZt6axq70zirqjzq+HJA5vbK/mqcEE/HuAwAZnD3Wb0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dbQ9Xika; arc=fail smtp.client-ip=52.101.72.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YheV2tHkX8v3hwJP+ccFAwtCGvY6e+eCJfMByAAtqgLRNVbsQ0IHwV+GCGDQqNdSFDy+JXQrHTWKbKjRy1dMTZkOHuU7s0wDTkvXvt6dc8xhjhz4D+WQRjNbG70K915GXdaCD1nqDaXK4iFB1tEJt6I4XSeYZ8CcJ+bI/CPZd/e+UTN2hSNkYe0+s7pCfkB7MAGxTXlvsKV6oAJH1tZ38/lE6XhxPmCOS3RiYoFFASyboJ5aMapotw70kpDsz929nA/UkVbVc+H279dXIHlwDlQxxSONAafkk0PSWfNPweXEERC7746qvOp3Mv+AfTymNPVk4KOLE14NoOocVAIhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdxW7zsu20PxLBZdFOMUyqE+O0xNHRSDiCBz3MfinlQ=;
 b=PoRVEvFzwCqXnX7BuhVEJYugbTf4CJOsW83+qmlhV6aPJG/zkwsvjo3WKzsr6PFYtOkmUrfxeKCAsd1PO149icj6BWQonmxoHN4uQQ5ILu0rimX23lzw/AMBG0w/XVW1Bk25pLZaMSCIxxcavqzOEXD7HIuzANUpPeWYj0w1XUqBvahNT52Rs31hrUWeiv2XewcJMYkgKR9MXLZM+JiILRjw9yIECdvu1UVafpvpQUUBf53BaphIYj6AReK/OXimrrNUnhnsgGVLHfNd39ocNA81/3xdVy8wgi5957Bz3ifhLpt5UHGjt3QNqV9ZAXJ6jbEG02UuRGsdMLLVTaRQBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdxW7zsu20PxLBZdFOMUyqE+O0xNHRSDiCBz3MfinlQ=;
 b=dbQ9Xika9otfS1lR1rxMCbg08ASSaBMgpZerCN/EJioqveefnfRZ+TTSLrI2zI750carwbcOrJklRlClRkrF2Ftu8fAfLJgiBmGythKIPhpqHnlPN5XQ5lD4WK2mcHXtPNGgs3NPi6guw5rRQ35f0vnRthTvgvPrC1K+TiLCwSNBPduhcFz5BNoWHbcZbIDFXJaU+aDPYZMGbRdU0bMNb/vNLT9Zn4QRWrITFjoTvXbIWLvq0/E9QFusij0t1wQ0BAg0KcpZhDkX/9UGAn5jlAEUaUh0ixFw114pgNNcYZmmKfSdlI90GQQpLiRBXzo/wjNR9o8zChuVvd+zttv1fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB8576.eurprd04.prod.outlook.com (2603:10a6:102:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Mon, 1 Sep
 2025 09:41:54 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9073.021; Mon, 1 Sep 2025
 09:41:54 +0000
Message-ID: <dbd7ec6c-9837-4bf3-a363-e287d075b677@oss.nxp.com>
Date: Mon, 1 Sep 2025 17:41:40 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: amphion: Drop the sequence header after seek for
 VC1L
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250725080712.1705-1-ming.qian@oss.nxp.com>
 <ede4226a80e27c8b047b0eb25fe8f5ba90214d12.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <ede4226a80e27c8b047b0eb25fe8f5ba90214d12.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ceb0fd-d081-46d5-0f7d-08dde93bc638
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0xMb2dmTEk0REFoZ1BkY3lGeXE5QWhGOWZ6Nk5NcmpSVkQrNlVJUFR2REtx?=
 =?utf-8?B?N1YwNkc2RG0vZzVlTUE5QitVWXd2TmpQOEJzUmpsRGlNRFg1TWtiNUZyTVJY?=
 =?utf-8?B?UGt3U01xNGl2aFl0aXNNVHozYXgxcThGRktpSWJsTWJuV1pPb2xONnhjSjdv?=
 =?utf-8?B?STc4UGpCSUF6bDFDTWw0emlacGU0M1E1YlN6VCtMa0R6TXJicVljNEVaazQr?=
 =?utf-8?B?SC9pdUJNSkhQQjlZNUw4dkNMUU9hQXJ2T2FlWDloSFVhaWZtaFRoR1VkQUZr?=
 =?utf-8?B?bWEwcWxaUWlGSm5oVXBRN3VGays3dXpoWjNWVXZFTTZldmh2d2hHc3d2N1NM?=
 =?utf-8?B?YXVVd2xYSWdWUW43TlR5d1dTQ3VvZ1J3dWxFVHdXVldBcGhSV28rYzZrR0pP?=
 =?utf-8?B?NVpYNVFxUDNqaXBTU1JGZ0p3MVE3b2V2eXpkcVYweGN2ZjdKWVlpRit6Q1E1?=
 =?utf-8?B?dGtLZmpxQzRHQ3J5d3UzWFJ6ZVRMSUpTcmtiS09HKzY5NWZyblpFRkdQTXdG?=
 =?utf-8?B?ZExWWnNjQWIrb3pqMmY4aWNVVVdJL1NZZWlwblJjOUZ5Mk14dUNyM1ovbmFa?=
 =?utf-8?B?SDZyeGZPenFmbU14Tm5WV25ZVFdReVVwb3NrV1ljS2VxeWdCdmFVd2FwaXYw?=
 =?utf-8?B?QmtUNFM2QWg0WWN0bmlxaElBdWlOcXpoU2VIdUNUQkRmTW5neTdvb3dMVTZa?=
 =?utf-8?B?UHhCYXZzbjBXaDJOSC9KOU15ajIzZHFIcWtxa0w3R3VSdWlTNzBTKzZQUTIx?=
 =?utf-8?B?bFBDT1ZTRXBFNkFwakpVeDNCWDl6TFF4QWxpcUVGTjR2a0xyMU1veGtudUgy?=
 =?utf-8?B?dm1jSGNRcG5LMFBwcm0rR0dCbTAxdzVYMDByYVlYNTFFVnZ3WWdwV1RmcTlx?=
 =?utf-8?B?OUdNMDVlT3BsMWhTWW05d3FuSjFwSlBGejZUMG8rRDZHR0VEUmFPNGJxbmo4?=
 =?utf-8?B?bmN5a0V4MFNYL1BMZWk4Qk1ha1o0VkNjNW1XL2xKL2hZNFZ6T1Rsa2JXN1hH?=
 =?utf-8?B?MXJYVTQ3dUMvb2owUWhxdEFzT0hSbUFuZE94OEtsTzBUamw1aENPUGZyNUtB?=
 =?utf-8?B?ZitMZjRZZkRiNk9Ea0xjWWpXeW05OWkreUhCWDFIaTdiTEliZ1c4RXJxTlRy?=
 =?utf-8?B?K0ZIaGJqTDRRUXhxWE53Z0xUakh4QUExaDJsZGVzbFk5RFB2dU13R3YydEU5?=
 =?utf-8?B?bGRIOFFQRmhRa3Vhc0k5QTJ4R3Q5cVNhV1Q2eldVOWRpYnVoaFdjUW9KWkpE?=
 =?utf-8?B?TzVvdy9CdXd6YzlhN3hlWmFZelhja3FlOUR6NG1HOUdxTHRGZEVYeHVmVWZG?=
 =?utf-8?B?ZjFIQ1VaWEtuYTM2NCthdHhmRlJzTHp6NDE5ckhNSFJJbTA4MmQ3eDZsQ3ZG?=
 =?utf-8?B?MTVFMUgvNjBpWjBVY2Q5NlFNQS9iSkRSQUxxV3QwcHJTVFNEbHNRQzUvby9w?=
 =?utf-8?B?MVVVMzFYQWRwTFVua3Q2VHI3MGNCcER4cmRrUHlXOUcxT0NjSVM3aFp6Yks1?=
 =?utf-8?B?L2IxNkhtVVdoL3FHQ0N3eURzYkl4Rkh4N2gva3Ywbm44d29HNGhGbGtWRmky?=
 =?utf-8?B?MUVrYWZ0TjVHbEk1blhkRXcxZzU0VTJKRmRBTSt0Ni9SMElMVENZL3VKTXhS?=
 =?utf-8?B?S29ka2R2SnBTdEVOd21yUlpNNDFTam9mWFpkL1UzZ0ZTa2tvOGtpQ0VoOWJz?=
 =?utf-8?B?TDl6TzZSdlBCdEVBblFYL3U2RnlOcmZTUzF4cGxiYXhsM2FRaHo3dit1YXgz?=
 =?utf-8?B?c0tRU2FVSG9RcnZlcnliamVYLzlNOVBLYktrUTZKUE8rREtCc3lLMkhQUXNu?=
 =?utf-8?B?ZlNTWnFNeVdNc2EwaXdCaTN3ZjZGRlRneUM4amlwYjBseDlFelNldUJiOGZk?=
 =?utf-8?B?VnJTTWZVbzgzaU9EOG0yZllFWWtJcUNvVWxRSFgxaVlYT1NDYkcxdnJWeVhi?=
 =?utf-8?Q?xZibhIcAJ/k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWpONWRIVXJadHFVQVJuWExSVi9LQnpoK3Z1NGozV1BOdDZHNmo3UmQ2bWNo?=
 =?utf-8?B?QTRiS2Q2dUIyaGFmQlR6bGc0Z2FCN1JhSDdMM0FwUHNwbklvVVo4b1pMd0lK?=
 =?utf-8?B?amlFWVAyVWtVZzZBeFM3WktHNkVsa0VTcUVwaFJoeVpMUHJLcEhYRWlicS9k?=
 =?utf-8?B?ZnBvTnAvNE1aYk9zbDh3S1Z1SHNxVTFQTUU2QS9DYXNBcHJGVjNKMExxOHpN?=
 =?utf-8?B?ODd2UklTTW9EWDJFRzJheG1RUnhnUWtSZFFPL2pLUTUyZnhNR0QydDVaTnpJ?=
 =?utf-8?B?bWZENWJMbnc3R2N1WjZiNWxLZDdTNks1anJVcXhkYXlBTHVaUmszbnRKaTR5?=
 =?utf-8?B?T0YrMFlZRGN0Tm9ETmZFSXJIN1hsMFYwMXVqMnNSMjJrSDlwczBPd1JZcmtK?=
 =?utf-8?B?b1ZqVEljYnNEY0dIbXVHNmFINUlDUWl3bVdYRFd0QmlLTmwxTGVBU2JwanVB?=
 =?utf-8?B?WmorY0I0RW9pZ0R2OTNXdG5FUU1oVlB0OFpldkdRQUtBR2dzTDhiTVBIOU9O?=
 =?utf-8?B?UHdiczRIYnlaL2ZxWFJXMTAvaGFNUDE0ZnBkRDlyRWVPV2ZqNlF6WHVCTTdL?=
 =?utf-8?B?aVV3NVNLVHhwL0NkY25hTi9SME5HNDRFNWY2N291NkFzYUlRaERya09ueTVY?=
 =?utf-8?B?TTNzZnY2dHNsaVI4MkVRVzFpbnNROHkyRjBPWGRIQ29lcDdPdlpDcGVaYmlV?=
 =?utf-8?B?bnFsaURYWEoxdWNMUEV2OUpxZkhJbW0zQVRsdkZoc2NxSDNtNld5NXphTlpZ?=
 =?utf-8?B?dkZIaFRHN3V5QWNFcENEU1dKRVRlTFZ1a2diY0ZtREwvSHRiQ2x6L0tFbC9P?=
 =?utf-8?B?TUpzSFpudnFIZldZbFRGckhJTTI2cXNvNXM1ZzZuYk02UWZHcy95cDNaUzdZ?=
 =?utf-8?B?YWptNmsxWTBBVU9adi9EVFBqT25RWHM1TDVVVWpEb09RR0svTjliSVhXamg4?=
 =?utf-8?B?WFNyUDVzNUZWeFRoTDBENmhkOWhxaHNtc3E3bDY5YW9BWXI3dFI2WEF4UjBY?=
 =?utf-8?B?MmVLQko3V2JVY2F4UnF4N09WMVYzcXl0M1g4RzRiVy83bkp4SEFodVZPckk5?=
 =?utf-8?B?Z3ZZK084ODFuUnJ4SGY1QytkT1NVdzBSTy85aFp3b1Y5cGZ0RFh2cjJpNXYr?=
 =?utf-8?B?OXg3bUFjQXJLSkRVaFM3Wk11SkpRNmFJYkgxRGhxbkE3UDg5U2prQ2NaaUpl?=
 =?utf-8?B?cFZEUXJXcjBGSEQybDBlZ2dRY0htVDJ2ei9ZQ3NKVzVoMDZwaHN2aUpZNWFv?=
 =?utf-8?B?dnFCNC9BeVVoM0ttMEUxckJaQ0haTVpzVFVBVjlVNm9yRmh4Qnc0bEZOb0pY?=
 =?utf-8?B?NnkxOUczVHJKcTJBTzBON0w3NUdBMTF6dWNpQUoyQ05COEI2QkpYNG5iNER0?=
 =?utf-8?B?NWUxZXd1MU4raTgzeWtxTjlOaXd6bURheEJaWml5a2VnZzZ2L1JFVVNBY0M2?=
 =?utf-8?B?eE0vNndoWk0vVm8zWHNRVVp2d3YrdE9KSUx1WGVIT2hObGNnV1pWcE9haWx3?=
 =?utf-8?B?K1ZadUY1YVhVaFNSUzY4REpybmRwRG42bFE1a0tSaHU1a2NMYzhZdXVnQ0ZP?=
 =?utf-8?B?RkMzQzZ0WXJNS3lFMUdoQVpEOUFBMnpNdGZBenZRV0ZMaGV2U0wwdjhUY21v?=
 =?utf-8?B?MUVCMFFzQmUzeUloempTelgzazVTNDRrOUUyWEdPQ2o0RDFIWkUvM2lWVFZq?=
 =?utf-8?B?b3FtYVZwaEhoUzlGaVhpQ1d4THcxaHM4cTJyRy9oelYvczJFdWk0VEY2R0Z3?=
 =?utf-8?B?Wi84UVBSUEZSc3BnMjI1TVY2QXkxV1VzcU5aUlYvSmxlMG9CQ0xqQ0dmQmM1?=
 =?utf-8?B?ZW9McUh5cCtBRHlUbGV1dWNPYnVIbHl0a0dJdHdTWFZXUmRlVXdtcXRyWWVT?=
 =?utf-8?B?NUFHREMzaTVOUzhDN3IyeUhHNEZYQ3lmeHphUnRucUZ6T0ltODF6RXFNWVhN?=
 =?utf-8?B?VXhLSmdBU3phMEJhN1lGdlZKODYzZWdHY29kRlNuN3NQOUZUdTFwc2hDeUlx?=
 =?utf-8?B?UUkrUjVkbm0wWHY1ZGZ3TFZvNDFMY2VtclV5T3pTeEllUkFrQ0xwY2d4eUV2?=
 =?utf-8?B?NkJLZmpDdkpBRWRRbUdmZVByNjlrdWc3aTNmaUpXdnFEWnMrQnJHM3hVZkF1?=
 =?utf-8?Q?GhJ3D77wK7d2uAPvjSgC1+Ujl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ceb0fd-d081-46d5-0f7d-08dde93bc638
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 09:41:53.8145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chxSgwJH6K889WLTnrSG2MLH9/+mDJ2GN59IpKhMQCuFgCbFpBUKAXP/R2HTm+mBL4BYHId181LF7CQirLS53A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8576


Hi Nicolas,

> Hi,
> 
> Le vendredi 25 juillet 2025 à 16:07 +0800, ming.qian@oss.nxp.com a écrit :
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> For Simple and Main Profiles of VC-1 format stream, the amphion vpu
>> requires driver to discard the sequence header, but insert a custom
>> sequence start code at the beginning.
>> The first buffer after a seek always contains only the sequence header.
>> But vpu_vb_is_codecconfig() always return false as there is currently no
>> flag indicating that the buffer contains only sequence header data and
>> not frame data.
>> So driver needs to drop the first buffer after seek, otherwise the driver
>> will treat the sequence header as a frame, which will cause the image to
>> be corrupted after the vpu decodes.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>>   drivers/media/platform/amphion/vpu_malone.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>> index ba688566dffd..a4c423600d70 100644
>> --- a/drivers/media/platform/amphion/vpu_malone.c
>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>> @@ -1373,11 +1373,9 @@ static int vpu_malone_insert_scode_vc1_l_seq(struct malone_scode_t *scode)
>>   	int size = 0;
>>   	u8 rcv_seqhdr[MALONE_VC1_RCV_SEQ_HEADER_LEN];
>>   
>> -	if (vpu_vb_is_codecconfig(to_vb2_v4l2_buffer(scode->vb)))
> 
> Please remove vpu_vb_is_codecconfig() entirely, it always returns false, so its
> miss-leading.
> 

We have tried to define V4L2_BUF_FLAG_HEADERS_ONLY to to distinguish
whether it only contains codec data.

https://lore.kernel.org/lkml/20221125020741.28239-1-ming.qian@nxp.com/

Although it was not accepted, we applied this flag in our Android
project. Then in the Android platform, vpu_vb_is_codecconfig() doesn't
always return false.

I know that's not enough reason to keep it. I just want to say that this
vpu need to know if the buffer only contains codec header in some cases.
And if we remove this, I need to add some comments to remind users that
they need to pay attention here.

So I tend to keep it.


>> -		scode->need_data = 0;
>> +	scode->need_data = 0;
>>   	if (scode->inst->total_input_count)
>>   		return 0;
>> -	scode->need_data = 0;
> 
> I only remember testing this once quickly on Exynos 4 and I had no clue what
> Annex G vs J was and most likley the MFC firmware was detecting it. Checking
> quickly, I'm not sure GStreamer actually support both, despite the v4l2 wrapper
> pretending. I would expect one to be used in ASF/ISOMP4/AVI, and the other used
> in MPEG Transport Stream. GStreamer does not support VC1 in MPEG TS.
> 
> Have you tested this with FFMPEG ? It only maps annex G.
> 
> In general, I don't mind the the change if this is correct userspace behavior.
> If ffmpeg and gstreamer don't agree though, we'll have to rethink. GStreamer
> code back in the days was design in a way that it should not matter if the
> header is split or not. This limitation came with lower latency decoder later,
> but none had VC1.
> 
> Please test both userspace, and lets see if this solution is acceptable. ffmpeg
> have ffplay and you can seek with your keyboard arrows.
> 
> Nicolas

I tested this with gstreaer, not FFMPEG,
And I checked the gstreamer code in our repository, Then I found the
following related code:

   } else if (g_str_equal (mimetype, "video/x-wmv")) {
     const gchar *format = gst_structure_get_string (structure, "format");
     if (format) {
       if (!g_ascii_strcasecmp (format, "WVC1"))
         fourcc = V4L2_PIX_FMT_VC1_ANNEX_G;
       else if (!g_ascii_strcasecmp (format, "WMV3"))
         fourcc = V4L2_PIX_FMT_VC1_ANNEX_L;
     }

Basically it processes WMV3 into VC1_ANNEX_L, and WVC1 to VC1_ANNEX_G.
I didn't found them in the upstream gstreamer repository.
Now I'm not sure if it is correct userspace behavior.

And the reason of this issue is the below code in gstreamer, that the
v4l2decoder may only send codec data after seek.

     codec_data = self->input_state->codec_data;

     /* We are running in byte-stream mode, so we don't know the 
headers, but
      * we need to send something, otherwise the decoder will refuse to
      * initialize.
      */
     if (codec_data) {
       gst_buffer_ref (codec_data);
     } else {
       codec_data = gst_buffer_ref (frame->input_buffer);
       processed = TRUE;
     }

Regards,
Ming


> 
>>   
>>   	ret = vpu_malone_insert_scode_seq(scode, MALONE_CODEC_ID_VC1_SIMPLE, sizeof(rcv_seqhdr));
>>   	if (ret < 0)

