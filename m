Return-Path: <linux-media+bounces-12059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA678D1524
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 09:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EAA71F23CD5
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 07:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D32C73196;
	Tue, 28 May 2024 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JyDT4PQi";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="V/J9Q9OU"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D1017E907;
	Tue, 28 May 2024 07:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716880550; cv=fail; b=QxHwQ1+vnOKPo4Gq3U5hT12WqtXfF0J3muszVdTatSv+oCfOQU37M3woX/eetLkVxNcyV6LeR9ZnlghJ8e+R3sGOEs0cDdHLPX927wHBhC/qjqmNptoSmYp/bAxaB2QixzrSp8mAEZmuxtsvlLNqdjqIqvMKCwXXwvkc6G5Jyl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716880550; c=relaxed/simple;
	bh=OtK8PpOnAnQNVlw+7O++vMIw0TCcxGlRhQ+zfWSfvHc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gUSQ/HPtY9lG5Z4anpLxThangAdQFZzGk1wUOY8kwrpH4/6w9Tv0azeKQqNNUXPI6e4VXZtLqVQjJjwQlVmqcIuS6+8w/FVEdPWb4GtY21KXtgAokBHyke+pnTEjHt5qG+j2F2HN91B0xQguZLWiHe4K8rOaZpdpmja3zR2Nfvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=JyDT4PQi; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=V/J9Q9OU; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 14f61ec01cc211efbfff99f2466cf0b4-20240528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=OtK8PpOnAnQNVlw+7O++vMIw0TCcxGlRhQ+zfWSfvHc=;
	b=JyDT4PQigT/Zy2MJWOxPAGgvyFzQruvyhSs3/ZY9GAVD8Qx19jBnuZ2vL+x9JU5hFzAQu9Vql+eOQ8dORCQapLsWZN5l3/gC/tClAIR53y/RQYAZcR2v7h3qQqf/I5CS0OiwD5qIUzWP9PZEpWHYyyEkomiIg5TruQf9ruGVcec=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:998338e7-d789-4fc5-a3d8-3a992ca56835,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:f6ffe443-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 14f61ec01cc211efbfff99f2466cf0b4-20240528
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1298306319; Tue, 28 May 2024 15:15:37 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 28 May 2024 15:15:36 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 28 May 2024 15:15:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHdrSKLyKkD1F2k1fIs22ArySwfxoZ5MWgn6PQwiexfkcCM5epW8w2CxFqMpaDEdFKGWyyuoMc4opvvU6IkVwNASHS7WLtDKCjoF3/mIh6YNNKpUv1PT+efcmbzK9l0PyY8rx8egcVguXnYDzdbzGsE+SEBssYLIkpJFF6UVtrx9BIsjlHkNOT4JVHRMnWTdG3TEpiflvYdQwRq+6qbiB3inyMtpP0V3zY7K/+qHlgnInM2LaTeEukEctwJtYFtdjKL21qS2IPwjYUGG+n6L1MQEPy4jXs8O4U9zqCQ/IS9+1DhCxkgh4qsqD+H8z28wdf/hm71wq/hUVrjmYbdzyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtK8PpOnAnQNVlw+7O++vMIw0TCcxGlRhQ+zfWSfvHc=;
 b=NxAqMuGkv/MgtN2rVdP0CYCQXsBq16oqj0WHtNuYVkzwBozvdCPsgRpCO+rjabIkzNXlZS6409tK97KgkmSUu/z4MO3SSxPIWIhD6T+EPgLIc5Typ+jRXMIUS9Q5sqeFfnV0rPWpsolUlUG48FucHqmdsu31XV4hMGMB78VO37U2LEqcH7XPMZ9CHWVIusbsRCV15npqYviC0sAAyVOEZ/oDqpWW1Y1jJk9hnip+lIapmnanda6oSCBCh8KNDLYFNvQCyJrL72hrdVOKssf2EutPqNjRPsqCRLGUfvk2pxYdv/aq6Uq/pzqsbxX4Cr4EXAYEQvl6yVnsFygchO1Gzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtK8PpOnAnQNVlw+7O++vMIw0TCcxGlRhQ+zfWSfvHc=;
 b=V/J9Q9OUtUaERRfOYSf0Cb5aFJD732q7wXNtAbReHIDcnGl8g4tnijFBifY+VYTrooLAWiFlKhmw9ag14/9tq39vROrdDfVIDZ6EFAXAqGpRTTw7Sj+etj0Z30XKaz/58Qexpkr0z5B0QvbbvMKFl+2btCBVFzOmI4hEEM2GGb0=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB6982.apcprd03.prod.outlook.com (2603:1096:400:276::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16; Tue, 28 May
 2024 07:15:34 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.7633.001; Tue, 28 May 2024
 07:15:34 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "mripard@kernel.org" <mripard@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"jason-jh.lin@mediatek.corp-partner.google.com"
	<jason-jh.lin@mediatek.corp-partner.google.com>,
	=?utf-8?B?SmFzb24tY2ggQ2hlbiAo6Zmz5bu66LGqKQ==?=
	<Jason-ch.Chen@mediatek.com>, =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?=
	<Shawn.Sung@mediatek.com>, =?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
	<Nancy.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"jkardatzke@google.com" <jkardatzke@google.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 0/7] Add mediate-drm secure flow for SVP
Thread-Topic: [PATCH v6 0/7] Add mediate-drm secure flow for SVP
Thread-Index: AQHarvtlcrCnuWURZEyY7i7vRSJzi7GrIE8AgAEfYoA=
Date: Tue, 28 May 2024 07:15:34 +0000
Message-ID: <4828461fa10101eec29e2885bc1aa0e2b7114e7c.camel@mediatek.com>
References: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
	 <20240527-determined-sage-piculet-bfec4a@houat>
In-Reply-To: <20240527-determined-sage-piculet-bfec4a@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB6982:EE_
x-ms-office365-filtering-correlation-id: 3bae70cc-b911-457d-9a7b-08dc7ee5f77f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|7416005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?VE9BZjNkOFNsQ3VTOXIzcVhtelJKUHY3UkN4dU9oRTdvbGVQWU96RmRqaVZw?=
 =?utf-8?B?OGdCOFJqcm44MENuS3NqVHZ4NXpxQ3hZbGMyaTVpZTQ0SS8yY29rTlh5RXFa?=
 =?utf-8?B?d1lvZjd3WFAxQ3FYYUgyaGVOYXBLRHdiQ3hwUWJlaEJVVXQzaVlXQUY2cjBN?=
 =?utf-8?B?eDFHeGpUSGlaWGdRTmx0cFJSRERNeWZKRzluZklCZ2luay9wSkdOUWFUWXI5?=
 =?utf-8?B?enJuWmhJOEVzbnE4blVuN1AwUEFoQ1ZTR3JIa1lkam5maG80bnNyaXhMRkgz?=
 =?utf-8?B?d3ArK2tDZ0VIbDlsbW9hcjI3azBrak9jZ0hObVpiTU9tUFNOQUpRQ3RUUXpl?=
 =?utf-8?B?NEFibUIxenhzQ0dyMEVHR25Mc0VqOHpGa0NvdzNhRTJPakdyWEtGb1NGT2wz?=
 =?utf-8?B?UWNZU1U1eGZJeVZnSmliWW1UcmFHbk9RQmFzdHV2c3lQNVBCVlltOXorcWho?=
 =?utf-8?B?VnAvWnpCL0h2cGw2ZmFDRnpkMHpoOUxqb3VDY2JpQUtZQjUxbFRDcjBnVmxC?=
 =?utf-8?B?KzRlczFpTFBvSnBPeVFFUHZ1aUlsU1NvUEdtU2JyaGdTendSZ2UxYnlIczJV?=
 =?utf-8?B?R0gwZHN3T3NIdXIzSVd2MGt0VngrMmFJWGVrVmd3UXVpcVk3NEJad0xrbEx5?=
 =?utf-8?B?akFmTCtRZ3VMUi8zLzQrSFc2MFE4ZEh5WmxGT0R3NFlTcnhwaGQ3OUJ2NS9N?=
 =?utf-8?B?alJzOFVZNkIwckF1bEdBajBlWWNrbDhQZGFUTFJuVm9NbWIzeVZ6WFR6MHJq?=
 =?utf-8?B?NnZxTkh0Q2dJS0ZqWlZ5TVYzZ0t4TngvSE9rS01DNnRzOEZBMk9yOGRrL0FM?=
 =?utf-8?B?NUNJQzRuSzBCY3gwdzVoazZsOTFuck0zckhHbXA3VnFzcUlLcVFxWWhkVncz?=
 =?utf-8?B?TFkvZHpqanJZd1UyV2xaaHJncnZsQnJhb0dGekRNL2prSEU0OUZFT3JWUlNu?=
 =?utf-8?B?bEw0Y3ZMOGUyU3JWbDdaVmMrRWs1RUN6YlBWQ0dkb0ZicEk0UjFOLzhIUXJW?=
 =?utf-8?B?QUwrYVR1bnJweXVNdElENUxrUklLQlRPT0RReTJITGFHWHlPYUVYZnhyNE0z?=
 =?utf-8?B?UXl4SmVocDA1VXl2OWlDWjRZWFd1QVdnQWxTRzhHczd4TEJpaVAyY0UyT1l6?=
 =?utf-8?B?WUw5Z3BLVWJva2NHeTU1SXAvY1VMdGxnNFQ4a3loYjVDMFBBSXBIRTZPUTZY?=
 =?utf-8?B?a0FncjluM0YyVUNtUmY4aVA0WmZSaHBOejRjaXFOemF3YkkrRnR4ZlFqVGVK?=
 =?utf-8?B?RmI3SzBTa2g2bkczRFFtNnd6Q1VpVnFWdU9XMis1STZwVUZCcUlteHQvenRl?=
 =?utf-8?B?ZDFZazlNdnhvcnZKbnBUWDd3SXk1QlF5ZGtzRDJWMVJsaG1HbXBjLzVJZnRC?=
 =?utf-8?B?Y0plbGppUWtXYWlYekN3NUhpUFNJdzZvVmRDaHVPdWNxSzJXU1dnc1gwWkpD?=
 =?utf-8?B?UVFmNm0yU1V3T3Y5SHZLaU1EOGpvQ1ZLOFdlTmlKd3E1SXZMakFNUG1aV1Yz?=
 =?utf-8?B?VzdoTXNtaHR6Z20xZGlrQjZQUk9YWmk4dnQxYkp1SEorK2FMMzFZV3IzaDgx?=
 =?utf-8?B?eC9ZdVpXSyt2Q3lxRTg0dThQQjNEdy9OazR0cW1nVm5hNHgzYTRyMFhnWXlS?=
 =?utf-8?B?eUljRWZwclpMayttdmZKUkpwWStSemp5SE1MNjFTVTNQbmMyWnFIbjJuV2NC?=
 =?utf-8?B?a21xemJHYlQrWndIemRRc3V0bU9NVUdPdlkrMzBPNjRhdDZ3clA1aDBRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2Q1TXljQUhrK3FrdXh3dnRCS1dmVkw2SFZ1T2xZdy94b3c1aXBCeDVETUVW?=
 =?utf-8?B?YkxrYmhnMTBYbHZ4MERUZTlXVnFwZ3dzaVBJdWtGdnFxNUFNZkFWaDJwRlIv?=
 =?utf-8?B?a3RvMlJScGdFNVl5ZTZqWGc4ZDkrbityZHlnK3gwTXVGU21TZjlyMmJzVlFB?=
 =?utf-8?B?VE9ZSWxYdytEZHl1dzRzMlBlUUxDUGwrVFFadGt3cHNUNDdOOU9hVHhmaDFj?=
 =?utf-8?B?cG45L2l2YnREZzlxWTFrdWdxVU1uTVY0Zjlvci9TY3dteXZNL2xleHF4c0lo?=
 =?utf-8?B?SlJCSGhVNHRGdjZKdi94NG1oditzTzdBU2RkMGx6ZmJ2ODZtWU1xSk04dTlG?=
 =?utf-8?B?K2VXcUhyVnBSU1g5YlcrYkthdklReEwrQnhpNnZlbEZ2K0MxMm5XNU5BckJa?=
 =?utf-8?B?b0JSZFFlLzRIbWhRcWh1M0JLcHd5SGsvUzR1QzNiT3gwaHJ6dis0YUJ0Q2Ny?=
 =?utf-8?B?amcvSGlNdk5DQlNjc1ZBaVFKR1lpY3VucGhCOHM4b2V5VjdDZGF5cUxSalNz?=
 =?utf-8?B?RFBDOFlDQjYvUXgyZzgvQU1LQjcwZFJYUzB6UW9XaFBHdUdNdjJVTDZuaDhI?=
 =?utf-8?B?aHFXQXJMZzBYSGhJZk94Z3gxU1FkNVU4NDk3VzZ0V0ZWUVYwY004RXNxcGUx?=
 =?utf-8?B?Y0l2NVRYWEJoa1hYcUw0VnRqT1NNVGl1U2lraURiMEJTQUU1ZVJFL0IvM2kz?=
 =?utf-8?B?cDFSNDgvb0FCWW5ES0xHei9IVC9tb2dYSWVrbDk0Y3hqVWVoTEFOdXB1M1FN?=
 =?utf-8?B?NG5DR2FBaUtua2FXaXp6eTd3ZnNYbUx6ejB6Z0FHaGkrN2U1Nnh2NXJxZGtV?=
 =?utf-8?B?UXRsWVlmRklJVWFLSzg4L0duSGhqRG15SDVWUHNYNzN5NHpWbi9kRVh2V0VH?=
 =?utf-8?B?cHBvdkZxSnI3NEdBSlU5VHR3RHY4enBmVWZkcHBlY0FuajdGVmY1YzgxS1dq?=
 =?utf-8?B?a0VveDlsaC82MkFsYkxjZ3gwbWx3RFVWZjdPY0hUU1F5cGFuSzd5clNpdUlk?=
 =?utf-8?B?WVVacTFsQjFjTzRCV2VxNHJ5NkpCL3dhTVVMKzk0M2RBZnJPU0VSMU9uMFZQ?=
 =?utf-8?B?SzRVd1ZvOGFPT0hDTFhiWTVGUFNqdHU5N2hodWNINGN3MkU2TU1lQ2NTdnRD?=
 =?utf-8?B?aHB1OXBJR1JrZzQ0TTlIWmF1K2hTRUFEQkIzMFZvT0JnQnk0R0hRbFdXb2R4?=
 =?utf-8?B?cjhvTElaeVNHV0dIQzBielF1VUNMZmRLZWxWODQ3cm5CamZJYmJzNyt1eGtE?=
 =?utf-8?B?a1NaWDNNcmp0NTk4VHRRcGJPRkJCVGdRNXRwS3ZMdkxhY0QwRFFFMnhQeGp1?=
 =?utf-8?B?cVVkaEMzK1E2TnM2dzBLa3pnNlJYYmFINFlNNllrNTRaTXpXd2FDcUVGd1ZQ?=
 =?utf-8?B?SVY3MmhHdkduQmVBRDlUVUJub3ZKa3I1VndsNFJSRGtLWkx3K3Y4QWZBNWxz?=
 =?utf-8?B?QWhHM2NzeDBWZ3ZmTGNNQlhyUjdNUWtTZTVVM2dXQjM5NVJ1dnRLNzdJUXJV?=
 =?utf-8?B?SXdRZUdxYXhZYlJyRyt2T1IxRlNXSEloRk9wZmVwNGhoUjBRNXZjQVEwbEkz?=
 =?utf-8?B?Mk9oOCtMdjFCVWdjTEE0bWpEZUk5T2IwUGNlekNUdjB1R0w5UElnODQvbXZI?=
 =?utf-8?B?YWhEekZmT3JlZGx0MGw5L1kxa3ZlM0hENzRyS3BPb25xcnc5dHE2dTVmSFl5?=
 =?utf-8?B?bXpLM3NwVzVQRUNyTGdyb0xnY1RaN3NhNldwSDQxcHZ0RmYza0VJNGRTZG9G?=
 =?utf-8?B?VE5oUUZJVjAzaURuRkdacnpPRlA4OGNqc29JemwyaXp6NFJFS3UyTFBHUmFp?=
 =?utf-8?B?bDFEU09XOFp4d0ZxZ2dMWFNTdXFKYnYxMjBtdHA2bEQrZjRSQjVFakFHc05r?=
 =?utf-8?B?TGVKVkVCMEVKNFRFbi9nZVdzZ3Y5aHlhUjNYamgxNjh3Tlo0cXA3bTlrUTZT?=
 =?utf-8?B?ek9hcEloZDQ1VTJFditiYm52aGNMTm12S3hYWmc1VlZZU1grNEdkSU5tZStj?=
 =?utf-8?B?U2lJcVpCRlBySVc1eUhnYnNCQzJjVFlnZTJCdEQrNDVJWnI0T1E2enRtSk1h?=
 =?utf-8?B?ZHliZEcwMzdadk5QZlVJdkNJdTNTdDdROWU1MnpTdUVDaldwUlZ3UERoRkgw?=
 =?utf-8?B?eXc2VFkwMHppQkR6a05jTTVLd0pRMW1CV2x6TFVqOXlsTnlSQ05ZVnFJUVgz?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB344B8C2EA5C64A97576FAC3C129922@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bae70cc-b911-457d-9a7b-08dc7ee5f77f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 07:15:34.4138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0d/d7YM4yobx35rNg7l3SgRtnozo+VvvT5o5TFtntq6BA/ugPSuHMJSgxjxRxDGuygx3S2Cj9BHDHTIQOYoene+j7gVcklwiSZSirCN/d6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6982

SGkgTWF4aW1lLA0KDQpPbiBNb24sIDIwMjQtMDUtMjcgYXQgMTY6MDYgKzAyMDAsIE1heGltZSBS
aXBhcmQgd3JvdGU6DQo+IEhpLA0KPiANCj4gT24gU3VuLCBNYXkgMjYsIDIwMjQgYXQgMDc6Mjk6
MjFBTSBHTVQsIEphc29uLUpILkxpbiB3cm90ZToNCj4gPiBGcm9tOiBKYXNvbi1qaCBMaW4gPGph
c29uLWpoLmxpbkBtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbT4NCj4gPiANCj4gPiBN
ZW1vcnkgRGVmaW5pdGlvbnM6DQo+ID4gc2VjdXJlIG1lbW9yeSAtIE1lbW9yeSBhbGxvY2F0ZWQg
aW4gdGhlIFRFRSAoVHJ1c3RlZCBFeGVjdXRpb24NCj4gPiBFbnZpcm9ubWVudCkgd2hpY2ggaXMg
aW5hY2Nlc3NpYmxlIGluIHRoZSBSRUUgKFJpY2ggRXhlY3V0aW9uDQo+ID4gRW52aXJvbm1lbnQs
IGkuZS4gbGludXgga2VybmVsL3VzZXJzcGFjZSkuDQo+ID4gc2VjdXJlIGhhbmRsZSAtIEludGVn
ZXIgdmFsdWUgd2hpY2ggYWN0cyBhcyByZWZlcmVuY2UgdG8gJ3NlY3VyZQ0KPiA+IG1lbW9yeScu
IFVzZWQgaW4gY29tbXVuaWNhdGlvbiBiZXR3ZWVuIFRFRSBhbmQgUkVFIHRvIHJlZmVyZW5jZQ0K
PiA+ICdzZWN1cmUgbWVtb3J5Jy4NCj4gPiBzZWN1cmUgYnVmZmVyIC0gJ3NlY3VyZSBtZW1vcnkn
IHRoYXQgaXMgdXNlZCB0byBzdG9yZSBkZWNyeXB0ZWQsDQo+ID4gY29tcHJlc3NlZCB2aWRlbyBv
ciBmb3Igb3RoZXIgZ2VuZXJhbCBwdXJwb3NlcyBpbiB0aGUgVEVFLg0KPiA+IHNlY3VyZSBzdXJm
YWNlIC0gJ3NlY3VyZSBtZW1vcnknIHRoYXQgaXMgdXNlZCB0byBzdG9yZSBncmFwaGljDQo+ID4g
YnVmZmVycy4NCj4gPiANCj4gPiBNZW1vcnkgVXNhZ2UgaW4gU1ZQOg0KPiA+IFRoZSBvdmVyYWxs
IGZsb3cgb2YgU1ZQIHN0YXJ0cyB3aXRoIGVuY3J5cHRlZCB2aWRlbyBjb21pbmcgaW4gZnJvbQ0K
PiA+IGFuDQo+ID4gb3V0c2lkZSBzb3VyY2UgaW50byB0aGUgUkVFLiBUaGUgUkVFIHdpbGwgdGhl
biBhbGxvY2F0ZSBhICdzZWN1cmUNCj4gPiBidWZmZXInIGFuZCBzZW5kIHRoZSBjb3JyZXNwb25k
aW5nICdzZWN1cmUgaGFuZGxlJyBhbG9uZyB3aXRoIHRoZQ0KPiA+IGVuY3J5cHRlZCwgY29tcHJl
c3NlZCB2aWRlbyBkYXRhIHRvIHRoZSBURUUuIFRoZSBURUUgd2lsbCB0aGVuDQo+ID4gZGVjcnlw
dA0KPiA+IHRoZSB2aWRlbyBhbmQgc3RvcmUgdGhlIHJlc3VsdCBpbiB0aGUgJ3NlY3VyZSBidWZm
ZXInLiBUaGUgUkVFIHdpbGwNCj4gPiB0aGVuIGFsbG9jYXRlIGEgJ3NlY3VyZSBzdXJmYWNlJy4g
VGhlIFJFRSB3aWxsIHBhc3MgdGhlICdzZWN1cmUNCj4gPiBoYW5kbGVzJyBmb3IgYm90aCB0aGUg
J3NlY3VyZSBidWZmZXInIGFuZCAnc2VjdXJlIHN1cmZhY2UnIGludG8gdGhlDQo+ID4gVEVFIGZv
ciB2aWRlbyBkZWNvZGluZy4gVGhlIHZpZGVvIGRlY29kZXIgSFcgd2lsbCB0aGVuIGRlY29kZSB0
aGUNCj4gPiBjb250ZW50cyBvZiB0aGUgJ3NlY3VyZSBidWZmZXInIGFuZCBwbGFjZSB0aGUgcmVz
dWx0IGluIHRoZSAnc2VjdXJlDQo+ID4gc3VyZmFjZScuIFRoZSBSRUUgd2lsbCB0aGVuIGF0dGFj
aCB0aGUgJ3NlY3VyZSBzdXJmYWNlJyB0byB0aGUNCj4gPiBvdmVybGF5DQo+ID4gcGxhbmUgZm9y
IHJlbmRlcmluZyBvZiB0aGUgdmlkZW8uDQo+ID4gDQo+ID4gRXZlcnl0aGluZyByZWxhdGluZyB0
byBlbnN1cmluZyBzZWN1cml0eSBvZiB0aGUgYWN0dWFsIGNvbnRlbnRzIG9mDQo+ID4gdGhlDQo+
ID4gJ3NlY3VyZSBidWZmZXInIGFuZCAnc2VjdXJlIHN1cmZhY2UnIGlzIG91dCBvZiBzY29wZSBm
b3IgdGhlIFJFRQ0KPiA+IGFuZA0KPiA+IGlzIHRoZSByZXNwb25zaWJpbGl0eSBvZiB0aGUgVEVF
Lg0KPiA+IA0KPiA+IERSTSBkcml2ZXIgaGFuZGxlcyBhbGxvY2F0aW9uIG9mIGdlbSBvYmplY3Rz
IHRoYXQgYXJlIGJhY2tlZCBieSBhDQo+ID4gJ3NlY3VyZQ0KPiA+IHN1cmZhY2UnIGFuZCBmb3Ig
ZGlzcGxheWluZyBhICdzZWN1cmUgc3VyZmFjZScgb24gdGhlIG92ZXJsYXkNCj4gPiBwbGFuZS4N
Cj4gPiBUaGlzIGludHJvZHVjZXMgYSBuZXcgZmxhZyBmb3Igb2JqZWN0IGNyZWF0aW9uIGNhbGxl
ZA0KPiA+IERSTV9NVEtfR0VNX0NSRUFURV9SRVNUUklDVEVEIHdoaWNoIGluZGljYXRlcyBpdCBz
aG91bGQgYmUgYQ0KPiA+ICdzZWN1cmUNCj4gPiBzdXJmYWNlJy4gQWxsIGNoYW5nZXMgaGVyZSBh
cmUgaW4gTWVkaWFUZWsgc3BlY2lmaWMgY29kZS4NCj4gPiAtLS0NCj4gPiBUT0RPOg0KPiA+IDEp
IERyb3AgTVRLX0RSTV9JT0NUTF9HRU1fQ1JFQVRFIGFuZCB1c2UgRE1BX0hFQVBfSU9DVExfQUxM
T0MgaW4NCj4gPiB1c2Vyc3BhY2UNCj4gPiAyKSBEUk0gZHJpdmVyIHVzZSBzZWN1cmUgbWFpbGJv
eCBjaGFubmVsIHRvIGhhbmRsZSBub3JtYWwgYW5kDQo+ID4gc2VjdXJlIGZsb3cNCj4gPiAzKSBJ
bXBsZW1lbnQgc2V0dGluZyBtbXN5cyByb3V0aW5nIHRhYmxlIGluIHRoZSBzZWN1cmUgd29ybGQg
c2VyaWVzDQo+IA0KPiBJJ20gbm90IHN1cmUgd2hhdCB5b3UgbWVhbiBoZXJlLiBXaHkgYXJlIHlv
dSB0cnlpbmcgdG8gdXBzdHJlYW0NCj4gc29tZXRoaW5nIHRoYXQgc3RpbGwgbmVlZHMgdG8gYmUg
cmVtb3ZlZCBmcm9tIHlvdXIgcGF0Y2ggc2VyaWVzPw0KPiANCkJlY2F1c2UgdGhlaXIgaXMgdG9v
IG11Y2ggcGF0Y2hlcyBuZWVkIHRvIGJlIGZpeGVkIGluIHRoaXMgc2VyaWVzLCBzbyBJDQpsaXN0
IGRvd24gdGhlIHJlbWFpbmluZyBUT0RPIGl0ZW1zIGFuZCBzZW5kIHRvIHJldmlldyBmb3IgdGhl
IG90aGVyDQpwYXRjaGVzLg0KDQpTb3JyeSBmb3IgdGhlIGJvdGhlcmluZywgSSdsbCBkcm9wIHRo
aXMgYXQgdGhlIG5leHQgdmVyc2lvbi4NCg0KPiBBbHNvLCBJIG1hZGUgc29tZSBjb21tZW50cyBv
biB0aGUgcHJldmlvdXMgdmVyc2lvbiB0aGF0IGhhdmUgYmVlbg0KPiBlbnRpcmVseSBpZ25vcmVk
IGFuZCBzdGlsbCBhcHBseSBvbiB0aGlzIHZlcnNpb246DQo+IA0KaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvZHJpLWRldmVsLzIwMjQwNDE1LWd1cHB5LW9mLXBlcnBldHVhbC1jdXJyZW50LTNhNzk3
NEBob3VhdC8NCj4gDQoNCkkgbG9zdCB0aGF0IG1haWwgaW4gbXkgbWFpbGJveCwgc28gSSBkaWRu
J3QgcmVwbHkgYXQgdGhhdCB0aW1lLg0KSSBoYXZlIGltcG9ydGVkIHRoYXQgbWFpbCBhbmQgcmVw
bGllZCB0byB5b3UuIEhvcGUgeW91IGRvbid0IG1pbmQgOikNCg0KUmVnYXJkcywNCkphc29uLUpI
Lkxpbg0KDQo+IE1heGltZQ0K

