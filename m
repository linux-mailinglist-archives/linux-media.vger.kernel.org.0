Return-Path: <linux-media+bounces-39107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9072FB1E564
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 11:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4D0E188B290
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 09:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025CF26AAB5;
	Fri,  8 Aug 2025 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5t5UOnim"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2085.outbound.protection.outlook.com [40.107.95.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F1625A353;
	Fri,  8 Aug 2025 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754644311; cv=fail; b=af4qpAb9dktU4GbjiSoJt97lA+U/wh0eoIoly/7IYURlUzpTibelrS+Q7JVxtD7kjwerhXpxjpm53ymlB9vgDO8jycaz33SGojlzGk1AZ2avurR0HjOhZwW87lFs4Ec+vMrA1ONKPibpllFkur2AMcKpKusBRrrL1YQTy1yU2Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754644311; c=relaxed/simple;
	bh=yk+B0AkIY2+E+dXJYdGZyHqSkMXcGFfT2sK9Vf3QRKw=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TAMVKGPE9vnSDmjoYsOA4mDmV/gDRDBblXos97tbPMGWHsAejxWjd1bFbF3kImoaaUpsMT0jBJU3BsQGp/LmO6EQ0xX2hEaOs8O3bF1ThuHViKc6Zp7+zy06WYWn9fAx1v8x/bTPcZHET9rRwbt/86G48D/mytpD7PUo4zzxFek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5t5UOnim; arc=fail smtp.client-ip=40.107.95.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0ZPaShW3PY1iMaR7JZD5OO7U2lzT7wmNiA0PNZK8DSrhnPDxW2cb2m5tVSmr+EeirWU5uJ3nzt7KUAoikiTNCPET53xGd8wI2QblgDE2lh8eE58JbzQz5SniD57haaexJkPc6y6jPyqimAoiVExCtKVQtyZYAiPtmCy+PZA01N0gOKPbvFESrVa3plBuTbmNrfZKtBfuIqh6v4Q9WYmbewx57+yKhIGFD74GPEaPTml4ibLVttEHoFq7s1RZVJxNR33oYv2DEK0PPax+mBavIJXQ18l9TznSCRvMPu2PF7d03KvrArMobiiESZ2aKzbsAlEOHo5quuWw0yZ9sA+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVQaZn9euuI2mt52t5hFZ8ns0tfCmFlPUB6whVh3j4Q=;
 b=fSGLcPb/vAuPZQBJoNMUpRmBVMofSP3vH+Oyd84F1f3ssgh0/9cm564VbjDJ1BvLCu3H4gx3iS3WfC3uAtgkZjltjlKMoSNOoswP12O0IQq49i43cPBDvkbwJnlw28QtCWR0/ZQBhWpF8kjTUv8HldlCu32KGlxUVfzXJoZLHVd7lJvGt9Vqlgrm85qDp4cHbxNLzK3ryZigOjMY1yZIfe/F/MBp8Loxtn3YSsLThKvg/jUGFJGQbjIBNYaTJu4cUSUFLI3MpzAcK+m3fe6g4KrgFO4NjyaUazmguN0SlfZc9wjfzbmsMnmgnD6l7Db3isph2S7yyWEcTRX99jPvOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVQaZn9euuI2mt52t5hFZ8ns0tfCmFlPUB6whVh3j4Q=;
 b=5t5UOnimcBxIi6FbSsfU7w60OBs5mnJxA7muaBBRijXsmZJ8PmgYdOBpg2J4bun4+gL2WAy7jMltUy0fqPTix68JZZSD9wJiMtGc1anFipcodQE/O0C3JZSM50WO3HEK5A597ub20RMwE9G6wO41mhcsPNoB+u9Nq3yeudmsVrs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 09:11:46 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9009.016; Fri, 8 Aug 2025
 09:11:46 +0000
Message-ID: <17464bff-6b3e-4962-8b83-132cd7367d1d@amd.com>
Date: Fri, 8 Aug 2025 17:11:39 +0800
User-Agent: Mozilla Thunderbird
From: "Du, Bin" <bin.du@amd.com>
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 bin.du@amd.com
References: <aIVXVpg_9XxRXUAH@sultan-box>
 <b02d0749-6ecb-4e69-818a-6268f894464d@amd.com> <aIh7WB0TGNU15Zm1@sultan-box>
 <aIh8JPTv9Z5lphRQ@sultan-box> <751e9265-889f-4fbf-acf8-7374311a6b6f@amd.com>
 <aImvvC9JEgQ2xBki@sultan-box> <a3272335-1813-4706-813e-a79a9cabc659@amd.com>
 <aIq5EyQ_uuO63dJb@sultan-box> <1a9a4beb-97ab-4853-8201-bf08f1a030ab@amd.com>
 <d8c99b00-e8f2-49bb-8c72-ebc4e783e51d@amd.com> <aJA2S0EY7HhVSSzc@sultan-box>
Content-Language: en-US
In-Reply-To: <aJA2S0EY7HhVSSzc@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0032.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::19)
 To PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|DM6PR12MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb77252-18b9-4974-a59f-08ddd65b9937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGkwRjlnMFZnSEJMWndkVmNseCtiTURjN29iV0k4dXZpODk0NUU2Q016U1lo?=
 =?utf-8?B?cnRjUjh1U2J1Q3NWelFiVlRHL05kUHJ2bC9od01IS2VmeDY0T1Zab3c4akR6?=
 =?utf-8?B?Q3NESDJLcHZiZmN6RVY1eGdIcWNOVGltWldIMEsyNzNocm9kNFJ5bFR6emNs?=
 =?utf-8?B?ZmFFbWU3bGdKaTJidEFoaldZRW0rVFZJbGVlM3JCWlZid25FNks4NW5KbS9E?=
 =?utf-8?B?MkFvcjJ1NGFqdCt0NGpsTjVLaVRSb1pVbFlQb0svR1A2cjRzaGQwS2hDR0xi?=
 =?utf-8?B?dlFrRmFjOFkvdkx3WlpyNjRydVM5VGxMdUNjR2l2Rzh2ZE9vYmFSR1c0NXFH?=
 =?utf-8?B?d0pWMFlrU1dia3dsdkdNRjEweHliemJBZUhGR3o5bytjcFV6WGlWRFZiaC9a?=
 =?utf-8?B?MExxazYrQ1JLQ0hneVFWMXczSkVmbG5OQ1I1TjFzUDZmVGNrcEd5V0dJTzdM?=
 =?utf-8?B?OCtBNk04SjU3OVhOYWI4dnZEbkRWeTM5UnNCS2gzalkzMmsyRlQwSG9JN0ls?=
 =?utf-8?B?ZVU0cmc5OTQ0MXZPTzNSSm1ieEZsWmVsUFJxRjdGUlJ5YndCKzgzZDJBMERt?=
 =?utf-8?B?bUJtczMyK3hGSldLVFliblcza0VUaWlsdGpoWk9DdFlzbERVVFd6YVRuejFi?=
 =?utf-8?B?RWxvQ2VvMlVENUFuU1RPellVWnROeE5sQ08wbFVON01nbnBud1o1eEV3VW53?=
 =?utf-8?B?WVlGemdBbTc3dEx4RWhLS1JsTzRRekNmeXBSZFpTYVlxMjBzNXFpMzZ1cWhD?=
 =?utf-8?B?OUhrVitsK1llOXhQVTNYZllTVEgvOXRpQ3Q3aUNlVHdCZmluWEpzWTRXZHFB?=
 =?utf-8?B?clY4amREcDJ1eHZpMXIybDJuOC9NSjBEa3M2ellXK0dTVC9mYXlBZzcwd0Mr?=
 =?utf-8?B?dGdjVi9XU3JlUVVsYkpkUEJ0VDIrN1lTYjB3UlI4WTFNTVZnbTY4YW5kZzYx?=
 =?utf-8?B?WmJFUWJpckp3cWpKbmk2RDZsazZncFMrWEFSZGlHcWVuSG4xZ3FsY2I4L2Uy?=
 =?utf-8?B?S3cxOW1KbDZpdGtCRElQVjd1TzNpVURDQ1FhNkI0NFEvRVg4MXZrS09ueVVx?=
 =?utf-8?B?YTdoTEJBZFFHYndGZlZ0N0MrN01OY3lCMU5scFVuT1RRQ0tnTldRM3FLbGs4?=
 =?utf-8?B?K09rZUF6Q1BzRWhqVDdXempEMnI4UlBLTUU0T1lUZzV4UTd5cjdqY2RLTDVx?=
 =?utf-8?B?MnEvMS9HV0tMdjZQSWl3RVQyTTVKMG5lN3cvc3ArQ3NuaEM4bWp6UFdHcDd2?=
 =?utf-8?B?R1doQVh6ekR0TXUrOG5POTZBTjJGYTlCVEYwRHVMRDlNQjdjQVJKa01uTWVZ?=
 =?utf-8?B?TVh6eTFpRk0vai9EYnBRWitreGN5OUk5bzRwMnFzTW1hc1NhYmFGTnpMTFJJ?=
 =?utf-8?B?Qk1XOUVzdFJqS0wycW1pNXFUUmZPcjY4bDFpb2RnZFYrUG1tQVNBN2I3ZDky?=
 =?utf-8?B?TGhKcG1DUWxwQzQrL2IyR2FrdG9WcHpQR2RhZnVmTXFoV0d3aGkvQVpWclBF?=
 =?utf-8?B?ZTlmN0FUb2RLMUJKVTNhM2pyaG4vZlErbVRMYlhBeFo4T0tQc0VMUDFQV2lk?=
 =?utf-8?B?NERSaUcwenZ2V25yS1NiRCtmNFdZWnQzS25yZW1GTUIvTFZaQ2hQamhKNU1T?=
 =?utf-8?B?cEZFODNzUXlEanU0VE5rNmtwcDRGZ0RMcm1WNEdjdjQxWEFtSmVzWWpoOHhW?=
 =?utf-8?B?UFJISUluVEpoYWI5MVp3UFA5bjdaZFlqcWVEMXRVN0dYYVdZS2Z6citGRGdR?=
 =?utf-8?B?U1FsM0NSUFQ0a0FiMTFMTUNzeHp3TllGeXd5a1d3QUpLVlhjUjQ4akJWYUdj?=
 =?utf-8?B?UmVvWURrYzFIK3JYcFpPTXpIVm5XaEZIRGhWSU41bjJvY01rTGZXUkpsd1VN?=
 =?utf-8?B?ZjhINDh6Sklsc01yazdGVW9tS0FSRk5tcUVPNEVwUTV0d2FTdVhJeDdkVjdZ?=
 =?utf-8?Q?xEsMG+kw6NU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnNGWEZSdXFjdzRTaWJhMkxWNnA3ckwzaFlUQ3BpWTBtUVd3bkgraFR5aTE3?=
 =?utf-8?B?QUw4cHU1bUxDUzYrSUNHcDJrcjh2V0grRVc4bkNIMUZmSGErUzlHbXpzN3Vk?=
 =?utf-8?B?cE1udWw4VHFNWmRSd2VzUDdLb1RkNWg4OU1HRTRBY1NPQk02QkhWQnVjcjdD?=
 =?utf-8?B?YjVqQ3hWOWp4NWJBU3RSZ1NJMktFcVovRzFRTS9mRmtoZzFaOUN2T0RpTHNK?=
 =?utf-8?B?QVhWYWtTLzZEQ0w2T2VCaEFudlV2KzhrTE9wVTdURGVtRERidXNkWTZmUE9C?=
 =?utf-8?B?clM1aFo5bnhIU1JFeHJsb3FzMGhjOGNzZWlBNkprVlNCS0FxeVppMjExMlpW?=
 =?utf-8?B?UklnUG56alNuRExEMHRFeTNUNkt0RmxlY1ZtSlhtQ1F3enErd0ttNjVwZkl5?=
 =?utf-8?B?b3ZjNWJHOXBvS2p2N3RUOVBDTmxKOFZlcHRPOXZCRTRVUHJGL3VJSzVoL2ZR?=
 =?utf-8?B?b2Y0TnFsVTE5VWhNNmRBYjhMNVM0aVRkWHRFQ1JkTkhWMzQwbTZDTFdSRmdr?=
 =?utf-8?B?cXlGdTVxM0hLM1h0eXdnbXdmQzhBdXUzNDJyR3RXZFNuUkl4RzRSRFlYV1Z2?=
 =?utf-8?B?VWNuRU1zWkd0Tmo2SjNSSlIyemVOSlZMZ2wyVWdqTEZCQmNleGVieVZiUTBi?=
 =?utf-8?B?NmEvWXVaZWdGc1ZMTEViUzltZXB0dWN3VHB1NlduZUsvTVU0MWRYQUtRdHo3?=
 =?utf-8?B?QkdSZGJvc1ZXY3U0NldiblpSanpzdURBS0NycWU2c3hLU0xReTJGVmQwdndE?=
 =?utf-8?B?SEFGY1lUOVlCdisvS3J3emxxN0ZqSDBVY2dMUS9SeWU1S3JMNjhUK1puNk9w?=
 =?utf-8?B?Mkd2T1pNdXdGNU5UeWg3aVJVN0tVRit3bHRJQXRzMEdmYU1XN2pXLzZWSjl4?=
 =?utf-8?B?ZDZveHVvcEt4MTFGcEVodUF5WHcvZFpmdTQrZjV3eldaSnpqS3Y2clBXSDVk?=
 =?utf-8?B?RVcxaTU1U3hzSGZOSThvSWtsODArZjBaeWsyYlF6eWtDSjB0WTJjbUx6T3E1?=
 =?utf-8?B?bG5mMWp2cHlib3YySkorVHZoQVRERG1YcVFUZEpVSXYvMEJyL3gxZnh2cS9D?=
 =?utf-8?B?czhCKzJPeE1jajJKaGNYWkd1MEUrQ0IvSU03S2s0OSsvWVcrcHl5dXVDdjg3?=
 =?utf-8?B?TktYNmNDWHZrQncySGhTc0lhSTkzMUhIL0h0SDgvM2haMUplSlRjbUJqMlFx?=
 =?utf-8?B?d080cndwUGVKdDZNTlJLU2NRZTliV2dUSHo3YlJ0MnVIQnRWaE94UWkrSWhU?=
 =?utf-8?B?T3FkU2ZUYkpnaWhiUGo3VFBiMWo1Y253QmE0MzNFWU5XVDFCTTA1WUJNb2du?=
 =?utf-8?B?TjhxZ2xTV0N0WnBlQkI0c2ZjZUZ3UCtjMTFOYUpKLzBVa29RQ0hTN3hKaFJ4?=
 =?utf-8?B?M0FGUDd3UlR6Z1dwZnJtVG1UejhUYjNTd3JxT2Y1bHI0eXZJZXhLWktWZGN1?=
 =?utf-8?B?V2tmdVNsMmdHdjErd0N6dXVjV0xhTkM0eVNiUzBORHN1WWo5b1U3aHhNTEUy?=
 =?utf-8?B?NFpBaWdLYW9RNUpkckg4OWgxYTkvNTBvSDVGV0RoQnV1Y0lhK1o0VW00cWox?=
 =?utf-8?B?bStTN2lXNHZQdVAwTEdBc04xQW9ZT2M3aDBGellBOEpVM3NRQVdHbk9KOHZ1?=
 =?utf-8?B?R1pVU3pQUmVJREpaZkhUZGVZeDVvb0YrSUdQbmxrdGZlS1g4RzhHZzNaR2Fs?=
 =?utf-8?B?QUdtK0ZuOExtWDVEbUxMUWJoVXNuZkJ5SXhkNTgxTXlJMUZxV3VrUUJPYkFk?=
 =?utf-8?B?YzdmM2Z4ejd3SFg5SHY3SnNIcDFYSmtUVFI0OS80UFh4R1B2c0w4R2xaYmZa?=
 =?utf-8?B?aUtMaWxRTlZkeXBCd2ZCT3BydU1lQk5mOUdkZG03WFB3U29meGJraUxKd0N0?=
 =?utf-8?B?a3AwUFI0dXVYLytMTEo0V3ZPeEtnZVBNUmxIUGw1anZFUjZTdDJOTmU1VVlG?=
 =?utf-8?B?dUFJM3BxRU9rYjdiakhNN2dMS29jWEFkUHh1ZlpDd1VTVWw1MjZMN09YUWlS?=
 =?utf-8?B?L2lBWTVsSzJPa21NZWdKK0t4SXBNK1lwWm1xYUJWNFhKUWI0YU5XUHdrWjdG?=
 =?utf-8?B?SWM5dHQ4ckt6djhoL3dWRVhoTThjT2dNdC9xTDN3a250Y2c5K0JVcFh1ZmE0?=
 =?utf-8?Q?2HZw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb77252-18b9-4974-a59f-08ddd65b9937
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 09:11:46.0917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVW+WnsB8YX7yLMgbWGS4PvEWZA4oKmHcRHVB14F8omcVz5RY0EoHPt4GKhfrCtr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219

Thanks Sultan.

On 8/4/2025 12:25 PM, Sultan Alsawaf wrote:
> On Mon, Aug 04, 2025 at 11:32:11AM +0800, Du, Bin wrote:
>> On 7/31/2025 6:04 PM, Du, Bin wrote:
>>> Thanks Sultan for your test
>>>
>>> On 7/31/2025 8:30 AM, Sultan Alsawaf wrote:
>>>> On Wed, Jul 30, 2025 at 05:53:58PM +0800, Du, Bin wrote:
>>>>> On 7/30/2025 1:38 PM, Sultan Alsawaf wrote:
>>>>>> On Tue, Jul 29, 2025 at 06:13:50PM +0800, Du, Bin wrote:
>>>>>>> On 7/29/2025 3:45 PM, Sultan Alsawaf wrote:
>>>>>>>> On Tue, Jul 29, 2025 at 12:42:16AM -0700, Sultan Alsawaf wrote:
>>>>>>>>> On Tue, Jul 29, 2025 at 11:32:23AM +0800, Du, Bin wrote:
>>>>>>>>>> Thanks Sultan, please see my comments
>>>>>>>>>>
>>>>>>>>>> On 7/27/2025 6:31 AM, Sultan Alsawaf wrote:
>>>>>>>>>>> On Fri, Jul 25, 2025 at 06:22:03PM +0800, Du, Bin wrote:
>>>>>>>>>>>>> I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I cannot for the life of me get
>>>>>>>>>>>>> the webcam working under Linux.
>>>>>>>>>>>>> The webcam works
>>>>>>>>>>>>> under Windows so it's not a hardware issue.
>>>>>>>>>>>>>
>>>>>>>>>>>>> With this patchset and all of
>>>>>>>>>>>>> the patches you link here
>>>>>>>>>>>>> applied to 6.15, I get
>>>>>>>>>>>>> the following errors:
>>>>>>>>>>>>>         [   11.970038]
>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>> amd_isp_i2c_designware: Unknown
>>>>>>>>>>>>> Synopsys component type:
>>>>>>>>>>>>> 0xffffffff
>>>>>>>>>>>>>         [   11.973162]
>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>> amd_isp_i2c_designware: error
>>>>>>>>>>>>> -19: i2c_dw_probe failed
>>>>>>>>>>>>>
>>>>>>>>>>>>> With the old ispkernel code from
>>>>>>>>>>>>> February [1] applied on 6.15,
>>>>>>>>>>>>> the webcam
>>>>>>>>>>>>> indicator LED lights up but
>>>>>>>>>>>>> there's no image. I see these
>>>>>>>>>>>>> messages at boot:
>>>>>>>>>>>>>         [    9.449005]
>>>>>>>>>>>>> amd_isp_capture
>>>>>>>>>>>>> amd_isp_capture.1.auto: amdgpu:
>>>>>>>>>>>>> AMD ISP v4l2 device registered
>>>>>>>>>>>>>         [    9.489005]
>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>> The OV05 sensor device is added
>>>>>>>>>>>>> to the ISP I2C bus
>>>>>>>>>>>>>         [    9.529012]
>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>> timeout while trying to abort
>>>>>>>>>>>>> current transfer
>>>>>>>>>>>>>         [    9.554046]
>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>> timeout in disabling adapter
>>>>>>>>>>>>>         [    9.554174]
>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>> timeout while trying to abort
>>>>>>>>>>>>> current transfer
>>>>>>>>>>>>>         [    9.580022]
>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>> timeout in disabling adapter
>>>>>>>>>>>>>
>>>>>>>>>>>>> And then the kernel crashes due
>>>>>>>>>>>>> to the same use-after-free
>>>>>>>>>>>>> issues I pointed out
>>>>>>>>>>>>> in my other email [2].
>>>>>>>>>>>>>
>>>>>>>>>>>>> Any idea what's going on?
>>>>>>>>>>>>>
>>>>>>>>>>>>> [1]
>>>>>>>>>>>>> https://github.com/amd/Linux_ISP_Kernel/commit/
>>>>>>>>>>>>> c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
>>>>>>>>>>>>> [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
>>>>>>>>>>>> Hi Sultan,
>>>>>>>>>>>>
>>>>>>>>>>>> [1] is for kernel 6.8, believe it
>>>>>>>>>>>> can't be applied to 6.15. We didn't
>>>>>>>>>>>> verify
>>>>>>>>>>>> on 6.15 but we are really glad to
>>>>>>>>>>>> help, would you please provide some
>>>>>>>>>>>> info,
>>>>>>>>>>>> 1. Suppose you are using Ubuntu, right? What's the version?
>>>>>>>>>>>> 2. 6.15, do you mean
>>>>>>>>>>>> https://github.com/torvalds/linux/tree/
>>>>>>>>>>>> v6.15 ?
>>>>>>>>>>>>
>>>>>>>>>>>> After your confirmation, we'll see
>>>>>>>>>>>> what we can do to enable your camera
>>>>>>>>>>>> quickly and easily
>>>>>>>>>>>>
>>>>>>>>>>>> Regards,
>>>>>>>>>>>> Bin
>>>>>>>>>>>
>>>>>>>>>>> Thank you, Bin!
>>>>>>>>>>>
>>>>>>>>>>> 1. I'm using Arch Linux with the ISP4-patched libcamera [1].
>>>>>>>>>>> 2. Yes, here is my kernel source [2].
>>>>>>>>>>>
>>>>>>>>>>> I have some more findings:
>>>>>>>>>>>
>>>>>>>>>>> Currently, the first blocking issue is
>>>>>>>>>>> that the I2C adapter fails to
>>>>>>>>>>> initialize.
>>>>>>>>>>> This is because the ISP tile isn't powered on.
>>>>>>>>>>>
>>>>>>>>>>> I noticed that in the old version of
>>>>>>>>>>> amd_isp_i2c_designware [3], there were
>>>>>>>>>>> calls to isp_power_set(), which is
>>>>>>>>>>> available in the old ISP4 sources [4].
>>>>>>>>>>> Without isp_power_set(), the I2C adapter
>>>>>>>>>>> always fails to initialize for me.
>>>>>>>>>>>
>>>>>>>>>>> How is the ISP tile supposed to get
>>>>>>>>>>> powered on in the current ISP4 code?
>>>>>>>>>>>
>>>>>>>>>> You are correct, yes, i believe the I2C
>>>>>>>>>> adapter failure is caused by ISP not
>>>>>>>>>> being powered up. Currently in latest code,
>>>>>>>>>> isp_power_set is no longer
>>>>>>>>>> available, instead, we implemented genPD for ISP in amdgpu
>>>>>>>>>> https://lore.kernel.org/all/20250618221923.3944751-1-
>>>>>>>>>> pratap.nirujogi@amd.com/
>>>>>>>>>> Both amd_isp_i2c and amd_isp_capture are in
>>>>>>>>>> the power domain and use the
>>>>>>>>>> standard runtime PM API to do the power control
>>>>>>>>>
>>>>>>>>> Thanks for that link, I found it along with
>>>>>>>>> another patch on the list to make
>>>>>>>>> the fwnode work ("drm/amd/amdgpu: Initialize
>>>>>>>>> swnode for ISP MFD device").
>>>>>>>>>
>>>>>>>>>>> Also, I noticed that the driver init
>>>>>>>>>>> ordering matters between all of the
>>>>>>>>>>> drivers
>>>>>>>>>>> needed for the ISP4 camera. In
>>>>>>>>>>> particular, amd_isp_i2c_designware and
>>>>>>>>>>> amd_isp4
>>>>>>>>>>> must be initialized before amd_capture,
>>>>>>>>>>> otherwise amd_capture will fail to find
>>>>>>>>>>> the fwnode properties for the OV05C10
>>>>>>>>>>> device attached to the I2C bus.
>>>>>>>>>>>
>>>>>>>>>>> But there is no driver init ordering
>>>>>>>>>>> enforced, which also caused some issues
>>>>>>>>>>> for
>>>>>>>>>>> me until I figured it out. Maybe probe
>>>>>>>>>>> deferral (-EPROBE_DEFER) should be used
>>>>>>>>>>> to ensure each driver waits for its dependencies to init first?
>>>>>>>>>>>
>>>>>>>>>> amd_isp_capture only has dependency on
>>>>>>>>>> amd_isp4 which is the ACPI platform
>>>>>>>>>> driver, it is init before amd_isp_catpure.
>>>>>>>>>> Do you see in your side the amd_capture
>>>>>>>>>> probe failure caused by failing to
>>>>>>>>>> read fwnode properties? If that's the case
>>>>>>>>>> please help to check if amd_isp4
>>>>>>>>>> is loaded successfully
>>>>>>>>>
>>>>>>>>> I got much further now: there aren't any driver
>>>>>>>>> initialization errors, but when
>>>>>>>>> I open the camera, there's no image. The camera
>>>>>>>>> LED turns on so it's active.
>>>>>>>>>
>>>>>>>>> And then shortly afterwards, amdgpu dies and the
>>>>>>>>> entire system freezes.
>>>>>>>>>
>>>>>>>>> I've attached my full dmesg, please let me know
>>>>>>>>> what you think. Thanks!
>>>>>>>>
>>>>>>>> I almost forgot, here is my current kernel tree:
>>>>>>>> https://github.com/kerneltoast/kernel_x86_laptop/tree/v6.16-
>>>>>>>> sultan-isp4
>>>>>>>>
>>>>>>>> Sultan
>>>>>>>
>>>>>>> Thanks Sultan, yes, seems much close to the final
>>>>>>> success. Will have some
>>>>>>> internal discussion.
>>>>>>
>>>>>> I got the webcam working. The same bug happened when I tried
>>>>>> Ubuntu's linux-oem
>>>>>> kernel, which made me think that the issue was firmware.
>>>>>>
>>>>>> And indeed, the culprit was a firmware update from February. I bisected
>>>>>> linux-firmware and found the commit which broke the webcam for me:
>>>>>>
>>>>>>      commit 1cc8c1bfa11251ce8bfcc97d1f15e312f7fe4df0 (HEAD)
>>>>>>      Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>      Date:   Wed Feb 19 12:16:51 2025 -0500
>>>>>>
>>>>>>          amdgpu: Update ISP FW for isp v4.1.1
>>>>>>
>>>>>>          From internal git commit:
>>>>>>          5058202443e08a673b6772ea6339efb50853be28
>>>>>>
>>>>>>          Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>
>>>>>>       amdgpu/isp_4_1_1.bin | Bin 4543184 -> 6083536 bytes
>>>>>>       1 file changed, 0 insertions(+), 0 deletions(-)
>>>>>>
>>>>>> Downgrading firmware to before that commit fixes the webcam.
>>>>>> Any idea why?
>>>>>>
>>>>>> Thanks,
>>>>>> Sultan
>>>>>
>>>>> So, can i say the working firmware binary is this one?
>>>>>
>>>>> Commit 8f070131
>>>>> amdgpu: Update ISP FW for isp v4.1.1
>>>>>
>>>>>   From internal git commit:
>>>>> 39b007366cc76ef8c65e3bc6220ccb213f4861fb
>>>>>
>>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>
>>>> Correct.
>>>>
>>>>> There are too many changes between them, so i can't tell exactly which
>>>>> change caused this. So, from my side
>>>>> 1. Will try these two firmware to see if we have the same issue.
>>>>> 2. It has been quite a long time since last release, will see if need to
>>>>> release a latest one.
>>>>
>>>> Thanks. It was a quick bisect for me, so I'm happy to help test if a
>>>> bisect
>>>> between those two internal git commits is needed.
>>>>
>>> Really appreciate your test.
>>>> In case it makes a difference, I have the laptop with the 2.8K OLED
>>>> display. I'm
>>>> aware there is one other display variant on other SKUs, which is a
>>>> WUXGA IPS.
>>>>
>>> Good to know, I believe it won't make any difference for ISP
>>>
>>>> Also, with that old firmware, my camera only works with the old isp4
>>>> driver from
>>>> that Linux_ISP_Kernel repo (which is the same isp4 driver used in
>>>> Ubuntu's
>>>> linux-oem kernel). Does the new isp4 driver you've submitted here
>>>> require newer
>>>> firmware than the old driver located in Linux_ISP_Kernel?
>>>>
>>>> Sultan
>>>
>>> We had a try, yes, both of the old FW can't work on the new ISP4 driver,
>>> as you know, for the last months, we did lots of driver modifications
>>> for upstream and cause it incompatible with old FW.
>>> Now, under internal discussion to upstream a new FW to support the new
>>> ISP driver
>>>
>>> Regards,
>>> Bin
>>>
>>> Hi Sultan,
>>
>> This is the conclusion of your test,
>> Driver: https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
>> [1] It works on FW      8f070131(ext):39b00736(int)
>> [2] It can't work on FW 1cc8c1bf(ext):50582024(int)
> 
> Correct.
> 
>> Would you please help to check if CONFIG_VIDEO_OV05C is defined not in the
>> .config file when building the kernel? Our assumption is to make [1] work,
>> CONFIG_VIDEO_OV05C shouldn't be defined. to make [2] work,
>> CONFIG_VIDEO_OV05C should be defined.
> 
> Yes, it is enabled and I have only tested with it enabled:
> 
>      $ rg CONFIG_VIDEO_OV05C linux-oem-6.14/.config
>      CONFIG_VIDEO_OV05C=m
> 
> That's the Ubuntu linux-oem-6.14 kernel. You can get the full source and .config
> I tested by running the following commands:
> 
>      git clone https://git.launchpad.net/ubuntu/+source/linux-oem-6.14 -b applied/6.14.0-1006.6
>      cd linux-oem-6.14
>      python debian/scripts/misc/annotations -e --arch amd64 > .config
>      make olddefconfig
> 
> Let me know if that works.
> 
> Sultan

Thanks Sultan for the details, yes, we can reproduce the same issue on 
old isp driver 4.0 release on FW 1cc8c1bf(ext):50582024(int), after 
debug, the cause is
   - ov05c sensor device is added by amd i2c driver
   - When ov05c sensor driver probes, it will try to get gpio 
description but it will fail because the amd-pinctl driver which creates 
the gpio resource hasn't been loaded yet.
   - the ov05c sensor driver probe failure will finally make sensor not 
able to work when start streaming

Add following patch is supposed to fix this issue to make it work on FW 
1cc8c1bf(ext):50582024(int) when CONFIG_VIDEO_OV05C is defined.

@@ -1121,6 +1129,7 @@ static struct i2c_driver ov05_i2c_driver = {

module_i2c_driver(ov05_i2c_driver);

+MODULE_SOFTDEP("pre: pinctrl-amdisp");
MODULE_ALIAS("ov05");
MODULE_DESCRIPTION("OmniVision OV05 sensor driver");
MODULE_LICENSE("GPL and additional rights");

Please help to see if it works if you get time.

Regards,
Bin

