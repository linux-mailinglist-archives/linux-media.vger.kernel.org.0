Return-Path: <linux-media+bounces-12599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E388FD42C
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 19:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B2C3B20AA3
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 17:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F6F13A3FD;
	Wed,  5 Jun 2024 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jOMqU8ad"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11011008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FD4139D0A;
	Wed,  5 Jun 2024 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717608855; cv=fail; b=UrhrTw1Ql0oSl/1kEfNqfrvvcirG58V9FQf2edZKW7ZWYfzfljyUf+eoCdwEggeAaNj0YiXeb8ADCdlwxEEoNzo8qxD+6tOATJ/n8e0CuxU81lDMZRvTMkqa8nHrg2DrWMQ3R8sp8CJ9+MYKuU5nOeGDkgWZj8dEdcgszFSiK74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717608855; c=relaxed/simple;
	bh=lUiHgsaH0Esgxqo9yiZKy7STCCm+fCciwIkpx+YbSyY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a2lI27QuhpnvInOhQ4qqHVIX4yldBVP8MhflNplzyejoVlCdXKZcwwJGdNUEzXhy2PAMF8U7OqvACDPNszwAKcVOeOXD2vU6GTy52id05kYcpikWjIWQGN2QFHZywRemZYHIzZCiDtE6uqu2JHyolXV10ANNzALuGrfW/kDIFDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jOMqU8ad; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCikpvvFc9xx6mXuVF7ZzKh2FhD5wB2fb+6QSuf1b8zvjvR4DYtbQ9R1HcfUVKfoZqEvWxjN9Utq9zY+OOoTDKsKcnhnbN3cWcYHmoNfd4PyJpYBRK1ohckOpS/l9jNn0T5nmhsgdJ8+x749t964od4FjQfygfm4La02s6CVHiZ72rUK0gYcd3eUfSWHiAFJXpJXhb0F2Wn/Y7Hiy4fO58SFCaCeRwVlvoPi+gRr42oUJMsKjDLxb+0TQwyCYdMWgsDAxtkZW63LqFOuiKdD2HTIqwmZzZGpVRGeB4dLdQRumUY1/6lIzHPTN8+YPQIJQ6bYnRv0f3BNpicDgT3nRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUiHgsaH0Esgxqo9yiZKy7STCCm+fCciwIkpx+YbSyY=;
 b=jIbHzjPRwoCbRyOraDEmhDW55WnQ4j/8PZ5p9Lr3C8FJ5ZjbJtslWnPEhKRW+OuYjclE72Grxk2I42RxVjgxT5SLEk2Ts0Hu3HDA0nBdtlCIoBPKal3mMdZjjPRK13a2PMeDgqpNjYZaNybYmI63+3Vc+yunwtmgEy/Sv3mgQuYdXSz696wYCD64ycF/DLzvFnP3EnXJQYrZAxrHnPFhh/ZVFwpI3oPMyZYQeIzYI4ZDgaYmjKAV547IMp2Tp0/9zQlR2FmUAvr+VmcR3HMpCpg52oyWzFUwdclpQGCEyDNCuUrU5ohqUb49ZLcJbGuabYmr2/uDOXnbh5Z2xvqd6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUiHgsaH0Esgxqo9yiZKy7STCCm+fCciwIkpx+YbSyY=;
 b=jOMqU8adoYkQTQrrv1I68f3Gp+2d0w30U4lMnQE9eTKkr5Ic236wGAeDSqbw84wlKJKV4W5EAV3wuLYvzDxRyLJtB1PtwYhqV/5dkLJiNNHWIrQTo4xbBLI51fRKd8eG1GfZfzaGrQizjsTyKFTAOmUindMfUJaVXj0rCATcc/k=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSRPR01MB11596.jpnprd01.prod.outlook.com (2603:1096:604:22d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Wed, 5 Jun
 2024 17:34:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7633.033; Wed, 5 Jun 2024
 17:34:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>, "niklas.soderlund+renesas@ragnatech.se"
	<niklas.soderlund+renesas@ragnatech.se>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to rzg2l_cru_video_register()
Thread-Topic: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to rzg2l_cru_video_register()
Thread-Index: AQHaY15GRDCjPb6YokuayYQLl3wLOLFuGKaAgAUFPgCARvf84A==
Date: Wed, 5 Jun 2024 17:34:00 +0000
Message-ID:
 <TY3PR01MB113466789EB14C21F3646431786F92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240219180544.526537-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWO7n4oBr=U-DK2aa+S68kLX=VuzpuYDeA8KymzdnggNg@mail.gmail.com>
 <20240421134630.GA29222@pendragon.ideasonboard.com>
In-Reply-To: <20240421134630.GA29222@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSRPR01MB11596:EE_
x-ms-office365-filtering-correlation-id: b80a3f38-4a19-4091-b569-08dc8585aff3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?cUNMbDE2bUZEb0hmK3ZrNTZSNjF2ZjhLcjFtTnA0Qlp5bmN1NmhpcWpEN1hG?=
 =?utf-8?B?KzBmdkM3Z1ArOFQwZW5PQ0pNOXJnT0V0bUtoL0cxdkFjSFBqSUNkU0t2N1hU?=
 =?utf-8?B?RlZCNjRGZUlvc25rRGRwdmxSekJxVEo3RVBZdzl0UVE4b1V6dGV4VFBZYTBa?=
 =?utf-8?B?Ums5d3Nja1p1dDZTa0lZOUJaQXJHbnJHb05sVFBnNW05MFNrYkhtMFJxNk1D?=
 =?utf-8?B?T1VLT1V4ekpaSDF5STEvZU5SRmg3d1VaQUd6YVNOQWRkV2dScURrd3BQRWxy?=
 =?utf-8?B?Y3VLNVZxL25pRDBFUnliNitaa2dzUVU2UWU2bHZncUtlU2pvcHhQSFN6V0c0?=
 =?utf-8?B?TjVUTEpWNEtRLy9MckFML0VWeUp2NHBDaVpvcCtWVEp5b0pSUFZreTFxdkdk?=
 =?utf-8?B?czhVWnJXMW81VHlGSS9ydjhrNHpHbTRHWmp0ZUI4VmU2S3EwaGRndWREcGN1?=
 =?utf-8?B?MnlLYVc0RVpsNEJFcksxS1Q2MDU4Y3ZrQkJjZjVlT2NodWJtT3NwVnhTOEM3?=
 =?utf-8?B?Sy96S0hJem1oWFZvNk10MHhTeXM2dVFjd3NFTU1RdmdoRnJNenJiMzhoYVBp?=
 =?utf-8?B?NnBwWE43S3ExUXVLK0U5YlJpc3BOT0dhRzVIR0kzdjJZQ0IrU0N0OW1kWWFH?=
 =?utf-8?B?aXZ6dng4a2YyRVpCQkpudGd6YVEwMWgwdkMzWlRLNldlc0tWeG9jNEYxNUs1?=
 =?utf-8?B?SHdxd1dGUDIwZ3k3czFrajBRTGI2NExYZWE5OHRZR3VoVERLZmxBbXArY294?=
 =?utf-8?B?RzIrN3VjeEhxekU3cVFmLy9zWXdLbVk3c2FkenZwQzdXK0hseE5UVC9haitK?=
 =?utf-8?B?QzlRR3N0R1JFMnVrZ3F5ZkVOWW5VWUtiNTR0SzVOWXlWQjFsbGdGREUyby9I?=
 =?utf-8?B?dDlBa0hJU1hOa3ZpL0hJZGJPb0htNUh4NUt3N1E3ZnpCejF2d0hFUVc2ODk1?=
 =?utf-8?B?Y1BEWjFLc0llV0x3M0toTW45bnFscjhkMHp5cnE2UkQyUnV2dEE3U091RnVh?=
 =?utf-8?B?ZWx3NDRzbU5nRE1EcFdRR1hJV0hQYThHL2w4ZlhWVkZrUGRGWlVGY2hnUmhm?=
 =?utf-8?B?VEdzT04ra1lLTE5LL282bDN5TjNnS2ZVNG9mR1RFY0tPcSt2SnVmSlYvZjVv?=
 =?utf-8?B?bEtLMFYzQ2VPMGF0dnQ3SXRISkhLSEIwYlpvMzlYMzU4RHowL3g3dHB5WVdW?=
 =?utf-8?B?WFNEa1ZhMmg1V1lISC92Y0pDeVVMRm0wKzM4OW9wdkVGckthSy9xem5CVUo5?=
 =?utf-8?B?MTViUzRhR0RXV0RWZXVtRlp0UWorNXd6cXkzUUJIMER0bmZzTmhmVWtvTEVW?=
 =?utf-8?B?MHlEdU1xbmNWWkZ4WWZDemVSQ1diV0VWVktPWWNSTlF5N1RqN3N0TUJMMVJv?=
 =?utf-8?B?bzcxZnM4Z01VcVZxYTVqZFl1WWxDR3VUZlhBTFpsNWM0NjlTblhJTzRiOUt5?=
 =?utf-8?B?TlVWUEVTd0Y4ZnV6K0FmNjdOQXBCaytJZTVxYnlyZCtGQ09nWk9MNENPdWFH?=
 =?utf-8?B?UmxMZlluK2dhOVVaNnA2bGIxK2I1VDN1dlNWVVdiemZ1cHB4RFo3SXJpSFpQ?=
 =?utf-8?B?RFJadkUyRk1tZmMzQ0JiS1JGY1pTUmo1aW5OcWRRUDBLL0RKTTNqUHBYNExH?=
 =?utf-8?B?c0x5bEY1anhtVy9TZFR6aW5yOWNwVjFRakVZcVVMc3g2eU1ncnZ3ZTV2QmZG?=
 =?utf-8?B?MVVZVnNaakZOb3FETzIzYndBbVlZc3dZOUVKeUxJb1NRaFJCRk0xSXl6RWhu?=
 =?utf-8?B?UXVlQVdvaG50ZFZLT3A5RHZZd2xnMGVjUGZKelJqWEZiWDhKbU54a1cxdDJT?=
 =?utf-8?B?TzNTUkZTM0JSK3JLcGxDdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TDJwd0hzYU5YeEpQc09iSTk5aWUvT3ZuMU9JaW9Ma1lGam9xbnIwZk1nNG9o?=
 =?utf-8?B?WEJ4ZENYSlJ2cGNVeXlBdGJ6UTlsbDhEb3dmRW95dHU3emxHbHlKL08vMVlt?=
 =?utf-8?B?NGptNHFwVUN4bTBKaGtzTU1UNjE0SmppVWltT3hFMTBhYURpcm9FUzYzbFRl?=
 =?utf-8?B?ZUk1N2o4bi82Rkx2UVUrL09jTWx3QkxlT3dEbjhkMUczTmtYWnN4M3oxdTdD?=
 =?utf-8?B?Qkw5NlFlUVBDYkxreXlhV2thYVVuZDJ2OVhOaGhtd3NzTUZIQXJpUWdyQTVS?=
 =?utf-8?B?ZnNMS25kN0ZwZ3FuK0Y0UHpqeis1Vm9jUG1tS0ZaYVZubS9rVm9mVlFxZFp4?=
 =?utf-8?B?QkdZWjdYV0pKdFI3REVpTDM1T0EyWDROWGtsL3Z5dzNSaGpGa05ldkJqcEtv?=
 =?utf-8?B?RjNHTWxyYUVjSlAzM2JGYnBiSHZXbjhDMjdBWHdZNnFQbTRNRW54M1ZUMXBw?=
 =?utf-8?B?aWZPZWZMSGdoV2tXR0ZsaS9NMm5UWUJHaU1lK3NHemRaRFpXL1Q0WVlkelda?=
 =?utf-8?B?dk84M1dCWVhCc1RjK0tzclJpdzNDS3NSTStZR1pRSDZWOHhnV002bDBPL3lz?=
 =?utf-8?B?OUZpeVdTZHI1bTVxZjRtQzZ0UCtJTVVnT2FiU29BODdYelU4N1JNVUxHblIy?=
 =?utf-8?B?UEc5ZG0xNkFvNSt4a2x3akdrcm5KZy9mdVZzMHNHalJkU1V5cVUyTnNkS2hj?=
 =?utf-8?B?WjUvajY0dTlGSGFLa3B0UmV1YVNveE90TGE5TS82Q293OEJqdmRSbktpWFFx?=
 =?utf-8?B?SDdaNko3WW1pVi92YlQ5emRwOGVMNU9Gb0J3eDlTSVFUWURwZCt4eVBISlBs?=
 =?utf-8?B?UDFwaVRrdTB6bDRkd1RpY3A1YVAwVUc2NDFCcWtlaUdEUHVyakxMcnBveUN5?=
 =?utf-8?B?M3hGdDZWN3ZpVUFZU0NDNGp4WXpvc29Ka255c0dpVUZjMXV4ZjNpZHVSMnBu?=
 =?utf-8?B?aWs5MlhSZ3FBLy8xY3E4di9YMEVEdkR4KzgwUFB3NDlKcitSSllreTdVa0NZ?=
 =?utf-8?B?QjFHdUJIQk5mMVhYeDNXaStxUmllWndZa3BUbExXRUx1ZU90WWJJUTYrK014?=
 =?utf-8?B?ZHl3UFJGNnQ3WDliWWYzUkprMlhhS0VaMWI1Z01LM1NHWXVVS3NuanVrTFhN?=
 =?utf-8?B?S253NUYrVmJKTGhvSXJsaDFSQXJ0YjZyb2FCOGMvQ1I2WExkMDY2ZytpOEhx?=
 =?utf-8?B?RjhUWnhYRFZ1enBNVXJZdElOT0syWEEwWUR1NlNXZWhkVk1IOHJxN3Z3K0E0?=
 =?utf-8?B?bGVGeFpRbkFjbklHamtoYnhVa29kdm1Zc2FEVXRVeDQzREF1NHhvczdqaFVJ?=
 =?utf-8?B?M015SHQ4WDJrMXJLdXlSWkJPWFlNRnlwZCtKdEkzdDcrUkNjaEtlNlpraXNF?=
 =?utf-8?B?N2FrTTBhcXFpZTVZWEo1MTdScFRzbEZVSTZteWE0TWUvaUhoSndycG8wWVJu?=
 =?utf-8?B?dlArM0RrWXc5TVEwWFFraGtRNmM4azFob1JrT21lbHJIK1ZvQmxjV0dYQW5P?=
 =?utf-8?B?ZEpYR2tEbk5ubkQyYU4zOVZPdTZITnM0NllLVm1jZjVKUFkybkJsbnVsVXhj?=
 =?utf-8?B?eGlOR1RXMXFlRkEweDVydEppRHI3L3prSld3WTQ1SDdhcS9HRnhyMFpVc3Vq?=
 =?utf-8?B?Q3dzWkVtVzhhNk1tQWxnd09FYVdyNFE5NnIwZHlFbS9jM05jS1ZleTE1M0Fw?=
 =?utf-8?B?OUpiYzZzMUhLYlYvbUt2WDFrOXdRb21ZUXpyaEw1b2dubXRrTlJ6Q1FOWVIy?=
 =?utf-8?B?L0swY2lkdHpKOS81RXlVN0k4MlhmRkZBZmZRWGwydm5Jemw0NEhTWmRqcGt2?=
 =?utf-8?B?RlR3THoreGVXN251UlBzT05lekZGTitTaXNibDgrcDAyTGw1UVNXNTRDaFVy?=
 =?utf-8?B?NVAwVzBUaEFDblk5U3VETVRPMTQzSlJtSnlPUTZ2YTdQdFk4RmpnekJHSVA0?=
 =?utf-8?B?RE0xSG5kemFUcjJKZkFESXplZk1RRUlYUjBXQXZtMlVicXpoN0VQbk9LVXBh?=
 =?utf-8?B?TW1CNjdPQjZlTWxEbXkzMlVEZHRFS2Nva2ZuVnpLd2NNZU9KRXh1L25FdU1y?=
 =?utf-8?B?djdtbTlWYkhFWUtFdHNSMllCeW56RjJnenl3ZnV4MENmUVkzVjEyLzNlQmFu?=
 =?utf-8?B?cGt5ZmRlM2ZxWkpvc3dzcE9OMm1MMkc5WVBiZFY3MDJPa2FTeUZpYllJUG9J?=
 =?utf-8?B?UEE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b80a3f38-4a19-4091-b569-08dc8585aff3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 17:34:00.8497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8gugREV85bZS3BHAB0xZW3xfi516TCRwj2mNQEvS9l7hxC4ZK7fgLSiNHVitdYoR4BZwZ0GE10Ot/0zjOMfhKXIM78MYFdNSAGCgB0lhClM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11596

SGkgQWxsLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KQXMgZGlzY3Vzc2VkIGluIHRo
ZSB0aHJlYWQsIGl0IG1ha2Ugc2Vuc2UgdG8gcmVxdWVzdCB0aGUgSVJRIGF0IHByb2JlIHRpbWUN
Ckkgd2lsbCBzZW5kIG5leHQgdmVyc2lvbiBiYXNlZCBvbiB0aGlzLg0KDQpDaGVlcnMsDQpCaWp1
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBTdW5kYXksIEFw
cmlsIDIxLCAyMDI0IDI6NDcgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gbWVkaWE6IHBsYXRm
b3JtOiByemcybC1jcnU6IHJ6ZzJsLXZpZGVvOiBNb3ZlIHJlcXVlc3RfaXJxKCkgdG8NCj4gcnpn
MmxfY3J1X3ZpZGVvX3JlZ2lzdGVyKCkNCj4gDQo+IE9uIFRodSwgQXByIDE4LCAyMDI0IGF0IDEx
OjA2OjI3QU0gKzAyMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gPiBIaSBCaWp1LA0K
PiA+DQo+ID4gT24gTW9uLCBGZWIgMTksIDIwMjQgYXQgNzowNeKAr1BNIEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBNb3ZlIHJlcXVlc3RfaXJxKCkg
dG8gcnpnMmxfY3J1X3ZpZGVvX3JlZ2lzdGVyKCksIGluIG9yZGVyIHRvIGF2b2lkDQo+ID4gPiBy
ZXF1ZXN0aW5nIElSUSBkdXJpbmcgZGV2aWNlIHN0YXJ0IHdoaWNoIGhhcHBlbnMgZnJlcXVlbnRs
eS4NCj4gPiA+DQo+ID4gPiBTdWdnZXN0ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQNCj4gPiA+IDxs
YXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFRo
YW5rcyBmb3IgeW91ciBwYXRjaCENCj4gPg0KPiA+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC12aWRlby5jDQo+ID4gPiArKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPg0KPiA+
ID4gQEAgLTEwMTEsNiArMTAwMCw3IEBAIHZvaWQgcnpnMmxfY3J1X3ZpZGVvX3VucmVnaXN0ZXIo
c3RydWN0DQo+ID4gPiByemcybF9jcnVfZGV2ICpjcnUpICB7DQo+ID4gPiAgICAgICAgIG1lZGlh
X2RldmljZV91bnJlZ2lzdGVyKCZjcnUtPm1kZXYpOw0KPiA+ID4gICAgICAgICB2aWRlb191bnJl
Z2lzdGVyX2RldmljZSgmY3J1LT52ZGV2KTsNCj4gPiA+ICsgICAgICAgZnJlZV9pcnEoY3J1LT5p
bWFnZV9jb252X2lycSwgY3J1KTsNCj4gPiA+ICB9DQo+ID4gPg0KPiA+ID4gIGludCByemcybF9j
cnVfdmlkZW9fcmVnaXN0ZXIoc3RydWN0IHJ6ZzJsX2NydV9kZXYgKmNydSkgQEAgLTEwMTgsNg0K
PiA+ID4gKzEwMDgsMTMgQEAgaW50IHJ6ZzJsX2NydV92aWRlb19yZWdpc3RlcihzdHJ1Y3Qgcnpn
MmxfY3J1X2RldiAqY3J1KQ0KPiA+ID4gICAgICAgICBzdHJ1Y3QgdmlkZW9fZGV2aWNlICp2ZGV2
ID0gJmNydS0+dmRldjsNCj4gPiA+ICAgICAgICAgaW50IHJldDsNCj4gPiA+DQo+ID4gPiArICAg
ICAgIHJldCA9IHJlcXVlc3RfaXJxKGNydS0+aW1hZ2VfY29udl9pcnEsIHJ6ZzJsX2NydV9pcnEs
DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIElSUUZfU0hBUkVELCBLQlVJTERfTU9E
TkFNRSwgY3J1KTsNCj4gPiA+ICsgICAgICAgaWYgKHJldCkgew0KPiA+ID4gKyAgICAgICAgICAg
ICAgIGRldl9lcnIoY3J1LT5kZXYsICJmYWlsZWQgdG8gcmVxdWVzdCBpcnFcbiIpOw0KPiA+ID4g
KyAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gPiArICAgICAgIH0NCj4gPiA+ICsNCj4g
PiA+ICAgICAgICAgaWYgKHZpZGVvX2lzX3JlZ2lzdGVyZWQoJmNydS0+dmRldikpIHsNCj4gPg0K
PiA+IEhvdyBjYW4gdGhpcyBoYXBwZW4/IFBlcmhhcHMgcnpnMmxfY3J1X3ZpZGVvX3JlZ2lzdGVy
KCkgY2FuIGJlIGNhbGxlZA0KPiA+IG11bHRpcGxlIHRpbWVzIHRocm91Z2ggdGhlIHJ6ZzJsX2Ny
dV9ncm91cF9ub3RpZnlfY29tcGxldGUoKSBub3RpZmllcj8NCj4gDQo+IFRoZSBub3RpZmllciBj
b21wbGV0aW9uIGhhbmRsZXIgc2hvdWxkbid0IGJlIGNhbGxlZCBtdWx0aXBsZSB0aW1lcywgbm8u
DQo+IFRoZXJlJ3MgaG93ZXZlciBhIHBvc3NpYmlsaXR5IChJIHRoaW5rKSB0aGF0IGEgc3ViZGV2
IGNvdWxkIGRpc2FwcGVhciBvZiB0aGUgZGV2aWNlIGlzIHVuYm91bmQgZnJvbQ0KPiBpdHMgZHJp
dmVyLiBJZiB0aGUgZGV2aWNlIGlzIGxhdGVyIHJlYm91bmQsIHRoZSBub3RpZmllciBjb21wbGV0
aW9uIGhhbmRsZXIgY291bGQgYmUgY2FsbGVkIGFnYWluLg0KPiANCj4gVGhlIGlzc3VlIGlzIHRo
YXQgcnpnMmxfY3J1X3ZpZGVvX3VucmVnaXN0ZXIoKSBpcyBjYWxsZWQgZnJvbSAucmVtb3ZlKCku
DQo+IEkgdGhpbmsgYSBiZXR0ZXIgZml4IHdvdWxkIGJlIHRvIHJlcXVlc3QgdGhlIElSUSBhdCBw
cm9iZSB0aW1lIChvciBkaWQgd2UgZGlzY3VzcyB0aGF0IHByZXZpb3VzbHkNCj4gYW5kIGNvbmNs
dWRlZCBpdCBjb3VsZCBjYXVzZSBpc3N1ZXMgPykuIEkgd291bGQgYWxzbyBhcmd1ZSB0aGF0IHRo
ZSB2aWRlbyBkZXZpY2VzIHNob3VsZCBiZQ0KPiByZWdpc3RlcmVkIGF0IHByb2JlIHRpbWUsIG5v
dCBpbiB0aGUgbm90aWZpZXIgY29tcGxldGlvbiBoYW5kbGVyLg0KPiANCj4gPiBJZiB0aGF0IGlz
IHRydWUsIHRoZSByZXF1ZXN0X2lycSgpIHNob3VsZCBiZSBtb3ZlZCBhZnRlciB0aGlzIGJsb2Nr
LA0KPiA+IGp1c3QgYmVmb3JlIHRoZSBjYWxsIHRvIHZpZGVvX3JlZ2lzdGVyX2RldmljZSgpIGJl
bG93Lg0KPiA+DQo+ID4gPiAgICAgICAgICAgICAgICAgc3RydWN0IG1lZGlhX2VudGl0eSAqZW50
aXR5Ow0KPiA+ID4NCj4gPiA+IEBAIC0xMDMyLDE0ICsxMDI5LDE4IEBAIGludCByemcybF9jcnVf
dmlkZW9fcmVnaXN0ZXIoc3RydWN0IHJ6ZzJsX2NydV9kZXYgKmNydSkNCj4gPiA+ICAgICAgICAg
cmV0ID0gdmlkZW9fcmVnaXN0ZXJfZGV2aWNlKHZkZXYsIFZGTF9UWVBFX1ZJREVPLCAtMSk7DQo+
ID4gPiAgICAgICAgIGlmIChyZXQpIHsNCj4gPiA+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGNy
dS0+ZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIHZpZGVvIGRldmljZVxuIik7DQo+ID4gPiAtICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiA+ICsgICAgICAgICAgICAgICBnb3RvIGVycl9y
ZXF1ZXN0X2lycTsNCj4gPiA+ICAgICAgICAgfQ0KPiA+ID4NCj4gPiA+ICAgICAgICAgcmV0ID0g
bWVkaWFfZGV2aWNlX3JlZ2lzdGVyKCZjcnUtPm1kZXYpOw0KPiA+ID4gLSAgICAgICBpZiAocmV0
KSB7DQo+ID4gPiAtICAgICAgICAgICAgICAgdmlkZW9fdW5yZWdpc3Rlcl9kZXZpY2UoJmNydS0+
dmRldik7DQo+ID4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiA+IC0gICAgICAg
fQ0KPiA+ID4gKyAgICAgICBpZiAocmV0KQ0KPiA+ID4gKyAgICAgICAgICAgICAgIGdvdG8gZXJy
X3ZpZGVvX3VucmVnaXN0ZXI7DQo+ID4gPg0KPiA+ID4gICAgICAgICByZXR1cm4gMDsNCj4gPiA+
ICsNCj4gPiA+ICtlcnJfdmlkZW9fdW5yZWdpc3RlcjoNCj4gPiA+ICsgICAgICAgdmlkZW9fdW5y
ZWdpc3Rlcl9kZXZpY2UoJmNydS0+dmRldik7DQo+ID4gPiArZXJyX3JlcXVlc3RfaXJxOg0KPiA+
ID4gKyAgICAgICBmcmVlX2lycShjcnUtPmltYWdlX2NvbnZfaXJxLCBjcnUpOw0KPiA+ID4gKyAg
ICAgICByZXR1cm4gcmV0Ow0KPiA+ID4gIH0NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBM
YXVyZW50IFBpbmNoYXJ0DQo=

