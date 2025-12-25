Return-Path: <linux-media+bounces-49515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C1CDD576
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 06:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 530A230019F9
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 05:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3ED62D46A9;
	Thu, 25 Dec 2025 05:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aGN1wFaj";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="aISz0KlU"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969751FB1;
	Thu, 25 Dec 2025 05:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766641735; cv=fail; b=ngE3WmX+giL3RlgM2Y0kTJAkNOuwhMU1Ycfv3Mxqp+BUfLPeWDYXLPnerqvoSA34U1F3O+pJ4xgr5wsMU6/+sXhZWHKZ1FmZoyLZHOVOiMHELpN00ThHq2A2UxAMeR/pDLt4W8Pnh8yK/bzpCtohWRmq895/l786bpVGyXgnOQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766641735; c=relaxed/simple;
	bh=1DSh968gQcn37ac+uAl2oJ8quT21lTtTdZyjolNdx7k=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tylelns8LG3jDrqXpnvt/h6gttY6oDndG7l84cVwfmxx7UNqebJ8XAhHtsmEIrjLrbEIec7/JS7hzUcBnSXcIEn5NlV+Yd6KCGQhY6zWeZaFgvTm5/6cjW38krW7SFxhp8X6SVnGjNagxGMKf96YfqWh1Omww91KOkXkVheIi0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=aGN1wFaj; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=aISz0KlU; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5e925914e15511f08a742f2735aaa5e5-20251225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=1DSh968gQcn37ac+uAl2oJ8quT21lTtTdZyjolNdx7k=;
	b=aGN1wFajRipFqaEd/dKLt+LlCbn/qmPMpJ2zshIxTmuzbjh082g9WOis2Zjcx6oYcPJZK63VgsQrreqDyWpag+GSY0zOooak7FaNEZayVew6gFDcsBVImG1vMw1tHUYbSABEuRPLt6FVSWmpi5I2iHb4KeGDlXrtfsbnIDTLi0g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:2d1d8bab-2144-40d0-b240-981d12626750,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:570092aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5e925914e15511f08a742f2735aaa5e5-20251225
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1168298848; Thu, 25 Dec 2025 13:48:42 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 25 Dec 2025 13:48:41 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 25 Dec 2025 13:48:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEpxt0t+jNqaynbY6IvGcTuFpi2XmRSBEyExNdsAHFOUfiVl9E6W/2OCxPx2MzoQQY5umGCYVxQlgTKbgnLpJNiiHeHX19unkJ5pfi7C5bk5rmgQLsMz7EtWx9jshor3Gi+Cfyve7DoHBQW7CReuFeexzi6f+usgTc4O94N0T5UQS38c87MdaF+dLT4p7pCEIK0taiV+y7SISuZnUPJLSAVWSY7X8NglJuwtM3yyFn0SxnjXRohGRfSttc5QHG+rkg5K3qzB1cIslJMPOtiNLKAqGuC/xySuRkEzuXxcHZzKWt0svroljxsAp+pgYloL7r1h/g53thl8TdNdpWd//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DSh968gQcn37ac+uAl2oJ8quT21lTtTdZyjolNdx7k=;
 b=nEZooUca12lg3t8kEJiYwVv9AAip4+6eIdX7r/dOpjSIsWeEi8OtEezzPo6Ec7G6loZxwWiH7KoLigxIWOLBs9//y8oXCzO/02maVt72dxMX4MpsmpL+TVnYP3crhU4xVsLzbOG9Gm4cknERmMUKU5Z34JKEasxbAcgRQbev8kMve92073d6Z2SsCj1TXlwseVs33iHsw/6IgeL51+jQiowjP7NhCSFvPO8BTdRYNF5Al++cdbqGSTEl06s1jGcBPON3pyXWqOwe/oeNGfVr3bQMxkJIqQ2C07wgmTASUA6lI3KURW0aujQg9o1eySeVN2iNZlfiCgZooYVW4DMTnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DSh968gQcn37ac+uAl2oJ8quT21lTtTdZyjolNdx7k=;
 b=aISz0KlUwV3dk84HOx4XDlHxDmFVOzBz/2HXwOlroU5noTIrj+SROP3hMY0vdhPFYAg2LRjpfsr/wuoRKDw7HHu56Icrcw8Rb0d2yO4KWWZp9ywzz6eVBJBwGQ9ZagoxiKkXPEhmARN79s/QF6/+JC8oqJKQssnmFZUg89wSSt8=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEYPR03MB6580.apcprd03.prod.outlook.com (2603:1096:101:85::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Thu, 25 Dec
 2025 05:48:38 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9434.009; Thu, 25 Dec 2025
 05:48:38 +0000
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
Subject: Re: [PATCH v11 02/12] media: mediatek: jpeg: fix jpeg buffer payload
 setting
Thread-Topic: [PATCH v11 02/12] media: mediatek: jpeg: fix jpeg buffer payload
 setting
Thread-Index: AQHcY3DogzbT0oi0gUCvzYUPpc4Py7Uk22SAgA0h9IA=
Date: Thu, 25 Dec 2025 05:48:38 +0000
Message-ID: <c133597593c69e0fcb2cb7ea5c14fcb6013302c8.camel@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-3-kyrie.wu@mediatek.com>
	 <36268d4980a1cd6d976bdf5de148f1c2668a92e4.camel@ndufresne.ca>
In-Reply-To: <36268d4980a1cd6d976bdf5de148f1c2668a92e4.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEYPR03MB6580:EE_
x-ms-office365-filtering-correlation-id: 178d7a73-a47f-4841-e979-08de4379405e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?dkcyWUpLNEIvSWI3TlRHT0poUFRrVWU0QjZwTTJQUC9KeXBOaFRUNGxFTUZl?=
 =?utf-8?B?UElsWVIxZ0xneklaaHcwb0NXdllnU1JUR1gvYTltMFhSTWZHeEMrejUzckEv?=
 =?utf-8?B?SnROZkswenJzNVp3R2dDT09BSDdRM3pBbnVVUDFFaGc3ZTNBNGhFdmJEZHp5?=
 =?utf-8?B?anUvLzd5WUh5dUxJSklMaU1qamlYOTE3UlMzUXpmVk4vTWxSeTNQcEdmdnJV?=
 =?utf-8?B?UEdUS3oybWV5RVJ5bFJxeERUd0lXdkVwWlcyNXlKcGlCd0JNY2dnaStRVDlJ?=
 =?utf-8?B?STArVW00dmZQYUhnTG01aXN0Z09tOC9EQUlpQlFZSy9GQ1RXOWc2MVp3d0tw?=
 =?utf-8?B?b1NHZW5qSXBuUE5KNzZlSDFJcTkwampUZ3hOYmFnNVJqMmNZSHNNSHYyZDZJ?=
 =?utf-8?B?UGNibXM3RHFIL2NhdmNRcURyOE9rVzBsVGs5Ukx0cW9SdTVJd1RhRU5DSERs?=
 =?utf-8?B?YlpIU2RrMEI1QXNWeldjSmhVdG14UUtxWlVtazdPQzF6ZnArS3JQRkl3RzJC?=
 =?utf-8?B?cXI1MkFpMGpCZEE0SDZLQ1FlRmNURmFLamxMQXNjcG5TMEZ1dWlYaWtTTmww?=
 =?utf-8?B?SnVlMnBFd0Z1Mk1GRTVJclgxTWJOSXZUYVV1a0dvd1JFdUtldEpwVEM4aU5J?=
 =?utf-8?B?b1JRa28zNlpMYk5RYlR4Nnc1cjVsaFAwTlQ0ckpJNWhNOS94c0dZWEZhT2hk?=
 =?utf-8?B?WFhiaVk1dnVnVnlFUG1JWGlKaXJvc0k4dzRkdEIzNWo1OVVPb09XL2RNWmNo?=
 =?utf-8?B?RVhnOURBSTR4NEZMSGJ1TW0vUys3TFpGV0ROT1BDSUZqSWE2TklqdUhKYmlV?=
 =?utf-8?B?VE1QdVlMSDNsaFprYzRRV2gvYlJPKzlJTVRYSHJSVWVwUVlaUllDUk0zMnBR?=
 =?utf-8?B?NkwwMVozUUZEMng4OS9BSG0wWUVCVWdsYjNDSDN3YURuOFFYNXRkMUxPaXlJ?=
 =?utf-8?B?R1dXV0FXUnlIWHUvNFdLckExR1V2SUsvV2pWVERwczdvc3FBRkhEbkp6RzBr?=
 =?utf-8?B?WElHUXp6S1dRYStWbkkrQnBiOHFpaDMxYlNGeHpmbTFwQmtVQmRjK2xkanZK?=
 =?utf-8?B?bEI4M2JsOEZtMVZhbG5MUmVzNlc5c21KenA1cWxiMzkwaVZ5aDBXdWhQcWJL?=
 =?utf-8?B?Y1F2ck9DNnlEVWFMdktmK2wwYnN5K3A4SS9XdC9BM0VZbDdJQXhnYitDK2xz?=
 =?utf-8?B?ZnNqL0UwOW1LYjNVNmVoOGVVUTZueFRnQ20wYUp1ODJYcnhEM3dYNGI4ZG1L?=
 =?utf-8?B?L0RpRW5EbHpsYTRXZXdwVFBwVXhWdjVmMFZ2OVlxeGJ1ckdpV2Q0L0hyeVZB?=
 =?utf-8?B?M0NtSzJIaThBNWYrVE81M28yNit3dk5YcU9XK21PYmZyY3ZhckJTczcva1pp?=
 =?utf-8?B?UWVSQmt3K2xaWEF3VHoxZHhlRDRpMWJ3RFBnaHJCMTB3Y3JneFFnaXp4YnhT?=
 =?utf-8?B?SkJiQW5VRVRjR3JUTFo0YTZnb21YSzYwaXVlOUUyeFhxd0ZwbzRqLzlkV0Fr?=
 =?utf-8?B?VVZSb2pTUmNXSkZrKzUyNWpsSEt5Nml0ZmU4dFk5OElqalhSSWlVUzN2YjJW?=
 =?utf-8?B?eGdmUmw2eEJuNS95MUFiaDBJdGVNb0E1MkVRNVJ1anNVRmh3ZGo5ZG9yRE5o?=
 =?utf-8?B?MTI0V3EwVThtejFKbWt3eFdEeHo5ZytRTHY1Sk9rTnE3b1E4UjU3bmIwRDdn?=
 =?utf-8?B?QTV3RE8yeU9yNVhFVm5yTjAxeHFuUzBXMkNPQ2Qwem4wZEsyTnRpR2xPT1l5?=
 =?utf-8?B?YUtza21PU0FMaDZ2N2ZRaHhRWEhRdW5XaXBrRFZ3cmp6U2JSQXgxdWtrWGt6?=
 =?utf-8?B?MGZmVzRTM2FjelJWaytqMXhLRCtGSlVSclJwaWFZTjZPMzNjVEllS20zTlAz?=
 =?utf-8?B?S0ZLVUxSQm9YT3puREFHb3dOam1xVlYxY1JFZ1RRWkp5dzFuVVNBMUE5dDNR?=
 =?utf-8?B?REYwbW4vY2cvYnozaDJvODh1emkrWXlLTlErTUc1VzJldndjNkRVTW5KRldN?=
 =?utf-8?B?dUpmWS9zQ1l3dVdyNzhKVlBsVzhJNEk5Rmhvd3pUdzVIWXNPYTBvVmNhNWtL?=
 =?utf-8?B?TktXK0FSZ2dZUEsxZ3lVeXh4TG5kc0ZDTjFsQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmdRNk5kY1hneVpGc25SeWZhRGFvWUgyMUExNzZTQThmVzNmMTFpMkdMajJG?=
 =?utf-8?B?Y25qdXBzSXBVaXRzN0IyU0JBVzZ4cW91b3B0eVpDSDEwSlBZVFVhd3RpcTFW?=
 =?utf-8?B?eGlMM21zOSs1QXBjUmhzQkR4ZVhmU0NvdG9SdDNaRmRKVGFEMHlEa2lJV2w5?=
 =?utf-8?B?MUFMdzdPMnZ4RkNSNVhIVy9RMm9hQW5VYVNwOHllVGJiVHh1Wk43RERJdmRV?=
 =?utf-8?B?S2hrcWcxVG11bTFUeXhRRUszOHZWanJwYVUxcExyYWtlQWpQa2hKYUdKaXl2?=
 =?utf-8?B?cDRGUFBCNFVQOTVoR0prU2oyZnFpZlhnZVdRNEVCWWl2RUJxZjFJTUZTRThM?=
 =?utf-8?B?YXJpZGR2ZmhSYnJNdGlrakhBTGg3MkIzUFU3OE1WUUtxay9RMmwrK2J0a0Ir?=
 =?utf-8?B?QVdhcFJuVTVqL0puL21xdFpGMkErbksvcStVeDgyaHppNGNRaXF5MXl3MjBT?=
 =?utf-8?B?QzhlUzFnbWQ2RVF5RE1oemdZQXpFNXRNLzB6VFp4QllaMWZvcEFLcmN3QUZ2?=
 =?utf-8?B?SkdBQ25EaEVORlFtdHRKN0NCbVJKL2dmcWQ3MGg4UngrQmh1dWYzK2d0ckt4?=
 =?utf-8?B?dWptY2pjUW83T2tsN2ZTd0ZVRStQalFleDU3blRhK2JqMUVocS9DcVNPN2Y1?=
 =?utf-8?B?dFpIREI2OFRrNVBaZE5pcStpM2xsNjlKS2s3b0pOZFJoOUxIVXh0bW1EcHhy?=
 =?utf-8?B?cnZLOXRLa1RTak53bTUzNWlwbWdGaXhpSnpnczRIRmNsbDJmS25Bd000M2Zq?=
 =?utf-8?B?YTJULytpVzVSSjkwV1FOaWpzTW4xbmdKbm95WkRJL3pOMktNbU1Xb3NkT0ZE?=
 =?utf-8?B?SURraWFGZ3lqbncvUE5oM3g4R3B6bzF1bFMwY0hvREwrd3JsLyttRjRCSlRG?=
 =?utf-8?B?NzNQUUZFUkZ6SXNnODB0cWQ0RE1qQVZjNURWTWpLS0d0NmllVTFNWUwyV1pN?=
 =?utf-8?B?bk5vODZySWJVVHI2RSthQk16MzV5WGk0RFlxY3p2THJMMGZ4aWVSVkh6cE9q?=
 =?utf-8?B?c04rM0lnNFBaNm5XZEwya21hY3RxOGg3YWZnSkpUU3FZWUhBK1ZmTEQyREpr?=
 =?utf-8?B?cDJJQVhTYlVTZGxDN1VjM0xpWHBkV3dycU5zMHlxbXJuWWF4Y2FVZVY0aDFM?=
 =?utf-8?B?cFhzOHhMU3MzQ2ZwWGNLSHljYlBORDVReE9ZNGtvR0RkZlFldnlrYVgzS05D?=
 =?utf-8?B?RGpnWVVwYTJZM3haWWdTNGhrMlZWWE9CbnVMTXdjM3JHR0U4M1NNTGJ4SmpG?=
 =?utf-8?B?OTNKdkdCYlQ4VkFQL1lyV3RYTXRpZi9ldVBFTHJuMEsrWlduRGhrWFlqQS83?=
 =?utf-8?B?bmZuOTM2RVNhYlhRRVZDaEdsbmdqOUREKy85aThhS1ZGbHE5NlpROWd2UnBo?=
 =?utf-8?B?VThmd0lydzg1TkhrVDhGb0V3RHVZeEgyZnRIRDI5TWRxOU51TldYQjJmZ2hZ?=
 =?utf-8?B?YTFCQWtwakRaVDZsdForcE9wSXZhOEk4YmREbmNDYlIrUGhaY1FweFFyUkly?=
 =?utf-8?B?ZVIvU2tibmU3eEJ1L0VOeW1QWkpoMHVtMm5xdHA4bExsZTgydDlSSjBWa2dZ?=
 =?utf-8?B?SHRwbll3MnloWXQzZHhYTkI1SDZOVEkzbHRybStyalFpcEVzMTdDNW5NaTRj?=
 =?utf-8?B?bWdMV1E3RXlGMThCcXlQZTRCcUliUk0xeGRuQXRRNVZ4dzFZMnVWVnkrMVR6?=
 =?utf-8?B?ZStwMFNmUnRLdm5jOVYwYkxOYmplUDBuUlhIMENFUGM4V01Da1BvT0F5SDZx?=
 =?utf-8?B?QjJhcVlsSkwxL1lDZ2YyT2xQeEVwQURLZ2FJV2FiQ3RLZTAvR0dTZ1V2WjRK?=
 =?utf-8?B?VnVLdUt4RFNRVHUzUXpHUzVnQWIyZEtocGkyTTZkdjlIMDdmd3FKODFIM3h2?=
 =?utf-8?B?UC9jSUJsdEU4VmdieHNPOUJKRGdtVEc3QXhFS1AxOXYxdDdxY0VDbnBoQnhx?=
 =?utf-8?B?aGcrWHN3M1pnZkJiUTFkOHhnbGFzL3RrcVFwTXRMZmRBUzVrQzJIK1lhM3A5?=
 =?utf-8?B?VWhSMzI2V3FCaTNlUjZmeWVqenlneFFNS0VWc2JqNTVvZVJyN29zTnJydHBp?=
 =?utf-8?B?OVVESjV3UDRxdUwraEhRalMvTGxTSmxwY3c2RnFvR2MyWjNmRGExdlZBd3Vx?=
 =?utf-8?B?RmhVLzhyQWtYL0lSc29TdWlGRXhtSUZnbTBlQjk2V3h4S3NhV09VYkd6eVNp?=
 =?utf-8?B?Q3BhOEl0ZjJVaGpxT0llTHlUZ0Rvc1BVWHNMWHVZanVlSUFMNDQ1dWlhOHE0?=
 =?utf-8?B?WDdncVY3Nk5NUzd5a3M5dW9lVkFvR0IvOWxQeWFEK2xCRC9GVStjaDhhdWZ1?=
 =?utf-8?B?RWNQZFpFdlNrTlNOdVZPVHNqZXdoa1ZGblR2VWptcUY5Ry9xNGtRUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD8885BC9D75A64FADFA7E3C63D466C2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 178d7a73-a47f-4841-e979-08de4379405e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2025 05:48:38.3161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v5hy0xHzQ+beDAmpX7IT/3xExywjCOxsfSc+sO2bQb68JJ+oeqWDzJTfE6xvexeGo3ZDTiJmnLPbUgyMy8Qarw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6580

T24gVHVlLCAyMDI1LTEyLTE2IGF0IDE2OjE1IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaS4NCj4gDQo+IExlIG1hcmRpIDAyIGTDqWNlbWJyZSAyMDI1IMOgIDE3OjQ3ICswODAw
LCBLeXJpZSBXdSBhIMOpY3JpdCA6DQo+ID4gRm9yIG11bHRpLWNvcmUganBlZ2RlYywgaWYgb25l
IG9mIGh3cyBnZXRzIHRoZSBldmVudCBvZiByZXNvbHV0aW9uDQo+ID4gY2hhbmdpbmcsIHRoZSBw
YXlsb2FkIHNpemUsIHJlcHJlc2VudGluZyB0aGUgc2l6ZSBvZiBZL0MgZGF0YSwNCj4gDQo+IC0+
ICJnZXRzIHRoZSByZXNvbHV0aW9uIGNoYW5nZSBldmVudCwgLi4uIg0KPiANCj4gPiBuZWVkZWQg
dG8gY2hhbmdlLiBCdXQgb3RoZXJzIGh3cyBhcmUgZGVjb2RpbmcgYXQgdGhlIHNhbWUgdGltZSBh
bmQNCj4gDQo+IG5lZWRlZCAtPiBuZWVkcywgICAgICAgICAgICAgICBod3MgLT4gY29yZXMgPw0K
PiANCj4gSXQgdGhpcyBzcGVjaWZpYyB0byBkZWNvZGVycyBvciBhbnkgdHlwZSBvZiBjb3JlcyA/
DQo+IA0KPiA+IGl0IGNhbiBub3QgYmUgY2hhbmdlZCBpbW1lZGlhdGVseSwgd2hpY2ggcmVzdWx0
cyB0aGF0IHRoZSBwYXlsb2FkDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaW4gdGhlIHBsYXlsb2FkDQo+IA0KPiA+IHNpemUgaXMgbm90
IGVxdWFsIHRvIHRoZSByZWFsIGJ1ZmZlciBsZW5ndGggb2YgdGhlIGh3J3MsIHdoaWNoDQo+ID4g
b2NjdXJyZWQNCj4gDQo+IHNpemUgdG8gbm90IG1hdGNoIHRoZSByZWFsIGJ1ZmZlciBsZW5naHQg
Zm9yIHRoZSAuLi4gaHcgPw0KPiANCj4gPiByZXNvbHV0aW9uIGNoYW5naW5nIGFuZCBhIHdhcm5u
aW5nIGNhbGwgdHJhY2Ugd2lsbCBwcmludC4NCj4gDQo+IENhbid0IHBhcnNlLiBZb3UgY2FuIHBy
b2JhYmx5IHNwbGl0IHRoYXQgbGFyZ2Ugc2VudGVuY2UsIGFuZCBpdCBuZWVkcw0KPiB0byBiZQ0K
PiByZXdvcmsuDQo+IA0KPiA+IFNvIHRoZSBzZXR0aW5nIG9mIHBheWxvYWQgc2l6ZSBtdXN0IGxl
c3MgdGhhbiB0aGUgcmVhbCBidWZmZXINCj4gPiBsZW5ndGgNCj4gPiB0byByZW1vdmUgdGhlIHdh
cm5uaW5nIGxvZ3MuDQo+ID4gDQo+ID4gRml4ZXM6IDBmYTQ5ZGY0MjIyZiAoIm1lZGlhOiBtdGst
anBlZ2RlYzogc3VwcG9ydCBqcGVnZGVjIG11bHRpLQ0KPiA+IGhhcmR3YXJlIikNCj4gPiANCj4g
DQo+IERvbid0IGFkZCBibGFuayBsaW5lIGluIHRhZ3MgcGxlYXNlLg0KPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBLeXJpZSBXdSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAu
Li4vcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMgICAgfCAxOSArKysrKysr
KysrKysrKy0NCj4gPiAtLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jDQo+ID4gYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jDQo+ID4gaW5kZXggNmE3ZTAx
MTMwZjFjLi4wY2YzZGM1NDA3ZTQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3JlLmMNCj4gPiBAQCAtNzA5LDYg
KzcwOSw3IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfYnVmX3ByZXBhcmUoc3RydWN0DQo+ID4gdmIy
X2J1ZmZlciAqdmIpDQo+ID4gIAlzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHggPSB2YjJfZ2V0X2Ry
dl9wcml2KHZiLT52YjJfcXVldWUpOw0KPiA+ICAJc3RydWN0IG10a19qcGVnX3FfZGF0YSAqcV9k
YXRhID0gTlVMTDsNCj4gPiAgCXN0cnVjdCB2NGwyX3BsYW5lX3BpeF9mb3JtYXQgcGxhbmVfZm10
ID0ge307DQo+ID4gKwl1bnNpZ25lZCBsb25nIG1heF9zaXplOw0KPiANCj4gc2l6ZV90ID8NCj4g
DQo+ID4gIAlpbnQgaTsNCj4gPiAgDQo+ID4gIAlxX2RhdGEgPSBtdGtfanBlZ19nZXRfcV9kYXRh
KGN0eCwgdmItPnZiMl9xdWV1ZS0+dHlwZSk7DQo+ID4gQEAgLTcxNywxMiArNzE4LDIwIEBAIHN0
YXRpYyBpbnQgbXRrX2pwZWdfYnVmX3ByZXBhcmUoc3RydWN0DQo+ID4gdmIyX2J1ZmZlciAqdmIp
DQo+ID4gIA0KPiA+ICAJZm9yIChpID0gMDsgaSA8IHFfZGF0YS0+Zm10LT5jb2xwbGFuZXM7IGkr
Kykgew0KPiA+ICAJCXBsYW5lX2ZtdCA9IHFfZGF0YS0+cGl4X21wLnBsYW5lX2ZtdFtpXTsNCj4g
PiArCQltYXhfc2l6ZSA9IHBsYW5lX2ZtdC5zaXplaW1hZ2U7DQo+ID4gKw0KPiA+ICAJCWlmIChj
dHgtPmVuYWJsZV9leGlmICYmDQo+ID4gLQkJICAgIHFfZGF0YS0+Zm10LT5mb3VyY2MgPT0gVjRM
Ml9QSVhfRk1UX0pQRUcpDQo+ID4gLQkJCXZiMl9zZXRfcGxhbmVfcGF5bG9hZCh2YiwgaSwNCj4g
PiBwbGFuZV9mbXQuc2l6ZWltYWdlICsNCj4gPiAtCQkJCQkgICAgICBNVEtfSlBFR19NQVhfRVhJ
Rl9TSVpFKTsNCj4gPiAtCQllbHNlDQo+ID4gLQkJCXZiMl9zZXRfcGxhbmVfcGF5bG9hZCh2Yiwg
aSwgDQo+ID4gcGxhbmVfZm10LnNpemVpbWFnZSk7DQo+ID4gKwkJCXFfZGF0YS0+Zm10LT5mb3Vy
Y2MgPT0gVjRMMl9QSVhfRk1UX0pQRUcpIHsNCj4gPiArCQkJbWF4X3NpemUgKz0gTVRLX0pQRUdf
TUFYX0VYSUZfU0laRTsNCj4gPiArDQo+ID4gKwkJCXZiMl9zZXRfcGxhbmVfcGF5bG9hZCh2Yiwg
aSwNCj4gPiArCQkJCQkgICAgICBNSU4odmItPnBsYW5lc1tpXS5sZW5ndGgsDQo+ID4gKwkJCQkJ
CSAgbWF4X3NpemUpKTsNCj4gDQo+IFRoaXMgaXMgc3RpbGwgbm90IHF1aXRlIHJpZ2h0LiBzaXpl
aW1hZ2UsIHN0cmFpZ2h0IGZyb20gc19mbXQgc2hvdWxkDQo+IGFscmVhZHkNCj4gYWNjb3VudCBm
b3IgdGhlIEVYSUYgaGVhZGVycy4gSWYgZW5hYmxlX2V4aWYgaXMgdW5rbm93biBhdCB0aGUNCj4g
bW9tZW50LCB0aGVuIHlvdQ0KPiBzaG91bGQganVzdCBhbHdheXMgaW5jbHVkZSB0aGF0IHNwYWNl
LiBUaGlzIHdheSwgdGhlIGJ1ZmZlciBsZW5ndGgNCj4gd2lsbCBvbmx5IGJlDQo+IGJpZ2dlciBp
ZiB1c2Vyc3BhY2UgYXNrZWQgZm9yIG1vcmUgYXQgYWxsb2NhdGlvbiB0aW1lLCBhbmQgd2lsIG5l
dmVyDQo+IGJlIHNtYWxsZXINCj4gdGhlbiB0aGlzLg0KPiANCj4gVGhlIHBvaW50IG9mIHNpemVp
bWFnZSBpdCB0byBhbGxvdyB1c2Vyc3BhY2UgYWxsb2NhdGUgZXh0ZXJuYWxseSB0aGUNCj4gcmln
aHQgc2l6ZSwNCj4gdGhpcyBkcml2ZXIgZmFpbGVkIGF0IHRoYXQgdGFzayBpdCBzZWVtcy4NCj4g
DQo+IFN0ZXBwaW5nIGJhY2sgYSBsaXR0bGUsIEkgZG9uJ3QgZXZlbiB1bmRlcnN0YW5kIHdoeSB5
b3Ugc2V0IHRoZQ0KPiBwYXlsb2FkIHNpemUNCj4gbGlrZSB0aGlzIGhlcmUuIFdoeSBpc24ndCB0
aGUgdHJ1ZSBwYXlsb2FkIHNpemUgd3JpdHRlbiBvbmNlLCB3aGVuDQo+IHRoZSBidWZmZXIgaXMN
Cj4gZW5jb2RlZCA/IEFyZSB5b3UgdXNpbmcgYnl0ZXN1c2VkIHRvIHRlbGwgdGhlIEhXIGhvdyBt
dWNoIHNwYWNlIGNhbg0KPiBiZSB3cml0dGVuDQo+IHRvbyA/IEp1c3QgZ2l2ZSBpdCB0aGUgZnVs
bCBzcGFjZSwgd2ljaCBpcyB0aGUgYWxsb2NhdGVkIHNpemUNCj4gKGxlbmd0aCkuDQo+IA0KPiBO
aWNvbGFzDQoNCkRlYXIgTmljb2xhcywNCg0KVGhlIHZhbHVlLCBtYXhfc2l6ZSA9IHBsYW5lX2Zt
dC5zaXplaW1hZ2UsIHJlY29yZGVkIHRoZSBjdXJyZW50IHNpemUsDQpidXQgaWYgdGhlIHJlc29s
dXRpb24gY2hhbmdlZCB0byBhIHNtYWxsZXIgb25lLCB0aGUgc2l6ZWltYWdlIHdpbGwNCmJpZ2dl
cg0KdGhhbiB0aGUgdmItPnBsYW5lc1tpXS5sZW5ndGgsIGluIHRoZSBmb3JtZXIgc3cgZmxvdywg
dGhlIGJpZ2dlciB2YWx1ZQ0Kd2lsbCBzZXQgdG8gcGF5bG9hZCBzaXplIGFuZCBjYXVzZWQgYSB3
YXJubmluZyBjYWxsIHRyYWNlIHByaW50ZWQuDQoNCkhlcmUgYXJlIHRoZSBhbnN3ZXJzIG9mIHlv
dXIgcXVlc3Rpb25zOg0KMS4gVGhlIGVuYWJsZV9leGlmIGlzIGENCmRldGVybWluZWQgdmFsdWUs
IHdoaWNoIGlzIHNldCBpbiBzX2N0cmwgYmVmb3JlIA0KanBlZyBkZWNvZGVyL2VuY29kZXIgc3Rh
cnRpbmcuDQoNCjIuIElmIGVuYWJsZV9leGlmIGlzIHNldCBhcyB0cnVlLCB0aGUgYnVmZmVyIHBs
YW5lcyBsZW5ndGggaXMgZXF1YWwgdG8NCnNpemVpbWFnZSArIE1US19KUEVHX01BWF9FWElGX1NJ
WkUuDQoNCjMuIFRoZSByZWFzb24sIFdoeSBpc24ndCB0aGUgdHJ1ZSBwYXlsb2FkIHNpemUgd3Jp
dHRlbiBvbmNlLA0KaXMgZHVlIHRvIHRoaXMgc2V0dGluZyBpcyB1c2VkIHRvIGF2b2lkIHRoZSBj
b25kaXRpb24gZGVzY3JpcHRlZCBpbg0KY29tbWl0IG1lc3NhZ2UuIEFuZCBpdCB3aWxsIHNldCB0
aGUgdHJ1ZSB2YWx1ZSBpbiBpcnEgaGFuZGxlci4NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KS3ly
aWUuDQo+IA0KPiANCj4gPiArCQl9IGVsc2Ugew0KPiA+ICsJCQl2YjJfc2V0X3BsYW5lX3BheWxv
YWQodmIsIGksDQo+ID4gKwkJCQkJICAgICAgTUlOKHBsYW5lX2ZtdC5zaXplaW1hZ2UsDQo+ID4g
KwkJCQkJCSAgdmItDQo+ID4gPnBsYW5lc1tpXS5sZW5ndGgpKTsNCj4gPiArCQl9DQo+ID4gIAl9
DQo+ID4gIA0KPiA+ICAJcmV0dXJuIDA7DQo=

