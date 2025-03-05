Return-Path: <linux-media+bounces-27584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2426A4FBD0
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7B353A7A47
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A99207A1C;
	Wed,  5 Mar 2025 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="v+4UVb/P"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2064.outbound.protection.outlook.com [40.107.212.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2608202F99;
	Wed,  5 Mar 2025 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741170139; cv=fail; b=kwRoUxytY9WmxWptnzU7FWMZXvFFdlbVMLPMVSq3sbncrxWejpCb8BJGh2YxVX+MP6iHmXDa0KbtwfQ/gnlVhGqvRbpp3mjoTWn8bfHQMxQbdgaD2UWv8Bzht3EtwcdZi65iGc7R7JBQxu15afLUfo6OyRSkdFLYT87CHSsPZTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741170139; c=relaxed/simple;
	bh=vcx5YbhlrVAFkW0e1WpXGJD/9L0cLMRoHxr0Klza8Ag=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Sp7l9zbVKq9M1ugiNNbVsODmfA9fGAswYJoKlTrk4qTASQ3vCdPi7Uw6FoyiwdES8UoT/0aofx9wwfMC5LC3LxRW+ST8pKWCUtnQRoxt53cop1mBiNJ+t4NWABuyQCOSI/YxfDlcadjgCdVtNbYXqkXTOmhHTY+GicdwRZQcqPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=v+4UVb/P; arc=fail smtp.client-ip=40.107.212.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmR9PDS203oSnGs+7gNTxfZqtU/0QBLTrsiSKScp1eAiXSkgiNxe2bH1D0nO7J7MhTPlnhneCvlhBCRfcPb/rwXywc2UEU2/awDVIDMc+ghLQ3Y54yoRpkV1PFjjKPzA0SYC8pQTX++lzVIB+yW2bvdw6nLEw2lJn62cMRyAH9WN15jtmRHnyal3Siyi4mpbz/7kame9GhzCqZpTBZesr77DKkKexMyPAwtRfH2icrmiMnX49e7+ELzUnMt5PmTHFRaX9cMrASkPQuwIkcN5DHZWcXw08Ici6Y3Z9L0oMflXc1Ypo/hfC3kVZY3yqjkmT9A+3SyNVm/XrvS8NzesQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcx5YbhlrVAFkW0e1WpXGJD/9L0cLMRoHxr0Klza8Ag=;
 b=e7t5TezS/vU5Ln0Bh5CyTUFPxOX6CFcLaqkdfR1MsV7h9Qr4MVO3p7soLfy+yKpmLB5kmp1JZyYsvjuxLP+ffJCeOPBTTjTAEojbmIUPXZrSjAkUU+RKlGuArz3bHP7SgRjhPId9KtrbUZV5aosLtHdqFS3GenkzB0DmPA6hvj5lKgk+9xhcN9ym2WZx9RmifCwVOmk/jm/8Lo27xpzUB67H6Zu4NPzUKu9IzNyQyLW0NPcdLOT6SqmEw+JSJ/kSxbzBEf040YP2nuvMERL5dOC7nTEpNBvvJ/8iKrsZlF5UZOjuuMPzV9zI+qOoWfdbErDx98epNh4um36NalFLQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcx5YbhlrVAFkW0e1WpXGJD/9L0cLMRoHxr0Klza8Ag=;
 b=v+4UVb/Pfm2HBexUKoMi4uhTFJS5x6nwt3CLGFmNsRbusjn3zjM244Eno7bv/S8PXOZL6a0BJkCdNieG5eXgw7fb2le3aqtlvqyxSKGpbO0rMyGojpmT4aDI7pUElaeOvXG1/XCRBlnTsmTKGg9IONakBckSkUSqQn/x+mxKxrdiSrM1TO4pCzTGY/22q8ZnglmYCqs5DFpQ8tUNuPPOEZsyWnWVcR1Hi13qjP2VUIFWpPaQGd5HQg0auW56OBfu4x67sDIMgQ0nO/wmqaXa5nYdr9i8NTVYMh3ocgZUsfTdt+DGVfUd1nNmElxR8zgHD016EvjI9oKpSocU9d1paA==
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CO1PR11MB4994.namprd11.prod.outlook.com (2603:10b6:303:91::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 10:22:13 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 10:22:12 +0000
From: <Shravan.Chippa@microchip.com>
To: <kieran.bingham@ideasonboard.com>, <mchehab@kernel.org>,
	<sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Conor.Dooley@microchip.com>, <Valentina.FernandezAlanis@microchip.com>,
	<Praveen.Kumar@microchip.com>
Subject: RE: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p
 resolutions
Thread-Topic: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p
 resolutions
Thread-Index: AQHbjY3y0Niccr/3YUSE7q0tj30aLLNkSL0AgAALq+A=
Date: Wed, 5 Mar 2025 10:22:12 +0000
Message-ID:
 <PH0PR11MB5611988F18EF02394E983AA881CB2@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20250305051442.3716817-1-shravan.chippa@microchip.com>
 <20250305051442.3716817-5-shravan.chippa@microchip.com>
 <174116732611.2914008.9738053002324304147@ping.linuxembedded.co.uk>
In-Reply-To:
 <174116732611.2914008.9738053002324304147@ping.linuxembedded.co.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|CO1PR11MB4994:EE_
x-ms-office365-filtering-correlation-id: ddfe4fdc-4013-403d-6fe6-08dd5bcf9855
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ek9RU0ZIY0twblRYMFI0aGoydks3cjVZQ1FFSlhmMEpoUlByVm13MWtKRGt3?=
 =?utf-8?B?NTJSdXBTV0ZqaHpwTndhOGlDdkFmRnZaZlhXZ0ZIbmdVczNPK1E3dTFxSnZh?=
 =?utf-8?B?cFN0RHpZU2dYd1kxVlZydFhHQ1ZEdmt6bDNMVTRtNysxNVpzQWdjTThvNG1u?=
 =?utf-8?B?SE9TUmRDWUZVdjYwTm9RcW9rVEhQRER0eUVjNmlXS0N5RFZhRVF0SlVuTFZP?=
 =?utf-8?B?ekF3amRXb2tMa0pGeVNzQXBMR2p1RWExbldjdlZIdis0OVRLVTNKSVA3ODha?=
 =?utf-8?B?dGJhMUxlTllqT1BocENvTjFyYWRXWllHZG5RbGR1ME1yRHdXRlQwa24zeUYr?=
 =?utf-8?B?bTJSVVFiT2tHNVNiTGRMaTJxNXNPNWFUVVVNUFNOUW1QZWprcU4yajgzSlox?=
 =?utf-8?B?dGFPYjBzWjUvbjN2NnA2citiUW91Q28wL25SWXlWZExhSmhUQ01nMm8zaGlJ?=
 =?utf-8?B?SnJNbFpleDQwQ3psaUhrdWRHblhkdU1kOEd0R3NuRHAyUFk4dWtzQWo4MThn?=
 =?utf-8?B?V21ONFNPMGJxSy9XRDVkN29YZUxBRkhtbzNKNXZkekRjbzBseFF1L2FNUThE?=
 =?utf-8?B?Zm4yck1jRGVVNEk2dWxnSmtTdnFDd2cyYmFVV1lHSlE1bnBuRy9oTGIzaDFq?=
 =?utf-8?B?TFdabDJZTHN5VHVCOTVwOW9DR0hWMk1VU0d0L2xJNnZpbHpvZEdhTmcrWUJW?=
 =?utf-8?B?ZXJQVzJJaTZrV3EvVzJ0bXlFMjU0TmJTVkhtSG5ueW14VDRpZUE4MEtpNlRm?=
 =?utf-8?B?WEpKekw4VzJ5K2k5VFFDWnNCVFlZY3ZDZWRlc3RBaWNidVYxaTdZSVdqSnIr?=
 =?utf-8?B?S1cvcEYwd0RVZ3RwZGt0ZkRYblpDLzhXR2dCaUo5MkxCOXB1OWppdjlmek82?=
 =?utf-8?B?cjdpRGhxWmZtb3ZmK1FKMHJOdWtHOGZLbUh6WjlDRnErU3c2VHJMS0xqWnJU?=
 =?utf-8?B?RWpVa1EyTUxlQzZuWHMrUlk1OUZiZUN4ci9XZEZhaXJUZkIvam56ckdaeEVo?=
 =?utf-8?B?bmNDcGZXRE12SjE4Qko1VHBrcWJJOG5PVW1Wdk9QUVdpK0V6N2xvalNVejFv?=
 =?utf-8?B?MVZuZjFJMXFWUkR5aXV4TlRWaDVHOWlrV053MVBJTmZETllNajB2aTd0VExS?=
 =?utf-8?B?b04yM044TDRneWE4d1BkUXdrVGZOa0JVL0VLQlRjZE45KzBueDlmU1dzLzAw?=
 =?utf-8?B?UWd6Tk80S2QzK1d1aFhHWUoyNHpoZ25xVTBhdlkvSEtMSUlVaXRFd29GekNl?=
 =?utf-8?B?Y0doMEg3MHBFYjJ4Z1RGM2pDMlZ0dzdFTWN1ZzJVeDlycnhleFRyMHQ4dDMw?=
 =?utf-8?B?MVZobXJkc0taK00vbjJKQjJFT0xVcTNEd0c1STMwRDhPMjBRT0NXYjI0RVgz?=
 =?utf-8?B?cExPQmxBZHhRT1A1SnZxaUhlN0lLbk1xL1d0VEkwUVptL2tJeGVPaW1QN1Yv?=
 =?utf-8?B?c2RMeStHRVVURXFOK3JLcjZ0QXpCNVJnYTFVa3JveVJMZFoyQjJ1ZlVFa3Er?=
 =?utf-8?B?Rmx1ZW9DcTJOeGxucTRRenlqcGp4bWFaRmFibDgvOGZnQktOcjg5VzZwQkh1?=
 =?utf-8?B?bDNXSlJHUy9SUFFYQzlGZklzbmZac2NMaERoUnZkdVl4cVEyRXN2aVFCT2gw?=
 =?utf-8?B?WXF6NGQ4SENtcEs1cnI0WjlKLzBHVW1Va1grOUtoSlRXbnNFcW9QYm1YL3M5?=
 =?utf-8?B?a1dCS3NBaEtEYlNUTmZoY3ZHdGxCNlJoSkMyV3Q0ZFRMdlNyVlNuWElHWG9H?=
 =?utf-8?B?RXlLaCtWTkN1Um1OOEtvYkdtTkM0eFFDNFlOYnJnajVWWlhWV2FubDlqM0Y2?=
 =?utf-8?B?V3VOcExxQkNIcmJ2TWtKL0o3WlpEOERZbHRaYklnTC9DbmxPYkZsYTRvYW1H?=
 =?utf-8?B?SVBzWnNCMUNWK3hjM1pSRVl3RVZtU2l1NTc0NFNtR2VOb2ErMmt6clM3YUhC?=
 =?utf-8?Q?6mwf1EApy/VTCfD6DjTWVfaklg2GwOwo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eHBnZGJyWVl1QzM4cTc0ODlhQmYyYjBpbnRxam5jU3ZXb3VnNGdQRU9pMXVm?=
 =?utf-8?B?ZHBLQlgxMitIYmJYTXd4VEZ4Wnk5OTNwYzFMdHU4MWx0VWZvQzhZYzJMYVZ3?=
 =?utf-8?B?WW1tTldmcWExRTBzZ3BFdlB3ekxpQncrdlpWdERmYWUwQ3hRRW9GNExWYldI?=
 =?utf-8?B?TlZGbFo4azZ0eFBKT3Z2bGVZK0ZGSFVhTS9CWWxkWWNvdHBYMm94WXJKdmRz?=
 =?utf-8?B?V2VUOXRIb2kvZDFVdEZ0TE1Bb1RnbHZFRldpZXZBNEdxSERFUjJ6cGQ5V3RB?=
 =?utf-8?B?Zm9SSDcxbG0wd2NDMThNYlhIcnF6UDl4aXFkVXdGNEsyRFJFV05wMk13OWN4?=
 =?utf-8?B?OVBvTmU5Mzhkblp3YkNoMTl6dkYrTXdSOFVHd1ZMeXgrMzZlandrdUhXS3VT?=
 =?utf-8?B?ZFJ5WGRiS2JkMXhIYi9pZkRFL2k1bExMeDlQVzJMZXhZa1dIekpsL2toUElH?=
 =?utf-8?B?VlY2ZElpdWsvNUxPNWltZkZGS0JkOE4xQ2NuZEFSSEFJQmFjZmR5RUJFT3Zn?=
 =?utf-8?B?d2d6TjUxU1hwTlVqVmI2WlpDMGRoTUF0NmpBYm9vR0xHZ3I4dEt3eTJlaE15?=
 =?utf-8?B?emg5a1pVaGNQU3FVbjd2TkNqK1B2bHdJNnpsMkhnZmhPSC8rR3RNQ3lRSUZU?=
 =?utf-8?B?SVAySFRjQnVlcTFIT0hqRHNIMzJwWXMzL0dKWTlBSEpXdDZVRlNCV2FaTk55?=
 =?utf-8?B?UXdyemtyL0ZMR25WM3pWY0xDV3doRy83T3lwdEc0YTRIT2NjQUc4U1BUc0hy?=
 =?utf-8?B?YXpWcy9YVFNIMjdjdldlMVJpdlk2Z3p3TEsydVdvcXVXbXdjYjdRV010WDQr?=
 =?utf-8?B?WnRpQ2l2R0ZDZ3VNdy9ubUlxRitFeEhTcnJJMG1zUVBJdTFYSy9meGFTaE5R?=
 =?utf-8?B?K3NpZ3Z4Q1dsOUtHZ3hOVUhpbXhZYnpSSWxlNWx6c2xYR0lnYmZqaThHVzBE?=
 =?utf-8?B?Z3QwdXhCMG5MOTFCWHFVamVOdHhRUGJsTi9hQ01Ia0w2S2hNSldLV2twSWNp?=
 =?utf-8?B?NGNEV2lkNXpSYUhwNklZaDdzUC9LamI4d3NUUU5ZVTc2Sm1VbGh3RUpzemc5?=
 =?utf-8?B?Q1RlN1o3eVFYNE52UVZqTU5oVTdrNGd3cElNZjlTeFRzNDlKVnAwQnkzektt?=
 =?utf-8?B?dzRjUkxqS3JhZUltaEdwTWc4WE5wNU5tcE55Y3dvSlVVUzZsUFdpODZLVTJs?=
 =?utf-8?B?bXp1SUJNMVRQNkljS2xKOVhTc0lrM01ZaG9CbHVmbTVnLy82d1JuN29GNWw3?=
 =?utf-8?B?ZnBweG91cjNudG1ERmRERmJwcU9YTWVrZFl2L2RSdzk0Tm5IRHpYOE1Oc2JW?=
 =?utf-8?B?SDBsazQ3R1RXY0VPWmx5V2xBaWxXTVN6WnEzendXeXlQTklLSjltMit0c0Qr?=
 =?utf-8?B?eDdqS3h3U1p5RHhlZ01Fd0xacUYwaWc4c0h3MmNNNTh1M1ZSKzU2dElNUzRF?=
 =?utf-8?B?Y0tBalFGQ0o0L3c0TUZ3bXQ1enl1dzFQQkdia3JwZmQ5NUNYRU5hMWY0Qmhq?=
 =?utf-8?B?UFhLYmxMVlRBT05TdzVMdENMRlNpUUdzWXBSWEhIMlJmR2FJU1JreDlRSjBH?=
 =?utf-8?B?ZGhQcWJpd1lyMFZDM1BnUHJmcWxRellxTkEzM2ovRXlSWkdMV2tkWlUrdHlP?=
 =?utf-8?B?bVBGYS9UVFlKdE12MDQ3RGFtSUU5SFNtMTVPTGM0NVNvYnRFa1pmWnNuY0U2?=
 =?utf-8?B?S1F0OStLeXJwZFpYWno1TFArUk9jV29GTmNiQlRQNWZQVStFeUJDYkJ0WE5v?=
 =?utf-8?B?dDE1UXBWWFdwY0E5cnJIdjlRTlFFYlY3WHBkUEs1U2ROL3R2TU5wdzNaMkc0?=
 =?utf-8?B?ZmszSEoxMGJDSER5UUZzTzdnaUxxb3EwY2JXSnl0R3VZNFp3L3JYSEFWdHJQ?=
 =?utf-8?B?OUl5ZGRnSWNnN1ByREdXV2d1dlk5UVhaUGU5dm5GUnZwcFpuVUV0R2dHaG9n?=
 =?utf-8?B?VkFqUjBsWWdMd1pzTFU4RWdySlBXeHl2S1daQ3g2QzJkbmZJS0lOdmJOYU9l?=
 =?utf-8?B?bGxaNHZINmg4Z3RsbWRVdkFINWQ3cWdaREZBSjdBQWlEbnZneDU5Y1d2dkl4?=
 =?utf-8?B?cWtJWlQ2Ujkyek5rUklGOFpmYVFCQjZJZENhWWdVSEpoNHkwYlo2TkhNSWNs?=
 =?utf-8?B?bklPQXRpdjhwajBXZ1MxWVV0TThaME1tTjRDRzVOOTVGd2ZYUHRKRUhHQldj?=
 =?utf-8?B?bFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfe4fdc-4013-403d-6fe6-08dd5bcf9855
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 10:22:12.8525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PAsyw2C0WgyoDoBv2qyGUgXlQ+yzdHx5oIGQubEHLEkcygvfy/8sIze+a/ZxOYvUzGyMvpZopT8DY6ZgvYbws0slJpSIxBQFIZyF3w4omgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4994

SGkgS2llcmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2llcmFu
IEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtQGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggNSwgMjAyNSAzOjA1IFBNDQo+IFRvOiBtY2hlaGFiQGtlcm5lbC5vcmc7IHNh
a2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb207IHNocmF2YW4gQ2hpcHBhIC0NCj4gSTM1MDg4IDxT
aHJhdmFuLkNoaXBwYUBtaWNyb2NoaXAuY29tPg0KPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBDb25vciBEb29sZXkNCj4gLSBN
NTI2OTEgPENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tPjsgVmFsZW50aW5hIEZlcm5hbmRleiBB
bGFuaXMgLQ0KPiBNNjMyMzkgPFZhbGVudGluYS5GZXJuYW5kZXpBbGFuaXNAbWljcm9jaGlwLmNv
bT47IFByYXZlZW4gS3VtYXIgLQ0KPiBJMzA3MTggPFByYXZlZW4uS3VtYXJAbWljcm9jaGlwLmNv
bT47IHNocmF2YW4gQ2hpcHBhIC0gSTM1MDg4DQo+IDxTaHJhdmFuLkNoaXBwYUBtaWNyb2NoaXAu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFY3IDQvNF0gbWVkaWE6IGkyYzogaW14MzM0OiBh
ZGQgbW9kZXMgZm9yIDcyMHAgYW5kIDQ4MHANCj4gcmVzb2x1dGlvbnMNCj4gDQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlDQo+IGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gUXVvdGluZyBzaHJhdmFuIGt1bWFy
ICgyMDI1LTAzLTA1IDA1OjE0OjQyKQ0KPiA+IEZyb206IFNocmF2YW4gQ2hpcHBhIDxzaHJhdmFu
LmNoaXBwYUBtaWNyb2NoaXAuY29tPg0KPiA+DQo+ID4gQWRkZWQgc3VwcG9ydCBmb3IgMTI4MHg3
MjBAMzAgYW5kIDY0MHg0ODBAMzAgcmVzb2x1dGlvbnMNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFNocmF2YW4gQ2hpcHBhIDxzaHJhdmFuLmNoaXBwYUBtaWNyb2NoaXAuY29tPg0KPiA+IC0tLQ0K
PiA+ICBkcml2ZXJzL21lZGlhL2kyYy9pbXgzMzQuYyB8IDY2DQo+ID4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDY2IGluc2VydGlv
bnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9pbXgzMzQuYyBi
L2RyaXZlcnMvbWVkaWEvaTJjL2lteDMzNC5jDQo+ID4gaW5kZXggYTdjMGJkMzhjOWI4Li44Y2Qx
ZWVjZDAxNDMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvaW14MzM0LmMNCj4g
PiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9pbXgzMzQuYw0KPiA+IEBAIC0zMTQsNiArMzE0LDQ2
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW14MzM0X3JlZw0KPiBjb21tb25fbW9kZV9yZWdzW10g
PSB7DQo+ID4gICAgICAgICB7MHgzMDAyLCAweDAwfSwNCj4gPiAgfTsNCj4gPg0KPiA+ICsvKiBT
ZW5zb3IgbW9kZSByZWdpc3RlcnMgZm9yIDY0MHg0ODBAMzBmcHMgKi8gc3RhdGljIGNvbnN0IHN0
cnVjdA0KPiA+ICtpbXgzMzRfcmVnIG1vZGVfNjQweDQ4MF9yZWdzW10gPSB7DQo+ID4gKyAgICAg
ICB7MHgzMDJjLCAweDcwfSwNCj4gPiArICAgICAgIHsweDMwMmQsIDB4MDZ9LA0KPiANCj4gVGhl
c2UgdHdvIGFyZSBhIHNpbmdsZSAxNiBiaXQgcmVnaXN0ZXIgSFRSSU1NSU5HX1NUQVJUID0gMTY0
OA0KPiANCj4gPiArICAgICAgIHsweDMwMmUsIDB4ODB9LA0KPiA+ICsgICAgICAgezB4MzAyZiwg
MHgwMn0sDQo+IA0KPiBUaGVzZSB0d28gYXJlIGEgc2luZ2xlIDE2IGJpdCByZWdpc3RlciBITlVN
ID0gNjQwDQo+IA0KPiA+ICsgICAgICAgezB4MzA3NCwgMHg0OH0sDQo+ID4gKyAgICAgICB7MHgz
MDc1LCAweDA3fSwNCj4gDQo+IFRoZXNlIHR3byBhcmUgYSBzaW5nbGUgMTYgYml0ICh3ZWxsLCAx
MiBiaXQgdmFsdWUpIEFSRUEzX1NUX0FEUl8xID0gMTg2NA0KPiANCj4gPiArICAgICAgIHsweDMw
OGUsIDB4NDl9LA0KPiA+ICsgICAgICAgezB4MzA4ZiwgMHgwN30sDQo+IA0KPiBUaGVzZSB0d28g
YXJlIGEgc2luZ2xlIDE2IGJpdCByZWdpc3RlciBBUkVBM19TVF9BRFJfMiA9IDE4NjUNCj4gDQo+
ID4gKyAgICAgICB7MHgzMDc2LCAweGUwfSwNCj4gPiArICAgICAgIHsweDMwNzcsIDB4MDF9LA0K
PiANCj4gVGhlc2UgdHdvIGFyZSBhIHNpbmdsZSAxNiBiaXQgcmVnaXN0ZXIgQVJFQTNfV0lEVEhf
MSA9IDQ4MA0KPiANCj4gPiArICAgICAgIHsweDMwOTAsIDB4ZTB9LA0KPiA+ICsgICAgICAgezB4
MzA5MSwgMHgwMX0sDQo+IA0KPiBUaGVzZSB0d28gYXJlIGEgc2luZ2xlIDE2IGJpdCByZWdpc3Rl
ciBBUkVBM19XSURUSF8yID0gNDgwDQo+IA0KPiA+ICsgICAgICAgezB4MzMwOCwgMHhlMH0sDQo+
ID4gKyAgICAgICB7MHgzMzA5LCAweDAxfSwNCj4gDQo+IFRoZXNlIHR3byBhcmUgYSBzaW5nbGUg
MTYgYml0IHJlZ2lzdGVyIFlfT1VUX1NJWkUNCj4gDQo+IERvbid0IHlvdSB0aGluaw0KPiAgICAg
ICAgIHsgWV9PVVRfU0laRSwgNDgwIH0sDQo+IA0KPiBJcyBzbyBtdWNoIG1vcmUgcmVhZGFibGUg
YW5kIGVhc2llciB0byBjb21wcmVoZW5kIGFuZCBtYWludGFpbj8NCj4gDQo+IA0KPiA+ICsgICAg
ICAgezB4MzBkOCwgMHgzMH0sDQo+ID4gKyAgICAgICB7MHgzMGQ5LCAweDBifSwNCj4gDQo+IFRo
ZXNlIHR3byBhcmUgYSBzaW5nbGUgMTYgYml0IHJlZ2lzdGVyIFVOUkVBRF9FRF9BRFIgPSAyODY0
DQo+IA0KPiA+ICt9Ow0KPiANCj4gSSdtIHN0aWxsIHNhZCB0aGF0IHdlIGNhbiBhbGwga25vdyB0
aGUgbmFtZXMgb2YgYWxsIHRoZXNlIHJlZ2lzdGVycyBhbmQgeWV0IHRoaXMNCj4gaXMgd3JpdGlu
ZyBuZXcgdGFibGVzIG9mIGhleCB2YWx1ZXMuDQoNCkRvIHlvdSB3YW50IG1lIHVzZSBjYWxsIGxp
a2UgYmVsbG93IEFQSSB3aXRoIHJlZ2lzdGVyIG5hbWVzOg0KQ0NJX1JFRzE2X0xFKDB4MzBkOCk7
DQpjY2lfd3JpdGUoKTsNCmNjaV9tdWx0aV9yZWdfd3JpdGUoKTsNCmRldm1fY2NpX3JlZ21hcF9p
bml0X2kyYygpOw0KDQoNClRoYW5rcywNClNocmF2YW4NCj4gDQo+IA0KPiAtLQ0KPiBLaWVyYW4N
Cj4gDQo+IA0KPiA+ICsNCj4gPiArLyogU2Vuc29yIG1vZGUgcmVnaXN0ZXJzIGZvciAxMjgweDcy
MEAzMGZwcyAqLyBzdGF0aWMgY29uc3Qgc3RydWN0DQo+ID4gK2lteDMzNF9yZWcgbW9kZV8xMjgw
eDcyMF9yZWdzW10gPSB7DQo+ID4gKyAgICAgICB7MHgzMDJjLCAweDMwfSwNCj4gPiArICAgICAg
IHsweDMwMmQsIDB4MDV9LA0KPiA+ICsgICAgICAgezB4MzAyZSwgMHgwMH0sDQo+ID4gKyAgICAg
ICB7MHgzMDJmLCAweDA1fSwNCj4gPiArICAgICAgIHsweDMwNzQsIDB4ODR9LA0KPiA+ICsgICAg
ICAgezB4MzA3NSwgMHgwM30sDQo+ID4gKyAgICAgICB7MHgzMDhlLCAweDg1fSwNCj4gPiArICAg
ICAgIHsweDMwOGYsIDB4MDN9LA0KPiA+ICsgICAgICAgezB4MzA3NiwgMHhkMH0sDQo+ID4gKyAg
ICAgICB7MHgzMDc3LCAweDAyfSwNCj4gPiArICAgICAgIHsweDMwOTAsIDB4ZDB9LA0KPiA+ICsg
ICAgICAgezB4MzA5MSwgMHgwMn0sDQo+ID4gKyAgICAgICB7MHgzMzA4LCAweGQwfSwNCj4gPiAr
ICAgICAgIHsweDMzMDksIDB4MDJ9LA0KPiA+ICsgICAgICAgezB4MzBkOCwgMHgzMH0sDQo+ID4g
KyAgICAgICB7MHgzMGQ5LCAweDBifSwNCj4gPiArfTsNCj4gPiArDQo+ID4gIC8qIFNlbnNvciBt
b2RlIHJlZ2lzdGVycyBmb3IgMTkyMHgxMDgwQDMwZnBzICovICBzdGF0aWMgY29uc3Qgc3RydWN0
DQo+ID4gaW14MzM0X3JlZyBtb2RlXzE5MjB4MTA4MF9yZWdzW10gPSB7DQo+ID4gICAgICAgICB7
MHgzMDJjLCAweGYwfSwNCj4gPiBAQCAtNDMzLDYgKzQ3MywzMiBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGlteDMzNF9tb2RlDQo+IHN1cHBvcnRlZF9tb2Rlc1tdID0gew0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIC5udW1fb2ZfcmVncyA9IEFSUkFZX1NJWkUobW9kZV8xOTIweDEwODBfcmVn
cyksDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgLnJlZ3MgPSBtb2RlXzE5MjB4MTA4MF9y
ZWdzLA0KPiA+ICAgICAgICAgICAgICAgICB9LA0KPiA+ICsgICAgICAgfSwgew0KPiA+ICsgICAg
ICAgICAgICAgICAud2lkdGggPSAxMjgwLA0KPiA+ICsgICAgICAgICAgICAgICAuaGVpZ2h0ID0g
NzIwLA0KPiA+ICsgICAgICAgICAgICAgICAuaGJsYW5rID0gMjQ4MCwNCj4gPiArICAgICAgICAg
ICAgICAgLnZibGFuayA9IDExNzAsDQo+ID4gKyAgICAgICAgICAgICAgIC52YmxhbmtfbWluID0g
NDUsDQo+ID4gKyAgICAgICAgICAgICAgIC52YmxhbmtfbWF4ID0gMTMyODQwLA0KPiA+ICsgICAg
ICAgICAgICAgICAucGNsayA9IDI5NzAwMDAwMCwNCj4gPiArICAgICAgICAgICAgICAgLmxpbmtf
ZnJlcV9pZHggPSAxLA0KPiA+ICsgICAgICAgICAgICAgICAucmVnX2xpc3QgPSB7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgLm51bV9vZl9yZWdzID0gQVJSQVlfU0laRShtb2RlXzEyODB4
NzIwX3JlZ3MpLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIC5yZWdzID0gbW9kZV8xMjgw
eDcyMF9yZWdzLA0KPiA+ICsgICAgICAgICAgICAgICB9LA0KPiA+ICsgICAgICAgfSwgew0KPiA+
ICsgICAgICAgICAgICAgICAud2lkdGggPSA2NDAsDQo+ID4gKyAgICAgICAgICAgICAgIC5oZWln
aHQgPSA0ODAsDQo+ID4gKyAgICAgICAgICAgICAgIC5oYmxhbmsgPSAyNDgwLA0KPiA+ICsgICAg
ICAgICAgICAgICAudmJsYW5rID0gMTE3MCwNCj4gPiArICAgICAgICAgICAgICAgLnZibGFua19t
aW4gPSA0NSwNCj4gPiArICAgICAgICAgICAgICAgLnZibGFua19tYXggPSAxMzI4NDAsDQo+ID4g
KyAgICAgICAgICAgICAgIC5wY2xrID0gMjk3MDAwMDAwLA0KPiA+ICsgICAgICAgICAgICAgICAu
bGlua19mcmVxX2lkeCA9IDEsDQo+ID4gKyAgICAgICAgICAgICAgIC5yZWdfbGlzdCA9IHsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAubnVtX29mX3JlZ3MgPSBBUlJBWV9TSVpFKG1vZGVf
NjQweDQ4MF9yZWdzKSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAucmVncyA9IG1vZGVf
NjQweDQ4MF9yZWdzLA0KPiA+ICsgICAgICAgICAgICAgICB9LA0KPiA+ICAgICAgICAgfSwNCj4g
PiAgfTsNCj4gPg0KPiA+IC0tDQo+ID4gMi4zNC4xDQo+ID4NCg==

