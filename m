Return-Path: <linux-media+bounces-27574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FCEA4FA8E
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 10:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B7BB1892CC1
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 09:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2DC204F76;
	Wed,  5 Mar 2025 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lFn/NDfe";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="o775Z05A"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4919B200121;
	Wed,  5 Mar 2025 09:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167998; cv=fail; b=QoW3jCSP1TfdTpA14GueD1KuDIFkDD+d0dQd5hSKLWG8doJq7XC90UBBaeHoyHd0MaYLlEo1jehKDQ3g03TjTUE41SyiIaORBbJyYZHVt8l1DprIm4OFmMZnHl9t3BdL4PUlsmkYqQsJhTKK3Q3MEfujrqNzO+HoFMOrsLI/2kE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167998; c=relaxed/simple;
	bh=OucT2r+FzZyV8TZv+G9GuHbneSmJ13WDwS4744v+VUg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pZn09hc49L+UlHSsf6PW5LskvbOyPIryhvKPk90rYtPbl3fGfo7ndSydQUqFEdvULkxMgomkk33s1IFaYbxhEmtsDbYwgxEMTe3JXZTcOTXCZ5wOL861A0nLk52T2Wifl04lFYFqboa0xa//E9iQbQZPg3mXO+cvwm4Y06H68e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lFn/NDfe; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=o775Z05A; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b5db5b04f9a611efaae1fd9735fae912-20250305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=OucT2r+FzZyV8TZv+G9GuHbneSmJ13WDwS4744v+VUg=;
	b=lFn/NDfexMfo2btJVd4iM8opGLSCFZ87oLnCHCri8mX5QS72Ls5vvvDxwrv/Y7meIM5yRMoJeSNyHzEVygHx52GYM+3Yfp2sUtOP/B5kFb2p9CSFd6fW2QJZMP4/e2+QwY9Tt3QSVp5R0lP1I6q/HuP1NtqHFevegSq0jCJopls=;
X-CID-CACHE: Type:Local,Time:202503051746+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:76f43251-9561-4728-bff1-eabd6575a672,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:a325b749-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b5db5b04f9a611efaae1fd9735fae912-20250305
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1337277031; Wed, 05 Mar 2025 17:46:28 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 5 Mar 2025 17:46:27 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 5 Mar 2025 17:46:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X08zlugd0CU7+GWFPuzdoBrx2AGaCRV2x+1oeogbtZp0tuLgW0d/RQJfAoZKATkV1BBhpo44cYgngk8CGKjfrsZxPSNrREE0jqja1/S+Hzj27Gdib5M3no61srTbmksjVhLPcTeAYlP8G6DYWe4g2LxzeayVfycdTbpjWw5wEfHgSFAXw6acHGWghax0Y3Fdk8NDqbwafzK2INBaN5xoUaaJHyYw0oJHAdD6Ay941XaNkjwXlwbvCMw8BvObWT+9UdFeolJRDEsvFXJ3E7QfSMNiv3Zrvb2MuIBaAuiLsg4BUYxpVWxnclgU6pwktX5HxteaXBkQ9JS3eGRRD6jwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OucT2r+FzZyV8TZv+G9GuHbneSmJ13WDwS4744v+VUg=;
 b=JoPbKHZJoBIrBz5kd11UzavtZnTWWEUNJM7GbiQewzzIEmcpvSxoDcPIcXOcPw5wwaySXa6eqlBXxWFT6MCaQ+SrqBjgx9Rc7lNAQBCr7qiAqXbAyvWBqjpjxMTbKvq135c2JU8iingPOi3vtoN2htFGQ7MUt+LUdW9MMgzpumR/BfVSbsHtltbRHiW+u/hv7X9/SNJR1yWhfJmP9mk4lNMt5khP/l1i284PTAA3otbOwq454ZNAnCWCyxSzvmYa37k2rAOSgDaNHts6Kfi20i+ri5O1gyCUO8atTy3IfKSfAHFnI6oVjOohWl15I7uhpRJ4GhGOPPC2it9wP7zqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OucT2r+FzZyV8TZv+G9GuHbneSmJ13WDwS4744v+VUg=;
 b=o775Z05AdLYOvbEacxnUIA4IU2xD2aZE+cBkRcoafOo2oRREwSpKK9Ybalc3BZQNipmgKfN5cBZnmFnK6p4UEO4KisKLKktIDeWJlBZGpYNn7OtGzMpr2pQozVbGYhxoECkZ/eX1RyxYsapA882kkCB9vbrK+l/caHofIXJfZl4=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB7098.apcprd03.prod.outlook.com (2603:1096:101:eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 09:46:22 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 09:46:22 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treapking@chromium.org"
	<treapking@chromium.org>
Subject: Re: [PATCH v4 4/8] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 unsupported subsys ID hardware
Thread-Topic: [PATCH v4 4/8] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 unsupported subsys ID hardware
Thread-Index: AQHbgcg8NOxMJmq6REqrLg4+446/ZrNizfqAgAGVXIA=
Date: Wed, 5 Mar 2025 09:46:22 +0000
Message-ID: <03c523e66fd56442f49c38456476cf18be59e8fb.camel@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
	 <20250218054405.2017918-5-jason-jh.lin@mediatek.com>
	 <581fc075-25d8-4104-a4ee-8c97e1a017e6@collabora.com>
In-Reply-To: <581fc075-25d8-4104-a4ee-8c97e1a017e6@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB7098:EE_
x-ms-office365-filtering-correlation-id: e660fb51-b3d7-4e19-b21f-08dd5bca965d
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OW1sN1RRS0hXY091K2tZQnRTU2VUZ2pOOUNvQjhqRW5WT3orOFVsZzRKYzlL?=
 =?utf-8?B?VmZLVTlvdzYzTE9sRi9YQldJd2s5aHpaWDVkUGR1bmNwelVtaTBiNHQ5SHRY?=
 =?utf-8?B?YXU0anRKMFBjL3NPZzFTY3hlbmRFWEc0TEhpaXVQdVBEcmhGdDRUNWYrZCta?=
 =?utf-8?B?SVZrdTNVenRQcG5tSWt5djlLc2VPR0JDUXUvRVFvSjN3b3RVSG5FVUl5V2pZ?=
 =?utf-8?B?V0lPYmhFMzkvTThBOUdiamdRRXltQTJjaXJlcGdhTmg4M2NvYlFKckJJU1U5?=
 =?utf-8?B?ZWs0Mk51bGhmdC9jbnhIMG5OK1R2cTdOOG81cVQvM0o4allmUnRtbW9tcHF1?=
 =?utf-8?B?QXk5NU9kWGU2K3FXMFRHTStDS3lQRm1WTlk4dXJTOS8zUXExSHpya3FKQ1BY?=
 =?utf-8?B?RzhScUxoYzR4MnUyaU1FN05ndGNvRGJta2E2TXE1WmpBYlY3aHRmS2NJakFw?=
 =?utf-8?B?eEVLTEtYNFBxbG1yV1Frd3ZQa3Nla3JVSlJzcWN5N1hGdEV0ellDS0p4Z0d6?=
 =?utf-8?B?eFdnRmg3VWVXbmpFaEtnSisvdGJTUmI5NlE4cU1ZNk5TbFQ4UGI3VmlBZkNZ?=
 =?utf-8?B?VjJXZjFGci84NE5BYTZMUlJJVkUwWEdwQ01lWW4xbEcxbmdhTlFxdWd2azJP?=
 =?utf-8?B?bVJnb3JBV1dteDJLdDdSNEpSNjlRNWZWdEU5UFdtWE0rNnhLR2wzMWdQMExm?=
 =?utf-8?B?SElicVJQTGJSWlpjVkp2OXJJV0hvTzJJd1p1SHQ5bDNZWVUyRGlYTEN2UzEy?=
 =?utf-8?B?Tmpvd2Rqb1FRVzJjNUhLZHk2ak1vTGp1OHc0QksxdmtuaWZsUlBmT1NLWCtC?=
 =?utf-8?B?N0Q0TDNWWWVQeFl3YU1qajRNYWVKdG5UTlpGMndiNjdJS0Nsd1FtYkg1eGk0?=
 =?utf-8?B?WUVEdmxBQ1JBZjJMWUFyY3hTak9ydkZ1eGtNV09jbmozV1ljTW0vM1JSUWJX?=
 =?utf-8?B?bW1qUDlwVnM4Qk5ndElXTFQzb0lPclR5clNjdjVFb0FWdXRtMHdGL2ZIMkpw?=
 =?utf-8?B?cGErQXhpT2g4OXlXRUMyaXE4a09GdFA1Z3N2elRkV1BjakZJQXV1Qmw4Z29G?=
 =?utf-8?B?M29IMlYzN2tyQWdsdVhiRU9SVVlYNGhIZjhYVTBhUVZYYlg0WG1iTkRTWXV0?=
 =?utf-8?B?RnY1Y1Frb3krUndzOGxRc1VLQlRoaGFhNW1kaVduVXRycHN5TVB4YTl4OXZX?=
 =?utf-8?B?VHlqZzlvMVJnZEhnTjhLdzUzSUdldUY4RnFha2NIRjFHb0cwayt4MElJRFE0?=
 =?utf-8?B?UVFpWVpaNXljQ3RucTZ6b3FYZXo2S0pjMGZXVkMyU1duR2ZoUmxBNFlyTEpV?=
 =?utf-8?B?SzNKb2xjTVNwT0I4cTJWbERtRXhud1d1RTBkUi9WbEtyKy84NUJuUDRpcDN6?=
 =?utf-8?B?YVFiQXNNYk9mNFJZWXdBM2gxNHFVdDFFL3ZnOXlUN1M4aWJCR25Uay85ZEVL?=
 =?utf-8?B?SDdhMnVySTB5U3dOZjd1Zk1Sa2UyVkpQcW9qVHN4L0pvTjRPaGJHTFhoNFU3?=
 =?utf-8?B?K3pvTUdyVHlnUC83TVJRMWI3QlprL1pONUdocS9yTUMrUit3Mk9Qa0l1Z1RG?=
 =?utf-8?B?RFQzSDhxWlhNVGRlUEZoY1pqSDhwWW1OeEZ5SUUwQWNYWjN4MWEzNmpiQW44?=
 =?utf-8?B?TXRPU0kzbXdoTEp4VFJvcFdQTk8zMmFCaE9wWDYzTlAzYVZ5VUFsMktWNDd3?=
 =?utf-8?B?SFRFaEdkV1BXZVdxL3YxejNhYitEWHdMYS9sYkttdGhzZWlMVUhaQmpKOXla?=
 =?utf-8?B?WjZiTnFyMkhVc1FKQkROeEk2ZnZ2VjkxQzRvS2lXRWNkVE1tQlM4Lzg3b2M2?=
 =?utf-8?B?Mjh0SEt4M1RhQWZsVUx3dXlUTXZYVkdNdEhvNjM0NDF1bHc1QUZqaTh4VE5q?=
 =?utf-8?B?TG82UGFYdTdmeXp2M3BXUzNEempwcC9yQW8yZEcyejlOZlhSK3pwbzdpT2Vp?=
 =?utf-8?Q?KG2VErmyGrdNqAYDzByIAYbMoDVPvHbu?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aThHREdpR1Nmc0J1K25WNmRMcVlVQ2hKMHl6OGhla2J4V1BvR3RydkRXc2dv?=
 =?utf-8?B?REtiWjY0VTRPYllram1ONllJWkhkNVpjMzFxOTBXcnA0ZWdzakFsWFFjY3px?=
 =?utf-8?B?OTBYanBIT1ZmS3M3Y2FrOXE0ZWt4TTNMaUtvYThYZXlQYnJNb0ZQcDlVakRy?=
 =?utf-8?B?V2wwdTdZYXVzQ3Rxem1OUUNCTkFNbGVHZGJpUWdRTVNZMXdUMEhDRTNkZHFh?=
 =?utf-8?B?RUxBZmJBV3lyeWRTTnVGSmRaRUFyMzF1cTRma01aOFlSOUN2SVNWM3JINFpL?=
 =?utf-8?B?Z1NmTTZxdlpjQXF0Yis3a3ZISlkwR2N2bVRtK2xPMHd4alZRamNGd0R2bWNO?=
 =?utf-8?B?Yk02cmkwYmtoZVBtQWp0UU9Ia2EzYWpCZFUyN2dNQnc0WUNad3VJV21NdzFZ?=
 =?utf-8?B?Q0FZa1JYMjR0WE1mQkFMZEtxcEc3QzBsU2JrQjhXaHQ5aVFUTHdlYjN0bVAr?=
 =?utf-8?B?b2xpWXpNT2JRajdxcVh0cTBSZ0RJMWF4SkRFWWRIQUFONmRETTZjVFpXby9H?=
 =?utf-8?B?ZlZVcHVPaHQ4YS94dmxzb092NHlhOXZQSDhtSVRkbVcydjhhckJzcEZwejVV?=
 =?utf-8?B?MUpzMjkwT2JiSTIrSFY0SDY4bDZRMFJ3cEg3TVEydWt3aE10R3c4cFZyRldJ?=
 =?utf-8?B?eVgyckpNRWpady8weWFybmptNk5TWEd5TFJXNlJ2b1lVWi8vZnd2MWZNSmVK?=
 =?utf-8?B?cWVqVzJVY2JEYjlIeWxJcXlqRlRJakpwRHBPVXNFL3ZhcXJTM0tvM1BmOFdZ?=
 =?utf-8?B?MjcxZTE3ZFVhaEkwVVg3ekwwcFBXZzVUbGNYOC84clErRldrdWlidVhOMXV1?=
 =?utf-8?B?OXlvMWZnYkdZWFhwZ1BscHRRb3VDQzJyVXdtWmh2WnhHNGVtazlpQW5hVEdU?=
 =?utf-8?B?RXJYQlUrQkZLYStDR2x6dGcxZ3NEUlluOEJ5MzRLQ0ZVMVZpaUZCSVVwRGVM?=
 =?utf-8?B?RlhlZmRSU3RZRHpvSEVyY1pKTFFZYlpDb2hrc3hTNDJJZmhjOGUxQ0trdEdQ?=
 =?utf-8?B?bWkzdStWdG9hbWVtK2RBcEIvWW81bld2TVBUQ1dkb2ZNbXNjNTNHcGNjZldM?=
 =?utf-8?B?Q01naG8wMW5GM1NucVpFLzZoQ1lOZ3IrTWU3MmJhS3JMdFhFWmZyaWQzc3lj?=
 =?utf-8?B?Sml0WTlXWUZmVDlkSmp1SUNiUTBYRGRhTVdWTG5VMERHT1JKODJPTUJtQkd1?=
 =?utf-8?B?cXRJMlpMeklxOTluWXVxQklDVlZHemZuZGVYcXNMRnBCWmRNamw4MGdkZ0hR?=
 =?utf-8?B?Y0RvTStZQUNJcnhnSHdxeW4xdk5vcmpGaFBtK0dwSXhweEdWSlA1V1R2aUc0?=
 =?utf-8?B?R1VCMGlINjdQdVV6blNMZjdWKzkwZWlZV3M1bXFoalpnaXNHd1hjZjFGd2Ni?=
 =?utf-8?B?SldEbVVuWXNmNDlDODFDNGIzWTBCU3BpWEpGYWdOcXNHd2ttZVlRam02Smdt?=
 =?utf-8?B?aDIxZlVwc2V5akxYUGNycUtyM1dncldoWDlzdWhwMHpsRTdJaHQyL1NqYVdO?=
 =?utf-8?B?TDlMbUV5RjNscVg0SHJtZHFGK3dVeENOTHdHYlhXS3k4UHJuYmd5QTJIMHpx?=
 =?utf-8?B?Y211eVdJSTZVS1VPVWlBUG8rZWJGQ3p1dHhBUjRDOGdVV3BibzJiSzFuZjNJ?=
 =?utf-8?B?a1JRWWRyanowLzdtYzZ4MThuQnlrYkIyR3pKWkZuUnRoZ3ltUTE1ZmU3Yk1U?=
 =?utf-8?B?cTJOSzZNeWYreWducEhUSFhRaURhVmFobVhGWE1aNjhWRENIU09PQXRGYnV0?=
 =?utf-8?B?OFk5NzEvNEY2a3d4cUR2eHh1ekE4bm1aeExsQ3QrZytwcFdTOXFFVDlobDMy?=
 =?utf-8?B?VkZ6RjZhSGh4Zjdyc05laEpma3dLWTc0dWgweDV3TlZiN2Z2dXcrcmYvQlpL?=
 =?utf-8?B?NGcrNzdRMHRaTnNhQTNxdjhtcWxUSGFhVTRYNEFsWmVybHJFWlZSWlNFbEJY?=
 =?utf-8?B?NDJpb1FDT3BWc0FtVkl6d2RPSzdad25NZkp1WFkwUjNkWXZjTzhUNlFycWF3?=
 =?utf-8?B?QWFYUzhuU3FNSWdXWHlTVEhVTVRYNEEyRkhNMW83WG9IWmdaZTU3VUh3WFoy?=
 =?utf-8?B?SFU0eGdGOTdCaTl3TE1aUnBzTEE0V1p1U3lkRzhjdHZzbFlNUE9SUjBMVVhh?=
 =?utf-8?B?TVUwZVZneW1PeTBwbmJndGNubGNvcHV0cHBvVktUR21XYjRURWFYM3pmSWFy?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D92C17E37A07C24A9EBE5E1EEC6BB695@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e660fb51-b3d7-4e19-b21f-08dd5bca965d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 09:46:22.0305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJrwWLBWZYhKNLwINqkrVuGD2dBFf6JKVjmBVhSi7jbWYRePCwLuR5SgplYo4y22z2YloTo7uv31ynTN+8AushIAHDl9yzonBEm06BVLd2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7098

T24gVHVlLCAyMDI1LTAzLTA0IGF0IDEwOjM1ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMTgvMDIvMjUgMDY6NDEsIEphc29u
LUpIIExpbiBoYSBzY3JpdHRvOg0KPiA+IFdoZW4gR0NFIGV4ZWN1dGVzIGluc3RydWN0aW9ucywg
dGhlIGNvcnJlc3BvbmRpbmcgaGFyZHdhcmUgcmVnaXN0ZXINCj4gPiBjYW4gYmUgZm91bmQgdGhy
b3VnaCB0aGUgc3Vic3lzIElELiBGb3IgaGFyZHdhcmUgdGhhdCBkb2VzIG5vdA0KPiA+IHN1cHBv
cnQNCj4gPiBzdWJzeXMgSUQsIGl0cyBzdWJzeXMgSUQgd2lsbCBiZSBzZXQgdG8gaW52YWxpZCB2
YWx1ZSBhbmQgaXRzDQo+ID4gcGh5c2ljYWwNCj4gPiBhZGRyZXNzIG5lZWRzIHRvIGJlIHVzZWQg
dG8gZ2VuZXJhdGUgR0NFIGluc3RydWN0aW9ucy4NCj4gPiANCj4gPiBUaGlzIGNvbW1pdCBhZGRz
IGEgcGFfYmFzZSBwYXJzaW5nIGZsb3cgdG8gdGhlIGNtZHFfY2xpZW50X3JlZw0KPiA+IHN0cnVj
dHVyZQ0KPiA+IGZvciB0aGVzZSB1bnN1cHBvcnRlZCBzdWJzeXMgSUQgaGFyZHdhcmUuDQo+ID4g
DQo+IA0KPiBEb2VzIHRoaXMgd29yayBvbmx5IGZvciB0aGUgTU1JTkZSQSBsb2NhdGVkIEdDRXMs
IG9yIGRvZXMgdGhpcyB3b3JrDQo+IGFsc28gZm9yDQo+IHRoZSBsZWdhY3kgb25lcyBpbiBNVDgx
NzMvODMvODgvOTIvOTUgLy8gTVQ2Nzk1LzY4OTMvZXRjPw0KPiANCj4gSW4gb3JkZXIgdG8gYWN0
dWFsbHkgcmV2aWV3IGFuZCBkZWNpZGUsIEkgZG8gbmVlZCB0byBrbm93IDotKQ0KPiANCg0KWWVz
LCBpdCdzIGZvciB0aGUgU29DcyB3aXRob3V0IHN1YnN5cyBJRCwgaXQncyBub3QgcmVsYXRlZCB0
byB0aGUNCk1NSU5GUkEuDQoNClRoaXMgY2FuIGFsc28gd29yayBvbiBNVDgxNzMvODMvOTIvOTUg
Ly8gTVQ2Nzk1LzY4OTMvZXRjLg0KWW91IGNhbiByZW1vdmUgdGhlIGBtZWRpYXRlayxnY2UtY2xp
ZW50LXJlZ2AgcHJvcGVydGllcyBpbiB0aGVpciBkdHNpDQphbmQgY2hlcnJ5LXBpY2sgdGhpcyBz
ZXJpZXMgdG8gdmVyaWZ5IGl0LiA6LSkNCg0KUmVnYXJkcywNCkphc29uLUpIIExpbg0KDQo+IFRo
YW5rcywNCj4gQW5nZWxvDQo+IA0KPiANCg0K

