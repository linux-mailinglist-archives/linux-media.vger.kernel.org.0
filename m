Return-Path: <linux-media+bounces-35928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AD2AE969A
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 09:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 323281C26742
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 07:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D020D239E9F;
	Thu, 26 Jun 2025 07:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="CZmtGpmE"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2087.outbound.protection.outlook.com [40.107.212.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC08219E0;
	Thu, 26 Jun 2025 07:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750921757; cv=fail; b=bIqlnMyZab/kZMHobgJh5dPHnqrfX76t+qMsAMRR3XVI+apiQkgVq0z1CbFicY+iYqdAJQ7MOOv4QAdx2eIvSiTXN6iXC4Hf3U1wFsEmxJWroN4iR9vfGAERx3qqUxH3aUYYSNCwMoKroOwG1keVHZPybLsO+mL50s9dznAVaSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750921757; c=relaxed/simple;
	bh=ELlZwaR5XzX90Udujr0S9nFej8Dp66h4ONlHoh2Nm/I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ihYhVoMkAG3Bp+fRtdVXkOeVnYj9FdLcP4WaV+8TzORsM+xIdZx1NQXK4bedTptcaBTH4UuGmdNx/a6+/kXuzmffZFlSq1aEb6B/a40llSPTvl89/fz1kv6ByImq9Xg4YN/I9wy1kxYVcDgLdNDnrpRZ/x4KOAXQhoBQ4kGDv3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=CZmtGpmE; arc=fail smtp.client-ip=40.107.212.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/PRxP8gGN8E6F8W85GC5PJp1fKhvIH+Ufk+daSK1MY3+dKz2iwjqGg4WEE9SsaNBPRKe/8EZ0HqK5n2Fce59c2JiH9ChfFL/bITUdIo2Mj87yfGyuAcffkWmkx7+82fTLmDEWXCmArFckKb+5saJ8ISRn/IMizSz2RDxmTF4McBSio31FcE+DkoIJTBy8fdTT/UNjLsluKfeM5Qjlh9t3AjbPd6lLCXC0o3HPNsFqYlhxL1Pcc6QWqE6JX6qj+gX9BwXPmybbvdAQnJuDxf5wcVzmzs2v48mbi6VKW9c+l8mh6M0MOI0Ky8KwtQ/opHDVvxi5mt1uA1DubjphZeXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELlZwaR5XzX90Udujr0S9nFej8Dp66h4ONlHoh2Nm/I=;
 b=vT11GB1hCDyA3GZwXOSspZJobSV3kakoCc7YXenXi6thaJ/az8Cvpc73UkDmqXqCnpEhrUhTeWou49fIMOE/7HGtn2IMwlbqtttQqQmbXJXlIMmPN461+yf3AIDdsvgTr/cAGr9mpt4tTXoNxQqHLmgE+WvE5o14GQH+zeVf6xEGcYnd/sPyiCLrWcNyxwby7BLfdXPBpSGYk3ke5Cs0u5T1E+jHUIecQ43OEioleXQSvcI9F1rrkjs6bO3vJkvW2TENlbuUyySVgDVAnAbk79GQh/T73x543Lh2Zspb4aCLYnceOazpQm9QhUi9fKEqwU9UN+7q0UqK4kHffB1d6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELlZwaR5XzX90Udujr0S9nFej8Dp66h4ONlHoh2Nm/I=;
 b=CZmtGpmEoRycuQtttrOSzy/G+Ww36xHR5nSKSMWUP7EUaeDK7cp3bwBITzHNc8VMli7IBEQ7g9J5gKYVdGZLovtDgpiCeok23cNU3mX2wgOIjbKndrenzTzXrHnT16XNkEPButBkGeNF6aPzBf9fQf/4TPf5eiKk8nw4jUmyk3MH3c3+/2hq0tAnTV5YNDSxeQhbcwrpANQbsnyyy6+/LckCCEAP5WZ3aCLXTnLFkTEouTGiV4r984CEAXRKvDeoG03udGvE8hVmVlHpMk9/zdJMCpkEeLFWc56QkGCxz087WT7/6CFHJLVRdnu31/TwAOgfj64zBpGehX33lpzAlg==
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS0PR11MB8688.namprd11.prod.outlook.com (2603:10b6:8:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 07:09:07 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%3]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 07:09:07 +0000
From: <Shravan.Chippa@microchip.com>
To: <kieran.bingham@ideasonboard.com>, <mchehab@kernel.org>,
	<sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Conor.Dooley@microchip.com>, <Valentina.FernandezAlanis@microchip.com>,
	<Praveen.Kumar@microchip.com>
Subject: RE: [PATCH] media: i2c: imx334: add support for additional test
 patterns
Thread-Topic: [PATCH] media: i2c: imx334: add support for additional test
 patterns
Thread-Index: AQHb5NTnVJMBYbR5w0CiXfqPGc3Wn7QSEzIAgAL0d+A=
Date: Thu, 26 Jun 2025 07:09:07 +0000
Message-ID:
 <PH0PR11MB561123C9612EF7E82A0530E5817AA@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20250624065438.2021044-1-shravan.chippa@microchip.com>
 <175075906452.3871677.12511426007175753529@ping.linuxembedded.co.uk>
In-Reply-To:
 <175075906452.3871677.12511426007175753529@ping.linuxembedded.co.uk>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|DS0PR11MB8688:EE_
x-ms-office365-filtering-correlation-id: 9d178c3d-a560-4034-b279-08ddb48057b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bThFYURTWHlyNk0xMUNEemZFSDlzMm8zS2hCdUExMnZUa00zSmlLZWR2UXVQ?=
 =?utf-8?B?WHlZb1BnRm5UanY3NWFPbXlyTW9yRWxrYnpJYnpkQ01TUGFWOS9RWlVrYUoz?=
 =?utf-8?B?amxNcmZuSTcwZTVZL3dReWFqY1c1SjhCclcxOE1WQm9NcW5QdjRLNnYzbExW?=
 =?utf-8?B?VHhYc2VNR0VkK3JhZXJKS1ZoZU8zOGcwbEg3eXRnWnRLbXZ5Tnh0RC9CeWc3?=
 =?utf-8?B?L1N1bURObnRVTElWbFJsNHU2eFk0L2hZTERKYUhhY01oUEx0OXU4UGV4SUg1?=
 =?utf-8?B?RXhiSnRQNGZnSXJKQyt4MjF1KzRxZnVFSHdGRHNRUVRJNUZQLzJMVzliNDMv?=
 =?utf-8?B?STdtcUlySEJrR3Jsc1lUdnJuK1NxcEJic29KVEtYTUxGNWgxZXJyRTh1emxP?=
 =?utf-8?B?dE5sSTZXYXZXZGErUTQybHRVZHdCb0RLY3dsWnFSQ2p5eDFHZ3dBeWtKcTV6?=
 =?utf-8?B?aXFZYnFsaXMySU1iNElOdzFIbzdEQ0NuR0JXSDRaVlcwTFRCZDlnTzBrUFBT?=
 =?utf-8?B?S0VlTlVqL2E4MW5KYWxGYURHak9FQXpQRWNBL1pqT0VCc3Izb3ZzRFhOSTlF?=
 =?utf-8?B?NlFKR2F1eW9qV3lESURybTF3OWd1RWZSai93YkEzck4xMUZXd1R4N1laampD?=
 =?utf-8?B?Q0lCSWVtTmhVS2txaGMwcUJUcjNqb0xnRHIzY1RMcDgrYmxLZ0F5UExUb0l1?=
 =?utf-8?B?Vy9ZQlkrSTJ4ZmZxY2VRdFZWZFd0cDRwS044b2xvWTlJNnVZcXlFRkxyNkVK?=
 =?utf-8?B?V3FuWnJjd0dsNjVvZVdUeFNvRVhSdUtqbVhVZmRrRUh4cHVWRCs2cW5sOXhj?=
 =?utf-8?B?YkQyVUNnM2pCU2JaSzFSaUdmSDZtMWV4bk9hWW5Oa2s3cWJCRmxpV1RxUWg2?=
 =?utf-8?B?ZzUrSUZmOFlKeDhlODJWb0hlcnVyTnJKUTFROG96SlRqNXY0UUVpVWh3a2Jw?=
 =?utf-8?B?OVlwUXUvSFRCQmdxb3VNbUFMMjVsc2Q2cG9CeHdTNDV1dVJJMHBhbTJVTFZi?=
 =?utf-8?B?Z2M2VDU2dFQ1bnpUSXZBZ0F4b1phdG9UcCtmTW5SWXNaVFkvUW1FS203MnlX?=
 =?utf-8?B?VEE2U0ozN2V4Rjk3TmVHUXJ1SUFTZmJTL0hnWEFaTDl0LzU3d2ttQUhsTDdu?=
 =?utf-8?B?U0QyQ2xJdHhXUGpQcUUyaFB3K0JWbVJhd1hPWE9QYm5aNVZvWUVwaHA3Lzkr?=
 =?utf-8?B?TUo2YnlYTkNSbnl2MmhxWi9sWUVOc0haZkM5eGt3WFBPSG5MNUZyRUYvSTJr?=
 =?utf-8?B?ZktIMkpSaTU0OUs0NlczNjVkdHdwK0NSWWk2OU8zVFVIWTBST1JaQmZTZUxK?=
 =?utf-8?B?MXREVzVYTGRjNjIyS2x4RFFOSGVJamo0dUJDZm42UXA1QktsbjJMSmZnMGs5?=
 =?utf-8?B?cFFTK2Z1WVArZnJONVF3Z2pNa1l4NFR0Tlk5UVVVSm1JdHF4UHVZNStWZUNk?=
 =?utf-8?B?NFhxQ2JwWXo2Tnk4WXdCRzgvUlRxS1hPY3dwellOOVZmbzd0UE5uUFkyMlpu?=
 =?utf-8?B?Ynp1eDJxNUw5RVY1am0wclA0N2VUYkZtTWxjckExalQ5TitKa2VId1BsVDdm?=
 =?utf-8?B?b0l1Rk85L2pUYWRLOWhOMVpGVFVuZUg0OHIzVVhwYnlnS0YvMnJzYnUzUzk4?=
 =?utf-8?B?R2VDbDVuWFNJYWRidlVMNmYvcm1rK2NoNkM3SWZlM2xYK1hIZjBjUDIyaExj?=
 =?utf-8?B?dFRidmdUdVVQUm9qNks3QTVHWWRJeGs0cUFqRkpxblVHR0xSRWtSU3B3MUpj?=
 =?utf-8?B?eEh5ajlYSG40QUYvTC9VdUZnMG9wbnUxVU9uSDJaWkZZVEVsNW91L01mRXgr?=
 =?utf-8?B?R3FNbWdDNElkOVFKYncyMHF0ZXdBVUt0TDVuYktiVVNITVhxWnRyV0lyNWZR?=
 =?utf-8?B?NzBJakMyOUQvb0tUWDFhMkZmNmtaRmNiYjZWNEsrRGIwUFJtcnpZT2IraXdt?=
 =?utf-8?B?TjQ1SGRGVHRraHJvdWtKUFo5MFV5RnZ0YThMZVFNL1RjSHQ3NjRHMFlqQldx?=
 =?utf-8?B?QjVVSGx3TllRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QkIyYjB5MnMyTkgyRitvSHJhNjJnbm9rY3U0cEt1UHFHalpPcjFUVzdjYkE5?=
 =?utf-8?B?Y1RlZ3hKZGFVVktLUzJ4WEhiUVpPbXR3RDk4TzUwOTZTWGVtYzBPelM3a052?=
 =?utf-8?B?Z0RaT0JoTHFucDEvMjhxVitNd2ZReDc4QjIrUzg4azl0eitBWCsySTkwTXl6?=
 =?utf-8?B?Z3Zha1p5SldwVjUxcGtIdi9nL3kzOUo3UVNRRWxQejA4T1pGSVpIdWFzOWwz?=
 =?utf-8?B?SjljVWhsUzM4c3V0K0lTRklqRlRRazFQeHJEZE5YV21RTDFrT090bEp6U3ZN?=
 =?utf-8?B?NGx1bGJnbHBtR2NIOWtEbmdoZ0tmYVdRc3lqN3N0S08wOU0xbFV3OTVXT2l2?=
 =?utf-8?B?UTJIWmdKMk5KVHlBNTNjTmVTNlRITU1kU0NHRlR4aFczT0tzSFVZa3ZYaEFR?=
 =?utf-8?B?L3kzMDJZaEZ5SnB2R0tiTitBZEJ0WVIyMTVQZVRtTDRsMzVaMzgrY29RS1pQ?=
 =?utf-8?B?Ynd6RldtK2l0a1dKcDNwNjk1L1VEbUF1c2hIWlVYNzE5U0dXZzIvcmQ2UW9Z?=
 =?utf-8?B?STZyeWtRK3hVN0N6SzN2d0xCMXVyKzRzZUpUQkVCZlN0UFpOOFY0aTlqUUs3?=
 =?utf-8?B?dWpCcXZxMDRqaUFkakRZOVNxOHJBSTZyYVRDdnpqMVBCcEg0cUU4RC8vcFBH?=
 =?utf-8?B?SEhRUkRHMzlsaURZL3VuVDlsZVRLSzlRZ1VOSTRNMjFTUm5IT1Y0M0ZaeG92?=
 =?utf-8?B?Y1hyKzVyTVFsa1hGSFFpRkdjNVlwOW1lNC8reHpaMVlhdU9mQnRNaGo2WDYx?=
 =?utf-8?B?K2lQRkRKVEV4WDRSQXczWTF2MjV4WHdjYVNrcENMdUcvVWJhdXp2OHh4czVu?=
 =?utf-8?B?OFRON01XYUwzcVpJbWtzNlR1OEY3RzBIdXZjQkJ0NU1QcUNNb09vaGpYakl5?=
 =?utf-8?B?dSs2RVhVRnltaUJ1QWUyVll1SXIybG1wanVzN1RxcG9GNjVEVUZneU9iM0VV?=
 =?utf-8?B?WDhRanBrTHE0NGdjUUVmajZMNFRLRFpFczgwTEErYThKRGpJWFdYb05iWG9O?=
 =?utf-8?B?V3JzZHdWU3l3YmljTk5aTnphbXJneFBGU2ljT0pJeDQzVG5NUnRhdUdRenpx?=
 =?utf-8?B?Zmptb0tWYzdyRGVEanoxamlkSXp4S0hzZXFWTlNjb3JzckduY3VUUGpDZ3Bt?=
 =?utf-8?B?MHpBQnk0alVFMzFlUWpNeHc1SjQ1SEc4RnZWZGROT0VZNFhLeW9keldZU09l?=
 =?utf-8?B?UVhJVVhSK3pqUjFHem1heE83TmcyeXozM2V5S2dTWjNXaU1UOTJYTUhUV1No?=
 =?utf-8?B?ay9zSEJQYlVvN3VmMkF4aEhTODFnaDkxaERLNFl1WlNzRXEyUDY4VmxJNWdk?=
 =?utf-8?B?YUg0V0E2Zi8vU3lLdlhSRWFlN3FqY3pnYkVwZFZMNzR1NFM0aXRFb3ZOYnEw?=
 =?utf-8?B?VW0zZEhsUGtIRk5OS252ZUFCanRQSVcyVEZRNzg2a1JpbWhtZEV2VllhZW1w?=
 =?utf-8?B?SXN1aTZ2YUNrNFZiRGlDbVZFYXN5OWxIcU1yR0R2U090WjVKVWRKWlNrWVpn?=
 =?utf-8?B?Ujc5d3J5NnFUek5qak1nYk9KcjRqQ2MyRkFCeUwxUkl0eVhJVHRIOXVOQ3ZD?=
 =?utf-8?B?MEVveXc5QzJYR3ZaYjhaNWVMamd5eEdYRVNSWEl4Sit0TGFUV2d1Q2R6QVlB?=
 =?utf-8?B?TjlrMFhXWWhUajNBLy9yTmp1T2NwRnpiTjNqZ21zUWpDR0RZUm0zMXU5eGxv?=
 =?utf-8?B?NEdiNHdZSmpZZDB3Wkg5YWVoSlpVb3FsM0xmZzR2aDhHMXpzMGpjY2Z5c2tT?=
 =?utf-8?B?cElaVjFIeDdGY3FMdGt2bUN4RGRWc2dlWnZLaU54UzJzSTZCUUlCNTQ4ckI5?=
 =?utf-8?B?UXZlNW9NRE1weGhhOWJLZ2prR1dFbW42RkppWlVaMHk0ZWlKekxGUjJ3QURa?=
 =?utf-8?B?TCtaeHcwWWJiRkZKWlFHckg0akxvTjBPbFJWNW80b09XaFlMZG5tb2tNQTgr?=
 =?utf-8?B?UW1PbmxEelBUWkNqTGt6c0pUYWdnS0hIbXphZHc0QzF2RG5yTGV3UjRqb1Va?=
 =?utf-8?B?Mklrd0VSRDI0NU41RjBLcDlHOVkvWW1ob3FUTmI1Z2EwUjJQTElDVVhYcnBn?=
 =?utf-8?B?RW1HVzQzUHZ3VWJiZXJEc05lejRHalZWVTNqUmFwSDJSRmVuNGR5QVFRRjY1?=
 =?utf-8?B?QW9xbVp4aTVNdWpGcUZMVlJuY1V3QUUvRmRvaG5NUnlneGdrQlBEbHJyVUNm?=
 =?utf-8?B?dXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d178c3d-a560-4034-b279-08ddb48057b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 07:09:07.6426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f8A7GTlAGWDTX4Guh9oNOF/Ykzf0lqjhhPtv4d+6fBRzEvXjzoXvN5rEtVCAQLVt3ixwaLqiKBtpmPvXCv2Nvl08/x5iLWDYGVZlMGFXSe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8688

SGkgS2llcmFuLA0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2ll
cmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtQGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IFR1
ZXNkYXksIEp1bmUgMjQsIDIwMjUgMzoyOCBQTQ0KPiBUbzogbWNoZWhhYkBrZXJuZWwub3JnOyBz
YWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tOyBzaHJhdmFuIENoaXBwYSAtDQo+IEkzNTA4OCA8
U2hyYXZhbi5DaGlwcGFAbWljcm9jaGlwLmNvbT4NCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgQ29ub3IgRG9vbGV5IC0NCj4g
TTUyNjkxIDxDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbT47IFZhbGVudGluYSBGZXJuYW5kZXog
QWxhbmlzIC0NCj4gTTYzMjM5IDxWYWxlbnRpbmEuRmVybmFuZGV6QWxhbmlzQG1pY3JvY2hpcC5j
b20+OyBQcmF2ZWVuIEt1bWFyIC0NCj4gSTMwNzE4IDxQcmF2ZWVuLkt1bWFyQG1pY3JvY2hpcC5j
b20+OyBzaHJhdmFuIENoaXBwYSAtIEkzNTA4OA0KPiA8U2hyYXZhbi5DaGlwcGFAbWljcm9jaGlw
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gbWVkaWE6IGkyYzogaW14MzM0OiBhZGQgc3Vw
cG9ydCBmb3IgYWRkaXRpb25hbCB0ZXN0DQo+IHBhdHRlcm5zDQo+IA0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZQ0KPiBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEhpIFNocmF2YW4NCj4gDQo+IFF1b3Rpbmcg
c2hyYXZhbiBrdW1hciAoMjAyNS0wNi0yNCAwNzo1NDozOCkNCj4gPiBGcm9tOiBTaHJhdmFuIENo
aXBwYSA8c2hyYXZhbi5jaGlwcGFAbWljcm9jaGlwLmNvbT4NCj4gPg0KPiA+IEFkZGVkIHN1cHBv
cnQgZm9yIHRocmVlIGFkZGl0aW9uYWwgdGVzdCBwYXR0ZXJucyBpbiB0aGUNCj4gPiBJTVgzMzQg
ZHJpdmVyOiBCbGFjayBhbmQgR3JleSBCYXJzLCBCbGFjayBDb2xvciwgYW5kIFdoaXRlIENvbG9y
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2hyYXZhbiBDaGlwcGEgPHNocmF2YW4uY2hpcHBh
QG1pY3JvY2hpcC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL2lteDMzNC5j
IHwgOSArKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL2lteDMzNC5jIGIvZHJpdmVycy9t
ZWRpYS9pMmMvaW14MzM0LmMNCj4gPiBpbmRleCA4NDZiOTkyOGQ0ZTguLjQzZGQ3ZWRiNDhjOCAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9pbXgzMzQuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvbWVkaWEvaTJjL2lteDMzNC5jDQo+ID4gQEAgLTExOCw2ICsxMTgsOSBAQA0KPiA+ICAj
ZGVmaW5lIElNWDMzNF9SRUdfVFAgICAgICAgICAgICAgICAgICBDQ0lfUkVHOCgweDMyOWUpDQo+
ID4gICNkZWZpbmUgSU1YMzM0X1RQX0NPTE9SX0hCQVJTICAgICAgICAgIDB4YQ0KPiA+ICAjZGVm
aW5lIElNWDMzNF9UUF9DT0xPUl9WQkFSUyAgICAgICAgICAweGINCj4gPiArI2RlZmluZSBJTVgz
MzRfVFBfQkxBQ0sgICAgICAgICAgICAgICAgICAgICAgICAweDANCj4gPiArI2RlZmluZSBJTVgz
MzRfVFBfV0hJVEUgICAgICAgICAgICAgICAgICAgICAgICAweDENCj4gPiArI2RlZmluZSBJTVgz
MzRfVFBfQkxBQ0tfR1JFWSAgICAgICAgICAgMHhDDQo+IA0KPiBUaGlzIHNob3VsZCBiZSBsb3dl
ciBjYXNlIHRvIG1hdGNoIHRoZSBvdGhlciBoZXggY29uc3RhbnRzICgweGMpDQo+IA0KPiBJIGFs
c28gd29uZGVyIGlmIHRoaXMgbGlzdCBzaG91bGQgYmUgaW4gcmVnaXN0ZXIgYWRkcmVzcyBvcmRl
ciAuLi4gYnV0IHRoZW4gaXQgd29uJ3QNCj4gbWF0Y2ggdGhlIG1lbnUgaXRlbXMgLi4uDQoNClRo
aXMgaXMganVzdCB2YWx1ZSB0byB3cml0ZSBpbiB0aGUgcmVnaXN0ZXINCg0KVGhhbmtzLA0KU2hy
YXZhbg0KDQo+IA0KPiA+DQo+ID4gICNkZWZpbmUgSU1YMzM0X1RQR19FTl9ET1VUICAgICAgICAg
ICAgIENDSV9SRUc4KDB4MzI5YykNCj4gPiAgI2RlZmluZSBJTVgzMzRfVFBfRU5BQkxFICAgICAg
ICAgICAgICAgMHgxDQo+ID4gQEAgLTM5OCwxMiArNDAxLDE4IEBAIHN0YXRpYyBjb25zdCBjaGFy
ICogY29uc3QNCj4gaW14MzM0X3Rlc3RfcGF0dGVybl9tZW51W10gPSB7DQo+ID4gICAgICAgICAi
RGlzYWJsZWQiLA0KPiA+ICAgICAgICAgIlZlcnRpY2FsIENvbG9yIEJhcnMiLA0KPiA+ICAgICAg
ICAgIkhvcml6b250YWwgQ29sb3IgQmFycyIsDQo+ID4gKyAgICAgICAiQmxhY2sgYW5kIEdyZXkg
QmFycyIsDQo+ID4gKyAgICAgICAiQmxhY2sgQ29sb3IiLA0KPiA+ICsgICAgICAgIldoaXRlIENv
bG9yIiwNCj4gPiAgfTsNCj4gPg0KPiA+ICBzdGF0aWMgY29uc3QgaW50IGlteDMzNF90ZXN0X3Bh
dHRlcm5fdmFsW10gPSB7DQo+ID4gICAgICAgICBJTVgzMzRfVFBfRElTQUJMRSwNCj4gPiAgICAg
ICAgIElNWDMzNF9UUF9DT0xPUl9IQkFSUywNCj4gPiAgICAgICAgIElNWDMzNF9UUF9DT0xPUl9W
QkFSUywNCj4gPiArICAgICAgIElNWDMzNF9UUF9CTEFDS19HUkVZLA0KPiA+ICsgICAgICAgSU1Y
MzM0X1RQX0JMQUNLLA0KPiA+ICsgICAgICAgSU1YMzM0X1RQX1dISVRFLA0KPiA+ICB9Ow0KPiA+
DQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2NpX3JlZ19zZXF1ZW5jZSByYXcxMF9mcmFtZWZt
dF9yZWdzW10gPSB7DQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0K

