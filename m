Return-Path: <linux-media+bounces-24189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8879FED60
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 07:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FEA81882C1D
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2024 06:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF64188907;
	Tue, 31 Dec 2024 06:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IjVDMLIz";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="YB+jpQMl"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C558A145A0B;
	Tue, 31 Dec 2024 06:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735628129; cv=fail; b=nOMFR/347cB1hC9t+fvYypKEUAdoYu0a4Fz4MRCALd8t1hdmfFqDFvmVpefx9w9hVqYy5W1j6lK4VTl4K4DkvnNkmWPyDgbhWrghqKdB1zG7vLsvL+0UT6ra4x7TL+/IJ82oX7/73NOgmQNsazc4/ld62tXStAPOHM9Jo6UGEc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735628129; c=relaxed/simple;
	bh=rA4EpMWRxTZJZysPvY45KXEcLaYnOGKfbm/Z/G7R3SU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jq6lpNsEB6cbAh/7nuCumHLEzNSRCNh9uRQj08BDkzkSmafoivpED+yDfRBUj4nrzg+I7NwqdaYuwn2ph2rpWOlmkkgGKQtAxysMTXBxmG/MnxvLUOIMaTAVB39x8PtfDyvyn1LMn3FMCm9GOviAncn1N5tS+ejwNAhjIu65f9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IjVDMLIz; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=YB+jpQMl; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 30c0ce7ac74411ef99858b75a2457dd9-20241231
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=rA4EpMWRxTZJZysPvY45KXEcLaYnOGKfbm/Z/G7R3SU=;
	b=IjVDMLIzXg+fjsoakbfDclADpi3rQcC5IWhenYzvadr+biXHhxy23CKDVwyihyLXMVHXrHifwEZy2UmR7H3rVZa1TwYzLFxNRXvyoWxrulFcz7q4u1RMgdEkttsmNvCKlLC5+NrTjzUnl4OkSjUSGGQGdEbwYgIEvCZytrm7jN8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:022bf7ec-0230-44f8-97d8-c3041201fd07,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:ae7f2637-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 30c0ce7ac74411ef99858b75a2457dd9-20241231
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 738812727; Tue, 31 Dec 2024 14:55:16 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 31 Dec 2024 14:55:15 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 31 Dec 2024 14:55:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJ0HMpskIhpyhUZ3uMh3P4YJP89bQMahXKLsfzBKjM8XcijKmfY4vyFVGUUsSK8BiYagWpISJCFsvnLx7leigWUy17mPtKQMn2xu8k5Exs/FnyON9PiIF9GjLj4fMZtUctk5p4pGZwD8zOyymP50xyhoJZU7jDd6yEZQ6ZjtETZjz9HIPLzSB6s//ppntXxODP/bcHwMQ3j0eyxFDtPVULuWI1pUt5BzVTfsHg9nWLphCXCz5jqvIx6zT+igyOgtQyW5fkwhyXkhC0CED1eyemrsLatIMNMRmcNbzCAXGMidQD/nhWs1ZSkM8Nk3Cb1DvkAzVaRl5xVMvMk9MTjOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rA4EpMWRxTZJZysPvY45KXEcLaYnOGKfbm/Z/G7R3SU=;
 b=cv6HqW5/HzJ9O8D135tYDAa8AwL5EShjw/9HQO7/hOCUFwvbchXJ9AErQ0S2ePmHqGpmuRJDXndLLaw8EwtKhY7WtIRAcFRDX21agJ4cDetWG4Yvap/G6o8TfSco0fol4W5C4ECYb1YF/VqPvs+MQ8hflJQh1bXSur2sKMDJfnlFIdTj7H+1HXcaMQQ72tvUqCOueB+4UxOZ4uLgLUAULbLYs/CZqRNTtg2CyHXICEahD4j9xoMNPMEFZydr0XUpf6+xe6blDpHFCr8u6r1GLi+QkzJytnB74qrfppxTGm2ozVyVrPF117VPh4s32LT5zEogUfhaPpESOAz8rQ36Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rA4EpMWRxTZJZysPvY45KXEcLaYnOGKfbm/Z/G7R3SU=;
 b=YB+jpQMl37kbyB0qyt6DpLV0QjdlSqNv0Lvn6JiG3Y0i4jQVXrkmNbOF/sHu9++ywuEGlBuV4tuJHrKeFYLxIk0Gyej4nWk2bmNA/naIvkxqMYD22vUjo7dFx6mL55rwRUt3U1D+aQoJKx37grSuMvjXc8DfAGkASBph7VuqCBg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6882.apcprd03.prod.outlook.com (2603:1096:400:265::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Tue, 31 Dec
 2024 06:55:13 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 06:55:13 +0000
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
Subject: Re: [PATCH v3 4/4] uapi: linux: add MT8188 AIE
Thread-Topic: [PATCH v3 4/4] uapi: linux: add MT8188 AIE
Thread-Index: AQHbVqu3NoUY7tW7Y02VDtQ/iO6t3bL/9IgA
Date: Tue, 31 Dec 2024 06:55:13 +0000
Message-ID: <a3a6d723e7018fe0c2ace016aada4cd2ac62c578.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-5-bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-5-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6882:EE_
x-ms-office365-filtering-correlation-id: 10ce3f6e-fe7a-4337-6322-08dd29681323
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cExsYi9hZ3JhRFJYRHVPbHRsdFJ3a2FKMmlLZDIyQnFNdllzdnEyR20xRTli?=
 =?utf-8?B?SWNTOXNvcUhRWlR4bWhzaGpLd01CN0ZIelphV2JibTI5NnE4NFJoTmhOcElL?=
 =?utf-8?B?L3NuY0ZjMThUTUVpT0NFbmtzOW1XSEdOVzRVODJQWlhHSnFrZXE1Zzd2V2k1?=
 =?utf-8?B?NElpM1g1c2pqOStnSVU4NlRhMzdZMFRiM1AvSnYrUGN3RllxL0RBbE5IT2Fm?=
 =?utf-8?B?REhXOHdneWpac24rWHk3VzFwT240Tm5DalFLendORDh6VjdNUHNiU1ZtSnha?=
 =?utf-8?B?ZUcvcmY3UHdUVDNFdmVOSWNQeUJBcE9FdTRSODJ4emRQZlg1VklFYkUxNWQy?=
 =?utf-8?B?VnZtdG9NeURJeEMrS2Zpek5mRlpkVjFJVy80NjZoR0l0Rmhqa3J0UHFrbmx4?=
 =?utf-8?B?QmtoTnJ3cDNvRGY2TE9KK2VXTEwwU08yTS9NTnJOcDM2SlJkTUNYRjF5S0N2?=
 =?utf-8?B?cGxDMm9NOTBua2RjS1hLeEVlMzk2dnR3dUs0NU4rRDAybzg1L25DQkZFTS9n?=
 =?utf-8?B?ZXFxQW02VXVlZEZzOUVWZnlDdmF3OXJydFpWdXp1UXZ2Y2lrclBucEVyUUlE?=
 =?utf-8?B?THlvMTlMTlp0UXpyTFNNSW1YNkpMYVlvdXlhQmxBSS9ERVNsWG1UYWIyb29P?=
 =?utf-8?B?alVkTHBuUVFxcWluNWRlTm9XNHNiZHN1TVdXOVdIN3BCU3YxMEw2RGMxblVW?=
 =?utf-8?B?Y3JrVTRMVExUT2NHeHdNRUg1ek8vUmZlZE5vNm5EL2RQT3kwTkwzb2taRWxR?=
 =?utf-8?B?VitMNXVTWlUxNHQ1R1BEYkFzeld2SkV5bjNGQm5hRFJnSEd5OUo4WWNtVkZa?=
 =?utf-8?B?cmtuOURMN3NqYXNyYkxwcW9vbU0zRUlwRW5jVmR2d2E3YjBDUmRkMWR0enhu?=
 =?utf-8?B?MFNMT3h5WlNZbElDUENSOTFscnlaOWtTYWtESTJrbFppUjBicTR0eVdpVW16?=
 =?utf-8?B?clE1bFRLYUx0cGxpUzRjMUp5WGlac29DY2k3dGUzTXBYZFBua3BqUUNqOEp4?=
 =?utf-8?B?aDg4QW1SeXpXajhkcUl3engvTUpUMkhqYllSbDQ0alBNUXRZMXgyV3lXT0g5?=
 =?utf-8?B?VkZtUEZWUS9UM1ZSamhvQ1JNS2w4ckFsQ2tUaitEaHRPckd3Q0FuTlVRVTFw?=
 =?utf-8?B?Vm5YZmxESi84Umpzc2ljcmRxVTZIRzUxNm51aWxCN3JVNDBDcW1IVTJyNVhU?=
 =?utf-8?B?OHN3ZklwTTZaRHJrUXFkWjZoNVBUazVVWjU4TTRURk4vc2xQR0NTZXJaSzg1?=
 =?utf-8?B?bmlSTkVwY2U2TG1KZFhhNFJxcjQ3STNoaGI1a2NpZXVjdHpsWWNYVUV4QXdC?=
 =?utf-8?B?MTltaDdxcllGTFZydS9sUjNQdEN3cWJ5RWhERkU2aGxmQVhTajhZSlVQZWxF?=
 =?utf-8?B?WVV1Q1p2R09FVDZWb1QxS1Y0c0RjS2hLZGhvdnVFNGttZG5qclpIMmEzdXN4?=
 =?utf-8?B?VFFtNVZmMnBuWloxd0NnQ2ozdGlXUHJRbENDbkZMQnJKSVhCa2s5STRlVmZi?=
 =?utf-8?B?RUJHRWZxcVNvYnl5Mkd2SjRNZnNZbFNXSk10a1JwcVZuTXFzcXJ5ODBFTHBv?=
 =?utf-8?B?T3ZCRS95ZkV6NmFRZkpVTzRyZ0VsQ2NxRGdKUmxFZ1lVSUZZSFVNNnBzRXNv?=
 =?utf-8?B?cVprUldDVG44Z1d5Zm1tQ0lITFZsSjJEN1JlaCtvSkE4RGJrVStGTnkvSTc5?=
 =?utf-8?B?R29LQmQwWFQxWk92dE9XSmRWZWEwbFpUTktOc3k0K2o0NHdlam5JcjFQdnJP?=
 =?utf-8?B?Vldyb0RtaFN6Rnp5WXI5TnYzeU03eDl0SVEyWW9jN3ZYOVRFK29uQXFQMXkw?=
 =?utf-8?B?U0V1S0xaZUxsT0F3d0xldVVUQWx3SnRDYjRCM1VMemV2SUh1T1YxVUhBOVN1?=
 =?utf-8?B?elNndS9kSmJXN3EzTHNJcHRDQU4yZVVBM2J4MEM1bFZEZE11dnY3VFFaNnpU?=
 =?utf-8?Q?+adOB9taXn3uIbqmGtLQpD4/Z8D8Z9Z7?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFpiV2JuZ2YxeFFTNlp3Q0pnWCtVZWFGaWd4ZjJkOW1mWC9tbUEwNENmWkpn?=
 =?utf-8?B?NHVpdmRWQVVHNGdqOGUxR0hrbHlZc1FMSkdBZ2h3Qy9UN0sweWZaYjIvZTVE?=
 =?utf-8?B?NXA3WHNWcm82ZlRvSGI5Sm5SWXlCNXc5bzc4c1VVbnZ3WVUrWEtacHV2SGVN?=
 =?utf-8?B?dlFXUlloQlJQcnBLdGZVM3pWTkdoMjMrcVZQT2VheUx1dFR1TXhGV2VOcGZi?=
 =?utf-8?B?cHNhWGVUN09EMmlla0JKS2kzWXlKSUV4VFdBLzZqK1BQd2xZRDROMlpRSEcy?=
 =?utf-8?B?c01sZVk3OGFqZkdmdmwzUTRETHlLZzVXeXQ5L2t2S0dGUUlNeE82Ty9CdDFE?=
 =?utf-8?B?b1NMNWlSeUNPdFAzYmJ2NGFVdlB2SnU2VUdxN0hYajg2clBZOWZGMUlXd2NU?=
 =?utf-8?B?NjB6VWNpT3oyaHFYWk8xYmdjb0NxcTlpc1d0Z0w0bmhyVDZncmNKZHA0TTZG?=
 =?utf-8?B?Q2dESTB3MW5MVGp3eSs0MEVSQ0h4V24yZVdvNG4vYm5CRVhJUkc1SEV5L1JT?=
 =?utf-8?B?dGVGNFhiVU9ZN1MyVVJlSVlMMzM1S1U0SDdHcERzcGF6Umt1SXE0VDNaQXJV?=
 =?utf-8?B?NmljQm9zUVlOUW1zVWg0cDFhK2JrYkxsaGRBMURHem93N0M1OXZ4RVppRk5O?=
 =?utf-8?B?a1JtcnpBS3RtL0ZCVkY2eUNtSzBDdzRPdnVDQXFTaGJkRjFMVzJKWXZqaTFn?=
 =?utf-8?B?VFJKRzZpT1VESitVSmlxS3diOUlsZXdLaGRNYmxGTm1UL2duZ2RrRHhFWDV6?=
 =?utf-8?B?Qm1XMGVuL2Nzbm9mT3lySWYxY1M2dEtnU1hSdmpGaTN4MnZaNGtVRXptaXBO?=
 =?utf-8?B?d2kyL1FoRkJXUGpCK21zMEQyUnY1OTFWVlZlT1VYTWpJMWZtS21kaU1zT3dK?=
 =?utf-8?B?RFpqRUZZL3AwV1JuMGpmQjF4a3ZJczRLT3NXWTBUN2pYZ0l4SUN6bnd0a1FK?=
 =?utf-8?B?cXN6WVBpZ3ZsRTNLRFVMbnIyZU4yYjFHUnpOVmdRSmc5SVM0SVk2YWRtUmcy?=
 =?utf-8?B?ZWxEbjdHbHlTYVNjV205aXJMMHZVdkU0eG5tbUU1S2xoT3Y0L0ZBMjU0bHFE?=
 =?utf-8?B?bmZGOGZYNHhaUGViUmlGUW8wckZUelI4aW5pQlFsdjh0SmI2dHlTOGdnR0c1?=
 =?utf-8?B?MGRHOGVnMW5YVWozeHdwRi9jdHZOTnlGMXp6eERwZzl6em9jTEJCSVN3b20v?=
 =?utf-8?B?SFpnczkzbkI0UnltREEyUDJnamRMa1RGMENqUXd1REFidEo4a2FSYlBWNDZK?=
 =?utf-8?B?M3EvZ2t2NHJ1eForbVZCaTRCSzhNakd2NDFtc3VnUHZ3a1BEVktuSlArdGhh?=
 =?utf-8?B?eDRhaXZSUG9IWVU1TnJrZ3hOQ2xqclRCZ1J4WEpXZDdSUjJlOXVueEYvelNM?=
 =?utf-8?B?QW96N1FTTlU0aUQrd3FLWWl1WVlhV212NldHeWJEczU4a3NPdFBEOVR3VnZF?=
 =?utf-8?B?NW8xdGNIaUpqMkJPZHdIV2dSeGpBTk1paHpNTk9hL3lvME9qVE5GMnUvcFJy?=
 =?utf-8?B?WlhMSWRxR0s1c0dGYTI3K0N6YmljYW5jWVQ5dWhvbERMcm0rTnNMWmwxa0Z6?=
 =?utf-8?B?M0I4SnQxa2lKMDlieFE5MnY4OE9mZytad0VXa1JIR0xHWVRuM0szcFdKZEdS?=
 =?utf-8?B?RkErUnVXNEhscGF1K21ueERBbFd0UVFaNktsN1JqV25iMEtlS2NvZ1FHekVi?=
 =?utf-8?B?bEtSY2RCQmY4YjRieUNWRFNKcldGTEpnK1UxSE1vRWZCYWIxazBwbUY1cmIr?=
 =?utf-8?B?a3p0elRQUnRNOUJhTU5UR3Z0ZzJaelBFc2E2b2xaZTdhUVh3VWlDajk1TWto?=
 =?utf-8?B?WHJ2MlE1MEpkVFhQcHlmSGkyRHZsOG4rM0Yyd2N2Zzl2SG15cnp2VGJRS0VB?=
 =?utf-8?B?ZXFySWoxZjZ2Z1gwcDZoUGhiZUJuNjBHRVI1MnBDRkJqUXVNTndOam4xNnVP?=
 =?utf-8?B?N09MTmYzZVhvYitVWHZpZi9PWnhJZmlUV2M4TWphYW1lbmFtNDN2MXdCeU00?=
 =?utf-8?B?bGVQelFyQ1JwcGRhR25TcnFncGlsWG5Icmwzc0dmMTZscC93SFcrYlVCRFZh?=
 =?utf-8?B?RTYzYklRYzBBUnU0eXk2aEZYcVlCK0orbUtMYi8ra3RXRXBsenl4UE03djdi?=
 =?utf-8?Q?JFd+r+fgNnUHGXl+jol8Pvxzp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4792EFC006C6746B70F521461DCC24C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ce3f6e-fe7a-4337-6322-08dd29681323
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2024 06:55:13.0592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wx0VJTZflqvUhx2qiXXesGBMg1/NyWrdk0Zo39nFuoUTWdPUgegrcaHwii6jTMwbDwPuwlR+xmw6ECTr+Hy+BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6882

SGksIEJvOg0KDQpPbiBXZWQsIDIwMjQtMTItMjUgYXQgMTc6MDAgKzA4MDAsIGJvLmtvbmcgd3Jv
dGU6DQo+IEZyb206IEJvIEtvbmcgPEJvLktvbmdAbWVkaWF0ZWsuY29tPg0KPiANCj4gQWRkIEFJ
RSBjb250cm9sIHJlbGF0ZWQgZGVmaW5pdGlvbnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCbyBL
b25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmggYi9pbmNsdWRlL3VhcGkvbGludXgv
dmlkZW9kZXYyLmgNCj4gaW5kZXggZTdjNGRjZTM5MDA3Li5iMjNhOWU5OWM4MzUgMTAwNjQ0DQo+
IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaA0KPiArKysgYi9pbmNsdWRlL3Vh
cGkvbGludXgvdmlkZW9kZXYyLmgNCj4gQEAgLTg3Nyw2ICs4NzcsOSBAQCBzdHJ1Y3QgdjRsMl9w
aXhfZm9ybWF0IHsNCj4gICNkZWZpbmUgVjRMMl9NRVRBX0ZNVF9HRU5FUklDX0NTSTJfMjQJdjRs
Ml9mb3VyY2MoJ00nLCAnQycsICcxJywgJ08nKSAvKiAyNC1iaXQgQ1NJLTIgcGFja2VkIDgtYml0
IG1ldGFkYXRhICovDQo+ICAjZW5kaWYNCj4gIA0KPiArLyogVmVuZG9yLXNwZWNpZmljIGRlZmlu
aXRpb246IHVzZWQgZm9yIHRoZSBNZWRpYVRlayBjYW1lcmEgc3Vic3lzdGVtJ3MgZmFjZSBkZXRl
Y3Rpb24gcmVzdWx0cyAqLw0KPiArI2RlZmluZSBWNEwyX01FVEFfRk1UX01URkRfUkVTVUxUIHY0
bDJfZm91cmNjKCdNJywgJ1QnLCAnZicsICdkJykNCg0KQWRkIGRvY3VtZW50IHRvIGRlc2NyaWJl
IHRoZSBkZXRhaWwgb2YgVjRMMl9NRVRBX0ZNVF9NVEZEX1JFU1VMVC4gWzFdIGlzIHRoZSBleGFt
cGxlIGRvY3VtZW50IGZvciBWNEwyX01FVEFfRk1UX1JQSV9GRV9DRkcuDQpUaGVyZSBhcmUgbWFu
eSBkb2N1bWVudCBpbiBEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsLyBmb3Ig
eW91ciByZWZlcmVuY2UuDQoNClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtbWVkaWEvcGF0Y2gvMjAyNDEwMDMtcnAxLWNmZS12Ni0xLWQ2NzYyZWRkOThhOEBp
ZGVhc29uYm9hcmQuY29tLw0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArDQo+ICAvKiBwcml2IGZpZWxk
IHZhbHVlIHRvIGluZGljYXRlcyB0aGF0IHN1YnNlcXVlbnQgZmllbGRzIGFyZSB2YWxpZC4gKi8N
Cj4gICNkZWZpbmUgVjRMMl9QSVhfRk1UX1BSSVZfTUFHSUMJCTB4ZmVlZGNhZmUNCj4gIA0KPiBA
QCAtMTk2MSw2ICsxOTY0LDkgQEAgZW51bSB2NGwyX2N0cmxfdHlwZSB7DQo+ICAJVjRMMl9DVFJM
X1RZUEVfQVYxX1RJTEVfR1JPVVBfRU5UUlkgPSAweDI4MSwNCj4gIAlWNEwyX0NUUkxfVFlQRV9B
VjFfRlJBTUUJICAgID0gMHgyODIsDQo+ICAJVjRMMl9DVFJMX1RZUEVfQVYxX0ZJTE1fR1JBSU4J
ICAgID0gMHgyODMsDQo+ICsNCj4gKwlWNEwyX0NUUkxfVFlQRV9BSUVfSU5JVAkJPSAweDAyOTAs
DQo+ICsJVjRMMl9DVFJMX1RZUEVfQUlFX1BBUkFNCT0gMHgwMjkxLA0KPiAgfTsNCj4gIA0KPiAg
LyogIFVzZWQgaW4gdGhlIFZJRElPQ19RVUVSWUNUUkwgaW9jdGwgZm9yIHF1ZXJ5aW5nIGNvbnRy
b2xzICovDQoNCg==

