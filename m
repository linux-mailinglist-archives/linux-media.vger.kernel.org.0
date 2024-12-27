Return-Path: <linux-media+bounces-24105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E739FCFD2
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 04:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25377163A01
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 03:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2A3433D1;
	Fri, 27 Dec 2024 03:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NthmoklK";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="cOByqIeK"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108CC8821;
	Fri, 27 Dec 2024 03:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735269807; cv=fail; b=KNSS1Ao9RmpKLDfEQ1o+lTE87pdBn9cch5+XzAJpSfDjnP7wg7JurxKNFcSQc+HtveaQsdw+n3I1cfPHZl9mlA3aFF61+CDYgGucyZLL5LCST2kGj16Z9aPt5jY4kBhfalMjgcrAA7tnjSaFoTL2y9lIuBpMcjpcdducyHczFjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735269807; c=relaxed/simple;
	bh=L41Mz45tcd1ydjJ/de9UJovEHGcvYAqe0n3KL00klRk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jYM48QPgzuxfEfRAG53aVEcqPfejYg9pge2CBt0NV7dcqaKS/hrdw4yxox/yBz/uLGyC9shjnyxZpc2E0rXhOfQinaMTvJrlmXJgU5LhZbLs4rlCtZCS+Ap5Glp0Sgq7noirUmSXJT9AlxjPi/W8Vt/Li4FlJag+4AFuM699l1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NthmoklK; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=cOByqIeK; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ebe7a3a4c40111ef99858b75a2457dd9-20241227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=L41Mz45tcd1ydjJ/de9UJovEHGcvYAqe0n3KL00klRk=;
	b=NthmoklK4MF19QbUDluREbuHK5btxuc6xlbMV+W+/kvgo7A9iikMB+hobVQ5PytIlSaWSZ7qA7by8Ik3sV2w2Slg5MJS1pqRjRF/LPq87WSnniEQx5XEUbh7IsSNiwRuh1kwK/Oe3Fgt6FabH+jG2Yvf1Uj643gB/kJbfQ6wfes=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:c5885b6b-c5e2-44c8-ab26-b6fc1bb499d1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:44f9f636-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ebe7a3a4c40111ef99858b75a2457dd9-20241227
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2107874277; Fri, 27 Dec 2024 11:23:20 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Dec 2024 11:23:19 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Dec 2024 11:23:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIhH9Y9txytw5xmeir7AqkXI+0tc8869mz3Pcyuz7V2R7Ypex6tpjVUYQee1LswEYHulWrapzGb9JSeAlzb4bmzMtwssfCKS+P9DDEbbq98DDs2xtOIRPnXlV1HaeP/Q+BdCsHCKJrzSlh9DojglVigE9pxo25CnGhjzBVZYtTYLLWXM2qRcQlRdkqOKnpwniRXzs+RkYM7A/p2+3jx8n8pEvGXT7jDOstqfMf6e7Pu9xbNDimrBuhrmAWRj7Yt/+/CfOpS/Jx99ChTDYTNyzE7SMuEDbLmo2SP1QFHHLDkR+18BSXvjqr5HPI/M1g8JNqQPFF6NKQM4wIuXFz9DYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L41Mz45tcd1ydjJ/de9UJovEHGcvYAqe0n3KL00klRk=;
 b=mwcBWZ3rokaclSK5VG5jh0nokBhF1UV20tBS+Be5QSNIZITRryllolOIIVB8leUyCmRV96b6RJDtI/QAGT37exaJGE/HIuVbeyK5GBZRgNxT2ZfMYgcjVtiOQdgPlCVML5Tm8xaiZMK6Uz2ClILLIxti2BBfUfxQZUv6mhAjq5UGNidSdpt0ZU3pz1a47+0Eww67B4Hy8eIwFoywuqtDIHrH9icJQznO9p/vG96/VKsr7yydB5QeULAM5S03Myzc5LMMdN5HuBOK4+l+uE6QJTi7HXal1SGklSXlTghnN6RLFyR0t4dxwztK8RHk6/M6BO3/LUuAoDg5fNu+wwMBYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L41Mz45tcd1ydjJ/de9UJovEHGcvYAqe0n3KL00klRk=;
 b=cOByqIeKit9eXPG8gKurrcizmwbhbcrnzdNeS1TBDztkNy1w7JunJugoIrvRKrlAp/PBipG7y7+ampsxxej8wDmPTRNf3v7XTc+RRUxm9yDfzr6DZLNh+h3fqiITZHeeLbSmyt4wvgUl5zS0PbFHxKJjPH6tq5laCkxsdvXBffw=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by TYSPR03MB7738.apcprd03.prod.outlook.com (2603:1096:400:414::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Fri, 27 Dec
 2024 03:23:16 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%5]) with mapi id 15.20.8272.013; Fri, 27 Dec 2024
 03:23:16 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?Qm8gS29uZyAo5a2U5rOiKQ==?= <Bo.Kong@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Topic: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Index: AQHbVqv2E/LiiDV3F0q0O1OD05OMm7L5b/yA
Date: Fri, 27 Dec 2024 03:23:16 +0000
Message-ID: <198d50d7b2f5fe30f663b08a197be4b6299fc7d5.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-4-bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-4-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|TYSPR03MB7738:EE_
x-ms-office365-filtering-correlation-id: a2e061f4-4d33-4e59-34db-08dd2625cdec
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S0g5UVQyU0RWZ3ppbEg3SU9yMHk4ZWFpV1FFRmYyQU8ydDNZSGFzQ1RxUENK?=
 =?utf-8?B?a2h5dlRaR25pOGh2d3I0bXlMbUpaaHlGazVPU3FpZ3V1NW52L095cWJHaDBt?=
 =?utf-8?B?NWpSdVI3LzNqYUFlcDY2dDZLYk14cHlHZHNXM1RDaTJ4OXdDL3g5K3lwRDRz?=
 =?utf-8?B?RmUvR3FBS2ZncEtnWU4vR1ZDUFArdWxtZENNbmppanJKNFU2Y1VRSjZTZTJE?=
 =?utf-8?B?UTdEcEpCdFJoL3Q5dWY0OHVUMWFvZmZLZGI3cXZWdUVYRGx1SzlVYzdBcXhV?=
 =?utf-8?B?UzdRR3dvdWNENGNaQ3Z3U08vQlBqbmkxaTZWL2NTa2Q1ek1iRE10RHArY3Vp?=
 =?utf-8?B?SWVwWXczRTRVQm91VHZXbnFkT1ZhMzJrNnE0OEF3Si9qcnhtQlBaV3JObEdi?=
 =?utf-8?B?dkNRZUJnemhZL3dtcXRHY3ZRaUJ6WkoxaVZOY0s3WnZ3V282TkI3YTlVNS9y?=
 =?utf-8?B?R2grN2JjejJkNllueGx1bFFFUXI2OS9vR0x6aWMvNU9Xa2hJUDZiNkJMWXdr?=
 =?utf-8?B?TkFqVkIrY1dEdnFsemhvdFdCaGxGc3FMbEVhUXVRVExleGdqb0MxK0haV1dk?=
 =?utf-8?B?elVtSDVsK2I0NXF2cm5oYlo2c2ZORW14TTBYVXVERjhtZG9yLzJINGJuWXE1?=
 =?utf-8?B?WTlxUzlLVkU5SzYxQkQzSUVsUDkreGZnVUJqUXlJM05SeVpzWkw4ZWV4Qm9I?=
 =?utf-8?B?UncyYjc3R0YzcmNZV0pNaU90bk9Vc3J3b2NsUE4raU5wRlJFSVRwK0xReUJP?=
 =?utf-8?B?RHJQVXlsYWNvazhUOXArVU5JWFVXbVdZZkZzZnJXQWlFQlNtMi9tTjFEMml0?=
 =?utf-8?B?emZQSUtRRTdiQ09hbGF2TFVNVFBBMTJPQUtXNkdLd2dQV2dtQm13ZlpMNGhG?=
 =?utf-8?B?L1N5d3JrSmI4K2MzaFNHWWM2M0J4WEM1UVpyYkUyOEYyL1g1dFlaS0oxekpF?=
 =?utf-8?B?UzQrN01vbHV4dUMzcmhvZU0rOXRsZ3cySDNsc2x1TVdZZ2F2aW1YQmdPYXQz?=
 =?utf-8?B?RlpDeFBYMUdiVWs4dXVsQ1YvbUJaOGpjYlo5TUhRUjFZc3pwK2FqTnZHLy82?=
 =?utf-8?B?dEo3bkVNUWhLYldWVUxqS2FxVWcveXlzZWMwaEZBaW0rY3czeENqMU5LTnM5?=
 =?utf-8?B?NGxGSm5jbnB0aFVHcHVlekQ1YWdRMnlKN2cyRklzaTgyWGIyb2JSYWFObHV5?=
 =?utf-8?B?RnhrQ3ZGL3F6czJOZkFBa2dEQzMvUGUranhFdFh5Y1VVTVVlZkdUQTZ3Q0pR?=
 =?utf-8?B?Z1MzNk5MVEVBNzVNVjF6WkJvWTNYVG1CSlJzQjQxS3ZHeTR6Q0I4cjVuMTlE?=
 =?utf-8?B?d2cvaGRRcjNEU2VlWi9rMXB0K1RYVWlLamdMOWd4K21CZlVxZUtMQ0Y2UVY5?=
 =?utf-8?B?Mm9UTUhodTdBTW80Q21CcWx0bk1KRExoWTFDbGFzRXVxUEk1bXMvcStuWWVz?=
 =?utf-8?B?ZWpUa1JlYWorM256MVpwRTVCSTdqOXMrMlV3WE1SdWQvRWNmRGp4d05rNnNl?=
 =?utf-8?B?bWRxeUhGUWxOOXVTYmVETG5pb2tGbURPL2IycHdyYWduRDJzVmFvU0Ryellv?=
 =?utf-8?B?bmp0Y2F1SDJvbmgvVmxrVkY0MXAvQ3lDU2VKWklKc1JtNU9TTTZOYUhpWXor?=
 =?utf-8?B?dTdjWnpkVStYRGtpbUxIVlU0T0tQeUgybXNOeUs1VStCRU1OZ1c5UVJoeUpk?=
 =?utf-8?B?WEptRHVzTHkvdTZBSkFMSUhMNTU1UDlZeHFad3orRjFvaStBVGlEWGJKYlEy?=
 =?utf-8?B?YmIxUzZCWGF6RU83VUlKQURxRE0vT1JuWnpuOWtiWk9qTzI3V1RseTZGUVZu?=
 =?utf-8?B?bENTZUoyYjBWa2dIUjVvTFlGYkxkek8rSDRFdVo1bGFwQjhtSlRXUGg1VTYv?=
 =?utf-8?B?UFd6UmkvQTArTk9VODZDZGdvcWQreG55UGx5R1FkNkl6VEFuV1dmMjJvYkE1?=
 =?utf-8?Q?k+x2Pl0N0PrLGoejGgFJUuElFy5ufEOP?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWtaK09aMEZZbjA4TjNqbUxnc1NxY2k4eVNtdEVMYWhYRUJzd0xLSjRxaVFM?=
 =?utf-8?B?UlFPTkovLzBwZmhpZWJoSW4ralZsaTFEZnRrRHgxSGxvRXhqY3h6SzJlTHcr?=
 =?utf-8?B?UnFQQUVBcG1DUkpudG9NV1ZJNXJWOFpvNFJTN3JaaEFqRUpZYkF0VGtvQUNP?=
 =?utf-8?B?WEZ1d2FmZUhxZU9hSnQwcWJVWW5hQnNEL04xdEN5UWl1S3BOckt4OGJhN3Vj?=
 =?utf-8?B?VFJ6b0FhRkdBWWZ6a2x4RjdoMGthN1l6dG5CSFVYbHFMMXpDaFNwcENOQXBh?=
 =?utf-8?B?UzIzMkNuS1R3MzVHUnNXWFo1dXF0TnlsSTE4b1BQOGRxT2QzS3haQzZLcmVn?=
 =?utf-8?B?TWVWUGpROGZxRXkrVUVTUG9rd2NFMUVFbmMzREN5RHR0L04rbTkyTXEwTzRN?=
 =?utf-8?B?K3VETXF0Y003M3lLZk9SSTRBVy9WWm5aNWxHYmluUHBWVWdCb3FNeVVRRDBw?=
 =?utf-8?B?SlVEWmdIY2diOXlBSHRYK3JSak1wNXRIS1M4UXpsQmU1bVpFOG1GRGRJUXcz?=
 =?utf-8?B?Y3R6WE8xY0JqQWlSTG9BRDJaRVd3SVFIdXlRMTlUeTFwZDBXL1h2SHpBaVpi?=
 =?utf-8?B?MlZsYVNuOE9iQUxUVXRyd3RjSHZtSUp6UERONXRTdzlhYWptSyt0MWFOaHAz?=
 =?utf-8?B?NkxIYUYxWHJPblk2YnpwZ24zM2N4MGhnOE5nY0xISmphdm5qQjZMUGlLYkZV?=
 =?utf-8?B?Ly95azNQUEUrMVQxWWNuL1krZm9jNHRXOXBiRUx4WDM2azlqWUk3cHVZVVg5?=
 =?utf-8?B?czMzVzhuNFg4S1E1dWVWUVlFSHp0M2tESTZDaWtPQWVYQXE3ajZjeTdaVCtK?=
 =?utf-8?B?bWFTdzJTWVNCYkxQcThVc2JXYlZKeldZQWRJQ21leUJNUlFtZUEzV25uTkpv?=
 =?utf-8?B?OUNqNjg1Qjc0KzZGa1BZbi9MOVJDbTMvSWZMY2ZlT0p6ODlHd3JvaFI5eCtm?=
 =?utf-8?B?d2JVVGczVWs5UEEzRnRzUGxMQU9VNDF2RzlNVVBHVzBGUkIyemZJeCtkRVU5?=
 =?utf-8?B?VEJOMXU4TllDbm0xZW1QZW04OVcxdG5vbE5vVjB1NGVNNzlUN2F1ZG1TREx6?=
 =?utf-8?B?R0VuQ0NkYm5KNDFDUEVTVWhBM2NURzJmaDVkYmFYZ3l4OHRYQ3RRZFJwUGUr?=
 =?utf-8?B?dG9jTVY1OFZ1RStINFRmbVBCRndkNS9RZnpTeG1EUUVwKzZSYmFDRE5tV25u?=
 =?utf-8?B?ZGRWVVB1M2M3UmYvQ2xTUVh4Qko4YnJMVGVCL25xMHlWZlZuMmw0QjhDa01q?=
 =?utf-8?B?MnVwV0dOVjMxWkdZTHhtKzdYZmJpTVhsS21CN1NjRUhsY2NURmxiT3gvR2Z6?=
 =?utf-8?B?S3daa1UzckJEcjJyRDRkSndDSmJpZzZIWjFaUXk3OTZkc0hXMzVZd1NTYVNx?=
 =?utf-8?B?SGtJQkF5SlhTTU9HUEdRektwcTR0V2EvYzVOang1M2NvMGhGSVl3Lzk0QVk1?=
 =?utf-8?B?VGl3NEZkVEtxM05kU2V0VHA4cGJxbUgrMHpUMmpzUWpyY1ovSVV5SXQvK2ow?=
 =?utf-8?B?Z1BBaS8xMmFpZFNxR2gra2EvTGNXem9DOHdXSnVvaDJ3ZFVGTjhyY2Nhc1Vx?=
 =?utf-8?B?YjZHVmFCMnJrVFRoNmV1dVd6a3BXKzRZd3lUbGw2dVk1UEVzY2RWOC9sRmt5?=
 =?utf-8?B?Zkk0dkJzOU41SjVNMWhoL0ZvU2d4NUNndEUrcm9FaThEb1BIcnExY2o1QkpQ?=
 =?utf-8?B?SFN3MGowa2kzWDJteG94alo4VmthVC8xM3ZOY0FEeU5acldLcVZqd1lvSEdh?=
 =?utf-8?B?Y3g2UTFtOTRUMllncS8zbng2cytBOC9ZYU9hVGFUQy9DZGZ1Ym9EVW1iUXRF?=
 =?utf-8?B?Y0tJUXJESTcraE9xN3J6SEpaMjBobkxzSldyRVI1bnh4M2gxYi9GeHAvV203?=
 =?utf-8?B?bmttb2F6dnJiTEo4b2NMMmdtOHN4ZndtVnhCWWx4VUFPazlydGJ6a2NXTzkx?=
 =?utf-8?B?RUttV2ZobTU3a29nWCtDeEhZalhyNkhhY29vVGF0TEV6MUI1NnVFWWEzaHhS?=
 =?utf-8?B?d3ZuNEg4NWxMV1g1aldaTThKZXBoWWlqV3c2UmI5R212NldOM2FwV0d6d2Qy?=
 =?utf-8?B?TzVzVlo3S2plK2VtR2NZS2ZyUWVYSG95QVZ0dHdFczRGeUR3aUUrY3pLYjUx?=
 =?utf-8?Q?+liezj2Gv7KDRSyJP2Chy0v67?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <55C05602C5C3EA43A866F624AA28CEA0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e061f4-4d33-4e59-34db-08dd2625cdec
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2024 03:23:16.6796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EIhKdwS8w5lpUcrydcqn9YncrdL+UFw0fja1uO2+Lji3+ePdEnRX+UxBKFMaGBNgg2KJCLA7wnw7LazX4GcBcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7738

T24gV2VkLCAyMDI0LTEyLTI1IGF0IDE3OjAwICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBhIFY0TDIgc3ViLWRl
dmljZSBkcml2ZXIgZm9yIE1UODE4OCBBSUUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCbyBLb25n
IDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgaW50
IG10a19haWVfaHdfY29ubmVjdChzdHJ1Y3QgbXRrX2FpZV9kZXYgKmZkKQ0KPiArew0KPiArCWlm
IChtdGtfYWllX2h3X2VuYWJsZShmZCkpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KDQptdGtfYWll
X2h3X2Nvbm5lY3QoKSBqdXN0IGNhbGwgbXRrX2FpZV9od19lbmFibGUoKSwNCmFuZCBtdGtfYWll
X2h3X2VuYWJsZSgpIGp1c3QgcHJpbnQgc29tZSBtZXNzYWdlIGFuZCBjYWxsIGFpZV9pbml0KCks
DQpzbyBkcm9wIG10a19haWVfaHdfY29ubmVjdCgpIGFuZCBtdGtfYWllX2h3X2VuYWJsZSgpIGFu
ZCBjYWxsZXIgZGlyZWN0bHkgY2FsbCBhaWVfaW5pdCgpLg0KDQo+ICsNCj4gKwlyZXR1cm4gMDsN
Cj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgbXRrX2FpZV9od19kaXNjb25uZWN0KHN0cnVjdCBt
dGtfYWllX2RldiAqZmQpDQo+ICt7DQo+ICsJYWllX3VuaW5pdChmZCk7DQoNCm10a19haWVfaHdf
ZGlzY29ubmVjdCgpIGp1c3QgY2FsbCBhaWVfdW5uaXQoKSwNCnNvIGRyb3AgbXRrX2FpZV9od19k
aXNjb25uZWN0KCkgYW5kIGNhbGxlciBkaXJlY3RseSBjYWxsIGFpZV91bmluaXQoKS4NCg0KUmVn
YXJkcywNCkNLDQoNCj4gK30NCj4gKw0KDQo=

