Return-Path: <linux-media+bounces-23284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0889A9EE4EF
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5103D281C45
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 11:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D240621170A;
	Thu, 12 Dec 2024 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cG/pUwW2";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="I5CQi8nL"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344291C5497;
	Thu, 12 Dec 2024 11:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734002703; cv=fail; b=T3H/A3rvdJD4jh2J5GpKBYunJs6QT1bNP5NsXcbH/grd5CQVr1fMI6FYykl55lj92cgnNAgD6n/suM12FGuatf3SFitUraIngmZZx1gbXHn9aPV8uKDRuRAYnBUZVExmPreLpII+CwjODFHZxyTx3mFzR7Pq+jp0zCEPb1l8/kY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734002703; c=relaxed/simple;
	bh=xrgjaxmphWi9X6Z77+drmjWU/tnSTZVKXjVOW53XlAQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mHu/4n2fq3y1g5c38nixOh77wuUljWPfE09CLcdbU9X1am+xTbIsjDfpEociSM/twNyKwxq1Vhm3EHyrtY56AJyVv/54vEYzrWNKMl4aGxpLz6mJVOV4A+aOZqtRfHI/qTDp7rCWlUVynfHRn9EggepKctS32FdeGi4LVB7hBU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cG/pUwW2; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=I5CQi8nL; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b587b006b87b11efbd192953cf12861f-20241212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=xrgjaxmphWi9X6Z77+drmjWU/tnSTZVKXjVOW53XlAQ=;
	b=cG/pUwW2VaKX9DZjHhFyOeFmb9Bv+XWolboiJXSVhYMI/RUvwi+h5J3DJqyMF641kOcsjFjnWKL2esd4KLeGYGKyGm1pLqcg/MHcroMFxuFE/OUriKXu+5gzGKmpeIJLm9x+mTmJMW24NR9rdgCZHrRxYuaIyCeZkpUsw9mmNfI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:db5f3cfe-b7af-46dc-b363-0194f7f996fa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:72f16928-d2eb-4de2-b5c9-495d1bc17256,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b587b006b87b11efbd192953cf12861f-20241212
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1823280295; Thu, 12 Dec 2024 19:24:53 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Dec 2024 19:24:52 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Dec 2024 19:24:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZLahgtfLFZz9q+h/mueVVOetn+m9yIMN0PS8qR529BHdm9vAhCT66TXBzJ1dnx/vzubFgz+SoerDARyTkiBNLF0Zspohy1tyZLbjTmy11P0w3F7Mw6s824P2lIGk8zgoxMghjQyt3vn2/lr4Y4blLnIBZNMJfndR6OTbrCRDat9/gNsyPMJRsXn7bEVL2KDT3bN/OIsxQAiJt7A12SShpL2Y2CS2N+s+veodaDTqqcy30KmiNJApcg4/6ojre2F/Yw+Sisiygd8Dl7LwOgl5FnP/RyYfmixQ11HUWmbwiQzKzfd1xdEuBNYs6F24I8Y2P8ZSjxKJrWGWd6QCNM5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrgjaxmphWi9X6Z77+drmjWU/tnSTZVKXjVOW53XlAQ=;
 b=e4PWGXE2Lb5sRPtcKqaMfNPI7PTa+fx+z9yBJ0/YRwLak0kdav6rDhgdh8dhInmOdAcMUZx087JC2uHD0fgwcyTo+v48kUiNXU0Kw5s2/P3QjIjdJFwEFU9asEu0Umtr2jbukTImSVEi8cWMP/HTD/MrgVY55yFWy075WguMBJdy54P36z5X1U32PP3kzwo2j3zJFr460xuM77DHU4JUg+x29i6NXCi7E3V+CuO3/2qJEYkVZlKgczIuFEzv2AyDumjbz4MZ+kGTrWgFvDSwEOgdNgcla22+reaRsLNPfea5NGQjlWr9shzW/PCBncyxWVDVFNGhAdLWuS6mroFXiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrgjaxmphWi9X6Z77+drmjWU/tnSTZVKXjVOW53XlAQ=;
 b=I5CQi8nLt+fLOFK3gkELL1T5PCr0I58JXZLKvgWr5Fjr78o13M66COBjcGZEalWOupanDIiUtRY7f/7GzrVWQwbDsY+zjTyho151DNJ7epzUk8q4gbPS/Q8sxMkt8f/JXl6+XfEjVhD0MaLK9/O5W91GL8Yyij8nRmH3FVjfWPs=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by JH0PR03MB7730.apcprd03.prod.outlook.com (2603:1096:990:8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 11:24:48 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 11:24:47 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"robh@kernel.org" <robh@kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
	<Xavier.Chang@mediatek.com>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: mailbox: mediatek: Add GCE header
 file for MT8196
Thread-Topic: [PATCH v2 1/8] dt-bindings: mailbox: mediatek: Add GCE header
 file for MT8196
Thread-Index: AQHbS3wqkgkOb2qikki77NU3E0fbTbLgycKAgAEkjQCAAEdmgIAARDaA
Date: Thu, 12 Dec 2024 11:24:47 +0000
Message-ID: <ce68d58f78d12317cab689e0ee1c02dc373d50dc.camel@mediatek.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
	 <20241211032256.28494-2-jason-jh.lin@mediatek.com>
	 <ozifi65uycmxc5hqeu4onbths5u7dg532iufjxplsjw4jjmhf6@6bdsaabd7hl7>
	 <04f7bd2a7d69ab7d02c88cf05bda5ae0c4cb6573.camel@mediatek.com>
	 <e9caf0fe-a77f-40cb-9fc3-9da3d95f27ca@kernel.org>
In-Reply-To: <e9caf0fe-a77f-40cb-9fc3-9da3d95f27ca@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|JH0PR03MB7730:EE_
x-ms-office365-filtering-correlation-id: dad42fdf-e788-45ba-5e1f-08dd1a9f95bc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RndHc2t0OVUxZmdGbFNiVmVYVlFmRytHSEVTelpHc1ZYYXpKOGViWGNPdXRU?=
 =?utf-8?B?R1NrUWhpWGt5NGlkSVFuV2RKWm5GektiaE5PbmV2dXNYVXc3bW1GSlJMbkN2?=
 =?utf-8?B?NFFmM3dBVzdBVFVXc1oySENJZS9vdVRzc1NDWldJRCtBd3JvTWU1V3h4QXFj?=
 =?utf-8?B?WlFDUTQxSjdOK1JYWHdETmZyV3A1SjNYckdUNHo3akdmQlV6WVJlMXZxYkUw?=
 =?utf-8?B?RmxhOGRJZUJMeVo5OUVpZ09pbmdnOFRaaStjZGRncTFuT1k5NFRVVHVvSnZU?=
 =?utf-8?B?djg3WjJOa04xSU9VaVNRaDFyaGx3THNkUG9LeWFiV2dnaVBTSzVqdHFsZWRt?=
 =?utf-8?B?QU95Z2RtOVdTeE1TQUZoVW1jbkZvdkhQaitsY3J4VVNSaVI0UTZXcEkrUHBB?=
 =?utf-8?B?b21HYmJURlgxa3NNR3FkNUtxbnlIQ0pmTmpPTFBOSmNFL3hxa2lCRU1EQjRs?=
 =?utf-8?B?TnlDRlRWYkZ6ZjlobmF2UTVWUDhOUEJzc2pIRVBUSmtkWmUwaWJDS1NDc1ps?=
 =?utf-8?B?bDVDcXFHaUdFejJtQ3IrSU5kQXl5REx3SjFJeXNScXU3L2t0ZTZiTTZndlNz?=
 =?utf-8?B?ZVpsL2xoanVOV29wajN6blk5eTNwd2gwc1VsT1k0MTFjdGZjaWhRL3BrQ0M2?=
 =?utf-8?B?aWg2M2NiaGtCU0NsR0FtbWx5T2RSYXFyNjc2QjF6Y3MyVGNoNDFodWxzSkZX?=
 =?utf-8?B?a243bVVicitNMS9qM0ZLRUUyeHNSdlhrRjlscVh3R3lDcjliTHVpZndPODds?=
 =?utf-8?B?WkR5L1FkLysrL213RjlsUldPM21oYUp5SllyNytNOWh1YzVvclNkOHBmNHUz?=
 =?utf-8?B?cThOR3F1cGpGSnBPTmt5NCtEeGwyUTM1c0p3L1dsZEV2OGNmeWk5bVFBclpN?=
 =?utf-8?B?WEw2SHo0UnFsTG5VeCt2ZEpPUXhOeGlmYmM2aCtWaG9KbVUrK1VOSGN0VGpk?=
 =?utf-8?B?RjFlSExtVldUdHo3SDhpdGNCZHUvTXUyOWh4azRsaVl6SGE5SGQ0RFQvKzBV?=
 =?utf-8?B?WUZRZ0pBdm96QWdFZDVZVTZabTdHWUtlMDViWGtVQXhmQ1lwVUYxS08zMmEz?=
 =?utf-8?B?NlRDNm5DVkc2OTBBdGlSNkxKdjBZdjlEN1llYmRkTDZFRTQ3dVd3TzdYdjBo?=
 =?utf-8?B?K0dCaG16bnNMNEJjWm1wZCtYdU96aGdTNHJNM3FXSDVKNkZwZFFPNWEvSzFa?=
 =?utf-8?B?alFHMDhHY0svVHRlYjVtL1pWTnZyY1I3RzlQMTJCT2VMcFRnUm5EQnkzbW4z?=
 =?utf-8?B?L0RsaHZ0QmppRXpHYUIwRnpXYzY3K2tCOTRPN2xLYzY5MjFVV1MwVmNVRk40?=
 =?utf-8?B?dVZkUzUzaldLemlJZmhtN2xaTHpFWEJmcjc2VHRPUzlPUEVXTEppcGxhTFBM?=
 =?utf-8?B?QmFPbHBDa3pUOEhlcGNKR3pGT2FkMy9wZElCc0l6L1lVWG03bmdqVzBURnVq?=
 =?utf-8?B?N1FLTDIzc1NFNUxraHJ0b0xQZEV4VW9GUmtselhxd2VVbFdwcytlaFprUVlU?=
 =?utf-8?B?QTh2M2JTTllETjRWa0M1MGppV2ZDMVdWMjdseVlYR1ZWUTlEYldQNks4MG8r?=
 =?utf-8?B?MEM0ejFQc2EwTjJ6eTFNbXpSWldzbkEraERjanMzdUw1N0pUY3h0WTNOdFl6?=
 =?utf-8?B?Wm9rYTYvQjlDWnZESy9ZLy9IaVh6b2g2ei8yZ0FSUGhWRG8wczA1TnA1NVQ3?=
 =?utf-8?B?TDR5WmV3UUFzbEUwUWtFRTZuTjhhQjlDdlRRYXlpQ09GMmlMUFNGaFZuRUtk?=
 =?utf-8?B?N3AybnJkbGdOMTc4VU9JKzcwM3IwT2xTcDJKVUpBWXdseE85N0tnNjVJYUtx?=
 =?utf-8?B?MTkwRzJQQjMxN3lMZzZad0xqbURLbDdEWlJLY29DZzd1TkQ1ckNDc1JINVBm?=
 =?utf-8?B?OXBmV1FpWHpoSEtjM2xHWFEvNzVXZlhOdGpXdTkzb05LV2dmZGhIMUZ6blhz?=
 =?utf-8?Q?mj5F460/+TpbUHAAlYLIUVA8Fhm+NDSH?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHBnR3RHdTVrSnNDQ0pWZnRva2gzUHBKOUM3aDRkWk9IT2dKWXNVclRRNVN2?=
 =?utf-8?B?Y1M2L3FIMlAvZzdaZ2JodUZBRGlqR3pNam43SWQzSjVPLzNhNUttVEFQaVk2?=
 =?utf-8?B?MDJpYmErZlFlNy9WTlNTaW9aUDR2RnIvbUpkOUJSQ3ovY01HVHZiZWxDWnlE?=
 =?utf-8?B?ZGswOS9xZnY0S09vck1VZjRucTlsMEhZS2o3UHhMS2VpV2h2R1JucFZPWnVs?=
 =?utf-8?B?SEN2Yk8wdzFoWTNMemxiUXhyOHRsSjVrZ2k4RXd5M1dGUFlaQ1pBZ213YkdX?=
 =?utf-8?B?NE5KY2RteXpPcklWY1VkVmx4aUxVS3J4LzR6THFVOUZkYm95NDMvU0dDdi9m?=
 =?utf-8?B?M2JDeSsrTUdxVlhVcnZGRzFZU1hKR1hhMDBJOVAxNVRQT2dvRFF5Q0hYakVj?=
 =?utf-8?B?S1hzTGU3djhob0NnZ3Z0cUNJeTFlcVk5NEZhMENZdk9PcHZqT0RPQVNUWkdH?=
 =?utf-8?B?L0diSGROMDUyRkxZbkJWTGJqVHRBWFdTOVg3T0F4R3hHQVQxTDRKRjA0VGdp?=
 =?utf-8?B?LzNrOGl0MU5Ha3RHaW4wMW53ZFNGNlFscDJxQ1ZDcXZrZXBGU2pCNUxXdzF2?=
 =?utf-8?B?RVBEZ1ZoUGIvRkVXMjVmUTFiNmJqeGlDdHJuMVYrOXRMT1dteTBmMURMY0M2?=
 =?utf-8?B?YitRbFBDd0NpR2ExN01oME5Wb3dDYmZiMmJ4SFlwSm90b0w1SVBHbUJCSmRp?=
 =?utf-8?B?dmtxVjNZdVNLN3EyMFdUM3hrRG5XZnZZK2Zra3Y2T0ZUMGhra2RFRlkwRU9F?=
 =?utf-8?B?eWE4Skg5MWdWc0tpZzlaSE1lWmVmeVpJblh1UGJUa3dia3JJMzEvZjNtd2Vo?=
 =?utf-8?B?M2lXZzNrVkZ1Y0IrVTJMQkkxdlViYnhhMUMwdjF4TStvOERmVkgwdy9yQWlZ?=
 =?utf-8?B?VUVKWDNuMWJhQlRaMUFieU80RStaQTE5UEFyMWFsQktLSVFlcTVLdEJlZE11?=
 =?utf-8?B?QTV6R2kyM3NYN2czMWhobDZPUEFGUXpFRGVGdEVlSU5LVkJCSkNPdkR0cDk3?=
 =?utf-8?B?dGk0OXc1eUdhRVZlUDU3V2EzRGI4ckJCV1l2bEkrNWQrcXNIQWlwd2RnM2hq?=
 =?utf-8?B?dXZqRyt4OEdTVTZTZ0JLOGZ1dmNLWEc5ZjBCWjRMaGJQYnFrMUxNTC83UlpW?=
 =?utf-8?B?dGtqejREZlhoV05WMzRrbXJnZHp2ZTFjOHZhREpTRWVwdWZPc0VoQ0tUYUZC?=
 =?utf-8?B?OVlkVHBpdHo4OGtnSFVJVmx4SmFTYjlwZFJWZW1YNUg2dmRucGI3ZTNXWFVH?=
 =?utf-8?B?MFpybW1CT09IUDBmdjdidmF0WW1UTU4vRXVUSGdCM3htK1YzS1BYNWdJR2pC?=
 =?utf-8?B?aHI3ZENMZUJiWHhTV25oaUo1NitPWHJSR0JuS1VsMllET1JnMit5ZFFjYlov?=
 =?utf-8?B?OWhyemFwcjRPd2diaVI0SUYzbGN6UFM4MFRDV2lwU2FoY0NwZ2s2aGdlRTQ4?=
 =?utf-8?B?Qng4OE1UNm9zTzRtRngzejRPUXYzY2VpbU1XT3MrQW5nZGpTZW5xL2xHUDRM?=
 =?utf-8?B?N09BOEhQblczTW04b3hVb2R5RkZmL0F6NzQwRm5naWNEeDY5WkJWY3Jxa2Ry?=
 =?utf-8?B?ZWViSHQ4ZnZmeGorMnJJWm83VHUyRjhvZzN6Y0QxdVFHOUppVjdKSUtyZ3VP?=
 =?utf-8?B?eEZ3U01vZVpMVGJBMUFLVmhIYkpzTk1VK2NUcWJ5YTU2OGpCdHdZY3VqQ295?=
 =?utf-8?B?Y1pGaE5VNTVqbUZsTkk0RzdBTUd1MytRSyt6cFN5VmU0WU8yVjYrck1pU0ll?=
 =?utf-8?B?RTRTRFEvZU9CbFh0NjZ0ZkdjbEJUZVJRR3daamd1Nk5iaWxRQ1IwYldFUWEr?=
 =?utf-8?B?N2o0ekdDTEtXa05GbUhGSmhuSWNiSkhjbmxyRTViZ25SQzF1L2wwbjBFOVJl?=
 =?utf-8?B?QmU1NVJxNlZKVzBtMW5OUU40QllwYXlidDZVNHNtUmg4bzNYNHZOM3VTNGpt?=
 =?utf-8?B?eE1TNGpGYXRNVU1SVHJqZE5HR1VVcFJOTEsvUnRXcHhldGhlMjdIMHF1ZlFM?=
 =?utf-8?B?VDBDeVAyeEpyZkZVMEZJSlZBT281b3ZHYUREM21wSVBqQVExcDdzQVFveDMw?=
 =?utf-8?B?RWVmQWlIL2ZLelRkTVN5ZGVHVVl1QlY4ZE9lWTJBamtzUnBNOGRTUjZTNHlG?=
 =?utf-8?B?WXpYVHdnYStHUitUakFsOWpKRk5tYUkrYmlhRGhhRjVyRGVUbi9kRWw3QVZO?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F6A434505915F408E7A0749E5EAD440@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dad42fdf-e788-45ba-5e1f-08dd1a9f95bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 11:24:47.0214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tTr2abIQmavLfDzz9nVE+C3/mxQG6q0qESG+93DnfMFaxwUvEeGbqen1N1Cx5bi2tGe+Z+aMKonlCN+Duyp/r/L48JM3fCsvQHP7wMJ7uYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7730

T24gVGh1LCAyMDI0LTEyLTEyIGF0IDA4OjIwICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDEyLzEyLzIwMjQgMDQ6MDUsIEphc29uLUpIIExpbiAo
5p6X552/56WlKSB3cm90ZToNCj4gPiBIaSBLcnp5c3p0b2YsDQo+ID4gDQo+ID4gVGhhbmtzIGZv
ciB0aGUgcmV2aWV3cy4NCj4gPiANCj4gPiBPbiBXZWQsIDIwMjQtMTItMTEgYXQgMTA6MzcgKzAx
MDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBs
ZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cw0KPiA+ID4gdW50aWwN
Cj4gPiA+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4g
PiANCj4gPiA+IA0KPiA+ID4gT24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgMTE6MjI6NDlBTSArMDgw
MCwgSmFzb24tSkguTGluIHdyb3RlOg0KPiA+ID4gPiBBZGQgdGhlIEdsb2JhbCBDb21tYW5kIEVu
Z2luZSAoR0NFKSBoZWFkZXIgZmlsZSB0byBkZWZpbmUgdGhlDQo+ID4gPiA+IEdDRQ0KPiA+ID4g
PiB0aHJlYWQgcHJpb3JpdHksIEdDRSBzdWJzeXMgSUQgYW5kIEdDRSBldmVudHMgZm9yIE1UODE5
Ni4NCj4gPiA+IA0KPiA+ID4gVGhpcyB3ZSBzZWUgZnJvbSB0aGUgZGlmZi4gV2hhdCB3ZSBkbyBu
b3Qgc2VlIGlzIHdoeSBwcmlvcml0eSBpcw0KPiA+ID4gYQ0KPiA+ID4gYmluZGluZy4gTG9va2lu
ZyBicmllZmx5IGF0IGV4aXN0aW5nIGNvZGU6IGl0IGlzIG5vdCBhIGJpbmRpbmcsDQo+ID4gPiB0
aGVyZQ0KPiA+ID4gaXMNCj4gPiA+IG5vIGRyaXZlciB1c2VyLg0KPiA+ID4gDQo+ID4gDQo+ID4g
VGhpcyBwcmlvcml0eSB2YWx1ZSBpcyB1c2VkIHRvIGNvbmZpZ3VyZSB0aGUgcHJpb3JpdHkgbGV2
ZWwgZm9yDQo+ID4gZWFjaA0KPiA+IEdDRSBoYXJkd2FyZSB0aHJlYWQsIHNvIGl0IGlzIGEgbmVj
ZXNzYXJ5IGhhcmR3YXJlIGF0dHJpYnV0ZS4NCj4gDQo+IEkgZGlkIG5vdCBzYXkgdGhlc2UgYXJl
IG5vdCAiaGFyZHdhcmUiLiBJIHNhaWQgdGhlc2UgYXJlIG5vdA0KPiBiaW5kaW5ncy4NCj4gQnJp
bmcgYXJndW1lbnRzIHdoeSB0aGVzZSBhcmUgYmluZGluZ3MuDQo+IA0KDQpOb3Qgb25seSBicmlu
Z2luZyBhcmd1bWVudHMsIHdlIHVzZSBpdCB0byBjb25maWd1cmUgZWFjaCBHQ0UgdGhyZWFkJ3MN
CnByaW9yaXR5Lg0KDQpQbGVhc2UgZm9yZ2l2ZSBtZSB0byBhc2sgYSB0cml2aWFsIHF1ZXN0aW9u
Lg0KRG8geW91IG1lYW4gaWYgdGhlcmUgaXMgbm8gZHJpdmVyIHVzaW5nIGl0IGRpcmVjdGx5LCB0
aGVuIGl0IGNhbiBub3QgYmUNCmEgYmluZGluZz8NCk9yIGNvdWxkIHlvdSBnaXZlIG1lIGFuIGV4
YW1wbGUgZm9yIHdoYXQgc2hvdWxkIGJlIGJpbmRpbmcgYW5kIHdoYXQNCnNob3VsZCBub3QgYmUg
YmluZGluZz8NCg0KDQpDb25zaWRlcmluZyB0byB0aGVzZSAzIHBvaW50cywgSSB0aGluayBHQ0Ug
dGhyZWFkIHByaW9yaXR5IGlzIHN1aXRhYmxlDQp0byBiZSBwYXJ0IG9mIHRoZSBEZXZpY2UgVHJl
ZSBCaW5kaW5nOg0KDQoxLiBEZXNjcmliaW5nIEhhcmR3YXJlIFByb3BlcnRpZXMNCi0gVGhlIERl
dmljZSBUcmVlIGlzIGEgZGF0YSBzdHJ1Y3R1cmUgZm9yIGRlc2NyaWJpbmcgaGFyZHdhcmUsIGFu
ZCBHQ0UNCnRocmVhZCBwcmlvcml0eSwgYXMgcGFydCBvZiB0aGUgaGFyZHdhcmUsIHNob3VsZCBi
ZSBkZXNjcmliZWQgaW4gdGhlDQpEZXZpY2UgVHJlZS4NCg0KMi4gRHJpdmVyIFVzYWdlDQotIERl
dmljZSBUcmVlIGRhdGEgaXMgdXNlZCBieSBkcml2ZXJzIHRvIGluaXRpYWxpemUgYW5kIGNvbmZp
Z3VyZQ0KaGFyZHdhcmUsIGFuZCBHQ0UgdGhyZWFkIHByaW9yaXR5IGlzIG5lY2Vzc2FyeSBjb25m
aWd1cmF0aW9uIGRhdGEgZm9yDQp0aGUgZHJpdmVyLiBBZnRlciBwYXJzaW5nIHRoZSBtYm94ZXMg
YXJncyBmcm9tIERUUywgQ01EUSBkcml2ZXIgdXNlIGl0DQp0byBjb25maWd1cmUgR0NFIHRocmVh
ZC4NCg0KMy4gU3RhbmRhcmRpemF0aW9uDQotIERldmljZSBUcmVlIGJpbmRpbmdzIHNob3VsZCBi
ZSBzdGFuZGFyZGl6ZWQsIGFuZCBHQ0UgdGhyZWFkIHByaW9yaXR5DQpzaG91bGQgaGF2ZSBjb25z
aXN0ZW50IG1lYW5pbmcgYW5kIHVzYWdlIGFjcm9zcyBkaWZmZXJlbnQgaGFyZHdhcmUNCnBsYXRm
b3Jtcy4gTG9va2luZyBpbnRvIHRoZSBsYXRlc3QgaGVhZGVyOiBtZWRpYXRlayxtdDgxODgtZ2Nl
LmgsDQptZWRpYXRlayxtdDY3OTUtZ2NlLmggYW5kIG10ODE5NS1nY2UuaCwgdGhleSBhbGwgaGF2
ZSBkZWZpbmVkIEdDRQ0KdGhyZWFkIHByaW9yaXR5Lg0KDQo+ID4gDQo+ID4gSXQncyBoYXJkIHRv
IGZpbmQgd2hlcmUgdGhlIHByaW9yaXR5IGlzIHVzZWQgaW4gZXhpc3RpbmcgZHJpdmVyDQo+ID4g
Y29kZQ0KPiA+IGJlY2F1c2Ugd2UgcGFyc2VkIGl0IGZyb20gRFRTLg0KPiANCj4gU28gbm90IGEg
YmluZGluZy4NCj4gDQo+ID4gDQo+ID4gSXQgaXMgdXNlZCBpbiBhbGwgbWVkaWFUZWtzJyBEVFMg
dXNpbmcgdGhlIEdDRS4NCj4gPiBGb3IgZXhhbXBsZSwgaW4gbXQ4MTk1LmR0czoNCj4gPiANCj4g
PiB2ZG9zeXMwOiBzeXNjb25AMWMwMWEwMDAgew0KPiA+ICAgICBjb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE5NS12ZG9zeXMwIiwgIm1lZGlhdGVrLG10ODE5NS0NCj4gPiBtbXN5cyIsDQo+ID4g
InN5c2NvbiI7DQo+ID4gICAgIHJlZyA9IDwwIDB4MWMwMWEwMDAgMCAweDEwMDA+Ow0KPiA+ICAg
ICBtYm94ZXMgPSA8JmdjZTAgMCBDTURRX1RIUl9QUklPXzQ+Ow0KPiA+ICAgICAjY2xvY2stY2Vs
bHMgPSA8MT47DQo+ID4gICAgIG1lZGlhdGVrLGdjZS1jbGllbnQtcmVnID0gPCZnY2UwIFNVQlNZ
U18xYzAxWFhYWCAweGEwMDANCj4gPiAweDEwMDA+Ow0KPiA+IH0NCj4gPiANCj4gPiBDTURRIGRy
aXZlcihtdGstY21kcS1tYWlsYm94LmMpIHdpbGwgZ2V0IHRoZSBhcmdzIHBhcnNlZCBmcm9tDQo+
ID4gbWJveGVzDQo+ID4gcHJvcGVydHkgaW4gY21kcV94bGF0ZSgpIGFuZCB0aGVuIGl0IHdpbGwg
c3RvcmUgQ01EUV9USFJfUFJJT180IHRvDQo+ID4gdGhlDQo+ID4gc3BlY2lmaWMgdGhyZWFkIHN0
cnVjdHVyZS4NCj4gDQo+IFNvIG5vdCBhIGJpbmRpbmcuDQo+IA0KPiA+IFRoZSB1c2VyIG9mIENN
RFEgZHJpdmVyIHdpbGwgc2VuZCBjb21tYW5kIHRvIENNRFEgZHJpdmVyIGJ5DQo+ID4gY21kcV9t
Ym94X3NlbmRfZGF0YSgpLCBhbmQgdGhpcyBwcmlvcml0eSBzZXR0aW5nIHdpbGwgYmUgY29uZmln
dXJlZA0KPiA+IHRvDQo+ID4gR0NFIGhhcmR3YXJlIHRocmVhZC4NCj4gDQo+IEFuZCBvdGhlciB0
aGluZ3MgdGhlcmUgYXJlIHRoZSBzYW1lLCB3ZSBkbyBub3QgdGFsayBvbmx5IGFib3V0IHRoaXMN
Cj4gb25lDQo+IHRoaW5nLiBJIGFza2VkIGxhc3QgdGltZSB0byBkcm9wIHdoaWNoIGlzIG5vdCBh
IGJpbmRpbmcuDQo+IA0KPiANCg0KSSBqdXN0IHJlZmVyZW5jZSBhbGwgdGhlIHByZXZpb3VzIG1l
ZGlhdGVrLG10WFhYWC1nY2UuaCB0byBhZGQgdGhlIHNhbWUNCmJpbmRpbmcuIEV4Y2VwdCBmb3Ig
dGhlIEdQUiBwYXJ0IEkgYWRkZWQgdGhpcyB0aW1lLCBJIGRvbid0IGtub3cgd2hhdA0KZWxzZSBz
aG91bGQgYmUgZHJvcHBlZC4NCg0KPiAuLi4NCj4gDQo+ID4gPiA+ICsNCj4gPiA+ID4gKy8qDQo+
ID4gPiA+ICsgKiBHQ0UgR2VuZXJhbCBQdXJwb3NlIFJlZ2lzdGVyIChHUFIpIHN1cHBvcnQNCj4g
PiA+ID4gKyAqIExlYXZlIG5vdGUgZm9yIHNjZW5hcmlvIHVzYWdlIGhlcmUNCj4gPiA+ID4gKyAq
Lw0KPiA+ID4gPiArLyogR0NFOiB3cml0ZSBtYXNrICovDQo+ID4gPiANCj4gPiA+IFRoYXQncyBh
IGRlZmluaXRlIG5vLWdvLiBSZWdpc3RlciBtYXNrcyBhcmUgbm90IGJpbmRpbmdzLg0KPiA+ID4g
DQo+ID4gDQo+ID4gSSdtIHNvcnJ5IHRvIHRoZSBjb25mdXNpb24uDQo+ID4gDQo+ID4gVGhlc2Ug
ZGVmaW5lcyBhcmUgdGhlIGluZGV4IG9mIEdDRSBHZW5lcmFsIFB1cnBvc2UgUmVnaXN0ZXIgZm9y
DQo+ID4gZ2VuZXJhdGluZyBpbnN0cnVjdGlvbnMsIHRoZXkgYXJlIG5vdCByZWdpc3RlciBtYXNr
cy4NCj4gDQo+IEluZGV4IG9mIHJlZ2lzdGVyIGlzIGFsc28gc291bmRpbmcgbGlrZSByZWdpc3Rl
ci4NCj4gDQo+ID4gDQo+ID4gVGhlIGNvbW1lbnQgIi8qIEdDRTogd3JpdGUgbWFzayAqLyIgaXMg
YnJpZWZseSBkZXNjcmliZSB0aGF0IHRoZQ0KPiA+IHVzYWdlDQo+ID4gb2YgR0NFX0dQUl9SMCBh
bmQgR0NFX0dQUl9SMDEgaXMgdXNlZCB0byBzdG9yZSB0aGUgcmVnaXN0ZXIgbWFzaw0KPiA+IHdo
ZW4NCj4gPiBHQ0UgZXhlY3V0aW5nIHRoZSBXUklURSBpbnN0cnVjdGlvbi4gQW5kIGl0IGNhbiBh
bHNvIHN0b3JlIHRoZQ0KPiA+IHJlZ2lzdGVyDQo+ID4gbWFzayBvZiBQT0xMIGFuZCBSRUFEIGlu
c3RydWN0aW9uLg0KPiA+IA0KPiA+IEkgd2lsbCBhZGQgbW9yZSB3b3JkcyB0byBtYWtlIHRoaXMg
Y29tbWVudCBjbGVhcmVyLCBsaWtlIHRoaXM6DQo+ID4gLypHQ0U6IHN0b3JlIHRoZSBtYXNrIG9m
IGluc3RydWN0aW9uICovDQo+IA0KPiBOb3Qgc3VyZSwgYmVjYXVzZSBJIGZlZWwgeW91IGp1c3Qg
YXZvaWQgZG9pbmcgd2hhdCBpcyByaWdodCBhbmQga2VlcA0KPiBwdXNoaW5nIHlvdXIgb3duIG5h
cnJhdGl2ZS4gV2hlcmUgaXMgaXQgdXNlZCBpbiB0aGUgZHJpdmVyPw0KPiANCj4gSSBqdXN0IGxv
b2tlZCBmb3IgIkdDRV9HUFJfUjAwIiAtIG5vIHVzYWdlIGF0IGFsbC4gU28gbm90IGEgYmluZGlu
Zy4NCj4gDQoNCkN1cnJlbnRseSwgR0NFX0dQUl9SMTUgaXMgdXNlZCBmb3IgZ2VuZXJhdGluZyBQ
T0xMIGluc3RydWN0aW9uIGFuZCBpdA0KaGFzIGJlZW4gZGVmaW5lZCBhcyBhIE1BQ1JPIGAjZGVm
aW5lIENNRFFfUE9MTF9BRERSX0dQUiAoMTUpYA0KaW4gbXRrLWNtZHEtaGVscGVyLmMuDQoNCk90
aGVycyBHUFJzIGFyZSBub3QgdXNlZCBjdXJyZW50bHkgYW5kIHRoZXkgY2FuIGJlIGRlZmluZSBh
cyBNQUNSTyBpbg0KdGhlIHNhbWUgd2F5IG9mIEdDRV9HUFJfUjE1LCBzbyBJIGNhbiBkcm9wIHRo
ZXNlIEdQUiBkZWZpbmUgaW4gdGhlIG5leHQNCnZlcnNpb24uIFBlcmhhcHMgdGhlIFNvQ3MgaW4g
dGhlIGZ1dHVyZSBoYXMgY2hhbmdlZCB0aGUgcnVsZXMgb2YgR1BSDQppbmRleCwgd2UgY2FuIGFk
ZCBpdCBiYWNrIGFuZCBnZXQgdGhlbSBmcm9tIERUUy4NCg0KUmVnYXJkcywNCkphc29uLUpILkxp
bg0KDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=

