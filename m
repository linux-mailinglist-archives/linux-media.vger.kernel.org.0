Return-Path: <linux-media+bounces-19984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1DE9A5FE4
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 11:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DED6D1F21A08
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 09:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15ACC1E284E;
	Mon, 21 Oct 2024 09:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nmLxcOTg"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446FD198E6F;
	Mon, 21 Oct 2024 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729502660; cv=fail; b=K2mPgXp7NH/1FFpiHQDTPLQFqpi3CyG4dby+NPMKjVpYpZFrZD1GpnIZ8lHX67uUXVi3fL+LIUMpSLS7aUV+YDLmsLCKcN9giBugNQD6rDoCHUD6H4QU8KaqkJw3ziKLDEogGAzcv3iak/Ed/OJv+cjMxtJEprXXKUwMNIaf2OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729502660; c=relaxed/simple;
	bh=MKN0tSkBGI7pXyM/HJb7XYcZ3/qRqWEVuhdnTDWj6vM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CJyBSdI6laK5TlZkKcOaR2tOnBDkzsEH9BW48hpdw0AVhdl8sqIUoz0WyaH68YEU1yhsqLPAmeJUwq5VFZTr3tg7bV/4K9VeyrqcHzere1GqIaOv/DZ8KDGmrMqxETnBoufhmWjKYz0FPxyWhuJAhw5Gtp75hJ14+BupEQwjM2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nmLxcOTg; arc=fail smtp.client-ip=52.101.229.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7spz1GwGSUlzyFmAzIbzFy1Y5YhDmpwbl+EkDgEdDo9UG7qsX3jZ7DzjGIrJ8HSoYLFVAH228V1eMdvPwdOrWs0PoTVxD93NDx4Ja44cRmVi0yQJOg3L/y1h+YuJ5grBe4GteEjTagyV9gF15tzMi4KI00ctjSs/Y48gEQJ4GABLRgVBWrxzHOoma3eH+LpjM3HiHYSyv0PLkC41etC7ZkdE10d3RY96I9KaT0tn1LtpFADcCgImSJNDG4FuZFQIFkDA/gCC3MDUy7DfTwSVb1JECRSS8GtcKRKkfbJ51puZq3tVqjKA7ylkVblS473B78VVKXAaPT6UqtYvyR/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKN0tSkBGI7pXyM/HJb7XYcZ3/qRqWEVuhdnTDWj6vM=;
 b=zKQ+NzNBeu31nWDLw7Qa7oHcigoLTxNNUjKMioTPc58WSZ3nJOZ3k8rn8c8P1G2Pdnice2S5PDaS1hngELiOk/+V8/LaTTq5VbtqJqspfT3lwUjXu0DqPn7+cPfBuXA3HSfQrss11t2524m0L/0bRWGl0Cfrb/Q87NVv5wyy7tLdH+pO7pJ7zg0xTi37oIeD6xEg1bcxK9088glYcA6m1cq+CltjuQsHaGIKeukeSe8jC79KFFCEsXsDEg9gW4d2n9yZiQp/Wmfv9/tQ8TOYhQBqG91G2SqPs19QFac3JPD0men9jmMFNzAzy5kQG+5VEk8Kz0eZuHbSGPxBhy6VmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKN0tSkBGI7pXyM/HJb7XYcZ3/qRqWEVuhdnTDWj6vM=;
 b=nmLxcOTgLvA62uI5ZzmVbS7RszagBrXyeV9dvPJnoEOx3fYSbYsmqdxYtIm99Xi8WYooUkY8FXfXU7+iEjZX9FjnmEi6y1nMFIekvpMTDO5/MrBy9QgvdRSBc0qgMf0ayZcoZeagWBmoKOkqRXRs0d5Cch86NvyEXrOpeuLfnSE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10195.jpnprd01.prod.outlook.com (2603:1096:400:1e7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Mon, 21 Oct
 2024 09:24:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 09:24:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
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
Thread-Index: AQHa/4Vayw10oWeJKk+GlBZb9vTbq7JLcqoAgAB+MjCAAKfvAIBEnfRQ
Date: Mon, 21 Oct 2024 09:24:14 +0000
Message-ID:
 <TY3PR01MB113462B9B0092FCD5238A1CB286432@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10195:EE_
x-ms-office365-filtering-correlation-id: 3041d215-0237-4dc1-fb6f-08dcf1b22136
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WCtOcS96V3NiM1VNa2tsVFFCSFJkSGdOanVrdVMvcUloeWRVTEFBcW93ZnND?=
 =?utf-8?B?UjhyaXZ5dTgzRTRzbEFGWmRINW9xNkVCMlBXZmhtenBmUkdTdEpwMm4yRUlj?=
 =?utf-8?B?emtiUVY1T1Q5UnBlZmNaS29Ca25ia01DNllCTWlDZHlIYW1jUHdUakhxcm9z?=
 =?utf-8?B?UnV4V0ltNWpIUkZVUzJlMU1KQXk3cjZiWjhNRlJpbksrN3M3bGZEdzd5alVN?=
 =?utf-8?B?bnVlcHhOMlZqNkhGTWtyVXdKKzRNcDB5TFJsZVhGWXNTdTB3N3F6TzhFQU5M?=
 =?utf-8?B?SUNMMjZ6UDc1NUVzSTBlREU4UzB4UEdEYnU2WTFmWjhqVDBBTlQ1UUNBZmMv?=
 =?utf-8?B?Z3pZdUJTV29kVXZLMjIrVEpEamh3TS9sd2dkNDlCUGpNNDFYTERMR0czU1Fx?=
 =?utf-8?B?eWhEdUdPYmhaZFlJVVNEeXRsMXlaeWx4SWhyZlgrNWRWSHlrQUVuL3VwUUZM?=
 =?utf-8?B?WnI2ZFRjc0RKdlk1RHIwbS9Jb1NsSDdXRmsxVzdnZ1dHQnFNekN4dHYrbEVY?=
 =?utf-8?B?ZTZpM2MwcE1PT3Izd3pRRUlYTi9HMVB3eUdPSUR5bi9ZSDBKM05WKzVHcmNr?=
 =?utf-8?B?MjF2aG5XSUxRK0I1MmEyVzhkREJqODVFWkhldnczUzlXSFJGTkNBNTNWNndX?=
 =?utf-8?B?cHE3d2gzeWtVdWhVQktHTWlLQ3g5Y1d5WUdDSkx4TFFFRkRPU1ZtK1l6YUFS?=
 =?utf-8?B?eUY3bkwvenFFQTVlUDl2cVpNT2xMNXFRMXN0R0JlcUJiSk90K2pHQ1I1YXFS?=
 =?utf-8?B?bEFyTkVsbUQrU3dzODJZaTg5WUJJamlvbDdaR1lHNnRNSFpNZ0VEcVdDd1VB?=
 =?utf-8?B?Q3JRdE4wbEVpVytsNWZBTkJYMmRkenpnVURkSXRvT2ZSMjdZekRFbmc0RThQ?=
 =?utf-8?B?V245dlRyalcxWjFoemdYQzhZYldOU1NtWWZ0VGxLcXROMU9GZ1pkcDY5L3RH?=
 =?utf-8?B?d2YvWWsvTDJYRWZodEhGNHlSbjB1M2JrQ3dZU05pUWNhWnEzWGdWV2EwWWh4?=
 =?utf-8?B?ZlUyd0xEdjhVWHRJcWsvdHFqa1RNeloyRkdBbHAzWittcWR3QWhIWEJTaFdM?=
 =?utf-8?B?WUdYYzcxaXF1VHlJdTY3NUVKTUVNMlExYXhqYjBuODVkUWNRSVZmZnVtNFY3?=
 =?utf-8?B?MlE4MmNSNllKWXYrb1VTVHpUNVM0bjYwZGJGQ3J0elV4QkRQUTFuOXU5ZkND?=
 =?utf-8?B?d00rYldGT1FVeEtZQU9YWHBqbFNmcFdpY0pYaHd5ZCtkbVJPSkx6aXBaN2JP?=
 =?utf-8?B?NnRRRWcwSDkrSWxncjVUc1JYRUt0bmFFTDJUNnpSdHA2VnNpL3Q1ZldBdXk2?=
 =?utf-8?B?Mjg3UEJEWHQwcDZIdGxlRVF6WGhyNkliWmsxVEZBamFSZ1c0NlYrWnBTZyt0?=
 =?utf-8?B?UHJPanRIUTJ6dmF6RUdjajVQYkVZakpSemRWTXhHWndIS0RITHhmUVlaY0JM?=
 =?utf-8?B?VDFENW5Wa2J1SXcwY3lIU1RhK09qa1pJanJyZmI0RzdwUDdRZCtWek8vaVZy?=
 =?utf-8?B?UlJ3dm91L3BWbEs0ZE9za1JkVGN3aGwwRHhtcDJ3RVV4U3Jjc1dyR2VIczBB?=
 =?utf-8?B?V01xQ0ZiQ0ZnMEp2Zis2VCs5T0NZa05tZTRIZjRJWjhWUUZXMlk5VC9IbXE4?=
 =?utf-8?B?bDl2NjJOVjA3dVRRV3dSOUMyRFhzOERHSTB2ejQyVG8vclFGa050NDh6enJ3?=
 =?utf-8?B?REJ4dE9IRUFscU4zQm5jQjdDRXA2dGNUNmxES2JaM2RtQ3RtNS9PUldrWWxN?=
 =?utf-8?B?QkRab3ZDU0xLL01wcDBrcyt6aW5Fc3RlYVp2K1FaK2pWV3lrT3VnSHRNRFV6?=
 =?utf-8?Q?G7roK6pRzah81SaINf9rxMqkjjvEp6SgBFxD4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTgybVFQdHpXaWovM1psRnFRR2RFS2lGWXBxWDJtOVZ6c2pBOHNYR1YydTY5?=
 =?utf-8?B?c3Zublp2RXd1U3cybVFJQmtpN1NVNElnL1Zpa29JUWlvN21rWm9xSVNwdVMw?=
 =?utf-8?B?a1ZXN094WFNGZmU3WGJBTnQ0cEhUWmxqUjkzQ0tlVXJkY3NMcVEvVG5hK2ZT?=
 =?utf-8?B?RDIrL1NYOUdQdFM3TmpucG5YRG1lcG5WQjJCcU5jUS9pQzN5azY2ZXVCVFF4?=
 =?utf-8?B?Z0g1cVJNalJ5ZUFUdzdtYUVRTmVUeXN5OHlhcXhqYWl5Wm8xV3FESlV2cy9h?=
 =?utf-8?B?Vm51SjNUUkhwUlFsYTBiWnA1bnBOYUdCQ0tRL0V2SGRKb1V2YWh5VVZmSy9S?=
 =?utf-8?B?RDY5SmJ4Zk1oUlJQY1ViNWZ6cFZNK2VOaUJPcWtWSVF3a2FpcHNpSWd2ZytF?=
 =?utf-8?B?TTUyaHRXNTExVEYzSXM5QVJtdUF6Vnhua2Vud0g5Q1plVGpxOXEwaFgyekxx?=
 =?utf-8?B?VTF1QkhLUWpKbzRKWTViRTQrNC9OVWNSVk1FNVJ1a3VVOWV1NXZPQlJCdTc4?=
 =?utf-8?B?Ynl1RTlFODRWcEJjQ3U4YkQ5WVNVeEV3VkYxd3hYOVNNWURiaURzOXlJdnVs?=
 =?utf-8?B?TmNPQThaa25hLzdKT3lEeDdtQW1EKzMyVjJJNFhZNmovZHREZ1YvQVd4cjh0?=
 =?utf-8?B?dVJVZ3c0YjJsUWZxMWEyMDA2YXRoNTlrWjJqampRTU93QWtESzNZZE9TSUh6?=
 =?utf-8?B?RFJqbnIrc2hmajZRMlFwRDZ2YWJWRnNzb2Y2WTBtVHRHcTUwUEFiRFVQdWdz?=
 =?utf-8?B?TnJlTFNaUXhEYUV6S1dyU3ZFOFFjcDNmTklNbGRYdFp5ZDk1VFFhKzlZbWVk?=
 =?utf-8?B?QitTY2lmOEZGMkxJbGE1Ump0RUdWWURQYk5ReVRzUm1ib1RKbUlGdDRPL2tx?=
 =?utf-8?B?eFFuUlF6OXhnM2poMG9tczVQVDNBK2JJS00wSW1Bc1dja1dONmFkUGZhZEZt?=
 =?utf-8?B?TFRIZllza2xWTVk4akRIVG1JZzU5bXhVYklTaCthN3N1bFdkNnVWVVRsQ3Ft?=
 =?utf-8?B?TEJtRlE3OGlFQ1dGQ0tkdlhERWhFemFkUk1EME0zZDREMlBLa2MrdFlRcmtz?=
 =?utf-8?B?OWFUb2xXaUl0OHZJbUV1bEZ1Z2ZqanJiVXBnaVVyelY2QWphNWJpeG1QdDJi?=
 =?utf-8?B?Vy9BZEVPVmRpQmJDai9jNTBNejg0dFg1czhJbkhyZ0gvNFdTcHR0dlJQOXcz?=
 =?utf-8?B?R1VleElHS2tCNHp4UGZLczBOcHN3U0NaK3RlRm82Um5TSUQzU0hIYXdGenZC?=
 =?utf-8?B?S3pCM0s2dGdSa0hQMWNDY3hVZ3RBV29iRnJoVjlhdGtBWlBoajRPQ3ZVdXNK?=
 =?utf-8?B?UVBwbWRoTkdmZFRkYTk1d212OTRuUFJsSmlJWjBaaHBNQVp2VGN2ZXZBTEtj?=
 =?utf-8?B?bTczb2ZsV2tISkZOTnpEZm1MajBWYkR0UjMxMW1LeHNhMzFpZWR1UWRMdE5O?=
 =?utf-8?B?S0FnVmF0bWtkWTRnNFZHOEUvWE1TMVNaMS8rTWcrNHhPSGtSaDhDVzFJSXE2?=
 =?utf-8?B?SDlWc1pjWUtGOXhlSVpvd2xJVFpCWkxNLy95bVAvMk9RaFRTOFhIV0diWnBJ?=
 =?utf-8?B?YXRhdktSb056MG1venVneVRBQlhxOUZWZ0lVR2pTcHo2STBmendFNTgvNmJY?=
 =?utf-8?B?U295eXZXZDNlWElHQXBtcHh5eVQ0WE12VHFac2JCQlhwUWo0ZmVZREhmb3Fo?=
 =?utf-8?B?WUpWMGg3RDZxVnpDaFUzZUZ4bERWSGtvZEZYRHNiMllxdzkyQkxHMnJ6aS9B?=
 =?utf-8?B?ck85N2QrNGt0Snhlek5icEplZnhzSnZiSVlnbFdFbnFhTHQwbUZwNzVHc3Vu?=
 =?utf-8?B?bGVIUCs2eUdaTkRxOWZTR2MyenpOY1N5MlM0U3U5M3h0ei9JbG1MUHpJQ2s1?=
 =?utf-8?B?cDdqanN6U2dDeENya2pZTHJuc2dCSDFTczg1QWd0RDk1SFdYRHdnY2xCUEgw?=
 =?utf-8?B?NnFINW5jRFBxbzEyNUw2L1phSWlQMXJ1bGMrTG1hUkthTSt1QlVibGRSWDF0?=
 =?utf-8?B?OVFlRlkwd3oxQzZEVDlROXFJMGhTLzJ0MEhYV3dhcEo3ZmlGWjVFWlFnUEFC?=
 =?utf-8?B?NDJyc0lnanZhZm5qcUlnalFRSEtDNTVtbGF5blVpbVdZeEdJVlFNN0J0aFNj?=
 =?utf-8?B?RlNhakxjci9XNlNFL1k5U29uVVFPaHFZbkw3RGI5a0MzMnVvV2xmV09ySU5h?=
 =?utf-8?B?M1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3041d215-0237-4dc1-fb6f-08dcf1b22136
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2024 09:24:14.3142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZOsGoUa4JcQRfQja+dvAOb9MzwRkRtS6/m+n9TGkudW8faNF7s5HLCfb+y5xk/JgR6VN1QEsN9htTG7G+8PpCgvupo6qahrTxXoaYXaJbIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10195

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IFNhdHVyZGF5LCBTZXB0ZW1iZXIgNywgMjAyNCA2OjMzIFBNDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIG1lZGlhOiBwbGF0Zm9ybTogcnpnMmwtY3J1OiByemcybC12aWRlbzogU2V0IEFYSSBidXJz
dCBtYXggbGVuZ3RoDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gU2F0LCBTZXAgMDcsIDIwMjQg
YXQgMDc6NDE6MjRBTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gT24gU2F0dXJkYXksIFNl
cHRlbWJlciA3LCAyMDI0IDE6MDAgQU0sIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+ID4gPiBP
biBUaHUsIFNlcCAwNSwgMjAyNCBhdCAxMjoxODoyNlBNICswMTAwLCBCaWp1IERhcyB3cm90ZToN
Cj4gPiA+ID4gQXMgcGVyIHRoZSBoYXJkd2FyZSBtYW51YWwgc2VjdGlvbiAzNS4yLjMuMjYgJ0FY
SSBNYXN0ZXIgVHJhbnNmZXINCj4gPiA+ID4gU2V0dGluZyBSZWdpc3RlciBmb3IgQ1JVIEltYWdl
IERhdGE7LCBpdCBpcyBtZW50aW9uZWQgdGhhdCB0bw0KPiA+ID4gPiBpbXByb3ZlIHRoZSB0cmFu
c2Zlcg0KPiA+ID4NCj4gPiA+IHMvOy8nLw0KPiA+DQo+ID4gT29wcywgV2lsbCBmaXggdGhpcyBp
biBuZXh0IHZlcnNpb24uDQo+ID4NCj4gPiA+ID4gcGVyZm9ybWFuY2Ugb2YgQ1JVLCBpdCBpcyBy
ZWNvbW1lbmRlZCB0byB1c2UgQVhJTEVOIHZhbHVlICcweGYnDQo+ID4gPiA+IGZvciBBWEkgYnVy
c3QgbWF4IGxlbmd0aCBzZXR0aW5nIGZvciBpbWFnZSBkYXRhLg0KPiA+ID4gPg0KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBIaWVuIEh1eW5oIDxoaWVuLmh1eW5oLnB4QHJlbmVzYXMuY29tPg0KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgLi4uL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwt
Y3J1L3J6ZzJsLXZpZGVvLmMgICAgfCAxMSArKysrKysrKysrKw0KPiA+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+
ID4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtdmlk
ZW8uYw0KPiA+ID4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUv
cnpnMmwtdmlkZW8uYw0KPiA+ID4gPiBpbmRleCAzNzRkYzA4NDcxN2YuLmQxN2UzZWFjNDE3NyAx
MDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJs
LWNydS9yemcybC12aWRlby5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
cmVuZXNhcy9yemcybC1jcnUvcnpnMmwtdmlkZW8uYw0KPiA+ID4gPiBAQCAtNTIsNiArNTIsMTEg
QEANCj4gPiA+ID4gICNkZWZpbmUgQU1uTUJTCQkJCTB4MTRjDQo+ID4gPiA+ICAjZGVmaW5lIEFN
bk1CU19NQlNUUwkJCTB4Nw0KPiA+ID4gPg0KPiA+ID4gPiArLyogQVhJIE1hc3RlciBUcmFuc2Zl
ciBTZXR0aW5nIFJlZ2lzdGVyIGZvciBDUlUgSW1hZ2UgRGF0YSAqLw0KPiA+ID4gPiArI2RlZmlu
ZSBBTW5BWElBVFRSCQkJMHgxNTgNCj4gPiA+ID4gKyNkZWZpbmUgQU1uQVhJQVRUUl9BWElMRU5f
TUFTSwkJR0VOTUFTSygzLCAwKQ0KPiA+ID4gPiArI2RlZmluZSBBTW5BWElBVFRSX0FYSUxFTgkJ
KDB4ZikNCj4gPiA+ID4gKw0KPiA+ID4gPiAgLyogQVhJIE1hc3RlciBGSUZPIFBvaW50ZXIgUmVn
aXN0ZXIgZm9yIENSVSBJbWFnZSBEYXRhICovDQo+ID4gPiA+ICAjZGVmaW5lIEFNbkZJRk9QTlRS
CQkJMHgxNjgNCj4gPiA+ID4gICNkZWZpbmUgQU1uRklGT1BOVFJfRklGT1dQTlRSCQlHRU5NQVNL
KDcsIDApDQo+ID4gPiA+IEBAIC0yNzgsNiArMjgzLDcgQEAgc3RhdGljIHZvaWQgcnpnMmxfY3J1
X2ZpbGxfaHdfc2xvdChzdHJ1Y3QNCj4gPiA+ID4gcnpnMmxfY3J1X2RldiAqY3J1LCBpbnQgc2xv
dCkgIHN0YXRpYyB2b2lkDQo+ID4gPiA+IHJ6ZzJsX2NydV9pbml0aWFsaXplX2F4aShzdHJ1Y3Qg
cnpnMmxfY3J1X2RldiAqY3J1KSAgew0KPiA+ID4gPiAgCXVuc2lnbmVkIGludCBzbG90Ow0KPiA+
ID4gPiArCXUzMiBhbW5heGlhdHRyOw0KPiA+ID4gPg0KPiA+ID4gPiAgCS8qDQo+ID4gPiA+ICAJ
ICogU2V0IGltYWdlIGRhdGEgbWVtb3J5IGJhbmtzLg0KPiA+ID4gPiBAQCAtMjg3LDYgKzI5Mywx
MSBAQCBzdGF0aWMgdm9pZCByemcybF9jcnVfaW5pdGlhbGl6ZV9heGkoc3RydWN0DQo+ID4gPiA+
IHJ6ZzJsX2NydV9kZXYgKmNydSkNCj4gPiA+ID4NCj4gPiA+ID4gIAlmb3IgKHNsb3QgPSAwOyBz
bG90IDwgY3J1LT5udW1fYnVmOyBzbG90KyspDQo+ID4gPiA+ICAJCXJ6ZzJsX2NydV9maWxsX2h3
X3Nsb3QoY3J1LCBzbG90KTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCS8qIFNldCBBWEkgYnVyc3Qg
bWF4IGxlbmd0aCB0byByZWNvbW1lbmRlZCBzZXR0aW5nICovDQo+ID4gPiA+ICsJYW1uYXhpYXR0
ciA9IHJ6ZzJsX2NydV9yZWFkKGNydSwgQU1uQVhJQVRUUikgJiB+QU1uQVhJQVRUUl9BWElMRU5f
TUFTSzsNCj4gPiA+ID4gKwlhbW5heGlhdHRyIHw9IEFNbkFYSUFUVFJfQVhJTEVOOw0KPiA+ID4g
PiArCXJ6ZzJsX2NydV93cml0ZShjcnUsIEFNbkFYSUFUVFIsIGFtbmF4aWF0dHIpOw0KPiA+ID4N
Cj4gPiA+IEl0IHdvdWxkIGJlIG1vcmUgZWZmaWNpZW50IHRvIGp1c3Qgd3JpdGUNCj4gPiA+DQo+
ID4gPiAJcnpnMmxfY3J1X3dyaXRlKGNydSwgQU1uQVhJQVRUUiwgQU1uQVhJQVRUUl9BWElMRU4p
Ow0KPiA+DQo+ID4gSSB0aG91Z2h0IGFib3V0IHRoYXQuIEJ1dCB0aGVuIHJlLXJlYWRpbmcgcmVn
aXN0ZXIgZGVzY3JpcHRpb24gY2hhbmdlZA0KPiA+IHRoZSBtaW5kIGJlY2F1c2Ugb2YgdGhlIGJl
bG93IGJpdHMNCj4gPg0KPiA+IHs5LDh9IOKAlCAwMWIgUiBSZXNlcnZlZDoNCj4gPiBXaGVuIHJl
YWQsIHRoZSBpbml0aWFsIHZhbHVlIGlzIHJlYWQuIFdoZW4gd3JpdGluZywgYmUgc3VyZSB0byB3
cml0ZSB0aGUgaW5pdGlhbCB2YWx1ZS4NCj4gPiBPcGVyYXRpb24gaXMgbm90IGd1YXJhbnRlZWQg
aWYgYSB2YWx1ZSBvdGhlciB0aGFuIHRoZSBpbml0aWFsIHZhbHVlIGlzIHdyaXR0ZW4uDQo+ID4N
Cj4gPiB7Niw0fSDigJQgMTAxYiBSIFJlc2VydmVkOg0KPiA+IFdoZW4gcmVhZCwgdGhlIGluaXRp
YWwgdmFsdWUgaXMgcmVhZC4gV2hlbiB3cml0aW5nLCBiZSBzdXJlIHRvIHdyaXRlIHRoZSBpbml0
aWFsIHZhbHVlLg0KPiA+IE9wZXJhdGlvbiBpcyBub3QgZ3VhcmFudGVlZCBpZiBhIHZhbHVlIG90
aGVyIHRoYW4gdGhlIGluaXRpYWwgdmFsdWUgaXMgd3JpdHRlbi4NCj4gPg0KPiA+IEFsc28sIGJp
dHMgezI3LDI0fSwgezIyLDE2fSBhbmQgezEzLDEyfSAtMGIgOg0KPiA+DQo+ID4gSXQgaXMgbWVu
dGlvbmVkIHRoYXQNCj4gPiBXaGVuIHJlYWQsIHRoZSBpbml0aWFsIHZhbHVlIGlzIHJlYWQuIFdo
ZW4gd3JpdGluZywgYmUgc3VyZSB0byB3cml0ZSB0aGUgaW5pdGlhbCB2YWx1ZS4NCj4gPiBvcGVy
YXRpb24gaXMgbm90IGd1YXJhbnRlZWQgaWYgYSB2YWx1ZSBvdGhlciB0aGFuIHRoZSBpbml0aWFs
IHZhbHVlIGlzIHdyaXR0ZW4uDQo+IA0KPiBMZXQncyBrZWVwIHRoZSBjb2RlIGFzLWlzIHRoZW4u
IEknbGwgZml4IHRoZSB0eXBvIGluIChhbmQgcmVmbG93KSB0aGUgY29tbWl0IG1lc3NhZ2UgbXlz
ZWxmLCBubyBuZWVkDQo+IHRvIHJlc3VibWl0Lg0KDQpHZW50bGUgcGluZy4gTm90IHN1cmUgWW91
IG1pc3NlZCB0aGlzPz8NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ID4gdGhlIGhhcmR3YXJl
IG1hbnVhbCBob3dldmVyIGRvZXNuJ3QgbWFrZSBpdCBjbGVhciBpZiB0aGlzIGlzIHNhZmUgb3IN
Cj4gPiA+IG5vdC4gVGhlIHJlc3Qgb2YgdGhlIHJlZ2lzdGVyIGlzIHJlc2VydmVkLCBhbmQgd3Jp
dGVzIGFzIGRvY3VtZW50ZWQNCj4gPiA+IGFzIGlnbm9yZWQsIGJ1dCB0aGUgcmVzZXQgdmFsdWUg
aXMgbm9uLXplcm8uIElmIGl0J3Mgbm90IHNhZmUgdG8NCj4gPiA+IHdyaXRlIHRoZSByZXNlcnZl
ZCBiaXRzIHRvIDAsDQo+ID4gPg0KPiA+ID4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQg
PGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+DQo+ID4gPiA+ICB9DQo+
ID4gPiA+DQo+ID4gPiA+ICBzdGF0aWMgdm9pZCByemcybF9jcnVfY3NpMl9zZXR1cChzdHJ1Y3Qg
cnpnMmxfY3J1X2RldiAqY3J1LCBib29sDQo+ID4gPiA+ICppbnB1dF9pc195dXYsDQo+IA0KPiAt
LQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K

