Return-Path: <linux-media+bounces-34176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BADBACFB3C
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 04:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B18AA18948D7
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 02:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C141DDC33;
	Fri,  6 Jun 2025 02:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M5ivJBzD";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="PmdeOe8q"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CD417548;
	Fri,  6 Jun 2025 02:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749176515; cv=fail; b=swRrniKm8coMniwMSG1MmaECQ82uu9Nin1X+STcX1hkntSUz8GXlXckzSnHgW8KyZqu1C+Ph2m+4lJRf2hJV1NVZoUwfAsEEo75Eg4VU87T6JRjK/sKh6Ve1tG9M0s5fCmZ0n5zS6Y4uhQe7xz76nroXivCcXx3WvzHZRcdTsCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749176515; c=relaxed/simple;
	bh=Kb+96vgN8u8GxyWRPjV/I+bh/s08BfP4T7536LL7+Oc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DUUDfHuTlMJMMejXSME69lyQ3JD/fMuMUHRXJRjDo4PHBR9ZgpPVv2MUyTRuUCPCEY68P6LnTrO3cfgQOboosvij2ksa8radIFkI5fz5ddC82YPZ7UnEZ7JCIuV2lBoFfYRwtYB7RDuRs7PxmGcLLqMxY20pYJZ8Sxvxr0ehY8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=M5ivJBzD; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=PmdeOe8q; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: fe698642427c11f0b33aeb1e7f16c2b6-20250606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Kb+96vgN8u8GxyWRPjV/I+bh/s08BfP4T7536LL7+Oc=;
	b=M5ivJBzD16ne8qIc53WU+EaL90w1g34aZr6Co/qdaSHSZe1DXD0KYj8poTzeOuKFfmn6RCTozTiBpVSQuNIuUuaQThPShzj4vQs7YvjOY4X/joAjnTgSjwVf+I6iygQC3W/c9VhnfrQICViOhMr486mERgbGimCRFqkpR8GJhmU=;
X-CID-CACHE: Type:Local,Time:202506061019+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:4328850e-73e1-47b3-8708-983a0370f5f4,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:c5938459-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fe698642427c11f0b33aeb1e7f16c2b6-20250606
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 790692951; Fri, 06 Jun 2025 10:21:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 6 Jun 2025 10:21:44 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 6 Jun 2025 10:21:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWEGsGgi0jzE6N+sP4g2VncXEMUK5Vj8z6EvtXrfS+qghaoufQt4RAeT90/N4lOrD6VRuCvaM6CovzJMnLilUSOt02NL3IcP1qkeg1Rab2dKLZ8suzmxnS+6AdZrj2OHB5zNuUmIVuEdxVCEueCiSfWRHNg08LkG65fMUDpgYCYFW1z5/UGyrt26G5ghWSuzp2dGJoOOMOpYQfPxXOU/PGsql++EhemWJ6/EMFs7/Cw8JW5Ei4Y7IQYfJ6lS0TgpAQYHNsZ3Y7jfEruxPruLjCYruriHRBNC1M0Ca6Dzx8DWmfwEbA01DNrRCcITm40mCAHI0h1CWi68IjSiqCJdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kb+96vgN8u8GxyWRPjV/I+bh/s08BfP4T7536LL7+Oc=;
 b=sbAngdhPvqQyjotAYIJvq1ukYeSyirlqMr9n5T7Mbxk2p81BCSscKaombxABIeDYDx6cjhbnYpu9HK3K7TXJyv1tnP+86IhKdxZKr6e2yDouwfxFmUjO057b5T6MOxr84DZkMt2OgWkkWouxyyQYb3fm2BYBB8BzmiSGt9yUjTPIl8MM08nCFsMEsSNySdSFDiqKW/4RyRQKtn60fKHYzdpQN5zS/SwMSsOIJAFPGnQgwB5GhQXn2HqYuhNEhGhF6db2lub8HNBncSEsxVEw/BJ7izJiaA2wC/4tPFtwjPrQmvF9m2BG5BWpKJyUo+UizTD/m85C27d9kDh57NIb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kb+96vgN8u8GxyWRPjV/I+bh/s08BfP4T7536LL7+Oc=;
 b=PmdeOe8qToaUMSjkT7GISlp9bMKa+7lTk2UbeFG95vWfON64M5mmq3sjLsaigL5xPMcMFTyfR0y3E2sDDNR1Rdbg/Xo6ziRHoa8k0zrnM2+S4pKLHMYCdcncCkU5n/AsWWAUqASpdI9v0JB2T8++CVE7EE/zJ2FO6zWEhsGGnvI=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by SG2PR03MB6609.apcprd03.prod.outlook.com (2603:1096:4:1d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 6 Jun
 2025 02:21:41 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3%4]) with mapi id 15.20.8769.029; Fri, 6 Jun 2025
 02:21:41 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: media: mediatek: encoder: Add encoder
 dt-bindings for MT8196
Thread-Topic: [PATCH v2 5/6] dt-bindings: media: mediatek: encoder: Add
 encoder dt-bindings for MT8196
Thread-Index: AQHbz5sIZlWYNltu7kOZejvdMmqsTLP079CAgACEcwA=
Date: Fri, 6 Jun 2025 02:21:41 +0000
Message-ID: <677fe2495a9461e293e0d46acacd4887387006a1.camel@mediatek.com>
References: <20250528063633.14054-1-irui.wang@mediatek.com>
	 <20250528063633.14054-6-irui.wang@mediatek.com>
	 <20250605182737.GB2983549-robh@kernel.org>
In-Reply-To: <20250605182737.GB2983549-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|SG2PR03MB6609:EE_
x-ms-office365-filtering-correlation-id: 4186ec8c-df5c-4665-b896-08dda4a0e00c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QXhqUnJHbzhQaHhER3JtQlYrMWw1TWRyTld3amZ2dHMxdXBLdFBIVGNqeGZr?=
 =?utf-8?B?T1FSWVBZS0VISjU3U3JObmJhN0trcFBhQzJuVjhzKzJsZ3V1VCt0bjM4MFVy?=
 =?utf-8?B?blk3cXFXUzhURy9zVHY2SUFmbG5IMXUyQThaWDRnV0NlazlGOWFVUlFYN0hl?=
 =?utf-8?B?VGxiYWtuZnpEdHdZV0dLOXM5ZmZOQ0txRytERnlhT09XQnRrYnk3NWNvNUQw?=
 =?utf-8?B?b0dUeE0vR21ocm9xaGowa2wzUC9qV3JCMFNNbVdSKzJ1UzVvVU9hOWVoL1VR?=
 =?utf-8?B?cE1yM3BXYzNjRjUyNlg2OUJSMENIT0dIcXJCdnNHNGl4amV2MGUvVVZ6WWhG?=
 =?utf-8?B?c3ZsUndRL3NxcWNLa2dXVFh5UlgwU0tQVUY5Wk5kK1duV2c4OWt6MXEzcHpV?=
 =?utf-8?B?OUNVTFZ5TVNTRndUdWEwZXltdFNWQ2JUbWx1OEVpYjBRNENRT0xtMVBQem1M?=
 =?utf-8?B?M2dKWkNoNUZLNnRYNE9uLzBneTBlQ05FQkdTODcxcFpSQmJmVnQxTjBpZk5k?=
 =?utf-8?B?RFZqaDBtTGVvemIzb0FtTG5iV01xTnVvaVhobG5ZL3RGOWptSncyczRpT3c2?=
 =?utf-8?B?aEVKdG5mWU9TSWNJWFY2TDk3OXN0ZEcyQWhoRFhkVUxmYkQ5ek0wSGdNUity?=
 =?utf-8?B?TFlLTUZOTkZvUURYUmszaTAxd2loZEtLRnlLMTV1ZkppcWV3cjZwTmdkQ0E4?=
 =?utf-8?B?VnVGSG9iaHBpVE5GQnMzZHZvMkdKMXdIekZQMHZ5cXpxa3dXYUY4bFkrT2g2?=
 =?utf-8?B?YVNTbEtTaDFGdU9sYkw1aVpLaGhBZUgreVlsMGtRTTJWR05VN3J1Rk9ESXhL?=
 =?utf-8?B?UEl2M1BrVjhPUXc5aldBRXN3OHNUem9UY3VlWS9DQzh3aGEvSitTYTJ0N3Q3?=
 =?utf-8?B?cFZmNzh0MENta2ZCMjdLLzFydFRVcE9CRTRqVUd4K2R0Nmk1ZS9jUjRUYStW?=
 =?utf-8?B?TDhqa2tSNFJKUGdNamdHNXoyNCtzOTdiV2VaaEIra1BhSURpYTA3QkpjMWJt?=
 =?utf-8?B?QnpzVFVGTFN1OXFGRElMQ1lOZmRrVm9wM09oUFZoOTR4WVFCZ1FTUExaMEln?=
 =?utf-8?B?Q2hQTU9UcFZjS2t0SlJqZTFkSUd0U00ycURtNUNjZEFvZkI0N2RNUmw1T1Zq?=
 =?utf-8?B?LzNBZEYyQ2tpUm5qd3NJSGRiQ0c2d0J3SnhUTUtGeGRkMFNqZXMrUmtlc2M2?=
 =?utf-8?B?Z2htaGNXNzBYSWNlWVNZSlZyZ21KSHFIMms1VEhLcFlIaE1naExYajNQTWYx?=
 =?utf-8?B?cFFaOWd0YmIxc053WCtZUU9teEQ0d0JYL0dZTFZBZkhtczYvL0pmbnVYYUl4?=
 =?utf-8?B?THlpdExUQlh0QWRqZU9uRmt3UGZDdC84Q252clp1ZmxHQjFla3ljTDhyMllZ?=
 =?utf-8?B?bjdqYUErZEpjQWtsZk8ydXVzS0prSzgyMUw2TTVtRGQ0QVhOdGszcnJVOEd1?=
 =?utf-8?B?OXZ3TTFBNU01Q1pZTExTQjAxOTYwdEsrQXc0aGphTzFFemtHa29ROEROMU5B?=
 =?utf-8?B?U2I5ekZNRWszbjVyYUN4VlpIcTF4WStreTJtQ29iaUZJOVQvc0xiTGt2SGJ4?=
 =?utf-8?B?aHdwd1pkN0dnR2Z6UkNiUTFubW45aDlia2RDM2NldTBENmFlSVZ0MXhlc0w2?=
 =?utf-8?B?VUVqM2tDaS83Q0lYQnMvZ2dRbUttWjgzcFlvUE5DUFRQVGdtd3BlTUczTW1y?=
 =?utf-8?B?QUJtdkVsdmlyZzhPT0k1eVg0KzU1bHJpOHdxalhaa1MrajFPN0NjS2lTSGU2?=
 =?utf-8?B?a2JyT0FUVGVxRTY2bkxSUnhsSlNjMzVnRHhkWHZtcmJraFI1MzVwV1BNbnBF?=
 =?utf-8?B?VzZCcXRUbklONUtoRmxZY29vQWhSTkF2Nm5BSkdiRnBzbW4rWXRoVGp2YkhE?=
 =?utf-8?B?WjREVE5nZzQwQy9mTmg3b3MwMHhHeFVFbDRnNGgwb0I3RXB0SWtqRjhrejJV?=
 =?utf-8?B?SnlVbXg1VHEvRHBETVRFbjhMM0pFRDJqVXpwSzVIcWtncFhwd1dJcnFOdnRZ?=
 =?utf-8?B?ZW41Tmh6MlJRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3lDQ0V2SmUyV3p0K2FtVk5rVG9HUExSejlMbGozWTQzNEhRRy9vZklDUzNu?=
 =?utf-8?B?UnFTZHkwdDhTU1BsUjdkcVYvangyS25DNWQ5WW0zVFRuaDFqU3hyQS9wM0li?=
 =?utf-8?B?azNldHlza0xOYTY5dTRkNVpRWi9aTlBXNVhrNy8xenVlaWN0Q0VOUHhHeFZZ?=
 =?utf-8?B?d3VoTVJ6ZktSb1NTOHhScGdXcitFckdCRWo0TjYzVDliRWd2a29MbnQ5S2px?=
 =?utf-8?B?MWplS1BGTzZYQ0RFSGYweE5aUDByWTdLdytnbFpxUGxsSFV2SG5XM3g4MVZo?=
 =?utf-8?B?WS8rUk1aREVWandiMzhJdG96aTVJVWF4azBlS2xnQTRZckxZWG95OFNXRUtj?=
 =?utf-8?B?bDFMalZPYTh4VG9ycXppWmZRNDU1aHJ4amxDQ3dzTUV3bURVczdIUDFpSkRY?=
 =?utf-8?B?b2hlSFVqK3RPQjhRREcwV1o5d2tpRlJtUU13eFUxdDhHdk5JT1pGTEp1a2V3?=
 =?utf-8?B?YkdULzVFMDg3SThHNy9lZmhSODVPYmY2dkFrYnVBZGJhb2xhYXNrQ0NNNkNs?=
 =?utf-8?B?SGt6eUNqZDkzdUtqRzlEcEdKai9hSUZlZVhhTE1palozajREWkNTRmdEQkY1?=
 =?utf-8?B?MUIvNVluL3hTK3FCZFVmM0IrUlREc1JZWFBqL2YxTnEzajJMYkNrclBEVklQ?=
 =?utf-8?B?OU5DcVRYNzUrTWlhMHk5cEd4aUJPYzRicTZtcXpVenYwTHBFeXpla0JpU01O?=
 =?utf-8?B?bUtseTUwVHNSNlZQcVU0M1RKL1NHekRyemN0Qld4Zm12M050emlhN3ZTbTln?=
 =?utf-8?B?VncwZW5uUndqd2hZZldZSGx1aFVZdldzU3ArNmhwbG1sSy9nUzBtTlVnUlp1?=
 =?utf-8?B?QkEyNldsMm9leFdGTUNpYWVkN28yT0w2Nzg4WC9kVjRNdUNGYnE2d2RZVFNu?=
 =?utf-8?B?WDd6eXpNYUNnMjhQbTUxRzR2cGEwVS9LU2xxd2Y2NzQ1a3VYdExEM25tSnBT?=
 =?utf-8?B?dUd0WXQ3Z1hNcko0anpuSk5qT0hXSE9rQXJpSklMSUgrd0VhekNOVnBWdFlk?=
 =?utf-8?B?c1lGbVFZYW1Keng5OWF0NUxCOUQvaWJlVE1QUHZGM0F5ZE1uOFAwNHh4KzJJ?=
 =?utf-8?B?MzZKdkk4Z1NoWUF6blQzellnK21VQ3l4aGFSTlFjSm9mdVREQ2FyaTUySktR?=
 =?utf-8?B?WDhZc1lJTVIrTThndEtCKzd5Q2pta3ZWMUV6OEs0ZEdlZXBBRkVRbGh6MCt2?=
 =?utf-8?B?N1BQWXR1UTRuQVplS3V5Nm1qQlprQTFpOTF6NXo0L0VYQlZ3WURFSDYyM2t4?=
 =?utf-8?B?VHJKbHFkSWNWR1l1RDd4c2pxNnpRekFRRTQ1OGVMZ2FVcW4vWWtLY0R3UEpE?=
 =?utf-8?B?R1hOZm5PRXZ1YlNiSmpEN3FweU53dExUejlHTmoxZGNEZTF5YlJhSzdiTUt6?=
 =?utf-8?B?UzFOMUtxTmhLT2RPWFFCVGR5dEt1Z2hPS1Bhd0wweHB4Y2tCOWpLMDlBak9u?=
 =?utf-8?B?RU4zdWZuZGUwUGpYTWJoSFBmT254TndlVVBHTmNGSWExWkJOQi90Y1o3RG5D?=
 =?utf-8?B?QVJmTS83OEVqeTE5bDJMbXN4TTlRdHZDbklyK2hyY1RucUZyUmhqbU1KS1B3?=
 =?utf-8?B?WC9GKzFSWEZRa0twWGdIQzh6cGEwcGU5QUIzWVl2RDRSN3p1WTI2VUQxTWFC?=
 =?utf-8?B?UUIxYVJiVG9ISzd2d0x4VWRweVRJQW5URmtXN1hiU2ZuSWEvbW1CcjdWZDVs?=
 =?utf-8?B?ZmMxMFZSK0oyWisrNnFkb2pxa2VyeTZlQm5uTHZCNjY4Y3EvS1pVMlhBb0h6?=
 =?utf-8?B?d0RkN3lrWU53NkpUTEpQQ1hSNVl4SSt3R002K1JWNElOSWlwTTFHaFBCZ3ZP?=
 =?utf-8?B?Q2x4clpYMFNKR2pTVldNUGxjMmx6WFFrVXlOREZ1dFpRVTA3VDRLaVFhU1dB?=
 =?utf-8?B?N3cweHp6aDlQRkRqVDRwL2tnY0lhLzNhZE0wanI3SHpNdHRiZCszdW4rZWtU?=
 =?utf-8?B?NUNQeXpZeVRNcU9RYWRiTW9TeTZEclcvaXY2eE45ZFhXdG1hbVFuelo2V0JI?=
 =?utf-8?B?elMrUTZkVzQzSmVxZWc3YzIwWURNZFdrbDhVczlUTWprbWdxYTlKNUxnZjlE?=
 =?utf-8?B?bC9EdWpzY2R6R2JUTGZVZkxFYWVUSlBqaW1zV3NhVUMwcjljdTNnK1Qrakk0?=
 =?utf-8?B?RTF1RCtBNmFFS0dUUk5EbWZxYk5BbS9zRXloYTJGMjR2K1pSYUp4ampmVEg5?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67ED32FB77D926428158663D726727D5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4186ec8c-df5c-4665-b896-08dda4a0e00c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 02:21:41.6871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tSoaEmBYSl3snifvpYG9f2DSYlSFHjtdOJSpc8YtXc0eFObKpxpDwjAFFohwqLblD9F4R3BBd7E458/4vhedbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6609

T24gVGh1LCAyMDI1LTA2LTA1IGF0IDEzOjI3IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
RXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVu
dC4NCj4gDQo+IA0KPiBPbiBXZWQsIE1heSAyOCwgMjAyNSBhdCAwMjozNjozMVBNICswODAwLCBJ
cnVpIFdhbmcgd3JvdGU6DQo+ID4gQWRkIE1UODE5NiBlbmNvZGVyIGNvbXBhdGlibGUgc3RyaW5n
LCB3aGljaCB3aWxsIHJlZmVyZW5jZSBWQ1ANCj4gPiBkZXZpY2UuDQo+IA0KPiBBbHNvIHdvcmsg
b24geW91ciBzdWJqZWN0LiBObyBuZWVkIHRvIHNheSBkdC1iaW5kaW5ncyBhbmQgZW5jb2Rlcg0K
PiB0d2ljZToNCj4gDQo+IG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWF0ZWssdmNvZGVjLWVuY29k
ZXI6IEFkZCBNVDgxOTYNCk9LLCB0aGFua3MuIHdpbGwgZml4IGl0IGluIG5leHQgcGF0Y2guDQo+
IA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IElydWkgV2FuZyA8aXJ1aS53YW5nQG1lZGlhdGVr
LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy1l
bmNvZGVyLnlhbWwgICAgICB8IDEyDQo+ID4gKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy0NCj4gPiBl
bmNvZGVyLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlayx2Y29kZWMtDQo+ID4gZW5jb2Rlci55YW1sDQo+ID4gaW5kZXggZWJjNjE1NTg0
ZjkyLi43Njc1MzkxZDdlYjAgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy0NCj4gPiBlbmNvZGVyLnlhbWwNCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWss
dmNvZGVjLQ0KPiA+IGVuY29kZXIueWFtbA0KPiA+IEBAIC0yNCw2ICsyNCw3IEBAIHByb3BlcnRp
ZXM6DQo+ID4gICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxODgtdmNvZGVjLWVuYw0KPiA+
ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTkyLXZjb2RlYy1lbmMNCj4gPiAgICAgICAg
ICAgICAgICAtIG1lZGlhdGVrLG10ODE5NS12Y29kZWMtZW5jDQo+ID4gKyAgICAgICAgICAgICAg
LSBtZWRpYXRlayxtdDgxOTYtdmNvZGVjLWVuYw0KPiA+ICAgICAgICAtIGl0ZW1zOg0KPiA+ICAg
ICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTg2LXZjb2RlYy1lbmMNCj4gPiAgICAgICAg
ICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4My12Y29kZWMtZW5jDQo+ID4gQEAgLTc2LDYgKzc3
LDE3IEBAIHJlcXVpcmVkOg0KPiA+ICAgIC0gaW9tbXVzDQo+ID4gDQo+ID4gIGFsbE9mOg0KPiA+
ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY29tcGF0aWJs
ZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAgICBlbnVtOg0KPiA+
ICsgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk2LXZjb2RlYy1lbmMNCj4gPiArDQo+ID4g
KyAgICB0aGVuOg0KPiA+ICsgICAgICByZXF1aXJlZDoNCj4gPiArICAgICAgICAtIG1lZGlhdGVr
LHZjcA0KPiA+ICsNCj4gPiAgICAtIGlmOg0KPiA+ICAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICAg
ICAgICAgIGNvbXBhdGlibGU6DQo+ID4gLS0NCj4gPiAyLjQ1LjINCj4gPiANCg==

