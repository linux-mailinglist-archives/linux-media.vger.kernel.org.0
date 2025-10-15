Return-Path: <linux-media+bounces-44517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 837ADBDCBFB
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 08:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DA6A134F0C9
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 06:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40883128D9;
	Wed, 15 Oct 2025 06:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="yMQfWOW4"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010039.outbound.protection.outlook.com [52.101.85.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630E3311C13;
	Wed, 15 Oct 2025 06:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760510015; cv=fail; b=XEFE7dA1UfgbGlJX3UcFd8Fe3u7nsiYIswvpRCj6ObffrgDsZQ1CGX+m0rIekmqlGb4uOIRJGnDXbb1zqv3xEaVbBkgPbIYYdYE3C83Ej7OCZbghhY6zDNpOTtYoy2FlBTsjFnM26mDGVbqALug26KOz8QMwbA2Xe+X2peJ3I3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760510015; c=relaxed/simple;
	bh=B/dwvVmL5LHbGEEwLWgbrMin13OMSKrGuYaTOz/tiRg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UmO2d6BE8NHnl7bbxByqCmB2YXFvEPny7yZyV8Nn+5sZ+pdK97TwLJiap22nviUE22veF886ZiYy0fd7tBRaPG6a+QiR/3sSOajTK5Mv2D3jBKeo0DQdROxwyyMSoG5IRjH8VL3b/hYl88LhKuHaP5BVSR1tcG8eEPqtGoMpGx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=yMQfWOW4; arc=fail smtp.client-ip=52.101.85.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAiUbKt4gV4V4YDA+XLZW746RDzhrf8Zcqk3ykx9+bGSNUOWZ0ktPFdV1AO28hQZDJLLx0h4g3XhMiQuPKiWBWps+f5uFSmF8WuWp4KFwJMfEucinqJAFNMsq5yGRjGhEVTyvQBZDeZnIE1HCb7hJc+FoTsyvx2JUSiIE50Q3UeyVQ4CGFRSr+Vy3j8Hx6a1FprjUitUTHZsPMWqIsHyB5V8dtINX/VFL5UIG3G8k5IQDsm+GJexH4NRzZ4UYpzRQlvMucnIGL5ruNrOz38MiM689zobusG0JQhf0PvD19d92ro/EhJZqJP2mi1ZrA1S+xrP+B/omj3K0ZFPFhQ8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/dwvVmL5LHbGEEwLWgbrMin13OMSKrGuYaTOz/tiRg=;
 b=QTi++b/TPShrK0QY418kl8TTWApq0zz81YJC/mLDbblwjkQSRpAqyaKRfcFn81yfnhs3qAoIACnIaxToHWPaiCumq3E7n+biRfvsHO4N8OkvLX9RuyAjwo7fGVR6WKmsLjAws8ofJny3Zhs0B2FhfbE8vPYEOoBTZ8AcEHonbRCC6LysT5xmNx78iLhzoxIppG6FAErrahHAAY8KgbNIPnqQ1DhlyidmV50Q1DFGz3hShnTyHFMZS1rvYryOmeotBGhq2qZ/lgqO6TiLQV0qKa76Mnm7NqBWIwTL6Rl4qhEA/Mm/glz0HgQzI79tKhk6BlxqPZ488Dm86cJPFmaIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/dwvVmL5LHbGEEwLWgbrMin13OMSKrGuYaTOz/tiRg=;
 b=yMQfWOW4Y1YuEKrxVBSd5pvhnW/Sf09+UvTs7DCvB8R9DEj5ENfZipjmCGkGXMJDEAdUULioQeyoyYUOupqU3y3I+UkjoVVzvNw9PSTL2mYh6werxw2ddMEmrtdeEn0vbJ7zMhAkje03v/mIZXUvsz0TqzVk3CUFMwRS5vx763SPoCxv9caZzxqqLGyy23vV3aiCXlPm7UysHOiKA8DciP6X9bEbYOJSq/bBkFq8Qe8yj36jOzPY2wkMv7MBKoorUzHbE5gWIEoU78W9AYjLPBo4O7SaiNQRg3hWskE8vT54YuV/1Eyv+nl0/1Ekrl3nISxtX9H7jgbrfmuH5JyOww==
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 06:33:29 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 06:33:29 +0000
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
Thread-Index: AQHcOTTZ/S2f3ojywkq2aD8kAxrouLS6P1OAgADMHoCAB71IAA==
Date: Wed, 15 Oct 2025 06:33:29 +0000
Message-ID: <54d623e2-f883-4113-9b89-be34a556e708@microchip.com>
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
x-ms-traffictypediagnostic: MN0PR11MB6231:EE_|SA1PR11MB6758:EE_
x-ms-office365-filtering-correlation-id: 61dca967-d8aa-4ab4-9eca-08de0bb4c14e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dktHVkpqeFAvemltMUxKT1hhWWxWaGJSdzhWUkhRUDNVaHNsZitoMnk3SzBN?=
 =?utf-8?B?QWRZWGdrYi8xa2pkSFJTcUN6a0tSQmNQUGNETitNRGlQVE14SFcrVnQzNjRM?=
 =?utf-8?B?OWFKN2Y4bDNUQmJvK0pyRnluVUdvRnlZRDZOMkpKNUd4OW45VkZnakNIY0FX?=
 =?utf-8?B?MGFTS05jdTV0a2ZZWnJ3ZndmWUxPcE9IbHNmemM0NnE4Mk01OUZJa0REaEVx?=
 =?utf-8?B?UmtYTTZkUyt1dVRGb2wwanBaWnBOYThvM1RDMTg2RHU2TytCVU5KbEtmcEpl?=
 =?utf-8?B?RVJ5NldhMW1ScGVwMCtUWnZjSm0wY2ZCQzRaNkFXc2o5bGdqd04vTGJ3cUY1?=
 =?utf-8?B?U0xmeFo5WWwwaXJxQjE5aDlmQS9wUmszT0FSUnFYTFFPM3RValh5aTBvZ0FY?=
 =?utf-8?B?UG5XQ0I3VnN3eWU0TG9YdXd2R3ZhSFRGT2RSc2tOanpBYWFYYTc4L2ZLNmpq?=
 =?utf-8?B?TlV0OUlaazEzZzNacWd5OTRDZnVEc1p4MTV5RFlhOHUySkZLSkcrWlZhNVRM?=
 =?utf-8?B?eHVsNWJXSzdDcFQxL05qMHJtai80N3BiY0RlMHVqUXY2dHd4NkVCdm95Skx5?=
 =?utf-8?B?dzR1aUNlMDdwak5pZUV1Uld4Z1ZOYnFTckd4M05NRW9aYTl6SGFsZVV1ZllV?=
 =?utf-8?B?NzNqaHFhalkrTVNhY2dEWm5EbVZjdHVLZWVRdWtJNTM5SHR3TUZKeDdacXJ1?=
 =?utf-8?B?OCtCN2pqNzFWbndCOUJ6MGVRNDNVeGd2d1FlZG1BRmVSb1dEWmZFdzRRN2kz?=
 =?utf-8?B?aVBzU3V5VFFGbjQ3anEvNld5SUNvMVlVS2QwREVMQ3Uya2lCeTQzVVVPM3BT?=
 =?utf-8?B?RVU1YWgvay9NYXdjRjN3NzE5cGIyWkpGT3REb1JQRG5TSjVLQm1YcGJ4dWpn?=
 =?utf-8?B?RmtDVk95ejJ2UUxaNUhnSzZIU0ptdi9oSndaQjlIMXlEeE80eGR2cmNxd1dm?=
 =?utf-8?B?OFEzWEdxRkZHaU81UFJ4K2lzcUpBdXl3aGs1SHBZRDdNNmthZUhPUWRGaDZ5?=
 =?utf-8?B?bERpallISkp4K1Q4QXRqT2RkaUJDYU5sMkozanVIU2xia3c3OXNHbWtOelFD?=
 =?utf-8?B?ZytuVDJDV20yMEgyMGdzS3hEamxCTlhHTDBHSnRtNm8yc1JQQmpuWHVKOHV4?=
 =?utf-8?B?bUN1SEZRb09vZnhvYXJqTmFDSXJBNXB4clRadjE1cGJvcm5kY3A3K3dXRUZ2?=
 =?utf-8?B?aGdMT2JmWFQrVWRQZXJ3ZnRBMUYyN1h0a1RaZmpLa3RXRXRnOVFzUE4xU2Qr?=
 =?utf-8?B?MlBUNTR5NWlqZjFvS3JCbmk2S29lMEVXdTlDdWR1YVVlMmx2UTdPS24yYjYz?=
 =?utf-8?B?aVdXd2RCS09rUWhFUy9PWk1rb2poaGlaNWo3ZlFnWnoxbERWVTlJVmx5Y1pU?=
 =?utf-8?B?ZUlqYUJQMmRjQXQrMzg2RnEzZlNKd0N2bWhtVG41NkNIdHpEMWo2Z0tKek1T?=
 =?utf-8?B?MzB1TjArSGFOQ1BSeDRHM2tHR2NINnkzRzZpb09YOHdjTVdKM29WWDNRN0Jz?=
 =?utf-8?B?QU1ScklDbkFvRXQrMW9hRmpiWXczcEFub0pseHFPU1lMc0phZzBBRXJsdDBR?=
 =?utf-8?B?eGFmMTd5N05NRVNjNEo5ODV4RWZPSHJ3eDZrUFVPcDlBRituWmlIcGx5QmpL?=
 =?utf-8?B?MkpSRkFlSXJ1OHA5eEFqREZjR1BhU2oxMW5KUlBRVUhmcHpneHI0dmVnU0hY?=
 =?utf-8?B?MXpvQktHcHlvTWFzNXN4ald3Q2w0MFNZaERvSVZudWdwUkZJZHZmSC91ZXhX?=
 =?utf-8?B?bWZESTFFRTZsY1pYanBhOTFzNUJuMDI4SW9sdHdhYTRPbTU0aXpQT2pQZjNT?=
 =?utf-8?B?S0pSS2JSTmk2UzFZM1VWRFZ2NjhQVVFBM0hvWVEvanFYaUNkdVI4NVJDdjdV?=
 =?utf-8?B?VVNrelZoemZjdG1xbHlickduS3lYamJ0RjhUR2R0bVVyenhrNjNxVUIzMjJt?=
 =?utf-8?B?RXBPVzFPTGcrQWl5UEdGVXRwOGQ5TksxYVRWV0lSZmVqekFZR0pXcFNPMVov?=
 =?utf-8?B?RTI3WDJEYzZSTDJDSnQwaXFmQ1RhUXU4ejA1YWxMV2E1YVVtSnNLMUhyS3RV?=
 =?utf-8?Q?DkIV19?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHdVUTFjYkUvL3NyZyt3NTFjbHFTK1NtSDRGRXlZdHVrRlNZQzFmQUhIQk1P?=
 =?utf-8?B?TVpHN1pFTFNmcUpaTGl5R2JmZ0ZubkFDZGVVeC8rNnkvbU9RRmpvVWtzT3N0?=
 =?utf-8?B?OWMxVnhCeUdDcXQydkd2WnlScTdzenJ3Tk03ZGlkWVRDT3BQUldaMnExYVlF?=
 =?utf-8?B?anhFZmsxUVN4Z2JYL2xIUjIydmdVckJGU1Z0UnhGOHZmYmFVdUcrR01KSUNn?=
 =?utf-8?B?RzhHT29EZTBzWHhNdDBtbGJzUjc4aEg4NUlxb05CSDZocEtOaDIwZGszRHBG?=
 =?utf-8?B?Q1NSRTQ5RVBCbWdMUmcxU1VCcWxLV2Q3OG4zVjFJTDB5dTcvT2xaQVpOTGdG?=
 =?utf-8?B?OEpCcURnWFI5SDhnc0IvQ2t5VFQ0ejQ0bE12aGtQOFQxUUhhdnRSb3JYV2Zs?=
 =?utf-8?B?dVd3R1huTDh6YTdYclZSaEZYMDVPZGJYMWlEc0VrSGtRMU1HdHdrQmFPYUV0?=
 =?utf-8?B?aVR5L1M0QnhJeThRcXVOMDNKS1U4OWJVSW1DVWIzM29wTEF2L3VjZnJzelU0?=
 =?utf-8?B?emg3ejk2T09IVFlMVWc3V3JpMlEwdnhxTkpSQ0Jha29oSDBHZWNjMEk1TG42?=
 =?utf-8?B?cTV4K05QVHdNSHo3YTdMb0MxV0RMTXUwTXJMNVV0Sld2TThTWXVoMUJnTTl4?=
 =?utf-8?B?U3FQK3hmd0V4TUdtY2dBL24va2VkQURHUmNlSHF6a0w4Z0lpR29Ub0FXa0gx?=
 =?utf-8?B?Y3gxaTN5VTJMcDVVR2x6YmhnUnVUMHlPb0k0T1BRL0xlV0VMTGx5bXV3c21t?=
 =?utf-8?B?VjVVYW1helg0WkdLRXlwYXFOUytUbkVWMzllUnl2MU1qL1dOMzlWMHd4bjVD?=
 =?utf-8?B?UEZYcWlFRVhZNWhVNnJ0VCtURE9nWVNBYkhSU3dwRk9WVkhHRjBjVks2RXFJ?=
 =?utf-8?B?NHd2aUFzTVBJdzcycStmbnpaVUdmOTFsS2dxemFQc3ROQWdIRHczbzEyU3Vi?=
 =?utf-8?B?TjdzK2djZXEzdkhucmFuQkNLdUpLblUwYWNsd1k0T0xOdnZRSnMyODVDcE5j?=
 =?utf-8?B?WnlsZkFkdUttZ0ZDYzBZM3grK0NDcWpDZ1pzSjhSbTdSZmpuZktNUC9YTXMr?=
 =?utf-8?B?dEU2R0grZkpYQWlaajVyUVJ6OW96bFdJT3ZLZlIrdXNIUmJMTjYvc01oMmcy?=
 =?utf-8?B?a0Jzc1FUNnFQa0NVU0dBNXRkMVBBelEwYklJa2g3eHlTQkd2NkQ3YlFhYy9X?=
 =?utf-8?B?eU43K2FyVkNLd2lkUUNpT2U3R05MdmdFQWkzSVRUeEVOeWRLUlpCSzcrY0l3?=
 =?utf-8?B?eTdHU1ZsT3IybVJFSllNTUtYN1A1dkFjSFJUdGlqc0xhNE1uODBtZGJvUWlw?=
 =?utf-8?B?UFp3Q3V5TERKc24rMFcwVTlxdkZ3aWxONGM4akp6V0o2eGo3MW9CeElmb2d0?=
 =?utf-8?B?QVNaVGl4L1E1WTVVNjJwZkphZDdRekR2TXNGWXMzQzVsdDJ6cnU0bXBEUzlC?=
 =?utf-8?B?TTZkYzdlWTg2Nzg2REd3N3VtUm5Kb2Npcyt0MmNiSS9tRmpBdkJSTTRZU0VR?=
 =?utf-8?B?bG45RlFpWEJtcWcwQ2g2Y1R4U1ZNSUhPdDBaSG1URTYyWVFrbElaZ2xrYUd4?=
 =?utf-8?B?NnRMeGdlZzErN2hQcUFDUkxCampHL1NvK21QNGNMYkp3UEJvYzIvblVtU1lr?=
 =?utf-8?B?N1dIbm50eDI2RjJUMnVNWlB0RnZjdmZzTzFVdi80N2VTRXVnellNaVhKb1Nn?=
 =?utf-8?B?NHdpSW5Dd1RneGdCQTJiNVRjTTkweHlWOEQ2aWliL2VuWGRQVTAxY2FXbmVI?=
 =?utf-8?B?UGhLbFlHSngwWEZWamF5MWZUbGdCcklPUndLV05CYi9ZYkx0cElFS1Q2RVhI?=
 =?utf-8?B?bm5EckI5WU9QVFRwbXZzc1BHTnZnZFZ4NFo3TmZyUzdHYUg1em1QNFdvWVRJ?=
 =?utf-8?B?amxlbXI0cHBTdjlSRmhHTG9hVEwzNVV6cE5XZVV4NXhsUWV0c2NrVmp0bi82?=
 =?utf-8?B?UWFkK3QwenhDQldTWHI4bS9LNndzNDdDb1AzME03RkdkRlRJS0RWMlgwRzMw?=
 =?utf-8?B?YURSdWxoRDBhK28vNTFiVi9hU2tybEJ5c2hLOVNaMHpRREV3TFU0Z3docGtJ?=
 =?utf-8?B?V3oyRDdMWFZERU9JRERabGYxc3lPMU1oOWk0YjNqbXFuL29CNjloa1E5dW9T?=
 =?utf-8?B?TlVkeWVVZTNYSlA4R2U2ejY3YW9iTkRZZGhNbU5GVEkxM1lUMzFkd0xsYUl3?=
 =?utf-8?Q?oUPj26GOkOqbC7MJz0HoK7A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <212CD1B6A9011D46B12E4DF8A3CB3D86@namprd11.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 61dca967-d8aa-4ab4-9eca-08de0bb4c14e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 06:33:29.7916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NpqIX1stk5amN/kDId5THfykIN5DZKFzldm3OQA6tovz2zwqp1afpgLfFUNiOGAvmGLZauzCFYwgfdLcwc71zsGsba0lagfPsdIKBL9zl+yJIORAVsoSMlQI2aQUOibs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758

SGkgS2llcmFuLA0KDQpPbiAxMC8xMC8yNSAxOjUxIHBtLCBLaWVyYW4gQmluZ2hhbSB3cm90ZToN
Cj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+DQo+IFF1b3RpbmcgRXVnZW4g
SHJpc3RldiAoMjAyNS0xMC0wOSAyMToxMToxNykNCj4+IEhpIEJhbGEsDQo+Pg0KPj4gT24gMTAv
OS8yNSAxODo1MiwgQmFsYW1hbmlrYW5kYW4gR3VuYXN1bmRhciB3cm90ZToNCj4+PiBIaSwNCj4+
Pg0KPj4+IFRoaXMgcGF0Y2ggc2VyaWVzIGhhcyBhIHNldCBvZiBlbmhhbmNlbWVudHMgdG8gdGhl
IE1pY3JvY2hpcCBJbWFnZSBTZW5zb3INCj4+PiBDb250cm9sbGVyIGRyaXZlci4gVGhlIG9iamVj
dGl2ZSBpcyB0byBleHBhbmQgaXRzIGltYWdlIHByb2Nlc3NpbmcNCj4+PiBjYXBhYmlsaXRpZXMg
YW5kIHRvIGltcHJvdmUgdGhlIGNvbG9ycy4NCj4+Pg0KPj4+IFRoaXMgc2VyaWVzIGFsc28gaW50
cm9kdWNlcyBhIG5ldyBzdGF0cyBkcml2ZXIgdGhhdCBleHBvc2VzIHRoZSBoaXN0b2dyYW0NCj4+
PiBkYXRhIHRvIHVzZXJzcGFjZSB2aWEgdjRsMiBjb250cm9scy4gVGhpcyBhbGxvd3MgYXBwbGlj
YXRpb25zIHN1Y2ggYXMNCg0KDQpNeSBhcG9sb2dpZXMuIEkgbWFkZSBhIG1pc3Rha2UgY2xhcmlm
eWluZyB0aGlzIGVhcmxpZXIuIFRoZSBuZXcgc3RhdHMgDQpkcml2ZXIgZG9lcyBub3QgdXNlIFY0
TDIgY29udHJvbHMsIGl0IGV4cG9ydHMgdGhlIGJ1ZmZlciB0aHJvdWdoIHRoZSANCnY0bDIgbWV0
YSBkYXRhfMKgKHxWNEwyX0JVRl9UWVBFX01FVEFfQ0FQVFVSRSl8fGluc3RlYWQuIFNvIEkgZ3Vl
c3MgdGhpcyANCmlzIHRoZSBhcHByb2FjaCB5b3UgYXJlIHN1Z2dlc3RpbmcuDQoNClRoZSBjb250
cm9scyBsaWtlIGJyaWdodG5lc3MsIGNvbnRyYXN0LCBodWUgYW5kIHNhdHVyYXRpb24gYXJlIGV4
cG9ydGVkIA0KYXMgVjRMMiBjb250cm9scy4NCg0Kcm9vdEBzYW05eDc1LWN1cmlvc2l0eS1zZDp+
IyB2NGwyLWN0bCAtbA0KDQpVc2VyIENvbnRyb2xzDQoNCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGJyaWdodG5lc3MgMHgwMDk4MDkwMCAoaW50KcKgIMKgIDogbWluPS0xMDI0IA0K
bWF4PTEwMjMgc3RlcD0xIGRlZmF1bHQ9MCB2YWx1ZT0wIGZsYWdzPXNsaWRlcg0KIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29udHJhc3QgMHgwMDk4MDkwMSAoaW50KcKgIMKg
IDogbWluPS0yMDQ4IA0KbWF4PTIwNDcgc3RlcD0xIGRlZmF1bHQ9MTYgdmFsdWU9MTYgZmxhZ3M9
c2xpZGVyDQogwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzYXR1cmF0aW9uIDB4MDA5
ODA5MDIgKGludCnCoCDCoCA6IG1pbj0wIG1heD0xMDAgDQpzdGVwPTEgZGVmYXVsdD0xNiB2YWx1
ZT0xNiBmbGFncz1zbGlkZXINCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBodWUgMHgwMDk4MDkwMyAoaW50KcKgIMKgIDogbWluPS0xODAgbWF4PTE4MCANCnN0ZXA9
MSBkZWZhdWx0PTAgdmFsdWU9MCBmbGFncz1zbGlkZXINCg0KPHNuaXA+DQoNCg0KVGhhbmtzLA0K
DQpCYWxhLg0KDQoNCj4+PiBsaWJjYW1lcmEgdG8gYWNjZXNzIHJlYWwgdGltZSBpbWFnZSBzdGF0
aXN0aWNzIGZvciBhZHZhbmNlZCBpbWFnZQ0KPj4+IHByb2Nlc3NpbmcgbGlrZSBhdXRvbWF0aWMg
ZXhwb3N1cmUsIHdoaXRlIGJhbGFuY2UgYWRqdXN0bWVudHMgZXRjLg0KPiBIb3cgbXVjaCBkYXRh
IGRvIHlvdSBhbnRpY2lwYXRlIHRvIGJlIHBhc3NpbmcgdGhyb3VnaCBjb250cm9scz8gKFdoYXQN
Cj4gY2FuIHRoZSBoYXJkd2FyZSBwcm92aWRlIGluIHRvdGFsIGlmIHdlIGxvb2sgYXQgdGhlIGJp
Z2dlciBwaWN0dXJlIHRvDQo+IHN1cHBvcnQgdGhlIGZ1bGwgZGV2aWNlPykNCj4NCj4gRm9yIGFs
bCBvdGhlciBJU1BzIHdlJ3ZlIGJlZW4gd29ya2luZyB0b3dhcmRzIHVzaW5nIHN0cnVjdHVyZWQg
cGFyYW1ldGVyDQo+IGJ1ZmZlcnMgdG8gcGFzcyBkYXRhIC0gYW5kIHdlJ3ZlIGJlZW4gbWFraW5n
IHRoYXQgZm9ybWF0IGV4dGVuc2libGUsDQo+IHdoaWNoIEkgdGhpbmsgY291bGQgYWxzbyBiZSBh
IGRlc2lnbiB0aGF0IGNhbiBhcHBseSB0byBzdGF0aXN0aWNzLg0KPg0KPiBUaGlzIHdvdWxkIGdy
ZWF0bHkgcmVkdWNlIHRoZSBvdmVyaGVhZCBvZiBtYW5hZ2luZyAnb25lIGNvbnRyb2wgcGVyDQo+
IHZhbHVlJyAuLi4gb3IgdGhpbmdzIGxpa2UgcGFzc2luZyBsYXJnZSB0YWJsZXMgKGxpa2UgYSBs
ZW5zIHNoYWRpbmcNCj4gdGFibGUgcGVyaGFwcykgdGhyb3VnaCBjb250cm9scy4NCj4NCj4gLS0N
Cj4gS2llcmFuDQo+DQo+Pj4gQmFsYWtyaXNobmFuIFNhbWJhdGggKDExKToNCj4+PiAgICBtZWRp
YTogbWljcm9jaGlwLWlzYzogRW5hYmxlIEdEQyBhbmQgQ0JDIG1vZHVsZSBmbGFncyBmb3IgUkdC
IGZvcm1hdHMNCj4+PiAgICBtZWRpYTogbWljcm9jaGlwLWlzYzogSW1wcm92ZSBoaXN0b2dyYW0g
Y2FsY3VsYXRpb24gd2l0aCBvdXRsaWVyDQo+Pj4gICAgICByZWplY3Rpb24NCj4+PiAgICBtZWRp
YTogbWljcm9jaGlwLWlzYzogVXNlIGNoYW5uZWwgYXZlcmFnZXMgZm9yIEdyZXkgV29ybGQgQVdC
DQo+Pj4gICAgbWVkaWE6IG1pY3JvY2hpcC1pc2M6IEFkZCByYW5nZSBiYXNlZCBibGFjayBsZXZl
bCBjb3JyZWN0aW9uDQo+Pj4gICAgbWVkaWE6IHBsYXRmb3JtOiBtaWNyb2NoaXA6IEV4dGVuZCBn
YW1tYSB0YWJsZSBhbmQgY29udHJvbCByYW5nZQ0KPj4+ICAgIG1lZGlhOiBwbGF0Zm9ybTogbWlj
cm9jaGlwOiBBZGQgbmV3IGhpc3RvZ3JhbSBzdWJtb2R1bGUNCj4+PiAgICBtZWRpYTogbWljcm9j
aGlwLWlzYzogUmVnaXN0ZXIgYW5kIHVucmVnaXN0ZXIgc3RhdGlzdGljcyBkZXZpY2UNCj4+PiAg
ICBtZWRpYTogbWljcm9jaGlwLWlzYzogQWx3YXlzIGVuYWJsZSBoaXN0b2dyYW0gZm9yIGFsbCBS
QVcgZm9ybWF0cw0KPj4+ICAgIG1lZGlhOiBtaWNyb2NoaXAtaXNjOiBmaXggaGlzdG9ncmFtIHN0
YXRlIGluaXRpYWxpemF0aW9uIG9yZGVyDQo+Pj4gICAgbWVkaWE6IG1pY3JvY2hpcC1pc2M6IGRl
Y291cGxlIGhpc3RvZ3JhbSBjeWNsaW5nIGZyb20gQVdCIG1vZGUNCj4+PiAgICBtZWRpYTogbWlj
cm9jaGlwLWlzYzogZW5hYmxlIHVzZXJzcGFjZSBoaXN0b2dyYW0gc3RhdGlzdGljcyBleHBvcnQN
Cj4+Pg0KPj4+IEJhbGFtYW5pa2FuZGFuIEd1bmFzdW5kYXIgKDcpOg0KPj4+ICAgIG1lZGlhOiBw
bGF0Zm9ybTogbWljcm9jaGlwOiBzZXQgbWF4aW11bSByZXNvbHV0aW9uIGZvciBzYW05eDcNCj4+
PiAgICBtZWRpYTogcGxhdGZvcm06IG1pY3JvY2hpcDogSW5jbHVkZSBEUEMgbW9kdWxlcyBmbGFn
cyBpbiBwaXBlbGluZQ0KPj4+ICAgIG1lZGlhOiBtaWNyb2NoaXAtaXNjOiBleHBvc2UgaHVlIGFu
ZCBzYXR1cmF0aW9uIGFzIHY0bDIgY29udHJvbHMNCj4+PiAgICBtZWRpYTogbWljcm9jaGlwLWlz
YzogUmVuYW1lIENCQyB0byBDQkhTDQo+Pj4gICAgbWVkaWE6IG1pY3JvY2hpcC1pc2M6IFN0b3Jl
IGhpc3RvZ3JhbSBkYXRhIG9mIGFsbCBjaGFubmVscw0KPj4+ICAgIG1lZGlhOiB2aWRlb2RldjIu
aCwgdjRsMi1pb2N0bDogQWRkIG1pY3JvY2hpcCBzdGF0aXN0aWNzIGZvcm1hdA0KPj4+ICAgIG1l
ZGlhOiBtaWNyb2NoaXAtaXNjOiBleHBvc2UgY29sb3IgY29ycmVjdGlvbiByZWdpc3RlcnMgYXMg
djRsMg0KPj4+ICAgICAgY29udHJvbHMNCj4+Pg0KPj4+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9taWNyb2NoaXAvS2NvbmZpZyAgICAgIHwgICAyICsNCj4+PiAgIGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWljcm9jaGlwL01ha2VmaWxlICAgICB8ICAgMiArLQ0KPj4+ICAgLi4uL3BsYXRmb3Jt
L21pY3JvY2hpcC9taWNyb2NoaXAtaXNjLWJhc2UuYyAgIHwgMzczICsrKysrKysrKystLQ0KPj4+
ICAgLi4uL3BsYXRmb3JtL21pY3JvY2hpcC9taWNyb2NoaXAtaXNjLXJlZ3MuaCAgIHwgICAzICsN
Cj4+PiAgIC4uLi9wbGF0Zm9ybS9taWNyb2NoaXAvbWljcm9jaGlwLWlzYy1zdGF0cy5jICB8IDU0
OSArKysrKysrKysrKysrKysrKysNCj4+PiAgIC4uLi9tZWRpYS9wbGF0Zm9ybS9taWNyb2NoaXAv
bWljcm9jaGlwLWlzYy5oICB8ICA0NCArLQ0KPj4+ICAgLi4uL21pY3JvY2hpcC9taWNyb2NoaXAt
c2FtYTVkMi1pc2MuYyAgICAgICAgIHwgICAyICstDQo+Pj4gICAuLi4vbWljcm9jaGlwL21pY3Jv
Y2hpcC1zYW1hN2c1LWlzYy5jICAgICAgICAgfCAgNzMgKystDQo+Pj4gICBkcml2ZXJzL21lZGlh
L3Y0bDItY29yZS92NGwyLWlvY3RsLmMgICAgICAgICAgfCAgIDEgKw0KPj4+ICAgaW5jbHVkZS9s
aW51eC9hdG1lbC1pc2MtbWVkaWEuaCAgICAgICAgICAgICAgIHwgIDEzICsNCj4+PiAgIGluY2x1
ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaCAgICAgICAgICAgICAgICB8ICAgMyArDQo+Pj4gICAx
MSBmaWxlcyBjaGFuZ2VkLCAxMDAxIGluc2VydGlvbnMoKyksIDY0IGRlbGV0aW9ucygtKQ0KPj4+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWljcm9jaGlwL21p
Y3JvY2hpcC1pc2Mtc3RhdHMuYw0KPj4+DQo+PiBUaGlzIGxvb2tzIGludGVyZXN0aW5nLg0KPj4g
SSB3b3VsZCBsaWtlIHRvIHNlZSB0aGUgY29tcGxpYW5jZSB0b29sIG91dHB1dCBmb3IgbW9yZSBw
bGF0Zm9ybXMNCj4+IChzYW1hN2c1LCBzYW1hNWQyLCBhbmQgdGhlIG5ldyBzYW05eDcpLCBhbHNv
IHRoZSBtZWRpYS1jdGwgLXAgLCB0byBzZWUNCj4+IHRoZSB0b3BvbG9neSB3aXRoIHlvdXIgbmV3
IGRyaXZlci4NCj4+DQo+PiBUaGFua3MsDQo+PiBFdWdlbg0KDQoNCg==

