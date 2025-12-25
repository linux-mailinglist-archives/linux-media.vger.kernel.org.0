Return-Path: <linux-media+bounces-49521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43728CDD687
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 08:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB9363018D6A
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 07:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621642EF67A;
	Thu, 25 Dec 2025 07:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KEPI4AAP";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="mJ3+bYbc"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA60841C72;
	Thu, 25 Dec 2025 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766646955; cv=fail; b=UZpILG0JKwGNV4hbcynLC2r2NOPSFn/VNTDWvPVh5rV4XAzvE1UH7/uCE4i21s+Xu98AUivvYB9rh7yUujfQMMlW94LsUqHezzoRF2s51J5au3CPLcPrJWgE7KRss/nMenBeyUUauA7RNtpLoYILPYQ2BLhtdv/R3/WH2VV8pMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766646955; c=relaxed/simple;
	bh=FXlJIFnfHO9GrLqR7BqvnVeouX2OaFrrEQVejAv3oxA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iMDhz8L6IvU00gsQQE26sQLQ0A0SoavnLghap4FkDmon8VJ3Fa1pNOGwxieGykyZ2hwgIya/ot8XtuAjgLqN2nzBaVEmhK1kG5+qBPrcX2NZCbDUufk8jongeHPahR5Si4egrI2Mveo5maa2suki9qyKBmeEURUibo0jTpx3soI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=KEPI4AAP; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=mJ3+bYbc; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 88c99556e16111f08a742f2735aaa5e5-20251225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=FXlJIFnfHO9GrLqR7BqvnVeouX2OaFrrEQVejAv3oxA=;
	b=KEPI4AAPPI5iBPCOiVtHBnucxUGtzeOGgOZV5sZU59Qs5XasAYdpB+pky6dX2KffLGFdr2BhwKUg2DIbDPUEpRFyqXBBck5H4JGnINvRA/LjVFH0xXF3dsz1JDnQZRIjRvNCfHXMrldS66YPNtYsYiGg5ok0vBZRL7GxKsQT3go=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:44a674cd-1086-4298-9b3d-0d26984e709a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:6192e628-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 88c99556e16111f08a742f2735aaa5e5-20251225
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 206712776; Thu, 25 Dec 2025 15:15:47 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 25 Dec 2025 15:15:45 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 25 Dec 2025 15:15:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSzYxTubeVMmPskZo6gzGiozYJw1ucelcBM0AdkVUgwEuyKSUBhe2cym8uMoqQJShBZ7oTMHPNVy4NpivVrDIvy6TXvpEOQ+wn6vr64NAGhAF1UuRDti5a0dYdcAGQbVGOLQEslyTy+4uAjO6wjN9Is/bDF6UgsnfEFzE4yCFqFgHjIsPUCIcJo7HjoFmbCuDQHWqi/CcLwW8TmCK9VSzib48xuIXsfPLD+XtWtVS0Q+GkOtuD84gxf3kE8Te6v2lVZJPjHNTbDn6JDLCrFf+B9FWCEXQXsN7d5z2iKg33GGdcL1IKTPRDfdeGrly2iwYFk1ya36Sre4vzlfOXxfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXlJIFnfHO9GrLqR7BqvnVeouX2OaFrrEQVejAv3oxA=;
 b=YxPvBgFp2c9qMVs4F7kF47luTK9ycL/WeG7KTJcO3OeZvehhEayWc6Fvzx5nDEelkjZXdfs3lJ5ZGIrKW4qZrTRN2TAXZnF7HsbRZ4hDcFCrb3JfjabsMA+m31L5OUomWjDjWuNiMatCvqZRY1kEXQMBpQws5dw6GI5QLe+deATl9x1hX3kzGGaSU6UKAXNMTDZLci1XjctXD9mZ27mzOtBtzIDcG3YfOWFireYiUZjaAnd9z5XHYs9mbNukVTNB8NWEcBEhcGKAw6ODfuSurYin8+KPOYFcV+K5nxK535xXOBkbL/T9KXJ7imt4yPAJOoJsU+kdPVDGnPeOQZJRhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXlJIFnfHO9GrLqR7BqvnVeouX2OaFrrEQVejAv3oxA=;
 b=mJ3+bYbc1BslOnlwQv+o8s2xn0mxS6BjxjXZs9pw7+xrC4PPSnrRqt5FIv21a5bAOSLnIn0GKwKbIgGQ7D0yyEdVgKHbis59k/kOmP9ujJyeEZXv7pa08ORAQDWEeIc2uEv7vIhPHWxs6Uo8FGrp5KJmXsBWjUU9obCvWvDgjUM=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by KUZPR03MB9469.apcprd03.prod.outlook.com (2603:1096:d10:2f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 07:15:42 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9434.009; Thu, 25 Dec 2025
 07:15:42 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v11 08/12] media: mediatek: jpeg: fix remove buffer
 operation for multi-core
Thread-Topic: [PATCH v11 08/12] media: mediatek: jpeg: fix remove buffer
 operation for multi-core
Thread-Index: AQHcY3Dpd4wr+blGukurelb+ha2yVrUk4yiAgA0yhQA=
Date: Thu, 25 Dec 2025 07:15:42 +0000
Message-ID: <61f6d2af71bc6dabb55a866915d765b82007fedc.camel@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-9-kyrie.wu@mediatek.com>
	 <a8376a71b87cc8944bf05be3bc45dc2e4fe2764e.camel@ndufresne.ca>
In-Reply-To: <a8376a71b87cc8944bf05be3bc45dc2e4fe2764e.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|KUZPR03MB9469:EE_
x-ms-office365-filtering-correlation-id: b8694891-4be0-4948-24ad-08de43856a5c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?WmMwRTBMVzM5Y2U5WDR4NGc2QnYwUTBHSThCcy9odEJadmJPU2NESEE5dnpr?=
 =?utf-8?B?aUJlZlppMzdmc0tqRFpvaEpxek9tTllMelVsMVZnOXovalNSVWZVZ1E4YTJu?=
 =?utf-8?B?MW1aVW9mQncwUm5GZHRGSG9yd25hRWxEd3BSTExLakxqT0NHdW9uUzRSbmxV?=
 =?utf-8?B?YlBNS2YyMkk0bVVCbXhhaWxMUUtlWG5YN0E2aEVWaWFKbjNzNGVyQkVXSm5K?=
 =?utf-8?B?T2FuaE4zVE9IcEFieEN4VzhwMEFxZUZnMTZZeGFrN0V2aW52UTg2WThMZUFa?=
 =?utf-8?B?VmZOZDNYMXRZVnFYelBUNnJpUTlzcVlXclE1dXpmK0xPMFFBeXZSZGV3R0px?=
 =?utf-8?B?bmVFMXd0L1p0eUFxTlFXS3BMSHIrdS9LYXI5eWRlY2hMUmRZajhrdE4yTmE2?=
 =?utf-8?B?VlV1YjZHSldtQWtDWFc4QkVtQXNEaTNqOXFQeDBuOWc1bzRXTTBSRi9lZkhm?=
 =?utf-8?B?dnJZbDUyempHT3gvbk5LLzBNL1FUQmw5MkZNWTVQWjFjT295VW01c1NSaE0x?=
 =?utf-8?B?SkpJd1dXWVdhLzdNdDZDOXMyNUJFY3RSUXhGcnRzOGZISWRFbnBjY0NIZ016?=
 =?utf-8?B?bVd0OEs4cklKWXdxRDE0T28xR2o4VFhockpmVVh1eUw2Mys3Z2VGc3hSaFVv?=
 =?utf-8?B?Z1BXK1cvbi8rTUlCSzlrQjBVbWdUMVhJYlRjOVNIZXNXclhiMGYzanI1bWJG?=
 =?utf-8?B?b2hYTzJEVWhZdzRId1c3ZGQ2SlVWUkFLSUluWVpmejFkYk0xOUZWaHIvRWVz?=
 =?utf-8?B?M0kwWmRqV2lXcHV1WlVlajJ0SW1jTGJ1VVRTRWw0YnZEbWJWaUgzM3JnSnFB?=
 =?utf-8?B?b0I0NHFWc2huT3hmR3RMckhTYjRSaW55QzUyYlh4NlVDOCtUbGZybStyVmNO?=
 =?utf-8?B?cUFOWURwckdJbVRETXI0aVZhU1Z5MDJWYk9zanZXTUVwKzVTSmxHTnFtZWwx?=
 =?utf-8?B?c0xjVVVwWnN5MmFhODd0UzA0dVhveEFzdHhIWGNpbEtEWGE4RE1ORGQ4V2JW?=
 =?utf-8?B?MEtUakdMOFNMd2wyV1ZrT1QrOHpjRUJoeUlrcXRrNm9TVVZBeit3c0VDdGZO?=
 =?utf-8?B?UVdicUJJTUVHNVdzbXZydk1UdGFtYmgwcVVBNGE0eEQva3dhYkFGL2dnR0F4?=
 =?utf-8?B?Y0dadWdFYUZieWNuK0lXclBOU1VlQUFmallxWFVGTEZ1YlorbFJ3YklkWFNY?=
 =?utf-8?B?UUYvZjVGbXJUVGRhdm8veTFDbWdDNjR1ZUl1V1UvUVR6ZDlTcGxDL25JKzJS?=
 =?utf-8?B?akZyK1l5WlNnRDk3RkpRbmV1SnQyNm9zdUNSSzhIWFZ3YXNrajBEOG5NY2N3?=
 =?utf-8?B?NkJRNXFUMHVBZ09pSys1M2lFVVJ0dkoySnRqSW5pdklZd3ZxNjZMYSt0ZXBz?=
 =?utf-8?B?L21lVEFwa2VwSm1sWXJVN1EzM093RFZROVhOZWh5TEdudUx6NUYrTzhmVTly?=
 =?utf-8?B?TE1VeWNya2pOdHQxeEpTMFpJd1hpS2NpcjU5d2lFNzJaMEY1cnBxTm4wUFlx?=
 =?utf-8?B?NjcveEVHQTNyR1RBbk9zRUF6YmJkeGpVelB4NXBOMFFQd0xlbG5kK0F1Ulcz?=
 =?utf-8?B?aVBabXRWUWczUzlvcUFuTkN6K0ZDZUppYlhJcVRCUVprbXRucWEySVVtZ1FP?=
 =?utf-8?B?dWNJc1R4elQreVZVblhKSkl5NDc3WXBXVmtKMDhTdGNFM2Fyam5EV3YxTlRn?=
 =?utf-8?B?M2VubGF2dWI1SWhYL1NuV0hGTnZCNk9KUXFsYXpqV2tMSG9EUWlMbXNsOEJ0?=
 =?utf-8?B?L2Zma2xXNlBrS3l3b2RGVmtWa0hnRmllSWE3b1BHeHluZ0gyV0w3azBGSHhC?=
 =?utf-8?B?a1pKWDcrSGRLRjdXZDRoZzE5MU1jWCtnTlpmVm5nM1Bxc1lXNVBlbnQ3c1Rq?=
 =?utf-8?B?dHZjT0o2bmdLR0VnOUZjb2ZKakxNdWZtZnhjRVFhdSs5Q0QvL1ZmREkrbXdk?=
 =?utf-8?B?MFRwOE5rQ0NaY3B6R2lFc1UwM0lWeUpTaUdKcXBFS1BEbXRTcVBwTWx0RVNT?=
 =?utf-8?B?Z1pON0xpa0U4ZURjU0N4blJjNlltLzliSEFURGxkQ3lrVi84bjZGTmMrNGxG?=
 =?utf-8?B?QnRYRjFHQ213bG9FL0dESGRnYStvcmc4TUlEZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjVQakhUdEtlSVh3UHdSS0VBd0hKaGR5VGVaUys1MnM1Rk02dW1BclJFd0pK?=
 =?utf-8?B?QStTWTVqdlF2WXpJOG1PWkRFWFBFb1pJSjdOVjdneGx4SVBFRXV6cjJwNEwv?=
 =?utf-8?B?TDQySXg5cUpuWVNCY0psc3RtSWd6WGQ5V1drcnpSTWUzc2hSZENoLzZKZVdZ?=
 =?utf-8?B?WVNLT05BazVhVnAraEZSaDNtdDBrSElPZENxTExNaTB1ZXhFM05Tb25VOUN1?=
 =?utf-8?B?ZjZHb2NFZE0wUjhjQjBpUlVpbjJjWmdwK1YrM1hJMzZNMWxkRGxSMCs2TTV0?=
 =?utf-8?B?WTZMWldFbkVPdXBWWEtvVVdobEg4UVNiMlpTN2t3aEszMzNmVjJGMTJidWxB?=
 =?utf-8?B?a2MwSDFuOFRHR3FSdE9VcStCMmFEelU2anBDUXdJUCtWdWozL1N3d1NSd2NP?=
 =?utf-8?B?TDNHSXBtbWJ5VHQycThKditIVHlPV2l1QW9sQ3FGUk5VQXJ1ek02bzJwbko3?=
 =?utf-8?B?c01HZFArZmprY1NMT2drNGpLNEpUVW5oQkxCYkk1UCs3QWVjYlgwWWVMd1V0?=
 =?utf-8?B?aGRCRDBLcGV2a2J3K3hXNTJuRVQ2Z3RMS3AwSGo1TkZPZmZQVWFYanlLcHRI?=
 =?utf-8?B?S2Q0a3FnNm9TMEpHZzVJUS9PWWQ3RzBxakhwWiszQlRXWlJzSjlLU01YUEty?=
 =?utf-8?B?dDFRYUMrNllJcHQ0YXBRa0JHbXJxdktZdXBoejR1MFNkRkVRV256ZjE1Ujcw?=
 =?utf-8?B?cWx6Q1FockZveUI4OWJRUUUxRnlqWUhlVWtUbEV5SGhyU3JXVFI4OFFzaHds?=
 =?utf-8?B?Znc0bW5xWi9sVDl6d3VKZit0RTNqVlNwbDdKYVdRd1VNOFVDS2Q2K3d3Snh5?=
 =?utf-8?B?ZEtFUWtrK3ZmeTlRZEx1RDJQVEN0c3M5cEVuUlJ1Y0t5dlk4OENDZjZjeTh2?=
 =?utf-8?B?RTNBQmpwRllqbWFrRU5adnM3dkt0UGROV0J5ZjQ1RURvM2lYRDd4TzNjVHJH?=
 =?utf-8?B?SVhlWlBnemFHc0EvWThFOFV3MGwvUzNEVVhGSGlCTjE0T0dqYkRuR2RpUUFo?=
 =?utf-8?B?WnoyV0tXSHlsdHFFRzRwM2NFcXliMStpN01ZZjlvU0pYcmliYUppZTJ2U3Zk?=
 =?utf-8?B?bytXTldCeUp4MHdnaXM5bzkvanl3VTY0UGxqdkd6QVIwN1FUOEt0K2l6T3l0?=
 =?utf-8?B?RjdLcVRaRW4ya0U5OStWQTQ4dE5BbVZtRDViYmFITXVGRGpaS0ZLblpnWTBV?=
 =?utf-8?B?U2daRXNWS0Z2cHoyQ1pET2V6N0ZqNVdlU2tJSGVxRkU2ejZncGJzdWt1ak1Q?=
 =?utf-8?B?cEJ0a2ZZeU5GanZKbDRvUEFkd0drNmtVVmVQaWFRNzFQaUd0SHlCdnErSTVl?=
 =?utf-8?B?QzF0ZXNMT1dBbUNzVE5hNCtlbldmYWJhdXdIZ3JQMDZkNTRtUk1VaWMzejJH?=
 =?utf-8?B?dHdweHRRUFQyUmVFWDVLMGoyRWhaQ3NqNldLWUZlM0Nwc0xpSTZuOFFFTWt6?=
 =?utf-8?B?RHNHdm9KbUl5SDZkeE12SERmYm1XNkVOeU1UQjN6bzNhajZqVlJ4eStCVENp?=
 =?utf-8?B?WWJUcEFtU1JLamp6SVllQ2FESHF4WUYrWnAwaloxRnFFRFdERGlvNXUxU3FF?=
 =?utf-8?B?Tmp0MFNUdVl1YzNVLzlCaHFHenZ4TEJHL05MTGpXK1E4ZU5QVUY2ZG5QNXk1?=
 =?utf-8?B?c0VLL25hNkZ3TWMxdVU2VEFUVjJFNVZVN0xONWRQRDQ0Mkt1enoyQlpzRExW?=
 =?utf-8?B?LzVWSWVFUmVDZE8xbmhLSXpNOU9YdmdjYndXYzF2am1HamxoTWxuVFFQcVFR?=
 =?utf-8?B?K0tMRURGK2VRVDRtUnJnNjdEdkkzRmVqbkxEclNmOUJ4VlZiOU9XTzUrc0lu?=
 =?utf-8?B?WHZoamR1bUJzcEJrR051eWdsMGRNZWR1M2J1SXl6V0ZzRTJab1dBOU90aDdx?=
 =?utf-8?B?WXdNcEhwL1NXUlR1V211Tmk5UGlTUG9QRkdTR2pzY1g0Z1FCQ04vSm1QQnV6?=
 =?utf-8?B?MkMyb3NWWGliYnVDaEQzMXlCQXY5VWVWS05ncWxLYmFBcVJJSGtmSDNUa0Qz?=
 =?utf-8?B?UGppRWt0MGwraER2T1lncU40cU5ya1ZjdGQvK3kvSjd3eVZ6VXdHQzVLdGFU?=
 =?utf-8?B?cG0xSExwd0dacmVFUXFjMlE5T0hGdG90ZEZHZWk4d1hITUdnZHJ6TUNCMGY0?=
 =?utf-8?B?TnNORDhXZ1BtK3hwMXBjakorNE9SbGNjdUk2cE92blJ0QmtFUG9lbHk4VDRh?=
 =?utf-8?B?dk10anl0OElPYklMMGIwdlhKYTM1eVVpNEJQUXNVYkhsM1VMOHJtRnBTNkxI?=
 =?utf-8?B?aXF1dVBnMkpqdFZtRktVRUVMZUdJbHBpdi9hd0laa0JqRmRIR25GY29iVEEv?=
 =?utf-8?B?cENzMmNpQ1JmajRPT1dHU1htbThCQlFTUWlHSDJVZGtmOHRwblNvdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA0D19A1B6606846B91988E82D346A24@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8694891-4be0-4948-24ad-08de43856a5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2025 07:15:42.6993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mERn5mIrJOEREHclhgKRB+5+FZsQpZtpU/BA7by/OjrisvuwVpfgmqtklP2ymJaBgHmX445Ozw4QZcDMfjULdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9469

T24gVHVlLCAyMDI1LTEyLTE2IGF0IDE2OjQzIC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIG1hcmRpIDAyIGTDqWNlbWJyZSAyMDI1IMOgIDE3OjQ3ICswODAw
LCBLeXJpZSBXdSBhIMOpY3JpdCA6DQo+ID4gbW92ZSByZW1vdmUgYnVmZmVyIGNvZGUgdG8gc3Bp
bmxvY2sgcHJvdGVjdCBhcmVhIGZvciBtdWx0aS1jb3JlDQo+IA0KPiBQZXJoYXBzOg0KPiANCj4g
TW92ZSBjYWxscyB0byB2NGwyX20ybV9zcmMvZHN0X2J1Zl9yZW1vdmUoKSBvdXRzaWRlIG9mIHRo
ZSBzcGlubG9jaw0KPiBwcm90ZWN0ZWQNCj4gc2NvcGUuDQo+IA0KPiBBbmQgcGVyaGFwcyBleHRl
bmQgaW4gd2h5IHRoaXMgaXMgbmVlZGVkLiBEZWFkbG9jaywgYmFkIGxvY2sNCj4gb3JkZXJpbmc/
DQoNCkRlYXIgTmljb2xhcywNCg0KbW92ZSB0aGVtIHRvIHByb3RlY3RlZCBzY29wZSB0byBhdm9p
ZCBidWZmZXIgbG9zdCBpZiB0aGUgd29ya2VyDQpzY2hlZHVsZWQNCmJ1dCBpdCBoYXNuJ3QgZW5h
YmxlIGpwZWcgaHcgc3VjY3Vzc2VkIHlldC4NCg0KSSB3aWxsIHJlZmluZSB0aGUgY29tbWl0IG1l
c3NhZ2UuDQoNClRoYW5rcy4NCg0KUmVnYXJkcywNCkt5cmllLg0KPiANCj4gPiANCj4gPiBGaXhl
czogODYzNzliZDlkMzk5ICgibWVkaWE6IG10ay1qcGVnOiBGaXhlcyBqcGVnIGVuYyZkZWMgd29y
a2VyIHN3DQo+ID4gZmxvdyIpDQo+ID4gDQo+IA0KPiBObyBibGFuay4NCj4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogS3lyaWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gDQo+IFJldmlld2Vk
LWJ5OiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5jb20+DQo+
IA0KPiBOaWNvbGFzDQo+IA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jIHwgMTAgKysrKy0tDQo+ID4gLS0tLQ0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pw
ZWdfY29yZS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRr
X2pwZWdfY29yZS5jDQo+ID4gaW5kZXggOTIzM2JiZmUyZDk3Li5kYTFjYTQ5NGVkNGIgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVn
X2NvcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9t
dGtfanBlZ19jb3JlLmMNCj4gPiBAQCAtMTY2NSw5ICsxNjY1LDYgQEAgc3RhdGljIHZvaWQgbXRr
X2pwZWdlbmNfd29ya2VyKHN0cnVjdA0KPiA+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+ICAJCWdv
dG8gZW5jX2VuZDsNCj4gPiAgCX0NCj4gPiAgDQo+ID4gLQl2NGwyX20ybV9zcmNfYnVmX3JlbW92
ZShjdHgtPmZoLm0ybV9jdHgpOw0KPiA+IC0JdjRsMl9tMm1fZHN0X2J1Zl9yZW1vdmUoY3R4LT5m
aC5tMm1fY3R4KTsNCj4gPiAtDQo+ID4gIAlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJmNvbXBfanBl
Z1tod19pZF0tPmpvYl90aW1lb3V0X3dvcmssDQo+ID4gIAkJCSAgICAgDQo+ID4gbXNlY3NfdG9f
amlmZmllcyhNVEtfSlBFR19IV19USU1FT1VUX01TRUMpKTsNCj4gPiAgDQo+ID4gQEAgLTE2ODUs
NiArMTY4Miw4IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnZW5jX3dvcmtlcihzdHJ1Y3QNCj4gPiB3
b3JrX3N0cnVjdCAqd29yaykNCj4gPiAgCQkJICAgICAmc3JjX2J1Zi0+dmIyX2J1Zik7DQo+ID4g
IAltdGtfanBlZ19zZXRfZW5jX3BhcmFtcyhjdHgsIGNvbXBfanBlZ1tod19pZF0tPnJlZ19iYXNl
KTsNCj4gPiAgCW10a19qcGVnX2VuY19zdGFydChjb21wX2pwZWdbaHdfaWRdLT5yZWdfYmFzZSk7
DQo+ID4gKwl2NGwyX20ybV9zcmNfYnVmX3JlbW92ZShjdHgtPmZoLm0ybV9jdHgpOw0KPiA+ICsJ
djRsMl9tMm1fZHN0X2J1Zl9yZW1vdmUoY3R4LT5maC5tMm1fY3R4KTsNCj4gPiAgCWpwZWdfYnVm
X3F1ZXVlX2luYyhjdHgpOw0KPiA+ICAJdjRsMl9tMm1fam9iX2ZpbmlzaChqcGVnLT5tMm1fZGV2
LCBjdHgtPmZoLm0ybV9jdHgpOw0KPiA+ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY29tcF9q
cGVnW2h3X2lkXS0+aHdfbG9jaywgZmxhZ3MpOw0KPiA+IEBAIC0xNzY3LDkgKzE3NjYsNiBAQCBz
dGF0aWMgdm9pZCBtdGtfanBlZ2RlY193b3JrZXIoc3RydWN0DQo+ID4gd29ya19zdHJ1Y3QgKndv
cmspDQo+ID4gIAkJZ290byBkZWNfZW5kOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiAtCXY0bDJfbTJt
X3NyY19idWZfcmVtb3ZlKGN0eC0+ZmgubTJtX2N0eCk7DQo+ID4gLQl2NGwyX20ybV9kc3RfYnVm
X3JlbW92ZShjdHgtPmZoLm0ybV9jdHgpOw0KPiA+IC0NCj4gPiAgCW10a19qcGVnX3NldF9kZWNf
c3JjKGN0eCwgJnNyY19idWYtPnZiMl9idWYsICZicyk7DQo+ID4gIAlpZiAobXRrX2pwZWdfc2V0
X2RlY19kc3QoY3R4LA0KPiA+ICAJCQkJICZqcGVnX3NyY19idWYtPmRlY19wYXJhbSwNCj4gPiBA
QCAtMTc5NCw2ICsxNzkwLDggQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdkZWNfd29ya2VyKHN0cnVj
dA0KPiA+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+ICAJCQkJanBlZ19zcmNfYnVmLT5ic19zaXpl
LA0KPiA+ICAJCQkJJmJzLA0KPiA+ICAJCQkJJmZiKTsNCj4gPiArCXY0bDJfbTJtX3NyY19idWZf
cmVtb3ZlKGN0eC0+ZmgubTJtX2N0eCk7DQo+ID4gKwl2NGwyX20ybV9kc3RfYnVmX3JlbW92ZShj
dHgtPmZoLm0ybV9jdHgpOw0KPiA+ICAJbXRrX2pwZWdfZGVjX3N0YXJ0KGNvbXBfanBlZ1tod19p
ZF0tPnJlZ19iYXNlKTsNCj4gPiAgCWpwZWdfYnVmX3F1ZXVlX2luYyhjdHgpOw0KPiA+ICAJdjRs
Ml9tMm1fam9iX2ZpbmlzaChqcGVnLT5tMm1fZGV2LCBjdHgtPmZoLm0ybV9jdHgpOw0K

