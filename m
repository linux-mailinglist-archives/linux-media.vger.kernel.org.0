Return-Path: <linux-media+bounces-42861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C852B8EC28
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 04:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6984160286
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 02:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361662EDD53;
	Mon, 22 Sep 2025 02:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Srxdlhhy"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9E22ED85D;
	Mon, 22 Sep 2025 02:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758507406; cv=fail; b=X0V8jc8NEuRn2r4X6OV5qC0ZAD+SkHR66eWmYIhPoJIk34FcdpioYyUZPxYUAcg50lhvEscjVAj7zhchJek37ekneDFEYirvDigw6NXx4lwI8jk+CESW+F4l6XPyCbK3e0O561cERNyGVFRg/1RweT6KE8FaKbNOYUoR17qU7wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758507406; c=relaxed/simple;
	bh=JvlHfWL2WSY+VrTh/9oIeOVc54RiaUenRiJMCniSsgw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gUz4TQIdh5fAJ6OohrDh/5EjZJFwqcmNpfnGy1PR6Fx13o3dIRLoODb1ncOfSODKnZgS/zXzC74YrC6eMsd4GDrf8zhfI8ug1S+5JO9mnE2EpaXJhy0HSzAGin5QoBBpL7ANVBv3WIGVrUqFjUSLva1Z3Ve5aIs17kF/TNtNits=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Srxdlhhy; arc=fail smtp.client-ip=40.107.159.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1ui6rXZaD4NIXONLJJvb+v6OxnaIeDspUAqW+3hEN0smEsh8SeMWvgyNeKjeGOGFS7rxxpYnWnxO8Z7jel3JaWlBajQ107eobNnO0GZDTS3nMZeG9kScV3rAI/8wXoTvvzJM+ChCfajdUHJwLqf70MZT0b8HayqSOeJRnUGHyOghqBYxtSigfPV4jWIcz1/fjJA31ZNkfZ9igkRrLidUkAoxnHybPFk0/lm4Ihyk/0V/SyyxiU5B17d4Nz1lM5hF6ryi6DwFMU/sscJY2PDSqWBdYBrwLjPVJy46c4o+/bMpzvIaeF2hkAukNh88r2ZmILGWZRKTZ9EcuBUeCiZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvlHfWL2WSY+VrTh/9oIeOVc54RiaUenRiJMCniSsgw=;
 b=K1hCvxGtUAKQgk8MD4MvxBmJhvh29EyFVWyKF4NQ5uRim1k74OiOo9a9350iZJsAwA1DhZh0KoyrSlX4oLmeLsnwbt7/bkH/yH/almLKlZsXnbwPxmsNBETRKCR3AYoeuRWvgWuwkF9sD2XGhgSHuV1mD9R8X873t4QEaAODoFnvGiOcjePPxaBM/p0wZ/FrwBrFkoqUjpFbZb/4WHvs4oRjgGdyqfjxxDQwuc0edMcELzNB8Vv2uOOOkHm/DkA9FBVP4+BY/LE7cVslFnqA60N/n8r/hN1KYH5dL4SryQUGfj45rDQ9BJGgOJ6txgGgpIe+7hd27B5rGx0mXM35hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvlHfWL2WSY+VrTh/9oIeOVc54RiaUenRiJMCniSsgw=;
 b=Srxdlhhy153KCR9rKA4IKbaDQkYBxereZu7JOcSHbTR0z1xcpeYof7OdFRMXcvEvkv1s9Cny1YJ5zqdR1LodTSjyVEsesq3Gntm3reKLFG1RgJImxBn2PeKbZI/lmXOxlZZMqLLCvN+724/wv8o9c4Woqdv9nc9YGQtS/rAoXbGfLrooIiPqWz8mExc3bBI2ndMaMWY5AY/wGT5dawOCNGWiQM88G5yIrcdTx4/8EsxJcLH2o75/jMnWbL3AKhqpZmS4LITdrqdHjEL4DGpbc+NI3M3tcNemfuq2cpIMiM+YFqAhM6SOtPXBxP2mrFmPxiJoUSiMyg02m8kVj8EyOg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8141.eurprd04.prod.outlook.com (2603:10a6:102:1bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 02:16:39 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 02:16:39 +0000
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
	<linux-kernel@vger.kernel.org>, Alice Yuan <alice.yuan@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 3/5] media: nxp: imx8-isi: Add parallel
 camera input support
Thread-Topic: [EXT] Re: [PATCH v2 3/5] media: nxp: imx8-isi: Add parallel
 camera input support
Thread-Index: AQHcHjI2B6O6Prp76k6JSzqRk76PN7SeTvYAgABCPsA=
Date: Mon, 22 Sep 2025 02:16:39 +0000
Message-ID:
 <AS8PR04MB9080EE291FED39F13086C473FA12A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
 <20250905-isi_imx93-v2-3-37db5f768c57@nxp.com>
 <20250921221838.GC10540@pendragon.ideasonboard.com>
In-Reply-To: <20250921221838.GC10540@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PAXPR04MB8141:EE_
x-ms-office365-filtering-correlation-id: 070d63bf-c940-4bd5-d505-08ddf97e1087
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MlpHUmtaUDhXc2Z2MEl4aTExTzVEbEZOUGZFNEt3WjE0YmtGUUp3RUorNVRM?=
 =?utf-8?B?ZmFpZVk5VjVIMG01UXlzNnBGNStKUGlwcmVxTU9UZnNua0NUdHJTdjRKcU56?=
 =?utf-8?B?SERRVXFzaWRKZ2RQaUtqd0c1bEtKNm5BcFZKTy9aTXhWTkhQdklLNjNVWWx2?=
 =?utf-8?B?a1Y2TUtXTDFST2tKUDlJVUZWWWhQWWJnTS8xTEN6ZUtKUXVBQlJBM24ycyts?=
 =?utf-8?B?TTROaHZJbTJMQ1Z5cWNwUFlVeUMzRlRicC8zaWhtbmloYkgrUHZsRUk0NGxs?=
 =?utf-8?B?cXIwTm44c1pUUG5CYjkybkpCQXppL29jZ2xCS3lodTZJb2J0c05xSGJycVpv?=
 =?utf-8?B?b2I2R3NwbVhhTDhxNkxNQmpGTjBYbUVPdlFMYnZxMHdyVldGVTBHMDRXWlV6?=
 =?utf-8?B?RnZuMFAzNUtxSEZPNlpBVzM4TGZiUERhS21vZ2Y5UmJpQWc3c3pmZ1NxbGI4?=
 =?utf-8?B?UDJXNzJScTQ3ZnQxKzk3SWtLeXk0cFFQMThQd05pWFhsU3NQczhacmd0cjZW?=
 =?utf-8?B?WndRSkN2NVlWUjRCVUl6a0paQzJjK3NnT2RVQktGL3NOclNwb0t2d1p2U0RT?=
 =?utf-8?B?Rlg4ZW5vVXpJREQwMWZRd1ZGMitmb2hPT0I3UGZZOTRsWjMzYlVNTU13K0pJ?=
 =?utf-8?B?TGZaWm45ZXcvMk92VG1LdUUrNFNOZGZ6UTdjNzYwT3NacGR4clRYdFVVMHRX?=
 =?utf-8?B?WG01ZDd1NG8rUk4rR3F0Ynh3L210SlIxNy90K2tJM3NVMEYxUXI0QWdzekFC?=
 =?utf-8?B?bUZFQTFCZURIQlpUSmkySTdYeWJ1UWpyQk1pVzExeFNXN2dvR0N2Vi83ckw4?=
 =?utf-8?B?Y3QvcjJ5VUVyeWFUOTVHVi83NEdkMVFtYlRDQlc5VlhoeUVpcFlLKzVMOGFa?=
 =?utf-8?B?dkthaGxCVTJlZUZucldvTEtPSStjcFZmTm9MNUc4TGJlTGMyTHdmM0FjQ2Fo?=
 =?utf-8?B?ZnVYMzFROERWRmVUS2RNbVd1RGRMb0g4YUVTR2Q3WUJXS0YxYmlXbWY4ckd6?=
 =?utf-8?B?eHlWVGExWStsbXdia3Fyb2hiSUhxVCtnNERnSEJhR2VFc09KWFFDN2RlRzlU?=
 =?utf-8?B?WDJlTUpaZFJ4dEd5bHFxek1jdDBhZVV5alZiajRMN0NXdDNId3NuTXRBNzQ3?=
 =?utf-8?B?SE9JOFVPdURidTEzcjRMcFJ0dUE0VTI2Wm1GOWxDSU9WTytVMU9jK1NBTkVU?=
 =?utf-8?B?b2NuV1BBUkU1OGtWNTRodkRPWkkvRFNDWDJFaWFVajhJTWhrWjdBaCtCcUVl?=
 =?utf-8?B?RGRJc2JiMk1MV1o1WHJVdmdRQmFpNllEdE5zMmJSQmJkQkNPSnRiY1BaMzgy?=
 =?utf-8?B?dTZFZWFOY1hpdVBmU0hCTTZ5R1BPMkxvZXU4SEZkbHJJWUN2SmlHRDNwVmVw?=
 =?utf-8?B?SmtrUDV6UlA4SDJQZ2dKOWE5QktONlJHb2FTYms1NE9Vb1IrcjRDQkw5U0Nh?=
 =?utf-8?B?Yzh4OFN0c1pWbENRMEVFU1NIYnNIaTBRK2VTZWxGR25xL0V3REJWc2NrSmlT?=
 =?utf-8?B?NkNNaEV5RjFvQWgrWWhTWTdQUWJNNVh0R3NVVDEydFRkaTR5Q2duN3lqalFB?=
 =?utf-8?B?TlNwK1pYcXI5d1JzeDdXSTdDTmNlaUtFeUJDcFYzVEVCY2R6bWdidjlNYmxo?=
 =?utf-8?B?L05iSVFFZkxsMjZ3bFN1SW1iTUZyTTNVaXlyei90WUhqR0ZJMlc3VXc2cWQ0?=
 =?utf-8?B?aWp3amNHazg1VllpdFlTVnZPQ3JveTRWMWRpRzhMRTR2NGh5ZFk1OHRWQUda?=
 =?utf-8?B?VGxCS3Y4cDg3WGFMcjdxVnVLZ1Zrck90dU1sRVBUcFdxWmF1TlBuZ2djbjV0?=
 =?utf-8?B?bFVPVm5RaFlmcFNtQU5sc0JnaFBuUk1acTNpdCttd3ZmQVpVenhpM2QvZERY?=
 =?utf-8?B?NjFtSm9uaTUyaTd2STZlRU5IN01yNXl0SVhMaTgycTUwUWNCT2loTDBnQkdT?=
 =?utf-8?B?enY0cHpmU3d1ZTBmdWpRbWsrQlZsOW85Lys1U09QMHEzYmNzeVB5WjBvVnVF?=
 =?utf-8?Q?Tz4HTUd7GveLP9ms0B5sgzqXHgp08c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1V6TmFzcFhTQVRZaTZTUjhpSElnUEdydmMxR0NnRVQ3S3JpdnhxRmx2b0hz?=
 =?utf-8?B?SEpoa2NFZDRuSmVFOUJ5eGRHOHBmRWQxVkJsSUhjT0Z6WG5KZDFWZVZHb2E4?=
 =?utf-8?B?TlVZZ0VTZVdKVEpkaFg4S1FSUDFyUkhORjcyaTJZaW1uLzZ6V3NQekNHVnlp?=
 =?utf-8?B?RWxVTjBZY2tIVlR2QUhsaytEUWpFenhieTQ2eTg1TXkrU2VJL2x1Q1ptZW8r?=
 =?utf-8?B?MHc2RDVIdzNLZHQ4KzlrNWtwd1RRTEFSRlFTU044Q2V2d2N3VlVGNmZTNFRn?=
 =?utf-8?B?RjJnbWhNQjNEeXpneFZsamd4b0FVM2F3MEVneDNrZDMxd0I1SDhWSDQxMElx?=
 =?utf-8?B?ZjVCc0hQT1ZmeXRRalB6WXVGcjB5eHFhWnlOcTlQZk81dkRtcThPeW5JbWgy?=
 =?utf-8?B?Wk1PN0wzOEpxMjNpckN6WUxEVk1GWmQ5RjlBQXFjVkxJZUlxc3VVUWlGZEpK?=
 =?utf-8?B?Z0U2ckFNYUphTG9QUC93bUVmV3JCNmRFTStQYmIvTDgyb2Z1c0pmWTIxSFd3?=
 =?utf-8?B?VkpVbEZrMEY1b0QyelJkUXNsSVpsNldyN3FlYWpuNXlPcFlUTHgvVW5QcU4z?=
 =?utf-8?B?NUs4TStSS1RYNWxKN21uN08wejBJcEh4TDIrbTlEVkVIdmJjTHhTVlJIOG8y?=
 =?utf-8?B?THlFTkhITzFiU0hVUnFkMU42dEJHbnRjTjdYQXBNUXYrYmJaREEzbHZzL1Bo?=
 =?utf-8?B?WUpCeTZ0WHo2MVFIbjNmRmhrcy9vdnhQUDBMWVZ1dG10MFJ3c09RTHYvNlRB?=
 =?utf-8?B?ckdwY0psazFWMDVweW5WUTliVDRJSnhkUzkzbVJoNmtzUjVlbVFRNjZDRXlQ?=
 =?utf-8?B?NUxsdDhsTzhGalQ4UGtUclFyM1RXS0lOcStGYyszNW1ITFlLZjFMV29zRldv?=
 =?utf-8?B?MUc1dHJGTHV0UHBDNm04dGE5QTh3QXd2cFByZ3ZvR1FyU3dIUGdtdTkrMHBE?=
 =?utf-8?B?OEhWdlczNWhEeHFqR0FCSHo2ZVBnYllMT1didVdmZ1hMNWRwKzVDUGlyUzky?=
 =?utf-8?B?REM2UXFkZDlpaEdiY1VveGdJMTcxalM5YnZ2czVIcDd1RG9MNzBXN2ZGRk81?=
 =?utf-8?B?L1IzbTlDMytabjh3a1pSTUtLTlJBWjk3SmlaOFJQMXdETnQzQW5PZUwreXI3?=
 =?utf-8?B?eEhIOVA1VUt0TTBUQ2ZlcGJsWXZsOURGclZkUER1NktyamNhRW1mK1RoVFA0?=
 =?utf-8?B?c0ZMajBLbzVTN3FzVXhINXM0UG8wZkdGeWNZMk1CNWUySjh0UUp3Nk1kdkJG?=
 =?utf-8?B?RE9lZ0RFT2R2U05vQWdQL0RkWURoMFErSjhmNm9vcmJDdERlKzR5Z2JXalh3?=
 =?utf-8?B?WWdlOER6dUZidjNXai9oTVhPZE9vZnZrZmpNdk83dzhVWWR2cTNWTGwwbnJT?=
 =?utf-8?B?dHFVV3FjbGxqT0ZKRnpSSWZOMTN4dVNmanRpd3R1YllMZjJtQ1JBUHhNeS84?=
 =?utf-8?B?VnpQVjJHaUVueHBrMzJMQXIxeWJtbVVFY2hxa3kxdFoxNmxtcUhnZndlL0dV?=
 =?utf-8?B?cGFKeUR6WUxRWVl6Wks4RHVpQWxGVDFScW92MzZrbkVYSlpGVThpZjBGdkkx?=
 =?utf-8?B?R3h3REd5QXFhMVBMRGVTUnlGMzlIOSs2Z3lZVldRMUZqSXdURDBIWDRieHB3?=
 =?utf-8?B?Vlg0akRrYTNsM0Z4TFZXc1dQSEZzY2Uvb2wrVWpTUDhYK3AzeVVsVHFvK0hp?=
 =?utf-8?B?c0RvVUZ2TmpMS253Q2xzVVVZNklUMVkvQ3NreURlOXF0NTU1QkhOcXAwUER6?=
 =?utf-8?B?QStkV3VSOS9ZcXpjRmpEM0xHYmRVNXdPekN3N1NMUG9DVk45OUtlRWFyaU03?=
 =?utf-8?B?NE13REFnZEdISlVrTElJbGpCbmxoNjNRYm5jUmcyajlJajJEWEZ6RDRzcXFX?=
 =?utf-8?B?T3dibmxzUHBvWnhYdmNBQldjYlJsdTFvNjNUVTJWU3A5ZWRZRXZFQlZqWUMz?=
 =?utf-8?B?b2MrUjFGZTN4VWQwMXdsZVRTUVFrMFlIQVVKYkZxRDBvVzVOaDlwRERmNlJG?=
 =?utf-8?B?QUxId0NJTXNnZmJsRVhyNGxDKytaSk1OSmFkRmtLWGtpc3M4NnZtZzltazhD?=
 =?utf-8?B?TWNobkhQNGE4WDJ2WURmdzE1czU1VllEWWlmRm1mcjVoSlptOUkyRU0rQ1lF?=
 =?utf-8?Q?I/qskuuHSGSilRExaK2E6m1gw?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 070d63bf-c940-4bd5-d505-08ddf97e1087
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 02:16:39.4906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AynsXRlZYJqfpdVCQ/xi46NxrE3T882fu4cs0d/TMnhRs8ypj0+g9EUILz3iDB1CAPxJBACvzm7jjllQVHJksQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8141

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDIyLCAyMDI1IDY6
MTkgQU0NCj4gVG86IEcuTi4gWmhvdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gQ2M6IE1hdXJv
IENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgUm9iIEhlcnJpbmcNCj4gPHJv
YmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47
IENvbm9yIERvb2xleQ0KPiA8Y29ub3IrZHRAa2VybmVsLm9yZz47IFNoYXduIEd1byA8c2hhd25n
dW9Aa2VybmVsLm9yZz47IFNhc2NoYSBIYXVlcg0KPiA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47
IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJp
byBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBGcmFuayBMaQ0KPiA8ZnJhbmsubGlAbnhw
LmNvbT47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7DQo+IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEFsaWNlIFl1YW4g
PGFsaWNlLnl1YW5AbnhwLmNvbT4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2MiAzLzVd
IG1lZGlhOiBueHA6IGlteDgtaXNpOiBBZGQgcGFyYWxsZWwgY2FtZXJhDQo+IGlucHV0IHN1cHBv
cnQNCj4gDQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtl
IGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBvcg0KPiBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVu
IGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQgdGhpcw0KPiBl
bWFpbCcgYnV0dG9uDQo+IA0KPiANCj4gSGkgR3Vvbml1LA0KPiANCj4gVGhhbmsgeW91IGZvciB0
aGUgcGF0Y2guDQo+IA0KPiBUaGUgc3ViamVjdCBsaW5lIHNob3VsZCBtZW50aW9uIHRoZSBpLk1Y
OTM6DQo+IA0KPiBtZWRpYTogbnhwOiBpbXg4LWlzaTogQWRkIHBhcmFsbGVsIGNhbWVyYSBpbnB1
dCBzdXBwb3J0IGZvciBpLk1YOTMNCg0KT2theS4NCg0KPiANCj4gT24gRnJpLCBTZXAgMDUsIDIw
MjUgYXQgMDI6NTY6MDBQTSArMDgwMCwgR3Vvbml1IFpob3Ugd3JvdGU6DQo+ID4gRnJvbTogQWxp
Y2UgWXVhbiA8YWxpY2UueXVhbkBueHAuY29tPg0KPiA+DQo+ID4gVGhlIElTSSBtb2R1bGUgb24g
aS5NWDkzIGltcGxlbWVudHMgb25lIGNhbWVyYSBpbnB1dCB3aGljaCBjYW4gYmUNCj4gPiBjb25u
ZWN0ZWQgdG8gZWl0aGVyIG9mIE1JUEkgQ1NJLTIgb3IgcGFyYWxsZWwgY2FtZXJhLiBUaGUgc291
cmNlIHR5cGUNCj4gPiBjYW4gYmUgc2VsZWN0ZWQgYnkgc2V0dGluZyBjYW1lcmEgbXV4IGNvbnRy
b2wgcmVnaXN0ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGljZSBZdWFuIDxhbGljZS55
dWFuQG54cC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b25pdSBaaG91IDxndW9uaXUuemhvdUBueHAuY29tPg0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlz
aS1nYXNrZXQuYyB8IDExDQo+ID4gKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1nYXNrZXQuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktZ2Fza2V0LmMNCj4gPiBpbmRleA0KPiA+DQo+
IDJmNWU3Mjk5YjUzN2Q2MTJmYjFmZTY2ODhjMWI3NWJmZDJkNjA0OWIuLjQyYjJlZDJiYmRmNzI1
OWJjODNkMDY3OA0KPiAyNTYzDQo+ID4gNDNhM2I2MDY1NjhhIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWdhc2tldC5jDQo+ID4g
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktZ2Fza2V0
LmMNCj4gPiBAQCAtNjEsNiArNjEsNyBAQCBjb25zdCBzdHJ1Y3QgbXhjX2dhc2tldF9vcHMgbXhj
X2lteDhfZ2Fza2V0X29wcyA9IHsNCj4gPiAgI2RlZmluZSBESVNQX01JWF9DQU1FUkFfTVVYICAg
ICAgICAgICAgICAgICAgICAgMHgzMA0KPiA+ICAjZGVmaW5lIERJU1BfTUlYX0NBTUVSQV9NVVhf
REFUQV9UWVBFKHgpDQo+IEZJRUxEX1BSRVAoR0VOTUFTSyg4LCAzKSwgKHgpKQ0KPiA+ICAjZGVm
aW5lIERJU1BfTUlYX0NBTUVSQV9NVVhfR0FTS0VUX0VOQUJMRSAgICAgICBCSVQoMTYpDQo+ID4g
KyNkZWZpbmUgRElTUF9NSVhfQ0FNRVJBX01VWF9HQVNLRVRfU1JDICAgICAgICAgIEJJVCgxNykN
Cj4gDQo+IExldCdzIHNwZWxsIHRoaXMgb3V0IGZ1bGx5IHRvIG1hdGNoIHRoZSByZWZlcmVuY2Ug
bWFudWFsOg0KPiANCj4gI2RlZmluZSBESVNQX01JWF9DQU1FUkFfTVVYX0dBU0tFVF9TT1VSQ0Vf
VFlQRSAgQklUKDE3KQ0KPiANCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gDQo+ID4gIHN0YXRpYyB2b2lkIG14Y19p
bXg5M19nYXNrZXRfZW5hYmxlKHN0cnVjdCBteGNfaXNpX2RldiAqaXNpLA0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdjRsMl9tYnVzX2ZyYW1lX2Rl
c2MNCj4gPiAqZmQsIEBAIC03MSw2ICs3MiwxNiBAQCBzdGF0aWMgdm9pZCBteGNfaW14OTNfZ2Fz
a2V0X2VuYWJsZShzdHJ1Y3QNCj4gPiBteGNfaXNpX2RldiAqaXNpLA0KPiA+DQo+ID4gICAgICAg
dmFsID0gRElTUF9NSVhfQ0FNRVJBX01VWF9EQVRBX1RZUEUoZmQtPmVudHJ5WzBdLmJ1cy5jc2ky
LmR0KTsNCj4gPiAgICAgICB2YWwgfD0gRElTUF9NSVhfQ0FNRVJBX01VWF9HQVNLRVRfRU5BQkxF
Ow0KPiA+ICsNCj4gPiArICAgICAvKg0KPiA+ICsgICAgICAqIENBTUVSQSBNVVgNCj4gPiArICAg
ICAgKiAtIFsxN106ICAgICAgU2VsZWN0cyBzb3VyY2UgaW5wdXQgdG8gZ2Fza2V0DQo+ID4gKyAg
ICAgICogICAgICAgICAgICAgIDA6IERhdGEgZnJvbSBNSVBJIENTSQ0KPiA+ICsgICAgICAqICAg
ICAgICAgICAgICAxOiBEYXRhIGZyb20gcGFyYWxsZWwgY2FtZXJhDQo+ID4gKyAgICAgICovDQo+
ID4gKyAgICAgaWYgKGZkLT50eXBlID09IFY0TDJfTUJVU19GUkFNRV9ERVNDX1RZUEVfUEFSQUxM
RUwpDQo+ID4gKyAgICAgICAgICAgICB2YWwgfD0gRElTUF9NSVhfQ0FNRVJBX01VWF9HQVNLRVRf
U1JDOw0KPiA+ICsNCj4gPiAgICAgICByZWdtYXBfd3JpdGUoaXNpLT5nYXNrZXQsIERJU1BfTUlY
X0NBTUVSQV9NVVgsIHZhbCk7ICB9DQo+ID4NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBM
YXVyZW50IFBpbmNoYXJ0DQo=

