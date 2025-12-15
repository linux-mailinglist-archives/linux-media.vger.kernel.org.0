Return-Path: <linux-media+bounces-48826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B85CC0210
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 23:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9EC9301D673
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 22:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7E93164D6;
	Mon, 15 Dec 2025 22:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cle8Rl0t"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33822638AF;
	Mon, 15 Dec 2025 22:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765839020; cv=fail; b=QNK3kGtjpeo7NyJ+xzztne40zVxS5DAs+esNknb8+Dhs2DvMNJssfZ/xrh+Y93KJnjJJRV4tjhogI8PSAUizbsRX9dNz2/vylFabrzziNlw9aL+CmC/AGsaKZzbIitJC1BeBS2o5uI6+OyYuXLEUzMlmQB5mSBgAf+qHfSNbMas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765839020; c=relaxed/simple;
	bh=HtU+8DjMrvw/SumeJVSRxZjAxdrT/yUBYdktsw1aDbM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=KNdnh15QY/nAPo+ZxTSBwyjjOb2fAwwj14hRr8tQCjHRHWE9VaYvEW0VB7w1piF6OD/SRZJxQj87b8kdLQ/1SIEGaBoPb2SiV8F5ez6SV1zI+FehpFWDfv7bzgbqjdoiWBdHc4xFiIUBPwKuIZIIzOMXrBZipysUGlWloGbQfbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cle8Rl0t; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxD2mNuQqSn8Ztpxx5+yVwETf5p58aYInQOQFAFkQaqv6So5v7lNTCCNUo7ChKYq2drgJe6JDdm9DBeoSqGk/vapLUqruV+J3gyDsr07dkafnkDKyTTs7gbzJN8k9INyGvTqUhsmHKAMcVB5fChxxhQbVb4kSSlw/plpSOuPAA1VixtiZx8fTJgY1At9KIZUvIFy9PbHoRcOn5lSc0+hSNCx5g1r08NPh4S5vpDECvp32lbu3jlwaecMOQMPZbyw5OQsz/7LZjQaj/qrw+mDSl1pnfpdREDTjI+9iVA8p/v3wJYOEpkQqlwOt+Fjkqi1TOPjUceh+4kcU2svgFL3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWJBKJkWUOei9IDbFd2zy32YmFie+Hj4qGa/f7TStuw=;
 b=y7RakcDhcxb4oBShy4GFHoPjB7MAYhc4npwAOFaZcfkWW+b3vcy8TpZ03mTunyk7WabvW0ZKZh3OSEa9pbZIAdaBA6am01Mx4imIu4PRWZkAjWoa2XjoamZ45LSjF1tydoUMEEwL08sQSnWBzyzgie52/FjVGgp8ztci5V3xmLqYOqwJNgeZGJkyZiZzT7j3fMEtmP5auGX69dT+g8Kd17mmG/KMfxBFpA3acYx0Ks+m97lcjQK6U3aWYIotGHpc8wLTdr1B0cE9cTRJME0j2WHxcqqk05hzq+wVgDpQ4bD8T5E0QO3V+5z8V1AagZlobelYZwMzRQp41EhqL3FJJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWJBKJkWUOei9IDbFd2zy32YmFie+Hj4qGa/f7TStuw=;
 b=cle8Rl0tSu0ybS2OF9tp77io7jVueESjHRCWCHmCd5sJB2zyBgrJY0pb2ndhBS5oOvFrSqMWMV4UZEFZTB9luBZ4YI9nELyZClX3ygTIgAuBqINrVnUzD2X2fvfh+n+gwGdLEws/AQdWJwG5b63ygE4eAUSinDaH8YOVoyZq65K2QOf9uwiIYK0MhXwyIBoARiaiIJSgJFwOdOCPI5qZTJjFWMSKtsaP0MCpVtOY5Z4bn3yxIlA5JIL3GsHM0PkeHXjV0pZxUrzKoej1/zQVL4iezpchbW/g88gNaah6WxWE5SNg7X04YPJD0b+g6936/G7R9ConRcB2iqAIODAGag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA1PR04MB10794.eurprd04.prod.outlook.com (2603:10a6:102:482::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 22:50:13 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 22:50:13 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 0/5] media: platform: nxp: Trivial cleanup pathces
Date: Mon, 15 Dec 2025 17:49:51 -0500
Message-Id: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI+QQGkC/1XMSw7CIBSF4a2YOxbDQ0tx5D6MMfQClsTSBpTUN
 N27tBPt8Jzk/yZINnqb4LybINrsk+9DGWK/A2x1eFjiTdnAKT/RmkqCurvj0+rwHkhTGUUbrYx
 GAaUYonV+XLXrrezWp1cfPyue2fKuDmNs62RGKKnQHHktuWmkuoRxOGDfwaJk/l+qbclLaZwUH
 LEWzrFfOc/zF2nuDoXeAAAA
X-Change-ID: 20250807-cam_cleanup-b6d90ba9dac3
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765839009; l=1509;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=HtU+8DjMrvw/SumeJVSRxZjAxdrT/yUBYdktsw1aDbM=;
 b=CbXp8/0RsHtaV57yp14bxhvLxho/KP2zRzYwF64KREi8uaU9A/bw5SjJoVMCEHiNKdNxcFtjc
 /bdXYFAI24SDcQR0UL31JGH/ua68FGJotRTnyAOLC2ckghC259eej5I
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:510:23c::8) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA1PR04MB10794:EE_
X-MS-Office365-Filtering-Correlation-Id: a1099e2a-14bd-42fc-24c5-08de3c2c4e9d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|7416014|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MlhVN1F5V2F5NnpjUUdZVnUyN2NhNHpkd0VudDhrSlRJUTFJRjMzZWFJbFRK?=
 =?utf-8?B?cm5rdFZuVzJqNEN0NEZHelhIeGsvczNhVFFaWHR5QkY1OGk2SUp2aUl3bGky?=
 =?utf-8?B?RWlxL2JVMSthQTNDV0VDZ2tLMTJsbzd0QituTWpjb3d6NVRqaER3MFdNY0Jx?=
 =?utf-8?B?ZC94bk1sVXlVRkNpUUlSWDVuWDZEVmtSWDdjYmt5azZBT0pDOEFieWYwSDhi?=
 =?utf-8?B?eWdpK2hQdGtJbmJTelFaZk9xVlFTVkFaeXJmTDcyV1piUkdrS29wOXJwVlJZ?=
 =?utf-8?B?NVlSeFgzRm9aSFVBcVVVL0dmYmwwSDdqeGZwUS93eUxjem9pMisrNnFxRWg0?=
 =?utf-8?B?dmY2bE5WdEJxV0U5aTZueW94TEppTUxOd3JLNS9QSVFMaHd6ZHVsY0xKeFZz?=
 =?utf-8?B?SU1mVWJIN2h6UysxVVRMdUdaU1NKUWdWWGU5TUZXN0xVZ0dpNk9XYTFLdzM2?=
 =?utf-8?B?bk9PZWRJZ2xVSlZYaFdPbFNQakFKTWFzNWQrbkhuRTNmQXZPSEpOTG5lNHJO?=
 =?utf-8?B?NmljNTRqblZLc0IrSEhQeGsrSm16UGRmczNRQkNzTEMwek16NllBYkpIN1ha?=
 =?utf-8?B?empPN2EvRWlUMjBibEcxSDNtYndpVExhdlprK2dZQ21RdnpLOUI4LzhsK3Br?=
 =?utf-8?B?WlBmVDFFYllQa1hZVTFCcEZXSElubXg0STdQcmU1VnFPcllLYjEzVjVkNGFS?=
 =?utf-8?B?OU82ODJCaHpJRmYxei9FSGRycURJcGJaaUFrcmllSHpjaVpBMEdIRXdoN1hJ?=
 =?utf-8?B?WGpFMjR0MldTQXlPOGV3OHUrWVdhQWNoVzB2bkhhMXFvcmsxcnFOcTZjazlE?=
 =?utf-8?B?b3NDZ1Q3dkRsSk5kQUQvYmVuTXFhcFR4TXBzcmFTSWQzS0ZrcE1yOFlWUTNj?=
 =?utf-8?B?STUwM1BWdExlWDdmczE0MDgxT000QUpQRnlZaUMyVWFlOVcrUkpqekIxdjFo?=
 =?utf-8?B?enlUd25sQUpPMDFzYnJoUGtUTVgrWTErVFJQdEdHc2srZW5Gb3RnOVcyc1p3?=
 =?utf-8?B?bVZLZ0VqZy9tbFhGQUwxQWxBb014UFdtUEhjL21vUUFQVW4wRDB3dkNaMDZT?=
 =?utf-8?B?RkQ4aUkyUm8vQzc3OU84VTFNMmdhbUpVNEJabDNzOGlNeTY0eE5zRjFMbXZW?=
 =?utf-8?B?d2w5d2tEVjB0UVZMMHFYVnd5bEJtNnA0UXB0aFR3MmRpN2xWT1dGa3BwTmd4?=
 =?utf-8?B?RGpVb040eG85eXlLY05ocWhFbGhvcTV4S0g1RXN0cCt4aHB2bm1meDluN3J5?=
 =?utf-8?B?dEU1bXNiNXZqSm5OTGh5YlFIWEU4REF3cllJR1VzM2RVcGV6ZFFsRTZtejdq?=
 =?utf-8?B?NWJMc0NhN2NoaGFRMm4xZmJIRjNlWnNtYmdESkJhclBuWlFLSm1pYUxlNjVE?=
 =?utf-8?B?cndUcHFTajBJdkhkVStFQ1VVUFdPaGRMcm9BajdDdmtOMUpIM28zSFdXMWZ4?=
 =?utf-8?B?a1hQODdDVDcyOFlkdzdZYnlkdkV2bUlPNzR2RkJTWTdFL1VtRHdrNk5yV0Nz?=
 =?utf-8?B?TkpBMDA0WEg2enZkUmdWRXI0TFZCSjZUeDAvTmc5ZTNNajJFR2gwYVVmOVFQ?=
 =?utf-8?B?cHRmTG03dXJoL1RSME1MVEtYbHNKN0kvQlRzaEI4NFdVNTdvN05pSHpFUXhu?=
 =?utf-8?B?Nk9hUlZxajFaUzNLY2lhV2xEdStJWklTbzdzRHFiT3FRWTROQ0diWkdQdGsv?=
 =?utf-8?B?aEpvREQ0c0w5R1V6RDhFa0JTcWtqUHB0T1FBT0dZdThqYjJSY2l2aUpGZDB6?=
 =?utf-8?B?dzZOWUxCbHBGUVNSdytNQmFzamlNMEZ6NzJadFg0eEdUU2hoY2RPVjA0WjNj?=
 =?utf-8?B?S2NrcE12dHdYSUZhMlliL01SY1FpRHRlOTA5eFI4cXpURFJjRmo4MVQ4WWlk?=
 =?utf-8?B?emxuQmUvS3AwNGhVV1ltd1RQeEpsWXlEVlhGU0w1N1dTMm5ESG5rVzlTWGg5?=
 =?utf-8?B?Y2UzaFg1ekZ6aTc4ZWxZemxMTVlNSTlwbDl0K0M1SnVmUFlLN2lHSEFGZVV6?=
 =?utf-8?B?MnRkT29rRlVNNDUyVUtKV3lGa2YrVWdHbXN1MkZaWlJxcUk4anJHNUFObXdx?=
 =?utf-8?B?UDZPWTZ5ZDBkN1liL2M3dFFIcHlCbG5yK2lJTGxwZ2w0dVBzRlhLWGE3QTJn?=
 =?utf-8?Q?onls=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(7416014)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RDJ5UGMyWk9HTDNra0Jzdk0wOG9nVHhCdTF6YmpYcGJYaDFIV2pydzZyaUtp?=
 =?utf-8?B?TC9ONGFIWVFEYjZ5TTdKcG1za2xiZDJ0dEVuL0FqeTRaREV4MjNPZWl6dzZQ?=
 =?utf-8?B?TzZDUC9OTVBleUJ3dTUyNS90MjcyeW9ETDk0SW5pSit4Z1BQTU9CM09FREtV?=
 =?utf-8?B?bGI4ODlwK1Y1K3dsQ0xQSUVVQWxxaEVqVWdiYU5YNnl0bHNmUzlGM1EzZnM5?=
 =?utf-8?B?dHo4Q3h4dkpRdlFnRWRRSVNJaG1UTUU1WmM3L1dPMi9rcjRDYmpCOE1qc1Rv?=
 =?utf-8?B?aXEzaDRyRUJYVVM1aVJnTStFSytKajIzM3J0eXhLV2dDVzRXVlEwWmxSU054?=
 =?utf-8?B?b0RMa1NEeERibi9JVXduNXIzc3NjOW9BNEhVclI2MFhJYUJLZWtmdEtRV25r?=
 =?utf-8?B?K0wvVGFsOHVXbFUyWVlGWFBVUGhIVTBxeXFwd0xIQTl2bk9OSUpYQVVNMldp?=
 =?utf-8?B?c28xbVVVME1UUk9jMDVvOURuVWowTlJwZVh6WEd5K3ZTTjZGYm50Y0srdm52?=
 =?utf-8?B?dy90UDVmcWdocHlOcm1aREdkVUJlamVLZzdjc044cHdHL2R1ZXJDVXMxT21n?=
 =?utf-8?B?N2dmQWJ6SFlMMklLK1dFZ2piNU1ra2NCU3pGQXRpbUwxWFBwbGFQYVhjQnZt?=
 =?utf-8?B?cHpCVEprTzRTYUtkejdXcXR4NFNXME1EQVUvTng3b0tZck5RYlFHa1hMdENZ?=
 =?utf-8?B?d1RKS0U3WkdiNEhlaXZtemJic1c0bVRmZUxDRVNPSWF3R3dTenhHSGNJRmlN?=
 =?utf-8?B?TjVkOGhBanRJeU9CTkw0Qm9rRFBTR0xqcEhORnR4eDcwTUhGQUhBTVpXK21F?=
 =?utf-8?B?U1RzaGI3aCtpd2JwUzBXMk9mcUpGckRGRjRTWG1zZ2ZZMXh3RjBPemZFMEZ4?=
 =?utf-8?B?cGxudDZYRmdTWmRaM1dqa21WdmlSVU9ISmJWMWJkV0wwaDRidGU3TXF3SWR1?=
 =?utf-8?B?WlFmemNiV1BrczlFQVhOMnJPV1lCTVFFWXdYUENDUWRFdjJlNHEzQzhJajFy?=
 =?utf-8?B?S1hOZWFrMk41UkFMckhwOW1TbUpLbnNxdklwZGdyZTZ6eU9BUUJRektybjJn?=
 =?utf-8?B?dFFPNkFvdkw1eEM2cE9WL2RxY1dMdnI1cU1sTUNzckoxWUhaeEhDQU1ucjlD?=
 =?utf-8?B?Uy9sU01XU2pxayswM1VMODVNK2lON0dabGZyQU04VnN5VDJwTDFzK3IwOGxX?=
 =?utf-8?B?N29VY1dyZCtuY3NhR2pTL0xVamZJMDlrZjhBNUFWdjJvS1FMN2ZKbURxS05V?=
 =?utf-8?B?cFBLakxVUUVvSnVPTm5mV2VKb3hzWlFtUWc1V2VMYmRHUWtoaWFSRUF2Umo5?=
 =?utf-8?B?dlVtQjh6Wml3bmtaK1NFam5NeGwvem15K0srdzVoNDVpM3VCNk5Yd0hsWk5X?=
 =?utf-8?B?UnkxTzdtMTQwcTRPZ3BQTVB3R1BOKytUcTAxSFJxM1NNZ0V3clhyTlJ3SUFy?=
 =?utf-8?B?OVc5WXoxNmZzcEVRY1lyeDhod2Q5Z3pkL2VBdmgrT2ZmeFFaSUR3Y1RsbEEr?=
 =?utf-8?B?Mk96ZndTdVhaZ2VzcWxLbVV5VXZHV0lQL2pDeUxlQ1NqbFJkSDFiWThPY3RP?=
 =?utf-8?B?Vk9OdElWMkJsdDlxbVZnWmlGb2V0aWFxT2pzL2h6VjM5a2VjeXhReERmemN4?=
 =?utf-8?B?bnhyWmlPMmtZYWxaWHpuTnY4cjVOT2loVGlVTnJKMFBTa0hKckYwWEw1NURF?=
 =?utf-8?B?OXZubmpTZFBRbVphNlB1MW5JMUpZK1FWZTF0NGlnRGRWSGhVK2F3VzdTVkxt?=
 =?utf-8?B?NEV4WXZnZTVWSElUQVhCbFR0U2QwbmJYM3hnTEZsUjVTMHhmeHZvWE8wVHBa?=
 =?utf-8?B?M1pDb1ZIV0Q3U2JSMWRnd3oxL2JXUjlYV1pFRTNBeWpsTDFBYUY1bTM1WHk4?=
 =?utf-8?B?dXQ2N0pCb0Z3Q1NEemREQkRYeCtmNUtmNGhkQmV3V0luSUlTTGxVWk1uM0tO?=
 =?utf-8?B?UVA3L2YxaklRdElReTNZQkJXQ3ZvQnUvanhQbTZxa2I0bXkwZ0pTczdGTWRL?=
 =?utf-8?B?RndTaW14RFlaYmllWFVOR2lXUXNNUXNQL0htcmR4WmdsK1JvUXhUWXFsV1l1?=
 =?utf-8?B?SmY4QWk3bXNuU2drVXFwL3Jsa254bGN5ZjduN1Y5Qm5OaE9mL2w0RXd3bWta?=
 =?utf-8?Q?lKVKPvZBTiLzgosciKXToVwyM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1099e2a-14bd-42fc-24c5-08de3c2c4e9d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 22:50:12.9778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PIBv22jObhneeb7pBzX2lZpOUvlYfij9HHdPGG7qkf3YC/M752kCTnMXk+0WWf7bqnijo5ftSE7+KBYgrHSMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10794

Some trivial patch to reduce goto at probe functions.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- rebase to v6.19-rc1
- avoid use __free() == NULL according to cleanup.h
- Link to v2: https://lore.kernel.org/r/20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com

Changes in v2:
- add new patch media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers
- detail change see each patch's change log.
- Link to v1: https://lore.kernel.org/r/20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com

---
Frank Li (5):
      media: nxp: use devm_mutex_init() simple code
      media: nxp: use dev_err_probe() to simplify code
      media: nxp: imx8-isi: use devm_pm_runtime_enable() to simplify code
      media: nxp: use cleanup  __free(fwnode_handle) simplify code
      media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers

 drivers/media/platform/nxp/imx-mipi-csis.c         | 54 ++++++-------
 drivers/media/platform/nxp/imx-pxp.c               |  5 +-
 drivers/media/platform/nxp/imx7-media-csi.c        | 14 ++--
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 16 ++--
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 88 ++++++++++------------
 drivers/media/platform/nxp/mx2_emmaprp.c           |  7 +-
 6 files changed, 83 insertions(+), 101 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250807-cam_cleanup-b6d90ba9dac3

Best regards,
--
Frank Li <Frank.Li@nxp.com>


