Return-Path: <linux-media+bounces-36080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9010AEB3CC
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 12:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D08E1C22BA3
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 10:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7F42980CD;
	Fri, 27 Jun 2025 10:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YXg35TmW";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="bAgrfRmO"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E929293B55;
	Fri, 27 Jun 2025 10:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751018854; cv=fail; b=h+HN5zEiOwpAU8mflndr4DdBOKEFXU7/WhUFot0gb6Uh7xfJ6mIlyMY9GqpXAqhE+UkgE+UH9H3iEHBESlpTDNdGimIhB3HR6IWPvLm0klN53WywaFEtobMyBb3vxMz7O9V7MRCR5O0CycLoOIacejGN1Te4XAXuEYD5LC6pMcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751018854; c=relaxed/simple;
	bh=pU+1BhLn+AvKqWXizQhMvrDeT+Gd6pHUNONTavw2Tek=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HGfRsn1tnF+uKBO0NwHQIYhM/HElmfiefZFuyJGyUHan+fnLnvdOehyaZJsOLXx/33M2Pg7Pyf3GnxJlPaVyF8PaEVoxxg6Xfmb7ArVXKlAZIJvMBqjygAHkDX73QpGEyUYRvvxwQFnxqWbniCbRFN6DkkGzqHpq92hRryl16gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YXg35TmW; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=bAgrfRmO; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8480e500533e11f0b1510d84776b8c0b-20250627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=pU+1BhLn+AvKqWXizQhMvrDeT+Gd6pHUNONTavw2Tek=;
	b=YXg35TmWmEpqqaSO1/RVsoX/wJw2vqakDK6qDH2XLf0SiY5NoBbKlZLtPvpFxL0eUvdtjZB+V7cJO4obli2jiTm7yJZF012WlxNy6LCTHDAKDSKEyMrw4TDLjSvOk7A0BaQy17XRmABTHcJ65S7lnJHiRtpYvKkAY09JKwEkYJQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:f76aa62e-f27c-473c-87cc-bdbb98f21f6f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:c861a114-6a0e-4a76-950f-481909c914a4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8480e500533e11f0b1510d84776b8c0b-20250627
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 37222864; Fri, 27 Jun 2025 18:07:22 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 27 Jun 2025 18:07:19 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 27 Jun 2025 18:07:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9RaoU/w1OFYS7AOSKFhfGGZ34ZdW3dIwNFpj2x37r2WZMS+yBctGAXjZitD/1/imTlQHzHWS/PFc9Js5vfXtgn0UCZr8NZ7QsZx3uT/iBg5K7cFB9tsAZtKBqxXH1nofuQEmK7VCJvm3vuz1j7p49mSywgxZsDGNevLNQKps6xGXFlkatmkinH2s5Uqk7IxH2ezDZypuMgg4oRyEHuK2bIMByeCpIuZDB01E/O0ZbzkIR2brGco+qw1MYNP+g59Ssjw9lnfQcj0nLU6oXJHTt8FxXv4v9yeBYtJUdpcnSlPp2LB9FWUWaG/sw69WsgPTu4yxfIUGLW6k78/cbDIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pU+1BhLn+AvKqWXizQhMvrDeT+Gd6pHUNONTavw2Tek=;
 b=ru0aRd5liSecfcBid284Z10e/2UZOriQ4S6aQJUHu8OVYoqIKhWKYpDU8IkV8nxR+S7MmqoTgbF3yDB+qxiE/ZjkmUw+QPYxBNXF26oK2V7O/ySYk8FwfRhmS8pW9u3SJtql+wAiBQKNMuk2Pafio7q0l7CSm13GhT4s9Mls2ZO/2sPeb56yauj5EP7Vql1lSnk850+gvMfeBzr9L5Gn82Bh8CxFj6em9U+xUYUx7cFYx2B1GH6mNQCC0l25+xZGwaPKQ99O6PZPTKSFczQlPxDtlAJPy2tyEj+OHBuO1qJk8rWDpvI+7mKYSogM0LnTeZx7VMkRU5/2XlZs8bRv4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pU+1BhLn+AvKqWXizQhMvrDeT+Gd6pHUNONTavw2Tek=;
 b=bAgrfRmORmXg+igZDz9+DIHBBgh06xkRAHUMnBWHHRaacMIaichTvONUcHnBNNIB2+L3+zzg+jN9k3HQCGMJel3l2NbtclDkO0NW7lCGNDkZFASRU6/476okp+YmDIPWu4IdkT/rXullpKH1e+pKFRj6mwFAzS7nJKVRlmNjTcI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7329.apcprd03.prod.outlook.com (2603:1096:400:433::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 10:07:18 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 10:07:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
	<Jason-JH.Lin@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?=
	<Xavier.Chang@mediatek.com>
Subject: Re: [PATCH v6 08/20] mailbox: mtk-cmdq: Add driver data to support
 for MT8196
Thread-Topic: [PATCH v6 08/20] mailbox: mtk-cmdq: Add driver data to support
 for MT8196
Thread-Index: AQHb0xt3K7Lr5SRftEa3Y5MTfYhL0bQW8E+A
Date: Fri, 27 Jun 2025 10:07:17 +0000
Message-ID: <620b547d768b41fec9c9955d8b1acea2213055c8.camel@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
	 <20250601173355.1731140-9-jason-jh.lin@mediatek.com>
In-Reply-To: <20250601173355.1731140-9-jason-jh.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7329:EE_
x-ms-office365-filtering-correlation-id: 6f7df789-361a-4ccb-22b1-08ddb562660c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NUJSWWUwaFJGWjAyQksrQklRT3lPMmprY1BrOWh4d2tOc1dxbWtYSEp0SFhQ?=
 =?utf-8?B?b0MxSmxFd0xmUWJqRU1rWEcrYTZtUzNhK1N3c2MwZWxPQXdSaVdnVCtOS0J0?=
 =?utf-8?B?dUNKRmh6M0xNMksvUlEyUlNEQWhIdTlsdTEzNXBiNXdSNHl5VHYvY2hiWEVK?=
 =?utf-8?B?RFBYZXo4cU1xTmhORS80d1Vrdm5jM1ZQY3drbVJ2OGlQUU1Eam1HTHUzelJY?=
 =?utf-8?B?UkxRT1FPcmhYQ3JpWlhDZENHNzZ1OUxzaUlOT1hkRTJYdUltaEI4Z0VMWXVn?=
 =?utf-8?B?NEduZURmb2cxdUlEdnpvZWpzUUJheFJXNnI4T1lQVFNTT3VIQzRuQWRHYlZn?=
 =?utf-8?B?NkZnZ21ReTVlb3VJZmYyV2tRaHdlSmlTS3FlRGxiT1dRdFV3c0xNa0dFRUlx?=
 =?utf-8?B?Z0NOMEk2ZStuUUtVdVJHT2VVQzZmQldRTUNHOGNJYUN5Nmptd3lWMlpOdzQw?=
 =?utf-8?B?SFJ5OGlOWjRRTW5PL0lucnJxYWw1eWRicGNmSmlIOE1MU2hGWWNmOTFLWE03?=
 =?utf-8?B?ekR5bWljRlpOMVJ4bHZFTWFyQkQ1dlMrbWg5L1BsVnlvQ20rRWZldFc4dHF1?=
 =?utf-8?B?MDVodXEveFp6RGc3ZnY1cWJCYnViR0N0c25jV2VWMHpycVRMUTJXTTI1enhM?=
 =?utf-8?B?VXcwR1ZWaGJtTjRqbGZ6SHhYRmQ3dlNYcXhEbWJySnZObnZpL2xFV0hiSHhr?=
 =?utf-8?B?MExYcitOeUNGdlQyRjB0RWFsVzk4R3l3YkFCVHY3d01Vd2lxcy95dXh3cmJ4?=
 =?utf-8?B?emkrclNaMlhWVGkrTzZSN08wME01bmdmN2thQnIzRU9WQ1lJbXZid0F5R2dM?=
 =?utf-8?B?VXAxYW5zbWpHZVM4bzZqclFSUlBWMVZwSFk2L05YdDF3a2J6UVIybThPbmRN?=
 =?utf-8?B?UUYwd2FQaCsyd1p3QVY1TE1RcEpmVHZYUmZnMnNQZWZyRERXRTdwNEdSdnpz?=
 =?utf-8?B?MEYvOExtaGNORFovUGhBWC9TYjZpb3NuKzd3QndBUjQvUllKZWZ6WEdZMWk1?=
 =?utf-8?B?dzJ0d1BJYWtIbWY5bXJ6aWY5cWxKMlRiRGlrZlV2QU9KK0J3YllZWlNJQWhU?=
 =?utf-8?B?T2ljemp2Mlpvam1PaTNCZjdHOXFUMXBvNHU3RGkvWGI3Tldxb3JhOFVrNE41?=
 =?utf-8?B?SlJjZEcyWm5MUzNTTThzWHliOVBpTGRYc0d1T2pEUWNpb1JtMDlwdlJLRFZ6?=
 =?utf-8?B?bVdwZndSSGZIYjl2NXZOM3dmK1JGZkVreDJGeGQ3M3ZGS2FXVmxoeGN2S2hZ?=
 =?utf-8?B?QlV4Tm1ZRTEzRk9ZN0dPQUZGM0dDQTRyL0RzaGFHS1p4Vkw4QVJsc3R1QmVv?=
 =?utf-8?B?b3pGVnBtdU12SU9QbmFIV09BUGZxUnMzQnI4S0k1R0ErbTF3cnpsWUV4YTBi?=
 =?utf-8?B?MFUyd1Z0ZUhBalcyckF2bXVKdUtOeVlacjJtYUgzMGhkREVZZnVDdXF2MWJB?=
 =?utf-8?B?UXgrK3BKU1Q3cmpCRzZiaUlUM1FRZjQvblJTQnBVelNsU2tqeCtBRzJmNFJu?=
 =?utf-8?B?SVNibDFneGxtdm00Y1VtOWlnL28vNmQ4Qncxby8xWFJ5dUlXWkFCcGJ0aG9V?=
 =?utf-8?B?bEhkNzN4N0JEK25ic2lNUzVuN1hQeHU5Z3c2QlpxOU1FQkxJQkRFVUxtR0hk?=
 =?utf-8?B?VXZlRnJ3c2ROOTlaaW5zcXpETld0UVYxellYbDJNQkZ1bEZvKzJlYTZpM2o4?=
 =?utf-8?B?VXNtSjVXYndzQlp2cm5WNG8yRWtIVmgydS9FSk5ZWGN0aTUxSjhvbXJPSjZO?=
 =?utf-8?B?dHo5UHZHSUFIVWFWUmdJNUJ2R0xQZXpZT1VzdGhyMDdqNnZ3aTFndTUrSGEx?=
 =?utf-8?B?emhEQVZDNXB4VWU5T1REVHE1K2t0bjdKcS94TndqUWEyYlVsWVkwVWw0amtC?=
 =?utf-8?B?WGxvKzRCK3U3SGJGbE0wM0E3aHVONmo5SEp0TSttTVpybjJiaUJmdEo5elZn?=
 =?utf-8?B?eUNwVTlIRW5YTHNkRkl4dHFzU2dPMlVMK1Zub1FmcjNVdHJQZ2Zyd0NaZmM2?=
 =?utf-8?B?RDRkTlRyUGFBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDhNei8vQUdxWTRzbUpxKzVFb1grT3BRQXQ2VDZ6R091SklmZ0djTnRLVmFz?=
 =?utf-8?B?SllRN0NFWlhmYlhHaVhBM1NjdU1hZWc5VjhpK1IyeGZ5YUZCVnZIUit1UVV5?=
 =?utf-8?B?OTl3eXhMMzVhb2ZKaHNydUd0T2JWaDlUelBSZmRacVc3bFVtN0lqd1c5WFJC?=
 =?utf-8?B?d0hzOEVZV3dyUjBsVFpjVG9jTjU4eFNnL28zSEowaHE1ejBvdTVNbWtONTV4?=
 =?utf-8?B?bFkzUCs4cHNRdUprREkzeGFjQWpJMmNQdWtjLzF1NXBYaW1vY1RoUHZ1K05C?=
 =?utf-8?B?T25iSjhIRFpoa2NIT1JsaHR2MVpXdTYzRmNuaDhVSTJ3TFFOVTlSODZnV0VY?=
 =?utf-8?B?ZmEydVA2d3VqdTZEREJGek1NY3JOL1JSRjBseWNjeEpRY29jSnRyS2hpS3VG?=
 =?utf-8?B?QlNoK0hMQ3REamFSLzdOL25lNkIrN2g3UTVvS0xnTGJCWEJDVlJXYXhRTXE3?=
 =?utf-8?B?d3A0UGM0akhOREZzWGdGSkh0ZXIvelNuVGFNeTBDemRKb1BTTHVINi9CZzFP?=
 =?utf-8?B?Q0laWWtxelV6Z2lPRm4zb3RIQUJJTHVvSkZaMGt1c1BwS08rRW5RcXYrdjBF?=
 =?utf-8?B?aHBWdlRQWnNBeS91OVM3S0ZBNFc4RWRmNHFPR3cvTzg4K1I2YjBjSWNXMUtP?=
 =?utf-8?B?UXJOZDlMYkxHa0cvQ29SWU8wZEErZjB0RTFUR1NOc055dWpGVFVpSGVHUktP?=
 =?utf-8?B?aXg5M2NJdzVqdWJTUzhiV2pJdGE4NmFMMDhQWThtWUlEcGJpS3VZZDVtblJ6?=
 =?utf-8?B?N0psSmRWT28zSUJHQmIrMm01am5XOWVGcDJHZVJPUnk0Q05ERGJzZnh6YkNK?=
 =?utf-8?B?Qm93NTRSNGZqVjgyand3TnJac25JMFpjY2Z3TmNZZEFQaGNGUkFWLzF3WWs5?=
 =?utf-8?B?U0tDWVpxUWN1NER5RVU1em5aekZHWHgrNEFtTERLNW02TnVCdFc1NUR3d0lL?=
 =?utf-8?B?T3FhaHBoT2dVMm4xdEpoeG51b3dwNFlpaUtkb2I1NDJPWWVSQkk4UDNNRVpu?=
 =?utf-8?B?WUVTQkkvOFQ4VzI0cnV0bnZoMTFibjEzdEQxSzlpZW5sODVYODBpd2hHaU1L?=
 =?utf-8?B?RlRNVW5uVERDVDU4aSs2eFVUVHNWQXZSV1FGY0RHT1RiV0F2N1hmc0hYSlh2?=
 =?utf-8?B?WWJPcENXNHIwRCtEazNQYnlpaUZkS05ESUF2VVVVbUk4RkhtY3VXTTU2VWVh?=
 =?utf-8?B?RStuT3lJRGNaN0hEM2R3YkEwQmsvV2pVT0JFUW9jdUNMdTMvSHl5SUVrRGlD?=
 =?utf-8?B?am9HUldmdzQrejRZc09EakQzWWFXVDVqbHNLcmdUL2FDdEI2MkRvTDI2WWo1?=
 =?utf-8?B?UVN4c1k2ejFadkxjSmlGUm5vRVVkalFtK3hxYS9Eb0J2QkI3OWtBWDBBUWxV?=
 =?utf-8?B?WEVlbzZ1ajdmb0NQVkVXdmJ4N3VHYXJ5dUxieGpPSGZLSWtRenF1QjFhWDVk?=
 =?utf-8?B?M3MreERzdEpGc2JDMm5xekFScUFldmUzQWtJbExob2xubDF1OFBVU2lBNnlD?=
 =?utf-8?B?NUxRbGIyN0I2c1RwbXlhUCtNWEZmSURDUjhUWjI2VWM5OGRMOUhOUGtNV05M?=
 =?utf-8?B?ai9tcTlyeS9SY1pqM0dyREc0UmhmdHpDVkROcnUzeGM5KzRDcWxVcmsrNGlj?=
 =?utf-8?B?VkR3MWg3dVU2Vy9lSmtxRktRdHowWnVyYkQ3eTVNQmcyajBIcVpMajFpUHAy?=
 =?utf-8?B?am90aHVEMWU5REFacWlab1BjdWVLaERLeWVFeE9vZEdWeFhmK1R0bFcwUTNz?=
 =?utf-8?B?cndqcDJVTmQ2cFVTVWdHcWI2M1RRSTRaY0ZBTElFSmc4UTNFSk1DY2MvZnI2?=
 =?utf-8?B?eGZYTVVyVEhXSWUxYU1HcngyYWR0bDZPbUNZajcvbzR3QzhqeGJ3VGpBOVRC?=
 =?utf-8?B?L0YrekhnQWk4dmRQMk80ak9JZlNiK1huTnU2OE01UlJ1Z2lMK05YTkxFZ3lp?=
 =?utf-8?B?VlMveU1PU2h3TkZaZW9KRVJVQS8xQnZjSHZHMFRUT3hidU5KRFhFZzhaUTU3?=
 =?utf-8?B?VkN3bFIrUnJMUFpXM2dSQ3dZOUluYTcrRVY0dW5pcURhTytJUnhKUzNwRHBK?=
 =?utf-8?B?YUJndlo4bUJHYmFZdnRjaU9SYktSVzlJbXB6QlY0YkxOYzlEbFNDdEFvMTZE?=
 =?utf-8?Q?HzRuw83DmF4Tgi05+JwfULFBp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15366454800460469A7809E9533702AB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7df789-361a-4ccb-22b1-08ddb562660c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 10:07:17.9879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: crR1lYvf0rzfPDC6/thFj0V0VedU13EuixJ79iDSJOQNyHHvoz7Pb911l/hruuyYuN9Dpka9ZD/n+Ef79SXezQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7329

T24gTW9uLCAyMDI1LTA2LTAyIGF0IDAxOjMxICswODAwLCBKYXNvbi1KSCBMaW4gd3JvdGU6DQo+
IE1UODE5NiBoYXMgMiBuZXcgaGFyZHdhcmUgY29uZmlndXJhdGlvbiBjb21wYXJlZCB3aXRoIHRo
ZSBwcmV2aW91cyBTb0MsDQo+IHdoaWNoIGNvcnJlc3BvbmQgdG8gdGhlIDIgbmV3IGRyaXZlciBk
YXRhOg0KPiANCj4gMS4gbW1pbmZyYV9vZmZzZXQ6IEZvciBHQ0UgZGF0YSBwYXRoIGNvbnRyb2wN
Cj4gICAgU2luY2UgR0NFIGhhcyBiZWVuIG1vdmVkIGludG8gbW1pbmZyYSwgR0NFIG5lZWRzIHRv
IGFwcGVuZCB0aGUNCj4gICAgbW1pbmZyYSBvZmZzZXQgdG8gdGhlIERSQU0gYWRkcmVzcyB3aGVu
IGFjY2Vzc2luZyB0aGUgRFJBTS4NCj4gDQo+IDIuIGdjZV92bTogRm9yIEdDRSBoYXJkd2FyZSB2
aXJ0dWFsaXphdGlvbiBjb250cm9sDQo+ICAgIEN1cnJlbnRseSwgdGhlIGZpcnN0IHZlcnNpb24g
b2YgdGhlIG10ODE5NiBtYWlsYm94IGNvbnRyb2xsZXIgb25seQ0KPiAgICByZXF1aXJlcyBzZXR0
aW5nIHRoZSBWTS1yZWxhdGVkIHJlZ2lzdGVycyB0byBlbmFibGUgdGhlIHBlcm1pc3Npb25zDQo+
ICAgIG9mIGEgaG9zdCBWTS4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEphc29uLUpIIExpbiA8amFzb24tamgubGluQG1l
ZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5j
IHwgMTIgKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgYi9k
cml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+IGluZGV4IDZmNGI5ODc5MDY5ZS4u
ODUyMTFiODBjY2RiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFp
bGJveC5jDQo+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gQEAg
LTE0LDYgKzE0LDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1l
Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvc2l6ZXMuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9tYWls
Ym94X2NvbnRyb2xsZXIuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9tYWlsYm94L210ay1jbWRxLW1h
aWxib3guaD4NCj4gICNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiBAQCAtODUyLDYgKzg1MywxNiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGdjZV9wbGF0IGdjZV9wbGF0X210ODE5NSA9IHsNCj4gIAku
Z2NlX251bSA9IDINCj4gIH07DQo+ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZ2NlX3BsYXQg
Z2NlX3BsYXRfbXQ4MTk2ID0gew0KPiArCS50aHJlYWRfbnIgPSAzMiwNCj4gKwkuc2hpZnQgPSAz
LA0KPiArCS5tbWluZnJhX29mZnNldCA9IFNaXzJHLA0KPiArCS5jb250cm9sX2J5X3N3ID0gdHJ1
ZSwNCj4gKwkuc3dfZGRyX2VuID0gdHJ1ZSwNCj4gKwkuZ2NlX3ZtID0gdHJ1ZSwNCj4gKwkuZ2Nl
X251bSA9IDINCj4gK307DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IGNtZHFfb2ZfaWRzW10gPSB7DQo+ICAJey5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc3OS1n
Y2UiLCAuZGF0YSA9ICh2b2lkICopJmdjZV9wbGF0X210Njc3OX0sDQo+ICAJey5jb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE3My1nY2UiLCAuZGF0YSA9ICh2b2lkICopJmdjZV9wbGF0X210ODE3
M30sDQo+IEBAIC04NjAsNiArODcxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgY21kcV9vZl9pZHNbXSA9IHsNCj4gIAl7LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTg4
LWdjZSIsIC5kYXRhID0gKHZvaWQgKikmZ2NlX3BsYXRfbXQ4MTg4fSwNCj4gIAl7LmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ4MTkyLWdjZSIsIC5kYXRhID0gKHZvaWQgKikmZ2NlX3BsYXRfbXQ4
MTkyfSwNCj4gIAl7LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWdjZSIsIC5kYXRhID0g
KHZvaWQgKikmZ2NlX3BsYXRfbXQ4MTk1fSwNCj4gKwl7LmNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ4MTk2LWdjZSIsIC5kYXRhID0gKHZvaWQgKikmZ2NlX3BsYXRfbXQ4MTk2fSwNCj4gIAl7fQ0K
PiAgfTsNCj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGNtZHFfb2ZfaWRzKTsNCg0K

