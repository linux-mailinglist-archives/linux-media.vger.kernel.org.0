Return-Path: <linux-media+bounces-41492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 544A8B3F214
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 04:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16DF34858F3
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 02:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC5225A333;
	Tue,  2 Sep 2025 02:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="QyUPGRrc"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021078.outbound.protection.outlook.com [40.107.42.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1B56FC3;
	Tue,  2 Sep 2025 02:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756778645; cv=fail; b=N/I94LayfF0CyenGYvxHj8VJUvUMM7IbG9DcFhxq9YRM6ZhydRnvwNwmP8qIj7h4SCRymUDx0ZK2tWSfXGPlmS18q0JmUm9HtH3h1L9t2/tFKhoIH/7NVCXWAs7hxji+/4lX4gMoRfe23L0uEKKBENgfUen7dqxSaEImadGx1aQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756778645; c=relaxed/simple;
	bh=IHbk6LMP+A9xwdiptKi6MUY06DtNTcL9fIW84rQb2TE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p9pqeYXmyYPmW26chU0YqsaIXE//kCcGg5eY1cAnKBEGmoOUSy3LPcdCk/mLiqdrv7G+bzdVhrXs3IDWRpqE59/e0W9mvQqjTHlYbLV6pO8pB2ohjVHuoME9mlG1bAv+XY70ZaGG++xa5cxLyebucxE27f67W9DRToBp7pr98Yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=QyUPGRrc; arc=fail smtp.client-ip=40.107.42.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mybyDnUKjp+5+2N1YLNfLRGp3JNjkTATRomfIAWToUNuxAjKpu3e+dNrkExbSJj6CA9hZLvDeK8c5tOr2c/JGRv3v4XNeTMUChHBgOcZK+dTrSASrWB/F8etP6M+i5E0cW8LD6qcY1JpxFb1xQs+g2IVqegcG0mgsLEBTTYWXPnlUy56fxM5wSEgITRY5XsCg7ZgLxQWarfFfO1n3hflf7lchWVIPUkHxkX22H9S6wBptlR66eWafg53Buvw0rlNYoi8vbTFQ3MbHLrS56gnBmKjVMeRACjaTruFJZXT9bjGE6cyl5T+caBBQC392u3kbri3Gy2oUqF8vsLZmgdPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHbk6LMP+A9xwdiptKi6MUY06DtNTcL9fIW84rQb2TE=;
 b=NuUoFPtTN6O5Q6DrVmdl/0eEQjIJdbQKLMKORCTWwbB8BTKV2bFBhtGDxiHqYXHhKLLiFtP2sc1eZzLM6WVmetdBfLugBtdjF0RCddWvaItrzSB5o88GgvF3RVGB08MHq7eFxXGtGifR6cCx5NGZc+95ZJdJjAPw7k+LU71+Nf7Q7uzXi1SM/JNxsa9K7vW4aINTJ1ewHR/VjZqDO8f7wteJUMXWtiXXkqM6g6sMcH44qqvrmVAiOpuWEQ3m3c0fKF9RL7iwBA58uhX+IMkqp7jwh3e1kHLGVHbH1ZIGrdechtHvTdKi1gEp+49wGeKivJf44N8C1A8aRW/fSu5noQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHbk6LMP+A9xwdiptKi6MUY06DtNTcL9fIW84rQb2TE=;
 b=QyUPGRrcFYSF+mImnutXFNEMTiKArvffpNzgp2wUS+Nu4a/AQiAA54e/cnwOj0wtW+eFgx6T1cdYIiBI2mDTr5A33SMMOwXag60owsihSkI+BU+IaV4XA65VNdt62ibNedGAWIXfJkkIWHXJ24QW6qcEGzoAhm1p9TFbUoHVqtY=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB2237.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.16; Tue, 2 Sep 2025 02:03:57 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 02:03:56 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, jackson.lee
	<jackson.lee@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>, Ming
 Qian <ming.qian@oss.nxp.com>
Subject: RE: [PATCH v3 8/9] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Topic: [PATCH v3 8/9] media: chips-media: wave6: Add Wave6 control
 driver
Thread-Index: AQHcGMGMGgJ5jqNL+EGIylnEfbTZRbR5qpcAgARN4LCAADC5gIAA8udA
Date: Tue, 2 Sep 2025 02:03:56 +0000
Message-ID:
 <SL2P216MB1246324EC2C763F7A5E6E793FB06A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
 <20250829084649.359-9-nas.chung@chipsnmedia.com>
 <5502f52d-d302-4479-93b8-1da47731cf1d@kernel.org>
 <SL2P216MB1246A048955A09A5A4D15CA3FB07A@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
 <4c8041ae-3b20-4c17-b9c2-0816f087717e@kernel.org>
In-Reply-To: <4c8041ae-3b20-4c17-b9c2-0816f087717e@kernel.org>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB1246:EE_|SL2P216MB2237:EE_
x-ms-office365-filtering-correlation-id: 6831c5ee-91c4-41f8-1687-08dde9c4f98e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NUJFUVhySHhuOXpsbWZBZW5GaC9MT09CMGMzYW1OUGlCOG93ak9JS0pPSnQ4?=
 =?utf-8?B?NzJROTZvSUxNbllyeVRlMmMrTUJjZ1BKUURCNWx2VzdPcE1Vc1RiYmsrQzRV?=
 =?utf-8?B?bnpxLzMzSEgzUFRnb1JVQThIWVl5eUVFcTdjbEJSSm5GUFRlTkp3MTNwbkgx?=
 =?utf-8?B?eHBGd2tQWHU2bGtORE9yNDA3MmkvY2MvZ2ZmYWdqY0xPeUNxK0hrYk1tM0Zn?=
 =?utf-8?B?bnJoVTR6VTdxUGdnUW52N3JlNWZRbzAzOFVGQWJ1WWR5NU5FOWcwczhZKzdM?=
 =?utf-8?B?VVVaeHArMHpuMk1TZXFFR1NnbWdVRm9mMTRMZm1jKzhsZEdvLzU2ZExxckpH?=
 =?utf-8?B?NzZic3RFMFVhM2ZuRkNJWUNIVWVVVERZWWpHNkpvUVVBMjlWaEZ1SlhxWC9V?=
 =?utf-8?B?K0piS2ttZFZUY0h4SWh4V3pENVlLQWY2eDhlMWhnenpBWFVjZ2ZCTGhQQmt1?=
 =?utf-8?B?eitxOHJMZzQycUlwMTBlM0pOb1JoVEttQmNQWnVLWnJZVmZMTy9xN1k1T1dU?=
 =?utf-8?B?RndJMkRaakZIQXZLNFNxMEc5N0FIaGNKa25KbHlGaVRQV251WklTb09sSnc3?=
 =?utf-8?B?Q1Z0UjI2V0xtWWZTbUVIczFFWEdQblhYRVptbjU1ZHBpRmFiL0hCcHFGZlZD?=
 =?utf-8?B?T1BuSC9mSy9ya3dWSDNBMGZZMTRGWnAycVRMMERTM2VQcHByb3M2YzFKNlpX?=
 =?utf-8?B?QU9TT1M5VDJCR2k5S2NXeWtaaGl5d21yb2VGblpMTFdLY24raTJHZ3VhYURr?=
 =?utf-8?B?M3FPNURkcm1PSTJPRjY3alcwaE9GblFhc0xacXFCYTRwTHlFTnIweHc1Um13?=
 =?utf-8?B?eVdpUlpzV3FqOWVBd25NTzkwV1JHeXExVUx5WjJQYktGZzNhTnBHaXlESUpC?=
 =?utf-8?B?RTJyZEZzT29SMlIxcFV3SFN1eU5qdkNONWU0U2F5R2dvMjFGeHQzbFVFdk9H?=
 =?utf-8?B?Q1pMa1k5SWZiS3ZkSTBlYUpBYkdsb3o5MGdsdjZNOStaR0JhUTRzbm9seCtz?=
 =?utf-8?B?MEZzWXlwNktvTDZya0FGWC9zb3RoS0QyRzZoUjh1VWRpKzdEczhBQkNuZVIx?=
 =?utf-8?B?WGthd3B1dGtZLzlLaVliWWlsRk1iVkJxWVVkT3dkRGxwSnRXZzhWLy90Qjlu?=
 =?utf-8?B?WmxKQ0lGU0ZKSnVlVzdjY1NISktrbVROQU1Mb1AxVElQTmhUNkRzMjVtY1VX?=
 =?utf-8?B?eFBDaG5vTVZrMGRsWnRtZVduOGhWNE5qaUVVdjA5YUJ2dytDcERzR3JMY05j?=
 =?utf-8?B?SGh4dmpQZEp6T1VsTUhxVk1pNkFRTmRHZGR2dDhJMnhoeWl5blNlZTIxQjlN?=
 =?utf-8?B?eEtlN1VQNTZKdVQyTmpkT2dpWmFMcWtQMTNHRFJBdEVxcllqbG42SG50T1Na?=
 =?utf-8?B?cXdZNkJmK0Y1Tmdjc1hCRVJrZnJOVVVlZDZxQnp4cnVuNTZZd3JyVldYeXVl?=
 =?utf-8?B?L1ZUY21EMzdLTXNqSVAxRGJTZTZvQUo3amRRc3RKV2RXRDNTTW9jQ1M0R2dz?=
 =?utf-8?B?bTRHcUxlT21XZFJUcmFCVTVjdFFGMy9HajNYT3oxM2ZpSE02SDZuWStaQm5n?=
 =?utf-8?B?ZE51cU00dG1HbWd3bXdkbURNcWliVmJ5YUxRM0gyVTdST1JDOFNVUExUTjQ0?=
 =?utf-8?B?akF5ODQzbmV6VkRlN1hFeE8vWGFIeE5HRTQ0M0RZRWorZURUNkswN2NVUFY1?=
 =?utf-8?B?MS9kbWNDckh2ZklqY05mTDBscDUvRStSalVTdHJGdUMxRHp5S1RTeWRkTzho?=
 =?utf-8?B?T0hFblZpMC90MklQREV4Y1oyWTkzdkIxaWZFTnlXaUJzMEplNS94cVVTZW9N?=
 =?utf-8?B?OVF4Q3IvYnVpRFQwa0xEbDlDS3UzUVA0OHIzV3hxeGVpcjdEWmsxWnErYUJi?=
 =?utf-8?B?VVQ0Rml6anNDTTF2MHBZNlRtQjhMQ2dxa1hFOElkMkM2bG9jdFhBYkVtdTh3?=
 =?utf-8?B?aWJlTzgyUDJ5TjduOFQyd1VjVEJEZW82cHNRU0dSWW9ETTY0U29VMmxRMkM4?=
 =?utf-8?B?SGZ6aG5RUDV3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0U3cm0yRFo5M1k4dytHU01PZ2xENkhRWHVqL2sxc0lJZ05veVZuT0pSNGRR?=
 =?utf-8?B?d0lTbzdCM2s3SUR6K0dwRExmZW1hZ2lMVFpURVZ0T3ZPeGRKN3o4WFFjWThq?=
 =?utf-8?B?SFNHMC9heXh6L21ORHlNM1FhR0tkWkZDM3pTN05kbUlUcGNFZVJ5SnlDcUNS?=
 =?utf-8?B?MWxTQmlPTFNUbmIxV29rajNIQytFbjBaSmMrT0JRUDM4WWIxM3J1RlZxWjRh?=
 =?utf-8?B?ZGlZRitRalA5c1dTTDdCazdUbzJ5NWZleTVqcG1xYS94cjdNQnV0TUZsbDJT?=
 =?utf-8?B?Q29WWGlnYmtzbEl6WGVHM2xpMzFRejJZdjVsS1V3U3M4NWxSMWxIdWovbnUw?=
 =?utf-8?B?UEFLelkyYzVrZE11TDBWSVhpMTRjTlNudVNGOFlRQy84UE1LdHEzM05aUHNi?=
 =?utf-8?B?ZVhxV1VxOGgyd0FKRm9kS2E1NW1ZdkFTeXZWc1ZvcUZoUDdYNjg0WDM2RjJJ?=
 =?utf-8?B?VERCUFU1UGVFejczcm8xNTlGUTFKUWxYMnFHUXBDd3hyYm1OT2JDMDlnTHJw?=
 =?utf-8?B?SndjSUY4SnJoRlJVUkFQbTlyOURDWFVLVU0xbDVOMkkzb3hrZXgxVGZNV2N5?=
 =?utf-8?B?dXM4eWtRMndLL2Q4RG40UGVHMU1LVFVJRUxtK29EM2ZZcitJa0tZNTlTTFRG?=
 =?utf-8?B?VC9ZMTh4TEdpZVkyNFI0NnNHQ0JOL2VHUldSRGNVN3FIWEdoSGxYVFJzM1dj?=
 =?utf-8?B?ME5qSmswblZ0Mnl6Q2RMdURKMGhQTjJRZkJFM1lUMExUSE5kNThnYXNWTW9x?=
 =?utf-8?B?T3dXSkVCUVM3MU5paWVTMmRTSE52blk0dDA5cVBBTC9wWU9sNTFwQzBFVHV5?=
 =?utf-8?B?QnViekl5L0RqeWRLM3BNdURaZERjVTNlRlBKVWxpUWdzeVlyTEdCc0JuTWdH?=
 =?utf-8?B?aFoxNGlId3ZQcWJmNjlIZXRBNDJyZjl5N2VoNkpRd1daSzV5bi91TDhLTXVi?=
 =?utf-8?B?Y0xtM2JhMldlM256bm5JMDExc3dQR3ZOUnBPcHBMcGk5cEFMTVd5ODVkQURE?=
 =?utf-8?B?VGtwV3gvVGJnN3JwUVdJRFUzRk8yejZOaWJEQ0haUWxiT25KTkZiR1h5SHJQ?=
 =?utf-8?B?aFNBN2hXTDhpVnZibElKZ3VjM0w4eFVnMmR5aEVLd0F4SmxkSFpBenlLditR?=
 =?utf-8?B?YkNBMEtkNFZCbG9vYTFiLzdzZXJRR3htWlV5RmFranpmcTZaZ3RhdWRpeUNC?=
 =?utf-8?B?b3dqREF2VnkrMUtxQUx3Sm11KzZTUk8vVGdqMkg0TkRZNzhTeGpGMGFqVGR0?=
 =?utf-8?B?L0VDTmZ0WVpXallQSnNCUnlzRzBoa1UvWW1CSkRSSEd0N3cvQ2VYZ0ROVUE5?=
 =?utf-8?B?WldBUldhQmc5Qk1xTTVnc3h5UWRWMlJITjByZTF2bC9pVkk2Wlp0WWg1dmx0?=
 =?utf-8?B?d3BBbGsybHFiWXpjeUFFNGErZ25iUjZSYUFmN2FEMzNmR0t3bTlZeldmb3A0?=
 =?utf-8?B?QlpYQkNQczRnbnBjSWlXWGR2VmxUbnREcUF5dHI3aEpVa0JiL1BuT0ZWKzFO?=
 =?utf-8?B?TWIzUGk2OWxqQUFDVmdVbU4xMHkzb2U4aTNGb2dFVm1NZ0VIY083cWk4NFJM?=
 =?utf-8?B?VFdzelZLS0pEZGRnaGpMRi9mRENsZWtXYkJSNytmYjlyYW44MERXSDA4SFBH?=
 =?utf-8?B?REFweFg1Uk5pTUs5bEdUUmZaaGVaSHowNVlBLzMrREdMRGhBQzExRTdXNW9s?=
 =?utf-8?B?eE05eUFiQzJEZGU0SHlwQlNPNFJBdmNBTUVzV2x5SEdtZ2trcWlWQS92Qk11?=
 =?utf-8?B?dUVCWmcvU09aOWxaY0FzL3ZMOG9KYytTME9NbU11U0tXYnhLcmlIeVBBd0xr?=
 =?utf-8?B?SmdlcEtvVjEzSUE4R0Zmd050bmlaR1F5WFNRMTgxdlJ4Zm91bnF5ekNiUjFK?=
 =?utf-8?B?SUZMZXdTSFdoVS8vbEdrM0xCY0NnQlNUQWRHVjdFc1I5NkZrZS9WanhsRE1S?=
 =?utf-8?B?LzNOdjE0MzgzaW1VM2hkS0o0ekhmQ3BNOXo1Nk1PWFk4UlF1UkNoZnlLcGhu?=
 =?utf-8?B?VENXNlBUMzNrN3FLejQxeHhic3hMN1c1STd3WHRiVlFVYWc1ZTVKSXBtUFcv?=
 =?utf-8?B?NFgxN2w0QmJyS1p5ci9MYzFpaWFZQ09TTGdzamJ1b0FFU210M0RqNUVWd3ho?=
 =?utf-8?Q?36uVDXzMl/eygoS30++cepOjJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6831c5ee-91c4-41f8-1687-08dde9c4f98e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 02:03:56.6035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rR+80ufTc/YFYHT7BIepw6GF8wj14HZsMYYGwrHW5tPx1S5OI/0nFUjEu4waXQLYBogBm4iWskttXx6odHV+MjAlg5dgPeS0hAHy+nfPBUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2237

SGksIEtyenlzenRvZi4NCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPlNlbnQ6IE1vbmRheSwgU2VwdGVt
YmVyIDEsIDIwMjUgNzo0NCBQTQ0KPlRvOiBOYXMgQ2h1bmcgPG5hcy5jaHVuZ0BjaGlwc25tZWRp
YS5jb20+OyBtY2hlaGFiQGtlcm5lbC5vcmc7DQo+aHZlcmt1aWxAeHM0YWxsLm5sOyByb2JoQGtl
cm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsNCj5jb25vcitkdEBrZXJuZWwub3JnOyBzaGF3
bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlDQo+Q2M6IGxpbnV4LW1lZGlh
QHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPmtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWlteEBueHAuY29tOyBsaW51eC1hcm0tDQo+a2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGphY2tzb24ubGVlIDxqYWNrc29uLmxlZUBjaGlwc25t
ZWRpYS5jb20+Ow0KPmxhZmxleS5raW0gPGxhZmxleS5raW1AY2hpcHNubWVkaWEuY29tPjsgTWlu
ZyBRaWFuIDxtaW5nLnFpYW5Ab3NzLm54cC5jb20+DQo+U3ViamVjdDogUmU6IFtQQVRDSCB2MyA4
LzldIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTY6IEFkZCBXYXZlNiBjb250cm9sDQo+ZHJpdmVy
DQo+DQo+T24gMDEvMDkvMjAyNSAxMDoxMywgTmFzIENodW5nIHdyb3RlOg0KPj4gSGksIEtyenlz
enRvZi4NCj4+DQo+PiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCj4+DQo+Pj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtl
cm5lbC5vcmc+DQo+Pj4gU2VudDogRnJpZGF5LCBBdWd1c3QgMjksIDIwMjUgMTE6MDYgUE0NCj4+
PiBUbzogTmFzIENodW5nIDxuYXMuY2h1bmdAY2hpcHNubWVkaWEuY29tPjsgbWNoZWhhYkBrZXJu
ZWwub3JnOw0KPj4+IGh2ZXJrdWlsQHhzNGFsbC5ubDsgcm9iaEBrZXJuZWwub3JnOyBrcnprK2R0
QGtlcm5lbC5vcmc7DQo+Pj4gY29ub3IrZHRAa2VybmVsLm9yZzsgc2hhd25ndW9Aa2VybmVsLm9y
Zzsgcy5oYXVlckBwZW5ndXRyb25peC5kZQ0KPj4+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5l
bC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4+PiBrZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1pbXhAbnhwLmNvbTsgbGludXgtYXJtLQ0KPj4+IGtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnOyBqYWNrc29uLmxlZSA8amFja3Nvbi5sZWVAY2hpcHNubWVkaWEu
Y29tPjsNCj4+PiBsYWZsZXkua2ltIDxsYWZsZXkua2ltQGNoaXBzbm1lZGlhLmNvbT47IE1pbmcg
UWlhbg0KPjxtaW5nLnFpYW5Ab3NzLm54cC5jb20+DQo+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MyA4LzldIG1lZGlhOiBjaGlwcy1tZWRpYTogd2F2ZTY6IEFkZCBXYXZlNiBjb250cm9sDQo+Pj4g
ZHJpdmVyDQo+Pj4NCj4+PiBPbiAyOS8wOC8yMDI1IDEwOjQ2LCBOYXMgQ2h1bmcgd3JvdGU6DQo+
Pj4+ICsNCj4+Pj4gK3N0YXRpYyB2b2lkIHdhdmU2X3ZwdV9sb2FkX2Zpcm13YXJlKGNvbnN0IHN0
cnVjdCBmaXJtd2FyZSAqZncsIHZvaWQNCj4+PiAqY29udGV4dCkNCj4+Pj4gK3sNCj4+Pj4gKwlz
dHJ1Y3Qgd2F2ZTZfdnB1X2RldmljZSAqdnB1ID0gY29udGV4dDsNCj4+Pj4gKw0KPj4+PiArCWd1
YXJkKG11dGV4KSgmdnB1LT5sb2NrKTsNCj4+Pg0KPj4+IFdoeT8gSG93IGNvdWxkIHRoaXMgYmUg
Y2FsbGVkIGluIHBhcmFsbGVsLCBiZWZvcmUgdGhlIHByb2JlPw0KPj4NCj4+IFRoaXMgY2FsbGJh
Y2sgaXMgY2FsbGVkIGFzeW5jaHJvbm91c2x5IHZpYQ0KPmZpcm13YXJlX3JlcXVlc3Rfbm93YWl0
X25vd2FybigpLg0KPj4gSW4gcHJhY3RpY2UsIEkgb2JzZXJ2ZWQgYSBjYXNlIHdoZXJlIHRoZSBj
YWxsYmFjayB3YXMgZXhlY3V0aW5nDQo+PiB3aGlsZSB0aGUgZGV2aWNlJ3MgcmVsZWFzZSgpIGZ1
bmN0aW9uIHdhcyBiZWluZyBjYWxsZWQuDQo+DQo+SW5kZWVkLiBOb3cgSSB3b25kZXIgaG93IGRv
ZXMgaXQgcHJvdGVjdCBmcm9tIGNvbmN1cnJlbnQgcmVtb3ZlKCk/DQoNClRoZSBjYWxsYmFjayBj
aGVja3MgdGhlIGZ3X2F2YWlsYWJsZSBmbGFnIGFuZCByZXR1cm5zIGltbWVkaWF0ZWx5IGlmIGZh
bHNlLg0KVGhpcyBmbGFnIGlzIGNsZWFyZWQgaW4gdGhlIHJlbW92ZSgpIHBhdGggdW5kZXIgdGhl
IGxvY2suDQoNClRoYW5rcywNCk5hcy4NCg0KPg0KPkJlc3QgcmVnYXJkcywNCj5Lcnp5c3p0b2YN
Cg==

