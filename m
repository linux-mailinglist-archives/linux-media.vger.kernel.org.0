Return-Path: <linux-media+bounces-50591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A7ED1A8A6
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 18:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3297301E1AF
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 17:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE28334DB4A;
	Tue, 13 Jan 2026 17:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bS8+ePkz"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532342F0C63;
	Tue, 13 Jan 2026 17:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768324455; cv=fail; b=UBgO4ldAITepw0fHrPWKFs4HClWgh5m3dScw7C5KV7qOe3uJ3YYJVPcDENQ6HJgwOLwiOdDE40itY6TqDAKrcSGHdkrtXVvMmoQhYnnb0GLqAXaK14RqffCS1i85YBM/1Yiwn5OO2H4C7VtJvqLCsVZS6nhC6w3YV/H5TlaqFAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768324455; c=relaxed/simple;
	bh=hnU7ilWzowivaxdCXMCRIEw+dFWaA98Sg6MGvcm6WJY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PfFkyPnGNElf/1jmSrgQlOfcWvfCQeeV1UBc98ubupNeSdP0V+jrxd8dOsWnYcgjIMNz8zhkYlY2feCrDs8JVYHDJOo4/7tuZxGr/hg8dBSZxe1QX/VY2cvKwAh/mc0hpvdkS+xu0TqJbd2Tmzuf6iVIfAk2tPc1Xxm0m7f7Mvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bS8+ePkz; arc=fail smtp.client-ip=52.101.46.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KO1tuJofj00SZ6y8K2EjbthlIqc9DH8279QQvn52H234R6zwvrCWcoYIasFbO8oa2i1FAn4yU/MoBszAvkFJ3NwLnBDyO9qyTKFmLkxEg8eTFhhz73wN7lNywMnO5sEBiHaRc6Pa2dtT9hw7Mij5JIFkVA2KfCbEScVaZIgVBSBgOUn7wLxlFIwkqgbcWYYmlmq1m/YA5iL+sZF+ul0ziaThyVFKdyX9obrhFcp4PRkkXdhTfm1fBoV27ODbco6VP8ohHmp9btv7Iis+tHp5THhvBzAVDIojKR2lmsUE1mVuKInNfoOO8rrsUGvVS2G3/x/mIj2WI81YHD5HxCn62g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2QSwFW/wjpdRGtC5/jy/JWbtyAr9QQhnsfNLU3SeoQ=;
 b=yivObZgySQEeixv3CaT6NpdHDRIO33GcdNPI8MCP7905BiX3zYZdf5l6ylf6QOduzrRuzY41B/khucXhbu0HU+y1hwJPmb9nqQK/AZKljsWzPnfmue1NDP4BOvxyIuOYI27uVEMvGrBq0qEjpU9n0NkY2VvEnSBKni4eQt7GgLHScd3zMjlwDtxDwRKR4kuEFGq4xm136FWpFYqJ5cN1vVrsj4RdZ8g8TaPFyDBorkfCepFWGi6QLy399jZ8Ez67AJvphzTDm8h4MiA7rW8nlt4cZHxcAqZFHtDafTRDccSRPtm7KXCoSqpFNsnLT0ndDnSkPG7hlPUqcgkPhywz/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2QSwFW/wjpdRGtC5/jy/JWbtyAr9QQhnsfNLU3SeoQ=;
 b=bS8+ePkzk7qajGmpaNvUDcu2fsgkQKC+vbsUSDIO4MaJ4ddRG6+S3tcqMzsUExQidwPaZ0ousLPAuMr4lavtGfvIz80Sp9Lfbev4TxQtTXs5S4P+HrHBPZzihF/5KazljPDnFTeS/okFaYfXTkDlw2Lv0WFsOJPdXlKmZR2kDQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB9492.namprd12.prod.outlook.com (2603:10b6:806:459::7)
 by LV3PR12MB9142.namprd12.prod.outlook.com (2603:10b6:408:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 17:14:05 +0000
Received: from SA1PR12MB9492.namprd12.prod.outlook.com
 ([fe80::a866:904d:73a1:d65d]) by SA1PR12MB9492.namprd12.prod.outlook.com
 ([fe80::a866:904d:73a1:d65d%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 17:14:05 +0000
Message-ID: <e2132038-2220-4cb3-b21e-f98848d41970@amd.com>
Date: Tue, 13 Jan 2026 12:14:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Add AMD ISP4 driver
To: Kate Hsuan <hpa@redhat.com>, "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
 Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com,
 anson.tsao@amd.com
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <CAEth8oGuoFH1R1NXVmFFrDmZeKLZSHnJO=wuXdaFYLFXi4upGA@mail.gmail.com>
 <CAEth8oHw6zjTYP31sCmpSX_Ac2Vb8QDnf=ZUt=tWGQeO9ApS=w@mail.gmail.com>
 <fcc79419-9f9b-4151-8a95-b287ecb0436b@amd.com>
 <CAEth8oGMNUuKCiW=wgQqpC29TWxAfRLiVMvy=eF5KX0Psqq3gQ@mail.gmail.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <CAEth8oGMNUuKCiW=wgQqpC29TWxAfRLiVMvy=eF5KX0Psqq3gQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0345.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::19) To SA1PR12MB9492.namprd12.prod.outlook.com
 (2603:10b6:806:459::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB9492:EE_|LV3PR12MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: f1dac108-7f54-4986-0f58-08de52c727ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUZLTE44WEdCQTV5ajdZeGtnakFOM0JGekFIODdSTWRFS2dCbEduSU94RllW?=
 =?utf-8?B?RmZnaDJtcmtJM291NlVHekxJWWhob3E0anZYME0vSFlkMFFKQjJjaHZPMDFD?=
 =?utf-8?B?UW94MzI5ekpNZXNrUVVrMWduemFFWHkxQnVpUlBBc09ZWGNpbzVPcWswdjA1?=
 =?utf-8?B?c3pYTXF4bllkV0FKLzNYaUpnUDlGWXduU1hEZ2l2VGxzVzNHdzFxcGxNdFVZ?=
 =?utf-8?B?M1poVlpyclVhbFgwSWlYQlNTcGhoQkhMR0JsSjM4dWU0VG1hbWNYSlczdkg2?=
 =?utf-8?B?b1hWN0NvQXJFVFFaaWE0akJGbkNBMEtaVnVnQlpodFRqWEswZkV5YzRQdG8z?=
 =?utf-8?B?Yng2bmJicmFFSUdMdFZBUitQTE1PM1VhaERlTm9RVk1wV3lqcVFOeWdMNWNN?=
 =?utf-8?B?bm5PcHhGcW1GcHR5a2lySmFWcE9sZWFBRHFCR3dUeFp1SzFKbXZCQk1aQ3Vu?=
 =?utf-8?B?c014bTUyOXEyQmFFS2R3MngxbTV3T0kxdnJ5QlZsRTRrZHloU0h3QVR2ZTlG?=
 =?utf-8?B?RG95VktNTVNHOXI2OXZsRUpGVWg3cXpsZUdmb1ovUUoxNERUT1ZlUEE3SkNC?=
 =?utf-8?B?aGJoQkdyT0tZVUZEM0NpdS9XTlh0K2doMkdoUFJPbXc4SWJGcC9BTXNpNGVn?=
 =?utf-8?B?SmhHem9yRjBCMitET0JGMVVERWNoSlJZcy9zMW1wUG05L0lQV01CSlNaWmhE?=
 =?utf-8?B?OHZlc043dUd4eC9GdS95ZzZVUTArUGRtY2Nibi92VW1kZlBPeVpENUt4ODJs?=
 =?utf-8?B?RVdiNWx1V2dGMjY3ODFoMm81TkhCS3NOWGRITDBiRTNPYXkyYnJXVnpwUytT?=
 =?utf-8?B?akM0clYyRnVzLzRaRWRTYzJoblRGay96NTB1d2JuelVubDROM0M5dGpmVXYz?=
 =?utf-8?B?SUhwTm5GQnB5aHc3b3BsRW9qbWs2SVdVeFpteGloQ3MzcExQaVJnZG40WS9E?=
 =?utf-8?B?dkdyejh2TDBQVUxGUW9BbGVoVG5yd3p6ZTJKdFNxdEFqRUx5RzYxWUhVUHpX?=
 =?utf-8?B?cnMrT0E4d2NEOWJDeW5SeVZHcWRKNXpGNU51TjlzeTlRdTFFME9TT0psNE4z?=
 =?utf-8?B?VEtOdTBGTFhTYTM5TVpxNTZ1WmI4VHY3aEtqU0hGVWpxeFRnaW5uTU5FTUtC?=
 =?utf-8?B?SWVQYUIwNVU3amI0czlleG1SdlBxakN6TDN1WGh1aVgvb0lnWTc1MFhPSEMx?=
 =?utf-8?B?VXdkSzZwZG5ZYlYydG1qeWllMkFUMXBIMEJDOTFNdnQxTWhFVWkxS01jRVIr?=
 =?utf-8?B?N2R4dGk5Ym53dUFQcWdqVHJaRS9qcGJldFQ2djZGdlllUTc2aS9HN1R3MXJw?=
 =?utf-8?B?aU1obElROXExWlJZdGpVRXJqQUswTGZDVG1TVWxoREtkbE1YcG94bzJ2ZmJ0?=
 =?utf-8?B?dU8wVzArWDJWMzQ4SUJ0ODBGUEVUR2t0WUo3OTBqZUlzQ21YOEloVTloLzRZ?=
 =?utf-8?B?M0ptN3l6VVlyWm9kUFRiVFkybThhWGFsaitaY1lGbWorMWpzWWZQZ211aWtS?=
 =?utf-8?B?UUwvREl2V2RLdFdwQlBDMWFBSHZES25MWnNic2Ura0ZRQ3dUTmdJeDRJRWFO?=
 =?utf-8?B?UnZ0azdwQm9LWVlrY3hSbXVsYTVHOWpZNktNNVpaaDhTTnNZR1FSNzFxVzEy?=
 =?utf-8?B?dVp5V0lneFRZWUsyblBVSHNNM0hVUkFWV0ZCbU1FaDRWaDg3dHYrSzAxQ2FB?=
 =?utf-8?B?cFViekZTU0xaaHFWMWZlY0RwbElkaVV6QUJkSkhSYXYvQy96c2sxV0N1Q3F2?=
 =?utf-8?B?VUtmalpPVC9kTGFmbFVPcG1IbjhHRmdoOUR6VHN1ckpBYTNXOENHbHRtQ0E2?=
 =?utf-8?B?dmVQUEJIbDRCSm85cVZDTzNjUk1GZ3d5azJ2eGRJMFAzNVZ6UWpZVHBYZ0Zs?=
 =?utf-8?B?cHF3TUt3aEd0ZXAySy84NVE1dmY1MVJ2TERmTTBMcDN3NVV4R1RlV3JUbnov?=
 =?utf-8?B?WThkd1Z2Y2s4M1c0TEVFZjlWU0RsdDBqQUNDOE1Fc0FWVERRU0pqMWd6emJN?=
 =?utf-8?B?dndyZkl3bFh3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB9492.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnJja0ZqV1YreFFJVUI1dlptVTdGcUhtYzBka2tRd2NQdTZDVTVCMVRBTlVR?=
 =?utf-8?B?UFljOTgyOU9kRVZuS2syYkJzT1VFT2dpUmtMbUVBZjBIei9EUTJoYW9xMGZk?=
 =?utf-8?B?Yk5EMmZvdzJkd1p4c284enFJZkZuWFQ4dHJXb0RBUlFNSHpNaEJMclVHU2VG?=
 =?utf-8?B?ZjRzWHI1aCtoanN4TGxPNElNTmt3bHF2cjlFU3U4R3dvYWM4WDI4MUVFeU10?=
 =?utf-8?B?TEhzS0hGR3M5Y0dkM3cxaGhzS2dnMEdYbDBiRW4yNjBkdlQwUXdtQjR1ajJQ?=
 =?utf-8?B?cFpxOFAvNzF3ZnNtWW9mcnQ3RWVob1RrTUxTSmJYOVBBY0lsaHhBV3RrWGQ4?=
 =?utf-8?B?dDRLeURsUU5YbW5PV3NuWDV0bHZ0S1czQ1FEMU9oWVVIVmN3Q0gwVkpiOUtv?=
 =?utf-8?B?TUlpazZ2UHd2UzJKcFNYMWJEMHVRSWVOaWs4aFdoYmkyTjEzcWR6MDU4MW1j?=
 =?utf-8?B?bE42OGxML3Fqa3c5ZHk4R2JHNThDdk1YNWQ4dC9hUjRqMkJPVDc4MTdLVWdQ?=
 =?utf-8?B?ZTJHM0lobUdxUjZxZHAxYjNWdGo3czdlaDFuYkpJVGNzQTV0cjR1N2RXRksy?=
 =?utf-8?B?bmJONWV3MHB2amQvVHVrd2cvbzZMR25oVHd6NFFqSENwTWUySllFMUo4Qmtv?=
 =?utf-8?B?aElEUHNTMThMa2UvcGZsSWUzZlA1Rkg4NW54QnQ4MkJSRzVGRU9WRHJhTkhu?=
 =?utf-8?B?VGsrL1c0OGM2UHM0aWpoQzhGMGhEa1VZc1VPcjBCSDZSTmRYOVpyUXRJTnBh?=
 =?utf-8?B?NW95WDF3QSsrbWZKWkdRcnArV3VmR1laR2tUWVIyTlovU24vYWVVcTJjUWox?=
 =?utf-8?B?bWxhanlUYk91d0h4blUyb3Jub0FlTVE2RDZmcStPK2x5eXYzMUdDMzJKRHRl?=
 =?utf-8?B?aE9iWjRwd3VTaVNWZWovbWxoRkVyb1REbUxYVDVJVHloaXhraHM2ZHUrSk5y?=
 =?utf-8?B?Q28vTDhleHNQNERtRUtTSW1JaFNrcTFPMXFDV2orZkZOUlBNVXYyZnhsaWVK?=
 =?utf-8?B?UzN1NWRKU2VlU3QyRk9WZjlVeWE2Z3FibmRnTGpETXdEajBGZTZEU3IzYk5w?=
 =?utf-8?B?SmlHMWwzQ0RuZkhqSWRHTDU3bmd4cVB4SmR1a1FKbUR2UVpKTXUyUFRpYm5D?=
 =?utf-8?B?eVE0dkk2VUFxOGZkMGUrdUd3NjM0NG5MeERSWkEwZzl4eHRlUUFTbDJGdDIx?=
 =?utf-8?B?cE92emxnaFhSV1pzUHh6RXl4b2g3cXlnL01wVVFZbHNaay95VXZzQnNkQ2Nn?=
 =?utf-8?B?UWNraWhWaHpyaDBMK3gvcmRmbm1tMUFmcW9lTHZkakVIWjJHWmJpUDNNUmF4?=
 =?utf-8?B?UHZua1o1UEJybDNFVkYzTDNETHAySS84aEFvNkwxQWRCNGJ4WjdmNUk2V1dW?=
 =?utf-8?B?U01UekdvbEpZeER2ZFhQcnYyOVp0Mk1KOEdHTFptT2Y5UEdhUTNNZEtZbUNI?=
 =?utf-8?B?YjFMOGd1R2E3N21JUmR4YWRtRThXc0R6bFBwcmVlMSt6MHY4ZTdQckNqSnQ2?=
 =?utf-8?B?bWdJQlhIQlkraEFLZEZkOS9wWmgvOTJSUnppdmdCVUZFUGlGc0YxT081OURG?=
 =?utf-8?B?RCs0ai83Q0RVOTcvT2VFSFJBandVT1RWZ2FyaTNyOUYzYnBaa1M1NGh5YVdz?=
 =?utf-8?B?OGhNMUxzRnBsSWFGOWJOeWZpelBqalcydzlrWEgydW0ycUcwVmM2cXN3SXZx?=
 =?utf-8?B?UjNDL1RFSFI2TFFJT0VWeUdRU2ZBYzVDeXFwa3JZbzdSOThWR0dDaGJQMHFX?=
 =?utf-8?B?b0VnKzNrZnFId2hySlRlRFFNVHROVXJtdE4renA4eHR3cWdUZ1IxdkZxWVFN?=
 =?utf-8?B?TUNnQmFVV2tCQzA1ZmY5ZXZsa2tMQWpsSFFFYUd3ZkExcWw3RFFnL1N5QnZu?=
 =?utf-8?B?SkhlbUxXSS9LQ2RMMVV5K01idEtzY2JnWDZDR1BoZFhqcmRZZG5QL05kaUls?=
 =?utf-8?B?SmY0Tnk4eGxsc2ZwVUN2TWZ2QUhYYU8wQVBPenI5Y0g1UnluTU52RC9lUnNv?=
 =?utf-8?B?b2hXSDl6ZXozbkY2Q2tLT1dNRkh0RHhTVXJHVEs0RlUxQzhjYzZaWkdVNWVS?=
 =?utf-8?B?WTJUVWptemFxWUc5Wk1JeU5kYTlJd01TaU0weTFGS1ltQVMyOTZTZXJzYVla?=
 =?utf-8?B?Nks0ek0vRkdNMmJ1U0FOMHVQeGt0VGx1SjZDa3ZNcUh6L084Q0VQbmtYeDY1?=
 =?utf-8?B?WnF1VnZZRzNNZzROV3F0UlI4bmRKdkJJbDJSZnM1c3BZN0RnaUFmTWVLVUJQ?=
 =?utf-8?B?ZCtSL2xaS3FiZmtLeCs1NWpRTDVtMExXa1lINUkyR2lQTDNBNllleFZRZFVu?=
 =?utf-8?B?RlI4QkxBWElDZUhHOEV2ek9xOGZsRUlxMmZZUWt6eVpPUVF1bWNmZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1dac108-7f54-4986-0f58-08de52c727ac
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB9492.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 17:14:05.5394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYqFlh3BzSeB+HoUWlcqYT5rLaGc43yBOk6y95Cjg5UhLO5P8BZaxC85q5+dCOHLU3HbBq+wnS2KWVcyt5S8Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9142

Hi Kate,

On 1/13/2026 9:11 AM, Kate Hsuan wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi Bin,
>
> On Tue, Jan 6, 2026 at 4:35 PM Du, Bin <bin.du@amd.com> wrote:
>> Thank you, Kate, for the verification, it gives us more confidence.
>>
>> On 1/6/2026 1:49 PM, Kate Hsuan wrote:
>>> Hi
>>>
>>> On Wed, Dec 31, 2025 at 5:03 PM Kate Hsuan <hpa@redhat.com> wrote:
>>>> On Tue, Dec 16, 2025 at 5:14 PM Bin Du <Bin.Du@amd.com> wrote:
>>>>> Hello,
>>>>>
>>>>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
>>>>> (https://ubuntu.com/certified/202411-36043)
>>>>> This patch series introduces the initial driver support for the AMD ISP4.
>>>>>
>>>>> Patch summary:
>>>>> - Powers up/off and initializes ISP HW
>>>>> - Configures and kicks off ISP FW
>>>>> - Interacts with APP using standard V4l2 interface by video node
>>>>> - Controls ISP HW and interacts with ISP FW to do image processing
>>>>> - Supports enum/set output image format and resolution
>>>>> - Supports queueing buffer from app and dequeuing ISP filled buffer to App
>>>>> - It is verified on qv4l2, cheese and qcam
>>>>> - It is verified together with following patches
>>>>>           platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
>>>>>           pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
>>>>>           drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
>>>>>           drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b667f)
>>>>>
>>>>> AMD ISP4 Key features:
>>>>> - Processes bayer raw data from the connected sensor and output them to different YUV formats
>>>>> - Downscale input image to different output image resolution
>>>>> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc.
>>>>>
>>>>> ----------
>>>>>
>>>>> Changes v6 -> v7:
>>>>>
>>>>> - Added missed blank line after some if statements.
>>>>> - Changed the pm_runtime_disable() order in isp4_capture_remove() to align with initialization.
>>>>> - Reset buf_sent_cnt and start_stream_cmd_sent on stream stop.
>>>>> - Removed duplicate buf_sent_cnt and start_stream_cmd_sent reset in isp4sd_pwron_and_init().
>>>>> - Combined isp4sd_reset_stream_info() and isp4sd_reset_camera_info() into isp4sd_uninit_stream() to eliminate redundant stream info reset.
>>>>> - Removed always-false status check in isp4sd_uninit_stream().
>>>>> - Minor style improvements.
>>>>>
>>>>>
>>>>> Changes v5 -> v6:
>>>>>
>>>>> - Lowered FW mempool buffer size from 200M to 100M (actual usage).
>>>>> - Added an irq_enabled member to the ISP subdev for proper IRQ disable handling in both normal and error cases.
>>>>> - Removed unnecessary .owner assignment from isp4_capture_drv definition
>>>>> - Updated IRQ handling to enable and disable interrupts via the ISP register for improved performance.
>>>>> - Revised ring buffer management in isp4if_f2h_resp(), addressing safety checks to ensure the read pointer is validated before memcpy operations, reducing the risk of out-of-bounds access. The ring buffer logic was also streamlined significantly.
>>>>> - Modified ring buffer handling in isp4if_is_cmdq_rb_full(), correcting an off-by-one error in safety checks that previously allowed rd_ptr to equal wr_ptr when the buffer was full.
>>>>> - Refactored ring buffer handling in isp4if_insert_isp_fw_cmd(), simplifying overall logic.
>>>>> - Resolved a regression from v4 to v5 where isp4if_dequeue_buffer() did not protect list_del with bufq_lock.
>>>>> - Addressed a subtle use-after-free issue that could occur if a timeout on a synchronous command coincided with completion.
>>>>> - Added missing pm_runtime_disable() calls to isp4_capture_remove() and to the error path in isp4_capture_probe().
>>>>> - Removed stray semicolons following closing curly braces.
>>>>> - Improved and clarified macro definitions in isp4_interface.h.
>>>>> - Eliminated unnecessary (u8 *) casts.
>>>>> - Added missing memset for firmware command structures in isp4sd_stop_stream().
>>>>> - Excluded streams 2 and 3 from ISP4IF_FW_RESP_RB_IRQ_EN_MASK, preventing their activation in the interrupt enable register.
>>>>> - Enhanced error handling to clean up kthreads in the event of startup failure.
>>>>> - Corrected a race condition during kthread creation where waitqueue head initialization could be delayed, as it was performed by the kthread itself.
>>>>> - Removed status checks in isp4sd_pwroff_and_deinit() that were always false.
>>>>> - Ensured isp4sd_init_stream() is only invoked once per stream start and reordered corresponding status checks in isp4sd_start_stream().
>>>>> - Improved error handling in isp4sd_start_stream() to propagate errors from failed functions.
>>>>> - Relocated debugging messages in isp4sd_stop_stream() to execute under lock protection due to access to output_info->start_status.
>>>>> - Eliminated redundant GET_REG_BASE() macros.
>>>>> - Removed isp4sd_is_stream_running() function.
>>>>> - Corrected error message in isp4sd_init_stream() caused by copy/paste.
>>>>> - Refined struct isp4_interface to remove firmware ring buffer configurations.
>>>>> - Removed obsolete isp4sd_is_stream_running function.
>>>>> - Removed pdev member from struct isp4_device, as it is unnecessary.
>>>>> - Fixed typo in 'isp_mmip' parameter name within isp4if_init().
>>>>> - Removed gap in struct isp4_subdev definition.
>>>>> - Performed extensive dead code removal and minor style improvements throughout the codebase.
>>>>>
>>>>>
>>>>> Changes v4 -> v5:
>>>>>
>>>>> - Transitioned VIDEOBUF2_V4L2 from 'depends' to 'select' within Kconfig.
>>>>> - Standardized object file naming conventions in the Makefile and sorted entries alphabetically.
>>>>> - Removed the unused macro definition to_isp4_device.
>>>>> - Eliminated unused members mem_domain and mem_align from struct isp4if_gpu_mem_info.
>>>>> - Deleted unused fields mc_addr and gpu_pkg from struct isp4if_cmd_element.
>>>>> - Removed obsolete pltf_data, i2c_nb, and notifier elements from struct isp4_device.
>>>>> - Updated platform_get_irq failure handling to return its actual result rather than -ENODEV.
>>>>> - Refined inclusion of header files for clarity and efficiency.
>>>>> - Appended comments following #endif statements in header files.
>>>>> - Improved implementation of isp4if_gpu_mem_free and isp4if_dealloc_fw_gpumem.
>>>>> - Removed isp4if_append_cmd_2_cmdq and revised isp4if_send_fw_cmd accordingly.
>>>>> - Enhanced isp4if_clear_cmdq and isp4if_clear_bufq by eliminating unnecessary list_del operations.
>>>>> - Adopted completion mechanism instead of wait queue and condition for command completion notifications.
>>>>> - Employed memset to ensure proper zeroing of padding bits in structures shared between ISP driver and firmware.
>>>>> - Streamlined IRQs, reducing total from four to two, retaining only essential ones.
>>>>> - Optimized IRQ handler logic using a while loop for greater efficiency.
>>>>> - Introduced dynamic IRQ enable/disable functionality based on camera status (open/close).
>>>>> - Applied distinct identifiers to differentiate multiple threads and IRQs.
>>>>> - Removed unnecessary initialization of local variables.
>>>>> - Refined camera start/stop workflow to mitigate potential synchronization concerns.
>>>>> - Replaced all remaining mutex with guard mutex.
>>>>> - Enhanced command and buffer queue performance by substituting mutexes with spinlocks.
>>>>> - Removed redundant isp4sd_init_meta_buf function and its references.
>>>>> - Limited firmware logging activities to the stream1 thread.
>>>>> - Relocated v4l2_device_unregister_subdev() and media_entity_cleanup() calls from isp4_capture_remove to isp4sd_deinit.
>>>>> - Resolved media device registration sequence issues.
>>>>> - Modified stream processing thread behavior to await IRQ without a timeout.
>>>>> - Addressed cleanup procedures in video device initialization and deinitialization routines.
>>>>> - Corrected typos and made other cosmetic improvements.
>>>>>
>>>>>
>>>>> Changes v3 -> v4:
>>>>>
>>>>> - Replace one mutex with guard mutex.
>>>>> - Remove unnecessary bus_info initialization of v4l2_capability.
>>>>> - Drop V4L2_CAP_IO_MC from capabilities of v4l2_capability.
>>>>> - Modify document with better SOC description.
>>>>> - Fix Test x86 failure in Media CI test https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/83470456/artifacts/report.htm
>>>>> - Modify some commit messages by describing changes in imperative mood.
>>>>> - Add media-ctl output in cover letter.
>>>>> - Create separated dedicated amdgpu patch to add declaration MODULE_FIRMWARE("amdgpu/isp_4_1_1.bin");
>>>>> - Fix typo errors and other cosmetic issues.
>>>>> - Add DRM_AMD_ISP dependency in Kconfig.
>>>>>
>>>>>
>>>>> Changes v2 -> v3:
>>>>>
>>>>> - All the dependent patches in other modules (drm/amd/amdgpu, platform/x86, pinctrl/amd) merged on upstream mainline kernel (https://github.com/torvalds/linux) v6.17.
>>>>> - Removed usage of amdgpu structs in ISP driver. Added helper functions in amdgpu accepting opaque params from ISP driver to allocate and release ISP GART buffers.
>>>>> - Moved sensor and MIPI phy control entirely into ISP FW instead of the previous hybrid approach controlling sensor from both FW and x86 (sensor driver).
>>>>> - Removed phy configuration and sensor binding as x86 (sensor driver) had relinquished the sensor control for ISP FW. With this approach the driver will be exposed as web camera like interface.
>>>>> - New FW with built-in sensor driver is submitted on upstream linux-firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
>>>>> - Please note the new FW submitted is not directly compatible with OEM Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and the previous ISP V2 patch series.
>>>>> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
>>>>> - Included critical fixes from Sultan Alsawaf branch (https://github.com/kerneltoast/kernel_x86_laptop.git) related to managing lifetime of isp buffers.
>>>>>         media: amd: isp4: Add missing refcount tracking to mmap memop
>>>>>         media: amd: isp4: Don't put or unmap the dmabuf when detaching
>>>>>         media: amd: isp4: Don't increment refcount when dmabuf export fails
>>>>>         media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>>>>>         media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>>>>>         media: amd: isp4: Fix implicit dmabuf lifetime tracking
>>>>>         media: amd: isp4: Fix possible use-after-free when putting implicit dmabuf
>>>>>         media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>>>>>         media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>>>>>         media: amd: isp4: Remove unused userptr memops
>>>>>         media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc()
>>>>>         media: amd: isp4: Release queued buffers on error in start_streaming
>>>>> - Addressed all code related upstream comments
>>>>> - Fix typo errors and other cosmetic issues.
>>>>>
>>>>>
>>>>> Changes v1 -> v2:
>>>>>
>>>>> - Fix media CI test errors and valid warnings
>>>>> - Reduce patch number in the series from 9 to 8 by merging MAINTAINERS adding patch to the first patch
>>>>> - In patch 5
>>>>>           - do modification to use remote endpoint instead of local endpoint
>>>>>           - use link frequency and port number as start phy parameter instead of extra added phy-id and phy-bit-rate property of endpoint
>>>>>
>>>>> ----------
>>>>>
>>>>> It passes v4l2 compliance test, the test reports for:
>>>>>
>>>>> (a) amd_isp_capture device /dev/video0
>>>>>
>>>>> Compliance test for amd_isp_capture device /dev/video0:
>>>>> -------------------------------------------------------
>>>>>
>>>>> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
>>>>> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
>>>>> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
>>>>>
>>>>> Compliance test for amd_isp_capture device /dev/video0:
>>>>>
>>>>> Driver Info:
>>>>>           Driver name      : amd_isp_capture
>>>>>           Card type        : amd_isp_capture
>>>>>           Bus info         : platform:amd_isp_capture
>>>>>           Driver version   : 6.14.0
>>>>>           Capabilities     : 0xa4200001
>>>>>                   Video Capture
>>>>>                   I/O MC
>>>>>                   Streaming
>>>>>                   Extended Pix Format
>>>>>                   Device Capabilities
>>>>>           Device Caps      : 0x24200001
>>>>>                   Video Capture
>>>>>                   I/O MC
>>>>>                   Streaming
>>>>>                   Extended Pix Format
>>>>> Media Driver Info:
>>>>>           Driver name      : amd_isp_capture
>>>>>           Model            : amd_isp41_mdev
>>>>>           Serial           :
>>>>>           Bus info         : platform:amd_isp_capture
>>>>>           Media version    : 6.14.0
>>>>>           Hardware revision: 0x00000000 (0)
>>>>>           Driver version   : 6.14.0
>>>>> Interface Info:
>>>>>           ID               : 0x03000005
>>>>>           Type             : V4L Video
>>>>> Entity Info:
>>>>>           ID               : 0x00000003 (3)
>>>>>           Name             : Preview
>>>>>           Function         : V4L2 I/O
>>>>>           Pad 0x01000004   : 0: Sink
>>>>>             Link 0x02000007: from remote pad 0x1000002 of entity 'amd isp4' (Image Signal Processor): Data, Enabled, Immutable
>>>>>
>>>>> Required ioctls:
>>>>>           test MC information (see 'Media Driver Info' above): OK
>>>>>           test VIDIOC_QUERYCAP: OK
>>>>>           test invalid ioctls: OK
>>>>>
>>>>> Allow for multiple opens:
>>>>>           test second /dev/video0 open: OK
>>>>>           test VIDIOC_QUERYCAP: OK
>>>>>           test VIDIOC_G/S_PRIORITY: OK
>>>>>           test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>           test VIDIOC_G/S/ENUMINPUT: OK
>>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>           Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Control ioctls (Input 0):
>>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>           test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>           test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>           Standard Controls: 0 Private Controls: 0
>>>>>
>>>>> Format ioctls (Input 0):
>>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>           test VIDIOC_G/S_PARM: OK
>>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>           test VIDIOC_G_FMT: OK
>>>>>           test VIDIOC_TRY_FMT: OK
>>>>>           test VIDIOC_S_FMT: OK
>>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>           test Cropping: OK (Not Supported)
>>>>>           test Composing: OK (Not Supported)
>>>>>           test Scaling: OK (Not Supported)
>>>>>
>>>>> Codec ioctls (Input 0):
>>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls (Input 0):
>>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>           test CREATE_BUFS maximum buffers: OK
>>>>>           test VIDIOC_REMOVE_BUFS: OK
>>>>>           test VIDIOC_EXPBUF: OK
>>>>>           test Requests: OK (Not Supported)
>>>>>           test blocking wait: OK
>>>>>
>>>>> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
>>>>>
>>>>> The media-ctl output of media device /dev/media0:
>>>>> -------------------------------------------------------
>>>>>
>>>>> atg@atg-HP-PV:~$ media-ctl -p -d /dev/media0
>>>>> Media controller API version 6.17.0
>>>>>
>>>>> Media device information
>>>>> ------------------------
>>>>> driver          amd_isp_capture
>>>>> model           amd_isp41_mdev
>>>>> serial
>>>>> bus info        platform:amd_isp_capture
>>>>> hw revision     0x0
>>>>> driver version  6.17.0
>>>>>
>>>>> Device topology
>>>>> - entity 1: amd isp4 (1 pad, 1 link, 0 routes)
>>>>>               type V4L2 subdev subtype Unknown flags 0
>>>>>           pad0: Source
>>>>>                   -> "Preview":0 [ENABLED,IMMUTABLE]
>>>>>
>>>>> - entity 3: Preview (1 pad, 1 link)
>>>>>               type Node subtype V4L flags 0
>>>>>               device node name /dev/video0
>>>>>           pad0: Sink
>>>>>                   <- "amd isp4":0 [ENABLED,IMMUTABLE]
>>>>>
>>>>> Please review and provide feedback.
>>>>>
>>>>> Many thanks,
>>>>>
>>>>> Bin Du (7):
>>>>>     media: platform: amd: Introduce amd isp4 capture driver
>>>>>     media: platform: amd: low level support for isp4 firmware
>>>>>     media: platform: amd: Add isp4 fw and hw interface
>>>>>     media: platform: amd: isp4 subdev and firmware loading handling added
>>>>>     media: platform: amd: isp4 video node and buffers handling added
>>>>>     media: platform: amd: isp4 debug fs logging and  more descriptive
>>>>>       errors
>>>>>     Documentation: add documentation of AMD isp 4 driver
>>>>>
>>>>>    Documentation/admin-guide/media/amdisp4-1.rst |   63 +
>>>>>    Documentation/admin-guide/media/amdisp4.dot   |    6 +
>>>>>    .../admin-guide/media/v4l-drivers.rst         |    1 +
>>>>>    MAINTAINERS                                   |   25 +
>>>>>    drivers/media/platform/Kconfig                |    1 +
>>>>>    drivers/media/platform/Makefile               |    1 +
>>>>>    drivers/media/platform/amd/Kconfig            |    3 +
>>>>>    drivers/media/platform/amd/Makefile           |    3 +
>>>>>    drivers/media/platform/amd/isp4/Kconfig       |   14 +
>>>>>    drivers/media/platform/amd/isp4/Makefile      |   10 +
>>>>>    drivers/media/platform/amd/isp4/isp4.c        |  235 ++++
>>>>>    drivers/media/platform/amd/isp4/isp4.h        |   20 +
>>>>>    drivers/media/platform/amd/isp4/isp4_debug.c  |  271 ++++
>>>>>    drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>>>>>    .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>>>>>    drivers/media/platform/amd/isp4/isp4_hw_reg.h |  124 ++
>>>>>    .../media/platform/amd/isp4/isp4_interface.c  |  789 +++++++++++
>>>>>    .../media/platform/amd/isp4/isp4_interface.h  |  141 ++
>>>>>    drivers/media/platform/amd/isp4/isp4_subdev.c | 1057 +++++++++++++++
>>>>>    drivers/media/platform/amd/isp4/isp4_subdev.h |  131 ++
>>>>>    drivers/media/platform/amd/isp4/isp4_video.c  | 1165 +++++++++++++++++
>>>>>    drivers/media/platform/amd/isp4/isp4_video.h  |   65 +
>>>>>    22 files changed, 4480 insertions(+)
>>>>>    create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>>>>    create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>>>>    create mode 100644 drivers/media/platform/amd/Kconfig
>>>>>    create mode 100644 drivers/media/platform/amd/Makefile
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
>>>>>
>>>>> --
>>>>> 2.34.1
>>>>>
>>>>>
>>>> v7 worked on my HP ZBook Ultra G1a 14 inch Mobile Workstation PC and
>>>> the camera worked fine.
>>>> It was tested with the latest upstream firmware [1] and 6.19-rc3 kernel.
>>>>
>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/amdgpu/isp_4_1_1.bin
>>>>
>>>> Thank you for your work :)
>>>>
>>>> --
>>>> BR,
>>>> Kate
>>> Leave a "Tested-by" tag for my previous testing assertion.
>>>
>>> Tested-by: Kate Hsuan <hpa@redhat.com>
>>>
>>>
>>>
>> --
>> Regards,
>> Bin
>>
> The ISP driver works perfectly with a clear and sharp video. I tested
> it again, and I found a suspend/resume issue.
> The ISP can't suspend when the system is set to suspend. The privacy
> LED is on when the system is suspended. Therefore, the user will see a
> luminous privacy LED when the system is set to suspend.
> Today, I made a work to move all the power control to use the runtime
> PM, including suspend/resume. This work may be humble and may break
> the finite state machine but it works. The major changes of it
> include:
> 1. Support suspend/resume.
> 2. The power is managed by the runtime PM so the s_power and the related
>     callback function were dropped.
> 3. The enable_isp GPIO pin is controlled by the runtime PM.
> 4. pm_runtime_get_noresume() is used to get the runtime PM at probe()
>     since the device doesn't have to be set to power on when initialising.
>
> This work stops the video stream on suspend and starts the stream on
> resume so the privacy LED is turned on and turned off with the changes
> of suspend and resume.
>
> Could you please consider this patch and idea?
>
> Thank you :)

Thanks for reporting this issue and also providing the patch.

We have addressed this issue recently. I suspect the below fix in AMDGPU 
available in v6.19-rc5 is missing in your build.

https://github.com/torvalds/linux/commit/7ed51e3a1381422278933d0d3ebda0268b6825de

I have tested locally and this issue is not observed with this change 
included. Can you please check and feedback if this solves the problem?

This change takes care of handling isp suspend-resume as part of amdgpu 
device suspend-resume instead of genpd, and uses the pm rumtime as you 
have suggested.

Thanks,

Pratap


>
> --
> BR,
> Kate

