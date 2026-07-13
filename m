Return-Path: <linux-media+bounces-67420-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id etMWO51YVGqmkwMAu9opvQ
	(envelope-from <linux-media+bounces-67420-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 05:16:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE59746E1D
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 05:16:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=mOBeczpA;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.s=selector2-mediateko365-onmicrosoft-com header.b=s6JHlR3N;
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67420-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67420-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5086A300820C
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 03:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7222EB5B8;
	Mon, 13 Jul 2026 03:16:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AF72E2DFB;
	Mon, 13 Jul 2026 03:16:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783912591; cv=fail; b=dUg9x/+1Qx5hJmlIM8434KyOQsYcZHEqkJ0Qvb2Tm5Ym1Z0lf9wQoOYF87V+aGsMdqqjT55CWv47HkBMvayyuX850cYU61JxOPc6iKNCBtxrr+hKQzmaQUz3Qv9oOWXiKFpuHHkE8tIKy+LpxTq7rL1mvqE3+3y2gz5RbVopMm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783912591; c=relaxed/simple;
	bh=F5k88jUeM0P+V+lADkfj/P8EbX+8qnMS+/odOo5Bjdo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C0Y0mz6k2d+zl8Yfjo+kwTaYcwCEWT/0hzUS5sH0XgkNyY7C8HSWJP03Ygi8mSFnDvme0OU056AMB8v4h4PrRdGMATBVoj0K2VdD2asQ0x0OrAio5is0H43DjadFlVQBC0JjMo7WnuKNJyqSOdN6n3CEIalry4CubFrKOLpaNcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=mOBeczpA; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=s6JHlR3N; arc=fail smtp.client-ip=210.61.82.184
X-UUID: 377ca2ec7e6911f18dc8c9802ae25ab1-20260713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=F5k88jUeM0P+V+lADkfj/P8EbX+8qnMS+/odOo5Bjdo=;
	b=mOBeczpAbhrUC7Di1VMKH2Wr2K7U1wfjJ8tmzOr6IB0B5ELMvWDQiYaMt/4nTFtsfOgsWo4NpbdcEUIWuCHIALHuaVXH+lOXeB5qzuaC9YvyYHKNfDaczDMX7CcPmA+zu12J1GOB2bY8/NSbk9ESs5ad6EhzynSD4fOVQGA/FM0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:467422bc-6dfe-4cf3-b95c-a7c4df6a9e63,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:7bda9f55-f38b-430b-a6f2-741debd53b1f,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
	1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 377ca2ec7e6911f18dc8c9802ae25ab1-20260713
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1928178649; Mon, 13 Jul 2026 11:16:19 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 13 Jul 2026 11:16:19 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 13 Jul 2026 11:16:18 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgWDaj8cFpQtO6ZWEafAzKKVrCeuKRJymcVdwZI5eUkr4bQX+jv9Ft4JNW/ApzbeBGu9OS1Pv+CJ0DCnTCeL+k6g5ESJxRYdgcctVrgUI/wST0xNEwXCdIheZiObRN8XiUkFR4eV34RZK3ry1zn6Ri7uQKeRL9IOQOH5MJtt5wyAH34HJA8dYsLZeooPKVRV00zDKAlUaW/mRmVOSC/Ocv/Mr0fDZt1urSxGKa+IHY6mHbt0LLVP4I5KOcXxBBF5B4+d6Q7+vJiQtF2XSZHnii6+fAXL6ZUHY92nETc/323Ln0k1e1mqmQLK8j81Vz2/TJfkY5fvqsNNxnHV1p4l9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5k88jUeM0P+V+lADkfj/P8EbX+8qnMS+/odOo5Bjdo=;
 b=qlInwqAbdU+k19QrBsaoPdN4+svu1Ib5atDkUCbQXIUJjNp/MYGwmhB51CrvTHMpCYz2FuCCPIFZh9u4vcAGbW/HwL6/tALkUouEKNCXZ7W1YCoF6vwTryzBC6dYTkAQxmKydTO64DTz+cfbHJyOiGDa7xMbYyBoKfiMTj61ODPksRhRCJqLcG6D8rtuR5uS69zd7mf0PF1nllo6ckFgEOLBseHphOjAeOxBlu4uvr7YgNg6z7ur5Z+/h7owVEuo9FRuQuJmeJYH0+tGq1U+DRq6W5o0I+k/WqxSPBRp5j9G/QqBqDLfkTNott+ciw6VvfdViajg4pVlvV1/V4Mfug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5k88jUeM0P+V+lADkfj/P8EbX+8qnMS+/odOo5Bjdo=;
 b=s6JHlR3NiL9DRlskJ2WHhIjzrtPXS0nXsYYFdOdJk4JUM6YfideyqyR2SASGVQKg1jd2x9JmCcdTctRcxOuDnKajNT1OaFLN1ig1ddp5ITuvULF/ktrLougLkEoSOZvt4yn6z+fD7FEdHt+qCMAdMAUANOFrvsScn3h/VPtqSBo=
Received: from SI2PR03MB6195.apcprd03.prod.outlook.com (2603:1096:4:14f::13)
 by TYZPR03MB6472.apcprd03.prod.outlook.com (2603:1096:400:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 03:16:15 +0000
Received: from SI2PR03MB6195.apcprd03.prod.outlook.com
 ([fe80::ea95:8d21:d28a:6b2c]) by SI2PR03MB6195.apcprd03.prod.outlook.com
 ([fe80::ea95:8d21:d28a:6b2c%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 03:16:15 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: "fshao@chromium.org" <fshao@chromium.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>, "fanwu01@zju.edu.cn" <fanwu01@zju.edu.cn>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	"haoxiang_li2024@163.com" <haoxiang_li2024@163.com>, "tfiga@chromium.org"
	<tfiga@chromium.org>, "rongqianfeng@vivo.com" <rongqianfeng@vivo.com>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "ribalda@chromium.org" <ribalda@chromium.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "kees@kernel.org" <kees@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "tzungbi@kernel.org"
	<tzungbi@kernel.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>, "laurent.pinchart+renesas@ideasonboard.com"
	<laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 11/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Thread-Topic: [PATCH v5 11/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Thread-Index: AQHc8zTJmQAHSFF55UedyoJlOeRSeLYtAc6AgCziDoCAAN5kgIAQQucA
Date: Mon, 13 Jul 2026 03:16:14 +0000
Message-ID: <f7b6225063d1cb92d5ea12d0d40f8a1c1d51c9c8.camel@mediatek.com>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
	 <20260603084045.17488-12-kyrie.wu@mediatek.com>
	 <20260603-pentagram-unleveled-8729d0003aa7@spud>
	 <6cb7ae4a09d476a04ceefca50564646712ad391b.camel@mediatek.com>
	 <20260702-parlor-disband-fdc2f049336c@spud>
In-Reply-To: <20260702-parlor-disband-fdc2f049336c@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6195:EE_|TYZPR03MB6472:EE_
x-ms-office365-filtering-correlation-id: 66cbaef1-b3c3-40dd-02c8-08dee08d194a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|18002099003|22082099003|6133799003|56012099006|11063799006|4143699003|3023799007|38070700021;
x-microsoft-antispam-message-info: irrcMl9DBvqqDChpIHdOgL1tYzL7IiwtocOkrLYk5CkYqhYkdaakyLWrjyOsHF2IQ8dbuHblMIYAfYDLXBpU6JwZArmA5tHgZY1IlZfdt5I2AGatUrW9kKv4rj9Yxne2XdubY2/0N6KaiN0hDV2aq5WOhJrqTE9aWwAj0fMlZ8pWdW+uE06IY2mMrH/4Z8Gy88lKuj5b93pm0QUChuCtgdXLho9kG01BWSG+pT4lLSLlEUHDYW6tiFNuUF3t5ki17QQiEnT8Q2b3PzPJvwh+9bXjK3V02ljbehPeCLhdA9SEPyNGoPqCQswvGCkSHp34XUE+Vcd8Ire0+YzYU5xLiDgS2bKpnzSi2je4+M902U7swnRlCYnxGkVu+GXq7//Qmn6SCXwA8T+AMiCM7TFOOq9R9c23DOgifaO2ulJOrL+dmbUNyaAbiNd2CMb6J0jjzetxo4Ol5w1DI161z6qzApVXGQQcqlInl0izYeDU0pqJKIxgZBRkhdj42c1uUWWQWMJitOIPsH3bN3KmzD6aPcGjQwWy2dj3qoP22OY6HTLnKA0gbANFs0UN737frTO4A/OtDs3wgY0cEVcgukEOvWv9fy9lmm+w0GpzrxLNK9OD0auHnOgQNOPToI0xE1+PNBm/nhbVl5fZfE/GEiy878YnRWoK6wBbfa21nB8y2ScH1AgSMhTHiH+JT8916a2qZkNVo154TKcZzLWCqPejJh4ATKaV2kqijrLuj5cPWuk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6195.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(4143699003)(3023799007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkhSaWhLa0pmOGVOZ1cxajU3MGd6cENkRzJ5UGFTcjRTalgyNWNSWVVnbEpJ?=
 =?utf-8?B?S05ONm5wamliU2JIS2ZjYnp0ZjU5T1hvYmlPMHRlMWd5a1d6VE14OVhLTi9x?=
 =?utf-8?B?NEljUlZ5WDVLS1F0cHNYUUVjUG93b1pnRXB2SWtYdXJQL2VvUkJOUHplUU0v?=
 =?utf-8?B?RHJPeXE0VU5VSktCZEc5T3hMczZ0TUNuTHNNVnQ3WTdDR0RlK1loNVRIREpt?=
 =?utf-8?B?Y2dZQmtGRTRlamMzTmJtZ3NMNDU1OVBSRTlkci9aNVhKdEtUWHVnbGFqRDRN?=
 =?utf-8?B?NU5VUTlHVnlvOEd4dzNRbzhmV2JVTUN2OGdRUlFRV0JHZUovc3krK0Zwdzh0?=
 =?utf-8?B?T2E3Sm55Wkl5bndBMzVVbmZQMmpmcGxkWFhHUEhyU3dyL3pKaXlUMjEvRUtV?=
 =?utf-8?B?TTNCT004bG01c1VKZ2lRMmZ1cXFiS2pWeHBieUxnaUp0akRORExqSS9aYVFt?=
 =?utf-8?B?dnkvOHpjN3YwTVR2QW4wNFQ0SFUyTXhuZ3FSaW5KT3lIWjVzUGVReXNpS3h1?=
 =?utf-8?B?cENzS2xSM2w2UW5PV1B5dndHblA1dWN3a0lYUi9PeEdJZEpRVDN4ZHk4Rm5S?=
 =?utf-8?B?aG5IdzJUcTJVdlBJazAyMDhrdWdpZ1Bka0sxKytFcUppbUtmcVljQTBMNmNO?=
 =?utf-8?B?djd6aVZuY1FXMjFMTVdJYjZpa0U3NjlMelA4a2dUbHBJMEJXWENZT0k2N0VP?=
 =?utf-8?B?MzY1NHNDejdDQzFDYUxGc0xLZzlDdW5zT0xZakZnaTllYVJXRFIycFNwR3M5?=
 =?utf-8?B?OEd5NHJjMXZwQkR2T2x5U1BYa1FDZUlJR1J3bi9uU240Y3kxeUxPVFY5amVz?=
 =?utf-8?B?UDE3NFhTT1luSUN3eE05Zk1LanM4WFFvVnZxMU4xOHdTaCtNNi9rK2pHSjRI?=
 =?utf-8?B?MGdiTVJ3bTZ2Ync5elV2UnNybkVxUWs2Z3dIbm5sRXp0NEVZdHpXUVlueEVq?=
 =?utf-8?B?Q3crMmdxamUyRTJOZTZwWlMxY09OdHZ3Q1hyck1MMHpzZE5yQUFZaDRuMGk0?=
 =?utf-8?B?S1FkSDY0RmFjdDlsa0ZvTkVsblV5WE02a21QVzBGQVFFb0hCcUloZVFPQjUy?=
 =?utf-8?B?U2tOWGZvY3hJN053OGsyRm10ODloRFp1b1FacDE4M1hWSGl5Y1FLQWNhWHY4?=
 =?utf-8?B?K2txV3gwN0ppNHpwdy9pb004dHJaeWpqM1ZPekdMSTY2ZzhhN2xGTmpZVmpW?=
 =?utf-8?B?cFZWejBvRWNsc2pSZkZ2aW5DOUNJdkpXWFVJTUJZQ1lHNkVwRncyWnNJV1dl?=
 =?utf-8?B?Zi9OWC9MamRJb1J4aXVRbzJyRTcrZmhVMTI4VWh2SksrTzgwWFdqZzNqWWdi?=
 =?utf-8?B?M0NneG80bnlRNlhaZVZCR1p4TTJ0WjJ4anozVjBTcXFMVnBwVDNvU3d1ZGhF?=
 =?utf-8?B?QW9MelFWYy9pMUZmYXg3WnF1UjVuUGJLYmwwMWUySVhaYjQrM3ozOVZESDRO?=
 =?utf-8?B?dnpCNStWTWdTRzF2Y00wVXI1enQvOFZKWmwyNkZsTUc0ZGFiaWZkbmJROStw?=
 =?utf-8?B?ZExLSC9FRmQ4bkhHcHFnVjRNNVRoRFZBVkdPdStzc0tHMFJNaVpsUm5jbUxy?=
 =?utf-8?B?RktCWGxEei8reHFiMWRDeEhFWnlCcHE0aXVTWEpPUmNjN0M1Ynk4Zkl0NFVj?=
 =?utf-8?B?dkdWbmtTV2tGV0M5bEd3VTlIUlduaUdkK2xsbkxkMzVLRDFPWWdiT292NVE2?=
 =?utf-8?B?d2R4b0FmQ25rbndqSmd2dk50Tm1DYlpkdVNEL2RMK0t4cWNFTVM1czYwL2Fv?=
 =?utf-8?B?NjJLRll4ZVFLa2Z6cmk4eFpsb1ZYS1VzZGVSWkV1c3p5ZjlvMkZhRzduaVE3?=
 =?utf-8?B?L0NvYkZ1SlhFbHBMbTk0K09tSW9WZkg5L25WK2t1bTR3bm5IeTdrOWxKYjVB?=
 =?utf-8?B?WjlhWkI1SXFlelRoaFVZc3JpeG5IZHlFRkpxMUxuTHdvYmorZWcxQncrVlly?=
 =?utf-8?B?Yno2VlczenUvbGdiTFNXYUhGbEdlTkdaOXE1SkRmRUhJdSt5QXZxakQ2UUxp?=
 =?utf-8?B?eTlXOHNOa0Z5MWIvZ2pZQWxKWVE2R3QwZ1RTcUhwUzkyejUzaTlZSUFIUjZ0?=
 =?utf-8?B?bUpTVGwvMkRIRzJsekR5VzRLUjA4dDgvblQ4ZXloSzR3TGdROXJvVHlZU1d3?=
 =?utf-8?B?Sk9DMEZHWDJLQlEvZ2J2TFBMS3hMMFd2MUovZnN6cHlOa25HYkFPUUlRVjl1?=
 =?utf-8?B?R1RFdG9XbFZ3a3d5YXRBbjY5OGNPeDZ2QlhnVnI5T0xxRUU0YWFRRWFienRm?=
 =?utf-8?B?SUtRQTV5V3BmS3JqN3NIUzZ5RnJIRm40NVRueHgvTUNsY20rc0xZdVpWRTVn?=
 =?utf-8?B?by9Rd0EycnBETXA2eFhSSnY5RGE1V3lEVzhMWWxDbjBUWXlpVFJhdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6ED1E0F1E167C4F9C6E37CB8175A43E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hQuDwYxK59RJknLbHkDcMAjKNf69jXfWPrPntxSN4hSujcAiCegnUPJqeYhGgLa5ubjsf0wILElRlhffuGkmcWydx/TibdFBSiIXknfXsXBfQE+CBFjuMZMk0PZ7qB6shf0+mMrMEM7ixFK6NIin3ZMwUQ+/fxHQiJXwSfYeQT1CU4ii0Vv17tjh312qAXRgqVKPxWMC1iWFVICRKKcXlPjqbzWZFQpqeZi4JdewdeOj/vruAcDNtalEnsBXFigRKTD62rtwVqG++ZKWBKzXx5tKIM5HB/fMdR8g2J9QFm8FkZDu3Noi6dAu1t5WXEbB3dbVsTp1/vCsoIxZhPxqFg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6195.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cbaef1-b3c3-40dd-02c8-08dee08d194a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 03:16:15.1784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4gmaaDV5EENMnmE2QQSrxKiqN0i/cie0cTJ4sJQsrVcpiazUsc3SSR1qmUioOF964GeRdAcftQn8LscHtgFe1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6472
X-MTK: N
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[34];
	TAGGED_FROM(0.00)[bounces-67420-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Kyrie.Wu@mediatek.com,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,kernel.org,mediatek.com,zju.edu.cn,ideasonboard.com,163.com,vivo.com,vger.kernel.org,collabora.com,pengutronix.de,lists.infradead.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:fshao@chromium.org,m:conor+dt@kernel.org,m:Yunfei.Dong@mediatek.com,m:fanwu01@zju.edu.cn,m:jacopo.mondi@ideasonboard.com,m:haoxiang_li2024@163.com,m:tfiga@chromium.org,m:rongqianfeng@vivo.com,m:Andrew-CT.Chen@mediatek.com,m:devicetree@vger.kernel.org,m:ribalda@chromium.org,m:wenst@chromium.org,m:linux-media@vger.kernel.org,m:kees@kernel.org,m:linux-kernel@vger.kernel.org,m:benjamin.gaignard@collabora.com,m:Irui.Wang@mediatek.com,m:Kyrie.Wu@mediatek.com,m:krzk+dt@kernel.org,m:p.zabel@pengutronix.de,m:linux-mediatek@lists.infradead.org,m:tiffany.lin@mediatek.com,m:sakari.ailus@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:mchehab@kernel.org,m:sebastian.fricke@collabora.com,m:robh@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:tzungbi@kernel.org,m:nicolas.dufresne@collabora.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:krzk@kernel.org,m:matthiasbgg@gmail.com,m:hverku
 il@kernel.org,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,mediateko365.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:from_mime,mediatek.com:email,mediatek.com:mid,mediatek.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Kyrie.Wu@mediatek.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco,renesas];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AE59746E1D

T24gVGh1LCAyMDI2LTA3LTAyIGF0IDE5OjU1ICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IE9uIFRodSwgSnVsIDAyLCAyMDI2IGF0IDA1OjM5OjI0QU0gKzAwMDAsIEt5cmllIFd1ICjlkLTm
mZcpIHdyb3RlOg0KPiA+IE9uIFdlZCwgMjAyNi0wNi0wMyBhdCAxNzoxNCArMDEwMCwgQ29ub3Ig
RG9vbGV5IHdyb3RlOg0KPiA+ID4gT24gV2VkLCBKdW4gMDMsIDIwMjYgYXQgMDQ6NDA6NDFQTSAr
MDgwMCwgS3lyaWUgV3Ugd3JvdGU6DQo+ID4gPiA+IEZyb206IFl1bmZlaSBEb25nIDx5dW5mZWku
ZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4gPiA+IA0KPiA+ID4gPiBUaGUgTVQ4MTk2IGRlY29kZXIg
ZGlmZmVycyBmcm9tIHByZXZpb3VzIGdlbmVyYXRpb25zIGluIHNldmVyYWwNCj4gPiA+ID4ga2V5
IGFzcGVjdHMsIG1vc3Qgbm90YWJseSBpbiBpdHMgdXNlIG9mIFZDUCBpbnN0ZWFkIG9mIFNDUC4N
Cj4gPiA+ID4gQWRkaXRpb25hbGx5LCB0aGUgTVQ4MTk2IGVuaGFuY2VzIGNvZGVjIGNhcGFiaWxp
dGllcyBieQ0KPiA+ID4gPiBzdXBwb3J0aW5nDQo+ID4gPiA+IEhFVkMgTWFpbjEwIHByb2ZpbGUg
ZGVjb2RpbmcuIFRvIGFjY29tbW9kYXRlIHRoZXNlIGhhcmR3YXJlDQo+ID4gPiA+IGNoYW5nZXMs
DQo+ID4gPiA+IHRoZSBiaW5kaW5nIGNvbnN0cmFpbnRzIHNwZWNpZnkgYSB0b3RhbCBvZiAxMiBj
bG9jayBpbnB1dHMsDQo+ID4gPiA+IGNvbnNpc3Rpbmcgb2YgOSBkZWNvZGVyIGNsb2NrcyBhbmQg
MyBWQ1AgaW50ZXJmYWNlIGNsb2NrcywNCj4gPiA+ID4gYWxvbmcgd2l0aCAyIHBvd2VyIGRvbWFp
bnMgY292ZXJpbmcgYm90aCB0aGUgZGVjb2RlciBhbmQgVkNQDQo+ID4gPiA+IHN1YnN5c3RlbXMu
DQo+ID4gPiANCj4gPiA+IEknbSBwcmV0dHkgcHJldHR5IGNvbmZ1c2VkIGJ5IHRoaXMgc3RhdGVt
ZW50IGFib3V0IGNvbnN0cmFpbnRzLA0KPiA+ID4gc2luY2UNCj4gPiA+IHRoZXJlJ3Mgbm9uZSBh
ZGRlZD8NCj4gPiA+IFRoZSB2Y29kZWMtZGVjIG5vZGUgZG9lc24ndCBldmVuIHNlZW0gdG8gcGVy
bWl0IGNsb2NrcyBhdCBhbGw/DQo+ID4gPiANCj4gPiBEZWFyIENvbm9yLA0KPiA+IA0KPiA+IEkg
YXBvbG9naXplIGZvciBhbnkgY29uZnVzaW9uIG15IGNvbW1pdCBtZXNzYWdlIGNhdXNlZC4gV2hh
dCBJDQo+ID4gd2FudGVkDQo+ID4gdG8gY29udmV5IHdhcyB0aGUgaGFyZHdhcmUgZGlmZmVyZW5j
ZXMgYmV0d2VlbiB0aGUgTVQ4MTk2IGFuZA0KPiA+IHByZXZpb3VzDQo+ID4gSUNzLiBJZiB5b3Ug
ZmVlbCB0aGF0IHRoZSBWQ1AgYW5kIGNsb2NrIGluZm9ybWF0aW9uIGFyZSBub3QNCj4gPiBzdWl0
YWJsZQ0KPiA+IGZvciB0aGlzIGxvY2F0aW9uLCBJIHdvdWxkIGxpa2UgdG8gcmV3cml0ZSB0aGUg
Y29tbWl0IG1lc3NhZ2UgYXMNCj4gPiBmb2xsb3dzOg0KPiA+IENvbXBhcmVkIHRvIHByZXZpb3Vz
IElDcywgdGhlIE1UODE5NiBzdXBwb3J0cyBhIDEwLWJpdCBkZWNvZGVyIGFuZA0KPiA+IGhhcw0K
PiA+IGEgZGVjb2RpbmcgY2FwYWJpbGl0eSBvZiA0S0AxMjBmcHMsIHVzaW5nIGEgZHVhbCBoYXJk
d2FyZSBkZWNvZGluZw0KPiA+IGFyY2hpdGVjdHVyZSBvZiBMQVQrQ09SRS4NCj4gDQo+IFN1cmU/
IEJ1dCB5b3VyIGNvbW1lbnRzIGFib3V0IHRoZSBjb25zdHJhaW50cyBhcmUgb2RkIGFuZCBJIGRv
IG5vdA0KPiBrbm93DQo+IGlmIHRoYXQgbWVhbnMgeW91IG9taXR0ZWQgY2hhbmdpbmcgY29uc3Ry
YWludHMgd2hlbiB5b3Ugc2hvdWxkIGhhdmU/DQo+IEZvciBleGFtcGxlLCB1c2luZyBsYXQrY29y
ZSBvbmx5IHBlcm1pdHMgeW91IDEwIGlucHV0IGNsb2NrcyBidXQgeW91cg0KPiBjb21taXQgbWVz
c2FnZSB0YWxrcyBhYm91dCAxMi4NCj4gDQoNCkRlYXIgQ29ub3IsDQoNCkkgYXBvbG9naXplIGZv
ciBhbnkgY29uZnVzaW9uIG15IGNvbW1pdCBtZXNzYWdlIGNhdXNlZC4gV2hhdCBJIHdhbnRlZA0K
dG8gY29udmV5IHdhcyB0aGUgaGFyZHdhcmUgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgTVQ4MTk2
IGFuZCBwcmV2aW91cw0KSUNzLiBJIHdvdWxkIGxpa2UgdG8gcmV3cml0ZSB0aGUgY29tbWl0IG1l
c3NhZ2UgYXMgZm9sbG93czoNCkNvbXBhcmVkIHRvIHByZXZpb3VzIElDcywgdGhlIE1UODE5NiBz
dXBwb3J0cyBhIDEwLWJpdCBkZWNvZGVyIGFuZCBoYXMNCmEgZGVjb2RpbmcgY2FwYWJpbGl0eSBv
ZiA0S0AxMjBmcHMsIGFsc28gc3VwcG9ydHMgMzYtYml0IERSQU0gSU9WQQ0KYWRkcmVzcyBhbmQg
VmlkZW8gUG93ZXIgQ29udHJvbCB0byBvcHRpbWl6ZSBiYW5kd2lkdGggYW5kIHZvbHRhZ2UNCnVz
YWdlLg0KDQpJIHdpbGwgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSBhY2NvcmRpbmdseSBpbiB0
aGUgbmV4dCByZXZpc2lvbi4NCg0KVGhhbmtzIGEgbG90Lg0KDQpSZWdhcmRzLA0KS3lyaWUNCg0K
PiA+IA0KPiA+IFRoYW5rcy4NCj4gPiANCj4gPiBSZWdhcmRzLA0KPiA+IEt5cmllLg0KPiA+ID4g
PiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWXVuZmVpIERvbmcgPHl1bmZlaS5kb25nQG1lZGlh
dGVrLmNvbT4NCj4gPiA+ID4gQWNrZWQtYnk6IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVm
cmVzbmVAY29sbGFib3JhLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IMKgLi4uL2JpbmRpbmdz
L21lZGlhL21lZGlhdGVrLHZjb2RlYy1zdWJkZXYtDQo+ID4gPiA+IGRlY29kZXIueWFtbMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgDQo+ID4gPiA+IDEgKw0KPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMt
DQo+ID4gPiA+IHN1YmRldi0NCj4gPiA+ID4gZGVjb2Rlci55YW1sDQo+ID4gPiA+IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy0NCj4gPiA+
ID4gc3ViZGV2LQ0KPiA+ID4gPiBkZWNvZGVyLnlhbWwNCj4gPiA+ID4gaW5kZXggYmY4MDgyZDg3
YWMwLi43NGUxZDg4ZDMwNTYgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtDQo+ID4gPiA+IHN1YmRldi1k
ZWNvZGVyLnlhbWwNCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy0NCj4gPiA+ID4gc3ViZGV2LWRlY29kZXIueWFtbA0K
PiA+ID4gPiBAQCAtNzYsNiArNzYsNyBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiDCoMKgwqDCoMKg
wqAgLSBtZWRpYXRlayxtdDgxODYtdmNvZGVjLWRlYw0KPiA+ID4gPiDCoMKgwqDCoMKgwqAgLSBt
ZWRpYXRlayxtdDgxODgtdmNvZGVjLWRlYw0KPiA+ID4gPiDCoMKgwqDCoMKgwqAgLSBtZWRpYXRl
ayxtdDgxOTUtdmNvZGVjLWRlYw0KPiA+ID4gPiArwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10ODE5
Ni12Y29kZWMtZGVjDQo+ID4gPiA+IMKgDQo+ID4gPiA+IMKgwqAgcmVnOg0KPiA+ID4gPiDCoMKg
wqDCoCBtaW5JdGVtczogMQ0KPiA+ID4gPiAtLSANCj4gPiA+ID4gMi40NS4yDQo+ID4gPiA+IA0K
DQo=

