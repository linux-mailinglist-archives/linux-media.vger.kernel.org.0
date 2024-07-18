Return-Path: <linux-media+bounces-15101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EF3934687
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 04:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D99E9B21F53
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 02:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD23D2C1A2;
	Thu, 18 Jul 2024 02:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Bh4Adss0";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="V40PQuBd"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700BF29408;
	Thu, 18 Jul 2024 02:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721271263; cv=fail; b=VP4bSLYsEckM7QfpaLMpP4kZ761NxRezrvNJoI5spKRT1c2lZtEBFWFFKjQEqK30XMbZLTRspXvvd5cXZbPNXV4sUDuT0O3NqySjlWOsKibAIgaENlLVcV81jtbRKCZeBRqqhKsrhZn2k30BKw79xq3zk51kmzrrbF0RcRYZ35k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721271263; c=relaxed/simple;
	bh=M8nF+M1tmaJ6Qu0IOUWXeUQDH0N5aZN3Qq6w7Ej6wFY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XL3s5++VkMkQQGhBDwxiXS8wnIxqyuF3WK4HEElILX+ZkQ8hlJE6GGhI4B4w0c6j7peFhf5DkiXx1yCqU9Jaw+0wnPOyjBYFnDwSXFluQlf+/wRJlEhBhpZWnl/iuv3VDri4p6tlTBEoOA1UTIXW+02gpyAdK2o0e+yTcbJwtYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Bh4Adss0; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=V40PQuBd; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 033019a444b111ef87684b57767b52b1-20240718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=M8nF+M1tmaJ6Qu0IOUWXeUQDH0N5aZN3Qq6w7Ej6wFY=;
	b=Bh4Adss0luj/c6fEbstBn4n62WQPerpVeBXSWKMdYy0KAFSDEjWVVgbOr91HzDfdg5xc+CCQmBNQ2zwDwz9hFWy04ZJQtkqJB7MRYilvmUOYJxMfTpndkbxF5rzkM86mvqR30sf0zx8PpQGnPM5+xWHmC8a6f34fo/3jIyreO3g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:ef7492b1-ee79-42bf-b599-dd6adea322d5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:c9247ad5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 033019a444b111ef87684b57767b52b1-20240718
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 178008284; Thu, 18 Jul 2024 10:54:12 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 18 Jul 2024 10:54:13 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 Jul 2024 10:54:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KL7wE3ZrJu3BiGnp/QXQ1AcneAOTGE5NwwqbZcoOiqbERyHYvr/vShrYkExgbSPQ8KK7Eq0P+FdEfqXkIosPO5V5jhJZVloxGtzNmti144O4V7q3SxkEHTlUFquyc6SSjECEVhfvXZgU+g14y4m3vEXqZIthwLBYNMFuX5LvA9u2ArRizLYTMuqPeLVmi+wmpa/Bx4s1gQkQ9E1xw+j10aNHXUuEQxQVNsRjF+MAFoDLAD0nR2fupRVJO67xxZT3OCYD/zCHl3s/XHs3yr4mceRICMmsoPEyMQWRB9JjZ9UOcI2SG88wTR8yhPKKJVjxbphZ1zScTkSydkm+fhbbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8nF+M1tmaJ6Qu0IOUWXeUQDH0N5aZN3Qq6w7Ej6wFY=;
 b=y0Xnz46epf20yZFe02JkJ7PCQ/VVTEW4U3pu3APdDlQECD0bWZka4Am5upMPND0EaX9tYyZlu56PRQaARR0Xe9RHl2/RU3TTLlptyKUCZEYLISSTuueXoZV+elCxdE5Kl2BSNwc//iOEX1pFqx+wgjk4SM0+wOaR64H7SdblPEihp3WH3MzciM1fASYXFfDyhCtfzs7OffA/GYIWsWEF53GD2WfUAkkVTHZvPp6WPLAlYicdgU+9G1NF1RV7AUCjTJsY9OGucl2jkL4w7nROa1ArkwcsTc8C0j4sXqi0343Mfvtbej1yMA+MjBHalTLcHq+P+e1JbqnZ14b00jj06w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8nF+M1tmaJ6Qu0IOUWXeUQDH0N5aZN3Qq6w7Ej6wFY=;
 b=V40PQuBdUAahjO2uCHlsRPa7jYmX81AmqbFJBZj7Njhaf+8EegZmTA50gpZ885jM4jNPQr1k5SWVo1UclGWyFjn+Cqc64FSNSDxdPgnnSd/a8MQK46azR8XRud2IcqunPYhZAWsLZE7ep6EeRN8raEEHECoZJv6JvN9EJ7UYCrY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7883.apcprd03.prod.outlook.com (2603:1096:400:480::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Thu, 18 Jul
 2024 02:54:10 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 02:54:10 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"jstephan@baylibre.com" <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Index: AQHazhdkyJtqWsdLFUSbwSAjf5xgNbH731aA
Date: Thu, 18 Jul 2024 02:54:09 +0000
Message-ID: <85c54f0b1b8bb5d9026c67109a3526fd95cc013b.camel@mediatek.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
	 <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7883:EE_
x-ms-office365-filtering-correlation-id: 3237b49d-696b-41ec-da98-08dca6d4e5e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?enFTU2w2RHI4endnemZjYlhuOE1oVlEzUStsVzFVWGVhc0RlNlVKTE1Rckk1?=
 =?utf-8?B?azIrN0hZQmROWnZCTVRiVEIvMndpanBWZjhFV08yck5QbHlZWDBkbENCcThX?=
 =?utf-8?B?dEtVVEpzRlJQZUVBLzFwSk5JNFFOMEdac09XUkppR0VEYzZQMFZkNyt0eUt3?=
 =?utf-8?B?RjR1YlkzSEVGUUhBcnpGNE50WXdobmp5M2dqSThXN0Q5Wmp3cFNFcFR6OGRK?=
 =?utf-8?B?dEZHdWlJcWtNZTAzSktlL0lFZGVqR1VnMm5rWlR1SUNZcWd0ZUlHTGlxQlVI?=
 =?utf-8?B?RjZzdDAyRlRCVmVNT0FFdDY4QmM1UGtkMVhxa1YydFBhVnh5MDF2K0J4d3BQ?=
 =?utf-8?B?dUZCN2VHZUlwSEMrczliem1JSUpjQktiTjF5aHlWMURIcTBkc0xscVBuOHBK?=
 =?utf-8?B?dDB0ZEU3VDh2Nm9KTVNER1lTTCswVzNQYXRVdlk0RFNiQjNERU1GcWlncjc2?=
 =?utf-8?B?SVF3ZXZqWE4vb29wTjQ3VzNDb3Vic3ovZjRrT0tjeXNGQ1RKSEZLOGl5bGRD?=
 =?utf-8?B?QlNPMWljZllGV1lZMElQZU8zWmlRY1dQZ0tFOWNLY1BxaHdzUlQ5ODh4S3ZJ?=
 =?utf-8?B?c2pKN29KbFo2U0lXOHZKeWQ1bll1Nk1UQmdkaTJHcTJuUjIzdUlGMlRDb3dD?=
 =?utf-8?B?MzVHZzl2T2NDRkpmYnVYeTNESmxwL2MzVTVPTStIYzVJUVBKWHBHVXJxK0RV?=
 =?utf-8?B?dmd6d3lnNXlkQ3pVZUxHL3JmK3pvS0d2KzV6S0JFRVNIVUFlaU8zcFpGM0ll?=
 =?utf-8?B?cFM1cCsyMW8wUXVrUWlLOTJwN1EwVFlWQVBhd3JKQVhQTmlxbzdaMUtSV2Vu?=
 =?utf-8?B?QjdmbTM1b3VyamRJMUFSaFBUZkJ2dzlyS3pZb0JnV2l5Z1VEeVQyZ1BKRi9L?=
 =?utf-8?B?ZjQ3djB4TTNCYk9XaGtRS3dFWEkyK0hJK0FveklTTVViaUwxditSRzYvdGRh?=
 =?utf-8?B?Ujdqa0VHR280ZjdRSDM1VGQ5ZVNnMk1iRUdsbFZTbHBhTTlUekxCMW9qTlJW?=
 =?utf-8?B?SVlYR0haYVhBazZFR0dYaTlMRDFhYWhJWGl6YjF3dHZaWmdkdGN1bEtOa0RG?=
 =?utf-8?B?ck9VOVAxUGNwdWxFRDBKZFR5ci82eWVoTnpSdXU2T2c5QVFFbUt2aDBZTlRk?=
 =?utf-8?B?WWRGVWsvWXhnb2NZZHdaQzdHSHh0OTVYV3h2T0NYUU9YS1RneUp3dDVYcjU4?=
 =?utf-8?B?TW9sbVdvc1pETytVRjBmSzYvMEJjYWlkaG1PdlRYSGdneEdDVGlMTXBlWjE1?=
 =?utf-8?B?WGFkd0RlejNzQ0RJNlY2THFCZVNuaGc4ampjSGtjVUJKSWl3THZEUFJUT1RI?=
 =?utf-8?B?YURuczg1ck5BdTZka1JMRnRQaHMvUUROblF6SnRuSFV3RFFpMnE2YTRqMjVr?=
 =?utf-8?B?MkxKUTBFMUdxZXFyTWw5bTZzUGh1czZseldzcTFGajFtbXlLakl6UEMzT25j?=
 =?utf-8?B?WnVLeEpST2pGUUZaNFBqZmtHbEIwR0tTWFFRNVRWc29FblZHTFh2SUpyTENi?=
 =?utf-8?B?TDJjZzhqYjFhVjlLYS9pQjZGVkJRY0Z2ZUE4aWVuMVk1djVJd0VKeEk0UWJX?=
 =?utf-8?B?T2Juc3J2U0lhNmEzS2Y1SmlhY0UxMjhiYWY3cjNuQjJkbDZUUS9MbDRaeWVQ?=
 =?utf-8?B?eURPaEMwMjVBR3NOTDUxZ1ZoNldnbG1xNDBZVUUyczQzM1M3Qk1EenB0SFR5?=
 =?utf-8?B?eGZ2YzY2MklPekp3L1FFemV0UTRLWDdNTUJWckRsZXgzbjZzd2RRczlId0tw?=
 =?utf-8?B?VGppZ0hwK08rcDdXTnZMWklnQjUrZ3VySytjSk1Ta1JTbVJ6SUtEMHpXd1Nz?=
 =?utf-8?B?eHNpamluNmcwWlRuYmVsYk5VSmI5M1M2WHZlOUhlUzVjdkZ0NWdnQ3J0N3JU?=
 =?utf-8?B?bFpCWWwvVGxiL0RzM3lYYWtMc3FlUERHa0p6QmFHS2l6THc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDRJMkN3eEpvTGQ4NmVrTGlyYzEySUhDQXptOEUxdUtXR2dGWUNKWUhjUG9s?=
 =?utf-8?B?alBMYlYrNDk2UVdJYlhNMFFVMFZjYnczNWx3Qi9UNVZkS2NFV3lPR0Z5b3FT?=
 =?utf-8?B?dUVxSzYxVWxPaHY4K29Hd0xqRE5NSjRFc0dJenpKcHc2cTZ5TWxhNWd4OW00?=
 =?utf-8?B?VVQ3dEV6ak8yZDNpWWZDOWozS2d0d2lENHFiN2dhWmszZkYvdjdRR2NHRVpJ?=
 =?utf-8?B?cVdQNTdXeVVBVE1FTjBPbklmZFFxcjJCb05GQXhReTJESXYyenNhLytFMVE5?=
 =?utf-8?B?bnJJRCtELzhueHJCNDN6NTg3YXFDT0FteHEza0JaT3dvaVcxTDBNeGxsZEQr?=
 =?utf-8?B?dzJLM2lZQWZMWHJobnJzZTVxckpwdEd3a2hiS1dRYWpXKytNeldpQXhXdnlj?=
 =?utf-8?B?c1YvWVgwK3ExVzVtWGpGZmcxTHoxZjhSNFl0NGpERURoV3FqSFQyTVErcXV4?=
 =?utf-8?B?cW9FUnc3ODN5RjRsSnRQSzhUQXZDNVBTcTB6T2hLOWlxMUx3M0wvSUpDSWls?=
 =?utf-8?B?Q2tqUjJqV0x0NzVJbzhmVTBuc0dxcWExblFzckRwVDBTcURKb1RqTlcvZitj?=
 =?utf-8?B?OXZ1V3pKaHVtbVBSbWpWcUFsS0pJb2xSWlM2ZnhhYTh3R1Jxc1JlZXVIZFBG?=
 =?utf-8?B?Q0pyRmFVMXBwU3JIam5zQitIZVRmS0RTa0dwY2hycE1tQ2ZVSWIzNTdiRnFv?=
 =?utf-8?B?TldlMnk1MHNzWmtxT2FDWkxRcEhUS2EveHhrbWh3N3daSDRxVmxuSTZ1dm5x?=
 =?utf-8?B?blM5YjNlTmVESUhleWFMaThLN0lSS1NENUtYQk1GRW9TVVFvdElhRVVsQjJo?=
 =?utf-8?B?b3lkV0MzZ3ROZFFjWG1qQW5GeG44YkpzRnNVV3NqNXhGaHUyRDR3WlBrVTF1?=
 =?utf-8?B?Y0NyNk8vbEJxU0o0bW1YU0lZSDYvUmdndmVjQ2NMcWxPOGgyUXIxNG15eU9Y?=
 =?utf-8?B?SUJEbXJZdUljZkVhQi9JSWphS3JmYzhJZWVTSkN3R3V2bnEzQVQyM2x2NnJC?=
 =?utf-8?B?NkFPaFlnYjg0SWFSMG1XYnROZ2JKMVZrZkloRFVuQ2FvVUhZUUEwYlBrZ2lF?=
 =?utf-8?B?azN6YUpTQlgvczNyYmVJeDNqTGNPL0tpRUM0cXlkQ05VZ0tHSEhHMnRrdWFJ?=
 =?utf-8?B?OEhQUXpmaVdkYlNtaVA0ei9ISkt2T3VtR0o0ckE1SS9sSGRHUUlOUmlrUE54?=
 =?utf-8?B?cE9lQlpIZ2FIaVk5VHltMThrKzJSWnlxdHhBaldFZXBFdXhzUzdpZ2srdEZ5?=
 =?utf-8?B?dmo0eG9lNTVRV0xVUG5taFQyd2V5OFBXN1RmZkNNRENUTXJYYUdWSktOTk1j?=
 =?utf-8?B?cmZzMFQvNmZTcUJnWU1ENW5veDZKclE4SlQ2U2tSS2w0dG45UEhtUTAyUjho?=
 =?utf-8?B?R3ljQXUwenVINVJLSWVGTmZreFpBdHJJcDFnalNSNjJmQ0NZUExGUFJsbjly?=
 =?utf-8?B?RVRhSTBnc21kSmNDSDFIQlh3enZuWXFwVitoYWRqeHhaZVFNcTdEZVBIWGJx?=
 =?utf-8?B?K2ZNV3ZTU3JjcFh5dU1xSWQyVjV4ZGQ5MmZkWTgvdjNzaU4wYW5lT0M4dDZy?=
 =?utf-8?B?NmpQakZzMTZKMUdVU0JvOE4rc0NBZGdCeDI3S3VUWWVCWUphcXdsQnVDamFl?=
 =?utf-8?B?TjRUYkczVnU5YVB0K3V2a3FycGhTQU5aamlFYy9wVDJndlQzWUNRS0h4bnQz?=
 =?utf-8?B?Y0xCS3JiREN5NzlTYXlHd2FGaDFEM2FrdDg1dWNiK2xaaEF6UXVYNjRYSk0r?=
 =?utf-8?B?R1c0OEtLeHJ0R0lJR2NFYmhGMUE1aEhqUjg2Wnc0enpWdVRHdEtVVEZOdmUz?=
 =?utf-8?B?V1JBemNFcmdvOG5aU2FNU08zamxBTjlSR2xWL3VoZ1ZnZGoxWHhhRktuSnFN?=
 =?utf-8?B?M3MyT2pudmlXbDhuT1lOR3V6K1RNMHlzZHJ2WDFwT0JpZkE3ZGhQcFF3ZlZG?=
 =?utf-8?B?ZEx2VDI0YU03b2QvTUttaTdTNVBGbkhqUzI3WFNwZ3pCMDJUK1E1cmdGV3Nz?=
 =?utf-8?B?YzlDRG1QQnlWRkxzQjRVMy9vdnlXaHdic3dUZFpiN0Z2d3BzbjNVZS9tdW9X?=
 =?utf-8?B?K0plZ3VEWWFQU1NRUlZEVU1HeGtrNW5FeUtBNUU3aEtOTVBZUS9mcFVwNWlW?=
 =?utf-8?Q?uHU44wBjVQqnJYACVo2Qv3ODv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2640050818A1CE4C9625FC6231BE3E79@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3237b49d-696b-41ec-da98-08dca6d4e5e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 02:54:09.9735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ErHBymlSD0CiepyiI6MN48Vo5cAXB255K5lX5mA2skWAxc6bZT+bJfCOjSnO5InKrk9fOLdzBePTn+xLoRpjNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7883

SGksIEp1bGllbjoNCg0KT24gVGh1LCAyMDI0LTA3LTA0IGF0IDE1OjM2ICswMjAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
ZW5AYmF5bGlicmUuY29tPg0KPiANCj4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5
cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gY29taW5nIGZyb20gdGhlIFNF
TklORiBjYW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91dCBhbnkgaW1hZ2UNCj4gcHJv
Y2Vzc2luZy4gVGhpcyBhbGxvd3MgdGhlIHVzZSBvZiBhbiBleHRlcm5hbCBJU1AuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+
DQo+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBF
bGRlciA8cGF1bC5lbGRlckBpZGVhc29uYm9hcmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIGludCBtdGtfY2FtX3ZiMl9z
dGFydF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1ZSAqdnEsDQo+ICsgICAgICAgdW5zaWduZWQg
aW50IGNvdW50KQ0KPiArew0KPiArc3RydWN0IG10a19jYW1fZGV2ICpjYW0gPSB2YjJfZ2V0X2Ry
dl9wcml2KHZxKTsNCj4gK3N0cnVjdCBtdGtfY2FtX2Rldl9idWZmZXIgKmJ1ZjsNCj4gK3N0cnVj
dCBtdGtfY2FtX3ZpZGVvX2RldmljZSAqdmRldiA9DQo+ICt2YjJfcXVldWVfdG9fbXRrX2NhbV92
aWRlb19kZXZpY2UodnEpOw0KPiArc3RydWN0IGRldmljZSAqZGV2ID0gY2FtLT5kZXY7DQo+ICtj
b25zdCBzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0X21wbGFuZSAqZm10ID0gJnZkZXYtPmZvcm1hdDsN
Cj4gK2ludCByZXQ7DQo+ICt1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiArDQo+ICtpZiAocG1fcnVu
dGltZV9nZXRfc3luYyhkZXYpIDwgMCkgew0KPiArZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0
IHBtX3J1bnRpbWVcbiIpOw0KPiArcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoZGV2KTsNCj4g
K3JldHVybiAtMTsNCj4gK30NCj4gKw0KPiArKCpjYW0tPmh3X2Z1bmN0aW9ucy0+bXRrX2NhbV9z
ZXR1cCkoY2FtLCBmbXQtPndpZHRoLCBmbXQtPmhlaWdodCwNCj4gK2ZtdC0+cGxhbmVfZm10WzBd
LmJ5dGVzcGVybGluZSwgdmRldi0+Zm10aW5mby0+Y29kZSk7DQo+ICsNCj4gKw0KPiArLyogRW5h
YmxlIENNT1MgYW5kIFZGICovDQo+ICttdGtfY2FtX2Ntb3NfdmZfZW5hYmxlKGNhbSwgdHJ1ZSwg
dHJ1ZSk7DQo+ICsNCj4gK211dGV4X2xvY2soJmNhbS0+b3BfbG9jayk7DQo+ICsNCj4gK3JldCA9
IG10a19jYW1fdmVyaWZ5X2Zvcm1hdChjYW0pOw0KPiAraWYgKHJldCA8IDApDQo+ICtnb3RvIGZh
aWxfdW5sb2NrOw0KPiArDQo+ICsvKiBTdGFydCBzdHJlYW1pbmcgb2YgdGhlIHdob2xlIHBpcGVs
aW5lIG5vdyovDQo+ICtpZiAoIWNhbS0+cGlwZWxpbmUuc3RhcnRfY291bnQpIHsNCj4gK3JldCA9
IG1lZGlhX3BpcGVsaW5lX3N0YXJ0KHZkZXYtPnZkZXYuZW50aXR5LnBhZHMsDQo+ICsgICAmY2Ft
LT5waXBlbGluZSk7DQo+ICtpZiAocmV0KSB7DQo+ICtkZXZfZXJyKGRldiwgImZhaWxlZCB0byBz
dGFydCBwaXBlbGluZTolZFxuIiwgcmV0KTsNCj4gK2dvdG8gZmFpbF91bmxvY2s7DQo+ICt9DQo+
ICt9DQo+ICsNCj4gKy8qIE1lZGlhIGxpbmtzIGFyZSBmaXhlZCBhZnRlciBtZWRpYV9waXBlbGlu
ZV9zdGFydCAqLw0KPiArY2FtLT5zdHJlYW1fY291bnQrKzsNCj4gKw0KPiArY2FtLT5zZXF1ZW5j
ZSA9ICh1bnNpZ25lZCBpbnQpLTE7DQo+ICsNCj4gKy8qIFN0cmVhbSBvbiB0aGUgc3ViLWRldmlj
ZSAqLw0KPiArcmV0ID0gdjRsMl9zdWJkZXZfY2FsbCgmY2FtLT5zdWJkZXYsIHZpZGVvLCBzX3N0
cmVhbSwgMSk7DQo+ICtpZiAocmV0KQ0KPiArZ290byBmYWlsX25vX3N0cmVhbTsNCj4gKw0KPiAr
bXV0ZXhfdW5sb2NrKCZjYW0tPm9wX2xvY2spOw0KPiArDQo+ICsvKiBDcmVhdGUgZHVtbXkgYnVm
ZmVyICovDQo+ICtjYW0tPmR1bW15X3NpemUgPSBmbXQtPnBsYW5lX2ZtdFswXS5zaXplaW1hZ2U7
DQo+ICsNCj4gK2NhbS0+ZHVtbXkudmFkZHIgPSBkbWFfYWxsb2NfY29oZXJlbnQoY2FtLT5kZXYs
IGNhbS0+ZHVtbXlfc2l6ZSwNCj4gKyAgICAgICZjYW0tPmR1bW15LmRhZGRyLCBHRlBfS0VSTkVM
KTsNCg0KRHVtbXkgYnVmZmVyIGNvc3QgbXVjaCBpbiBEUkFNIGZvb3RwcmludC4gSSB0aGluayB3
ZSBjYW4gZ2V0IHJpZCBvZg0KdGhpcyBkdW1teSBidWZmZXIuIElmIG5vIGJ1ZmZlciBpcyBxdWV1
ZWQgZnJvbSB1c2VyIHNwYWNlLCBjYWxsDQptdGtfY2Ftc3YzMF9jbW9zX3ZmX2h3X2Rpc2FibGUo
KSB0byBzdG9wIHdyaXRlIGRhdGEgaW50byBEUkFNLiBBZnRlcg0KYnVmZmVyIGlzIHF1ZXVlZCBm
cm9tIHVzZXIgc3BhY2UsIGNhbGwgbXRrX2NhbXN2MzBfY21vc192Zl9od19lbmFibGUoKQ0KdG8g
c3RhcnQgd3JpdGUgZGF0YSBpbnRvIERSQU0uDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICtpZiAoIWNh
bS0+ZHVtbXkudmFkZHIpIHsNCj4gK3JldCA9IC1FTk9NRU07DQo+ICtnb3RvIGZhaWxfbm9fYnVm
ZmVyOw0KPiArfQ0KPiArDQo+ICsvKiB1cGRhdGUgZmlyc3QgYnVmZmVyIGFkZHJlc3MgKi8NCj4g
Kw0KPiArLyogYWRkZWQgdGhlIGJ1ZmZlciBpbnRvIHRoZSB0cmFja2luZyBsaXN0ICovDQo+ICtz
cGluX2xvY2tfaXJxc2F2ZSgmY2FtLT5pcnFsb2NrLCBmbGFncyk7DQo+ICtpZiAobGlzdF9lbXB0
eSgmY2FtLT5idWZfbGlzdCkpIHsNCj4gKygqY2FtLT5od19mdW5jdGlvbnMtPm10a19jYW1fdXBk
YXRlX2J1ZmZlcnNfYWRkKShjYW0sICZjYW0tPmR1bW15KTsNCj4gK2NhbS0+aXNfZHVtbXlfdXNl
ZCA9IHRydWU7DQo+ICt9IGVsc2Ugew0KPiArYnVmID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxs
KCZjYW0tPmJ1Zl9saXN0LA0KPiArICAgICAgIHN0cnVjdCBtdGtfY2FtX2Rldl9idWZmZXIsDQo+
ICsgICAgICAgbGlzdCk7DQo+ICsoKmNhbS0+aHdfZnVuY3Rpb25zLT5tdGtfY2FtX3VwZGF0ZV9i
dWZmZXJzX2FkZCkoY2FtLCBidWYpOw0KPiArY2FtLT5pc19kdW1teV91c2VkID0gZmFsc2U7DQo+
ICt9DQo+ICtzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjYW0tPmlycWxvY2ssIGZsYWdzKTsNCj4g
Kw0KPiArcmV0dXJuIDA7DQo+ICsNCj4gK2ZhaWxfbm9fYnVmZmVyOg0KPiArbXV0ZXhfbG9jaygm
Y2FtLT5vcF9sb2NrKTsNCj4gK3Y0bDJfc3ViZGV2X2NhbGwoJmNhbS0+c3ViZGV2LCB2aWRlbywg
c19zdHJlYW0sIDApOw0KPiArZmFpbF9ub19zdHJlYW06DQo+ICtjYW0tPnN0cmVhbV9jb3VudC0t
Ow0KPiAraWYgKGNhbS0+c3RyZWFtX2NvdW50ID09IDApDQo+ICttZWRpYV9waXBlbGluZV9zdG9w
KHZkZXYtPnZkZXYuZW50aXR5LnBhZHMpOw0KPiArZmFpbF91bmxvY2s6DQo+ICttdXRleF91bmxv
Y2soJmNhbS0+b3BfbG9jayk7DQo+ICttdGtfY2FtX3ZiMl9yZXR1cm5fYWxsX2J1ZmZlcnMoY2Ft
LCBWQjJfQlVGX1NUQVRFX1FVRVVFRCk7DQo+ICsNCj4gK3JldHVybiByZXQ7DQo+ICt9DQo+ICsN
Cg==

