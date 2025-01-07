Return-Path: <linux-media+bounces-24320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1C2A038BE
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 08:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 733B27A24BF
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 07:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EA91DEFE6;
	Tue,  7 Jan 2025 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tWBrfHBg";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="m388TZdv"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE8617C9E8;
	Tue,  7 Jan 2025 07:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736234823; cv=fail; b=DJknV5J+BBsE+dlGlPKCM6VwB0xQh9MukWx6b9rN7ZsSIXgno4h5iDvvbmoSQAKFXmuP4+c6sxvNbKwHyCffFAMQOByl/vsr5lyF1v4s+6YpZu8sQfIwUBRw9M+hALRixbH816aoSa8m+Cp6EC8oNkGMV2QZ/+ke/8SWS+VHxRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736234823; c=relaxed/simple;
	bh=2yuiXW9EVAMRAphH4oiEjBHuDyubE+trbjldigKewdQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u1BSPoB2sIiD6hJAA5E4z4l7tn6Owm3+BedSNbsJvXfmAhbKqM1jEQUC1Q5Sw+XKA/Ek3o8RZzORO+qqTm1L2kBUWs4CNng7owBVX3Sl7ORzjVsIFkIIKkzZ6UUbGR/w4UxuZIdlPGvEdVXDG7/+YhvdGlZNiscwFf5oRyqbH8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tWBrfHBg; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=m388TZdv; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c0cb5830ccc811efbd192953cf12861f-20250107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=2yuiXW9EVAMRAphH4oiEjBHuDyubE+trbjldigKewdQ=;
	b=tWBrfHBgz80WT/v54QOj4jQhUNLwI30ksqiqzqush1T1W78sy/2oN12oHj3hSZZqDAxPqQoLDkLcJ5s4/LSjd56gPZZZQh9pQ69CVvTmfXXaJGMNY6f6qyHQpVb9yo715IlBKRiXLLf4bEMhBov5Yx8F1z0oFVNurQB4fpO7lTA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:ff1c07d2-b2d3-4984-bd26-1626216d857a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:cdb87c37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c0cb5830ccc811efbd192953cf12861f-20250107
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 726802570; Tue, 07 Jan 2025 15:26:47 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 7 Jan 2025 15:26:45 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 7 Jan 2025 15:26:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fG7/IvydQ3bwDXuP2Q+RO8Rc035OH+J8TnMhCTkr70+RfbrwQb/ToLeAcsk2044WY3LEBtIoAOliRW3y4v2UK04tqOmLpMiUEoHasWvaHMLDPfa4jqX5KAnsMCcKRmfS+hsU/tm8a2rNKt7Qw0jbn4pUaHCaxqU0GsKX+MWuSGwz8PaHM+lu1mJ1F1h7UusYUG3VncPZn9UN9sXOfHhGyeCoZpH2aotqm2XiDsjhHLNMROa50Lyi8xLn/+7QDL1MtXmQrbFmw7py1pxDyWPbrAZixRiwtt5FqSOkShqYMI/5jsGnkf4qks29s1F3ui8QeF5iIJ/EQoCF9D5vY/hTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yuiXW9EVAMRAphH4oiEjBHuDyubE+trbjldigKewdQ=;
 b=Ws0kUhLx/5p5K+Yqix66QkDNkcB7SgP5OAuivfW/EwL9Ip3oGw5oyzblD/WVJEYDpbq1kfaNIO0bRDuk5rANZ97VOxgbk8JxGpL8we5TCJN0plJ5M971ijWcqNgNwBCUYGrXLzV9EZP9KOkagZ+JopwvG9FnPPieTx2PY7Br2ltnJSTAbpZHTQ+QNieZMflJausms/MT6wJ8rpBTQCsXgazzdSH0l6foV8xHby3JIAEaxqMQxiDHL64nmBlhul0Lg8jXFB9QJQYAI/kkZcfcFKJf1U6AQlHykualCKXvHPwsu0ifosGc0/EUv+JuDa3PH8+uDbvhojh8kxW0W5q6pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yuiXW9EVAMRAphH4oiEjBHuDyubE+trbjldigKewdQ=;
 b=m388TZdvz0xgMGO0c0ZR0L//hSCMJYyuIp9nPMSlcKeqPkG1RKrTI3wXhCaZnSn1+LFY6Lp9cZ3O3FZB3zG9p2QsQ580EZkF23XSlz6jVAkNfg94VlN4luJgkMDN1SJdpL6PMNPt8Wc65eaGByVZjOOiNiS2ySKRazUmr2WaRu0=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB8096.apcprd03.prod.outlook.com (2603:1096:101:17f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 07:26:43 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 07:26:43 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"mchehab@kernel.org" <mchehab@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
	<Moudy.Ho@mediatek.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
	<Xavier.Chang@mediatek.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196 support
 for gce-mailbox
Thread-Topic: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Thread-Index: AQHbUjifwIYL/sR61UKff0WQOKSFC7L5ygoAgATKiACABsoBgIAFWIAAgAA70ICAABOqAA==
Date: Tue, 7 Jan 2025 07:26:43 +0000
Message-ID: <42def68200b28b5bea3cbf091907343976482132.camel@mediatek.com>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
	 <20241219170800.2957-2-jason-jh.lin@mediatek.com>
	 <yg7b2iaz53avd7gpvuewhi6b3myh6owls3dt2hzpqc26lnykjf@tpu2vxqqkipe>
	 <11f168c11b4cea48cf51406c0afaf8f1f53ad90f.camel@mediatek.com>
	 <6adfa5fe-7b68-4f8e-919d-7b7607fe617c@kernel.org>
	 <90b38dd6e093c89a7383814db786321cbd4533f6.camel@mediatek.com>
	 <420caebd-136f-4015-96cd-5f37b9c3f49b@kernel.org>
In-Reply-To: <420caebd-136f-4015-96cd-5f37b9c3f49b@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB8096:EE_
x-ms-office365-filtering-correlation-id: 80dfdfba-60aa-4f83-1b4b-08dd2eeca2cf
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RmJkejJ2cGlFdlFoNWpMMC9id2J0b2lxQnU4SzYxU1ZIM09ld1Ava0cyT0pp?=
 =?utf-8?B?R3FwU1Y2MUFKK1JGMjVua3JscHJYMEkxYkZhOGoyOTBMdnJVZTZWY1gxY002?=
 =?utf-8?B?ZVBaVXpubk5ocGd5QjN3NVE1L2xLL09jQ25zak1yS3BYSTVoaFU0amtTVGFE?=
 =?utf-8?B?Um1kbVVYUklKYjRTUHhxaDlvTlVmcmxKTnVKSFFsV0V6ODVhQWEwQ0g5dmY0?=
 =?utf-8?B?OUxtdzhOcnJSZU05WDl1UHA1WHhiVTZmb0Q2QjFtd215aE1KZ0IxTTNMeURx?=
 =?utf-8?B?cDhITFZMSCtXRVFLdGlXTWUvRUorY3Nac2pCaGdFZmtBbllKdHhwaDRDU0pn?=
 =?utf-8?B?YTUyeEFoU25RdVhDRTRRcU4rWi9PUDUyUG5aa25na21HL09MS0tsYS9iUnhn?=
 =?utf-8?B?TFVrVVFlZ1h3d0VTZXFjRzM4ZUdOalI1bGNOT21KZ0xvb3BPYkE2OU9zSW1X?=
 =?utf-8?B?bjdCenMzVFhHdmNiTlFDTDF3Z01PNzVpdlVoSlhtNWloaHQrOXNSTmZGTUFR?=
 =?utf-8?B?UHRZbWY1djJmc1N3c1hpZTB2OTArVFFodktKTXV3cG1SYWc2OHByb0pNTmlO?=
 =?utf-8?B?WkZoVytzUW8yZDYvOEJuTGNic25RWHBiWmdUUlFOYzRydXhZWW9xL1huU1lV?=
 =?utf-8?B?Ylh5Uy9OU04xR1pCN05OaTIzZU9laEZwLzFjV0pNZDlhbS8xcTFhZWhwVmVm?=
 =?utf-8?B?cStFeElaMk1UbHNtVml4dk1GM2F2amxUbVBGS0lqU2Y1OXhTcHRzU0FMVm1m?=
 =?utf-8?B?dzNjNzl6K09reWdzOWpncU1UQzNIQ1lzUDBqMEVBQUIyNXorS3pOR095MjFv?=
 =?utf-8?B?M1laMXhkUlBqWms0VCs2S3NMdTQ0VWNkY1ZoL1Q1Y09CNC96UFQ4OWVKY1NJ?=
 =?utf-8?B?dVZrZURFaEZYNVd1T0pTQzRsVDVPZWc3ZytNZFFSSERYaUFNMTNRTzNybnZh?=
 =?utf-8?B?NUt6dTQvbVU2cWpSMnY4bHBXbXlGS2xBZWFDSjRpZDFHVjhkaHVVMEg5T0Ro?=
 =?utf-8?B?anFsb0E0eUNlTTAzRWtYOWducFNtNEg2R3ZDMCt5V1RraFF6enlIM0k3a1dh?=
 =?utf-8?B?aGE2QW9UNU90TU1EZGRoWlErOTVtSEtDU0RrclVqaUZMVjdCeXFiRnBjdU03?=
 =?utf-8?B?RWFxd2pnMGtRRGQ0eElLazdzQ2pLRkM0cHQ4djA3RDkyTDFHTlBhUllwT2ZV?=
 =?utf-8?B?aDNwd21ZbVdFd092VG1ySXh1UU5ZRVlKbGY0Uzg5NWVxNkptdnRLR2s1MTVk?=
 =?utf-8?B?cXpOR0hEeDdjYUNQUEJiVjYxeXR2Kzg3UlBsMU9wK0lnUmlzWnhqNUdYcUlV?=
 =?utf-8?B?MXJaL2JLWkNqb0M5U0hIdlNWZng4NFVuZDFvSEtWUlc3K2J0Q0ovcUQxWjlY?=
 =?utf-8?B?dDFvSnZHUXo1SjNzUXVjRmxpQ1hWR0hvSCtYRk44ZDltdWQ4TC8vQ3ltcmlk?=
 =?utf-8?B?dzF0VWxDbDBBZDdMbXpJSTF3MVlMMWxnMnBqTXNpenErdUxkUlkyWmVNVjZ3?=
 =?utf-8?B?Z3Q1RGJOeVJHVjB2Q08zWlBTcjVaR243bnI5WmNraURTNW1hQ21QOEMxSHJQ?=
 =?utf-8?B?YlVKdXJRUG4vSTlrdGZYTFZ0MTFmZzUvbnRnT1BHSVJ2M1ZTK25EcDVENFJ4?=
 =?utf-8?B?d2xyck9CdUJFZjhqV1FmckFIMXJKSkFGeldnaEY2U1MxTEJoSnhmRjlFS2Mv?=
 =?utf-8?B?UjBvMFd2T0wwRmhUbXptaDVCdkZ1Um5SaXRXMTZ4RmV0dmY1MCtEL0ZaY2oy?=
 =?utf-8?B?VEJkMjN1eW4xd2M2T3RPK28zeVhEUGxKTVFkTHRacThaQmxrZmFWU2VYd2k5?=
 =?utf-8?B?U1lhelBza1ZWVjhuckZiL3p3VmpmOVBJL3g3QytIVHRrTDRsek9BZCtKb2xq?=
 =?utf-8?B?c2VDS1BENGlTN290T3dyUitTWGZSVVJUUkE3MEtua0tNSXJHZGdpcXE5b2tP?=
 =?utf-8?Q?DNX6SG+ig57ZughASD9xLRm7LYszL5L+?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3NDaVZ6N0Y4TlFnN21YU0hkU1lTVHdicEFySHFRUms5UjdLWndYS29penBW?=
 =?utf-8?B?V1NhYzBGaDk4ay9QbkhrMVFPQWc0ais1ZWdpdWxPSmtzS3pzWFRVejZmUHhi?=
 =?utf-8?B?ZHdRVnF4cDdPc1g5NWhOb3NQK1NubWZXQ3RBbitmNm5pTm5nVVlMQUMrY3Jq?=
 =?utf-8?B?Ull3Yno0WGM3M2Jad2NGN1Zpd3Y3cEk0RWdTMGZXVEl3YWlHVkNkbkkrNkZK?=
 =?utf-8?B?eTgva21sMktkNGZ1dkVxalNMTWNVVXZnazMxenNpdi8xN3ltMVRLL3Zpam5M?=
 =?utf-8?B?NEtJQy9QOGZrWWZ4elJGTlVwWE5WRm95TG01dVJ2ZXVrREJjTTF5TlhMWUVq?=
 =?utf-8?B?N0EzNlloUndod3FrcmZsUWxWL2pWNHRQZ3NLN1RGK3c4c2pmbXYxcE1KSjRO?=
 =?utf-8?B?d3NIWDlYaUZhNU9Obm9OVTZ3Tm9yU0dERDFncmRLa0VEVEFxcW9TdjMwZmc3?=
 =?utf-8?B?TTF4NUYzVVd3eGVBM2szNW93cVUzYU1rdml3eWxXQzZ0dkp3aHZLcWZWQU1L?=
 =?utf-8?B?VDlORkMxa2pETXVZa1hMbDhRblZsRkRYS1dwVUlOazZENlFmMUQwR09sS01n?=
 =?utf-8?B?bmIxYzF1aTZpR0M0REQ0SGJadWRpcTZEOThZSmhpWklmaVErLzFZZjZVRUls?=
 =?utf-8?B?ZFRQMlo1eklGM1psVzBhUU1EQS84NWM0dVBSSFRmNUFlSEN2RTE0dm5nQnF3?=
 =?utf-8?B?Y2NvUVdnZmJaY2RHVGg5R1BLL0xZM2I2U2M1Ky9HT3liYkRoY1VUNENJMjEy?=
 =?utf-8?B?Snhqd3BuazBzS3J1T1ZTRXV2VnZ3azRPbE1RTDFEQ3phejNORW56WlE0cFU2?=
 =?utf-8?B?Q0NQbVVZQXJybWhIUEJ1RlVnVjZVNVFIeVRJdG53blhOMUF6ZGNJV3lIc2Z3?=
 =?utf-8?B?SWFzdW43NmExUnF4bjNQMjBKaE15cjQzbUNLRlpTcDBKNFUwQ09SZ2JzdndJ?=
 =?utf-8?B?MXp5cGNRRVR0djE0RjFUL1Vlak1mZXRBSFBPWXVCcVZPbExTc292c3M0K05R?=
 =?utf-8?B?bEZ4cThQUHlobkRUZjU3R1d2ZkNySnBYQnpTSG9nZ0RiOUxqc255L0tXcUJp?=
 =?utf-8?B?NFl0MER2OXIrcnI3aTU1aDNab0pHSnB2REFoNThOMWRSUy94Q29FMGZIVW9p?=
 =?utf-8?B?YWV5RDJDZ2tPYmZKK3pTS0k4UVI0cVZYVDJBMnhCZFlwMm9qdDhGeHowK3Q3?=
 =?utf-8?B?a0RNaHo1T3hrakJjZ1BUM0o5MDNTTUpQdisyeFFnZmFhZ0FhRkc4eTVTaEcy?=
 =?utf-8?B?VjdLby9xZWErblpWUUhmelQ4ZkVFcE9NV3VsYXhrcDZ1YkZPQmduZ3pEdU4z?=
 =?utf-8?B?eWlWeGFPc21ZNHlPRm9ScElDM2ZMWTBwMytNQXFyY05nUXRFc1ZVYXVFekg2?=
 =?utf-8?B?Q2lTbTVpRmNsS2JBMU1NaitnYXI1eUI2RHZSbnZIbGE2SkE2ZU9Dbm5FcEdG?=
 =?utf-8?B?dExCd2J1bGN2K0IzMjRYTzhLcS9YdFJCaXhQVkRIMWJ4UURaYnpRekRhWXU5?=
 =?utf-8?B?dG5UN3JHZFpOK3BRRnlJcEMrZDdHUEdORUtzcERmZ0lyWkFGaVdBM2ZLT0pJ?=
 =?utf-8?B?aTNMRTRoWGZwWHNjVHZxWDhabU5yWllPWkU2RHVhY2FtblZndDNRZ1JLcTRI?=
 =?utf-8?B?QWV5OC9NNHFiemd5SGdTbjZRcjhXUzZDTXZXSDI1TzJzMUxRckl0YUpYdFZa?=
 =?utf-8?B?eTA2cGlUZC83azR0aXpITjNoMXhNalZ3cUc0cGtmenJHM0dNbkozc1BkLzAr?=
 =?utf-8?B?RDdnNzlBdDFuNG9vSzVuVjNGc3FTbWdZclpGU2FHM0hFMkVOcmtURzJSZGtG?=
 =?utf-8?B?THNkTGZSUW9kdEE0VGZlNnJnZTVEc2xsZU9SOWFUeUtsK3lYSThCaExNcXA3?=
 =?utf-8?B?T2dpVjdtN1ltWlB4bjZycVdYVUxLQ3Jra1kvT0VrcGdNYnRLRllEVWFHQXRu?=
 =?utf-8?B?SFA2UU1RbUhIWW4weDdINEFidkVLVXdCK2VEZVROT2QwUWVWQXhnWmIzOWVK?=
 =?utf-8?B?Wk5sa2RzK1MxQUErN01LeXdlajJ6VHVaUnRoVWlmT2VFQzdJZjI4QnVjN3hP?=
 =?utf-8?B?V0ZwdDFtdzBmaTRPckJkcFl4dG9VTGxYVXA5allMRGg3NlZDSGRwRmFFaEUv?=
 =?utf-8?B?RXJoSmNucHNhNXMvQ2Foczc0SVgzdFc3U1NYakRRUjY1V3ZNQmdubFNIMERs?=
 =?utf-8?B?M1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6456175C8C95A44FA9CA4359D96C4712@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80dfdfba-60aa-4f83-1b4b-08dd2eeca2cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 07:26:43.4646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6RWZXvHF+eBbaP1UEdkISaV8W6LnXf1kZIt7wRlIwalt+DgBi5I9sZlAkaNWi1jpTyI6iCLixIIiXDxV20DG2bWTOJ5dn/iVS3jQBhClSzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8096

T24gVHVlLCAyMDI1LTAxLTA3IGF0IDA3OjE2ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiAwNy8wMS8yMDI1IDAzOjQyLCBKYXNvbi1KSCBM
aW4gKOael+edv+elpSkgd3JvdGU6DQo+ID4gPiANCj4gPiA+IEJlZm9yZSBwcm9jZWVkaW5nIHdp
dGggdGhpcyBoZWFkZXIgZnVydGhlciwgcGxlYXNlIGFuc3dlciB0bw0KPiA+ID4gYWJvdmUgLQ0K
PiA+ID4gd2h5DQo+ID4gPiBpbnRlcnJ1cHQgbnVtYmVycywgTU1JTyBhZGRyZXNzZXMgYW5kIHNv
bWUgb3RoZXIgdmFsdWVzIGFwcGVhcmluZw0KPiA+ID4gaW4NCj4gPiA+IERUUw0KPiA+ID4gYXJl
IG5vdCB1c2VkIGxpa2UgImJpbmRpbmcgaGVhZGVycyIuDQo+ID4gDQo+ID4gQmVjYXVzZSBpbnRl
cnJ1cHQgbnVtYmVycyBhbmQgTU1JTyBhZGRyZXNzZXMgYXJlIHRoZSByZWFsIG51bWJlcnMNCj4g
PiBvZg0KPiA+IGhhcmR3YXJlIHNldHRpbmdzLiBUaGVpciBkcml2ZXIgY2FuIGdldCB0aGVtIGRp
cmVjdGx5IGZyb20gdGhlaXINCj4gPiBkZXZpY2UNCj4gPiBub2RlIGluIERUUy4gVGhleSBhcmUg
YWN0dWFsIG51bWJlciB0byBiZSBzZXQgaW50byB0aGVpciBoYXJkd2FyZSwNCj4gPiBzbw0KPiA+
IHRoZXkgZG9uJ3QgbmVlZCB0byBiZSB0cmFuc2xhdGVkIGluIHRoZWlyIHBsYXRmb3JtIGRyaXZl
cnMuDQo+ID4gDQo+ID4gU28gSSB0aGluayBhbGwgdGhlIGRlZmluaXRpb25zIGluIHRoZSBgbWVk
aWF0ZWssbXQ4MTk2LWdjZS5oYCBhcmUNCj4gPiB0aGUNCj4gPiBzYW1lIGNhc2UuIFRoZXkgYXJl
IGFjdHVhbCBoYXJkd2FyZSBudW1iZXJzIGZvciBHQ0UgaGFyZHdhcmUgdG8NCj4gPiB1c2UuDQo+
ID4gSXQgc2hvdWxkIGJlIGRyb3AgZnJvbSB0aGUgaW5jbHVkZS9kdC1iaW5kaW5ncy8qLg0KPiAN
Cj4gSSBkaWQgbm90IGluc3BlY3QgYWxsIG9mIHRoZSBkZWZpbmVzIHlvdSBoYXZlIHRoZXJlLiBN
YXliZSBzb21lIGFyZQ0KPiB1c2VkDQo+IGJ5IGRyaXZlciwgc28gSSBkaWQgbm90IHByb3ZpZGUg
eW91IGRlZmluaXRpdmUgYW5zd2VyIG9uIGVudGlyZQ0KPiBoZWFkZXIuDQo+IFRoZSBjb21tZW50
IHdhcyBhZGRyZXNzaW5nIG9uZSBzcGVjaWZpYyBncm91cCBvZiBkZWZpbmVzIHdoaWNoIHdlcmUN
Cj4gbm90DQo+IHVzZWQgYXMgYSBiaW5kaW5nLg0KDQpBbGwgb2YgdGhlIGdjZSBiaW5kaW5nIGhl
YWRlcnMgaW4gYGluY2x1ZGUvZHQtYmluZGluZ3MvZ2NlLypgIG9yDQpgaW5jbHVkZS9kdC1iaW5k
aW5ncy9tYWlsYm94LypgIGFyZSBub3QgdXNlZCBpbiBhbnkgZHJpdmVycyBhbmQgdGhleQ0KYXJl
IHRoZSBhY3R1YWwgaGFyZHdhcmUgSURzIG9yIHNldHRpbmdzIGZvciBHQ0UsIG5vdCB0aGUgYWJz
dHJhY3QNCmJpbmRpbmdzLg0KDQpNYXliZSBpdCBpcyBhZGRlZCBpbiB0aGUgd3JvbmcgcGxhY2Ug
ZnJvbSB0aGUgdmVyeSBmaXJzdCB0aW1lLg0KSSB0aGluayB0aGV5IHNob3VsZCBiZSBtb3ZlZCB0
byBkdHMgZm9sZGVyIHRvIG1ha2UgaXQgY29ycmVjdC4NCg0KPiANCj4gPiANCj4gPiANCj4gPiBC
VFcsIHRvIG1ha2UgdGhlc2UgbnVtYmVycyBtb3JlIHJlYWRhYmxlIGluIERUUywgY2FuIEkgbW92
ZQ0KPiA+IGBpbmNsdWRlL2R0LWJpbmRpbmdzL21haWxib3gvbWVkaWF0ZWssbXQ4MTk2LWdjZS5o
YCBpbnRvDQo+ID4gYGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk2LWdjZS5oYD8N
Cj4gDQo+IFllcywgc3VyZS4NCg0KT0ssIHRoZW4gSSdsbCBtb3ZlIGl0Lg0KDQpUaGFua3MgZm9y
IHlvdXIgcGF0aWVuY2UgdG8gbGV0IG1lIG1ha2UgaXQgY2xlYXIuDQoNClJlZ2FyZHMsDQpKYXNv
bi1KSC5MaW4NCg0KPiANCj4gPiANCj4gPiBKdXN0IGxpa2UgdGhlIGBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE2Ny1waW5mdW5jLmhgLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBL
cnp5c3p0b2YNCg0K

