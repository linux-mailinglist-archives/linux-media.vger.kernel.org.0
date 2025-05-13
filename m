Return-Path: <linux-media+bounces-32377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D070BAB531A
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 12:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9306D9A6E5E
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 10:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF5C2451F3;
	Tue, 13 May 2025 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neat.no header.i=@neat.no header.b="YLF6FdNc"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2125.outbound.protection.outlook.com [40.107.249.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDB524501D;
	Tue, 13 May 2025 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132320; cv=fail; b=g9kQn9dSx4MrNEKMVYbiSeunCG+QAlrg2jFX+nEPmR1NgBzYrzYDtg5HC9oAzUjhfc2vPyTlq3JObbgHl7pPauIB3lqR1YcLGeXWeMAMrGucPg81LFkME0zN0XSDTVjt3yoqk4kfGfvXaGoCEfAp6u0kPu1eiDLEobf+WbN4MaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132320; c=relaxed/simple;
	bh=VYQbR2agBE2Ds4axydQ5tdkxhEWpKM1bXf4bbdy0Z4Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VGtj/Ajdz736XQQhUwjX/3Zh/qBFAWdTGZnRBtsqmIxUXbNo/NI88sRF2mSG8+EyyStiajHvFTp9c17742PEifx9/M2Oqjhe4GTF+J4DADWX7UXnZIMQL7xsGTd7SONzrkr1OOAqjggSISuMAum8GdfjpRE8ZxIa3/ZUFSg73UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no; spf=fail smtp.mailfrom=neat.no; dkim=pass (2048-bit key) header.d=neat.no header.i=@neat.no header.b=YLF6FdNc; arc=fail smtp.client-ip=40.107.249.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=neat.no
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raaPUrgTvEiZZ6Kz/f4ZdGrV8WuA0WNzvAYyKzVhou4KGRicwH5XCReuUzUEB0eRTdBQ1yZrh6tLVRDoNs+aqu3AaKewX0yagKdpw/iMcvd6ZiE+g4dStfdyFUdTsSDTGgcqKN4XuMTaBoI50dJK3SEvlg8c1VeVlQr7dx4zTSven/nRl6UkbaeiCpgINmiRPrJ3/G+JfIeBVvuLcOB8oOh13STzbfSATCkDI7DYcT3WA5UfECbwIbk8HP4ARXi94SA1C+c3BswlzLCU41S0G/8aku0ILCFvaWyKJk24wp8oRbUtPCz0tM689iV+5wWTXCpsAda4txnbgAnIs+MdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fiNWr2Z1L0692GLOGf/TzyFsx3RnkqkXOGyKfG9qss=;
 b=OCnEzoVZjSZMyb2sBTuOcwVGEnf1IHGikd2xk9mQ/69GCRG6Lp0HmaoQVMl+kgRv7DeElX376gEOkVuOSd35da8S5XSuB7Nj6/FLQgRYfdtTUS2hhPcWbIclIxZKKcqkATEsM8RP1QpN+yvclUhc1m4Qte1XdI4/YIgJuHFqjP7NgdVhYZ+luWh6Ew+9yyVrVOEvJxNAvxGnpY1Q/Wu+9g1a0/ItpMaqgWQzzSvqB0Kff6hccL66oOHIxSgNT0pGcgJ9KLzEBC7QyIinEzrURX8pynyttyYjfpfypD95Vz+bXfLy4uG37hI5vh/WxbQf2aUtJ/YGOrL0dycdrm/i7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neat.no; dmarc=pass action=none header.from=neat.no; dkim=pass
 header.d=neat.no; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neat.no; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fiNWr2Z1L0692GLOGf/TzyFsx3RnkqkXOGyKfG9qss=;
 b=YLF6FdNcLdJIixmu/+X4I3sbVr32EZcTS4NlVHqvlNHPsxjoR3B3/dJaJpZzsLvawiI21ruJUpqG6zGABo6/7Qh8fW9ks3gD0gliXXJWmWc8wiFNTydNfSTi91fmTwKVpdqKZiJ679Uvl0dYSoq1r0/JGJd5R21f1Xpk4g45MK+LWZx9UkTowPGU+2vhj8vRDHMx8q9PIP0PwxezLSo8JNON8nrPiI3fcG+S89CHFBzw6fWFe6+uZ1ySCgrLHmrrpvRIiqvWot/vCiPFRXVWpiZjwqEqZso9F2F1QvAbFkwjJWDtYblVUmrEfaoh2iZU+MZDpZIXvhhDEC1Ncap+YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neat.no;
Received: from AM9P251MB0223.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:3df::24)
 by DU0P251MB0827.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:3bc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 10:31:53 +0000
Received: from AM9P251MB0223.EURP251.PROD.OUTLOOK.COM
 ([fe80::f5d4:54a1:8303:1130]) by AM9P251MB0223.EURP251.PROD.OUTLOOK.COM
 ([fe80::f5d4:54a1:8303:1130%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 10:31:53 +0000
Message-ID: <2efb125c-d8ef-468a-a7ea-afcb5b5bee44@neat.no>
Date: Tue, 13 May 2025 12:31:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, balbi@kernel.org, paul.elder@ideasonboard.com,
 kernel@pengutronix.de, kieran.bingham@ideasonboard.com
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com> <Y4xaXHLoiPupWM6V@kroah.com>
 <b2e943a1-fc0e-4dd2-b38e-a1d77ed00109@neat.no>
 <2025051253-trimmer-displease-1dde@gregkh>
 <f07db888-8342-491b-86b1-43309a1d2456@neat.no>
 <696f471b-c2d9-4733-9795-0fc31a48e6f8@neat.no>
 <2025051317-deflation-discuss-1201@gregkh>
 <e5cd5e9d64123b319bae1a73c96cd33a3ad9e805.camel@ndufresne.ca>
Content-Language: en-US
From: Krzysztof Opasiak <krzysztof.opasiak@neat.no>
In-Reply-To: <e5cd5e9d64123b319bae1a73c96cd33a3ad9e805.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::13) To AM9P251MB0223.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:3df::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P251MB0223:EE_|DU0P251MB0827:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2e43cd-60f3-414d-d860-08dd92095eda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXd6azNzVDdyM0U0U1Jwa0lITHZZeHZqdWV4YzFic2s5N3I1c0tSc0Z1NStv?=
 =?utf-8?B?SlJ6RFpJeFk2c0ZxcEhJdzFXdHJoZlFKNXBuY0FsNDdzUGQ0RVhGeHZvYm05?=
 =?utf-8?B?MDZ2cDFnQktPNTBwSGRqL0pnUnpsODZMdWZmMzJxWmxyc3FpOW9uMi9NZkxM?=
 =?utf-8?B?OUttNklndUVjT0g2cjFobVNLaWZKWGsydjROUHlXMHQwWkRPU3piNVhQSEZG?=
 =?utf-8?B?RVFvaHpMWFRrQmNJOG1WRk9wYkRFaUZvZFJCbldDQzBBTXY2VEc0bm1PY1Na?=
 =?utf-8?B?eEllOXczNHRUUFV4QzRoQlpmS1V6UmQxNnNtWXExeEp1RzIzdi9OMy9BTHZB?=
 =?utf-8?B?NmgrRXpvcXNEbWllQVZWOG5QdXp4aENOa3BjUmgvUWE0V2RQelNMb3dIK1BY?=
 =?utf-8?B?UFl0dGpEM3NaSURGcUJHZmpCWGN4NzRzYklEa0VjUTQvNms5UmZOUC9SK0J0?=
 =?utf-8?B?NjhoOHlibGlSODBDclJ0T21EQXRrbTg5Q29pTURNbnJRR1lLVDNsMEt5UzB4?=
 =?utf-8?B?S0NzOCtJdWp5dmhuTXY4UEZUSTVEWXlpOFhDZ3N6OHdCVlpucS83TEZzbmFz?=
 =?utf-8?B?UmVTNDJxNUZkU0twdElibEJUclhmK0U2UVBDYk1scDBMNHlEWmJPay9UK1ZF?=
 =?utf-8?B?cTNpMUVYeUs4RldTTFErZTNvZjh3R0RnUFpPL0VxK0RGU3Brc0RBMGJoL1RZ?=
 =?utf-8?B?ZXo0Y3k5RFduSkUwbDduVlNoVGNLZTRoVDc4UGs1MTNuSVBZaTF5bG9WYzc2?=
 =?utf-8?B?QUxXbDBMcUFkUE9rZE53WmRjTWpaZzZ6cEhjWkNSbzdyKzYwSVFqZENIUXJG?=
 =?utf-8?B?dkFJQjJhd1JTbVVBa1F2cFBwNi9rNU9wbWtpMWpCRFlLNUZhRW5YMU9sb2Iv?=
 =?utf-8?B?N2tQYWUvTVhFandqeTRkT2FqVE4zRVdFRTh5R293aUwvUFlFRUlKSzRkd1VQ?=
 =?utf-8?B?bUs1UXBNb21hWWlpaFF3d2k5dnp3YVVobllqUGQ2amk3ZERyWnFzRzJtVGxY?=
 =?utf-8?B?YlR1eU1iZkZ2SVBNUUpYdUUxOHlEbmN0YXBSSzJEV2VRWExhdDJzbEhSS09J?=
 =?utf-8?B?ajlET3E4VmhTVTJtQ0oyY0NVVFQyeU9veUhKNmxvRVlRbFNGbmN2M0JyVVM5?=
 =?utf-8?B?RnNwZ3p5Rm16Tkt5M2xXTVBLMkNuenJMdzZ2KzRJakk4SmlFaTkySUljUVVR?=
 =?utf-8?B?Zi9NZVhiODZZN1V3bG5jU0FmTHM2dHBRN2UyT1BkckpXTU9PRm1zRlZPYjlL?=
 =?utf-8?B?YXYyLzRZWC9oMjcrb3g2eWNXNVZpTHM1Q29tZWVGTmpnZk9wUlgzTGhGQTF2?=
 =?utf-8?B?WVpxQ3lkM0FaNXVUZkE2bThpejhjL2xwZzI4YXBiVVg4dzVwZ3AvUERrRlNx?=
 =?utf-8?B?T25sL0M2K2pPVDZnYldienJMbGVGOWNjNTZRY21YRlhpRkZlUGh3OWplS3B1?=
 =?utf-8?B?L1lDUnF1czBiS1Z6ZTNXWlRqYUx1aVU1VHQ3T2pwZ3kxb2VtNDZZd1l3VHdl?=
 =?utf-8?B?RDEreGlPSWI2VU5mVzY2ZXRmTlRacHZ4alJiYTJZUENzRmJuSnNoM1ZmOE1P?=
 =?utf-8?B?bSs2YkdBZ0V5VXoyZWM3TWF0NFh0SlN3R2FqMEVLLzk4ZWp6TWtKR0VFZjJs?=
 =?utf-8?B?Rkd5NFdzenE2NTNnYXFwbmxmdTk2a0VIWkRLQlZHS011UW90YVdYSG9aUU9o?=
 =?utf-8?B?amhLVVJFUHRjc3lkajEwKzlidTBtejBRckVxcnd5WUI2K2k4UU1VQnpGeWxV?=
 =?utf-8?B?Q2poYjJMUFNLV0xpY1hqRjFUUnF4NEN5amhZN3NNL3VDMEIvbHNWRlo1U0dt?=
 =?utf-8?B?L1dEeVNReUxDcGlWV0swYU9VdXRja0lLVW5MNXpFVWFJUUJlaWR6a2lwRXFs?=
 =?utf-8?B?d1JsV2oyaTBmbGVkcEJRZ2kxVGd6SERJQ1FMUVVNa3FVVE1VRHFndTNRYnd2?=
 =?utf-8?Q?sqGaH8lab1Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P251MB0223.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWJNT1lUZUV6Um1Dc29QT3FnZ3R5UlVWdjZMUkhreGM0cXVUendicDFKMWtp?=
 =?utf-8?B?NFd6Y3MxNTlmN0VUZGVyMnFzWVRTazRWbVZMdDh0L2syZWxKb1FRcyt2aVZS?=
 =?utf-8?B?S01kcWpId1ZNbDBla3B6akxUVFJONmVSeHF6S1FEbk93WDJyaEwxUnMwc3VC?=
 =?utf-8?B?YWJpSjdUcFUrbjF1QW5YeFhsajFjZFM1ZVBlOWcrbzR6MnNmL1pRVUlNR01s?=
 =?utf-8?B?bzRjNWZkL2d3MzRFcjMyS2xkc1QrUUVJV0QybGhCVlNkeWZIeDlmWmw4ZkhJ?=
 =?utf-8?B?M3pnMXZWTlBxVXlsTjNrcGhWODV1M2QxWTdWU3BHTVNUaXZmd29HMWh4ZlM1?=
 =?utf-8?B?b2ppL2h3amlIZjlrQ2lrS1J4SkFobDVWVFNWZ3FtMFVRNTljOW1TS1krM3ZT?=
 =?utf-8?B?Z2lYRTllaGR5MEIyT3JGZUZlSVlLZjh5aWg3Ly80R1ZtZVdjK2c3OFNJdlBp?=
 =?utf-8?B?ODlKWEI0QzF4Z3J5NjcreHNUalRTNjRha1l5RGZkYnNYR08xY0ltblBETlpn?=
 =?utf-8?B?d1NVeHd4OHZETytaUkl4MklINnpONFBvY001U3krOFE2bGZkS255SEthSGpR?=
 =?utf-8?B?SWIxME9vbndOdDRGdi9xVXlRMERsQ1ZiOTl2RmpwbXVuSFdsZDJzMHNnY0lH?=
 =?utf-8?B?T0x1dHYySkRDbzB0V3psTmozM3FNZ3JrNzluWTA2bVEvL01idmJoL2VqamV0?=
 =?utf-8?B?bWFrajRaSWhDM0NxVVpiTjZJdTFIOTFJOXJQOHo1WlRwb09Ic2srY1VxMk5O?=
 =?utf-8?B?bktLV0tlTXVFM2xlMmpkcTh3alh3aERRTDJTcnRpRXJUcHlhM1dwWG1DcEx2?=
 =?utf-8?B?QXhibHp5NEw2aHBveTd2UU9WTHFNY0tIK2lUVlY1ZW5oTTF0ZkJ3SGYxMS9B?=
 =?utf-8?B?UmJqWSs5ZE5QTURSeGFqejhoMFcyK0Q3LzgrY2lpcjRoWDFvYjlOaldmWG9q?=
 =?utf-8?B?WnNqcW1xaTVVTHhFOTRxU1AwNzhVRGFleDhwSUNLcVFnM000dVdTbDJ1enpp?=
 =?utf-8?B?cFR3ZEVtWXhKbzF3SnIrZktYUU5GTTZEZmhSb3BNeEFQY1BtUlRxM0swTXow?=
 =?utf-8?B?ZHZSUEp0cVl6ejJjdUFxY2h3RWxvNHdWcEtTd3RmNndON1AwclhtZnoweWFB?=
 =?utf-8?B?L0xYYmNHclluWEhQNmlmTi93WVlVZUtJSnZOTExKYlVuaUQ5TkxWMmJ1dWJy?=
 =?utf-8?B?TGdKSThNL3pQVGxPdkllVWRwdGRTMStaNUdKWHpEZi9USkNsanhYOVdQYm01?=
 =?utf-8?B?NTArUmNrZXBJWW9CTjhReXN1Q09SRDNwdzlzT2luOEdWdVJ5QXRHWGlHb01S?=
 =?utf-8?B?TWExMDFYRlJPaDF4VGpIb0Q3aUdZc0NoM3ZYQXArYjByVnJLRElnYWg2bVFY?=
 =?utf-8?B?aUtsMERQWGhxdnFiTnhMQWdDcjN2QVlEVk5aWUpYWVNLOFFOL3NreTFRL3l5?=
 =?utf-8?B?VFJyeitSTnhGeEhPOTNyakRMSlFZU2g0YlNNU0NINHNMQ2IxZGVDUE1LbkQ0?=
 =?utf-8?B?aHBjbERxWWlZUFdTb09QLzNWVEE0N3hNOVBsOU9OcDlMQkVsQU8vdTNrc0tx?=
 =?utf-8?B?VnJJWmxLc1ZKRGw5a2pzOUxFMXh6Mi9sUFAzQ0E2OFQ0WGd0Wmdiejczckcz?=
 =?utf-8?B?aXhORkZGOGVIMit1WFZUcDNxZU1zTUVTM2UvK1RUYUdneHpDL1pmOHhYaTN2?=
 =?utf-8?B?N3g1WXBhak1NUXdWZUdlR0dqM2FkVTdFZThJdFdmeTRRRGxzOW9WMGJrRDRE?=
 =?utf-8?B?cnJDWFB2c3lvaFFsc3E3dkdwaDFQWUxLdFpxVnN6WU1CRVVMRWJhdVNNbzFs?=
 =?utf-8?B?N0dDeXR1cWFTb1Fjampib3BLTlE4aHo2M1ZRZHhGaHZJQkpWRk9hcGJ3ZG5N?=
 =?utf-8?B?cXdmNDlBZFBTZVF6aVI2TENjMkVackswSGNYam5DQmdYQ2c0b0dTRmNnckla?=
 =?utf-8?B?Mlh6RTdJL095ZnRCNW1GSkxXV2RRRXZwRnJaRG1xenZTaWxhOTdzYVYvVmFv?=
 =?utf-8?B?ZjVacnVHZWd3VS9DdTFEU3NzNkJmNThpUURCZ3pPNjhsWExEaEI0MkQ2NDQ0?=
 =?utf-8?B?QVY5WGhnYjRDUHBTYm1rNlR0blhQUllpbDJnb0M2bkNvaytFVlZRb0Z5SEps?=
 =?utf-8?B?b3JHNlJpNGZ2K2sxN1lTSXZHQ1RkSU5vR1I3bThneGpMZnZDT05JdXhVTW1k?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: neat.no
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2e43cd-60f3-414d-d860-08dd92095eda
X-MS-Exchange-CrossTenant-AuthSource: AM9P251MB0223.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 10:31:53.0215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 029c40c7-2844-4bf3-9532-45d5eff8c8f6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWg8OmgtGE1+eOBwbzM+/hTeZZSSl245OfIVXhLXmyPvSLp2W50DPV39queQ4U+E1EEcpLVTmbK102HjTwnxaTCmAX5Q3pqBF5R12FczbVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P251MB0827

On 13.05.2025 12:04, Nicolas Dufresne wrote:
> Hi Greg, Krzysztof,
> 
> Le mardi 13 mai 2025 à 07:04 +0200, Greg KH a écrit :
>> On Mon, May 12, 2025 at 11:03:41PM +0200, Krzysztof Opasiak wrote:
>>> On 12.05.2025 12:43, Krzysztof Opasiak wrote:
>>>> On 12.05.2025 12:38, Greg KH wrote:
>>>>> On Mon, May 12, 2025 at 12:19:07PM +0200, Krzysztof Opasiak wrote:
>>>>>> Hi Greg,
>>>>>>
>>>>>> On 4.12.2022 09:29, Greg KH wrote:
>>>>>>> On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
>>>>>>>> Hi Michael,
>>>>>>>>
>>>>>>>> On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
>>> [...]
>>>>>>
>>>>>> Given that I'd like to suggest that it seems to actually make sense to
>>>>>> revert this unless there are some ideas how to fix it.
>>>>>
>>>>> Sorry about this, can you submit a patch series that reverts the
>>>>> offending commits?  As it was years ago, I don't exactly know what you
>>>>> are referring to anymore.
>>>>>
>>>>
>>>> Sure! Will do.
>>>>
>>>
>>> Would you prefer to have a set of actual reverts related to this:
>>>
>>> da692963df4e Revert "usb: gadget: uvc: add v4l2 enumeration api calls"
>>> bca75df69aaf Revert "usb: gadget: uvc: add v4l2 try_format api call"
>>> e56c767a6d3c Revert "usb: gadget: uvc: also use try_format in set_format"
>>> 20f275b86960 Revert "usb: gadget: uvc: fix try format returns on
>>> uncompressed formats"
>>> 059d98f60c21 Revert "usb: gadget: uvc: Fix ERR_PTR dereference in
>>> uvc_v4l2.c"
>>> e6fd9b67414c Revert "usb: gadget: webcam: Make g_webcam loadable again"
>>>
>>> but have a negative consequence that the series isn't really bisectable from
>>> functional perspective. For example commit e6fd9b67414c breaks g_uvc until
>>> we apply da692963df4e so the series would have to go in as a whole.
>>>
>>> Or you would prefer a single commit that technically isn't a revert but it
>>> just "undoes" the negative consequences of "usb: gadget: uvc: add v4l2
>>> enumeration api calls" (kind of a squash of all commits above)?
>>
>> Ideally we can bisect at all places in the tree, so it's odd that
>> reverting patches would cause problems as when adding them all should
>> have been ok for every commit, right?
>>
>> But if there are merge issues, or other problems, then yes, maybe just
>> one big one is needed, your choice.
> 
> Won't a plain revert break userspace like GStreamer that have depended on
> that patch for years ? In such a delicate case, wouldn't it be less
> damageable to introduce workaround, like alias ? This is one personal
> script against numerous users of a generic framework implementation.

Shouldn't GStreamer be robust enough to handle cases of old-kernel which 
haven't had this feature at all?

The main reason why I reported this is not really the name limitation 
but the fact that this patch is just incorrect for cases where you would 
like to expose different formats at different speeds. This feature was 
there for years and we do have products that depend on it and this 
change along with the further commits that depend on it broke that 
support for us.

You are absolutely right that those commits added a feature that now 
someone else may depend thus it would be perfect to fix it in a way that 
doesn't break anyone's userspace but the problem is that due to the way 
v4l2 API is designed I really don't see a way how we could make it 
"speed-aware" without breaking all the users. That's why we are kind of 
stuck between:

1. Leave those commits in and then you cannot different streaming 
headers for different speeds but users of those API will keep working.

2. Revert and bring back the feature of UVC ConfigFS interface that was 
there since its inception but break the users of "New API".

> 
> I believe due to the delay, you are facing an unusual ABI breakage, which
> requires a more delicate handling.

Agree. The situation isn't simple as whatever we do would break some 
userspace... I'm not an expert on v4l2, so if anyone with a better 
knowledge of v4l2 internals has a suggestion how we could make this work 
with the existing API I'd be more than happy to try to follow that path.

Best regards,
-- 
Krzysztof Opasiak | R&D Team
neat.

