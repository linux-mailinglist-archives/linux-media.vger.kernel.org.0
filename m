Return-Path: <linux-media+bounces-56648-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMiuLOegwGmLJQQAu9opvQ
	(envelope-from <linux-media+bounces-56648-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 03:09:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B0F2EBDB0
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 03:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF23730265AE
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 02:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF741E1024;
	Mon, 23 Mar 2026 02:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HAcz4zWr";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Jnv35CQi"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBCB72621;
	Mon, 23 Mar 2026 02:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774231606; cv=fail; b=eSwSxPXqteLNAnJ7z+GxyH7cSxzvjDkYv4EOSZ7k8oE4YPDwJ5UOQPv/o1eGcEtqYF3AXQlIjQMGSFuAtV0hdb/dKYpbyHnWVkiWeFws49j6EoRNhlfAhF02/NUoCS+W33Gp8zAgPCOIgGStf23ZPhLVeJPer4wYRTHeJ6zRklk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774231606; c=relaxed/simple;
	bh=XIhzKAVYB0Ect938UuLKAcf0VekVK9CB6bUoIitbNQ4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c3KNuPPezXh+Jou9bugL1iRBjLUQuEKsZ+KLpi2WeJx74dbak5+UuhWuZ+PeYTnQH7uy7TDjcsDBTEE+uQ4hsI8hyjnnGXc3ueV3mzeWx89Dco7lVSAw7NAXz2qYAf0RihP8LDR+SYAm/eQa1KMAW9cbHCURYHJ7TTRL4taGIMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HAcz4zWr; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Jnv35CQi; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ea2a5520265c11f1a39cd589f645bc18-20260323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=XIhzKAVYB0Ect938UuLKAcf0VekVK9CB6bUoIitbNQ4=;
	b=HAcz4zWr8og4hUAaMKelzclFMrkxzkHNYl2UMXXaFLC+9S3jf5OMPaWOSOMIja5sPDVgVFYbB/t4r55YrmdyGHOvEzY2cIT66XovdcXw2FKrav0oNni/1c6ekVf2oh0M6gMX51/B0fOhiO5cZiGlotHRKiJPDVLj140gI9zCEBU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:9cb10f32-83ba-4639-8a33-9917cd269063,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:e0c6c94c-9183-487b-8624-e74f2dd98990,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ea2a5520265c11f1a39cd589f645bc18-20260323
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1141225701; Mon, 23 Mar 2026 10:06:33 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 23 Mar 2026 10:06:31 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 23 Mar 2026 10:06:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6MtA/ca30J0hRXLGV/KOoZCQ1/rqDdWrko/BiU7RsZY2a2Q5YXLJ9sRjGMmL16zpaIdJsBow9yZAHCVRJ9fhhzILM+Dy1PFC0ezqoLDpWHeg6UjGfqLcsrtLz9OgXpS0HCJhvWSI2fWCHYh8LFirKVOsT5ChA/oWj3uSxZMqK9UVoCsCzswc1owV5PX6v7BOKyYnIx+JK57rCyhNfoE++EObejX5f+6QxIl8ILmXkZFdFqtN63OXi5Zp1sLOnQKt4yCphELWO8G7IfUdr+UsPCXcfbLDTmQL1d7Qc/GG/l0uGLL9jbf8soadL890EexMS/Gpq2l6OSLe70RIdfaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIhzKAVYB0Ect938UuLKAcf0VekVK9CB6bUoIitbNQ4=;
 b=X/74LdDyekBkuvpdBmdzHbDwS5ZFvtFODegm4JxqEk3+vq3EE9/6jL3+KvkMksBmnGKBMYvhRQi2RUx5szEbOxc3ux6jLydT1czsPtWoFTVY50JFHPmLFDE/qpTobuNbMqSKLzhUfbO0K6scLOHE/PC1IvrXlzqxYxeSU+WWYTEB31M/FCi4O+hA1qjuwQvcXQXJ+LqmlY+HUX6aweeFfPCvNSYtDkJCaShhdi+jcC/bv8Uw/yfVvfmBIatel4hFZfLYYlM/C/eRCN35wiB2CDLucwmtG+dFWQNQ9FKPUExJDY8n6wdYpYQXXxRzJ88BP6wtcNyXEb9HHUyXcL0sAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIhzKAVYB0Ect938UuLKAcf0VekVK9CB6bUoIitbNQ4=;
 b=Jnv35CQi/A1gegVT2fg5A4CPCpT/mogp5AHbQgOOPQEmhpU2LNXJAYkYPS7VZlhvMaGMtIE/uujvXqnwI7tnzcoevpvKop79+8Q23uVkF/CwtozaaIo+f4S7ABlEuuXkSdNuZTDAtSl/QXRTHDioHKsLNaz2dlHf7zE/jboUb1A=
Received: from TYZPR03MB7520.apcprd03.prod.outlook.com (2603:1096:400:41a::12)
 by TY0PR03MB6982.apcprd03.prod.outlook.com (2603:1096:400:276::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 02:06:27 +0000
Received: from TYZPR03MB7520.apcprd03.prod.outlook.com
 ([fe80::d96b:83e6:b69b:fb0a]) by TYZPR03MB7520.apcprd03.prod.outlook.com
 ([fe80::d96b:83e6:b69b:fb0a%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 02:06:27 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"nhebert@chromium.org" <nhebert@chromium.org>,
	"nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, Nicolas Prado
	<nfraprado@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
	<stevecho@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@chromium.org"
	<hsinyi@chromium.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 02/14] media: mediatek: vcodec: add decoder compatible
 to support mt8196
Thread-Topic: [PATCH v3 02/14] media: mediatek: vcodec: add decoder compatible
 to support mt8196
Thread-Index: AQHcmxlKHr/u4ntzYUWVLjmpGIZInrV/SMQAgAAtXoCAAHBcAIA2mjEAgAUcbIA=
Date: Mon, 23 Mar 2026 02:06:26 +0000
Message-ID: <93a8cba5d58c9485bccf7fa9605ce715205b559d.camel@mediatek.com>
References: <20260211054149.27249-1-yunfei.dong@mediatek.com>
	 <20260211054149.27249-3-yunfei.dong@mediatek.com>
	 <6176231.DvuYhMxLoT@workhorse>
	 <ce23bec1765032aad25e036b46cf45eb97764ea0.camel@collabora.com>
	 <44d55b13e2e9f8bbc57240c560eb5c70750e77fa.camel@mediatek.com>
	 <996341171629763ec9ecc0db6da61319ee99a970.camel@collabora.com>
In-Reply-To: <996341171629763ec9ecc0db6da61319ee99a970.camel@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB7520:EE_|TY0PR03MB6982:EE_
x-ms-office365-filtering-correlation-id: 83a7985e-7e81-4f45-7192-08de8880cab1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|921020|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: COzmdJNRUr1BG6GBTcIB/leELgh4kezLdbAvVvBXMEQPQ+dVWAalEg/hScZLI5Z0BsVhuSJ/1razq6mo12r/n0vtgQvFCUw07gL61VWuQV5AmUMn6SbP0ErSQqqTgGxWgI6cg9EWvhT047UmYHofIb2Rrux+xFMvOl6zqhE6ZbPmxMPr71BXu9yQj/oIlEEwsh7w59xbQC6s88IGyjTa5cDdESfPVKjLQ8Ln2jzSiqIPoBup8BHo6oK1u/HjBtTW/n12MKhFBUoV0mHac3pNbm4Wnipci6gdSa2KC9u90Gx3mBD/sBPDRfWj4jWs+BqLiS2C9MJ6v3CSdrhyZYizaxLfFTg+9SzjgoPEYlaY4pUr0YC0laGoP/IFDWfp+tSStMekTY04qXnTwfm7ZAniLjCKQRwAzowOuHUnm650IYiHSvVnTPZGVHBwpuWPA6wljMujEaONGaMbh+L+mh0AOEw5K7KdyC+H1qxmWY5ZUTMf//roxSffikbYtIEMJFd3mIBnb9+5i4eEWMAUhwVUykgEAUWWPuBu1I+v3Yc8mQJN78ZqcQ7uLFYfRlWauAVW1aSWi8myKqfMO7PPOR+dypik/MoPwf7gEbVQKainzgqxoFHmEUqcu09axemRRdXLwHdVFgXj6lh/8dxFKzCHXAsnqPkFT2/elBscfpRrlEZPBOL1np+/pHNiPgTA/PRpgAk7cM+5WTRqam1KniggumKbIZNyPWwhI6GYzwago3aHYIrtWtqFgRX3PAkUHknKT9jWxZjJ9csYtZQErP80HA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7520.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGpYTTlwQVU5V2tMY25WQm1Dd0MyL0MrdStiZkNENWQ3cElVc3VaMkFaK2k5?=
 =?utf-8?B?YjZoa0tKbmJEZ1R4MkJWNkF2MGRtS1haK2xpOGhyMTBvU29IVFNsbk5lTjZC?=
 =?utf-8?B?Y21zcFI4dllaTVRCRVBUMXU4UXdXeUxKbk1ZK3ZSeThkaEJnMlRrckVvOVZs?=
 =?utf-8?B?MXE2cml5dGxEWWdyRW4wbjJ4MVNvY1JXVUNBYzkyZ2lQRWs4SmFyVUZBV3h6?=
 =?utf-8?B?SjJXS2t6ZllSYmFaNm5ic2gvS1ZtNUFJUTVDSWk4T2ZKU1hVTVhuaEVzd2t4?=
 =?utf-8?B?RDJheVBOK0w1OE5QdmsvY1F5VGtYR1hWVTlnWVFVbktYM2NPbjI1OTNTbi9t?=
 =?utf-8?B?Y0hxSWtrQ2h6Ynorc1ZHaEIzUE5tM2ZZcGpGa3RhcE1XNmJ4aXNTS1lnemlm?=
 =?utf-8?B?VlJaNGtvMFJya05YWlQxMEhETmhLQ2g0SEgvZk1FY1NKY2JGL3lXS3ZTamlL?=
 =?utf-8?B?QlV6SDVQeTkzcjcwcFg3ZEtSOVhhNTJDaExaaUtSUmRnbjJOSGRsaVhsVE1O?=
 =?utf-8?B?U1pKS3g4TWRRU0x4R3VGY3NBeVhVanIwZlV0ejRBM1FXdC9QbDJrbm84SUFW?=
 =?utf-8?B?SjNzb25LZVNrekd4R0pTa2dGek9nQzRZc0lUSmV4bGY3YUJVaTUvci9SaVpE?=
 =?utf-8?B?K0pEWE5reDhtR0lIWHBLTmJDR1hZaEpEeWUzZzh6U1BHOTN3N0hkSTY5NFNz?=
 =?utf-8?B?ZWtFMUlwSStJaVZRdVJYSHRveURZNDAzV0Rnc2Z0bWo2NDZGNnFPN1V2cVpy?=
 =?utf-8?B?bEpDRnUxNkc3cnVRSWNwOE9hdVJvVWJsSGFMcUM3STkya0NhT1BhZ0YvYzZo?=
 =?utf-8?B?OGRIbkhadEltZUI4WUtKN0NFaEJPanoxS2dxWjdsZ3RYb0N3ODRmcTd3aE43?=
 =?utf-8?B?a0h0SFl4TTVKUlVNTXBENW1RdStsL3c0WkZjWW51S3dTVXBvNDNHNGZ4bDJE?=
 =?utf-8?B?Slg1dFR1SmtTSzRKZ2ZXd3dHUGZHNStiSFNBTzNaM0pvbnVTTUw0dngwQXNy?=
 =?utf-8?B?cWhTbEFkeFNRSUhRR1pPUHFWQi8wVjhEWGNvcjRDbGNpYzV4R0xUUXptN1di?=
 =?utf-8?B?ZDdwOG1KRVVpditMZ2lLSG9NWmhqNUtRTitzQ2crZk9tbXBZN2pqUk1BUEZq?=
 =?utf-8?B?WTNGWDdiQ1hRRTdwNHhzNDVPMloxUHZPc0VIWFN3clZwc2hZeU1PcEpaZFJk?=
 =?utf-8?B?Z251b051azIxVkV2d01aSndyNUdZUy9XZmpOWkpiYUhDOWhPZ2RhRGhLUmJq?=
 =?utf-8?B?OVRXNnVoWndoRythelNqRUNkMFdQdTFmaXRrWFpvQnFiZUFTK25RTWNIYnly?=
 =?utf-8?B?dndxV2NZMzBIeGZqc1JUVVE4OWlpTXpFQmlieVNxSWxzem5KbE5UVEZ0d05r?=
 =?utf-8?B?SHA4YnZETm8zWGxYK3BnNHJibXFKQVNVdEZwMm9LWWZwS1RrU2tQSHg4anVV?=
 =?utf-8?B?d2JoK25Sdy80VDhMSUFZSVNKZXN2ZmNHUVVKT1gycXJxQU5iUThHNlZTK2c0?=
 =?utf-8?B?bTBaQWE1NUZ6MlJQclBEOTNsU0RRbVJtVXhJVm15a0NER0J6WE9YdGxYdzFK?=
 =?utf-8?B?QjVOMElPRVV3YmdkV1U2VGtBM3pYakc5bEZsd3ZTb21sdnRTakl0RDhWQVYv?=
 =?utf-8?B?eEllN2dNVXA0SmFmbnFkK2UrSGdLKzRsT051RUt0N29ERCtreHdHcVl2S2N0?=
 =?utf-8?B?M0UwaTRxUXBSSWRYVDVGUFJ6Y2k3MWtvY1VqSjI1RVpicVBYYWgvVjFONldG?=
 =?utf-8?B?QmR5RjY4L3prb0V5SUtXV1BQeHZqZDVaNDJPdENvRWU5Wk5UUXdwZCs5WjN6?=
 =?utf-8?B?TzJ2d3l4aFBaTXJPeFNJS0xqZ2crZDV4cFN2S1B4dzgwVkRYQ2w2cWN1Tzc3?=
 =?utf-8?B?d1N1eTVUY2YxeWFtN2gzS1p6UW9ybUc0aGMyaWRnZjBuYnpMMWgvRlpSVFIx?=
 =?utf-8?B?RGozbU1Jc3V3VFRnU21qbTVVZGJ3TVNrMlhyK3pxWGZWWm1CWkN2N1FuQXlv?=
 =?utf-8?B?VXlncUdFU1F5NVNOcXJmWWNqVGRaWE82SWtBUUlVU3BkL2trZEd0R2dsVUZ2?=
 =?utf-8?B?L3JYVFphM3NLenVGU0p4YXY4b3prU1Z1V0lYOEh1YnpJTzUvNHh3ZlBwdW44?=
 =?utf-8?B?bG90WTNhVW5pYVJnL0JCbm9KazNabUtibzhFdTc5clE2LzlPV050WjE3ZW9l?=
 =?utf-8?B?S2V6cXI4dEowSEIwRktrNUFQb0krcm9LSkhjeHBLUUprcGo2anM0alc2RWoy?=
 =?utf-8?B?elh5bndRWTErWlJDUFdVMGhlSmlCWFlvZjRGL1B5dDRmN2hPclJWaWdDZGZl?=
 =?utf-8?B?OXk1Q0pvRFlRZ1RBQjJCZVFtMGxGRUlsMVA4NmhzQ3ZvbExhcTVMUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20BA3C3232AEA74CAB86523BDA307FF4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Xve2Wh6aETi63EdUhPhvMi4R+ZKmSp/CDBLaTaHmQ9Aa6+28wCLj/CVgFMGV6lfNiPgcIGu8fBeWNdr0uIpqio0IfSa7pIInz7GP+5enw2P8vXbkdzljS97nWYRt7vnVjD0nbGjSVEyxXqyZDBW+SJjQ6q79+x4tbDMgbgf6a5tD5RcZxaMySz/c+uPP25ia+9CsiZESXcQPJi8gh8IVKo9sgI59Y+mCW6Sas6DbCYqic4on5UDA2O/Rgl9Dl1XuaHoCe6pLIhkx+2zS/gpvY2tlqYJmKyOfmj778a3VReW0Rzp7fK8MyqLkKODwiLNzgpK9fSQgjEkbH1sMC7xhWw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7520.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a7985e-7e81-4f45-7192-08de8880cab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 02:06:27.0680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBm62L+w3ntXX84JxLz5hN741sKZwR+EdKWfEytYBfJjjdzkpe7XLrKeupgkgRhvmZ5PoZ7uvfbeaTHkSJlUfPL6y2epaVK1vUOqOKjsWRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6982
X-MTK: N
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[mediateko365.onmicrosoft.com:server fail,linuxtv.org:server fail,mediatek.com:server fail,sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-56648-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[lists.infradead.org,chromium.org,collabora.com,xs4all.nl];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Yunfei.Dong@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 11B0F2EBDB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTmljb2xhcywNCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uDQoNCk9uIFRodSwgMjAy
Ni0wMy0xOSBhdCAxNjowMyAtMDQwMCwgTmljb2xhcyBEdWZyZXNuZSB3cm90ZToNCj4gTGUgdmVu
ZHJlZGkgMTMgZsOpdnJpZXIgMjAyNiDDoCAwMjoxMyArMDAwMCwgWXVuZmVpIERvbmcgKOiRo+S6
kemjnikgYQ0KPiDDqWNyaXQgOg0KPiA+IEkgaGFkIGFscmVhZHkgY29uZmlybWVkIHdpdGgga3ly
aWUsIGhlIGhhZCBjaGFuZ2VkIHRoZSBjb21wYXRpYmxlDQo+ID4gcGF0Y2gNCj4gPiBpbiBtdDgx
ODkncyBwYXRjaCBzZXQuIFNvIEkganVzdCBuZWVkIHRvIGFkZCBtdDgxOTYncyBjb21wYXRpYmxl
Lg0KPiA+IA0KPiA+IA0KPiA+IA0KaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcHJvamVj
dC9saW51eC1tZWRpYS9wYXRjaC8yMDI2MDEyNzAyNDI0OC4xODQwNi0zLWt5cmllLnd1QG1lZGlh
dGVrLmNvbS8NCj4gPiANCj4gPiBtdDgxODkncyBwYXRjaCBzZXQgaXMgYmFzZWQgb24gdGhpcyBw
YXRjaCBzZXQoODE5NidzKS4NCj4gDQo+IEkgd2lsbCBhc2sgdG8gd29yayB0aGUgb3RoZXIgd2F5
IGFyb3VuZC4gS2lyaWwgcGF0Y2hzZXQgaXMgdmVyeSBjbG9zZQ0KPiB0byBiZQ0KPiByZWFkeSwg
YW5kIG9uY2UgaW4sIHlvdSBzaG91bGQgYmUgYWJsZSB0byByZWJhc2Ugb24gdG9wLg0KPiANCj4g
Tm90ZSB0aGF0IHRoaXMgcGF0Y2ggaXMgbWlzcy1vcmRlcmVkLCB5b3Ugc2hvdWxkIGltcGxlbWVu
dCBhbGwgdGhlDQo+IFZDUC9maXJtd2FyZQ0KPiBwYXJ0IGJlZm9yZSB5b3UgbW9kaWZ5IHRoZSBw
cm9iZSBmdW5jdGlvbi4NCj4gDQoNCkt5cmllJ3MgcGF0Y2hzZXQgaXMgY2xvc2UgdG8gYmUgbWVy
Z2VkLCBidXQgbXQ4MTg5IG5lZWQgdG8gZGVwZW5kIG9uDQptdDgxOTYncyBjaGFuZ2UuIFdlIGRv
bid0IHdhbnQgdG8gYnJlYWsgdGhlIGRlcGVuZGVuY3kgY3VycmVudGx5Lg0KDQpDb3VsZA0KeW91
IHBsZWFzZSBoZWxwIHRvIHJldmlldyBvdGhlciBwYXRjaGVzLCBJIHdpbGwgcmVwbHkgaW4gdGlt
ZSBhcyBzb29uDQphcyBwb3NzaWJsZS4NCg0KQWJvdXQgdGhlIG9yZGVyIHRvIHByb2JlIGZ1bmN0
aW9uLCBJIHdpbGwgY2hhbmdlIGl0IGluIG5leHQgdmVyc2lvbi4NCg0KQmVzdCBSZWdhcmRzLA0K
WXVuZmVpIERvbmcNCg0KPiByZWdhcmRzLA0KPiBOaWNvbGFzDQo=

