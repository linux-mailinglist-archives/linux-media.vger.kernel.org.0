Return-Path: <linux-media+bounces-21809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 794A89D5C66
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEB5EB2479E
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0B618BC1E;
	Fri, 22 Nov 2024 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qhUJQmEZ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="giFM9/Rh"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0749C17D340;
	Fri, 22 Nov 2024 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732268965; cv=fail; b=BIwhBauqekHHop4gimS/BRE4K95bHoreMN2WXQtqxp/v6X8VBAltVnkWApzYCgnwASl/t9u0hZ+w8p67aWxSfpPfpSOqN0Z+zNzWnQbS+Po11AYhtTmakokCvgkvhHRDy0YAIWCFoz70x8gce7HIrZ7ykLcyzgRlLl0L/cCVcv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732268965; c=relaxed/simple;
	bh=HjgiwAI6VmBStgJ8DmzPpNmkhSG/DssDHlT5Pub9kAc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eO2i3WENG3dX5xBZHrCcJ8k1ZQl7bdEg6YMLVHb0fU/alAJmgtGPDdFD6OLPr5nZpd1ZH/iVi2dUvrIPdaZ1ZFcOf3DoJ7fwUy3JvgSfcxrk7ZvzzD3sZiG4+TkccZcvdv1SMStE1eh5OhyLbMkdi3SZEcllyN4QIP015iFgVMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qhUJQmEZ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=giFM9/Rh; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0911c998a8b711efbd192953cf12861f-20241122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=HjgiwAI6VmBStgJ8DmzPpNmkhSG/DssDHlT5Pub9kAc=;
	b=qhUJQmEZf1RimMiIk9sDABIiVQjYT+mueg+4Yl+QttWZQYimEv+JyN6FvRNMqZwuJmqCEaqvJ4OIYxtG32/ZTCv1haKqTm44vcO7AhpEHTGWI+rKOvCwHI4Oep2OXHsJtBtkAv18GZLN1wXPfgHfgOd5bKI1i4SjQys8SEQGoLs=;
X-CID-CACHE: Type:Local,Time:202411221719+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:a3b6d807-acd4-46c7-8def-8e1d4744e4f7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:3b5d3bb9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0911c998a8b711efbd192953cf12861f-20241122
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1623461965; Fri, 22 Nov 2024 17:49:15 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Nov 2024 17:49:14 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Nov 2024 17:49:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgFP7P5VH8HiotT8L7YvqHcjtAgDsRdb/qpm0g81szpud8fA5TLr+0l2MmLxxfYSCFNLaazAYEM7UAifHx8ug331TrR440PT9E1h5SOojx6fJEc/ZsWZddELznolHgnKs3IeqhUq8axSAczcm7S+DKtTZEtzaYH+ckwOkkhwNwTvEyOjXfqry9avOPoaEUlthMv/4U6mHfgcu1i64vrAUpQiziLG6V6QpgWnjklwkzpZSGJa8hJXOXsbcnU6tZKpOwS5tVkZDs9Ge9bMGc/Ur3dvRLXTnXJF95aCvlif+Qyc50QYlttgnMNoy31oeR7x8MVyo47TekFJTGm79H+w9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjgiwAI6VmBStgJ8DmzPpNmkhSG/DssDHlT5Pub9kAc=;
 b=eIp8Sfra0qh244PSmCEn1l404lJIJXBVTlQTfy+IjXCdSa7arQ2KcNGPXgew9Qo4uMvHZvyuU1qeySDNMaJRZU+kZiv9zYP91Lj+e236k/gof3O5O2BnmsCWMnv9P8Rsk9tL0U+FmwieRw/syuMZ1gWjYDjKh4ZDm1YupDZm0U7GM3xPMviT/+WtJiktA/WU3mMdHYru9rkA0MSuvFJh36Whorw+dcl3Ur+N2FtFZYinDJAbYbTLus7KSa4jhFRJ7x+mMfqQz6dySZH4ljdCvRhOOH5bnuAq/SetQmEgB8BbLdSy6A20pSQqb8mOWM8hK3d1JmJT/A+Nx8Jt7ROQ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjgiwAI6VmBStgJ8DmzPpNmkhSG/DssDHlT5Pub9kAc=;
 b=giFM9/Rhjdf1mHuhMNo282NZWivai8FNVKaIVOJdtzp0fLi9i7U38D5OlbqbZ5zCTJ72GV0XAQ1GAQj2il7FPSH8mv47X664l1W83MFx93+3MjJ7E25Wju9HbO+93haLnB12uvRuqObDGWmGeb94/z7axVs4XfJLfEhrEn8XOvA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8212.apcprd03.prod.outlook.com (2603:1096:990:44::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Fri, 22 Nov
 2024 09:49:09 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 09:49:09 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: Julien Stephan <jstephan@baylibre.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLC/MCAgAAMVYCAAAaQAA==
Date: Fri, 22 Nov 2024 09:49:09 +0000
Message-ID: <bd73658d8ceac0ce236f08f31065350123056724.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
	 <767085562b5efb43f248e8528bb154a6c30d3999.camel@mediatek.com>
	 <CAEHHSvaePj2MUg+zgmkpZF4HTj_F9ED0RxuzQr2oOAUJgOieng@mail.gmail.com>
In-Reply-To: <CAEHHSvaePj2MUg+zgmkpZF4HTj_F9ED0RxuzQr2oOAUJgOieng@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8212:EE_
x-ms-office365-filtering-correlation-id: d33a9836-8d32-47ff-44fe-08dd0adae95e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MGVSQlpzaFhWS0VPQ2oydEprWUZiL1FGV2lWOG4waFQzREhwSHA2TUc5eXdm?=
 =?utf-8?B?dGxmOTVUWWJXUnk4aXI0VlZRbnAyRzlrOHloTG1YZHN3OHFRaW9EZWo5TWNs?=
 =?utf-8?B?MkdwcGxsaXp6dnB5aTdJVWx6dk4zM3ZVQnJHdUNnYlFtdDJPTzdzUFdUaGNm?=
 =?utf-8?B?YTFBMGRiNWxzTVZyZ212RWI1VTBob1NDbmNYT0JIZ3lLYnhwTWdCbTIrUUg2?=
 =?utf-8?B?Ykl4MWhtQ3NXUlJPam9uRURRb0ZsaHlqZC9qMjJqTVFKU0V3SE5uM0NoZjFH?=
 =?utf-8?B?OG1PY2VyZmMvU2NENnRXRjhRam9MSDZEb2NSVHcxR3NMS2RwWnEra3N6MzZN?=
 =?utf-8?B?b2lsVTdxemJwekJjaXFBclQrK29ndWUzbXlIbjVOWCtEUG53bTVtQks2N3BR?=
 =?utf-8?B?V29NSUY1NzhMYXJaNFpCUng2bkIrcHU1V3hyMlQxTmVOY0ZoZ09oSkJXeUpi?=
 =?utf-8?B?Yktybnh0Sy9veHpPUStIakttUnUyM2RsK2h6cFZ3V2xMc0FlUUUwZUp2VFZD?=
 =?utf-8?B?WXROQU80YXpxL2ZIaGlQckZPMDJMT2hLNVEwMkUxWTd1dWlVYkthcFNFdWlM?=
 =?utf-8?B?ekF5ZHpBSjFOQTIzSDdMYjNIUVlZRW0xRDRwNmV1RUtmTEFic2EweFowMGtp?=
 =?utf-8?B?T0tkZnhUbldlR1B2dm5sT3JQbmp3ZUVXb1V4eVA5RVVrSU9LcGRtOXN1ckp0?=
 =?utf-8?B?UGxIc1J2VUIwNGQ4K3hDRUFPekIxOVUzU0hzZVRoWXUrVzhEMC92Y0VPeVNp?=
 =?utf-8?B?TFM4ZGs0YmhJNTkxTExjbXJKS2JkKzc3elhVRjFVZXk0Tjc2QXVObXltcHZW?=
 =?utf-8?B?dE02c1VJekVBMGV3elo5MWZnQS9oTjAwZDJEQ1ZyT3pRMUdQclc5KzgzS1Ux?=
 =?utf-8?B?TW1QR216Szg4ZG5ZbmVLZUlibHJNRnlFdWZaajR6Y3JBVkJJdjdKM0hUblN1?=
 =?utf-8?B?ZnFRdXRKTy9sMWJDM0F5dTJ6VWh2MVRkRWF0V1JZWmJmTzNMR09PRTdmeDBI?=
 =?utf-8?B?d2toWGZHZlBmRm0vYU1HblU2RHhoZ21tUURsNEZ2cjg3YWZSTDlpWjdZTThK?=
 =?utf-8?B?TlBtTUdzL1VWSldRVXpUb3d0SU02dnJNbm5pS3JRcnB6NmFRc2NwU2ZKSXlZ?=
 =?utf-8?B?QzlSQ3lMSWZaTkFKWkM3VGMrbUtaTFVQMjV6enFsaGhBUUhFcm03czBONGtr?=
 =?utf-8?B?RlNPVjE5YWN2dG9uWDFpOS9tYjBQR2d1ZWdMVzhBVm1HTytCVnRIVGlYb1hx?=
 =?utf-8?B?NFA0TzltTWY5ZkNFaHpPUVlNT3E2MmRnemxmNlg3c01qbzV3WTZkRktUMkdm?=
 =?utf-8?B?eGxmd01UaXluNTdEVGFIdG9qTlp1WWlLZW1ReGduUDJWOElnOVNRZldIZjVU?=
 =?utf-8?B?ZHg0TGlCa0hIRFowWXNTTkx6OTI5dFBJMitlUEhSS1FOTHRoN1R1UWwzVGJt?=
 =?utf-8?B?blpSYmVKbW5VNUV4a1JGakpkcGdBaEhRNkFUaVZnNEsvbUcveFBUaFVkNXBt?=
 =?utf-8?B?YUM3Y0JwNSttd1ZCZnhOZlZTTmZBc2NreHJIcU1nd1JnSzE0REpuZXNGczdr?=
 =?utf-8?B?SFlTMGh1K29qbFdyekJtcjdyRWo0bEtDdExIZnI5MkR0ZEJtOTcrTVpJemZ5?=
 =?utf-8?B?YlNldzVPOU5vZ2xaRStKdXZXWGdZeFhDRThkeGVTVDBBMzlXQm8zN3h2ZHBq?=
 =?utf-8?B?TThxTFFwdnRPdm9PNkdEZ3NpelRYdjc5elZLQU00R05nejM0cmhTa0d3TWRk?=
 =?utf-8?B?T05vem9WL2FlSk5xQlpuM2gzdTBZNmtOMmVtVUNRZ0dCUzhrbEIyWXNFcWVn?=
 =?utf-8?B?NjZIcGVzU3REQnpQbUJySE42QXY4dzAzRzF3aTNuTHpWbnhKcTZqcnpnc0pr?=
 =?utf-8?B?YjAyblFpNlU0OXFZclN1YmhlQXBsOGt0eFYwMTdQMjNtQ2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGR2UjJUbVo0cHNOdnRlQ0RCR0tnQjRNaGswaEMzbytidXcxMzBKZVMxc3Ux?=
 =?utf-8?B?OW1UWXBlZzZzTHRSbkpzSG11MWhMTnY0TVE1UVh6Uy8xMlZDMmpjSnErKzEv?=
 =?utf-8?B?ZWJYc3ZqR0QweERPcHNuckZnS0ZwNTd5YzVtSExlS2RCOXBoWlVHUmRhR2M0?=
 =?utf-8?B?OFFVYlRpOGZVemZwK0poYVF0a05hTEtSdXBGYVR0OXNENWpZQkNmN1Jqd3Jo?=
 =?utf-8?B?Z2t3VmxnM2gwcmlFbWw1R0lTbHl1aGlpMmlWNmtBSVdDSDlXTTlyQVRsUGNU?=
 =?utf-8?B?MUIxVXlxa0JSamJmWjhEMFVnOTZ0MisyTW9sQzV6d2krNDhUeERSODUwMitM?=
 =?utf-8?B?S0QyTmJGaVFLVUVkeGREcWw1cmJzRm9lQ3J1TVEyVGFWbDRxWTQyeFJwTk4w?=
 =?utf-8?B?OEIwdGplRThMOE9adXA0WGZ0SGhVTllTeXZCRkpRbjNLRFdadWUxQzVLcHc0?=
 =?utf-8?B?eHZBbWFhZ2RqSFFVSkZYanMvTjBsbjNRQStEV0l1NzR2b1F3YTVUeXdlMlc5?=
 =?utf-8?B?ZGJvSVBoMjI4TzExN2RNUzU0ZGFnUUNyR1ZRc1orWnQyMlhkMml3YVlkNCto?=
 =?utf-8?B?bEN0TGtZK2paWEd0ZHlCSDJrS0FnSUpIYlpkMkFWdFpoQzBreGdGRFRVVldn?=
 =?utf-8?B?OURBZGt3VVJpQ2ErL0Yvb2hXZE9SSmgySm9YcERsSHFTREx1bm1hcVNkMGNP?=
 =?utf-8?B?VVhuNVptU3ZpRHk0WExtU1VTM2ZsUEVBejNiUkFVeitMVWxMUDlTenZibjVU?=
 =?utf-8?B?Y3B4Nis4N3RraEpZNFdKUnF0TnV2V1RFRk96YUV3b25JNDVkUXhNZjUydmhX?=
 =?utf-8?B?SURWU1NBamN5cjFkckpRQnJUbXV1cXJLUk83NVhHOXRRMTgzSFppbmREUWF6?=
 =?utf-8?B?c2RmdVNSNVB4cmpTdHdVY01WMkZEU3kxdXNvSnBjTG5JeGp4c29PNENsWXNh?=
 =?utf-8?B?YnV0WGltOHU3enU2dFVKa0JnZTRyL3ZQSU1JdjNQUGxZNXpFNGt0WFlQdHBR?=
 =?utf-8?B?Y2ovMnRSQVZKNEE1NjJtV0hmV0JRa2FmelRVUC9uYXV2OFMvUU5oUkt0cEQ5?=
 =?utf-8?B?RjBHWUR6U3hyT3pGVHNuK1lJaXNlUzIrdllFWkFKR09IUmhFT01Pd3orbWEw?=
 =?utf-8?B?MngwL0s1Nld6NFE3RkRVZjh0N1pRYno5SktqTFUvK0w2VXZIR3Vtd200dWUv?=
 =?utf-8?B?T3M4TE9CVnJmMktISFlNNTFDM0RzUThrVFlRRTMzY2lkbHZtdnNvWkRoY0Zt?=
 =?utf-8?B?L2c3SDA0YlltMUp6ZWFpOVUzQlZrNC9nNFhWTThTWHB0S01scEcxRDBXMzV6?=
 =?utf-8?B?OTcycUF5MDUvNjlDa1gxZ3pJNmE5RFBMZ3dtbFNSWWxMLzVubk1lWjU0ZHU3?=
 =?utf-8?B?ZGw5N0lva0xZTDlWaTJjM0xURTVrUjIrbzBGeWE4WVJPMVNKTlF3UVNsc0k5?=
 =?utf-8?B?b0VHZXR1L1BsbUxWTXpSd2l0c3pHdW9DRmorTHVyTHdkTzFxZlcyRW1tNEhl?=
 =?utf-8?B?Y3hiRS8yOHo3NXZnV3l1U0hrQ1Z1SkdIZGN2WmR1L29haVBUZzM4ajJ6NEFX?=
 =?utf-8?B?Wk5HZFdDM2M2cVUwS0J2YllkdDYvbml4cGNLejRVdVJ1Y2xXc2JQSUVONWFG?=
 =?utf-8?B?cGhQTlZTS0oySDFnKzlUUFhiQ2ZrRi9EOUFYcWlRWTIxOXV5eUsvdFZtczhM?=
 =?utf-8?B?RG9NRlRQZS9hR29qNncyNGxYT0dVcUJ5SWRGWTNoNS91OXMzelF1eDk4Z2VF?=
 =?utf-8?B?dkRxd0dqRU5CTGFYNUE1aVlFampsWTJ3WWEzcjhSazBGdkJ2SVkwK3Z1VlpU?=
 =?utf-8?B?OWFLRmVyRnpmSE1veWsyOUliM0ozUEg1Wmt1aFErNGwxdmQxdC9IU1JoczMw?=
 =?utf-8?B?UytyYkJxK3QxNlBrcDcvSVc2dGluZ1Y5QTIrcXZwSkZITW84R3dTU0cyWmFE?=
 =?utf-8?B?aFh3bUsyNStjWnNOOE40T3lyMTltV0VSMlJlRDFlaGQ2TzlrS043cTNXd2lR?=
 =?utf-8?B?Q0pQMjRsS2MxSlk2eDZzVUltbW1oUXc3b28zcCtpMWRGUW1LQ2MyTU9hTzhV?=
 =?utf-8?B?KzZ5UXgvaEN2SmFBeFRmaytnMXU5NmVNQmpaY29IK2xha2xoQWlxUzlxc2FH?=
 =?utf-8?Q?QSaMMsCssvn/VTLaMU0CWy114?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13F8F9A7CC345B40944E6FE48A4D4F06@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33a9836-8d32-47ff-44fe-08dd0adae95e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 09:49:09.0282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JfljCWL+C/CfmQEqdqwJ4o30y2rHNoiGb8XZMphPI6paP7V/WyFrgPdXWSc52HQapcB1aUpcIVx0OaWNhpa2RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8212
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--42.957400-8.000000
X-TMASE-MatchedRID: EMyCvCfVN1EOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0rWz+cNVAnKHMELLYkjA+xdbc297PAGtWYhdi6zxllm1t3eUkv0LDwMQet
	Uhp4fOly6VMXtSc8qd7WrjxGHjCv1+b1ay1xHBnGimtMQe97AAH607foZgOWyTUobVis5Bb+WI1
	wlJxaoHqiqT2q4UZl79nkzMtsPLI5YpgZmiuURrRz2MDiYujy5GSqdEmeD/nXcrrVBXD2hQS+8O
	xujShyxFfvULuELtuQI5Lh+LXfcQjIwN7B72WwVuIwLnB3Aqp0hHWssEmb8zlpbYq2f4jz+IONi
	d9UX23PghRwq0IGq32VxZV0zkIQxD7+f/jfUYxIvz6alF1rVgzFFLhGUD8AWisBjXDry3y8o0Eq
	A13zQcwTMGSg+9ummQBIX+zZjjNH2l1CeX5j0X5p+VQtYY6SQZy5OrUC3GOkgGgoKRSa4CaHEGL
	Y7qOBcLXWjdyBIwJ9jLonZ23mSkfaem1tLpQOVEwyZyuMQ4119LQinZ4QefKU8D0b0qFy9suf7R
	WbvUtyrusVRy4an8bxAi7jPoeEQftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--42.957400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	55738BEFF3E1242126516B51952D57C39602E9A1621B5A63D1142FB8FDA96C3A2000:8

T24gRnJpLCAyMDI0LTExLTIyIGF0IDEwOjI1ICswMTAwLCBKdWxpZW4gU3RlcGhhbiB3cm90ZToN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVu
dC4NCj4gDQo+IA0KPiBMZSB2ZW4uIDIyIG5vdi4gMjAyNCDDoCAwOTo0MSwgQ0sgSHUgKOiDoeS/
iuWFiSkgPGNrLmh1QG1lZGlhdGVrLmNvbT4gYSDDqWNyaXQgOg0KPiA+IA0KPiA+IEhpLCBKdWxp
ZW46DQo+ID4gDQo+ID4gT24gVGh1LCAyMDI0LTExLTIxIGF0IDA5OjUzICswMTAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gRnJvbTogUGhpLWJh
bmcgTmd1eWVuIDxwbmd1eWVuQGJheWxpYnJlLmNvbT4NCj4gPiA+IA0KPiA+ID4gVGhpcyBkcml2
ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRh
dGENCj4gPiA+IGNvbWluZyBmcm9tIHRoZSBTRU5JTkYgY2FuIGdvIGRpcmVjdGx5IGludG8gbWVt
b3J5IHdpdGhvdXQgYW55IGltYWdlDQo+ID4gPiBwcm9jZXNzaW5nLiBUaGlzIGFsbG93cyB0aGUg
dXNlIG9mIGFuIGV4dGVybmFsIElTUC4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGhp
LWJhbmcgTmd1eWVuIDxwbmd1eWVuQGJheWxpYnJlLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEZsb3JpYW4gU3lsdmVzdHJlIDxmc3lsdmVzdHJlQGJheWxpYnJlLmNvbT4NCj4gPiA+IFtQYXVs
IEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRWxkZXIg
PHBhdWwuZWxkZXJAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+IENvLWRldmVsb3BlZC1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPg0KPiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBKdWxpZW4gU3RlcGhhbiA8anN0ZXBo
YW5AYmF5bGlicmUuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIFN0ZXBoYW4gPGpz
dGVwaGFuQGJheWxpYnJlLmNvbT4NCj4gPiA+IC0tLQ0KPiA+IA0KPiA+IFtzbmlwXQ0KPiA+IA0K
PiA+ID4gK3N0YXRpYyBpcnFyZXR1cm5fdCBpc3BfaXJxX2NhbXN2MzAoaW50IGlycSwgdm9pZCAq
ZGF0YSkNCj4gPiA+ICt7DQo+ID4gPiArICAgICAgIHN0cnVjdCBtdGtfY2FtX2RldiAqY2FtX2Rl
diA9IChzdHJ1Y3QgbXRrX2NhbV9kZXYgKilkYXRhOw0KPiA+ID4gKyAgICAgICBzdHJ1Y3QgbXRr
X2NhbV9kZXZfYnVmZmVyICpidWY7DQo+ID4gPiArICAgICAgIHVuc2lnbmVkIGludCBpcnFfc3Rh
dHVzOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICBzcGluX2xvY2soJmNhbV9kZXYtPmJ1Zl9saXN0
X2xvY2spOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICBpcnFfc3RhdHVzID0gbXRrX2NhbXN2MzBf
cmVhZChjYW1fZGV2LCBDQU1TVl9JTlRfU1RBVFVTKTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAg
aWYgKGlycV9zdGF0dXMgJiBJTlRfU1RfTUFTS19DQU1TVl9FUlIpDQo+ID4gPiArICAgICAgICAg
ICAgICAgZGV2X2VycihjYW1fZGV2LT5kZXYsICJpcnEgZXJyb3IgMHglbHhcbiIsDQo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBpcnFfc3RhdHVzICYgSU5UX1NUX01BU0tfQ0FNU1ZfRVJS
KTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAgLyogRGUtcXVldWUgZnJhbWUgKi8NCj4gPiA+ICsg
ICAgICAgaWYgKGlycV9zdGF0dXMgJiBDQU1TVl9JUlFfUEFTUzFfRE9OKSB7DQo+ID4gPiArICAg
ICAgICAgICAgICAgY2FtX2Rldi0+c2VxdWVuY2UrKzsNCj4gPiA+ICsNCj4gPiA+ICsgICAgICAg
ICAgICAgICBidWYgPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoJmNhbV9kZXYtPmJ1Zl9saXN0
LA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgbXRrX2NhbV9kZXZfYnVmZmVyLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsaXN0KTsNCj4gPiA+ICsgICAgICAgICAgICAgICBpZiAo
YnVmKSB7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBidWYtPnY0bDJfYnVmLnNlcXVl
bmNlID0gY2FtX2Rldi0+c2VxdWVuY2U7DQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBi
dWYtPnY0bDJfYnVmLnZiMl9idWYudGltZXN0YW1wID0NCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAga3RpbWVfZ2V0X25zKCk7DQo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICB2YjJfYnVmZmVyX2RvbmUoJmJ1Zi0+djRsMl9idWYudmIyX2J1ZiwNCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWQjJfQlVGX1NUQVRFX0RPTkUpOw0K
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgbGlzdF9kZWwoJmJ1Zi0+bGlzdCk7DQo+ID4g
PiArICAgICAgICAgICAgICAgfQ0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICAgICAgICAgIGJ1ZiA9
IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmY2FtX2Rldi0+YnVmX2xpc3QsDQo+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtdGtfY2Ft
X2Rldl9idWZmZXIsDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGxpc3QpOw0KPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChidWYpDQo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBtdGtfY2Ftc3YzMF91cGRhdGVfYnVmZmVyc19hZGQoY2Ft
X2RldiwgYnVmKTsNCj4gPiANCj4gPiBJZiBidWYgPT0gTlVMTCwgc28gaGFyZHdhcmUgd291bGQg
YXV0b21hdGljYWxseSBzdG9wIERNQT8NCj4gPiBJIGRvbid0IGtub3cgaG93IHRoaXMgaGFyZHdh
cmUgd29yay4NCj4gPiBCZWxvdyBpcyBteSBpbWFnaW5lIGFib3V0IHRoaXMgaGFyZHdhcmUuDQo+
ID4gDQo+ID4gMS4gU29mdHdhcmUgdXNlIENBTVNWX0lNR09fRkJDX1JDTlRfSU5DIHRvIGluY3Jl
YXNlIHNvZnR3YXJlIGJ1ZmZlciBpbmRleC4NCj4gPiAyLiBIYXJkd2FyZSBoYXMgYSBoYXJkd2Fy
ZSBidWZmZXIgaW5kZXguIEFmdGVyIGhhcmR3YXJlIGZpbmlzaCBvbmUgZnJhbWUsIGhhcmR3YXJl
IGJ1ZmZlciBpbmRleCBpbmNyZWFzZS4NCj4gPiAzLiBBZnRlciBzb2Z0d2FyZSBidWZmZXIgaW5k
ZXggaW5jcmVhc2UsIGhhcmR3YXJlIHN0YXJ0IERNQS4NCj4gPiA0LiBXaGVuIGhhcmR3YXJlIGJ1
ZmZlciBpbmRleCBpcyBlcXVhbCB0byBzb2Z0d2FyZSBidWZmZXIgaW5kZXgsIGhhcmR3YXJlIGF1
dG9tYXRpY2FsbHkgc3RvcCBETUEuDQo+ID4gDQo+ID4gRG9lcyB0aGUgaGFyZHdhcmUgd29yayBh
cyBteSBpbWFnaW5lPw0KPiA+IElmIGhhcmR3YXJlIGNvdWxkIGF1dG9tYXRpY2FsbHkgc3RvcCBE
TUEsIGFkZCBjb21tZW50IHRvIGRlc2NyaWJlLg0KPiA+IElmIGhhcmR3YXJlIGNvdWxkIG5vdCBh
dXRvbWF0aWNhbGx5IHN0b3AgRE1BLCBzb2Z0d2FyZSBzaG91bGQgZG8gc29tZXRoaW5nIHRvIHN0
b3AgRE1BIHdoZW4gYnVmID09IE5VTEwuDQo+ID4gDQo+IA0KPiBZb3UgYXJlIHJpZ2h0IGV4Y2Vw
dCB0aGF0IGRtYSBpcyBub3Qgc3RvcHBlZCBidXQgZnJhbWVzIGFyZQ0KPiBhdXRvbWF0aWNhbGx5
IGRyb3BwZWQgYnkgaGFyZHdhcmUgdW50aWwgYSBuZXcgYnVmZmVyIGlzIGVucXVldWVkIGFuZA0K
PiBzb2Z0d2FyZSB1c2VzIENBTVNWX0lNR09fRkJDX1JDTlRfSU5DIHRvIGluY3JlYXNlIHRoZSBz
b2Z0d2FyZSBidWZmZXINCj4gaW5kZXguDQo+IA0KPiBXaGF0IGFib3V0IGFkZGluZyB0aGUgZm9s
bG93aW5nIGNvbW1lbnQ6DQo+IA0KPiAvKg0KPiAqIElmIHRoZXJlIGlzIG5vIHVzZXIgYnVmZmVy
IGF2YWlsYWJsZSwgaGFyZHdhcmUgd2lsbCBkcm9wIGF1dG9tYXRpY2FsbHkNCj4gKiBmcmFtZXMg
dW50aWwgYnVmX3F1ZXVlIGlzIGNhbGxlZA0KPiAqLw0KDQpZb3Ugc2F5IERNQSBpcyBub3Qgc3Rv
cHBlZC4gRG8geW91IG1lYW4gaGFyZHdhcmUgc3RpbGwgd3JpdGUgZGF0YSBpbnRvIGxhdGVzdCBi
dWZmZXIgd2hpY2ggd291bGQgYmUgZGVxdWV1ZWQgdG8gdXNlciBzcGFjZT8NCkkgdGhpbmsgaGFy
ZHdhcmUgc2hvdWxkIG5vdCB3cml0ZSBkYXRhIGludG8gdGhlIGJ1ZmZlciB3aGljaCBoYXMgYmVl
biB0YWtlIGF3YXkgYnkgdXNlciBzcGFjZS4NCkkgdGhpbmsgc29mdHdhcmUgc2hvdWxkIGRvIHNv
bWV0aGluZyB0byBzdG9wIERNQS4gTWF5YmUgdXNlIG10a19jYW1zdjMwX2Ntb3NfdmZfaHdfZGlz
YWJsZSgpIHRvIHN0b3AgRE1BLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gTGV0IG1lIGtub3cg
aWYgdGhhdCB3b3JrcyBmb3IgeW91DQo+IA0KPiBDaGVlcnMNCj4gSnVsaWVuDQo+IA0KPiA+IFJl
Z2FyZHMsDQo+ID4gQ0sNCj4gPiANCj4gPiA+ICsgICAgICAgfQ0KPiA+ID4gKw0KPiA+ID4gKyAg
ICAgICBzcGluX3VubG9jaygmY2FtX2Rldi0+YnVmX2xpc3RfbG9jayk7DQo+ID4gPiArDQo+ID4g
PiArICAgICAgIHJldHVybiBJUlFfSEFORExFRDsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gDQo+
ID4gKioqKioqKioqKioqKiBNRURJQVRFSyBDb25maWRlbnRpYWxpdHkgTm90aWNlICoqKioqKioq
KioqKioqKioqKioqDQo+ID4gVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIChpbmNsdWRpbmcgYW55DQo+ID4gYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRl
bnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCj4gPiBleGVtcHQg
ZnJvbSBkaXNjbG9zdXJlIHVuZGVyIGFwcGxpY2FibGUgbGF3cy4gSXQgaXMgaW50ZW5kZWQgdG8g
YmUNCj4gPiBjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55
IHVzZSwgZGlzc2VtaW5hdGlvbiwNCj4gPiBkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5p
bmcgb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cw0KPiA+IGF0dGFjaG1l
bnRzKSBieSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFu
ZCBtYXkNCj4gPiBiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBp
ZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQo+ID4gdGhhdCB5b3UgaGF2ZSByZWNlaXZl
ZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyDQo+ID4gaW1t
ZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwgZGVsZXRlIGFueSBhbmQgYWxs
IGNvcGllcyBvZg0KPiA+IHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFjaG1lbnRzKSBm
cm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQo+ID4gZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2Yg
dGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0K

