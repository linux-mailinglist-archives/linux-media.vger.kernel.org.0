Return-Path: <linux-media+bounces-24093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A969FC973
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 08:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 528F6162E37
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 07:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607F31CEAD5;
	Thu, 26 Dec 2024 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LczYz07E";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qz/QvoI0"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158E379CD;
	Thu, 26 Dec 2024 07:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735198739; cv=fail; b=G1/ltGzwmpShRRf10y6aKqc6pXpgUCc8kXjhFNLS+7QPSEWhUgoh4OA5+Mer1eiZjCAE+HS4PlvsoOUErptqnooW3IgwOYnHFpA0j/cvMd6aiC0ZKj1DKPs7NjMOWPYG2nY0xBV6wUBNRdnzf1SCFKokAADRFlsfgNGKLtchHGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735198739; c=relaxed/simple;
	bh=9pgWtIc7mj0pNHAQJ6fEBpzyYfYODmoIC9d7KedYOks=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JiN8saK8IFT8rVHxuP3+YXWR7SHyQswcBAMZkOjbYhlJ4wvrgyixDo47WefIFuhwpiAnZPlDgzpeK2QZBl7I7eiAjSzbnV9les4orpbmvX02rnD8MvRvs+jjn2FI3NuVgblE7KA0tOw39Y3nCOIjB6g/yM3wG/JPSqhZfTRaCIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LczYz07E; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=qz/QvoI0; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7299911ac35c11efbd192953cf12861f-20241226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9pgWtIc7mj0pNHAQJ6fEBpzyYfYODmoIC9d7KedYOks=;
	b=LczYz07EgkyEyOLwRhthCrThat3bbBysFnNdhDz23M6XvAdfRIlnGOrRXUIhsGb3arKJPBgwHzsabdkRs+V4Jm524gI7Uz8FUvHFA3L9AH33B98IdEJbiB5Rk4bEYEzgk2ILH7KhauiwN4h7R6RHTFH0ym3ziRHBvbwuJD3v818=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:6e14ba64-d1c1-4749-ad1a-c1a2be1c6b24,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:cbd6e418-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7299911ac35c11efbd192953cf12861f-20241226
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 922222511; Thu, 26 Dec 2024 15:38:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Dec 2024 15:38:48 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Dec 2024 15:38:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EykomANnO1dw0SUvboLb+xjv1dyasxjNK4FXmC//lHD9tN5jAb+mHEThWYPuPfuEbJsfHhe3McRuSDJDvH1fpSiP+KZ5RhNnJ4FRF62rJJvANAAI6a/yBOoxm0gTmm6HtIzVW5Eefg0s8TwVURUAEvka51L6qEB7aew8hfs9k8LEWyj5TxNd164G7x/vriKWbQUzzNERC0RK0ez6DRE46h0m15170UEpLoJqik75hqHCOMEaVLfblkimyl07YanPUft15SWCbSCSMw/vXPqBL5KjoTlz3DSr1TaABygcUJqz2yexpACN8t5pJ9yWaFdamEMXa7lbDbmDo0mm62mBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pgWtIc7mj0pNHAQJ6fEBpzyYfYODmoIC9d7KedYOks=;
 b=tw86jxm0pUeIqIJzEk29X0aNSC2itXn08cSEjMt+YXVDtWobmM8jRYO00oNyyZ6HZ8f7c53rPJL/f5k+rPKx/ECBcMs4lL9XXgn1LNNZg1E2rcpxnIV43YLv5mN7nlNzziwO2UjicRuzgckXxXvDyxaxM8w8WkWVvOtgDLFGOeqyE+EFKe6XnyJLSA6vbcezvQGdE8eqKAolmRfQ7+DIU0SjcrqNY5B7H8GG7rKcM/x/cXj0Hzd4r5exsH46JPCTTervz9v1Dk8BdjFgbWV1DAvf/0vg3KKSHSfoy4wAS3Z+gWFSl/EJ4zoq/Ncn0uqFhLJHxArB2XYoQuB9HZmwFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pgWtIc7mj0pNHAQJ6fEBpzyYfYODmoIC9d7KedYOks=;
 b=qz/QvoI0TTKDCn7d32L80hHMTr5IiRJErr43QamYeE7s9xUWmw2n4Y7OGQNqC87KnIHkayojazWmwm//7jc4tFcE3NVFke8B+LZ/UM33xvoeNJh26IsVQnn96eERd4BV9SSPNV3g3YnVRcmfSXJ08GY0jqkivCMyjWo3MbLUqmY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB7136.apcprd03.prod.outlook.com (2603:1096:301:114::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 26 Dec
 2024 07:38:46 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Thu, 26 Dec 2024
 07:38:46 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?Qm8gS29uZyAo5a2U5rOiKQ==?= <Bo.Kong@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Topic: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Index: AQHbVqv2E/LiiDV3F0q0O1OD05OMm7L4JQqA
Date: Thu, 26 Dec 2024 07:38:46 +0000
Message-ID: <2e40357195a293c638dc48e556973d8a5441667d.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-4-bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-4-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB7136:EE_
x-ms-office365-filtering-correlation-id: 2f136ffc-52c5-4f01-2f34-08dd25805483
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aFlTSlRBOWtqSEZUbU9ScFZsOVZZSVhTNTRLV3dmZ3FJNHRJbWdYMTgwVWFs?=
 =?utf-8?B?bmJ6NmhySlcwRDZyQytBYk9GUERGVEdEL1pnSURGY01kMmdLd3gxcW90MlFF?=
 =?utf-8?B?NDgyMEhLaEd0SUN3WlBQZGlWajZjSXhKV0dVSlJKcEJpL2lOR1lwNjNlbHQr?=
 =?utf-8?B?M0Z3RGVMQWtQdUpyUUtlRzVPU3dmL1BKM3htUEliR1M5SEdDOVBBRnlLeTBa?=
 =?utf-8?B?cDFBUW82ZTBRMVV5YlZRVHZYZklsOFlRWERXaHZNVW15Vi9ONDFVVVF0Rkd2?=
 =?utf-8?B?SmRoMVg0aFpac0ZtKy9IaVBhWnFvWk45SkZsMWRkZU0vWjNtalhTOFFWMytL?=
 =?utf-8?B?VkJQY1h6S1VhTzd6ci94WGgwY1IyUHhxR0NRM0FWOHlPODhHZ1VHUWlOWUd6?=
 =?utf-8?B?SG9mVTQySURHTkZRWGI3S1JuOHVvU0huSzk1MVpjRGVQa3dPczU1SHd1M2tU?=
 =?utf-8?B?dU5Fd2ZudUx1VEo5dDQwRlpndzg4aHFMTG9ZVytkQW5FazdkUTVGYzFXVE5B?=
 =?utf-8?B?UDVBQVJZNkVBdTQyaGpBV3VLdDZiSFY3eklHbmJQVGxFNmNqcHBHblgwY0pm?=
 =?utf-8?B?SkVnWjM1b3pOT1JoendEZzB0aGZMSlJxUGtKOFh5ZVBDTXFnVHl5a1Vra0tW?=
 =?utf-8?B?eG9HWHpjT3pBRDBKckRmek56RndFcjExVTRxM21GNWpxdm9JL2g5cjVabXFj?=
 =?utf-8?B?TEtBMElrOSs5M1BHRHVSRzc3L3ppSFhFbGFiZkVMVUp4dXFuKzZIWGQ2cFZn?=
 =?utf-8?B?ZXlJa1RPNmx4MW14NCtQMC8xbE5tUTZzYmZvRzhETHdXdFZnbDZremMvbWNn?=
 =?utf-8?B?bjF3Vk1CV1lMOElGLzV5QVlRU2U5T1YxRmNZNXpjQm1oVHVCS1FjRlNyZytF?=
 =?utf-8?B?bWpuU1JVTnVENFY5dWhvWTN2MmM3T3k5c3l5YUkxUDlFTmNlUE5SWGsrbE84?=
 =?utf-8?B?KzBaMDROb0d0NTZuUE11Sk42L0kwWTd1dSt4STF6TWMvMC9uYzJNWFB6VnJr?=
 =?utf-8?B?S3lyY1FtWWl5THZ0OHd5cmRIeGdlUHNXNzVHdmVUVUgvMlh3WjU3bElzcWlS?=
 =?utf-8?B?UmNJY1V6czVjMS9jQThmdmticFo2NXFkRFYrbDZ2NjFPNlo4cTk0L3EvQmVj?=
 =?utf-8?B?eDV4UGJJWjI3amY2VW90TDZ4cTh1V2hLT0x3eWNMOVVyZVR6OTB2c1dtL00x?=
 =?utf-8?B?MzFTQjVXQVNWSkRUdTMvM2dsNGpzeUNOd2l1UmNMMktxNWRpTkY3VnpWeFFZ?=
 =?utf-8?B?ZXRDdTUxZkNMdDZGb2wwVHJaMjNhOHM4YlFDUmJFdUR5QUVlMStPSmdXU3hl?=
 =?utf-8?B?OVA3U3Y5RnY0ZUlXWDRib2F1MFo0WmRTYWdtSDM4R2JTRzBzeW1xYnBaNmxa?=
 =?utf-8?B?UFVjMEZBd0drWWV3cXZ2Uy9rS2ZtV2xZYkc4Qnk3M0J6ZzNZR2MxaWxDNlFM?=
 =?utf-8?B?Mkp0WStKcGp1WmJEOHJxTGNUQTZNcFJVVFQ1ZHlKQ1lDNmJjTDVTY2R4SGVJ?=
 =?utf-8?B?U0lrcnNJWEhKVCtOWVhCNG41ZjRicUJYQlJZblBHQ2Z3MFYzZzAvUlM5SEZC?=
 =?utf-8?B?VHFnYkM2TkhhVjlMaHZFNXNIaXZ6U3VpOVA2eXVTRkZFWjJ4UU85Q3lwek5R?=
 =?utf-8?B?QnpRekhWVS9laS96T3lvV3VDT2lVUDZHSzV4NnFBNGMxT043ZzRBOUJnOXI1?=
 =?utf-8?B?OEpMdWdvSTkyV2h0Tkg4Y1V0bm1yc0F0TmtNUkJWVWRQbC93WUVSNGNpRGpL?=
 =?utf-8?B?TlBseVEyRW50R3paM1pSZVg4UGF3UVYyRUE5bkxZWGlIbm9ERlRvS2EwaXBl?=
 =?utf-8?B?Q25zMGVIS1lxUm1TWnFEWTF5UFhtcHptNHl2ODNIemZQeG5nQ0F5QVlPUzJ2?=
 =?utf-8?B?V3hqbnUyRDJLVE92Q3dVd0szaXU4YW85bFFML0RFdUlpN2RjUjlWTHNMWDRF?=
 =?utf-8?Q?xq1GiI0vn124pUNSbrWlknHz8FRDF9Zf?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGhBVGFMcWw1ZnN1OTJGcUR3RW0yUk1NN0JzVG54VXBKOUwrYlM4dVdrYUVN?=
 =?utf-8?B?NWNkV1FCS1NHVFA3N0RKNVZWZEtwWTZlNVNzemdVc3A1UG13Nm5nbmdUcE5n?=
 =?utf-8?B?aE1uUEJkaS9QR3MzaTZpM3NLWXFhdjM3NW0zYXV5bk0vcERCUHBOLzdBSTli?=
 =?utf-8?B?bERDcmw1clVvMGF6Rjh5eUtTdlVXTWd5WEJsOXFJY1h3VkZMVDdUNUVEMWpC?=
 =?utf-8?B?R0txOWlia2grMENOVWIzVTFXSVJDM2tzYmF3VkRLdW01WGNFalBZblowaGcy?=
 =?utf-8?B?OU9tdWZlNE9kKzVBV2pteEV6RlU3eWlTRFErL0hvN2xCUGhFUXFQUUo2dGNR?=
 =?utf-8?B?MUFmQUxIMDlXM1N4SkJlQ1d3cWVpT3E0TkpSbHFlajBndkk3MHp6Y0d3OWNL?=
 =?utf-8?B?Z3UrcHlSWTNFZFRRVjVkRk9ZcFJRdmRuM0laYjNuRDBibFkvWEJQZUJGdlIr?=
 =?utf-8?B?alJvZHBuT1hldmZSTkpYM1VtbG5WaFJWRGNicmFwd2hPM3htOUlVTG00SjI0?=
 =?utf-8?B?emRHMHBFTlNhc1R5K1NDL0JvYWtqZkVkL0tZQUtoRDloNUltVUVOWTUzQzl1?=
 =?utf-8?B?NVB3SVhXdzdqeDZUZTNPeElySGE3aDhCRk9OcXpSMlRRemtvT0NvN1JrRkJC?=
 =?utf-8?B?Z20zNUVLb2ZLUTRQRUVicTduK0QzVDR6aktnalk4QzgrM1lzdnRWVURLN2pF?=
 =?utf-8?B?NEpzUnNhbTBiRDBZcll5bzJud2RlZkpZV1VyRVdIS0VrZURVbkJVZjRrd2Nr?=
 =?utf-8?B?d1F1RDZmclZxM0liMDN2Z09pQzFkRThFTDQ5RDVDN1ZHVGhkMU01bVNVUHE3?=
 =?utf-8?B?NkozdEc3ak8zaVlJYk4rWGFuc3g4dDRhb01SamptR2VYS3RFL3pvbDR0N041?=
 =?utf-8?B?VFpucEhhZ2ZuNE9QSTN2TkY4emtiSVRhRWhlaGxaQ0pZeGZQczV5N2NVbytL?=
 =?utf-8?B?eWZBaEtadmY3SzVoemV0TllUY3NkVisxbXlKNXNGYXhSK3pBbi9DNDVCdXJZ?=
 =?utf-8?B?Zk9TN0dIdml5aDJRNm1uQjhMY2tNeTRWV21MV2I2aGtITTBVL3QxZ1NWQzRC?=
 =?utf-8?B?YzkzaDUrdDJUa2M4d3lySllwMitzNzRXZDZ6ek1WZjUvWEtlSHM5anc5Tndo?=
 =?utf-8?B?MjFxcDFRaXB6eXhicmpYT3d2dU9rVFRmMENQOFVXRXU2S1Q4aWUrcjZySnpi?=
 =?utf-8?B?VjdKZ0l0RXdiS2xHek43ay9mWWNnSWJxVjRtbkxBUWwvRDdLU0JVTlQzblM5?=
 =?utf-8?B?VUd2K2I4STVFM0lkTHRIajFCZnhoTWtpa2ZjY3JJNWNiM2lJaS9jOFNGT2Q4?=
 =?utf-8?B?NCsrQXB1dXpJNS9Dd0F1dVJQVUkwaWZUWFd0L1d4UHdMck5yUnhMMjFLb3NC?=
 =?utf-8?B?VEpuREVQcElPZ0w2OUFuZWxsOFFBdlMwYVhZeWNIS0VQSTRJNHpSazJwMXZh?=
 =?utf-8?B?ZTRuMjBaZlJXNktMWVZQZTJWQW5UbGZJcExncmNIbW5MNzhaLzAxdFEzVkpk?=
 =?utf-8?B?cllDU2NjRE84M2xqakliUjh1Y3drTjVvUDEzM2ZEb25IbkcyMmVSS2g3eGVE?=
 =?utf-8?B?T0FQa3J0MG1WOGt6aEw1bWcvU0h1M1pYZ0JpODVaWmNnUEl6K2Z5L0lhRklM?=
 =?utf-8?B?M2FQTWxEbDljL0RDbnl0WGtaWlBFTE9hV21Oam4waWk5b1duNStOMkNzYlM5?=
 =?utf-8?B?S3FkY282eWdBaU9DK21LZ1dmYUhXeEZHWHFWMm1tUEV4SzAyU2Fiak0zeVp6?=
 =?utf-8?B?SHdpRnpuRFNqNEFCUDl3UlZIS005VGJPZTNaNmphSTMzc0JPWE9jcEQ2SUxu?=
 =?utf-8?B?SVZJbGQwdWMwYWlPQzRSQVRkWEFUWEV3b29jQ010c21tMkFKQnZEanRVMFY5?=
 =?utf-8?B?ZVROTWZFOE5mOHBXcU9qUFU2ekRZeXMvNlN6WnlTcm1qZlZjN3VSUndIVFp5?=
 =?utf-8?B?N2dnM1RydGxuSG9PRE5WODQ1NEdPQXpNK3hmL25SWFhxdzlGVjVUMVJwdjVN?=
 =?utf-8?B?VzgrWms5bVUwbDllblNPNU9TVGFVa2xBM2Q5TDhxSW54UnBpSVYzQXRGQXB0?=
 =?utf-8?B?VE0vSHE3ZEkzUWhUTGM1THhqdUZDV1FlaXpPbWJCaGhSdmNQWVdzaWMzeFk4?=
 =?utf-8?Q?jvUx7FH/0JqVnqdVtM7uNM4AJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAB1D6E0298940448B92A60D72BAC04C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f136ffc-52c5-4f01-2f34-08dd25805483
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2024 07:38:46.0314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DITBDLFeFdNIfNp9MDW2nvRvR/6yrINNTatPFkEIk9UMoI/40e7T5/vxtIVTjJK+qtON4Kgr8k3+5RfkXuDvSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7136

T24gV2VkLCAyMDI0LTEyLTI1IGF0IDE3OjAwICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBhIFY0TDIgc3ViLWRl
dmljZSBkcml2ZXIgZm9yIE1UODE4OCBBSUUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCbyBLb25n
IDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdHJ1Y3QgbXRr
X2FpZV9jdHggew0KPiArCXN0cnVjdCBtdGtfYWllX2RldiAqZmRfZGV2Ow0KPiArCXN0cnVjdCBk
ZXZpY2UgKmRldjsNCj4gKwlzdHJ1Y3QgdjRsMl9maCBmaDsNCj4gKwlzdHJ1Y3QgdjRsMl9jdHJs
X2hhbmRsZXIgaGRsOw0KPiArCXN0cnVjdCB2NGwyX3BpeF9mb3JtYXRfbXBsYW5lIHNyY19mbXQ7
DQo+ICsJc3RydWN0IHY0bDJfbWV0YV9mb3JtYXQgZHN0X2ZtdDsNCj4gKwlzdHJ1Y3QgdjRsMl9j
dHJsX2FpZV9pbml0IHVzZXJfaW5pdDsNCj4gKwlzdHJ1Y3QgdjRsMl9jdHJsX2FpZV9wYXJhbSB1
c2VyX3BhcmFtOw0KDQpzdHJ1Y3QgdjRsMl9jdHJsX2FpZV9wYXJhbSBpcyBkZWZpbmVkIGluIGZ1
dHVyZSBwYXRjaC4NCldoZW4gYXBwbHkgdGhpcyBwYXRjaCwgaXQgd291bGQgYnVpbGQgZmFpbC4N
ClNvIHJlb3JkZXIgcGF0Y2ggc2VxdWVuY2UgdG8gbGV0IHN0cnVjdCB2NGwyX2N0cmxfYWllX3Bh
cmFtIGRlZmluZWQgZmlyc3QuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICt9Ow0KPiArDQo=

