Return-Path: <linux-media+bounces-31266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBE5AA05B8
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6424F84582D
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 08:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1969C27F74D;
	Tue, 29 Apr 2025 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="s/N/NmT0";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rL0X3qOk"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA827CB06;
	Tue, 29 Apr 2025 08:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915138; cv=fail; b=QbQCIrwlsm2Aw0srTDTVBtPwOjdMcUzKjTNypC2aKcULmd5Fh2kDojWj3ZO9M91I9mo1THGolvk08Jmy1xMRZv1U61k/Dxc5H/ord1XV25opf96/cgjSrid14/xILQLGRl/LeBs9OmMf9LaABS17FH2DuTh6xPugauL6lquIFXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915138; c=relaxed/simple;
	bh=b1T6Qxc7jmkyYSV+2oswz78AGnZqt0kRe3uKP7ivXXE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JnAcUlCChrVF5TBZ5XqQtvj6b42EHlG7+xee+w/TBp5Z13i8tb6G6RlVdSv9jHyYdyp4Gin8QrJYe2JUtBing8V3zY+GHPt6x59S4m3R6gKlnpMznRw1Mw8EuJFvOVon4++oqzKX2Q8KU+Ka5LyboxX0Wnu9p3+YNHM/GI02H+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=s/N/NmT0; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=rL0X3qOk; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7facb57a24d311f0980a8d1746092496-20250429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=b1T6Qxc7jmkyYSV+2oswz78AGnZqt0kRe3uKP7ivXXE=;
	b=s/N/NmT0p/SrJVXODJ2K10XsR53aeKhfRCCkXYBgxy/Ydl/z3AK318XOIiMvRw5RsI4yUWy9OBUbTMp3rc/cPNGyBTkAjVfsOfGUL6IzeMoPnWuxW1vzxuxks5OpTKx4lDOczWWxBWNBJbzmh72a44ZfUurslQyKg8graqbjYgA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c755e774-d196-489a-a55d-a901fe004491,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:c859fe6f-e08c-41ab-89e8-3ba0a33da853,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7facb57a24d311f0980a8d1746092496-20250429
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 196229757; Tue, 29 Apr 2025 16:25:24 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 29 Apr 2025 16:25:23 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 29 Apr 2025 16:25:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXKb6apZ8Na/iHRej+DCI+nY9gKH7/N+LYSY523E5YCneRPDZKO3POstccFNkb3/MKHE14WQX05onzNHCHGJvxXf9AMvFcmVi85Q2DDLRg5+3t4WwOMsIQyNub+3RWUytPMl9hjXw/BIh7HVwgPRPOQzUvP4YfBKEC79A3OQLDriUWKHejOhq+6PMPVNG+CclMMgKwxSMKOSlCeIRXLDT5EW89Uht73LyBkJVuWdH3EQu1gBWCknapVlUmkCFQ00CJ2BTY9KIDeK6uGJB+G2embYKlGNgydw9fMPeJxPRxiNsVH62/u4YlEdR0WfwTE5/wlzsinYM/oOVx3m2z91EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1T6Qxc7jmkyYSV+2oswz78AGnZqt0kRe3uKP7ivXXE=;
 b=Vt4AFY0ZsH/u882jXxegKurcw7YQySXNXIYhDjwogPetfR1qD2yUeueKs9cUFQO1B0fsCw+57yZzgH0kYXAve0nhMC+vsNN73JjQx4NdMieYIz3V6OHpv0Shl4DmROY/xLhyDM96D0qpW97aaiBDowDhVuGYUzQfmScjKPkGWFF+07g4/OhnJkUzb2RE9kAItEUjNAiK8cY3YFUjqyx3aWqAFQ9M2sIVspTH+GiXe63lsGgd1p3n3bdQ4fHT7KpErqISQBJmG5Iu6KHxhXwLjQsvRUdbSxKwplG7DvrzqwMMXnH3cERp8/YGKhuKy7pQr4THJcSNnAva+OTG7dt1qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1T6Qxc7jmkyYSV+2oswz78AGnZqt0kRe3uKP7ivXXE=;
 b=rL0X3qOkUM3Q8FXJ2Lt4ylvR13w+qcb/xyhyKpd8ScEjYrV87yW9lUcjoXpef6gUAfM8VhP8lySA2J9AjnOE8QKJsLAi3aH49aGVQiB6XmTZeO5MKszoLAHErtm43NpHl03V7r/DpJ930AbOroKLgkHdBxFSwSFQex8MjTR3A4U=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by PUZPR03MB6855.apcprd03.prod.outlook.com (2603:1096:301:e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 08:25:21 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 08:25:20 +0000
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
Subject: Re: [PATCH v3 01/12] dt-bindings: media: mediatek,jpeg: Add mediatek,
 mt8196-jpgdec compatible
Thread-Topic: [PATCH v3 01/12] dt-bindings: media: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Thread-Index: AQHbtb+Ip9hi9FnUgUW7BFGiHpfbe7O4rBmAgAAU8wCAAYWYAIAADliA
Date: Tue, 29 Apr 2025 08:25:20 +0000
Message-ID: <41e258daf6ffaf14c3330c95860d70c95f9b61a2.camel@mediatek.com>
References: <20250425085328.16929-1-kyrie.wu@mediatek.com>
	 <20250425085328.16929-2-kyrie.wu@mediatek.com>
	 <20250428-ambitious-deer-of-plenty-2a553a@kuoka>
	 <5b6e70181b417f1b25df6fc1838b0ad600e29e9c.camel@mediatek.com>
	 <2044b305-8786-49b9-82e2-aa294434c24e@kernel.org>
In-Reply-To: <2044b305-8786-49b9-82e2-aa294434c24e@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|PUZPR03MB6855:EE_
x-ms-office365-filtering-correlation-id: db7914ef-9a9e-4b87-1b22-08dd86f7617a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bUxzc3VIYU0yb0lGSzdEdGt4VUNRVkxaaURuSlloYkZ1SjFTTnJIMGpaaDNJ?=
 =?utf-8?B?d2d1S1Jha0loVVBYQ1Z3VmNubmdIUm44bUloNnNEd1g3S1RWdXFJRW1wTDFj?=
 =?utf-8?B?cSs4dnh5SUZ2eGc2eUNGTTloQWgycExObXpmNXJ3eGwyWVdFaTc0bDdKdzYv?=
 =?utf-8?B?YTZBNEJkdDdrdGNaaGtOM1NZMGhsL25ZMmZQTUdjcEJoK3UwVGU1UXNyNW9r?=
 =?utf-8?B?d0E0ZThCR1ErQ3pPZ0NLRXZMM1lGNzh1SFh4WFBkQlFYU3p5ZVpIVXRDNXRv?=
 =?utf-8?B?alFUcXgrenFCd1RGU3Iyd21xa2RnNCszTFQyZG1vZkpvWWpwZ2xLZllqekJF?=
 =?utf-8?B?ZlVsRlpWS0ptZW1kOGlub2xvYlBmVC9DM0ZjM0w1SUNwSStWaklETjAxUGZY?=
 =?utf-8?B?YzJaUjRaRFdtZlhPODNsVnZsc2oyejVBbXhGaTlSRVB0M1hNMVl0T0g4aGdR?=
 =?utf-8?B?d0crUGkrWGErMy9vL2RLRk96MUhZOWluVmV4N1BTVzIyQXJvbXlya0dreFk3?=
 =?utf-8?B?MHpCWWhBeElLbGtuS2pqN1BBZWxISU10blpkd3o1L0tDSnA4b004T28xek15?=
 =?utf-8?B?MGpEcCtTNnBLVnBuOVZoTGpQMWxCdW9HWTJaOVpscFVWSzlndHZmUVlDRUtB?=
 =?utf-8?B?U2pxUGgyWXFKNXZBMHlIdWdaL3FJeWVTMkFBSjFRN1VMNWJnS202NTEycUY4?=
 =?utf-8?B?N0pYenp3aVVvK2VKekpyLzd6K2xoWTJlQlBUWmMyRVVnYmRqQVN1Sy82OG1T?=
 =?utf-8?B?bklWMVc4eFdRMHE5OHZrVjdZcEFFbStwNVlJdGdpZ0I3VUtFbzZsQjlGR3Rr?=
 =?utf-8?B?d3dtalN5YytvUHZSaFBDOE84V1U2bEgwRUJPWlM1OTRpbGx5VXFFNklPem12?=
 =?utf-8?B?TDZUYlJUWGM4bVJweGV1YWpXTUt1Zk9oeWQxcnpFZjNFcHcvbDNuSmgvb1NG?=
 =?utf-8?B?YUx1NGl1Y2pPUmtSTkIrTWlaMWpRZEdTdnA2KzJabk82dHpJR2g1Z0o5OFFE?=
 =?utf-8?B?UVJMOVRrdTFoNllhREN3aTd0SnpVUndQWlBRcjdsVzBEajkzZEhIbXdJYzdS?=
 =?utf-8?B?clNiLzJoZVd5Z0lmNVhYMVgwL1V3dTJMa3hHMGtvSm9NS1ArdDJ5a1VEcFY4?=
 =?utf-8?B?WnFhL01hU1YrT045cFFzOFBMYmZ6QWhWN1FlUEJYL0h1U3FzSmZXK0M5TTlN?=
 =?utf-8?B?bmNnNGNWZ051dW91bmFhMm1rKzFuRVNnYkxKVGhTYnlKZGtPaDgyQjlaMG9H?=
 =?utf-8?B?TjZQa3A0U3kwYWpLWDBpNGdObUxiVnR2MTEwMmlwVlQxV3FRM1l5U1R4ZG9C?=
 =?utf-8?B?RHZmeXdiUlZNZXRqaHRiSDRpRjBqbUJ5cGhBR0Zjdlc3VEFOK1VEd056dElU?=
 =?utf-8?B?N085L3Ixd3dsTjVWQmVyTmg1NjExZEJjSnV2WFNFSWh0SHFuYlowZU1DbXJo?=
 =?utf-8?B?c0toOStyV1YrOXlQVW1PV2hIR0FIbDdFbFl0enM2RHgwOTdGWWJpRUtablhP?=
 =?utf-8?B?SnFrMnpNUGNEMFZBYm9yNTM2WjhZM0E4WTVyTDZvTTFIRVpRZEdOV2RNcEdx?=
 =?utf-8?B?M0JzUWNsNnhiNnY2ZExZanNtRGNrV2kzbjIrZDNNS2J0Q1BHU2diV2JoamRN?=
 =?utf-8?B?Nk95b20zeVgwYTUyUkZ3Mnd6RnNFUkxCQlliREVMR3R0amlnY1hDT1ZaR0Nm?=
 =?utf-8?B?NUhtckdXRWF4b0haT3FqOUV5L2hBbE5LTitDeFBrbkhRQ01GaUlhY2VFZC9k?=
 =?utf-8?B?b0Rzd25TMlRLbGlrTmFUMUo2ZnM3VG9IaXNERGlmYmlGd0dBS3dZbFVoVDcw?=
 =?utf-8?B?WXpYbUpTVXlRZ3FCUFJNUXFoc2RPZ05KSjlBR01ZQnZPamlLYzRpdWpQbDEw?=
 =?utf-8?B?emprekdVQzBQaHQ5T3M5YWs2ZUZBQytOanpIZjF3K2ZHTFN2dUNRZGhzcXZt?=
 =?utf-8?Q?/rMN4GPP/x32P9g0fk4x6fv5/g20C1/u?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0c4enN2NUZXT0NYemdpQzBPdE03SDl0V1VkTWVZcEFPaDN2eVhRNzVqelc4?=
 =?utf-8?B?Nzd1VEt0TjRZTUxIa1FieWZrL3V5N1hZRkdFNDR3WS85Q3RnLzNuWlVsR0Ix?=
 =?utf-8?B?WW9jek5hcUxjbktvVHEvaWRBekhoOFdhOS95OEVRVFpQWEdaYkxUMHN0eDlQ?=
 =?utf-8?B?WDBKTUpvWC9mcndmSldHU0xCNXZnOXFRN1N3MnZDa0FvbDB0Y2ZNTXJJZlRn?=
 =?utf-8?B?SHFKTHBrUkpSNW9QRjhqRWQ4WmRXUVdnWjl4V3BjYWlocXJRVmRZbzJXZ1lO?=
 =?utf-8?B?OUllemthR2Q4TEk1RVp4eDdoZU12S3BhSTNoVEJRUFQ2SkY2SGxRVEJpTk5Y?=
 =?utf-8?B?NW5GUjQwbEpkanhJS3Z6M1hFVlB3M2oyaEhpTVM2cEJmR1ZGeHBETHlEVm9E?=
 =?utf-8?B?cHJsUWQrbGtqQkw0alFKeFlrUDNxems1d0t4b3R3VnVZVDFnMm1ZeGZEU2l3?=
 =?utf-8?B?eHZ3NTV2WnVEaVd3LzRaSm45Zkx3YTBqc29DTWR5SndnQU5xSWVWdDcvcEJG?=
 =?utf-8?B?Nkg3TnBxVW9vNi9PRjJicHVWS3R5c1FzaXhaUXpJOVVMSXo5L0wrUHdVR1dq?=
 =?utf-8?B?RHFqa2o5NWorZmJ2a3owcmNGUVIvMVVkeUpzUm1JTmdVNSsrOUlNeTdzSTU0?=
 =?utf-8?B?Z1QvMXFyZ0VhUitpNkI3NDBtTlpRZ3RrdGlselhhNHBFUkpmVVVuek1OWCtv?=
 =?utf-8?B?SVZWUHY5VXJ1ZURIOTkvY3U2MTVMSERUeWtVamdjSFQ2VjE2bzJ1UjNBTEd6?=
 =?utf-8?B?L3UvUGFzemUwcTNhUGgvc2M3RnQ2L29ab2RmU0Fuc1J4M0hFZUJzYnlocGoy?=
 =?utf-8?B?YkFjendrZ0lSTlNSOHB3RUtYcjYwdXJLeDNpUjJrdWlUVGFhN1M0Z0M2WHZw?=
 =?utf-8?B?akdsdzhOOEw2NGdNUVNmR0hpVkhIdjVYNjFPdlhiOUJTV0VnYzRPY2twV2ZE?=
 =?utf-8?B?UVdCU0tGblJZOUhPZ3N3NlRxRldTMk4xeFZFSCtBbEJLS0YvdDlnVmNaVXll?=
 =?utf-8?B?M2xUM0xiS21RODBKak4wTHpLTG01dlFQUE1YTmdXT1MzSEZVR0hqbmJVbXdN?=
 =?utf-8?B?MUt2YWtYLy9pclVwSERvZEFQZEllK084SmV1aW41c0t0b1FjdWxSU2QxL1Yr?=
 =?utf-8?B?eTRHREJQVGg0aHlWZTBwYjZhR3h2SXYweVBKRVZselZwTzNxUXp0dDVhQVJ0?=
 =?utf-8?B?SjYwMDh3QitrczdYN2hEclcxU1BqblhtVmNySzlDRWtJaWU0V2FLRERtYjd0?=
 =?utf-8?B?OHd4ZGpoTzVhbnhFcVgzYTBvQlRnVjNEWUhJODlUTThDbmk0c04rNC8yWjlr?=
 =?utf-8?B?S1FQZlVnR3dHMDNSdXgvOFR3UmI2UnIrNGZiNjN4U0pyVEx3Q1ZaWG5pZy9y?=
 =?utf-8?B?WDlldkEwRjUvbFZnT1VFaWNZTkZDRk41ME0wQWw5QWF4L0tJU1F3N0pPMjg5?=
 =?utf-8?B?MmVCOXI1TlBlNHNSdFVpcG9xRzdacThyM25xQzVxb3ZvQmF1WUpHWDREcDlm?=
 =?utf-8?B?MTU5NDl6RXZ6Q256UFBxQkhHRzJscjhJeEkxV3pTZXJlcElheWYyVlhrZkZk?=
 =?utf-8?B?alpLTXNHTTlLb2lINktIUGU3aXFaUCsyZXFKYS9XMnZXWmpzdkVDNTRjWVFv?=
 =?utf-8?B?U0xiWHhmVDAwUzFhMjVjb1cxV2cvdlRVWnNWNHBGc3A1SFk5eGp3OWhzTHVu?=
 =?utf-8?B?dUNNZFQ5dFRDVGI2NTVnWHozVitFRVcyUWhBOGpvSXBQNFo1NVFpV0hHeXRY?=
 =?utf-8?B?V1A0bTVKSHZnMnIvSjhVb0w5UHRsakQ4U0xjV01VTldFNHV6dXVtWForbXI0?=
 =?utf-8?B?TzRrZC9RbFhhd1VIY2FCUExSWkkrdGp1Z2Mvck12MHlrSmtDNHdPNTJqTmVs?=
 =?utf-8?B?SGVWMWJZUHVrWmJqNkZxK3JtdTB6a0pMS1hmUWNHYXhva3N1NzFhYmFqS2w0?=
 =?utf-8?B?dHN6NFFyeE5WN295OGloKzF1Y3ZCMnd0WnlFTUtGUkpKYmlxQlFjZTZVeUJi?=
 =?utf-8?B?RFVEdmdJQmlsc2V0aEQzNU9WcWNveUhLbGZNbk1qeURZdkJOalJrZ2F1NUVz?=
 =?utf-8?B?OHNVMU5TdGxMd1NVc29vb3ZUQXlMME90SkJNU1pFMXo5bWQ2OGJDSFJKWUhy?=
 =?utf-8?Q?I9K1Rfx50/uYkEf1KbXqUAI39?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DB82CBA40469E47A21D45CE67B27132@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7914ef-9a9e-4b87-1b22-08dd86f7617a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 08:25:20.6791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AReNlkGv4IE8T5tLF80NVEnw0t3bLQdoL59aIE03770m0y8c4C0e+AbjTVwU1lyWLIDHVa27jRFx7oHxUY6ihg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6855

T24gVHVlLCAyMDI1LTA0LTI5IGF0IDA5OjMzICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDI4LzA0LzIwMjUgMTA6MTksIEt5cmllIFd1ICjlkLTm
mZcpIHdyb3RlOg0KPiA+IE9uIE1vbiwgMjAyNS0wNC0yOCBhdCAwOTowNCArMDIwMCwgS3J6eXN6
dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4geW91
IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+ID4g
DQo+ID4gPiBPbiBGcmksIEFwciAyNSwgMjAyNSBhdCAwNDo1MzoxN1BNIEdNVCwgS3lyaWUgV3Ug
d3JvdGU6DQo+ID4gPiA+IENvbXBhcmVkIHRvIHRoZSBwcmV2aW91cyBnZW5lcmF0aW9uIElDLCB0
aGUgTVQ4MTk2IHVzZXMgU01NVQ0KPiA+ID4gPiBpbnN0ZWFkIG9mIElPTU1VIGFuZCBzdXBwb3J0
cyBmZWF0dXJlcyBzdWNoIGFzIGR5bmFtaWMgdm9sdGFnZQ0KPiA+ID4gPiBhbmQgZnJlcXVlbmN5
IHNjYWxpbmcuIFRoZXJlZm9yZSwgYWRkICJtZWRpYXRlayxtdDgxOTYtanBnZGVjIg0KPiA+ID4g
PiBjb21wYXRpYmxlIHRvIHRoZSBiaW5kaW5nIGRvY3VtZW50Lg0KPiA+ID4gPiANCj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogS3lyaWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiA+IA0K
PiA+ID4gSSBnYXZlIHlvdSBhIGxpbmsgdG8gdGhlIGV4YWN0IHBhcnQgb2YgZG9jdW1lbnRhdGlv
biBhYm91dA0KPiA+ID4gcHJlZml4ZXMNCj4gPiA+IHRvDQo+ID4gPiByZWFkLiBJIGRvIG5vdCBz
ZWUgaW1wcm92ZW1lbnRzLCBzbyBJIGRvIG5vdCBiZWxpZXZlIHlvdSByZWFkIGl0Lg0KPiA+ID4g
SQ0KPiA+ID4gY291bGQNCj4gPiA+IGltYWdpbmUgcGVvcGxlIHNraXAgcmVhZGluZyBlbnRpcmUg
ZG9jICh3aG8gd291bGQgbGlzdGVuIHRvIHRoZQ0KPiA+ID4gcmV2aWV3ZXIsIHJpZ2h0PyksIGJ1
dCBpZiBJIGdpdmUgZGlyZWN0IGxpbmsgdG8gc3BlY2lmaWMgY2hhcHRlcg0KPiA+ID4gYW5kDQo+
ID4gPiBzdGlsbCBub3QgZm9sbG93aW5nIGl0LCBtYWtlcyBtZSBmZWVsIHF1aXRlIGRpc3NhcG9p
bnRlZC4NCj4gPiA+IA0KPiA+ID4gQmVzdCByZWdhcmRzLA0KPiA+ID4gS3J6eXN6dG9mDQo+ID4g
PiANCj4gPiANCj4gPiBEZWFyIEtyenlzenRvZiwNCj4gPiANCj4gPiBJIHdvdWxkIGxpa2UgdG8g
YXBvbG9naXplIHRvIHlvdSBhZ2FpbiBoZXJlLiBJIGFtIHZlcnkgc29ycnkgZm9yDQo+ID4gd2Fz
dGluZyB5b3VyIHByZWNpb3VzIHRpbWUuIEkgY2hhbmdlZCB0aGUgc3ViamVjdCBmcm9tICJkdC0N
Cj4gPiBiaW5kaW5nczoNCj4gPiBtZWRpYXRlazogWFhYIiB0byAiZHQtYmluZGluZ3M6IG1lZGlh
OiBtZWRpYXRlayxqcGVnOiBYWFgiIGluIFYzLg0KPiA+IFRoaXMNCj4gPiBjaGFuZ2UgaXMgYmFz
ZWQgb24geW91ciBwcmV2aW91cyBzdWdnZXN0aW9uLiBVc2UgdGhpcyBjb21tYW5kLCBnaXQNCj4g
PiBsb2cNCj4gPiAtLW9uZWxpbmUgLS0NCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvLCBvYnRhaW5lZC4gQnV0IHRoaXMNCj4gPiBtb2RpZmljYXRpb24gZG9lcyBu
b3QgbWVldCB5b3VyIHJlcXVpcmVtZW50cy4gU2hvdWxkIEkgY2hhbmdlIHRoZQ0KPiA+IHN1Ympl
Y3QgdG8gIm1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWF0ZWssanBlZzogWFhYIj8NCj4gPiANCj4g
PiBBbm90aGVyIHF1ZXN0aW9uIEkgbmVlZCB0byBhc2sgeW91Og0KPiA+IE1UODE5NSBhbmQgTVQ4
MTk2IGJvdGggaGF2ZSBtdWx0aS1jb3JlIGhhcmR3YXJlIGFyY2hpdGVjdHVyZXMuIERvDQo+ID4g
d2UNCj4gPiBuZWVkIHRvIGNoYW5nZSB0aGUgeWFtbCBmaWxlIG5hbWUgZnJvbSAnbWVkaWF0ZWss
bXQ4MTk1LQ0KPiA+IGpwZWdlbmMueWFtbCcNCj4gPiB0byAnbWVkaWF0ZWssbXVsdGktY29yZS1q
cGVnZW5jLnlhbWwnPyBJbiBteSBvcGluaW9uLCB0aGlzIGlzIG1vcmUNCj4gPiBhcHByb3ByaWF0
ZS4gV2hhdCBpcyB5b3VyIHN1Z2dlc3Rpb24/DQo+IA0KPiBJIGFza2VkIGFib3ZlIGFib3V0IGxp
bmsgdG8gZG9jdW1lbnRhdGlvbi4gWW91IGlnbm9yZWQgdGhhdCBwYXJ0LCBzbw0KPiBsZXQncyBi
ZSBzcGVjaWZpYzoNCj4gDQo+IERpZCB5b3Ugb3IgZGlkIHlvdSBub3QgcmVhZCB0aGUgZG9jIEkg
bGlua2VkIGxhc3QgdGltZT8NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCkRl
YXIgS3J6eXN6dG9mLA0KDQpJIGhhdmUgcmVhZCB0aGUgZm9sbG93aW5nIGxpbmsgeW91IHByb3Zp
ZGVkOg0KDQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93d3cua2VybmVsLm9y
Zy9kb2MvaHRtbC9sYXRlc3QvZGV2aWNldHJlZS9iaW5kaW5ncy9zdWJtaXR0aW5nLXBhdGNoZXMu
aHRtbCppLWZvci1wYXRjaC1zdWJtaXR0ZXJzX187SXchIUNUUk5LQTl3TWcwQVJidyFsWW5HTGNP
QlFJaDl5UVV5TWN0ZUt4dmNLUXYyX2VTYzR1ZHhrRERXWGlrVHlOOFZjWHlZRGdHdUstOFVaV3hL
RTVQbWczRDVsdnBsY3ckDQoNCkhvdyB0byBhZGQgdGhlIHByZWZpeCBvZiB0aGUgcGF0Y2gncyBz
dWJqZWN0LCB0aGUgbGluayBhbmQgY29tbWFuZCBsaW5lDQp5b3UgcHJvdmlkZWQgcmVzcGVjdGl2
ZWx5IGludHJvZHVjZSB0d28gZGlmZmVyZW50IG1ldGhvZHM6DQonbWVkaWE6ZHQtYmluZGluZ3M6
eHh4JyBpcyB0aGUgbWV0aG9kIHByb3ZpZGVkIGluIHRoZSBsaW5rIHlvdQ0KcHJvdmlkZWQ7DQri
gJhkdC1iaW5kaW5nczptZWRpYTp4eHjigJkgaXMgdGhlIGluZm9ybWF0aW9uIG9idGFpbmVkIGZy
b20gdGhlIGNvbW1hbmQNCnlvdSBwcm92aWRlZDsNCkkgaGF2ZSBwcmV2aW91c2x5IHNlbnQgeW91
IGFuIGVtYWlsIGFza2luZyBob3cgeW91IHdvdWxkIGNob29zZSBiZXR3ZWVuDQp0aGUgdHdvICgN
Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRj
aC8yMDI1MDQxMDA2MzAwNi41MzEzLTMta3lyaWUud3VAbWVkaWF0ZWsuY29tLw0KKS4gQnV0IHlv
dSBkaWRuJ3QgcmVwbHkuIFRoZXJlZm9yZSwgSSB1c2VkIHRoZSBwcmV2aW91c2x5IG1lcmdlZCBw
YXRjaA0KYXBwcm9hY2ggaW4gVjM6DQpiMTVhNWNlODYzODMgZHQtYmluZGluZ3M6IG1lZGlhOiBt
ZWRpYXRlayxqcGVnOiBSZWxheCBJT01NVSBtYXggaXRlbQ0KY291bnQNCk15IGJlaGF2aW9yIGhh
cyBjYXVzZWQgeW91IGluY29udmVuaWVuY2UgYW5kIEkgaGF2ZSBtaXN1bmRlcnN0b29kIHlvdXIN
Cmluc3RydWN0aW9ucy4gSSBvbmNlIGFnYWluIHNpbmNlcmVseSBhcG9sb2dpemUgdG8geW91LiBJ
IGhvcGUgeW91IGNhbg0KdW5kZXJzdGFuZCBhbmQgYWNjZXB0IGl0Lg0KRmluYWxseSwgcGxlYXNl
IGdpdmUgc29tZSBjb3JyZWN0IGd1aWRhbmNlLg0KDQpUaGFua3MhDQoNClJlZ2FyZHMsDQpLeXJp
ZS4NCg0KDQo=

