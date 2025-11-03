Return-Path: <linux-media+bounces-46175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 211A6C2A21C
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 07:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 13D744E86DC
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 06:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D9428D8DB;
	Mon,  3 Nov 2025 06:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rOkBxS1i"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F4C1D7E31;
	Mon,  3 Nov 2025 06:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762149720; cv=fail; b=GkZq5fspSB4h1ZHFM65Rtg3NgJi+olNJqCkFzvjdxctoTg0M5KDZHnLwWAYF+mYuxPy+A9CqP+FGBuzGBqcEmZpYTe4SubrdIRCNfNN4TutFwATDAVZeX/t/vG73NFYManPIS/1SI5wGyrLvfveJ19zLORHj+ux+zBBlYvIsJ/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762149720; c=relaxed/simple;
	bh=v32zDOtAMX5eKR2xaEEkQ5TWDCkjWO1hLCGiw6OZ5gQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f2s4JQTItAGH2xW2urBlkWt02to8I5F/fBQ4rumabrdA420aONGEkTqpYJgZQGsfCOXHgHYUrvLpCZahgnpxBe0ayV0stPktqpf8xbZU2G/AEOgS/3SjDb7OeAKeDg2KyuqYCafhUVdV9tV4rdVcaChDpJOlR9RjpX3EQzsYFAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rOkBxS1i; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwRtjHaJmh6uBqYfsQcDS140e0C4I3q50ajqtGjoAr+ri2xNQA7p2y7hsT5aimL7ZZgVg4P0ddJP7XbbRrMMolPe4z/DwxUv8382y9eIkPwUI4x9BBaNalP69fejxSdkVGsvKD20B+QDKVgaBDmulmtN2kwKo3wgjYVPdUaOw3JhIuVXGAKmbxJUFyQD4ptqrEkMJx/PBLS9MQvidoRgE/HgOQ2sy/Oj/z7GhipOSD5IMMTh8NWMH5ePgpRUgR+XMwEwve1g81NE7h4mYiNMB9M9qQvZuBBszjWjULxmFvGfQ0eWbFhrEhuhUmgl1GG8WDE+HBJldp8H9EyQyrMv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v32zDOtAMX5eKR2xaEEkQ5TWDCkjWO1hLCGiw6OZ5gQ=;
 b=AOLh1pq38XJ7QWMTpjS/oYhu5VXz7z1yFeokN/43h5sb4bnjEkjZCTs3wxjQkwcZ6gi5db3zoNFVhLY75O/ASLtMZh0kngA2T2RKyDOCnptbi4+isW3M5A3uVZJwbi58JXprPRwlAs2/BNlv/tVrhAvmG1Ci3edM4xD+UsFKz2/xYBoENOhYE2gdmOSjzCl81jUgRpt7JIUiT4+/5Pb6p+Ayao68VvTmvFW5wVErYXBZWwy3LfD3HoSA1UD9oj3K7F1KbbzFz6a6rBcHa1oRkqTB0DAr3wGJufuAP7C7toC4dMRiy2KvEDNo1bFlFQ/sP4qC69aW6IbM7pwv9wt4wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v32zDOtAMX5eKR2xaEEkQ5TWDCkjWO1hLCGiw6OZ5gQ=;
 b=rOkBxS1ihyWrZv9bLByOn57v2U5OUiNRJAkJLHO9ZeDw5CcgtQU2gra8bAVrIQK306P/1iJmIeHtklZtIAFMwOz37sKDDa9V4xj9jKpgLdeB9GNNtjcNKUM2IOcJoCtlbCdaZnm/eXALduQ7MMEC44rfbGfDR23w6aR6iNi049BnSMXb9F6ElhGuhpXhTwzUFVS7oC9Eeq0mLptvFlUDyZVvRGP4kmRTbgBI7qXN7n4C0ggVenz+x4puEe1LSPFIuScCboYXFEdnhVQGVMceZnlYt1TosO7iJtKWowpUVLEi5Z8nSLTtziQHG7RiGywlFtSLn8gv9WXaVcOZCs5yTw==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAWPR04MB11551.eurprd04.prod.outlook.com (2603:10a6:102:509::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Mon, 3 Nov
 2025 06:01:54 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 06:01:54 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank Li
	<frank.li@nxp.com>
CC: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "G.N. Zhou" <guoniu.zhou@nxp.com>
Subject: RE: [PATCH 2/3] media: nxp: imx8-isi: Keep the default value for
 BLANK_PXL field
Thread-Topic: [PATCH 2/3] media: nxp: imx8-isi: Keep the default value for
 BLANK_PXL field
Thread-Index: AQHcTIda2+14ltIZhU+4VWxxtDw1BA==
Date: Mon, 3 Nov 2025 06:01:53 +0000
Message-ID:
 <AS8PR04MB9080F441E168EFB3CE224C19FAC7A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
 <20251024-isi_imx95-v1-2-3ad1af7c3d61@nxp.com>
 <aPuCHltyz9Ed7wcF@lizhi-Precision-Tower-5810>
 <20251026221149.GH13023@pendragon.ideasonboard.com>
In-Reply-To: <20251026221149.GH13023@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PAWPR04MB11551:EE_
x-ms-office365-filtering-correlation-id: bb46a874-b7ac-4a68-eddd-08de1a9e7d45
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TXY0UTlsMFdSME1PalZnaHUzbXFmaC9hTDhsemxMbngrMWxUbnp5c01mNzVG?=
 =?utf-8?B?NjFCVDFrSDhjdmwvL0NRbGtoUmNUSnMwZkQ0NmUxakZ5VVlDY1VwTVFDREZI?=
 =?utf-8?B?MStrckVINkhwYVNPSzdid2N3MFUyRWdZekRXMFhLd05jcmxjK0V5c09rQmdu?=
 =?utf-8?B?Tnpzd2daWlAzOHBXQ0pIblBKOGlJa1hjdU9JMGkxOWJJaHI2c2RsYlRPTUFy?=
 =?utf-8?B?V0QwTU4rRFVaVk8ydDN6SkNZc3Jac3piU2xrSFBhZmtuTDFaaDY2S0RlYXdL?=
 =?utf-8?B?aVcybkFIWS9vMFdZb0dadEJVSzNSUjFGRTJnQXFwWk91QW9VVnRuTk5reGty?=
 =?utf-8?B?dEF4elp1MGdndGswZ2JiM2tSSUVRdGpKZy92dUlCSURyaXY2KzNCNFlaQy8w?=
 =?utf-8?B?ZWRyNEFYZGxFZmZkdllkQmNSQzRzaEx6dFNuTVFoVXpKZnFzYnZuTWV5Q0lx?=
 =?utf-8?B?Z0hoNHdGc3dPT0Z6SFZsQTR1aEkzZVg3R2FkVXllUDc3MFBWWktqcG5PT0R1?=
 =?utf-8?B?MXVLVHNVTFJwMm5PL3lsZTVOeERwajZCd3EvUlFIa0kxSGxNQlVtNHp0UWNR?=
 =?utf-8?B?YTRrMTRmRDJSOEJ5RnVHT041RFlsTU5oSk9lNGU0dGRrYm9uVHNnY1c4VnRM?=
 =?utf-8?B?aTdxaktkRGthbVd4Y09tQmxOS1VKSzlCTC9FbmcwaGczTUwwUzZvRVA0N0Vq?=
 =?utf-8?B?OVJ1VnE3TlVQRkpFdEdISWt4RmpiL0Vud1NiYlk3aXB0SmJNM0R2Zy9LS05u?=
 =?utf-8?B?QnEwa3ZFYWtMdWdoalptTENIYlVDVFF5MEJPNUs4ZWMra08vZFZrWmt6MzdN?=
 =?utf-8?B?TEJuSTFCSUJZNVhaUW03QlI0cCtrWkVaT3BEVSswZW9WVnJ5OEZNSHF2dEVl?=
 =?utf-8?B?cExUL0R5aTZpU2M1ODlKc3d3RlRIY2hKQTMwMzhsbkVZOUZZTmxHTFVGY0Q5?=
 =?utf-8?B?eHhpY0h5NUJWZktFUEd0cStrd3ZuaU9vZS9FNC80NUpobEtlMTRKRHk4UFNB?=
 =?utf-8?B?MWVyMGZFR2w5elg1cThBaWcvcmovUEJ6NDB5bHVLWHVmc0svaU9pUkhreWpN?=
 =?utf-8?B?QXlCWFhMVVNyUW9oMmlCVGo2T0d2ZHJDMUQyQVFndytsT25jT2t3Vm9YRXBI?=
 =?utf-8?B?M3g4dGcvUm5ZZ1RHT0owRWJUSjRDZ1VRblhMa0RReEE2QU02N3BURFphcHlp?=
 =?utf-8?B?WUREMklIN1QwWmtpRFpEblhzUXlnRnAwQm9naUo1cGwvQUorYXBGYm9oT1Q3?=
 =?utf-8?B?NzZ6R2RpWGl3SzhGV0lkK0pwUmgvMS96aTJOSGl3M20weUd5azJFbVNzc1Vy?=
 =?utf-8?B?czJ2S2JIWC9BQkFpQlltK0FoNXkzTkJIZ2RBZnczWXVhcDdlWSs0bVdkZTRU?=
 =?utf-8?B?a1laNEJnSG45cmhrNDJ2YnJIUUpnNzlnTjlTcmQ5WnlXMjVXY1U4enZUY3JQ?=
 =?utf-8?B?UG52NVFoWjgrQmxtVGwyVnlabVVkR1JCMXoyT1pXRUJlbzFtS3l2WjE4L25z?=
 =?utf-8?B?L3ZZWmsrMXZyUzkrM3c5NkRYb2M0NzlFRVozTG5hU004Y1M0VGUxelh2emVS?=
 =?utf-8?B?V2dGSTF3TzdPSGExWk52QmJoOUh4aWIwdlpoNURxTzlwcjNkVVIyQUg2Y3Yw?=
 =?utf-8?B?TzBHZ2YzNlNFWENEWTNMbHRGbjRlNGdPUksyOXRLU3lNb3AyZ245T3dDM3Vo?=
 =?utf-8?B?bkVrd1gvSmhGSmtUcGI2c1p0elI4T3ovK1pjWE53WVRxbXVFM0pPeGpPcUxm?=
 =?utf-8?B?Y0NFRElQb2x0a2NrbmdpUkw2ZjBmN09xS244T1hydzNzV2ZHYUF6TzVUUUND?=
 =?utf-8?B?Vk9aVktxL0dzd1ZCbStTR20xcS9xakpRUlJoM2hmSmt6RythcVRJZ05SU05F?=
 =?utf-8?B?Z2hlSnI1TVF3eW91NWorOXNRVytnMVpXRVNXVUMyNzFEZnF2MmQzcmt0V0tq?=
 =?utf-8?B?L0FWemhiWkxFbERObjVZZ3U5Z01RZi9uWTByNW9Kcit5NkFtSVRWaEZ5YkFt?=
 =?utf-8?B?KzN2cUQ5d3h3S3pWdmpXaTZ5OGdheW1MS3RXdTUrb3hlUGIxMUJJQ0VDR29w?=
 =?utf-8?Q?LDe/Fd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SjFiOVVmdVZIc041UStiUFZ1eTVQRDczakw1Z0h6dG90dWJXNkZYc2VTRXg0?=
 =?utf-8?B?ZW05cTFKS0pPODRjcEtXb1Z5MWNQOUlSeVRsNlhHR0ZwRkpsSGY0dGZMdDVK?=
 =?utf-8?B?REFIYlVFQUpEWnUrV2tLZ0RUZFo3SCtNTmNOekZrNVFnV3hGb0FtKy9RZ3hL?=
 =?utf-8?B?Q2lOZ2RzbkN2Z3hZUDFLMkFrSEpJUDFDWnVUY0kzYjZIR1NEYUxtcXR6Y1hr?=
 =?utf-8?B?akpsTytXb2JKby9DSk13am53TVRJT1lPVlhySktBTGdzVFFpSlYyeWNaZGVC?=
 =?utf-8?B?Qk9ZdkVLVnIvZkVMQ3ZpaHBFb3NWaWR5Zy9nMG5kand0SkxRMG5KSG9sN3Vu?=
 =?utf-8?B?Q3QyM1hYV3l4RS9RMm1GK1lSbWNGcmZraGgxQ1B0QVc5OUhkZjc2cWQ0cEg0?=
 =?utf-8?B?cmFoSFZ4ZzNFMEc5d21WbGN0T3F1VndITlRnQ1Q4TVpWM1VtYjVXZllOK1h3?=
 =?utf-8?B?TVE4UFR2TFBnYm9qcnVWc2paY0hHaVpDMzVkQ2R3cFpkNmNGSUhvZ2E5TXRZ?=
 =?utf-8?B?TlJWcHZuaHo3d2RmS05HOGZ5clJucXFPZ0E0dUdsRUphNXNUajh0QzRjYWhq?=
 =?utf-8?B?VE1uWVZxNy9ETFQ5S3VnazFGV1JCVFJmQ2V0NmYwVmpvMVpKVEZHbjVETHEz?=
 =?utf-8?B?OXBzKzJQSjlSbHprREpHbG4vMERBSk0vQlBNeWY5QTZrbWE4R2xrbFdmRDZm?=
 =?utf-8?B?VlVnYVhlWm43UllhQUU2VXZYUGdKd2ZpMDYvMUVZNjRGUVFTUlpSQXBPeTBM?=
 =?utf-8?B?L0U4a21NbjhpaVUwTENQV3B4MGlPTHJjQzEyRllNaGZSelg2VDZrWHVHTURY?=
 =?utf-8?B?NlpRSVl5cUhjNjVhMTNWN0RvMkkxditFNHQzcUVZOWlVZWNVTlg0TTZDSkI2?=
 =?utf-8?B?OWxKZll6U0hHVStEY1Njem5kZDI5bk1tM1Zvd0xhQXFtQlJmWFh4NGwzMXVQ?=
 =?utf-8?B?SmZveUZKRVE4TURiamE2VWtqbzRtWEs4d2NVdXNscUJNeXBtTGZDNjFUY0pD?=
 =?utf-8?B?SlJ2NXQwK1pTdUlxTVYrUVZnd013TE1OMGI5RmRrSjdoVnlaVlp0YjJadld6?=
 =?utf-8?B?aWFkSFBOeEVSTjdVQk1rZXRuMWVhRDNhWENlV3hGYXB3ejFHL3JXWE1mOVYy?=
 =?utf-8?B?R2N5bkZqaVB5RzBmSzdWV3JLY3JPVVV0NFA2UHJNalVrekxOSENTTFZiTDlB?=
 =?utf-8?B?V3VhdUpQbXowK3lPSDY2K0M2M2NNQU12aTdJUjY2UUMvdHhPUEJpd2RjODFr?=
 =?utf-8?B?dVhtNWt6dEFjMDFHc2huTDBJUVNTZDR6M0gxTkN4elFNd05YZWpIWm42cUdq?=
 =?utf-8?B?eHRuSGNyVmdRaW1hY3lzUUpka0wxRzUrVk42a2YweE50OVNRMmNuOWczYkpm?=
 =?utf-8?B?R3dLNHlCbGZoRHJEczZmRDhodk1sUGxuV1V1ZEhrc2N1UU5SQW9qRXkrUDk2?=
 =?utf-8?B?L1g5S2NjSG9mU2JueWlqSmZBeHBRWTNmdmZxR3NXQVdSZmw0NmJjR1MvaHRX?=
 =?utf-8?B?NS9aWnVhUER2ekwwNEdHcG5tOXVBWjBLbjB0UkxDeGhJK0JKZlhqRDVRZCs2?=
 =?utf-8?B?eGhZV2lPSzdUTVNVRDZlYUJjNVZxUDVYK1BPZEJXVndxLzIxY3hTRHhwemEx?=
 =?utf-8?B?Q1Azb2YwbHk4M3ZsWGpSamF3ejJtVEh3ei8rbDduQlZKNVdWVkNtakI3WUN3?=
 =?utf-8?B?QWZiVk50emhUNkV4MTB3T0pDWFBoeUoxUjIyTTlvVmhsb0hjRGNvdkVLLzM0?=
 =?utf-8?B?Mjk0UHc3bEQ0UlBOREhpNTd4OWR3aEVWbXdnYTNpeUFjZjFwbTZzNEQ4Nkla?=
 =?utf-8?B?aVl3aTQ5SC81NnBZOXRpdlNhWmdSUzRVaERaOVZWdzN2VTZLTVI4eUNiVit0?=
 =?utf-8?B?TjZaYVpGY1Z2SDhITmFZN2R4NEUzRjMvc21BdVNCMCtZVjRUNnBnTzJHckdv?=
 =?utf-8?B?emxnSVF4NlREaXJwSFB1Y2NrNFg2bDl3VEdXTlVhNW92dmFWVkZ5NjJjcHJE?=
 =?utf-8?B?T1Z3TGIyTGlIRDN6bGZZNUk1OEE0UzFtQzEzYk9DV2ZSOFNDWWtQdnZBbWdU?=
 =?utf-8?B?ZThyaUgwbEZ0VnNtZjJ5TWgybTZibitRa0pnMktIcTF3cHBzOFlpY01aN0Zt?=
 =?utf-8?Q?YxUbNcr3WFgee2Ih6nZ0VLbD/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb46a874-b7ac-4a68-eddd-08de1a9e7d45
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2025 06:01:54.1487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LCF+Sc2O6oO549BfouMXvtawZfbTBnMmbbAp0QerHmWXKrnKY2bgQE8dB2jN6rdsc1iIUI8f52sfKTkcwZt5fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11551

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgT2N0b2JlciAyNywgMjAyNSA2OjEyIEFNDQo+IFRvOiBGcmFuayBMaSA8ZnJhbmsu
bGlAbnhwLmNvbT4NCj4gQ2M6IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5j
b20+OyBNYXVybyBDYXJ2YWxobyBDaGVoYWINCj4gPG1jaGVoYWJAa2VybmVsLm9yZz47IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296bG93c2tpDQo+IDxrcnprK2R0
QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBTaGF3biBH
dW8NCj4gPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0
cm9uaXguZGU+Ow0KPiBQZW5ndXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4
LmRlPjsgRmFiaW8gRXN0ZXZhbQ0KPiA8ZmVzdGV2YW1AZ21haWwuY29tPjsgbGludXgtbWVkaWFA
dmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3Rz
LmxpbnV4LmRldjsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgRy5OLiBaaG91DQo+IDxndW9uaXUuemhvdUBueHAu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gbWVkaWE6IG54cDogaW14OC1pc2k6IEtl
ZXAgdGhlIGRlZmF1bHQgdmFsdWUgZm9yDQo+IEJMQU5LX1BYTCBmaWVsZA0KPiANCj4gT24gRnJp
LCBPY3QgMjQsIDIwMjUgYXQgMDk6NDE6NTBBTSAtMDQwMCwgRnJhbmsgTGkgd3JvdGU6DQo+ID4g
T24gRnJpLCBPY3QgMjQsIDIwMjUgYXQgMDU6NDY6NTNQTSArMDgwMCwgR3Vvbml1IFpob3Ugd3Jv
dGU6DQo+ID4gPiBGcm9tOiBHdW9uaXUgWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gPiA+
DQo+ID4gPiBUaGUgZmllbGQgcHJvdmlkZXMgdGhlIHZhbHVlIG9mIHRoZSBibGFuayBwaXhlbCB0
byBiZSBpbnNlcnRlZCBpbg0KPiA+ID4gdGhlDQo+ID4NCj4gPiBUaGUgZmllbGQgQkxBTktfUFhM
IHByb3ZpZGVzDQo+ID4NCj4gPiA+IGltYWdlIGluIGNhc2UgYW4gb3ZlcmZsb3cgZXJyb3Igb2Nj
dXJzIGluIHRoZSBvdXRwdXQgYnVmZmVycyBvZiB0aGUNCj4gPiA+IGNoYW5uZWwuIEl0cyBkZWZh
dWx0IHZhbHVlIGlzIDB4ZmYsIHNvIG5vIG5lZWQgdG8gc2V0IGFnYWluLg0KPiA+ID4NCj4gPiA+
IEJlc2lkZXMsIHRoZSBmaWVsZCBvbmx5IGV4aXN0IGluIGkuTVg4UU0vWFAgSVNJIHZlcnNpb24u
IE90aGVyDQo+ID4gPiB2ZXJzaW9ucyBsaWtlIG1zY2FsZSBzZXJpZXMsIHJlbW92ZSB0aGUgZmll
bGQgc2luY2UgaXQgd29uJ3Qgc2VuZA0KPiA+ID4gZGF0YSB0byBBWEkgYnVzDQo+IA0KPiBXaGF0
J3MgdGhlIG1zY2FsZSBzZXJpZXMgPyBJcyB0aGF0IGkuTVggOE0gPw0KDQpZZXMsIHdpbGwgdXBk
YXRlIHRoZSBjb21taXQgbG9nIHRvIG1ha2UgaXQgY2xlYXIuIFRoYW5rcyBmb3IgeW91ciByZXZp
ZXcuDQoNCj4gDQo+ID4gPiB3aGVuIG92ZXJmbG93IGVycm9yIG9jY3VycyBhbmQgc2V0IHRoZSBm
aWVsZCBhcyByZXNlcnZlZC4gaS5NWDkNCj4gPiA+IHNlcmllcw0KPiA+DQo+ID4gbWFyayBCTEFO
S19QWEwgYXMgcmVzZXJ2ZWQuIGkuTVg5IHNlcmllcyB1c2UgaXQgZm9yIG90aGVyIHB1cnBvc2Vz
Lg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPg0KPiA+
DQo+ID4gPiB1c2UgdGhlIGZpZWxkIGFzIG90aGVyIHB1cnBvc2VzLg0KPiA+ID4NCj4gPiA+IFNp
Z25lZC1vZmYtYnk6IEd1b25pdSBaaG91IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiANCj4gUmV2
aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT4NCj4gDQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9p
bXg4LWlzaS9pbXg4LWlzaS1ody5jIHwgNiArKy0tLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1ody5jDQo+ID4g
PiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWh3LmMNCj4g
PiA+IGluZGV4DQo+ID4gPg0KPiA5MjI1YTdhYzFjM2VlN2U0MmU2NDk4Mzk4MmViNGI2YzI3ZTM1
NmZlLi4wMTg3ZDRhYjk3ZThlMjhmY2E5MDEzZjYNCj4gODYNCj4gPiA+IDRhMDk0ZTA4ZjJjNTcw
IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kv
aW14OC1pc2ktaHcuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14
OC1pc2kvaW14OC1pc2ktaHcuYw0KPiA+ID4gQEAgLTMwOSw4ICszMDksOCBAQCBzdGF0aWMgdm9p
ZCBteGNfaXNpX2NoYW5uZWxfc2V0X2NvbnRyb2woc3RydWN0DQo+ID4gPiBteGNfaXNpX3BpcGUg
KnBpcGUsDQo+ID4gPg0KPiA+ID4gIAl2YWwgPSBteGNfaXNpX3JlYWQocGlwZSwgQ0hOTF9DVFJM
KTsNCj4gPiA+ICAJdmFsICY9IH4oQ0hOTF9DVFJMX0NITkxfQllQQVNTIHwgQ0hOTF9DVFJMX0NI
QUlOX0JVRl9NQVNLDQo+IHwNCj4gPiA+IC0JCSBDSE5MX0NUUkxfQkxBTktfUFhMX01BU0sgfA0K
PiBDSE5MX0NUUkxfU1JDX1RZUEVfTUFTSyB8DQo+ID4gPiAtCQkgQ0hOTF9DVFJMX01JUElfVkNf
SURfTUFTSyB8DQo+IENITkxfQ1RSTF9TUkNfSU5QVVRfTUFTSyk7DQo+ID4gPiArCQkgQ0hOTF9D
VFJMX1NSQ19UWVBFX01BU0sgfA0KPiBDSE5MX0NUUkxfTUlQSV9WQ19JRF9NQVNLIHwNCj4gPiA+
ICsJCSBDSE5MX0NUUkxfU1JDX0lOUFVUX01BU0spOw0KPiA+ID4NCj4gPiA+ICAJLyoNCj4gPiA+
ICAJICogSWYgbm8gc2NhbGluZyBvciBjb2xvciBzcGFjZSBjb252ZXJzaW9uIGlzIG5lZWRlZCwg
YnlwYXNzIHRoZQ0KPiA+ID4gQEAgLTMyMyw4ICszMjMsNiBAQCBzdGF0aWMgdm9pZCBteGNfaXNp
X2NoYW5uZWxfc2V0X2NvbnRyb2woc3RydWN0DQo+IG14Y19pc2lfcGlwZSAqcGlwZSwNCj4gPiA+
ICAJaWYgKHBpcGUtPmNoYWluZWQpDQo+ID4gPiAgCQl2YWwgfD0NCj4gQ0hOTF9DVFJMX0NIQUlO
X0JVRihDSE5MX0NUUkxfQ0hBSU5fQlVGXzJfQ0hBSU4pOw0KPiA+ID4NCj4gPiA+IC0JdmFsIHw9
IENITkxfQ1RSTF9CTEFOS19QWEwoMHhmZik7DQo+ID4gPiAtDQo+ID4gPiAgCS8qIElucHV0IHNv
dXJjZSAoaW5jbHVkaW5nIFZDIGNvbmZpZ3VyYXRpb24gZm9yIENTSS0yKSAqLw0KPiA+ID4gIAlp
ZiAoaW5wdXQgPT0gTVhDX0lTSV9JTlBVVF9NRU0pIHsNCj4gPiA+ICAJCS8qDQo+IA0KPiAtLQ0K
PiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K

