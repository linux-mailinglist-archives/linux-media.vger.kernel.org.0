Return-Path: <linux-media+bounces-42170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48854B51300
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C1621C81572
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 09:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311E6314B95;
	Wed, 10 Sep 2025 09:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DkuYSFHV"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C0730FC0C;
	Wed, 10 Sep 2025 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497506; cv=fail; b=EveWNwPYVWntdD6VVRoorzMDLC8zrV07M33TpGtKApWoYb2xsTOBDAVMz9w8XWhXNseBbEiGezXsuQbPQcXYs376AAg7mDivMOA0VA5KNM9zxYU/tcXF+7R8a4fq7G39Xfx5UmTwQMMgXlz7HJXXn1gTfOD+Z/0U30ZukGWUlBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497506; c=relaxed/simple;
	bh=8+lOF+7tZfB1bAPFP8Tw4p+TpFb+iaN20f0vA2nVKSE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jRqWRq2lDEXT+6sIT7W1h5ELDDjVIG/1/377PzXcH6L5/pStcmhAfNAStp+rml4W1AgfBdE6f1h+iHjc6gePILJcIrIryDQaKXDe/WNoidqFKsRuIZCcEJk9NsDU045MR7uo09ZYEOh/pCGXX/N6Q5rK/lb3m/2zfll4AVnYmXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DkuYSFHV; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECqFt363FCb49ySBmYTfIheyl7Rz0XbtJKqQWccxHNCmyn/DJC7jfO1x44mzfxTw2ToTRB4CMSRrUDc7UqA327w1feFLGZ+fWV3R1JeUmKQSIiin2isRU00FgqT5xZ9vyE96qkoHUawkvALItgzNXZoRLz7uowl0zyKMwCAWvR5Z24+tbyRcqDBJWvm96xYf9frv9mAdiZINlf52ivePnAPGD4i0N2Cf7JqbJhHUYDU2HhZSvGVVy0+vwcKG3yDgnXP/yaoA1d9pC5y7+FBf5Dj/o0P0pqBVmGlWuFmY/Avn97G07ueUTeckWQE0VANgSiH6NfOIbnqucRISoi0Pfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaIVmkqeYhA85YqRpqirjMhjI7ZBMVF8Hi7UPalITHQ=;
 b=qAMYz1B68kFclXt464fbJx27ntetZC9yWTH1PNeKcf7AAY9LCw5I9xjY06PJ39YfT/BXJj+ZAUohjm0Fd5zB8Pdah2+pxq1MpR5WaJKx3EgzuNz1e22KtYvpX2Xitw5+1Hlsnzfj5s99/JpE8w17+4eI7ENvpxkjYAHCMWJcFy5mYVLJW+4owzhGhcsKQVCpIQ9dIiDJ7QJxV1bD15oGut5BhQnlqLKzb5cfEbPvWwzVfmI0jKjqKJPo81aCHxi0QUtmH89NuHmvAGtDdXFuIo326nyAe8Nu/upIsHVTpTIIxzTAshqRN+sPz/i5PaP8WzqCsD8p2ldVv7RF+Xz2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaIVmkqeYhA85YqRpqirjMhjI7ZBMVF8Hi7UPalITHQ=;
 b=DkuYSFHVTouxXIAkVzRobLEy8Ka/NdeqFqeFKnPdqat22b1l+R0WI6BvLFCjfoc18HnozLbyUBy87i0mrG9UvBYNvcBi6NRMFIPknLIEf9oRgcZGmLm7x0gYTw7rh3x7CkeKnBNc/3bRJzM942m3adh2QB2HgROg4uwgucSGQivYkIqqosS5U2JFVUI3DHQlqA9QwzjsBTr4ULdEIBkRFQQuWtW2riJfRsrTc8Wn6kAK/hbCHwEcyLbgNBD/Er21Fb6DwKjGe2ePPHNHJpNXiKXoZNpa5lUsIJeZ/MV6iYZgoVi2qVpLSn1NS7uCAD31ZDwD9NNylOtfGw5EM61H7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV2PR04MB11834.eurprd04.prod.outlook.com (2603:10a6:150:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Wed, 10 Sep
 2025 09:45:01 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 09:45:01 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 10 Sep 2025 17:44:38 +0800
Subject: [PATCH 1/4] dt-bindings: media: ti,ds90ub953: Add new property
 ti,gpio-data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-ds90ub953-v1-1-a7813ffbdf11@nxp.com>
References: <20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com>
In-Reply-To: <20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757497507; l=1137;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=8+lOF+7tZfB1bAPFP8Tw4p+TpFb+iaN20f0vA2nVKSE=;
 b=hIV6/mWR7lMhDTj0KCP3y6IGM/Ji/g1nqPD53JSHFRqeSztgcKwz+X7umZ0+H3IR7YcJMEac3
 E9EeLslJwAuDl5Uf1v1QFEbjMwsux2i/daurHjsVpmZJ209yQCGxOhf
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MAXPR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::30) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GV2PR04MB11834:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c3a69e-ae1e-4a7f-043f-08ddf04eb654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2VrVC9JSld0cnYwZXl3L2dQdTdybTQwWFBUV1RIZDFZcU9jdng0TlRYYWI3?=
 =?utf-8?B?U3BHUVVmQjJKU1JlRlRmY3AwUE9MZ0NvTHpRVDhrRmpWMEV2YWRqTkNQR2hv?=
 =?utf-8?B?OW9VY2YzWXdZWEE5bDJJQkJvNTJQc2FCMlRHTXVBK0hwSTV3dkd4ZkNGdEJT?=
 =?utf-8?B?U2I2R1BDREgyYmwyenEybmw3WUlYZHhOa0lwckI1Qmp2VkRrWGtWTHpVemk1?=
 =?utf-8?B?citVY2duMkE3S2lUeUh4WGMybkhnYWw5di85K3RubERGV3pieDdnWkZrZld5?=
 =?utf-8?B?aE1mRWRYMVRvdFBmZzhnUTUrSEhqUDl3bGl3ZytSaFJNdlp0RmtsaW02Sm8v?=
 =?utf-8?B?QmlRcUc0YXYwL05IRit2T01YQ0k2Nk81bTR0YWR6RHMyTTVBQitCclRmOG5I?=
 =?utf-8?B?akwyNlhDVld5eHlFOGE0Rkl3QUNTVk9SbWIxZWVxaWFEZnNFYnZMVFcyeWov?=
 =?utf-8?B?THIvME9heERSZEYrd0pBOStUblhjRDJSYTc0QndHUFhtRzVZNHNqN054eGNu?=
 =?utf-8?B?dS96RDR2UGUyMWxjMFlIWGdMRzIrOHJqT0JvNXR1WGNoQ25DdE9yOTZOamll?=
 =?utf-8?B?alUyeEU2L1hWZDFwcFNrWEFyK3JLQ09ia2RQZ3E3M3BDUmFKYTk3aUhsQTRn?=
 =?utf-8?B?WEJmOGJidC9IVmp4RGxJS005TEpORytvUGNFOVRqM3JPamhJS1c5QnNQRjZ5?=
 =?utf-8?B?K1R6OUZmS3RIdzZxV3ozcW9jbXZqTktqRVRQQjd6QXVUNmp5YnUwR2tDeFBs?=
 =?utf-8?B?bE1QMWtzOTFZYVFVa2pWOHRMYS9PNlVLZHpoWkRnbDl4MXJtNm9hUEFtNXFq?=
 =?utf-8?B?Nm5hUzdDSWl1MWp1Zjh0blhzNFpyR3F2OW1aZTR4K3VJR1d3bGhRVURCOUVS?=
 =?utf-8?B?RGZ3OUlrRFRpVUZuUHloSERzTEp0T0V6RWtaOGtRUFpyYUpJbmRYQlVUdmlJ?=
 =?utf-8?B?T3g3UjZRZWw0dGlMMlE4bUwvamtjRnZKNnF1ZUtYVW9QMFJhVUxJN3VxU1A3?=
 =?utf-8?B?ejl6bk4rSll0dFRONms2UTJWQnZiSEdtcEFpSURST1FDci84NmlUQXZwUk8r?=
 =?utf-8?B?VTd0eXF6bmIvODhoUWU5aGdveGp0bzdqc216TlhFaUZhaDdRRFdSSGhtUVFW?=
 =?utf-8?B?dWpwa0QvRFpqdHBYOWRRblh2b0N4WEpHaDQvM1daRUxnZ0xkSDU3Y3Ywcmho?=
 =?utf-8?B?SGJEOTE1blVVZTZRL1pqMEpkdlVRZlIwTWticUxGRGlhL0grY29GVittOXEv?=
 =?utf-8?B?SlBuVTVUZUJFOXBtZW1NMXlLNUZHOVBuNms3TGIwSGpxUEJVclZNSmdDdlVj?=
 =?utf-8?B?eDB5WlJRSnU5OGdtL3lkSnpjTWU3NHdHZ2hGZXBlRWpzS0VxeTA1TkZFYk5P?=
 =?utf-8?B?YlN3RmkxbndjL1BEL0ozZmFITnNUSEVSUW5pS1RzQ0IzTWw3YVlEOXgzRFN0?=
 =?utf-8?B?Vk8zdzdwK0F1R1d0V1NwdUplRFZUL05PRFRTMDREUkI0N05ZenY1Q1BNT3lR?=
 =?utf-8?B?b3JDL3EzR25CVFJWVDh6YWl1aXAwRXlFdUdvZnNheTg2ekVoSVMzRDBiOFFM?=
 =?utf-8?B?MWcycjhUWklIQ3A3ekdhRmk2MHUwaEVnN1ZrZmllcEtsKzlQL3NXQ0I5dUtL?=
 =?utf-8?B?Zk9xU1I1djFQRUhNNnF2TDBJMkVQQjVMNVV6NEpJZTlJLzd5UnFXSTZKT200?=
 =?utf-8?B?YytMaGV0d2FkSFB6Ym54Qjd0RzVKV0VCSDVSYVlZelR4TGladlV0djVjQi9M?=
 =?utf-8?B?TjFJT2NNZlY4c0MwcFoxbEN0aVNjekYyOWozQU9XTDY3OEQ3cDNCVGEyZWtk?=
 =?utf-8?B?TWdSbldiTzlyVjMyTnBibTUrSHR0YkphMFpPYjhhRzlkdXNLN2lrN2ZzVnov?=
 =?utf-8?B?M2dObm5rSmZDbnNBWVBqVndYWTJKYk41dkJaRE81MWJwVGJKWERycmxSd2l3?=
 =?utf-8?B?a3dyL25aTHNWak5laWh3Z3NMTm9zeXY1TGJSMitEZ2duckpINzEzeTB0Zjk5?=
 =?utf-8?Q?7ubuwXbHEwy1o3VclKQgBn/tYvgD+g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVRrTmplRWNjMGxuNG1mODVtdnBDdWlxeVNoM1grdjd0YWRobElMLzhtRS9k?=
 =?utf-8?B?aGxXNHJreU5RRzk4dUQrTHEvUElQdUV0NFFCbStFSklqMVVobkhyTEJacjVr?=
 =?utf-8?B?NTBTRW1KU0NsNXV5RkhObzZEQ0llVjVRa1k4MlZGcXZ1bGJSam56ZnYxNmJE?=
 =?utf-8?B?VzcwazZLNUZrZi9WOU42ZlNtTm8yK0NNa2N5aGIzaldJRE1WbFQxSTViVHI2?=
 =?utf-8?B?YmIzc2l6cG15Q2tUYytXSjFpcDNjU1kzSjBYUHBWTTJGNlAzOXFvMy9zZmd6?=
 =?utf-8?B?NEI5R3lYTmo5WkxiRVdMN204K1lHRTRxWjBpeXFHT0tJdTh0MlpoMHV6U2Zo?=
 =?utf-8?B?a0sxcGhRM2psSllXcDUwcTRkeE1QRVloZmlDZ0pIWVlHbG9XcWxuck1zOHdI?=
 =?utf-8?B?cFhwdnBQdWFqQ3YwTW9PV3d6TWFWZ1hxNkJZTjhuOWFkNzBCcU40cEVENm42?=
 =?utf-8?B?dUt6dVZwU2ZtdUpUM0VMR2JzZU4weDdXOXpHckFDdW1kM0g2UitHb3RvTjBF?=
 =?utf-8?B?SXczWUh1NUtXR0NBaHFHRmw5RmJmdGxKai9Zelk1MW54bjNka0VFNHhKdE16?=
 =?utf-8?B?cUpYc04zbWR2V0NBb1g4NENrRzRxaHlRTXU2Q3hDWTBIK0dFR3FTVHZxK3pi?=
 =?utf-8?B?Tk0zTHRVMDkyS3NVY1grMkVjV0ZSdjhsK294dC9IMnh2NThCSFVrZ1NCSVpK?=
 =?utf-8?B?a3hXRjZJRFFPamRWa2Q5MzkxSEtiT2dJNGZSeE5zSnFhR0cvbmw5cllKOUVU?=
 =?utf-8?B?eVVENkxXVWVIaHNyL1J6U3RiV3NYZ0hKVTA2cXB3V21Ta2tkOUlyNDQrRC9E?=
 =?utf-8?B?RzU3NC9vUnQ2TnVzeG41Z291M21BZFg2T0lNOHZUNlBBRENYOTJWYVFyWmpw?=
 =?utf-8?B?MTIvenNiRkdHbUo2ekx3UHgvRjhURHZnL2pTcFFwcTFXaFZkc012aGhKVmR4?=
 =?utf-8?B?VVBNWGlYdmw5MU5SOUI3MXNGc1E1cmJmeVpaYUxxKzdyY3lVaVMrMEo2U1BH?=
 =?utf-8?B?ZEtlOHBWMENmVDI3RThkNkNFMDIxSU1qUkFQM0ZuNDFjT0VyQ3puRUprcUk1?=
 =?utf-8?B?NnFwWUc0eEZ4b1lSNGpxNm1LOU04ais5YzdRaUZpRTJXVTFSRjcyazI5Nml2?=
 =?utf-8?B?TDVvcCtNWFFqbDA1YWZtclRYWllrMFd2Y1pkZTlDTFJLdEJabGNaZThZNnRL?=
 =?utf-8?B?OHJVZktRV21tQk9NVHA3bFNwald1aUV6Tm5mWUp5c2FPVWpWdnBuNWhpRVBl?=
 =?utf-8?B?S25Ma3QwRG5UcTJkUy9vdFZ4YnJFb1dEMEpFd3VMTHU5aDk0QzhmK3AzSkVy?=
 =?utf-8?B?M3NnTHhKaWR4MHlNcmFaaEpWV2pzN0VmRVN5bzRkZTVuQ2NNTlpDS0cwWm9z?=
 =?utf-8?B?TFZ2a3NqbnQ0clg3bG9GcTBRSkw0bXFmK0hkWXkyY3BJL2lJZFRSSGRWNmlr?=
 =?utf-8?B?Q1dja1M1bHA0RXNjTGhGL1YzNkRFcWJTMm8xd2lUVUtMbWxPTTNQWHA2K3RL?=
 =?utf-8?B?MUJsSGIwendORlRNazN4YXpLVVh3eUZ1Yk12NEhkRVZpV1NWa3pMYk5SQkVw?=
 =?utf-8?B?c2hyRVEvVENrbjU5aFdha2tPeDg5TXlZRGNNUjVITXEya1VGVXFxakViK05u?=
 =?utf-8?B?Wi9QcHcxK0FlTE4xYzBaMmRSbDE1RmhYZGRFNCt0dnlZZFluRDBidTdxcElT?=
 =?utf-8?B?RG8wc3JGOTVDWDZIM05zNHhoSFZjZTdBbDQ3UjhweDlDRjU2R29mVklwL3R5?=
 =?utf-8?B?akIxenNJMTVoMHJDZkErSUV6cGU3M1FXVG1tZHJ0OWkyMFJjNkFaa0dLWGZN?=
 =?utf-8?B?bFkzdFJrNHdoMWM1aXRhYjRIdldlc1dINWVvSFV1aEV6SlZLU1pHQVcyL3pu?=
 =?utf-8?B?dHNDcnlia0RGSG85TGxBMEZ1N3JzbHpVVWpYNFVsWmdzdlBTU1IzTU5xUjhy?=
 =?utf-8?B?d3F4RDJ6c1d5K2RsM2g5aFpjSVYyL0htZEoydGNvL2lzOElnNVZxY2ZHZERs?=
 =?utf-8?B?eE96c2g1cUowWndDc0V2eXI1MVUrZkdoa2xSS3BTZTRsazBiejNzTHgzemFG?=
 =?utf-8?B?LzRaMW1iMXVsSHVRQVJ6UTBQb0JGMDFmU2ZPbXhnUTkwNzduajhFam1sSEMx?=
 =?utf-8?Q?1c3DSn0OGvLIyCTBdUVk8Dc/H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c3a69e-ae1e-4a7f-043f-08ddf04eb654
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 09:45:01.5632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNjL7mUqFLTMglo5pUtUfbgoy2SImeiMfMREMojE+TYdPHRam0D83v0yCaPPpZWSuuThtbEM+TZ49UVpBe9KBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11834

Add new property ti,gpio-data to let user select ds90ub953 gpio output
remote data coming from the compatible deserializer.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
index 2e129bf573b79e0ca8f25b4ec5fc6ea76c50abd7..7c3144677f11004468ed3a3fba74e6eee2d259d2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
@@ -26,6 +26,16 @@ properties:
 
   gpio-controller: true
 
+  ti,gpio-data:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    default: 0
+    minimum: 0
+    maximum: 15
+    description: |
+      Program each gpio pin to output remote data coming from compatible
+      deserializer using the LOCAL_GPIO_DATA[7:4] register. This property
+      has to be a '/bits/ 8' value.
+
   clocks:
     maxItems: 1
     description:

-- 
2.34.1


