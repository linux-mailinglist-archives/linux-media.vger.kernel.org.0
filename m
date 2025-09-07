Return-Path: <linux-media+bounces-41924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 479EFB47A37
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 11:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 024E43BF6D1
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 09:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA312222AF;
	Sun,  7 Sep 2025 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gYQrRd/Q";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="chkPiC/I"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2751DE2C9;
	Sun,  7 Sep 2025 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757238270; cv=fail; b=Ouf5Li5xoS8T3k+F23b05MymTLQuCmolibGnXgXwgQqHK6n4c6JyBl2677SxWkHlp/Dsi5TefPfOg9Y21nNdTIC/eCILxjaDmce9pAzq4NuSJHKDqbPmSvr1SKgS9YRXK8ffqkLftRL8vZqWbyHTmNUz2uYEhMVPzfO0644pp6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757238270; c=relaxed/simple;
	bh=Uv9J0w2qaFt2ykmR9rTg5giveFI1fXqGrOuXmYmsmhc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TOZ3fY58qcohhQ8nUC3Rp1tbAaQ4Vq3csKUSYFw8x5zUSyKPg2m1I8fBgG/JfsySt8DYRQPiqkji4GXLlwRuNY/oKMM8wPOuMmTKaUhsLM3HcSkMTr6v+KxxRoUUY+QsO9abJ8U1wroSflRcc14uqaQU7r20psdQFZqqU0kGRoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gYQrRd/Q; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=chkPiC/I; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3c148a3c8bcf11f0b33aeb1e7f16c2b6-20250907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Uv9J0w2qaFt2ykmR9rTg5giveFI1fXqGrOuXmYmsmhc=;
	b=gYQrRd/Qe/cPzN9nGBUTFcTyBQsjjltCC5dcrP9D7lHMjZNHKsbTk3KPGhnXRVF80biMcfvd94c/X2cO4036Nf24l/oNGmP//mdEFj9Jk9bIA2wAc0cdOquBO1XRJMHdcHJyc8n47ax4JEL+aCA2eH2tfEZxaiyIBMOGGncA/3w=;
X-CID-CACHE: Type:Local,Time:202509071744+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:bf9ad5ae-dbb3-4453-b425-aa72f6eb819a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:a9328484-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3c148a3c8bcf11f0b33aeb1e7f16c2b6-20250907
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1462454799; Sun, 07 Sep 2025 17:44:23 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 7 Sep 2025 17:44:20 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 7 Sep 2025 17:44:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EX7wqeZ3S12UOkm01cRND9UoGj/3HG38YfOt2RMsnPMjIvDS6JVjxt8HwEQkEcFKAMnWJwfYWWKRFttt1e1W+BPKxp6YekSGrxrShr9J/m+D0kA4p0LMSu4HoaCVBDB4J0d9Ce6H3nUyztk/uZBClhge/hVHGSxusN12dIEnyJZ1OGOiArgPOmZ6R5ilq3EP68S7fR9vo1yPuaZovJOYZco3WUPvV1TzRGekIs2/y/vbiL6YXoRDEcqrw9WAPjDznp3SXSxVvIU9NjKoIiQqX+Z1ZF28dnGqZKmndEnzsKf7qcB1i8vkUw93p976y9HNYqMCjrU+kWj2gGsgmOP2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uv9J0w2qaFt2ykmR9rTg5giveFI1fXqGrOuXmYmsmhc=;
 b=UShR6/xV0qwzJqNGHGxvghFGcyFcKmuAVKolRBWpu3w2tnHEmkWsOxVy3SarFF5mFcGHBSYk19ctBM+z0TveG+vYv9sJ71HHMh9akf1Pa8izvB1l2qgpeUDqxESh1BOsLh7es/fpFngg3pdTmuuhorU1fWlJPjJcH8zIymOZu/2Ro+HZvT/drhkNCRjWyIov9AtONlowKLVUcmsMLbsxDjmCLBmhh8cjnUHXP0y3REccrDZi4U8Eyuv1XotXhAu/TeZFdvjgHgzyTzDGsgDVbIg/CanVNFSUJEJs4CbWsgcoHTYgajuMAZinEfZkQb/EWxjyQQPeL8f9A4Jo0tp3Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uv9J0w2qaFt2ykmR9rTg5giveFI1fXqGrOuXmYmsmhc=;
 b=chkPiC/I6goTz68whAebehcHzg/hFovCRjvj9aH/ZC6hripbJ1ZU2WhkYre+VT0F4S6yBiFOCjZjR6CA3XBB3HNOnKcTzzQD4UUVgUWgzMy4zU+JETiFvu58sfmkPmLfvlXEwo1uSnTSdIO4sDWSFgK7YEFHRXmTWijtVKeZnbw=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by SEYPR03MB9402.apcprd03.prod.outlook.com (2603:1096:101:2d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Sun, 7 Sep
 2025 09:44:15 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3%4]) with mapi id 15.20.9094.018; Sun, 7 Sep 2025
 09:44:15 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "rongqianfeng@vivo.com"
	<rongqianfeng@vivo.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Subject: Re: [PATCH v2] media: mediatek: encoder: Fix uninitialized scalar
 variable issue
Thread-Topic: [PATCH v2] media: mediatek: encoder: Fix uninitialized scalar
 variable issue
Thread-Index: AQHb9iF9+0FWJhwIhEyiLOH9aPg8Q7R6RMcAgAXhiCiAB6VeAA==
Date: Sun, 7 Sep 2025 09:44:15 +0000
Message-ID: <820d9e864019a25a9b552ac73fd4324642f1e415.camel@mediatek.com>
References: <20250716071450.8214-1-irui.wang@mediatek.com>
	 <c751e015c0a9fb2ab6514a45952e01424cfbb0cb.camel@collabora.com>
	 <dbfac6888a2c77c302265df2f90bf4aec8bed686.camel@mediatek.com>
	 <005438a1d81a1d02d6c8659bd951ff65d3f39d85.camel@collabora.com>
In-Reply-To: <005438a1d81a1d02d6c8659bd951ff65d3f39d85.camel@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|SEYPR03MB9402:EE_
x-ms-office365-filtering-correlation-id: 33eb35da-4805-409a-2135-08ddedf31bbc
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TExVSEtVMFRlNkF3Q3YvZXV0OGhDLzBBWVRaQU9nVWFSTlg3cWJGc2M2R2NT?=
 =?utf-8?B?RmdES2I4NzBpS0REb0RvMnh4NTZuc1ZROXNnbGRGQThLd0NmY1F6b0hidFJi?=
 =?utf-8?B?azcrTGh1S0JTdFpxUVY4SUxsNnNSd1BubCtqc0VoZHVWZ0xDTnZVRDJrbUNm?=
 =?utf-8?B?OWdWY0VJdTkxL1l2V01LUFZwTTk1M2ZGTFpFNjlEWXQ1dStZbVNObU5qK3l6?=
 =?utf-8?B?aCtoUnJpV1h0ZGI5bmZhNGc2VXZKOCtCc2JScXpkUklManJ4WkZMQWlZVjNv?=
 =?utf-8?B?RGx1UEh4ZWxLZTJ4UytONHNoMWViaDRZK2dVTUJkd1h5dkNnWnd4d1lVUUpL?=
 =?utf-8?B?LzB5aVJYNnVvTkxjUzdpTEVmT3JkQTU5UDcyNWdzdTRMNC8rZFJWSWNKTnlo?=
 =?utf-8?B?aFVrVkl2VTJFdXVCc0FRd3E3cmVuWTRsbWx6NmdCKytsNEpKRW5jRlhPeGZV?=
 =?utf-8?B?bTlRV3poTWdIOFhNVkMxK0ppVGU0Uk9YdERCQWNRRzJkVmVZR2FDdE5Lb3hE?=
 =?utf-8?B?bzVwZUtTRHRjYkJ2QUFPMC9HSHVVTUl3RkR0TENBbHI0U2VMY2UrUTlwQlNJ?=
 =?utf-8?B?eDlyY0I4RHhwSVdlTzZUbGxFb3MvL2xKYkVrb2VqQTEzYk55QzYwS1dsdlY3?=
 =?utf-8?B?VUg1V1NVOHY5M044ci9OVVcwNVpyTjNyT2piMUJ4OUVxblAzZjBWanV1VStw?=
 =?utf-8?B?eUFUYTZRckIzTWdNUnpMTFNXajd5QkNtWGhla0lrVUlWendVTXFuU0h0T3Nv?=
 =?utf-8?B?UXp1aHE1Z0hCU2NCc3dyeXVEVzd6T01OSytJTEp0dkpqSXY0Uzh3eEdxUzNv?=
 =?utf-8?B?M2lHQzI3N2hvaE9XRmE1MkM4bnFiaXpkZEwzcGorcFBrMmlIZlV2ZUhadlVt?=
 =?utf-8?B?NzVVZEoyUGd1bVJqNi82dyswcS9Cb09PTFRYQzdLbUEycDRlRFJZbzZIbjB6?=
 =?utf-8?B?eVZINnU5R0JwYVlhV0JRUkNNQUgxMzZJdnZaL2RMb2cvd2wyOVZZYmQrdDly?=
 =?utf-8?B?eHJlMDc3dFdRVVg1bzFpN2QzT0FhVzBaVFc5cWxRaHRlQzdWaXlaL0V0V3B3?=
 =?utf-8?B?dUNQdTk3QTQvOWNMQ1Rva3pGRWZ1dWROUzFaQitOYWJ5eFhHb1ovTVA3SXpJ?=
 =?utf-8?B?TVA2SjVFSUdyOWEwR0xHUldLbTNmSkdvVWZGREFFNnNIREFNYVFCd1NPQlpv?=
 =?utf-8?B?dms1UG1BZGtuTmpmZ2RhK1ZyQXRYNnR6ejFINWMrV3ZiQ1BUZ3JSbGRtaTA5?=
 =?utf-8?B?citEem1sanAreXJNSjdCeWgwRWhlazB6ckpNcERJRHBSUUpvU1JabUlQbVha?=
 =?utf-8?B?bXdwbW1lVE1aZ05WVFYxdmFMYXhKb091ZFo4Sng1ZmUxcWN2S2xhSGF5QU1t?=
 =?utf-8?B?MHFSTTh2SWNjOWtyS0VzRGFpQ0dzN0t4SkcwdnUzVlFKZWtmc2JZWUlZUDNT?=
 =?utf-8?B?NEprT2Y4cnVKWmg5VzgrUi9vMEFhNkJFQytMR2N5QTdIcEdvUXZJUzh1UUdt?=
 =?utf-8?B?WmJCMnc3ZHA5TWZpSUF4SXlTRXFzOVNQdkZFTGdqR2o5TnE2bm0wcHVaeWIy?=
 =?utf-8?B?K2pZUGU5MUk4U1NpNlVFcnhvN3MxZkx2alNBTERsM1ZCMDhWcTNiMEN6NSs0?=
 =?utf-8?B?VzFUd2t0VzcrRlJ1aTNBK01BaVViZ0lBRTlKM0ROblFZWVorV1dwYVVLNVJI?=
 =?utf-8?B?T3VrZ05BWCtOa243SzBoVGFIQmVzaWFrbUYwTkpLdXpzQ2ZqRks1WVdlZHZo?=
 =?utf-8?B?TUZpbGR6RnVNb1gyRlVjMWRtVmxtMFZnSW1IbG1JelAvc0lTN1lLdEtmUW5V?=
 =?utf-8?B?RDVGQVBsLzlTSFNQbjVhcDcwTmQrUE1WdHlPL21mbVNnT2Vzb01SOHZHNVZZ?=
 =?utf-8?B?dkVOcytrZldrcWJWZWlkeTBFaUhvc1U5b1p4c1VtL2poZUpsdzhwK3lLRHFG?=
 =?utf-8?Q?qBffzJL0kWqR9n2O2UIKR3pGuROb9Ccy?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHU2UlpManNFdlJwbTVZQk45TnFPV2JRSkxYZEV4M2U0b2dCZXRUckdhZnJs?=
 =?utf-8?B?bkZ2Y2dzYXdBTldONVRic3VYYUo0Y1NGdkpDSzZtWEh3eUJ5cmEyNU1IQ0gw?=
 =?utf-8?B?RGlwaXd6SWNYL3ZlTzgzam9TbWNrVFN5bVNGR083QlUzUENnSGY0OWpVeHQz?=
 =?utf-8?B?RmdUankrNnRyU2dXM1FCc29hQXlBYysxaVQvTmh4WENSaE8zeXFHV0FCZE1I?=
 =?utf-8?B?dEdVNFdIaFUwNWdTdWthRG4vaFU0dmlka3k0ekRDdTU1YklrUGdzOXU5SzlH?=
 =?utf-8?B?WVFyek1MYU9qeXpQT3dEMHc1ZU5ZR25OSWtBeU9oREhKeldiYk9UWDRBdjl1?=
 =?utf-8?B?RlF4S0wwTzBwTkNqMkJOQkJnU3ZWQldXaXc0eURrdnphZ3NhN2lJS0ZrZWs4?=
 =?utf-8?B?RVg5blFIRW9IN3l0RzNCd2JyS1I5RXVISlk2Tk1tbXBVUmZPRnhmUlBJNStL?=
 =?utf-8?B?QjdIbVUzdE1MZi93NWNzditRQUxzaFRzK2JRWHhOTTQ0Rk8vQ2wvV3V3d3ZW?=
 =?utf-8?B?eHZuWXRhSHY5cVhQT0ZQQW90N3Q0MUliTUpJWnZaWGxmc1ZTTS8yVmo2N2NB?=
 =?utf-8?B?R0JwWXF5V3lHMkVWc0RNRFNTY01FNGJTZTB6WmVvZUdWdUF1TVlBUWNoL1VF?=
 =?utf-8?B?dW1hWlphY1VLRzRTd3JHKzh4WUtRcEN1OUZ6QThtcTRlK09mS29qSnFpWTVJ?=
 =?utf-8?B?QjJhU0JQSzlZQXloL0QyWTc3RTdrMFVhNVVidldqTnErQXV6V25wWC9Hd1Iy?=
 =?utf-8?B?cGxkaUJvdkZIQk9mYzkwUU5xTWNPcWNJcFp0UDhmWGRxWlViN1RkdEFhQVJw?=
 =?utf-8?B?cVUzcFVqaG16QUVTWmhWYzZza0NFbnlMeFVTcStXQzhGZnl6WGtkL1E4Y2VG?=
 =?utf-8?B?V1pPWDVKUDdGYWFUa1Z1UkY3L2tSeGo4VnZKYnZ3a2JzdUdWRHV5QWFPOUY0?=
 =?utf-8?B?SU55OS9rSFkxZzFCdlRaTkFaYVkrTElwbDBGSWZ3QUNIVXY1b2JrZHYvRHNj?=
 =?utf-8?B?OTJ5eTA4TXEzZ080ODFmTnRXQUYrZVRMaUpDSEFueEo1Q1Zkc3RhKzhlT3N6?=
 =?utf-8?B?cWhVU0pXaS9ncEc3b1gwQndodFN0ckQzbExtOFA3eWViOVhwcHRHdGdENE5C?=
 =?utf-8?B?Y0swc0REWWdiUVZmWFY1S1dRRHpJMEpFZDdKNWhud1ExZFN0eDcxbG1zSjA3?=
 =?utf-8?B?eFpsUEwvQ1ovcGl2a0hyZnZJS1k3M0ZBOXNWUTdqa082d2VUNDRsZnBEY0pQ?=
 =?utf-8?B?dVdybnZJOWVwOCtiR3NiTEoxd0loZ2ZuWEd2MnUxWFpzbmNCWFdJVWhZMCtV?=
 =?utf-8?B?S0Frb0xYV3Eyc0pGYUROZENwSncvUWI3REJoSGpFcExKZFhSK2o3ZXJRU2tG?=
 =?utf-8?B?ZlN2ZDJ3R0VpVGtWNnJKeXRvaFh4MTMySUVMc1lPVVBhb3B0NVJUOHdWMTRh?=
 =?utf-8?B?TDk3NGtyS3Y1SkF5NXV1bTNGbEZjUis4K01iWE9ubWFVT2lPUlgxc05LVUhi?=
 =?utf-8?B?UEtXTmZaQlEyL0ZBSGpCcWhUZzJKZU5WaGl0TGhqK3Vnc3ZQMzQyWUZyVXBJ?=
 =?utf-8?B?MHZpVEdoV3BRQkZITHRmZWV3eTd1eEp5WlZadkludGlZS0hqd3FwYmpuMTRK?=
 =?utf-8?B?YWJxL3NOZ3dTRkQ0ZjBWVjZRdDFmMkI2dmxDSElDaHVzSUFkTGhFNDJYS0kv?=
 =?utf-8?B?R01nQlR5Q3gvOU9LUW1xekRMYmN1d2VpOXA4MmF5Qll1cVVqdVN2SCszemJl?=
 =?utf-8?B?YmhxTENzd3ZxLzFpWnNndUNUamNEeWdnNDdHc0VWSzk2cVBGZ2doUUZXZ0FT?=
 =?utf-8?B?RHBkbkZnMDMza2JmaEN6VFJtOVlHdVM1OVM1WFQ0eGd1UDE0eXJIWXBVSUs5?=
 =?utf-8?B?R1E2cHJNVU9oYkxBNk5taVpIYVh2RnJ1dFBqanFveGRiNXlqUEowL1E5ZVV6?=
 =?utf-8?B?N1QvdUpTN3JOL0Q2TXh6R2Rocm55R1JDeGVQQkhSTE5wOUp3eXJlSE9VT0h4?=
 =?utf-8?B?YnpxcUxFbkZkSWlTNFdjNi9qVUFaWlhLQTZXclFMTkVKbmxhU3p6OERQM2dP?=
 =?utf-8?B?UmRRa21IZFZRVXc5RWlpNmVZNmZuaml6ekg2U3NrazlBZ0E0WUphNFVJblR1?=
 =?utf-8?Q?6N60ZjCbhMzgZAHd8JROuxzba?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BA521057872AD4B8F275639FF0E906E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33eb35da-4805-409a-2135-08ddedf31bbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2025 09:44:15.4358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mKjrgTYgBt6DzFrnYVpQYn5P4jgHke8zVTz5qDmrTIYuTrawoBvEix3XQuWHI987ZCepuKx4o5MnJFUar6JSwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB9402

RGVhciBOaWNvbGFzLA0KDQoNCk9uIFR1ZSwgMjAyNS0wOS0wMiBhdCAwODo1NyAtMDQwMCwgTmlj
b2xhcyBEdWZyZXNuZSB3cm90ZToNCj4gTGUgbHVuZGkgMDEgc2VwdGVtYnJlIDIwMjUgw6AgMDI6
MzcgKzAwMDAsIElydWkgV2FuZyAo546L55GeKSBhIMOpY3JpdCA6DQo+ID4gRGVhciBOaWNvbGFz
LA0KPiA+IA0KPiA+IFRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4NCj4gPiANCj4gPiBPbiBGcmks
IDIwMjUtMDgtMjkgYXQgMTU6MTAgLTA0MDAsIE5pY29sYXMgRHVmcmVzbmUgd3JvdGU6DQo+ID4g
PiBMZSBtZXJjcmVkaSAxNiBqdWlsbGV0IDIwMjUgw6AgMTU6MTQgKzA4MDAsIElydWkgV2FuZyBh
IMOpY3JpdCA6DQo+ID4gPiA+IFVOSU5JVCBjaGVja2VyIGZpbmRzIHNvbWUgaW5zdGFuY2VzIG9m
IHZhcmlhYmxlcyB0aGF0IGFyZSB1c2VkDQo+ID4gPiA+IHdpdGhvdXQgYmVpbmcgaW5pdGlhbGl6
ZWQsIGZvciBleGFtcGxlIHVzaW5nIHRoZSB1bmluaXRpYWxpemVkDQo+ID4gPiA+IHZhbHVlIGVu
Y19yZXN1bHQuaXNfa2V5X2ZybSBjYW4gcmVzdWx0IGluIHVucHJlZGljdGFibGUNCj4gPiA+ID4g
YmVoYXZpb3IsDQo+ID4gPiA+IHNvIGluaXRpYWxpemUgdGhlc2UgdmFyaWFibGVzIGFmdGVyIGRl
Y2xhcmluZy4NCj4gPiA+ID4gDQo+ID4gPiA+IEZpeGVzOiA0ZTg1NWE2ZWZhNTQgKCJbbWVkaWFd
IHZjb2RlYzogbWVkaWF0ZWs6IEFkZCBNZWRpYXRlaw0KPiA+ID4gPiBWNEwyDQo+ID4gPiA+IFZp
ZGVvDQo+ID4gPiA+IEVuY29kZXIgRHJpdmVyIikNCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IElydWkgV2FuZyA8aXJ1aS53YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gLS0tDQo+
ID4gPiA+IHYyOg0KPiA+ID4gPiAgLSBBZGQgRml4ZXMgdGFnLCB1cGRhdGUgY29tbWl0IG1lc3Nh
Z2UNCj4gPiA+ID4gIC0gUmVtb3ZlIHVubmVjZXNzYXJ5IG1lbXNldA0KPiA+ID4gPiAgLSBNb3Zl
IG1lbXNldCB0byBiZWZvcmUgdGhlIGZpcnN0IHVzYWdlDQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAg
Li4uL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9lbmNvZGVyL210a192Y29kZWNfZW5j
LmMgIA0KPiA+ID4gPiB8IDQNCj4gPiA+ID4gKysrLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAt
LWdpdA0KPiA+ID4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2Vu
Y29kZXIvbXRrX3Zjb2RlY19lbmMNCj4gPiA+ID4gLmMNCj4gPiA+ID4gYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9lbmNvZGVyL210a192Y29kZWNfZW5jDQo+ID4gPiA+
IC5jDQo+ID4gPiA+IGluZGV4IGEwMWRjMjVhNzY5OS4uMzA2NWYzZTY2MzM2IDEwMDY0NA0KPiA+
ID4gPiAtLS0NCj4gPiA+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2Rl
Yy9lbmNvZGVyL210a192Y29kZWNfZW5jDQo+ID4gPiA+IC5jDQo+ID4gPiA+ICsrKw0KPiA+ID4g
PiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2VuY29kZXIvbXRrX3Zj
b2RlY19lbmMNCj4gPiA+ID4gLmMNCj4gPiA+ID4gQEAgLTg2NSw3ICs4NjUsNyBAQCBzdGF0aWMg
dm9pZCB2YjJvcHNfdmVuY19idWZfcXVldWUoc3RydWN0DQo+ID4gPiA+IHZiMl9idWZmZXIgKnZi
KQ0KPiA+ID4gPiAgc3RhdGljIGludCB2YjJvcHNfdmVuY19zdGFydF9zdHJlYW1pbmcoc3RydWN0
IHZiMl9xdWV1ZSAqcSwNCj4gPiA+ID4gdW5zaWduZWQgaW50DQo+ID4gPiA+IGNvdW50KQ0KPiA+
ID4gPiAgew0KPiA+ID4gPiAgCXN0cnVjdCBtdGtfdmNvZGVjX2VuY19jdHggKmN0eCA9IHZiMl9n
ZXRfZHJ2X3ByaXYocSk7DQo+ID4gPiA+IC0Jc3RydWN0IHZlbmNfZW5jX3BhcmFtIHBhcmFtOw0K
PiA+ID4gPiArCXN0cnVjdCB2ZW5jX2VuY19wYXJhbSBwYXJhbSA9IHsgMCB9Ow0KPiA+ID4gPiAg
CWludCByZXQ7DQo+ID4gPiA+ICAJaW50IGk7DQo+ID4gPiA+ICANCj4gPiA+ID4gQEAgLTEwMzYs
NiArMTAzNiw3IEBAIHN0YXRpYyBpbnQgbXRrX3ZlbmNfZW5jb2RlX2hlYWRlcih2b2lkDQo+ID4g
PiA+ICpwcml2KQ0KPiA+ID4gPiAgCQkJICBjdHgtPmlkLCBkc3RfYnVmLT52YjJfYnVmLmluZGV4
LA0KPiA+ID4gPiBic19idWYudmEsDQo+ID4gPiA+ICAJCQkgICh1NjQpYnNfYnVmLmRtYV9hZGRy
LCBic19idWYuc2l6ZSk7DQo+ID4gPiA+ICANCj4gPiA+ID4gKwltZW1zZXQoJmVuY19yZXN1bHQs
IDAsIHNpemVvZihlbmNfcmVzdWx0KSk7DQo+ID4gPiANCj4gPiA+IFBsZWFzZSwgYXBwbHkgcmV2
aWV3IGNvbW1lbnQgdG8gYWxsIG9jY3VycmVuY2UsIHNvIHNhbWUgaGVyZS4NCj4gPiA+IA0KPiA+
ID4gPiAgCXJldCA9IHZlbmNfaWZfZW5jb2RlKGN0eCwNCj4gPiA+ID4gIAkJCVZFTkNfU1RBUlRf
T1BUX0VOQ09ERV9TRVFVRU5DRV9IRUFERVIsDQo+ID4gPiA+ICAJCQlOVUxMLCAmYnNfYnVmLCAm
ZW5jX3Jlc3VsdCk7DQo+ID4gPiA+IEBAIC0xMTg1LDYgKzExODYsNyBAQCBzdGF0aWMgdm9pZCBt
dGtfdmVuY193b3JrZXIoc3RydWN0DQo+ID4gPiA+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+ID4g
PiAgCQkJICAodTY0KWZybV9idWYuZmJfYWRkclsxXS5kbWFfYWRkciwNCj4gPiA+ID4gZnJtX2J1
Zi5mYl9hZGRyWzFdLnNpemUsDQo+ID4gPiA+ICAJCQkgICh1NjQpZnJtX2J1Zi5mYl9hZGRyWzJd
LmRtYV9hZGRyLA0KPiA+ID4gPiBmcm1fYnVmLmZiX2FkZHJbMl0uc2l6ZSk7DQo+ID4gPiA+ICAN
Cj4gPiA+ID4gKwltZW1zZXQoJmVuY19yZXN1bHQsIDAsIHNpemVvZihlbmNfcmVzdWx0KSk7DQo+
ID4gPiANCj4gPiA+IFNhbWUgaGVyZS4NCj4gPiA+IA0KPiA+ID4gPiAgCXJldCA9IHZlbmNfaWZf
ZW5jb2RlKGN0eCwgVkVOQ19TVEFSVF9PUFRfRU5DT0RFX0ZSQU1FLA0KPiA+ID4gPiAgCQkJICAg
ICAmZnJtX2J1ZiwgJmJzX2J1ZiwgJmVuY19yZXN1bHQpOw0KPiA+ID4gPiAgDQo+ID4gPiA+IA0K
PiA+ID4gDQo+ID4gPiANCj4gPiA+IFdvdWxkIGJlIG5pY2UgdG8gY29vcmRpbmF0ZSB3aXRoIFFp
YW5mZW5nIFJvbmcgPA0KPiA+ID4gcm9uZ3FpYW5mZW5nQHZpdm8uY29tDQo+ID4gPiA+IFswXSwg
aGUNCj4gPiA+IA0KPiA+ID4gcG9ydGVkIHRoZSBlbnRpcmUgZHJpdmVyIHRvIHRoaXMgaW5pdGlh
bGl6YXRpb24gbWV0aG9kLCB3aGljaCBpcw0KPiA+ID4gY2xlYXJseSB0aGUgd2F5DQo+ID4gPiB0
byBnby4NCj4gPiA+IA0KPiA+ID4gLSBQYXRjaCAxIHdpbGwgcG9ydCB0aGUgZHJpdmVyIHRvIHt9
IHN0YWNrIGluaXQNCj4gPiA+IC0gUGF0Y2ggMiB3aWxsIGFkZCBtaXNzaW5nIGluaXRpYWxpemVz
DQo+ID4gPiANCj4gPiA+IENvbnNpc3RlbmN5IGlzIGtleSBmb3IgdGhpcyB0eXBlIG9mIHRoaW5n
cyBzaW5jZSBkZXZlbG9wZXINCj4gPiA+IHVzdWFsbHkNCj4gPiA+IGZvbGxvdyB0aGUNCj4gPiA+
IHN1cnJvdW5kaW5nIHN0eWxlLg0KPiA+IA0KPiA+IEkgaGF2ZSBsZWFybmVkIFFpYW5mZW5nJ3Mg
cGF0Y2ggYW5kIGNvbW1lbnRzLiBJIHVuZGVyc3RhbmQgd2hhdCB5b3UNCj4gPiBtZWFuIGlzIGNo
YW5nZSBteSBwYXRjaCBjb2Rpbmcgc3R5bGUgdG8gUWlhbmZlbmcncywgbW9kaWZ5ICdtZW1zZXQn
DQo+ID4gdG8NCj4gPiAne30nIGZvciBpbml0aWFsaXphdGlvbiwgYW5kIGFtZW5kIFFpYW5mZW5n
J3MgcGF0Y2ggYXMgcGF0Y2gtMiwNCj4gPiB0aGVuDQo+ID4gc2VuZCB0aGlzIHR3byBwYXRjaGVz
IHRvZ2V0aGVyLg0KPiANCj4gQ29ycmVjdCwgYW5kIEkgZG9uJ3QgbWluZCB3aG8gZG8gdGhhdCB3
b3JrLCBJJ2QgbGlrZSB0byBzZWUgdGhlIGNvZGUNCj4ga2VwdA0KPiBjb25zaXN0YW50LiBBbmQg
SSBkbyBhZ3JlZSBtZW1zZXQoKSBhcmUgZXJyb3IgcHJvbmUuDQoNCnBhdGNoIHYzIGhhcyBzZW50
LCBwbGVhc2Uga2luZGx5IGhlbHAgdG8gcmV2aWV3IHdoZW4geW91IGhhdmUgdGltZSwNCnRoYW5r
IHlvdSB2ZXJ5IG11Y2guDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Byb2plY3Qv
bGludXgtbWVkaWEvbGlzdC8/c2VyaWVzPTE4MTE4DQoNCj4gDQo+IGNoZWVycywNCj4gTmljb2xh
cw0KPiANCj4gPiANCj4gPiBJZiBJIG1pc3VuZGVyc3Rvb2QgeW91ciBvcGluaW9uLCBwbGVhc2Ug
Y29ycmVjdCBtZSwgdGhhbmsgeW91IHZlcnkNCj4gPiBtdWNoLg0KPiA+IA0KPiA+IEJlc3QgUmVn
YXJkcw0KPiA+ID4gDQo+ID4gPiByZWdhcmRzDQo+ID4gPiBOaWNvbGFzDQo+ID4gPiANCj4gPiA+
IFswXSANCj4gPiA+IA0KaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcHJvamVjdC9saW51
eC1tZWRpYS9wYXRjaC8yMDI1MDgwMzEzNTUxNC4xMTg4OTItMS1yb25ncWlhbmZlbmdAdml2by5j
b20vDQo=

