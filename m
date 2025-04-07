Return-Path: <linux-media+bounces-29458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E96AA7D56D
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF22E1893E18
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 07:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2C122A4EA;
	Mon,  7 Apr 2025 07:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ACO8WkqR";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="BslQToD1"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DA021D3D1;
	Mon,  7 Apr 2025 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010155; cv=fail; b=Nc91ZqMvJ72eH3RdrqyvoOuhzH81C3k552WVGtDyoiMtuKtLbZ+dDsZ+n+nlUrMegpXdOmnY1A2sNW0i6yOC6oX3i8ujB0WH7owJNzTZa4A94KDtsEBOolAE4Ww8Npa5weIQ6CMFGdD0cBnzXeOszHypsPyzdfSAv21WyC54afc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010155; c=relaxed/simple;
	bh=Jn5Tko/YVshVNX4BSXGi46p8h2J+DuqgyW4HWkQes5c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tnu6aNiFIDddqHzuKqkGxrqEqU7/ecgliP12HjWGsuG784O6rkFgzDLHsmidSbCj0WocVljHj5r3l0E1JT0JCfjIZM4gvJ1rTpXdSxWaRdf42fTMDWyBhEiAxwPid+RjEms0QO8O+oHRLaKUfVrGHsGO8dEDS+vWyo2NJuDSyXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ACO8WkqR; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=BslQToD1; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 20109596138011f0aae1fd9735fae912-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Jn5Tko/YVshVNX4BSXGi46p8h2J+DuqgyW4HWkQes5c=;
	b=ACO8WkqR6HW7YbcpNhSouk74HonoJbKsz83q+zMKmX/3zYU7KUlgfv7IkV6TKzaOVgl6heU9soCiSTVidTZTDUdeuHKyWx2Ez1C3KfzD+NrF5Tkra4aOOd6rcvBVIvkmMzcG2c5abFeFXgOfdBGcwzuPJ0f6xOAoJOE8l/Qi8Ac=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e2da98c2-f5cf-4035-a90a-1ef80e8667e1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:123343c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 20109596138011f0aae1fd9735fae912-20250407
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1491259160; Mon, 07 Apr 2025 15:15:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 15:15:45 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 15:15:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKnfPNM7IM9G8O4wDNoWbafQ6hyi58/OtHLDPGpd8S3GXX7svqDCVnHyhHO320GClcm2llX/5hgImer9mok269f0qNNwRYLnFM50pJMPaq2O68ErDCddpSFF03MTB95MzkJJXXkTcWy5lH+rILP0XNiSo11UDDDZFBdJM7iQiH1tGb9seeayXJSH/B28jD+YcMmraTm2+6eePP+Z0apeuvBJC9vHzkJEUyonBm2dQNI1gaFub/LTpO+LnpywWhjHxl9hwSUnBuFdSjaGyp9GZOeaRd40GpuoUWGmAohOnqOBodDyo+oUE0BZ6yeBNZTzbJIIVYBZDcjo3yGN09327Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jn5Tko/YVshVNX4BSXGi46p8h2J+DuqgyW4HWkQes5c=;
 b=U84p/VWj2KNLj9vDSvhpE7k82c8nSjfqfz/gz8PV60PA0PbZvLiKwYI3jzDDJ9jQ6ykjqOB2+ukf6yKdMm9/ksrU5drUCFmTzy2T4z2cCjhK6JUfv4IFjWuxb2eLCtryj12f+cMFlva1eyPopu2qUk7DQa454G/pXnlw5wluTo2Jx17dHwgepzoqDCww1FlPVy0Au8oXOvKVWcML/iEwHAvHFnk0hPFubwl7wgsQl3FsHQ+G9w5I+zUZh4IQ0ZJo017gt/h4Y3NMNZk7qIl14DRTt0i8WJ4OjfCrn+nsuVuDMgb1B22yhsz4m+g4ofnb0VecvAPI5PmuLdvwa1SSBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jn5Tko/YVshVNX4BSXGi46p8h2J+DuqgyW4HWkQes5c=;
 b=BslQToD1dkGHpLJy0kEL4hQZDUjyyVWn8v4HNdgPdHvBN6U4G5+1SVs/FqFPOSdp8DgQBGPyr0+W479x+1r30NRMSyvDtQMwZ/qCge2e9W64NgznLwN6w2mFcr5uMauzRNdfvstO1t47gPbs1la/L+087GNO1IV5XRufBlw8/mI=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SI2PR03MB6859.apcprd03.prod.outlook.com (2603:1096:4:1f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 07:15:42 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 07:15:42 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"tzungbi@chromium.org" <tzungbi@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>,
	=?utf-8?B?QmluIExpdSAo5YiY5b2sKQ==?= <bin.liu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>
Subject: Re: [V1,03/12] media: mediatek: jpeg: add jpeg compatible
Thread-Topic: [V1,03/12] media: mediatek: jpeg: add jpeg compatible
Thread-Index: AQHbYptcxMhh6OJ4ZkuK9aFBdLnsfLMPw+6AgIiQmIA=
Date: Mon, 7 Apr 2025 07:15:42 +0000
Message-ID: <3671876175ad1f627caa554b5fbe0a04239adc31.camel@mediatek.com>
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
	 <20250109133513.20151-4-kyrie.wu@mediatek.com>
	 <cc1dff25-2de2-40fe-bf3d-cc9e8f735eeb@collabora.com>
In-Reply-To: <cc1dff25-2de2-40fe-bf3d-cc9e8f735eeb@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SI2PR03MB6859:EE_
x-ms-office365-filtering-correlation-id: 246d4a37-2389-4833-24f1-08dd75a40210
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N2JPVG1JN3hXRTl0SmlQcW90NnpMWGQwYjlHMWpuWWg5Mzd5bnpRT2Z6MFBz?=
 =?utf-8?B?Z3RaYmdVamR6dllnbS9yQ3h0QUlodHc1OHEzbllsaEI0ZE1JbS95NWM1MC9N?=
 =?utf-8?B?OXZTN2VBazBEWjRHK2M1dXhkMy9XTXc5clpVVWVHNlBnSEhpQTFQUElOay9x?=
 =?utf-8?B?NXlNa1RVc3FzVjd0MUVMK3VPdUh2dHZsN1hueENHRkhaWHdIeVBCYXMrSjhv?=
 =?utf-8?B?ZUVRVUwzU1dIZERjdThZNWhQaDZ4a0RmamlIdGYwZkl5L2h6NjJCUm9nQUJ3?=
 =?utf-8?B?K3NUUG5aaUhWTXFkU3RXMGFjems5Q0ZpT2VkUFpFcW9XT3RtazVGMWNCRHBk?=
 =?utf-8?B?VEJPbHRpVTY2UlgyS2Y5cXdVemdYK0dUdTBSMXJCRkhaSEduNCtxMWU4L0kv?=
 =?utf-8?B?dXBNWStLVkM4NGhscTlXS1k3MFVkR2pOempwZHNYYUNIUi82bUVHRUcreGFm?=
 =?utf-8?B?MDhGT082SmNMaHByb25icmtLSEZuMFF1VG84OHh6bnlxRTdLL0UrRWF4KzNP?=
 =?utf-8?B?WXlycUxvcmdGNER1U1JHSXI5QkhUV0NPQm8xNWdHdXJNKzhucENPZkF4L0FH?=
 =?utf-8?B?NE9OZnBjcm5jaS9ZMitDd25oM0NndVdsL2tvN1RwRHVsZW5rQmdvdS81NjVQ?=
 =?utf-8?B?WUV4Q0xLMzJHejFVUjVVKytlZGs2aXRBc2Mxbi90RHVOellkOG9hSlc2V0Ja?=
 =?utf-8?B?cGlaYXJtdlhBNEEvRGR2UWhYS04xUUlxSkdsdXVCRWNub3ZyNlI1YmlpZFFE?=
 =?utf-8?B?cWZsM3B4aG5iRnpPSTJOTUlnZHAybk8xaFlaTTFNUEt3RkVrRmoxT2hzNXE4?=
 =?utf-8?B?VjBoL1MvQjYvM21HRHpsNGZJSCtkRkJvY2ZzVVZyMGNjWnlPZ0l6NmJkOTlR?=
 =?utf-8?B?OXQwMVJyQytzWW42WWJ6OEV1dnA5Z2JJTGRQSFlEdFkxOFlHK003SE1yUUt4?=
 =?utf-8?B?aWF3WjNiN1hsN1BvN1paMVdRai9SaWRDWTNESGpUbm1xb3BQUStncGlSZDFJ?=
 =?utf-8?B?TG80U0lwdFhMSWhMQXhUZ2h3L09lczlCZ2o1Z1FpVEZIckoraUJSOXBHRUhI?=
 =?utf-8?B?SUhLNVhSanlMd3pDZWdxdWJHK3A2UXNXZ1JXU01tYzZWRWNiaU15bkUyRUpy?=
 =?utf-8?B?YUtxbUtRUVpwb29BVnlLV2dWcmtPVjJXM2R0djNrK29JN3RDNTRnZXdUUXdr?=
 =?utf-8?B?VDhvOTB1ODZNOHZQZlFCV1d5UjNqZ2VnMFY0QVNVeHMvMGl6QWw1QVVpUUVQ?=
 =?utf-8?B?YmJqR2wzdnBPVDN3K2w0QnZkaVVBZkdKNmFPYWdxTS8welgwZTI1MWhZWmdn?=
 =?utf-8?B?T0Qxd2hOVVo5YVFxRnRWdGtISE5yTGlUYUFJSDJCTllxYmhDN29TUm1ySGox?=
 =?utf-8?B?VVVaRmVhbU1pRWRST0F4bSswZGFEcHJ1Z1B0TThOUElxMmJEZ0dPVWc0K3hG?=
 =?utf-8?B?MG5sMkxsTnhtQk1YRCtGaTBENXh3TEZyL3VBSzM5LzZ4cjRuZStqeVFXMUxF?=
 =?utf-8?B?TWJGbWxjVFdxS1AvVmdOUXlycm9OK2RqK3lzTVh6WWM3dEtVc3FwNUh2WWF5?=
 =?utf-8?B?cWFJVUJXRzFPWmdKQXV5ZXRxZnpYM3ljcGNtMDJaTmQxU2hWNmZ5cXU1d3hG?=
 =?utf-8?B?QXE5TkJManBMMHRXRmt4b2V4dG5ZS1k4Vjk3VXlpSys2eUkwSDBrQkhrR1Rk?=
 =?utf-8?B?eXIzK0x4Vy9NK2R5aEFNU0s4MzdmclYxelN4TE5ndFBMV00wVUhVNTN4SUxV?=
 =?utf-8?B?N0ZpZTNHcHJNVG5EcnAvQUFUWWdSQklIZkx6WDcwMTdTeVJlMEhsYnZHWXVG?=
 =?utf-8?B?WnRqazliQUJrZTExR0dIcGlZNmRxcjlBeXE1UVljcTB4OVN6OHR1VVdjSXlt?=
 =?utf-8?B?S01lajR1VWVwTWJ6cnVoYnV5UDZlYXN1TlhnbWpOWWQxdFFlRFBRei94eEtm?=
 =?utf-8?B?ajRMUk90b293VFFTVXRuOTFHR2JmVXRxY2g5TGRFeGdPWU9VclZHSHRwdGlV?=
 =?utf-8?B?aHdiZW5JS1hBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dm5rS1JDYWVMZktoMkRxaFoyTm5jNDMvUWM0bjBWMk0yS1kwSG9oOC9GNysx?=
 =?utf-8?B?eHFGQWMwMVFxWnRkeUxvcUdWQlJmUlZpY2YyYm9qNWdRaFRLRit0RzBkekRS?=
 =?utf-8?B?aHVTY1EvRnFFUitDemRPRm9zakc0KzRlTzhHL2NsQms4WkJXdElpaVNHTk1t?=
 =?utf-8?B?NE1UL3FUTHJJaklCS0R5ODZBN3FFa1FSSHFtaThPZVE3cTdRa1pTaGlzOWtY?=
 =?utf-8?B?VFB1a1JSK044eFVKS1l6b0V3SEpxcDk3ZTZlTENGM2lHSTRxV3kyL0RzNjJp?=
 =?utf-8?B?Q1VCR01abVc4Nm5qbm9wQThybXZtUlphWG40eG5JL0k1eWliR3FndDJMVE5G?=
 =?utf-8?B?a0VSOUxQTHZLRzdPeDYvRXVwamxSRzdTZ3ZaY2hET0xTdVVqTzZVZzJVUjRu?=
 =?utf-8?B?TERaMzhDKzRTMWx1ZlFLZS9mVkRESTVVNmhXbTJabmtoYjNwbkhlbUxDNXJY?=
 =?utf-8?B?Tlo0eS9NQ0RwdGxhTE82YmRaZWloUzRSODZFbUUzbStmNlUrV1B6UjROOG1Y?=
 =?utf-8?B?UjF0eEJpL0xkR3BJU2M0N2JRTUM1dFAzc3cvTVpvazFhTUtxZWV2ZFhuTlhX?=
 =?utf-8?B?YlNXY3dzMWYxUkEvUzF1NE16cGR2M2tnamxMODkxOHE1VENqdEQrMzRUTG4r?=
 =?utf-8?B?cDZETlpBeXFGazB4WFU1aysrNG5hKzY0QWRrZFZodmxGa1hBeDRnYTljS1Fy?=
 =?utf-8?B?N1RxR1AvKzBWMzkrbURGV1lBWEFmc3pwTkgyYmZhSzNWNm8zVi92ZjR1UzVV?=
 =?utf-8?B?OVdSSE54cTdMajMwdFlSQVUyMk5Bc3JjbFhoQ3ZPd2FZTlVNd3REN09WUzdR?=
 =?utf-8?B?a1JrMTNhVVRTak0rdWdhQ1ZTV3Z3VUwxSGJydjZTR0gwM2svN0FJdG9RbW1h?=
 =?utf-8?B?NGFMUkU5K1FpVlQxQVZCajBma1UveFZyUjJKeVZSUzFZSnI5UzFFT3V2VUZU?=
 =?utf-8?B?VVRxVjBjUEo1MmNxc1RTRTJmQmpvNHdSMVdaMC80VHE3ZlkvWXlqUEYwVmtS?=
 =?utf-8?B?ejZCc0JOcFV1SzlIU01jY0lLUTAxd1IzcGZyQ0FGQU5HU1k5aVkzZGp4ZlJn?=
 =?utf-8?B?Y3gwRWk3ank3Rlcvc2VJQVVkRVFNOXZ1cS9QYkE0TS9CazVTQjUzMHhXR1p5?=
 =?utf-8?B?aEhtRW5FVlVRUSttNGtOdkh3S2dyRkF1b0pFaTd2anpES2tDY2FzTEdNUjZn?=
 =?utf-8?B?S0RSSkNteWY5RGhESXorK0dUaWVsZklNRWVwd3c1RUlzR1JobHJ1akpOT09U?=
 =?utf-8?B?SFEvR2hNR1FlYlJFbDFUZnNrRXQrTmtYT0lsZGlkbWhpLzhmZnBYajFGYnF0?=
 =?utf-8?B?eGVnT0JWaFRLQi93OG5YV1I5Wk1UdFpuQ0NKbGJNZmF2ai9uNlh3c29Kcnc5?=
 =?utf-8?B?Q1Y0NWdkR2oxZzJ5RFd3eVN6N1JzL3A2NHpwTkFuQ0FiREljaVYvcGsybHFu?=
 =?utf-8?B?Tmx2RHhwN0txTE9YVU5GMVdoVGtHYXVLOUFzZmlHSFRzYlFMVkNTdFRvMUQw?=
 =?utf-8?B?V29pb1hjWlhPbktPaUNmeXcwa0QwOVpTbzEzWGluN213S081N0JuZERhU28x?=
 =?utf-8?B?QVphSkIxMTVLZkxEZ29MNmRCak4xRnd0TCsvb0NyR3ZMeGlGd1Zqd0RpTFMy?=
 =?utf-8?B?bTNHTnBwMFhNU0RSUTdjRlBXcmVoVXhLR1BxQzhZU1RMUjYyMG9QNFRIOGpF?=
 =?utf-8?B?cDZyKytDSXo4eHVFZ1dIcDVqWFFRMm9LdXJWZWNrcU4vMnU4WGJRNEtFaFhK?=
 =?utf-8?B?NWUwK0Q0MVE1M0d6UG1rdGZrNVVLRHJTT052RnVKTjRwMWtVQVFhckt4T1Np?=
 =?utf-8?B?bFBXOWJ2NnV3TnpqTTJxMW1DbE5xYlRwWkZXUTRNQjZ5L3hWOTRmK3JpTU5F?=
 =?utf-8?B?aml6eUNTY05NOGg3K2J0SU5IK3N4dk05LzhlTUxNK0hadWRaa0h6dXV4M1N3?=
 =?utf-8?B?S0l6VnhQRjZnOE1mQ04rZlJaRUIrRnJNdVNoOU12cHR0WHpyZnhyVXluOW5U?=
 =?utf-8?B?d0lTWGJCMjhTYnVYdUhGcEIzTDF6YThGVXRhVG1iVStuUkgxeXJnNS9nT1JV?=
 =?utf-8?B?a2pHUmEyb21jcUxuUEd4NEhZWVl1U3dFQ0RxT2orZ2VTdFhlaFBadkh5Um5O?=
 =?utf-8?Q?JjCJyOWGQKP4rwXhUrzCVA8q8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92197471D28ECC47889EAB4A4279C82F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246d4a37-2389-4833-24f1-08dd75a40210
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 07:15:42.6096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3m1ESP2MNKoowMgqxZSN+sgN7EdM79j+t12LgL7t8nxdmyPxfsK10b4ZbsXSSEElY7PeOXW0SqaVeU9POUypkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6859

T24gRnJpLCAyMDI1LTAxLTEwIGF0IDEwOjQ2ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAwOS8wMS8yNSAxNDozNSwga3lyaWUud3Ug
aGEgc2NyaXR0bzoNCj4gPiBBZGQganBlZyBkZWMgYW5kIGVuYyBjb21wYXRpYmxlIGZvciBtdDgx
OTYNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBreXJpZS53dSA8a3lyaWUud3VAbWVkaWF0ZWsu
Y29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVn
L210a19qcGVnX2NvcmUuYyAgIHwgOA0KPiA+ICsrKysrKysrDQo+ID4gICBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZGVjX2h3LmMgfCAzICsrKw0KPiA+ICAg
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2VuY19ody5jIHwg
MyArKysNCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pw
ZWdfY29yZS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRr
X2pwZWdfY29yZS5jDQo+ID4gaW5kZXggOTUxN2ViZWQwNzAxLi5jM2NjYzUyNWQ5ZmQgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVn
X2NvcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9t
dGtfanBlZ19jb3JlLmMNCj4gPiBAQCAtMTk5Niw2ICsxOTk2LDE0IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkDQo+ID4gbXRrX2pwZWdfbWF0Y2hbXSA9IHsNCj4gPiAgICAgICAg
ICAgICAgIC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4OC1qcGdkZWMiLA0KPiA+ICAgICAg
ICAgICAgICAgLmRhdGEgPSAmbXRrODE4OF9qcGVnZGVjX2RydmRhdGEsDQo+ID4gICAgICAgfSwN
Cj4gPiArICAgICB7DQo+ID4gKyAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDgxOTYtanBnZW5jIiwNCj4gPiArICAgICAgICAgICAgIC5kYXRhID0gJm10azgxOTVfanBlZ2Vu
Y19kcnZkYXRhLA0KPiA+ICsgICAgIH0sDQo+ID4gKyAgICAgew0KPiA+ICsgICAgICAgICAgICAg
LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk2LWpwZ2RlYyIsDQo+ID4gKyAgICAgICAgICAg
ICAuZGF0YSA9ICZtdGs4MTk1X2pwZWdkZWNfZHJ2ZGF0YSwNCj4gDQo+IFlvdSdyZSBhZGRpbmcg
dGhpcyB3aXRoIE1UODE5NSBwbGF0Zm9ybSBkYXRhLCBhbmQgdGhlbiB5b3UncmUNCj4gY2hhbmdp
bmcgaXQgdG8NCj4gTVQ4MTk2IHNwZWNpZmljIHBsYXRmb3JtIGRhdGEuDQo+IA0KPiBKdXN0IHB1
dCB0aGlzIGNvbW1pdCBhdCB0aGUgZW5kIG9mIHRoZSBzZXJpZXMsIGF0IHRoaXMgcG9pbnQuDQo+
IA0KPiBSZWdhcmRzLA0KPiBBbmdlbG8NCg0KRGVhciBBbmdlbG8sDQoNClRoYW5rcyBmb3IgeW91
ciBhZHZpY2VzLCBJIHdpbGwgYWRkIHNtbXUgaW5mby4gaW50byB0aGUgcGxhdGZvcm0gZGF0YQ0K
YW5kIHB1c2ggaXQgdG8gdGhlIGVuZC4NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KS3lyaWUuDQoN
Cj4gDQo+ID4gKyAgICAgfSwNCj4gPiAgICAgICB7fSwNCj4gPiAgIH07DQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19k
ZWNfaHcuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19q
cGVnX2RlY19ody5jDQo+ID4gaW5kZXggZWJkZWQwNmJhOTJkLi5kODY4ZTQ2YWFmMzcgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVn
X2RlY19ody5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVn
L210a19qcGVnX2RlY19ody5jDQo+ID4gQEAgLTQ1LDYgKzQ1LDkgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQNCj4gPiBtdGtfanBlZ2RlY19od19pZHNbXSA9IHsNCj4gPiAgICAg
ICB7DQo+ID4gICAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtanBn
ZGVjLWh3IiwNCj4gPiAgICAgICB9LA0KPiA+ICsgICAgIHsNCj4gPiArICAgICAgICAgICAgIC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Ni1qcGdkZWMtaHciLA0KPiA+ICsgICAgIH0sDQo+
ID4gICAgICAge30sDQo+ID4gICB9Ow0KPiA+ICAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXRr
X2pwZWdkZWNfaHdfaWRzKTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tZWRpYXRlay9qcGVnL210a19qcGVnX2VuY19ody5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiBpbmRleCA4N2ZlMWYz
MjRmMjMuLmNhMDZkNGY0MzVjZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiArKysgYi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiBAQCAtNTIs
NiArNTIsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiA+IG10a19qcGVn
ZW5jX2Rydl9pZHNbXSA9IHsNCj4gPiAgICAgICB7DQo+ID4gICAgICAgICAgICAgICAuY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtanBnZW5jLWh3IiwNCj4gPiAgICAgICB9LA0KPiA+ICsg
ICAgIHsNCj4gPiArICAgICAgICAgICAgIC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Ni1q
cGdlbmMtaHciLA0KPiA+ICsgICAgIH0sDQo+ID4gICAgICAge30sDQo+ID4gICB9Ow0KPiA+ICAg
TU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXRrX2pwZWdlbmNfZHJ2X2lkcyk7DQo+IA0KPiANCj4g
DQo=

