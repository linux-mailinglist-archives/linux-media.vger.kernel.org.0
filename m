Return-Path: <linux-media+bounces-60039-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA5/FOrV8mnIugEAu9opvQ
	(envelope-from <linux-media+bounces-60039-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 06:09:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF63049D367
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 06:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47EF030128F6
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 04:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA0B363C6B;
	Thu, 30 Apr 2026 04:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aGd5aqai";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PF9ibTTR"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A0F35A3B1;
	Thu, 30 Apr 2026 04:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777522147; cv=fail; b=QmCHhQspVaXbIHSRicJuX+MXKbXm1aYedu1PuWcE7W9j46PcDrNm224QBqMDjuUTcaM0Ox11PcNj2G14FTCWv9+yz5diPGB8Ryxp5LmyxmQ+F9zC/va+aI6y7tMbbMerSyWEGlhsxr0cCTqekoM7DsObP2ftM8WO2jrMDmuuWLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777522147; c=relaxed/simple;
	bh=J9lpM2zKOAU7l8BBSVrSt8t1dA5xx082noxD7mRAakk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AkSTDTx5wmHbmhZdhgrPOi67DAwv44jm0on+8ICsBcH7E4Dty/JYjMoyzXBUd/O/p3IKRQNsxCGTpMWWiNBNWI12Eu+mRXVYXV1BVvVUVGSRfvHsbMETHvdpNgRBCsDd0MPk9ArBjB8QaMDfC4/pePQ+q7rE5HcvdcZEggLj8RM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=aGd5aqai; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=PF9ibTTR; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5042c792444a11f19a16598d5ca7f8ec-20260430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=J9lpM2zKOAU7l8BBSVrSt8t1dA5xx082noxD7mRAakk=;
	b=aGd5aqaic3nssb1WyM+dcmJt4dAIheldg90hc7uuDQ1Ai/9X8qpqlpSN3EDDFCuXWcAmYeQzx3qpxdtMB2+KVZajLcoNTwt4bpdbunSp/g89A8oAgyitbNGJDVFmoUYJigLWByAhz8VbrxdCEqF6AZ+QcODRqFHDSM5nXFIRPZY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:bd1e7fb8-25f3-4c7a-9194-6d8ad566282e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:eeb6a9be-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5042c792444a11f19a16598d5ca7f8ec-20260430
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1434193353; Thu, 30 Apr 2026 12:08:59 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 30 Apr 2026 12:08:57 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 30 Apr 2026 12:08:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHU+VbmxSvMI3GpoMHprmqMtnlZ3l2iGK3B8nWyAvuj19Q3tnyGD79ccALbd+iG5yrURtbi7NYpYCq98xai1dH8ULR+WXNITi+pZ2958AawsK2ROPYOe4hhnpYsnwrdVE7HjFdLh+Pqy+1xDIzqukNe6xVXD0k4cvV08wEeD9ifBNZiPJeS5uZt9tUP5HVKJoGGhKY9ejPDnZIKxu8DBwkf+6AEgXKbcZVrYQs11ChfmrxcIpRPr6KvFG4r3stiXbWj8S7/IzApwUtKaAJ4umwQaO4L6JNoqnxbFesNnfoJZhtC1+I/S8WoY4FI/yiH61ctJs/6ZL2RugDYGGxGEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9lpM2zKOAU7l8BBSVrSt8t1dA5xx082noxD7mRAakk=;
 b=VGwnYlpzx9N7kgU2iXPjmqV9gU6aok1qlzswpz0e2BlPxiyvxpxaXOtyjzmNsvDoeGEbEoN4/9HZPYe2odaPk3n8q8lcaYmvlt224Urn7S7wXAeg2PRvVt+MUK2X3qexAVUfwfMMXETcdSmY6I0goMkvzK0T2hQakvbl3UMUBSHdNMtX5RAMiojoH2bJZ7Y5mOv463QJjLced2/PrwAd4V0l0JbUK4UZBb701Rc/OekEKOT5x5Cyhv1k/aO67XxDDN2JfK9Y+3BGI59e5Tmm0rBSNaNuj+J9eiFIVOYiJvkkwj++LuSRAl8Xe9Q/Lv1V+5qsRQy/CL3b0va7Wdlh7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9lpM2zKOAU7l8BBSVrSt8t1dA5xx082noxD7mRAakk=;
 b=PF9ibTTRhXK7QgrgTh9YXqaGT1/MEH7J10RsB9pmOhtbADnECFrUZtxCyqujqZYkqnxzP5/oxUctU0BNhYyNYXyuCIT07vcm7G5758ZSD+NhwILOT0c+W7D+j7ffwR/39I4+UY/mCxzwTzn7yjZsoqOw3NFxEMGwsgRYzgLixf8=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by TYZPR03MB8784.apcprd03.prod.outlook.com (2603:1096:405:6f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 04:08:52 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::b481:9458:6a7:b356]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::b481:9458:6a7:b356%3]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 04:08:51 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?=
	<Kyrie.Wu@mediatek.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?=
	<Maoguang.Meng@mediatek.com>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 4/6] media: mediatek: encoder: Add support for VCP
 encode process
Thread-Topic: [PATCH v6 4/6] media: mediatek: encoder: Add support for VCP
 encode process
Thread-Index: AQHc0vObti38vdpUOEyeS2xGECpCZLX2KtWAgADdW4A=
Date: Thu, 30 Apr 2026 04:08:51 +0000
Message-ID: <b23942f5007457ddcd1a0b23e7fc5c3101fd05c7.camel@mediatek.com>
References: <20260423073345.27402-1-irui.wang@mediatek.com>
	 <20260423073345.27402-5-irui.wang@mediatek.com>
	 <62415d732ccaed02bf12a8e68e10ac8d58b87fa9.camel@collabora.com>
In-Reply-To: <62415d732ccaed02bf12a8e68e10ac8d58b87fa9.camel@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|TYZPR03MB8784:EE_
x-ms-office365-filtering-correlation-id: 721a77cb-bf3c-4921-4b8a-08dea66e2fef
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 7scy5nTu2FEH3tHRGtfCOhhdVycdThVQqHrLke8DsRFosMTiRDhpcDMslmfJWPMcnpSgpNVWo5Hbq+Qw6PHtnx0LEzCmqEs+6QS+wK2AB8+CI6Tt6+OKs7FOBKJZvUqz/mI8TbV4WxAiar79vuq7vFhNOC5XIFQUzh7OyWpw1/C8Tlg/Z2LTiwRb8zLBhq0hU3fbOQmKFjYLAEpajXR1pUbODjIKrFMIrlRJcRio5CnNgsxsrb/xoTt+qnpi/y8QkW/BZnEuoigrUpUWb0gNd4Vqhm5UzuzUuB6Rh22mcj9ZHZj1XhHquKetH0R0Xui6Hu8c9bWyp63jwDAG81lyoTAvOnBmYovF8nA+N9+Qfa/6wUcKLzhJ67yaJE1w3fOWGIFE03msakJOJoediZh2WPCVG1bCMavWsBj2RQ5RHnhcRn54Qjmc6pLiRb7cfppe4cLwDv3Z9+qOheZQmfcVswFZ2qaIzdaXCWhQi06HAQmhUG8VgYh93mEa6kg4HlVWsOsqoRZtP/zmiqWNzqwdOnTHQlQAQ2xf7cShxtA8d2LiBwhdE8zsgjsd6miju1B9LjRTwLBYy7yIJ3Lrr97BMI97got/DEn+XO7DWMELvIrCC5UJxt1lDjv2HkPufmMetUUZVw77mKDzalzrOS9kuTkr2bkEop9SGTjGzNTA25UU041LMYQwskmHEJp9ERrbtnOpuUXTmckndwaxvuQOSPzU8m/yZm/Ej9Myb6yUHSFaBiqaJeL3WGnFy7Rfw4fBuGK2MK/eW1lt5ocQmdsz3+jXAoa5M4acTMU5Wo1Rtmk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVQ2ek9WSVdmdGpqRTFrQ3h5Zk1pUDFGU0lzYTJTU0djOFJCdEcrTXp3YWZW?=
 =?utf-8?B?TzNja0hoK25YMk9HcEh3eTN4aG0xbXFUdEJUaEFHbS9jS3NLa1lHMGlHZ1J2?=
 =?utf-8?B?RWc2UmE1Q0JYMGVPRXV2ZHkzYWJLUGM5WDNjWitHZGFBSVVEMEFFTUE4US9s?=
 =?utf-8?B?TnIydlBoWDl3dmdNL0orM0lOWnlwc3N5amZlclBYdUFUY2g0cFdsVUZ3UjB0?=
 =?utf-8?B?OG1tSkh2SjZsTGgvYUR4TkY0S2kyYzVsa0N2eVV0U0ZSZVBsc0tabHNQTkpw?=
 =?utf-8?B?anZwZTVTOCt5cTc0V0p4TVh4aFBnbVJ6SXNHcXpFQXkyK0JEQVA2S1VQMHVx?=
 =?utf-8?B?YWQ4MGJ2MllBaHVBRTZBUzlJU1Y2T2VTN3l2R0doL016bWhlZDJvbG4zWkNs?=
 =?utf-8?B?Z25lakhZR203TnJtYVY2aXc1aWUrdTJ3cmExL3I4Mk5uZkdUS1l5YUZCcFBD?=
 =?utf-8?B?ZEZES2l0K0Z5dFh1MDlaT2o1RHRwcGlKSmN5clBvK0o3Q1E0cGN1TmxYbjgw?=
 =?utf-8?B?c2tFN1gwLzVyV2pyYk8yRFJjWUhXRUx5Lzc5anNRQVZmanUwU3pqT2dZNEpy?=
 =?utf-8?B?VGxXTnZKNlRIMDV6QUhCNmFUTXJpZys3bkVzZmo4RU1VSmgxZkNSWlpBMUdy?=
 =?utf-8?B?MjNzaVpQdFdCSGwvbWM3K0FQdHBOTEVkR29JMDRsZVRZVDZMY0Y0c1NndE9P?=
 =?utf-8?B?cXhaOERIVlZOS1lsRTNFR1RHd0RSOHU4eVh6NmJVeGh6blhMUHYwQkRZVm9H?=
 =?utf-8?B?Zk1MOExyMURUVElNa3VobHBKeVZZcGV3cFdTTTQ0SHBMT29sVkdydGFURDJJ?=
 =?utf-8?B?TUhBdldtSE9CWVpWeThlSE1CVmhwNTF5UmVhNXFlbXhZVHJGVkdHUllpcmIx?=
 =?utf-8?B?Z1k4c2dqNWJIb2hDdG5DRVQxb0ZhTUwrMGY3dUdyYnpvWTVIalhXOEtvdlQy?=
 =?utf-8?B?dlowTEpucWxxdlFhZVFyQmdncVFkK0lwNkVkQXJFQm11VkM4c3RIbDRnTVlp?=
 =?utf-8?B?TlRyeEJaUXRPcVhBS1Q2Zlgwd3Z1QnowYmdjWGwwZ3hKTUp1YVpBbVhwMTNX?=
 =?utf-8?B?RVJoMWtSbzVmeGRyQ25RVFgxUFNxNkxhZlFZeDlTV09YMEIyMDJYYWJCZ3ZV?=
 =?utf-8?B?QllCdlBodWQzRTEyUC84QnJrTWNXaGFyVENpYzdweDNFUWdGTS8rV01LS3JC?=
 =?utf-8?B?cUo3MVpWaVRmVCt6Y3k1U09qc09hUS9JaTE1YlpVeTZFekFoYnFMY3ZoaTQ3?=
 =?utf-8?B?OHV5N2pMWldZZ0FTRTArN1gwbFVlVXJ0aTJpZkFiUzVHVlJPcnZZTzlrazQ4?=
 =?utf-8?B?bEhFV2hkMUk2aTBvdXJPSzY3YW5aZmhiOW1RdUIvMFE3WnZwYWE0YzZBVnRh?=
 =?utf-8?B?NWUvQndJdkhGT0oyMks5dnB5ZDVFS1RGZldoc3ZXQTJrRmtSQ2h0SzhlTllx?=
 =?utf-8?B?QzZsaGJpQmRzN21TT1J1a1VLYmVxaG9yWjJWeEZzejh4Wml2Nzl6OWFkMUpT?=
 =?utf-8?B?eGhmajdEQlNKalFhNXoySFRxQlo3SHVqT1cvd0pwc0JjMm5QVFFtZGNPd1Vx?=
 =?utf-8?B?bWkvTTNZMi9GLzUveFJMcUluYjdDcjZaQXVibUxzR2VHSWpMWkJaUnYzeUVq?=
 =?utf-8?B?MzhKckI5NFRPbUk5a0did08vaTkybGtQcmRHZUdhQ0taaC8rLzdVSDh2b2J6?=
 =?utf-8?B?TGJhcXNzWDZLNkpyZ1ZpVms5c3hYMDR2aFBpb2JyRlRtRy9BRkF6dzI1LzFX?=
 =?utf-8?B?RFlrYzdKVnVTLzlUUEoxZWZHZE14YnhJSmU5MXdNbGhuK09CRXg3TVc5cmdW?=
 =?utf-8?B?K0hYU3pmalo5cUdMeVJyekIvamlYRmlSM2c0WlZoK0E4ZXF0LzA4anNSRDRY?=
 =?utf-8?B?WDJmSWRpclpvaHh1bzdGOVFONUlENGdXcWFuSFRYOHN5Q1Zrb0ZpM3QraFBR?=
 =?utf-8?B?eHBKdUREUWIxdnVraktmdVVCS2VQM3owUE1VMTRqeWlyc1B1elNXQ0JCZzZj?=
 =?utf-8?B?Zm9pVnhmbzhsQ3JRRDhkdlJvUy9mVmtuck8rMFNQWkUyWk9wMkplYWorYWc4?=
 =?utf-8?B?TXJSTThLeFhZTFZyWnEzUm5GdHgrZGI5RjBtK1A2WkZOWWhPdEREWEtqb09m?=
 =?utf-8?B?OWd5clpRV01wM1F4eVJuTDVSNXNNWDdha0JCZUE1cmdHQkJmK1pnZGwrSitr?=
 =?utf-8?B?K20rQjN5TWdVT1dTZ3RlYTJSYlRJajVoSEVXakRsZVZDTlFaZ3MwdW9saFk2?=
 =?utf-8?B?eXdBaU05QkxuRXIxemJyVUZaTlIvSU9SbjZpRkRxMTJkMWN3bnUxQVhsUVdC?=
 =?utf-8?B?em8yTzF1RmJqbmU3cVE1YmRiL0taejdIcDlvcmRlMUVTdCtKN1NXUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE25C54C7D2FA0448A35737582C5B63D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QmZbzDHrHpkneNLr2GXljfSn8sTCrpfA47bxNRIsM8OHQkFch4V2Ol3YjDDp3lWZ3kCv/vnoTVpZkCpvjodGUVOxEs2nEFJTCulgsZjDNhhVBQn2+QtL/wp9CLY/Yp3Ue5cFuQJq0BaawD8j5/ecr5OJA7KGtIIaBa+UiSapXVvrMg5qGiw5a/V2gilRGNT5ghEnBv2pNWxD0VWuJXUk8CViog29wnRc6ZNOBHXCfc8rdIRVMHuI+XUqlq/y/HcK/Z6jSpeMCUZdlPo45I32EmZhQVE9Pd/f+e8K5oLmmyJnUZ+fjGaWtSg3rsJtBijeFGAc0m2ls8uU6czWOUhVcg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 721a77cb-bf3c-4921-4b8a-08dea66e2fef
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 04:08:51.3693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mIpx+jXVcT/uZE6K/Pf1ZYouzIUNcFrj0N2wzBJCbURWtpMaUQXxHtwo6zWswpzsM7SVACmcDWmMj0EJHkqZ0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8784
X-MTK: N
X-Rspamd-Queue-Id: BF63049D367
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60039-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,mediatek.com,collabora.com,xs4all.nl,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Irui.Wang@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[8]

RGVhciBOaWNvbGFzLA0KDQpUaGFuayB5b3UgZ3JlYXRseSBmb3IgdGFraW5nIHRoZSB0aW1lIHRv
IGhlbHAgcmV2aWV3IHRoZSBwYXRjaC4NCg0KT24gV2VkLCAyMDI2LTA0LTI5IGF0IDEwOjU2IC0w
NDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3RlOg0KPiBMZSBqZXVkaSAyMyBhdnJpbCAyMDI2IMOg
IDE1OjMzICswODAwLCBJcnVpIFdhbmcgYSDDqWNyaXQgOg0KPiA+IEFkYXB0IHRoZSBlbmNvZGVy
IGRyaXZlciB0byBzdXBwb3J0IFZDUCBmaXJtd2FyZSBpbnRlcmZhY2UuDQo+ID4gDQo+ID4gU2V0
IHRoZSBlbmNvZGVyIGRyaXZlciBmaXJtd2FyZSB0eXBlIHRvICdWQ1AnLg0KPiA+IEFsbG9jYXRl
IFJDIGJ1ZmZlcnMgdXNpbmcgdGhlIFZDUCBkZXZpY2UuDQo+ID4gU2VuZCB0aGUgc2hhcmVkIG1l
bW9yeSBhZGRyZXNzIHRvIFZDUCBhbmQgbWFwIHRoZSBlbmNvZGVyIFZTSQ0KPiA+IGFkZHJlc3MN
Cj4gPiB0byB0aGUgQ1BVIGFkZHJlc3Mgc3BhY2UgdXNpbmcgdGhlIFZDUCBzaGFyZWQgbWVtb3J5
IGFkZHJlc3MuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSXJ1aSBXYW5nIDxpcnVpLndhbmdA
bWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vbWVkaWF0ZWsvdmNvZGVjL2NvbW1vbi9t
dGtfdmNvZGVjX2Z3LmMgICAgfCAgNiArKysrKw0KPiA+ICAuLi4vbWVkaWF0ZWsvdmNvZGVjL2Nv
bW1vbi9tdGtfdmNvZGVjX2Z3LmggICAgfCAgMSArDQo+ID4gIC4uLi92Y29kZWMvY29tbW9uL210
a192Y29kZWNfZndfcHJpdi5oICAgICAgICB8ICAxICsNCj4gPiAgLi4uL3Zjb2RlYy9jb21tb24v
bXRrX3Zjb2RlY19md192Y3AuYyAgICAgICAgIHwgIDYgKysrKysNCj4gPiAgLi4uL3Zjb2RlYy9l
bmNvZGVyL210a192Y29kZWNfZW5jX2Rydi5jICAgICAgIHwgIDMgKysrDQo+ID4gIC4uLi92Y29k
ZWMvZW5jb2Rlci92ZW5jL3ZlbmNfY29tbW9uX2lmLmMgICAgICB8IDIzICsrKysrKysrKysrKysr
LQ0KPiA+IC0tLS0NCj4gPiAgLi4uL21lZGlhdGVrL3Zjb2RlYy9lbmNvZGVyL3ZlbmNfdnB1X2lm
LmMgICAgIHwgMTQgKysrKysrKysrKy0NCj4gPiAgNyBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2NvbW1vbi9tdGtfdmNvZGVjX2Z3LmMN
Cj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2NvbW1vbi9tdGtf
dmNvZGVjX2Z3LmMNCj4gPiBpbmRleCAwMzgxYWNjZWRhMjUuLjdhNTA0ZjA5M2JkOCAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9jb21tb24v
bXRrX3Zjb2RlY19mdy5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRl
ay92Y29kZWMvY29tbW9uL210a192Y29kZWNfZncuYw0KPiA+IEBAIC0xMDUsMyArMTA1LDkgQEAg
aW50IG10a192Y29kZWNfZndfZ2V0X3R5cGUoc3RydWN0IG10a192Y29kZWNfZncNCj4gPiAqZncp
DQo+ID4gIAlyZXR1cm4gZnctPnR5cGU7DQo+ID4gIH0NCj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwo
bXRrX3Zjb2RlY19md19nZXRfdHlwZSk7DQo+ID4gKw0KPiA+ICtzdHJ1Y3QgZGV2aWNlICptdGtf
dmNvZGVjX2Z3X2dldF9kZXYoc3RydWN0IG10a192Y29kZWNfZncgKmZ3KQ0KPiA+ICt7DQo+ID4g
KwlyZXR1cm4gZnctPm9wcy0+Z2V0X2Z3X2Rldihmdyk7DQo+ID4gK30NCj4gPiArRVhQT1JUX1NZ
TUJPTF9HUEwobXRrX3Zjb2RlY19md19nZXRfZGV2KTsNCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9jb21tb24vbXRrX3Zjb2RlY19m
dy5oDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9jb21tb24v
bXRrX3Zjb2RlY19mdy5oDQo+ID4gaW5kZXggZTczMDRhN2RkM2UwLi41NmMyNmI5MTY1MWUgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvY29t
bW9uL210a192Y29kZWNfZncuaA0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL2NvbW1vbi9tdGtfdmNvZGVjX2Z3LmgNCj4gPiBAQCAtNDMsNSArNDMsNiBA
QCBpbnQgbXRrX3Zjb2RlY19md19pcGlfc2VuZChzdHJ1Y3QgbXRrX3Zjb2RlY19mdw0KPiA+ICpm
dywgaW50IGlkLA0KPiA+ICBpbnQgbXRrX3Zjb2RlY19md19nZXRfdHlwZShzdHJ1Y3QgbXRrX3Zj
b2RlY19mdyAqZncpOw0KPiA+ICBpbnQgbXRrX3Zjb2RlY19md19nZXRfaXBpKGVudW0gbXRrX3Zj
b2RlY19md190eXBlIHR5cGUsIGludA0KPiA+IGh3X2lkKTsNCj4gPiAgaW50IG10a192Y29kZWNf
ZndfZ2V0X3ZlbmNfaXBpKGVudW0gbXRrX3Zjb2RlY19md190eXBlIHR5cGUpOw0KPiA+ICtzdHJ1
Y3QgZGV2aWNlICptdGtfdmNvZGVjX2Z3X2dldF9kZXYoc3RydWN0IG10a192Y29kZWNfZncgKmZ3
KTsNCj4gPiAgDQo+ID4gICNlbmRpZiAvKiBfTVRLX1ZDT0RFQ19GV19IXyAqLw0KPiA+IGRpZmYg
LS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2NvbW1v
bi9tdGtfdmNvZGVjX2Z3X3ByaXYuDQo+ID4gaA0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tZWRpYXRlay92Y29kZWMvY29tbW9uL210a192Y29kZWNfZndfcHJpdi4NCj4gPiBoDQo+ID4g
aW5kZXggMGEyYTliMDEwMjQ0Li43MTBjODNjODcxZjQgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9jb21tb24vbXRrX3Zjb2RlY19m
d19wcml2Lg0KPiA+IGgNCj4gPiArKysNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL2NvbW1vbi9tdGtfdmNvZGVjX2Z3X3ByaXYuDQo+ID4gaA0KPiA+IEBAIC0y
OSw2ICsyOSw3IEBAIHN0cnVjdCBtdGtfdmNvZGVjX2Z3X29wcyB7DQo+ID4gIAlpbnQgKCppcGlf
c2VuZCkoc3RydWN0IG10a192Y29kZWNfZncgKmZ3LCBpbnQgaWQsIHZvaWQgKmJ1ZiwNCj4gPiAg
CQkJdW5zaWduZWQgaW50IGxlbiwgdW5zaWduZWQgaW50IHdhaXQpOw0KPiA+ICAJdm9pZCAoKnJl
bGVhc2UpKHN0cnVjdCBtdGtfdmNvZGVjX2Z3ICpmdyk7DQo+ID4gKwlzdHJ1Y3QgZGV2aWNlICoo
KmdldF9md19kZXYpKHN0cnVjdCBtdGtfdmNvZGVjX2Z3ICpmdyk7DQo+ID4gIH07DQo+ID4gIA0K
PiA+ICAjaWYgSVNfRU5BQkxFRChDT05GSUdfVklERU9fTUVESUFURUtfVkNPREVDX1ZQVSkNCj4g
PiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2Rl
Yy9jb21tb24vbXRrX3Zjb2RlY19md192Y3AuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tZWRpYXRlay92Y29kZWMvY29tbW9uL210a192Y29kZWNfZndfdmNwLmMNCj4gPiBpbmRleCA2
YjY5Y2U0NGQ0YmIuLjI4NTlmZTc4ZjY3ZCAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2NvbW1vbi9tdGtfdmNvZGVjX2Z3X3ZjcC5j
DQo+ID4gKysrDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9j
b21tb24vbXRrX3Zjb2RlY19md192Y3AuYw0KPiA+IEBAIC01MDAsNiArNTAwLDExIEBAIHN0YXRp
YyB2b2lkIG10a192Y29kZWNfdmNwX3JlbGVhc2Uoc3RydWN0DQo+ID4gbXRrX3Zjb2RlY19mdyAq
ZncpDQo+ID4gIA0KPiA+ICB9DQo+ID4gIA0KPiA+ICtzdGF0aWMgc3RydWN0IGRldmljZSAqbXRr
X3Zjb2RlY192Y3BfZ2V0X2Z3X2RldihzdHJ1Y3QNCj4gPiBtdGtfdmNvZGVjX2Z3ICpmdykNCj4g
PiArew0KPiA+ICsJcmV0dXJuIGZ3LT52Y3AtPnZjcF9kZXZpY2UtPmRldjsNCj4gPiArfQ0KPiA+
ICsNCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2Z3X29wcyBtdGtfdmNvZGVj
X3ZjcF9tc2cgPSB7DQo+ID4gIAkubG9hZF9maXJtd2FyZSA9IG10a192Y29kZWNfdmNwX2xvYWRf
ZmlybXdhcmUsDQo+ID4gIAkuZ2V0X3ZkZWNfY2FwYSA9IG10a192Y29kZWNfdmNwX2dldF92ZGVj
X2NhcGEsDQo+ID4gQEAgLTUwOCw2ICs1MTMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a192
Y29kZWNfZndfb3BzDQo+ID4gbXRrX3Zjb2RlY192Y3BfbXNnID0gew0KPiA+ICAJLmlwaV9yZWdp
c3RlciA9IG10a192Y29kZWNfdmNwX3NldF9pcGlfcmVnaXN0ZXIsDQo+ID4gIAkuaXBpX3NlbmQg
PSBtdGtfdmNvZGVjX3ZjcF9pcGlfc2VuZCwNCj4gPiAgCS5yZWxlYXNlID0gbXRrX3Zjb2RlY192
Y3BfcmVsZWFzZSwNCj4gPiArCS5nZXRfZndfZGV2ID0gbXRrX3Zjb2RlY192Y3BfZ2V0X2Z3X2Rl
diwNCj4gPiAgfTsNCj4gPiAgDQo+ID4gIHN0cnVjdCBtdGtfdmNvZGVjX2Z3ICptdGtfdmNvZGVj
X2Z3X3ZjcF9pbml0KHZvaWQgKnByaXYsIGVudW0NCj4gPiBtdGtfdmNvZGVjX2Z3X3VzZSBmd191
c2UpDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRl
ay92Y29kZWMvZW5jb2Rlci9tdGtfdmNvZGVjX2VuY19kcnYNCj4gPiAuYw0KPiA+IGIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZW5jb2Rlci9tdGtfdmNvZGVjX2VuY19k
cnYNCj4gPiAuYw0KPiA+IGluZGV4IDRlNDU0MWIyZmM4ZS4uMmY2ZWUwY2QxNWUzIDEwMDY0NA0K
PiA+IC0tLQ0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZW5j
b2Rlci9tdGtfdmNvZGVjX2VuY19kcnYNCj4gPiAuYw0KPiA+ICsrKw0KPiA+IGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZW5jb2Rlci9tdGtfdmNvZGVjX2VuY19kcnYN
Cj4gPiAuYw0KPiA+IEBAIC0yNjIsNiArMjYyLDkgQEAgc3RhdGljIGludCBtdGtfdmNvZGVjX3By
b2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgCX0gZWxzZSBpZiAo
IW9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLA0KPiA+ICJtZWRpYXRlayxz
Y3AiLA0KPiA+ICAJCQkJCSAmcnByb2NfcGhhbmRsZSkpIHsNCj4gPiAgCQlmd190eXBlID0gU0NQ
Ow0KPiA+ICsJfSBlbHNlIGlmICghb2ZfcHJvcGVydHlfcmVhZF91MzIocGRldi0+ZGV2Lm9mX25v
ZGUsDQo+ID4gIm1lZGlhdGVrLHZjcCIsDQo+ID4gKwkJCQkJICZycHJvY19waGFuZGxlKSkgew0K
PiA+ICsJCWZ3X3R5cGUgPSBWQ1A7DQo+IA0KPiBTaW1pbGFyIGNvbW1lbnQgb24gdGhlIHBhdGNo
c2V0IHlvdSBkZXBlbmQgb24sIGl0cyB0aGlyZCBmaXJtd2FyZQ0KPiB0eXBlLCBhbmQgdGltZQ0K
PiB0byBjbGVhbnVwLiBUaGUgb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgc2hvdWxkIGJlIHN1
ZmZpY2llbnQgZm9yDQo+IHRoaXMgc2ltcGxlDQo+IGNhc2UsIHRoZXJlIGlzIG5vdCByZWFzb24g
Zm9yIGN1c3RvbSBEVCBwYXJzaW5nIGhlcmUuIFBMYWNlIHRoZQ0KPiBmd190eXBlIGluIHRoZQ0K
PiBwZGF0YSwgYW5kIG1vdmUgb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgY2FsbCBlYXJsaWVy
Lg0KPiANCj4gUGxlYXNlIGFwcGx5IHRoZSBzYW1lIGxvZ2ljIGZvciB0aGUgZW50aXJlIHBhdGNo
c2V0LiBFdmVyeSBiaXQgb2YNCj4gaW5mb3JtYXRpb24NCj4gdGhhdCBpcyBwdXJlbHkgc3RhdGlj
IHRvIHlvdXIgZGV2aWNlIGlzIGJldHRlciBwbGFjZWQgaW4gdGhlIHBkYXRhDQo+IHRoZW4gdGhy
b3VnaA0KPiBhZGRpdGlvbiBvZiBpZi9lbHNlIGNvbmRpdGlvbnMgYWxsIG92ZXIgdGhlIHBsYWNl
LiBUaGUgcGRhdGEgY2FuIGFsc28NCj4gaGF2ZSBvcHMNCj4gaW4gaXQsIGxldHRpbmcgZWFzaWx5
IGZpcm13YXJlIHNwZWNpZmljIGNvZGUgd2l0aG91dCBoYXZpbmcgdG8gZG8NCj4gaWYvZWxzZQ0K
PiBldmVyeXdoZXJlLg0KPiANCj4gTmljb2xhcw0KDQpJIHdpbGwgY2xlYW4gdXAgdGhpcyBpZi9l
bHNlIGluIG5leHQgcGF0Y2gsIGFuZCB3aXRoIHRoZSBsb2dpYywgSSB3aWxsDQpyZXZpZXcgYW5k
IG1vZGlmeSB0aGUgZW50aXJlIHBhdGNoIHNldCBpZiBuZWVkZWQuDQoNClRoYW5rcw0KQmVzdCBS
ZWdhcmRzDQoNCj4gDQo+ID4gIAl9IGVsc2Ugew0KPiA+ICAJCWRldl9lcnIoJnBkZXYtPmRldiwg
IltNVEsgVkNPREVDXSBDb3VsZCBub3QgZ2V0IHZlbmMNCj4gPiBJUEkgZGV2aWNlIik7DQo+ID4g
IAkJcmV0dXJuIC1FTk9ERVY7DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZW5jb2Rlci92ZW5jL3ZlbmNfY29tbW9uX2kNCj4gPiBm
LmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2VuY29kZXIv
dmVuYy92ZW5jX2NvbW1vbl9pDQo+ID4gZi5jDQo+ID4gaW5kZXggMDUwYjgyN2YwZmQwLi5kOTgx
MTU1YWViOGMgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL3Zjb2RlYy9lbmNvZGVyL3ZlbmMvdmVuY19jb21tb25faQ0KPiA+IGYuYw0KPiA+ICsr
Kw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZW5jb2Rlci92
ZW5jL3ZlbmNfY29tbW9uX2kNCj4gPiBmLmMNCj4gPiBAQCAtNDgwLDggKzQ4MCwxMyBAQCBzdGF0
aWMgdm9pZCB2ZW5jX2ZyZWVfcmNfYnVmKHN0cnVjdCB2ZW5jX2luc3QNCj4gPiAqaW5zdCwNCj4g
PiAgew0KPiA+ICAJaW50IGk7DQo+ID4gIAlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+ID4gKwlzdHJ1
Y3QgbXRrX3Zjb2RlY19mdyAqZncgPSBpbnN0LT5jdHgtPmRldi0+ZndfaGFuZGxlcjsNCj4gPiAr
DQo+ID4gKwlpZiAobXRrX3Zjb2RlY19md19nZXRfdHlwZShmdykgPT0gVkNQKQ0KPiA+ICsJCWRl
diA9IG10a192Y29kZWNfZndfZ2V0X2Rldihmdyk7DQo+ID4gKwllbHNlDQo+ID4gKwkJZGV2ID0g
Jmluc3QtPmN0eC0+ZGV2LT5wbGF0X2Rldi0+ZGV2Ow0KPiA+ICANCj4gPiAtCWRldiA9ICZpbnN0
LT5jdHgtPmRldi0+cGxhdF9kZXYtPmRldjsNCj4gPiAgCW10a192ZW5jX21lbV9mcmVlKGluc3Qs
IGRldiwgJmJ1ZnMtPnJjX2NvZGUpOw0KPiA+ICANCj4gPiAgCWZvciAoaSA9IDA7IGkgPCBjb3Jl
X251bTsgaSsrKQ0KPiA+IEBAIC01MzAsMTIgKzUzNSwxOCBAQCBzdGF0aWMgaW50IHZlbmNfYWxs
b2NfcmNfYnVmKHN0cnVjdCB2ZW5jX2luc3QNCj4gPiAqaW5zdCwNCj4gPiAgCXN0cnVjdCBkZXZp
Y2UgKmRldjsNCj4gPiAgCXZvaWQgKnRtcF92YTsNCj4gPiAgDQo+ID4gLQlkZXYgPSAmaW5zdC0+
Y3R4LT5kZXYtPnBsYXRfZGV2LT5kZXY7DQo+ID4gLQlpZiAobXRrX3ZlbmNfbWVtX2FsbG9jKGlu
c3QsIGRldiwgJmJ1ZnMtPnJjX2NvZGUpKQ0KPiA+IC0JCXJldHVybiAtRU5PTUVNOw0KPiA+ICsJ
aWYgKG10a192Y29kZWNfZndfZ2V0X3R5cGUoZncpID09IFZDUCkgew0KPiA+ICsJCWRldiA9IG10
a192Y29kZWNfZndfZ2V0X2Rldihmdyk7DQo+ID4gKwkJaWYgKG10a192ZW5jX21lbV9hbGxvYyhp
bnN0LCBkZXYsICZidWZzLT5yY19jb2RlKSkNCj4gPiArCQkJcmV0dXJuIC1FTk9NRU07DQo+ID4g
Kwl9IGVsc2Ugew0KPiA+ICsJCWRldiA9ICZpbnN0LT5jdHgtPmRldi0+cGxhdF9kZXYtPmRldjsN
Cj4gPiArCQlpZiAobXRrX3ZlbmNfbWVtX2FsbG9jKGluc3QsIGRldiwgJmJ1ZnMtPnJjX2NvZGUp
KQ0KPiA+ICsJCQlyZXR1cm4gLUVOT01FTTsNCj4gPiAgDQo+ID4gLQl0bXBfdmEgPSBtdGtfdmNv
ZGVjX2Z3X21hcF9kbV9hZGRyKGZ3LCBidWZzLT5yY19jb2RlLnBhKTsNCj4gPiAtCW1lbWNweShi
dWZzLT5yY19jb2RlLnZhLCB0bXBfdmEsIGJ1ZnMtPnJjX2NvZGUuc2l6ZSk7DQo+ID4gKwkJdG1w
X3ZhID0gbXRrX3Zjb2RlY19md19tYXBfZG1fYWRkcihmdywgYnVmcy0NCj4gPiA+cmNfY29kZS5w
YSk7DQo+ID4gKwkJbWVtY3B5KGJ1ZnMtPnJjX2NvZGUudmEsIHRtcF92YSwgYnVmcy0+cmNfY29k
ZS5zaXplKTsNCj4gPiArCX0NCj4gPiAgDQo+ID4gIAlmb3IgKGkgPSAwOyBpIDwgY29yZV9udW07
IGkrKykgew0KPiA+ICAJCWlmIChtdGtfdmVuY19tZW1fYWxsb2MoaW5zdCwgZGV2LCAmYnVmcy0+
cmNfaW5mb1tpXSkpDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tZWRpYXRlay92Y29kZWMvZW5jb2Rlci92ZW5jX3ZwdV9pZi5jDQo+ID4gYi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9lbmNvZGVyL3ZlbmNfdnB1X2lmLmMNCj4gPiBp
bmRleCA3NzcyYjg0NDJlYmMuLjBmNDY5M2UwNGE5ZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9lbmNvZGVyL3ZlbmNfdnB1X2lmLmMNCj4g
PiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9lbmNvZGVyL3Zl
bmNfdnB1X2lmLmMNCj4gPiBAQCAtOCwxMyArOCwyMyBAQA0KPiA+ICAjaW5jbHVkZSAidmVuY19p
cGlfbXNnLmgiDQo+ID4gICNpbmNsdWRlICJ2ZW5jX3ZwdV9pZi5oIg0KPiA+ICANCj4gPiArI2Rl
ZmluZSBWU0lfT0ZGU0VUX01BU0sgMHgwRkZGRkZGRg0KPiA+ICsNCj4gPiAgc3RhdGljIHZvaWQg
aGFuZGxlX2VuY19pbml0X21zZyhzdHJ1Y3QgdmVuY192cHVfaW5zdCAqdnB1LCBjb25zdA0KPiA+
IHZvaWQgKmRhdGEpDQo+ID4gIHsNCj4gPiAgCWNvbnN0IHN0cnVjdCB2ZW5jX3ZwdV9pcGlfbXNn
X2luaXRfY29tbSAqbXNnID0gZGF0YTsNCj4gPiAgCXN0cnVjdCBtdGtfdmNvZGVjX2Z3ICpmdyA9
IHZwdS0+Y3R4LT5kZXYtPmZ3X2hhbmRsZXI7DQo+ID4gKwl1NjQgcGFfc3RhcnQsIHZzaV9vZmZz
ZXQ7DQo+ID4gIA0KPiA+ICAJdnB1LT5pbnN0X2FkZHIgPSBtc2ctPmluaXRfYWNrLnZwdV9pbnN0
X2FkZHI7DQo+ID4gLQl2cHUtPnZzaSA9IG10a192Y29kZWNfZndfbWFwX2RtX2FkZHIoZncsIHZw
dS0+aW5zdF9hZGRyKTsNCj4gPiArDQo+ID4gKwlpZiAobXRrX3Zjb2RlY19md19nZXRfdHlwZShm
dykgPT0gVkNQKSB7DQo+ID4gKwkJcGFfc3RhcnQgPSAodTY0KWZ3LT52Y3AtPmlvdmFfYWRkcjsN
Cj4gPiArCQl2c2lfb2Zmc2V0ID0gKG1zZy0+dnB1X3ZzaV9hZGRyICYgVlNJX09GRlNFVF9NQVNL
KSAtDQo+ID4gKHBhX3N0YXJ0ICYgVlNJX09GRlNFVF9NQVNLKTsNCj4gPiArCQl2cHUtPnZzaSA9
IG10a192Y29kZWNfZndfbWFwX2RtX2FkZHIoZncsIEVOQ09ERVJfTUVNKSArDQo+ID4gdnNpX29m
ZnNldDsNCj4gPiArCX0gZWxzZSB7DQo+ID4gKwkJdnB1LT52c2kgPSBtdGtfdmNvZGVjX2Z3X21h
cF9kbV9hZGRyKGZ3LCBtc2ctDQo+ID4gPnZwdV92c2lfYWRkcik7DQo+ID4gKwl9DQo+ID4gIA0K
PiA+ICAJLyogRmlybXdhcmUgdmVyc2lvbiBmaWVsZCB2YWx1ZSBpcyB1bnNwZWNpZmllZCBvbiBN
VDgxNzMuICovDQo+ID4gIAlpZiAobXRrX3Zjb2RlY19md19nZXRfdHlwZShmdykgPT0gVlBVKQ0K
PiA+IEBAIC0xNTUsNiArMTY1LDggQEAgaW50IHZwdV9lbmNfaW5pdChzdHJ1Y3QgdmVuY192cHVf
aW5zdCAqdnB1KQ0KPiA+ICAJb3V0LmJhc2UudmVuY19pbnN0ID0gKHVuc2lnbmVkIGxvbmcpdnB1
Ow0KPiA+ICAJaWYgKE1US19FTkNfRFJWX0lTX0NPTU0odnB1LT5jdHgpKSB7DQo+ID4gIAkJb3V0
LmNvZGVjX3R5cGUgPSB2cHUtPmN0eC0+cV9kYXRhW01US19RX0RBVEFfRFNUXS5mbXQtDQo+ID4g
PmZvdXJjYzsNCj4gPiArCQlpZiAobXRrX3Zjb2RlY19md19nZXRfdHlwZSh2cHUtPmN0eC0+ZGV2
LT5md19oYW5kbGVyKQ0KPiA+ID09IFZDUCkNCj4gPiArCQkJb3V0LnNoYXJlZF9pb3ZhID0gdnB1
LT5jdHgtPmRldi0+ZndfaGFuZGxlci0NCj4gPiA+dmNwLT5pb3ZhX2FkZHI7DQo+ID4gIAkJbXNn
X3NpemUgPSBzaXplb2Yoc3RydWN0IHZlbmNfYXBfaXBpX21zZ19pbml0X2NvbW0pOw0KPiA+ICAJ
fSBlbHNlIHsNCj4gPiAgCQltc2dfc2l6ZSA9IHNpemVvZihzdHJ1Y3QgdmVuY19hcF9pcGlfbXNn
X2luaXQpOw0K

