Return-Path: <linux-media+bounces-19589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D91399C5E2
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27F211C2265E
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C71156C52;
	Mon, 14 Oct 2024 09:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ko3TPOIv"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E99314A60F;
	Mon, 14 Oct 2024 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898675; cv=fail; b=WfqUtDNkSPZu3iam7CkdJ3fgkZKbQl2mabzjy8xw95ZJclPyNww/02HyQi9YUZA16E5ZWh8DI8po13Iwe7Qh6YtNvPGjqF/pIT1vGBSRHfsUe1RT4/Q/WR0miPNaSXZbQlQ53zzFhCMW1WJkYiAWM3aBPLnEipOEeSfQQSE1PqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898675; c=relaxed/simple;
	bh=vl1ul6m55XQIeKJ6J+8iEuHVdAK2YU1GQyRNWLICOI4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Gl3tND0cXE7vKnsn+OgfAIhkkGsMnhKeWULyCymqvQdOsU5dB0Ekt2YUOq9eo2N364XS0mVYFwNxkUYiACfhl/6HX4ZpNVOFsh8FJfNYM//BlJ9MkQMgURuTMGgLX700FN1hAZwqukW2ReDTHZiFQ/R2+Pr1jpIZH8augZVwIOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ko3TPOIv; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSz3qVND0KqiK5JhqTpreHKEv5fUggMod1ggfpI5HvBjQd94gXMjFMsEedRY/4jzqsazuyFklH0I6EJGfjiPsR/DrC3meJcZXKDuXl8suIN70J3wa+tzTrPx0OOp8w5neKV5GXFgAZC0peUgWsmp0Z4eD2UC2DeWHyq9+f/sMXPJwkak0YDro7vWbEZS6jn0SJiN2+dcW+vF9pVpOnePVw0X2+Fmm9xq2riGnQg1KbUXduRWQZNQsz73rH1p+VcaCQOXToLwZn1TESq8lMhQ8FYiqn/5+6B/NnVHShqeIcoP51PLgtJb8KNghIXSkyzRVveM7xnZPtxxTxuRo7V1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjeg5TOemNnqanI8fbA4mHbFbmc9y1/bB20IN/as6+I=;
 b=VKvNH+0VHZ3s4lW5ngxiF3YK0m1BoAA7a2d+Y9yhfPaQQIcT1gzI6spN3PKf5vpCOjimJcZ0TaLzLmPymJt94/c95H2y0FnveSWjOGhEKGPUwqkpwCo53PHJzkkA0Y6W55etN9OoyKIYdx5fXYtX1aS4B7u4c0s2lBH6TaUBEE4Aue85EQn/Igis7tZtDYYnH6lZGHIsIlpbJwjm7LUAd7gdLnc3ye/04AOqiBGxwfxUtZ2TEhdVTW1p6hRH4FxnFB+L5yuXGP5j4Rc+YTs/nbHFZy08W8ZcY+INHyA1aInTRxq72jhkJlhbzOQUpeBw8BBQE5Q/CjMVpj3F04qUSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjeg5TOemNnqanI8fbA4mHbFbmc9y1/bB20IN/as6+I=;
 b=ko3TPOIvjZlnBVrNe/zJx7Kfbb0ghD8Pt1ALCG4tmpUavNpafCqx6Z2OJFGroB4CrqWcdmgOLzz5kuUnW0QtDOBKwTPyacCu9BxjzjEyUCwe17MQJbILUKbXbtGNZ+1wzliuzNmEAk1gyIJVjljXzBnHUXbjEhHIRiHEsTZEoV+F96e1acoqad4/2+fIsp4BF4quszjf4JUdqeRsmFLvCn64c47gJsvpDYHmBOrg/EsMi0DYYM09HkXtgqQioMal5mMCsHUxltLs/o0QCx9dYhZQZEUM9Za5HGqiif8YUtPM3Grca4utsq39uv1hYTCWUqS2DApZuTm6WA5rR81yLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV1PR04MB10942.eurprd04.prod.outlook.com (2603:10a6:150:20f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 09:32:24 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 09:32:24 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo@jmondi.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: nxp: imx8-isi: Add i.MX8ULP support
Date: Mon, 14 Oct 2024 17:33:11 +0800
Message-Id: <20241014093312.1588304-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GV1PR04MB10942:EE_
X-MS-Office365-Filtering-Correlation-Id: 3721d4f0-ef31-4096-a2f7-08dcec331c06
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?RFI0STZJOGhyZGVZVTVGS056VGVldmMxaVg0VS9nY0FoVm4yREh3djhpUytQ?=
 =?utf-8?B?ay9WZlliZlo3YzRMSHUzbGplZGFKRysxbXEvckhxM0Z3ZDZyRDEyTENQQ1g5?=
 =?utf-8?B?ZEUvUlpKL2wxWGZ0b04xSWY4RE1xR0Q2YlVNeFhTcXNvWkdRbHBIUUs4QzQx?=
 =?utf-8?B?QW9reVU4SEpKMHh2RGsrZDJYTXRiQWJ1UnRYVVRnZFJjbXBsamh6Q0VCQmRT?=
 =?utf-8?B?Ri9zakYyS1Vnbms5WjhCOFVlRWZUQjJ4R2t3aFBLWmRLVWtUc0Zxd1ZwNm1s?=
 =?utf-8?B?Z2h3cjRJZWY0K29Hdy9Xd0tuUW9QNEM2aWZBRTRmZEtkeWEvZlhQdGdoOG9G?=
 =?utf-8?B?NHRWTmlESjBCQi9wK2Z1bGMyTGkyR3NQL08yOENpa2RPNDBqdVFJRDlLZnJ3?=
 =?utf-8?B?OTArVi9xWTduRGpRbWNHbHd1SUI2ZVVUWlZDZlhQVEcwamtzVkkrOE9RT3pj?=
 =?utf-8?B?L3Z4MFg4b1R5VHF3MkxyeTBud0l6MktEZmhRUThTcG9qL25YL21yeFNCVjRz?=
 =?utf-8?B?WWFneUJaZWsxTENhdzlWeVVVNkx3RzNTZzA0c3hITVNjSHpWeVlabnNjc0Jo?=
 =?utf-8?B?U2VRUUZkd1RleDErbXlGNXM0ZjRrWUN2SmMvUlFjdXl0ZnphMDA1bWNiTXdY?=
 =?utf-8?B?NUR2N0VQSE12YXY2S0Z0Z3QxckFLMFdLL1ZncTRuNzZYTEUvSk9WendYMDY1?=
 =?utf-8?B?NUNQekZ1U1FjZEErQzEySnlGQzZZRFo5TTd2T3hRNnlZcWNsclRCNGNGc0hV?=
 =?utf-8?B?dzdDNU9laXVlVmJ4YTJpV0lCSFJnaWY5U29XZUphTjVNdEp3L0dSdDVPL29m?=
 =?utf-8?B?RVd1bmd2M1lWaDkwQVhlYUNDTHFOYzBHS3RBWDhlM0N4enRCMUo3WGQxLzRp?=
 =?utf-8?B?UlJ3MHlqSVpFOFQyYm16eXVJL1hPTDdNN09TcUhEWThINXNoRkYvK2RDSjlZ?=
 =?utf-8?B?aGlkb01jN3dMRU5xbUZwb2NYZmgzdDJQblVzd20wVTdKZTZNaVhRM004SFRh?=
 =?utf-8?B?WVpaeGlHTVFoVURBYndqVk8wNFdXTUU4U3I4dnZPaEV4MWd0c3k2bzRaNEJH?=
 =?utf-8?B?VHM0U3B0OW82azRDL29FVlpadHdnM3NhSUxoVTlFdjk2dDlVdy90c2Q2Nk9j?=
 =?utf-8?B?YWZWY2tQa3dSRzdVUlZlSGlsZ2FsR2puV2VxdXoxaDVSblJnSFJPaUNYWEs1?=
 =?utf-8?B?NkZwczJ2STUxdEticHlqUmRZK1d2ekdaOUNFbkViZjgzaHFMbkhiUjY1cUQ3?=
 =?utf-8?B?dGVaMmxuVmpSYjdFa1I1NjJmRlV0Z2tsMDErc0Q0V1gyOCtpakp0cVhDQWZy?=
 =?utf-8?B?R2VmSjZRbmNHRXIvdkRDN0V6akRZWWNjZTE0OWNkNjQ1YmlRMFowL2p5a25G?=
 =?utf-8?B?aS9mN1lacTNjTUloTmkvY2hKemM0RC95WDd2SDFQRUJGSzBIU0JNMzJ6T25u?=
 =?utf-8?B?UG1KZGZsK05OMXI3Q3U1MHFTZGFKNzdhTm9vWGJzdDgvZjBEc05DVURyZGpV?=
 =?utf-8?B?N2ZjY1NhZStBODM5STEwREFIMWpaaE1jSTlDTGF4VWFjQWRLK01tb0xsRGxr?=
 =?utf-8?B?RnVSWmhEWVhqeFRsOGtLaDBSZG9LZzFSMXRuUDhvK2NIWlljdHduUU9GQkY1?=
 =?utf-8?B?blJXbGJveWlWVHQ2QitlVm1pT1lNV1JBOGtBa2ZkSS9vV2tNa3BKcTZFQ1lw?=
 =?utf-8?B?QTlmQThFZ0hGQWlHSW1ERkJJNHVXRVJTWDdHNjRrTld2TlJGTEtCR01ZQmlk?=
 =?utf-8?B?Vi9aK2hHNWVJL1YzZTlCVXRVZno4NzF4d0JRZEsva1lTOXN4M015TWVMd0xX?=
 =?utf-8?B?UTFmdnpINnVmY2Y2Z01sUT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dVk5VlNtcGZLaC9mNmJVWEd0T0FyQlNVZW9HYzQ3MlFBU0RER0dhelJCZjBI?=
 =?utf-8?B?dDJmYjI0ZHJ6L2Z3K2VBSENRWnFBU2YzTmRxeTlEc2d3RTFnZkFzNHB0WWtT?=
 =?utf-8?B?WmZkRWlVcjE4cElKd2lOZVAyTmZtRDNhWlczcVIzZ2JXTmhoNUhKSEd6aCsr?=
 =?utf-8?B?S2JsYzBMc09yZWoxTTJnVk5OS2EzQmtqZUJ5UDFBMk04K25tUDhqRTlDUHlr?=
 =?utf-8?B?U2RqVVJGalVJM0JwcC9IK09OUGJDMEFqU0pxWVY4eUJQcWQrbzI5eWxsSW9a?=
 =?utf-8?B?TTR0dTJLVllDbHVKbTlZRkJSZWdaU2RVcUs1S2FGRXRXMmFySHAzckJGQlhx?=
 =?utf-8?B?V0ZQWkJZZ3BTWWVqcm0yTlpURVk0QW52SnFMUGNNMzRWeHh5L1NxOUwzeXNL?=
 =?utf-8?B?MFpWc1oxcWNRNmNhb1NYeldYWVkvYVF5bTZ0NTh6Nlo4UmtlZ2VudU9KUU5l?=
 =?utf-8?B?RCtKK1dEVFE5MEVpcWZkZUtSMUE2bjdybXE0RnV5b1VoYmdQTjh6ejJVU3ZG?=
 =?utf-8?B?MGZFbTZja3o2RWlOODA1UVR6RWxBMm5TVm0venNZVThCQTdPOXlvYTVDVENU?=
 =?utf-8?B?Y3RmV28wajY0Ny8wL3lBUWVMZEsxcGxIckJ5VWZyRk1WczJjQy81Rmt3ekhv?=
 =?utf-8?B?R0k0U2RKUUlDdFAwUW1OQ3VYS2duZTlXbWZSVTduNjhGRTlKSnJiaW1yZnoz?=
 =?utf-8?B?QStFdUlhVmNhVHcvTVhBMVRYaUxGWG1sZU9BeXpCNWZwS1VrOWQveDdnYlA1?=
 =?utf-8?B?bkRpZGM4a1crN24ycUt0RDY3MWpHdlN4emQ3VmI3ams1WXBkakdNVUF3ejFJ?=
 =?utf-8?B?QjcyVVJPZjFXU3g2elgzaXZ4Tm9lU2pabG8zUUFDYkNzdEt3cHhnL1BuS0dx?=
 =?utf-8?B?YzU2S0RSaXptM3J5VVZvaGVGOVAvRE5CNW9HdGY2V3Fkb3RLWFB0NitaUGxY?=
 =?utf-8?B?SFFjeXBCVXhrZUxwNmlNbFdNV0JnL0d2MW14Q2dvUkkzak4rdWFBdThFdjYv?=
 =?utf-8?B?R0xTTE1nRnNpZDFtTVByNzRUSFFpUmNNZkQrR1Z3RkpBRGI5TEVKQ29uRStn?=
 =?utf-8?B?TGZ2KzV5NEozTUpCMGU1WlAycE02bmNJdWI0L3RlWUNreGhGYUJwRUxkT3JX?=
 =?utf-8?B?ajduYUR1cUk0WitPMytTUHlucU5qL1UwL0ZWVFpzK1RpQk1jdU0rUS9GNnBE?=
 =?utf-8?B?ZWY0UHRUZXc4YWo4cUE4MjJtaGc3bGFjVDhkcmUvdTBXWDl5bmFmNEZYaTZ6?=
 =?utf-8?B?aHMyaW1UNnd4dG03ejZJOGhodlhZQmlsNkxzQjNvdThEajhHbExuRXBqSmcx?=
 =?utf-8?B?ekF1dlQ2Q2lFVER6TTdSVWpwN2k2L1F2WEJMcWY3SzhzK1V6TU5NNzRoT2Vx?=
 =?utf-8?B?Y2UrYmpQMm0raDhkclFna0RBdThQcHBLRzRCN1I3MkZiRmFCMzcrekYva3A3?=
 =?utf-8?B?OGlub0xJZWxCM3h4YkhMclY1TG85WDFyempkZkt0c1JHcXZ5czF0Nlc2amEw?=
 =?utf-8?B?L0d1ZHZ2MGo1MWFrSXVPaHFUVVh3cUNKdy9HQm5aY1BaWWhZMi9OaEU1ZGJQ?=
 =?utf-8?B?RGorV04xOEE2eVNLN0ozR1lSNW9IcEdPQnlONk8zQ3p5S1VoY3p1TWZvdUdu?=
 =?utf-8?B?QjVBN0ptMEljcXZOcUdyMklXQUlDSUVkdU1tV3NsVTM1Y2ZzbktySEdNRmU1?=
 =?utf-8?B?c1ZtNUVpUVJLc0xnTFdoWXVTN2xMZjJ4U1FrZzRZZ01iVjJSYlpzTkhtbHgr?=
 =?utf-8?B?ZStQeDdNenhsR05aeGtlT1lkSkttSHEwYSs4ZXR2N2J1V2VqdHBVOEhuMjRM?=
 =?utf-8?B?T3hYWnhjRmg5MGIvNklQOGVXNFZSbmliQmNPN00zdVorN3dYS2NtaktMK2do?=
 =?utf-8?B?UDhkQ3BZRHBPbDl3bkh2MG5IeDAwY25Sdkg0RGhPa3haamFnTGpUVHlwK0ZF?=
 =?utf-8?B?bzlGamVTTXhCdm1zYkdZWHVmaEJXS3VGcndOWEFidllWT1lpUTN2RkZ2elJK?=
 =?utf-8?B?bXo4TnRmNHY3YlFtNThXb0tUSkxsbjBhcFpXU3pENW0vck9tNWNFWjZFZlBF?=
 =?utf-8?B?OUN4LzVibkVjb0xEN2hPSFFOZHZiTVgrbi9RUHJaOGlGRUpVaW1yZy9Hbm1P?=
 =?utf-8?Q?oA4FcDCRC3JWeP0ewHi33C1Ye?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3721d4f0-ef31-4096-a2f7-08dcec331c06
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 09:32:24.1238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zcEraqNlWcT0WBILErr2dwdbqRAbiyOgHPB2cmGisBEIpyesVTudQaL9G4fJtSPO/s54gn48ly00I8nrLyzLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10942

From: Guoniu Zhou <guoniu.zhou@nxp.com>

This small patch series is to add ISI support for i.MX8ULP.

Changes in v3:
  - Add Reviewed-by tag
  - Change the author name from "Guoniu.zhou" to "Guoniu Zhou"

Changes in v2:
  - Correct clocks used by ISI, it includes both APB and AXI.

Guoniu Zhou (2):
  media: nxp: imx8-isi: Add i.MX8ULP support
  dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI compatible string

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    |  2 ++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 14 ++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
 3 files changed, 17 insertions(+)

-- 
2.34.1


