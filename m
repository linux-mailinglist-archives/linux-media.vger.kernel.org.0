Return-Path: <linux-media+bounces-21957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 067CA9D82F3
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84819163A76
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 09:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51E0192B8A;
	Mon, 25 Nov 2024 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LF1mOzF4";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Bx5E+rhm"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE10D1922E9;
	Mon, 25 Nov 2024 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732528629; cv=fail; b=mDqwlTfT0yWC/FmmjiBFFK6JRv9uVenlon7ZGQpaGFlWXCbBvxBE0PgT4Ye2d2thow8G2qBSMpjpR9mXdU86kJssWhBET8YnfLduMTEjaBaMWrW/4yugFIVNPkg5jz4uOlrjTtHiExLPhBfPWeLscks8qW1dc5JMwxCA3qPmhhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732528629; c=relaxed/simple;
	bh=GOPOx14ed5XZRlQTRvD77Pcv+rI0cEyCJxTb2nmg76M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SNwfyZtT8SQpG6nrmf6/Z/NOn9xcX3sed8VOWt4OL2Jd0zc43lhiq8pIgPA5ITS4jDB0DLsciY+TINgkd6GRbyczmQt0vDdfqwfxbcM08wHp0YjekefWwNOtZ9YFuzx7+XMVn4z2kimcWP91TTtu2JpoXaWfgbfZ91FtD/Ob1y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LF1mOzF4; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Bx5E+rhm; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9ce8c60eab1311efbd192953cf12861f-20241125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=GOPOx14ed5XZRlQTRvD77Pcv+rI0cEyCJxTb2nmg76M=;
	b=LF1mOzF4zFT27dqf2hlus826YH2BnlHAoXgL1mLaeV9YvQlXgSnpHvFKa5aZVyBgDo/DI69Ab5nMBt+3akfMP5pbhGh9K2eA3Z0d8lmoNb2M/r9/xvuCK0Kh1ITAjRFH48hjFAd11qXnBTVsZAB3nqHrcyar0xJlUsMGogCybzA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:95334d1a-61b9-4fcd-a9d1-9c4b60da66c1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:0a883ce0-1fe5-4c4a-bdf3-d07f9790da32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9ce8c60eab1311efbd192953cf12861f-20241125
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 693612091; Mon, 25 Nov 2024 17:56:59 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Nov 2024 17:56:58 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Nov 2024 17:56:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgw5/JNjMSVMPMoF/bt6LyH3SeXNFc1uVPELd9Zcsoezp01F1wsogskMfBZ8krZlWCz08MWM0b+moFVRYwGIfsodU+BEzKkmYlh2oQ/RbyHWP/XDz8wTCobvh7tOb3T9DudnyyC65Q2rn4+SOO2KglNI8Xm3ka0au0LvzQs9uSeCijR2FFOxoNBwfT6AfTSlNYYbNGLtZ9DANB0X6WBxnBw8P7O81Ml3ekUt9BKX9ZlUOidX5c4Bt8hH6RfHJurU0gQo4aPwQ3jH6sKZMJuPUwsp7iLZLiVhfaqlssHO8NLzQjEk1HhF8RwWDJ5LaxNiJbDqQr5yhH3z/59moDkAMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOPOx14ed5XZRlQTRvD77Pcv+rI0cEyCJxTb2nmg76M=;
 b=e1/dOyVzB13BDACZ/bI8URlQT71IG84fT3Q64bJp3n0y7HjbQt+hYjjjOrlE8VLhdjydAqEn9uMDD+rziGNjwr2nvqh6GBSecmXewKCovUZ6p8h/iv/RXrejf6KRPaherPCQDv8SboqqlC8mw+Aistm7+zgmNfmB6oMXIRoLJu0BnC4l3o2gbH98oJcGSmCEOFjlLTTGA0YOotjjObbxe3IzY5NX0Rtbfh/PKrC9yldvEqFofhCg7vyH4byKT1lV0U849IaffBVacenBCo/BMEPPg0yCOpMdKAo/dseVKvlnU/E/WmK7BzcrnjYJxgCu5I+rbe89+kuXNZ8mi2uA9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOPOx14ed5XZRlQTRvD77Pcv+rI0cEyCJxTb2nmg76M=;
 b=Bx5E+rhmQbVoZo+MsN6ut0i4wxXqpwLCcQMX+7Vzd/4bYjdcGoJLe9Zqe1hqLem+SvFzFs3osdOS3ztNMT9xHZ+2sazYC11khg9ALXIF5/OaZw0mWySe5re69A9eA54Kql8Jj2+B2Cn8XpmGkjW4fjAvAlRdD/Xeu7WjUD1nmxo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7522.apcprd03.prod.outlook.com (2603:1096:400:42b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 09:56:54 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 09:56:54 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Julien Stephan
	<jstephan@baylibre.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLHl18AgAAsr4CAAATBAA==
Date: Mon, 25 Nov 2024 09:56:54 +0000
Message-ID: <25f70693c81eb86c832378fee89792f6754b7ca0.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
	 <a9aa69dc8d025f0b133f33de6428ffec5a881a2a.camel@mediatek.com>
	 <20241125093953.GM19381@pendragon.ideasonboard.com>
In-Reply-To: <20241125093953.GM19381@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7522:EE_
x-ms-office365-filtering-correlation-id: c3285b8e-cb12-4360-4e97-08dd0d377e17
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R1NRSEF0TWppdFBrdjR3NG41VjByaU13QTFSYWErbXdsd3ZIS0tNSzRlam00?=
 =?utf-8?B?b3lGQXQ2WWkrMlRJcEdDdHdMZDBiamlDUithYnhZWSt3VjZ3QXNUTGJwSzJ6?=
 =?utf-8?B?c2ZvWmlaZXFhengzWStKazBzNFdCckcyMFZSVTV6WGxnUlJ0U2pBQzd6eElW?=
 =?utf-8?B?VDBjaEVaMXBWTkxqOG1mRVpyMENlQ2hPNUc2dGRNd1FOMzFyTThzL0pJYlI5?=
 =?utf-8?B?Nlh6L2NDdnQ2SGM2ZkNxTHRFblEvaGIwNk51WXh2cWdhczZxV2VtUFM5cXhF?=
 =?utf-8?B?L0pnZGpyZ3hpSlI1WExySE1NRDgrL1lwK3I1cXFJOThyVG53dGJDZ3N3cHlC?=
 =?utf-8?B?ZEJtdFFmZms0ZnlaZjRoTnMvcjNlWCt3K0t6cExnUnNxdk9MdFNYamE3T0Nl?=
 =?utf-8?B?cUFnWndZdzZ0dDBSQXE5eGhsTWhHdWk3NkFLVlZ0UkFtQ2FHM001emVPbDlQ?=
 =?utf-8?B?WTFnaUVFczRPZVVJMUtBTTBWbFkwclhKWjJvNmM0amhoMG0wRDZLUlhpbERt?=
 =?utf-8?B?YTNqenkxNkVKVmorWEpoL2JVcEdPN3d3M1pQU0gwSmNsZmZNay9aS0o4cDZL?=
 =?utf-8?B?MXAxQ051SnFJZ29aeE5ZRGp4bytsSGliQjVjNVlnOXQxbVdLVTBDcThyZEdj?=
 =?utf-8?B?cDZydldSV2V4K1ptWU8wYWREYTQrL2xpOStZRzN1dVpqanRSUzFNYUg5UGhk?=
 =?utf-8?B?aCsvNjVXVkhVQUxOdDAzUzhVM3h0QTNrRFVRdUxpVnZ6SStXbE9xYUROcXdS?=
 =?utf-8?B?MzhUTzV4NFp6Umx0cXRyRTJCVTIwR2VPUmFmdVhrbmNWNDFzNlMybWhnLzBi?=
 =?utf-8?B?bHQvM251OUEvMmVZNHJWNENNUU4raDNKN0ZpQkdRTUNLbzJZSTM3aDk1amlG?=
 =?utf-8?B?S1JUY0dtdnpNVkUyTWV1YmhPd21nUGFqS2lINmtvcGlPc3VhVzZZRFZ4bTdV?=
 =?utf-8?B?OEhYb2JWRURRcGo5RXd3VWUzR0RDWnRKUlZGMjJTWmh6ckNzcUpKZEhmZ1Ru?=
 =?utf-8?B?Zm80NGd2bGZSc0F4WFFvZHlRdXlDRnVBN2pubVhHa1lWdmNXaS9qVUcyZjdG?=
 =?utf-8?B?dFB3eDZpWVdLbXU1QUNNc0JGTUc1TUsxTkl1b3dOUlQ0c1FGQ0VjSWNnbjV3?=
 =?utf-8?B?eTF2dHpOTDhIcTV4MlVJdUxIZlk1M1JIc1lhWkY0aFNUOVpnMFVPNHFQanhn?=
 =?utf-8?B?Nm5YSHF5TnVNWndyMlhEZ0pQdERsRlBGZlI1SmZWTDU1UkZUaGJRZzB6S1dw?=
 =?utf-8?B?Nmw0T1JsSDBHRHkraTFmOEthU0VuUGk3SDVaR0Q3K21ybFlMVXlXZG1VcUtr?=
 =?utf-8?B?L3AwRUdBRXR1UUE5RDMrOTZ4bkRXbWZIalhZTDVSdi82K0hrZEtxT2hwNGtw?=
 =?utf-8?B?MDl6enM4UlBXbnVWdnhKY0JsOVc3RjZSUG1CcW1DRFlHWGdrSGtNL1RVekpR?=
 =?utf-8?B?aldUTHFweXJyRWg5WXhaRDBvL3dnV216VUJxcEkrRlN2bys3SUxJNmtJQjRE?=
 =?utf-8?B?L2R6MnBkellvOEg0alZnNUxzMGZFZTdWTkovVld6TXdIdVJlaVlOOUlSbVJY?=
 =?utf-8?B?Y1ZBS1BaVk93TkRRbHF1NXIweHBGT1VYVXpPTGNWQVVhL3dXbS9FSHVkdXAz?=
 =?utf-8?B?RkVNSGxXNUVUaFMxdGpxTFBSSFJTNVNGSEdzMjhXNnNBK05XeVZvL1FLaFRq?=
 =?utf-8?B?WXBUM1g3czhwTGt2bnNVdWRkUlFtSnJxZ2tPalgrd1ZBcmdMb3ZQcGtGR0t0?=
 =?utf-8?B?OExIQTlZQjR3N2pqNkVKenhWQmVlVHhzSFBnd3Y0UTZOcDg4cjh1aE9xWFF1?=
 =?utf-8?B?c3NFUmRMNFdmekZVQitJa3N0R1RDOHdMWUV3T2tTcDM4RnJMVnFidGpYalpL?=
 =?utf-8?B?NXlXQlgza1pwWTRtbi9UaTNNMU15ampDOGk2eVJuL3ZIa2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVFaamtVMlRIK3o1SzFuRW5VWHd5aE5mRUgrTWhDV0psVWtJejF2bDZ0UVlI?=
 =?utf-8?B?THFFWkZQd2JZYXNWVmpjQjF1aVVTcTdpUDZYbzVWalVYRk95T1NCK0pDUFY2?=
 =?utf-8?B?UlNVVWtNZkVkSWcwZkRPbHJzcUpXUGFXbkRGTU1hZXpUSmVVUmxsNFgxMk4y?=
 =?utf-8?B?MmRHczVQZnV3M0tHRGdEaDlqTmJVbWlsWVJYTjZJUDFRSThhRzFxRHJjR0xI?=
 =?utf-8?B?akR3SUdWaGQ4d0JWQ3RPZkFPWXlBK0tWWmhKR25WcWVnS1FuSWZLVjM2ZnlB?=
 =?utf-8?B?aWdiaDdnOHlYVUh4cm9WNTdqQmYrVXd4N0ZmWHVNNFZDckgydS9IdUlZRUZl?=
 =?utf-8?B?MDBXdmxCSEYxUE56Q092d21Ka2p3V1NXTkNkYUE0cVFaOFRLTVhSbjNrMUJ1?=
 =?utf-8?B?ZURDYnBCNkIwR1pVYnpJQitlK3hlZEp3WUJkK1AvRXlSVmxTMGVNUTA4VzZG?=
 =?utf-8?B?KzUvay9ZaGtDdURTWUFnMUtqNkZzdWVYY2UwK0plaTRYSlMrR2RteERSVEdo?=
 =?utf-8?B?SVB6MGdTbm9QdlBHNitmaENoeUxoVGxaY2JHdmFlb0poVUY5Qnd2UGxhSFZ4?=
 =?utf-8?B?UE12enUrWUVpaHNoYzloWU0zMVdSRERBbXpXWTllSjNHeEJqRFBrQlNnT2NZ?=
 =?utf-8?B?Ukt2Z3dLUk91UUtUVkh1Y1lxSGxQUFlLd0hvUUdYblo4YzJWclU2UTQxL2pn?=
 =?utf-8?B?L1daZlJJZHM0MWNWYUxoUk5BQXphdDZJT1RpNEtZMThjZWFic2JSK1RlZkNi?=
 =?utf-8?B?TThidUE1L0I2RjNzNm5WbklneDhNZkFoeXcxVXZESFl6RE0rS0VjYitiRk9m?=
 =?utf-8?B?bVRJT2tqVm54MWVxQlFTMmNRbVcrMzJPbi84aTA5cFN3djRwajhJNjNYTTF5?=
 =?utf-8?B?UTI5aFRuaHdCR3dsMlA4OTZDTjB1TC9rTmpzL0dXOWY1SG4vdmJTVjcxRmky?=
 =?utf-8?B?Q09NV1JSUU5BNi83RnVvU0NvVWpOM0VRd2xudFIraUNaY3lub2RmMzN6REJR?=
 =?utf-8?B?VnpZckxITlFqSmlxaDV6ZDV4SUs1eDRsam9LcW5OSnBWTytQTHlMQjFwQXRk?=
 =?utf-8?B?ck9jN3djU3ZadkJyRWlwQ0Q1WERyeDd0ZkRxSzVxU2E2VG5IUy9kMk1KeEhT?=
 =?utf-8?B?cFBOMWhhL2wxaGgwQUJLRWxPVEtzQ0ZWM0QvdnMva05lTWNoeElwM3o1YTBH?=
 =?utf-8?B?bVErSmhNeFBLNkRiRHpnb0R1RVJxcGwvZGE0eWd2RVRmTG5Qbi9rcUZiOE5O?=
 =?utf-8?B?czF6L0YzVEIrSDQzQ1hRRzJ1SVpLczJjblBWaVRLTFRLNkczcVVhdEVTZ3N5?=
 =?utf-8?B?TlNwYzg5eWorOU9ibEtoU1hqbUVhek5Zdmk5QTc1VEZBdWV4SnIvVzJLR014?=
 =?utf-8?B?Zm9vcmdoNW5kNzRoTTJJci9nS29kZjZvclJFK1MxbVBXZVZzMThVMTU3cDV6?=
 =?utf-8?B?T0VrMExYZEp5bmdPOUhGNldkOXRGM0IwaEtHRmhlSDJRT3hwNHdJMkE2ZG9h?=
 =?utf-8?B?aHZHQzVYc1RkL3I4bWpKUUpMRVZPdUcxWXlNWTg2S1ZmOVdvemtpMG9IZzds?=
 =?utf-8?B?d01sVzlVa2xCODU5SWpmVXg3UDlSVU9mUzF1QU5GNzJUZ2pjaGl5RTdZeFBz?=
 =?utf-8?B?Zms1YmQwVHpkbHovYWFoZURTNnVMeGg4OHNPY0FwRStlVHZXUmdxVUdlcmc4?=
 =?utf-8?B?a1duVmxRUThSQUkwTm1rblZWR0VQVTUzMzcwZXMvbWNSK3FYNHJzUW5GUk13?=
 =?utf-8?B?NDg2Q0kvaUkzRTdzcnZ4b3dYc1F2bFRoa20rVjNsZW9HQnhJSDdyN3ljRHdS?=
 =?utf-8?B?clBLanRqMEduajRDaXRCcjJYTU95QWtHbXFYS2RIMTBqS2VRR3Z0Q2IyQndR?=
 =?utf-8?B?VmJPMUN6dHNNRklHR1FpUWdIK0pNeEFLalczQUpFTjc5cTN0amVacnhQS0Rw?=
 =?utf-8?B?eTQ2YWt5dWdyMnhtTUZYRjd5VmJiT3ViaXI3VWt4dVBKWXpxbDZRclFrU1BU?=
 =?utf-8?B?eTRLcjlodmcvY1lXSy9TRzlHVFUwOW5yMjlRU2NiTFZJRFg3b0pTRHBTNDhl?=
 =?utf-8?B?S0cram9sODY2RVhMV2lCaDdUNmNBNU9ZL1M2SDlqdGszMWxXRVVGeE54KzlJ?=
 =?utf-8?Q?P2bxSG7N0dv4oKcXLSIwn7dyP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B07C94F39123E4DB8E921A08AE4935E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3285b8e-cb12-4360-4e97-08dd0d377e17
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 09:56:54.5844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDJJo9z/JV0utKKWCvq89JcvhI7fEp2qD44cpLT1uDw1Th5wrC4BRUrXd+45+3l+ONNhaxJG80gK+a8rS6dRyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7522

T24gTW9uLCAyMDI0LTExLTI1IGF0IDExOjM5ICswMjAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3Rl
Og0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IE9uIE1vbiwgTm92IDI1LCAyMDI0IGF0IDA2OjU5OjU5QU0gKzAwMDAs
IENLIEh1ICjog6Hkv4rlhYkpIHdyb3RlOg0KPiA+IEhpLCBKdWxpZW46DQo+ID4gDQo+ID4gT24g
VGh1LCAyMDI0LTExLTIxIGF0IDA5OjUzICswMTAwLCBKdWxpZW4gU3RlcGhhbiB3cm90ZToNCj4g
PiA+IA0KPiA+ID4gRnJvbTogUGhpLWJhbmcgTmd1eWVuIDxwbmd1eWVuQGJheWxpYnJlLmNvbT4N
Cj4gPiA+IA0KPiA+ID4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5cGFzcyB0aGUg
U29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gPiA+IGNvbWluZyBmcm9tIHRoZSBTRU5JTkYg
Y2FuIGdvIGRpcmVjdGx5IGludG8gbWVtb3J5IHdpdGhvdXQgYW55IGltYWdlDQo+ID4gPiBwcm9j
ZXNzaW5nLiBUaGlzIGFsbG93cyB0aGUgdXNlIG9mIGFuIGV4dGVybmFsIElTUC4NCj4gPiA+IA0K
PiA+ID4gU2lnbmVkLW9mZi1ieTogUGhpLWJhbmcgTmd1eWVuIDxwbmd1eWVuQGJheWxpYnJlLmNv
bT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZsb3JpYW4gU3lsdmVzdHJlIDxmc3lsdmVzdHJlQGJh
eWxpYnJlLmNvbT4NCj4gPiA+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gPiA+IFNp
Z25lZC1vZmYtYnk6IFBhdWwgRWxkZXIgPHBhdWwuZWxkZXJAaWRlYXNvbmJvYXJkLmNvbT4NCj4g
PiA+IENvLWRldmVsb3BlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+ID4gQ28tZGV2ZWxvcGVkLWJ5
OiBKdWxpZW4gU3RlcGhhbiA8anN0ZXBoYW5AYmF5bGlicmUuY29tPg0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNvbT4NCj4gPiA+IC0tLQ0K
PiA+IA0KPiA+IFtzbmlwXQ0KPiA+IA0KPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Nh
bV9jb25mIGNhbXN2MzBfY29uZiA9IHsNCj4gPiA+ICsgICAgICAgLnRnX3Nlbl9tb2RlID0gMHgw
MDAxMDAwMlUsIC8qIFRJTUVfU1RQX0VOID0gMS4gREJMX0RBVEFfQlVTID0gMSAqLw0KPiA+ID4g
KyAgICAgICAubW9kdWxlX2VuID0gMHg0MDAwMDAwMVUsIC8qIGVuYWJsZSBkb3VibGUgYnVmZmVy
IGFuZCBURyAqLw0KPiA+ID4gKyAgICAgICAuaW1nb19jb24gPSAweDgwMDAwMDgwVSwgLyogRE1B
IEZJRk8gZGVwdGggYW5kIGJ1cnN0ICovDQo+ID4gPiArICAgICAgIC5pbWdvX2NvbjIgPSAweDAw
MDIwMDAyVSwgLyogRE1BIHByaW9yaXR5ICovDQo+ID4gDQo+ID4gTm93IHN1cHBvcnQgb25seSBv
bmUgU29DLCBzbyBpdCdzIG5vdCBuZWNlc3NhcnkgbWFrZSB0aGVzZSBTb0MgdmFyaWFibGUuDQo+
ID4gVGhleSBjb3VsZCBiZSBjb25zdGFudCBzeW1ib2wgbm93Lg0KPiANCj4gVGhpcyBJIHdvdWxk
IGtlZXAgYXMgYSBtdGtfY2FtX2NvbmYgc3RydWN0dXJlIGluc3RhbmNlLCBhcyBJIHRoaW5rIGl0
DQo+IG1ha2VzIGl0IGNsZWFyIHdoYXQgd2UgY29uc2lkZXIgdG8gYmUgbW9kZWwtc3BlY2lmaWMg
d2l0aG91dCBoaW5kZXJpbmcNCj4gcmVhZGFiaWxpdHkuIEkgZG9uJ3QgaGF2ZSBhIHZlcnkgc3Ry
b25nIG9waW5pb24gdGhvdWdoLg0KDQpJZiB0aGlzIGlzIGEgY29uZmlndXJhdGlvbiB0YWJsZSwg
SSB3b3VsZCBsaWtlIGl0IHRvIGJlDQoNCnsNCgkudGltZV9zdHBfZW4gPSB0cnVlOw0KCS5kYmxf
ZGF0YV9idXMgPSAxOw0KCS5kb3VibGVfYnVmZmVyX2VuID0gdHJ1ZTsNCgkudGcgPSAweDQ7DQoJ
Li4uDQp9DQoNCklmIG5leHQgU29DIGhhcyBvbmx5IG9uZSBwYXJhbWV0ZXIgaXMgZGlmZmVyZW50
LCB3ZSBkdXBsaWNhdGUgYWxsIG90aGVyIHBhcmFtZXRlcj8NCg0KUmVnYXJkcywNCkNLDQoNCj4g
DQo+ID4gPiArfTsNCj4gPiA+ICsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50
IFBpbmNoYXJ0DQo=

