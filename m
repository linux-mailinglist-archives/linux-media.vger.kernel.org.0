Return-Path: <linux-media+bounces-15701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A65944A48
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 13:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CBFDB22304
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 11:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78FF189B9A;
	Thu,  1 Aug 2024 11:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="TC/u3yXg"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1802.securemx.jp [210.130.202.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8260018452E;
	Thu,  1 Aug 2024 11:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722511468; cv=fail; b=VR7FJH7RK1HP7UmPFvBRchP8JCy1jHe/gHNVFn7iLoKJG49wG+xRzhHKAsqEJRlIKPQel8+oD744chxtPVRg+H86H/4SwbTHa/6L73D4fNONvw/3reqXzDZ1sal43/oi0+D8Icun+C+vVqmG7uMTTMWlNWoTze/8Zxp6OJuaxFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722511468; c=relaxed/simple;
	bh=lZ617JudNKsm6SIKdYA/3gsoMhbfOfBsQXQ+o12S8oo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h1UDKDgnwbsP43foxLzLE88f0mZBT1wFUQySk8750YTfiLh+Rq8tBCU7JPbE51w8qpw4yuz3r64Xao2FQhXFxByQWU2xcWs2ii50nlG7kgcPXmtULd+wXPmwlY+AfC8tvHfhIJeMfa6fbuwMQTqCTAFPCPb9asX78BVl3HsXbMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=TC/u3yXg; arc=fail smtp.client-ip=210.130.202.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1802) id 4719RsBX1337557; Thu, 1 Aug 2024 18:27:54 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key2.smx;t=1722504428;x=1723714028;bh=lZ617JudNKsm6SIKdYA/3gsoMhbfOfBsQXQ+o12
	S8oo=;b=TC/u3yXgzpozp9tIFOcdot37l7KocoN4vYgwJXkqgIbJOrdeT3Vdw/hvpDk+Zz1/aE2Y9
	wNoPrbBslzBEFGVHrKXlDB03O20TP1NtKo7lqGX6vbuJ5LEWwLauUsoY6SoBnvxsqoPxgySgaC5Ca
	n10aq94xIQRSSkt3e1T0miiSMhSBWM0JDu+bz+5/RhB1/QOCZui6ZGO5NMw72EWZvc+edAVlKC6MM
	hVUfzE8POAvxRg1ihwdQOVLbP42I6VBpTTYAwfNaulYKKEA5TO0ocTDHsdqiJWCMStAIQFk+QpOYZ
	MAWumtV1uqnftFKE3CjUQccovsksMBRivu7UhgHrKg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1801) id 4719R7C5678881; Thu, 1 Aug 2024 18:27:07 +0900
X-Iguazu-Qid: 2yAbQ60VR8a2I5eq7u
X-Iguazu-QSIG: v=2; s=0; t=1722504426; q=2yAbQ60VR8a2I5eq7u; m=0w/HRXDoJ0BWjftz22WsaUwqi4AJY1Nor3/EqyqXW/M=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1802) id 4719R5b23859932
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 18:27:05 +0900
X-SA-MID: 25984501
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+mD+6XRhwO1Agr6EgPkepeeP0xvK/Lpe48/gYZZkr3jTtMovk+iXpMvBrUAFQHVq2znAO/FKa/2O514vv4tuDBGrkXcJtSpohyeUYcws+o2iwwhZl4esfznY6+tmVcxrH5amR1uMVlR2mt/krgroe7Yf9afUqZz4pzzvhMkNu74zOOKh35Qy/xJ/e6J3Kf1D2A8gqD8m3hzM4VhnqBmjDj9c9SHNWihhrFjfUSkUoeNVVU6KyNsxA0vf0/kzEtRCMDLm72ktjhjcH4iTzR0u0tpHLhlzbUx7nWAkFvrRPYJhQg3fzH+PBOkXm/+HK4WaLGAN5gi7mLwYu/V4iV9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZ617JudNKsm6SIKdYA/3gsoMhbfOfBsQXQ+o12S8oo=;
 b=c40nkdBphfCFEVm/5IVIyLjbr4Prxuki/4lkWH7ec0askSFiJZi6TszyDNyk773uKm8WG/93c+nOD0KruKSJrIn0cn85YE+6aScsPM1AVKMTfoAPWoMb2GsIsd5EwG718Awukh8Sp0iX2gQkX+H13tFmaCTr/e/K1diAt9+LZsMsMnq+jvRZJ7+wqIdB0iXJrSWU47nwuopWZ/MnafF6RRIZEbEwFGCQjx8iuEATyxjlKsZ36U6K0zMQK8uLqpgFH+UHqCLy8x5Unk2GftKMVcgV5DuZ9EQCrTo7Rh/kF/Xzet83K7/EaPCIZD2GowFS1P/PjAOjfXKbgukf9BuGGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <laurent.pinchart@ideasonboard.com>
CC: <hverkuil@xs4all.nl>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <broonie@kernel.org>,
        <sakari.ailus@linux.intel.com>, <nobuhiro1.iwamatsu@toshiba.co.jp>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v11 1/6] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Thread-Topic: [PATCH v11 1/6] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Thread-Index: AQHa0ZRCzXNbfIVC40uZsULxqNi9HLIC8m+AgA9SmsA=
Date: Thu, 1 Aug 2024 09:21:57 +0000
X-TSB-HOP2: ON
Message-ID: 
 <OSZPR01MB942752CE5C7F4F3F2D8DC1AE92B22@OSZPR01MB9427.jpnprd01.prod.outlook.com>
References: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
 <20240709000848.1108788-2-yuji2.ishikawa@toshiba.co.jp>
 <20240722152117.GO13497@pendragon.ideasonboard.com>
In-Reply-To: <20240722152117.GO13497@pendragon.ideasonboard.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB9427:EE_|OS3PR01MB6545:EE_
x-ms-office365-filtering-correlation-id: 595dd20a-ffd0-4a73-0ad8-08dcb20b63fa
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?T1ZyQ2RLRS9raU5aMFN4UHNZS3B6eFZPaFo0NnBleno3TzVaMGNCVTBpUlFF?=
 =?utf-8?B?a2pFU3cwbjdzLzZQa0VZc3NtWVBTUlVRSXBmYmx3emFhQlJXL3ZIQm9Bdi9i?=
 =?utf-8?B?WFAyR1pRK1ZQcUtpWVNqT3JSR0QwUU5TUEZSQWhPa1JmTlo1eWN3Umx2MnU0?=
 =?utf-8?B?VFkyU3lZYXRORUhWV2JJVDNNblFNdTFqNWliekMxaEJHdmo1aE5HTExyUVVn?=
 =?utf-8?B?cGhhR2lkNzJPUGpSTi9IVWtqOGJGT1crTHhJRWhZWXpmbHh6UE1vTEU0R2I1?=
 =?utf-8?B?b2pKN1NkaEtCSnExQjBZTkFJTnVDYUkzK2hrdXk2NlE0MVVicEkxTVQyZ3ZS?=
 =?utf-8?B?NWtxdTJKVCt4dDZkQ2FVbkZrUUdMMFlad2lhT00xN3c5RFkvd05PWGp4OUJj?=
 =?utf-8?B?MlkydkFzVU9tdzEwOThxdjRYaTVmcXYzUXBKcGJIcDFUOGlmMk5mSGZmRS8w?=
 =?utf-8?B?SUwvK0lVMjVkYmhDKzZtOG5oVHVNaGh4a3VCM0VOYWZacHJ4bmtIZmZGMFRm?=
 =?utf-8?B?b3Y3dy9nS2liR0VleHlwRlFTcXUrei9McmtiZ1Z5c1pLdnlhK1gvclhtUjYz?=
 =?utf-8?B?dGJiOGNaZ3ZvR01DbHA2eGUyaWtuZytrdjlLak9ydmpQcEpWSkZZdHRaZkZ4?=
 =?utf-8?B?QjdDL1pkdCtkT2pMZnBld3hQeTR1b1lWTU1QNXlJOU1ST0h5a09lcWdZL2No?=
 =?utf-8?B?MWlrZDVodENqS01jK2wwcHVPc0hSdEVIampJdmNMNEVTMmJTNmpNTlArd1Zm?=
 =?utf-8?B?bm4rVThuQjhzTS91dGZnSVNtUjBHa1B2NlhrenBxS2k2VFVSdCswL2RSTlRJ?=
 =?utf-8?B?TW5QZlpnaFZZNVV5YUVKZS8rNG5OdkFWVjBKek1MZ1pyNDg0TXdBY3RrNUtO?=
 =?utf-8?B?NHRQV25CUjcrUnVheHpRRm9GbVdIc0JOMXJOa1hpdXAwZG5pRVdJMWpmLzVw?=
 =?utf-8?B?R1lPQlhaQ1ZOVmFnUVE0eWxJUUhHTFV0K29vVHJwMlBRQ09QMVFueWxmdDNq?=
 =?utf-8?B?T0FUeW5obFhHY0ppWisrTHBvVzJ5VE1MY2ZrdnU0MDBrSnhxOXZQaUtZMEFR?=
 =?utf-8?B?dm9jZGc3OFFPR1J3VjR0dzF3YWV2WTlRa2cyOXNQUUh5TmZpUmJHMUsxNHIx?=
 =?utf-8?B?ZDdqbnIxMWE0M0pSM1lHemNwUm4vNWRVL1J6VzhFSisxcU1EWTNMUEhveGYx?=
 =?utf-8?B?aG12UEQ1RGtja3B6d2Z4NkxZV3ZKV1V1blFpWVRzZkQ3MDRCTlR1TEdoMFpF?=
 =?utf-8?B?MU1CQVpidHA2OXFkZ29TZ1ZnWm5DeVM2TkloOElHc0N0bXB3RnhYZ0RmZUlp?=
 =?utf-8?B?Um41NmpkejBIV0E2VElKWitDQXVuaHN5OE0yU3QrZGVacmJVSGJTOWlhZXh5?=
 =?utf-8?B?TS9BTm9sdm9udG81OEJic3BUSHcvT3VwWENNblArWXF3WHJVaDZXVElnaVQw?=
 =?utf-8?B?eERHbW52aXNrZEdvWk5CaWlkNmF1NUU0MnNpbTJaY1pmWUUzMHd4MmFEN1U5?=
 =?utf-8?B?Y0g1TWs3czFCZ0ZBalVQZmNkamZMRnpjWjY4aHViSzV2dTc4TXVLUlJXd2Zw?=
 =?utf-8?B?UWhqbXlvMm1nb09lSlA0bXFubWpobHNpNUpISXpxNWs1R1V3bllSeUpkL3FB?=
 =?utf-8?B?Nk9jL2hVUWtxUUVQRXdybmc0U0ZwbHZsdDVnWTRFUHBkcUFIbklEWnRjb2pC?=
 =?utf-8?B?MGFBb2FJVFdwSVR4ZDVaaGFzbXl2NnNEeHcrc2JES2xXMk9KOU1jVkZZVGVL?=
 =?utf-8?B?SGhPamNVYldlNXhWVkVZeTNiNTJNK3hDMFVZU0ZwbitOaytvYStQdUZJZC9I?=
 =?utf-8?Q?GChuoBQwdDaKRbXEfoyeUS469B0N193o90b1Y=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB9427.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aFNNNkVHaUZMUjhMQUJ1S1AyMTlRMWRvMHM1QVY4S0FnUWk4eFpycHoremN6?=
 =?utf-8?B?d3o2YlNOVG4rbzd6NlZoVnFHYzZmSWx2eklpU3pzUWFjRXMzekZjbFBjREll?=
 =?utf-8?B?dXVla3RzaU1TRHNiMFJlU1hZWVRvTUFZYzVuK3pQdUdaNmQ1bThnOENpTDBZ?=
 =?utf-8?B?L29DcXZjMWxPNjNBakNoT2x2ZU9GMDJQL3o2OXM5WHVPVDI1bTNMdXlMSjBm?=
 =?utf-8?B?UXppQUtBT1ZmZDRNcTU4RUVjS0hFZVhHUkt6OWtrUHIrbVdLa0tDRERpSjFH?=
 =?utf-8?B?UnZoRHFHbnNqcE1HeVR1ZXQxWW9zczhFWDFEV1NmczllZit5SEpvazYwSldI?=
 =?utf-8?B?N1I2L2FhUjI0MTNweEcwcGxXc1VCS0hhR0Q0VGFOMEVHWTRqMDliY0lXdWls?=
 =?utf-8?B?VURocXNSaUZuY093a3VzZ21OWUJxSlk4RXlDZHdWUU9VcDZjeEYzdlVnVXpF?=
 =?utf-8?B?Q2NnTkh6NUpGV1h3ejl1QnZFV1FhVmtuQlpGSFlkRXZISVhqdjMzYzJ6cGI5?=
 =?utf-8?B?QjJRN0ltZEpqeStxYnF0QTZLdmhJWk5GUUUraXd0UFNrWHVrUVgzeGZvMFVm?=
 =?utf-8?B?clBVaGF2YUtjSFpkTE9WRXc0eDQ0aDJaeWlxQlhseUorbS9pL0cxamxEMUJ5?=
 =?utf-8?B?dHU0aFBuNkJNUlJIbCs3eUQ1SjFRMlBTbE5DOFg4c0Erbi8rQjR0NFBYVlFn?=
 =?utf-8?B?U0FQcnFSQ29WSTRHVE1XOE4rRHBmRnN5THRRYmhGM3ZWR3gyK2RFLy9sZkVn?=
 =?utf-8?B?ZG84dnRLMjBWZkVVR3k1eDhMbGVTWU0ycUc1MmZSZzRqRDA3YTYyK1hwamVK?=
 =?utf-8?B?TWRvYlo4bWRCQUduTHRYaVN5VHcva0kvZENVSEMzU3JMc3lKYVhKYTdGOTZ3?=
 =?utf-8?B?TGtsc1pjUnI5WmRNSVUwNUpFaWQ0U2MxNlkwcmkrZ1dvQkJIZUhET0x0MTNN?=
 =?utf-8?B?ZU43RS9odmlzUkYraFY0MStzazRsZWNZNEpYcjg4aTRmN1BrUjVDdXVDYzhJ?=
 =?utf-8?B?RHgvUFZsTzRib1JVWktTUEtzYXJPOURKNFR4WGEwV1E3YkNSeDBOekRHVkFk?=
 =?utf-8?B?WlZqSko4NmxOMDgxM1lhVnU1RExMSGI4YVd5UlB4ZXZSU2VDVHpEVWEzemxS?=
 =?utf-8?B?MjI0VDU4RktpMkdFRktBbjJFYXlBaWpwMGtEMGVJQmMxMFJRTFJHRlYwZmJO?=
 =?utf-8?B?V3N6TnBkUUtKaXR2V1Z6MnF4NWZ1MVF1ZUVMM3dNUTJhaWhyRXNiN0FRUEtH?=
 =?utf-8?B?V0VQTkF2ZHhMYUUyZEcweXBiZmpWaEYyeVlXUjdhVFVNZmhZMUQ3U0wyWFVV?=
 =?utf-8?B?RkVOdXBrZEFYcytQaTRqY0VzQmlBMm55bjdESFAxR1g2QzRxTGNpalg1aHVE?=
 =?utf-8?B?a2NJS3o3Qjh6VHdtS3Nqc3B3c1hYY0NWanpVNVhnWVRWK1NPcFhmdjZDVE9S?=
 =?utf-8?B?bm9yRkFJOHNUcmlhR1UzamF0UjRGdUhlYzhaNzlSaGFuRk84dkVTeDdiVWdB?=
 =?utf-8?B?SlExRlJLaEo2K2JUZmdYdkozWjRaUXpEMG5kbVhmOVFpQ1RkYVV4SGJ2V05Y?=
 =?utf-8?B?WjhtUC9rbDJKUktxSmFDM1dEcVdreG9nV0IvSVhOOWhobVZ3U0gycnNXRmhB?=
 =?utf-8?B?ekVXN1hEcGs4OGd5OVk2ekhQQ3JFZGU0dGJXZ3dKcmpEUGpsOW1LNnNXc0lN?=
 =?utf-8?B?K1NWVzBIc3pRRUovYTRTTWQ2RkJJc2VFRW5leVdBM01nZ0lwTmkwVm1vNXEx?=
 =?utf-8?B?SkRiN2FERVpCeFZuRjRTTE9wSTRNOFBQNDBoK2w2Z2hUVmJ3Uy9kUEJ2SklF?=
 =?utf-8?B?cEdrNVdYY3JzYWZ1cG8xMU0vOG82OFF2bnRLRDlYN0lWMmE3SGMwdzRTRkpZ?=
 =?utf-8?B?Rm9JK1R4bXhCU3VoRG1JVi9HUWJ2VUlOcFhVK2NOU2lQUllCQ2gwaXVsYjIw?=
 =?utf-8?B?US9pcEh5K2dOak8rdjIrRmVpcFJrTzVKVHdlbU1uRlJ1cHFFT3dPT0JyeW5M?=
 =?utf-8?B?R3NzRktURjUxSFlUVW83NUlqRU0wbUJoZkxPanZPT2RGZWNpYlhOTHBJYVNn?=
 =?utf-8?B?cEkyeGF5dlpFeVlrQjBDN0V5MWFXR0JVU2hxVHZuaHhFa21iME9LbVdPUUpX?=
 =?utf-8?B?dm1SUWwzbXFseFE2VjlTZWhjcGpYUGpwTlMxSzZrK2Iya0t1ZkJYMUVZNHBr?=
 =?utf-8?B?Unc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB9427.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595dd20a-ffd0-4a73-0ad8-08dcb20b63fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 09:21:57.1227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eqxP8L60Sg/ut9LyqbHF6P59E9oU0ru4m0ohYsX/l+1sfvBm1I2mUZ+i/jJtSzlkMNzbqF/MTinnAcOAEQqgljk66F/v6EOYp7x4ubvlxow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6545

SGVsbG8gTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMjMsIDIwMjQg
MTI6MjEgQU0NCj4gVG86IGlzaGlrYXdhIHl1amko55+z5bedIOaCoOWPuCDil4vvvLLvvKTvvKPi
lqHvvKHvvKnvvLTvvKPil4vvvKXvvKHplospDQo+IDx5dWppMi5pc2hpa2F3YUB0b3NoaWJhLmNv
LmpwPg0KPiBDYzogSGFucyBWZXJrdWlsIDxodmVya3VpbEB4czRhbGwubmw+OyBNYXVybyBDYXJ2
YWxobyBDaGVoYWINCj4gPG1jaGVoYWJAa2VybmVsLm9yZz47IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBD
b25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBNYXJrIEJyb3duDQo+IDxicm9vbmll
QGtlcm5lbC5vcmc+OyBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+
OyBpd2FtYXRzdQ0KPiBub2J1aGlybyjlsqnmnb4g5L+h5rSLIOKXi++8pO+8qe+8tO+8o+KWoe+8
pO+8qe+8tOKXi++8r++8s++8tCkNCj4gPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3NoaWJhLmNvLmpw
PjsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnp5c3p0b2Yua296
bG93c2tpQGxpbmFyby5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjExIDEvNl0gZHQtYmlu
ZGluZ3M6IG1lZGlhOiBwbGF0Zm9ybTogdmlzY29udGk6IEFkZA0KPiBUb3NoaWJhIFZpc2NvbnRp
IFZpZGVvIElucHV0IEludGVyZmFjZQ0KPiANCj4gSGVsbG8gSXNoaWthd2Etc2FuLA0KPiANCj4g
VGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBUdWUsIEp1bCAwOSwgMjAyNCBhdCAw
OTowODo0M0FNICswOTAwLCBZdWppIElzaGlrYXdhIHdyb3RlOg0KPiA+IEFkZHMgdGhlIERldmlj
ZSBUcmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiB0aGF0IGFsbG93cyB0byBkZXNjcmliZSB0aGUN
Cj4gPiBWaWRlbyBJbnB1dCBJbnRlcmZhY2UgZm91bmQgaW4gVG9zaGliYSBWaXNjb250aSBTb0Nz
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWXVqaSBJc2hpa2F3YSA8eXVqaTIuaXNoaWthd2FA
dG9zaGliYS5jby5qcD4NCj4gPiBSZXZpZXdlZC1ieTogTm9idWhpcm8gSXdhbWF0c3UgPG5vYnVo
aXJvMS5pd2FtYXRzdUB0b3NoaWJhLmNvLmpwPg0KPiA+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+ID4gLS0tDQo+ID4g
Q2hhbmdlbG9nIHYyOg0KPiA+IC0gbm8gY2hhbmdlDQo+ID4NCj4gPiBDaGFuZ2Vsb2cgdjM6DQo+
ID4gLSBubyBjaGFuZ2UNCj4gPg0KPiA+IENoYW5nZWxvZyB2NDoNCj4gPiAtIGZpeCBzdHlsZSBw
cm9ibGVtcyBhdCB0aGUgdjMgcGF0Y2gNCj4gPiAtIHJlbW92ZSAiaW5kZXgiIG1lbWJlcg0KPiA+
IC0gdXBkYXRlIGV4YW1wbGUNCj4gPg0KPiA+IENoYW5nZWxvZyB2NToNCj4gPiAtIG5vIGNoYW5n
ZQ0KPiA+DQo+ID4gQ2hhbmdlbG9nIHY2Og0KPiA+IC0gYWRkIHJlZ2lzdGVyIGRlZmluaXRpb24g
b2YgQlVTLUlGIGFuZCBNUFUNCj4gPg0KPiA+IENoYW5nZWxvZyB2NzoNCj4gPiAtIHJlbW92ZSB0
cmFpbGluZyAiYmluZGluZ3MiIGZyb20gY29tbWl0IGhlYWRlciBtZXNzYWdlDQo+ID4gLSByZW1v
dmUgdHJhaWxpbmcgIkRldmljZSBUcmVlIEJpbmRpbmdzIiBmcm9tIHRpdGxlDQo+ID4gLSBmaXgg
dGV4dCB3cmFwcGluZyBvZiBkZXNjcmlwdGlvbg0KPiA+IC0gY2hhbmdlIGNvbXBhdGlibGUgdG8g
dmlzY29udGk1LXZpaWYNCj4gPiAtIGV4cGxpY2l0bHkgZGVmaW5lIGFsbG93ZWQgcHJvcGVydGll
cyBmb3IgcG9ydDo6ZW5kcG9pbnQNCj4gPg0KPiA+IENoYW5nZWxvZyB2ODoNCj4gPiAtIFN1Z2dl
c3Rpb24gZnJvbSBLcnp5c3p0b2YgS296bG93c2tpDQo+ID4gICAtIHJlbmFtZSBiaW5kaW5ncyBk
ZXNjcmlwdGlvbiBmaWxlDQo+ID4gICAtIHVzZSBibG9jayBzdHlsZSBhcnJheSBpbnN0ZWFkIG9m
IGlubGluZSBzdHlsZQ0KPiA+ICAgLSByZW1vdmUgY2xvY2stbGFuZSAoYXMgaXQgaXMgZml4ZWQg
YXQgcG9zaXRpb24gMCkNCj4gPiAgIC0gdXBkYXRlIHNhbXBsZSBub2RlJ3MgbmFtZQ0KPiA+ICAg
LSB1c2UgbG93ZXJjYXNlIGhleCBmb3IgbGl0ZXJhbHMNCj4gPiAtIFN1Z2dlc3Rpb24gZnJvbSBM
YXVyZW50IFBpbmNoYXJ0DQo+ID4gICAtIHVwZGF0ZSBkZXNjcmlwdGlvbiBtZXNzYWdlIHBvcnQ6
OmRlc2NyaXB0aW9uDQo+ID4gICAtIHJlbW92ZSBwb3J0OjplbmRwb2ludDo6YnVzLXR5cGUgYXMg
aXQgaXMgZml4ZWQgdG8gPDQ+DQo+ID4gICAtIHJlbW92ZSBwb3J0OjplbmRwb2ludDo6Y2xvY2st
bGFuZXMgZnJvbSBleGFtcGxlDQo+ID4gICAtIGFkZCBwb3J0OjplbmRwb2ludDo6ZGF0YS1sYW5l
cyB0byByZXF1aXJlZCBwYXJhbWV0ZXJzIGxpc3QNCj4gPiAgIC0gZml4IHNlcXVlbmNlIG9mIGRh
dGEtbGFuZXM6IDwxIDIgMyA0PiBiZWNhdXNlIGN1cnJlbnQgZHJpdmVyIGRvZXMgbm90DQo+IHN1
cHBvcnQgZGF0YSByZW9yZGVyaW5nDQo+ID4gICAtIHVwZGF0ZSBwb3J0OjplbmRwb2ludDo6ZGF0
YS1sYW5lczo6ZGVzY3JpcHRpb24NCj4gPiAgIC0gcmVtb3ZlIHJlZHVuZGFudCB0eXBlIGRlZmlu
aXRpb24gZm9yIHBvcnQ6OmVuZHBvaW50OjpkYXRhLWxhbmVzDQo+ID4NCj4gPiBDaGFuZ2Vsb2cg
djk6DQo+ID4gLSBwbGFjZSAicmVxdWlyZWQiIGFmdGVyICJwcm9wZXJ0aWVzIg0KPiA+IC0gZGlj
dGlvbmFyeSBvcmRlcmluZyBvZiBwcm9wZXJ0aWVzDQo+ID4NCj4gPiBDaGFuZ2Vsb2cgdjEwOg0K
PiA+IC0gbm8gY2hhbmdlDQo+ID4NCj4gPiBDaGFuZ2Vsb2cgdjExOg0KPiA+IC0gbm8gY2hhbmdl
DQo+ID4NCj4gPiAgLi4uL21lZGlhL3Rvc2hpYmEsdmlzY29udGk1LXZpaWYueWFtbCAgICAgICAg
IHwgMTA1DQo+ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTA1IGlu
c2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3Rvc2hpYmEsdmlzY29udGk1LXZpaWYueWFtbA0KPiA+
DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL3Rvc2hpYmEsdmlzY29udGk1LXZpaWYueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3Rvc2hpYmEsdmlzY29udGk1LXZpaWYueWFtbA0KPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMC4uOTdlOGJkYTQyNw0K
PiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvdG9zaGliYSx2aXNjb250aTUtdmlpZi55DQo+ID4gKysrIGFtbA0KPiA+IEBA
IC0wLDAgKzEsMTA1IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvdG9zaGliYSx2aXNjb250aTUtdmlpZi55
YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBUb3NoaWJhIFZpc2NvbnRpNSBTb0MgVmlkZW8g
SW5wdXQgSW50ZXJmYWNlDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIE5vYnVo
aXJvIEl3YW1hdHN1IDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGliYS5jby5qcD4NCj4gPiArDQo+
ID4gK2Rlc2NyaXB0aW9uOiB8LQ0KPiA+ICsgIFRvc2hpYmEgVmlzY29udGk1IFNvQyBWaWRlbyBJ
bnB1dCBJbnRlcmZhY2UgKFZJSUYpIHJlY2VpdmVzIE1JUEkNCj4gPiArQ1NJMiB2aWRlbw0KPiA+
ICsgIHN0cmVhbSwgcHJvY2Vzc2VzIHRoZSBzdHJlYW0gd2l0aCBpbWFnZSBzaWduYWwgcHJvY2Vz
c29ycyAoTDFJU1AsDQo+ID4gK0wySVNQKSwNCj4gPiArICB0aGVuIHN0b3JlcyBwaWN0dXJlcyB0
byBtYWluIG1lbW9yeS4NCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJs
ZToNCj4gPiArICAgIGNvbnN0OiB0b3NoaWJhLHZpc2NvbnRpNS12aWlmDQo+ID4gKw0KPiA+ICsg
IHJlZzoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBSZWdpc3Rl
cnMgZm9yIGNhcHR1cmUgY29udHJvbA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBSZWdpc3Rl
cnMgZm9yIENTSTIgcmVjZWl2ZXIgY29udHJvbA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBS
ZWdpc3RlcnMgZm9yIGJ1cyBpbnRlcmZhY2UgdW5pdCBjb250cm9sDQo+ID4gKyAgICAgIC0gZGVz
Y3JpcHRpb246IFJlZ2lzdGVycyBmb3IgTWVtb3J5IFByb3RlY3Rpb24gVW5pdA0KPiANCj4gSXMg
dGhpcyBwYXJ0IG9mIHRoZSBWSUlGLCBvciBzb21lIHNvcnQgb2YgbW9yZSBzdGFuZGFsb25lIElP
TU1VID8gSW4gdGhlIGxhdHRlcg0KPiBjYXNlLCBzaG91bGQgaXQgYmUgaGFuZGxlZCBieSBhIHNl
cGFyYXRlIGRyaXZlciA/DQo+IA0KDQpUaGUgTVBVIGRvZXMgbm90IGhhdmUgdGhlIGZ1bmN0aW9u
YWxpdHkgb2YgYSBnZW5lcmFsIHB1cnBvc2UgSU9NTVUgYXMgZGVzY3JpYmVkIGluIHRoZSBMaW51
eCBJT01NVSBmcmFtZXdvcmsuDQpJdCBqdXN0IGJsb2NrcyBWSUlGJ3MgbWVtb3J5IGFjY2Vzc2Vz
IHRvIHRoZSBzcGVjaWZpZWQgYWRkcmVzcyByYW5nZS4NCkJlY2F1c2UgaXQgaXMgY29uZmlndXJl
ZCB0byBibG9jayBhbGwgdGhlIGFjY2Vzc2VzIGJ5IGRlZmF1bHQsIEkgaGF2ZSB0byBzZXQgaXQg
dG8gYnktcGFzcyBtb2RlIGF0IGV2ZXJ5IHBvd2VyIGN5Y2xlLg0KDQo+ID4gKw0KPiA+ICsgIGlu
dGVycnVwdHM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogU3lu
YyBJbnRlcnJ1cHQNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogU3RhdHVzIChFcnJvcikgSW50
ZXJydXB0DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IENTSTIgUmVjZWl2ZXIgSW50ZXJydXB0
DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEwxSVNQIEludGVycnVwdA0KPiA+ICsNCj4gPiAr
ICBwb3J0Og0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvJGRlZnMvcG9ydC1i
YXNlDQo+ID4gKyAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKyAgICBkZXNj
cmlwdGlvbjogQ1NJLTIgaW5wdXQgcG9ydCwgd2l0aCBhIHNpbmdsZSBlbmRwb2ludCBjb25uZWN0
ZWQgdG8gdGhlDQo+IENTSS0yIHRyYW5zbWl0dGVyLg0KPiA+ICsNCj4gPiArICAgIHByb3BlcnRp
ZXM6DQo+ID4gKyAgICAgIGVuZHBvaW50Og0KPiA+ICsgICAgICAgICRyZWY6IHZpZGVvLWludGVy
ZmFjZXMueWFtbCMNCj4gPiArICAgICAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4g
PiArDQo+ID4gKyAgICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICAgIGRhdGEtbGFuZXM6
DQo+ID4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBWSUlGIHN1cHBvcnRzIDEsIDIsIDMgb3Ig
NCBkYXRhIGxhbmVzDQo+ID4gKyAgICAgICAgICAgIG1pbkl0ZW1zOiAxDQo+ID4gKyAgICAgICAg
ICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgICAgIC0gY29uc3Q6IDENCj4gPiArICAgICAgICAg
ICAgICAtIGNvbnN0OiAyDQo+ID4gKyAgICAgICAgICAgICAgLSBjb25zdDogMw0KPiA+ICsgICAg
ICAgICAgICAgIC0gY29uc3Q6IDQNCj4gPiArDQo+ID4gKyAgICAgICAgICBjbG9jay1ub25jb250
aW51b3VzOiB0cnVlDQo+ID4gKyAgICAgICAgICBsaW5rLWZyZXF1ZW5jaWVzOiB0cnVlDQo+ID4g
KyAgICAgICAgICByZW1vdGUtZW5kcG9pbnQ6IHRydWUNCj4gPiArDQo+ID4gKyAgICAgICAgcmVx
dWlyZWQ6DQo+ID4gKyAgICAgICAgICAtIGNsb2NrLW5vbmNvbnRpbnVvdXMNCj4gDQo+IERvZXMg
dGhlIGhhcmR3YXJlIHN1cHBvcnQgdGhlIG5vbi1jb250aW51b3VzIGNsb2NrIG1vZGUgb25seSwg
b3IgaXMgaXQNCj4gY29uZmlndXJhYmxlID8gVGhpcyBpcyBhIGJvb2xlYW4gcHJvcGVydHksIHNv
IGlmIGJvdGggbW9kZSBhcmUgc3VwcG9ydGVkLCB0aGUNCj4gcHJvcGVydHkgc2hvdWxkIG5vdCBi
ZSByZXF1aXJlZC4NCj4gDQoNClRoZSBoYXJkd2FyZSBzdXBwb3J0cyBib3RoIGNsb2NrIG1vZGUg
YW5kIHN3aXRjaGVzIHRoZW0gYXV0b21hdGljYWxseS4NClRoZXJlZm9yZSwgSSdsbCBkcm9wIHRo
aXMgcHJvcGVydHkuDQoNCj4gPiArICAgICAgICAgIC0gZGF0YS1sYW5lcw0KPiA+ICsgICAgICAg
ICAgLSBsaW5rLWZyZXF1ZW5jaWVzDQo+ID4gKyAgICAgICAgICAtIHJlbW90ZS1lbmRwb2ludA0K
PiA+ICsNCj4gPiArcmVxdWlyZWQ6DQo+ID4gKyAgLSBjb21wYXRpYmxlDQo+ID4gKyAgLSByZWcN
Cj4gPiArICAtIGludGVycnVwdHMNCj4gPiArICAtIHBvcnQNCj4gPiArDQo+ID4gK2FkZGl0aW9u
YWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+
ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdp
Yy5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVy
L2lycS5oPg0KPiA+ICsNCj4gPiArICAgIHNvYyB7DQo+ID4gKyAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8Mj47DQo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4gKw0KPiA+ICsg
ICAgICAgIHZpZGVvQDFjMDAwMDAwIHsNCj4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ0
b3NoaWJhLHZpc2NvbnRpNS12aWlmIjsNCj4gPiArICAgICAgICAgICAgcmVnID0gPDAgMHgxYzAw
MDAwMCAwIDB4NjAwMD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgIDwwIDB4MWMwMDgwMDAgMCAw
eDQwMD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgIDwwIDB4MWMwMGUwMDAgMCAweDEwMDA+LA0K
PiA+ICsgICAgICAgICAgICAgICAgICA8MCAweDI0MTdhMDAwIDAgMHgxMDAwPjsNCj4gPiArICAg
ICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDY0IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgNjcgSVJRX1RZUEVfTEVWRUxf
SElHSD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICA8R0lDX1NQSSA3MyBJUlFfVFlQ
RV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDc2
IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgcG9ydCB7DQo+
ID4gKyAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAg
ICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgIGNz
aV9pbjA6IGVuZHBvaW50IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICBjbG9jay1ub25jb250
aW51b3VzOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGRhdGEtbGFuZXMgPSA8MSAyPjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICBsaW5rLWZyZXF1ZW5jaWVzID0gL2JpdHMvIDY0IDw0NTYw
MDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmaW14
MjE5X291dDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICAgICAgfTsN
Cj4gPiArICAgICAgICB9Ow0KPiA+ICsgICAgfTsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0K
PiBMYXVyZW50IFBpbmNoYXJ0DQoNClJlZ2FyZHMsDQpZdWppIElzaGlrYXdhDQo=


