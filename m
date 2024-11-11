Return-Path: <linux-media+bounces-21235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5C59C369C
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 03:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C7D11F20F5C
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 02:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145A061FE9;
	Mon, 11 Nov 2024 02:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="J03ndkae";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="mdzBhVln"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8072417C77;
	Mon, 11 Nov 2024 02:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731292732; cv=fail; b=QcBgd9oN2PKYHpJr9M7zuebUIaGYI5OEgUCBBr0/teWlDnB+aSsXjb4yz1KpApm+EtXvTtmiBbaCpFb/Ecy99y1MQWr54xTk/WX8LxFT1JgesnUEx02SvG+HCXC/SU8+5laczZjGJTdq9Hj5ddZj46s4K6QV9BzM1IZIqcmMhKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731292732; c=relaxed/simple;
	bh=slcI7oA50aU75T6qKmEBMtCCeEjH+GUeeCBrmCPA3KU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kECKvAYh9X8n8qxvGboKU/xMIGzIaWENFN9d7Fw/Wg8V4fa7fTBOlhJiJlHYCXRw/RvJ2rITnIh/vBQQeYtyp8N+qSdUNZ7jqQo080XVN2a9d5qo9OWLT2uza3aBsHnCHBLJhM6kDx95MKVostI0JyXqm1ZDGyCRfYdamarLE3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=J03ndkae; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=mdzBhVln; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 101450249fd611efb88477ffae1fc7a5-20241111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=slcI7oA50aU75T6qKmEBMtCCeEjH+GUeeCBrmCPA3KU=;
	b=J03ndkaesdhUkGShz1PMa9NEZAdqPvV7qRo15v2qD3Z2EJ2XgRdeVI5xEUZeTqIkehd5hynnp6Sb2rZ4uLnRDAv6DlyumKvcLT4voSGdDurEhZfGuYFMB+xwck46d0QodYspi3q0kKhBeSCO5j1iTN79BNQ/KxBWwfJ3IjqUD7Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:f6b5f5b7-7a00-4b34-b038-54613bbbef68,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:4c8bd4ca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 101450249fd611efb88477ffae1fc7a5-20241111
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1421645770; Mon, 11 Nov 2024 10:38:41 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Nov 2024 10:38:37 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Nov 2024 10:38:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwRBBQ1GNbuOa1K1EnmnuKnXEQHhyiCK1P3yAtpHF9rziJ00x5VvwgyaIm2IUnpPF+FwpQ/cTdAIYRt8qm/67WQPc88MeeYyRsOtga3wqeen13s9Jv6MmrIMozazW7wTDYeXL/NthOA1CXuS/8JVWSwQty8PG9K1vcDdSUivhDBda3Ob5jVWUOgJgxbXAtJ/vzDwHy1IRluJkwd8kGyDrIjNV/nWd7XujU2dzQ6TbfrkGi6mUrWdEcLlAsGRPllZwTeiiSN9GdeGvf5bSPsdLWFG9pDmoknz9tH9yZRdRcS8r34Jc/pkeWQCH882Ejkbebk3PcPIw2/TOnPjhZUiug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slcI7oA50aU75T6qKmEBMtCCeEjH+GUeeCBrmCPA3KU=;
 b=oHuX6tGpd2pTMpB3ee7BTD1/qzQvesz7pDyPVqihUusMEMwtfdTpIRmySPQ3B5oDRjeAan1zl9qxmxhAUy6P3nJAV+od1vVcHbDmvesppch/vGPc3hywGpaXfUr1hFOIkzoFk4/54jk4Goc0RhWQmcnPRHclP20kL+sG4Q2LzEvommwMo7godyG+841NZ/p5If3WS8DhYd9+3LOshAKr9Ns4ec6v0EIcAOdvTC66Vw/GPgNOQkXOv2zlONSs7619u9STxJzdZU8hAIwpSzufZdp8A2tGlMLsRM21tl3kDDoFRokskbkEu9v3kqhYvT1Uz6Ps3Sy8rrZYwMVE88JfCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slcI7oA50aU75T6qKmEBMtCCeEjH+GUeeCBrmCPA3KU=;
 b=mdzBhVlnwXgr2yOzHz2aaOoDlUy48zdAPM45trCCIYn+giPhyBBqzwjEMECiVbuTNXtcboxw6mcjfKc/Akn6WCldkmgxCyDad7owFtpl4oPDZ/PYmSi168kPL+v6bLoN4i5u64fpz6exv45uQHw17oc8OC6thQHfjf1TvZvuwtU=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6534.apcprd03.prod.outlook.com (2603:1096:400:21e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Mon, 11 Nov
 2024 02:38:32 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8137.018; Mon, 11 Nov 2024
 02:38:32 +0000
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
Thread-Index: AQHbGkcqBeP8ybzzkkuuOw+G7YHzMbKxkQiA
Date: Mon, 11 Nov 2024 02:38:32 +0000
Message-ID: <1c78c73b7552b88efc12b861c162c5b21832bce5.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6534:EE_
x-ms-office365-filtering-correlation-id: 6063c9c9-f3da-48ba-df31-08dd01f9ef14
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aGg2NmZzd2c1clc2MzVtMmtmdFdxcGNuazJ0SVBab0lzVVZqcWN2ME9QSldS?=
 =?utf-8?B?aGhBRHRYYWs4LzYvdkdtOEg1MTg1QkdjUVZGcnE3T1VSS1phWHIrS0NvRFRY?=
 =?utf-8?B?MFU2bnM3YmN6QUlXZUxzMVREQkdMSmlMZFRjMjRkazFWSWxBcHVQbkpIanJY?=
 =?utf-8?B?c2p3WE9vZ0xtR0haR2E4d0NQbWJhZ3E2UmY4aE1IK0xTRzg4OVdXcHc3U3M5?=
 =?utf-8?B?SzB1akdHalJxYm90eUVHY1RDZG1BNTgwUkt1aHZQYjFTM3dFZDQvRFFhV2lL?=
 =?utf-8?B?bC9ablJwZmlBN0JJR3k0cGpyZzA5eURnTmZsZ25kZmZSQUpjV24zdTZja1FF?=
 =?utf-8?B?MllGWVRSaFUwT3dhdmJoNVlzRzAyRVAwaUo5UGFDd2NMb3JYRWp4TWc4WW9E?=
 =?utf-8?B?bjhKa1hBVjVOYmhZYWFETC92ZDk0NGY4OFBtTWllWDNNUEdjUm9PT0ZzZ1Ns?=
 =?utf-8?B?SVlyNzZSbENjeWZTWGo1WUNLZXBxT3p4Vm1vY09hNGRzNWdGN2VPUWZUR3Q2?=
 =?utf-8?B?Q2hkUTR6UXgrOXFWbjI5WGY0ZFpLVjM4Y2VlemdMeEZDNDJlQ2tuSVlnRnpL?=
 =?utf-8?B?d3c2K2FUclhseHpMTW5HQVBSUjI2SXFvN0NvN1BpWFlSclN4QTgxZFgwenpR?=
 =?utf-8?B?cVByMVdxbXJCUUt5Sk1zUEZyUXFnT01tZEt6enZrSkR6U0hlZjBnUHpralhr?=
 =?utf-8?B?eFdnNkFxSytadm9ZRGpHOGJITEJzdHNFbHJ4dXlCYWhiMStNanNKVGJXOHJx?=
 =?utf-8?B?K0ZzNUlmOVNoSGZQQmQrSUg0dVVXTWZBMmV6dDEwMUhNRDBLWHd1VlpvdDNY?=
 =?utf-8?B?cVV1QzZHTDNVUVdGUFFyajM0MDVvajlTOTE5ZjdFME5HN0lxd2pVM0RmaDNa?=
 =?utf-8?B?OHdSTy9XRlhhYldYTjdQRFl5RkhTcW1FTkIxOVVKUlRka3JzVTZMam5IcTFP?=
 =?utf-8?B?alF2clo1WHRDeFk2VlZXcWVmNUF5ZmlYMTNlRnpKajZQZ2xubHZCWTdaMFBD?=
 =?utf-8?B?d1RFMllyaVV5azFVNDJXN1F3TVl5WDd1Y2FyOHNuMFBrUVo1SGdGaHBQeHBr?=
 =?utf-8?B?Z0ZtV0ZFQ1M2ZXBJNTNKR1IzaTVjMDltelQ1N1BGT3dDUG53TnZuQS9KT1RK?=
 =?utf-8?B?UEFqQ1RGZWlmR3ZDbVFqbmJGa3gwY2JMVjNtMmdlUkVuTURqN0x1b3pBd3Q1?=
 =?utf-8?B?YTF0K1JCWTc3WDRyUkRweTNEL0RQVW11UjlwVzBhR0tTY0xFbUY1eThjeUMr?=
 =?utf-8?B?MUZqcWFsWURoakVoNUxNdjAvRE5iRjRqZStuN0YzcnhsTjZXcitBZE14QTFD?=
 =?utf-8?B?eXlsa1VRTmZhUkx5a2pUVUgxeU5FOGJVZ1hCc1diendvcjFkMzgrSzY0V1BI?=
 =?utf-8?B?UHVXTzRuRGVJZEk1YndZSzRVTFhHSzkwbTlJSTJvZGFYc3Q2Vm13ZFAxYmxV?=
 =?utf-8?B?eWZQQmxaWU5qSlJTRlJDWmloajlnOXM4TUNFaUt4cCt0aW9GOWtLNTFReWxj?=
 =?utf-8?B?VE5kdW5CalhLallWNHFaZjhHUVpNd0ZBTkdDaXFVd25rblNQMGxVUFBNei9S?=
 =?utf-8?B?ZEs2ZkFNN08wN0ZoWEpQV3UwRHZkZjBHZVZjQzlOblpHbFUzZ2R0ajlpcVV6?=
 =?utf-8?B?UTJFL3RVUUhHMnpWTE9YLzBiSlNiWXcyVjY1Tm1xcGY4alFUSHczMHNwdWN4?=
 =?utf-8?B?OW9xZXJ1bFVaNVpoZlBRQi9hcVE0NlJVQnJsemVLaXB0aUZRVzNNbGZsNXJi?=
 =?utf-8?B?WWRvT1ZTd0hmVGZzZzJieEg2THNDQ3lZWThudTA3ZjRyUXZKRFY0UFI0V2RH?=
 =?utf-8?B?M2c2N1dhaVdxSnlUbGU5QT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b05Vak5HMDFGMXZvcFNUZDRLaFNKRWh4ejRCVEl6S2hkakZnL0YyMU9CdjV3?=
 =?utf-8?B?OXNOUEdOQ2pVRWhmZFlqRExKQ0NOMFNQazR0TXNpVTF2Z2hNTVdVMExsTnQ4?=
 =?utf-8?B?L2ZJNlRIRjEwaDRKSGlWR05mVXl3RFgyK0szYW1TTDA0ZHB4YlpTblg1RjZ5?=
 =?utf-8?B?QUMxN0dzOVNpQVgwU2NQczhsRGNzNkppNm83em1SRWlYdW9oTjgrUG80TURh?=
 =?utf-8?B?eERnM1lwSnZrZEZOMWNHZzloWXdtQzkxL3FCNkxhS0xpQlVmL2V6SDJwamJS?=
 =?utf-8?B?VTZoMGxadEdnVW1HejJNZHFTajJUeDdKYVgvMUlnWVg5bk1jVm5WRWZDNm1k?=
 =?utf-8?B?WkgyVHlBNTNldFJsQi9rWm9aU0FZbGNiRVJFcHBtYXh6TCtXanY2WUhRY3FY?=
 =?utf-8?B?VFdpMlg3STc3bmtPTEsxcWZvY0dCOGZDYkMrTlQyQXc4L09qc3BkM0hZNDA3?=
 =?utf-8?B?S0ZlTlVVR1JIYXdWTlNLc21NYkc2ZzU4Q3R5OGhycEhHanBuQ3hQbnFnNGt1?=
 =?utf-8?B?V1N6emNyQTU3SExOV0RoekhqQjJTQVRzOFBHOWZ0LzVLek9tSlhsL3RXUXZ5?=
 =?utf-8?B?cjRDcjYyejJSQjV4VmY2Y2thUXZaV0R5Mk0yZHk5S0ZGNWNhanZSRVcwdVBK?=
 =?utf-8?B?TTZYcktRWEhXV0prTWZUeW9RdU9ESGNjb3NOLzBaeTJseCtDMEFJNTE2QVlO?=
 =?utf-8?B?TnBHdUZnMkVEUFNxMElpV012V2VPUVNyUTBma0Uwenk0Q3JWUFdjbnZiVHVj?=
 =?utf-8?B?MDBPYTF0WDVPYUxoMmZWVnZERmlBaEdMRnpJOHVpTGtkWXhodlVPOXlFWXF1?=
 =?utf-8?B?bDlyTzAyd1BEWEduUGsyN1pzVWFwd1BRMVM3WHcvaDhrWHRGaFFnOXRoTVJl?=
 =?utf-8?B?R1dPcDdmQ3doaXkxQ3V1SkVFN0JBY2YzRFVMclNjcFIzM1NIaHI3YTkwdlpL?=
 =?utf-8?B?RElUMjBYaEhrUTF4UzJyblJiL0RQVzZNNS9hN0txQ2MzUUNlWVN5eFpwNFdO?=
 =?utf-8?B?cldxNWMvZ3lJTm1HMWFRUXRhdFBzNEtQTlZHbVNGdGE4ZEpVaHMzL2h1aWlI?=
 =?utf-8?B?U3pzZndWK1NWTkZXT2MxaUROMllSUEZtVWZyYWFaQ21MV21MalJ5R00rMWxi?=
 =?utf-8?B?eVNyQlloRFYza1ppb0x4d1czZjd3TU01TlE3NGdsV0tPaDlyaXUySDZPKy9W?=
 =?utf-8?B?dXJBS2NOYUdiTFM4Zmc0Y0JaNnk5SmRXclU0bkNBRWRUR1VKUG95MjRnSE1R?=
 =?utf-8?B?dlJlREt6VndQd3NiOHVpVFZtSW1nZmszUVo1VlhoMTZoU2puQ3VzWmIrTXk3?=
 =?utf-8?B?d0lIVUo2RHFIL1g1Tk5DNndLUElCZUlraTU0TTExbkpBUm5QdVNVaGxiRzJp?=
 =?utf-8?B?bnhwbm15aklRQS9IdjJuejVLN0p0cnFMR2g0Z1huSjlScGtJVkJTZnE3T0dV?=
 =?utf-8?B?Z0g4cE9zQ0VObHNiOE1vZVFUSStZZ2ZmM21QelU5ZWRXNm5YQ3IxV1N3MGhZ?=
 =?utf-8?B?Z0ZqamxLb2x0bXRuQUZaSk12UkNESnNVSjZCcGpEZzFlOCtoZmc1UERBa21i?=
 =?utf-8?B?MDUzWDg4czdaL2NzVUd3b3hrVzdOQS9FMWZyK1dMTjA4Yjk0KzBxbHFRcmNj?=
 =?utf-8?B?aWpZQXZsOTM2WWh6Y2wvaFBsTUZBQzJmcmwwUU1FMHhnRFhKWFZBSWkzTEVL?=
 =?utf-8?B?MGQwR0t2M0lBaG8wV2VEMDlTTUJaOGNGMm05WDVkdE5OZlYxcEh1VE5hdXFt?=
 =?utf-8?B?ZDJvazd0azhZclV4QWdaRktGUW1BMkU1YTBEYVZaQWJ4N1dyVWVOR054TWZG?=
 =?utf-8?B?dk9La3l3WWNsaHJoWlBEQkYyY0laSzBabWtFaHdtR04vUHlIb1RWRDBJS3NN?=
 =?utf-8?B?T2kzcExHNFp1S0NvWlVPMkx2T09vdmNhZW45dGxETmdRR0JUS2FlVmlPRk84?=
 =?utf-8?B?b3ZGc1doa21VRVlkUGxacEVzTmp4THF4dmZyRjZnaVpyK2lXV2NxdXVzNkZF?=
 =?utf-8?B?R1RCTVV5M2JWaC81bkZaNjhUWU81S1l5aFMrZGdwRHFkL2kxQjA5WXVKWlE4?=
 =?utf-8?B?Q2txcUhkbmlUaHdHb2VXb2xLM2tMaVp2NHlodWtZSzRIT1plbnd5by9wNkFZ?=
 =?utf-8?Q?nGE3tV4OuQHf0LON5YnTGyl8q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <060D4320CE2CD140B6C5B99F7ACBE9F7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6063c9c9-f3da-48ba-df31-08dd01f9ef14
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 02:38:32.5724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jCB8BY/YeC1jfxLnOSzqsiohaAvX6sS93ULF+wWaIN84dze5v/qOxIUu2RgMFnSwzVHDjzB/OZixUdmc6RSUPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6534
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.268400-8.000000
X-TMASE-MatchedRID: HXSqh3WYKftm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYJgC
	Mlq+sZ+fkyeevgS86MgdYd1SkfqImrvjKWK1iQnHnVTWWiNp+v/fVqwz+CynaSBQRBOQhaJiwdk
	C9Ck+1Y4v/6OH5COOM2fO7H6w4vPNwydFtYXx0mV2aFFWhkT3QBbjReJSRusbzsQ8iRVyD47rio
	8O85DXBrGP5wb+1U2+IDRSBkmySF1baC95m7bLhJ4CIKY/Hg3AwWulRtvvYxTUHQeTVDUrIldoO
	foOEDYCjaPj0W1qn0Q7AFczfjr/7Ol+QbLwvFMFUBotrgF6CtGBArOrAqQVdECjqVSKiTNzdD9V
	ik6lNzw=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.268400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	B34222AB7E401126CA68015ABEAB887F1015F40D469636828DEC3BDAEFFED9E42000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiAxLiBBZGQgY2FtZXJhIGlzcDd4IG1vZHVsZSBkZXZpY2Ug
ZG9jdW1lbnQNCj4gMi4gQWRkIGNhbWVyYSBpbnRlcmZhY2UgZGV2aWNlIGRvY3VtZW50DQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBTaHUtaHNpYW5nIFlhbmcgPFNodS1oc2lhbmcuWWFuZ0BtZWRpYXRl
ay5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArJGlkOiBodHRwczovL3VybGRlZmVuc2UuY29t
L3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvbWVkaWF0ZWsvbWVkaWF0
ZWssY2FtLXJhdy55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchamtIbXF0eE9zdDZEdjg4UmFF
LXNzOVZheEt4Rm80RnVQbDFzbVhURW5raWlqVTdqUzlua1lHQlBvTHI4ZzRKaTJkWnBiXzdMSFdy
THBJeXUycW9QbmhLdnpXUSQgDQo+ICskc2NoZW1hOiBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNU
Uk5LQTl3TWcwQVJidyFqa0htcXR4T3N0NkR2ODhSYUUtc3M5VmF4S3hGbzRGdVBsMXNtWFRFbmtp
aWpVN2pTOW5rWUdCUG9McjhnNEppMmRacGJfN0xIV3JMcEl5dTJxb1BmS1ZCZFR3JCANCj4gKw0K
PiArdGl0bGU6IFRoZSBjYW0tcmF3IHVuaXQgb2YgTWVkaWFUZWsgSVNQIHN5c3RlbQ0KPiArDQo+
ICttYWludGFpbmVyczoNCj4gKyAgLSBTaHUtaHNpYW5nIFlhbmcgPHNodS1oc2lhbmcueWFuZ0Bt
ZWRpYXRlay5jb20+DQo+ICsgIC0gU2h1bi15aSBXYW5nIDxzaHVuLXlpLndhbmdAbWVkaWF0ZWsu
Y29tPg0KPiArICAtIFRlZGR5IENoZW4gPHRlZGR5LmNoZW5AbWVkaWF0ZWsuY29tPg0KPiArDQo+
ICtkZXNjcmlwdGlvbjoNCj4gKyAgTWVkaWFUZWsgY2FtLXJhdyBpcyB0aGUgY2FtZXJhIFJBVyBw
cm9jZXNzaW5nIHVuaXQgaW4gTWVkaWFUZWsgU29DLg0KPiArDQo+ICtwcm9wZXJ0aWVzOg0KPiAr
ICBjb21wYXRpYmxlOg0KPiArICAgIGNvbnN0OiBtZWRpYXRlayxjYW0tcmF3DQo+ICsNCj4gKyAg
IiNhZGRyZXNzLWNlbGxzIjoNCj4gKyAgICBjb25zdDogMg0KPiArDQo+ICsgICIjc2l6ZS1jZWxs
cyI6DQo+ICsgICAgY29uc3Q6IDINCj4gKw0KPiArICByZWc6DQo+ICsgICAgaXRlbXM6DQo+ICsg
ICAgICBtaW5JdGVtczogMg0KPiArICAgICAgbWF4SXRlbXM6IDQNCj4gKyAgICBtaW5JdGVtczog
MQ0KPiArICAgIG1heEl0ZW1zOiAyDQo+ICsNCj4gKyAgcmVnLW5hbWVzOg0KPiArICAgIG1pbkl0
ZW1zOiAxDQo+ICsgICAgbWF4SXRlbXM6IDINCj4gKw0KPiArICBtZWRpYXRlayxjYW0taWQ6DQo+
ICsgICAgZGVzY3JpcHRpb246DQo+ICsgICAgICBEZXNjcmliZXMgdGhlIGluZGV4IG9mIE1lZGlh
VGVrIGNhbS1yYXcgdW5pdCBmb3IgSVNQDQo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ICsgICAgZW51bTogWzAsIDEsIDJdDQo+ICsNCj4gKyAg
bWVkaWF0ZWssbGFyYnM6DQo+ICsgICAgZGVzY3JpcHRpb246DQo+ICsgICAgICBEZXNjcmliZXMg
TWVkaWFUZWsgYnVzIGluZnJhc3RydWN0dXJlIHVuaXQgZm9yIElTUCBzeXN0ZW0uDQo+ICsgICAg
ICBMaXN0IG9mIHBoYW5kbGUgdG8gdGhlIGxvY2FsIGFyYml0ZXJzIGluIHRoZSBjdXJyZW50IFNv
Q3MuDQo+ICsgICAgICBSZWZlciB0byBiaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbWVkaWF0
ZWssc21pLWxhcmIueWFtbC4NCj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZp
bml0aW9ucy9waGFuZGxlLWFycmF5DQo+ICsgICAgbWluSXRlbXM6IDENCj4gKyAgICBtYXhJdGVt
czogMzINCj4gKw0KPiArICBpbnRlcnJ1cHRzOg0KPiArICAgIG1pbkl0ZW1zOiAxDQo+ICsNCj4g
KyAgZG1hLXJhbmdlczoNCj4gKyAgICBkZXNjcmlwdGlvbjoNCj4gKyAgICAgIERlc2NyaWJlcyB0
aGUgYWRkcmVzcyBpbmZvcm1hdGlvbiBvZiBJT01NVSBtYXBwaW5nIHRvIG1lbW9yeS4NCj4gKyAg
ICAgIERlZmluZXMgc2l4IGZpZWxkcyBmb3IgdGhlIE1lZGlhVGVrIElPTU1VIGV4dGVuZGVkIGlv
dmEsIHBhLCBhbmQgc2l6ZS4NCj4gKyAgICBtaW5JdGVtczogMQ0KPiArDQo+ICsgIHBvd2VyLWRv
bWFpbnM6DQo+ICsgICAgbWluSXRlbXM6IDENCj4gKw0KPiArICBjbG9ja3M6DQo+ICsgICAgbWlu
SXRlbXM6IDQNCj4gKyAgICBtYXhJdGVtczogMTYNCj4gKw0KPiArICBjbG9jay1uYW1lczoNCj4g
KyAgICBtaW5JdGVtczogNA0KPiArICAgIG1heEl0ZW1zOiAxNg0KPiArDQo+ICsgIGFzc2lnbmVk
LWNsb2NrczoNCj4gKyAgICBtYXhJdGVtczogMQ0KPiArDQo+ICsgIGFzc2lnbmVkLWNsb2NrLXBh
cmVudHM6DQo+ICsgICAgbWF4SXRlbXM6IDENCj4gKw0KPiArICBpb21tdXM6DQo+ICsgICAgZGVz
Y3JpcHRpb246DQo+ICsgICAgICBQb2ludHMgdG8gdGhlIHJlc3BlY3RpdmUgSU9NTVUgYmxvY2sg
d2l0aCBtYXN0ZXIgcG9ydCBhcyBhcmd1bWVudCwgc2VlDQo+ICsgICAgICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvbWVkaWF0ZWssaW9tbXUueWFtbCBmb3IgZGV0YWls
cy4NCj4gKyAgICAgIFBvcnRzIGFyZSBhY2NvcmRpbmcgdG8gdGhlIEhXLg0KPiArICAgIG1pbkl0
ZW1zOiAxDQo+ICsgICAgbWF4SXRlbXM6IDMyDQo+ICsNCj4gK3JlcXVpcmVkOg0KPiArICAtIGNv
bXBhdGlibGUNCj4gKyAgLSByZWcNCj4gKyAgLSByZWctbmFtZXMNCj4gKyAgLSBpbnRlcnJ1cHRz
DQo+ICsgIC0gcG93ZXItZG9tYWlucw0KPiArICAtIGNsb2Nrcw0KPiArICAtIGNsb2NrLW5hbWVz
DQo+ICsgIC0gaW9tbXVzDQo+ICsNCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiAr
DQo+ICtleGFtcGxlczoNCj4gKyAgLSB8DQo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4NCj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+DQo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL3Bvd2VyL21lZGlhdGVrLG10ODE4OC1wb3dlci5oPg0KPiArICAgICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9jbG9jay9tZWRpYXRlayxtdDgxODgtY2xrLmg+DQo+ICsgICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL21lbW9yeS9tZWRpYXRlayxtdDgxODgtbWVtb3J5LXBvcnQuaD4NCj4gKw0KPiAr
ICAgIHNvYyB7DQo+ICsgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4gKyAgICAgICNzaXpl
LWNlbGxzID0gPDI+Ow0KPiArDQo+ICsgICAgICBjYW1fcmF3X2FAMTYwMzAwMDAgew0KPiArICAg
ICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLGNhbS1yYXciOw0KPiArICAgICAgICByZWcgPSA8
MCAweDE2MDMwMDAwIDAgMHg4MDAwPiwNCj4gKyAgICAgICAgICAgICAgPDAgMHgxNjAzODAwMCAw
IDB4ODAwMD47DQoNCkl0IGNvdWxkIGJlDQoNCnJlZyA9IDwwIDB4MTYwMzAwMDAgMCAweDEwMDAw
PjsNCg0KV2h5IGRvIHlvdSBicmVhayBpdCBpbnRvIHR3byBwYXJ0Pw0KDQo+ICsgICAgICAgIHJl
Zy1uYW1lcyA9ICJiYXNlIiwgImlubmVyX2Jhc2UiOw0KPiArICAgICAgICBtZWRpYXRlayxjYW0t
aWQgPSA8MD47DQo+ICsgICAgICAgIG1lZGlhdGVrLGxhcmJzID0gPCZsYXJiMTZhPjsNCg0KbGFy
YiBpbmZvcm1hdGlvbiBpcyBpbnNpZGUgaW9tbXUgZGV2aWNlLCBzbyBpdCdzIG5vdCBuZWNlc3Nh
cnkgdG8gaGF2ZSBhIGxhcmIgcHJvcGVydHkgaGVyZS4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKyAg
ICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMwMCBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+Ow0K
PiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4gKyAgICAgICAgI3NpemUtY2VsbHMg
PSA8Mj47DQo+ICsgICAgICAgIGRtYS1yYW5nZXMgPSA8MHgyIDB4MCAweDAgMHg0MDAwMDAwMCAw
eDEgMHgwPjsNCj4gKyAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3BtIE1UODE4OF9QT1dFUl9E
T01BSU5fQ0FNX1NVQkE+Ow0KPiArICAgICAgICBjbG9ja3MgPSA8JmNhbXN5cyBDTEtfQ0FNX01B
SU5fQ0FNMk1NMF9HQUxTPiwNCj4gKyAgICAgICAgICAgIDwmY2Ftc3lzIENMS19DQU1fTUFJTl9D
QU0yTU0xX0dBTFM+LA0KPiArICAgICAgICAgICAgPCZjYW1zeXMgQ0xLX0NBTV9NQUlOX0NBTTJT
WVNfR0FMUz4sDQo+ICsgICAgICAgICAgICA8JmNhbXN5cyBDTEtfQ0FNX01BSU5fQ0FNPiwNCj4g
KyAgICAgICAgICAgIDwmY2Ftc3lzIENMS19DQU1fTUFJTl9DQU1URz4sDQo+ICsgICAgICAgICAg
ICA8JmNhbXN5c19yYXdhIENMS19DQU1fUkFXQV9MQVJCWD4sDQo+ICsgICAgICAgICAgICA8JmNh
bXN5c19yYXdhIENMS19DQU1fUkFXQV9DQU0+LA0KPiArICAgICAgICAgICAgPCZjYW1zeXNfcmF3
YSBDTEtfQ0FNX1JBV0FfQ0FNVEc+LA0KPiArICAgICAgICAgICAgPCZ0b3Bja2dlbiBDTEtfVE9Q
X0NBTT4sDQo+ICsgICAgICAgICAgICA8JnRvcGNrZ2VuIENMS19UT1BfQ0FNVEc+LA0KPiArICAg
ICAgICAgICAgPCZ0b3Bja2dlbiBDTEtfVE9QX0NBTVRNPjsNCj4gKyAgICAgICAgY2xvY2stbmFt
ZXMgPSAiY2Ftc3lzX2NhbTJtbTBfY2dwZG4iLA0KPiArICAgICAgICAgICAgImNhbXN5c19jYW0y
bW0xX2NncGRuIiwNCj4gKyAgICAgICAgICAgICJjYW1zeXNfY2FtMnN5c19jZ3BkbiIsDQo+ICsg
ICAgICAgICAgICAiY2Ftc3lzX2NhbV9jZ3BkbiIsDQo+ICsgICAgICAgICAgICAiY2Ftc3lzX2Nh
bXRnX2NncGRuIiwNCj4gKyAgICAgICAgICAgICJjYW1zeXNfcmF3YV9sYXJieF9jZ3BkbiIsDQo+
ICsgICAgICAgICAgICAiY2Ftc3lzX3Jhd2FfY2FtX2NncGRuIiwNCj4gKyAgICAgICAgICAgICJj
YW1zeXNfcmF3YV9jYW10Z19jZ3BkbiIsDQo+ICsgICAgICAgICAgICAidG9wY2tnZW5fdG9wX2Nh
bSIsDQo+ICsgICAgICAgICAgICAidG9wY2tnZW5fdG9wX2NhbXRnIiwNCj4gKyAgICAgICAgICAg
ICJ0b3Bja2dlbl90b3BfY2FtdG0iOw0KPiArICAgICAgICBhc3NpZ25lZC1jbG9ja3MgPSA8JnRv
cGNrZ2VuIENMS19UT1BfQ0FNPjsNCj4gKyAgICAgICAgYXNzaWduZWQtY2xvY2stcGFyZW50cyA9
IDwmdG9wY2tnZW4gQ0xLX1RPUF9VTklWUExMX0Q1PjsNCj4gKyAgICAgICAgaW9tbXVzID0gPCZ2
cHBfaW9tbXUgTTRVX1BPUlRfTDE2QV9JTUdPX1IxPiwNCj4gKyAgICAgICAgICAgIDwmdnBwX2lv
bW11IE00VV9QT1JUX0wxNkFfQ1FJX1IxPiwNCj4gKyAgICAgICAgICAgIDwmdnBwX2lvbW11IE00
VV9QT1JUX0wxNkFfQ1FJX1IyPiwNCj4gKyAgICAgICAgICAgIDwmdnBwX2lvbW11IE00VV9QT1JU
X0wxNkFfQlBDSV9SMT4sDQo+ICsgICAgICAgICAgICA8JnZwcF9pb21tdSBNNFVfUE9SVF9MMTZB
X0xTQ0lfUjE+LA0KPiArICAgICAgICAgICAgPCZ2cHBfaW9tbXUgTTRVX1BPUlRfTDE2QV9SQVdJ
X1IyPiwNCj4gKyAgICAgICAgICAgIDwmdnBwX2lvbW11IE00VV9QT1JUX0wxNkFfUkFXSV9SMz4s
DQo+ICsgICAgICAgICAgICA8JnZwcF9pb21tdSBNNFVfUE9SVF9MMTZBX1VGRElfUjI+LA0KPiAr
ICAgICAgICAgICAgPCZ2cHBfaW9tbXUgTTRVX1BPUlRfTDE2QV9VRkRJX1IzPiwNCj4gKyAgICAg
ICAgICAgIDwmdnBwX2lvbW11IE00VV9QT1JUX0wxNkFfUkFXSV9SND4sDQo+ICsgICAgICAgICAg
ICA8JnZwcF9pb21tdSBNNFVfUE9SVF9MMTZBX1JBV0lfUjU+LA0KPiArICAgICAgICAgICAgPCZ2
cHBfaW9tbXUgTTRVX1BPUlRfTDE2QV9BQUlfUjE+LA0KPiArICAgICAgICAgICAgPCZ2cHBfaW9t
bXUgTTRVX1BPUlRfTDE2QV9VRkRJX1I1PiwNCj4gKyAgICAgICAgICAgIDwmdnBwX2lvbW11IE00
VV9QT1JUX0wxNkFfRkhPX1IxPiwNCj4gKyAgICAgICAgICAgIDwmdnBwX2lvbW11IE00VV9QT1JU
X0wxNkFfQUFPX1IxPiwNCj4gKyAgICAgICAgICAgIDwmdnBwX2lvbW11IE00VV9QT1JUX0wxNkFf
VFNGU09fUjE+LA0KPiArICAgICAgICAgICAgPCZ2cHBfaW9tbXUgTTRVX1BPUlRfTDE2QV9GTEtP
X1IxPjsNCj4gKyAgICAgIH07DQo+ICsgICAgfTsNCj4gKw0KDQoNCg==

