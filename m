Return-Path: <linux-media+bounces-16862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A47495FF4F
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 04:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1A08B21174
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 02:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A991D1754B;
	Tue, 27 Aug 2024 02:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="btt3yQB9";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="MOmOpPT3"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF4E10A3E;
	Tue, 27 Aug 2024 02:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724726835; cv=fail; b=sNZ3fWZ61XUtvzW258jRouKVfRvoIdYB+DDUd66G3Dv53f8j4i7/0R4SFj8QPYPpvoMg2Km9vShOS7n1V4/O4qnjJwIvJfYdFzch+O1YKm9TOdscIMR4gJ8hRCWLzk8boj3cLG0Ls+xRFXWMxdQGkzifO8Np686m7txD5CW/J+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724726835; c=relaxed/simple;
	bh=qD8GjEnWy0fBFLT8hKtKkVMgRt24qUPOdDKi/LoF3LY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b5KtcovMhjf/M10ckmNAkSPeICp/AP4T//ZAlUxRsuzXzc5GlBm3YGeMfdipIEoljG/SXKsa9GKEnksA3I1WW49Q0pZxGnqhpAXzBqKO+qhGFOGYdWUl63OGgs480/BbvUE4A+5SvampoOWxc25+j226UYrF0fj9hLZSaqGmV5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=btt3yQB9; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=MOmOpPT3; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a4faed86641e11ef8593d301e5c8a9c0-20240827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qD8GjEnWy0fBFLT8hKtKkVMgRt24qUPOdDKi/LoF3LY=;
	b=btt3yQB9XGv5+Fc8kxPT6JJIPnKjb83QzIszWmSKBBSGr8MnjP59vetfdq3ikN9ZtH0ueQYxhiESxxn6o5qs8Y9yaWArpadkljC5YGK0VREOdtI+sY8It0MkOvi1tSKxoW/9lrMElryPKuHh1c6E+fSbWUyYPrcCMRovGeKSXhM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:d9aefcea-a937-4ae5-98e8-5674f2cd9ac4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:2354d714-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a4faed86641e11ef8593d301e5c8a9c0-20240827
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1230796119; Tue, 27 Aug 2024 10:47:05 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 26 Aug 2024 19:47:05 -0700
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 27 Aug 2024 10:47:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQZLxv7vLwNQr8ZYNEaFtY5r2ZVvH+hUl27Ho+MwjpakWgHghDw/Gk/MMGniU54dL6+bgrODkFs/an110fgJe+InFXBkAlglce2FVJWA4ip8ZVnCj/w7p6HZNbyjUnzMaE5S7DyqjIOGwvLA1wtL2KUYI2WB3nVnvauDaQku4NV8l/WfvoXi7hPsG/G0jc72ED/dVbUHFavVsiy8LNxMMtRT5YoO8hMFw55OaVvRChnSULYH0MyOVEZKkgegd7q1D5o43hI0b4BSET3XBrljHkTRDBsZAEg4j4rfO8A6kM++LWAHjNGv12kgFp7gU2h5jdaHJ4t8G8cvV5J/qfxNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qD8GjEnWy0fBFLT8hKtKkVMgRt24qUPOdDKi/LoF3LY=;
 b=vF+22UU+7Nhtwc2NFD9KM/jubDBV/4es76A8CiVRbElDYurtQ6vDbXIEGl2C2oh7m4QX/mgikEfOB8OPmwoddJDTJJl84tIob9JkvkeKfqqEQI4xdXNBDH65Wk0X8vpkT/YUhyCuTLMapUoDhnrHlS5r/pB1JhNCobJti1F6UAfv+84BFvGyc1dIhmQOHnnQqbHmqoDYQoD2dTIiTGjPcO0EymUnNSQNXtu/Jf12B3fs5y8nYCrjLEDMiDgYCtmULsMEZ/s8f0YK+5RrpqQnoOVAqRnrfENZ7D6jqeQcTAFjnTbJ767Z6yKfn0S4y4SG7obIB/MyLTWAUTvl+p/6WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qD8GjEnWy0fBFLT8hKtKkVMgRt24qUPOdDKi/LoF3LY=;
 b=MOmOpPT3s2ZrOfn4Q8yso0mpn2sm2+QTcm89ABTdv2IlnEfWqgiKJFaaJm1Tc1vqhPkLm5Q6FTQ7OdMxYSYrte4xlPem9KZ3xC/iaDBCcYAggNv3F788KSnd+YdBCFgtYQqxcuKRs3NNKgVq04OGhuzAKmMq6wwLmdeSSRrTSKA=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by KL1PR03MB7719.apcprd03.prod.outlook.com (2603:1096:820:eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 02:47:01 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%2]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 02:47:01 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
	<stevecho@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hsinyi@chromium.org"
	<hsinyi@chromium.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>
Subject: Re: [PATCH v4 4/7] media: mediatek: vcodec: using input information
 to get vb2 buffer
Thread-Topic: [PATCH v4 4/7] media: mediatek: vcodec: using input information
 to get vb2 buffer
Thread-Index: AQHa6KNstkVZz7hyr0GRf1LRb9xlBrI04feAgAWjiQA=
Date: Tue, 27 Aug 2024 02:47:01 +0000
Message-ID: <42c93832976240bc1fad68b5e606152a16b1de9f.camel@mediatek.com>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
	 <20240807082444.21280-5-yunfei.dong@mediatek.com>
	 <20240823124023.uhypfcixfsget26q@basti-XPS-13-9310>
In-Reply-To: <20240823124023.uhypfcixfsget26q@basti-XPS-13-9310>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|KL1PR03MB7719:EE_
x-ms-office365-filtering-correlation-id: e20ec427-8dc0-4420-5356-08dcc64286d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dGt0dElBSDFyRTZMeTRtVnUvZE9aZlZ4cnVSRnVrUEQrajZqREF3Y1V2UHMr?=
 =?utf-8?B?M1Q0V2I5Mk9veWZpUzVHVUFtaHpkR0FzVmlxVFNLQnh5cTRvdm9UMENtWllx?=
 =?utf-8?B?UVZPZWRscTh2UXIzcDNaL3V5U2FQZlpWWnFpRnljSDh1Y2pUU2RsbmNONmJo?=
 =?utf-8?B?dmlEd1JlcnhDY1Y5UUdZUmR1c2VMTitoWThFLytYM2dCMldFdU9pb0EyWGFn?=
 =?utf-8?B?ME51a0V5U0tlMUdvbTl5ODJaK2ZqTWlIK2oxeVphUEhWTmtOSlpBQUpzWFZE?=
 =?utf-8?B?VHorV081aEsyRllQcFhQemw5TzlQSXBuU3o0cEN2RXFYNTlTeDlyeDA2ZWIr?=
 =?utf-8?B?YkU0Y2NySml2blYwNkVnd3B3UVV3Y3I1TnFJQnBFTWlzamwxR0JFRk5tL01s?=
 =?utf-8?B?TDd4eFMrZm1DV3FBdXZ4VVZ3cXB0Vmo4c1hkVW9zYUIvSmJkM1N0QzdGMk9G?=
 =?utf-8?B?VnhDT3ZtOHlmeEVqdWVrRktuVHArQjEyYldUSFN0Q2FicHY4Sk05NWhRMWZ1?=
 =?utf-8?B?YjhDM2hlUmptTEtUOCtxT2FIa2hVOXkvbTNHTEg5b3dNS1orL0cwQk9hSVNv?=
 =?utf-8?B?d2F3MVJwb0p0T0pidzZ2ekhXdTBaVEZvVEV0S1l3Q21nK0duWjJnU2QrSWh5?=
 =?utf-8?B?MEtYRDZkSVBBeFBPM0VWOTZmeGxGdlVWSGtMUjRmSkNpQzJ6cmRiaG1FTDN6?=
 =?utf-8?B?c1VJRkw1SEdqQmhjT0g0L2JqNjB6ZGFua3V6K2pqZFVNeVdUMS9tTkd5c1FL?=
 =?utf-8?B?MzN4aXNKMnluSElDa043TDBHaFU0M0xwL1hmd0U1UThjZG10UXI0cmRmbFlM?=
 =?utf-8?B?cWYzbk1xSzJjWGEvT01TeGRFbGd2TDArcFVDc01DbDdJc056YnA2cWJDVG5J?=
 =?utf-8?B?OElVK2J3UXlCZVBYc1I5bjJtQjFCci9XbVVQUVNIUXB1YzVYaml5NnU5SFla?=
 =?utf-8?B?WUJuNHVyYkRuR2k3eko0U3lnMnJrdFRobWhkc2oxY1BWS0s3NzhaZEdmaXZR?=
 =?utf-8?B?ZXArRXBmd0JWN1Q5VFIrb1FIRExlZHMxSjFCdy9XNlphZ3JqcGdkZWFoMmhi?=
 =?utf-8?B?c2Z1RnZnS2JIVXQxMlpibGsyMXB3eGJ3a2tuT09hQXEyVkRZV0RRMHlJaElL?=
 =?utf-8?B?TjlJMmZZOU9DNEt0V1FaeGZDRDhRQVJGQUJkVmpOV3N6K2ROZ3luak9CTEZn?=
 =?utf-8?B?akEvVEpOYTV6UzF4NWZBNVp0WFVYWnMySWJVK2E0VGhZWHMxNnN1OWZsaWVY?=
 =?utf-8?B?SVA2bnNXNmtWYnBTSXlnbHpMNVVOT0cwdVphMHlhK1N3eE1meVhmekMxN3RY?=
 =?utf-8?B?RHdoUEJCUnFSYXc0RTRVR0RRbWx1QTlqUVRORXJDdkxrZDZIK2pIWmhnVWVI?=
 =?utf-8?B?WHErT2lRT3N5RDJ0SnhoOGVvNXpyaC8yenBsL016a3Nnc0lWazVDdkxRekpk?=
 =?utf-8?B?WHFtNCtIZXVaYml3Skw5c1NDbG5ZdVBOVWhacy9qZkNyWndvNDBEVUFJS0Vu?=
 =?utf-8?B?eS9qUlBkeVpvNGN4aUdwNHd5RzNyUE83UmdtVTdpcDYzU1VublRob3JHTUIy?=
 =?utf-8?B?U1hkc0VlckYzck1hVTYvODJNTjRXci9VNnE0TUhDUkdIemlIVWZNTkpVY2Mw?=
 =?utf-8?B?aEREZFJIcDlKeEo1aUo2T2JKZy9GajRsZytLMzNiZ2Z6L0hNQ0JPelBiR0xW?=
 =?utf-8?B?cVJ2NlBFVlI5UWNVZnBsbEdoUDV1UVR1cHl5OW0yK1BmQVB4SFpRTkxIMnlC?=
 =?utf-8?B?bkxENEozSnVMTmROUTNyUitXR0V3N1R5NWcrcDNnNDZiVjJOa0UxQjZnUTJi?=
 =?utf-8?B?WGVONW1KeW1rZy9xeENUbWRFOTF1NXJvd093Zm5hNVZYYVZXWGJMekRMQXhy?=
 =?utf-8?B?azBsS2EySC9GNkpDVDkyT0drSjlUbHdCclVQZzNteDJPYUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR03MB8697.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVdpNmIveUFpbEl3Zzk4Rk5hUThMTXRyZHoxTmhuMUFtNjJpMnBHTWg0QVhM?=
 =?utf-8?B?Q1ZhemhnRHVWaXRjSXE1T3NMbVQvclAvTEJUa0pXWHVCL09hcDNQWFZBTEly?=
 =?utf-8?B?WlZpVnVmTlNBUHQzWEpocG5kV2tZNithOExMVnJXb3NrcWxqa1U4NEN2RXRP?=
 =?utf-8?B?cXdadFJQc1VJc2QzOGs3cEFWalV5SmVJNHduWEhDUFZyVUNZUlRaQlVVSThR?=
 =?utf-8?B?ZUliamJtcjZKZitiV2REMmdOMFhFM3hGNGxNU01FNjZPclY1T2VBM3NDNXdG?=
 =?utf-8?B?ejRITDRnZG5vcytRUWNUSU12bjJoeGRCOGVBUnFYSGI4c3lIbjNPQjNWTGtI?=
 =?utf-8?B?cDdNTkcyd3RkZnQyZkJqcU1KQkFtWGg1RkUyRkpPSGFHb3JVMWxxTEI1WXMr?=
 =?utf-8?B?U2hjcGRTYmlDcHB5TkN0S1JER1JRTGpyeHMyQml5T1NIYlp1UFQ2NkE5OUw0?=
 =?utf-8?B?TURzQ1dvTmZOMzVLMkxWcENHdWQ3RFVMZkF6RVlkSUJ2OWpaNW9sRFRBKytS?=
 =?utf-8?B?ZXlZSDFvQlJ1Z1FraGY5a2lGK0FjSlIzWEc2OXZvd1lxTW80czFmWnZnL3ZW?=
 =?utf-8?B?TnR6dVROSEF1ZHQ2UnJmWTNCN2t4VGl5ZXVldWppc0VMejQ5QksxSURnajFI?=
 =?utf-8?B?bnZ2bEVvNEJiL3NNTzF3cnozVVNsOE5EbVJTZzJORkl0QTkwWmxqMEhNOGpZ?=
 =?utf-8?B?ajF0bXRERDZveDFOMzlRRERpbWNlMWxtSDJYbGlNbkhTTU1QRHlvS2lLY2lm?=
 =?utf-8?B?WGtjczl2bGJlMGF2NUx5UXhtY2Znb3dMbWoxQ1F0cFRlOHFqb21jaVJCL2Ev?=
 =?utf-8?B?bkJ3ZDdIMWtDTXRpQ1pPbWpuZU5CTllNMWM1NE1MNUowSW1takpPbXBPMnJB?=
 =?utf-8?B?YkN4cXl6NXF4b3RYTDJSVkxrSzA2NGlQa1Z0WDlveSs0eXhtU2RVazI0Tk5h?=
 =?utf-8?B?WVhIZnpOSnp6K2c5Y1hHZVJxQ01UWS9ySWhycENUamZBb1VsM2dQZUhiNFZP?=
 =?utf-8?B?N3M0SHZ2TlYzVWxKRG85Ukpwb2JHYXI0ajRkTHU1NExBM1ZaTzdtZ3MzWTJO?=
 =?utf-8?B?a3Zjbno4V1VSWUlOU29DMlRIcU1pY28yV1hQbTl3ZklNRHV3L1JtRDJvVWhN?=
 =?utf-8?B?OEhrMytENFRueDBXOW83bjd6a3hWVXFNdTQwRklBaXpoM2UrNzBqcmVQNmIr?=
 =?utf-8?B?NUhRcDhESlY2ZHpGcDZML0hNaGhMTWQ5R2hEUTFqMVFSV3pjYkd1TCtQRHNq?=
 =?utf-8?B?d0NQeXJ4SGJxNHduckV2VUhtaENKYTcvdnA0c1o0eUNzc3BxaURaTUoyc2Ny?=
 =?utf-8?B?bkd5NVl4STdzTnBNYzUwbHZ5dTg1aDBCNHZXUzJkeGtjUGQzbjZkR0NWbXhh?=
 =?utf-8?B?UGVnRGNVUTZXbERLNVFIM3RwNEhVck41MG8zbEt2NU0vbU8zbkRvRG9iUzJQ?=
 =?utf-8?B?RDBjS3N1ZUVLZTR0d0lleit6elVLQ1ZTZDRhMDQ2eVY3SXRaZlFqK3lTcW1H?=
 =?utf-8?B?NFp0R0tRb1MvempINEtqM25TK2hqaDhSdVVWU1M2NlBJRkpaaWg0M1lJMDN6?=
 =?utf-8?B?d1Ezdm10bUVIYkZTd1dUdGIvQTlUa1RQaVc0QnZ0cW1UNmhGRXo5ZjhrYW1r?=
 =?utf-8?B?MWpqVURTQ0ZydnE0cXBCNnRESEFxck4yK2RpRWhFU0tHM045S2xxUmJaWmE4?=
 =?utf-8?B?ZjVueVMxY0dlQStQclRLdUZNZHB1UE9RTE9jNXFSeEFUMENYUjRlcER0ODZk?=
 =?utf-8?B?TVRyaUdYQTlvSDJGN1Njd1pkSXhUc0l5RjBiU0FHSzJ3SzhtUUx3dlYyelky?=
 =?utf-8?B?TUxQc2wwdC9zNkhheGpldE82cERlUkU0aVRmTGVNQ2lpTzlQY2k2clpkemlo?=
 =?utf-8?B?VlptL3RpRjBuclF4azM3ZnNLdjdHcGJoWGcvZmZFaFZBSitBZE5vNHhndm9Y?=
 =?utf-8?B?Ti91Y0F6TE1yYVdBY3BwMjc2ZjhyY1RWbVlRd2ZvODB1RXRiSnc0N1VFZndG?=
 =?utf-8?B?RVY0TmtzeEJ3NXA5d09kV1Bzd0pKUDZTT3lvNFFtRWxPeGFlQXYwT1JicENP?=
 =?utf-8?B?a3Z6Q2QwTG1vZzdkOWVYcGlucUJTUE1iNDB1OWJiQk9rWWpab3hpOWNaM3BY?=
 =?utf-8?B?czBRRGhuaEF6dlFZTDA5dWpiUU0xSERGS3BWVnNleHJsR3NkekVlQTBaUlZl?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E55B730A703FF4469D57E5D248AF3E98@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e20ec427-8dc0-4420-5356-08dcc64286d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 02:47:01.1526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAfAyX6gB+fGYxIZFTvC+mhsaotW/HXBmuw2rYOOJO7zCOko2c+0Z45TmczKBKyDife2t5YHTiEPOTQRXui+2wPYR2tX9L269SYh7qLYcrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7719
X-MTK: N

SGkgU2ViYXN0aWFuLA0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCk9uIEZyaSwgMjAy
NC0wOC0yMyBhdCAxNDo0MCArMDIwMCwgU2ViYXN0aWFuIEZyaWNrZSB3cm90ZToNCj4gSGV5IFl1
bmZlaSwNCj4gDQo+IEkgd291bGQgcmVuYW1lIHRoZSB0aXRsZSB0byBzb21ldGhpbmcgbGlrZSB0
aGlzOg0KPiANCj4gbWVkaWE6IG1lZGlhdGVrOiB2Y29kZWM6IEdldCBTUkMgYnVmZmVyIGZyb20g
Yml0c3RyZWFtIGluc3RlYWQgb2YgTTJNDQo+IA0KPiBPbiAwNy4wOC4yMDI0IDE2OjI0LCBZdW5m
ZWkgRG9uZyB3cm90ZToNCj4gPiB2YjIgYnVmZmVyIG1heSBiZSByZW1vdmVkIGZyb20gcmVhZHkg
bGlzdCB3aGVuIGxhdCB0cnkgdG8gZ2V0IG5leHQNCj4gPiBzcmMgYnVmZmVyLCBsZWFkaW5nIHRv
IHZiMiBidWZmZXIgbm90IHRoZSBjdXJyZW50IG9uZS4gTmVlZCB0byBnZXQNCj4gPiB2YjIgYnVm
ZmVyIGFjY29yZGluZyB0byBjdXJyZW50IGlucHV0IG1lbW9yeSBpbmZvcm1hdGlvbi4NCj4gDQo+
IEFuZCBJIHdvdWxkIHJld3JpdGUgdGhlIGNvbW1pdCBsb2cgbGlrZSB0aGlzOg0KPiANCj4gR2V0
dGluZyB0aGUgU1JDIGJ1ZmZlciBmcm9tIHRoZSBNMk0gYnVmZmVyLXF1ZXVlIHJpc2tzIHBpY2tp
bmcgYQ0KPiBkaWZmZXJlbnQgU1JDIGJ1ZmZlciB0aGFuIHRoZSBvbmUgdXNlZCBmb3IgdGhlIGN1
cnJlbnQgZGVjb2RlDQo+IG9wZXJhdGlvbi4NCj4gR2V0IHRoZSBTUkMgYnVmZmVyIHRoZXJlZm9y
ZSBmcm9tIHRoZSBiaXRzdHJlYW0gZGF0YSwgd2hpY2ggd2FzIHNldA0KPiB1cA0KPiBlYXJsaWVy
IGR1cmluZyB0aGUgZGVjb2RlLg0KPiANCj4gRGlkIEkgZ2V0IHRoYXQgcmlnaHQ/DQo+IA0KPiBB
bHNvIGNvdWxkIHlvdSBleHBsYWluIHdoeSB0aGlzIGNoYW5nZSBpcyByZXF1aXJlZCBpbiB0aGlz
IHNlcmllcz8NCj4gDQpNdXN0IG1ha2Ugc3VyZSB0aGUgc3JjIGJ1ZmZlciBpcyByZW1vdmVkIGZy
b20gcmVhZHkgbGlzdCwgaW4gY2FzZSBvZg0KdGhlIGJ1ZmZlciBpcyByZW1vdmVkIHdoZW4gY29y
ZSB3b3JrIHRyeSB0byBzZXQgdGhlIGJ1ZmZlciBkb25lLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdW5m
ZWkgRG9uZw0KPiBSZWdhcmRzLA0KPiBTZWJhc3RpYW4gRnJpY2tlDQo+IA0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IFl1bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4g
LS0tDQo+ID4gLi4uL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19hdjFfcmVxX2xhdF9pZi5jICAg
ICB8IDEzICsrKysrKystLS0tLQ0KPiA+IC0NCj4gPiAuLi4vdmNvZGVjL2RlY29kZXIvdmRlYy92
ZGVjX3ZwOV9yZXFfbGF0X2lmLmMgICAgIHwgMTUgKysrKysrKy0tLS0tDQo+ID4gLS0tDQo+ID4g
MiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zj
b2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19hdjFfcmVxXw0KPiA+IGxhdF9pZi5jDQo+ID4gYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19hdjFf
cmVxXw0KPiA+IGxhdF9pZi5jDQo+ID4gaW5kZXggOTAyMTdjYzhlMjQyLi5hNzQ0NzQwYmE1ZjEg
MTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zj
b2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19hdjFfcmVxXw0KPiA+IGxhdF9pZi5jDQo+ID4gKysrDQo+
ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMv
dmRlY19hdjFfcmVxXw0KPiA+IGxhdF9pZi5jDQo+ID4gQEAgLTEwNjIsMTkgKzEwNjIsMjAgQEAg
c3RhdGljIGlubGluZSB2b2lkDQo+ID4gdmRlY19hdjFfc2xpY2VfdnNpX3RvX3JlbW90ZShzdHJ1
Y3QgdmRlY19hdjFfc2xpY2VfdnNpICp2c2ksDQo+ID4gDQo+ID4gc3RhdGljIGludCB2ZGVjX2F2
MV9zbGljZV9zZXR1cF9sYXRfZnJvbV9zcmNfYnVmKHN0cnVjdA0KPiA+IHZkZWNfYXYxX3NsaWNl
X2luc3RhbmNlICppbnN0YW5jZSwNCj4gPiAJCQkJCQkgc3RydWN0DQo+ID4gdmRlY19hdjFfc2xp
Y2VfdnNpICp2c2ksDQo+ID4gKwkJCQkJCSBzdHJ1Y3QgbXRrX3Zjb2RlY19tZW0NCj4gPiAqYnMs
DQo+ID4gCQkJCQkJIHN0cnVjdCB2ZGVjX2xhdF9idWYNCj4gPiAqbGF0X2J1ZikNCj4gPiB7DQo+
ID4gLQlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICpzcmM7DQo+ID4gKwlzdHJ1Y3QgbXRrX3ZpZGVv
X2RlY19idWYgKnNyY19idWZfaW5mbzsNCj4gPiAJc3RydWN0IHZiMl92NGwyX2J1ZmZlciAqZHN0
Ow0KPiA+IA0KPiA+IC0Jc3JjID0gdjRsMl9tMm1fbmV4dF9zcmNfYnVmKGluc3RhbmNlLT5jdHgt
Pm0ybV9jdHgpOw0KPiA+IC0JaWYgKCFzcmMpDQo+ID4gKwlzcmNfYnVmX2luZm8gPSBjb250YWlu
ZXJfb2YoYnMsIHN0cnVjdCBtdGtfdmlkZW9fZGVjX2J1ZiwNCj4gPiBic19idWZmZXIpOw0KPiA+
ICsJaWYgKCFzcmNfYnVmX2luZm8pDQo+ID4gCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiANCj4gPiAt
CWxhdF9idWYtPnZiMl92NGwyX3NyYyA9IHNyYzsNCj4gPiArCWxhdF9idWYtPnZiMl92NGwyX3Ny
YyA9ICZzcmNfYnVmX2luZm8tPm0ybV9idWYudmI7DQo+ID4gDQo+ID4gCWRzdCA9ICZsYXRfYnVm
LT50c19pbmZvOw0KPiA+IC0JdjRsMl9tMm1fYnVmX2NvcHlfbWV0YWRhdGEoc3JjLCBkc3QsIHRy
dWUpOw0KPiA+ICsJdjRsMl9tMm1fYnVmX2NvcHlfbWV0YWRhdGEobGF0X2J1Zi0+dmIyX3Y0bDJf
c3JjLCBkc3QsIHRydWUpOw0KPiA+IAl2c2ktPmZyYW1lLmN1cl90cyA9IGRzdC0+dmIyX2J1Zi50
aW1lc3RhbXA7DQo+ID4gDQo+ID4gCXJldHVybiAwOw0KPiA+IEBAIC0xNzI0LDcgKzE3MjUsNyBA
QCBzdGF0aWMgaW50IHZkZWNfYXYxX3NsaWNlX3NldHVwX2xhdChzdHJ1Y3QNCj4gPiB2ZGVjX2F2
MV9zbGljZV9pbnN0YW5jZSAqaW5zdGFuY2UsDQo+ID4gCXN0cnVjdCB2ZGVjX2F2MV9zbGljZV92
c2kgKnZzaSA9ICZwZmMtPnZzaTsNCj4gPiAJaW50IHJldDsNCj4gPiANCj4gPiAtCXJldCA9IHZk
ZWNfYXYxX3NsaWNlX3NldHVwX2xhdF9mcm9tX3NyY19idWYoaW5zdGFuY2UsIHZzaSwNCj4gPiBs
YXRfYnVmKTsNCj4gPiArCXJldCA9IHZkZWNfYXYxX3NsaWNlX3NldHVwX2xhdF9mcm9tX3NyY19i
dWYoaW5zdGFuY2UsIHZzaSwgYnMsDQo+ID4gbGF0X2J1Zik7DQo+ID4gCWlmIChyZXQpDQo+ID4g
CQlyZXR1cm4gcmV0Ow0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+ID4g
bGF0X2lmLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2Rl
Y29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiBpbmRleCAzZGNlYjY2
OGJhMWMuLmM1MGE0NTRhYjRmNyAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+ID4g
bGF0X2lmLmMNCj4gPiArKysNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsv
dmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiBAQCAt
NzEyLDE5ICs3MTIsMTggQEAgaW50DQo+ID4gdmRlY192cDlfc2xpY2Vfc2V0dXBfc2luZ2xlX2Zy
b21fc3JjX3RvX2RzdChzdHJ1Y3QNCj4gPiB2ZGVjX3ZwOV9zbGljZV9pbnN0YW5jZSAqDQo+ID4g
fQ0KPiA+IA0KPiA+IHN0YXRpYyBpbnQgdmRlY192cDlfc2xpY2Vfc2V0dXBfbGF0X2Zyb21fc3Jj
X2J1ZihzdHJ1Y3QNCj4gPiB2ZGVjX3ZwOV9zbGljZV9pbnN0YW5jZSAqaW5zdGFuY2UsDQo+ID4g
KwkJCQkJCSBzdHJ1Y3QgbXRrX3Zjb2RlY19tZW0NCj4gPiAqYnMsDQo+ID4gCQkJCQkJIHN0cnVj
dCB2ZGVjX2xhdF9idWYNCj4gPiAqbGF0X2J1ZikNCj4gPiB7DQo+ID4gLQlzdHJ1Y3QgdmIyX3Y0
bDJfYnVmZmVyICpzcmM7DQo+ID4gLQlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICpkc3Q7DQo+ID4g
KwlzdHJ1Y3QgbXRrX3ZpZGVvX2RlY19idWYgKnNyY19idWZfaW5mbzsNCj4gPiANCj4gPiAtCXNy
YyA9IHY0bDJfbTJtX25leHRfc3JjX2J1ZihpbnN0YW5jZS0+Y3R4LT5tMm1fY3R4KTsNCj4gPiAt
CWlmICghc3JjKQ0KPiA+ICsJc3JjX2J1Zl9pbmZvID0gY29udGFpbmVyX29mKGJzLCBzdHJ1Y3Qg
bXRrX3ZpZGVvX2RlY19idWYsDQo+ID4gYnNfYnVmZmVyKTsNCj4gPiArCWlmICghc3JjX2J1Zl9p
bmZvKQ0KPiA+IAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gDQo+ID4gLQlsYXRfYnVmLT52YjJfdjRs
Ml9zcmMgPSBzcmM7DQo+ID4gKwlsYXRfYnVmLT52YjJfdjRsMl9zcmMgPSAmc3JjX2J1Zl9pbmZv
LT5tMm1fYnVmLnZiOw0KPiA+IA0KPiA+IC0JZHN0ID0gJmxhdF9idWYtPnRzX2luZm87DQo+ID4g
LQl2NGwyX20ybV9idWZfY29weV9tZXRhZGF0YShzcmMsIGRzdCwgdHJ1ZSk7DQo+ID4gKwl2NGwy
X20ybV9idWZfY29weV9tZXRhZGF0YShsYXRfYnVmLT52YjJfdjRsMl9zcmMsICZsYXRfYnVmLQ0K
PiA+ID50c19pbmZvLCB0cnVlKTsNCj4gPiAJcmV0dXJuIDA7DQo+ID4gfQ0KPiA+IA0KPiA+IEBA
IC0xMTU0LDcgKzExNTMsNyBAQCBzdGF0aWMgaW50IHZkZWNfdnA5X3NsaWNlX3NldHVwX2xhdChz
dHJ1Y3QNCj4gPiB2ZGVjX3ZwOV9zbGljZV9pbnN0YW5jZSAqaW5zdGFuY2UsDQo+ID4gCXN0cnVj
dCB2ZGVjX3ZwOV9zbGljZV92c2kgKnZzaSA9ICZwZmMtPnZzaTsNCj4gPiAJaW50IHJldDsNCj4g
PiANCj4gPiAtCXJldCA9IHZkZWNfdnA5X3NsaWNlX3NldHVwX2xhdF9mcm9tX3NyY19idWYoaW5z
dGFuY2UsIGxhdF9idWYpOw0KPiA+ICsJcmV0ID0gdmRlY192cDlfc2xpY2Vfc2V0dXBfbGF0X2Zy
b21fc3JjX2J1ZihpbnN0YW5jZSwgYnMsDQo+ID4gbGF0X2J1Zik7DQo+ID4gCWlmIChyZXQpDQo+
ID4gCQlnb3RvIGVycjsNCj4gPiANCj4gPiAtLSANCj4gPiAyLjQ2LjANCj4gPiANCj4gPiANCj4g
DQo+IA0K

