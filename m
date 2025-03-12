Return-Path: <linux-media+bounces-28107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 262FFA5E7A1
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 23:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 181667A64BB
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 22:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47BD1EFFBA;
	Wed, 12 Mar 2025 22:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="jfZKnaEN"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12olkn2102.outbound.protection.outlook.com [40.92.23.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EEF282F1;
	Wed, 12 Mar 2025 22:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.23.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741819694; cv=fail; b=pC0qbvG3HDvdH1V49JbLdXHXJdKEaYmDx/xrVY5fomTlgx80gYAQZbWKoMGrRTpkaKITxST4g0BqypKBbSI6H0LweumL5wQu6GoyttL+h/MnUJIFwiLmVfnK+99y5tV55UwptKwNl+yXoBvOmSqrlypLXVNAneYrX3u3gqKHzXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741819694; c=relaxed/simple;
	bh=7um8MqWbD2wSBY7u+thDvonsK8Xj1U9X2g+KO/6i1lc=;
	h=Message-ID:Date:To:Cc:References:Subject:In-Reply-To:From:
	 Content-Type:MIME-Version; b=ONny7rALWQzfKKQukmdfss9Z2d5XqYnPwH2HsQ3aXmQpntf+RWKySXTI09xkqk2hy3Os3KudUU1utPh+o7sQW+w/s6aTgog2YjWTmtjWhMr/AOW0lIQ+f2vOl6k3fvDmxtcS2B30jdeykuSyNKblhoS85pT1jCj8jZhRzwXSYwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=jfZKnaEN; arc=fail smtp.client-ip=40.92.23.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSSBfiYQZMuWUeDE75dEjLIbfTcj0fkU5O6PABpXnuwGDEcExi9ZOPp3F+uSGV+eHCz7Rk6l0nthDDY0ntRsqWOTvzVb1UEF0EiPbInzCvqVzBf4o1oefeT+bDS0Clm67/n2jtZy2aOyDDn96Poa2Xv8D8/mkDqefp7hqzswiF45nHuPBi9b2q1UFWzXpPNbdbc/jcQ4pH4JnQqG951Y/qaI4CssF1jtK3kFuTtOw5mJXtU62490pAPTXaHptEItzoqStMqf8YjwKmdCXdCTcXPChbjCrnhOmwai+w/m5Awx/Ekvkdbt7Hehk+btTCFm95xWjlh4LfOo7tCQjrxPeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZlikytCyj3cXfl891nYXoWuxXxL0/poa4LDbdXG59w=;
 b=r+OLGh4Ila9zKlB3zL1uCvWx66YBjeGdga3GwGakqIPRBASvUd95qROKt00TqV3xZnCt+UYclqZOcaGZomBHzd/P6bAXAERwJ1Er+cr/jkzdoCvJJb+ltS3AQH7ur4jHE0L+jEGIBG6HEBGdEmXPIPYsLG60Z6Baroq4vL3Pzv4eDABtasW3Dy351aiFFWaIyAas/xH8BoWQdstoeQXgaz9OsYE7/uvi0yJJBJwrki0xZ439MTFB3ba9g2UHtaZnZF/r8covgN6IerTjB8zTAtUus3rT/sNnm0VXOPXUY3MScPT0soSePo0Sa+eo6TO/DrB/Je6MDMw7/NzpsS7UXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZlikytCyj3cXfl891nYXoWuxXxL0/poa4LDbdXG59w=;
 b=jfZKnaENtYGwMlOpE7I9HwRZax0ZFQKNmn17ZwMFse//87GBGpaKqG97FYuzBAJ7CTgF03riqJEJOmCS9qpPndqiQbDfFwgmdDUn2YYrAa5AdUfYOsevQExZ3oa2t6pqUidylyUpv54+K1oDjR9xcLjyNVB+7IXBM9NdU24QGkyb9DjGTT44KhdkQHmgzlibsYue8C6WUSFgneyKRHS+hm/5GV/l2YzjyF/BwAWWpCTc3QcticE7QhQcqCU2T1AqMZE0dhJkgQK17LCzhy3T/kaXtGgKATIbmYLVQdmpuOG1mmjyH4hKZWEoSW9ZEI6EioTciDDRZ75NCyM9J1Dz5A==
Received: from PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 by LV3PR12MB9214.namprd12.prod.outlook.com (2603:10b6:408:1a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 22:48:10 +0000
Received: from PH8PR12MB7112.namprd12.prod.outlook.com
 ([fe80::527b:a523:24c6:a1d4]) by PH8PR12MB7112.namprd12.prod.outlook.com
 ([fe80::527b:a523:24c6:a1d4%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 22:48:10 +0000
Message-ID:
 <PH8PR12MB71120F7C5D7A420B63367DE4E6D02@PH8PR12MB7112.namprd12.prod.outlook.com>
Date: Wed, 12 Mar 2025 18:48:07 -0400
User-Agent: Mozilla Thunderbird
To: hverkuil@xs4all.nl
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linuxish@outlook.com, mchehab@kernel.org
References: <bc026cfe-1f67-47dd-9ef5-6025509bf194@xs4all.nl>
Subject: Re: Avermedia DVD EZMaker 7 video distortion on capture
Content-Language: en-US
In-Reply-To: <bc026cfe-1f67-47dd-9ef5-6025509bf194@xs4all.nl>
From: Randy K <linuxish@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::23) To PH8PR12MB7112.namprd12.prod.outlook.com
 (2603:10b6:510:22c::15)
X-Microsoft-Original-Message-ID:
 <d9bc89b5-aa81-41ca-ad9c-1012c3738505@outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7112:EE_|LV3PR12MB9214:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a2f392-c841-48f5-7467-08dd61b7f681
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|461199028|8060799006|6090799003|5072599009|15080799006|7092599003|10035399004|4302099013|440099028|3412199025|3430499032|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RE5wZWdYYk5ZQTU0dWNTWkRQSDM2VTFMK3hMOFVnU21ydFkrYjd0M0pBeVRo?=
 =?utf-8?B?djNQTzFuRlNlc1ptNE9aQUpSaXZMWUR1WUNCWVppY0lMd20rZ0o5MWl3c1BL?=
 =?utf-8?B?b1Y2d21yQTdqTlJWbGs3TDUvS2IvY0lRNVdWTFFEUG5wSnEvYzJlNWc0K3lZ?=
 =?utf-8?B?bk14d0VPcmxQeTZ2ZXovaDhhR2ltUE5OT1dzbFRscmRTaU5sQ1F3MlI3Ulcx?=
 =?utf-8?B?TVNwa05QVlJza1ZyOHFjR2NqVXY5b2krKzNuWWZaWVJpTENLejZoMmdIeDNK?=
 =?utf-8?B?TUhiYlVtSVNRbktyZURvZk5PbHpLRXQvS1luM1IvNnE5eGRQWDYyMVhuZzBk?=
 =?utf-8?B?aXZkUzg4dEpHMDFCTEt3ZGFsZFRNSDFPVTNTV0JzWjh4VkoycmVVbTY3N3ZF?=
 =?utf-8?B?aW9vUTJEMUxrSkhDWlE3QXZzVEJiL0NZYUI2cmVOMThWVFVUbW9Gem5YZVpv?=
 =?utf-8?B?SzRiNkNCeUFGTzNRbDlWWlhBSm1VWGRHVUlkZHBoNWxsM2FlL3A3cGxDNE9G?=
 =?utf-8?B?VUhZR0k2SDF4NDNNUEFmRHB2aTgwajRUSmtLQlQ0MmhOZktVVjc5WWMvU1Bs?=
 =?utf-8?B?ZzAxRnErVDZkaEJVbnhpcWhKd3RJS04rdEtUaDFjUE5qQkZhVURDNEgrMkc5?=
 =?utf-8?B?U3ByeVliT0JDWWxwaWdna3BKT3ZXS09qZHRBU3hVZUF2SEdNSUhjRkxvclBI?=
 =?utf-8?B?S3ZTSlNuT2FRNTI3MDgzeDZPbS9vTFZxODY1T24yajRwbHNsaWZMWDdBS084?=
 =?utf-8?B?TnZyZHhjU0cwSkcxL2c1aXcxZTRlWHZjRXNEdVZHMmJIdnpBM0FQYTV6Y2lQ?=
 =?utf-8?B?SzZFd0JRaDVuOHZEbFVSSzRkMy80c2lTeEl3Yy9ER3pUUUl4MUFMYkdvSzVl?=
 =?utf-8?B?UFBpTGthM1c0dHpiUHkyeTNYUWM1TGt6YkdDUm9JSDZPY0VRTTB2dndWazZw?=
 =?utf-8?B?WFM0ZktROXdyUEJheWw3MWo1WjE1WHEva0UvQ2htVlc5UDRNOTBtWjVXb3Fr?=
 =?utf-8?B?TndWdmNjZVpiUmhXUHVvVHVGZm41WXhEWFZDN2FncHE3TFBwZThwSXB1T2lr?=
 =?utf-8?B?TSs1dDEwWklncTlJakJKc05ib3JxMG04RGhZZ3hzSU5iaWViRzFpQjVNNEhN?=
 =?utf-8?B?WmVsbTQ1U0RheUxycXVSZ3JMM0orZzRpY2xIN3RyUlRMNWtqaHBsYVFrNXZy?=
 =?utf-8?B?M3lZdWwrWUZsVHNpcTQwdXVSQ2hlR1hiYzFSTGtyREgzS0t1eDlsWjlocDdQ?=
 =?utf-8?B?eXNSL0k1ZkdMeGljd2ZkSW9OTy8wWnNvbmpMUWl3NnZGTTJ4YWd4aTJQcXdZ?=
 =?utf-8?B?cmVpMHJ2ODNEMG9jTjV5UEdqaEJSc3gyME1VSVpUZG5GcG1YaGZCQVJnc01z?=
 =?utf-8?B?ejY0WW9rQzRlOWdCTlFmbVlPYUdobm5EQXNpVnpndFlFeENEdU5oVTIrcnl2?=
 =?utf-8?B?TzYyQi95OTJLN1FEN3E3R0FVZDJ3ZlRrS3hYZFN5QUZ5ZHdKNFZtb2Rsa2lM?=
 =?utf-8?B?Smpic2VpUEpmUDZtbHNCb2d6bEU2Q2plbDc3K2ZONDBkckQ5YjhFRzlXNEJB?=
 =?utf-8?B?UmcvV1l0QmZvbXEwdmFQVVRvTEVMNW0yUTQwejNiOEJHQURBRkM4aGhTVmhC?=
 =?utf-8?B?eVJPOHYwalhNNzZOL1hiWGo4ZWx1c09mdTJiV0dDWU0wQzZ6eU4vaExsNEZt?=
 =?utf-8?B?TTZVMEJRL3lNRnUxNEdYQ0MwUGpxRmkvVHh1d3BuTWx2blpUdGxoTXR2UWlB?=
 =?utf-8?Q?gJWN2FnY5d9BJpdsXk=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dCtGcnU3V1N0WVVvdzNiZFBKTVhyOVVUbUMyYjBqbGdGVGI3L21rRWxoQ21n?=
 =?utf-8?B?YXdOYVBMUWk5Wm1GUFNva0dtaXNNditpMGRtVjBPeTh0eDRRbkt5NHNZV25O?=
 =?utf-8?B?L0JzZFdENk1OK1JkMS8rSHRHaXQ5a0tvN2NZeDhLcWtFSUU5RXA2eUlZaUhm?=
 =?utf-8?B?QlAxYlFPemtBNWJ4MmdLUUh3RFJuWTRJNzVmWmJIMlF5WlhhdlB0Q3d1QW0w?=
 =?utf-8?B?RmdZSm1XOUdtMnV6OEdBU2duYWh1aEVZaDRXdUNKeVhObXpoN1JpQzB3RlBv?=
 =?utf-8?B?T0pwc1BHeGlKSndoK0pKYWllVjVWK1l6YWp6K2dTaDZzdEdmYmVoTkdOWU9T?=
 =?utf-8?B?blhndlVScGpDSFdoQzlIY0I4NTgyUm1vdXFncHhzQmcwSWVXanpaRE5tcGl1?=
 =?utf-8?B?S0Q3NHkyVU9INjRqeGtjZjJNcHg3OFBXKzlKL245bEtmREV5dWhDSGZBVXJB?=
 =?utf-8?B?Skx0QU1nQ2htNDhzT0pKbHNJUVNYSytVbWtBRWhDc29YM2lLQmU4aDQxS2g0?=
 =?utf-8?B?ZmNtYjdQMm10dC9BVGJXNWtHMHpzelZWOUNKQVZ5YkNoaUxad252RFNxQzJN?=
 =?utf-8?B?ai8wblhOMVJTenBNZG5WaGVibDJVVUgvL1kwZFhEc28vRjBvblU3TXpiZDkx?=
 =?utf-8?B?clZGN2pRY1kzTVNOUUYvR29YWmNlcVlSN044ajc3dmR1am9OVVA3MlRtSFdS?=
 =?utf-8?B?ZWpJaVhIS3pOK2o4dlJZamFZVHUyTUxXazNCKzJpOXl0OFhucEZZN3JPekVy?=
 =?utf-8?B?UzdKV1FndmQ5ajJTbkhGSTBjbmE5NHhic0w1SlRuaHZoZ0p4K1BJenBQdklz?=
 =?utf-8?B?Ym5yQzlHZURwRTZkekh6dmMxQ2JZUForbnZuSWNhT1hKbi8xYlhuOWJ5UXo4?=
 =?utf-8?B?MlNxM3hrZFRwZFhkNDRkNStNbUZCOUJKb2EzbVFoZ1pnbGltSXQwTUg3YUFE?=
 =?utf-8?B?bUM1WXZJUUNWNE0vK0JqMy9jRlRpM21VRzZpSEt3d0tDajJ0VG95RDNKOWtj?=
 =?utf-8?B?ZzZQN3l4M0t0OHBLSlBaWFI4NHQ2ZHUxRmFBVzVjZVBNUjZReUhuaGFuQnZ5?=
 =?utf-8?B?MlVNK2FYMzlwWDBQc05pbDAwVGRYMXlBT2lYOGhPLzVzQXJESGpxWThuam5O?=
 =?utf-8?B?ZXp4TmVOU2dNN2VZOW5NSTIzbDY0cGQveWZ2MnJ0K3pzMm9YOFFpbk5Cd2F0?=
 =?utf-8?B?QVpDWXhzMUNva0ZBN1BXSlZZL1VWL2UyekY2akd5TFRaRGJTOGRUd2xaV2pl?=
 =?utf-8?B?ZEJPcVdhbis3bC94Y0RUdW11WEpUUFhNMmVKNnpPV0RKQko2emZKZ2pBY1Nl?=
 =?utf-8?B?QitzUFcrZVZkendRRGdrS2REdE9rSmJEQ05penQvc0tjeGRpazhiSU1jY2pK?=
 =?utf-8?B?ZCthSTBzZVlzL0VQVFVNZnVqNmxTQlZFaEZaL1liMnhMbWhTU3JMb3prb0M2?=
 =?utf-8?B?TncxZkZpU05DTTBrRXpQcWZQS2Y3cWRRRWYvSFdMMStKbVJiMDNTWjFRTisw?=
 =?utf-8?B?Q29hc3orYnJDVmtKakdod1dPZXN0NmJaYVhWSUp5TEZoelJDL2xEanNiUUZs?=
 =?utf-8?B?SWRpeE1NdVZlT0NTM2NpQTlwNUdGQ3FKTHFVcVdNNXJ1Z1I1aTlZTTVsdEZh?=
 =?utf-8?B?RG1Ob0xGWjJzVS80eDRybEczZmZHSmNrWXRnSmRuYWVST2pLaFRzT3FjTnc1?=
 =?utf-8?B?QWxHQ0tFL0dhaEFCK1dEK1lhTzN1QjQxaHZQTWhTYXdKVFJlNU1aOWhRPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a2f392-c841-48f5-7467-08dd61b7f681
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7112.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 22:48:10.3629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9214

Thanks for the suggestion about card=9 Hans, however unfortunately 
setting that module parameter has no noticeable effect.  I also tried 
card=5 then card=21 from here: 
https://docs.kernel.org/admin-guide/media/cx231xx-cardlist.html with the 
same results.

I'm not sure what is causing the issue but it sure isn't obvious, to me 
at least :).


Randy




