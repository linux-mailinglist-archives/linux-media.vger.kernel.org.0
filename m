Return-Path: <linux-media+bounces-15100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE86C934674
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 04:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADCF2B21D18
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 02:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5776C28DB3;
	Thu, 18 Jul 2024 02:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WRcf21Cu";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="jnlH7aVV"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFA129CFB;
	Thu, 18 Jul 2024 02:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721270209; cv=fail; b=azPJ75vZ710H1Ydq55q4Lv7CtRpkCbpmTaY0o/sM/CYW7eMqOE4TQbKWqRglk7j3LSxagcB5QBV/R6sgRuzfjch6aoIVgD3h6nVh/GhfHHQU8sPM8d6JspfbL47+z60b5TvvQ1bLBx3RLa+6u7CjXFaD+U7fKEDlO7d9dm3S5io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721270209; c=relaxed/simple;
	bh=QJbH3a8oeUAkcq0Mv+9/j+qSdIauOWH/UIVNGzN1fpc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I3dsDCPt+9MbOLKBXWVZgisj5R4E/TPM3nqDmBpbLBKAf1kBtS9SNY4y1Y8mRzH+o0wNGTK+yUM6J80GICzPLUdhexyGuBk4nYlCQ6CPVM42BEpL7n0rb9Hl+MtPLT31JJIId0UYWcdkP8kWEzaurjX0GXfweRmFGO+jlB2+iFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WRcf21Cu; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=jnlH7aVV; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 905a6a2644ae11ef87684b57767b52b1-20240718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=QJbH3a8oeUAkcq0Mv+9/j+qSdIauOWH/UIVNGzN1fpc=;
	b=WRcf21CuHyxkkUghGjoOwSmPEsJtA71xih0iGkuw47f66MS6QIF0ziqniJqBZIK7dWbzIhyRnTPASehG2x/7R6uMU4YMSdrnPOULDOm3dnd0w7b51eAv5rqO3FaPpDNRALMJ8szIcFRhGDeAeUJDcAfW/EYWLwxbeGYIqVnnoa4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:d535bc3a-4e6c-46b4-8bd6-8c796487250e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:b1cf960d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 905a6a2644ae11ef87684b57767b52b1-20240718
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2111746169; Thu, 18 Jul 2024 10:36:40 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 18 Jul 2024 10:36:41 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 Jul 2024 10:36:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/LjTyTJNZjzz1NpGCtich6PFHabqlhznhkpetSK8nCr3ErmqfncevYBUKACDrKfOoZ1BAETG8fscJIRki4gvFQOv+21ElTonTMLz4lI73rxK6wAj57rPaOMoHP91LjJnh7WBUvoGy+6XVkxKE8VycFS20gEKGlz4L6xZ2NDiZXfLloAHrrbGvVqN+5b2WAydZb2UT2MoAlVbtLT4uDtDf6ZvAGNO3Y6trLvaRdhk1GpBLtSBByzuMkvqcrxYBPE+VHPtq6L7bQGcU3A4BE5EX7DbxZBBftkQsO52IvX9/YyGkmlNkAUKGFnDmfgs9pJ67oseJUvwKARcdBcErQaGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJbH3a8oeUAkcq0Mv+9/j+qSdIauOWH/UIVNGzN1fpc=;
 b=YuGnDRm7kn/76+ZbnZpHuy2SZpEEcYhTbKpUQpYMxT0S7EMT00bK3SMQ3caGD4ywCtEy4QAjCmBpj68iRvfqXyXJjHXIUZTT1rNpb3V2kKPzX5UVnVjq4b1tv5j/TdruhTgZ2HdgeEuSLSgrPtIRUi7xJWlt2zMZJlOhrfIXP5ibc5kYbTMoO7L6o4UeCGVw1LwHWSJ/bjRnonUyO4gE1nPFxC9F3qRFWV0KfSAHmkqGMywySybp13bmPcXgQk8Bz3Uz0z393iDKAUf1r2p0VoJLCPhcZ/txclpuBpi8iO3ADqTuhKB1GctskeThZNgn86UuX6jQpXiSmdogu4LqMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJbH3a8oeUAkcq0Mv+9/j+qSdIauOWH/UIVNGzN1fpc=;
 b=jnlH7aVVKXvIa8f7Se9xUlXsQwKTJw8D1QUHp6EPsO4nRIw9GaMrHn2gboFK1R0brq2gdw/207rcKjSJ+OUq+sytu3tcGc6/I5bgPIUTktDmjw2tTGNRSyDMn5mQNsd8c0/5JoTtL6dWspWyy5bhXuYlKj/X7005kND9otillOY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8478.apcprd03.prod.outlook.com (2603:1096:101:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 02:36:39 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 02:36:38 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"jstephan@baylibre.com" <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, "pnguyen@baylibre.com"
	<pnguyen@baylibre.com>
Subject: Re: [PATCH v5 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Thread-Topic: [PATCH v5 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Thread-Index: AQHazhd5l4rc57nWtkWApqQhVYkmorH72nCA
Date: Thu, 18 Jul 2024 02:36:38 +0000
Message-ID: <22178efb11985153e99cee158102b9da50efeff4.camel@mediatek.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
	 <20240704-add-mtk-isp-3-0-support-v5-3-bfccccc5ec21@baylibre.com>
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-3-bfccccc5ec21@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8478:EE_
x-ms-office365-filtering-correlation-id: 886c3a4b-a003-4c6f-6196-08dca6d2735e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WVRTNFdZaE1rOFpzUVBwNmVKeXBTaDgzR3Rtb2N5ZE95OU5odEhqcE9oM2hm?=
 =?utf-8?B?aFd2ajJFVE5Rd3IxYnc0RW5nRWxpbWttZlFCU2gweE0vZ3FWenQ4VmpGMkpl?=
 =?utf-8?B?cDZXRmJWMDJRRmF1d2xmQVd4MW9XalQwbzArbkVGdDhnbzE5bWFtek1vVFpP?=
 =?utf-8?B?WG9Td01hWk9OdkRqODYyNk1jZUowb2t1QkhYaWJxQWh4WWhoVUZBQ1B5UE9H?=
 =?utf-8?B?M3dMTTY3dzF1NEV3TDRBcjJGWm1YMVlXME16MFNJa3dpTHdXY09nZW9OUzNs?=
 =?utf-8?B?azFFRXgraW5BSEZXSm9CemdGaHgrbXBsNUJCQldHdTVrQ2xCbURjRmc3RlVv?=
 =?utf-8?B?R1lXajNGSm1RSllJeFdXSm02TWRHc1hvQyt3L0U2UXFCTENKYzVZNjhKV1pO?=
 =?utf-8?B?c2hGREdUODl6UURjY3luOTl3Sld0dUdKUm9IS0x5WUtlTVJLM2R6MjkvUkFj?=
 =?utf-8?B?M2h1bW9KUHZTcTQ0R0NSZ21WbE1COUVGSTF0Z2MxcDBEWEdKeHVKY215aXdP?=
 =?utf-8?B?dWV4R0FNSVlsazFHYmlwc2cvdjUyNlhrcUZLbk9aV3dsNHQ3ODBVbThhOGIw?=
 =?utf-8?B?SGVhUG1NYlN3QllaYWZiMXdWRDlaN0tsTGJYREpUN1l5NVoxbVp1VFhKKzZI?=
 =?utf-8?B?UTJHR0dQN2JRT2VRZnR5Vys1UGNuSGVFSHAvb3BKS2kwTE9XdG83T240NDdZ?=
 =?utf-8?B?Um05aU9TbXYwd3pDVEs2VkJYRFAwdjZkZ0JjNHRpanpNaXJDZDFPZ0FSK2Rw?=
 =?utf-8?B?OXlWbmFLN1ZsRGVvSGVXQVh4OGRsdDRZTS82cTdhYklqR044eFdyL1lGcUEv?=
 =?utf-8?B?d3N4U2gvME9oZEdwUVFtVXZ2ZU82bGUyL1R6REZBMjllVDVEdU9OYjJYM1Uw?=
 =?utf-8?B?c2NwZzduYVZCVEJsVi9YczF2RnRSL2NXQTcxM2hPMUxNOFpzbVM0TkxxTG1P?=
 =?utf-8?B?K1djR2RwTjdvajJlYnBxSmdmd0xRNFhza21Cc0k3S2EyMHZIY2drUms5SkRn?=
 =?utf-8?B?d2x2YXJweklmN3JMOSt2SDdsUjhvTWxjZGdEcGxsYlYvQ0xoMEQwVTQ3MU5S?=
 =?utf-8?B?eDQ2N1pKRjJHS3doalNOc2RVZkpTMVNKclpkTkpDNFFZeTlJazRkQml0bUoz?=
 =?utf-8?B?bmptNm9URVdlZUZRU1VJV2RHZklGbjlLcmlLS0VDTzNRUHlpRlJiWEN0Wk5u?=
 =?utf-8?B?eW5HeGZZaGcrRFFqMm4yOUd1MjBxUzVzUGtxZXJKUzloSlJVTjNKYlUrTU85?=
 =?utf-8?B?K3V4NnBBODBxd1M4NGRSY1VYR1hGQkowZ2FoclhsTlA1bjZRT29YdFZDaGQx?=
 =?utf-8?B?VG9wQmNtWWE3ajhybWI2ekNFN0NKR2E2eEtScWdvSHZjR2dET0QyeTNFSnVP?=
 =?utf-8?B?aUczOUFxekVOT215bUk4TWJoN0tOcVg2d2FaYU1tajZVMExBNDc1NC82dm5s?=
 =?utf-8?B?TUMwdkJtSGtFNE8ydllOZTdJRjVZampsdlY3bDdsWnpSWU1YSVRFWStaZk9n?=
 =?utf-8?B?K2JvZlBUUjRENkpqdmwwRDhPNHVFdm80a043ckJlRVNGeENVOU1adEhJbmdo?=
 =?utf-8?B?WnowYnN4MThkMUNCTlJ1cFRhU1RqMUlIWks3TWhEWkVCQWFxYlI0azhXNkdB?=
 =?utf-8?B?emZBcU9aY2hzVzJJbno1R0JXSXF0TU9NNkRBd1p6SEk4d00vdFlHRUZtUXFE?=
 =?utf-8?B?TndWU0RjMXlwdHdWbUUxS3lKQk9yVkZCejl5VkNDKzJBaEFpOWJqeXVlMTdu?=
 =?utf-8?B?bTF0cUpoUVdPNzV5Zk5YQ3dCb2l0SWsxVEN1VUVFMHlaeWVsdzFKWUs1ZytH?=
 =?utf-8?B?a0E5c24zMzBEdFUwc1JTbUpweGROektNRVdaaHNHMUJSYW5wV1JYcThkV1dB?=
 =?utf-8?B?MStmREVqZkUrQW1OYXh6bnFaQTl1OGlmTkwxRUJiZ0p3Umc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFlFandqcFQxakI5cXd6Yi9LNk1OWXY3endzZ3QzN0hsL1Vhb2dFN2VFbzJq?=
 =?utf-8?B?K3ZubmdueGZaSTdrdVlNWEM1aUZlbG1PWFcwRElIcm95QUZOZnFnby83bnpI?=
 =?utf-8?B?SEt4S1g2aTQ4aXhyQ0p3RWtxRzhpd1dJYW9qbjVyTVgrZUtLVk42bkVwL1hI?=
 =?utf-8?B?Y0drUjBydXo5MnFrcTJSekFKK00xK0ZxdEZpb21PZ2lna2Y0QWkrSjA0UUZw?=
 =?utf-8?B?STFHY0FiRzF2V2N2T1RzTnZ4bW9DR0laeG1sdmtaVTVVSEY3MkVKamFRRkla?=
 =?utf-8?B?YWhqSDd2eWU5MXp3aHYybGlCSWlsMUtKTm1wVWZpanhQV0FWYitDTTNFOStu?=
 =?utf-8?B?QkdKRytrV1pEdTUxdWZYeVlLVlRLK0NyTFNDeXRPK25Gd3N0b3o0UjhCNWF2?=
 =?utf-8?B?UTRKNjBlbHM0SHRDcS9kZVAyUllZU1RMdHlUTDFTc1gzcCtzeTV2UlhoM3Qx?=
 =?utf-8?B?dkl1dmloemdvMlBrdTliT0ZKZWlrYklIOHl6R29VZjNGQVZMVTN0ZlJaSWJY?=
 =?utf-8?B?VjV2R1ZoWGxRMlpoQTZHYjZhU0FhaW5hTERiMUJTVVdGNVBXWXF3NzZDNkRC?=
 =?utf-8?B?YkJ5WFVuL0xua296dVI2eVRnR2N5TUpnZVNzQjNQUVgrSEFsV1ZiaXJVZmZO?=
 =?utf-8?B?eEZaeDR2YlNYMUZ5Q1JaUjh4QjQ2cTBnOE4zeGJQRHprKzhIc0Qvbm82bUxH?=
 =?utf-8?B?UjIxaVBidTBOYVFnZ1NTU25TUk5XSU9pSUovcEZ4ZmFyd2JLL1RYaDl3VFJR?=
 =?utf-8?B?eHl6N0k5VzFocmY2bm9qRkZsOXdHZm9sYjZqb0lZMXB2RWpYQ0NJZmlnYVYv?=
 =?utf-8?B?WEN3cUtsR1dEY3IrZTVwT0xzaTlITkRmb1RhWUpoOWpPZ0Z5VVJsVStyQ3RK?=
 =?utf-8?B?UmRQaEtObWNpUXVCbzBJZ3pwYldUYXFTTUxVT2UwL2tmT1JTR2ZKOXNVWm1p?=
 =?utf-8?B?Ym5VOXVnUm9DS05QRlFkZFBZZDFxUkQwMS9DMzFvT0xVZzVzU0FWZE1PSDEy?=
 =?utf-8?B?Rkc2d1REVE1ESmxJdnNFWXlJWCtycEpTYnJkTVRSN1FSZnNJVWVra0cvRTZB?=
 =?utf-8?B?eGtZM2c0b1R5ZFlCMmpZaEhDRHJVSFk5UHZRYzZuaEU5M0JhVHpiajU1V045?=
 =?utf-8?B?QWhWQktRRVFYQjNoQ3VOUklJam55Y3Ryc2JHYzI4a3poUnZSdFh5MzJlZk5X?=
 =?utf-8?B?TkdNSEt0ZS9VNHpYWDVGZnVwUTN1YmZiZUtsMjlTNTRDenBiWlpkbXNiK2JD?=
 =?utf-8?B?UmNnenNLOG1HdEVqd0N3VjdMTmpiMnh0VUJnWDNjMjcrd1Vna0VSSGQ3Z0xE?=
 =?utf-8?B?eXlFdGYyWHVWNTRSZ2xCWm5JSUtvSmQxT1VhVlFWTGo2VjNTYVF5ZXdrK3hX?=
 =?utf-8?B?QWN1TVZFNXN0UDBQNWtObUhjMjJUOG82ZTZoUVJhTzNDdWhhNUZzNEU1NmM4?=
 =?utf-8?B?QUI3bFZIUjlndjA5dUVhNTRMcWtqWFVDa1F1TUpibE1qclY0c3VMVUNRVnZ6?=
 =?utf-8?B?TlQzZlJLd0wzZVdQLzhZblZvNkdwWlVnSHBNRGI4REZjbXkrdDdKOWRaRWts?=
 =?utf-8?B?aTJaQnRwZ1E1QXo4dmdzOWptaFpMYllmdFYra3pETHo3Y3E0ZHRKZ3pVSHQx?=
 =?utf-8?B?MGcyL1NEWWllZXczTm1KQzhMUWtXSjVUd3Z3UkRvcVRhYlBPYjNWU2ZZekVF?=
 =?utf-8?B?RGFyOEpnYnJUOUlkekJocCtRelFMcnA3RmEwRzhRcXFVbzdrbHpCSjFsY1dp?=
 =?utf-8?B?RlBOaFBGNXJnV0t6bFhEWi9zb2s5VnUxbDA4RFJndzRGRVFPMnhyV29EdVhl?=
 =?utf-8?B?NENObkhBeEtwQ3NMNmg3Ym5IZmY5YWx3ajFWYTJYNGJoUHVKVy8yUVJnK0JP?=
 =?utf-8?B?L2FkMmpsajBzdVVJcjBXajNBLytrc0NmaGVWTkhvc2xRWTJSN1dyMGdldlhW?=
 =?utf-8?B?NGcxNmxGTFFadzl1eFNjQ2pCZVZQbms3WGwxQnFtQjhCS2d5NEdrbzFmUDNE?=
 =?utf-8?B?WUpjVXlmeXJGdm53cTNUeGRKZTUvaFdFQWMzQ3BxSDNDTURPbGdJVUR3Y0p0?=
 =?utf-8?B?OUhEdDdHSlVKdGxZaDRwWlNyaEJDaVc2STZQSDhYdjdiUHBzZzVDOGsvKzBl?=
 =?utf-8?Q?dhwrC9miPR56pTzRcH1aSYj0P?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E694AF84D457548B543955451687F10@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886c3a4b-a003-4c6f-6196-08dca6d2735e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 02:36:38.8545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JmuGPFmeibeNFec4UqGeLej5mWAqt8PuDef/ZWs/0MXbSms1f3/LbkqN0yyH1k0X30JJZdW69F4EExI6AAGK1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8478

SGksIEp1bGllbjoNCg0KT24gVGh1LCAyMDI0LTA3LTA0IGF0IDE1OjM2ICswMjAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBGcm9tOiBMb3VpcyBLdW8gPGxvdWlzLmt1b0Bt
ZWRpYXRlay5jb20+DQo+IA0KPiBUaGlzIHdpbGwgYWRkIHRoZSBtZWRpYXRlayBJU1AzLjAgc2Vu
aW5mIChzZW5zb3IgaW50ZXJmYWNlKSBkcml2ZXIgZm91bmQNCj4gb24gc2V2ZXJhbCBNZWRpYXRl
ayBTb0NzIHN1Y2ggYXMgdGhlIG10ODM2NS4NCj4gDQo+IFRoZW4gc2VuaW5mIG1vZHVsZSBoYXMg
NCBwaHlzaWNhbCBDU0ktMiBpbnB1dHMuIERlcGVuZGluZyBvbiB0aGUgc29jIHRoZXkNCj4gbWF5
IG5vdCBiZSBhbGwgY29ubmVjdGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTG91aXMgS3VvIDxs
b3Vpcy5rdW9AbWVkaWF0ZWsuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4g
PHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3Ry
ZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+DQo+IENvLWRldmVsb3BlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
DQo+IENvLWRldmVsb3BlZC1ieTogSnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNv
bT4NCj4gLS0tDQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgIDEgKw0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9LY29u
ZmlnICAgICAgICAgICAgfCAgICAxICsNCj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvTWFrZWZpbGUgICAgICAgICAgIHwgICAgMSArDQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL2lzcC9LY29uZmlnICAgICAgICB8ICAgIDIgKw0KPiAgZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tZWRpYXRlay9pc3AvTWFrZWZpbGUgICAgICAgfCAgICAzICsNCj4gIGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvaXNwL2lzcF8zMC9LY29uZmlnIHwgICAxNiArDQo+ICAu
Li4vbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvaXNwL2lzcF8zMC9NYWtlZmlsZSAgICB8ICAgIDMg
Kw0KPiAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL2lzcC9pc3BfMzAvc2VuaW5mL01ha2VmaWxlICAg
fCAgICA1ICsNCj4gIC4uLi9tZWRpYXRlay9pc3AvaXNwXzMwL3NlbmluZi9tdGtfc2VuaW5mLmMg
ICAgICAgIHwgMTU3NiArKysrKysrKysrKysrKysrKysrKw0KPiAgLi4uL21lZGlhdGVrL2lzcC9p
c3BfMzAvc2VuaW5mL210a19zZW5pbmZfcmVnLmggICAgfCAgMTE3ICsrDQoNCkkgdGhpbmsgeW91
IGNvdWxkIHB1dCBtdGtfc2VuaW5mLmMgYW5kIG10a19zZW5pbmZfcmVnLmggaW4NCmRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvaXNwLiBUaGUgc2VuaW5mIGRyaXZlciBoYXMgb25seSB0
d28NCmZpbGVzLCBzbyBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gY3JlYXRlIGEgZm9sZGVyICdzZW5p
bmYnIGZvciBvbmx5IHR3bw0KZmlsZXMuIEFuZCBmb3IgaXNwXzMwLCB3ZSBoYXZlIG5vIGFueSBp
bmZvcm1hdGlvbiBob3cgbWFueSBkaWZmZXJlbmNlDQp3aXRoIG90aGVyIGlzcF94eCwgZm9yIGV4
YW1wbGUgaXNwXzQwLCBpZiBzZW5pbmYgZHJpdmVyIGluIGlzcF8zMCBhbmQNCmluIGlzcF80MCBo
YXMgb25seSAxMCUgZGlmZmVyZW5jZSwgaXQncyBub3QgbmVjZXNzYXJ5IHRvIGR1cGxpY2F0ZSB0
aGUNCjkwJSBjb21tb24gY29kZSBpbiBkaWZmZXJlbnQgZm9sZGVyLiBTbyBpbml0aWFsbHksIGp1
c3QgcGxhY2UgdGhlDQpzZW5pbmYgZHJpdmVyIGluIG1lZGlhdGVrL2lzcCBmb2xkZXIuIFdoZW4g
b3RoZXIgU29DIHNlbmluZiBkcml2ZXINCnVwc3RyZWFtLCB3ZSB3b3VsZCBoYXZlIGVub3VnaCBp
bmZvcm1hdGlvbiB0byBkZWNpZGUgdG8gZ2VuZXJhdGUgbmV3DQpmaWxlIG9yIG5ldyBmb2xkZXIg
Zm9yIG5ldyBTb0MuDQoNClJlZ2FyZHMsDQpDSw0KDQo=

