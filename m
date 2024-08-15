Return-Path: <linux-media+bounces-16342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4651952E9E
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 14:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C87961C23A25
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 12:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC7519DF62;
	Thu, 15 Aug 2024 12:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gMx8grvN";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XGaOcjdH"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF95A19AA53;
	Thu, 15 Aug 2024 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723726765; cv=fail; b=Eea09yD6geeSjxxaQqHjim26CfcscjpTuqR3a9AxkIWAyanR4l1U8hjmzN8FLpRbj1irLx3ttxgRcDWaG5o651r7v/odx5AGGFnUKXdzJSvuTbWzVzxUF772rPn6WMGjuP1wqSylWK9q12GJW2DE/X8KEriF/HY+K6rfZqT8x7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723726765; c=relaxed/simple;
	bh=DtnCwA+9TTGIQoKmJ8simJ/aJQkTssrVMDHcB6ij4u0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i55T2ZXKN9sbMyiWWhE+nGGOfzFYKkNqvRx5nGePivCwcH6vi/l5pKmNSeFNqtbH6ofyAd1siGxEbCydXIWeKPZA5CxhaGJ+RDHqnOewMQXL4u+qYjykyaP0SG0xEukw43kWfv7Cet6xvSrHglgnLJKEX01ee8FiRYYgQ3g35dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gMx8grvN; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=XGaOcjdH; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2879d40a5b0611ef8593d301e5c8a9c0-20240815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=DtnCwA+9TTGIQoKmJ8simJ/aJQkTssrVMDHcB6ij4u0=;
	b=gMx8grvNuVHRH3RzBfzaKnbB5Ab/hLZPIqyPG315L8THLi8BsmBGl+e+r+OKGzMZWOJEUIi50Y+ivmTkJpB0ZkDIsHkAQabBFp1S4/paPSd2ZadHAV6z1mmeiwxrpTi2fAiTSxYGt+spw1zG7sp6XDsoDSaJNOC6RjO1HUpYZjY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:b176fed6-18e0-4fce-99b1-f4ef1297fe29,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:4451333f-6019-4002-9080-12f7f4711092,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2879d40a5b0611ef8593d301e5c8a9c0-20240815
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 147788154; Thu, 15 Aug 2024 20:59:07 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 15 Aug 2024 05:59:09 -0700
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 15 Aug 2024 20:59:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S66V43vaqF1OXocnDfcVgc1z5SBqpETdXXwjcq49zYvk4NejhXWEJAeTCpCywCceRNQtdvvSLawqsgwrqSoyjDlxp8yGWvAbfXHPTmybFrVrqovbAp+ECM9ME3+lC2fQ7atT2M5xnbqeGDO97ty6xN/OqTH/pBSJAQ5dE8gqi9662DMm5y9CF7X/IMDRt7D8ytDuzo5066FFpaSuTLp6TJdY2cN4NuMnPPK+Lrw55qdC8IOEdeB50FPva8nvnvz5RRjgQmtArftIra+upLH5/ajN526Rdd8pTGAwaQvRAYw9CVhj8/0Hjrn57yc9Tg4jGjo5PC2Ls2Yl9DLnKO8D2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtnCwA+9TTGIQoKmJ8simJ/aJQkTssrVMDHcB6ij4u0=;
 b=M2Muopv2+aldwhEBIiSLYoBXj7fFTeV0MpMkt9OuOMHys+dpBoYh4ma0hvj9g+ou/finTbVEW1lHUEonDtqLkf/A3rC+PBNfLRCobu2jTW/hkY7Y1cGWjWX1/3JXL6KWE/7/bmoYrhjpJOqKsUuPr1nl+L8ws3czyxdfbfjjl5dw+fuh/+2V5bRgrDZa5qBYO9jH+/WWjz6ZjGvf6i53pUGgaGkgjzz+e+qDpbOFfD++fakKImb55P8gAkbINc5F0CQlrp2JnTdpm+4938gTd2JLXwePYwl8CJzolou/piROdCipYuSEYwCnjzeY8USm9oMx6TUEseaMfWk4gnDzog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtnCwA+9TTGIQoKmJ8simJ/aJQkTssrVMDHcB6ij4u0=;
 b=XGaOcjdHD7XDGwEA6N/ZeKx+/vpnp7U9cY4+O0pQWu1jaJb183FmIM7ubRI7a0nywPbU46uRpPemFypidz8s+bojbubf+IdTu6+xGBCTZkS1FxfjdCFTPkX2ehvcIPJtw1QkxO2sUfzEoGXAJ5AZyuzGyesi7jSAowOgjhJ2Cdc=
Received: from TYSPR03MB8684.apcprd03.prod.outlook.com (2603:1096:405:91::8)
 by KL1PR03MB7392.apcprd03.prod.outlook.com (2603:1096:820:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 12:58:47 +0000
Received: from TYSPR03MB8684.apcprd03.prod.outlook.com
 ([fe80::c68e:38c4:8f59:b6a3]) by TYSPR03MB8684.apcprd03.prod.outlook.com
 ([fe80::c68e:38c4:8f59:b6a3%2]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 12:58:47 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "nhebert@chromium.org" <nhebert@chromium.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
	<stevecho@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@chromium.org"
	<hsinyi@chromium.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 0/7] media: mediatek: vcodec: fix
 v4l2_ctrl_request_complete fail
Thread-Topic: [PATCH v4 0/7] media: mediatek: vcodec: fix
 v4l2_ctrl_request_complete fail
Thread-Index: AQHa6KNT8A91YPEu7USNz2xHos0eNrIbxKYAgAyPzIA=
Date: Thu, 15 Aug 2024 12:58:47 +0000
Message-ID: <b19335d01870fca6b242a8cce44c2d4d799dfb77.camel@mediatek.com>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
	 <be4baa6313d16ed52245347d866dd878049a12a0.camel@collabora.com>
In-Reply-To: <be4baa6313d16ed52245347d866dd878049a12a0.camel@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR03MB8684:EE_|KL1PR03MB7392:EE_
x-ms-office365-filtering-correlation-id: 23ac09aa-9a47-4da3-fab1-08dcbd2a007a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aWlXSmdPMzFhbTVGVHN0Y3Npdkt4MUpPdXBaZXVnb3lUNW9OVExDYlh1NGFB?=
 =?utf-8?B?bzlRMGpKZmxONUFreHFOZnpwaWtueTVORVZZdkNxQm1RamF3QlBWTWswa2tk?=
 =?utf-8?B?WVBrU2hOMVZCbWxaUzd6UHRaQlpLaEZrMFRidjZFd3MycVBVNUdVK1gxNDJJ?=
 =?utf-8?B?RmFoVTREREhEOG9JRUMyWnB4UnZhY29CVGFwMTQzMjRQTDI3VUJkcmVUNjhO?=
 =?utf-8?B?Qk1EcWNRUWthR2F1YWxNOUphQkhLMjdrNGFiRHZtcDZ4S2p4QlBQSzN5eXBH?=
 =?utf-8?B?K1o0RnBDdXlSSjJXSWx6VjVwOFdvL2VuU2lxWk52ODkxVHdaamc3dHdIcWNp?=
 =?utf-8?B?RmdzTFNQcUpFUkFIOE1KUUxBRzVaYTNuT0R1Y3Z3TXZrbXNTZTRRYTBtTkM4?=
 =?utf-8?B?ZXIra0Q5Yi9SWVpaVTY1N3liNE1yZys5NzNzcGtWQjZ5TCtodTdXNUI0RzAz?=
 =?utf-8?B?UGppK3FjSHRVWDIrOXBpSDRaeU1FVW1mRGhVQzVSLzN6eFRCMjhVTENiaU9r?=
 =?utf-8?B?MElicEk4em9FMXB0YUJaeHJOMWt6Y21WcFVveHN4eGRyMnRyelcvQkUyOUdE?=
 =?utf-8?B?NDBhSXpkQ3gzcWs3ODZ4ZDZXRGh3ZTBXU2FNS3Vua1U0R0lHT2NOejByVXRr?=
 =?utf-8?B?MUtSMkFWMXBBbnBJdENUL1NHbjFONDRrc0x2TklKNXl0OU9EYVEyakoveEM0?=
 =?utf-8?B?YkFTQjQ4bVIxdjJvRlVUcVYvVmVUWi9TZHlXMnJzdjdXRlhMN2VsREM5ZW5z?=
 =?utf-8?B?em8yQ0lsdTFUTE5SY1JMaEVGb2h2c3BBdVRQMC9URXJubU1MVjZPZ2p2Ymcy?=
 =?utf-8?B?cDJPanFiR1lmdDB5YTlJd3JjQmJ2djJxTTFpQWExb2ZtTklNVzIydENGdy9G?=
 =?utf-8?B?VXdocjFFY3l3akFFWkxSSVNVUUlXN2hFckZqMS9wOGU0anBxQVZvWlNkSGY2?=
 =?utf-8?B?K2w3ODBvWlJFbjd6amdUcm9ESE9nbXpQZHprTWpRNGNncytJaFNLdWNhYU9R?=
 =?utf-8?B?ZUxjdVFyalBHZmtyeDVndWtGMm5pZUtpVWl2Q3Q2Y3JjRnZUNVVzNkh4cU1I?=
 =?utf-8?B?Y3lyWDFpSW4ydTdQbmhZOVNidWZFR3Jid2JhbnlGVGRtRVRQdHF1UzBvRmFu?=
 =?utf-8?B?VllmaXFoSGh4SWhvRjAwZEtaYVRCUXRXU1E5dkdzQ1dNN1AyZ2syUStVUGo2?=
 =?utf-8?B?Zkl5cVp5bzdzY1F0dEY2dTU1UWlaMjZJRWhobU9RVmx5OGN2OUFRTSt6cDYx?=
 =?utf-8?B?dDBXQ2dCMEI4am9NK2lXaEducTVhVVo3MXpQSjk5VFVqVE1uQVZnekJZWHpK?=
 =?utf-8?B?eDJGWHloTnVSeTVxT21NWElxWmRLNUhYeStUU1YxdStVQ2lpVzV6dFpoNlVv?=
 =?utf-8?B?R2FlcnpBSERXdTlIVzN1OTVFWDMwOUR4NXkzUUJ3R3BTUXlJWmtWUUxvbUh0?=
 =?utf-8?B?N2pYQUl5OUFyVDJiaklxZXNiYzRpQzROalhpTE9CemNUVWxxWUhjY3NXM1hP?=
 =?utf-8?B?bmsxQStUd1FZamNpYWhDRHo4bmQ2SVB2ZXd6cDA3VGUvdkRhaGhKYjlBd1Rk?=
 =?utf-8?B?TVdQSDFadmZjS20wMjErL2EycXFwaXZyNVlFd01NR2V1OFNtcGxOMzYzM0dx?=
 =?utf-8?B?ZlhMek5zSDhEclBQWlhUdEc1R00vQmlPKzlYYUxnVWt6c0x4SlM4SU9KK2ZN?=
 =?utf-8?B?OVpZckNoWk02NzNjd1g5Tnd0alh0VFlyT1hDL3NQdUQ0RGpzVUhEcjRWQzdK?=
 =?utf-8?B?MWdpZk9sOWZWdWVNdWVvNG1lVHh5aUhxY3RnM1prSnYrejlIdTNiZWd0QW90?=
 =?utf-8?B?UTJSdjMvNlFBMUpWcVNENm4xM0ViS3RZTFBlWjVIR1BZSVErdXR2UC8xN0xu?=
 =?utf-8?B?T1ZRRzExSzVqMU5DTGtVUDE4MnZLUDBWaEd6Sms3T3dHQ3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8684.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFY0SWI3YVJjN1phUC9meXB3QXhVYWtuVUwvdnBVZGZqTi90L3M5RTd0MXBG?=
 =?utf-8?B?ODhOTWhrR1dqWGRieS9MS2xLdFdnZ2JMMVh0dmhWUEo0SGx0ei9Icm05VGtL?=
 =?utf-8?B?NzFIcElGOFY1eG5FSTNlcnR4cEtMRmxFRGJsK3VZNmZiVVFyL2FYdWV0MzMv?=
 =?utf-8?B?ek52T0hOYWVSWGJWcnJRYVh5M3FQZXp2dVBWMC8zNVZWQmhKVkdtdUQwR2gy?=
 =?utf-8?B?YnlLaWNnbDdlWkZOcjFsd2RtSGF4ei9OaGpyTVNVWmV3MldxZjg4WUVSQ1E1?=
 =?utf-8?B?OTJ3SFNSdUl6YnBUMUh2aW9zUkFKQ2xYSEtJUnhGWkdIbWdqcCtEZ2NBejcy?=
 =?utf-8?B?ZDlzNVNvQXJXdktsNWUxb1MxWndjN2RQYlJDSEhtaTJvTnUvQTRuZGVuTExj?=
 =?utf-8?B?cEZlTTRtaWVvdFF0ODFaTnNveUVQTk5zb0luSkhFY3VobjdSbDNmS0MzTEU3?=
 =?utf-8?B?ZHpta0dBSG9telZYVXJjU0xDSDRQZTg4V3c5bG95bE80MFVTYzBPZG1GUTk0?=
 =?utf-8?B?cjh4S1ZiWkhJaGhvK2kzVk9uUVVNVHVQd3BMZVUwTDFDTkZKZEZ0RlVka0tu?=
 =?utf-8?B?VWJwd2NIaXdIMkYvN1RUNDJlTXB2MllzT0paQ0FOb0Q5cXA4anBjbGhGT0gx?=
 =?utf-8?B?YWRaWmNUWU15NTRLcHQ4VHZVOHpuR1hjUXI3d0xiWHNRQlUxSVRBOTVEY3Fr?=
 =?utf-8?B?MmtWbmhzNy96WDNkd3pBTDBiY3kvUlE5OWw1Mk9DelhQc0grNUpnb0dkUUc2?=
 =?utf-8?B?dSs2YWtjYjhHMUF0MUtlSUt5eTlBZ1FiT1VOZHZPQm9nRWZYYU9ORWN2cWp2?=
 =?utf-8?B?bG0wV3BjV1BqbFF0eWFVT2xROFA3Z2QrdHBFVlhwZHZVZGUreTlvdVRnWnla?=
 =?utf-8?B?SEJkRHFQVzBnQ3BJSnFlTXhwZ1U4c25TUENyRzI3eVFlREMwZWRwd0dHWGRH?=
 =?utf-8?B?c3pOdlc0bm9jOENnSnpBOUNBNnNCN3ZpT1VZWTVlMmdSanQyRXFGbWxRNndM?=
 =?utf-8?B?bDNFREF3RGpXUjhnYXNPZjQ4VVBKOFFsZ04xczgzVlpTbzIyTmlYNldWcG1a?=
 =?utf-8?B?OUlVbjlQaXloOUZBRUZENGhmU2NXTjM0WHpGYVVXZ2xJREFaYUlpWGRqQVpm?=
 =?utf-8?B?TVJGbnZ2dXN5Y3ovRmViTXNKSGExT1dqYmN6QmRWd3lKNWxvN29JaERhbmFt?=
 =?utf-8?B?SExoMWRkdVFrbW1kUUdLTVIzMG5vWktUeGMwWWc1U3FnVlZMc0JzZzlrQXJQ?=
 =?utf-8?B?NDlmcWR1MXZxakViMzlBa0J2VUhOcWFpU09KWDJVd2lOR05EcnBHOTYxbVZ4?=
 =?utf-8?B?SUxSNFlma2gwZUZSaEZOcWJDUUJ5cHowNS9sUk1pOVExZng4dUpnU1VLRGQ0?=
 =?utf-8?B?bFlpSndvd3gxeEpvSGxDdmp0RFFOQTYvWStNVXY2Vmtna1h3RStGRXNodjcv?=
 =?utf-8?B?d0Rpa2hab2NvRHA4Q0djYndKRkF2eUw5SUptSkJ5M2ppUllNL2N2VlhLR3FT?=
 =?utf-8?B?RGNRS1V4UW9rUUNhanhmTHNMRlpiR3RLbWo2RnlUODNWakovNk15U2hYRHlB?=
 =?utf-8?B?a0dXK2U2VFdlNkxEYU9haUJNYTVSYy84ZThNajNuM3pOZThBaHpjb2RRbzFI?=
 =?utf-8?B?VGR6aGxSMDBCakM1ZVNHSVZnSkhZN0xCTnZLZ05DNWdmSys0bjZySHpPL0xI?=
 =?utf-8?B?blRCNkM4a1RFdGgvQTZHYmdMZlRTNnU4dDEwOEJML01CVGxRckxlTTRuMS9M?=
 =?utf-8?B?S1hzclowdGREYXhXWGI1Ymh6S3RjOVh3QUJKdFA1L0dDZkE5NW5YUGlyQ3lN?=
 =?utf-8?B?cXFwNUFrYmJlOTZFYkF2Z2RyVm5WSXpwRWcvVGJGbmFGaUhmU3d5cHU2YmVp?=
 =?utf-8?B?SGRCNm8vTVpjcVV6RnZjV002SERLdktlZzlMTmRMTDdaTVFNRkJSdnY2TThW?=
 =?utf-8?B?R1pMRCtLSGlmd1NjT2h4bVJQTm9QMmovSTdMLzcvcnVLbHIxTC9IWWhsOWZn?=
 =?utf-8?B?OEhDU1k1R05hVnpJMnNYdDFST3FCWjd0TUNhaFBvQU9taHc5cVhPd3NMbXpn?=
 =?utf-8?B?Yy9GbFBXdHJ0c2hFNG9jT3pkOTN5bkk2ZldFTmV6WWk5Skx5a00renlFOHRx?=
 =?utf-8?B?UXdXS3FHQ0ZvR1ZKcFY1MEUyT3FzaGtmOENkNCtDNEd6NHkzalVqbjZiaFR0?=
 =?utf-8?B?UHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1013C166BB64D7459BD6F2FDEA100FB4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8684.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ac09aa-9a47-4da3-fab1-08dcbd2a007a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 12:58:47.3740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CuE+TfhWvywxYKoshywOmF/1GjVUNNournjkjUbp9dkX0sWROXsoGVUMtnOcVdLmFGWP+9Vn5oSu/3Mb+pVZmAtg4DLPqm1IiJOQQQ77hzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7392
X-MTK: N

SGkgTmljb2xhcywNCg0KVGhhbmtzIGZvciB5b3VyIGFkdmljZS4NCg0KT24gV2VkLCAyMDI0LTA4
LTA3IGF0IDA5OjA4IC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3RlOg0KPiA+IA0KDQo+IEhp
IFl1bmZlaSwNCj4gDQo+IExlIG1lcmNyZWRpIDA3IGFvw7t0IDIwMjQgw6AgMTY6MjQgKzA4MDAs
IFl1bmZlaSBEb25nIGEgw6ljcml0IDoNCj4gPiB2NGwyX20ybV9idWZfZG9uZSBpcyBjYWxsZWQg
aW4gbGF0IHdvcmsgcXVldWUsDQo+ID4gdjRsMl9jdHJsX3JlcXVlc3RfY29tcGxldGUNCj4gPiBp
cyBjYWxsZWQgaW4gY29yZSBxdWV1ZS4gVGhlIHJlcXVlc3Qgc3RhdHVzIG9mIG91dHB1dCBxdWV1
ZSB3aWxsIGJlDQo+ID4gc2V0IHRvDQo+ID4gTUVESUFfUkVRVUVTVF9TVEFURV9DT01QTEVURSB3
aGVuIHY0bDJfbTJtX2J1Zl9kb25lIGlzIGNhbGxlZCwNCj4gPiBsZWFkaW5nIHRvDQo+ID4gb3V0
cHV0IHF1ZXVlIHJlcXVlc3QgY29tcGxldGUgZmFpbC4gTXVzdCBtb3ZlDQo+ID4gdjRsMl9jdHJs
X3JlcXVlc3RfY29tcGxldGUNCj4gPiBpbiBmcm9udCBvZiB2NGwyX20ybV9idWZfZG9uZS4NCj4g
DQo+IFNlYmFzdGlhbiBhbmQgSSBoYXZlIGFuYWx5emVkIGZ1cnRoZXIgdGhlIGlzc3VlIGFuZCB0
aGUgZGVzY3JpcHRpb24NCj4gaGVyZSBkb2VzDQo+IG5vdCBzZWVtIHRvIG1hdGNoLiBXaGF0IGhh
cHBlbnMgaXMgdGhhdCBpbiBTdGF0ZWxlc3MgZGVjb2RpbmcsIHlvdQ0KPiBoYXZlIHRvIHNldA0K
PiBoZWFkZXIgY29udHJvbHMgb3V0LW9mLXJlcXVlc3QgdG8gbmVnb3RpYXRlIHRoZSBmb3JtYXQg
YXQgZmlyc3QuDQo+IA0KPiBXaXRoIFZQOSBub3RhYmx5LCB0aGUgaGVhZGVyIGNvbnRyb2wgaXMg
dGhlIG9ubHkgY29udHJvbCB0aGVyZSBpcy4NCj4gQ2hyb21pdW0gd2lsbA0KPiBvcHRpbWl6ZSBv
dXQgdGhpcyBhbmQgb25seSBhdHRhY2ggYSBiaXRzdHJlYW0gYnVmZmVyIHRvIHRoZSByZXF1ZXN0
Lg0KPiBTbyB3aGVuIHRoZQ0KPiBidWZmZXIgaXMgbWFyayB0byBkb25lLCBpdCBpcyB0aGUgbGFz
dCBvYmplY3QgaW4gdGhlIHJlcXVlc3QsIHdoaWNoDQo+IGltcGxpY2l0bHkNCj4gbWFyayB0aGUg
cmVxdWVzdCBhcyBjb21wbGV0ZS4NCj4gDQo+IFdoZW4gdjRsMl9jdHJsX3JlcXVlc3RfY29tcGxl
dGUoKSBpcyBsYXRlciBjYWxsZWQsIHRoZSBjb250cm9sIGNvZGUNCj4gZGV0ZWN0IHRoYXQNCj4g
dGhlcmUgaXMgbm8gY29udHJvbHMgaW4gdGhlIHJlcXVlc3QuIEl0IHRoZW4gY3JlYXRlcyBhbiBl
bXB0eQ0KPiBjb250cm9sLCBidXQNCj4gYXR0YWNoaW5nIGFuIG9iamVjdCB0byBhIGNvbXBsZXRl
ZCByZXF1ZXN0IGlzIG5vdCBhbGxvd2VkLg0KPiANCg0KV2hldGhlciBJIGNhbiB3cml0ZSB0aGUg
Y29tbWl0IG1lc3NhZ2UgYXMgYmVsb3c6DQoNCiJVc2VyIHNwYWNlIHdpbGwgYXR0YWNoIHRoZSBz
eW50YXhlcyBhbmQgYml0LXN0cmVhbSBidWZmZXIgdG8gYSBtZWRpYQ0KcmVxdWVzdCBmb3Igc3Rh
dGVsZXNzIGRlY29kaW5nLCBhbmQgdGhlIHN5bnRheCBjb250cm9scyBhcmUgdGhlIG9ubHkNCnY0
bDIgY29udHJvbCByZXF1ZXN0LiBUaGUgcmVxdWVzdCB3aWxsIGJlIG1hcmtlZCB0byBjb21wbGV0
ZSBzdGF0dXMNCndoZW4gdGhlIGJ1ZmZlciBpcyBzZXQgdG8gZG9uZSwgdGhlbiByZXF1ZXN0IG9i
amVjdCB3aWxsIGJlIGNsZWFuZWQNCmZyb20gbWVkaWEgcmVxdWVzdC4NCiANCldoZW4gdjRsMl9j
dHJsX3JlcXVlc3RfY29tcGxldGUoKSBpcyBsYXRlciBjYWxsZWQsIHRoZSBjb250cm9sIHJlcXVl
c3QNCmRldGVjdCB0aGF0IHRoZXJlIGlzIG5vIGNvbnRyb2xzIGluIHRoZSByZXF1ZXN0IG9iamVj
dC4gSXQgdGhlbiBjcmVhdGVzDQphbiBlbXB0eSBjb250cm9sIHJlcXVlc3Qgb2JqZWN0LCBidXQg
YXR0YWNoaW5nIGFuIG9iamVjdCB0byBhIGNvbXBsZXRlZA0KcmVxdWVzdCBpcyBub3QgYWxsb3dl
ZC4iDQoNCj4gPiBQYXRjaCAxIHNldHRpbmcgcmVxdWVzdCBjb21wbGV0ZSBiZWZvcmUgYnVmZmVy
IGRvbmUNCj4gPiBQYXRjaCAyIGNoYW5nZSBmbHVzaCBkZWNvZGUgb3JkZXIgd2hlbiBzdHJlYW0g
b2ZmDQo+ID4gUGF0Y2ggMyBmbHVzaCBkZWNvZGVyIGJlZm9yZSBzdHJlYW0gb2ZmDQo+ID4gUGF0
Y2ggNCB1c2luZyBpbnB1dCBpbmZvcm1hdGlvbiB0byBnZXQgdmIyIGJ1ZmZlcg0KPiA+IFBhdGNo
IDUgc3RvcmUgc291cmNlIHZiMiBidWZmZXINCj4gPiBQYXRjaCA2IHJlcGxhY2UgdjRsMl9tMm1f
bmV4dF9zcmNfYnVmIHdpdGggdjRsMl9tMm1fc3JjX2J1Zl9yZW1vdmUNCj4gPiBQYXRjaCA3IHJl
bW92ZSBtZWRpYSByZXF1ZXN0IGNoZWNraW5nDQo+IA0KPiBJIHdpbGwgZ2l2ZSBhIHNvbWUgdGVz
dGluZyBzb29uLiBDYW4geW91IGNsYXJpZnkgb24gaWYgdGhlIExBVCBhbmQNCj4gdGhlIENPUkUN
CkhhdmUgeW91IGFscmVhZHkgaGVscGVkIHRvIGRvIHRoZSBmbHVzdGVyIHRlc3Q/DQoNCj4gc3Rp
bGwgcnVucyBpbiBwYXJhbGxlbCBhZnRlciB0aGlzIGNoYW5nZSA/DQo+IA0KWWVzLCB0aGUgZHJp
dmVyIGNhbiB3b3JrIGluIHBhcmFsbGVsLg0KDQpDb3VsZCB5b3UgcGxlYXNlIGhlbHAgdG8gcmV2
aWV3IG90aGVyIHBhdGNoZXM/DQoNCj4gTmljb2xhcw0KPiANCkJlc3QgUmVnYXJkcywNCll1bmZl
aSBEb25nDQo+ID4gDQo+ID4gLS0tDQo+ID4gY29tcGFyZWQgd2l0aCB2MzoNCj4gPiAtIGZpeCBm
bHVzaCBkZWNvZGVyIGlzc3VlIHdoZW4gdXNlcnNwYWNlIHN0cmVhbSBvZmYgY2FwdHVyZSBxdWV1
ZQ0KPiA+IGZpcnN0bHkNCj4gPiAtIGZsdXN0ZXIgdGVzdCByZXN1bHQgc2FtZSB3aXRoIHYzDQo+
ID4gDQo+ID4gY29tcGFyZWQgd2l0aCB2MjoNCj4gPiAtIGFkZCBwYXRjaCA1LzYvNyB0byBmaXgg
ZGVjb2RlIGFnYWluIGlzc3VlDQo+ID4gLSBhZGQgZmx1c3RlciB0ZXN0IHJlc3VsdCB3aXRoIG10
ODE5NSBwbGF0Zm9ybShzYW1lIHdpdGggbm8NCj4gPiBjaGFuZ2VkKToNCj4gPiAgIDE+IC4vZmx1
c3Rlci5weSBydW4gLWQgR1N0cmVhbWVyLVZQOC1WNEwyU0wtR3N0MS4wIC1qMSAtdCA5MA0KPiA+
ICAgICAgVlA4LVRFU1QtVkVDVE9SUyA1OS82MQ0KPiA+ICAgMj4gLi9mbHVzdGVyLnB5IHJ1biAt
ZCBHU3RyZWFtZXItVlA5LVY0TDJTTC1Hc3QxLjAgLWoxIC10IDkwDQo+ID4gICAgICBWUDktVEVT
VC1WRUNUT1JTIDI3Ni8zMDUNCj4gPiAgIDM+IC4vZmx1c3Rlci5weSBydW4gLWQgR1N0cmVhbWVy
LUFWMS1WNEwyU0wtR3N0MS4wIC1qMSAtdCA5MA0KPiA+ICAgICAgQVYxLVRFU1QtVkVDVE9SUyAy
MzcvMjM5DQo+ID4gICA0PiAuL2ZsdXN0ZXIucHkgcnVuIC1kIEdTdHJlYW1lci1ILjI2NC1WNEwy
U0wtR3N0MS4wIC1qMSAtdCA5MA0KPiA+ICAgICAgSlZULUFWQ19WMSAgICAgICA5NS8xMzUNCj4g
PiAgIDU+IC4vZmx1c3Rlci5weSBydW4gLWQgR1N0cmVhbWVyLUguMjY1LVY0TDJTTC1Hc3QxLjAg
LWoxIC10IDkwDQo+ID4gICAgICBKQ1QtVkMtSEVWQ19WMSAgIDE0Mi8xNDcNCj4gPiANCj4gPiBj
b21wYXJlZCB3aXRoIHYxOg0KPiA+IC0gYWRkIHBhdGNoIDIvMy80IHRvIGZpeCB0aW1pbmcgaXNz
dWUuDQo+ID4gLS0tDQo+ID4gWXVuZmVpIERvbmcgKDcpOg0KPiA+ICAgbWVkaWE6IG1lZGlhdGVr
OiB2Y29kZWM6IHNldHRpbmcgcmVxdWVzdCBjb21wbGV0ZSBiZWZvcmUgYnVmZmVyDQo+ID4gZG9u
ZQ0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiB2Y29kZWM6IGNoYW5nZSBmbHVzaCBkZWNvZGUgb3Jk
ZXIgd2hlbiBzdHJlYW0NCj4gPiBvZmYNCj4gPiAgIG1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiBm
bHVzaCBkZWNvZGVyIGJlZm9yZSBzdHJlYW0gb2ZmDQo+ID4gICBtZWRpYTogbWVkaWF0ZWs6IHZj
b2RlYzogdXNpbmcgaW5wdXQgaW5mb3JtYXRpb24gdG8gZ2V0IHZiMg0KPiA+IGJ1ZmZlcg0KPiA+
ICAgbWVkaWE6IG1lZGlhdGVrOiB2Y29kZWM6IHN0b3JlIHNvdXJjZSB2YjIgYnVmZmVyDQo+ID4g
ICBtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzogcmVwbGFjZSB2NGwyX20ybV9uZXh0X3NyY19idWYg
d2l0aA0KPiA+ICAgICB2NGwyX20ybV9zcmNfYnVmX3JlbW92ZQ0KPiA+ICAgbWVkaWE6IG1lZGlh
dGVrOiB2Y29kZWM6IHJlbW92ZSBtZWRpYSByZXF1ZXN0IGNoZWNraW5nDQo+ID4gDQo+ID4gIC4u
Li9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlYy5jICB8IDQ0ICsrKysrKysr
LS0tLS0tLQ0KPiA+IC0tDQo+ID4gIC4uLi92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19k
cnYuaCAgICAgICB8ICA0ICstDQo+ID4gIC4uLi92Y29kZWMvZGVjb2Rlci9tdGtfdmNvZGVjX2Rl
Y19zdGF0ZWxlc3MuYyB8IDQ4ICsrKysrKysrKysrKysrLQ0KPiA+IC0tLS0NCj4gPiAgLi4uL3Zj
b2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19hdjFfcmVxX2xhdF9pZi5jIHwgMTggKysrLS0tLQ0KPiA+
ICAuLi4vZGVjb2Rlci92ZGVjL3ZkZWNfaDI2NF9yZXFfbXVsdGlfaWYuYyAgICAgfCAgNCArLQ0K
PiA+ICAuLi4vZGVjb2Rlci92ZGVjL3ZkZWNfaGV2Y19yZXFfbXVsdGlfaWYuYyAgICAgfCAgNCAr
LQ0KPiA+ICAuLi4vdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfbGF0X2lmLmMgfCAx
OSArKysrLS0tLQ0KPiA+ICAuLi4vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlY19tc2dfcXVl
dWUuaCAgfCAgNCArLQ0KPiA+ICA4IGZpbGVzIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKyksIDYw
IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiANCj4gDQo=

