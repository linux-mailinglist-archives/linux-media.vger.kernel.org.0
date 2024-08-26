Return-Path: <linux-media+bounces-16765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D25295EB6F
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 10:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2F811C20D9B
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 08:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9F912D773;
	Mon, 26 Aug 2024 08:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BB5ZiG2X"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078284EB51;
	Mon, 26 Aug 2024 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724659724; cv=fail; b=IvnE1LiRR/OnGppG0TDyMH+xsGUvf9TgTNXV2uXEZwupc3KXEgp5k40iRxzlMHoGbRpZGqnBWtOq6YM+kgEV04xsI3tTxHwz/HlEezdOpWsvytkzJGi8vNDguDH84Mcq9kEjDKob9/VTIT8BmZLZlFfj7DyZ89mZ9jkIPh+pWnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724659724; c=relaxed/simple;
	bh=fwYHJY8Ypys0kgFly957e8K4NdyFVEUyJRSDbRC/QVo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bMqTa7mg8HKhkxIDWVRqmM2TRA0GM5+p4D5aSql/xH6e27HlVjk4tcUyrUb/iDtHx4jvZFFs/AjDseO81FR/aXRBWJDCiAT5/WqyXZd0zZXLNAkMVH8Ln8ikF+s4G3BjY7fyXIbbiAQ5gmjgqKWYCxwfPQSLOhpKafeMjoGtwRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BB5ZiG2X; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xz8uYwknt0GX8/6xzmSGlIyUFL6KBIpEVw+sbbiu57uLiDoOZ7l1XwRQnDkJRpW+UrLYijpAKpcYMUak7k/cwh/NrL/BWvRBz/q+VVkpICcp6D7R5wJtoLUFcItvyW/0419A0qGQiRnTjyfLuaQSCVWIf0OQ2HTYE2Kc1fqVyfnYl5PjIYPSRbG3ZtMRqlxGv5aucyMceSl7IJigOWFQWW6KFWERqGSI+jtN6T7x0ivvlv7jdWNlS5vB4Fxv5OEsRYGuPuLQiR07ZosLJYRHFmCPwaBPLcxTHFkbuAfJR/yprBXvaJJ7EgGfDHpZud6A8HQ+fNpdm2PBAZaWJrHnFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwYHJY8Ypys0kgFly957e8K4NdyFVEUyJRSDbRC/QVo=;
 b=tL/5iIM6KrnhVa6pSdeaE+ZIfJLN1PuWmh8p8Ipi141r2jnubGBsDqWZEcdwfZ9zhjBX8imV4P3FnjsH1VVmVUi7x7DF1KU3TaIEPRuyDN6SU8Cq+ezxZ0BnSFeNb6hvvPj2P3mqyUl+wFlpV8mIegKJyV04HS5U3w8YnT87C6fPE/0ch55QHAPFMbtU/oYp6VTVsl7wdeZNWUlJ7E+3WrM8R/GbPmuljX7GoDjIVIIKWlrF/xmL/yYh2EdveYy3PCEvh320SHx/fYpGXXIgoDHQlaicVaTnyeCucYBBn4YiljrCZ7oEGEnZ6jIjU2gJL5aUgQD4AUeULphidRmdfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwYHJY8Ypys0kgFly957e8K4NdyFVEUyJRSDbRC/QVo=;
 b=BB5ZiG2XibEtbssbLZn9kvGFnTDak5nRHKq2gAm/zLWhuNntoBgX3Qway+be9A5ps61WIev4NeqfGnH1U/gEdaPgFUArGq/dgqHBqdXVK+Q0LQMMxXvcTGuMyFaxMKaUiO/I3ZOn5mT6zFyu5o515ex8Th+a3WOYEUtF2pDdDUQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8634.jpnprd01.prod.outlook.com (2603:1096:604:19c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 08:08:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 08:08:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to probe()
Thread-Topic: [PATCH v3] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to probe()
Thread-Index: AQHa9lJwxIfH6/jsnEWiya+jaS8y8LI5JhkAgAAKcqA=
Date: Mon, 26 Aug 2024 08:08:33 +0000
Message-ID:
 <TY3PR01MB11346F3C71013AD71C1556BA1868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240824182120.320751-1-biju.das.jz@bp.renesas.com>
 <6f16a3f7-99bb-47c4-9034-c1f0ccd59546@tuxon.dev>
In-Reply-To: <6f16a3f7-99bb-47c4-9034-c1f0ccd59546@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8634:EE_
x-ms-office365-filtering-correlation-id: 91f12f59-e0e3-4348-5d0a-08dcc5a647cf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Slo3ZE1FYUFCNkFNK2NpYU5MQ1laczZyOE5talI2TWt6cmZsMlU2ZWNBSWt4?=
 =?utf-8?B?ellFRkk5c3RTOENNWnpyZ2xkRFEwc1lUS01TaEFqcU5XaVVEaXVtNUhQQTVn?=
 =?utf-8?B?NHpWL0VnVHJwRm1IVkVNNDB1dEdHYWRFWXlCYVBFVUE3RTZObm83U09HRmM0?=
 =?utf-8?B?Z0lwUWE5MVYzd3Q2WkM4cU93SVlrVm9KR3JIT3QzSVBGTnhHK1R3N01oQi9Z?=
 =?utf-8?B?VGtCTzB0RmRmSG5kMzluZFJRaUdVVEdWWDdqak1laHc5M0Fxd2kvaExoYkRI?=
 =?utf-8?B?UEdud1JOWTl2Vmg3VDN0cjc0SmVoYVJYc1RFeGgvRDk0TG9UQjdYcEpUdk4z?=
 =?utf-8?B?OUQzUmltZHJ2RzhhUkpENXB1S3JBSTZSTTVxM0RzckUxOC9XL0pHTXB1aU54?=
 =?utf-8?B?NHNtTm45RGFEV3JCbFRGOXVNc3d5Q0ZBS2pHRXVpY1ZFeVIxbHJ0TlRiZXBV?=
 =?utf-8?B?eTVJTEF2b1BBYlp5aGMwUTh4TWZCZTdWNCtEcDZPblV0MjZJd3BJWmlvdytJ?=
 =?utf-8?B?dFY3OW5vWkZBM2I4MkxxTGY3VGxsS25iT1phcWZjeFhxYjVOUjA5OTlKSzFt?=
 =?utf-8?B?SUtKOHZDU0FWTWVZRkNwYVIyQysyQW5tRWY0Sm1obHR3R3krMzBIeGQ2UUJR?=
 =?utf-8?B?STc3NWNYc3ZlbndWWlF1MWxyVVNRMEZkQXFBNGhKd2Z1ZmhMVlZUVXdxWS9P?=
 =?utf-8?B?UjZNNUt1QmtxbDRnUjRZWlhnZHU5cWlONXFUTGU5aUsyREVscVQzbVg4eWth?=
 =?utf-8?B?OE9aWldCSldsY3I4WkxIdUNwblprRGZoN2JUckJIVGE2dGt2dVk3ZjJzWlFI?=
 =?utf-8?B?YmJRZFFrdXVrb0VpeC9VK2wwUlNHVS96emVGTUhOd0x5NUZOMmlmTmJISW5G?=
 =?utf-8?B?SEs4MllyNzdGcWtaRnlUR04vbGRMS1Z2aWtrY1dxbE9UOGN3NDVSVzNVNzhP?=
 =?utf-8?B?K0Y3RzZDNWhSQUREOEpDRDAzTWNTVVJudDR3a1FJYURMTHNuZ3Z1S3V6M1Y2?=
 =?utf-8?B?OXdJV3dySGhhdVVvY2xiWnRaSlFhV3ZxTkN0MDluNTQrWC92UmhPM01RK0lK?=
 =?utf-8?B?WHpNYVYvTGlicGRjZ2ZoMHl6R0ZmMVZaaEgxOXEyQ2FFZ1RDaVhxeFBjeVln?=
 =?utf-8?B?MWRKV3BNMEJMN1RTLzZrOVV2OFpXWjVFdGwraGROcDQ5UWYrRnRKUDVSUVJB?=
 =?utf-8?B?V0hGMEFuY2xmOGl5SUE2NXM1MFBUZERhS2pDK212RFkvK0VBcUg4VmxKckIr?=
 =?utf-8?B?TGNxU2pBT1hzN0l2UjNxY2tYVEs3Y0NLT29QcUQwNkZ4ODZwLzQ3eHd6ZWZ5?=
 =?utf-8?B?U0wzU25ROWwyM3N5Szc2dUdJM3RaemJxYzMrZUpEemlDVVhaUXRMZFpWWURI?=
 =?utf-8?B?UmZQbU1GWXNrM2QvMjdQY3o3TzJiWncvS3JxSzlFY0IzeHUxNnM4UzVmZmd6?=
 =?utf-8?B?Z25IWWNPM0VDR0sycGlqK2JzR3FBVmM0ekQ1L3I4UnNrSzhwcG1hMVJJM0w5?=
 =?utf-8?B?UjJlbW9XVWdNYmZSb1Z3a2dsdDF2VGY4T0RaWjhpZExleG5la0sxNGExM202?=
 =?utf-8?B?b3Q4a21OSUx6YldwU0tkV1pZZitBQXZmUDI4YUpzY0NlTEIxVzJ5dTNndVhq?=
 =?utf-8?B?OGJ4VWhrUTVOQ3p4d09ZRTVURnhwOWIwNWZvWFZjMGFZSTFtMHZZcW10RlhO?=
 =?utf-8?B?UUM0WDdFTStWcWs4YkhqVXJVRlFzaXc4NUpnQlJCOVAxVW04YlpuNjRwWmhr?=
 =?utf-8?B?RmRtSG9ub1NqS1RqbHRHcCtkMW9wbEtHZjg5QU8rQTUzdFlOeVNCcmlMNlk3?=
 =?utf-8?B?czNQNGdUcFczVGY2QWRBM3JjdWI0LzVuR1Z3ZlpMMEZpeSs3M3JGY3BIQTlY?=
 =?utf-8?B?bjl0YWxDVG42WEtFRFVES1owdG8xWmtqckFtYkhHYXgyc0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWRyVVF1M25nZjQyeTVRTGV1cVpqcmRHVk1FNjNGQTZoMm9UemxkSmdiSEwv?=
 =?utf-8?B?aE5RdUVRY3RRaDNDTEpuNDAvNkdBRkNObTN0bkE3WllTQmxnYnJqaW1XWURv?=
 =?utf-8?B?M3ZBMWJkWHFwOWdtUXE5azBvY1FLK0JDZkVWWlZaZ2l3M1Awb0JKR0lyeFBq?=
 =?utf-8?B?OHdjNUpubDNqUW96ZytpUmxCK0JyNS90RmRxN1lJUkcyTUFuUVRYa2J1cnRq?=
 =?utf-8?B?T2tTVWphTEh0U2hCQjYrWXpNUHhDa2hvVzRuV0lkV2lwS2ZGdVV1YmFWMUZq?=
 =?utf-8?B?TDRaV1A0Zi9kNmxZcWhFc1JmRVBTUkU0YXU0bTN2RXNweFcwelZaNXR4S2lU?=
 =?utf-8?B?enB0eVFkYkpyU1RKNlZSeUxLaTFJMFc2MnJwaE9BSmRCRTZFdUJ0TWt3MVJl?=
 =?utf-8?B?NUZyaWJDdjB1aGswSmFOQ3hTRkY4U1RaUW53S0t6blorK3JGb0VMNDM1ZXJY?=
 =?utf-8?B?VnNuZEF1bU9jaXUyMlQ3Q0xvZXB0MUtVQ0tJTVVmdnY4emVLNjBacmx6QXZv?=
 =?utf-8?B?OGZUdW01RktpV1lTUU5BdGdLTitsT2R5UTRzOUhWQmlSQVFxc2xMVXNYYk5F?=
 =?utf-8?B?TXlVT1hMWGRaNjdPQStGc0Vvd3NuSjRyZlpGOUZVYlRsa0NRdUYyTmZvRFZm?=
 =?utf-8?B?ZHVlQzhjRis1cStKQ01uWUMrS3hBdGhQbG1HTTRsL3dJRy95ZUxpZ0cwMmtj?=
 =?utf-8?B?Ty85ajV3cnNIdm1YS0VZc3JBUUVLeUh5RDJnNlh6WkJ0cWtZTnNEcWRqenNV?=
 =?utf-8?B?djM1U3daR3QwSW9waHVJZWxFY1hybjZmajFCTzh4V1IxWGI3MnBITDI2RXBI?=
 =?utf-8?B?QUNvRTRBM1hHYzZTdjl1RmFZM0JmeGF5T3lMUW94Z0NMYmF4TGt3Wm9SU3FP?=
 =?utf-8?B?VHZNU1E0bTdHN3c4RkxzSGU2dVBzME94Y0xRZEhrbWJtSXFkajc1SFM4THgw?=
 =?utf-8?B?Q2xVdDV4WlI4VXdGeEVablN1SHJxOExMNUVDWGVWUWtPMHBTT09XUUV4eDMz?=
 =?utf-8?B?YUFCL3F5aVlGZGN4SnRpdTZJRGoxczRlSTZqcnBUTFdNSlc0Sjl0WkdZMzV0?=
 =?utf-8?B?b0Zrb3FCSkMxRHI2SUZPcGtEYUtpYnB0T1Z4UllGei9qT2dPS1RxS0ppYjlL?=
 =?utf-8?B?MHlNRFFnMUl4ZEdzZGRDRThxTTFrT3NYM0xIRjdCank4VWVPaWtYcmdtM2d1?=
 =?utf-8?B?eFJjeWYydVZ6d1VnR2hiR09FQTlKQ2Q5K0RwdVdVUlZzOUw2RU5aWEFmeWFn?=
 =?utf-8?B?RlREZEF2YmFRc3dqSVhMSHY0Yml6UENhVERRSldPNENBdjh6LzhWWXZMYm9D?=
 =?utf-8?B?TEFONlVIdXk5TDdUWitndndoOVYvN29rQjBlZUFaTXVJSnBXRnFSeWpjQm43?=
 =?utf-8?B?MnQ5UzlPQUdWeUVtQXA5WFI3b2dYVmthamczZWNtZnBucG9XUGxoQjhkeGRQ?=
 =?utf-8?B?aEJ0NElIbU1KL1JQZWJRekdCOVpHQlJ4Sk5KVFhncTRCL1A3bEY0MlVaVEln?=
 =?utf-8?B?ZG40Vm8rMlUxdXpoRWhBaVhKMDg2R2JpMVBaekF5QVVrWmIvSWpIbnhyNjBB?=
 =?utf-8?B?QXVvTE1vdHE5UXdnS0VqZ25laWtVRVhjWGFqMkpnNjhpUjNDdDZIMzFSMU5t?=
 =?utf-8?B?ckduZytRSzJpcytpaWszcVdpeFphVkFHUVpGN203a1hqR0FibkJZYy90cDlH?=
 =?utf-8?B?MThudjlBQllvdnFxUWsvMkxXdnJGMUowdS8yNkF1SlkySHdZUVkrMEcvaDRy?=
 =?utf-8?B?VzRCVG5LZXdnSVZVWHFOekNub2FwQmlJekczcjdDQjNxdVdvVDg4eGZkRXFz?=
 =?utf-8?B?K3VRQ1ROdlNQY2lEWFd3SFNvNTlTcXVTdEFac3dVN3diT2dUN0FrTDZuanZz?=
 =?utf-8?B?LzZJejVoNWt5V1NMWXF5WVZQdDRIVVozQXFQYXBNM3RUSXlRalc1cHIxTE1x?=
 =?utf-8?B?NzZZbkxWTXNVQUJ1eGtkbmtwNXd3Mk5ZYmFkcVlrK0M0K0QwWnVUa3lINytz?=
 =?utf-8?B?Rmk1SU9XaWZXU2hHYjl4Vlp2bzBHdHVFSUtKN2JMQlJvcXBPTkFTZVJ0N0li?=
 =?utf-8?B?ZzgyN05VRm1pTTBJQjUwbUZyVGNOV1FOVWpHM1I1WVhiTWtzWkY3cVZuYits?=
 =?utf-8?B?RVRKOG5GWno1NUpXdWJBT2YvQ2dVOThvcU9GNWdsQXNXWUJsRmJ6U3dIVTZi?=
 =?utf-8?B?RHc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f12f59-e0e3-4348-5d0a-08dcc5a647cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 08:08:33.9547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+5gOXCikPmh+wCFmoNWPL68U/q0ehXetLaQXy5cdi5LERTohMjGcwBr4JDpccGQQB7kqiXjZkmaoN4zR9wVRZdgRuZQbhpWxagwRvawZHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8634

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiBNb25kYXksIEF1
Z3VzdCAyNiwgMjAyNCA4OjI3IEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIG1lZGlhOiBw
bGF0Zm9ybTogcnpnMmwtY3J1OiByemcybC12aWRlbzogTW92ZSByZXF1ZXN0X2lycSgpIHRvIHBy
b2JlKCkNCj4gDQo+IEhpLCBCaWp1LA0KPiANCj4gT24gMjQuMDguMjAyNCAyMToyMSwgQmlqdSBE
YXMgd3JvdGU6DQo+ID4gTW92ZSByZXF1ZXN0X2lycSgpIHRvIHByb2JlKCksIGluIG9yZGVyIHRv
IGF2b2lkIHJlcXVlc3RpbmcgSVJRIGR1cmluZw0KPiA+IGRldmljZSBzdGFydCB3aGljaCBoYXBw
ZW5zIGZyZXF1ZW50bHkuIEFzIHRoaXMgZnVuY3Rpb24gaXMgaW4gcHJvYmUoKSwNCj4gPiBpdCBp
cyBiZXR0ZXIgdG8gcmVwbGFjZSBpdCB3aXRoIGl0cyBkZXZtIHZhcmlhbnQgZm9yIG1hbmFnaW5n
IHRoZQ0KPiA+IHJlc291cmNlIGVmZmljaWVudGx5Lg0KPiA+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBM
YXVyZW50IFBpbmNoYXJ0DQo+ID4gPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9h
cmQuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0DQo+ID4gPGxhdXJlbnQu
cGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2Mi0+djM6
DQo+ID4gICogRHJvcHBlZCB3cmFwcGVyIGZ1bmN0aW9uIHJ6ZzJsX2NydV9wcm9jZXNzX2lycSgp
IGFuZCBtYWRlDQo+ID4gICAgcnpnMmxfY3J1X2lycSgpIGdsb2JhbC4NCj4gPiAgKiBBZGRlZCBS
YiB0YWcgZnJvbSBMYXVyZW50Lg0KPiA+IHYxLT52MjoNCj4gPiAgKiBVcGRhdGVkIGNvbW1pdCBo
ZWFkZXIgYW5kIGRlc2NyaXB0aW9uLg0KPiA+ICAqIE1vdmVkIHJ6ZzJsX2NydV9pcnEgZnJvbSBy
emcybC12aWRlby5jLT5yemcybC1jb3JlLmMgYW5kIGludHJvZHVjZWQNCj4gPiAgICByemcybF9j
cnVfcHJvY2Vzc19pcnEoKSBpbiB2aWRlby5jIHRvIHByb2Nlc3MgaXJxLg0KPiA+ICAqIERyb3Bw
ZWQgaW1hZ2VfY29udl9pcnEgZnJvbSBzdHJ1Y3QgcnpnMmxfY3J1X2Rldg0KPiA+ICAqIFJlcGxh
Y2VkIHJlcXVlc3RfaXJxIHdpdGggaXRzIGRldm0gdmFyaWFudC4NCj4gPiAtLS0NCj4gPiAgLi4u
L21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNvcmUuYyB8IDEzICsrKysr
KysrKy0tLS0NCj4gPiAuLi4vbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwt
Y3J1LmggIHwgIDYgKystLS0tDQo+ID4gIC4uLi9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9y
emcybC12aWRlby5jICAgICAgfCAxNSArKy0tLS0tLS0tLS0tLS0NCj4gPiAgMyBmaWxlcyBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNvcmUu
Yw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1j
b3JlLmMNCj4gPiBpbmRleCAyODBlZmQyYTgxODUuLjJhMjkwN2JlYjcyMiAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNvcmUu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpn
MmwtY29yZS5jDQo+ID4gQEAgLTI0Miw3ICsyNDIsNyBAQCBzdGF0aWMgaW50IHJ6ZzJsX2NydV9t
ZWRpYV9pbml0KHN0cnVjdA0KPiA+IHJ6ZzJsX2NydV9kZXYgKmNydSkgIHN0YXRpYyBpbnQgcnpn
MmxfY3J1X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gPiAqcGRldikgIHsNCj4gPiAg
CXN0cnVjdCByemcybF9jcnVfZGV2ICpjcnU7DQo+ID4gLQlpbnQgcmV0Ow0KPiA+ICsJaW50IGly
cSwgcmV0Ow0KPiA+DQo+ID4gIAljcnUgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9m
KCpjcnUpLCBHRlBfS0VSTkVMKTsNCj4gPiAgCWlmICghY3J1KQ0KPiA+IEBAIC0yNzAsOSArMjcw
LDE0IEBAIHN0YXRpYyBpbnQgcnpnMmxfY3J1X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ID4gIAljcnUtPmRldiA9ICZwZGV2LT5kZXY7DQo+ID4gIAljcnUtPmluZm8gPSBv
Zl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRldik7DQo+ID4NCj4gPiAtCWNydS0+aW1h
Z2VfY29udl9pcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiA+IC0JaWYgKGNydS0+
aW1hZ2VfY29udl9pcnEgPCAwKQ0KPiA+IC0JCXJldHVybiBjcnUtPmltYWdlX2NvbnZfaXJxOw0K
PiA+ICsJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCj4gPiArCWlmIChpcnEgPCAw
KQ0KPiA+ICsJCXJldHVybiBpcnE7DQo+ID4gKw0KPiA+ICsJcmV0ID0gZGV2bV9yZXF1ZXN0X2ly
cSgmcGRldi0+ZGV2LCBpcnEsIHJ6ZzJsX2NydV9pcnEsIElSUUZfU0hBUkVELA0KPiA+ICsJCQkg
ICAgICAgS0JVSUxEX01PRE5BTUUsIGNydSk7DQo+IA0KPiBCZWNhdXNlIHRoaXMgaXMgcmVxdWVz
dGVkIHcvIElSUUZfU0hBUkVEIHRoZSBmcmVlX2lycSgpIC0+IF9fZnJlZV9pcnEoKSBbMV0gd2ls
bCBjYWxsIHRoZSBJUlEgaGFuZGxlcg0KPiB0byBzaW11bGF0ZSBhbiBJUlEgU0hBUkUgc2NlbmFy
aW8gd2hlcmUgb3RoZXIgZGV2aWNlIGdlbmVyYXRlIGFuIGludGVycnVwdC4NCg0KQ3VycmVudGx5
IENTSSBkcml2ZXIgaXMgbm90IHJlZ2lzdGVyZWQgYW55IGludGVycnVwdHMgYW5kIENSVSBpcyB0
aGUgc2luZ2xlIHVzZXIuDQoNCkNoZWVycywNCkJpanUNCiANCj4gDQo+ID4gKwlpZiAocmV0KQ0K
PiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwgImZhaWxlZCB0byBy
ZXF1ZXN0IGlycVxuIik7DQo+ID4NCj4gPiAgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGNy
dSk7DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2Fz
L3J6ZzJsLWNydS9yemcybC1jcnUuaA0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5l
c2FzL3J6ZzJsLWNydS9yemcybC1jcnUuaA0KPiA+IGluZGV4IGE1YTk5YjAwNDMyMi4uMTc0NzYw
MjM5NTQ4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9y
emcybC1jcnUvcnpnMmwtY3J1LmgNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Jl
bmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNydS5oDQo+ID4gQEAgLTgsNiArOCw3IEBADQo+ID4gICNp
Zm5kZWYgX19SWkcyTF9DUlVfXw0KPiA+ICAjZGVmaW5lIF9fUlpHMkxfQ1JVX18NCj4gPg0KPiA+
ICsjaW5jbHVkZSA8bGludXgvaXJxcmV0dXJuLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9yZXNl
dC5oPg0KPiA+DQo+ID4gICNpbmNsdWRlIDxtZWRpYS92NGwyLWFzeW5jLmg+DQo+ID4gQEAgLTY4
LDggKzY5LDYgQEAgc3RydWN0IHJ6ZzJsX2NydV9pcCB7DQo+ID4gICAqDQo+ID4gICAqIEB2Y2xr
OgkJQ1JVIE1haW4gY2xvY2sNCj4gPiAgICoNCj4gPiAtICogQGltYWdlX2NvbnZfaXJxOglIb2xk
cyBpbWFnZSBjb252ZXJzaW9uIGludGVycnVwdCBudW1iZXINCj4gPiAtICoNCj4gPiAgICogQHZk
ZXY6CQlWNEwyIHZpZGVvIGRldmljZSBhc3NvY2lhdGVkIHdpdGggQ1JVDQo+ID4gICAqIEB2NGwy
X2RldjoJCVY0TDIgZGV2aWNlDQo+ID4gICAqIEBudW1fYnVmOgkJSG9sZHMgdGhlIGN1cnJlbnQg
bnVtYmVyIG9mIGJ1ZmZlcnMgZW5hYmxlZA0KPiA+IEBAIC0xMDUsOCArMTA0LDYgQEAgc3RydWN0
IHJ6ZzJsX2NydV9kZXYgew0KPiA+DQo+ID4gIAlzdHJ1Y3QgY2xrICp2Y2xrOw0KPiA+DQo+ID4g
LQlpbnQgaW1hZ2VfY29udl9pcnE7DQo+ID4gLQ0KPiA+ICAJc3RydWN0IHZpZGVvX2RldmljZSB2
ZGV2Ow0KPiA+ICAJc3RydWN0IHY0bDJfZGV2aWNlIHY0bDJfZGV2Ow0KPiA+ICAJdTggbnVtX2J1
ZjsNCj4gPiBAQCAtMTQxLDYgKzEzOCw3IEBAIHZvaWQgcnpnMmxfY3J1X2RtYV91bnJlZ2lzdGVy
KHN0cnVjdCByemcybF9jcnVfZGV2DQo+ID4gKmNydSk7DQo+ID4NCj4gPiAgaW50IHJ6ZzJsX2Ny
dV92aWRlb19yZWdpc3RlcihzdHJ1Y3QgcnpnMmxfY3J1X2RldiAqY3J1KTsgIHZvaWQNCj4gPiBy
emcybF9jcnVfdmlkZW9fdW5yZWdpc3RlcihzdHJ1Y3QgcnpnMmxfY3J1X2RldiAqY3J1KTsNCj4g
PiAraXJxcmV0dXJuX3QgcnpnMmxfY3J1X2lycShpbnQgaXJxLCB2b2lkICpkYXRhKTsNCj4gPg0K
PiA+ICBjb25zdCBzdHJ1Y3QgdjRsMl9mb3JtYXRfaW5mbyAqcnpnMmxfY3J1X2Zvcm1hdF9mcm9t
X3BpeGVsKHUzMg0KPiA+IGZvcm1hdCk7DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC12aWRlby5jDQo+ID4gYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiBp
bmRleCBiMTZiOGFmNmU4ZjguLmU4MGJmYjlmYzFhZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiArKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMN
Cj4gPiBAQCAtNTI3LDcgKzUyNyw3IEBAIHN0YXRpYyB2b2lkIHJ6ZzJsX2NydV9zdG9wX3N0cmVh
bWluZyhzdHJ1Y3QgcnpnMmxfY3J1X2RldiAqY3J1KQ0KPiA+ICAJcnpnMmxfY3J1X3NldF9zdHJl
YW0oY3J1LCAwKTsNCj4gPiAgfQ0KPiA+DQo+ID4gLXN0YXRpYyBpcnFyZXR1cm5fdCByemcybF9j
cnVfaXJxKGludCBpcnEsIHZvaWQgKmRhdGEpDQo+ID4gK2lycXJldHVybl90IHJ6ZzJsX2NydV9p
cnEoaW50IGlycSwgdm9pZCAqZGF0YSkNCj4gPiAgew0KPiA+ICAJc3RydWN0IHJ6ZzJsX2NydV9k
ZXYgKmNydSA9IGRhdGE7DQo+ID4gIAl1bnNpZ25lZCBpbnQgaGFuZGxlZCA9IDA7DQo+ID4gQEAg
LTYzNywxMyArNjM3LDYgQEAgc3RhdGljIGludCByemcybF9jcnVfc3RhcnRfc3RyZWFtaW5nX3Zx
KHN0cnVjdCB2YjJfcXVldWUgKnZxLCB1bnNpZ25lZCBpbnQNCj4gY291bnQNCj4gPiAgCQlnb3Rv
IGFzc2VydF9hcmVzZXRuOw0KPiA+ICAJfQ0KPiA+DQo+ID4gLQlyZXQgPSByZXF1ZXN0X2lycShj
cnUtPmltYWdlX2NvbnZfaXJxLCByemcybF9jcnVfaXJxLA0KPiA+IC0JCQkgIElSUUZfU0hBUkVE
LCBLQlVJTERfTU9ETkFNRSwgY3J1KTsNCj4gPiAtCWlmIChyZXQpIHsNCj4gPiAtCQlkZXZfZXJy
KGNydS0+ZGV2LCAiZmFpbGVkIHRvIHJlcXVlc3QgaXJxXG4iKTsNCj4gPiAtCQlnb3RvIGFzc2Vy
dF9wcmVzZXRuOw0KPiA+IC0JfQ0KPiA+IC0NCj4gPiAgCS8qIEFsbG9jYXRlIHNjcmF0Y2ggYnVm
ZmVyLiAqLw0KPiA+ICAJY3J1LT5zY3JhdGNoID0gZG1hX2FsbG9jX2NvaGVyZW50KGNydS0+ZGV2
LCBjcnUtPmZvcm1hdC5zaXplaW1hZ2UsDQo+ID4gIAkJCQkJICAmY3J1LT5zY3JhdGNoX3BoeXMs
IEdGUF9LRVJORUwpOyBAQCAtNjUxLDcgKzY0NCw3IEBAIHN0YXRpYw0KPiA+IGludCByemcybF9j
cnVfc3RhcnRfc3RyZWFtaW5nX3ZxKHN0cnVjdCB2YjJfcXVldWUgKnZxLCB1bnNpZ25lZCBpbnQg
Y291bnQNCj4gPiAgCQlyZXR1cm5fdW51c2VkX2J1ZmZlcnMoY3J1LCBWQjJfQlVGX1NUQVRFX1FV
RVVFRCk7DQo+ID4gIAkJZGV2X2VycihjcnUtPmRldiwgIkZhaWxlZCB0byBhbGxvY2F0ZSBzY3Jh
dGNoIGJ1ZmZlclxuIik7DQo+ID4gIAkJcmV0ID0gLUVOT01FTTsNCj4gPiAtCQlnb3RvIGZyZWVf
aW1hZ2VfY29udl9pcnE7DQo+ID4gKwkJZ290byBhc3NlcnRfcHJlc2V0bjsNCj4gPiAgCX0NCj4g
Pg0KPiA+ICAJY3J1LT5zZXF1ZW5jZSA9IDA7DQo+ID4gQEAgLTY3MCw5ICs2NjMsNiBAQCBzdGF0
aWMgaW50IHJ6ZzJsX2NydV9zdGFydF9zdHJlYW1pbmdfdnEoc3RydWN0IHZiMl9xdWV1ZSAqdnEs
IHVuc2lnbmVkIGludCBjb3VudA0KPiA+ICAJaWYgKHJldCkNCj4gPiAgCQlkbWFfZnJlZV9jb2hl
cmVudChjcnUtPmRldiwgY3J1LT5mb3JtYXQuc2l6ZWltYWdlLCBjcnUtPnNjcmF0Y2gsDQo+ID4g
IAkJCQkgIGNydS0+c2NyYXRjaF9waHlzKTsNCj4gPiAtZnJlZV9pbWFnZV9jb252X2lycToNCj4g
PiAtCWZyZWVfaXJxKGNydS0+aW1hZ2VfY29udl9pcnEsIGNydSk7DQo+ID4gLQ0KPiA+ICBhc3Nl
cnRfcHJlc2V0bjoNCj4gPiAgCXJlc2V0X2NvbnRyb2xfYXNzZXJ0KGNydS0+cHJlc2V0bik7DQo+
ID4NCj4gPiBAQCAtNjk4LDcgKzY4OCw2IEBAIHN0YXRpYyB2b2lkIHJ6ZzJsX2NydV9zdG9wX3N0
cmVhbWluZ192cShzdHJ1Y3QgdmIyX3F1ZXVlICp2cSkNCj4gPiAgCWRtYV9mcmVlX2NvaGVyZW50
KGNydS0+ZGV2LCBjcnUtPmZvcm1hdC5zaXplaW1hZ2UsDQo+ID4gIAkJCSAgY3J1LT5zY3JhdGNo
LCBjcnUtPnNjcmF0Y2hfcGh5cyk7DQo+ID4NCj4gPiAtCWZyZWVfaXJxKGNydS0+aW1hZ2VfY29u
dl9pcnEsIGNydSk7DQo+ID4gIAlyZXR1cm5fdW51c2VkX2J1ZmZlcnMoY3J1LCBWQjJfQlVGX1NU
QVRFX0VSUk9SKTsNCj4gPg0KPiA+ICAJcmVzZXRfY29udHJvbF9hc3NlcnQoY3J1LT5wcmVzZXRu
KTsNCg==

