Return-Path: <linux-media+bounces-15596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DB09424A4
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 05:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8042AB23F3E
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 03:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A803918039;
	Wed, 31 Jul 2024 03:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oxlrjhUk";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FhkX/Eg7"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2079717557;
	Wed, 31 Jul 2024 02:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722394803; cv=fail; b=QlqIb49Y5enZ+WKPxk1sjsLMM5HNEX3d5M8SziVKN/Cy4lGe81q9RUo48XycSPQkYVY8hT/YvqjzJC+dYjpPpEeKLVZmEZW6qpvKW+pbeEieirsZVW6CZD54HBPoI0cNAiLRs8gWFOjXHzT8K/KgyYuWez8GKYpLVsTfSdOqz2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722394803; c=relaxed/simple;
	bh=qYI+EaK2/3BnBOv/cLo+YhfVGZrHG++cvhw/kFVP7kU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P5VlI5RMJNQ0t5OA+lh3YQy0P8+8m7YONaQqGyqIgMU1ogUrDO/n6b9xncWsVuZ3kiAlx64MMVH/BHSYCF1CK4qcum2mB5aYo9iBgHBoG1jCYLplPX5nn5TNCzzP6nnB4tAu7BfAUkQOjIoTFHEw32k0ERoaIqFF7yNZY+CBY84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=oxlrjhUk; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=FhkX/Eg7; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f6f07b104ee811efb5b96b43b535fdb4-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=qYI+EaK2/3BnBOv/cLo+YhfVGZrHG++cvhw/kFVP7kU=;
	b=oxlrjhUk/419rBZY/RrgGN31w1DIMfdguZ97Ht4Z3eKrDMViSykqWlbS8dVgNg+W09ONMk9hSCBhKPqMOy0COSGA8jyMaEXyz17LHe+8U4SgFU/QlFS0w6infc57GjmguWsOwWm5YWG4yN+wT0hTmMHvve/7ZYk6eCyyRIX+u/o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:e0ec4e49-c605-4533-a79c-f88f128f034d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:a751ea45-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f6f07b104ee811efb5b96b43b535fdb4-20240731
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1781203313; Wed, 31 Jul 2024 10:59:55 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jul 2024 10:59:54 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jul 2024 10:59:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f39wQCSN7DI5jI/Ik6OYGIrsfi5vn9/RXQIpVavW+acMSKv7rYTKi/slC8IGC18leD5AMZNvFM58hZ4gc5WthtRNtOSYmb3vqSUsz5tUAlpbOISjfBZ26bbO2dlBPr2q57bkF9Y/qJFzpYwi0q/j3kMTrmChOjUZtzhKde0iKIeJHjKJAJHuFejxpNNRnvM6m9ng0ImjkPtoB2Yk8F9xm/TxMWFaGX2nBahPwjnAC6ns37nfrjo4t+cFZCcN1Vn3ddMrvoQioy6y1P//j60SBoXkc+Rdq0yn+xtu9gR0RuU/PRIQlVb3WsPem5qeyFOea3pu35sASh2mHuBv2+g4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYI+EaK2/3BnBOv/cLo+YhfVGZrHG++cvhw/kFVP7kU=;
 b=yitaj9BE+yx9PxuOFscj0dSyJrGpCk1WoUpB8SplWSRJyWE8brFFMs71t8/u8URHFlX6aqXtJPd9ZtP1jSaNHGYtXbnupWUPo/wnZOxIdvwfcNC4qnMFr3LBxzZ/sjMBZUMEVS7P56liJUHQWHjvs78oOnAoBj5mmTmqAiHOFDoJ0kl4gCDgBMC5xyK7MT6drg8xqSuUh9UYu2GBREsl/buA9sLk+AdJfqje4uRuWPZKn+oOIfhGaB3vCfqhDqkOgMJrPZRov7CYlMRa702apYTCgl5mUly9R4M5Vs4iQhVQUPa7fNijkd6fpZ3zMskyslK+sW2WHjE5ki0tjTfsJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYI+EaK2/3BnBOv/cLo+YhfVGZrHG++cvhw/kFVP7kU=;
 b=FhkX/Eg7XiDE+T9EfKqgWryqSw3R1RZ5KMFOBPwcRRn3M4m2D2EZIc2eU4jynUGtiU+rSPN1Z4/rtV4z2kNyN7lN45GR/RnqkMao64mbTu8KrmEJQHP/OHF3hQGc9vAS+IilYFAF6eiixsIs6SmodePlWlkgdxXJs2aNMDonL6A=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7944.apcprd03.prod.outlook.com (2603:1096:400:47d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 02:59:51 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 02:59:51 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"jstephan@baylibre.com" <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Index: AQHa4ce8pNnPk1UzTUirk9/L9Gb6lbIQJ9sA
Date: Wed, 31 Jul 2024 02:59:51 +0000
Message-ID: <6a7467cde347600015078fe7aa25c4b46c45e96d.camel@mediatek.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
	 <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7944:EE_
x-ms-office365-filtering-correlation-id: 6cdde1ef-4963-42f9-d15f-08dcb10cd88c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aVdEOEFwWW9oaHYrRmo2QTVSQkZ6bWRkVzVYQWZ5d0hKU0hLcVhFWnZkcVJw?=
 =?utf-8?B?Y2ZGcXh6NjFzVHlUUVQ1ZXZwZ1MvZTVueWNoNlp1WFVzM3IrUWo2TXdHeDhW?=
 =?utf-8?B?SE5LSU5ueWJKQmVlSFZPUmIxU3c4ajV4c3pZaXBLcVF5a1EvNHZ5NWhBSEJG?=
 =?utf-8?B?cDZRb0Q5ekVxYks3d0lxdHYvY0NseC9neXlJTmhvSEdDME9xWk5aWkM2VVMy?=
 =?utf-8?B?TGwvYld4aVVwMUNTcmZVREF0Sy9YM2tuaUNlS0tPMVRPWTVDdy83ZEVOa2Jz?=
 =?utf-8?B?Qnc1OWRnUW1KQXdmaTJjaXZtYXAwTFkzTlJMWmhHMUw5S3VlcnlXdGFKb21m?=
 =?utf-8?B?WHRFNXlZbjBOTFZLejROZEJ6cWJaMmdXSGhVMzM0S3FtZW9jbHJoLzVzQk85?=
 =?utf-8?B?TS9zYm9FUjg2SGQxcEU1clRZWUd2cmJiSXdVNVNYblZVUU9uQkZ0SFlQN25v?=
 =?utf-8?B?Rlk5aDdQbVhDZUVqREFNUFdBTmNvbXNXZ0VOajQxcWdkTjNpYzVyTVBwMDVk?=
 =?utf-8?B?aUcxcWtqaGxBUWcrUndMOG9EYUt3OW1BaWVFLzAvNzZxR1B3dng3VHdIZGsw?=
 =?utf-8?B?U0s2RGZrNmR1WGJFbFZEcHBxRHloRzViWWY3VEhwb1piWjMvNGRwQXdLcm5r?=
 =?utf-8?B?VjN3ZzZmcHhPTG1aUDArbjdjek5pUzUwbHdZYmRrdjR1QXN0WTlJeVZzVmll?=
 =?utf-8?B?em5ubDJSRFhTYURuMnkvd3BjL1d3QWZ4WElWdEpGOWRhRHNYdzl4cW83NVhB?=
 =?utf-8?B?WjdScUoyZURTZS9UTklib3dlcFpNeS9LWWdwUkxybWpSY1I0c3ZiMGx4Qk91?=
 =?utf-8?B?STNTUVk3N24zZGVNUjFuM2xZa3UvcjYrUmxEcDNMRVk0RjhSbm44VFkycEJM?=
 =?utf-8?B?SVRpQmk2Yzk4UWQ4Vk9FTGtkVjVnR0xjNURLOEs2YmFOd1pZVXQ4ZGNaNEpN?=
 =?utf-8?B?dmp0ZFFmVUxOemtIeGFaYTJMc0JMOTJKNjFmUWtVekhGeFVsaHJsRC93bG9G?=
 =?utf-8?B?NmVienBvNGExb00wdDdqWEJrYnpxQnQ2TG1vcC9MOEFCTUpyOFZ2MGJ6SDhR?=
 =?utf-8?B?T052VmZySFBiNWoyc0tBYVM4c0M5TEhmR1ZDdW0vRERYaDR3YXBZWDA2U3I5?=
 =?utf-8?B?aS9QeUxTMFdLamFBbVJVL1pkQ0sva0VSOWZMVmgvSXlISXpWVXZRRHdOK05m?=
 =?utf-8?B?QmJhRTZHUnJBZDhIYUlBZUl6OC95TFMxTUkvNy95c0RKbnF5OFVNaisvQWQ1?=
 =?utf-8?B?YkJGVGFLODZ6bkxQK3RrTE5FV21aUlhiU2J1c1dVRE1tS2RoS1pnUElKazAw?=
 =?utf-8?B?OW53YjNVNWtKQjBuaWhncEdQMEgrWGJSZmF3UHBuMU53UGZZYlRnOUZ1VmdU?=
 =?utf-8?B?cCtWN0dJWXN1ZTZCblgvMmZHT0cyQzI2b1VlQlplbXpqZmhOSERCYWI3bDVp?=
 =?utf-8?B?MnNZek1QQzFVRWFBK2VxekNabVE0QjcwY240L0wwV3U3SndUM2hRQW5zcUc3?=
 =?utf-8?B?M0QyS0VaVXUwSUpicjV1TnlHeUQ0L2dqSW44enRHTmhkcVVvM1hxN2FyY0Zt?=
 =?utf-8?B?TkxLL214dWlQL3k0UVh6bFJleWJCdVlKdVlWbG8wd2tIWDVNWmsvV21vQStW?=
 =?utf-8?B?Y05ZU0FnbmZXd1Ywb283a0l6Q2QzSmVNOE5MSmdIWkJzMnRZTFhidHZvelM3?=
 =?utf-8?B?ZGJGZjRPakp0TjJQcmI0OGtTUXFTWnBVTnZmNGwvbWFIaXNMQytxMXBIWGFL?=
 =?utf-8?B?ZGdiV0hhcjJsMWcrSDFNNU5nU0d0OUpSZFNyT3UrcU9kazNkRy9qQnRtZ1RP?=
 =?utf-8?B?MGJuRUE5dFhkamhMVEpzbloveTNqUDRMcUk5bHU1OHdCYlcwdkhzWFdHNUxh?=
 =?utf-8?B?RnlqNzl6UkFjWXdPN1dQOUFmanJEMy83dmYwOWdNMG5aRkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWQxTXUxVnp3MTNHeVlWMnl3K1IwWDFSZ0VUUC9tUURJWFEwQlI0OERoUzlC?=
 =?utf-8?B?aDZPaEtUYklUbFkwVWlNd2lGZm1oYlBMdzFXKzlLd25mZ1ptdStvOG91dzhE?=
 =?utf-8?B?cUJDWHJPZUpJRUhaQUk5WmJla3FEVkhzdWs0OHZ3UTdvbkkxaUVrS0JweU1F?=
 =?utf-8?B?Ykwyd0dMRjFNWkdVVmZpYVZHVVBSemhKcXErLzBjSXdYZ2tzNEQ0RzBYdWtx?=
 =?utf-8?B?YzI4YVEvZDd2V1lweEtLaG5UeXlwZVhRSmlRK2drK002T0JJVjV1blA1UldL?=
 =?utf-8?B?ZDdXcEVRV2hFU1RKVXBDK2xRK25WRHA4YWl0T01MK3BaTjBFa3ZNcGx3d3A0?=
 =?utf-8?B?TjlPS2ZDUXpXcHZGejRwS2tGZ0FpYmZqNFdaMUhsay81TWd4ZDRod2lFek5F?=
 =?utf-8?B?TXkyQ2RPREYwZStURjYyUGJKSnBPdTRjdEh4d1RDTituaERLSHBwOC8rMkxJ?=
 =?utf-8?B?OU82aU53U29PUkZSbjFGZ3JvYXkxYm9aRTh0QVAwQmRKUW5jTERwWWZHS0Zp?=
 =?utf-8?B?TVozYWJia1dndjdLbFlKVzhmb1FyeENycEpvdjU2OThMa0ZBbUxJM3o4OFFW?=
 =?utf-8?B?a09pQWRBZ3JydGt3L2owRHRpZ3UxWnhiTGpkNlRaTFFNQTc3endPT2dSWXF0?=
 =?utf-8?B?bGVNSHJrMEROMEVHWGdZY0R3Z1Q2MmRibjh4amVFYWZFWUxaS21EWDNDMkwr?=
 =?utf-8?B?SkNnUEl2YlJsVzBUamExSkVYYTdJZHFwY20zc1NOQ3hLcitMc3dVczZSNUtj?=
 =?utf-8?B?NGNVeHUrMms1VTd6Vi9zU3RXREdNNHliYjhWSHhHSWFadmJIU09iOGVSYnlW?=
 =?utf-8?B?eEo2eUJieUd3dWE4NTNUcUNuQUxTR1c1TTJYVHFUTG9NYnd2M0FxeGdNV0Zh?=
 =?utf-8?B?WnFoMEtTV1FIenpuYXRZbWx0cTV6N0xCTTVmVGtLa085aVIxaUp3ZXNhUm1H?=
 =?utf-8?B?T1ZtdStGcWcvOHR1UG0wY0pXWGlPY1hMWm1EMlNqLzNyZFR2cXVoZXJxdDJp?=
 =?utf-8?B?ZkI3WTJOMGtUY2V4VzE0WWN5QlpqNHY1WHFRN2wzYWQ5YkkvUXRvN1gzZytp?=
 =?utf-8?B?RjFHMmF5MlI4LzZOUVd4dVdRQzR3Zm9CZXF6NDFXNnpLUXpBT2kwWnl4ZjZQ?=
 =?utf-8?B?dklLMW4xL1YyN2FLa0MydElCN0xvb09lc3ArL0R5SU5qNFN3cWxlZVduQnFl?=
 =?utf-8?B?UlZEN29FbEFyeG1OalV0WkZRODQ5NE1mUWF6TE1LdWg1YnZHYlQ0ZmF6bk1x?=
 =?utf-8?B?Q3dOL3FubnAyZ3dyWVRQeFJXTm9ERWRxbW5yRlJ2QWlLRUFoMEpJWUhUU3JQ?=
 =?utf-8?B?RVpoZjRRU3BVMnkrMzhlU2YwdGNTVFp0Y1k5SytzOXZyOWgxdDEzN2hQcDRC?=
 =?utf-8?B?U2FOd2FRTlliOGhxeU14MHFxeFRTa2hqdWY4VE42Qkd2SzlGeHRYaGNUUTBH?=
 =?utf-8?B?Q01rNklscEJYc2NYUExVbXJabStGWktLTmJPWFRFemZKM2x3REFWMHh2YmdR?=
 =?utf-8?B?dWFNQmU4b0ZrQjRMQ1p0Tis5RHNlc2lzQ25ER3BXZDUzSStkTVlvVjlWaEVO?=
 =?utf-8?B?TkhxVmU3anlLNEZkQmFoaC9kZkdYWlkrSHBEMXo3TmhmRkVVVjVMQVprcEJZ?=
 =?utf-8?B?TGljR0NKTEg4anZwd2Z6QllQbGpjbHhiSldWVTBxZkJzdjIzeTM5L2pKbGVM?=
 =?utf-8?B?Y1lkcjFvN2cyMy8rdFpqVlk5Ty9ZZDB3d3lXMEVkQmxzckdScVQ5ck5oeUR0?=
 =?utf-8?B?MTVyRk9IYXVsQUc1Wk50blJhRkNFOVJtUDA2QWZRcUxZSWpzZWd5MFQ4K0hR?=
 =?utf-8?B?d1Bnd0dsZmxETmJ0SUt5b3NJQnJ1VitRUGhEZjR6MTFnQnBHZU1GOWxxQVNh?=
 =?utf-8?B?UnhrZXBjaklSNE9saDJ4VHNBWUVTTmorTkJ0Y3hDRmZnS0ZSR2xSRHJTQWVP?=
 =?utf-8?B?dU02K2ZWL1FURHFrY1QvVXZ5Y1c2Ty91bmk1MXJQWURrcG55MUZpUzRobW1R?=
 =?utf-8?B?ZlJIdXA2TDd3S3JrS2RreWRrSTV2bnlDV2I4VzlkbjZLWTY2UGVOd1FFdHFK?=
 =?utf-8?B?NU9wMm5zRVJFM2tQandpN1NGSHBSK3hySXVQbWFxRzFldi81dDhrc2JCaGdw?=
 =?utf-8?Q?jO3OF4Z6TGfrO673WW9W7RkO2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44717E0FBEABB742BDB5DF101D63081F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdde1ef-4963-42f9-d15f-08dcb10cd88c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 02:59:51.0470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +5S8pek2BTFV+9crfIKVp0oHmBwOmpSNF7pJa6n6oqI1FzZHWY+RhVdetvtpqiYEDQd682X3AZcnGWHj2jrXKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7944
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--19.678100-8.000000
X-TMASE-MatchedRID: 9zTThWtzImv4OiVTWoD8RCa1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCkttpN+KVVd9syNb+yeIRAq19kcMOF8gV9nH6NX3JoGqItL
	8M7QRoxdWYmumQvMouQ81SqsdNAtCLZbtj42l31EjRwcsjqWGAkDwlkRNC6PC3flwJkfHHUCjxY
	yRBa/qJRVHsNBZf9aRAYt5KiTiutkLbigRnpKlKT4yqD4LKu3A
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--19.678100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	621671C088EEF15CE1F8667B8B4391A275E3E032B9A2134B6D5BDA105964D6BC2000:8

SGksIEp1bGllbjoNCg0KT24gTW9uLCAyMDI0LTA3LTI5IGF0IDE2OjQ4ICswMjAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
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
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArDQo+ICtzdGF0aWMgdm9pZCBtdGtfY2Ft
X2Ntb3NfdmZfZW5hYmxlKHN0cnVjdCBtdGtfY2FtX2RldiAqY2FtX2RldiwNCj4gKyAgIGJvb2wg
ZW5hYmxlLCBib29sIHBha19lbikNCj4gK3sNCj4gK3N0cnVjdCBkZXZpY2UgKmRldiA9IGNhbV9k
ZXYtPmRldjsNCj4gKw0KPiAraWYgKHBtX3J1bnRpbWVfZ2V0X3N5bmMoZGV2KSA8IDApIHsNCj4g
K2Rldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGdldCBwbV9ydW50aW1lXG4iKTsNCj4gK2dvdG8gb3V0
Ow0KPiArfQ0KPiArDQo+ICtpZiAoZW5hYmxlKQ0KPiArY2FtX2Rldi0+aHdfZnVuY3Rpb25zLT5t
dGtfY2FtX2Ntb3NfdmZfaHdfZW5hYmxlKGNhbV9kZXYpOw0KDQpEaXJlY3RseSBjYWxsIG10a19j
YW1zdjMwX2Ntb3NfdmZfaHdfZW5hYmxlKCkuDQoNCj4gK2Vsc2UNCj4gK2NhbV9kZXYtPmh3X2Z1
bmN0aW9ucy0+bXRrX2NhbV9jbW9zX3ZmX2h3X2Rpc2FibGUoY2FtX2Rldik7DQoNCkRpcmVjdGx5
IGNhbGwgbXRrX2NhbXN2MzBfY21vc192Zl9od19kaXNhYmxlKCkuDQoNClJlZ2FyZHMsDQpDSw0K
DQo+ICsNCj4gK291dDoNCj4gK3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGRldik7DQo+ICt9
DQo+ICsNCg==

