Return-Path: <linux-media+bounces-15514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9414E94055D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 04:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B80091C210B5
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 02:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781AB42047;
	Tue, 30 Jul 2024 02:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ntRFXwQT";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ihNBZN52"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1661CFBC;
	Tue, 30 Jul 2024 02:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722307178; cv=fail; b=UuLqr5u+JtBgci7MsEMOeAPyrALZd1sNlt1fq3tJxp43bRVEFGzlfzMd/iMebU+qaK3VVYdYzcTxQ1aKUcy/WeVLwkZTzjz7nteamamgyuFx0gv6+eAeJXtirHx4JNjWvTwHcBfKFM+jaQ786BzJ+xtUQnoSk5JbRbd944VdKAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722307178; c=relaxed/simple;
	bh=O4y5SZmL8/6CZgmPC0545t6vbwIQqanHRxNuOR3HAf0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Up075vtR2FeWhDgMFeuPMdEKW4e5DJLE4bCO0as6rveBAPpEx5uDydVEwf9gjLgK/JY075vvanfvRAmOtC7RdIqD+ZIQLlZ+1iEppalhRWWINzef1pxAXzMz+pkhUwzs5ZrTp8VBAoTYYBrDITWQysfuzUPfhrwZti9sMk/KgG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ntRFXwQT; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ihNBZN52; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f2bcc8184e1c11efb5b96b43b535fdb4-20240730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=O4y5SZmL8/6CZgmPC0545t6vbwIQqanHRxNuOR3HAf0=;
	b=ntRFXwQToaFfklPI/qv98XnOx3HxQ/9pUesXWyKulmOvw7v6/7E4ZFIcsgcZ5K0+/1qoR0xNsNWROgIKIG+o9D0atFZlRHEVP4kkcb92f61TvDIealpAhZAVPLvMDALHttJi5XiIQEY4gJg3FkjhEAb+u0UGOFmFkoq/0LkhucE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:b9d71506-55a4-49ae-a866-24716c756848,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:4473060e-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f2bcc8184e1c11efb5b96b43b535fdb4-20240730
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 44696144; Tue, 30 Jul 2024 10:39:31 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 Jul 2024 10:39:30 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 Jul 2024 10:39:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6W/Xey/pmC8jT5BJneWDxh8lb6EZFsTSMDSFJhtE7p9arEbFVjGI5pqlRjVJN98aaGqCwa57HfN2NenFU6M6EkRhPzG8z7wiwy+UwCq7l/2dMa/7lTsFyUmQpxQrVtlX4b3mfQM0DHTs/XpbkkPAM9IPnkOUiCGk/FyuJ/WVQPvis8wlSZRJBfasLh5X3AAdJP15GXRMAcsfs2rsFCwZLwJkNQQ+/lvZKfxa6ZOU4oK3SUyUjClnKYrOiGlxSUuHFMpNvjzDYfUhTu26zHzVVtDLe6ledxNl9Hn3XaJitJ13bRCtJcUBRql8Xvoy5yor5zQoEBl8ngdSLwdqYYTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4y5SZmL8/6CZgmPC0545t6vbwIQqanHRxNuOR3HAf0=;
 b=j2rPhs9+AGL5UZ3y6mgoIqNXKS6BaQbownTwAzur5W2bMYscmmF0in6l0DoViw2PsRIAd1mv8DaiWuoNY92y38PK+XoU9vmQEbNRCUx14uzuHgqiWCWxypSCm7sAyloUINILK5Bst6SuvT0hNVVElBvCw9y0qtWBZ1QNJQQf283sY8g7iuLN08QieDUYImiLR1BZSsGPPcn/6ZWArppxuG/7YUFTybq3Pkvg3Q0cG/LRGSl+aHo/o9hDiEqckl8OHSlsT/u3ZFkmXpybyUOddzpLthoab5BcZbHy2RjBi378tX/0GC0bek7KIvizSYlppuywvtOqtIeW8AnWz1t1YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4y5SZmL8/6CZgmPC0545t6vbwIQqanHRxNuOR3HAf0=;
 b=ihNBZN52guq8SG0pbLmvHxQ2nnvUltTdO8KVqJEd78sigh+FP22nkXDOQcXw0iDZp6XZu6NlkXMBb4PtWUsB8YiGTBp7sHwNU2P3KvBIPs2J5cQgfP2mfj6lGGvpFIcjp3lOvqXZP2bYVbhOK58sK3LfqfwOwcp5gxKvQmUZVko=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7990.apcprd03.prod.outlook.com (2603:1096:400:47c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 02:39:27 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:39:26 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "jstephan@baylibre.com" <jstephan@baylibre.com>
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
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "pnguyen@baylibre.com"
	<pnguyen@baylibre.com>
Subject: Re: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Index: AQHazhdkyJtqWsdLFUSbwSAjf5xgNbH731aAgBH+I4CAANm5gA==
Date: Tue, 30 Jul 2024 02:39:26 +0000
Message-ID: <72bfcfad956efb64ba50a3bd9438e3a09a0fea6f.camel@mediatek.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
	 <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
	 <85c54f0b1b8bb5d9026c67109a3526fd95cc013b.camel@mediatek.com>
	 <CAEHHSvZ2etjPKq0MqHYD=hjs19Yy+DJLwXGGorJK7q2tW2dfRQ@mail.gmail.com>
In-Reply-To: <CAEHHSvZ2etjPKq0MqHYD=hjs19Yy+DJLwXGGorJK7q2tW2dfRQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7990:EE_
x-ms-office365-filtering-correlation-id: f5b9b36c-a08a-478b-9e17-08dcb040d447
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y3JXZ1Vob3lqY0c0cjBwa0Zlcjlpb1dVcmhFdCtOTG5mYjBhOGo2TitXeGcr?=
 =?utf-8?B?NEp0QVBNTVFHT0NPUmwzY3J2RW5DVDBXeXBWRkdWSitmY1ZvQm5ycjdBL3Iv?=
 =?utf-8?B?Z21EbzUxVEg2NkY3UDl1cTdDUnpuSFBTK1lFK3cwRmZ2djhrY1NyVnlYS0xJ?=
 =?utf-8?B?UEUxMy9vQ2VYUDN6dzR2T3Y3R1kySktVRnFMckZSWFErd1ZtbTYxV3J5ZXo2?=
 =?utf-8?B?UVBzMlRqNlpTRnpCYkxtWFcxRHFMRHF6VXUvaE5XYis4NTNGZlRQVVBJVWxs?=
 =?utf-8?B?MWh0RGtBa3RkYlcxVWp5WUxYdThXdDFkdUR6b0JDdzFJb09rN05FdmdsamtM?=
 =?utf-8?B?MUtNK3ZDVlNSZDVGZnBoeEtmS25pKzEvVTJnQjFyY2EzV3VBemQ0eStINW8x?=
 =?utf-8?B?dE01Tk56Q1RaY3Y3VWVBM3RjbVdFS2JrTXdKb0RZU2R1WDhUT0RlcTl5aXlH?=
 =?utf-8?B?b0lGUU94bk9KY3l2SHdjakVqQUxtaUQ1L2E3ODdKU2k3eG9nMHVQMlBmRUpx?=
 =?utf-8?B?UDRjL0F3S1JLSDdjWFlBd3JaUTBMWjlJeUp2RmVLZ1kwTG9pOHd3N1JqNWwy?=
 =?utf-8?B?OUJhelAvZmNJeDJjNzQvV1BNVklpQ0hvT0hseWNYUHZYdWlsbFgveHp2TDNt?=
 =?utf-8?B?TXFjMkhhbFVYSkNqL0Q3ekp1TUdVRkxUbnlTc245UTJTMUlHa0pydGdGUmdK?=
 =?utf-8?B?aGJCOE44TkxybnBYRmhKNWVJQit3U0IxU0drQ1pIYk5pYWFsRSt3K05iTEVF?=
 =?utf-8?B?Skx5bnZhTWtPbkVTUkk2UXB3b0UrTGhoQzNHUi9IUmV0ZEN1amlydkJYZXpi?=
 =?utf-8?B?aHBTUWdlazZQRUl4UTlvcUxDeGp2SUNtZHpzR2xHYnR5cFRUaXdST2JOM1R1?=
 =?utf-8?B?VGRRS25hcUxTeDdyS2RHV2ltUjlWT2ZVOUt2SWhnQ2pxL1JhSkJ1Q1E5SFJt?=
 =?utf-8?B?KzZwYnAyTlhCeldTRUZvZDFoaFpQM3Bqd3ZTU0tQaUNIajdLNHJBazc0QUFq?=
 =?utf-8?B?Wm8wZE05QnlJOVA5MlJNK3EwV2FOUjhaMnN4cU9EVUNJQXFORnNwK1RnMnIy?=
 =?utf-8?B?OVlkSml6OUQ3WG1zQmdENlVTV09qNlVDRUd1QnZ5cnpFK0VhL2x0THd4OHBJ?=
 =?utf-8?B?dFo2NDNiaG9mRndNQk9qN0NhZFYxTUoyWWN5R1VjTWd6YThWL0txdW8wQm1p?=
 =?utf-8?B?U0kwYWZrd0ZFYUE1aEQ0TlE1d0lpYm9TaGZWY1lzMy85MUFZdm5yV2o1RDBv?=
 =?utf-8?B?bDE1TExmRjJkeGVJUTlNbUE0aENpazJhWDZWazgvOTQxLzZaeHVPN3lKY3cr?=
 =?utf-8?B?MmY5dlQrSUR2UTllYStWbjYrVWZKRldoUEtZWURmVXA5WnpoVlhkeFVQR0pp?=
 =?utf-8?B?VCs4TUdiK2k2dk4wZHJ0WEF0VFh1NlpQeEdlRThmM1NrMlBnK21HZkgyRURn?=
 =?utf-8?B?SHBsRHBjc3BTWVNSSEJPK2d3NFdwYlpReE00TDlxbk0vOG9RVWJKN3lXZXFT?=
 =?utf-8?B?eHhRTzlIdklPdXBnZkV0YURqeHpMR3BGYzVJZGQwSEN6MnV6Z2h2VDRBSHg2?=
 =?utf-8?B?VGR6cXRaWE5ISnFLcDB1dlIybTE0cURSNWQyWmRaYzNNMENCWHNxRWsxUmh2?=
 =?utf-8?B?UVExemM0amdQay9BaUF6KzRsYkxWODZmbWVpR1cvMUtZUHE0aWNDczc5MS94?=
 =?utf-8?B?UUFoM1RVeXlSQ2N3SkEwWWFoZDRKdHRGRXc2TWI0WCtheGJqaURoQVRDU3dW?=
 =?utf-8?B?eWN1L1NnT3J2YTh4MmpCSUtqbGJzckFwV3diUml0amFtUTE0d0EyS2dkbHRR?=
 =?utf-8?B?Y20vclpuRXRZYVhRak42UjV2VytaRzdsUUdVMVY5WGNIMjBFNE1aMGVUY1pK?=
 =?utf-8?B?MnJvNUFYYXJpWTd1U3M2SENkaUFNb3NZZGo3a3JHUlRTcXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0VxK0RDNEZySzc1RDMzaGlxY1BCRTRnZU54RlU5VDdQS0ZZd0dHUXF3S2tI?=
 =?utf-8?B?dEo1aktYTzBUYnlyMEhoeU9NZTJabitRWXM4bU56MjZMMUc0Rk1OWlBMNjA2?=
 =?utf-8?B?ODVKcWh3bnhFeVgwbVRNaGYvWDRqd3czV3JYUnN5QUxRanI2WHUwdDJxb2dS?=
 =?utf-8?B?dVJVQ2pQdi95SE9vSGljTlhQRjBqdDJuNVlMZEFLeUhNV3dSVWJyUC9ib2Qv?=
 =?utf-8?B?c3Z6OUd0MHUrem5paGtwb0YyUVJmSXo5OS9XaGNVcHJ3eHpHOERZNVp6czQ1?=
 =?utf-8?B?K2dDUFdmK1AwQ3lWOEFYcGtFQkp4WDlqUkNzKzQwVlp5c0ZYUFNFZDRoeVAv?=
 =?utf-8?B?Z2hBT1Bka2FLZDRoWFhKbFdDNlFGVjRmQkdSSWlNS2Nob3BVMVJITi94QmI2?=
 =?utf-8?B?SjhXdG5KNWVBWVlqYlozM2h0QmhNdDlnSHppLzdpa2FlUzJqSjEwUWtxVHZn?=
 =?utf-8?B?eXVpUXlsbktsZENiNmNnckowUlZwNEZ0bExHdklWWmd0VjB6ZHRQcVZNbEhr?=
 =?utf-8?B?dmZPeXVXZXFlWUJxN0V6TWlJaDBuMTFQZ050NVFiSEVjcUFCVEsrQ2RoblVX?=
 =?utf-8?B?eWpvN2VEMHc1ZS8vN09RSk5LNmFNdG8wbGs3dDlwbUxpZzAydkFGQjRFdHpS?=
 =?utf-8?B?cGdXa2VGelFPTDk3UTJweEVBd1FBRE91ZjFoYUZLa0NBalNCcEZhWGM4YXBa?=
 =?utf-8?B?S2lzQU9DUStFbkNWdVpuWkZySlMyWlIyMUVlNXRYa2dBM0NEQWV2MUxib0Nr?=
 =?utf-8?B?aVhLRFZUcm9ieXlaZDVBNklkR2l2Mmt6NUpxMVVKWjFQOFJTcTloRFRUcWNV?=
 =?utf-8?B?bWMyTm85Q1M2M3VuOWg3UkZBY1NyS25ITmZSZHBEbzVleHA3TmNVN1VjQ0VK?=
 =?utf-8?B?b3BYeUdMUXZDaG84OTBBMlVid2FvcFErL0pqdkJIeWp0MzZYbHJZbkJrZ2Ix?=
 =?utf-8?B?OTRXZGpCRWpHcnFiY0lwVndMelpFQlJXWDBxUHJvTVVpMTZLQmhOdTI1ZW1Z?=
 =?utf-8?B?a0NjOGFvVmlmQkVnZnZvWkdDYzh2TGl2Y3BydzFNcVJiT3l0WG8wdGd3S0dF?=
 =?utf-8?B?ZzRUU29UVWgydEpsL3JuUXhxbXV2S2xETE5PdXR0NUs3MmJZOVFuM08rMW1k?=
 =?utf-8?B?VjJTWmMySTRWUC9jMTRaNTVaUHBwV2FzK2tuRHR3RzQ1WDlVcXh3U0ozTklE?=
 =?utf-8?B?KzBUTmR3aXp2TnFMNXluVHhOWG42alhHZTduRVBSZkV6djJYSnlZYmIrZkZh?=
 =?utf-8?B?RytEWlBid0JlZlNmZitGdGcyQUhvVjJCK1FPWUxKYklTU29PRll3ZndQY1kw?=
 =?utf-8?B?dmZnaXl0TmV3eGdDVFhzMXBNYkdxWEFjMDlnOHUwWTcxSHJwc3FLRnE1bEJZ?=
 =?utf-8?B?cU1VM1NwQ3VseDVVaVJPUndtRkJxM3YzQ0dDc3JBT2lzSEtmdldQTU5sS1Zo?=
 =?utf-8?B?NVp5L3ZxRGtmS2sxMTZmVGpFZ1JmRytDeWY2ZjdBdTdBSEFnOG5xVFYvNnRt?=
 =?utf-8?B?bGRzY3JMWENBSzVWSDkyV2piZm4rK1M5cVFHZmNVWHM5ZG5iTTRJV1Exbi9M?=
 =?utf-8?B?UDRKK1VYLzZOckZoS3R0dzh4UkJVUUtiUkQrdG1VN3g2MHhCWXRMUUJTd0ps?=
 =?utf-8?B?MDJpaDlwRHYrRjNIZXh6Vjd6clFCa2NGUTM5dVZaeXdNbDcvMVlLUDcrcU54?=
 =?utf-8?B?V1l3bmlMSlI5R0JxNDZ5UVlSb01ydmw2YytYdXdvdmwvZHpqSU1Wc1cyUm50?=
 =?utf-8?B?ekczNEpYYXE1Z21oUHVPNmdrcWRUQkxVVkZYbzB5Z3dzQ0lBbGFmWGJXRURX?=
 =?utf-8?B?MW1qcElZZS9yNlhBbFBjaHZQRm9zeG9xWmxWRDlOQ2NRNzNBdzVVanFOSEdp?=
 =?utf-8?B?L0VxbzNBWmpnL2tJVERqRUhLK3RDM2ZYRzNoZXBrKzhWN1JlZCtqVk0yMTFt?=
 =?utf-8?B?Z29aeXBJKzJFRzNkVVRDUzhla2tGWEM5Mi82ZG9aZjlZSDY0UVR0ME9yTDB6?=
 =?utf-8?B?bGY2Vlc4ZGtQMHRWY2ZWbnlMb0ZqMXhBaStIOFRLODJyYTMvbVVGYnBIYmlo?=
 =?utf-8?B?d3BLaEprZmF4dHRXc0t1SzlpcEVZaEZWKzdSck5hTWl1VnZJYlZtWjR4TGJ1?=
 =?utf-8?Q?cvzD/lrP8eMKiFqifh1eRWY1F?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53E9D2A573F88246AB5652B85E3A79C0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b9b36c-a08a-478b-9e17-08dcb040d447
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 02:39:26.5524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aaW7NsbEEMJZ9f3qm2jXYukNjFcoJA1hDdtltJv78JcDsfihNDoSC9hxh39pLLQh/bFhphrGL27H31NI4lqbgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7990

T24gTW9uLCAyMDI0LTA3LTI5IGF0IDE1OjQwICswMjAwLCBKdWxpZW4gU3RlcGhhbiB3cm90ZToN
Cj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+ICBMZSBqZXUuIDE4IGp1aWwuIDIwMjQgw6AgMDQ6NTQsIENLIEh1ICjog6Hk
v4rlhYkpIDxjay5odUBtZWRpYXRlay5jb20+IGEgw6ljcml0IDoNCj4gPg0KPiA+IEhpLCBKdWxp
ZW46DQo+ID4NCj4gPiBPbiBUaHUsIDIwMjQtMDctMDQgYXQgMTU6MzYgKzAyMDAsIEp1bGllbiBT
dGVwaGFuIHdyb3RlOg0KPiA+ID4NCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVk
IHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ID4gPiAgRnJvbTogUGhpLWJhbmcgTmd1eWVu
IDxwbmd1eWVuQGJheWxpYnJlLmNvbT4NCj4gPiA+DQo+ID4gPiBUaGlzIGRyaXZlciBwcm92aWRl
cyBhIHBhdGggdG8gYnlwYXNzIHRoZSBTb0MgSVNQIHNvIHRoYXQgaW1hZ2UgZGF0YQ0KPiA+ID4g
Y29taW5nIGZyb20gdGhlIFNFTklORiBjYW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91
dCBhbnkgaW1hZ2UNCj4gPiA+IHByb2Nlc3NpbmcuIFRoaXMgYWxsb3dzIHRoZSB1c2Ugb2YgYW4g
ZXh0ZXJuYWwgSVNQLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBoaS1iYW5nIE5ndXll
biA8cG5ndXllbkBiYXlsaWJyZS5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5
bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+DQo+ID4gPiBbUGF1bCBFbGRlciBmaXgg
aXJxIGxvY2tpbmddDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIEVsZGVyIDxwYXVsLmVsZGVy
QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gPiBDby1kZXZlbG9wZWQtYnk6IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4N
Cj4gPiA+IENvLWRldmVsb3BlZC1ieTogSnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJl
LmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+ID4gPiAtLS0NCj4gPg0KPiA+IFtzbmlwXQ0KPiA+DQo+ID4gPiArc3RhdGlj
IGludCBtdGtfY2FtX3ZiMl9zdGFydF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1ZSAqdnEsDQo+
ID4gPiArICAgICAgIHVuc2lnbmVkIGludCBjb3VudCkNCj4gPiA+ICt7DQo+ID4gPiArc3RydWN0
IG10a19jYW1fZGV2ICpjYW0gPSB2YjJfZ2V0X2Rydl9wcml2KHZxKTsNCj4gPiA+ICtzdHJ1Y3Qg
bXRrX2NhbV9kZXZfYnVmZmVyICpidWY7DQo+ID4gPiArc3RydWN0IG10a19jYW1fdmlkZW9fZGV2
aWNlICp2ZGV2ID0NCj4gPiA+ICt2YjJfcXVldWVfdG9fbXRrX2NhbV92aWRlb19kZXZpY2UodnEp
Ow0KPiA+ID4gK3N0cnVjdCBkZXZpY2UgKmRldiA9IGNhbS0+ZGV2Ow0KPiA+ID4gK2NvbnN0IHN0
cnVjdCB2NGwyX3BpeF9mb3JtYXRfbXBsYW5lICpmbXQgPSAmdmRldi0+Zm9ybWF0Ow0KPiA+ID4g
K2ludCByZXQ7DQo+ID4gPiArdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiA+ICsNCj4gPiA+ICtp
ZiAocG1fcnVudGltZV9nZXRfc3luYyhkZXYpIDwgMCkgew0KPiA+ID4gK2Rldl9lcnIoZGV2LCAi
ZmFpbGVkIHRvIGdldCBwbV9ydW50aW1lXG4iKTsNCj4gPiA+ICtwbV9ydW50aW1lX3B1dF9hdXRv
c3VzcGVuZChkZXYpOw0KPiA+ID4gK3JldHVybiAtMTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4g
PiArKCpjYW0tPmh3X2Z1bmN0aW9ucy0+bXRrX2NhbV9zZXR1cCkoY2FtLCBmbXQtPndpZHRoLCBm
bXQtPmhlaWdodCwNCj4gPiA+ICtmbXQtPnBsYW5lX2ZtdFswXS5ieXRlc3BlcmxpbmUsIHZkZXYt
PmZtdGluZm8tPmNvZGUpOw0KPiA+ID4gKw0KPiA+ID4gKw0KPiA+ID4gKy8qIEVuYWJsZSBDTU9T
IGFuZCBWRiAqLw0KPiA+ID4gK210a19jYW1fY21vc192Zl9lbmFibGUoY2FtLCB0cnVlLCB0cnVl
KTsNCj4gPiA+ICsNCj4gPiA+ICttdXRleF9sb2NrKCZjYW0tPm9wX2xvY2spOw0KPiA+ID4gKw0K
PiA+ID4gK3JldCA9IG10a19jYW1fdmVyaWZ5X2Zvcm1hdChjYW0pOw0KPiA+ID4gK2lmIChyZXQg
PCAwKQ0KPiA+ID4gK2dvdG8gZmFpbF91bmxvY2s7DQo+ID4gPiArDQo+ID4gPiArLyogU3RhcnQg
c3RyZWFtaW5nIG9mIHRoZSB3aG9sZSBwaXBlbGluZSBub3cqLw0KPiA+ID4gK2lmICghY2FtLT5w
aXBlbGluZS5zdGFydF9jb3VudCkgew0KPiA+ID4gK3JldCA9IG1lZGlhX3BpcGVsaW5lX3N0YXJ0
KHZkZXYtPnZkZXYuZW50aXR5LnBhZHMsDQo+ID4gPiArICAgJmNhbS0+cGlwZWxpbmUpOw0KPiA+
ID4gK2lmIChyZXQpIHsNCj4gPiA+ICtkZXZfZXJyKGRldiwgImZhaWxlZCB0byBzdGFydCBwaXBl
bGluZTolZFxuIiwgcmV0KTsNCj4gPiA+ICtnb3RvIGZhaWxfdW5sb2NrOw0KPiA+ID4gK30NCj4g
PiA+ICt9DQo+ID4gPiArDQo+ID4gPiArLyogTWVkaWEgbGlua3MgYXJlIGZpeGVkIGFmdGVyIG1l
ZGlhX3BpcGVsaW5lX3N0YXJ0ICovDQo+ID4gPiArY2FtLT5zdHJlYW1fY291bnQrKzsNCj4gPiA+
ICsNCj4gPiA+ICtjYW0tPnNlcXVlbmNlID0gKHVuc2lnbmVkIGludCktMTsNCj4gPiA+ICsNCj4g
PiA+ICsvKiBTdHJlYW0gb24gdGhlIHN1Yi1kZXZpY2UgKi8NCj4gPiA+ICtyZXQgPSB2NGwyX3N1
YmRldl9jYWxsKCZjYW0tPnN1YmRldiwgdmlkZW8sIHNfc3RyZWFtLCAxKTsNCj4gPiA+ICtpZiAo
cmV0KQ0KPiA+ID4gK2dvdG8gZmFpbF9ub19zdHJlYW07DQo+ID4gPiArDQo+ID4gPiArbXV0ZXhf
dW5sb2NrKCZjYW0tPm9wX2xvY2spOw0KPiA+ID4gKw0KPiA+ID4gKy8qIENyZWF0ZSBkdW1teSBi
dWZmZXIgKi8NCj4gPiA+ICtjYW0tPmR1bW15X3NpemUgPSBmbXQtPnBsYW5lX2ZtdFswXS5zaXpl
aW1hZ2U7DQo+ID4gPiArDQo+ID4gPiArY2FtLT5kdW1teS52YWRkciA9IGRtYV9hbGxvY19jb2hl
cmVudChjYW0tPmRldiwgY2FtLT5kdW1teV9zaXplLA0KPiA+ID4gKyAgICAgICZjYW0tPmR1bW15
LmRhZGRyLCBHRlBfS0VSTkVMKTsNCj4gPg0KPiA+IER1bW15IGJ1ZmZlciBjb3N0IG11Y2ggaW4g
RFJBTSBmb290cHJpbnQuIEkgdGhpbmsgd2UgY2FuIGdldCByaWQgb2YNCj4gPiB0aGlzIGR1bW15
IGJ1ZmZlci4gSWYgbm8gYnVmZmVyIGlzIHF1ZXVlZCBmcm9tIHVzZXIgc3BhY2UsIGNhbGwNCj4g
PiBtdGtfY2Ftc3YzMF9jbW9zX3ZmX2h3X2Rpc2FibGUoKSB0byBzdG9wIHdyaXRlIGRhdGEgaW50
byBEUkFNLiBBZnRlcg0KPiA+IGJ1ZmZlciBpcyBxdWV1ZWQgZnJvbSB1c2VyIHNwYWNlLCBjYWxs
IG10a19jYW1zdjMwX2Ntb3NfdmZfaHdfZW5hYmxlKCkNCj4gPiB0byBzdGFydCB3cml0ZSBkYXRh
IGludG8gRFJBTS4NCj4gPg0KPiANCj4gSGkgQ0ssDQo+IA0KPiBJTUhPIGl0IGRvZXMgbm90IGNv
c3QgdGhhdCBtdWNoLiBBIGxvbmcgdGltZSBhZ28sIHdlIHRyaWVkIHRvIHJlbW92ZQ0KPiBpdCwg
YnV0IHdlIGZhY2VkIGFuIGlzc3VlIChjYW4ndCByZW1lbWJlciB3aGF0IDovKS4NCg0KNTM3NiAq
IDQwMzIgKiAyID0gNDMzNTIwNjQgKGJ5dGVzKSBpcyBhIGxhcmdlIHNpemUgZm9yIG1lLg0KDQpJ
ZiB0aGlzIGlzIGEgc29mdHdhcmUgaXNzdWUsIGZpeCBpdC4NCklmIHRoaXMgaXMgYSBoYXJkd2Fy
ZSBsaW1pdGF0aW9uLCBhZGQgY29tbWVudCB0byBkZXNjcmliZSBob3cgaGFyZHdhcmUgd29yayBz
byBuZWVkIHRoaXMgZHVtbXkgYnVmZmVyLg0KSWYgbmV4dCBTb0MgaGFzIG5vIHRoaXMgaGFyZHdh
cmUgbGltaXRhdGlvbiwgd2UgY291bGQgZHJvcCBkdW1teSBidWZmZXIgaW4gbmV4dCBTb0MuDQoN
Cj4gTW9yZW92ZXIsIHNvbWUgb3RoZXIgZHJpdmVyIGFscmVhZHkgdXNlcyB0aGUgZHVtbXkgYnVm
ZmVyDQo+IGltcGxlbWVudGF0aW9uLCBpZiBJIGFtIG5vdCB3cm9uZy4NCg0KSSB0aGluayBldmVy
eSBkcml2ZXIgaGFzIGRpZmZlcmVudCByZWFzb24gdG8gdXNlIGR1bW15IGJ1ZmZlci4NClNvIHdl
IGNvdWxkIG5vdCBkaXJlY3RseSBpbmZlciB0aGF0IHRoaXMgZHJpdmVyIG5lZWQgZHVtbXkgYnVm
ZmVyLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gQ2hlZXJzDQo+IEp1bGllbg0KPiANCj4gPiBS
ZWdhcmRzLA0KPiA+IENLDQo+ID4NCj4gPiA+ICtpZiAoIWNhbS0+ZHVtbXkudmFkZHIpIHsNCj4g
PiA+ICtyZXQgPSAtRU5PTUVNOw0KPiA+ID4gK2dvdG8gZmFpbF9ub19idWZmZXI7DQo+ID4gPiAr
fQ0KPiA+ID4gKw0KPiA+ID4gKy8qIHVwZGF0ZSBmaXJzdCBidWZmZXIgYWRkcmVzcyAqLw0KPiA+
ID4gKw0KPiA+ID4gKy8qIGFkZGVkIHRoZSBidWZmZXIgaW50byB0aGUgdHJhY2tpbmcgbGlzdCAq
Lw0KPiA+ID4gK3NwaW5fbG9ja19pcnFzYXZlKCZjYW0tPmlycWxvY2ssIGZsYWdzKTsNCj4gPiA+
ICtpZiAobGlzdF9lbXB0eSgmY2FtLT5idWZfbGlzdCkpIHsNCj4gPiA+ICsoKmNhbS0+aHdfZnVu
Y3Rpb25zLT5tdGtfY2FtX3VwZGF0ZV9idWZmZXJzX2FkZCkoY2FtLCAmY2FtLT5kdW1teSk7DQo+
ID4gPiArY2FtLT5pc19kdW1teV91c2VkID0gdHJ1ZTsNCj4gPiA+ICt9IGVsc2Ugew0KPiA+ID4g
K2J1ZiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmY2FtLT5idWZfbGlzdCwNCj4gPiA+ICsg
ICAgICAgc3RydWN0IG10a19jYW1fZGV2X2J1ZmZlciwNCj4gPiA+ICsgICAgICAgbGlzdCk7DQo+
ID4gPiArKCpjYW0tPmh3X2Z1bmN0aW9ucy0+bXRrX2NhbV91cGRhdGVfYnVmZmVyc19hZGQpKGNh
bSwgYnVmKTsNCj4gPiA+ICtjYW0tPmlzX2R1bW15X3VzZWQgPSBmYWxzZTsNCj4gPiA+ICt9DQo+
ID4gPiArc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY2FtLT5pcnFsb2NrLCBmbGFncyk7DQo+ID4g
PiArDQo+ID4gPiArcmV0dXJuIDA7DQo+ID4gPiArDQo+ID4gPiArZmFpbF9ub19idWZmZXI6DQo+
ID4gPiArbXV0ZXhfbG9jaygmY2FtLT5vcF9sb2NrKTsNCj4gPiA+ICt2NGwyX3N1YmRldl9jYWxs
KCZjYW0tPnN1YmRldiwgdmlkZW8sIHNfc3RyZWFtLCAwKTsNCj4gPiA+ICtmYWlsX25vX3N0cmVh
bToNCj4gPiA+ICtjYW0tPnN0cmVhbV9jb3VudC0tOw0KPiA+ID4gK2lmIChjYW0tPnN0cmVhbV9j
b3VudCA9PSAwKQ0KPiA+ID4gK21lZGlhX3BpcGVsaW5lX3N0b3AodmRldi0+dmRldi5lbnRpdHku
cGFkcyk7DQo+ID4gPiArZmFpbF91bmxvY2s6DQo+ID4gPiArbXV0ZXhfdW5sb2NrKCZjYW0tPm9w
X2xvY2spOw0KPiA+ID4gK210a19jYW1fdmIyX3JldHVybl9hbGxfYnVmZmVycyhjYW0sIFZCMl9C
VUZfU1RBVEVfUVVFVUVEKTsNCj4gPiA+ICsNCj4gPiA+ICtyZXR1cm4gcmV0Ow0KPiA+ID4gK30N
Cj4gPiA+ICsNCj4gPg0KPiA+ICoqKioqKioqKioqKiogTUVESUFURUsgQ29uZmlkZW50aWFsaXR5
IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0KPiA+IFRoZSBpbmZvcm1hdGlvbiBjb250YWlu
ZWQgaW4gdGhpcyBlLW1haWwgbWVzc2FnZSAoaW5jbHVkaW5nIGFueQ0KPiA+IGF0dGFjaG1lbnRz
KSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3
aXNlDQo+ID4gZXhlbXB0IGZyb20gZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0
IGlzIGludGVuZGVkIHRvIGJlDQo+ID4gY29udmV5ZWQgb25seSB0byB0aGUgZGVzaWduYXRlZCBy
ZWNpcGllbnQocykuIEFueSB1c2UsIGRpc3NlbWluYXRpb24sDQo+ID4gZGlzdHJpYnV0aW9uLCBw
cmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBp
dHMNCj4gPiBhdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCByZWNpcGllbnQocykgaXMgc3RyaWN0
bHkgcHJvaGliaXRlZCBhbmQgbWF5DQo+ID4gYmUgdW5sYXdmdWwuIElmIHlvdSBhcmUgbm90IGFu
IGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIGUtbWFpbCwgb3IgYmVsaWV2ZQ0KPiA+IHRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlcg0KPiA+IGltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRl
bGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YNCj4gPiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFu
eSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwgYW5kIGRvIG5vdA0KPiA+IGRpc2Nsb3Nl
IHRoZSBjb250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlv
dSENCj4gDQo=

