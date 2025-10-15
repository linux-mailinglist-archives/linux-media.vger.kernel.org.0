Return-Path: <linux-media+bounces-44516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4826CBDCA7D
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 08:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BAA24E8BF4
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 06:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE0D303CAB;
	Wed, 15 Oct 2025 06:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="J0BSsGlY"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010065.outbound.protection.outlook.com [52.101.85.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E122C1C8629;
	Wed, 15 Oct 2025 06:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760508316; cv=fail; b=NyBlJiWP3q8UX1vGMQJOSsZw9GWUW7dahjA+ToHiws3VFokqhrT8KcE80tu36Ebk1bw4EP8O6+aouds5Ypn7y7EZ43ieGzZJ4yDw+YvQ72vpEV4+LJ0iC+QAj0VtArNDFq0fclaHEziVY/FnDpw3mBqWtvrYY4APNx7RagKdHLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760508316; c=relaxed/simple;
	bh=cadvJbcuCWcFJhhAaUL+AB6py21K3V13C62E/PNJ0NE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dbUcWrnZdCywm4dXSkAK2e4ZW9L+6oQOqKNkGU3f7nnOF1tQ69oLQauJTQnCl5bm58Q0EhZnF1bRYuXHEryp3+wCcL4YlgAWQqeJ4dvac4jTXwuWXWX1Yllm08WNb93VQysFnkj/vwXtM8FiEQiE6E+or0qEAAHffis6ucvFe6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=J0BSsGlY; arc=fail smtp.client-ip=52.101.85.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxmihBPxMgt6uY7Rf28imZOYWZmi6TxcwyWjZtyU6hJOUouKF3iOcQS9M4dZJjEpIpPiTur4yH01ifDJJ4t7j5CvlFVM4qIu0fYFNha+TmhMpsgU9LfAlU/Wp6SFg0VuPQkDDeNniiHBxI9HRMQrj1i5WJRW/ojvoiiUQg9TU4FSpEjoQfzSlWE7KKGt014uzLSI3QKFRX9uTYIn5HEIgBzIuOBPs7UJjiKWzJ6W5KxED6CUJbrfqL7sOZpqDGFqyhcMr68f3ibmR9KY42v/w8Jthlkr4phe0Lrz8pPM4AvxpGlaAV17YGXzD21En/Wyc8Ku4Yo+v/8laO9+jpMDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cadvJbcuCWcFJhhAaUL+AB6py21K3V13C62E/PNJ0NE=;
 b=Iwlp/K2ZJ4nJ+R8fs3sJOr9UHjsCIRGM9/vXAxJMH6aWCIgTq90K7olbbRJhObowZdcvtxNzDKXsGzZRaoBXfoR/9ASsLSV23QzIDzik5l+8nJfcSsg04EH8SGskj6DMOLkOBQCHbpBmtP3B9Bw/B0BmKQTIXJGN4RtHT6b0dsvfVP3Tjh5kh8MyNvv1dITZyS3N9+qdADVGm16BU2mauc5muwXflTH/tAvnYQtX8Oqrrvi2MjH5gVPIoOspPM9LfbhIobKURw//wFX4WEq3TuhrlXgkw8EP+pE1sbf/9kt7hOCs73ODleoIGmkMMW37UUoVd0HbVN+dvBJKf7qflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cadvJbcuCWcFJhhAaUL+AB6py21K3V13C62E/PNJ0NE=;
 b=J0BSsGlY4zLcSM83EIYnFV61hVGVVlZj+60aCBwAo+SrNFHMDtk29nvSJccI68V36WklzZScDvic7YFK4ZfL1heAyQT/+QygE0ZBO8JSoYBusZSravWlZwsK6jxCAAMpDOVqeK6HczTaUx6UQwB0KHOQ1B1iJws6CKNEW5LoaO113IpoA3bps0UCsbpBKVOvJaM1anw5B1Coq0zQVxteu+WvrLCi7SqhmRZGuAO6mYUMQUG3S67IgZGsbe+Wxy/wssNtelMXaQB2n48Oe242YAwiWe7eYap47LtiCF0yvKxUAW0RVEW2RWNieeF2MiUg3e8duDw/ldor9K2zMWgLhw==
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by PH8PR11MB6831.namprd11.prod.outlook.com (2603:10b6:510:22d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 06:05:11 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 06:05:11 +0000
From: <Balamanikandan.Gunasundar@microchip.com>
To: <kieran.bingham@ideasonboard.com>, <eugen.hristev@linaro.org>
CC: <3chas3@gmail.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<Balakrishnan.S@microchip.com>, <hverkuil@kernel.org>,
	<ribalda@chromium.org>, <laurent.pinchart+renesas@ideasonboard.com>,
	<jacopo.mondi@ideasonboard.com>, <dan.scally+renesas@ideasonboard.com>,
	<tomi.valkeinen@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-atm-general@lists.sourceforge.net>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<mchehab@kernel.org>
Subject: Re: [PATCH 00/18] media: microchip-isc: Color correction and
 histogram stats
Thread-Topic: [PATCH 00/18] media: microchip-isc: Color correction and
 histogram stats
Thread-Index: AQHcOTTZ/S2f3ojywkq2aD8kAxrouLS6P1OAgADMHoCAB7VgAA==
Date: Wed, 15 Oct 2025 06:05:11 +0000
Message-ID: <2316c0cb-6a84-432e-8cd3-ca953123bd67@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <7b861236-8317-4435-8582-bd97f545e322@linaro.org>
 <176008451125.756374.6436397947711705101@ping.linuxembedded.co.uk>
In-Reply-To:
 <176008451125.756374.6436397947711705101@ping.linuxembedded.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6231:EE_|PH8PR11MB6831:EE_
x-ms-office365-filtering-correlation-id: 8cb7a8ee-24c3-4555-3209-08de0bb0cd33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VDlFZEpORUJXeWRXb1YvUWlJWWJnZkpIV1lxUXFMYmxhRTlwK1B2anQrK3Zx?=
 =?utf-8?B?bGJZOUZEWklXdGxlQ0hEM3I1RlBIV3o3LzJNc0NkRE1Ua0EvU1E2Q0xDRHYw?=
 =?utf-8?B?VG9UM0tiREt6NUJNY202d2VFNHVjK1MvK3FxWkoreG5rbWRpRkdpblhhdWlD?=
 =?utf-8?B?a0FUaFRBM3g2ak9iM0IrRXNQT3VBTTRwd01BUW5tSXdTbWdZaDRVaFhGSkFt?=
 =?utf-8?B?QW5xeXVjTUcwM1dCSWtKODlUUWVDV2YwQnAzSnRXUXM2RmFzN0x4K2IyWStR?=
 =?utf-8?B?ZW5NM2xLVCtyMGNoZVhxYTlxTkZwajRNZ0pJVlF3anhJbGx3MEFFem5kRWtw?=
 =?utf-8?B?dk0wWDQraDZWSlFtNFNFQWFiZ1dPVUh2QmJYSWJJaVVJajAyRXFrVmxKOEd0?=
 =?utf-8?B?cHBodys4UzRIRXZ2aUtZTE8zMy9lZzc3eGVHa3lGVHIyejZFZStMSDdQTmNn?=
 =?utf-8?B?d1hEMDNUMWlSc3UzQkdkSVNhRVcxVTJxNzc4SVdRNXFORkNIKzhRUStQM1lt?=
 =?utf-8?B?djJQdTRMWjI3eFBidmhZenY3RG9wMGhWNjJEQStvVDhEWVRZbUlFSkpDeE9I?=
 =?utf-8?B?MVhpV2RuMVRtUGJHenBBMm15eGVSdTVubXFHSjhCTzkvYnRkemV5UGdGbERv?=
 =?utf-8?B?UDdHVXNselhwb242NGIzbCtEU1lNOU5IZzJJWUFzOFJKWGlaZFVMMXo2MXFh?=
 =?utf-8?B?ODlFNHpFL0JFbDdmc3luL0xmOStiRFdJZ0ZZTE9qNFZtbk5wVS9CZWFCK0hK?=
 =?utf-8?B?UEZQa2RZTWh1Vjd6MGplY0tmL2pvNHBEVnEwVkpOb0RhYjY3VlVmVjViNmJH?=
 =?utf-8?B?b1lGSExPR2JuTWh2UU9hS2YwSXN2czBLVXhpWjhUT2NseWd3RXZwcXRjNzht?=
 =?utf-8?B?Zkc0aHVpK284eTg4dTd3QStpM25Ra0lidENQYUxNZlA3bjNtUmh5ejE1QU1X?=
 =?utf-8?B?R2lvZEVwa01CL1JncDNBRDRWdU5USWlGUmNuNkViVGxVbTFUaXNJZzlZMjhy?=
 =?utf-8?B?RGtqcWVQak9uQWFQL3JqbkllZEFjN3NHYmhoZlhQcDB5cDdmOUZ0L0QzOHlU?=
 =?utf-8?B?L1FZNC9iSEdob0hLOXl5UmJNZEo4a3MzNFJBK2ZQZ2xZUTUvcWRTMStJNUZ3?=
 =?utf-8?B?Vkc3RS84SFZIRlkyZWhtOUtCQWFFSUFoMytBb3lmNEdUVlZnblVCN2tDekJj?=
 =?utf-8?B?ZGduOVVmZmxyQkd6TzgxVm4wZHZHQnRhV2NKM0pEVXVBTEdUalFvMjdRa2hr?=
 =?utf-8?B?MVA2aWF5VGNqVGNhU1prSEQrMW1UNGhMeEZUc2NXUHFYTStMZzBtWXRndjZP?=
 =?utf-8?B?Y2tGOTR4Mmk2V1ltUzdnY2s3MEhTSUJYeGpFTkFOM01RT1NERXM1TlRRS3Zh?=
 =?utf-8?B?ODFZWnY5UHdteVVrNUJsU0VRL0VPbSs1WUV1Z1dzL0hlRDhhQklmUVNacTJm?=
 =?utf-8?B?Z2VmRk5LYVQyOStRMGJ3UHhNdDFQS2xaaDZUcTQrcUpnMmwrT1hRdjZSTzNh?=
 =?utf-8?B?ZWF5YnluMmZkR2MvdDdPaUxDa0FtejNDK0xPdVRrbCtDQ1o3dU1rUUNDZU53?=
 =?utf-8?B?eHI5Qkp1NmI4VHp3SnFZSUZSdXErNG91RHNkUFBZQ0FqV3FNWUM5OXZrUE1z?=
 =?utf-8?B?OWdoS2o2TmZFQ2N5dWZkdzJLK0ErOGZNVVlhVnhRMFFLaVd0cExjWHpoSWNi?=
 =?utf-8?B?Q1VmeTZyWTRQR2VUMGNRSnZMZmxraXU3QkJhSnZJaGowcHZ4OXBGcU1jVUZE?=
 =?utf-8?B?M0VoV1BtbFBHQ2szNlVsMXgraHRqQjdEb1B5QlNUcXZlQzhrQWpIaG8zb3N3?=
 =?utf-8?B?bGNzTDRvSXVCbkswYkcwWW9NaUJmZC9yNDUxemJZRVI2NGhlK2doVlRTQ0M4?=
 =?utf-8?B?NWw2STcwMTVHNE1rZC9udnFqcTJiZGg1aXU0K0xGNTlncFBLYWhqaVF2akZJ?=
 =?utf-8?B?S0prUUpNckJKM0UvYzlYTWY0MjdvQldPaDA5d091bWp2cldJVmJ6N09Za1U4?=
 =?utf-8?B?QUE5Zm44YjZWZVBzZytsT2RETlJLUlp6S2lHVE9ka3VxSWtQekoxZlQyR3pG?=
 =?utf-8?Q?lkzZqt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2kzUzlxbzhwZyt5ejNkMVpoNnpEQzhtcklvYVU4cElwdmtNS09jTEZJd0JR?=
 =?utf-8?B?SWxEV1JUYUdQR2k0VFpkRXRROXR2QW4wUU8wa1Zoa2YrOXJVbi9RY29QQkU4?=
 =?utf-8?B?bXlnM2tKZG4zZFNTN3VoS1puVnlXM1dySFYyNUNPVWd2Y2ovcWVkc3JIcDFi?=
 =?utf-8?B?dzhXNytMWXZ4bFlMMzZnbWdiZS9MTDJOS1g1QVlpdm54Q0ZZbkJMcHVjSFZ0?=
 =?utf-8?B?WXJ4RXBsZDJCVnJNWWR1M1l6OXV4bUc2Y2dyVjdDaFQ5NEgzclhSRDVNUjhy?=
 =?utf-8?B?ci9XeEo3eWlPcmxMM0VWSlNxZmVRYzVqT3crb2duN1JpdjBiZy91Mk5XS0o3?=
 =?utf-8?B?VW81UEhOeklwQXEyVExCNDYyWjhHUTRkTmxMTTZhSWdZNTU0YWZjc1dqMUN1?=
 =?utf-8?B?cWwzY2o1cDhodWtoeW5ZS3NtSWJIekRicVkvQkMwdnNRaE4veWhyTS8wbk1B?=
 =?utf-8?B?bVViVFF5blZMSlBrZ2h2ditBQzgzdlZDaE50d1lMSmZ2WGlsWWltN2NLMGs2?=
 =?utf-8?B?dFpSaktQYzlQMVFlU0lid0V5V0lLeGp2N040TWJnVDNXaThXaUp5dVVPTmRW?=
 =?utf-8?B?d3NrSUhCNnVSMXNKRmlkMDF1MXIxWlV6Y1YzWVZPc1ZBdHhSMGV5dWlHL2hL?=
 =?utf-8?B?MXplSTZMTkM3MXY5b0xmdlFrS1J4SnA5Qzk1K1hidDNST3pWRVFmQ0syTDZW?=
 =?utf-8?B?QzNUbFJJb2RwTGRFenBOM2Q4UjNGQ2grb0VYdjNtcllHcFZabndxQ0IzdGJU?=
 =?utf-8?B?Yy9Qb3ZOSWFmZ3NrM3puMFNTemJiYjJvMGlLMnpudjR1NjVBRnNleWRPU09Z?=
 =?utf-8?B?SW1XbXErSjZDRjZ0MXBadHJ6M3psWDFZckkvVVlud1Znd3ZhdVdjSktuUTlT?=
 =?utf-8?B?YnRwS2tFZlBzMlhWOCt2VS9VRGFCcjN1RXNsdEQzWnUyYy9Mb0d2NXhteWxG?=
 =?utf-8?B?dFV6eUp1Q1p2VzVPekdOSXpmRnRTcFF2Y1JVOE9uMUcrZ0tza21WREMyM2p2?=
 =?utf-8?B?MEd1V1hITjRhZXFaNnJRcnRVdGVzekMxRk4ySVh1YXJIRUhCZ3NnUFlBN2Z5?=
 =?utf-8?B?cU94M3BDU3NIcDdjMDBYV3dXTTFtR3phYkNqMzd6WG13emRkVzZPVU00RlpV?=
 =?utf-8?B?VFNsNThlQldweTZ2MzNLc3h5SnpkNnhxVFhJeU5HZVRkblBHNHBDVTlXWEN2?=
 =?utf-8?B?T1JlZWxGMkJSY1graXpNOGVQL0o2RmVoa251emg0ZE1ZK08vNGNUV0ttcStq?=
 =?utf-8?B?eCtZMDVpS0J5UktOY05YTkVQa2VlZ0xYMmdKdEY2TXNWVjhQdWI1Z203dzNM?=
 =?utf-8?B?bjJoaUJVaXpDRVpHb2VCSlVuY2dja0djV1BjZTVENkZwWHA3UTBzUFJkUzJY?=
 =?utf-8?B?MEYwbDNmd3plY0FGbmgzZi9rN1VZK0p1dDk3VVFvaXRZaGFZMVdPWkxhSlRl?=
 =?utf-8?B?UFV1NW5NdllYQWYrTG44ODlpano1SzEyWXVENE1ZL0lRUThGQUk1cjg2Q0lv?=
 =?utf-8?B?N2gxMjJUM3UwbDNILzJ1KzNNWmpRam9NbzhWcEpLYUFmUkxoVlFjejhWYlFs?=
 =?utf-8?B?QlBFWUgrUE9YNVVpQUlVQ1A2S3RyMVNwSzdWdlR1RENKNmViUTFGaXdZcTJE?=
 =?utf-8?B?Z0ZuMzJuVTFDSFdHN2E4SlkrRU5vTjFZZVBhTHV5V2lKZ0RsR3BjQzN1b0dj?=
 =?utf-8?B?dTRqdGZ6d1NDNUFBZFI3NmpGdlJxRkJ4dGoraXJKbHdvNVRJSFFYM0dPci9O?=
 =?utf-8?B?bjFwS3lSc3BRL05VZVdsQ0NxZlpWS3c4ZU1lazgwVmowcVM3OHk1bHpZNnZo?=
 =?utf-8?B?eWJwbTcweVFGRFNVUVJ1a1hWb0dSQysvUjh6ZCsyYXVEcjNFNkxzSmpRODF6?=
 =?utf-8?B?SDZoTURuTGQrYTY5Z00xMWpnUUtBT3BhdzM0bUJ5YlorVllVU00wZmNhMEVX?=
 =?utf-8?B?c1B1Tm0zcVM3S2VEdVlDQk5teFlCL1g5alNaVXVqSlRpdUN3ekorWWJ4ay8w?=
 =?utf-8?B?d3dEMW1zNmNrUHFUSFcwOXpsd0dzYlV3aThXWmNUckRvU1pzTm1YRXdkUDJ4?=
 =?utf-8?B?eXU4V28wN1UxNHlaRWdHbTNVVlV0dTR1OEtyTjdWaGdCRE1FWi92RTUxRjBK?=
 =?utf-8?B?WVM4Vis3OUtTQm4ybEJtNTA4VlJpOUJ1dWxRQ0t3YmJZeU1va1JwbjZoOHNC?=
 =?utf-8?Q?Z5y2cO0NsNZwiwZhkB1qVzA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1690E4C53AED1B41AD0E965912A6B7F0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb7a8ee-24c3-4555-3209-08de0bb0cd33
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 06:05:11.7416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AREUUVxZHzOxjFV4HnvRSx1aKlFHINi/fKI8rdIWp32xL1QaGtZDSA2kApxctJDC6io4TKLfnXLnnIk+oH4PkPnvcuV0C8RW9eoyQbxAiqPFOeBCXN5qSWiU7+b1se4R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6831

SGnCoCBLaWVyYW4sDQoNCk9uIDEwLzEwLzI1IDE6NTEgcG0sIEtpZXJhbiBCaW5naGFtIHdyb3Rl
Og0KPj4gSGkgQmFsYSwNCj4+DQo+PiBPbiAxMC85LzI1IDE4OjUyLCBCYWxhbWFuaWthbmRhbiBH
dW5hc3VuZGFyIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+Pj4gVGhpcyBwYXRjaCBzZXJpZXMgaGFz
IGEgc2V0IG9mIGVuaGFuY2VtZW50cyB0byB0aGUgTWljcm9jaGlwIEltYWdlIFNlbnNvcg0KPj4+
IENvbnRyb2xsZXIgZHJpdmVyLiBUaGUgb2JqZWN0aXZlIGlzIHRvIGV4cGFuZCBpdHMgaW1hZ2Ug
cHJvY2Vzc2luZw0KPj4+IGNhcGFiaWxpdGllcyBhbmQgdG8gaW1wcm92ZSB0aGUgY29sb3JzLg0K
Pj4+DQo+Pj4gVGhpcyBzZXJpZXMgYWxzbyBpbnRyb2R1Y2VzIGEgbmV3IHN0YXRzIGRyaXZlciB0
aGF0IGV4cG9zZXMgdGhlIGhpc3RvZ3JhbQ0KPj4+IGRhdGEgdG8gdXNlcnNwYWNlIHZpYSB2NGwy
IGNvbnRyb2xzLiBUaGlzIGFsbG93cyBhcHBsaWNhdGlvbnMgc3VjaCBhcw0KPj4+IGxpYmNhbWVy
YSB0byBhY2Nlc3MgcmVhbCB0aW1lIGltYWdlIHN0YXRpc3RpY3MgZm9yIGFkdmFuY2VkIGltYWdl
DQo+Pj4gcHJvY2Vzc2luZyBsaWtlIGF1dG9tYXRpYyBleHBvc3VyZSwgd2hpdGUgYmFsYW5jZSBh
ZGp1c3RtZW50cyBldGMuDQo+IEhvdyBtdWNoIGRhdGEgZG8geW91IGFudGljaXBhdGUgdG8gYmUg
cGFzc2luZyB0aHJvdWdoIGNvbnRyb2xzPyAoV2hhdA0KPiBjYW4gdGhlIGhhcmR3YXJlIHByb3Zp
ZGUgaW4gdG90YWwgaWYgd2UgbG9vayBhdCB0aGUgYmlnZ2VyIHBpY3R1cmUgdG8NCj4gc3VwcG9y
dCB0aGUgZnVsbCBkZXZpY2U/KQ0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIEN1cnJlbnRseSB0
aGUgaGFyZHdhcmUgcHJvdmlkZXMgaGlzdG9ncmFtIGRhdGEgDQp3aXRoIDI1NiBiaW5zIHBlciBj
b2xvciAoUiwgRywgQiBhbmQgWSkgZWFjaCAzMiBiaXQgd2lkZS4gU28gcm91Z2hseSANCmFyb3Vu
ZCA0IHggMjU2IHggNCA9IDRLIG9mIGRhdGEgcGVyIGZyYW1lLiBUaGUgaW50ZW50IHRvIHVzZcKg
IGl0IGFzIHY0bDIgDQpjb250cm9scyB3YXMgdG8gbWFrZSB0aGlzIGRhdGEgZWFzaWx5IGFjY2Vz
c2libGUgdG8gdXNlciBzcGFjZSB3aXRob3V0IGEgDQpuZWVkIGZvciBhIG5ldyBkYXRhIGludGVy
ZmFjZSBpbml0aWFsbHkuIEhvd2V2ZXIgSSBhZ3JlZSB0aGF0IHdlIG1heSANCmV4cGFuZCB0aGUg
c3RhdGlzdGljcyBmb3IgZnV0dXJlIElTUCBibG9ja3MgdG8gaW5jbHVkZSByZWdpb24gYmFzZWQg
DQpzdGF0cyAoV2UgYXJlIGFscmVhZHkgaW4gZGlzY3Vzc2lvbiB3aXRoIHRoZSBkZXNpZ24pDQo+
DQo+IEZvciBhbGwgb3RoZXIgSVNQcyB3ZSd2ZSBiZWVuIHdvcmtpbmcgdG93YXJkcyB1c2luZyBz
dHJ1Y3R1cmVkIHBhcmFtZXRlcg0KPiBidWZmZXJzIHRvIHBhc3MgZGF0YSAtIGFuZCB3ZSd2ZSBi
ZWVuIG1ha2luZyB0aGF0IGZvcm1hdCBleHRlbnNpYmxlLA0KPiB3aGljaCBJIHRoaW5rIGNvdWxk
IGFsc28gYmUgYSBkZXNpZ24gdGhhdCBjYW4gYXBwbHkgdG8gc3RhdGlzdGljcy4NCg0KVGhhdCBz
b3VuZHMgZ3JlYXQgYW5kIHdlIGNhbiBjZXJ0YWlubHkgZXhwbG9yZSBhbGlnbmluZyB3aXRoIHRo
ZSANCnN0cnVjdHVyZWQgYnVmZmVycyBmb3IgaGlzdG9ncmFtIGRhdGEgYW5kIGFueSBvdGhlciBm
dXR1cmUgc3RhdGlzdGljcy4NCg0KVGhhbmtzLA0KDQpCYWxhDQoNCj4NCj4gVGhpcyB3b3VsZCBn
cmVhdGx5IHJlZHVjZSB0aGUgb3ZlcmhlYWQgb2YgbWFuYWdpbmcgJ29uZSBjb250cm9sIHBlcg0K
PiB2YWx1ZScgLi4uIG9yIHRoaW5ncyBsaWtlIHBhc3NpbmcgbGFyZ2UgdGFibGVzIChsaWtlIGEg
bGVucyBzaGFkaW5nDQo+IHRhYmxlIHBlcmhhcHMpIHRocm91Z2ggY29udHJvbHMuDQo+DQo+IC0t
DQo+IEtpZXJhbg0KDQoNCg==

