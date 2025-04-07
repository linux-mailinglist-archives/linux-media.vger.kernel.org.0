Return-Path: <linux-media+bounces-29457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDD6A7D551
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 09:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C8B83B8B39
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 07:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4BB22A7ED;
	Mon,  7 Apr 2025 07:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lizfat6y";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="TR+sMBp+"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6220822A4EE;
	Mon,  7 Apr 2025 07:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010032; cv=fail; b=h/PX1OuvmkMFjYhAIc0jF9+tDU50fmI7fd2wEqycebaTtt6U+i0Pjscv+hbwy87XSkJNPmvQSVWkzsszzemCFp7Q3UPoc8M6LzqmnHToGnS3OzXuju8WH9S4AcOKcV3qW/gtppG7O6HS3BPswl6YC/+8Q/lImhroRXDRACYxObU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010032; c=relaxed/simple;
	bh=8694c/r0Gk3s8xs8US8J9S8vMzF8wPkVYRh3FIONKZI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=siMrrt2T8Wul7V6Yufz7AQXaWXtKGoPpG/krVe1aSp840oC8ZYOEgIThcYJ/y3cQrvhqVZPVGngUcXmubf8ILqAA33LWCoVAxn1K1tn01v0reXn8o9HWU4veOE0SEdBZpQRyKZktR+YIh5kW2FlyEJ6ntg90QWhyfM1Pxeep/9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lizfat6y; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=TR+sMBp+; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d819908a137f11f08eb9c36241bbb6fb-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=8694c/r0Gk3s8xs8US8J9S8vMzF8wPkVYRh3FIONKZI=;
	b=lizfat6y+2T2onivK8xh9q7DeEIBPL4WC8/ck3zhoaM6NRVxQowdONvLIZZuSo+gXXbTreqqp97PComYPaYHPk9hKMtB0X9++88Tczj4ayocpY7kVEnA/IJ3xOBHz+XJCZONI8FMYTQCqAH2qrYC0n2TJ4453hsacclRIPRFzEo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f33c0925-06dd-4b7e-9923-96a8898bc751,IP:0,UR
	L:12,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:12
X-CID-META: VersionHash:0ef645f,CLOUDID:75e2074b-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:11|83|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d819908a137f11f08eb9c36241bbb6fb-20250407
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 115198049; Mon, 07 Apr 2025 15:13:45 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 15:13:44 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 15:13:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnsCOFvA+a8NEFtBOer5zmVm0X2hd+fd3wI+X4sYYUSN+uK6gLgYS6vWjFtNpVfH7hKcXdkOg9fQhREsjCftU1MskK8KEexImVM/IkRD3Swzpmvox54zawxEmaFCOkftmML/WcdlKAUQMueJYsEnVbJLv+wknJ9LkRyel3IBPLJwcgOTOZ1nxLu4k5KW/9pLxn5FqmaD8UYNs3n2/hyF7I4v68znNf451V7NAxuI0Am0rrQnc94w5g10fC/GBrpNuOhm5N91JPYnBfguuLB7CthAA2KmMiBRB/QcUPgh81+rQ6XgsCBsh+An+/AZ02KtDV2wjmwYquixRscZbZVp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8694c/r0Gk3s8xs8US8J9S8vMzF8wPkVYRh3FIONKZI=;
 b=raVveZQh+CNWL/QnapeUfMccmD2+LMQbntkUxiy01UEOeLwIwwv2F6YJKrzMmKlxO/LOaOTrq+dqbtcJ6MqTdL2hWd/cbPB/gEh2XUXW/87Vcg4M953BoJYOx3xazF3gqCjee6pr6dTE2inPEGOVzlTa4VcaZn/MRJMzX6NuS7unz2kjNqJ5twufUhHW8QipuCtqzjTXE2R/arhK7PyWieaaPoY72Cfr1UPq1fnbRvYdQaMVuepFOSkYvr0si9NC40Og6JmB2IyTsLRnORZhVU5KU87iENgpzxnOVimwS3FMYn7JYC4PpItU3RPjAmiuEYvNPC37j4LPTIXjor9+zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8694c/r0Gk3s8xs8US8J9S8vMzF8wPkVYRh3FIONKZI=;
 b=TR+sMBp+VlboIQnyYAsCa3ioqpZXaisr+q4QESKOJhdrGNRelALBk1W/C5PFlgCJoP6yD0Dk3mILiSGF5Nd6TI8JHGVK361Y5y7NNywceiSTZahKRMeIa89IQpHyKTzUsz5vAwH9/6+kz4pdfpzH/hu7ZjaRwqhaNK7LJKJ6msc=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SI2PR03MB6859.apcprd03.prod.outlook.com (2603:1096:4:1f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 07:13:41 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 07:13:41 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "tzungbi@chromium.org" <tzungbi@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>,
	=?utf-8?B?QmluIExpdSAo5YiY5b2sKQ==?= <bin.liu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [V1,01/12] dt-bindings: mediatek: Add mediatek, mt8196-jpgdec
 compatible
Thread-Topic: [V1,01/12] dt-bindings: mediatek: Add mediatek, mt8196-jpgdec
 compatible
Thread-Index: AQHbYptdE6Xdfd8/hkqjk6TuZ7fyXbMOdsWAgIndMQA=
Date: Mon, 7 Apr 2025 07:13:41 +0000
Message-ID: <df3f73ea3ed1f8394beb31a9c9997679eb36f386.camel@mediatek.com>
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
	 <20250109133513.20151-2-kyrie.wu@mediatek.com>
	 <63a97fdb-f348-4ed7-9d7f-8e47d51a4390@kernel.org>
In-Reply-To: <63a97fdb-f348-4ed7-9d7f-8e47d51a4390@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SI2PR03MB6859:EE_
x-ms-office365-filtering-correlation-id: 99f6d63e-694a-4e58-4266-08dd75a3ba01
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RFhDenczZWtWYmpBbjJ0MnM3MlRFY2MyZnQxcTgwbEtWMDlTWGlMeHV3VGti?=
 =?utf-8?B?bElwc0tyNkVJdE5qT3d2a1EyTnREc3hwTlFVL0RzM094akNIZzcwSWR1eVlW?=
 =?utf-8?B?enlTbjBqWWdyK3dHdmdGVzBKdWZXekhqTzN5dFBDbU5VUjZqUGFFMVU4RU1l?=
 =?utf-8?B?VitSZkFsZ3RqRzVHVnlKcmVXVUhzYTNTeEdwUnErYjZqRThkSGt2Wm14ZU4w?=
 =?utf-8?B?TVZQZmtqYUUyMWlzaWU1a0FybWMwczdKVml6S0hmM25jZS9kSzdZMG9xMFha?=
 =?utf-8?B?L2NwWGx1bFYvdWd5UlFadVcvZmVyb1pKcFl5UzhBSmZBSkI5MC9iSHRuWVhy?=
 =?utf-8?B?Z0JOb05sUWxRZjFVNnFUdmdiY1NQNGFiWElIaFJvSmVTT3hzNFlXZUhPSm1H?=
 =?utf-8?B?RTZlU29CckFQVGxhZEpzdlVVN0xJaG1lVnd4aHVwbUJsVWNLM2ZXajRmMHpn?=
 =?utf-8?B?R2R4UGVnZFcrMmlDVitjWkZweWFhbmFwT2U1ZklrNkxxc1pkUXd0bnZUMmht?=
 =?utf-8?B?WWsyZTdzODh2aWFVWSt6SEJ3bnBaQThrOVFZSWRQaDMyOFc3UTV5eE40WkVu?=
 =?utf-8?B?TjdmSzg3S0FXUWhDa2RVZCtIbERTYXg1VEV2OVV2dG5OMHRrVzRXc1BockRk?=
 =?utf-8?B?SE1GSDBsNHl0YWlBSG9jUHlmU2UvN0VyMmNQUms5YXNrWlo4T3IwK3VSWmt0?=
 =?utf-8?B?a0tHS1AxMDA2eVhXbE5OWEY2dERQUEFoblVjWFJ0dEZSZW5HQmxtY2hRWHlU?=
 =?utf-8?B?TE1jYlRFOG9OMTdmd0w1T1QxOFUvOVRBbU1lT1QyY3czbGZsL1g1eUw5Z1ZN?=
 =?utf-8?B?azdROUlVOWFNalgzQUgxSHJDbXJFbDZzOWNBMFN5UVVPbHNHQWt1WG1qbm1J?=
 =?utf-8?B?UWFiQ0piUDc0WTB3cWNHNUVIdDV2all4b21oK3g4SmNMMi80REtXdnJKM1Fn?=
 =?utf-8?B?SWMwTm1xM2RORU5YMEJGRnJCM2YvK0o1U2FrdGhuT3VXdWxnY1pUWVNoKzBn?=
 =?utf-8?B?QlBmU2Q4dnpQTnd2T2hEUytsNEpJa1IzVk5wb3RHbWZDRmd3dnNaS0NGaG1q?=
 =?utf-8?B?TlhjQ1phdW5FTi9jd2dYM3FNNDgrM1czV09xNHkrOGVoZGw1cnJoVXJoc0hS?=
 =?utf-8?B?dnc5ZkpjVHFSQS83Q2tHdVZ5T2xtQ2FFdzgrcVNRWDdVdEY0bGJOUU16alpr?=
 =?utf-8?B?Z2w1TjlMcjNDR1d1bUdoUTd2V0g0MHI1NEZnSEN3OGxNdDFyaitrRHdKUndu?=
 =?utf-8?B?elR2cjBoK3k1UFJMMzQ3UXVmcC9OTUxoSDEycjg2Slg2U01tSTdmQVZjRmc1?=
 =?utf-8?B?cXZueVJLWWsydHVOR0hzQ3YrcG5ZbndlcHNtMEJIdURiaG1JVGlWelYwa0pk?=
 =?utf-8?B?cUxxR0M3cTVNbWpHWmJudVVLRXorSDdzVWRoRTZOdG9uRjFkUkhiTVBCYWJU?=
 =?utf-8?B?R1Q1ZVQwZjRMcnYwM01kblBvUjg5ZnoyRzljaTVEeGNjbzZkd2lDZkZOcjRT?=
 =?utf-8?B?THorWDA4eWxPMGxucnhWMi9DaWh5ZXRYTm4rMmZ2S0FWb3BVYUtUa1FkRHRs?=
 =?utf-8?B?YjgwMnE3UmZGWmFQbTZpUUVxdmZmTkk5aTNtZkR0cDVpeTNzcEIwMXhwK2tu?=
 =?utf-8?B?V1JKS1QrdG9rNVZHK0pZbXh5cjJWV0EvWjBsbEExdW5PMmhjVXN0YmdzcjZM?=
 =?utf-8?B?SXN0TFV1ekdYbmh1Wm1hbUxzL3NRM0JrVkQyVWNKYWJDaDBvTmQvRzh4aURL?=
 =?utf-8?B?My9yOS9HWkFiNDhDV1ZCSGJueXluZ1ZvN291TTZMVmVLdi96dFN3TjJLNHRD?=
 =?utf-8?B?NkR1cHFyM3JhZ29mcEZrQnRwQXZ3d2ZQQ1IwMUN6YTNjTUI3eFNaOVRVbHFN?=
 =?utf-8?B?cVJMREtNRHczZTF1UU82MVFXYnQrNlBnMTN3eG5EVzBVTk5ick50RHlYVlVP?=
 =?utf-8?Q?EsqJ2QVv89A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjNsRXhOYVVTL2huMDJhekk2cTlFZmNPVGhzSVFCQWZEUGFUMEVyQ3c1RzNW?=
 =?utf-8?B?dXppTkp3NXhRcXFuY2ZvQ0xudzZ3dWNIUkIwTWVTMThBSkpnNXFZTUo5aVBw?=
 =?utf-8?B?OGpqY2hOMDV6OHNSSUt3Nis5UDYweC9HY0QxOTZETEhMUGh3My9ZaDRWMHU3?=
 =?utf-8?B?SUV3VUJTM3VqNkNaQ3V6ZWNETXNLSDJHWGtnTXJyMUtMbHdmbTVMeHdDcGhB?=
 =?utf-8?B?dFdSa2tSbTR2ODJ3ajVrZitkZWo3TDI4MUhXL0dzZXFoSEJxaHc5aS9tT0ZV?=
 =?utf-8?B?K0RiMVBUV1ZjL0ppNGNmc0Zwbm56QlhoRnk4dGdPSVJZYVNTK1pGbzk4UG55?=
 =?utf-8?B?WFI5eU9idmJXdTA3TEJ6aDdmRXpHNHJ3d2xadWR5RTVOd3g0djUvdnhoY2pQ?=
 =?utf-8?B?aU0yZkNQZEtKOS9tTkxLdnd6SmxFb0QrUitwN3FSVjBjNWxkNWJkNEQ4eVVM?=
 =?utf-8?B?N253MTlkZ0JxamIxTFNpRCtkbGVhNXUwSGlmVFlxc1NPblQ5WEdwS3VhaEJo?=
 =?utf-8?B?WHc5L1FFeXNGQWNybk5XUE5BdEROaTZMTDdERVN6eGpVN3NxSWZ3OEFwVDFj?=
 =?utf-8?B?eUNldnRTbnJEdm5hUTN1MEJ2VjlVdWFxWTQ2T3pRVmE2L3Y1U1p6UlBRR29P?=
 =?utf-8?B?Q2xqMVoxSkhEdTd4d1VqaTlvZmtNeWJQdy9DNTFGUkVJYzRNcnJYVXVhR3Jx?=
 =?utf-8?B?Y21jdE1Jd2tsa1FnbG55anJuTEdWQnhxdkJYVlB0RWk0TjBUeWx0R2U2SEFn?=
 =?utf-8?B?TjZ4blo4NFpqemxaQ2crYWlLWTEycjJ5WTNEM0JEc0loZjVLSmxnNDNGWXE4?=
 =?utf-8?B?WE1LUFV0cWttYTBPdHYza0EwckgxWFc1OHNVYWM5NUJ4ekgrb1JPQjUrdk54?=
 =?utf-8?B?eis4MWtQYjg5M0E0aEtQU3l3MWdzNkVhRDZTM0NKWHZWYlBiaUcwVkluRDRk?=
 =?utf-8?B?NGRmNHNTWHpWWUszdUQvdHZVNXUvUkRTWWk0dVN2T3EwRkpSc014T0haclM2?=
 =?utf-8?B?TmY3SXcweEZIVHBLU2hwMklpWGRwaWFrSGZYeDdRVy9XMWpHUTNpdEJ5Y3Nw?=
 =?utf-8?B?ZTEvRC9kaFpVWXBieElDNHNNM0paL3I2bnZGWW9VV2JubERQa2EwbnpvQWxv?=
 =?utf-8?B?RmZBZExjQU1jTlM4OGR4TnhyY1dGTlpIclRoclZQRGRZWUNpd1NJTjMrYXpu?=
 =?utf-8?B?ZE1JZXg3RXUzOXFSTm8vamV6YnpNaG9rYVJLTXpCeEh0aFgyNGx4TDBIZ25C?=
 =?utf-8?B?SE9uejB6WkU5VXpVYklGTGRBYVpxVHk0Sjc5OVplTU5HMFJqR2RUYUg4blJt?=
 =?utf-8?B?TXlKRkxnWERScUNub2ZsYU9YK2RLM09OVnd6c1Ivdk1wMmMyTThIMytidkda?=
 =?utf-8?B?SW9NMUtwMENwV3U0alVtLzZjWXpuWnY3SlplY0JmQkRKZ1VoTDBWZDdpTnNm?=
 =?utf-8?B?MXVPNzhzbGhDNWwyaXNMMTU3SHFnS1d5VWplN3dlSmh6ZGhhdG50WTZ2VTZJ?=
 =?utf-8?B?Qm5reUhBWnpJNWZvam1nWEV2TS9SQ1Z6bVYyTWhqRUpKRWpMYzVrZE0yMzBI?=
 =?utf-8?B?Y003NUxCbloxQ0k5Vzl5ekVxUzV3WnBXNTNrMUVXdXFrY3htRkN1aThXWTI1?=
 =?utf-8?B?M1Nab0RTaXlrM2dWdnN1TmU2UFp4WEl4S0g2WUxIZm02cWRlUjhSYVFDMDZX?=
 =?utf-8?B?SDBoMFduVDR2MFhabWNlL1kxbzAya3BIUTFudURxT2p6dEpJU3FHM2RVblpU?=
 =?utf-8?B?bitwZ0trK2kwcUlUc0dLbU0yWGl3c2Q0Z2RXYnh3RnM4TWRKeVdzQkZjYXlu?=
 =?utf-8?B?eU5CMm5zdU9iVjUzWGV1R3VsZjhzcitYOVBwQjdXNXNnT0w0Sm4rYWhiSmlM?=
 =?utf-8?B?cHJTSWRkUWQxMW1TQTdQaWpoUHFjOXFjZHFSdGhPa3VWLzdWbFJwY2ZMOVQz?=
 =?utf-8?B?TXJEbFY2VDBrUmpaV21abi85aFZsTGpMRks0UlhQMUJ6V2pBYWJ2bGNpenRj?=
 =?utf-8?B?OGY0WmxVeEdCbkpXRVRhY3pvUVVDaldwekhrNk9ZdHQ2Tm5BNVB6UHBLbndN?=
 =?utf-8?B?YnRmY1BuOFdGRm1UMEcyV1hBQWt5b0xtbXYyWUFsdjhaUWNUQ0wyVUk2aWVT?=
 =?utf-8?Q?e2Zt0dtutbF3RiChF5sLpaIiZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53C00A75DC7D9A439B768252DF501265@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f6d63e-694a-4e58-4266-08dd75a3ba01
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 07:13:41.6994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ++vieYcZrVyGWKj1wzLqcOZT1k/1LNSBZmT2uQl+45Ub1I3HUFBDsfDLBoA8gyXx0cjWwwxcAKU3WQQ5O3MMGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6859

T24gVGh1LCAyMDI1LTAxLTA5IGF0IDE0OjU0ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDA5LzAxLzIwMjUgMTQ6MzUsIGt5cmllLnd1IHdyb3Rl
Og0KPiA+IEFkZCBtZWRpYXRlayxtdDgxOTYtanBnZGVjIGNvbXBhdGlibGUgdG8gYmluZGluZyBk
b2N1bWVudC4NCj4gDQo+IFBsZWFzZSB1c2Ugc3RhbmRhcmQgZW1haWwgc3ViamVjdHMsIHNvIHdp
dGggdGhlIFBBVENIIGtleXdvcmQgaW4gdGhlDQo+IHRpdGxlLiBgZ2l0IGZvcm1hdC1wYXRjaCAt
dlhgIGhlbHBzIGhlcmUgdG8gY3JlYXRlIHByb3BlciB2ZXJzaW9uZWQNCj4gcGF0Y2hlcy4gQW5v
dGhlciB1c2VmdWwgdG9vbCBpcyBiNC4gU2tpcHBpbmcgdGhlIFBBVENIIGtleXdvcmQgbWFrZXMN
Cj4gZmlsdGVyaW5nIG9mIGVtYWlscyBtb3JlIGRpZmZpY3VsdCB0aHVzIG1ha2luZyB0aGUgcmV2
aWV3IHByb2Nlc3MNCj4gbGVzcw0KPiBjb252ZW5pZW50Lg0KPiANCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBreXJpZS53dSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAu
Li41LWpwZWdkZWMueWFtbCA9PiBtZWRpYXRlayxtdWx0aS1jb3JlLWpwZWdkZWMueWFtbH0gfCAx
MA0KPiA+ICsrKysrKystLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4gPiAgcmVuYW1lIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS97bWVkaWF0ZWssbXQ4MTk1LQ0KPiA+IGpwZWdkZWMueWFtbCA9PiBtZWRpYXRl
ayxtdWx0aS1jb3JlLWpwZWdkZWMueWFtbH0gKDk1JSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+
ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbXQ4
MTk1LQ0KPiA+IGpwZWdkZWMueWFtbA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL21lZGlhdGVrLG11bHRpLWNvcmUtDQo+ID4ganBlZ2RlYy55YW1sDQo+ID4g
c2ltaWxhcml0eSBpbmRleCA5NSUNCj4gPiByZW5hbWUgZnJvbQ0KPiA+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtdDgxOTUtDQo+ID4ganBlZ2RlYy55
YW1sDQo+ID4gcmVuYW1lIHRvIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlayxtdWx0aS0NCj4gPiBjb3JlLWpwZWdkZWMueWFtbA0KPiANCj4gDQo+IERvbid0
IHJlbmFtZSB0aGUgZmlsZS4NCj4gDQo+ID4gaW5kZXggZTU0NDhjNjBlM2ViLi41ZWM5OGRkYWQ1
MDYgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL21lZGlhdGVrLG10ODE5NS0NCj4gPiBqcGVnZGVjLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbXVsdGktY29yZS0NCj4g
PiBqcGVnZGVjLnlhbWwNCj4gPiBAQCAtMSw3ICsxLDcgQEANCj4gPiAgIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ICAlWUFNTCAxLjINCj4g
PiAgLS0tDQo+ID4gLSRpZDogDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lZGlhL21lZGlhdGVrLG10ODE5NS1qcGVnZGVjLnlh
bWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFsZzFkOWU1dm03SlFSYlVJUktnNjRiNDRjS0NUT2d4
bzhxaXdFMlF1WVNCTGNNSFVhYUZLYmlrcDZ5T1hJNGx2Y2VZT0F3TEVMbHF0YlEkDQo+ID4gKyRp
ZDogDQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL21lZGlhL21lZGlhdGVrLG11bHRpLWNvcmUtanBlZ2RlYy55YW1sKl9fO0l3ISFD
VFJOS0E5d01nMEFSYnchbGcxZDllNXZtN0pRUmJVSVJLZzY0YjQ0Y0tDVE9neG84cWl3RTJRdVlT
QkxjTUhVYWFGS2Jpa3A2eU9YSTRsdmNlWU9Bd0pxbW5TTVdBJA0KPiA+ICAkc2NoZW1hOiANCj4g
PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFsZzFkOWU1dm03SlFSYlVJ
UktnNjRiNDRjS0NUT2d4bzhxaXdFMlF1WVNCTGNNSFVhYUZLYmlrcDZ5T1hJNGx2Y2VZT0F3SUp0
am4zN1EkDQo+ID4gDQo+ID4gIHRpdGxlOiBNZWRpYVRlayBKUEVHIERlY29kZXINCj4gPiBAQCAt
MTQsNyArMTQsOSBAQCBkZXNjcmlwdGlvbjoNCj4gPiANCj4gPiAgcHJvcGVydGllczoNCj4gPiAg
ICBjb21wYXRpYmxlOg0KPiA+IC0gICAgY29uc3Q6IG1lZGlhdGVrLG10ODE5NS1qcGdkZWMNCj4g
PiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTk1LWpwZ2RlYw0KPiA+ICsg
ICAgICAtIG1lZGlhdGVrLG10ODE5Ni1qcGdkZWMNCj4gDQo+IERldmljZXMgbG9vayBjb21wYXRp
YmxlLCBzbyBleHByZXNzIGl0IHdpdGggZmFsbGJhY2suDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+
IEtyenlzenRvZg0KDQpEZWFyIEtyenlzenRvZiwNCg0KVGhlIE1UODE5NSBhbmQgTVQ4MTk2IGFy
ZSBib3RoIG11bHRpLWhhcmR3YXJlIGNoaXBzLCBJIHJlbmFtZWQgdGhlIGZpbGUNCnRvIHRyZWF0
IGl0IGFzIGEgY29tbW9uIGZpbGUsIGlmIEkgZG9uJ3QgZG8gdGhhdCBpdCB3aWxsIG5lZWQgdG8N
CnJlY3JlYXRlIGEgZmlsZSB3aXRoIHNpbWlsYXIgY29udGVudHMuIElzIHRoaXMgYWNjZXB0YWJs
ZT8NCklmIHRoZSBhYm92ZSBkZXNjcmlwdGlvbiBpcyBhY2NlcHRhYmxlLCBJIHdpbGwgYXBwbHkg
eW91ciByZXF1ZXN0IGluDQp0aGUgbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3MuDQoNCkJlc3QgcmVn
YXJkcywNCkt5cmllDQo=

