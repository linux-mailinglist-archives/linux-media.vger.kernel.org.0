Return-Path: <linux-media+bounces-29997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538F0A851C9
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 04:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FEFB7B3AA6
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 02:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE1627C161;
	Fri, 11 Apr 2025 02:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PoCzL9K4";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="bk+IPwY6"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2DB27BF91;
	Fri, 11 Apr 2025 02:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744340096; cv=fail; b=P5toMNMhW1PfVjLVkgJbfL2AipVSHHOrwNlBOS7fOFaEm85ONXNBCO8QYtAGc5GRIQdfSRAaWTS35G49264EfYuWSMCPrVl5DxzTLu0f/nYh05QCdACB/Q8fonGzNJ+fPuMHLhQolyVeywcCTs6T14r7PO1qLa7uvKGGdQcf3pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744340096; c=relaxed/simple;
	bh=PxhBwWNHkXosbosvg4wEf9cv2pEtI7MFqdS10pP/X/4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fQx0kKO1RgeeUIPhkSt8HaXTnxhQ7taa4la0REu5EaRfpDwxCUIdqW2SO3RS0bkf4DO2z2LVLdoDJdcEFvrbYpQsVIQ6J/aMpWhHWtuASm3knjrYC1FqaY71cpZlFif2y4B+9DQcbRJttKG8xgwvZfjn4gALMNqRShZOTSYxuTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PoCzL9K4; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=bk+IPwY6; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 54eda5da168011f0aae1fd9735fae912-20250411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=PxhBwWNHkXosbosvg4wEf9cv2pEtI7MFqdS10pP/X/4=;
	b=PoCzL9K4k+BslpzX+i8roRUVGsp3S6Z6mSdiLFEbqsvenKyjcE2a8GIvpzy53EQYDiM5rNsm2hjpv8BV6v5hUcb615OSa/jgauyJnD+o9LhjZVz1Dw6mtF2paZDBSjAh6BuLXnHiUKpxde690+2OidrvcMuqFAVTIZU1EcEmgWs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:61e56387-2852-4097-8c56-6821c2354be8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:fb71798d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 54eda5da168011f0aae1fd9735fae912-20250411
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 44786218; Fri, 11 Apr 2025 10:54:48 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 11 Apr 2025 10:54:47 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 11 Apr 2025 10:54:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITcpfdrvfaDXsHmUKX71Bd/1FIpg8TmbzDIKv15HOtAxQjUj+vjPlxy7/aBDeSN9aVcVHb2pbdxjSw0fGeQGkPb4fU2fY8VPPr/LvFj+T1o7dOPZHfJACIMiUM3akeKmaqeFVSA0tfnOMRFKxMK9fEBn9MWITYTstFuZUxtgyCTA93pUHH8saruJAeLxJa+eOM8/76pCc7DaOl5p8JOyXjPjZbIsbUrKrvoDBslZDPtiFNTH2Hr8K92p0n4Mq9MlCLYOZ4EQJYQ1IyaEClG1Njo2/ZhnEY1VMSvP5UVmv6LANZf3teLsOncmcP9bjzuTFMnoILqNWqNN8wEzqTJxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxhBwWNHkXosbosvg4wEf9cv2pEtI7MFqdS10pP/X/4=;
 b=dPdXIMtPrrsCZqEBN3Mj3lUOlp3TmtFf9txCTs0HwcHi0GJsMjXMrAXUQVfFbzKuA/Dr+UV/N4+AHSBCoPBiMyaMpfuCa9gLZQmlJEvl5OYqGOTCqRRzY0w4ZHc4EoViDp/WGYAr8HFvf9wE9oIMFluQ/8zsnlBWeMQ1hgXaHIHYz4TPR3N1HVZJznhi1MFLMcEXQLm+/hSxO8x6OcaTjceBfq8b3MxlcNQ48JQv7OIeQdNL8pLgwpvwRw+wH66S+cokoBlkvKH0H0S8n4X6P4eU2L5Mr75lUHRlgQOS7GxwKhedIKPUKt7nqSMQp8vNlVJIlaNGzlSXwmRYkzNDlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxhBwWNHkXosbosvg4wEf9cv2pEtI7MFqdS10pP/X/4=;
 b=bk+IPwY6TZ8yuwQCSYmDYZ7MSooY6xhH3SsmOj5RCLICKdoDpZuAuE8hKYeLyfY9Ak8ChUSd2OUqoYrKtt6UVVdCvREeBOy1I+6Pha45Gl01UlfmRm+CbTSYJ5zNMLgZ0yyY8gpdj5Y2cAQFNUZXHy713O403+5MtSP9fLLU5DQ=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEYPR03MB8453.apcprd03.prod.outlook.com (2603:1096:101:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Fri, 11 Apr
 2025 02:54:45 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 02:54:45 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgdec compatible
Thread-Topic: [PATCH v2 01/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgdec compatible
Thread-Index: AQHbqeIJBn3odSshKUa7Or3JaQpeN7OccvgAgAFTaoA=
Date: Fri, 11 Apr 2025 02:54:44 +0000
Message-ID: <b4745bd99e28cf90581320f8ddb591f76b1c91b9.camel@mediatek.com>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
	 <20250410063006.5313-2-kyrie.wu@mediatek.com>
	 <20250410-wandering-righteous-hound-ac5edd@shite>
In-Reply-To: <20250410-wandering-righteous-hound-ac5edd@shite>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEYPR03MB8453:EE_
x-ms-office365-filtering-correlation-id: 08ba0d91-e944-4c87-f69f-08dd78a43705
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TDdkZmhaMDhaNzBCN2F2Yzh5UDdRK3UwM1hjWXdKWWRlNW1KVTc3NWZ4bHNa?=
 =?utf-8?B?S1R0UVF0dk54emx6dXNHM21Mci9SbmF0RnlRSkNFRU02Z0VyUjBKUDJCeTNN?=
 =?utf-8?B?U1dRKzd2YWpoeVQ0T1RrRkJLYjM4VThxRVdSVEhmdkJpcnJVSEs3VVp6WlZk?=
 =?utf-8?B?Zk1aZzdPak1yVXlBRzg4Q3FUOHZWRTQ2RTh5NWNMK2dFUW1hOHFmd1ZvWXVt?=
 =?utf-8?B?VGVFSGZwRWM1MzM0bEFWMFVKVER4VkxacEppbWhJOFE0SUtJb2xJSm5Ja3Iz?=
 =?utf-8?B?VHU1cERTK3VLR3BlN0R5NXpGMHhlaUJDS1Viazh1UVNkbU9VYW50V3kzMkkz?=
 =?utf-8?B?YWVtSERWV1ZFQnBaTko4TmlqOWdlazhUNjJQY2Y5aVpwdE14QkUrclRqM1NT?=
 =?utf-8?B?WmlSbWdWUUYzQklzS2tjMFVWZDd1Yyt0WHkzd3laNUpubklGVG1yS3BDbTZZ?=
 =?utf-8?B?Ry92K1NrWjBFRDAyZDBreDBhYTJTNkt0UEdROWgrTmNEdjdTTU0zVVpqcE9p?=
 =?utf-8?B?Ym51TndkdGFHWXNiNVdHQWtDUmF2d1YyM2pJZ2tCcmJvaW0rUGdmbFVacmkw?=
 =?utf-8?B?NWRiVzBIQ01pTTBNcER5RTFWTGVYZXBLSjZDZDhFdG51UWlrQSt1ZnR2Z09x?=
 =?utf-8?B?K2cxRHRmcmx5WmpQWU56MlZtMHB3ZVZqazc2U0JUWjNLNUxNa0xjMkZZczNV?=
 =?utf-8?B?M1JSWnEydlcxMW1qTXdtNHlYRlRlVVY4QXlYelU0Wm9aWGFjcHNXN2VHUVR5?=
 =?utf-8?B?djBpQno2Q0xPM015UGhQU2M0OVUrb0orMmVqNFVjMEJvd1Q4eEtiR0ZnZytF?=
 =?utf-8?B?bytEc1lVUlRER2NQWGJNUFh3cUNHVXJ5Q0hPVEFVb2JyUk12ckIzMnJLcmh3?=
 =?utf-8?B?YXFWME5LMWxyd29CN29PMEMzVXl5L0IyV2hQbTFCZ0p5SkJoeVgwMVlmVHZ4?=
 =?utf-8?B?THJHQVdSV1Y3YjdKTEJrOVRWU1Y3c3dldG1ZVWNMU01YaVc4SHFZNG1mQkJJ?=
 =?utf-8?B?WFRYSCtsRTA4RGlUNWlJa0l6MWN1a3VBQm9FRGNDdzZLK1BrbUl0R05TUnFu?=
 =?utf-8?B?Yk1vOTBQQ0tQblZXcWJJdDltUDY3MnZjMjdUdlVtRFgvdnVjam1ubmJHTURt?=
 =?utf-8?B?YzhhbkJXVStEaTdzVis5ZlBvbFZJVkRlSE91YkZKRUczRWtCUmN0TnQxK0xw?=
 =?utf-8?B?MjRMTzZYdHhaOW5NY0l1Z2tJaHZlMW8rUnp2QlBUNkxLS0tjWmovNGVGRDZM?=
 =?utf-8?B?dlhJQkRqcGI2RDlONUY0N2EvRXJ4NEdtcDBZM2p3Y0EzUkxFK0NJVGZsRnVu?=
 =?utf-8?B?RkFGWmhxOU5JcXM2UUdxWTR1UHZtVnluazkyaXZuc1F5ZEI1WUxaeEdiWkJr?=
 =?utf-8?B?dDdGcnhYd0dmKzh0c1Q2djh3U3lDR2tySk1MOTVkMmhqMXpXWWJ1dEhLMVZl?=
 =?utf-8?B?czVsODJoczk0K2JBMWxuY0tVN0lOS1phYllFOFNwWnkzd01FQ3V6WWcrL2Zl?=
 =?utf-8?B?UmlWZUU2R3dLdHQ2YUhsR29zaDc2QXE5RjdmZi9GWHVFb3VwM1pnWm5HTENP?=
 =?utf-8?B?ZUZLeXl0cDR6S25rWUZoRlZURmRrZjJzK3NGMVp1YzZ4ZmZRRDFNUFVnY2ZX?=
 =?utf-8?B?L2pPM1kzWW9Ud0JHcGZCSzI5dEtsVTZmb05GcjUzTlVHSWFrQmZGOFEzZjZq?=
 =?utf-8?B?eEpTYklwRGkrQTkwZll2MzJhRk84Ry9Od1dMZ0U3K3lITlgwS0o0VytaTDMx?=
 =?utf-8?B?QklwT29HN01ydXovcGZ3ajNjeTdDcTc5aWdYME9kZkpnVmN4UU5zd3EweHNL?=
 =?utf-8?B?MUs2dHRVbStJN3RORklxT3M1TXFuWnNKaGRCdVhHQXNZbURhV0VCRkV4NDRE?=
 =?utf-8?B?OHVYS1ZaMThPZklza0toWUVvZW9JZGZXQ0dKaFF3dkF2QjU2cGY1c21MekFZ?=
 =?utf-8?B?YlV6ZzhqSFlKbGV4ZWExUFk2RTZSUmszUEVKVzBiZTdvL1ZaNzRyRHJKNUdm?=
 =?utf-8?B?MUZqSWJmZ2RnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVJPb29OZjJIYUZvUXVFUjFKOEx2Vk8zVXE3bFJWMDYzbWlYRHlBa2wwS0E0?=
 =?utf-8?B?MGZoYVpBK280K1hVRWdOQ1JlNzc1N2w5UDVEUVpqY0t5cUorQVpHU2I5OU5n?=
 =?utf-8?B?ZEN4MkdZOXhjN0Z0emc5dElTUjZlbndQNHN0T2hVb1FCVDM1VGVITHJCMW0x?=
 =?utf-8?B?ZERpdWtEcmxxUEJYZkkwWWZBZW94a1d1eWw4UzhEYXE5N1BGdldlVVJLVWNE?=
 =?utf-8?B?cWIxL3FZalYxZ2t4QzZDWkp3OENJTThoMHA2SEtyZkJsazJxa0RHRDhVbERW?=
 =?utf-8?B?akVHcnhFaHdvZkl0bHhYTTg3c1pITm9tY0xBYW83RzFpTDU2WFJBK0NwOFdP?=
 =?utf-8?B?enBjZTJ3dXZxT2JSN05FaUxsRHgvWEw5Ums4M0wvZnM5OVZWcDRWdzM1R0Vn?=
 =?utf-8?B?WHE3VTFnVTlwYnViZzN4V0d3WGQzeitCT0R1clpTM1hxcmk0YWJGSGo2QkJv?=
 =?utf-8?B?TDRVbEJQV2xKZ2l0eEp3Qm52TkptU1FQaXZ4dE9BdEFDa2xPWjBERHpNQjc0?=
 =?utf-8?B?N2NJMmNIT3NZK2E3bEVUa2drSVhLVEgxaGlvUnprVnNCcGhMNlhpbmdsQTJR?=
 =?utf-8?B?UWZiajZZcU1qbmZrVjI4c2daQm1oSXBTaDZBQ2FZYkZEZG4zbGpuUHFOVVlP?=
 =?utf-8?B?UGIrbjAzck9yZjBrL3hjWDhyb2M3RW1BdzArS1BvMEdrcDlFSFVuZHJzQ3ZO?=
 =?utf-8?B?T1pEYWQ3SUs0Z3czcWt1Vnh4bWwzdWpxdjdTRW1qMVZMeDNuZU1FN0dDdklW?=
 =?utf-8?B?M005RnArcTNVZFArT0pBT3F5eUFHajJLT056MWVTUi93eklQYU5pYjR5dlUr?=
 =?utf-8?B?MlMvZjJ5WHB6SlcxNHZiaHo1MGphTzFQNlkrOGZYNmxxWFh0Q3g0WDA5d1V2?=
 =?utf-8?B?dnNacUowKzJHQWlNbnhDMURaOVgxYWJ5S09GRnR0M05sYWVUY0Y3eERtOUdj?=
 =?utf-8?B?WUZhZDhIMVpXaWFpTERPRlNiUU1NTlZ4OUxiUE5qditRV3dPelBYZ3laMFhq?=
 =?utf-8?B?dFg4OHcxdzB1STR0cjVCczNjS1JWMU9rWENseTFsTzZDeFAvekxCYXNHV1VI?=
 =?utf-8?B?Vkpzb1NDNHNyTWZKT2UvMUplQXBrWWVKcWlGWWkrdkkyT0RvUHhIWEhSSlhD?=
 =?utf-8?B?am5ZRWZjRXgyVkFDSmhJVXJISUkzV1BaY2UxNzM5dVQ2cWJTSHBGbjZmWFJ0?=
 =?utf-8?B?Vk5McTJ3S201bmFGRVpKeXFBM1I3VFlwdnUxTUMyZGVjWXRCMnM4cFc0WlZt?=
 =?utf-8?B?MTNhTFdyS0hOLzJSSEtSd3ZtVmFVNDUwb0ovYXZDcU1RM3lHNjY1aHExYitn?=
 =?utf-8?B?WnZrYWJKS0F3WGF2NmFqeG9NS3RGOVA0YithOE5CL3ZudVFvcHltZlRKVHdZ?=
 =?utf-8?B?cHdzQXRzVmNISlJ0TWJJNGJxaFlsMG9jeDAzTXIzdldpUTl2bytBTFpxeXRs?=
 =?utf-8?B?QkR5QWdYdWE1YmhpS2p0dWFLSklPRVpDM3pXVW5XVHlCRzNXb2d6dVo3RTMy?=
 =?utf-8?B?UWQzZHU0WkRNVWJGWjFwbnZ3bXhMVkZuUHNZTW9uQVdHM0YyVVVPbWhOVnMx?=
 =?utf-8?B?ZDZ5T1ltV3hscnBNK0hxSVNNZ1lwU3Y5UGRPL0xoMWo0ZTRxMFIyN25WMXF4?=
 =?utf-8?B?Y0lpek1hQ3BsVy9OS29zL002VTFidTNVRHZUYVAybDBtdUMvWTVpZUt1MHVP?=
 =?utf-8?B?SDNGVXFvQ2lPbk9aaEg1UWhpSVJsQ2dxRE01aDliYXYrZUd2QklOYWRtOGsw?=
 =?utf-8?B?b3pwenV6N1lJL3JXMnp6TjVITHZYWXJPcWZJcTdmT1FsUUNXczl2eHZKMTYr?=
 =?utf-8?B?NjZpc2cwNU1kMmhGdlBZd3BQTnQ1SWF6bkNMeXNiRjJhazY5WGdVYWJ1YXZv?=
 =?utf-8?B?b1B3VzRDKzY2bkFKZXRjT1NCbjVzM0gwdXV3cE91Q2tyWXNVRzh5ZHpieFJI?=
 =?utf-8?B?WWlnSE92SDFyRGtvSFg1OFJsWG9pOVNNelVpWGxMakpOcENNNHZGK0xteDc1?=
 =?utf-8?B?MzA1UWdoNUR5OUtmMitPTUI0S1NLeW1rYW9tL0wzTjFwL2pKM212SDEvZHh6?=
 =?utf-8?B?NkRKNGdGSUc0MlNmUllCSzRJeVo1emZYT2d4dExFQlVTNjhjWjZZS29hdEE2?=
 =?utf-8?Q?4s7SG1vKqw1gyZHcQhy77zTXM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <160CBD05632E9748B37C0187C92D149A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ba0d91-e944-4c87-f69f-08dd78a43705
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 02:54:44.9460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZMjtdy7B7tgt6FakIkZridFmelNsG4OfDK+4aPHg/oiRA49vw2mxjT8B1MFPEO/VZc6Csp1RN6Y4baz/Te4qTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8453

T24gVGh1LCAyMDI1LTA0LTEwIGF0IDA4OjM5ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIFRodSwgQXByIDEwLCAyMDI1IGF0IDAyOjI5OjU0UE0g
R01ULCBreXJpZS53dSB3cm90ZToNCj4gPiBBZGQgbWVkaWF0ZWssbXQ4MTk2LWpwZ2RlYyBjb21w
YXRpYmxlIHRvIGJpbmRpbmcgZG9jdW1lbnQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieToga3ly
aWUud3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gDQo+IFVzdWFsIG1lZGlhdGVrIGNvbW1l
bnQgLSBsb29rcyBsaWtlIGNvcHkgcGFzdGUgb2YgdXNlcm5hbWUuIFBsZWFzZQ0KPiByZWFjaA0K
PiB0byB5b3VyIGNvbGxlYWd1ZXMgaG93IHRvIGZpeCBpdC4NCg0KRGVhciBLcnp5c3p0b2YsDQoN
CkRvIEkgbmVlZCB0byBjaGFuZ2UgdGhlIHVzZXJuYW1lIGxpa2UgdGhhdDogS3lyaWUgV3UgPA0K
a3lyaWUud3VAbWVkaWF0ZWsuY29tPj8NCg0KVGhhbmtzLg0KPiANCj4gPiAtLS0NCj4gPiAgLi4u
L2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS1qcGVnZGVjLnlhbWwgICAgICAgICAgIHwg
OA0KPiA+ICsrKysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS0NCj4gPiBqcGVnZGVjLnlh
bWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRl
ayxtdDgxOTUtDQo+ID4ganBlZ2RlYy55YW1sDQo+ID4gaW5kZXggZTU0NDhjNjBlM2ViLi4yOGE5
YTliZmRiZjggMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS0NCj4gPiBqcGVnZGVjLnlhbWwNCj4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbXQ4MTk1LQ0K
PiA+IGpwZWdkZWMueWFtbA0KPiA+IEBAIC0xNCw3ICsxNCw5IEBAIGRlc2NyaXB0aW9uOg0KPiA+
IA0KPiA+ICBwcm9wZXJ0aWVzOg0KPiA+ICAgIGNvbXBhdGlibGU6DQo+ID4gLSAgICBjb25zdDog
bWVkaWF0ZWssbXQ4MTk1LWpwZ2RlYw0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSBtZWRp
YXRlayxtdDgxOTUtanBnZGVjDQo+ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTk2LWpwZ2RlYw0K
PiANCj4gQW5kIGRldmljZXMgYXJlIG5vdCBjb21wYXRpYmxlPw0KDQpTb3JyeSwgSSBkb24ndCB1
bmRlcnN0YW5kIHRoZSBxdWVzdGlvbiBleGFjdGx5LiBEbyB5b3UgbWVhbiB1c2luZyB0aGUNCmNv
bXBhdGlibGUgc3RyaW5nIG9mIE1UODE5NSBmb3IgYm90aCBNVDgxOTUgYW5kIE1UODE5Nj8NCg0K
VGhhbmtzLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQoNClJlZ2FyZHMs
DQpLeXJpZQ0K

