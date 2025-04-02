Return-Path: <linux-media+bounces-29201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EE5A789DF
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 10:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CAD0189419C
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 08:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142EF13D53B;
	Wed,  2 Apr 2025 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XuX/P8v9"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011045.outbound.protection.outlook.com [40.107.74.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CF521ABC3;
	Wed,  2 Apr 2025 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582576; cv=fail; b=pFguknCd7uWEJZAYnZaiYhdnZazlqtkPqa9ZuE2822G14hQIX/F0ICb8c1fbomWfkxbuZBW39D7fJ98CskCxEhm4rsDdlr9QK2bLKshEuvMonSsxPl0rrfFY7CY5fmwapRQSf/sRPKmzdQoMZwrwUeFDr1D213+UP/sQ0hA9G4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582576; c=relaxed/simple;
	bh=NAjcX5sq8zE4Go2bx3oyr50YnYPeFx9c9MbVkdKm0xM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CR6JH5wzkWhoQ/NABcNg7lE3DKqhpsnZvvy4vEX1mZi1H8o5Q5DJp5z7qIYQjCyoTLUZDNWmxDW4N8DXXVEEMrfzKwNoeUC9VXKJPCQyLCxJ0sSms1qRrpGg/s/Hqqddl9vpyP/Z3o9n40sm1K8t2Ceg6VggXA6GCY4LEBWvlBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XuX/P8v9; arc=fail smtp.client-ip=40.107.74.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMfY1J66YqiSNplFWwpQOY+a51jHMpEz/OOJx+PJbfD2/bg0CA8Je5HkodvRkHmaVXRG+H4u9dmqF/HxC2uz/HJOta8d5wRkevYmr6uJHoIohS1C/bLd6ekqOIaP1PDLK0413/peCGOMX+m4YX6rjOmFDxEkBkdCUpKeCbqlLlqf5bFW5q766Ud1kPnRvexmf/TncPh40eZ4efeA3mobM/YIXJx0VVm7BVGPZMaGaS/DZVck1OM6/GHuRW/axibuUuaOLipIMxkILWwxiyLfkg6f4wcQ3KuE27Xv9IzTNA5DsMdCsN7SbLiiO3NRLWRoRRZwpbv8quvkSjpU8atu4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAjcX5sq8zE4Go2bx3oyr50YnYPeFx9c9MbVkdKm0xM=;
 b=yYTNxiFumlv+dLUfrs30XiAy+gM4Dmo3OHPOhiBzOS+bw1WbB5UGUnj0SYI97/rI+DdiNe6ye3kGZNPe7M0+WHd+OIqbdlyrJjD4pseGoL8VRI8CGX2NMZF2g9cablu2bQUbfL30NA91VncFxI2PwRwafpi9gGs6xiMo6Utwdm+eU5g4Y7gzyQAqMvFD4zFp7XdVk6WtuaSVp1m1zH0gKMxHG4Og7N7VNlIHprgm9hjPdRC/VVksrQ8d5mPm7u1yDJH2ccLEKbH0Y35EdM9jXfAJTaltBUAaHHwxD6ZEYPM2fj3QAvT5oZ5auliKw23K2uVU6/eYwatj9jaIAIvSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAjcX5sq8zE4Go2bx3oyr50YnYPeFx9c9MbVkdKm0xM=;
 b=XuX/P8v9CEjOFzxJg1lIyx4HFmOXi/5mz4sjtPkyq6X6mtxz6rtfuDHXqbwiEcs7DO7Zf+Ydli02sFjNJHteO/tKssXSxecLbex7yaRFwFabnjVU7pySEVnPeX3sUXS4ewPwDL9CQvwwhKn6HEPpyojqlKqgkGebrl7ZY0bxYMk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB5688.jpnprd01.prod.outlook.com (2603:1096:604:c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Wed, 2 Apr
 2025 08:29:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 08:29:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Hans Verkuil
	<hverkuil@xs4all.nl>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?=
	<u.kleine-koenig@baylibre.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
Thread-Topic: [PATCH v5 11/17] media: rzg2l-cru: Add register mapping support
Thread-Index: AQHboAdhMLT6c7RZOkyzH0oxaSH/n7OP8RdwgAAScoCAAAvKoIAAAhgAgAAAYNA=
Date: Wed, 2 Apr 2025 08:29:24 +0000
Message-ID:
 <TY3PR01MB11346AFB98AC60A4660057D8686AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
 <20250328173032.423322-12-tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB11346ECE31CB6C8DC33459C2486AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sJQnyJb_uq9yEcjHRW7ZFOw3g2XQyygcozWTgMjrYxRQ@mail.gmail.com>
 <TY3PR01MB113462DC897E0DB681B1C020F86AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8ukJ+_Bhy-4nU_CFD4rMoTRxEY-q+bXHHZ-9Mz8gQ362A@mail.gmail.com>
In-Reply-To:
 <CA+V-a8ukJ+_Bhy-4nU_CFD4rMoTRxEY-q+bXHHZ-9Mz8gQ362A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB5688:EE_
x-ms-office365-filtering-correlation-id: ff1369d0-b19f-4465-1cff-08dd71c079e8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TnhnYjhYbEZtSmVWSHEvNHVUVGdrc3VSaG9CcWlBdGY5aTNnWWUzR1RDQmRD?=
 =?utf-8?B?MUUybFh5WFZmcGREM1pKQWs1cm14ZytyMzFibVd4TTNJQlZ1UUdQUk9MVHNi?=
 =?utf-8?B?V3c5ZkpFdVY2ZkZDcDRTeHBocUNPUGFnNGRYNzdSdlBsY0k3TkY0ZVNZeU9X?=
 =?utf-8?B?bFJTWW1McS9GQzQ3elBRTlVrcWdHQ3dla05Eb0I0KzdheUtMKy9wd1hEaU1P?=
 =?utf-8?B?RmZONVZ3a2xqYmg2c0ptQk5RdEtldit1RXJUTlpZMW9VbktwbFhpeDBPOFhU?=
 =?utf-8?B?N2dCb29sclVPNDlneTh2bWtsa1lNRHhJdHlJTGsxaGFramc2eUJzTjEvdXV3?=
 =?utf-8?B?d1lMaSt2eUxoRnYxWmExUzN1T0w4REpnaUNBNXlpMnJtbEo2VmJZWXFvekwx?=
 =?utf-8?B?UXRMY2dBeXVaRU44SWhwL3h3dkwxRGp6WUhsZE1NZ0hIZVpyRnFvTG1DNHB4?=
 =?utf-8?B?QTJIYzZRSnNDTlhuQWFqeVNEamhkSEEyUEhLaEVjSEdDeHlVLy80OTgwT2tw?=
 =?utf-8?B?c3YxejN3a2NkMTNyNHd0MkI1Z00vRjhOeERmNmZIRnVKVll1WlY2ZFMrZ0dD?=
 =?utf-8?B?enU3eDg4a25EaFhMN0JrVmFvSllCMklQTkViZ014a21SQm40VDZYdHZITXJU?=
 =?utf-8?B?MCtLdVozSEQ5Y1hWMTNmRjF1WktqZEFZS0xoWmk5UFREK1EvYndJdm1QeGlD?=
 =?utf-8?B?SERsQm8xV0YxL2xnbTlSKzFNalhJUzVNZnh4YVI2NHM5bFZNbGVxZjRsUjgy?=
 =?utf-8?B?OCs1dWlDYld2c0lxU0hZVCtIaFRFL216NUJqN3pJOHRTc3FHNWRrQXc4ait2?=
 =?utf-8?B?ZisxT2xOemd1NjNpYm8wRUtNN3NWL3dlYUl3SERPS0pXY0pGdytLcFhxVi9n?=
 =?utf-8?B?ZlU5YzY3bjVwdUhaRFdmcEdtWXk0YmxhcEZxNHZQVlp2NnJDZHU1RVJBZHIx?=
 =?utf-8?B?QldJelllalliMGt4WGJXd2txS3FvQUVZZCtGWTVzN1A2b3FwSmJOZTFkaUFX?=
 =?utf-8?B?NWRtMEtKamE4SVlUOHhhckdQb24rOFo5KzVtWnlUc3I3Yy9wWEo0eGdabDJl?=
 =?utf-8?B?QTdMczNOaENTWVI1MWdTMkJuMmlFak1hYU5GcmZxaUFybXE3dnoxUElqNFdx?=
 =?utf-8?B?NnhpL2tOK0Z0QVg5NDBRcUVaS1hIRjRZZkVtVFNGUTBsUVAvVFZFaXpiRy9X?=
 =?utf-8?B?bjZVZ3Y1WE8rcEVEU1hsaFRCMnpLdENWVGdGTnZrUEVScUZXMGlNV1lITTFO?=
 =?utf-8?B?YS9IeUFVcXRqOVJ5b2lzdlB1UDNid1kva25jRFh1bUFiRVZQenlhZjA1eC9L?=
 =?utf-8?B?SjRsRHAxQUZiUFk4MFZtTmx2akpvSlRENEZDYk95ZjBXOXZ2b2dtd1E0VGIr?=
 =?utf-8?B?Vm9DTEZDQUwxcWdwdEJscE5ONFJUVnBjbU5DR1BOdHJ2V1htbmtNUS95YkE3?=
 =?utf-8?B?cnFNMFMyczQ2RU5hZlFjN2dlalVmU3p2alRiWm4xNU9mVkVxaGdkSGNwSWM5?=
 =?utf-8?B?dUVZclA1S0JZU2p3VjdqQnVRVWdVZlRpZEd0TmxNeDNyajVVN2sxMUFZRkpR?=
 =?utf-8?B?K0hvSWpoYVJpUmh5YzN0aG9EM0tSY1BIWjBYb3VVenFUVVpqOFArU3oxUU1Y?=
 =?utf-8?B?QS9Kck5RWjE2V0FqVUQwSUlrV0sxWWk3L3F2L24vL3hNeEE3VlZFUEFmR2Z5?=
 =?utf-8?B?a3RocERKMkxLWkZCL2ZGZnNlSmo1SlR2UDFXcFZOUkhJWXFwVS94NTh3cnd0?=
 =?utf-8?B?OUpORE5rRTIwTDliRHJQZFpWdXo5QUhFWGV3bnViV1BlZlBBTlRDKzF5ejFh?=
 =?utf-8?B?ZzN4OWJKRVZzbmQ1ZUdkN1Z2MndkZDZnSy9pUUUyMHZ3VkhqTEpZNy8vZDUr?=
 =?utf-8?B?Y2U5MmFxL2tiSUFKNVV2VS83SUlsV1dwL09Tb1B6OHpiV0hyd0Z3MlZuMUp2?=
 =?utf-8?B?L3ArVGxjVTd3WEUzQ1pqdFRSbFlvZ0hjMHFqZ3NvWllVMGtLdEt1SS8yY3oz?=
 =?utf-8?B?RmQxSzdHWFdRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1h2b1lsMTA3T1V3OWhjSDU4R3luVnFHRnlrMmF4US9adXl5akU0M3BMYTVX?=
 =?utf-8?B?UVVLTGJWWE5XOXYzaktOQ1dHNXJkZnU0LzM1UnlvYWw1RTNqRGdWNUl3N2I2?=
 =?utf-8?B?eW9aZC9iNzR0Z2JkVXdUWEFlV3JvQUVMT2llYS91c0l5MHppeitmbXRLejVU?=
 =?utf-8?B?Qnh4ck9xdHR4ZEFTNi9yYmpRdG1ZdGVUbjVvQkNOdXQyekc2akNiRmFrK3F0?=
 =?utf-8?B?aC93akZ6cXl5M2twdzQ1YU54T2RVMG55WmYwaFJjR0FLa094TSs1Y05ZV29u?=
 =?utf-8?B?Tlg5TDd6RW10N3ZCUi9KVVNQM0Zna2F4TzRVZE9hbGQ3VW9DejVvWGZIV1ZE?=
 =?utf-8?B?YnlVN1VCVzZlRnpWYVprSXNFeDZxdWFlKyt3TVpldndhZFA3eFRobXBsUjIz?=
 =?utf-8?B?bzYrR0tJZkNiNi9EU2dLdEpOZXQ1WThFWUJEbG16dVhEbGxUQlVGNVdzaTlV?=
 =?utf-8?B?bnVyYlc3TFh2ZGxiWlB0bUZzdWN5WkdzYmdkbmhaYWpOeVo5SnQySHhhU2ZQ?=
 =?utf-8?B?VUFEWHZWcnVNRzYzcDg5SjBTUFhuOHNseEcxSmgwbHBPNktkTVBVYzlrNExC?=
 =?utf-8?B?MGNzMU45aHdnOXdRY0sxa1kxUzNOVUd1Um1xUUZQbWFFL1NnaE5HenhSTTFJ?=
 =?utf-8?B?Vmw2QkJySHdiUXhOVHFodktzQmNHSXNDMW5UL21wanQ3VWdUdlIwQVBTUjNZ?=
 =?utf-8?B?QVpHSnI4R3hNbzFNdVhVZVJ3dWFZbUR6OFc4MjduRlljOG4vdWFHS1lyZG0r?=
 =?utf-8?B?NFdFSWxtd1VNMnFNTkhGOUVmeG56b1JwQThCeHRGSXF6S0lzdGNVRkxSY3dn?=
 =?utf-8?B?NmxDSzNoRTN6dGxHKzVwbzN2clZyTjJQTWdFSUdzSEx5cFZiWTZmNG1WaUc3?=
 =?utf-8?B?Z29HNC9tYzdBTFdYRnlPbytTR09Bc0dqNnlXb0xlZmQ3UUlSTFoyK2ZZV04z?=
 =?utf-8?B?U1VyVXliZ2QwNGJpRUN0cTJVOGpVTlhMYzNmcG9GeDV4ZUpVQWc0TU1pdTVk?=
 =?utf-8?B?VS8zYWNBczluTFVWb0V0eldQdTdCOXpDbkh6ekdFZDJqdXNlNHN3VG5FSHJ5?=
 =?utf-8?B?RkJXa2VqalZ2UExXNWpRM2thMUlkdlBuc1BKSUtqaE1xaXNzN3V0Y20raDNm?=
 =?utf-8?B?U2RKZzUycUhhekFaNFNpTEYxWDFhVGpmUzhBMlQ2UitScFZJVzN1UzU1YVZh?=
 =?utf-8?B?d1pEaXFEWkZUN3lFU0p6Uy81ck1nWUxraTVRTVN5WTN3ZVlrTzBuRHBJeWZK?=
 =?utf-8?B?Y3BXS1VwNmtwYnk5ZGZwQSs1RnNjaDRaWnJuV0drdUhydkxHRFc4V3dlZUVw?=
 =?utf-8?B?N0drSUFYUmNtbU5CMmNhUVpFczFYS3M1Y1ZUZWRHdGhValBHbWxPRkFISEdV?=
 =?utf-8?B?WmtyK3ozdm5pZ1p0T0RCQzVMMmJLaHdRWjNBbjAvaGhVMm1KS3RnS0R4azho?=
 =?utf-8?B?bk5EOHE0bHZLRkFGS21jTFRYUE14OVE1MDlOaENNaFlLZmRmdWtPYnV0Vjlu?=
 =?utf-8?B?cDhacUlyKyttZEFIandYSWU1dTBYdzhrTndBSU5mZjZ6SUFzd3RlZjBoNkhT?=
 =?utf-8?B?TVRlRThPeVNTTldkQkQyVDBienhReU54WGYrRXpPTkYxUG1hTGpBWnpGT3ZH?=
 =?utf-8?B?cDczWllvWFdmTjduRytlRnhPaEVGdldScmxUQ2JrK0RpMkQzOTB6MzRBSkE1?=
 =?utf-8?B?dHI0alpJemxaQndTYytzZ0gzTjgwVy9ZL3NFZWZzN0ROMWRDNDQ3cGQ2RzlC?=
 =?utf-8?B?TUlrbXZKMUVVV1N1UU1PYldzbk5lOHIzL3BKaGRDVnhzV1FHT3I3RDI2bE1n?=
 =?utf-8?B?SW1pdVF5YVU2V0JUaDRkSXR5VlIzZ3hmcmFaeXdLZ20xU0N3b1plTXdCZmxu?=
 =?utf-8?B?YTBjMmNxZU9sUWFiR3dHL2VBQmtwZko4anIwZDRpZE1IeEdMOG1OdmJLUGsv?=
 =?utf-8?B?c2ZuSzNoUnk2NXZyQWJpYjI1VDNyY2dYVUdzQlBCcEoyNENsUHdJS01SQmx1?=
 =?utf-8?B?dmM0TlZ1blZqMk9QMTY2VkV1bUZjWmU0N1RpQldLNjFwaWxmRWRwVUE5dmM3?=
 =?utf-8?B?alpqTTc2T1RmVHJvRVFnTzZDQnlkdnRsSjJZVkkxRGpqcVBKSlJldGdTbnZy?=
 =?utf-8?B?dUVnYUlEWk5ucnN3dCtRUWdGQitwZjBBYVNIUGs3RFdBZ1Jhb001aVpHVlhV?=
 =?utf-8?B?dHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1369d0-b19f-4465-1cff-08dd71c079e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 08:29:24.8768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ojCGk2VqKLSw7dyLckIuoV4EY+aCWsSk2WIPGfK92Br8m85/eJ1FWPSmw2/LtT2Cj/kYtYisP5B0PljgQ3E2hB/8zYlwQM833SQCjyo/ERk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5688

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMDIgQXBy
aWwgMjAyNSAwOToyNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDExLzE3XSBtZWRpYTogcnpn
MmwtY3J1OiBBZGQgcmVnaXN0ZXIgbWFwcGluZyBzdXBwb3J0DQo+IA0KPiBIaSBCaWp1LA0KPiAN
Cj4gT24gV2VkLCBBcHIgMiwgMjAyNSBhdCA5OjIw4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpIFByYWJoYWthciwNCj4gPg0KPiA+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IExhZCwgUHJhYmhha2Fy
IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IDAyIEFwcmlsIDIwMjUg
MDg6MzUNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMTEvMTddIG1lZGlhOiByemcybC1j
cnU6IEFkZCByZWdpc3RlciBtYXBwaW5nDQo+ID4gPiBzdXBwb3J0DQo+ID4gPg0KPiA+ID4gSGkg
QmlqdSwNCj4gPiA+DQo+ID4gPiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuDQo+ID4gPg0KPiA+
ID4gT24gV2VkLCBBcHIgMiwgMjAyNSBhdCA3OjMx4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gSGkgVG9tbWFzbywNCj4g
PiA+ID4NCj4gPiA+ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQo+ID4gPiA+DQo+ID4gPiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gPiBGcm9tOiBUb21tYXNvIE1lcmNp
YWkgPHRvbW1hc28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiBTZW50OiAy
OCBNYXJjaCAyMDI1IDE3OjMwDQo+ID4gPiA+ID4gU3ViamVjdDogW1BBVENIIHY1IDExLzE3XSBt
ZWRpYTogcnpnMmwtY3J1OiBBZGQgcmVnaXN0ZXIgbWFwcGluZw0KPiA+ID4gPiA+IHN1cHBvcnQN
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhh
ZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFByZXBhcmUg
Zm9yIGFkZGluZyBzdXBwb3J0IGZvciBSWi9HM0UgYW5kIFJaL1YySFAgU29Dcywgd2hpY2gNCj4g
PiA+ID4gPiBoYXZlIGEgQ1JVLUlQIHRoYXQgaXMgbW9zdGx5IGlkZW50aWNhbCB0byBSWi9HMkwg
YnV0IHdpdGgNCj4gPiA+ID4gPiBkaWZmZXJlbnQgcmVnaXN0ZXIgb2Zmc2V0cyBhbmQgYWRkaXRp
b25hbCByZWdpc3RlcnMuIEludHJvZHVjZSBhDQo+ID4gPiA+ID4gZmxleGlibGUgcmVnaXN0ZXIg
bWFwcGluZyBtZWNoYW5pc20gdG8NCj4gPiA+IGhhbmRsZSB0aGVzZSB2YXJpYXRpb25zLg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gRGVmaW5lIHRoZSBgcnpnMmxfY3J1X2luZm9gIHN0cnVjdHVyZSB0
byBzdG9yZSByZWdpc3RlciBtYXBwaW5ncw0KPiA+ID4gPiA+IGFuZCBwYXNzIGl0IGFzIHBhcnQg
b2YgdGhlIE9GIG1hdGNoIGRhdGEuIFVwZGF0ZSB0aGUgcmVhZC93cml0ZQ0KPiA+ID4gPiA+IGZ1
bmN0aW9ucyB0byBjaGVjayBvdXQtb2YtYm91bmQgYWNjZXNzZXMgYW5kIHVzZSBpbmRleGVkDQo+
ID4gPiA+ID4gcmVnaXN0ZXIgb2Zmc2V0cyBmcm9tIGByemcybF9jcnVfaW5mb2AsDQo+ID4gPiBl
bnN1cmluZyBjb21wYXRpYmlsaXR5IGFjcm9zcyBkaWZmZXJlbnQgU29DIHZhcmlhbnRzLg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthcg0KPiA+ID4gPiA+
IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogVG9tbWFzbyBNZXJjaWFpDQo+ID4gPiA+ID4gPHRvbW1hc28ubWVyY2lhaS54
ckBicC5yZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiBDaGFuZ2VzIHNpbmNl
IHYyOg0KPiA+ID4gPiA+ICAtIEltcGxlbWVudGVkIG5ldyByemcybF9jcnVfd3JpdGUvcmVhZCgp
IHRoYXQgbm93IGFyZSBjaGVja2luZyBvdXQtb2YtYm91bmQNCj4gPiA+ID4gPiAgICBhY2Nlc3Nl
cyBhcyBzdWdnZXN0ZWQgYnkgTFBpbmNoYXJ0Lg0KPiA+ID4gPiA+ICAtIEZpeGVkIEFNbk1CeEFE
RFJMKCkgYW5kIEFNbk1CeEFERFJIKCkgYXMgc3VnZ2VzdGVkIGJ5IExQaW5jaGFydC4NCj4gPiA+
ID4gPiAgLSBVcGRhdGUgY29tbWl0IGJvZHkNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IENoYW5nZXMg
c2luY2UgdjQ6DQo+ID4gPiA+ID4gIC0gTWFyayBfX3J6ZzJsX2NydV93cml0ZV9jb25zdGFudC9f
X3J6ZzJsX2NydV9yZWFkX2NvbnN0YW50DQo+ID4gPiA+ID4gICAgYXMgX19hbHdheXNfaW5saW5l
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAgLi4uL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6
ZzJsLWNvcmUuYyAgIHwgNDYgKysrKysrKysrKysrLQ0KPiA+ID4gPiA+ICAuLi4vcmVuZXNhcy9y
emcybC1jcnUvcnpnMmwtY3J1LXJlZ3MuaCAgICAgICAgfCA2NiArKysrKysrKysrLS0tLS0tLS0t
DQo+ID4gPiA+ID4gIC4uLi9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jcnUuaCAg
ICB8ICA0ICsrDQo+ID4gPiA+ID4gIC4uLi9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcy
bC12aWRlby5jICB8IDU4DQo+ID4gPiA+ID4gKysrKysrKysrKysrKystLQ0KPiA+ID4gPiA+ICA0
IGZpbGVzIGNoYW5nZWQsIDEzOSBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkNCj4gPiA+
ID4gPg0KPiA+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gPiBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtY29yZS5jDQo+ID4gPiA+ID4gYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNvcmUuYw0KPiA+ID4gPiA+
IGluZGV4IGVlZDlkMmJkMDg0MTQuLmFiYzJhOTc5ODMzYWEgMTAwNjQ0DQo+ID4gPiA+ID4gLS0t
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jb3JlLmMN
Cj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1
L3J6ZzJsLWNvcmUuYw0KPiA+ID4gPiA+IEBAIC0yMiw2ICsyMiw3IEBADQo+ID4gPiA+ID4gICNp
bmNsdWRlIDxtZWRpYS92NGwyLW1jLmg+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAgI2luY2x1ZGUg
InJ6ZzJsLWNydS5oIg0KPiA+ID4gPiA+ICsjaW5jbHVkZSAicnpnMmwtY3J1LXJlZ3MuaCINCj4g
PiA+ID4gPg0KPiA+ID4gPiA+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCByemcybF9jcnVfZGV2ICpu
b3RpZmllcl90b19jcnUoc3RydWN0DQo+ID4gPiA+ID4gdjRsMl9hc3luY19ub3RpZmllciAqbikg
IHsgQEAgLTI2OSw2DQo+ID4gPiA+ID4gKzI3MCw5IEBAIHN0YXRpYyBpbnQgcnpnMmxfY3J1X3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gPiA+ID4gPiArKnBkZXYpDQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiAgICAgICBjcnUtPmRldiA9IGRldjsNCj4gPiA+ID4gPiAgICAgICBjcnUtPmlu
Zm8gPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsNCj4gPiA+ID4gPiArICAgICBpZiAo
IWNydS0+aW5mbykNCj4gPiA+ID4gPiArICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2Jl
KGRldiwgLUVJTlZBTCwNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJGYWlsZWQgdG8gZ2V0IE9GIG1hdGNoDQo+ID4gPiA+ID4gKyBkYXRhXG4iKTsNCj4gPiA+
ID4gPg0KPiA+ID4gPiA+ICAgICAgIGlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7DQo+
ID4gPiA+ID4gICAgICAgaWYgKGlycSA8IDApDQo+ID4gPiA+ID4gQEAgLTMxNyw4ICszMjEsNDgg
QEAgc3RhdGljIHZvaWQgcnpnMmxfY3J1X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KPiA+ID4gPiA+ICAgICAgIHJ6ZzJsX2NydV9kbWFfdW5yZWdpc3RlcihjcnUpOyAgfQ0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gK3N0YXRpYyBjb25zdCB1MTYgcnpnMmxfY3J1X3JlZ3NbXSA9
IHsNCj4gPiA+ID4gPiArICAgICBbQ1JVbkNUUkxdID0gMHgwLA0KPiA+ID4gPiA+ICsgICAgIFtD
UlVuSUVdID0gMHg0LA0KPiA+ID4gPiA+ICsgICAgIFtDUlVuSU5UU10gPSAweDgsDQo+ID4gPiA+
ID4gKyAgICAgW0NSVW5SU1RdID0gMHhjLA0KPiA+ID4gPiA+ICsgICAgIFtBTW5NQjFBRERSTF0g
PSAweDEwMCwNCj4gPiA+ID4gPiArICAgICBbQU1uTUIxQUREUkhdID0gMHgxMDQsDQo+ID4gPiA+
ID4gKyAgICAgW0FNbk1CMkFERFJMXSA9IDB4MTA4LA0KPiA+ID4gPiA+ICsgICAgIFtBTW5NQjJB
RERSSF0gPSAweDEwYywNCj4gPiA+ID4gPiArICAgICBbQU1uTUIzQUREUkxdID0gMHgxMTAsDQo+
ID4gPiA+ID4gKyAgICAgW0FNbk1CM0FERFJIXSA9IDB4MTE0LA0KPiA+ID4gPiA+ICsgICAgIFtB
TW5NQjRBRERSTF0gPSAweDExOCwNCj4gPiA+ID4gPiArICAgICBbQU1uTUI0QUREUkhdID0gMHgx
MWMsDQo+ID4gPiA+ID4gKyAgICAgW0FNbk1CNUFERFJMXSA9IDB4MTIwLA0KPiA+ID4gPiA+ICsg
ICAgIFtBTW5NQjVBRERSSF0gPSAweDEyNCwNCj4gPiA+ID4gPiArICAgICBbQU1uTUI2QUREUkxd
ID0gMHgxMjgsDQo+ID4gPiA+ID4gKyAgICAgW0FNbk1CNkFERFJIXSA9IDB4MTJjLA0KPiA+ID4g
PiA+ICsgICAgIFtBTW5NQjdBRERSTF0gPSAweDEzMCwNCj4gPiA+ID4gPiArICAgICBbQU1uTUI3
QUREUkhdID0gMHgxMzQsDQo+ID4gPiA+ID4gKyAgICAgW0FNbk1COEFERFJMXSA9IDB4MTM4LA0K
PiA+ID4gPiA+ICsgICAgIFtBTW5NQjhBRERSSF0gPSAweDEzYywNCj4gPiA+ID4gPiArICAgICBb
QU1uTUJWQUxJRF0gPSAweDE0OCwNCj4gPiA+ID4gPiArICAgICBbQU1uTUJTXSA9IDB4MTRjLA0K
PiA+ID4gPiA+ICsgICAgIFtBTW5BWElBVFRSXSA9IDB4MTU4LA0KPiA+ID4gPiA+ICsgICAgIFtB
TW5GSUZPUE5UUl0gPSAweDE2OCwNCj4gPiA+ID4gPiArICAgICBbQU1uQVhJU1RQXSA9IDB4MTc0
LA0KPiA+ID4gPiA+ICsgICAgIFtBTW5BWElTVFBBQ0tdID0gMHgxNzgsDQo+ID4gPiA+ID4gKyAg
ICAgW0lDbkVOXSA9IDB4MjAwLA0KPiA+ID4gPiA+ICsgICAgIFtJQ25NQ10gPSAweDIwOCwNCj4g
PiA+ID4gPiArICAgICBbSUNuTVNdID0gMHgyNTQsDQo+ID4gPiA+ID4gKyAgICAgW0lDbkRNUl0g
PSAweDI2YywNCj4gPiA+ID4gPiArfTsNCj4gPiA+ID4NCj4gPiA+ID4gRG8gd2UgbmVlZCBlbnVt
LCBjYW4ndCB3ZSB1c2Ugc3RydWN0IGluc3RlYWQgd2l0aCBhbGwgdGhlc2UgZW50cmllcyBpbnN0
ZWFkPw0KPiA+ID4gPg0KPiA+ID4gV2hhdCBiZW5lZml0IGRvIHlvdSBmb3Jlc2VlIHdoZW4gdXNp
bmcgc3RydWN0PyBXaXRoIHRoZSBjdXJyZW50DQo+ID4gPiBhcHByb2FjaCBiZWluZyB1c2VkIGEg
bWluaW1hbCBkaWZmIGlzIGdlbmVyYXRlZCB3aGVuIHN3aXRjaGVkIHRvIHN0cnVjdCB0aGVyZSB3
aWxsIGJlIGxvdHMgb2YNCj4gY2hhbmdlcy4NCj4gPg0KPiA+IFRoZSBtYXBwaW5nIGlzIGNvbnZp
bmllbnQgd2hlbiB5b3Ugd2FudCB0byBpdGVyYXRlIHRocm91Z2h0IGl0LiBIZXJlLA0KPiA+IGlm
IHlvdSBqdXN0IHdhbnQgdG8gYWNjZXNzIHRoZSBvZmZzZXQgdmFsdWUgZnJvbSBpdHMgbmFtZSwg
YSBzdHJ1Y3R1cmUNCj4gPiBsb29rcyBtb3JlIGFwcHJvcHJpYXRlLg0KPiA+DQo+IFRoYW5rcywg
YXMgdGhpcyBwYXRjaCBoYXMgYmVlbiByZXZpZXdlZCBieSBMYXVyZW50IGEgY291cGxlIG9mIHRp
bWVzIHdlIHdpbGwgY2hhbmdlIHRoaXMgdG8gc3RydWN0IElmDQo+IGhlIGluc2lzdHMuDQoNCkkg
anVzdCBwcm92aWRlZCBzdWdnZXN0aW9uIGFzIExhdXJlbnQgcmV2aWV3ZWQgYWxsIHRoZSBwYXRj
aGVzIGluIHRoaXMgc2VyaWVzIGV4Y2VwdCB0aGlzIG9uZSBhbmQNCkkgZ290IHRoaXMgY29tbWVu
dCBvbmx5IDMgZGF5cyBiYWNrLg0KDQpPbiB0aGUgb3RoZXIgaGFuZCwgYXMgd2l0aCB0aGlzIGFw
cHJvYWNoIHRoZXJlIHdvbid0IGJlIGFueSBhcnJheSBib3VuZCBjaGVjayBhbnltb3JlIHdpdGgg
V0FSTl9PTi9CVUlMRF9PTj8/DQpXZSBjYW4gZ2V0IHJpZCBvZiBlbnVtcyBldGMuLi4NCg0KQ2hl
ZXJzLA0KQmlqdQ0K

