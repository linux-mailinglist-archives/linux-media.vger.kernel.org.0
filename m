Return-Path: <linux-media+bounces-29198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F5AA789AE
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 10:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14A4F1893E39
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 08:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6086F23496B;
	Wed,  2 Apr 2025 08:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tDtWp7J7"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4654416BE17;
	Wed,  2 Apr 2025 08:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582006; cv=fail; b=g64R4/ho/luMTS75Y1oftBV06IIeKc26rxtfC2NYNszTttJ/JfyNkbWx+LtiixWlAzvxKYQEVoV4Wtqjq6Mrv4R1kzXXWOOLIECRhke+JyC3cbpyRpjmMQrDWz92HGqp9M6KQkJdnw0WRd6XYAHB5PzC6F8D9AFY6KWxGIa0/EA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582006; c=relaxed/simple;
	bh=WkA37zravIBDY6Vw7CLG4URHCcOHH1WoDCx4gcjhrMk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pLPF+BzDIFKQMAd6fNp9saTFFb+iSZcfbenn1M6fokf4WxoJ50vEax5mV5VxXwfT6mLcQ42J/4bxA+1YXedVIHwm1TUeKYO99dXDCnZgwzXBDqHmkJFbfkK9sd0cxIkDaJ0+zuAwabSYKYVgEmcjiJao5QhxPzcYkpbqwI8myr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tDtWp7J7; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHW7TF8urROSkJlir0kiGy8R3yGtvZEA1Gi/9NOo97pU2TW4UA144FlJr4BVLDg0Vb9not4t+ENg8JPdA+4X+Fsw6aJ4R1+TRtHDnn2E4CnPkOFLxoN12d01IXX99CAXUYnzsNkmrYeeYQh0yrWNrmRL2SObMhzNN/YDytNDCSlt+a7hWZGCjch9dA1Oh0Xf/fxk0AiuVCNCOZnHo2uJtYpi3S/ma7m8eq2JT/SXFn9Q0R6cZKbwRbObwzOvGN8TSHF6RvJVGKIa7PY0oZvQbags8JgNXmH1hOJRYYQjqvJI3acW8xFp8eNS46ddJ82kNKVlWE0nkesSZzVbqBmvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkA37zravIBDY6Vw7CLG4URHCcOHH1WoDCx4gcjhrMk=;
 b=QuodbZ0dWNEhAw7CMMwqdyUX2aWalaMGoBtN4jZNR2KO5cvAxBeJS2epo4ocnONkqrrYloSQZSqt5wqtl4FW8HC+hvmW71INJ8JdEtbPY9emLrsc/N2DwEW4DenEJzmufUNlSAPNzOzvkpkPzagSDtzH6Nl23pizDv4H2dBXhWiIA6Lef28Q/XwNAaEa8NbN0DEwr/mHn639CmHTuaCWvfzKjnMk+JoUW3hSmZkuNdKu/4EdGj1DbHGYWBv0Bwa3LSn4V3mc+aagR38BxiSDt//OrXqb4QZV5HCbtlbwG61t4WAOUO0JYoFB5JbVrzc5DcexEppCJFouo+WxDGW7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkA37zravIBDY6Vw7CLG4URHCcOHH1WoDCx4gcjhrMk=;
 b=tDtWp7J7SgATOWudyUVVars0lOa7ePg/wzJEAzjNmOm6jGKTCcYtevJGAiqQLWNsiKjPm2dddvYy62wLvdThxhLaIoDhR2ptJAlFCnGQWvpwTPlQnBZepx9Ti+5T9PnIbHWnusyctzvp9s/HkpQRPa1B/75X+9GQofc9eOB6XwA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB14289.jpnprd01.prod.outlook.com (2603:1096:604:35f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Wed, 2 Apr
 2025 08:19:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 08:19:54 +0000
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
Thread-Index: AQHboAdhMLT6c7RZOkyzH0oxaSH/n7OP8RdwgAAScoCAAAvKoA==
Date: Wed, 2 Apr 2025 08:19:54 +0000
Message-ID:
 <TY3PR01MB113462DC897E0DB681B1C020F86AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
 <20250328173032.423322-12-tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB11346ECE31CB6C8DC33459C2486AF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sJQnyJb_uq9yEcjHRW7ZFOw3g2XQyygcozWTgMjrYxRQ@mail.gmail.com>
In-Reply-To:
 <CA+V-a8sJQnyJb_uq9yEcjHRW7ZFOw3g2XQyygcozWTgMjrYxRQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB14289:EE_
x-ms-office365-filtering-correlation-id: a39e6b38-ff22-436c-06ad-08dd71bf25af
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bjhjNS9iUnVTWDMvRGRTcGxsMWlqY0hWTHd0VjluMndtQzFVZHN1NGJpNmF2?=
 =?utf-8?B?ajB5TDkreGNLY0MwWHg1djQyNG1aMGlpMEZHdHpMMUdZQ3FyUWlMQ1dsMUhr?=
 =?utf-8?B?Rmo0aVhlOEtqdmdSdjAyVFNMMFpaS0dXb1RmY0FYaUhFSTU0cm82VXNGOGR5?=
 =?utf-8?B?M1pnbXZvdEdFeWFwZTVXUmVwUUY1cnN1b2ZYcUMvZWdvdXRlMVVGTUp1TlRE?=
 =?utf-8?B?aElaRTFQYm5JT0dnUUdzZGI5VXFCZEpicDRqSW41Z2k5TDNtd2d3TkZ5cWNY?=
 =?utf-8?B?eXZ4SGdaK0F4UnhoSHRKNTdicUF1N1FOWVhtR1o3aThlczB5a3dLSVh0enpq?=
 =?utf-8?B?R1JqRURMVlEyQ2J1UEo1YjhzczFseTllc2MzRVJnZGZLVHZFZVM2bC9iQ0g1?=
 =?utf-8?B?UTVQanpVZjcwei94T1FobldkUU5XWVBTYlFEcnBlUTE1bWFSZUZ6R3NlY0ho?=
 =?utf-8?B?SEsyZ3UxclFlczUxVi80NWlWaVViV1dYYVhiUEtpNnhtMFZsVlBsNm5UcVlD?=
 =?utf-8?B?WkdxUzFGbVpqTjNDR0Jla21MbSsraGFlK2MrUHNyYmgxYjJtRDNWTnc2YTNM?=
 =?utf-8?B?VmRRYWtHSjhlL0dwaVNOWHZtV1ZhSmVHTktZQVdCSHZKU3ZwbytmRjRjSmcw?=
 =?utf-8?B?SmZTUk52T28yS3FPWnVXa0t5alpRd2xDa0VSNm9jaHVDYVNFTGdSeG8wOE5W?=
 =?utf-8?B?bzc1MFBFV3lnYWdjekVoQXZWb29jSXlEZ2R1blI3OEo4WW1OQ0dlNFdpOVBa?=
 =?utf-8?B?b3BmdStZcGdhdXF2Nmx5YnRRamhnSWJOTXBNalVnNWVPemk5VHc2UFZPMkdj?=
 =?utf-8?B?RXVNQVFVV3ZkK1B1TWxFQUFxL2JmcVEyUjhVMzBSYm94SkVEKytxWTlZS0NJ?=
 =?utf-8?B?RCtNRnpBUWxsNkF5ODFMQVFZWnorNExuSkFFQXlRMWJzU0JoRGJRWlFPU0VC?=
 =?utf-8?B?c3llWjNyNGFnclZ6MUJoMkJ6TER3Q2pXOVJoUDYzazc2cFlWdGlidXc1RkNQ?=
 =?utf-8?B?M2ljRmRaSEVNVi9VdjV4SDhRTVo3aDNmOHNyeDl2dS8rc3NvbHRndzZvbHI1?=
 =?utf-8?B?LzNCaTU2bmNEM1daQ2J3U1BPSGlaZVp1RFVPbHU0RGludU5oUFVCbE9YK2JJ?=
 =?utf-8?B?NmIveDBuTXlsMnB3TVdyUW44MzFraS9EVmU1VDNPVmhtcGthUmFWNi9Tbm9O?=
 =?utf-8?B?Ni9PNTM3TTJkbTFsTHVBWXBYMGdXdWZmK04vNU1uUk9XQytLeHhMKzBXTEt4?=
 =?utf-8?B?TXFidjV1aTNQaGNwZGNXYUJUa3ZYOEJobXltMnpkQkpoWjZ4cDFmNjRPZ1NB?=
 =?utf-8?B?aVBFZlh3SktSL0RJQjNNLzFJalEzSElnV0R5ZGZsY3F2cHpOeENHV2loRndD?=
 =?utf-8?B?U1VpcnlQZ0dpNFd0bzI3ajVsb0lMdDdLbTFVMis0T3RCSDFKZlI1TFdjSFRp?=
 =?utf-8?B?bVM0QkRtYmlIM2tlQjJzV2F4VzRxM0xWZnJENkxPN0Rhd1g4bGNNUWpZNWJk?=
 =?utf-8?B?eFNDNmQrdWliU3ZyN3E5QzFKTjM5aEE5VlM2bkM2a280TkNHRUlJUCtsRlo3?=
 =?utf-8?B?UjdHVTIvcHh0cERNTHRMUG9CR0Ryak1ZbjVyaThTQ2l4Qkd4L09XNHZPQm9a?=
 =?utf-8?B?ZEF4YUZ4OXp3eklBOEozdjFjMU5pUGFtcWw1NlRWZEpxS2ZvSU9Cbm9ndWIx?=
 =?utf-8?B?WCtYcVhabVZvOHYwK2pqejFkR3ZQL0dkWWQ2SUZQOVVaTXFMQzViS3pBQ3Nl?=
 =?utf-8?B?VkIrTnZyYVpMYlI3WUE0a3hLQ1hveGFrQUF5eXUveVdpaEVUSXV1MHhjY3hQ?=
 =?utf-8?B?RlQvT1VIczYwenhZcytVZHU2VlgrMnkvM25RZkZxWElKOSt4TFZ4clpmeVNu?=
 =?utf-8?B?eUJYZDE2bVYzdHMxSGxIMjdORWNxckxWRm9keGlTTDNlc0tJa2NNR1dBSjJ1?=
 =?utf-8?Q?1gfKjSs1m8sCcYJQBdQ93u5raJUUXNGa?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QSs5UzlLYlFUcEpEU1hEVE9kdzhoRy9uZERsOUowb0V1UGNoZXBicEcrVUsy?=
 =?utf-8?B?WG5EUHZNUWNnc1NqU29ValAzb0hZS3JRVEQvVWJNRHJXVjh1NzRVMnloMFFt?=
 =?utf-8?B?YWdxNDRWOG02YU5uaVJGbEd4UlpRNVFzR2xLOVRMcTk4dytYWW5Eang5YTZk?=
 =?utf-8?B?cTUvVHZNKzlCQlU5T29GazA2T21qWmFibHdpK2FXaVVKSEY5NHc3QTNqVUFn?=
 =?utf-8?B?bXdOdms2eHVhdUxEVkg0NU92L2dVYzVKWFdqdUM1a1NjeHRHY01YNFVqbGhp?=
 =?utf-8?B?dndSTWRYdUx2dnNseTJ2WGxIRlZLUTQ1b3BJbGpsdkZUREc3N2hHOFk0STIx?=
 =?utf-8?B?UW54ekFnczVndmtkL0NVc2M0YmRvM3ZaZ3V4b3h0U2l1UDR4TDVIZjRDQ1dr?=
 =?utf-8?B?eTc0dHZvWWE4UVZGSjNDWE94SzJSOTZSWklXM2k0LzVCQ293QWxFMldlbUln?=
 =?utf-8?B?U2puRUJXMWd3cjU3cm5xdk1JaDlndFJIMXFNaEc0QUJLSGx6YWdUdG5QRW9B?=
 =?utf-8?B?MDZJaExQR1ppRjZJM3p4c05YNXhLTUY2cnAyQ2czQlJoVjRPcmdqQlNFQmwr?=
 =?utf-8?B?cm5SLzhiOVBkdWVoV2tjSnl0RlE4S1BDbTh0bnRKdVJ6MnBGdnk2VmF0QTFr?=
 =?utf-8?B?NnJZQmlDTUZYd3Q5UlkwQW1zU2c0ZlVtcllLZnpzZjE0QjhvbGJKcmdSWXVk?=
 =?utf-8?B?VitNcEp4TU0ra1JCVUU4MHpHdXJwbmQydkR0OGljc2hEMzROeXhPeUNKUnEr?=
 =?utf-8?B?S1hZa2o0MjBScjF5Q0VYWTJnczczRGtUT0NkWUE1aFJXUno4eFl0cHc5d3Ri?=
 =?utf-8?B?SzFRYzBUWnI1bzFrc3gwQ1lEM2lqZ3d0cXIrOFBlS3lQTjlSbERGY0xKUVhh?=
 =?utf-8?B?bEVadjY0TUsyS3RTRHJaZkloQ0c5Rll5amRBTFp6TVdCVmtoZVI0UjVycENm?=
 =?utf-8?B?VjhQS0VBWm1pck4rN3NGY0tYR0tjcDVvWlF6SWF1RnlSMXIydld1dkkzcE5F?=
 =?utf-8?B?UzA4UUJyZ2VVQUdCRGZXWEtsQ1NRYndycU4yZGd6cWJLMWkvazB6bkdQMlRH?=
 =?utf-8?B?N2ZDL1N2NFRWMVovRkl4OGVZbXgzZTE4NDRXTjAycnZoQzRZVVBNZmdXSUtZ?=
 =?utf-8?B?czh4T09IZk1EdUR2ZkEyYU1LVk02MElpNDE2c3A0UStJRXhWNkJ2alF6VlpO?=
 =?utf-8?B?MDU4eDlhVnBQTnZWQjczbFdGZ1dpeWs1VkVXeGZVcTF1cGp0a1N2dUNTM2ti?=
 =?utf-8?B?UzdUVnVCeVpUZVQ2MUg1TXNiV0NZNVhzc2NCdWxWbHZXeUFybUVQSXFuVzdV?=
 =?utf-8?B?OEQwTlNsbUE2c0lVSVc4QkJPYUY2aUhxNHhsREdmbUFucW5MZ0p6UEJiemZj?=
 =?utf-8?B?TXJ3U0RpZU94aHRQbmJiODgrQ0RweXZ0emhVQjZzaVBLUzJQRW5sQTBtZXhI?=
 =?utf-8?B?RklmZlpWTEp6ajBpOUJtdkNKWWxEa2hvUC95UG0rZ1ErcnBKT3o5bDdGcFhu?=
 =?utf-8?B?aG9NcjRyeWJWZHo3eHZ2c2dwZDM5VHNZNnk0L25GR2gvUnNnQlRvalpvLy9M?=
 =?utf-8?B?cDYya1JVc3J6d0dpeDdXNk9SSDYrOCt2ZE1iS0dwSzBNdkhTSnQ5V3ZCdkVP?=
 =?utf-8?B?M3F0VU5FRXJ3elRXWUhFZERSWTdFcktZUzNDdDUwQU1CNFpObmRHSlRQclJB?=
 =?utf-8?B?YVVRMU9SUUlaaDdYckUvajNWZ3h3SndjbmZocVlrQnlZN0o3ZVhHbkVRcGlI?=
 =?utf-8?B?cnN6S1l3NWZDV1hXVnRFSXdCcTZVNThSYkI1RUVwSlF2NXcxb01wa2RPdHZV?=
 =?utf-8?B?SjZWcUsrYTBvaEZmR1IyOS9sM3NpMFNyYnM3YVNwVGxKRkMrYzNmTGhtdjU2?=
 =?utf-8?B?NEwxTnVpNGkyK1JZeTlCbDh6N1h6WkZ1RTBxUU1DYWQrdnc4QzN4Wnd4Nkk3?=
 =?utf-8?B?VkFUT3RwaUE0R1FnMUMrQTZmdlFpcVdRc0dpQlo5MUNJVFBtNERtZGM5R05S?=
 =?utf-8?B?bHAyRnpZSGM3TTMrcWxuRzFuNVRmRUp3L2VaOEdteGdCUktzbnRBZFJlTkJU?=
 =?utf-8?B?M2YxTjRma2FuSk1VelpkcXhKbWpvMDBkcVZQZFY3anR5U2VIQVkxRUtub3Bz?=
 =?utf-8?B?dGlhTkNWQlJKRmcyQ1FGQmxLQ3B1TEIxSk1pZm1YRFUzWThGR3Y0cEhnR3dn?=
 =?utf-8?B?T2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a39e6b38-ff22-436c-06ad-08dd71bf25af
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 08:19:54.0803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xhX2JersW22KOi+g+9wpAYT10e/0DWQFbkjjtTxZpV2Dz44Yw0Ums2VCGFsvXKZbD2vJwcfLLPUj6mmEi6qtocT8C1xpuanUYZvqXid04eE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14289

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMDIgQXBy
aWwgMjAyNSAwODozNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDExLzE3XSBtZWRpYTogcnpn
MmwtY3J1OiBBZGQgcmVnaXN0ZXIgbWFwcGluZyBzdXBwb3J0DQo+IA0KPiBIaSBCaWp1LA0KPiAN
Cj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KPiANCj4gT24gV2VkLCBBcHIgMiwgMjAyNSBh
dCA3OjMx4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToN
Cj4gPg0KPiA+IEhpIFRvbW1hc28sDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4NCj4g
Pg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFRvbW1hc28g
TWVyY2lhaSA8dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gU2VudDog
MjggTWFyY2ggMjAyNSAxNzozMA0KPiA+ID4gU3ViamVjdDogW1BBVENIIHY1IDExLzE3XSBtZWRp
YTogcnpnMmwtY3J1OiBBZGQgcmVnaXN0ZXIgbWFwcGluZw0KPiA+ID4gc3VwcG9ydA0KPiA+ID4N
Cj4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBQcmVwYXJlIGZvciBhZGRpbmcgc3VwcG9ydCBmb3Ig
UlovRzNFIGFuZCBSWi9WMkhQIFNvQ3MsIHdoaWNoIGhhdmUgYQ0KPiA+ID4gQ1JVLUlQIHRoYXQg
aXMgbW9zdGx5IGlkZW50aWNhbCB0byBSWi9HMkwgYnV0IHdpdGggZGlmZmVyZW50DQo+ID4gPiBy
ZWdpc3RlciBvZmZzZXRzIGFuZCBhZGRpdGlvbmFsIHJlZ2lzdGVycy4gSW50cm9kdWNlIGEgZmxl
eGlibGUgcmVnaXN0ZXIgbWFwcGluZyBtZWNoYW5pc20gdG8NCj4gaGFuZGxlIHRoZXNlIHZhcmlh
dGlvbnMuDQo+ID4gPg0KPiA+ID4gRGVmaW5lIHRoZSBgcnpnMmxfY3J1X2luZm9gIHN0cnVjdHVy
ZSB0byBzdG9yZSByZWdpc3RlciBtYXBwaW5ncyBhbmQNCj4gPiA+IHBhc3MgaXQgYXMgcGFydCBv
ZiB0aGUgT0YgbWF0Y2ggZGF0YS4gVXBkYXRlIHRoZSByZWFkL3dyaXRlDQo+ID4gPiBmdW5jdGlv
bnMgdG8gY2hlY2sgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIGFuZCB1c2UgaW5kZXhlZCByZWdpc3Rl
ciBvZmZzZXRzIGZyb20gYHJ6ZzJsX2NydV9pbmZvYCwNCj4gZW5zdXJpbmcgY29tcGF0aWJpbGl0
eSBhY3Jvc3MgZGlmZmVyZW50IFNvQyB2YXJpYW50cy4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBMYWQgUHJhYmhha2FyDQo+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJl
bmVzYXMuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogVG9tbWFzbyBNZXJjaWFpIDx0b21tYXNv
Lm1lcmNpYWkueHJAYnAucmVuZXNhcy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IENoYW5nZXMgc2lu
Y2UgdjI6DQo+ID4gPiAgLSBJbXBsZW1lbnRlZCBuZXcgcnpnMmxfY3J1X3dyaXRlL3JlYWQoKSB0
aGF0IG5vdyBhcmUgY2hlY2tpbmcgb3V0LW9mLWJvdW5kDQo+ID4gPiAgICBhY2Nlc3NlcyBhcyBz
dWdnZXN0ZWQgYnkgTFBpbmNoYXJ0Lg0KPiA+ID4gIC0gRml4ZWQgQU1uTUJ4QUREUkwoKSBhbmQg
QU1uTUJ4QUREUkgoKSBhcyBzdWdnZXN0ZWQgYnkgTFBpbmNoYXJ0Lg0KPiA+ID4gIC0gVXBkYXRl
IGNvbW1pdCBib2R5DQo+ID4gPg0KPiA+ID4gQ2hhbmdlcyBzaW5jZSB2NDoNCj4gPiA+ICAtIE1h
cmsgX19yemcybF9jcnVfd3JpdGVfY29uc3RhbnQvX19yemcybF9jcnVfcmVhZF9jb25zdGFudA0K
PiA+ID4gICAgYXMgX19hbHdheXNfaW5saW5lDQo+ID4gPg0KPiA+ID4gIC4uLi9wbGF0Zm9ybS9y
ZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jb3JlLmMgICB8IDQ2ICsrKysrKysrKysrKy0NCj4gPiA+
ICAuLi4vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtY3J1LXJlZ3MuaCAgICAgICAgfCA2NiArKysr
KysrKysrLS0tLS0tLS0tDQo+ID4gPiAgLi4uL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6
ZzJsLWNydS5oICAgIHwgIDQgKysNCj4gPiA+ICAuLi4vcGxhdGZvcm0vcmVuZXNhcy9yemcybC1j
cnUvcnpnMmwtdmlkZW8uYyAgfCA1OCArKysrKysrKysrKysrKy0tDQo+ID4gPiAgNCBmaWxlcyBj
aGFuZ2VkLCAxMzkgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpn
MmwtY29yZS5jDQo+ID4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1j
cnUvcnpnMmwtY29yZS5jDQo+ID4gPiBpbmRleCBlZWQ5ZDJiZDA4NDE0Li5hYmMyYTk3OTgzM2Fh
IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJs
LWNydS9yemcybC1jb3JlLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVu
ZXNhcy9yemcybC1jcnUvcnpnMmwtY29yZS5jDQo+ID4gPiBAQCAtMjIsNiArMjIsNyBAQA0KPiA+
ID4gICNpbmNsdWRlIDxtZWRpYS92NGwyLW1jLmg+DQo+ID4gPg0KPiA+ID4gICNpbmNsdWRlICJy
emcybC1jcnUuaCINCj4gPiA+ICsjaW5jbHVkZSAicnpnMmwtY3J1LXJlZ3MuaCINCj4gPiA+DQo+
ID4gPiAgc3RhdGljIGlubGluZSBzdHJ1Y3QgcnpnMmxfY3J1X2RldiAqbm90aWZpZXJfdG9fY3J1
KHN0cnVjdA0KPiA+ID4gdjRsMl9hc3luY19ub3RpZmllciAqbikgIHsgQEAgLTI2OSw2DQo+ID4g
PiArMjcwLDkgQEAgc3RhdGljIGludCByemcybF9jcnVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gPiA+DQo+ID4gPiAgICAgICBjcnUtPmRldiA9IGRldjsNCj4gPiA+ICAg
ICAgIGNydS0+aW5mbyA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOw0KPiA+ID4gKyAg
ICAgaWYgKCFjcnUtPmluZm8pDQo+ID4gPiArICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3By
b2JlKGRldiwgLUVJTlZBTCwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIkZhaWxlZCB0byBnZXQgT0YgbWF0Y2ggZGF0YVxuIik7DQo+ID4gPg0KPiA+ID4gICAgICAg
aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCj4gPiA+ICAgICAgIGlmIChpcnEgPCAw
KQ0KPiA+ID4gQEAgLTMxNyw4ICszMjEsNDggQEAgc3RhdGljIHZvaWQgcnpnMmxfY3J1X3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4gICAgICAgcnpnMmxfY3J1X2Rt
YV91bnJlZ2lzdGVyKGNydSk7ICB9DQo+ID4gPg0KPiA+ID4gK3N0YXRpYyBjb25zdCB1MTYgcnpn
MmxfY3J1X3JlZ3NbXSA9IHsNCj4gPiA+ICsgICAgIFtDUlVuQ1RSTF0gPSAweDAsDQo+ID4gPiAr
ICAgICBbQ1JVbklFXSA9IDB4NCwNCj4gPiA+ICsgICAgIFtDUlVuSU5UU10gPSAweDgsDQo+ID4g
PiArICAgICBbQ1JVblJTVF0gPSAweGMsDQo+ID4gPiArICAgICBbQU1uTUIxQUREUkxdID0gMHgx
MDAsDQo+ID4gPiArICAgICBbQU1uTUIxQUREUkhdID0gMHgxMDQsDQo+ID4gPiArICAgICBbQU1u
TUIyQUREUkxdID0gMHgxMDgsDQo+ID4gPiArICAgICBbQU1uTUIyQUREUkhdID0gMHgxMGMsDQo+
ID4gPiArICAgICBbQU1uTUIzQUREUkxdID0gMHgxMTAsDQo+ID4gPiArICAgICBbQU1uTUIzQURE
UkhdID0gMHgxMTQsDQo+ID4gPiArICAgICBbQU1uTUI0QUREUkxdID0gMHgxMTgsDQo+ID4gPiAr
ICAgICBbQU1uTUI0QUREUkhdID0gMHgxMWMsDQo+ID4gPiArICAgICBbQU1uTUI1QUREUkxdID0g
MHgxMjAsDQo+ID4gPiArICAgICBbQU1uTUI1QUREUkhdID0gMHgxMjQsDQo+ID4gPiArICAgICBb
QU1uTUI2QUREUkxdID0gMHgxMjgsDQo+ID4gPiArICAgICBbQU1uTUI2QUREUkhdID0gMHgxMmMs
DQo+ID4gPiArICAgICBbQU1uTUI3QUREUkxdID0gMHgxMzAsDQo+ID4gPiArICAgICBbQU1uTUI3
QUREUkhdID0gMHgxMzQsDQo+ID4gPiArICAgICBbQU1uTUI4QUREUkxdID0gMHgxMzgsDQo+ID4g
PiArICAgICBbQU1uTUI4QUREUkhdID0gMHgxM2MsDQo+ID4gPiArICAgICBbQU1uTUJWQUxJRF0g
PSAweDE0OCwNCj4gPiA+ICsgICAgIFtBTW5NQlNdID0gMHgxNGMsDQo+ID4gPiArICAgICBbQU1u
QVhJQVRUUl0gPSAweDE1OCwNCj4gPiA+ICsgICAgIFtBTW5GSUZPUE5UUl0gPSAweDE2OCwNCj4g
PiA+ICsgICAgIFtBTW5BWElTVFBdID0gMHgxNzQsDQo+ID4gPiArICAgICBbQU1uQVhJU1RQQUNL
XSA9IDB4MTc4LA0KPiA+ID4gKyAgICAgW0lDbkVOXSA9IDB4MjAwLA0KPiA+ID4gKyAgICAgW0lD
bk1DXSA9IDB4MjA4LA0KPiA+ID4gKyAgICAgW0lDbk1TXSA9IDB4MjU0LA0KPiA+ID4gKyAgICAg
W0lDbkRNUl0gPSAweDI2YywNCj4gPiA+ICt9Ow0KPiA+DQo+ID4gRG8gd2UgbmVlZCBlbnVtLCBj
YW4ndCB3ZSB1c2Ugc3RydWN0IGluc3RlYWQgd2l0aCBhbGwgdGhlc2UgZW50cmllcyBpbnN0ZWFk
Pw0KPiA+DQo+IFdoYXQgYmVuZWZpdCBkbyB5b3UgZm9yZXNlZSB3aGVuIHVzaW5nIHN0cnVjdD8g
V2l0aCB0aGUgY3VycmVudCBhcHByb2FjaCBiZWluZyB1c2VkIGEgbWluaW1hbCBkaWZmIGlzDQo+
IGdlbmVyYXRlZCB3aGVuIHN3aXRjaGVkIHRvIHN0cnVjdCB0aGVyZSB3aWxsIGJlIGxvdHMgb2Yg
Y2hhbmdlcy4NCg0KVGhlIG1hcHBpbmcgaXMgY29udmluaWVudCB3aGVuIHlvdSB3YW50IHRvIGl0
ZXJhdGUgdGhyb3VnaHQgaXQuIEhlcmUsIGlmDQp5b3UganVzdCB3YW50IHRvIGFjY2VzcyB0aGUg
b2Zmc2V0IHZhbHVlIGZyb20gaXRzIG5hbWUsIGEgc3RydWN0dXJlDQpsb29rcyBtb3JlIGFwcHJv
cHJpYXRlLg0KDQpTZWUgWzFdDQoNClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtcmVuZXNhcy1zb2MvcGF0Y2gvMjAyNTAzMjYxMjIwMDMuMTIyOTc2LTE1LWJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tLw0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4gPiAr
DQo+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCByemcybF9jcnVfaW5mbyByemdsMl9jcnVfaW5m
byA9IHsNCj4gPiA+ICsgICAgIC5yZWdzID0gcnpnMmxfY3J1X3JlZ3MsDQo+ID4gPiArfTsNCj4g
Pg0KPiA+IEZvciBhIHNpbmdsZSBlbnRyeSwgd2h5IHlvdSBuZWVkIHN0cnVjdD8NCj4gPg0KPiBU
aGlzIHN0cnVjdCB3aWxsIGdyb3cgZnVydGhlciwgc2VlIHRoZSBsYXRlciBwYXRjaGVzLg0KPiAN
Cj4gQ2hlZXJzLA0KPiBQcmFiaGFrYXINCg==

