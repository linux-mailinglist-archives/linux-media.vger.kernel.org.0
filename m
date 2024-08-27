Return-Path: <linux-media+bounces-16864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C0695FF6D
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 04:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E24D0B22000
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 02:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63C5175AB;
	Tue, 27 Aug 2024 02:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dJas09kU";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="QAZXTBnK"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2391759F;
	Tue, 27 Aug 2024 02:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724727405; cv=fail; b=uTcG/jNIG7F2tzp3v68nms24XFBvtr98tDaCU91Nf+TcN1GqXWG0T5JgtRc9FWFsjwFy/K1HWvPTVa9L9Rf9TJzxo8G+hDfDHMbeZJUSqwmiF1kyfvfZQtTaabOmG2EiTm8VVj9esa420/SwnzDoTcPDHNt2DqeYd6VWuFWAlGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724727405; c=relaxed/simple;
	bh=5FSJ9OlSS3IIs10Agj5Hcu84TIgt7N05Beb25x3Bnto=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KAxH4p1lDSRH7wjPYeRKtI86UjjNwM474uOqk0lU3MTHTL07T5YuKiEEK71nASm7qHG6OMUMhsMTPPC6PIAmsSAu7suCZApVS8tsGXIGu3cjIO3S2W+7198cSKYHtDUz2GKYFdIHQ0lSv1Njw1rtvYIo2hkHhahkxoXK0e8O88Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=dJas09kU; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=QAZXTBnK; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f88d0ece641f11ef8b96093e013ec31c-20240827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5FSJ9OlSS3IIs10Agj5Hcu84TIgt7N05Beb25x3Bnto=;
	b=dJas09kU7CHzQezPbn9sJWVoXmZo8o94wIuVcd/epjcxNbYQc+DV6x6BZtniwTH+gbcIwYMPVxcSQv8rR7MwfKrfT4dWX6557ZBpxvhmjPMOlNAUCCKYGClGbEB5rMYAfQqg4jSV6uwozRiTY8tJ96imAQyFDIHSf8ZE4b4pp0c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:af1b1bcd-fe30-410d-9cc2-a4fcaf0ef4b2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:117ed714-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f88d0ece641f11ef8b96093e013ec31c-20240827
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1699907590; Tue, 27 Aug 2024 10:56:34 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 27 Aug 2024 10:56:34 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 27 Aug 2024 10:56:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rde0GFWRYZAS/4AGUTgbTrOlJhZa+ybEkuD0iBLxK4eLfzkTqEoj3CHtSgvzhQAZS5XnU7NjSRqB5KY62yKlIHHD+Y4Q+lkTRrJxx6h6lufv7619A4vtjTm4xzxBoMSuBDl2L5CBxPhmhB+teBFrtH9CR0obrlVAkPtGLVQhQCShsAvwzmcP8gtj96FhVepWp7gkRaSqyB+GY+5lfXW+Ds3J0WqEMgMdJt03XI5fXOyafOWfJ6rk7b67RNQqbwIo3NcQ3oyVdFyTlqk6dLCoZ1j8BUreX95PSO2yo3z1KUghEXMD/hbREGSyGAYu46s9vkiGC4wQZ7EMZwFEfG/nZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FSJ9OlSS3IIs10Agj5Hcu84TIgt7N05Beb25x3Bnto=;
 b=flGvNWfFVD+bH7uglYGRGN41ZKJNjuw7U3O7OmnsmxkOJCwxBmK16dEpCzkAzV+wI+0cDQni9zp4S+osl2M5koC0s/GnjGG6o0KdmrQRDL/ulpv/zWlTo71pfuTlxCaQxs2Jf30b3f2THfvp3rRgu9pR9mHolbuy6mf1Ul3KD3UCmioQwsX10sz7aZUxzAotwEeNmlEDxysq6rVzBcve57Ojgr1tJfrrdIkXn3rU0vTeFzsndldGCMwHc63OISDpk052p299Qah2eCivSjvM4RGOHD+Pr/u+DdKIuRO+JtCDnCCo7cHUi0x6pIPmZLofAZgeVfHNkpPTHkjv4Ww/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FSJ9OlSS3IIs10Agj5Hcu84TIgt7N05Beb25x3Bnto=;
 b=QAZXTBnKEYdPEZzPZrBv/IaseT55W7qZVvL0YiXCynuvHQcLgvwJ65RPer4SBci0NqMglRr1s9aPkNh2YIoRtH/jsPDwhF5wyJxyOohyjXjk9qW1TGTWzmzlNDwMwUO8ZxYnGFNvczYDzCw/Is7ao75aWeS2FjEGVj8b3mb/OEU=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by SG2PR03MB6612.apcprd03.prod.outlook.com (2603:1096:4:1dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 02:56:31 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%2]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 02:56:31 +0000
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
Subject: Re: [PATCH v4 6/7] media: mediatek: vcodec: replace
 v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
Thread-Topic: [PATCH v4 6/7] media: mediatek: vcodec: replace
 v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
Thread-Index: AQHa6KNspxLDsSHTT0eIYonP+VQCzrI1D5MAgAV4lAA=
Date: Tue, 27 Aug 2024 02:56:31 +0000
Message-ID: <1e2735b83877c1ecd9c3eb1c9dc32408fc276544.camel@mediatek.com>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
	 <20240807082444.21280-7-yunfei.dong@mediatek.com>
	 <20240823152338.n7i7cnvolvke2hqp@basti-XPS-13-9310>
In-Reply-To: <20240823152338.n7i7cnvolvke2hqp@basti-XPS-13-9310>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|SG2PR03MB6612:EE_
x-ms-office365-filtering-correlation-id: f84fad1b-31c5-4219-ca4c-08dcc643dafa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bWFyYlgvYUs1emxxZEM0Zk5MOVBPVCtraldETG13aDJCSUEvVHVzU0tWM0tL?=
 =?utf-8?B?WG9Hd1dFaFR0RVNrS3NVNjlGRVhHclkxZVhpS002QnhWMXVzdkhaSHV1d2dv?=
 =?utf-8?B?S2Jna3kxZXpFamJnRUluL05QZnBldjltbDlFalRwTm9nOS9vMThXeFhMc3lG?=
 =?utf-8?B?SjdLUVU4L2laejB1TTJva2ZsV0hGTWFIU0JaZzllRjlCVGhCZ3dWQVlHTHlW?=
 =?utf-8?B?MXk1K3BLazFtZ3Uwd0pOT09Ta2QzSy95dmRpYzE0MHU4bmR1OHRHbU9TREdC?=
 =?utf-8?B?K2kxRDYyd0JHeUNpTkNYRmovWGRndFdDeWRPMCtrZlU3WFFnNzhyS2JOckZT?=
 =?utf-8?B?aWN2YUhMdzM4R0VPMENTWjVqcHFKcmFPUUpzYnM1MUp3dFhuOUkvZG81djQy?=
 =?utf-8?B?eXU0TWwrK0dOTEQ5NWV5bGRvanh6VWErc2RTakc5TWFLblRRZUMrVTg5TE5F?=
 =?utf-8?B?M0c4QzFwbGJGN0hHMGRMN0hVN1JUM2FiaXFaaU02STVpQkt5OThCRDA1Rjhj?=
 =?utf-8?B?OWQ1ck1DSGNGRkRENEc5TWFLZ2l6TW9FaCtUcDhCTGVNMjJmOXM3RFlIOXFp?=
 =?utf-8?B?VitPY0dsUDYra0hPVmkxYVRjb21hRjB3Y0ZJTVNmSGFBNjZVdDF1Q3BSbzUr?=
 =?utf-8?B?Z0RHRkRZazVIUGh6aXYrcUJhZWI2RXBEdGZJcVRQMlFxUmhvcXRabmJ2NCsv?=
 =?utf-8?B?ZzJYWFBudkhXYk4xZmdZd2E1dDZyc29KV25QVU9FQWZVNFk5Rm9qWGlycVJM?=
 =?utf-8?B?dEMwZFArZWMwMis0bnJTYWpMU0l2VUtCbVd1aHhsOGg0cmxpaW8zemI3Q0J6?=
 =?utf-8?B?Q3ZmUVNlZVhYTjBUY2U4ekN6N0xYMkNuMXZpdmJ6NHhIR0pydXJSYm16bFRy?=
 =?utf-8?B?bXVTZmYwZVl3ektGdEk5NEN6MjRLTGpxTlRNWHlSbmRzWllSSS8zTmZ5T3R3?=
 =?utf-8?B?UEZZS3pYSzJRdXVaakVEMnpGNW1HVlhaYmpiTnFicFRVZEpEVzl0TDl6NGFq?=
 =?utf-8?B?Nk5QQ01DbGlsU2ZuQlc0NGJGQmc3d0t1cEYzdVNRdXA2c1dpSVF4UHZNUnQx?=
 =?utf-8?B?eVBvbnluS0l5bng2bmY5bitDTzdFbkFYemFCblJCT3NvZTJHVjFkaG52Zm5r?=
 =?utf-8?B?TDMvV3lmUks5engwT1BuQ29JeFFWNmczcDdpN2ZSaEhEY2s0ZklZU0NwVGl3?=
 =?utf-8?B?SkQ5YlluYzJQcmxQdFEvZlJ6K3NxQTNMTWFINU52M2pPZ0ltM0FwN09XaUJI?=
 =?utf-8?B?RFZjM1B6QmVwb1U1Q0FZRDJNbyszRUN3WHg3ZjVReThKdzdsQkZyTDFQcEtB?=
 =?utf-8?B?ajZHSS9TU0txTEsyOXJrNTdibjVlQy81M0dEeFBESElVK0ZRdWVsTTVzZ3d6?=
 =?utf-8?B?cUFrd1drRFdrOUNMTmVxT0hVSUdlU1JiTU02UURoWXhMZUp5K1FjSUtCYnUz?=
 =?utf-8?B?OE96NGRhL0N4MGVLTC8wOW1OMGRFUThpMTF6OWVSNEcvM1FTVkIxVlc4L3N6?=
 =?utf-8?B?SldjSzJSN2NRSEZ0SnBxemZVdHFFb3N6djFqenRTei9QWC9UVFVvUFVpQWtD?=
 =?utf-8?B?SExrM3lGY1IyTGhVZ0ZKaTh2SDkxbkRKZUF1L3VIV2RZUVZrNDFWN1FUbFZT?=
 =?utf-8?B?MUVPK2d0azR0blBHeXpIZGFHV1pKSDNJbHUyWjhJVi9YZGpSR2FyMGtpUzBW?=
 =?utf-8?B?QVVsZi9CYnJocFdVR0VMR3lBYkVob2pMZXp6VThUcnhqOTZ6QnJ6ekk2UTdp?=
 =?utf-8?B?N2hza3hzanVGU2lUd0FvMGJMS0oxWU13TS9ZVnNXQUhyYzhUMkdzSVZiUFhs?=
 =?utf-8?B?UlhxOTdxRTJGdFJmSUxvMDZmTWQ5dkJ6cHBPa1BmRGNubHljL2t3QlBaNGE3?=
 =?utf-8?B?UTRTOUtNSUVKeTdQSnBEbDIwdTJmWnMzUEhydXlaUitnQmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR03MB8697.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVAraHlLbzdZT2tlY3dQVWtNRmRwblBNaTVpRzFBQ0Y0QTRHclRjdDVzSFR6?=
 =?utf-8?B?Um9NSTVDWlRxMVJDVWUxUEpBcFJocjVqTVdJL3BTeTRLZTd1SFpFYlV6RW5D?=
 =?utf-8?B?eWhWblROYVQvdkVCaDJ2Mzl0a1BlTmEySDVZWXRGMjlDYWlRaXljcmd3NTlu?=
 =?utf-8?B?SndCMlVTNVFHdXVEY2NmR1MvcUpvREYraVRNNGpxVDJ0cjJiZThkZVR1ZGw4?=
 =?utf-8?B?SFE1SmVBdy9zTjR4WnNtOFowQ1hrT1A4eEx4eStNbUJ5eWdGSlBVZGpoTEpu?=
 =?utf-8?B?TXVLMHFPcDFPYlBoV0s3aEN0TnlVaGZmN1hZVGJVOHgrZllzMHFCV3FvWHRL?=
 =?utf-8?B?dERzV01ubHNSb0orWTQ2Y1pwc0M1N3lYZkhvTjR0SkZGVmJCUXNGb3orUnFH?=
 =?utf-8?B?bU5UOXR0WW9PWmEzUFdTVTVQZFh6SFVEdk1VVUtFNGxOaC8vckgvQTl0OWZt?=
 =?utf-8?B?aDlrd3hPMTlVWWZ3a3VOMDdwWWNhRWRUbVBnZ1hiYkcyZllnN1JKTUtZeEFq?=
 =?utf-8?B?OXBna0JkRXRBS2JST0RzQm1xcW5SeFlHc3k0dVVYMXowNVFsUkdqS1pWNTJM?=
 =?utf-8?B?WkJ1cEd4TXBxMHppVHQxcCtpU3FnWU5vTEZDc0RyQ3ZmUktReGg0eHFDdUZH?=
 =?utf-8?B?clJobEhzZlMxMVZTR01QZTNDa3RMSkp5T1VEOHViZ3grWEhPeUUwVUZEM3ZW?=
 =?utf-8?B?Wnc5N1B4cGhYN3BNR3luV2dheTBjamxZWjlnMEFQMzhRK2FsZWVRTkk4Ni81?=
 =?utf-8?B?TnNpb2h3VnlMa1hIRHZUNjNUMVphNWkrTXI0T1p2SCtaNlpHNXl1ZmFRNXJM?=
 =?utf-8?B?YUJBakM1c2RSN0g4c1FNcnRWbk1VbXozZVJEeHZFRGZOUWcvYU1aaWRHSDNT?=
 =?utf-8?B?dlN0clZEMmtWaXRlK28vWDhWa21OZ2hzNVRXV29FNzNsbzJXWHRTYVpwblBs?=
 =?utf-8?B?cjlFM251Z1lLNjQ0c2JKMTF4d0lZTUM2V2FocjhGYUhDR3loNVMzQXpKaTV4?=
 =?utf-8?B?S1pLK21ZTW5iOW9lazdvVERQZ3JTUmFlOFFzdkRFcFArQTIzOXhrY1lnd3Fm?=
 =?utf-8?B?RjJGUUtIZ3g5aGlVK05CTUlGV05GczN1MisvRnpyRkRnUk14QURDT1NwU2Zy?=
 =?utf-8?B?MEp5bVhaR1pxZ3hpNDYvS1V0R1lUUEFTRE1Kd3Q5aU5RNkRsWWcwM1FqaFJO?=
 =?utf-8?B?WWNQZVRUZFdUaVNWTCtVRGdnSGpmbDZocFREWFRJM1hVTFFMTDNsLzdqZkVM?=
 =?utf-8?B?Z0k1TndpQ0dQdUlXN2Q2ekxGOXNEV0xYQzROSERnc1RPZkhmeTFVQm8vRjZu?=
 =?utf-8?B?NjhkVHFtRmdDMTFOdi9ZdlhabHF0YXlxWVU4N08vMFBFZjVaQzhZdWtCcHpV?=
 =?utf-8?B?elRJSURyaTVzZzJFd0NUOG9jeEt5bUhoZWNzQXFnZkJvMHhYMlZpckxSc1o2?=
 =?utf-8?B?NXV0MXZXczJLV3Z0d2dzY1ZoN3l3L3NYSk5kVGt1VXBNOGh2UVRwUVpWaXlw?=
 =?utf-8?B?TXRVYVJQTWJRSlpVU0xuMEt3L3BXTk4wa1dNcmZhenU5bkp0cFAvdHR4aXp5?=
 =?utf-8?B?QXJCRWgzTXE2Y3htM1U0WEpSUUpkQWFrNjMvK29LQTExWDhHNzNCMGRxaXJR?=
 =?utf-8?B?U3NKQjV2NXZNYTRNckhlcGJWcU81VDhWYWZKQlhzZEE0c0REdmRoU2diMEVX?=
 =?utf-8?B?T2owYXhpakt4QWFGMzdXaHQxSGNMRjUrQzJ3Nk9OVVhQSTlTdkRGbEI1ZFdP?=
 =?utf-8?B?QW1UVCsxeXlkbVNUSVl0cXd6RjBJWnl6ZHFIY3hRZ2lrQzZ6ekVnWDU1OE5Q?=
 =?utf-8?B?OEQ1b0xtb01Wa0VLdTVZQk1teU4zYXJzeDQzeFlEWE1HOVRXNnZCQ1VvZjJ1?=
 =?utf-8?B?V2pQbDQ1bzRBUGs0N1JZQ1lnSmlqSGwrTkdQdDNISjJxdExsaWVrSUgxM3pY?=
 =?utf-8?B?RzA3eCtScnFUOEM3VnU5UVRNdW1TSG1UM3N2Z2JRZ0RmNWN3UmtzVi9wUGIx?=
 =?utf-8?B?cVdvQ3ZpR2psOG16cTI1NjdiUTB1ODFydXdsbGp3VUg3NFdKUFg1WkR6bXlJ?=
 =?utf-8?B?TXc2eDZRckVtQU0wVytPNzVuWDBGTWNKNHZoR1VmWVovUGVGM3FibTB5cE11?=
 =?utf-8?B?NWhVZ29CaXZHZDFaalRaT3RPMzBvV2prWXJOaU16WENOL3A0YVllNVF3SzUr?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28BF0A32234D1C4CB2B2D92BBD8796E9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f84fad1b-31c5-4219-ca4c-08dcc643dafa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 02:56:31.8140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7UT2rEo9nZWea7mxZkeUbVbVMaVv261XHLyo+FRa8jorASiVEkWF3OFZBfObb6epYt3baDmNG65fOFb+s99d3YcWyyEcspBX4xm014q/NjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6612
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--29.903000-8.000000
X-TMASE-MatchedRID: C/snMIRQLS25lTsHJBA0keYAh37ZsBDC1kqyrcMalqUNcckEPxfz2D6h
	VXnKDh9XhX3gJCDg5mQ52jCcSJt6ULipXGIeTEfEEPf7TDUOGoosleOknNBI01SOymiJfTYXhXA
	r+h4GfTDOLrJvowarvkJeCpTVcKp109hRGROllGKLW79a3Y5EOkyQ5fRSh265kV75PbqT/hDVkZ
	Tte8pWmdoVNXUShZMG5hbLzcHLb1aOUv+G6OvDW6tWSWds/km2EsPHM6iHL3YY0A95tjAn+0tHo
	jrK13E4WZPmxXdhfmyQ9nDrlRXhzkCwax7Kf3TzoprTEHvewAAUkWvaqUqLH01KG1YrOQW/NrZP
	6OxTnLeyB4IqjtpgyE/yT3lf3YSU/DpEmuzAtvv7/v/5alNYesnlJe2gk8vIXCmcAC8DBrOTFEi
	sFTBWjJut8WHmUFOsAgQtztj6+CATRq2fvEtvbUhwlOfYeSqxfS0Ip2eEHnylPA9G9KhcvbLn+0
	Vm71Lcq7rFUcuGp/G8QIu4z6HhEH7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--29.903000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	363B2BB293367B686F8C35C83BEB4599A2AF9EAE7719B94343F97F4227B66DD52000:8
X-MTK: N

SGkgU2ViYXN0aWFuLA0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4NCk9uIEZyaSwgMjAy
NC0wOC0yMyBhdCAxNzoyMyArMDIwMCwgU2ViYXN0aWFuIEZyaWNrZSB3cm90ZToNCj4gSGV5IFl1
bmZlaSwNCj4gDQo+IE9uIDA3LjA4LjIwMjQgMTY6MjQsIFl1bmZlaSBEb25nIHdyb3RlOg0KPiA+
IFRoZXJlIGlzbid0IGxvY2sgdG8gcHJvdGVjdCBzb3VyY2UgYnVmZmVyIHdoZW4gZ2V0IG5leHQg
c3JjIGJ1ZmZlciwNCj4gPiBpZiB0aGUgc291cmNlIGJ1ZmZlciBpcyByZW1vdmVkIGZvciBzb21l
IHVua25vd24gcmVhc29uIGJlZm9yZSBsYXQNCj4gPiB3b3JrIHF1ZXVlIGV4ZWN1dGUgZG9uZSwg
d2lsbCBsZWFkIHRvIHJlbW92ZSBzb3VyY2UgYnVmZmVyIG9yDQo+ID4gYnVmZmVyDQo+ID4gZG9u
ZSBlcnJvci4NCj4gDQo+IFRoaXMgaXMgcmVhbGx5IGhhcmQgdG8gdW5kZXJzdGFuZCwgY2FuIHRy
eSB3b3JkaW5nIHRoaXMgYSBiaXQNCj4gY2xlYXJlcj8NCj4gU3R1ZmYgbGlrZTogaWYgdGhlIHNv
dXJjZSBidWZmZXIgaXMgcmVtb3ZlZCAuLi4gd2lsbCBsZWFkIHRvIHJlbW92ZQ0KPiBzb3VyY2Ug
YnVmZmVyLCBqdXN0IGxlYXZlcyBtZSBzY3JhdGNoaW5nIG15IGhlYWQuDQo+IEFuZCB0aGVyZSBp
cyBhIHNwaW5sb2NrIGluIHRoZSBtMm0gZnJhbWV3b3JrIGluIGB2NGwyX20ybV9uZXh0X2J1ZmAN
Cj4gc28gSQ0KPiBzdXBwb3NlIHlvdSBtZWFuIHNvbWV0aGluZyBlbHNlIHdoZW4geW91IHNheSB0
aGF0IHRoZXJlIGlzIG5vIGxvY2sgdG8NCj4gcHJvdGVjdCB0aGUgc291cmNlIGJ1ZmZlcj8NCj4g
DQo+IFlvdSBtaWdodCBub3Qga25vdyBhbGwgcmVhc29ucyBidXQgZm9yIHRoaXMgY29tbWl0IGRl
c2NyaXB0aW9uIHlvdQ0KPiBzaG91bGQgYXQgbGVhc3Qga25vdyBvbmUgcmVhc29uLiBQbGVhc2Ug
aGlnaGxpZ2h0IGEgY2FzZSBob3cgdGhpcyBjYW4NCj4gaGFwcGVuLCBzbyB0aGF0IHlvdSBjYW4g
anVzdGlmeSB0aGUgY2hhbmdlLg0KPiANCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5mZWkg
RG9uZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IC4uLi92Y29kZWMv
ZGVjb2Rlci9tdGtfdmNvZGVjX2RlY19zdGF0ZWxlc3MuYyB8IDMwICsrKysrKysrKysrKystLS0N
Cj4gPiAtLS0NCj4gPiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX3N0YQ0KPiA+IHRlbGVzcy5j
DQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210
a192Y29kZWNfZGVjX3N0YQ0KPiA+IHRlbGVzcy5jDQo+ID4gaW5kZXggOGFhMzc5ODcyZGRjLi4z
ZGJhMzU0OTAwMGEgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX3N0YQ0KPiA+IHRlbGVzcy5j
DQo+ID4gKysrDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9k
ZWNvZGVyL210a192Y29kZWNfZGVjX3N0YQ0KPiA+IHRlbGVzcy5jDQo+ID4gQEAgLTMyMSw2ICsz
MjEsNyBAQCBzdGF0aWMgdm9pZCBtdGtfdmRlY193b3JrZXIoc3RydWN0IHdvcmtfc3RydWN0DQo+
ID4gKndvcmspDQo+ID4gCQljb250YWluZXJfb2Yod29yaywgc3RydWN0IG10a192Y29kZWNfZGVj
X2N0eCwNCj4gPiBkZWNvZGVfd29yayk7DQo+ID4gCXN0cnVjdCBtdGtfdmNvZGVjX2RlY19kZXYg
KmRldiA9IGN0eC0+ZGV2Ow0KPiA+IAlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICp2YjJfdjRsMl9z
cmMgPSBjdHgtPmxhc3RfdmIyX3Y0bDJfc3JjOw0KPiA+ICsJc3RydWN0IHZiMl92NGwyX2J1ZmZl
ciAqdmIyX3Y0bDJfZHN0Ow0KPiA+IAlzdHJ1Y3QgdmIyX2J1ZmZlciAqdmIyX3NyYzsNCj4gPiAJ
c3RydWN0IG10a192Y29kZWNfbWVtICpic19zcmM7DQo+ID4gCXN0cnVjdCBtdGtfdmlkZW9fZGVj
X2J1ZiAqZGVjX2J1Zl9zcmM7DQo+ID4gQEAgLTMyOSw3ICszMzAsNyBAQCBzdGF0aWMgdm9pZCBt
dGtfdmRlY193b3JrZXIoc3RydWN0IHdvcmtfc3RydWN0DQo+ID4gKndvcmspDQo+ID4gCWJvb2wg
cmVzX2NoZyA9IGZhbHNlOw0KPiA+IAlpbnQgcmV0Ow0KPiA+IA0KPiA+IC0JdmIyX3Y0bDJfc3Jj
ID0gdmIyX3Y0bDJfc3JjID8gdmIyX3Y0bDJfc3JjIDoNCj4gPiB2NGwyX20ybV9uZXh0X3NyY19i
dWYoY3R4LT5tMm1fY3R4KTsNCj4gPiArCXZiMl92NGwyX3NyYyA9IHZiMl92NGwyX3NyYyA/IHZi
Ml92NGwyX3NyYyA6DQo+ID4gdjRsMl9tMm1fc3JjX2J1Zl9yZW1vdmUoY3R4LT5tMm1fY3R4KTsN
Cj4gPiAJaWYgKCF2YjJfdjRsMl9zcmMpIHsNCj4gPiAJCXY0bDJfbTJtX2pvYl9maW5pc2goZGV2
LT5tMm1fZGV2X2RlYywgY3R4LT5tMm1fY3R4KTsNCj4gPiAJCW10a192NGwyX3ZkZWNfZGJnKDEs
IGN0eCwgIlslZF0gbm8gYXZhaWxhYmxlIHNvdXJjZQ0KPiA+IGJ1ZmZlciIsIGN0eC0+aWQpOw0K
PiA+IEBAIC0zODEsMTcgKzM4MiwyOCBAQCBzdGF0aWMgdm9pZCBtdGtfdmRlY193b3JrZXIoc3Ry
dWN0DQo+ID4gd29ya19zdHJ1Y3QgKndvcmspDQo+ID4gCSAgICBjdHgtPmN1cnJlbnRfY29kZWMg
PT0gVjRMMl9QSVhfRk1UX1ZQOF9GUkFNRSkgew0KPiA+IAkJaWYgKHNyY19idWZfcmVxKQ0KPiA+
IAkJCXY0bDJfY3RybF9yZXF1ZXN0X2NvbXBsZXRlKHNyY19idWZfcmVxLCAmY3R4LQ0KPiA+ID5j
dHJsX2hkbCk7DQo+ID4gLQkJdjRsMl9tMm1fYnVmX2RvbmVfYW5kX2pvYl9maW5pc2goZGV2LT5t
Mm1fZGV2X2RlYywgY3R4LQ0KPiA+ID5tMm1fY3R4LCBzdGF0ZSk7DQo+ID4gLQl9IGVsc2Ugew0K
PiA+IC0JCWlmIChyZXQgIT0gLUVBR0FJTikgew0KPiA+IC0JCQl2NGwyX20ybV9zcmNfYnVmX3Jl
bW92ZShjdHgtPm0ybV9jdHgpOw0KPiA+IC0JCQljdHgtPmxhc3RfdmIyX3Y0bDJfc3JjID0gTlVM
TDsNCj4gPiAtCQl9IGVsc2Ugew0KPiA+IC0JCQljdHgtPmxhc3RfdmIyX3Y0bDJfc3JjID0gdmIy
X3Y0bDJfc3JjOw0KPiA+IC0JCX0NCj4gPiArCQl2YjJfdjRsMl9kc3QgPSB2NGwyX20ybV9kc3Rf
YnVmX3JlbW92ZShjdHgtPm0ybV9jdHgpOw0KPiA+ICsJCXY0bDJfbTJtX2J1Zl9kb25lKHZiMl92
NGwyX2RzdCwgc3RhdGUpOw0KPiA+ICsJCXY0bDJfbTJtX2J1Zl9kb25lKHZiMl92NGwyX3NyYywg
c3RhdGUpOw0KPiANCj4gVGhpcyBpcyBhbm90aGVyIGNhc2Ugd2hlcmUgeW91IGp1c3QgcmVtb3Zl
IGFnYWluIGNvbXBsZXRlbHkgd2hhdCB5b3UNCj4gaGF2ZSBhZGRlZCBpbiB0aGUgcHJldmlvdXMg
cGF0Y2guDQo+IA0KPiA+IA0KPiA+IAkJdjRsMl9tMm1fam9iX2ZpbmlzaChkZXYtPm0ybV9kZXZf
ZGVjLCBjdHgtPm0ybV9jdHgpOw0KPiA+ICsJCXJldHVybjsNCj4gPiAJfQ0KPiA+ICsNCj4gPiAr
CS8qIElmIGVhY2ggY29kZWMgcmV0dXJuIC1FQUdBSU4gdG8gZGVjb2RlIGFnYWluLCBuZWVkIHRv
IGJhY2t1cA0KPiA+IGN1cnJlbnQgc291cmNlDQo+ID4gKwkgKiBidWZmZXIsIHRoZW4gdGhlIGRy
aXZlciB3aWxsIGdldCB0aGlzIGJ1ZmZlciBuZXh0IHRpbWUuDQo+IA0KPiBJIHdvdWxkIHJld29y
ZCB0aGlzIGxpa2U6DQo+IA0KPiAJLyogU3RvcmUgdGhlIGN1cnJlbnQgc291cmNlIGJ1ZmZlciBm
b3IgdGhlIG5leHQgYXR0ZW1wdCB0bw0KPiBkZWNvZGUsDQo+ICAgICAqIGlmIHRoaXMgZGVjb2Rl
IHJldHVybmVkIC1FQUdBSU4gKi8NCj4gDQo+ID4gKwkgKg0KPiA+ICsJICogSWYgZWFjaCBjb2Rl
YyBkZWNvZGUgZXJyb3IsIG11c3QgdG8gc2V0IGJ1ZmZlciBkb25lIHdpdGgNCj4gPiBlcnJvciBz
dGF0dXMgZm9yDQo+ID4gKwkgKiB0aGlzIGJ1ZmZlciBoYXZlIGJlZW4gcmVtb3ZlZCBmcm9tIHJl
YWR5IGxpc3QuDQo+ID4gKwkgKi8NCj4gPiArCWN0eC0+bGFzdF92YjJfdjRsMl9zcmMgPSAocmV0
ICE9IC1FQUdBSU4pID8gTlVMTCA6DQo+ID4gdmIyX3Y0bDJfc3JjOw0KPiANCj4gT2theSBhbmQg
aGVyZSB5b3UgYWRkIHRoZSBzYW1lIHRoaW5nIGFnYWluIGFzIGluIHRoZSBwcmV2aW91cyBwYXRj
aA0KPiBidXQNCj4gZGlmZmVyZW50bHksIHRoaXMgY29sbGVjdGlvbiBvZiBjb21taXRzIGZlZWxz
IG1vcmUgYW5kIG1vcmUgdG8gbWUNCj4gbGlrZSBhDQo+IHdvcmsgaW4gcHJvZ3Jlc3MuIFBsZWFz
ZSBtYWtlIHN1cmUgaW4gdGhlIGZ1dHVyZSB0aGF0IGVhY2ggY29tbWl0DQo+IGRvZXMNCj4gb25l
IGpvYiBhbmQgZG9lcyBpdCBjb21wbGV0ZWx5Lg0KPiBJdCBpcyBub3Qgb25seSBjb25mdXNzaW5n
IGJ1dCBhbHNvIG1ha2VzIGl0IGhhcmQgdG8gcmVhZCB0aGUgY2hhbmdlcw0KPiBhcw0KPiB0aGUg
YmlnZ2VyIHBpY3R1cmUgaXMgbWlzc2luZyBpbiB0aGVzZSB0aW55IGNvbW1pdHMuDQo+IA0KPiBQ
bGVhc2UgdHJ5IHRvIGNvbWJpbmUgdGhlIHBhdGNoZXMgd2hlcmUgcG9zc2libGUuDQo+IA0KUGF0
aCA1LzcgaXMgdXNlZCB0byBzdG9yZSB0aGUgc291cmNlIGJ1ZmZlci4NCnBhdGggNi83IGlzIHVz
ZWQgdG8gaGFuZGxlIGRlY29kZXIgYWdhaW4gd2hlbiBkZWNvZGVyIGVycm9yLg0KDQpJIHdpbGwg
Y2hlY2sgd2hldGhlciBpdCdzIHBvc3NpYmxlIHRvIGNvbWJpbmUgcGF0Y2ggNSBhbmQgNiB0b2dl
dGhlci4NCg0KQmVzdCBSZWdhcmRzLA0KWXVuZmVpIERvbmcNCj4gUmVnYXJkcywNCj4gU2ViYXN0
aWFuIEZyaWNrZQ0KPiANCj4gPiArCWlmIChyZXQgJiYgcmV0ICE9IC1FQUdBSU4pIHsNCj4gPiAr
CQlpZiAoc3JjX2J1Zl9yZXEpDQo+ID4gKwkJCXY0bDJfY3RybF9yZXF1ZXN0X2NvbXBsZXRlKHNy
Y19idWZfcmVxLCAmY3R4LQ0KPiA+ID5jdHJsX2hkbCk7DQo+ID4gKwkJdjRsMl9tMm1fYnVmX2Rv
bmUodmIyX3Y0bDJfc3JjLCBzdGF0ZSk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJdjRsMl9tMm1f
am9iX2ZpbmlzaChkZXYtPm0ybV9kZXZfZGVjLCBjdHgtPm0ybV9jdHgpOw0KPiA+IH0NCj4gPiAN
Cj4gPiBzdGF0aWMgdm9pZCB2YjJvcHNfdmRlY19zdGF0ZWxlc3NfYnVmX3F1ZXVlKHN0cnVjdCB2
YjJfYnVmZmVyICp2YikNCj4gPiAtLSANCj4gPiAyLjQ2LjANCj4gPiANCj4gPiANCg==

