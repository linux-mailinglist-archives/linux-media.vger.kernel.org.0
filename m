Return-Path: <linux-media+bounces-7355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A83B88091B
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 02:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A77B41F2449E
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 01:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7E7748E;
	Wed, 20 Mar 2024 01:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WvpafTZn";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="k7ULqrRF"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B52582;
	Wed, 20 Mar 2024 01:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710898476; cv=fail; b=tkAVfEiBOiEG4JP37L65uFOTF44XMN8n7ej6ua08b1/FEJP8L9O5sru0eksJ1MiA2AWmnqvDYMEmcfNJS52icnYwbvDNTu2hUYV1JrT3fLhBNBU84JZT31FTLNhOYvsA76LMjwaRxT5sO38E1dg/a43UGOzfVNdlXv6sWgnKOq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710898476; c=relaxed/simple;
	bh=JLdza/bn6eq9XkjqwyQ29vLtruE28E/qu5AYUvFYkvs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mWlZT+1cOCOAGOjEqbv5Bd540W0azK4dK/SqPMGAJ62u6oAt1F3EUZYbxYa1uhD4Dvd+S5RRg/x/DeO/t4m+25QRdLlw8PYUpaDClkcrc/lpXwH1B/xHLekCxCX7ExkmHfPyoYPF+oxMaYo/CFTwr1YW9TzpxSeWekxMaB9ZJLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WvpafTZn; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=k7ULqrRF; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: fc819d86e65911ee935d6952f98a51a9-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=JLdza/bn6eq9XkjqwyQ29vLtruE28E/qu5AYUvFYkvs=;
	b=WvpafTZnGIpmJGSO4YwPUmKS7fchxLq0zfnyKlFtEuoZ0xLSDqkXWvES0K2zFriEE9D1mKGTDk10+DXDIfbj9vWPtxnHQezXaesXTzyqDrZY4Gud+qFub9bKZpPpTqsPZEe6+4v+xY5epIv7K9pFCsWfKXZJf+EFCb7gUsms9/8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:3673693e-bbc1-418b-8e34-baf228556bac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:f173b281-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: fc819d86e65911ee935d6952f98a51a9-20240320
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2141407126; Wed, 20 Mar 2024 09:34:25 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 09:34:24 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 09:34:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmj050iUx5EosKYrELnk/jMB4Pc4JgTA65uSe8AgJuW2U8VnKdMnzNGH9RcjzwMQAbd6eIgF4N/t2CmAIFe7SzOKIP3WqQGSO0+U4nBhhJzL39WnXH2FevasXfHkqaRObFjjmShng8Wj60ki6o1XFDqle/C0lKq5ciHGs4xndblCRCCOSwYw0ahunA62r8Km+6LQzI4XWCX7a1CZxrMMGuPP78iQjRAplNlOkMPEyrkTitZBqfCpJRnRxC+syHMeZEHOcfNdMnfjEuc+e9THqlg+YQa+Eiob7rzU3Ck7dK8NadCzPOAKwUcZFyMlqN+0aKVw7NbyKv60YncTC24C2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLdza/bn6eq9XkjqwyQ29vLtruE28E/qu5AYUvFYkvs=;
 b=n8c1lDrIDDQNbfFUOzwMaRReVH2FmBtdfv8ihZsaQ+Qu3HWBdgi/rC9Hqw+QgL/ves5eK1aXPqNpOxfXQ4pnlaF0fZ3pQ+nEpash1bZALUu3XyOy9Zy5s1OHzHbwSEIIC1BTU2+Q2sFtYj1STJHmKnzjeyqViLlyPlfO7BvZm70m9gdDv9yUZObvTnYYUwqgdbN1j5WBXgiBU04GNIOay5d1dLvv0qBbVBMj5RnxAmL8nq3T/9JlvnjF6kzfixwf+pbRSkRjuivqgrqxBrr1hcb/84WaFfWsBwTJ3RvmBTHsfpbkdZ+Zukis9kjh11/Q77Vs2Cb2LdqqfVQ8LWl/Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLdza/bn6eq9XkjqwyQ29vLtruE28E/qu5AYUvFYkvs=;
 b=k7ULqrRFX6Qs3o5YZ1NNYi4a+w3nG4G7j4Yco8aYwEXkAkDMYvY20wdfnSHf64DvB84voJAIoXBF72nK19SxdMG6VU8fi0cfGwUSR0NbTH8WNvADGRox76mRfG5TS5qQNGTsZfubV/hebKWmTAT426cLUYZpGkc4i6JfeVXxE6M=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7658.apcprd03.prod.outlook.com (2603:1096:101:12a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Wed, 20 Mar
 2024 01:34:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::f3b6:91a7:e0fb:cb27%7]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 01:34:22 +0000
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
Subject: Re: [PATCH v2 06/14] drm/mediatek: Rename files "mtk_drm_crtc.h" to
 "mtk_crtc.h"
Thread-Topic: [PATCH v2 06/14] drm/mediatek: Rename files "mtk_drm_crtc.h" to
 "mtk_crtc.h"
Thread-Index: AQHaecux/YUNoOWpJ0Km1zoQtqUt4LE/2d+A
Date: Wed, 20 Mar 2024 01:34:21 +0000
Message-ID: <7a6ab11f0a8ec48ae852fc2a0a08157f27974d16.camel@mediatek.com>
References: <20240319070257.6443-1-shawn.sung@mediatek.com>
	 <20240319070257.6443-7-shawn.sung@mediatek.com>
In-Reply-To: <20240319070257.6443-7-shawn.sung@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7658:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MMlSVb/Qug87CCz/szXTNe5s5ZRkqwzmI/hGIzn3167YQsOqJ1++wmQEAUfn6VQ4Vl068WniUJD4Yd1L3ur5GRlJfXOsTLqvMu2MNFypIPuwT6MBaTnweq+uhJ9V9WzBRgy9dQOzZs0BVKyr6L9jMtM129rev+lsjFm8rR6QsBRV1EXXL5e/M5uPhlER4drLqw1fAnvDkHvGxggLxrhxqjEBqYGx4986bReYtsh40xEVMebt43IgY5VOcfUp6AgJOJeoTSUty1iDGTvNxI1Fem6kVsmduuHjuBEC2sH4WxnzW7Bu2UNzdn1vJGvdVSGyHFKGO11sA88C2S0HkfMktSMso45boLSPdUGrpvFnzLXHH3NFNds7juXkk0QpD6qIjSgp0A1I5/tjnQqT8VnQ+Rtg01ltmxBYIcJnbBNs93G5IRrAGKTuvauP6ccIgkLStpp6sqLTtwBIMvOnSuRHrZ8oNqCQk4/5KlKft48C3rCVjuztvX1LjbsT6UyaBZ/3COU5EI/vjUd/p2qFRzoq6KYQg/AJIYpzM90JmCrsDds9MwLvtDAzpwujxKpOLQowHhT3I43w8xVxPmbknUEdo3kw3FkRZChFr0THv7erDb6prHCC/zCDMySYJ8d87x+OsVwo/DiFKLEbA2WBf09sXv+XfEhIIVfh8EujhjatTs0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDVPYzhONGE4VU1TaGIrTUlvb2pTbzRZd0huNXBOZnhsQ0M2ayt5TzdoT0c3?=
 =?utf-8?B?a1NZWmorZ0ROMTltOHJIWU5MTVlZcEFrVll3Z2kxZHRkVmZYTlJUVzMwbC9y?=
 =?utf-8?B?bUU4REhtTFQzSGNnSktIVFJ6dGFXL2YrTkdYWHl3UlcwSUtsVERKWDFCb2oz?=
 =?utf-8?B?Z041MHhyZ0lxTUEyRi8vYllUbjZXVU1iaEZFVGxDdGhYUHVMc2tUeS9pbi9k?=
 =?utf-8?B?SFdaZE5rTCtWR0VJTXBQR1EvakMzYTU2R1UwckRZZlpON0hQR0ZKOUtRWEE1?=
 =?utf-8?B?YkpqamFNdFhhYzFrNEkzaXQydHlHdTIxdHBvY0VSc2dHZUtEYUJjS3Fjai8w?=
 =?utf-8?B?WEZERVZ6WHVJbU04L0RTbU9uVVpwZUVuUmxoWFhWQ1B0UTYxNW44b3ZkbVlv?=
 =?utf-8?B?Y0FFcWlUb3E3NllMbWNTd3FGV29ma0M5MGdJYmF6TnFiUGN1WjlwWWJjbjlS?=
 =?utf-8?B?Q3pxQ2tIWHRFQmFzcnY3cVdKbFJDV05FTXZ0bmVGaTY2YUt5UUE5cDNzRlVR?=
 =?utf-8?B?TFM0UmdlMjdDOS9Hd0pScXMyUmg3VHNKNHBkb3gzT2JMSW9UM0xtU3l5d2dR?=
 =?utf-8?B?SExLK2hSMDZsUUtlM1c3UGIxVkZoVEIvMTQ2OXFwcjVXMkYrckpUMy9mYVJw?=
 =?utf-8?B?Z3dhaGJmZVNjMGVmMVRRd2M5WFFWTDJwVDF1NWoyNWZrbTl5TE5pQ3g0SDRZ?=
 =?utf-8?B?QjUra0srZTJEWnFONE9iRXgzdGQzczlQYXpmZ0grajAzdExTTlZnZFIyVDE0?=
 =?utf-8?B?cnl2bkZPbkYrWHpMWWxNQTR1djJMNVdUK0tvV2UxVVJrckFoRVM4VDJpMW54?=
 =?utf-8?B?MzlYYTBrS1pKSkVmRmVlSHRKaVZqdVQvZ1NKcCtxVmx6b0pmTVJYRTBINFRN?=
 =?utf-8?B?VUU5SGdRNWpPaS9hakNzTGJwSm04eGRIOEQ1eGgxK1JUT1ZOd2kzMmsvdjdK?=
 =?utf-8?B?cGZKQnAyY0F4dmkxK09Ta1FDcGZZM3VHSWZFRzkrOG01TnZjQUllbnVCSGpr?=
 =?utf-8?B?NlpScXZOeEt6eE9WZ2xOTUQzN1kwVVdITFF1QUtKbFl5dXU3bStHUXBtdGtN?=
 =?utf-8?B?U1JBOEhuLzVtVWdKaTVnc0p1TjBZTGpTVjMrcFlXcXBmUFdaL3NwMjk4SXkv?=
 =?utf-8?B?MXRRdFkwait3bVRGZnpJZHBxRkZadUNyVXVwdnQyRXhmeGpHZGc4dVZaeks4?=
 =?utf-8?B?cUJRUjVxZlp2b1U0WWN1ZzQ1SnRkQVBzK2tFUWhySHIyanNmNlRFR2F0WjNl?=
 =?utf-8?B?UWdDeVNnVWRicEVUaEY2VFgxempQYlZQTmhYcVlUNzhhUFg1Mnd2Zk50aGgy?=
 =?utf-8?B?Q296TENyQlI3UllYTGVGWVF5cTlhVGpzeU9PSkhSTVkxcjYwc29YejBTVXNj?=
 =?utf-8?B?ZXRTV3k0TCtiaWdmajRscTZUaGVnZjhBSC8ycGMzcUZtbjdiTEJVL3h1blJ5?=
 =?utf-8?B?Y2MxVEdycGdSRzF4b3A0dE1NYkczWFJUMWRoU09xZG93SXNyWDlPeGhhaXZG?=
 =?utf-8?B?T3lXSytBaWsya3U3OGlnVnFxS3ZwRDdJMlQ2Y245ZVdZZlFhenQwV21CY1ZU?=
 =?utf-8?B?V3NOUmhUKzM3Q1d2UlRHNHJ0aUhzbXhZUnZXb1IrOTkwNk1adFM1ZTdhQ21t?=
 =?utf-8?B?MlloV3BJVzJ4eC9JbUVXVmhWaHNLaFJwY2pBZ2c0dkpRTU8wWEpkdjBPNFY3?=
 =?utf-8?B?aFE0VDZzQzlJMk1hQmMvQmFQL0hjYVJDUTl3OEt5Tzd0ckZzK3FkdmVLNWN2?=
 =?utf-8?B?MWhkbVJMWGQyN3NxNXdkSWROOUJWSHdsKy94NEFqZ0dhdkp3ZW92NnRmR0hH?=
 =?utf-8?B?VkFKMXZQOVhLU09GTHJWOTREei9SMTVzVm9GeUpwM2YxOHUzY2dJZXlaVVA3?=
 =?utf-8?B?V0dXdWRzYzJMNDNTakVXRGVJZG5OZHdOOFU4OS9meTRVNkhIY3kwUTBicm9X?=
 =?utf-8?B?VDdYTkdtQXlRcTdNQmVYZ0l2TmJoenNnbzN3RDZ6UFJrU3ZBcXFPOU9WZTRB?=
 =?utf-8?B?TzRtSXZhVFJSc1BnL2gxYThmTEpjQmJNcW5CRVAyNG11ZzFHV3d3bUhQT0Vx?=
 =?utf-8?B?dFZqMllWaVZZSTNhZkJLclk5ODlDUTA2UVNsbExYNkJvcTFydi9za2FuTzRV?=
 =?utf-8?Q?JORevFGkTPubmBvW8TJ2kmVS3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F085E885D69044FAE7287F35EB7ABE0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612e1504-d8ef-4ee3-8b5e-08dc487dde76
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 01:34:21.9927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tMJ184oCvMlQ3uOGbwDzB0dpUPt9U0SBZaDSvXfa+Ocj4FR/6JdYIJh/LtBWJeJ+kBKUwIGQgaxa0DvH2QxjcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7658
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.472200-8.000000
X-TMASE-MatchedRID: cgbqQT5W8hf+DXQl7XSOUia1MaKuob8PofZV/2Xa0cKSO6So6QGgysNq
	SYgiOmwd8cv4yT0rvGNUPHgTUudKRKXzgcphDfm8Q4srjeRbxTZ3Bf9JIqsoeL/XDMnRl2JlZvo
	+mFW19mAr193kjpYE6/98YaF0TO9gKQ54kjEfuxVDmVmiQbM5qv9XCvIg0nGJmyiLZetSf8n5kv
	mj69FXvKEwgORH8p/AjaPj0W1qn0SyO81X3yak82f0Q1MTpjXezL0O6af0IVdy32iNbpR6nQVHb
	2wKVZ1yN7O4/Bs0jv9+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.472200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	85CB20C81525968D38C578295711DD4A6E29795C199DD70E5A8F8B998A3316492000:8

SGksIFNoYXduOg0KDQpPbiBUdWUsIDIwMjQtMDMtMTkgYXQgMTU6MDIgKzA4MDAsIFNoYXduIFN1
bmcgd3JvdGU6DQo+IEZyb206IEhzaWFvIENoaWVuIFN1bmcgPHNoYXduLnN1bmdAbWVkaWF0ZWsu
Y29ycC1wYXJ0bmVyLmdvb2dsZS5jb20+DQo+IA0KPiBSZW5hbWUgZmlsZXMgbXRrX2RybV9jcnRj
LmggdG8gbXRrX2NydGMuaC4NCg0KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+DQoNCj4gDQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaWFvY2NoaW5vIERlbCBSZWdubyA8DQo+
IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogSHNpYW8gQ2hpZW4gU3VuZyA8DQo+IHNoYXduLnN1bmdAbWVkaWF0ZWsuY29ycC1wYXJ0bmVy
Lmdvb2dsZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL3ttdGtfZHJt
X2NydGMuaCA9PiBtdGtfY3J0Yy5ofSB8IDANCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9hYWwuYyAgICAgICAgICAgICAgICAgfCAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYyAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2NvbG9yLmMgICAgICAgICAgICAgICB8IDIgKy0N
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jICAgICAgICAgICAg
ICAgfCAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgICAg
ICAgICAgICAgICAgIHwgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X292bF9hZGFwdG9yLmMgICAgICAgICB8IDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9yZG1hLmMgICAgICAgICAgICAgICAgfCAyICstDQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgICAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyAgICAgICAgICAgICB8IDIg
Ky0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICAgICAgICAgICAg
ICAgICAgfCAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5j
ICAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19l
dGhkci5jICAgICAgICAgICAgICAgICAgICB8IDIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfcGFkZGluZy5jICAgICAgICAgICAgICAgICAgfCAyICstDQo+ICAxNCBmaWxlcyBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gIHJlbmFtZSBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsve210a19kcm1fY3J0Yy5oID0+IG10a19jcnRjLmh9DQo+ICgx
MDAlKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2NydGMuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY3J0Yy5oDQo+IHNpbWls
YXJpdHkgaW5kZXggMTAwJQ0KPiByZW5hbWUgZnJvbSBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9jcnRjLmgNCj4gcmVuYW1lIHRvIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
Y3J0Yy5oDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
YWFsLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfYWFsLmMNCj4gaW5k
ZXggNDBmZTQwMzA4NmMzZC4uYmE5MjZlNzk3YWY4YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9hYWwuYw0KPiBAQCAtMTEsOCArMTEsOCBAQA0KPiAgI2luY2x1ZGUg
PGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRl
ay9tdGstY21kcS5oPg0KPiAgDQo+ICsjaW5jbHVkZSAibXRrX2NydGMuaCINCj4gICNpbmNsdWRl
ICJtdGtfZGlzcF9kcnYuaCINCj4gLSNpbmNsdWRlICJtdGtfZHJtX2NydGMuaCINCj4gICNpbmNs
dWRlICJtdGtfZHJtX2RkcF9jb21wLmgiDQo+ICAjaW5jbHVkZSAibXRrX2RybV9kcnYuaCINCj4g
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Njb3Jy
LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYw0KPiBpbmRl
eCA0NjVjZGRjZTBkMzI0Li43OWJjZDNjNDg3NTYzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYw0KPiBAQCAtMTAsOCArMTAsOCBAQA0KPiAgI2luY2x1
ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRp
YXRlay9tdGstY21kcS5oPg0KPiAgDQo+ICsjaW5jbHVkZSAibXRrX2NydGMuaCINCj4gICNpbmNs
dWRlICJtdGtfZGlzcF9kcnYuaCINCj4gLSNpbmNsdWRlICJtdGtfZHJtX2NydGMuaCINCj4gICNp
bmNsdWRlICJtdGtfZHJtX2RkcF9jb21wLmgiDQo+ICAjaW5jbHVkZSAibXRrX2RybV9kcnYuaCIN
Cj4gIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Nv
bG9yLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYw0KPiBp
bmRleCA3OGVhOTlmMTQ0NGZhLi40YWE0MWIxZmYyNjAyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYw0KPiBAQCAtMTAsOCArMTAsOCBAQA0KPiAgI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3NvYy9t
ZWRpYXRlay9tdGstY21kcS5oPg0KPiAgDQo+ICsjaW5jbHVkZSAibXRrX2NydGMuaCINCj4gICNp
bmNsdWRlICJtdGtfZGlzcF9kcnYuaCINCj4gLSNpbmNsdWRlICJtdGtfZHJtX2NydGMuaCINCj4g
ICNpbmNsdWRlICJtdGtfZHJtX2RkcF9jb21wLmgiDQo+ICAjaW5jbHVkZSAibXRrX2RybV9kcnYu
aCINCj4gIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X2dhbW1hLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYw0K
PiBpbmRleCBjMWJjOGIwMGQ5MzgwLi4xYTFlZTc3MTI3ZWU5IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYw0KPiBAQCAtMTEsOCArMTEsOCBAQA0KPiAg
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3Nv
Yy9tZWRpYXRlay9tdGstY21kcS5oPg0KPiAgDQo+ICsjaW5jbHVkZSAibXRrX2NydGMuaCINCj4g
ICNpbmNsdWRlICJtdGtfZGlzcF9kcnYuaCINCj4gLSNpbmNsdWRlICJtdGtfZHJtX2NydGMuaCIN
Cj4gICNpbmNsdWRlICJtdGtfZHJtX2RkcF9jb21wLmgiDQo+ICAjaW5jbHVkZSAibXRrX2RybV9k
cnYuaCINCj4gIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX292bC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+
IGluZGV4IDJiZmZlNDI0NTQ2NjYuLjdmMjIxOWMwMTE5YmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gQEAgLTE1LDggKzE1LDggQEANCj4gICNpbmNs
dWRlIDxsaW51eC9wbV9ydW50aW1lLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVr
L210ay1jbWRxLmg+DQo+ICANCj4gKyNpbmNsdWRlICJtdGtfY3J0Yy5oIg0KPiAgI2luY2x1ZGUg
Im10a19kaXNwX2Rydi5oIg0KPiAtI2luY2x1ZGUgIm10a19kcm1fY3J0Yy5oIg0KPiAgI2luY2x1
ZGUgIm10a19kcm1fZGRwX2NvbXAuaCINCj4gICNpbmNsdWRlICJtdGtfZHJtX2Rydi5oIg0KPiAg
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsX2Fk
YXB0b3IuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRv
ci5jDQo+IGluZGV4IDAzNGQzMTgyNGQ0ZGMuLjU0MmRjMmEyMGVhOTAgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmxfYWRhcHRvci5jDQo+IEBAIC0x
Nyw4ICsxNyw4IEBADQo+ICAjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5o
Pg0KPiAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstbXV0ZXguaD4NCj4gIA0KPiAr
I2luY2x1ZGUgIm10a19jcnRjLmgiDQo+ICAjaW5jbHVkZSAibXRrX2Rpc3BfZHJ2LmgiDQo+IC0j
aW5jbHVkZSAibXRrX2RybV9jcnRjLmgiDQo+ICAjaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5o
Ig0KPiAgI2luY2x1ZGUgIm10a19kcm1fZHJ2LmgiDQo+ICAjaW5jbHVkZSAibXRrX2V0aGRyLmgi
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5j
DQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYw0KPiBpbmRleCBm
YWE5MDdmMmY0NDNlLi4wNGY1ODQzNzIyMTRmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9yZG1hLmMNCj4gQEAgLTEzLDggKzEzLDggQEANCj4gICNpbmNsdWRlIDxs
aW51eC9wbV9ydW50aW1lLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVrL210ay1j
bWRxLmg+DQo+ICANCj4gKyNpbmNsdWRlICJtdGtfY3J0Yy5oIg0KPiAgI2luY2x1ZGUgIm10a19k
aXNwX2Rydi5oIg0KPiAtI2luY2x1ZGUgIm10a19kcm1fY3J0Yy5oIg0KPiAgI2luY2x1ZGUgIm10
a19kcm1fZGRwX2NvbXAuaCINCj4gICNpbmNsdWRlICJtdGtfZHJtX2Rydi5oIg0KPiAgDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMNCj4gaW5kZXggMTZhNmZjMGJi
ZGM5ZS4uNjMxYzFlZjI4NDdlZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fY3J0Yy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2NydGMuYw0KPiBAQCAtMTksOCArMTksOCBAQA0KPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJv
YmVfaGVscGVyLmg+DQo+ICAjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4NCj4gIA0KPiArI2lu
Y2x1ZGUgIm10a19jcnRjLmgiDQo+ICAjaW5jbHVkZSAibXRrX2RybV9kcnYuaCINCj4gLSNpbmNs
dWRlICJtdGtfZHJtX2NydGMuaCINCj4gICNpbmNsdWRlICJtdGtfZHJtX2RkcF9jb21wLmgiDQo+
ICAjaW5jbHVkZSAibXRrX2RybV9nZW0uaCINCj4gICNpbmNsdWRlICJtdGtfZHJtX3BsYW5lLmgi
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29t
cC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYw0KPiBp
bmRleCBhNTE1ZTk2Y2ZlZmNiLi4yNDM4OWM2YzM1NjFmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMNCj4gQEAgLTE0LDExICsxNCwxMSBAQA0K
PiAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oPg0KPiAgI2luY2x1ZGUg
PGRybS9kcm1fcHJpbnQuaD4NCj4gIA0KPiArI2luY2x1ZGUgIm10a19jcnRjLmgiDQo+ICAjaW5j
bHVkZSAibXRrX2Rpc3BfZHJ2LmgiDQo+ICAjaW5jbHVkZSAibXRrX2RybV9kcnYuaCINCj4gICNp
bmNsdWRlICJtdGtfZHJtX3BsYW5lLmgiDQo+ICAjaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5o
Ig0KPiAtI2luY2x1ZGUgIm10a19kcm1fY3J0Yy5oIg0KPiAgDQo+ICANCj4gICNkZWZpbmUgRElT
UF9SRUdfRElUSEVSX0VOCQkJMHgwMDAwDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2Rydi5jDQo+IGluZGV4IDgxZThhYTY1YWJkNmQuLjdiZTNiMDU0NmQzZGYgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+IEBAIC0yNCw3ICsyNCw3IEBA
DQo+ICAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4NCj4gICNpbmNsdWRlIDxkcm0v
ZHJtX3ZibGFuay5oPg0KPiAgDQo+IC0jaW5jbHVkZSAibXRrX2RybV9jcnRjLmgiDQo+ICsjaW5j
bHVkZSAibXRrX2NydGMuaCINCj4gICNpbmNsdWRlICJtdGtfZHJtX2RkcF9jb21wLmgiDQo+ICAj
aW5jbHVkZSAibXRrX2RybV9kcnYuaCINCj4gICNpbmNsdWRlICJtdGtfZHJtX2dlbS5oIg0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMNCj4gaW5kZXggZGI2M2Ez
MmM0MDdlMy4uNzIwZjZiNGIwODIxNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fcGxhbmUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9wbGFuZS5jDQo+IEBAIC0xMyw3ICsxMyw3IEBADQo+ICAjaW5jbHVkZSA8ZHJtL2Ry
bV9nZW1fYXRvbWljX2hlbHBlci5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2FsaWduLmg+DQo+ICAN
Cj4gLSNpbmNsdWRlICJtdGtfZHJtX2NydGMuaCINCj4gKyNpbmNsdWRlICJtdGtfY3J0Yy5oIg0K
PiAgI2luY2x1ZGUgIm10a19kcm1fZGRwX2NvbXAuaCINCj4gICNpbmNsdWRlICJtdGtfZHJtX2Ry
di5oIg0KPiAgI2luY2x1ZGUgIm10a19kcm1fZ2VtLmgiDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2V0aGRyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2V0aGRyLmMNCj4gaW5kZXggNmE1ZDBjMzQ1YWFiOS4uNDFlZmFhZmUyNmYxYSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19ldGhkci5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZXRoZHIuYw0KPiBAQCAtMTQsNyArMTQsNyBA
QA0KPiAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oPg0KPiAgI2luY2x1
ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaD4NCj4gIA0KPiAtI2luY2x1ZGUgIm10
a19kcm1fY3J0Yy5oIg0KPiArI2luY2x1ZGUgIm10a19jcnRjLmgiDQo+ICAjaW5jbHVkZSAibXRr
X2RybV9kZHBfY29tcC5oIg0KPiAgI2luY2x1ZGUgIm10a19kcm1fZHJ2LmgiDQo+ICAjaW5jbHVk
ZSAibXRrX2V0aGRyLmgiDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX3BhZGRpbmcuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGFkZGluZy5j
DQo+IGluZGV4IDBkNjQ1MWMxNDliNjcuLmZmNmE1YzY5NTEyOGMgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGFkZGluZy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfcGFkZGluZy5jDQo+IEBAIC0xMSw4ICsxMSw4IEBADQo+ICAjaW5j
bHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRl
ay9tdGstY21kcS5oPg0KPiAgDQo+ICsjaW5jbHVkZSAibXRrX2NydGMuaCINCj4gICNpbmNsdWRl
ICJtdGtfZGlzcF9kcnYuaCINCj4gLSNpbmNsdWRlICJtdGtfZHJtX2NydGMuaCINCj4gICNpbmNs
dWRlICJtdGtfZHJtX2RkcF9jb21wLmgiDQo+ICANCj4gICNkZWZpbmUgUEFERElOR19DT05UUk9M
X1JFRwkweDAwDQo=

