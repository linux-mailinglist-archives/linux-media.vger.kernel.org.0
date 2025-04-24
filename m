Return-Path: <linux-media+bounces-30894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 384FFA9A069
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 07:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 661801777E7
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 05:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D40A1BC07B;
	Thu, 24 Apr 2025 05:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pwSiormJ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="u+LjPT38"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE51935963;
	Thu, 24 Apr 2025 05:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745472164; cv=fail; b=XW3/jy8zz06z9w45PPxVjs5Enn1vpq/AsrMYnzuLCjMp/1zv3ReMMwI64921dbChysgotT8Py8WA6sYaJVD3z/+6o3B08HMpxrAJ0K8E1ZH0vV9cHo8zrY6Ed/6plTUASo02j0hLVoWFtIdmd+5D9+79ROMHwIEs9LR39KHFS00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745472164; c=relaxed/simple;
	bh=jeI83W2vt+cAGx5JRM3eT5Snh7s+8Vpcb/Sl7Ql4rmc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q3wwZcaZKyZB7ijQG/ORDdDOWzcmP0OYHL4yGhztCuNk/kz6TIfsHAHHBAvsF0tfiFQU4FReJQckaMaOWMTGSVgVE6ZYh1MAMMMIIY/7dbEk8FihQB1oMh8IzOeBFVr5OTN/1rdLHgZz8YRl+NK6OzWqbHV+IcKi9kRG/K86Zjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=pwSiormJ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=u+LjPT38; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1bc38b6620cc11f09b6713c7f6bde12e-20250424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=jeI83W2vt+cAGx5JRM3eT5Snh7s+8Vpcb/Sl7Ql4rmc=;
	b=pwSiormJZIV7z5OUZpnmIqpzFmauDzk8XdbreGoee4IZRpgAFwEtftJyUe4VC7iA+Jgd4KhyqEAyIHEtqFCHU2ngsZatEo3ZXEb5NAtwxW/ckO3bjwDdMUsDYCmcI6UKqqUuV4LBIMJp5/STO3a+v6R+txOeUYsl9u8CZNeFjcA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:fe848705-9ab6-4b8b-bfff-81a53e6fd29b,IP:0,UR
	L:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:2
X-CID-META: VersionHash:0ef645f,CLOUDID:1a1f8d2a-2448-4c17-a688-fd64fca576d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:4|51,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1bc38b6620cc11f09b6713c7f6bde12e-20250424
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 441850645; Thu, 24 Apr 2025 13:22:25 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 24 Apr 2025 13:22:24 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 24 Apr 2025 13:22:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzcLViQDUebnoET0+TBJvAAcsP9pyVZh7PHs5f09W1rqEuUZC/3KtX6lVfzTywJXTFLKgSbc5rhD3O7faZjwFbdZtb9QQag18vVeciZBso7kOiqfNFC752KnI43plPzD1hAVIB4dy32TKr2NLhuvCoN0B+tAKgoeRAHx50C0LNNnnMmpAztFdIhqX3xdWefkq7K9op0xJe7HjkR94Z9qUC3FnFa+BtYggS/gidRnBhK6LEg05uD2hWtid/ajdMR8ZSRImNdggtYFZuI46+Umh41dSPSEGegS6z6gdmCCu6VXtT95LWcx7NAkd59oQu2Oo0cKye+TJtoGLYn/QKaPtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeI83W2vt+cAGx5JRM3eT5Snh7s+8Vpcb/Sl7Ql4rmc=;
 b=LRCjDLg2nMxlb3fy6beLZ5TaWLDJeBwAv8/rD4M0OB/QFRXKDch+mFwyozFSpmFFQtM1hWqRM6cKEoEA6ZYPyPFLrcBlOIZWyQVTICdtgIvsZsiN5WUYBI5dBQpNyumH+ysmOd1ZHYa6RGqkATIeoIIyumdL3O9XW7NZDP7YCgIpOVNLafTYMaN7w1iyhZwza5Wz0ddGT9Ln5s4sSK5voDWRa2STINOjl2fXVCWMoZQOCqv/xkRNRYYxHB73K7ZO4SMOLUI761fQFFu6xYpBM+VG6rZezthXGBsIacz2b5JNw8hUfxLy40JSj+R5z5d3i9OOiXvtmp0TRl3SxOo0WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeI83W2vt+cAGx5JRM3eT5Snh7s+8Vpcb/Sl7Ql4rmc=;
 b=u+LjPT38q4haFm4Srjs3iwbwaKXzvQgXo2lhdJTRCelUDbWkSmLrmGAte5WpAzCvrtMUr1TBMjKRKZIbTDJR56lVcL0qTRT+QNiB9sYXvILdcenq7kzVWfk0Bo8y84W+jSODdcn97xJOOWFZ4vK1+DDXR6oAxK9MZPCAaNfga0U=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7799.apcprd03.prod.outlook.com (2603:1096:820:f6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Thu, 24 Apr
 2025 05:22:21 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 05:22:21 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, =?utf-8?B?Qm8gS29uZyAo5a2U5rOiKQ==?=
	<Bo.Kong@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
CC: =?utf-8?B?Wmhhb3l1YW4gQ2hlbiAo6ZmI5YWG6L+cKQ==?=
	<zhaoyuan.chen@mediatek.com>, =?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?=
	<Teddy.Chen@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v5 3/4] uapi: linux: add MT8188 AIE
Thread-Topic: [PATCH v5 3/4] uapi: linux: add MT8188 AIE
Thread-Index: AQHbpGvInfDcv6tci0uOYxvKAnoEirOXmaSAgBkmdYCAAajDAA==
Date: Thu, 24 Apr 2025 05:22:21 +0000
Message-ID: <8a5c99fe2f5c5f7cdb2e990fd0c0ca100e0e5070.camel@mediatek.com>
References: <20250403074005.21472-1-bo.kong@mediatek.com>
	 <20250403074005.21472-4-bo.kong@mediatek.com>
	 <be84455d1ea9573c20da5e586e57f0fa18135f0c.camel@mediatek.com>
	 <1944b77adc5f864ba0587994439ca57c0dbfa175.camel@mediatek.com>
In-Reply-To: <1944b77adc5f864ba0587994439ca57c0dbfa175.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7799:EE_
x-ms-office365-filtering-correlation-id: 9d913316-61ad-4914-cb35-08dd82effd49
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SVFzUEc0OVFseUxiWDRON1Vwd1BLdUNlclg3T1VscWJzWWUyaGpDbGRjdmNJ?=
 =?utf-8?B?bHRweVgvRExxSnkyYVBlOFFhN2t4NFI1akVneG5KRnZBQXdBUTdRaUFKcmtC?=
 =?utf-8?B?cDlaaG1ubDAxS0g5SjRjRW5nbkJhT05ucGo4bmdGRzRabklpZXZGeGQzUGJm?=
 =?utf-8?B?aFZTaUwwbVJxc3l0b2xUSFNFZHk4N08zVzV2bzBzR28rc1BpMEdZRFFqZjJ1?=
 =?utf-8?B?MTh5Wk1UeXBWVzFsWWU5MkU3bE9wM1lsU2o2VzJBT085OUxzbkM2THJUbWxE?=
 =?utf-8?B?VjBIWVQvV2U3cWw4VUFJRVE3cXdXSHU1YVpQVXNXbHVGZHU4Rk9TeWc4UWJk?=
 =?utf-8?B?V1pTekZZRGkvQXN0VXUwQW9iZnhZMkNOd3dWV2x5bDBjcDV5eXhRK21pSDkr?=
 =?utf-8?B?ak1McytCTStSbTNTU2xqWjRHcUFxZHNVOWE3ZUhtMk1ZZEtrK3liM1lvVk1I?=
 =?utf-8?B?bG9mUHFkcmYvMHViTWV0WUJybGg5MmQrblUrdWdPeHZJalBycmhGVFlBM29P?=
 =?utf-8?B?RlhuZGhtSDBVUUxmSFhEUnNkL2tPVVc1WXNIdm5DQkp1M3NQejdjcFhQZ3c0?=
 =?utf-8?B?MHFjdVU0c3NSU3YxTEJpb21tb0xLd2pBazduS1ZrcGJTRGpNaFB6bEppTVhk?=
 =?utf-8?B?R1FSNVVQNE9wQXRIeWdYV2s1bGtqWkV5c1hQcXdvejNxZXpkMlV0ZUhIMDkx?=
 =?utf-8?B?emluKzlua05UNDVtSjNDUkFVQnJaN01DTGdmLzJPNnp6THArc0R6SnFIWlRG?=
 =?utf-8?B?TDRpQWdNMEZzUnREUEF0YmFWZWZLSFpqdmRhQ1k3VG8rbUR5R2JRMk9jcE5h?=
 =?utf-8?B?bGRScXRBZHJiV0tqM0Y1VFpNdkNuVVpyMk12bWN5bDhqTzhuSWxFYnE1UmND?=
 =?utf-8?B?emRPajNJbTZRMndzcjNDWFVHU0ZiUWJVcVpqc2pySUIyRUVrc3BzQzF0d0xW?=
 =?utf-8?B?Qkd2eWFQTjlSOVlnOWx4R2M0Mno2VEpmbENVS0RnZmJQNEhXQS9sSnN1Zjht?=
 =?utf-8?B?YkUrejQ4OG9FQjhzRXRyUFpUeEYybGNQcyt3UFl5TkJaV2ZVd2VvY25RS0cv?=
 =?utf-8?B?ZVdrNUMxK3NQcGZmVEVaTG0xRnRUTFEvR2Z6Q2RWN0trcnFLZjRUZUEvK0V4?=
 =?utf-8?B?U2ZFcExtMnh4blZzS0ZuUkRSY3gwREN4VS9SZ3RXQm15eWtpbEVYUVlwUG9X?=
 =?utf-8?B?djVUSFZRMFVQd050SVRHSHVLdGd4WmtWdnFodTRRdGtzUjRmZFloODBPalVz?=
 =?utf-8?B?SXd5NU9WcWxTY0tQVGsza0VwVUZ5TjRIS2IwdU5CVEtYM2ZETEhQUFA0VTI2?=
 =?utf-8?B?M0pKam9pSDlOcWNkRkdmUGZiYlJmWkZJQm1EZkN5QWtvU2xZS0ZmUDhjSEtM?=
 =?utf-8?B?OGtkZHVXdlE3S1FDZlhrK0ZXUHA5YlBtejVQMXlvemRMd1JDeHVLRDMwQnNK?=
 =?utf-8?B?dlpoQzFJYWhhQThBTnp6UWtoazFEbC92bXVpVEdMcXROcm1CVUxpSFU3ditE?=
 =?utf-8?B?S0RmdlZEUm9ET3UwTDZodnBTSG9yRlN3c08zS016NDBRanFTTDlidDlQVzMy?=
 =?utf-8?B?cFk3Tzg0clRGRzRCdHQrUnQ3bENDajFnK2ZqY0tlZDhnUEVYdmtGYXRJZTRj?=
 =?utf-8?B?ZkdxUGovRElxU2xPb1RQN3hQK05CTWpUeVhXOEFIYnVTeTlDVnlvZVc4bTBL?=
 =?utf-8?B?UGc1Uks2K0tncVloTzhxRnNybkV2Z0FkM1paMTZncWJXNTZyM3BjZmdhYndN?=
 =?utf-8?B?Y0FSL1VyRWdqeHFidlQ2NWxiaWMwTU01RG5hNkgyNTRoZ3NWRlFmU3RseDV3?=
 =?utf-8?B?ajN0K2dYOXRHWnEwQ1ozSTMrbzNabFltQ1BSdjFCaVBmOTNkK0NkNmFySTRJ?=
 =?utf-8?B?cEY3Mm5raWtKOXJ0aWRwUTlkNGVKVm9FZTRiWVFoeXViSFR4TWU2ODRzSm1H?=
 =?utf-8?B?eFBQbElDTk1qWjl2cmJPVG15SUNtSnFMQ0N6bHk1NE9TbCtpbXV3RVA3aXNE?=
 =?utf-8?Q?WLgl6hug4fusYFess0gKmoJagRZpOQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjVWTW9lSlFGVm1Wanc5cDBPQ1cydnIrdk5kajRZTjdjYUF2ZjNtRExFcWtE?=
 =?utf-8?B?VlFJOFk4UVhxNDk5NS9BY2F5dmNYb1BGZm5pLzk2czNPYWZNY0d2ZnFGODRJ?=
 =?utf-8?B?dFJ6Wndac0lWN0c4dEh2WkpNdjNmL1ZySUZPNU9GWllpMGVFeDJHeHZEUW1p?=
 =?utf-8?B?QUpIU21uQlg1ME5vd2J2Uy95WlNEWTJvZEpZK3FUdkNobURTamJTc3dQSUhF?=
 =?utf-8?B?TmYzdDRkOXE1a2UzS3lPT29NeGVOTzIyQ2kvVkk1blFqRHRwV0NWL1BqSTRD?=
 =?utf-8?B?TXllMUNheWRQMlduKzBKcGpNbm9FU2t1cmxOYXVydzNKMXJEaURjMFpqdFNy?=
 =?utf-8?B?Qmd4MjhvT3pJcVhmUHR2UGI3K2RoTXRHakZUdmJxOW5hQkNCVWt4MThYNHZ4?=
 =?utf-8?B?eEF1WG5VY3hGbGwxdTJ2cmZpUk05SnJaZks1UmVjd1hUWkhQR3FpNmF2N2Rt?=
 =?utf-8?B?cWVvNEp5TCt0MHdxeFpIVk9jdnFKc25SaXM3NDI5anBRakQ0L2FRTm5LbTgx?=
 =?utf-8?B?OVF1dTM5WW1tWldLWXV3Zjl4OEY3cU9UTHMveHo4TFd5bXBsWng1djl2RWxX?=
 =?utf-8?B?NE9xanZueVR0U1UyQ3BtaUtMbjRiZEd2WmJlYmxIWFRvcDk5dmNBSEhPckVt?=
 =?utf-8?B?SkhuT2p1dEt0QnhKWlk3aUg3clB5Q25ibjFySWhUYTJBUC9FOEJEWFhqOC9I?=
 =?utf-8?B?UEFqQ1pWVkhESjFEV0R0T1FKditOUjVyMXdiWkJsUXZMVWF6MkNzbzFmTFVx?=
 =?utf-8?B?N1puTFh4OFZEbzZTVnBHTi9URjdFK2N6MEcvTmdBd09Ybkx6Q3M2Mnd4a294?=
 =?utf-8?B?L3N3Z0pKbVhmbGR6aFlFNEQrVHBldFpBVWdEaExXa2JnNlIwbmVSVEVJSjY3?=
 =?utf-8?B?QzJIVnJVNDJrb20va1JLbmRvcU9DdUZQbHA2TVNSMDZVSjFIcW0vV1MrcnZq?=
 =?utf-8?B?Ulkwb0RwUnAxenppMlVSMUtEZDd2bWh5a010b3VPOUNteUV0SlZqYW43SWZ5?=
 =?utf-8?B?SGJDRjFyZVBKam1UMkcwLzk2ck8xbFZ6b0s0MUlFRTRKa1BFU1JhYkNwQmpW?=
 =?utf-8?B?bzZLdFpsWVNkdHB5T1NVOFFjV0NmL3NmUDlyY0Vmb2lhb3h4YWJsK2V1eDNV?=
 =?utf-8?B?bUt0L3RCcmVlNndWL3Izd3NiTm9jNm9jdGNkTllvUGxDQSsvNEhLd20xaGRq?=
 =?utf-8?B?K1psTmwrclZaWThvdEdNTUlyVUJKaXp3S3QvV1BJbm4wYjZEa2pVNVJNN25N?=
 =?utf-8?B?bzdVRDJsS2duV2JsU2ErR2t1UjU5UlJxTWJ4SG5iRGIyaXFMR1E2Z3VhamJz?=
 =?utf-8?B?a2NmTTFhWTJPYWZVYXEzRHdOUnhEVVJQY2h5L1lpTlJHYzhIbWQrSnpZaWxw?=
 =?utf-8?B?K2paTktiNHBKQVNpdGw3aTNRNzd2SDJZdWtyQ1gzckx5N0FaT2lOYkVrMXB6?=
 =?utf-8?B?MkdSeG1zTllTbTJUNUx0TVB2ZG1SVG4zenJxbUlwUkhtQWdqc0YyZ2FRTTho?=
 =?utf-8?B?SzZtYlBGKzRSYmRJMzFHU284WUJPbEM5UmZ4ekJsZ3pQY1UxU2dlTmViMjJK?=
 =?utf-8?B?N3gzL3BSS1lYOWpKZDBZNDQ4aTMwcC9vNy9MZm56RENmTUR3YlRJbGI0VHFZ?=
 =?utf-8?B?UW01c0lrVHNNRFNVUUlGTmk1eWRHbHRFZnpXN0wzcTBoT3lsMExrY2tTbkVv?=
 =?utf-8?B?SVJqUUpVWXQ3cDFpTG9ESVJ5RlJtaFNWYStUbnpkamhrN1NlaVdXOTA2eXFG?=
 =?utf-8?B?d2NnMUJUa3hyNlAreU5CeCsxM25yekF1NlgxUVFtbUluVnpGL09SamxqK2dB?=
 =?utf-8?B?WXlkR3NFMWwyeS9rWjJ6WmRlNk9XVFR0TWlxL0c5elBDTUlqRXUweHIyRXRi?=
 =?utf-8?B?Z3lncEpSbWFVTWk1ZmJmSy9sdjlyYm1ZdTloU25PdDFNTitJWDB0dVJyb3l6?=
 =?utf-8?B?ekNLMllQR3orMGY4VEFZTGc2cnBYZEEreFFkMDkzdWZTcUlyZHliRU5scG9o?=
 =?utf-8?B?akJKcDh5eGF5REtxNWRuaDBSYnF0QWUzUjhaZWlrOFlIQXpqTXB2eUQ1SkpE?=
 =?utf-8?B?OWpMZnpaSWRUck1Bd21HTUp4ckVjV21LQ3Z6WXo0Qk1EVzltbUdVcUxsVnJO?=
 =?utf-8?Q?/j10xWqk2L0SZ8ZopT8IejjYB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD4EC9045C1DA94BB755099C9DC83681@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d913316-61ad-4914-cb35-08dd82effd49
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 05:22:21.4679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DXiLzQFR0okAnC3WCjHvNPhcauriptQCMyfgBOfALk/DXWVu4KESJ04p233aD3CgtvQnl7c5UULGD7UiSs2bXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7799

T24gV2VkLCAyMDI1LTA0LTIzIGF0IDA0OjAyICswMDAwLCBCbyBLb25nICjlrZTms6IpIHdyb3Rl
Og0KPiBIaSxDSywNCj4gICAgIFRoYW5rcyBmb3IgdGhlIHJldmlld3MuDQo+IA0KPiANCj4gPiA+
ICsvKioNCj4gPiA+ICsgKiBzdHJ1Y3QgYWllX2VucV9pbmZvIC0gVjRMMiBLZXJuZWxzcGFjZSBw
YXJhbWV0ZXJzLg0KPiA+ID4gKyAqDQo+ID4gPiArICogQHNlbF9tb2RlOiBzZWxlY3QgYSBtb2Rl
KEZETU9ERSwgQVRUUklCVVRFTU9ERSwgRkxETU9ERSkgZm9yDQo+ID4gPiBjdXJyZW50IGZkLg0K
PiA+ID4gKyAqICAgICAgICAgICBGRE1PREU6IEZhY2UgRGV0ZWN0aW9uLg0KPiA+ID4gKyAqICAg
ICAgICAgICBBVFRSSUJVVEVNT0RFOiBHZW5kZXIgYW5kIGV0aG5pY2l0eSBkZXRlY3Rpb24NCj4g
PiA+ICsgKiAgICAgICAgICAgRkxETU9ERTogTG9jYXRpb25zIG9mIGV5ZWJyb3dzLCBleWVzLCBl
YXJzLCBub3NlLGFuZA0KPiA+ID4gbW91dGgNCj4gPiA+ICsgKiBAc3JjX2ltZ19mbXQ6IHNvdXJj
ZSBpbWFnZSBmb3JtYXQuDQo+ID4gPiArICogQHNyY19pbWdfd2lkdGg6IHRoZSB3aWR0aCBvZiB0
aGUgc291cmNlIGltYWdlLg0KPiA+ID4gKyAqIEBzcmNfaW1nX2hlaWdodDogdGhlIGhlaWdodCBv
ZiB0aGUgc291cmNlIGltYWdlLg0KPiA+ID4gKyAqIEBzcmNfaW1nX3N0cmlkZTogdGhlIHN0cmlk
ZSBvZiB0aGUgc291cmNlIGltYWdlLg0KPiA+ID4gKyAqIEBweXJhbWlkX2Jhc2Vfd2lkdGg6IHB5
cmFtaWQgaXMgdGhlIHNpemUgb2YgcmVzaXplciwgdGhlIHdpZHRoDQo+ID4gPiBvZiB0aGUgYmFz
ZSBweXJhbWlkLg0KPiA+ID4gKyAqIEBweXJhbWlkX2Jhc2VfaGVpZ2h0OiBweXJhbWlkIGlzIHRo
ZSBzaXplIG9mIHJlc2l6ZXIsIHRoZSB3aWR0aA0KPiA+ID4gb2YgdGhlIGJhc2UgcHlyYW1pZC4N
Cj4gPiA+ICsgKiBAbnVtYmVyX29mX3B5cmFtaWQ6IG51bWJlciBvZiBweXJhbWlkLCBtaW46IDEs
IG1heDogMy4NCj4gPiA+ICsgKiBAcm90YXRlX2RlZ3JlZTogdGhlIHJvdGF0ZSBkZWdyZWUgb2Yg
dGhlIGltYWdlLg0KPiA+ID4gKyAqIEBlbl9yb2k6IGVuYWJsZSByb2kocm9pIGlzIGEgYm94IGRp
YWdyYW0gdGhhdCBzZWxlY3RzIGENCj4gPiA+IHJlY3RhbmdsZSBpbiBhIHBpY3R1cmUpLg0KPiA+
ID4gKyAqICAgICAgICAgIHdoZW4gZW5fcm9pIGlzIGVuYWJsZSwgQUlFIHdpbGwgcmV0dXJuIGEg
cmVjdGFuZ2xlDQo+ID4gPiBmYWNlIGRldGVjdGlvbiByZXN1bHQNCj4gPiA+ICsgKiBAc3JjX3Jv
aTogcm9pIHBhcmFtcy4NCj4gPiA+ICsgKiBAZW5fcGFkZGluZzogZW5hYmxlIHBhZGRpbmcsIHRo
aXMgaXMgb25seSB1c2VkIG9uIHRoZSBoYXJkd2FyZQ0KPiA+ID4gb2YgeXV2IHRvIHJnYi4NCj4g
PiA+ICsgKiAgICAgICAgICAgICAgYW5kIGhhcyBub3RpbmcgdG8gZG8gd2l0aCBmZF9tb2RlDQo+
ID4gPiArICogQHNyY19wYWRkaW5nOiBwYWRkaW5nIHBhcmFtcy4NCj4gPiA+ICsgKiBAZnJlcV9s
ZXZlbDogZnJlcXVlbmN5IGxldmVsLCBHZXQgdmFsdWUgZnJvbSB1c2VyIHNwYWNlIGVucXVlLg0K
PiA+ID4gKyAqIEBmbGRfZmFjZV9udW06IHRoZSBudW1iZXIgb2YgZmFjZXMgaW4gZmxkLg0KPiA+
ID4gKyAqICAgICAgICAgICAgICAgIHVzZXIgc3BhY2UgdGVsbHMgZHJpdmVyIHRoZSBudW1iZXIg
b2YNCj4gPiA+IGRldGVjdGlvbnMuDQo+ID4gPiArICogQGZsZF9pbnB1dDogZmxkIGlucHV0IHBh
cmFtcy4NCj4gPiA+ICsgKiBAc3JjX2ltZ19hZGRyOiBTb3VyY2UgaW1hZ2UgYWRkcmVzcy4NCj4g
PiA+ICsgKiBAc3JjX2ltZ19hZGRyX3V2OiBTb3VyY2UgaW1hZ2UgYWRkcmVzcyBmb3IgVVYgcGxh
bmUuDQo+ID4gPiArICogQGZkX291dDogRmFjZSBkZXRlY3Rpb24gcmVzdWx0cy4NCj4gPiA+ICsg
KiBAYXR0cl9vdXQ6IEF0dHJpYnV0ZSBkZXRlY3Rpb24gcmVzdWx0cy4NCj4gPiA+ICsgKiBAZmxk
X291dDogQXJyYXkgb2YgZmFjaWFsIGxhbmRtYXJrIGRldGVjdGlvbiByZXN1bHRzIGZvcg0KPiA+
ID4gbXVsdGlwbGUgZnJhbWVzLg0KPiA+ID4gKyAqIEBpcnFfc3RhdHVzOiBJbnRlcnJ1cHQgcmVx
dWVzdCBzdGF0dXMuDQo+ID4gPiArICovDQo+ID4gPiArc3RydWN0IGFpZV9lbnFfaW5mbyB7DQo+
ID4gPiArCV9fdTMyIHNlbF9tb2RlOw0KPiA+ID4gKwlfX3UzMiBzcmNfaW1nX2ZtdDsNCj4gPiA+
ICsJX191MzIgc3JjX2ltZ193aWR0aDsNCj4gPiA+ICsJX191MzIgc3JjX2ltZ19oZWlnaHQ7DQo+
ID4gPiArCV9fdTMyIHNyY19pbWdfc3RyaWRlOw0KPiA+ID4gKwlfX3UzMiBweXJhbWlkX2Jhc2Vf
d2lkdGg7DQo+ID4gPiArCV9fdTMyIHB5cmFtaWRfYmFzZV9oZWlnaHQ7DQo+ID4gPiArCV9fdTMy
IG51bWJlcl9vZl9weXJhbWlkOw0KPiA+ID4gKwlfX3UzMiByb3RhdGVfZGVncmVlOw0KPiA+ID4g
KwlpbnQgZW5fcm9pOw0KPiA+ID4gKwlzdHJ1Y3QgYWllX3JvaV9jb29yZGluYXRlIHNyY19yb2k7
DQo+ID4gPiArCWludCBlbl9wYWRkaW5nOw0KPiA+ID4gKwlzdHJ1Y3QgYWllX3BhZGRpbmdfc2l6
ZSBzcmNfcGFkZGluZzsNCj4gPiA+ICsJdW5zaWduZWQgaW50IGZyZXFfbGV2ZWw7DQo+ID4gPiAr
CXVuc2lnbmVkIGludCBmbGRfZmFjZV9udW07DQo+ID4gPiArCXN0cnVjdCB2NGwyX2ZsZF9jcm9w
X3JpcF9yb3AgZmxkX2lucHV0W0ZMRF9NQVhfRlJBTUVdOw0KPiA+IA0KPiA+IEFib3ZlIGluZm9y
bWF0aW9uIGlzIHNldCBieSB1c2VyIHNwYWNlLCBzbyBkcml2ZXIgaXMgbm90IG5lY2Vzc2FyeSB0
bw0KPiA+IHJldHVybiB0aGVzZSBpbmZvcm1hdGlvbiBiYWNrIHRvIHVzZXIgc3BhY2UuDQo+ID4g
RHJvcCB0aGVzZS4NCj4gPiANCj4gDQo+IFRoaXMgaXMgdGhlIFY0TDIgZW5xdWV1ZSBzdHJ1Y3R1
cmUsIHdoaWNoIHJlcXVpcmVzIGluZm9ybWF0aW9uIHNlbnQNCj4gZnJvbSB1c2VyIHNwYWNlLiBJ
dCBjYW5ub3QgYmUgZHJvcHBlZDsgb3RoZXJ3aXNlLCB0aGUgRkxEIGlucHV0IHdpbGwNCj4gbm90
IHJlY2VpdmUgZGF0YSBmcm9tIHRoZSB1c2VyLg0KDQpJbiBzdHJ1Y3QgdjRsMl9jdHJsX2FpZV9w
YXJhbSwgeW91IGhhdmUgYWxyZWFkeSBkZWZpbmUgdGhlc2UgcGFyYW1ldGVyLA0Kc28gaXQncyBu
b3QgbmVjZXNzYXJ5IHRvIHNldCB0aGVzZSBwYXJhbWV0ZXIgYnkgdHdvIGludGVyZmFjZSB0byBk
cml2ZXIuDQpTbyBkcm9wIHRoZXNlLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gPiA+ICsJX191
MzIgc3JjX2ltZ19hZGRyOw0KPiA+ID4gKwlfX3UzMiBzcmNfaW1nX2FkZHJfdXY7DQo+ID4gDQo+
ID4gSWYgdXNlciBzcGFjZSBwcm9ncmFtIG5lZWQgdG8gYWNjZXNzIHNvdXJjZSBpbWFnZSBidWZm
ZXIsIGl0IHNob3VsZA0KPiA+IG1hcCBpdCBpdHNlbGYuDQo+ID4gRG8gbm90IHBhc3MgdGhpcyBh
ZGRyZXNzIGluZm9ybWF0aW9uIGZyb20gZHJpdmVyLg0KPiA+IERyb3AgdGhlc2UuDQo+ID4gDQo+
IA0KPiBUaGlzIGlzIHdoZXJlIHRoZSB1c2VyIHByb3ZpZGVzIHRoZSBhZGRyZXNzZXMgb2YgdGhl
IFkgYW5kIFVWDQo+IGNvbXBvbmVudHMgb2YgdGhlIGltYWdlIGZvciB0aGUgQUlFIHRvIHVzZS4N
Cj4gDQo+ID4gPiArCXN0cnVjdCBmZF9yZXN1bHQgZmRfb3V0Ow0KPiA+ID4gKwlzdHJ1Y3QgYXR0
cl9yZXN1bHQgYXR0cl9vdXQ7DQo+ID4gPiArCXN0cnVjdCBmbGRfcmVzdWx0IGZsZF9vdXRbRkxE
X01BWF9GUkFNRV07DQo+ID4gDQo+ID4gVW5pb24gdGhlc2UgdGhyZWUgc3RydWN0dXJlIGJlY2F1
c2UgaGFyZHdhcmUgd291bGQgd29yayBpbiBvbmUgbW9kZQ0KPiA+IGluIG9uZSB0aW1lLg0KPiA+
IA0KPiA+ID4gKwlfX3UzMiBpcnFfc3RhdHVzOw0KPiA+IA0KPiA+IFVzZXIgc3BhY2UgcHJvZ3Jh
bSBzaG91bGQgbm90IHByb2Nlc3MgaXJxX3N0YXR1cy4NCj4gPiBTbyBkcm9wIHRoaXMuDQo+ID4g
DQo+IA0KPiBUaGUgaXJxIHN0YXR1cyBpcyBwcm92aWRlZCBmb3IgdXNlcnMgdG8gY2hlY2sgdGhl
IGN1cnJlbnQgc3RhdHVzIG9mIHRoZQ0KPiBBSUUuIFVzZXJzIG5lZWQgdG8gdXNlIGl0IHRvIG1v
bml0b3IgdGhlIEFJRSBzdGF0dXMgaW4gb3JkZXIgdG8gcGVyZm9ybQ0KPiBzb21lIGN1c3RvbSBv
cGVyYXRpb25zIGluIGFkdmFuY2UuDQo+IA0KPiA+ID4gK307DQo+ID4gPiArDQoNCg==

