Return-Path: <linux-media+bounces-21735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F24A29D4AFE
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 11:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EBA1282187
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 10:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4831D042A;
	Thu, 21 Nov 2024 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Z8QA4o2F";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="VkcgNsmS"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B3E13C695;
	Thu, 21 Nov 2024 10:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732185727; cv=fail; b=Piv6WL5o++kc+q4X9JC07zFO1d438ovKrnThQ+QmgkRSdGz4Tqj5CFI2WkC2c/8tt2PhdENtDdNStDznTV0qyVNn3/DJd0JI3QE7TFlOuH11VisfHwQJOFVZYWLmJAa3RTgMwkEf8DBIAT5+Z3kAsfZ4x64iuRU9ApJ9qDqSDuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732185727; c=relaxed/simple;
	bh=CdKwedDdeOBFj/buPk5vfvUn5cG/NPN/9YlhpSDyL+Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y5uYy1kMr6lnlhN0nuqhrqxvbQY/oALF9kGMKWHnMfOLuqTsJG6JTDSkL8e+lzBm1cFDJOv7EoWaFgKzVGHu+F3/SjoCRP7rtQ9y1OYDpUfu0mEbiqWTIJWwjt6kYeC/rOJwWCLjcaf8BCdf9+mPRWBNjjxvkK3+dqL/+HfNaH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Z8QA4o2F; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=VkcgNsmS; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3ce8a48ea7f511ef99858b75a2457dd9-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=CdKwedDdeOBFj/buPk5vfvUn5cG/NPN/9YlhpSDyL+Y=;
	b=Z8QA4o2FrdUGFLlsgDamgRr+M3HP5betyVp5E1ijYC4u4xXNzYvVzaXA9gG1DIrkp7wLEJYDrnnj26mQ7QWaMtW7MOC/1MsiTA92kdkRKnCw/29FcyCpAt4Kf8BQm0KwFMLcYXC2pWYFOuptfmhgpXONJQOXHgr8phHuLwOdFeI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:37125544-6f7c-4f91-afe8-5c0c9d83cfc9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:e8a92cb9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3ce8a48ea7f511ef99858b75a2457dd9-20241121
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 736090459; Thu, 21 Nov 2024 18:42:00 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 18:41:59 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 18:41:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQwTcuQtU+bW1S9SUsHQ6CZ1t+32bv0Dt2FVFfK3e9kXHROhYkiziF2YVU5EafbVTJRvIBqgV8xJPw8UBjbeoFPsGU2WK7uSwSoMLXu5CAgyN4hfvKweBRccAM6r8C8/HT8PjzkM7IFnzimJWR/Rr5h1MfggWrWdaNhzFkG8SnyLruviwP3HZAEv/CCb4I46NDtSdnuS3CCCAMS9zNAFi2dRNG1V9U/ceEw+p/cFFSOhMiEo0jvAof13WPA3vIh+N44U+t7J2z8qiMbhuoL8vZ8irSyW5c7uGaYhFwqM2d+fXSvZX4ZTUKgTwBbkDfF5gohzQMlLnevjImHsoGwegw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdKwedDdeOBFj/buPk5vfvUn5cG/NPN/9YlhpSDyL+Y=;
 b=WS07QTUyuInhtZQ52fE2+hNEqDUb6xzkwC/ZGmqocu7z8+qwoHYbc8rUSm9f8IfxfngtajyGClTTZ3pwCW2A8Ro8cOIuna6QosMGYG+zJaF7vtOK2kijR6yav/iw8BnVqC1JNzDFZwJsnfub2jG+OP3eJrkWL2mhbv5mq4vsbhxhy3JTgne30kMnQoY/vTTXDThs67+GCWxoqihxG9ytw60/ZVftNcar5gdcejb4hvyWxX9HAfnKRcSp1hCopcU74lYF4K8O773H5tnb2EXblY23914aY/5CLr6MrKRMFuGep57j6TgP8aXLVMr5V68VU/3M0hgOt0OiCZFr343E3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdKwedDdeOBFj/buPk5vfvUn5cG/NPN/9YlhpSDyL+Y=;
 b=VkcgNsmSK//Ne4G4E45uvxpSMGHb451CTRafPVQiNsOWxkdB4GjD0LfPVwTRjD/ELb5DfsnSgrgCCuy1hJd9zwjbP1jBqUV75HVAk0HexA9zHwYnCAKowb8LBsD22IdZ/iotYE1gWiw6e4braJOW1iaQ8oHbJDpHzSgYKhKIpwo=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB6450.apcprd03.prod.outlook.com (2603:1096:400:1ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 10:41:56 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%4]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 10:41:55 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
	<ck.hu@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
	<Moudy.Ho@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/8] soc: mediatek: mtk-cmdq: Add unsupported subsys ID
 programing flow
Thread-Topic: [PATCH 4/8] soc: mediatek: mtk-cmdq: Add unsupported subsys ID
 programing flow
Thread-Index: AQHbO82fKKr3P4M60EC0KHpKfsgs57LBSD2AgAAJKoCAADrzAA==
Date: Thu, 21 Nov 2024 10:41:55 +0000
Message-ID: <f4e6e86e0c929d45ca1af123fd7f4bb98072addb.camel@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
	 <20241121042602.32730-5-jason-jh.lin@mediatek.com>
	 <f637f72960e84efb88dc6ed8482ea7a0d6bfcd25.camel@mediatek.com>
	 <89d7718e29dd7ec80a2b457bca9a6f9cae888bac.camel@mediatek.com>
In-Reply-To: <89d7718e29dd7ec80a2b457bca9a6f9cae888bac.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB6450:EE_
x-ms-office365-filtering-correlation-id: a9f5128e-c155-4b0b-5e54-08dd0a191e61
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a3p4cnh6L0Y3M0FQK0hBcGlzSkJmQzNYWVBicE5vd25zcXdBUXUwWDZ6cjBt?=
 =?utf-8?B?SytmQUFmY0xyWUdlcHh4TWpCSUZlN0wrNVRxa0oyVlU2a0hMQlJXVWZLYU9k?=
 =?utf-8?B?bzA0cVN4czNNR3F6RjJKakYzUzNGa3lTTzdMQklFdmU3YmNXZHpkR3RZTVBk?=
 =?utf-8?B?RGx4dXplZUk4Z05JRjRvM2g3K2h6N0J0bzFGVFBLZ21vZXlxaVhsMWhsa05Y?=
 =?utf-8?B?OGdDSmZQQmdXcERMcUVIR3lOaWd6M2E5cDJDaGFNZ0duM1VXeHEzSElGYXJr?=
 =?utf-8?B?LzFFaTB4cUpWallVcGZHb0pUeXUvMENUcHdYTUV3ZUlIblZQZFRXc01pS1Yr?=
 =?utf-8?B?K0JQb2UvTy9IUFcvdjFabS9yU0xieGU3RlBGaVJ0eU1ZaTlHaEdObll6dU1r?=
 =?utf-8?B?bGowZHNyK1dNNXJ5WWZFY09SOFVFZzV5MDc3WnFrM0lHVHZDc29BdHlTTFR4?=
 =?utf-8?B?Y3hWM1Z5RngwdUhaMnRCUUZsZG5wZUhHVWs0MCsxN2lNekIrTnoydHRWSUVq?=
 =?utf-8?B?NEZQVjllcU84ckFMdWl1QnJiUURScElHczAyM2ZFT3BXWmNUNVdQcHVsblJs?=
 =?utf-8?B?RjZJaWY2SzhBR1kwTTlrSVQzUGZqMTljWFFXQ2lUTHVtYlVPa0NLMFNBVE15?=
 =?utf-8?B?a284aDZxNkt6YlRLUWZUZDFaaUVWa244RXJnQzJDTnF0NTZTc2R3VTlNN21U?=
 =?utf-8?B?MU9MNGdYS0NIUlFDQ0J1bzROQmNjOE9zMlFiWkM2NTlUYm1uekJqcUx2Rlh6?=
 =?utf-8?B?N3ZkazI1OWt0SlppczJyRnFFMk1ZcUtvRkpwaStGN0twd1dLTlNLS0krLzcx?=
 =?utf-8?B?WkxqSXRkQjFteUJBMjFud0NkZTdDaXFPa3dkNW5KTnU0YWc3cE0rUjE1Z25s?=
 =?utf-8?B?b2VVUVNTWUpMTkJsNGFYcmlad3UwNXl0UUttSU5xaWUyT01GSDUyOFdia0l4?=
 =?utf-8?B?eTIyeE9aTlhna2hkdmRkNEhGQU1ZRjlaa3BhOXVRVzZJRTNzakJkUm9ScUdJ?=
 =?utf-8?B?WGlyOExVZzFUd2l2SUZvRzREVUNkdVVVam5mZXBscCtqV2dRYllKYU90aThh?=
 =?utf-8?B?SWUwUEF5dG9SNUl4OVlDalZmSkNKVkJYdjNkVUZlNC96NlVvdU14OTJ0akJY?=
 =?utf-8?B?RVdmQzhMRVc1Mzl1dGtKM09ZYWtwa1BKQkxjTjZuS2pVWXU5c0ZCVDBZcU1h?=
 =?utf-8?B?MHFSUFh1TTUxb3pRbkljR3F4bTBGZHJGR0hGM2VXb1Izd0NCN09neVduQVVw?=
 =?utf-8?B?Y0c5cStkd0szRnppalM1TVJDMXJoMUVWN1RwZTJwM0RRSVh5RHNldERkN1FN?=
 =?utf-8?B?UmhtcTU0KzExTEJRUERIVUNrN3dqMGJtaVR1dksyOXBSUkE0S0N3d2VsSXRZ?=
 =?utf-8?B?dVVzV3FzR3dZTEdjenowOTRnYkFDbFNVWExEL0tBNkphUENPUHRBZk1vYUNU?=
 =?utf-8?B?eThtM1htTlovVUE0dkpsNnkrL3R1RE8wd0EwSGoxWEt0YWpyc0EzYkZsTUor?=
 =?utf-8?B?OGU1empFMGlGQXIwTzNrVGtXakNSajZrdDMxS0hUMUY3Mmc4d0ZMcjVta0hs?=
 =?utf-8?B?NVFqZnh4U0RNOUl2K2ozYkZlQnFPV0owbWJTbTBaNFR0QXpYK0hUSGNiZXd2?=
 =?utf-8?B?MjNhcWJsS1dId0VqZUdoM01RYXlXVlNCNDdKZzRtT1FDSmJmUTkyaTUrcE0x?=
 =?utf-8?B?YnRKcGxHcmJFSzBUdDlyc3N4TE5xM1BEc0trMDF4Nm1yUmplLzZ6RE1idjk0?=
 =?utf-8?B?VWx2ZzFBOTZtVzU1VkEzRXNIZmhRQ0I2MlRJTGczb1dRZWpySlFCZnhkLzJh?=
 =?utf-8?Q?fGIiIytaCtfnEs2uIZ9kIsvGizkWIcWnwwp/U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUk5Sk54MTErVnR0dEVMYzFFcUJzZjlsYjVPZUk2dUovQWhsYmZKNTQrSFk4?=
 =?utf-8?B?bzNiaFVyaXJZckJ5YStpVzZ2SGo3S2dBYVJXMjU3U2ZXMWV0U204VmVkZ2Q3?=
 =?utf-8?B?emI3WmJTZGRFQldkdlE5TFlHc1VuOXoyZVJtVnpFWldTaWJhaVl3blpRcWhD?=
 =?utf-8?B?Q1dCdEcvQy9sWkFrTDZ1Wk50a0dCY0kyVHBJclFxdFk4R3E1VG9PZGxPV2Fo?=
 =?utf-8?B?SlJlNjBNWkN4R3BiYXI3M09iT2dWNDFBcGVOSEZtUDcwRzVhbVBnNk15MGF4?=
 =?utf-8?B?cnhtMUEvSnNDZG5NcWlIOWNPVE5QbGtlK1R0QmFwcHoyUUtHYWFnbC9WVTM2?=
 =?utf-8?B?TjU4YjhPdjFvYUNqSDhPM2dGWjJSNHRIOWZidHlMdjE2a1RIdng2MWZMMDdQ?=
 =?utf-8?B?clkvcGVmMGNWM1c0ZjRyV3kwOERweWh2RERPbmRULzRkTk1vT1M1ckt0ZjAv?=
 =?utf-8?B?R3NKOTZQNU1FYnRjWUZUK2IyR3BrWllaOHQzUmtxWFkveEcvYVZVU3U5MkpO?=
 =?utf-8?B?dEozdUFsUThNb1lNdEUzZTlNNmxyS1loQVVUdDROblFpYUhzL1IxMm1lclN3?=
 =?utf-8?B?c0ExanMrV01LT3huSk1FQTlGOGJidlQ0blpYSm9sUzRxQUNSakdVdkRRc2pQ?=
 =?utf-8?B?ZWJramNSMDg3UHZ0c0o4dUlkT0psNVArTzdmVjUyVlFkT1JjblJLbXZUY3Jy?=
 =?utf-8?B?ZXlwbFBraVdBb2todmJsNFlEY2prSWhjaEJsbFBqWDZKUHVKS3pPcHkrNm41?=
 =?utf-8?B?QmlVRnNPbzkwcllHb2gzcWdVcHZXbkE5a2NhNXhteWZocklxMXBnZHEyZlVy?=
 =?utf-8?B?WFFpbC9wM3hWVkFnay92NW9wYjlMeGJvR0FWc3QrUXdKODNMZlRtY054b2RN?=
 =?utf-8?B?S0V5bEtMZVkxWGUwQ3JxS25NMmp2Y2RvcFR4dFJkWnU0VkQ2N1BZRURGSFFS?=
 =?utf-8?B?b21zbGZqRjN5RVJYVXZtVUFCR084VnZ3UW03dVBrOFNTb21ycEFBMTU2dEZ1?=
 =?utf-8?B?KzFHSHIydU5rcDF2VUZUWmYwL1R5RU5YMDJmNGxnemJ0ZzdJQU94eUlFYk90?=
 =?utf-8?B?ckluSkNqTU4vQ0ZlM0FCUm9oT2h6dGt5dlJkdnZxb2trWUJSYUw5UjFkVmpW?=
 =?utf-8?B?QkFiWUFyeUlnM1JGYXFMaGxmZm9sSlMrSXNnWU8zVXFiSmFpTVpTUExSdEJK?=
 =?utf-8?B?SUZFakRoWGFmNDJjMTBKNm4vTUNYYWNZVHVQZk5EaUxibDBEcGtScTJiWktD?=
 =?utf-8?B?Y2FMNXJCRW9ydS9TUDR5SytaalBiOWdSY1M5NmpPcm1Va0VJWTdhdUlwcUNn?=
 =?utf-8?B?WXJFdjljUkxRczl5TmZ1WWhwSk1McnBYUXg1dXpNQTA0K2I2Skdvc01wQ0dS?=
 =?utf-8?B?Mnlyc3JQc1gzM2ZjRDFkS21PQ29pVS80K09ES2RZTUJLTkZMZlNkY0tZbkp6?=
 =?utf-8?B?cGwzMUlNRXhKSSt3K2NNTkk3S3U5RVNxVnlyT1ZVcDBYQUJOZzdIeUNJTk9m?=
 =?utf-8?B?dWhOQmZFeE5rZCttZVNzNldaaGZ0WCt0VnFIN0xCL1h6UmlXenNwR29TUnUr?=
 =?utf-8?B?ZWxZNUdkZG9GV0FZb0pCYmppWFF4dDlXM1dqcU95cjd4dFp6UU11a2xyQnZI?=
 =?utf-8?B?TUloVWQwM1ZYYnY2Qkw0bkdXWnVteWUxU05wV1NCWVhXenZ0UUhnaVZwTFpY?=
 =?utf-8?B?RzlzUXJOYnFaK3pFVWpCekNBbzE5ZEFxZVJPellLQi85VUxEanJhNWRxWG9v?=
 =?utf-8?B?VTQ2UndvdUh6MG1hUktQd2VqaUFFRzRBTXc3MThVYk5DTzRSUEl0dU0yeW03?=
 =?utf-8?B?WHdycVlZMnNTdFpuY0R4cDNjOWhpSEE3MG5kcFNNZisyRUY1cDlkM0JpbnIz?=
 =?utf-8?B?NU9SSWpOT1F4NG5XTHA4Q3RlajZqdUh4NW5TTllwUnJCR3FmcndOb05FSlVS?=
 =?utf-8?B?MEJ5Skx0MVZyZCtFVW1PTWNZNWc2WTRvM1ZtTFZGaUU2VVpQTVBTd3Z1SHF5?=
 =?utf-8?B?VGI2Z3VuSjFJRDlmYS9sSHJBOTJDcHdkc0E0elRuSWdTMWxlUytzdnpCN2Y3?=
 =?utf-8?B?WGRhL3A2UUw4RmNlaHlOcWlHMHpWdTQ2UW1LTDYwUlhXV3NIdlhQSE9iczFl?=
 =?utf-8?B?aW04enZZRVIzZ05XdTFFL3ZzRE1mUC9QR0ZuczdOWmdGemFNTllhb2VhNzNT?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78D1756BCBB18646A3B46F450B296DFA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f5128e-c155-4b0b-5e54-08dd0a191e61
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 10:41:55.6056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QyfV4dcHWvjsjJFfkWnd2CI07evDNvv6g592gS6fOuqfundlD33U3/EwMEL7beFARTgiypNNps2sbIHYXikz0MijsFOgXzJXIzqeZvLKyXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6450

SGkgQ0ssDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KT24gVGh1LCAyMDI0LTExLTIxIGF0
IDA3OjEwICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90ZToNCj4gSGksIEphc29uOg0KPiAN
Cj4gT24gVGh1LCAyMDI0LTExLTIxIGF0IDE0OjM4ICswODAwLCBDSyBIdSB3cm90ZToNCj4gPiBI
aSwgSmFzb246DQo+ID4gDQo+ID4gT24gVGh1LCAyMDI0LTExLTIxIGF0IDEyOjI1ICswODAwLCBK
YXNvbi1KSC5MaW4gd3JvdGU6DQo+ID4gPiBXaGVuIEdDRSBleGVjdXRlcyBpbnN0cnVjdGlvbnMs
IHRoZSBjb3JyZXNwb25kaW5nIGhhcmR3YXJlDQo+ID4gPiByZWdpc3Rlcg0KPiA+ID4gY2FuIGJl
IGZvdW5kIHRocm91Z2ggdGhlIHN1YnN5cyBJRC4NCj4gPiA+IEZvciB1bnN1cHBvcnRlZCBzdWJz
eXMgSUQgaGFyZHdhcmUsIHRoZSBwaHlzaWNhbCBhZGRyZXNzIG5lZWQgdG8NCj4gPiA+IGJlIHVz
ZWQNCj4gPiA+IHRvIGdlbmVyYXRlIEdDRSBpbnN0cnVjdGlvbnMuDQo+ID4gPiANCj4gPiA+IEFk
ZCB0aGUgcGFfYmFzZSBpbnRlcmZhY2UgdG8gdGhlIGluc3RydWN0aW9uIHByb2dyYW1taW5nIGZs
b3cgZm9yDQo+ID4gPiB0aGVzZQ0KPiA+ID4gdW5zdXBwb3J0ZWQgc3Vic3lzIElEIGhhcmR3YXJl
Lg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxp
bkBtZWRpYXRlay5jb20+DQo+ID4gPiAtLS0NCj4gPiANCj4gPiBbc25pcF0NCj4gPiANCj4gPiA+
IC1pbnQgY21kcV9wa3Rfd3JpdGUoc3RydWN0IGNtZHFfcGt0ICpwa3QsIHU4IHN1YnN5cywgdTE2
IG9mZnNldCwNCj4gPiA+IHUzMiB2YWx1ZSkNCj4gPiA+ICtpbnQgY21kcV9wa3Rfd3JpdGUoc3Ry
dWN0IGNtZHFfcGt0ICpwa3QsIHU4IHN1YnN5cywgdTMyIHBhX2Jhc2UsDQo+ID4gPiB1MTYgb2Zm
c2V0LCB1MzIgdmFsdWUpDQo+ID4gPiAgew0KPiA+ID4gKwlzdHJ1Y3QgY21kcV9jbGllbnQgKmNs
ID0gKHN0cnVjdCBjbWRxX2NsaWVudCAqKXBrdC0+Y2w7DQo+ID4gPiAgCXN0cnVjdCBjbWRxX2lu
c3RydWN0aW9uIGluc3QgPSB7DQo+ID4gPiAgCQkub3AgPSBDTURRX0NPREVfV1JJVEUsDQo+ID4g
PiAgCQkudmFsdWUgPSB2YWx1ZSwNCj4gPiA+ICAJCS5vZmZzZXQgPSBvZmZzZXQsDQo+ID4gPiAg
CQkuc3Vic3lzID0gc3Vic3lzDQo+ID4gPiAgCX07DQo+ID4gPiAtCXJldHVybiBjbWRxX3BrdF9h
cHBlbmRfY29tbWFuZChwa3QsIGluc3QpOw0KPiA+ID4gKwlpbnQgZXJyOw0KPiA+ID4gKw0KPiA+
ID4gKwlpZiAoIWNsKSB7DQo+ID4gPiArCQlwcl9lcnIoIiVzICVkOiBwa3QtPmNsIGlzIE5VTEwh
XG4iLCBfX2Z1bmNfXywNCj4gPiA+IF9fTElORV9fKTsNCj4gPiA+ICsJCXJldHVybiAtRUlOVkFM
Ow0KPiA+ID4gKwl9DQo+ID4gPiArDQo+ID4gPiArCWlmIChjbWRxX3N1YnN5c19pc192YWxpZChj
bC0+Y2hhbiwgc3Vic3lzKSkgew0KPiA+IA0KPiA+IEkgd291bGQgbGlrZSB0byBoYXZlIGEgbmV3
IEFQSSBmb3Igbm8gc3Vic3lzLiBNYXliZQ0KPiA+IGNtZHFfcGt0X3dyaXRlX3BhKCkuDQo+ID4g
SWYgc29tZSBjbGllbnQgZHJpdmVyIGFsd2F5cyBoYXZlIHN1YnN5cywgaXQgY291bGQgdXNlDQo+
ID4gY21kcV9wa3Rfd3JpdGUoKS4NCj4gPiBJZiBzb21lIGNsaWVudCBkcml2ZXIgaGF2ZSBubyBz
dWJzeXMsIGl0IGNvdWxkIHVzZQ0KPiA+IGNtZHFfcGt0X3dyaXRlX3BhKCkuDQo+ID4gVGhpcyB3
b3VsZCBwcmV2ZW50IGZyZXF1ZW50bHkgY29uZGl0aW9uYWwganVtcCBpbiB0aGlzIGZ1bmN0aW9u
Lg0KPiA+IElmIHNvbWUgY2xpZW50IGRyaXZlciBoYXZlIHN1YnN5cyBpbiBzb21lIFNvQyBhbmQg
aGF2ZSBubyBzdWJzeXMgaW4NCj4gPiBvdGhlciBTb0MsDQo+ID4gbGV0IHRoZSBjb25kaXRpb25h
bCBqdW1wIGhhcHBlbiBpbiB0aGF0IGNsaWVudCBkcml2ZXIuDQo+ID4gKFRoZSBjbGllbnQgZHJp
dmVyIGNvdWxkIHVzZSAnbGlrZWx5JyBvciAndW5saWtlbHknIHRvIHVwdGltaXplKQ0KPiA+IElu
IHRoZSB2aWV3IHBvaW50IHRvIGxldCBjbGllbnQgZHJpdmVyIGhhdmUgZmluZS1ncmFpbmVkIGNv
bnRyb2wsDQo+ID4gbWF5YmUgY2xpZW50IGNvdWxkIHVzZSBjbWRxX3BrdF9hc3NpZ24oKSBhbmQN
Cj4gPiBjbWRxX3BrdF93cml0ZV9zX3ZhbHVlKCkgdG8gYWNoaWV2ZSB0aGlzIHNvIGl0J3Mgbm90
IG5lY2Vzc2FyeSB0bw0KPiA+IGludmVudCBuZXcgQVBJLg0KPiANCj4gRm9yIGEgY2xpZW50IGRy
aXZlciwgdGhlIGhpZ2ggYWRkcmVzcyBpcyB1c3VhbGx5IGEgY29uc3RhbnQgdmFsdWUuDQo+IFNv
IHRoZSBjbGllbnQgY291bGQgaGF2ZSBjb21tYW5kIGxpa2U6DQo+IA0KPiBjbWRxX3BrdF9hc3Np
Z24ocGt0LCAwLCBDTURRX0FERFJfSElHSChwYV9iYXNlKSk7DQo+IA0KPiBjbWRxX3BrdF93cml0
ZV9zX3ZhbHVlKHBrdCwgMCwgQ01EUV9BRERSX0xPVyhvZmZzZXQxKSwgdmFsdWUxKTsNCj4gY21k
cV9wa3Rfd3JpdGVfc192YWx1ZShwa3QsIDAsIENNRFFfQUREUl9MT1cob2Zmc2V0MiksIHZhbHVl
Mik7DQo+IGNtZHFfcGt0X3dyaXRlX3NfdmFsdWUocGt0LCAwLCBDTURRX0FERFJfTE9XKG9mZnNl
dDMpLCB2YWx1ZTMpOw0KPiBjbWRxX3BrdF93cml0ZV9zX3ZhbHVlKHBrdCwgMCwgQ01EUV9BRERS
X0xPVyhvZmZzZXQ0KSwgdmFsdWU0KTsNCj4gY21kcV9wa3Rfd3JpdGVfc192YWx1ZShwa3QsIDAs
IENNRFFfQUREUl9MT1cob2Zmc2V0NSksIHZhbHVlNSk7DQo+IGNtZHFfcGt0X3dyaXRlX3NfdmFs
dWUocGt0LCAwLCBDTURRX0FERFJfTE9XKG9mZnNldDYpLCB2YWx1ZTYpOw0KPiANCj4gVGhpcyB3
b3VsZCByZWR1Y2UgdGhlIGNvbW1hbmQgc2l6ZS4NCj4gR0NFIHdvdWxkIGV4ZWN1dGUgbW9yZSBx
dWlja2x5Lg0KPiANCj4gUmVnYXJkcywNCj4gQ0sNCj4gDQo+ID4gDQo+ID4gUmVnYXJkcywNCj4g
PiBDSw0KDQpJIHRoaW5rIHRoYXQgbWlnaHQgYmUgYSB3aWRlIHJhZ2UgZm9yIGNoYW5naW5nIGFs
bCB0aGUgY2xpZW50J3MgY29kZS4NCkJ1dCBJJ2xsIHRyeSB0byBpbXBsZW1lbnQgdGhhdCBpbiBj
bGllbnQgZHJpdmVycyBhbmQgc2VlIGlmIHRoZXJlIGlzDQphbnkgcHJvYmxlbSBhbmQgZmVlZGJh
Y2sgdG8geW91Lg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCj4gPiANCj4gPiA+ICsJCWVy
ciA9IGNtZHFfcGt0X2FwcGVuZF9jb21tYW5kKHBrdCwgaW5zdCk7DQo+ID4gPiArCX0gZWxzZSB7
DQo+ID4gPiArCQllcnIgPSBjbWRxX3BrdF9hc3NpZ24ocGt0LCAwLCBDTURRX0FERFJfSElHSChw
YV9iYXNlKSk7DQo+ID4gPiArCQlpZiAoZXJyIDwgMCkNCj4gPiA+ICsJCQlyZXR1cm4gZXJyOw0K
PiA+ID4gKw0KPiA+ID4gKwkJZXJyID0gY21kcV9wa3Rfd3JpdGVfc192YWx1ZShwa3QsIDAsDQo+
ID4gPiBDTURRX0FERFJfTE9XKG9mZnNldCksIHZhbHVlKTsNCj4gPiA+ICsJfQ0KPiA+ID4gKw0K
PiA+ID4gKwlyZXR1cm4gZXJyOw0KPiA+ID4gIH0NCj4gPiA+ICBFWFBPUlRfU1lNQk9MKGNtZHFf
cGt0X3dyaXRlKTsNCj4gPiA+ICANCj4gPiANCj4gPiANCg==

