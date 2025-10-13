Return-Path: <linux-media+bounces-44240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E66DBD19A6
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 08:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 25BC6347E29
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 06:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276E42DF13D;
	Mon, 13 Oct 2025 06:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kYrEG8mL";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="E9WLTHga"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E55B2E06EA;
	Mon, 13 Oct 2025 06:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760335904; cv=fail; b=Fo4WZzwdYFJ2crTkbgqktRwwXPzCsPfI2A9vtpvR/hN1ZXr8AuhYCGjUDizTKc+RIu17U7V1HneBgT+p0h/k5FzWwCciZrzbxwniwPkdLKzKiu5j6ncprTj3JMkZKlV3GApy6EPeochJv3P0DzKyVe+MIAE/vTB7GxD1T/dKLLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760335904; c=relaxed/simple;
	bh=kPN5nld4k47us5QHLSuhD49s+efm2L4Tsj6aoUnOZWA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QLSbVAjaspcDhc0hCwHROn7vwbjkKFABuX+k2mnNgsv8/wyfeitJUiwqtKY2LQOM/hbTPvBPwLYG0TW+62ESDrZz4VVxzebNKCQMLnFgqpqYHxXrxuF95dnbxkubgt3G3X3ldCIF6BGKM0nFef0iFL2ZVG5nGG+o6eoqGUoyAnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kYrEG8mL; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=E9WLTHga; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 78efd31aa7fb11f0b33aeb1e7f16c2b6-20251013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=kPN5nld4k47us5QHLSuhD49s+efm2L4Tsj6aoUnOZWA=;
	b=kYrEG8mLieAapzRzc31ZRlWSNKxbYXoJv8HbyQ9CENi2yc4yqcSpbLd2Epny1dym/kUJDH+Cyu8tjM8cB+OY5MnJm3acjb8Y3DX5s0ssXChyv4jj/UmIvkNtBTnsBI/RJOZrlW+x1E+pnIRrjbuI1TvluaDaN6CLZD7rzUD2x9A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:1c463667-8721-45f3-a1fc-d4ad81a3eef7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:ff685102-eaf8-4c8c-94de-0bc39887e077,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 78efd31aa7fb11f0b33aeb1e7f16c2b6-20251013
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 690991604; Mon, 13 Oct 2025 14:11:35 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Oct 2025 14:11:32 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Mon, 13 Oct 2025 14:11:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njEyQogm9SCSPgal33rqmW8FtwnSKp12tEi9guT0kkFmcCBOai60VseJeG7S1zAxUTKDMoFknZVMPJ1LIobNzj8iHKKmLhsPvDpaQqTQr2mzcXBcp1oPOdcNParxQWvfJ++ndBs7jQJc9YFcSGwOt5BUWq+LIMjay9FZrj7KhwIn6FdirLvLSOO0f/le4qZTmySbAIn8Vzm99Fva2N/6sNWpcORGmDluqcBV+SJmS9WygMkKsFUL/hdY2T5UQEl7Ow10aw9QO4cT2f2nC0PtPpOFj0FiKj9p51ZOV7iWpXawBhMAxsFpn7U419agz/35whTgv4ly5VDL0QiAAMbkOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPN5nld4k47us5QHLSuhD49s+efm2L4Tsj6aoUnOZWA=;
 b=yV9g3Yccw/1KRSXUu/Tu5y/Bwk7aX+rMeg49+pehn+xmoFocRM9O11J/eJ80AiaB8A+4tlEIhw5i1OCCQuJtSslQ8MZC+HPdDruq6cpue+PJYWF3SkH86QkNYjKYsV0MM8sRrgExbYP9GlFVVDb6RnNlaTBOEI2uivRmqIsKHOCjnZa13ExPW97N5JGTGsl6qpAo0+A89phjBgOW26jAUjQQ7EodWHyXJAKDOniUgL0m+cDgyOG/CdyqV5bE13t1kxHlvl3IOerjqKNzehoa1o8Z0g+5qziQk637D9oHhPINxUdx0Y4RizqxVtibipaofqrYZw+6B5Og7I3riH4zFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPN5nld4k47us5QHLSuhD49s+efm2L4Tsj6aoUnOZWA=;
 b=E9WLTHgabOE9pS90lwFIBQzkL61psv/STDB7Wc91lD1/LyIi1G0oeAYXSU4+5aGsWrCfVPeDJNFiBokOKw+zLkT0vIXU/1JZdMGFfgmblCjO76rsXEEUm7wi6FrSE6ux/s2xJFFL6bdaCI4rvY+EK485B75gfhdt6h9rLOc/SGg=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TY0PR03MB8174.apcprd03.prod.outlook.com (2603:1096:405:1b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 06:11:29 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:11:29 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 07/20] mailbox: mtk-cmdq: Add mminfra_offset
 configuration for DRAM transaction
Thread-Topic: [PATCH v7 07/20] mailbox: mtk-cmdq: Add mminfra_offset
 configuration for DRAM transaction
Thread-Index: AQHcOQ/HQfbnQZkgZ0CsrUGBxf0bYbS/nkwA
Date: Mon, 13 Oct 2025 06:11:29 +0000
Message-ID: <376473d1d2768708357fdcfb59ba5d425c550fd8.camel@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
	 <20250827114006.3310175-8-jason-jh.lin@mediatek.com>
	 <bac4b2f1-3049-41ce-9ba8-3ac8f9ba4996@collabora.com>
In-Reply-To: <bac4b2f1-3049-41ce-9ba8-3ac8f9ba4996@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TY0PR03MB8174:EE_
x-ms-office365-filtering-correlation-id: 2127e0fd-8317-4917-99f7-08de0a1f596b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UVVDc05KNnlXREo1dml1MlJubEFTM0Y2aUVUcEZTVllHbmdKeFllQkhRUWNn?=
 =?utf-8?B?dVlYTGt4OFNkWGJweGljcWRzM2VmbytCcFk3S0ZaRVQ0UlNUdzlDWW1VSml0?=
 =?utf-8?B?UVFzRXJlS05ZVjJoeVFkU0FIN0RKOUZMUDVvaEIwTFJac3VVcUdMQmx6UDFU?=
 =?utf-8?B?dkIzMGZZQXBtNEp2ZmUyNVdNUk1EWUpXbUo0SUtvUWRpZGhibklTU3UrRFVW?=
 =?utf-8?B?bXQ1Y1Y3TjZSSTI5RlVXVlZCdE90QUswWlVlV0IyVHFaUHZ2VlFhbkt2YTRJ?=
 =?utf-8?B?MnMxb2k4N2dsOW5kbTQwQTVVeGZjMVdWZS9GaXJWSnJlWEFxQXV2UWsrRlli?=
 =?utf-8?B?VU9LQkkyM2hROTIyM1B3UE5USlJ6OUdRRWU2bTVIbmZQc21zbjluNjE4QkJs?=
 =?utf-8?B?d0VMaEdGblpXU2ZpUC9ZSnhheVZydWZmTzhmUnZ0ZlBQQS9KaTdjUEllQnBX?=
 =?utf-8?B?RktZUVYzVkUrU2dhVzlpaUhSZVIxUjRkRjVXazB1OTRReC9pRGljanNzK1FC?=
 =?utf-8?B?aDVnREovaGpYVzJGeUtyRVhId1pib0U2SkJaZ1I0L2NNcDNoYjl0eFhLclBO?=
 =?utf-8?B?Y3JPVHkxRDNpMXFvZ3NHa2FsM1hFOGUrRGgxUjZva08xOUtqT2M1T3FZak51?=
 =?utf-8?B?OWppb3pIUnlGTll5RGZ4dVV0eHBsUTVIWDFQM3Z6dXFsT3U0NkVkWi9uclJx?=
 =?utf-8?B?RHBWM1BEeUlUemNldkZaVHovNDdLYngwMm1ybXpXZG1BWnlYSk0yc3FhRk1x?=
 =?utf-8?B?QS91Qjl3YkRWOGNFcENJK1hJRWM4Yy8xNXF1dHQwaXJtVmxBTEIxUm0reFF3?=
 =?utf-8?B?djRxTEZaZzQwVVpFeEg5YUF6TDA0cW9PUWVCZHRqUjdYa2diWDNsTEg4MXJt?=
 =?utf-8?B?cUJLazhXVXhxNWtXY3dZVEVzQWp0eEpUWUlGR2JqbTFVY1lGcHg2TG5JS0VR?=
 =?utf-8?B?aUZwNVpnUHE1TEdGdmd3TWtDVGZ2b2VVaGlUa3VRaURXZkltcGV2SXAxSS9N?=
 =?utf-8?B?b3g1U2dKVEJ5aEVLdVkyRjYxcjBEdEhoSHJUNk9FYStmZHQ4RkQwcXhCTGNV?=
 =?utf-8?B?YTJSUHpJSmxCaXBmTHJhN2xzQXNYNURVWndYSEMxWVpGMTcxVlVNZW1Gbnow?=
 =?utf-8?B?YUtQQlRNQVhyc0N4YXR3eG1VRTlvTHJ0bytIWkZPbXk2KzFkdHZVUGE5UDNB?=
 =?utf-8?B?bTA2bnNNdDdIK3Z0RTVLV2Q4QlIrVjRQYjAzS1FyOHVheEhwZWVxQ2hCTzk4?=
 =?utf-8?B?UTlaWmZQY0kxUDErYXNvM1psZlI1UEM0RVErdFZpblJZR2xxeWNqVzRXN3NE?=
 =?utf-8?B?VWh5UjEwUGlBb2NSQndId2ZwZ3VTeGhPYTFRU0lMVHIzRC8rQ1NYNHdJaFA2?=
 =?utf-8?B?WjhUOHJ1WTloK2NJb1ZZMm9zREhicW9UYlpucEpzVDg1bG9GbEhza0NLSHlB?=
 =?utf-8?B?NlVLaGJ3SUtEMDdhVDNHQndicU80MWlFUi9zMGtQblBmdTR4RnJ3TjJsb1ky?=
 =?utf-8?B?eXNMem1mTmRHUmFaTERMVDgvTnNSRmEzZit6dkJoVlNxWnVPZXpUTVFsQ01H?=
 =?utf-8?B?azh6WnZuMFBhZ25zMnY1UlhTVDlmZjlZZXN3czZ2aWY1aysveTJpbnBvQ21o?=
 =?utf-8?B?TFR0UjRlQzgrN0VlTllJVlptZGNsTG9ZL1RtbmpFZVNkV0tBVUV2cDhRd3Bz?=
 =?utf-8?B?bnJGTzd2bWlMSEFlY3hMc09idXFXNG1sSzVhQkQyVFREbno4MFZkTUk2Wk5P?=
 =?utf-8?B?Q0hOODU1NFozV2FVdUxRbGtmVUJtMVhvcjNrQnJjVFRKenZ6TmhLR0VVMG95?=
 =?utf-8?B?WUxndDRBT3RENEFpdjIzenZ6VjNjaXAyMmJ5Uzd5OVl5ZnhiWDdrZnM1dWlO?=
 =?utf-8?B?U0dQcDVvdFVtZTNMUDIwMjRrMUFrMDl3QkRXZ1BUUXVyQm53bmJpSWg5Qk1h?=
 =?utf-8?B?ZktwUVpvdS93Qy9wODNkSjFmZUdOS0dxSXhwUkhWRlcxZUE0aGFCMFJqTE1N?=
 =?utf-8?B?OHd6TXVqKzNjcktZQUVrWUZKUkZPL0xOK3FodmVOclBmVG5KckpCMjJBS3do?=
 =?utf-8?Q?Gg012n?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWdNMVJvQ3lNTEk4TjBuYVVSWUV2eVI3YThBMjY3QnUxRFRndVd2MkdzYXpG?=
 =?utf-8?B?TXV1VUUxVmpCckZaNTVxRjdDM3FNYXpjUkliRWt2S1lEMldGK3k1aDdYZU5T?=
 =?utf-8?B?aGQvdGtkTzV1Yk1vMCtwTHdjZDNMKzhMZWpPd3lOYkN2bm90L1JDTGNud29w?=
 =?utf-8?B?Qy9XVmk2TzJXYzh0aVVSRnp5cWJaNHRtcm43aGVxWlFoaGZrRXdzQzBnUFl5?=
 =?utf-8?B?cStrOHZldWJDQ3c1L0RUMUNqdUhFY3JRUnhJZFoxYVQ5Q3hkVUplcFFITEhP?=
 =?utf-8?B?QTRscDJ2eHVPcUNEM2hUYWdwR1RTN2lOWmpTaWowTXRzcW52ZGF5ZytDamhL?=
 =?utf-8?B?aFVoVnhXRDI3QUszRU5xZE9SS2hsOVVUNCszaEVmN2tDYnZNWk9ReEZQbERz?=
 =?utf-8?B?TGlVMUJ3QUVMcFBZRjZSZmVKM1VyWks2NFR5d0hGbzgyWHBXM1Fka0ttbWxu?=
 =?utf-8?B?cjdKZ2NOVVJxMkxOOVk0eGZ4R1hhV1BaYjVxcFkvN0ZHQXREdEdpRjJxOFQ3?=
 =?utf-8?B?TFV4Uk0yc1lBSm1WOTY2WnJmbTZNcFg3dU1lNWpFWW9yZ3NGNFNXWk9zMnFl?=
 =?utf-8?B?S2dNNWNmc290RUxJRndRYmdES1FOUm95MTkyR2dWWnNTd0Fha3RTeDJMZFR5?=
 =?utf-8?B?RTRnZitXcGF1MEVjbkZKZEdWTmJxWG90QnBLcjh3T1lSZDBxYU1GUnplNkJD?=
 =?utf-8?B?cjA3WEhzeHZSZU1YRmVkV0w3LzJwMndUa0RHV0ZjbEFQdFlCcVlwRkYyak5I?=
 =?utf-8?B?Ky9mVnR1UHFuMk5sNTIxc0lKRlpyd3VlcGlZTExsNWJBWjJaYXB3TUFtY3Av?=
 =?utf-8?B?N3k4d0NkcjJhUHYwTGRxWFdXQVNEN25wQUYvblF3cDZqVjliUHo4a3Zlc1Rh?=
 =?utf-8?B?R2lXSFBMNDlPZFlJWVZySnQ2UDN3aGt0V3J5b1NrdnNnYmVNbTZYNXpqMHow?=
 =?utf-8?B?c2R0RDYyZVk0V1JtU3RwM0gyenk3WkMvdmFJVkFaNWY2S2h1L211VExnbTlY?=
 =?utf-8?B?YmZWNW9JajA2bnFJY3hETlNsN1h3RVhoWkRyZVFKL2kwTzkvWUlFVGhJd2Jq?=
 =?utf-8?B?REVMdnluMktWSEJyRTVHQ0FzTnZlL0xFMmpRN213NG9YYXA2K0cyS2dsRFIz?=
 =?utf-8?B?RXJXSXcxbXpONFQwQkVCN3JZTmpEM1JrZmlsVllhS0pIb2FPU01xNHFhK3FL?=
 =?utf-8?B?a2xZZGVwRDNZYXVXQU9tc01pOWQzQzAyeFl4amhDNCtaZ2ZCTVZxQ282MDVR?=
 =?utf-8?B?WWNscmV6TlVhT29jNnlPUTBnbXloMGRkdzVKclh5NEh6MjRIdzhNVm4yeXhx?=
 =?utf-8?B?bmliN2hCWWhpdzNWbkJrelJJMy9iaDZZNjZOWTd1bUZoVjM3YnQvR05Ja1B6?=
 =?utf-8?B?WDFqUndHQWtjRitwR1ZnQ3NGa0pqMDNUREEyUStjaTF2NktDcU9lY3ZOMG10?=
 =?utf-8?B?TU5HWTJFK1U1T0dNRmtRam4vdmJuUVNramRabFpGdisza2Z6RUpYNnM1blg2?=
 =?utf-8?B?ZmxUZW9PRDh6VWd0a3lkMDdWTDlDR1pJZy85eHpKbW1pcDIyRndBcW1UanJ0?=
 =?utf-8?B?Vm5hZVNmQzg0a0IvMXMxMTdoZVpqeHFlbXZycEVoT1NwSFVEbkJQS3A3Q2wr?=
 =?utf-8?B?RlIrQktFL0tlWWV4VEpRQUViYy9vZktzMGxPdHd1RHlJcGxKc2ovNzNvTGVU?=
 =?utf-8?B?TXJVYlpxcHB3OXpsbGtwcHg1Tno1V2RWb2lBbmc5dHdhMUtFWDNpTDlVVm1u?=
 =?utf-8?B?VVZqRWJlaGJuWDIyVjBFREZwV0dmLzk0ZllEY215VmtkeG13aEZMdC9uMTdQ?=
 =?utf-8?B?VnZTQXV3bERVS3huS2pDZG15RDZnVEw4RjRnVWRlSmJGNGl5OEhOVnBsY3la?=
 =?utf-8?B?YWVEUnp1aVlUK2hqUEs3d0plZ2pGVnkxY0RiRnREZFJSakE0WmtSd0tlTEYv?=
 =?utf-8?B?Vy9ZQkdVWE5NSS8xNWIrWEJFOXo4ZitVZDlVeGR3WDNUZzFBUC82UVJnVGZQ?=
 =?utf-8?B?OTVFSXR4am5LMWtxbGJiVS9oMDlObHhROEZVVlpOLzZnY2dFVEpBZU0xZlJ4?=
 =?utf-8?B?RGJBNE1halYybXRCQkpTY2ZYbHd0aU5tcVRxUUpFSjdwSkE1V1VoRE1CdlNn?=
 =?utf-8?B?MHZzcDQ3cUNIbXZoMnlLdk1lSEJldEJ3ai9kVnd5MEVCOStnYm9iU3VvbkNp?=
 =?utf-8?B?T3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E96E78785A12F9419C923368455A65DB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2127e0fd-8317-4917-99f7-08de0a1f596b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 06:11:29.3465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQpUZWlW1Ie40YSPzUhzK9pReX1GAZPzdB/8pqYpRg8u7XDvAZCSx9wSJl6V3HHPndbTC07t8cH6hGBEqpuiz6qt04Ospgkmo5376GyU+xs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8174

T24gVGh1LCAyMDI1LTEwLTA5IGF0IDEzOjI3ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMjcvMDgvMjUgMTM6MzcsIEphc29u
LUpIIExpbiBoYSBzY3JpdHRvOg0KPiA+IFRoZSBHQ0UgaW4gTVQ4MTk2IGlzIHBsYWNlZCBpbiBN
TUlORlJBIGFuZCByZXF1aXJlcyBhbGwgYWRkcmVzc2VzDQo+ID4gaW4gR0NFIGluc3RydWN0aW9u
cyBmb3IgRFJBTSB0cmFuc2FjdGlvbnMgdG8gYmUgSU9WQS4NCj4gPiANCj4gPiBEdWUgdG8gTU1J
TywgaWYgdGhlIEdDRSBuZWVkcyB0byBhY2Nlc3MgYSBoYXJkd2FyZSByZWdpc3RlciBhdA0KPiA+
IDB4MTAwMF8wMDAwLCBidXQgdGhlIFNNTVUgaXMgYWxzbyBtYXBwaW5nIGEgRFJBTSBibG9jayBh
dA0KPiA+IDB4MTAwMF8wMDAwLA0KPiA+IHRoZSBNTUlORlJBIHdpbGwgbm90IGtub3cgd2hldGhl
ciB0byB3cml0ZSB0byB0aGUgaGFyZHdhcmUgcmVnaXN0ZXINCj4gPiBvcg0KPiA+IHRoZSBEUkFN
Lg0KPiA+IFRvIHNvbHZlIHRoaXMsIE1NSU5GUkEgdHJlYXRzIGFkZHJlc3NlcyBncmVhdGVyIHRo
YW4gMkcgYXMgZGF0YQ0KPiA+IHBhdGhzDQo+ID4gYW5kIHRob3NlIGxlc3MgdGhhbiAyRyBhcyBj
b25maWcgcGF0aHMgYmVjYXVzZSB0aGUgRFJBTSBzdGFydA0KPiA+IGFkZHJlc3MNCj4gPiBpcyBj
dXJyZW50bHkgYXQgMkcgKDB4ODAwMF8wMDAwKS4gT24gdGhlIGRhdGEgcGF0aCwgTU1JTkZSQSBy
ZW1hcHMNCj4gPiBEUkFNIGFkZHJlc3NlcyBieSBzdWJ0cmFjdGluZyAyRywgYWxsb3dpbmcgU01N
VSB0byBtYXAgRFJBTQ0KPiA+IGFkZHJlc3Nlcw0KPiA+IGxlc3MgdGhhbiAyRy4NCj4gPiBGb3Ig
ZXhhbXBsZSwgaWYgdGhlIERSQU0gc3RhcnQgYWRkcmVzcyAweDgwMDBfMDAwMCBpcyBtYXBwZWQg
dG8NCj4gPiBJT1ZBPTB4MCwgd2hlbiBHQ0UgYWNjZXNzZXMgSU9WQT0weDAsIGl0IG11c3QgYWRk
IGEgMkcgb2Zmc2V0IHRvDQo+ID4gdGhlIGFkZHJlc3MgaW4gdGhlIEdDRSBpbnN0cnVjdGlvbi4g
TU1JTkZSQSB3aWxsIHRoZW4gc2VlIGl0IGFzIGENCj4gPiBkYXRhIHBhdGggKElPVkEgPj0gMkcp
IGFuZCBzdWJ0cmFjdCAyRywgYWxsb3dpbmcgR0NFIHRvIGFjY2Vzcw0KPiA+IElPVkE9MHgwLg0K
PiA+IA0KPiA+IFNpbmNlIHRoZSBNTUlORlJBIHJlbWFwIHN1YnRyYWN0aW5nIDJHIGlzIGRvbmUg
aW4gaGFyZHdhcmUgYW5kDQo+ID4gY2Fubm90DQo+ID4gYmUgY29uZmlndXJlZCBieSBzb2Z0d2Fy
ZSwgdGhlIGFkZHJlc3Mgb2YgRFJBTSBpbiBHQ0UgaW5zdHJ1Y3Rpb24NCj4gPiBtdXN0DQo+ID4g
YWx3YXlzIGFkZCAyRyB0byBlbnN1cmUgcHJvcGVyIGFjY2Vzcy4gQWZ0ZXIgdGhhdCwgdGhlIHNo
aWZ0DQo+ID4gZnVuY3Rpb25zDQo+ID4gZG8gbW9yZSB0aGFuIGp1c3Qgc2hpZnQgYWRkcmVzc2Vz
LCBzbyB0aGUgQVBJcyB3ZXJlIHJlbmFtZWQgdG8NCj4gPiBjbWRxX2NvbnZlcnRfZ2NlX2FkZHIo
KSBhbmQgY21kcV9yZXZlcnRfZ2NlX2FkZHIoKS4NCj4gPiANCj4gPiBUaGlzIDJHIGFkanVzdG1l
bnQgaXMgcmVmZXJyZWQgdG8gYXMgbW1pbmZyYV9vZmZzZXQgaW4gdGhlIENNRFENCj4gPiBkcml2
ZXIuDQo+ID4gQ01EUSBoZWxwZXIgY2FuIGdldCB0aGUgbW1pbmZyYV9vZmZzZXQgZnJvbSB0aGUg
Y21kcV9tYm94X3ByaXYgb2YNCj4gPiBjbWRxX3BrdCBhbmQgYWRkIHRoZSBtbWluZnJhX29mZnNl
dCB0byB0aGUgRFJBTSBhZGRyZXNzIGluIEdDRQ0KPiA+IGluc3RydWN0aW9ucy4NCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+
DQo+ID4gLS0tDQo+ID4gwqAgZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guY8KgwqDC
oMKgwqDCoCB8IDIyICsrKysrKysrKysrKy0tLS0tLS0NCj4gPiAtLS0NCj4gPiDCoCBpbmNsdWRl
L2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oIHzCoCAxICsNCj4gPiDCoCAyIGZpbGVz
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+ID4gYi9kcml2
ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+ID4gaW5kZXggYTllODg5NWQxNGRmLi4z
NzNlZmZiY2ZhNDAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1h
aWxib3guYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4g
PiBAQCAtOTQsMjAgKzk0LDIxIEBAIHN0cnVjdCBjbWRxIHsNCj4gPiDCoCBzdHJ1Y3QgZ2NlX3Bs
YXQgew0KPiA+IMKgwqDCoMKgwqAgdTMyIHRocmVhZF9ucjsNCj4gPiDCoMKgwqDCoMKgIHU4IHNo
aWZ0Ow0KPiA+ICvCoMKgwqDCoCBkbWFfYWRkcl90IG1taW5mcmFfb2Zmc2V0Ow0KPiA+IMKgwqDC
oMKgwqAgYm9vbCBjb250cm9sX2J5X3N3Ow0KPiA+IMKgwqDCoMKgwqAgYm9vbCBzd19kZHJfZW47
DQo+ID4gwqDCoMKgwqDCoCBib29sIGdjZV92bTsNCj4gPiDCoMKgwqDCoMKgIHUzMiBnY2VfbnVt
Ow0KPiA+IMKgIH07DQo+ID4gDQo+ID4gLXN0YXRpYyBpbmxpbmUgdTMyIGNtZHFfcmVnX3NoaWZ0
X2FkZHIoZG1hX2FkZHJfdCBhZGRyLCBjb25zdA0KPiA+IHN0cnVjdCBnY2VfcGxhdCAqcGRhdGEp
DQo+ID4gK3N0YXRpYyBpbmxpbmUgdTMyIGNtZHFfY29udmVydF9nY2VfYWRkcihkbWFfYWRkcl90
IGFkZHIsIGNvbnN0DQo+ID4gc3RydWN0IGdjZV9wbGF0ICpwZGF0YSkNCj4gDQo+IFlvdSBhcmUg
YWRkaW5nIHRob3NlIGZ1bmN0aW9ucyBpbiBhIHByZXZpb3VzIGNvbW1pdCAtIHBsZWFzZSwganVz
dA0KPiBnaXZlIHRoZW0gYSBnb29kDQo+IGFuZCByaWdodCBuYW1lIGZyb20gdGhlIGJlZ2lubmlu
ZyBhbmQgZG9uJ3QgY2hhbmdlIGl0IGFueW1vcmUgaW4gYW55DQo+IGxhdGVyIGNvbW1pdC4NCj4g
DQoNCk9LLCBJJ2xsIG1vdmUgdGhpcyB0byBbUEFUQ0ggMi8yMF0uDQoNCj4gVGhlIGNvZGUsIGFu
eXdheSwgbG9va3Mgb2theS4NCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3cy4NCg0KUmVnYXJkcywN
Ckphc29uLUpIIExpbg0KDQo+IA0KPiBDaGVlcnMsDQo+IEFuZ2Vsbw0KDQo=

