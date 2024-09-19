Return-Path: <linux-media+bounces-18398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3684E97C594
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2024 10:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8449284956
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2024 08:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8042F1990A8;
	Thu, 19 Sep 2024 08:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="H9DExqxc";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="dqpp7xRj"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31AF190664;
	Thu, 19 Sep 2024 08:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726733435; cv=fail; b=oZ5oXDbURQjs8ZIyakSdHc0c/nQv0qd9mL0LeiJsILkpCeU/1+D5DxFLwhJwVOR49BtMM1Ov74MpQHIJ5hgMYgJbJ5lD01OuG0ZAZPrmBuLe+mhSUBi5LdnRFYUfqJWwUVxN/0wKi9IgQ3VzD0JeYVedolPycoZooyXRQYgv+cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726733435; c=relaxed/simple;
	bh=z9VJf7lwkwu7PCQu7H9MvZO1Q2c1H+kdtfs9CFX1+5s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aMrv3ntXGDRpDlOha3NcgU1RP+Prgwkj5q5n95VCSLwY3OVImbQx1u+bIZnlErnrRZP73wlQOjOrwjkWES98fE0rpDiVWQ0kzxev9eajB0nNtmQh30Q2bdUulreZyKETONMbaJ+m7yBxpkds03M+bj31+wXfz+kz6L7aXfqjYlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=H9DExqxc; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=dqpp7xRj; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a1be27bc765e11ef8b96093e013ec31c-20240919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=z9VJf7lwkwu7PCQu7H9MvZO1Q2c1H+kdtfs9CFX1+5s=;
	b=H9DExqxcL+k+Y6nRMt8rbwixgAwh4X72hURRNtqRhlCoua8146mfiM0lQfZtIGy4T9Lpv7XwSh7c3GCvl1tBzjWrfoRFybMWfR7hxNRl0PFeaELuOCCv5xVka8qxhcZwWTxjRi31rNfrmHqk4VYpGw+kOuQDBc1OcH51AX6G+RM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:01ce42b3-634a-4bc9-a0d3-c1594f8a2e90,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:cfe5eb17-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a1be27bc765e11ef8b96093e013ec31c-20240919
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 232318253; Thu, 19 Sep 2024 16:10:28 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Sep 2024 16:10:25 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Sep 2024 16:10:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxdKty/TwEeXWb2+XG8yATJ7m0CWj7vxIogthap86ez3e57zJLhQmmAqg325QUKs+gvui5F1eXiTpbeSZFVf28WPOZrSu5fkzaotGM5XSxjfdhmJ4t3UXVcDa4+gM8Aoj46PwSaUzXn1Mcwt91kgzmBaNTiHrCmmXr+G/B3syrzT+ock8r/Lwelz1x55HmvJnnI1g4AsGjwVMbZcI4nsdjC1OAPRILwbw+qqCVoOSsD43oMePwQb0MfESLq2FJB1hTQRfJJ2ajxQV6NncVw0qg+evR8Tcy+4EfaOJo1U2T4+1aYF6Uy5RhYesEh7X06LCuMRHcE2XCfn1fIaeLdcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9VJf7lwkwu7PCQu7H9MvZO1Q2c1H+kdtfs9CFX1+5s=;
 b=PPjUwUwKMYuCG/uit0u9gqYXebQf94H45wNKcJXWrqJDOqB/L1FR+7U0qR5m9qr0HHESNRuvawUN8L+xK7mEoq9b3PJ26PcmhmrPXSDX8XsKM2ZfdUxFLsKZlg7WLcydJzA5lQzDeGtRCxep4L1XKmHkv2zICX6TsGZhPdlM5fwIKF0WurTq9EBim54p/z+LA1lby7iFMfgHKw8qaENXd6T4elx+MGv8+MO4x7/R21eprnuttnTj0Acz7qHgRPIbqUWCl3y80iPKxMMlIfUrxUYpw1EnKDo+N/v8p+idKi7LvKIVasMqUSdORMJw6vSNIhiRV25a8JIZ+AeSkD44Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9VJf7lwkwu7PCQu7H9MvZO1Q2c1H+kdtfs9CFX1+5s=;
 b=dqpp7xRjcVuuq4bEii6uVh2/4QoN5xu1JnwYE0Vdz1fNjvb586Hn4aDukhLwQ/f7EiWY0/VyEO97RD76cLVmj0rJObk1OQXOrrDQMi2vNnSzP0mExaVzK71ZZxc3LIrc+nYD2VwuZGhySW5nD/EbxXnXUZLd+/iZVEGJhCN7Xsg=
Received: from TYZPR03MB5566.apcprd03.prod.outlook.com (2603:1096:400:53::7)
 by SEYPR03MB8262.apcprd03.prod.outlook.com (2603:1096:101:1b2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 08:10:22 +0000
Received: from TYZPR03MB5566.apcprd03.prod.outlook.com
 ([fe80::dbc2:ff5c:56d:2187]) by TYZPR03MB5566.apcprd03.prod.outlook.com
 ([fe80::dbc2:ff5c:56d:2187%6]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 08:10:22 +0000
From: =?utf-8?B?WmhpIE1hbyAo5q+b5pm6KQ==?= <zhi.mao@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
	=?utf-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?=
	<shengnan.wang@mediatek.com>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, "10572168@qq.com" <10572168@qq.com>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGlhb2ZlaXcgV2FuZyAo546L5bCP6aOeKQ==?=
	<ot_xiaofeiw.wang@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] media: i2c: improve suspend/resume switch performance for
 GT9769 VCM driver
Thread-Topic: [PATCH] media: i2c: improve suspend/resume switch performance
 for GT9769 VCM driver
Thread-Index: AQHa+2o5xGUgpO8fLU6T3zrq11VWALJe3+mA
Date: Thu, 19 Sep 2024 08:10:22 +0000
Message-ID: <40de250a3a516110119e451251bf7b5e9a76818d.camel@mediatek.com>
References: <20240831055328.22482-1-zhi.mao@mediatek.com>
In-Reply-To: <20240831055328.22482-1-zhi.mao@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5566:EE_|SEYPR03MB8262:EE_
x-ms-office365-filtering-correlation-id: 6d7907e3-8ed0-4172-08ec-08dcd8828286
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TFVQK2RVNm5ONlJkZWo3K2dlQ1lsVWU2SUVNN0xkVzhaQXNVSHFWNFNxZkg3?=
 =?utf-8?B?NHdPWVhHZk44UkZYNVdyVWdRMjY1UjRxdm5oRWNYYkE5Q3FJNERSVURIWUJ0?=
 =?utf-8?B?R3k5T2phSGtBNWZmOGR3eHk1SVJwZmMvVnBtREJnbW8vYUFHa3M4ZCtETmNH?=
 =?utf-8?B?SGFYSW5mNTVoVkwvWjZjQ01KYVRHRi9Ia1JNSm1NUHp2T0FxbGNDOUZWWUpx?=
 =?utf-8?B?T0xSay9YQ1pyTnl5cXhSMGxGcXFNcGtvN1F6ZlNVRU1pdnNUN1VVK3ZBOS9E?=
 =?utf-8?B?N3E3NFgvTGpKTTBLOFY4SmFCYjQ3aWtXaENMTGZjMlVYTmk4WFFUa0JsOGJU?=
 =?utf-8?B?ZXN2Qm8wRmdEOGJzNXRGbzNDNzZBK2ErTEZSUmw4ekFqSGNRUFZlQ1cvOGp0?=
 =?utf-8?B?MUtjcXBkc1RIWDlQSGlHYUlWY1FmQzNKcjJXbVBqc1lucnUyVEVYVDJUbURF?=
 =?utf-8?B?UE1jZEUrcFJWWTNDNUZ5cFVNQ2xyWEZURE54dU1DbU9zdDZNemRJN0VwdlFo?=
 =?utf-8?B?azUyT0hIV3BTRG00NnhCZWUvL0k4RWZJREdWM2UwQXczM1FOSWdBREpwUHdn?=
 =?utf-8?B?bWhUckErSEpyTTlRMXNDYXdWNVdhbmdJNXlkU0M4WEtCQzE3TXh4bzJhUVF5?=
 =?utf-8?B?VUc2VFZucC8vdThOck1WdldHcWM1TUZiKy9TZHYyWVhObXRUb0ZPQUluLyt1?=
 =?utf-8?B?MUFOcXVwOTNRNU1tWENVYWlJaFllLzRZM0RpT3ZIVG1SakN1TjE1UHo5bXFv?=
 =?utf-8?B?Z0x0anNTOGl0cTlvMzlJbjQvRzA5M1AyRTRFaDBQS1ZKWUxEUkd6RmlSMytz?=
 =?utf-8?B?djFPdUFoZDBKYTlXOHJFczJHMVk0QkkyQnowdDY0NzRlQjhMQVpSQmN6RzJM?=
 =?utf-8?B?ZUFtVEpOb1BXWEFSSFVvajZJbWZaQS8zdS9jMkw0bjh3OUR6NFNMS0Q2T28x?=
 =?utf-8?B?Z1ptWVBWUTRHTzBZWjd5MFludkFKWGZDVWQ0ZFFNM1A2L0l2ZVhzSDBkREIy?=
 =?utf-8?B?QU4xem5NRHJGRHU1YXRzMFN0dVo3dkZMSUh6YU5teXpPbndPSW1OWHNRbDdZ?=
 =?utf-8?B?TWhMaWVNVzJIanZsVzhNYnR6VERVM0ZBaWNIYjRWWnhIeDEveWJudWoxSXRq?=
 =?utf-8?B?OWhsdUxRZ3NMS2xGZTJqclFQQVZYckQwOWNnTHFESy9lRGtHMmtISkJzc0lR?=
 =?utf-8?B?M1p5YTJVanFvbHhvMDVaQjZKQ0M0WFNMSHVVRUhHaUg1ajQrUnFTQ1BZOS80?=
 =?utf-8?B?NHpLRkNNYnFDUVEzUzFMNGNBZGhHb2txTWF6d3pLNDdaaDBBb2doQmI1aTVH?=
 =?utf-8?B?TlppOFhpS1BNYUFSTEwxVVkvOXpFL2xzMXkzdFFQOGRJUkp1eHhuWkp0ZGlz?=
 =?utf-8?B?Z0hTVkRHU3hqOGZpYWIxTWRVZng4K29kOUp1VnhEcVBYUkhSNURCclYzeVg3?=
 =?utf-8?B?Z2x3ckt3WDVnQS9iYUViSncxM1pyZndnQUtzanFETmNMZ0srbE5hLzNsWXNq?=
 =?utf-8?B?ZjM3Vmd1Vk11YUNXV0czT1NuaUkwSHM5dVc3RGRkQ2dKOUc0R3kySGxlVk9U?=
 =?utf-8?B?VnFwVE9wMU03YVgzL2hvUkFMUjhnL2xoTERkY3ZudXo3VllmL29kZ1ZFQXla?=
 =?utf-8?B?Tmp0K2YvU2o0RGRBYkErZUFWZ1RZOTdCQjNxbUJvNnRycFgyTHEybC91RWNV?=
 =?utf-8?B?R2NDbW0rZmNzT1ZBTHZEZUp1akJkREdoTDlEM3ZETXFuNFdISHgvbTJVeWlr?=
 =?utf-8?B?Nm1JUGwvSUVXSEhsRnIvdUdaK0NYbFF1NjBjcy92TmR0WWdZVTczVWgyNVFv?=
 =?utf-8?B?YWFLRzhTVW15bzd5ZzhCUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5566.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEZZYTlFRzdpbnhZTXVqeTlqOVdUeFZwd1g2Snp0ckpOY2F3aVc1a3ZvdXo0?=
 =?utf-8?B?WlN6dWVmRnBYcnJIY0FrSFAvbzhYeEk3ekh5anlPMXgrcTNVZ04xNGtVQWZW?=
 =?utf-8?B?aTU2V3l3RitIc1p5TStnbDk3TExRM2UrMFkyb29DODdQWEg2N2Y4MVdYZ2FO?=
 =?utf-8?B?azd0dGszZXdOaUlaZFZYNVl6N1BsK3QyK0pJOGE5cUVSdE5xY3F1cmg1M0FI?=
 =?utf-8?B?NHJZS0E4UHRCRzE0QTZwYzduamVxdDJRR1RvcHVuQW1nWkgwUE1wS3kvOUlu?=
 =?utf-8?B?NzJ1dlY0N1hKT2Q2ejIzMkMyMmtSS2p2ckZFMy9oak5DdzczOWFTZk9BTzZD?=
 =?utf-8?B?eWozOUFCNkdLK1IyNittVkgrOXowUmVGZjR5U1cvd1A3ME5Edlc0MHJYUWpX?=
 =?utf-8?B?NEdBNTY1cVpYaHhrcTB6ZmVCK0lTWjBqNjh5K0p4VERvWWlJZEYvdlhieWtm?=
 =?utf-8?B?RlN1TmJYMGVkbnNZemtzYTNNOGVYazd5U3h4RDdPVkc0dHRJeWpmTHJ4NkRN?=
 =?utf-8?B?OXU3YW1vdDhWV1dtSnE2Qi9CK2o0dkFJZE8yOTRkdzRYQ2kzWjFYTUVsR1Fn?=
 =?utf-8?B?endMLzhXMHlKQk9ub2ZZRnFqRzJxWkVOK29HK2VEZzJtWFEvaWJTeE9vTUhC?=
 =?utf-8?B?Vmw3cERPZm11a204QWRhU1piU0hoSlZGRExBZW5UUUJEQllLdmdkeUZ2OGNt?=
 =?utf-8?B?YXJZNmp1WmNCZHU0alBoMHhBVkIxQ2ZWVEtOV3NRdllBZ2diTGprRzRHMXRp?=
 =?utf-8?B?b0cxdG1QODcyYW42SU05TGhQTWtVMXBhalJUUGtLMCs4aitYUUxMODR3MzB4?=
 =?utf-8?B?dldKVlV4cjdWTkpHS3dVZXo0S25OTkJBZFBUMnJXdW5odzF5ZTNNTVZnWGkx?=
 =?utf-8?B?ZHErb1AvM0xuazdGb0liQzcwaUtOY2czT0xmUGg5K0ErVldETDFiR01MUEl6?=
 =?utf-8?B?a1VZV3YxN2ZhQk1MUTVwbFVQNklOWWVVM0FySmZkek1nRC9QNVRqRDYxWWY1?=
 =?utf-8?B?eit5WEw1YllSeXRFWTNiMTNoWUFDdkNYNnk2c0xLUzNFTWVmY0QrN0ppdzJx?=
 =?utf-8?B?SWwyL1h3d3FqaHAyWTJKM25UcmN2am9rdFF1SXZkTllDVi90eGxyVktGT2R2?=
 =?utf-8?B?MW5LL3hicDBxZHh3bFdaMDBNaVZJZFd1ZHlXVjg2UHNVdGhvRDI2MnZQYnM2?=
 =?utf-8?B?V05YeXVsems0dTgvK3NRd0dnRzZ2Tk1pVmJ3cmozaWRWYmQzNkFtU0dpVFlo?=
 =?utf-8?B?MzN4VnJVNEV5OTVQSWtuNEF4d090RjBZbmVOQW1yNVpkSE9UWmhSeGxkMVdC?=
 =?utf-8?B?WnpVaWxwTlFOVzJjbTFJU1JjbEpqRzJKUCtQQmRzaDBRbzJHcTh2RTNPN1lH?=
 =?utf-8?B?c1NlUjZEd2pGNVl0a2V0b3FuOTM3WUNLTzJGY0trbHA1MWkxNmZnNkdtYm44?=
 =?utf-8?B?ZGxoTnBRZHBLb1UwQzR4cVJOQ21PKytkK2E4dWF6aEF4VzhWMWo5SUFUcTlV?=
 =?utf-8?B?V3BGbkc0bnBWcHFTYXZEMkRRRnkzbjI2S0ltbld6czVqKzF6dWhWWllGVDVB?=
 =?utf-8?B?aERqek9aM3FRd0VPSjFGTURTWFAydnNYbTFGYWovTUZQYzVMUjlwVmdkaDRZ?=
 =?utf-8?B?RkNnUkVhYlQ3SGZ4eFBDZUdxTGt5NC9QRDhrM05nQkZxU2tLUzlZaFMwQTZj?=
 =?utf-8?B?ZjVZaG5xTTFYQnNRd254azZjRkc5d3ZiNjJERnJvWmhEUVA4MTR1TGtoRXpt?=
 =?utf-8?B?REZnd0VneGIwNzFWTk1oWG56aWlHNW83Wndrb09rRTlDc21mMlMzcGFNNDJ2?=
 =?utf-8?B?TFZXYWorcEFIb0V2U3Fud3lnc3pQYnAvMDcySEkrdnkxNnl0ZXNVS1dYZVhS?=
 =?utf-8?B?YTJVck9nbmdsbVhwK28xdFNBSFJIR1NXdW5NYVBpUmZIWmFiWEJ6VzBpMEZG?=
 =?utf-8?B?V1JOeWlKTWVMS2dsM0t3TzExbUM2cUNPVTBjV0hqRFlndDlJZlFMUmZiOXc1?=
 =?utf-8?B?Yy9Zd0ZlQ1RtdEdvTHZjVUpoT2ZXeFREWXMwTm5Bb2UwQnlFSDlwb2J0WjBW?=
 =?utf-8?B?cEhzYm05cmdvUDZCRXJKWXFFRHovR0JsYVVUSWF1d0NtL3NzWlZlRUhvTnJ3?=
 =?utf-8?Q?cPhchCtxYyAWW/FrS9CnmuNRW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BAE172CC7517140AE7ECD03BB8346E6@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5566.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7907e3-8ed0-4172-08ec-08dcd8828286
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 08:10:22.6496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rsDqsS3IC28NbV5cOvpxadzxH0JUv00Bqs07lfjb/9bWMhR3oa+SWddNMSzCQh6jIOgXLbyGaqfHEGaH6/cIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8262
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.988800-8.000000
X-TMASE-MatchedRID: TDQWNTPftUDUL3YCMmnG4reiCVGXv/W5TJDl9FKHbrkNcckEPxfz2AVM
	9kPsaYx4jOr21X6pVbm5SH5OKXgi86rSKJxiEx+/NCWPXerN72kUCv7A9Z7uMYWl8JGIf7DSFER
	dnCEO4XE7tgmmD1uPtBdA4MntDLmf6l6G7/kthyril2r2x2PwtcLiFiL0BG1uUJ9gH+o3hG6jxY
	yRBa/qJRVHsNBZf9aRAYt5KiTiutkLbigRnpKlKWxlRJiH43970YPaCYPZeTeUb5RW8t08FwkZX
	KgxfNJtDrRzbDnGdD/TVq7lYeeiPA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.988800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	8226E669C23DD900EAB7047BECD628DDB2EDAB75CC0AABF356AAF2519E16E1D82000:8

cGluZy4uLg0KDQpPbiBTYXQsIDIwMjQtMDgtMzEgYXQgMTM6NTIgKzA4MDAsIFpoaSBNYW8gd3Jv
dGU6DQo+IENocm9tZWJvb2sgY2FtZXJhIEFQIGNhbiBzd2l0Y2ggYmV0d2VlbiB2aWRlbyBhbmQg
cGhvdG8gbW9kZSwNCj4gdGhlIGJlaGF2aW9yIGNvcnJlc3BvbmRpbmcgdG8gVkNNIGlzIHN1c3Bl
bmQgYW5kIHJlc3VtZSwNCj4gaXQgd2lsbCBjYXVzZSBjYW1lcmEgcHJldmlldyBpcyBub3Qgc21v
b3RoIGR1cmluZyBzd2l0Y2hpbmcNCj4gb3BlcmF0aW9uLg0KPiBXZSB1c2UgYXV0b3N1c3BlbmQg
ZnVuY3Rpb24gY2FuIGZpeCB0aGlzIGlzc3VlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmhpIE1h
byA8emhpLm1hb0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9tZWRpYS9pMmMvZHc5
NzY4LmMgfCAzICsrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jIGIv
ZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMNCj4gaW5kZXggMThlZjJiMzVjOWFhLi43NDQ5ZDI5
ZGY5MDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jDQo+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jDQo+IEBAIC0zNzQsNyArMzc0LDcgQEAgc3RhdGlj
IGludCBkdzk3Njhfb3BlbihzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLA0KPiBzdHJ1Y3QgdjRsMl9z
dWJkZXZfZmggKmZoKQ0KPiAgDQo+ICBzdGF0aWMgaW50IGR3OTc2OF9jbG9zZShzdHJ1Y3QgdjRs
Ml9zdWJkZXYgKnNkLCBzdHJ1Y3QNCj4gdjRsMl9zdWJkZXZfZmggKmZoKQ0KPiAgew0KPiAtCXBt
X3J1bnRpbWVfcHV0KHNkLT5kZXYpOw0KPiArCXBtX3J1bnRpbWVfcHV0X3N5bmNfYXV0b3N1c3Bl
bmQoc2QtPmRldik7DQo+ICANCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gQEAgLTQ5MCw2ICs0OTAs
NyBAQCBzdGF0aWMgaW50IGR3OTc2OF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudA0KPiAqY2xpZW50
KQ0KPiAgCQlnb3RvIGVycl9wb3dlcl9vZmY7DQo+ICAJfQ0KPiAgDQo+ICsJcG1fcnVudGltZV91
c2VfYXV0b3N1c3BlbmQoZGV2KTsNCj4gIAlwbV9ydW50aW1lX2lkbGUoZGV2KTsNCj4gIA0KPiAg
CXJldHVybiAwOw0K

