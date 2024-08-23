Return-Path: <linux-media+bounces-16652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B7E95CC70
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 14:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6268E1F26514
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 12:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DF518594D;
	Fri, 23 Aug 2024 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="o+/7EscA"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011008.outbound.protection.outlook.com [52.101.125.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD83B1850AF;
	Fri, 23 Aug 2024 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724416500; cv=fail; b=NSlF5PN/nY80PtCYJo2AGHMHJVkS2ny/bj2FlyeX2FMTD0VrXHKGbrJ8KFw6sDnIqiZXa7YQCe1cQijhjvJTQWA7WoFfFaJjFV1yjg+iaj9BsblDjGC+PBKusTNLAutY1IUXn90Rae7BqWrNJknIsGLj5X4X6NwNqRDVwAHxPcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724416500; c=relaxed/simple;
	bh=F2MDjWjlXj//Ndt9BiSEgbJ2vItasNTI3RFtZ7oBs3g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ac5+3tgaYTkoDxIVR7Kc6dOvDyOF2X6JVGoz38HPYk0ZVTIA6eylgLjUmY5zJvE/M3twhPaAZAHNb78G6yPyu3qkrm8w3FvDVDf5poSZ1hfZBUVpyESRz6b+Zc3/KDwOmNVdyaaQ/2tRoTiajC19jxuo/G27NmA0/qhcoenPKDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=o+/7EscA; arc=fail smtp.client-ip=52.101.125.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+w9m2lHZpCSXHJ6WWyk6ISguhvce8BlVO8hQkck5GhpqmVA88lzvg7VzbEACNGL0cXrXmwruiGdb509c6VdcGLZEvxBGF3g3jybqLOeLPzEpPluV3CEjXOuxDWLupasZp4Mnls/amcPxRsDJYMEtqqtpj2MkaKCRnz+h9e0xJ4R5kcIl3vLhVSyDXk+9iTbRi5pLGNFJDzKANhB7ALU6TgRPs+FTi/FnkOt/xRYjuwDXH/ECCzwix/lsXnoQg9qsWFcGx5SZSSxZLHtH8WYJB1zSBzOz/Nw7/cS/o4Js1x0BQycLDsqEXA0kMHku/JnY30jt8kZWgctGfvDxlZEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2MDjWjlXj//Ndt9BiSEgbJ2vItasNTI3RFtZ7oBs3g=;
 b=jU4zkxKY7p01sOC3aPo3BCjBbzPNSC3SGPjrAimblO1fSVcEsBry9YdSc5EzMBaAySc0q6o1yc6Igg4r5cqeNd35z3cAiTJau9Br1RUyW1tCxfLfBWYTyyk50j5eapx6aIFoS0HrVJoXt29bVLntkFb4jIQ4QK1Kk4qHVDQfeGoRlNIIlblkNxHkpcu0+7V2CASTrT5VcnJGI7B48d9rHPJ0ArKr+rjMDFOJoaX+e5OTH6PfUe3/1VMKuSAJd2Sp1xVxFwhgun7LehGmdqBlXGp+t2oViK0GKqqcCzDgqtXmq4hRXumiD9JqIw2I7URYjjFf1A4qR2j7EW00ERh47g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2MDjWjlXj//Ndt9BiSEgbJ2vItasNTI3RFtZ7oBs3g=;
 b=o+/7EscAnfhxQTlm/ss2KkcZPsH23qGMdP9qO5xnYwP48ByQYB139M4j704F4NFILPhuQAmfn7jJfqkXI6xtEZKVLH0msmEvHGYMAFCy3+VahT4IYHEkM82pEvJMmXWDHJdEqlwWgLfDV99oZXw6xptwf3ZkQnHGiAaDFx0BjOI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8145.jpnprd01.prod.outlook.com (2603:1096:604:173::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Fri, 23 Aug
 2024 12:34:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Fri, 23 Aug 2024
 12:34:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] media: platform: rzg2l-cru: rzg2l-csi2: Add missing
 MODULE_DEVICE_TABLE
Thread-Topic: [PATCH] media: platform: rzg2l-cru: rzg2l-csi2: Add missing
 MODULE_DEVICE_TABLE
Thread-Index: AQHa42mkAJms48AuFkCGFoSH/88IgLI0reDQgAA414CAAAP6MA==
Date: Fri, 23 Aug 2024 12:34:43 +0000
Message-ID:
 <TY3PR01MB1134652630842FDA485D7DC0286882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240731164935.308994-1-biju.das.jz@bp.renesas.com>
 <TY3PR01MB113469C7FEF9FAB6394992ACF86882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240823121959.GA26098@pendragon.ideasonboard.com>
In-Reply-To: <20240823121959.GA26098@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8145:EE_
x-ms-office365-filtering-correlation-id: 5e550e55-2e83-452f-1ab6-08dcc36ff772
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Yk95aUFtUkYyclhxOHBIblhwMVk3YWRGOWIwbTJseUVidURsRmxBRGNMMHkx?=
 =?utf-8?B?RnB2WjVpUzFGc295dmZ0QWRkY3Vmb1lNVmhvNU5QcjFiZ2VWeEF3SGlkY1Zk?=
 =?utf-8?B?WmJUYmwremtXYWF1SzExRnk5d1hlY2NaQ3hWSHRPTzkzQ2VnQXRSby90SDZD?=
 =?utf-8?B?OElJU3dtUkhVTWhRczA4cFhYem9KMU5rRktmemgvcHFLVzFydWZhaEpGcTVI?=
 =?utf-8?B?NFpydVYvcDNhbU0yS3I2L1B6T3RDTFBpMUF5L3BUU0NXSzlQUldKOFlqQUdm?=
 =?utf-8?B?emtxVEZQY2U0bjVTRm9wN0E4a0x2L1psZ2xFblloRHZxaDJQNDN2YUR6R1g1?=
 =?utf-8?B?dDB6UFpZak1JYzdJZWFMVE5GRHhQaUgxU3Z5d3J5L1JidTI4dSs1WUhHL3lW?=
 =?utf-8?B?RThFemRUckVDc3VaWi9YbE9xZFZUZ295M281bncyRUNpT1pMbk5zRjJieG5h?=
 =?utf-8?B?cVBBYUxKTURDQW56UWJnNk1vSDVROU9ENDl4TktKcSt1MGRMS1AvTndZUUdm?=
 =?utf-8?B?dGdSTGovVFBWaWt6SEROMndSTlNlT0tCVVdRcXNPbXI4S1didGtCbjQrUFNy?=
 =?utf-8?B?ZDdyR1FVRVdkVEdleFdWU012NHpHREtPNzMxZW5lSzgwbHV5RDN1OTFoWndv?=
 =?utf-8?B?SE1HNmRiUGZ3d1o1RzNvQWRoOUdjQ0dlaUNENWh0WmZONEFHbitIYUlvbjFq?=
 =?utf-8?B?VGN0dFE0dUdrRmJWRTNTeVUxSFkxVXJMdXhTZksrWDBDdGk2eEJYZWdIYXhQ?=
 =?utf-8?B?RXduYmg5QndGdEViMjVMR2xscjViY2hyMldsZUdVeG80RVA4cVBSRXNydklj?=
 =?utf-8?B?S0JvK0FPOUtUNFYrTDJsOUhqZlQ3L1JIUTJtQUFWU3V2QW1DRHJQcWcwc1lj?=
 =?utf-8?B?R0ttU1o4OHFyU05nTmZHVnFSK255VlhrWlJSSGdMZjQraTM1Qm43S05pY3hM?=
 =?utf-8?B?R0Uybkg5ekxkY0Y3dElOWXhEMEd0eDcvckZHa2h1N284bGFJTytXMyt4dHQw?=
 =?utf-8?B?RmVPaUJpa0tUUG1QVjRwa0M4MzZSQ05RWXg5enYxYWtObndjTEVkZnFzSFJU?=
 =?utf-8?B?WDZycHBUM245cklQS3lXOXYwWFBwSTdORlZ5cTBka3FFWkdUcmZrUlJFQXkv?=
 =?utf-8?B?OFg0OTREK3htM29DQURudGk1RGQxWkNMM0tKZEFXQkpLNTZsVzFENUd0V3Za?=
 =?utf-8?B?WVZHUC9VcEVXYTdxbFVZRUtPNFVyczZrQkNBejhGVGQ0NzJDWUduMXpiNkJW?=
 =?utf-8?B?OGVNcENTOGh2QVlYQkVJZlVHYkVDSS9hbmhlUXNxQzQzZy9FZS9Rdzl2RWtq?=
 =?utf-8?B?ZVBCRlhWMHZvZDYvU01RWUU3L3NxUE5oN05uVHd4eTI1bkg5M3M5RWhTNXhw?=
 =?utf-8?B?KzM5ZlhlUzF4MUJlR01iVFppZmFGOHBUcy9NYnZpQzB0VmhEK2tRNUlYVTU5?=
 =?utf-8?B?MFZHZUxPaFVZUCtDM0d6ZFNBYy9abmltMDBxbDVjS0VMUlN4Y3BDakFjL1J0?=
 =?utf-8?B?YVZmUWwycUZuZG03L1lYY0taSis4TXZhRW9yZE1EQnNIUHNoTzNIWUtBSnFK?=
 =?utf-8?B?Z0ZNd2t6TEx1ZkIxK1B4akZVQWw1SGlqc1VpamRyYTdBWm1qS3lrQ05Hb05p?=
 =?utf-8?B?YjlCQWdRbXlJVUkzWlpGTDhTVTFQTUlMUnJIMkxEUGlUN3M0aUdSMmRxdGlw?=
 =?utf-8?B?SUFyNUp5RGU3SWE5Y1FtRVNoMm5mRERLckQ0Nkt4WHIreGpEcDFBMVBFVlFs?=
 =?utf-8?B?dHlNcjBRbUFtcUZWd2NadWJOWGpOMlpuRHNNaWYvaWxjeEJhWXRTMnYwQStC?=
 =?utf-8?B?S0hnYmlvSHpqVkJBVk4yblMxTW1IK1RsRElTV2xMeXJKWUdTckd3NldOeUhm?=
 =?utf-8?B?MGtDMTllaU12ZVhWM2ZPUHo4SlMrYXpBeXNDVWRGdno2cFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGhvOWRPTmdlRnBjc3laeTJncTIrYkRoK2piZXVMNXF4WFJOL3kyVU02WHJH?=
 =?utf-8?B?Q1hKNzNFdDR3TWRrdmprcTN3a0locE1ITmg3a0h3dWdXNlZ1TG94NlJQSzFH?=
 =?utf-8?B?U3dNbzUzUzY2RDhPRDBuM3o3L3ZqZ3NHQ0p0bXJzcVd0NmhuRmRGR2IwbjR1?=
 =?utf-8?B?NDZ1NnpYbzF6anBhZysySitVNUJ5YU5pZEhSUU5NYXMyNGxMYWMxQmlNQ083?=
 =?utf-8?B?aTB4eDhpWDJYc3pHSmc1Q3BHMkY4MVNWUU8xRndnL0xNVG8wMmk4MUp0N09R?=
 =?utf-8?B?WUVIS2RHb0xJNmhIQXpiYXl2SlhLckIrS2hXL1QrRlM2MTlKZTNUMFU2Vlc5?=
 =?utf-8?B?UmpVMzhBWnpQKzAwSHFEZFN6ZGtERVVOQjA3VTVFM3ExNjYzbTNwRm5INFpt?=
 =?utf-8?B?bFRUTWZ2WEF6WDhTaTI2eVVVMk9BbUlibUxpREF2cHZLL1NYeTdCVUhpRUxY?=
 =?utf-8?B?RTJCSS90anRET1RxWTV0SXVxU0E2ZjRoVjdiYmMvSFhLRDhDSWZCaXBvL1Z6?=
 =?utf-8?B?c3YrajhDQzNTN05QRytRK1VaQkNyZ3RTY09ZZmdOQXErOFJhMTR3b0FPU0Ew?=
 =?utf-8?B?QzNFVWhkY09EeEJwbDFJY3hOTE5CVm9ad2lDUXJ4SjhyY2szZTFTcm5xMEZD?=
 =?utf-8?B?cUQxWG1oTVVpQVNzMjdCdTNnekswWWE4ckNxV3orL2hzR1ROVHh5SXlhTVdl?=
 =?utf-8?B?dmdteWxnMlVxTzZ6TVVlQm1DZE1uU0cwNVJpdDdmRExCTEpnSnExQzQrZVZm?=
 =?utf-8?B?Q2ZranovTU56bWxkUDc5RlZhSUx5QVduVkJ4NFA2MElsd2ptZy9DZm5TeUlv?=
 =?utf-8?B?N1FVcDIrTTY2U1dKWUdselpLdmRldHh1UkducUJKY1dwL0RNOVYvTEx2YlV0?=
 =?utf-8?B?TDhVbFBCZnFnOGxsd3l2NmNtQXo2NVlUczlPK0xTVldWRktyekhOd2xwNHZi?=
 =?utf-8?B?MmtiUEFhSjRteFZCUXRJRjErVVc5TVpHU0piMEh3QjZjWFN1UEpHbDJEOVJn?=
 =?utf-8?B?cC9GWUsvRis4V3ZVYVVVTXp0ajBnVEtnbzk4Z3RoR3JXNUI0THdNT1ZuYlk5?=
 =?utf-8?B?WjhIbnc3bTBsOHN6dHRGa0krSjlEMlQ2Tmt4R01Oc1NKbFF3aGdyM05iR1c1?=
 =?utf-8?B?UWpTQU52ZnRLS29Qa3V4WjJXc0lTMDgrVGZBTFF4eThzL2RvU2cyV1VndENp?=
 =?utf-8?B?NzBsaWhTMk10WXV0Vk1URUFDMEg1ZFpyQ0VrdnhDQW5ZcElQOThXU2o4bzlJ?=
 =?utf-8?B?dHlJakViQlM0aEt0ME95WXlIalV5T1VQQ0ZnQWtZNHB3UldxZWJad3FlWHRQ?=
 =?utf-8?B?Q0V4YkR5c1J0RDFtVS9zQnp6d2owdW9OSzdPRXIwVTFvdjhJdmpLeFV2Mmk2?=
 =?utf-8?B?ck0vYSt1R254UnpkT3pIR2RGcWlRVXZla1pVdlpEb09YMXJINmdiU0hzV3d5?=
 =?utf-8?B?ZUVTR3NYeWJUbzVCTGNHYjZNQmdjRWNyOHZyZzBwRWpIY1hWWWRrbHM4bjYz?=
 =?utf-8?B?MFFUZ3ZjbjJma3h4Y2tWTWdycE1ScjJwWGt1UWhpS1owclpzbFdFSDNHU1Ft?=
 =?utf-8?B?b3VEOCtmN3h3WUFwMEt6MjhGWGVObG1uOG9pQmxMWk8wVVAwZFZaQUg0c1BD?=
 =?utf-8?B?ZzBPM1NRT0x4Y0lIL2cvSWtHSG9nVXV5bS92TVkxTytyeW02WFczS3lTQThN?=
 =?utf-8?B?R3d1MXJYcDRzU2s2TmtsSzJxM2pyT0lKbC9lNGoxR0R3RUZXK3BqU0JvbSts?=
 =?utf-8?B?NFNJcU9tVlEwVkczNElmMGxWRlBPTjhSQ3pIU2E1VG5rckl2KzROc1p2Zjgz?=
 =?utf-8?B?L1A3M2Mra0VlWVo3dGVUR0NQdUNrQnBXZTF3ckRQQ3lwaDNlVXJybDdBclJw?=
 =?utf-8?B?RWc5WC9BK2JEMUZhWUd5c2t0R0lsUmcya0tRTFJQb1BpbGF4YzZWU0lPVlpM?=
 =?utf-8?B?TTdMM1ZUTHRVS0NUbStBbHU0akJqR0o3ekRPOGhxV3Z5cmk2WjJzTDV2ak8w?=
 =?utf-8?B?cWxlTkFLZ0kwcFp6a3NkM3ZndkRZNnFLcExwMHVrVnkvaGNoVWpGYWE1Umh5?=
 =?utf-8?B?TzdTVHhiQWxrcm5xYjlsSHRDZkp3YVIzNm9UYlBzQi9OOUorcklTZllYOHhV?=
 =?utf-8?B?QjZ5NUVSSkxaUFN5dVRQWVhFQ2RCeHdXYmE5Y2dmclovL0g4MkdKRkFOV2xQ?=
 =?utf-8?B?elE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e550e55-2e83-452f-1ab6-08dcc36ff772
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 12:34:43.9438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JJDMXobtBkvjRNjaV6J/i7ejxOVcGEl6xW3uMsz7eCiaLGcdm5zMbOuuKM3svdh5SmXhHiAzZ7okuMXaPqBpLqRQRQFI2oWBfPYkMMpOOoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8145

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQg
PGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogRnJpZGF5LCBBdWd1
c3QgMjMsIDIwMjQgMToyMCBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBtZWRpYTogcGxhdGZv
cm06IHJ6ZzJsLWNydTogcnpnMmwtY3NpMjogQWRkIG1pc3NpbmcgTU9EVUxFX0RFVklDRV9UQUJM
RQ0KPiANCj4gT24gRnJpLCBBdWcgMjMsIDIwMjQgYXQgMDg6NTg6MDlBTSArMDAwMCwgQmlqdSBE
YXMgd3JvdGU6DQo+ID4gSGkgTWVkaWEgZm9sa3MsDQo+ID4NCj4gPiBHZW50bGUgcGluZy4gSXMg
dGhpcyBzaW1wbGUgZml4IE9LIHRvIGV2ZXJ5b25lPw0KPiANCj4gSSd2ZSBhZGRlZCB0aGUgcGF0
Y2ggdG8gbXkgdHJlZSBhbmQgd2lsbCBpbmNsdWRlIGl0IGluIG15IG5leHQgcHVsbCByZXF1ZXN0
Lg0KDQpUaGFuayB5b3UuDQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiA+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMzEsIDIwMjQgNTo1MCBQTQ0K
PiA+ID4gU3ViamVjdDogW1BBVENIXSBtZWRpYTogcGxhdGZvcm06IHJ6ZzJsLWNydTogcnpnMmwt
Y3NpMjogQWRkIG1pc3NpbmcNCj4gPiA+IE1PRFVMRV9ERVZJQ0VfVEFCTEUNCj4gPiA+DQo+ID4g
PiBUaGUgcnpnMmwtY3NpMiBkcml2ZXIgY2FuIGJlIGNvbXBpbGVkIGFzIGEgbW9kdWxlLCBidXQg
bGFja3MNCj4gPiA+IE1PRFVMRV9ERVZJQ0VfVEFCTEUoKSBhbmQgd2lsbCB0aGVyZWZvcmUgbm90
IGJlIGxvYWRlZCBhdXRvbWF0aWNhbGx5Lg0KPiA+ID4gRml4IHRoaXMuDQo+ID4gPg0KPiA+ID4g
Rml4ZXM6IDUxZTg0MTVlMzlhOSAoIm1lZGlhOiBwbGF0Zm9ybTogQWRkIFJlbmVzYXMgUlovRzJM
IE1JUEkgQ1NJLTINCj4gPiA+IHJlY2VpdmVyIGRyaXZlciIpDQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+
ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNzaTIuYyB8
IDEgKw0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ID4NCj4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6
ZzJsLWNzaTIuYw0KPiA+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwt
Y3J1L3J6ZzJsLWNzaTIuYw0KPiA+ID4gaW5kZXggZTY4ZmNkYWVhMjA3Li5jN2ZkZWUzNDdhYzgg
MTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwt
Y3J1L3J6ZzJsLWNzaTIuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5l
c2FzL3J6ZzJsLWNydS9yemcybC1jc2kyLmMNCj4gPiA+IEBAIC04NjUsNiArODY1LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcnpnMmxfY3NpMl9vZl90YWJsZVtdID0gew0K
PiA+ID4gIAl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscnpnMmwtY3NpMiIsIH0sDQo+ID4gPiAg
CXsgLyogc2VudGluZWwgKi8gfQ0KPiA+ID4gIH07DQo+ID4gPiArTU9EVUxFX0RFVklDRV9UQUJM
RShvZiwgcnpnMmxfY3NpMl9vZl90YWJsZSk7DQo+ID4gPg0KPiA+ID4gIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIHJ6ZzJsX2NzaTJfcGRydiA9IHsNCj4gPiA+ICAJLnJlbW92ZV9uZXcg
PSByemcybF9jc2kyX3JlbW92ZSwNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50
IFBpbmNoYXJ0DQo=

