Return-Path: <linux-media+bounces-24088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C769FC8A3
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 06:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2872418829DD
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 05:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB92814F117;
	Thu, 26 Dec 2024 05:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pqO3sshA";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="r5+MMkVP"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A651112B71;
	Thu, 26 Dec 2024 05:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735191394; cv=fail; b=LMX8R/xGNXo2ASMap7CgOd1wRgH/if0Ja/S9HpHzsvmGNc29CbbTevz7PMrd1+gsjjos9LplFUDNv/pYshQv3jylLqDErZgy8x0b4XwIyQR+Z3xYW4ssqW6SSmUTkgSMR+O3YnIDED8JZKmhP1QW8JCqbLmAJQ8yjEjNmyPNvio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735191394; c=relaxed/simple;
	bh=kLT4LZzR3P4AQworLxZ9j8Au+nimLtsF+JX2MZeT/Yg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hc7Z77fo7BHXjmU4BrXDnKLb3rYcMksw7S35HPCQD9eFg/x26/w023CRdfVRZyy2XqsceXEyxdUEoWbelxPU6/r3HFJ7G7lciBZUaXl1ycY30FcspYyaJXCl1VAvIrkVX3/iYQXx9uvqxGwnKwcxKtxoyPuYwWGyIGV77o5pwts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=pqO3sshA; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=r5+MMkVP; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 58b6e90cc34b11ef99858b75a2457dd9-20241226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=kLT4LZzR3P4AQworLxZ9j8Au+nimLtsF+JX2MZeT/Yg=;
	b=pqO3sshAUUwIDEWOu7yAydD3+81+yFIaOFt064GwFrWTjTCO85Yrx/VlW/CfPK8HiVXBTVY7LQEGRlEBTNoAwRMFKYDvMIBNg73vnsK+gOD6/pcEE5YtOvekDknzYPTDKeGAzbRXbOe7E+Ar58oPzyp6X1wBeX5sexVN+ZGWwbk=;
X-CID-CACHE: Type:Local,Time:202412261320+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:f4d9102f-02f0-4fba-9315-21daa9a65fa0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:922c3625-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 58b6e90cc34b11ef99858b75a2457dd9-20241226
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1464529260; Thu, 26 Dec 2024 13:36:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Dec 2024 13:36:24 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Dec 2024 13:36:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSXLaUXczISyc2ASn0goLnmziPVZ6W6C9eSIXsxY2l1+ArGPfg420E69tDIhMYAfG2oIjAGf6mY68+Xgh1+HWg4mOaFj8zNGIJ86oMIzbMKWk9Q2MUlKZTPK5oL+S7XLKJWrEjkKK9R/IeKV++jNvMOnnIT24GedypDdNsMiaVBXqtiLL3B9Wfj9jaiNshIbPQ4zMdifWgab7aGwo9YUS9O/nmBkFx/B0ND4lTntianm5N9dzLiF0dOaF15pKycD5UPpgVkXCJIFel1GBGQtcqbcmMTdXbTstPB+Fa+XuBRfMF+RUzhyITLxQGc2uB3CBlRhHNXJ8U6A1ZfWih1hrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLT4LZzR3P4AQworLxZ9j8Au+nimLtsF+JX2MZeT/Yg=;
 b=VdxXNsI84TlP/fvMEyqqVlM+jmrP0BoTx56d0Vrb+Pf7Ys+gFeIdENUFXYOAZPtAqgHYAWDHUrQ8ForQvCMOQzzNlTvD/tUI5S9v1PynlGi+IsSxSgNBkivMM1XEcjG4rT0uOCh78GzQ0KJuJAB99B5BolrpKsEHDAgvkRyrVMYdCQ1eiLKh6FOtG4Xw6ZDcsFNvbOhaP+gYk/7m93VfbRr3wX69FXJ6l/VK9Iy/z+brZk6D7iw/TmNft98ohM4GW3MxA4Rjws5cIDajBr/+OLcY9MCNtW29VeIGoi1FnR8Vih3gGyPWMVW/w4rAWGUYbrLobnzmRBw1lpNewwBE2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLT4LZzR3P4AQworLxZ9j8Au+nimLtsF+JX2MZeT/Yg=;
 b=r5+MMkVPAQi2IznQUF3Xr02IbGmjuy7fDCTmYySFR0PMcUcqRgN/IcW5su/X03aFK4hasQaGktzbL9VE3HuZ2OsH32E9J4ZziavWx0c7dnTKfyfRQbu2YkUvAyxT9ZtiUzdCSr3gW9ihSpUAe/uOlH5z4H2VzIbHE0g/QZDOWEE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7332.apcprd03.prod.outlook.com (2603:1096:400:431::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Thu, 26 Dec
 2024 05:36:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Thu, 26 Dec 2024
 05:36:21 +0000
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
Subject: Re: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Topic: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Index: AQHbVqv2E/LiiDV3F0q0O1OD05OMm7L4AtQA
Date: Thu, 26 Dec 2024 05:36:21 +0000
Message-ID: <e7db73ee79a2c6114ffb3d752ba741ee4230ddca.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-4-bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-4-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7332:EE_
x-ms-office365-filtering-correlation-id: 3c1bffc5-b00f-478d-bb2e-08dd256f3abc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Ykp3WlNNWTNUUStlNkdyMUYzS2FUQlVXdGQ5QmFMK1l3R2h2QVZuaXdreUp0?=
 =?utf-8?B?QlloSDZNNENiSkpld1p6NUM0c3ZnRC9QZmxIRzQ1RWNHc2ttdkxySk5jM1Vn?=
 =?utf-8?B?VmtmbFpyaU1US3BTNDFWeGptZ25uKy9GcFhsMFMwQ2g5VW9hTk0veHJqWlo5?=
 =?utf-8?B?UFFsUU0yeVBoeDVkK3JTSi80WVRXQU5ZcUgyQ0FoY1ZjT0xlOFYxaXBtWUg4?=
 =?utf-8?B?RlU4M05lNENEZXUwSWU1YmJjY0Q5emVLUGl4dnVsY2xaTmVibXN2b1UwMXlr?=
 =?utf-8?B?SlhpYkNkY0JXR1NXZ2RCUTFPZ1ZzVEFLYk1RZEdtZ3dPOWhrZC9zVjFoMXBw?=
 =?utf-8?B?aWdsZmNBTHZ6clh2M3g3SzFlR3M2eE1EVHZQbW1teUdudDZYNTg5VlFpQmZk?=
 =?utf-8?B?V214ZlRQOURzb0xVVS9tTDBJSnhzVEJicVhULzlEOVphTXJKT2IzRUxGMm9z?=
 =?utf-8?B?VEltMUFQMlBFdjJKdW54dk1lSWM0K1gxUnVJUXZQd0lSUWo3ZjEvLzc0djdw?=
 =?utf-8?B?VFBneUwrMEk2cUFZbnEwNU52UVVKSVowRzN5UVV2THFZNmtlMzFQSnFkVXdY?=
 =?utf-8?B?QXF5TTRVbjNOZ3lzQm12cmdTRmdESnZQSk5rc1ovUlBYQmhneDhPMHNoc1Np?=
 =?utf-8?B?SjUzUklDcDZiOWt4M3oxenpweUJSMU5uelVBQjEzK1lGdWM3Y3VXL1M3UEhv?=
 =?utf-8?B?K0EzckJiL0Ruc1RwMUsxWHVpZzhydTFlU3ZsN1JydmkxUGtrRk1tUUR6ZGk4?=
 =?utf-8?B?bk9senpmbTFMakdPN2ZmLzF2Qm9uNmdpZkdoWGNtczgvNXZHTUFRUEZNcHEv?=
 =?utf-8?B?OXNxUzd5ajRsN1l6SU5pVjV2UmF5Wk9BYkoyakNqNXZTcFFhb0U4WkYwU2pI?=
 =?utf-8?B?OUJ2SnB5UnBPTExXZSszc2FUaStXUlVzaVp4Y09Rc0FUNURuYjNObTFjWUNR?=
 =?utf-8?B?ZWh4aUg2MjB3bGMxeGlyOER0NmN6RVd6Y1ZaUUlFL1dQcGhUa0V0bWhQOFlo?=
 =?utf-8?B?SEdlZWIxUm15UWE0V3A2cUNPM0RkSi9XTDBJWnc0eHhCMlhRanNIQkZvTXNZ?=
 =?utf-8?B?ckFBWTMrd1JYaFM2bFVMNFZzdXBRZXVCSTg5MGpzRzVEclZFcG1MUjBYMDA3?=
 =?utf-8?B?NitqV09WMVJEU2ZHM1hSVGR6T0JLS2NabFhuVXJXbzQ4K1Fxd3VHcEVTN0xj?=
 =?utf-8?B?eFZuL052RUtPMXNIbXdmSy9relJZZERGOWxadjNnMnJpSlVmQWdGZFM2NVEw?=
 =?utf-8?B?bFk3VUhUanRqMjZObS9nR3U0WUxtb1c4c2F4cmY1NlhOZnB5Q0ZHM2l2WVBM?=
 =?utf-8?B?QWVhbW5RbURweCt4ZjQrcU9IOW5ud3Rjb1doaHdlaStjeVo4YlhtS2pTVHdn?=
 =?utf-8?B?YVdXMXl0VzZSaytWUWVUSTdYOHR2RUNlM20xaFRWUjhySmU2VDd4Y2VSS3Fm?=
 =?utf-8?B?MjR6TjJqa0ZRVmphOHA5STBmZEVXZ1p5ek9VdEtaajhFeUppTmZaeDAwSWht?=
 =?utf-8?B?ay9CMFl5dzZhWHM1NU9QaUN1ZVhXbk5taGNtYW9pU1lNTUxFdjh5d0k5NjNs?=
 =?utf-8?B?RFlyUzF5MkpxMzFLcEh4dU9rMEY1NU9DWk9SN0dpeU0zdTZzTmFoMHZwMnlx?=
 =?utf-8?B?NlNVK2hkQ3ZJU1E5RlYwZmwyMnRaVUU3bmVBRGRxTngrOHFkY3VHeG9rU0RX?=
 =?utf-8?B?WUV2REtqSEpRMXQ4bWdCbXdGZmxrTkR6ellEMy9zZ1FIQW5FaFhJdEdvQWg3?=
 =?utf-8?B?cmtFNktOWjJQR0FkeVlCczVWUTd0RDNyRDBQN3dMUlN1Mk0rdzhEZXUxOTRa?=
 =?utf-8?B?ZTc1OEE0b05YcnpIYTJZS3lqd1FwK1dKM1V2SXJ1MHEwaFQ1SE1MSDZmL2FV?=
 =?utf-8?B?a01FV25HOENpZXpFeXZPNU5PUWU5YVdlcUliM1VGenpuSStZcEJoZUFrVElD?=
 =?utf-8?Q?KRGy4gLevkblGCG4X+LvtiKNLvn0KthT?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHFwMkxnT1BYOURzVTVKamFoL0dtcUZpM1JCTytrWGdJaDVTaHBLdU5uZG1l?=
 =?utf-8?B?NTVidGJVZi9TRFpPWTZ2eHFUVUtsem94N3FPSmRzVWozMkcxTlZLNTFvMFZv?=
 =?utf-8?B?OXlQNWV0OWhTOC83VEY5WlNDU0tjOWx3dTl2b29kSTNoZ3N5cEU1aTYwRGR4?=
 =?utf-8?B?SFpSOWdETE04ci9TRVorRTJncnZMcWN4b2VsemZxWkkwRWdSczdyVVBpL3d0?=
 =?utf-8?B?b1l3SisxbVdMWGJqVzdVaWQzL0ZRbkZYWlBQTHRsMHJqVy8xWXRsRC8xaTFw?=
 =?utf-8?B?U3ZJUUl1SzJCT29ySUFubCs4R2l2SXFNdzFzZ3E5NWhaTHhoa1J2eTlKMndz?=
 =?utf-8?B?MFl6eEMrMWtnOE02VjUyc28vUEd0UXNwbkFaNkpTY2dGci90bjM0TUx1M1B0?=
 =?utf-8?B?NkxEdC9OQk4xa1pyWXZzcGxEY1dabkdKR0liRmJ0RFl0SUZtK0NTWEpzZkcr?=
 =?utf-8?B?ZHFsWkR0TmNZQzAvb1RiOHYzM05aRFhBdmVIaHVXd2NWdExPK2VhNmFYc01H?=
 =?utf-8?B?TWlhd0NVbDN6UktGdW1pdHU3ZUwzMmZsNTZTTGFlanc1WXplMi9GWVJRcExO?=
 =?utf-8?B?a1h4M2VFSjIzSFhvR0REOUFvWVNGU0JpcHpMWnZ0VkhCR2lLRjQ1Vi9SM0U3?=
 =?utf-8?B?YXo1dC82YzdFMTAxZDJoQ1JjSmY3V3QvRTJjVERJbDFRUWlaRzY5L3M5TmVx?=
 =?utf-8?B?QkZPNGJpaThsUXFsVkhhOWI1aHVmYVc3dm9SRG9yZnd5NjNoZFhpZVJTSnVC?=
 =?utf-8?B?b01yUjM3QjExdTR4SS80K3RJeXIyMW80OGJOM3JXclhRRFpiUW9remo5RXor?=
 =?utf-8?B?QUFjYThZUW1Yb0UwWVpNN3k0TkdzU2JrbXMzTDFvUXhZdnRZaUlpTkxiQ3Ev?=
 =?utf-8?B?VkR2WWtieGhqWGV0anRKVXhTTytPeWoyZU1iNG5jV0gvc08xREtxVFdCY1Ux?=
 =?utf-8?B?aWlJNStyZHg4blNIZVFGNjZMWHBmR3c0TEZFbTJKbkJCTlpjeUlJZGRTeG9H?=
 =?utf-8?B?TE5Oa3NhTTdYZUVCS1JtZVJzQVFqSzRzNWFmbThVZm05Q1lSQ3FEZHJZNnkr?=
 =?utf-8?B?bkluMG41UVg1R3FBOFZzM1lRVlFITENHa3RxN3ZxaHdzd1Nnd1pxSnoxT0hY?=
 =?utf-8?B?QVl2cUdsZzZuYmIzK1daM1h6bkNXMzlQd0FtWlo1VEdWRjV6c0g0Z1pmeHhN?=
 =?utf-8?B?T3d2YkhvWFM5RGZmMTFjWEpKd0Iyd28zNTlPb1RVeXk5VWpQd0xRRUJ6a2VS?=
 =?utf-8?B?Q0ZVc2UvbmV3RFZwZEtRdkwrdkx4aHRUSUlmcGx0V3NGaHVSTmhhVzI2Zmxv?=
 =?utf-8?B?WE5ZZ1ZTOHlmNGJ0QTcrcmJsUi8xZEp2K1VaQzBOZnRUUlZQWmM1YkNwbzBp?=
 =?utf-8?B?dHZIN3I5d1JTd3h1OU9zRWV3RG95VlBjWExScFBjVmswUU4zQzB4dURhQmJI?=
 =?utf-8?B?OWw1N1JlSHNFRjB3QWpURkQ1ZTJ6UFlpQmxoZ2x6TDlqSWJrWk1yTmpwVlor?=
 =?utf-8?B?SEhZZy9WRWdqTDZxcXlpVlRMTFNLYXNxQnhMMmc0bmFyUkorVmVMU1c4a1Bj?=
 =?utf-8?B?VGZhcHllc0lpNFNHcnhIY2R4QVBDVnd1MkNPR01hK3hjdWVmTzlON3ZoSnFM?=
 =?utf-8?B?RlFOM0NGUlBvVTRBTDVlWGpUTW9paWl5MG1LZDNSOTFaanRob1B3RWwwWEdy?=
 =?utf-8?B?TVRMVldWN05NYytQbnlteXc5WXZ0VGNxNkFveHQ2aTBRZ21jWHorR29udU5K?=
 =?utf-8?B?SXFvVnhVZ2xJUk9IWGdxYnUvaitZLzFicmNZQi9JNHJYU01SdTN2THNOeUpZ?=
 =?utf-8?B?TzNCMnNUV2JzMUFCb3pMMkNnVjY5ek8raWk5NGQxalB3Q1ZoV09OdDEzaThO?=
 =?utf-8?B?bzNyY0FRMVdhRlBPUkUrZlhpVlQzam5CQytoa2pkTUoxYjIwRkcxM25GZ1c1?=
 =?utf-8?B?WDU4YzRocm5VVXFyNmxUakp6UXdybmNuc2Z5dE9jN25NQlkyUkF0Q0dYKzN2?=
 =?utf-8?B?VVNZZ3F1bnN5VXJtOTVFSkEzYVhxblcrUlJUekl1SFI0ZUNpUmFvNkdSVGhk?=
 =?utf-8?B?T0tPKzh4eThoaHJhUlVZMjdBUUV1aGZEU29DZlhnejdxR3RnYnRBd3BzT1NR?=
 =?utf-8?Q?+5/Vd2zIfogwKx+KnSFZxHLLG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E27D5FAF9625840B94E4F3F9D461B8D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1bffc5-b00f-478d-bb2e-08dd256f3abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2024 05:36:21.3095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1QqjL8Ya8LMtv76gkMsmfg1UZuKeX6aTjv7RNg1/aairqukC1JuP/OFE8sDWAAo8b5lYwVb+HH3jYjzrGmuJYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7332

T24gV2VkLCAyMDI0LTEyLTI1IGF0IDE3OjAwICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBhIFY0TDIgc3ViLWRl
dmljZSBkcml2ZXIgZm9yIE1UODE4OCBBSUUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCbyBLb25n
IDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgY29u
c3QgdW5zaWduZWQgaW50IGFuY2hvcl9lbl9udW1bRkRfTE9PUF9OVU1dID0gew0KPiArCTUsIDUs
IDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUs
IDUsDQo+ICsJNSwgNSwgNSwgNSwgNSwgNSwgNSwgNSwgNSwgNSwgNSwgNSwgNSwgNSwgNSwgNSwg
NSwgNSwgNSwgNSwgNSwgNSwNCj4gKwk1LCA1LCA1LCA1LCA1LCA1LCA1LCA1LCA1LCA1LCA1LCA1
LCA1LCA1LCA1LCA1LCA1LCA1LCA1LCA1LCA1LCA1LA0KPiArCTUsIDUsIDUsIDUsIDUsIDUsIDUs
IDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUsIDUNCj4gK307DQo+ICsNCg0K
QSBjb25zdGFudCBhcnJheSBmdWxsIG9mICc1Jz8NClVzZSBhIHN5bWJvbCB0byByZXBsYWNlIGl0
Lg0KDQojZGVmaW5lIEFOQ0hPUl9FTl9OVU0gNQ0KDQpSZWdhcmRzLA0KQ0sNCg0KDQo=

