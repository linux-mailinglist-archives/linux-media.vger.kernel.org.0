Return-Path: <linux-media+bounces-37464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DF5B01701
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 10:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DB9B1C23E06
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 08:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E567821FF54;
	Fri, 11 Jul 2025 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TpbrseqX";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="tVPweCv0"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FD41F239B;
	Fri, 11 Jul 2025 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752224229; cv=fail; b=t/76b60ck4hzoB2uX3ensSdvGOk3RWeTxgK0tJ4RhOnzaKu84tmEXMad12Mk0cW+Cn39J/8nDebvQmv71PdYnq3EO3BmV/7LDYAkdKustVOPMuagWbriFPn6/1kye8CMWfqmZyIE0tajKzIPORviGFh0rl4aRK64Nrb28+xD/wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752224229; c=relaxed/simple;
	bh=q7lRro+uUcBUVn9aPuB/mffTO53rZp/iUCjp/pQjcrE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fYFVWahph8ED9FT5uXewHq2D0MBfa5lTjltapKdRFgzI4rgIepfIHuz1rCeaJ50fDsXodZwx9lKZ0H9V2ORS5WVBeRpy7pLkrfV1/jqBxT/sFotTn18VNL/Wd1H8uKAYkblqdD1p9PHjzq5bzzEcO5Ushro3drP3689pU7HBx1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=TpbrseqX; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=tVPweCv0; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: fe96219c5e3411f0b1510d84776b8c0b-20250711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=q7lRro+uUcBUVn9aPuB/mffTO53rZp/iUCjp/pQjcrE=;
	b=TpbrseqXWTBZrsjNVFa3Lh9IDDsQ/7U/TTYAJX9BmWywbLnnaf7ia9fFeAJlpHQVpNNrWg26iATBWZfI5WWes+RyquG+D/5zx4+hpHinnJ9qsn9L420YOkilzysXiLdArFCkPW+HVO/Y7vgoCnP+5RMjTnYarFuNDewt5cJdrUY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:f63e286c-5e16-4d32-8f12-dd8a220f829a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:886d19d8-b768-4ffb-8a44-cd8427608ba6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fe96219c5e3411f0b1510d84776b8c0b-20250711
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1998154611; Fri, 11 Jul 2025 16:56:55 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 11 Jul 2025 16:56:53 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 11 Jul 2025 16:56:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9RHJO9mMcRPBxi52sdM1FxEplBXfLS8ZqUM/uvhZMLfB6nkW2BY+f7ra0bPOzvSOYLxx2aSrhRABoeKOn3YwwK/BI24uGHSswT4YW/6LkACSaNAES8P36NMKefyUedQ3GwnaN3Z4+VcJk+KdRzTx03ofME+pKmyAzKe+t6kkpTknO1q6AtIZNIpormHTkmaiLecdNdPSd3s58+7NKKihw/wgdeN0hO6J8hcq/NIa/y7V7ryx5Ruhhy2xoi6ijuP6uDU80NdXxHc+D/1Zl2AVv+bV2M0IWtxNq9SIavTgCj7/+/UzjD/XXYBXMaqFKmQj2WNl5O1pa6IJBSJhl34Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7lRro+uUcBUVn9aPuB/mffTO53rZp/iUCjp/pQjcrE=;
 b=MKoFjAtqlKvdMvdfeqoGlzM8hVQ1n6+a/SWL5G1QSN7MmGAVPGmL/aXjz2bQDIMTTsvg+bmLn5EAg3FDUWJg0VKWX6dPGncuNVXY9vRmE/3EvWEPY2UJiKi70+OnW/ezXbvfkIEuJWBilx7Y9ldM7OaLwQbtm9YtfrB13tQs2uGIjLxCvlr+F2ZSJKdtIcJKR0FLwmFPWJpgy0qMwwcUGJHV9D/vrwk0ZOVv95oMa8zIDD1PrxU3klbZNelKbZ7WWv/HrpQQowH7AiBUdYLUrhLtt+SUeETnyRb2FVFEdPfGRBFgAstIJ4Rsv98sUj/j8f+uuTiIPsHnsa3YF/nWqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7lRro+uUcBUVn9aPuB/mffTO53rZp/iUCjp/pQjcrE=;
 b=tVPweCv04p099RCvOOEw44ptddLHXbe8sI/V00FpiLVfmHwWfZbuSgkex7BIbnHM03unPnG0r0qzxo3539YwPysUEByr2S9eH0nQyWnFkwqKvf/EfzBbbyMd7a0vzQcTzqWKt3XsFmOZgEIEe8SQdR8PhmGKDxa67ikxqAFgGBQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYPPR03MB9389.apcprd03.prod.outlook.com (2603:1096:405:2b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 11 Jul
 2025 08:56:51 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 08:56:50 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?U2hhbmd5YW8gTGluICjmnpfkuIrloK8p?=
	<Shangyao.Lin@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 06/13] media: platform: mediatek: add isp_7x state ctrl
Thread-Topic: [PATCH v2 06/13] media: platform: mediatek: add isp_7x state
 ctrl
Thread-Index: AQHb7uCzsonZgRKFOk+So50KA3Hk37QspbkA
Date: Fri, 11 Jul 2025 08:56:50 +0000
Message-ID: <d02055f2e5ebb8df072eef398af85cdd99b4a6ef.camel@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
	 <20250707013154.4055874-7-shangyao.lin@mediatek.com>
In-Reply-To: <20250707013154.4055874-7-shangyao.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYPPR03MB9389:EE_
x-ms-office365-filtering-correlation-id: a33ac5af-113d-48f7-2748-08ddc058e03d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|42112799006|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bUc5b0xycVNRT0o5b25ndFhQMUdvSm9hR29mTFpqUUpSV2xVckdaM2FjZ0ta?=
 =?utf-8?B?YnZ5aXJoaFdMMWV0R0tpdDBVZVRSdkI5VkFLSDJMMUp2TGtSUlBzejR0Y2th?=
 =?utf-8?B?bHk1RTY0UjRaYmcwdzQ1dmREcUZKV1VoOW5PbTBtUjBtcm94SXNUT2FYcWNo?=
 =?utf-8?B?MCtsNjZQQXJBbGRaVUUwUjBLbzhSMUxwb3pDelFkQ3hjeDRCaHc3OXhhclBD?=
 =?utf-8?B?TnlZM29hK29xaHlVanRpMXJQRDNHaGRTT0taY09MeGplVXpTR0pDQkpxcGpR?=
 =?utf-8?B?WmYwUjdYY1k2dDB1ZkZER2RzQncvWlVScHpjQThzeXhNdGJsdEQvU3ArOEtO?=
 =?utf-8?B?VlZGTlNROUZjd1BCZGdVbXdyVzB5RWRJUDNmNVhtZk1hVnYxUXRrN1ZaV1F5?=
 =?utf-8?B?U3hJNWlrNDJiSTg1cmRHcHR2aWlxMUFkSnZ0aXo1Nm11WnNxRCs3bE00NHg1?=
 =?utf-8?B?K2dCR3podTk1VDN1bFhCUXhGN0FtcWxRSjFWUWQvZXYvSGxZNlhOMTFWUFND?=
 =?utf-8?B?Uy9LcnRmelgzUkRPdFNhaWZ1M2VDdExYSWRTd2ZGYkN4Zkd2cmljQ3F3NjZl?=
 =?utf-8?B?SXFsSVBJQ1Z0V0VYZkgvUVZldzE4OWh1YnlOOGNFdENSUkdacFVTa1JQYzg0?=
 =?utf-8?B?cGpFaU12b0xvd3BCenFRUWZWVmoxNmwwL0czZjBRNjZjODdSbEZ4cnFtd0dp?=
 =?utf-8?B?RU5EdWI2U1VLTG8yRkM2aTVyZzVQc3JxL004bDYyb1JmbFlJc3hueVVGYjR5?=
 =?utf-8?B?UXluZDlIbEUzbUliMDlPMmlPT2lHV1hZSnBwK1BGNUpWeTZ5bDJiRHhFUFhi?=
 =?utf-8?B?M216UUZsVDlzUXV1elRUczZSREtXdXRaNGdKR2hvSjVQSnR4SlpENTNkczJ4?=
 =?utf-8?B?bFM0SlY1UkxDZ2Jkdjc3NnpaRThjSDZlaytSL0N0aUNLZU9XUTZlaXlleW9t?=
 =?utf-8?B?V1FFa21iTjV6cUlIQWh2VmRqcWx5VGRoTmtHYU1yZFg4K05PVDA4Y3lMMitL?=
 =?utf-8?B?TVhxQTgvSmduRUFFdndlVmRIdURhNUw4eGVLeVJ4WnMzOTRUUVVOMlVQOUxj?=
 =?utf-8?B?OFFMT1c5amkrQnV3NitpcXRvZXJVTnl4OTYwVzlTOC9FdElLUVFHZkhQWWFn?=
 =?utf-8?B?eDFhbmZXcHBIVU9KdjdEYjQ2elZxamt4Y2M4S29Rc2F4OXAvSUo3N1p3V1U3?=
 =?utf-8?B?ZjVwdHgvUGk3Ukkva0crMG1MYzFyOE1neW01eTQ5cUpaek5zZHdaMUNzVGRp?=
 =?utf-8?B?ekVKNm50Y2lRNnJqK2dZZ2VhMTBRZ0xPWEw2UW9LaERpaGFkNm9CVzV6ZG04?=
 =?utf-8?B?bG5yb0FaamNhcUdlMTJ3NkZIQnloc1gzTWQ0dzNEak5uT1RVREtneHhJZThO?=
 =?utf-8?B?YkcySXpycTVINlI1NElTdFBBSFBwUktrWWNiODNwMitibU1rUEVsU0lPQ2hq?=
 =?utf-8?B?d3VvYzk5SGc5MCtBMVFsMmdseTJteXYvSXNLNVp2eWRBOHJ5TjQ3YzY5c2V4?=
 =?utf-8?B?bFZtUHR3SWx6b3ZwWlFoWkQza2JoQXRVYytlZHQ0NUdEZGRWZlhCT1pLVDhs?=
 =?utf-8?B?R2Q1MHZzZ3VSd0xmekdneXhRVzlkM0FZSmRyNUlGancxV3huYTROSENENmNq?=
 =?utf-8?B?UEdFM3Y5cnYyV1liRFIvNVprQW5uUjhmbjU2QjR6MmJmNjQ5VHRwZDh0dDNE?=
 =?utf-8?B?d1FFODViRFNRN2hXby9BZTh4M0tYckt2SUtFSVFxMEhlSnJBdmhSc244amw4?=
 =?utf-8?B?dENsbXVTaDZkbTdXZ1pnRTl5Z1k5blJhMDFFdXQwaHg2TFNudTBEa0dtdmtz?=
 =?utf-8?B?S2tIc3Y5UVZla3Nqa2lrdzgrNFFTLzJLekxqcUNPd0cwcml2LzFPeHY5MlF4?=
 =?utf-8?B?aHlIK28xaUJ2c284ZGlJUlJ0M1VTUHpvZlVLREdMdjlHK1I0Q3UzQ2ZKT1ZI?=
 =?utf-8?B?MFVZZWtDcytRV1h1aW9pOXhPb1pucWtFaGZiNjBjQWI3bVQ2UE1oUUpWMG1L?=
 =?utf-8?B?MEdyWHhuaHdBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0NGcDZtWHlDVld0NXljMU5DOGZSNDZGYm1aWWQ1NTJqaVZleEg1ekE3Misw?=
 =?utf-8?B?YUh4S21uVWVaMEdjZTBEUGIxL3luRE1ZT09PSFF3VUYxY2tuaGxyYUZubTV3?=
 =?utf-8?B?RWVyNVZ5UGpDVzcvR2R0OHFXR0pJQWgreWwyVUhWN1BxTXdoMmFzMjdLN3dV?=
 =?utf-8?B?TjUrR3krd2Q4RG9LQTRBQ05EM3dLd3NCM0gvRm1rYk5Wa0ZVUDRLWlF2MUlX?=
 =?utf-8?B?S255NUNXU1VXbnVKTUs1bjJ6dFYrbmwrMG0xWWc2YUxPTno2QWFWL205R20w?=
 =?utf-8?B?U09sdGpDVDFsU01kR1lHQjFPeEhUSm5pWW40bDcxQzEvRFozaDdWYmI0QXhn?=
 =?utf-8?B?UXZOL3lXbnF1NDVRWk5pTk9qSGcvUFRuMkNCOStnTkc3VWhsd01SZXFUbHZE?=
 =?utf-8?B?ams0YU5ER0NWS1MvSjBURnJsMm5lT0x6VEhiU21FY1BUS1M5STBxdXBBQUZo?=
 =?utf-8?B?RURmajY4ejU1eVRXN0p2bEFUMXpTR1RNZXJkQnpLTVEwQlU2VkVpNGc4aUE4?=
 =?utf-8?B?ajQwUkRNR09IdzhESnU4WUZuelJ5a3V6blpWejdTSDZaY0tqOGo5amtDY0pu?=
 =?utf-8?B?NUduZ29tb3pTTFlQZWJDVzMway9iaFBITW1OSzhzNStrRHQ1NHNQOXlBbHo0?=
 =?utf-8?B?bHpmUmdvZWVkRVZpa1hmaU9rQkNFcWZRb3pNeE1xcGh3NGJBOXlSK0FLYVpB?=
 =?utf-8?B?SXhOR2YrUGlRUzRrNlZNYzBMdEZ5Q09NM05Zd2lUaUFNVU5JVU8zWndSL1dI?=
 =?utf-8?B?SE1wR1FvdGpDK3NDdUNUY3F6UVJLMjNwMUZ5UC9xV2F4aURSc0lvMnZCaE1Q?=
 =?utf-8?B?eEUvd3o1VHhyU2pJVzhoZUo3M0lzYXZkdlhTQS9DV1ErNjJWVTlSS2pRQVNk?=
 =?utf-8?B?MVg3R2M4TlIwNHZjdnlGbXREaXRXRU5jbDhGa243Y1FNaDY5YjM3VHFHNUs2?=
 =?utf-8?B?R0dRem5yZU5hakd4aEdvdi9oVGY0SklxenJHSVNaOGp5UW1OcXZ3bGFTSWp6?=
 =?utf-8?B?UEZoZjBVRm5OVnR4bVdZWU10TFBFb21ERkhqVDVZZjdJWHRKbmpnd0dhb3Br?=
 =?utf-8?B?MTlXazdHZWFrcE9LMXJXTkVCL0d5c01nR1pZdTZzdHFJejBtQ2p6Um03U0p2?=
 =?utf-8?B?TUswSGlWcEpJaTVuNWR3SVBIRTVSY1BLYjVwb2Q1VXNGbFV4WnJobVRvMy9C?=
 =?utf-8?B?aU54UmdLUWNQSXRzY25LTmZ4Njk0SzhxSzEveGROM2F1cm1lUE1pYVErZnVy?=
 =?utf-8?B?NU8xQjhRdW41SUs2NzlUYXBWVG5hdHpkeGJ6WksvbVF2K3FkVjY5RGxKK1dn?=
 =?utf-8?B?Wm5YOVNGZmo1WmVhaFcxT1RyVFY4QzBUMjJUWU52WTVOU3pkY1lQT0JwZkF3?=
 =?utf-8?B?S2xWU0tPQWRrV3ljUGQ5WmQ4V2tDU0pleURKVTNqcndHaERET3VqeXhXQWFC?=
 =?utf-8?B?M1VlTExTRjZ0S0VubjFQVHNJRVVxTmdTNjFtbGk2QndLTm9XTE4vYXFib0pP?=
 =?utf-8?B?c2thNTU2TmJvcFYzZk8rYzBtMW5OZHp0ZERZdDVPZmUzUVF6RFo4R1plS25Z?=
 =?utf-8?B?S08rbXVseG5GOGtTRGtvVkp0NkJiNlVtVmk1eWNTNytiNjBOVFE0NEN2ZTJQ?=
 =?utf-8?B?NDN3ZFVtREp4ZVN0V2p1aWo2Um1TRG9TNXM0bnpGb2xPcWc4eTJacFpwbWdP?=
 =?utf-8?B?VWMveVBnK01ab0JxUTNONzZHeXppbjFwTGlOQlIxbm1sYWthZW5leWU5YlU3?=
 =?utf-8?B?V0V6Y0gwcEpNM0tyZ1lVSW5RbUhUM3lpdzBFbWxod1NFclB4a3RFNmFZbmF1?=
 =?utf-8?B?ZERyQnFmY3FEZ2NvM0E1NHIzQ0MxQmVKZHRoSGVnQzhQdWpHVzJIc2pIYmxD?=
 =?utf-8?B?eEt6a1ptdExKZlVNMDhEWnBTMG1wcmJYdnI3aExKUmRlQWMvVWs1eENVd3Rl?=
 =?utf-8?B?dnovWXFjd3BIdlV1NWpmcVIyWVFrVU1YRk5RZHRGa1poT0Y1SnQwdWlxb05V?=
 =?utf-8?B?YkdoMjkyeXZDWWtURWc2aUE2dEtId0xyTll4bkUxbXVUUTdkQy8ydm9Kb2xh?=
 =?utf-8?B?QkNCRE9BVm9OZmx0YWp5ZUN2anZCbWFMYXRqUVZTMmZrWTZnVDB2dEhwaGJt?=
 =?utf-8?Q?ivBMxZzz6UMGbYmSasbfH89ma?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AC712FBE3CA1F4EAEAC51C2B9E0D2BC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a33ac5af-113d-48f7-2748-08ddc058e03d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 08:56:50.8146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPbbmPrNBeNXCeZlrIexdYy0I/a5/5VT01eoSPfkyuoutdlygUxFh3tHL2YMDKWA20IHyH/qrQW0lI9hcU7owA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9389

T24gTW9uLCAyMDI1LTA3LTA3IGF0IDA5OjMxICswODAwLCBzaGFuZ3lhbyBsaW4gd3JvdGU6DQo+
IEZyb206ICJzaGFuZ3lhby5saW4iIDxzaGFuZ3lhby5saW5AbWVkaWF0ZWsuY29tPg0KPiANCj4g
SW50cm9kdWNlIHN0YXRlIG1hbmFnZW1lbnQgYW5kIGRlYnVnZ2luZyBtZWNoYW5pc21zIGZvciB0
aGUgTWVkaWFUZWsgSVNQNy54DQo+IGNhbXN5cyBwbGF0Zm9ybS4gU3RhdGUgbWFuYWdlbWVudCBl
c3RhYmxpc2hlcyBjb250cm9sIG92ZXIgSVNQIG9wZXJhdGlvbnMgYW5kDQo+IGV2ZW50cywgZGVm
aW5pbmcgZGlzdGluY3Qgc3RhdGVzIGZvciByZXF1ZXN0IGhhbmRsaW5nLCBzZW5zb3IgY29udHJv
bCwgYW5kDQo+IGZyYW1lIHN5bmNocm9uaXphdGlvbiwgZW5zdXJpbmcgcHJvcGVyIGV2ZW50IHBy
b2Nlc3NpbmcuIFRoZSBkZWJ1Z2dpbmcNCj4gbWVjaGFuaXNtIGVuc3VyZXMgc3RhYmxlIG9wZXJh
dGlvbiBhbmQgdGltZWx5IGRhdGEgY29sbGVjdGlvbiBkdXJpbmcgYW5vbWFsaWVzLg0KPiANCj4g
LS0tDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIFJlbW92ZWQgbXRrX2NhbS1kZWJ1Zy5jIGFu
ZCBtdGtfY2FtLWRlYnVnLmgsIGFsb25nIHdpdGggcmVsYXRlZCBjb2RlDQo+IC0gVmFyaW91cyBm
aXhlcyBwZXIgcmV2aWV3IGNvbW1lbnRzDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBzaGFuZ3lhby5s
aW4gPHNoYW5neWFvLmxpbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3Rh
dGljIGJvb2wgbXRrX2NhbV9yZXF1ZXN0X2RyYWluZWQoc3RydWN0IG10a19jYW1zeXNfc2Vuc29y
X2N0cmwgKnNlbnNvcl9jdHJsKQ0KPiArew0KPiArCXN0cnVjdCBtdGtfY2FtX2N0eCAqY3R4ID0g
c2Vuc29yX2N0cmwtPmN0eDsNCg0KWW91IHVzZSBzdHJ1Y3QgbXRrX2NhbV9jdHggaW4gdGhpcyBw
YXRjaCwgYnV0IGl0J3MgZGVmaW5lZCBpbiBwYXRjaCBbOC8xM10uDQpZb3Ugc2hvdWxkIGRlZmlu
ZSBpdCBmaXJzdCBhbmQgdGhlbiB1c2UgaXQuDQpCdXQgaGVyZSB5b3UgdXNlIHN0cnVjdCBtdGtf
Y2FtX2N0eCB3aGljaCBpcyBkZWZpbmVkIGluIGxhdGVyIHBhdGNoLg0KVG8gcHJldmVudCB0aGlz
LCB5b3UgY291bGQgYXBwbHkgb25lIHBhdGNoIGFuZCBidWlsZCBjb2RlIG9uY2UuDQpGb3IgZXhh
bXBsZSwNCg0KQWZ0ZXIgYXBwbHkgcGF0Y2ggWzUvMTNdLCBidWlsZCBjb2RlLg0KQWZ0ZXIgYXBw
bHkgcGF0Y2ggWzYvMTNdLCBidWlsZCBjb2RlLg0KQWZ0ZXIgYXBwbHkgcGF0Y2ggWzcvMTNdLCBi
dWlsZCBjb2RlLg0KLi4uDQoNClRoZSBzdGVwIHdvdWxkIGhlbHAgeW91IHRvIHByZXZlbnQgdXNp
bmcgc3ltYm9sIHdoaWNoIGhhcyBub3QgZGVmaW5lZC4NCkluIGFkZGl0aW9uLCB0aGlzIHBhdGNo
IGp1c3QgYWRkIC5jIGZpbGUgYnV0IG5vdCBhZGQgaXQgaW4gTWFrZWZpbGUuDQpXaGVuIHlvdSBh
ZGQgLmMsIGFsc28gYWRkIGl0IGluIE1ha2VmaWxlIHNvIHlvdSBjb3VsZCBjaGVjayBpdCBjb3Vs
ZCBiZSBidWlsdCBzdWNjZXNzZnVsbHkuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJaW50IHNlbnNv
cl9zZXFfbm9fbmV4dCA9DQo+ICsJCWF0b21pY19yZWFkKCZzZW5zb3JfY3RybC0+c2Vuc29yX3Jl
cXVlc3Rfc2VxX25vKSArIDE7DQo+ICsJaW50IHJlcyA9IDA7DQo+ICsNCj4gKwlpZiAoc2Vuc29y
X3NlcV9ub19uZXh0IDw9IGF0b21pY19yZWFkKCZjdHgtPmVucXVldWVkX2ZyYW1lX3NlcV9ubykp
DQo+ICsJCXJlcyA9IDE7DQo+ICsJLyogU2VuZCBWNEwyX0VWRU5UX1JFUVVFU1RfRFJBSU5FRCBl
dmVudCAqLw0KPiArCWlmIChyZXMgPT0gMCkgew0KPiArCQltdGtfY2FtX2V2ZW50X3JlcXVlc3Rf
ZHJhaW5lZChjdHgtPnBpcGUpOw0KPiArCQlkZXZfZGJnKGN0eC0+Y2FtLT5kZXYsICJyZXF1ZXN0
X2RyYWluZWQ6KCVkKVxuIiwNCj4gKwkJCXNlbnNvcl9zZXFfbm9fbmV4dCk7DQo+ICsJfQ0KPiAr
CXJldHVybiAocmVzID09IDApOw0KPiArfQ0KPiArDQoNCg==

