Return-Path: <linux-media+bounces-41195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A49EB386DA
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 17:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B9B27A6A53
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 15:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFE22D94B0;
	Wed, 27 Aug 2025 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="YTHyUe3U"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013010.outbound.protection.outlook.com [52.101.127.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207B51EDA1B;
	Wed, 27 Aug 2025 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756309297; cv=fail; b=T6pYrCP0jEN4Dx9sZurTpUe+yxNjOhBOL6VsZMaDhqPe1K7VHJ6ljbvPGzhGcFYbON9sBK73jhAllH6cU4x/8P+PkiwhLdLV/ZFJtaAPrcC2wknrB2egd5DgjlhKMaeJntCtRFjXwsUP9S1/l5uAQU/Be/8e8TCRuvBRohOjiRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756309297; c=relaxed/simple;
	bh=J0QLT+rg299fP0Geef/swgWFW8owLNwQQGwitnZCMys=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YsNKn5MT0bwvquvN2xbBCLvdv1Fy08SloNP/SqPxL4GKHjqaHZWPUDPoiwIAhl1Zq1gB0zhRlXnmduT8NH6KOnehw9YI/izI0ZZMgIME5dOIr2B5lW+CstLoaO5BXWcsNPq+OsYN+v8ywv2D0zcPV3C8JsktxwCMFGg/IcncjLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=YTHyUe3U; arc=fail smtp.client-ip=52.101.127.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+oH4Gi229RnQa/zAlm9ekohcK/twos+y41LhpifkH4fLUVELJuO+5LaKBiCha+qxUgrDI3NtRVCHKOJtmYFgZXQUjNKqfBQLIqBdAM1TsvsJbcKVP9UCBrAyTNyhO4o4IHK40b/JyR7o3wtJs691ieRbt6dIMWW5+NLF8Rr0OJbr3+haUBAqKiAnIoDc2WPoQ/0HZNwl0pWT9OVn5g++dytAlJ7f4r6dnYzdU5RUC0Q1chx/K5fyH6FM8QoIXrt67KIVUhjEu8aKYtYbpVmduUReWvd5iycguR6JunJJ3oBlHzCKV5v+KRNTrnwNazTt/SoOdSrb52AUqEJhfFOWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDbOxAIm0l6e4JfH0E2PcZqGTK05doKqbwTdtCFshNc=;
 b=Z5p+vqVcBul+596JMf7gEiRNpL72jLefdGrHRP9DtvktOYMDraVwBIxhszx7HWLU8NHIcKek3RzJ4CiiQn0vNoQATZxufHIaAs7Id0EsJW0pZukmWxowgze9/plhSqSvY9RAZWonE/OAOdiIJpvncqjp3LGivzfD06DMYIwewGKox6s5uYdYi70USebPjKndZLOYj9DP1iONtN2JG6Sf32/Q7HyqPmk1zf5Qw3JGURCgamnFJgTLLJyPRu5V2LZzxk6vQzC0HmvAAXg+/uYszN5J0kElsXDS1g9gfGVTiTQPhJuZfWPsyC6vKOm0HELVdBhKfUW8gUFA23zw6zBHtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDbOxAIm0l6e4JfH0E2PcZqGTK05doKqbwTdtCFshNc=;
 b=YTHyUe3UYU3DRNeGvNH0CWoqTzgxGlDNROJThpF2RdYHfgxGrhwRRR+m9ZCW+Q2rTYi7Bmp/IW2nPbxK7uabo90vDi3JFl1DLb/a1EBVjQTBdVWGZ2gJqyLp/vaZgzmN2oQUOIDQPeXa2024hDiCAoyciViLd86tMAJ8zkoqXtPXGtjPajeOab5mPc6curZzkLjQC2sQ//muMnoADhHHrefxky4hjRX3wyBlfKthyPMWD8Y/Y3lr9DXbyibSClVYvTyDbdC+x1TIlSrGfymqzpG1UmybZSoXmVI2eQIkhcCtCSKg2KobP76ETsXYaniqK9kyea/3y1LrRBHtsPhK7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEYPR06MB5277.apcprd06.prod.outlook.com (2603:1096:101:84::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.15; Wed, 27 Aug 2025 15:41:29 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 15:41:29 +0000
Message-ID: <411e9db5-5339-4527-bb3d-473b339a6572@vivo.com>
Date: Wed, 27 Aug 2025 23:41:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] media: i2c: mt9v111: fix incorrect type for ret
Content-Language: en-US
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "open list:MT9V111 APTINA CAMERA SENSOR" <linux-media@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250827123916.504189-1-rongqianfeng@vivo.com>
 <20250827123916.504189-3-rongqianfeng@vivo.com>
 <xbmwlnflzhfhapyt5dinqqsdurxgu5imlqixudopb7z32eteth@cs7hulza54e3>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <xbmwlnflzhfhapyt5dinqqsdurxgu5imlqixudopb7z32eteth@cs7hulza54e3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:196::19) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEYPR06MB5277:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f98e6a-5afa-4177-b6ee-08dde580308b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEppNWZtSEJVMGdmUW4wVnRGT1lFNXZZUnZQMmFYQWN3KzhRYjlzYVlWVksx?=
 =?utf-8?B?N1BRKzBCdWx0UmpMVnVoM2xuQUM3MzY3MFhYWk93WVpxeWE1RGJ3amZZVEZ1?=
 =?utf-8?B?VHdqL0JXWit5WnBCVWFWNVBGWjJlOEtwdFZaRnp2TmtBcVVoOG9ja0E3dW10?=
 =?utf-8?B?cVVpK1Z4TTVTVk1HbUh0ZytqY1NuUCtyR0pTZ0FqQ3dOV0xVM1JCRTVnWnVD?=
 =?utf-8?B?OVNmTWtDWW5LOTk3ejBkZndYVkpuaXF4OXpUVEg1L2JsbmpweUMweFcybGxJ?=
 =?utf-8?B?a21mTUFVcXBzaXZ1d3o5cW1LNmpJL1FYMFFHdGRkbi9FMXhmbW85L1RMTkoz?=
 =?utf-8?B?czJIa0hBaUZiKzFLOS90b0Y0TGxRUE93Tm9WQXo1cURRNi9zVEJsWVdjTjh1?=
 =?utf-8?B?STNPdFB4VVJLVFBBVXVxdVI4dklaVEdIV2ExQ1Z6eEVCT1ZpRmtXejI4Und1?=
 =?utf-8?B?djB5aHUybUYyZ1FYdDI4bzNNN1dNQlBpcWxqbmFRbHFVRGxEYzRlRlBOMHQ3?=
 =?utf-8?B?ZTYzMVNTSlBQNENJSUdUYmdoYmxDNDN6S1JBa1pTZFhGb1lEbjdra3ViMm9X?=
 =?utf-8?B?Wis2SDNmdllNQmJNQ2ZLMWdxNzJaRzl4eFgrZkFCR2lGK09QVy85Mkcrcmg1?=
 =?utf-8?B?dWQrd0xHMzFQdjNiK3pJK0xLM0t1NmtCSHVTNWFJZjVnbUVXaS85WWFnTStx?=
 =?utf-8?B?azVENmJITkxIQmdpZGM2WUVraW9KY244THpTUWxqTVBSVzlvRFJ6YXpxSjBq?=
 =?utf-8?B?ampob0lSSnhSWVNWM1RRSzQ1dU51d0wxZFFCY3dMMTlKck56WDE0OU9yeEow?=
 =?utf-8?B?ZnQ3TWpGNUhnZUZzOFRTTVdWLzhSRUtMMkMvWlFwNjdGUlA5UElnaDlmYkFn?=
 =?utf-8?B?NDhqakprbHlBdE5nQVNabUcycUhLV1laTU1ZbGFtd0I5YnMzelNkYll3Q3lL?=
 =?utf-8?B?TG9Gays1ejhycHdGNGJhWU9XSGROMUF4Uk45ZjFwVDQ3WmdPTmhOQmVmZjd4?=
 =?utf-8?B?eWs2bk9xazZkV29qUUlCbFZQYXBBQ3IrMjIzZFZ6a0pjODlSdlkxdG1wK1FU?=
 =?utf-8?B?dlhkdlBBbCt6T04xZlNES04xYWc5bWJXb1hCdmlDR1ZZNVVSc1Nyd0FMeEhp?=
 =?utf-8?B?NHk2aUpPeXBOdTcxNWxHOEFuREwyN2UyajZtNlRuYzFwNUFIRisvQmU3ZXZh?=
 =?utf-8?B?K01tVXZqZ3hIVnpOYXl0RzR2RkQ5ZTJMV0FiNXNFLzVLa3prb1NKc2ZxYWd0?=
 =?utf-8?B?ODgyNEhmNHJ4bXVkQmFSTVlJVDJzaFdkQ3JjdFZLU3NoUm9WWE04TWxtQ3N2?=
 =?utf-8?B?ZUxxMER3bVZmbm5ZNEF5bzg4YVpXUGxPV2xuTHRnWldPKzRXU0pyNk1qUkZv?=
 =?utf-8?B?RHEyS2N2bTJzdzFxaU8rUU1RejFyejJvUmw1NHlyWWpvUmVpTDdwM003bWhR?=
 =?utf-8?B?MDVaUUJPQzVVbVNiMWVWM1NZNGcveG9CUDNlTzhud2R2UW1KdDlYbGVwaHlt?=
 =?utf-8?B?TjhuZk9zUGpRTnNNUll5b0FiaXJyTVlpR0E2VDNBcFVnS3hNbkZmMEVacnhW?=
 =?utf-8?B?UXRMYzFaVkNUQk1UMFFVd25FSEJ3bDRPVERSZWRyWUZlYmF0V3htMDNrMmpW?=
 =?utf-8?B?Rk91a0RXamVuM1cveGd4ajZTczZJdUtzR0RuTlNLdDhYYW44YUtsTGxPSjlE?=
 =?utf-8?B?WFUyamFCUG52VDFuSTRtSEpkWGxQUXk2WGM2czMyV1hncjRXNGRlU3dkeU0v?=
 =?utf-8?B?bTNkSDU5TjNERVRFRXJQRldreG0waFN0d212V0RqUDBHeUI1eTF4UndNNkdJ?=
 =?utf-8?B?TCtKTVRwSElBRlY0b0VqRStnLzdtMnEvQTFpSEh3TlEyclJxMGhvSEhrTXZq?=
 =?utf-8?B?QmhxVDlqVXRvblhOZ1JiWDluZ3RGenhiaUFjck1vN1hLYkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW1hb0VJTjk5RG5JSGNkT212a3ZEVEhidExWV0ZuVFpFdjJ1MUpGNzExejJV?=
 =?utf-8?B?TncvN2x1Y2U1OFg1OU5QSUhCbkluZTZyNnlZVndHcjNUbGhxMy8yRjJXNjRW?=
 =?utf-8?B?QUlxZzhhNFdxd2tSeVhVMlNBbDYxUm1XR3FlNFZtMnBVNG9la1BhcFBmTEg3?=
 =?utf-8?B?cDJmTW9SazZMaTlCK2owRFpxSDNRUnpYZWlqcFd4amlPV0h3VzVIay9pY0w3?=
 =?utf-8?B?bFUwd3p1dnVBeDhGbk40KzFVRFRGZkNWZkVNanNMZGowVUM2Nm9KN01Oc1lP?=
 =?utf-8?B?Y3FVeDJrc1RaZlkxRVN0cWVHRWY5dERidVlQMVZ2MzVtL2JYYXhLVHdGb0dD?=
 =?utf-8?B?Wi9WNzljNmVGemVNUDMxWHBYSUtKUG9OSFRKN05JL05xbEYyWStaZ1dSbGpP?=
 =?utf-8?B?aHBXdXNkRVVweWM3RzhEdjRoc09RUm1EaWt6cEJNV1lkUEYyc3pmQ2srTzJt?=
 =?utf-8?B?dTBSNmtkVjBFcERRRGVaNVZoSzg4VCt1ZjlDM3BLZlVSeVdFVUQxUHQ5NVdE?=
 =?utf-8?B?YWpOL0NMSm5ybExUdHQxMklTcGduQUZGWnI0a1hqejRRUUtDbmFVUXpPQzRN?=
 =?utf-8?B?ZFRJdHp6cFJmR3hnWmVmOW5FZlhLbGF3WkxRZDQvZDhCUnRoUXhDOG9iWEI1?=
 =?utf-8?B?SzdseUpaSzFFdVZ1Qy9XUE94VjBPK003L3pOK0hGbm9Md3YrT1p4eU5SR3NL?=
 =?utf-8?B?NGhQZlQ0N1BXNVJVdG1OMStVRzExYk1kZXVNZmdwN2FoTVM3YkVSbllqc0Nz?=
 =?utf-8?B?Wmp2b1lQSDdpUGlJbmFUa2VwdDNuQStOa3BNNDhEUXNFTno1cUpHZXQ2WE1x?=
 =?utf-8?B?dkhZTWIxanE3YVFHSEFoUy9WTU44OHBYdDlLRDkzYXgwVjNyQ0FYTko5SitV?=
 =?utf-8?B?bk5sN2xSeGJKdFJseGplNGV3T0NKTWtkR2dkengrdUJVU1R2NUcvZjl3Nnox?=
 =?utf-8?B?UjdhUjV2MU0ycTkyL0tPT0FDRHN6R3U5dllRNzJxUDB4N0VzNjNCbVMzTkVH?=
 =?utf-8?B?eVlMR3ROZFpxaDZOem0wSDhzQjd0azJiV3hMNm5mNHZzRnVKVXhPN1ZQZDRG?=
 =?utf-8?B?M2N2YWFXT1dpUkcvekVUUlNPaEJsZUhmaGVhL0VaNFRmOGpmVjh6amNNdWNz?=
 =?utf-8?B?d1o3RGhUL0c0WVQwL01HVG1tZnpra3Q1QVZRRTVBVFBxcERTWmpIUUhqSVBN?=
 =?utf-8?B?eUtSM0hwUnZ5QXYrZGZzU1BkVmNvZlRidGhqSXBCT1FsUVY5dnVFWFdqMG9z?=
 =?utf-8?B?M1dxSjczbUhsUk1rU0lrUXQ4Ujc1cEdqMDRLZkhWNTlFeTBpR2dMS1U5d25Z?=
 =?utf-8?B?NHArYmtsYXVHeEJ2Rjkwby8zUyttYTVidlVNNlpZeFVxS0xUSzc2T25nUzll?=
 =?utf-8?B?MEpNYTBndU56enlDQjI0TzBSMUlxSCsrSWdiV2J3UWNuZHJyblBWYTdrYUlO?=
 =?utf-8?B?S1pvVUtzOTdZcVhhVXR4aStSUGkwTmdWZ244UURzN3VzRVo1VlI1SktFVGo5?=
 =?utf-8?B?WEFDY2hjSi9oYzg1UC9aMXdlUTB1L3RvSnBKVW9nYm9CUTVxaTZTZExJZFJG?=
 =?utf-8?B?VzlUNEJtV1RzdFg2cFRPcDIybVp4YnBEcVNYK1dwMFZMQVJmcFpMNGNORDdl?=
 =?utf-8?B?cUJYTXNsRytlU2xVeG0wVHAwemozQUxEWGFRN3cyVmhyUCtCb1pUOHVINzFv?=
 =?utf-8?B?ZGsxZFFMQWlaaDkzcjhWeXcyc1I1MmpSRS9KSjV1ZzZ6YUlkOTR6QTNGUnV0?=
 =?utf-8?B?UGpBZU1yaGFoZkQyU1BVZ2RTODVxRXdxNnl2anBDSlNLdTh1ZCt4Y0xuRWd3?=
 =?utf-8?B?L2ZzdkJveDlsZExGZWpGUy9QRm54cDh0Z1BCUWQyaW1lY0EzU1ROeEx2Q0Z4?=
 =?utf-8?B?aHZiYkFLSGRhSDNhMEhCcnUxbmJJQU9sYUEwNHl3RDdKRVJQbzZDZTJFZ3VF?=
 =?utf-8?B?WnV5M20wK0RUdEtOYTA4RitKMUpaZVJlYmZGMFQ4bVZtQkZ3emt2blhQS0F5?=
 =?utf-8?B?NGtNVkZyZW9ySHBudjZXT3FCcHFwQnppbkpuNUZ5Rzk1SG4raXA2Mk0zRmFn?=
 =?utf-8?B?b2xpZjJSeGtFTEExYWM5OEoxSnlVWlNBaDhzQ2Y1c2JyK3NmV2d3UDMrZS9C?=
 =?utf-8?Q?38vlsDP0VfmqMm24VROGv7sCO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f98e6a-5afa-4177-b6ee-08dde580308b
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 15:41:29.4523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DH3TcsLlADEReLEWxoai25aL/As028kep/zAd5iIg4W9wsqEJsHA0fbSesjhGPxy3WTfyvAoyoRrrLlkae5vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5277


在 2025/8/27 20:58, Jacopo Mondi 写道:
> [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Qianfeng
>
> On Wed, Aug 27, 2025 at 08:39:10PM +0800, Qianfeng Rong wrote:
>> Change "ret" from unsigned int to int type in mt9v111_calc_frame_rate()
>> to store negative error codes or zero returned by __mt9v111_hw_reset()
>> and other functions.
>>
>> Storing the negative error codes in unsigned type, doesn't cause an issue
>> at runtime but it's ugly as pants.
>>
>> No effect on runtime.
> well, I'm not sure that's true.
>
> The code goes as
>
>          ret = __mt9v111_hw_reset(mt9v111);
>          if (ret == -EINVAL)
>                  ret = __mt9v111_sw_reset(mt9v111);
>          if (ret)
>                  return ret;
>
> And if ret is unsigned the condition ret == -EINVAL will never be met.
>
> I guess this actually fixes a bug, doesn't it ?
> You can add:
>
> Cc: stable@vger.kernel.org
> Fixes: aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> Thanks
>    j

I have written a test program on the arm64 platform:

unsigned int ret = -ENOMEM;

if (ret == -ENOMEM)
     pr_info("unsigned int ret(%u) == -ENOMEM\n", ret);
else
     pr_info("unsigned int ret(%u) != -ENOMEM\n", ret);

Output log is: unsigned int ret(4294967284) == -ENOMEM

I suspect that -ENOMEM is forcibly converted to an unsigned type during the
comparison, but I am not sure if this behavior is consistent across all
platforms and compilers. Therefore, I agree that your suggestion and will
submit the v2 version.

Best regards,
Qianfeng


