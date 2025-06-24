Return-Path: <linux-media+bounces-35818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 007C9AE6E94
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BDAA3AC371
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06292E6D04;
	Tue, 24 Jun 2025 18:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5XW4uOGR"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4204C74;
	Tue, 24 Jun 2025 18:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750789590; cv=fail; b=L+zPIQYCxQVnZesQ/j3bL9pmJ31PMgnln6KsNrNWypsfQcKikULJjrTFHvHzW4jZPJMXFx6BaOBY6iI4TlDQXsdHmqZYYsCzmFTW+tm9uT8kO0VBX4xaS24P29B+o8HxYJExfAz+g/ovK775MdPb67ME9yVEd1cj67kT/SbKbfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750789590; c=relaxed/simple;
	bh=unt8QO3zULm0GMs+s6uNKS/83HIUT910Feqt/SjHor4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Do8uTVYzlwVDGn8AMpYhRFMNYVF8klHi4EPJHHbQFsweNpat3OXKv0wH/uhSERcQv8pFA0GmEyXgHmFC6iVWSasKbTRLhskZbpdBHPfRlr5Trp3AJhrKUqBVOYgLEGFho9Pa5kQG6V0vHx4iPUHOZZSjbvXzKjJGK754lrT1Ucs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5XW4uOGR; arc=fail smtp.client-ip=40.107.220.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQMQ0H381Htif5a98v9wx3g+aK4/wQmHakOK52IQzd5VJVGrUKMpHrD/QvKpxsfYqWlq4WKKXIJNq6cSRrWn4VAU4B1t4+VtiV5l+w7s4rFvuCYaulRjrF5UlSuqn61O7bimDUDFO8fINC0PceFKF6JDonbDhzq7wZv3R19oEdavZuScsh+0cOWEvVicnxv0/pmO5Q5jJudmW/F1OfKdjr6YIMdI79atxj1Rkq2KAZgmYvKE8DodFVHZqKHh69IMy6Cij/u5O1fIm1O15qQdqVu9v0Sq/NSdkiUWEJ5CgrP1qo7Uh3wvYos6y+mYD3MqMe0yXc4kMd7Bt4UWKk0zJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bReS6vJB1j6ce9PuRJj/jjlpKGNyYvu8hvnSGwhhFzs=;
 b=w+YSg2lxem5/KGCnn2ti3CwzcBvqGiGjMKZHD0hCCMv9V6Cs+mNb9CNwouJ7ArdKNPXIuVaZP15H155oaGnGkAMHreCjb6v9Tc0O5hRLDCzfUnkoeaUgXer1PPlIXPMF1RU2qYbdXBeV9GWVvyqsTaiQXu2GV5qqVK4ePTVOD73wJW0OeMTcjev09u9fnUSmVhxS2GG5MZDqKHO5R5vhvq7RB2EikA7sz2XV0WVXQ6TRmefcIImOYJmOJZhQEulIru2nolHiFtjRMz3faupUunKBmNF9gXa9hUUt18HlV3ivunQZ080vZwf8J40e6Dc6XXiOkzNDvWcYYrrK8aJSSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bReS6vJB1j6ce9PuRJj/jjlpKGNyYvu8hvnSGwhhFzs=;
 b=5XW4uOGRg1rCfv1j30r/yRwZAOfaoARLqa/myyWe/vb6n/ZG+lJD2XhMWpQHtyPB22QD/I+mt5MeixULiwN74uXc1vBE4sGqHukDE1fQrViCFGGTdmvf7SlkPsx2UUnt+gP5FB9LyN7KQeOgkWEGX4plasWVFGHd+WC4RSIqoNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by DS5PPF5A66AFD1C.namprd12.prod.outlook.com (2603:10b6:f:fc00::64d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 24 Jun
 2025 18:26:26 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 18:26:26 +0000
Message-ID: <892063b4-165a-4d6e-a6bd-94ef58c0ee73@amd.com>
Date: Tue, 24 Jun 2025 14:26:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
 dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, Svetoslav.Stoilov@amd.com,
 Yana.Zheleva@amd.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
 <20250623220503.GA15951@pendragon.ideasonboard.com>
 <425j7c6xvbbatdhxgjgjawzwfnjmjetg6rpnwfudbtg6qz6nay@dy5ldbuhtbvv>
 <aFp7tuXkU1jayPum@kekkonen.localdomain>
 <aFp78tqHhe_IhV6d@kekkonen.localdomain>
 <20250624102745.GG15951@pendragon.ideasonboard.com>
 <nixg4efp3zkdpd6h7kp6wkvam63batpoknov2nkgu36voks6bk@gzuackzl3l5g>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <nixg4efp3zkdpd6h7kp6wkvam63batpoknov2nkgu36voks6bk@gzuackzl3l5g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::14) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|DS5PPF5A66AFD1C:EE_
X-MS-Office365-Filtering-Correlation-Id: b477498e-c90e-44a8-a01b-08ddb34ca104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3NIQVVlQkw0b1gxamVBN3VkT2tySklhbGpLWXRzeDFoSE9pNlo1cng0ZEtQ?=
 =?utf-8?B?VlJaS3pFYjR0eVNMYjYrckhSZk5nWlFmMmhoejhGVW8wTXd1Z201Y3dIMHNM?=
 =?utf-8?B?NElXWXVDOTdnSUlmOVh3VU9ramU4UXlCVGU2NzlBVjNaNzNXOG5nNnFCcGti?=
 =?utf-8?B?SHU1M2MyMHcvNEhLUlZnWi9ISWxwU1Erdlk4ejlJU1RwdkM5NktaNm5SUnhk?=
 =?utf-8?B?NmN4OWZGOEFwNUhTajRjY2sya25oM0g4YzMzZlZLZVZiM1Q3NXNKOWwrQ21o?=
 =?utf-8?B?MWNneml2cW5CcTQ1QzVnaGFsaE4yYm9mNVJDNTJpYzF2eEdOeXVYR1VaYXdE?=
 =?utf-8?B?OHArZTRxN0ZxaHFpOWdYUExnRmJIYjBzWHdtR3daeXRKVURkSTZYR1g3Vkd6?=
 =?utf-8?B?NEM4UEtxbFRnM1lpRjYxUW15alJiRm9xamtWZVZkRmFGOG13aWJEUThRR291?=
 =?utf-8?B?SVdQOEVTYmRUNm1ma1dHRnp6UGNnbTh1RlY1RnVsS0xCYk1ySEc1Sml4VEVF?=
 =?utf-8?B?SVNVYmxuYlltcGc3RmRLMDdiMEl3T0NTYndrZkZQakRwVVhTcS80ZFdjRmlM?=
 =?utf-8?B?M045cFpzcDBDR25XdXI3aHE1QnZuWktQTHJGekpUbEVPRFdndEMwZmRLWEd4?=
 =?utf-8?B?VTZvR2NwQ1FPQXdFMmxIMkhuOGpwL0xyYjM0Q09TWjhoM3c1QXBlVXdMa0pS?=
 =?utf-8?B?YW1nYzhrUXZjUDdPNzhMZDZwNGY0NEplUVdXem4xYVdTVXdJR1dhbWJSakRp?=
 =?utf-8?B?Tzhkb1ZhcUNhNlMwelVMQXlhV2V2WTVlMU43cmRvWHVJd0JKZ2FTSWxIa0dE?=
 =?utf-8?B?SmhWVlhGOFR1QjZ3THlWOGZyZTBZS1VWMXoxU0NlVWErQ0p3U0FFeUpyRGxa?=
 =?utf-8?B?c1lKYk1rNW1zNENUc1VJSnN1WDFsWCtNVmVmNUwxTGV2UGEySzJkeEgxekhS?=
 =?utf-8?B?RnBRWi9vVzdOY3hmSXZsQXVuR1plM2d0a2N3OXJHOE50eTJNRHVldFNUcUVS?=
 =?utf-8?B?eXlrNlVlTDlZQ3cyeWRiSEVBeWFQeWtwNzZ0RFJ0SUxSMjBuYlcvUTY3OEhm?=
 =?utf-8?B?MVVua2ltU1plUVlLc3VIYmVHZ21UZkZtdDlxOFlJZWhjZ3dySXRPeW9OTUJq?=
 =?utf-8?B?eVFocTVFaVdWMXE3cXl6aVBXMkZtL0lTbmNZa2kzNXpub3ZRbWl6U0VGWnhF?=
 =?utf-8?B?UjJZemwrSU05QzE5YnBEbkNNdkdLaSt3YXlVMmhmWnNpRDNheExLVGtqV0Zm?=
 =?utf-8?B?YUZyaHJtelpIKzhQWXBxT0dWUkxnQks2dEJDZ0J3dVE3RVRxd3Bldm56MU9O?=
 =?utf-8?B?S0VXRC9oUXJZcVpiNHZOYUljbFdDWW52V2xxT3crRzBPL2R0NHJ1eTlzOGZ5?=
 =?utf-8?B?SHFiYTZHcDZaZzhmV3AzakFlQXMzY2VaQlhJS0R4V29QbHhscGh1Q2VCOExB?=
 =?utf-8?B?Z0ZqbUVSSVJXSERXRDVwUkJTNUk1aUREbXhYZ0xaTTdDcmdxU2x4NkMyTjQz?=
 =?utf-8?B?TElNdndhREYrU0RXRHdaRk1zN0VvYkVJVGwzcUI2OHB0UXd4dVYxaCtTUExG?=
 =?utf-8?B?VDNDS21jVWVRWXdBeDdON24yOWR5RDdGdllQcFdJYlBLQ2ZLRllyS05hTzVu?=
 =?utf-8?B?WEJZa2Zub3VEQVVEUTJGQzlxblRRd2JOODYvWmpOUFFIOEdaWFFaUE5qWEZQ?=
 =?utf-8?B?VFNBOVlTQjRGZjBzZnBEbmpYZmw0R1FFaG5ZZUdWc2c5QS9DamNrNzU5TGZ4?=
 =?utf-8?B?ejJzZjZnbmhJL0dhcFp6KzhlUitPQkRMUHpNSldvcHBZSmFKdjhhRCtTdEtT?=
 =?utf-8?B?T2I2aWZMeGhHN1IxR0dRdVZCUEhxTUk5R2dnR0FTNXkyZ2xwRUlHNDBOWEVx?=
 =?utf-8?B?ZTUxdWR0S1hWODA3OXFBbFBZWi9EMGRPN2hHNU5YMXBFcW9sUVV1Q1VNMUhE?=
 =?utf-8?Q?mwynfM/oWGQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K29Wb2VPRk5zcGRIeG13MC8yRFFUODZwQndFYzJHRnZMckZzQndRZmVMOHFY?=
 =?utf-8?B?S21vTVRTQ3dLd1FHNGRlSE1RV2k5Z1lBWCtWQnVyYUtrUnNxTzJrUDJ0ZmZH?=
 =?utf-8?B?MEtiZzRFSEVyMy9IRXpvV0JnZlRhQUE0SjNrVVdYWjVyOXNjVmVuYm1zQW9v?=
 =?utf-8?B?dU9iS0xlanJmWFZGRlBEODBkQmZrT0pzdTRXVU5Mbnd4dzVFcE9ZY1RCVy9h?=
 =?utf-8?B?THNkc3hUbFcrcVZIUWUyMVhCaERBRVVmN3VwZHRiMGJnNFcvU1haaHRaR2FO?=
 =?utf-8?B?aHk3Vkt0TW1uck9MZlhJL1haRSt3RnJOWSt1Nms5aHZTVDd1TEFEUXI2d2th?=
 =?utf-8?B?YmxSSXF1NStWQ0ZmSjlHSnhpSjRJYmNpblFyY0ZzMCtFUFlPampaSW9xbTNG?=
 =?utf-8?B?Yit6NlowM1Y3cUVjdyt2OStrUi9aN05KOVo0NEtOdG9FaU1wclR5R2JnZ2Qw?=
 =?utf-8?B?SWIzSmt1R2NLNFpoc2dvQXpWTDV6OGZpT2VzYmZBMm5Lc3gzRUpEejlvMmNL?=
 =?utf-8?B?aXVRME5zSVlZcFk3ek1RTjZPNENnZFcwMHY2NXR5MzBKYlQvRzVxdFdQeHZp?=
 =?utf-8?B?M0JEWlZOd3JTYmNwb2toa3F3cEU0ZDFuYmp2eFNIZEJoZFlpb0hmUmpMcHJx?=
 =?utf-8?B?MzNJamZuSi9VNS85RUJ3V3kveFF1U2JuSzN0Y2NFU3ZVRkVYanpObUFEbURq?=
 =?utf-8?B?ZEIwc1BrODEyZHNQTXlGZ3gyVHVCUGRhVitaNVVOQjUzeXRCc3NBakFJT1dI?=
 =?utf-8?B?TjBWNXFYbmQrUzE5eSt4d1hQcjUycWd6cjVvSTRkcmdyTGdUM2NMUmp1TFll?=
 =?utf-8?B?VjhyZXNyckxxdGF3dk05blYrV25LY0F3SmM1ZUpXa2JGbWpZRld1THZmQUgz?=
 =?utf-8?B?a0xnK3U1NXJqcks1QW9jTlNKdExLbUVPcmg1L0srb3FFKzVoQ01KSHh5bnlp?=
 =?utf-8?B?R0pLQnJiU2dJcm1KVkFvcFNOcUpPUGtMa1JKQ25KWW9MNERmQTJjT1RFT0Rw?=
 =?utf-8?B?eW4zOFhlOFhFclBEZjZOUjFadjFDRVVsQ0E0TkZ2M0lpTktPQi9MSnQ2R05i?=
 =?utf-8?B?bUFPclFHbVV4Z090ZDVhL2FmSkVFbFhha0F3dGlPV1lnSzNrTUpXS0w3bjZw?=
 =?utf-8?B?aTBTdHRvbmlPVGdXUFFSWThKaGcyUVRsMDk1dUpmbVJpd1FVM0xxRFR4TEJZ?=
 =?utf-8?B?T3ZGTEQ4NGYxYzB5WlhBYmh3SEhZb2dYSXdCcVgxWHRXRlR0V2w3cEd0Wnk0?=
 =?utf-8?B?VlpUU3hlZldrOGJuMVdvNlR0clFXMjJsRVpFQlJCWkhZQXhrT3NmV1VnSmhX?=
 =?utf-8?B?aTFGZWZoRlJPT0hGV1J1dFRSZWwyR2piNmlIeXh3VEVjWDJhckU3cjVmUjNt?=
 =?utf-8?B?RG5oY28rN1dOMGY4NVFNL1ZnZmxqR1dFdVJ4TmVnNlRSVmJmRjF6d1RkbmlQ?=
 =?utf-8?B?b29vMWFHT004TlR6TUNXdVVNTThRd3hualkrRzJtS05OZ1JTVjhUQ2h3RkI0?=
 =?utf-8?B?NE9md1YyZmV0emE0WTQxbldWbFIzM0UveE1rb0RPK2xMaU5EakFjUTRmWmxy?=
 =?utf-8?B?VkxGMllJejdlL1dKdEVDZjNacjZNNXpkUDBkT3N6VXNPQ2Vsejl0azFqV3l3?=
 =?utf-8?B?SHpPR3F6WlRvS21jSmxyKzF1Z2JVNFFzRndGSkU5T25HOU1OM1pWWW9iUjhy?=
 =?utf-8?B?RDdGdEt0MmtNdFY3U0NrYXlkZU54RnZQbHJKMHczMlBnR3NzaXZmeVZlUTlM?=
 =?utf-8?B?NFE1QTNKQUZHZnFrUWF1c21vczV0VmFRdS9nMWdZTC90WnRyUGVGVzBTcEM0?=
 =?utf-8?B?S1lkOFVwTXNSbFIzRUk1b1ZCSWFMVDRNcDU4WVI4bm8zZzJoUktmb3hvbTda?=
 =?utf-8?B?UUpKZjlUZUYyVml6R1A1MzNhZ2VaRlMveUxDLzdxMGlYVkU2eHp1Z0M4Rm5V?=
 =?utf-8?B?ekV0M2pSdnlrN0dMR1FZTlhDR0RZcElLbG5waGRBNXRNdU9ZbGhHZndrdmdS?=
 =?utf-8?B?S282YSsvNjhycldUaEtFK2VCcWZ4YjZWb3p4cThCOEtucHJIYzd0eFFpb3NZ?=
 =?utf-8?B?T2pOYWFNYkN1QWtEUDRBeCsyQlBPOHF1TWdJT3JkVFF3ZFNUM21rNk56d3lq?=
 =?utf-8?Q?rqxheQVvarKG2mE/5DqYnVDTy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b477498e-c90e-44a8-a01b-08ddb34ca104
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 18:26:25.8844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8Jph/N+38RVsHjzEksBgzjQ1WhZAE2KQ0owkqUAtT0gScrbf39uMlZkIDOV4NZ5hs/IMiFVIoyxG0RGjzvBmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5A66AFD1C

Hi Mehdi, Sakari, Laurent,

On 6/24/2025 7:27 AM, Mehdi Djait wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Laurent, Hi Sakari,
> 
> On Tue, Jun 24, 2025 at 01:27:45PM +0300, Laurent Pinchart wrote:
>> On Tue, Jun 24, 2025 at 10:20:34AM +0000, Sakari Ailus wrote:
>>> On Tue, Jun 24, 2025 at 10:19:35AM +0000, Sakari Ailus wrote:
>>>> On Tue, Jun 24, 2025 at 10:35:18AM +0200, Mehdi Djait wrote:
>>>>> On Tue, Jun 24, 2025 at 01:05:03AM +0300, Laurent Pinchart wrote:
>>>>>> On Mon, Jun 23, 2025 at 05:51:48PM -0400, Nirujogi, Pratap wrote:
>>>>>>> On 6/16/2025 6:49 PM, Nirujogi, Pratap wrote:
>>>>>>>>>> +static int ov05c10_probe(struct i2c_client *client)
>>>>>>>>>> +{
>>>>>>>>>> +     struct ov05c10 *ov05c10;
>>>>>>>>>> +     u32 clkfreq;
>>>>>>>>>> +     int ret;
>>>>>>>>>> +
>>>>>>>>>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10),
>>>>>>>>>> GFP_KERNEL);
>>>>>>>>>> +     if (!ov05c10)
>>>>>>>>>> +             return -ENOMEM;
>>>>>>>>>> +
>>>>>>>>>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
>>>>>>>>>> +
>>>>>>>>>> +     ret = fwnode_property_read_u32(fwnode, "clock-frequency",
>>>>>>>>>> &clkfreq);
>>>>>>>>>> +     if (ret)
>>>>>>>>>> +             return  dev_err_probe(&client->dev, -EINVAL,
>>>>>>>>>> +                                   "fail to get clock freq\n");
>>>>>>>>>
>>>>>>>>> Let's try to land
>>>>>>>>> https://lore.kernel.org/linux-media/20250521104115.176950-1-
>>>>>>>>> mehdi.djait@linux.intel.com/
>>>>>>>>> and replace the code above with devm_v4l2_sensor_clk_get().
>>>>>>>>>
>>>>>>>> Ok, we will verify on our side.
>>>>>>>
>>>>>>> We tried using devm_v4l2_sensor_clk_get() and found its required to add
>>>>>>> support for software_node to make it work with this driver.
>>>>>>
>>>>>> Why is that ?
>>>>>>
>>>>>>> Please refer
>>>>>>> the changes below and let us know if these should be submitted as a
>>>>>>> separate patch.
>>>>>
>>>>> The helper is still not merged, so no patch is required.
>>>>>
>>>>> I will see if a change is needed from the helper side or the OV05C10 side.
>>>>
>>>> I wonder if there's a better way to figure out if you're running on a DT or
>>>> ACPI based system than getting the device's parents and checking which one
>>>> you find first, DT or ACPI. I think that should work for now at least.
>>>
>>> Or, rather, checking for non-OF node here would probably work the best. I
>>> wouldn't expect these to be software node based on DT systems ever.
>>
>> Until it happens :-) And we'll handle it then.
> 
> So we have the following:
> 
> - The problem with this driver is due to lack of proper ACPI
>    description. HW is already shipping and AMD will work on better ACPI
>    description for future models. See [1]
> 
Thanks Mehdi for clarifying and providing the reference from the 
associated x86/platform driver patch.

yes, thats true we have to add software_nodes to mitigate the issue 
caused by incomplete description of camera device in ACPI tables.

For future models we are working on a plan to address this issue 
following the MIPI DisCo Imaging Spec suggested by Sakari to properly 
describe the camera device in ACPI. Please see [A]

Once again thanks everyone for the support!

[A] 
https://lore.kernel.org/lkml/2a9ba94e-7985-4ba9-88c6-45b8cf4d001f@amd.com/

> - software_node can also be used on DT systems
> 
> [1] https://lore.kernel.org/lkml/0d801367-da24-4596-83d9-08ccd89ca670@redhat.com/
> 
> Now going back to the helper. If we want to support this case:
> 
> Approach 1: software_node || acpi
> 
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -682,16 +682,17 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>          const char *clk_id __free(kfree) = NULL;
>          struct clk_hw *clk_hw;
>          struct clk *clk;
> -       bool acpi_node;
> +       bool acpi_sw_node;
>          u32 rate;
>          int ret;
> 
>          clk = devm_clk_get_optional(dev, id);
>          ret = device_property_read_u32(dev, "clock-frequency", &rate);
> -       acpi_node = is_acpi_node(dev_fwnode(dev));
> +       acpi_sw_node = is_acpi_node(dev_fwnode(dev)) ||
> +                      is_software_node(dev_fwnode(dev));
> 
>          if (clk) {
> -               if (!ret && acpi_node) {
> +               if (!ret && acpi_sw_node) {
>                          ret = clk_set_rate(clk, rate);
>                          if (ret) {
>                                  dev_err(dev, "Failed to set clock rate: %u\n",
> @@ -705,7 +706,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>          if (ret)
>                  return ERR_PTR(ret);
> 
> -       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
> +       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_sw_node)
>                  return ERR_PTR(-ENOENT);
> 
>          if (!id) {
> 
> 
> Approach 2: of_node
> 
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -682,16 +682,16 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>          const char *clk_id __free(kfree) = NULL;
>          struct clk_hw *clk_hw;
>          struct clk *clk;
> -       bool acpi_node;
> +       bool of_node;
>          u32 rate;
>          int ret;
> 
>          clk = devm_clk_get_optional(dev, id);
>          ret = device_property_read_u32(dev, "clock-frequency", &rate);
> -       acpi_node = is_acpi_node(dev_fwnode(dev));
> +       of_node = is_of_node(dev_fwnode(dev));
> 
>          if (clk) {
> -               if (!ret && acpi_node) {
> +               if (!ret && !of_node) {
>                          ret = clk_set_rate(clk, rate);
>                          if (ret) {
>                                  dev_err(dev, "Failed to set clock rate: %u\n",
> @@ -705,7 +705,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
>          if (ret)
>                  return ERR_PTR(ret);
> 
> -       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
> +       if (!IS_ENABLED(CONFIG_COMMON_CLK) || of_node)
>                  return ERR_PTR(-ENOENT);
> 
>          if (!id) {
> 
Thanks for proposing "approach 2 using !swnode", I verified and confirm 
it works at my end.

Thanks,
Pratap
> 
> --
> Kind Regards
> Mehdi Djait


