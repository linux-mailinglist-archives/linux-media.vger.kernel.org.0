Return-Path: <linux-media+bounces-26751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBCDA41337
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 03:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42E6D18937FA
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 02:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB42719F42F;
	Mon, 24 Feb 2025 02:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aAE6xFiq";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Cc5Rjjw6"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5154E19CC08;
	Mon, 24 Feb 2025 02:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740363111; cv=fail; b=XDsuifqb57Ol3epslUWHtpQUa4O1MC9KUS5KCRJidjP7fQHAlQWiRh5PmHzenc3xtaMsnfaYN/BKDDDn5vXjSmaiqMmM7eTRJQoYrg4ZK9L2+JBysU509PvGFbvyqQaJskB5j4G8uyrDHXDqcz7grAupMO+sdkLXXKftoMJ6MKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740363111; c=relaxed/simple;
	bh=FzfzCKucufYq23bwKPdVFGcmeWYnS2sgkfoOFUrWFjQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EHD55qOcJ9rrIxgq2bobLPdVCJKvbcKrR9X+7brRs1GSF4mLWJiwLfaVGO+kzBLspJFcouuJUql/EmTM030Xe/eNgU7RhJx5Z0+IWScuvWGre5jsqAnFcy+Oaw5pHil5CZCkoYEtVlWH5U95VC8vhqomJnb2w529+kR8QfC6274=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=aAE6xFiq; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Cc5Rjjw6; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b17fa398f25411ef8eb9c36241bbb6fb-20250224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=FzfzCKucufYq23bwKPdVFGcmeWYnS2sgkfoOFUrWFjQ=;
	b=aAE6xFiqn6HiC6aY+1W83eNFtnD4jiYdzH80GK/F4qSpJFBhl0V8B6gYVrn70UeRCzHaaXHo0U9tSIfSE7cUVo1DPZ187EI1GoXEVJmLFN4rL7WdRDiOnCHPrF8cBNh8PgST2ry8ZK1Eg5LmJRmgEXoPXf/0aQex8+dbVG1TMC8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:2fbbbd09-d8f1-416c-a6b2-8a01deff897d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:aeef7bb5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b17fa398f25411ef8eb9c36241bbb6fb-20250224
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 890620608; Mon, 24 Feb 2025 10:11:44 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 24 Feb 2025 10:11:43 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Mon, 24 Feb 2025 10:11:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLa9Gh30p9Tb+cCI8krhMJhobUJEvwuhU0E1IKaoQHtEaE+znMvgqgzg3hmtCkGV/VtEAUPBwWxdGAl2VZyPNC/zSTRyJyfiLCUrAtgn72fsmU9mkbdeRvnxvwAWMKqPpJqSKY2C8U7FyEYYy7bVbRur1I6Jm5iDwC8qhfyvEvRoIcm9LVMaBoRoZAbwc/k4mUj6ZpziLeMmXtO4wr4M5p4Cfx7lO1CVo3ufcOpTZDTE8fR1Z3rPTQn53GXZOWaiYrQufFrcrsdfU6yvIepYWndWSTY9pKJahdEF84RPv2OGf30/qPJ/1GLgO/YjkFioid9IXxThhmNtV6COv7NmPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzfzCKucufYq23bwKPdVFGcmeWYnS2sgkfoOFUrWFjQ=;
 b=HO0eXvaYeamNRdXnTUZAlVueVaml5G2r9foog22JSigY/sQWSnZU375Pv79zmV+bTe/zRyvZBV8AdqZMKQIHeP9Xq4sghFK/NfvsL//xKkVt4MzuaxlRUxgKzPJyFu9fAdEENRXQgaQ0Y+h7t3TKbGvsQdG8lXI6kBKBT7nz2iRQ2IQvw4TUZypRJzjhptPCEtw9VIb6l2bEe8QnLO4VhWRo0vDZUm53xC/LM5EMoe6tUyt6qkZ3wSAwR5tR1Bd1GK8XY1TR1xn/ACtvrQBXpWSzggop/G4N/WOZvva5b2t57PV+uTWi1rZyVY79zROz9K2tDDcWFYuNcxrs3jIcDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzfzCKucufYq23bwKPdVFGcmeWYnS2sgkfoOFUrWFjQ=;
 b=Cc5Rjjw6MxihBhFFX4172DcXG8dm20kjaqd0exELrsbdUCq3pbPf99otoO4aw7blMk60JoE9Un57W0PnFvIFOoZD/7D/YRayYYxs/vvul7+dyINo6XZVJiY9imQfh7Gz1TU5TuKLRPJT0cTpUezpo5GQGXXATxN7Vcxi5kJgGEY=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by SEYPR03MB8479.apcprd03.prod.outlook.com (2603:1096:101:20b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 02:10:36 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 02:10:35 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 0/2] Add support for MT8196 video encoder
Thread-Topic: [PATCH 0/2] Add support for MT8196 video encoder
Thread-Index: AQHbhA4ljSr4iLX7JECsX/iO20uCfrNR6VWAgAPRIQA=
Date: Mon, 24 Feb 2025 02:10:34 +0000
Message-ID: <bee94bf8c47e66beb4021b19e6d0cde8ca829b20.camel@mediatek.com>
References: <20250221031004.9050-1-irui.wang@mediatek.com>
	 <cd8f43a310f771f7db7ae1ab7fb2f8b5d554c2da.camel@collabora.com>
In-Reply-To: <cd8f43a310f771f7db7ae1ab7fb2f8b5d554c2da.camel@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|SEYPR03MB8479:EE_
x-ms-office365-filtering-correlation-id: a8ad9458-1e39-457d-4a2c-08dd54786c8b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RWl2ZkFranFWZmhFNldvWmFBbUI0dnd4NlpvaHp3ZCtBbWNNMnkvb2ovZkJK?=
 =?utf-8?B?dVhHMjdsMnJ4d3R0NDRoTjBCSDVNcldSeUtKL3N0djVlUWZWb3FOL0MvU1l1?=
 =?utf-8?B?bi92Z2Q0WlZyaVlNY1M5dWlEcGJvNmJkOEx6LzQ4SkhHeENqMlFsVy82ejc3?=
 =?utf-8?B?bnhOS0ZRMUhxWjZCM3FSREZFWmNINEM1OGtpdG5tQ0V6NlZYUGtjSW5ES0l3?=
 =?utf-8?B?T1J6cjNZVjcycC8yNUNVd0U0SmRjaEp1Qk4vcHpRbjMrSHFUZjlKNDhmSFR6?=
 =?utf-8?B?RnhxbnJhb01oVXJCUExIc0JGNkQyTkJzQjVEbXdUaHJLdURwWjBjVzBlNWZG?=
 =?utf-8?B?ZXV5Nk9jZW5PZEJaWm5qaGg0MFhhbm9uRmlMMWhLcjlLUDNRZEJsZDJMVE9K?=
 =?utf-8?B?M1pUaDdldVhjeXRzZCtVWXp5VzNUZEtieThnRUU2QkFxVUk4ZUdjS2xpOU1Q?=
 =?utf-8?B?UVV5NnNlMXlWTGc1am9NTWRNR25LSXhueXMvZFVUQjdIU0tiOTArOG1Ud2hJ?=
 =?utf-8?B?dUE0bGRPVDQ2U0lMRVBQb2ltNXFzckU3MHVtRWVJRmRNL3FQdGlyY3ZLZ1pG?=
 =?utf-8?B?aHU3RUFNcWUzb05TaWNJVnZvTUZZOXR3aTFHYWVDalNBeUltTEdaQW94YkVI?=
 =?utf-8?B?U0dtZFgrTHl3emhBRUlJaWg1MFI5dkgrUVZodVJtWEdSeE5uNjJHd3VHdmlk?=
 =?utf-8?B?a1lqVTYzUUVLMjZHUHE1U3A3dm5JZFROdFBkV0xHMXdJN0h5ZnRjQlMwaFpB?=
 =?utf-8?B?bzVhMEljU05TN3d3SlczRVNCZXJWQ1lmRDBMc3QrK1hDWW1CU2JMZzVrd3l6?=
 =?utf-8?B?ejZ4TU13QmNOMXNRQ3hmdFJ1Mmw5NlRsaVkyQUw0VEZVQU1kck9WQ2s5Zk5h?=
 =?utf-8?B?bW1rVTgwTXNYblc5eU9qK1lEUkNEcXZkUy9wcXhNemoyYnJ3Z2pVVDkxY1h1?=
 =?utf-8?B?Q1luem41cnIzcm5pZUNOejNFSkpBNENrRVRIMG5CNGlNcnYvQzJRRzZNRUpN?=
 =?utf-8?B?WlZhd2NJVmcrYStDMk9WNEIwemxWN1VMZ0d5V2xTRXl3SzNaVUptd2xuVVB1?=
 =?utf-8?B?bEJqU3czRnN0aUdnVThRKzRBUk02Y0dYdkN0WFlQelJpQ0NrZzVFYXFXUmQ4?=
 =?utf-8?B?dSszNi9pem1td0tRTDJMTFNjakJiVmtESkRjZnhBcm5tbUpaRDY2aGRNYy8v?=
 =?utf-8?B?NFBjWXZpMDcyTEFEWGV4N0Zmc3laOWxwRnZuSy9JUGtCKzFSN3ZEOVZ5WWtp?=
 =?utf-8?B?V0szNzlNeWVmYS96WVk1cllQQjJqYkIySGFiTTlwNlEyVVZvamJBakpwY3o4?=
 =?utf-8?B?WjRTcHZyOW0zejR6L3Z3WnZrVTVkTjlrZE81U0kvOC9ndm1YNGNWdGFMc2k0?=
 =?utf-8?B?QTUzbUFXZXE3UGpmd2dVT0s1Sy8wWWt6cFpmN01UaUMrMHNCaFMvSCszR2xi?=
 =?utf-8?B?UVY4amVId0NsU1F1ME1TR00vTmdDUmRUcy9wWkJHWmsyOWp1VFdaZGZWUGhD?=
 =?utf-8?B?bHpoZWtRNUordm1FdDBiY3JrcUxBNFl6cGJpcURZMERLNTVkaktsVjNmV2FH?=
 =?utf-8?B?M2c4em9HSUlGVHJpck5xdVErOFFmaGk4Y2ZReGtLclJGMEJQWTlMTXgyNTA3?=
 =?utf-8?B?VUU3T1NYZk1zQzNwUU13Nm9sOGhhT2ZQZ05Damx5cHhRMzFsUy9GOGtzb0R4?=
 =?utf-8?B?Qm5jTnBtcnpZdUxlNm1XZWNGelZEN21vVEJpZ2J4N0VnR1M0NzFRUTZVYmJj?=
 =?utf-8?B?cFFHSnRSYUROTzlZdGtEUDdveEN2eDdqWXArMzc1SWY1K0VGdkkwNG5FS3FU?=
 =?utf-8?B?aTh0RlFTVXlTQW9aKytyajhwMEl2SjVUWjcrNVJVRzEvM3E0MUJOYVJSWFl0?=
 =?utf-8?B?U1poY01XYjNmV3ZqODIvS2U0dTVvVGZYSEs3bC9ZZll2L0VlWm9JNHdBek5n?=
 =?utf-8?Q?+XEefzmy5Pw1UINzlGt1h5P0LhMTvflJ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2N6eEdPTGVQdVBzWWxRbWJHa013NmVwdG1BUHpKNmRSKzY2YlpVdHZCbUNQ?=
 =?utf-8?B?dFIra0VtRlpWclNYVG5vbmh5VlRjbkUyVFBlanVObGRiQVR1aStjbEplbU5m?=
 =?utf-8?B?aU9FS3htdHQ5UjMxVW44eWpIK2V4T3QxT045eFlPdnZvWE9hQUozbTFVUTZx?=
 =?utf-8?B?L25BSEorTUpLcEVUck9vcmJEWnhWcXdnL2FJdGlFK1hSU1FEUy9JVVBSV2xE?=
 =?utf-8?B?Qzl1Wm93MFFySWNSUkhsV2pKMUhjRXVDcXNnTWNwZ1hoL2ZBazhJRDQ1SVk0?=
 =?utf-8?B?bjZ6ZlAvdC91ZGF0ejBXRHpYNG55UkRQdGJPa2x2SUcyN0hBeHFEYm5aaXdS?=
 =?utf-8?B?NW85WmM5S3lTQm1JbC8wRmo3aUxDaFpVNGdQYlRvdTFKYXM4S2lKemVWK3N1?=
 =?utf-8?B?Skw0S2JxUjY5TmRkbUdtSmEyaTVPN2xldjdLd25ZL28wa0NxSW9pTmdYTXNp?=
 =?utf-8?B?RGVxb0UvVXFua25HWHpFczg5VzJoU1lqN3o1dGFOV0VvVDVHaDlxY1czR1Bl?=
 =?utf-8?B?T2J4Q2ViRkRpbkdPSzB1VVN6SnlXblorRmlTTUdHRjQ5MTYvWTFGNnhwbHRP?=
 =?utf-8?B?RmtjMU5qeDM3WWZmK2FoV0lvVlJSK2ZvdDU4bE5YemdHdEM5alVBaGdOWDlG?=
 =?utf-8?B?bXoyVE1kZVlJQjVVWDlUbzMwM2tMT3JPZDZXS2cvcWlsemtYUk5YSlFxN1Qz?=
 =?utf-8?B?OTVTeE1RU0VFZmlKN3JpNkhGYWZLdm1HSlhCdUpTSnBTYlZQdW0wNkZHSHRW?=
 =?utf-8?B?L1FoVHo1SjhuSDUrQjRQbnhWMUdaVEdYckhvQzV6T1RKYWw4U25KUGthcEN3?=
 =?utf-8?B?SlhMU0lVYVNSTDgxMXQxQ3krZkdmYmQ3d1lGTU9UVlZ3VGoxZWxLNXdVT2FQ?=
 =?utf-8?B?UVFPSmxvVTFPamo1QXJWQXFESmFrSERGdHJVN1V6Z1J3SWJldkw3ZFlzZm5U?=
 =?utf-8?B?eHRtRUthVWpoOHVuUVpaazFPQlRwdVlPUWwyL3RpNnlBK2lSMFFSdGI4dUlm?=
 =?utf-8?B?eVY0cHl4K0hiUno2SWM1eEtGM09EWENCaWV4NWlJU2lnMnRuVGtVTk1TWStF?=
 =?utf-8?B?b3JDL1dqSUJaWkNlWlZQdFg3M0lvUy80WUNEdHRrSkNTR3M4TFJRVnZxNm0y?=
 =?utf-8?B?UmpLZ3l0TnZPUGRwQm1TWFBBcjBjbFo5TUdVZTMyYTZJWVkyQktHRHRmMm1D?=
 =?utf-8?B?ODNaQml1R2Y1YmxsSVFHbXBJb01yREFHaEl2U1FNQ2lhakNjck5UOGJKYnBF?=
 =?utf-8?B?ZGkzdGlOU0p6NUtQR0FBT1AwQmdjcGtnNHlVMVlwK2pGejNzdVBsamNiRDMr?=
 =?utf-8?B?eDBCNUxqQU5TQWtubjY4THRPSUJMYzVEUzZJZmlDM1NEWEtjSDdHcHR4eDBl?=
 =?utf-8?B?bFBLQW51K2JwSGZTa2h0VUxkVG1QaURJTTJNRi83eEV5TzJNaWZVTGs2SEts?=
 =?utf-8?B?YW1renJodXJ4bUx0eWhhK0dVMjlzS0NseXR1MW1PQm5DUUVUTDFqZlY5cXJn?=
 =?utf-8?B?c1d3L3hyODdmUWFXa1UwVnRDTUdlR2N2ZzhtZ1BYNzVmZlRqMCsrV0piQzM3?=
 =?utf-8?B?YlZEN0ZQdk9heWxBTHZSMllUYS9IRGpORGk4T1lsV0NxQ1J2RlFObmkzYXUx?=
 =?utf-8?B?c1RkejdUVm1JVVgzcC9kaTI4dEp5ZS9kSk9PUWdHNTFtMGloa1hhZjBwS250?=
 =?utf-8?B?Wi9FVHlQMkxFdWFrZmcyZFdKSU9NN1hkd0hhOVpDK1hoTVhaSDhNbGhUVGR6?=
 =?utf-8?B?RC8yMnZRWk9PM0I1RWtZTk5TTDg2TmhMVzRQTXRhVVAvYjhkc0FoTk5TNWRl?=
 =?utf-8?B?N3NCam1sdWxZK1JtUGZlT3JESExXMENub2RLWk55M1pMRksxY3I0WXpTUmFz?=
 =?utf-8?B?OVI1WDNDbFZEeEVONEJpZWhVSjVrNDVyVm12ZSsvRjJaK3h0YlJLVnRsZXUz?=
 =?utf-8?B?SUdRSlk4dE84Q1lVTytOY3BSY3lTQWgwMmNGUGJQM0VRMlNnYkZhbTVwQmpX?=
 =?utf-8?B?QzhYMndCU0luWDlTcHNFck9qZ3hwWGpsVnlDYUhzclBRRFhVUUdhWThNUFBG?=
 =?utf-8?B?VHMxT01WL0hnSWZEUk15ZXBYWXNyckJBdjczZnJ0VXFPdTREZWlVenA1ci9S?=
 =?utf-8?Q?gfFTp94h9nFLLeqGdTvvACaMY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A292051C7C833F4DB8A4E23D4E8B60B4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ad9458-1e39-457d-4a2c-08dd54786c8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 02:10:34.9891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MKrFN6md2St1RAdv68INQoLFrJaCmzp8BCCl4IOdUEcx4m+Sxeh1YFpBRoLNcBNVdFCE2uxa8YkyROBDrXJ9aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8479

RGVhciBOaWNvbGFzLA0KDQpUaGFua3MgZm9yIHlvdXIgaGVscCByZXZpZXdpbmcuDQoNCk9uIEZy
aSwgMjAyNS0wMi0yMSBhdCAxMDo1MyAtMDUwMCwgTmljb2xhcyBEdWZyZXNuZSB3cm90ZToNCj4g
RXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVu
dC4NCj4gDQo+IA0KPiBIaSwNCj4gDQo+IExlIHZlbmRyZWRpIDIxIGbDqXZyaWVyIDIwMjUgw6Ag
MTE6MTAgKzA4MDAsIElydWkgV2FuZyBhIMOpY3JpdCA6DQo+ID4gVGhpcyBwYXRjaCBzZXJpZXMg
YWRkcyBzdXBwb3J0IGZvciBNVDgxOTYgdmlkZW8gZW5jb2Rlci4gVGhlDQo+ID4gY2hhbmdlcw0K
PiA+IGluY2x1ZGUgaW50cm9kdWNpbmcgYSBuZXcgZW5jb2RlciBkcml2ZXIgaW50ZXJmYWNlIGFu
ZCBhZGQgc3VwcG9ydA0KPiA+IGZvciB0aGUNCj4gPiBuZXcgZW5jb2RlciBkcml2ZXIgZW5jb2Rp
bmcgcHJvY2Vzcy4NCj4gDQo+IHRoYW5rcyBmb3IgeW91ciBjb250cmlidXRpb24uIEluIGdlbmVy
YWwsIHdoZW4gYWRkaW5nIG5ldyBIVyBzdXBwb3J0LA0KPiB3ZSB3b3VsZCBsaWtlIHRvIHNlZSBp
biB5b3VyIGNvdmVyIGxldHRlciB5b3VyIHY0bDItY29tcGxpYW5jZQ0KPiByZXBvcnQuDQoNCk9L
LCB3ZSB3aWxsIGFkZCB0aGUgdjRsMi1jb21wbGlhbmNlIHJlcG9ydCBpbiBuZXh0IHZlcnNpb24u
DQoNCj4gDQo+IFNpbmNlIHRoaXMgaXMgYSBmaXJtd2FyZSBiYXNlZCBlbmNvZGVyLCB3ZSBhbHNv
IHdhbnQgdG8ga25vdyBob3cgdGhlDQo+IHByb2Nlc3Mgd2l0aCB1cGxvYWRpbmcgeW91ciBmaXJt
d2FyZSBpbiBsaW51eC1maXJtd2FyZSBpcyBnb2luZy4gV2UNCj4gY2FuDQo+IGRvIHJldmlld3Mg
YWhlYWQgb2YgdGhpcyBvZiBjb3Vyc2UsIGJ1dCBtZXJnaW5nIGRlcGVuZHMgb24gaGF2aW5nDQo+
IGZpcm13YXJlIHVwc3RyZWFtLiBXZSBkaWQgc29tZSBmYXZvdXJzIGluIHRoZSBwYXN0IGFuZCBp
dCB3b3JrZWQgZm9yDQo+IG1hbnkgU29DLCBidXQgdGhpbmdzIHNlZW1zIHRvIGhhdmUgY2hhbmdl
ZCBsYXRlbHkgd2l0aCB0aGUgTVQ4MTg4DQo+IGZpcm13YXJlIHNpdHVhdGlvbi4gSG9wZSB5b3Ug
dW5kZXJzdGFuZCB0aGlzIGNvbmNlcm4uDQoNClRoYW5rcyBmb3IgeW91ciBhaGVhZCBvZiByZXZp
ZXdpbmcsIHdlIGFsc28gd2FudCB0byBzZW5kIG91ciBwYXRjaGVzDQpmb3IgcmV2aWV3aW5nIGlu
IGFkdmFuY2UgdG8gc2F2ZSBzb21lIHRpbWVzLiBDZXJ0YWlubHksIHRoZSBwYXRjaGVzDQpzaG91
bGQgYmUgbWVyZ2VkIGRlcGVuZHMgb24gZmlybXdhcmUsIHdlIGNvdWxkIGRvIGJvdGggdGhpbmdz
DQpzaW11bHRhbmVvdXNseS4NCg0KVGhhbmsgeW91IGFnYWluIGZvciB5b3VyIGhlbHAuDQo+IA0K
PiByZWdhcmRzLA0KPiBOaWNvbGFzDQo+IA0KPiA+IA0KPiA+IElydWkgV2FuZyAoMik6DQo+ID4g
ICBtZWRpYTogbWVkaWF0ZWs6IGVuY29kZXI6IEFkZCBhIG5ldyBlbmNvZGVyIGRyaXZlciBpbnRl
cmZhY2UNCj4gPiAgIG1lZGlhOiBtZWRpYXRlazogZW5jb2RlcjogQWRkIHN1cHBvcnQgZm9yIGNv
bW1vbiBkcml2ZXIgZW5jb2RlDQo+ID4gcHJvY2Vzcw0KPiA+IA0KPiA+ICAuLi4vcGxhdGZvcm0v
bWVkaWF0ZWsvdmNvZGVjL2VuY29kZXIvTWFrZWZpbGUgfCAgIDEgKw0KPiA+ICAuLi4vbWVkaWF0
ZWsvdmNvZGVjL2VuY29kZXIvbXRrX3Zjb2RlY19lbmMuYyAgfCAgIDIgKw0KPiA+ICAuLi4vdmNv
ZGVjL2VuY29kZXIvbXRrX3Zjb2RlY19lbmNfZHJ2LmggICAgICAgfCAgIDMgKw0KPiA+ICAuLi4v
dmNvZGVjL2VuY29kZXIvdmVuYy92ZW5jX2NvbW1vbl9pZi5jICAgICAgfCA3MDQNCj4gPiArKysr
KysrKysrKysrKysrKysNCj4gPiAgLi4uL21lZGlhdGVrL3Zjb2RlYy9lbmNvZGVyL3ZlbmNfZHJ2
X2lmLmMgICAgIHwgICAzICstDQo+ID4gIC4uLi9tZWRpYXRlay92Y29kZWMvZW5jb2Rlci92ZW5j
X2Rydl9pZi5oICAgICB8ICAgMyArDQo+ID4gIC4uLi9tZWRpYXRlay92Y29kZWMvZW5jb2Rlci92
ZW5jX2lwaV9tc2cuaCAgICB8ICAyNiArDQo+ID4gIC4uLi9tZWRpYXRlay92Y29kZWMvZW5jb2Rl
ci92ZW5jX3ZwdV9pZi5jICAgICB8ICAzNyArLQ0KPiA+ICA4IGZpbGVzIGNoYW5nZWQsIDc2NCBp
bnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+
ID4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZW5jb2Rlci92ZW5jL3Zl
bmNfY29tbW9uX2lmLg0KPiA+IGMNCj4gPiANCg==

