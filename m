Return-Path: <linux-media+bounces-52685-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KWTFu+4jmm3EAEAu9opvQ
	(envelope-from <linux-media+bounces-52685-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 06:38:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C63BA13308F
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 06:38:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87E453050A19
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 05:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C438926ED3E;
	Fri, 13 Feb 2026 05:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="BAYtHwPu"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021111.outbound.protection.outlook.com [40.107.42.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CE524677B;
	Fri, 13 Feb 2026 05:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770961117; cv=fail; b=O0CDfCRRdCnxv37dq3NQgMGzOWVgFAYL8IwWV+4HRlBQZe0ABMBhljQVpgxJ567MGRN25NCh/bhCRvp0XTPBVcfwePttb15qrSsGPMOkF+jz5isPe6glFZ6cQjV29YpLH+iYQsaUOg3TAkDSUh+IQey0uB3JWod52sbQw9Dh4Dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770961117; c=relaxed/simple;
	bh=9IILpjO/J3SLYS4oRlaYVeoK2V5A8/8TIy4s1T4yPpU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V4bi30s9JyfCUmNiedlzRfiPV2ukDQAyXMDo0NPbq72m8dEaxBTJ9iw2TaJtfChRegIe3c7B5KcDq+YF3EmHT5L6UWlNx9nkKVxXp3Po0zqDYfyA5XhUT0xEQdO9MLiCbYXdY/jNMySmAkbz3e7IaowV1nUZAAjFG+nfkkgigzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=BAYtHwPu; arc=fail smtp.client-ip=40.107.42.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emLuVrZcNILcGXwE72NIQvnb1o8avNm+FDKt7/D13FhnVDN9V++etb2WKyAxeMuZ0KevtalSNOV7suHwFS/lqvfoBaDH4J344huzFaKo9n7a3/nengllHoZjXv7CiEdsZfOtk3rKLJARlvMzde/5thY8oJ5lERDQSWpzdRq/3oG/MjKFUyz/0776PsRRxC3L8aPwxK5lOJ+Hxox8EEmqffMcRzdMTKsg0vWHoZ1c1+LPgYExxADwvVnEJSGT5Hj5sWT0leAulNwCctb3GWFqXIDP240IwlJFjAoBzv2IBq0WHJE3xgqwoNKJmAmCwso0ZccEJ4rY3y8F86SODKKiSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IILpjO/J3SLYS4oRlaYVeoK2V5A8/8TIy4s1T4yPpU=;
 b=vlUlAS1Yzl2NOPAdp4c0Z5pmOA3TGENvj+cdLikTPUz1Yxf/n1HcB3G4BEzfVpZ5cTRJ7N1/ueQJw3pqOCqK7WL7/Ri8f6Ykw+6Im0QxhjIuJCNO5XDUqGNU0KF0nz0m80ZFvFb0Itg0Wq9Dh4uWffu0gLYPgH3a73AQyeZ9KVkr5u7K8r7d1ZXQLToE8aA14ZF07qOfSzFG5ZcNNooLt5IPey6nhd5ZHr+jwAbPHCVvi+JaesKQSqxTgC4YlREi6RE6fhSKMZABr9fU/X8epeDDVgUMsTzmANv/6VqxpuY4Uch3RzxJ7EcsWDzG+2ioBjUhrxV25/EezW5vyGA0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IILpjO/J3SLYS4oRlaYVeoK2V5A8/8TIy4s1T4yPpU=;
 b=BAYtHwPu91tYukig+Ik/darbw2D4K16V0qg3tcLhnj7PDUStlpM8zAOq8NVxxVrdOtG7Hpd+nu9OPo6ozF8vkMQmGq0yw35IHK7G5vHsV6KJrOq30Bb1EOCJeq1NHfNP60CQDtWIj0KUM/R7JTYcCSmwu4wKbVnkLvYLpLJST8c=
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by PU4P216MB1951.KORP216.PROD.OUTLOOK.COM (2603:1096:301:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 05:38:28 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 05:38:27 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Alper Ak <alperyasinak1@gmail.com>
CC: jackson.lee <jackson.lee@chipsnmedia.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans
 Verkuil <hverkuil+cisco@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: chips-media: wave5: Fix possible ERR_PTR deference
Thread-Topic: [PATCH] media: chips-media: wave5: Fix possible ERR_PTR
 deference
Thread-Index: AQHcmB0Xl/FUGan5EUW2BE6Q1lppUrV9OHNwgAAMlgCAAtxWEA==
Date: Fri, 13 Feb 2026 05:38:27 +0000
Message-ID:
 <SL2P216MB2441196128340DA5DD599245FB61A@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <20260207103224.609938-1-alperyasinak1@gmail.com>
 <SL2P216MB2441B206893FEC079521B3E0FB63A@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
 <CAGpma=5ONpUwnOStE+cLpJcqrb-=ZYT4krx=whgeAup1ACERQg@mail.gmail.com>
In-Reply-To:
 <CAGpma=5ONpUwnOStE+cLpJcqrb-=ZYT4krx=whgeAup1ACERQg@mail.gmail.com>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|PU4P216MB1951:EE_
x-ms-office365-filtering-correlation-id: 7e03604f-c09c-47f5-a178-08de6ac21d2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OXM5Rk1zQ0owU25Pa3lwR0ExWVZrRENQSkhuSzJkeXVOcllJSkFHYjR2ZWRM?=
 =?utf-8?B?ZldVRGZTa09nSGJnK2lHL2JEZ201VDh2RWhSVUtkZFhjU0VnODNOV2RFcS9D?=
 =?utf-8?B?WE15SEZDaml0emVrcjFOZHMwWFRweklwSHhMeU9ZSzhCa04vY1V5RnBWUzhU?=
 =?utf-8?B?dWdDNDl2ZFlkeEZnc3lvcGNadGxjRGtabkFsaUp2SndvbjBmSm95QkxOYzlG?=
 =?utf-8?B?ZXQxNFowVzJIU3BDaStMS3NoYjVGVXAzL2JZU2p2bExleFZUUGFScGQ1VGRX?=
 =?utf-8?B?cnFYWXdSN2Q0VFUwT0lGNDBRTTB4MmRLeEtUaHp6cmp2ZjRndzlsT3luV3hn?=
 =?utf-8?B?VEdYVC9PVUk4WTJkb296ejZnNnRPSkFKK1g5eVQ3cmh4TXlHQVZiRzZ5MUtQ?=
 =?utf-8?B?Vk1nY0hGdEZpUzRTYnBhWW4wRHZ5NHVkclp3dGtGSENnRWhaNkFuVWFqajQy?=
 =?utf-8?B?M1ZFUDRRQTkvelJTb055WTVsbmVPSGlsU3cyK2tzei8vZG8rMVpsdzE0TzY5?=
 =?utf-8?B?c0Q1d1lYZWVRekpjVVFRa0p1V2IwblA2a2hCb2ZFbmNUaFdPRWc2MjBBNnpE?=
 =?utf-8?B?cmR2a3dPQ3pENTBUK3pzMlFkcXBYdHRIMmhoYmN2cGwrWlVxRUxKVDgzSmdn?=
 =?utf-8?B?d1RiZ0NxMTY2cXk5clBkUTdDcXNDQ1NUMGVMdUNXb0V6NDJKK2pDTlJiTWhF?=
 =?utf-8?B?dWUxazN5eDgxOVArTm9naExrSEE5clNCYVRqd3pCWnoxZk9aVHVGcHJqQ0tm?=
 =?utf-8?B?N0N4aU4zYUJ2Tlcvc04rZ09LSlNocXhzRHFzTjZWRFVOem9saXBkM251YlZT?=
 =?utf-8?B?dDZRNTNrZ0NCUDV5WXhjUG5rTWpJV21YdGRvTVQzaUZkUXR5clpsMXphak95?=
 =?utf-8?B?SHAwMHQxS3dLWk5EM1hNbzgvY2JhVW1zR1ZHanpsQkJyQmZKSm1SekZxd0Ra?=
 =?utf-8?B?SDZYeWgydFYwRTRoZDZnMkhST1g5c2tmdDZueTBzTmlQb0FjL3FFMVNlS0Na?=
 =?utf-8?B?R0pYL1BFZ2JGV3RnSVJmNDFMQjdmcjVSb2NVand0S2N3NFF6b2l1TldDU0g5?=
 =?utf-8?B?cUNBSkdpaU4vTVQ4a0lJMGRlcDdUQU9WU3NJck92Snd4L2QzSndqaHQ1ZlNM?=
 =?utf-8?B?cGltZmdHMlZFTUFLc1FyWC93UWVIVEF6UkI3VytOYVN1Q0VGaGs1bjZsS2NZ?=
 =?utf-8?B?Um1iMzVpOVpvbEF5V2VDV2tSN2ZLREV1aXJTV0FNd1pLZUZ4aE1xTWNDUDIv?=
 =?utf-8?B?VU42VVdPSzhzTFpBZVJ2ckg1YmNub2gvUnlmY2ZuaTBYdE9oYnllQTNNYmNH?=
 =?utf-8?B?RXVyZjBhSXBOcTZUdE1BWDltV0tXQ2ZEd2ZQQlJWYkJIa2h4Tm1pbHJlYnVH?=
 =?utf-8?B?bUpQZVREcXRWQnJGcklOdDBwRVN2NHlpVG9IZTVqYkZaWjR2NkNScVFsK05N?=
 =?utf-8?B?L1FsdnUrSmpvZHpiYm1velNJZjh4SU1sY2lXeUxoeTZwaU9Da1F4SUMrblUx?=
 =?utf-8?B?a21CNUxDclhvcDNpdGh4WlZnNzVDVWdmUEVBaFJSSFh6WHdXVHoyVzRXNlBn?=
 =?utf-8?B?L2dEZGdBdHR4Sk9ha1VMd3ZLVGphSHFIdjBFRnNTUGdzL3RoNFVhdjNxVjVq?=
 =?utf-8?B?WStUN01jaVZwb2xPakg4K3RJQ05FdVlqd01qQ1F5c3RETVBiVmIyY3pYTXIw?=
 =?utf-8?B?QlhsOEc2em54bi8vUHVNV2ZnVzV6WlNlck5yTW1wNjRoNVFlSUtoYXpickZm?=
 =?utf-8?B?Nm95TnZoQ3RFNnJxZzhZS3FTelBQWTVuNlk0NkpWdzBWaC9TVVFkMkVRbjdY?=
 =?utf-8?B?ZzM5RUorZzA3ckVZQURhU0twUW9lRXVoNkFjejNMN2Z3VTVQZWU0Vjl0TWdL?=
 =?utf-8?B?SUlzbGJSUnVGZkpPa0U5dlFLakVyWXhsVkx5NEVGVWlma05paXloOXJzcnI0?=
 =?utf-8?B?Q3VZQmorTjdwdGFGeDFtaVY2bFN2WVhvRzl3d2hRWG1oRktHT1JnUkoyb0RZ?=
 =?utf-8?B?eXIxd3l2YXpzVjhrd0wzS3RRWlBOa2xXaWVHVkdpYTNEbXN6eGFwS1lwaTV4?=
 =?utf-8?B?UU1qbFl3V0I3R3ZQbXJrUnNhRDFkb1NvczNJd0wySU5BTk1HWUdCSjh5ZzA1?=
 =?utf-8?B?SCsvQTlzYmM2aTlZR0FtOWN3SWtjbDRzTG9JSGk2RzlSbTlEYlNhaThrTVpX?=
 =?utf-8?Q?AvmVc+Exz5REMH3yJkiifTI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWpydlZOSGovdVNaZXNHL1RhNE41ZE1nWktLb1VnVEx0MjFBVDZDR3lvaFcx?=
 =?utf-8?B?ZDYzU244c3Q2QnI4d29OQ1g5RHQrT2NFOGVFK052L3lQM1R4YnpSQnRxd0ZD?=
 =?utf-8?B?djRReTY0cEQxNDA1a0pFZ1VIcEJMM3dveFkvYTJMSlZUNHlJK3JROXY0TTRt?=
 =?utf-8?B?QWhzalhOQkJreXU1b3pJWkkyOHlOZ1Y0MXN5LzNTaVBWQ2h5SlRxM1RaazNF?=
 =?utf-8?B?YXBQVUlnclJuMmtZaTgzZjV4eTVnODhSdExGcUdQNzMxUzBqZHp2Um53eG1H?=
 =?utf-8?B?aWVpcWxTSjJzYlVDUGpiajRERG1WYzBaa0hCMmgvc3FQZHh6MWlVaTAyQlR6?=
 =?utf-8?B?bzRJdE9qdXZEM2hVVUtDUW5RRzNCRGQ2VDdmVTNmOUs2b0NwaUJ4alUxUStJ?=
 =?utf-8?B?TTN5MUNlWVZwTWNzd3l5VG8rMHkzM1Y4TW5lbjBBMHE3dFhSQkhFWVJuOUtu?=
 =?utf-8?B?TGlZWmNLMFk0STFzeDFqeko5L0l4MkZFRktOS3ZlSENDTkJCNUZWOGpHeFpx?=
 =?utf-8?B?SzFjS21PWlZvbE5KNERpSFRWcjRoWWVlMk56eHgyLzVyM01OMTRSTVJveVUz?=
 =?utf-8?B?bU1GNnhHeWhveDRLVUNOeUhGWDBkT0kxWWpUb0ZjbDJGLzJXZ3l2NURscG9n?=
 =?utf-8?B?eG5sZXlJVmd0Um93bDlOT0x2MHB6V0U2bm5lYWZDak1tT05hSVQrelpIdUt5?=
 =?utf-8?B?dk1XdHFoeVcySUoyQVVIR0xsaHJWOCtHa0ZieG1LVEFNTk42bFd6b0lFQUNT?=
 =?utf-8?B?OVo4dGJEWFpxcU55MVltcCtveXdBTnpWM2poaER0dkdTM0U3aTBWbkErcG1H?=
 =?utf-8?B?N3IvTmZaRmJqUVlwRFdBVHl2TjY5QWxLK3lOZ1MyV29iYzVaVnlkRi9remdQ?=
 =?utf-8?B?UXB5dnphVWR5OUY3dDJxb3dMcGV6dlduME9xUFlPVXpKdkg2ZWlhNkNQYjd3?=
 =?utf-8?B?WU10a2prTTk0SjNuRS8xOUVnN1BSVjJ2RmJDMndlbWNnUUVqRjJFZ0NXQWR2?=
 =?utf-8?B?STBhdVlDbWtIQ0d2NzVJYmlMV2pRbE5lRVVFS3JQSzQ4YmZxaFRaWGJyUHgx?=
 =?utf-8?B?N2ZLY3F5NkxXK2ZWa0hOOG5KUmZEUkg0RGV4RXhYU1pPRW1qdUZIdStWd1RS?=
 =?utf-8?B?WDJVVlZGRXNkMFg4TjRyRS9GdWhzczlkNUU4c0hJbCtkKzZYOGo4YXA1SnMw?=
 =?utf-8?B?VWVLSHMvUVkvVW1kU1V1TWVyeVk4cmZ2WlY5dERHMDFVT0VPNko0bWlRVFJp?=
 =?utf-8?B?eWN2cGcvWEVhUis2YWN0RnNDWm40d1ZXdzRza1FBZDRBdTc0U00xOVQ2eEx3?=
 =?utf-8?B?aFR5emxJOHJ5RnlyU0xvQVoxdDZkUUJNcWtlTzU0ZC96dE1jVi9ZcGdmZ3Rm?=
 =?utf-8?B?NUxkUDh5WFFPRjhxZzFjQktpZU95K2xzU0xEaEsrcnI2OHJGM0lKYTJRUm5C?=
 =?utf-8?B?cGJ1aGVIb3luVUJWKzhGcisxVnhVcTltbXpDMGFaVzFGanBMMG5tNXhKMElp?=
 =?utf-8?B?cFBrUERRNjlFNzV2czRTMTZpdVg1L0N3UDlLSmt3MHUyTVFxd0xHNzlxV0x2?=
 =?utf-8?B?Lys5M29zcUg5cjdmcjlZMzYrY29ibkN3RjlOdGxsK0JWR28rb05nR0l1Snhh?=
 =?utf-8?B?LzlNaDdiZTE0elBKVTYrdSs3TG1ZZHY0blcvc2F6eHlPNmRiVXVsM0Vpanc4?=
 =?utf-8?B?ZGpVWmxCQmY1aGh6TitBRE5IejYxaWZGUVV2NW9aMXBHeWtWbURENWlvM2ts?=
 =?utf-8?B?RDJVMGNYdE50alE0Mk43dHBmaWJlQlA1SzlKNkJ3VmhONmtDTHRSOVZaUGpl?=
 =?utf-8?B?Q0xsV2RTR1o5bWVTKzI0OE1jN2JKRFNRME5sOUVvWjdNbHNWaE5GdTNFbys2?=
 =?utf-8?B?Rkh5U3RaRTJOc3JGUjlDbWlSdjh0ZW1qRStraWxoeC9GYS9QMzZTbmF1VTdh?=
 =?utf-8?B?SXZPWWxqUWlkdTBrQzQ0S0QyMUJKeDh2VkZHNFhkT2Zud05UWnhEQ2lIVis1?=
 =?utf-8?B?dCtvL1AwOFVnaE9peHppRWVJa2FnNGFQNGJoSDBZTFZHZ1JxbG03RVRoU3dB?=
 =?utf-8?B?ZFJxa3lxYVJaNjZJSDQzVk5VZmF5RHFjQkhNYXA3QXhSV3ZRTmJ3Y1lkeWZ6?=
 =?utf-8?B?Y1oxbFQzR3g1UDl6YTgxMC80cnlNWEluaWtwWlNka0xCcFJIRzg2allyTVZ1?=
 =?utf-8?B?alM1TnJIaStHOVh0SWpwSWlyUDRZNVo2VVlIdzAzQ3E3cjdnS3RGZ081Z1N0?=
 =?utf-8?B?MlA5N1hZNmVjTGxNeXkyZzl0RnBLTEZwaEUreG9qQWE3NTZ4dXRPdFdIV1hJ?=
 =?utf-8?B?V3Rqc1ZoejVuRWNXOXBhWWYxQW5XMUUxRTVydm14L3NuUHlKUGdmZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e03604f-c09c-47f5-a178-08de6ac21d2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 05:38:27.8535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GVd4D6SKGkSQHIjMATFDlf7p1sGKrULkoplOIjdVK1+bRHncncu7UHKH6C+oe1lnBOSNDSkdLNR1tLO5LGxj3o8/7E+eUTtgsh+nKI+AebQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1951
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52685-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nas.chung@chipsnmedia.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chipsnmedia.com:email,chipsnmedia.com:dkim,collabora.com:email,SL2P216MB2441.KORP216.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: C63BA13308F
X-Rspamd-Action: no action

SGksIEFscGVyLg0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBBbHBlciBB
ayA8YWxwZXJ5YXNpbmFrMUBnbWFpbC5jb20+IA0KPlNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkg
MTEsIDIwMjYgNjo0MiBQTQ0KPlRvOiBOYXMgQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5j
b20+DQo+Q2M6IGphY2tzb24ubGVlIDxqYWNrc29uLmxlZUBjaGlwc25tZWRpYS5jb20+OyBNYXVy
byBDYXJ2YWxobyBDaGVoYWIgDQo+PG1jaGVoYWJAa2VybmVsLm9yZz47IE5pY29sYXMgRHVmcmVz
bmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT47IA0KPkhhbnMgVmVya3VpbCA8aHZl
cmt1aWwrY2lzY29Aa2VybmVsLm9yZz47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgDQo+
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0hdIG1lZGlh
OiBjaGlwcy1tZWRpYTogd2F2ZTU6IEZpeCBwb3NzaWJsZSBFUlJfUFRSIA0KPmRlZmVyZW5jZQ0K
Pg0KPkhpLA0KPg0KPkkgdXN1YWxseSBydW4gc21hdGNoIHdpdGggdGhlIGtlcm5lbCBjcm9zcyBm
dW5jdGlvbiBkYXRhYmFzZSBlbmFibGVkLiBJdCANCj5jb2xsZWN0cyByZXR1cm4gdmFsdWUgcHJv
cGFnYXRpb24sIGZ1bmN0aW9uIGNhbGwgcmVsYXRpb25zaGlwcywgYXNzaWdubWVudHMsDQo+ZXRj
LiBUaGUgZGF0YWJhc2UgaXMgaW5jcmVtZW50YWwgYW5kIGdyb3dzIG92ZXIgbXVsdGlwbGUgcmVi
dWlsZHMuDQo+DQo+VGhlIHN0ZXBzIEkgdXNlZCB3ZXJlOg0KPuKAoiBCdWlsZCB0aGUgZGF0YWJh
c2U6DQo+fi9zbWF0Y2gvc21hdGNoX3NjcmlwdHMvYnVpbGRfa2VybmVsX2RhdGEuc2gNCj7igKIg
UnVuIHNtYXRjaCBvbiB0aGUgd2hvbGUga2VybmVsOg0KPn4vc21hdGNoL3NtYXRjaF9zY3JpcHRz
L3Rlc3Rfa2VybmVsLnNoDQoNClRoYW5rcyBmb3IgdGhlIHRlc3QgY29tbWFuZC4NCg0KPkFmdGVy
IGFwcGx5aW5nIHRoZSBmaXgsIEkgdmVyaWZpZWQgdGhhdCB0aGUgd2FybmluZyB3YXMgZ29uZSB3
aXRoOg0KPg0KPn4vc21hdGNoL3NtYXRjaF9zY3JpcHRzL2tjaGVja2VywqBkcml2ZXJzL3doYXRl
dmVyL2ZpbGUuYw0KDQpJIHJlcHJvZHVjZWQgdGhlIGlzc3VlIHdpdGggdGhlIHNhbWUgY29tbWFu
ZCwgYW5kIHRoaXMgcGF0Y2ggZml4ZXMgaXQuDQoNClRlc3RlZC1ieTogTmFzIENodW5nIDxuYXMu
Y2h1bmdAY2hpcHNubWVkaWEuY29tPg0KDQpUaGFua3MuDQpOYXMuDQoNCj4NCj5JZiBzbWF0Y2gg
aXMgcnVuIGRpcmVjdGx5IG9uIGEgc2luZ2xlIGZpbGUgd2l0aG91dCBidWlsZGluZyB0aGUgZGF0
YWJhc2UgDQo+Zmlyc3QsIHRoZSB3YXJuaW5nIG1pZ2h0IG5vdCBiZSByZXByb2R1Y2VkLg0KPkJl
c3QgcmVnYXJkcywNCj5BbHBlciBBaw0KPg0KPg0KPk5hcyBDaHVuZyA8bmFzLmNodW5nQGNoaXBz
bm1lZGlhLmNvbT4sIDExIMWedWIgMjAyNiDDh2FyLCAxMjoxMiB0YXJpaGluZGUgDQo+xZ91bnUg
eWF6ZMSxOg0KPkhpLCBBbHBlci4NCj4NCj5UaGFua3MgZm9yIHRoZSBwYXRjaC4NCj4NCj4+LS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+RnJvbTogQWxwZXIgQWsgPGFscGVyeWFzaW5hazFA
Z21haWwuY29tPg0KPj5TZW50OiBTYXR1cmRheSwgRmVicnVhcnkgNywgMjAyNiA3OjMyIFBNDQo+
PlRvOiBOYXMgQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRpYS5jb20+OyBqYWNrc29uLmxlZQ0K
Pj48amFja3Nvbi5sZWVAY2hpcHNubWVkaWEuY29tPg0KPj5DYzogTWF1cm8gQ2FydmFsaG8gQ2hl
aGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBOaWNvbGFzIER1ZnJlc25lDQo+PjxuaWNvbGFzLmR1
ZnJlc25lQGNvbGxhYm9yYS5jb20+OyBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsK2Npc2NvQGtlcm5l
bC5vcmc+Ow0KPj5saW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IEFscGVyIEFrDQo+PjxhbHBlcnlhc2luYWsxQGdtYWlsLmNvbT4NCj4+U3Vi
amVjdDogW1BBVENIXSBtZWRpYTogY2hpcHMtbWVkaWE6IHdhdmU1OiBGaXggcG9zc2libGUgRVJS
X1BUUiBkZWZlcmVuY2UNCj4+DQo+PlRoZSBrdGhyZWFkX3J1bigpIGZ1bmN0aW9uIHJldHVybnMg
ZWl0aGVyIGEgdmFsaWQgdGFza19zdHJ1Y3QgcG9pbnRlcg0KPj5vciBFUlJfUFRSKCkgb24gZmFp
bHVyZS4gVGhlIHJldHVybiB2YWx1ZSB3YXMgbm90IGNoZWNrZWQgYW5kIGluIHRoZQ0KPj5lcnJv
ciBjbGVhbnVwIHBhdGgsIHRoZSBjb2RlIHZlcmlmaWVzIGlmIGRldi0+aXJxX3RocmVhZCBpcyBu
b24gTlVMTA0KPj5iZWZvcmUgY2FsbGluZyBrdGhyZWFkX3N0b3AoKS4gU2luY2UgRVJSX1BUUigp
IHZhbHVlcyBhcmUgbm9uIE5VTEwsDQo+PnRoaXMgd291bGQgcmVzdWx0IGluIHBhc3NpbmcgYW4g
ZXJyb3IgcG9pbnRlciB0byBrdGhyZWFkX3N0b3AoKSwNCj4+Y2F1c2luZyBhIGtlcm5lbCBwYW5p
Yy4NCj4+DQo+PkFkZCBwcm9wZXIgSVNfRVJSKCkgY2hlY2sgYWZ0ZXIga3RocmVhZF9ydW4oKSwg
bG9nIHRoZSBlcnJvciwgc2V0DQo+PmRldi0+aXJxX3RocmVhZCB0byBOVUxMIGFuZCBmYWlsIHRo
ZSBwcm9iZSB0byBwcmV2ZW50IHRoZSBkcml2ZXINCj4+ZnJvbSBvcGVyYXRpbmcgaW4gYSBicm9r
ZW4gc3RhdGUuDQo+Pg0KPj5GaXhlczogZTY2ZmYyYjA4ZTRlICgibWVkaWE6IGNoaXBzLW1lZGlh
OiB3YXZlNTogRml4IE51bGwgcmVmZXJlbmNlIHdoaWxlDQo+PnRlc3RpbmcgZmx1c3RlciIpDQo+
PlNpZ25lZC1vZmYtYnk6IEFscGVyIEFrIDxhbHBlcnlhc2luYWsxQGdtYWlsLmNvbT4NCj4+LS0t
DQo+PiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdS5j
IHwgNiArKysrKysNCj4+IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4+DQo+PmRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1
LXZwdS5jDQo+PmIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZl
NS12cHUuYw0KPj5pbmRleCA3NmQ1N2M2YjYzNmEuLmJlYmUyYmQ2ODkzYiAxMDA2NDQNCj4+LS0t
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHUuYw0K
Pj4rKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZw
dS5jDQo+PkBAIC0zNDAsNiArMzQwLDEyIEBAIHN0YXRpYyBpbnQgd2F2ZTVfdnB1X3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4+KnBkZXYpDQo+PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZGV2X2VycigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIGdldCBpcnEgcmVzb3VyY2UsIGZhbGxpbmcg
YmFjaw0KPj50byBwb2xsaW5nXG4iKTsNCj4+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzZW1hX2lu
aXQoJmRldi0+aXJxX3NlbSwgMSk7DQo+PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2LT5pcnFf
dGhyZWFkID0ga3RocmVhZF9ydW4oaXJxX3RocmVhZCwgZGV2LCAiaXJxIHRocmVhZCIpOw0KPj4r
wqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKElTX0VSUihkZXYtPmlycV90aHJlYWQpKSB7DQo+PivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWls
ZWQgdG8gY3JlYXRlIHZwdSBpcnENCj4+dGhyZWFkXG4iKTsNCj4+K8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHJldCA9IFBUUl9FUlIoZGV2LT5pcnFfdGhyZWFkKTsNCj4+K8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRldi0+aXJxX3RocmVhZCA9IE5VTEw7DQo+PivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnb3RvIGVycl92ZGlfcmVsZWFzZTsNCj4+
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIH0NCj4NCj5JIGFsc28gcmFuIHNtYXRjaCBsb2NhbGx5IGJ1
dCBjb3VsZG4ndCByZXByb2R1Y2UgdGhlIHdhcm5pbmcuDQo+Q291bGQgeW91IHNoYXJlIHRoZSBl
eGFjdCB0ZXN0IGNvbW1hbmQgeW91IHVzZWQgPw0KPg0KPlRoYXQgc2FpZCwgVGhlIGZpeCBsb29r
cyBjb3JyZWN0IHRvIG1lLg0KPg0KPkFja2VkLWJ5OiBOYXMgQ2h1bmcgPG5hcy5jaHVuZ0BjaGlw
c25tZWRpYS5jb20+DQo+DQo+VGhhbmtzLg0KPk5hcy4NCj4NCj4+wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBocnRpbWVyX3NldHVwKCZkZXYtPmhydGltZXIsICZ3YXZlNV92cHVfdGltZXJfY2FsbGJh
Y2ssDQo+PkNMT0NLX01PTk9UT05JQywNCj4+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBIUlRJTUVSX01PREVfUkVMX1BJTk5FRCk7DQo+PsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgZGV2LT53b3JrZXIgPSBrdGhyZWFkX3J1bl93b3JrZXIoMCwgInZwdV9pcnFfdGhy
ZWFkIik7DQo+Pi0tDQo+PjIuNDMuMA0K

