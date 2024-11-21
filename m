Return-Path: <linux-media+bounces-21770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 818EC9D500E
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 16:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17B871F23097
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 15:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EC614F12C;
	Thu, 21 Nov 2024 15:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UREQy4Pe";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="fMD5+rGd"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BE917BD3;
	Thu, 21 Nov 2024 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732204087; cv=fail; b=RUmwzrlLPHrc6L0MyEBGBy6oGrLjuKYqBf4XH27eYQPcPSoRnwm6491z1l70w7TMzSBj20ii//1NnbYk7zALCvwhxjJ1rHjui/bmDBQICrwYMEU/ern2/BUvVbGQ+9KdAmUuhVW67lvuu/IU+Sg5PhuGTWJvk87WUZZbsd7iRXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732204087; c=relaxed/simple;
	bh=BdRafj3DnVoLQFw4OBgCZGDd5X/ESyy5bhTR1qL/ZUE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NcBPob8bMqZTWNVGkHWQjAGcHFP5rC34Msfn2LABdjeLd5rAx02QDlDBKtx1awmYO5E3YZgqME66W3htH0OY7M7R9x/sV+/rKjM6bkFuz3MhUkeYeMOZBa4+cFEFDOC6Tb7EatukONzxLBXpLkCJplxhMUDpX4baTcP64dpxVBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=UREQy4Pe; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=fMD5+rGd; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f982cbf4a81f11efbd192953cf12861f-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=BdRafj3DnVoLQFw4OBgCZGDd5X/ESyy5bhTR1qL/ZUE=;
	b=UREQy4Pe562u07dx/XQc/4dRLMRmde7kNdOf9fIAeMEH5j8RNZexfNw3joCvjC4zYxyVD9MtgURE5ntr+irXXMFczMaqG1fWgG+WdGkwhrdLZPlICyjNCsrNBNxHjxV171yP/NJug8FAodZz0fNo3gAp/EJ+cZD+WMrzaLjFMVg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:ea264686-df93-4e83-a9e9-1f95cd8ebc5d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:e367defe-58af-4a77-b036-41f515d81476,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: f982cbf4a81f11efbd192953cf12861f-20241121
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1159703957; Thu, 21 Nov 2024 23:47:55 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 23:47:54 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 23:47:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3NlK9dEwp/vwT7uwzIHSEIA4FGsRgmcAa+JmYZ/YmhR5kBM1l0be6kNFGaSzr7JFt0n2ZZjcL2eXRe+8y+FtCUe/IxhdqO2Ict4XM7tImQBKtbksjrO7U1F/cb3/3D8u3c/Whmm0W3eMF5fEAOoTGmDs9bh9T2OaWiM1hzOaQk1rvynpG3cSF54TUKIK3CjYgwYPWR5WTDiuNXlYWuRDt9KfSPlJBvIKixSSY+YnJmukWNzoUSR66BrByAsOWtulIEuViB1N9ujItkxKbFNSzkJw3ckl15muozMO7Fjsl1OFk9TsrpRXUrWy1YbQqKlWSp17bQKcV/B9UTJ+2IqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdRafj3DnVoLQFw4OBgCZGDd5X/ESyy5bhTR1qL/ZUE=;
 b=o/LT/5Bf5OMPIUbFLKFOt6jCILLMUZengx5p3x2sZrpwUP5SR/pkVzeP+OWe/gpbAYDK+/8NIJ5jM28Am0bvFxV3Ql35pHvlpDlbPIpl+Isa2e5f6utUCKFNWp2qk5iAUxMROm8//hu+60Vli0itDLBZp8m9oCUDsmZcCBquTox1RFoaLTjMDBGDwLuyVUu4bHePYncxw8VF5E7m1oVFvqI3y7ryx4CaU9JzO95A+aHcbRRR92n+iEAq7D8Ld+u5EDArYaW4wcyQQ/pIa9AKrTvsUzMv7vH7JTp/BScRyrqd7mu8ZQ+Z4dkIYggT0d1+P7lJUhGeMw3c4fCtBGPz+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdRafj3DnVoLQFw4OBgCZGDd5X/ESyy5bhTR1qL/ZUE=;
 b=fMD5+rGdQF7DjoOTdiZnfa+bqFVyCscaYAALTsiGOPblp7LwMBsqdT3oDQw+PXxDcnNFmxQu1xmATSbc0RUlhK4f6WB8qA6pZxxDcyBQ9xi+bn9pcuZuM88Sju1h/RbPRO22sHXnrz89qfhuk15AGISXdYpsdWO94aZy8M77RZk=
Received: from KL1PR03MB7669.apcprd03.prod.outlook.com (2603:1096:820:e2::6)
 by TY0PR03MB6452.apcprd03.prod.outlook.com (2603:1096:400:1bf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Thu, 21 Nov
 2024 15:47:51 +0000
Received: from KL1PR03MB7669.apcprd03.prod.outlook.com
 ([fe80::972a:8016:34a9:e923]) by KL1PR03MB7669.apcprd03.prod.outlook.com
 ([fe80::972a:8016:34a9:e923%7]) with mapi id 15.20.8158.024; Thu, 21 Nov 2024
 15:47:51 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"robh@kernel.org" <robh@kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/8] dt-bindings: mailbox: mediatek: Add GCE header file
 for MT8196
Thread-Topic: [PATCH 1/8] dt-bindings: mailbox: mediatek: Add GCE header file
 for MT8196
Thread-Index: AQHbO82lXfQ9WGC6IkSEu7UkQxO3QLLBaw8AgAAj7YCAABAGAIAAQtGA
Date: Thu, 21 Nov 2024 15:47:50 +0000
Message-ID: <2e4f939719a786b6ea7cbb58b55240105c85fad2.camel@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
	 <20241121042602.32730-2-jason-jh.lin@mediatek.com>
	 <57kqls2wa67nh4a5yyr4amthmro3bjvrhnrdbdolrhr2lnmf6u@2h3cbl4jip4y>
	 <40971559285bb60cbab476135ba81d364505113c.camel@mediatek.com>
	 <c3f52576-918d-4e0f-8247-46cb468e5c77@kernel.org>
In-Reply-To: <c3f52576-918d-4e0f-8247-46cb468e5c77@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB7669:EE_|TY0PR03MB6452:EE_
x-ms-office365-filtering-correlation-id: 96ac4818-a0b6-41f4-6c49-08dd0a43dafe
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SXI3eWxma2V3VWxSR0s5dkdUam02RXl4UGRvblAzMlowS1o5VVdZMGFWUDBO?=
 =?utf-8?B?bHdXYzZaM01rNGliU0J6UkZDd1hyczVqVGVHcTA4T1c5SVZYUW9aeHBPT0J2?=
 =?utf-8?B?S3VrRjBTc1ZJMUYwd3E5Sm1JeTcwL055VGIvOGhic3FxYm84L21QcjBwa2hj?=
 =?utf-8?B?bk5iTWNPN3VWbnJTOFFyYUsyaGxKMkZoRjVTazdGS0RTQ2lSZTBhcWZ0Ympx?=
 =?utf-8?B?WkdyMCt4MWhZWXI5cG9sSklJZzBtNTk3MlZzdXMzR2NBM3ZNV1pKUnhIendt?=
 =?utf-8?B?VFYvYS9qSWsyZlFSWVE2THBCbHJldElhalJnRm5JdmpTZFl6UFZ6cHVYYVhM?=
 =?utf-8?B?ekw3N2o5SmJiQUxVaFp1aWdFY2lEMld2ZytFRWdINXJUUE1QQzJIMDJnK25F?=
 =?utf-8?B?NkpCWjI5VU1YVDdWWmhmZDRwajBQMDdjcjZOaE42ZkpiRHpMSmd1QnN6RnhX?=
 =?utf-8?B?azlXcjVmNzBFamp6YUsrK1pkY3NoYXdnRDJFM0lHaGxybTZyak1GR2RHZG9n?=
 =?utf-8?B?VEZIRHhQRnJFOGJzNUtGSWx4REt0bWZlVGg0UTVZVjZCcWVHTEMvanU0QTR1?=
 =?utf-8?B?TXp5MEVKdmk5LzhwdjcraFU3OFlWeDg1eE1MOElMT3dWbHVhR1BvQ1dseFZv?=
 =?utf-8?B?Q0plbzI5Y0pmVjNLODU2WE9rUWxlSHlBcDY2VDcwZUI4TVJGRi9aajZjWC9h?=
 =?utf-8?B?SnFtV0RUUEM2UFdjTmZ3ZUtjVlloUkg2NmFPaytFa09YaTBCYm9ubmQzWURJ?=
 =?utf-8?B?aGxaYy90N0hzdjQ3M3BQQW1FSzFtUDVnRUVuanp5NDVTUUp5TVIwdGd0VkNu?=
 =?utf-8?B?V0NwRHpNKzNIQ2J4eDJ1TloyUkhjdmVXTlBCbUdUN2RWNXFFM0RsNENJdS9t?=
 =?utf-8?B?ZUIrYWJ4a3RJQnhRSHdTTG15SUFzL3RIZnRuUkF0LzhVemh2RzFEWGM0ZC9R?=
 =?utf-8?B?RXFyQTVOL3cyZUxJczlkU3RGNVFlQnQ0Mzc2T0F1a1NhTXN4MHlSWmtKeEFM?=
 =?utf-8?B?NFZDaSthT2swOFEzMTZmS0NnaS9MZ2kwRitWNmQ4VklVdXV3S1J4eEJrRXJK?=
 =?utf-8?B?Z01PdWp3c2l1T091NkpwWXhKVzlwSWhFeFhXOFlaQ2VnejgrNWppUm1kRDNX?=
 =?utf-8?B?TzVibEhQa0FmVVRsY0RKSTN4QkFhZ2wrMjlzZGdsUXJTN2F3K2ZIemJjUHc3?=
 =?utf-8?B?bDBOS0NsYWFYN1k3VFJtcGVVSGtmcWtmVFlHa1ViTDI5RnA0SjZ2ZnFGUERO?=
 =?utf-8?B?Mm9PRWFiMzhHWUFscWFSeGg4eHVIKzlGSkVTT1VZNEhqbzFCeUdSUzdtNWFW?=
 =?utf-8?B?VHp4ZkNxbVEzcVE2R3lRbTViTTJ3clF0dmpBYU5DRXgyUlY2bUNZdHNZVVpK?=
 =?utf-8?B?d040M0RiaW9sYzhtbytiMncwRUhSQXliazk5aFFHV3c4M3pGbFlpQ1p4dGFv?=
 =?utf-8?B?QXM1NmFuSE95NWZtcUdzNGZ5dk1DTU1FK1VORUFxbklwOUZVbGp3TEhiWEF1?=
 =?utf-8?B?QnBGZzhpdnZqV2Vaek5nbkY3SkxlVTdIVUM0d0lqNUl5UVZ2TWZvNnBSdmdL?=
 =?utf-8?B?aGFQNDM3eWZZZmNodC9jL0VDQkpxeHRDSEZoZDZkUVM4NEswZVhYVzhCNnVo?=
 =?utf-8?B?SXdBSmlyQVFIQXpEdDV1a0lnK0lKZDVmWlIvNFFoU3FYL2UveGtxcVhIY3Zr?=
 =?utf-8?B?N1Evd09CVjFmMWNtU2l4OVU1UmIxL0RhVTE4bldOd3d2OFZZdDNEdXlaWHk1?=
 =?utf-8?B?QWFqUExDSUN1ZGVXL2RJVWx6Ty9pVnJxZXIrcDJ6VjMzL2dwKzBYSTZKQXlx?=
 =?utf-8?Q?KHsbMcU/cnJj1WmT+jpdp+kwRHkUFKU3NIofs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7669.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2I4Z2d5c2IrRHQrNUo0RlJ0cVBQR0xBMmJsSjg2dGo2Vm5XOTN5T0lBV0ZR?=
 =?utf-8?B?Z0xTWHhJVlNDZlRQRThrZjlGWUdWekJoTkdFN1lsbkM1NTB3ZkFMTGYyNlVI?=
 =?utf-8?B?K3U1N3dVOUN3NVdySTJMaVc3cmVqVXhCcERuU0k2TERsLzB0Qjh6OXdzdThQ?=
 =?utf-8?B?Mm5SVEtIVFpBUE8xc0M2WkxDUmhUTk1zUGd0YmplUm1VV1Bjd0p1SzVCM3FI?=
 =?utf-8?B?SGdSaXlQMzg2OEltUlJ6RW1GZ0xNNlA2Z3B6UEdKc3Q3YmF1MnBpa1NDbGM2?=
 =?utf-8?B?TnRiMk1DRGl0bDhqY2hTbUFqTnYzdUYyR3Y4NXpUTDZsQkxUSmdWaHVnc2Ju?=
 =?utf-8?B?bFBUTUl0Mmg1Z0J6ak9jVjVNNXRycHl4aXl5V0g4aGlhREpGWnB3Rm1McDdi?=
 =?utf-8?B?WkJiTTYvWTF5WVBRVFFqRG9vcHlsZ3NhNXUzM1FrR1EzdmZKZ0lDakdveCt0?=
 =?utf-8?B?SnFLUkRScVVXSUUyY0FOQW5NTnlXZkxKbmNoVFpkK0Vvd2hBeFgrejdxL3Jj?=
 =?utf-8?B?OStCSkdnenJuVWNJUnBIcFlQaXNxYnlYVFd0enUwb29CMHo1MWI0c1VwYW1i?=
 =?utf-8?B?S3ZNKzBkYjJsSmZ0eU5YL0ZGa0JrQWprcjM0dDRFVmhkdkRlKzFSRXR0VzVS?=
 =?utf-8?B?cXVzOFlJSlFRY1A2MXo3RGVGYy9uZTVXQVI4VVJ0SkY2UlhaQ3lHZnVWSHlO?=
 =?utf-8?B?RzhDR3VlOUxGOHQ5ejhyZlhVZk1BWjBMU1FEczFSd1lCNzhYZ2puSkhvSUhG?=
 =?utf-8?B?M3pMbkdhM3dCVm9zUFo2OS9SdnFLKzlwMUxJZFl3T25XZWVrbFpPZ3l2dnpE?=
 =?utf-8?B?dWY0c2JSTGl2dE1KSkFXc0ppcGNQdjhkU1hESmFoakNHMWc3TWZlMGhhekwz?=
 =?utf-8?B?Q1J0QTh4Y0d5YkFBR0JlSlpOeFJ4K3Jrb0YrcTNKMWtyd3g5aWdQWjFaUFNq?=
 =?utf-8?B?VTBxU0pXamVGZnlrSFFGaVVjaTlIcnAxc3VmQlcyeE1rZGJDTUxtZy8rMmdy?=
 =?utf-8?B?N2lpY2c1T1MvR0pqMW1KYkRIOFVtNncyVjNRTjI4ZW5vTG16SHQ5bGRlaXVI?=
 =?utf-8?B?TkRzRzdWeUtpSk1QVW5UVmppeHEyS21uOUh2TGNkM21iREtyaHp5TkwxODFC?=
 =?utf-8?B?aU9yendHOE0zYzJUZDdTaU96ejQwRGpCZFBzY2hwOElXNHVFSWZZbGJvMGQ2?=
 =?utf-8?B?eW9jbE9hQ3FoTU1OU1gvZmU0ZE9rdGt1dnp4REY2MGZhK09jcG5ySndCcnlH?=
 =?utf-8?B?dWxEYmU1QnArNUxOVWZJZnRjTldxd2tVdkVHSU5QTlYwY04vNDIySUpERXpU?=
 =?utf-8?B?NldhR0NINnQzbnVvRjhtcjJ1Y0FNa21vZUhibUV1bjhMNTR6Y2xacTc0ZjNF?=
 =?utf-8?B?VG55S1NRM2lRTmhkSjRwTTBxdHF4dXk2OEVFWndKZXhDbWI2bTNxTVJiVXg2?=
 =?utf-8?B?NU1iOWxhNEI0djZwYndocmtEYUFEbVk0UGoxNGtNZWtDZVhZdzZrOUdDNk9h?=
 =?utf-8?B?OGtFV3J6RGM3bkxBYVNzbjgwTVBWM2xsbFBHVmtHc3JxK0xKamIzV1lOWGd3?=
 =?utf-8?B?SCtyU2dUWWkzOWJnSFNFNXkwV2M3UzhiUFkrUzF3WmhNczJqZWhNdjRpc2JP?=
 =?utf-8?B?REtldWVsVjVNNFdsWHpUTjRUQWRUZ3FDR2NjbHZqaFJnVUZQbkJReGQyRHpQ?=
 =?utf-8?B?V0tqVkpsRk50Sk41N3ByVHBCSHZoaDhCc1ZvZ0J3TVZkdUx0a0ZJQ3ZwR2cv?=
 =?utf-8?B?cmlYUUxRODhGbGxyUTlkR0dIdjlGRGFvM3dvSUh1OWZydzZMczZuMDlia0hw?=
 =?utf-8?B?UldKN0Fwcmo4Zy9sSWJXR0M5UG5VeU1BTWtoSTZIWXhCMUJIa3Rzd1F4R1lJ?=
 =?utf-8?B?REc4ZGhxdHpmQk5PMkx4UjZFR091WWtkQkk4SFh1ZFh4eks0WHdvRUttQlNn?=
 =?utf-8?B?K0hsNHNWbG84RXZsRytZeUlhVTJpQVFOTERidGdPMXlVNGFlK29FNzgxbFVC?=
 =?utf-8?B?aEdkVDNUcm81MmdzTEhJN082ZVlzK2pEcjhwLytWLytselUzaTh2OVJabmlm?=
 =?utf-8?B?U1JzUVRWRGE3LzFWdG5iOWJEa1NwK3NoSE8wM3ZWZXQ2aTFkZUlYL3NyNXQ3?=
 =?utf-8?B?Z3Z0VjEzWFlVTGhNbm9sVE4zRGN3c3ZseVJYQVFFTmlwODBoRVgyVGVHMDFx?=
 =?utf-8?B?NGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0ECA8B51CBF0B345B5BB342161763414@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7669.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ac4818-a0b6-41f4-6c49-08dd0a43dafe
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 15:47:50.9537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Azv6hBAtY8jpK3XXoOBMn0JEfX37tYDHYoCSSo2StkfA2uagFiql7u/zHFt6SbK3DXWoZ2+Z7o8wq8OORXgpiy26k4uqva13N1ukrKkWojM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6452

T24gVGh1LCAyMDI0LTExLTIxIGF0IDEyOjQ4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDIxLzExLzIwMjQgMTE6NTEsIEphc29uLUpIIExpbiAo
5p6X552/56WlKSB3cm90ZToNCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24tSkguTGluIDxq
YXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIC4uLi9kdC1i
aW5kaW5ncy9tYWlsYm94L21lZGlhdGVrLG10ODE5Ni1nY2UuaCB8IDE0NDkNCj4gPiA+ID4gKysr
KysrKysrKysrKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNDQ5IGluc2VydGlvbnMo
KykNCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDc1NSBpbmNsdWRlL2R0LQ0KPiA+ID4gPiBiaW5k
aW5ncy9tYWlsYm94L21lZGlhdGVrLG10ODE5Ni0NCj4gPiA+ID4gZ2NlLmgNCj4gPiA+IA0KPiA+
ID4gUGxlYXNlIHJ1biBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgYW5kIGZpeCByZXBvcnRlZCB3YXJu
aW5ncy4gVGhlbg0KPiA+ID4gcGxlYXNlDQo+ID4gPiBydW4gJ3NjcmlwdHMvY2hlY2twYXRjaC5w
bCAtLXN0cmljdCcgYW5kIChwcm9iYWJseSkgZml4IG1vcmUNCj4gPiA+IHdhcm5pbmdzLg0KPiA+
ID4gU29tZSB3YXJuaW5ncyBjYW4gYmUgaWdub3JlZCwgZXNwZWNpYWxseSBmcm9tIC0tc3RyaWN0
IHJ1biwgYnV0DQo+ID4gPiB0aGUNCj4gPiA+IGNvZGUNCj4gPiA+IGhlcmUgbG9va3MgbGlrZSBp
dCBuZWVkcyBhIGZpeC4gRmVlbCBmcmVlIHRvIGdldCBpbiB0b3VjaCBpZiB0aGUNCj4gPiA+IHdh
cm5pbmcNCj4gPiA+IGlzIG5vdCBjbGVhci4NCj4gPiA+IA0KPiA+ID4gVGhpcyBnb2VzIHdpdGgg
dGhlIGJpbmRpbmcuDQo+ID4gPiANCj4gPiANCj4gPiBJIHRob3VnaHQgSSBoYXZlIGRvbmUgdGhh
dCwgYnV0IEkgZm91bmQgYSB3aGl0ZXNwYWNlIHdhcm5pbmcgYXQNCj4gPiAjMTMyOA0KPiA+IG5v
dy4gSSdsbCBmaXggdGhhdCBhdCB0aGUgbmV4dCB2ZXJzaW9uLg0KPiA+IFRoYW5rcyBmb3IgdGhl
IHJlbWluZGVyLg0KPiANCj4gVGhlcmUgYXJlIG11bHRpcGxlIGVycm9ycywgaW5jbHVkaW5nIGV4
ZWN1dGFibGUgcGVybWlzc2lvbi4gSSBkb24ndA0KPiBiZWxpZXZlIHlvdSBydW4gY2hlY2twYXRj
aC4NCg0KT2gsIG15IGJhZC4gWW91J3JlIHJpZ2h0Lg0KSSBoYXZlIGNoZWNrZWQgdGhlIGhpc3Rv
cnkgYW5kIGZvdW5kIEkgbWlzc2VkIHRoaXMgcGF0Y2guLi4NCg0Kfi9saW51eCQgLi9zY3JpcHRz
L2NoZWNrcGF0Y2gucGwgLS1zdHJpY3QgLS1pZ25vcmU9R0VSUklUX0NIQU5HRV9JRCAtLQ0Kc2hv
dy10eXBlcyAwMDAqDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCjAwMDEtbWFpbGJveC1tdGstY21kcS1BZGQtZHJpdmVyLWRh
dGEtdG8tc3VwcG9ydC1mb3ItTVQ4MS5wYXRjaA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQp0b3RhbDogMCBlcnJvcnMsIDAg
d2FybmluZ3MsIDAgY2hlY2tzLCAyMjMgbGluZXMgY2hlY2tlZA0KDQowMDAxLW1haWxib3gtbXRr
LWNtZHEtQWRkLWRyaXZlci1kYXRhLXRvLXN1cHBvcnQtZm9yLU1UODEucGF0Y2ggaGFzIG5vDQpv
YnZpb3VzIHN0eWxlIHByb2JsZW1zIGFuZCBpcyByZWFkeSBmb3Igc3VibWlzc2lvbi4NCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KMDAwMi1zb2MtbWVkaWF0ZWstbXRrLWNtZHEtQWRkLXVuc3VwcG9ydGVkLXN1YnN5cy1JRC1w
cm9nLnBhdGNoDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCnRvdGFsOiAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBjaGVja3Ms
IDI2MSBsaW5lcyBjaGVja2VkDQoNCjAwMDItc29jLW1lZGlhdGVrLW10ay1jbWRxLUFkZC11bnN1
cHBvcnRlZC1zdWJzeXMtSUQtcHJvZy5wYXRjaCBoYXMgbm8NCm9idmlvdXMgc3R5bGUgcHJvYmxl
bXMgYW5kIGlzIHJlYWR5IGZvciBzdWJtaXNzaW9uLg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQowMDAzLXNvYy1tZWRpYXRl
ay1tdGstY21kcS1BZGQtbW1pbmZyYV9vZmZzZXQtY29tcGF0aWJpbGkucGF0Y2gNCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
dG90YWw6IDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIGNoZWNrcywgOTcgbGluZXMgY2hlY2tlZA0K
DQowMDAzLXNvYy1tZWRpYXRlay1tdGstY21kcS1BZGQtbW1pbmZyYV9vZmZzZXQtY29tcGF0aWJp
bGkucGF0Y2ggaGFzIG5vDQpvYnZpb3VzIHN0eWxlIHByb2JsZW1zIGFuZCBpcyByZWFkeSBmb3Ig
c3VibWlzc2lvbi4NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCjAwMDQtc29jLW1lZGlhdGVrLUFkZC1wYV9iYXNlLWR1ZS10by1DTURR
LUFQSS1jaGFuZ2UucGF0Y2gNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCnRvdGFsOiAwIGVycm9ycywgMCB3YXJuaW5ncywgMCBjaGVj
a3MsIDE1IGxpbmVzIGNoZWNrZWQNCg0KMDAwNC1zb2MtbWVkaWF0ZWstQWRkLXBhX2Jhc2UtZHVl
LXRvLUNNRFEtQVBJLWNoYW5nZS5wYXRjaCBoYXMgbm8NCm9idmlvdXMgc3R5bGUgcHJvYmxlbXMg
YW5kIGlzIHJlYWR5IGZvciBzdWJtaXNzaW9uLg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KMDAwNS1kcm0tbWVkaWF0ZWstQWRkLXBh
X2Jhc2UtZHVlLXRvLUNNRFEtQVBJLWNoYW5nZS5wYXRjaA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KdG90YWw6IDAgZXJyb3JzLCAw
IHdhcm5pbmdzLCAwIGNoZWNrcywgMjQgbGluZXMgY2hlY2tlZA0KDQowMDA1LWRybS1tZWRpYXRl
ay1BZGQtcGFfYmFzZS1kdWUtdG8tQ01EUS1BUEktY2hhbmdlLnBhdGNoIGhhcyBubw0Kb2J2aW91
cyBzdHlsZSBwcm9ibGVtcyBhbmQgaXMgcmVhZHkgZm9yIHN1Ym1pc3Npb24uDQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCjAw
MDYtbWVkaWEtbWVkaWF0ZWstbWRwMy1BZGQtcGFfYmFzZS1kdWUtdG8tQ01EUS1BUEktY2hhbi5w
YXRjaA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQp0b3RhbDogMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgY2hlY2tzLCAzMiBs
aW5lcyBjaGVja2VkDQoNCjAwMDYtbWVkaWEtbWVkaWF0ZWstbWRwMy1BZGQtcGFfYmFzZS1kdWUt
dG8tQ01EUS1BUEktY2hhbi5wYXRjaCBoYXMgbm8NCm9idmlvdXMgc3R5bGUgcHJvYmxlbXMgYW5k
IGlzIHJlYWR5IGZvciBzdWJtaXNzaW9uLg0KDQpEdWUgdG8gc29tZSBJVCBwb2xpY3ksIEkgcnVu
IGNoZWNrcGF0Y2ggYW5kIHNlbnQgdGhlc2UgcGF0Y2hlcyBpbiAyDQpkaWZmZXJlbnQgc2VydmVy
cy4NCkkgaGF2ZSBhZGRlZCBpdCBiYWNrIGFuZCBydW4gY2hlY2twYXRjaC4gVGhhbmtzIQ0KDQpS
ZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9m
DQo=

