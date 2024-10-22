Return-Path: <linux-media+bounces-20013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 513DB9A9986
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 08:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 704871C2533C
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 06:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600A4145B24;
	Tue, 22 Oct 2024 06:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qW1dgKqm";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="MN6ngMSv"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886026F066;
	Tue, 22 Oct 2024 06:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729577695; cv=fail; b=NjiS0v274weBSaUESLjpq6xhp1i0/R2nUfFEqxNDksY4OsGhe03FraZxNXORGbLgYcuqp95pWHCUQUCcx1cMXdCzIiHHLUE3FGUlf5KZw/xcjs/yoz56YJMv3NFLd68+nYHIfdsYBMRyy2rmHwKxmn8UpyJwOFgVsLu/71H2jkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729577695; c=relaxed/simple;
	bh=XPJhTfHtsOwaGI/MWQXAiKGSS8jvDyTG0VRsrFpoB+E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aSKJUCofoN/fPWWYY57SJ6yhz1LQEjdDW6k1WIyQezkWIKrLxj5OMcCSEFwWTmRJ7H5K0+Gfn2eCz0taQWk9oq3yX5DPwcob3ZCRprrxiLoI/Qt9ZbfCWochbO9r6iDWqtfa1eJwqXiSReiYcLLjZCo65Gbg4j5ecv3ITQJVJKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qW1dgKqm; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=MN6ngMSv; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: eedf9088903c11efb88477ffae1fc7a5-20241022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=XPJhTfHtsOwaGI/MWQXAiKGSS8jvDyTG0VRsrFpoB+E=;
	b=qW1dgKqmje395UAuPziyioc6lKoe26ByFsAPJoiBqH+ESnLYZph+Y54ujrPZgcao5A0QF8zRpaaJvnNDpmHBQdGIYo9vovGCstzQNCiLyprYHFDKiA9+QJAj8VErg6oCoEXlU+/vHeHUeX/cqdpwSFNNaOfYGwvLH62F4pwi+TI=;
X-CID-CACHE: Type:Local,Time:202410221414+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:e7fcb163-37fc-458d-9d38-131e5b7b1373,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:35de2c0d-1043-475c-b800-3262c01ea3e5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: eedf9088903c11efb88477ffae1fc7a5-20241022
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 662468293; Tue, 22 Oct 2024 14:14:45 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 22 Oct 2024 14:14:43 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 22 Oct 2024 14:14:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSYf8FP+AQaZTTpWiCB6NNOcqX9xdwLLLSbWmhEXTONcE1LvOQKbdHL+azg/7z12x2AQHhPJuKo16yDsYUA6sDBFo+TrwWyIUGK7xi/lBXn6lMfkAU4222DVfXy4bxaITkY6aMTI/iophyc7XZcnPhvyNI1N4aeCA+KuEbjxh5HLCRzYCfT/PMcVHXNPg43dJ+5nkUBv54yg/guZR4bCqUtIj9C3jyNgLsikoDKJGbNSftc6cbMFVZc7/ipa8c+haWKWVWtUaRdN/MAeptBFqn4X/K63TLnG56I0dz29yefqLCKBPytcUAOhFUVKYFggwKNNYh3u51RSx39g/7GvYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPJhTfHtsOwaGI/MWQXAiKGSS8jvDyTG0VRsrFpoB+E=;
 b=wK4IfAGe+0c1hL39p5J9/Xpo+3+Nzj0wdMF/jNcQJ+VOikrfV1r4Zhw2E9fCa/gT78jOOEyBgU1mx1kNgfRE1/tcpLsSygJhyHQCUv5/e3gA8o7SoiIjpV0D2EQhXT/U0O2OYgfl19E6HBZg04w+hZrZJzeR0ZGJjukxo2bXB78gZioQsEFicD7zLMD5jdWChcLTN+EyvXrHOFxrB6I4U47Hka1xtAEiIDaZoFQRSC0iJUmvmSIYk2cnO9YeQwH6+stVEHB9ew26Zg+nCzXOv+DFUif9SzAuxbmWZGEuEWykr198HS/PU8Tmeh13DXVpfEIYNIBu8RMB0Rc7UTQ7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPJhTfHtsOwaGI/MWQXAiKGSS8jvDyTG0VRsrFpoB+E=;
 b=MN6ngMSvYzafBcrngPaBM4fQdZHW/H3b0WjDapImcqJbYqQCvroGl7729NXz4YkPKw8Vywvdi/4PXidqPlNoUsixMCItUPMoFF04MVH8hBY/sw7C9qo3y/ew5AmGOTlQ/6U/TGW+hlZmIfwt65HQO5zVvE4avLHBVY6TNc+n2Hk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by OSQPR03MB8387.apcprd03.prod.outlook.com (2603:1096:604:27b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Tue, 22 Oct
 2024 06:14:35 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 06:14:34 +0000
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
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Topic: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7KSXtgA
Date: Tue, 22 Oct 2024 06:14:34 +0000
Message-ID: <7f8c4425a0fd3c6bcad281465788b9d947ee987d.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|OSQPR03MB8387:EE_
x-ms-office365-filtering-correlation-id: 5eed1266-dbf2-4e32-6c87-08dcf260ccf4
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SEJmTGlmNEc0aklUN3R0QnM4UnNNVTF6MDZqdHpNNERtUkZLMkh4WmE4VHY1?=
 =?utf-8?B?Tmk2RnlMS2hxanUvZEYzNjhyMTJwdFIvdGhOUUY4YnZ2K0pPb054Vm1idGVo?=
 =?utf-8?B?TWgycytvTGlSUHUxbHpuZGk4MHpkS25LRGVhMU1kNkJsVUx2bnRWZi9ObHlV?=
 =?utf-8?B?YVo0M0o5Z0hvVVdvM01nRVI2NnNsZUJqL1doUVVScU5VU09vWkVoaTRTS2dw?=
 =?utf-8?B?NTh5K28zVGpiZzcxNVhadUhVQmdCQi9uTWdrTTR2VU9vMzJraEpoK1dSUFQ3?=
 =?utf-8?B?YUMxVUYxaWpKYkMwd0ZHSnR4blpuL095Ujg2Y296V2h3VFF6QnZWOVZvaXA4?=
 =?utf-8?B?ODg1UThIZW1xQlNTSks3bHZacncwMVVqK2lrU3RTUVA4OUFzempuUXhGTDd0?=
 =?utf-8?B?TUZBeGZBSGU4ZVVyaXZMM21BbjlwbHg3UCt5N2tSMmJCNGdQN296cmhnZ3pH?=
 =?utf-8?B?T2NnUFlYWk5Ocy9OemJlaGtsVnA0WHJQZ3h6bTBuUEVKaUtoMGgzdjR6bEZD?=
 =?utf-8?B?TDYxYW5ENm5taUU5VVU0SWdibi9uU1N0M0VDU21JZFovQXY1TkErdkE5Uk1U?=
 =?utf-8?B?STVaQ1lXSXBURStsWkMwMG93RFkyTzMvMWJRUGFlN3hQYWcwaVVpRk5qRmRr?=
 =?utf-8?B?ZWRKNFlLM0R2QTJ6N0MzbW5qc1RUbHB3cVJBajh1a3pHMHJxY0xvSUVlb3RP?=
 =?utf-8?B?YU1meHc4UU9oNUtOM251TnJYbE13dnpvdDJsSnhlRk5OMkZxK2VvWUozd0hG?=
 =?utf-8?B?dlBQR1pWMGV1bldwb1daVnd1bVBtMVEvWlVZTkVwcExzMkE0UWJRVUEwdm91?=
 =?utf-8?B?dnlnRy9VNGNpQ3BzQ25XMTB3QWZGZkdXdi9IcE9hazZhcE1yeC96ejd5MHpN?=
 =?utf-8?B?V1MyK1MrZzNvYnFORTlSbDhUYncrRWo1anpQR3pLT3JaYUVHN1gyR21kbitF?=
 =?utf-8?B?clFNckZiUmNVd1FMZHVGV1hMd2RYeUJUZlZURHJRQUJFbGFETE9QNXpxaUtZ?=
 =?utf-8?B?L2MyUTRLcjFOSkNNTmZxWDZVSGZIQWorL3RGWm53TmJlODFidEtYV2hNQ0tJ?=
 =?utf-8?B?bnlMTzY2VzhlcGNCNUhySEp1WnE2K0VrbEFJczkvZ0hzTWJtRW0waXIxZXBm?=
 =?utf-8?B?cEtQdDV0QThuc1Myem5wa3JPd0JWRUcvSDMyalkzSm9lVlk5V2NYcG96dXhp?=
 =?utf-8?B?N2RqeUhSK2FRNlhwZEcyRFlzcDcwVlVMV2RTdzRuTlJzVWc3a3Z5dWs1K05q?=
 =?utf-8?B?dVpVbnk0NHZFWVZKN1YvK0UxOUY2Ti9VM3BMNVNYa0JkRHhmNUJnaHdQcytN?=
 =?utf-8?B?Ni9sRGRRckxRbTEwb0RnQk9VclhEUk8vYXV4VmtrOEFlRFRBMjdnSWxOS3F2?=
 =?utf-8?B?SUlEdjJRREgzcnVodWpGRTZEWkI0MU1ZMU4zQmc0blVZZEQxbktuR0V0R09h?=
 =?utf-8?B?dERYTlkvclM2eXk0eTNaYzFzMGZtRE1oYkw4RXYyVlFPUEVqeC85VEJldThW?=
 =?utf-8?B?ZW5nM0ZIUkVScjU2ZWVLY2RJR3NGSGkvNEMxa0lkL2dzSXM0dHk1djRYclhu?=
 =?utf-8?B?U0pwSVRnUm53RGxKTVVobnB1T09sTDhIUkhrZWJMYk1LZVlqK0lJVUNXY2dH?=
 =?utf-8?B?c2xHck5hNDFkTlZ4QURSQzJSMmpWQWxIdFlaRS95eEtOR1g1WnJPdFB0RThv?=
 =?utf-8?B?akQ1NGlxRHNVczVqUHduQjA1KzRibVgwQ0pyTU85MG9lVnhvb3prSTZWeXEv?=
 =?utf-8?B?UTNXeHpVUkRQZlVMYWRqTnR6UzhtS2FJZXZtZjFxUkpPb3hneStTSUduSUdr?=
 =?utf-8?Q?xWlw4wXx6iefpnbC/pSIKJq3Ai7vi9WInObvw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUxZeUdYVWh1MGxaai9UU0tDMDNEQ3RVYkRaOEF0WVNWYXY2OGJ1cHVSczRV?=
 =?utf-8?B?WUVKeTRVeVBmc3kzWEpBUVhMWGx3cndBRlB5VUFxa09LSllEY3VxZTRhU1Z6?=
 =?utf-8?B?dWxOdzk2NU11NnNVUXNCRkw2L29MbzB0U3Y2Nm5qRGd2cE9VOXRHaXVRdlpv?=
 =?utf-8?B?ZTNnZVpZUnY1VnNpVlJRYUlpS2FGNHRtVkQ1VjlWckJHVDdZY1J6Z2llaVla?=
 =?utf-8?B?S0VPNlJCaDVkSjJqWCtMNTVLY1Q5RGc4VDk5eDA5dGFocHRVM1d0MmprckNF?=
 =?utf-8?B?cXFzdmZ5ZHBvanZBdkhPR1pWNlBFZTV3cS82NVJ5T3lTYzYyQ1ZYV3U3Nkdr?=
 =?utf-8?B?anFCbW5ndFZudFdWTzVxcXNXSVdyYVcwc1M0MXlnVHRHNDRId2xOWFpvbGI4?=
 =?utf-8?B?c3p3NUVMbEI5NWdoNlprZW9QWE0zRlUvZlYxdVhMeTFSNlJPMlQwS1MyaSs0?=
 =?utf-8?B?NWt1KzE5NkhPYUxPOE40U2FLckNIRzRVK1M2alRycGRKZVpIMnI2UnJRcVFU?=
 =?utf-8?B?MlAzTU9ETkpvc09NMWZUZVh6U1pSTHR5dUFKSjFpNWFhMmozd2FNZjc4eEdE?=
 =?utf-8?B?SHl5MGZIMFVkQ21VSmdLZ21RM3JNejNMYXZCWnZwWjdMK3o5M09DalBmRy9Z?=
 =?utf-8?B?Ri8reEY3TVlDUCthYmFoeDY5UjZrUyt2RUhJd2pGRUtVcFJ6QVpUblI0NWFm?=
 =?utf-8?B?dTRpQi9zZDN6SENVeS93OFlxNng3a3FnT0puN1VJMWRKd293MGdOaEl3VHdx?=
 =?utf-8?B?TTdKSDdGQkY0WTlzeVhQUGo3UmpLbm50VnhkclZwcU1TU3BxTWYwWThCTEMw?=
 =?utf-8?B?Rnc2djJMbkdOZjdNV3BCYTJvaG41ZGcxd0hXd0l5ZEZ4eDc0ZVdrN2hUcmpj?=
 =?utf-8?B?dnZITWFPeGpXWFhIRUdCUHRUcHBrT1RHSFY4UVV4U2YrbVhDOGZ4dGpSbWxu?=
 =?utf-8?B?RVgyRWIxNU42dS9oUndRVGhkRlJ5ZjVQZkEreWRWSDJON3JCYnhlZnBaSnNm?=
 =?utf-8?B?S2JRR2dEcU1YNEM0alV0TUE5OE9hTWRydlNiT2RJbEtGMGRwM2xHbzQreFdp?=
 =?utf-8?B?ZXRxeCs1VlB4aEpyOUhnVVRreVFiQjZpSXZuVnNueXNXemZtL1hrTDlkOTEx?=
 =?utf-8?B?SXFLOXBMaEVPU1NNVXpsNUJrTnNIUVlJNDhZemFkTTdrM3ZwL3dCaVdjczNj?=
 =?utf-8?B?Q0t2bFB2QVg0dWh6N2Iwb1NqWlRVMkoycldtamkzZmtPUVMvc1k3Smw3bklP?=
 =?utf-8?B?YmIrOXRJQUFuSEpZT1htU1pkMWU5b3hmdEZGT0kyZE9aMHRYZVF0ZFhUeGtI?=
 =?utf-8?B?SEFPQnFmdDM5akRoZDMzWXFMSFJGU2pBMEZCV20vNGRORExQV2tWRXFWVWIy?=
 =?utf-8?B?emdRWGJtNnZ1ZGVmR3JrdWxMSld3eXh1NDA5aThmR3BLNTdIenhvL1RKazAx?=
 =?utf-8?B?N296WGoxOTg4K3B1MzZhajkxN3Y4ZUluQ290R1FKajJ2V0d6bGozUXNhdVZy?=
 =?utf-8?B?c3M0dVpVbWNXOGZWeWlqTkpLRnA0cm8yVkVBd1BNS21rNFpobDJobllLQkZ1?=
 =?utf-8?B?RHo5THdwMW1TLy9vSFZRZ0x6M00yWmxIUkdaOHNmdm5pUVM0TkMyUnNiUXNW?=
 =?utf-8?B?V2NMNjB2ZUZkamgrVlhtVTJkekVFVDRkdytmNkFJWkhGZXVCeTN3Q3QydVNh?=
 =?utf-8?B?VWlmYk9RakJKaHVlVjR5UmkwdzF4dFd5UXlNZS9uQnVYeEliM1pnVmpreFZC?=
 =?utf-8?B?MEppZWh4Mjlxc1RWNGFMbHZoYlR0YWtsakVLMVBBcU1wOE9HaExPbUx2VXBJ?=
 =?utf-8?B?cGJacGdublNlZWFkSDNsdGFSN1hMSkNDUXpDakJ5anlSME83S2N3aUtHZzIr?=
 =?utf-8?B?Z2dGcHREMUNqcXdqMm5iWm1FdWtLUnZ1L3c0bHA1c3Y0UFcwczJiUmJmYnZ0?=
 =?utf-8?B?YWVYUndsbGFyQ2JobzRmRTBFSjJ0N1V2MG5MVXlNQ1VkQ25SRlFFMG5ScHFs?=
 =?utf-8?B?bGpWR09UMHdjcGVSTElwK0tCQndnWUQya3FQcVh0Sk55TmNRK1dCOFFtNWxW?=
 =?utf-8?B?QkRtSzBwaDdXazdqNDJOUUpVSXVTa3JqQ2FybWlvSEptZUYvUDhiU2pwRVRa?=
 =?utf-8?Q?J1tvz3RC+BvHvX0/Et/5L7eho?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4B2EE2C2490A0469B0EFDE159EF063F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eed1266-dbf2-4e32-6c87-08dcf260ccf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 06:14:34.8792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RwaDNzb2Kn4USa5ykYV/NvYJMNyt3cHxTRU/53cIFLQZbNz+8Xx1t/G78JAJF1whZldxAKqDlaNCTgxWbnfhnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8387

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBJU1AgcGlwZWxpbmUgZHJpdmVy
IGZvciB0aGUgTWVkaWFUZWsgSVNQIHJhdyBhbmQgeXV2DQo+IG1vZHVsZXMuIEtleSBmdW5jdGlv
bmFsaXRpZXMgaW5jbHVkZSBkYXRhIHByb2Nlc3NpbmcsIFY0TDIgaW50ZWdyYXRpb24sDQo+IHJl
c291cmNlIG1hbmFnZW1lbnQsIGRlYnVnIHN1cHBvcnQsIGFuZCB2YXJpb3VzIGNvbnRyb2wgb3Bl
cmF0aW9ucy4NCj4gQWRkaXRpb25hbGx5LCBJUlEgaGFuZGxpbmcsIHBsYXRmb3JtIGRldmljZSBt
YW5hZ2VtZW50LCBhbmQgTWVkaWFUZWsNCj4gSVNQIERNQSBmb3JtYXQgc3VwcG9ydCBhcmUgYWxz
byBpbmNsdWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhz
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgYm9v
bCBtdGtfY2FtX3Jhd19yZXNvdXJjZV9jYWxjKHN0cnVjdCBtdGtfY2FtX2RldmljZSAqY2FtLA0K
PiArCQkJCSAgICAgIHN0cnVjdCBtdGtfY2FtX3Jlc291cmNlX2NvbmZpZyAqcmVzLA0KPiArCQkJ
CSAgICAgIHM2NCBwaXhlbF9yYXRlLCBpbnQgcmVzX3BsYW4sDQo+ICsJCQkJICAgICAgaW50IGlu
X3csIGludCBpbl9oLCBpbnQgKm91dF93LCBpbnQgKm91dF9oKQ0KPiArew0KPiArCWludCByZXNf
c3RlcF90eXBlID0gMDsNCj4gKwlpbnQgdGdvX3B4bF9tb2RlID0gMTsNCj4gKwlpbnQgcGl4ZWxf
bW9kZVtNVEtfQ0FNU1lTX1JFU19TVEVQX05VTV0gPSB7MH07DQo+ICsJaW50IGJpbl90ZW1wID0g
MCwgZnJ6X3RlbXAgPSAwLCBod25fdGVtcCA9IDA7DQo+ICsJaW50IGJpbl9lbiA9IDAsIGZyel9l
biA9IDAsIHR3aW5fZW4gPSAwLCBjbGtfY3VyID0gMDsNCj4gKwlpbnQgaWR4ID0gMCwgY2xrX3Jl
cyA9IDAsIGlkeF9yZXMgPSAwOw0KPiArCWJvb2wgcmVzX2ZvdW5kID0gZmFsc2U7DQo+ICsJaW50
IGxiX2Noa19yZXMgPSAtMTsNCj4gKwlpbnQgZnJ6X3JhdGlvID0gMTAwOw0KPiArCWludCBwOw0K
PiArDQo+ICsJcmVzLT5yZXNfcGxhbiA9IHJlc19wbGFuOw0KPiArCXJlcy0+cGl4ZWxfcmF0ZSA9
IHBpeGVsX3JhdGU7DQo+ICsJLyogdGVzdCBwYXR0ZXJuICovDQo+ICsJaWYgKHJlcy0+cGl4ZWxf
cmF0ZSA9PSAwKQ0KPiArCQlyZXMtPnBpeGVsX3JhdGUgPSA0NTAgKiBNSHo7DQo+ICsJZGV2X2Ri
ZyhjYW0tPmRldiwNCj4gKwkJIltSZXNdIFBSID0gJWxsZCwgdy9oPSVkLyVkIEhXTiglZCkvQklO
KCVkKS9GUlooJWQpLFBsYW46JWRcbiIsDQo+ICsJCXJlcy0+cGl4ZWxfcmF0ZSwgaW5fdywgaW5f
aCwNCj4gKwkJcmVzLT5od25fbGltaXRfbWF4LCByZXMtPmJpbl9saW1pdCwgcmVzLT5mcnpfbGlt
aXQsIHJlcy0+cmVzX3BsYW4pOw0KPiArDQo+ICsJbWVtY3B5KHJlcy0+cmVzX3N0cmF0ZWd5LCBy
YXdfcmVzb3VyY2Vfc3RyYXRlZ3lfcGxhbiArIHJlcy0+cmVzX3BsYW4sDQo+ICsJICAgICAgIE1U
S19DQU1TWVNfUkVTX1NURVBfTlVNICogc2l6ZW9mKGludCkpOw0KPiArCXJlcy0+YmluX2VuYWJs
ZSA9IDA7DQo+ICsJcmVzLT5yYXdfbnVtX3VzZWQgPSAxOw0KPiArCXJlcy0+ZnJ6X2VuYWJsZSA9
IDA7DQo+ICsJcmVzLT5mcnpfcmF0aW8gPSBmcnpfcmF0aW87DQo+ICsJZm9yIChpZHggPSAwOyBp
ZHggPCBNVEtfQ0FNU1lTX1JFU19TVEVQX05VTSA7IGlkeCsrKSB7DQo+ICsJCXJlc19zdGVwX3R5
cGUgPSByZXMtPnJlc19zdHJhdGVneVtpZHhdICYgTVRLX0NBTVNZU19SRVNfSURYTUFTSzsNCj4g
KwkJc3dpdGNoIChyZXNfc3RlcF90eXBlKSB7DQo+ICsJCWNhc2UgTVRLX0NBTVNZU19SRVNfQklO
X1RBRzoNCj4gKwkJCWJpbl90ZW1wID0gcmVzLT5yZXNfc3RyYXRlZ3lbaWR4XSAtIEVfUkVTX0JJ
Tl9TOw0KPiArCQkJaWYgKGJpbl90ZW1wIDw9IHJlcy0+YmluX2xpbWl0KQ0KPiArCQkJCWJpbl9l
biA9IGJpbl90ZW1wOw0KPiArCQkJaWYgKGJpbl9lbiAmJiBmcnpfZW4pDQo+ICsJCQkJZnJ6X2Vu
ID0gMDsNCj4gKwkJCWJyZWFrOw0KPiArCQljYXNlIE1US19DQU1TWVNfUkVTX0ZSWl9UQUc6DQo+
ICsJCQlmcnpfdGVtcCA9IHJlcy0+cmVzX3N0cmF0ZWd5W2lkeF0gLSBFX1JFU19GUlpfUzsNCj4g
KwkJCWlmIChyZXMtPmZyel9saW1pdCA8IDEwMCkNCj4gKwkJCQlmcnpfZW4gPSBmcnpfdGVtcDsN
Cj4gKwkJCWJyZWFrOw0KPiArCQljYXNlIE1US19DQU1TWVNfUkVTX0hXTl9UQUc6DQo+ICsJCQlo
d25fdGVtcCA9IHJlcy0+cmVzX3N0cmF0ZWd5W2lkeF0gLSBFX1JFU19IV05fUzsNCj4gKwkJCWlm
IChod25fdGVtcCArIDEgPD0gcmVzLT5od25fbGltaXRfbWF4KQ0KPiArCQkJCXR3aW5fZW4gPSBo
d25fdGVtcDsNCj4gKwkJCWJyZWFrOw0KPiArCQljYXNlIE1US19DQU1TWVNfUkVTX0NMS19UQUc6
DQo+ICsJCQljbGtfY3VyID0gcmVzLT5yZXNfc3RyYXRlZ3lbaWR4XSAtIEVfUkVTX0NMS19TOw0K
PiArCQkJYnJlYWs7DQo+ICsJCWRlZmF1bHQ6DQo+ICsJCQlicmVhazsNCj4gKwkJfQ0KPiArDQo+
ICsJCS8qIDEgZm9yIGZvcmNlIGJpbiBvbiAqLw0KPiArCQlpZiAocmVzLT5iaW5fbGltaXQgPj0g
MSkNCj4gKwkJCWJpbl9lbiA9IDE7DQo+ICsNCj4gKwkJaWYgKHJlcy0+aHduX2xpbWl0X21pbiA+
IDEpDQo+ICsJCQl0d2luX2VuID0gMTsNCj4gKw0KPiArCQkvKiBtYXggbGluZSBidWZmZXIgY2hl
Y2sqLw0KPiArCQlsYl9jaGtfcmVzID0gbXRrX3Jhd19saW5lYnVmX2Noayh0d2luX2VuLCByZXMt
PmJpbl9saW1pdCAmIEJJTl9PTiwNCj4gKwkJCQkJCSBmcnpfZW4sIHJlcy0+YmluX2xpbWl0ICYg
UUJORF9PTiwNCj4gKwkJCQkJCSBpc19jYm5fZW4ocmVzLT5iaW5fbGltaXQpLA0KPiArCQkJCQkJ
IGluX3csICZmcnpfcmF0aW8pOw0KPiArCQkvKiBmcnogcmF0aW8qLw0KPiArCQlpZiAocmVzX3N0
ZXBfdHlwZSA9PSBNVEtfQ0FNU1lTX1JFU19GUlpfVEFHKSB7DQo+ICsJCQlyZXMtPmZyel9yYXRp
byA9IHJlcy0+ZnJ6X2xpbWl0IDwgRlJaX1BYTE1PREVfVEhSRVMgPw0KPiArCQkJCXJlcy0+ZnJ6
X2xpbWl0IDogRlJaX1BYTE1PREVfVEhSRVM7DQo+ICsJCX0NCj4gKwkJLyp0cnkgMS1waXhlbCBt
b2RlIGZpcnN0Ki8NCj4gKwkJZm9yIChwID0gMTsgcCA8PSBNVEtfQ0FNU1lTX1BST0NfREVGQVVM
VF9QSVhFTE1PREU7IHArKykgew0KDQpNVEtfQ0FNU1lTX1BST0NfREVGQVVMVF9QSVhFTE1PREUg
aXMgMSwgc28gdGhpcyBmb3ItbG9vcCBjb3VsZCBiZSBkcm9wcGVkLg0KDQo+ICsJCQl0Z29fcHhs
X21vZGUgPSBtdGtfcmF3X3BpeGVsbW9kZV9jYWxjKHAsIHR3aW5fZW4sDQo+ICsJCQkJCQkJICAg
ICAgYmluX2VuLCBmcnpfZW4sDQo+ICsJCQkJCQkJICAgICAgcmVzLT5mcnpfcmF0aW8pOw0KDQpt
dGtfcmF3X3BpeGVsbW9kZV9jYWxjKCkgd291bGQgYWx3YXlzIHJldHVybiAxLCBzbyBtdGtfcmF3
X3BpeGVsbW9kZV9jYWxjKCkgY291bGQgYmUgZHJvcHBlZC4NCg0KUmVnYXJkcywNCkNLDQoNCj4g
KwkJCS8qKg0KPiArCQkJICogaXNwIHRocm91Z2hwdXQgYWxvbmcgcmVzb3VyY2Ugc3RyYXRlZ3kN
Cj4gKwkJCSAqIChjb21wYXJlZCB3aXRoIHBpeGVsIHJhdGUpDQo+ICsJCQkgKi8NCj4gKwkJCXBp
eGVsX21vZGVbaWR4XSA9IHRnb19weGxfbW9kZTsNCj4gKw0KPiArCQkJLyogb25seSBzdXBwb3J0
IDEtcGl4ZWwgbW9kZSAqLw0KPiArCQkJaWYgKHAgPT0gMSAmJiBsYl9jaGtfcmVzID09IExCX0NI
RUNLX09LKSB7DQo+ICsJCQkJaWYgKCFyZXNfZm91bmQpIHsNCj4gKwkJCQkJcmVzLT5iaW5fZW5h
YmxlID0gYmluX2VuOw0KPiArCQkJCQlyZXMtPmZyel9lbmFibGUgPSBmcnpfZW47DQo+ICsJCQkJ
CXJlcy0+cmF3X251bV91c2VkID0gdHdpbl9lbiArIDE7DQo+ICsJCQkJCWNsa19yZXMgPSBjbGtf
Y3VyOw0KPiArCQkJCQlpZHhfcmVzID0gaWR4Ow0KPiArCQkJCQlyZXNfZm91bmQgPSB0cnVlOw0K
PiArCQkJCQlicmVhazsNCj4gKwkJCQl9DQo+ICsJCQl9DQo+ICsJCX0NCj4gKwkJZGV2X2RiZyhj
YW0tPmRldiwNCj4gKwkJCSJSZXMtJWQgQi9GL0gvQz0lZC8lZC8lZC8lZCAtPiAlZC8lZC8lZC8l
ZCAoJWQpKCVkKVxuIiwNCj4gKwkJCWlkeCwgYmluX3RlbXAsIGZyel90ZW1wLCBod25fdGVtcCwg
Y2xrX2N1ciwgYmluX2VuLA0KPiArCQkJZnJ6X2VuLCB0d2luX2VuLCBjbGtfY3VyLCBsYl9jaGtf
cmVzLCBwaXhlbF9tb2RlW2lkeF0pOw0KPiArCX0NCj4gKw0KPiArCXRnb19weGxfbW9kZSA9IHBp
eGVsX21vZGVbaWR4X3Jlc107DQo+ICsJc3dpdGNoICh0Z29fcHhsX21vZGUpIHsNCj4gKwljYXNl
IDE6DQo+ICsJCXJlcy0+dGdvX3B4bF9tb2RlID0gMDsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSAy
Og0KPiArCQlyZXMtPnRnb19weGxfbW9kZSA9IDE7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgNDoN
Cj4gKwkJcmVzLT50Z29fcHhsX21vZGUgPSAyOw0KPiArCQlicmVhazsNCj4gKwljYXNlIDg6DQo+
ICsJCXJlcy0+dGdvX3B4bF9tb2RlID0gMzsNCj4gKwkJYnJlYWs7DQo+ICsJZGVmYXVsdDoNCj4g
KwkJYnJlYWs7DQo+ICsJfQ0KPiArDQo+ICsJbXRrX3Jhd191cGRhdGVfZGVidWdfcGFyYW0oY2Ft
LCByZXMsICZjbGtfcmVzKTsNCj4gKw0KPiArCWlmIChyZXNfZm91bmQpIHsNCj4gKwkJZGV2X2lu
Zm8oY2FtLT5kZXYsDQo+ICsJCQkgIlJlcy1lbmQ6JWQgQklOL0ZSWi9IV04vQ0xLL3B4bD0lZC8l
ZCglZCkvJWQvJWQvJWQsIGNsazolZFxuIiwNCj4gKwkJCSBpZHhfcmVzLCByZXMtPmJpbl9lbmFi
bGUsIHJlcy0+ZnJ6X2VuYWJsZSwgcmVzLT5mcnpfcmF0aW8sDQo+ICsJCQkgcmVzLT5yYXdfbnVt
X3VzZWQsIGNsa19yZXMsIHJlcy0+dGdvX3B4bF9tb2RlLA0KPiArCQkJIHJlcy0+Y2xrX3Rhcmdl
dCk7DQo+ICsJfSBlbHNlIHsNCj4gKwkJZGV2X2RiZyhjYW0tPmRldiwgIlslc10gRXJyb3IgcmVz
b3VyY2UgcmVzdWx0XG4iLCBfX2Z1bmNfXyk7DQo+ICsJfQ0KPiArCWlmIChyZXMtPmJpbl9lbmFi
bGUpIHsNCj4gKwkJKm91dF93ID0gaW5fdyA+PiAxOw0KPiArCQkqb3V0X2ggPSBpbl9oID4+IDE7
DQo+ICsJfSBlbHNlIGlmIChyZXMtPmZyel9lbmFibGUpIHsNCj4gKwkJKm91dF93ID0gaW5fdyAq
IHJlcy0+ZnJ6X3JhdGlvIC8gMTAwOw0KPiArCQkqb3V0X2ggPSBpbl9oICogcmVzLT5mcnpfcmF0
aW8gLyAxMDA7DQo+ICsJfSBlbHNlIHsNCj4gKwkJKm91dF93ID0gaW5fdzsNCj4gKwkJKm91dF9o
ID0gaW5faDsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gcmVzX2ZvdW5kOw0KPiArfQ0KPiArDQo=

