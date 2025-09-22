Return-Path: <linux-media+bounces-42859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A42B8EBC1
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 04:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 979153BBD21
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 02:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602B52ED842;
	Mon, 22 Sep 2025 02:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W/j6n09s"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011023.outbound.protection.outlook.com [40.107.130.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB7623CB;
	Mon, 22 Sep 2025 02:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758506779; cv=fail; b=C9+WcQlmkUQk3Aly4CYisdhSYQ8qGF2jVjJK0ufYIBE8n5KryGDn+WdmSOm9pCmL9nXk6p1jen2EFMK9qWsa/MO1MrEBbFG8+YAOD8VqaNUfS5pvt8XZYbao8XlrqrXcrrQNa1F/7KpFcXGYURK4dEMHzQLWMuDZ703AV9Hlz2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758506779; c=relaxed/simple;
	bh=OkNW7HBuMm4NMSUMF0FxsefZPUQFV8RiPBTyGz2WdUc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z8Lsv6Wdegp0ltffbL6y9nyjpv0M7alk2Q8RauY6cAP3tLcNM9yTFkgKUTtlGGZ6RddWXs4tDWfTorBa4CnsWfm6ERAAAe+hw4F2h+X/y5GPUn49HGbA93EiehvYCeUOPpa5gdAdGj2cOVrS6JLT2xQnLrD4t/w/BDFRFlA4ZYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W/j6n09s; arc=fail smtp.client-ip=40.107.130.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmUcoL72DPU9fYRay0Ed6bNeuawWhwmfXEwlANJAPZB5SKuf0Oe/mjdo7ox/oUVePj95Qw5tBbGUoEEiWkcfKwnTLNqFKkFz2CNKlvqfSSMwqTrJEcMXsDnRAWUUl3Zv30lrkzsUnhmqY/qk0VFNvT9GnT0eQJb1nhx60oqIkneHOlERBzXxo6JrjFkXMs8NJ8CpYf56qf9pZhZUKSbyrEVRWbIRNUfOk2bjNnUOD6tjnpzpyY96uE9crDC0CD7RLcbVgA0XqyJbhQc/5iKHMwiHaSe+Z1p751ZUXoOoJshOGRdjrCAzKDIrdKAxPAkv/P05i1p++j/ipYKhrIcH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkNW7HBuMm4NMSUMF0FxsefZPUQFV8RiPBTyGz2WdUc=;
 b=F6YRXujW3X1tZSES6tPMeail7W2aWWO1Jb9h+NtdB+42GAVcOZF69NTJ0JI9qrVSYJ6pydKgTGNuDkytxwk5SQuUBjekccQ7U5vfXst7Njq903rEQCW2vx72FVQVUALXyHSMZcFhpWNkpvG1nqwUojDVWezVPftpyFymDJKy+nJxpgGTCez8YFCUwRjoBzhVuqERPzaAti4v66XMb+JKbNTQOq/RVZ9nzqIvl1TvxVA6c90gEaZ0OSMN/i8rcZ8ayskOttwz7357AVke1V/fDgTCp/LlSfgjt/IeFAN/1gfzTY7R5KWaI3NxDdKR0rqAg2OQh6dYw+2ikqqNE9ZmUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkNW7HBuMm4NMSUMF0FxsefZPUQFV8RiPBTyGz2WdUc=;
 b=W/j6n09s9e82QxFS8ciDYCcI67INjmhcBDgiCm8lEA9vCijK9Bx1GBqYssQVfUTxkJ6YRq/gkCzmpL45dD4H6ftazWEkgfdBuB9tObkgZLvWcG0PoMpy0wLfjxuqcPRy1CenzVvlzWuQyptzojYc4w+7FYa+/5l9taLnDDGRiPpNggv60S/5W09tfvRbyCAIcsU5x9q5S6+sqawwsXkG8HyoYZsfNPIiyej+mnCCl8NYxkhRlad7RkcSqIgqMHE8FZD10xOHGGyXGcuQbRqOYz68SflTRhJq3oxIqOwSmlsxbMKDUD4ZZvN4W8XdRUI/DHJxRLvoZyDynKdRn7QpSQ==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI0PR04MB10640.eurprd04.prod.outlook.com (2603:10a6:800:26b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 02:06:14 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 02:06:14 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v2 5/5] media: nxp: imx8-isi: Add ISI support
 for i.MX91
Thread-Topic: [EXT] Re: [PATCH v2 5/5] media: nxp: imx8-isi: Add ISI support
 for i.MX91
Thread-Index: AQHcHjI8FAQ0xyKIGE+eHKYMo/VqwbSeUYCAgAA8e1A=
Date: Mon, 22 Sep 2025 02:06:14 +0000
Message-ID:
 <AS8PR04MB9080BBDB6689E5051FEE5953FA12A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-5-37db5f768c57@nxp.com>
 <20250921222743.GE10540@pendragon.ideasonboard.com>
In-Reply-To: <20250921222743.GE10540@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|VI0PR04MB10640:EE_
x-ms-office365-filtering-correlation-id: 3386db10-f000-497e-d29c-08ddf97c9bd9
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?M0VQY2ZDVzFPMktkSk0yUzYwZHA3em91UkNYVE80eG41M3RBTTQwVFFCNzAy?=
 =?utf-8?B?NkYvL0trSVZPQitJSGlER3VIUS9naDJJeVFhbWJHRjZEVHlvSmltc1ZOQ3Bm?=
 =?utf-8?B?dC9QTUNjWGZnSUlDcTZvTmZMUDVaSUdBeW9hdG1hQWlGWCtVdG52Zzczb3h4?=
 =?utf-8?B?aGtrdDVyNVFjWjdrNVd4QTVjZXl6STRqejJRTlU4S2tGeVZGcVRTOEswWDlU?=
 =?utf-8?B?OWZROFJRbU0wdUJmTjJOa3dGZ2xCdmpBQStwTm1Zb2RpOTRuR2lNckFTQy9q?=
 =?utf-8?B?ditVVzNDZ1I3SUhTVTFBVWVhUU93OXdnYlhPT2IvQ1F5Lyt0TE1Pbmhqa2Ir?=
 =?utf-8?B?TmF0Mmg0M3drMUhuTmxLU2tYSVIvNjN0NEZObmNvZUI4bGxEaUw3V1R0cnNM?=
 =?utf-8?B?RUpEcUJCL2ZJU0dqalNIYjIyVWl2VzhHck85TVc3QW10SWZ3UUlNeUZIbDhj?=
 =?utf-8?B?QWZZWENJTVVpdjJHWE1MSUZxaG5OK2dDTVg0dXVWNUpobEx5cjB2QWw0WjJp?=
 =?utf-8?B?WENMdXVmTmQ1NGprOFNzWVZoUmhpYkR3bENpcVU1ZWx3dlRVM21mTXpiVG9u?=
 =?utf-8?B?UjBZRlV6MmhXU2wwMk8rOWVSRTFwVEZYTW9oVytSNU4rN0dhQWNZM3B3NDNF?=
 =?utf-8?B?c05SbTAxZVM3TmZwSmxaNXRHZ0o4TEwyWDhaSXptNHdEeXd1dEF3MDlFcVcw?=
 =?utf-8?B?a3lFenlqTEVIUWc0WEg1M1E2OWN5MUVQRDFERmdqY241TEl0azRUQis4bDJW?=
 =?utf-8?B?K1djY0lxaThySTBMU1BRTmlZcGl2M2N5Z3Z2ekZOVkt2ckxYbEhXMlloMUhF?=
 =?utf-8?B?akM3alR6ekxieDIrVUpsWXpjSG8yMXNJdm1QMTlMRTZnVW9IV1ViL3dZWStW?=
 =?utf-8?B?WXFUS0R6eERUVU9QVEY1NFlhY043WVZhV1pRRGJwSVNZdTF2TFV5Y2M5TlZD?=
 =?utf-8?B?dlhYbVlNa0FyWnJDMGxuZ1l1TUtVNjRGU3RPeHdQTUl0RVd0V3ZiWEl3azlK?=
 =?utf-8?B?eXdYdzZQMm5iR3BqeUk2aGVvMFk5UkVDVWFPSTVPM3Y5aUxjRmtMN3ZNMDY1?=
 =?utf-8?B?Q3lhSC9HVWV3SHFhQnpUYnhQaUVoZlBOTlpDNTNPSHM3OGxtMVB5ZlA4MzBv?=
 =?utf-8?B?cHh5dGhERFVzQVZhK1kxZ1plSWd4WE4wUEJGWU5SZzVqWitNdVlmM1dhSDFO?=
 =?utf-8?B?WVBTMExlVGp6YXAyRlZhSkVWQzU4Y1dXTGt0WFVScWtZQ1lLNWR4VW5HN21M?=
 =?utf-8?B?Wi9MOGp5enQ5SXpjQVYzTTlpT3ZVeDkrMG55MzRWNUQrUzNLRmtPL2wwMS9J?=
 =?utf-8?B?SGJrdWFRTG9FM2ZTM2hUQVlYMGZXeFZKbW9XSkhrYTRRbEVIVUVjUzFYYlJu?=
 =?utf-8?B?MHM3Q21PbjdKcjJsU1ZzNEt6dEZqY0dHUERaWHgxSnRVZkV1T1U1UEZzNGJE?=
 =?utf-8?B?MkJaeFM2Q1lOSm5NbU84b3EwU0lheUNseVErQ0J3S29jUkpXOUdBREpBcWsz?=
 =?utf-8?B?NUtJZy9HNU5vN0pSeWE4R3hlbUpyNlREanNqajZHSkJiUnVUUUhjY1JkTGlI?=
 =?utf-8?B?Q3F5TWc4UjlLRlRjRG1zNmJPQlV4QTM1MVo4UkhNL0hLM3BHMHQ2UFgxV24w?=
 =?utf-8?B?N2FURDY5eEtoZ3lZR2M5WkFTb0JaTU42cm0vRkpnbWMzOEM3R2w3NVRhK2lW?=
 =?utf-8?B?NzhZMlFTelc1ZGRQN0xlWjB6NzBKQlo2YnZySk9KS1Z6QXJRcnFZWmRPYUxB?=
 =?utf-8?B?ZytRYTNLRGYvM0tueFE0NUxBN0d5cTNCOVBobHpLaWhaSWZuaGVZRkV3cWxk?=
 =?utf-8?B?TENwYW92bzBYQ2VqaTI3RXVjWWZPZVVId2xDYy8yeExoK1YwbWJhazE2QlF6?=
 =?utf-8?B?WEwxNVNWQmRHOE9KQkVWeGg1cjk3cGtYKzBwM0JnWHV6TnlEYll0UVZ5ZWpU?=
 =?utf-8?B?QW5uaitxRElFdEZteGhTYVZXYkxHeXB0cm1FQXljaFBMQ2Z3YTN2eGlIcXhD?=
 =?utf-8?Q?5e08xMoSpNQcElkdlJsdnbUmbNSKQs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TWJrV21MZUQ2aG5RM3RaRmlCZGlKWFhsZ1ovbVdIYXFDOFRRcStBSitNMkRR?=
 =?utf-8?B?SWpCbm9hdkhjaDVjVFlZWXBqM1Y1dk5uNFVCVVV5M0grNEZPKzRaZWE4YitZ?=
 =?utf-8?B?MWRiallHYXZpeTFpaEtKbVJXWEViaHVJenNHRnJJRGRpQW9UVWdzeU5YQ2Ey?=
 =?utf-8?B?cGhBWUlueTJpM0MyNHNHcFVOTkJnMjczQ1g5RVNqOVVtUXFoL2R4b0tSbXNP?=
 =?utf-8?B?WVFUcE9leXB4OGdadFM3dTZxOEpSemlCOFRWVWdUODBSbkdMOXd3cWVyOC9Q?=
 =?utf-8?B?a3g2Z241bnRwamhmZ0podUJhYjVacFJhS09hNUdKS2ZiZUpIS0Rtb3F4ejVF?=
 =?utf-8?B?eUV0WDFjblJhQUEvTGwreVVnNTQ1N29UVEpHdWQ1VjBxTXRJWkdlTGhWczFt?=
 =?utf-8?B?VXlhUDk0b3QxOU1UWCtGSW1CTGdpUDdaVzZxSFhUVTUvdGVWc1BKR0R6Nmxv?=
 =?utf-8?B?TTR6STlTTXlxTjU0Qk9pRDJIUzVxYS82U0JRbGFmcFl6Qm45UHJJaGVvczZq?=
 =?utf-8?B?QWJqenZWdWtNYUNFNm9hcTVPR3Q0anBCUUl6ZGFsY201MzRqSERFWmlac2Ew?=
 =?utf-8?B?WTBndU55RjRzRjI0NmJRNnZCUy9oVVZvd1BKNFcxNVhPbnJoUThLNXF1b1VW?=
 =?utf-8?B?WVF3RzNUZndIL1UzcWpEaU1rUEVtdDlOTXNyem40eE9CZFVtL05mRExISDZF?=
 =?utf-8?B?UW5JNVlqTEJteUhrTmRhMEtONm9NRUF3b2ZQVjU4aThJdG4rMnJDZWRvTmFG?=
 =?utf-8?B?ZTU3ZHRpayswN0xsdTlJajF0cFZWSWhwb0M4UHh3YWNDL0RjSFl6Z0RDM2xp?=
 =?utf-8?B?TTJFMmN6UWdZTG16OVZkeHI1RTlXNC9IMTRCSnNiR0xBNEl1N056SkV3OFVp?=
 =?utf-8?B?dEVMczhTN3BRenlwakV2ZGZRODgxMmNtQ3pNMS80aU8wS25EOGgrQzh2c0p3?=
 =?utf-8?B?azdFQUIyWHZnanhTOGRxWmtjZEZERnB0N2RXOE9Oc0NvYWpKWWZtRkdTbm5t?=
 =?utf-8?B?eWRxWlBvSkNSTjhiaS82R0RZZ2dXM1p5QW1LU215eFhNNnpYNXM5V3IvcGhD?=
 =?utf-8?B?WFFhNFFiSkpsS0lNNTlwRzhSeXJkY3dla044VTEvZC9JTmVPd2FtKzNSTUZi?=
 =?utf-8?B?RGc4NXIyTHpxcllhY3VkUkJqSGU4SXVEUHgrRzJQZkY0ekR2NHhrVzRXWGRM?=
 =?utf-8?B?V0Y0dFVmV21EeTZHd1JVdnd3aW5UME9WS042eGtYLzNsZU9TOGVDMzBYVDVY?=
 =?utf-8?B?NnNxS2VEcDR5QmpobHJTT1N1VXFUellPTnYvQXRwcXIzeGMvMUsrUXU1dWNW?=
 =?utf-8?B?STlTcVRYVytBUndPZm1qUDdYb2tTblRLV011bnpKdUZmS2lhNzNlMHNxS1F4?=
 =?utf-8?B?dGsvQUpLVDJwdy9TVVVtZ1ZZME1BNEJKUDYzYjM0ek9XeTB6clBOZDE3QVVr?=
 =?utf-8?B?SkxtcG5semNJeHVDc1U5Ujl0ZSt6NzhoOURCTUNMRXN4d2FSRTFxL1RManZQ?=
 =?utf-8?B?b3g3ams2L3JNVGZ3NUMwb0hmWnJock04dklxR21iUFllekJJemMvWWZnTzZ1?=
 =?utf-8?B?UUlIMEZTdnJwYTRoQSsvWmN4OTNMNzJ1UVd1MDR0ZDR1bCtZWmM2aTNXbldZ?=
 =?utf-8?B?aWphV2JnQ3NkckpFWXNIUndSaEY5NTQvdlk2RWdtalgra1owVHVxTytlMmVK?=
 =?utf-8?B?dUVOVWdCSngwQUY2UmpmSGp5ekdOZThZdHdUMlBvM2xsUHB3RTZ2eU50UW1Z?=
 =?utf-8?B?cHBIUTNnYnV1QkhKR2tBenYxS2lGWVpDVmFnbFBHajF5a0xiWk56T0JCL0ZK?=
 =?utf-8?B?TURlRHBQa2kxWElQYzRtMkNLZE5DcjhJeTA1NXpWTmZ5S2JWSFk0RERpV0tx?=
 =?utf-8?B?VDhGZXpUTU9xZzlrdjNsVUUyQko3ZkJnV2pqOEtJTjBzaFhnRUVPODEra2xw?=
 =?utf-8?B?QVo5SVFSdmo4b3dwSVZWYlRJZTlzU1dyeVJiZEFVYXpsNnNCU2p2VlgzMlhs?=
 =?utf-8?B?Ris2RjdNYitMR08xVys2STRrdVo0YTlyNU9HSVZwUnVUS0R3cUJERmhaanBO?=
 =?utf-8?B?WXdaRncraFJHOGpLUEtYWlhHR1VzMk4yWW9ET3dEbkdhWTFJUVlrNU1SV0lD?=
 =?utf-8?Q?xPoQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3386db10-f000-497e-d29c-08ddf97c9bd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 02:06:14.2019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PIu/lz2POzzlGCJHz0LL28RUbBoMlCCbKx3VwnG4bG9fXlHQ/6qcc86wDkfpDQL00bIBx5u85JG+6PYQUxyANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10640

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDIyLCAyMDI1IDY6
MjggQU0NCj4gVG86IEcuTi4gWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gQ2M6IE1hdXJv
IENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgUm9iIEhlcnJpbmcNCj4gPHJv
YmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47
IENvbm9yIERvb2xleQ0KPiA8Y29ub3IrZHRAa2VybmVsLm9yZz47IFNoYXduIEd1byA8c2hhd25n
dW9Aa2VybmVsLm9yZz47IFNhc2NoYSBIYXVlcg0KPiA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47
IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJp
byBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBGcmFuayBMaQ0KPiA8ZnJhbmsubGlAbnhw
LmNvbT47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7DQo+IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDog
W0VYVF0gUmU6IFtQQVRDSCB2MiA1LzVdIG1lZGlhOiBueHA6IGlteDgtaXNpOiBBZGQgSVNJIHN1
cHBvcnQgZm9yDQo+IGkuTVg5MQ0KPiANCj4gQ2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5hbCBl
bWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5nIGxpbmtzIG9yDQo+IG9wZW5pbmcg
YXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0aGUg
J1JlcG9ydCB0aGlzDQo+IGVtYWlsJyBidXR0b24NCj4gDQo+IA0KPiBIaSBHdW9uaXUsDQo+IA0K
PiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIEZyaSwgU2VwIDA1LCAyMDI1IGF0
IDAyOjU2OjAyUE0gKzA4MDAsIEd1b25pdSBaaG91IHdyb3RlOg0KPiA+IFRoZSBJU0kgbW9kdWxl
IG9uIGkuTVg5MSBpbXBsZW1lbnRzIG9ubHkgb25lIGNoYW5uZWwgYW5kIG9uZSBwYXJhbGxlbA0K
PiA+IGNhbWVyYSBpbnB1dC4gQXMgbm8gaW5wdXQgc291cmNlIHNlbGVjdGlvbiBpcyByZXF1aXJl
ZCwgZ2Fza2V0IG9wcyBhcmUNCj4gPiB1bm5lY2Vzc2FyeS4NCj4gPg0KPiA+IFJldmlld2VkLWJ5
OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW9uaXUg
WmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5jIHwgMTIgKysrKysrKysrKysrDQo+
ID4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5oIHwg
IDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1j
b3JlLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNp
LWNvcmUuYw0KPiA+IGluZGV4DQo+ID4NCj4gMDE1NWM3NTk4M2YwMmYzM2Y3ZjA2NjllNzMxODgy
MjJlYmI1ZTgxNi4uYzNkNDExZGRmNDkyZWIyN2IzNzI3NjNjDQo+IGU1ZDMNCj4gPiA0NGE5MGM2
ZWM1MjQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1p
c2kvaW14OC1pc2ktY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAv
aW14OC1pc2kvaW14OC1pc2ktY29yZS5jDQo+ID4gQEAgLTM0Nyw2ICszNDcsMTcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBteGNfaXNpX3BsYXRfZGF0YQ0KPiBteGNfaW14OHVscF9kYXRhID0gew0K
PiA+ICAgICAgIC5oYXNfMzZiaXRfZG1hICAgICAgICAgID0gZmFsc2UsDQo+ID4gIH07DQo+ID4N
Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBteGNfaXNpX3BsYXRfZGF0YSBteGNfaW14OTFfZGF0
YSA9IHsNCj4gPiArICAgICAubW9kZWwgICAgICAgICAgICAgICAgICA9IE1YQ19JU0lfSU1YOTEs
DQo+ID4gKyAgICAgLm51bV9wb3J0cyAgICAgICAgICAgICAgPSAxLA0KPiA+ICsgICAgIC5udW1f
Y2hhbm5lbHMgICAgICAgICAgID0gMSwNCj4gPiArICAgICAucmVnX29mZnNldCAgICAgICAgICAg
ICA9IDAsDQo+ID4gKyAgICAgLmllcl9yZWcgICAgICAgICAgICAgICAgPSAmbXhjX2lteDhfaXNp
X2llcl92MiwNCj4gPiArICAgICAuc2V0X3RoZCAgICAgICAgICAgICAgICA9ICZteGNfaW14OF9p
c2lfdGhkX3YxLA0KPiA+ICsgICAgIC5idWZfYWN0aXZlX3JldmVyc2UgICAgID0gdHJ1ZSwNCj4g
PiArICAgICAuaGFzXzM2Yml0X2RtYSAgICAgICAgICA9IGZhbHNlLA0KPiA+ICt9Ow0KPiA+ICsN
Cj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBteGNfaXNpX3BsYXRfZGF0YSBteGNfaW14OTNfZGF0
YSA9IHsNCj4gPiAgICAgICAubW9kZWwgICAgICAgICAgICAgICAgICA9IE1YQ19JU0lfSU1YOTMs
DQo+ID4gICAgICAgLm51bV9wb3J0cyAgICAgICAgICAgICAgPSAxLA0KPiA+IEBAIC01NDcsNiAr
NTU4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXhjX2lzaV9vZl9tYXRj
aFtdID0NCj4gew0KPiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDhxbS1pc2kiLCAu
ZGF0YSA9ICZteGNfaW14OHFtX2RhdGEgfSwNCj4gPiAgICAgICB7IC5jb21wYXRpYmxlID0gImZz
bCxpbXg4cXhwLWlzaSIsIC5kYXRhID0gJm14Y19pbXg4cXhwX2RhdGEgfSwNCj4gPiAgICAgICB7
IC5jb21wYXRpYmxlID0gImZzbCxpbXg4dWxwLWlzaSIsIC5kYXRhID0gJm14Y19pbXg4dWxwX2Rh
dGEgfSwNCj4gPiArICAgICB7IC5jb21wYXRpYmxlID0gImZzbCxpbXg5MS1pc2kiLCAuZGF0YSA9
ICZteGNfaW14OTFfZGF0YSB9LA0KPiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDkz
LWlzaSIsIC5kYXRhID0gJm14Y19pbXg5M19kYXRhIH0sDQo+ID4gICAgICAgeyAvKiBzZW50aW5l
bCAqLyB9LA0KPiA+ICB9Ow0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L254cC9pbXg4LWlzaS9pbXg4LWlzaS1jb3JlLmgNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUuaA0KPiA+IGluZGV4DQo+ID4NCj4gZTg0YWY1
MTI3ZTRlNzkzOGU1NWUzMWI3MDYzYmVlNWUyY2Q0Y2IxMS4uM2NiZDM1MzA1YWYwZjgwMjZjNGY3
NmI1DQo+IGViNWQNCj4gPiAwODY0ZjhlMzZkYzMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5oDQo+ID4gKysrIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5oDQo+ID4gQEAg
LTE2MCw2ICsxNjAsNyBAQCBlbnVtIG1vZGVsIHsNCj4gPiAgICAgICBNWENfSVNJX0lNWDhRTSwN
Cj4gPiAgICAgICBNWENfSVNJX0lNWDhRWFAsDQo+ID4gICAgICAgTVhDX0lTSV9JTVg4VUxQLA0K
PiA+ICsgICAgIE1YQ19JU0lfSU1YOTEsDQo+ID4gICAgICAgTVhDX0lTSV9JTVg5MywNCj4gPiAg
fTsNCj4gDQo+IFRoZSBtb2RlbCBmaWVsZCBpcyB1bnVzZWQsIHNob3VsZCB3ZSBkcm9wIGl0ID8g
VGhhdCdzIGEgY2FuZGlkYXRlIGZvciBhIHNlcGFyYXRlDQo+IHBhdGNoLCBmb3IgdGhpcyBwYXRj
aA0KDQpBZ3JlZS4NCg0KPiANCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gDQo+ID4NCj4gDQo+IC0tDQo+IFJlZ2Fy
ZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=

