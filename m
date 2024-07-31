Return-Path: <linux-media+bounces-15602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CD39425FC
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 07:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77E4628173E
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 05:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B7C5C603;
	Wed, 31 Jul 2024 05:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kktcw1gQ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="HF9YN5Vl"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DB91304BF;
	Wed, 31 Jul 2024 05:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722404923; cv=fail; b=n3R6LGHw8QWj3+6pcMQkmgkCsqEqpsTkZo1IRsjkOPD02hUXPA9trRt/7ELZkUEQ2mII5Pr7VJVFcomiPQ0zus9vpa6PGuihgGJjj7/MSA3qrkIDIV10daut7dR+APq05qJy9l7E/v0OJMvsDHVBY3U5wGwpAyj88cyX8QqP1HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722404923; c=relaxed/simple;
	bh=93PjbM29SCElMrgUHkL2i+Kztonaa4HOnBj9VTxRb9g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SChVgrSAI/ZDfjti0hDw0qK83s3t7icL5tPpjQ3/Y3k0Sctiw/O6bYryB4kdUDfqLtxp3zyWg35gTrYctg5C2Hxl97Z8Zhs/zR3Fst/pYmP4cBoRlesaO3iKq2H5uXxQ+P4YTZc7OnM2H5iUrQd7h9mPAYgXX5peBKvixwry+Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kktcw1gQ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=HF9YN5Vl; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 862e624e4f0011ef87684b57767b52b1-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=93PjbM29SCElMrgUHkL2i+Kztonaa4HOnBj9VTxRb9g=;
	b=kktcw1gQbn97XJKCMAaZIJLzSfHhuNYIH+l6vvvEti6JMLw+nJoajpfof/vamIbx3b9X3cMke0snyB1apZ1c6LL2l9XMsrXkwJ3GTwxNJeFUok91YAApH3bhAXMhOfr9xG4cwCE0IZAON9w0najvM/sRYjsCiT+Skfs0+28Ii5E=;
X-CID-CACHE: Type:Local,Time:202407311314+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:54036592-3a47-43ec-95b5-724944a543dd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:1d7ff7d5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 862e624e4f0011ef87684b57767b52b1-20240731
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2146234911; Wed, 31 Jul 2024 13:48:34 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jul 2024 13:48:35 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jul 2024 13:48:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUKr7zjEf73nFRo83nvKjbmrg/7D8e6KMgMdSo54KQoi3guE0GIcvNa5TQ0Y6dJQEKQLTLbII7S0/ElSuh83/vbO55QwOIke335DzZUFYEM4l01NJCflmxHZh9BVLGPDyq81Ogx93WFhWd9l91QBWRQzZum30rSn0MW9eJCQ0flFXlvGVKdaUoLE4Q5rUo/kxerK714FHUkf9F5HP1sMN6V2Xyi4uhgAOoNTKoo3T4aimlFuFyKVr0Fb0TjHl3RTTWAgxNZeZmcAR8XNvINovQrJCl5k39hFz5+8ddpPrObwWPaBxBs+GSJ43feCueMZ7kwKeOrEG5cOpjmcl4hzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93PjbM29SCElMrgUHkL2i+Kztonaa4HOnBj9VTxRb9g=;
 b=XzKw5HZi4hz/fo26tAvBT0WyQ79zvLVAsGWBh8QB04XSoplUvEWLc+B4o4zAiyPHGS/DQTtRB1oEEv9SIe2lk6nR74IAZILgJwSQQWXwHZyzGXQ1TuodeJ7GjEzC6sjZYo1MVbLjg5h51VnE07hnd9djtCvFJnjtvvQHIcoCF6ZiGX4WcWSSrnT//1TRzQBNFyXhES7BlhYNK9SPWD6mtB0lbJBm4VPFwUqtLYQUgjrKbt8/lL3mrYL6wIOq+l2PeofeKi0xwZ2otB5/+cR8BlQ7kDb/QhaU+I5GXIMgQaAzniU/fzC0tTSNDcNTeV8AYOczoV/7R+b5V7XRYMsJsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93PjbM29SCElMrgUHkL2i+Kztonaa4HOnBj9VTxRb9g=;
 b=HF9YN5VlTGVl2ID4DUU12/loiW2rfuRTB4ebbg9iack4jrDej9QA4u5s6o3EEojHxA34y8LfT1NaDoShYa8YjaC4/Wg/OLJUVbCcqHpeQuuheUNfn3dhDujGqLj28CY+1QjX1NfFHVyKQo9KrYQKRnHQPmwpjGHY4tLUEj0PXeI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8591.apcprd03.prod.outlook.com (2603:1096:405:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 05:48:32 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 05:48:32 +0000
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
Subject: Re: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Index: AQHa4ce8pNnPk1UzTUirk9/L9Gb6lbIQVvyA
Date: Wed, 31 Jul 2024 05:48:32 +0000
Message-ID: <52112636992bd050bb26c3be4235ecdeb1f3ac46.camel@mediatek.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
	 <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8591:EE_
x-ms-office365-filtering-correlation-id: 48018ca1-ce15-4483-fcc3-08dcb124695d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eVpRdUQ2SUttWWU3NlRhKy9DdXNnZ1FzUDVidm10aXdTR1Y4eUs1YzJJM2RX?=
 =?utf-8?B?cWZxNUtmRG1YNERWL2htWU1lOVNnN1VEb2FUamZ0MGN0aFVEUVc3VG9KRUIv?=
 =?utf-8?B?OUlsVlFVeTFNbG5VUHJCaUxwVklHSEd5UHR3YjNIMEozVDFSZHJyWVBENWh3?=
 =?utf-8?B?QzNsUGw0azNXbjRIaS9UK29LSS85dE5mUzM1amwyd1hmcFdGcitLbVVpcS9U?=
 =?utf-8?B?MFlzbnJLUHR0SWpBVEVXOHFFWmZLVjBwUlovUXVGWVF2YzJaejlRM1hZMTNu?=
 =?utf-8?B?RWNRbUVPZlJMcXZrRk90U1ZqOFdmYmJFZnM1NmoyTW01OEJLdG9FWGtvaWw0?=
 =?utf-8?B?S2FxcWFlNEJzM1IxaC9XWXZSaUtDbENEamZTVUoyTFlXaWxlejJMVEdYamd4?=
 =?utf-8?B?bjNLKzJkU1JYUjh2dGVZNG9wQ1JOY2pyZ1F5dmg0bmg4SEtpMWJlWHhsTkpE?=
 =?utf-8?B?ZHc0WWorNkNKSW5WWDB3bi90U2QxUyt6eVZWZ0o4cWRoRUU4Vk95Yk9ObGxB?=
 =?utf-8?B?Wk8yY0NUVXhXRzRYMnVodmRkRitQSVlnMGxaMGxGQ0ZUK0ZHTms5UHJ4OEtN?=
 =?utf-8?B?cXVJMElyeHFhMUQ1dnE0OGtBUzBzT1p1UkVmNnJUbGVRZ3RxL05DbU5xcjds?=
 =?utf-8?B?ZUE3czZ2L3FzdjEvTTZFOC9tSDgwOExXU0pqSjMxRDh6Y2Jma2JwR2ZvRDRx?=
 =?utf-8?B?TTEyblBtbElYOWpUbjc2dmRLbHhRTldld0VSVzNKLzBVaGtOZDdVTkxoMjFv?=
 =?utf-8?B?RDh6UHMycnRzZjcwZE9pZXo0OGQ2NGR0bDlUNVlwcFRLd1FRMzkvZ21MMEJH?=
 =?utf-8?B?bVhLanJGZDFRM3hJcFpsM3UxQlJYTllCSktwU1I5NTRpZXFXMWpmTVhDN0hH?=
 =?utf-8?B?V2h2NHZ2YUhDZ2lBYXpYSkNKQWwvUUd1Y0U0ZlFXVmYzMlRRODV0cGVlRDk5?=
 =?utf-8?B?R2JuK045b1VuL3VUWkwzT1VnVW8zK3hzcEEvSEdoSFpwTVZlS0tXcExENHFL?=
 =?utf-8?B?WEovOVI0Z0lTeE50bWd6U0Z2S1JCdFR4dndCQ3czbWo1cVBhWXJiSU5WNXBG?=
 =?utf-8?B?TzU3djFSNDNLMEF0dXJ3TnRRTHFoQ1ArYzdTUDNnanB2WHM2Q04wOXA0VHdO?=
 =?utf-8?B?amJ0MlBDZHFMV0RhR01NNkFGdnhHckllVXFaMVltQmtBV3JYTlpkSHUzclVC?=
 =?utf-8?B?N3lQMnV0UnpOZzh3Ukd6WGZNMThhbHdiRWlhY0c2VEN2MkdWM1BZanQrbzBt?=
 =?utf-8?B?eStrd1pxZEh6bXoyZmxvYjRSZG81RlVrY2J3THlNWitJSEdZYVBRSUZydVNC?=
 =?utf-8?B?MDdYM1dTTnc5ZG5BT0JFVG4rVVRYMlRNbXFPV0xUN3hCRTkxSWxxSTVYOVMr?=
 =?utf-8?B?YjRWNkJzTzNXRTd3V0d5a1lkZTRwUlUxaDFhYnJGUEphb2dYRTUwMU54d2M0?=
 =?utf-8?B?eFFKUS9HZE9QdVdQUFpsR3FjSVJQWjg0cCtRT1pGTTg3SkczRTEvOUFqL3hU?=
 =?utf-8?B?UG9NcnJlUmNWN3ROZzgwckJMeHVtMVQ4VFMvZUxOT0tGMS9LdnFJQnhGSkFQ?=
 =?utf-8?B?OU0yRUlrL2RtSFNiZ0UxMmpaN2xNam1vWmNUa3ljT2s1aHNtRmN3NU80QnZs?=
 =?utf-8?B?QUNFa1ZUZnJQOGxZMHFubzZpZVp4NC9TMURvTHlWeGVyY2doS1k3eHNiWjhv?=
 =?utf-8?B?aXExZUh1eUNmTHprZlRFb3A4NWZpcnQ2MjRjWmgvTTJwSXA4VEFMeU9qRUEy?=
 =?utf-8?B?R2ZQYUJtZ0I4UEJQM3o2T2pubVJYODVwd1RWc21ud3hHSFZXdWVoMUxrL3RR?=
 =?utf-8?B?eFdQRzBIeENOYXF2ZVh3Vk94NTdlNkVPbzdLSkZNaUMydmpaQUVyeGowbExT?=
 =?utf-8?B?R1ZLUDJZc0xzUUc4ZFJrb1RtQjR2VXl0elg5MVRvYlhVZHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eExOYnNTM3dXVFBJUUw5Zi9sQzVyNmF4ZGF4dkJPQlliWHFGSFBvL0hGb290?=
 =?utf-8?B?cDBrYVZ5SFY0S0VpRFpDSGlIWXpTYitxVGVvblJTaHJXTCtvSEdYMjBPNytR?=
 =?utf-8?B?ajRPQVlnZHVoR3MvK3puVHk4cldPUkxLbWdFUXozNVlXWlgzR0RlbDRhMlFU?=
 =?utf-8?B?RjBnRnRUcDNZRGozL2wzaTNvaUhKZysyOXc1bmwyNzRGVWhVMFJmQUlDOEVB?=
 =?utf-8?B?OHdQZXErYzVxRmRPdGRFSDA3aGlTcnl5bmxVNXl2MjArMC9tYlRGOEJJWUw3?=
 =?utf-8?B?U1JVT0ljMS9yRU9yQzBPRTdGQnNzc1hxVjd0QkU4Z2ZnazcyLzJtZ3A2VzQz?=
 =?utf-8?B?TitYaXVwdS9aMTN1Z2pmZEdwSnA1SmVCZHJWb0loVXZreWRUSmJ3Sm1Rc1Bw?=
 =?utf-8?B?VFhydTk5bU1jdG1nVGtNRDFVQ2dvM0t3bTRVY2NEWFFENTdnTzdYc0ZEQ09l?=
 =?utf-8?B?WXBwQUhuQmhIOEsrRmhSVFY3UDl5c1NKNWkxYkJxMVBjemE4QytNTUVjMmhM?=
 =?utf-8?B?T05ubnZOS1ZaaGJyN1pSWXU2czdPL2VKNHp2UEpVS2FnL0hNZTNjRkcwdUNQ?=
 =?utf-8?B?T05qQkw1SjVGUjZhZ1Erc0xkVnVFeTFYTmRYek5uUU0yd3VTREJhS1ZmUGNT?=
 =?utf-8?B?NUJTQmtDc3ZlMU00czlaQ0kxSlNVSkZTVDBTaTJYZjdQU0hVTjVVMGxVdjRo?=
 =?utf-8?B?R1dmYzl5d01WQzRGK1BqUnhxWU1Xb2V1dGs2SmtTSjlBcTJtM1c0d2lFV1NS?=
 =?utf-8?B?ZVdVMWFSUTU3bUdxSmY1eU92RjA2TGtNSG1hLzF0dUQ0RnlQcjNmaWtXTnpo?=
 =?utf-8?B?a0Mzb3h5emh1czlLbGxxRVR4M081blQ0aHNOZDVYTEVOak9TUHZnSGVQTXRF?=
 =?utf-8?B?dDVXMDcraDZCbnQ0UHhVamRqc0s1eGtrT1QySG5KQnVicnRpRjV3MlYwNExo?=
 =?utf-8?B?K2FQWlVGeVhMc0xpeVJSc1BYSU5Ka3o3UzdCYk9XMENKcE5MdEsvUUphUnN5?=
 =?utf-8?B?Q0xJbWdHVHZ6STRycUxpZ09zbzBtbjNzM3RXOXdYMU5US0NFdkN4Smd6Sy9F?=
 =?utf-8?B?emRDSTVoM3NSay8yTVAvWUNTNHdGcjRyd1U1ek5TZDBOcSs0UncxaUVTeGFE?=
 =?utf-8?B?NWNxOW1kdUM3MnplaFNlSk1XbjJ2TlQzOER1YzBVMS9nNWNmV1VJUjIraUVR?=
 =?utf-8?B?WkRjMWhoYU5DL2lyQ2NkYnI0YkNLaFRnWmtOM3h3bEQyc0RBWmRTaGpCR3Bm?=
 =?utf-8?B?MzBsVzBQUjlHYWpaTDRSMnU4QWpNYmQwcFNCQ0pWUi9WZ1VQa1F5OEpWUDY2?=
 =?utf-8?B?OFZmRHoxQVdoY3N5ZUwzemcyQ2M3RHhyYmYzdHVxUkNoNE5PdDdQb0MzTkhn?=
 =?utf-8?B?R0hBNUg4M0VJb1BXZzZGWlpxOUZWb3dMdHY3Z2RPeWhZMXh6WFlYNGZiQVNO?=
 =?utf-8?B?VkRoZ29TNGJlNzJTQk5ra1pRZW9SWHBKNis0QWFmdmNnbU1OYkFCZDhRUlVx?=
 =?utf-8?B?dk5acmxhZGkrK2w1QlEvUm1sY1U3QkRValp1YUVWdWg4TVdwcjJTeXBwMGxB?=
 =?utf-8?B?Z3FtQklkMVQ1V1pWVlZCS29lcjNHZkdCQ0hDUzErUGR6WTkwdjgrVkVYL05j?=
 =?utf-8?B?WXBkYmpwMlNUUjhFRWcxQi85N3hUeVQvdCtKSXZMUHBoTGhuQ3ZUTmVkZzI1?=
 =?utf-8?B?Wi9QK2U3TFhuM0tYZTdNOFVsRFZnM3ZFeHFqa2t1MFFVanczcG5nWkVIalVm?=
 =?utf-8?B?ZWI3dS9VcEZkT01rbVo5V1VNMGpXZnpGNTljY2xBWUhoZzdpM285K3E5OXkz?=
 =?utf-8?B?cEV6NHJxRU9qU0tFM2R1Y1U4SXdnakwwZ0NmTWFyRXFMYldTeFFOc2tCOU5I?=
 =?utf-8?B?NU8wY2xxZUJPaVMvNlpwQmlPNHpIUWl0bHFiQXk5WEh4YWlKa1BHc0xHZjVN?=
 =?utf-8?B?dWIvTHhJbkdjamdFdTdjejlUcE51QWVSYStKcm9GUmc4eUg5ZVhjbjFFcWRt?=
 =?utf-8?B?Q2xTVTZQZGpnNjJ4T2cvOXdXM0JGa3BTTCtldHJ6KzUwbzZKWFNSS2p5UDIr?=
 =?utf-8?B?MDlraE93Z2FJbmN6bTdkWER1RlhaZU1wWVdTMzI3SDZZdVRMWFVXcVBNTFhN?=
 =?utf-8?Q?LLZQBaE2Gykg13or5DR4ekelT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3C414527173B04DB86C898B32276C18@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48018ca1-ce15-4483-fcc3-08dcb124695d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 05:48:32.4420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 91ODAVvXOLfO/DhM8Xzfl+6sc4SLRKy0yjH+v4Yv4tIZ3GQlPA1+8v7tNHX+tukk+LT72IuZmOe0Xg4R+ILTfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8591

SGksIEp1bGllbjoNCg0KT24gTW9uLCAyMDI0LTA3LTI5IGF0IDE2OjQ4ICswMjAwLCBKdWxpZW4g
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
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tZWRpYXRlay9pc3AvaXNwXzMwL2NhbXN2L210a19jYW1zdjMwX3JlZ3MuaCBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvaXNwL2lzcF8zMC9jYW1zdi9tdGtfY2Ft
c3YzMF9yZWdzLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAw
Li42ZDMwMDg3MjcwY2MNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL2lzcC9pc3BfMzAvY2Ftc3YvbXRrX2NhbXN2MzBfcmVncy5oDQo+IEBA
IC0wLDAgKzEsNjAgQEANCj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICov
DQo+ICsvKg0KPiArICogQ29weXJpZ2h0IChjKSAyMDIyIE1lZGlhVGVrIEluYy4NCj4gKyAqLw0K
PiArDQo+ICsjaWZuZGVmIF9fTVRLX0NBTVNWMzBfUkVHU19IX18NCj4gKyNkZWZpbmUgX19NVEtf
Q0FNU1YzMF9SRUdTX0hfXw0KPiArDQo+ICsvKiBDQU1TViAqLw0KPiArI2RlZmluZSBDQU1TVl9N
T0RVTEVfRU4weDAwMDANCj4gKyNkZWZpbmUgQ0FNU1ZfTU9EVUxFX0VOX0lNR09fRU5CSVQoNCkN
Cj4gKyNkZWZpbmUgQ0FNU1ZfRk1UX1NFTDB4MDAwNA0KPiArI2RlZmluZSBDQU1TVl9JTlRfRU4w
eDAwMDgNCj4gKyNkZWZpbmUgQ0FNU1ZfSU5UX1NUQVRVUzB4MDAwYw0KPiArI2RlZmluZSBDQU1T
Vl9TV19DVEwweDAwMTANCj4gKyNkZWZpbmUgQ0FNU1ZfSU1HT19GQkMweDAwMUMNCj4gKyNkZWZp
bmUgQ0FNU1ZfQ0xLX0VOMHgwMDIwDQo+ICsjZGVmaW5lIENBTVNWX1BBSzB4MDAzYw0KPiArDQo+
ICsvKiBDQU1TVl9URyAqLw0KPiArI2RlZmluZSBDQU1TVl9UR19TRU5fTU9ERTB4MDAxMA0KPiAr
I2RlZmluZSBDQU1TVl9UR19WRl9DT04weDAwMTQNCj4gKyNkZWZpbmUgQ0FNU1ZfVEdfU0VOX0dS
QUJfUFhMMHgwMDE4DQo+ICsjZGVmaW5lIENBTVNWX1RHX1NFTl9HUkFCX0xJTjB4MDAxYw0KPiAr
I2RlZmluZSBDQU1TVl9UR19QQVRIX0NGRzB4MDAyMA0KPiArDQo+ICsvKiBDQU1TVl9JTUcwICov
DQo+ICsjZGVmaW5lIENBTVNWX0lNR09fU1ZfQkFTRV9BRERSMHgwMDAwDQo+ICsjZGVmaW5lIENB
TVNWX0lNR09fU1ZfWFNJWkUweDAwMDgNCj4gKyNkZWZpbmUgQ0FNU1ZfSU1HT19TVl9ZU0laRTB4
MDAwYw0KPiArI2RlZmluZSBDQU1TVl9JTUdPX1NWX1NUUklERTB4MDAxMA0KPiArI2RlZmluZSBD
QU1TVl9JTUdPX1NWX0NPTjB4MDAxNA0KPiArI2RlZmluZSBDQU1TVl9JTUdPX1NWX0NPTjIweDAw
MTgNCj4gKw0KPiArI2RlZmluZSBDQU1TVl9UR19TRU5fTU9ERV9DTU9TX0VOQklUKDApDQo+ICsj
ZGVmaW5lIENBTVNWX1RHX1ZGX0NPTl9WRkRBVEFfRU5CSVQoMCkNCj4gKw0KPiArLyogQ0FNU1Zf
Q0xLX0VOIGJpdHMgKi8NCj4gKyNkZWZpbmUgQ0FNU1ZfVEdfRFBfQ0xLX0VOQklUKDApDQo+ICsj
ZGVmaW5lIENBTVNWX1BBS19EUF9DTEtfRU5CSVQoMikNCj4gKyNkZWZpbmUgQ0FNU1ZfRE1BX0RQ
X0NMS19FTkJJVCgxNSkNCj4gKw0KPiArLyogQ0FNU1ZfU1dfQ1RMIGJpdHMgKi8NCj4gKyNkZWZp
bmUgQ0FNU1ZfSU1HT19SU1RfVFJJR0JJVCgwKQ0KPiArI2RlZmluZSBDQU1TVl9JTUdPX1JTVF9T
VEJJVCgxKQ0KPiArI2RlZmluZSBDQU1TVl9TV19SU1RCSVQoMikNCj4gKw0KPiArLyogSVJRIEJJ
VFMgKi8NCj4gKyNkZWZpbmUgQ0FNU1ZfSVJRX1RHX0VSUkJJVCg0KQ0KPiArI2RlZmluZSBDQU1T
Vl9JUlFfVEdfR0JFUlJCSVQoNSkNCj4gKyNkZWZpbmUgQ0FNU1ZfSVJRX1BBU1MxX0RPTkJJVCgx
MCkNCj4gKyNkZWZpbmUgQ0FNU1ZfSVJRX0lNR09fRVJSQklUKDE2KQ0KPiArDQo+ICsjZGVmaW5l
IElOVF9TVF9NQVNLX0NBTVNWICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXA0KPiArKENBTVNWX0lSUV9QQVNTMV9ET04pDQo+ICsNCj4gKyNkZWZp
bmUgSU5UX1NUX01BU0tfQ0FNU1ZfRVJSICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcDQo+ICsoQ0FNU1ZfSVJRX1RHX0VSUiB8IENBTVNWX0lSUV9UR19H
QkVSUiB8IENBTVNWX0lSUV9JTUdPX0VSUikNCj4gKw0KPiArI2VuZGlmIC8qIF9fTVRLX0NBTVNW
MzBfUkVHU19IX18gKi8NCg0KbXRrX2NhbXN2MzBfcmVncy5oIGhhcyBmZXcgZGF0YSBhbmQgb25s
eSBpbmNsdWRlZCBieSBtdGtfY2Ftc3YzMF9ody5jLA0Kc28gaXQncyBiZXR0ZXIgbWVyZ2UgdGhp
cyBoZWFkZXIgZmlsZSBpbnRvIG10a19jYW1zdjMwX2h3LmMuDQoNClJlZ2FyZHMsDQpDSw0KDQo+
IA0KPiANCg==

