Return-Path: <linux-media+bounces-20738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC7C9BAAD1
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 03:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B21882819E1
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 02:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8C016BE0D;
	Mon,  4 Nov 2024 02:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DQiFH/Md";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="LP+elxei"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D74815B130;
	Mon,  4 Nov 2024 02:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730687187; cv=fail; b=thr71XScpTO7tjsdL+0L6jCg71cUCjB9REscOrdfXFWUlFkGD2Xfdh+NOIklW/Vxh2SYoNZzibEGP6DLm1m43STG5694lSzEbeCAzGooMaw9ai+HLfXIjeC4xJf/M+OVJIV9+ySHgZNhEvoB88HdmqeCa9c/SXToYSjcrX4q5aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730687187; c=relaxed/simple;
	bh=/fxDOWW5XXLx3V3gLeDroZL4pJPv2Vc1tCF1BRza/7o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O0xgyvSdySbcj37V8ELhAnwlBoYtsAP1i14mNnFKV0yRH3h3XPPoonaSy5DewhhFyxX8oRzJaCccBeN5y2cteGF9v95x9eRaub032wjTR8z8I8uxSYuJm3Nb89iGWWayLJtNkKvjpQIqj9cZHrHD8Xr6hzTBTEX1BMfmTWgvuUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=DQiFH/Md; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=LP+elxei; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 28e909aa9a5411efb88477ffae1fc7a5-20241104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=/fxDOWW5XXLx3V3gLeDroZL4pJPv2Vc1tCF1BRza/7o=;
	b=DQiFH/MdGdRf8qCIFuTsVbYw8KBOZfdq5GOOIzdn79Qr8SDRuUxOUETWzPc+XN7rbztNa0ZY0yXsNMxzL9gEs1PhcG7VCPRHqqV2W84fRISi+zYQiYRoZn/qax8NiAu3omT0vOY/jXycIolLv0tBz/A8c2ZXvSaP4FsGrsZPYms=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:26257a10-8f94-41b6-beaf-31601c96ecd3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:393a7b07-7990-429c-b1a0-768435f03014,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 28e909aa9a5411efb88477ffae1fc7a5-20241104
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 818916944; Mon, 04 Nov 2024 10:26:12 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 4 Nov 2024 10:26:10 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 4 Nov 2024 10:26:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9g6fPqp0/TGTNTCWpsyzYVrkb/d5EqqswA+c5/9JSpsh9wdcgEQY6ATYEhHzxiQldrz1yTysll9GZex4Kkc/g1N4cnKSzuxBTdX/4Tn4NCyR+IP/8BY7IvkettBZL6+oXQjB9IB9F/3gxnQlGL/ImT+oKDACK+xOg8qUYXKIn4DXqqh4H21Dqlngg8ukgszVH72jKlhEQVX4+h6M05h8ALhIgwTB1GdKzX1qKLRGqu+Blc8HDMs4isra97kbWmKr0d5c8XY5fAQI4O4KrYKag7Us74NYbp0zYgTTSpyGgFUYZnz1U+Ud8lCHe8+coTzIv1yZ6mRpAQzsvK/Ju3vuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fxDOWW5XXLx3V3gLeDroZL4pJPv2Vc1tCF1BRza/7o=;
 b=aakb6Bh2hmOGEO2J7lT7QrOr0PaTrgzE6PZYALISi8CIs47D0m4pBF9DmW9NxzdHh/vTQgQ3uJPkD+6d+0qWioOqo3dEbIVs2Hvvtd3r27ijNZTfQqch7tW8gRQQ0Z8B17HJBg6geeZKGYYorKVT806EM//aNspsLuY6fTDIPengxCUlOx3/DlXKVhVXVsETIhKJLv6YxfXf6aC6qOvn9hCKZ59A2CcviTsEMfdtzCPV2WxVy84eSpTI1HOuw0FXV+60VL3W8xsvOTrwYRxkgNtCQJbVn6e9s97818a6FwxSXvkMXHrd6U9oPRN/tjJ0Pi37oRWrwQ90JVkTw/aBGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fxDOWW5XXLx3V3gLeDroZL4pJPv2Vc1tCF1BRza/7o=;
 b=LP+elxeiu3pRqwOBMDeP2vg8tUkaub7aYiH70Oavax1zLsD3GVEWrY556R3zeRuuqmJ5JD/Z1uSpsI5qXfapT98qAHyQRpYsULxrutff9OLgvWZmSBP3q+QjDF2/dP2vwCsb3N1qyi4zGQcPqBDS1eo7ZCcEnFHYyfzhTnfyE7k=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB6523.apcprd03.prod.outlook.com (2603:1096:101:72::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 02:26:06 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 02:26:06 +0000
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
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbKmjVGA
Date: Mon, 4 Nov 2024 02:26:06 +0000
Message-ID: <2463aa1fb0b99d511ab16b74f31f20c5622eb44d.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB6523:EE_
x-ms-office365-filtering-correlation-id: fd10b019-4603-4606-cfcd-08dcfc78097a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cDlYTHdidTdKL2ppRGgyMENzbDljbldZeVJ2YXpSY0RFcVdQeDV5ZWZXaVli?=
 =?utf-8?B?ejQ2M1RnOXBPMytTd3JqUThIUXVNa2IzeEcydGVoVlFKWVNMS3FCbmZ3aEp5?=
 =?utf-8?B?NnJCcXZpWVJ1Rk85NHRGdTUwU25vR0VEbkpuOTE2WjZqZjdwc2ZMYXdLcWZ0?=
 =?utf-8?B?bW41VFlTeUlVbWI1dnU4RVJZdFlBR0VxU2xIZFRiZ2RHVnlYZkhHd3FGSDFO?=
 =?utf-8?B?Mnkva3JqZ2lYK1VaSmFZWDZjMWJuZlQrVHQ0Z293ay9lZS8xNEtzNGFLMEVw?=
 =?utf-8?B?L29OdU92eGxCRnU0SFFYM1doeUpzbWFzcGhock0rSS9JUkpGWGhEaTY3QTVp?=
 =?utf-8?B?bDhSYVdZL24wTXcyV1pGLzNDTWZqTFFGQmZOcHVYZkJnbW53dEM0Z3VtMWZi?=
 =?utf-8?B?TEFtWjYxbkJvVk1Ud0tnKytiVlN5RTlSc2JoTTRMZDMrYWwyQ3BnZ0NwSE1I?=
 =?utf-8?B?UnNjcjVKamMzVEwxTEE3RnhmUnRlZWc4MkVKeUhGbElrL0QrU056RXl3RkNY?=
 =?utf-8?B?MXV6NGZ5NDE2ZEZ5VG1yRWUrL3dCWEUyZ3VrcDNLcDYrOVhJVG5KaXZLQ0pT?=
 =?utf-8?B?djFjd3BFOTV4KzdCWlkwdldWVmxBZTdWcnh1eHkrdDNVbWRPMTh1b1JNell2?=
 =?utf-8?B?aEFlN3d5bTVmY2duRitsMC9lQ0ZhOCtPZ2JwdEVTTTM2bVp2b2RPUURuWkQ0?=
 =?utf-8?B?VThSYWxCQUdQQ1Avc1JkU2E1TW5KL3hEbGNtMDEvYUppMEo4Y1NubjVyaFc4?=
 =?utf-8?B?bWgrUlJ0R0FPTVRoOThYSEY5NWVhZnhOTVRjU2lNNVA0UmI5VWl5NVZTbit6?=
 =?utf-8?B?cFZLanNHdmFKcFNqREtIOTAxczV3OUg3cVg1Y04xcjUwdi9YbVpCZjRadjZ2?=
 =?utf-8?B?bGJMODdCVzUxeHJYb0tTWUdRcExQQ1o3bjdZczBtRWFKSE92NTNjakhjQlh0?=
 =?utf-8?B?aXB1ZUt4TlZzYWgwbUdYR1VMYUdZWEt4bXl1RUg0RTU4MDRVZXVodzBGb0xp?=
 =?utf-8?B?THBtTWg5eFhHL3dONTVrM3dtd09tcW5wbFdpSUhJclNZbDM5ODdZeWtGeWJu?=
 =?utf-8?B?d0x1cnQ3aWRFTjRvamE3RHdzR3BSWCtZMjNpczI0cUZFSUMybG92R2tYbEhp?=
 =?utf-8?B?NVcrZDZZZWRXMXBwcjBmbVdReHBQTjlhSlJKNi9ZZmtwcCszZG9WY0F4QVdV?=
 =?utf-8?B?NVkzNDgrSkUzSXNCeTI0eXZ5ODJ1bVRWRkQxV0paUFE1MzQxV0FMQmpybkx6?=
 =?utf-8?B?aEs2SEx0UWVqMC90ZEFVeTZjWlhJMEtDNXdtdWY0L2czSk93VW5VeFBIMXA5?=
 =?utf-8?B?QkNpZXdKdXZzSUFuWktNSkNLRW9PRHBuQXgycWVsaWZMOVRUSnp5YWJHL1BU?=
 =?utf-8?B?UUNFK0FweWVodXJLMzRJQ1FEbWFwaERDMFB0aUF1RW4wSTNVWW5pVTBOMWRP?=
 =?utf-8?B?MWJYQ0tWZmNyMlVZbkVudmI2V0l6V09MWERrdnc3RTNWQmRtTUE5dTArZG1w?=
 =?utf-8?B?WHFLSGpwYlR2OXVNVHVSOE02U1ZtZWRvNXJyVmo1R2Q0WGFhYkdwVzBoSlZx?=
 =?utf-8?B?OXZDQ2ZNc2U1Wnlic3A5TGVzWXZFelZJazFaMS9Bd2hOMmhiVy9udGxmcHFu?=
 =?utf-8?B?ZHVFQ3RyY2lzcEpod1NCeHZTRmkvSGU4bDVPeHpFY1dSR0pxSmxnckgwa0FX?=
 =?utf-8?B?NTByd2RsWFBOZVRRV3lqcDZIa3hDSDRSbzhlUG05MlZrSkVlVW1KNjZIQnl6?=
 =?utf-8?B?Y1dhQzkwRlRtU3Y0elhoTGg1RlBGcjE5TWNLWkZyS3BkVzI1MWduNDRzYVBZ?=
 =?utf-8?Q?FJYX8UwDUm2e6PitPfTcnLNF3LJExLOehZ6Qc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHlrVDRCT3AvRXNrZWhPU3NKc2tmQ3VYdVVseFFpSjJDK0FGcjNWZ2RsZnk1?=
 =?utf-8?B?Z0VhMFNVWmM0RURTRUsvZk1ybXRvYnh1L3dXcTNnNVppWFJKUngwMmRpRENj?=
 =?utf-8?B?dW9ydkhBVHUyQUJLaFVpaXV1TXlQa0NsdjVHdUxHQTNzMVk2Yjd0bzA1d0NH?=
 =?utf-8?B?WTFZNHV3YnRZcUtidG16WCtlL1plTjJWWlFlelQra0Z2TXlOQjNBUDBGNzYw?=
 =?utf-8?B?NkY5NzJoSjNCejJMek4xRXZ5SHY0MmZYakt3TUxLM2YvcFp2R2pCTmxENVN1?=
 =?utf-8?B?d0JheFVDRlMyZzhUeGlmVzltWHF6c0FqWVhhK2NBelQ4c3drTUZwQ1VzNWc3?=
 =?utf-8?B?WHJpeVRpNDRGeUZ2bzRaNVJsMFlBZmFJcktnMXpTQmVndzZRWXlic0ltd2ln?=
 =?utf-8?B?RW5rM0hjV25vQk90UG52WTFNWEZ6Q1liUVdRUUc1V1hpbmhBYThDbzVGMW56?=
 =?utf-8?B?dUQ0SHNsVWdSMzRhTDRBOEZRVjVvZTdjbVI2aTE2WVVYYWRjS3ZITVlZSFdu?=
 =?utf-8?B?YkUxVnhGZjhDRjJzMjkrR3FOUDBqNWpGNWxFWXQvMlA1TlJ2c0g5dTNYSmxa?=
 =?utf-8?B?VGFlSStzbHNRcnFHM2dKUGs1RHVGM1ZBaHpRVGhRQ3VHZ1lFd21uSUlrdVZv?=
 =?utf-8?B?SjE1TlNJR01zeHNPNTlFM2dIS0s3WFdMdmY5WHk5QVIrQkh2ZldhaEQzSitz?=
 =?utf-8?B?dlo0elVPUE5XKzdZMEJLNDkxd3FKSlhidEphMkxyaXlnVmg5ZTVZTnlMWDIv?=
 =?utf-8?B?amNnUUZLZ2NOZitHaVhFWkZpOWVka0hjclJ0b0VHYkNNVk9oQ0U4cWp3L1JH?=
 =?utf-8?B?dlZ0b08vWFNBOS9abnM4cHpyUFgyQWZwNnZMU2NSWVBSK0hSL2xLa2dzTFBT?=
 =?utf-8?B?enF4RG1BdTAxbktCVHBjZTRHZUZ6MDZCTHBMRTNiaGxDbXlXcElXRzFwaWFU?=
 =?utf-8?B?MEtvcks5NEpNa05BbGpBOUVpQXFxaDFyUnpSNDJmNFEycmZMVjVtdC85allX?=
 =?utf-8?B?anFpOFNnLzltY2dMcjRodS9VL0VtNWxiMkRyTkRhQnpaYlpUS3JsZXZZK3Z2?=
 =?utf-8?B?TURDUnVhZld4dTR4dTBCdkN3RTZ5dVRxVjFxMlI2cHhRajMxbHFZR2Zqb1Qz?=
 =?utf-8?B?UC9ZYm9LcWlwc216Myt1TVQzdU05ZWJ6MjdxRU9OYTdWRDh4Y0MyZUFqazlZ?=
 =?utf-8?B?d0xFV2NMUmhGUzNsNlBWMUltRFZtRG1JbEFESXZNT2pOZ0Nob1B2S1NUSGhz?=
 =?utf-8?B?VkdaRXgyb2J0dXZVbmJWeVBHeU1kZFFKU2FNRlR0YmNLVFliaVhwQUpsYUtE?=
 =?utf-8?B?dnZSa0NoZGY5TmVWRHlzS1g3bTBia1cvYmdZb05YTmhMb1QxVEo0NlhNMDZF?=
 =?utf-8?B?Sjl2L2Fxa2tMU2I5bkRZRHVpVUp3ejRqOFd2ZFRrdmJGTWMzbHZiVUZTNkZv?=
 =?utf-8?B?WWlMbkxWSXVoMWdCU1lkakpoOE5MdTdJYnJCdlphNWM4bHZKQWZ4aGJ1alVB?=
 =?utf-8?B?aXp6aVg4MlZFQ25MbE5MYVVOQ2pob1ZWeVk2NDFMdlFWTTZ1dVUxUWpVRXpi?=
 =?utf-8?B?bnkyK3lQWCt6SEgyclgwYkNMaTA5MjUySkJUeG12QzBGUVdKemV5NG52eUZD?=
 =?utf-8?B?dlNpRW9DNThtOThacHVLek1FWlhFRHBsT1crUkt6aVgxdENGcGZrTkZZeWVi?=
 =?utf-8?B?YXVvYWZKcTlubWZVMjFFS2NxYXVGaUw2bWtFeUtZa2lBRlVvZ0RxamdLMUt0?=
 =?utf-8?B?L1oxbHRZc1NYc2Z4cE5HZEEyUTBOQkdJZGIwRXZhZmRoRzFEdHFZSENGbDJJ?=
 =?utf-8?B?cHEyUjFYR3JJZmlsUExDQjVjby8zNGR3TmxLTkRJeTBrNFl6UjEzUzM1c1ZW?=
 =?utf-8?B?eUh4b3p6eU84M2RXM2YwdGtBaERyNGJYZFhJSFdrekQ2Z1JmYlZWL2RzQity?=
 =?utf-8?B?TVE4UjduWnEvOStUNDFaNEdzZFYyOW5waHJHRU1JOVJKVWF3OXRCUlFGWExN?=
 =?utf-8?B?THM5bFdjSUI0b1duUEp0eXR5WFpxZTFtOGFLUmk3Rk9YTmZnOUh6dVZlVDJa?=
 =?utf-8?B?MEVjTkFVUVNIc1hOdVVhSHIrNVltNTBTVTRycnQ1QkpxQlY0OU9PK0NZb0pm?=
 =?utf-8?Q?hG1nv1u8ulPzsZr8lKQYTzpTU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9623A669CF26540A1B2247DE21918FD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd10b019-4603-4606-cfcd-08dcfc78097a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 02:26:06.4544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h3QjFjpza82OQSbob3oA0ZGmzZwGzHEV8W0sfRv41fTeMEpkRrGW/MRRgRA5DQP+CXFLKg9f/1X494TqybSq/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6523
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.482800-8.000000
X-TMASE-MatchedRID: csPTYAMX1+Fm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYEmo
	bOLhIyMmCPYbugXTgR+M5TCLNNgDParukyhyG02kylAqNTt8FdX54F/2i/DwjRrUQ7A9MrmGjse
	1+4fQ7uu2XuqHnmj9+7WrjxGHjCv1oqIp1AUZB5qzI1v7J4hECr4HS0k2HeOoXCmcAC8DBrO+G7
	+0Lzl2tuRdnEX1rI/VkZOl7WKIImrS77Co4bNJXVZ0V5tYhzdWxEHRux+uk8h+ICquNi0WJInh/
	FAgM9IkVwZ2lLPezWcCp3OxgI4cWD0468Qg2+huftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.482800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	650924B9FFE3E1D45FC92936CFC576F12AD785E69B733667FC6229DE70BC40A52000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gK3N0
YXRpYyBfX21heWJlX3VudXNlZCBzdHJ1Y3QgZG1hX2RlYnVnX2l0ZW0gZGJnX1BESV9SMVtdID0g
ew0KPiArCXsweDAwMDAwMDE0LCAicGRpX3IxIDMyKGhleCkgMDAwMCJ9LA0KDQpZb3UgcHJpbnQg
dGhpcyByZWdpc3RlciB2YWx1ZSwgYnV0IGhvdyB0byB1c2UgdGhpcyB2YWx1ZSB0byBkZWJ1Zz8N
CldoYXQncyB0aGUgZXJyb3IgdmFsdWU/IEVhY2ggZXJyb3IgdmFsdWUgbWVhbnMgd2hhdCBraW5k
IG9mIGVycm9yPw0KQWRkIGNvbW1lbnQgYWJvdXQgaG93IHRvIHVzZSB0aGlzIHZhbHVlIHRvIGRl
YnVnLg0KSWYgbm8gb25lIGtub3dzIGhvdyB0byB1c2UgdGhpcyB2YWx1ZSwgdGhlIGRlYnVnIG1l
dGhvZCBpcyByZWR1bmRhbnQuDQoNCj4gKwl7MHgwMDAwMDExNCwgInBkaV9yMSBzdGF0ZV9jaGVj
a3N1bSJ9LA0KDQpEaXR0by4NCg0KPiArCXsweDAwMDAwMjE0LCAicGRpX3IxIGxpbmVfcGl4X2Nu
dF90bXAifSwNCg0KRGl0dG8uDQoNCj4gKwl7MHgwMDAwMDMxNCwgInBkaV9yMSBsaW5lX3BpeF9j
bnQifSwNCg0KRGl0dG8uDQoNCj4gKwl7MHgwMDAwMDQxNCwgInBkaV9yMSBpbXBvcnRhbnRfc3Rh
dHVzIn0sDQoNCkRpdHRvLg0KDQo+ICsJezB4MDAwMDA1MTQsICJwZGlfcjEgY21kX2RhdGFfY250
In0sDQoNCkRpdHRvLg0KDQo+ICsJezB4MDAwMDA2MTQsICJwZGlfcjEgdGlsZXhfYnl0ZV9jbnQi
fSwNCg0KRGl0dG8uDQoNCj4gKwl7MHgwMDAwMDcxNCwgInBkaV9yMSB0aWxleV9jbnQifSwNCg0K
RGl0dG8uDQoNCj4gKwl7MHgwMDAwMDgxNCwgInBkaV9yMSBidXJzdF9saW5lX2NudCJ9LA0KDQpE
aXR0by4NCg0KUmVnYXJkcywNCkNLDQoNCj4gK307DQo+ICsNCg0K

