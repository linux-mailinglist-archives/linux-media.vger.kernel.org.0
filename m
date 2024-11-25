Return-Path: <linux-media+bounces-21921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BCE9D7B5F
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 06:54:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D5C01627E1
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 05:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E96157A6C;
	Mon, 25 Nov 2024 05:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="om1M4tVz";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="C5MGWnLb"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3FE376;
	Mon, 25 Nov 2024 05:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732514062; cv=fail; b=nbgRGIJNgAERAEHpQeFXRfh3SxI3y9FcJB0Gf6RxrEgM8BkcUrIUnTDCdUYR0rWHpnf64fxe53DTK2QCp7SIKfUfuWaHxQUaSarcVWZX4KfxEmav1LSUjtjZrVDTFr7QpGa7yTyYyowdTeMPLeGFm3kF11CiMT7NKosGDk0Jjqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732514062; c=relaxed/simple;
	bh=sKHZrJsyxQfDXj+6uN6xn7GhBDU2XFmgInIJXg2GXKM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J9Tu7eZqQWxoMfS2zs1YaLa8p90CKjfv/vXV4+eDV4ba0i3TqFqHpsQ52waCUBllMxWP48J0HeTthPSj5bvGDXng/LLzeO4zm+/dv9YWR7p5b6JVbv1vuHN60gGlQ80iPfvuWMIWgw0YTZDDYD6cv4Rf/kYf9fXptMJkmnuzYQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=om1M4tVz; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=C5MGWnLb; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ae9903aeaaf111ef99858b75a2457dd9-20241125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=sKHZrJsyxQfDXj+6uN6xn7GhBDU2XFmgInIJXg2GXKM=;
	b=om1M4tVzeqPTULHwnoROxdWNKI1R3H1CMHCP62MyscbE6l4YJ3eNH5Nqbv2g5yqNMOX2jXNb1WhaBkSAWxcAuyyh6f7wp065jnhl944d8xS06FBxfYYKtjI4c32qFX483WgNBOGfA6J/fo5qwWCdmS5/MBxpiETHnQPn5ns18dc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:6bb95e8e-0fa5-4542-a506-df45cd20bc43,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:ff8438e0-1fe5-4c4a-bdf3-d07f9790da32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ae9903aeaaf111ef99858b75a2457dd9-20241125
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1122832308; Mon, 25 Nov 2024 13:54:06 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Nov 2024 13:54:05 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Nov 2024 13:54:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXMzU2wxA4K293JlNR0E0XXARnPwL7kki82MdT5/MNwweAuVqH1bxE3vxzBKXa1i7o98x6NzOxLQ/+MjUA1NXxfpRhum4fTZORE/1V+L4aIN5CPHSoMqwfWFRrn8ZrZ2cQesyVV8wv/u4+6dDo+3oLsftqSRpve31co3qdCEWLsHER2QUxOCzzyncEAfe394JtU93ZGQoPpNl1udWNz3Z3XbjNSl4+EFr40EoiD+zegTLiJHpms6THdqnJwfzf3R4tfzESMBztlFcj3WicC3aDvvlK3AuoT6fdBCjrOwR3LsaqGPO0gf610mxetF0NXPy1C1hy1w9hOqvWiytY0Ejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKHZrJsyxQfDXj+6uN6xn7GhBDU2XFmgInIJXg2GXKM=;
 b=lCSmt1YTw/wAKnmRtRUn7nxmfd6iCAWzkSYOMTq3YCgkR1huXr1mTBWry43Eb/sxBGWRtjj1CWS7FbrfezlxffALwAKCtfiW7d61nEjsp3qSR8B62iideA0J/IXBdJhPnll5SEVqxgOzaQca0b9bb7CEmleLgbHiCK+LzzkLOubaEx+N3Nx4a2LpEP8VP2xthHyJ4gAL+KvSdZlA8q2puwvdHBoP/42n/AJInt0fZnUIsoS64l/vcRWSSVvnUl3C73yujzWyXO8G/FBS28ZWKxQI3Tt0GGTmZHhVUJBq60tsQ+ywisuKl7qQZbtK/gwukFuKXi2Sa+FcgohDHiXQFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKHZrJsyxQfDXj+6uN6xn7GhBDU2XFmgInIJXg2GXKM=;
 b=C5MGWnLbnISd8VqC22nCWpYgM+bwNTMEyRB66FKDMIraA6lQ5cp5KVuaOCAFZ3riCtskWpLNWb29SpQck8IOsY++tuthp3KFxjzB+rNaH8K5LnL17/1t9KK/EA2YsLGV0OrT3ebuO/k5YKkeK9Y9SnviK2MlPAjZ6AT/S+a/8oo=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7045.apcprd03.prod.outlook.com (2603:1096:101:c6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 25 Nov
 2024 05:54:02 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 05:54:01 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: Julien Stephan <jstephan@baylibre.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLDBzaAgAAHPQCABHZ+AA==
Date: Mon, 25 Nov 2024 05:54:01 +0000
Message-ID: <8bf06ce5c79271a326ee375f104e475c6e482f58.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
	 <b0af0ec1545b33fed81f34a866bc7b7222c78ad7.camel@mediatek.com>
	 <CAEHHSvbFw+MC0R3w7isgrF15JAAfBWQmSkh1PoiU7y+P4O2psw@mail.gmail.com>
In-Reply-To: <CAEHHSvbFw+MC0R3w7isgrF15JAAfBWQmSkh1PoiU7y+P4O2psw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7045:EE_
x-ms-office365-filtering-correlation-id: ab37a6d7-952c-4de6-2af2-08dd0d158ff2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MmVUZ2x0TDhGMU12WWg0aU1xK3piVzdENzBtRWxBSlJKREpGd1Q5bllQZTd4?=
 =?utf-8?B?dnZzSjhoQkZraWp1MUZ5VGlHSTFZSnV4V2tBanE2OUY3cWVjZUpJSDkreEFM?=
 =?utf-8?B?ZEdJdW54dVJadUEvZ2lBTFRiL1VCdCtuVVBETEgvRUVKeE5mTXdRY0owRmdE?=
 =?utf-8?B?SEh6Ulg1dWNlU2tyNUQ1UWowTW1OYkVUallBanMyVGRISExFRHFqWUVDcWxG?=
 =?utf-8?B?TjNRdVN6NVB4aHduVUpIcHlJbDFJdlpCa2h5SnpNUkNmVWNod3J3SXRnd3FG?=
 =?utf-8?B?VSsxcGR2VHNxcUJYNngvR1RoeGMxaHpuTnh6VEZLUzFKZFI3d1FtbWtiYnRk?=
 =?utf-8?B?MGU5V0NmSXA0c3crTmFueHVWcDF5QjBrS3cyUnkrSytjSlFIZmlrQ202a1c2?=
 =?utf-8?B?eVQxVFU5bjBacGxUVkhaVnlId3phb3BqaXRobXkrWFRKeUl3YmFFQXJjZjYx?=
 =?utf-8?B?OUZMb1RwZUNadUl3bWszaGN1YmtsN285N0RITTFDdVpoY3BvZC9SRUM4VGp1?=
 =?utf-8?B?eWY0dzlBckY2UWExRGtuVFBFcU1kdjZLNFIxODhOQ1JiVkxzUUtLT1BMc0Ix?=
 =?utf-8?B?dUNndldSRUhoRVhvVHU3WU9IVjlrVGZmcHJNVEVYV2daVlAwQk5aWDdVNzRa?=
 =?utf-8?B?aFJ6ZE5xQ2poQ0FkQ3ZTS2h3OTVuU3FrYWhNaURaUkZOUi9LOEdnL0ZnZE5B?=
 =?utf-8?B?Q0JjaTNGY0hKQ2c0dTF2TVVHVGtCQUJ3K2UxZXlNMmMxTTZJb0JUS0FRdFJa?=
 =?utf-8?B?bkY2Uy80WWwrRW9uaFdlT2xvKzBUbkxXSy93WFF1bWZKVW9BOUNOMFAydlRS?=
 =?utf-8?B?ZlFPd2hscFpnSGJkb09DbUI2MTc5MVpEaVExTmJtZUJMc3VDQWo1TU4zMmNU?=
 =?utf-8?B?WjZwMVdhckhySVdBV2FjaTgwaHRkSDE5bHJBSm84RnFjNzhBamZrczhqZmpO?=
 =?utf-8?B?MjI5UFhEdDNRZVhBSHJSWWtRMGF1d3hsM0xMTXJNaCs4ZlRrSFdXWGtmb3ZL?=
 =?utf-8?B?MzdFUG5nUFQyb09tb2k1SjRlNXJ3SnFaRS9kaEhNUjRHZHA2cStPR2twdnRz?=
 =?utf-8?B?TGt3YzlqbWtEb1B5OWIzSWVpSmFJQnUzaGYxU0t2UHFKUGZza0QxTjgrWm40?=
 =?utf-8?B?dGk0N3JXeWtyNy94TUZKdkhWN3MyTk9lWHhlaGc3WkhMRy9ZMmY3clJqQ3ZT?=
 =?utf-8?B?Y1lGYnlmMlczWmFTV3VEN2dGU1A0K2grZlBjdnNkcVkxRXVyYmYrL1ovN3lh?=
 =?utf-8?B?akQrVTByaXMzd1o4alBMa3Rpc3RXR1doRjRBU1dQZDZObTFONkU3aTF5bmFp?=
 =?utf-8?B?UlhCR2pjb1o3aVorZmwvc3lNSlZnR20zbzRVTCtBdnI1U0pwbWE5Mk9YQ1pn?=
 =?utf-8?B?KzRFU0VkSUdMMXRzZHdKNjcvWjZlbFZ4c2lIVlZKZjJLY1NQdmFhelZaM0ZI?=
 =?utf-8?B?NjZqTFY2bUZ5MEdhVVQySkJZYmc3VmhlOEhKN1VQTzZNYVZFZVF3SXNXbGZV?=
 =?utf-8?B?bUlnK29SZCtEMDBhL0pwRE4wNkpjR3F4b1VaRlFNZitocG95eHVUMFkrNlVw?=
 =?utf-8?B?aFdkMGpKWFh5b2ZybFh0UW5qTGx3VUpVdWF0UTZqUGt3eXM4OU9TVGhjaW94?=
 =?utf-8?B?eElTK1NkaGJ2M3Y2N3J6M3BZUVJqMHE0d1E4VytlSWFaeHV5ZjcxNnNGbWhw?=
 =?utf-8?B?WDZidkVSejZTMXRNRUpjL0dDUWIwNUZSV2pXVjBZV1RSdFZrOW9yN2s5dGMv?=
 =?utf-8?B?RE95ZjlzQU41NmxuelY0Zi9UL0psRkZiUmtzUTZjWk9JTXk0NXp4T0tBRzV5?=
 =?utf-8?B?NHJFOGw0NlEyN0JRbTEzSHlIY3JXQktMOS9CTC9jM3FpenpmbmNxQlEvTjZ4?=
 =?utf-8?B?NDVzUzYrMXdMcG9ZY05hM01FblFKSjVyTDVwTElQbStVc1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZndvZmtEQW1wQlc1ZU9KdXRJeDd5QW9WQVJJSFJWaEs1Q2xQV3BLS2V4amdU?=
 =?utf-8?B?SmN2bXFEcmpSRjJqdGxpV242Si9GM2syQmFkbk8wUVNlNjg1WTdPVlgwa3Z2?=
 =?utf-8?B?S1NUekd4WUQ5VFM5Y1NLVW4wQitWdHpCOFpleFlOUDhoTWdrMkZhSnZNek9h?=
 =?utf-8?B?RGVnam9WMHlQR2h1U3JXcWp4dnlHQTI0WFYxUGFuTFBBZ0N4QWZ2RERLVXhY?=
 =?utf-8?B?MUF5OFdHbFNsUWs4dGdRQTRENlRDM3U1RjJGTEhhNGtaUFFPSVlaS3JQTmlu?=
 =?utf-8?B?YXVDcGdIdlA2WVNRSUlGL3h5dWp3dEptTENHUnNzVmMxMUlNNHFyRDQvTVNW?=
 =?utf-8?B?T3A2Y2pwTW1uWFdVSU5HaW1NeEZlcElBWmdieFpKR0JITkhCUXZNcDc4WGlx?=
 =?utf-8?B?UWc1clNkWHRCUGhhVGpwMUI5YVhYdkc0cTdDK1B5L2tkeTlnYmVzWmhNMFF2?=
 =?utf-8?B?YnYvZm9ncml2bzdtd04xL1llVExNdnQvaTM3YUxHYXAzdEl0NExPTTRuY0ZD?=
 =?utf-8?B?WVAwc1VOTGZGQ0VIS0FSZUxJUkI0MW5lNENoVHJ4OVpPZ1RjZDFqYXRFTXlJ?=
 =?utf-8?B?eG9tbUx4eDNrMXlkS3RDR2JCbG4wdVhkUy9BZE16YUtvUVovL3ZRWTBKbEN2?=
 =?utf-8?B?SHpYRzA3WFkzdHRIVU1WdnZDTlNhZnlkVkdaR283YzF1UWFndjZ1ai9kRitZ?=
 =?utf-8?B?dEdHK1JzOHU1dVRsV2lXUE1Sdmc1czQ2NUF2dWZMZk9rM0NpUnJsak4vZGcx?=
 =?utf-8?B?cVZZTWg2aWdmRllLZkhBNG9ZOEswUEtiRlZSMy8yclNRWlVQeDJTMm9CdWk0?=
 =?utf-8?B?ekpFK2luVGpTV2JvV21wRXFXMk0rVTBQTjBlNzBTQkU2VzVhbHQ3TjN3dXdy?=
 =?utf-8?B?RS95Y0hPck0yMmpvSmtkM3dnZ2lLWlpGQXluVlM1TFlBc1oxSXgxVjk4Qlcy?=
 =?utf-8?B?OG0xUkcxQUkzRCtRZ2lMdEp4MGtPMXd3UDdEbFd6bHp6enRtaUN3alAxeFF4?=
 =?utf-8?B?bkI5V0RnMWt5bW5KWHRuTWZ5dEhrMUR6VU1GeUgvTkRVWlBSak1ZalFjMTJl?=
 =?utf-8?B?NGdDWXB0RmtQc0FhekEybXJiclpud2QvMmtaWFZ3MENhSlVQaVlXUmFSTloy?=
 =?utf-8?B?RGpXbDY0S2hoV0NsKzdjY1BzOXRRbkRnWTllYkMwTUxiU2haZXZVM2pkcG1E?=
 =?utf-8?B?ck5JWWdNSmpXN2p1ZXl2SVNxcmFtbkU4QzgxYzRSNElmZUlLTFNBei9HUGNp?=
 =?utf-8?B?SW81WnZTUjdCK3c3S0Q1c3RWUitqYmEvYlN6S1l5cSs3NWxvbmVXVGRNdVdK?=
 =?utf-8?B?dWV6OThVaDZxN2tKZ29MaGVpYkxJU3o0S3JTZmEwVVphbU85THc5clFJZU41?=
 =?utf-8?B?QncyY1p0dlZSSXMvM2FQVFVMd2svUm5vaVM2STIxNktvVzNXVFp6Zmd3M0d0?=
 =?utf-8?B?dWFxREs2Y2RtNDdQZWN6WHdwSWc3V3pEZ2xuWk9GSW14ZHFrTFluK0o0a0lx?=
 =?utf-8?B?NHRPZzgwc0Nmb2tJcytEMlRTR0N1ektnM1JBQjJjOWs4bmhSMHhDMWhMa0Y0?=
 =?utf-8?B?Y3ZIMWhlUXdwaXRmY2VMd0J4bDB6b0ZYMzZqQnJ2aDd4NmlxZm43ZTdETWJr?=
 =?utf-8?B?M0p0cU4wWWtBTjB5YmZ4Yno1V25TR0RobDJPc3R2dXJrU25jYTl3TGFJZHdp?=
 =?utf-8?B?S0k5dUxTNWpLakYza2FnNnJGN1RjdzB3WFRjVmx1aVpkK2dYMFFkSTFSVDc1?=
 =?utf-8?B?dWQvZHlDWVcyZktqdUVmVXIzb0d4QTBjSklUbjJTT29lenZ4MzdYNG1QS0U2?=
 =?utf-8?B?MmlxVWZqNkVWVDgwa1NmY21PemtTdENzUUlWaWw0SlZuVXFuaEwwaFBuK3FQ?=
 =?utf-8?B?ZWlSZjdwcTJSclVzQS9mTHNaNUNhYnNLQ0gwTThqM1VvTlVDQzNzTzduOUph?=
 =?utf-8?B?eDBQRE5nZkNjZm42cmMxNTNJREUrYWE3WjNHcEFnNVQvNnFhTXEyZEg5Rmcx?=
 =?utf-8?B?NGpWcmVVQldiMjNGbnBHWFpWMndaR25aTm4xbW04OGxkTjNVa2lIdmJrR0F3?=
 =?utf-8?B?Y3JwV21oRk9ueTJBeTF0Wm4yVk1HeUY5cTAwN003Y0VQODJzbkVnbjVsWDgy?=
 =?utf-8?Q?o0Dm6Elo6o06kX/1aKH2hXKbR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92F011A254D26448BD938F01B71100E4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab37a6d7-952c-4de6-2af2-08dd0d158ff2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 05:54:01.6783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q3Q/ivdkT/W6OkgHKyS8ftpXXnCsjRQF9fAhXE2aTJ8Uxoj+PVrqEtl8frz6xLHNNQVLfi7+JfYvfqkgIikNMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7045

T24gRnJpLCAyMDI0LTExLTIyIGF0IDEwOjQ0ICswMTAwLCBKdWxpZW4gU3RlcGhhbiB3cm90ZToN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVu
dC4NCj4gDQo+IA0KPiBMZSB2ZW4uIDIyIG5vdi4gMjAyNCDDoCAxMDoxOSwgQ0sgSHUgKOiDoeS/
iuWFiSkgPGNrLmh1QG1lZGlhdGVrLmNvbT4gYSDDqWNyaXQgOg0KPiA+IA0KPiA+IEhpLCBKdWxp
ZW46DQo+ID4gDQo+ID4gT24gVGh1LCAyMDI0LTExLTIxIGF0IDA5OjUzICswMTAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gRnJvbTogUGhpLWJh
bmcgTmd1eWVuIDxwbmd1eWVuQGJheWxpYnJlLmNvbT4NCj4gPiA+IA0KPiA+ID4gVGhpcyBkcml2
ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRh
dGENCj4gPiA+IGNvbWluZyBmcm9tIHRoZSBTRU5JTkYgY2FuIGdvIGRpcmVjdGx5IGludG8gbWVt
b3J5IHdpdGhvdXQgYW55IGltYWdlDQo+ID4gPiBwcm9jZXNzaW5nLiBUaGlzIGFsbG93cyB0aGUg
dXNlIG9mIGFuIGV4dGVybmFsIElTUC4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGhp
LWJhbmcgTmd1eWVuIDxwbmd1eWVuQGJheWxpYnJlLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEZsb3JpYW4gU3lsdmVzdHJlIDxmc3lsdmVzdHJlQGJheWxpYnJlLmNvbT4NCj4gPiA+IFtQYXVs
IEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRWxkZXIg
PHBhdWwuZWxkZXJAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+IENvLWRldmVsb3BlZC1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPg0KPiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBKdWxpZW4gU3RlcGhhbiA8anN0ZXBo
YW5AYmF5bGlicmUuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIFN0ZXBoYW4gPGpz
dGVwaGFuQGJheWxpYnJlLmNvbT4NCj4gPiA+IC0tLQ0KPiA+IA0KPiA+IFtzbmlwXQ0KPiA+IA0K
PiA+ID4gK3N0YXRpYyB2b2lkIG10a19jYW1fdmIyX2J1Zl9xdWV1ZShzdHJ1Y3QgdmIyX2J1ZmZl
ciAqdmIpDQo+ID4gPiArew0KPiA+ID4gKyAgICAgICBzdHJ1Y3QgbXRrX2NhbV9kZXYgKmNhbSA9
IHZiMl9nZXRfZHJ2X3ByaXYodmItPnZiMl9xdWV1ZSk7DQo+ID4gPiArICAgICAgIHN0cnVjdCBt
dGtfY2FtX2Rldl9idWZmZXIgKmJ1ZiA9IHRvX210a19jYW1fZGV2X2J1ZmZlcih2Yik7DQo+ID4g
PiArICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4gPiArDQo+ID4gPiArICAgICAgIC8q
IEFkZCB0aGUgYnVmZmVyIGludG8gdGhlIHRyYWNraW5nIGxpc3QgKi8NCj4gPiA+ICsgICAgICAg
c3Bpbl9sb2NrX2lycXNhdmUoJmNhbS0+YnVmX2xpc3RfbG9jaywgZmxhZ3MpOw0KPiA+ID4gKyAg
ICAgICBpZiAobGlzdF9lbXB0eSgmY2FtLT5idWZfbGlzdCkpDQo+ID4gPiArICAgICAgICAgICAg
ICAgKCpjYW0tPmh3X2Z1bmN0aW9ucy0+bXRrX2NhbV91cGRhdGVfYnVmZmVyc19hZGQpKGNhbSwg
YnVmKTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgbGlzdF9hZGRfdGFpbCgmYnVmLT5saXN0LCAm
Y2FtLT5idWZfbGlzdCk7DQo+ID4gPiArICAgICAgICgqY2FtLT5od19mdW5jdGlvbnMtPm10a19j
YW1fZmJjX2luYykoY2FtKTsNCj4gPiANCj4gPiBJIHRoaW5rIGZiY19pbmMgc2hvdWxkIHRvZ2V0
aGVyIHdpdGggdXBkYXRlX2J1ZmZlcnNfYWRkLg0KPiA+IEFmdGVyIHVwZGF0ZV9idWZmZXJzX2Fk
ZCB0aGVuIGZiY19pbmMuDQo+ID4gU28gc3F1YXNoIGZiY19pbmMgaW50byB1cGRhdGVfYnVmZmVy
c19hZGQgYW5kIGRyb3AgZmJjX2luYyBmdW5jdGlvbi4NCj4gPiANCj4gDQo+IE5vLCB0aGlzIGlz
IG5vdCB0cnVlLg0KPiBtdGtfY2FtX3VwZGF0ZV9idWZmZXJzX2FkZCBpcyB1c2VkIHRvIGluZGlj
YXRlIHdoaWNoIGJ1ZmZlciBzaG91bGQgYmUNCj4gdXNlZCBmb3IgZG1hIHdyaXRlLiBUaGlzIGlz
IHRoZSBmaXJzdCBlbnRyeSBpbiB0aGUgYnVmIGxpc3QuDQo+IG10a19jYW1fZmJjX2luYyBpcyB1
c2VkIHRvIGluY3JlYXNlIHRoZSBudW1iZXIgb2YgYXZhaWxhYmxlIHVzZXIgc3BhY2UgYnVmZmVy
cy4NCj4gDQo+IElmIHRoZSBidWZmZXIgbGlzdCBpcyBub3QgZW1wdHkgYW5kIHVzZXIgc3BhY2Ug
Y2FsbHMgYnVmX3F1ZXVlIGFnYWluLA0KPiB3ZSBuZWVkIHRvIGNhbGwgbXRrX2NhbV9mYmNfaW5j
IHRvIGluY3JlYXNlIHRoZSBudW1iZXIgb2YgYXZhaWxhYmxlDQo+IHVzZXIgYnVmZmVycywgYnV0
IHdlIGRvbid0IHdhbnQgdG8gY2hhbmdlIHRoZSBidWZmZXIgZm9yIERNQSB3cml0ZS4NCj4gDQo+
IG10a19jYW1zdjMwX3VwZGF0ZV9idWZmZXJzX2FkZCBpcyBjYWxsZWQgb24gaXJxIHRvIHVwZGF0
ZSB0aGUgYWRkcmVzcw0KPiB0byB0aGUgbmV4dCBidWZmZXIgKGlmIGF2YWlsYWJsZSkuDQoNCkkg
dGhpbmsgY3VycmVudCBkZXNpZ24gaXMgT0suDQpJIGp1c3QgdGhpbmsgaXQgY291bGQgaGF2ZSBt
b3JlIGZsZXhpYmxlIGRlc2lnbi4NCkZvciBleGFtcGxlLCByZWR1Y2UgZnJhbWUgcmF0ZSBmcm9t
IDMwIGZwcyB0byAxNSBmcHMuDQpBbmQgdGhpcyBpcyBhIHRpbWUgc2VxdWVuY2UgdG8gcmVkdWNl
IGZyYW1lIHJhdGU6DQoNCnQgPSAtNSBtcywgc2V0IGJ1ZjEgYWRkcmVzcyBhbmQgZmJjIGluY3Jl
YXNlLiAoaGFyZHdhcmUgaW5kZXggPSAwLCBzb2Z0d2FyZSBpbmRleCA9IDEpDQp0ID0gMCBtcywN
CnQgPSAzMyBtcywgYnVmMSBpcyBkb25lLCBkbyBub3Qgc2V0IG5leHQgYnVmZmVyLiAoaGFyZHdh
cmUgaW5kZXggPSAxLCBzb2Z0d2FyZSBpbmRleCA9IDEpDQp0ID0gNjcgbXMsIHNldCBidWYyIGFk
ZHJlcyBhbmQgZmJjIGluY3JlYXNlLiAoaGFyZHdhcmUgaW5kZXggPSAxLCBzb2Z0d2FyZSBpbmRl
eCA9IDIpDQp0ID0gMTAwIG1zLCBidWYyIGlzIGRvbmUsIChoYXJkd2FyZSBpbmRleCA9IDIsIHNv
ZnR3YXJlIGlkZXggPSAyKQ0KDQpJZiB3YW50IHRvIGtlZXAgdGhlIDMwIGZwcywgd2hlbiB0ID0g
MzNtcywgc2V0IGJ1ZjIgYWRkcmVzcyBhbmQgZmJjIGluY3JlYXNlLg0KDQpJZiB5b3Ugd2FudCB0
byBrZWVwIGN1cnJlbnQgZGVzaWduLCB0aGF0J3MgT0sgZm9yIG1lIGJlY2F1c2Ugbm93IGhhcyBu
byByZXF1aXJlbWVudCBmb3Igc3VjaCBhZHZhbmNlZCBjb250cm9sLg0KDQpCdXQgSSBoYXZlIGEg
bmV3IHF1ZXN0aW9uLCBpbiB0aGUgdGltZSBzZXF1ZW5jZSBJIGxpc3QsIGRvZXMgaXQgaGFzIGlu
dGVycnVwdCB3aGVuIHQgPSAwICh0aGUgZmlyc3QgdmJsYW5rKSA/DQpJZiB0ID0gMCBoYXMgbm8g
aW50ZXJydXB0LCBJIHRoaW5rIHQgPSA2NyBhbHNvIGhhcyBubyBpbnRlcnJ1cHQgYW5kIG15IGRl
c2lnbiB3b3VsZCBub3Qgd29yay4NCkl0IHQgPSAwIGhhcyBpbnRlcnJ1cHQsIEkgdGhpbmsgc29m
dHdhcmUgc2hvdWxkIHRoaW5rIHRoaXMgYnVmZmVyIGlzIG5vdCBkb25lLg0KDQo+IA0KPiBNYXli
ZSB0aGUgbmFtZSBtdGtfY2Ftc3YzMF91cGRhdGVfYnVmZmVyc19hZGQgaXMgY29uZnVzaW5nIHRo
ZW4/DQo+IFdoYXQgZG8geW91IHRoaW5rIGFib3V0Og0KPiAtIG10a19jYW1zdjMwX3VwZGF0ZV9i
dWZmZXJzX2FkZCAtPiBtdGtfY2Ftc3YzMF91cGRhdGVfYnVmZmVyc19hZGRyZXNzDQoNCm10a19j
YW1zdjMwX3VwZGF0ZV9idWZmZXJzX2FkZHJlc3MgaXMgYmV0dGVyLg0KDQo+IC0gbXRrX2NhbV9m
YmNfaW5jIC0+IG10a19jYW1zdjMwX2J1ZmZlcl9hZGQNCg0KbXRrX2NhbV9mYmNfaW5jIGlzIGJl
dHRlciwgaXQgc2hvdyBjb3VudGVyIGluY3JlYXNlLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4g
Q2hlZXJzDQo+IEp1bGllbg0KPiANCj4gID4gUmVnYXJkcywNCj4gPiBDSw0KPiA+IA0KPiA+ID4g
KyAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjYW0tPmJ1Zl9saXN0X2xvY2ssIGZsYWdz
KTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiANCj4gPiANCj4gPiAqKioqKioqKioqKioqIE1F
RElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioNCj4gPiBU
aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGlu
ZyBhbnkNCj4gPiBhdHRhY2htZW50cykgbWF5IGJlIGNvbmZpZGVudGlhbCwgcHJvcHJpZXRhcnks
IHByaXZpbGVnZWQsIG9yIG90aGVyd2lzZQ0KPiA+IGV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5k
ZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZQ0KPiA+IGNvbnZleWVkIG9u
bHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNzZW1pbmF0aW9u
LA0KPiA+IGRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBvciBjb3B5aW5nIG9mIHRo
aXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzDQo+ID4gYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQg
cmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heQ0KPiA+IGJlIHVubGF3
ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWws
IG9yIGJlbGlldmUNCj4gPiB0aGF0IHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVy
cm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXINCj4gPiBpbW1lZGlhdGVseSAoYnkgcmVwbHlp
bmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55IGFuZCBhbGwgY29waWVzIG9mDQo+ID4gdGhp
cyBlLW1haWwgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFu
ZCBkbyBub3QNCj4gPiBkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkg
b3RoZXIgcGVyc29uLiBUaGFuayB5b3UhDQo=

