Return-Path: <linux-media+bounces-52708-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBCiM53ujmk5GAEAu9opvQ
	(envelope-from <linux-media+bounces-52708-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:27:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 294FA134747
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 829EE3040775
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0747834D4F6;
	Fri, 13 Feb 2026 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fwMDdkfB";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="WxpyNHMj"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD4F31B828;
	Fri, 13 Feb 2026 09:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770974858; cv=fail; b=k4HSRr151EDROfoiIaUks8PJ4TWlruhmdct/HjeObe96TnpMXuK8t5TuLG0q24acWoQZBJhQkrXdOugcZZ+h2YqFzSAqKF1LkMAkBSmc9KDfa9ljv1Ecl9w0xYvZ/gNAlhzxTFeWZSi6SYJcn+Ly7d+ZBsst6LKPv5iUiO8dOdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770974858; c=relaxed/simple;
	bh=D82c4xmUTctFP7JRr38hXRkKNf0dxCAA5ECtJqQNLOg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DFKhNE5JhMy/+TEpfJ7sa3B93coeRCtO12JGsyOgP0YjJIDCoUSc8b1sP/SFFt7/sRI8wqjUXi72JhwL99GJfF2qipRwnMxo14XZy5M8UcAZ8nQhhw1Sh5rBaygVbpddsHbNexd09dNFYpd7sneZMB3Ve+SeL1b6tX0Vt6HTuIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=fwMDdkfB; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=WxpyNHMj; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3823d9c008be11f185319dbc3099e8fb-20260213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=D82c4xmUTctFP7JRr38hXRkKNf0dxCAA5ECtJqQNLOg=;
	b=fwMDdkfBkwVI7Wp3HAp+X+ByXckwOsZH3Ai1awC6NzT7anGFpYaN15N5wS5YlVp0UptgeOb7/NtAe9l981WL6tGfkrZgpi+cED5PAQKkJO3TO3u/N9qfF4stPZughOhwIgV996L58T3TUDcM42UlwfArYfIvdr76Ttag1ZpZA+k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:09b1946b-756b-4935-bc25-2f0f83e4e0c3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:4deeeb7a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3823d9c008be11f185319dbc3099e8fb-20260213
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1268516586; Fri, 13 Feb 2026 17:27:30 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 13 Feb 2026 17:27:29 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 13 Feb 2026 17:27:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgU42wPAqICxjhG+Bt2/R5dY/NPnjeBZ3eafbyaenJLdfIozuYvlTkMYtKe1ziwRNyOm6sELqzEaPFG4aicm+a19U1WB7x0gH0hcm81NX1rIIB3PXwBdOGLKCJa1G7GQ6Y60WYJwZMXlwsP+q1KzgPamXkq8s+okA/2kQmXLjnx4wGGHNr8koLl3uV5l3mkLJ94+4Ap1eUMgHAFq1aD7726+m82rz0VBv74cUsCFwDbh4k37DR1JuDOOWI6O6zVXmgRDNVGW5omFVlipwhDmN2gKCILNjuYL8xO8mEUhvgvLf1OhMu2sK2t1Uje6nL8+aBsxehhseMcj6mYUelkmuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D82c4xmUTctFP7JRr38hXRkKNf0dxCAA5ECtJqQNLOg=;
 b=B1oidG9ngTyKjjb4PhooSxjgWlSYGAf0XmEHM2lYs6RgwSsGtKOUa3HE2zM4lbQsQj45k/Mk4gF3LAxCVvOY5E4zB31gmbmgwfHdECtsDQmG0ThnqZKc4kf/STXSGkuP/H8XqRI8BDstfxCWtDznGFrGzyBPrDq1QLzFl1kd6NIavlxXcmWJxIryJ5kQ4QziFEqykbPZMP2XBls24YXzbe+fs7+5GfCFlSTDelJfAJGDn+pT2aslSSyYBfgR9E0P/BwZT317J5hiEaK/NFL6X+MrZeS9SKJf2xWHVJJ45qhAbyFQwzhlihgoAT2I1kqEncNrB7v03E+x/k4QNh210w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D82c4xmUTctFP7JRr38hXRkKNf0dxCAA5ECtJqQNLOg=;
 b=WxpyNHMjjTMlBLVPOgzRYZRzOp1vEiG7iZgBGF/o2tXkWaixwNEFzs600Mrb6Ky9XAHMd9vlGCnFVsjcgDCDyR8PVRwjaZsoRxHTbVNAJ1jv3JlY8oImyT6rTwPKhk5MBywkeJ80OBdCkKlCTzbhWal5i5jm/jv0aMBlajBzzac=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by SEYPR03MB7397.apcprd03.prod.outlook.com (2603:1096:101:13b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 09:27:25 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::b481:9458:6a7:b356]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::b481:9458:6a7:b356%4]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 09:27:25 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	=?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	=?utf-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?=
	<Maoguang.Meng@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 5/6] dt-bindings: media: mediatek,vcodec-encoder: Add
 MT8196 with VCP support
Thread-Topic: [PATCH v4 5/6] dt-bindings: media: mediatek,vcodec-encoder: Add
 MT8196 with VCP support
Thread-Index: AQHcnAaiH9bvJOQmFEiMhKsD0Jzb37WAQ0mAgAAalQA=
Date: Fri, 13 Feb 2026 09:27:25 +0000
Message-ID: <13bf9b8673c6d47e07dee4a233945ed542e9b4f3.camel@mediatek.com>
References: <20260212100104.11863-1-irui.wang@mediatek.com>
	 <20260212100104.11863-6-irui.wang@mediatek.com>
	 <20260213-didactic-whispering-impala-ea9e64@quoll>
In-Reply-To: <20260213-didactic-whispering-impala-ea9e64@quoll>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|SEYPR03MB7397:EE_
x-ms-office365-filtering-correlation-id: fdd248fc-ec96-4a13-9554-08de6ae2193c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ODJ2b2VBZWFIdTlRTU9TOVNPMFJJalN0VnFpVHAvcGpYWVF1Y0ljUDJLcUdM?=
 =?utf-8?B?eFg1aGxBYzFxQkUxSEQ3eGRINTl0UXFmWTUzQmpKdmRWcG5CZXp0YWxCREpK?=
 =?utf-8?B?b0QwRjdvYlNneTdDaitQeC9pSVVHWCt5WTY4Ym91S3ZDZklPS293RGU2Q1JV?=
 =?utf-8?B?WW11YVNSVSs2OTBIVTR2Ri9ORGtFYkMwZXJMNk9KaXRxM3JWb2QwUzFEN2pj?=
 =?utf-8?B?OEVNREl0c3ZEdTBuM3hNNXJqNnoxQ1lOL3NZdTE2MVl1YkwybXpVQXhZbzNq?=
 =?utf-8?B?cnl2TlR1cEhZbU1vQWZKdCtNN3haV1lONmpHTHh5STEzaXZPamxHVkJrVlJ5?=
 =?utf-8?B?b1RwUmEwclk3MHE5Sjg2Rm5icy9WcEFwTkQ3MmpqNU53MmNOdy91RWpFendZ?=
 =?utf-8?B?SXBVaDhjRlFCcFlWbnlYSDE1UTJJem15Tzg0Yll6TStOMnJXTy9IWFU4MEUz?=
 =?utf-8?B?bEFCcVVMcDR3WitVbCt6cW1leDhMQnhBbVc0RGh4MVNFend2NEZDbEt0NlEw?=
 =?utf-8?B?dFY4cmplUFlZR1d3M1JYenYrL2J1MGkrd2JxbWxPN01vWC85a0tLdnBHOXkx?=
 =?utf-8?B?eFBQQzNNOU0xS3hmM0dFZEpQMGUyU2RsSm9YN1JoMENxemY1SDZtNDRNN1Fo?=
 =?utf-8?B?UGoyd092amRKYWtNWnd1YlY0cnN0ZWtsUmNFd2hzQUw5UGttS1JoNHBSbmRM?=
 =?utf-8?B?R2lPL2x5b1NqOENqcjNWTkZwZ2Q1c2ptZklVaWJWRi8xSy8yK081M1M1dVVa?=
 =?utf-8?B?NlgwOElGdEdzZmdMbmhNdkUvcllEYkdEb0NWQ0QvcUVYK2JJNVh5MXVnVU5k?=
 =?utf-8?B?b1F2dzhHd05hUWdyR2toclE1enhwRkd2UHpTSjlNdXErRVVUZUVQck8yYVFC?=
 =?utf-8?B?ZjJOekd2WXoxMEFWVWRLa3p0WWV0TEszREVyRHYvSWZwS0RJaGgrUnl6Yjdr?=
 =?utf-8?B?TWViMzByT0hJWm45V2p0Vk9aY3R1SlV3MWdkU0dEbFRINWx6MXNxSFRESEw3?=
 =?utf-8?B?dlJzcDROWm9PVlVnNVh5aW12YUNIN29Hajl3RmsrR0tLQ1dnZW40RHY1T05B?=
 =?utf-8?B?ZTMvZS84VUh6LzV5bEFJY1JieEVnZWx1S1h2clNLdFVXYXpURDEwTURNcDkr?=
 =?utf-8?B?dmhOQmEzTUV5dkNrK3pyTVJHSzhqUURNZU9XNldIUTFsdklqY0dvV2puMUdK?=
 =?utf-8?B?MVh6ZmNGNkY2OUZaZGZRZlFudURJYUxRM1VVRG9XS2NoWTJzNTN4TzR0SjRJ?=
 =?utf-8?B?Y2VQSENVRDE1UWZxQTRwNUIrZ0NpQnk4Um9EeG1xeGpScDZrZE9mZGtSenlp?=
 =?utf-8?B?YlgzSnpuaEJMS3JGSjNhbm9QZWg4TjVEQWJsOXFMQkgrYVRoSXpDSmkxbnU3?=
 =?utf-8?B?c2ljR2FmOGFxVnhkQXNWS3NpdXNkTGY3OXNKUFlhS0ttbHAreEh6dlJ4aGEx?=
 =?utf-8?B?cno2em4yRGthM0hLQmNTSmxSTUxsUnV2eTNQREl0ZVpoSTFJblMvVEtWa3Vw?=
 =?utf-8?B?T0ZRMkc4ZHVob0cyeUdUeUpjRExzcGYyMzZDb1J1MGpiMUg0Y0lFZ00yL2ow?=
 =?utf-8?B?cnVVdTVFMHh6OEJvUzN2RTVpSFVYRWlHc0JDbGFkaHRGeDdJMHRVa2hKVm5k?=
 =?utf-8?B?MWlmbTFac0UrWktzMG5IVUlLdktwVnduWGhDUzVKSjRwdlY4Zm5TdG5GNFlX?=
 =?utf-8?B?QU9XRkJRM1BJRjR5alE4K0IzSFE5RElqc3lzVVpua21IczdNYTdPdDZuVnFR?=
 =?utf-8?B?dmlOeXFtWEtVOTVxODlocWFPWm1jL2Y5M3VtSFNUMnRUWS9LajZNVzNoMHk0?=
 =?utf-8?B?Q2NFazhmN3pVYXhwMGZlSVUxdENSSmJOYzhhd1EzajNDeFJRY3FSc2o2SnBW?=
 =?utf-8?B?R0gzYlB3aVZsTUl0UFdkbnhtTE16R3hpMlF5bVpxNHJoMExZWlE1VWdja1Bt?=
 =?utf-8?B?R0gxdFc2RlBzdnd4dXExQkJ1TytBUEgwZEd2Vmdrb2pSVzF1ei84S0pNOEd2?=
 =?utf-8?B?eU5ORzlkUkUvUGwxVHM0dGtlV3NnRXpIWjdBME5tY0J6OGtaYUtmRTlScVV3?=
 =?utf-8?B?eC8vN2NxL3NpV285ZFZPOW1iZWZLNi9CdXV5U0VJZVN2RlhFT2pnWVNaSjl1?=
 =?utf-8?B?TjAycHhFQmJ0STU2cnd2Sk56eE5mQUwzRUMyVnhtdmY3OFdNNjFndEIyajUw?=
 =?utf-8?Q?43TMn34LbEEOl5M+09IjM7Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TG1kUnBIQ3p3d3VVT1ZQdDVuMHJjM2dZVTVuR2VzVTdlYzk5bGkvTHQ3R1dD?=
 =?utf-8?B?UGdTTE5kRTFHMmhNbVpWOXA3aVJkZmxUYmh6d3l1TWpxVDZRd2NkQjVkaS9a?=
 =?utf-8?B?TytZNGFnbWtFazRZdGtMYjM2dzJMbjltSk5leEtWQ2hOaFdla1FDSlU2Mld4?=
 =?utf-8?B?RDhMVDI1K3Q5cnZrVXpaNUNRVUxnYUhPYlFseGlkTmM2QTFkVGNTeEVhRXpZ?=
 =?utf-8?B?T0xjaERYWTJ2ZjduNnN0bURuUHJ0bytFTnE3R0FBUHkrNXZrSHpGOGh4SXJ2?=
 =?utf-8?B?VlIvRTFQY3NRQTdVY2N2VGMzYjN6TUgyWWVxZ2lwZlFIaXMyVjZtVUJlSjFi?=
 =?utf-8?B?RVUvZEI4SllneXdLTk9IRGdSSlBHaUVNc1lSZlZ6WVgyNi8rSkZ1MzJhWWw4?=
 =?utf-8?B?UDNpVXZ2ZGVkbWRZSHNENHNNMlNkMW5JQ28vZndhQmZNTVFYZm45Yjh3N1dF?=
 =?utf-8?B?a0REVlBMU3NRZG94Q3BqUnU0ZXJaUXlFT20wb0pxL294M1ZTN0xNTW9odjlY?=
 =?utf-8?B?Z256RVpueTdESHpKQnRURWJ3SE1jUXovN3RHTFp4a0NwZUcwcmhTeU5XNy9I?=
 =?utf-8?B?bjFSN3cvMXIwRkkxZmNzR3UzZ3pGYkJHSlN6TEZpOTlQZkdSSDlGcUlQZDhl?=
 =?utf-8?B?RGlzRWpMRmJKdWhmZmJRV01PWXJ5d2d6R21pM2g2SnRFSUxJWFZwUHhvYndx?=
 =?utf-8?B?Y2UyemoxVmtZNTQ5dnVwa1VQTjFHWjladGxNcG0vU0VnQW1iUmVxdVdCK0Jq?=
 =?utf-8?B?WEE3cy9LSmlKeG9leFIxTTIxTzdsaXNKTkI2QjRVMWhmQ3c1VDA1RVJRcGVs?=
 =?utf-8?B?YWtCVnNxMGpCb1Q1bnFlVG1WY2RITUIrc01XNENxZDhnTGl1R1RsWHNPRlRM?=
 =?utf-8?B?ZzI1RzUyMjE5U09JdXRvYXFVTk1MdVphcEM4OVdKRTRVNklPV2daU1JsSmcz?=
 =?utf-8?B?NXhpK0ZmMURsai9KY3ZmeS9ZVXoxL2VkWElKa09HaEVLblpVWVNOUy9PaUdG?=
 =?utf-8?B?OFJJbGZHVEdmUFZxRFZVdjgxNVZTQm96ZW1aQVgydzBOYm1sN3kzU3Rac3Zi?=
 =?utf-8?B?VVRLMmtLaW5GcmF3bnBtMWMwMTRIQ1hhY1pxTHdmYktCUmp6elhYNW5TZDNB?=
 =?utf-8?B?QjFWZlFQY2tUakxlNVM1SmlsVG1FRFJXODBPV2FhYTBiL0tKRllwMW4weFhT?=
 =?utf-8?B?Nm9oNFpRTWFUV1JpdVlHQkt2alI2aHU0UFdRTktmSUJ3NnpFZ05ZWStlZUo4?=
 =?utf-8?B?SHF2Y05EaW9MMXlpNjJ1M3VDNnQxbGlheW5mSm9HdFJSQW42bnF0Y3NhWDJ0?=
 =?utf-8?B?NWJQUUE2VUNZODZ6R2dFNzdWeDhCNkIxK1ZOU3k4L0YzVW9CSmlZdmtqZ0Vl?=
 =?utf-8?B?ditFaDkwdmwrRmFaVWJUN01DV1J4elVEWnFldmowazduQjRFaWY3RnRYT0VV?=
 =?utf-8?B?RE5STzkzVktPcmtGT2VVL0ZFUXk0MVpBMjYwelFhdmR0NkUrSTVqblA5Z3Ba?=
 =?utf-8?B?RjZNaWcvalJPSlMxTWpUaXBDY2tWQUVLY3NsbnBkQmg2UDJpa3lFYkF0Uzcz?=
 =?utf-8?B?N0RlVWZpaHRpNHZqU0EzSmdlR1hMekFYNFpnS1BZbTJIZTBMMUJ6V2ZWRGZy?=
 =?utf-8?B?S0oweW5ZTnc2UlRHOFBZam9rVmJ0WUJ4cHRSN29jZkNORWhtQVM3aDJiRng2?=
 =?utf-8?B?VldKblRSVUFENWN5cEp3UTlqbTRvZDd4a1dXRStRMmlhcU9KaHlKZmJsNVM5?=
 =?utf-8?B?VlJSS3Q3d1N0ZFVDRWZScWtkVlM2THlXSXhZaEFqNGwrVzkwYzlCUExJTzNG?=
 =?utf-8?B?SWhWUGVFeXNCODZqRDdjeFZaUlpWaDhvczVUVnNHdW1uc2lhUHRDZ241SmNk?=
 =?utf-8?B?dTFaaEMvU0cxV0NSbEEvRCtzY3pGSlpGc3pVZ0tJUURYSEd4a2NPdDBpM2M0?=
 =?utf-8?B?ZU8wRDBndmIwb1JGQ2Q5clVZVVhlQlFRRUNGcTJnWllVMTF0K2hUeU4yWEpK?=
 =?utf-8?B?aGFlRTllenB6OFdEL3JDUE5KNXJOUUNIZFBwcnNvRVdUdUJTSCtCTlVZbFhn?=
 =?utf-8?B?eG1jR1VnVW0rQ0ZlWXVSeEU2OXBzbEdTWU93ZE95QVp4RFEwYnRXMjhHUy9j?=
 =?utf-8?B?cUZ0dllOM3ZYU2l0eUN5aE4zc0Nmb0ZMVE5PYlBwaVo2MHNsZTZWSDVyb08v?=
 =?utf-8?B?WE1SOUMxeEx6QWVCVmxVTHdaeGZVV1ZKekw3MFNnUnlCODF2OHhKS0lMYm5p?=
 =?utf-8?B?REovQUxBaUxQTzFYVlh4NHl1Z052TWs1b3pGS2RkOHJUdmxveVAwSHltZDl4?=
 =?utf-8?B?K2Y5SXhVcTFXK3JpWitRbUhlakJYOFpNTGNBK3FUOW5EamRCZGZwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D44C67D209D1942A76634907558853E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd248fc-ec96-4a13-9554-08de6ae2193c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 09:27:25.1419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGXVdZTkpjMYdzaWXPbxrEwHVRIJdAxyuYNVonsumceSPCqMpq/aBGh0KUUoAM0LElxK8vyFZ8Xml+vsg40JbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7397
X-MTK: N
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52708-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:mid,mediatek.com:dkim,mediatek.com:email,mediateko365.onmicrosoft.com:dkim];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,mediatek.com,chromium.org,lists.infradead.org,collabora.com,xs4all.nl,gmail.com];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Irui.Wang@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 294FA134747
X-Rspamd-Action: no action

RGVhciBLcnp5c3p0b2YsDQoNCkkgc2luY2VyZWx5IGFwb2xvZ2l6ZSBmb3IgdGFraW5nIHVwIHlv
dXIgdGltZSB0byByZXZpZXcgYW5kIHJlc3BvbmQgdG8NCnRoaXMgcGF0Y2guIFRoZSBtYWludGFp
bmVycycgcmV2aWV3IGNvbW1lbnRzIGFyZSB2ZXJ5IGltcG9ydGFudCB0byB1cywNCnNvIHdlIHdp
bGwgbmV2ZXIgaWdub3JlIHRoZW0sIHRoZXJlIG11c3QgYmUgc29tZSBtaXN1bmRlcnN0YW5kaW5n
IGluDQp0aGlzIHByb2Nlc3MuDQoNCk9uIEZyaSwgMjAyNi0wMi0xMyBhdCAwODo1MiArMDEwMCwg
S3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gVGh1LCBGZWIgMTIsIDIwMjYgYXQgMDY6
MDE6MDJQTSArMDgwMCwgSXJ1aSBXYW5nIHdyb3RlOg0KPiA+IEFkZCBzdXBwb3J0IGZvciBNVDgx
OTYgdmlkZW8gZW5jb2RlciB3aGljaCB1c2VzIFZDUCAoVmlkZW8gQ28tDQo+ID4gUHJvY2Vzc29y
KQ0KPiA+IGZvciBmaXJtd2FyZSBtYW5hZ2VtZW50LiBVbmxpa2UgcHJldmlvdXMgcGxhdGZvcm1z
IHRoYXQgdXNlDQo+ID4gU0NQL1ZQVSwgTVQ4MTk2DQo+ID4gcmVxdWlyZXMgVkNQIHRvIGxvYWQg
YW5kIGV4ZWN1dGUgdGhlIHZpZGVvIGVuY29kaW5nIGZpcm13YXJlLCB3aXRoDQo+ID4gdGhlDQo+
ID4gZW5jb2RlciBjb21tdW5pY2F0aW5nIHRocm91Z2ggVkNQIHRvIHBlcmZvcm0gZW5jb2Rpbmcg
b3BlcmF0aW9ucy4NCj4gDQo+IEFnYWluLCByZWFkIHJldmlldyBmcm9tIHYyLiBTdWJqZWN0IGlz
IHN0aWxsIHdyb25nLg0KDQpGcm9tIHRoZSByZXZpZXdzIG9mIHYyIGFuZCB2MywgbXkgdW5kZXJz
dGFuZGluZyBpcyB0aGF0IHRoZSBwYXRjaCBsYWNrcw0KZGV0YWlscywgc28gd2UgYWRkIG1vcmUg
ZGVzY3JpcHRpb24gZm9yIGN1cnJlbnQgbW9kaWZpY2F0aW9uLCBmb3IgJ1ZDUCcNCnVzYWdlLiBT
byB3ZSBhcmUgdmVyeSBncmF0ZWZ1bCBpZiB5b3UgY291bGQgcHJvdmlkZSBhIGBjb3JyZWN0IFN1
YmplY3QNCmAgZXhhbXBsZSBmb3IgdXMsIHRoYW5rcyBhIGxvdC4NCg0KDQo+ID4gDQo+ID4gQWRk
IHRoZSAibWVkaWF0ZWssbXQ4MTk2LXZjb2RlYy1lbmMiIGNvbXBhdGlibGUgc3RyaW5nIGFuZA0K
PiA+IGludHJvZHVjZQ0KPiA+IHRoZSAibWVkaWF0ZWssdmNwIiBwcm9wZXJ0eSB0byByZWZlcmVu
Y2UgdGhlIFZDUCBkZXZpY2UsIHdoaWNoIGlzDQo+ID4gcmVxdWlyZWQgZm9yIE1UODE5NiBlbmNv
ZGVyIG9wZXJhdGlvbi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBJcnVpIFdhbmcgPGlydWku
d2FuZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9tZWRpYS9tZWRpYXRlayx2Y29k
ZWMtZW5jb2Rlci55YW1sICAgICAgICB8IDE5DQo+ID4gKysrKysrKysrKysrKysrKysrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQN
Cj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2
Y29kZWMtDQo+ID4gZW5jb2Rlci55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLQ0KPiA+IGVuY29kZXIueWFtbA0KPiA+IGlu
ZGV4IGViYzYxNTU4NGY5Mi4uNGM4YWNlYmViOWQzIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtDQo+ID4gZW5j
b2Rlci55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL21lZGlhdGVrLHZjb2RlYy0NCj4gPiBlbmNvZGVyLnlhbWwNCj4gPiBAQCAtMjQsNiArMjQs
NyBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTg4LXZj
b2RlYy1lbmMNCj4gPiAgICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5Mi12Y29kZWMtZW5j
DQo+ID4gICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtdmNvZGVjLWVuYw0KPiA+ICsg
ICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk2LXZjb2RlYy1lbmMNCj4gPiAgICAgICAgLSBp
dGVtczoNCj4gPiAgICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4Ni12Y29kZWMtZW5j
DQo+ID4gICAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODMtdmNvZGVjLWVuYw0KPiA+
IEBAIC01OCw2ICs1OSwxMyBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgZGVzY3JpcHRpb246DQo+
ID4gICAgICAgIERlc2NyaWJlcyBwb2ludCB0byBzY3AuDQo+ID4gIA0KPiA+ICsgIG1lZGlhdGVr
LHZjcDoNCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Bo
YW5kbGUNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBSZWZlcmVuY2UgdG8gdGhl
IFZDUCAoVmlkZW8gQ28tUHJvY2Vzc29yKSBkZXZpY2UgdGhhdCBsb2Fkcw0KPiA+IGFuZCBleGVj
dXRlcw0KPiA+ICsgICAgICB0aGUgdmlkZW8gZW5jb2RpbmcgZmlybXdhcmUuIFRoZSBlbmNvZGVy
IGNvbW11bmljYXRlcyB3aXRoDQo+ID4gdGhlIGZpcm13YXJlDQo+ID4gKyAgICAgIHRocm91Z2gg
VkNQIHRvIHBlcmZvcm0gZW5jb2Rpbmcgb3BlcmF0aW9ucy4NCj4gPiArDQo+ID4gICAgcG93ZXIt
ZG9tYWluczoNCj4gPiAgICAgIG1heEl0ZW1zOiAxDQo+ID4gIA0KPiA+IEBAIC03Niw2ICs4NCwx
NyBAQCByZXF1aXJlZDoNCj4gPiAgICAtIGlvbW11cw0KPiA+ICANCj4gPiAgYWxsT2Y6DQo+ID4g
KyAgLSBpZjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjb21wYXRpYmxl
Og0KPiA+ICsgICAgICAgICAgY29udGFpbnM6DQo+ID4gKyAgICAgICAgICAgIGVudW06DQo+ID4g
KyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTYtdmNvZGVjLWVuYw0KPiA+ICsNCj4gPiAr
ICAgIHRoZW46DQo+ID4gKyAgICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAgIC0gbWVkaWF0ZWss
dmNwDQo+IA0KPiBBbmQgaGVyZSBzdGlsbCBkaWQgbm90IGltcGxlbWVudCB0aGUgY29tbWVudC4g
U28gYmFzaWNhbGx5IHlvdSBkaWQNCj4gbm90DQo+IGltcGxlbWVudCBmdWxseSB2MiBhbmQgdjMu
DQoNCklmIHlvdSBhcmUgbWVhbiBhYm91dCB0aGUgYGVsc2Ugc3RhdGVtZW50YCwgSSBsZWZ0IGEg
Y29tbWVudHMgYW5kIHdhbnQNCnRvIGdldCBhbiBleHBsYW5hdGlvbiBmcm9tIHlvdSwgaWYgeW91
IGZlZWwgdGhhdCBteSByZXBseSBpcw0KdW5zYXRpc2ZhY3Rvcnkgb3IgaW5jb3JyZWN0LCBwbGVh
c2UgbGV0IG1lIGtub3cuDQoNClRoZSBrZXkgcG9pbnQgaXMgdGhhdCBvdXIgcGF0Y2ggY2FuIHNh
dGlzZnkgeW91IGFuZCBnZXQgYSBSZXZpZXdlZC1ieQ0KZnJvbSB5b3UuDQoNClRoYW5rcw0KQmVz
dCBSZWdhcmRzDQogDQo+IA0KPiBBbmQgaWYgc29tZXRoaW5nIHdhcyBub3QgY2xlYXIsIHlvdSBo
YXZlIGVudGlyZSBodWdlIE1lZGlhdGVrDQo+IGNvbXBhbnksDQo+IHdpdGggaHVnZSBidWRnZXQg
YW5kIGVub3Jtb3VzIHJlc291cmNlcywgdG8gaGVscCB5b3UgaW5zdGVhZCBvZg0KPiBwdXNoaW5n
DQo+IHNvbWV0aGluZyB3aGljaCBpZ25vcmVzIHJldmlldyBUSElSRCB0aW1lLg0KPiANCj4gTkFL
DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg==

