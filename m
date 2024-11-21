Return-Path: <linux-media+bounces-21719-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5793D9D480D
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 08:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5328B223C4
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 07:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACC01C7B63;
	Thu, 21 Nov 2024 07:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bZhRHhgo";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Uwq+oHTU"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8829D158D87;
	Thu, 21 Nov 2024 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732173072; cv=fail; b=NmpOlIaHAtOF3pZ9EGRPrb4MLsZOFXbLIXdU57u4Q9Thh/o4OYuOrIu8tbzAz0Vwl9y11g26dlcd1P8/ZkEmh7AXrkU5YcwJbjyQzA3ObcBhi645b4shw05dgtiz7pxf80xrAf6+3meXBPOmkDNNRvRAk+YOPVHENn7TbANsj9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732173072; c=relaxed/simple;
	bh=EA5sbNnAljm3CHNg0NYXLestTqpEB2kDKmgVM0zqiJ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L1tu7LCnlR7OWmYi8AXpWlcWwI9M+qPWbZoTZQA+prvRAxzOqsueZgQqlUpTjEB5WoYg78ZmYVFJV+Y7rXc2nlYYWk7uxsq3KPjmfkSaVMtpkwbEuIqNPHcTRZ6x3V3ua+/Cwd1HmGu/zrcQW8P2XxQBwgpom7DggR/iPOMFsrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bZhRHhgo; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Uwq+oHTU; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c300441ea7d711ef99858b75a2457dd9-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=EA5sbNnAljm3CHNg0NYXLestTqpEB2kDKmgVM0zqiJ4=;
	b=bZhRHhgoJp3tKuz9ZIOHUndArzPMkByu4IocSfvSjebz73Q9kuEC+9+swatwO+xBu8SGknKMMoLha89vkPUoHPDC15mr/ggub+VjbPPAsC8dvhJxlWjTkfVy8Y2K7xYCnb5YjYGyM3QympbFW2akY6LwsEk+lwzGuqppVXoe44g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:03c35b17-4e84-42ae-80c3-29c17096001f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:ee7229b9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c300441ea7d711ef99858b75a2457dd9-20241121
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2067178432; Thu, 21 Nov 2024 15:11:00 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 15:10:59 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 15:10:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T27S4Vfl5w3UV0e2ZfSW84Q1Dv3nUk203wO46nmNvxoApQOCvzZyE/waKShS/T2HOpmrFpoLF/lkbn1kH76VlTYUo0OxQYVaXwhizcMCW6EhpybpwfTB0BLirIsSk1VtjlwdW99z63jPQRYwE0aBUB0WokwPrzLNVyyVmpqgyg2fSM1nznp0pl6ePfSsT9Xo5v4+0Kb1U35Q/jVz7sRQBEa+CyUyOb21/Qbc8Wvc+ZLICG/76JZ33G7p5C9L5u7KRyl1u+nce8eXIKx9WAq1uLT5Lh4fBAvY/27fS1lClSptnr6D1IldXHxrnJJbyS74/76aG6FifXi81gJ0GOaQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EA5sbNnAljm3CHNg0NYXLestTqpEB2kDKmgVM0zqiJ4=;
 b=JG97I1+7wep880nDxXO4/NkITRu2cio3OcyygsyIHVqxKN0tIrFl1Y0+EsIM5JLdAtIEiLQJrnrzjoTQkNgnDRvChlDgO6/cIkLoxCuGKXpP+Qjr84/VpkbbXE0JmVVD0bnI0V3teLQcYSxwoD5G5XPxrjquxne71nixVW/uCy7EPcWnKlJL+qYs7eJA/agKTmECjCnebcpqMQ9w8EflGIdwGpU76reHNJ/xYSnN62ZXhU3VMdi9To0VG7tPLuOYXkhhhr7sqnuk6BJlfnm0rMXpMAjfI8nsXdmzOLowww6LB8JI++ZTFzyspwtXQv3qEtGvKt+6uFkDNLCJKMdsKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EA5sbNnAljm3CHNg0NYXLestTqpEB2kDKmgVM0zqiJ4=;
 b=Uwq+oHTU6qEkOWbA3vrWZQ1WcPKUkXVgM6xA8IBcEPV8SuSX+O8+FFcnayAgY1x96bz7XTciU+FzD6xY6aA0I3XhCzaaYHEzMqH6xTOnbYrQ6qpExstsRAc/P5qqRS5K5sbFI+IlnOutnjgVCzJwWjPPJ8xtsjKPkJ2SySN8INg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8709.apcprd03.prod.outlook.com (2603:1096:101:231::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Thu, 21 Nov
 2024 07:10:56 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Thu, 21 Nov 2024
 07:10:55 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
	<Moudy.Ho@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 4/8] soc: mediatek: mtk-cmdq: Add unsupported subsys ID
 programing flow
Thread-Topic: [PATCH 4/8] soc: mediatek: mtk-cmdq: Add unsupported subsys ID
 programing flow
Thread-Index: AQHbO83f8Xgq0HinZk+EoubT15Sx27LBSDwAgAAJKgA=
Date: Thu, 21 Nov 2024 07:10:55 +0000
Message-ID: <89d7718e29dd7ec80a2b457bca9a6f9cae888bac.camel@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
	 <20241121042602.32730-5-jason-jh.lin@mediatek.com>
	 <f637f72960e84efb88dc6ed8482ea7a0d6bfcd25.camel@mediatek.com>
In-Reply-To: <f637f72960e84efb88dc6ed8482ea7a0d6bfcd25.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8709:EE_
x-ms-office365-filtering-correlation-id: 9494b4df-5074-4c03-317c-08dd09fba484
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZVdHNWRiVXBSVmpNNmtjWExmRFZ6bHdBMmlrc2FmU2tmdjFIcmJ6WE1uSklh?=
 =?utf-8?B?RHFQdUVjTVVZeXN6OE8rVVRUOS9RSEhzcWw2ekFxRVpCMGNGUW4zVWxUc0pt?=
 =?utf-8?B?c0MyaC9hN2I5akRhYkM0cDFjWFJ5bXByY2krcVp3aUE2VUppNFNHdEYxcXRt?=
 =?utf-8?B?SHBkazRpZGRmV2UyV2VxRDg1c2RoOUwxRzZ4bXkyMGV4QytWMWhKdThWc3Fs?=
 =?utf-8?B?aHVQTXBkWWNLMjVPdTZ3VEJMS20wT3c0WU8yTENyNUExUzFQRmlDZEdWRHN6?=
 =?utf-8?B?SmF4YWdpUVNWdXhRK2M2MkVUSDZoTG11Nnc0dTAzWVVhTnJXNHpndEpmWFIr?=
 =?utf-8?B?bzFubzFNc0hjOCt2Q2dhZFFtbkllbU1IZGFsUnZPTHAxbzluL3IxaWFjbGEx?=
 =?utf-8?B?WDlhZ2drSDJNblVYdlBjUjMvbFMvZWpJWXQ5L0tVdVA0YVBRNXdTUnRZVndY?=
 =?utf-8?B?MWlFRElhaGluYTNnYThyN09Ddy9mZ0NYTkZ6R0tJZVdIMFJlSW5iTDFCdTlU?=
 =?utf-8?B?cXQ2SWM0b3c3d3FXbFdmK05wNkdrUjRyWTlQUGlaZFEwY3R0Y3o1d0xNbi9Y?=
 =?utf-8?B?ZkZMRW9DYm54SnBzZkJ1dGN3bTdDclZiRUc2NzhtNlZ4VGZBZGFLMU5vendt?=
 =?utf-8?B?d0JTelkwYzZlb2t3UllvK0FKR1hiT3lYa1k5WWVlM3loUE93WUJ0TlFFbGJn?=
 =?utf-8?B?WFZBT2ZNckl1b0pWbXZ2M0Y4SnVMUXN6Q0NpblVqZjhwTGloaHpoOFArSmJ6?=
 =?utf-8?B?ZDBJd3ZqMmJ2QUFrRE56QlN0cnJTdmFyT2hrU2RiRUlDNnlZb2F3akE5a1o1?=
 =?utf-8?B?QnZvekJTeE95cVVQanhBdnBiUHBVdzVRNTd2L2N6L2J4b0t0OEJ6c01uOWx4?=
 =?utf-8?B?Z21DamtyVnQwZlp3bUQ3dzFLWWt3VzB0dStKZG9rVnF5RE1jUkNMa3cweGFU?=
 =?utf-8?B?bjlHV3JCS2c4dG14US9DWjIwdWhYb0tSNmlER0tmVEpEVlR5bWMrSjdpVXVP?=
 =?utf-8?B?aU50bHN1bTAzbGVsY20vVHFUMytQanB6V0tOYTVpYkN5N3VBL3hnYnk2TEFt?=
 =?utf-8?B?cm1aOXBBTE5yVmdwdTNKTDB0SnA0VWd4T1R0OUxzbDYxOEE4TjB0bTVMWjVu?=
 =?utf-8?B?alNKTEhpVE8yRTgzNEhMejBNRmU5bXduWlc4WWRQUUhkMCtnYUkya2kwS1Qw?=
 =?utf-8?B?aTNiMEdhdVE5SnZ6cUVFQ0llT00rQXlxNEhqNzZ6RE53WTFMbXVyRFRxUE1B?=
 =?utf-8?B?Y3lacDFPbmRBNXArZkRtVjFBbXJBVCtKZzk0bzBXN0I4eE0zU0x0RENWMFhj?=
 =?utf-8?B?QU9tdC8xN0lTM0FEbENVenIxNC9vdVBwMnphczY4WWh0aXJxU3lPait5RFJr?=
 =?utf-8?B?a3lUSVJHdHRZeEpSZjNrTHUyTmEvSjJ1OXoyQWRObGl4OWlJRU9zNG92Nlpq?=
 =?utf-8?B?d25QQmlleDBDMzAydm53WjVVZU43NmJQcnBPOFEvNGVTWEd0ZDM1TEp2b09v?=
 =?utf-8?B?a2g3VEMzK3lvZWxMZGZBanJ1L2pweVVWaVlHQzZkam9YcmNiTGxGeC84QUFZ?=
 =?utf-8?B?TStaTzYyeWJ3a0phR3RKU2Z1T1puamx6QzRNU0tkcFV0RVRFenFORGdxenF1?=
 =?utf-8?B?ZG5VVEdlRUJFZWh6R0xQS1dKOFRVd3NTWjd0ZHhMODBEcjk4bDc2MTJ2SGRI?=
 =?utf-8?B?M1VTYzdHVGJDUmNOL3hZTndiSnVEdlo2eXJMTCtvK3R2QmNZRjRxTytSYzdD?=
 =?utf-8?B?THVZT3B0RlZaSEtzN25vcnMvZWxYWG11cVU2QngrVE1vcWtsSXk5aC83cmlX?=
 =?utf-8?Q?0j6Nj7dYhJvfz4pv3b7ETXhs8v+VbRMKunAPQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WktYcW1WcXB2SDBUZUFEOFJNVTYzZFArWURsajMycDQvVW9zU0VVQkVQL0da?=
 =?utf-8?B?bmtRem1rTU82YkQ4UGlkWmhzZDNSQlphR1l0Sy91ZUo1cGYvQmJjOWxSTmNJ?=
 =?utf-8?B?VDIwSE1MT3VNdERjZjl2SEo5dUpvcXZZT2hFeVNGc0hlQjhCZjFDMGVuaFZI?=
 =?utf-8?B?NjM4MHhvTktQRVFkNGVsMmIrbG12OTRiZE9PLzdMNkczU3RMbE5Xc2hnNjQx?=
 =?utf-8?B?a1pRV1pKMFlVa3hLUVFUelNyM2c2RWJJTmJBOFZ2YW9qWHA1UHZwQVVZc01a?=
 =?utf-8?B?NVhyR1lqTkRhZVNwQnQ5SG9YYkNRSkNoaUVpZ21QaEZSVGNuZFBvS2xHS05V?=
 =?utf-8?B?QzBrWWFBQkJMdXRobkpPeFJNUmUyUkc4VnBvNmw2K0R3bHd3aHNtcSttb3d5?=
 =?utf-8?B?TXVoUU5MdFk4SjFjUkdEcjEvNThINE5QMDRMeXI1S0ZnWHJ3RWphSWFIWE1n?=
 =?utf-8?B?RHQ3a2VZTnZNcDVkTXlES3VZb0RLYXIvY1A3enJnSzIyalVGMzg4WnluYWpO?=
 =?utf-8?B?Sk1ncWhSb3dQUUpMNHVaTEZqVDNHRVJDeUZHcnFaVVlVUzNERkJuWUR6NnBN?=
 =?utf-8?B?clcrc0RCZ1RuUG9PM05VVlJiNnBlMUN5NU5DeHFKUHMvdXNuZEFoVjVQVHR1?=
 =?utf-8?B?Szg5aEdsZGNEUktEcmhZYTMzNDJOdEF3R3J3dC9wRy8xc2N4eFBQREE5RUlz?=
 =?utf-8?B?TDY4K05XMDlCZ21CQlZHWFZYQmowRjlvaUhPbnZmdVFNemJTaVIxTW5jck1s?=
 =?utf-8?B?UmNKMzAvVjIwLzZpKytLZW1HazMwakdjaXZBajJ3YTkzZ1B6Y3VFUzJrcDZR?=
 =?utf-8?B?SW1EbUlyWW9SY0NjRStXNzl4VU1LZVo0c0JWM3FzRUZOUWpQSXlvdUF2S001?=
 =?utf-8?B?MUZJNWlOTVM2a2YrbE9nK1RhZldESkpvNStwaHgzSUQ5REhtMDJLWUJoeHZm?=
 =?utf-8?B?RW03OFF4RTR2Q09LdEJyUm9ORDVhVjBHTU54ZkxCRHF5ZFl5dHBVZUR6ZXJj?=
 =?utf-8?B?NVRaSjYzTmVzZnNSYXovOWRUK2s3VjFmdzZSQTNtTHlnMTBnTVNsblJydnph?=
 =?utf-8?B?Z1o3MFpYdnYyZ0duUncrL0QvQnI2aXRyTXZZWkpKMEd3djdzSTUvalB0NzRm?=
 =?utf-8?B?cmRiSHRjbWlhS2Q5bUVPOVB3emhVR0NVWWJuRHRjcndvWEcvMzU5WnFwL3Z2?=
 =?utf-8?B?U0NwVkQ3QW1Jck9HNUJwamU4TUhHUWxxNHF5d3MxS1V5bnlGTzF4dU1jT3Q4?=
 =?utf-8?B?MGtPNnUrNjg3ZFJjS1RTWXZ1L08ra1AyTjNLeXVESk4zVUZJdngxSktWb0Rt?=
 =?utf-8?B?UjJlU25IL2Rta1F6MXJWMmIxV1pZNXhUTVE2MGo5KzNpYnZzUCtBWDhjTlJl?=
 =?utf-8?B?UVJpR3Q3QTUzTU45b3M2VGlzVjdHWXBKcmdrMkh6NTZtNEUzOEo5cUJkL0lS?=
 =?utf-8?B?cFdicjZSaHhFM0lza2lWTFNJOFBMYnltK3JsYjNIREV0QkV4czJUMkRCR3k0?=
 =?utf-8?B?OVJpNW1KRjdNS0dORzVSaVdmNUJiOWFvYkxzWlBEWFpzRFRsbmdQRmtEVWFT?=
 =?utf-8?B?djl6bnhkd1NPUTZSckhEN1hmcXpaaTIxRGZUeDhkVFBRUnh4K3J6Wks3bW45?=
 =?utf-8?B?SEw4NzRjWkFldlRQSFhaVm5DakMyaVBhcjZ0ZEgrbTZZdmg3dk9TckZEWk95?=
 =?utf-8?B?YXZWSi9rZ296U00zWElkNTFPSHFWY1FmcE1TSlE4MlE2cDFwMkZHY3FEWXBM?=
 =?utf-8?B?K2VCVFVucUMxaGVpTUJYNGZmLzdNa0NoLzBkSEVxVXFjcHlualJOZ3hCQ24r?=
 =?utf-8?B?Q0NvZ0R5dStTcUtmN0UyaW50emM5L2JuUENTUFlENzh0anVIL3BYV0l6dXlI?=
 =?utf-8?B?bmY2QTdaeWNvQlJmcUNPTXVBUVdhZTBEMEpvV2QrRHUwczFlSHYwQVd3amdI?=
 =?utf-8?B?VGR0NGxhMnZmSnU4RkhHa0hBR3BYczc5ekU2Z3VobkJTNFVSMFcxNFRLVGNv?=
 =?utf-8?B?Tk9PQUd2WFluQ3BBVkRrU3hDeWpqSjl2QlVqeStmMWlicGZHY3NHdjU0WDdO?=
 =?utf-8?B?THY3UzBIcGt5VkVpdjl1ZVdMbDlKa0pOQUVxU0NXOWEyTDlvSko2QkJqZjd0?=
 =?utf-8?Q?RmAxoyPLqWzyJ2+Qxg8vH0Lml?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B8D8333E20C5F4F9E323AB6A08F5750@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9494b4df-5074-4c03-317c-08dd09fba484
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 07:10:55.7739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +jeuZbNer85H3N98Xdcu8mO1sAHwupYelfGxpAg69Wxqj/Dr9jhRejM7eDh/Fa8fW3LMwdUdpnPUSgJELZIGSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8709

SGksIEphc29uOg0KDQpPbiBUaHUsIDIwMjQtMTEtMjEgYXQgMTQ6MzggKzA4MDAsIENLIEh1IHdy
b3RlOg0KPiBIaSwgSmFzb246DQo+IA0KPiBPbiBUaHUsIDIwMjQtMTEtMjEgYXQgMTI6MjUgKzA4
MDAsIEphc29uLUpILkxpbiB3cm90ZToNCj4gPiBXaGVuIEdDRSBleGVjdXRlcyBpbnN0cnVjdGlv
bnMsIHRoZSBjb3JyZXNwb25kaW5nIGhhcmR3YXJlIHJlZ2lzdGVyDQo+ID4gY2FuIGJlIGZvdW5k
IHRocm91Z2ggdGhlIHN1YnN5cyBJRC4NCj4gPiBGb3IgdW5zdXBwb3J0ZWQgc3Vic3lzIElEIGhh
cmR3YXJlLCB0aGUgcGh5c2ljYWwgYWRkcmVzcyBuZWVkIHRvIGJlIHVzZWQNCj4gPiB0byBnZW5l
cmF0ZSBHQ0UgaW5zdHJ1Y3Rpb25zLg0KPiA+IA0KPiA+IEFkZCB0aGUgcGFfYmFzZSBpbnRlcmZh
Y2UgdG8gdGhlIGluc3RydWN0aW9uIHByb2dyYW1taW5nIGZsb3cgZm9yIHRoZXNlDQo+ID4gdW5z
dXBwb3J0ZWQgc3Vic3lzIElEIGhhcmR3YXJlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEph
c29uLUpILkxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gDQo+IFtz
bmlwXQ0KPiANCj4gPiAtaW50IGNtZHFfcGt0X3dyaXRlKHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1
OCBzdWJzeXMsIHUxNiBvZmZzZXQsIHUzMiB2YWx1ZSkNCj4gPiAraW50IGNtZHFfcGt0X3dyaXRl
KHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1OCBzdWJzeXMsIHUzMiBwYV9iYXNlLCB1MTYgb2Zmc2V0
LCB1MzIgdmFsdWUpDQo+ID4gIHsNCj4gPiArCXN0cnVjdCBjbWRxX2NsaWVudCAqY2wgPSAoc3Ry
dWN0IGNtZHFfY2xpZW50ICopcGt0LT5jbDsNCj4gPiAgCXN0cnVjdCBjbWRxX2luc3RydWN0aW9u
IGluc3QgPSB7DQo+ID4gIAkJLm9wID0gQ01EUV9DT0RFX1dSSVRFLA0KPiA+ICAJCS52YWx1ZSA9
IHZhbHVlLA0KPiA+ICAJCS5vZmZzZXQgPSBvZmZzZXQsDQo+ID4gIAkJLnN1YnN5cyA9IHN1YnN5
cw0KPiA+ICAJfTsNCj4gPiAtCXJldHVybiBjbWRxX3BrdF9hcHBlbmRfY29tbWFuZChwa3QsIGlu
c3QpOw0KPiA+ICsJaW50IGVycjsNCj4gPiArDQo+ID4gKwlpZiAoIWNsKSB7DQo+ID4gKwkJcHJf
ZXJyKCIlcyAlZDogcGt0LT5jbCBpcyBOVUxMIVxuIiwgX19mdW5jX18sIF9fTElORV9fKTsNCj4g
PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZiAoY21kcV9zdWJz
eXNfaXNfdmFsaWQoY2wtPmNoYW4sIHN1YnN5cykpIHsNCj4gDQo+IEkgd291bGQgbGlrZSB0byBo
YXZlIGEgbmV3IEFQSSBmb3Igbm8gc3Vic3lzLiBNYXliZSBjbWRxX3BrdF93cml0ZV9wYSgpLg0K
PiBJZiBzb21lIGNsaWVudCBkcml2ZXIgYWx3YXlzIGhhdmUgc3Vic3lzLCBpdCBjb3VsZCB1c2Ug
Y21kcV9wa3Rfd3JpdGUoKS4NCj4gSWYgc29tZSBjbGllbnQgZHJpdmVyIGhhdmUgbm8gc3Vic3lz
LCBpdCBjb3VsZCB1c2UgY21kcV9wa3Rfd3JpdGVfcGEoKS4NCj4gVGhpcyB3b3VsZCBwcmV2ZW50
IGZyZXF1ZW50bHkgY29uZGl0aW9uYWwganVtcCBpbiB0aGlzIGZ1bmN0aW9uLg0KPiBJZiBzb21l
IGNsaWVudCBkcml2ZXIgaGF2ZSBzdWJzeXMgaW4gc29tZSBTb0MgYW5kIGhhdmUgbm8gc3Vic3lz
IGluIG90aGVyIFNvQywNCj4gbGV0IHRoZSBjb25kaXRpb25hbCBqdW1wIGhhcHBlbiBpbiB0aGF0
IGNsaWVudCBkcml2ZXIuDQo+IChUaGUgY2xpZW50IGRyaXZlciBjb3VsZCB1c2UgJ2xpa2VseScg
b3IgJ3VubGlrZWx5JyB0byB1cHRpbWl6ZSkNCj4gSW4gdGhlIHZpZXcgcG9pbnQgdG8gbGV0IGNs
aWVudCBkcml2ZXIgaGF2ZSBmaW5lLWdyYWluZWQgY29udHJvbCwNCj4gbWF5YmUgY2xpZW50IGNv
dWxkIHVzZSBjbWRxX3BrdF9hc3NpZ24oKSBhbmQgY21kcV9wa3Rfd3JpdGVfc192YWx1ZSgpIHRv
IGFjaGlldmUgdGhpcyBzbyBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gaW52ZW50IG5ldyBBUEkuDQoN
CkZvciBhIGNsaWVudCBkcml2ZXIsIHRoZSBoaWdoIGFkZHJlc3MgaXMgdXN1YWxseSBhIGNvbnN0
YW50IHZhbHVlLg0KU28gdGhlIGNsaWVudCBjb3VsZCBoYXZlIGNvbW1hbmQgbGlrZToNCg0KY21k
cV9wa3RfYXNzaWduKHBrdCwgMCwgQ01EUV9BRERSX0hJR0gocGFfYmFzZSkpOw0KDQpjbWRxX3Br
dF93cml0ZV9zX3ZhbHVlKHBrdCwgMCwgQ01EUV9BRERSX0xPVyhvZmZzZXQxKSwgdmFsdWUxKTsN
CmNtZHFfcGt0X3dyaXRlX3NfdmFsdWUocGt0LCAwLCBDTURRX0FERFJfTE9XKG9mZnNldDIpLCB2
YWx1ZTIpOw0KY21kcV9wa3Rfd3JpdGVfc192YWx1ZShwa3QsIDAsIENNRFFfQUREUl9MT1cob2Zm
c2V0MyksIHZhbHVlMyk7DQpjbWRxX3BrdF93cml0ZV9zX3ZhbHVlKHBrdCwgMCwgQ01EUV9BRERS
X0xPVyhvZmZzZXQ0KSwgdmFsdWU0KTsNCmNtZHFfcGt0X3dyaXRlX3NfdmFsdWUocGt0LCAwLCBD
TURRX0FERFJfTE9XKG9mZnNldDUpLCB2YWx1ZTUpOw0KY21kcV9wa3Rfd3JpdGVfc192YWx1ZShw
a3QsIDAsIENNRFFfQUREUl9MT1cob2Zmc2V0NiksIHZhbHVlNik7DQoNClRoaXMgd291bGQgcmVk
dWNlIHRoZSBjb21tYW5kIHNpemUuDQpHQ0Ugd291bGQgZXhlY3V0ZSBtb3JlIHF1aWNrbHkuDQoN
ClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBDSw0KPiANCj4gPiArCQllcnIgPSBj
bWRxX3BrdF9hcHBlbmRfY29tbWFuZChwa3QsIGluc3QpOw0KPiA+ICsJfSBlbHNlIHsNCj4gPiAr
CQllcnIgPSBjbWRxX3BrdF9hc3NpZ24ocGt0LCAwLCBDTURRX0FERFJfSElHSChwYV9iYXNlKSk7
DQo+ID4gKwkJaWYgKGVyciA8IDApDQo+ID4gKwkJCXJldHVybiBlcnI7DQo+ID4gKw0KPiA+ICsJ
CWVyciA9IGNtZHFfcGt0X3dyaXRlX3NfdmFsdWUocGt0LCAwLCBDTURRX0FERFJfTE9XKG9mZnNl
dCksIHZhbHVlKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXR1cm4gZXJyOw0KPiA+ICB9DQo+
ID4gIEVYUE9SVF9TWU1CT0woY21kcV9wa3Rfd3JpdGUpOw0KPiA+ICANCj4gDQo+IA0K

