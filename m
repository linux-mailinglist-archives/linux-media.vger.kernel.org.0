Return-Path: <linux-media+bounces-29714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B063A81E3E
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 09:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0021D1BA10BC
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 07:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C556925A2BB;
	Wed,  9 Apr 2025 07:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HGfKGnix"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EF9259CBE;
	Wed,  9 Apr 2025 07:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744183557; cv=fail; b=gC7sl1eGxNNHDtH+4gJMzvYbxIEiiNqvZd8s1f5P5vjD46oNgzNEx+n5BB7tLVcZTXLHyutIWFJI/R8c4oT0jbSouQ1n5nR9waUIEcooxBkXMFfTwj5CWW/fimcz7q9guBqEJfQyXGo2htqtMEObgyVp5pHEU4E+dFEgPdUM4kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744183557; c=relaxed/simple;
	bh=CFA7uEtj5Gu4btoN5aZU6Y8r/DRXB8uuS1ivQz995RA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d3erz7XfP3kWi46Y6IWKkwQjgmiFuRaNIMEtnrgCQnOQPkhhkiT99U4fTzI0Lfx7eBVry2a9a7YTgBoFnp5wjp22hnz+2LEdrnRqGOymKPIbY+TpicrGEmz6EtktUfPno6E12hh4Chub3GoTr9Tyc/UPMkE1UThITA4id/IepzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HGfKGnix; arc=fail smtp.client-ip=52.101.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvHyGElTFpW1iLftAbZGkR2wAx5L8A2wZYPsedCfrYvdZ4LGf8GE4CvO0LEo4wWHfvto8d6zBQ73joCAonAP8zN32geW8J2E887Ro+vt3AFb0GsxI9kcUDGDcr3DSoQblA5jZnt+HSattF4CyMzppZNeaETqTjYLNOjmT7MF6+Fq3rfw85xkblvBCS6LB2ORmyimcB7WP3+mP9DA7QnEbVgdYTe4CxedmxjnbBRZ4t93F8I5Pq1BdnC5oMysA/Z8ZrMFFIE7KcBuk2gLN83we9dXYkvj0tQhLGNw2fyC9WAqrTQBcDEtTeCksWlI7Ok2A9iFudZpzmJaiIDdbe38Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFA7uEtj5Gu4btoN5aZU6Y8r/DRXB8uuS1ivQz995RA=;
 b=l7fDpCWl+K8D6djPvDE2nQy54SFOKw/XRG5Hqe7KK54CDxsvOLVsOq2C6c0l5wCfJ3MXkzFtVLGrr97nc59gEmtCGPujr1YyGAUFMwH631p8ssA2rBbcvR4MlzZ8D8E1cNRIwx6GyuYGijBkmV4yKauwWVyiv9y1f/80m88sY6yBjuBgy0u/Zab+NN8WesmuzSzBjOZURjWc5PV6/WROm0g/cb54ZqmqqhmH1ADe3JszK71hIR35ea8l1aUr4FcVjHXZ6EfhOrhzkfpcE0NDCDEiJPnTpBz9yLZxjl+FD3F7P83PCSITyFzIve90L5c0izwRyX3hnsFZYw0NJH5V7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFA7uEtj5Gu4btoN5aZU6Y8r/DRXB8uuS1ivQz995RA=;
 b=HGfKGnixuj/9g79tt5JWNwXLXIR1YpedcpFz2Ew3R+UZTm50NlHBGGJNDlyXNN9u4QA9OG8KdYnLA9prR7tABh9nhtFoh7iGXbpzrEN9UQQYy65ZR9KIDiT1waS5nwAbsBU3TLVKsw39zD2fvlgoS2TW7uhrjhOrvmDpU6bsjwc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15122.jpnprd01.prod.outlook.com (2603:1096:405:227::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 07:25:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 07:25:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>
CC: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Hans Verkuil
	<hverkuil@xs4all.nl>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?=
	<u.kleine-koenig@baylibre.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
Thread-Topic: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
Thread-Index:
 AQHboAdhMLT6c7RZOkyzH0oxaSH/n7OP8RdwgAAScoCAAAvKoIAAAhgAgAARGQCAAAH3cIAIVzaAgAIh2wCAAGDdsA==
Date: Wed, 9 Apr 2025 07:25:43 +0000
Message-ID:
 <TY3PR01MB11346A5CBFD05A51E351DCE6586B42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
 <20250328173032.423322-12-tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB11346ECE31CB6C8DC33459C2486AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sJQnyJb_uq9yEcjHRW7ZFOw3g2XQyygcozWTgMjrYxRQ@mail.gmail.com>
 <TY3PR01MB113462DC897E0DB681B1C020F86AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8ukJ+_Bhy-4nU_CFD4rMoTRxEY-q+bXHHZ-9Mz8gQ362A@mail.gmail.com>
 <20250402092618.GH4845@pendragon.ideasonboard.com>
 <TY3PR01MB11346DF814762C667FF97074286AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tsCEhmhNSbMMiuN6b2rJCoSekf+-e6EHr5wE5C000ZxQ@mail.gmail.com>
 <20250409012914.GD31475@pendragon.ideasonboard.com>
In-Reply-To: <20250409012914.GD31475@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15122:EE_
x-ms-office365-filtering-correlation-id: e047aa58-fe5e-4d02-14ab-08dd7737bd35
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QUt1YVU5WXcrMmxYUTVtSnRnc0JCbGRDeWppSjRtQjh2UlowbHovWnNLKzFi?=
 =?utf-8?B?bkxMVnVFdnpUMGx5Q1lFRThLSkJDUFl5SnVsY0h0ZDdmVUw4REtCOXBIWkdW?=
 =?utf-8?B?SllzRXZrRVNlY01QR2dKTm43MVc5QjE4YU9YQSt5bW83djFoWFY5L2tXa1Nm?=
 =?utf-8?B?aWowa3FPWW5FVXVxSHhubVdCWTBoS3hIMWtjU0Y3d01QeC9ZcmpVRmZGY0ZM?=
 =?utf-8?B?ZmE3eXpoYWNRRm1xMWtUQ1ZuaFd4WHJpRUk2ZHIxaFU4dTQ1M0hZdEh2RUFU?=
 =?utf-8?B?cXQ1RzhlaUxTeStmeWlOT05OOHIxbFk1OW9TZXMxN0NtOWNISHRsWTlMNmNT?=
 =?utf-8?B?cEFXOTdRSmRlU2hsNnQ1VTJsUjN6aCtjL1hKS0FoZG8vYVFEdXlFRTNmNW5v?=
 =?utf-8?B?VTRkK1BEenB0UHlQbUhxakNrbmJzdUhjY2xtTTdvaCtYNGFicVI4WkY3cXl4?=
 =?utf-8?B?RWc3L01nelhpUFBkRnNydmhZUk5WTlp1dVZJNjNHQm0xQzJQZVpiK1BudE1N?=
 =?utf-8?B?dWx0anhwRGgxb2ZmUVh3Qm5WTExZemVVMGFMZnZHZ1Q3enZSbDhkRHE3VzZ6?=
 =?utf-8?B?S1F6QzlvRnVhWHZYejNjVjc5K1luNys4VGQwZ2tYZGJ2MnF3ekEyT2luNVo0?=
 =?utf-8?B?ZU9USFk0ZURHaENqMVMyQ2hLUWh0OUNWQ2ZhWHU2THpLblh1SkxiN0RDYUhy?=
 =?utf-8?B?WXhZQWNoV3ZDcmJVQmQ2Tnl2d3FUWHJGc0RpaGkxSGZmcmloNzkxeFBzWVNu?=
 =?utf-8?B?N1VNT05Eekd6dUY1aEhZaEozVTl6ajl4VmZFU2h2d1g5SzdQbDJGeHp3OUtn?=
 =?utf-8?B?RWFmQktVVVl5d2pWc3kvbUdQYmZnQUJmaG40a214bHIxRkRROWNhZHVjbXJa?=
 =?utf-8?B?WHlENkxJOFRFN3U4enQyQkJBMG9VQ1pLdkE0ZUN3aTFvcDNCNE9YQzhTcTNw?=
 =?utf-8?B?OGptWjQrWlVFQTNUSFhnUGU2WlR0MWs5SmdiaUJZMzVUeG4rclJua2pTZmI5?=
 =?utf-8?B?TUZrdHRadFFWbHYwc0wwaWFIMGxwY0Z3V2VQU0ZQNGg2anVDWjRZdDFXSXYz?=
 =?utf-8?B?eGZXdTBTZXo1R2MwWmJ0ZUFSZ0FSTWdPdEExemJCMkY2aWJ5dWx2WU55Qktu?=
 =?utf-8?B?VDZMOVRObUdIRFJGZk9YNjV4SytFSzdKNWk4SE51eFF0NEVqMnlFTHZRd3ZW?=
 =?utf-8?B?aDRLcXFub0RNeHorNmVmSk9yaE8vTDZHYTMzUXpNLzBkQzJrbHdkWEs1WTl1?=
 =?utf-8?B?dVFBemJkUzF5d3F0STZNR2lLK1pTckFDc1F1QXNmMHZyM1NNRnJnYUJQNVBL?=
 =?utf-8?B?QTl2VTZ6bVR2aUtkdHRGSFBYTG9vbzg2RHYyTGpVdUdXTVE2bFk3MHBPTmRC?=
 =?utf-8?B?S2pCelZyNmVjbEdHZXB5K1Z6ZGxHbGRkanhJKzRRS2VVcDhNL09yN1ljTnhp?=
 =?utf-8?B?Y0tPTmZ1WTZxU3lnSFhoc0lwbFFlYW5jMkovcjJRMVVRNTBja3JGVUo0RGdL?=
 =?utf-8?B?SFE0U0lrNE5rQ0cxZXV0K2l0RnMwZHQ3WW9LM0IrTm9iVU8vNkhOMStZUmll?=
 =?utf-8?B?dUpOYzZVT3pGY0RNNG83UW5wUjdOMjVsZ0FBT25mSnVXcmNzYUNrYWFzTG9T?=
 =?utf-8?B?enl5N0VhZHZRTlhicDNTUGd3d1dObkEwZ0FTZW93djZPV3JGZ1c4eXNXQ1ZW?=
 =?utf-8?B?dUhFT29GUFpoOFQrN3NVL21lZElGRWFBQW8xdFR2NVQ0WThyclB5Y3lYS00r?=
 =?utf-8?B?VHdsMXpSWllTc0hNSHdLSkh5dENvMFdVc2NtcTFUcXk5eHE0b1MyN0NwNDdG?=
 =?utf-8?B?UXJrR1Z6K1RTUlBxOHltd20xNlVwSVVNNUdvcUlHV2wzMTkrQXMwYjJrZjNL?=
 =?utf-8?B?VjlKMUpjc0F0RVVJR1dRdFg2eUt0M2lmdkdrYlY2dzZjVUxZSXJKb2pVRGVm?=
 =?utf-8?Q?+cbCpDObpQmxBTepnvrWBeR8BJYja/ZW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SFVpS3Z6ODVMblh2dW9jTmhrUmxXaWpTMGZPWDhMKzdYNjkvWnJSMFVMZEhC?=
 =?utf-8?B?Z2FLelN1aVVub0FIc3lqRVYyRnF1dmdYOXptaWFFbERFTWh0T0E2YUJPVnAr?=
 =?utf-8?B?di9lWEd3bGsycjZtTVZuYyt6ejNXUXcvZmtRRjZtWERuczBvQkU1N0Q5c3lS?=
 =?utf-8?B?dmJxK25FaytHcjREMDZrLzZVWXpsVHY0R3dRc3hzdmRkOEo5dWlKY1g2NnIw?=
 =?utf-8?B?eVRzRHoyVXB2K3Q5OVRGM01jaTNwQm01cUl5USthT21JdG0vN2VNMlE2b2sx?=
 =?utf-8?B?T3JzNFFlRG5yUWxBeHlDVHhIUmh1dTNqWWtFSk9TYWJXUkc0MEduYndBekdR?=
 =?utf-8?B?SHY0b0NZbkszdXhTam5oZC9lWnVzUWNXUEp5TDRXbnJrdE8vTytyMmFwTXB4?=
 =?utf-8?B?KzJEbjM4Y2xkNFNKdytpQUxCaGdpdTZneDZacys3L29Ba2xERUhYTEs5SUNi?=
 =?utf-8?B?MFJXR2pHT2dFY0Z2MzFWbVFkN2FtdnNhaFFmZkJCeFZsNFl6R0ZiMzRmQjRB?=
 =?utf-8?B?UlNyTG5JeGpsVEpFclNXUmJrMTFJcjFlNjVqRFR4R0VFdVZvdUJBZ1ZmUTJj?=
 =?utf-8?B?WDllalp1MXZ2OUhYQ3lmWGNpWU1NT1QwY05qS3NuR3pYYzlKUm13WU9iUDE5?=
 =?utf-8?B?QytoWVVnSDhNeVZlSmtTRllpdjhhSjczL0dSY0dSM3BsOTFFdWdCaDl3SkI4?=
 =?utf-8?B?cnV4Y2xRNzcwd25YSGF3OEdUQU5BT1lVc2Q2dU1zOC8relRqMEhmMDhhM2Ir?=
 =?utf-8?B?amZRSFN1QzJuOWw2RmVZRytRZExKTk92RU52Z3gxUFNZNlF0UGVISXMxbnlI?=
 =?utf-8?B?WTRwV0dGZ2NVVittS0FxZTRCeWFVd0hueDNZMExNV2FUTnNaZGJyWDNtSzZs?=
 =?utf-8?B?cWplaEF1Qlg3Z0s4LzdhSUtTVkRHN1BqU05sTGdJVFdWVFNPNUtBYy91Vlp1?=
 =?utf-8?B?MXFocGxtQ1ZQS0hEOHpjOFJKRm1TYkVraTZ3U1RiZ2JNQnA2bUFvdFVWcGQv?=
 =?utf-8?B?Y0RRWGFOSjJFd09JMEFzajJmREtaZXc0aEZrQWt4SENMcDJSQmJXWS9OczM3?=
 =?utf-8?B?NkVXUTd2eFZ2cC9FclcwMklHV2tTSWVXWEwySnlDVUhyNFBTeXFPQ2dSRXJm?=
 =?utf-8?B?WWlJNFptdm40T05CRUVkdDFHbUNER1JmMWthQmhjbjc3RzVERDh2bHBVbzRq?=
 =?utf-8?B?RjFTS2E3eUJ0NG82ayszdFBua0pzNnBSTXlRZVh6VEdTblJSaTQwUVNnR2ZD?=
 =?utf-8?B?Zkt1K3kwNld4ZUF1TFkxQlVSSmZWZHVNQUhtYlYrMTVGcVFYOHhZZys2V0NM?=
 =?utf-8?B?dE1qZFpOVGIvUUVGN0I1bW9PLzROend3b2VSMVJCUmtjaGJiMGdRM3AvNmZY?=
 =?utf-8?B?d3dJR2FrYm93Ynd6SmprTFdYcy9YVkx4dEJ2UjRod0ROZVgrVHFEV2J3R0J5?=
 =?utf-8?B?ajdHVEx2NDhVOXR0K05RSHNjSkcyRWZqUWJYUlpkb2RGd3BuZ3RaMDdyVHgz?=
 =?utf-8?B?a0MveGdZVnlhVFo5OUtsZVRUTG9va24zMkdtQVRtbnJzNHNLTXdVREJ3b0tS?=
 =?utf-8?B?M1gzdFpRRjRnT2l0R2hKVmhWN2dZempMQXJhcktXUTZtRmYwQ0tBQzYzcmNp?=
 =?utf-8?B?VE1rMEdYWkRZTllXT05RNHdMdmZDUVRRWXpxT041emhuOW50NStHdXo0VXVY?=
 =?utf-8?B?Z0RJVHhxVVhQYitML2EvN25aZkFHZWY5RHhEZTJIWlpjalVJcjJUR3RSclFG?=
 =?utf-8?B?T0NMM2NNK1F6L1pWVHg2aGFFV1FhUXNTclE5RW5LUVN4SFdLM1ZpL2t2ZVlw?=
 =?utf-8?B?TXVUbmtWNGxOQmE3dGhxaUFYTmpaOG1WQUVNZ0pjMUZxY1BXY2xIZ1BtTGlC?=
 =?utf-8?B?eHVGeEg2N3A1aEp0L2RmckluaFo0Mm9LZHZON296UUpIY25HcmhlVVd4THFw?=
 =?utf-8?B?L25YendkcXo2TU5lY3g2TVRJVEpkblphV3ZIWDhCbm14bmhsRjdTcVRMWmpr?=
 =?utf-8?B?OXpsQmJ4QmRhVjRCazNVK1R0UGJ1Z01GTG9MNHpzdGhndkN5WU5FcnJTQjhw?=
 =?utf-8?B?YzNuUGpMMEZWQzlPS2o1VDFOc2cxdDF6cTNqNFEzRVM5bkl1akJiUmFGWmt1?=
 =?utf-8?B?RUFIaGp5UmhBdDJwazR1eEtJMCswRWZVNXZ1NEdFQ2QzM1ZRci9VNTllNGpW?=
 =?utf-8?B?MWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e047aa58-fe5e-4d02-14ab-08dd7737bd35
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 07:25:43.7342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mpEKVwUFKZ7CUgLTB9e2bGEjizcpJ2Z3cAeCyZ+HnadiVO67vofRE7iwNAXL6k9HMMmGgyBn6ETP40D9R/W05OLy4YnFme9s/bmZEEZhC8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15122

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IDA5IEFwcmlsIDIwMjUgMDI6MjkNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxMS8xN10gbWVk
aWE6IHJ6ZzJsLWNydTogQWRkIHJlZ2lzdGVyIG1hcHBpbmcgc3VwcG9ydA0KPiANCj4gT24gTW9u
LCBBcHIgMDcsIDIwMjUgYXQgMDQ6NTU6MzNQTSArMDAwMCwgTGFkLCBQcmFiaGFrYXIgd3JvdGU6
DQo+ID4gT24gV2VkLCBBcHIgMiwgMjAyNSBhdCAxMDozOeKAr0FNIEJpanUgRGFzIHdyb3RlOg0K
PiA+ID4gT24gMDIgQXByaWwgMjAyNSAxMDoyNiwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4g
PiA+ID4gT24gV2VkLCBBcHIgMDIsIDIwMjUgYXQgMDg6MjU6MDZBTSArMDAwMCwgTGFkLCBQcmFi
aGFrYXIgd3JvdGU6DQo+ID4gPiA+ID4gT24gV2VkLCBBcHIgMiwgMjAyNSBhdCA5OjIw4oCvQU0g
QmlqdSBEYXMgd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiAwMiBBcHJpbCAyMDI1IDA4OjM1LCBMYWQs
IFByYWJoYWthciB3cm90ZToNCj4gPiA+ID4gPiA+ID4gT24gV2VkLCBBcHIgMiwgMjAyNSBhdCA3
OjMx4oCvQU0gQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBPbiAyOCBNYXJjaCAy
MDI1IDE3OjMwLCBUb21tYXNvIE1lcmNpYWkgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBGcm9t
OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA+ID4gPiA+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFk
LnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+
IFByZXBhcmUgZm9yIGFkZGluZyBzdXBwb3J0IGZvciBSWi9HM0UgYW5kIFJaL1YySFAgU29DcywN
Cj4gPiA+ID4gPiA+ID4gPiA+IHdoaWNoIGhhdmUgYSBDUlUtSVAgdGhhdCBpcyBtb3N0bHkgaWRl
bnRpY2FsIHRvIFJaL0cyTA0KPiA+ID4gPiA+ID4gPiA+ID4gYnV0IHdpdGggZGlmZmVyZW50IHJl
Z2lzdGVyIG9mZnNldHMgYW5kIGFkZGl0aW9uYWwNCj4gPiA+ID4gPiA+ID4gPiA+IHJlZ2lzdGVy
cy4gSW50cm9kdWNlIGEgZmxleGlibGUgcmVnaXN0ZXIgbWFwcGluZw0KPiA+ID4gPiA+ID4gPiA+
ID4gbWVjaGFuaXNtIHRvIGhhbmRsZSB0aGVzZSB2YXJpYXRpb25zLg0KPiA+ID4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gPiA+IERlZmluZSB0aGUgYHJ6ZzJsX2NydV9pbmZvYCBzdHJ1Y3R1
cmUgdG8gc3RvcmUgcmVnaXN0ZXINCj4gPiA+ID4gPiA+ID4gPiA+IG1hcHBpbmdzIGFuZCBwYXNz
IGl0IGFzIHBhcnQgb2YgdGhlIE9GIG1hdGNoIGRhdGEuDQo+ID4gPiA+ID4gPiA+ID4gPiBVcGRh
dGUgdGhlIHJlYWQvd3JpdGUgZnVuY3Rpb25zIHRvIGNoZWNrIG91dC1vZi1ib3VuZA0KPiA+ID4g
PiA+ID4gPiA+ID4gYWNjZXNzZXMgYW5kIHVzZSBpbmRleGVkIHJlZ2lzdGVyIG9mZnNldHMgZnJv
bQ0KPiA+ID4gPiA+ID4gPiA+ID4gYHJ6ZzJsX2NydV9pbmZvYCwgZW5zdXJpbmcgY29tcGF0aWJp
bGl0eSBhY3Jvc3MgZGlmZmVyZW50IFNvQyB2YXJpYW50cy4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA+ID4g
PiA+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4g
PiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVG9tbWFzbyBNZXJjaWFpDQo+ID4gPiA+ID4gPiA+
ID4gPiA8dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gPiA+
ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gPiBDaGFuZ2VzIHNpbmNlIHYyOg0KPiA+ID4gPiA+ID4g
PiA+ID4gIC0gSW1wbGVtZW50ZWQgbmV3IHJ6ZzJsX2NydV93cml0ZS9yZWFkKCkgdGhhdCBub3cg
YXJlIGNoZWNraW5nIG91dC1vZi1ib3VuZA0KPiA+ID4gPiA+ID4gPiA+ID4gICAgYWNjZXNzZXMg
YXMgc3VnZ2VzdGVkIGJ5IExQaW5jaGFydC4NCj4gPiA+ID4gPiA+ID4gPiA+ICAtIEZpeGVkIEFN
bk1CeEFERFJMKCkgYW5kIEFNbk1CeEFERFJIKCkgYXMgc3VnZ2VzdGVkIGJ5IExQaW5jaGFydC4N
Cj4gPiA+ID4gPiA+ID4gPiA+ICAtIFVwZGF0ZSBjb21taXQgYm9keQ0KPiA+ID4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gPiA+IENoYW5nZXMgc2luY2UgdjQ6DQo+ID4gPiA+ID4gPiA+ID4g
PiAgLSBNYXJrIF9fcnpnMmxfY3J1X3dyaXRlX2NvbnN0YW50L19fcnpnMmxfY3J1X3JlYWRfY29u
c3RhbnQNCj4gPiA+ID4gPiA+ID4gPiA+ICAgIGFzIF9fYWx3YXlzX2lubGluZQ0KPiA+ID4gPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ICAuLi4vcGxhdGZvcm0vcmVuZXNhcy9yemcybC1j
cnUvcnpnMmwtY29yZS5jICAgfCA0NiArKysrKysrKysrKystDQo+ID4gPiA+ID4gPiA+ID4gPiAg
Li4uL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNydS1yZWdzLmggICAgICAgIHwgNjYgKysrKysr
KysrKy0tLS0tLS0tLQ0KPiA+ID4gPiA+ID4gPiA+ID4gIC4uLi9wbGF0Zm9ybS9yZW5lc2FzL3J6
ZzJsLWNydS9yemcybC1jcnUuaCAgICB8ICA0ICsrDQo+ID4gPiA+ID4gPiA+ID4gPiAgLi4uL3Bs
YXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMgIHwgNTgNCj4gPiA+ID4gPiA+
ID4gPiA+ICsrKysrKysrKysrKysrLS0NCj4gPiA+ID4gPiA+ID4gPiA+ICA0IGZpbGVzIGNoYW5n
ZWQsIDEzOSBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkNCj4gPiA+ID4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiA+ID4gPiA+ID4gPiBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtY29yZS5jDQo+ID4gPiA+
ID4gPiA+ID4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpn
MmwtY29yZS5jDQo+ID4gPiA+ID4gPiA+ID4gPiBpbmRleCBlZWQ5ZDJiZDA4NDE0Li5hYmMyYTk3
OTgzM2FhIDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gPiBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtY29yZS5jDQo+
ID4gPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpn
MmwtY3J1L3J6ZzJsLWNvcg0KPiA+ID4gPiA+ID4gPiA+ID4gKysrIGUuYw0KPiA+ID4gPiA+ID4g
PiA+ID4gQEAgLTIyLDYgKzIyLDcgQEANCj4gPiA+ID4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8bWVk
aWEvdjRsMi1tYy5oPg0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ICAjaW5j
bHVkZSAicnpnMmwtY3J1LmgiDQo+ID4gPiA+ID4gPiA+ID4gPiArI2luY2x1ZGUgInJ6ZzJsLWNy
dS1yZWdzLmgiDQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gIHN0YXRpYyBp
bmxpbmUgc3RydWN0IHJ6ZzJsX2NydV9kZXYNCj4gPiA+ID4gPiA+ID4gPiA+ICpub3RpZmllcl90
b19jcnUoc3RydWN0IHY0bDJfYXN5bmNfbm90aWZpZXIgKm4pICB7IEBADQo+ID4gPiA+ID4gPiA+
ID4gPiAtMjY5LDYgKzI3MCw5IEBAIHN0YXRpYyBpbnQgcnpnMmxfY3J1X3Byb2JlKHN0cnVjdA0K
PiA+ID4gPiA+ID4gPiA+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gPiA+ICAgICAgIGNydS0+ZGV2ID0gZGV2Ow0KPiA+ID4gPiA+ID4g
PiA+ID4gICAgICAgY3J1LT5pbmZvID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7DQo+
ID4gPiA+ID4gPiA+ID4gPiArICAgICBpZiAoIWNydS0+aW5mbykNCj4gPiA+ID4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLA0KPiA+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRv
IGdldCBPRg0KPiA+ID4gPiA+ID4gPiA+ID4gKyBtYXRjaCBkYXRhXG4iKTsNCj4gPiA+ID4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBk
ZXYsIDApOw0KPiA+ID4gPiA+ID4gPiA+ID4gICAgICAgaWYgKGlycSA8IDApDQo+ID4gPiA+ID4g
PiA+ID4gPiBAQCAtMzE3LDggKzMyMSw0OCBAQCBzdGF0aWMgdm9pZCByemcybF9jcnVfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICBy
emcybF9jcnVfZG1hX3VucmVnaXN0ZXIoY3J1KTsgIH0NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiA+ID4gPiArc3RhdGljIGNvbnN0IHUxNiByemcybF9jcnVfcmVnc1tdID0gew0KPiA+
ID4gPiA+ID4gPiA+ID4gKyAgICAgW0NSVW5DVFJMXSA9IDB4MCwNCj4gPiA+ID4gPiA+ID4gPiA+
ICsgICAgIFtDUlVuSUVdID0gMHg0LA0KPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgW0NSVW5JTlRT
XSA9IDB4OCwNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIFtDUlVuUlNUXSA9IDB4YywNCj4gPiA+
ID4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjFBRERSTF0gPSAweDEwMCwNCj4gPiA+ID4gPiA+ID4g
PiA+ICsgICAgIFtBTW5NQjFBRERSSF0gPSAweDEwNCwNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAg
IFtBTW5NQjJBRERSTF0gPSAweDEwOCwNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjJB
RERSSF0gPSAweDEwYywNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjNBRERSTF0gPSAw
eDExMCwNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjNBRERSSF0gPSAweDExNCwNCj4g
PiA+ID4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjRBRERSTF0gPSAweDExOCwNCj4gPiA+ID4gPiA+
ID4gPiA+ICsgICAgIFtBTW5NQjRBRERSSF0gPSAweDExYywNCj4gPiA+ID4gPiA+ID4gPiA+ICsg
ICAgIFtBTW5NQjVBRERSTF0gPSAweDEyMCwNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIFtBTW5N
QjVBRERSSF0gPSAweDEyNCwNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjZBRERSTF0g
PSAweDEyOCwNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjZBRERSSF0gPSAweDEyYywN
Cj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQjdBRERSTF0gPSAweDEzMCwNCj4gPiA+ID4g
PiA+ID4gPiA+ICsgICAgIFtBTW5NQjdBRERSSF0gPSAweDEzNCwNCj4gPiA+ID4gPiA+ID4gPiA+
ICsgICAgIFtBTW5NQjhBRERSTF0gPSAweDEzOCwNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIFtB
TW5NQjhBRERSSF0gPSAweDEzYywNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIFtBTW5NQlZBTElE
XSA9IDB4MTQ4LA0KPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgW0FNbk1CU10gPSAweDE0YywNCj4g
PiA+ID4gPiA+ID4gPiA+ICsgICAgIFtBTW5BWElBVFRSXSA9IDB4MTU4LA0KPiA+ID4gPiA+ID4g
PiA+ID4gKyAgICAgW0FNbkZJRk9QTlRSXSA9IDB4MTY4LA0KPiA+ID4gPiA+ID4gPiA+ID4gKyAg
ICAgW0FNbkFYSVNUUF0gPSAweDE3NCwNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAgIFtBTW5BWElT
VFBBQ0tdID0gMHgxNzgsDQo+ID4gPiA+ID4gPiA+ID4gPiArICAgICBbSUNuRU5dID0gMHgyMDAs
DQo+ID4gPiA+ID4gPiA+ID4gPiArICAgICBbSUNuTUNdID0gMHgyMDgsDQo+ID4gPiA+ID4gPiA+
ID4gPiArICAgICBbSUNuTVNdID0gMHgyNTQsDQo+ID4gPiA+ID4gPiA+ID4gPiArICAgICBbSUNu
RE1SXSA9IDB4MjZjLA0KPiA+ID4gPiA+ID4gPiA+ID4gK307DQo+ID4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gPiBEbyB3ZSBuZWVkIGVudW0sIGNhbid0IHdlIHVzZSBzdHJ1Y3QgaW5zdGVh
ZCB3aXRoIGFsbCB0aGVzZSBlbnRyaWVzIGluc3RlYWQ/DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gV2hhdCBiZW5lZml0IGRvIHlvdSBmb3Jlc2VlIHdoZW4gdXNpbmcgc3RydWN0PyBX
aXRoIHRoZQ0KPiA+ID4gPiA+ID4gPiBjdXJyZW50IGFwcHJvYWNoIGJlaW5nIHVzZWQgYSBtaW5p
bWFsIGRpZmYgaXMgZ2VuZXJhdGVkIHdoZW4NCj4gPiA+ID4gPiA+ID4gc3dpdGNoZWQgdG8gc3Ry
dWN0IHRoZXJlIHdpbGwgYmUgbG90cyBvZiBjaGFuZ2VzLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+IFRoZSBtYXBwaW5nIGlzIGNvbnZpbmllbnQgd2hlbiB5b3Ugd2FudCB0byBpdGVyYXRlIHRo
cm91Z2h0IGl0Lg0KPiA+ID4gPiA+ID4gSGVyZSwgaWYgeW91IGp1c3Qgd2FudCB0byBhY2Nlc3Mg
dGhlIG9mZnNldCB2YWx1ZSBmcm9tIGl0cw0KPiA+ID4gPiA+ID4gbmFtZSwgYSBzdHJ1Y3R1cmUg
bG9va3MgbW9yZSBhcHByb3ByaWF0ZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoYW5rcywgYXMg
dGhpcyBwYXRjaCBoYXMgYmVlbiByZXZpZXdlZCBieSBMYXVyZW50IGEgY291cGxlIG9mDQo+ID4g
PiA+ID4gdGltZXMgd2Ugd2lsbCBjaGFuZ2UgdGhpcyB0byBzdHJ1Y3QgSWYgaGUgaW5zaXN0cy4N
Cj4gPiA+ID4NCj4gPiA+ID4gSG93IHdvdWxkIGEgc3RydWN0IGxvb2sgbGlrZSA/IEknbSBub3Qg
c3VyZSB3aGF0IGlzIGJlaW5nIHByb3Bvc2VkLg0KPiA+ID4NCj4gPiA+IEl0IHdpbGwgYmUNCj4g
PiA+DQo+ID4gPiBzdHJ1Y3QgcnpnMmxfY3J1X3JlZ3Mgew0KPiA+ID4gICAgICAgICB1MTYgY3J1
X25fY3RybDsNCj4gPiA+ICAgICAgICAgdTE2IGNydV9uX2llOw0KPiA+ID4gICAgICAgICB1MTYg
Y3J1X25faW50czsNCj4gPiA+ICAgICAgICAgdTE2IGNydV9uX3JzdDsNCj4gPiA+IH07DQo+ID4g
Pg0KPiA+ID4gc3RhdGljIGNvbnN0IHN0cnVjdCByemcybF9jcnVfcmVncyByemcybF9jcnVfcmVn
cyA9IHsNCj4gPiA+ICAgICAgICAgLmNydV9uX2N0cmwgPSAweDAsDQo+ID4gPiAgICAgICAgIC5j
cnVfbl9pZSA9IDB4NCwNCj4gPiA+ICAgICAgICAgLmNydV9uX2ludHMgPSAweDgsDQo+ID4gPiAg
ICAgICAgIC5jcnVfbl9yc3QgPSAweGMsDQo+ID4gPiB9Ow0KPiA+ID4NCj4gPiA+IFlvdSBjYW4g
YWNjZXNzIGl0IHVzaW5nIGluZm8tPnJlZ3MtPmNydV9uX2N0cmwgaW5zdGVhZCBvZg0KPiA+ID4g
aW5mby0+cmVnc1tDUlVuQ1RSTF0gVGhpcyBpcyBwcm9wb3NhbC4NCj4gPg0KPiA+IEFyZSB5b3Ug
T0sgd2l0aCB0aGUgYWJvdmUgcHJvcG9zYWw/DQo+IA0KPiBJIG1heSBiZSBtaXNzaW5nIHNvbWV0
aGluZywgYnV0IEkgZG9uJ3Qgc2VlIHdoeSB0aGlzIHdvdWxkIGJlIGEgc2lnbmlmaWNhbnRseSBi
ZXR0ZXIgb3B0aW9uLiBJdCBzZWVtcw0KPiBpdCB3b3VsZCBtYWtlIHRoZSBjYWxsZXJzIG1vcmUg
Y29tcGxleCwgYW5kIGRlY3JlYXNlIHJlYWRhYmlsaXR5Lg0KDQoNCkJhc2ljYWxseSwNCkkgZ3Vl
c3Mgc3J1Y3QgIHdpbGwgYWxsb3cgdXMgdG8gYXZvaWQgKFdBUk5fT04ob2Zmc2V0ID49IFJaRzJM
X0NSVV9NQVhfUkVHKSBhbmQNCiAgIEJVSUxEX0JVR19PTihvZmZzZXQgPj0gUlpHMkxfQ1JVX01B
WF9SRUcpOyBjaGVja3MgYXMgdGhlcmUgaXMgbm8gYXJyYXksIHNvIHRoZXJlIGlzIG5vDQogICBi
dWZmZXIgb3ZlcnJ1biBjb25kaXRpb24gYW5kIGFsc28gd2UgY2FuIGRyb3AgZW51bSBhc3dlbGwu
DQoNClNvLCBpZiB1c2luZyBzdHJ1Y3QgZGVjcmVhc2VzIHJlYWRhYmlsaXR5IGFuZCBtYWtlcyB0
aGUgY29kZSBjb21wbGV4LA0KdGhlbiBjdXJyZW50IHBhdGNoIGlzIGZpbmUuDQoNCkNoZWVycywN
CkJpanUNCg0KDQoNCg==

