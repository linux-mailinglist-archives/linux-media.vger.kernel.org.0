Return-Path: <linux-media+bounces-43783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40311BBDE34
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 13:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3A213B601F
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 11:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F25726B77A;
	Mon,  6 Oct 2025 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="F+0fW6ZH"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABAD26A0D5
	for <linux-media@vger.kernel.org>; Mon,  6 Oct 2025 11:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750673; cv=fail; b=eQu0nMpvIiKEuODzdfH4nQfjHUl1fTqUcgFhBt3X5WGQG4t08SPzKIbOxi/w7a1dFXc2DEj5+rl6nJ8u7EXKKUVVK6lYX3c3T5USpgf6K1ChTeqAcCm1Uns9l3ILctnYDvrdWe5uBI9FQmYxjmOCZF0diZqTAydWwQzFRS10XVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750673; c=relaxed/simple;
	bh=BDnF+ScfB8LdL0kzik9q5EAu0YqTNmEbT05kLKiLxC8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M4MpFJkn9zr99Yi5YhCYkz2821vYhT9mANSLR7NfEScpR4LlNdNfeaBUKWL/HKDxqfMRlGoHRJDgsyz142CniQW6+xqAaXBXeX6OgAE2wK8L3g1A+/qPRTCuaRGqf1f5m7qiU+y05K3jUIjYyQ3ycK4/j2/XkU9xwDuwzdtnNzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=F+0fW6ZH; arc=fail smtp.client-ip=52.101.66.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdLzOEvBkX2XjQUAuUx3Aagp1wzPIutmlyGG04YbnHpy3XdAcQsj+2Gq/spnpIqMkKaGsJFhggcFp5nCFUkQdRVHFI24sYNYR/HCXXa9VTVwsRNFlxZOQPmbETjAEVbELtjRgNCHCSyeC0oD42OKeVlkP/2Q2ZvP3YudKvNeJ6STc0Ojsx0EDXPvgleQPynIkKRC36DBtTjOfP/wkaemRDWQlMGAt+t0G39d5gQ0HV6JUrlGT+DIq1nRek9926mONM/uHANLoxE6fRSlPjJehr5ycqXPsihvjL52EnWvOCF9Yad3/GhwFVE4n8oZXiC24STYNlGhTjRLHJjsFaBYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vn2v5SxY20mTyqEFj1nKnqhNK62BDLewvFUbzPhBcPw=;
 b=CooqY8ul3ghsrDEq2qzHaSdExBIXrUgdMUWzBZ+P9Tao7uEqJKoRH/CB4cafm0xgkYM9FD6l6zXYwvor3EpHz0alt5Hz9ayjugsYNXbd9eL6rlLZjqd7ftLqerPc1ImzTfmpLa/4Z99j3GDFFL/wD2dvyaT9bKaCzzwqpQRcEHo/7QtK/7EUUSVk8zGGbafGNEVEiYVXhmuwvSA/heTQIi/AgiZbcKpL+qbcfMg78CEWtVVGrrC3KwDHE+5M2/yHcYtKzwd1NON/cLYHcSM2MNbuqbps0FBhSAG6OGrN4Pds9GFq7cr2r/moz//keoqvU3bcSJE6M90OQPnfCBU5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn2v5SxY20mTyqEFj1nKnqhNK62BDLewvFUbzPhBcPw=;
 b=F+0fW6ZH2vpJ/kFbpq1PlbDQJCsDlUc7QtOZ3bGV1dnTeOVWsT3PnlmMAVO9WMeuR1NsxznAIBW9FJtEdnsyLH4RvJFhWao3vfdT8h8pyO22u4LMU/1bfMDzyjGHfvL+v/vMJK6WcDIib43WT1t7zrYQJdwKXRr2w61MeZH7RZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM8PR04MB7810.eurprd04.prod.outlook.com (2603:10a6:20b:237::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 11:37:46 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 11:37:46 +0000
Message-ID: <5734ec94-ec46-47b6-993b-5a1ac1e41767@cherry.de>
Date: Mon, 6 Oct 2025 13:37:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] v4l2-ctl/rds-ctl: support optional ioctl and migrate
 some code to it
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
 Quentin Schulz <foss+kernel@0leil.net>, linux-media@vger.kernel.org
References: <20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de>
 <f5a942fd-478c-4a5d-bf68-d53191d543f5@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <f5a942fd-478c-4a5d-bf68-d53191d543f5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM8PR04MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: b4bce68d-23dc-4c6c-b894-08de04ccc536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGZSWGhhKzFGNm9GTklFT2tzSGdoUmhwbmF3UnRJNituS1Y2Q1FVSVZZa25M?=
 =?utf-8?B?anNOWkhUVXdFZGtXUEFsYVFuRjBYdFVtVWlrcHkzVU5PRk5WK0dCejBpK29O?=
 =?utf-8?B?OXNoemhVd3o2WVdRcVpPQXh1YktoTDcyRWFUWkdIbXB4aUJYNVpOcU8zMHVT?=
 =?utf-8?B?TDlXTDZuekl6YmJxZGtXN2xQY3F4SWVhZHBtdFNQblhzUXMyOFlLV1ZWbVhx?=
 =?utf-8?B?UVZCQkhsTnM3aklmQ2tuZ09QaTV4MEdxQW01V0FQcmlWZitQS0RNeVlFUDh1?=
 =?utf-8?B?ZnlNQmVrbFdBSFp3ZjBuaVR0VC8yQ0MydGpnZk14b2UwYzNiV3hib09acEJW?=
 =?utf-8?B?MEo2S3g1eHpxOE05dFQyUlVlakh5K2d0eDkzdk1LamtWVzBOMkJSN1pWaUEz?=
 =?utf-8?B?T3QzUVZvaGdSWUJyYzNISVFFVWJsT1ZnSzh5a2NOcTZlSmNKTDRnODVBR0Rp?=
 =?utf-8?B?NzIrczR6Q0w0aHJsdlNpZDR2c0pmQ0VDSk1jUnhuejFNZlR3aG5ldkN2eGl6?=
 =?utf-8?B?WDFSQkxrcGE1S3dQZEVKd1FSZklxK1pNMU1ESjJMVXFxcUtYb1JwU2dmSmxa?=
 =?utf-8?B?OGF3SEU4NG5vbS9IREZoZ0tmT21odW80dE5yaWFKeGIxT1RhZ1NISXVwVkFL?=
 =?utf-8?B?eDBaNXY3N3VlaXk3QkdaanBsT3l3T1BpZ0xGN1VmQXVZWkhJbGVzMUlrb2x3?=
 =?utf-8?B?cG5QRDdvaFgva3VlT1VYdXdLTU9wZHNTR1kwWWRSOHNNa1UwU1p5VU1jWURw?=
 =?utf-8?B?MXdtTSttbnBTalQvUFUrWThXWHRkRWRuRmJWbko5VENYRTlMYmRYTiszK3pz?=
 =?utf-8?B?cGJDTzh2bFdkd2cwSTdPeUREOVAxNzZUdWZXbWNuN1FkdmsxMTFOL1dXSWZL?=
 =?utf-8?B?akk2c21XYXZmVXQxUXVvcStrY2x3N0pzbWgyYzY5cytQTUIxK2IrQ2VndWtE?=
 =?utf-8?B?ampWdjM0YThLRG1pemJBc0lpb2ZJdnZiUE5UY0hHVjFmVGJhN21UZTFWT2Rw?=
 =?utf-8?B?bGxFZW9zNVNONjlVZW43bDVPVnRTZzRhditlZG5tcHZzQUZNUm0yaFFRQUVu?=
 =?utf-8?B?S1hyYlErVko5OTVxQ0dadHhscUlqcWF2ZEpqSnBXZklwbWs5UGZlWVdrOUs4?=
 =?utf-8?B?dmhMb1F6MFlPeEJheWt4WWVFeUxINHRuRVRWVXdJTEpwcm1qN1NkK3hMaWhE?=
 =?utf-8?B?MmFZeThWKzFISmFYTERjcVRsb2lEbkN4MG53WjNOaGhZSVFtUkkyYzhXRlBC?=
 =?utf-8?B?b3h6dFBjSWxQcVVmb3lzV1QzUitDWTlsaDh0dElaY0hHSW55eUhzNk0razRY?=
 =?utf-8?B?N1Q3V0VxNDg3RzF6Qk12dmkxaHd0SmtMQ0UwNVI0VFZMcTJXYVpnTCsyMTJJ?=
 =?utf-8?B?ZFVpZnRHUElVaE1lSk1Yb0hlV3hjcjl4TUZZWVdncm5jUHFVdEhSTHQ5V003?=
 =?utf-8?B?OEtlOU8vQlMvUTNpd2EwOTJCK2VBNTk4T0pVTHdKVVdsdThmRXJMenM2Rmd1?=
 =?utf-8?B?VUpDYWQvSHRPVEt6dTRUa0RUcUs4czRTZzZ2NGlwMnVYZzAySHpWZStBQU44?=
 =?utf-8?B?R3BEUG1KU2NKZGV4Sy9QcUhzYkJkUlVzMWZvU05MV2MweFBNemo2eDVnb2Y0?=
 =?utf-8?B?dUMxVG5EbXJlTjV2blU1T25IbmkveVZQNzZFeHBWb29DUXF4b1oxSHNoWFox?=
 =?utf-8?B?RTlhbEdPdzA2MWFHRU5pUC8wTVlMSWFUNTQyNFRQRG1mei9QZStwM0s3aGVP?=
 =?utf-8?B?QmpzN0RzdHVaMW14UUc5TkozTEVpOENGbFg5a1dERUFHcU5XOC80NFdOUE5a?=
 =?utf-8?B?UTIvR1Z4STJLUUNiNnJwZnhvdndsMG1RdWMvd1BhSjF1VWFsdTViellHZjU4?=
 =?utf-8?B?Lzl5WFBxOXVkdGZVNDZudEt2K2JTbUI1eE9Zc1ZUcGpBaUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWlMelZKUjFXSEpJbjRsVk5KTlhCRHFrcVF6U2dYd0I0cDFvMzFBWXRySitV?=
 =?utf-8?B?ZGFxUEVRV05tSkJZWHNpamtMZ3V5bGdRUUQ5L1QrYnJKQnlyampGMUdjcEJl?=
 =?utf-8?B?K1RqKzFHOS9ZdTlGQml4cGlOWTlNNzBMNndTVzN5QVkvNm4xeEFpeWp5anVZ?=
 =?utf-8?B?SVF6U0FLdFg1a0NVSlZMUkNLRGpaV2NVUWFpU28xV0lzL2VjajFCYXY2MGlq?=
 =?utf-8?B?ektBQmJJeFBMSkd4OG1iMG1Pd1JnZWZrMVl4dmtwaGRNY0NSMkdUOGU2S1Zz?=
 =?utf-8?B?WGpuTmdGdXVOOGQybkNRcVpQbEpPOWU5VWRUOGFiUjd4NmI3ME0zU2J4QzNK?=
 =?utf-8?B?TW5YOFBoQmJKak5pU2dFWGx0cHhHK1c0dFNPZEZweGYrN3hVNmlHR2FIOWFi?=
 =?utf-8?B?WlREWFdZK0NwVkFvMVd6enA4SGhUY056RXY4a2dCbUlvS3BLUGRsQ2tOT09T?=
 =?utf-8?B?RHNyOVJldmVJMUxKeTViQzJHYW85T010TWJCSHpVR0ZMck5zdVdYQmV2dVh4?=
 =?utf-8?B?eU4zMnBRbDhCeVNITmFxdFBtUmJkanl2N3R6M2lCd1NYek5PTk9MMTIyR3Z6?=
 =?utf-8?B?Z2tDdXVZTFdjQ21IMllqUFIzRWZ2bDdGcUozRjdrWStZUWhjblNNVmpMSDhD?=
 =?utf-8?B?QXBFMWE2LzQveGRBa3RjY05KTkdJckE4SEVxSEE0azBENFU5UjBwVS9ObSsr?=
 =?utf-8?B?R2RmZVJZUzQ4SVJyaUlzYm9GZ2dQNktuTmZpckxnMjJ2VG9EWUtuWnAyUDdk?=
 =?utf-8?B?MmNxM0hoYVNkMmVDUkdqd2pvOXFwdUtvSWZCYTl0UE5JbXZad1JxbFRqYlpK?=
 =?utf-8?B?VURkSUVUUjJ5THh5Y1VLRVlzSVg0ZmhQWlVPUGo1UFdYaUZPUHNQb1dKdTFK?=
 =?utf-8?B?anFmWkdaMTM4TE5iUUpadkpjaFBjYlk1YnFDMjgwNnVIZ2FmbmoyMytCZDl3?=
 =?utf-8?B?K1JCTS90elVTN3U1QXFtdkJBS2NCSWtFaFg1aUl3elRTeDNFWktmZ1hRcDkw?=
 =?utf-8?B?MDhRc3A0VGdsenVoQ0lEalg5dWtZSDc5SzEwaitrTmV2bjIyUWQ2Z29jUk9r?=
 =?utf-8?B?eVdVM1VyQW1LS091ejJZS1NMNWpQS3d5WmVXYW5FQzI4YXNaTTJNa3VRVHRs?=
 =?utf-8?B?ckR3d1ZGcVQ2ZUQ1WUgzbnUvbURObnNMZHNQeGtEd1lTTHZneWg3bURaeGtu?=
 =?utf-8?B?YWVOdlJudWdMejFnbnNvQndORWgzSEdkL0g4Uk1pT3h0T01XZGlFaGFZQXov?=
 =?utf-8?B?K3JUQ3pWQmVuUEYxQXZkRWFJUzBpWjhyRmFiS2VoaWlscE5jWkZWbEMvaisy?=
 =?utf-8?B?aFJMVFZxdk5Ya0w4MU1jSjBlMXQ1bElLV01OcVpnbDYwN0lHSnBGTS9ZZGc2?=
 =?utf-8?B?YzJxSnhsRTc2amQ0UG5QaTR2Q2czOG94VnR0UEs5bE11WlpFNjVhVXA5VHIw?=
 =?utf-8?B?MXV6TWtyNTJDMUpIckc0R2ZNK2Y0V0ZONTVQZmZad0xwR1lKVWg1MzFyRDFJ?=
 =?utf-8?B?anAyV1UrU2pjY3pPSWJWcnFNZE5BQU85cHgrRVJNUzlvaElETmxrS3FJN2Vp?=
 =?utf-8?B?R3diNUtDUzdYMWVlMnBNSDRwRkU0cWxQaGl3cEVtL1dBMnRPM2N3TnBNVnRh?=
 =?utf-8?B?N01iUEVEQlBTRGJyNjkvUWtXdlNqWU9peFMxRk1qY2FpYXRYWkxGYktqVGFK?=
 =?utf-8?B?VjdVM200Z1p3Z25zMktjR1JoS0IxdFF4Ukw1U2xRS0FzcnNpeEM3Sm5rWHQ4?=
 =?utf-8?B?am9hdmFqZHA3ejc4SkdFcGhDRVpXSDVJYnNMdUtka201MTh2T0tQaERqbVlU?=
 =?utf-8?B?MXlaOGVJOStjR0JyRWZyWEVFWmZFNWxHK0JwazZRUUtNMmx4OXA2YnBEZTVh?=
 =?utf-8?B?UklXM1V4elRCSUl6emdqc0RVMHRRb05WeEtzRWRBL2hsSmxGRUFCc1BJRW5i?=
 =?utf-8?B?NklhdTJmWlJHM1pkSmZoQ3ViL1VzRlNiT0Q5WG8wZ1R1OTdYZjNiT3hkNG1x?=
 =?utf-8?B?Z1RwQmliNHd1VzJ1blJJY0JEekpqNTNNelNmNUJOZ0FQdXZhS2xjRHBUMXhW?=
 =?utf-8?B?cHl2UEhDT2t6UUw5SjA0a3lKWGRGMEEyejRxaDlmWVFWM2ExUnQ2cHBIOE5H?=
 =?utf-8?B?Z3FtZENBVUFyWmFSM3FlTy9kRzRzVUFQWEhYR0hicWZ0QkdZYkttbUpQM01D?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bce68d-23dc-4c6c-b894-08de04ccc536
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 11:37:46.3277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXCnighwiF/Ev+L3DvnbBwSmC5pbCEG6H+/0q82N6B3+gxWCPu0WIMJn781SLy+EcvnjRRcgfVR4pmx0/LRZzluv96/TItEifQNI9oUrdIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7810

Hi Hans,

On 10/1/25 11:17 AM, Hans Verkuil wrote:
> [You don't often get email from hverkuil+cisco@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On 05/09/2025 14:19, Quentin Schulz wrote:
>> Some ioctls are optional and the logic around it handle it nicely,
>> except that doioctl (via doioctl_name) sets app_result static variable
>> to -1 if the ioctl fails.
>>
>> However, both rds-ctl and v4l2-ctl exit code is from app_result. So it
>> is possible to have those tools perform the expected task (albeit
>> failing to use an optional ioctl) and still report to the user that it
>> failed to do so.
>>
>> Let's add a new function doioctl_opt which allows to NOT set the
>> app_result variable when the ioctl fails.
>>
>> This migrates two ioctl VIDIOC_SUBDEV_S_CLIENT_CAP and
>> VIDIOC_SUBDEV_QUERYCAP to be optional ioctls.
> 
> Actually, those ioctls must be present, unless you run an old kernel, but
> they've been around since kernel 6.4.
> 

Yes, I am using a 6.1 kernel, which is supported until Dec. 2027, c.f. 
https://www.kernel.org/releases.html

5.10 is also supported until Dec. 2026.

> I'm dropping this series as this isn't quite the way to do this.
> 

Could you explain what is the issue with those patches so I can suggest 
something else?

> Perhaps you should explain the problem you encounter first (and mention
> the kernel version you are using)?
> 

Run v4l-utils on an older kernel (6.1 for example) and it'll try to use 
the ioctl that isn't supported. Since it's optional (the return code 
isn't checked directly) it'll happily actually do what's expected from 
it but the program will end with a non-zero exit code, thus failing my 
CI tests while still actually performing what it is requested to do. 
This is due to the failing ioctl setting app_result global variable but 
the failing calls not actually being checked right after in the calling 
function so the program continues as if everything went well but the 
last line of the main function (std::exit(options[OptAll] ? 0 : 
app_result);) actually returns the exit code matching app_result value, 
which is set when the (deemed optional) ioctl fails.

I use v4l2-ctl to set a test pattern on a camera and now my CI simply 
doesn't pass anymore on Trixie because of that. For now, I ignore the 
exit code of v4l2-ctl -c test_pattern=1 and validate it actually was run 
by running v4l2-ctl -C test_pattern afterwards (but still not checking 
the exit code of this command as it's still returning that it failed).

Kernel is 6.1.

Cheers,
Quentin

