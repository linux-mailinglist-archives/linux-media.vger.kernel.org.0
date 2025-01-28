Return-Path: <linux-media+bounces-25336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93279A20A3C
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 13:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91ED47A2025
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 12:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3195F1A08A4;
	Tue, 28 Jan 2025 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zqp53/BX"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF31A0BF3;
	Tue, 28 Jan 2025 12:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738066204; cv=fail; b=SIhLvdn1T9K4rmuZyz+uH/eUM5yc57HPaMJ0yE6/K4RpPgDNki2T5DJgv5WC041IiwWHdzSrGOSIPhPXee0UBZ8yAe79wJaDpaIdaVm9f8yHKQ0oy1WquHLgOfoJwREP7LAZukCKgRwbHiTTOBMdtlrjt62uMvbbKtADUL+W2oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738066204; c=relaxed/simple;
	bh=ffUEe15K5CYRcM7eRLF2dBFOkBHjY+0NCzBA+CpqIFE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ocr+vi3B506YVQhl5eNSO+882bJkEN4k90bKOdsrrUa7SgznGPvfKIwTkT/mKF2BzhAdArlrotrbaJSM5nvztT/wkE5W0FS9/2fhjsstNNIsQK67B1n/5uw5dyL1Ofq5BcLU3PgQk866YeuPL8IUkQAWhAMXyeec3k7nrxWgFrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zqp53/BX; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsLC5y+3u2BPaBAA1C5jDiSCt7omEWDsj0llSAED+dCj/eVaZyfUw0XH8IZSErZE0DvFD5r8qR/zgSxeZSPi++VFVf0BFxf9Its7F7bB4eOtknYLYC5PN+/wZ5RCkcZxlgaPCkzQVl2dE3vG5JBmJSMeWEsYfhovqozvTVCP6gaFbMvnnoCEAOsS+GFOsmQ9OwfaqSUi5VbrGbE6NmBftWeHqvKPfpVywnvXH0QkjuXDXGmob1lJFVCCmPD7YF6vkb5a3b2SBkpW8obO0e7Ip8oTdxz2vEEwhuqO/D66lwK4mFOgKmCFq6WOPa2YqIHMylYI40W2+lZgJaSSiNUsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHYYYXYqz2a3sjmoLK2cqKpsSuNo80GhZif04NIB8aE=;
 b=LVqK2R9GDcgAYDQnVZ4HeIiy3kIrFa2J3eDEGXtHnHTFuz1zhT6rW7Lj4fQwyHVfnyeBivhJ7T+TD6IsXPM1nzNOXHBR3XeKyx5BIFMDUZ5xMfJ9URb3wzv2/XC2u4vZyU+aW6DNk0Rxr0MZnOtZG4bMBcBcZT2EyUEk2HLLmuIglcpeS59/wLFmgRBdafAuqR0lmJ6qbeTUlSkuIbyWW+qkryVR7b+n0eEXEIG7okl8QqPSxsPWR1LLBBDfctwe1kJ/OWtz4H1Mof0cUyBB1LMG7fLBIEZ/dX3/xGfEE2MyZvuqln1wE6HeiTg5EGwxsDk3GdA2/FJTblpu4DGu3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHYYYXYqz2a3sjmoLK2cqKpsSuNo80GhZif04NIB8aE=;
 b=Zqp53/BXO9QwL/6NKG+cRuV3YHbvJSbmesQ9rInhXT6KyIxO8jxSEA3kQoZdbaxkf0RwyMepNjT2kVrYtXYts6pBAZtXCuyhu0yluivkEYnw+bILfvMEiyIiD6dTWTh8VT2HHuF6HagIT+WhMVL7uagN8rjDBkRpg/8L/y3pvkS4E1jO3EZwlpARNGlvpmCSbCW1ueprCKqi3x6ZvZewq9GQfwyCBrn//xad6rbkFnc3NjbgNMguC3lufQsWv/pbWAWyKZ/5zxJW7oxPppKFlE0hYXvewS+kBqth5ecf+4thEjYl/AbM1LxkcCoAsSG7Bx5jt3zmr6yXlN0UzF/SGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DBBPR04MB7691.eurprd04.prod.outlook.com (2603:10a6:10:201::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Tue, 28 Jan
 2025 12:09:56 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 12:09:56 +0000
Message-ID: <1751e672-9ba1-4e8c-92bd-c7385afbe624@nxp.com>
Date: Tue, 28 Jan 2025 14:09:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH v2 2/4] media: ox05b1s: Add omnivision OX05B1S raw
 sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 mchehab@kernel.org, hverkuil-cisco@xs4all.nl, robh@kernel.org,
 krzk+dt@kernel.org, bryan.odonoghue@linaro.org, laurentiu.palcu@nxp.com,
 robert.chiras@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
 kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
 mike.rudenko@gmail.com, alain.volmat@foss.st.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org,
 alexander.stein@ew.tq-group.com, umang.jain@ideasonboard.com,
 zhi.mao@mediatek.com, festevam@denx.de, julien.vuillaumier@nxp.com,
 alice.yuan@nxp.com
References: <20241126155100.1263946-1-mirela.rabulea@nxp.com>
 <20241126155100.1263946-3-mirela.rabulea@nxp.com>
 <131271d3-f3be-450f-b4e1-a7efb65362f3@redhat.com>
 <20250125001437.GA19927@pendragon.ideasonboard.com>
 <367710fc-9c66-4cf5-9059-1df00320f1f3@redhat.com>
 <20250125121832.GC1805@pendragon.ideasonboard.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250125121832.GC1805@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0051.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::40) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DBBPR04MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8d8580-8d7d-41cf-54cc-08dd3f94ad90
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cTdyTGpiVXV2RGtPbmw4ZmFKVGZVeHFobkpxUHlpTjRPY2h3YjN0RlZHZU55?=
 =?utf-8?B?bGRvRjdjZ05PYWlMd3pVVW1xRHZURjNFSCsvSUduemRueGowZkdTTHRkN0xF?=
 =?utf-8?B?dm5XVDJXNXlUaXoyVzNaUDNVY1V1b0FyL1ZWdHBPNkJaUW5vYzNPc2ZVWmRi?=
 =?utf-8?B?OHJyZkpyMTVxMTNZYVJwNHBrNG9LU0ROdDd4QnBOUTFYNkljcStnQzZyaUFM?=
 =?utf-8?B?aklnOHpqUWQxdjB6WGNKOXd2TkI2cGUvWVJUL2p2aGdvWGpUQ2x6dXRxK1Vm?=
 =?utf-8?B?dUtKUnlORStrVVdCTW1iU2VOcG96YTFoVlk2emt1bVZuWUdZYmE1Q1UzaDdL?=
 =?utf-8?B?RGQ2dHMxSkJscGxKRnVZa1hkNmFqa041SlBBQ1ZiZGlONkpYNDFLSC90UG1w?=
 =?utf-8?B?VTQ5b0VKMnc5bGRMS3lheHZVeWxpQkNJeVI4UTVrU2psV29Zb0IvQmc5ODM0?=
 =?utf-8?B?clYxTjB3ZFhLcktzQ29DK0dYblFxZzMrditscWREa3NSRURaQ3EvVExhR25v?=
 =?utf-8?B?N003VnZrUElYZmRMejR6cDUxVkNwVzdISGJVQm5YbmhwYnlZWlZjb05ZTStV?=
 =?utf-8?B?VStGZENLT09sYnIwNkpuRXR5VXhFSFl3dmhJV0krR2hLNFhNMXIxd1VSNDh6?=
 =?utf-8?B?UmlwTVBUOXVwamt4VVFacWUxMEliaWREZU9DdjNrditURDlmQS84Q3l5K2VT?=
 =?utf-8?B?Y0U4ODJKNEp6YW5TYjc3ZXdycnRVRGhiVUkrbkd1YmRtVXF3TWJlS0Q1V0Rk?=
 =?utf-8?B?ZDZJOTNTTFg5ZGthZEljcldVajV4SFRSNnJzaE9YT3JpUTlzNlNiKzlCanh3?=
 =?utf-8?B?MFhGbTNGWG55MkJpbUI5TTN6YlNmS0FGVzh3QnFpbG5WTDgrd256Sy9LL0Vz?=
 =?utf-8?B?bGdJTWN1cktmQzdudk00N2owQVYwVVpVdWw4REdxdzNSdzh5T3N4YVdzOEE2?=
 =?utf-8?B?K2FTTm1kKzJydGVSajVRT1RVRTV4R3A5QTNJQ0dsRVBjMWhjWUVjNFpqdGRh?=
 =?utf-8?B?VExCYzdpQmRFLzRtU3dQLzdpVUhnVERjb0tmVlpmNnBZU0ZkL0dnTTdxaU9V?=
 =?utf-8?B?ZTJTSytyNUJzTUJvcjZhbkxYM0UvczlXQ1FMbkZnbFZsVXZHdzcrSTZucWk1?=
 =?utf-8?B?SmJIT1czSGtzVXBBK2ZscWE0MUozV0pOYUdkT2JmNmdVeDdqaU1Dc1VaNzd1?=
 =?utf-8?B?YzBvL2VIVzl2RXBoMWVQczczZTR0a1E1TTkwQVJWcUx1WTlNWEJNQzFGK1E5?=
 =?utf-8?B?N2YzUDRZU1pIbFZrVTNmM1FiVjV0Z1JDRHpUNXNZeTVEbDM2SXUxN1R2aXVs?=
 =?utf-8?B?SXhSaHljUVBWekNBMUs5TmlrMDhyVmIvdThOaHBrRyswZWM2MFBjWkhwa0pv?=
 =?utf-8?B?aUpNTmpLZFZrSEkxTjR1dG1XVkNCeVozZFhsbEhvZmoyckRMTkVKZElPYzdU?=
 =?utf-8?B?cVFYQlRuczI2K2dkNWRZOUtYQTBteHordGNSNEIrcVoraFFOTy9rOHc3WTIz?=
 =?utf-8?B?RW1RU0h0UFdyRHdzY3UxelBCdWhwRmdOdFUyRzRGQlVpbnhvb2R4R2dmUzhR?=
 =?utf-8?B?RnhERWFFY0JIQ2ZJeFdPT0hPdFRsWmRjYnJUZ1VHc0szRk1HejZ0UFhTV2Fj?=
 =?utf-8?B?bWpZekQvZldSeGtUQmFKKzJFNGZyUjFCeTIxSThSMVBkTWNCQ3NYZFI4M004?=
 =?utf-8?B?aGRNdld0UjFrR2c1WFl5K09RaDlpelQzYVNXRzFBaHdQN090cktwbVZrS1ZH?=
 =?utf-8?B?QU5nOXlTMjFsTWx1NTdXVEIrNzMwNjg4Wnk2eUVRZ0FqaVpHK3lZeU1hVFhS?=
 =?utf-8?B?dG9PYjFMOFk5YTJlaitvQklEclAzSEhxYjRDcW5KYlhwQjRXOVJaaDZkbW1n?=
 =?utf-8?Q?UYbV2QzCwVPSe?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RHVHZVhhSU1Wam9zeDdCVU9CTEh6SUxBSmFsTUtOSm0rbkdXcGN2Q1FYLys0?=
 =?utf-8?B?NXE3d1cvc2hKdUJBS2J6b3hVaTFSV0tsdU52TWR4S0JlMFd0TGFKREsvdzh6?=
 =?utf-8?B?L2dhZHhBUjlQVXJXTDZvai9Rd05iUFN6R2ZMUXMyTFEzUEY0Ri9mVHZ5Mk1G?=
 =?utf-8?B?UklyUUFBQU8vVE5PWkR1VVhhckpma2VnNnFaUWVzMzBDaStjVzArT0duL1li?=
 =?utf-8?B?bXpFQm9paHJiT0FwaWZBNlovSWxFQktWdUFkQ0tjaXA5Ry8wTWtWNG9EcUl0?=
 =?utf-8?B?RitRVFBLMmlXRnVSam1PV1pjSkJjUjJxdTVhTmdOeDdMMWVwaHd1d3crNnVn?=
 =?utf-8?B?QlgycVpmWVFoWTBsbzhJamhuQVhXRGNROTNYUWxkcGxtQllPSURWYmNuWVEx?=
 =?utf-8?B?c1AxakJnekM4WXR6VlpGR2EwcXowdnVvbG8zQks5Z20zMkJ0TFdFeHZmcFRw?=
 =?utf-8?B?b3ltSWhaZ1ZlWFYzU2VXK2dFQW9ZQTFVMTErVmhpa2NVT2E4bnRrdWJIa3lZ?=
 =?utf-8?B?L2pLbDZXVjVSREhTUjZtSVdnekoybVdaRDRlOVZXREJQZ0MvWjNOdm5Oc3gv?=
 =?utf-8?B?K1NRQTFZVGpRNVl3c0xETzVzUytSbUFGV0ZyWDkyTjJmWW5HQTJOOFJlTkh6?=
 =?utf-8?B?UkhnSDA1MVVNeFJMdXdiUEhMV3p0dnJtS0pEM09VV21KaEozaEE3Z0hVdUxM?=
 =?utf-8?B?OTBFWGhkUURsYkVjY3NySlQycjB2MjdoUjFIanJFQ1FLOUZielJ4N0ZJZVpQ?=
 =?utf-8?B?aU1US0JXUUJJVW13WWJPckJFRkxCMTdRcFIxRUIxSHdBckZnaFJRYkRGVEF4?=
 =?utf-8?B?eHZ2Yi9mT0ZRV05EaW9ZNVVqN1NMcnpOeXg0QUh4UzNNd05lNE5GWVRudTJT?=
 =?utf-8?B?QmEzb0hOQTFvUW1CbmJHanV1b1ZHSTBHWi9iVG4zeTRsS0ZOaDcrUEtuRUlo?=
 =?utf-8?B?SnQwbWtJek5ia3ppazdMTEc4RDFVS1VCUFltUERwbU5pUkw3dkdHL1R2ajhL?=
 =?utf-8?B?RERDQlhxbGR1NlRkR0NVTDRCMjRhdU5vUWp2RkxiamRSQkFXRjBNYTZubWQz?=
 =?utf-8?B?RE1KM0VyRXByUWJDWXVpUWp3Y3YveitYU2FLcklXNHFWVlVIL2xkWjd3VzRV?=
 =?utf-8?B?bFZ1dFEwOVpVZTcxSklyelk0QkpWU0NSUUdCbUMwRDhPSDN6U0gvbitUcmJW?=
 =?utf-8?B?Um83UjJHNmh3Y2xCVUpBNEpDM3JXQlVZNForOHpyaGdJUVRpcy85RVM5bTdZ?=
 =?utf-8?B?N1p4MVFLMk50M1RkU3BQRktTUm8xdFBXbit0WFhvTVZxQnFpRkpNWjM2enNu?=
 =?utf-8?B?WVk4K2F3Q3FHRXFZeUVROWt0UDhSdXFUMml6cWN0akdvUElqVG95d0QwUmE1?=
 =?utf-8?B?ZW0yRVJ3ZC92Ykx3ODJTRlQyVWd3anlxaExqS2tIY3RjakR1R3E2WHBEMjNO?=
 =?utf-8?B?VG52QU1oTDRLb05yK0N2R1dKWUZRY1FqemNXUnJzcHRQV1gvRmRoMWs5L2tR?=
 =?utf-8?B?Vm5xVmJILzlOYzRLMkFFR0hiZmMwY2pITHFpMTBGbDcxVWw1YTJUNzc2ZUdQ?=
 =?utf-8?B?WE5HRi9RQ1dnMjZ5cFFONHdvOG9PVUVrZVRoS294ZlRuSGNzcTNEbHFKNnBx?=
 =?utf-8?B?Z3kzaHN0Y3Njdkl3VjBuaForR3hMR1gwTm55YUlSaE1vZ1V5R1A5UTVwZ29P?=
 =?utf-8?B?d1ZMZHhvQitSeDdBK2tYdFk1VTFpSGRUbTMzZ2dSeEFXaFhDdS9neEtGa2hq?=
 =?utf-8?B?eHl4OEUvRG8wR2Q0UHd3SzkxMHR5SHQ1R3Y4VVJkbHpBR3N6WmRqbDQ2dzN4?=
 =?utf-8?B?MXR6RlpsV0NjdVN3NWNWUFRIVkdFOHF2VG1RSW93NWJXaHNtNjVpWkZ5TTlG?=
 =?utf-8?B?TnpGWFdNTHptb29BR2FQa0pIM05DbzI1dTM0TVFQRlFFOE1JUnk1bUZQRWMz?=
 =?utf-8?B?dFMzOHNLckJmVVVnd2ZCRVNHOGxmMzY4SHNqZVV6aHhNbUR5VHNNNVlOM0Zj?=
 =?utf-8?B?SVZzOE9rUTJWd2cySUlMdXFHU2JmSzd6TzBGL2E4M1hWVDJXNVpiQllucU9E?=
 =?utf-8?B?a29LUmpLdGtxRmtQaXpmbjNFeXg2ZkdJZ0s5QjRjS3ZESTB5UmhGNXdybDU5?=
 =?utf-8?Q?8sJE4NZxFblgD4/zxHMNuhTJh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8d8580-8d7d-41cf-54cc-08dd3f94ad90
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 12:09:55.9211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWP8JzHfPnfA+b1U1m4bkmzLUmsc3mPIXrRzTVxUZuTEA30E+yYCrVNsTMcU3YdC7gDLEWssRsCpq+tNAf3Itg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7691

Hi Laurent, Hans,

thanks a lot for sharing your experience on this,

On 25.01.2025 14:18, Laurent Pinchart wrote:
> Hi Hans,
>
> On Sat, Jan 25, 2025 at 11:12:16AM +0100, Hans de Goede wrote:
>> On 25-Jan-25 1:14 AM, Laurent Pinchart wrote:
>>> On Fri, Jan 24, 2025 at 06:17:40PM +0100, Hans de Goede wrote:
>>>> On 26-Nov-24 4:50 PM, Mirela Rabulea wrote:
>>>>> Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.
>>>>>
>>>>> The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
>>>>> active array size of 2592 x 1944.
>>>>>
>>>>> The following features are supported for OX05B1S:
>>>>> - Manual exposure an gain control support
>>>>> - vblank/hblank control support
>>>>> - Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)
>>>>>
>>>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>>>> Thank you for your contribution, I noticed in $subject
>>>> that the model-nr ends in a "S" and that you describe
>>>> this as a RGB-IR sensor.
>>>>
>>>> I've been working on OV01A1S support myself and one of
>>>> the issues is how to communicate the RGB-IR color-filter
>>>> to userspace.
>>>>
>>>> <snip>
>>>>
>>>> I see here:
>>>>
>>>>> +static const struct ox05b1s_sizes ox05b1s_supported_codes[] = {
>>>>> + {
>>>>> +         .code = MEDIA_BUS_FMT_SGRBG10_1X10,
>>>>> +         .sizes = ox05b1s_sgrbg10_sizes,
>>>>> + }, {
>>>>> +         /* sentinel */
>>>>> + }
>>>>> +};
>>>> That you are using MEDIA_BUS_FMT_SGRBG10_1X10, but that suggests
>>>> this sensor is using a plain Bayer color filter which is not correct.
>>>>
>>>> Here is what I have come up with:
>>>>
>>>> diff --git a/include/linux/drm_fourcc.h b/include/linux/drm_fourcc.h
>>>> index db679877..68ed65c5 100644
>>>> --- a/include/linux/drm_fourcc.h
>>>> +++ b/include/linux/drm_fourcc.h
>>>> @@ -447,6 +447,8 @@ extern "C" {
>>>>   #define DRM_FORMAT_SGRBG10        fourcc_code('B', 'A', '1', '0')
>>>>   #define DRM_FORMAT_SGBRG10        fourcc_code('G', 'B', '1', '0')
>>>>   #define DRM_FORMAT_SBGGR10        fourcc_code('B', 'G', '1', '0')
>>>> +/* Mixed 10 bit bayer + ir pixel pattern found on Omnivision ov01a1s */
>>>> +#define DRM_FORMAT_SIGIG_GBGR_IGIG_GRGB10 fourcc_code('O', 'V', '1', 'S')
>>>>
>>>>   /* 12-bit Bayer formats */
>>>>   #define DRM_FORMAT_SRGGB12        fourcc_code('R', 'G', '1', '2')
>>>> diff --git a/include/linux/media-bus-format.h b/include/linux/media-bus-format.h
>>>> index b6acf8c8..e2938f0d 100644
>>>> --- a/include/linux/media-bus-format.h
>>>> +++ b/include/linux/media-bus-format.h
>>>> @@ -122,7 +122,7 @@
>>>>   #define MEDIA_BUS_FMT_YUV16_1X48          0x202a
>>>>   #define MEDIA_BUS_FMT_UYYVYY16_0_5X48             0x202b
>>>>
>>>> -/* Bayer - next is        0x3025 */
>>>> +/* Bayer - next is        0x3026 */
>>>>   #define MEDIA_BUS_FMT_SBGGR8_1X8          0x3001
>>>>   #define MEDIA_BUS_FMT_SGBRG8_1X8          0x3013
>>>>   #define MEDIA_BUS_FMT_SGRBG8_1X8          0x3002
>>>> @@ -159,6 +159,8 @@
>>>>   #define MEDIA_BUS_FMT_SGBRG20_1X20                0x3022
>>>>   #define MEDIA_BUS_FMT_SGRBG20_1X20                0x3023
>>>>   #define MEDIA_BUS_FMT_SRGGB20_1X20                0x3024
>>>> +/* Mixed bayer + ir pixel pattern found on ov01a1s */
>>>> +#define MEDIA_BUS_FMT_SIGIG_GBGR_IGIG_GRGB10_1X10 0x3025
>>>>
>>>>   /* JPEG compressed formats - next is      0x4002 */
>>>>   #define MEDIA_BUS_FMT_JPEG_1X8                    0x4001
>>>> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
>>>> index 3829c0b6..1b91ed0e 100644
>>>> --- a/include/linux/videodev2.h
>>>> +++ b/include/linux/videodev2.h
>>>> @@ -706,6 +706,9 @@ struct v4l2_pix_format {
>>>>   #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
>>>>   #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
>>>>   #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
>>>> +  /* 10bit mixed bayer + ir pixel pattern found on ov01a1s */
>>>> +#define V4L2_PIX_FMT_SIGIG_GBGR_IGIG_GRGB10  v4l2_fourcc('O', 'V', '1', 'S') /* unpacked */
>>>> +#define V4L2_PIX_FMT_SIGIG_GBGR_IGIG_GRGB10P v4l2_fourcc('O', 'V', '1', 'P') /* packed */
>>>>
>>>>   /* HSV formats */
>>>>   #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
>>>>
>>>> For this, note:
>>>>
>>>> 1. This is against libcamera's copy of the relevant linux headers, the paths
>>>> to the .h files are different in the kernel
>>>>
>>>> 2. Since I wrote this I learned that it looks like the intel driver for
>>>> the ov01a1s:
>>>>
>>>> /https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov01a1s.c/
>>>>
>>>> may have enabled horizontal-flip / mirroring by default, which means that
>>>> the order of each of the quads needs to be flipped.
>>>>
>>>> IMHO we need to resolve how to communicate the color-filters used on
>>>> these OV xxxxx"S" models to userspace. When I last discussed this with
>>>> Laurent, Laurent suggested using V4L2_PIX_FMT_Y10, combined with
>>>> a new field or v4l2-control to query the actual filter.
>>> Yes, adding new pixel formats and media bus codes to represent CFA
>>> patterns won't scale. We need to switch to using controls to report
>>> those. Sakari is already working on a series for that.
That is why we also did not try to add some BGGR-IR format, because 
there were too many combinations possible. Even if we are using just one 
particular format, someone else would probably need another format, and 
in the end, we agree that such a solution won't scale. So, separating 
the size from the CFA information seems the practical thing to do.
>> Interesting, do you have a link to Sakari's work ?
> I don't think it has been posted yet (Sakari can correct me if I'm
> wrong). I believe the plan is to include it in a new version of "RFC v4
> 0/9] Sub-device configuration models".
Looking forward for that :)
>
>>>> The idea is to separate the depth/packing info from the filter info,
>>>> avoiding the possible combinatioral explosion of needing this special
>>>> filter with all possible deths. I gave this a quick try but at least on
>>>> the libcamera side there is still a lot of code assuming that both
>>>> depth and color-filter-type are communicated through a single fmt
>>>> integer. Also it seems that in practice there only is this one new
>>>> RGB-IR color filter used on the OV xxxxx"S" models so I think we
>>>> need just 1 new V4L2_PIX_FMT_ define (*).
>>> Changes in libcamera are surely needed. There's work to be done, we'll
>>> do the work, and we'll solve this problem. Let's focus the effort in
>>> that direction.
>> Ok, so what does that mean for upstreaming support for omnivision
>> OVxxxxS sensors? Clearly advertising MEDIA_BUS_FMT_SGRBG10_1X10 is
>> wrong. So I guess that upstreaming this driver needs to wait until
>> at least the kernel API side of this is resolved?
> It depends. I don't know if that's the case for this particular sensor,
> but I wouldn't be surprised if some sensors could interpolate
> neighbouring pixels to replace the IR pixels and produce a regular 2x2
> Bayer CFA pattern. If the sensor you're working with can do that, then
> the feature can be enabled by default, and the driver can advertise the
> corresponding existing media bus code. Otherwise, let's cooperate to
> review and merge the subdev configuration models series :-)
For this ox05b1s sensor specifically, the CFA pattern is
B G
G IR

And when mirroring:
G R
IR G

So, we choose MEDIA_BUS_FMT_SGRBG10_1X10, as that was the closest match, 
and our ISP gets extra information from userspace (libcamera) about the 
CFA pattern.
>
>> Sensors relying on the new CFA control to communicatethe CFA type
>> could use a new (e.g.) MEDIA_BUS_FMT_RAW_1X10 or are we going to re-use
>> the monochrome (Y only) media bus fmts, so e.g. this sensor would
>> advertise MEDIA_BUS_FMT_Y10_1X10 and then the CFA control would provide
>> the actual CFA info ?
>>
>> IMHO re-using the monochrome (Y only) media bus fmts seems best
>> to avoid needing to have to make a "RAW" copy of all of them.
> I believe the plan is to use new RAW media bus codes, but we can also
> consider reusing the Y formats.

So, should we try to re-submit this driver with Y format, or rather wait 
for the new RAW media bus codes? Is there some work already started on 
RAW media bus codes, are you referring to the generic MEDIA_BUS_FMT_META 
formats?

Thanks,

Mirela

>
>> This also matches with what we are already doing for IR only sensors.
>> AFAIK MEDIA_BUS_FMT_Y10_1X10 is currently already used for infrared
>> sensors, so sticking with that and adding a IR CFA option to
>> the CFA control to make clear this really is IR (*) seems to make
>> sensor for IR only sensors. At which point extending this to RGB-IR
>> sensors seems logical.
>>
>> *) Actually the whole spectrum the sensor is sensitive to really AFAIK
> I don't think I would report the sensitivity to light of individual
> pixels through the new CFA pattern control. It seems a candidate for a
> different API if we want to expose it from kernel to userspace, but we
> could also simply add it to the camera sensor database in libcamera.
>
> --
> Regards,
>
> Laurent Pinchart

