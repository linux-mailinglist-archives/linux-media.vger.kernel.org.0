Return-Path: <linux-media+bounces-41819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F44AB453D5
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 11:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 861597AE64A
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 09:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D4F296BDB;
	Fri,  5 Sep 2025 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZWYWo6yV";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PsVGAYeZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A03127C84E;
	Fri,  5 Sep 2025 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757066162; cv=fail; b=iKGN/KcnGkTFO1aWNt9gt8hsd2beV6P8jH3Ho85n6tvLoEM/ccgncc01aAN5x/HciJyvkn4ORLcAH2InvJaKnRJYQZdlA8WcKMCvX3VkE4hG/mww04SIHGNUb2vc6DzFgJDve9lk58nM8t/CkL1xIVW5wgUD/7ranNLvVh1oyx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757066162; c=relaxed/simple;
	bh=LO+MtiZBN//eRri/OvdaI5xbMlZOaXg06g/ao+wYNfg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NVvMjgrDPcZ2Q1L8+N3+dxS9om8rmkRe7HgoIhoqB70MbvKgM+GQb39n9aJyR55UNmy42XgpNasKI/awnVPpFQvymV5AfTJpXi4yxH+vjJ5rO5ueJAcV0JTQ4/nz4THoJ335hvpUmqQPxQEiMFymwUR0qJgadXreBSc71ITYNxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ZWYWo6yV; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=PsVGAYeZ; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8363b4228a3e11f0bd5779446731db89-20250905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LO+MtiZBN//eRri/OvdaI5xbMlZOaXg06g/ao+wYNfg=;
	b=ZWYWo6yV9CLsuwQu52NG0PpsYsRE7mcWAMCka3IGMsVaI3FpZRu2ip9a3jBUQ2ZR7hxlD2lIFsnq+Z4p97ZIzvoo9JrLSB39VVY9cIcj7UtrQjqDUm9uDz4CQlvoSYozarybeJBkK4LjXtrjocycu92UvxfeP2e6dwCK87N+L68=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:36424b3b-e643-4390-b2ee-956c42f3bb90,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:9fa8fbf7-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8363b4228a3e11f0bd5779446731db89-20250905
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 260075197; Fri, 05 Sep 2025 17:55:54 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 5 Sep 2025 17:55:50 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 5 Sep 2025 17:55:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NP0vF0YTOd0EVH4PseDoKIpanYkPne3ueCQ0HsBX1uH6mr9FR3jYG39HsxtMho73JhmA6/VxVfYI+Z8a0StOXAVv+SP4wvZYPGSLokanM1CO18B9lCcVwdF9zXL6YERyMlKSBemtKrDtSiGDecBONLaj/7gd4bfA7hTmOd/myqW/v8hNsaOFpt7IhxYUQUXX+ZKnGIzP+x1T2DnD6nXWdjtH9HyTdVCrxIgN3jWdWyJpOZhf22CrUZ1gDSrk+q7u/UOvon7alh4iIT5NOFxgwm3u+5JFzY4LjAu4VGp7ZBEhUy3fEfWjWcI91ZI6wqy1+DWPiTeP+KIkZQ/8O962wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LO+MtiZBN//eRri/OvdaI5xbMlZOaXg06g/ao+wYNfg=;
 b=CfsOGxgYzHm05IridNj0usbNqgpGuEF8cb6WQRnVULyVHgLTTVKBzSReEurltUJThb2Pi1pUaOWpmELjxxAC+4FMaVyOnuo/3HVnNJoOj6vExBjTjLdX1KmNHaw7WJ/MMK7tPGXjqx6r2KfbKjAami6y0NlWo9LBKvEIc9Io08HcwC0pd2qiohssXPJ8i2zggy4p8LoC2uOUrRG89VYeDxVToYDJjMinA4fZkEQZuVr9dQypzRKpWE8z4No2Pp7luZlVpTBJb7bcDK786qMPOdNDNMRHc1dXaz0MNxtovMDphAMpdT+63mxnCL+g/bYmejxap1HAC2Cxe+OMMC2rfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LO+MtiZBN//eRri/OvdaI5xbMlZOaXg06g/ao+wYNfg=;
 b=PsVGAYeZKaIZ/2sFtdvlzwPOijBkqeCzCaVeS2NNI2XER0dJ4+AJODgcpatFB8F12XqC1y30c1gaOOE8KMDxuIWrinZ6BjC46VNLHQXSnTDVA/lacDjiFqVD7Ol+Xrrw4/aznma34aKyrwwNqixtK7/WJHAFreY8O85gMSuvJ5I=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB7236.apcprd03.prod.outlook.com (2603:1096:301:104::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 09:55:49 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 09:55:49 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "nicolas@ndufresne.ca"
	<nicolas@ndufresne.ca>, =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?=
	<Paul-pl.Chen@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 13/20] drm/mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Topic: [PATCH v7 13/20] drm/mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Index: AQHcF0eMBkzg/SuCcUOm87fU0QNRUbSEZ/SA
Date: Fri, 5 Sep 2025 09:55:49 +0000
Message-ID: <8756a24796e69e7dd2eec28b65b5c5c788f46467.camel@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
	 <20250827114006.3310175-14-jason-jh.lin@mediatek.com>
In-Reply-To: <20250827114006.3310175-14-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB7236:EE_
x-ms-office365-filtering-correlation-id: ecc1fba9-2f96-48d3-50e0-08ddec6264ab
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|42112799006|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Z3p6cmJvRDlmZ1lwOU1pME5peUY1UXViSExTKytIdFZ6RG51em1HZkVKVzR5?=
 =?utf-8?B?WlN3MUtTSEpYOW1ZUzNrTUxLWENNK1psOUNsNW9vQkpIYS9DeWUxbXl5Vlhj?=
 =?utf-8?B?aE13RzZFbVQyMHNZYTFTYVg2MWplS2NJbXpZRkt2Y2U1bzNoRnhUUkc0OTlW?=
 =?utf-8?B?N1NZcWw2ejZ5bklOZFFJcjVWUk5naFhuVzhGeHJyUHpjcFl0eDlOSE1ITkJR?=
 =?utf-8?B?NGxGMkFjSzFiZy92QzdhU3lPQW44Mi9reFRnRWdrYlZNYTZ3QTI2eW9wNGRt?=
 =?utf-8?B?KzlOeDNZZ0ljaW5uajVjQzJtdWpjZVF3YTNPU0lpbEhnS3RNYjJUN0dJMnhs?=
 =?utf-8?B?T0tpbWxEODErYnVCdEdySFJBSnIrVjFYdFJtMCs5Ym9vTzc1S2xhSnFOTjU0?=
 =?utf-8?B?OXhERnlPcjI4SFo5U2JRRFhVczA4OEtWLzgxbjBYbzBNcDVjd0hHQXN5TUxH?=
 =?utf-8?B?T2UzcTJCWjZ3aTZFMlhCY3hTcTlwZHJhaFpNZS9aSGVaVWNuTTJSc2xLaXZ1?=
 =?utf-8?B?M0dOWVNtVy9QZGl4Z2pxdVVvd29WT1BncTBtOFcwSndHWXphSFZkdjl0ZWY1?=
 =?utf-8?B?dTVHbHQ2WjhGVUtoVWdjcmxwdnFTY09sQnNsT2laM1dXTzEzR2dDNHlBUGc1?=
 =?utf-8?B?SVE1cElvTEVEczBoYWhwNUh3a3Q5KzRCZ3BKOGhlaEZhdEh4RHd5OVB4OW5B?=
 =?utf-8?B?Y25kWXkyQXNGcVNDL1RBZFVuVnFPNktVTlAycnBtbTJjdlh0cVZoY0Mwb3hT?=
 =?utf-8?B?S2xJdFBXdDVFU1VYbkdCbkVSZGJSakVPOGUybW40WnpGb3preDRmN1dRVVRD?=
 =?utf-8?B?NldtTG95eTB0Y0g0Nld3UkJzOFpDTW4xTnBGcUdyMFJnUjhHUDNuTEZwaWNR?=
 =?utf-8?B?SWw1R0x2ZVhCblBIeDYwVUl0YnFhQS9KQm5qcEQ1SHQzZytqQkJVVGJtSEdh?=
 =?utf-8?B?SHZIR0d5UXF6aU1ac3JiYjAyS2NWalFuSG5HdHE0TUtmQWxVVmJ5emUyRHpZ?=
 =?utf-8?B?dTBNYyt4MUNYRWd0RDR6SlRYbmw0UjZLQlptOUNONlJ1YjFjQ3VhczA5UHZp?=
 =?utf-8?B?YnNMQXc4cXNvQ0FkbTBFdHZTa0dXL1NjTWlSUndqaGRkSmx1czFGOU9wbEtl?=
 =?utf-8?B?S2l2SjFIWWFHdXIxUHF0aDR4ekxEVW5jUzhjUTVzNWk3eWhPd3AxdHU2bU52?=
 =?utf-8?B?bDFvMVBzV2kyQW1qWGYzb01OVWpzR3VxOVl5UkZFeEJHUzl4cXZGbVR4UG1V?=
 =?utf-8?B?ZUpmZFRPbHpackd0UVdJdktPVTV6UlhFOThhSmdaWlJseEJBZnRxZVNKUHhj?=
 =?utf-8?B?T3JtTGVqNkxLQ1ZlNUpSUVUvSmRRK1dKQVE3VkJCSzNpaFlxTzl3ai9EQWwx?=
 =?utf-8?B?TEZSWDlOVkp2QVF3bXlJUzl5azlZWm4yTHN3bmZudTNNb0FLYXg1OS9kNnIr?=
 =?utf-8?B?T1picksvQmNsaXdtZlN3bHNUMEowMzRMUVBQNnF6dGRuUmUzTUhRTWFpeXg4?=
 =?utf-8?B?b0V3VVJxOXRJdU83N0cwTVdsWmhIbXY4V0JReWYwZHZCTTBqZ2ZCZFd5MkNk?=
 =?utf-8?B?NU9PYmZtTFNjTVhJYTdlNXloOVlUSDVWUzNBVXBMVmNVSFVXN21CRjI2TGV2?=
 =?utf-8?B?d045T0tmZklVK2g5bW4wSklhelBGV0VaSWtsOVNrU1JsOVFWVmJETE03S3dZ?=
 =?utf-8?B?eEV0bk16eVNzZEM5WWdrbEQxVEdYa1F6alQxUUtEOFhrUXFWdzNlcGNNZ0JF?=
 =?utf-8?B?S2pQelovMWkxWGo4UDhRU2Y1R2JqTngvUGpkVUZlMXJZK2pVVWxYMzhnVmpE?=
 =?utf-8?B?d29YUktPTU9XR2lEYTlMTWtMdE5ZTW52NjZvc1FUbmhmZzRxdDRhOS9aNUk0?=
 =?utf-8?B?TXJna1l4RjZ3RDdvMTBqWDFtSktMWUpyUHk0U2I4ckxMQ3NYcWRqL2xLcEJS?=
 =?utf-8?B?ZjVUQlozN25NZGlwWjU4WHJpUjhJWDRCTW5IRE5rUHErUUpXdTZhelpKWHVw?=
 =?utf-8?B?TGt5U0tBRXpnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUxjRWlQTko5MjZFR3QyTzRRTzE4N1NMWU94Qmpob2FrMi9rV3o2bmZBUVli?=
 =?utf-8?B?VTI0UnloVjd1RzU0WFRacUhZRTJJVEptR2VlUjNhV28yTUY4RjNzdWxtSVMw?=
 =?utf-8?B?V2UyUG1vYXNob21xWldUY3BramxCWnNFNnJrT0ZOWlNtM3JsdmVxRTF4NVNG?=
 =?utf-8?B?ZTVrRUlzWHNmektLVVNsZTRUNzFVT3l1Vy82Z3ZycEJFQ2pVZ2piZ0ZWdVhu?=
 =?utf-8?B?eloxZlI5RTZBd2xlZS85aEZzdysrbUErOGtYdXRyU2hZWmJPVWo2MGNxN2dJ?=
 =?utf-8?B?SGlCaXBEanYxbFYzQ2F5aHkyekFBSDJNTHlvWUZ4YTI2VWpucnJFeXQwRmNr?=
 =?utf-8?B?S2ZzTUtyeUxJWmNBWWNWenplbWJIZEpmVWZ1S1AzcWJKWkpBWHY0aUV6QXpl?=
 =?utf-8?B?SHo3eVdYZXZGOUtISWd6MlcrSlJ0SGtKSllUU29qWCttajBzMlBxNXpJT2gx?=
 =?utf-8?B?T1dnUktsWkhMU3Y3ZXR2aTQrdmJOTFRacXZDZ2x3aHkxOEdPL3dteWJ5a2RU?=
 =?utf-8?B?NlFYQ000Lzh1RTNSRkhZa3I3U3JUMFNINHhabUJBRWFva0VXd2o0eGNxS201?=
 =?utf-8?B?R1hndHUwcTNpM0kwRTYzVEptK250cUFEMjRwRXQ5K1B2eGhSaHdiR1VtU01o?=
 =?utf-8?B?SzZoUkxxVmN5OWZpeDZCeTNwNVZoeGdmZU1QRi9MWno4b1RtR3JieGJNaXh4?=
 =?utf-8?B?alcxYnl2QVhBZ0ZXQ0RTSEExUUcrQ1I2MnhGL3dsdzhOWWR4NFgrdnpmdnhD?=
 =?utf-8?B?Wk1zMkpCcjZQRmlqN0taRWVTb2ExTjhFSUNCSFB0Z1I0SHdtSlNvVytMaHVp?=
 =?utf-8?B?VlFQSEhjVXVZOFp1SWtWamFWR0RrSksyMXJ1Q1BONlluWnpZRkx4bnhLTWFQ?=
 =?utf-8?B?L3EzMFVIbzYrTnhrWEdnTEIzajc4WmFzYVZwRm5pSWVPYU1mN3JiUndNa1lz?=
 =?utf-8?B?TkZjOFo1Y1o4RWVoRHpzMlpDczc0MThZaTdDaXFya0t5eEpOa051dVhPa0t0?=
 =?utf-8?B?L2U3Q1ZCa1ltakFINFVjMjM1L0YwOHJBSEZEYjlha0hLa0g3eWQxR2ZESXBM?=
 =?utf-8?B?RXJYUmtYQmR3Mk9NSVIwSktxWUpLeDBYM1ZNTTUyakRsS1BCR0tzRThPYkpw?=
 =?utf-8?B?N04waWpDWm5EWWRUOW9jSFAyNjBTZHg1NC9JakJKWnAvNEg3REpuTUlQSXZH?=
 =?utf-8?B?NHQyNUV1Z0pSTTFzdGJ1b2w3WHNQS3Rkb1Jxc2MzNnByRzBVaUxyb2F2bFAw?=
 =?utf-8?B?WXo1QWhXNCtVNHZRTmwrVTFBakFVVFViNTMrenM0eE53cnJkSlR4RU9ob3Z1?=
 =?utf-8?B?TUpyYmFRamZ4WWhJWU5VRnhhTFRKQmpweHg0U3NuZkpXbDBzWjY4Uk5hdzZQ?=
 =?utf-8?B?MUNlNURsNlFVdUFyN29vVnNNd0p5YnFzR2l6dXdMaTh4S2ZEY09IdSs0YUs4?=
 =?utf-8?B?UGQvY3dnRTBIN3JpMTY3NFZFZ25rR2MvUmN0NEtjaldqc2MxdXlYSDZ3cFRI?=
 =?utf-8?B?dHRNQTBEMGFMc3lkOHIvaWJnUUZRZ2hka3pwSUVKc056NW8vSk5IVnBHZXdD?=
 =?utf-8?B?c3l2SDdKRUNBcEpNU1gwVDcxOWpBaktKSzhZa1JrSlFyelp5a1RyY1phRm5Y?=
 =?utf-8?B?cHhBYmVqMHp2RHRsOUIvMU5QQkh2NEhuUGxaNnRjVHN3NHJvcHgrOTRhbGZs?=
 =?utf-8?B?dG16S1hKdzhDaDhOL2JDa216Mm1wRUEzeVZPYXI2Qlo3Y2tCZHI2NTZhTmZ1?=
 =?utf-8?B?Z3NHeW5XWHA1RnNCeG1OWjJNVTdxbDV2dHhmY0tjRXdsN0dmVExCMmRnWjhq?=
 =?utf-8?B?YUVlZW4yYkRwZmNScjJEWFBRV2Z6N3NwNGwyTmx6UHhESUxzZGFCNy9SdjEr?=
 =?utf-8?B?dWpDaXRHeXk0TU9iU0FtU29lMWsyc2gzbkxVQnduZExYZGFha2ZmTHF2aDZO?=
 =?utf-8?B?ZkFlaTg4L1BKTVBRdGxubmdaa1YxaXpuNUFydW45WE14N1BnMFY1OU9PRC9z?=
 =?utf-8?B?T2F5WEkzeUJ4UEVHWGw0c0JGckwxN3lZWDVKeHVJTGh2N0xCNUczYUtpL0Zq?=
 =?utf-8?B?NUt3b0hNYzBGZmVQUVFLVkwvT2lZZlUzbW1PWGdBVXU1ZnY1Znd1djNvREdZ?=
 =?utf-8?Q?aLrgIS+mTCJzMOiR3T0W+PYEk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C717B2179472D4FA98531EE93A2BA3B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc1fba9-2f96-48d3-50e0-08ddec6264ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 09:55:49.6300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rRels+m99P4L1Q97fzzEKZ0FzVOARc8KJUnfJxf4Z3KR84PJUFvrxExksmkDyjc4qP62Mxueu+1HU0ZkTH1mRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7236

T24gV2VkLCAyMDI1LTA4LTI3IGF0IDE5OjM3ICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IFRvIHN1cHBvcnQgaGFyZHdhcmUgd2l0aG91dCBzdWJzeXMgSURzIG9uIG5ldyBTb0NzLCBhZGQg
YSBwcm9ncmFtbWluZw0KPiBmbG93IHRoYXQgY2hlY2tzIHdoZXRoZXIgdGhlIHN1YnN5cyBJRCBp
cyB2YWxpZC4NCj4gDQo+IElmIHRoZSBzdWJzeXMgSUQgaXMgdmFsaWQsIHRoZSBmbG93IHdpbGwg
Y2FsbCBjbWRxX3BrdF93cml0ZV9zdWJzeXMoKQ0KPiBpbnN0ZWFkIG9mIHRoZSBvcmlnaW5hbCBj
bWRxX3BrdF93cml0ZSgpLg0KPiANCj4gSWYgdGhlIHN1YnN5cyBJRCBpcyBpbnZhbGlkLCB0aGUg
ZmxvdyB3aWxsIGNhbGwgY21kcV9wa3Rfd3JpdGVfbWFza19wYSgpDQo+IHRvIGFjaGlldmUgdGhl
IHNhbWUgZnVuY3Rpb25hbGl0eS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpIIExpbiA8
amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RkcF9jb21wLmMgfCAyNCArKysrKysrKysrKysrKysrKystLS0tLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYw0KPiBpbmRleCBhYzY2MjBlMTAyNjIu
LmQ5MDJhNjVlMTIzMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kZHBfY29tcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2Nv
bXAuYw0KPiBAQCAtNjYsMTQgKzY2LDI4IEBAIHN0cnVjdCBtdGtfZGRwX2NvbXBfZGV2IHsNCj4g
IAlzdHJ1Y3QgY21kcV9jbGllbnRfcmVnIGNtZHFfcmVnOw0KPiAgfTsNCj4gIA0KPiArI2lmIElT
X1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpDQo+ICtzdGF0aWMgaW50IG10a19kZHBfd3JpdGVf
Y21kcV9wa3Qoc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCwgc3RydWN0IGNtZHFfY2xpZW50X3Jl
ZyAqY21kcV9yZWcsDQo+ICsJCQkJICB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB1bnNpZ25lZCBpbnQg
dmFsdWUsIHVuc2lnbmVkIGludCBtYXNrKQ0KPiArew0KPiArCW9mZnNldCArPSBjbWRxX3JlZy0+
b2Zmc2V0Ow0KPiArDQo+ICsJaWYgKGNtZHFfcmVnLT5zdWJzeXMgIT0gQ01EUV9TVUJTWVNfSU5W
QUxJRCkNCj4gKwkJcmV0dXJuIGNtZHFfcGt0X3dyaXRlX21hc2tfc3Vic3lzKGNtZHFfcGt0LCBj
bWRxX3JlZy0+c3Vic3lzLCBjbWRxX3JlZy0+cGFfYmFzZSwNCj4gKwkJCQkJCSAgb2Zmc2V0LCB2
YWx1ZSwgbWFzayk7DQo+ICsJZWxzZSAvKiBvbmx5IE1NSU8gYWNjZXNzLCBubyBuZWVkIHRvIGNo
ZWNrIG1taW5mcm9fb2Zmc2V0ICovDQo+ICsJCXJldHVybiBjbWRxX3BrdF93cml0ZV9tYXNrX3Bh
KGNtZHFfcGt0LCBjbWRxX3JlZy0+c3Vic3lzLCBjbWRxX3JlZy0+cGFfYmFzZSwNCj4gKwkJCQkJ
ICAgICAgb2Zmc2V0LCB2YWx1ZSwgbWFzayk7DQo+ICt9DQo+ICsjZW5kaWYNCj4gKw0KPiAgdm9p
ZCBtdGtfZGRwX3dyaXRlKHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QsIHVuc2lnbmVkIGludCB2
YWx1ZSwNCj4gIAkJICAgc3RydWN0IGNtZHFfY2xpZW50X3JlZyAqY21kcV9yZWcsIHZvaWQgX19p
b21lbSAqcmVncywNCj4gIAkJICAgdW5zaWduZWQgaW50IG9mZnNldCkNCj4gIHsNCj4gICNpZiBJ
U19SRUFDSEFCTEUoQ09ORklHX01US19DTURRKQ0KPiAgCWlmIChjbWRxX3BrdCkNCj4gLQkJY21k
cV9wa3Rfd3JpdGUoY21kcV9wa3QsIGNtZHFfcmVnLT5zdWJzeXMsDQo+IC0JCQkgICAgICAgY21k
cV9yZWctPm9mZnNldCArIG9mZnNldCwgdmFsdWUpOw0KPiArCQltdGtfZGRwX3dyaXRlX2NtZHFf
cGt0KGNtZHFfcGt0LCBjbWRxX3JlZywgb2Zmc2V0LCB2YWx1ZSwgR0VOTUFTSygzMSwgMCkpOw0K
DQptdGtfZGRwX3dyaXRlKCkgaXMgbm8gbWFzayBhbmQgY21kcSBwcm92aWRlIG5vIG1hc2sgYXBp
LCBzbw0KDQppZiAoY21kcV9yZWctPnN1YnN5cyAhPSBDTURRX1NVQlNZU19JTlZBTElEKQ0KCWNt
ZHFfcGt0X3dyaXRlX3N1YnN5cygpOw0KZWxzZQ0KCWNtZHFfcGt0X3dyaXRlX3BhKCk7DQoNCj4g
IAllbHNlDQo+ICAjZW5kaWYNCj4gIAkJd3JpdGVsKHZhbHVlLCByZWdzICsgb2Zmc2V0KTsNCj4g
QEAgLTg1LDggKzk5LDcgQEAgdm9pZCBtdGtfZGRwX3dyaXRlX3JlbGF4ZWQoc3RydWN0IGNtZHFf
cGt0ICpjbWRxX3BrdCwgdW5zaWduZWQgaW50IHZhbHVlLA0KPiAgew0KPiAgI2lmIElTX1JFQUNI
QUJMRShDT05GSUdfTVRLX0NNRFEpDQo+ICAJaWYgKGNtZHFfcGt0KQ0KPiAtCQljbWRxX3BrdF93
cml0ZShjbWRxX3BrdCwgY21kcV9yZWctPnN1YnN5cywNCj4gLQkJCSAgICAgICBjbWRxX3JlZy0+
b2Zmc2V0ICsgb2Zmc2V0LCB2YWx1ZSk7DQo+ICsJCW10a19kZHBfd3JpdGVfY21kcV9wa3QoY21k
cV9wa3QsIGNtZHFfcmVnLCBvZmZzZXQsIHZhbHVlLCBHRU5NQVNLKDMxLCAwKSk7DQoNCkRpdHRv
Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAgCWVsc2UNCj4gICNlbmRpZg0KPiAgCQl3cml0ZWxfcmVs
YXhlZCh2YWx1ZSwgcmVncyArIG9mZnNldCk7DQo+IEBAIC05OCw4ICsxMTEsNyBAQCB2b2lkIG10
a19kZHBfd3JpdGVfbWFzayhzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0LCB1bnNpZ25lZCBpbnQg
dmFsdWUsDQo+ICB7DQo+ICAjaWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtfQ01EUSkNCj4gIAlp
ZiAoY21kcV9wa3QpIHsNCj4gLQkJY21kcV9wa3Rfd3JpdGVfbWFzayhjbWRxX3BrdCwgY21kcV9y
ZWctPnN1YnN5cywNCj4gLQkJCQkgICAgY21kcV9yZWctPm9mZnNldCArIG9mZnNldCwgdmFsdWUs
IG1hc2spOw0KPiArCQltdGtfZGRwX3dyaXRlX2NtZHFfcGt0KGNtZHFfcGt0LCBjbWRxX3JlZywg
b2Zmc2V0LCB2YWx1ZSwgbWFzayk7DQo+ICAJfSBlbHNlIHsNCj4gICNlbmRpZg0KPiAgCQl1MzIg
dG1wID0gcmVhZGwocmVncyArIG9mZnNldCk7DQoNCg==

