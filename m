Return-Path: <linux-media+bounces-16775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 269DC95EE0D
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 12:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5C461F231CB
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 10:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46388146A61;
	Mon, 26 Aug 2024 10:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DqlMq6Qs"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010033.outbound.protection.outlook.com [52.101.229.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C0C804;
	Mon, 26 Aug 2024 10:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666817; cv=fail; b=WrrEV/fovCyco8WdPSiujQGDRDEBDV5QyfrvCFS1EB1S1EY8k8GOHs8M89FJJSytKmW3wiVqY17N/Op84Uw36c/PHC86Qty1Pd+WK6p2VMYFA5xm4ek8714muXXJtdE+qXjxIPHDVM0JqYTlQmlYmfRIwxhG53dW1slqpaT4FvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666817; c=relaxed/simple;
	bh=GAKVmDsHV58lnBzUMl65vP3SIEqNCpuRKZtg3iy5RpQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ex9c2RtcIDdnvzoWJt7NUNNfpsWQhU1u/F2LghaldY5UW4NKUBCpcxG+3RzF10m/YCjIoUkZx5A9fFCJVaTwgkij63vCNQf9pJm2wnPIC45lnohrBBBjpgP5TJ/ycFmE9K35gBsN+2J1Om1H/YNZpzVWGpbEDZTKqaqtR1IiJI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DqlMq6Qs; arc=fail smtp.client-ip=52.101.229.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPOmpkNnv1iL0eKPyER9FGlUe3+giSQhHu+AOQm+jZpRWa3I5Sl1QTTH1V9bTjESluZqPxXC1CC7pqbdwd2YonatCLBAD/YQlVBQ00D7LZHCpahPz02KArlptX/MidsBGVRGgg2aW7lC0G0SW+G79EyeKatfST7YLyr/Ts/ZiwayiiQfcZaNzGLOszNcROsTDVjKMU3Vd3N51p/frrTjv41VMedWTjytYZaEUtUqNpGxXoDhwW8rgSK3zMlyWzB/9GXnf4/Fwy7XeHKeZjUOFuVNiANPaaVxHP1Drr/CPb+LyXJHkPOnLECQkTx607XPNvTq2LKTmGTr1eaPJ5i/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAKVmDsHV58lnBzUMl65vP3SIEqNCpuRKZtg3iy5RpQ=;
 b=xDBAKPkhrP6Vok1doXaXNmtqXsvqSUGx8Wq6B6Yq2ZqZsp4Qs923/B/zpo+Gykl2ewVu+CQ8OjkE2bXC/2QprKn+kqFA1/yImOI2b9wrnm+XBEGlzhAolYnJxrNmYSQCzz3HiActYhFxQLba/86T5kLUWQ+u6h7MklYBWPccOSzArzqd3LZV0g/0h95UjxC7k4a/IJ5pTczbfryQkX15xIWvDr1QbuR09ODFKUVw24FijGgjiwdeysgv7CuNEB8rBZRdBeklw5xnR5cTJRzzUfGvW3PVyJG+6Qn0nNURGlz5mLZWh/7o2yj7EYsSp1DJVP+z/vemV9QtUnUFT3hwUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GAKVmDsHV58lnBzUMl65vP3SIEqNCpuRKZtg3iy5RpQ=;
 b=DqlMq6Qs+v/8jw6VV+M4VnhZ3s1EjzutTT29jEGX7GViUKxf01gVI28uoPJEVRioJOQglJnp3c//Oiw6/5J18mFLJgRTG22ypUCeGlt8BVTE2bVubifqOHN9cQqFvNU2sJIt/4TTvCnKWxmOHWTHNePM3xuqWL4OgxtRSzkANFg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11559.jpnprd01.prod.outlook.com (2603:1096:400:37a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 10:06:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 10:06:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Gleixner
	<tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to probe()
Thread-Topic: [PATCH v3] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to probe()
Thread-Index:
 AQHa9lJwxIfH6/jsnEWiya+jaS8y8LI5JhkAgAAKcqCAABuKgIAAAHjggAADNoCAAACxcA==
Date: Mon, 26 Aug 2024 10:06:49 +0000
Message-ID:
 <TY3PR01MB11346BD320773ECD067A99CF6868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240824182120.320751-1-biju.das.jz@bp.renesas.com>
 <6f16a3f7-99bb-47c4-9034-c1f0ccd59546@tuxon.dev>
 <TY3PR01MB11346F3C71013AD71C1556BA1868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240826094311.GA27596@pendragon.ideasonboard.com>
 <TY3PR01MB113465A694F44326ED0A5AA19868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWbVZCntawwKp17PLZMLveGGBxdBSrV+8wwaM4p2x8A2w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWbVZCntawwKp17PLZMLveGGBxdBSrV+8wwaM4p2x8A2w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11559:EE_
x-ms-office365-filtering-correlation-id: da8f6793-326a-4b27-28d9-08dcc5b6ccf6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c3k2Y05qTHhSMXJyN0xzQmI1eGZzcmFySG5ZaW9Rb0VhcDhjbXZadFJuVEl4?=
 =?utf-8?B?TnU1Z0VXcnE1RndDQUFIb3FqM0x5cms1U05CdzB5TXVtc2x4RGcrbW9Wd3FK?=
 =?utf-8?B?R09Eb3BLcm5VaXNVdFJOTTNsbi81ajdjOG9peFNaU0NyNUlyS092ajFkbC9u?=
 =?utf-8?B?YUZPNE8wVzF5enJqVU8xb2Q0QlhWelFGL29KSm5vNGlpMU9rNVF5R2MrSjNm?=
 =?utf-8?B?dDhmbDJoR2xKdmlHMXpDU3lEL0UzMDMzOVl1UmcrM1hKeEkzc0VIMkRTUjJO?=
 =?utf-8?B?RDVNQ01yRE9uODBxYU1LUFcwZDQ4SW4xcFNoRlRIWEFCeENVSHk3SWxwM0t5?=
 =?utf-8?B?RFZjby9lYUdkSDlFZ3dSQTBrd2NPNS9LOGwweU5xcEVQVkU1cG4rdTNoOHE0?=
 =?utf-8?B?MGVoTktERnQ0WFlYaElZU01tQ0ZuajdRRFB1Q0M4bVlGNzNhOWU1ODdFTXE3?=
 =?utf-8?B?M0I1RFZqQ3RlV1kxQWZST2QrNURhTjdtN2ZpZ1pQTW9KRUNvU0VtTm9weWNr?=
 =?utf-8?B?a1VmZi81R05wUzVOYzh5djllVE9hcytPdVRTR2JUdVVSdVhOQmxJWDNsN2NK?=
 =?utf-8?B?RVVKS2F0OFdacEtsc01CT3MxODlHMUpWYUZJZGVtK2tBZUJwUlJ0cCtwOXNi?=
 =?utf-8?B?UnRuN0hhTnMwdUZaQ3M5cThsa3FDSUo0M0VZUTh5RjFqQktrcng4UTNYNW5r?=
 =?utf-8?B?VWg0VlpnejdvTENkdm1jNTUrT2ZaTHdnWFI2UXhCTCs3KytRcHBjaHdxMzNj?=
 =?utf-8?B?VDJrZGVSblFJenkyYmJyRVE0dlJNS3N6TG01ekc5eit4V1QzaUtINXlPV3hh?=
 =?utf-8?B?QWl1OXVteVJpOGNmVXp6U0hCa0dEM0w5ME9QNUJpZngxWU9mRWdSYlB3WWd5?=
 =?utf-8?B?aURDTkpRSHd1L2lxVEpvdUIxd0JEQkpxSk1BaGJlcmtGRlZ6VzUrYlNIWmNi?=
 =?utf-8?B?MnpSOVBCOGt0YVlGMGFCWWdWTG1YMEx3d3dQZkxNdTBUbE5MdkJXQlFYQ09i?=
 =?utf-8?B?Y2ZVR3FBSFNlczB1eFZOQVU0VXdVUFZXL3lpUXl2Y1IzemJWemwwMGJtQTNW?=
 =?utf-8?B?ckZ2aUhscVlGam9zS1g1NE91dW4vOEVnQzh0Nk4zdnB5NnB1MG53b25UUnFr?=
 =?utf-8?B?cVJiNVFLNTNOSFh5dE5ZTUJORUhXN1hZNWJ0bW1hRUJHbGNDUEg2WVBXY2lC?=
 =?utf-8?B?NjVyZERGUzE0amRsZGVRa2gyZ0l1dnR0dFNCb005ZlhjWHI2RjdLdFQwTzBt?=
 =?utf-8?B?OGVHaFhXeE1QMFFveDNyd1VNbXV2b0hld21RRHRYb3dkK3lWVkU5Q2k2Qjhy?=
 =?utf-8?B?WU5YZnN3Ym1SdWxjODVlMUtBd2NCNVEwRy9Qa2I1ZlpNK29weGdNVDEreEo5?=
 =?utf-8?B?OHZvRGFyb1pZWnNHSXVqekxJcklnTXZEQ1hXVjV3UTdnMWI3MFR6M2JQcTZP?=
 =?utf-8?B?K2FJdVBGMmlaTlp2b1V3alNKTXUrSEFZT3JRKy80Nm5wNDFlSEJNWGQrbHpZ?=
 =?utf-8?B?Q1RoZG9WVG5yZjVzcG96UHdOSk9UUW42V3R3TW40Z3hGQzR0QnRnVzE2QUk3?=
 =?utf-8?B?dEVEMzh3bHV2Mys4QXdTMlc2bXB1amtMeThrSi84ZFBLTnpJQkcwRHVrZEpz?=
 =?utf-8?B?SHN6WkdyWmwrVDhFRlJHZDJzVDBmOUJTRkZDNXphekhOMkZobUozWWp0TkRo?=
 =?utf-8?B?ZE9oWTZYWmRsbHlpSldPWktycTAzYVFaMU9FYUtFaElDZWRDOXFZY1hKVDBj?=
 =?utf-8?B?cmlETlZYeVpMTmIwa05Vc2ZnYWpXWWJVL0pqRUxRb3gvUGwyNXNBZnd4OTA5?=
 =?utf-8?Q?zMw5HpaJSw2PzXYLEQvrrSSF96lhXYMVqkWJs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q0o0QXp6Q3pOMTZRUVNQYVgxZHBDRjcvOWYvNDFnZ2VaZ0JNU2pGLzdud2NV?=
 =?utf-8?B?MEo5R0hpYTh3TXc1d1p3NjNicjl5cHdYMldRZ04rSUw5eTRzZzlISHVvV0ZQ?=
 =?utf-8?B?aUtBWExka0MvWWE2TklENUgyRnBHaGxyRjZ4WCt1M04vZUNoTkVuK2Q0RWJs?=
 =?utf-8?B?L3pYMFI4VlAveW40cUYva1M3ZjlMbWJGNzc1Y21SRU1VNHpFb2NlUndKWldB?=
 =?utf-8?B?ZjkwNnBvditNVkxXU0JFSXJxYnpTNytzcldXRXEvMkMrOGhXdDc0MGFGWHYw?=
 =?utf-8?B?UnppelhHQXl4VlVqQjhNZ0I5ZGhvM3hRQTVLWHFwT3ZlYk9HZG9oS3hFNlhs?=
 =?utf-8?B?Qjh0T2J5NUYwUHliaDdzZVp6b3RHREsxVHIwV1RKL1NBdlNTYm1HaytRaUEz?=
 =?utf-8?B?eDZkMXJjSE9hN01ROHdmdjdMSkR5NlZ3QkRLTDBIbWc3dmZUbEduZHlyeXFV?=
 =?utf-8?B?WGs3dTc3YS85Q29BQkQvOHBiRlNOS1JPUW5nbTJMaHVHWEgydGZSQnpLR2cv?=
 =?utf-8?B?NSsyczV4Z0o4cnN6aWVCTWl2aEd1QksrcWRTNktmdzZxMk5iK0Q4dnkrS1ZG?=
 =?utf-8?B?Z2ZaZTE3RVJpSmh3MG5Wa0t5Nks1YllqTjM3SXRwQk9kMTMzMHBpdDZMV2N6?=
 =?utf-8?B?MXZGQlRSSS80Smp3YTFqU3JiTng2b2V1S3MzQ3gwc2NOcE0rYlNQcm1wazFF?=
 =?utf-8?B?UzBCOWZ0dUpiVTFodE53cTZUNmkvZGczcTM2TWU1QTRHRFN5SVY2RllWK3Fn?=
 =?utf-8?B?cEVBbEgyYjJUMEdSclVOZDlJOEk4VFkvSStsK0l2N0F1VGFyYVNaZ1QwdDN3?=
 =?utf-8?B?WXpDeG1YOVYyNTZNYVlvcSt6TVl1UnZrNTNabDdQY3BUalJpNUs5YmxTVG5F?=
 =?utf-8?B?OFp6OWN5OFZFT3RpZUpEeE12SW9YZUVTNTV0SVlaTWt0TUpOVy9ZNG14RUo1?=
 =?utf-8?B?N2QvS2JYVXdUK2JaSkFQZHcvdnRqU05IQ1EzcjNUaUxpWmNaZkkxN2t4QmVw?=
 =?utf-8?B?L2tzSTFlZk0zanRtcGRBaFgzQzZzblduQ0UxSllpTVhLRkhCWFlYSDNDVzMz?=
 =?utf-8?B?dld1YkJaNGJzMkYxUmdZcWY0RkszSmY4eDR4TmlFcUtLY3lJbnFWTUFZcXF1?=
 =?utf-8?B?UUZId29sRmpiYjdVaGVKTnU0bWVSK2VraENSalV3TTR3MjhvcG9waFN6aWxy?=
 =?utf-8?B?a3gzdm1hQ1E1bDVsc2dzUlZtOVMvMGRvY1U5emVLN3htNkV0UGk5dDZTWm1D?=
 =?utf-8?B?RnY1dS9IaXdSYlU2VWl5TFFhcVMyWjBVTCtveVV0bnEraGsyOS9mcEQ1dVUv?=
 =?utf-8?B?ZjVtMU5zdlppaVZrQ0tQdWpvMjkvMkNhRjZmYXBCKzJnVHlkVmRQdHhBZkwz?=
 =?utf-8?B?bjJDZHB3Rkp5blhUSmMyc1RvZTJVaHdMTlpkeHlVZmJKTUszdThTYzVSeUx2?=
 =?utf-8?B?ak1PR1RVTUNnNFNqM25BQUxLNWFyN0RQNGFNenM4dmk0MEZEL0RYUk1oQ1Ax?=
 =?utf-8?B?a2thaXdIUXQ5Yk0ycjBvMmhyQno5RjdER3REUkVBaUh0RmVZVnFKQ3MrZ0hT?=
 =?utf-8?B?TUdhSERJdnNka0dVdmVsbVljS1NwdU9GYnBpSS8zeEpOeTFLb0JqcjlFOXRC?=
 =?utf-8?B?NW45dmlCOW9iMFJYUVQ4M3RJRWVmdlRpc09HanRaUzdGRUNUSXdjaXZ5YUMr?=
 =?utf-8?B?cVJsTGljMmpjdUk1bTd3bldwN29YU3dlMEkvWGpoTWdjTlM1OUQrRGlEcERv?=
 =?utf-8?B?cElwVGRtMUZJby92cktFS3Iyend4YUdEMnMxZjVvamFFZjhMK1NtS3g4OVN1?=
 =?utf-8?B?VWJUMVBJRnFCamozZitaRUF1alVwYXhDYnlSY2FwZDlXQll2T0hsRm1aNGRC?=
 =?utf-8?B?Mkh4UmlRK0tzN01vWUxIUHRwOVR5WEFvZXhLQ1VucEp5RXhKU3VsVm56Z1dj?=
 =?utf-8?B?azhiZUtMVlF5VGdnTzN0T2VXcFNEczIzYW1tTms3UjZPazBtNlhwcFhaby9B?=
 =?utf-8?B?R1J4eVZMbXh5T1BEcFBqTXF3YXh2Y004NnNlaERxWitWQ1NZV3BQeTllV1lh?=
 =?utf-8?B?bHJZOWtxbFZkT0s1N3RXM3FQcDdhVXVHcDliUE1sbDI4MVdUZy95b3BZOHpy?=
 =?utf-8?B?SjFBdjljck1DUnMvNFdPdURQTVpmOUVnc2UxY2o1d1NJNlBnbXV1OUNXOFM0?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da8f6793-326a-4b27-28d9-08dcc5b6ccf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 10:06:49.3139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WZM6dK77TttGw1n5f72J8omxVmf/Anr658EKn3Gd//EQS0ysWUkU85fmykH0s7icEQh6B7lsWk8AagQTylrSt1lz1EWBb7/xpFsiFd05PT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11559

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogTW9uZGF5LCBBdWd1
c3QgMjYsIDIwMjQgMTA6NTYgQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2M10gbWVkaWE6IHBs
YXRmb3JtOiByemcybC1jcnU6IHJ6ZzJsLXZpZGVvOiBNb3ZlIHJlcXVlc3RfaXJxKCkgdG8gcHJv
YmUoKQ0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgQXVnIDI2LCAyMDI0IGF0IDExOjUw
4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+
IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4NCj4gPiA+IE9uIE1vbiwgQXVnIDI2LCAyMDI0IGF0IDA4OjA4OjMzQU0gKzAwMDAsIEJpanUg
RGFzIHdyb3RlOg0KPiA+ID4gPiBPbiBNb25kYXksIEF1Z3VzdCAyNiwgMjAyNCA4OjI3IEFNLCBj
bGF1ZGl1IGJlem5lYSB3cm90ZToNCj4gPiA+ID4gPiBPbiAyNC4wOC4yMDI0IDIxOjIxLCBCaWp1
IERhcyB3cm90ZToNCj4gPiA+ID4gPiA+IEBAIC0yNzAsOSArMjcwLDE0IEBAIHN0YXRpYyBpbnQg
cnpnMmxfY3J1X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiA+ID4g
PiAgICAgICAgIGNydS0+ZGV2ID0gJnBkZXYtPmRldjsNCj4gPiA+ID4gPiA+ICAgICAgICAgY3J1
LT5pbmZvID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOw0KPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+IC0gICAgICAgY3J1LT5pbWFnZV9jb252X2lycSA9IHBsYXRmb3JtX2dl
dF9pcnEocGRldiwgMCk7DQo+ID4gPiA+ID4gPiAtICAgICAgIGlmIChjcnUtPmltYWdlX2NvbnZf
aXJxIDwgMCkNCj4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gY3J1LT5pbWFnZV9j
b252X2lycTsNCj4gPiA+ID4gPiA+ICsgICAgICAgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2
LCAwKTsNCj4gPiA+ID4gPiA+ICsgICAgICAgaWYgKGlycSA8IDApDQo+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgcmV0dXJuIGlycTsNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsgICAg
ICAgcmV0ID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBpcnEsIHJ6ZzJsX2NydV9pcnEs
IElSUUZfU0hBUkVELA0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEtCVUlMRF9NT0ROQU1FLCBjcnUpOw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQmVjYXVzZSB0aGlz
IGlzIHJlcXVlc3RlZCB3LyBJUlFGX1NIQVJFRCB0aGUgZnJlZV9pcnEoKSAtPg0KPiA+ID4gPiA+
IF9fZnJlZV9pcnEoKSBbMV0gd2lsbCBjYWxsIHRoZSBJUlEgaGFuZGxlciB0byBzaW11bGF0ZSBh
biBJUlENCj4gPiA+ID4gPiBTSEFSRSBzY2VuYXJpbyB3aGVyZSBvdGhlciBkZXZpY2UgZ2VuZXJh
dGUgYW4gaW50ZXJydXB0Lg0KPiA+ID4NCj4gPiA+IEdvb2QgcG9pbnQsIEkgaGFkIG1pc3NlZCB0
aGF0Lg0KPiA+ID4NCj4gPiA+ID4gQ3VycmVudGx5IENTSSBkcml2ZXIgaXMgbm90IHJlZ2lzdGVy
ZWQgYW55IGludGVycnVwdHMgYW5kIENSVSBpcyB0aGUgc2luZ2xlIHVzZXIuDQo+ID4gPg0KPiA+
ID4gUmVnYXJkbGVzcywgdGhlIGZhY3QgdGhhdCB0aGUgSVJRIGlzIHJlcXVlc3RlZCB3aXRoIElS
UUZfU0hBUkVEDQo+ID4gPiBtZWFucyB0aGF0IHRoZSBJUlEgaGFuZGxlciBuZWVkcyB0byBiZSBw
cmVwYXJlZCB0byBiZSBjYWxsZWQgYXQgYW55DQo+ID4gPiB0aW1lIGZyb20gdGhlIHBvaW50IG9m
IHJlZ2lzdHJhdGlvbiB0byB0aGUgcG9pbnQgdGhlIElSUSBpcyBmcmVlZC4gVGhpcyBpcyB0ZXN0
ZWQgYnkNCj4gQ09ORklHX0RFQlVHX1NISVJRPXksIHdoaWNoIHlvdSBzaG91bGQgZW5hYmxlIGZv
ciB0ZXN0aW5nLg0KPiA+DQo+ID4gRm9yIHNpbmdsZSB1c2VyLCB0ZXN0aW5nIENPTkZJR19ERUJV
R19TSElSUT15IHRoaXMgZG9lcyBub3QgbWFrZSBhbnkNCj4gPiBzZW5zZS4gU2VlIFsxXSBbMV0N
Cj4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMS1yYzUvc291cmNlL2tl
cm5lbC9pcnEvbWFuYWdlLmMjDQo+ID4gTDE5NjUNCj4gPg0KPiA+ID4NCj4gPiA+IElmIHlvdSBk
b24ndCBuZWVkIHRvIHNoYXJlIHRoZSBpbnRlcnJ1cHQgd2l0aCBhbnkgb3RoZXIgZGV2aWNlLCB5
b3UgY2FuIGRyb3AgdGhlIElSUUZfU0hBUkVELg0KPiA+DQo+ID4gSSB3aWxsIGRyb3AgSVJRRl9T
SEFSRUQgZmxhZ3MgaW5zdGVhZCBhcyB0aGVyZSBpcyBzaW5nbGUgdXNlciBhbmQgd2lsbA0KPiA+
IHNlbmQgUkZDIGZvciBkcm9wcGluZyBjYWxsaW5nIElSUSBoYW5kbGVyIGZvciBzaW5nbGUgdXNl
ciB3aXRoDQo+ID4gQ09ORklHX0RFQlVHX1NISVJRPXkNCj4gPg0KPiA+IFBsZWFzZSBsZXQgbWUg
a25vdyBpcyBpdCBmaW5lIGZvciB5b3U/DQo+IA0KPiBJTUhPIHRoZSBsYXR0ZXIgaXMgbm90IGEg
Z29vZCBpZGVhOiBpZiB5b3UgcmVnaXN0ZXIgYW4gaW50ZXJydXB0IGhhbmRsZXIgd2l0aCBJUlFG
X1NIQVJFRCwgeW91IHNob3VsZA0KPiBiZSBwcmVwYXJlZCBmb3IgdGhlIGhhbmRsZXIgYmVpbmcg
Y2FsbGVkIGF0IGFueSB0aW1lLCBhbmQgdGVzdCB0aGF0LiBSZWdhcmRsZXNzIG9mIHdoZXRoZXIg
dGhlcmUgaXMNCj4gb25seSBhIHNpbmdsZSB1c2VyIG9yIG5vdC4NCg0KT0ssIHdpbGwgZHJvcCBz
ZW5kaW5nIFJGQy4gDQoNCkNoZWVycywNCkJpanUNCg==

