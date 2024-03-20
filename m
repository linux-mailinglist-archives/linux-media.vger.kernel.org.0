Return-Path: <linux-media+bounces-7358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37132880934
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 02:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8AF6282168
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 01:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F70748E;
	Wed, 20 Mar 2024 01:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tsn+DplR";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Axb5o+zN"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CFB29CEC;
	Wed, 20 Mar 2024 01:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710898973; cv=fail; b=EY8njVL+fkaX1TdkFnz3LVDSY+FhcfNuAeNnpWU489WLNkXBtYf39+nYNkk92TZIVrJA7GLfXb1axvh4Mm5mY8BKPvYFx2V+TfPQh4pkeNemtKQOJcJ1swhxsumhW6BgC078RDw5z/lcqLFrArHxrpzJlX4GN3ybUqs3mA750Gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710898973; c=relaxed/simple;
	bh=ogThRvv+rmmxu/jVhj/SNY0DEgPgyC5UYDA0cV4JoZA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uKjtf/7HbDUA2ueAEj+FUspsh7aWt2/6Cubqh+QyTjeTVQjosXzoWmlDJTnQ6Apl8Av8icK0ZfjtHMmSCd8sjtonj7WqxEgKUh716zQcW/c5e5KHSa0MyUqDDmRrdH/wWhZORzOnINqpwson1FNGF7zwAa4y4iToTT0+N2xlhA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tsn+DplR; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Axb5o+zN; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 278ce840e65b11ee935d6952f98a51a9-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ogThRvv+rmmxu/jVhj/SNY0DEgPgyC5UYDA0cV4JoZA=;
	b=tsn+DplRtpgGZUZBbt/fw+rEyKab8IwGxcq+yp0XgBcewc83gzNzJ9eO3AswWOGYsK3eRaPGsP04PKYzSWGe+nhd+ZkTPpL5kfCC1b6Hbk+xVK8u2U9t0+pDMK0tvUjtg5o2M9xGFvJ9JMIcNh/BT5j4nglVqRZsttPWpZHSgYQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:29b3c7e9-b596-4992-b40e-72a8782982d7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:9d8fb281-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 278ce840e65b11ee935d6952f98a51a9-20240320
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 525892854; Wed, 20 Mar 2024 09:42:47 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 09:42:43 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 09:42:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFQM3el/CO6zuG2L52/pDifdmb+GasnajS4ee/EdwAjIbgQJedyFpLFJ+kslWFeSraB++K9Ve7DvxTLeXPgscmTbZvQ9HeDAV9cVb7gq0Q2ScfRirZz5dQvnl1F4t5EQvrmzBeh8yPqo6UJEDIYPQNmq6bV4Cd7RKNfus++z3NziN/goNyEUvjjYn6KQSOpUPRMSCV7DZVPLC8vE5jO/G9VSEDCSZ64PuqHZdQg8PoDN7nhfpVn++X/GrjC7Wr66E5x1DR0ajOLwpulXhhrmK+3v91ienv+rmXASwrBwxSD/5274a2N6kWj4LwJmUPZmDoV7khXJiZEHkd9bjt0D4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogThRvv+rmmxu/jVhj/SNY0DEgPgyC5UYDA0cV4JoZA=;
 b=e4DHIa0LnU+QA7SDgQuAdPoOkSiUt5sJHpywzHisJQ5foJK7Z9NZhEDfHNiR6+3OJJS3QC5Ofnrf2YepcwtRP6LMmWMCkxwiDIbzuFOCPGsVr/0j3IBTgjCsLeUzorRKyEsAOHig3Kw2aVJ68g25418iK3L2snqWF3/ESQYfcZpINgqvH8lEFluQ30Cm0tfDxdCvQgsWsH/Qvptpza32M+Pltecro2VTfR9/GN+XDrrBU3Kv/ebk16clUBNU9mvpkgJDBfUbIy9YIUvI7mSle4VAihprhALCt9RH/msOGn7UfT/VF//UtSaK8+TH4G81/+8TQAKK5foevC0vxX76iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogThRvv+rmmxu/jVhj/SNY0DEgPgyC5UYDA0cV4JoZA=;
 b=Axb5o+zN2xe6U92Do+nJRxY7Ni0DuTKLxeEQSfO/BBHLiHamUSXsMX2JIuiWJBlOXi6e7Lj8RpAd5uoAQk+9M2ERG+ZGc/I7ZRypDGtbZVNoLj2gdguYTZrsZ0fYczgVLbtgb+Hj47ADmw/9wfmzi+UT1LCF8wKAI61A8Atiy9g=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7364.apcprd03.prod.outlook.com (2603:1096:400:420::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Wed, 20 Mar
 2024 01:42:42 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 01:42:42 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: =?utf-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>,
	"shawn.sung@mediatek.corp-partner.google.com"
	<shawn.sung@mediatek.corp-partner.google.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 08/14] drm/mediatek: Rename files "mtk_drm_ddp_comp.h"
 to "mtk_ddp_comp.h"
Thread-Topic: [PATCH v2 08/14] drm/mediatek: Rename files "mtk_drm_ddp_comp.h"
 to "mtk_ddp_comp.h"
Thread-Index: AQHaecuW16Xn2le+TU+OaPP7Hp0OI7E/3DOA
Date: Wed, 20 Mar 2024 01:42:42 +0000
Message-ID: <5ab2cfb825ebd945806e77cc51c4b814e38f9ba5.camel@mediatek.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
	 <20240319070257.6443-9-shawn.sung@mediatek.com>
In-Reply-To: <20240319070257.6443-9-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7364:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZCAbSaxX1IDz7H6zu/6zqu1f1dpuRZ9fr6Ai7HEH0tDYzu+wyoymO5hxTA8+Yj2eJcY0U4UfENiTx/PpAsRh9YZTzA5XCVvbySNJaXhy/OoAbupWjoruel0KNBDMP9LVkdC4aOOTh5tWK+JyTXevs/ERkf4h+AL6wbTjuh7p1mLNdEDNB2vgfSLJkcncsWAmOaCdW5KkFZ5ypxGzES4tcIHYvFTYQ01QpfR5F7fwl9RH8ZF95zbjwsmpCXhvHn/DV7M54iHHqNxmQe8JUFtBwLYw/z9BN176VxCr+TqD7ZHczLz1l5Her/T2+jzZT8sq1U0lHegdhxxdV667EmZ9S71Zi6t2Z/upETGAG6TB224H1AIF2lfcnV58ZXtbI2lB7xoJymBnRpuUxgRTwMUYVwI2v7boHnaOr6J0KHIZNJLB+6Xq65fNWcJq4SiaZayqfVorvcSmotRvFREHyYtREsROkdJLMYZpwnaOzHeritCHVni3CxQsAnZxYnizSyhCBiKzsXSa7AWVpSXGQBao8oIwjVSXUXBmr8ScvlmcOU5zC2vmMFhD4mYk/2/VIetikS8HPIPJpgru9enWhCjjDhqmwSQ6xXPPAzuHQW7R/8cbO1ajfv6WOgkZwaWvoqMclisSLRPyxivzgqP35ZFP/R53d0eB33LiFDc7+AqdGh8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWlURk9MazZnNWNINVU2dmoyVlRkMG84VUNseEl4cU1abFRMTnZhaytzZSsz?=
 =?utf-8?B?ZTN5aWFVTFMyVFlxVXhGam10ZXNmOVd2Q2U4VGlHQU12WTdZVzM5ZkQxbnVF?=
 =?utf-8?B?elpHVXRWR1hPRUo4OGpLUVJRdlNOVHZJOVJpY1BnQ0o5eTViUjlMa0FYSWtE?=
 =?utf-8?B?NXJCR05MWUM5Y2JNUWQvMDR5TEJaQm45NXYzQ2F4MWlvU2dHeFhjaTNjRFR6?=
 =?utf-8?B?bUJ5QU9JaGNSUEV3SFlsSzNQV0xCVFpJdklyMlM1Y3JnanVnaXk2L0ozVFUv?=
 =?utf-8?B?V0VEcndyaVB6MElwaVFsVDVQWVZ4KzNBWEVKbERkTHFXSHRNNDdpellUQUYw?=
 =?utf-8?B?UEFJL1VJVzdER0ZDMWRsQURGNnlYQmx3VXE1UnloWjYvdWdGV2s4RWRUU3FK?=
 =?utf-8?B?cnRMRXl6K25LUWFTbHBxUEJROTY4aytkcXBZbjI4S2N1OXl1alRLdjZqKzdX?=
 =?utf-8?B?Mk5CQnBtY0RBakFBangxMzd6TFBSbVF2VU9aeHhJSVprRENZTERKRmluK0Nm?=
 =?utf-8?B?TWNKWlZ5NHBOc3VBUkNtSm1vUnFJMGFHS3NvZHh0U2lpVlZ0TnZkNnpEMFIz?=
 =?utf-8?B?TG9QQlU4VG9vaHRyRTJYQ2hIUVQ3eXE5VlJ3dzRYYkJnN1p1ZVBsODQwTjNS?=
 =?utf-8?B?eXFJZ3NGYXI4NnVBN1JPUDdoek1PcWpTcVpqNUxMQWZ3ZDFJNDFGeFYvZzdv?=
 =?utf-8?B?OGFBMGFtZkM1am1XYWJIVnZ1TDlTNjIwM1VzckNUUTZoVVVKUFd5YmwvRita?=
 =?utf-8?B?NmZKM3krVldHNmxhQjE2cGhjRzRvVnhTK0xwbm8rUnFkMmxySTZ0emJUM3hz?=
 =?utf-8?B?Z2pxR0gwSnl6enNnM3ArcWI1ZThHdUFrNXI3ZDVoNTI4MlREMFhxL00yMGJK?=
 =?utf-8?B?NUlLYmxTci9UM2E4bkJYSmpzSUlqQTgvMDFRT2pyRzg2U2Z6SnFraHlTZlNt?=
 =?utf-8?B?d01EZTB0U0RETjljMGsvSnFZVjg4TlBrWHVPZVhLOXN1RGJ2NkZveThQUTE2?=
 =?utf-8?B?N0h0Y2sxUTVwU3VWRDVwd1lDaDY2MXpmV0pBMVZ4TzNwS0Z0YjVSWnJJTkRn?=
 =?utf-8?B?UkVHeGhNSHFhRFk4cmJJSzYvK25tbHVBb1ZaT09KU0d1UWM1K2FoK3ZabU56?=
 =?utf-8?B?azdJRytvVTA2V2VNNmZ5NTd2b3VTTk5xZmhMbTFqekdyWGlnd0tkRzk1VWFm?=
 =?utf-8?B?ekxvNWF1ZUlPZThUb1cybC80d09zV2JwSmRaU1JKRmhBS0tmYUZobXFDenpC?=
 =?utf-8?B?TzI1YkN3MUp0cHpiNlJQdHV1eFlub0Y5SVZ5eUR6QVQxOTRqOXlhRFl0Q0xX?=
 =?utf-8?B?Vko5MEQxc0lhUUFqOXZKNU1wNUZZZHVmVGI4NXJwT0hpSUpTUU9CTnVsWGJR?=
 =?utf-8?B?TG1QbUVpN3oyMEFjWEVhMnlKVHFpNFppbmV4RjkvSlVaVHpxM2VJVlpSUUJx?=
 =?utf-8?B?c045WHh4Tm9uSG5aVkhNNU5NN2dSZjlOY2FSWExxM2U1Ny9WblN5em1KU3Rw?=
 =?utf-8?B?aW51QlNaUWtZZGdKVUs4dWR3VzQxM1JNek03MHNvUHNyL0FXaWw1QTlQVGZu?=
 =?utf-8?B?Q2lvZG5JY1c4aEViVXZsT3Fkc1YwMnlIbHlzUnFUOUY1ZTNuL3J0RGNsNC92?=
 =?utf-8?B?NnVZbGtHUjR3OEcyL24wbmkraVJLdGdXNjhsZGZpL1BkUzB3QUlRbTNqVyt6?=
 =?utf-8?B?Ritrc0NmTTJhUWx0amlPU0ZCcjhGcmdMYW1Gb2JkdnlMbE1uQmwwL0lqRndK?=
 =?utf-8?B?NWc5TDJNSUhsSWtpMGF5eXk5Y0xFWXhldktpcjkxakVCaVhPWWFNdVZNQzVK?=
 =?utf-8?B?TlplOEpXZ0R3MmZaZU8vd3hSN2l6M0JpNjdSQitFYTVrQnRrQUxVWUczUm5W?=
 =?utf-8?B?OUN1OVVLbkR3SUpubFVGbkwyRkNKVXdob1ZJWEJjcVNqVUdJVzZXMjdiOERG?=
 =?utf-8?B?Nkg4R1ZjRWhLSzlvbzhMMWNzS0hTb3dPaTlMeXBVSjUzNEpmanI1RFNhL2JU?=
 =?utf-8?B?L2tOWXkzMk81M0x6akEvRFBtaTU1OUtER2k2RW00eS9reXI0ditHT09ON2ZE?=
 =?utf-8?B?NURVVFc4emJRQTRwUmFsMjdKOHdZU3BNbzkrVk1waU0zS2ZuVE0rbGRZRjdK?=
 =?utf-8?Q?1EbwnFYxwMsPIKxyt3frb2lPs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <28819D7DBC4F994B8596EC29EE986BF0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7fc822-ea67-4cd1-b4ac-08dc487f088b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 01:42:42.0849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C5xFqAH6xtwyhlSImaSpmbbEGoZ3wUmNHm8m8DuqhKL3MTL8+nPEe1V8S3tE027aQ6gackIG4qkjll2eQfw5wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7364
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.749500-8.000000
X-TMASE-MatchedRID: VPleTT1nwdT+DXQl7XSOUia1MaKuob8PofZV/2Xa0cKSO6So6QGgysNq
	SYgiOmwd8cv4yT0rvGNUPHgTUudKRKXzgcphDfm8Q4srjeRbxTZ3Bf9JIqsoeL/XDMnRl2JlxGu
	+O8UpNrEDQU/rQijmtOfof9KwcvrXV93BmaMBd/OHZXNSWjgdU66JG5H2YJq6TLRqyNBUWsDfaz
	KFMARh7+LzNWBegCW2PZex/kxUIHW3sNbcHjySQd0H8LFZNFG7CKFCmhdu5cXPd4pfqctCRks/O
	2rQuemOVCQwZdv6k1z+gf4at5/yASQ25SkEmaybAQxfJp15uR29xj9+AiYJbKSqUHtRbjBIbfd4
	nY+442W5ZyimlDMxyA56xhuba2WuZ86KY3oNT3zIO0Si2Tuenp6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.749500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	D6BB60D105B0086DE21E853DCB8AD0DAAAE3E36EAFB7AD1EC3B6063902EAECCE2000:8

SGksIFNoYXduOg0KDQpPbiBUdWUsIDIwMjQtMDMtMTkgYXQgMTU6MDIgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IA0KPiBSZW5hbWUgZmlsZXMgbXRrX2RybV9kZHBf
Y29tcC5oIHRvIG10a19kZHBfY29tcC5oLg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1l
ZGlhdGVrLmNvbT4NCg0KPiANCj4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpYW9jY2hpbm8gRGVsIFJl
Z25vIDwNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBIc2lhbyBDaGllbiBTdW5nIDwNCj4gc2hhd24uc3VuZ0BtZWRpYXRlay5jb3Jw
LXBhcnRuZXIuZ29vZ2xlLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2NydGMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyDQo+ICstDQo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuaCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyDQo+ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsve210a19kcm1fZGRwX2Nv
bXAuaCA9PiBtdGtfZGRwX2NvbXAuaH0gfCAwDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3BfYWFsLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAyDQo+ICstDQo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYyAgICAgICAgICAgICAgICAgICAg
ICAgfCAyDQo+ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3Iu
YyAgICAgICAgICAgICAgICAgICAgICAgfCAyDQo+ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYyAgICAgICAgICAgICAgICAgICAgICAgfCAyDQo+ICstDQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfbWVyZ2UuYyAgICAgICAgICAgICAg
ICAgICAgICAgfCAyDQo+ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
b3ZsLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAyDQo+ICstDQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2FkYXB0b3IuYyAgICAgICAgICAgICAgICAgfCAyDQo+
ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jICAgICAgICAg
ICAgICAgICAgICAgICAgfCAyDQo+ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyDQo+ICstDQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jICAgICAgICAgICAgICAgICAgICAg
fCAyDQo+ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyDQo+ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kcnYuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyDQo+ICstDQo+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jICAgICAgICAgICAgICAgICAg
ICAgICAgfCAyDQo+ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyDQo+ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2V0aGRyLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyDQo+ICst
DQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BhZGRpbmcuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyDQo+ICstDQo+ICAxOSBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspLCAxOCBkZWxldGlvbnMoLSkNCj4gIHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
e210a19kcm1fZGRwX2NvbXAuaCA9Pg0KPiBtdGtfZGRwX2NvbXAuaH0gKDEwMCUpDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19jcnRjLmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KPiBpbmRleCA2MzFjMWVmMjg0N2VmLi43
NzEwZTUzOWUzZGExIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2NydGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NydGMuYw0KPiBA
QCAtMjAsOCArMjAsOCBAQA0KPiAgI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+DQo+ICANCj4g
ICNpbmNsdWRlICJtdGtfY3J0Yy5oIg0KPiArI2luY2x1ZGUgIm10a19kZHBfY29tcC5oIg0KPiAg
I2luY2x1ZGUgIm10a19kcm1fZHJ2LmgiDQo+IC0jaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5o
Ig0KPiAgI2luY2x1ZGUgIm10a19kcm1fZ2VtLmgiDQo+ICAjaW5jbHVkZSAibXRrX2RybV9wbGFu
ZS5oIg0KPiAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ny
dGMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5oDQo+IGluZGV4IDJk
OWYyOGY0MzZhZWEuLmZkNmMwMDZmMGMxNjkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfY3J0Yy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfY3J0Yy5oDQo+IEBAIC03LDcgKzcsNyBAQA0KPiAgI2RlZmluZSBNVEtfQ1JUQ19IDQo+ICAN
Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2NydGMuaD4NCj4gLSNpbmNsdWRlICJtdGtfZHJtX2RkcF9j
b21wLmgiDQo+ICsjaW5jbHVkZSAibXRrX2RkcF9jb21wLmgiDQo+ICAjaW5jbHVkZSAibXRrX2Ry
bV9kcnYuaCINCj4gICNpbmNsdWRlICJtdGtfZHJtX3BsYW5lLmgiDQo+ICANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9jb21wLmgNCj4gc2ltaWxhcml0eSBpbmRleCAx
MDAlDQo+IHJlbmFtZSBmcm9tIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmgNCj4gcmVuYW1lIHRvIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAu
aA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5j
DQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5jDQo+IGluZGV4IGJh
OTI2ZTc5N2FmOGEuLjkyYWNkYWRkZDY0OGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZGlzcF9hYWwuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3BfYWFsLmMNCj4gQEAgLTEyLDggKzEyLDggQEANCj4gICNpbmNsdWRlIDxsaW51
eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaD4NCj4gIA0KPiAgI2luY2x1ZGUgIm10a19jcnRjLmgi
DQo+ICsjaW5jbHVkZSAibXRrX2RkcF9jb21wLmgiDQo+ICAjaW5jbHVkZSAibXRrX2Rpc3BfZHJ2
LmgiDQo+IC0jaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5oIg0KPiAgI2luY2x1ZGUgIm10a19k
cm1fZHJ2LmgiDQo+ICANCj4gICNkZWZpbmUgRElTUF9BQUxfRU4JCQkJMHgwMDAwDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jY29yci5jDQo+IGluZGV4IDc5YmNkM2M0
ODc1NjMuLjk3NWVlNDVhMGY3MmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9jY29yci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9jY29yci5jDQo+IEBAIC0xMSw4ICsxMSw4IEBADQo+ICAjaW5jbHVkZSA8bGludXgv
c29jL21lZGlhdGVrL210ay1jbWRxLmg+DQo+ICANCj4gICNpbmNsdWRlICJtdGtfY3J0Yy5oIg0K
PiArI2luY2x1ZGUgIm10a19kZHBfY29tcC5oIg0KPiAgI2luY2x1ZGUgIm10a19kaXNwX2Rydi5o
Ig0KPiAtI2luY2x1ZGUgIm10a19kcm1fZGRwX2NvbXAuaCINCj4gICNpbmNsdWRlICJtdGtfZHJt
X2Rydi5oIg0KPiAgDQo+ICAjZGVmaW5lIERJU1BfQ0NPUlJfRU4JCQkJMHgwMDAwDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYw0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jb2xvci5jDQo+IGluZGV4IDRhYTQxYjFm
ZjI2MDIuLjkxZTc4MzdhMzJjODYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9jb2xvci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9jb2xvci5jDQo+IEBAIC0xMSw4ICsxMSw4IEBADQo+ICAjaW5jbHVkZSA8bGludXgv
c29jL21lZGlhdGVrL210ay1jbWRxLmg+DQo+ICANCj4gICNpbmNsdWRlICJtdGtfY3J0Yy5oIg0K
PiArI2luY2x1ZGUgIm10a19kZHBfY29tcC5oIg0KPiAgI2luY2x1ZGUgIm10a19kaXNwX2Rydi5o
Ig0KPiAtI2luY2x1ZGUgIm10a19kcm1fZGRwX2NvbXAuaCINCj4gICNpbmNsdWRlICJtdGtfZHJt
X2Rydi5oIg0KPiAgDQo+ICAjZGVmaW5lIERJU1BfQ09MT1JfQ0ZHX01BSU4JCQkweDA0MDANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMNCj4gaW5kZXggMWEx
ZWU3NzEyN2VlOS4uNTFhZTRmOTQ3YzcxNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX2dhbW1hLmMNCj4gQEAgLTEyLDggKzEyLDggQEANCj4gICNpbmNsdWRlIDxs
aW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaD4NCj4gIA0KPiAgI2luY2x1ZGUgIm10a19jcnRj
LmgiDQo+ICsjaW5jbHVkZSAibXRrX2RkcF9jb21wLmgiDQo+ICAjaW5jbHVkZSAibXRrX2Rpc3Bf
ZHJ2LmgiDQo+IC0jaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5oIg0KPiAgI2luY2x1ZGUgIm10
a19kcm1fZHJ2LmgiDQo+ICANCj4gICNkZWZpbmUgRElTUF9HQU1NQV9FTgkJCQkweDAwMDANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9tZXJnZS5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX21lcmdlLmMNCj4gaW5kZXggMzJh
Mjk5MjRiZDU0Yy4uM2IxZTA0ZWNiOWQ0NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX21lcmdlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX21lcmdlLmMNCj4gQEAgLTEwLDcgKzEwLDcgQEANCj4gICNpbmNsdWRlIDxs
aW51eC9yZXNldC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5o
Pg0KPiAgDQo+IC0jaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5oIg0KPiArI2luY2x1ZGUgIm10
a19kZHBfY29tcC5oIg0KPiAgI2luY2x1ZGUgIm10a19kcm1fZHJ2LmgiDQo+ICAjaW5jbHVkZSAi
bXRrX2Rpc3BfZHJ2LmgiDQo+ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9vdmwuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9vdmwuYw0KPiBpbmRleCA3ZjIyMTljMDExOWJlLi4wZWJlYWY5ODMwZDgzIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+IEBAIC0xNiw4ICsxNiw4IEBA
DQo+ICAjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmg+DQo+ICANCj4gICNp
bmNsdWRlICJtdGtfY3J0Yy5oIg0KPiArI2luY2x1ZGUgIm10a19kZHBfY29tcC5oIg0KPiAgI2lu
Y2x1ZGUgIm10a19kaXNwX2Rydi5oIg0KPiAtI2luY2x1ZGUgIm10a19kcm1fZGRwX2NvbXAuaCIN
Cj4gICNpbmNsdWRlICJtdGtfZHJtX2Rydi5oIg0KPiAgDQo+ICAjZGVmaW5lIERJU1BfUkVHX09W
TF9JTlRFTgkJCTB4MDAwNA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX292bF9hZGFwdG9yLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3Bfb3ZsX2FkYXB0b3IuYw0KPiBpbmRleCA1NDJkYzJhMjBlYTkwLi5kOTU3ZjVjOGNjZjky
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2Fk
YXB0b3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2Fk
YXB0b3IuYw0KPiBAQCAtMTgsOCArMTgsOCBAQA0KPiAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRp
YXRlay9tdGstbXV0ZXguaD4NCj4gIA0KPiAgI2luY2x1ZGUgIm10a19jcnRjLmgiDQo+ICsjaW5j
bHVkZSAibXRrX2RkcF9jb21wLmgiDQo+ICAjaW5jbHVkZSAibXRrX2Rpc3BfZHJ2LmgiDQo+IC0j
aW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5oIg0KPiAgI2luY2x1ZGUgIm10a19kcm1fZHJ2Lmgi
DQo+ICAjaW5jbHVkZSAibXRrX2V0aGRyLmgiDQo+ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfcmRtYS5jDQo+IGluZGV4IDA0ZjU4NDM3MjIxNGYuLmYwNmIwNDhjMTI0
NzkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1h
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYw0KPiBA
QCAtMTQsOCArMTQsOCBAQA0KPiAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstY21k
cS5oPg0KPiAgDQo+ICAjaW5jbHVkZSAibXRrX2NydGMuaCINCj4gKyNpbmNsdWRlICJtdGtfZGRw
X2NvbXAuaCINCj4gICNpbmNsdWRlICJtdGtfZGlzcF9kcnYuaCINCj4gLSNpbmNsdWRlICJtdGtf
ZHJtX2RkcF9jb21wLmgiDQo+ICAjaW5jbHVkZSAibXRrX2RybV9kcnYuaCINCj4gIA0KPiAgI2Rl
ZmluZSBESVNQX1JFR19SRE1BX0lOVF9FTkFCTEUJCTB4MDAwMA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBpLmMNCj4gaW5kZXggYmViN2Q5ZDA4ZTk3MS4uZmJmNjNlMDQ0MTMzNyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+IEBAIC0yNiw5ICsyNiw5IEBADQo+
ICAjaW5jbHVkZSA8ZHJtL2RybV9vZi5oPg0KPiAgI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2tt
c19oZWxwZXIuaD4NCj4gIA0KPiArI2luY2x1ZGUgIm10a19kZHBfY29tcC5oIg0KPiAgI2luY2x1
ZGUgIm10a19kaXNwX2Rydi5oIg0KPiAgI2luY2x1ZGUgIm10a19kcGlfcmVncy5oIg0KPiAtI2lu
Y2x1ZGUgIm10a19kcm1fZGRwX2NvbXAuaCINCj4gICNpbmNsdWRlICJtdGtfZHJtX2Rydi5oIg0K
PiAgDQo+ICBlbnVtIG10a19kcGlfb3V0X2JpdF9udW0gew0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMNCj4gaW5kZXggMjQzODljNmMzNTYxZi4uYWI5
NmIxMDAxZGUzZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwX2NvbXAuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5jDQo+IEBAIC0xNSwxMCArMTUsMTAgQEANCj4gICNpbmNsdWRlIDxkcm0vZHJtX3By
aW50Lmg+DQo+ICANCj4gICNpbmNsdWRlICJtdGtfY3J0Yy5oIg0KPiArI2luY2x1ZGUgIm10a19k
ZHBfY29tcC5oIg0KPiAgI2luY2x1ZGUgIm10a19kaXNwX2Rydi5oIg0KPiAgI2luY2x1ZGUgIm10
a19kcm1fZHJ2LmgiDQo+ICAjaW5jbHVkZSAibXRrX2RybV9wbGFuZS5oIg0KPiAtI2luY2x1ZGUg
Im10a19kcm1fZGRwX2NvbXAuaCINCj4gIA0KPiAgDQo+ICAjZGVmaW5lIERJU1BfUkVHX0RJVEhF
Ul9FTgkJCTB4MDAwMA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0K
PiBpbmRleCA3YmUzYjA1NDZkM2RmLi4xMTNmZGJhYWM1YTE0IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBAQCAtMjUsNyArMjUsNyBAQA0KPiAgI2luY2x1
ZGUgPGRybS9kcm1fdmJsYW5rLmg+DQo+ICANCj4gICNpbmNsdWRlICJtdGtfY3J0Yy5oIg0KPiAt
I2luY2x1ZGUgIm10a19kcm1fZGRwX2NvbXAuaCINCj4gKyNpbmNsdWRlICJtdGtfZGRwX2NvbXAu
aCINCj4gICNpbmNsdWRlICJtdGtfZHJtX2Rydi5oIg0KPiAgI2luY2x1ZGUgIm10a19kcm1fZ2Vt
LmgiDQo+ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2Rydi5oDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmgNCj4gaW5k
ZXggMjRjNGQ1OTA4NWJkNi4uNzhkNjk4ZWRlMWJmOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZHJ2LmgNCj4gQEAgLTcsNyArNyw3IEBADQo+ICAjZGVmaW5lIE1US19E
Uk1fRFJWX0gNCj4gIA0KPiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+IC0jaW5jbHVkZSAibXRr
X2RybV9kZHBfY29tcC5oIg0KPiArI2luY2x1ZGUgIm10a19kZHBfY29tcC5oIg0KPiAgDQo+ICAj
ZGVmaW5lIE1BWF9DT05ORUNUT1IJMg0KPiAgI2RlZmluZSBERFBfQ09NUE9ORU5UX0RSTV9PVkxf
QURBUFRPUiAoRERQX0NPTVBPTkVOVF9JRF9NQVggKyAxKQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMNCj4gaW5kZXggNzIwZjZiNGIwODIxNS4uNjNhN2EyNDQ2
OGMxMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxh
bmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jDQo+
IEBAIC0xNCw3ICsxNCw3IEBADQo+ICAjaW5jbHVkZSA8bGludXgvYWxpZ24uaD4NCj4gIA0KPiAg
I2luY2x1ZGUgIm10a19jcnRjLmgiDQo+IC0jaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5oIg0K
PiArI2luY2x1ZGUgIm10a19kZHBfY29tcC5oIg0KPiAgI2luY2x1ZGUgIm10a19kcm1fZHJ2Lmgi
DQo+ICAjaW5jbHVkZSAibXRrX2RybV9nZW0uaCINCj4gICNpbmNsdWRlICJtdGtfZHJtX3BsYW5l
LmgiDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KPiBpbmRleCBlYzlkOTYzOTZk
N2IyLi5lMjljMzdmYjViZTA5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMN
Cj4gQEAgLTI4LDggKzI4LDggQEANCj4gICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5o
Pg0KPiAgI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaD4NCj4gIA0KPiArI2lu
Y2x1ZGUgIm10a19kZHBfY29tcC5oIg0KPiAgI2luY2x1ZGUgIm10a19kaXNwX2Rydi5oIg0KPiAt
I2luY2x1ZGUgIm10a19kcm1fZGRwX2NvbXAuaCINCj4gICNpbmNsdWRlICJtdGtfZHJtX2Rydi5o
Ig0KPiAgDQo+ICAjZGVmaW5lIERTSV9TVEFSVAkJMHgwMA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19ldGhkci5jDQo+IGluZGV4IDQxZWZhYWZlMjZmMWEuLjliMDI2NGJkNWU3MzEgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCj4gQEAgLTE1LDcgKzE1LDcg
QEANCj4gICNpbmNsdWRlIDxsaW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmg+DQo+ICANCj4g
ICNpbmNsdWRlICJtdGtfY3J0Yy5oIg0KPiAtI2luY2x1ZGUgIm10a19kcm1fZGRwX2NvbXAuaCIN
Cj4gKyNpbmNsdWRlICJtdGtfZGRwX2NvbXAuaCINCj4gICNpbmNsdWRlICJtdGtfZHJtX2Rydi5o
Ig0KPiAgI2luY2x1ZGUgIm10a19ldGhkci5oIg0KPiAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BhZGRpbmcuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfcGFkZGluZy5jDQo+IGluZGV4IGZmNmE1YzY5NTEyOGMuLjFmOTE4MDVjZDlhYWMg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGFkZGluZy5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGFkZGluZy5jDQo+IEBAIC0xMiw4
ICsxMiw4IEBADQo+ICAjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmg+DQo+
ICANCj4gICNpbmNsdWRlICJtdGtfY3J0Yy5oIg0KPiArI2luY2x1ZGUgIm10a19kZHBfY29tcC5o
Ig0KPiAgI2luY2x1ZGUgIm10a19kaXNwX2Rydi5oIg0KPiAtI2luY2x1ZGUgIm10a19kcm1fZGRw
X2NvbXAuaCINCj4gIA0KPiAgI2RlZmluZSBQQURESU5HX0NPTlRST0xfUkVHCTB4MDANCj4gICNk
ZWZpbmUgUEFERElOR19CWVBBU1MJCQlCSVQoMCkNCg==

