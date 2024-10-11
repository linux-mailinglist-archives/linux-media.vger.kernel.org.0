Return-Path: <linux-media+bounces-19377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D03999ACE
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 04:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B2FFB225AC
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 02:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A84E1F1310;
	Fri, 11 Oct 2024 02:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aCX5KT62";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="SBq+L+q5"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AA02B9C6;
	Fri, 11 Oct 2024 02:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728615355; cv=fail; b=Po9uFQJOmLhvej/Te3eeanQvNxUSd4uqHGzNS2E9aOd/7J5P7M48bIzUaevgLYSiiUApHru5NFAFCMnJmnkQYI2stxa3KAp6cUzHkGQwGVohAF+RCVd1e9w9okY8xKxyQP8fQaJYO63A62YmtR2KA6TI/xB05hJfXwVoTzmUvDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728615355; c=relaxed/simple;
	bh=drtDOLUctdksyo0LjPf6PS2r6zQySu6CRUkG6S2J+sg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kq2xHZy2wZreRtEFWrVO+KkPTly4Badd6AY/JSFcTg26vsT1C/akS3lRmU5r+7LCpDoM+9z1Qnu2Yjot/pMcRjlqxaGBqj0YlJhpKcGvZBLIn/cN8nUVGNotFhvlg6uoT186ySSpi/487N/QIJArdNfHPk+yT3sXEBsku/B9Pkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=aCX5KT62; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=SBq+L+q5; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 51781572877c11ef8b96093e013ec31c-20241011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=drtDOLUctdksyo0LjPf6PS2r6zQySu6CRUkG6S2J+sg=;
	b=aCX5KT62piguO0ksdJ86xufw1We5tbJub0o1FurcAUfGbXpu5My2EhsUYIkngRa181PCuJ6q43r+bWeo5fa3z6rv9bwWzD/jBHDkADZm2mW3BQXs3brLky7Iqw55iLpr8yfJJvp2/vHr2V9Fz7QdUENgHfwh5kfCZoBIuV4sAyY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:a8761433-2d65-41a5-a9f5-f5d357ad79de,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:41049d26-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 51781572877c11ef8b96093e013ec31c-20241011
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1742297213; Fri, 11 Oct 2024 10:55:48 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Oct 2024 10:55:47 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 10:55:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CV0DVsbVmBu4nOBoia/J0Xn9i+0wqvjuopEs2iVggddUF/T1e6GlR2/JCDx9NQhx91e46uMeY5vzWz65GMwlqlnrI39He4HWYhAYCY63gBhPLXMmijACoo10f6IzphabOyU4bDBaglZHyMMlwdzVJEx3HLbYzUuJAkTmfV9oLCT+MWHJIMGeIhnYtmbVodhcWWwWH4waOuPHUNJOWp0BSQQslKBhe6vJwoaQFs5fJC1Jzpi1n4+jaNx214sRkr090egot0EbtsqNLS7d9Czspw9jFa+fRuv0tnMjfQkmd+Tn30es98nF0u2r4ZAI8xwAs7JHBHB0a1Lj33478FzATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drtDOLUctdksyo0LjPf6PS2r6zQySu6CRUkG6S2J+sg=;
 b=kFaQGi38oON6ek3BRMyfOfVzfEcwcTixfd5A0p9Fq/HA6UrTxDkSg8tBS0R29rKxj+V3I5q6u/o4E7FsOb8KiWcwNbIocX++7GaIjmDJ0d8rsDmNhTgCLaTigjZz1GNNf02B0Q14fj+YF2jD9gh1+icVRqWMIEW3Jzie74g2hc6wHRov/afgD0Hy9TKBr/iZYkCxDZA9+Q4NQnqKbySuMbjPaMzEVSy9lsYu/Oj6Qhbf/aANn1BTUZsEZ1pfyTKE9oL54x+xi5jhk6v1Pnl2k+E3QiigItS0UOKb4NX0Xv+o1cJNTY0/9KNRe9utnJJ5cws6jnyZai62TzXC7rxiUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drtDOLUctdksyo0LjPf6PS2r6zQySu6CRUkG6S2J+sg=;
 b=SBq+L+q5vzGmVzP05ub6Uc5iCdcSnRzFtwncO1GyhfNRxRFetFLYF6MlwU7v2HqlU5OtbM5AKzc0iaiGXqgQY3YXuNQjmV8VjxvJXzisSxQNorlU7Msnu1aetBJCXd0T1L7rJksMLo5prOnMWw7qMFD9d+qRQWg/nM7IRMYhl3c=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB6462.apcprd03.prod.outlook.com (2603:1096:4:1a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Fri, 11 Oct
 2024 02:55:41 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 02:55:41 +0000
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
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Topic: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7KA3aEA
Date: Fri, 11 Oct 2024 02:55:41 +0000
Message-ID: <40daa456132651b85d2e68bec014fcba390b8671.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB6462:EE_
x-ms-office365-filtering-correlation-id: 79acfd86-ad1b-470a-c923-08dce9a03172
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WGRJNXVmbklHY3laNHBXazVBM0k1THpweWlyUi9KUFhtRTgvNVRHS0pnU1FY?=
 =?utf-8?B?UXp0Mzl6QVFwcTk1Z2h4OWdLVEJiQU9WbE50RWxraVlEc1FKcEE5Y01LWmUy?=
 =?utf-8?B?dS9oblVZN3ZIRWhGTDNTTXd3NzZjYzNrL2FoUWRvMy81cHNkKzVxUk9XSnMy?=
 =?utf-8?B?MytraHNyYXg5bTlRMEhUbENqdFBhdHltNnk2TExxSUgwMzNnSG9RN2FQbFRh?=
 =?utf-8?B?dmFJTFBlbG0rTmFJVUtBa1NWc2o4M2g1ODVXZzhYYkdteXU0OHlORVN2QnFs?=
 =?utf-8?B?ZnYxZTA1b3R6ZmdmN0pnZC91SE1SNkltK0VIRDBFS1VsZlBUR0lXUlFJMnp2?=
 =?utf-8?B?QUIzbndsRytHUTJaZUtJWnRTbnhzc2Y4TFE5N0poOGR3cHM5eE54cktaZFM1?=
 =?utf-8?B?SjY0TkZabzhLQlJxU1VQaHhXYjBZbTlxUW9YRk5RWTZlT3pvY1dncmdPRk90?=
 =?utf-8?B?VFRwTzZicmtLMGx5VzlrR3lLd042SGJ0cG12dnZJOE1NQ1F4OFVOZlVjcmdS?=
 =?utf-8?B?aFV6cWFVR3lNRGk0eW9MU1dIdWduN3pXNGtudmt2S0ZYMTk1RGNHeTBiNkVS?=
 =?utf-8?B?VHhLNzRFNFlRby8wM0NRM0xSeXl3dnlrWVQrMUpGR1c0VWdDSG1TM3JUb201?=
 =?utf-8?B?NUNpWjBFc0JBOUxvb09vM1RMeDJMNGNuYUU3dFdLb0c0OGpJZVI4N3l1RmtB?=
 =?utf-8?B?RERncDA1Tkk5MVV4TFFFRVdJNDkrZFlUdlJKbWRNRG90UlFmT1BJQVIzM2Fr?=
 =?utf-8?B?UjgzRGtreXFxVklOckZPSUY5RndLUkEzeGtBaFpsSmsxRnp3ellKOVUvS3Bm?=
 =?utf-8?B?ZkMzaThiRTNzY0U3aHVqSWxZTTJrSDl6RTlEVDZXeGZ1eitSMzJLNzJhSG9q?=
 =?utf-8?B?akVPTDFLV3hjMHF1ZHh3SHJBNzdzRXovelhEWG5VQmpYWkZkQWJsd1JYRjBC?=
 =?utf-8?B?RnNjL21sTndsUkVGb25mak96cEhOTE9DQUd3TERYRWhIQU5JZGdxQkpoT2pV?=
 =?utf-8?B?NEt4eUgzUmZoNTcwSUU0QmI0b0tGMURnNllwaHo2TlMyOXBLSzlZYUZTTERn?=
 =?utf-8?B?dEQwampIVGpzT29JT3g4cFpTZ0FSaE93S1dESGh1Rzh1SHBTK2Y2dGNxMGND?=
 =?utf-8?B?a3BaZU9zN1UvY0gzclFsRTltNEcvaXV1Qk94ajltNmhkWmFlaVVnWmxMTWM2?=
 =?utf-8?B?NE0vS0JjMkZaWTMvdmR2OStaTjkxcVRYWjlIeU5kWGdIUXNzanhxYnZXWjVw?=
 =?utf-8?B?QXhBSU1ZNEIwK1B2OUl6ZWtIdHdMaFh4QmZOR1dPWjQxUDRtUnJIL2xFZFBa?=
 =?utf-8?B?MkgvdXN3QmRXT0t2dzFPQzl5aFVIVkdFbmk4WitWSUJ6OGVGczVWdGZuaVFL?=
 =?utf-8?B?MDlISHNkVk41UVoxNGMrcVB0bUFxb1ZkWVlyLzJMZVJDTmkyZjBXUE05b2Zx?=
 =?utf-8?B?clllTm5OaEVwaWlIMUJ4ZEFEN2I2NFpvOTRMRERQeFBwTWREQ0ZGdkREV0U2?=
 =?utf-8?B?Qjh4TkF6WGhDT3cxVkFYSnBXNVpyQlp5bzVXMmRaR043MnQzeVJhaUQ3bCtN?=
 =?utf-8?B?ZVBrYVZ4b0pCeTVyenBKQW8vazFmY0F6YzEzLzFQU0QrelJtdDFvcjlXWXhY?=
 =?utf-8?B?V2hHN3ZoMGpFOFp4STNIOHBRRERQZXZ6bzFUVkJqQW9mTSt1YjJsZ0hUMmh3?=
 =?utf-8?B?VkRERWJyaGtEazZGcHBpcEpNb3haY0Fsc3N5VmYxMFJpNUUyMDlyRXp3a2Va?=
 =?utf-8?B?SGpDcjRudWF2YU00dHIwNUFWcGYxbzRKNEpaTlBFTWJtUzRQR1BpTEVTWG1q?=
 =?utf-8?B?ZE0wVmx3N0lTbE1TN3VjUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TDBzdHphMEFnSVp6K0VXS2pBTkNzdVdLZ251S1lxWDdremk1S3BqQlZITFVJ?=
 =?utf-8?B?aHZUOXhscWR2czVzNGR2czBVSGRxUEpMN1ZVQ2JvWjZHcC9ZWEZkY29FenN0?=
 =?utf-8?B?WXZFclZCMHVlNkUybnZ2UXlPMDhoYXVVR1kxUHpzZldTYWZ1b0tRbkFiRXVK?=
 =?utf-8?B?My9XMVVMQWRWVC9Ld1RXaEMyYThING5GaitMbVBUTTNpU1F3Tm5Qd09uNDlS?=
 =?utf-8?B?Q1RVSTZwRmlHQ2xublBsNGRvTStVOG5LRVNrZU1TdnFiMzlkNDRLaENvc3hi?=
 =?utf-8?B?MlFmTHEreTZQOVFhZTczclpodmtsRnQyN2NIQllsTXN4U3BmUHpuNWlMaEZ1?=
 =?utf-8?B?eDJ0SkNMa1JFejB0SXZJOXRPMlVubXlqZ3ZvdGpyTzk1cEZxVVZTRDFINUNO?=
 =?utf-8?B?ZW1VR29US3FZN3BOL09GdlVtUC9OakluTjNJN0tqZjNjanFGcWxkU0tQb21s?=
 =?utf-8?B?YUR6Rm5lYWNBQ3F5YzFuS3FPOVVLZ3F2N1hNR1VLazJRM3ZvaVY4RGRYejRZ?=
 =?utf-8?B?dGFtSkdPb1MySVBlMHRxRXQ4eGVUUUhYVDVGZEZQcnJOSVdKM3lUVzNYRHEz?=
 =?utf-8?B?bVZDWDMyU2lWNk1BRkNCa0VCMXBjbThkREFWWDk2c2xSWGRXL1lOd01YOEF3?=
 =?utf-8?B?RERzUkExbi9UbXpBNTVNbnVnRmE2YnF6ZURRNDV5Y1dMWnR1TloralhoSnFI?=
 =?utf-8?B?aXBtM29TYVc4azlUR2FrbjRIMzdqTEdUbjNRT1Y4OE1HWk0zWkV2S29oUk01?=
 =?utf-8?B?am5MdGJVRUYyVmxmUE4wbXVOVW5NT0VIeXB0VU04WnMvZnJXTDdxb2VyeDhs?=
 =?utf-8?B?ZVpzeFNWMEErV1poMW9pbk84cFZzWGo3UkVLQ0grYnpjRWF2a1N5NktFU2lZ?=
 =?utf-8?B?RnlXQjJPUzFWVDZ6SG0yNmpZVGlXUFBsK2FTV2c4WGZGL0NFOXJvZWlPMEVy?=
 =?utf-8?B?RUlDcURCVXRTeGNMbU91dDBlc0huR0xlRVJEdWYwWlBNSlZ3djkxMEFtYTRn?=
 =?utf-8?B?NUhRcUY5RVFSVzlRaVBxaWxYOVJpVjJtUG8xRWlxZXhwWnZHRzRnTzNPV2g2?=
 =?utf-8?B?VHdvZUpoMDJndXNTK2NwZEVrUkJ6dS9KaC9OV1I5UldXU0ViNzUzMGZlTkFt?=
 =?utf-8?B?ejRHS2xaU0phU2JZRnQyQzIwekNTWDRIeW1EcEx5NzJhUHZVTGtRdjI4Q3Zi?=
 =?utf-8?B?MmZiZFB5a0RQam5jWTRzQkZFazlKOUlBcENncjlheG5NajNLR0xrOXhMVVhh?=
 =?utf-8?B?R2Zkd0hPMjVsRzNaZ2lnNjJtcVY0VVh2V3krK2RSRENUOFFYY1Roc1cwZTV1?=
 =?utf-8?B?enpUMXE5MXIrcUhJVjdDVWxTcnh5M0pwOEVKMUdqdS9xSVZnVmNMUmpIWGF6?=
 =?utf-8?B?d2wwc0VIdzFrcUJ1dkR6UUJJVlRNcnk5VXc0Ly9XV2hWMXFLK04xQXNhVmtt?=
 =?utf-8?B?RFR4cGZYbVNzcmRud3oyWkRDL2pwQjc3SndRWFdTNmJvSGRnaG53K1BHM2xv?=
 =?utf-8?B?UXhET0MvNWY4WFQrMFpSMytFN0JYb05HVnhHN3IyQm9PTG9JV2NMeXVGcnBZ?=
 =?utf-8?B?cUdKNTNLR0VHbXVxRXFtZUFLQkEyMXVYdHpic3pNd3lsZ3Iyd0J6MmJVQ3hZ?=
 =?utf-8?B?V1U5aTRPTFZnQzlGSmg3VW5KbCs3U3ZpRG8vU3E3NE9qSnEwaHlNcldwYWFC?=
 =?utf-8?B?YWc3b2tIV2FzSWwreG1sd3d4L3k5a3pUaHlnM1ZBNHlQMVZSZTczTW5TaTcy?=
 =?utf-8?B?UXdTbUxxeHZxa25lNFM3azgwL0N4TXZZRjFyMDBZS1dRaDJGdWRyZjlCbEp2?=
 =?utf-8?B?Y0RFVlJXV3BSSHg4YkI0RHYxdEFmWVUvdW8zS3FtNHVhOEpKWVdwM21PQkhT?=
 =?utf-8?B?QTd5OXlWZk5OTmk0bzE1YXZ3ZlhIaEI5d2s0R2FtTkdDMDRvZHVFdFdqak5T?=
 =?utf-8?B?MFBaWjAxMVBuaFdFdVIzUTk0dXpPdVJBZW1EeERQMGtYSFF4T2R5TnoreFpU?=
 =?utf-8?B?THQ4MkxyZVNFSFVsLzkvRUhLREp1eTcxNnl0aFpOQ1NRcC9ub2sySTJzc21G?=
 =?utf-8?B?dUtSTXhlVXZBQ0NSbEhoVTdIUTMwbjl6UHhSSE1xVGlqa0dNS2s5ZGxTQ200?=
 =?utf-8?Q?WHfi9ey6F4bgJYWPEJMt/2A4A?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC0DFFEB7DE32340B0F158FD761D23E1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79acfd86-ad1b-470a-c923-08dce9a03172
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 02:55:41.3261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LuvZXu3mgiBhk6Zzp2NyKU9HEynLQUV/j8Qn5YVjkjTnkGzR8wa6HqfeNO8TPnYlrg8yVi4dOvsXiKZkKm82YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6462

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBJU1AgcGlwZWxpbmUgZHJpdmVy
IGZvciB0aGUgTWVkaWFUZWsgSVNQIHJhdyBhbmQgeXV2DQo+IG1vZHVsZXMuIEtleSBmdW5jdGlv
bmFsaXRpZXMgaW5jbHVkZSBkYXRhIHByb2Nlc3NpbmcsIFY0TDIgaW50ZWdyYXRpb24sDQo+IHJl
c291cmNlIG1hbmFnZW1lbnQsIGRlYnVnIHN1cHBvcnQsIGFuZCB2YXJpb3VzIGNvbnRyb2wgb3Bl
cmF0aW9ucy4NCj4gQWRkaXRpb25hbGx5LCBJUlEgaGFuZGxpbmcsIHBsYXRmb3JtIGRldmljZSBt
YW5hZ2VtZW50LCBhbmQgTWVkaWFUZWsNCj4gSVNQIERNQSBmb3JtYXQgc3VwcG9ydCBhcmUgYWxz
byBpbmNsdWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhz
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICsNCj4gK3N0YXRp
YyB2b2lkIHNldF9maWZvX3RocmVzaG9sZCh2b2lkIF9faW9tZW0gKmRtYV9iYXNlKQ0KPiArew0K
PiArCXUzMiBmaWZvX3NpemUgPSAwOw0KPiArDQo+ICsJZmlmb19zaXplID0gcmVhZGxfcmVsYXhl
ZChkbWFfYmFzZSArIERNQV9PRkZTRVRfQ09OMCkgJiAweEZGRjsNCj4gKwl3cml0ZWxfcmVsYXhl
ZCgoMHgxIDw8IDI4KSB8DQo+ICsJCSAgICAgICAoKGZpZm9fc2l6ZSAqIDEgLyA0KSAmIDB4RkZG
KSA8PCAxNiB8DQo+ICsJCSAgICAgICAoKGZpZm9fc2l6ZSAqIDEgLyA4KSAmIDB4RkZGKSwNCj4g
KwkJICAgICAgIGRtYV9iYXNlICsgRE1BX09GRlNFVF9DT04xKTsNCg0KSSBjYW4gbm90IGZpbmQg
ZGVmaW5pdGlvbiBvZiBETUFfT0ZGU0VUX0NPTjEgaW4gdGhpcyBwYXRjaCwgYnV0IEkgZmluZCBp
dCBpbiBbNi8xMF0gcGF0Y2guDQpNb3ZlIHRoZSBkZWZpbml0aW9uIHRvIHRoaXMgcGF0Y2guDQpB
bmQgd2hlbiB5b3UgYWRkIHRoaXMgZmlsZSwgbWFrZSBzdXJlIHlvdSBjb3VsZCBidWlsZCBpdCBz
dWNjZXNzZnVsbHkuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJd3JpdGVsX3JlbGF4ZWQoKDB4MSA8
PCAyOCkgfA0KPiArCQkgICAgICAgKChmaWZvX3NpemUgKiAxIC8gMikgJiAweEZGRikgPDwgMTYg
fA0KPiArCQkgICAgICAgKChmaWZvX3NpemUgKiAzIC8gOCkgJiAweEZGRiksDQo+ICsJCSAgICAg
ICBkbWFfYmFzZSArIERNQV9PRkZTRVRfQ09OMik7DQo+ICsJd3JpdGVsX3JlbGF4ZWQoKDB4MSA8
PCAzMSkgfA0KPiArCQkgICAgICAgKChmaWZvX3NpemUgKiAyIC8gMykgJiAweEZGRikgPDwgMTYg
fA0KPiArCQkgICAgICAgKChmaWZvX3NpemUgKiAxMyAvIDI0KSAmIDB4RkZGKSwNCj4gKwkJICAg
ICAgIGRtYV9iYXNlICsgRE1BX09GRlNFVF9DT04zKTsNCj4gKwl3cml0ZWxfcmVsYXhlZCgoMHgx
IDw8IDMxKSB8DQo+ICsJCSAgICAgICAoKGZpZm9fc2l6ZSAqIDMgLyA4KSAmIDB4RkZGKSA8PCAx
NiB8DQo+ICsJCSAgICAgICAoKGZpZm9fc2l6ZSAqIDEgLyA0KSAmIDB4RkZGKSwNCj4gKwkJICAg
ICAgIGRtYV9iYXNlICsgRE1BX09GRlNFVF9DT040KTsNCj4gK30NCj4gKw0K

