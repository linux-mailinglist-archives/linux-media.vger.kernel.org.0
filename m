Return-Path: <linux-media+bounces-21354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B43EE9C69ED
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 08:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4423E284B8B
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 07:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5B1189BAE;
	Wed, 13 Nov 2024 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="enqhDmKc";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="BePXKDND"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4300230987;
	Wed, 13 Nov 2024 07:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731482712; cv=fail; b=UVtZZTnBM/PdKDvy6HqEtS4SgMl5fPx8Exaj6Di00ZZRzRSpsFkkRED6Ij3J8vr5Zt+fdLolqKzV1XZhpKnQJ9RHG+l9J0zBu+7XTi/NEhSZ4mNtY8IMlIE/GvBlxuxqJIRLs+M+3BMGzXqr6icxNXoEBcjPRfZWcFPz3HUY57M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731482712; c=relaxed/simple;
	bh=vqCU75Fregp4lsaTs+BI+UFPubwRlG19edCC+EMhxM0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DL4V1yzoL3K7SQ+srNZvghdzaxUH4O2MrrjcRMSWutwtlv3mAAqdCSMOx8Wqci6MaFemwoUO7IFdekZrMzkBsHMB0myYGUhhjWcdCPBMymJ33dqgpj0cmzC5Op8OlKy4Xq+8KePqMlKTUQ81AbOnOnlV2vAdHYpoh6/7SOKGgoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=enqhDmKc; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=BePXKDND; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 62dd0a42a19011efbd192953cf12861f-20241113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=vqCU75Fregp4lsaTs+BI+UFPubwRlG19edCC+EMhxM0=;
	b=enqhDmKcr73OX3Iyzc48bg221U4PbWf/Grbn+NBuQ00E58IL7+OsuUNDpcyO+9YNIn9MfG/cckG0Rxt9ZjiwZSmfS6bXYhKeRPaR+zP4g+a3vYA/S+viFzJIO/MWGWUX6PvXKJ+f1i4XJgL/T2la21BH3MRXPBD+x05P15rMpsc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:608797a3-8d5f-46ab-94c5-0ad2f129e5b4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:ef1f0107-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 62dd0a42a19011efbd192953cf12861f-20241113
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 504399572; Wed, 13 Nov 2024 15:24:57 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Nov 2024 15:24:55 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Nov 2024 15:24:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVX9dn8geplkypN2pLAvGNxxjM0UxLccq3xama27P1G0eohpwRVTzYw755aUu3iy0WxxMdHU0yadJ9PO3Gzbbx8t2sAmG10+fOOVFjc62MzHY1Oa9H4A88nfDEi/OL5ZrxsQ3HS+LhPgeijpSa02FbIXs92i35O7x8lnl260TFGxpgtn6yqMbj/5Qv29ebqf7QQAJ0fuid/Z+ximeypfgFj6d9oX8DCaoB9mCUxg6/Pj35vBgH8AbUu3VNKEjEIkkibppdQjX1wvz3TDpkYpZYXPZj6BOufeEzY6lw1EFKaHpxau4kjX8wOl225e7HqvgFsSm2Exz4dIW6eMopHYFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqCU75Fregp4lsaTs+BI+UFPubwRlG19edCC+EMhxM0=;
 b=yWoRd4DC2Dn956jrOx5vCO2RVdP38QV5tQpJBqLrHIboJ7hAGsFbW8BQbAOp2ntCRQmFIBPz8DL18W5jOvJnRavKyY66GXGd9gWE5n+fkUW3G9KEdRXsJTx6U+Qfz/JM8GwA35OJrIo7Ao17wF0VrIBdYnjlvPjV2dLdfx9nX4GIeKABNhvYuMIKJdn9m4c+WqGyLsq2DsdBGh0BpzDpZ/tdyxIcU3VQgomZuG1zyqVhR5k7SdauJWRVkxQKZCXl6Xto689zYc7p1amMVuM3eVzxIZwAqd3Nir8ZPEsC/TMcOSJDDTl7fnkYqQijK56ybtRWqlZN7v4DBwHZbFMDxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqCU75Fregp4lsaTs+BI+UFPubwRlG19edCC+EMhxM0=;
 b=BePXKDNDXbRv7EqRiDZHxjFI+6nHxcdFhxtAIB5rBK17mIvAKwB8WbG/1BWz6zWxetieRq3Gq2sZS2SE2evJJ0xqOOS2+jJjyhPVMJDGmp3VWc0oIsmwBEYcSzc/LzbSvkgHrMkfy0gzngtOhgjrKELF0pTIYnhzM1U6S0FRqBw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7969.apcprd03.prod.outlook.com (2603:1096:820:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Wed, 13 Nov
 2024 07:24:52 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8137.022; Wed, 13 Nov 2024
 07:24:51 +0000
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
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarK1BcWA
Date: Wed, 13 Nov 2024 07:24:51 +0000
Message-ID: <a3c551de67ccfabc0b55e0077f3f64ee1ec2ae32.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7969:EE_
x-ms-office365-filtering-correlation-id: 63d66ad1-f0fb-42ec-e323-08dd03b4437e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eU1IS0puczFBSEtIQUEvK0ZzWFBscDBhZkZUWkdmT1UxZXVnQUs0MER0QWxH?=
 =?utf-8?B?LzNzeVI3Z3FaTFJ3akZsZDA2NXJISWR5VHUvOCsyc3JGQ1RuL09Qcm9qREN3?=
 =?utf-8?B?cUJpYW1rUlRwK3pqbU5KZnV6c0syb2JNKzF6ZlBEK1Y0MnJrTS9FNHd2Qk5a?=
 =?utf-8?B?V0VpVGJrSDJ4TTI5MTByZ2pldHNUOGpxUUJSbno2MlVyczlDZG5wdjl6b2J0?=
 =?utf-8?B?cTFlR2lvZFIySTVsaGNUNUU4bUl0N3hoN0JlTmJSeE1Bbm9SL2JZb2V3bnRl?=
 =?utf-8?B?VWlnOTNPd09VOUVwZE5zNEE2am5NWGo4RkYzTFh2d05xSGtKMUdCV3U5ek8z?=
 =?utf-8?B?djF4K1k1VzFJdFZST0NwakE2SkN1UVFTQmJaL0U4OG9IbjBlcUsydEV1MGlw?=
 =?utf-8?B?UlZSS3A1b0ptYXl1SnUrYnFlaERXWEJCNVcwTXU5aWZXNk0ySHo2Y2NYcjBv?=
 =?utf-8?B?NERzODFCUFNoNi9ucUFhaFZ3eml6ZGo3MFZ0WkpSZVVkdzhuQXdFNWdUeVph?=
 =?utf-8?B?a0tYdWtYOE5RcDRneUtISVZoazFWRlNsM2hGcVBSMkVabm0rVmtmU2ROR3Fp?=
 =?utf-8?B?Tzg2WXpVU1NZTWxHa1c2Y2xTSjlKTTk2UDhGenFuOUNSeTI1MjhYcG1TZWN4?=
 =?utf-8?B?WklDYkFmL2lSWEFBYTh5ZVYyckJETEdEc1VnT2t6eERlZVloMzVJUldHeW5P?=
 =?utf-8?B?WkR1NG8vd0ZydkYzdmZkbTRTOTlyY2ZQN0lLcWp6czF3ZURhNjJBNmVSY05o?=
 =?utf-8?B?dWJxSTE3OEFjK29RaDJPTWxRc2FGd2ZBYmhhSFNUYk5pcFo5M2VvOTJxL3NW?=
 =?utf-8?B?bkRnVTZQUzA4UDhHUFRoL2ZlT0lLZUZnMjB3MGlpWWVibGxoME9RMGxzazJk?=
 =?utf-8?B?d24zUnlUbnVqTjZyVk15K0Z0Tnh0amZWVU42SzRWNHFGVjZNMUJUeVFIcS83?=
 =?utf-8?B?YUY2Q1NYUzUrMWxsNzR4cDFXaUhxVUg3TDg0VjcxaU02ZjFJdHE5SkI4ZHFF?=
 =?utf-8?B?R3NtY09jN1p3Yy9YYUlLL240RHd1M0dUSkdLNUhsL0ZuY3N0T0tqNGpzR1Rr?=
 =?utf-8?B?VTJQcmtIY21zN1hHSkFiajB0NGZuc2N6allBVnByelZkMW9wVmtjZzFVQlZX?=
 =?utf-8?B?ZisvU2ZhNzBKNHliaFhLMEpxN21PZWZRQ01nL0NCUzB4aUNWUE1UL1pLQ2Z5?=
 =?utf-8?B?RGcxa1Y1SUM0aHRvRXRtRXNaN2Ivc0ppZ1RNeXQvbUVNR0o4TWVaQzMrYW1z?=
 =?utf-8?B?OXl4UGMzNzRTRGxCU1lvOXlROHdBcUE3WmdQQ1BMbERiQ1FrVjd6aEpqZkl0?=
 =?utf-8?B?bTRhSTFmZjA4R2loYUdPeitBeHFNZW1uaENxYlg5WFNBVkNEdUk2a2pFN2tk?=
 =?utf-8?B?U0VpTXRZRzRlQ0RZUmZRcDRScmRTc2xhYmY1ZkY5L2xucHVseVRZVEU4c1dj?=
 =?utf-8?B?dzN1NjFDdFFTM1BuQlpuZzFJMVFkUjk2eGFpOXdoNGhoTkhUUWc4ZWRwNHVs?=
 =?utf-8?B?MFdwZGZRRTBxa3VFaElEQVlIU09DZVBPZCtHTWhmMXFCcTlHQ290dkkzZzZH?=
 =?utf-8?B?dFlaUW9iUjNCWEdnTTdudUN2dFFWTEtlWE5nSkpsVXd5bWNQZjFSU0dETDBs?=
 =?utf-8?B?cDdsKzNSelM3RzNhRXNuS3VIQkJBNkIweCtYdEF0dzJuUGQ1THJMdFloZEtB?=
 =?utf-8?B?b0VVYXZjUmEzVEE0bVVvRjNUZFUxZDRVeDlTWUlMY2tRWEdlaXY0RDFNVXkx?=
 =?utf-8?B?RUc0T2RZam9KLy91d1UxNGNoSHR2dHBRSVVZMFdCRHh0V3VFMzVyOUY5Y0Q1?=
 =?utf-8?Q?pLAOa+sRAbAH8Cwre+KR3NrcH+wW2v3RKp7aU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzhXT1lRUStUYytWV0wrNEk4ZDlFelZia05DWVc2LzM5dk16UDg0ZmM4VlZx?=
 =?utf-8?B?bCtOcm44NXRvZUNFNGdncFVwWGdMMmoyT1ErWWdGdlM2L2U2UjBFa0JIWkE5?=
 =?utf-8?B?OFlTOTk0VzJjTCtVbWlZL1dvOTFaa0YzWEJGWEMzcVhQMmREL3dBQmljdlpI?=
 =?utf-8?B?MmFLNGV4S2tmbitwM05Kb3phaU12V3lhcnpLRlNpMzJpZ1AyQnFLbjZzS0xw?=
 =?utf-8?B?WEEvYW0vcXRST2w4R3hXS0c1aVhqSktMZWxBdS9CYW9BWlMxdmFleGJJR0tr?=
 =?utf-8?B?Um8rVGtQY0dFNFV5Y2crL0U5V3NYVlpFL2lqTlZyWjNFWGRNVWZzdlhxdlNw?=
 =?utf-8?B?bEhBdGpXZXJuL0VSMVVybXV4TVEvWG5iZTJCVTdUbkYwK0R5bEhzTzh3QmtE?=
 =?utf-8?B?T29aZVFESFV0aWJiNkc0QnRnS1FCcjdJU1piL3Z2N2ZTcTY2Z0ZlZWlLeGo3?=
 =?utf-8?B?VzNiYWtpdTRBTlBIdnRzNVBsSVRMTWZBWWlJTUMwYjQzRFlzRjBSVHM0UjJP?=
 =?utf-8?B?NzZaWVhsOHJzUlFWbGFwd2FMbXgrTWRYK1JVQVNOVVdHVm1zV3VCMUdUN1Rp?=
 =?utf-8?B?cDYweE9lOEk0TGlBOHFkL0trODU5elJiZGk1Zk9vTlZjZlUwV3VJRi9OVVEx?=
 =?utf-8?B?QXZlM3ZNYTQwUzZoUW1VQVhBbER3Y2Q2alREdGI5K3VwVlFEK0huZU1mRG10?=
 =?utf-8?B?OUJjbExEeHZxQ1kyNWtPNGc0bzZJTlM2b1cyNlM0NncvaG9aalhqM3hvK1Uz?=
 =?utf-8?B?L0Y5dUR2MHFCSWcvOGt6K0ZrOUJaSk9La09GcC9RL3g3TElYSHFPQ2JCR3A3?=
 =?utf-8?B?a2JLc2hKZnozWkxjTDBTYWVNRUhFcExyYWVmWFNUZS9lSElQeklPTFRucjJV?=
 =?utf-8?B?eFBQNU5IMmVHTFl6akcvSHQzS0tIcDY1bG84WElrL01JTDlQSXVvSFVKVG9v?=
 =?utf-8?B?bEF0VTFOQnIwRk9NYU14eWhVNWlHLzc4RWJ5ZE9yM0JXWjRGKzltUFo0TUlv?=
 =?utf-8?B?V1hSaVBuYnpEYmE5cUhtYjRtK01ocnNpUWk3YWlZb0MzT2Q0R1IyRDNRZmxu?=
 =?utf-8?B?UGRkMXNFRWVoTnlxL0x4T01zY2VtMlFiS01WVmFUSmlwUXNJQ2FJM0JMd1ZF?=
 =?utf-8?B?QVEyQXF0M1gzdlhUR3l0N21xVjM0djBINEh1SXovL1lNRHdSMHRobFVVOS94?=
 =?utf-8?B?Tzd0NTNBTVE3Sm53RVArQXdLR2hNV2FNa3JmU2ZGVHZLZ1I3OHB6c0NYQUN3?=
 =?utf-8?B?NkVQSldqbzZlaUlFdWRsajI0UE5MUkhReHVxSkNKa2pha3BMbm9pV2pCWENw?=
 =?utf-8?B?bzdHcG5IcFZZK0RSS2o4OHB2VnJUZFpZVjkyZUxEbU4xTkMyWVpxNG00cnRR?=
 =?utf-8?B?dHJHOUJuNEtSYjlmdlJwTCtPYS8waUJpYXpSNjA1QUJSNEdFQmdLSzlBY3J2?=
 =?utf-8?B?ODR6N1lYZ3ZDTTdjNFp5S1pBc0Z3STlOWlBhbVo0dGwwWlRaQjNDQW1mRmdw?=
 =?utf-8?B?MUxlYytMYkFCbGpUamJodlhORHhVVFQ0T2pXTTZ0V25XY3QxQW5Mc2UxeHJv?=
 =?utf-8?B?YU1xVDBnRkRVaXdQb2Q3TFdtL0kycGIxb0xJREFZM20wNmZYUDJXcXJTTGFh?=
 =?utf-8?B?Z2hURDVZZUlRWDNiUWwwWGtNZDhMWWljbTAzYVA4ZHAvK0NUb05DK25idXg3?=
 =?utf-8?B?bFBLSlBiLzluQlY3ajhWZ0xIcEJ0TmxjQ05MZDhzUzY5NXNsMTZKVGdGUWVP?=
 =?utf-8?B?eGFKN21PMDQ0S2R1ZFFBZWk2NTN1QS82K0g0Z0tEaFNCbzJrdytnbWFtYTRo?=
 =?utf-8?B?Nm1leDh4WWM1MTh1anBsUi84U0hoSnZnVER2eTgvcXBCWXVXcGFmUVd4bjZO?=
 =?utf-8?B?U1BJdGNqT0FONzdqWkZuQmxvbzl1bytMU3U0RmlOS202R01SV2owVnVjQ0Vm?=
 =?utf-8?B?VjM4VzNiYWthcXVpZGRnZ0pDTHBRazZHM0RjaUJXUm1JYXpEVnliRmhQdm80?=
 =?utf-8?B?ZE83b2l0OXU3a0RKUFRNU1JjVzUraStsSEdJcXRuZzlFVEpMYVkzUWNSWkxz?=
 =?utf-8?B?S1U4OVQ3NllvZjRIOTFsY3lCaWU0RlJ2aUJBWjBtK2lEV1N1R1lwT1BSRTJR?=
 =?utf-8?Q?1HnlaBuJW/68qJ55p0npm9e4Q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BB4527E5F079740864536833E45A4FA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d66ad1-f0fb-42ec-e323-08dd03b4437e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 07:24:51.7616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6w4BXK/tfRZ4hUZarYhJKV71x9tX9k8/TlX0aNNE8U7snWqee8LOAl6Tl8uO9eOPYCw22d3L6EMor5gW9hcJ1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7969
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.235200-8.000000
X-TMASE-MatchedRID: 8+bhjh9TQnFm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYHB1
	e9+YlER9xxL5hQ2RIPjz6iVSaWDoXX45uBZmw209z5rIW0RbS5jXAvRa0tfJGh9W4auM/sn0QHf
	bKe/4YJLIBZO09e6D3Ew/TWR6NP2ih0HcQxbwW9/J5W6OZe5hhY7u1T4G/rnNmboNDm2x6o80oI
	W/6XAMMr0FV1Mm2m6DXdBX29i2SF70PzyQytOHfeG5dRZCgxC3Xeyujb7aXgS5IifwYL1+qzT2m
	cvSPuFMR+PrL64BEubKknPXtE9CiJqNmRvxO4tzYEPKB+ocm2nX9WK4/6fjuiJ9YcOoscFKV7bu
	bTl1nxLi8zVgXoAltj2Xsf5MVCB1t7DW3B48kkHdB/CxWTRRu25FeHtsUoHucVfFC4hykNuDjmT
	UyAtB1K/B0QKBxZ4skhRQC37SbZgfwV6sBPR0lg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.235200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	4C637617DDD15E452638FC3A287A96C22DA3D810D615B74A90841893DE48A1092000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSB0b3AgbWVkaWEgZGV2aWNlIGRy
aXZlciBmb3IgdGhlIE1lZGlhVGVrIElTUDdYIENBTVNZUy4NCj4gVGhlIGRyaXZlciBtYWludGFp
bnMgdGhlIGNhbWVyYSBzeXN0ZW0sIGluY2x1ZGluZyBzdWItZGV2aWNlIG1hbmFnZW1lbnQsDQo+
IERNQSBvcGVyYXRpb25zLCBhbmQgaW50ZWdyYXRpb24gd2l0aCB0aGUgVjRMMiBmcmFtZXdvcmsu
IEl0IGhhbmRsZXMNCj4gcmVxdWVzdCBzdHJlYW0gZGF0YSwgYnVmZmVyIG1hbmFnZW1lbnQsIGFu
ZCBNZWRpYVRlay1zcGVjaWZpYyBmZWF0dXJlcywNCj4gYW5kIHBpcGVsaW5lIG1hbmFnZW1lbnQs
IHN0cmVhbWluZyBjb250cm9sLCBlcnJvciBoYW5kbGluZyBtZWNoYW5pc20uDQo+IEFkZGl0aW9u
YWxseSwgaXQgYWdncmVnYXRlcyBzdWItZHJpdmVycyBmb3IgdGhlIGNhbWVyYSBpbnRlcmZhY2Us
IHJhdw0KPiBhbmQgeXV2IHBpcGVsaW5lcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lh
bmcgWWFuZyA8U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0K
DQo+ICtzdHJ1Y3QgbXRrX2NhbV9jdHggKm10a19jYW1fc3RhcnRfY3R4KHN0cnVjdCBtdGtfY2Ft
X2RldmljZSAqY2FtLA0KPiArCQkJCSAgICAgIHN0cnVjdCBtdGtfY2FtX3ZpZGVvX2RldmljZSAq
bm9kZSkNCj4gK3sNCj4gKwlzdHJ1Y3QgbXRrX2NhbV9jdHggKmN0eCA9IG5vZGUtPmN0eDsNCj4g
KwlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+ICsJc3RydWN0IHY0bDJfc3ViZGV2ICoqdGFyZ2V0X3Nk
Ow0KPiArCWludCByZXQsIGksIGlzX2ZpcnN0X2N0eDsNCj4gKwlzdHJ1Y3QgbWVkaWFfZW50aXR5
ICplbnRpdHkgPSAmbm9kZS0+dmRldi5lbnRpdHk7DQo+ICsJc3RydWN0IG1lZGlhX2dyYXBoIGdy
YXBoOw0KPiArDQo+ICsJZGV2X2luZm8oY2FtLT5kZXYsICIlczpjdHgoJWQpOiB0cmlnZ2VyZWQg
YnkgJXNcbiIsDQo+ICsJCSBfX2Z1bmNfXywgY3R4LT5zdHJlYW1faWQsIGVudGl0eS0+bmFtZSk7
DQo+ICsNCj4gKwlhdG9taWNfc2V0KCZjdHgtPmVucXVldWVkX2ZyYW1lX3NlcV9ubywgMCk7DQo+
ICsJY3R4LT5jb21wb3NlZF9mcmFtZV9zZXFfbm8gPSAwOw0KPiArCWN0eC0+ZGVxdWV1ZWRfZnJh
bWVfc2VxX25vID0gMDsNCj4gKwlhdG9taWNfc2V0KCZjdHgtPnJ1bm5pbmdfc19kYXRhX2NudCwg
MCk7DQo+ICsJaW5pdF9jb21wbGV0aW9uKCZjdHgtPnNlc3Npb25fY29tcGxldGUpOw0KPiArCWlu
aXRfY29tcGxldGlvbigmY3R4LT5tMm1fY29tcGxldGUpOw0KPiArDQo+ICsJaXNfZmlyc3RfY3R4
ID0gIWNhbS0+Y29tcG9zZXJfY250Ow0KPiArCWlmIChpc19maXJzdF9jdHgpIHsNCj4gKwkJc3Bp
bl9sb2NrKCZjYW0tPmRtYV9wcm9jZXNzaW5nX2xvY2spOw0KPiArCQljYW0tPmRtYV9wcm9jZXNz
aW5nX2NvdW50ID0gMDsNCj4gKwkJc3Bpbl91bmxvY2soJmNhbS0+ZG1hX3Byb2Nlc3NpbmdfbG9j
ayk7DQo+ICsNCj4gKwkJc3Bpbl9sb2NrKCZjYW0tPnJ1bm5pbmdfam9iX2xvY2spOw0KPiArCQlj
YW0tPnJ1bm5pbmdfam9iX2NvdW50ID0gMDsNCj4gKwkJc3Bpbl91bmxvY2soJmNhbS0+cnVubmlu
Z19qb2JfbG9jayk7DQo+ICsNCj4gKwkJZGV2X2luZm8oY2FtLT5kZXYsICIlczogcG93ZXIgb24g
Y2Ftc3lzXG4iLCBfX2Z1bmNfXyk7DQo+ICsJCXJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9n
ZXQoY2FtLT5kZXYpOw0KPiArCQlpZiAocmV0IDwgMCkgew0KPiArCQkJZGV2X2luZm8oY2FtLT5k
ZXYsICIlczogcG93ZXIgb24gY2Ftc3lzIGZhaWxlZFxuIiwNCj4gKwkJCQkgX19mdW5jX18pOw0K
PiArCQkJcmV0dXJuIE5VTEw7DQo+ICsJCX0NCj4gKw0KPiArCQlyZXQgPSBpc3BfY29tcG9zZXJf
aW5pdChjYW0pOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJZ290byBmYWlsX3NodXRkb3duOw0KPiAr
DQo+ICsJCS8qIFRvIGNhdGNoIGNhbXN5cyBleGNlcHRpb24gYW5kIHRyaWdnZXIgZHVtcCAqLw0K
PiArCQlpZiAoY2FtLT5kZWJ1Z19mcykNCj4gKwkJCWNhbS0+ZGVidWdfZnMtPm9wcy0+ZXhwX3Jl
aW5pdChjYW0tPmRlYnVnX2ZzKTsNCj4gKwl9DQo+ICsJY2FtLT5jb21wb3Nlcl9jbnQrKzsNCj4g
KwlpZiAoaXNfeXV2X25vZGUobm9kZS0+ZGVzYy5pZCkpDQo+ICsJCWRldiA9IGNhbS0+cmF3Lnl1
dnNbMF07DQo+ICsJZWxzZQ0KPiArCQlkZXYgPSBjYW0tPnJhdy5kZXZzWzBdOw0KPiArDQo+ICsJ
cmV0ID0gbXRrX2NhbV93b3JraW5nX2J1Zl9wb29sX2luaXQoY3R4LCBkZXYpOw0KPiArCWlmIChy
ZXQpIHsNCj4gKwkJZGV2X2luZm8oY2FtLT5kZXYsICJmYWlsZWQgdG8gcmVzZXJ2ZSBETUEgbWVt
b3J5OiVkXG4iLCByZXQpOw0KPiArCQlnb3RvIGZhaWxfdW5pbml0X2NvbXBvc2VyOw0KPiArCX0N
Cj4gKw0KPiArCWt0aHJlYWRfaW5pdF93b3JrZXIoJmN0eC0+c2Vuc29yX3dvcmtlcik7DQo+ICsJ
Y3R4LT5zZW5zb3Jfd29ya2VyX3Rhc2sgPSBrdGhyZWFkX3J1bihrdGhyZWFkX3dvcmtlcl9mbiwN
Cj4gKwkJCQkJICAgICAgJmN0eC0+c2Vuc29yX3dvcmtlciwNCj4gKwkJCQkJICAgICAgInNlbnNv
cl93b3JrZXItJWQiLA0KPiArCQkJCQkgICAgICBjdHgtPnN0cmVhbV9pZCk7DQo+ICsJaWYgKElT
X0VSUihjdHgtPnNlbnNvcl93b3JrZXJfdGFzaykpIHsNCj4gKwkJZGV2X2luZm8oY2FtLT5kZXYs
DQo+ICsJCQkgIiVzOmN0eCglZCk6IGNvdWxkIG5vdCBjcmVhdGUgc2Vuc29yX3dvcmtlcl90YXNr
XG4iLA0KPiArCQkJIF9fZnVuY19fLCBjdHgtPnN0cmVhbV9pZCk7DQo+ICsJCWdvdG8gZmFpbF9y
ZWxlYXNlX2J1ZmZlcl9wb29sOw0KPiArCX0NCj4gKw0KPiArCXNjaGVkX3NldF9maWZvKGN0eC0+
c2Vuc29yX3dvcmtlcl90YXNrKTsNCj4gKw0KPiArCWN0eC0+Y29tcG9zZXJfd3EgPSBhbGxvY19v
cmRlcmVkX3dvcmtxdWV1ZShkZXZfbmFtZShjYW0tPmRldiksDQo+ICsJCQkJCQkgICBXUV9ISUdI
UFJJIHwgV1FfRlJFRVpBQkxFKTsNCj4gKwlpZiAoIWN0eC0+Y29tcG9zZXJfd3EpIHsNCj4gKwkJ
ZGV2X2luZm8oY2FtLT5kZXYsICJmYWlsZWQgdG8gYWxsb2MgY29tcG9zZXIgd29ya3F1ZXVlXG4i
KTsNCj4gKwkJZ290byBmYWlsX3VuaW5pdF9zZW5zb3Jfd29ya2VyX3Rhc2s7DQo+ICsJfQ0KPiAr
DQo+ICsJY3R4LT5mcmFtZV9kb25lX3dxID0gYWxsb2Nfb3JkZXJlZF93b3JrcXVldWUoZGV2X25h
bWUoY2FtLT5kZXYpLA0KPiArCQkJCQkJICAgICBXUV9ISUdIUFJJIHwgV1FfRlJFRVpBQkxFKTsN
Cj4gKwlpZiAoIWN0eC0+ZnJhbWVfZG9uZV93cSkgew0KPiArCQlkZXZfaW5mbyhjYW0tPmRldiwg
ImZhaWxlZCB0byBhbGxvYyBmcmFtZV9kb25lIHdvcmtxdWV1ZVxuIik7DQo+ICsJCWdvdG8gZmFp
bF91bmluaXRfY29tcG9zZXJfd3E7DQo+ICsJfQ0KPiArDQo+ICsJcmV0ID0gbWVkaWFfcGlwZWxp
bmVfc3RhcnQoJmVudGl0eS0+cGFkc1swXSwgJmN0eC0+cGlwZWxpbmUpOw0KPiArCWlmIChyZXQp
IHsNCj4gKwkJZGV2X3dhcm4oY2FtLT5kZXYsDQo+ICsJCQkgIiVzOnBpcGUoJWQpOmZhaWxlZCBp
biBtZWRpYV9waXBlbGluZV9zdGFydDolZFxuIiwNCj4gKwkJCSBfX2Z1bmNfXywgbm9kZS0+dWlk
LnBpcGVfaWQsIHJldCk7DQo+ICsJCWdvdG8gZmFpbF91bmluaXRfZnJhbWVfZG9uZV93cTsNCj4g
Kwl9DQo+ICsNCj4gKwkvKiB0cmF2ZXJzZSB0byB1cGRhdGUgdXNlZCBzdWJkZXZzICYgbnVtYmVy
IG9mIG5vZGVzICovDQo+ICsJaSA9IDA7DQo+ICsJcmV0ID0gbWVkaWFfZ3JhcGhfd2Fsa19pbml0
KCZncmFwaCwgZW50aXR5LT5ncmFwaF9vYmoubWRldik7DQo+ICsJaWYgKHJldCkNCj4gKwkJZ290
byBmYWlsX3N0b3BfcGlwZWxpbmU7DQo+ICsNCj4gKwltZWRpYV9ncmFwaF93YWxrX3N0YXJ0KCZn
cmFwaCwgZW50aXR5KTsNCj4gKwl3aGlsZSAoKGVudGl0eSA9IG1lZGlhX2dyYXBoX3dhbGtfbmV4
dCgmZ3JhcGgpKSkgew0KPiArCQlkZXZfZGJnKGNhbS0+ZGV2LCAibGlua2VkIGVudGl0eSAlc1xu
IiwgZW50aXR5LT5uYW1lKTsNCj4gKw0KPiArCQl0YXJnZXRfc2QgPSBOVUxMOw0KPiArDQo+ICsJ
CXN3aXRjaCAoZW50aXR5LT5mdW5jdGlvbikgew0KPiArCQljYXNlIE1FRElBX0VOVF9GX0lPX1Y0
TDoNCj4gKwkJCWN0eC0+ZW5hYmxlZF9ub2RlX2NudCsrOw0KPiArCQkJYnJlYWs7DQo+ICsJCWNh
c2UgTUVESUFfRU5UX0ZfUFJPQ19WSURFT19QSVhFTF9GT1JNQVRURVI6IC8qIHBpcGVsaW5lICov
DQo+ICsJCQlpZiAoaSA+PSBNQVhfUElQRVNfUEVSX1NUUkVBTSkNCj4gKwkJCQlnb3RvIGZhaWxf
c3RvcF9waXBlbGluZTsNCj4gKwkJCXRhcmdldF9zZCA9IGN0eC0+cGlwZV9zdWJkZXZzICsgaTsN
Cj4gKwkJCWkrKzsNCj4gKwkJCWJyZWFrOw0KPiArCQljYXNlIE1FRElBX0VOVF9GX1ZJRF9JRl9C
UklER0U6IC8qIHNlbmluZiAqLw0KPiArCQkJdGFyZ2V0X3NkID0gJmN0eC0+c2VuaW5mOw0KPiAr
CQkJYnJlYWs7DQo+ICsJCWNhc2UgTUVESUFfRU5UX0ZfQ0FNX1NFTlNPUjoNCg0KVGhpcyBkb2Vz
IG5vdCBleGlzdCwgc28gZHJvcCBjdHgtPnNlbnNvci4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKwkJ
CXRhcmdldF9zZCA9ICZjdHgtPnNlbnNvcjsNCj4gKwkJCWJyZWFrOw0KPiArCQlkZWZhdWx0Og0K
PiArCQkJYnJlYWs7DQo+ICsJCX0NCj4gKw0KPiArCQlpZiAoIXRhcmdldF9zZCkNCj4gKwkJCWNv
bnRpbnVlOw0KPiArDQo+ICsJCWlmICgqdGFyZ2V0X3NkKSB7DQo+ICsJCQlkZXZfaW5mbyhjYW0t
PmRldiwgImR1cGxpY2F0ZWQgc3ViZGV2cyEhIVxuIik7DQo+ICsJCQlnb3RvIGZhaWxfdHJhdmVy
c2Vfc3ViZGV2Ow0KPiArCQl9DQo+ICsNCj4gKwkJaWYgKGlzX21lZGlhX2VudGl0eV92NGwyX3N1
YmRldihlbnRpdHkpKQ0KPiArCQkJKnRhcmdldF9zZCA9IG1lZGlhX2VudGl0eV90b192NGwyX3N1
YmRldihlbnRpdHkpOw0KPiArCX0NCj4gKwltZWRpYV9ncmFwaF93YWxrX2NsZWFudXAoJmdyYXBo
KTsNCj4gKw0KPiArCXJldHVybiBjdHg7DQo+ICsNCj4gK2ZhaWxfdHJhdmVyc2Vfc3ViZGV2Og0K
PiArCW1lZGlhX2dyYXBoX3dhbGtfY2xlYW51cCgmZ3JhcGgpOw0KPiArZmFpbF9zdG9wX3BpcGVs
aW5lOg0KPiArCW1lZGlhX3BpcGVsaW5lX3N0b3AoJmVudGl0eS0+cGFkc1swXSk7DQo+ICtmYWls
X3VuaW5pdF9mcmFtZV9kb25lX3dxOg0KPiArCWRlc3Ryb3lfd29ya3F1ZXVlKGN0eC0+ZnJhbWVf
ZG9uZV93cSk7DQo+ICtmYWlsX3VuaW5pdF9jb21wb3Nlcl93cToNCj4gKwlkZXN0cm95X3dvcmtx
dWV1ZShjdHgtPmNvbXBvc2VyX3dxKTsNCj4gK2ZhaWxfdW5pbml0X3NlbnNvcl93b3JrZXJfdGFz
azoNCj4gKwlrdGhyZWFkX3N0b3AoY3R4LT5zZW5zb3Jfd29ya2VyX3Rhc2spOw0KPiArCWN0eC0+
c2Vuc29yX3dvcmtlcl90YXNrID0gTlVMTDsNCj4gK2ZhaWxfcmVsZWFzZV9idWZmZXJfcG9vbDoN
Cj4gKwltdGtfY2FtX3dvcmtpbmdfYnVmX3Bvb2xfcmVsZWFzZShjdHgsIGRldik7DQo+ICtmYWls
X3VuaW5pdF9jb21wb3NlcjoNCj4gKwlpc3BfY29tcG9zZXJfdW5pbml0KGNhbSk7DQo+ICsJY2Ft
LT5jb21wb3Nlcl9jbnQtLTsNCj4gK2ZhaWxfc2h1dGRvd246DQo+ICsJaWYgKGlzX2ZpcnN0X2N0
eCkNCj4gKwkJcnByb2Nfc2h1dGRvd24oY2FtLT5ycHJvY19oYW5kbGUpOw0KPiArDQo+ICsJcmV0
dXJuIE5VTEw7DQo+ICt9DQo+ICsNCg0K

