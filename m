Return-Path: <linux-media+bounces-17866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA54497009A
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 09:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FECC28528D
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 07:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D9C14885B;
	Sat,  7 Sep 2024 07:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RAMmK6hZ"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011065.outbound.protection.outlook.com [52.101.125.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0A417753;
	Sat,  7 Sep 2024 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725694891; cv=fail; b=dVsrssfovX70ZtTWbeO6JGaqwmWH0qcrqIYEF/trix08OrB42EqtQnZcftI0YhqtDGJczTPGUvHRqAQWVoZhOkEeAmnweJ6zOEjeMXmzKt1tY6QDHm2RVsUxNsxagDD4aZeRnKOKpAdcZMKVSyPKxeQDGxT+qEX8kyKBOZq6EcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725694891; c=relaxed/simple;
	bh=xHxxE22yHacKRxvsSnmajoZyDLRRFdRUjBNDz0NdNhA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qzxnr2Hvw/vtHvwLdpkI6+I6x7tOhpqafDafBvMvEkhDrfv7kZSwjalRdyPCZQqj5I45cJ6MrPtcaAfDOqXFglba60NMbl3bHq+Nz7RyR1AQhEe+i8Lp7BxTeRn3DJDtTfu3JRa5qzxGzG4P+2M74tDXG0RsPrTyG9zxFM5bkM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RAMmK6hZ; arc=fail smtp.client-ip=52.101.125.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baG5CbxkGtWA8ujHmheSATNMf6UaacdoCxfAHs4B2zLwhwVG5lRXgVypAxfhEd0Q9aTg6SLy8Q5LRS71C3wTmKN+HyaXw4ysJeoqTRaM9VrDFJNx52zjQpGjaNxUtbQsN0+wHZlxrnt0yAgjGeKm0R9Vl0B9SF1ICnxyZ9QVzUxs+oNz41u6HlYvfcT0qdaNGNZd3KxepfhgxHTrqbndgJcASO8OM4b0UWi6H7lnhcQMuCtKYFi09KMFNLANE8Kj7QKNks43MljkyEXJxWShw2stYFGesjjDCdBjpsPrb6lu+XhXbt/1hpxUDcaHRfWOQOQ4HfppP2ayrBZsdpQ/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHxxE22yHacKRxvsSnmajoZyDLRRFdRUjBNDz0NdNhA=;
 b=Z2TrPHWix2B4fgghYmztsi6lUvNdQDqv0FmkjUFkYmYWRMJ1QMqacSQRt48hsnglEPFFRi/oelm7QAU1fqIHjuJwW1HFPpr4jGnVVfSyEyZV4kzfJ3mpQhaq9piAaL3JNgyfBKpbbeWh3dg77p7Z4aeF3XrPDZlN3Ykyqz3ME4Ugz9NYd/6KYhE/16KUMvdZcRk8FlY8esEmdi32h+OAPDIQ8+oBHq/0bOup/QjsKWA5vpKndAkwpT0cjniwG/AImiGb3HHVeQNjiTUBxA9hhKe7RAR0geAUSryYE5FfjYSHVZope041RvKs6VcJaXAkFTJrykaUim525Qy6qIUzOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHxxE22yHacKRxvsSnmajoZyDLRRFdRUjBNDz0NdNhA=;
 b=RAMmK6hZU/QXFLCCgrvOLNH7zFFq+OXyEE4NwmhcA7wC1g3XW8GXlhybfqqOJ/UR2t3+1nF3zkE+bHSttM9y4gKPDfy8SCQFyTo1DaAs15+W3OqfnA0LmI1xrh2d9fOnzSqT9vQHI9/yBt+AvxW+Mwmpq4uqQJr7yTVE5V8cHMQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB7070.jpnprd01.prod.outlook.com (2603:1096:400:dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.21; Sat, 7 Sep
 2024 07:41:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7939.017; Sat, 7 Sep 2024
 07:41:24 +0000
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
Thread-Index: AQHa/4Vayw10oWeJKk+GlBZb9vTbq7JLcqoAgAB+MjA=
Date: Sat, 7 Sep 2024 07:41:24 +0000
Message-ID:
 <TY3PR01MB113461F40823C3404EB4E61AA869F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240905111828.159670-1-biju.das.jz@bp.renesas.com>
 <20240906235948.GH27086@pendragon.ideasonboard.com>
In-Reply-To: <20240906235948.GH27086@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB7070:EE_
x-ms-office365-filtering-correlation-id: 85950213-910a-47e2-56b4-08dccf1079c7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?am5qZU9oUmlXMXZZWEY2UmxPZitZb2lWN1hMcFZKSHZRQkxnZkJpQUR2SDBZ?=
 =?utf-8?B?T0dNcGJtQm1jOTM2QVJqaU5lOTNpZnFLbFhkU1ZDRGdkUzF6eERPZllPMUI4?=
 =?utf-8?B?TXk0OW1qY1pYWlcrZ29TMGhJaWpkTnlNbTVSL0R0YVZmamJsbkZVU2dhei96?=
 =?utf-8?B?NTFHazRGUWt0YXM2ZUxCZjhTbEFxMWI4a1FlZjh1MGp5YSswNVFOcVNKZ0Ry?=
 =?utf-8?B?b1V3N3MzUWZWWXA5L1ozSWRIVXR6R0tWVkl2MHVqQnhoaUJUSXhZUUFVUGhu?=
 =?utf-8?B?SkFZRHlPMFFpTUFHdlE0OUp6cWcvUHVzdm03aFFWTHJRTWRtWVFrdERTa1M4?=
 =?utf-8?B?K0I3eUpoUndKVnF1dGhzYWZkalY4KzBQczlkTjhvUFlndWYrK3pIamNZdUxi?=
 =?utf-8?B?Z0VsdGhwMUU1M0lndnZCYlMvajZyekE5NWlBbXNYN1FkUVBGZlZYRGkyRHdo?=
 =?utf-8?B?eDdpb3FNMVdCZnBQMUZQdklkYnlNODU0VGtVczZLZE1IdXNrMGlCZ0pFTjd4?=
 =?utf-8?B?YTQ2cldXRCtzL2VIWkQ0M0dISUg1Qi9VNS9raXRkMnpFNzVwOGc3blZqd3Ry?=
 =?utf-8?B?c05XZEpsRTliVVA0R3hjcERmcHE1aG9pdnVVNEFqMHBWdmU1NlZCOEtJL0Rr?=
 =?utf-8?B?TG5vZGV2MDhQVWtHMTVyb0U2RzFlRklQcnFCSU5MOEhCSUpYa3JyUENBQnRU?=
 =?utf-8?B?OU1wTXh5dVdtMk5YcW4yekRUNElVTlpZZjZ6MVhDbE1mZjNhVzdjMmxhbjRE?=
 =?utf-8?B?M2xMcUJEckFDamlWVG9TYkJLeURJVThkZHdMT3c4Q2RSQVE1a3U3WmF3THlR?=
 =?utf-8?B?MjRaU1pVdTVQUjBROGZiNXpEMVhRbDlnYWlQSVhIOWMzS2hFU2haMnJHTkpB?=
 =?utf-8?B?dEZ2aDdVN1ZIejlpV1ZYY1N4TG9nSWtlVEtoSFkwY01VSlZjVnlWVHRDbDJM?=
 =?utf-8?B?Q01WZW53OTNsVE1PZGZxWjBoRlg4dDdWeHBpUHZ4d21GTkIyeUlqVTVjWGxE?=
 =?utf-8?B?VE9aU1JacE05K1F3YmZlUmtFbHVhNlFXN0FzZ1kzYVJOa1ZCRDQ0eTR4TWdw?=
 =?utf-8?B?SGl6S2J6ZGJ0WTU1cTkyNGliNGx2MlQwMUVXYVhXZkJuWFI2M0VYLzVVVEFm?=
 =?utf-8?B?eVpwTWM1Uis0OUVlT1c3cTdmM2dSbkI5S2ZNWGZzdjFtMkNyVUhsSGlJcDhX?=
 =?utf-8?B?Q1BrYTVxb1NsNitlemptQ0d6eGloZkJMN2h4Q2RvaEIwUTNZM0NDRHhidXhV?=
 =?utf-8?B?U3FVZm55cjFqRHJOMEZseld4NVE1SENOK3hXek1QYVRQOVNKSzU3aDFaSTRK?=
 =?utf-8?B?YTRPLyt2VnByTkQ1cmtONjZhaHBVREJnSUxQS1Q1UlNCcUZEMmJ1MWRVdmRQ?=
 =?utf-8?B?VHhES3A4NFk0ejgxK1BPdy9MSlRTaU9CU0RmemIxNFBYOEdqZnBuSlNWUEV2?=
 =?utf-8?B?cElPN3FTMWVPb0NsU0hPOFYzdHYzZllhNUZMQ1VueXlXU3ZhYk1mckd6OHZa?=
 =?utf-8?B?Yy9jSEVXRnYwRkc2RkRDazFDSFl5cGg2cURYVVUvVERoenBuei9HRk10dzdp?=
 =?utf-8?B?QlhjQUgyU3VyZXd5Wm0xZkVnVXpBalJzdG5TS0hzdDl6QzRxczl6bUtWeno1?=
 =?utf-8?B?WW1CZC9DVENoeVEreEFZNy9OWHNRTGNoeVh2c2l6RUsxTi9SMkNGYkJOZVdJ?=
 =?utf-8?B?Y1Z5ZitzZkVVRFpOM2JqRmR4c1BiYm94M1dONzNVcFhhZmhjY0FWM2RxcmRR?=
 =?utf-8?B?TnZhaXd1bnN5VlA4VCs5VEpic2tLTDc0c3pWb0krRUpjN3NqOGlZQTRhZXlZ?=
 =?utf-8?B?Z3pPSDlFNExLQ0lhNDFrNWdmNmZjOWFxMkVRTEpFRnZZdSswOXhXMCtLOGtR?=
 =?utf-8?B?ckRjdlNxbWhEU1RhSU5QalB1b2FkcUIvZytnNnlKek5xK0E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2pqaCtLRXdjZ0FPdVJxMFZ5VE9JeW9Wdm9wZ20rSjhnZFcxMlVVT28vQzhL?=
 =?utf-8?B?b3lKcjUxaXR2VytUWW8yQWl4RmpmdHF3OU9EakxLb0RUWndwV2JaKzM5SE4v?=
 =?utf-8?B?TlpZUytoNTlpcTB2KzlDR0FTN25MWFRVSWhTZmpCSnBQVUErcFA5bzVEWXkz?=
 =?utf-8?B?ampyS2YrTlN3L1dGUVl5NWtjR1lsNlcyRFlaYkRpK0xjM2VWVms5YXFVaWNN?=
 =?utf-8?B?VWpVeUx3Ukg3T1VQVC9neFgzNFZOQWs1b2JoVWd2WER5eGNoY0tvQ01GM2tv?=
 =?utf-8?B?RUN5RnRhYjVZeXRVQVFXNVhGRUFzdlFWUENyakRpbmhqc1dpeHB4MlhyVlVH?=
 =?utf-8?B?QnZDTzRGWjRrUUJzKzJoWEJBZnE5RlUxVmZ5b3FFMzBMR2pQWC9wc3NNb0lO?=
 =?utf-8?B?Z3N2c0pxNURlaXh0TitVbmZMMXlDK3B0emJLaWZJaWhGL3hySWlmd1FVZTRl?=
 =?utf-8?B?MnVJZ2xWbGhoY3JqN3RYV0xaYmxRNWZLMWFVSVZCYnNkaWpNYlJtTzBHc2lm?=
 =?utf-8?B?WEpNajBiS1lBN2dTSVdCWUxrREdDcXlNeWJ3eDN5dDgxU1FsSi90YXBoVnRi?=
 =?utf-8?B?L1BJcVN2Um1PcXZhWGFMcnk0ZjlzcWtpcWlUMzI4WUk4M2hpblppZnhXcjl6?=
 =?utf-8?B?dHVFTHdKTGxjanlWdkhhbEpsQzlJQytWNmNKSGh3TTVrT29yeVFwWHRYVnJl?=
 =?utf-8?B?V1ZRelZxUTREMjFIeUR4aTFNdnpDSDFVNFBSTnJUam45ditvZkVVRllNeVZ1?=
 =?utf-8?B?SGxNc2MzWmpUQmZuRWdkc2xxRDV1am5jdmdVeXJMcjZhNnFCL0puREt5T1Mr?=
 =?utf-8?B?L2lEQ3VLU1lXdzRpakNzUmpSY3dtd1pqemtKWmw0WEYxdndCVUVpRE1KZm91?=
 =?utf-8?B?TEV0ODRocEh6cjRSbGdTYU1XSnYwaWNHemhXWE1EdUwwZ3FJazl1Y1BGQjM0?=
 =?utf-8?B?dFArdUJ0ajBkQUl2NTllMzRiTnFEdXI5dHRHRE5hU1ZYQ3hIWVpHK1hDM1RL?=
 =?utf-8?B?bzB4cTBFRS9pbW1IR1dkb0tuQTVubUtFU0dTeXhwMGJkTTFRZS9LNllBUWRv?=
 =?utf-8?B?RkhNbDkrbm5reXd1Y2loSWRWUmJJbHdBMGk2V1lzYTBSWW1na0pjY0xML01U?=
 =?utf-8?B?QlIvZWNzWGZrSnZCS2diTGgxNU5ERi93N1VzZWpINzhMS2FyNzVGa3RUZmow?=
 =?utf-8?B?czQyM0Q4R1pRbGtPZ1pOODA2VkpuUXRIMDBLWnJjNjQ4VDNmY28xbEgzZGxB?=
 =?utf-8?B?V0xrditwWjluNzFaUk1aSUZGUmNKQUJNRzdWOCtjWnI2TCt2c3R6Y3lRT00z?=
 =?utf-8?B?ZHJSbnI2cGRjVkdMUHpMK1FEWWNSckpHdmhBSGdaV2xUWkdyblJBTlBhRkw3?=
 =?utf-8?B?VTZGSGlXbHZhQ2FEU1k2QTNqSG5NUEZYYVJxS2JDMU95QWh4L2kzQmZ1OXFM?=
 =?utf-8?B?eWI0aHVKT3BZM1YyK3kxMDBOaVZiT2F4RENwYkN2V2llbzFEbURFTktKUFVv?=
 =?utf-8?B?QzJva05BajRyalRIbUVlZVBBTlo0QVF5S1lzUTUzeWtlTzZqbTdTdjg3OFR6?=
 =?utf-8?B?NTlyWDYwUG8zcGpNM1BydzNhQ2Z2WUVpSkVjOTk5TUZiK3JZL1lWeUZpRXRO?=
 =?utf-8?B?TFRPZXd6R1dOSzA5clNlSlBUaWVCYnZGQkluN0FZRzZQbGw4Ylk3VTlzWUNv?=
 =?utf-8?B?VXJCNnZCWEs1RFJXSllpR3RyYm9XVWY0VXBZb2FhT0ZaVHVYcEY5WENGRXcy?=
 =?utf-8?B?djNqOXZWTTk5Ym02czNPZmgwTWFxYTVMUm42Qm9uYk9LdGVEV0p1SDlEMi9p?=
 =?utf-8?B?REhIc2xvSVBhcVZQTjgweFovVU9Ic0tpOVJDSCtTcGlGYUtPcEEvaEZ4S0Ri?=
 =?utf-8?B?ZHYrNmg3U0srYVA4bitBU2pLbThHNFVLb0l0dUZvUnJsbWRiZmlhakphVFFz?=
 =?utf-8?B?SWZDd1EveHZ5U3BWcHpJLzF3SXlWdWR5Smt1Qk1SMFMxVnlSOWcySHd1TlZJ?=
 =?utf-8?B?OFVDVDA3NENCRTg4YkFQSjdQOVgrSklZRmZBazgwcWhSZXJmOHM1dVR1dll6?=
 =?utf-8?B?dnVXb3ZDcEZFcU10Z0x1eExjY1RzREVCR2RXZUNzUjVUUzhZN29aRmIvS2E4?=
 =?utf-8?B?MnpSVGNYWFMzUktUUU11R2lnbmRsT21LbmwvTTA0dzVHZy9ab3dHZjZOM3c2?=
 =?utf-8?B?dFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 85950213-910a-47e2-56b4-08dccf1079c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2024 07:41:24.8786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DPJzn6fPk05Y8Enujc4v4i0p0r66uu6N5GAdZJEXtJ4mt8ozw0U4eDiNuQ3nCzNneHVz2h9S+ZcCPgFl6IziRjFKeu1OANaY4NMz4KPiNcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7070

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgU2VwdGVtYmVy
IDcsIDIwMjQgMTowMCBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBtZWRpYTogcGxhdGZvcm06
IHJ6ZzJsLWNydTogcnpnMmwtdmlkZW86IFNldCBBWEkgYnVyc3QgbWF4IGxlbmd0aA0KPiANCj4g
SGkgQmlqdSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gVGh1LCBT
ZXAgMDUsIDIwMjQgYXQgMTI6MTg6MjZQTSArMDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gQXMg
cGVyIHRoZSBoYXJkd2FyZSBtYW51YWwgc2VjdGlvbiAzNS4yLjMuMjYgJ0FYSSBNYXN0ZXIgVHJh
bnNmZXINCj4gPiBTZXR0aW5nIFJlZ2lzdGVyIGZvciBDUlUgSW1hZ2UgRGF0YTssIGl0IGlzIG1l
bnRpb25lZCB0aGF0IHRvIGltcHJvdmUNCj4gPiB0aGUgdHJhbnNmZXINCj4gDQo+IHMvOy8nLw0K
DQpPb3BzLCBXaWxsIGZpeCB0aGlzIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gPiBwZXJmb3Jt
YW5jZSBvZiBDUlUsIGl0IGlzIHJlY29tbWVuZGVkIHRvIHVzZSBBWElMRU4gdmFsdWUgJzB4Zicg
Zm9yDQo+ID4gQVhJIGJ1cnN0IG1heCBsZW5ndGggc2V0dGluZyBmb3IgaW1hZ2UgZGF0YS4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEhpZW4gSHV5bmggPGhpZW4uaHV5bmgucHhAcmVuZXNhcy5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUv
cnpnMmwtdmlkZW8uYyAgICB8IDExICsrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC12aWRlby5jDQo+ID4gYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiBpbmRleCAzNzRk
YzA4NDcxN2YuLmQxN2UzZWFjNDE3NyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiArKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLXZpZGVvLmMNCj4gPiBAQCAt
NTIsNiArNTIsMTEgQEANCj4gPiAgI2RlZmluZSBBTW5NQlMJCQkJMHgxNGMNCj4gPiAgI2RlZmlu
ZSBBTW5NQlNfTUJTVFMJCQkweDcNCj4gPg0KPiA+ICsvKiBBWEkgTWFzdGVyIFRyYW5zZmVyIFNl
dHRpbmcgUmVnaXN0ZXIgZm9yIENSVSBJbWFnZSBEYXRhICovDQo+ID4gKyNkZWZpbmUgQU1uQVhJ
QVRUUgkJCTB4MTU4DQo+ID4gKyNkZWZpbmUgQU1uQVhJQVRUUl9BWElMRU5fTUFTSwkJR0VOTUFT
SygzLCAwKQ0KPiA+ICsjZGVmaW5lIEFNbkFYSUFUVFJfQVhJTEVOCQkoMHhmKQ0KPiA+ICsNCj4g
PiAgLyogQVhJIE1hc3RlciBGSUZPIFBvaW50ZXIgUmVnaXN0ZXIgZm9yIENSVSBJbWFnZSBEYXRh
ICovDQo+ID4gICNkZWZpbmUgQU1uRklGT1BOVFIJCQkweDE2OA0KPiA+ICAjZGVmaW5lIEFNbkZJ
Rk9QTlRSX0ZJRk9XUE5UUgkJR0VOTUFTSyg3LCAwKQ0KPiA+IEBAIC0yNzgsNiArMjgzLDcgQEAg
c3RhdGljIHZvaWQgcnpnMmxfY3J1X2ZpbGxfaHdfc2xvdChzdHJ1Y3QNCj4gPiByemcybF9jcnVf
ZGV2ICpjcnUsIGludCBzbG90KSAgc3RhdGljIHZvaWQNCj4gPiByemcybF9jcnVfaW5pdGlhbGl6
ZV9heGkoc3RydWN0IHJ6ZzJsX2NydV9kZXYgKmNydSkgIHsNCj4gPiAgCXVuc2lnbmVkIGludCBz
bG90Ow0KPiA+ICsJdTMyIGFtbmF4aWF0dHI7DQo+ID4NCj4gPiAgCS8qDQo+ID4gIAkgKiBTZXQg
aW1hZ2UgZGF0YSBtZW1vcnkgYmFua3MuDQo+ID4gQEAgLTI4Nyw2ICsyOTMsMTEgQEAgc3RhdGlj
IHZvaWQgcnpnMmxfY3J1X2luaXRpYWxpemVfYXhpKHN0cnVjdA0KPiA+IHJ6ZzJsX2NydV9kZXYg
KmNydSkNCj4gPg0KPiA+ICAJZm9yIChzbG90ID0gMDsgc2xvdCA8IGNydS0+bnVtX2J1Zjsgc2xv
dCsrKQ0KPiA+ICAJCXJ6ZzJsX2NydV9maWxsX2h3X3Nsb3QoY3J1LCBzbG90KTsNCj4gPiArDQo+
ID4gKwkvKiBTZXQgQVhJIGJ1cnN0IG1heCBsZW5ndGggdG8gcmVjb21tZW5kZWQgc2V0dGluZyAq
Lw0KPiA+ICsJYW1uYXhpYXR0ciA9IHJ6ZzJsX2NydV9yZWFkKGNydSwgQU1uQVhJQVRUUikgJiB+
QU1uQVhJQVRUUl9BWElMRU5fTUFTSzsNCj4gPiArCWFtbmF4aWF0dHIgfD0gQU1uQVhJQVRUUl9B
WElMRU47DQo+ID4gKwlyemcybF9jcnVfd3JpdGUoY3J1LCBBTW5BWElBVFRSLCBhbW5heGlhdHRy
KTsNCj4gDQo+IEl0IHdvdWxkIGJlIG1vcmUgZWZmaWNpZW50IHRvIGp1c3Qgd3JpdGUNCj4gDQo+
IAlyemcybF9jcnVfd3JpdGUoY3J1LCBBTW5BWElBVFRSLCBBTW5BWElBVFRSX0FYSUxFTik7DQoN
CkkgdGhvdWdodCBhYm91dCB0aGF0LiBCdXQgdGhlbiByZS1yZWFkaW5nIHJlZ2lzdGVyIGRlc2Ny
aXB0aW9uIGNoYW5nZWQgdGhlIG1pbmQgYmVjYXVzZQ0Kb2YgdGhlIGJlbG93IGJpdHMNCg0Kezks
OH0g4oCUIDAxYiBSIFJlc2VydmVkOg0KV2hlbiByZWFkLCB0aGUgaW5pdGlhbCB2YWx1ZSBpcyBy
ZWFkLiBXaGVuIHdyaXRpbmcsIGJlIHN1cmUgdG8gd3JpdGUgdGhlIGluaXRpYWwgdmFsdWUuDQpP
cGVyYXRpb24gaXMgbm90IGd1YXJhbnRlZWQgaWYgYSB2YWx1ZSBvdGhlciB0aGFuIHRoZSBpbml0
aWFsIHZhbHVlIGlzIHdyaXR0ZW4uDQoNCns2LDR9IOKAlCAxMDFiIFIgUmVzZXJ2ZWQ6DQpXaGVu
IHJlYWQsIHRoZSBpbml0aWFsIHZhbHVlIGlzIHJlYWQuIFdoZW4gd3JpdGluZywgYmUgc3VyZSB0
byB3cml0ZSB0aGUgaW5pdGlhbCB2YWx1ZS4NCk9wZXJhdGlvbiBpcyBub3QgZ3VhcmFudGVlZCBp
ZiBhIHZhbHVlIG90aGVyIHRoYW4gdGhlIGluaXRpYWwgdmFsdWUgaXMgd3JpdHRlbi4NCg0KQWxz
bywgYml0cyB7MjcsMjR9LCB7MjIsMTZ9IGFuZCB7MTMsMTJ9IC0wYiA6DQoNCkl0IGlzIG1lbnRp
b25lZCB0aGF0DQpXaGVuIHJlYWQsIHRoZSBpbml0aWFsIHZhbHVlIGlzIHJlYWQuIFdoZW4gd3Jp
dGluZywgYmUgc3VyZSB0byB3cml0ZSB0aGUgaW5pdGlhbCB2YWx1ZS4NCm9wZXJhdGlvbiBpcyBu
b3QgZ3VhcmFudGVlZCBpZiBhIHZhbHVlIG90aGVyIHRoYW4gdGhlIGluaXRpYWwgdmFsdWUgaXMg
d3JpdHRlbi4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiB0aGUgaGFyZHdhcmUgbWFudWFsIGhv
d2V2ZXIgZG9lc24ndCBtYWtlIGl0IGNsZWFyIGlmIHRoaXMgaXMgc2FmZSBvciBub3QuIFRoZSBy
ZXN0IG9mIHRoZSByZWdpc3RlciBpcw0KPiByZXNlcnZlZCwgYW5kIHdyaXRlcyBhcyBkb2N1bWVu
dGVkIGFzIGlnbm9yZWQsIGJ1dCB0aGUgcmVzZXQgdmFsdWUgaXMgbm9uLXplcm8uIElmIGl0J3Mg
bm90IHNhZmUgdG8NCj4gd3JpdGUgdGhlIHJlc2VydmVkIGJpdHMgdG8gMCwNCj4gDQo+IFJldmll
d2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5j
b20+DQo+IA0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgcnpnMmxfY3J1X2NzaTJfc2V0
dXAoc3RydWN0IHJ6ZzJsX2NydV9kZXYgKmNydSwgYm9vbA0KPiA+ICppbnB1dF9pc195dXYsDQo+
IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K

