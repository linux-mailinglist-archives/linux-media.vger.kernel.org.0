Return-Path: <linux-media+bounces-29710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9973A81B30
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 04:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94BF64A8040
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 02:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E9D1922F4;
	Wed,  9 Apr 2025 02:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LpqC9Nd1";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="rG0wlKUh"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779D55D477;
	Wed,  9 Apr 2025 02:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744166471; cv=fail; b=M+XCmQgZFISeuGwveSZKJ7FqxBr5OCd/oZEhQo/C4N2pfqVsAqb+zWCs7ArG2PRss/qnolaXI5dEwCp92as60AqwP2InTAlBGdWml+jFyTKj3OMqAf1S4AWr9hkqYKCb8wd1yR8o3IKPFeutyX9SMr4TdMaDxE6vlmdPiHDuePw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744166471; c=relaxed/simple;
	bh=MINCr8s9icITJE/+r4x4C5B9qsBeBdOssciuITzLyr8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AYWZOcc06QWvvWpNi/Tbgx1lB4nRzhzzbYma/mCRY5BR6QfTsY01srCm55j1z6rIXuW49Mfvlg61IZD2viaHKiodIuxrxip8ZUbDJM/fMELJA5Ul1edIsUIlwvTQ/J0L457TbBaXuWIciiDEMHOu2E/s8Sq4bQHfqHVRYjwoCcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=LpqC9Nd1; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=rG0wlKUh; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 126f5ee614ec11f08eb9c36241bbb6fb-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=MINCr8s9icITJE/+r4x4C5B9qsBeBdOssciuITzLyr8=;
	b=LpqC9Nd1wX1xGwFD6tUTdQSEnfRJPq/tJD44JJzjCJrAu8kn3hPPpCtP9nvT7p0+RvFmccxlm85v5txw+IFK8uEJyLJC+Uh/5FJZwRSC4YCxgmXJrPHgMP5x46yVcVGHMv4ErEcFI6ckX5LMisueODBHSUz6CXOfuFcvK4Eu72o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:0a3b7043-51b9-4197-b389-d0035d36a6a2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:441b618d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 126f5ee614ec11f08eb9c36241bbb6fb-20250409
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 651438392; Wed, 09 Apr 2025 10:41:00 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 9 Apr 2025 10:40:59 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 9 Apr 2025 10:40:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQzahsx9s3h1vb9U12cNQ7ikZFtumujKBO+DQJwcK9u0BQ6Gj61Jsms7u5JVaa2W/NXEldGYkOsNTXjkVt78hqDJ2pT5DeP6ZN/r+wuxMV4y/PAymeHTG1Ff9ryKSTT7OThwl2PtKh211eot/n+ZCCQg4rlj2GjpFhgMaC61PQRDl93CSbN+pZ13Cl/uu6hvTMBIH0pemgKFTU4DqzSveJd4xsriZ8xztOIG6mbZ8U3VSC93FlUi7NWcC8fDjK7jjFVPyQ4ijW3LZBBnNGOD8r1zL82mQP7XdMReAr6bSADzi+Uh4OuFifIGqam4czcu6TDsUIdisXx066HFTExh3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MINCr8s9icITJE/+r4x4C5B9qsBeBdOssciuITzLyr8=;
 b=QDR01RclE2NvpuHWAnr5QvmDQ23wE8NDdLVnGVnWkxr+uVhyvlcmRFiV8AzuP38XPesY3UxaUOGjgOqFxioToCVDxiBe7v0AFigoB7X6cvbWjI1cXY2FW3jecamEL8P/MrEp2enxqoWSbcyBmahlplXnzrmZPtNGTmkbJGJLDU4eQYvVRed2PL/UgqPLYFgObvB83aem9hKSJfTiOQE1R96/+ws+MAPWMbWthXueAw1wceFQo+0BNTowtWPrweka2VVFH/nS0WsYdKIxG5MnE/U6VsMw7UPyK3zZa/YOmLBP0TKYHMoSwAKZl8S4OnIoV+6od05jnMaqnrJ2Fw7KgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MINCr8s9icITJE/+r4x4C5B9qsBeBdOssciuITzLyr8=;
 b=rG0wlKUhM6ZUUALbJKF2FWW3vwyxXXaGkAGT8Sx5JV6IvocaHiv52Tanl8VkicRi3azbMM30sprDJ5aQ971sZp1dC7wEOaba3h8Ap3TC74lBVqX1cap9x6Mglwcqe+tgAXGRuj2+8HEy5oWSyvi3VVS+fFM9zQRqW5w0Hw4pN7w=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8724.apcprd03.prod.outlook.com (2603:1096:990:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Wed, 9 Apr
 2025 02:40:55 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%6]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 02:40:55 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: Julien Stephan <jstephan@baylibre.com>
CC: "robh@kernel.org" <robh@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "paul.elder@ideasonboard.com"
	<paul.elder@ideasonboard.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, =?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?=
	<Andy.Hsieh@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v8 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v8 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbbNbRmiLpkwz5zku5kreqYRJ/h7N7ovCAgB6fioCAANV5AA==
Date: Wed, 9 Apr 2025 02:40:55 +0000
Message-ID: <9e9fd35b62cb1c9e234be0ff432aa4a965801e08.camel@mediatek.com>
References: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
	 <20250122-add-mtk-isp-3-0-support-v8-4-a3d3731eef45@baylibre.com>
	 <b68208ea56f297fab0a0c290e73a8671366735b6.camel@mediatek.com>
	 <CAEHHSvYcet16TrWRbE=nkyS-0jXNbB+=knL0zUKLbnqcYBaSpA@mail.gmail.com>
In-Reply-To: <CAEHHSvYcet16TrWRbE=nkyS-0jXNbB+=knL0zUKLbnqcYBaSpA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8724:EE_
x-ms-office365-filtering-correlation-id: 301f3371-d14f-4edf-0813-08dd770ff3c7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dWYwTU13QzB3VWY3QmpvTjBCZVhuMnZ5MGVnNEJSeFVNSWI5NmlpL2ZKK29i?=
 =?utf-8?B?N2VKSEVnUERmcElVVXVKdEZjS3lvYS9qVHRiczJkSDlVTnczMkZ2UTdJZ0F5?=
 =?utf-8?B?YXk3NjAyR0hwR3c3MFRyMmhPNWVRUk5lbzRPMWVFejMrekNLTGdqK0xUUXk0?=
 =?utf-8?B?QytqSE5nQzVoTTBMeEZhTGVCdmY5VzQzRmY5UFZmd3lLaStxdGp3elFsaTYy?=
 =?utf-8?B?QUhyMjZPbUpTRGR1Rk9oTmJvdFZMVStRb1djUmNMMkxLa2JLSUNTYUFQM1Bj?=
 =?utf-8?B?bUJrVlRrQUZxb1pTdHh4UHhMU3BBRDg0MHVaWFhLUWN5cEl1V2hwSUpJdDkr?=
 =?utf-8?B?cnRhU2lleVpBVE42SlRjWDMvNjEyc2VvU29EZ0I3bzdxQXl4YjZtdmIxN29N?=
 =?utf-8?B?VWV3OVAwczYvRWlXakRydXh4Skc1WGhxaTR1WW1abkxVZFlOVjZnbU1yS1Nt?=
 =?utf-8?B?UnI4emZyR1RtT2RqK0Y5THRIMjY0eDdnSmhranJMakNCQXNaVElhRnJBVnU2?=
 =?utf-8?B?eTIvVCtGT0FjV0xlRUJ6SXZiSk84QU9MdGF3eVltZTVaZ2hROWd3SXdScWx6?=
 =?utf-8?B?b2t1Y1JkOGdJSmNZcEU5dlFoTnpPTHRsWlJrVkc5V3N4cHJqQ3RyMjVqbDNu?=
 =?utf-8?B?ZFE1NXQwSFhZRU1HTGJ2NjVNNUplajEzckpLQndraXQ4dWRVdmVVYWlEV0RR?=
 =?utf-8?B?Mm5qZmRhOU92S01UT3JXaE1xSk9IVTlOeVhOVFpNWm00eDUwNXZWUUsxKzVQ?=
 =?utf-8?B?c1NORHp3MHRha2tEQjRDZ0cwL0UrVGR5N1podVg2MjFIckxMb3IxUVJwVXpi?=
 =?utf-8?B?WDVBRGlUamJkbTlLZkw4MGk2WXFzZS9ha1B0NlR5dkUyQ25xYmFxNkwzc0dS?=
 =?utf-8?B?SlJUY3JmYzZhRnBtc0RHU1dZUEw5K21ILzduK3VOeEJxalVoVHBzWGx2bGlw?=
 =?utf-8?B?OVpPc0hBK2tsaWt5T1ltbDRQSlpDYWpRQjBUQkVPR2Ryb2M3SFNKVjZqZTA0?=
 =?utf-8?B?ZVZRSUxVSkhiNVA1WTVkSjdudFV0UXhOYzlRcktkMDdwZEd0ZkpSU0k5Zlpa?=
 =?utf-8?B?L3FST3R6OWVkUnYvVm5GYmRTZVhlNFZoU1huWjg1ZkF4U2wrbzdDbzQ4WFN5?=
 =?utf-8?B?QWw3ZFlHR3Zzd0djMVBvcFAwQTZIVStlYWtKRUpUUFU1d1R2K3huNXEwRTFC?=
 =?utf-8?B?ZUlHNXV1R1lCdDF5cUdneXFxdE1pQ0JKZkpNUDZpTzBYOWRmVWdTQTlOQVBZ?=
 =?utf-8?B?WGVmaXBxRE5EdUViRGpSSUlyNllVUUloWndKTjBpVC9UZktHUTNseVFPbUpX?=
 =?utf-8?B?YTEyblBXbi9VSy9MZXdzSTA2Y3ptRlR2RUNEMmNmRlZyMmFLS05WS2cvTnI3?=
 =?utf-8?B?SmpaTUpaaWVIREpSQ09NZ0QycW9TVzFCQkwrOXVtY3NLMHZwOU1VV2lQR3Ev?=
 =?utf-8?B?cWFwY29GbXBCWnBOcVdOdm05WnA2MlNVS3VXelM5TEV4Zm9PNG5XYWdpeUx3?=
 =?utf-8?B?bktNN25leXAvVU93MnJiTzFuRUpzcGw3a3AxLzNRRDBBTlVhUG1JdVVkV2Qw?=
 =?utf-8?B?VlV3VkcyYTRvbUowUXRLR1JiSzMxallHakJEQTdVaFp2QVd4T1RFWlpoVm1m?=
 =?utf-8?B?Zkk0NUJOUzV2RXphUjlrMVlUUkdlZXJSdExwQ3cwTG82bjdyNGJQTk1Ba3Vn?=
 =?utf-8?B?L2UxQnVvanFKSVZFMEhocDhWL2l6UFVvLzl0VDlwT1FBaFNkMzlyYkhYK2ZS?=
 =?utf-8?B?TWNZV2doU3dVd1kvc1ZBTWgvcXBFMDhuOElEcDR0SjBKTFNONzRZcEpxNmZh?=
 =?utf-8?B?Q0NoQVljdm5wdlRxT3hNL3lzK1ZadUlHcGhkSkJ0NXRmMFNzNm5sQUUrKzIx?=
 =?utf-8?B?SXIzUkhQb3pHcENkRFZlbHZWbXhYMWp1SVhCcFdVOWNNNWRubDlRbzJJczVZ?=
 =?utf-8?B?bkRtMnJtbmVvNjZDY3gvZ2RBNEg0bGtha0VSd3BaUWxzWWZhUlVCMkc4U2lW?=
 =?utf-8?B?d3M0bWoyYnhnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjVUcTFtUG16OW14TDc3WDVpT2FVU1EydWFuQWt2aVRRN1Q0RUppQS95eDFz?=
 =?utf-8?B?cldTT0xKOGM1UDA3NDVYNEwvcEczZEg2QkFZY1QzNnhCcjZHK3NUSlVuNWor?=
 =?utf-8?B?cUQvK2dHTzRQS3JUK1cvZ1BqWGE0TEFRcVZCNmk4SEx5dDN5NjM5VGR2WXVp?=
 =?utf-8?B?Qk9LRzhEKzIvY1pIdWZYZ0NqVS9nOXI1ZFlDdTVNNlFqZStoc2cvcHZIcjg1?=
 =?utf-8?B?c2dxeXdJSXpNd2FDdnczSVEzN2lML05IZndON3JPSWFmcFhvTm5ZQy9kbmZ2?=
 =?utf-8?B?NU9XZWNKeFF6UGYyZHJ4Qzg1RUIyWXhCbHBscEtOTjd5QVJTMlh5OERMRVlH?=
 =?utf-8?B?WTVPNm5uUE1qa0t6MWc3UEpjRy9qeDdmSCtCRmtLOFZTVVUzZE9wd1RJdDU5?=
 =?utf-8?B?OGF2dzlVd2J0TmtSMmt3SmFVbVh0THhYTEhxcFZ6ZmVlUWd4Mm5YYUo5UVRr?=
 =?utf-8?B?WEhEUlhYaUVDYzRwWHVTTitmcUZZbWN1WmVCL1NoOG8rWnFYekdPZjFsd05m?=
 =?utf-8?B?NXZNS2JVSWd3SXViMG42UHNuTWR5Yjh1SVN6OEwxeGRlbys5aUFsSGN4OHMx?=
 =?utf-8?B?Tkw5QXRhM3dUTUMzVUFGRWZ2YzN5Ny8zZFpablhmTTBiK2hXSzVGUktJazdq?=
 =?utf-8?B?enduQzlUVGMvckpnQmZqaTY5Y2xZbW1PVkFqeUMyc2NubW5VbGNXK3dXaWRr?=
 =?utf-8?B?N1BDdm9tL1hvTEsyS1dFTjdCS2tVMnVYVm9KYTI2QkFnNmpmK0w0ck1YRUFM?=
 =?utf-8?B?MjdaUDJiR2F5T2VVMmlRV1BOejY2ZTA5VVNJR2ZPcURibk5VSlZDRmExQml0?=
 =?utf-8?B?VTlSaUNsTE9ZczJjU3ZmWGE2YlIzOWU4cDhmYWlqQnZtaklUZzREMEVUQ2U2?=
 =?utf-8?B?K1RHVnQwa2dRQzZZblRhT21lSHQ5YWgyYkV2ZC94dGt2RmtYRVZROTRtTkE4?=
 =?utf-8?B?aHlNSmZHM3dvWTRuWlBkM0JZVTVEZG4yU3JteTJTbGJFRFhxWk9RVkxhLy9Y?=
 =?utf-8?B?Y0p3cmdVckRVQmVONndxVWR2cGVZbHJIVE9SbmZDYmZZdVZtRVpEKytWWEY5?=
 =?utf-8?B?dHhZZ0FTNTNYRm8ydGVwRExLUWM2NzM0ZEt0V1drT1llUS9qU2FObHR5VW1E?=
 =?utf-8?B?WEFuV1RIRTc5MDkzZnZFSWh6MEJ6ejBlMk92SENERURDSGlNT2ludTVtUDVL?=
 =?utf-8?B?RWVRbU9pcm1wZVhyZE1CZXJtZlcyLzVDWVB3eGl2U1JCclgrWG9FNkxobDNK?=
 =?utf-8?B?WFI3bHVDRTNZanRrNGRScVFpZkJFMzZGYmp1WkZTR004TWgyUVBJUmFWTjhX?=
 =?utf-8?B?d25WMmo0T2xDSlZROW5IbjVja3BkVFpCTitEc3hWQzNDWDl2VnFEamQwVDdU?=
 =?utf-8?B?eDJEODhKdVE1aDlTWm5OWlk5TUxvODEwSVpLa1VvM09WSnY0WGtPNlQzbDlR?=
 =?utf-8?B?eDBYckhhYW1YeEozdVZOYk02ZHZzMy9LMkpQamZqNVlHZEN5Y0FkUXZaS3pP?=
 =?utf-8?B?NGREZThaY1BobmVVU3d4clRkQmZqclFsenFCS2lxS0lHUktieTRtQ3AvREY2?=
 =?utf-8?B?NE9YTGV1d2F3Z09kNWtPV0dyQTJHa3hNYVZxUW43U09WdVBGRzhDNDNmZFpS?=
 =?utf-8?B?L0NwMUEyNjVVc2Fuem9OWkVJdVBQS3liL1IxdDRrSGx2QTZtSXRsSUhCNWg3?=
 =?utf-8?B?T1dVM1JNVUZVTmQ3YndaM1V4MUVCVndqM2t2a1ZEa3RWUXVrTlFPaDQwZEJX?=
 =?utf-8?B?MVlmaGxRdDJFMUd2d0RwM1hiWWZOSlFmQWdxbDhQUEVEOThPQlZOdTdUWXBz?=
 =?utf-8?B?MnEzaFpmeW1Ca3hwVFBPbGhYR25LUU5ISzZHV2g0WmQvSEVUSUpFUXNtTG8r?=
 =?utf-8?B?WGFlM3lGdllzWUs0NlhaSmFsaXlsVXZOWlJtVHFuMDNZd0NwK2tPYiswYlVJ?=
 =?utf-8?B?bndLdmttaVBOZ2FoUG9XaDJtTVl4eW1wK2dGU3FiVExFNVF4bnhKUEFQb1Jk?=
 =?utf-8?B?RTJrRGFXeFhSZzA4VktpWFpRNTVwa1JwWWNIVzM3enpNenZPY3NETTdqNVlK?=
 =?utf-8?B?SHNUQ2xBYWlsczFZMGh6cWJ1TUdTYVdGMDRXUEh2ZzF6eGJUazRHMkpLY09G?=
 =?utf-8?B?MURVQ2VJNWNXNzBnZllrZFQzSThJbGs3OUQ3WStFeENSN2lxNTA1K09oeldl?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D372179808DF114586CBDEA0805CF7C3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301f3371-d14f-4edf-0813-08dd770ff3c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 02:40:55.4533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oygFvy/m9ovBkGx9vVbf/W7ZCYETB6ulNyRRruDXArwXZLUL+XkZ34zc6MOiIxKLl9d3TbRdaTm373eoSOr7rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8724

T24gVHVlLCAyMDI1LTA0LTA4IGF0IDE1OjU2ICswMjAwLCBKdWxpZW4gU3RlcGhhbiB3cm90ZToN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVu
dC4NCj4gDQo+IA0KPiBMZSBqZXUuIDIwIG1hcnMgMjAyNSDDoCAwMzoxOCwgQ0sgSHUgKOiDoeS/
iuWFiSkgPGNrLmh1QG1lZGlhdGVrLmNvbT4gYSDDqWNyaXQgOg0KPiA+IA0KPiA+IE9uIFdlZCwg
MjAyNS0wMS0yMiBhdCAxNDo1OSArMDEwMCwgSnVsaWVuIFN0ZXBoYW4gd3JvdGU6DQo+ID4gPiBF
eHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0K
PiA+ID4gDQo+ID4gPiANCj4gPiA+IEZyb206IFBoaS1iYW5nIE5ndXllbiA8cG5ndXllbkBiYXls
aWJyZS5jb20+DQo+ID4gPiANCj4gPiA+IFRoaXMgZHJpdmVyIHByb3ZpZGVzIGEgcGF0aCB0byBi
eXBhc3MgdGhlIFNvQyBJU1Agc28gdGhhdCBpbWFnZSBkYXRhDQo+ID4gPiBjb21pbmcgZnJvbSB0
aGUgU0VOSU5GIGNhbiBnbyBkaXJlY3RseSBpbnRvIG1lbW9yeSB3aXRob3V0IGFueSBpbWFnZQ0K
PiA+ID4gcHJvY2Vzc2luZy4gVGhpcyBhbGxvd3MgdGhlIHVzZSBvZiBhbiBleHRlcm5hbCBJU1Au
DQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBoaS1iYW5nIE5ndXllbiA8cG5ndXllbkBi
YXlsaWJyZS5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5
bHZlc3RyZUBiYXlsaWJyZS5jb20+DQo+ID4gPiBbUGF1bCBFbGRlciBmaXggaXJxIGxvY2tpbmdd
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIEVsZGVyIDxwYXVsLmVsZGVyQGlkZWFzb25ib2Fy
ZC5jb20+DQo+ID4gPiBDby1kZXZlbG9wZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQg
UGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+IENvLWRl
dmVsb3BlZC1ieTogSnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNvbT4NCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXlsaWJyZS5jb20+DQo+
ID4gPiAtLS0NCj4gPiANCg0KW3NuaXBdDQoNCj4gPiANCj4gPiA+ICsNCj4gPiA+ICtzdGF0aWMg
dm9pZCBtdGtfY2FtX3ZiMl9idWZfcXVldWUoc3RydWN0IHZiMl9idWZmZXIgKnZiKQ0KPiA+ID4g
K3sNCj4gPiA+ICsgICAgICAgc3RydWN0IG10a19jYW1fZGV2ICpjYW0gPSB2YjJfZ2V0X2Rydl9w
cml2KHZiLT52YjJfcXVldWUpOw0KPiA+ID4gKyAgICAgICBzdHJ1Y3QgbXRrX2NhbV9kZXZfYnVm
ZmVyICpidWYgPSB0b19tdGtfY2FtX2Rldl9idWZmZXIodmIpOw0KPiA+ID4gKyAgICAgICB1bnNp
Z25lZCBsb25nIGZsYWdzOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICAvKiBBZGQgdGhlIGJ1ZmZl
ciBpbnRvIHRoZSB0cmFja2luZyBsaXN0ICovDQo+ID4gPiArICAgICAgIHNwaW5fbG9ja19pcnFz
YXZlKCZjYW0tPmJ1Zl9saXN0X2xvY2ssIGZsYWdzKTsNCj4gPiA+ICsgICAgICAgaWYgKHZiMl9z
dGFydF9zdHJlYW1pbmdfY2FsbGVkKHZiLT52YjJfcXVldWUpICYmIGxpc3RfZW1wdHkoJmNhbS0+
YnVmX2xpc3QpKQ0KPiA+ID4gKyAgICAgICAgICAgICAgIG10a19jYW1zdl91cGRhdGVfYnVmZmVy
c19hZGQoY2FtLCBidWYpOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAgICBsaXN0X2FkZF90YWlsKCZi
dWYtPmxpc3QsICZjYW0tPmJ1Zl9saXN0KTsNCj4gPiA+ICsgICAgICAgc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmY2FtLT5idWZfbGlzdF9sb2NrLCBmbGFncyk7DQo+ID4gPiArICAgICAgIGlmICh2
YjJfc3RhcnRfc3RyZWFtaW5nX2NhbGxlZCh2Yi0+dmIyX3F1ZXVlKSkNCj4gPiA+ICsgICAgICAg
ICAgICAgICBtdGtfY2Ftc3ZfZmJjX2luYyhjYW0pOw0KPiA+IA0KPiA+IEkgdGhpbmsgeW91IHNo
b3VsZCBjYWxsIG10a19jYW1zdl9mYmNfaW5jKCkganVzdCBhZnRlciBtdGtfY2Ftc3ZfdXBkYXRl
X2J1ZmZlcnNfYWRkKCk7DQo+ID4gDQo+IA0KPiBIaSBDSywNCj4gDQo+IElzIHRoZXJlIGFueSBw
YXJ0aWN1bGFyIHJlYXNvbj8gSSBtb3ZlZCBpdCBhdCB0aGUgYm90dG9tLCB0byByZWR1Y2UNCj4g
dGhlIHNwaW5sb2NrIHJlZ2lvbiBhcyB5b3UgcmVxdWVzdGVkIGluIHY3Li4gT1IgbWF5YmUgSSBh
bSBtaXNzaW5nDQo+IHNvbWV0aGluZyA/DQoNCkkgdGhpbmsgSSBqdXN0IHBhcnRpYWxseSByZXZp
ZXcgYmVmb3JlLCBhbmQgdGhpcyBjYXNlIGlzIGEgbGl0dGxlIG1vcmUgY29tcGxpY2F0ZWQuDQpU
byBsZXQgdGhpbmdzIGJlIG1vcmUgc2ltcGxlLA0KSSBzdWdnZXN0IHRvIHJlbW92ZSBtdGtfY2Ft
c3ZfdXBkYXRlX2J1ZmZlcnNfYWRkKCkgYW5kIG10a19jYW1zdl9mYmNfaW5jKCkgaW4gbXRrX2Nh
bV92YjJfYnVmX3F1ZXVlKCksDQphbmQgZG8gbXRrX2NhbXN2X3VwZGF0ZV9idWZmZXJzX2FkZCgp
IGFuZCBtdGtfY2Ftc3ZfZmJjX2luYygpIGluIGlycSBoYW5kbGVyIGFuZCBjYWxsIG10a19jYW1z
dl9mYmNfaW5jKCkganVzdCBhZnRlciBtdGtfY2Ftc3ZfdXBkYXRlX2J1ZmZlcnNfYWRkKCkuDQpT
byB0aGlzIHNwaW5sb2NrIGp1c3QgcHJvdGVjdCBjYW0tPmJ1Zl9saXN0IGFuZCBub3QgcHJvdGVj
dCByZWdpc3RlciB3cml0aW5nLg0KQ2FsbCBtdGtfY2Ftc3ZfdXBkYXRlX2J1ZmZlcnNfYWRkKCkg
aW4gbXRrX2NhbV92YjJfYnVmX3F1ZXVlKCkgaXMgdG9vIGVhcmx5IGJlY2F1c2UgbXRrX2NhbV92
YjJfYnVmX3F1ZXVlKCkgaXMgZXhlY3V0ZWQgd2hlbiBzY2FuIGxpbmUgaXMgaW4gY2VudGVyIG9m
IGEgdmlkZW8uDQpIYXJkd2FyZSBzdGlsbCBuZWVkIHRvIHdhaXQgZm9yIHZibGFuayB0byBzdGFy
dCB3cml0aW5nIGEgZnVsbCB2aWRlbyBkYXRhLg0KU28gY2FsbCBtdGtfY2Ftc3ZfdXBkYXRlX2J1
ZmZlcnNfYWRkKCkgYW5kIG10a19jYW1zdl9mYmNfaW5jKCkgb25seSBpbiBpcnEgaGFuZGxlciB3
b3VsZCBiZSByZWFzb25hYmxlIGFuZCBjb2RlIGZsb3cgd291bGQgYmUgc2ltcGxlLg0KDQpSZWdh
cmRzLA0KQ0sNCg0KPiANCj4gQ2hlZXJzDQo+IEp1bGllbg0KPiANCj4gPiA+ICt9DQo+ID4gPiAr
DQo+ID4gDQoNCg==

