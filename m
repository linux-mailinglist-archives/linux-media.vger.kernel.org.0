Return-Path: <linux-media+bounces-62075-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF5aLILOC2oaOQUAu9opvQ
	(envelope-from <linux-media+bounces-62075-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:44:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AC1576863
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED461304C7DE
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 02:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF0F3290D5;
	Tue, 19 May 2026 02:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hU22TInh";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="daLjw9oi"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D9F326928;
	Tue, 19 May 2026 02:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779158577; cv=fail; b=ZA7NNw9c1tbC4AaUaozmxEFJOJK9mNkzTpT9R7vx/L+titx60HxFw9Sn4Avd44O2YGxhCLsrufC4GObAB8Q5ewn3DfDD0CenkqpbSiTbNlEozjiuF4X5/usAsACxUVXVRLssJZulGI6LRMm4YOaGfuBrayLptnc2e943f9BUoGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779158577; c=relaxed/simple;
	bh=LsB+Zo2MmrB8UXgoxLVo+yR4exUfO4gMYvExK/bgMMg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WXt4BK7RWqn5HJlErDkQwr3ZtJWzmAK2mJXc4luKl1Fx5E/h9OYOj8NQSnspLgOraE5giQLgX41xELkjZ2t/2Z7KZR9GBp2KNsyRCPAb6ttycQnlECAA5jc390tVFCit7XiMjfyccnFajOUj252sRLW8TJ2UNQSeNFgq427pMoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hU22TInh; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=daLjw9oi; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 6b187e68532c11f1b5a00d44d12bea5a-20260519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=LsB+Zo2MmrB8UXgoxLVo+yR4exUfO4gMYvExK/bgMMg=;
	b=hU22TInhEW5CiElaJUSvNeAslD5RUx4+iGUdAjH8KxeWwbPLxpQdubJv2bpHom9j6XxNJ2+x4LJd+TOZL7HEVvTADvx44qbfYWAg286UTs7xJpcJT3o2DsRe/qO3PdznTpm7RmOmu+mKvPmumj0gayWwgRuqv3hBIr5/ODXYYuk=;
X-CID-CACHE: Type:Local,Time:202605191042+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:e252e74c-caea-4da7-a053-d978c7a25d2e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:9091e75,CLOUDID:0022f11e-023f-4f87-9e9c-6c116c694fb3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6b187e68532c11f1b5a00d44d12bea5a-20260519
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1812641874; Tue, 19 May 2026 10:42:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 19 May 2026 10:42:45 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 19 May 2026 10:42:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkDLFmVEDtY0FKiU7i6F9y5lwK3OgIQ4pO+CnVakY5bhyJ84k0F9U4583fO7qX3EiqrXjZxJQg69nfRZh+LUygcFrtAWVdBwmcM4Bkek3xkRYlQ/G/TegfnJsE+ieHZlc6vbdPLkovDwJOl4hulCLjEuprP9Oe2470VkzOed5C5LOWChB1yzBh/eYVg5mLY02fLeCdFMvQc2yetyMc40X2evAZy3zvE4Jl3C7bflsiur2GSxva31lO3vUVuza85dt4eqXIA/lAWVpiH0LeiTMl4691Dml7Vv9DfxRb/GAAzjr9RMtKHLIxC/nA9B/dQF5aT9rv0bkn2hKRDgY+cleg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsB+Zo2MmrB8UXgoxLVo+yR4exUfO4gMYvExK/bgMMg=;
 b=dpQv1wzSmgro6u6OjV7KX5aueZJy3q6rhWtGYu9Ykp6tMgTsuiuOpvyW4b2g2fDuy5gXznnylIkv+dP+yo/iPy/NknmN19szA2w3Occm2P005AZWxgu0sx+A/7WmJd8ctjISielzM+LgMsg//QOrQdShenkZDF72ICda98GkbvNpqeKTI6fgkFdwQeuZXB1X7Z+ZeyVqvL6UA2q58TjF18hwfcfPwgGxiiG7HJ6zsTIr7mGUkPE6JsoIfptqw4HiIVRK4RKl4tugo28DOy8HH5YnmoR8iNRrw4eRXPtcTYdn127dnvvlFe9WkY/s2JYL8P1CUgmii6HocT3TGPC5kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsB+Zo2MmrB8UXgoxLVo+yR4exUfO4gMYvExK/bgMMg=;
 b=daLjw9oiuqIvyRhSEjiEVP+Q6OnRqw576A4jPjn4qiEZKEUiU8U/jmsTImgjbu7pJ5Go807SZu9ofHB3g8OoeyGmB6q+dOZ6hLuO+0BbpLQ84Vn0TbndZqRQiT/tpkIxHdS1a3dgnY/bpRazuOVZx6Pg1ia24yOPKOZPd6i3Bow=
Received: from SE2PPF5449A096D.apcprd03.prod.outlook.com
 (2603:1096:108:1::499) by TYZPR03MB9719.apcprd03.prod.outlook.com
 (2603:1096:405:399::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.13; Tue, 19 May
 2026 02:42:41 +0000
Received: from SE2PPF5449A096D.apcprd03.prod.outlook.com
 ([fe80::1ceb:53b1:b0d:c0f7]) by SE2PPF5449A096D.apcprd03.prod.outlook.com
 ([fe80::1ceb:53b1:b0d:c0f7%6]) with mapi id 15.21.0025.012; Tue, 19 May 2026
 02:42:40 +0000
From: =?utf-8?B?Smlhbmh1YSBMaW4gKOael+W7uuWNjik=?= <jianhua.lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas@ndufresne.ca" <nicolas@ndufresne.ca>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <Vince-WL.Liu@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?SmggSHN1ICjoqLHluIzlrZwp?= <Jh.Hsu@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>
Subject: Re: [PATCH v7 0/3] Mediatek MT8189 JPEG support
Thread-Topic: [PATCH v7 0/3] Mediatek MT8189 JPEG support
Thread-Index: AQHczlHM+fE69yjkf0GyH4vSa6tgdrXjQC+AgDGVeYA=
Date: Tue, 19 May 2026 02:42:40 +0000
Message-ID: <b351ce79b9b815df88cc2245d4c1157469b31fa3.camel@mediatek.com>
References: <20260417100519.1043-1-jianhua.lin@mediatek.com>
	 <5b4cf8f7951cc2766901b09f2e886ef73d48671b.camel@ndufresne.ca>
In-Reply-To: <5b4cf8f7951cc2766901b09f2e886ef73d48671b.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE2PPF5449A096D:EE_|TYZPR03MB9719:EE_
x-ms-office365-filtering-correlation-id: 92dd12e3-916e-4570-5d60-08deb5504be2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|56012099003|22082099003|11063799003|4143699003|3023799003|38070700021;
x-microsoft-antispam-message-info: pfv8ue7ZK3/M/N3CGhgW210SX4tNWOdYM9YvIgR64cX7FVh2eBlJeHj/qSdLXCliwb4g1cGCBA1DWCeuVzGkIXlRNz3Qw6cOAhvkNqt/I39zH0xUAmlfVii4wHcMDugjesD78uuoqX9YGv+DAfW0XMNKJ1xUmjUyzIaKbraeBbT2NzvGNCqWgC9tdSRlVX2MTyI4phNwHrE30p1P9AY9lCi/+3WDkTrvhJAJ8Gc/PizcS3W5f/+N8ZPz3LJWmeteVnIBZwq9f6u3N19zJipjm04HsGEYn5lqi0wdHOJ6poibZebCN0VvLnsVG23+kgfgZhmiKPSSL/kKGDT5Vx9LcitfcY8SNinaJxxicv76RLjq61wz2bpJBHkGTUaX4jkYJO4jpujxQftXotDLxdAPATO6HtHsxPKRI4o+LxSBb3X025xoVBlkrTr8j1CfDytG+GOKBhgNjJM6Ah8huDTbCQpgRQ2y7XLI4QVwe6EHPKhJa1no+xLVdbBFDVWwXdeZufbTbf+Uaj4YfuscokQOnYnQUXkHA7NBEbAJzVX5sOhLg7SqWujsaXvbFjuNR5iNObAt6iqRpP/jAu+Ebys8UUFO3044sKKV12/9QxdS+zP1cq5dkqq+ZVwkHeYkV91M+FnTxwHsbD15D+CY/CZ7mfav9mHFmjv7sNqoIkn67b/W8xi+DC0oNVHijtx5aKEyJdV8emHtr0xZTomjBIrRtCrd9maN9zJIIypOfNpwnNeCzu2hXqOgguNXrDH1fVoH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2PPF5449A096D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003)(11063799003)(4143699003)(3023799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGd5WnZmZ0pCZlFCbUZSd2hZb3RyUCtRcms5MG1PeGZEKzlnbUJtQTQ3Z3py?=
 =?utf-8?B?T0NPSFpESGRrRnV5c21XcnFUcWhTSjhDMVhoY0M2UTVuUVE5OHJTYXg1VzUw?=
 =?utf-8?B?Zzh1NVF2Zkg5WkxrSHQreUFvRWZCc29BbG15N21VNmg2MFdGR1Q3L3pVK3BB?=
 =?utf-8?B?S1ljOEJoZnFZcjl2TEQxTkd5VnV4Y2JUU216RnVFYkRxUVFjOTVFcEhtOHRW?=
 =?utf-8?B?bTZ5aWVTaTVKSVJ4VDN5UEZyTmZLYTZlQUE3UmdFNUs1TUkzOTlvNm5hV3Zl?=
 =?utf-8?B?VXpVMy91MTRSb3QwcExpckhZWjB5QWlXZXZ6UXNJMWt0YVF0Y0ZoWnV3K2tr?=
 =?utf-8?B?U2xaR0xHWkRXKy83cERobTV3ZzVrd0I4K2ZRR3hSckZXTlB4a3kwM2g2Wjlo?=
 =?utf-8?B?WE54MmV0aVFqT2tlVTlpTk1TRW5sM09Lc2tzNVRyR0NZWXZ0NUR3cTVrb2pN?=
 =?utf-8?B?M2JvdnpDU2FiQ2ZSOUswZUo2RVROVHd5M0Y3V2pqbXpVS3NaZ2RiZ25JRlJs?=
 =?utf-8?B?VVNHMmlYZllVcUNiYktqV0lJNlgvQkpYNmR2bXZZK1B4Vm5VekdWU0NNWnh6?=
 =?utf-8?B?ZFNFaUp2ZUpyaWQxeTZwQ29OK0ZadjRCNDZnMFNzbU96K0dYRkQyUi9iYXpy?=
 =?utf-8?B?SXl0clV0c3JTaENRSzFNaU9QZHV6Z2FMeUcxWFBVbi9HeHh1VjdLQzM4OTA5?=
 =?utf-8?B?WFNabkt6MGhNUEV2bzIwcjR4RjZ0TDQyRE52WnVhdHBGRHF6RnVKM2dwN2JL?=
 =?utf-8?B?azBwU0JyRTUvOUJDNktQK3ZwT2I2YkdQVkVGWkpEZjU4WG9tdm1naDd1TEZy?=
 =?utf-8?B?RGJQNU1iMituK2pET2toL05pYVlqUys0Tkp5ckRBSVhQQ3l0bjRRUFRlaWdV?=
 =?utf-8?B?V0NMYy83cUxCVkF2MDR4WkZHcjVIT2hPQ2VBcnE4Y0ZSdlQxcUcvc0dGdUpG?=
 =?utf-8?B?cGFFazNQWGk5TDVrSWtBUUthd1RINjcrWDFkOGRLbzMxMzR2a0VpaDlXM01E?=
 =?utf-8?B?SmoycEk2L3FKZHdNc3pwOTVuSEpiREUwNVRhKzhVZHUzU0xCWGtFS0UzWktJ?=
 =?utf-8?B?bWFPekRuRjU0N0lTckplZzhKdC9hRTNyeTI5R2pvekhrblExNm8vcUp5NkY2?=
 =?utf-8?B?ZHBuaUlEUDR5aW0rRy81VVB1UkNDdWtoOXIzb3lVU3QrOGJFQ2JUZkptTG5k?=
 =?utf-8?B?enpIdmhCUVlDdGxuOTF0Zy9SUUhJbHVpSmVIRVAxRyt3bjFlRU1JZzZlRFkv?=
 =?utf-8?B?ZVFwRzJOWDltNVVVSGVKajZUNElyQzVGck45dkJTVG1lM3hHTjBzZnUrVU5H?=
 =?utf-8?B?dHowelJEdW5CTTJiaElnSi93cUU4cUw0MVFBRHBrTkk2TDlxSFdTR09ZU2tI?=
 =?utf-8?B?TUZXZ1FLRnI1QlRxc3UzaDBqQWQ2cmFkOHZrMGZieEQxYjRYQjNrQStzMGNV?=
 =?utf-8?B?THJQN04xM2M1ak0rV1N3ZkNNTGJWU2tFbmM0RXdTZjZyYWllYy8xMlZqcFpJ?=
 =?utf-8?B?WE1oSENBUEo0WjhIVDhaa1FMTFhRWUpmeFk2bVdkcWRaZTVQYlN6UDFUeXIv?=
 =?utf-8?B?ckw1eU5KTmJQSDFnYkRuYmMrK2ZGcGdhVHVtR2loWXRJSlRCenhUWkVIR2Y0?=
 =?utf-8?B?QXd5dlFwanBETWZqVkNkMmxnYjBhcE51bXBsNURSZlIzd1RvQ21aLzZmRzNt?=
 =?utf-8?B?M01QMysvajI1ZHlvbXVJSGdjbDdZdG9KYzBkdDlFbFJQaC96d2FlN3pGVnY2?=
 =?utf-8?B?RU9tZDdMai8zOCtCcG1ad3Y3ZEduOHVoZDNFdmhWc2dneFVmbHFMMGNZdSty?=
 =?utf-8?B?NGR2ejVEV3krV3Y0VTNFNU1PMElvUmxEeFlTeFl4dmRPaVNORENBQVRlRklP?=
 =?utf-8?B?ODM5Yi9kVXVwUzdpY0t6bk5iUFZPdytFOTUxdUNhTTYrNXUyMkpHQnpDYU5Q?=
 =?utf-8?B?M0FFRWxWUjBKd0dVdjBFKzdoK3dmcmJMMmFUb1NwVDVqMGhZeTlFZmJuUHBT?=
 =?utf-8?B?eFVLNDN5L1ZjWGR2QnB5RjcrL040RjlOTWhsZjdFL2dMakp6cTQ0bnRNSUpx?=
 =?utf-8?B?NUxZanhBV2ZFWVdRTlZDWGlhK0xlMFFmVUk4dGN2dW1sYjY0QVByeHEzV0oz?=
 =?utf-8?B?NkpmM0dCZ294TGtDVkpLbmw1bGdBTHdVVmdGbUNVRXBTRjdzVWRITG5QSm82?=
 =?utf-8?B?NFU4N2M2VWVOY1pGbFJ3alpRMk5PYmp0OHFwV1hEV3pyV0ErNUZwN2hBSG5l?=
 =?utf-8?B?Z1VGcFhIZmhibEtidTRZdEpLaW9BMnJ0c2cxMURCbWJzS1Bodm1yWm9UWW9Q?=
 =?utf-8?B?V2tiWHZsd1dtM0FvVm9EaHZRTFZrQ2hYZ0JGWGZVMGQ3S1VxdDdudz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB9A1AEBBE50174EAC33D1E893E26170@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FbBp3BYhfoJ4Qg2LXPxCPLBFMoi6GX6DZh3STlHNnM2hXOoLLFzT8by+XE95bWbslelttNyeKpz7ma3XNVnRjtmntrzD5XJAsupsmtInoem8+OKXOzkz2WVZ4rxVHIoIXFfHwmxK7STDHIbufd6As066Yzycyfi23EflrKJfc1e1zbwPZs7OYR9cJH+Z7IEvynwpcYNYGr2viURr9JdjKTlRxQEF6eF/oer6AXWCUfbIV9gihI3F9H4IE7mayyx6hCe1zn/SpmrnsN4jOEtN85MdOYfdw3Ch1KJBMPSYShTdj329h9rxXPMDZ2BRElUQSFvNXIvTKkt5HSWTar0K4Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE2PPF5449A096D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92dd12e3-916e-4570-5d60-08deb5504be2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 02:42:40.8233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lVJJ1Izycc1ylZPs9AvMEAJJ5sND6XsDn2/ynUULf7Lk/uaVjNOIh8++wNI8tagspmPe5GiEMrHucYGJO8ykYStMR+f4m8VMVnJqrJzI18E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB9719
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-62075-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,ndufresne.ca,collabora.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediateko365.onmicrosoft.com:dkim,mediatek.com:mid,mediatek.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianhua.lin@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 17AC1576863
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTmljb2xhcw0KDQpUaGlzIHNlcmllcyBkZXBlbmRzIG9uIGNvbW1pdCA3NTYwMzQ5ZWUwZDkg
KCJtZWRpYTogbWVkaWF0ZWs6IGpwZWc6DQpzdXBwb3J0IDM0Yml0cyIpLCB3aGljaCBpbnRyb2R1
Y2VkIHRoZSAnc3VwcG9ydF8zNGJpdCcgZmllbGQgaW4gJ3N0cnVjdA0KbXRrX2pwZWdfdmFyaWFu
dCcuIFRoYXQgY29tbWl0IGhhcyBhbHJlYWR5IGJlZW4gbWVyZ2VkIHZpYSB0aGUgbWVkaWENCnRy
ZWUgYW5kIGlzIHByZXNlbnQgaW4gbGludXgtbmV4dCBhcyBvZiBuZXh0LTIwMjYwNDEwLlRoZXJl
Zm9yZSwgdGhpcw0Kc2VyaWVzIGlzIGJhc2VkIG9uIGxpbnV4LW5leHQvbWFzdGVyIHJhdGhlciB0
aGFuIG1lZGlhLWNvbW1pdHRlcnMvbmV4dA0KdG8gZW5zdXJlIHRoZSBkZXBlbmRlbmN5IGlzIGF2
YWlsYWJsZS4NCg0KVGhlIGR0LWJpbmRpbmdzIHNjaGVtYSB3YXMgdmFsaWRhdGVkIGFnYWluc3Qg
bGludXgtbmV4dCB0YWcgbmV4dC0NCjIwMjYwNDEwLiBKUEVHIGVuY29kZXIgYW5kIGRlY29kZXIg
ZnVuY3Rpb25hbGl0eSB3YXMgdmVyaWZpZWQgb24gTVQ4MTg5DQpoYXJkd2FyZS4NCg0KUmVnYXJk
cywNCkppYW5odWEgTGluDQoNCk9uIEZyaSwgMjAyNi0wNC0xNyBhdCAwOTozMCAtMDQwMCwgTmlj
b2xhcyBEdWZyZXNuZSB3cm90ZToNCj4gSGksDQo+IA0KPiBMZSB2ZW5kcmVkaSAxNyBhdnJpbCAy
MDI2IMOgIDE4OjA1ICswODAwLCBKaWFuaHVhIExpbiBhIMOpY3JpdCA6DQo+ID4gVGhpcyBzZXJp
ZXMgaXMgYmFzZWQgb24gdGFnOiBuZXh0LTIwMjYwNDEwLCBsaW51eC1uZXh0L21hc3Rlcg0KPiAN
Cj4gV2hhdCBkZXBlbmRlbmNpZXMganVzdGlmeSBub3Qgc3VibWl0dGluZyBiYXNlZCBvbiBtZWRp
YS0NCj4gY29tbWl0dGVycy9uZXh0IGFzIHVzdWFsDQo+ID8gSXRzIGZpbmUgdG8gc2F5IHlvdSB0
ZXN0ZWQgYWdhaW5zdCBsaW51eC1uZXh0IG9mIGNvdXJzZSwgYW5kIGlmIGl0cw0KPiBvbmx5DQo+
IHdvcmtpbmcgdGhlcmUsIGl0cyByZWFsbHkgbmljZSB0byBleHBsYWluIHdoeS4NCj4gDQo+IE5p
Y29sYXMNCj4gDQo+ID4gDQo+ID4gQ2hhbmdlcyBjb21wYXJlZCB3aXRoIHY2Og0KPiA+IC0gUGF0
Y2hlcyAxLzMgKGR0LWJpbmRpbmdzOiBkZWNvZGVyKToNCj4gPiAgIHVwZGF0ZSB0aGUgZXhpc3Rp
bmcgYGFsbE9mYCBjb25kaXRpb24gZm9yIG1lZGlhdGVrLG10ODE4OS1qcGdkZWMNCj4gPiB0bw0K
PiA+ICAgbWFrZSB0aGUgJ21lZGlhdGVrLGxhcmInIHByb3BlcnR5IHN0cmljdGx5IHJlcXVpcmVk
IGZvciBNVDgxODkNCj4gPiBTb0MuDQo+ID4gLSBQYXRjaGVzIDIvMyAoZHQtYmluZGluZ3M6IGVu
Y29kZXIpOg0KPiA+ICAgQWRkIGFuIGBhbGxPZmAgY29uZGl0aW9uIHRvIGVuZm9yY2UgdGhhdCB0
aGUgYG1lZGlhdGVrLGxhcmJgDQo+ID4gcHJvcGVydHkNCj4gPiAgIGlzIHN0cmljdGx5IHJlcXVp
cmVkIHdoZW4gdGhlIGNvbXBhdGlibGUgc3RyaW5nIGNvbnRhaW5zDQo+ID4gICBtZWRpYXRlayxt
dDgxODktanBnZW5jLg0KPiA+IA0KPiA+IENoYW5nZXMgY29tcGFyZWQgd2l0aCB2NToNCj4gPiAt
IFBhdGNoZXMgMS8zIChkdC1iaW5kaW5nczogZGVjb2Rlcik6DQo+ID4gICAtIERyb3AgdG9wLWxl
dmVsIG1pbkl0ZW1zL21heEl0ZW1zIGZvciBjbG9jay1uYW1lcyBwZXINCj4gPiBLcnp5c3p0b2Yn
cw0KPiA+ICAgICByZXZpZXcuDQo+ID4gICAtIFJlZmluZSBhbGxPZiBibG9jayB0byBzdHJpY3Rs
eSBlbmZvcmNlIGNsb2NrIGNvbnN0cmFpbnRzLg0KPiA+IA0KPiA+IENoYW5nZXMgY29tcGFyZWQg
d2l0aCB2NDoNCj4gPiAtIFJlZmluZXMgdGhlIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciBKUEVH
IGRlY29kZXIgYW5kIGVuY29kZXIuDQo+ID4gICAtIFBhdGNoZXMgMS8zIChkdC1iaW5kaW5nczog
ZGVjb2Rlcik6DQo+ID4gICAgIE1vdmVkIHRoZSBzdGFuZGFsb25lIGNvbXBhdGlibGUgc3RyaW5n
IG1lZGlhdGVrLG10ODE4OS1qcGdkZWMNCj4gPiAgICAgaW50byB0aGUgZmlyc3Qgb25lT2YgZW50
cnkgYWxvbmcgd2l0aCBtdDI3MDEgYW5kIG10ODE3MywgYXMNCj4gPiAgICAgc3VnZ2VzdGVkIGJ5
IFJvYiBIZXJyaW5nLiBUaGlzIGNvcnJlY3RseSBncm91cHMgYWxsIGluZGVwZW5kZW50DQo+ID4g
ICAgIElDcyBhbmQgcmVtb3ZlcyB0aGUgcmVkdW5kYW50IGl0ZW1zIHdyYXBwZXIuDQo+ID4gICAt
IFBhdGNoZXMgMi8zIChkdC1iaW5kaW5nczogZW5jb2Rlcik6DQo+ID4gICAgIEFwcGxpZWQgdGhl
IHNhbWUgbG9naWMgc3VnZ2VzdGVkIGJ5IFJvYiBIZXJyaW5nIHRvIHRoZSBlbmNvZGVyDQo+ID4g
ICAgIGJpbmRpbmcuIFJlc3RydWN0dXJlZCB0aGUgY29tcGF0aWJsZSBwcm9wZXJ0eSB0byBjbGVh
cmx5DQo+ID4gICAgIGRpc3Rpbmd1aXNoIGJldHdlZW4gdGhlIHN0YW5kYWxvbmUgSUMgKG1lZGlh
dGVrLG10ODE4OS1qcGdlbmMpDQo+ID4gICAgIGFuZCB0aGUgSUNzIHRoYXQgbXVzdCBmYWxsYmFj
ayB0byBtZWRpYXRlayxtdGstanBnZW5jLg0KPiA+IA0KPiA+IENoYW5nZXMgY29tcGFyZWQgd2l0
aCB2MzoNCj4gPiAtIFRoZSB2NCBpcyByZXNlbmRpbmcgdGhlIGNvdmVyLWxldHRlciwgYmVjYXVz
ZSB0aGUgdjMgY292ZXItbGV0dGVyIA0KPiA+IHdhcw0KPiA+ICAgbm90IHNlbnQgc3VjY2Vzc2Z1
bGx5Lg0KPiA+IA0KPiA+IENoYW5nZXMgY29tcGFyZWQgd2l0aCB2MjoNCj4gPiAtIERyb3BwZWQg
dGhlIGR0cyBwYXRjaCAoYXJtNjQ6IGR0czogbXQ4MTg4OiB1cGRhdGUgSlBFRw0KPiA+IGVuY29k
ZXIvZGVjb2Rlcg0KPiA+ICAgY29tcGF0aWJsZSkgYXMgaXQgYmVsb25ncyB0byBhIGRpZmZlcmVu
dCB0cmVlL3Nlcmllcy4NCj4gPiAtIFBhdGNoZXMgMS8zIChkdC1iaW5kaW5nczogZGVjb2Rlcik6
DQo+ID4gICAtIENoYW5nZWQgdGhlIE1UODE4OSBjb21wYXRpYmxlIHRvIGJlIGEgc3RhbmRhbG9u
ZSBgY29uc3RgDQo+ID4gaW5zdGVhZCBvZg0KPiA+ICAgICBhbiBgZW51bWAuDQo+ID4gICAtIEFk
ZGVkIGFuIGBhbGxPZmAgYmxvY2sgd2l0aCBjb25kaXRpb25hbCBjaGVja3MgdG8gZW5mb3JjZSB0
aGUNCj4gPiBzaW5nbGUNCj4gPiAgICAgY2xvY2sgKCJqcGdkZWMiKSByZXF1aXJlbWVudCBmb3Ig
TVQ4MTg5LCB3aGlsZSBwcmVzZXJ2aW5nIHRoZQ0KPiA+ICAgICB0d28tY2xvY2sgcmVxdWlyZW1l
bnQgZm9yIG9sZGVyIFNvQ3MuDQo+ID4gICAtIFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UgdG8gcmVm
bGVjdCB0aGUgc2NoZW1hIHN0cnVjdHVyZSBjaGFuZ2VzDQo+ID4gYW5kDQo+ID4gICAgIGhhcmR3
YXJlIGRpZmZlcmVuY2VzLg0KPiA+IC0gUGF0Y2hlcyAyLzMgKGR0LWJpbmRpbmdzOiBlbmNvZGVy
KToNCj4gPiAgIC0gQ2hhbmdlZCB0aGUgTVQ4MTg5IGNvbXBhdGlibGUgdG8gYmUgYSBzdGFuZGFs
b25lIGBjb25zdGANCj4gPiBpbnN0ZWFkIG9mDQo+ID4gICAgIGFuIGBlbnVtYCBpbnNpZGUgdGhl
IGBpdGVtc2AgbGlzdCwgYXMgaXQgZG9lcyBub3QgZmFsbGJhY2sgdG8NCj4gPiAgICAgIm1lZGlh
dGVrLG10ay1qcGdlbmMiIGR1ZSB0byAzNC1iaXQgSU9WQSByZXF1aXJlbWVudHMuDQo+ID4gICAt
IFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UgdG8gZXhwbGFpbiB0aGUgc3RhbmRhbG9uZSBjb21wYXRp
YmxlDQo+ID4gZGVzaWduLg0KPiA+IC0gUGF0Y2hlcyAzLzMgKG1lZGlhOiBtZWRpYXRlazoganBl
Zyk6DQo+ID4gICAtIFJlZmluZWQgY29tbWl0IG1lc3NhZ2UgZm9yIGJldHRlciBjbGFyaXR5IHJl
Z2FyZGluZyAzNC1iaXQgSU9WQQ0KPiA+IGFuZA0KPiA+ICAgICBzaW5nbGUgY2xvY2sgY29uZmln
dXJhdGlvbi4NCj4gPiANCj4gPiBDaGFuZ2VzIGNvbXBhcmVkIHdpdGggdjE6DQo+ID4gLSBQYXRj
aGVzIDEvNDoNCj4gPiAgIC0gVXBkYXRpbmcgY29tbWl0IG1lc3NhZ2UNCj4gPiAtIFBhdGNoZXMg
Mi80LCAzLzQ6IA0KPiA+ICAgLSBVcGRhdGluZyBjb21taXQgbWVzc2FnZQ0KPiA+ICAgLSBBZGp1
c3RlZCBwcm9wZXJ0eSBkZXNjcmlwdGlvbnMgYWNvcnJkaW5nIHRvIGhhcmR3YXJlDQo+ID4gcmVx
dWlyZW1lbnRzDQo+ID4gICAtIEltcHJvdmVkIGZvcm1hdHRpbmcgZm9yIGJldHRlciByZWFkYWJp
bGl0eSBhbmQgY29uc2lzdGVuY3kNCj4gPiAtIFBhdGNoZXMgNC80Og0KPiA+ICAgLSBVcGRhdGlu
ZyBjb21taXQgbWVzc2FnZQ0KPiA+IA0KPiA+IEppYW5odWEgTGluICgzKToNCj4gPiAgIGR0LWJp
bmRpbmdzOiBtZWRpYTogbWVkaWF0ZWstanBlZy1kZWNvZGVyOiBhZGQgTVQ4MTg5IGNvbXBhdGli
bGUNCj4gPiAgICAgc3RyaW5nDQo+ID4gICBkdC1iaW5kaW5nczogbWVkaWE6IG1lZGlhdGVrLWpw
ZWctZW5jb2RlcjogYWRkIE1UODE4OSBjb21wYXRpYmxlDQo+ID4gICAgIHN0cmluZw0KPiA+ICAg
bWVkaWE6IG1lZGlhdGVrOiBqcGVnOiBhZGQgY29tcGF0aWJsZSBmb3IgTVQ4MTg5IFNvQw0KPiA+
IA0KPiA+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstanBlZy1kZWNvZGVyLnlhbWwgfCA0
OA0KPiA+ICsrKysrKysrKysrKysrKy0tLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrLWpwZWctZW5jb2Rlci55YW1sIHwgMjkgKysrKysrKystLS0NCj4gPiAgLi4uL3BsYXRmb3Jt
L21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jICAgIHwgNDQNCj4gPiArKysrKysrKysrKysr
KysrKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDEwNyBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlv
bnMoLSkNCg==

