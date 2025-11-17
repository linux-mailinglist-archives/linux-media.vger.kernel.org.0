Return-Path: <linux-media+bounces-47194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B41C62CF2
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 08:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 23479241C8
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 07:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2971731A7F3;
	Mon, 17 Nov 2025 07:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IJGNr2db";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="OrrhB1CT"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0451DDC2B;
	Mon, 17 Nov 2025 07:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763366043; cv=fail; b=rkiOH5u9XwqbKOdez4HSDj7v4YMhVngKrUsXOBzeiiOwNqfy8xImDZ+/COhmMlsn2pHgHBSp9Hkb5hdHfDIL2lJlMFLZNI+zqEzU2+yA9h+CjaPM424YP0rCyYB7GADkY78wj2mXBJNbcF4ky5/lFO5IzfhmDHXaxGQrBSHU93E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763366043; c=relaxed/simple;
	bh=hSCfSSUTtyvm+Tk+kMB4F6swR2vEIZWo46r5MHcEqYI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dlNHCn3TsOBypjjnVDGgAxKC2eVYWlTjMsjY4KjU5pIm/CaehYw3YG6nS+d2mQTW0A3A3syzuwzK0ozzsnG07eJExAgXjBLblUJXz0U+1nRx3QHrmQ5QFFRwhT8US0UDYGkuUhLJybGorcl3ZDxn8jHMSPdwpFjq7AwfbI2yY48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IJGNr2db; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=OrrhB1CT; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8fa3cda0c38a11f08ac0a938fc7cd336-20251117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hSCfSSUTtyvm+Tk+kMB4F6swR2vEIZWo46r5MHcEqYI=;
	b=IJGNr2db3cF/Dr0ZLBlUnsDbtd8rEOBQhumz/McrddKS7loUyDWQStDRflduQvssk/q/XmGfhqsW1vIzdtzE7FnwAlS6SeRUCiaiivdoffmXa08rCuzyVfGUTk+jh7IJQNJ4WqjpsbT3vfbJg2dBZYW3Mv4Y2gr7Z417YQG9lrU=;
X-CID-CACHE: Type:Local,Time:202511171536+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:62d315fc-3d47-4555-9ddc-a0377537fb3d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:31938492-7fd3-4c6a-836a-51b0a70fa8fb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8fa3cda0c38a11f08ac0a938fc7cd336-20251117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 911595656; Mon, 17 Nov 2025 15:53:53 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 17 Nov 2025 15:53:51 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 17 Nov 2025 15:53:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUe0DujDgYU7RCw1fI3utMekuskmiKqryiSt9En6Xf8AdR1IzmZACsWJ/XSNpv5lZRJXvyAJZn/hVf4XuNxqvItytNdshCSPftACYHd96ZVDVZzDngzcagZrKJekn4gnAmJ1GYkbkX+JICkRdI2gYAMZ03iAn3MqN22SiNDszoJTxzHBmJAbWO98Z1oF9goR8kzFJZJQ2GshXcklF5VEDlkDCQZzlUzzCR+BRymKZSO14z9gSgpfFSPFCggE77EjaUleAZ2UpSl6lqw6KubjvRPYLsbrcN9lza/yAJY1OnUso/VHDTdJgAUf09t+bCR/2GNcDUVmGRjpC+VBTzlGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSCfSSUTtyvm+Tk+kMB4F6swR2vEIZWo46r5MHcEqYI=;
 b=MiJLAEmiP0HyZwK4hvyIzAn7yFV/RTOT4OhnMwHBQh8uanaFWTfqCr8EYi65B2GyXK2QoozpErLhy7REnPkLw9v3nbacyurFKbs53sdry94IZ6l+Trc/JLGzkls/aEfq6lUBFIfrT+YAyPKrGxKTo/yAd2woE5G5UgKHffeb5/NmNHYUyVTZjFVl25mbrMpxltcHwU92dGft0hBBvYwSeaPYQgaytOLPI9I0gYe6yspu6dkEWLzvivecUwEa2oFjuSFnAznodss74Q7EzvdHeq56Eq+XNuhm3x6CkH9dzmofcnP9+gIBlloJBkdEdybgjZati3yOBlfNu/JLu0d2mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSCfSSUTtyvm+Tk+kMB4F6swR2vEIZWo46r5MHcEqYI=;
 b=OrrhB1CTiYrkZJEXl3LXhnLz/ZNVXg6Ui0OT4gO2CpHN4RDoIGqSZA9eCmP/QcIYsNRh/E6aYBSBvVst2bZGa+UGcdz6oNgn4OQT2ZJJdTmcVmptWnt39T+6OcuMOs9LEnS679d1KRwM1c3MNGD4aHqpv0668P6tc/jakDJcSF0=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYZPR03MB7604.apcprd03.prod.outlook.com (2603:1096:400:363::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Mon, 17 Nov
 2025 07:53:46 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 07:53:46 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 5/8] media: mediatek: vcodec: fix vp9 4096x2176 fail
 for profile2
Thread-Topic: [PATCH v5 5/8] media: mediatek: vcodec: fix vp9 4096x2176 fail
 for profile2
Thread-Index: AQHcTuSm9J6VepoZjEGhhb0MM0oiWbTlunMAgBDWWwA=
Date: Mon, 17 Nov 2025 07:53:46 +0000
Message-ID: <e5782b0ad3128879ee7a6b637c93c54ff68a7dab.camel@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
	 <20251106061323.2193-6-kyrie.wu@mediatek.com>
	 <899fb4c2ce292bcce4caeb6cf6f38744c449e8e9.camel@collabora.com>
In-Reply-To: <899fb4c2ce292bcce4caeb6cf6f38744c449e8e9.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYZPR03MB7604:EE_
x-ms-office365-filtering-correlation-id: 13ed1c67-8976-49d0-ae77-08de25ae6fd2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?dnR0MDVhYzRqek55QmRBN0k5MjJQamtzOHJBRmJGVEMxQkVmUXZDL0RCelhk?=
 =?utf-8?B?eFJkR0dUdmRINkVKdyt0ZXpyOHNMQnk0YXA5K3k3MzBiOXEyMFlXc0RXcmpD?=
 =?utf-8?B?UFQrTTRyVmJhV0J6VGdhZ29ZeVFZQm9MRFJYaUpTZG5TN3pLZkJtV2drbEQ0?=
 =?utf-8?B?d3Y4SVp0aXRoOVJHaEd6U0ZOSExsb2V6V2Y3NTRCcTdOY0d1MXBJTExHZmJC?=
 =?utf-8?B?RGlBMHd2MTZ0U3NFcWEvOFBRbzVRMmI3cGNUZTNsQXpZZUZrbkt5S1gwM05B?=
 =?utf-8?B?SEtrb2I5U3JwMnIzdGRpVmtQTE1sK3lJUHNyU3ZUb0hNMmlaR2o5ZmkrNnZq?=
 =?utf-8?B?Ym5pMHZxNkdWU1hza09zWHlkTytGWVdYbVhOcStsakx5b0JvU1EzYWc4MjVU?=
 =?utf-8?B?cVFPVUhDNE5NN0xBT3VkVVdIbVFzWHFXSTVGU0dNNVkxQ2lBRm1HV2dpS1J5?=
 =?utf-8?B?cFFKUmtiVWxDVXRWcmdJVTBxQzR0K2NiM09MWU9Kd3IraVVoc2VuMkIxK2dG?=
 =?utf-8?B?VnJWSlBXdXFrYjlEUXU1MEJUNlBzWm1zd0d4dXhDNW9SVzV6aXNKeTRXanZ5?=
 =?utf-8?B?bVJ5QUVsN3NVVE9rQmhhQ2FqSjFWMnY3VC9nMkNhSFBIN1hQcVpBYVRSYnRS?=
 =?utf-8?B?cUtndnl3UWFkYW5oNk1vOExaeG5HL2lqTk1DUE9QYVhISVh2TjY5N0lsczFS?=
 =?utf-8?B?QlM2N1FLL3piUGRDVndKRE42dTBoM0lNdFpXd3FXQXpZVXBwZTAva3NhK3BN?=
 =?utf-8?B?YU5oSWlJS3EwRDN3ckxBRDdWdS9lb3NPVjc4dldEZ1kxN2FDcmZsa0pJRm1r?=
 =?utf-8?B?ODRNZC9YMEpWNXQxYzNwMW41bkNaa3FnS1FwWFN3LzdlVlNXMDBCSmxVNjA0?=
 =?utf-8?B?bWVkaFltOXloWmxwSDkraWZzMm1GZUQ5dzRWWTNOR3JrVjhhNnl1Q1M4bXdr?=
 =?utf-8?B?RlpSUkFBTVZpSkg1ajh0U0ZNMmhYSmxXSmU3Tm05U2ZBRVZhaVhVYTJURGZY?=
 =?utf-8?B?VjJmWk52Q0RYMDR0cUxaNlVuRjgzYWJ3R0s1SGtRQTZOa2Vqa3hSR3lvMkdT?=
 =?utf-8?B?TWJrckxMYm9COGZjVnlRM1o3djBLWnQyM2o2V3hWbTJVNk1Xa0RIeE5SZEsr?=
 =?utf-8?B?d3pZSStpNnBmMm84enBjaHdncTZSTVBNWVozVmMveGQ1OVgwcU1tZnBrNnFI?=
 =?utf-8?B?RFJjbXZrNFVSZmpJbzI4MVJkQklGWTAwQzY3Wmc1MnFPTTRhamdRWlpDU1lK?=
 =?utf-8?B?YU5qbEJhek5NUEZLUDUvWjZScTJmTUgvN1V5dXdDeFE4QWttSEtjMmg5Vlgv?=
 =?utf-8?B?Nzl3dUc1Q296dzhSQWFCQnowSytNWHFyZWFOZ2JicVF1QytxVElZdjdQa3g1?=
 =?utf-8?B?ak1jV1ZLdWtscmdxNVVUT0dIOG94Q0NUYVFJeHRwNVNDQy9LWSs0aGFXd0xQ?=
 =?utf-8?B?SEJPSGJDWTZuWndkM2lRMVVYcXFUTVdHcXFvZkFVK0lWY2tSS2JxZDZkbHZM?=
 =?utf-8?B?MzZRcVdiMzNhbXZMelN1ellTazRoWUNXQS9lempnZ3JJRHdXOXlyRDhabXJy?=
 =?utf-8?B?bnltLy9QWTFFdHJtQ3Naa3NNUFdNTmZkN2pHcHpTTkhIdC9kZVk0enJOQ2JU?=
 =?utf-8?B?bjB1WU80UHZubDk0bFp0MGJCaFhEblJoQ3BpRXFYd3BZbXYwaGVzY0Vhb0cz?=
 =?utf-8?B?TTZyT01DYW53Sm5ncElnb1BTSEl2a21VbVZwb1hOeFU3aDVxOU1EeGdQdDZu?=
 =?utf-8?B?SXFwaE16emowN2lmUlo3Y2xDb3g0eTJkVWQyODJYZ3BPaUVaS3NkY2J1RzVp?=
 =?utf-8?B?WUdLallFblZVQXVMcEIwV25YWEZmOVBXd05jR1VVZXdIcHFhNXRIbWtNV3ly?=
 =?utf-8?B?dTJTKzd0Unhzb29QQld3YlNGbW5VRGlDdFlsVTVPdDV0V2I1d2hmcDgzL2Fw?=
 =?utf-8?B?S1BYeVBra1Q5cHFqRzZZbW1ERkVsSkdIWTduSW53Y29WeEZmY2d3RGJUSXVR?=
 =?utf-8?B?ZUhjVGo3THJud3UwMGhKWEwzZHBRbE16aFg5KzE4eE01ckZtTnQ2dFh1RTlI?=
 =?utf-8?B?RlRINnd5UEQ0OEEyUkVoL3p0Qk5ramZqSFVHQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rjh6ZDZnc0wvai9mR0xYYVpOaGF4bE45WExieWpxNm9xM0ZJOGczSWYvQmND?=
 =?utf-8?B?Tm9pSGN2bm10ZWxMaU85L3NWTkxRQTJIVU1sek55cEdYSE1hVzJuMXZ1bldX?=
 =?utf-8?B?YTRhOHJLNE1hYThib3ZCd3JMeW9VeWwrekc0VDgxZnVqTlVsUlppeUVoZGtX?=
 =?utf-8?B?SnVHc2RaZFExcG9USmZZWXlzTzdmTXFIYWlodEF6M05yYjhZNlhMSkJVZTQr?=
 =?utf-8?B?MUJXUERpZm9tS0pON0dLM0lIeVFSZVJXbkwzZEhnVjkxSlRyNmJMTWVFR2lN?=
 =?utf-8?B?KzluZTVNOE1mcjZKTC9ZWnBTNE5LTGdLQTRqbmJqemY0QzZUSStyWndMbUxZ?=
 =?utf-8?B?RzBxQ3VhMHMvVXltVmR6U0RTM0pFWkJtU29sSmtmeWhRbzViSVg4TjhSZlVj?=
 =?utf-8?B?SVZCbW5nWlc0akVZckxhOGs1RERNaHp1M0d4SS9UUjlzTXZsQVA1Q0FneXdy?=
 =?utf-8?B?REloNWJLbW8wMzVhdk1jQnFHTG85WHZoQUpNcnNtdXUwUFpmcHNoSE9Fbkts?=
 =?utf-8?B?OUthYkcrS0tvS1B3OVk4c1FjaHNLOUtpRnJxNGh2NTIzM2Vud3g4U3YwaTgy?=
 =?utf-8?B?bHNDRENCUGJIbnpWVUUzRnZaVllOZnJhM2xmY1Z5em13NTF6M0YzYVJ1bXVR?=
 =?utf-8?B?NVErV0VJeDJVakhBWnJyQVlWYVIrSE00RCtoUGdsSFVaSG9CY1I5clp5Rllr?=
 =?utf-8?B?NFpFQWp1MHhlZXlRQSttS3FvSkUrZUZQNnJCLzBGbHRvRUNYbW4vZTlmOU1X?=
 =?utf-8?B?bzE1T0lTb0cwVlZRVmc2NWNqWE9jbUJuaDlRK3RQSHNucDJXUjd3Q2cwbjZE?=
 =?utf-8?B?WHJOSklUaWpTTnRCN2lBeVlrVUlyUldjb0hBNU01d1pHTDJ1bnczU2VsSzky?=
 =?utf-8?B?THlTRlEybm5JZFl4SFpNYVhWZWNvR1JURXRoMXZUZm5BNG44aU9GQjZaelRL?=
 =?utf-8?B?OVVUVGNXQVM5UDBIYng3OGM4UStiZUk1NE81U1Nid1hqVnBmeTZxTm8vUVQr?=
 =?utf-8?B?R1dCRUk2NWQ3QzF2YUxYNWlrMHNZakNLVzY2dFN0TVlpdTBLSTVmVG5hVjE4?=
 =?utf-8?B?cU43ZHBHL3RpRVZxQUxGUDFUTzA3aWJvYXcveTkrVkpkMEJmNWVib0hyZGJ6?=
 =?utf-8?B?NGxob2tjQjByb3dNS2ovbytFa05GaG1OdzZOM2VoUWtkVS8zakdwdlZWeGxr?=
 =?utf-8?B?andsdGtYUndFN3JLWXlhSkVHdHZ2T2lRV0QvSVRaQWdEMWN0ZjhOK2JFa1N5?=
 =?utf-8?B?Q3JxSWsrMVFyRThIMm5rWVViSU1ZY2NzTUFOWVFlQ05rckhqQ01oZ2Y2c1lD?=
 =?utf-8?B?b0ZnTDc0T25JTU5HNDNmalpGSllWdHkzSGtQbzFEMmxBZjNRN2VBR0RqTEw4?=
 =?utf-8?B?UkdnNDliYjRGR1BQWXRrV3NPNFYwYTVIZTFrVk9haDJ1RXNJSEpOUStwV2x5?=
 =?utf-8?B?YksxYUx3RUhDOEdaS2hiVUVjdVY3SFVnaUJPaEkzNHZLYUFnYUFvM21BUC9v?=
 =?utf-8?B?ZTd2L1RKRHNBVENlZ1lsMVVZaHFnTjIrblhtdXRqMDJpdE9LVUJjNXlyWUVH?=
 =?utf-8?B?eUpyWGc3QTRsVnhUSzZtaGhGbXlzZ25DU0huU2IwL1A5d3ZoeGtQM0xsYTZy?=
 =?utf-8?B?S015ak1jQVpiZkNMSTVmNnRUSEM1Vmx2OHVscmpGMWJpZ3p2ZFVmM0txbzJx?=
 =?utf-8?B?UHBtaU85cXVNV2xHcGNxTTUrZUJJek0reWszdTJtZkVYQ1NEMDMzeTgvclZ0?=
 =?utf-8?B?WnlUTGdEQ3VkVzl4VmVTNGZqUnNKb3dDK0F4c3U0QzArZ1Q0NWV2aDdEWjMy?=
 =?utf-8?B?QXZsTDQvaUt3WmpWa01qLzhtT1NmM3p2NTY0alkwSnR1Tzk0NFNkeGJZNlRj?=
 =?utf-8?B?WHF1SjZGb2J1ZGdnUUVwcmhBZzZuUW95OXh5MnpRZWtuRG5NZjdCUzI4dDNv?=
 =?utf-8?B?STVKdDlUbzhLbXRCeGtWanRzVVJ5ajRURmlSbjBtT05qV3h6dGtIOEZseThh?=
 =?utf-8?B?V0lQbXJkeUFQQVZmRVdYMUl1Mms5SmhKVHdOSVQ1WTNTaStKVWlnd1BHVVYv?=
 =?utf-8?B?Q2V3bzViLzVieGd1R1k3alNYbkZqZXhjeEFGS2twNS9meExvT2JLM3BaS1hF?=
 =?utf-8?Q?oGVhpHV9hcSAWPR0tEK/xCiOt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E8711829C3277439937BA348C54251F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ed1c67-8976-49d0-ae77-08de25ae6fd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 07:53:46.3154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ua9Mevxa78XsydKeSs8C2Klx7Ea9GZAAoMCm8eGRmdDCP7xD6g/29piv9gWT3nWXGTdYZrpyD0c9LfTACltK8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7604

T24gVGh1LCAyMDI1LTExLTA2IGF0IDA5OjQ2IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIGpldWRpIDA2IG5vdmVtYnJlIDIwMjUgw6AgMTQ6MTMgKzA4MDAs
IEt5cmllIFd1IGEgw6ljcml0IDoNCj4gPiBUaGUgZHJhbSBhZGRyIG9mIHZwOSBkZWNvZGVyIHRp
bGUgbnVtYmVyLCB3aGljaCB1c2UgZHJhbSBtb2RlDQo+ID4gdG8gc2V0IHRpbGUgaW5mb3JtYXRp
b24sIG1heSByZWFjaCB0byAzNmJpdHMgZm9yIDQwOTZ4MjE3Ni4NCj4gPiBJdCBuZWVkcyB0byBn
ZXQgdGhlIGhpZ2hlc3QgNGJpdCBvZiB0aWxlIGJ1ZmZlciBhZGRyZXNzIHRvDQo+ID4gc2V0IHRp
bGUgYnVmZmVyIGFkZHJlc3MuDQo+IA0KPiBQbGVhc2UgcmV3b3JrIHRoYXQgY29tbWl0IG1lc3Nh
Z2UuIFBlcmhhcHM6DQo+IA0KPiAJVGhlIERSQU0gYWRkcmVzcyBvZiB0aGUgVlA5IGRlY29kZXIg
bW9kZSBpbmZvIChNSSkgYnVmZmVycyBtYXkNCj4gcmVxdWlyZQ0KPiAJYXMgbXVjaCBhcyAzNmJp
dHMgZm9yIDQwOTZ4MjE3NiByZXNvbHV0aW9uLiBGb2xkIHRoZSA0IG1vc3QNCj4gc2lnbmlmaWNh
bnQNCj4gCWJpdHMgaW50byB0aGUgbG93ZXIgKHBhZGRpbmcpIGZvdXIgYml0cyBvZiBhZGRyZXNz
Lg0KPiANCkRlYXIgTmljb2xhcywNCg0KVGhhbmtzIGZvciB5b3VyIGd1aWRhbmNlLCBJIHdpbGwg
Y2hhbmdlIHRoZSBjb21taXQgbWVzc2FnZSBpbiB0aGUgbmV4dA0KdmVyc2lvbi4NCg0KPiA+IA0K
PiA+IEZpeGVzOiA1ZDQxODM1MWNhOGYxICgibWVkaWE6IG1lZGlhdGVrOiB2Y29kZWM6IHN1cHBv
cnQgc3RhdGVsZXNzDQo+ID4gVlA5IGRlY29kaW5nIikNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBLeXJpZSBXdSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+ID4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bj
b2xsYWJvcmEuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIv
dmRlYy92ZGVjX3ZwOV9yZXFfbGF0X2lmLmMgICAgICAgfCA1DQo+ID4gKysrKy0NCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2Rl
Y29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+
ID4gbGF0X2lmLmMNCj4gPiBpbmRleCBkOTY2OTE0ZGI0YjkuLjkxYzU2M2MwNDliZCAxMDA2NDQN
Cj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2Rl
Y29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiArKysNCj4gPiBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX3Zw
OV9yZXFfDQo+ID4gbGF0X2lmLmMNCj4gPiBAQCAtMTE1Niw3ICsxMTU2LDEwIEBAIHN0YXRpYyBp
bnQNCj4gPiB2ZGVjX3ZwOV9zbGljZV9zZXR1cF90aWxlX2J1ZmZlcjpxKHN0cnVjdCB2ZGVjX3Zw
OV9zbGljZV9pbnN0YW5jZQ0KPiA+ICppbnN0DQo+ID4gIAkJCXRpbGVzLT5zaXplW2ldW2pdID0g
c2l6ZTsNCj4gPiAgCQkJaWYgKHRpbGVzLT5taV9yb3dzW2ldKSB7DQo+ID4gIAkJCQkqdGIrKyA9
IChzaXplIDw8IDMpICsgKChvZmZzZXQgPDwgMykgJg0KPiA+IDB4N2YpOw0KPiA+IC0JCQkJKnRi
KysgPSBwYSAmIH4weGY7DQo+ID4gKwkJCQkqdGIgPSBwYSAmIH4weGY7DQo+ID4gKwkJCQlpZg0K
PiA+IChJU19FTkFCTEVEKENPTkZJR19BUkNIX0RNQV9BRERSX1RfNjRCSVQpKQ0KPiA+ICsJCQkJ
CSp0YiB8PSAocGEgPj4gMzIpICYgMHhmOw0KPiA+ICsJCQkJdGIrKzsNCj4gDQo+IFlvdSBhcmUg
Zm9sbG93aW5nIHRoZSBzdHlsZSBoZXJlLCBzbyBubyBjb21wbGFpbnRzLCB0aG91Z2ggdGhlIG1h
Y3Jvcw0KPiBHRU5NQVNLKDMsIDApIGluc3RlYWQgb2YgMHhmIGFuZCBHRU5NQVNLKDMxLCA0KSBp
bnN0ZWFkIG9mIH4weGYgaXMNCj4gYW5vdGhlciB3YXkNCj4gdG8gd3JpdGUgdGhpcyBjb2RlLg0K
VGhhbmtzLiBJIHdpbGwgdXNlIEdFTk1BU0soMywgMCkvR0VOTUFTSygzMSwgNCkgdG8gcmVwbGFj
ZSAweGYvfjB4ZiBpbg0KdGhlIG5leHQgdmVyc2lvbi4NCg0KPiANCj4gU2luY2UgdGhpcyBpcyBu
b3QgYWx3YXlzIG9idmlvdXMgd2hlbiB0aGUgYWxpZ25tZW50IHBhZGRpbmcgb2YgYW4NCj4gYWRk
cmVzcyBpcw0KPiBiZWluZyByZXVzZWQgdG8gZXh0ZW5kIHRoZSBudW1iZXIgb2YgYml0cyBvZiBh
biBhZGRyZXNzLCBpdCB3b3VsZCBiZQ0KPiBuaWNlIGlmIHlvdQ0KPiBhZGQgYSBjb21tZW50IGV4
cGxhaW5pbmcgaW4gd29yZHMgd2hhdCBoaXMgaXMgZG9pbmcuDQo+IA0KPiBjaGVlcnMsDQo+IE5p
Y29sYXMNCg0KT0ssIEkgd2lsbCBhZGQgY29tbWVudCBiZWZvcmUgdGhlIGxpbmUgb2YgaWYgKHRp
bGVzLT5taV9yb3dzW2ldKSB7IC4uLg0KDQpSZWdhcmRzLA0KS3lyaWUNCj4gDQo+ID4gIAkJCQkq
dGIrKyA9IChwYSA8PCAzKSAmIDB4N2Y7DQo+ID4gIAkJCQltaV9yb3cgPSAodGlsZXMtPm1pX3Jv
d3NbaV0gLSAxKSAmDQo+ID4gMHgxZmY7DQo+ID4gIAkJCQltaV9jb2wgPSAodGlsZXMtPm1pX2Nv
bHNbal0gLSAxKSAmDQo+ID4gMHgzZjsNCg==

