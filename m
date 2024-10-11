Return-Path: <linux-media+bounces-19381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D8999B1A
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 05:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEE91283B77
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 03:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E881F4FAA;
	Fri, 11 Oct 2024 03:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Waz8UA8E";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="NxwRg2Cq"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BD61C6F45;
	Fri, 11 Oct 2024 03:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728616819; cv=fail; b=Q82LjTFIdg1tmWqF62H8g04gOPp03itcx2+6F63EOO0MLWJK8S4iTs4DsvZHugu0V313Mk1Wl/DJqGBOH4H6CHfqpJgc/G6OHLvVcB5ED6rssFabGn0dcglWLrHcvgyKnifXj5Insa6xvUKwCw1ipWfU35U5YKPxqjzJPSDERMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728616819; c=relaxed/simple;
	bh=3cD/G3iECodoaxYyu1IYkApg0sCgmNbDd2LE38TJKd8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MihJHwOYfc3nKnfwvEmuFPsyFpzy4b2F3qJJ6AzAo6Cfue/e9xx1P4LEiEcxZFusjG/4aS8O8R3U7ID/BAdn1JpAJwVRiebTTiSW8zTP0QmPyga+TCVJhaxeJLvSxc0zryAfamphv4gDckiJQO7n6V/08TNIV+KfzxSeMQ64siE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Waz8UA8E; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=NxwRg2Cq; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b93c73bc877f11ef8b96093e013ec31c-20241011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3cD/G3iECodoaxYyu1IYkApg0sCgmNbDd2LE38TJKd8=;
	b=Waz8UA8Ecs6IzzEGy/epy2E2zoaoy0T/ilmTgxC5yJ9zDjrmBcDVU/hITLBPfFeGQo09aSrHeiebdtDCNUqn6ZaCNBGKAi4UJg+LsrjBA4MwzDJDzxbBFEUDxjkD0b32vC//5pFgJZmCxBOPg8xGeOp8Dhx/msSwxKwjcx8yGCg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:5a598a67-d47f-4ea9-9d8e-ed644eced5f1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:066d9d26-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b93c73bc877f11ef8b96093e013ec31c-20241011
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 449531233; Fri, 11 Oct 2024 11:20:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 10 Oct 2024 20:20:06 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 11:20:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/08Bp4u2u7gXx06C9aJiq351Ddlbn0/a9rbi44qu3WAKVnoWMsOmeZ1VjAQQSkbw4vKxvSiGqWC0mjHQwUEigwQOtKDKi5mzGjz9tFe7/0muBt8KltWwdcZA1BGjXJ92p/Mm6pNGhXlcd87WoLnedeVdgX+iYXcQKYfuncR1wviY/WuZzcZBCU2Yc+urih1Y/qu/DdAnhlAtjJN0pmq3yGKLYGC4RTw7min8QnmGZE/QfYf5p6vryp1BGzNQmvNlbHnU+3rjuSZI640VDMapmW9qL9BEP288dCOx8594V2soG+NYgtghOO6PruPl/83Cfl5edBldXlo5avOqPjhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cD/G3iECodoaxYyu1IYkApg0sCgmNbDd2LE38TJKd8=;
 b=C4h6rNk5sGflbboDYmh5a7WNoIzn0tooEBIBagJUxGBGOR3/7xHx4v9abvtYHa6WLIQuesmzu0j0xQnZG5boHou3KsOkTljQzuqkTVVPAP75TyKLaNbZ5N5vxBG88YDE4GMT5LWQfWE43uNvvH7a3CvlLBRLt5TNtl3vveQCd1GqE6c1aRUpKwA5TX5rLkTU2xKBo+BQzyrDSMhcg9h2YEoQ6E7S//pqOtKy8qG77iLpCXs+EloBsRSUDsH1ChV0dPdNuTBqGPSjDCRESAyrBBJrVuL107MiF2tRtMnJQ3pbCFlrYHulGSnrvtjfR5mTf+8V9x9RN/EmBDCm/7mpeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cD/G3iECodoaxYyu1IYkApg0sCgmNbDd2LE38TJKd8=;
 b=NxwRg2CqzrLEtTXU272LrgDXWeVZds1iO6kAZwn4kGjJJNojPxNsuJPZoeYVnkXbLw/FnUXCeuYIXTXox9Ek75p+yYaLqFHc0cXFWoWRs2mj3yPoRkqQ2aeRmFXO9efo0Qwk7czQrnW0vys/BlReHC7I6LWXArIYte5ys00zQLQ=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8462.apcprd03.prod.outlook.com (2603:1096:405:6c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 03:20:03 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 03:20:02 +0000
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
Thread-Index: AQHbGkcqBeP8ybzzkkuuOw+G7YHzMbKA5FuA
Date: Fri, 11 Oct 2024 03:20:02 +0000
Message-ID: <d38e2393c648a769d7258f102b3c89b512a544d4.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8462:EE_
x-ms-office365-filtering-correlation-id: dbde3f52-2956-480d-2ef8-08dce9a39830
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TDVzOFprUlU2UTJtR2pkUStTWHdRTXNlaDA1YTFBcE4vZ1c0c2pUcmd1RW0w?=
 =?utf-8?B?aG9Bd1B3UW0yUkFOR3lJVC9FemFJVHhzRWlKYkRLaDBYMGFQZEVyZG5rMGpL?=
 =?utf-8?B?Y2xUS2NQenhFV1lMdDB0OHByS1o0bENhakIyUWRvbXdvdEZUaW1lSkhFclJp?=
 =?utf-8?B?NCtNZ1dqelUvNGRNZ1Bram91VEw5SGVTYk1wMnhqM1lWcVVJdXg3K3hvQjFQ?=
 =?utf-8?B?SWhMa1QwdjZxRFRveU82TGJ1MEtGVG9Sd0hZaU8rbTZUSnI2RkZjVVJ2M2U4?=
 =?utf-8?B?UEdyRm45UW1KSVh6aFpjQ1dGa1ZVOFRYYTFrYy9SQTRhSXJmRVNpN21ETWhZ?=
 =?utf-8?B?aWoyUnJXVFhzeU9aODZjKzdLZ3A3K2RLbGQ2SXZaaEdFUXlScEVzMmJkaDk4?=
 =?utf-8?B?ZXRjKzlDb2l2TXlOTHBabXVwdXlLcFlsUFllMW1FMFZzS2pPYkNkM2tvVVl4?=
 =?utf-8?B?VENGTnB0QmRMaFFrRnJCNHhsVExkTVRzUGN2UjBybUp1OUV2UjZyZlhvd1h6?=
 =?utf-8?B?Qzh3Y0czWExGMGVjY1RhbVAyTDJMTjdOS1UzQTdsYW15OEhmZ01nOWNweEpJ?=
 =?utf-8?B?cmtQSmpMRlRjYkZvYkswc3A3RWM3bElJZ0xYaWVkZ3dhdWkzRGRZbkNXK3lK?=
 =?utf-8?B?SUoxbDRzdzNXQXdsU25uTHpmT1pYMlMwMzUyYXFRS3NYQjNXd1NhNGtxaURv?=
 =?utf-8?B?ejVuZU51UC9rV3dpRFpCNHo2dFgxMWtzaWZPNmhMeUNBdXBLY2thNk1McWhG?=
 =?utf-8?B?UTBTNXc4blNjYWJwcWpibkwwSHYzaFUySktYeGUwTzFSdk1xZkthVDVvSUFC?=
 =?utf-8?B?NGVmTFhBdXQvYU9oUEMreDZEWE5TWEVLQ0RWanVUUm8raWJZd1FSRjl3eXBm?=
 =?utf-8?B?bGlmdXJqemUrUVZ5RmtLOHp3QkMrWE5xOVd3RFB5WmU3d0V3SE9wZFptNmFr?=
 =?utf-8?B?VDZWZ1hia0RxZ3JqY2NOZzgvbkZ6RXgrSStJYzR4aStJYnB1cklsU3lDMnh2?=
 =?utf-8?B?STM2V1pvTkVPaGx6U1Q0eUtadnQzR3prT2dsOHFVaVBoTUhzNlVIUW9scmtx?=
 =?utf-8?B?MklweklRb3ppOUZnaEFqK2toRGJOMDBITGJwUnE2TFNBOVVTS1lVOEI4WDRq?=
 =?utf-8?B?T2ZHVS9vbUJ2aUlvdmhmclRSTG03VWZXNU1oUXM2bHFjLzhuWWhXVXRNa1lq?=
 =?utf-8?B?ZFBWWHdVSUUrMDBxcXZNUCtORU84eGM4ZEVMbGJuYTRuL0o1N3p1SFF0V0tV?=
 =?utf-8?B?Y29uZUZPaFJ6RGdJWnZlcDAvdHRFRDU0QVVhZjM5SlFWNVczaUJIdXBNL2dL?=
 =?utf-8?B?RitsejlLTDBKTE0zR2hmVFFsSGFFUHJJbXV5bE1WZU5tbDFuSmViblloaE9N?=
 =?utf-8?B?Z2pkVWRITWZTZkVydHZ0Ujd3ZzFGcm9KdFJlMytKdGQxcCtHTEdvWWZ1Rk1n?=
 =?utf-8?B?WURXTkRhamk0bllvU0VKZ2dmUVZwcHN4dVVDVHR4amMrUXhEN2VFa3dsSE5l?=
 =?utf-8?B?TFVqQ3hvRE5vQ3NaMENrYWV1SU85MmxZTnFNaHZwdmlZM3Z0eGVwNEl2ckc1?=
 =?utf-8?B?U29xZjRwWkJKM0kvUXpLS3FYMGkrMnNJNk0wbjVkV2RRQUwzdlozK2k3TURo?=
 =?utf-8?B?NzNwNzdNM0pwSjFnZTZCK1BLa2NNMFVCVWdlcG55NlBqclFod2NaYzUyT0NM?=
 =?utf-8?B?cXYvVE1MSCtBZDhCckd2cCtsRXhJWEhndmFuYTQyRVZ2WlV5MzlZZXc2LzFM?=
 =?utf-8?Q?fGUQklIIit5LoP7l14=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUZoYnFVOFNucGFDZVRodHQvMmN1WUJOalB6bUNoY3FtMFB2cVdUcUVPZGp0?=
 =?utf-8?B?MlIzUURFdTR2WnpQQy9KWlA2RUx5bTZFc09VRnFzRURicDg5RVJ6OFNlOFhJ?=
 =?utf-8?B?dmhZbm5QYUw1bG9QdFh2TWlpYUxwNG1OSER1b2l3MG9qWnlhbXFwb3cxc0tz?=
 =?utf-8?B?dk5pQUFxN3g2R3daaEIwYmsvb3EvemdYbjBDbkdYSE1Ddk9DdmdhaXNReE82?=
 =?utf-8?B?S2hNaEZadCtGbWl1Q0J0QzJZek9HMFR0bjB4TXdhdVNSOGVxQWhrWlJJQlpz?=
 =?utf-8?B?Sk94U3dNaE1CVDViY3ZUNnpXRXB1NEZoUEJKcGN6eUZldTNpcDA3L2Nva2tw?=
 =?utf-8?B?bHVmcjU5b0hOdER1K0ZTZ2ZKZjhzSEdSQ0tPQjhuNXRZdUtpZzNJNmsyb002?=
 =?utf-8?B?bC9VQm5JMGNuVFdEcmpGdU1YL3J0enc4QXdwN3M1SUxIekdQY3Z4QlNKSXdD?=
 =?utf-8?B?eVpQbHlNdkpnTUtaMVJDRGpDMmZ5dWplR0d3cElHNkdjTVJqSUNuL1Rwb2pP?=
 =?utf-8?B?VUhBTGdQNm5UU29YYlR5eXRBb2x1QzVVei9sQUhreGNaL01VQno4c2lIY3B3?=
 =?utf-8?B?cFJtd1ZFcUlJM1dFYnkrTFIyR0FJTXA1VjVqUTRJV29WRVNxa3MxeWtPUlZw?=
 =?utf-8?B?SmRJYTZQUEZwdEJERTdpNlIxdzNXWDA0ZHpKS3BDNmxpYmdBZmhjR29nenJB?=
 =?utf-8?B?dzBQNjZhZXRaMG1nRnFRbE92Q2FocUdQdWhXdHJQR1RBS2tMWi83NUxpcEMx?=
 =?utf-8?B?cDI1MjhCbnN2ZlIvMUpBSnh1TU9BNGJLSUpNUmVFTXI0RHhrdTgwcmRIMVNa?=
 =?utf-8?B?VWdhM08zOXVSS0hjb0RLdTdOUWYvUkZDOGcrL3c2b2JteFJ4alc1dCtxSXVv?=
 =?utf-8?B?aG5NRmdZakdQRHJaaFRrS3k3VWNZQmZKcjkwQW43anNxaHVVOC9hd0U3aSsw?=
 =?utf-8?B?NllKUE1KdS96V1psQ1pISHcyMnNEdHpMSkxhaXpNVEZnSUx5b3J4QzZmV2R0?=
 =?utf-8?B?WDhkSzg3c3kyc0JsRzdlZGJFZWd0OXJOdlpnQXdvb2ZGU1hic1Q0U2U4SHIx?=
 =?utf-8?B?RVZwWUNnVzIzZyt5RFVra3ZZQ3JOM3ZPRkZGMFYwUitTenBFNUQxeUw1NkJs?=
 =?utf-8?B?OWhNMlZjUitCeEdHZW00VS9UVk1IZmdoV3RtQk8rZ3kyQ0lvYWFtaDhzU2ZU?=
 =?utf-8?B?QU1nRzRGWTJVRkJZTzZQYkJrT0UvYStBckNNck0rNTJxVENuRXVDOE4rbkUz?=
 =?utf-8?B?OU5Zak1XMk5IclIyQVB1dExDdTVFaGFMS0k1ckpjOHA0Njg5NlJ1aEJhUnBH?=
 =?utf-8?B?cWpzT3ZQNTl3TC93bkNzVUM1bjBwVXhSeDdZbG1LZGpuNzVkeHFkckt1T2xy?=
 =?utf-8?B?U25CUDVILzljanFxRlJwT1g4cDB4R0JwNDNtaHEvVDJmb1FhMnNlamhUQmFL?=
 =?utf-8?B?QlNZODBlTS9Ub2o5Ykw0NEtCYVdsQm94Y3lxd09KbUhKR2RQMXd5NUFPRzBx?=
 =?utf-8?B?STJIQmFrL0JvRGhRYjFNN0J0c0NyRmFMRU00MjNPVGFYenhkSkx1Lzd5eTl5?=
 =?utf-8?B?cnVQTlh2dGlGU0EraWY0U2RxVEpXTWRJaW9sRDVwbmJscDJHcVYwUTQvMXVE?=
 =?utf-8?B?QU9kWm1GSnNCKy8wbGRHM3pPMUlrUm1sT1VKLy9GQkpqbHp4bGJYQVpxZ2NF?=
 =?utf-8?B?OVEwaDkrT3kwL1RZaGxWMDdJQjVZbmV1YU11a2UvM2Z3N00xWFBUcDJxdTVq?=
 =?utf-8?B?VHN6d3VpNGxpT0FyMGI4Y0tzWnRvYjZob0M2bkRxZGwrK3p2Um1JY2ZJbVVj?=
 =?utf-8?B?eHl3TGg3bVpkS0xScnI1UHhtM0pQZnRIbUx3dllEeUdYWXpHOWRwS1VtTUlC?=
 =?utf-8?B?MVk1UzY0ZHhlRnEzVWVIQUVtMW1tQk9OaXJWVERkcWZJU1dBZEYwb0NUc0ho?=
 =?utf-8?B?VDBZdGZOdnNMWEM3MENKUzJGbXdGMHpSaUtYNkUxbW9mM3k4SEczbjZRRGFz?=
 =?utf-8?B?NVRPME9lYXY4dTdET255S01FWU5IYVhKc2xOQjc2d3hpNHByVUVZZk9RYzZ4?=
 =?utf-8?B?RnpsV2RNMjlUNTZTOGpuVkFIUDljdEh6NXNTUXd1SWV4VWxsVjArRzVCYTg1?=
 =?utf-8?Q?eIAUDZ+uvmlbeOQouK8hwF9sg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1A2BD560FC54949A53D63B249F3E980@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbde3f52-2956-480d-2ef8-08dce9a39830
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 03:20:02.1983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C1fTKbne1eQNYSyBpznHSUW/+omjHDzvAx3B8IM7QyVj0yYSAzBTo2a1aDG7qJaNyIT8zOOoqrINPgPHOO3aHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8462

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiAxLiBBZGQgY2FtZXJhIGlzcDd4IG1vZHVsZSBkZXZpY2Ug
ZG9jdW1lbnQNCj4gMi4gQWRkIGNhbWVyYSBpbnRlcmZhY2UgZGV2aWNlIGRvY3VtZW50DQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBTaHUtaHNpYW5nIFlhbmcgPFNodS1oc2lhbmcuWWFuZ0BtZWRpYXRl
ay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrL21lZGlhdGVrLHNlbmluZi55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrL21lZGlhdGVr
LHNlbmluZi55YW1sDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAw
MC4uMzdkOTQxMzhjNTU4DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrL21lZGlhdGVrLHNlbmluZi55YW1sDQo+
IEBAIC0wLDAgKzEsODggQEANCj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiArIyBDb3B5cmlnaHQgKGMpIDIwMjQgTWVkaWFUZWsg
SW5jLg0KPiArDQo+ICslWUFNTCAxLjINCj4gKy0tLQ0KPiArJGlkOiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvbWVkaWF0ZWsv
bWVkaWF0ZWssc2VuaW5mLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFqa0htcXR4T3N0NkR2
ODhSYUUtc3M5VmF4S3hGbzRGdVBsMXNtWFRFbmtpaWpVN2pTOW5rWUdCUG9McjhnNEppMmRacGJf
N0xIV3JMcEl5dTJxb1BWa0x0YTlNJCANCj4gKyRzY2hlbWE6IGh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCpfXztJ
dyEhQ1RSTktBOXdNZzBBUmJ3IWprSG1xdHhPc3Q2RHY4OFJhRS1zczlWYXhLeEZvNEZ1UGwxc21Y
VEVua2lpalU3alM5bmtZR0JQb0xyOGc0SmkyZFpwYl83TEhXckxwSXl1MnFvUGZLVkJkVHckIA0K
PiArDQo+ICt0aXRsZTogVGhlIHNlbmluZiB1bml0IG9mIE1lZGlhVGVrIElTUCBzeXN0ZW0NCj4g
Kw0KPiArbWFpbnRhaW5lcnM6DQo+ICsgIC0gU2h1LWhzaWFuZyBZYW5nIDxzaHUtaHNpYW5nLnlh
bmdAbWVkaWF0ZWsuY29tPg0KPiArICAtIFNodW4teWkgV2FuZyA8c2h1bi15aS53YW5nQG1lZGlh
dGVrLmNvbT4NCj4gKyAgLSBUZWRkeSBDaGVuIDx0ZWRkeS5jaGVuQG1lZGlhdGVrLmNvbT4NCj4g
Kw0KPiArZGVzY3JpcHRpb246DQo+ICsgIE1lZGlhVGVrIHNlbmluZiBpcyB0aGUgTUlQSS1DU0ky
IHBvcnQgZm9yIHNlbmluZi1jb3JlIGluIE1lZGlhVGVrIFNvQy4NCj4gKyAgVGhlc2UgcG9ydHMg
cHJvdmlkZSB0aGUgb3B0aW9uYWwgY2FwYWJpbGl0eSB0byBkZWZpbmUgZW5kcG9pbnRzIGFuZCBz
ZXQgUlgNCj4gKyAgY29udHJvbGxlciBmb3IgY2FtZXJhIHNlbnNvcnMuDQo+ICsNCj4gK3Byb3Bl
cnRpZXM6DQo+ICsgIGNvbXBhdGlibGU6DQo+ICsgICAgY29uc3Q6IG1lZGlhdGVrLHNlbmluZg0K
PiArDQo+ICsgIGNzaS1wb3J0Og0KPiArICAgIGRlc2NyaXB0aW9uOiBNZWRpYVRlayBDU0kgUngg
cG9ydCBuYW1lDQo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
c3RyaW5nDQo+ICsNCj4gKyAgcG9ydDoNCj4gKyAgICBkZXNjcmlwdGlvbjoNCj4gKyAgICAgIE1l
ZGlhVGVrIHNlbnNvciBpbnRlcmZhY2UgZW5kcG9pbnRzIGZvciBvbmUgc2Vuc29yIGJ1cy4NCj4g
KyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy8kZGVmcy9wb3J0LWJhc2UNCj4gKw0KPiAr
ICAgIHByb3BlcnRpZXM6DQo+ICsgICAgICAiI2FkZHJlc3MtY2VsbHMiOg0KPiArICAgICAgICBj
b25zdDogMQ0KPiArICAgICAgIiNzaXplLWNlbGxzIjoNCj4gKyAgICAgICAgY29uc3Q6IDANCj4g
Kw0KPiArICAgIHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPiArICAgICAgIl5lbmRwb2ludChAWzAtOV0r
KT8kIjoNCj4gKyAgICAgICAgZGVzY3JpcHRpb246DQo+ICsgICAgICAgICAgQ1NJIHBvcnQgZm9y
IG9uZSBzZW5zb3IgZW5kcG9pbnQgY29uZmlndXJhdGlvbi4NCj4gKyAgICAgICAgICBDb25zaWRl
ciBvbmUgc2Vuc29yIGJ1cyBjYW4gc3VwcG9ydCBkaWZmZXJldCBsaW5rcyBmb3IgTUlQSSBQSFku
DQo+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMueWFtbCMN
Cj4gKyAgICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiArICAgICAgICBwcm9w
ZXJ0aWVzOg0KPiArICAgICAgICAgIGRhdGEtbGFuZXM6DQo+ICsgICAgICAgICAgICBpdGVtczoN
Cj4gKyAgICAgICAgICAgICAgZW51bTogWzEsIDIsIDMsIDRdDQo+ICsgICAgICAgICAgICBtYXhJ
dGVtczogNA0KPiArDQo+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ICsNCj4g
K3JlcXVpcmVkOg0KPiArICAtIGNvbXBhdGlibGUNCj4gKyAgLSBjc2ktcG9ydA0KPiArICAtIHBv
cnQNCj4gKw0KPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ICsNCj4gK2V4YW1wbGVz
Og0KPiArICAtIHwNCj4gKyAgICBzZW5pbmZfdG9wIHsNCj4gKyAgICAgIHNlbmluZl9jc2lfcG9y
dF8wOiBzZW5pbmZfY3NpX3BvcnRfMCB7DQo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0
ZWssc2VuaW5mIjsNCj4gKyAgICAgICAgY3NpLXBvcnQgPSAiMEEiOw0KDQpUaGlzIGRldmljZSBo
YXMgbm8gcmVnIHByb3BlcnR5LCBzbyBpdCdzIGEgdmlydHVhbCBkZXZpY2Ugbm90IGEgcmVhbCBk
ZXZpY2UuDQpiaW5kaW5nIGRvY3VtZW50IGlzIHVzZWQgdG8gZGVzY3JpYmUgYSByZWFsIGhhcmR3
YXJlIGRldmljZSwgc28gZHJvcCB0aGlzIGJpbmRpbmcgZG9jdW1lbnQuDQoNClRoZXJlIGlzIGFu
b3RoZXIgc2VuaW5mIGRldmljZSBbMV0gd2hpY2ggaXMgdXBzdHJlYW1pbmcuDQpFdmVuIHRob3Vn
aCBpdCdzIG5vdCB1cHN0cmVhbWVkIHlldCwgaXQgaGF2ZSBiZWVuIHJldmlld2VkLg0KWW91IG1h
eSB0YWtlIGl0IGFzIGEgcmVmZXJlbmNlLg0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz04NzQ2MTcNCg0KUmVnYXJk
cywNCkNLDQoNCj4gKyAgICAgICAgcG9ydCB7DQo+ICsgICAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47DQo+ICsgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ICsNCj4gKyAgICAgICAg
ICBzZW5pbmZfY3NpX3BvcnRfMF9pbl8xOiBlbmRwb2ludCB7DQo+ICsgICAgICAgICAgICBkYXRh
LWxhbmVzID0gPDEgMj47DQo+ICsgICAgICAgICAgICBsaW5rLWZyZXF1ZW5jaWVzID0gL2JpdHMv
IDY0IDwxNDQwMDAwMDAwIDYyNDAwMDAwMD47DQo+ICsgICAgICAgICAgICByZW1vdGUtZW5kcG9p
bnQgPSA8JnNlbnNvcjBfb3V0XzE+Ow0KPiArICAgICAgICAgIH07DQo+ICsNCj4gKyAgICAgICAg
ICBzZW5pbmZfY3NpX3BvcnRfMF9pbl8yOiBlbmRwb2ludEAyIHsNCj4gKyAgICAgICAgICAgIHJl
ZyA9IDwyPjsNCj4gKyAgICAgICAgICAgIGRhdGEtbGFuZXMgPSA8MSAyPjsNCj4gKyAgICAgICAg
ICAgIGxpbmstZnJlcXVlbmNpZXMgPSAvYml0cy8gNjQgPDMzNjAwMDAwMCAyMDcwMDAwMDA+Ow0K
PiArICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZzZW5zb3IwX291dF8yPjsNCj4gKyAg
ICAgICAgICB9Ow0KPiArICAgICAgICB9Ow0KPiArICAgICAgfTsNCj4gKyAgICB9Ow0KPiArDQo+
ICsuLi4NCg==

