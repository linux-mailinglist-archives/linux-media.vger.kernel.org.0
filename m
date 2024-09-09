Return-Path: <linux-media+bounces-17911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 714C0970DB4
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 07:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2F9F1F236DB
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 05:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FE91AD3FE;
	Mon,  9 Sep 2024 05:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EtYGADbc"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9F21AC8A5;
	Mon,  9 Sep 2024 05:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725860735; cv=fail; b=b8Wyw4fgIdPkjZy2yEpa2p74iZQW6mOIrhnRWwPe5E7OEPj6VX2hnc6hnKXYh3ZTvYDljmqg0ANHd2s0YvbWHo4kDIXafXPMeozdyFwMGDJB7lEAsR4tXg37Enb7QV/oal5enR4mtc3tUL55gCAb+83PEmuWHiADPXOiNwOkOfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725860735; c=relaxed/simple;
	bh=4qf/J4AZCm+D7Ylk1ketegY4VdEFepErqEKamS/Rnto=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oBAgKXdrdqzMFcJb+RcOJ1gCpBGci6Fv1FbfGnBGsKYzdUdmS3hjxU0uaxZYFgy18qEDrU2DCymcC/9C8A6huZbo0k7WsaMBo4hnvRKT/WKf9pnsCl9kILwEb/B8U1JnwFYcadzvLLO9mewdpLWss/zKJBfG79OIww+TbFaUdS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EtYGADbc; arc=fail smtp.client-ip=52.101.229.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AR3MiAscZHImQA3+sss/0TBl6rzR3MLWrEgLujg3w8jlbS3KSu3BlghfRdV+N+qgpTsMhkctU7VTnpEwIo6pSlTY7uNHn2llnZAL2aZkADIYAXSIjn9AfXFsR6RnWP74d2ybnh53ri5wJrnG9FcbvjuwQKzbvnsxl5xQRTA27yyH9SFd6Y3aA3qFxFHNJN50cfoWpHPumxUoEMg8RzHTPnfjRadXL5Fjqq9YB64I53NyNGW6XD1LmnPB+iMsIYz2DYiBBjCalU7q5p1+VCKIUmTjGGJZ2MU/usK0MtVm8XRX2w3bF2io44dC5f4NolmUlRDsOjFYmyqs5JMS5H+Ucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qf/J4AZCm+D7Ylk1ketegY4VdEFepErqEKamS/Rnto=;
 b=sND8BQF50yGyVG3FFT9Ttul+YPN9QeqFusRZjKI2n3mrmygGOXu5wPPO4yZc7pyeFFYGXwnuW0tLRkwZLFL83pnJDuK06shE5tn6UoP/UnQ9XFElha9jpyzPzliYHbl1P3nwqMlPVKpLcED57Z/yIkAO/mxcEGDFTsBWjp1fwW0S8BVX2EMFVfKjxMieX2rRJ5CZnDJZ82740j1H8wgrpiSR/rbNRbujrqvgH4yTuVlRSbMAUDD3ZDHaIxuV0utTAm2esIkJqMaE8g8FFpKg5aBqSB76zyYHRO11QhFMnnTVIwmvwN5Vn4ZqzAh9kZRJK+JYbN+U8lnsI92xq1oTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qf/J4AZCm+D7Ylk1ketegY4VdEFepErqEKamS/Rnto=;
 b=EtYGADbcrrQH6ydn8h0g5EnQICQ/OrONlzfZDSehUQZqVVyNgjvt/bbdFuglPR96fFS78RCNz6fwtuFot2dzCzG5c101ydbDopIzpx7SgBK0ya3X71zeFlgMZMf/Dk1aS750G/FwAb2d0YJ1f66KkCDGtte9JmZsAwqHSNq7Eu0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB13137.jpnprd01.prod.outlook.com (2603:1096:405:165::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 05:45:27 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 05:45:20 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Hien Huynh <hien.huynh.px@renesas.com>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Set AXI burst
 max length
Thread-Topic: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Set AXI burst
 max length
Thread-Index: AQHa/4Vayw10oWeJKk+GlBZb9vTbq7JLcqoAgAB+MjCAAKfvAIACXt9A
Date: Mon, 9 Sep 2024 05:45:20 +0000
Message-ID:
 <TY3PR01MB11346774C42D8B1D837E9D41086992@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240905111828.159670-1-biju.das.jz@bp.renesas.com>
 <20240906235948.GH27086@pendragon.ideasonboard.com>
 <TY3PR01MB113461F40823C3404EB4E61AA869F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240907173232.GE15491@pendragon.ideasonboard.com>
In-Reply-To: <20240907173232.GE15491@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB13137:EE_
x-ms-office365-filtering-correlation-id: eefe3df9-09d3-42e7-7bbb-08dcd092978d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K1dlaWROdDZUbGFEeUhPN1I2VGVZMGJlSzBBcHZoUkVvZHg5c21rQ0xuRlhH?=
 =?utf-8?B?cnZsSnBpSk5aWmwvWlZEb250cVlSYkdEODhlV0hoaS9VV0Rlc2VNZlVMRnQ5?=
 =?utf-8?B?RTZFOHI2OXlpRkpadUsxcUhwY20wUTYrbTVNTlhrT2Vpdi95V1hSUzZDRldI?=
 =?utf-8?B?dzhVWkRtSWtVZVR4aWhFUGxxZml4ZDdKcGl6UGQ5TnRBWEtpN3B4a2FLckZF?=
 =?utf-8?B?Z3lwUkQxaUtiUHYraDBiTU5YUUhyRkNLUCtyOUJVd1UvdXpONkFDM0RPd3FB?=
 =?utf-8?B?eC9pLzNreE12VVJqdE9UcHFsbHJ5cTN2NHBUZ1N4ZDlHaVM2QVlmeHZybUFx?=
 =?utf-8?B?SDdpQTA4bXVMYTM5T2xhZTQvZWFkVmw5OHFLeEc5a2pnOFBlYmRBcENHQVVN?=
 =?utf-8?B?NTNzZWF3Z2crWURUMVVCSG50RHk1MHNWcnIySGsvREtycUl2cUIxU0pqalV5?=
 =?utf-8?B?QUhZNU94TWNjZ0VnRS9lY0hLWUZ5TVVSZHpLTmcvVnNKUFExMnpVN01YL3JW?=
 =?utf-8?B?bllod2VYL3N2U2V2NEpZVC9sUTU4U0VsaWJ1TGQ5V2QzUEl5MGg4d0pZTTFS?=
 =?utf-8?B?U1Y5SFpBdHlWdTM1cVB3aEE0VDZWWVFleEhIc3cxTUU5NnhUYVZTS21zZU9J?=
 =?utf-8?B?N3VyUWorSHVGZEtPOFdWVEZJUVBHM0lwZHF0S0xRV05IakNpV21EQ2U3VjVs?=
 =?utf-8?B?bFk1VWJOK09heitlTU1pOHlyNFJIeE03M1ZCZmF0aTNLM08vQXhHbXlwT1lO?=
 =?utf-8?B?OHl6U3ljcmhyYnIwL2oxOWxjMTltQVZ3bVBXbi9XMGJkZ2wvN3Nsc1pnWkdC?=
 =?utf-8?B?SGRQeGZCbE1HUWRhdURGdittRnYrbWoxWE1Td1llOEl5WnA5M3l2ZjM5RitV?=
 =?utf-8?B?WmlRS3BDY0QxamZGeGQ2SmJ0RGVybkdGd1ZBZVJ3WG5IV1dtenExVGt6K1ov?=
 =?utf-8?B?VnBneWs0RVlySXhjM0x3NE5RY1dyNGV1aW5idkdkN0RFNFN6Uk55Mm5qK21F?=
 =?utf-8?B?cXlSUHRBQVVLdU9rcnE4MC9iQXUrWU9sVnlZWFVHRGVKRGtiSFBUeUpVK3RY?=
 =?utf-8?B?Qk5Kd3hyL1haNHRrSVFmNGJZOUNBY1FmR0NOSXBJd0IxeVRjV0hNM3d2MkRB?=
 =?utf-8?B?MFRGTzlGUG9QUG9TZi9qZ0E2bnBtWkQvdHNaWVY3UldIUDdxMUZXOSsxVEI1?=
 =?utf-8?B?UWs0VE5KbjB5eWg4cW94ZE5LbWVKa2Yrem1SYTUxa1Izbkw4UlhKWHVWRDJE?=
 =?utf-8?B?NGl5ZUQ2VjNTUG5OakxhTSt2TmNGUm1ZOE4zZHZaNEpTKzR0S0dWM1BVdjJ5?=
 =?utf-8?B?c25nQmlMU3pHLzhMYXI4Zm9INSt2aDRES05SOWhMS2lrNzdyOHRoc0JMNmxF?=
 =?utf-8?B?eml1S0JISFAwdmJ4N29xOGZ5MndJOFJiTW1iTVFwT3ltOVJFK1hoMzNoTVBU?=
 =?utf-8?B?WUZCR3pET0JJd3dyc1VhS21XMXhnbHFIMFI3QnYvR0pzOVVQeDJEaVBzc29U?=
 =?utf-8?B?RnlHenhzWC91NUhQNnRxZkJZb0szVTJydFplNU82VWJBTUovZUNGY0pBZjVR?=
 =?utf-8?B?VGxjS0NnU29ScnQ5QWwwQ01uYllMT09CeXJhMDJrUVRRVGt6cWZwS1ZQUDlj?=
 =?utf-8?B?Z2FtYTVPRmNOVFZUdGxQV0NtRFV3WFdRZFhXRnZ6cm1zNEV1K0dZY3J2dm8x?=
 =?utf-8?B?ckZNYUNLb1NFM3h1NVBuQU1jRjdZRXdNMkc0eG5lZ2R3cWVYOGFwTzlkOGQ2?=
 =?utf-8?B?OEJtdDZGVitRNVhVelNLYUJxQlZOUEhOT2YzZEcyYnMrNXQ1T21DN2szZ1FI?=
 =?utf-8?B?bjVvN1JteEJpcmtZTWRNYmVhbVRCcnhZQXRiekUyOG9KZ2dPRE5ZamdwdlRS?=
 =?utf-8?B?VXBCeTc0ZGpQZkJaaGp0bW03M0JFaXczN0h1S29ieUMzV0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dDB2VU9WUTVzbjArRlZRRlZueXpZeHZoUW1XaWxrbHh6Q1l2bFY4R0ZxcU1q?=
 =?utf-8?B?TDhPY3d0VDhid1MycTR6Z2xtRTVjdTRneDhPbThRYTM0K2V2eVR1UWg3Q2dG?=
 =?utf-8?B?ZmZoTzNOWWpYaVhDa2hjb2xEK2V3aTQ5VEM1ckJla3M2VnZtb05CaXoxdUlT?=
 =?utf-8?B?YkprUnMrclFBeG12bm9BM1lNbS9wNU5TK1kzazJXNk5vZ1RyQUhvQkhOY3Bm?=
 =?utf-8?B?UjQyRmF3bEVVVW1LR25KZG8rZk1HdC95THN6S0dGa1RJNmhrTkV1NDNtVHhl?=
 =?utf-8?B?bERNUzZDNTRTbVo5OUhLQ2dtL25GSmlOQkNvOXNaZmYxZ2hOYjFIb2wrSFpJ?=
 =?utf-8?B?a1E5dGJBNTVuS01zZE0rUm52V2VDeWRBMjBLSS9sVHFpN09hbzFMdlNvNXo5?=
 =?utf-8?B?SjdmTVVoUk1UQk0vZXFsRWx5cjJZZncxLzE5NGthdmtpQ1p6WVE5QVlYNDcr?=
 =?utf-8?B?U3dUR2dESWgzemU5WlJ6cDF1Q1BncDdIaFUrTmgwK01yRkxZL29JK2xyd0do?=
 =?utf-8?B?R2JrdHlkNnhlblZCUUZuTElqeVdIMG52YnlJdlZPRWFRbHZycUNCdkNqT0xh?=
 =?utf-8?B?U3VPWEZwKy9ZVWpWWE1IZFV1a000Y3B6bnJCRFhmcWtIWlZ0eEtSRDJuSmRC?=
 =?utf-8?B?ZmYvNnpmMXdBY2U4bFpIS0R1a3JJNCtwemdzZnhma0MvMkd4cDBHblVIZ0o1?=
 =?utf-8?B?NW5ZZjlNbldiWGNNS2lHM1ltNGJiK2kwTGlNN1JlVlQ4Zys2YmJuMEw3KzRL?=
 =?utf-8?B?b0V3dE4vR1NKdEUzcStlYkgxZmtRYUdZNXFDc2hGbUJuVWdZZHpYc0MvRk5v?=
 =?utf-8?B?VnU5R3YyQ0llQVZUVHlIVWpoMkpqR1kwYzltOUdGN0hwTnhCeE93elFpbnhy?=
 =?utf-8?B?S2M2N0hzUnpFTHUxSEkzaEg1cmw4OTVjQTNrcC9TREpTb01EckpRakZuQVBP?=
 =?utf-8?B?TFJCUmtpUXA2SXc3N2x0L0sxVzNwd2xoYTN5M1p0NHRhSG5rdHFoVWlYWHVI?=
 =?utf-8?B?RzdOYTgwbXo1dENDZmtzak80ekIxaHAzQ2dLeDZqakpuZjlyNGQ0TDFuaGxh?=
 =?utf-8?B?T3BQazJBOEFGUms2d3dMdnEwZE9oZ0NnUHN3ZjM4cEttbC9BWmFjL0JGV0F4?=
 =?utf-8?B?TnhGOU1zL3E5cnV6T0JXNHBrRHdvQTRHek1ZeEZ3QVRQdDhCVDlxampHNVFV?=
 =?utf-8?B?OWFXVytjSXNFL1hsaFJXb1RQOEFKL0xaNDkrYnRUUXA3TG0vZUlYUzhaMWFr?=
 =?utf-8?B?N0pBZWR0TjUyMUFVY3FacHlpZUU4b3RsNUd2QzZVa0taUld4ZWdSKzdEQS81?=
 =?utf-8?B?LzBuN1FObTV5NVdWU1lJRXFaZWFxb2NpTE5HOVZNejA3RXZMajRMY3Q3cmtR?=
 =?utf-8?B?TFFFdUl1YS9zd09wN3R0ZnQ1djVOdSs1YW5PRnRpNTV3SnhLdjBYdFZhM1Uw?=
 =?utf-8?B?Sjl2eDM3OE1IcEhZWG1ndkkwTW9iWmFraDkxcytOSDVyMFRwWkFmaVlWbnZW?=
 =?utf-8?B?cERnUnNZZVd6bGpWU1A0ajVseXp5OE0wbXFzK0xvZDBaUXlLbjB5UTV0bHFq?=
 =?utf-8?B?UkZLQy83YndhVG1jRWxBcFNqWDl1aUVLM3FFOVBzU3dJUUVvdCszZHRoSVZj?=
 =?utf-8?B?S291NUIyRWo4a3JVWUJwNnczZHY4OHNQeFZDcWN0b1BySjZKY2swdno0YkZX?=
 =?utf-8?B?eSt1eFVhZGF0OWN5dzdXYVdpSG5PUWFxc2NGRkNpSnBGRWZta09DUlAzeVZM?=
 =?utf-8?B?NXFMcURFUitEVzYzZFg4cEFudUxJVDZScURMcmQwOWFSRXZ5aWVqZk1ydFBx?=
 =?utf-8?B?RTE1b090WFZLM2FldUVpV0ltb0pvVjJyNEZpa3l2d1YxdG1TODE1YWlhajVy?=
 =?utf-8?B?VnFpbUJpazRGK2pkc2NPV2tuek9ZaExHRXhYcTBKSDdJb2l4UlJwckdtdEo5?=
 =?utf-8?B?aDMyeXNFclBqR3lHZkhoQzNlSjhSV1JpQXVHQ2w1MktkTy9UNEZ4M09tcHY4?=
 =?utf-8?B?SGl0NEg4UWlBWm9jZU1FR1ZrWnVnNTJJSEUycjlJbEpCakcwKzBadVZqRGty?=
 =?utf-8?B?ZTVjVS9PazNqdkU3WUp2QjhQSjJlM2hBZWVzbzNIcldIdk8rVDVJeUJremZC?=
 =?utf-8?B?VTByekZCeklnY0xIZkVhRGNPTUZoSnpnWmtKUmh5SHVkVWZHRXNHMDB3N0RI?=
 =?utf-8?B?Ymc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eefe3df9-09d3-42e7-7bbb-08dcd092978d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2024 05:45:20.5643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bULlFjruzu/QV0gljVLLF6q9M3rTW0dymZXUd5LSp2tkKqC9Y6Sgp3oikARBOgRhtTcimqzgkuvCw5o4LiBJaSd0qfgzZxp3PM/+LlB9ytw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13137

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBTYXR1cmRheSwg
U2VwdGVtYmVyIDcsIDIwMjQgNjozMyBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBtZWRpYTog
cGxhdGZvcm06IHJ6ZzJsLWNydTogcnpnMmwtdmlkZW86IFNldCBBWEkgYnVyc3QgbWF4IGxlbmd0
aA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFNhdCwgU2VwIDA3LCAyMDI0IGF0IDA3OjQxOjI0
QU0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IE9uIFNhdHVyZGF5LCBTZXB0ZW1iZXIgNywg
MjAyNCAxOjAwIEFNLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+ID4gT24gVGh1LCBTZXAg
MDUsIDIwMjQgYXQgMTI6MTg6MjZQTSArMDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiA+IEFz
IHBlciB0aGUgaGFyZHdhcmUgbWFudWFsIHNlY3Rpb24gMzUuMi4zLjI2ICdBWEkgTWFzdGVyIFRy
YW5zZmVyDQo+ID4gPiA+IFNldHRpbmcgUmVnaXN0ZXIgZm9yIENSVSBJbWFnZSBEYXRhOywgaXQg
aXMgbWVudGlvbmVkIHRoYXQgdG8NCj4gPiA+ID4gaW1wcm92ZSB0aGUgdHJhbnNmZXINCj4gPiA+
DQo+ID4gPiBzLzsvJy8NCj4gPg0KPiA+IE9vcHMsIFdpbGwgZml4IHRoaXMgaW4gbmV4dCB2ZXJz
aW9uLg0KPiA+DQo+ID4gPiA+IHBlcmZvcm1hbmNlIG9mIENSVSwgaXQgaXMgcmVjb21tZW5kZWQg
dG8gdXNlIEFYSUxFTiB2YWx1ZSAnMHhmJw0KPiA+ID4gPiBmb3IgQVhJIGJ1cnN0IG1heCBsZW5n
dGggc2V0dGluZyBmb3IgaW1hZ2UgZGF0YS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogSGllbiBIdXluaCA8aGllbi5odXluaC5weEByZW5lc2FzLmNvbT4NCj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiAt
LS0NCj4gPiA+ID4gIC4uLi9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC12
aWRlby5jICAgIHwgMTEgKysrKysrKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiA+
ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVv
LmMNCj4gPiA+ID4gaW5kZXggMzc0ZGMwODQ3MTdmLi5kMTdlM2VhYzQxNzcgMTAwNjQ0DQo+ID4g
PiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwt
dmlkZW8uYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpn
MmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiA+ID4gQEAgLTUyLDYgKzUyLDExIEBADQo+ID4gPiA+
ICAjZGVmaW5lIEFNbk1CUwkJCQkweDE0Yw0KPiA+ID4gPiAgI2RlZmluZSBBTW5NQlNfTUJTVFMJ
CQkweDcNCj4gPiA+ID4NCj4gPiA+ID4gKy8qIEFYSSBNYXN0ZXIgVHJhbnNmZXIgU2V0dGluZyBS
ZWdpc3RlciBmb3IgQ1JVIEltYWdlIERhdGEgKi8NCj4gPiA+ID4gKyNkZWZpbmUgQU1uQVhJQVRU
UgkJCTB4MTU4DQo+ID4gPiA+ICsjZGVmaW5lIEFNbkFYSUFUVFJfQVhJTEVOX01BU0sJCUdFTk1B
U0soMywgMCkNCj4gPiA+ID4gKyNkZWZpbmUgQU1uQVhJQVRUUl9BWElMRU4JCSgweGYpDQo+ID4g
PiA+ICsNCj4gPiA+ID4gIC8qIEFYSSBNYXN0ZXIgRklGTyBQb2ludGVyIFJlZ2lzdGVyIGZvciBD
UlUgSW1hZ2UgRGF0YSAqLw0KPiA+ID4gPiAgI2RlZmluZSBBTW5GSUZPUE5UUgkJCTB4MTY4DQo+
ID4gPiA+ICAjZGVmaW5lIEFNbkZJRk9QTlRSX0ZJRk9XUE5UUgkJR0VOTUFTSyg3LCAwKQ0KPiA+
ID4gPiBAQCAtMjc4LDYgKzI4Myw3IEBAIHN0YXRpYyB2b2lkIHJ6ZzJsX2NydV9maWxsX2h3X3Ns
b3Qoc3RydWN0DQo+ID4gPiA+IHJ6ZzJsX2NydV9kZXYgKmNydSwgaW50IHNsb3QpICBzdGF0aWMg
dm9pZA0KPiA+ID4gPiByemcybF9jcnVfaW5pdGlhbGl6ZV9heGkoc3RydWN0IHJ6ZzJsX2NydV9k
ZXYgKmNydSkgIHsNCj4gPiA+ID4gIAl1bnNpZ25lZCBpbnQgc2xvdDsNCj4gPiA+ID4gKwl1MzIg
YW1uYXhpYXR0cjsNCj4gPiA+ID4NCj4gPiA+ID4gIAkvKg0KPiA+ID4gPiAgCSAqIFNldCBpbWFn
ZSBkYXRhIG1lbW9yeSBiYW5rcy4NCj4gPiA+ID4gQEAgLTI4Nyw2ICsyOTMsMTEgQEAgc3RhdGlj
IHZvaWQgcnpnMmxfY3J1X2luaXRpYWxpemVfYXhpKHN0cnVjdA0KPiA+ID4gPiByemcybF9jcnVf
ZGV2ICpjcnUpDQo+ID4gPiA+DQo+ID4gPiA+ICAJZm9yIChzbG90ID0gMDsgc2xvdCA8IGNydS0+
bnVtX2J1Zjsgc2xvdCsrKQ0KPiA+ID4gPiAgCQlyemcybF9jcnVfZmlsbF9od19zbG90KGNydSwg
c2xvdCk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwkvKiBTZXQgQVhJIGJ1cnN0IG1heCBsZW5ndGgg
dG8gcmVjb21tZW5kZWQgc2V0dGluZyAqLw0KPiA+ID4gPiArCWFtbmF4aWF0dHIgPSByemcybF9j
cnVfcmVhZChjcnUsIEFNbkFYSUFUVFIpICYgfkFNbkFYSUFUVFJfQVhJTEVOX01BU0s7DQo+ID4g
PiA+ICsJYW1uYXhpYXR0ciB8PSBBTW5BWElBVFRSX0FYSUxFTjsNCj4gPiA+ID4gKwlyemcybF9j
cnVfd3JpdGUoY3J1LCBBTW5BWElBVFRSLCBhbW5heGlhdHRyKTsNCj4gPiA+DQo+ID4gPiBJdCB3
b3VsZCBiZSBtb3JlIGVmZmljaWVudCB0byBqdXN0IHdyaXRlDQo+ID4gPg0KPiA+ID4gCXJ6ZzJs
X2NydV93cml0ZShjcnUsIEFNbkFYSUFUVFIsIEFNbkFYSUFUVFJfQVhJTEVOKTsNCj4gPg0KPiA+
IEkgdGhvdWdodCBhYm91dCB0aGF0LiBCdXQgdGhlbiByZS1yZWFkaW5nIHJlZ2lzdGVyIGRlc2Ny
aXB0aW9uIGNoYW5nZWQNCj4gPiB0aGUgbWluZCBiZWNhdXNlIG9mIHRoZSBiZWxvdyBiaXRzDQo+
ID4NCj4gPiB7OSw4fSDigJQgMDFiIFIgUmVzZXJ2ZWQ6DQo+ID4gV2hlbiByZWFkLCB0aGUgaW5p
dGlhbCB2YWx1ZSBpcyByZWFkLiBXaGVuIHdyaXRpbmcsIGJlIHN1cmUgdG8gd3JpdGUgdGhlIGlu
aXRpYWwgdmFsdWUuDQo+ID4gT3BlcmF0aW9uIGlzIG5vdCBndWFyYW50ZWVkIGlmIGEgdmFsdWUg
b3RoZXIgdGhhbiB0aGUgaW5pdGlhbCB2YWx1ZSBpcyB3cml0dGVuLg0KPiA+DQo+ID4gezYsNH0g
4oCUIDEwMWIgUiBSZXNlcnZlZDoNCj4gPiBXaGVuIHJlYWQsIHRoZSBpbml0aWFsIHZhbHVlIGlz
IHJlYWQuIFdoZW4gd3JpdGluZywgYmUgc3VyZSB0byB3cml0ZSB0aGUgaW5pdGlhbCB2YWx1ZS4N
Cj4gPiBPcGVyYXRpb24gaXMgbm90IGd1YXJhbnRlZWQgaWYgYSB2YWx1ZSBvdGhlciB0aGFuIHRo
ZSBpbml0aWFsIHZhbHVlIGlzIHdyaXR0ZW4uDQo+ID4NCj4gPiBBbHNvLCBiaXRzIHsyNywyNH0s
IHsyMiwxNn0gYW5kIHsxMywxMn0gLTBiIDoNCj4gPg0KPiA+IEl0IGlzIG1lbnRpb25lZCB0aGF0
DQo+ID4gV2hlbiByZWFkLCB0aGUgaW5pdGlhbCB2YWx1ZSBpcyByZWFkLiBXaGVuIHdyaXRpbmcs
IGJlIHN1cmUgdG8gd3JpdGUgdGhlIGluaXRpYWwgdmFsdWUuDQo+ID4gb3BlcmF0aW9uIGlzIG5v
dCBndWFyYW50ZWVkIGlmIGEgdmFsdWUgb3RoZXIgdGhhbiB0aGUgaW5pdGlhbCB2YWx1ZSBpcyB3
cml0dGVuLg0KPiANCj4gTGV0J3Mga2VlcCB0aGUgY29kZSBhcy1pcyB0aGVuLiBJJ2xsIGZpeCB0
aGUgdHlwbyBpbiAoYW5kIHJlZmxvdykgdGhlIGNvbW1pdCBtZXNzYWdlIG15c2VsZiwgbm8gbmVl
ZA0KPiB0byByZXN1Ym1pdC4NCg0KVGhhbmtzIExhdXJlbnQuDQoNCkNoZWVycywNCkJpanUNCg0K
PiANCj4gPiA+IHRoZSBoYXJkd2FyZSBtYW51YWwgaG93ZXZlciBkb2Vzbid0IG1ha2UgaXQgY2xl
YXIgaWYgdGhpcyBpcyBzYWZlIG9yDQo+ID4gPiBub3QuIFRoZSByZXN0IG9mIHRoZSByZWdpc3Rl
ciBpcyByZXNlcnZlZCwgYW5kIHdyaXRlcyBhcyBkb2N1bWVudGVkDQo+ID4gPiBhcyBpZ25vcmVk
LCBidXQgdGhlIHJlc2V0IHZhbHVlIGlzIG5vbi16ZXJvLiBJZiBpdCdzIG5vdCBzYWZlIHRvDQo+
ID4gPiB3cml0ZSB0aGUgcmVzZXJ2ZWQgYml0cyB0byAwLA0KPiA+ID4NCj4gPiA+IFJldmlld2Vk
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
DQo+ID4gPg0KPiA+ID4gPiAgfQ0KPiA+ID4gPg0KPiA+ID4gPiAgc3RhdGljIHZvaWQgcnpnMmxf
Y3J1X2NzaTJfc2V0dXAoc3RydWN0IHJ6ZzJsX2NydV9kZXYgKmNydSwgYm9vbA0KPiA+ID4gPiAq
aW5wdXRfaXNfeXV2LA0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hh
cnQNCg==

