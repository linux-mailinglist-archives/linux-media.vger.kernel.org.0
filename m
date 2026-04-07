Return-Path: <linux-media+bounces-58150-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M+YBjew1GnvwQcAu9opvQ
	(envelope-from <linux-media+bounces-58150-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 09:20:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CB53AAB7F
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 09:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4435D30158BF
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 07:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDAA392C25;
	Tue,  7 Apr 2026 07:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="znBNNsFL"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011065.outbound.protection.outlook.com [40.107.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC2F1C3BF7;
	Tue,  7 Apr 2026 07:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775546374; cv=fail; b=WEnzIR5ViLHPNpliSxVkMzya+00DdqWClfB4w3z/zlC0Pr/Vc9mSG72yISQ0lSY5R5ih9lje2+WixJdx2MALs+Yprwh11/hnHhTIIHJ9Ngd2tsclqXYlmjgRYU6berQya4U0At0ubd3QhBhyy1Jbs1uqF2Y0V4r20Vn3ov0kiC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775546374; c=relaxed/simple;
	bh=SRBNVmfDCQS+lH5EIXlplTzG02YOVulXVoMYoi6ypVY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RwVNKvwByaY4mu/D1XfhsfHBO9pRbouxgpyABfCp7DZ2hGjk8qLfiMGhZtb86ssSh93k0YODKyZ9bafSVtII8oe/l3mir3pUC3hde6KZ9G3lh5uBSfvjUlMTBhSql5N9RXLMpiaVGB2wxtiagZS7ZP/TQP4594f+XU9rp0RS1Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=znBNNsFL; arc=fail smtp.client-ip=40.107.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRuqSzD16SX+NslN7kcDw8Oj9Jaom/RS7Dyrbh7qds68E9qQxhkVzhGx0fACP11sLrQPQDFdNKOoiihBrHROFLhJKMcy2YPToIdqxLAFtLOLgIgSxoz/2wippjnZVL1wKh8UhzF4CZltGdAczhSYdfeQtvUTG1G9kb8gc0GXHr5+Gjbhqav6sP4bckAkDyaa6LIEtipie6VuvTo+P59obD8Zo7Fo5bMEQI7AbWZ2No1HgVqZDvvmci4W4eq1LUvagYj/3m2O+DMxX+oh5/uCgToHpUoc8Y+5aJjZNsaMfcEpPAKRQlZWym2iiFcNTDb7ClF4BERz3R27oKfMWaUFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2204gj+Gxyx6TqY08eJCYKhjd0/SFZa2rqsP3AN3KE=;
 b=bshUwdhH7+7VZlfYFC5npmVgCWEBYYSfXiHWx+Js8mFPJCvqtNPTECXZuc/FWCxJW0eIl79NbtszhauUj80J9lnGXDkNPKIkUrB9EPM7jJEHBut4KjLcgHl48E/jTE2VE8yOE7+mHTpAE6S403nmLJ4H660qbFimLX0kO8Ll58jL4CRQTeaWciJ2ke98BbUswEdWQKTkGLuYMfFrXih0ahSFpj/EeAuaKsRAmwtuLTq9uKWcB5HaAx5TtXI2CEzHVsK/ee/YRk7EyDUjUFanMM31HRCOUZJwmdbxTK+a6XoA6lp9XH4ZKFBYuZKX6WtoZqVljXewnCjMJHz/gMV5rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2204gj+Gxyx6TqY08eJCYKhjd0/SFZa2rqsP3AN3KE=;
 b=znBNNsFLMc8EUiD1DhDCJvz4r39t9ii9Q3S5XLtGO5Oi7WZSARO3b3AYoDHIDfO+8xdZnWXQcI7ZSXA0w7CcYcolpYO+Wwzd6yLvG2hewZJh/DGYNdxGwX5VRk4h9cByvTS+FTBKs3lQhX3z6MaYmPDnEkFmG/HiovtxqThGO5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by SA3PR12MB9226.namprd12.prod.outlook.com (2603:10b6:806:396::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 07:19:30 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%3]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 07:19:30 +0000
Message-ID: <21dfb3d2-d838-4325-8a6a-6024b851cbc5@amd.com>
Date: Tue, 7 Apr 2026 15:19:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] Add AMD ISP4 driver
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Cc: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
 "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "sultan@kerneltoast.com" <sultan@kerneltoast.com>,
 "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>,
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
 "Li, King" <King.Li@amd.com>,
 "gjorgji.rosikopulos@amd.com" <gjorgji.rosikopulos@amd.com>,
 "Jawich, Phil" <Phil.Jawich@amd.com>,
 "Antony, Dominic" <Dominic.Antony@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>, "Tsao, Anson" <anson.tsao@amd.com>
References: <20260320084146.200988-1-Bin.Du@amd.com>
 <7d5d52bf-b0dc-47d4-8cb8-d6099fd05c57@amd.com>
 <470a9fbc-c4c2-4bde-a91d-a22f1c730b31@amd.com>
 <LV9PR12MB982900FA14329B742FF64BBE875EA@LV9PR12MB9829.namprd12.prod.outlook.com>
 <adSlwqPVF81feLHx@kekkonen.localdomain>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <adSlwqPVF81feLHx@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0021.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::11) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|SA3PR12MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: 104989f3-ca24-4196-56b6-08de9476026c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	kLQKrO3lgAJlc94EpGEjjptTJaAXPJG16PWygnanFsB1r5VUghLwJDorDK6p3l1fXNUYCNa8OXBMSTj/OcRCz/QN81QIJInbAM0Xl4tnAXYHRGi1JdxIBxhdZXKpwxJ1SZtqRqaqBve0I2UMEwyHoy0yjaOcLysn66BPmKqiYrOI9bZ9Cfsy2q0AO657tdEzxnbIPYXtpiqNx8+nsouZGo/n+2X2W0IGh05EOwpRgNDrdL7YSVuFgurzoXQZufLvs9h7E/oGGKapFQjrBjngkHTxd9QE5BciNZdXda9bR5bBBVSClqZqOwNy218eVf7WsaEAM5oI/Bj1MpZQvvQxj6LdlaaX458IcbGXfkI5w563em4U1394eo2SiqnGNmIumfR69yIr032i55anqquZ8QAMlYYnEBRDukXJUwEBlG2PZnMSO54OyqymLNF6nfX9qYPXEz5O/PekQfzPDx1oXq092iV86SMWbP5Qo5zEciMivBYoDMAzxQkasGBzXp4ANgLWETxYTTPCHOV/A60rd3bpWdoTDft6TqcdyT4+WQmYDMuNRjRexLIkMJuimFGzcETTDN5WziFNxFejAlnuR2bt/m0F37/CW0N1YLSZhI6QEXrCwpHke+c9vqo1GFsu+hhwajD3X5uXzGcBnHUbcFN8MWL4dFprI7gHkNe6G+M3P3j9ApfdMBvV95NFnQO625SwiaTSlf2L6KFKdvlr2xIaqzkaC3O09OZq5DC30l4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGp4ZXo2ZFJLSis5bnhYUlFTRVFkeG9BM0NPb2Q5UFlqSVUrbTBJZG8zWVVv?=
 =?utf-8?B?R1dWRkJKYnR6aXo0Ri9aa0p1WmlFZGlYNDVXMmJJZ3BiSjMxb3cwcis2NEsz?=
 =?utf-8?B?dEljcTRmdndNd3NKaDZSK0VUSGRRY3JZWHNBcktxK2daSlFOUTJ3YlVHMGY2?=
 =?utf-8?B?RGtUd3pGWHpZb1Zmd09lT0FmV21mT1V0NVRrbFZESHcwRmJiVDh3SFBjV0VX?=
 =?utf-8?B?TXMwTFlqa2wyMDBkWDUra3MrQTYyd3V0KytqNDVCbklZTVdrd0NVL21PODl6?=
 =?utf-8?B?eU1wTCttbUwyYUpDTlNBR3JYZ1E4WTMvc2RlYVJ2RklITWp1RTZWNUJpdlpE?=
 =?utf-8?B?TkNORzF5djk4TE9COFlOZGRSYjc5NGlyQS9xM1N1UFR0TFg5OHBERmwvTXVZ?=
 =?utf-8?B?em44Y1VBMld5cUFrcU1CSlNqMUw1M21XblUreTB0M1Fjd01xZzFQamVjV0F1?=
 =?utf-8?B?WHlLNkZCcHhvbUxkNFVZTDBxQUpaRlR6YncvdWl6RithNU41OHJ0aDA0Ylpw?=
 =?utf-8?B?Zit0Z0p3ZFViYUZEVmNuWHg5b25laWxGZXpxNmljSFVBaE9NVnQwV1B3bzM5?=
 =?utf-8?B?by8ydFp1cDRsYzNJTVpuYU5lUDl1VUNHbUZlTUE3N214TzJGeTZkWXBheStm?=
 =?utf-8?B?T2tGV2Z4TGdndU1DdWFneGhqa2UzRXBzbDgrK3pHVHYyN1llcTg4RmhQZmtr?=
 =?utf-8?B?RzB6NitWa2ZjNnd2MHlkRTcvVEczOWNJb0owL2UweTN1cWFEem5OUHBtck1V?=
 =?utf-8?B?dzcvaERtNzR2dnBORUFVSFNqNDlSNGJsNG5NNU9XeFZmUkd1dGlyYTl6UmFm?=
 =?utf-8?B?a1NETkp5LzI5Snl5TXl4dWZMdE50amdweXhkRzJCbGRRZUlaSzhNOUpMT0wy?=
 =?utf-8?B?VzJqL2VPdGhzamw2MjdGcG9ybzhqSlpzNkdram1XYmhFdmQvbktucW5BN3NE?=
 =?utf-8?B?NnJ6bXJpaHZubmNRZnpCR3llTDhyRCtKU0FFY0o2Y3J1bWJCZ2JvanJJQjdv?=
 =?utf-8?B?QXRnbnUwUDVqSDQ3MFl2YUIxbUh6TXUwSVRDWm43dkNxbTdHQnNsWE1DQmMv?=
 =?utf-8?B?em9VNDJlR0dKSUpodmhrd3dFMitXYmVZNkkxZTE1MTVxQ3RDQ0lpN3l3dmd6?=
 =?utf-8?B?dUJSMmVVLzRFSFg0TEVFQVVrUlpNWUVsejU3eXpjMjk0b0psa0NaSHFhT1E3?=
 =?utf-8?B?NWsyZ1FhOCtmZkNOV3NrczVQYWloYTAwUlZxcGNPUG1GcEo5WHhFVEh3NFlq?=
 =?utf-8?B?REx6VzFncHV1WEVTWXpLUHV1d0l5bm1IR211b2t1T0dOMWU3dEtuVXhqcDcw?=
 =?utf-8?B?SHI1MWdHYm1oMWd6RzdsTnVNZVlwazVnTEsrYXJCZGlLWlQ3ZHpBVVcyeG1Z?=
 =?utf-8?B?UFBVMVVyUDF0WnBnY1Q3MWlqMTgxYld5Y05lK2JxR1JScVlrNWpaVFp1T2lt?=
 =?utf-8?B?WTlnM2NVOFpsdWlBby9iZG4raStVT3pmbG16eXgvT25kVlJJVWZOUTd6Qkw2?=
 =?utf-8?B?ek1FV0FtUlNIcG1FbHg3RGhQc3RuUm1NelpveWs1V0cza3h2NDRVL1A5MVJh?=
 =?utf-8?B?eXhUZ0o3Q3FWK2xIZW5MYTg0M25xMndVeVdydWkzU05EU1RoTjRPejNzajlk?=
 =?utf-8?B?UmEwUFhLYWNVWVR3aXBwSFhzSmUyS2h1bnRicitCRTRLcXhOREJUNU1rN0di?=
 =?utf-8?B?YmlQNXd4bTgvaXl0M3NRSXJZVENHRFVKT3c0L1hmdS9VekJLbHNtUE1KR1lG?=
 =?utf-8?B?OVl4THBuRnZaQTd5R2tFWlowUWQ0V2doRllqSFBpQS9CSTRIRmdZeXFkZ0hn?=
 =?utf-8?B?ckF0U3BmbEltUW1JbFgzZVNGaGJQeWZhWnRzKzZmODJQZFVhQXpUNlhjVjAr?=
 =?utf-8?B?c09SRUVsT1pRNVBPRzM4Rkc2OWpZNk5DNVN4TkJ4UmRFV055UThDOVdta3BG?=
 =?utf-8?B?WVQ3ZVFtLzFKN2xHSFJkVXl0cXZjUDVzcnFzQTNHK0ZsL2VTUVBFZmppb1NH?=
 =?utf-8?B?alh4OW93Z1l3L0ROdDZlcnN4T0wwVzRJN0VwT0RqQzBRZVptZFFOSXE3Unp6?=
 =?utf-8?B?Q1lma0x6TS9NRldUOTlFbTJHN2ZRd2pHOStMSUhwOUxGa2lSbUtaM3gwK1RQ?=
 =?utf-8?B?UEErd25wa2x4Q0lOY2NQT2pqVFpFWGoxc29aSXpoalh0MWdxQjg0QS9TRFZF?=
 =?utf-8?B?Rm83aVBCWFNBbWF5Qys4KzByaTNtZzZ5ckxEU1ZUY1Nnb0loNUVjM0NPVjZC?=
 =?utf-8?B?VTlhSnBtaGxEWW9HNmhteU1jMER3NEtaMVQ2VzE3TEhScXgxVlNXYnhGYXNa?=
 =?utf-8?Q?HjPsGOeYa7fh1I3zeU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104989f3-ca24-4196-56b6-08de9476026c
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 07:19:30.3913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8+A2z100oUWfF/+p/YdxJ+/G+T9ePytZg4jrnBphAge+Fys7b5DV2wDAZ3VUx4u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9226
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58150-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87CB53AAB7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thank you very much for picking up the series and for updating 
Patchwork. I really appreciate your help and support. It means a lot to us.
Yes, that's right. <20260303224433.87242-1-kinncj@gmail.com> is no 
longer needed.

>-----Original Message-----
>From: sakari.ailus@linux.intel.com <sakari.ailus@linux.intel.com>
>Sent: Tuesday, April 7, 2026 2:36 PM
>To: Du, Bin <Bin.Du@amd.com>
>Cc: Limonciello, Mario <Mario.Limonciello@amd.com>; mchehab@kernel.org;
>hverkuil@xs4all.nl; laurent.pinchart+renesas@ideasonboard.com;
>bryan.odonoghue@linaro.org; prabhakar.mahadev-lad.rj@bp.renesas.com;
>linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
>sultan@kerneltoast.com; Nirujogi, Pratap <Pratap.Nirujogi@amd.com>; Chan,
>Benjamin (Koon Pan) <Benjamin.Chan@amd.com>; Li, King
><King.Li@amd.com>; gjorgji.rosikopulos@amd.com; Jawich, Phil
><Phil.Jawich@amd.com>; Antony, Dominic <Dominic.Antony@amd.com>; Gong,
>Richard <Richard.Gong@amd.com>; Tsao, Anson <anson.tsao@amd.com>
>Subject: Re: [PATCH v10 0/7] Add AMD ISP4 driver
>
>Hi Bin,
>
>On Fri, Apr 03, 2026 at 03:17:18AM +0000, Du, Bin wrote:
>> Hi Laurent and Sakari,
>>
>> Just a gentle reminder regarding the review request below. When you
>> have a moment, I would appreciate it if you could take a look at this
>> patch series. Your feedback would be very helpful to ensure the
>> changes align with upstream expectations and maintainability.
>> Thank you very much for your time and support.
>
>The set is in my tree (amdisp4 branch) and I intend to send a PR for 7.2 once we
>have rc1 in the media tree (or whatever process we manage to get working by
>then).
>
>I updated the state in patchwork, too. I understand <20260303224433.87242-1-
>kinncj@gmail.com> isn't needed, is that right?
>
>--
>Kind regards,
>
>Sakari Ailus

Regards,
Bin

