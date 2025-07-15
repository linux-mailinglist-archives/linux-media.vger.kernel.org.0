Return-Path: <linux-media+bounces-37752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91492B054D5
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 10:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1148B188AA71
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E49274FEF;
	Tue, 15 Jul 2025 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GCqBxg3L";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="jeBX7D+F"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3FB271473;
	Tue, 15 Jul 2025 08:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752567964; cv=fail; b=hCzx8Mrtb3521W3KInKPNV9uY7e6+qs+nhD18nKxappzIQIJ47tPheZkI1ZdCH/KKglb3zdzy6TN4KsspH9Dz9b4ukgPi8Z+LFfEAszW8td0331CAik5ZCBcZwtxXPW4loFWm8nGYrro1cEwzpF1zzB8l3OD87+8DjNUWr4z9WA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752567964; c=relaxed/simple;
	bh=IWcfd3TH2x8EGpA3evmbZHDUz8iiPSAi4FCvAAbiXzM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bo78rZy05X/9nXPk7RftwAW3qk/3aCOxC/2A2E/182i0l4tkcPnPJZdODoLEk3BkQ9Nam6MqoeK6CLzXQbmB155jULKvTwvygM/dQx79lplrIuQm7XMt4SnFqxZg3RWYvtwq1O5Eu21lxpONCdcBSpCy3P9iDP79hGmcCWwmVWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GCqBxg3L; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=jeBX7D+F; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5485ad5c615511f0b33aeb1e7f16c2b6-20250715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=IWcfd3TH2x8EGpA3evmbZHDUz8iiPSAi4FCvAAbiXzM=;
	b=GCqBxg3Le2K/fae78sJ9oiwR3N1UlDHWKSS6uRWp8rx/8xtLBiqDcMEwnuVDZuYLBIbmbFPkApEAhSSjqNSKtx/oJUYfDo9ajAg3Ajo80LqzvHPetO8TVOLKJLdTFoSSIWxLLNYIn+bq4xKKe5oZad5IjH3RONWoCSo1tbBg+Lo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:07040931-74b1-475e-9658-b14aa2c82b7c,IP:0,UR
	L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:12
X-CID-META: VersionHash:9eb4ff7,CLOUDID:7e02f1bc-a91d-4696-b3f4-d8815e4c200b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:99|11|97|83|106|80|1,File:nil,RT:nil,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5485ad5c615511f0b33aeb1e7f16c2b6-20250715
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1947385813; Tue, 15 Jul 2025 16:25:56 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 15 Jul 2025 16:25:54 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 15 Jul 2025 16:25:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6upOnx9XqhIgvyLKnMX7jBTxyOsgfm1p7XhZYWChNhjh0+RCLvVwfSVZ4JWnoPGXVkyAn1csf9yWOioXcKIV9Kxjw5izJ1FKS0nDs2gNRj+bD0G3dy4C8nrBOVYE3K0P/LDl29TvU0i0t6DHFQnORi67bqS4tjfMY82dV6ih3It7zEeDW0oZqP3MCdh2PPbVs20jpJF+SSE+HnheAVG/BqAQnCAI3/6XtbgUAvmkGYXD9aYvwoztgjKnHwHNiae/BQaV4e2vAVvClXNkZtOqo1wxU8Z/oeiSpYPOV8PfHr7iSUfnajQbHrnKasn+YBuG+zepGdBxJkgeIVdw+FHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWcfd3TH2x8EGpA3evmbZHDUz8iiPSAi4FCvAAbiXzM=;
 b=KutBdUKTPoQSPT9gCd1Df4Jxyi8gs8321IppVUGxT3Gf7dPHTQoR7wRIF3ho9u72Qhdm8SDF6SlOiZWjToxSDB0u2tqPqNZcKIuu0/LzMj5Po5G6p0CaJopXshfDUnZhXOeMkO67wIwcbnoVP9Et+iZHSmwC3La16mjjNXD4HfpMo07loKOiAfy3x1jJi+cvCKkQTk055eGew5pzIEzOIUZnFARGAADgnENjIiWt/N1KgwImZ3ctI+0jJOSstL9YJGEgA04SDmxEEjzDQ5cgR9sX3ZmnoypnMc9g9SxA2JLeEc5hu66LCIXKF7FcFvzps+bWB4xjSxvJz7JLFGHk0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWcfd3TH2x8EGpA3evmbZHDUz8iiPSAi4FCvAAbiXzM=;
 b=jeBX7D+FpQ7Gimsnff7Lzyaya2N9l9wRymRABP+SymQT2r8Bx4y0TGFsHClHMnk8SlAKcHz9nHOuFg2RgLKTFMeeE1dQvyTbJHrP3E3J8cdKL+8hd6pXPCK7KyjEUNBQXveTSP7yFE6Bs0WExb5RdrCbq3gEWjyRL8xLijnGOE0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYPPR03MB9497.apcprd03.prod.outlook.com (2603:1096:405:319::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 08:25:52 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 08:25:52 +0000
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
Subject: Re: [PATCH v2 01/13] dt-bindings: media: mediatek: add camisp binding
Thread-Topic: [PATCH v2 01/13] dt-bindings: media: mediatek: add camisp
 binding
Thread-Index: AQHb7t9ZL4ZlOsYRukS+qvXosIqsZLQy5mgA
Date: Tue, 15 Jul 2025 08:25:52 +0000
Message-ID: <e9a3f35f0be468d762df7a0901415605f524c9f0.camel@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
	 <20250707013154.4055874-2-shangyao.lin@mediatek.com>
In-Reply-To: <20250707013154.4055874-2-shangyao.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYPPR03MB9497:EE_
x-ms-office365-filtering-correlation-id: ab09c89a-ae24-405e-413b-08ddc379366e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K3NNUFNNUnFXaG50eEViWkdGZHRSRHFyL291Y0RlK1dLbzBMeDNQRVY4Y2Jv?=
 =?utf-8?B?eHRNQTdWQnNSMnR1cnJxdEVNNjZHOWIyeUx5eWRPTHdYbE1GaWZ1M3VmNURP?=
 =?utf-8?B?MWJ3dEc2UjlQYWZkbVM3ZUtPN3lpTkpmU2xKTWY2Tks5USt2UVN5cmUvaTJD?=
 =?utf-8?B?NHR3Qm9kUFRIVkxpNzhMV2JUK2JWZG15ZHg1bjMvYlcxRC9aLzRRUUxoTXVs?=
 =?utf-8?B?UTFsVDdOQklJL0dqUDQ1T0w1UGFiclRzL05zNVhEV1JVOGJmNHE0Znc2TEM0?=
 =?utf-8?B?NUNtaUtrVXZjME02SjJmZkZSOUJtaWVLS3Qzd0NYQnFCdXV2ek1mMzBEZXRz?=
 =?utf-8?B?bFBVSFI2UHpNL1hvSXFDRUo1RHZzci8wbVM5QWhRUENiTUVRd290YlF6S0JI?=
 =?utf-8?B?RnU1L3ZmT3k3R0NGdWYvS2VrT0pHcjlSSWtCV1NQeUQyZGJnb3dIQWQvOHds?=
 =?utf-8?B?dEM3bVRSR2hEZlo3UUZaOGhsZTc2bXo0UTcwZkNkcDUvckJwNVgwa2ZHd0xh?=
 =?utf-8?B?SUZUYVdtZHVwTmJLcHEweGRhb3V1dWZYVTFmbEV0ekRVWmx2UTJUK1ZsQXdH?=
 =?utf-8?B?WFRwWHJZK3FkSGJVN2hMaHUrMlpicnExMk90SUZHcHZRUEUvZFovNXdUSmFK?=
 =?utf-8?B?MEpsalZHWFRjT29PUVd4OXNiQ3prRm5Sci9xdUwraFdmajZYUitRekpjVTdK?=
 =?utf-8?B?em1LRExIakNhTTM1YlBTOFlrZGU5Mi9TZk5Kd3BHd3RnakI1UFBoYllPVmp2?=
 =?utf-8?B?cWRqemNNcHVTeFcrQnV0NWFDdjhzN3haNWxUQkZGWVQyMzJjUkxxQ3l5SlJ4?=
 =?utf-8?B?M1Q1aytNajZTS1JHc2xldEEwdGVreXJ3VWJrMHBBclo2V3dIU3V2N29XektB?=
 =?utf-8?B?MjJqbG8zd0oyYUVscjJxT1hUTUJ2a0tUWnIxbk9uelVuNENGRnEwaExjMDBp?=
 =?utf-8?B?WWFkSWowRXJpY010MkxqR3hNbEJlSHFsVFhTV1J1S3JCdUVyVldXaGFTMlRI?=
 =?utf-8?B?cHZQWmg0eFcyODB0blE3YjZuYlVMdjBLMWQwZU41cjc5TjRacEg4RENsYUNH?=
 =?utf-8?B?bkNKR3gvZUhIdEJsLzJNcGxmTktXeEpNYTlBdWtrZnM1c1MrdmgxT2luSk9o?=
 =?utf-8?B?VUE4UzFyY3ZWeGd0OERIYlpCWThrbkU2bW4wL2JCU0xDQ0IzeVl2a1lhcVln?=
 =?utf-8?B?Y0JlRkVoc2h4d2krelFsVCtDMElNTkdqWHpKWnhYVWc2Ui9qaUVTN1VuYWJp?=
 =?utf-8?B?ZG1pQ3Q1VlJjQlJQcFZmTUVCY0x5K25odTNRaitzUHM3Zm0yRjlGU2VsclR0?=
 =?utf-8?B?MEJDQXZ6dXUwMTdWRW9TS2pHc0UwVjJzMEd0bEtiQitCelMwK1hhU2Q1WWdF?=
 =?utf-8?B?U0RrVng1YzYrQUs0d3V4eGZtYzlYSzdlVzl5TlUxNEk3TVV3TjE3N2c1MjdP?=
 =?utf-8?B?bmZUcnphWmcySFAzalpuYjdqc2ladTYya1VSTzIyMGUvc0VZcFZncnZ3c2h3?=
 =?utf-8?B?V3NFMSttdno4Rk5XQlpYNzc3NUZ4YWJJTUg1UEVGUjdoN3NKU3NjYW1uVEVK?=
 =?utf-8?B?UE01cGZaVmUwRlBFL0NXcVpWTDVjS0RLa3hHT2tYTWlmNkVRczlOaTBBTkxG?=
 =?utf-8?B?RmJIbEJxcjJwQWIyQzNKUmgyR0w1QTM1cXR5V0czblN3WUs3TXdjbXVBeVZR?=
 =?utf-8?B?ZjNaejJCTUJhRklRQWdDQWplUis4dmI5b05laTdCUTJaRTJTZmw1QUxJakhE?=
 =?utf-8?B?UWdoWTJUSUwwUVJrSEhEcVBCUzRKTTNIczYxQ0NlU0RWbFkvUUJ3anpMTFB1?=
 =?utf-8?B?L1RsSjJqYzJqczFQSldib2x0RStSUjZHV2xmSTY3ZFRFRmdOSjhjTkE3Si91?=
 =?utf-8?B?YXlnbWkzV3kwdnJMZ1RSNzVITEhmYlBFU2QwT3JqQm1QcWY5OFlwQVk0UERz?=
 =?utf-8?Q?pkITxHM03xfeg3ICknJA9Cmf5FC1hrYH?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmFGakhEZklubElPQ3pyakpQSFd4V0RUNVFId2ZXamxMWW5OR0V6dk1JdjRm?=
 =?utf-8?B?V1c2MDc0eTRpNTVlbTVTcWF4UWJ4V3ZvNk4xSHlYR1ViNTZzU2NEWXU4SjVR?=
 =?utf-8?B?RmZybUhnbUtsVHhhYWJVeGpPb2VxTElueUZWN1NJVkEzMWFvYmxGaVRiSS9r?=
 =?utf-8?B?MVJnWTRGQ0RPbU5wdDlRZUMwS3hMQkRoTHA0ZW1icUYrWHdxS3lvOVhsaUkx?=
 =?utf-8?B?M2dMVFRRVGtzTVJoaDJTQ003cGFEN29XVkx6aWJaaytWRDhteHNhV1VDSnIw?=
 =?utf-8?B?c1gwdFg0MFBwRVZWb1BoVFIxazZOK0VobFVUWGdmcGdRbDNCZUhmU3o2UmdK?=
 =?utf-8?B?NVJvbWNheDFwUXAzMXZna1JlMGhsS2NLc0pzM3JSRi92bkhUbFNjN3RaeVVY?=
 =?utf-8?B?eUZpckkyaDRnQ3dyWCtMWGxYbStJNWV6WnZhTWhFM08vZ1NFenV1QmhZYnJ0?=
 =?utf-8?B?MjZ4RUdVQkZYU2phVW1xVTZ5SkI0VVkzRS9QTjdNMHlYQm9nY0pTNVozOC8w?=
 =?utf-8?B?V3grdFpJSG5DZFhQZldYeERxOHMyNjBzcnNNRE5GRUk4SGtuY1JhRzVZUkNj?=
 =?utf-8?B?WWQ5bW9SWDB5Um9vTGVKcTRyWUhGRGlRYlo5M1QwNFJZVXVkU1RLZVZ1ODJ0?=
 =?utf-8?B?WmRQMUczcEhmeXRXMUtQdXJGVGViSW51RmYyZVoxajRpYkVaMWdBMGtKL25i?=
 =?utf-8?B?YUh6MlZydXBSaERYLzBMNVN4aTB6R3dHNFR4TlRGNEpmTWc1dCtiSklkUzFN?=
 =?utf-8?B?QWV4b21VZUV2aHgwZStzNmwzYktWZkJsM1pGYW5GUHNyNjVyb0M5bkRzc1lu?=
 =?utf-8?B?NUFvMVF5YjMyOHVFSWpmWVVOVm5aVGJCUmVpd2w1MExhV1Z1N1I3ajFHZU0z?=
 =?utf-8?B?OCtJcDhHSk1UMlRja0xlWVBhT3ZuVHNDWlVBR3F4UjI0RWtnYTJFbXBQNG5a?=
 =?utf-8?B?Tk9ZRXNjdTk1cGJTWWhpSWdvNkNJcktLNGlaNjZLZjhxNmNoVE90TTA2MnRv?=
 =?utf-8?B?VFh3NVVFM0ZScC92VDREZHFoaWN0UVpnbmlXc2lCMXROb2dHcWxlY1grVjAv?=
 =?utf-8?B?WElFR2F2NXVaeVBESlhGU0x3Z1h4ZnJIY3gzQldUVGFyaklMdHdwUVFma3p4?=
 =?utf-8?B?QTVvU3RoT3JyUjBWQ2dSY1JlNGZneVhnVlBIOEZLNjJYSEY5T0ZETkNwUHg1?=
 =?utf-8?B?U3Zuclo0T1hsSTJZVW1EcW0zMFZ4cmpJQmUyOU8vanB3M0YrVS9FZnNKelBo?=
 =?utf-8?B?Z1Z1MDRTYk9qYU1EenY0NkVqMXRpMGlITGx1eEwwNlNxNlg2V3FoeFpPNjMv?=
 =?utf-8?B?aHJqemJjWTVMcHI2SVI5d0pob1VDY1EvbnN3dHBrL3FnYUd1R0d2RW9jb1c0?=
 =?utf-8?B?RG9qUFdmSEVKSThMU0MrbUp4ekdIU0d2M0hYY2NRMGdhaWh4U0xWUTZRcUpj?=
 =?utf-8?B?VjBSTjk1Y2ZzcFVCQnJIU0FuZ1pjZ3FjdVlKNDFlNlJCQVV4SDlMeHF4VWcy?=
 =?utf-8?B?VzNUWUpPNHYza1RyUnNGVnZUTlo2dnBOWWc0SjUzeVptR1B1M3RVUlhHektX?=
 =?utf-8?B?RHlobzhzTEU4dnYyNDRiclYrdjU3RnM0NlNUQTFGTU5JNWlGZ1RtN3ZxRkZK?=
 =?utf-8?B?MVZkdXhZTkhva3VsNk1Pb1MwSlZnWEtkWS9ReEFPb21rS29XdHN6cGE1Q1Ay?=
 =?utf-8?B?RTVVRm1kYWMxcHMraHMxNHpVQWc3WDZCbmhENHMyVzhRbk0rTk5aTmVEYVUr?=
 =?utf-8?B?TURRZUl1S21GUzdwRnBSQ3dtRVVpTDJkSGVkSUJzODN0RVl6R1ZzK284Z0dt?=
 =?utf-8?B?V2Ztb3V0L2J2VmhmTGRmUFpEWnpLUXNiVHNucVBHdTBjYjByckZFZnZ4R1lS?=
 =?utf-8?B?UjNQUUZvV1AzdkJ4R0JCQjZzZi9OL1BxSDFXRGREK3k3azB4TWU1cCs4RG5E?=
 =?utf-8?B?cEVJTTNpQ01UTE01UEsxS0tHTDllN2ZFeElVcjNhNWp2NWlQVk1GaHNFMmlM?=
 =?utf-8?B?N3M3eDMrRllSOHA5MGJHN3o1N0pJaGkzSE4xSUcwa29uZjg4ZFpqUjF3TlRB?=
 =?utf-8?B?N2J5NHJkZms2bCs3VjhLS2xHODc2ZXRuTXoxYnpLUkNJNThVVUlaRlJtMkY5?=
 =?utf-8?B?dTBiSkxBSm9jTGd5dlZveVFoeC9BYk9kUnFnNDQ1S1JaNXk2WjNMeVovZElw?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2680B2BDF2FB54CACC060CE7B251560@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab09c89a-ae24-405e-413b-08ddc379366e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 08:25:52.7630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ixJ4k2aG5Yzbkj3bamAxCYqi9TumJUaJHjm/qkHTAQwzwM1OVjFkVSjDndAfh8Rx2YhcEEcOXRkyoFTLYg+iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9497

T24gTW9uLCAyMDI1LTA3LTA3IGF0IDA5OjMxICswODAwLCBzaGFuZ3lhbyBsaW4gd3JvdGU6DQo+
IEZyb206ICJzaGFuZ3lhby5saW4iIDxzaGFuZ3lhby5saW5AbWVkaWF0ZWsuY29tPg0KPiANCj4g
QWRkIGNhbWVyYSBpc3A3eCBtb2R1bGUgZGV2aWNlIGRvY3VtZW50Lg0KPiANCj4gLS0tDQo+IA0K
PiBDaGFuZ2VzIGluIHYyOg0KPiAgIC0gUmVuYW1lIGJpbmRpbmcgZmlsZSB0byBtZWRpYXRlayxt
dDgxODgtY2FtaXNwLnlhbWwNCj4gICAtIFNwbGl0IGJpbmRpbmdzIGludG8gZm91ciBzZXBhcmF0
ZSBwYXRjaGVzIChvbmUgcGVyIFlBTUwgZmlsZSkNCj4gICAtIFZhcmlvdXMgZml4ZXMgcGVyIHJl
dmlldyBjb21tZW50cw0KPiAgIC0gVXBkYXRlIG1haW50YWluZXJzIGxpc3QNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IHNoYW5neWFvLmxpbiA8c2hhbmd5YW8ubGluQG1lZGlhdGVrLmNvbT4NCj4gLS0t
DQo+ICAuLi4vbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTg4LWNhbWlzcC55YW1sICAgICAgfCA2OCAr
KysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQ0K
PiAgY3JlYXRlIG1vZGUgMTAwNzU1IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS9tZWRpYXRlay9tZWRpYXRlayxtdDgxODgtY2FtaXNwLnlhbWwNCj4gDQo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWsvbWVk
aWF0ZWssbXQ4MTg4LWNhbWlzcC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL21lZGlhdGVrL21lZGlhdGVrLG10ODE4OC1jYW1pc3AueWFtbA0KPiBuZXcgZmls
ZSBtb2RlIDEwMDc1NQ0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjUzZGJmNTE1MmU3OA0KPiAtLS0g
L2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlay9tZWRpYXRlayxtdDgxODgtY2FtaXNwLnlhbWwNCj4gQEAgLTAsMCArMSw2OCBA
QA0KPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UpDQo+ICsjIENvcHlyaWdodCAoYykgMjAyNCBNZWRpYVRlayBJbmMuDQo+ICslWUFNTCAx
LjINCj4gKy0tLQ0KPiArJGlkOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvbWVkaWF0ZWsvbWVkaWF0ZWssY2FtaXNwLnlhbWwq
X187SXchIUNUUk5LQTl3TWcwQVJidyFsRjFoZVFpS1ZBYkZJWFhYUWZSMmlhQ25jTEZGWlE2Y1J2
aEZKWUdBajNNVWJRa1RjN0F2SDN5UEJRamxzSnkzUnpSdE9TaEJYeGM0ZWdZTXE0RWthNkEkIA0K
PiArJHNjaGVtYTogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchbEYxaGVR
aUtWQWJGSVhYWFFmUjJpYUNuY0xGRlpRNmNSdmhGSllHQWozTVViUWtUYzdBdkgzeVBCUWpsc0p5
M1J6UnRPU2hCWHhjNGVnWU1Cc2UtLU5rJCANCj4gKw0KPiArdGl0bGU6IFRoZSBjYW1pc3AgdW5p
dCBvZiBNZWRpYVRlayBJU1Agc3lzdGVtDQo+ICsNCj4gK21haW50YWluZXJzOg0KPiArICAtIFNo
YW5neWFvIExpbiA8c2hhbmd5YW8ubGluQG1lZGlhdGVrLmNvbT4NCj4gKyAgLSBTaHUtaHNpYW5n
IFlhbmcgPHNodS1oc2lhbmcueWFuZ0BtZWRpYXRlay5jb20+DQo+ICsgIC0gU2h1bi15aSBXYW5n
IDxzaHVuLXlpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiArICAtIFRlZGR5IENoZW4gPHRlZGR5LmNo
ZW5AbWVkaWF0ZWsuY29tPg0KPiArDQo+ICtkZXNjcmlwdGlvbjoNCj4gKyAgTWVkaWFUZWsgY2Ft
aXNwIGlzIHRoZSBJU1AgYXV4aWxpYXJ5IHVuaXQgZm9yIGNhbWVyYSBzeXN0ZW0gaW4gTWVkaWFU
ZWsgU29DLg0KPiArDQo+ICtwcm9wZXJ0aWVzOg0KPiArICBjb21wYXRpYmxlOg0KPiArICAgIGNv
bnN0OiBtZWRpYXRlayxtdDgxODgtY2FtaXNwDQo+ICsNCj4gKyAgcmVnOg0KPiArICAgIG1pbkl0
ZW1zOiAxDQo+ICsgICAgbWF4SXRlbXM6IDENCj4gKyAgICBkZXNjcmlwdGlvbjoNCj4gKyAgICAg
IEJhc2UgYWRkcmVzcyBvZiB0aGUgY2FtaXNwIGhhcmR3YXJlIGJsb2NrLg0KPiArDQo+ICsgIHJl
Zy1uYW1lczoNCj4gKyAgICBpdGVtczoNCj4gKyAgICAgIC0gY29uc3Q6IGJhc2UNCj4gKyAgICBt
aW5JdGVtczogMQ0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsgICAgZGVzY3JpcHRpb246DQo+ICsg
ICAgICBOYW1lIGZvciB0aGUgcmVnaXN0ZXIgcmVnaW9uLiBNdXN0IGJlICJiYXNlIi4NCj4gKw0K
PiArICBwb3dlci1kb21haW5zOg0KPiArICAgIG1pbkl0ZW1zOiAxDQo+ICsgICAgbWF4SXRlbXM6
IDENCj4gKyAgICBkZXNjcmlwdGlvbjogUG93ZXIgZG9tYWluIGZvciB0aGUgY2FtaXNwIGJsb2Nr
Lg0KPiArDQo+ICsgIG1lZGlhdGVrLHNjcDoNCj4gKyAgICBkZXNjcmlwdGlvbjogTWVkaWFUZWsg
Y28tcHJvY2VzcyB1bml0IGZvciBJU1Agc3lzdGVtDQo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPiArDQo+ICtyZXF1aXJlZDoNCj4gKyAgLSBj
b21wYXRpYmxlDQo+ICsgIC0gcmVnDQo+ICsgIC0gcmVnLW5hbWVzDQo+ICsgIC0gcG93ZXItZG9t
YWlucw0KPiArDQo+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gKw0KPiArZXhhbXBs
ZXM6DQo+ICsgIC0gfA0KPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tZWRpYXRl
ayxtdDgxODgtcG93ZXIuaD4NCj4gKw0KPiArICAgIHNvYyB7DQo+ICsgICAgICBpc3BAMTYwMDAw
MDAgew0KPiArICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4OC1jYW1pc3AiOw0K
DQpJbiBbMV0sIEkgaGFzIGFscmVhZHkgc2F5cyBpbiB0aGUgc2FtZSBhZGRyZXNzLCBpdCBzaG91
bGQgbm90IGhhdmUgbW9yZSB0aGFuIG9uZSBkZXZpY2Ugd2l0aCBkaWZmZXJlbnQgY29tcGF0aWJs
ZS4NCkZvbGxvdyBbMV0gdG8gbW9kaWZ5Lg0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQxMDA5MTExNTUxLjI3MDUyLTIt
U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbS8jMjYxMTQ5NTgNCg0KUmVnYXJkcywNCkNLDQoN
Cj4gKyAgICAgICAgcmVnID0gPDAgMHgxNjAwMDAwMCAwIDB4MTAwMD47DQo+ICsgICAgICAgIHJl
Zy1uYW1lcyA9ICJiYXNlIjsNCj4gKyAgICAgICAgbWVkaWF0ZWssc2NwID0gPCZzY3BfZHVhbD47
DQo+ICsgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxODhfUE9XRVJfRE9NQUlOX0NB
TV9NQUlOPjsNCj4gKyAgICAgIH07DQo+ICsgICAgfTsNCj4gKw0KPiArLi4uDQo+IFwgTm8gbmV3
bGluZSBhdCBlbmQgb2YgZmlsZQ0KDQo=

