Return-Path: <linux-media+bounces-28516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E57A69EE1
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 04:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAE9C1899637
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 03:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF271EB9F3;
	Thu, 20 Mar 2025 03:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Qs3IcHet";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="eIDd4pRn"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F6515C0;
	Thu, 20 Mar 2025 03:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742442814; cv=fail; b=J7Z5A7CtNlC96L1ZLxZOl8k9duzzevSf+yJgFG51IT5nHDzqgqUjDdWwQUan+1mQ/YzGeIJSVGeH3T0Y56/QJPR3cmipI1ZN1Vwgcp6hrM/F5Y5yC2q2OCq8QiVfoCs88eINecEv8DMn2kAq4Swqixvq7SCYYPGZHv/Z2zeVIl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742442814; c=relaxed/simple;
	bh=+wecwtRrGzsoU8s2d8Q5oEzACHf4iDGw6j1H3hY3UDU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O+bNIJQCUijs7JMnj45Ie1GbW8W/Gs8C84KGMbfI5bnTa8uN3qZI+rwoZdCYYNsUd2AqQrxyZUb8/vb/foVwnQB+YyAHxwqDpMxa7KpEdzisnoXftQhA4lcCDnbqeeKqeq72WKfeF/0HBi8p4+qLvNqXvJLjBH3vJNpnWfBKBNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Qs3IcHet; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=eIDd4pRn; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: dfc4c722053e11f08eb9c36241bbb6fb-20250320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=+wecwtRrGzsoU8s2d8Q5oEzACHf4iDGw6j1H3hY3UDU=;
	b=Qs3IcHetlbuWkCUZ28jxaQ95d6iDQZcd6KXTkqEsyZgsVvSEt1I0DyFFYUYpOXfyZjEGzGOJ6rFUJtTlPNeDriYSNtbWfX1hxg9R+L3GPDEuFg7e+juQi1ssslnlWDvB6hw5MYZ/OkAM4ejQDusNg+s9JM4IvxU8dihS006MaS0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b7564d04-c52c-4db5-b78c-063236aa89a3,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:3b9891c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dfc4c722053e11f08eb9c36241bbb6fb-20250320
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1917339729; Thu, 20 Mar 2025 11:53:24 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 20 Mar 2025 11:53:23 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 20 Mar 2025 11:53:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w046MYgyrWw/LksNq+WVdn6zI6t7rA3z2tsOu+stTl5BpwMuY97cIPTqbT/WQHIjp2Nf+ZcRo54L70sURCUW97MwiHfzn1OmiymXzbfd3aRlZNKqIa8FpAVizJZ3WlbK5uyIkYaAtBKPLnK0h84ZOe2FytTqVQowLot3dmOgFp6X9zXEkopHdasrw4b1yP+wMemNIr4Tn/GOGNEwzUQrX0AN9Icg3jlGkOaU9o/mpC2ZM1pgCLfJsUAIQRBln5tLXvS+pyTzIE5f6nYeYTX1Pqlt/yJSQrXjJQzNqlNRaJ05cwm36KUHyCcnT6GPGQx3vgKBux3bX50whrqFAVrQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wecwtRrGzsoU8s2d8Q5oEzACHf4iDGw6j1H3hY3UDU=;
 b=VEVUxTJK6RytqSyTJPHBrqXbfcHHylBkxQjMKrKgVBmmzM6BwZt0k3JtXPcMOpVVhP/wjiL8/ZhsTrwnZElMrdr6wGaYWXMK4CDuaOqaZ3+nOwrEPPbk9JE8EJtBlADSjKkI0HEdRjc694bxODAHk+wq2CTi1ell/kw604CXFtIbL+1mKXa+RiGJNaANmSZ1Ml4XtQhbExcwG9Kul54AcqkPko9+LELReR5vk4HLqItfRC5LzkZHzunZgR/L2Bx1+Cr83puHS3+MVOBosgGm22UEkq6+s2KOMtqI/fwfSDuHxlaKY+YLtxAxAZsXlcTWrGkdPIAc7vBGJEwxP2LJVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wecwtRrGzsoU8s2d8Q5oEzACHf4iDGw6j1H3hY3UDU=;
 b=eIDd4pRnIZU10TyoU8GQsfN2WoxHept9DhXhtTaZ/3zd3bBuMLhBHS4ItmqmENVj1EkG+tIfCLKIAIst+d4671KbCv31UyeThiwol3cvoMWAmap5SQMQi2bmEAKZlHVMIPdxu3kZKLOw++bk+WW6jJ3QfDBNnyZw6e2potsRquo=
Received: from SI2PR03MB6613.apcprd03.prod.outlook.com (2603:1096:4:1e4::12)
 by SEZPR03MB7900.apcprd03.prod.outlook.com (2603:1096:101:184::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 03:53:21 +0000
Received: from SI2PR03MB6613.apcprd03.prod.outlook.com
 ([fe80::b84d:f66c:289f:cb54]) by SI2PR03MB6613.apcprd03.prod.outlook.com
 ([fe80::b84d:f66c:289f:cb54%4]) with mapi id 15.20.8511.026; Thu, 20 Mar 2025
 03:53:20 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	Julien Stephan <jstephan@baylibre.com>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 5/5] arm64: dts: mediatek: mt8365: Add support for
 camera
Thread-Topic: [PATCH v8 5/5] arm64: dts: mediatek: mt8365: Add support for
 camera
Thread-Index: AQHbbNbONvB6SCAlN0WiFT5uEG3PTLN7vY8A
Date: Thu, 20 Mar 2025 03:53:20 +0000
Message-ID: <7a67beb636d0b342691b52a0fd39d5c7348fc074.camel@mediatek.com>
References: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
	 <20250122-add-mtk-isp-3-0-support-v8-5-a3d3731eef45@baylibre.com>
In-Reply-To: <20250122-add-mtk-isp-3-0-support-v8-5-a3d3731eef45@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6613:EE_|SEZPR03MB7900:EE_
x-ms-office365-filtering-correlation-id: d9f461f6-e19c-4232-42f3-08dd6762c19a
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c3ZSWHpRaXdUTE55ZXJVSEk2cjhhSHpZcWVOZEpsYWxuNnlJTHp0ZFA0SVpw?=
 =?utf-8?B?U2N5UUhoRkhVQ0tSa1VZVXlaQ3ZsUGlzWkM4dllrR0lYd05Ha0JuSnlZTmdB?=
 =?utf-8?B?YUZSWENpUzhheGpwT3Z1OFZvRHBlSm54Uit3VzIrNGVuT0FIRGNocC93RTls?=
 =?utf-8?B?aFNobGYwK0pLNTIybllKK2dpTTNCU3ZqdWZyUC9HV2JvL25EQTBnVWFiMlhk?=
 =?utf-8?B?L2tkeEFJZ0pJMVVZejhSbmlYZjdYNjFrb3dRUnd6TXg5cWdpZzNxS29oSC8r?=
 =?utf-8?B?UDdWRWRsc1VvN0J2Nkh1bjFOb1NMbUpzQmo0SVI3SkZkME1PUVZtb3NzTHBR?=
 =?utf-8?B?SlhQbzFFWnZPcDd4ajNVNGw0SlA0SDBua1htWHA3SGdNRWdlcW5FYkhwSnQv?=
 =?utf-8?B?SXVKZDNldHh6RkpRTkc3UWc1THN0UnJSalorUWR4cnc0YjZoWll3VFJHdmR4?=
 =?utf-8?B?K0hFejZOdWZwTTZyRHAwSS9XVzNZbEpUUFFmYlVrSnFtcTB1YXJPUFpHSU5Z?=
 =?utf-8?B?QTdzRUVpYnZseVRWOStJaXpoN0x0NmZIVFJpNk1ZeWROT09RS1dHRHJocy82?=
 =?utf-8?B?TFIzQ1pSQmlNa3NSZi9jOXdqYnBVWjVqYjRBdmExQlRZUVVwby9tRGZtWWE3?=
 =?utf-8?B?UTR1RlFNT2pqYTBoRTBBN2RYSDErY3JhWkZxWlFDdU9KME9zSzJRWGlUSDhH?=
 =?utf-8?B?RllqR0k1a1IyQWpVUUREWGFManpFZWVCV3JuSy93K1Bkbi9JeDhwVWJkQWJB?=
 =?utf-8?B?THhiQmpxOUZpK1NIbFBtcG1QdDM0YXJZU04rUkVFL0ZuLzVheDhmOWRxUzJB?=
 =?utf-8?B?WUtBV3BqM0srV2VybGNlME43S1FrcHlMZklCK0ZlRjQ2MVZmNHRkR2tpaURw?=
 =?utf-8?B?bnA4SmhYNndpNHI4TlZUV004TGJVcDBVcE5EOGpkeUtpanF3NnRGMllYMTRP?=
 =?utf-8?B?S2ZzcjJ5YlBkYmhqU3cwRUZDMkZ6VENLRldBb3AvNFdzWVBEZmJUT29EeVFs?=
 =?utf-8?B?RFhQTmJrUmZwNXpPR3JYbU5SNW9pMVJZekF6VUFlK3BxSkl5OEI4YUhVRU44?=
 =?utf-8?B?aVExN2QzWFZWemwxSTJhMGV4TkNpbldJbXd2aGNwa1lkWEZPQWdPRUpIODJB?=
 =?utf-8?B?dU9OdHR0T243M2JZMTFmNWoxSDhZNXEwT2NRWkEwRHJ0QitqNi9ESWE3Q3dn?=
 =?utf-8?B?bFROd05heUZLYVZwNmszNndpbG5SaHk3Vm9SOXN1ZXpVR3JrckRaNVF6T2JV?=
 =?utf-8?B?NDlSK0txZXM4c1lwcnUyUVduMmptUUUrSmJZdXMyZTdaRTFRcVFVOHFlV3BB?=
 =?utf-8?B?MVlhclQxNGt2R2JoQ3FJSUNHTTE3QXFHamZScG5TNUhycm9HSXlSMEl5ZnBx?=
 =?utf-8?B?dG93U2FUVVRVNDVLR0x6Vm90N3lOa3lqckJEbVNOSzhNR01WM1RRd2RZMzhY?=
 =?utf-8?B?SEY0TGhHc2s4NmRPZWlQS2lkc21kVXZ1OGpIZWxuTFgwL2pjMUxYRjd1TFhs?=
 =?utf-8?B?RENjYm9NMXkxZWQxSEVxYTlYU2tEUEloOVltUkxGdDE5ME1EWUZER2hBa1FU?=
 =?utf-8?B?UDlsaDFTaktaakNFNklXcmp2UDNzTVNqNStsWEdrMCtubDBhR3hQUE5sQXBC?=
 =?utf-8?B?V3JBL3oybDMzWHgzSlp5cms3MVVXclVKMWtTeHF4anhXNFlkalJGOHFSMStV?=
 =?utf-8?B?MitjT0xtZ0IrNEFTOHNEaEl6UXIxc0o2OSs4QmVQUFRBT3hXVEJhdVFtbUJP?=
 =?utf-8?B?WWFlL2xmWC9KdWdIdVJiSlRxaHJRYVBJb3NaQUp3UUhncWpJeit5TkpoZlQ0?=
 =?utf-8?B?TFExZnBvVVVScDNLbHNLSEE0N1dqWXMwSDBsZXNKdFJoc01aZncraGxtTUtI?=
 =?utf-8?B?a2d2dVo2aU0vTDhheVp0cXlYR0tNckhHN2laK3Y5eWlEZ1NNeTdQcGVZaDNZ?=
 =?utf-8?Q?92K9BK30cNV4idSX06fKrH18/mSH1ggr?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6613.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVFIaURjdmZCc1NrSEtzUDlZMGd5TEppRGRxZFQ2QTlmdTB4aitJYk4zajJZ?=
 =?utf-8?B?RXBLQWU4NUVObDd3bnRsMjBiWFVVWVJhUEtxUWxQNnZXWW96aGpxdU9UaDZv?=
 =?utf-8?B?MERGaU5OQ1BJemZJV2RBQlpReVBDV2VyT05CbjNHazllRWYvMjRkVnBtN28y?=
 =?utf-8?B?bWRsbFVjaWc0Y1R1T1VkK3ZPckZwK3pzUERVZ3owU3MzOHVzZ1RNc0V0VTI4?=
 =?utf-8?B?N2xjV0NEc01NU2ZzWDlEN3hXZWFCMUpQazZHYjNNSGwzVHR1NG5kUFp3NnFL?=
 =?utf-8?B?dlgvcEQ1ZnRmZmRkQWNFNFhRVTBBa09tT0w1czRjSEIzTjhSc3R4aXhBNVlC?=
 =?utf-8?B?aVBjRUkyeFR1Ri9JZEVBMUE0U2FEcGtnY0J2aktZMHhQM1Iza3FTbTlmYUpW?=
 =?utf-8?B?a2FSNzF6RzJwQTlwZUNyd2F2VEdOL1ZjL2NYRnA1NzBrU25WSkJvTXQ5ZVo4?=
 =?utf-8?B?ZTh3eWk5ZzMxYTFJNi9Ob3RHa3o0WFpZNVNKaG1zTVFZVWlTTFpOYzIrVUlu?=
 =?utf-8?B?cndSWUhxdlQvd0t6UUtobmtHUXd2ZkE0MFdKQXE2dG9sS2JLWUpLSmcwY3hX?=
 =?utf-8?B?S0VObGxRS2I2OXdjQ09MSGVVYmxyNldmbTdGWU02QUYwL3dHczRWUUIvYlhB?=
 =?utf-8?B?dWJOYWFPVkhNNkhCV2xkcG9kOWZxOEM3ekJldU9FeUc0SkQweE1nZDlsN3NP?=
 =?utf-8?B?czBPTHdrd1dJT3BFdDk1Rm9yY1VaZERUU1dGOFVxUE1JcVRCT3lrVTJWQzFi?=
 =?utf-8?B?U1FySU1FajZkYkNGK2wzaFlGTFc4dHZ4UE12RzJVZU1lVjZyWVNuR3BaYVpL?=
 =?utf-8?B?N2VFZUZCQkppYm9VUHU5QlpONHoyREZxcEhJMm92QjJpM0tjOG1Vb215dXFa?=
 =?utf-8?B?MDh5bzFiUFg1aFFmMitaNHRHb29HNXNnbVRvZzNrZU5yLzIwM0F3WkxMVlZv?=
 =?utf-8?B?bEF1Ym1VdGoyMmdmUkxlSWlZYk4xbVA0b0NIYkZidmJicEJlTVUvS3JwcDBG?=
 =?utf-8?B?RmUyTEdLQkd6Y256azg1cFV0Nzh5ejFEcEE2dnYxSzhnaExadnZGbmFtaHFh?=
 =?utf-8?B?Y0l4L3RwalVMVjFJY1VHMElHQ2VHSnZ3dk9Dd25SSW5LZmJOYlR0VkNZNnpH?=
 =?utf-8?B?Y2ZZQWFrRkgrZFRJVDlpOHNhQjhjY0RSZmlDVmVHTGdsYXdzVjk0Y2ZJWWtS?=
 =?utf-8?B?cWF4T3p5d2NyT1pvbU5LU1UzcUhTNEdRRm5JeXEvQTVBN2RmaVBDa3B3YVRz?=
 =?utf-8?B?djlKQjNhcUVmb3Avd1JocUs4ZG82ZjU5a01HaGZmalA1Umllb1RsM014ZW1p?=
 =?utf-8?B?eGZXZ2V1Uml6NjN1QlpRdE1oalgrOGw1b3VWQnR3VEF4eWUyY2hZTXJjL0F5?=
 =?utf-8?B?RlNuRjhra1dPQUQ5R1lCK3R1MlJiOGNkRVNLWG5xdzgyalR2aHdyeGhIMncw?=
 =?utf-8?B?ZUJJNmdpWU1FSVltOVR2UXJFYW9sYXc3Zmovc3dhOWNnRGZqMmdpUGhpZWhI?=
 =?utf-8?B?SnJZTHJvRTFVUTZpK1IvY21JM1gyZGRVaUFKSGJFWnF2VmN3aG0wazNPWktv?=
 =?utf-8?B?Qmp5bDRtaExIYnNNMytIb3dGcFE3a0hJWU8rVitlaG56ay80RVhkNDIxSXRx?=
 =?utf-8?B?NUx5bGF2UjRISjNBQllEV2ZuM0gxR3dIZTQwTTc1YkZ0UFg2UDlmZnNhTUc5?=
 =?utf-8?B?UGZGZ2JOYjQ1aGlNOFJkSGFHZjZBdjZRSGpET015YjRtYnlBb05YRnl6ZVZJ?=
 =?utf-8?B?VGFaMUtDNE1ua29mTWljenVFVStjU1prMngyVHBSOTRuTkhUYVZvUHZDZE5l?=
 =?utf-8?B?aW5hQTh1blMycHJZM2ticjdCalVWZS9Lek93U1UxcnF4RVFCQlZZWGp1dFl6?=
 =?utf-8?B?bjRDTUZyYXBzbEJWaGZIenFkWEdEV2tRU2N3QlFVUzBiRlI2V3Rmbml5NGhW?=
 =?utf-8?B?WlUwZzY0eTZ0Tjkwd0NxbmQ0LzhVUWx3TmRCcjlaakJaNzUzeTZ4eVV2clFv?=
 =?utf-8?B?TVo1OHpMbUEzaWZXeGJHRjJ2bHZFNjk3WVVxYjNTUU1EZ0x4aXFpQ3h3bGl6?=
 =?utf-8?B?dDNOR0phemFpM0JjNGRYQ1JKQjcyYUp2VzZoRmVibExEOXZ2OUZycXU3Q1NO?=
 =?utf-8?B?M1FmOU5lZUNIMTV4eWM0VFVjSE9Mc28rUzU4T3hka2dFb1hiWTRrV3ZiNlhw?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2F6F908A823B94AB2F625E5FD1E04B6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6613.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f461f6-e19c-4232-42f3-08dd6762c19a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 03:53:20.8913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RjmaLWLGH2uu4nHoUAWwTYeTAS0q9X/DMpafg0yVl42T4bCXxqKlt+ra/yGqsnteW4I/n2mY2u/1bn/Kr8BNKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7900

T24gV2VkLCAyMDI1LTAxLTIyIGF0IDE0OjU5ICswMTAwLCBKdWxpZW4gU3RlcGhhbiB3cm90ZToN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVu
dC4NCj4gDQo+IA0KPiBBZGQgYmFzZSBzdXBwb3J0IGZvciBjYW1lcmFzIGZvciBtdDgzNjUgcGxh
dGZvcm1zLiBUaGlzIHJlcXVpcmVzIG5vZGVzDQo+IGZvciB0aGUgc2Vuc29yIGludGVyZmFjZSwg
Y2Ftc3YsIGFuZCBDU0kgcmVjZWl2ZXJzLg0KPiANCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGlu
Y2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNvbT4NCj4gLS0tDQoNCltzbmlw
XQ0KDQo+ICsNCj4gKyAgICAgICAgICAgICAgIGNhbXN2MTogY2Ftc3ZAMTUwNTAwMDAgew0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODM2NS1jYW1z
diI7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4MTUwNTAwMDAgMCAweDAw
NDA+LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MCAweDE1MDUwMjA4IDAgMHgw
MDIwPiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDAgMHgxNTA1MDQwMCAwIDB4
MDEwMD47DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAx
ODYgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tz
ID0gPCZjYW1zeXMgQ0xLX0NBTT4sDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDwmY2Ftc3lzIENMS19DQU1URz4sDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDwmY2Ftc3lzIENMS19DQU1TVjA+Ow0KPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1u
YW1lcyA9ICJjYW0iLCAiY2FtdGciLCAiY2Ftc3YiOw0KPiArICAgICAgICAgICAgICAgICAgICAg
ICBpb21tdXMgPSA8JmlvbW11IE00VV9QT1JUX0NBTV9JTUdPPjsNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgbWVkaWF0ZWssbGFyYiA9IDwmbGFyYjI+Ow0KDQpiaW5kaW5nIGRvY3VtZW50IGhh
cyBubyBsYXJiIHByb3BlcnR5LCBkcm9wIGl0Lg0KDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHBvd2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgzNjVfUE9XRVJfRE9NQUlOX0NBTT47DQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ICsNCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcG9ydHMgew0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICNzaXplLWNlbGxzID0gPDA+Ow0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBv
cnRAMCB7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8
MD47DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjYW1zdjFfZW5k
cG9pbnQ6IGVuZHBvaW50IHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZzZW5pbmZfY2Ftc3YxX2VuZHBvaW50PjsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgfTsN
Cj4gKyAgICAgICAgICAgICAgIH07DQo+ICsNCj4gKyAgICAgICAgICAgICAgIGNhbXN2MjogY2Ft
c3ZAMTUwNTA4MDAgew0KPiArICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODM2NS1jYW1zdiI7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDww
IDB4MTUwNTA4MDAgMCAweDAwNDA+LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
MCAweDE1MDUwMjI4IDAgMHgwMDIwPiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
PDAgMHgxNTA1MGMwMCAwIDB4MDEwMD47DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVy
cnVwdHMgPSA8R0lDX1NQSSAxODcgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgY2xvY2tzID0gPCZjYW1zeXMgQ0xLX0NBTT4sDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDwmY2Ftc3lzIENMS19DQU1URz4sDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDwmY2Ftc3lzIENMS19DQU1TVjE+Ow0KPiArICAgICAgICAgICAg
ICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJjYW0iLCAiY2FtdGciLCAiY2Ftc3YiOw0KPiArICAg
ICAgICAgICAgICAgICAgICAgICBpb21tdXMgPSA8JmlvbW11IE00VV9QT1JUX0NBTV9JTUdPPjsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgbWVkaWF0ZWssbGFyYiA9IDwmbGFyYjI+Ow0KDQpE
aXR0by4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcG93ZXIt
ZG9tYWlucyA9IDwmc3BtIE1UODM2NV9QT1dFUl9ET01BSU5fQ0FNPjsNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gKw0KPiArICAgICAgICAgICAgICAg
ICAgICAgICBwb3J0cyB7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8MT47DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI3NpemUt
Y2VsbHMgPSA8MD47DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9ydEAwIHsN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNhbXN2Ml9lbmRwb2ludDog
ZW5kcG9pbnQgew0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JnNlbmluZl9jYW1zdjJfZW5kcG9pbnQ+Ow0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB9Ow0KPiArICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiArICAg
ICAgICAgICAgICAgfTsNCj4gKw0KPiAgICAgICAgICAgICAgICAgdmRlY3N5czogc3lzY29uQDE2
MDAwMDAwIHsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgzNjUtdmRlY3N5cyIsICJzeXNjb24iOw0KPiAgICAgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MCAweDE2MDAwMDAwIDAgMHgxMDAwPjsNCj4gDQo+IC0tDQo+IDIuNDcuMQ0KPiANCj4g
DQoNCg==

