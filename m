Return-Path: <linux-media+bounces-24157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D939FE4C7
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 10:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 405D018828E0
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 09:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DFC1A2544;
	Mon, 30 Dec 2024 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="P6eiuY6+";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="dZic22i/"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A3E13A88A;
	Mon, 30 Dec 2024 09:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735550634; cv=fail; b=jEBpJOEyKLtR5sDx24JaE69WpxBA7ROPl39gBopDHXmdpt4/6vzO3oyJuzYBtn59t5ScCNib3M+GO6ImiXdrds4c/ib2Ps3jVuNBy3KroPCJQBpQrFt+kmkdcjaXNmTNXGLG7jdCDPXwLVk8Z5hPMMvgVajih3y9v2cqA5ibpNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735550634; c=relaxed/simple;
	bh=ZbvHtDQuD3lmo7bWAXlJd+Qov71D9cVdKM2QxAsJ2FQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ry4p/a70BVU0OwkHMOZ3XYIKFfBbDC4VzamVJThXj7n5UnOv/+7g2uS5zFIFf4fQXqXdLFGSFqOlvahmyKxBu8+LqvYRLFnqhzN1Gw8LoIhZqJQxfSBdkKSai5IMR203Fqk6qF5p9PtpN3JvAOdUFmOOKIWMwPmL9E3KZtqocmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=P6eiuY6+; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=dZic22i/; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c376a132c68f11efbd192953cf12861f-20241230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ZbvHtDQuD3lmo7bWAXlJd+Qov71D9cVdKM2QxAsJ2FQ=;
	b=P6eiuY6+TWF5QHkUAOKD1tYwDQm2qqkzi+2ww7JBNySGpgYaXd8nzLZmPkRBLCmUupbyJ4jfVrKV849rI/xSf6wYuhKq7fq/MpehgOaTrzddEeqlpLtZM2fazRaBAR6Fih42/7r0qQotUWGicHdba5hfHBX6wYM2gtt/wZAozyw=;
X-CID-CACHE: Type:Local,Time:202412301723+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:761995df-05f1-4ecf-8582-40ab17b24f4f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:4c421319-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: c376a132c68f11efbd192953cf12861f-20241230
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1066068338; Mon, 30 Dec 2024 17:23:43 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Dec 2024 17:23:42 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Dec 2024 17:23:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5yNO3H19GQgQgRouhBwC+oipZT8zW1AygrVmPcoiVjq0F8fUuyBRbKCcup8M5i2FUz+zFxPW4wu/4//MBB0MLwTG+kO5nA9ag7zemH8tw3A8Q62CAzAz7etidKk/PKrP4ScIHrg8y/Fn1W7n5asV8V4TmYm6pX9MhF/BCFfCjIJuXxgifvKRnP7midlYo+jG/c0MIi2EsaC6Fr8ikBZeghBIOKc4K+SQuyEdX2eannxgjaNndDmCpeGwFghu1pABqnjTzVZzGc09FNvmsIb4rVd3BrJkuGfCzPbYIqb7F684HxUhW1KjMP3wrSGEbYjqLYMiG8YbCJ/o+TRxrAPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbvHtDQuD3lmo7bWAXlJd+Qov71D9cVdKM2QxAsJ2FQ=;
 b=PcyDrCo/hA3BiOpnvhbhrYKhTJptOviO96Mt9N5RhR81ue8BmBLz161iScj0HCrfFnx6Bfp/FDKsqvkHJKZZ8qFgW3qWGCsk4kA/H6ryOPfuFYyiUsPB6qvx0804OOf8LD15GCAuokPXIwESBS5hUxPRTrkYJBMXZ710oFOLAsZjdQGS3OoxYcdr2qFwuSXxzyaY1kWjEsP7kQdS/NyfPEGKLATiUWMwoEVOfNwhJJYmZSQ/IMpk7W4fEPfHNaRBaZGY8FKqqBk0UpA5x8HZUDdGBgxwpq8ybKMmGhc5HcDn6cFtPqzLuUgie74Zu8XLvG0IUhazQ56y8cgXxUPKRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbvHtDQuD3lmo7bWAXlJd+Qov71D9cVdKM2QxAsJ2FQ=;
 b=dZic22i/KOtSqymYeF51XmTap9kF9WWCu3TcMCr1S4QvIDkiXhQ0Iae9Gjhz4lV3zxbqCSJiXexJvIY8QsVDcylBHGa5oPLBtlGS7Ku1euPkOLfm+ctzZC8laskS8udzllKh4f1GtW34sG5QBlNum34bEJkwbIKeMNbBPe1j5Ps=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB6625.apcprd03.prod.outlook.com (2603:1096:101:84::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Mon, 30 Dec
 2024 09:23:39 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 09:23:39 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "robh@kernel.org"
	<robh@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"mchehab@kernel.org" <mchehab@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196 support
 for gce-mailbox
Thread-Topic: [PATCH v3 1/7] dt-bindings: mailbox: mediatek: Add MT8196
 support for gce-mailbox
Thread-Index: AQHbUjifwIYL/sR61UKff0WQOKSFC7L5ygoAgATKiAA=
Date: Mon, 30 Dec 2024 09:23:39 +0000
Message-ID: <11f168c11b4cea48cf51406c0afaf8f1f53ad90f.camel@mediatek.com>
References: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
	 <20241219170800.2957-2-jason-jh.lin@mediatek.com>
	 <yg7b2iaz53avd7gpvuewhi6b3myh6owls3dt2hzpqc26lnykjf@tpu2vxqqkipe>
In-Reply-To: <yg7b2iaz53avd7gpvuewhi6b3myh6owls3dt2hzpqc26lnykjf@tpu2vxqqkipe>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB6625:EE_
x-ms-office365-filtering-correlation-id: 1c5d2890-0432-4d02-492c-08dd28b3a531
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cWxHcEtOMXNSNUNpeE5pdGo3SHdGMmhncE5zRjRvSWw3TkpPNndQTGlISTlX?=
 =?utf-8?B?QjdBaEE0bGsvb3F3eFJWbG5wbFJtYlhZQ0hHdVJha3gweGFUekk3Mm5ka0Zp?=
 =?utf-8?B?SDdmNjBBMVZrb05QU3dCSGJ0UWM0cThGUjNnbUR3eGtETzJuZm9PZEJVdldj?=
 =?utf-8?B?UGhPaG5UNDZ5dHZYaHhIYVJZalptV3FTMWJneG9CbUZqTThmN2NZK0hTTW80?=
 =?utf-8?B?OElKT1pyMkZsM29yUVlTTE43bGJqcGxaZEVDUG5MTHp0NWRXZ0ZIUVBGTmw5?=
 =?utf-8?B?bHVoMGpmRDVqZ1VXMmRQdVdkVzVvRlAzeEZxWGM0OVljUU85b0d5MVFRenhY?=
 =?utf-8?B?MVRvcS9ONGZHRWprVjAvamxacDRVQWVUU3hodVFHbHl4YVRlZWZjSDMrWHU2?=
 =?utf-8?B?K3NBdjZpRnNBZFBqMWhWZDhxdU9ERlpnbnpIbmNGNjFSZ2V0MWpqRlRKNWxE?=
 =?utf-8?B?bk5JNDM5ZU1mQWhIOGRHeW0rS0w4VkIvNmwrMndXclBzRlMxZkoxdGsrOVE5?=
 =?utf-8?B?bjI2REdBR24zN1h6dzgyQ0laRFZBd2dQRUJPamVtTlZlRFlSRWh2WXlZajhW?=
 =?utf-8?B?SUxuU043V1RtQ2UvdVNUeVYxVmhYaHZOUnhiU2dJSFlTSFpUYkZrc0ZLZEsr?=
 =?utf-8?B?SDVPM0pDdVBJa29KUDRvbmFSRGlDYnJzdnUvdjRGU3hJaTBmK1M5Wkl6S29o?=
 =?utf-8?B?VDkvb3JLYVlManhqQmhPUXBqWDhhdmJEWXQrUERpQVNiYk9QNG9YSFovQ2tG?=
 =?utf-8?B?YjBHcTl2QzdyRVEvL0Q0eEVrVThBb1YxblZXTjhpOE1rRnVOUmxOaWVRbnU0?=
 =?utf-8?B?aXg0V3Q3Nk1YOTREQ3BSbEZ2eFRQck5OMHpYeXZPcjZhQTI1M2d0RW1MRDY3?=
 =?utf-8?B?a2E3NEZHemJnTXhGTm12bFZzVENKOUdwKzZ1ODRJd1pyWHZjODAzNXhETkJs?=
 =?utf-8?B?VVNEaWZJeG9obE1ITEhKYlJWQVAyM1VlTWVNdm1jeFBMVGd0bU5MZ0dRT3FW?=
 =?utf-8?B?VjF5VzMvWG5scXhDZ2l1c1RlK09iVTZaa3F1SmdNTThSSHJyZnVuMWhiOTFO?=
 =?utf-8?B?OVhBUXlPWGppQWFkMnVCQ00xUWlPWVhZbWxqaVFUZkJUZXNKa2lYbzdMdFYx?=
 =?utf-8?B?YU96WVdnbFBUZ3pJcVFCQWRBL3hIdThrdVR6aXRDQUtSalN4ek51dCtXcmJo?=
 =?utf-8?B?V3VnSDI3UmE0b1dYM2hnakJJZkp2eDJldEEvaGR5cVFETlViL0srVnptUW56?=
 =?utf-8?B?UW1JcnVsS1lieVVUbVRJTXpjL3lnTklIbDV5NmQxT0pDQ1p3TGJUa1B4NTlE?=
 =?utf-8?B?dk1VM1NRejVWQXdZQzV2L0pTWXNyTDJtT05MV3o5TFRjdXpaaTZzNXl1U0d5?=
 =?utf-8?B?NXJUaU83YXExQStJTkhDWFU1bElCQWdqQ0VPdTVjbldsTEVOQnN4a3dvRlFW?=
 =?utf-8?B?ZmpLa0NXQXRBVWxOK1lsWEZJL0hMZTg2NHBTNHY3aHlEODdkbG12TmVWVDBH?=
 =?utf-8?B?VTVKZ2dQdFZDTmFaMGFZVi9OZFdWNDVpcnc2YWlOMEllUEVHaGVNMHQ3TjZp?=
 =?utf-8?B?alByR1FYM3F1dEFYU21JdHdDRWloaVZyQkk0ZmFtSXVUS1RGdzUzSjJ5ZU4z?=
 =?utf-8?B?LzE3SlltV3FoazBXVmpuanpnU056cmtoeGg2Y3VKa3VIZndNeWc1cFRKeGlh?=
 =?utf-8?B?c25ZdGRjTDZEeWd5S04zNjlzUmpnZzF1WW5rTS9pdjJPOVJQTWRRWXFGWm51?=
 =?utf-8?B?SVI5WHBhd2htWm1jU3JNWm9tSGgzVlV2a2Iyb0w3b3Uxd0pIa1BPUXZVbVFL?=
 =?utf-8?B?Zmhwc1VZdzZhR01TUnlNMzJFSVhRTlFxT1NmencxeWdkMmlOdlJGc2xuVmhI?=
 =?utf-8?B?RnRlWWR5UUkxZy8xRDhFYTVyWVc1QitMYU5Kb3NzY01PVnUzZkloakM2akVs?=
 =?utf-8?Q?y8TUnrcdl9GI0rM9GEKrX0hhE5GZvz0M?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWxpWXpiVWxWc2lPU0t6ODhjLzc5b0RmbzdKdXB1cjdZR2lkWDNtcVJ1VEdu?=
 =?utf-8?B?VzVkM1VFRy90dCt4ZC92am55a2h4enA5L3h4b3o5cW9qdHlGOGRJL1Z3ZU95?=
 =?utf-8?B?d1Rvd09vUDkvczQ4ZDN2Q254YkdDWmk1QXJVaEpxWGxFOXZGSFhRN0ZkUjdC?=
 =?utf-8?B?cE03YlgrVlBOR0VTN1kwOFZMYjY2Qmw0VHhZVWpraGJxWDREK0hRZ3VWclNa?=
 =?utf-8?B?VFY3Z1lhemsvZDFxb08xMlBqTzIwNkFSb0hDaU56am5zSE1zRGltRHZCSm83?=
 =?utf-8?B?V3NyTDlxMC9vMzFwajdFdWpBZkQvTW5EbDl1Q01yN1greGN4V1lWY0JIVDV4?=
 =?utf-8?B?V0VzNCtpbFpSaVU0SVlTT2MzOFZabzVFaWRETzlZL2tLYTF1S2pFUVRraDho?=
 =?utf-8?B?SXlwZG10eFVuejFOU2VjWnRtTlMxRVVhdjlvZy9Wckx3bTR1b3AzaWRzd1JX?=
 =?utf-8?B?U28wcHVvS0x6a3p3dksrSGZJS0ZWbzcxRXpEZkJSdERNcEc1RW1aWk1XMTRz?=
 =?utf-8?B?YnBnTGtQd0V1RzRtc2RKV01RYzY0ZHJwU0V5eStpL2QxbjJuRzRndVozMXQ3?=
 =?utf-8?B?UERXNGNCdWhZcmtmWUNBNyt6VGVCZEFteHhlVThXTTFlTEZKZWhUR0U4dTY2?=
 =?utf-8?B?RVZ1Z0ZDQlZrNUZYZklaRmphbFJFUHNUOElqb3BNVjdSYnkyWVIrbjBJdFRa?=
 =?utf-8?B?ekJxQi8xZVNyL0F3RGZXUFhwS3ArU2N1S3ZGcWZEZnFWR0dZTjI5Ly9zNmxv?=
 =?utf-8?B?bU1zUXJESnZIaUx6S0FQejRzWW51cTNaaWloVG8vRkpOL2R0ekhvbitMVzlh?=
 =?utf-8?B?Q3M3RGxiZjFCN0UxMHdDVFBmK2ZaUGZ5ZWJKU0Y2OFpQQTFiKzJsK2R1V094?=
 =?utf-8?B?T3JnWklUVjdpMW8rdUI0V1RUdTFrdjBMNWZWLzIzY05PMVdycUU1T0JsS2dZ?=
 =?utf-8?B?c3I5Rk1FYWdRSkdyZWh2bjh5S3pzaGN3d255aUFoeWkyVFU3YUpmUHFkZXF2?=
 =?utf-8?B?d3ZEdENrNWhTNTlvUXFhMFJkWG50MHBjaXpncUlNbCtLaGVqclBqWmxOTHQx?=
 =?utf-8?B?aUFqTjNsV05vTzhNNEZSdlJhTHlVSXE2dDNiK1FhaG41enpIbElLdkVnR2tJ?=
 =?utf-8?B?MnhUYlNUdUR1R0VPN2YxMHZGVFJWUlNqYjl0bDljek1mK2RVcThUdjFENkds?=
 =?utf-8?B?Uk5VUDRsSlVqbTAzUy9ORXpDeW1qQmNNUUFuNnd1MUF6L1ZNTnI5ekdYTzRN?=
 =?utf-8?B?aXRQY0RPcjkyZmVQZjdkdnhza1RTT09NaEkyWmlzbENYTERkNVRxRzNmenVN?=
 =?utf-8?B?Mm1YK08wejhmMXR0cDhWQ0dsalVJWDg0UmVESEkwWnBtYU5mOFRvYllFaE1M?=
 =?utf-8?B?c0c4UUhLUU93WWJ6VlhFMzFxNU1hZ0R0elNXYnZsUjQ1MUY4cUFEM1hDMWJz?=
 =?utf-8?B?N2lPODN2bGwwKzJmQzJTaUR1c0NtSGtGUzloUjFSUzI1bVA4NVZhS2FncTBr?=
 =?utf-8?B?bFJxSkFxSUtBbzZxNVdobnpoRFNUbG1VVWRNYzB5VnhZMGFHSlIrWCs3cUdZ?=
 =?utf-8?B?TkpNTVJFS05QN3ZWekYwUnB0dVVoalBBVU1KWHk0WC9WUVd4UGhvRXdvaHBs?=
 =?utf-8?B?ZVFaZUxidXNGU1RWYzJwQmJrWmZQTjR4cU1xancxazM0cEV0VGRqVk1YTGRO?=
 =?utf-8?B?RWpDTnRPMS9xUW15T3dkYldrTlJNdDYxM3RxenFyN3ZFNU1XbnZEUENRdmps?=
 =?utf-8?B?akNqR0J6SjFuMFBLN082NFlkY21abFpnaTlWLythOGUzeStQL0dIaHV3YVZz?=
 =?utf-8?B?dWhHa25jZlN6V0dDQ1RKSG9RaFZuWE9BMmZXYXh4aGs5ZzhKZEVxd3VTWTJW?=
 =?utf-8?B?TkNLUU9SYTRCb0pCZ2sxZ2xKL0N1c01jWlhXNjl0bDY3bjNwSFFqbTZoSzhU?=
 =?utf-8?B?SXJqS3dQbXNjaW1QUE16YkVyR3kzVFRweHpUcnVxSDh6bUtaU1ZETkxEanJ5?=
 =?utf-8?B?R0puZGx2bUlsYzVEY2VhdlBBUnc0T3ZtRjZJSkJaSG1YSGx3TlJMeklpK1pv?=
 =?utf-8?B?RWo5cmJkTVBabVNYQVYvNm1pQWEyUzlIeXR3ZGlTSHAzR0RlL1VMUU5LYjk1?=
 =?utf-8?B?Qk1jOXNGaExDYzJaemhsaEVCNWlDMkY0WUJ2RG01Z3RQSitVWXA2ZktvR0FD?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D1BAD0ACF883847ABB1F0A64A2CAE5A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5d2890-0432-4d02-492c-08dd28b3a531
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 09:23:39.1688
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M6BHghIjIj9MyhHyFO+wVRmel0eF2+V0HdBbQ6V+oLT0Ss77nvR24AU15hvDWUbUARw1VgdsW9Yd51YLHHFb7HgqyuRHjzvP+zMxI1xGlE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6625

SGkgS3J6eXN6dG9mLA0KDQpPbiBGcmksIDIwMjQtMTItMjcgYXQgMDk6MTMgKzAxMDAsIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBu
b3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJp
ZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgRGVjIDIw
LCAyMDI0IGF0IDAxOjA3OjU0QU0gKzA4MDAsIEphc29uLUpILkxpbiB3cm90ZToNCj4gPiDCoMKg
IDIpIEdDRSBTdWJzeXMgSUQ6DQo+ID4gwqDCoCAtIERlZmluZWQgaW4gdGhlIGhlYWRlciBmaWxl
OiBgI2RlZmluZSBTVUJTWVNfMWMwMFhYWFggM2ANCj4gPiDCoMKgIC0gVXNlZCBpbiB0aGUgRGV2
aWNlIFRyZWU6DQo+ID4gwqDCoMKgwqDCoCBgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcgPSA8Jmdj
ZSBTVUJTWVNfMWMwMFhYWFggMHgwMDAwDQo+ID4gMHgxMDAwPjtgDQo+ID4gwqDCoCAtIFBhcnNl
ZCBhbmQgdXNlZCBpbiB0aGUgZHJpdmVyIHRvIGNvbmZpZ3VyZSBzdWJzeXMgSUQ6DQo+ID4gwqDC
oMKgwqAgYGBgYw0KPiA+IMKgwqDCoMKgIGludCBjbWRxX2Rldl9nZXRfY2xpZW50X3JlZyhzdHJ1
Y3QgZGV2aWNlICpkZXYsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBjbWRxX2NsaWVudF9yZWcgKmNsaWVudF9y
ZWcsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGludCBpZHgpDQo+ID4gwqDCoMKgwqAgew0KPiA+IMKgwqDCoMKgwqAgY2xp
ZW50X3JlZy0+c3Vic3lzID0gKHU4KXNwZWMuYXJnc1swXTsNCj4gPiDCoMKgwqDCoMKgIGNsaWVu
dF9yZWctPm9mZnNldCA9ICh1MTYpc3BlYy5hcmdzWzFdOw0KPiA+IMKgwqDCoMKgIH0NCj4gPiDC
oMKgwqDCoCAvLyBHQ0Ugd3JpdGUgdGhlIHZhbHVlIHRvIHRoZSByZWdpc3RlciAweDFjMDAwMDAw
ICsgMHgwMDAwICsNCj4gPiBvZmZzZXQNCj4gPiDCoMKgwqDCoCBjbWRxX3BrdF93cml0ZShjbWRx
X2hhbmRsZSwgY2xpZW50X3JlZy0+c3Vic3lzLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY2xpZW50X3JlZy0+b2Zmc2V0ICsgb2Zmc2V0LCB2YWx1ZSk7DQo+IA0KPiBU
aGlzIGlzIGEgcHJvb2YgdGhhdCBTVUJTWVNfMTMwMFhYWFggaXMgbm90IGEgYmluZGluZy4gWW91
ciBkcml2ZXINCj4gZG9lcw0KPiBub3QgdXNlIGl0Lg0KPiANCj4gRHJvcCBhbGwgc3VjaCB0aGlu
Z3Mgd2hpY2ggYXJlIG5vdCB1c2VkIGJ5IGRyaXZlcnMgb3IgZXhwbGFpbiB3aHkNCj4gdGhleQ0K
PiBhcmUgbmVlZGVkIHRvIGJlIGluIHRoZSBiaW5kaW5nIC0gd2hhdCBkbyB0aGV5IGJpbmQuDQo+
IA0KPiBJIGFza2VkIGZvciB0aGlzIGFscmVhZHksIGZvciBleGFjdGx5IHRoZSBzYW1lIHRoaW5n
Lg0KPiANCj4gDQo+IEkgZGlkIG5vdCBjaGVjayB0aGUgcmVzdCwgc28gbmV4dCB0aW1lIEkgd2ls
bCBjaG9vc2UgYW55IG90aGVyIHJhbmRvbQ0KPiBkZWZpbmUgYW5kIGlmIEkgZG8gbm90IGZpbmQg
aXQgZXhwbGFpbmVkIG5vciB1c2VkLCBJIHdpbGwgcXVlc3Rpb24NCj4gaXQuDQo+IEJlY2F1c2Ug
eW91IHRlbmQgdG8gYXBwbHkgcGllY2VzIG9mIHJldmlldyBpbnN0ZWFkIG9mIHJlYWxseSBjaGFu
Z2UNCj4geW91cg0KPiBjb2RlLg0KDQpQbGVhc2UgZm9yZ2l2ZSBtZSBmb3IgcHV0dGluZyBhIGxv
dCBvZiByZWR1bmRhbnQgbWVzc2FnZS4gSSBqdXN0IHdhbnQNCnRvIHByb3ZpZGUgYXMgbXVjaCBk
ZXRhaWwgYXMgcG9zc2libGUgdG8gaGVscCB5b3UgZGV0ZXJtaW5lIGlmIHRoZXkgYXJlDQpiaW5k
aW5ncy4gSSBhcHByZWNpYXRlIHlvdXIgZ3VpZGFuY2UgYW5kIHdpbGwgbWFrZSB0aGUgbmVjZXNz
YXJ5DQphZGp1c3RtZW50cy4NCg0KDQpJIGNoZWNrZWQgdGhlIGNsayBoZWFkZXIgeW91IGFjY2Vw
dGVkIGJlZm9yZToNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC80MDJhYzVhMi0zMzRlLTE4
NDMtMDUxNy01ZWNmNjFmNmE5NjVAbGluYXJvLm9yZy8NCg0KUGxlYXNlIGRvbid0IG1pbmQgbWUg
dG8gbWFrZSBhIGNvbmZpcm1hdGlvbiBoZXJlIGJlY2F1c2UgSSBjYW4ndCBmaW5kDQp0aGUgZG9j
dW1lbnRhdGlvbiBvZiB0aGUgZGVmaW5pdGlvbiBmb3IgYmluZGluZyBoZWFkZXIuDQpEbyB5b3Ug
bWVhbiBhbGwgdGhlIGhlYWRlciBkZWZpbmVkIGluIGluY2x1ZGUvZHQtYmluZGluZ3MvKiBzaG91
bGQgYmUNCnVzZWQgaW4gYSBzcGVjaWZpYyBkcml2ZXIgYW5kIHRoZSBEVFMgaW4gdGhlIHNhbWUg
dGltZT8NCg0KVGFrZSB0aGUgYCNkZWZpbmUgQ0xLX1RPUF9BWElgIGFuZCBgI2RlZmluZSBDTEtf
VE9QX1ZQUGAgaW4NCm1lZGlhdGVrLG10ODE4OC1jbGsuaCBmb3IgZXhhbXBsZToNCg0KYENMS19U
T1BfQVhJYCBpcyB1c2VkIGluIHRoZSBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTg4LXRv
cGNrZ2VuLmMNCmJ1dCBub3QgaW4gYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODgu
ZHRzaToNCmBgYA0KICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbWVkaWF0ZWssbXQ4MTg4
LWNsay5oPg0KDQogIC4uLg0KDQogIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX211eCB0b3BfbXRr
X211eGVzW10gPSB7DQoJTVVYX0dBVEVfQ0xSX1NFVF9VUERfRkxBR1MoQ0xLX1RPUF9BWEksICJ0
b3BfYXhpIiwNCmF4aV9wYXJlbnRzLA0KCQkJCSAgIDB4MDIwLCAweDAyNCwgMHgwMjgsIDAsIDQs
IDcsIDB4MDQsDQogIC4uLg0KCQ0KCU1VWF9HQVRFX0NMUl9TRVRfVVBEKENMS19UT1BfVlBQLCAi
dG9wX3ZwcCIsDQoJCQkgICAgIHZwcF9wYXJlbnRzLCAweDAyQywgMHgwMzAsIDB4MDM0LCAwLCA0
LA0KNywgDQogIC4uLg0KYGBgDQoNCmFuZCBgQ0xLX1RPUF9WUFBgIGlzIHVzZWQgaW4gdGhlIGJv
dGggY2xrLW10ODE4OC10b3Bja2dlbi5jIGFuZA0KbXQ4MTg4LmR0c2k6DQpgYGANCiAgcG93ZXIt
ZG9tYWluQE1UODE4OF9QT1dFUl9ET01BSU5fVlBQU1lTMCB7DQogIAlyZWcgPSA8TVQ4MTg4X1BP
V0VSX0RPTUFJTl9WUFBTWVMwPjsNCgljbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19UT1BfVlBQPiwN
CgkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9DQU0+LA0KLi4uDQpgYGANCg0KQnV0IGl0IHNlZW1zIHRo
YXQgYm90aCBvZiBgQ0xLX1RPUF9BWElgIGFuZCBgQ0xLX1RPUF9WUFBgIGFyZSByZWdhcmRlZA0K
YXMgYmluZGluZyBoZWFkZXJzLg0KDQoNCkZyb20gdGhlIHByZXZpb3VzIGRlc2NyaXB0aW9uIG9m
IHRoZSBleGFtcGxlIHlvdSBnYXZlIG1lOg0KQmluZGluZ3MgYXJlIGltYWdpbmFyeSBudW1iZXJz
IHN0YXJ0aW5nIGZyb20gMCBvciAxIHdoaWNoIGFyZSB1c2VkDQpiZXR3ZWVuIGRyaXZlcnMgYW5k
IERUUywgc2VydmluZyBhcyBhYnN0cmFjdGlvbiBsYXllciAob3IgYWJzdHJhY3Rpb24NCnZhbHVl
cykgYmV0d2VlbiB0aGVzZSB0d28uDQoNCkFzIEkgdW5kZXJzdGFuZCwgZWFjaCBjbG9jayBkZWZp
bml0aW9uIGNvcnJlc3BvbmRzIHRvIHRoZSBjbG9jayBDRw0Kc2V0dGluZ3MgcHJvdmlkZWQgdG8g
ZGlmZmVyZW50IGhhcmR3YXJlLCBhbmQgZWFjaCBoYXJkd2FyZSBkcml2ZXIgY2FuDQpjb250cm9s
IGl0cyBvd24gY2xvY2sgQ0cgdGhyb3VnaCB0aGUgQ0NGIHRvIGNvbnRyb2wgdGhlaXIgQ0cgaW4g
Y2xvY2sNCmRyaXZlci4gU28gdGhleSBjYW4gYmUgYW4gYWJzdHJhY3Rpb24gdmFsdWVzIGJldHdl
ZW4gZHJpdmVyIGFuZCBEVFMuDQoNClNpbWlsYXJseSwgdGhlIEdDRSBzdWJzeXMgSUQgYW5kIEdD
RSBldmVudCBJRCBjb3JyZXNwb25kIHRvIHN5bWJvbHMNCnVzZWQgYnkgR0NFIHRvIGNvbnRyb2wg
dmFyaW91cyBoYXJkd2FyZSwgYW5kIGVhY2ggaGFyZHdhcmUgZHJpdmVyIGNhbg0KdXNlIHRoZXNl
IElEcyB0byBnZW5lcmF0ZSBjb21tYW5kcyBidWZmZXIgZm9yIEdDRSB0aHJvdWdoIHRoZSBBUEkN
CnByb3ZpZGVkIGJ5IHRoZSBHQ0UgZHJpdmVyIGFuZCBhY2hpZXZlIHRoZSBkZXNpcmVkIGNvbnRy
b2wgb3ZlciB0aGVpcg0KaGFyZHdhcmUuDQoNCkkgZ3Vlc3MgdGhlIGRpZmZlcmVuY2UgaXMgdGhh
dCB0aGUgY2xvY2sgZHJpdmVyIGhhcyBhIHBsYXRmb3JtLXNwZWNpZmljDQpjbG9jayB0YWJsZSB0
byBzdG9yZSB0aGVzZSBiaW5kaW5nIGhlYWRlcnMsIHdoaWxlIHRoZSBHQ0UgZHJpdmVyIGRvZXMN
Cm5vdCBoYXZlIGEgcGxhdGZvcm0tc3BlY2lmaWMgdGhyZWFkIHByaW9yaXR5IHRhYmxlLCBzdWJz
eXMgSUQgdGFibGUsDQphbmQgZXZlbnQgSUQgdGFibGUuIEluc3RlYWQsIHRoZSBHQ0UgY2xpZW50
IGRyaXZlcnMgY2FuIGRpcmVjdGx5IG9idGFpbg0KdGhlaXIgcmVzcGVjdGl2ZSBoYXJkd2FyZSBz
ZXR0aW5ncyBmcm9tIHRoZSBEVFMuDQoNCk9uIHRoZSBvdGhlciBoYW5kLCBkZWZpbml0aW9ucyBs
aWtlIENMS19UT1BfTUFJTlBMTF9EMywNCkNMS19UT1BfTUFJTlBMTF9ENCwgZXRjLiwgY29ycmVz
cG9uZCB0byBkaWZmZXJlbnQgY2xvY2sgZnJlcXVlbmN5DQpkaXZpZGVyIGxldmVscywgYW5kIHRo
ZSBDTURRX1RIUl9QUklPX1ggZm9yIEdDRSB0aHJlYWQgcHJpb3JpdHkgYWxzbw0KY29ycmVzcG9u
ZHMgdG8gZGlmZmVyZW50IHByaW9yaXR5IGxldmVscyBmb3IgR0NFIHRocmVhZHMuIFRoZXJlZm9y
ZSwgSQ0KYW0gbm90IHF1aXRlIHN1cmUgd2h5IEdDRSB0aHJlYWQgcHJpb3JpdHkgY2Fubm90IGJl
IGNvbnNpZGVyZWQgYQ0KYmluZGluZyB3aGVuIGl0IGlzIGFsc28gYSBzeW1ib2wgbnVtYmVyIGZv
ciBhIGhhcmR3YXJlIGxldmVsIHNldHRpbmcuDQoNCg0KSWYgdGhlIGNvbmRpdGlvbiBmb3IgYmVj
b21pbmcgYSBiaW5kaW5nIGhlYWRlciBpcyB0aGF0IGl0IGBtdXN0YCBiZQ0KdXNlZCBieSBhIHNw
ZWNpZmljIGRyaXZlciwgc3VjaCBhcyBhIHBsYXRmb3JtLXNwZWNpZmljIHRhYmxlLCB0aGVuIEkN
CndpbGwgcmVtb3ZlIHRoZSBlbnRpcmUgR0NFIGR0LWJpbmRpbmcgaGVhZGVyLiBCZWNhdXNlIHRo
ZSBjdXJyZW50IHVzYWdlDQpvZiB0aGVzZSBkZWZpbml0aW9ucyBpcyB0aGF0IGVhY2ggR0NFIGNs
aWVudCBkcml2ZXJzIGNhbiBkaXJlY3RseSBzdG9yZQ0KdGhlc2UgR0NFIGRlZmluaXRpb25zIHRo
cm91Z2ggdGhlIERUUywganVzdCBsaWtlIElSUSBJRHMsIGFuZCB3aXRob3V0DQp0aGUgbmVlZCBm
b3IgYW4gYWRkaXRpb25hbCB0YWJsZSBkZWZpbmVkIGJ5IHRoZSBHQ0UgZHJpdmVyLg0KDQoNCkkg
YW0gbm90IHVud2lsbGluZyB0byBjaGFuZ2UgdGhlIGNvZGUsIGJ1dCBJIGhvcGUgdG8gZmlyc3Qg
dW5kZXJzdGFuZA0Kd2hhdCBxdWFsaWZpZXMgYXMgYSBiaW5kaW5nIGhlYWRlci4NClRoaXMgd2F5
LCBJIGNhbiBjb25maWRlbnRseSByZW1vdmUgdGhlIE1UODE5NiBHQ0UgYmluZGluZyBoZWFkZXIs
DQphbmQgb3RoZXIgZGV2ZWxvcGVycyB3aWxsIGFsc28ga25vdyB0aGF0IHRoZSBHQ0UgYmluZGlu
ZyBoZWFkZXIgZm9yIHRoZQ0KcHJldmlvdXMgTVRYWFhYIGlzIG5vdCBuZWVkZWQuDQoNCkkgc2lu
Y2VyZWx5IGhvcGUgeW91IGNhbiBndWlkZSBtZSB0byBtZWV0IHlvdXIgZXhwZWN0YXRpb25zIGFu
ZA0Kc3RhbmRhcmRzLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCj4gDQo+ID4gwqDCoMKg
wqAgYGBgDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg==

