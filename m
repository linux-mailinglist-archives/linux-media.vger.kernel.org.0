Return-Path: <linux-media+bounces-66291-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S0WPIzT6RWpNHQsAu9opvQ
	(envelope-from <linux-media+bounces-66291-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 07:42:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 083296F399F
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 07:42:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=JKoC1auG;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.s=selector2-mediateko365-onmicrosoft-com header.b=GTnLbfy2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66291-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66291-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 959113050E46
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 05:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF1A36997A;
	Thu,  2 Jul 2026 05:39:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8527835836E;
	Thu,  2 Jul 2026 05:39:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782970779; cv=fail; b=COBSQOeQsYYX7ujZ5qsG2CxuG9gMa1rKuzHV7RLArmYfxUbiXz5y9I4k50SmLdKDC9C65h4nCgT2xD+Yrt0J5co2VAih+FceBh9OnzYqLPHFtCmEKNF+Mz1et3EHB3taeWS6288j0tiV7tSggAmKMbwW7qcfUbSUe3QdQmfLopU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782970779; c=relaxed/simple;
	bh=hbmwmb0IoB1tDZQyYMpFBZ3JX8JFovRf4QDl80cNJqU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JwaZFVqElhPzhz912zrcfz1qOPkb1ii+3VoxYfrjcXC9d7YFNXudMf1WbOnFeX1iXVg508DlDcNvXbpP2OV5+vx49NC2S1pgDIxRdLTx0xKLTYlLpQbAUSlFYKmPTc7afDPY6etUUHeQEgf1aPH0K+vIqIz27lXUwSbcU7LbZ7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JKoC1auG; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=GTnLbfy2; arc=fail smtp.client-ip=210.61.82.184
X-UUID: 64f6933475d811f18dc8c9802ae25ab1-20260702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hbmwmb0IoB1tDZQyYMpFBZ3JX8JFovRf4QDl80cNJqU=;
	b=JKoC1auG+8yM9CI5M6pWaJ7M4bcEL0+UxVjS8G/TVix/7w0k41RgGUCl5q3+3bafjIOwIkfwAVz4iGG9iSNuUsf1F/J0tS+0mBr9irXDFAMzLfxcGaxCTli8RrBcYrQVVH7VmMY5ThtvQ1inzBDkoLHSQwbG7GoAFMFVdeR7cws=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:85064003-9e93-40ef-bb51-facd51b480c1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:ba35e681-6310-4e6b-a6b1-aca20d98ed8b,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
	1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 64f6933475d811f18dc8c9802ae25ab1-20260702
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 253436010; Thu, 02 Jul 2026 13:39:29 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 2 Jul 2026 13:39:28 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 2 Jul 2026 13:39:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZ2PrTgdbCDzVSs8rVfv0bW4PBd/0kqwgHzzwlI5LzeT95qp1HwfD1u4JTVU6EuYTRF9UlGPjJFm/M4l74cqB8gTH2N1IAwZ9rRYA1eX3P/3XOYvtdjzSTCD2tFHsaOXED2c1sLkWwhBQqvMuuTQSDNXOBB3A34fc2UMpOKhnCYODI4zclVAsX6+jpBgPdLaktsSHoADYrr3gHv5cJepinDGlzF4owjSRBuLD7WNakCG9JWOqEtppiWORgULsYt3Dk5stB0avUMtw7gXx0NalEtBZnwE8JwXW3joWlTS/bdnRbPJqUFQRDmcUW61v+TbBGfeVMFMCwt6zsGg26jnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbmwmb0IoB1tDZQyYMpFBZ3JX8JFovRf4QDl80cNJqU=;
 b=b4hcx0E0BhRbUoIttvsSlxlwbP6qcp8gduQ91kpozHeqR2AxUscs/hTeAzbWOEZP6uFjITPG6dlS2XOwjxkQk4CbduHj3w2WXQ7e9N2vRxkYSy+pyN0FW3J1qYNn4/ln3dHNPV3E+PFCoRcCtIXv0r9bA+f7yiM2fHwZp/9TujZsE1BrT1bRlKu+g+vbVHncEV7EZD57v/+0CZap3sAn5xHMY4tQqZwmBG1plamV0Z+1+UGVP5FFJ5gZi85c1VYp4+ns+9Kg8U3FOUq2ZZKIKtV6khXe+D+MdOFcgg2NUncc3zYZnrvVq/WhL+MpFCkRvIU4w9yr6NhLbrn2J7KZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbmwmb0IoB1tDZQyYMpFBZ3JX8JFovRf4QDl80cNJqU=;
 b=GTnLbfy2aWP/W8t1IC0c1q0TOW+bz6pRwIhL+P2zT/LceBRpA44qdkjUeWIP0VCkHiV+DLQxOfb19d1qaq0mXZ1ylrdA0gB8rXYAGnVBqqIxRPxCCXtMdqiJJgPHdqog7iHZ5qS+AeY/qAUDkSrXWccg+is4I66gW169p92zAKM=
Received: from KL1PR03MB6197.apcprd03.prod.outlook.com (2603:1096:820:90::5)
 by TYSPR03MB8669.apcprd03.prod.outlook.com (2603:1096:405:8b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 05:39:24 +0000
Received: from KL1PR03MB6197.apcprd03.prod.outlook.com
 ([fe80::6c6:8246:f9fa:d89d]) by KL1PR03MB6197.apcprd03.prod.outlook.com
 ([fe80::6c6:8246:f9fa:d89d%7]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 05:39:24 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"laurent.pinchart+renesas@ideasonboard.com"
	<laurent.pinchart+renesas@ideasonboard.com>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "jacopo.mondi@ideasonboard.com"
	<jacopo.mondi@ideasonboard.com>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"rongqianfeng@vivo.com" <rongqianfeng@vivo.com>, "tzungbi@kernel.org"
	<tzungbi@kernel.org>, "tfiga@chromium.org" <tfiga@chromium.org>,
	"robh@kernel.org" <robh@kernel.org>, "wenst@chromium.org"
	<wenst@chromium.org>, "benjamin.gaignard@collabora.com"
	<benjamin.gaignard@collabora.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "haoxiang_li2024@163.com"
	<haoxiang_li2024@163.com>, "ribalda@chromium.org" <ribalda@chromium.org>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"fshao@chromium.org" <fshao@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"fanwu01@zju.edu.cn" <fanwu01@zju.edu.cn>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kees@kernel.org" <kees@kernel.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v5 11/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Thread-Topic: [PATCH v5 11/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Thread-Index: AQHc8zTJmQAHSFF55UedyoJlOeRSeLYtAc6AgCziDoA=
Date: Thu, 2 Jul 2026 05:39:24 +0000
Message-ID: <6cb7ae4a09d476a04ceefca50564646712ad391b.camel@mediatek.com>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
	 <20260603084045.17488-12-kyrie.wu@mediatek.com>
	 <20260603-pentagram-unleveled-8729d0003aa7@spud>
In-Reply-To: <20260603-pentagram-unleveled-8729d0003aa7@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6197:EE_|TYSPR03MB8669:EE_
x-ms-office365-filtering-correlation-id: b9a05ba7-60e1-45c7-1380-08ded7fc461b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|3023799007|18002099003|22082099003|4143699003|11063799006|56012099006|6133799003|38070700021;
x-microsoft-antispam-message-info: VTXf/djBKOH9wrORnL3V805mGPNLNbnZMLe7GH3kPcoq9vjeqtIZ2G/9OjcRXKQMbZk7N3U25e/N8F9871D/Yw4QculM4kCeXvZc8lMBY6r13coORq2DeOo+8d+YtnyqAEuuLaNPIiwzWSvGquzJtTVk3T3rhh60SwpsY2x7iR26fg3NDVIR7rVnc+BCxz1KPwtpgWXv63H5f3pxvrO9lf9PBG3x+vNT+MATiV/gTUFrauJ4T/as3r+/yd+Csa7MUiEFa6XtVEupOmZoeD50QKt5Qdvau0bSMXJomjx51Y6kNvT2AzYRGs7huKnjs8MMSfYMke9hJBdvVWf9snd4u4W88yN6TdSVJyS0VnnqHodTAnszJpbgq/07Fbq9ZWIkucHIq2VMJfMT7nZtZrP9TfpkyWp/wtMPfTIeSyfx0HZaxtRoPF2zDKJaYGdq1Aw8USE5mUoTf/KaWKtG3jZSkfpy9N1eVGTRyr/zr9WlO91VHCXiN+69b4aU2qrXxB0vOORFuE/it4jHpi+noI5ohJ1qLZQd6Gmvo9RPj4Y0+LJ9u71BFhFznmRAoJiSzZUQSMWu5oMG4AyHJbhSPFykp4/BN+jHMx8oBcySVmDMDkjMqPcG3/W3S9l+pkd8VXL07hZXnhNdy4G9ugUVf9gGfLFPgvdCykis19FXMt7fui6kjiYqe5OIXWdkPK0x3Nf/A+ClhrS5Vfgd38WCNyLDe7HOKwSjjwBlXnyC+HBol0Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6197.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2tmZG1BQmFZZFlxT0NSU05KWS85aHF6NGVsSFQ3ZURMQWFkZVNCbVhndWNE?=
 =?utf-8?B?SlAwT0tXaVJMd2g5dVAxTmI3UEpMaVM3NXhhUEs3ZmExenRaWE94a2o3dlFG?=
 =?utf-8?B?VWIxVC8wY01wS1F5czNicCtOSzAzNU9KUG83UjdBUjFrakdFRWRncld2RENx?=
 =?utf-8?B?clN2OTJPZTU0UEd3SzRibmIxSG9aZ0dpTHFnZlJkTXE0OU5XQ284Zk9RYUVQ?=
 =?utf-8?B?NnJkblJrbjJ0eDZFc0JPU284bXVJcDVsTGViZFRBOEcyTitmemxQWnpLRVBS?=
 =?utf-8?B?Q2hjblNET0x3VlozRUpkYnRPcjdnQ2tQTGVBaWZ3TlgvODYwaWx5bm9kcGxC?=
 =?utf-8?B?Y1haS0k1c2gwaENWWWxOc0RrYWpFUTNneVVCeVlOclNvdHhhbDd0Zkh0TklY?=
 =?utf-8?B?Vy9rWUlwZ3JDTDN1eHFQUFVRQWZ4WUFyRDFUamc0aS9nSVdjQmFKL0pQWUw4?=
 =?utf-8?B?dHpWUHplRHpQckZwdW8rK1dCT2FoTHRHeW1UY2p5VFdIWFcyM25XOU5ZMWlx?=
 =?utf-8?B?VlM5N1d6eEJIK3RrUko0QjdjWDVpZEs1dnlUdExKMDE5K1BTOEpGcVpTUWNp?=
 =?utf-8?B?Rm5jL2YyUU93RmtoSmJJUDRaNU9FTGpPMmkvRG42RjFHaDdJTGNmWjNLL2dr?=
 =?utf-8?B?cmtVTkJOMFdGM2dqVC9Mdk10NkZqOUhaTlhrNTV4eEp2U3pPUXVVVDRkbGdG?=
 =?utf-8?B?M04wZjhUTlRXT1Z0QkQwTlZ2cW1CR2JDZGVLa1o4ZjBSd0hkTkJTbkhZK0Fx?=
 =?utf-8?B?b3BzSUowQUZ2OHhiL2hCSUNZNSthNFRvM3plZFJyNlU0RFVGVGxSS2tkL0lQ?=
 =?utf-8?B?KzZVenFQZ01JVnJPTFpUQStMN095YnJwR29vc0ZKa2I5ZnRUdHlhWEZBV3Jo?=
 =?utf-8?B?SGg2a1krQ1g5cndqd0h3cDY5ZG1JUTBzQzVBajgvYWR0L083dk95OWZSekFQ?=
 =?utf-8?B?dnVqN0luZ0t6bVdlOFJUaklleVNSTFFsejg0VWxkUWo1ankzVWxCcnRPMXM3?=
 =?utf-8?B?T0N4ZnVUREpOZVRxUDl5aGp1eW9SOHRsYWo1Qm1SYnRiY2hWWkdPaHp3K21h?=
 =?utf-8?B?L1BQZkdkeDAyVjN3b3NtYnlCVWFWRFl4WGsyRlB3bmJEU0VZdDBpN2EvZjNT?=
 =?utf-8?B?Tkh0TW13NUFjVktKVDBuamRkMFJvaWZKVTA2eHJKdlV5Q2NQMXg4NTZMQmZj?=
 =?utf-8?B?M2MwSDVRc3N6S2VHeWlaZTJDQktJODRoQm9RYVRPcDBEV3cwMW5EQkFJalJJ?=
 =?utf-8?B?WmQvUVpMQkM4NG02MW0xMjJYZGMyVDZ3cmJMUkRLVXZpT0kvZDA4Qk16NkIr?=
 =?utf-8?B?L2JGSVVEaXdZQUx5R1pzUWVBbEFnbEJ0NGxyMzVRL0tGWnhsUWhyVWhpdWhy?=
 =?utf-8?B?VWtsRUJjRm12dDBGeXhMMUVuTEEyamNhOEpzODRKbHVOQlN6S1BXRk5jQ1Nq?=
 =?utf-8?B?aXFKcUQ4RTJFWEtYd2YwdWR3dWVMbXNlSXovSVJnS0lobTluN21nQ21JWXc5?=
 =?utf-8?B?SndYemwycmV6QVZwcnZiakZUcTlmV2JYL3BtSW5PTGNDMGJHVHJNcDVvaEdx?=
 =?utf-8?B?eGttcUhlRHJmcE84TFdrTnE5SFhCS0VRalhSNFZIZ0RhS2xEVTNjTDRIUmRq?=
 =?utf-8?B?Z01Fa3l5dXJpWWFMNUdtRGZoZk1TRGF6VENQRCtjd21XVkVxRnUvY1JUdUpr?=
 =?utf-8?B?bERHL1hXS1J2eStmSnFiS0ZjQWFjV2hET253WWswbXNGaVU2c1J6SnVTSUs0?=
 =?utf-8?B?dXpCRjRCOWhwMVY2ZGlaOTByWUttcDFFOEo4L3VFYXZJMlpCMU8wSTdPaVRr?=
 =?utf-8?B?ZC9RRVkrTE5KTGszRkZ3Y0s2TzdjK0VrWjJrWmt5b1BLNEJhOFAzaWNMZWto?=
 =?utf-8?B?MDFuczlPa0hZaUJUUnkvMGtPR2JpSUVobTZ5TFN1WEh3YlpaUWc1aU1qS1py?=
 =?utf-8?B?MXFjdjhheHNPTzlkUVdqbk9lc21CUDRaMTIraFB0dkhCeGt1NzdpTDFOWUpQ?=
 =?utf-8?B?QlVBTWpudUV1dG5USEh5U3ZEaGJGMWNFV0U2MFlleXQxQ2NjMUVtbDFUOE83?=
 =?utf-8?B?RmRGYjlYV0k2K0FyQlFkK25tWEtjM1J3Qk1VOHN3TnJDU2EzSDdacGNqQ2N6?=
 =?utf-8?B?ZjR2WVZKVnZJVTFPL1g1L2VWcVQ5TXhqOXE3VThVVytrVGZWSEZ1Q0JzQTh6?=
 =?utf-8?B?K2FSbVNtd3E0Q0FEUXlqcU1ySUc4bExqYnZpd3R5aU5DYmYrL3J6cnNzUkVj?=
 =?utf-8?B?RllXNTdVVWtWcytrNUhqZE9yU0s0T1VBdXdNZjlKOHIzbWh2TXB0SEN1YW1D?=
 =?utf-8?B?cGpPRm8rVE1ndks4VWg0Zko1b2J4amJkL2ZGd2s2Q0R3eVVEVG1odz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C53C60002B30B8459A7852A41CCDD9FC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eZvd5IITTgmvuIZ+H76GcUporDEYJ3hJ1iQVHug93G1VTqFxxvjyTvBYDAADcUElg9VmCCdRsafq/gJ/a81QOZTAiJV48SDSM+ulvNkkekr8u6rX8M/9DCdqH3MHgW4ErxIOSOni+fS+3INx444DYlK8P/hwaIp63WWvc3iYLfZFWT1ujnhMIVtBy4G2jKtmBX8VRA0+nDFK1skWPkMnHCBiVUP+bulzkqPnzkvNtLGYOgqtkG4HGBVX7e3DXHhU/PMOf469mYaNrHYvXoInbAe8Qq+hoUp3wR3a38FQkzS7QRme9KVCh9Z6ZsqkIuvv5F2z9t0cdBK5ek2h6YXxPw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6197.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a05ba7-60e1-45c7-1380-08ded7fc461b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 05:39:24.0738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MlA0fy4SB/x3qNBaVossEeM1Zim7mCvm3tsqkIQ5gPSoJfrByRmVF1Pzb3k+N9V/xOF69Fadx5Cohu35vGiVQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8669
X-MTK: N
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66291-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mediatek.com:dkim,mediatek.com:email,mediatek.com:mid,mediatek.com:from_mime,mediateko365.onmicrosoft.com:dkim,collabora.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:angelogioacchino.delregno@collabora.com,m:Kyrie.Wu@mediatek.com,m:laurent.pinchart+renesas@ideasonboard.com,m:nicolas.dufresne@collabora.com,m:jacopo.mondi@ideasonboard.com,m:Yunfei.Dong@mediatek.com,m:conor+dt@kernel.org,m:Irui.Wang@mediatek.com,m:rongqianfeng@vivo.com,m:tzungbi@kernel.org,m:tfiga@chromium.org,m:robh@kernel.org,m:wenst@chromium.org,m:benjamin.gaignard@collabora.com,m:matthias.bgg@gmail.com,m:haoxiang_li2024@163.com,m:ribalda@chromium.org,m:tiffany.lin@mediatek.com,m:linux-mediatek@lists.infradead.org,m:p.zabel@pengutronix.de,m:sebastian.fricke@collabora.com,m:fshao@chromium.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:mchehab@kernel.org,m:fanwu01@zju.edu.cn,m:linux-arm-kernel@lists.infradead.org,m:Andrew-CT.Chen@mediatek.com,m:krzk+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-kernel@vger.kernel.org,m:kees@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:matthiasbgg@
 gmail.com,m:krzk@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Kyrie.Wu@mediatek.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,mediatek.com,ideasonboard.com,kernel.org,vivo.com,chromium.org,gmail.com,163.com,lists.infradead.org,pengutronix.de,vger.kernel.org,zju.edu.cn,linux.intel.com];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Kyrie.Wu@mediatek.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 083296F399F

T24gV2VkLCAyMDI2LTA2LTAzIGF0IDE3OjE0ICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6DQo+
IE9uIFdlZCwgSnVuIDAzLCAyMDI2IGF0IDA0OjQwOjQxUE0gKzA4MDAsIEt5cmllIFd1IHdyb3Rl
Og0KPiA+IEZyb206IFl1bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4g
DQo+ID4gVGhlIE1UODE5NiBkZWNvZGVyIGRpZmZlcnMgZnJvbSBwcmV2aW91cyBnZW5lcmF0aW9u
cyBpbiBzZXZlcmFsDQo+ID4ga2V5IGFzcGVjdHMsIG1vc3Qgbm90YWJseSBpbiBpdHMgdXNlIG9m
IFZDUCBpbnN0ZWFkIG9mIFNDUC4NCj4gPiBBZGRpdGlvbmFsbHksIHRoZSBNVDgxOTYgZW5oYW5j
ZXMgY29kZWMgY2FwYWJpbGl0aWVzIGJ5IHN1cHBvcnRpbmcNCj4gPiBIRVZDIE1haW4xMCBwcm9m
aWxlIGRlY29kaW5nLiBUbyBhY2NvbW1vZGF0ZSB0aGVzZSBoYXJkd2FyZQ0KPiA+IGNoYW5nZXMs
DQo+ID4gdGhlIGJpbmRpbmcgY29uc3RyYWludHMgc3BlY2lmeSBhIHRvdGFsIG9mIDEyIGNsb2Nr
IGlucHV0cywNCj4gPiBjb25zaXN0aW5nIG9mIDkgZGVjb2RlciBjbG9ja3MgYW5kIDMgVkNQIGlu
dGVyZmFjZSBjbG9ja3MsDQo+ID4gYWxvbmcgd2l0aCAyIHBvd2VyIGRvbWFpbnMgY292ZXJpbmcg
Ym90aCB0aGUgZGVjb2RlciBhbmQgVkNQDQo+ID4gc3Vic3lzdGVtcy4NCj4gDQo+IEknbSBwcmV0
dHkgcHJldHR5IGNvbmZ1c2VkIGJ5IHRoaXMgc3RhdGVtZW50IGFib3V0IGNvbnN0cmFpbnRzLCBz
aW5jZQ0KPiB0aGVyZSdzIG5vbmUgYWRkZWQ/DQo+IFRoZSB2Y29kZWMtZGVjIG5vZGUgZG9lc24n
dCBldmVuIHNlZW0gdG8gcGVybWl0IGNsb2NrcyBhdCBhbGw/DQo+IA0KRGVhciBDb25vciwNCg0K
SSBhcG9sb2dpemUgZm9yIGFueSBjb25mdXNpb24gbXkgY29tbWl0IG1lc3NhZ2UgY2F1c2VkLiBX
aGF0IEkgd2FudGVkDQp0byBjb252ZXkgd2FzIHRoZSBoYXJkd2FyZSBkaWZmZXJlbmNlcyBiZXR3
ZWVuIHRoZSBNVDgxOTYgYW5kIHByZXZpb3VzDQpJQ3MuIElmIHlvdSBmZWVsIHRoYXQgdGhlIFZD
UCBhbmQgY2xvY2sgaW5mb3JtYXRpb24gYXJlIG5vdCBzdWl0YWJsZQ0KZm9yIHRoaXMgbG9jYXRp
b24sIEkgd291bGQgbGlrZSB0byByZXdyaXRlIHRoZSBjb21taXQgbWVzc2FnZSBhcw0KZm9sbG93
czoNCkNvbXBhcmVkIHRvIHByZXZpb3VzIElDcywgdGhlIE1UODE5NiBzdXBwb3J0cyBhIDEwLWJp
dCBkZWNvZGVyIGFuZCBoYXMNCmEgZGVjb2RpbmcgY2FwYWJpbGl0eSBvZiA0S0AxMjBmcHMsIHVz
aW5nIGEgZHVhbCBoYXJkd2FyZSBkZWNvZGluZw0KYXJjaGl0ZWN0dXJlIG9mIExBVCtDT1JFLg0K
DQpUaGFua3MuDQoNClJlZ2FyZHMsDQpLeXJpZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBZ
dW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPg0KPiA+IEFja2VkLWJ5OiBOaWNv
bGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5jb20+DQo+ID4gLS0tDQo+
ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtc3ViZGV2LWRlY29kZXIueWFt
bCAgICAgICAgICAgfCANCj4gPiAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy1zdWJkZXYtDQo+ID4gZGVjb2Rlci55YW1s
DQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWss
dmNvZGVjLXN1YmRldi0NCj4gPiBkZWNvZGVyLnlhbWwNCj4gPiBpbmRleCBiZjgwODJkODdhYzAu
Ljc0ZTFkODhkMzA1NiAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLQ0KPiA+IHN1YmRldi1kZWNvZGVyLnlhbWwN
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0
ZWssdmNvZGVjLQ0KPiA+IHN1YmRldi1kZWNvZGVyLnlhbWwNCj4gPiBAQCAtNzYsNiArNzYsNyBA
QCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAtIG1lZGlhdGVrLG10ODE4Ni12Y29kZWMtZGVjDQo+
ID4gICAgICAgIC0gbWVkaWF0ZWssbXQ4MTg4LXZjb2RlYy1kZWMNCj4gPiAgICAgICAgLSBtZWRp
YXRlayxtdDgxOTUtdmNvZGVjLWRlYw0KPiA+ICsgICAgICAtIG1lZGlhdGVrLG10ODE5Ni12Y29k
ZWMtZGVjDQo+ID4gIA0KPiA+ICAgIHJlZzoNCj4gPiAgICAgIG1pbkl0ZW1zOiAxDQo+ID4gLS0g
DQo+ID4gMi40NS4yDQo+ID4gDQo=

