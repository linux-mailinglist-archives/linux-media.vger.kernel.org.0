Return-Path: <linux-media+bounces-22056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC69D8FAF
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 02:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20D00282367
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 01:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0843B672;
	Tue, 26 Nov 2024 01:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bc9gLICy";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Y8nR6iBV"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A42ECA64;
	Tue, 26 Nov 2024 01:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732583327; cv=fail; b=rgp2FoS8V8MbnDt8Efkbxs0gFE+lxFMwOm9WkIOK5523z5mCLz2zf7IXiGyKhHn3VtRH5+87tk6YqB0PSzsEqm+skRAq5C5+AIiogb2dfLeWkZz41/XVayvkOC1llM20+vO2z1ZFz+z9rr02jiHsQR1JzWcMQt20Xt5TxXvMb7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732583327; c=relaxed/simple;
	bh=NTFkhMlAglZeY3hPt6aPFcFCTo/3srTQjdNurPDgMR4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pNfJndc8o2g1eJqeSci+xj8cImF0woXP2B89UXxhJuCIF7/OFutwHfVKOuDHGNKrsVte1Aj0JRAczgRD+57Rn6n/hPOVVGE0BsD8z8WcvYpx0WtBwCMcTDJACikH0jtZnO8U8da3SS3RPQ9qyDiUXuq08gr8v5a3Yw8P4GKnFM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bc9gLICy; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Y8nR6iBV; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f8831b70ab9211efbd192953cf12861f-20241126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=NTFkhMlAglZeY3hPt6aPFcFCTo/3srTQjdNurPDgMR4=;
	b=bc9gLICyA60aYy9e/UCthOin/S8Jsws7A40whsMvsH8lmPO/x3Lz5fcvtzlrGL68ge269FbV6qA+Vew8EI1dSbkum5MBBg8FspJa6xOtDyx68for3Qc/XwbOcSL3H7YdJTDBbyhYHi0klrLQv2q1yO/a82NAhzRIkLI47wKWP4Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:e5bedfe8-a924-4dae-9885-08cb04d0aefe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:c0e343e0-1fe5-4c4a-bdf3-d07f9790da32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f8831b70ab9211efbd192953cf12861f-20241126
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 736519083; Tue, 26 Nov 2024 09:08:39 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Nov 2024 09:08:38 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Nov 2024 09:08:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5UVgp+0DYRy2KLnDiyTuYrWNNnbe/wtLZsWLdGXROqFKe4r/ralM7eemmaDacljoTrCsI56lk50P5vsva3IM5BoMqU4sSNbTZKD50t71rihti/szNUnxYC9YXK7LTR3eRKziL0sIAGqsJIVV9JdjC+Q02RnuL6HYd71jKj7J0mBZ0wZzdhNwvVXZwXARTuC0HeAfWKLEcxp0V2ClZCt0IIeW9Nogu0NKyOHBTX1KRBuRxqu8+nbwxaz6cwQ5LuJuAeePvWRB4rD8oaRa8qTcfY9URIHeaggyDPZPpSZQ+5XSeqhEKrBHPCTX0PH1EHc77Uiru3nhmvKInkPsM2U7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTFkhMlAglZeY3hPt6aPFcFCTo/3srTQjdNurPDgMR4=;
 b=cJ6Vdv4QNWbTYVd9/5hQpEc0O2omKpxPARybyAH4/lFv4DzpPNNgkaZVIHRIl/bPs/vqVR19AIRgZv3SUnsWFFWplMiF9L1/Vszq7MXGjL8icD66ovfzRozMNYDTgwJs1twaqrhAWJCcUjkEf7t8mmwgC83TGnyTk8p2vWlHywLh9C3y6L84XMt4CGLicdFDQZ+Mj9qzUCbmQIARMa5hM61MIct57sB+22rCgNcJQqIsEHe+K9gZxman/aI0/AsHQ61i7GGA7xNR9XoGCb8N5dM4J2hBWjBcP4dSNpouLo1uKx0m887vIdAZtWNmM3/tHLTY8WaU2HWVEiK8TLWPIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTFkhMlAglZeY3hPt6aPFcFCTo/3srTQjdNurPDgMR4=;
 b=Y8nR6iBVkCv8Rd7ya8XWJ/6EFahvYIEUW8p3HCAGtGdGXPvfFeTgmNkJWhSgMaKlYGNnLYCYSXaB+JZs6sjQ80F9i6uX0PbAjCxxdAesLJDl50CWMol58EUdhfTeKb1WJsJXY/L+AjSLVuEk15KwGq0ra9ZrFNV4Y9NwqQq9ePA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7639.apcprd03.prod.outlook.com (2603:1096:400:426::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 01:08:35 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8182.018; Tue, 26 Nov 2024
 01:08:34 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Julien Stephan
	<jstephan@baylibre.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLHl18AgAAsr4CAAATBAIAABz8AgAD3d4A=
Date: Tue, 26 Nov 2024 01:08:34 +0000
Message-ID: <5925ceaf0bcf92639bf0b5622a9e518331637ae6.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
	 <a9aa69dc8d025f0b133f33de6428ffec5a881a2a.camel@mediatek.com>
	 <20241125093953.GM19381@pendragon.ideasonboard.com>
	 <25f70693c81eb86c832378fee89792f6754b7ca0.camel@mediatek.com>
	 <20241125102250.GO19381@pendragon.ideasonboard.com>
In-Reply-To: <20241125102250.GO19381@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7639:EE_
x-ms-office365-filtering-correlation-id: b50b06f7-5518-4cb6-b1fc-08dd0db6d998
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NEVYV3owcHpNZHlabk9UT3A4bW9rZVhzUFV4Z1dFR1FON2ZzQVhncUVEZ0sx?=
 =?utf-8?B?enNNaGx3NTRuNFo2aVRUVzU1M1RvRDhYS1dZN1d4SW1YV200SHpJdTVGUW5K?=
 =?utf-8?B?RlRaVUVaM3YxZVM0NGpza04zcDZqdm5PQjhxZSszMU1sbnpmUmFTY3RnOVV5?=
 =?utf-8?B?Q0NRT2REWHJjb2tHTmU1bGdLb0cvaWw2V1N0US8zdC9LMStqbTNja0Vac2RF?=
 =?utf-8?B?djloZFBKcmdISWs2c1hVS1RmQ1RRQW9kM1JSTTFEVlFHcU5mUU9pUFZCK1Z3?=
 =?utf-8?B?cXhIaGUrSjArSVhrYlJYbm54Mkl2M01UYTlCSVdWcEFqWUZZanFWdUFnMEJi?=
 =?utf-8?B?UUI3M2pSbnNGb1lDcFd2UHJ5WW1ES2tWTVVIQ0orUkxPVklhTGdjQ3BUSGYw?=
 =?utf-8?B?cEJUUitWL0VJU3p2LzlVSEtjYWxQQUlzTmswSnc2SlVxTmQ2SnVkekxkL05t?=
 =?utf-8?B?cGIxcEFkdUpGOXhNVnhYNERERjZWN2c3bmQ3SXdWMFdtcXljU3BaOFBhblNq?=
 =?utf-8?B?VU9BQTIvbHNuRTBNOU9Sbm5HNVh0eUhmVlphejNOZTJORU5pM1J0em14R3gz?=
 =?utf-8?B?dUluRHdwUEdRM0dqL0lpbFB3RkRsQXYyNFFzdlhWUUd0WUFnR3dneXQ3cWtu?=
 =?utf-8?B?TjBYU1VJQkIvL3hVVTR4Zy9DUlZEdFByVk4xR2hrVGp2VUplcnBySW1Ic0JI?=
 =?utf-8?B?RnJJakhmMDhObCswcW5nQ25adks2TUtzRXlHYVFhM0VPbFR5cHEwY0QzajRl?=
 =?utf-8?B?bldPSUJuSjF1cHJ0UGw5MFlpREsyTHROVWpNNWFkRnlveFhDM3pwRW9NZG9S?=
 =?utf-8?B?QXJqMUVVcjl6R01aWHg5bVFMOU9tbHh4MytLWlZ3ZmZqSFNjc3RPMUdNNjJE?=
 =?utf-8?B?NUhOaTNTV3VEWmJmaEJQR1NMTzdKRVFVNmFxeHc5d1JYSmNyNkxFWmU0dzEy?=
 =?utf-8?B?d3JNR0hkeGthUlNtOEZ0enl3ckcxMkdPdFJEVjkrK01xVGFSbS9zRnFuK25S?=
 =?utf-8?B?NVFTNGxPZlNXL014Tlo5Nm1KUWlqR0Z6UzM0WTU0UTUvNmNobDd0YjdpRWpm?=
 =?utf-8?B?U09rWEJhVGRsRWRPd1hHbnJwUmRNVjRXMG1FdVZFSHRRSVZEU2h0cnZMWmgz?=
 =?utf-8?B?T1dMTHhJMGd3dzdDdWMrSkNzZVFQbHJwcGhWOG1iVVV1UkNoM3hqcFlSdGtX?=
 =?utf-8?B?dEd6UmRQNTMrcTlyZW9UVDB6bUJ6bGJZa1lldHIxbG1IQ1VRUXFTaU1tV3Nw?=
 =?utf-8?B?d2I5S1FFbmJHT1I4UFd3a003OFhaT2VjdktncVVaOHpwMjVqV0JSVGNlQS9k?=
 =?utf-8?B?MFI1MVhpc0xUK2JlMVRDdmxYMnU0U2VWQ0dvcFdUVmxlbzBQMi85Mk92b25B?=
 =?utf-8?B?ODVuV2xpekQxOTF6UHkxcmZycWUwNzVtSk1yYnJidm9nKzFkYk9mQmxKWERP?=
 =?utf-8?B?TGRlRzJSK1N5RitoTkZCVHJxbVEvY2Jkbm54a2U4WWhiYk1SQVFUSjJiaG5y?=
 =?utf-8?B?RkZ3SGt3SkUyNTZxSGVpYVdyM01nTmFWdWd3NnU5RW9TT1I2ZFNXUUZFY3Nr?=
 =?utf-8?B?SzNtQ0ZUcEZBZHhFZ1gzL0M5WXVURFFFRXpWa0FaYmNOVXR2MGJMdUNkdzVq?=
 =?utf-8?B?UzBQdm5iK3JBelNUM29HOU5oV1RLRlY2Q2NPSkFmYXpTVGtkeXB4dHdqWFly?=
 =?utf-8?B?T1BkTmwzVnZITHVmaGZoQzVlSUxGb1pnWHNkaVgyWUxMK2FhckZMLzE5TkFl?=
 =?utf-8?B?ekFBQkZnUWlWL2JzTjRCVmI5d21UckZrVWo1clo0WjQ1UUhvSU94cG9Zbncv?=
 =?utf-8?B?Y3JPSU1wWVJqNkZLRktMaU9MTzZzY2laR0VtVzJ3b2gxRVlkVjV2c21tVDk5?=
 =?utf-8?B?T2VGUlovN0RhTzhCdkNya083Tk8xejN6UUtPZEU5YklTbUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N25EZm1FcVNkb2cvNVdibFVSTWxNeS9XMFNwekVaVlpTTDV3VjlkN1o0cTU1?=
 =?utf-8?B?cTIzMEQ5NjR2N3RWRHVSOGpzM0NZZk9pclMwL3Z4YkJ6Y0t6RzlSYytiZ1l5?=
 =?utf-8?B?bXRmem02Z21SazZWbGxoNC96cGFwazhIQ1VDNGFjSy81RjA0Zk5yVTV0K2Zm?=
 =?utf-8?B?YXQ4aXdJQXM5eW15Snh3YXJFc0g2SUcwQmR1RnZaTERuUXNLNGJITjl0SDMv?=
 =?utf-8?B?Q1RQR0tFZUdyWDZ3L1kxQW13dTdPcEE3RGM3NUhEYTA0d054RGZvNWR2ZGtC?=
 =?utf-8?B?OGFWNzdjSTJ3QUxZQ0ZiTHhxeThCZUNQdTBiRTQ2TVB2a3RLUjhxR2JEWnR4?=
 =?utf-8?B?MU14SDdRRG84cFNqSmhlZExWV1VqUUpuK2FUR3JGa3FWcDA5NDBLTy9od01Z?=
 =?utf-8?B?QWVnaWlFd0pHcy9RUGN6alNJMVFBcVdwQ1FrMDRwWkp1Tk9RdyttSkR3T2oz?=
 =?utf-8?B?b01tQmQ0Y2k5UFhPUVdnNnRqN1FlaWVhaVZONFYxTjBOUmV6QnVZRDczNFh1?=
 =?utf-8?B?ZkMrUkdXdTM0cnpqY05Rc2N5SERvcEZLNWo4amtsM1RNMGFtUk5Eei9IT2NZ?=
 =?utf-8?B?Ukl6K045bzk1SHM5N1plSDg0MnQ4NXc2ZFZDcERzcU1RNmpIT3hoMEZGeXo2?=
 =?utf-8?B?ajNwak9DYWhGVlFzNDRNVWhUck9Sblg4NUxyQVA3YmlLWWhsSTAvYmFEakVs?=
 =?utf-8?B?Mk5Nb1dnUWVwYUwrS3RGeW4zclRuclpGNTJ5K25qcmUxb280VWZvZWptYWQz?=
 =?utf-8?B?RVZzTUZGZmp4Q0hCZlpPU2JmOC9GS1Q1YmNiUGVNdFhrUm00cmo0eHcwZVdO?=
 =?utf-8?B?ZElEM2NrWmJjSk1rRlp1WkNEUjhZRjFoWlorL3gyZXBKRytmc3VvKzBETzRZ?=
 =?utf-8?B?QU91ZVVsQnpJZkJEWmNSSVk5QUt3dkNZTjVjM2lCOEVmd01RTFlNcjBZQ3Bw?=
 =?utf-8?B?a1ZsR05nR1MxSi9VV3dISVA2ZGhJUGlqcUhsVUkwcEdyNlpGM2tETW9rU1A4?=
 =?utf-8?B?a1NxZVhJVUZBR3R1T2Q5Qi9NMWwvcWowVndZUnZQL2MyQzh3ZXRBV2szeGsy?=
 =?utf-8?B?NDJUeEpDckNycWNZdWdoaTBpbVFCSVhiUmo0UFU2ZnhTdldSY2hFNjJ6Z2Q0?=
 =?utf-8?B?aC9YTHRFUzdUSCtwazZaTms3WUN6Q1ZTVngxM0dBT0ltMThKY3JHeWFGWms5?=
 =?utf-8?B?bGJlZ1JRNnh6Y2xvdmc5S25zbFN5Um53UGw3K0dsZmprY1c3M01rcmRNOTdo?=
 =?utf-8?B?cXhseEcybjNCOHA1SnJtamFrc2g1Ym4wbThxaG1BUkcrZVN2WVg5VE1IYWxB?=
 =?utf-8?B?ZzBHY0xiSm9WOTVRdE9Ic0NqV1Nob0k4Yk0zM3JSMzU2eGQvZ3k2ZGFEaUs0?=
 =?utf-8?B?Ynd0SVhiM2FKY3FNNXN6ZlNQMC9paHUzUDlQNmh0ZEF4RWFkYUNiTVZsNUNa?=
 =?utf-8?B?RnpvZ3VBMEF3aW9jc2thTEZucXBHeWpLdTF3QjVCMmYweWsxcGNuZ2NqelVP?=
 =?utf-8?B?V3huWWtmUllIVyt1TS9YVmR4dk5IcjM3dU5WSFZzMWpLV1JSZ2QyTkpjQVZy?=
 =?utf-8?B?L0FmNk5jTnJ1OWpvSkRKM1BzUjltZkt0YTVXMklXOTFJTXdnT0krZFJPRFR2?=
 =?utf-8?B?RVRDZWwxbU1jMlphRVVBcUIwN2dBbXIyc1ZxS2M4amRORDNOYWZoWG0yV1gy?=
 =?utf-8?B?RFI0bmdVV1JOMzBPMzlOdGI1VEdQYmNORzZHM2dJQXk3NExpTVZ5NXRLWDhs?=
 =?utf-8?B?RUxzZWU1OUlWZzcreGVLUWFDYjAxbkxnS2haOGROQ2FrNnRHVGQ5OWdZSEtV?=
 =?utf-8?B?b2ZUaXp6VmRsMm1pQi9UeTQzT1lIbkZoRHpGeGVLOGRqWktqVXh0ajY1NC9W?=
 =?utf-8?B?dDliNlBmRGJOWWVERE9yZUxkQUxGcERSVHJTd1ZVdiswT3h2UDBCMDBWRzE0?=
 =?utf-8?B?MmgySGRBOC9yOTVCWDAzNytWVHFzOU1wM3NGTXpINXJ0WnZObzR6c3NLYk9U?=
 =?utf-8?B?UE9pTkhhUFE2UTdPQ3d6WFFGK0JyY3h0VHpmeVNJQ00wZWNRK1ZpNWtOMjJ3?=
 =?utf-8?B?K203T1RDb1JaNm1OU2Y0NHNvdGhpRnNJblJySVU4alZkQ01xNW5ldUwydlRk?=
 =?utf-8?Q?+uCGx9UZZ3F7vY+CLLujHC1Q9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36C992C0907D5A4AA40B3B3948531C62@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50b06f7-5518-4cb6-b1fc-08dd0db6d998
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 01:08:34.2205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cBBrvPcDE76dxOV2G7TuhSoVGqitKXv9IoaFi9bwNFUPw6eQ6zeEuoWaAk23P2D3RhUUR8ygpkHREXzIsDdUvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7639

T24gTW9uLCAyMDI0LTExLTI1IGF0IDEyOjIyICswMjAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3Rl
Og0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IE9uIE1vbiwgTm92IDI1LCAyMDI0IGF0IDA5OjU2OjU0QU0gKzAwMDAs
IENLIEh1ICjog6Hkv4rlhYkpIHdyb3RlOg0KPiA+IE9uIE1vbiwgMjAyNC0xMS0yNSBhdCAxMToz
OSArMDIwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gPiA+IE9uIE1vbiwgTm92IDI1LCAy
MDI0IGF0IDA2OjU5OjU5QU0gKzAwMDAsIENLIEh1ICjog6Hkv4rlhYkpIHdyb3RlOg0KPiA+ID4g
PiBPbiBUaHUsIDIwMjQtMTEtMjEgYXQgMDk6NTMgKzAxMDAsIEp1bGllbiBTdGVwaGFuIHdyb3Rl
Og0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEZyb206IFBoaS1iYW5nIE5ndXllbiA8cG5ndXllbkBi
YXlsaWJyZS5jb20+DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhpcyBkcml2ZXIgcHJvdmlkZXMg
YSBwYXRoIHRvIGJ5cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gPiA+ID4g
PiBjb21pbmcgZnJvbSB0aGUgU0VOSU5GIGNhbiBnbyBkaXJlY3RseSBpbnRvIG1lbW9yeSB3aXRo
b3V0IGFueSBpbWFnZQ0KPiA+ID4gPiA+IHByb2Nlc3NpbmcuIFRoaXMgYWxsb3dzIHRoZSB1c2Ug
b2YgYW4gZXh0ZXJuYWwgSVNQLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IFBoaS1iYW5nIE5ndXllbiA8cG5ndXllbkBiYXlsaWJyZS5jb20+DQo+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogRmxvcmlhbiBTeWx2ZXN0cmUgPGZzeWx2ZXN0cmVAYmF5bGlicmUuY29tPg0KPiA+
ID4gPiA+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBQYXVsIEVsZGVyIDxwYXVsLmVsZGVyQGlkZWFzb25ib2FyZC5jb20+DQo+ID4gPiA+ID4g
Q28tZGV2ZWxvcGVkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+ID4gPiA+IENvLWRldmVsb3Bl
ZC1ieTogSnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNvbT4NCj4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gU3RlcGhhbiA8anN0ZXBoYW5AYmF5bGlicmUuY29tPg0KPiA+
ID4gPiA+IC0tLQ0KPiA+ID4gPiANCj4gPiA+ID4gW3NuaXBdDQo+ID4gPiA+IA0KPiA+ID4gPiA+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19jYW1fY29uZiBjYW1zdjMwX2NvbmYgPSB7DQo+ID4g
PiA+ID4gKyAgICAgICAudGdfc2VuX21vZGUgPSAweDAwMDEwMDAyVSwgLyogVElNRV9TVFBfRU4g
PSAxLiBEQkxfREFUQV9CVVMgPSAxICovDQo+ID4gPiA+ID4gKyAgICAgICAubW9kdWxlX2VuID0g
MHg0MDAwMDAwMVUsIC8qIGVuYWJsZSBkb3VibGUgYnVmZmVyIGFuZCBURyAqLw0KPiA+ID4gPiA+
ICsgICAgICAgLmltZ29fY29uID0gMHg4MDAwMDA4MFUsIC8qIERNQSBGSUZPIGRlcHRoIGFuZCBi
dXJzdCAqLw0KPiA+ID4gPiA+ICsgICAgICAgLmltZ29fY29uMiA9IDB4MDAwMjAwMDJVLCAvKiBE
TUEgcHJpb3JpdHkgKi8NCj4gPiA+ID4gDQo+ID4gPiA+IE5vdyBzdXBwb3J0IG9ubHkgb25lIFNv
Qywgc28gaXQncyBub3QgbmVjZXNzYXJ5IG1ha2UgdGhlc2UgU29DIHZhcmlhYmxlLg0KPiA+ID4g
PiBUaGV5IGNvdWxkIGJlIGNvbnN0YW50IHN5bWJvbCBub3cuDQo+ID4gPiANCj4gPiA+IFRoaXMg
SSB3b3VsZCBrZWVwIGFzIGEgbXRrX2NhbV9jb25mIHN0cnVjdHVyZSBpbnN0YW5jZSwgYXMgSSB0
aGluayBpdA0KPiA+ID4gbWFrZXMgaXQgY2xlYXIgd2hhdCB3ZSBjb25zaWRlciB0byBiZSBtb2Rl
bC1zcGVjaWZpYyB3aXRob3V0IGhpbmRlcmluZw0KPiA+ID4gcmVhZGFiaWxpdHkuIEkgZG9uJ3Qg
aGF2ZSBhIHZlcnkgc3Ryb25nIG9waW5pb24gdGhvdWdoLg0KPiA+IA0KPiA+IElmIHRoaXMgaXMg
YSBjb25maWd1cmF0aW9uIHRhYmxlLCBJIHdvdWxkIGxpa2UgaXQgdG8gYmUNCj4gPiANCj4gPiB7
DQo+ID4gLnRpbWVfc3RwX2VuID0gdHJ1ZTsNCj4gPiAuZGJsX2RhdGFfYnVzID0gMTsNCj4gPiAu
ZG91YmxlX2J1ZmZlcl9lbiA9IHRydWU7DQo+ID4gLnRnID0gMHg0Ow0KPiA+IC4uLg0KPiA+IH0N
Cj4gDQo+IEkgbGlrZSB0aGF0IHRvbywgaXQncyBtb3JlIHJlYWRhYmxlIHRoYW4gcmF3IHJlZ2lz
dGVyIHZhbHVlcy4NCj4gDQo+ID4gSWYgbmV4dCBTb0MgaGFzIG9ubHkgb25lIHBhcmFtZXRlciBp
cyBkaWZmZXJlbnQsIHdlIGR1cGxpY2F0ZSBhbGwNCj4gPiBvdGhlciBwYXJhbWV0ZXI/DQo+IA0K
PiBUaGF0J3Mgd2hhdCB3ZSB1c3VhbGx5IGRvIHdoZW4gdGhlIGFtb3VudCBvZiBwYXJhbWV0ZXJz
IGlzIG5vdCB0b28NCj4gbGFyZ2UuIFdoZW4gaXQgYmVjb21lcyBsYXJnZXIsIHdlIHNvbWV0aW1l
cyBzcGxpdCB0aGUgY29uZmlndXJhdGlvbiBkYXRhDQo+IGluIG11bHRpcGxlIGNodW5rcy4gRm9y
IGluc3RhbmNlLA0KPiANCj4gc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBmYW1pbHlfYV9jbGtz
W10gPSB7DQo+ICAgICAgICAgImNvcmUiLA0KPiAgICAgICAgICJpbyIsDQo+IH07DQo+IA0KPiBz
dGF0aWMgc29udCBjaGFyICogY29uc3QgZmFtaWx5X2JfY2xrc1tdID0gew0KPiAgICAgICAgICJt
YWluIiwNCj4gICAgICAgICAicmFtIiwNCj4gICAgICAgICAiYnVzIiwNCj4gfTsNCj4gDQo+IHN0
YXRpYyBjb25zdCBmb29fZGV2X2luZm8gc29jXzFfaW5mbyA9IHsNCj4gICAgICAgICAuaGFzX3Rp
bWVfbWFjaGluZSA9IGZhbHNlLA0KPiAgICAgICAgIC5jbGtzID0gZmFtaWx5X2FfY2xrcywNCj4g
ICAgICAgICAubnVtX2Nsa3MgPSBBUlJBWV9TSVpFKGZhbWlseV9hX2Nsa3MpLA0KPiB9Ow0KPiAN
Cj4gc3RhdGljIGNvbnN0IGZvb19kZXZfaW5mbyBzb2NfMl9pbmZvID0gew0KPiAgICAgICAgIC5o
YXNfdGltZV9tYWNoaW5lID0gZmFsc2UsDQo+ICAgICAgICAgLmNsa3MgPSBmYW1pbHlfYl9jbGtz
LA0KPiAgICAgICAgIC5udW1fY2xrcyA9IEFSUkFZX1NJWkUoZmFtaWx5X2JfY2xrcyksDQo+IH07
DQo+IA0KPiBzdGF0aWMgY29uc3QgZm9vX2Rldl9pbmZvIHNvY18zX2luZm8gPSB7DQo+ICAgICAg
ICAgLmhhc190aW1lX21hY2hpbmUgPSB0cnVlLA0KPiAgICAgICAgIC5jbGtzID0gZmFtaWx5X2Jf
Y2xrcywNCj4gICAgICAgICAubnVtX2Nsa3MgPSBBUlJBWV9TSVpFKGZhbWlseV9iX2Nsa3MpLA0K
PiB9Ow0KPiANCj4gVGhlcmUncyBubyBjbGVhciBydWxlLCBpdCdzIG9uIGEgY2FzZS1ieS1jYXNl
IGJhc2lzLg0KDQpPSy4gVGhhdCdzIGZpbmUgZm9yIG1lLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiAN
Cj4gPiA+ID4gPiArfTsNCj4gPiA+ID4gPiArDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4g
TGF1cmVudCBQaW5jaGFydA0K

