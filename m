Return-Path: <linux-media+bounces-14215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8850919DC6
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 05:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD1971C21170
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 03:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF13F1757E;
	Thu, 27 Jun 2024 03:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nfaSW6Y9";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="iI62HHzs"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB122139DB;
	Thu, 27 Jun 2024 03:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719458280; cv=fail; b=O129BNoO/zr4GaMldzLm0M5cPCtSfnvPYMNmYHLtuX/MIIq7iCzZBLaGO2YUXclhbikToG24ugIZURM0MV4KfZT0OInwM0sAyJ/l7Df1Zozj3pdf5MyQYn6/9pkMcPIvm6I6GvsVzMU6TjqZXvyGfOxs/sQsYAV0IcxLWobfvk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719458280; c=relaxed/simple;
	bh=Bv8yryd2mn/57kQj7RBBcrftdWm8GydInDiYIljBaPs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QYL3XefIx2Hu+3PK+kRtFOElUeWt7/UEGyw0VTkl/OXMD2VwqmCMPYABsjXV3m8fJUKlJFcIubxCCMOKcTW5aiLMB8H4cm/glwllsIVdTIGDM2SEfQjtsosK3iISvh6OkVLBjrVhcNWy0DIaLP/kYHOOyB25z8VM+dSb+ac+RTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=nfaSW6Y9; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=iI62HHzs; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d4817b9e343311ef8da6557f11777fc4-20240627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Bv8yryd2mn/57kQj7RBBcrftdWm8GydInDiYIljBaPs=;
	b=nfaSW6Y9Y5+9H6BLICkU3zdgrU8UIOfFHiM0XEtj8FP+lSSpEzx3vwCeA+nd1YEsojn8ILjLWBoe/YqbZn8TSJasqwTP6vMofPu8LrRh4BW2WSO8H5hctOvHyfh+kXdxqVM5twyIbP5UOECF2u/Hz9Zhwefj8kzKIA87x0aoAGM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:2722f07f-1450-4712-a4e6-3e6046ae49e7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:15ba9585-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: d4817b9e343311ef8da6557f11777fc4-20240627
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 998149371; Thu, 27 Jun 2024 11:17:48 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 27 Jun 2024 11:17:47 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Jun 2024 11:17:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVk884X2iqUhnDLuZ8t9hvM8+HNWsOXCb3ZQqMB8iHE3DaOu/oE4kJXngcKsbDpoV3xDlxTGV5RJVmplw/O1wKemO27R0V9bUDv/sUbMpDXo6J2nRzisByDBez6wp66PlJrEzbGDaVvLRKNNpWpG+ahtQgjmnV9yjsZ1pPk2zZtf/m7JNIujhkWGQaDCDSqTKLNCv9In8eVob+IS4NLqH689VrMOf5PpWZIzMc274uwKDa9ubxQLm7f3bARsy7CNqUGjZ4ektl9DYR6Nw2M0H69ABQ/7282d4YA4skvldidIjBmhoop3hE6mYadxOXfimUjvPiBhA9lEGtq6yBPJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bv8yryd2mn/57kQj7RBBcrftdWm8GydInDiYIljBaPs=;
 b=FsAGzo+6/uAGNQZc0yQH/AofEhf4FaPtiafC9XRmu4+dU7E8rz1Zw+r96ZudSLIMuZQJlsQXpVEDJjohKmVUJDjvkJg82oGVuI9TgUgRk62n881JqAEbzNsdAKu8bqJDn5aYD5h/43IeN4OGFVM0mWibB9kYqq32rN/nY0hTC2/TBMj/6CBz4QL4AfFHdzIDpSTXiSyMe4PcLtIoEAY4maaeekk33igTOFKqox++IiAvNztqCn50PK3r2+u7vrxAxRfRpGvMObuR7A2BfRy0DvQkyFyaoZz2qVSxJ4qdjchY0B/+YCcTACewR8L4ctDYaYOA3jVAjmATVQiiKhp9Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bv8yryd2mn/57kQj7RBBcrftdWm8GydInDiYIljBaPs=;
 b=iI62HHzsEYa66WcL8vdDIex9qof1e8w6wsmm1TpugxUatEHt7u7fTpgB5E8h3c1vJkc5Z3x+KX6lISXFzxO16EqKJDTqhxm4P6NmHw4uNpnuWIjC5kTImiH7vaAThx4Cy/mPve8iNMtmPKmpiPIulbNwRNfiPeQv+aD/NfMfeAI=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB8149.apcprd03.prod.outlook.com (2603:1096:101:174::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 03:17:44 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%5]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 03:17:43 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "christian.koenig@amd.com"
	<christian.koenig@amd.com>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, "mripard@kernel.org"
	<mripard@kernel.org>
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
Thread-Index: AQHaxufGtXYlJ2nIzkCmfICpDUjhvbHYUI0AgAAN6YCAAVLnAIAALb0AgAEUOwA=
Date: Thu, 27 Jun 2024 03:17:43 +0000
Message-ID: <1ce8cea2fdb4169ce827b0bd20d472e697f23c38.camel@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
	 <20240515112308.10171-3-yong.wu@mediatek.com>
	 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
	 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
	 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
	 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
	 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
	 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
	 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
In-Reply-To: <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB8149:EE_
x-ms-office365-filtering-correlation-id: e56f1250-d6ff-4581-4e0d-08dc9657b5eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aHNUV3ZUVlkzYlE2bGdsaEd4R29QTEdDR2RIdXN0YStCTGk4RmRKTFRoVzZ1?=
 =?utf-8?B?NzFhZE5jK1R3UmE4bTdpN3hMaFZBSjBWZ0xaalNoYnQxdm9QYjJXazh3MDUw?=
 =?utf-8?B?b2Z2eVVpOFNtNEprNER5aE9CWEYyMDhBVDBPRTNvN3RBUnhzWjRTNmlNQjBW?=
 =?utf-8?B?OWl0Q05ScTNXWll5TENvNXNISWpjTGxlcG1Wa1FlSE9RdmIzOTRacTJPNVFx?=
 =?utf-8?B?MElQZGlqQ244TVc2Yk5PbGpSTUpaL2h4R2hhWW5BbVRVb3FRaFEwaWxsQlph?=
 =?utf-8?B?TS90ZmhnOURhY2pzaUg4WWlOakQ1WUloU2tIbHBFOVc1b0M1K0lmZzlFK21j?=
 =?utf-8?B?bGZFc2VYUWUyZVViM2x6emNHaEJLQnR5OTVEeDEycU1LZEFuNVdSandTVm45?=
 =?utf-8?B?dHhOQTM3eFBWMWw3VGk0aDl0YjRuemhBQXF6VnBSUmpBemFDUUVsdFR1ZnJW?=
 =?utf-8?B?Vzd0UUF4dlZSU3BxNzJkcGZ4a0pSakdhamRoa2g0dmlUdlBVa1lkSUxMNW5u?=
 =?utf-8?B?TDZqV1ptK09NM1FML3ZRZHBLYVptbTJjakE5ZGx5cStSTHlobU01Q2VhNTJM?=
 =?utf-8?B?UEY3enhtbGNqV0l3djkvc0lkMjFyVEZMdHpvSU5wZm4rdmErSjExN2JqRk5t?=
 =?utf-8?B?b3FVSWFRTTVGK0krN0RRR3U1UW5qNVZSRk5OTVh3NjVraDMyVkVEd1p5ZFF1?=
 =?utf-8?B?MEMyQ0JYY2hDVU9WU29MbXVpS0FNdTRWRWZlVWF1TW1nbkhBbS9zVVZLdkIr?=
 =?utf-8?B?M2FoREovSVAzZW5UTG9rUWpkVytJNkdyQzdZRisvY3ZjaGJIVFlmbUZzVHlk?=
 =?utf-8?B?b29EOGJYSUl0V0o5MnlzZlRLb25yNDFZeU1ma2VacThUdzcxTnVzdFFWcFFr?=
 =?utf-8?B?cEdrR1RoUlNUakJIbjVPaVlDd3R2T3BXc21xSUk1eVBMSklSb1NzaUVKaUNC?=
 =?utf-8?B?QkQzRDRGY3Zkb1dlSnhRcThHNHBXKzI2M0VNSG8vNTBqSkFvNnp4azZLaXo5?=
 =?utf-8?B?eHRjMEhoN3NwQ1ZiSXYySm02VXREc0R5MElHNWdTZCtZNUk4TUFoWU92eGpo?=
 =?utf-8?B?NWRvTEVXRWpnL0UrWExEYjRwekZHZDFrbWxwaHRxWnk4MFJ1RjE2QnZrdmdh?=
 =?utf-8?B?Wlc0a0F0YVVOUmZuUGNlRkxpaGtOSVIrUlp5aExPcWNDUzcxR210aW1xSXFU?=
 =?utf-8?B?Q1lVU2dRQnhRd1hYcTZCcUNLTGFjOE9hd3lhWFNMUGQ2TFRWWmU1NzhkQjlL?=
 =?utf-8?B?TW9OU1RnRFBmV01pUkY5NWR4d1BPT0EvQ2JuVUhEQlJOYkM4Q2FxSXltMGZL?=
 =?utf-8?B?NldnbDN1NDVxcWgwTTFZdXlYcUlxSmFGcnNPRWxrTm9CNHg4QmtZUk1COEZG?=
 =?utf-8?B?TVVRMVFiVk1tU0JubDRrSlhzcjFOb2xLMXd0WmgyUEx4blM4cW5kbkFjTDAw?=
 =?utf-8?B?TnIxNlZhRm96dG4wQUU1bVhFdDR1UGpEYVVPZXJqTkV6cWxicUV4ZlVpSk8x?=
 =?utf-8?B?bTRmeUhmT3lpNjB2NXkrRmprUHFNa0hDTmRlR21KRE5DaGY5bjJ2c1NqOHN2?=
 =?utf-8?B?TFRBeTZhbWJxakx6RHhXbWtZOFhVb3lnRlFBTFBDZWVIRHlaLzRXbEdwUEpo?=
 =?utf-8?B?SmVQcksrRmQ0WTN0ZkVkQlY1cFEwUjFhdEJubTBDMXNLQ3dVZ1VoeG1HZnFK?=
 =?utf-8?B?UnpPcFZyZk9Uc2JVYkRvTFd5ZTN5MUNJdHZvWHV3QTR5RmNpb0NlOUVJaVlo?=
 =?utf-8?B?ZFNydElQWDMvbXhKTHBHaG93WFBocHQ3VHVkbkZMMDE4UC9YaU52Y05DL0FV?=
 =?utf-8?Q?NJC0HDK3LeM3pnni/o4/CMztKF3ol6XNBVHh4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bW1wS2RQZW8rblc5am90ZlVoYS9yUHJWMEZEMHRKRnFBblNYTEFjelN0ZGVX?=
 =?utf-8?B?bVBzeitGUVU3cC9oM0tMU2ZFZ1F2UFN1NWp2dkhtaE1FbmJJOENaQXMvWEdK?=
 =?utf-8?B?VGcwNEF0OC8rS0lCRmVkZ2dOdU1sUFNtVTdlV21waXcrK0xIMXJkbTZVMWdB?=
 =?utf-8?B?UzJZY0ZhbUxoMEg3akh2eEpoTzZybUFJSS80YUxobVJQSm82Q3lrcnI1aGZy?=
 =?utf-8?B?ZmNtQklneWVhZjlqdGxEWmRRemczVnFCa1o4SHd5NmdDRmxVb0lPL29MbUxz?=
 =?utf-8?B?K25VaitCLzB3bVdOcCtKUllIamVkZE1vNUhIUGJSM0pxcmEzOGdzTHdFdkRF?=
 =?utf-8?B?aXQrTHpaeUI3NzZwSW5TM3VaYlp2UzBzdTloaENlYmtaWW0vNWF5eG1waExp?=
 =?utf-8?B?TzZ1R0JETSs0MjBKd3lPT255TmVsVUNYM0ZPdUloK1Q1NWxqNkM1S1kvdHQr?=
 =?utf-8?B?cEZEb0pIZkZKOXNaNmJvRW5Ha2pjSXpDdXRORVV5WmFVZ2VLWWpydVQreEZv?=
 =?utf-8?B?N2Z3R1RGTUxJSFRQdVhQUGRLWGw0Q05Ja25udTZma1RITFAvR1laYWpSRU9W?=
 =?utf-8?B?UGNXbmF3MXp1SllCZkV0VTZicXNXR1h0bXNZSHIxLzE1VC93TTVxT0trWDkw?=
 =?utf-8?B?dldhd0hVdkFPUlAxRjUyMGdDbVk5MGg2c2x0M0ZoTjlLSkZTelZ0Z2orYXM3?=
 =?utf-8?B?U2p3RStWYzlRL3hITkphNUR1V2JWUzZqbVA2VmhOTlhoMzVEQVpEQnNXQi9t?=
 =?utf-8?B?WW9Vd1g2UTBQQ1JNMlJPdzM5b1RsVXBBaWJIQ1JXWDJnbEJ1SjI5NUlkTDNm?=
 =?utf-8?B?dHNkaWRKTGlTM3Z3a01TMWEzcFlFT2Rtekt3WjJKSlR6SlFHSXdhUStlUis3?=
 =?utf-8?B?MjBrTjJmaVR5elJReTVtNHF0dUxGcyt1cUpRMVpWMWJWUUI4Szh0STF3TWMv?=
 =?utf-8?B?R1ZpWVlZL0kzWVZwOVV2MHBnQ0VIYkp4UStWZ09sL2J2UzhuYVVOU1JPdnQ5?=
 =?utf-8?B?ZGxNaXRKaldvekV0dnVncHg3dmlSbFdPSmRiWURaQ1ltbGR4QUZib2VSQnBB?=
 =?utf-8?B?Zi9YTWRucXZSb0hYMGZsbk0vVzBGYWhMME8wQW5lUWN2cDJKNSttVEJHWnV2?=
 =?utf-8?B?TWdTSEo2Z2NrY0crVU8rY2ZYeHlJMHV3LzBGaERJcTIyNGttQjYzMSs2Y1hX?=
 =?utf-8?B?WHNseVFqL3BEdXdQRmhOL0VaWXVDK3hqL3hnNGtFcXVzem5MZUtnS0xKazJX?=
 =?utf-8?B?NzA4YURadUF5MUFYRHhKcjlsdmNjSW9pa3lvQmdvNHVBY21QWnQ5OFVWVFJ6?=
 =?utf-8?B?bnM2aUFkWGMwVGVqYTJWTlcrcU9IL1ZNK0d2UDlvVkNPMUFEZGRoTi9PUWpV?=
 =?utf-8?B?eld5RGhhdCtScW53d25EUEEwNlVaNC83ZTEvOEtGc2JUek8xdCtMYklYMDVT?=
 =?utf-8?B?b2g3a3BsbDA4eVA5SSthQTVUTVArSnNnYjZTemh3aUF2NWdWd1dpZ2VKZnFF?=
 =?utf-8?B?bGFiNGkyMkIwd3I0a2NPVWlBeVFDNWZxOU84aHQyS3FwYUxjV3lic21pTjli?=
 =?utf-8?B?MHhUd0t3L20vOGhldVAybEErK05aNWIyNHY1bUZPaEQvRjRuMXplVThidGZ6?=
 =?utf-8?B?dVllRnpKR2QvOWlJTVlhYVFCOEVEOW05Mms3T0JEL2lQWEs0dTBTL0dyTDB1?=
 =?utf-8?B?SmgwOEdLN1NKdmNSa3MrdHBxMGRoVW9IRDhNbGYrQy9ENi8xbnRNdEVqbWR1?=
 =?utf-8?B?NExLdjRJZloydGhtMlQvemtaNXlPcy9SUGcvZUZiemxiaTRaRDZla29rZ05x?=
 =?utf-8?B?dzZZcjdyNlBoeHVhMG5OUlgxcFpuNzhmM2ZsaGRONWRZQVRnMVg1bnFleTJu?=
 =?utf-8?B?OUJGNXRSTmJWazFVeFZCM2hhK1lXK0k4cnJGZzVzcW5KY3dnQnhHL0dOdWpy?=
 =?utf-8?B?OG9hTStqb3daLzBhaGxGZWg0MGszME5YSDF0TkV2RmZZRHNHcGR6cFcyVXh2?=
 =?utf-8?B?QlJRYmYzSEMyb0RMajBwR2pHS0NUZ0sycUdTeE9ka3VPRUpYemNPNStlQjhl?=
 =?utf-8?B?Qldqa1gyMlluK2wxb2hjU0JzbTJYSit5OWllU1JmdHhQcmhuclVrcVg5bVNG?=
 =?utf-8?B?Y1cyajFWaGdGT1FvNEYyczJpSnBEcUUyS2djTUpmS0NuYXlkUm9hM01rWHl3?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <112FD7E4DD78B54BB3C868AE7E774CF2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e56f1250-d6ff-4581-4e0d-08dc9657b5eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 03:17:43.7721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YxySmpKY02JDJ/cEWlfqVhOH8NxxfrQ0T8ipJEt6nNqTSUVNl/pD4tKljcANVWvUqZUDZ46NCaBsW1shJ4a+JuwJLj07VhO4ZT9a3wHaaK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8149

T24gV2VkLCAyMDI0LTA2LTI2IGF0IDEyOjQ5ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gQW0gMjYuMDYuMjQgdW0gMTA6MDUgc2NocmllYiBKYXNvbi1KSCBM
aW4gKOael+edv+elpSk6DQo+ID4gPiANCj4gPiA+ID4gSW4gdGhlIHN0ZXAgMyksIHdlIG5lZWQg
dG8gdmVyaWZ5IHRoZSBkbWEtYnVmIGlzIGFsbG9jYXRlZCBmcm9tDQo+ID4gPiA+ICJyZXN0cmlj
dGVkX210a19jbWEiLCBidXQgdGhlcmUgaXMgbm8gd2F5IHRvIHBhc3MgdGhlDQo+ID4gIHNlY3Vy
ZSBmbGFnDQo+ID4gPiA+ICBvcg0KPiA+ID4gPiBwcml2YXRlIGRhdGEgZnJvbSB1c2Vyc3BhY2Ug
dG8gdGhlIGltcG9ydCBpbnRlcmZhY2UgaW4gRFJNDQo+ID4gZHJpdmVyLg0KPiA+ID4gIA0KPiA+
ID4gV2h5IGRvIHlvdSBuZWVkIHRvIHZlcmlmeSB0aGF0Pw0KPiA+IA0KPiA+IEkgbmVlZCB0byBr
bm93IHRoZSBpbXBvcnRlZCBidWZmZXIgaXMgYWxsb2NhdGVkIGZyb20gcmVzdHJpY3RlZCBjbWEN
Cj4gPiBhbmQNCj4gPiBtYXJrIGl0IGFzIGEgc2VjdXJlIGJ1ZmZlciBpbiBtZWRpYXRlay1kcm0g
ZHJpdmVyLiBUaGVuLCBJIHdpbGwgYWRkDQo+ID4gc29tZSBjb25maWd1cmF0aW9uIHRvIHRoZSBo
YXJkd2FyZSBpZiB0aGUgYnVmZmVyIGlzIHNlY3VyZSBidWZmZXIsDQo+ID4gc28NCj4gPiB0aGF0
IGl0IGNhbiBnZXQgdGhlIHBlcm1pc3Npb24gdG8gYWNjZXNzIHRoZSBzZWN1cmUgYnVmZmVyLg0K
PiAgDQo+IFllYWggc28gZmFyIHRoYXQgbWFrZXMgc2Vuc2UuIFRoaXMgaXMgYmFzaWNhbGx5IHdo
YXQgb3RoZXIgZHJpdmVycyBkbw0KPiB3aXRoIHNlY3VyZSBidWZmZXJzIGFzIHdlbGwuDQo+IA0K
PiBCdXQgd2h5IGRvIHlvdSB3YW50IHRoZSBrZXJuZWwgdG8gdHJhbnNwb3J0IHRoYXQgaW5mb3Jt
YXRpb24/IFVzdWFsbHkNCj4gZHJpdmVycyBnZXQgdGhlIGluZm9ybWF0aW9uIGZyb20gdXNlcnNw
YWNlIHdoYXQgdG8gZG8gd2l0aCBhIGJ1ZmZlci4NCj4gDQo+IEluIG90aGVyIHdvcmRzIHRoZSBm
b3JtYXQsIHN0cmlkZSwgdGlsbGluZyBhbmQgYWxzbyBpZiBpdCdzIGEgc2VjdXJlDQo+IGJ1ZmZl
ciBvciBub3QgY29tZXMgZnJvbSB1c2Vyc3BhY2UuDQo+IA0KDQpUaGFua3MgZm9yIHlvdXIgY2xl
YXIgZXhwbGFuYXRpb24uDQpJIHRoaW5rIHRoaXMgaXMgd2hhdCBJIHdhbnQsIGJ1dCBJIGNhbid0
IGZpbmQgYW55IERSTSBpbnRlcmZhY2UgdG8gcGFzcw0KdGhlIHNlY3VyZSBmbGFnIGZyb20gdXNl
cnNwYWNlLg0KDQo+IFdoYXQgdGhlIGhhcmR3YXJlIHVzdWFsbHkgaGFuZGxlcyBpbnRlcm5hbGx5
IGlzIHRoaW5ncyBsaWtlDQo+IGVuY3J5cHRpb24ga2V5cywgYnV0IHlvdSBldmVudHVhbGx5IGdl
dCB0aGUgaW5mb3JtYXRpb24gd2hlcmUgdG8gbG9vaw0KPiBmb3IgdGhlIGtleSBmcm9tIHVzZXJz
cGFjZSBhcyB3ZWxsLg0KPiANCj4gSGFuZGxpbmcgaW5zaWRlIHRoZSBrZXJuZWwgd291bGQgb25s
eSBiZSBuZWNlc3NhcnkgaWYgdXNlcnNwYWNlIGNvdWxkDQo+IGZvciBleGFtcGxlIGNyYXNoIHRo
ZSBzeXN0ZW0gd2l0aCBpbnZhbGlkIHBhcmFtZXRlcnMuIEJ1dCBmb3INCj4gZW5jcnlwdGlvbiB0
aGF0IGlzIHVzdWFsbHkgbm90IHRoZSBjYXNlLg0KPiANCg0KWWVzLCB0aGF0J3MgdHJ1ZS4NCg0K
PiA+ID4gDQo+ID4gPiA+IFNvIEkgY2FuIG9ubHkgdmVyaWZ5IGl0IGxpa2UgdGhpcyBub3c6DQo+
ID4gPiA+IHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqbXRrX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFi
bGUoc3RydWN0DQo+ID4gPiA+IGRybV9kZXZpY2UNCj4gPiA+ID4gKmRldiwgc3RydWN0IGRtYV9i
dWZfYXR0YWNobWVudCAqYXR0YWNoLCBzdHJ1Y3Qgc2dfdGFibGUgKnNnKQ0KPiA+ID4gPiB7DQo+
ID4gPiA+ICAgICBzdHJ1Y3QgbXRrX2dlbV9vYmogKm10a19nZW07DQo+ID4gPiA+IA0KPiA+ID4g
PiAgICAgLyogY2hlY2sgaWYgdGhlIGVudHJpZXMgaW4gdGhlIHNnX3RhYmxlIGFyZSBjb250aWd1
b3VzICovDQo+ID4gPiA+ICAgICBpZiAoZHJtX3ByaW1lX2dldF9jb250aWd1b3VzX3NpemUoc2cp
IDwNCj4gPiAgYXR0YWNoLT5kbWFidWYtPnNpemUpIHsNCj4gPiA+ID4gICAgICAgICBEUk1fRVJS
T1IoInNnX3RhYmxlIGlzIG5vdCBjb250aWd1b3VzIik7DQo+ID4gPiA+ICAgICAgICAgcmV0dXJu
IEVSUl9QVFIoLUVJTlZBTCk7DQo+ID4gPiA+ICAgICB9DQo+ID4gPiA+ICAgICBtdGtfZ2VtID0g
bXRrX2dlbV9pbml0KGRldiwgYXR0YWNoLT5kbWFidWYtPnNpemUpOw0KPiA+ID4gPiAgICAgaWYg
KElTX0VSUihtdGtfZ2VtKSkNCj4gPiA+ID4gICAgICAgICByZXR1cm4gRVJSX0NBU1QobXRrX2dl
bSk7DQo+ID4gPiA+IA0KPiA+ID4gPiArICAgbXRrX2dlbS0+c2VjdXJlID0gKCFzdHJuY21wKGF0
dGFjaC0+ZG1hYnVmLT5leHBfbmFtZSwNCj4gPiA+ID4gICJyZXN0cmljdGVkIiwNCj4gPiA+ID4g
MTApKTsNCj4gPiA+ID4gICAgIG10a19nZW0tPmRtYV9hZGRyID0gc2dfZG1hX2FkZHJlc3Moc2ct
PnNnbCk7DQo+ID4gPiA+ICAgICBtdGtfZ2VtLT5zaXplID0gYXR0YWNoLT5kbWFidWYtPnNpemU7
DQo+ID4gPiA+ICAgICBtdGtfZ2VtLT5zZyA9IHNnOw0KPiA+ID4gPiANCj4gPiA+ID4gICAgIHJl
dHVybiAmbXRrX2dlbS0+YmFzZTsNCj4gPiA+ID4gfQ0KPiA+ID4gIA0KPiA+ID4gQ29tcGxldGUg
TkFLIGZyb20gbXkgc2lkZSB0byB0aGF0IGFwcHJvYWNoLiBJbXBvcnRpbmcgb2YgYSBETUEtDQo+
ID4gYnVmDQo+ID4gPiBzaG91bGQgYmUgaW5kZXBlbmRlbnQgb2YgdGhlIGV4cG9ydGVyLg0KPiA+
ID4gDQo+ID4gPiBXaGF0IHlvdSBjb3VsZCBkbyBpcyB0byBwcm92aWRlIHRoZSBzZWN1cmUgYnVm
ZmVyIGZyb20gYSBkZXZpY2UNCj4gPiBhbmQNCj4gPiA+IG5vdCBhIGRldmljZSBoZWFwLg0KPiA+
ID4gDQo+ID4gDQo+ID4gWW91IG1lYW4gSSBzaG91bGQgYWxsb2NhdGUgYnVmZmVyIGluIG1lZGlh
dGUtZHJtIGRyaXZlciBub3QNCj4gPiB1c2Vyc3BhY2U/DQo+ICANCj4gV2VsbCB0aGF0IGRlcGVu
ZHMuIFRoZSBxdWVzdGlvbiBpcyBpZiB5b3UgaGF2ZSBtdWx0aXBsZSBkcml2ZXJzIHdoaWNoDQo+
IG5lZWRzIHRvIHdvcmsgd2l0aCB0aGlzIHNlY3VyZSBidWZmZXI/DQo+IA0KPiBJZiB5ZXMgdGhl
biB5b3Ugc2hvdWxkIGhhdmUgYSBnZW5lcmFsIGFsbG9jYXRpb24gaGVhcCBmb3IgaXQuIElmIG5v
DQo+IHRoZW4gdGhlIGJ1ZmZlcnMgY291bGQgYXMgd2VsbCBiZSBhbGxvY2F0ZWQgZnJvbSB0aGUg
ZHJpdmVyIGludGVyZmFjZQ0KPiBkaXJlY3RseS4NCj4gDQoNClllcywgdGhpcyBidWZmZXIgbmVl
ZHMgd29yayB3aXRoIEdQVSBhbmQgRFJNIGRyaXZlcnMsIHNvIHRoaXMgZ2VuZXJhbA0KInJlc3Ry
aWN0ZWRfbXRrX2NtYSIgd2lsbCBhbGxvY2F0ZWQgaW4gdXNlcnNwYWNlLCB0aGVuIGJlaW5nIHBh
c3NlZCB0bw0KR1BVIGFuZCBEUk0uDQoNCj4gPiBJIGp1c3QgaGF2ZSBtb2RpZmllZCB0aGlzIHRv
IHVzZXJzcGFjZSBieSB0aGUgY29tbWVudCBoZXJlOg0KPiA+IA0KPiA+IA0KaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQwNDAzMTAy
NzAxLjM2OS0zLXNoYXduLnN1bmdAbWVkaWF0ZWsuY29tLyMyNTgwNjc2Ng0KPiA+IA0KPiA+ID4g
PiBJIHRoaW5rIEkgaGF2ZSB0aGUgc2FtZSBwcm9ibGVtIGFzIHRoZSBFQ0NfRkxBRyBtZW50aW9u
IGluOg0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1tZWRpYS8yMDI0MDUxNS1kbWEtYnVmLWVjYy1oZWFwLXYxLTAtNTRjYmJkMDQ5NTExQGtl
cm5lbC5vcmcvDQo+ID4gPiA+IA0KPiA+ID4gPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0
byBoYXZlIHRoZSB1c2VyIGNvbmZpZ3VyYWJsZQ0KPiA+IHByaXZhdGUNCj4gPiA+ID4gaW5mb3Jt
YXRpb24gaW4gZG1hLWJ1Ziwgc28gYWxsIHRoZSBkcml2ZXJzIHdobyBoYXZlIHRoZSBzYW1lDQo+
ID4gPiA+IHJlcXVpcmVtZW50IGNhbiBnZXQgdGhlaXIgcHJpdmF0ZSBpbmZvcm1hdGlvbiBmcm9t
IGRtYS1idWYNCj4gPiAgZGlyZWN0bHkNCj4gPiA+ID4gYW5kDQo+ID4gPiA+IG5vIG5lZWQgdG8g
Y2hhbmdlIG9yIGFkZCB0aGUgaW50ZXJmYWNlLg0KPiA+ID4gPiANCj4gPiA+ID4gV2hhdCdzIHlv
dXIgb3BpbmlvbiBpbiB0aGlzIHBvaW50Pw0KPiA+ID4gIA0KPiA+ID4gV2VsbCBvZiBoYW5kIEkg
ZG9uJ3Qgc2VlIHRoZSBuZWVkIGZvciB0aGF0Lg0KPiA+ID4gDQo+ID4gPiBXaGF0IGhhcHBlbnMg
aWYgeW91IGdldCBhIG5vbi1zZWN1cmUgYnVmZmVyIGltcG9ydGVkIGluIHlvdXINCj4gPiBzZWN1
cmUNCj4gPiA+IGRldmljZT8NCj4gPiANCj4gPiBXZSB1c2UgdGhlIHNhbWUgbWVkaWF0ZWstZHJt
IGRyaXZlciBmb3Igc2VjdXJlIGFuZCBub24tc2VjdXJlDQo+ID4gYnVmZmVyLg0KPiA+IElmIG5v
bi1zZWN1cmUgYnVmZmVyIGltcG9ydGVkIHRvIG1lZGlhdGVrLWRybSBkcml2ZXIsIGl0J3MgZ28g
dG8NCj4gPiB0aGUNCj4gPiBub3JtYWwgZmxvdyB3aXRoIG5vcm1hbCBoYXJkd2FyZSBzZXR0aW5n
cy4NCj4gPiANCj4gPiBXZSB1c2UgZGlmZmVyZW50IGNvbmZpZ3VyYXRpb25zIHRvIG1ha2UgaGFy
ZHdhcmUgaGF2ZSBkaWZmZXJlbnQNCj4gPiBwZXJtaXNzaW9uIHRvIGFjY2VzcyB0aGUgYnVmZmVy
IGl0IHNob3VsZCBhY2Nlc3MuDQo+ID4gDQo+ID4gU28gaWYgd2UgY2FuJ3QgZ2V0IHRoZSBpbmZv
cm1hdGlvbiBvZiAidGhlIGJ1ZmZlciBpcyBhbGxvY2F0ZWQgZnJvbQ0KPiA+IHJlc3RyaWN0ZWRf
bXRrX2NtYSIgd2hlbiBpbXBvcnRpbmcgdGhlIGJ1ZmZlciBpbnRvIHRoZSBkcml2ZXIsIHdlDQo+
ID4gd29uJ3QNCj4gPiBiZSBhYmxlIHRvIGNvbmZpZ3VyZSB0aGUgaGFyZHdhcmUgY29ycmVjdGx5
Lg0KPiAgDQo+IFdoeSBjYW4ndCB5b3UgZ2V0IHRoaXMgaW5mb3JtYXRpb24gZnJvbSB1c2Vyc3Bh
Y2U/DQoNCkFzIEkgbWVudGlvbmVkIGhlcmU6IA0KDQpodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvY292ZXIvMjAyNDA1MjUyMzI5MjguNTUyNC0xLWph
c29uLWpoLmxpbkBtZWRpYXRlay5jb20vIzI1ODg2NDg4DQoNCkkgdHJpZWQgc29tZSBEUk0gaW50
ZXJmYWNlcyB1c2luZyBidWZmZXIgRkQgYW5kIGFyZy0+ZmxhZyBhcw0KcGFyYW1ldGVycywgYnV0
IGl0IGRpZG4ndCB3b3JrLiBTbyBJIGFzayBmb3IgeW91ciBoZWxwIGhlcmUuDQoNCkJ1dCBJIHRo
aW5rIEkgc2hvdWxkIGZpbmQgRFJNIG1haW50YWluZXIgdG8gYWRkIHRoZSBzZWN1cmUgZmxhZyB0
byBEUk0NCmludGVyZmFjZSBub3cuDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg==

