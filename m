Return-Path: <linux-media+bounces-27644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB5A50407
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 16:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A76227A43FB
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 15:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BEE250BE8;
	Wed,  5 Mar 2025 15:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HeO3vER8";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="EIkbdkV5"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BA0205510;
	Wed,  5 Mar 2025 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741190349; cv=fail; b=V/m2hpZ+jy2Fk0uILIEUQaRXPO8k24n9Jlt6v4D6CalYnu1yiNtFPd0ezwB4qgLNfTmcQ1JVZRLICfXATznSSd3zA8G4yEQMbLugr9WXCzHOslYLksOZO/XPQk4PynYr05vq+2b5A2Jg3H5IsSirGieK6abXkU0phrpadi134EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741190349; c=relaxed/simple;
	bh=xOrQLujMmHXGWfJjqQHiOmhn/dqcA4Pf8+KLryH2axM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KVAFe3ZdRdi00h2RyR3aGQHKtb/mny8Vv74KhksNXI/nCuW98bEYIvPJ2BOHQub1cSY3vLjvGfWNheIgPs9ndfyeYLE5A3Yw68kolkh0LZ8KNNta+syjYAxxOiPygRlqmZP/RrdoOA0lpUyZzb/V1fdOR843BJL6TfCrXbwhZOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HeO3vER8; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=EIkbdkV5; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: bc06a5eaf9da11ef8eb9c36241bbb6fb-20250305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=xOrQLujMmHXGWfJjqQHiOmhn/dqcA4Pf8+KLryH2axM=;
	b=HeO3vER8z28gbQfrYN244BfuPwILAiFi2r95q8OGf20XA084c0nK58RpK3ZXek6fu7PrhajW/lRbIpNYrDI7EeRqiJa00ot6094UKHu3Lqz6/g5IoWN0aemg5TV/FFLrZZgGcREOyNUR/QS4zciYid/0tMGpL+ixONo6FAwCZp4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d555cf33-a3ad-4639-9ea7-dba43f83b728,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:9915fe8b-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bc06a5eaf9da11ef8eb9c36241bbb6fb-20250305
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 19326574; Wed, 05 Mar 2025 23:58:52 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 5 Mar 2025 23:58:51 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 5 Mar 2025 23:58:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDn3UO3bG0AaYIk8mbl5bZUZjnUvaYc+VvWobuD7VM77zMVSzjll4+nBaAkLOr2joyYgE0JbG/vvdNidWjG/Bv+uHWOniHISql/LcB96dwe1h9yYO3/Z9oiJ8V5Uj5DC0NMYYd2SnRwWY6xgquhdNuKFhdAcutyjZTIhHUL9GDQcGHWKsbjeYgZ1Tv1SwkbErvL6aO0VDLEK0Anb1yRhplbt0bsSZa9WgpGxWtSmn6YxdHSffJnztHEKmAfuGETTiwBO+sr/7E877jpQmE/ArcyGB7t9k42MuEFW1EaFr1VWp6pyXMAlop3RnKlf9bPnK7P6bSYytCfdTwBY5CRLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOrQLujMmHXGWfJjqQHiOmhn/dqcA4Pf8+KLryH2axM=;
 b=wuM0QpqUsL+IRO0S6LqiRwGWWhHd6OMSgRape0vUR1j1TfYshPwMPP1uNIHC902+OA//VQVMw15AfN79IIp88bEooO6WdgTMABDWsyebQEner2C3A2dv4tWgMeHGGPdvZDN0PT41t0SScZaurfmadDQZwLwLmnmJD7gf5vm8XfZdHmbmFH5yRUkWZuuxmVuQjShcfM2h+aFxwCz8XVP3JwzbvKp434XCkO/G0HMgEzN1nqH9DXJUZrRdGA88GiLa9F1zSzWx2MdSTkSNhgvYakXkKtNh/4jxxwE4+yHxvNaO5jKDriOU0GXMZRirgUIJPbBAmZFfZhJBrDODtF6ZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOrQLujMmHXGWfJjqQHiOmhn/dqcA4Pf8+KLryH2axM=;
 b=EIkbdkV5oP9/tPQ0rPYM4CoKRdMeBs2RsP5K9eHwEWhWSyixRpPlxzMY03Jxcf6xT/p/wNpP/DSXOq4PjkUB3cXmwDYUiZZt4tM8PuOkTTYTe+JEXr8RFPCGn1KMT99/+flD0Rx0zQsbFuwQJ8n72r3Dy+kW2Yv7mz7njQXi0Qk=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEYPR03MB7508.apcprd03.prod.outlook.com (2603:1096:101:145::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 5 Mar
 2025 15:58:47 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 15:58:46 +0000
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
	<Xiandong.Wang@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treapking@chromium.org"
	<treapking@chromium.org>
Subject: Re: [PATCH v4 4/8] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 unsupported subsys ID hardware
Thread-Topic: [PATCH v4 4/8] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 unsupported subsys ID hardware
Thread-Index: AQHbgcg8NOxMJmq6REqrLg4+446/ZrNizfqAgAGVXICAABV/AIAAUo4A
Date: Wed, 5 Mar 2025 15:58:46 +0000
Message-ID: <c27653233ed2ee2ee6eb0d40ad2167721a2b1476.camel@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
	 <20250218054405.2017918-5-jason-jh.lin@mediatek.com>
	 <581fc075-25d8-4104-a4ee-8c97e1a017e6@collabora.com>
	 <03c523e66fd56442f49c38456476cf18be59e8fb.camel@mediatek.com>
	 <8203317e-7f99-4ea5-bda0-fcd791602a9f@collabora.com>
In-Reply-To: <8203317e-7f99-4ea5-bda0-fcd791602a9f@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEYPR03MB7508:EE_
x-ms-office365-filtering-correlation-id: a87df6bc-b883-4055-267f-08dd5bfe9ccd
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RWJrMElVOWpPeUxmOG1Na2dtKzByR0FyUEIrSEpBdXJ5bmdWNjFoaEpZOFF2?=
 =?utf-8?B?TU1sOEJDamVXbVBLNXVXcVBvSm5KNWRjOHZwRmUzL2JEZlg4QUVGY0Rib0Vm?=
 =?utf-8?B?RmVGUVBWc3hzZ3VtMVJ3WlROaElPYklNRU9aRnJhaytHV2Z4YjNsenkrRTZ4?=
 =?utf-8?B?QTBBclQxSlRCRkhkQWVIVTRkOUNtekpBeWNwR1RBUUxGbWgzOVdmbCt1b2cy?=
 =?utf-8?B?RWNWWUt2RDR3Y3RkZUlBL01RU1ZPMW5GVlI0MkhCQTA5SWVGMnhOTWU1ZEo1?=
 =?utf-8?B?Tk85VUhWcWNoYjVGMDAzOTVWanpoS0dqNjUxZ2pONnk2SmlvbnlFUEU3eU9r?=
 =?utf-8?B?SnEzUVE0d2pzcEM0MVJwSDF3d29mWUJoRVNpb0FZdWlrYTRKTFZNSnp0VFJn?=
 =?utf-8?B?a2ZyNE9yRDBjbGNJWjhBWFNYakdVQll5TTBkTHM0ZHFlOTRzbWw5NUxYTWdZ?=
 =?utf-8?B?SDUxTDlWMzlNbFZoVWh1RlEzOS8yM2NZdE80YnVSUFA0OVBuSkNVclRIVlhy?=
 =?utf-8?B?VFVWWUVXQ0F3ZUQyUlNtNHBmellocGNSZUVzeHMxbXpLNXdKVUZDZXZQMGNr?=
 =?utf-8?B?NTBpaVoyV1I2NVZjcUJQVjBjK1RabTRHVkQ2dnR0VFEwOTRxcDYyRFRsVVBK?=
 =?utf-8?B?M3gzQjUxT3VZQnhneGlQT3ZqdnRxVkNmbHpwaUZDallwVis2cjNNekczcnZm?=
 =?utf-8?B?UlllQ3NHVS82ZEtKRTR1RHFpS1o2eXlWUFFrd2xLTzR2QktuVVhxU0hha0xX?=
 =?utf-8?B?VWpZWEVrcjVYckw5ZUQ2b0FQMmN2R2IxaWxZU3JOMjZ2YVM1Wi9lc0RaM3Fm?=
 =?utf-8?B?Wm9jbFR2TVNyN2x5NDdzU3B2bXdFRk9SdzJya3FnMXltSkRLejJ4YWpjZnRj?=
 =?utf-8?B?Y2pmenhsRFBDd0JlbFlzaWhWU2pWbVQxcFlpTGIzekZZWkM3VjdvUTh2Tjlx?=
 =?utf-8?B?R1RNcU04Unh4TEVBbjNXL1NxMXV0WDJFVnhJMWJsYkYxY1VTajNwVVhnU0lN?=
 =?utf-8?B?elVKV1UyZzExOEJDbmMxcjZNZmluTENJdXlSckx2M3JaLzlrMlUrV2JOVFRW?=
 =?utf-8?B?bGd4WXZEenRIeUNBdCtOd3pYTVRib09PK1k3T0lHTnBtNHJWWXF1bDVoMWZj?=
 =?utf-8?B?SDJpV2V0Vm1KVXNsOSs0U2ZSYU9pZXdLSGZtbjRSUUJjd3dzM21Vbms5MGh4?=
 =?utf-8?B?LzVrL2RkWU5Na0RuRHBHakJwaEdsSTFEazA0eUNXMkN4ajlTNlJjV3RSZzNh?=
 =?utf-8?B?RWcyL3BxR211UndFeUdjNlNOWnhSbmxXRnlTZHRtU1pRNmpoaDVkQ0Q0djJi?=
 =?utf-8?B?RlE1d3czaklDK0VzMlhoRjFYa2d3MDZoUzV4UU9hWktnbjRBdWtLaHNuZE5r?=
 =?utf-8?B?M3B5MWRGUTAxZ0ZhMzVkNmdIWU9qaXN6TTAvMnl4bTB6K29VT0d5blpidVcz?=
 =?utf-8?B?dmVQd0piQVIxVFk0R2JMOXFIZ0RzbEZvek4zT3hUY2x2dDJqY1BlTjRCWGkv?=
 =?utf-8?B?bEJKb3NJMnA0elFDbDdTSTR6eUNma2Q4eDdLNkJSdFhVRWNxcm9mL2tZOUh1?=
 =?utf-8?B?eXdiWTdmcWZxZjhYS25kRGpXN2dDakFxcUZxMTYyUUtCMjdKZGhqTU5VVy9G?=
 =?utf-8?B?dEZqL0VQanVyS2ZOY0Q2dzRsVE0ya0pRNzk3VnV2a0FYbXQ3RWgxM3FUVzZ5?=
 =?utf-8?B?R0VLTHhGbTdlNlZwQlU4WHZrcG1mU1BBY3NqRy9URlRtRUZyMmdCdUdMM1dt?=
 =?utf-8?B?MUJvc01raHJ2T2t1TXo2MkNlVHBrMlZmK08zajZaSkZpVDN4eE9PbTZxK29l?=
 =?utf-8?B?TkZkTDB4WW1PYlNEcXRQd3RwcnVBNmlVVGtFVllrRVRhOFEwL0c0ay93RDlP?=
 =?utf-8?B?alFWMTJQZStaVmxqUlBHT2tiT2x0SHQ1SUQvR09JRERTNCtOOUlKL2dHUkMy?=
 =?utf-8?Q?OBElGcsy3aXeKe9mowfoYZsKtTHuWi11?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEFSektVSUtiSXFTN3VBbWR3UktNeEFKMStXalZueG40aTQ2dXBhWnJPQ3I0?=
 =?utf-8?B?YzIvQzdTZCt2VURHck1pS05KNHFjL3dJaUQyNjlkV2lOTWMrRnB6SnhnRzU1?=
 =?utf-8?B?VjAxZW1HVnpKS2cwaWgyS2JscXBZYzJjS2cxTFNTNm5wRFk3NnFpSFRhcjJW?=
 =?utf-8?B?NnNDSjduQkIraStsQnpSUC9ONGt3QW5MQlgvTEV1NmtSWFF6bUdpby8wcURP?=
 =?utf-8?B?UjhnRkttanZrRGYyaG14VWhNMDhPYWtBS3FNK1F2TTJ2c09BSzFhR01lTXM2?=
 =?utf-8?B?TC9tK2FNekxmYWpCdmFMekJoYmRYUmc0Q3lYcExldllyVVBlRUY5QzA4bHlU?=
 =?utf-8?B?Mm5FaVVtaFRNL2syVXQ2ZkN1WXU1TllwTXhSMXRub0ZobWJnaEl1UDgxZXZM?=
 =?utf-8?B?QURKQnVTa0FkdU9nRGNhNjZ2ZE95N0RzOWloLzdqK28vYk5yQmZweHEzZmRs?=
 =?utf-8?B?bDE2ZnoxVmV3emtPWUdUTit4NEI4KzRPc05SakFmVk96VVlxOWxYNVFITnM4?=
 =?utf-8?B?WUpmcGhpUXdkTnVBNC8xcjZRTHRFQUgydVl2MnA2b3VrMGMwb2VlK0tySVU0?=
 =?utf-8?B?SEFFMlNqTVJzeHZ0c3RwemN3L1dWb0tDUG1mZUpXMTYzakYyQW1nOUtjL0pF?=
 =?utf-8?B?aXlUQ0VZcUVBNTE0QXlkZ1IwSUJvTS9zSUcvejFYZU9LRlR6YlZjQmJGWEN2?=
 =?utf-8?B?cVhuVmNrZFBGeHg1bzBJeHg3RFhObjlTbmNkM2tYQVRZL1VlSWk3Qk5sL1hT?=
 =?utf-8?B?cGl3aTlMTHlTQjhnOHZvaXJBdnpKcHhVR2RyemJGMTN4WjdxTm9weWRVWUtT?=
 =?utf-8?B?MEk4VG1jbGplUExneStwNnk2dkh2bkFVRHZyOGVDbFErYk5mSnQ4VWs1S1lK?=
 =?utf-8?B?VGVCc1I3M2o0enNkTkRncDg1aGx5bmp5enVoTzVjQmlmenBVaWNONFZwZVlu?=
 =?utf-8?B?T2FZYlRTeUpGUkF3Um1wdklmdHQvMXlLSlVjQjFsWWJVS0ovNzdOWG1FQVIx?=
 =?utf-8?B?eExWN2tsVXVJMWVST1FTMWdKQng5L1hqMVFibGdvU3hRQTVWeTVYblUxSzdZ?=
 =?utf-8?B?OVVubWYwSEZTbHlTZUNZQTM0bGNrU1BBRWxQd3puQUdreFRNZWJhb2VIRUdx?=
 =?utf-8?B?T1RKL1VJR3NUS3M4SlBLalh5VkdjWlR0bnZlVTFJbENMY0FJeXVOV2dYQUJp?=
 =?utf-8?B?VkZJa0tYQTd3UkZWTVg1OVpTL3lZU0crRWs4RGhuU205dVp1M2xIZW9CSk1K?=
 =?utf-8?B?RjZlZ2hqMzI0WXp4c041N0JqT2J4MitPckVpV3c2NEthUmV1aERzSklPeVFH?=
 =?utf-8?B?NUZkR0NqSStzRkdvZ2NnK1RUTC9TSkRRbEhoQkFYdU13dmxZSytlcXgzbzQx?=
 =?utf-8?B?YXEzVzNSNHhVTUVQZ2pFS0RYYUliR3lheTlWSm5JanVYVlMzNFJHdE1QUVV5?=
 =?utf-8?B?ZzNJb0V5Z0YzNXFJaHU1UnlBclEvRUJ5bHZoenhXbG1HbVh4YmhWTU45Sjg0?=
 =?utf-8?B?Ukc1V1hGUTFRK1ViOTR2WGM1UTJrbUdIeTFqVjVrR0xxVTRGczI0elpVMWhP?=
 =?utf-8?B?d0htVit1S0daWU5Qd3dpZ0pBR0VNMnJmV3ZSQS9iNXZ5TlhBRFMzZGN0TFRJ?=
 =?utf-8?B?dmV5NElUWHNiUHNnVEpBNTBwRHh5YjUraGdVR0dLSFFzYlhiWXBRM0ZCRWZ3?=
 =?utf-8?B?RzAxUmVCNmVBaTBHR0x6TllUdkNncnF5dHRtWXFXd3NzaUNpa0ZCMUlsV1RR?=
 =?utf-8?B?a2wzeW8rcjAyVGl2RjJsdXIvaFpabWtuQkN5SlNMWERRZm9VeU5SbmM3cFp5?=
 =?utf-8?B?WnpHd2h4RDRMY1ZRbTBEWlk0RHAyaVJTMFkzRG5qRzJLaHh1aWNvOXJ0dWYw?=
 =?utf-8?B?K0xVWk5EWlhxRlNEdDVpWGk2V213VHRpblRlZ3BtQng3Y2JzaWZYbUhDNXpm?=
 =?utf-8?B?cHhnbmVwWXM1WVpPQksybUNoZXA0K2k5RzIrOTRTSUs3OXJUUGc0c2xVSEx0?=
 =?utf-8?B?SmUwQWxRRTU5cXRZT0dERjlhVmFCdWlGUmFETDF2RWN0L2tlSkxIeFBtRWIw?=
 =?utf-8?B?SkRac0pBbEpXV01va3JrU2xmazduMWJsYnFyZzVSUktZS05MaFRkZzBMM0J6?=
 =?utf-8?B?L1E0bFNvTDYzWTMzY0l3ZmoxR2h2c2psQW8yK0lnZDFyVlpzckxsRUlMMU4x?=
 =?utf-8?B?blE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5574B528E3F2694BB99CAF12EB247FA7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87df6bc-b883-4055-267f-08dd5bfe9ccd
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 15:58:46.6957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rMw20ZFsx+7O18JokavT4hV5KYDijJdcsnwDz9llBF3schvWQ0r6RSaNcV4j5ZIXwKTtHPtf2D/pddFT5Wv93FrZHTtDpinhuv93jx0SMeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7508

T24gV2VkLCAyMDI1LTAzLTA1IGF0IDEyOjAzICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMDUvMDMvMjUgMTA6NDYsIEphc29u
LUpIIExpbiAo5p6X552/56WlKSBoYSBzY3JpdHRvOg0KPiA+IE9uIFR1ZSwgMjAyNS0wMy0wNCBh
dCAxMDozNSArMDEwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8NCj4gPiB3cm90ZToNCj4g
PiA+IA0KPiA+ID4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMNCj4gPiA+IHVudGlsDQo+ID4gPiB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IElsIDE4LzAy
LzI1IDA2OjQxLCBKYXNvbi1KSCBMaW4gaGEgc2NyaXR0bzoNCj4gPiA+ID4gV2hlbiBHQ0UgZXhl
Y3V0ZXMgaW5zdHJ1Y3Rpb25zLCB0aGUgY29ycmVzcG9uZGluZyBoYXJkd2FyZQ0KPiA+ID4gPiBy
ZWdpc3Rlcg0KPiA+ID4gPiBjYW4gYmUgZm91bmQgdGhyb3VnaCB0aGUgc3Vic3lzIElELiBGb3Ig
aGFyZHdhcmUgdGhhdCBkb2VzIG5vdA0KPiA+ID4gPiBzdXBwb3J0DQo+ID4gPiA+IHN1YnN5cyBJ
RCwgaXRzIHN1YnN5cyBJRCB3aWxsIGJlIHNldCB0byBpbnZhbGlkIHZhbHVlIGFuZCBpdHMNCj4g
PiA+ID4gcGh5c2ljYWwNCj4gPiA+ID4gYWRkcmVzcyBuZWVkcyB0byBiZSB1c2VkIHRvIGdlbmVy
YXRlIEdDRSBpbnN0cnVjdGlvbnMuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIGNvbW1pdCBhZGRz
IGEgcGFfYmFzZSBwYXJzaW5nIGZsb3cgdG8gdGhlIGNtZHFfY2xpZW50X3JlZw0KPiA+ID4gPiBz
dHJ1Y3R1cmUNCj4gPiA+ID4gZm9yIHRoZXNlIHVuc3VwcG9ydGVkIHN1YnN5cyBJRCBoYXJkd2Fy
ZS4NCj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IERvZXMgdGhpcyB3b3JrIG9ubHkgZm9yIHRoZSBN
TUlORlJBIGxvY2F0ZWQgR0NFcywgb3IgZG9lcyB0aGlzDQo+ID4gPiB3b3JrDQo+ID4gPiBhbHNv
IGZvcg0KPiA+ID4gdGhlIGxlZ2FjeSBvbmVzIGluIE1UODE3My84My84OC85Mi85NSAvLyBNVDY3
OTUvNjg5My9ldGM/DQo+ID4gPiANCj4gPiA+IEluIG9yZGVyIHRvIGFjdHVhbGx5IHJldmlldyBh
bmQgZGVjaWRlLCBJIGRvIG5lZWQgdG8ga25vdyA6LSkNCj4gPiA+IA0KPiA+IA0KPiA+IFllcywg
aXQncyBmb3IgdGhlIFNvQ3Mgd2l0aG91dCBzdWJzeXMgSUQsIGl0J3Mgbm90IHJlbGF0ZWQgdG8g
dGhlDQo+ID4gTU1JTkZSQS4NCj4gPiANCj4gPiBUaGlzIGNhbiBhbHNvIHdvcmsgb24gTVQ4MTcz
LzgzLzkyLzk1IC8vIE1UNjc5NS82ODkzL2V0Yy4NCj4gPiBZb3UgY2FuIHJlbW92ZSB0aGUgYG1l
ZGlhdGVrLGdjZS1jbGllbnQtcmVnYCBwcm9wZXJ0aWVzIGluIHRoZWlyDQo+ID4gZHRzaQ0KPiA+
IGFuZCBjaGVycnktcGljayB0aGlzIHNlcmllcyB0byB2ZXJpZnkgaXQuIDotKQ0KPiA+IA0KPiAN
Cj4gVGhpcyBpcyBjdXJpb3VzIC0gYW5kIHRoYXQgYnJpbmdzIG1vcmUgcXVlc3Rpb25zIHRvIHRo
ZSB0YWJsZSAoZm9yDQo+IGN1cmlvc2l0eQ0KPiBtb3JlIHRoYW4gYW55dGhpbmcgZWxzZSBhdCB0
aGlzIHBvaW50KS4NCj4gDQo+IFNpbmNlIHRoaXMgaXMgYSB3YXkgdG8gbWFrZSB1c2Ugb2YgdGhl
IENNRFEgZm9yIGFkZHJlc3MgcmFuZ2VzIHRoYXQNCj4gYXJlIG5vdCB0aWVkDQo+IHRvIGFueSBz
dWJzeXMgaWQgKGhlbmNlIG5vIGdjZS1jbGllbnQtcmVnIGFuZCBqdXN0IHBoeXNpY2FsIGFkZHJl
c3MNCj4gcGFyc2luZyBmb3INCj4gZ2VuZXJhdGluZyBpbnN0cnVjdGlvbnMpLCBkbyB5b3Uga25v
dyB3aGF0IGFyZSB0aGUgcGVyZm9ybWFuY2UNCj4gaW1wbGljYXRpb25zIG9mDQo+IHVzaW5nIHRo
aXMsIGluc3RlYWQgb2Ygc3Vic3lzIElEcyBvbiBTb0NzIHRoYXQgZG8gc3VwcG9ydCB0aGVtPw0K
PiANCg0KVGhlIG1haW4gYWR2YW50YWdlIG9mIHVzaW5nIHN1YnN5cyBJRCBpcyB0byByZWR1Y2Ug
dGhlIG51bWJlciBvZg0KaW5zdHJ1Y3Rpb24uDQpXaXRob3V0IHN1YnN5IElELCB5b3Ugd2lsbCBu
ZWVkIG9uZSBtb3JlIGBBU1NJR05gIGluc3RydWN0aW9uIHRvIGFzc2lnbg0KdGhlIGhpZ2ggYnl0
ZXMgb2YgdGhlIHBoeXNpY2FsIGFkZHJlc3MuDQoNCkUsZy4gSW4gbXQ4MTk1LWdjZS5oOiAjZGVm
aW5lIFNVQlNZU18xYzAwWFhYWCAzDQoNCklmIHlvdSB3YW50IEdDRSB0byB3cml0ZSB0aGUgdmFs
dWUgMHgwMDAwMDAwZiB0byAweDFjMDBfMDAyYy4NCg0KV2l0aCBzdWJzeXMgSUQsIHlvdSBjYW4g
dXNlIG9ubHkgb25lIGluc3RydWN0aW9uIHRvIGFjaGlldmUgaXQ6DQoxLiBXUklURSB2YWx1ZTog
MHgwMDAwMDBmIHRvIHN1YnN5czogMHgzICsgb2Zmc2V0OiAweDAwMDJjDQotIE9QIGNvZGU6IFdS
VElFID0gMHg5MA0KLSBzdWJzeXMgSUQ6IDB4MWMwMFhYWFggPSAweDAzDQotIG9mZnNldDogMHgw
MDJjDQotIHZhbHVlOiAweDAwMDAwMDBmDQoNCldpdGhvdXQgc3Vic3lzIElELCB5b3Ugd2lsbCBu
ZWVkIDIgaW5zdHJ1Y3Rpb25zIHRvIGFjaGlldmUgaXQ6DQoxLiBBU1NJR04gYWRkcmVzcyBoaWdo
IGJ5dGVzOiAweDFjMDAgdG8gR0NFIHRlbXAgcmVnaXN0ZXI6IFNQUjANCi0gT1AgY29kZTogTE9H
SUMgPSAweGEwDQotIGFyZ190eXBlOiByZWdpc3RlciwgdmFsdWUsIHZhbHVlID0gKDB4OCkNCi0g
c3ViIE9QOiBBU1NJR04gPSAweDANCi0gcmVnaXN0ZXIgaW5kZXggdG8gc3RvcmUgdGhlIGFzc2ln
biB2YWx1ZTogU1BSMCA9IDB4MA0KLSB2YWx1ZSB0byBhc3NpZ246IDB4MWMwMA0KMi4gV1JJVEUg
dmFsdWU6IDB4MDAwMDAwMGYgdG8gdGVtcCByZWdpc3RlcjogU1BSMCArIG9mZnNldDoweDAwMmMN
Ci0gT1AgY29kZTogV1JJVEUgPSAweDkwDQotIHN1YiBPUCh0ZW1wIHJlZ2lzdGVyIGluZGV4KTog
U1BSMCA9IDB4MA0KLSBvZmZzZXQgZm9yIHRlbXAgcmVnaXN0ZXI6IDB4MDAyYw0KLSB2YWx1ZTog
MHgwMDAwMDAwZg0KDQo+IEJlaW5nIGNsZWFyOiBpZiB3ZSB3ZXJlIHRvIG1pZ3JhdGUgYSBTb0Mg
bGlrZSBNVDgxOTUgdG8gdXNpbmcgdGhpcw0KPiBnbG9iYWxseQ0KPiBpbnN0ZWFkIG9mIHVzaW5n
IHN1YnN5cyBpZHMsIHdvdWxkIHRoZSBwZXJmb3JtYW5jZSBiZSBkZWdyYWRlZD8NCj4gQW5kIGlm
IHllcywgZG8geW91IGtub3cgYnkgaG93IG11Y2g/DQo+IA0KDQpFLGcuIElmIHRoZSBpbnN0IG51
bWJlciB3aXRoIHN1YnN5cyBJRCBpcyBOLg0KMS4gSWYgQ01EUSBpcyBpbXBsZW1lbnQgbGlrZSB0
aGlzLCB0aGVuIGluc3QgbnVtYmVyIHdpbGwgYmUgKE4gKiAyKToNCmFzc2lnbiBTUFIwID0gMHgx
YzAwDQp3cml0ZSBBIHRvIFNQUjAgKyBvZmZzZXQ6IDB4MmMgDQphc3NpZ24gU1BSMCA9IDB4MWMw
MA0Kd3JpdGUgQiB0byBTUFIwICsgb2Zmc2V0OiAweDNjIA0KYXNzaWduIFNQUjAgPSAweDFjMDAN
CndyaXRlIEMgdG8gU1BSMCArIG9mZnNldDogMHg0YyANCi4uLg0KDQoyLiBJZiBDTURRIGlzIGlt
cGxlbWVudCBsaWtlIHRoaXMsIHRoZSBpbnN0IG51bWJlciB3aWxsIGJlIChOICsgMSAqIG4pOg0K
YXNzaWduIFNQUjAgPSAweDFjMDANCndyaXRlIEEgdG8gU1BSMCArIG9mZnNldDogMHgyYyANCndy
aXRlIEIgdG8gU1BSMCArIG9mZnNldDogMHgzYw0Kd3JpdGUgQyB0byBTUFIwICsgb2Zmc2V0OiAw
eDRjDQouLi4NCg0KV2hlbiB0aGUgc2FtZSBjbWQgYnVmZmVyIGNoYW5nZXMgdGhlIGJhc2UgYWRk
cmVzcyBmb3IgbiB0aW1lczoNCmFzc2lnbiBTUFIwID0gMHgxYzAwDQp3cml0ZSBBIHRvIFNQUjAg
KyBvZmZzZXQ6IDB4MmMNCmFzc2lnbiBTUFIwID0gMHgxYzAxDQp3cml0ZSBCIHRvIFNQUjAgKyBv
ZmZzZXQ6IDB4MmMNCmFzc2lnbiBTUFIwID0gMHgxYzAyDQp3cml0ZSBDIHRvIFNQUjAgKyBvZmZz
ZXQ6IDB4MmMNCmFzc2lnbiBTUFIwID0gMHgxYzAwDQp3cml0ZSBEIHRvIFNQUjAgKyBvZmZzZXQ6
IDB4M2MNCi4uLg0KDQpTbyB5b3UgY2FuIGltYWdpbmUgdGhlIHBlcmZvcm1hbmNlIHdpbGwgaW5j
cmVhc2UsIGJ1dCBtYXliZSBub3QgdG9vDQptdWNoIGlmIHdlIHVzZSBpdCBpbiB0aGUgcmlnaHQg
d2F5Li4uDQpFeGNlcHQgdGhlIG9sZCBTb0MgdGhhdCBkaWRuJ3Qgc3VwcG9ydCBTUFIgYW5kIENQ
Ui4gVGhlIHJlYXNvbiB3aWxsIGJlDQphZGRyZXNzZWQgaW4gdGhlIG5leHQgcGFyYWdyYXBoLg0K
DQo+IFdoYXQgeW91J3JlIHByb3Bvc2luZyBhbG1vc3QgbG9va3MgbGlrZSBiZWluZyB0b28gZ29v
ZCB0byBiZSB0cnVlIC0NCj4gYW5kIG1ha2VzDQo+IG1lIHdvbmRlciwgYXQgdGhpcyBwb2ludCwg
d2h5IHRoZSBzdWJzeXMgaWQgd2FzIHVzZWQgaW4gdGhlIGZpcnN0DQo+IHBsYWNlIDotKQ0KPiAN
Cg0KVGhhdCdzIGJlY2F1c2Ugb2YgdGhlIG9sZCBHQ0UgdmVyc2lvbiBpbiB0aGUgb2xkIFNvQyBv
bmx5IHN1cHBvcnQgR1BSLA0KaXQgZGlkbid0IHN1cHBvcnQgU1BSIGFuZCBDUFIuDQoNCkdQUjoN
CkFsbCAzMiBHQ0UgdGhyZWFkcyBzaGFyZSB0aGUgc2FtZSBHUFIwfkdQUjE1LCBHUFIgd2lsbCBi
ZSBhZmZlY3RlZCBieQ0Kb3RoZXIgR0NFIHRocmVhZHMgaWYgdGhleSB1c2UgaXQgYXQgdGhlIHNh
bWUgdGltZS4NCg0KU1BSOg0KRWFjaCBHQ0UgdGhyZWFkIGhhcyA0IFNQUiwgU1BSIHdvbid0IGJl
IGFmZmVjdGVkIGJ5IGFub3RoZXIgR0NFIHRocmVhZC4NCg0KQ1BSOg0KQWxsIDMyIEdDRSB0aHJl
YWRzIHNoYXJlIHRoZSBzYW1lIENQUiwgdGhlcmUgYXJlIG92ZXIgMTAwMCBDUFIgY2FuIGJlDQp1
c2VkLiBJdCBuZWVkIHRvIGJlIG1hbmFnZWQgcHJvcGVybHkgdG8gYXZvaWQgdGhlIHJlc291cmNl
IGNvbmZsaWN0aW5nLg0KDQpEdWUgdG8gdGhlIEdQUiByZXNvdXJjZSByZXN0cmljdGlvbiBpbiB0
aGUgb2xkIEdDRSB2ZXJzaW9uLCB0aGUgdXNhZ2UNCm9mIHN1YnN5cyBJRCBjYW4gYXZvaWQgR1BS
IGNvbmZsaWN0aW5nIGlzc3VlcyB3aGVuIG11bHRpcGxlIEdDRSB0aHJlYWRzDQphcmUgdXNpbmcg
R1BSIHRvIHBoeXNpY2FsIGFzc2lnbiBoaWdoIGJ5dGVzIGFsbCB0aGUgdGltZS4NCg0KDQpJIGhh
dmUgc2ltcGxpZmllZCBzb21lIGNvbXBsaWNhdGUgaW5zdHJ1Y3Rpb24gcnVsZXMsIHNvIHRoZSBk
ZXNjcmlwdGlvbg0KYWJvdmUgbWF5IG5vdCBiZSAxMDAlIG1hdGNoZWQgdG8gdGhlIENNRFEgaGVs
cGVyIGRyaXZlciBjb2RlLg0KQnV0IEkgdGhpbmsgdGhlIG1haW4gY29uY2VwdCBpcyBjb3JyZWN0
Lg0KSG9wZSB0aGVzZSBleHBsYW5hdGlvbiBjYW4gaGVscCB3ZWxsIDotKQ0KDQpSZWdhcmRzLA0K
SmFzb24tSkggTGluDQoNCj4gQ2hlZXJzIQ0KPiBBbmdlbG8NCj4gDQo+ID4gUmVnYXJkcywNCj4g
PiBKYXNvbi1KSCBMaW4NCj4gPiANCj4gPiA+IFRoYW5rcywNCj4gPiA+IEFuZ2Vsbw0KPiA+ID4g
DQo+ID4gPiANCj4gPiANCj4gDQo+IA0KPiANCg0K

