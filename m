Return-Path: <linux-media+bounces-51717-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPMpLRy5eWl8ygEAu9opvQ
	(envelope-from <linux-media+bounces-51717-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 08:22:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 185EA9DB72
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 08:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91765301F7B2
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 07:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C177328627;
	Wed, 28 Jan 2026 07:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dcss3KwN";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="McZhFr2T"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6534C2DF6E6;
	Wed, 28 Jan 2026 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769584705; cv=fail; b=G9Czv8ePTzu57AoQKubjedJPr6a0G/IZX2uXVVzMwmo6zPL/W/vopZ/kOJVlhwHG0+s6sm1aw69OoR1xZkMx8Vc0CbRm9QoExUgbIIbKBKz9cw35TSx6wtjDOCbSpEKH4e4jQ445JwEU8yYdYJlJHps8iWlcJzfy9wT5/BZHnw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769584705; c=relaxed/simple;
	bh=xyMheTyUmoSBLAGFbpfySF9vjfpkSy4a9ebku++d8Yg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YFazoPhvPjXptL6/+56UY3stK02QhNoNqgjXVMMyVmoAbmbIVi1YXD6OkmfpgssnZzKO8dapDGAUWHcB+lgRtunw6K1wOVWv/A2PuFpJrQyg1CKWtc6dWSTE+uSemdNw/lDgL+cwAzhoXm5DloGydSfLZFPKbwyAOt3rg02wTis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=dcss3KwN; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=McZhFr2T; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 81ba2be0fc1911f085319dbc3099e8fb-20260128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=xyMheTyUmoSBLAGFbpfySF9vjfpkSy4a9ebku++d8Yg=;
	b=dcss3KwNpTiCUmocefhpI0ePQYv7RNj1ep5ruWvwUEGHHoLyPGm1v2tRC1NdiLL5u2CErzoWhUb4IVFJ0RhFLzxtIJb8H2wwSjJoFT9n+AvqPO/8ZtVTOgUUezkbbtsLOvm4i3eu/fk5hgQHVUIVxd/a5whxty+wCWaXJCFEg2E=;
X-CID-CACHE: Type:Local,Time:202601281518+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:fe70a020-abc8-4f87-8e66-1e7dfb58980d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:50040df0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 81ba2be0fc1911f085319dbc3099e8fb-20260128
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1133730250; Wed, 28 Jan 2026 15:18:12 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 28 Jan 2026 15:18:11 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 28 Jan 2026 15:18:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2IP9pivGO2EXmrp/u7BG0yq8EEk0z+lDvkglBRJAunJuS4GiQZnd5OWBtXOOzjLYEeKddCRFfh6/zhfyTChQfnlPK2HDtT9cirJmYC/HrZ5Fp3UlUmKnCX13ogN4I+Hp+O9PD3xbOZSIm5kOR0t8N/DukwxHA5d2ACnXsF/SqgJuPQm5IdhrJmFalM0yjXZyOsJ0Z/FODvi5zN0vSHptYYY5hxDwBUedNgOxebCIWKJpihT7W7Lt0nK6u6BkqWaDcnRsS8vnVcuNkjWBFuNBc7cbHcS7LnAbRaf+eaqdm4Z/DAJ7N+9xAJTe8g4pJawnE/lIYyvi6xxXzS0/EBQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyMheTyUmoSBLAGFbpfySF9vjfpkSy4a9ebku++d8Yg=;
 b=kM+cZCE5vBoMOpodpZO7Bn2QZv5GyYJWPYW1GB6gbG79ZZ3NUBq9ERG/vZRmKa8pxjkIloLYMhOlXExs2mZaMmheUHGnQceJyBhMMB3XqYny47NHEQP1ThKsgcMX10LMehrJaGqAnaopi5ZZlkDwK/M2M+ntyxYdQtGFGm/3o2EcB4ZRLDuydzJP6DNlu9B9Qm5QKomWcq5fF+PNtdrxrpKGzGIV+CuKW9M//bA+s7lAZkFN5V6Mz927ycdinrye93o/vLeuSJTHlASOGqF84CZmaiSjiAjc0wIaVYYR+cwisGBG5leUNrX+awKYZulCLZtnBXJ5A2CvG7RB63HxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyMheTyUmoSBLAGFbpfySF9vjfpkSy4a9ebku++d8Yg=;
 b=McZhFr2TgWoHjg/rbJpvHPTBWYYdae+dx8Y/+NdPdieOtC01dz8HwlVuWSCh+hsoVctgqtCkO8g+Sryaa3RmQxnZSM1hZJnP8ixunHumuBgtDvw3A3ZuAePaFjm6IQVj5ASXSlfnqPuAhOW/cfYuBxZcm4i8W1A7rqFFcF86fjg=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEYPR03MB8580.apcprd03.prod.outlook.com (2603:1096:101:207::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 07:18:05 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 07:18:05 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?=
	<Kyrie.Wu@mediatek.com>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	=?utf-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>
Subject: Re: [PATCH v7 02/10] media: mediatek: decoder: Add a new platform
 data member
Thread-Topic: [PATCH v7 02/10] media: mediatek: decoder: Add a new platform
 data member
Thread-Index: AQHcjzbOke4QAGROQ0ayEnGuy6cBgLVl7JcAgAFBdwA=
Date: Wed, 28 Jan 2026 07:18:05 +0000
Message-ID: <529be113e01c323d3fe372178b879c224d0cb9a6.camel@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-3-kyrie.wu@mediatek.com>
	 <4a4d87dd-0b85-42dd-8398-7580989a16c7@collabora.com>
In-Reply-To: <4a4d87dd-0b85-42dd-8398-7580989a16c7@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEYPR03MB8580:EE_
x-ms-office365-filtering-correlation-id: 9e8e5f0a-de24-453d-04f1-08de5e3d618b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Ly84SEhSU2JOQ1JOTVJGYlJINnppWUc1UGdWWGRwMnJpWXZMREFONDV1K2gx?=
 =?utf-8?B?Ui9nZFg0NFFlYVlvektPa1pBR2xzMC9adUFFMGhYUWppRWM3eEZNOUxlRFhp?=
 =?utf-8?B?V2NqY29Pbk00ZVh0UFFVTHBFY1pJbm85aDFUeDdlcHZiNW1ndy9GT1FOc1Zq?=
 =?utf-8?B?Q0o2N2ZoWG9GV3pmMFZxUStSUGZHT3BLRzVBQnNRSjBoUklJTUVGSmFEL0pT?=
 =?utf-8?B?eGJWVVFxUjd5U3lza3pWbjNqWVJYT3h0UG9iRkh3Tm5aKzZCQ2duMlJZRzZP?=
 =?utf-8?B?TkRiSlVtR0hYRUJHMm8zYXJVNUFYOEpoNFpPUW9XUUM3OTk0NVp0RURRY25J?=
 =?utf-8?B?MmtsK01zM29oYS93dTVWT0RYeWRZa01EeDZYLzZWbWU0SVdDcmc3ekxlMm00?=
 =?utf-8?B?Yk5QUFl4NUszZlBDQU9OZUJZQ0M4b2F4ODVTdmNDWlVrd3lMMGlFRzhWRnU0?=
 =?utf-8?B?K3BMU3pnUVlaSlIzR2VIR3Jja1hObVYwMXRWRXZ6emdIaHliSmFhdUt2ekE0?=
 =?utf-8?B?Njcyb1VvTVFKVzlpck05VmJ5bTd2emRYWnZtWW5GSHVjcnZ2QmpnNjdTSXJY?=
 =?utf-8?B?emxiWVQxT0EwTHJUeDkza0hNR0ptNjdZbUVwUTl0ZzhNdmkzdFZoaU9qbFdH?=
 =?utf-8?B?c1B1RzlpdmkzVFo2bXdTZTRXTGVDQVU2Qm5TbG1ielNuRnF2MWRDRzIrSGNP?=
 =?utf-8?B?L1F4TFA4SlEvWmlXdGFlQlN2a21SK1FJK0h3THlpdW9ObHlJL0RPQ0xaanhV?=
 =?utf-8?B?UFhZRkJLaEJCWTFsdGU0WWFMa01DSWlKL3pSVTRFYnAxbmRxOEdTVGRjelRJ?=
 =?utf-8?B?NlhaSGMzaExnQ29LbEZkWlRpY0I0M05PTHdwQVZaOURFM0dlcWtoVXRlOFVM?=
 =?utf-8?B?djdjK1hkWkkwVUswMkM0MW1HN09WQmFnZWdOMlpvMFVxczMvTjZaN0NIVlVH?=
 =?utf-8?B?ZnpMZEhhYVVxMG9rNWFpdjVxMHRVdUZnSnJkQ2htNDdjaDcrYjBYeHVLSmRV?=
 =?utf-8?B?eUdROFNQMmt0NEFWMm50UjNmVG03cmdiUStOK3BEbHY3Wk4wdnBxeVE5Y0Yr?=
 =?utf-8?B?ckdpRTc2NXJPVXpUZHlsYWFDTXRyMnN2MEpTVlkzdkxpOUVzMmI1Rk8xSVZx?=
 =?utf-8?B?eGFMV2luMmRoYUpxVDNFL2lxeGxnSldRVHQzWFEvOVdpejJCbW1Ha3NNaEs0?=
 =?utf-8?B?dndJZVBQZlFIajFaV1Bid25xSzVJeWVnUFExYnBLTFltWG5QK0YwSk5iR1hn?=
 =?utf-8?B?UjVkYXZ6ZzlaV0M2akkwRDFibTlFdW1NRVg5bGl5d09lbnNwR1UvdUc3aEdZ?=
 =?utf-8?B?RkJyZWJmUDVGT2UvL1NGZEtlR3pEY25MY2pudXJMOEd0MGN0azEzWGRmZGJ6?=
 =?utf-8?B?WHlBbW9rNUIwNkZIYkJqSmZsNVNIUkozcTNYU0hLNFBicm5sTjhwZHhkK2l5?=
 =?utf-8?B?WFE1V2lwaVlhMU9RbGxpTUIvTkF2ZDVuUERNRUxkVkNIZlJndy9NU09udTlZ?=
 =?utf-8?B?SG1WTGhkNDV5Q1VJMkY5UVRXZjdwWlE3VnZ3OTFtWHFCTFowOTVIRk5ybnFO?=
 =?utf-8?B?dGsyRTJ2WmFFSmg0NUxUdW91OFN3WVBFMFYrRXh3QUUrZ1J2TWUxcWFuRUFm?=
 =?utf-8?B?aVFVeXQxTU9CdThDNUl3WlVZWTAwTWhrMG5FQ0NIUkx4Zy9ObHRZSmx5L3h4?=
 =?utf-8?B?eHAxN2RZS0RMeXlVbm1QcVR3Q1RmR2VkKzRLdy9aWFB4VEExREhXVUtXeEp5?=
 =?utf-8?B?QXF1T2hiMDR6aWN5Q1IzV1l0TlhvWWJvSUYzV0VPUnpSTnRJU3ZHMG1GRVNr?=
 =?utf-8?B?UHlKOGV6ZThnOGJTUEk5YUJwL01jc0lCMGRJM2hyV2YwR003UmdNQ2U3RU5z?=
 =?utf-8?B?bjlzckhZanRzRDVJSjFxeFNwU2loYXd1MjEydk1HNzUzRmN4OWtyeDVNWGti?=
 =?utf-8?B?NWsrNlRyaFBqQWYrRHpUOHFQU2dMVStDYmx4MzBvNksxL2kzS3FER3Ezb1Vn?=
 =?utf-8?B?UWdSUVFJK0h4Ry94SG9kTTlRSmZHc3RickdaQVZGWDdjKzczV0lWbHhDcUlo?=
 =?utf-8?B?bUQ0T2xqSkhSeDRZR3A2cjRSOWwxUnpKbG9uc1hDSnJJeHJoSkpuNDRpM1lC?=
 =?utf-8?B?UTlSWm9tWUo4RzNOUklYU3hEMHBCOElFMFhsc2hCWWJkcWkySjRlbzRKWk1G?=
 =?utf-8?Q?IPdHkL3r4STmy8cx00Jk2lXOdN6GhVALjPUZSvbR8Tr2?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sy9Kc3Z6ZmxkV0VxTWo5eFZhRFc1MWsvYWtlVFVZengzc2VpNDZ2Z1NUWUR3?=
 =?utf-8?B?eE1USWRrNUJYODlWTkpKZ3d6L2NaTVJpK1J4WW9ab2M2UFV3YWFPS3BtWnNS?=
 =?utf-8?B?bEZva0pHcTNhbU5JR0kvSW5kN0czQjBDTW8wMGF5MVZyRW9DQTV2NWhkNXE3?=
 =?utf-8?B?d2NYTGRxQ2M4UXY5Si8zdmx4ZkdVR0VqNHowOWhyWDQ3ZXh4YkpOOWsycUVL?=
 =?utf-8?B?Z1R2ZFhkUHVsZ2hXdFZHb2FHQjF3NklYSCsvZ0gzbjdvTHA4QnpWcHcrall4?=
 =?utf-8?B?aE1mT2lpRC9MRlFzR1VDanpOT25XdW93THM2aHlhSER5R0I2REcrUmhkekk5?=
 =?utf-8?B?UkhtcUhZOGJQd2dxa01MbDNEKzNGVnB4VHJobWpFSTN0UkFUTVBRZkZOTkhn?=
 =?utf-8?B?dDlwdmtPUDIyMnB4bnZiWEdLZllYeGhTUkZQUDVINjBZdDhIOWNRMWJlc0hL?=
 =?utf-8?B?alRkTHRPOFJmcXhkUDRtS3F2eVM3YTRqOExTeVpRVjl3UTZaSlBDVmg4R0ls?=
 =?utf-8?B?em5PU21PRlNlNkRDNnhyQnF0bTJRR3FvMFBiMXpoSkFOYkdCUDVTN29VaERr?=
 =?utf-8?B?RmVPQmpHaEJnVDY0RjRRcEptalVId21oUTI5WlhFTUYwYy9OUzBkZDZ0Ylhl?=
 =?utf-8?B?eXpSODBWOFFYblQ0MmlpeXRRMXp1QklTbGJ0SzhhSXlRcHhINXJwWFgrcDJ1?=
 =?utf-8?B?bnplUklHTkVuSGFYY3RKdjhIL1NzQlozNm1YTmRTMDgxZlBMMm82WWEyVCtF?=
 =?utf-8?B?b3UwSFFPNmNwbnBScTlVQTVyRzk1emc3cVFZNVJvMDVDRWZiSlBDRnppSFg4?=
 =?utf-8?B?ZExEempmZHR3RHAxMWIxb0ZNSjl3UHhvdUhYQ3RsMzdLV0x4WG9zV3pwM0ds?=
 =?utf-8?B?aWVoTVZKZDNDSmVtdmdhSlM2RWhNa2l3VmR4QWNWK3JCK0dweWtYSHBnMHRo?=
 =?utf-8?B?bGVjR1M3MnVlckxaUFdKK2QxVjl0RFVvZm40ci9UaXZJVVdLRHpzdEZXdEVD?=
 =?utf-8?B?eXpFSzdWdmw4L1BNc3JqRDJKZE16aGF0cEtxSklGVG5Ca2F1ZDZJWVR1VTIw?=
 =?utf-8?B?OWtjOWpzRFVIbnJ4S0ZNSzVzRVdISCt5WFkzeW9tRGwybWMxZUVzck1vMFNx?=
 =?utf-8?B?bVZQZ09ycVR5bHZkSXVMNFZLUHN4M3dHT1pGSEZmSk9HckMrT0dTdGwwNTY5?=
 =?utf-8?B?ZjRkYTZFMjRKcFNPNDJCQStvTEdUYVp2R2wzNU5oUEdmNDE0YXpwMFkzY25m?=
 =?utf-8?B?SEp4Ykd5azVSWnBxTFNvUFpTZkRyNGJCZXJaclhHQWw5UFpSVDlUSkdsNXBQ?=
 =?utf-8?B?TTlvYXh0QmlMb0c5dkQ4NkJZWGNQYUxqb0NNRTZpWUJvdlZsSUhqdzQ2TER3?=
 =?utf-8?B?eVE4TmgwK1JpTHdrdXkwRmQvYzNzQnNNWkNuYldMbWJvR2Y5ZnBFVjZMM3FK?=
 =?utf-8?B?VzFZMUpxZENLWjAzeHM3azN3bk15SVlIM0xwSWFtbElYNFRHcDg5M1dUOURO?=
 =?utf-8?B?VmtSeWtoN1hVTURLeFNJNWptRWY1d0huK2JUcTA4ZklMYmhVWlVjOWZGa0xq?=
 =?utf-8?B?aU81Y092M05SQnRiTGNKektrd3VSMGJzQVU4K2hubzlMOVp4YlBoMkYwL0dk?=
 =?utf-8?B?cWtxVTVFYlU3T29NWFRyVzVDbys0dDhrZVI2Ny94Yk9NUDhjcXR2Z2dlRXRI?=
 =?utf-8?B?VTlHTFcyR3JGb2FXNmRScGE5c21TQWtoY0hUQkhvUEh1M1lOWUs5Yzd6MWY5?=
 =?utf-8?B?d2xxK1BBYW4vdDFOcG9VM0JOaGRPVW9laXlHMEhKVXpBemlxaEErK2UvRVJr?=
 =?utf-8?B?bDV5WVNWck8rbW02RUNWUnlMaDAxaTNJcG1pRG1LUUFhQWlPeElxTzJ2MlB1?=
 =?utf-8?B?cm9mRTlUTGVrMWhJdWxqRExlZ040UmhoUGpPdkNhOTJZWk4vc1RndUltT294?=
 =?utf-8?B?U2JLWGJiTExKYktvODc1ZzNaVEhqUWhjRitRZ2ZQL3cwV1M0TkloSkNtTU5z?=
 =?utf-8?B?UnFQV0djSzFGaEhDbGdVcEgyb21lcWVINGF6NzZ3Q1ZDekNsVkxGWWNUYXYv?=
 =?utf-8?B?TEMzNlhxNkZqMTZGcW1nM1F4Ukg4U3FRaG5qL21hU2ZuYitMbjdvaXg3V3k3?=
 =?utf-8?B?R2VCSmQ3UFVVbFRFa3Y1d0o0VzdhaWZ3V25TZ2VSQWZhazhWd1lkckdTUHFh?=
 =?utf-8?B?emhXMXU3aGdPdFB3QXlVYk9FVjlUQmNDZk1tZlVkR2ZtNUYrbW9WMDFjZnkv?=
 =?utf-8?B?ekdJdTNkYVdud2l2RHdZbm5QWUl1UmdGZ3kvdzNLUUZ5ZzE0b1I4QWhTQXll?=
 =?utf-8?B?WHd0a0tMeUlENkdWTVc1TTcyNDRnWG8yb0d2bEFtRFhheDBoeHdHUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC7538446B0F394D966F90EC3DA4413E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8e5f0a-de24-453d-04f1-08de5e3d618b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 07:18:05.5588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1oZCEVLgZ+koPmsj8U7id/G/hCROIaRCxy72Adu9/X+QqzRvP2r1ta8HD4X+pU2c1l1MQjXlrmbMzrrYD/k4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8580
X-MTK: N
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51717-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[vger.kernel.org,lists.infradead.org,mediatek.com,chromium.org,kernel.org,xs4all.nl,collabora.com,gmail.com,arndb.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediateko365.onmicrosoft.com:dkim,collabora.com:email,mediatek.com:email,mediatek.com:dkim,mediatek.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Kyrie.Wu@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,mediatek.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 185EA9DB72
X-Rspamd-Action: no action

T24gVHVlLCAyMDI2LTAxLTI3IGF0IDEzOjA3ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMjcvMDEvMjYgMDM6NDIsIEt5cmllIFd1IGhhIHNjcml0dG86DQo+
ID4gQWRkIGEgbmV3IHBsYXRmb3JtIGRhdGEgbWVtYmVyIHRvIGluZGljYXRlIGVhY2ggZGVjb2Rl
ciBJQw0KPiA+IHRvIGF2b2lkIHRoZSBjaGlwIG5hbWUgZGVmaW5pdGlvbiBrZWVwIGdyb3dpbmcu
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogS3lyaWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNv
bT4NCj4gPiAtLS0NCj4gPiAgIC4uLi9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVj
X2RlYy5oICB8ICA1ICsNCj4gPiAgIC4uLi92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19k
cnYuYyAgICAgICB8IDM1ICsrLS0tLS0NCj4gPiAgIC4uLi92Y29kZWMvZGVjb2Rlci9tdGtfdmNv
ZGVjX2RlY19kcnYuaCAgICAgICB8IDE1ICstLQ0KPiA+ICAgLi4uL3Zjb2RlYy9kZWNvZGVyL210
a192Y29kZWNfZGVjX2h3LmMgICAgICAgIHwgIDIgKy0NCj4gPiAgIC4uLi92Y29kZWMvZGVjb2Rl
ci9tdGtfdmNvZGVjX2RlY19zdGF0ZWZ1bC5jICB8ICAxICsNCj4gPiAgIC4uLi92Y29kZWMvZGVj
b2Rlci9tdGtfdmNvZGVjX2RlY19zdGF0ZWxlc3MuYyB8IDkyDQo+ID4gKysrKysrKysrKysrKyst
LS0tLQ0KPiA+ICAgNiBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCspLCA2NCBkZWxldGlv
bnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjLmgNCj4gPiBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWMuaA0K
PiA+IGluZGV4IDFhZjA3NWZjMDE5NC4uODBjYjQ2ZjFjZGVkIDEwMDY0NA0KPiA+IC0tLQ0KPiA+
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNv
ZGVjX2RlYy5oDQo+ID4gKysrDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjLmgNCj4gPiBAQCAtNjksNiArNjksMTEgQEAg
ZXh0ZXJuIGNvbnN0IHN0cnVjdCB2NGwyX20ybV9vcHMNCj4gPiBtdGtfdmRlY19tMm1fb3BzOw0K
PiA+ICAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBtZWRpYV9kZXZpY2Vfb3BzIG10a192Y29kZWNfbWVk
aWFfb3BzOw0KPiA+ICAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wZGF0YSBt
dGtfdmRlY184MTczX3BkYXRhOw0KPiA+ICAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVj
X2RlY19wZGF0YSBtdGtfdmRlY184MTgzX3BkYXRhOw0KPiA+ICtleHRlcm4gY29uc3Qgc3RydWN0
IG10a192Y29kZWNfZGVjX3BkYXRhIG10a192ZGVjXzgxODZfcGRhdGE7DQo+ID4gK2V4dGVybiBj
b25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfcGRhdGEgbXRrX3ZkZWNfODE4OF9wZGF0YTsNCj4g
PiArZXh0ZXJuIGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2RlY19wZGF0YSBtdGtfdmRlY184MTky
X3BkYXRhOw0KPiA+ICtleHRlcm4gY29uc3Qgc3RydWN0IG10a192Y29kZWNfZGVjX3BkYXRhIG10
a192ZGVjXzgxOTVfcGRhdGE7DQo+ID4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19k
ZWNfcGRhdGEgbXRrX3ZkZWNfODE5Nl9wZGF0YTsNCj4gPiAgIGV4dGVybiBjb25zdCBzdHJ1Y3Qg
bXRrX3Zjb2RlY19kZWNfcGRhdGEgbXRrX2xhdF9zaWdfY29yZV9wZGF0YTsNCj4gPiAgIGV4dGVy
biBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19kZWNfcGRhdGENCj4gPiBtdGtfdmRlY19zaW5nbGVf
Y29yZV9wZGF0YTsNCj4gPiAgIA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2DQo+ID4g
LmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIv
bXRrX3Zjb2RlY19kZWNfZHJ2DQo+ID4gLmMNCj4gPiBpbmRleCA3ZWQ0MDkzNmEwZTguLmM3YWY0
OGY2ODRjNSAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2DQo+ID4gLmMNCj4gPiArKysN
Cj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRr
X3Zjb2RlY19kZWNfZHJ2DQo+ID4gLmMNCj4gPiBAQCAtMzMzLDI0ICszMzMsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHY0bDJfZmlsZV9vcGVyYXRpb25zDQo+ID4gbXRrX3Zjb2RlY19mb3BzID0g
ew0KPiA+ICAgDQo+ID4gICBzdGF0aWMgdm9pZCBtdGtfdmNvZGVjX2RlY19nZXRfY2hpcF9uYW1l
KHN0cnVjdA0KPiA+IG10a192Y29kZWNfZGVjX2RldiAqdmRlY19kZXYpDQo+ID4gICB7DQo+ID4g
LQlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmdmRlY19kZXYtPnBsYXRfZGV2LT5kZXY7DQo+ID4gLQ0K
PiA+IC0JaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKGRldi0+b2Zfbm9kZSwgIm1lZGlhdGVr
LG10ODE3My0NCj4gPiB2Y29kZWMtZGVjIikpDQo+ID4gLQkJdmRlY19kZXYtPmNoaXBfbmFtZSA9
IE1US19WREVDX01UODE3MzsNCj4gPiAtCWVsc2UgaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxl
KGRldi0+b2Zfbm9kZSwNCj4gPiAibWVkaWF0ZWssbXQ4MTgzLXZjb2RlYy1kZWMiKSkNCj4gPiAt
CQl2ZGVjX2Rldi0+Y2hpcF9uYW1lID0gTVRLX1ZERUNfTVQ4MTgzOw0KPiA+IC0JZWxzZSBpZiAo
b2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoZGV2LT5vZl9ub2RlLA0KPiA+ICJtZWRpYXRlayxtdDgx
OTItdmNvZGVjLWRlYyIpKQ0KPiA+IC0JCXZkZWNfZGV2LT5jaGlwX25hbWUgPSBNVEtfVkRFQ19N
VDgxOTI7DQo+ID4gLQllbHNlIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShkZXYtPm9mX25v
ZGUsDQo+ID4gIm1lZGlhdGVrLG10ODE5NS12Y29kZWMtZGVjIikpDQo+ID4gLQkJdmRlY19kZXYt
PmNoaXBfbmFtZSA9IE1US19WREVDX01UODE5NTsNCj4gPiAtCWVsc2UgaWYgKG9mX2RldmljZV9p
c19jb21wYXRpYmxlKGRldi0+b2Zfbm9kZSwNCj4gPiAibWVkaWF0ZWssbXQ4MTg2LXZjb2RlYy1k
ZWMiKSkNCj4gPiAtCQl2ZGVjX2Rldi0+Y2hpcF9uYW1lID0gTVRLX1ZERUNfTVQ4MTg2Ow0KPiA+
IC0JZWxzZSBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoZGV2LT5vZl9ub2RlLA0KPiA+ICJt
ZWRpYXRlayxtdDgxODgtdmNvZGVjLWRlYyIpKQ0KPiA+IC0JCXZkZWNfZGV2LT5jaGlwX25hbWUg
PSBNVEtfVkRFQ19NVDgxODg7DQo+ID4gLQllbHNlIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJs
ZShkZXYtPm9mX25vZGUsDQo+ID4gIm1lZGlhdGVrLG10ODE5Ni12Y29kZWMtZGVjIikpDQo+ID4g
LQkJdmRlY19kZXYtPmNoaXBfbmFtZSA9IE1US19WREVDX01UODE5NjsNCj4gPiAtCWVsc2UNCj4g
PiAtCQl2ZGVjX2Rldi0+Y2hpcF9uYW1lID0gTVRLX1ZERUNfSU5WQUw7DQo+ID4gKwl2ZGVjX2Rl
di0+Y2hpcF9uYW1lID0gdmRlY19kZXYtPnZkZWNfcGRhdGEtPmNoaXBfbmFtZTsNCj4gDQo+IFdo
aWxlIGF0IGl0LCBjYW4geW91IHBsZWFzZSByZW5hbWUgYGNoaXBfbmFtZWAgdG8gYGNoaXBfbW9k
ZWxgPw0KPiANCj4gIm5hbWUiIG1ha2VzIG1lIChpZiBpdCdzIGp1c3QgbWUsIG5ldmVybWluZCkg
YWx3YXlzIHRoaW5rIGFib3V0IGENCj4gc3RyaW5nLCBub3QgYWJvdXQNCj4gYW4gKHVuc2lnbmVk
KSBpbnRlZ2VyIG51bWJlci4NCj4gDQo+IEluIGFueSBjYXNlLCB5b3UgY2FuIGFscmVhZHkgZ2V0
IG15DQo+IA0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPA0KPiBh
bmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+IA0KPiAuLi5iZWNhdXNl
IHRoYXQgd2FzIGp1c3QgYSBuaXRwaWNrLCBhbnl3YXkuDQo+IA0KPiBDaGVlcnMsDQo+IEFuZ2Vs
bw0KRGVhciBBbmdlbG8sDQoNClRoYW5rcyBmb3IgYWJvdmUgc3VnZ2VzdGlvbiwgSSB3aWxsIGNo
YW5nZSBpdC4NCg0KUmVnYXJkcywNCkt5cmllLg0K

