Return-Path: <linux-media+bounces-56882-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGiLEQKWwmkXfAQAu9opvQ
	(envelope-from <linux-media+bounces-56882-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 14:47:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A235309B02
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 14:47:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2185B30152C5
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027503FCB30;
	Tue, 24 Mar 2026 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kUW/fOxg"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46783FBEAA;
	Tue, 24 Mar 2026 13:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359414; cv=fail; b=AgjzndP5nBVA4iLbI1HCoIjq0y0mMukrwWak15ozWpGEF+rPz+DPObmDiWzXVxizTfAvvHKrJcBd4IIV6Qz+9fioVPWxIVSOR4IRXOzpOLYR+E6mTnfm24DM20rkdl1uWtq1K1a2qFdxVPhlEKa9kgHXz6v0psUhyR1KqeH9kmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359414; c=relaxed/simple;
	bh=+bcZnczxA88LOOv0yZj6f47eON3IurvbQhoEq5yolIE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CxzSa5CyeidvsNMiuoLvXczAahuSHcPOMY4jeLzFz+19RUmRQVxlhV0ctt9enH//mOkVneGtAywpPRGffzZUDz5VnaBklZd5lgfWSsVsKOUu0W8W05CTluZe5AIH2c3ThsIf9kK87tBt2sISgL/vzNKCGBMHLCW3lwvzIez5OI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kUW/fOxg; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UI/hCC1thlhlS8PVm2BSryfE76o6HTPphKa/HDSHVWSWf9VM+QmHYkO/E1Pm3GFAzGnYXiihcmNPCQ/KHdATZCvhpX0hrMor8xNt+O/Mo6cxboe8elH6WLvII6gN85azcghosmd5rf586DSsQRnNryRhAK/p0AGdwoPHNANilqU7MM3sboLnsCtHVffxwFu+L9WTQ5ZWpajVPRFEdKbOA9+W45WAj3aZeIXNg/+4NM5u8YZRdrXyYKnNpJCwROY871PmYRDtFdVraX4yPiLjhRWcnNbpOF+i/ze6qU5JYJmN3MBUpNzt2LHheV/bRh+96+ZtiI1wnM7X80N1iIkP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhIQ1SBclHKw+Q8c8AXe0Esq5oz+eGAWfktGJnFBl0Y=;
 b=fplOjtIyrfVmV7pLsX7stBu1moG/B6MQ7+wVbfocuCAzlFRuBxvh9p0Q4P1kESV6jALUAJ0Y3HH8SD/1Q2vMRbaK28zs+UTZEOC7i/KrXoBZ7/RyrJ7yJPMavI27EDH5imeuma/MJt8RhwDlre4Dy3v9oTfvbuW+ziDmU03liixYB7E0R1da2VloPeAYJzSCJg4Q1wTIPP+vUYuaq3RKqldqU/plXvWFZk7fEk++nTRxKKrQGfpfblClLGsVgZlOdHxKCm7BGP3UpVBoUw0+VuwVzF8awgv2FGMlAbDc+BBNhAx+iEGbO1NSxOfqBhYMyzs54Q902yPbd9eVV7kM5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhIQ1SBclHKw+Q8c8AXe0Esq5oz+eGAWfktGJnFBl0Y=;
 b=kUW/fOxg/RaxOU9OcpHHwtA0AaecN5hBtrHo5Ddqm6SXm1JFBzJIGtmlYLPsmiGxsRG1nXtjPfK4P+FcyDrRJJBpplO/V6/3tYmZwo1sNRmgBGqOeVAXaR9eyugjvlkuAa6YYDeqasBFY5GQK1qyUAqYuhpInV99zqp3VCYfxWoQ0t2wmyW2Y7G+nTicpsJUwWm3wQVExhVBRpfzPHCMG37mHbmzTGcQvFPilJcaIUkOJTA5FLWpMQzWnLfT3bNtAPTYFvkJZOEl8oh9oxJEvYpwAk6OpN+GzGPIDoxT03DMIiEhIi717sWFQl+D3kbQqHUgVAHdllhlFEGDx6PZUg==
Received: from PAXPR04MB9424.eurprd04.prod.outlook.com (2603:10a6:102:2b2::13)
 by PAWPR04MB9765.eurprd04.prod.outlook.com (2603:10a6:102:389::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 13:36:43 +0000
Received: from PAXPR04MB9424.eurprd04.prod.outlook.com
 ([fe80::671d:216f:d493:44ce]) by PAXPR04MB9424.eurprd04.prod.outlook.com
 ([fe80::671d:216f:d493:44ce%4]) with mapi id 15.20.9723.022; Tue, 24 Mar 2026
 13:36:37 +0000
From: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
	<sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Frank Li <frank.li@nxp.com>,
	=?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, Jiwei Fu <jiwei.fu@nxp.com>, Forrest Shi
	<xuelin.shi@nxp.com>, Alexandru Iulian Taran <alexandru.taran@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: RE: [PATCH v2 4/9] accel/neutron: Add driver for NXP Neutron NPU
Thread-Topic: [PATCH v2 4/9] accel/neutron: Add driver for NXP Neutron NPU
Thread-Index: AQHcrW0UFol7c/rrhUWH45PRn/N4EbWhjjwAgBw7vqA=
Date: Tue, 24 Mar 2026 13:36:37 +0000
Message-ID:
 <PAXPR04MB9424461788159F730884F9F39448A@PAXPR04MB9424.eurprd04.prod.outlook.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
 <20260306-neutron-v2-4-3019bd8c91ef@nxp.com>
 <110dace9-3ff9-4750-813f-93c6827b105c@kernel.org>
In-Reply-To: <110dace9-3ff9-4750-813f-93c6827b105c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9424:EE_|PAWPR04MB9765:EE_
x-ms-office365-filtering-correlation-id: e597c0ac-3b0e-4f5d-6340-08de89aa5fcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|38070700021|921020|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 4/KnLqZUXvPYBH4vN/okmUyXk4OPiEdhPT/NsEzNNnUeEtRCSe7kMYhFz19l8kfw3QYL9oMz7QfCuqnrAZZlyLBa02bwjhG+6w64gSemxrDa11d4r7pElS1UWSWcJqPx+7fVLQggY44IA1P27EvGJfMpeOOcniDlyXo4uhpSjndjhzOQOgWfpo41NScUKVBlk1wr9V/nipRnSon9j9VxoVZlfXdvt5HnhOjzQl96ThzXFw9Mor/I2t9Fkt+mtK2jMG1QiKC4a2z/iKwbSu8QfgPz5d67Jm1QSnbVvxeAGlFZR9d2D8BtGkv5nAB3o7o6qIlw7lLCz3VQpoEP3wqmCvIaX8IfWtxaZNZMyyqIry9E3UQfQOnwabeX+fj8QH0F9ep0ZaNkyfEi9CGdYqA7tzrDUkYKNXsxY0TkPsY/j9AvLK+445ua0C6Yx8KaLrM4vzzpGnj52f3dq7efWksEo1kCIU9j8Bx4wUgriMagt3kfqwrnFbHhVagIoj2EvDbmK3bIrujK0cH+zs0RAAk1LQP+ZTkGi2e+6SKxL4tDtoAeT9vL3pDGdb6Z40LFQj0XqZ13b23NWebU7bC3Lik+l3939vBbz9FOhbUzfcwfohgPufptsJ68yfM2HBlCz2P3lnFBD/3MonSUhLf3JxmNxnDerNSyjAVGNrYT9oRmvXV7v71OHDF7BjZlwNo1dErOgejocN8aClhinbW2Odv5nOqwih3NI4LJ2irUFXdL+hIm+BKVVlmePzwbYvusFqhXtOnhLDOL5gD18gPClGq3Dg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9424.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(38070700021)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lwyAYR148TNzzl1QT8LGoqpuh5R1Y8Fnxf/cisCflxIqrC+9wPCdAjDqBP?=
 =?iso-8859-1?Q?nVV7ib5QnC/0fMCbsR60iZykLkqDj6f8XHYszh9e3i8fU7LD1vYj9KN+ES?=
 =?iso-8859-1?Q?lB7ONsv8KlhtWWiDiNMFCUX1glbpiCvqpvaSlCZ3t+8zdEtrwWxsiYE4e4?=
 =?iso-8859-1?Q?DKtILmqtKI4FnptguDETTbNorBFU/YXCC5PmWF0iN8cQSEwJx3hGeylERa?=
 =?iso-8859-1?Q?JjEQuZYQ/7WOKXXRe8oucPL/Y/DNK6BnFwssCNk3mcTjYzDF2RNzIczvli?=
 =?iso-8859-1?Q?QTnqdjaQTTyYC+UBxZwf7eYYYymC0gRdBMDGMDtfd/hqBQMSBk2jo58Py2?=
 =?iso-8859-1?Q?Ru03UmJjE8b4pin0Ej6ogTQSiRmDy9dHh2nSpyzO6Eg8HyM2U/E7MUsq/X?=
 =?iso-8859-1?Q?NQ/tAg+MugpfcSABb2fnPC0mmJ/d8SXbhAnddpcSmCODlQm3F5YJ29ZIzG?=
 =?iso-8859-1?Q?uIIDIk2QVol3q1LtJkYhhcVtPILsp4d1PemkjisXd+xeC90HdnH4rrfJC5?=
 =?iso-8859-1?Q?OcBc2paa78f8+BrrhtxbSK3RmeC5ul7FzEiEwnsF1obBLqOqIesfVRmiX+?=
 =?iso-8859-1?Q?nwVxYlbmYcOAMDfa5s5SpLHEoButKb3a+SUfSnRwMKijbyrck5oJkBou4h?=
 =?iso-8859-1?Q?Zb6qAsVF+TbmP4w+9rMiltKtEVvhDnoXV0d70J7RYLKJPOllclQ7hCVAIO?=
 =?iso-8859-1?Q?5pmR6vXw3oDBBnafxGYqWolqX3t+lm33SUPG8hprNXxF/xNFvy5jp5vUtB?=
 =?iso-8859-1?Q?W/u3qHuGx7pBO9RGCUVHMIlVW0qyzlDhPDhUbaJM5Gn501J/iYhKiuOKnH?=
 =?iso-8859-1?Q?Djttynq5+jtbpy+NCNUJjzHIC3/d+X/RKzXur6bCdMfG2dL7hF2dF9zDBK?=
 =?iso-8859-1?Q?Z6d7VjFl22BeETPhAaKqXe7lXA06/b7fhf82rhCVG/QJwhj4W9himfbg84?=
 =?iso-8859-1?Q?lVcZ8fX8ksrYy4OYx6P97ExLILtAuKx2QIhwKyJVvplPNPsD6V/mqeq+kT?=
 =?iso-8859-1?Q?Uh8c+3ra/PUFDp4dMKsBFMiy1LTO09vo6tcW0jDqUUI2SJyIGw65AwTRTO?=
 =?iso-8859-1?Q?Wya2PXcUATbQ1vorTuJM/zwy67AVgGqQIzNYaze4kmPsPtZhs9nimwPnBf?=
 =?iso-8859-1?Q?PJ0MjPWELC3GWJUFdYjjnNHdMqH4ZLcKU486qtLVilXdbUcUXzGeUYNhI6?=
 =?iso-8859-1?Q?KRoUsqN/bvIaSNEIySQoh46xrtgsW9j2g3V9sI9MApbDWANB0AOVwaAtUQ?=
 =?iso-8859-1?Q?z+gdKsOrlIlaPMZQsV8DZ6eQLuX55E2/Pu0AnJRsVBZITkglZ08sY/jnIL?=
 =?iso-8859-1?Q?p9NrapBuXLL2sPlKRALyfTH5CUwp8h2zEYRlRP20zwGcukvHlpbIWRS5Mt?=
 =?iso-8859-1?Q?6RgsTNCip6j4k9/D+Jin/aAERJDt26hWwWgPs0BBqizz1T4qt+uarHPMn6?=
 =?iso-8859-1?Q?AFMSHRZf3fIkBO658ZGvPEGWiF60gYkE9zgQxfatoPrI4Div5/lGhautJx?=
 =?iso-8859-1?Q?ejGZSPtT46Spz8flhf6Zm6ki6KSIZGZzBOssK0Ek35CbVqbYcuTHyc6cPl?=
 =?iso-8859-1?Q?6Bmj76szsDwNG6exCBOPruJ7lUYYdUo7Z7JgOFntcWafCeBrOS7YDlwylW?=
 =?iso-8859-1?Q?uSEcq/shYNeDoHiMmTWffCcF6YSvVvlqpCYBRu6V8GwRjjQKUNT2nQDbOf?=
 =?iso-8859-1?Q?IOocz4u8lIxMPpO80kH1D48xRsVrq3yEKtVvZlBMutI2OZeGFbYsvjMKGT?=
 =?iso-8859-1?Q?zEbYY19h3naUQqm/PquLhw5rWU0dFRDdIW4Ux6umX31GBaHAeS3Z1muVHd?=
 =?iso-8859-1?Q?H6H2Gosh0A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9424.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e597c0ac-3b0e-4f5d-6340-08de89aa5fcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 13:36:37.7720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A8Z2QEOs0bVPHY8QhX5+CeUgbdunAuougPCvGIpozEE2Xrd/fbRE6H4LmnFl9I6nXfMd8UDzkLxvJ0DwL9RC6vtiFR4QpdP825u6KnJLAK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9765
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56882-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,nxp.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,lists.freedesktop.org:email,nxp.com:dkim,nxp.com:email,PAXPR04MB9424.eurprd04.prod.outlook.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A235309B02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Friday, March 6, 2026 at 4:22 PM, Krzysztof Kozlowski wrote:
> On 06/03/2026 14:27, Ioana Ciocoi-Radulescu wrote:
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 8a5b27b061da..f7a687eb6b54 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19191,6 +19191,16 @@ S:	Orphan
> >  F:	Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
> >  F:	drivers/nfc/nxp-nci
> >
> > +NXP Neutron NPU DRIVER
>=20
> s/Neutron/NEUTRON/ as everything here is in uppercase

Ok.

>=20
> > +M:	Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
> > +M:	Jiwei Fu <jiwei.fu@nxp.com>
> > +L:	dri-devel@lists.freedesktop.org
> > +S:	Maintained
> > +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> > +F:	Documentation/accel/neutron/
> > +F:	drivers/accel/neutron/
> > +F:	include/uapi/drm/neutron_accel.h
>=20
>=20
> >
> > diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile index
> > 1d3a7251b950..698136e12cce 100644
> > --- a/drivers/accel/Makefile
> > +++ b/drivers/accel/Makefile
> > @@ -4,5 +4,6 @@ obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+=3D
> amdxdna/
> >  obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+=3D ethosu/
> >  obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+=3D habanalabs/
> >  obj-$(CONFIG_DRM_ACCEL_IVPU)		+=3D ivpu/
> > +obj-$(CONFIG_DRM_ACCEL_NXP_NEUTRON)	+=3D neutron/
> >  obj-$(CONFIG_DRM_ACCEL_QAIC)		+=3D qaic/
> > -obj-$(CONFIG_DRM_ACCEL_ROCKET)		+=3D rocket/
> > \ No newline at end of file
>=20
> You still have patch warnings.

Yeah, so the last line of this Makefile lacked the line ending and vim
fixed that on its own when I edited the file. I can add the neutron line
and leave the rest untouched, just making sure this is what you're
requesting?

>=20
> > +obj-$(CONFIG_DRM_ACCEL_ROCKET)		+=3D rocket/
> > diff --git a/drivers/accel/neutron/Kconfig
> > b/drivers/accel/neutron/Kconfig new file mode 100644 index
> > 000000000000..37b8ecb49804
> > --- /dev/null
> > +++ b/drivers/accel/neutron/Kconfig
> > @@ -0,0 +1,16 @@
> > +# SPDX-License-Identifier: GPL-2.0+
> > +
> > +config DRM_ACCEL_NXP_NEUTRON
> > +	tristate "NXP Neutron NPU"
> > +	depends on HAS_IOMEM
> > +	depends on DRM_ACCEL
> > +	depends on ARCH_MXC
>=20
> Missing compile test

Will add.

>=20
> > +	select DRM_GEM_DMA_HELPER
> > +	select DRM_SCHED
> > +	help
> > +	  Enables driver for NXP Neutron NPU.
> > +
> > +	  Select this if you have an NXP SoC with Neutron, like i.MX95,
> > +	  and want to run machine learning applications.
> > +
> > +	  If built as module, the module is named neutron.
>=20
> ...
>=20
> > +
> > +	ret =3D devm_request_threaded_irq(dev, ndev->irq, NULL,
> > +					neutron_irq_handler_thread,
> > +					IRQF_ONESHOT, KBUILD_MODNAME,
> ndev);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to request irq %d\n", ndev->irq);
>=20
> Drop, not needed.

Ok

>=20
> > +		return ret;
> > +	}
> > +
> > +	ret =3D of_reserved_mem_device_init(&pdev->dev);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to initialize reserved memory\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D devm_pm_runtime_enable(dev);
> > +	if (ret)
> > +		goto free_reserved;
> > +
> > +	pm_runtime_set_autosuspend_delay(dev,
> NEUTRON_SUSPEND_DELAY_MS);
> > +	pm_runtime_use_autosuspend(dev);
> > +
> > +	ret =3D drm_dev_register(&ndev->base, 0);
> > +	if (ret)
> > +		goto free_reserved;
> > +
> > +	return 0;
> > +
> > +free_reserved:
> > +	of_reserved_mem_device_release(&pdev->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static void neutron_remove(struct platform_device *pdev) {
> > +	struct neutron_device *ndev =3D platform_get_drvdata(pdev);
> > +
> > +	drm_dev_unregister(&ndev->base);
> > +	of_reserved_mem_device_release(&pdev->dev);
> > +}
> > +
> > +static int neutron_runtime_suspend(struct device *dev) {
> > +	struct neutron_device *ndev =3D dev_get_drvdata(dev);
> > +
> > +	neutron_disable_irq(ndev);
> > +	neutron_shutdown(ndev);
> > +
> > +	clk_bulk_disable_unprepare(ndev->num_clks, ndev->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +static int neutron_runtime_resume(struct device *dev) {
> > +	struct neutron_device *ndev =3D dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret =3D clk_bulk_prepare_enable(ndev->num_clks, ndev->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D neutron_boot(ndev);
> > +	if (ret) {
> > +		clk_bulk_disable_unprepare(ndev->num_clks, ndev->clks);
> > +		return ret;
> > +	}
> > +
> > +	neutron_enable_irq(ndev);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops neutron_pm_ops =3D {
> > +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> pm_runtime_force_resume)
> > +	RUNTIME_PM_OPS(neutron_runtime_suspend,
> neutron_runtime_resume,
> > +NULL) };
> > +
> > +static const struct of_device_id neutron_match_table[] =3D {
> > +	{ .compatible =3D "nxp,imx95-neutron" },
> > +	{}
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, neutron_match_table);
> > +
> > +static struct platform_driver neutron_driver =3D {
> > +	.probe	=3D &neutron_probe,
> > +	.remove	=3D &neutron_remove,
> > +	.driver	=3D {
> > +		.name		=3D "neutron",
> > +		.of_match_table	=3D
> of_match_ptr(neutron_match_table),
>=20
> Drop of_match_ptr. You will have (or you have already same as v1) here
> warning.

Will fix. But how do I get to see the warning here? Tried building with
W=3D1 and OF support disabled but it didn't complain.

Thanks!
Ioana

>=20
> > +		.pm		=3D pm_ptr(&neutron_pm_ops),
> > +	},
> > +};
> Best regards,
> Krzysztof

