Return-Path: <linux-media+bounces-14152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA14D917A6F
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 10:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 190F51C235F9
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 08:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961C515F3F2;
	Wed, 26 Jun 2024 08:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oAWfyyQg";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="X4/j638b"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F481B950;
	Wed, 26 Jun 2024 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719389137; cv=fail; b=F99uRwZKvDcCgn1lAAmsw+wQlcqn0MRt2ZCEbCSwjtgfqDOZO9Iv+2dLIYenUvJle8FzJMt1/niJjsp2PgFaXADdkCzbZ5oxEKj2lFzNq1MoPIPi/tzitxcqU4+xcomFJJakVS9Yfx0Qmayyve9L8MrGpQCYhT7vNTGq4M5DCkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719389137; c=relaxed/simple;
	bh=mSZ3aiyvU9URbYkuKaCePBI86kegDlWHFkPcThXmOic=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WrdJxmH68B27zG7+dVFej9yuVd/NJ/g8R8BsUn5aTjyCA3ycATWNhMGpYBYLNyxn4VEhTFF5GKMsqZxusoa5c/Hppqg6CUiaOtUyGTQQfwj2ODkSuvwx/adNSapEvj179dAADFBhxFeKo/bOweHOQ3Qw8p0mfNVG5lah9WGZm6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=oAWfyyQg; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=X4/j638b; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d9c3764e339211ef99dc3f8fac2c3230-20240626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=mSZ3aiyvU9URbYkuKaCePBI86kegDlWHFkPcThXmOic=;
	b=oAWfyyQgfhRGLbnxS6gJWPO+eCsl2mzZ/HMSptDqlxrHLKttBPRoOeo71NBrEEktzdOrUl/W4oGvQdBBhdxRKzPugwRAs0+MGCrkIk3GOEZwh+Xgkap9Fv6A77pYoU/A5OuyI+cnmyu9Sc5QuqwITOFMXnufr/XkUTEpCaoCK3E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:8be59a8e-696d-4562-8b5e-857139ef3564,IP:0,U
	RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:2
X-CID-META: VersionHash:393d96e,CLOUDID:fa1f7494-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:817|102,TC:nil,Content:4|-5,EDM:-3,I
	P:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
	,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: d9c3764e339211ef99dc3f8fac2c3230-20240626
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 289731924; Wed, 26 Jun 2024 16:05:28 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Jun 2024 16:05:27 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 26 Jun 2024 16:05:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dq78svDDm/scUgDQBsowmirmYnqHFead8fwtFCZDhBmKewtpon7OL81so7Ji/2Llk5x/b/E+qsnSGohCxnUIOXWbQREChSVy+LhIUxf2DJc0OudZfZpprDCvmVU/3MwH6G2aaHgez9YZcLmQ8q/CUjhehKSOJRtyYblwHNgr+LA7gvHh3xyZLadC0Z11eWEFeIWcgCPqWRF0c7tqPkw+hrVeCW3eDar1i2pTbLnrOyHEnfamEBpiM6XkISb67z4ULYxKtRKE/wTWf0vmV41cwLezy7ViaFTbpORQslFm/2hYSAt4k81GaX6pqfIsEPVM/W31DviuR26Vx3WMMc2alA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSZ3aiyvU9URbYkuKaCePBI86kegDlWHFkPcThXmOic=;
 b=F7zioNdhICj68fgCCkP0Z9qzDI5rXDpFrKsioi6aAQGrYR+oG2G7saCsN3Zv2QGFlh0tIpT5DorsnwDNbv3kfAeFhIPWNGT7ysLs122oyvI2JO+eXDHi+jIw6EkcelARVq5A9UFqjQFfI0w7aEJwU4qvR5V9m75vItVOgBLZ0wbpQw52wq2S+F6QS/d7ALKzYY8u6VYBJzh9e7O93xdD65Cf3+BpJGbR/QUT4sxlUhWVhLKtZVJNxHsfTb5onAuNVmDBrNr5k+OQ3zlSctPj6UZ4QXUkNrX47nz8WDPSqC4Rsrj8xnjB+Co9y8sD98lslkj0zL+rCfDiKBCoOJjF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSZ3aiyvU9URbYkuKaCePBI86kegDlWHFkPcThXmOic=;
 b=X4/j638b/aTFe3hX3RLQb9EHayp0uX0N+ZwG6I9H8cMBKiejZGn9jv0/7k491osA1XkXQDvizmsKZvHga3iConk6ucB4u6PPDY1y22H3nt4C7VPCI+Tb+TUyaTUwaGZ719Ht2ldsZ0qD6AvSV8zves4+qQrnmND2N21n1ySyR0Y=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB8204.apcprd03.prod.outlook.com (2603:1096:101:1aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 08:05:22 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 08:05:21 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	=?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mripard@kernel.org" <mripard@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"jstultz@google.com" <jstultz@google.com>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	=?utf-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
	<Jianjiao.Zeng@mediatek.com>, "willy@infradead.org" <willy@infradead.org>,
	=?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
	"quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, "pavel@ucw.cz"
	<pavel@ucw.cz>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"contact@emersion.fr" <contact@emersion.fr>, "logang@deltatee.com"
	<logang@deltatee.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	"jkardatzke@google.com" <jkardatzke@google.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"tjmercier@google.com" <tjmercier@google.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "joakim.bech@linaro.org"
	<joakim.bech@linaro.org>, "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Thread-Topic: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Thread-Index: AQHaxufGtXYlJ2nIzkCmfICpDUjhvbHYUI0AgAAN6YCAAVLnAA==
Date: Wed, 26 Jun 2024 08:05:21 +0000
Message-ID: <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
	 <20240515112308.10171-3-yong.wu@mediatek.com>
	 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
	 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
	 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
	 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
	 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
In-Reply-To: <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB8204:EE_
x-ms-office365-filtering-correlation-id: 14ad0ee5-ae28-4014-457f-08dc95b6ba13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230038|366014|376012|7416012|1800799022|38070700016;
x-microsoft-antispam-message-info: =?utf-8?B?V0ZNTmhOcjM1UEoyNU83WDVQTzhGYlY1czA5WEdUK2VQODFHU2VLVUJYUGxR?=
 =?utf-8?B?NGJnakt1R0J6a3lLRGRYS3B2UGNpZ1R4K0I0L0g5Z2RQaWVHMk5PWjRFVWZu?=
 =?utf-8?B?WjNndnRNSlg5Mk9Ccmg4Y2ZEcGxmb0lOdmMxeUx1V0U5aEhsbzRldTZ2NVZo?=
 =?utf-8?B?VGhsT05qbmZtUmtpa09jbVRmZVpoc01neTV1V3FFSnFESFBmS0ViZnhqMFE2?=
 =?utf-8?B?M0ZDeUxUQkNQUFQwaWdlNUMxNXZCeVpETkIvK2ZXOGxCRkJ4SG5wUmoxZVRG?=
 =?utf-8?B?aEl3Z2daRHpDdVg3RWkrVmFsYTdudm5yOG9RUTlSQXlScnVjV2MvbEsraHlY?=
 =?utf-8?B?T1FmNDRncU4yMy81N0RpNHMvMXBmbHV1UjZPWTZPK0FPNEFsTEs4YytHdFhS?=
 =?utf-8?B?ejg5MU5rZkRDQko1VUZZd25rbnVCNk4xRjBFd3lmS2t4MnEycWZwWGMxVStJ?=
 =?utf-8?B?Y1VVbXQvSjEwZ1BRMnc3NlN6djhKdTNEaDE2eXMvMkJwOG9tMDJCRUhTTmhp?=
 =?utf-8?B?c2l3Ty9URGdIUFVzb2hjSitWayt3d21WUkNzblBqd0RneENqRjlCazdqeGJH?=
 =?utf-8?B?aE1XVDhzTS94T0doTTdPcmFoWW1CRFFhSElEWGJLUEl1Tm1lcFdhUDRVNXh5?=
 =?utf-8?B?L1kvWXhnaGJBem8vRlZnYk1VNmlqQ2NpeFRzeFdSTjFnRGNONWU3YTBTUGJS?=
 =?utf-8?B?WGMxTmxHWTNnSlZSNzF3MkI1WlBkUG1UdjVVRmZmNlh4bnYybk44YitTampm?=
 =?utf-8?B?SG9VeEpyVGFnenFNY3FKSzNVaWNuT2pwTVVUQ2hzZGZPMHhqV1lKT2loL0gv?=
 =?utf-8?B?aUlXY3ozWmQ5MVRwd0hRMGJDSVJiUmdCYnZoVGFCUmc1Rm1aSnlSU2V5UlM3?=
 =?utf-8?B?YmhEM1pxRndBc05PRHBHcGpOVWJtMktZUXk4RTVybWNENlVHejFjVVEvcUhK?=
 =?utf-8?B?KzhhK0ZNczF2UURtUno3S0FJTmc4SlVaL1hjdmgvZzNtRjNQMXR2c2JSWmdN?=
 =?utf-8?B?RERmekhzU3FqZ0hDVmwzVVlvV3o0RFROeURqZXNTSk1BUVNUNG1sTGhPbHB6?=
 =?utf-8?B?YWVZUkpObThQUkk3Y1VvZ3NIYldDeitsTFQ0UXNIbWJUVlBFRWdaM3lTMkdG?=
 =?utf-8?B?L0JDOE95Y3FrYVZHbHNpOTAraUF6bkN2KzBDaXFzNHZtNXgzZlJIZ3RNR01U?=
 =?utf-8?B?SkNqb3lvNERMejB0QzZ5dzhwVFhDU0tqOC9YUCtOYW1NckdPUmwwKy9LU2lq?=
 =?utf-8?B?NmZiS2JpQzczOHJYdjZEN1BmV091dGwxcENaa1JudE5uMVRuamE3NkdOTllt?=
 =?utf-8?B?eXF4aHRwbmpycUY4TXZVWmM0bjFudHgwQU1IOHNpZURseHVicVlNUVNYV3VF?=
 =?utf-8?B?S0kxOW5BaFpweGhQMkVMTGlXQ3VjRktNcTJhcE1TYjkxVW9NU3ByR1NDZGRy?=
 =?utf-8?B?QXBkM0lLem9sVmh0VTMweTllVTlBaWt6bVA2aXpQRXNBaU4rT0U2ZTdMdFlP?=
 =?utf-8?B?Q1Nxb1VoTVF6Uk1JbWY4UlA5cDJtUVFxYjVib3lQZURJZzNnQzBvaFQ0VmJE?=
 =?utf-8?B?T3N0Z3dSMkJ2T3JsT2hTSkRyaTIxcWw0NU1aY1VHL3FydUpiYS9JK2RUR25P?=
 =?utf-8?B?NldIcG0vZEJzV0w5QjRHbW9CNWRxNVJxVk85eEI2S2JpRVN5RmpONE9iYzhW?=
 =?utf-8?B?SmFmYmEvZHlCZlA3cmxXcmxkQ2c3S3kvZ3E1Z2lQVXh5anBCaTh2ZzlCQThL?=
 =?utf-8?B?S3ZLaXFUTjJzYXZOdHUwUitPWXVWeDFCcm1MOTVEa3RJUmR2V1JCWHptd2Uz?=
 =?utf-8?Q?/gXKNY/X8rDsxwJKXjl1tQLxx4zxfcnOlKTlA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(366014)(376012)(7416012)(1800799022)(38070700016);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmFwZzUvdWRyTkJvTkJiK2VCeW1WQjNzZzJvS2Q0a1BGMFhrTm04czJkL0VI?=
 =?utf-8?B?L2tQMCtKa2s1Vmp3ZmJQU2pSN0RuUEs2aTJLcGUyMmt3UXR4ZjVoRDc4Q3Qv?=
 =?utf-8?B?MnlEek9GNUxlUUJGZE5CMzZtaWRXY3hrbXJlZTd1QjJwRVVWRStHbGtEUm9S?=
 =?utf-8?B?VkJBUTI4eWtzamZ0MVg1N0N0NDJEOVJvM01vaWN3SUVoVTlUTzdoaWlGL0lp?=
 =?utf-8?B?S3ZkQWdOaE5iSE1SenJwcHJrMk9xT1lWOHFETEg0amdpdTBsU2lDT213L3JY?=
 =?utf-8?B?YTBHSUd6RzNZcFdLRUQ3M2dza05XRFlraWdGb21oSVVPcjhVZ2Y5a0UxOWxM?=
 =?utf-8?B?UTQzT0hSWlZOYXMwQ2VHVEtGbi9Qdm96alZxREFvNW9lVTR1dDRxRUZVN284?=
 =?utf-8?B?amRuS0J6bzMxWDdSYlpLNlZmbnBXeXVKOUZOczNja0ttRGVTc2pJVkhkU3V6?=
 =?utf-8?B?MEM0WE5GRlN1b2I2dHFsaU9tQXY2YkNuL0FScE9UTmVXd2N6SkcwSEUrcXZI?=
 =?utf-8?B?T1BuS0dMVngvZ0M5cXlrM3VNcTJRanZYenBhWEx3MFdDZXN6L3VQcWp4eHlw?=
 =?utf-8?B?TGk3bWJ6cmRwK3pqQmQ3N2FVb1c5M0RUYks5QTdwVTFTTkZhN2QwT3VBTXV1?=
 =?utf-8?B?Wll1OWRJaStYRkNMb0JweisreFIxR05qUVBhb2R1Um1DQkgwSXd0OHltRkNT?=
 =?utf-8?B?SitPbkRWOENxQklaWFY3K0h5bVJmZ0ZORXJYWlZxQS90QlI4MTRFb2p6bGxT?=
 =?utf-8?B?djA5WGVwSGYzRzJlZElPTFp0QVBJTHRmZVpYRjNkTWJQWXB3OUJQVmF0bXJN?=
 =?utf-8?B?UDIrLzJLOE0zL0ZDajQzNjRiNldIREZtY2VMeHpBUm5oQjc1N1UzbGRLUzhR?=
 =?utf-8?B?cUhjUjJ6dWljbDhuTkIvRlU0UWZrNnlROWJwcURoWnZlaTF1b1Z5VkYybEhr?=
 =?utf-8?B?dGpoVXdEbkJYemV0WVlGT1pzTWI0b0ZMbGR1alRVRnBpSDBFekpYdm43cFpv?=
 =?utf-8?B?STE3d2NYUXRseXUyb2JFME1QakViZ0luWFNoZHhSbExtSnphdnZid1lvNWZt?=
 =?utf-8?B?Ri9OK3daWHNQaVVqLzJvdnFMTERxT1hEeFVnT2NsQ01ySFR1THdjQ2Q4aU9B?=
 =?utf-8?B?ZjU0b1ZSWDkwNGNyWmIyUGthOW15QXdCU3NpVGs4M0MzR2xrT29vOGFnQlg1?=
 =?utf-8?B?U0tuTzVNYVdPY3JBYS9yWVcrTjFvUWU3NFFybFNxdXgyWEZEaVdITkdlQnZW?=
 =?utf-8?B?ZUFXdkliRGV3YkFhSFZRZ3Z2M1VPcWtBek1xR0MwNXpURExFRHhSNzliTURw?=
 =?utf-8?B?enA0OE5sN1hvbzYxMXYzc08vY3JUc3VTd2g3Y0I1V3ZhSnYzcmV1cnlKV3Av?=
 =?utf-8?B?VVlGTFFCR053bVgzUStrQ3g1MUVrMlNIRWw2ZWJadjJxMm1MYjFWVjNHUXVR?=
 =?utf-8?B?RlUrMEFsZFRiem53NjhaeVFabElycGJQOXA4aEd2dUNjbkpxc2NnakNFV3N5?=
 =?utf-8?B?elEzYWRuYXRab3ZueVJoVmhnQ3JNZW5UbDIwVDVDeE9TZFA5Q1VFZ1NsVUUz?=
 =?utf-8?B?dXY5amE1STZzTHJOZzUwK2RxWWlXREFOZmV4OTdvTFRzcy9NVTZtRUltMjND?=
 =?utf-8?B?b2VZN0J4dlRzMmkrb2wyaWJ3WkZ0OXovTWZNdDR0SkFDQldBaWprTnh1Znlh?=
 =?utf-8?B?NlFiMmZLRnZ5VTRxZkdKRFpEMTVlb3lNVDJZMVZQTTZqMEdreXBUczd5Q1ZJ?=
 =?utf-8?B?d1lXRVgwVnV3YnUxbWRlQTJtM0dnR2pVS1JFNm41c0JLVklEV2pYTjBzQW8r?=
 =?utf-8?B?eWVXa3FTWnJGdU4zU25MWUtadlhuQ3dEQ3dVY1lKOVF1bkRrMFRpclhDRW1u?=
 =?utf-8?B?bU1VendMUDZNM0dueHh3U3VHTXozTXMyWVBJekFONTNtaEVQYmNZZnJRZUUr?=
 =?utf-8?B?ajZCOTB4NkRDTi9LTU5ZbkhnTlZBNUhKK2ZPRC80UVJCTjZhNFRmRE1rOHRC?=
 =?utf-8?B?eTZjQ0U2VTFZb2xvaTNaNHFIcjZ4OXdvdlFvT3JYSWZUQWtpczZrQ2twTjQw?=
 =?utf-8?B?cU42bEl3Kzg4MTFnbGJYZDFrY3Q0bFhnSHVMOVBUNlZuYWZFT0Z1MWFnL2xC?=
 =?utf-8?B?VU9OMlB2dTRGQ2g1RklZL1ZYazNyV0g3eXhBZlEzUFZydWttd0p5Y2c1dlBl?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F54BFC1ADEFD4A4CAC3545C32B431D12@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ad0ee5-ae28-4014-457f-08dc95b6ba13
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 08:05:21.7557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzpX9QZ9WJ0DlHWf7ZzpapWXah9JGTC7JxRArS2DqZcw0mSLgXCplr0i0QndjgRA30PksCeX13theg9xbzsdvPJZyhJxE7H5wYcRM4F8zbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8204

PiA+IA0KPiA+IEhlcmUgaXMgdGhlIGV4cGVjdGVkIHByb3RlY3RlZCBjb250ZW50IGJ1ZmZlciBm
bG93IGluIERSTToNCj4gPiAxKSB1c2Vyc3BhY2UgYWxsb2NhdGVzIGEgZG1hLWJ1ZiBGRCBmcm9t
IHRoZSAicmVzdHJpY3RlZF9tdGtfY21hIg0KPiA+ICBieQ0KPiA+IERNQV9IRUFQX0lPQ1RMX0FM
TE9DLg0KPiA+IDIpIHVzZXJzcGFjZSBpbXBvcnRzIHRoYXQgZG1hLWJ1ZiBpbnRvIHRoZSBkZXZp
Y2UgdXNpbmcgcHJpbWUgZm9yDQo+ID4gdGhlDQo+ID4gZHJtX2ZpbGUuDQo+ID4gMykgdXNlcnNw
YWNlIHVzZXMgdGhlIGFscmVhZHkgaW1wbGVtZW50ZWQgZHJpdmVyIGltcG9ydCBjb2RlIGZvcg0K
PiA+IHRoZQ0KPiA+IHNwZWNpYWwgY2FzZXMgb2YgcHJvdGVjdGVkIGNvbnRlbnQgYnVmZmVyLg0K
PiAgDQo+IFdoYXQgaXMgc28gc3BlY2lhbCBvbiB0aGF0IGNhc2U/DQoNClRoZSBzcGVjaWFsIGNh
c2Ugc2ltcGx5IG1lYW5zIHRoZSB0aGUgcHJvdGVjdGVkIGNvbnRlbnQgYnVmZmVyLg0KDQo+IA0K
PiA+IEluIHRoZSBzdGVwIDMpLCB3ZSBuZWVkIHRvIHZlcmlmeSB0aGUgZG1hLWJ1ZiBpcyBhbGxv
Y2F0ZWQgZnJvbQ0KPiA+ICJyZXN0cmljdGVkX210a19jbWEiLCBidXQgdGhlcmUgaXMgbm8gd2F5
IHRvIHBhc3MgdGhlIHNlY3VyZSBmbGFnDQo+ID4gIG9yDQo+ID4gcHJpdmF0ZSBkYXRhIGZyb20g
dXNlcnNwYWNlIHRvIHRoZSBpbXBvcnQgaW50ZXJmYWNlIGluIERSTSBkcml2ZXIuDQo+ICANCj4g
V2h5IGRvIHlvdSBuZWVkIHRvIHZlcmlmeSB0aGF0Pw0KDQpJIG5lZWQgdG8ga25vdyB0aGUgaW1w
b3J0ZWQgYnVmZmVyIGlzIGFsbG9jYXRlZCBmcm9tIHJlc3RyaWN0ZWQgY21hIGFuZA0KbWFyayBp
dCBhcyBhIHNlY3VyZSBidWZmZXIgaW4gbWVkaWF0ZWstZHJtIGRyaXZlci4gVGhlbiwgSSB3aWxs
IGFkZA0Kc29tZSBjb25maWd1cmF0aW9uIHRvIHRoZSBoYXJkd2FyZSBpZiB0aGUgYnVmZmVyIGlz
IHNlY3VyZSBidWZmZXIsIHNvDQp0aGF0IGl0IGNhbiBnZXQgdGhlIHBlcm1pc3Npb24gdG8gYWNj
ZXNzIHRoZSBzZWN1cmUgYnVmZmVyLg0KDQo+IA0KPiA+IFNvIEkgY2FuIG9ubHkgdmVyaWZ5IGl0
IGxpa2UgdGhpcyBub3c6DQo+ID4gc3RydWN0IGRybV9nZW1fb2JqZWN0ICptdGtfZ2VtX3ByaW1l
X2ltcG9ydF9zZ190YWJsZShzdHJ1Y3QNCj4gPiBkcm1fZGV2aWNlDQo+ID4gKmRldiwgc3RydWN0
IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoLCBzdHJ1Y3Qgc2dfdGFibGUgKnNnKQ0KPiA+IHsN
Cj4gPiAgICAgc3RydWN0IG10a19nZW1fb2JqICptdGtfZ2VtOw0KPiA+IA0KPiA+ICAgICAvKiBj
aGVjayBpZiB0aGUgZW50cmllcyBpbiB0aGUgc2dfdGFibGUgYXJlIGNvbnRpZ3VvdXMgKi8NCj4g
PiAgICAgaWYgKGRybV9wcmltZV9nZXRfY29udGlndW91c19zaXplKHNnKSA8IGF0dGFjaC0+ZG1h
YnVmLT5zaXplKSB7DQo+ID4gICAgICAgICBEUk1fRVJST1IoInNnX3RhYmxlIGlzIG5vdCBjb250
aWd1b3VzIik7DQo+ID4gICAgICAgICByZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gPiAgICAg
fQ0KPiA+ICAgICBtdGtfZ2VtID0gbXRrX2dlbV9pbml0KGRldiwgYXR0YWNoLT5kbWFidWYtPnNp
emUpOw0KPiA+ICAgICBpZiAoSVNfRVJSKG10a19nZW0pKQ0KPiA+ICAgICAgICAgcmV0dXJuIEVS
Ul9DQVNUKG10a19nZW0pOw0KPiA+IA0KPiA+ICsgICBtdGtfZ2VtLT5zZWN1cmUgPSAoIXN0cm5j
bXAoYXR0YWNoLT5kbWFidWYtPmV4cF9uYW1lLA0KPiA+ICAicmVzdHJpY3RlZCIsDQo+ID4gMTAp
KTsNCj4gPiAgICAgbXRrX2dlbS0+ZG1hX2FkZHIgPSBzZ19kbWFfYWRkcmVzcyhzZy0+c2dsKTsN
Cj4gPiAgICAgbXRrX2dlbS0+c2l6ZSA9IGF0dGFjaC0+ZG1hYnVmLT5zaXplOw0KPiA+ICAgICBt
dGtfZ2VtLT5zZyA9IHNnOw0KPiA+IA0KPiA+ICAgICByZXR1cm4gJm10a19nZW0tPmJhc2U7DQo+
ID4gfQ0KPiAgDQo+IENvbXBsZXRlIE5BSyBmcm9tIG15IHNpZGUgdG8gdGhhdCBhcHByb2FjaC4g
SW1wb3J0aW5nIG9mIGEgRE1BLWJ1Zg0KPiBzaG91bGQgYmUgaW5kZXBlbmRlbnQgb2YgdGhlIGV4
cG9ydGVyLg0KPiANCj4gV2hhdCB5b3UgY291bGQgZG8gaXMgdG8gcHJvdmlkZSB0aGUgc2VjdXJl
IGJ1ZmZlciBmcm9tIGEgZGV2aWNlIGFuZA0KPiBub3QgYSBkZXZpY2UgaGVhcC4NCj4gDQoNCllv
dSBtZWFuIEkgc2hvdWxkIGFsbG9jYXRlIGJ1ZmZlciBpbiBtZWRpYXRlLWRybSBkcml2ZXIgbm90
IHVzZXJzcGFjZT8NCkkganVzdCBoYXZlIG1vZGlmaWVkIHRoaXMgdG8gdXNlcnNwYWNlIGJ5IHRo
ZSBjb21tZW50IGhlcmU6DQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9s
aW51eC1tZWRpYXRlay9wYXRjaC8yMDI0MDQwMzEwMjcwMS4zNjktMy1zaGF3bi5zdW5nQG1lZGlh
dGVrLmNvbS8jMjU4MDY3NjYNCg0KPiA+IEkgdGhpbmsgSSBoYXZlIHRoZSBzYW1lIHByb2JsZW0g
YXMgdGhlIEVDQ19GTEFHIG1lbnRpb24gaW46DQo+ID4gDQo+ID4gDQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tZWRpYS8yMDI0MDUxNS1kbWEtYnVmLWVjYy1oZWFwLXYxLTAtNTRjYmJk
MDQ5NTExQGtlcm5lbC5vcmcvDQo+ID4gDQo+ID4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIg
dG8gaGF2ZSB0aGUgdXNlciBjb25maWd1cmFibGUgcHJpdmF0ZQ0KPiA+IGluZm9ybWF0aW9uIGlu
IGRtYS1idWYsIHNvIGFsbCB0aGUgZHJpdmVycyB3aG8gaGF2ZSB0aGUgc2FtZQ0KPiA+IHJlcXVp
cmVtZW50IGNhbiBnZXQgdGhlaXIgcHJpdmF0ZSBpbmZvcm1hdGlvbiBmcm9tIGRtYS1idWYgZGly
ZWN0bHkNCj4gPiBhbmQNCj4gPiBubyBuZWVkIHRvIGNoYW5nZSBvciBhZGQgdGhlIGludGVyZmFj
ZS4NCj4gPiANCj4gPiBXaGF0J3MgeW91ciBvcGluaW9uIGluIHRoaXMgcG9pbnQ/DQo+ICANCj4g
V2VsbCBvZiBoYW5kIEkgZG9uJ3Qgc2VlIHRoZSBuZWVkIGZvciB0aGF0Lg0KPiANCj4gV2hhdCBo
YXBwZW5zIGlmIHlvdSBnZXQgYSBub24tc2VjdXJlIGJ1ZmZlciBpbXBvcnRlZCBpbiB5b3VyIHNl
Y3VyZQ0KPiBkZXZpY2U/DQoNCldlIHVzZSB0aGUgc2FtZSBtZWRpYXRlay1kcm0gZHJpdmVyIGZv
ciBzZWN1cmUgYW5kIG5vbi1zZWN1cmUgYnVmZmVyLg0KSWYgbm9uLXNlY3VyZSBidWZmZXIgaW1w
b3J0ZWQgdG8gbWVkaWF0ZWstZHJtIGRyaXZlciwgaXQncyBnbyB0byB0aGUNCm5vcm1hbCBmbG93
IHdpdGggbm9ybWFsIGhhcmR3YXJlIHNldHRpbmdzLg0KDQpXZSB1c2UgZGlmZmVyZW50IGNvbmZp
Z3VyYXRpb25zIHRvIG1ha2UgaGFyZHdhcmUgaGF2ZSBkaWZmZXJlbnQNCnBlcm1pc3Npb24gdG8g
YWNjZXNzIHRoZSBidWZmZXIgaXQgc2hvdWxkIGFjY2Vzcy4NCg0KU28gaWYgd2UgY2FuJ3QgZ2V0
IHRoZSBpbmZvcm1hdGlvbiBvZiAidGhlIGJ1ZmZlciBpcyBhbGxvY2F0ZWQgZnJvbQ0KcmVzdHJp
Y3RlZF9tdGtfY21hIiB3aGVuIGltcG9ydGluZyB0aGUgYnVmZmVyIGludG8gdGhlIGRyaXZlciwg
d2Ugd29uJ3QNCmJlIGFibGUgdG8gY29uZmlndXJlIHRoZSBoYXJkd2FyZSBjb3JyZWN0bHkuDQoN
ClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiANCj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0K
PiANCj4gPiBSZWdhcmRzLA0KPiA+IEphc29uLUpILkxpbg0KPiA+IA0KPiA+ID4gUmVnYXJkcywN
Cj4gPiA+IENocmlzdGlhbi4NCj4gPiANCj4gPiAqKioqKioqKioqKioqIE1FRElBVEVLIENvbmZp
ZGVudGlhbGl0eSBOb3RpY2UNCj4gPiAgKioqKioqKioqKioqKioqKioqKioNCj4gPiBUaGUgaW5m
b3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkg
DQo+ID4gYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2
aWxlZ2VkLCBvcg0KPiA+IG90aGVyd2lzZQ0KPiA+IGV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5k
ZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZSANCj4gPiBjb252ZXllZCBv
bmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwNCj4gPiBkaXNzZW1p
bmF0aW9uLCANCj4gPiBkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWlu
ZyBvZiB0aGlzIGUtbWFpbA0KPiA+IChpbmNsdWRpbmcgaXRzIA0KPiA+IGF0dGFjaG1lbnRzKSBi
eSB1bmludGVuZGVkIHJlY2lwaWVudChzKSBpcyBzdHJpY3RseSBwcm9oaWJpdGVkIGFuZA0KPiA+
IG1heSANCj4gPiBiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBp
ZW50IG9mIHRoaXMgZS1tYWlsLA0KPiA+IG9yIGJlbGlldmUNCj4gPiAgDQo+ID4gdGhhdCB5b3Ug
aGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUNCj4g
PiBzZW5kZXIgDQo+ID4gaW1tZWRpYXRlbHkgKGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsKSwg
ZGVsZXRlIGFueSBhbmQgYWxsIGNvcGllcw0KPiA+IG9mIA0KPiA+IHRoaXMgZS1tYWlsIChpbmNs
dWRpbmcgYW55IGF0dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8NCj4gPiBub3QN
Cj4gPiBkaXNjbG9zZSB0aGUgY29udGVudCBvZiB0aGlzIGUtbWFpbCB0byBhbnkgb3RoZXIgcGVy
c29uLiBUaGFuayB5b3UhDQo+ICANCg==

