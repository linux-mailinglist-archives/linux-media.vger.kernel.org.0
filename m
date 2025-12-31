Return-Path: <linux-media+bounces-49774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C290CEB2B1
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 04:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D235A30402E2
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 03:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9AC2701D1;
	Wed, 31 Dec 2025 03:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="nCIhWzas"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFDD6BB5B;
	Wed, 31 Dec 2025 03:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767150172; cv=fail; b=bPe15JgsEsDg9U5FBNvEMFzG5SyRTte7vSeAusvB5AhL11RsEWtueNJABlAmWXyp3ll3SzLcggUKiMPTPIKVjTU/Gcc7sjn6AYogCVqnBa7NrMWTk1AItt+N0wYsogLdf4uA9PXF8wwB4bb8RC+6BL4iIOmJg6rLgpmCVV+p/Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767150172; c=relaxed/simple;
	bh=uXIFNyvF+Ncedm0jM5ejSQcYcuXRxgzFI/AQOpn55Zg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M5zkA3ayX6M1RFrHjnMGDnprQrl21iYzd+Wn1Af1/kQrG4nFhd1Vp2c3O/4hpDaKx49J8Lgc5sisOJ3QGu5UHVFbujVK9jEZ/xXQ06LiSBA0xnxxZKL8r3PgW2xIJFv1NqHtxQyvIQ8lrcYadJUJYVBVvLU3e3LqPjztH/WCm0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=nCIhWzas; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV2qvok3895743;
	Wed, 31 Dec 2025 03:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=WzUcbXOgMoKp1ac9PRWC0ZZi4nFjV+MvPp+DruIKiMo=; b=
	nCIhWzasBIzQopbklWZAt8mfC2Z/FYfNt46ZITFg04rnwM8V/UGh6ddpaS6D2TqO
	5ZieInHWfNOEEpP+AG/Ma1/Yr17kamI8H5D/YE5OwwiTJWrkxt1CbOCvvL0B5Bn9
	kvbakmRPD4vWM5elL8aw6bi0Syv9Cqb9d1h9PNWNYCL2f+cAp4SCHhILtLiwZzrE
	pLpllsU7fFovmKD2OrQtObttVKtJ137zUrjq1N4Qo+/aHL48cDnuO1qTUgDvWikc
	pI1KePMo3Bphqil2ylAwnZC6vpv5IdNl+C6KtqkDx6UU7VbAbpIKPYj+KDEY7k6/
	nUkiJoGXBSBClgyALDBtVw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010051.outbound.protection.outlook.com [52.101.61.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxuhga-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 03:02:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5Q9TbgRg+n18ulOQj+Mognga+IpR0cmUgqnhEGk7TB+fyQEVIhAsPpvY2QkG/mMx924g56++GielQCP6qoDizEELmi5E0jbEn9datog6t+ZgNHNZpSxiuXlRmEpsj8avneDeOmNTY28QS41O9UvZ83M3xZglN6YAbqkFbqgjtiJ4qfGEvjTG1y6UH3UwGswLwzgFv1xGZV48co+vfNi6j+4+4d/glYeW0uObFHXJybrWV7InKVJZxdxePlJ50SChB1D9v7EuGGMsOM8wB1q84bX+h+BORpel98vddqNc/5sgk4I/u2Z+dXlN2sF2w+wVq9mdMpm6FZ8IrnbqjJ+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzUcbXOgMoKp1ac9PRWC0ZZi4nFjV+MvPp+DruIKiMo=;
 b=aLodTSQ9LR6NvykMUJbCZBixYndjR5Q6uKX5R/G8Ah/QI7+dXuQ1oiJUSqE8Lc39mFlkbEQjH0Icyv6iq7Cvsw1Z9U3rv+fNmAwnD6WcgvWeM76Y/AYyh2ku3zWDl7O7Io/VHydRIj4S03pdRtYjFwZZdxOxQGVZDIOFvSrTMFLNUNVvILsGIgTQsyCIM0hhbl7E9dE6S385LIgT83sT/OEf9Pkw7TvG5oB4mwuVGd6uf/9aGc1ndsbRhe0gpJ6+EBGroLX5OMtU3S/vjUa194vNnxjwkgeodp8gGJ2vkuX2GQx2AUx1z53C7asK7dPndBvYMuIvVCw2H/UZ33krtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by CH3PR11MB8468.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 03:02:32 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 03:02:32 +0000
Message-ID: <0d5f8843-9653-4c0a-9740-dc34734348ef@windriver.com>
Date: Wed, 31 Dec 2025 11:02:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: i2c: ov5647: switch to
 {enable,disable}_streams
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
 <20251229023018.2933405-4-xiaolei.wang@windriver.com>
 <20251229134349.GD6598@pendragon.ideasonboard.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <20251229134349.GD6598@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|CH3PR11MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d5d165-e9eb-4780-2d75-08de48190a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RldQQkQvcWRqa0cvMmM3TzdwME5KWENPUHp4cUNCbUdNRTlYSmhPdW5kMGRi?=
 =?utf-8?B?dDFuRDk0TkFhZXpsMGJvQzhEREpoRStwbC9tTzJSRnV1UG1lZnA5V2Nad1ZX?=
 =?utf-8?B?Tmo1bkJNeFV4YzBpMktxZ0VERjYxSWRWaVR1WlBHMVJlRFdWMExodE5vWFho?=
 =?utf-8?B?TDVwZHFUZlVJQnhOc0hYUFVuQ0VmMEZVcGRmRkYyczI5NXdnR21teWhZajJp?=
 =?utf-8?B?WFVYclJwdFZoTDMzclhQKzFLNURMT3BSTlJ6Qm43akVFcEx5MEdkM3NoNTVH?=
 =?utf-8?B?MGowaXIxYmhMTGtFY1J5YzFqUDNqZjAyTnhUaHI3Sm12dmdQamxrdHFicWo1?=
 =?utf-8?B?TEczQ2JDZys0bzJPNEtNZ2Z0dHpFNnlBZnVDU09nUGt2V21yNFBMSU94dHFq?=
 =?utf-8?B?SVU2UCtQOEVRNzNqYkhlMWE4bE9lT0Zic0MxNmorQXBhdE51UXlLYnJVTkpF?=
 =?utf-8?B?SGFlVGJvYzNkenVzcEtmK3lUVE9RNXR3OG5lS1g2b2hqRHNaRlhiMmdMQVZ2?=
 =?utf-8?B?dWNESU1aWHozVUFBNlNpN05iQnIzNEpnbDNGMEVZT05EQThJdCtNb1RxS0Zu?=
 =?utf-8?B?dGJncUZDTG1FV1NHbGhiZE5aeURndGxGYUNTSHhKTWF2a3ZnRkc2eTEvQjJ2?=
 =?utf-8?B?UFFSUjBnL0FIZHBOWXJuc2pQOGhhdXl6UnhSR012aVZlR2cvNFF1bUI5TnFw?=
 =?utf-8?B?QmlYSWRUTG93STVybU1BOFV6eENxZFhuVlVYR3lnUW5EUEtieWpUcE9nNjFl?=
 =?utf-8?B?TEtXNWE2dTN2dElDKzFNbTFQSkxaR3gwSkhNZkZzakc1MkEweWEwNFg1K2dJ?=
 =?utf-8?B?OVZFMkNoSzJlMWMzZHQ1Z2RCVHNoTFI0d1JXQkY3ZjY5V0toNzhxNVJnSzJ4?=
 =?utf-8?B?eTlCcStndjh6UzR0UWtyMkNUN1VjMlVKQ3FJeHhiNGdSNUNUa2lsMTNiblJT?=
 =?utf-8?B?YWZGaFJjR2NKZ2U1UXlGZVRRam9Zdnd6aE9wbUt4SGhQdW1ZQkFsWXJaWDNu?=
 =?utf-8?B?QTg2UEQ3cWl3SlFBQk9IdVo4aDhwLzVwR09zYkUvaDFmeFFpRVNOdXgxc3Jp?=
 =?utf-8?B?SnBxWHFabDVXQVJiYmVmMmVrVVpLVHRlWDBubC9CUkpQbUErcE5JWVRlcGVP?=
 =?utf-8?B?SFJyZitjclFjZTdWYTQrbWh4Q2xBU1piS1Y3Q2RoeFBnSzU3TmN3T0NIZmFa?=
 =?utf-8?B?V0MvREd3VkNtNnM4RG9OSHdoa000MEl1Y2l4aDJDSzdkQkhzUDkwVlFSS1cy?=
 =?utf-8?B?Vm1yUUxPZk5LQklqMHdJSmRFN1FWai9UeS9BZjN1VXNtNUhIK3p0RlNyOWkw?=
 =?utf-8?B?Qk0xczN0dERRUXZpOEZ1WC8vZ0htRkYxRHNuY1lFeTVYek5NVGN0eFdqSEhr?=
 =?utf-8?B?UmRiaDVwSHBtdG81YmxsOEU5aVFQbktFc1BkcUFmRCtCdUFIVmkwQ3dDdzhD?=
 =?utf-8?B?ZFhuTU9aQzhTWFpyTTUwNHF0Y0NxMFE1MlJDaEsyS3R5S0c4dFZLb3RGcnBz?=
 =?utf-8?B?TWpzdWVpdkUrWUxJRlZONHNqWXQ1OVFCV21iSEczQzhVZ2x6TU1BbXVjaTRv?=
 =?utf-8?B?MDFxRytwUWZmM0JMbEJ5RlMrYlVJOHI3SGZBTUswTmdwV0J1NDVjK2Ztd2Ir?=
 =?utf-8?B?b0wzeVk1S0ZyN09jSmJPR0ZneUpPdE5nTnpFUFRVN2ExNTZYTnNmNDZWQlVM?=
 =?utf-8?B?NCtVczNRemNXU1RLNVFiVzJ2STk2TWpNWFBwSU5sRnBYanVmWWJFR1p1WW9W?=
 =?utf-8?B?dFcxbUlTQ0VCZk1lRFNLaEE3QkJESTNRaFdCdzNkVEIzWDJacklyUXJsRjdO?=
 =?utf-8?B?eHpna0lWUldiaVoyM0tLcnN3S0h1a283YjNJV0xBaklUYWg0YUtJdFZOeFB4?=
 =?utf-8?B?K085SHNHNFE4VEN4WkdFUlJOSlMvMm9yRWJMQlRHZFk0YzVBWmhzcHJNSUpT?=
 =?utf-8?Q?i7qZY4kqNXvQCY9dst9Dmf1B/XhaAPL7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3hDRko1a1NNbCs3QzgwaC83M1VKZXdmK1hrR2h6MkR6NmY2UjdMNEsrVVRT?=
 =?utf-8?B?elBQTVVBRmFZcmlMWVMxLzNmdWVZYnowRElEMm5DT1hiUXppVzlqRzZjMHo5?=
 =?utf-8?B?eGk2bk52YktyTUJDRGx1ZHN4aG9iWEJXdGlsemRGalovdHBBMURBVzlJN2Vx?=
 =?utf-8?B?b2dGSE1hU3E0WktPdU15STAzYzN3R1lLSWc2NnhhckRBZm9hWmJESFJnak9E?=
 =?utf-8?B?WjFCWHAvSFErTWloVkxLK3lzS0pBMytySW9seGlsZHMyU293RDRad1h4SFZY?=
 =?utf-8?B?U3pTRFArZE9UbmFFNmFpNnhNK1BXUzU2ZlpsS251aGZKZlc2UUVaMCtScU95?=
 =?utf-8?B?enVObklVWERPZkpvVndlWkNVTTVvdlAzRFgxOVBiQ3U5S0xCaVZMeU5WaDVx?=
 =?utf-8?B?YVBBMUhncFV0bXQwYmsvSDlMU3dQN1pqdlE2N205UTRRUytLd1ZPeGoyWVJs?=
 =?utf-8?B?Z0ZYMEVRdVpiRk5KYkhGZnEwNkJ1YVJMb2h1ZUlwZVhVZ2ZPS3lpMnltdUZj?=
 =?utf-8?B?a3VVOWw0UVBSRWgxandZRUdFSXhSUmxHcllBemVWY0czbmVkSkozK00yRkxh?=
 =?utf-8?B?WWhvRnl0d1VwMzRPaC9tTVduUmFRK2MrS2RrRDNMVENtU2UxcStNaUxIYU9P?=
 =?utf-8?B?VS9HRlpVbTFTWVVhcytkMnFWYlNMYkcrd1l5bG9vWnFXOVZiNWNOb1VYSEk1?=
 =?utf-8?B?ZS9wcllqMlA4OFBkVjMrUVk0Wkt3S0orWml1dXBqbWtETHFSSnBxVnBkVHR5?=
 =?utf-8?B?MHFRYjNsVWlKaVppSE9LbzQ4Smdtc2RLQ0JycjMwcmlqcWtnRXhjMSswNllV?=
 =?utf-8?B?Vnl3RlVYQVBjMjdhemxkNlJIQkNKZ3hXbTY3WllCVGluT0hKbmg5ZU1FUHYx?=
 =?utf-8?B?WGNvU3FldFRLZmNGRW1BY2ZpaUd5K3dDclFwMTZOZTJ6MU84Um5VenlBM1h2?=
 =?utf-8?B?aWswOEdxK1E4UkZYUnp3aEZkdmp3WXRObjR2V256MXJnM3V5Q2hBZWRldjR0?=
 =?utf-8?B?K1g3eWYwcGgwb29nVVA1emUvcHpRb0dnN2E2UWgwNlF4ZTN5ZGxkTVFvU2x6?=
 =?utf-8?B?U2Zxei9tVFRGREdzV2NsaXl3M3hVSklEZnBVcEl0bnhrWlZjWkVhWUFZb3p2?=
 =?utf-8?B?TnFnZHV1RTdvSlhJRExXdStCeG5adUhVQ25wb2lBQ2h5UTJhU0VuSkkzdEEy?=
 =?utf-8?B?YmdqbnhwdVZVMjg3QlcwV1cvWFNyOVhyR1VTU2RPVEovRjBIQy84czdxQ2ty?=
 =?utf-8?B?ZW10M2ROb01CcFJIRjNzbmNLTE9rWGZzcEo1di9yekk3bG9NSTMwVWlMeit2?=
 =?utf-8?B?a1pHNnYrOTB6SGdJeEloUE5tRE9XdmFBSnVBNG1scm93UXhhTFpGeUFWcUNO?=
 =?utf-8?B?M0lrMHZYRW4vNkV4amJ6Sy92cHNWKzh1elRESnFzcXBWK0ZnQ1hJWWFYZjBq?=
 =?utf-8?B?RVMyS2FXMlNWR0taWi9WTEoyY2lWOUNLTHlCa0xjMGtwbHpmVGRjQVNwR0JN?=
 =?utf-8?B?YzNHcTNnZGozQjUxSldEMXl3a3hmQU5neHcvWUhKRm9XUUJINU42R3MyQS9H?=
 =?utf-8?B?QzFCcG85OU5FWVR0czBuZ29nK2p4TEJ4dkRlSjB3VFZ3M1hxYTc5dmdDS0hV?=
 =?utf-8?B?VHo2bG84MFZqUXNneWlLaS9vWlVOYU13NXVLVXhQd2hBRkgweEVWZHQwa3gz?=
 =?utf-8?B?SnVYLzdmVjJoU280SzIvNFUvaGJIZDFJNWJ5TFhNb3JkMzIxSUJtWFpCR2Ro?=
 =?utf-8?B?MTJPWXo4TER3dTdXVlhUNnM0M2NOcFpVMEp0QzJwMDFGYVlpTXZLM2ZJU1gz?=
 =?utf-8?B?Tjd3LzJzTXpDRTB5Ry9RUGxkVGNCSTNta1l4dHJkUUpGTHB5UGpMYzVMMG1Q?=
 =?utf-8?B?YWZyeWZmZHd4ZkhHZHZMbkxTWjFCWnpGejAvRHIvMTBCdU1HeENHdlVPM08z?=
 =?utf-8?B?eDVycG5SZENycnl6d2IveXRxaW0ra1d5WFFHVUVmTzFiN3RwU0pLdXJTeXRE?=
 =?utf-8?B?TTF5NTNYdjZHMlMzazNmckdDTTMxNWI3VjFleDgrQzNDL2lET0xRNFAyNDZ6?=
 =?utf-8?B?cEI1Z2dYVExyS09XdFRwRHVpcGFHQlIxNXZOemhLcSsxOEpQQ3RBZ1I5UkdL?=
 =?utf-8?B?R01UVjA5aGVQN3BzcFVoVzhzUk9uOW1wcXc3bDU3SkNkTVBOc2pUdnZvV0tI?=
 =?utf-8?B?ekoxRzBoclhsWmNaakJGWS9OYXZnWUVJRXVXR2lqbGtxVTA3cnpOMm9Zak50?=
 =?utf-8?B?bnBwcTRDaDB5QlFQNUFWdXNVd1B5UnJXRWZRRHhsZzZ5Zk1RQ24yY09KOEMv?=
 =?utf-8?B?QTFLMjJzNFVPYUdhN1o5SGFjKzNVY0xxWjEySkY5b1I3MXFjd2EydUNKN0hU?=
 =?utf-8?Q?M60Zbp+8KQ4JVUuUC9kTExQc3R2Yk0wNSlEK4Fb1WQ4BM?=
X-MS-Exchange-AntiSpam-MessageData-1: e/XYhNwg5ZV5Lt1T3SLMrya717wTDLFKZ48=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d5d165-e9eb-4780-2d75-08de48190a64
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 03:02:32.1593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xufZDw1GpjoDTYWvFeqmxedAD0gHykyF9SINRHAS/8c3X2vkp2ETRoFUukVQ3Tr3VnUciUUgo8lLJSEwEMgbc23lyK7mrAfbF6aBmce6x5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8468
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDAyNCBTYWx0ZWRfX5nhIYgPq+4cP
 w3H+tjhtibAn5oihd2T3D55h9b5ISOID9Hi2xGDtxQPGA/Xjn25/EEi4ZN/Gu1yi7c+yXv2Fv7h
 aqOkLOggXnDZmJds9CrzzXjnXwtdHEDYMlYj+A62x1+FpvN4BP4BhNwT7aT0I85heopjkzlGJPc
 96I7EbaiJt4prt3lkcbtcPuwQb4vb5q79KHiR3D2a3CbcJ21Uaf5NRAGNTqYUeAFSZD4MsVx7Cg
 RhClKqAdkr3AJqHoDhtt4hmKr+bm+f608AWHy2eO2XRmPURuRjxl4X/cx0+eXamASTB8VKZUDZd
 RFrwlHJA4TSt4kiiUYcbpV4+GNYNUZLN/OC3JRuA0/Q44Ox4RQEXPUw4BTFUKpuV817DN4We2ag
 elgn37e9r6O9fZoVuDqQF2iNIbsHW41Xa9bMJiKm0XQtKkCAURp0LVVCTzdn/ye1j5LDSUDV1RX
 lclonLKwJhnHFmo4OEQ==
X-Proofpoint-GUID: Bb8Z2kjECnnft3v4hmpz5Vci7cp3GZnX
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=69549249 cx=c_pps
 a=U2ki1QFzN2iGT7kcnsve6g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=P1BnusSwAAAA:8
 a=y0DSO5eORNwcVHHSDIwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: Bb8Z2kjECnnft3v4hmpz5Vci7cp3GZnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310024


On 12/29/25 21:43, Laurent Pinchart wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon, Dec 29, 2025 at 10:30:18AM +0800, Xiaolei Wang wrote:
>> Switch from s_stream to enable_streams and disable_streams callbacks.
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/media/i2c/ov5647.c | 69 ++++++++++++++++----------------------
>>   1 file changed, 29 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
>> index f0ca8cc14794..7f4541f46335 100644
>> --- a/drivers/media/i2c/ov5647.c
>> +++ b/drivers/media/i2c/ov5647.c
>> @@ -637,23 +637,29 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
>>        return 0;
>>   }
>>
>> -static int ov5647_stream_on(struct v4l2_subdev *sd)
>> +static int ov5647_enable_streams(struct v4l2_subdev *sd,
>> +                              struct v4l2_subdev_state *state, u32 pad,
>> +                              u64 streams_mask)
>>   {
>>        struct i2c_client *client = v4l2_get_subdevdata(sd);
>>        struct ov5647 *sensor = to_sensor(sd);
>>        u8 val = MIPI_CTRL00_BUS_IDLE;
>>        int ret = 0;
>>
>> +     ret = pm_runtime_resume_and_get(&client->dev);
>> +     if (ret < 0)
>> +             return ret;
>> +
>>        ret = ov5647_set_mode(sd);
>>        if (ret) {
>>                dev_err(&client->dev, "Failed to program sensor mode: %d\n", ret);
>> -             return ret;
>> +             goto err_rpm_put;
>>        }
>>
>>        /* Apply customized values from user when stream starts. */
>> -     ret =  v4l2_ctrl_handler_setup(sd->ctrl_handler);
>> +     ret = __v4l2_ctrl_handler_setup(sd->ctrl_handler);
>>        if (ret)
>> -             return ret;
>> +             goto err_rpm_put;
>>
>>        if (sensor->clock_ncont)
>>                val |= MIPI_CTRL00_CLOCK_LANE_GATE |
>> @@ -663,11 +669,18 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>>        cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
>>        cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);
>>
>> +err_rpm_put:
> I would name the label 'done' as it's also used in the normal exit path,
> not only in case of errors.
>
>> +     if (ret)
>> +             pm_runtime_put(&client->dev);
>> +
>>        return ret;
>>   }
>>
>> -static int ov5647_stream_off(struct v4l2_subdev *sd)
>> +static int ov5647_disable_streams(struct v4l2_subdev *sd,
>> +                               struct v4l2_subdev_state *state, u32 pad,
>> +                               u64 streams_mask)
>>   {
>> +     struct i2c_client *client = v4l2_get_subdevdata(sd);
>>        struct ov5647 *sensor = to_sensor(sd);
>>        int ret = 0;
>>
>> @@ -677,13 +690,15 @@ static int ov5647_stream_off(struct v4l2_subdev *sd)
>>        cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
>>        cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
>>
>> +     pm_runtime_put(&client->dev);
>> +
>>        return ret;
>>   }
>>
>>   static int ov5647_power_on(struct device *dev)
>>   {
>>        struct ov5647 *sensor = dev_get_drvdata(dev);
>> -     int ret;
>> +     int ret = 0;
>>
>>        dev_dbg(dev, "OV5647 power on\n");
>>
>> @@ -706,7 +721,11 @@ static int ov5647_power_on(struct device *dev)
>>        }
>>
>>        /* Stream off to coax lanes into LP-11 state. */
>> -     ret = ov5647_stream_off(&sensor->sd);
>> +     cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
>> +               MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
>> +               MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
>> +     cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
>> +     cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
> Could you please factor this code out to a separate function (you can
> name it ov5647_stream_stop() for instance) instead of duplicating it ?
>
> With that (and the 0 initialization of ret above dropped as it won't be
> needed anymore),
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Hi Laurent,

Thank you for the review and the suggestions.

I'll address both points in v3:

1. Rename the label from 'err_rpm_put' to 'done' since it's used for
    both error and normal exit paths.

2. Extract the duplicated stream stop code into a separate
    ov5647_stream_stop() function to eliminate code duplication between
    ov5647_disable_streams() and ov5647_power_on().

3. Remove the unnecessary ret = 0 initialization once the function
    is extracted.

Will send the updated patch shortly.

Best regards,
Xiaolei
>
>>        if (ret < 0) {
>>                dev_err(dev, "camera not available, check power\n");
>>                goto error_clk_disable;
>> @@ -803,40 +822,8 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
>>        return NULL;
>>   }
>>
>> -static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>> -{
>> -     struct i2c_client *client = v4l2_get_subdevdata(sd);
>> -     int ret;
>> -
>> -     if (enable) {
>> -             ret = pm_runtime_resume_and_get(&client->dev);
>> -             if (ret < 0)
>> -                     return ret;
>> -
>> -             ret = ov5647_stream_on(sd);
>> -             if (ret < 0) {
>> -                     dev_err(&client->dev, "stream start failed: %d\n", ret);
>> -                     goto error_pm;
>> -             }
>> -     } else {
>> -             ret = ov5647_stream_off(sd);
>> -             if (ret < 0) {
>> -                     dev_err(&client->dev, "stream stop failed: %d\n", ret);
>> -                     goto error_pm;
>> -             }
>> -             pm_runtime_put(&client->dev);
>> -     }
>> -
>> -     return 0;
>> -
>> -error_pm:
>> -     pm_runtime_put(&client->dev);
>> -
>> -     return ret;
>> -}
>> -
>>   static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
>> -     .s_stream =             ov5647_s_stream,
>> +     .s_stream = v4l2_subdev_s_stream_helper,
>>   };
>>
>>   static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
>> @@ -979,6 +966,8 @@ static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
>>        .set_fmt                = ov5647_set_pad_fmt,
>>        .get_fmt                = ov5647_get_pad_fmt,
>>        .get_selection          = ov5647_get_selection,
>> +     .enable_streams         = ov5647_enable_streams,
>> +     .disable_streams        = ov5647_disable_streams,
>>   };
>>
>>   static const struct v4l2_subdev_ops ov5647_subdev_ops = {
> --
> Regards,
>
> Laurent Pinchart

