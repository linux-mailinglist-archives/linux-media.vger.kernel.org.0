Return-Path: <linux-media+bounces-40707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A856DB30BD1
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 04:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54EF35E5AF1
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A131B043F;
	Fri, 22 Aug 2025 02:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TjQL9815"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861E78F7D;
	Fri, 22 Aug 2025 02:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755829733; cv=fail; b=hdWR/8RUT+aGvW6dndZ3TiP6S4jWHam8IUO7g5GL3ptgbmUhbjInz3yAp19S4wb+Dw9cuPP3+ONGzd3UpScD+gIlofce+JjYAGgxS/sFdR1OWYg/3t4wtxN7/RybRwu0j6lW1go2SQRhvTNgR+4S9Cwfxzr2H/eZuLU291kaJ48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755829733; c=relaxed/simple;
	bh=68lIB3m7iFgTzngOJL6flDrO5LFKESaxV5EB52mNMnI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Hpm49qxaILvNam7zTBZc8HN3NsWojup2KkY2YdZyAZX/U+wh36Ih/QHahujA2lfmYHZRqnm9V1QuO7QM83j5oUScVoq52axPRmiTQ6tOHOm8yJEyy0oDXfGVGyRgBiAE6JqhbLsq39dk/625Lit9AzBc7Kv4PGdxomKcGoutXbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TjQL9815; arc=fail smtp.client-ip=40.107.92.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtZSz+NTItLVTC2Uojr62pU70jFTowL8P/kKOZrfC0eX/uhDvCfg5PKR3U+JrqOHN5RHLFi1XT+WQx3Rbn/red4P+N9YVK1thkUQWG0jO8yelK96fIUiZi47m1oIuceUrMM7jYceRl2cqGJqHG4Ul5EW6LQA7PxW/nGa6k5kABTJ/WbyC6nc0Esh6lfRLpn4Nr4q0Irj1Lt6VsrTg/dXrtOspKIlyghBgHLdfjLlvpE4QHYvP69sEFszk7ZsMdS64al+HJCkBclARbDuJpeWqpolmPWPRirpEmsfRslnceo9Zq7xO/A6XQbg92XiBd43Aq8GEmn4E3PTdCCj8iVIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aiyszTl1KCm60yvL9/uRh908YrvLG4PW6iniDAJFzY=;
 b=pRMQhUkZNCJk9hRAn2nlQSfIl7UDKRPWxf6yZksC0FZpzqafL4eTkyo2PT1vrFYeAYwfi2nEE/jdagI9WyYadY5C2plwOEDclW/RlGyDs5Jcb7n73EzlS7H8x+WInYdPksHvQfiS/1tsPUaiN0tuS5rP5egpNy8wRC6hXD9+nhQc5m9qrtdS4zmvA/9NH0S9ytjrvQtMVsJcLxF7ZjMx69Lzgeuml983HOS9k0G4Q6tnD0KkMhkLFzYVXIiFecVkxZ6dKB1SgYt/Jd0fO8jT9pSUbAaZew1YFcHCr11aZO5xettIBa5bLXYJtrZaSTV9Ixfk4Bhm9NN3HLA80fndTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aiyszTl1KCm60yvL9/uRh908YrvLG4PW6iniDAJFzY=;
 b=TjQL9815df2ohpPEfcnpKLrXDaniivMxj2SVDayerYz5aDNVuFruGh7Be62Ly4oMvHYAiUVRLWkh3XpzkeuNpuMXXljhj/b3mW/ppzEFJjc9hiVsKQDcknqkudQP5HlQMUiGZ+tqGI/PZbQrQoYg9DDEE9zxFKt4hENBA3md8ls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.14; Fri, 22 Aug 2025 02:28:48 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 02:28:47 +0000
Message-ID: <9b56ab20-dc09-47a8-8ab2-c8ef1fd8f782@amd.com>
Date: Fri, 22 Aug 2025 10:28:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] Documentation: add documentation of AMD isp 4
 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 bin.du@amd.com, Mario Limonciello <mario.limonciello@amd.com>,
 Richard.Gong@amd.com, anson.tsao@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-9-Bin.Du@amd.com>
 <20250805113719.GF24627@pendragon.ideasonboard.com>
 <e614b565-81e0-49c0-93dc-af1936462728@amd.com>
 <20250812134222.GN30054@pendragon.ideasonboard.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250812134222.GN30054@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0108.apcprd02.prod.outlook.com
 (2603:1096:4:92::24) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff12188-fad8-4e52-7fa9-08dde1239f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFFCbHExMWpqb1Jab29lTlVzT1JHREF2ZWc0SlpDc0gyeG9kNTJHMm5WZHJr?=
 =?utf-8?B?N3VzWWwyUGZTdlpHMExrSHZZRUtkejN4VmlpN04wdDM2aDNLVEdLRDFqc05T?=
 =?utf-8?B?RlNmWWgxM3dpL3NDRktVV3V0TnNkY2h5MFdIcnIxU3dzSG1hZEJxOXd5ZXcx?=
 =?utf-8?B?V3hUaUQveUMvb1BZZUEybEg3UTh4YUF6UFlKbEJrWk9wTTRBWU9vY3d5eTlJ?=
 =?utf-8?B?ZlROcWxBem1CUkFPbzd1eE9TZ2tCSXE0OVIzRkswVHdMd3BVRmFuZjJmUVp1?=
 =?utf-8?B?a2FzRG5PWXZuTUN4LzlNUVJzUmNuMDQ5QzRvV3FIdk1jeVJTVEhtYnNZMnBh?=
 =?utf-8?B?M1BsM0VtWW1FN3d0Qy9QdHVtMDViVG5Uelh5bWxDVmc2djkzZ0FHVUt5a2Fp?=
 =?utf-8?B?QnV1U0V3QVIyTFQxSitOZE9za3BTUFhUd0ozK3k3L2pFbHpwSjlXcmtabjhX?=
 =?utf-8?B?VWpjdXFKeXZ6SDIvbFVDeTdUVmMwbytZZmUzeTV5bCtKNmtGQzVpdzNBcnZP?=
 =?utf-8?B?NnRtWDNFNm5XSUhQREZXc001OXE4RGhPMHZYNGJ2WnUyS01tY0x3SGRSM3l2?=
 =?utf-8?B?K1NHZ2VSaStuNGF4OERJUm4zM1JSR0hnMUllSEhCVFRhOS9FQnlaM0tjR2pV?=
 =?utf-8?B?NzNTUE9JOE5oeEFyQUVycGZJWTBVYllldWlPWldHeXRCeFZVbmZDLzJOaEF5?=
 =?utf-8?B?MW9lTStGUHgxVGlJWGk4RHpIK0ovcWtxcGRFTkpsenVkeEZkTEtVbFgrVmpi?=
 =?utf-8?B?T2txQUx3NVVvODFWcVR5VWpKVktkWFQ5VFk2Vm5JaFBmZkRSSi95NWFCK3Jx?=
 =?utf-8?B?TU9OTXo0NjNIQ0Jlajd2RXVHTXF6bXpocml5eVQwa0FzaDdEOWh4Rk96M25G?=
 =?utf-8?B?WVBYRC9aTVRySDVHcStvTSt4Q29ZTXpMU1E0ZzRSUkZmZlZzeU45Z1RzTTlG?=
 =?utf-8?B?OTQ2enFmV1VJcC9ta2lzdWNVVVc3RWZiZm5EN3FQSjZ1Ulo5RGFzUFl6cjcy?=
 =?utf-8?B?dHYrd3BZVzhsQ2FaaWU5ZTRjN3Y1Y2Y1dkxhWUFLVUNSeUR4NHpFR2psdVFE?=
 =?utf-8?B?TjFUNEhzVVFFL1NGdE9LR1pkMy9GRU1CNHMwa2ZVbTZpWGtWVDVDOVhoQmR1?=
 =?utf-8?B?MkNpZGI1SnNaVzVEd0tyOHRsNzFtTTdZekhwbEdRcDk3TVBCUjhmbk5jNTI3?=
 =?utf-8?B?bklZYmdTdXdPTVBpN3Z6bmNpeGliSWl2cmtSMEt5RytGY3djTmJjaWU3ZkxS?=
 =?utf-8?B?UGR0eVpvNUhVTHlldmxuN01zSUE1TjVSczNwQkxsLzEyVnZhOW03MUNRcHVy?=
 =?utf-8?B?clFoVUtpQVRRTkp5bWNwcXoxTVhJNG16VHNmeUxQalNUcy95d1lNYWdmQk5Z?=
 =?utf-8?B?MThVcWEyNnlGU2pnb0t3WGhydW9CWVJMakp4VXpQWEtVdEJpcEFzTVZyRko3?=
 =?utf-8?B?ek9NalJsclBrdGg4V3FtQzhHTFFzTGs4U2R3R21yR0xtbkVCeURtOEtLZU5I?=
 =?utf-8?B?RTZSMnNhT3FyeVlDVnR0Q0pLYTNtN0liRnFuVlNONjVsV1REOUJITW1WdldX?=
 =?utf-8?B?R2J3ODA5cUZ3Y1loSDRwRlFyVzhoT2E0MWdxY1ZQZ29mcWduV0JRVDdkb3c1?=
 =?utf-8?B?ZHZNTlo0WG5aSSt5WTdPc2E1T0J6R0Rzb2prQndQeXczRSs5NTk2ejArK3h4?=
 =?utf-8?B?d3dyd2Vjc0U4bHRHMnp2SnhHZTZORk41SHdBdWxJZFBDamo1LzJ0MGpqSHlJ?=
 =?utf-8?B?Q2s2cFd1bmwzTXpNNlN5aDVQOVhlYWR6bjFBZW1udDUyYXlndGJXVHdma2cw?=
 =?utf-8?B?em5QeWVIdHZBVUdJWW0vZ3gwcjA4VjVOdExyK3psN09yOFFQYzVqeEdBUWd4?=
 =?utf-8?B?a3hGeGU4eTkybjNyN1lpOHdPU2VtQWJCeHV3TkpySEQ0VDI1WkNOd3prS000?=
 =?utf-8?Q?kzyIVg60gRE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFVjV0tQRFhlOXRMa3pBcXFpd0Vtc3JNeDJMb1lFaHFJL1A4T3FyYjhMMVA4?=
 =?utf-8?B?TFdNQTBjQ0ZsOWp2RzZBdkpBcWU1aE5kRElIQlRHa21LWXhSbFp4Q1hhekgy?=
 =?utf-8?B?N29vbVhtemVwTWl3WnFWOHJTY3VsSUdEaWJ4dDRxejRsS0JOUFZBTzdPc1hS?=
 =?utf-8?B?SUNvVU9yVTB6Z01RcUpwVUdUTVVVZmlFY0oyckNscXZGUnp6Yms4dGdGSzAy?=
 =?utf-8?B?U3UzQTV0aUFjdHVmcit4WHJ0WHIzTFE4MWM4cFBscUIxbUtCY2hUeFRON0I1?=
 =?utf-8?B?QzQrTnhBa2VtRFlNMmw3M2hKRXllY2ZWN1RER2NMN1hqMXhWRElxeDhWTFBN?=
 =?utf-8?B?RVNuektEb0g2a1p4SWovb3lXVHg2SG4vb3ZobGJDSGZqbGI3WW5EZE9JdzNH?=
 =?utf-8?B?QkMvVVhBeG5nQll6bTV3cEJTdno1ZGpMR1k0clhSNXNUallicVRpc0FJR2c3?=
 =?utf-8?B?bm1oUG5ObythODgwN25icTdLdWRHNHoxMUZmRktBV3MvazJzQlo1cUJVTW5J?=
 =?utf-8?B?OEl1cU01eTVGNGptNWM3WlQzZ1BIS0o5K0tod2YxZ1Z5bHhwNmhDMXhDREpW?=
 =?utf-8?B?L3lJS0FNTFNoQ3Y1enByZDNWZUtrYW1ZNWhPeEZEYmU5UWF3R2RMeWRFeXhZ?=
 =?utf-8?B?d1Rib2NyZitTS2Y4bzExQ1EycFdmTzdCQ3I2SVVSY1ZYSHlkNFBqanRrLzRV?=
 =?utf-8?B?LzFwZnpLT2VrUW0ybEthdThxekxwRWVyTVNGS1V1b21mRC9xZEFPUXFwL0Fo?=
 =?utf-8?B?UUphekhWNTJWdWN0bWxmR3VzbFJvVWJxR3FYeHJVMFcrY2M0T0tkMzZBYnBq?=
 =?utf-8?B?blZhMlpmTmRKQUFuUXVQTXdFbHdxdTEzMEtFUFhzbTlTL25pNnBlUUhlQnZi?=
 =?utf-8?B?NjlzTGpZcTh3YkZuRldNNHg1OG9TWHNLNUdUTFQycER3eFk1K0xUeXR3aHcr?=
 =?utf-8?B?ZENoZytEWHhDKzFBQk9ERm5Ka1djK3ZERmpjbVI4dzBkdU0yQ3Bxa3BZSGxo?=
 =?utf-8?B?WFRBYkNoOCs4NW8zUVVrc3RmSHQxWlVFT3BXSGp6WkVuMCtBMTQyUWJiZ0t6?=
 =?utf-8?B?SFBNZGpEbVpweGlwd3ZQT1l5YkNMemxQZmxUbk5yUExwaCsyY0N5bmdDbk1w?=
 =?utf-8?B?N29jM0Y4bkM0bU5EMThTS1NPdHJFTnc5OHgzTkdYUm45dU9rTXdleTJFZjV5?=
 =?utf-8?B?OW9aTFVTd0lkM051azdTdTBvS3ZMNUFuNEV0Q0NpN1NMVlBpcmY1T0VjZWdT?=
 =?utf-8?B?YWJTTmh2bkhBY3BKNkgvelRrN0xkU25HYWF3QWpWT2dRbk9uTUNYdWk4U0Z5?=
 =?utf-8?B?YnVwdTFCQkE3VHJncmtZWmdsUXJ5VGkwcXVZbXBta09QV0NidWh2N3ZHbmhW?=
 =?utf-8?B?b1FJems1WGZUM1R0TGRXRzZrMEdBU1BVZ0tSd2lsZzhiN0VrMmdCUjFOT2V6?=
 =?utf-8?B?ekpoOWhZSENSSGtJcDFjS0FOa3MzMkpHZ0dvbExOTlZTTFdCSHkrVjVaUEs4?=
 =?utf-8?B?L0ZZak4rakE0QmhFS1hvQTJVeUJPSHF2OG0vc21CMHZaeWt1VFBIdUlzNE1X?=
 =?utf-8?B?UmNhZm5zVUxvS1ZwWnRMV1VzUWptUEVFN3BQVUpvb3Y4MXlkSzFGT0Q1RkJu?=
 =?utf-8?B?aitWckFpeTViNmNmNk1KVUVmek85RUhMWHhDdFR3cWZza0FRais1dkY3RG5L?=
 =?utf-8?B?blVxcnFUZlRWcUNJRlVzRFgrUkxkUDVRczk0YWQ0TGVwQ0pjNTRaZlUzS3ZF?=
 =?utf-8?B?cGQ2Q0cwYTl0OHFMbUdsL2xmcUhvMFpoRVFtc0x3RmNPeVRaRlFQZGh6eFBt?=
 =?utf-8?B?NUxQcm55b1ZCZEFKYk1LRjNFQ2p1eVREZ0w2U3l0OEpKY3k3MmlCRnlYbmp2?=
 =?utf-8?B?K2dmZWpDa2ZRbkxqYmJCd1JUWEsxZkN1QXZmS043U3NFdGpXTjVaUC8zQ3l0?=
 =?utf-8?B?bEFWMGMyWXVzRWIxMXo4bGxuU0xoTEx1eklid2IrUHFBc01YT1JrWHNwYkwy?=
 =?utf-8?B?MExiZk1od2owd0c1K1dhWm5uZVFTQ3BtNkdBQjdLQ2Nyc3RSUThpcmpwTGdM?=
 =?utf-8?B?dFdJWFdHbTcwVk5oOHNzd0FBQjREdUJNVnY3TTlPbXorelhzaUlKd3laM1g0?=
 =?utf-8?Q?hh0g=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff12188-fad8-4e52-7fa9-08dde1239f56
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 02:28:47.3719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nqGGTnzmxDiwnH5sWC5TWGoEm1aeui4z6OvDshM4UTQel4/kcNVlRXfHGI8vV9S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446

Many thanks Laurent, sorry for the late response because we had a lot of 
internal discussion and did possible solution prototype validation.

On 8/12/2025 9:42 PM, Laurent Pinchart wrote:
> On Tue, Aug 12, 2025 at 09:36:04AM +0800, Du, Bin wrote:
>> On 8/5/2025 7:37 PM, Laurent Pinchart wrote:
>>> On Wed, Jun 18, 2025 at 05:19:59PM +0800, Bin Du wrote:
>>>> Add documentation for AMD isp 4 and describe the main components
>>>>
>>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>>> ---
>>>>    Documentation/admin-guide/media/amdisp4-1.rst | 64 +++++++++++++++++++
>>>>    Documentation/admin-guide/media/amdisp4.dot   |  8 +++
>>>>    MAINTAINERS                                   |  2 +
>>>>    3 files changed, 74 insertions(+)
>>>>    create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>>>    create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>>>
>>>> diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
>>>> new file mode 100644
>>>> index 000000000000..417b15af689a
>>>> --- /dev/null
>>>> +++ b/Documentation/admin-guide/media/amdisp4-1.rst
>>>> @@ -0,0 +1,64 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +.. include:: <isonum.txt>
>>>> +
>>>> +====================================
>>>> +AMD Image Signal Processor (amdisp4)
>>>> +====================================
>>>> +
>>>> +Introduction
>>>> +============
>>>> +
>>>> +This file documents the driver for the AMD ISP4 that is part of
>>>> +AMD Ryzen AI Max 385 SoC.
>>>> +
>>>> +The driver is located under drivers/media/platform/amd/isp4 and uses
>>>> +the Media-Controller API.
>>>> +
>>>> +Topology
>>>> +========
>>>> +
>>>> +.. _amdisp4_topology_graph:
>>>> +
>>>> +.. kernel-figure:: amdisp4.dot
>>>> +     :alt:   Diagram of the media pipeline topology
>>>> +     :align: center
>>>> +
>>>> +
>>>> +
>>>> +The driver has 1 sub-device:
>>>> +
>>>> +- isp: used to resize and process bayer raw frames in to yuv.
>>>> +
>>>> +The driver has 1 video device:
>>>> +
>>>> +- <capture video device: capture device for retrieving images.
>>>> +
>>>> +
>>>> +  - ISP4 Image Signal Processing Subdevice Node
>>>> +-----------------------------------------------
>>>> +
>>>> +The isp4 is represented as a single V4L2 subdev, the sub-device does not
>>>> +provide interface to the user space.
>>>
>>> Doesn't it ? The driver sets the V4L2_SUBDEV_FL_HAS_DEVNODE flag for the
>>> subdev, and calls v4l2_device_register_subdev_nodes().
>>
>> We have exported subdev device to user space during the testing with
>> libcamera sample pipeline.
> 
> But it's not needed anymore ? If not, you could stop exposing the subdev
> to userspace for the time being.
> 

Yes, will not expose ISP subdev to userspace. Please see more details below.

>>> As far as I understand, the camera is exposed by the firmware with a
>>> webcam-like interface. We need to better understand your plans with this
>>> driver. If everything is handled by the firmware, why are the sensor and
>>> subdev exposed to userspace ? Why can't you expose a single video
>>> capture device, with a media device, and handle everything behind the
>>> scene ? I assume there may be more features coming later. Please
>>> document the plan, we can't provide feedback on the architecture
>>> otherwise.
>>
>> Currently, isp fw is controlling the sensor to update just the exposure
>> and gain, since the 3A algorithms run on ISP HW rather than on x86.
> 
> This design decision makes my hair stand on end :-( Exposing the camera
> sensor to both the firmware and the host concurrently is asking for
> trouble. If you really want to abstract the camera behind a firmware and
> only expose a webcam-like API (or not even that in this version, as the
> driver exposes no control as far as I can see), then you should push the
> whole sensor handling to the firmware too. In my opinion that would not
> be a good solution compared to exposing the ISP to the host, but it
> would be better than this hybrid model.
> 

Totally agree, yes, the hybrid model is really a bad idea, based on our 
internal validation, we plan to take one of your suggestions, that is to 
push the whole sensor handling to the firmware, so our ISP driver will 
work like UVC driver.

>> In a
>> future version, we plan to introduce raw output support in the ISP
>> driver, allowing users to choose between AMD’s 3A running on ISP
>> hardware or a custom 3A running on x86. If the user opts for the
>> x86-based 3A, the firmware will relinquish control of the sensor, and
>> hands over full control to the x86 system.
> 
> Will the firmware at that point expose to Linux all the ISP statistics
> needed to implement auto-exposure ? What if I want to also set digital
> gain ? Or have manual white balance (requiring statistics), and manual
> CCM ?
> 

No, because all 3A, ISP and camera control will be put inside firmware. 
Currently, we only support auto mode, so, no manual control will be exposed

>>>> The sub-device is connected to one video node
>>>> +(isp4_capture) with immutable active link. The isp entity is connected
>>>> +to sensor pad 0 and receives the frames using CSI-2 protocol. The sub-device is
>>>> +also responsible to configure CSI2-2 receiver.
>>>> +The sub-device processes bayer raw data from the connected sensor and output
>>>> +them to different YUV formats. The isp also has scaling capabilities.
>>>> +
>>>> +  - isp4_capture - Frames Capture Video Node
>>>> +--------------------------------------------
>>>> +
>>>> +Isp4_capture is a capture device to capture frames to memory.
>>>> +This entity is the DMA engine that write the frames to memory.
>>>> +The entity is connected to isp4 sub-device.
>>>> +
>>>> +Capturing Video Frames Example
>>>> +==============================
>>>> +
>>>> +.. code-block:: bash
>>>> +
>>>> +         # set the links
>>>
>>> This seems very under-documented.
>>
>> Yes, documentation needs to be updated.
>>
>>>> +
>>>> +         # start streaming:
>>>> +         v4l2-ctl "-d" "/dev/video0" "--set-fmt-video=width=1920,height=1080,pixelformat=NV12" "--stream-mmap" "--stream-count=10"
>>>> diff --git a/Documentation/admin-guide/media/amdisp4.dot b/Documentation/admin-guide/media/amdisp4.dot
>>>> new file mode 100644
>>>> index 000000000000..a4c2f0cceb30
>>>> --- /dev/null
>>>> +++ b/Documentation/admin-guide/media/amdisp4.dot
>>>> @@ -0,0 +1,8 @@
>>>> +digraph board {
>>>> +	rankdir=TB
>>>> +	n00000001 [label="{{<port0> 0} | amd isp4\n | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>>>> +	n00000001:port1 -> n00000004 [style=bold]
>>>> +	n00000004 [label="Preview\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
>>>> +	n0000000a [label="{{} | ov05c10 22-0010\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
>>>> +	n0000000a:port0 -> n00000001:port0 [style=bold]
>>>> +}
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 15070afb14b5..e4455bde376f 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -1113,6 +1113,8 @@ M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
>>>>    L:	linux-media@vger.kernel.org
>>>>    S:	Maintained
>>>>    T:	git git://linuxtv.org/media.git
>>>> +F:	Documentation/admin-guide/media/amdisp4-1.rst
>>>> +F:	Documentation/admin-guide/media/amdisp4.dot
>>>>    F:	drivers/media/platform/amd/Kconfig
>>>>    F:	drivers/media/platform/amd/Makefile
>>>>    F:	drivers/media/platform/amd/isp4/*
> 

-- 
Regards,
Bin


