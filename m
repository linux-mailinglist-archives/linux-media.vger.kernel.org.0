Return-Path: <linux-media+bounces-21782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8414E9D5A75
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 08:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45228282438
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 07:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E810617C992;
	Fri, 22 Nov 2024 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="S9/2o/MB";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="en107fhd"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A9B166F26;
	Fri, 22 Nov 2024 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732262085; cv=fail; b=RqsRvr3YoYbQIgHsBiWY9gSSIM5+7EbfDGDr4YNmcfNkBdr7i/x1CS/d41OVRCgpZPjArkdoy6dihIiQ9RUJf1ArMMSz8vjjA/qoixGx42moiAl2ZAC8EKztevrsCQ3FZx8Jy+FovsyDkZPKPId9ugwefWJHrao0Z3lS9/W8NFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732262085; c=relaxed/simple;
	bh=RVFr5n71kkqVOBVBNFFc1P8wB2WTO9AUAZlgp3Gaxrg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qr5T71krAP+gQD2k2MPOE4/9Y0nP7XyizSRiVZ9jIkTmlbySTv3Vt6WQXinQVdG9Wa3/nihAQbjq6g4ecBNgGKHEOZ+yeIPo7zm5+FS6mz+R9crwWlluOuSLSc8NhFwlKfiu9t7N2ArZA54pzIIWWoLYHukpP4UhpPMVFG9aJVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=S9/2o/MB; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=en107fhd; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 057d0df2a8a711efbd192953cf12861f-20241122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=RVFr5n71kkqVOBVBNFFc1P8wB2WTO9AUAZlgp3Gaxrg=;
	b=S9/2o/MBK8PehDtgszoOEbXbL02IUjVLjPlaSvZXj99Ba3pxZ65XcpykxR+MQsqLwXykU3/Jm2H3CshkVlMhN/2nmZHgwmM8fII38mv1jzirsaekJOKSMGwhCgNKLd15MLucxqqylr6am8H9F/i51nqZGeou9gNz/1Lea+KMsX4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:d27c9426-80e0-4fd3-a965-3148cf684d23,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:a613e9fe-58af-4a77-b036-41f515d81476,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 057d0df2a8a711efbd192953cf12861f-20241122
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 773016270; Fri, 22 Nov 2024 15:54:37 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Nov 2024 15:54:35 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Nov 2024 15:54:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f480htBOIWgOQXAeHdnmVxL40p0vdis46v2kPRgkHZwC2S/L5fxww5xAJzn3UA6DiX7PQncANJ0CoM/cQ/FqO0Mq+j+fyzEutsYiBclloHresAMNaOyhoQiDhpZIUCoxcbc0H+UM3pomE5mTWnBX2Fv7/VLPSvyThcVhoFt2VV1W4JZTiqbYamk7YyPWkDaGGvRVwWa6Y3XOjwhYxYMQq61DdJFxIIfuG5TNAuboCZ2F4XZMj2KSfKfLsi3HoXnzurTWoqy1IuOKRD6Ip0ce3gL2rcHXeuh6SjCTvG4BGfauaMBMLMbu3dWa8DqKIFd61Yi/l4yErihUtPtgWjqYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVFr5n71kkqVOBVBNFFc1P8wB2WTO9AUAZlgp3Gaxrg=;
 b=kTl1f6VPPqNBNB04KfaNhzgCjFWcGrPKsC/kH+MHXIC3ipYJW/CrkGnS8cUFvT36LUxDObEffS0g4mbYYt2LAftefRiS56cLGlq1gW2eYGUmUtIgk6MbsXVTy7wa22cslPxY/mULutFIGV1vHqo0ecDS43O0fnKPaZ6xfhuKa6nIS+6VaUZNY0Cec1CmwtKsFytvNRfEjEgJlrKwLBwLG13Zpm8XxeOOsA/PsDRl3tiR6PWV6SvzgpQgC5P+g3jA2guP5wnCR+Nb9futUZX2XGYMLzqmgHgVzeKPj1pDmsf6xaIri3rBiwxX+t3WhqSVCm3Q3fgsY1zHmnczz5ag4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVFr5n71kkqVOBVBNFFc1P8wB2WTO9AUAZlgp3Gaxrg=;
 b=en107fhdxwoH5j/m/FVhXDA9Oi43t3kBV39CoF3xC88yybWEkwJqyNHe+wbBs9aTMl0TaliJhl5a+XjYngXQPKenuOdq8mmoBGiw56gjgaaANXidDf+qrJfxVL9iqhUGEFJsRVbFdxk94RDA4M2AVdnIWsL3nEQF1uqXXHWK3KA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7836.apcprd03.prod.outlook.com (2603:1096:990:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 07:54:32 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 07:54:31 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	Julien Stephan <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v7 4/5] media: platform: mediatek: isp: add mediatek
 ISP3.0 camsv
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLC75+A
Date: Fri, 22 Nov 2024 07:54:31 +0000
Message-ID: <85ab1984c04b1eddbea71006ab5d95cb4333d838.camel@mediatek.com>
References: <20241121-add-mtk-isp-3-0-support-v7-0-b04dc9610619@baylibre.com>
	 <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
In-Reply-To: <20241121-add-mtk-isp-3-0-support-v7-4-b04dc9610619@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7836:EE_
x-ms-office365-filtering-correlation-id: a42762eb-9304-41f0-ca0a-08dd0acae642
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dTVkL2ZEMUljUW84VC9IMytMbmdENnZnWWpORGMxbXV3akZodFNGcE1MY281?=
 =?utf-8?B?bzNZN0FnK3NTQmc2S2VqL3FmZzhqcVpQVXhhNndVeFpvT3cxK3NhQWcrc0tn?=
 =?utf-8?B?bTBwbklDN2dzRlhmMHlBdUMzclRML0pSN1U1MHM1UGJjT0lVUHBxdUZmWkU3?=
 =?utf-8?B?WU1MQS9lT1kxdEJwbXNQcFZLTHRZQXFjUkZkSHlPKzFGZzVRY1hwSXVLb05p?=
 =?utf-8?B?OFcrcG5CMHBPbmhkMnNWZnM1UHUzUStWWFJQYU0vNkUyK2FWdkF1djJxcExC?=
 =?utf-8?B?VFA1TUVRejU1R2U4cGh6UmdhZ3dXUGNETFp0RExDSjQvU2VSZmh5S1dTRGJV?=
 =?utf-8?B?eFhkQUp1SU9OdStmODVvaE8ybG9ucHk0UGtqQmdzeDJrMmlaUExPS3dxMjUw?=
 =?utf-8?B?amxqbm12OTMvbi9wVS9xdmdIWVlzU09xUnRBMDMzT1cwdVFMMGxEVnpuRTIx?=
 =?utf-8?B?N3dKZnBYaHoyYUhXci92Sk5Ybkg1U0pGaEtMeXBGT0FhZ2JDTzRCZTc4SmtK?=
 =?utf-8?B?YnhPWWtmU3ljVUoyc0JmODBGM2s1dXRDRXFJV1VyNENuQnVDUGhoTmJTU2pD?=
 =?utf-8?B?NDRqNE91K0hkYjh2WW5JTFljd1pDV1UvOVJKVENhdXBwdFVaaWRnRE8wd3Ew?=
 =?utf-8?B?L1IrU294M3FHMHhRVUJlUzJQS0hUY3dIY3JDclZLQzJWR2h6QUNlU1gwTTJh?=
 =?utf-8?B?c2FLc2FnN0ZES1phb0orN04zajNuN1NBTDViZVVCMzRSdDNBK3JCYWZtZzlw?=
 =?utf-8?B?M3FQQVMySFpFV2diRWxmaGlGb1QxelJ2b2JxZjNIWHBHQVRHekdoRWJaMGI4?=
 =?utf-8?B?UDBnZWR1cHMvUzZaR3JrQmRJWmk4NHA5eGRzRm5IQ1ZsRHl2aXZhdGgzQjFM?=
 =?utf-8?B?cXNET0h5YWYzdEtBVWYzM0FEYVl6S3YxdXdhYnoxRTJiUEF3c1poc2ZmVTI1?=
 =?utf-8?B?Z0ltT3YxOG00ekhZNlV2SXduZDBISmh1ajVXNEozelVnN3YrWWNSdk5hOUM5?=
 =?utf-8?B?bENZMGlkQnJIQ3RBdU1xN1VpVmNsNmUwemZhMXNDYU1Kb29zbk41U3lCTTRP?=
 =?utf-8?B?Ky9nZ0VuR0RNUSt6TjlhTkx0dEp6NlVZNmo0ZGJCanBTNVpRSHJTMDlQblU1?=
 =?utf-8?B?bk9LKzhpSnhnOGNnSG9oaVNUTGl3REpFOXR2K08vVG01VDBPaDhKTmRiT284?=
 =?utf-8?B?SVBzdUhYa3hIVVZ3Qk16Q3JUcDRTZWF3YVZsZ2RTK3A0cG1LNTFmc2c4d1Q4?=
 =?utf-8?B?R1ZmVjYrVzQrZEtIVm05c0dGSFNZVDJlY3ovbytOZSttK1Y0N2NyU2F6TU9G?=
 =?utf-8?B?Q2pyd2JId3V1M0NkZ2xNRzliMmd2UUtqYkxod3Y0LzE0YXpQZDRsa0ZUSzMy?=
 =?utf-8?B?UlVkQ25HNXJSK1hacTZ3UnZrMit4K24vZDM3bzNLRTRoZ2xGYjJlbnNEbW9W?=
 =?utf-8?B?VnFXaXFQd3NER1V4ZDhrS05pZWNJS0RDc01qY0pmajVUY1dLUEwwNXF1K2ZX?=
 =?utf-8?B?a2U0N09LaGp5dXhqS2hheWpOUDVtVGlUZHVKUEFUNVhpYlRnZVlmcVdZN0N5?=
 =?utf-8?B?OEVzSkN1Qm5tNTd6UWlGQUJKbSt5RGwxNVJ3OWZ2UjZnazFLbkRicXpIWjZN?=
 =?utf-8?B?cTNHNGk1UTh4eGhKaVQwRExpWmdiMTQ0RlRsL2Q0cU8xa0VTVUR5TEtTVG9n?=
 =?utf-8?B?aHV1cDEvWTJwa3JSWmw0SFkyT0N5UDdBZkEyNEVPaW5BSGVENVVCVStKejJG?=
 =?utf-8?B?aDN4UjJHcUtnWVR1bktRTHRmL0RWOHZQVG1iL0NCQ1MzYXMxSUhaa0NPN3No?=
 =?utf-8?Q?3Ug9HqbZoe8wLyOI9JE0aFMq73cG3TBbHc1ZE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlpuYkxsb1JFcmh6UnlIWjNPay9tc00zNW1TYlpjZVp5TEJvTTYzdjVrVnp0?=
 =?utf-8?B?dkVIc09Jc3QyMkc3NnpQQksweDlOa1YxaWlLY1NPYStRRVRSdGVRWXcraEdU?=
 =?utf-8?B?QSswck05UElrKzBRdFhmSFlQQTJmWGVCZnhyMUk5Um82Wnhuemk3Q21vTHQy?=
 =?utf-8?B?YUs1RkVLa0l4SzBtNHdjTkVXekhZVXNQa1NEMEpCaEVWU3lpY0tsMjU5TlRi?=
 =?utf-8?B?TGhnZ3I3cUMxaDdwazhncGx6WW1UeVBCREphSWNLbXJ3UmNycjlSRnoyd3Nx?=
 =?utf-8?B?aGlITlNKek8rZnR1Nkg2NlNZTFlEbGYzcTNYUVpsYVFlKzhXdWZpSkcvTk5S?=
 =?utf-8?B?WDRoMENYRDBvbDlLcDEvM3l6aWtRNUVveG9UN1BtTmZEazVlS3Q4bFArYXlN?=
 =?utf-8?B?MnZBeDlPZGpERWwzNFE2SStyUVFpTC90VEMyMExyTnljSVhhZzUzWUhkQjAr?=
 =?utf-8?B?ZVFuNFJ3NjFqK2xrczVpR3ZoNkFSVTdCZWRvSnVEZ1pPVmJyYmJBS1BtS3E4?=
 =?utf-8?B?SCtOQ3F2dExNM09zSFd1bk04YkJnLzBmdlFqYWFVa1dsTDBvRGZXTjZHY0JX?=
 =?utf-8?B?bXhCSWhNWVo3a3ErY3BMaFUxU3Vzd2RtQ2ZBRXBDZHBleWFpL2JnR3JKWjlq?=
 =?utf-8?B?T2dYTU1zZWtEbHAybFI3NE5LT0xTMzQxS2ZScjNRejRIZGlSMkpRejRGamZy?=
 =?utf-8?B?ejg1R0ZMM1dqWmY0YWFlTnV5TEZkdVBYMW1KSDlOL2RHNE1JQnR4WFF2SHVR?=
 =?utf-8?B?NGZOOU9wK0pMRE83bUg0d01OZU1ONWVaNWsrZWxwQ3JrS2ZZSjhvWm41Sm54?=
 =?utf-8?B?NVhWb0gva0YwNlVJWDhYa0MzRjBkaDMwWncxR2lQSHV6eWoyZElkdTJYUUUz?=
 =?utf-8?B?WmN4YWF3LzYybUtsWTlEc3ZZMzhvVVFQM0RRTS9QYUg0bUtMUlNEcE9WSXVE?=
 =?utf-8?B?Rk1uY2ordk1UY3U3aXB5elFmYzh4Q0xYRlQ1Tlh1OXZIb00rbnpyWVF5bERW?=
 =?utf-8?B?WW5SU0xnajFiVURKdXJ2WkhhajJqUWFFRVliWGNXMDVCOU55clNNMFdhRlA0?=
 =?utf-8?B?RStldjBBRm9nR1BrOWt2QjBFZEZDYmVjbHI2UHdkMElOV25iNm9LYldIODJN?=
 =?utf-8?B?M3pwQkxvTXUxTjc4WkllOXUvTUhIcnZpT0NYU0lBNzhmeXdLWE1xb3NESCth?=
 =?utf-8?B?bGIwVHZFbUNreENSOHZRWVVlL09YZWNsMjNnVXNXdUVGUm55U1lvTTZ5bjZB?=
 =?utf-8?B?d2pTWm9vV09FaTIveFQvK04wdm41aUY2OFoxQy9ubTBLcWxGSHlpcnpBWFow?=
 =?utf-8?B?MGR4NlQ5RCtsdmZlb2Q4LzNJQ3ltZ0YvWXFBU3VLVnlqZW5vQ01MWE1oeGRT?=
 =?utf-8?B?RXdUYkJZRG9nN2RaNGlaSEt0aFd2azNDdktJdVoxOXdpbnY5c3RoWDk2ZE9T?=
 =?utf-8?B?Y0N0T0dmVldSZTFjZzdJUlRmc1JqVjJrcVN5cURBeFhzd3dtRktDdGt5MHFW?=
 =?utf-8?B?Y2UzQTJYZExxKytnMlhCWmk3ODV3WjZvMUVVU09BVjlxWng1WnN6MjVwYXVK?=
 =?utf-8?B?cFZXazRJOFVlQ01MZXBERllMakNRZmU1U3VXVnI4eFVoTWFEc2xvWlptTS9X?=
 =?utf-8?B?Q09zQ0FpdmF5N01aUG4yWlBpZ3pWTS9pdGd2NUhYVmF0czN5c1FxYXZRc28x?=
 =?utf-8?B?Y0NrRThIQnVHdlNJcGU2M0o3RGRidEgxM0wxdTNDWi9SKzFxRklhbllWTXFE?=
 =?utf-8?B?b3l4MFZHVzVyYzNtRjQ5bTVRbEx6eS9rdzlDeDBkR20zeTNYTDc0N21BZ2s3?=
 =?utf-8?B?aUl5ZVlPWU1EaURHMjFTRmU5Z1ZzNDVtRU02b2F5SUVUQXJrcFAxRWxmd2hC?=
 =?utf-8?B?RTVYM2lHREFUVktjcm9LdVY4MExwa3A1TDZKVWsxTzVzMDlMcVl5dDZDc2hT?=
 =?utf-8?B?dFNoMkpDK3NDRElVcDBNbjFEYWtJajVtdy93bVNkQjB6TDdINDVlZmRGell1?=
 =?utf-8?B?b1ZXeVVJRDlla3c2QjU1RGpyRXFRaHpqUC9qS3hXcjkrTFpseVdLcnVLV0Fv?=
 =?utf-8?B?dEorbklsU0RmeWpKdlQzUWdkeStFazVJMjNtZllKWURRbEpkMHlzOHkvK3dx?=
 =?utf-8?Q?Ovx95fcnKkX7faVGCk8F7UwGM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3399683DDEE0754C9EB3C999A3956770@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a42762eb-9304-41f0-ca0a-08dd0acae642
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 07:54:31.8700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dneUEidF5OPamHcHbOTfpdyyeoz0lOlgy8nLKM05P4bJJlvT9yKl7voAFZmKZdCMdL07P1pYjOmRCR8NRhmUOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7836
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.126100-8.000000
X-TMASE-MatchedRID: csPTYAMX1+EOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0r/XD0CNJ3fxO4dcT3ZaTocyYHhs0mgDoxyETzgIO4sasaQTVtPXXNM8ha
	W4U9IrFp8dbyXEG2mDzs8CxsG6+jdcfRJq1ctTfwZXJLztZviXNK/6grv3GOdRi9INZ1ZpGGWrH
	wPGP0QhU/vIztt9VZYkZOl7WKIImrS77Co4bNJXVZ0V5tYhzdWxEHRux+uk8h+ICquNi0WJFoln
	X/I34HajDFAypx8ZDEtuuCf2bnlOa0dHmNEMdP9ftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.126100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	ABD39B52578E47730DC075DB7589778568E9ABFB150DEE10F4F3B776A06DE7E02000:8

SGksIEp1bGllbjoNCg0KT24gVGh1LCAyMDI0LTExLTIxIGF0IDA5OjUzICswMTAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
ZW5AYmF5bGlicmUuY29tPg0KPiANCj4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5
cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gY29taW5nIGZyb20gdGhlIFNF
TklORiBjYW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91dCBhbnkgaW1hZ2UNCj4gcHJv
Y2Vzc2luZy4gVGhpcyBhbGxvd3MgdGhlIHVzZSBvZiBhbiBleHRlcm5hbCBJU1AuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+
DQo+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBF
bGRlciA8cGF1bC5lbGRlckBpZGVhc29uYm9hcmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIHZvaWQgbXRrX2NhbV9jbW9z
X3ZmX2VuYWJsZShzdHJ1Y3QgbXRrX2NhbV9kZXYgKmNhbV9kZXYsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYm9vbCBlbmFibGUsIGJvb2wgcGFrX2VuKQ0KPiArew0KPiAr
ICAgICAgIGlmIChlbmFibGUpDQo+ICsgICAgICAgICAgICAgICBjYW1fZGV2LT5od19mdW5jdGlv
bnMtPm10a19jYW1fY21vc192Zl9od19lbmFibGUoY2FtX2Rldik7DQoNCkRpcmVjdGx5IGNhbGwg
bXRrX2NhbXN2MzBfY21vc192Zl9od19lbmFibGUoKS4NClRoaXMgaGFzIGRpc2N1c3NlZCBpbiBw
cmV2aW91cyB2ZXJzaW9uIFsxXS4NCg0KWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0MDcyOS1hZGQtbXRrLWlzcC0zLTAtc3Vw
cG9ydC12Ni00LWMzNzRjOWUwYzY3MkBiYXlsaWJyZS5jb20vIzI1OTY2MzI3DQoNClJlZ2FyZHMs
DQpDSw0KDQo+ICsgICAgICAgZWxzZQ0KPiArICAgICAgICAgICAgICAgY2FtX2Rldi0+aHdfZnVu
Y3Rpb25zLT5tdGtfY2FtX2Ntb3NfdmZfaHdfZGlzYWJsZShjYW1fZGV2KTsNCj4gK30NCj4gKw0K
DQo+IA0K

