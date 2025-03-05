Return-Path: <linux-media+bounces-27606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6029DA4FDA1
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 12:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A27BE7A2BC8
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4FC233709;
	Wed,  5 Mar 2025 11:31:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020098.outbound.protection.outlook.com [52.101.227.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03F92E3381;
	Wed,  5 Mar 2025 11:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741174263; cv=fail; b=I/QDZVs2AeCj8fKU/Nm3vmVLSiIS69/CBoXU1gLlJCgDRzXkQVrcm+yfAVKM/kVolJesYDCSidnoxl7Lm3RdcdElr0Wgwym4Dw0Z/aDK9gBmq5uOH98idF6wVMKl7CAuT5kb7uympzk9OLKdO8ZFiKiTboU3myStRsv22+r7368=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741174263; c=relaxed/simple;
	bh=pgNRtKV2X95G2z37ZWLam6T4FQfjF7fcLJuUY05dx7E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=unDNMXYzP2uMW951iLZvE4r2ikYZ8HLP+mI1Qk/Mdno8j270ky0zmLVSxLquJXH04itUIzouh2mJS+Na8d8nSDdX7W6BFjootrjcIuV4ro0J/BjsUec6W7g/+SZmEppNYaOfauoQ/ukw+Ds6b/6SGweXOYIO3ilwn3ye0/bhmU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWHDN3b4nLb2txHL4VNmfLA7t5+Sq6Wm0hi3dMkg58A8dZm6SWBj2/1+uQTRNoVdoRiu1gqpjxi0INxOb4glkV2/7cpoJOVBSontE4N0tZMuwO5pAkIibU2obOPCN3tfcdlnp+y1cf00VnO2zwBi2MqKUD79NOEvKZbMpwL/kx3oULBsCjx/1gA+KvGzNrZ3S5YpiYbu2kaBhO5YVpfQhPdYgBVQyF8SA3KcDpyg5pJmOeIgSgXgh5Jz+Tm+yqA8/HbCph7m3wp2uoqa/5z7Jthk9uicKkrhpoiWGPaO7FRrJy+1ZNgEAx5PzBE16GLbiDug74pmH1AGaDVLgCmTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgNRtKV2X95G2z37ZWLam6T4FQfjF7fcLJuUY05dx7E=;
 b=ZsUYChMUCUovX9b6OR4PBRdLipi6/2B8vBv9t53bPdmTkGEvy5nltLaREql+3hA7/NjUn8TKa1bBjoT3CffFlI86/ZS+AZHBMkZAQq79Ovmaitptj9LQ5vdsrvRoc6zej0FoHOgleckMNzI/nL7W/ciTpXB78Vx11+HtIkh19h99qE51wHFUJdZ7ci2zK9TbQ9AaY/pRe+iU6OEqCPq7hoP54FeFb+Dneoo1td/12wizSvdue7Jz9NpkYrgXZBuc+5TGGeAkRFfr+FJW/ZS66KHCF8wXlKRT/7QcSaQJx7PzCA3EFrIJFiZPwYfQUtiU7GroksVDU1+CFGNpJhmWRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0855.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:132::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 11:30:57 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 11:30:57 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, shravan kumar
	<Shravan.Chippa@microchip.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
	"Valentina.FernandezAlanis@microchip.com"
	<valentina.fernandezalanis@microchip.com>, "Praveen.Kumar@microchip.com"
	<praveen.kumar@microchip.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p
 resolutions
Thread-Topic: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p
 resolutions
Thread-Index: AQHbjY3ybopw7eby3UKDaLaWcVfpRrNkSL0AgAANEQCAAAEK5YAABqoAgAACU+E=
Date: Wed, 5 Mar 2025 11:30:57 +0000
Message-ID:
 <PN3P287MB18296B77503988C14591C67E8BCB2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20250305051442.3716817-1-shravan.chippa@microchip.com>
 <20250305051442.3716817-5-shravan.chippa@microchip.com>
 <174116732611.2914008.9738053002324304147@ping.linuxembedded.co.uk>
 <PH0PR11MB5611988F18EF02394E983AA881CB2@PH0PR11MB5611.namprd11.prod.outlook.com>
 <PN3P287MB182928F331D4494E423BA3158BCB2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <174117178677.2914008.11448984679927360944@ping.linuxembedded.co.uk>
In-Reply-To:
 <174117178677.2914008.11448984679927360944@ping.linuxembedded.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB0855:EE_
x-ms-office365-filtering-correlation-id: 5f611c97-9d84-4239-4d73-08dd5bd932cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bEFWSkhxcmoxUnU3V1YxR3ZIZUgvTk5KZXFiZ3NWOUF6VzMrcGhZMmVsTm5G?=
 =?utf-8?B?a1RBZGlMUGJCYis3V1pTSCtLRml0VUdZOGhJaXZkTE5lM2N4bjJSYVpRWC9Q?=
 =?utf-8?B?WHphNVVHd3pGejVtWE1rMndrU0pwUjhrT1kxQksxcEprV1pIdGo0YkFmK3Vy?=
 =?utf-8?B?ZjZkZjZJTzdyZHh0TjczeWVyZHZ5b0swcmdOc3RvUGFBL292TnFzVXgzenlT?=
 =?utf-8?B?dlc2eDVXOXRFdHpqbEc5dnl5WDRCWUpQVHVrSnlQRElxZTJHQXNhR1NLSnRG?=
 =?utf-8?B?RUZxdFV2SEN0NUVMVWR0d3FUS2JtOTBSS3BuOEZhOHVRN3hkaDJnbnhrQnJ4?=
 =?utf-8?B?ZGRzNVZCaGlkM2VHdkFNd3ppMEVacjlGd25NN1JEekZFcXFjQkozR2tGcFRB?=
 =?utf-8?B?dWFZRVFUa2xENEJTK2NIM0tDc2ZGdXprS3c3Q2NsK1NXY3U0OXZpRUZqVFJY?=
 =?utf-8?B?dEE3WTY3aWVpWkxsbllOWkRJakpoQ2pPRGpoWDQrb3ZJVzN6bDN2Wmpzdjl5?=
 =?utf-8?B?eVlhQlhzczRweVQ1TnZFL2VSQWlFeWF6NzVwSlhsY2hUUG9keFZubGlZYXFv?=
 =?utf-8?B?ZTlsVTN6b2s5bXdQcTJWUzg5YmoyaWVVY2k5djJ5ZTNkUCtRaTgvSEV2UnJr?=
 =?utf-8?B?Y25aWEhBOTg3YjMwTHkvOWk2NENNMzlRbkQyZ1VwK3FTamJxa3VJd2FjOUFE?=
 =?utf-8?B?NFVSNHB1K1piMExUMitTdU96cTRTdkdMVHhObFRzN0IxLzJXMkFUVDdaV29n?=
 =?utf-8?B?dHdCUWlIVnZIb0x0akV2TkM1ZCt0MG0yQ3dpYVorUWd6SHV6ekxYb1dIZVFR?=
 =?utf-8?B?cWZmdzg5ai9FM2tFdE1paWhzM1RkR05GK1hjblJRK2xSeXJaYldFaWtWNEFS?=
 =?utf-8?B?N3UwYWk3TTJZWDJnOVFJUm5rYjA1QXJ5UjhXRGtkcWdYRTJyb0t2OG9iTEpF?=
 =?utf-8?B?L0pYTm9kQXhpRlVGNmhCMlhEdTdKRVpJSGo5VEQ2bnhiSzdKbWFLRUo2bldu?=
 =?utf-8?B?aEdvT3NrVXdpMnJNREpWOVZMTTFOR25mSEdQYmMzWmZKVnovaDQ1cWZPMVpv?=
 =?utf-8?B?NDEweTkzcHcyMlNla0ZaNTAyOGpHRHpXTWRCd0d6RmxCbDQ4UVB2NzFKUU9N?=
 =?utf-8?B?bk14WS9XVGRxMS8vYUZiY0pucytSSWpieDBYYnkyYkNlT0lSZS9mdXVCVlJ4?=
 =?utf-8?B?eUZjTjgzUW5Sa2NEOS9HVy9lSUxORlhLY3E5OU5adXlLZEMrOTRUaktnOFFq?=
 =?utf-8?B?TCtVSy91aUI2K2pmd2pkZDg1d2VzVHIzVXR1VlVqV3NzWjVGT1hId2loOWo0?=
 =?utf-8?B?dnRVKzJrR0xsUm5wRU4rQ0NBWjlXdFdYdEZHc3FLV0JyNVRFWjlWVU93aWVR?=
 =?utf-8?B?c2s0ZXlUY29WKzhiakpYYWd2OFZycnhjTXdmTW9NUXFUN1R2RGlzMHFyNEcy?=
 =?utf-8?B?b3RYYUNVMUxtSS9Pbkk4UW9EZm9US2w1Y1NWRHNsQlR0ZWQrMWhMbGhvbmNt?=
 =?utf-8?B?U0Q2U1pYR2V1eXVPWEs5V3NTRE1XUGV3ODlwcGlrcllvcGZtcjhHU0hTQ29N?=
 =?utf-8?B?cTlYOU8reFYzNVlkcXJockNZWlhGeDdzNXI0dkN2MUVMNENQbDVGNEVrNEVu?=
 =?utf-8?B?dDBYRDI4QkFSbUk1cGd1RnpCM3Q1UkZtN3ZLc05kVUd0d042YzFQbTFDK2lW?=
 =?utf-8?B?S3NVK0FMY1FXNnY4RHVBY3BnbmIrZDhBRGozTVBPVXloWUIyNzdleVVhYzFZ?=
 =?utf-8?B?ZGxYOURLVkIydGZtK0NUUFBHdm5WRGowQy8zTklCeGJ4KzczVjlNbkNzbVh3?=
 =?utf-8?B?QjNLSXRVQ0ZIdEN6Um1IaVV4Y1hmTUFFK2xZNUZ0dWhQRTRaU1hzVlNVZWxx?=
 =?utf-8?B?dXgvMkE1WmdiYnlSSCtEUDllSW1qeWs3Q3lna1dxOThESEFFcCtOV1BWMkF1?=
 =?utf-8?Q?4a7mtoZZLTAIwNnSNxu1SOybzaS/6q8K?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWJ5NFdPamNQUmZwSkZvQ3p3YkN5V3VJbXgvU3N0eWMrM0VHWEpIZTBFZitm?=
 =?utf-8?B?aXBiaHltWFhYK0x4Y2d5TDR4azdIVjdkRE11VFdodGMyd0NXQ2w0QXRQUmlq?=
 =?utf-8?B?Z0NiNVVWcnRJN3JUWGdkMXIxVWJEM2lyZE0wRGNZckNMSWZtTTcrK3hXY1RB?=
 =?utf-8?B?eHBKLytMcTRZUFVUM01LU2NibFMwemtSYUxENFV1ZjMvajZQeUNORmlZcThP?=
 =?utf-8?B?MkdCQzNUT3hHSUFKUWUrUWhCcmNmSXpnd0g1UkJqY2M3a0k5U0Eya2tUdWRJ?=
 =?utf-8?B?QzVTUGZyUzVGQWpvT1orVUpOMGRIMTBNck1EYjA2VS9XT3dkai9rWlE2d2NJ?=
 =?utf-8?B?bE1ielJSZFVHWUQ1RW11RzBDTFJrUmtybDIzOVFrWXVXbDRiWlZRNXhscXFo?=
 =?utf-8?B?TE4wdDBicWlnTFJXYm9jci9rUzNDVHpTN0hiM3lrd3lycXFueFJjRnZvYnB0?=
 =?utf-8?B?TFdHVk13VUlhMEhsalNQWFBnc1NrdkVmcjZITlZXY3NoT0lyWGtSdUFxQjNJ?=
 =?utf-8?B?ei8ydGlCM0QvcFNkS0FxWGVYbk5XUjhoMmcrUG84V3JSKzhlYkV1Uzc1OG80?=
 =?utf-8?B?T3ZnSWdYdlFCVytJR05GUTNmSHpOam9tNTRIRWtORUxPVVRPUSszY1FsOVVE?=
 =?utf-8?B?MFdVWjNyZTNGRFdyS3VzL29iZFlWRHVvdFl4TEFPbmlJWXJOMzZ6dm43SEht?=
 =?utf-8?B?ZnUzazNNOG1JMFJyUjMyVGpqM2EzVWU2OHZWNmNMeW1PajZqc0FtNnQ5MDlU?=
 =?utf-8?B?dzdtQ085MGkwSDVLRzRHTnZrNC9TQmkraXNvT2FaWW0yZWMvVXJQdjdlZ3pW?=
 =?utf-8?B?VFVra0l0cU1LNkZ5U2lQVytsSG5jVTlsdkwwZFZ2YTh6eTBRUDZwVjBUVHJ6?=
 =?utf-8?B?OGdqb2M1NElPQ0luWlZPUGR3ZFkxcDE0L3NjQVYrWGxWUkowS201ZENqdHpi?=
 =?utf-8?B?Z3ZGS011TUV0QnhYVUs4NGVPeU1mTHQxVEFMNHczK0NaVjFsdi9KYzlOZm9H?=
 =?utf-8?B?Wm5PSS9iNUJ5cllWaUxLTW8vSmNONkQxZFdWa0dkRzdsbDFJR3VPRWwyeTdZ?=
 =?utf-8?B?SVhIdStMTnVNcUtOenVEYVVBUFFHcUZ2VUtXLzBxQW4yaWlxWVZMZDRudUJl?=
 =?utf-8?B?T3RXeURKTk9iZ0paM29SMmx0Mmx3OGFnWnFETUVBVnIyNmR2aXV4RVZxSncv?=
 =?utf-8?B?a2FZOWkrcmJhM1E2eWVQUnlteUo3Z2M4ejJOOXk1RThQcWdsSEFXUjJ4cC9S?=
 =?utf-8?B?a3lJSkFuSWRldDcyNzNJcXNFTjRPRlJiR2F2KzFGbkl3U2NxRS9vMG5MNUlt?=
 =?utf-8?B?dGhiUTN4aXpzVUNLTjZSblVsZnFlaDNDSDRBZWFnWGtpQWcrRnNvQlhUUTYz?=
 =?utf-8?B?d1ptSTRVdFdkdVhZVG5IQUVCbk9kZHc5akliQU41UitTRjlXZFVmZVBZVmlE?=
 =?utf-8?B?ZUNRNGZDTXA4blNtUlorTVhUWERFc2oxMnQ5cWE0SHNNN3VxamVlNEJ6VGdP?=
 =?utf-8?B?QUE1MnZtRDlmU1BCVE1LYXpRUVk4WSt2SXFpRzF1dlBGMVVheWlyanlTbFRz?=
 =?utf-8?B?L3A2MzRtd0ZxcWxkM3RpTHRUakRVWVVvYlVoTDRWeXAvTEdRbXJHdWtPV2xM?=
 =?utf-8?B?dGpCN1Mxd3F0QlEyT1ZtZzNBY0JqbHVjelVEdFcxOHJZZ3FmeXV4Y3pRbkV1?=
 =?utf-8?B?UEJWQkJmeXRWVHhOSVlZamZCWmdtVDIwdjJaeDVFRnZOb1hxU3lLM2M5bWds?=
 =?utf-8?B?NWlSeWlXa2RaVDFWVzZQMGhSSWdZZ0N6NUllTjVabExLRVdraC80OGV6ZjZ2?=
 =?utf-8?B?YThIMm9TazJrdWRTM0dsQ0xsZGUxamErMlFHTnYvbHZZc3d0aWoyeDdkU0ZI?=
 =?utf-8?B?T0xSYmEwazJWcDFQQWsxYWU1Y2hQOUpNMkJmWW8vTUM5d0xQaEpNbjRnaXhO?=
 =?utf-8?B?UnZSbFJXMTNMMHJkd2loakQ3Z2ZhZnhRU1A4Z21TNk92d0dUaDl6VTJORlpC?=
 =?utf-8?B?YVpHd2hqelc2Rk1CbzB3ODhsYmRoTlorYTFSODdrNmNnakJ6QzRLb3hIaWYy?=
 =?utf-8?B?YUdmS1g4c1JLK2hDVVE2MnFQV1JUSWE4bFVZK2lXK2VEUUlKd0Z6cDZuSkQw?=
 =?utf-8?B?M3Y3N1R6RFIxd09rOCtVa0RhaTVoUVJnalZBeWh1VFY5SzJZZEErK29JcUFX?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f611c97-9d84-4239-4d73-08dd5bd932cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 11:30:57.4463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: viy9+QWMC7jYmNbbnZLlabME/iaeaFaMNChfM5raHfL1dl1FzzEaIKpcIS3fIzEiD2HWMO9CcEmxMq6oxRhceonUNB27nMfE8/uoOTrz7bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0855

PiBRdW90aW5nIFRhcmFuZyBSYXZhbCAoMjAyNS0wMy0wNSAxMDo0MDoxOCkKPiA+IEhpIEtpZXJh
biwgU2hyYXZhbgo+ID4KPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiA+
IEZyb206IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbUBpZGVhc29uYm9hcmQuY29tPgo+
ID4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggNSwgMjAyNSAzOjA1IFBNCj4gPiA+ID4gVG86
IG1jaGVoYWJAa2VybmVsLm9yZzsgc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbTsgc2hyYXZh
biBDaGlwcGEgLQo+ID4gPiA+IEkzNTA4OCA8U2hyYXZhbi5DaGlwcGFAbWljcm9jaGlwLmNvbT4K
PiA+ID4gPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBDb25vciBEb29sZXkKPiA+ID4gPiAtIE01MjY5MSA8Q29ub3IuRG9vbGV5
QG1pY3JvY2hpcC5jb20+OyBWYWxlbnRpbmEgRmVybmFuZGV6IEFsYW5pcyAtCj4gPiA+ID4gTTYz
MjM5IDxWYWxlbnRpbmEuRmVybmFuZGV6QWxhbmlzQG1pY3JvY2hpcC5jb20+OyBQcmF2ZWVuIEt1
bWFyIC0KPiA+ID4gPiBJMzA3MTggPFByYXZlZW4uS3VtYXJAbWljcm9jaGlwLmNvbT47IHNocmF2
YW4gQ2hpcHBhIC0gSTM1MDg4Cj4gPiA+ID4gPFNocmF2YW4uQ2hpcHBhQG1pY3JvY2hpcC5jb20+
Cj4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCBWNyA0LzRdIG1lZGlhOiBpMmM6IGlteDMzNDog
YWRkIG1vZGVzIGZvciA3MjBwIGFuZCA0ODBwCj4gPiA+ID4gcmVzb2x1dGlvbnMKPiA+ID4gPgo+
ID4gPiA+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91IGtub3cgdGhlCj4gPiA+ID4gY29udGVudCBpcyBzYWZlCj4gPiA+ID4K
PiA+ID4gPiBRdW90aW5nIHNocmF2YW4ga3VtYXIgKDIwMjUtMDMtMDUgMDU6MTQ6NDIpCj4gPiA+
ID4gPiBGcm9tOiBTaHJhdmFuIENoaXBwYSA8c2hyYXZhbi5jaGlwcGFAbWljcm9jaGlwLmNvbT4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBBZGRlZCBzdXBwb3J0IGZvciAxMjgweDcyMEAzMCBhbmQgNjQw
eDQ4MEAzMCByZXNvbHV0aW9ucwo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFNo
cmF2YW4gQ2hpcHBhIDxzaHJhdmFuLmNoaXBwYUBtaWNyb2NoaXAuY29tPgo+ID4gPiA+ID4gLS0t
Cj4gPiA+ID4gPu+/vSBkcml2ZXJzL21lZGlhL2kyYy9pbXgzMzQuYyB8IDY2Cj4gPiA+ID4gPiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ID7vv70gMSBmaWxl
IGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKykKPiA+ID4gPiA+Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZWRpYS9pMmMvaW14MzM0LmMgYi9kcml2ZXJzL21lZGlhL2kyYy9pbXgzMzQu
Ywo+ID4gPiA+ID4gaW5kZXggYTdjMGJkMzhjOWI4Li44Y2QxZWVjZDAxNDMgMTAwNjQ0Cj4gPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9pbXgzMzQuYwo+ID4gPiA+ID4gKysrIGIvZHJp
dmVycy9tZWRpYS9pMmMvaW14MzM0LmMKPiA+ID4gPiA+IEBAIC0zMTQsNiArMzE0LDQ2IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgaW14MzM0X3JlZwo+ID4gPiA+ID4gY29tbW9uX21vZGVfcmVnc1td
ID0gewo+ID4gPiA+ID7vv73vv73vv73vv73vv73vv73vv73vv70gezB4MzAwMiwgMHgwMH0sCj4g
PiA+ID4gPu+/vSB9Owo+ID4gPiA+ID4KPiA+ID4gPiA+ICsvKiBTZW5zb3IgbW9kZSByZWdpc3Rl
cnMgZm9yIDY0MHg0ODBAMzBmcHMgKi8gc3RhdGljIGNvbnN0IHN0cnVjdAo+ID4gPiA+ID4gK2lt
eDMzNF9yZWcgbW9kZV82NDB4NDgwX3JlZ3NbXSA9IHsKPiA+ID4gPiA+ICvvv73vv73vv73vv73v
v73vv70gezB4MzAyYywgMHg3MH0sCj4gPiA+ID4gPiAr77+977+977+977+977+977+9IHsweDMw
MmQsIDB4MDZ9LAo+ID4gPiA+Cj4gPiA+ID4gVGhlc2UgdHdvIGFyZSBhIHNpbmdsZSAxNiBiaXQg
cmVnaXN0ZXIgSFRSSU1NSU5HX1NUQVJUID0gMTY0OAo+ID4gPiA+Cj4gPiA+ID4gPiAr77+977+9
77+977+977+977+9IHsweDMwMmUsIDB4ODB9LAo+ID4gPiA+ID4gK++/ve+/ve+/ve+/ve+/ve+/
vSB7MHgzMDJmLCAweDAyfSwKPiA+ID4gPgo+ID4gPiA+IFRoZXNlIHR3byBhcmUgYSBzaW5nbGUg
MTYgYml0IHJlZ2lzdGVyIEhOVU0gPSA2NDAKPiA+ID4gPgo+ID4gPiA+ID4gK++/ve+/ve+/ve+/
ve+/ve+/vSB7MHgzMDc0LCAweDQ4fSwKPiA+ID4gPiA+ICvvv73vv73vv73vv73vv73vv70gezB4
MzA3NSwgMHgwN30sCj4gPiA+ID4KPiA+ID4gPiBUaGVzZSB0d28gYXJlIGEgc2luZ2xlIDE2IGJp
dCAod2VsbCwgMTIgYml0IHZhbHVlKSBBUkVBM19TVF9BRFJfMSA9IDE4NjQKPiA+ID4gPgo+ID4g
PiA+ID4gK++/ve+/ve+/ve+/ve+/ve+/vSB7MHgzMDhlLCAweDQ5fSwKPiA+ID4gPiA+ICvvv73v
v73vv73vv73vv73vv70gezB4MzA4ZiwgMHgwN30sCj4gPiA+ID4KPiA+ID4gPiBUaGVzZSB0d28g
YXJlIGEgc2luZ2xlIDE2IGJpdCByZWdpc3RlciBBUkVBM19TVF9BRFJfMiA9IDE4NjUKPiA+ID4g
Pgo+ID4gPiA+ID4gK++/ve+/ve+/ve+/ve+/ve+/vSB7MHgzMDc2LCAweGUwfSwKPiA+ID4gPiA+
ICvvv73vv73vv73vv73vv73vv70gezB4MzA3NywgMHgwMX0sCj4gPiA+ID4KPiA+ID4gPiBUaGVz
ZSB0d28gYXJlIGEgc2luZ2xlIDE2IGJpdCByZWdpc3RlciBBUkVBM19XSURUSF8xID0gNDgwCj4g
PiA+ID4KPiA+ID4gPiA+ICvvv73vv73vv73vv73vv73vv70gezB4MzA5MCwgMHhlMH0sCj4gPiA+
ID4gPiAr77+977+977+977+977+977+9IHsweDMwOTEsIDB4MDF9LAo+ID4gPiA+Cj4gPiA+ID4g
VGhlc2UgdHdvIGFyZSBhIHNpbmdsZSAxNiBiaXQgcmVnaXN0ZXIgQVJFQTNfV0lEVEhfMiA9IDQ4
MAo+ID4gPiA+Cj4gPiA+ID4gPiAr77+977+977+977+977+977+9IHsweDMzMDgsIDB4ZTB9LAo+
ID4gPiA+ID4gK++/ve+/ve+/ve+/ve+/ve+/vSB7MHgzMzA5LCAweDAxfSwKPiA+ID4gPgo+ID4g
PiA+IFRoZXNlIHR3byBhcmUgYSBzaW5nbGUgMTYgYml0IHJlZ2lzdGVyIFlfT1VUX1NJWkUKPiA+
ID4gPgo+ID4gPiA+IERvbid0IHlvdSB0aGluawo+ID4gPiA+77+977+977+977+977+977+977+9
77+9IHsgWV9PVVRfU0laRSwgNDgwIH0sCj4gPiA+ID4KPiA+ID4gPiBJcyBzbyBtdWNoIG1vcmUg
cmVhZGFibGUgYW5kIGVhc2llciB0byBjb21wcmVoZW5kIGFuZCBtYWludGFpbj8KPiA+ID4gPgo+
ID4gPiA+Cj4gPiA+ID4gPiAr77+977+977+977+977+977+9IHsweDMwZDgsIDB4MzB9LAo+ID4g
PiA+ID4gK++/ve+/ve+/ve+/ve+/ve+/vSB7MHgzMGQ5LCAweDBifSwKPiA+ID4gPgo+ID4gPiA+
IFRoZXNlIHR3byBhcmUgYSBzaW5nbGUgMTYgYml0IHJlZ2lzdGVyIFVOUkVBRF9FRF9BRFIgPSAy
ODY0Cj4gPiA+ID4KPiA+ID4gPiA+ICt9Owo+ID4gPiA+Cj4gPiA+ID4gSSdtIHN0aWxsIHNhZCB0
aGF0IHdlIGNhbiBhbGwga25vdyB0aGUgbmFtZXMgb2YgYWxsIHRoZXNlIHJlZ2lzdGVycyBhbmQg
eWV0IHRoaXMKPiA+ID4gPiBpcyB3cml0aW5nIG5ldyB0YWJsZXMgb2YgaGV4IHZhbHVlcy4KPiA+
ID4KPiA+ID4gRG8geW91IHdhbnQgbWUgdXNlIGNhbGwgbGlrZSBiZWxsb3cgQVBJIHdpdGggcmVn
aXN0ZXIgbmFtZXM6Cj4gPiA+IENDSV9SRUcxNl9MRSgweDMwZDgpOwo+ID4gPiBjY2lfd3JpdGUo
KTsKPiA+ID4gY2NpX211bHRpX3JlZ193cml0ZSgpOwo+ID4gPiBkZXZtX2NjaV9yZWdtYXBfaW5p
dF9pMmMoKTsKPiA+Cj4gPiBJIGhhdmUgbWFkZSBhIHBhdGNoIHNlcmllcyBmb3IgdGhpcyBzZW5z
b3IgZHJpdmVyJ3MgaW1wcm92ZW1lbnQsIGluIHdoaWNoCj4gPiBJIGFkZGVkIHRoZSBWNEwyIEND
SSBoZWxwZXIuCj4gPgo+IAo+IEhhcyBpdCBiZWVuIHBvc3RlZCB5ZXQgPwoKTm90IHlldC4KCkFz
IG1lbnRpb25lZCBiZWxvdywgSSBhbSB3YWl0aW5nIGZvciB0aGlzIHBhdGNoIHNlcmllcyB0byBi
ZSBhcHBsaWVkLgoKQmVzdCBSZWdhcmRzLApUYXJhbmcKCj4gPiBJIGFtIGp1c3Qgd2FpdGluZyBm
b3IgdGhpcyBwYXRjaCBzZXJpZXMgdG8gYmUgYXBwbGllZCBzbyBJIGNhbiBzZW5kIG15Cj4gPiBj
aGFuZ2VzIG9uIHRvcCBvZiBpdC4KPiAKPiBJZiB0aGUgY29udmVyc2lvbiB3aWxsIGhhcHBlbiBh
ZnRlciBJJ20gZmluZSB3aXRoIHRoYXQgLSBidXQgaXQgd2lsbAo+IG5lZWQgdG8gYmUgdGVzdGVk
IGJ5IHNvbWVvbmUgd2l0aCB0aGUgaGFyZHdhcmUuIENoYW5naW5nIHRvIENDSSByZWdzIGNhbgo+
IGhhdmUgaW1wYWN0cyB0aGF0IGFyZSBoYXJkIHRvIGNhdGNoIHVubGVzcyB5b3UgcmVhbGx5IGNo
ZWNrIGFuZCByZS10ZXN0Cj4gdGhlIGRyaXZlciAtIHNvIFNocmF2YW4gaXMgYmVzdCBwbGFjZWQg
aWYgaGUgaXMgYWN0aXZlbHkgd29ya2luZyBvbiB0aGUKPiBzZW5zb3IuCj4KPiBQZXJzb25hbGx5
IC0gSSB3b3VsZCBsaWtlIHRvIHNlZSB0aGUgQ0NJIGNvbnZlcnNpb24gaGFwcGVuICpmaXJzdCog
YW5kCj4gdGhlbiBTaHJhdmFuJ3MgY2hhbmdlcyBnbyBvbiB0b3Agb2YgdGhhdCAhIEl0IHdvdWxk
IGJlIC9mYXIvIG1vcmUKPiByZXZpZXdhYmxlIGFuZCByZWFkYWJsZSB0aGF0IHdheS4KPiAKPiAo
QW5kIHdlJ2QgaGF2ZSBtb3JlIGNvbmZpZGVuY2UgdGhhdCBTaHJhdmFuIHdpbGwgaGF2ZSB0ZXN0
ZWQgdGhlIGZ1bGwKPiBDQ0kgaW1wbGVtZW50YXRpb24gb24gdGhhdCB2ZXJzaW9uKS4KPgo+IC0t
Cj4gS2llcmFuCg==

