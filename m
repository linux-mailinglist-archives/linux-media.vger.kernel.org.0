Return-Path: <linux-media+bounces-20480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A6A9B428B
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 07:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0876B220B5
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 06:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C2B20126C;
	Tue, 29 Oct 2024 06:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="j+myhUpK";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="JH2l8R/s"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B52728E7;
	Tue, 29 Oct 2024 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730184458; cv=fail; b=fJm7U+pLi3OMyqiV2y/qpEC0JuCn9C1gC0hsjSFruEEwd7sGOBv7ep+3KOZLoF7SQvOS5EHYL0G2BaZKmd8BU9+wSDdIESfbF8CsTvAxvok571kN5Sw/Ee9jpx3Kpd6sdRrIl8qOyuzHpC+C84HRluyImQ0EMQSHbojtq3RH1XI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730184458; c=relaxed/simple;
	bh=hS8hOGKeW+QX/joyibO9fSvLdV6DIzbzroGkV+HPFT0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OAuhEZ+IkfLLXSFkQ7FMB2GK0c0f8FIWZQ63Nw2TUlC4h3n5xzQWEpBSZEUfJ60nAAWyAiDDLwxyXTzLs+5FvXHme8lZIi/VpFU63QOGMHJz/P+AWrkRMQAMyRX0aZ/tJ8cWwklFMSxrEhlRVYR2R2PWu0vND1ZYmcDIGKb/cc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=j+myhUpK; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=JH2l8R/s; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a97208a295c111efbd192953cf12861f-20241029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hS8hOGKeW+QX/joyibO9fSvLdV6DIzbzroGkV+HPFT0=;
	b=j+myhUpK67d7qC7DmX8HaCYst6iWJ6E7FKynGmvp81SR/9WoCofS5nguPPXMZxFHg0KwjEka+Jwwna/02rMpg6n4GN5wllB7LK0hsOm781WSlZnRO6Ft10t2ioCvNNP6bk10cJ1cxVh1QbJMOWsDXacQQ5jeiu5Eh4jGJxO01NY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:e5b87bcb-f0ee-4e20-a9a4-1d94845d74bd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:11195a48-ca13-40ea-8070-fa012edab362,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a97208a295c111efbd192953cf12861f-20241029
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1283151986; Tue, 29 Oct 2024 14:47:27 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 29 Oct 2024 14:47:25 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 29 Oct 2024 14:47:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYarIEgg7sa/PA30Tnfb8TCKcqgnZAglfYnWCg3S0TyaoRtukz9hEb1y1W2a1NljOEXEZKmSDacHXmLjBLJnvDA0V8fVCqiZJfrONBQnI7nMfCt+LB0cFy45uAkGQAwyYUQhcehWV/6xLGkufLPXzXsy9WI0PK83yxR+0bjChCItqLKJbbtxaM+QeKTJka/lkUjt/k7qpFPtKrM/pSvl1x135XoWr9wpXHiGASO72yqsCCChs+d+dzzyYdvBUvYjNcFOJJW1qXsr2x4BhdTOlnky4O4OoOUKqycW4o2iSZ0M4Wdyw6mq2APXgIywJaeNt3tDRm85SCc0/wWzrLUQSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hS8hOGKeW+QX/joyibO9fSvLdV6DIzbzroGkV+HPFT0=;
 b=t84zhhY0OhORR5si+P92x+/Go7zcK/wgcZHQa9OwLca2hZ/oVg5S5bI7bAnu+cSPb3T7l0WVGT2VnnF+3NcCWV2xpHIP6pjt7pLn6OCSOSYL4pt8rRFuVJsLUKBfwjcsTUaGTyx4JjhbCakqkzBrfaHJn00Wycgt7IWnBwq3ZpO4973wXQyR6J1ZndbOAcjHMwynDGXuHr02r07Ks7+5GgyLjuMZClbMr6VfYFZDAwV1QK+r9WX+DTPrWwYZZ2M2bi4T9QTJeXLY/cKVT2DpD/2toTDmxjLw+R9U3UtLZuzrulfrL9dJekJr3reDI98pTwUdBvfWqvxNwJ4ZMoIfAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hS8hOGKeW+QX/joyibO9fSvLdV6DIzbzroGkV+HPFT0=;
 b=JH2l8R/sojNej6gZ+vl5mmzXdIaAu1oPEL7lPjT1icBJ3oQPnPmfzmcUhmSALujAI2cHalw+QaDKUDygvr/na/hYVSL/03rw7rUfbmmorV3kLqwc5BIQi2LOM6xJrlmBaTk2sa9dU4MHMO6e+cpakdz9TPcs8CluSYMhb2JuC9Y=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7708.apcprd03.prod.outlook.com (2603:1096:400:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 06:47:21 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 06:47:21 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Topic: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarKdaFCA
Date: Tue, 29 Oct 2024 06:47:20 +0000
Message-ID: <0ddd9d1d6d0b00a240ed60d041c83b95896732c5.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7708:EE_
x-ms-office365-filtering-correlation-id: 9cb8ea50-6e56-4437-1fe5-08dcf7e589b7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MStHVjFRU2ZGZzdHNzNua1ZIYXpXQ3NZdmJuTTByWE9PaExhUjVSaXJzK0Nm?=
 =?utf-8?B?U1BZSXZDMjI0clNmRkVYS0tIVTF4UDZPdWxiMGNuUzJIYnRiNFRaZU9Id0xC?=
 =?utf-8?B?em84OTc0aThBd1I4UGsvNnR6YWNDenl3N21KKzhwMWdJZlNaTHBYcURoUHBO?=
 =?utf-8?B?V05MTlZsajE5dm81Qk54VGYyZmJhdUVCZ3ZHQVVWYVlBU1dCb1NWTk83MmlE?=
 =?utf-8?B?cG53OW9QRjZ5YnV0YkRNU3prdzI3N3hwdkp6OXY1MWR0aGl6YW5YMGY5dTRH?=
 =?utf-8?B?SHdPNmRpcW15V2pEeGdTeWpwN1U4cjJSUGFFblZYbzZKenJWMHdXRlU0bG4v?=
 =?utf-8?B?NmhNekhJMDR3dlM5MmVmS3VnbWQzeGpiYWJDQmhPMWsvdFV4eHRiYnY5UFJB?=
 =?utf-8?B?V01KQ1Zlc0UyRktFTStUOFllTzNnRWhGd1N3KzRqTE9RbHVKYVpxR2p0Z1Ro?=
 =?utf-8?B?d3Y1Y0JyUk00MDN3enpNbWFJYk13d2R6VEE2Z0NQS2xpMld6dHgwbzczK0ls?=
 =?utf-8?B?ZzZHRmpGM3ZmcERaTXRUbDJpeUhYUUdPMGlsNTJsRWJkdDVBRDF4MS9QczFD?=
 =?utf-8?B?VUpTeHYvKzRrV2s3eldzd0pnL1pMTHptTGZaV0VtNG1RdmZhR2RvTzYvZG1L?=
 =?utf-8?B?ZXJEVld3M2pnYy9QaC9XNU9rYUtDaGpBejRPc0dWd0g0R3k3aFo0L3VrcEoy?=
 =?utf-8?B?R3Jwd0g5T0ExNWpOdmFnNmtVYXNXVnNtQWlocGZ0bTdSamtaMDFTMElGeHFN?=
 =?utf-8?B?UkR4RDN6UzBvbzljWFcxVFV1MC93Q2lEL01Eb3dyNDFJR09zSVgzclF2QnR3?=
 =?utf-8?B?ZVI2aDZwU3p6YWJqbU9DZmhXcXhGTE45QXhNZ0svcUFKbnJRdU9rbU44WWNa?=
 =?utf-8?B?Q1hBc3NnTmtmZDkvQjVIS0NnYy9XMi9pOW9pcWtQOWtTUGI3czBkUlZvbWxa?=
 =?utf-8?B?S1htUWlJc09uVmF3WHIyZzV5ZDc3bVg0WnM0NFBaekVvc0VkUnh2a2Y3L29i?=
 =?utf-8?B?Q0FlS1kxeVJQQ2JJVkJPUzVjZWNFdUZ4bUhLekR6VjBFNDUyLzNUU1VycE5l?=
 =?utf-8?B?S3JEU1dqVWRTQzBzQkpYZEN5b0w4QUJrdnBuY1VYQnRoV215dTF1S3FBRzVY?=
 =?utf-8?B?NjVyOGFmMmZjeFJ5REhzUm1pQ3NuS29VTi9oZHNEN1gyTGdzbzRxMWtqQzFi?=
 =?utf-8?B?UWhwbUJCWVB2K1dKQzlpTVh4WUtXTEEyQ0FOeFdMUlM5ZVZPTForZkExamNJ?=
 =?utf-8?B?aHJlM2dpblFVRHRwd0R2TTcraW1IVWo0OFBsc0FMRW0yNWh4T05neTA0Z0lr?=
 =?utf-8?B?eGMxeXYyNis1dWJKc1I4a2pyWXBKNmxla293cmRwSXVPYURiUnk0endpa3p5?=
 =?utf-8?B?ODBrd3ByK3Q2V2xrQmVyc0x5TnFwS0JxM3F6NFRWNklINkdad3Exb1R1L3do?=
 =?utf-8?B?N3EybVl2am5Mb2xDTExpU2FGTk9uRHlTclhVN2pqVVFFQStkTnh5VW0vS0Y0?=
 =?utf-8?B?QkE3c2F4UUVmWncxZC9rRytvYmRSbjdNQ0Nrd0M1WGJ1V0dJNmFrQmk3Y1JH?=
 =?utf-8?B?bHArYit5Z3dqMzczY2d3YnNvRUo1V2xOdTJ6cUt6WE5pMnFoS0pGRHJYRlpZ?=
 =?utf-8?B?ZzYyaFphNVl5d1ZzS00wOXVnRUIwTzVaaVBBQjdiU2hQSFRqOUZiaXFYZE9q?=
 =?utf-8?B?NU5nOHV5MWhiWjdEeW9oNEdQaW1nd3lWclVOUXFaTWRZMWNrWkhnUE5vK0Mz?=
 =?utf-8?B?Y1dnZDB6dEdNY2NUYkdNMldsNFk3bzFQRk9ENHZzUGFiK29sdUNtRGdmMjho?=
 =?utf-8?Q?mfBHvtAMWziIoPieRUvqDLL8Gkl8AhfCblly8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVFNWEFSUGZjdEJSWWs3TmgvNnZ3N3lsbVNjQmwvVTREZXlMbzYrRzQxMEV3?=
 =?utf-8?B?ZnE0dk9WdHhVa0hyajlpQWFoUkhFOGpJdEVZVkg3Z2g0N2hDZEkyYmxkSVFo?=
 =?utf-8?B?NlAzelJwSzlLSmwyTjY4QkI2aU9kYmJqMXJsanFMT1ZySlIvV3lUUjFqSEJp?=
 =?utf-8?B?aEFmMUNoNzhVM3VHNzJyTDUwQi80OHVrT0lyKzB0WWowbFhSNGRkLzBCQjFG?=
 =?utf-8?B?ME1PMy93Nm9scWxTdUlFbjZ0ZUt6RnE4VWpXd3NlWVlINXM1aXF1UHdOeXRX?=
 =?utf-8?B?Y1FzSnFIQnZZRE1SR29sZUV3NGhEcjh5dDF3Vm1GbUx4VVFJRE9PNVdDVmhT?=
 =?utf-8?B?dlZDL3FRNmMrRkdCanBKd2J0ZGN0SDE2b0dTNDJhOGdUdWtpUUF6UEZWWjFU?=
 =?utf-8?B?eDFEZkJHMXFZZ2tnNzRQUzV1TGtOME96OFlWRlJWeXR5VWlOWmcrcUxMS0tj?=
 =?utf-8?B?M3ZRUVVaS2o0U0V6eGhRckwvVytzMDlqeGxNclhHc0ZtTmVDbFg3d0FSTm5a?=
 =?utf-8?B?QlJhTStpY3VOaUU5eHRQMHJuaEgyV0UwbXRTYjF1dldLK3pob0wvRFVLeWIz?=
 =?utf-8?B?Wk9idTVhS0V0cVk3L1d4TXF2dUlIaGsydHUxcW4vby8veW5XUWhqa0R5YU01?=
 =?utf-8?B?WnJmNE5tR3ZlNUo4dGQwYlZtVFdFWUlZTVBSNFVxUVJpTW5VTWRFZ2xqS01M?=
 =?utf-8?B?c1pLWTRIVXJzak51OS81eUVxZEtJODRmR283cFNrRVQ2U21hTFF2Zi9idERJ?=
 =?utf-8?B?eDlVTU5OcXZXWDdpVWYyU2JKbldwb09mQXJVNk1vQ2E5cFFFMWFaK2ttZDR6?=
 =?utf-8?B?OVZwRU9NRi9lM1AxeklBL05iYVVwYUVvWFdyQ0xlbkFoRGozSElNelcyWXFK?=
 =?utf-8?B?R0R1V0NqQ3E0c2MyeDhQQkJLM1MvSkdTMU05V0x4QjI3Tm5lRFJPa1pQZFZn?=
 =?utf-8?B?d1kzQlRlc2hTMEhqQUNheUZPUmhxdWFSK2NNUTQ0bHVpcmtHL1k3VEMvdWhQ?=
 =?utf-8?B?TzRBS3BXNWJqbkg3QmdIbm9NUS90cFQrS2RSVXVOUytMYXhjVEo1bjBnYlU4?=
 =?utf-8?B?eGFkU3hkQ0U4YVppa1lyU0NHRjJGU1BKWUR6WWkxaW5OQ2NqQklRd01rODJ6?=
 =?utf-8?B?SlVSakRWUnFENXJ3THpuU0pXQWswdTVERG1VVFVhc0JLVWpDRlp1MTNFVmpD?=
 =?utf-8?B?M1V1WHhicmNqNUJJYUNyZ2NwRDA0UFBQTjRUd0QvelFrSUxNMU5iSzZLcVhy?=
 =?utf-8?B?cXZnYzlIZi9KWERNQlFINTBBb1dnSzZuaXNsNHd0L3dZcStoaXNqYVB6bnpD?=
 =?utf-8?B?a3BnVm5pdkFydXJqdjZDU0F0bVlxTnN3cnRHNmY4bTlRbzhwa0IrNkNjYUg2?=
 =?utf-8?B?eU8yaVBjK25iTHhJQW1zRmxFM0dBS2pHbi9VekVoemxUZi8rYW9jSGZIUnVr?=
 =?utf-8?B?b0diWVM0M1hWbEt3U0JVY3dKcUpJRE9UZnlKUHlqV1ZUejNEMGtDVnhjNHdp?=
 =?utf-8?B?TGxORGlCL2c4VGc2clR5bHY3UkVNV20wcXlsV2ZwN20xSjVxRHZhNXQvbCtI?=
 =?utf-8?B?TmcvOHZJSVd0ZUR1czl3NE9yajFmT0JFZzNqVHoyZE9OOXdPMm9YVEwwTUk0?=
 =?utf-8?B?eXh1TW1VUTltYnNQamsxVkRvZTF2OXk1bTZVcDNhTGJpOU1PbHhpS0hpekJT?=
 =?utf-8?B?VkgyVFdINVI2RUZkMytidTNRZURDWHNudXZ0SnFtZ25PbGlWZTdOYisxY0sz?=
 =?utf-8?B?ZlZ3NmcxWEgxWVJzZ0cvQkdXTnplN2JQd1JMMnh3eWNvckJjVmx0WjQ0Smxy?=
 =?utf-8?B?c3NTS1p1SzVmdllVZTJpYkdvb2RhYVJ4NlF2bjkrdWpnNTh3SFRTa2JXS3Jz?=
 =?utf-8?B?UElvMGdPYU5EOVBxS3VJem4zVjVtR2Zvb21GNXlPclZLaXRZL3hyM3cxeE0z?=
 =?utf-8?B?OW5BOUtnU0dpZ1UvUVdFMnpQa2hYc3RtZUlCWWxNaUFvZ3VDd0NqcjAwdms3?=
 =?utf-8?B?ZExDRzVFS2RHRlo2Y2tlQkEzRlJIYkdYNHVCemxSeXBZZEQ2ZVgrL045Ujgy?=
 =?utf-8?B?WVpyOWRNUjZ6dU9LSDN1cTNrS3VVRDVySThUTktUUmo2NzdSbFN3NHpGV1Vh?=
 =?utf-8?Q?24XidAkUs1/fBIKrO+6wuuv7A?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6B2F57698FD3F479E37E56546B9F016@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb8ea50-6e56-4437-1fe5-08dcf7e589b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 06:47:20.5495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WH3PfGJA6IYH/LPBaj+zRhgcpPOCW/mafxSUmqLqZgTxAd4ofAO/oF5N8pooVNwoWg9XxmJNmPJ5PriwyuAZEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7708
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--16.151200-8.000000
X-TMASE-MatchedRID: L8tZF6zWW2pm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYHB1
	e9+YlER9xxL5hQ2RIPjz6iVSaWDoXX45uBZmw209z5rIW0RbS5jXAvRa0tfJGsNNczdXNJoi30o
	DEEVA5TDfs+BXaZLm6jXSjpYnAQeVEd0YyW6tLblc/msUC5wFQShRWQHuJ8meW4tWRQ083DRIgy
	zS2gc0EH/XewXRieW3J4qF8DL/oPYtVrIvuTuiXIDTBcxjSxJQNpy6NoTePCGbKItl61J/yfmS+
	aPr0Ve8oTCA5Efyn8CNo+PRbWqfRDsAVzN+Ov/ss8SZljcQyHUkoeluxp3878NZfETpRvSnE6XL
	ZfuaXPBbu/rPNeGC3A==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.151200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	AC756A45F2916F0EB8EA63AA9521F5E0A5495F2ED1BD7A556DEE8E1521FAC3D62000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSB0b3AgbWVkaWEgZGV2aWNlIGRy
aXZlciBmb3IgdGhlIE1lZGlhVGVrIElTUDdYIENBTVNZUy4NCj4gVGhlIGRyaXZlciBtYWludGFp
bnMgdGhlIGNhbWVyYSBzeXN0ZW0sIGluY2x1ZGluZyBzdWItZGV2aWNlIG1hbmFnZW1lbnQsDQo+
IERNQSBvcGVyYXRpb25zLCBhbmQgaW50ZWdyYXRpb24gd2l0aCB0aGUgVjRMMiBmcmFtZXdvcmsu
IEl0IGhhbmRsZXMNCj4gcmVxdWVzdCBzdHJlYW0gZGF0YSwgYnVmZmVyIG1hbmFnZW1lbnQsIGFu
ZCBNZWRpYVRlay1zcGVjaWZpYyBmZWF0dXJlcywNCj4gYW5kIHBpcGVsaW5lIG1hbmFnZW1lbnQs
IHN0cmVhbWluZyBjb250cm9sLCBlcnJvciBoYW5kbGluZyBtZWNoYW5pc20uDQo+IEFkZGl0aW9u
YWxseSwgaXQgYWdncmVnYXRlcyBzdWItZHJpdmVycyBmb3IgdGhlIGNhbWVyYSBpbnRlcmZhY2Us
IHJhdw0KPiBhbmQgeXV2IHBpcGVsaW5lcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lh
bmcgWWFuZyA8U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0K
DQo+ICt2b2lkIG10a19jYW1fYnVmX3RyeV9xdWV1ZShzdHJ1Y3QgbXRrX2NhbV9jdHggKmN0eCkN
Cj4gK3sNCj4gKwlzdHJ1Y3QgbXRrX2NhbV9kZXZpY2UgKmNhbTsNCj4gKwlzdHJ1Y3QgbXRrX2Nh
bV9idWZmZXIgKmJ1ZiwgKmJ1Zl9wcmV2Ow0KPiArCXN0cnVjdCBtdGtjYW1faXBpX2V2ZW50IGV2
ZW50Ow0KPiArCXN0cnVjdCBtdGtjYW1faXBpX3Nlc3Npb25fY29va2llICpzZXNzaW9uID0gJmV2
ZW50LmNvb2tpZTsNCj4gKwlzdHJ1Y3QgbXRrY2FtX2lwaV9mcmFtZV9pbmZvICpmcmFtZV9pbmZv
ID0gJmV2ZW50LmZyYW1lX2RhdGE7DQo+ICsJc3RydWN0IG10a2NhbV9pcGlfZnJhbWVfcGFyYW0g
KmZyYW1lX3BhcmFtOw0KPiArCXN0cnVjdCBtdGtjYW1faXBpX2ZyYW1lX3BhcmFtICpmcmFtZV9k
YXRhOw0KPiArCXN0cnVjdCBtdGtfY2FtX3dvcmtpbmdfYnVmX2VudHJ5ICpidWZfZW50cnk7DQo+
ICsJc3RydWN0IGxpc3RfaGVhZCBlcXVldWVfbGlzdDsNCj4gKwl1bnNpZ25lZCBpbnQgcHJvY2Vz
c2luZ19jbnQsIGVucXVlX2NudDsNCj4gKw0KPiArCWNhbSA9IGN0eC0+Y2FtOw0KPiArCWlmICgh
Y2FtLT5zdHJlYW1pbmdfY3R4KSB7DQo+ICsJCWRldl9pbmZvKGNhbS0+ZGV2LCAic3RyZWFtcyBh
cmUgb2ZmXG4iKTsNCj4gKwkJcmV0dXJuOw0KPiArCX0NCj4gKw0KPiArCUlOSVRfTElTVF9IRUFE
KCZlcXVldWVfbGlzdCk7DQo+ICsNCj4gKwlzcGluX2xvY2soJmNhbS0+ZG1hX3Byb2Nlc3Npbmdf
bG9jayk7DQo+ICsJcHJvY2Vzc2luZ19jbnQgPSBjYW0tPmRtYV9wcm9jZXNzaW5nX2NvdW50Ow0K
PiArCXNwaW5fdW5sb2NrKCZjYW0tPmRtYV9wcm9jZXNzaW5nX2xvY2spOw0KPiArDQo+ICsJZW5x
dWVfY250ID0gMDsNCj4gKwlzcGluX2xvY2soJmNhbS0+ZG1hX3BlbmRpbmdfbG9jayk7DQo+ICsJ
bGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGJ1ZiwgYnVmX3ByZXYsICZjYW0tPmRtYV9wZW5kaW5n
LCBsaXN0KSB7DQo+ICsJCWlmIChwcm9jZXNzaW5nX2NudCArIGVucXVlX2NudCA+PSBNVEtfQ0FN
X01BWF9QUk9DRVNTSU5HX0JVRlMpIHsNCj4gKwkJCWRldl9kYmcoY2FtLT5kZXYsDQo+ICsJCQkJ
InByb2Nlc3NpbmcgYnVmcyBhcmUgZnVsbCwgYnVmIGNudCglZClcbiIsDQo+ICsJCQkJcHJvY2Vz
c2luZ19jbnQpOw0KPiArCQkJYnJlYWs7DQo+ICsJCX0NCj4gKwkJZGV2X2RiZyhjYW0tPmRldiwg
IiVzIGJ1ZiBjbnQoJWQpXG4iLA0KPiArCQkJX19mdW5jX18sIHByb2Nlc3NpbmdfY250ICsgZW5x
dWVfY250KTsNCj4gKw0KPiArCQllbnF1ZV9jbnQrKzsNCj4gKwkJbGlzdF9kZWwoJmJ1Zi0+bGlz
dCk7DQo+ICsJCWxpc3RfYWRkX3RhaWwoJmJ1Zi0+bGlzdCwgJmVxdWV1ZV9saXN0KTsNCj4gKwl9
DQo+ICsJc3Bpbl91bmxvY2soJmNhbS0+ZG1hX3BlbmRpbmdfbG9jayk7DQo+ICsNCj4gKwlpZiAo
IWVucXVlX2NudCkNCj4gKwkJcmV0dXJuOw0KPiArDQo+ICsJZnJhbWVfcGFyYW0gPSBremFsbG9j
KHNpemVvZigqZnJhbWVfcGFyYW0pLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIWZyYW1lX3BhcmFt
KQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoYnVmLCBi
dWZfcHJldiwgJmVxdWV1ZV9saXN0LCBsaXN0KSB7DQo+ICsJCWlmIChidWYtPnN0YXRlLmVzdGF0
ZSA9PSBFX0JVRl9TVEFURV9DT01QT1NFRCkNCg0KVGhpcyB3b3VsZCBuZXZlciBoYXBwZW5lZC4N
CmJ1ZiBpbiBlcXVldWVfbGlzdCBpcyBtb3ZlZCBmcm9tIGNhbS0+ZG1hX3BlbmRpbmcgYW5kIGJ1
ZidzIHN0YXRlIGlzIEVfQlVGX1NUQVRFX1FVRVVFRC4NClNvIGRyb3AgdGhpcyBjaGVja2luZy4N
Cg0KUmVnYXJkcywNCkNLDQoNCj4gKwkJCWNvbnRpbnVlOw0KPiArDQo+ICsJCW1lbXNldCgmZXZl
bnQsIDAsIHNpemVvZihldmVudCkpOw0KPiArCQlldmVudC5jbWRfaWQgPSBDQU1fQ01EX0ZSQU1F
Ow0KPiArCQlzZXNzaW9uLT5zZXNzaW9uX2lkID0gY3R4LT5zdHJlYW1faWQ7DQo+ICsJCS8qIHBy
ZXBhcmUgd29ya2luZyBidWZmZXIgKi8NCj4gKwkJYnVmX2VudHJ5ID0gbXRrX2NhbV93b3JraW5n
X2J1Zl9nZXQoY3R4KTsNCj4gKwkJaWYgKCFidWZfZW50cnkpIHsNCj4gKwkJCWRldl9pbmZvKGNh
bS0+ZGV2LA0KPiArCQkJCSAiJXM6IE5vIENRIGJ1ZiBhdmFpbGFibGxlOiBlbnF1ZXVlZF9mcmFt
ZV9zZXFfbm86JWRcbiIsDQo+ICsJCQkJIF9fZnVuY19fLCBhdG9taWNfcmVhZCgmY3R4LT5lbnF1
ZXVlZF9mcmFtZV9zZXFfbm8pKTsNCj4gKwkJCVdBUk5fT04oMSk7DQo+ICsJCQlnb3RvIEVYSVQ7
DQo+ICsJCX0NCj4gKw0KPiArCQlzcGluX2xvY2soJmN0eC0+dXNpbmdfYnVmZmVyX2xpc3QubG9j
ayk7DQo+ICsJCWxpc3RfYWRkX3RhaWwoJmJ1Zl9lbnRyeS0+bGlzdF9lbnRyeSwgJmN0eC0+dXNp
bmdfYnVmZmVyX2xpc3QubGlzdCk7DQo+ICsJCWN0eC0+dXNpbmdfYnVmZmVyX2xpc3QuY250Kys7
DQo+ICsJCXNwaW5fdW5sb2NrKCZjdHgtPnVzaW5nX2J1ZmZlcl9saXN0LmxvY2spOw0KPiArDQo+
ICsJCXNwaW5fbG9jaygmY2FtLT5kbWFfcHJvY2Vzc2luZ19sb2NrKTsNCj4gKwkJbGlzdF9kZWwo
JmJ1Zi0+bGlzdCk7DQo+ICsJCWxpc3RfYWRkX3RhaWwoJmJ1Zi0+bGlzdCwgJmNhbS0+ZG1hX3By
b2Nlc3NpbmcpOw0KPiArCQljYW0tPmRtYV9wcm9jZXNzaW5nX2NvdW50Kys7DQo+ICsJCXNwaW5f
dW5sb2NrKCZjYW0tPmRtYV9wcm9jZXNzaW5nX2xvY2spOw0KPiArDQo+ICsJCS8qIFByZXBhcmUg
cnAgbWVzc2FnZSAqLw0KPiArCQlmcmFtZV9pbmZvLT5jdXJfbXNnYnVmX29mZnNldCA9DQo+ICsJ
CQlidWZfZW50cnktPm1zZ19idWZmZXIudmEgLQ0KPiArCQkJY2FtLT5jdHhzW3Nlc3Npb24tPnNl
c3Npb25faWRdLmJ1Zl9wb29sLm1zZ19idWZfdmE7DQo+ICsJCWZyYW1lX2luZm8tPmN1cl9tc2di
dWZfc2l6ZSA9IGJ1Zl9lbnRyeS0+bXNnX2J1ZmZlci5zaXplOw0KPiArCQlmcmFtZV9kYXRhID0g
KHN0cnVjdCBtdGtjYW1faXBpX2ZyYW1lX3BhcmFtICopYnVmX2VudHJ5LT5tc2dfYnVmZmVyLnZh
Ow0KPiArCQlzZXNzaW9uLT5mcmFtZV9ubyA9IGF0b21pY19pbmNfcmV0dXJuKCZjdHgtPmVucXVl
dWVkX2ZyYW1lX3NlcV9ubyk7DQo+ICsNCj4gKwkJaWYgKG10a19jYW1fYnVmX2NvbmZpZyhjYW0s
IGZyYW1lX3BhcmFtLCBidWYpKSB7DQo+ICsJCQlkZXZfZXJyKGNhbS0+ZGV2LCAiJXM6IEJ1ZmZl
ciBjb25maWcgZmFpbGVkXG4iLAlfX2Z1bmNfXyk7DQo+ICsJCQljb250aW51ZTsNCj4gKwkJfQ0K
PiArCQltZW1jcHkoZnJhbWVfZGF0YSwgZnJhbWVfcGFyYW0sIHNpemVvZigqZnJhbWVfcGFyYW0p
KTsNCj4gKwkJZnJhbWVfZGF0YS0+Y3VyX3dvcmtidWZfb2Zmc2V0ID0NCj4gKwkJCWJ1Zl9lbnRy
eS0+YnVmZmVyLmlvdmEgLQ0KPiArCQkJY2FtLT5jdHhzW3Nlc3Npb24tPnNlc3Npb25faWRdLmJ1
Zl9wb29sLndvcmtpbmdfYnVmX2lvdmE7DQo+ICsJCWZyYW1lX2RhdGEtPmN1cl93b3JrYnVmX3Np
emUgPSBidWZfZW50cnktPmJ1ZmZlci5zaXplOw0KPiArDQo+ICsJCWlmIChjdHgtPnBpcGUtPnJl
c19jb25maWcuYmluX2xpbWl0ID09IEJJTl9BVVRPKQ0KPiArCQkJZnJhbWVfZGF0YS0+cmF3X3Bh
cmFtLmJpbl9mbGFnID0gY3R4LT5waXBlLT5yZXNfY29uZmlnLmJpbl9lbmFibGU7DQo+ICsJCWVs
c2UNCj4gKwkJCWZyYW1lX2RhdGEtPnJhd19wYXJhbS5iaW5fZmxhZyA9IGN0eC0+cGlwZS0+cmVz
X2NvbmZpZy5iaW5fbGltaXQ7DQo+ICsNCj4gKwkJc2NwX2lwaV9zZW5kKGNhbS0+c2NwLCBTQ1Bf
SVBJX0lTUF9GUkFNRSwgJmV2ZW50LA0KPiArCQkJICAgICBzaXplb2YoZXZlbnQpLCBNVEtfQ0FN
X0lQSV9TRU5EX1RJTUVPVVQpOw0KPiArCQlidWYtPnN0YXRlLmVzdGF0ZSA9IEVfQlVGX1NUQVRF
X0NPTVBPU0VEOw0KPiArCX0NCj4gK0VYSVQ6DQo+ICsJa2ZyZWUoZnJhbWVfcGFyYW0pOw0KPiAr
fQ0KPiArDQoNCg==

