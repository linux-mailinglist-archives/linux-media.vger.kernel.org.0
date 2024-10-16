Return-Path: <linux-media+bounces-19713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE6099FFA7
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 05:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7BA7B25AD0
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 03:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E83175D45;
	Wed, 16 Oct 2024 03:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VB6UiVVS";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="cXH8Ivj/"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E28101F7;
	Wed, 16 Oct 2024 03:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729050427; cv=fail; b=SG837BZ7gHyrRalsIz1WksxaViSKEKuS0/2bXzY42icUPBo5tF4PSB77GniuHwMVR0yhGl/sAKU6o3QJ5SROyYUYL1LjeDDGmw+uuT/Gu7zxbFrGtX8aRg01XjK8a1+RRl97S+sya4Kmcxp9hO8hnO7D+L0LktuPX9g7zOpBe0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729050427; c=relaxed/simple;
	bh=s+bQ4rcqDzPqJWeJrdut93GYtoBmyxS7IAuXpfk10do=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=imyO26m0KyBF72P3z/XOxSZeVwWtlc5YwaUl9KMRcOW+rpz6/uJy4OkI3QFv5owhF4juxOFFW+hvzEppvVIdh5SniQve3cXwlr6YLS9rdATWuxHJKbA6dDte9WTQcZKvlmshGA28fWMiBxw3jSI+U78AxJoiJxg9RfI+3VHL7Ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VB6UiVVS; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=cXH8Ivj/; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4b1f6aba8b7111ef8b96093e013ec31c-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=s+bQ4rcqDzPqJWeJrdut93GYtoBmyxS7IAuXpfk10do=;
	b=VB6UiVVSwsjEpsae0Zr4+LSM4qHu2QPkoj/Tdf1egShkyBmeisUa2gWtEJfnbcUGtcoZuO+mV4AuAQYKkPyMznCgB1nec9Bht26DT/lhWFrfdWROzhMMa7ro0jXFonVVhiNG/DpS2L8XT/biXgg8GBUDaDscA11MgD4JoU0urKA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:464eb50e-a5ed-49e3-bccd-a71e040b1ba0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:4d27db06-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4b1f6aba8b7111ef8b96093e013ec31c-20241016
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 635369047; Wed, 16 Oct 2024 11:46:57 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Oct 2024 11:46:56 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 11:46:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VO9NwPKmwki8hjJWjAYiQHB1s4lrl5kLnPIt7xfPpvavCDQJSFyrAmYeDyH7UpW8MCbXq8IIAfDP+XL67dDz3c040N1vpzWtQ3g0T3SxrGuV2hsJnE7Llvs5gIhp591SzXEvDqL6UORfgiwpzrsyq9EeHyOfp5GPDwKUL79IvX22PdiF/6lnYdPJhonMwt4FBzFxPTnxPy1Yi0iCdXeP8pDMoDRmSZV2SAajzRuSXhwsM67N3dhVSRSidGRvaC+kg4/GYwuE0h9ObTmUu1Qd4nInzkw3lWILsqW5clCuam3FD2stnqHvHIjqdBqpNelV9aUeG4c/P7kPy14P+f/+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+bQ4rcqDzPqJWeJrdut93GYtoBmyxS7IAuXpfk10do=;
 b=c4V8oeRF/0zXbRofJSDGu97JklVDUsq+sMO0K5DOC/J9+5ZcwOEDY6D3nDVy3lN39yXf0ojw37gga0h3K4p8cxs7xLM5EfqdTNyeyB11EPO8Dwuru7eTdtl+rRzFzKDGoGJ70b8B2oWMoM+I++u+p6WKECzfAWILV4iMmugvUkjoqYe09T+fVqh+C3gkHuYXzpwUwuyslEbm8w2KvWs9koaonMHDUampRgdQbDzvAbApJwJjRyLsH3s3ECqoMRAJzgNrJTubM7hrc1el+EFBN3eGDQxD/TMd3QD+AO3/tZs+GdSs717fhSDMBkUFcbNskvI0ufvOsJFK3smHRCSysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+bQ4rcqDzPqJWeJrdut93GYtoBmyxS7IAuXpfk10do=;
 b=cXH8Ivj/KtFQ9cOfQnD5qInGXmmnDR7S4rC2M3F0WyhHP+uf+pGXuktj+FmcNjA1QuAoyzUXcEPihebF6INfe6ZI0OCUPkTAYU0Kd30XGM0feYDJdwDt/mO7LqMAOphmq+0yf1adaB8sCK1pZIF4LiJ6ibz3ajplDny7Nxq9A6k=
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com (2603:1096:604:292::8)
 by TYSPR03MB8590.apcprd03.prod.outlook.com (2603:1096:405:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.24; Wed, 16 Oct
 2024 03:46:54 +0000
Received: from OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d]) by OSQPR03MB8697.apcprd03.prod.outlook.com
 ([fe80::133a:a06f:d11e:2c6d%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 03:46:54 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
To: "wenst@chromium.org" <wenst@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
	<stevecho@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "hsinyi@chromium.org" <hsinyi@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Nicolas Prado" <nfraprado@collabora.com>
Subject: Re: [PATCH 2/6] media: mediatek: vcodec: remove parse nal info in
 kernel
Thread-Topic: [PATCH 2/6] media: mediatek: vcodec: remove parse nal info in
 kernel
Thread-Index: AQHbHgt9ui+QqpBoREG5FZMvKQE//LKHc9eAgAFMLgA=
Date: Wed, 16 Oct 2024 03:46:54 +0000
Message-ID: <c1d16832821ce4812ced2adb3b618a732b66bd82.camel@mediatek.com>
References: <20241014073314.18409-1-yunfei.dong@mediatek.com>
	 <20241014073314.18409-3-yunfei.dong@mediatek.com>
	 <CAGXv+5H4FsadBheokwO7hTxDxAtYakL15Ki+EcnhQ3Unbz3o9w@mail.gmail.com>
In-Reply-To: <CAGXv+5H4FsadBheokwO7hTxDxAtYakL15Ki+EcnhQ3Unbz3o9w@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR03MB8697:EE_|TYSPR03MB8590:EE_
x-ms-office365-filtering-correlation-id: 7e74e8ad-d596-44d2-9b65-08dced952d1f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WDNaWHVXZHI2NG1QLzVudWtiU3lCR1p2eDc5M01mbVVPTGdhNGI3c09FSGY3?=
 =?utf-8?B?eFpubFpKL3dBWlMyaktIanFrREtKR3ZCTm5LVnJiYTc3eGl2M0x2MnF3cmF0?=
 =?utf-8?B?a0hjZWdrclhnL0tvM3VHMGJWQXhyT1l4WGEwWGlGUzJtaFJNZE5SYVZ5NkZL?=
 =?utf-8?B?ZndxZWZRY3pRT1V4cWx0UTdRZzRSRHNFbHNsZ0pYcHorblFYVHNmMWJEQWZR?=
 =?utf-8?B?SVBCZ2JwWUdoRTBhVDAwaHJLbUFkc3ZIeHZ5UENXRVJRSnZtck9OTEU0WHlQ?=
 =?utf-8?B?L21yRVJXRmZLMmNpY1lYQlBJZWRvWGlYajFGTThKUEQxM2JWek9NS1JxZzRu?=
 =?utf-8?B?VERHdXYzWTg0UUxmQVRpTFJObEpWc3BQeThBVnhHTDNjbGlIQjN5Y1VIK2FZ?=
 =?utf-8?B?c3hnVE42K0E4d1BzaDJXNXlCSVJUWUlxQXdMRXd4QUluRENJOXZoOHkvRjQr?=
 =?utf-8?B?d1l1eENzY2JZejBEQ29JUVpiMVRnczFIc0lYdGNqdmt6ZzNEM0tqSUpOMDlY?=
 =?utf-8?B?R1ozVjBJSG5LbUtVN0xRTEY0ZC9RWDFqanZ5YUFtbGhkQUpkRE5Ld0pzdzZS?=
 =?utf-8?B?NGhaZFFySm1LNkxqRW1FaUJnQWJHZVVCbVdzNjNtS2pLWEJFMVhUR1VpcjFK?=
 =?utf-8?B?YzF4cVpZRk5Ub2pPR3RSZHhKZnF2ZlVYTG1HSHVManRKcGF3Sys5SHc1blZ4?=
 =?utf-8?B?c21lckJrOUdFdzF0Wnc5bWtJQmpJVVJrY1M4MExVRTZzeXpWN25HSnNVa1Yy?=
 =?utf-8?B?UENNNkUya1JWM2hrQ05ldWwycWhWT2I2T0xRWDExT1pyc1BQQVZHQXZMdy9h?=
 =?utf-8?B?c08zemVnR2JrK2lydGpLSjVkRDFDWFM0WWpWQ2R4RUt1YVd0WlVuRFRBdnVt?=
 =?utf-8?B?U3Z1S2lMV3JPblV4N0NqcTVvekpLbWtwaTRMaHdFSXZQUTFOaERHWXNZeVVN?=
 =?utf-8?B?UVpoOVVRalZ4OVY1UFQxbUZuWElaR1dEZjM4VTEvMGF6SnNLQk5XWXR5QTdF?=
 =?utf-8?B?emlSSDF1ODNxY0tHUW9XTnFJL3pBQmhFMmUwY0JLNXhLZVBCZlIybjV6c1FV?=
 =?utf-8?B?aXFkWjcyUlU0dWFaM2UxUlpjL3RBMnlLL2IvNmJaM2xEQ2I0WUk3cGZJanZ3?=
 =?utf-8?B?RWNLeitnT0xVVmk3VEx4aHI5WXgzRlFYOFFHS0lHeEY1VUtOWSttMk1tUlR4?=
 =?utf-8?B?NE54dWNTY3RJRFRvNW1HUkpiME5NeStxbVhYVG50SFV1bXltYVdrZEEvWUly?=
 =?utf-8?B?Nndyb1lZNmtqdW9aNE9VTVFJYTRKV1NrakU3SE1Mem9GN21NMFZ0WmIzdElQ?=
 =?utf-8?B?VEJ4Q2RzWXZndWNTWlJmS0ZETk9GalovenFpaHRGemdrQU5Hc3ZhSzd2Y0Rr?=
 =?utf-8?B?RDJmWEVJc0xEQmJVdWJmWFB6MXNsSXovby9GU3Ixa1ZXRXN0NUYwU2JSNWRq?=
 =?utf-8?B?dTNhdjFYS3pjTFNuYzVXYVlLWjRNWVNnYlNYNzhWMHdVY1YzOTZTUktINHpI?=
 =?utf-8?B?UWQvK2x0WU53RmluVjZ6czRlOGd4YzdrQnBkbWRsTFk4TFJ5eGhBL3lCTUp5?=
 =?utf-8?B?OUZMRjFld1BnY1doNnRMOVY1SWM5TFFMUVc5VXZhSXZxeFJLRnNVaXNHZmV6?=
 =?utf-8?B?ZmRKUStNVWZkdElJbS9BaFhiQUZhTWliNElIWUxRMHB3d0ZqTkxJZkhNNDlo?=
 =?utf-8?B?R0cydGxab2ZnTHM3WlZTRWVTTXJsZ1F2djdFYS9rZ2ZYM3NOTnA3bnZaelV2?=
 =?utf-8?B?VHVBdjkrQkx5ZktQR01UK0xiZHpmbHlhbDVLTkhPMjBCQi8rbXo2MXk2bmJU?=
 =?utf-8?B?ejJvdWxDZUZ4TEZWTlNSZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR03MB8697.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2tTMFVWblhlZmpydnZqOERQTCtkN3lTQWowR1NmYmFWdmxXb3prZUdsenQ2?=
 =?utf-8?B?em83c3luUGZlSWFHb1ZtTUZ3NGVjOFdOQnVxZ3pSNVZTYlhEa0NWWXhtNHU4?=
 =?utf-8?B?ZkRhWVdOUEVhTTl2SGdxL3RlbEJBeUs1L0twYjZrWjhNbDN5cW9NNmJJUWtO?=
 =?utf-8?B?YUV0ZzF4TmRFRmpnUGM3ajNUaWZJZXlDMHp1bU56OFFlbnpWUkdOTWFaQmRT?=
 =?utf-8?B?SEdtdkI3alp1c1RadTJBcVB2OGRLVmhCVTJUbmxDT2YrSFdnUG82aGpsQnN5?=
 =?utf-8?B?QVRFTFpRZVc3OUM4SWYzWVVnNDIwYi9RK2ZPa2tCT08yWGNGdUljZ0ptcTcv?=
 =?utf-8?B?eUQybmpQNlJHeWlmdzZTcFpQRVh3dldXZWtnU0JFUzc3VUZuZ3VodW90d2Ew?=
 =?utf-8?B?bGxjSk1vWUFlbytiZlUrNUF6Z3dhTlJEa3FHOU4reHZMNVlUY29QRWE2Tmd2?=
 =?utf-8?B?bEZWc3NoWDBjaFJhZFc5bFZURjQ0UysxcFBDTXRld0Uxd3cvRDNiWkhtamNw?=
 =?utf-8?B?Rzdvem1ySjB1bDJuNWNENndlai81Nk8xN2ZQaW9zMmxtTnpwQUtZSEJ5enlt?=
 =?utf-8?B?TFMzSDgzekhwRldERzRiUEdYUDVLYnFyazRMSDEzUko5REszcjJDTlUvYjZn?=
 =?utf-8?B?MnozNjhFM1J6RDFpbVp1WEdHQU1ZQkc1VVI3NG1VUXBwSjFabGUyc251MUZ3?=
 =?utf-8?B?N1lmTU4xenk3RXZsTXArMG5VSlBIdmh1ZmQvOWJPLzRMT21xSVYrcHhabFox?=
 =?utf-8?B?VG9SRllONElMbFBwbXFWYWE3enNrcWZhdjdNSndpaXNuWU8wNUlGZzhFSGlK?=
 =?utf-8?B?QkhlOCs3bU1lL3UxM1pWZTljbDJieWpZbXRLN2FDbktVRU55U0Nseit5SWZM?=
 =?utf-8?B?ZmhiTVVSZFJhTmZLK2lCclJ6eVBPMjd5Qm8xNldXam5XR3BFa25FMTFrRG55?=
 =?utf-8?B?ZzRiRjNCRjdlZTljSzk5ejFNV2JXNDdLNGtPMzhHSjROUTBLdVNvdm5tWmRN?=
 =?utf-8?B?UkFXSGtMYkQ0d09OZ3ZoUzdZaFMxb2F2MXg0YVlJNWhsaFo2akJzamlGT0lz?=
 =?utf-8?B?M3Vlei9qS2RPYW5kbEZPWkxpVWpnMnpWaUxWZkFXbldSMXRXOVR6VStxY3ll?=
 =?utf-8?B?ZWpRZytQZTZQNGdSVDRMOG1JY1BqbjF3VXlPWDRLZjdpTXpGc0xOUGtJL2U0?=
 =?utf-8?B?Y3J2NlZXanY1OS9QZUFoOExMUEdKRlNoanVtcjhKdUtJRnlCcXdya3p0WEFm?=
 =?utf-8?B?L3NHdkpEUm9YZEV4WHk4OVFHejh1aWxRQUlaY0d1OWxtRlU2Z3ExOU9SNk1L?=
 =?utf-8?B?M2M4eG1nMXE5ZGNtMzBXZWh6Wm5ucXljblp2VU13QmV5dXd4YjBCRlR0c3hk?=
 =?utf-8?B?anVyWFV3VG1Ec1IyMDB4QmNhaS85WUZoOG8zSjcyT1VFbGs2OG8wb1JEQjNr?=
 =?utf-8?B?OUpCQTcxTmdtU0Q5MG1GRG1EbTBsYjVoeHJ5WEt6ZHhyNDJIMitjVFlId0dS?=
 =?utf-8?B?bXFMU3FNdzVwLzZLOTlUbWtDTDgyN0FKSlBFM29mWXRJNWlOQlh3TzJwV3Vx?=
 =?utf-8?B?dzAraHo1Nk1PdjZCZzhYRWZtTnhUMlVINTI0T2swK3NKTEVheWJnckMxOGs1?=
 =?utf-8?B?WTJWRWhJT29NYVhReU5KTERlWG13QVVjRjBBdkxTaGdtaWZrbkhVNjZUcjVP?=
 =?utf-8?B?WXk2am8wWXVBbHJNUEp0TndhclRIcUh2RFpuSzNHMjJNZ0wzZHN5cndxdlVV?=
 =?utf-8?B?bTVMTkcxOXJWeE5UZVdSWExLK0U1OEEwUzBKMkdyNGhVWG16RjN4NzJvZ0VD?=
 =?utf-8?B?RVNoaVNzSmJmOWFVTTdHYkZWWUhiWkV1ekM4UVJlbGlBZWg5YjVDaGx4dkFE?=
 =?utf-8?B?WFRnUXFGTjFuMUFyT2owRDF0Zk9aenpubFlWVzAzbmdKUUwxSFlUbHorTE9W?=
 =?utf-8?B?Rm9HZzM2RHl0M2RFUENxc2JXYldTTGhNSWhNREhSNFlCUVNHT01qSGdWVlcy?=
 =?utf-8?B?VzFLUStRZ2NxZmRHc3R1NlZtc01ycFZUaWRjV2VzQkNCeDRkY3hUeVFoaDF1?=
 =?utf-8?B?WW14N3hDTlRkRjFBMTM5L2wvK2x5NWNmQmlycDdFeUJVdDRNNVhya2JIbkND?=
 =?utf-8?B?L1AvM2VoZVo3YXI3d3FTbml1RkxTckViZFlDZGRiaU1oNkNjdEY5OENPQ1Rv?=
 =?utf-8?B?ZGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88508A7BD07E2843857BE8B32FD8B4FE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR03MB8697.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e74e8ad-d596-44d2-9b65-08dced952d1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 03:46:54.2238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0JjBi9/L3oVTiuOx1fbsdA3yrhBkl7qU3/8SwErR3SRRpoPclPa8u53clN3Js0+516s8qKZzLbysE4K8erKnrzI7YN3AiBuuLtleZ55itLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8590
X-MTK: N

SGkgQ2hlbi1ZdSwNCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAgdG8gcmV2aWV3IHRoZSBwYXRjaC4N
Ck9uIFR1ZSwgMjAyNC0xMC0xNSBhdCAxNTo1OCArMDgwMCwgQ2hlbi1ZdSBUc2FpIHdyb3RlOg0K
PiAgCSANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9w
ZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0
aGUgY29udGVudC4NCj4gIE9uIE1vbiwgT2N0IDE0LCAyMDI0IGF0IDM6MzPigK9QTSBZdW5mZWkg
RG9uZyA8DQo+IHl1bmZlaS5kb25nQG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIYXJk
d2FyZSBjYW4gcGFyc2UgdGhlIHNsaWNlIHN5bmF0eCB0byBnZXQgbmFsIGluZm9ybWF0aW9uIGlu
DQo+ID4gc2NwLCBuZWVkbid0IHRvIHBhcnNlIGl0IGluIGtlcm5lbCBhZ2Fpbi4NCj4gDQo+IERv
ZXMgdGhpcyBhcHBseSB0byBhbGwgZXhpc3Rpbmcgc2hpcHBlZCBTQ1AgZmlybXdhcmU/IElmIG5v
dCwgcGxlYXNlDQo+IHB1dCB0aGlzIGJlaGluZCBhIHZkZWMgZmlybXdhcmUgZmxhZy4NCj4gDQpO
ZWVkIHRvIHJlbW92ZSB0aGUgcGFyc2UgZHJpdmVyIGZvciBleHRlbmQgZHJpdmVyLCBrZWVwIHRo
ZSBsb2dpYyBmb3INCm5vbiBleHRlbmQgYXJjaGl0ZWN0dXJlLg0KDQo+IENoZW5ZdQ0KPiANCkJl
c3QgUmVnYXJkcywNCll1bmZlaSBEb25nDQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmZlaSBE
b25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi92Y29kZWMv
ZGVjb2Rlci92ZGVjL3ZkZWNfaDI2NF9yZXFfbXVsdGlfaWYuYyAgICB8IDEzICsrLS0tLS0tLQ0K
PiAtLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX2gyNjRfcmVxX20NCj4gdWx0aV9pZi5jDQo+
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci92ZGVjL3Zk
ZWNfaDI2NF9yZXFfbQ0KPiB1bHRpX2lmLmMNCj4gPiBpbmRleCBkM2Y4ZDYyMjM4YzAuLjc2Yjk2
OTI0YTJhNyAxMDA2NDQNCj4gPiAtLS0NCj4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0X3JlcV9tDQo+IHVsdGlfaWYuYw0KPiA+
ICsrKw0KPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIv
dmRlYy92ZGVjX2gyNjRfcmVxX20NCj4gdWx0aV9pZi5jDQo+ID4gQEAgLTYzNCwxMSArNjM0LDEw
IEBAIHN0YXRpYyBpbnQgdmRlY19oMjY0X3NsaWNlX2xhdF9kZWNvZGUodm9pZA0KPiAqaF92ZGVj
LCBzdHJ1Y3QgbXRrX3Zjb2RlY19tZW0gKmJzLA0KPiA+ICAgICAgICAgc3RydWN0IHZkZWNfaDI2
NF9zbGljZV9pbnN0ICppbnN0ID0gaF92ZGVjOw0KPiA+ICAgICAgICAgc3RydWN0IHZkZWNfdnB1
X2luc3QgKnZwdSA9ICZpbnN0LT52cHU7DQo+ID4gICAgICAgICBzdHJ1Y3QgbXRrX3ZpZGVvX2Rl
Y19idWYgKnNyY19idWZfaW5mbzsNCj4gPiAtICAgICAgIGludCBuYWxfc3RhcnRfaWR4LCBlcnIs
IHRpbWVvdXQgPSAwOw0KPiA+ICsgICAgICAgaW50IGVyciwgdGltZW91dCA9IDA7DQo+ID4gICAg
ICAgICB1bnNpZ25lZCBpbnQgZGF0YVsyXTsNCj4gPiAgICAgICAgIHN0cnVjdCB2ZGVjX2xhdF9i
dWYgKmxhdF9idWY7DQo+ID4gICAgICAgICBzdHJ1Y3QgdmRlY19oMjY0X3NsaWNlX3NoYXJlX2lu
Zm8gKnNoYXJlX2luZm87DQo+ID4gLSAgICAgICB1bnNpZ25lZCBjaGFyICpidWY7DQo+ID4NCj4g
PiAgICAgICAgIGlmICh2ZGVjX21zZ19xdWV1ZV9pbml0KCZpbnN0LT5jdHgtPm1zZ19xdWV1ZSwg
aW5zdC0+Y3R4LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmRlY19oMjY0
X3NsaWNlX2NvcmVfZGVjb2RlLA0KPiA+IEBAIC02NjIsMTQgKzY2MSw2IEBAIHN0YXRpYyBpbnQg
dmRlY19oMjY0X3NsaWNlX2xhdF9kZWNvZGUodm9pZA0KPiAqaF92ZGVjLCBzdHJ1Y3QgbXRrX3Zj
b2RlY19tZW0gKmJzLA0KPiA+ICAgICAgICAgc2hhcmVfaW5mbyA9IGxhdF9idWYtPnByaXZhdGVf
ZGF0YTsNCj4gPiAgICAgICAgIHNyY19idWZfaW5mbyA9IGNvbnRhaW5lcl9vZihicywgc3RydWN0
IG10a192aWRlb19kZWNfYnVmLA0KPiBic19idWZmZXIpOw0KPiA+DQo+ID4gLSAgICAgICBidWYg
PSAodW5zaWduZWQgY2hhciAqKWJzLT52YTsNCj4gPiAtICAgICAgIG5hbF9zdGFydF9pZHggPSBt
dGtfdmRlY19oMjY0X2ZpbmRfc3RhcnRfY29kZShidWYsIGJzLQ0KPiA+c2l6ZSk7DQo+ID4gLSAg
ICAgICBpZiAobmFsX3N0YXJ0X2lkeCA8IDApIHsNCj4gPiAtICAgICAgICAgICAgICAgZXJyID0g
LUVJTlZBTDsNCj4gPiAtICAgICAgICAgICAgICAgZ290byBlcnJfZnJlZV9mYl9vdXQ7DQo+ID4g
LSAgICAgICB9DQo+ID4gLQ0KPiA+IC0gICAgICAgaW5zdC0+dnNpLT5kZWMubmFsX2luZm8gPSBi
dWZbbmFsX3N0YXJ0X2lkeF07DQo+ID4gICAgICAgICBsYXRfYnVmLT52YjJfdjRsMl9zcmMgPSAm
c3JjX2J1Zl9pbmZvLT5tMm1fYnVmLnZiOw0KPiA+ICAgICAgICAgdjRsMl9tMm1fYnVmX2NvcHlf
bWV0YWRhdGEoJnNyY19idWZfaW5mby0+bTJtX2J1Zi52YiwNCj4gJmxhdF9idWYtPnRzX2luZm8s
IHRydWUpOw0KPiA+DQo+ID4gQEAgLTY3Nyw3ICs2NjgsNyBAQCBzdGF0aWMgaW50IHZkZWNfaDI2
NF9zbGljZV9sYXRfZGVjb2RlKHZvaWQNCj4gKmhfdmRlYywgc3RydWN0IG10a192Y29kZWNfbWVt
ICpicywNCj4gPiAgICAgICAgIGlmIChlcnIpDQo+ID4gICAgICAgICAgICAgICAgIGdvdG8gZXJy
X2ZyZWVfZmJfb3V0Ow0KPiA+DQo+ID4gLSAgICAgICB2ZGVjX2gyNjRfaW5zZXJ0X3N0YXJ0Y29k
ZShpbnN0LT5jdHgtPmRldiwgYnVmLCAmYnMtPnNpemUsDQo+ID4gKyAgICAgICB2ZGVjX2gyNjRf
aW5zZXJ0X3N0YXJ0Y29kZShpbnN0LT5jdHgtPmRldiwgYnMtPnZhLCAmYnMtDQo+ID5zaXplLA0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnNoYXJlX2luZm8tDQo+ID5o
MjY0X3NsaWNlX3BhcmFtcy5wcHMpOw0KPiA+DQo+ID4gICAgICAgICAqcmVzX2NoZyA9IGluc3Qt
PnJlc29sdXRpb25fY2hhbmdlZDsNCj4gPiAtLQ0KPiA+IDIuNDYuMA0KPiA+DQo+ID4NCg==

