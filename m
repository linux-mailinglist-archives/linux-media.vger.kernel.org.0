Return-Path: <linux-media+bounces-40347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0CBB2D651
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 10:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD27D3B2ABF
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 08:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012BE2D877F;
	Wed, 20 Aug 2025 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NwddQVtf";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="fWOE3p0k"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8481B2522B1;
	Wed, 20 Aug 2025 08:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755678262; cv=fail; b=CISRdKGxhQjbE3IfYz6BN8fEGy23ITLgH61S8NrSB1Qbfmsg/98D4nDe5g8Q74mUwdYdnLe/DEZT1NN25lcxCdVjD0R0El9HwECEDAW3t4gDNSI4F8gofIUCuCD3O+ypw2spjyqb1sVj2uQI+02cW6ItZCtMzAoNJGE/5D4FIEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755678262; c=relaxed/simple;
	bh=0kvSXFpaVCQxPy7b1VdZJxUidDItHhFi7kniCpqAjnQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p6nkBVUzzQLwrcc/19k2bF6WYfIR7/DkNIg+y8fvN7E+zru7s3bTb5FMsJQMHsjrxHO4HxIoz06GtYNUIiqZVpxHeO2B2dO5qOEjMZyDv1DbkJDRs/AzUwU9I1OOTMiVY3vhJXHVvKgNU5gu6wcIlakk8VFPosyu9qDVQ4SwqtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NwddQVtf; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=fWOE3p0k; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 09bb9b687d9f11f08729452bf625a8b4-20250820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=0kvSXFpaVCQxPy7b1VdZJxUidDItHhFi7kniCpqAjnQ=;
	b=NwddQVtf2NuEa3jnQYPI06fYFWYrWk8gu/2xaHV6CDItHs+nh7fCYY3twSklSoqbq6vJHCHcQDrKPnGL+bsdzDmzixc8hwI8Sv1P3+flj9XEXtWLtvA0MYuaZNbHzYmU0sTqt6qVdLWsJIfuoimzIEtIV8nHGERVKSXJHHDcTbI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:c53f448d-477b-492c-8bb2-5033b3efb49d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:098e1ff4-66cd-4ff9-9728-6a6f64661009,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 09bb9b687d9f11f08729452bf625a8b4-20250820
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 149475119; Wed, 20 Aug 2025 16:24:06 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 20 Aug 2025 16:24:03 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 20 Aug 2025 16:24:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRbpuWS66Kbrp9glahg0JexbQuajoVMh9lCVKtPVfISLGLeNc4Ytn7YayQzKSIyxzlcImmxphoTHaCzD6368LEbRy7HCG61Na9eTicAsisM9lAEZjZubHLkLF2csZpOq1LxRCxEKZcRvwIB4cyujQb1wtbY++y6gMDlc/DiVqgu6qcpD5w9zB/X/5wHIs/kn2HIuwo8wbds61NjO+Vyt/5V5GprKUnevP8oyF098ROuGTy9jESN8lbK+UYLVEU+/CK2tiwAuWrZrGctR7qdCPlAk5ur++m6+ctVG/phqHE+z+bCR0VuYNu9NYYfocuPnbYhoqyopXklL24hN13FT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kvSXFpaVCQxPy7b1VdZJxUidDItHhFi7kniCpqAjnQ=;
 b=vD1U0/JzM/Y2ZvCjPCp8AxNv3/M3L84FAWSt9P3oKD8Kt5HbjFKe1VrHSKTaBIwYtrddys2AHsKq1vorsguTsfEFyjLThmE+7F3PorISKO9rmaTfb2aJwfVIve8LAu8aFrEn3MvmuJJzKiEBtzbBo0+FZn0Y1ObZd5a6tKOmrnDj15WhpJMZo6ICAvQLQvV3I+hw5pOMRLpTLRhsBze+t95USAExeL0ybcEIIAx71oznY2NLNl3A38hmmW9FwWSBffKoLvhSZNoU4mPdWODdgv7yFSQJlRCloQ96M7BhmZku7T7qdfzG2YimT2ve8GdyZcHqAO7S17m24rfvfPZpjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kvSXFpaVCQxPy7b1VdZJxUidDItHhFi7kniCpqAjnQ=;
 b=fWOE3p0kSvLxTR8PtZEI538rpvjQ42knh66IsnrSp+Z6ga8vFqptSVGhGwLTPvUOFL4BGmKPazYul4rcnKyFGLUVhBniw6/w8DnkrmOsDhAICP3vJjyaMDiI6qxr+uCPgu7WQ0LaobuDwQRfIeYQSUj0QshcGUgZtBp4ZuuvxrY=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by SE1PPFF1A6F6344.apcprd03.prod.outlook.com (2603:1096:108:1::86f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 08:24:01 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3%4]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 08:24:01 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/6] dt-bindings: media: Add MT8196
 mediatek,vcodec-encoder
Thread-Topic: [PATCH v3 5/6] dt-bindings: media: Add MT8196
 mediatek,vcodec-encoder
Thread-Index: AQHcDPmHU/RhhVHUtEqe9mu7nGSfe7RjalaAgAeqAgaAAClEAA==
Date: Wed, 20 Aug 2025 08:24:01 +0000
Message-ID: <dec4b60d5e01066a6d3d665af35b6d4b6bb4206d.camel@mediatek.com>
References: <20250814085642.17343-1-kyrie.wu@mediatek.com>
	 <20250814085642.17343-6-kyrie.wu@mediatek.com>
	 <20250815-meek-porcelain-oarfish-1411e3@kuoka>
	 <cff7beabdfce15b014597f6fbb0ea23375ecb902.camel@mediatek.com>
	 <aab06f96-83c9-4e1c-9e1b-6148a3055e67@kernel.org>
In-Reply-To: <aab06f96-83c9-4e1c-9e1b-6148a3055e67@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|SE1PPFF1A6F6344:EE_
x-ms-office365-filtering-correlation-id: aac975c2-a8eb-45eb-26e0-08dddfc2eaed
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?amhXOE9HdjlIazdxY1c3SUI3YUpUNmFhWloxa0IvTEdOVFZEUi9iSGNBdE1I?=
 =?utf-8?B?NXpzdlM2cjQrUEdINFBKdEw1dGs3NmJqTjlhRFVyWGtMd29YY0JSVDVIdTBa?=
 =?utf-8?B?NHpDVHBqeVlMUkVNUVNuV0RUSDYvYy9HV0ZBVGtQd01JaldsVEdlTGExdS93?=
 =?utf-8?B?eG9YODcvZDZNMGo2Um5mVTJpV2U3QTQ1WW4yYjNKWFloMVdtR1VrdjVPd1U5?=
 =?utf-8?B?Zk9XcGtmSHZpL2lwNmJLVkxSTDRDTVJzQ3FETk52Tm50TGNkU3VyOW1iZzZr?=
 =?utf-8?B?TWNnSXFJSFBvU1FqUlc4NGFaV3BadExYQTBSMytMUURNNTk0TzdhR0dnMG95?=
 =?utf-8?B?RnptWDhsdUlOTm1SeGJnNEhCcFVIVjFtMjU2dm5BT04wdytzcWljWXJCYS9U?=
 =?utf-8?B?ZXNTdmNQV3lBb0Qra3N5MG9QT1dOZlN4Q1lVd2piOHMzR0RDUFVDVk5ReTRR?=
 =?utf-8?B?U010RytXSWFIcVQzdzF5d0xrSVVrRklEM2xjbVhSWHYrSm0vMlVKVExDN0Rz?=
 =?utf-8?B?S2gwUnUrYldzZDhDQ01lUXBOd2lNU0N3UWgvZnA5MCtzQk51dW9LL1hQU0Z2?=
 =?utf-8?B?a2Uzci9YQ2pwak56SXp6di9iandZb3dFc3NSVHZjaFdLS3FaemdLd1lkem1w?=
 =?utf-8?B?eGhpaTQ4NVBJSWNTSjhuaTNnbk1LNTdBZzl4bGV4b2ltNlUrUXJkS1VxNkR5?=
 =?utf-8?B?MXkzc05yY2FjT3FvTzcycjh3WGZYMFJSYThnTm9RV1ZtN3pVYnBPNjY2azFO?=
 =?utf-8?B?UTYvTDQ3L2lWR2J6cm5tb01wVFRudGpKNUhaRlpUTXE2Ny9xY2dHQUpXWVha?=
 =?utf-8?B?NjNicUU4Zm81MkpzdGR0TlBPVGt1Uis1SzhDbytJK0dsZkhQOWd5YjR6bWpt?=
 =?utf-8?B?ektBblRYTkVUS3AweksvY1d5cEdNMjltWXYzZmh6YUhWdVl5NmIwZ3V5Nko4?=
 =?utf-8?B?K3BWTUZCd0V0ZWx0eTB4d2tQNUVWcDd1WDM2NWQ3Y2JIK0svSU5OazV1dU84?=
 =?utf-8?B?VlNvWGxyaEVHUWdyVnhDWVZ6TThvbFJuVkc5RDFVeVQ0MXhYalpSUVhPbVJk?=
 =?utf-8?B?VmxpS0xCQmJodFFxcnVSOEpjdW5DNTVQYU5jQXhmOXQvSHJnRkQ4SDBoZGRR?=
 =?utf-8?B?M1Nrd2xYbmE5V1BBZ1dITjQ5OE9Lc05GNGttTlRhdkFIVWdMeFBZcmZwT2Jm?=
 =?utf-8?B?STdJaFBFMjdlcEp2ZUNlb25CTWxtMUNJQU12cURFMzd1V25zb050TU83RWtO?=
 =?utf-8?B?QzVTVExBOHdoSUV4QTFMR1FzZUV1c1J3UHhhZjc1VTltdVhGdHJJd3phM1dn?=
 =?utf-8?B?dnI4RHdTNi9PMDdZejZvUzRGam9nVXMwRGNxN2ExbVhxMjVtVUxHRjNkUjVw?=
 =?utf-8?B?NDhCNER5Vlc1YmpMSDMvT1VtTVVnc05PVXpBZ3UrMGVwOVVrWFcxVG4yT1Ju?=
 =?utf-8?B?c080ZFJJQWlHbjFFRXZGM09la0xsMS9rNTR1ZUhTNGlpRThYZUt6ODYvV2k2?=
 =?utf-8?B?U0FETTYrNFZxOVhSR25mb2Y4MGR1eXRHUURxSElGcWhxT1o5eElkNlF1UGZ3?=
 =?utf-8?B?M01oK042OWRFM004cTVIVURwRVZ2bXdyMElLaDF0OFdZa3BtZkNvYnpMeml1?=
 =?utf-8?B?K25jeVBPTnlOaGRGcFhGWm4xOW9KUFlwaFpPNDJueGFUWEhXdktBTS9rOVpa?=
 =?utf-8?B?K21Ob2JkZDYraUR2bTdhR0l0bWs3QXVDMEZndklLT3FldjFhTVdJeURvditF?=
 =?utf-8?B?N2xZc1hPbmdKM2ZMM281WFFrdkFEWXdQbVFrdlNHUnVMcjdsN042TEl1RVNo?=
 =?utf-8?B?VUh6WXNmS0tqRkdCQW53YlVLb05Zd0kyZldqUGxuS0Y1SFYzcGk1MlU0ZUJv?=
 =?utf-8?B?TGIyRkwvNGlzZ2JuZm9KeFRRY1hVc2w0eFlDbGJGMUVzaWFQREZNMEVaQi9s?=
 =?utf-8?B?em9pNWxwUkZBZkFkNnc0SHgzcEVDSFc0ejczd1pYU1dtdUI2QzRLY0Q2ZUEv?=
 =?utf-8?Q?mq9yhsWFZQn/96mA0UpvLV+E0xORh4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGxiMTdpOUMvdjhNbjNDZjNIdWl4T1hSd2hHMkJLWFEzVGZFNDlLaUplbTlo?=
 =?utf-8?B?Q0dnNWJQeElNbm5nUHlodTB4QlNNc0tuWDBDa2EwYkIwOEcrSHBmN1lqYU9W?=
 =?utf-8?B?aHA1eGpRVzMvVlBkbmRlTy9HeXo5a2xUNEUrOFlTSnNsK0d1Z3VxMStoNzYx?=
 =?utf-8?B?dXVTWWoyQVgvWFBNTHdjVTJpSUluNndUVkxYM0JaRGxGcFB4RnNKdFJYRFp6?=
 =?utf-8?B?QjUxeS8vUWlnZDVpUjhjdzNsQXBPQ0JRc3lTa2hnTmRURUpEWWhiS0FwNWdM?=
 =?utf-8?B?d3JMUkV5blQ5WG9jdmVFV2E2UUozb2lJM2lSMktuaUtVbkx3cklSY3gyY2hK?=
 =?utf-8?B?S05mY2F0RHJRSlVEV2xhSnJDQ25ud0xQM0Vmd2xDbXg5M3N0WUZaSzRQSzBC?=
 =?utf-8?B?UkxLdFZudUpZcElkSDU4M01EUFZ0OHRUUlUrYlk5M1g4TnB6aG5aaFZyNVpM?=
 =?utf-8?B?RENmWEFOT2lEdkdiYTZHVDh1OFEvWG9WYVg0bEdWdkNaT2FCREM2NlE0ZzRV?=
 =?utf-8?B?WkNGUnFwcFh2czNFODU3UVZTRjMrZEo4SlNVZ2crZHNBTWZxWkM1QWkwZU1n?=
 =?utf-8?B?K1U4Zll4NnI2RnVRMnVtYWxza0ZxZ240V0NCMmVqV1NaejhwK3FQQWFJUGVt?=
 =?utf-8?B?NS9IQUd0cU5lcUZBTC9XNm1NZlNJOG1PNklFbnA2anBkUVZZUnhmTUdtL0ZN?=
 =?utf-8?B?a2MybDU4ZmJUdUVjMHh3NzhJVGx0QlNHMkpseXFualB6YUd6TU5JY2NLbXZR?=
 =?utf-8?B?ZXdYdU1DVVRTS3hrMVNsQXQxeTQ1WTNPamRKdEx3SVZHY1ZRM2huc2hDazhz?=
 =?utf-8?B?Z3NtQXFvdlhIaGNiMmxzcEtOaE9GSnROTVBCVGpDS0cvTi9hVURYeC9Dbnlw?=
 =?utf-8?B?ZWdremRMSDBybEJ2QnVqRk9YQisyMkF4RVA1anRuVTdacXk5ZERmWHd5Skxm?=
 =?utf-8?B?STRxckFPOGM4dEc0azZkMDdwNlVOL0pQVkN3TDgyVFN1OG1tSFFFUDMyNUxD?=
 =?utf-8?B?ZzQ0TjVaSS9YekpiTC9kd1RKU0p0UWpIT1VzSVhyK2NQTmYyQ3JoZVFLbkpT?=
 =?utf-8?B?VHBKSGRFUzN0dFRlRWYvK2lBMmR3ekFrNDlsUjErWi9LaXUxQWU1MHlIMmpX?=
 =?utf-8?B?UFBEbTZFcm11Q09QRHdVOHB1NGllZkdiUDNzZ3o0QWZqNHA5TVNraHZ6ck1R?=
 =?utf-8?B?Q3p6Sm5TbEI1RysrdWNoVFJvTjZ4WWluUGcvc2ZBRE5OUmgrWXVMRzh0Vko4?=
 =?utf-8?B?VHcyY0RyQyt6QUNSajMzWXdLSzhqbWtZRitOcE05aUJuSUx5MHNxbFhUbmkw?=
 =?utf-8?B?WlRkRFE5WGVYR2ZHYzhqUXNqNDdNN2JPRC9Ld3cxN2wzWmthajdpWVRMUzNP?=
 =?utf-8?B?SnNuRkhFV2ppSGFqU2ZUbEdSZlJsLy80TDhveWlDTEJwTGhjS2h5aE1FQk9J?=
 =?utf-8?B?amRsVzJGcGJtYndCMWhEVFZ3NE4xTjh2RkRFMCszZGhpVDBGVWUzMHVacGNX?=
 =?utf-8?B?Mll6UUVPdHpyZTdRaFhjVzQybk1QZ1hjYUxqMTFQYW5tNzByb2dCTWMxMHo2?=
 =?utf-8?B?NWs2UVU0ckIwQXBnd2xZSWkxQWhzMnA0V3BLRWpocVhMZjJhQkp3cERvVXdC?=
 =?utf-8?B?WVZNT2VuMS9qOWxDOWtuYTJJZC84dnB5Ym9IYmpVUHRveHUrVWttSiswODhM?=
 =?utf-8?B?ZjM3aHNKUlU3bFp1MnVudFdza2d6NkZkbm9UbkdPUmZWcDZEalArekdrVUI0?=
 =?utf-8?B?VHNJSSs5ZzhIeG0waHJVRFZiN1pUbTZMVEVCaFI3OVpseDNvUWlJeURER2Yr?=
 =?utf-8?B?UHhOZkNFM21PaDZZcTEvNlo4Q2lYSU0vajI2cUE0ZnFLUkZnalZEMkhBQ0pN?=
 =?utf-8?B?SmZWdzNXT1k3WDhRdjZycHZIdHg0Q1pDQ0JOMTNKWmxTMCs4VlBQRWVacUo3?=
 =?utf-8?B?eDh5WTd3K3JJVXJ5NXFRbGlnNXRDaDdteW9pUXlsS3JiVzNrSHNlQ1RqR2hH?=
 =?utf-8?B?Q3Q0Qjk0UTAra3JsWHE1MXBTVXVOYjQ2c3RUZjFPNjF0Rk5ISFRQU3lIbU14?=
 =?utf-8?B?c1JnNDVyZlp5ejczUVBqcVV2TnhvNHNJRkh5ajAwQTBWQm14UWZESnYvekFz?=
 =?utf-8?B?ZVpjTFN3WXcxMnFHN216TnN3bjZ3ZWlkdi9NUWpISnE3WHFuMkZkdW5HNmVn?=
 =?utf-8?B?SWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7478EC4CEE315741A8FA05723BCC14DD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac975c2-a8eb-45eb-26e0-08dddfc2eaed
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 08:24:01.4468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W1PLt2ydJSSPuK5EFeSDU8zV1O7EkSiammdz+G5l2rgoES8gLLsvVpHCTkI3xCXTLimgjdkRYLkWy++vZZ5RfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFF1A6F6344

RGVhciBLcnp5c3p0b2YsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXdpbmcuDQoNCk9uIFdlZCwg
MjAyNS0wOC0yMCBhdCAwNzo1NSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4g
RXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVu
dC4NCj4gDQo+IA0KPiBPbiAyMC8wOC8yMDI1IDA0OjU1LCBJcnVpIFdhbmcgKOeOi+eRnikgd3Jv
dGU6DQo+ID4gRGVhciBLcnp5c3p0b2YsDQo+ID4gDQo+ID4gVGhhbmtzIGZvciB5b3VyIHJldmll
d2luZy4NCj4gPiANCj4gPiBPbiBGcmksIDIwMjUtMDgtMTUgYXQgMTA6NTQgKzAyMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+ID4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cw0KPiA+ID4gdW50aWwNCj4gPiA+IHlv
dSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4gPiANCj4gPiA+
IA0KPiA+ID4gT24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgMDQ6NTY6NDFQTSArMDgwMCwgS3lyaWUg
V3Ugd3JvdGU6DQo+ID4gPiA+IEZyb206IElydWkgV2FuZyA8aXJ1aS53YW5nQG1lZGlhdGVrLmNv
bT4NCj4gPiA+ID4gDQo+ID4gPiA+IEFkZCBNVDgxOTYgZW5jb2RlciBjb21wYXRpYmxlIHN0cmlu
Zywgd2hpY2ggd2lsbCByZWZlcmVuY2UgVkNQDQo+ID4gPiA+IGRldmljZS4NCj4gPiA+IA0KPiA+
ID4gWW91IGlnbm9yZWQgY29tbWVudHMgZnJvbSB2Mi4NCj4gPiANCj4gPiBJIHRoaW5rIEkgbWlz
dW5kZXJzdG9vZCB0aGUgdjIgY29tbWVudHMsIEkgcmV3cm90ZSB0aGUgdGl0bGUNCj4gPiBiZWNh
dXNlIGl0DQo+ID4gc2FpZCBkdC1iaW5kaW5ncyBhbmQgZW5jb2RlciB0d2ljZSwgdGhpcyBpcyBu
b3QgZW5vdWdoLCByaWdodD8gd2UNCj4gPiBuZWVkDQo+ID4gdG8gZGVzY3JpYmUgbW9yZSBpbmZv
cm1hdGlvbiBpbiBCb2R5IHRleHQ/DQo+IA0KPiB3aGVyZSBhcmUgbG9yZSBsaW5rcyBpbiB0aGUg
Y2hhbmdlbG9nPw0KDQpXZSBuZWVkIHB1dCB0aGUgbG9yZSBsaW5rcyBpbiB0aGUgY2hhbmdlIGxv
ZywgSSBtZWFuIHB1dCB0aGUgcHJldmlvdXMNCnZlcnNpb24odjIpIHBhdGNoc2V0IGxvcmUgbGlu
az8gV2Ugc2hvdWxkIHRvIGluZGljYXRlIHRoZSBjaGFuZ2VzIGluDQplYWNoIHZlcnNpb24gaW4g
dGhlIGNoYW5nZSBsb2cgYW5kIHdlIGRpZCB0aGUgc2FtZS4gSWYgZWFjaCB2ZXJzaW9uDQpsb3Jl
IGxpbmtzIG9yIFVSTCBpcyBuZWVkZWQsIHdlIHdpbGwgc3RhcnQgYWRkIHRoZW0gaW4gbmV4dCBw
YXRjaC4gDQoNCj4gIFdoeSBhcmVuJ3QgeW91IHVzaW5nIGI0IHRvIHN1Ym1pdA0KPiBwYXRjaGVz
Pw0KDQpXZSBoYXZlIGJlZW4gdXNpbmcgJ2dpdCBzZW5kLWVtYWlsJyB0byBzdWJtaXQgcGF0Y2hl
cyB0byBjb21tdW5pdHksIGI0DQppcyBub3QgZGVwbG95ZWQgcmVhZHkgb24gbXkgc2VydmVyIHll
dCwgd2UgY2FuIHN0dWR5IGl0IGZpcnN0Lg0KDQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gDQo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IElydWkgV2FuZyA8aXJ1aS53YW5nQG1lZGlhdGVrLmNvbT4NCj4g
PiA+IA0KPiA+ID4gSW5jb3JyZWN0IFNvQiBjaGFpbi4NCj4gPiA+IA0KPiA+ID4gPiAtLS0NCj4g
PiA+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtZW5jb2Rlci55YW1sIHwg
MTcNCj4gPiA+ID4gKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
NyBpbnNlcnRpb25zKCspDQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiA+IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy0N
Cj4gPiA+ID4gZW5jb2Rlci55YW1sDQo+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy0NCj4gPiA+ID4gZW5jb2Rlci55YW1sDQo+
ID4gPiA+IGluZGV4IGViYzYxNTU4NGY5Mi4uYmI0ZGJmMjNjY2M1IDEwMDY0NA0KPiA+ID4gPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNv
ZGVjLQ0KPiA+ID4gPiBlbmNvZGVyLnlhbWwNCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy0NCj4gPiA+ID4gZW5jb2Rl
ci55YW1sDQo+ID4gPiA+IEBAIC0yNCw2ICsyNCw3IEBAIHByb3BlcnRpZXM6DQo+ID4gPiA+ICAg
ICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTg4LXZjb2RlYy1lbmMNCj4gPiA+ID4gICAgICAg
ICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTItdmNvZGVjLWVuYw0KPiA+ID4gPiAgICAgICAgICAg
ICAgICAtIG1lZGlhdGVrLG10ODE5NS12Y29kZWMtZW5jDQo+ID4gPiA+ICsgICAgICAgICAgICAg
IC0gbWVkaWF0ZWssbXQ4MTk2LXZjb2RlYy1lbmMNCj4gPiA+ID4gICAgICAgIC0gaXRlbXM6DQo+
ID4gPiA+ICAgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTg2LXZjb2RlYy1lbmMNCj4g
PiA+ID4gICAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODMtdmNvZGVjLWVuYw0KPiA+
ID4gPiBAQCAtNTgsNiArNTksMTEgQEAgcHJvcGVydGllczoNCj4gPiA+ID4gICAgICBkZXNjcmlw
dGlvbjoNCj4gPiA+ID4gICAgICAgIERlc2NyaWJlcyBwb2ludCB0byBzY3AuDQo+ID4gPiA+IA0K
PiA+ID4gPiArICBtZWRpYXRlayx2Y3A6DQo+ID4gPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOg0K
PiA+ID4gPiArICAgICAgRGVzY3JpYmVzIHBvaW50IHRvIHZjcC4NCj4gPiA+IA0KPiA+ID4gRm9y
IHdoYXQ/IFlvdSBqdXN0IHJlcGVhdGVkIHRoZSBwcm9wZXJ0eSBuYW1lLiBZb3UgbXVzdCBzYXkg
aGVyZQ0KPiA+ID4gc29tZXRoaW5nIHVzZWZ1bCBpbnN0ZWFkOiB3aHkgdGhpcyBpcyBuZWVkZWQs
IHdoYXQgaXMgaXRzDQo+ID4gPiBwdXJwb3NlLg0KPiA+IA0KPiA+IEkgd291bGQgbGlrZSB0byBz
YXk6DQo+ID4gImRlZmluZSB0aGlzICdtZWRpYXRlayx2Y3AnIHByb3BlcnR5IGhlcmUsIHRoaXMg
aXMgYSBwaGFuZGxlIHBvaW50DQo+ID4gdG8NCj4gDQo+IERvbid0IGV4cGxhaW4gdG8gdXMgd2hh
dCBEVCBpcy4gQWJvdmUgaXMgMTAwJSByZWR1bmRhbnQuDQo+IA0KPiA+IHZjcCBkZXZpY2UsIGZv
ciBwbGF0Zm9ybXMgdXNpbmcgdmNwIGZpcm13YXJlLiINCj4gDQo+IEV4cGxhaW4gd2hhdCBpcyB0
aGUgcHVycG9zZSBvZiB0aGlzIGluIGhhcmR3YXJlLCBob3cgaGFyZHdhcmUgdXNlcw0KPiBpdCwN
Cj4gd2hhdCBwcm9ibGVtIGZvciBoYXJkd2FyZSB0aGlzIGFkZHJlc3Nlcy4NCg0KTWF5YmUgSSB3
b3VsZCBsaWtlIHRvIHNheToNCg0KcGhhbmRsZSB0byB0aGUgVkNQIG5vZGUsIHRoZSB2aWRlbyBl
bmNvZGVyIGtlcm5lbCBkcml2ZXIgdXNlcyB0aGlzDQpwaGFuZGxlIHRvIGNvb3JkaW5hdGUgd2l0
aCB0aGUgZW5jb2RlciBzb2Z0d2FyZSBkcml2ZXIgd2hpY2ggcnVubmluZyBpbg0KVkNQIGZpcm13
YXJlIGZvciBjb21tYW5kIHN1Ym1pc3Npb24gYW5kIGludGVycnVwdCBoYW5kbGluZyBkdXJpbmcN
CmVuY29kaW5nIHByb2Nlc3MuDQoNCj4gDQo+IA0KPiA+IA0KPiA+IElzIHRoaXMgT0sgZm9yIHlv
dT8NCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiA+ICsNCj4gPiA+ID4gICAgcG93ZXItZG9tYWluczoN
Cj4gPiA+ID4gICAgICBtYXhJdGVtczogMQ0KPiA+ID4gPiANCj4gPiA+ID4gQEAgLTc2LDYgKzgy
LDE3IEBAIHJlcXVpcmVkOg0KPiA+ID4gPiAgICAtIGlvbW11cw0KPiA+ID4gPiANCj4gPiA+ID4g
IGFsbE9mOg0KPiA+ID4gPiArICAtIGlmOg0KPiA+ID4gPiArICAgICAgcHJvcGVydGllczoNCj4g
PiA+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiA+ID4gKyAgICAgICAgICBjb250YWluczoN
Cj4gPiA+ID4gKyAgICAgICAgICAgIGVudW06DQo+ID4gPiA+ICsgICAgICAgICAgICAgIC0gbWVk
aWF0ZWssbXQ4MTk2LXZjb2RlYy1lbmMNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgIHRoZW46DQo+
ID4gPiA+ICsgICAgICByZXF1aXJlZDoNCj4gPiA+ID4gKyAgICAgICAgLSBtZWRpYXRlayx2Y3AN
Cj4gPiA+IA0KPiA+ID4gZWxzZQ0KPiA+ID4gDQo+ID4gPiBtZWRpYXRlayx2Y3A6IGZhbHNlDQo+
ID4gDQo+ID4gSSB0aGluayB0aGUgZWxzZSBzdGF0ZW1lbnQgaXMgbm8gbmVlZCBoZXJlLiBEaWZm
ZXJlbnQgcGxhdGZvcm1zIGFyZQ0KPiA+IHVzaW5nIGRpZmZlcmVudCBmaXJtd2FyZSBwaGFuZGxl
LCB2cHUsIHNjcCwgYW5kIHZjcC4gc28gd2UgdXNlIGlmLQ0KPiA+IHRoZW4NCj4gPiB0byBkZXNj
cmliZSB0aGUgcmVxdWlyZWQgcHJvcGVydHkgZm9yIHRoZXNlIHBsYXRmb3Jtcy4NCj4gDQo+IEht
PyBJIGp1c3QgdG9sZCB5b3UgaXQgaXMgbmVlZGVkLiBPdGhlcndpc2UsIGV4cGxhaW4gd2h5IGVh
Y2gNCj4gdmFyaWFudC9kZXZpY2UgaGFzIG5vdyBWQ1AuDQoNCkN1cnJlbnRseSwganVzdCBtdDgx
OTYgdXNlIFZDUCBkZXZpY2VzLCBzbyAnbWVkaWF0ZWssdmNwJyBwcm9wZXJ0eSBpcw0KcmVxdWly
ZWQgb24gbXQ4MTk2IHBsYXRmb3JtLCBzb3JyeSBJIGRpZG4ndCBnZXQgeW91ciBvcGluaW9uIHdo
eSAnZWFjaCB2YXJpYW50L2RldmljZSBoYXMgbm93IFZDUC4nIA0KDQo+IA0KPiBZb3UgaGF2ZSBl
bnRpcmUgY29tbWl0IG1zZyB0byBleHBsYWluIGFsbCB0aGlzLg0KPiANCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gS3J6eXN6dG9mDQoNClRoYW5rcyBhZ2FpbiBmb3IgeW91ciBraW5kbHkgcmV2aWV3
aW5nLg0KDQpCZXN0IHJlZ2FyZHMNCg==

