Return-Path: <linux-media+bounces-21232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D579C3633
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 02:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73AAAB20915
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 01:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BC03C47B;
	Mon, 11 Nov 2024 01:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YViRjYO4";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="tcmtEksL"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D54E1B95B;
	Mon, 11 Nov 2024 01:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731289077; cv=fail; b=BufCC3s9qupZAMsio1NYQMcZCSqh5Gzk3GEf5K0QFrcm7izUhCsK+r9y7qC0rWhREIjZzlQI92Jdsggt/iQnq1LGz7LvuevJM1KUDBeZ0D9+ZokfDHTHJb61Nrz+xKvlTEVSjks/3iU7XUEgpX9U0uH4NvoEB9qeibqlBmI52n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731289077; c=relaxed/simple;
	bh=cTzzvA8sXk5/YMLKd5wu6wwSsH4adUHzT0AkbanLymk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BQqmfdeiiF+/h30B9nitOs9JK5PztvS0KvipWjv8c4I6yxqqoRpQ7R2lcAkqwIOQzpshpmCHI5cn7N4Hbi/y/0ND2Sofbma7NeeazRT+bh7Vd2NzZ/+q+eInPiHfdt0zZpezespwj9/eK7DDVyywyi2mHn4l5SdNP6D+JdS9BMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YViRjYO4; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=tcmtEksL; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8f949c5e9fcd11efbd192953cf12861f-20241111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=cTzzvA8sXk5/YMLKd5wu6wwSsH4adUHzT0AkbanLymk=;
	b=YViRjYO4Wo26pOzQMWxLUpF/Q+6UmN59sI39qN2yYRFFIODHO1D5Z8fh7sttyEIsDct80gyzOwni4a5SYCJn4rUrSS0iJ93Dl9+dRxseMTbGgsoCg1mOsyd+gKVZz4Wt266onMFXH+FFUoOyyxmmMLMi6GD/kqfSBRmDt14k6BI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:bb4a4522-4536-44d9-bbcd-18aaa36c5cd1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:a162d3ca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8f949c5e9fcd11efbd192953cf12861f-20241111
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 745689074; Mon, 11 Nov 2024 09:37:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Nov 2024 09:37:46 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Nov 2024 09:37:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOKSXdSMJxx3mWd7rFXjHngoJc6U551CyjixtcdInXatYj/3Dv8BZnkf1vi/3qjQhwSjtbTJHXYYrIXY0jNVoYZvDc/faXL8YbUlhvSMxG13j7zeI7AIng7Cyh4K+aPDQV98WBiSHZTiNCl2I070H8eY029bcnO1NXNOxiA4ejFl0wcvvIiFzehVFrHOhGZOykPB6kBdP9PrtB1jA7OiXb1H8JgA+s6OTjlvO+rSGo0NlpfH5uM9903N+6zcf2nCKNQYQ2i8cEjzHHsx+bOgJvT8kSFeqqFy7NSh0h8sXF7LWPL5Yl10t+p1TSHUbRojVAm7it+9B9R0A2dgVnqYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTzzvA8sXk5/YMLKd5wu6wwSsH4adUHzT0AkbanLymk=;
 b=oaPsx0tpcp2xjNC4oS6IOgluXVSbQoH/H/i02CeU1axIDesBSU5fgd9U0BsgL0DKHB4M2QRZR9cGiB+lznmqcky00rCkGCU4IIRYPTJc8+Qk5P3dRbTNk7LCxqAeqyvdTqtJA4lRTz4rnTLrJNkMCVmx9v3tzGPP8s4Lv7XDwe/IpWdS2WaCzavVunDk5vYm95CIMBsLTniKAAAp0BrQec8hixYjCZt5l1X/yzpY1+oq6lEYuq7ANwT5TwKW1BG9j7OmJ8h9GO2AHLgzbRO2hlSQ8RrgyDbqRNtOzk7SEG1vr0KYXUtnz1PZfmDcXpffdLVJx3rnuwUDR128nj6+8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTzzvA8sXk5/YMLKd5wu6wwSsH4adUHzT0AkbanLymk=;
 b=tcmtEksLnL7BlaGFACUM9R8jHRn3CrwGIKeZ4SIx9IZhJ8+1K+90OAlyTDVZdyCsm6QEynPYMHDuFNZwLq9wjyCA8r3dFjqrGKW0n81/1TD1UhYWJtkxl3E6IyHkan58HKN3U5L0BjIAKiWq1wXrg020kubJX9iJO7mhZ6Tbf48=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8018.apcprd03.prod.outlook.com (2603:1096:400:463::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Mon, 11 Nov
 2024 01:37:43 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8137.018; Mon, 11 Nov 2024
 01:37:41 +0000
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
Subject: Re: [PATCH v1 01/10] dt-bindings: media: mediatek: add camsys device
Thread-Topic: [PATCH v1 01/10] dt-bindings: media: mediatek: add camsys device
Thread-Index: AQHbGkcqBeP8ybzzkkuuOw+G7YHzMbKxgAgA
Date: Mon, 11 Nov 2024 01:37:41 +0000
Message-ID: <dbee462e4aed718badcddd30b0dd4d5e09135a51.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-2-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-2-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8018:EE_
x-ms-office365-filtering-correlation-id: 538f07c5-ce80-4fe5-4b61-08dd01f16eda
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WXl1OG8rOUJUbGlEY245aDhNTm5kRzlUeldEalFJU2kyY05WbjdjTHgyV2Vq?=
 =?utf-8?B?SUNwREU3ODFoVE1MUUhDRlAvZ3hxT1U5NWRoR1JEamdIWEFJNENCd2pncitZ?=
 =?utf-8?B?UTh6RG9qRTY5UHE3MERMOVdtNXp3VlZKemVpOVJyVzlTN21MV3JBMm1LQmZI?=
 =?utf-8?B?MEszSWtweUExZWZZeWREeEg4Ujg3dzRoUWJoMlBMVER2YWlVRDg0azk5TkdT?=
 =?utf-8?B?TkZ1Y2dwS2xEd1B1SGhzSGNDRkZUR2JjN2wxbXZjakw3eDkycHB4MTNmdE1W?=
 =?utf-8?B?S2ZTdzFIdDhVMU9QcVl1UzB4SHF5TFhiaUtRUXpab0ZSNE90akJnQmZOdjFy?=
 =?utf-8?B?R1ZmT1dPejRRNGY2MkJ3OHkxZ1lySmY2YUU3UWFkaEs3RERpRldVcEI5Z3JW?=
 =?utf-8?B?T2x0SnZER0szbDFxSHc1bzA4d2s3WjBURWJrc3ZISFd1S3A5eGxqKzE4Mnlr?=
 =?utf-8?B?V3VPOVpRLzJRTVNIbHY1bmxBb2k1YUwxTGJtWGV0QVU1bXFQWGZHb3dkY2hF?=
 =?utf-8?B?WGlaSzYvL01aL2drZ1BjdWNUSDAydjFndm1FM05PamtIaS9sWUcvWlVtV05V?=
 =?utf-8?B?N3ZFRHk5Qm1QRGNHWkp0c09Iem44aldNWEF1UWFreDhHMllRM082QXJ5WkdF?=
 =?utf-8?B?aDc2Q2paSDdWRGsvK1kzaG43bm9nSmdYWkpISGkzWkRjMTBsZGs1Z3Yzbkx5?=
 =?utf-8?B?dStXNmR6c2RDeVpTNkxCWGVXTTFOejVHTExqQnFCRDJpS2pwbnRMOEJzZEgy?=
 =?utf-8?B?V1FlRFI1N3NvMkhiWld3bjlIV2N5MjJSSG50YVBhUldzY1BPU1B6WElKRkhs?=
 =?utf-8?B?eXJCZklxVXRoZzN2bWpDbmNsb1hqY2RuY2pwcGR5cXYzOEptSHJhN0Zrc2p1?=
 =?utf-8?B?VmNkZUtWZ3E5NUVVd1hTL0hzd09mNDZ5clZ3RXpkNzJJcTF3YldvT0UrVzV1?=
 =?utf-8?B?NzJQUlE1bk83NDhjYTJPZDg2MHR6MmtocWhjVTdKcFFoMTBIaFo0dFh6Smcy?=
 =?utf-8?B?eERLSW54dHp5TWNTZFVObkRrbEZUMEt1dG1VNDVOUWhXdFkvRFB0SG83Y2Nh?=
 =?utf-8?B?N20xSzlFNUNJK0krbTg1cWhJOVF6cTZZSDhsSExhaTBaSGJBMzlFZEtJZ0RE?=
 =?utf-8?B?U01XWWo4eWNHREVMVnVUUWJ4YjFSRzdDRjVWc1BFc2tET0F6cE1tdTlFS2Yy?=
 =?utf-8?B?bVNnUGF6dEFhRXpOeVJmMThLTWxVY1Z3RS8yWVV4VlVGeUR0d2psZjFoRmtV?=
 =?utf-8?B?WGo1ZU9CRDlzbVp5NTMrdkNtN0lVTEUvV3VoOFpiaFhMVnpEeWVtTkZYMTBq?=
 =?utf-8?B?b2U2MDFUdkFtNXNwMDVkakFFSDl4OTU5NWc0RmxlbUJZRnNuUk1jaUFBS0VW?=
 =?utf-8?B?RktFWFB0Y3kwbktwM21jQlVaV0p4V0duN1V1U1Z6YU5GbW1wNzlVNEJBd2VM?=
 =?utf-8?B?cXVVUmV6MHNDMmgwc25tOWlIL0d0TDZ6VGNTK0h0VDZQYVRTQU1lL0N3WnNr?=
 =?utf-8?B?dWw1cGlidUdVS056Sm5HUU5wcjZsSG83czJVcEttYWVEREY3L1RHcWUvUDMy?=
 =?utf-8?B?YjM1RXZMT2FSREcwZmRVamFnQ2NMWDNGSGNiYkVBc0w5OUswN0d3RlU3TndW?=
 =?utf-8?B?WFVUVFZpWE8xZWxBT0s3K0NCY3JpcEFwSWpDV1l5Z2pEZUJJaElrbU5oaEVi?=
 =?utf-8?B?OGhmS1JCMThjS3FKd0NsVkg5Yk1aR3R2RWl5SFVkdmJuOStPT1cwVnFORUVx?=
 =?utf-8?Q?QeXUC1lrh9vq7kG+gQfIQzvo/cIr93YZnJip79q?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVBDTXZMU2R2cExPbUFNODRHRUgrZmg5RHFCelNDOVBRUEJZWTdTNnhBQkNH?=
 =?utf-8?B?ckJTQVR4OEExdlNIMitHK3BINEtBREQ0eCs2UXRxbU5jL3RISDJlV2QxVThW?=
 =?utf-8?B?VWVXdVNpMzVjU29zdFh3ZmVUajZpYnBGb2RPYU1sRHM5dDdseUMzVGNEWXRQ?=
 =?utf-8?B?N2NFY3ZJQmRkaFArRlVKYU9DaWNtOC9vZTNFaGZVZUN4UVYzZVFrVzVicnph?=
 =?utf-8?B?bmNmL2hJcGlwNGM3ZlJTRGN4RjFpbDhKdERmZ3RHNk9iL3NqQmlOMW5MWmsy?=
 =?utf-8?B?ZEN2L1pQRE56ckpQN0JtTGVPekNuK0c4aW4xSVBSdlJ3NzAxRzRwK1ZpZTZR?=
 =?utf-8?B?dDR4LzQydzhxcGgwbnYxOTdiS1JSbGdiMGdzeGxuRHNjaDAzdGtsL2ZNUzRL?=
 =?utf-8?B?N0dUVjVDTE5GWlVPKzdWdk5zSmtENGxYVXZmams4aG0vU2hyRTlISGpYakN2?=
 =?utf-8?B?Sm5TazlnZ3I2UlhLUmZyM1VkdnJ3bmhNaTRWaWdJQk9aK0ZpcWVyOTFSY3Qr?=
 =?utf-8?B?dmtTaFhQczJ1Y0pRcnJxZDhpbTI5UHc5cVFxa01URWU3dERyaTh4U2FFZDlT?=
 =?utf-8?B?ZE1Wb1paSjNERjhMdmoydzBpdmo3MFN2cmc1czJnMi9EK3o5MXYwUkV4UnRM?=
 =?utf-8?B?MkNNZ2lOeEVMb3hoU2gzUCt2V0tYNzF6UnF0SmxPdDFaNk9wSWlUTVZrWjV3?=
 =?utf-8?B?M2Z3ZnV6bGx4MmxMa2huS0p3REFJWkpvVzZhbEFEWXdLY0owTUNVZXFlVWtD?=
 =?utf-8?B?c003a0hSUUR6VDNuVytTRXY1U2dmaFVEY21QN0xTTXB3S0FuWDl3WnppTHhT?=
 =?utf-8?B?bjRxVE9IWGk5Snh1YnkxN1lKekNEMllwZDArcWUyOVBoNDIyV0lzUVhGbnZt?=
 =?utf-8?B?bHJHMDlYVmIrS3VuQ1ZHZG5PUFlEcVpGQlFzUXMwcUR2U3YybXEyZE55dnBs?=
 =?utf-8?B?Q2FEQUJBZXRvZHJ1MVJSaSt1QUZFaVVkZU1XM21rYUlQd1ZaU3piSlpZYW9P?=
 =?utf-8?B?WFUwdG9kNUpjaGloKzRpVjNPSVc0QmtrWjNVOTdrRy9BbEUvZnJIWHdCNkZP?=
 =?utf-8?B?b3lnZmpqellpWVZ2WVdySzhST2ZEY3JsV0U3VnRUQm1GOFd6eW9OTUtnSHdH?=
 =?utf-8?B?RlZaMkZ0cEJCbkF1d29hcTNKUGlTbk9IZitJSmVUTm44eTRHYXc1WmdrZGRk?=
 =?utf-8?B?dmZySVR3T1BjcTdzZFRGTkJPaWFyUWRtc2Z4MGVQVEJWM3hLdHVkTDM1QVh3?=
 =?utf-8?B?ZkdSZU9BNlJFYjZVTXZDU3U3eXU2OVZvUmtPejV5V0xTTkZaWnVsdlVMYWF4?=
 =?utf-8?B?akFYUDBnYkNCSWNpWkh5WVhHRUlyLzRmVVVvVnV2dFl5V0VBMVowY3F1azhV?=
 =?utf-8?B?UmdrMTFlODhMOHEveFlBUktDUGFIWE5YUFlvTmM2SHMxMGJmV2lkQ3Y4QzlQ?=
 =?utf-8?B?czZEbWlxNUJBLzFkUEprdXVJQlEvdkFCem5RTndkMmlOVEZMVzFqNFNVTU9v?=
 =?utf-8?B?T25tb3FSeVZHUUZldDFyaUs1N1drNXFTai81V094eHFxV0ZVNnRHN2N3UUJM?=
 =?utf-8?B?KzBoVjRmcVcySld1SGJXeTh6Ri9CWlI0YW9nb1R3dlcrMEprK2VRdkV4endj?=
 =?utf-8?B?L2ZVbEc1aEJYNkZoWVh4bUNmb0NuM3RxMWVNZ3hJVUpwOVIySUVxVWh0OUQ0?=
 =?utf-8?B?NXk0ZDI5eUE0cnJOdUxmSi9ocTZ6emh6SjR3cDY5bzgzY0hCcFhEOThvdTg5?=
 =?utf-8?B?UnhZZ2Nicko3THAraWdGcWZ3NFpzOUduUllVNS82K2tpRGIyM05BaFRVVFVM?=
 =?utf-8?B?SWpLQUxHWGNSQWNEeHhreGVKTHY5bGp5aW8zdXloUWprRG94MFZGMGtWVm02?=
 =?utf-8?B?dEpaMFIvTzAzWWJ6TzdWa0dGYXpTVlo4a1hKSi95QTBIejIzcmFNbzRtaU5X?=
 =?utf-8?B?eEd0d090dTJCdlk2d2RKZ3I1UlQxaHRVR0xlaTRpODJIVHBxNTdHS2RkSmNN?=
 =?utf-8?B?d2t2TnJxU0g1NEtmNGg4bEZnY2V5QVNqdUJvYUZ4S1lyazdSdjY1QUdRV1BT?=
 =?utf-8?B?dWZtTS9mckRlWWNQbW13bEFsdXdKdGF4WVNpbVNKQ2NMVlo0RUhZWkF2bjds?=
 =?utf-8?Q?GGI/vv+6LZwI1lhk7NORnpE6e?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAA5E849BA37824DB1D7C2F477E941B7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 538f07c5-ce80-4fe5-4b61-08dd01f16eda
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 01:37:41.4643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FE0RaLpte+PMgNPbDmNl8B2IJ5JTlmV1NVScukvxfrkE12wfJIbdMnXeF28s7LZBQYNVyWDom+Wy1mxM05bxsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8018
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--19.390200-8.000000
X-TMASE-MatchedRID: +f/wAVSGjuhm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYJgC
	Mlq+sZ+fkyeevgS86MgdYd1SkfqImrvjKWK1iQnHA9lly13c/gEW40XiUkbrG2ecrqZc3vab5gc
	Q9o9yjpvC9TF0oEZxDBEDiHAifYwNiJx4642cvJaVOwZbcOalS4A0ZcHPsEen4K/82EwzmQhOj5
	3mRhXD8VWbS+5sTc39wKX8fpO+yjLTo/qcrjih0FVN8laWo90MT5++FIORChD7efdnqtsaE3bkp
	dDhAgYmhXNzJizxIm+awlpOGeSY1ka9W7vL2ewkngIgpj8eDcDBa6VG2+9jFNQdB5NUNSsiPXro
	mHt6PHjFNZytR+M1BN0H8LFZNFG7bkV4e2xSge4FqD5dtQDzH+AG7EoDgaU4K0MEJQVI5XmInZ/
	Wzi9WK+ulxyHOcPoH
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--19.390200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	D40B0AFBE091C8F33A52F93C5B9E1B37296F71C93D22EEA518AABBBA138610A92000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiAxLiBBZGQgY2FtZXJhIGlzcDd4IG1vZHVsZSBkZXZpY2Ug
ZG9jdW1lbnQNCj4gMi4gQWRkIGNhbWVyYSBpbnRlcmZhY2UgZGV2aWNlIGRvY3VtZW50DQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBTaHUtaHNpYW5nIFlhbmcgPFNodS1oc2lhbmcuWWFuZ0BtZWRpYXRl
ay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArLi4uDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWsvbWVkaWF0ZWssY2FtaXNw
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWsv
bWVkaWF0ZWssY2FtaXNwLnlhbWwNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAw
MDAwMDAwMDAwLi5jZTM3OGRkYmQ1YmQNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWsvbWVkaWF0ZWssY2FtaXNw
LnlhbWwNCj4gQEAgLTAsMCArMSw3MSBAQA0KPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
KEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ICsjIENvcHlyaWdodCAoYykgMjAyNCBN
ZWRpYVRlayBJbmMuDQo+ICsNCj4gKyVZQU1MIDEuMg0KPiArLS0tDQo+ICskaWQ6IGh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRpYS9t
ZWRpYXRlay9tZWRpYXRlayxjYW1pc3AueWFtbCpfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWprSG1x
dHhPc3Q2RHY4OFJhRS1zczlWYXhLeEZvNEZ1UGwxc21YVEVua2lpalU3alM5bmtZR0JQb0xyOGc0
SmkyZFpwYl83TEhXckxwSXl1MnFvUGc4enk1NjgkIA0KPiArJHNjaGVtYTogaHR0cHM6Ly91cmxk
ZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchamtIbXF0eE9zdDZEdjg4UmFFLXNzOVZheEt4Rm80
RnVQbDFzbVhURW5raWlqVTdqUzlua1lHQlBvTHI4ZzRKaTJkWnBiXzdMSFdyTHBJeXUycW9QZktW
QmRUdyQgDQo+ICsNCj4gK3RpdGxlOiBUaGUgY2FtaXNwIHVuaXQgb2YgTWVkaWFUZWsgSVNQIHN5
c3RlbQ0KPiArDQo+ICttYWludGFpbmVyczoNCj4gKyAgLSBTaHUtaHNpYW5nIFlhbmcgPHNodS1o
c2lhbmcueWFuZ0BtZWRpYXRlay5jb20+DQo+ICsgIC0gU2h1bi15aSBXYW5nIDxzaHVuLXlpLndh
bmdAbWVkaWF0ZWsuY29tPg0KPiArICAtIFRlZGR5IENoZW4gPHRlZGR5LmNoZW5AbWVkaWF0ZWsu
Y29tPg0KPiArDQo+ICtkZXNjcmlwdGlvbjoNCj4gKyAgTWVkaWFUZWsgY2FtaXNwIGlzIHRoZSBJ
U1AgYXV4aWxpYXJ5IHVuaXQgZm9yIGNhbWVyYSBzeXN0ZW0gaW4gTWVkaWFUZWsgU29DLg0KPiAr
DQo+ICtwcm9wZXJ0aWVzOg0KPiArICBjb21wYXRpYmxlOg0KPiArICAgIGNvbnN0OiBtZWRpYXRl
ayxjYW1pc3ANCj4gKw0KPiArICAiI2FkZHJlc3MtY2VsbHMiOg0KPiArICAgIGNvbnN0OiAyDQo+
ICsNCj4gKyAgIiNzaXplLWNlbGxzIjoNCj4gKyAgICBjb25zdDogMg0KPiArDQo+ICsgIHJlZzoN
Cj4gKyAgICBpdGVtczoNCj4gKyAgICAgIG1pbkl0ZW1zOiAyDQo+ICsgICAgICBtYXhJdGVtczog
NA0KPiArICAgIG1pbkl0ZW1zOiAxDQo+ICsgICAgbWF4SXRlbXM6IDINCj4gKw0KPiArICByZWct
bmFtZXM6DQo+ICsgICAgbWF4SXRlbXM6IDENCj4gKw0KPiArICBwb3dlci1kb21haW5zOg0KPiAr
ICAgIG1heEl0ZW1zOiAxDQo+ICsNCj4gKyAgbWVkaWF0ZWssc2NwOg0KPiArICAgIGRlc2NyaXB0
aW9uOiBNZWRpYVRlayBjby1wcm9jZXNzIHVuaXQgZm9yIElTUCBzeXN0ZW0NCj4gKyAgICAkcmVm
OiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlDQo+ICsNCj4gK3JlcXVp
cmVkOg0KPiArICAtIGNvbXBhdGlibGUNCj4gKyAgLSByZWcNCj4gKyAgLSByZWctbmFtZXMNCj4g
KyAgLSBwb3dlci1kb21haW5zDQo+ICsNCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0K
PiArDQo+ICtleGFtcGxlczoNCj4gKyAgLSB8DQo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L3Bvd2VyL21lZGlhdGVrLG10ODE4OC1wb3dlci5oPg0KPiArDQo+ICsgICAgc29jIHsNCj4gKyAg
ICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiArICAgICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+
ICsNCj4gKyAgICAgIGNhbWlzcDogY2FtaXNwQDE2MDAwMDAwIHsNCg0KSW4gbXQ4MTg4LmR0c2kg
WzFdLCB0aGVyZSBpcyBhbHJlYWR5IGEgY2xvY2sgY29udHJvbGxlciBhdCBhZGRyZXNzIDE2MDAw
MDAwLg0KSXQgc2hvdWxkIG5vdCBoYXZlIHR3byBkZXZpY2UgYXQgdGhlIHNhbWUgYWRkcmVzcy4N
Ckl0IHNob3VsZCBoYXZlIG9uZSBkZXZpY2Ugd2hpY2ggaGFzIG11bHRpcGxlIGZ1bmN0aW9uLg0K
bW1zeXMgY29udHJvbGxlciBbMl0gaXMgYSBzeXNjb24gKHN5c3RlbSBjb250cm9sbGVyKSBkZXZp
Y2Ugd2hpY2ggaGFzIG11bHRpcGxlIGZ1bmN0aW9uLg0KSXQgaGFzIGEgbWFpbiBkcml2ZXIgKG1t
c3lzIGRyaXZlcikgWzNdIGFuZCB0d28gc3ViIGRyaXZlcjogY2xvY2sgZHJpdmVyIFs0XSBhbmQg
ZGlzcGxheSBkcml2ZXIgWzVdLg0KVGhlIG1haW4gZHJpdmVyIHdvdWxkIHByb2JlIHRoZSBzdWIg
ZHJpdmVycy4NClJlZmVyIHRvIG1tc3lzIGRldmljZSB0byByZWZpbmUgdGhlIGRldmljZSBhdCBh
ZGRyZXNzIDE2MDAwMDAwLg0KDQpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxODguZHRzaT9oPXY2LjEyLXJjNyNuMTg0Nw0KWzJdIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90
cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0
ZWssbW1zeXMueWFtbD9oPXY2LjEyLXJjNw0KWzNdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvc29j
L21lZGlhdGVrL210ay1tbXN5cy5jP2g9djYuMTItcmM3DQpbNF0gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJp
dmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE4OC12ZG8wLmM/aD12Ni4xMi1yYzcNCls1XSBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51
eC5naXQvdHJlZS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYz9oPXY2LjEy
LXJjNw0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVr
LGNhbWlzcCI7DQo+ICsgICAgICAgIHJlZyA9IDwwIDB4MTYwMDAwMDAgMCAweDEwMDA+Ow0KPiAr
ICAgICAgICByZWctbmFtZXMgPSAiYmFzZSI7DQo+ICsgICAgICAgIG1lZGlhdGVrLHNjcCA9IDwm
c2NwX2R1YWw+Ow0KPiArICAgICAgICBwb3dlci1kb21haW5zID0gPCZzcG0gTVQ4MTg4X1BPV0VS
X0RPTUFJTl9DQU1fTUFJTj47DQo+ICsgICAgICB9Ow0KPiArICAgIH07DQo+ICsNCg0K

