Return-Path: <linux-media+bounces-23240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B15A19EDDD2
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 04:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51E352835A2
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 03:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F271442F4;
	Thu, 12 Dec 2024 03:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BhV2knsq";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="BRixVaCB"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E768A2594A1;
	Thu, 12 Dec 2024 03:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733972719; cv=fail; b=RMjoCPu8ybq0X9vHx63FeNVtX1rfGiqG/+RAGU3t646AArlkVKYdVC7yuanoBm5beFJjufTroSqtsB5n1y1xECKx9NDT3s/u0hWEj7TizeLX3EV9dKPjv6NW+D6vVAsAWw7EiW13EWiFJcBlTtlWK3O2b+ZEyjoBA6IS3cWwg2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733972719; c=relaxed/simple;
	bh=YXsdSqviJKzqDwjQXinfmhtSPwovATQ26tqgmwnsNnA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V9TODpD/aogqKUMANC+L3zUh03tFPDR8g25k1chsYEMczgrENcFsUSpz/3NNG3jUQnXQ05Z8VZOIcs6Yol12/R3aRlZgKu1++zNygRDBFElaTeEaAomqnCLiz8dJk5Q8HBv+ZjdW72zIX2h4QH+cWPlrEvDSlCJowCpYxux/qYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BhV2knsq; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=BRixVaCB; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e6d9874cb83511ef99858b75a2457dd9-20241212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=YXsdSqviJKzqDwjQXinfmhtSPwovATQ26tqgmwnsNnA=;
	b=BhV2knsqoTkxE9f/ILkRrfBNbi3jL3ox8xBa6QMW1Tz/GuVJrBT2sp3ZEa/PJwCcNDnGp0HLh/M7WYgCaLrohauepI34yVnKieQoNB80JOYJD7nSgi9kqrZH2D37vkSJD99042843e2y/eghGK4E0NuYpaahfJxJ58gk03pK71g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:e0dfc9b1-a3e7-437f-ab90-ba6fddebc61c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:d88b6228-d2eb-4de2-b5c9-495d1bc17256,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e6d9874cb83511ef99858b75a2457dd9-20241212
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 147804438; Thu, 12 Dec 2024 11:05:11 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Dec 2024 11:05:08 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Dec 2024 11:05:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mtu3oyG9doraZn12uAcZ0ZkbwjbbkFI9GAU5gaDp1cUlrDF6CMSg4vV34fpmfVWowjnnl+BLdR4DUpAlMd5/2Dm7yIMhrOpJRGKaYoLBT1BvtfuICD9sldi8/WeU2YoyofDyhZerebydEaltjUzS8l0LaFdZMfIxtJ9mCJeEUIuLK1tpqjAJU8wwgFIyPTot4biOk6nq8LDUAt8Rv2WPKSLCH13V7IQusL6b8u8RDMztFWppqXORnJ4VAWK/UeSHv60IViUDBtDDnK+K4hztf+eH/gJrQ0yESB1GgmWPCohQnlPvtTzIHgTRqRp86Afoac4Np4qFU/rwjq4gtQ2v4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXsdSqviJKzqDwjQXinfmhtSPwovATQ26tqgmwnsNnA=;
 b=iYobrM8peHnVlQqS7x4AnhUB8AWtbB6UcqtX5JbzYRWVVkrAFAB86X9H2ZbumkhxMo+S8yfpVIqkx4aC7K7ibTJCjsfbDPvid0MOMbnL0ffP23m1SqAfDa8Atb7BeaQlT7B0h5Z7E1Thu+LuKPkol340y1gWJjw318BVEXdghhdu84DMCSF4on6SYkE3IEcSgxTvetylJSamGsv/cTNt3hMaBVC19G48M96oirHWv3hIpzHh7MOmZGYByCakp81ayhcJNd0KTjExbvCQ6MM/K4zNHSD3cxGj3GzgN4J6r0DRDEZ9Y73GKFx8AkEg8oeKSY9prCJgvGAOqME7oncnEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXsdSqviJKzqDwjQXinfmhtSPwovATQ26tqgmwnsNnA=;
 b=BRixVaCBlU/b1JCE2It8+C4E70XcH1zXqOhIazAHyAMlmDPtf2V3wqrihX5jfai8XaXPkG60Zb8GokGbooV6ZWwpUt9aVYlywQtUg0GTDPT/pEM4tuMo27RAPHpVaA1Jx/Rg9pMLSpsl7Wcq/Nj0eCdCDXiwKC151hfXy1hkS5k=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB8176.apcprd03.prod.outlook.com (2603:1096:405:d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Thu, 12 Dec
 2024 03:05:05 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 03:05:05 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"robh@kernel.org" <robh@kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
	<Xavier.Chang@mediatek.com>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: mailbox: mediatek: Add GCE header
 file for MT8196
Thread-Topic: [PATCH v2 1/8] dt-bindings: mailbox: mediatek: Add GCE header
 file for MT8196
Thread-Index: AQHbS3wqkgkOb2qikki77NU3E0fbTbLgycKAgAEkjQA=
Date: Thu, 12 Dec 2024 03:05:05 +0000
Message-ID: <04f7bd2a7d69ab7d02c88cf05bda5ae0c4cb6573.camel@mediatek.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
	 <20241211032256.28494-2-jason-jh.lin@mediatek.com>
	 <ozifi65uycmxc5hqeu4onbths5u7dg532iufjxplsjw4jjmhf6@6bdsaabd7hl7>
In-Reply-To: <ozifi65uycmxc5hqeu4onbths5u7dg532iufjxplsjw4jjmhf6@6bdsaabd7hl7>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB8176:EE_
x-ms-office365-filtering-correlation-id: 477f7144-62d0-4370-7e94-08dd1a59c749
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dEFJcmQ2Tmd3TkNENURXaktuM1JheXNvZG0vY1dGYWEyQXJqakRYbE1CRERL?=
 =?utf-8?B?YVpkT0pscTJzZ3RjekxwQzMvV1FTK3hubEVNN1NkTUxqaWl0NDFORXNBdyto?=
 =?utf-8?B?Y1Y1a1NLbXF3OXZiV1NRVjMwRjQ3TG9vM0ZHSmg4VkphVjE1ZkhFckxxckRu?=
 =?utf-8?B?RjN5NFgvMXE0MVFES2g2QTQwTE5NMVZwa0ZSYVB6MHlscmtoSndMdEw4OUNR?=
 =?utf-8?B?ZnoraDIwYWRSOEEvdXdMbXB5QWN6T3RoOWllcWVadnB2VnhybDE4Y2xabHUr?=
 =?utf-8?B?RGdMV0EzTWdCcTJwdjJVbTBOOUppWjFVb1ErSlV4NWVTSjJEeHZLbTV5TFJy?=
 =?utf-8?B?YkFVMVh4VXdBNFRpdUJldXdGRHNPZlZ1d0NWOXo2bEdlMWUvOUdsVm5UUHRZ?=
 =?utf-8?B?Qm5pRENaRzdCUUVkMjkwZDgrUzBiek1Jc3dudWpPQm9ndlk1eG5DSmpuaGdq?=
 =?utf-8?B?OVRHSlF2SFdjbC9RTUlEOE16VUxrUmhteUtyaktRbDBLZ055M3FnbnNvenJM?=
 =?utf-8?B?NmRjaDluVUpSR3g1OUhRUTdCUGp2aSs4bjdTODYzeVdVU3ZPbWhYR3JnNU95?=
 =?utf-8?B?VzZuTExsTk1wS1FGWUU3SzVDenp2d0VTODF0VjlRbmxPNkV5L1FZUTR0TVk3?=
 =?utf-8?B?cElWd3JZR3NxUG9RL0lhKzRGMjVXbEh3M2VsVmpOaEpVcUJ3SGFxK0kyL2xu?=
 =?utf-8?B?SFBXWStQRWR4dUJkZ0JtRlFTZ2NLdTlYYTNjMWsxSUJPc204VUcwczRTQm5o?=
 =?utf-8?B?OFp5bnBEQTZIbVUzQThhY3YzT21KeFZ1bjNpQ28vZ1JYN25SWXVtdnBLVmh0?=
 =?utf-8?B?akZQNVlFTzQ0djlGQkkzVWlXbGtFbmh2M1dYMEJHSWg2QWxsRkdBWC9MdzRs?=
 =?utf-8?B?YkNyUG4zSWpZNEZXeUVJajU4V0p0YVJwc2txZ0NLa1lBR2F2bTBjQ3pGYlJX?=
 =?utf-8?B?eUZPY0Q4bkdOeDdBWjVvRUZRSjB6SWlOQUNRZzRkTjZ0ZFIwZ1FrSXN1cyt1?=
 =?utf-8?B?ZXNEa2VxYWlRd0QzbFA3TkxJNzRIdTlHdHFQcEdKSENtWVVjTVNYS21GU01O?=
 =?utf-8?B?aHd2R1ZpaitzWVVCaHdRU3RCS1lXL1k3cnFLVXVhUGJhMFVHaisxUGNhVnlL?=
 =?utf-8?B?NWVaVXpWRm5FMVRrS3N0QVR6cWF1Mjh2STh5RjRUVGM5elZJZSsyRnl4eWdr?=
 =?utf-8?B?TURMSThQTXVhUEtBdVNlRmdPTGR1Zll1VjU5RHR3SnJPSmRHc2Y0RThoNWl5?=
 =?utf-8?B?SVZkTmVCVHNGWWRpbmFwbmVkUzRNL1plQTRKZzYwZm9wbTdGM2hockFsZWFp?=
 =?utf-8?B?R2VIMlpteXg0OFJyd2VxZWx3R2swSzFGYVlBM2loUTlQS3ZIS2l5OThUaTdM?=
 =?utf-8?B?eURhRVU0bmJWK2dKclN5eGVOcm94czFlZzF6THVSZjRpVzBoZE9ray8xbVpT?=
 =?utf-8?B?Wmk2dFpHcTQyWWpKeGVIMFBKZy9rVXlhUkdZTk1BMVpZZGpjZ3RPTGFMQ3Vh?=
 =?utf-8?B?NkFQWGtnK2owNXUvMnlicGtqV3NzTFF3a1BmZG9GYlk3c3BsRVVWMlNibVlJ?=
 =?utf-8?B?WGhodjk3bjJPUGtsQWtRSjIrUSsvb2hrdTFEL21xUnVtbXZhSG9NWU9jV20z?=
 =?utf-8?B?VnhvTkc5L1dxYVpRUlh6bnhyVmlJT0ZhWWNtVUdNYm5DZmlZWUo1cVRaMWZo?=
 =?utf-8?B?NE4xQUZmU0t2YnlEVWhKbnpuRTZzRmN6QjhSRndqUzR5T0w3S1BCalp6c29K?=
 =?utf-8?B?TXR4UlN2aXBWZUkwNVB2blJlNnhJZDBDTDhxNjhQWWo3Qm9xU2h0a2NSdVdK?=
 =?utf-8?B?c21EUFozS1FzdE9xVDJXWUU0WXozMmhlbXdoNDl3dUFBWmhYSzZKb0tydEZo?=
 =?utf-8?B?TlYxMkMzR3o0MWcxODVBTHN3TGZMQW1DRjVjZVJyQ3lwQVFrWmR5TGwreWhK?=
 =?utf-8?Q?lvpOoEfTx/ugVrwCfxYtdxE4K8LKBcMj?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3BFdEhkOXNadkJjR0JpQ0RUREd3MFpldFpyUXhrb250TDQ2UjdqVnZUR0VW?=
 =?utf-8?B?MXg1TXVVT20xa1daVVVrTHNxWEdkTkRBby9aZW9lQ1lxb3BVL2h0MjdSczQz?=
 =?utf-8?B?aEF2Z3NTUTdXUVR5UnpqdnB5N0lhbmM0SWo0eWtZYUwrcjk2UjRpZnZ5L3dq?=
 =?utf-8?B?Y2poK0dUSWNtTW5aSmRaOVNSKzVUNXVTOXZteFkyQVIyVFpEZmdBUVFKd3dB?=
 =?utf-8?B?OXRsWHArZnQvV1lCd1puZlRWdG1IazJOSWpwOXg0UFhzWFFleHhoVGh3NVhZ?=
 =?utf-8?B?SDB5L1NMUzdYdXJLUmtGZnc0VnZ1NjM5UjFUSWVZblFxbXdTZXl1cTVkTStW?=
 =?utf-8?B?dEhQVk5McXhGZkRiWXZ1aUJtWUVBQW8wb2UwbzhZZEYwbzdFQktGc2d2eHNy?=
 =?utf-8?B?endyN3pjLzNqdmdtM2pINkFYaTVmaGUvdHFiUE9pU1VET2tPYzBjZzArODZO?=
 =?utf-8?B?SHEwS1BMNXNmVUhPSWJyOElObE1veTgxa2NPZVZWMTBRSTViNlkzcFQ1ekpW?=
 =?utf-8?B?QmJBdmU4WEJncm1FUkg2N0ZtSGx3ZnB3WkRlUDNFdkN4aWtQSkVTMHNQV2tO?=
 =?utf-8?B?b1hXemJRQUdlMFF4WHA0NllTVTFkVUpsY1llUmdvalcxeW1DNXI2eXA0WGFC?=
 =?utf-8?B?YzdRYTRvbktoQ1cyKzh1UVZpUDViTFFjc1U5dXE2YkEydDIrbC8vZkN3Uk1q?=
 =?utf-8?B?M2FHQ1BqMzdQZjNOdzBpL1JTbm0zMkNWVklKcW93SVhDN2hqWU03ZFNOTi9q?=
 =?utf-8?B?WW41S1dpcjdxd1pnbnlhM3F4UEorOWVDWVo3YUI2aG9QUmZKaVdpUXlyNCt5?=
 =?utf-8?B?bmoreGJTK1V5WitXUTRldTlpWUlkVWJuOWtkbStGTk55eEVKVVJMNXlOTVJ3?=
 =?utf-8?B?cVpEeWNZWjl4aWprS3laTUJYdGxqbWd3aGt2WFJXSS84VTBBTkQzeG9uc09V?=
 =?utf-8?B?K1NxTVhxU0lmeDhjRTdkL3kxNy84c09PZU9CdmNMaHZmTnFGZ1UxUk9JOXdv?=
 =?utf-8?B?Y3pKMjliWTRTZXczOFFUSTUwd1NIcmhzNlZZTFV6ZDk4eWVCQmNDM2ROcmR0?=
 =?utf-8?B?UlZWYjRYU2tueVRFM01URVpsbTBzdHNuMVBsclJhK2IvSmxHZVEzZUlTMlNI?=
 =?utf-8?B?cUdCL2ZsYVJSTUlQZXU1Z2p3Q09VK1dXdW1janpiOVl4ZVJieTFmQUFjZnYr?=
 =?utf-8?B?Y091NlE5NGZnTTNtOUpUMTFhc0NtcTUyMnRMRlJZWTJubnlpKzJTYVpCUG9Y?=
 =?utf-8?B?cEZDMzlqc3FYSHRxZEFCRVNmNGJMak9lZGFGc3JGeWVKMlFmSkF3QzR1Uk0r?=
 =?utf-8?B?bThtbXpmTktCMisrM1VURHdJZW9ZSGY3Z1hjMDg2ekkvRlhQdC90NWhCc3Ji?=
 =?utf-8?B?a3BkbnVwTXJWeEJsN1ZsbHAwM1FRM2tsN0R3c29ZNFE5YmVoUFhHNDUzN0lV?=
 =?utf-8?B?NlFSa3ZRUW01UWNGc0N6dUdGN3FRZzJhMVBYbHNoWXN0b2JNeXNjUkRlZi9O?=
 =?utf-8?B?dmg1a3F1Wko3amRxWlR3Q3BqR0djSkhVYURnY29sZFR2YVd0dGhYbXNmWVVC?=
 =?utf-8?B?NVZUL0ZrVGllYXI5a0d0bEdkSk5NNFlXL25VWTlwUU9JWnNzeS9UZllnWFJr?=
 =?utf-8?B?b28raGs1Um1WRitlUkp0bnJ5Z0RSRXFuQzBZTkxhUTJhT25mTXN0VUVvcm1q?=
 =?utf-8?B?Q0dYRDRtQk1vbFlYcXdMQzBFZVI1c1czMVIwNWc0THNsWGdlR0g5RWNuQTlT?=
 =?utf-8?B?dExHdnFiYm5TRVU1SWJrcHdLVDcvT1Z1aE4zd0ZSMzdGZUpmZTRHRndFRlZn?=
 =?utf-8?B?dEhQQ2JwY1o2V01WUXBFTG9XVzJsL3g5OTA5NnZlS1p3WVZSYUszYldSQ3ht?=
 =?utf-8?B?Z3l3RTNFQkNXSERoMGN1Z0ZPaDlWbTBhTDg5eVRxdTFHUFUzMXF4MXNadG0r?=
 =?utf-8?B?QnFoekJTeHVCY09QcWpKWUZERjNWMThNcER3Rk9aWjFueStzc2ovUHFRb05x?=
 =?utf-8?B?RW5sdDU3ZUNOUmxJcWZid1Y0VjZaOVQrNm44SUsrdDRCNzFDT1IrSitoRTVy?=
 =?utf-8?B?NXM1ZGN5RWFnYk9hMTlFL3paYXlINmlwamVZZmxDeUlTQnE2R0lNMFNHa0pw?=
 =?utf-8?B?anhZY2ZUUmU5dE42THZnMEY3aHlreU9hN1dRTWxkdmJiSGlBUUpSUms5TDlB?=
 =?utf-8?B?ZVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9432B9975FE7774194BAF3DBB4938AE2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 477f7144-62d0-4370-7e94-08dd1a59c749
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 03:05:05.4218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7vrvyYAQVS/Yo9ag5/2XP8oXr+Wx/enmYN7PYyLM1WIYOKJs60EWCPR1whB1nFbJePNjDZk5uRSbBcbkmzIy5YLRsls/H6qVOjBnNP8FGm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8176

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBXZWQsIDIwMjQt
MTItMTEgYXQgMTA6MzcgKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IEV4dGVy
bmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+
IA0KPiANCj4gT24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgMTE6MjI6NDlBTSArMDgwMCwgSmFzb24t
SkguTGluIHdyb3RlOg0KPiA+IEFkZCB0aGUgR2xvYmFsIENvbW1hbmQgRW5naW5lIChHQ0UpIGhl
YWRlciBmaWxlIHRvIGRlZmluZSB0aGUgR0NFDQo+ID4gdGhyZWFkIHByaW9yaXR5LCBHQ0Ugc3Vi
c3lzIElEIGFuZCBHQ0UgZXZlbnRzIGZvciBNVDgxOTYuDQo+IA0KPiBUaGlzIHdlIHNlZSBmcm9t
IHRoZSBkaWZmLiBXaGF0IHdlIGRvIG5vdCBzZWUgaXMgd2h5IHByaW9yaXR5IGlzIGENCj4gYmlu
ZGluZy4gTG9va2luZyBicmllZmx5IGF0IGV4aXN0aW5nIGNvZGU6IGl0IGlzIG5vdCBhIGJpbmRp
bmcsIHRoZXJlDQo+IGlzDQo+IG5vIGRyaXZlciB1c2VyLg0KPiANCg0KVGhpcyBwcmlvcml0eSB2
YWx1ZSBpcyB1c2VkIHRvIGNvbmZpZ3VyZSB0aGUgcHJpb3JpdHkgbGV2ZWwgZm9yIGVhY2gNCkdD
RSBoYXJkd2FyZSB0aHJlYWQsIHNvIGl0IGlzIGEgbmVjZXNzYXJ5IGhhcmR3YXJlIGF0dHJpYnV0
ZS4NCg0KSXQncyBoYXJkIHRvIGZpbmQgd2hlcmUgdGhlIHByaW9yaXR5IGlzIHVzZWQgaW4gZXhp
c3RpbmcgZHJpdmVyIGNvZGUNCmJlY2F1c2Ugd2UgcGFyc2VkIGl0IGZyb20gRFRTLg0KDQpJdCBp
cyB1c2VkIGluIGFsbCBtZWRpYVRla3MnIERUUyB1c2luZyB0aGUgR0NFLg0KRm9yIGV4YW1wbGUs
IGluIG10ODE5NS5kdHM6DQoNCnZkb3N5czA6IHN5c2NvbkAxYzAxYTAwMCB7DQogICAgY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtdmRvc3lzMCIsICJtZWRpYXRlayxtdDgxOTUtbW1zeXMi
LA0KInN5c2NvbiI7DQogICAgcmVnID0gPDAgMHgxYzAxYTAwMCAwIDB4MTAwMD47DQogICAgbWJv
eGVzID0gPCZnY2UwIDAgQ01EUV9USFJfUFJJT180PjsNCiAgICAjY2xvY2stY2VsbHMgPSA8MT47
DQogICAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcgPSA8JmdjZTAgU1VCU1lTXzFjMDFYWFhYIDB4
YTAwMCAweDEwMDA+Ow0KfQ0KDQpDTURRIGRyaXZlcihtdGstY21kcS1tYWlsYm94LmMpIHdpbGwg
Z2V0IHRoZSBhcmdzIHBhcnNlZCBmcm9tIG1ib3hlcw0KcHJvcGVydHkgaW4gY21kcV94bGF0ZSgp
IGFuZCB0aGVuIGl0IHdpbGwgc3RvcmUgQ01EUV9USFJfUFJJT180IHRvIHRoZQ0Kc3BlY2lmaWMg
dGhyZWFkIHN0cnVjdHVyZS4gDQpUaGUgdXNlciBvZiBDTURRIGRyaXZlciB3aWxsIHNlbmQgY29t
bWFuZCB0byBDTURRIGRyaXZlciBieSANCmNtZHFfbWJveF9zZW5kX2RhdGEoKSwgYW5kIHRoaXMg
cHJpb3JpdHkgc2V0dGluZyB3aWxsIGJlIGNvbmZpZ3VyZWQgdG8NCkdDRSBoYXJkd2FyZSB0aHJl
YWQuDQoNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxp
bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9kdC1iaW5kaW5ncy9tYWlsYm94L21l
ZGlhdGVrLG10ODE5Ni1nY2UuaCB8IDE0MzkNCj4gPiArKysrKysrKysrKysrKysrKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMTQzOSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL2R0LWJpbmRpbmdzL21haWxib3gvbWVkaWF0ZWssbXQ4MTk2LQ0KPiA+IGdjZS5o
DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvbWFpbGJveC9tZWRp
YXRlayxtdDgxOTYtZ2NlLmgNCj4gPiBiL2luY2x1ZGUvZHQtYmluZGluZ3MvbWFpbGJveC9tZWRp
YXRlayxtdDgxOTYtZ2NlLmgNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uODYwZDY5MTAwMTU3DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvbWFpbGJveC9tZWRpYXRlayxtdDgxOTYtZ2NlLmgNCj4gPiBAQCAt
MCwwICsxLDE0MzkgQEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seSBPUiBCU0QtMi1DbGF1c2UgKi8NCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IChjKSAy
MDI0IE1lZGlhVGVrIEluYy4NCj4gPiArICoNCj4gPiArICovDQo+ID4gKw0KPiA+ICsjaWZuZGVm
IF9EVF9CSU5ESU5HU19HQ0VfTVQ4MTk2X0gNCj4gPiArI2RlZmluZSBfRFRfQklORElOR1NfR0NF
X01UODE5Nl9IDQo+ID4gKw0KPiA+ICsvKiBHQ0UgdGhyZWFkIHByaW9yaXR5ICovDQo+ID4gKyNk
ZWZpbmUgQ01EUV9USFJfUFJJT19MT1dFU1QgMA0KPiA+ICsjZGVmaW5lIENNRFFfVEhSX1BSSU9f
MSAgICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIENNRFFfVEhSX1BSSU9fMiAgICAgICAgICAg
ICAgMg0KPiA+ICsjZGVmaW5lIENNRFFfVEhSX1BSSU9fMyAgICAgICAgICAgICAgMw0KPiA+ICsj
ZGVmaW5lIENNRFFfVEhSX1BSSU9fNCAgICAgICAgICAgICAgNA0KPiA+ICsjZGVmaW5lIENNRFFf
VEhSX1BSSU9fNSAgICAgICAgICAgICAgNQ0KPiA+ICsjZGVmaW5lIENNRFFfVEhSX1BSSU9fNiAg
ICAgICAgICAgICAgNg0KPiA+ICsjZGVmaW5lIENNRFFfVEhSX1BSSU9fSElHSEVTVCAgICAgICAg
Nw0KPiA+ICsNCj4gPiArLyogR0NFIHN1YnN5cyB0YWJsZSAqLw0KPiA+ICsjZGVmaW5lIFNVQlNZ
U18xMzAwWFhYWCAgICAgICAgICAgICAgMA0KPiA+ICsjZGVmaW5lIFNVQlNZU18xNDAwWFhYWCAg
ICAgICAgICAgICAgMQ0KPiA+ICsjZGVmaW5lIFNVQlNZU18xNDAxWFhYWCAgICAgICAgICAgICAg
Mg0KPiA+ICsjZGVmaW5lIFNVQlNZU18xNDAyWFhYWCAgICAgICAgICAgICAgMw0KPiA+ICsjZGVm
aW5lIFNVQlNZU18xNTAyWFhYWCAgICAgICAgICAgICAgNA0KPiA+ICsjZGVmaW5lIFNVQlNZU18x
ODgwWFhYWCAgICAgICAgICAgICAgNQ0KPiA+ICsjZGVmaW5lIFNVQlNZU18xODgxWFhYWCAgICAg
ICAgICAgICAgNg0KPiA+ICsjZGVmaW5lIFNVQlNZU18xODgyWFhYWCAgICAgICAgICAgICAgNw0K
PiA+ICsjZGVmaW5lIFNVQlNZU18xODgzWFhYWCAgICAgICAgICAgICAgOA0KPiA+ICsjZGVmaW5l
IFNVQlNZU18xODg0WFhYWCAgICAgICAgICAgICAgOQ0KPiA+ICsjZGVmaW5lIFNVQlNZU18xMDAw
WFhYWCAgICAgICAgICAgICAgMTANCj4gPiArI2RlZmluZSBTVUJTWVNfMTAwMVhYWFggICAgICAg
ICAgICAgIDExDQo+ID4gKyNkZWZpbmUgU1VCU1lTXzEwMDJYWFhYICAgICAgICAgICAgICAxMg0K
PiA+ICsjZGVmaW5lIFNVQlNZU18xMDAzWFhYWCAgICAgICAgICAgICAgMTMNCj4gPiArI2RlZmlu
ZSBTVUJTWVNfMTAwNFhYWFggICAgICAgICAgICAgIDE0DQo+ID4gKyNkZWZpbmUgU1VCU1lTXzEw
MDVYWFhYICAgICAgICAgICAgICAxNQ0KPiA+ICsjZGVmaW5lIFNVQlNZU18xMDIwWFhYWCAgICAg
ICAgICAgICAgMTYNCj4gPiArI2RlZmluZSBTVUJTWVNfMTAyOFhYWFggICAgICAgICAgICAgIDE3
DQo+ID4gKyNkZWZpbmUgU1VCU1lTXzE3MDBYWFhYICAgICAgICAgICAgICAxOA0KPiA+ICsjZGVm
aW5lIFNVQlNZU18xNzAxWFhYWCAgICAgICAgICAgICAgMTkNCj4gPiArI2RlZmluZSBTVUJTWVNf
MTcwMlhYWFggICAgICAgICAgICAgIDIwDQo+ID4gKyNkZWZpbmUgU1VCU1lTXzE3MDNYWFhYICAg
ICAgICAgICAgICAyMQ0KPiA+ICsjZGVmaW5lIFNVQlNZU18xODAwWFhYWCAgICAgICAgICAgICAg
MjINCj4gPiArI2RlZmluZSBTVUJTWVNfMTgwMVhYWFggICAgICAgICAgICAgIDIzDQo+ID4gKyNk
ZWZpbmUgU1VCU1lTXzE4MDJYWFhYICAgICAgICAgICAgICAyNA0KPiA+ICsjZGVmaW5lIFNVQlNZ
U18xODA0WFhYWCAgICAgICAgICAgICAgMjUNCj4gPiArI2RlZmluZSBTVUJTWVNfMTgwNVhYWFgg
ICAgICAgICAgICAgIDI2DQo+ID4gKyNkZWZpbmUgU1VCU1lTXzE4MDhYWFhYICAgICAgICAgICAg
ICAyNw0KPiA+ICsjZGVmaW5lIFNVQlNZU18xODBhWFhYWCAgICAgICAgICAgICAgMjgNCj4gPiAr
I2RlZmluZSBTVUJTWVNfMTgwYlhYWFggICAgICAgICAgICAgIDI5DQo+ID4gKyNkZWZpbmUgU1VC
U1lTX05PX1NVUFBPUlQgICAgOTkNCj4gPiArDQo+ID4gKy8qDQo+ID4gKyAqIEdDRSBHZW5lcmFs
IFB1cnBvc2UgUmVnaXN0ZXIgKEdQUikgc3VwcG9ydA0KPiA+ICsgKiBMZWF2ZSBub3RlIGZvciBz
Y2VuYXJpbyB1c2FnZSBoZXJlDQo+ID4gKyAqLw0KPiA+ICsvKiBHQ0U6IHdyaXRlIG1hc2sgKi8N
Cj4gDQo+IFRoYXQncyBhIGRlZmluaXRlIG5vLWdvLiBSZWdpc3RlciBtYXNrcyBhcmUgbm90IGJp
bmRpbmdzLg0KPiANCg0KSSdtIHNvcnJ5IHRvIHRoZSBjb25mdXNpb24uDQoNClRoZXNlIGRlZmlu
ZXMgYXJlIHRoZSBpbmRleCBvZiBHQ0UgR2VuZXJhbCBQdXJwb3NlIFJlZ2lzdGVyIGZvcg0KZ2Vu
ZXJhdGluZyBpbnN0cnVjdGlvbnMsIHRoZXkgYXJlIG5vdCByZWdpc3RlciBtYXNrcy4NCg0KVGhl
IGNvbW1lbnQgIi8qIEdDRTogd3JpdGUgbWFzayAqLyIgaXMgYnJpZWZseSBkZXNjcmliZSB0aGF0
IHRoZSB1c2FnZQ0Kb2YgR0NFX0dQUl9SMCBhbmQgR0NFX0dQUl9SMDEgaXMgdXNlZCB0byBzdG9y
ZSB0aGUgcmVnaXN0ZXIgbWFzayB3aGVuDQpHQ0UgZXhlY3V0aW5nIHRoZSBXUklURSBpbnN0cnVj
dGlvbi4gQW5kIGl0IGNhbiBhbHNvIHN0b3JlIHRoZSByZWdpc3Rlcg0KbWFzayBvZiBQT0xMIGFu
ZCBSRUFEIGluc3RydWN0aW9uLg0KDQpJIHdpbGwgYWRkIG1vcmUgd29yZHMgdG8gbWFrZSB0aGlz
IGNvbW1lbnQgY2xlYXJlciwgbGlrZSB0aGlzOg0KLypHQ0U6IHN0b3JlIHRoZSBtYXNrIG9mIGlu
c3RydWN0aW9uICovDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiA+ICsjZGVmaW5lIEdD
RV9HUFJfUjAwICAgICAgICAgIDB4MA0KPiA+ICsjZGVmaW5lIEdDRV9HUFJfUjAxICAgICAgICAg
IDB4MQ0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4gDQo=

