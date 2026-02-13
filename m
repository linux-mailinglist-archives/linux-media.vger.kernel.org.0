Return-Path: <linux-media+bounces-52712-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKYZKkXzjmk5GAEAu9opvQ
	(envelope-from <linux-media+bounces-52712-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:47:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BC8134A3D
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED49E306B088
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2542934F241;
	Fri, 13 Feb 2026 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="L5l8mSuq";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Gm1pwMwF"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A1334BA44;
	Fri, 13 Feb 2026 09:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770976057; cv=fail; b=dEejaY5pq6c7/Z1/NE48bGAXfHjbYl4Q3fwaaEsra1ldzPWlr70mbbPhbxkXqjg+fES7j4lWonJj/gRgHRauXfFpnQwoPQdh77sjuUm/nWP3pocj2oNqpvMGNo6IQsw0ATGqxKCN73DCvFezV8dWpJo22Z8JZJMBlsMqa3yLE40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770976057; c=relaxed/simple;
	bh=lQY6bEWgfZeRM2ceCRbmVrXeIini7g2wTM1fpr6umyE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=reumb83bstGdM7YAHd8WzxeGdt8yrEWfUG5xaAIGHtJLd7CyA2G0f4VUf8fx/GNfvcan75tqnacRUkuAIxSKBR2mzPnTUN4pHh2OXh8YJcEOfvCUd97SXYPtDPDyWu+zvJjPY2nKwpZWUDGGIZYNMxo3w8qgOrnunDdpwpFnTlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=L5l8mSuq; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Gm1pwMwF; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 01a963bc08c111f185319dbc3099e8fb-20260213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=lQY6bEWgfZeRM2ceCRbmVrXeIini7g2wTM1fpr6umyE=;
	b=L5l8mSuqHnpuTBnbSxHhJmTTAQLOamppipIIkkEA0vjikv3z6QTaD6KcKfhpIFZFI2wMaoGLdSbTtr3KWer5ECilTOamevcm9WvrquyncrVDdm0fRWMynPPMiHs5TwkQX7/9m2LtWYUP5PksoFQqFtl/SBZUuiMfsWo/a38veK4=;
X-CID-CACHE: Type:Local,Time:202602131727+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:289b4c6f-5d65-4dc0-87fe-aa382665e7bc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:4deeeb7a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 01a963bc08c111f185319dbc3099e8fb-20260213
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1167135850; Fri, 13 Feb 2026 17:47:27 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 13 Feb 2026 17:47:26 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 13 Feb 2026 17:47:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOi8fMkW5BcuXZO82si7mWBj+TgjaFtfq+oVQNbpO3HNyFniDf8yaY7xeoK5VF+Ee37MkLX+WuITlRJe3+dn9pd2GSdD+1L4LP4uB6BK2yVoqoucT7ll1vWUr+9+QCxCdLfUqU0OIJ6kuPR2WNHSdIxe1my13ISnHudPGn1zoeUjBPmT6vOU8eu2hFks9GKazfi2agYV6CHucMJbfj5IszVq0tCRLCB6g5mZi2Bq78dOYE2lqYv6eTDZelZi1MaknaF3s1fRJXDIN4pl2lNnKpmUmSphnfvZ9MpOi5/EfDccAB1k8hJzLTrJjk3hj/0RdN5wElrqzMdOANJRFGUP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQY6bEWgfZeRM2ceCRbmVrXeIini7g2wTM1fpr6umyE=;
 b=SJ8n2jROemtHEgtOAmRTm/a5qzt2PJH3iYz9UTOJngaPYZT/c8mHJUMYJzLs2mP4uH99HQ4mhEZhQqQH7cA6768gr7xDbuN/fRV+/jK6xp823n7NwR1zzQXg7jfQlLgFi5dm9FdsSWKmFx5mGKkBqZeh/zqBSJEYUIc2BVcvyrcIBBwJDpZWoX6+24ZTZ9Q0Pi5Dwgz+ymyxVXyxhh78oqg985id5BerfWjLuyzTobLCOpS9htRksmUlnAQ5YsS+MF5JdWgWBpoDgY4KTcE7D1CINnAQCDovRplI39+mjXDZ5eRE0NtS77Aslpl4Gin1SqPiGQF17F2vz/AAA5OOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQY6bEWgfZeRM2ceCRbmVrXeIini7g2wTM1fpr6umyE=;
 b=Gm1pwMwFb6SaOLgovVkD7xSrf0hFLtPhH/54ZJQPHJ/7qmxG66IKHhPo3B+yhkJk5RP602Eu/oD8yXY7g+tHKDEv8GpESTZY8+EIziNvB7YR509upF3RIXrVf2IDgZdEqsVRu7eMHX9Xez6RG7Hug2fAqSQLzPljANNFaKkuLgU=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by TY0PR03MB8199.apcprd03.prod.outlook.com (2603:1096:405:18::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 09:47:22 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::b481:9458:6a7:b356]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::b481:9458:6a7:b356%4]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 09:47:22 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	=?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	=?utf-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?=
	<Maoguang.Meng@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 5/6] dt-bindings: media: mediatek,vcodec-encoder: Add
 MT8196 with VCP support
Thread-Topic: [PATCH v4 5/6] dt-bindings: media: mediatek,vcodec-encoder: Add
 MT8196 with VCP support
Thread-Index: AQHcnAaiH9bvJOQmFEiMhKsD0Jzb37WAQ0mAgAAcrsGAAANzgA==
Date: Fri, 13 Feb 2026 09:47:22 +0000
Message-ID: <dad64d23d0e9588979005f5770806105eb32a831.camel@mediatek.com>
References: <20260212100104.11863-1-irui.wang@mediatek.com>
	 <20260212100104.11863-6-irui.wang@mediatek.com>
	 <20260213-didactic-whispering-impala-ea9e64@quoll>
	 <13bf9b8673c6d47e07dee4a233945ed542e9b4f3.camel@mediatek.com>
	 <e69cf0c6-f7cf-4f83-a7fc-dc4b9dfe174c@kernel.org>
In-Reply-To: <e69cf0c6-f7cf-4f83-a7fc-dc4b9dfe174c@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|TY0PR03MB8199:EE_
x-ms-office365-filtering-correlation-id: 3dc34586-b11d-4f7f-4d11-08de6ae4e30b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?N2ZFMStaSFpqcTBQRFUreFpLdFVtMUZ3cXYxSmZFazdKSTVPUWZ1TFN3UzJ4?=
 =?utf-8?B?cWVZRUtSR2xYSUl6c0RSWnJpWFg0b2RhdDNEcTdwTnZvRk84MUVMOFpsMUM3?=
 =?utf-8?B?WXI1b29qL0tkWkQ1VTVMT2NsNGdMZm51MVIxbS9BbEx2bkFCUHkzbGczK1ZI?=
 =?utf-8?B?UW9nY3ppa2pGd244bTh1dGlOUmlxYmh2R1ZNSmtaSldCNEsySytFcTNUQTZm?=
 =?utf-8?B?N0Q3MHNoTU9sdDlxb2ZXaXREZHJJZXRTL1BvT0cwUFBMNXVGOUlKakZQN0FU?=
 =?utf-8?B?WlphQ2xQTzUyUWE4NmVMQlgxUnFDWkdmUEVtRUtHTWg1V2ttNVdYNUdqTGRx?=
 =?utf-8?B?SVlpSzB0YTgreUFuMkRPWGlSb05tUnZ2a2tFYUtTMlVwMHU5OUppaXd4OXR1?=
 =?utf-8?B?L0JtRTVtcWZHNGVHTXRYS3RQQ0k5N1UyWDM1MFdmNmxtMFB1MmxXVjdGdlpM?=
 =?utf-8?B?Q3lOS05rVTdRRHFFdmE4b1JNVk9obTk0REpGdG9BbDhEdE4wcUZtNExsQmgw?=
 =?utf-8?B?VkdZRkFNZldyRTZ2RkJHWWVZQngzZXJiRVdMUlJGQXlnSXNnNFU1cStaK1hM?=
 =?utf-8?B?WGR1U3pLYjBKazUrZXo1bjUzeDdjM0I3NmZIbmlJU3QzMkhwSWlkVzVBNWM3?=
 =?utf-8?B?NFpPbWxWVUttK2duR1BydEZJUDFHT0E4WHZ1SVByYTljZG41TEZrU0FUTnhO?=
 =?utf-8?B?Z0txQVBJVmFOeVkwVUl6VmVJempaSkU1OWxFMWwwNFB3by90VzdrUU5VdU9K?=
 =?utf-8?B?RXNtamN0blVDODZuN3hZVGtVYm9ZWE0vV290elcyOXNKQVJ4a2s2ckxzNldO?=
 =?utf-8?B?NUM0RTFldmR4TzNCZEtTWDFlZGx0MlFkVkJqdm1Vbld5endhcElrcEhXaE83?=
 =?utf-8?B?ME1oUGlkRnF6MDhqdTVNYXR6UkhoOU50TXIrVVkrRVRUYlQ5dXdhSU9rNjFO?=
 =?utf-8?B?V1U3SHpiQXFSaFh2OWJuYlozbWg2ZlVNcDJmSDcvTm5ERDM4MFpyUUNiODBT?=
 =?utf-8?B?SVVUUERYR2t1V1k4Qzh5Q1ROOGNZM0FYYlBvcjR1TDdEZng1ejlob1VzZVk3?=
 =?utf-8?B?RUMxNWhHV3d5bGNmVTEyS1lQcXRVMmhVLzFsRmF6eEc4NkVnSW8zYXFHNk9Y?=
 =?utf-8?B?STY4UmpiYlptZXZmWlpRVS9JUWF4QXU0ZmI3ZTQwUHdYMk95Y3BKMkhmODRp?=
 =?utf-8?B?RHF2ZHJKUGtZall2ZE9Lay84NEMvMEVGbS9ScG1Iem5oK0NQV3pIOUtNTlda?=
 =?utf-8?B?RnFBcXpOTWtJU1JsN3NTZTRnMWdlaVdCSDRObnFjWnd2K05hOVg5d1JhV0tk?=
 =?utf-8?B?Njkwa1JaTHJ5THNHN3dkc3Y4a0pMUmJ6TzJlS2pEV2FrajR2VVJiVFcvTXRl?=
 =?utf-8?B?THFteFRSbEoycEJiK24yYVBETjNPSDBTTUpzZXk3K2RDN0tKZXJKN2hGN2dw?=
 =?utf-8?B?QkxuNjNyS0pCc0E0SFV0SktJSTE2MkJRSUU0Z1Z6cTFDc1h2OFRnemRodTlz?=
 =?utf-8?B?SStaYzVvcGczYldoZ2pJYmpEMGU0aVhYSjJudnhWODkvYnZIdjRkdE1icHBC?=
 =?utf-8?B?aW1SUFNld2c0a3U0M2tBN0tKL0toYVgzbGtGUi9URU9WNDFwaHBvNTJBRk9t?=
 =?utf-8?B?RjNLcTAxQ0dCSGxyRnhJWkl2V1JoMVRycDFpcDJkM1lUdjAvN3hPQ3kyUUNv?=
 =?utf-8?B?anV3S3NHZk4yM0szN1ZyUXoyZm5wOWhxMXIzTkp1MTFKN1VZRVU1c2R0TnEr?=
 =?utf-8?B?V3NBUEo3WTNsUzZhOUMxUk5TTHBkS2tXV01oT1NtekFJaEhmK05IZHJrcCtM?=
 =?utf-8?B?blpFL1YxbzNPcVliTlJnOFFPNDFsa0RvZ3RERllrQVMyWVZ6V1ExUHZYc0dK?=
 =?utf-8?B?WUg1a1dHT2tLTUl3SVM3OTB1alhudjd6SXhHUWxjN2dRUTBIaWZHZXQvQmkw?=
 =?utf-8?B?TGdHTUVZbkhoS1hhcHBaQ3FxZlVDSk5YUnQ3cVlvUVkxbS84dm91WDdueURN?=
 =?utf-8?B?QWZad096bVpsQWtxWXlGb2hoTjB4Z09tcWlKNVY2YnhRYnhlQ0pMcUZXbCtt?=
 =?utf-8?B?amgwNlpka2RWNW9yMnBvTW9iQ0d4UmxVMkdVaGlnTittb0FMcVUwcUh3ZzVB?=
 =?utf-8?B?cHAvL1c1cDhqVEszcmQ2UGVvZUx1d2xxaW8vOW42RE84Z0cwd0RHNFYzZFhX?=
 =?utf-8?Q?mb1xs0HMGz973RXF8W0U364=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TURJMm92MkJyN1dLRkc2bjIvY2lvR2FzSG1nczJGZlkxM2xBdTUwczFySHZZ?=
 =?utf-8?B?SFRabnVVQ1VKcEk5WHVxUlFFZUdpcnpMSmlhMFB2YjArMUpwQ2RQMmRidWkr?=
 =?utf-8?B?Y2RVckJRdkpUN0hWK1FQWGhJcUY1L0xaNC9HQ25xeTBpd2xzbHhGRStxQmVp?=
 =?utf-8?B?R3JPRGJ5MnVtcjJUdlFoOXZScWc1VE8rbWZ1U3JaNVp5LzlBR3ZBNFJMVVBF?=
 =?utf-8?B?MUo4N29Idm0vMXlFdXBEL3RmYnlXc3F5RENNc3hDSG1pVGc2QjVNbzBxVDBn?=
 =?utf-8?B?NGxmS1JUMDA1b3hHbEFSSUlsaXBpUkpQS0lpc3R2c25WZ3ZRSVpnZ3pPb1Zo?=
 =?utf-8?B?UEVKVjY4WklaT1ZKdmZOamRjdWxlVVpUZnJXcVVaMHFtUDlMZkpXUEpuV1B2?=
 =?utf-8?B?RTJvS1JqMW00TW5oMVo0cW0xRjJGSVpucHllWVNSYm9UbVFRbUpZdERTeHVj?=
 =?utf-8?B?NkhXbVUzbnBHc254MldnMHZSektxTk9qM0JBYVpyb2l3UXlpbHYzcFkvb1ox?=
 =?utf-8?B?ZW5aVGFwWktjRmRpMVlBUzJ0MlhveSsxVFp3OUlSeGRpOGdCR1NOQ0dHNnZ4?=
 =?utf-8?B?SzJGR2dhSDNEeFdKMHhENkM1SG1jM254TDFoelMrYm5OM3lEckhJNmE4NUQr?=
 =?utf-8?B?OHVoZHEwKzJPNUljS2ZCVkFkWVVjZms1dnM3RHJUcXNSeXNsWmhLRjlTRUlT?=
 =?utf-8?B?YlNaak1KQnRwT1l2NHo5UEpnRmxpMEpWcHh6ZGF5a3Y1c0JLcUJHQU1MWTNW?=
 =?utf-8?B?VjVxbnVUT0xZcDBwbWY2MHBnV1FYMUxBeGgzZm5FRHZDK3poUFRsdE1TY2xF?=
 =?utf-8?B?TmRRTHp0bHhYWFh4SjRxMXBGaWgwYWpCYkNFdUNsd2wyTk5GSm45K0U4SVVQ?=
 =?utf-8?B?SnFPMkZjaFVCU1RncGdMSDhCbVpvYlVuT0E2djU0aWpXSXdIelVrK3NtQ0xi?=
 =?utf-8?B?WktRcURQRjdkZVkxQmFkZ2JpalV4Y3hwQktFMnNpRUxwVzhIckMxYWpldStN?=
 =?utf-8?B?L1RVY0QreDI3c0FGMkNnYUl3OVVWeWtReEVwOS9YMEJOQ3dEUkFGQzhYaU9T?=
 =?utf-8?B?NGdBVmpmSFZKMGFTTVg5SmtidmswVGxZQ3VrM1RpbkdIeUFoLzBOZnBPTG94?=
 =?utf-8?B?R0dBYm13SXR3V1JDTVJpSTBrejZmYWt6UEJVNlhKZGhWWVV6RWYwNDk2bk13?=
 =?utf-8?B?VFVROXFqNU5JaHlVaHdHdjFZaER2aUxpUithU1FhV3U3bnRRSWFRQzNkOTRu?=
 =?utf-8?B?V2ZOZEczZHgyUnh0c1p3SDdNekV6N09ObDVGb1dYVGJ2N0gvUDlsa2QvLzhx?=
 =?utf-8?B?QVNlYmhlSVUvWExOZS9UNEllZUFmVlh1R3RUMHdwazNSOXEwUEhwUXJ3UDdh?=
 =?utf-8?B?dGxCSTFDSWU4SzNGbHdzSFFEWWoydjBZR0cvb2IxN1RqMCsxaVRtVWR6d1dB?=
 =?utf-8?B?WVBzMEZLR09lL1ZwNzBCdmsyTlF6UHIwUmdwNGc5VVByOGt0NkxlbkNCd1hz?=
 =?utf-8?B?S1FXKzVSVUV6Nk94eS9WVlRha2k0cDNBcjNwZUozUStkTzR5c3pMbkZKa25t?=
 =?utf-8?B?S1BZRjJiVEsrTW9yRjcxSU1ibVFLZENwdWx4ZHRsVWd5U0lWWjZIQjQ4UGtT?=
 =?utf-8?B?ZldBZ0JCaStsRlVRU3Ava0NOS1dJejYyekFTQ0c1cTlxc0lCdnQ4M2xSTWZW?=
 =?utf-8?B?ODBpay9UbzNVeU8yeGtyYitIRkNOVmhGOWlJbW05bXIwb3c5MkhveE94V3Rs?=
 =?utf-8?B?SzVlVnFyLzdPNEZjMlAzYXVBUFR5MHREamo4Nk1FbzJBeng0NnY1bCtDVlRl?=
 =?utf-8?B?UHpPSkNuZ29XUEhHbDVCckVEcThzQzBBLys4cER6Uk1Dc3RwT2xpK2NaZmtD?=
 =?utf-8?B?VjlTN0t3ekZZMkVUWGlXWWF4cFdRWXVLSWdBQ1pIei9EaXQrWWVDblRNR1Rx?=
 =?utf-8?B?elNCbUtidWYrOHYwYjV4M2RXYjd6SHpaR0ZST1J3enFmdktxRlp2ZTJMZm4y?=
 =?utf-8?B?NHpYNmZXVUdia2p2RlVvVHIvWVFPaXlzUnJ3bVdYMlhzSnNxZkVwVU9IQ2Vj?=
 =?utf-8?B?SUxZcUE5T09ZaHAwVFNVNjJWZmJYc0s5dmF4cXdWWmNqRnRDQlA3VjlUZHEr?=
 =?utf-8?B?bXNkR3MxTlNLRGlyazNxNE1BOTNuUTdnSzFJdEEweU5VdzUwZk40bXBVZjlu?=
 =?utf-8?B?a0NiM1FrOWpiRi8wT2RnSTIzVDgzQTBPNDJKcmo0UEZ2Rzc5Rk04MzQ1RnZn?=
 =?utf-8?B?OC9SYVFlM2xRRW1xaDk2TXZhTG1DNzBkbHhCd2VTSm1UTEJXOFkzWm0ydGVV?=
 =?utf-8?B?Z2pMVXhxaTlCUGc1bTlDbHhxcjI3S1BsSXkweXB2c1M4ZXdnYnBTdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB3DE0E196735146B2EC430E1D98F347@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc34586-b11d-4f7f-4d11-08de6ae4e30b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 09:47:22.7159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T/S+lnckKhY8YecOrusI0fp/q99AlC3PNfnWmR5VKH4ZyMGRZxMdciB10FPBo/hY9MYI9UpN1CniLRvvTwZx3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8199
X-MTK: N
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52712-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,mediatek.com,chromium.org,lists.infradead.org,collabora.com,xs4all.nl,gmail.com];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Irui.Wang@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 46BC8134A3D
X-Rspamd-Action: no action

RGVhciBLcnp5c3p0b2YsDQoNClRoYW5rcyBmb3IgeW91ciByZXNwb25zZS4NCg0KT24gRnJpLCAy
MDI2LTAyLTEzIGF0IDEwOjMyICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiBP
biAxMy8wMi8yMDI2IDEwOjI3LCBJcnVpIFdhbmcgKOeOi+eRnikgd3JvdGU6DQo+ID4gRGVhciBL
cnp5c3p0b2YsDQo+ID4gDQo+ID4gSSBzaW5jZXJlbHkgYXBvbG9naXplIGZvciB0YWtpbmcgdXAg
eW91ciB0aW1lIHRvIHJldmlldyBhbmQgcmVzcG9uZA0KPiA+IHRvDQo+ID4gdGhpcyBwYXRjaC4g
VGhlIG1haW50YWluZXJzJyByZXZpZXcgY29tbWVudHMgYXJlIHZlcnkgaW1wb3J0YW50IHRvDQo+
ID4gdXMsDQo+ID4gc28gd2Ugd2lsbCBuZXZlciBpZ25vcmUgdGhlbSwgdGhlcmUgbXVzdCBiZSBz
b21lIG1pc3VuZGVyc3RhbmRpbmcNCj4gPiBpbg0KPiA+IHRoaXMgcHJvY2Vzcy4NCj4gPiANCj4g
PiBPbiBGcmksIDIwMjYtMDItMTMgYXQgMDg6NTIgKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kg
d3JvdGU6DQo+ID4gPiBPbiBUaHUsIEZlYiAxMiwgMjAyNiBhdCAwNjowMTowMlBNICswODAwLCBJ
cnVpIFdhbmcgd3JvdGU6DQo+ID4gPiA+IEFkZCBzdXBwb3J0IGZvciBNVDgxOTYgdmlkZW8gZW5j
b2RlciB3aGljaCB1c2VzIFZDUCAoVmlkZW8gQ28tDQo+ID4gPiA+IFByb2Nlc3NvcikNCj4gPiA+
ID4gZm9yIGZpcm13YXJlIG1hbmFnZW1lbnQuIFVubGlrZSBwcmV2aW91cyBwbGF0Zm9ybXMgdGhh
dCB1c2UNCj4gPiA+ID4gU0NQL1ZQVSwgTVQ4MTk2DQo+ID4gPiA+IHJlcXVpcmVzIFZDUCB0byBs
b2FkIGFuZCBleGVjdXRlIHRoZSB2aWRlbyBlbmNvZGluZyBmaXJtd2FyZSwNCj4gPiA+ID4gd2l0
aA0KPiA+ID4gPiB0aGUNCj4gPiA+ID4gZW5jb2RlciBjb21tdW5pY2F0aW5nIHRocm91Z2ggVkNQ
IHRvIHBlcmZvcm0gZW5jb2RpbmcNCj4gPiA+ID4gb3BlcmF0aW9ucy4NCj4gPiA+IA0KPiA+ID4g
QWdhaW4sIHJlYWQgcmV2aWV3IGZyb20gdjIuIFN1YmplY3QgaXMgc3RpbGwgd3JvbmcuDQo+IA0K
PiBIZXJlICJyZWFkIHJldmlldyBmcm9tIHYyIg0KDQpJIHdpbGwgcmV3cml0ZSBTdWJqZWN0IHRv
ICJtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhdGVrLHZjb2RlYy1lbmNvZGVyOiANCkFkZCBNVDgx
OTYiIGluIG5leHQgdmVyc2lvbi4NCj4gDQo+ID4gDQo+ID4gRnJvbSB0aGUgcmV2aWV3cyBvZiB2
MiBhbmQgdjMsIG15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGUgcGF0Y2gNCj4gPiBsYWNrcw0K
PiA+IGRldGFpbHMsIHNvIHdlIGFkZCBtb3JlIGRlc2NyaXB0aW9uIGZvciBjdXJyZW50IG1vZGlm
aWNhdGlvbiwgZm9yDQo+ID4gJ1ZDUCcNCj4gPiB1c2FnZS4gU28gd2UgYXJlIHZlcnkgZ3JhdGVm
dWwgaWYgeW91IGNvdWxkIHByb3ZpZGUgYSBgY29ycmVjdA0KPiA+IFN1YmplY3QNCj4gPiBgIGV4
YW1wbGUgZm9yIHVzLCB0aGFua3MgYSBsb3QuDQo+IA0KPiBZb3UgcmVjZWl2ZWQgb25lIGF0IHYy
Lg0KPiANCj4gPiANCj4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IEFkZCB0aGUgIm1lZGlhdGVrLG10
ODE5Ni12Y29kZWMtZW5jIiBjb21wYXRpYmxlIHN0cmluZyBhbmQNCj4gPiA+ID4gaW50cm9kdWNl
DQo+ID4gPiA+IHRoZSAibWVkaWF0ZWssdmNwIiBwcm9wZXJ0eSB0byByZWZlcmVuY2UgdGhlIFZD
UCBkZXZpY2UsIHdoaWNoDQo+ID4gPiA+IGlzDQo+ID4gPiA+IHJlcXVpcmVkIGZvciBNVDgxOTYg
ZW5jb2RlciBvcGVyYXRpb24uDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJcnVp
IFdhbmcgPGlydWkud2FuZ0BtZWRpYXRlay5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgLi4u
L21lZGlhL21lZGlhdGVrLHZjb2RlYy1lbmNvZGVyLnlhbWwgICAgICAgIHwgMTkNCj4gPiA+ID4g
KysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlv
bnMoKykNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLQ0KPiA+ID4gPiBl
bmNvZGVyLnlhbWwNCj4gPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvbWVkaWF0ZWssdmNvZGVjLQ0KPiA+ID4gPiBlbmNvZGVyLnlhbWwNCj4gPiA+ID4gaW5k
ZXggZWJjNjE1NTg0ZjkyLi40YzhhY2ViZWI5ZDMgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtDQo+ID4g
PiA+IGVuY29kZXIueWFtbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLQ0KPiA+ID4gPiBlbmNvZGVyLnlhbWwNCj4g
PiA+ID4gQEAgLTI0LDYgKzI0LDcgQEAgcHJvcGVydGllczoNCj4gPiA+ID4gICAgICAgICAgICAg
ICAgLSBtZWRpYXRlayxtdDgxODgtdmNvZGVjLWVuYw0KPiA+ID4gPiAgICAgICAgICAgICAgICAt
IG1lZGlhdGVrLG10ODE5Mi12Y29kZWMtZW5jDQo+ID4gPiA+ICAgICAgICAgICAgICAgIC0gbWVk
aWF0ZWssbXQ4MTk1LXZjb2RlYy1lbmMNCj4gPiA+ID4gKyAgICAgICAgICAgICAgLSBtZWRpYXRl
ayxtdDgxOTYtdmNvZGVjLWVuYw0KPiA+ID4gPiAgICAgICAgLSBpdGVtczoNCj4gPiA+ID4gICAg
ICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODYtdmNvZGVjLWVuYw0KPiA+ID4gPiAgICAg
ICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4My12Y29kZWMtZW5jDQo+ID4gPiA+IEBAIC01
OCw2ICs1OSwxMyBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiAgICAgIGRlc2NyaXB0aW9uOg0KPiA+
ID4gPiAgICAgICAgRGVzY3JpYmVzIHBvaW50IHRvIHNjcC4NCj4gPiA+ID4gIA0KPiA+ID4gPiAr
ICBtZWRpYXRlayx2Y3A6DQo+ID4gPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4gPiAr
ICAgICAgUmVmZXJlbmNlIHRvIHRoZSBWQ1AgKFZpZGVvIENvLVByb2Nlc3NvcikgZGV2aWNlIHRo
YXQNCj4gPiA+ID4gbG9hZHMNCj4gPiA+ID4gYW5kIGV4ZWN1dGVzDQo+ID4gPiA+ICsgICAgICB0
aGUgdmlkZW8gZW5jb2RpbmcgZmlybXdhcmUuIFRoZSBlbmNvZGVyIGNvbW11bmljYXRlcw0KPiA+
ID4gPiB3aXRoDQo+ID4gPiA+IHRoZSBmaXJtd2FyZQ0KPiA+ID4gPiArICAgICAgdGhyb3VnaCBW
Q1AgdG8gcGVyZm9ybSBlbmNvZGluZyBvcGVyYXRpb25zLg0KPiA+ID4gPiArDQo+ID4gPiA+ICAg
IHBvd2VyLWRvbWFpbnM6DQo+ID4gPiA+ICAgICAgbWF4SXRlbXM6IDENCj4gPiA+ID4gIA0KPiA+
ID4gPiBAQCAtNzYsNiArODQsMTcgQEAgcmVxdWlyZWQ6DQo+ID4gPiA+ICAgIC0gaW9tbXVzDQo+
ID4gPiA+ICANCj4gPiA+ID4gIGFsbE9mOg0KPiA+ID4gPiArICAtIGlmOg0KPiA+ID4gPiArICAg
ICAgcHJvcGVydGllczoNCj4gPiA+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiA+ID4gKyAg
ICAgICAgICBjb250YWluczoNCj4gPiA+ID4gKyAgICAgICAgICAgIGVudW06DQo+ID4gPiA+ICsg
ICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk2LXZjb2RlYy1lbmMNCj4gPiA+ID4gKw0KPiA+
ID4gPiArICAgIHRoZW46DQo+ID4gPiA+ICsgICAgICByZXF1aXJlZDoNCj4gPiA+ID4gKyAgICAg
ICAgLSBtZWRpYXRlayx2Y3ANCj4gPiA+IA0KPiA+ID4gQW5kIGhlcmUgc3RpbGwgZGlkIG5vdCBp
bXBsZW1lbnQgdGhlIGNvbW1lbnQuIFNvIGJhc2ljYWxseSB5b3UNCj4gPiA+IGRpZA0KPiA+ID4g
bm90DQo+ID4gPiBpbXBsZW1lbnQgZnVsbHkgdjIgYW5kIHYzLg0KPiA+IA0KPiA+IElmIHlvdSBh
cmUgbWVhbiBhYm91dCB0aGUgYGVsc2Ugc3RhdGVtZW50YCwgSSBsZWZ0IGEgY29tbWVudHMgYW5k
DQo+ID4gd2FudA0KPiA+IHRvIGdldCBhbiBleHBsYW5hdGlvbiBmcm9tIHlvdSwgaWYgeW91IGZl
ZWwgdGhhdCBteSByZXBseSBpcw0KPiA+IHVuc2F0aXNmYWN0b3J5IG9yIGluY29ycmVjdCwgcGxl
YXNlIGxldCBtZSBrbm93Lg0KPiA+IA0KPiA+IFRoZSBrZXkgcG9pbnQgaXMgdGhhdCBvdXIgcGF0
Y2ggY2FuIHNhdGlzZnkgeW91IGFuZCBnZXQgYSBSZXZpZXdlZC0NCj4gPiBieQ0KPiA+IGZyb20g
eW91Lg0KPiA+IA0KPiANCj4gTmVpdGhlciB5b3VyIGFuc3dlciwgbm9yIGNvbW1pdCBkZXNjcmlw
dGlvbiBoZXJlIGFyZSBhY3R1YWxseQ0KPiBBTlNXRVJJTkcNCj4gdG8gbXkgY29tbWVudCBhdCB2
My4gSWYgeW91IGFuc3dlciB3aXRoIGlycmVsZXZhbnQvdW5yZWxhdGVkIGNvbW1lbnQsDQo+IHRo
ZSByZXZpZXdlcidzIGZlZWRiYWNrIHN0YXlzLiBPUiBleHBsYWluIHBsZWFzZSB3aXRoIGRpZmZl
cmVudCB3b3Jkcw0KPiB3aHkgb3RoZXIgZGV2aWNlcyBoYXZlIHZjcCBidXQgeW91ciBjb21taXQg
bXNnIHNheXMgdGhleSBkbyBub3QgaGF2ZQ0KPiB2Y3AuDQoNCldoeSBvdGhlciBkZXZpY2VzIGhh
dmUgdmNwPyBiZWNhdXNlIEkgZGlkbid0IHdyaXRlICdtZWRpYXRlayx2Y3A6ZmFsc2UnDQppbiBl
bHNlIHN0YXRlbWVudD8NCg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K

