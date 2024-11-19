Return-Path: <linux-media+bounces-21564-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F869D1FD0
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 06:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F4EA1F21CE8
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 05:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D251514E4;
	Tue, 19 Nov 2024 05:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WOfl/HI+";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="UcjB8eQC"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3AC142E7C;
	Tue, 19 Nov 2024 05:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731995828; cv=fail; b=kqVHs5UnsScyMSVC94iDU4Cjaf8XG+bkdKU6EieCNkcuwfq/F567zI3RQXI16nMZ8hVhjf6BKaLpZJxen9xr3R1k72DlPgr5C9I8lZChwoY1ETOpPu7eW+B0pbLM4MzufJw1r++oADTum/lmXOsWDlEwrmx3dihbDtoZRfhg15g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731995828; c=relaxed/simple;
	bh=gr480f56KwO7I+eL84IPtc3o/ZV2nTFTeeV5FlrY43o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UdouKBqM2j3nTmGm2WwpygQlDQVL6sgSn68heAbFkJbEsj8j57M4JagLZmwdErAtaSrQYGz3V2lDGMMiOxlVswk2pAVz8zdYOY5GQd5WwRQ5LTpdcnlYYCiTWfxs3SfY2nEBeLjWSoxplPGLbi+BsN5SsSO0vhOeiyrdx46y2yA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WOfl/HI+; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=UcjB8eQC; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 13143d32a63b11efbd192953cf12861f-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=gr480f56KwO7I+eL84IPtc3o/ZV2nTFTeeV5FlrY43o=;
	b=WOfl/HI+0PX1DRF4IPSl2cAPkLa/ED3QdZ1FNmzdm0w/6nWrSDhWESuibhAFwiSNtQnLOSDevbqD+OJ/dameZbvEDmpMEsk40OEWczPFAvYjr6usJyHSr5h817+NFnDmgZ6ZiEgKJzrFSXu5ZVhDeEWmq3wRh6Wu7NtxlTKuztE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:713ea9ac-4222-440b-99c0-3e1d3f995db9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:7177dd5c-f18b-4d56-b49c-93279ee09144,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 13143d32a63b11efbd192953cf12861f-20241119
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1086876045; Tue, 19 Nov 2024 13:56:52 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Nov 2024 13:56:51 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Nov 2024 13:56:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MeytocqToDvannHjDIEQkqG7crYE7SdnLIjWAr7DIIyxopuDMAO3xG+iFzpLT2MfQJ24aw/7v8JhIYJUqxbTA0W8g7u3AqoLeHL0ORj2za426Z01R+97DF0DiVNOtfwhDblhvj074P7hWQbYiQlo85OPe5WRK7WisFIOGfY5mJcGfWkJZF6v/ETbGN4xOynE/zBsM3O8LlWLXtVyLKM1RSrL1sqf2SOKSqxFS7tvYIg9g0Ebyg/03L/Mj6M4owO/x+RDqEEywpb61Fp6Bg7wwWzjbPMWpQCCNpdtz0Rxu4caPitdhplzyvpQftPc/F4CGWidfrtFnnldi+piP0BY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gr480f56KwO7I+eL84IPtc3o/ZV2nTFTeeV5FlrY43o=;
 b=HDH3ZDgHCvIQr/y3WZFK3dIi8Yxp/974A4xxMAvqnOHmnZ3nvuqqKaP7SP+P0GHp7PvnIrq70rmBw9onurEtmn5bIIXny3IIePOEy+KPidW+BYznF+SpJG6WHayC7IlsrcUqstqdp12yO8kV44ACVcUzGfN82crWkZvgx3xPk4aPNs59DY1dGkss/JfF3fvCw5bOyL8e5wBtNSUSyxIJbLW6LRKA1KdKaO66KaSoTlQ3w85JyU28bTf173ostlMVrInqsmRoMXhQDyQLWQTZ4rUlYzijRkwc3KTlRo/pa9YZxrx9YCZx4lNKhOOksphFv3iIxlLIzyx6uIBfjKBflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gr480f56KwO7I+eL84IPtc3o/ZV2nTFTeeV5FlrY43o=;
 b=UcjB8eQCDwpfzp+y1E2C4kKbVOyq7Pkjx0bAss0CS98oVF7LhPElMhq6k6ZHQNM3Oiag5sYN/1qx7qNotqqwCfEDAajQNtr05xb4n3GSTqFy50kqTYLdYVvpmuwxZM2Ezds/m0HR/JHeWJJ7MEc+tesqA3kqQn5slA/eqa4VhGU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8695.apcprd03.prod.outlook.com (2603:1096:990:98::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 05:56:48 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Tue, 19 Nov 2024
 05:56:48 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Topic: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarKIxpUAgDWUkoA=
Date: Tue, 19 Nov 2024 05:56:47 +0000
Message-ID: <1908dc86d948ba02f1133633e08652a12610edea.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
	 <c976a3b11f88dc5896862b6ad3e0be772a6b2f45.camel@mediatek.com>
In-Reply-To: <c976a3b11f88dc5896862b6ad3e0be772a6b2f45.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8695:EE_
x-ms-office365-filtering-correlation-id: 0cc008e2-b332-4391-1c22-08dd085ef49d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b25nQnFHYm5zbW14YnBPNHN5MkhudmNmcjZ6QWdwZzI0Z0dGN3p0WDZnMWRz?=
 =?utf-8?B?eXdRK1dRL0JodWlPQU1DcW9PdW1RbVg1RHdOZy9MRktOd1BaU2tueG9wUWYr?=
 =?utf-8?B?NGNNbHNnMjdGT3JTdVhFSzZHVGdHdWhFZmF6UWZVMU02VllTc3NjQTB6cnJG?=
 =?utf-8?B?ZFhsWXQvcHNXYXFZNHlnNFVzU01ERnFKQ1hPRHNCNi9uMmQ1a05abERHaTU0?=
 =?utf-8?B?UVVDSjkrQzUreDhXKzFJa0lCMDk5cGxUR2dkalBVM0JrYkdrRUdjTURmeTBx?=
 =?utf-8?B?bGZCVTN4TnlCc1NyQi94WjNPSUZhdHEvMFlFVS9mbkJ6Tmo1bGhTV2xLeTgv?=
 =?utf-8?B?cXJGSEVVUVJEUFpZSVhaSk83TytFRk5kQzFxenpEeHpVOWVTSWFIOGlNeXdS?=
 =?utf-8?B?YXlyTjgwSkdsNkxkNitESVk1ZkRZcFI4OE5xdkhnK1JEVVVmcUdtL0NKcklV?=
 =?utf-8?B?YWVNOFhCWWxCcnMya09WVUR2QjFJV0pwenFNdXV5U0xVbEk0ci8rTkJQRTQr?=
 =?utf-8?B?VmFUUmhYTTdYb1dwMnQrMFZldTFFRzZBaXZRQmJNY1E3SzVGMzB1QmZkYm5k?=
 =?utf-8?B?VjJyVmFLemp6Q08rVVdiTzBZbElncnFVQ1cwU290Zll6T3BwMWZqMVN4SkNQ?=
 =?utf-8?B?UUpydUlkaDI3ZWNHTU1jOXFkWmswczdoa3FkdXhNNEorZVpDZGxtdkkxVGNp?=
 =?utf-8?B?eVYvWFUwa2ppdHB1VFQyWkxITm5DOUwrTk13aUdxSkREVXlIc2hoeDVQOXhx?=
 =?utf-8?B?R0VqNi9Qa0FkdFZQa1pobDBPT0d1V2cvVjBOajBiYXljdFNtYlEvdldyd081?=
 =?utf-8?B?ME1KS01oSzB6WjAyK01PeldnSmZpWFVvVEpDSTV0VGp4citQSW9TSXZyM1dl?=
 =?utf-8?B?YlZBNk44QkFSazZHSGtIbkoxeHR2eGg2bGhlQ1hsdVZxMnpaNTNnREUvSm9m?=
 =?utf-8?B?VlRKUDlaa0VpckE2Kzg1T2RKNjl5U1ZSL0pqaDFkNFk3SVVLVVNEMXZpYkps?=
 =?utf-8?B?a01tVmRRN3pMaUVOc2lxaHNpekJKeG5jM0x5bCtNMFpiVUk1N0g3ZGxyQjVj?=
 =?utf-8?B?Qm0yYWNEQm9RNmtwaEZkNXU4bWpDVWd3WHdIUndSc09pMWVqUW4zTHlFWmtT?=
 =?utf-8?B?RGVLeFZuVGdlRVBtdk4zL3h6VkJ4RjhJY1Z6SHFEVHhVZlErc01GMTZaaFpH?=
 =?utf-8?B?TzBRdTZzMEp0cHdXamNvT1hBUGdUeVd3MnBoKzFtTThPK1lUc25waVZGOGlY?=
 =?utf-8?B?dHNMUTI2STQ5Sm84OHpLcFhTRXlBUkR1MXF6Mm5OK2pCN1NLWENDbTVzajNP?=
 =?utf-8?B?ZU1QeE1GemdBQ3RNVEZrZHYwU1R1bnA3OG9xc2hLWllLM01odDUzU1pIR0Q4?=
 =?utf-8?B?Rzl6MTlHQk8wR2xwNGN6c01IVitPdE9Sa2JmVVNob1dRbTJCRTBLN2YrVnVv?=
 =?utf-8?B?VzBMajBwZTQvWTFHUVBOOXI3WGN1S3JHcm1JNy9CSFY0NlI2ZU0rZXhVVWlI?=
 =?utf-8?B?RUpmWURGUTM2SXJCWmxsLzBpdVY1aytIVTZSZlZ4YkZLWmlqeFc5T0FMZGkw?=
 =?utf-8?B?dENNTklsaVpCY242djZTRHdQVjdIWEw5bVFQNHZRWmpXRmxxcEJHOHpQOHJq?=
 =?utf-8?B?Z3k5RFlzSVNWSkdCZmh6THJYOS8xYTZmUDlrWDdwamFyUkduRXVkUVJCem0z?=
 =?utf-8?B?VS83TjNvNDliR1lkOTU5V2pza2VHYURrZkhieW9XMUNIRGh5dFRDOENoK1Va?=
 =?utf-8?B?Tk1aenJTNHRhR0g2V3BldnVYTk80bG9MV3VQWWJ1QU5uS2RGK2JTSUwxRWR3?=
 =?utf-8?Q?SZ/x1RifwrU5wLGgzSZiC/5C542DYvxar0sls=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czNGemx3VjNndDJUVG52NkdRdWtBelc1azFZSDZ3Uzd1NDlVcUlGYlBoK0tH?=
 =?utf-8?B?bHhSSTEzMVlLcG40K2pGN1dOODBmZXZUQVNPeGlFNmFRbFVzYjZ3M0QzeHNa?=
 =?utf-8?B?eFlsWW1VOXB2cXp3UCtZM1E1RHdGSSs3YVJHMld6S2RlT2d6YmxDaU04NHdD?=
 =?utf-8?B?dFl2aGd5ZWVTR2ducjFqUGtPZ09YeDUyQmR5ajQwdWNqNnFpN0RVVmZ6M1pv?=
 =?utf-8?B?ejY4a1o1UWJHNzBVMk9uams0Q0hhNEdTNG1PNTRGRnRlWFhvaTFJK3Z0anRW?=
 =?utf-8?B?RUZSZThxSEdTa2FpVU14TmhzYlBhUk11VGtxc09SOVRRbXhoTUtOSGZCRkpK?=
 =?utf-8?B?a252bk0yWE84NUhIOE9uRHhEYWJqRlpkSG5ZQjlhc3F6SXh5RVNOVW90Sll4?=
 =?utf-8?B?ZXB3ZjhNb0dQQ0xDV1JXbUhYbjhLdU9XZGdWMUlMWEpITUtYZUhsNVQxK1hJ?=
 =?utf-8?B?a0l6Y09pc0hVQUtwb0VxeVFneUNSTENTZkhLb0FRRE5oQkpvR3RhNms1bVlS?=
 =?utf-8?B?VDNFdjhxbVoyLytqeDVvSnVLaW90K01WR2p1eVdNQVFGNWE4TlhnZ3QwRWgr?=
 =?utf-8?B?K1ZNeVl4cnFRbE94Mzd1c2xZOU5OVDZnRmdKQXUyeDlGM0hBTDBPUW9OZG8z?=
 =?utf-8?B?cHBuY0FjV3lhUU1UZXZBZmVQdklrZEhlQUxOU214S014SVc5eDJvaHF5OEsv?=
 =?utf-8?B?a3dNM3lsVG03MElaSWdDWTlZcGd2WWVOZkEycEMrSlUvb2tCN25sN1FzRDhM?=
 =?utf-8?B?T2VacTQ2SEhIWG4yUUg2VkcvcHZpMWhSVk8yR2ozSFRUZHZCM0liUWtJRThU?=
 =?utf-8?B?TDdQQjlGd1ByWTRFRlczL1VCaTFMOHk4YlJQa2ZGaExsZUhhWkFianhVYy9M?=
 =?utf-8?B?Mytxb1l6NUpXZEJyekpQTWgzeHFJaXNkcDA0blgxZm1xSTIxVUM5dFZGbGRN?=
 =?utf-8?B?Q2RvbHI3Q2JYeGxrRGJueGU0bGt1b3NxY0FKS1R0NUhMditsU05DMjVwNlI1?=
 =?utf-8?B?cTBOZFRzREphZGpSbmgxVzVnQzlaR3p5NjYrRWdYZFAxaER6VWZOQnBucnYw?=
 =?utf-8?B?cFAzMDF3dTJEbmV1SXpoWjMyVjY4VEJaT1RwZnNCaDdsK2gvTkxMa1pDNmhV?=
 =?utf-8?B?KzZzWFRUSWVtSHFZc1RKL09BYmtRT3IyOENlbDFzNnFzeTBTMTRKcjdzTWMw?=
 =?utf-8?B?cVU1WS93aGtTNTQxTk10S1VSbDZnei82SWRQaEFoaTFZbUhQL3Bza0prakdE?=
 =?utf-8?B?VHJicmhYTytqSHhKVUtMUHgyYWRrQ212NE5QNVBOU0RVaC9BTVRyNTB2V3kw?=
 =?utf-8?B?Z1F4eGhBa3JkSzdleEdjNnRlSW5PQmF1SXZaRHp1OWRqdngzSVpyR01PbHhR?=
 =?utf-8?B?aDcrdkk3aHlWMlI1N29qNzBZcnF5L1NaUHlsSEVXV2ZMa3RCNnJrMFpvUXFM?=
 =?utf-8?B?bmdvMXd0YTlxdEkzUjlQQzFKRm1NZWp1REJzM29QRUxXQ2htOEYwWVpjMk9S?=
 =?utf-8?B?MDZRY2l3MGFQWFBiUElFUDBDZEdnTm14cm9sQ2wxYlJBZDN4UTl4Rkhib1E3?=
 =?utf-8?B?UTZiYmJjeHMvUHN5ZjY1UllkdG1JM2JscFhNd0xFVjhsNk5WQ1p4V1E1endR?=
 =?utf-8?B?ekkyV3dGWmNVc1dEMU5XVmtUU1lOWTE2UjdQQXNSZ1JGM0ladGVNelVFY29M?=
 =?utf-8?B?TEMyZ2RReXZmR3hxWS9RaHhCUW1mby9OQjJaUHA3KzRpaE51WGIyNWRVOEJj?=
 =?utf-8?B?MjhxMHpCQWIwbkxZNTZuTm0yUkJ2UWh5VXZzbVZiZzZLUCttZ25IbjN0Uldj?=
 =?utf-8?B?MW5vcTI5WFdhaGU1VnJjVzd4aE5NRUJmY3dqWW1ESWhpdzVaL3YrQ3ZqTEFW?=
 =?utf-8?B?OXdZNWtEWTc4blRQSTMrU3BJNXB3Y1VML09jNFJlMW5keDd3RXc4QnovdEtm?=
 =?utf-8?B?amVMMWNwMEZ3UU1VUDJKNThISGsxQnZLK285aGVpNnVzRTUrb2UwMlNIU2tq?=
 =?utf-8?B?R1lHaEQvaC9LS3cza0FyRk9vdHAvRDFzdDJwbGVWejZrQ0FySkJmaGxpOXd2?=
 =?utf-8?B?QWE1dmpNOEsxbUg5Ui9hdndQUXdCbjNaV0JXVVB0Ym95MGd0TDlHK3dqMXln?=
 =?utf-8?Q?/ijbJdB3L2wcXa5xNu8zxSkfG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDB40D4BD0E7B844BEBA73113D9C571B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc008e2-b332-4391-1c22-08dd085ef49d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 05:56:47.9872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q5mdU0WODk0/22s0kW5nklBZGKRo2gftJBAr2n/LDUShUKBlT6myO4OXDzUzDTyVHbtF4MxxZ9DYVhoYEx7mvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8695

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0xNiBhdCAxMTo0MyArMDgwMCwgQ0sg
SHUgd3JvdGU6DQo+IEhpLCBTaHUtaHNpYW5nOg0KPiANCj4gT24gV2VkLCAyMDI0LTEwLTA5IGF0
IDE5OjE1ICswODAwLCBTaHUtaHNpYW5nIFlhbmcgd3JvdGU6DQo+ID4gSW50cm9kdWNlcyB0aGUg
dG9wIG1lZGlhIGRldmljZSBkcml2ZXIgZm9yIHRoZSBNZWRpYVRlayBJU1A3WCBDQU1TWVMuDQo+
ID4gVGhlIGRyaXZlciBtYWludGFpbnMgdGhlIGNhbWVyYSBzeXN0ZW0sIGluY2x1ZGluZyBzdWIt
ZGV2aWNlIG1hbmFnZW1lbnQsDQo+ID4gRE1BIG9wZXJhdGlvbnMsIGFuZCBpbnRlZ3JhdGlvbiB3
aXRoIHRoZSBWNEwyIGZyYW1ld29yay4gSXQgaGFuZGxlcw0KPiA+IHJlcXVlc3Qgc3RyZWFtIGRh
dGEsIGJ1ZmZlciBtYW5hZ2VtZW50LCBhbmQgTWVkaWFUZWstc3BlY2lmaWMgZmVhdHVyZXMsDQo+
ID4gYW5kIHBpcGVsaW5lIG1hbmFnZW1lbnQsIHN0cmVhbWluZyBjb250cm9sLCBlcnJvciBoYW5k
bGluZyBtZWNoYW5pc20uDQo+ID4gQWRkaXRpb25hbGx5LCBpdCBhZ2dyZWdhdGVzIHN1Yi1kcml2
ZXJzIGZvciB0aGUgY2FtZXJhIGludGVyZmFjZSwgcmF3DQo+ID4gYW5kIHl1diBwaXBlbGluZXMu
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5nIDxTaHUtaHNpYW5nLllh
bmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiANCj4gW3NuaXBdDQo+IA0KPiA+ICtzdGF0aWMg
aW50IG10a19jYW1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiArew0K
PiA+ICsJc3RydWN0IG10a19jYW1fZGV2aWNlICpjYW1fZGV2Ow0KPiA+ICsJc3RydWN0IGRldmlj
ZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPiArCXN0cnVjdCByZXNvdXJjZSAqcmVzOw0KPiA+ICsJ
aW50IHJldDsNCj4gPiArCXVuc2lnbmVkIGludCBpOw0KPiA+ICsNCj4gPiArCWRldl9kYmcoZGV2
LCAiY2Ftc3lzIHwgc3RhcnQgJXNcbiIsIF9fZnVuY19fKTsNCj4gPiArDQo+ID4gKwkvKiBpbml0
aWFsaXplIHN0cnVjdHVyZSAqLw0KPiA+ICsJY2FtX2RldiA9IGRldm1fa3phbGxvYyhkZXYsIHNp
emVvZigqY2FtX2RldiksIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCFjYW1fZGV2KQ0KPiA+ICsJ
CXJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArCWlmIChkbWFfc2V0X21hc2tfYW5kX2NvaGVy
ZW50KGRldiwgRE1BX0JJVF9NQVNLKDM0KSkpIHsNCj4gPiArCQlkZXZfZXJyKGRldiwgIiVzOiBO
byBzdWl0YWJsZSBETUEgYXZhaWxhYmxlXG4iLCBfX2Z1bmNfXyk7DQo+ID4gKwkJcmV0dXJuIC1F
SU87DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWYgKCFkZXYtPmRtYV9wYXJtcykgew0KPiA+ICsJ
CWRldi0+ZG1hX3Bhcm1zID0NCj4gPiArCQkJZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpkZXYt
PmRtYV9wYXJtcyksIEdGUF9LRVJORUwpOw0KPiA+ICsJCWlmICghZGV2LT5kbWFfcGFybXMpDQo+
ID4gKwkJCXJldHVybiAtRU5PTUVNOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWRtYV9zZXRfbWF4
X3NlZ19zaXplKGRldiwgVUlOVF9NQVgpOw0KPiA+ICsNCj4gPiArCXJlcyA9IHBsYXRmb3JtX2dl
dF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+ID4gKwlpZiAoIXJlcykgew0K
PiA+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGdldCBtZW1cbiIpOw0KPiA+ICsJCXJldHVy
biAtRU5PREVWOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWNhbV9kZXYtPmJhc2UgPSBkZXZtX2lv
cmVtYXBfcmVzb3VyY2UoZGV2LCByZXMpOw0KPiANCj4gSSBjYW4gbm90IGZpbmQgYW55IHdoZXJl
IHRvIHdyaXRlIHJlZ2lzdGVyIG9mIHRoaXMgZGV2aWNlLg0KPiBJZiBzbywgSSB0aGluayB3ZSBu
ZWVkIG5vdCB0byBwcm9iZSB0aGlzIGRyaXZlci4NCj4gVGhlIHJlc3Qgc29mdHdhcmUgY29udHJv
bCBjYW4gYmUgc2V0dXAgYnkgb3RoZXIgZHJpdmVyLg0KDQpJZ25vcmUgbXkgcHJldmlvdXMgY29t
bWVudC4gSSBmaW5kIHlvdSBuZWVkIHRvIHBvd2VyIG9uL29mZiB0aGlzIGRldmljZS4NClNvIHRo
aXMgcHJvYmUgaXMgbmVjZXNzYXJ5Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gUmVnYXJkcywN
Cj4gQ0sNCj4gDQo+ID4gKwlpZiAoSVNfRVJSKGNhbV9kZXYtPmJhc2UpKSB7DQo+ID4gKwkJZGV2
X2VycihkZXYsICJmYWlsZWQgdG8gbWFwIHJlZ2lzdGVyIGJhc2VcbiIpOw0KPiA+ICsJCXJldHVy
biBQVFJfRVJSKGNhbV9kZXYtPmJhc2UpOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWNhbV9kZXYt
PmRldiA9IGRldjsNCj4gPiArCWRldl9zZXRfZHJ2ZGF0YShkZXYsIGNhbV9kZXYpOw0KPiA+ICsN
Cj4gPiArCWNhbV9kZXYtPmNvbXBvc2VyX2NudCA9IDA7DQo+ID4gKwljYW1fZGV2LT5udW1fc2Vu
aW5mX2RldmljZXMgPSAwOw0KPiA+ICsNCj4gPiArCWNhbV9kZXYtPm1heF9zdHJlYW1fbnVtID0g
TVRLQ0FNX1NVQkRFVl9NQVg7DQo+ID4gKwljYW1fZGV2LT5jdHhzID0gZGV2bV9rY2FsbG9jKGRl
diwgY2FtX2Rldi0+bWF4X3N0cmVhbV9udW0sDQo+ID4gKwkJCQkgICAgIHNpemVvZigqY2FtX2Rl
di0+Y3R4cyksIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCFjYW1fZGV2LT5jdHhzKQ0KPiA+ICsJ
CXJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArCWNhbV9kZXYtPnN0cmVhbWluZ19jdHggPSAw
Ow0KPiA+ICsJZm9yIChpID0gMDsgaSA8IGNhbV9kZXYtPm1heF9zdHJlYW1fbnVtOyBpKyspDQo+
ID4gKwkJbXRrX2NhbV9jdHhfaW5pdChjYW1fZGV2LT5jdHhzICsgaSwgY2FtX2RldiwgaSk7DQo+
ID4gKw0KPiA+ICsJY2FtX2Rldi0+cnVubmluZ19qb2JfY291bnQgPSAwOw0KPiA+ICsJc3Bpbl9s
b2NrX2luaXQoJmNhbV9kZXYtPnBlbmRpbmdfam9iX2xvY2spOw0KPiA+ICsJc3Bpbl9sb2NrX2lu
aXQoJmNhbV9kZXYtPnJ1bm5pbmdfam9iX2xvY2spOw0KPiA+ICsJSU5JVF9MSVNUX0hFQUQoJmNh
bV9kZXYtPnBlbmRpbmdfam9iX2xpc3QpOw0KPiA+ICsJSU5JVF9MSVNUX0hFQUQoJmNhbV9kZXYt
PnJ1bm5pbmdfam9iX2xpc3QpOw0KPiA+ICsNCj4gPiArCWNhbV9kZXYtPmRtYV9wcm9jZXNzaW5n
X2NvdW50ID0gMDsNCj4gPiArCXNwaW5fbG9ja19pbml0KCZjYW1fZGV2LT5kbWFfcGVuZGluZ19s
b2NrKTsNCj4gPiArCXNwaW5fbG9ja19pbml0KCZjYW1fZGV2LT5kbWFfcHJvY2Vzc2luZ19sb2Nr
KTsNCj4gPiArCUlOSVRfTElTVF9IRUFEKCZjYW1fZGV2LT5kbWFfcGVuZGluZyk7DQo+ID4gKwlJ
TklUX0xJU1RfSEVBRCgmY2FtX2Rldi0+ZG1hX3Byb2Nlc3NpbmcpOw0KPiA+ICsNCj4gPiArCW11
dGV4X2luaXQoJmNhbV9kZXYtPnF1ZXVlX2xvY2spOw0KPiA+ICsNCj4gPiArCXBtX3J1bnRpbWVf
ZW5hYmxlKGRldik7DQo+ID4gKw0KPiA+ICsJcmV0ID0gbXRrX2NhbV9vZl9ycHJvYyhjYW1fZGV2
LCBwZGV2KTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJZ290byBmYWlsX2Rlc3Ryb3lfbXV0ZXg7
DQo+ID4gKw0KPiA+ICsJcmV0ID0gcmVnaXN0ZXJfc3ViX2RyaXZlcnMoZGV2KTsNCj4gPiArCWlm
IChyZXQpIHsNCj4gPiArCQlkZXZfZXJyKGRldiwgImZhaWwgdG8gcmVnaXN0ZXJfc3ViX2RyaXZl
cnNcbiIpOw0KPiA+ICsJCWdvdG8gZmFpbF9kZXN0cm95X211dGV4Ow0KPiA+ICsJfQ0KPiA+ICsN
Cj4gPiArCS8qIHJlZ2lzdGVyIG10a19jYW0gYXMgYWxsIGlzcCBzdWJkZXYgYXN5bmMgcGFyZW50
ICovDQo+ID4gKwljYW1fZGV2LT5ub3RpZmllci5vcHMgPSAmbXRrX2NhbV9hc3luY19uZl9vcHM7
DQo+ID4gKwl2NGwyX2FzeW5jX25mX2luaXQoJmNhbV9kZXYtPm5vdGlmaWVyLCAmY2FtX2Rldi0+
djRsMl9kZXYpOw0KPiA+ICsJcmV0ID0gbXRrX2NhbV9hc3luY19zdWJkZXZfYWRkKGRldik7IC8q
IHdhaXQgYWxsIGlzcCBzdWIgZHJpdmVycyAqLw0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWRl
dl9lcnIoZGV2LCAiJXMgZmFpbGVkIG10a19jYW1fYXN5bmNfc3ViZGV2X2FkZFxuIiwgX19mdW5j
X18pOw0KPiA+ICsJCWdvdG8gZmFpbF91bnJlZ2lzdGVyX3N1Yl9kcml2ZXJzOw0KPiA+ICsJfQ0K
PiA+ICsNCj4gPiArCXJldCA9IHY0bDJfYXN5bmNfbmZfcmVnaXN0ZXIoJmNhbV9kZXYtPm5vdGlm
aWVyKTsNCj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlkZXZfZXJyKGRldiwgIiVzIGFzeW5jX25m
X3JlZ2lzdGVyIHJldDolZFxuIiwgX19mdW5jX18sIHJldCk7DQo+ID4gKwkJdjRsMl9hc3luY19u
Zl9jbGVhbnVwKCZjYW1fZGV2LT5ub3RpZmllcik7DQo+ID4gKwkJZ290byBmYWlsX3VucmVnaXN0
ZXJfc3ViX2RyaXZlcnM7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0ID0gbXRrX2NhbV9kZWJ1
Z19mc19pbml0KGNhbV9kZXYpOw0KPiA+ICsJaWYgKHJldCA8IDApDQo+ID4gKwkJZ290byBmYWls
X3VucmVnaXN0ZXJfYXN5bmNfbmY7DQo+ID4gKw0KPiA+ICsJZGV2X2luZm8oZGV2LCAiY2Ftc3lz
IHwgWyVzXSBzdWNjZXNzXG4iLCBfX2Z1bmNfXyk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+
ID4gKw0KPiA+ICtmYWlsX3VucmVnaXN0ZXJfYXN5bmNfbmY6DQo+ID4gKwl2NGwyX2FzeW5jX25m
X3VucmVnaXN0ZXIoJmNhbV9kZXYtPm5vdGlmaWVyKTsNCj4gPiArDQo+ID4gK2ZhaWxfdW5yZWdp
c3Rlcl9zdWJfZHJpdmVyczoNCj4gPiArCXVucmVnaXN0ZXJfc3ViX2RyaXZlcnMoZGV2KTsNCj4g
PiArDQo+ID4gK2ZhaWxfZGVzdHJveV9tdXRleDoNCj4gPiArCW11dGV4X2Rlc3Ryb3koJmNhbV9k
ZXYtPnF1ZXVlX2xvY2spOw0KPiA+ICsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gPiAr
DQo=

