Return-Path: <linux-media+bounces-20742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B2C9BAB42
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 04:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B635B22CBC
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 03:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3843117BB1E;
	Mon,  4 Nov 2024 03:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Xt40KNlj";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="mombFHWu"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6B41F949;
	Mon,  4 Nov 2024 03:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730690708; cv=fail; b=EhKG23VGJ4j8PBrAg8nwx2O9ruFU9YN7udu+NvXYa11dSI+A13JVH2uXkHEzqLVSCA38JaFbWpBVdVDJxenJbC1XXPrT+JdX/g0CmczXc9sCn1G3OTNwVYlnXhZryAn6/ZAFmINQfGdCkWC3UIA2pMOvOlrYJKYru3P3/GJ8J8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730690708; c=relaxed/simple;
	bh=VtWk9rblcBXQZxpi9kzoBK0SsOgmHfA91ox1p/1myaM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FzO5Hy1WVmgBLsuPzcbY+ixvaukr+zHiiVUligdR09MZdsIdefGBKj4n4xkUwo67XjzlFxwa9MZMZwe5PK8HFL+0YcutDsns0bAyKothE1GNKuqljHiCkE/mFAIoCqwPYMdk9uei/RZ/yYYroS1LSNulACOcDFE7KJ726a9oe+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Xt40KNlj; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=mombFHWu; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5f42729a9a5c11efb88477ffae1fc7a5-20241104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=VtWk9rblcBXQZxpi9kzoBK0SsOgmHfA91ox1p/1myaM=;
	b=Xt40KNljM8qwUN/MVNb0/kZqV5T+At+Q0D9s5kwH8xCfQtdsqv3b+XwrNCf8H+kNFBXQDTVXMzOsxgcpw9CMghnFfwVfKaXEwltyNtXOskY0Aq3eQR5U1jY+lPqcYaNtXu5ghn/C3TAngWDthPUvKixsAnHKjCEtGIaumpwLI6M=;
X-CID-CACHE: Type:Local,Time:202411041124+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:82e83085-21b0-4fd1-9876-4e6f138653a7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:6486a148-ca13-40ea-8070-fa012edab362,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5f42729a9a5c11efb88477ffae1fc7a5-20241104
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1121103626; Mon, 04 Nov 2024 11:24:59 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 4 Nov 2024 11:24:57 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 4 Nov 2024 11:24:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cM1o5o4Rh1nCI9qzoyDqtwiCtq1Mc0spBEe2xC/wvSEmguXnKv0wrdTnU8Qk+rPw/DJ66Bt4Pz1IprdEBuUDIjipIBlrJKsTCJAMjUKpiT+SflJiNR9f1HpuwuG0insN7vlo8yjfuSYFkgO0zR/JXBLq7Kt/xpLpttO9AESWT0OJB1pF2cfaoF4mCiSel/Z/kTm7ZaXcCyBAA6KbTw/VgjB4Qa/bfKBRdF432aptjdqjpLF2aWDXyAT88/y3xw+13ls/cNYfI9SU1DszksfDdSOy3RRyRX0aU1U8UxRpWJrTOHJyr9YJmhGrHvmJBmWSoawTRSNrD7cZ7gKBlRlSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtWk9rblcBXQZxpi9kzoBK0SsOgmHfA91ox1p/1myaM=;
 b=ZS8msRvzsb8hodZsfJj7ZIueZG5I+HPmTKBNSug/WJG0qTzGHn9GdTJBY5hYpY9bsP/hISBQftX4KQXU0tKzTtr7NmjF6SDtA94Jim+6EWcPR+vbLJ3lm0H7cgclFsFRlASpcvS4cmXIMPvu0hrfBIfi0mxhx7qA6ENJx1ZPQ9RB0cGLZ97AHYc6n/Qq+lx30G8aRnnJuvBFYbx41kDBWbos9xZsjTF1C6smHk+2DsEHtxVGmV9qhxBWe5wAQe/22fj47Y2puTLWV5so9E9cz8W9SaYXuKC8Kwe88zZKs6VQIceOrtA5e+5/W4OnhwW5IhD8mlup4eLsbV1ErM0yHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtWk9rblcBXQZxpi9kzoBK0SsOgmHfA91ox1p/1myaM=;
 b=mombFHWuou120wyzNkYlWv//1xU70p3Ez4WcdORd62ITJvgpPPQSLdSkijOOmZxRzfN5Sq4PVDSJZAEmvYHjX9nUgNCRJfNJn/FIl6fXydClxhHXjIue4sKuYQEo1i+ZE8toD8lUNMvrV1/N47wvv+L/liQCASpXXOthQuN2Fg4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7711.apcprd03.prod.outlook.com (2603:1096:400:423::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 03:24:55 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:24:54 +0000
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
Subject: Re: [PATCH v1 07/10] media: platform: mediatek: add isp_7x video ops
Thread-Topic: [PATCH v1 07/10] media: platform: mediatek: add isp_7x video ops
Thread-Index: AQHbGj2rn5mkjx9+gEa8/1/+8BPSjrKmnb6A
Date: Mon, 4 Nov 2024 03:24:54 +0000
Message-ID: <ee264b1a6c8425b752852691945b021f507be7c9.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-8-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-8-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7711:EE_
x-ms-office365-filtering-correlation-id: 1d2c95a1-6474-4533-1b6c-08dcfc80406c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cHErNmpLZ1ZhVitXRFdLV3FqNUxuWHRUcEV2aGlEbkFzc3MwMkFBRS9xVWJs?=
 =?utf-8?B?eE5VVTdQOTRJeDA5T0ZyK1pvOVBOVjRtUEYvNFdnT3FkK1NsK05VRFk1N0ZS?=
 =?utf-8?B?ai9XTmdvSmYvWUg3QTlYSVFRWURqRmU2MDhTbWdUdWxsc3J5SjlQaitqbnY3?=
 =?utf-8?B?dXppK01GR001TUxGOWJUeTNKRFRTOEkyQjlYQmFYWGhGSlNVUnMxWVZrNVVy?=
 =?utf-8?B?L0pwTjFBSXc1ZGt1MzdsUGNKQWFOSVFjR3NwTWRremdOL2lvdy9jcFlqMitU?=
 =?utf-8?B?bDBCQWxMV2l5QnBlRFcreTVobVdMOW5GVGJBMEY5dGRQRjFIeXVyMUNWVVRy?=
 =?utf-8?B?Q3ovUEhIQWEvd0Z5RytmaHJVTUxOcjlGMm1NaExNUmtSZkxNSFVZSkxLQjQ4?=
 =?utf-8?B?blliak1JaktpUzFxS244Vm5VNEN6RklsT3RtU2hyRDBOSGJZamJDdTZOTXNQ?=
 =?utf-8?B?Tzc3QWhoUE9IY2xXYmJNZjU4RG10ZEIyazRhNlkzNnpJcWxYbWpjb3lFSHN2?=
 =?utf-8?B?eVBuWk9udExReU51SVl2Znd1anVrNVR2czF2UnhWdWpaTEVBZk1PakEzVE40?=
 =?utf-8?B?RXcwYXcwTUV3U3NJc0dkQ292SmpQMHhCd2N1N3ZYcnc5OURJdDJLKzdrNnQr?=
 =?utf-8?B?ZzlyQlpGMGJreVZmeG9aS0VMYVEzYzQwK3I5Z3U3ZkN0MGZKUEF1Z3hQeFQ2?=
 =?utf-8?B?VnF3MmVLbjlsUHRFaEdwMmJEQ0Q1UmFSSjlhY3hYWC9GSVcwYUNCWWNiQ1gw?=
 =?utf-8?B?c1J2NTEwOHpqdzlKOFZSbEtTWndzbmJzc3UwVnRsbWlIeWpIQm02bjRHQjV1?=
 =?utf-8?B?ZUhwd0JVM3hFQmI2UDRQVjZvaHRqaXBrN1Zhc0NiSGx4RDZVK3R1M0pUUUxH?=
 =?utf-8?B?NUNOaGxxOTJGSzJoR2x3b210ZmNVWjZZcmd1VXR2M2x2b1dlV3pYYmhpMzBs?=
 =?utf-8?B?TDZSNklXeXZYZEFpbFpYYjMyL0lYdEkya3dpRnFSUm9QMTlCWWpQZGlxbjlH?=
 =?utf-8?B?NjVlSHdla2hyc3h5eW1MazUrZ1I5cldtdzVieUV2ZS9KNWRKdXlmZitzdlRj?=
 =?utf-8?B?aUFLQW1SdzNnd3Y4eWVDV3BrRHQ5Wm05Q21aTThORVR2Smh5bVhCbUU5cjQ5?=
 =?utf-8?B?Wkd3UVoyTUtEZjVWb2NEbFRXS091aG9XQ3FWTCtHc3Fld09scFdkeEV0QU9X?=
 =?utf-8?B?K1EzSHYxMWNLSi9mUWNlRWNOMUdrNEZ1bVc5SFBKaWZwdUY2SmxDZDQyclBL?=
 =?utf-8?B?cmNBUVlmNyttUVByS1NCU0dCckRLZXd3OW1CQmRTelB5dkFkZG5hTURvampX?=
 =?utf-8?B?RWNOMTdwd1ZNeStuZVhVK3c1djZXZS81cWRnbjYyUEZkbEQySHdVbDRsRGx5?=
 =?utf-8?B?a0RHbmMwdG44SWRORHcvUXY4amduNFBIdFhmSUNwb212dWphS2FQeDE3U1U5?=
 =?utf-8?B?OGJLNXpDV2VaMWwwWWhnVXJtUVlUTlQzczBvNXBjclM0ZTNISG9UV05OeGVl?=
 =?utf-8?B?N1RZOS9TbjhDakhZWno0R2JybGFSeFNOaW9JQmtLS0o3UlFiTGMyNEFyZDJv?=
 =?utf-8?B?SDZBVm8xMDBmNGFxblNsZSs1TzM3WW9ETUxKeldUYUwvd0NlRVVFd3N0MDFX?=
 =?utf-8?B?dkUvOGR5UHhreUwxNzVEc2NIZysxMzVqWCtxcmZSSUk1WmFaSFkrbDF2SVVm?=
 =?utf-8?B?dmYrTFJES2dtL01wUE5vc2RnNndYNTlZWklEYzkzd1JaTUQzT3B6YWZ0SlRw?=
 =?utf-8?B?bnBrMW5JTVNyWUlkRmY1b3RiQ2IwS1FaVzlHNnczMEpWT1FjOFh5QWx4QVBq?=
 =?utf-8?Q?zq2PRN9EoceNv7qYrA5C5fpr69Thn1QfgZP/w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDFuRW9WVS9Ld3VqTU1RQjljdFFSOWRBaXVuRFBqNmRYbzdOSzZNaTVMNUVu?=
 =?utf-8?B?R20rbXlkNEVCUVJuTXBCbCtDUzBBUGZ1aGNuclFEY01RaGNjS1hCMkd2QVBn?=
 =?utf-8?B?dE4vbkxhSXkxOCtKTjFJQzFOTlc4Z0NKUldtdytZY1hFaUM1REhhTXlqbzlN?=
 =?utf-8?B?WndaQm9LaWFuZytOdWxGZ1lNMXVnSURzRnd6WjRoRGd2OGd1MnhjMUhFOUNL?=
 =?utf-8?B?VkJVdTlNbm1sWElKNmZGWnlRa2c3MlU0YlVkL1ZaeHNQMmpPQXZ3dFlZdW9q?=
 =?utf-8?B?VzNOc1VRd21qMHYyNFVtRGY3YVQ5V0g3VVNYd2hHQ2N5WjZuQ2pJRG91dzh1?=
 =?utf-8?B?RU9Oa0VhbDJjbFUwdHZlUUFoelNDMU5tdmxwSkUyZmYvVW1tNGJuUFNpcmxk?=
 =?utf-8?B?cTdlbWV2M2h4RGdyR0daWmM2aTJ1SUxUOHg4Wmp3MkF6aWd0SVBYa1FBZXBP?=
 =?utf-8?B?WlFNdWp0RVdFNGRITm16ckRaSVVFUzh1cFkxalkwVUNtck1ZN3lhTGRsMC9W?=
 =?utf-8?B?a1EwcHg3UTQ5Wit3NVFReWlDSlgvRkdHbmw2R0pZelRCdzVmYUgrZlVGNUdR?=
 =?utf-8?B?MTNzMG8rd0JmUE1GRTNNSzA2NGQ4Rzg3RVdaTzJONUNZTlVmZ3UwTkJxQmFo?=
 =?utf-8?B?MUgrQUs2YzJVa2RqbXQvc0NxN09xU3J1OXlkTmJJTlRDWmdsaTdDV1hPQlda?=
 =?utf-8?B?Q2ZUS3c3V0F3L0dXTGxqRW81RHpad2lYS2cyMFBKTTAwUUI5enRqTWowdEUz?=
 =?utf-8?B?c1VaVkNtOERYWEpIaTJtTmE4RW9Xam5acWhWTTdLQnRGR3ZFc2tXTVBUcjUz?=
 =?utf-8?B?WW5MWTdZWUZQZWlONklidGR6d2djN21MMnlNZE9nQW56MXljMmZXQUh5UDFi?=
 =?utf-8?B?Zk0wR0Y5bG03dGNsdnR4TS9KTDM3em85MGd3ZVZUNC82Sm9pWjdSaFdXbFdt?=
 =?utf-8?B?MmhHdEhWQ2lPc3hBU3dKditXc1dIaStaM2ZoOG1tL3k1UXlsTURJU2crMHNy?=
 =?utf-8?B?a1ZTNTduQzUvd3BCcUNGb2VMdG8yWHFRUUtSODJ3ckxIZmduZFJEZVVxZGxh?=
 =?utf-8?B?R2o3bDBSWm8rL2RVZHNkRnNFQUt1VTd3cVdpYVFSS29TWThEQ3ZISkVGckU2?=
 =?utf-8?B?SVhiVXV4OHAyVVlxaFFPaDZLOHNVbWNlanhiZzdtQjJTeXVGRk9BcUszZmxX?=
 =?utf-8?B?RkdNS2hreGE2ejNhN3JlZXA0cG5nenhhZjZYWWd0L1B6d3BvS05qNDUydnNa?=
 =?utf-8?B?WlRRYkVqcU93TTFQUXE1a3M4NXlBMzU2SWNEN3l5eWFEVCtiNmJlTm5XQ0c3?=
 =?utf-8?B?V05mZ3RYWHluRUN3RnNwTklyQTlVeE4wTDJJS2VXNnp5NFpDRXY0UE1Ta01S?=
 =?utf-8?B?ZVdjRlY0Q2g4YVRjcml1blp2NVNSZ1pJamVwT0pFcnVPbmtXbEtRLzFxSkxr?=
 =?utf-8?B?cVpOVDZzamZpR0hnLzBFbno4MnlxR2NHWTk3QlhxLzdnSDdVOVlYU3cwSHph?=
 =?utf-8?B?YzVBZTVEOVF0VGVCbUNGd1RnazZscHhqcWdpQlB5QVUyd2YzOGo5aUxUUXBm?=
 =?utf-8?B?cC95L2tma1JRb3FmSjU4cloxSVF4bW9CM2lpaXpzTmZuTWNOa2xUcDBsaE1T?=
 =?utf-8?B?eGllTHQvUS9UeHl1ZWNlZ2NhYXVFVGpMR2k0bkk3OU5DVTVKVTh0WmljMjI5?=
 =?utf-8?B?WFYyc2c1RE9OU0RlM1hscEdnM29yWEcwa2tMMmZtdExUNDl0dWhTSHNEZXVu?=
 =?utf-8?B?N0ZkT0hkM3QxeHFJaVExbkFSQXVTM3BIWXJ4RysrSVpBNmIzbkQxaWZwemtF?=
 =?utf-8?B?dHRGRDdNUytiZ1djSkpiNWZIeUtDb1MvTE1Ya3FjRkYzZE5SdURQNnEvNGJB?=
 =?utf-8?B?QkdpL25MVXdrRTVXSm9NZ0VyOXoxeUpjUy9HcHo0RkhIbXQvZCtuTUpINE1V?=
 =?utf-8?B?V0c0cURKcjYrbVJMK2dHV2Z0VW1aWmd4b1FFaWw3OWdVVWZ5K3RQSDdRMVRm?=
 =?utf-8?B?Q0pJRklVeWJqYzFkQiszcVg3dW5lekMwMjhxR0JBdG8zdGREUjE4THlScFpC?=
 =?utf-8?B?QW5tQ0cvL25xdDVGT1hrUjBzTCtkQW0wVWFYSVl5cFd6UlZJTmNZbzAxdWtn?=
 =?utf-8?Q?tVM47BBwGNs7T23zTAv1Nd/b7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D261E8AC703654A961C4433143AC8B3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2c95a1-6474-4533-1b6c-08dcfc80406c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 03:24:54.6429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d6YpYGPin4NMar/7EZrbKv9gR/BxL3XvOATvtrUwFvU/vVGS0wia8rePyOFZ3bgjI+IeqQ9FcvVUVtX+LexKdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7711
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.551000-8.000000
X-TMASE-MatchedRID: VPleTT1nwdRm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYG22
	e6GsqEr82KZvSbusf6rE7R5+4LNubM2Q7FOLzb9yXbTfocfAWb/t/okBLaEo+HaMP8m6qk6S0p6
	6g4/WVujArQXEdIyvR43/d0NuPcI1X0z21W/hDiy5PNqdvNvYVwreImldQ5BDyWCL+8tLbvb9kt
	CFFjP4beLzNWBegCW2PZex/kxUIHW3sNbcHjySQd0H8LFZNFG7bkV4e2xSge68QJY+tFqXeVlDu
	q6zPKC+H0ivmO4ijl8c0gdYWsjpqV8I4oUq5Vga
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.551000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	3B14FB8C59A681E422E63819F1813E64EA1082A1929E6C82E82850A6671A84B42000:8

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBWNEwyIHZpZGVvIGludGVyZmFj
ZSBhbmQgZmVhdHVyZSBtYW5hZ2VtZW50IGZvciB0aGUNCj4gTWVkaWFUZWsgSVNQN3ggQ0FNU1lT
LiBUaGVzZSBpbnRlcmZhY2VzIGluY2x1ZGUgdmFyaW91cyBmdW5jdGlvbmFsaXRpZXMsDQo+IHN1
Y2ggYXMgdmlkZW8gb3BlcmF0aW9uIGluaXRpYWxpemF0aW9uIGFuZCByZWdpc3RyYXRpb24uIFRo
ZXkgYWxzbw0KPiBtYW5hZ2UgTWVkaWFUZWstc3BlY2lmaWMgZm9ybWF0cyBhbmQgaGFuZGxlIGJ1
ZmZlcnMgZm9yIE1lZGlhVGVrIGNhbWVyYQ0KPiB2aWRlbyBkZXZpY2VzLiBUaGlzIGludGVncmF0
ZXMgQ0FNU1lTIGZ1bmN0aW9uYWxpdGllcyB0byBiZSBjb21wYXRpYmxlDQo+IHdpdGggdGhlIFY0
TDIgZnJhbWV3b3JrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5nIDxTaHUt
aHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKw0KPiArc3Rh
dGljIHZvaWQgbXRrX2NhbV9maWxsX2V4dF9mbXRkZXNjKHN0cnVjdCB2NGwyX2ZtdGRlc2MgKmZt
dCkNCj4gK3sNCj4gKwljb25zdCBjaGFyICpkZXNjciA9IE5VTEw7DQo+ICsJY29uc3QgdW5zaWdu
ZWQgaW50IHN6ID0gc2l6ZW9mKGZtdC0+ZGVzY3JpcHRpb24pOw0KPiArDQo+ICsJc3dpdGNoIChm
bXQtPnBpeGVsZm9ybWF0KSB7DQo+ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJU1BfU0JHR1I4Og0K
PiArCQlkZXNjciA9ICI4LWJpdCBCYXllciBCR0dSIE1USVNQIFBhY2tlZCI7DQoNClY0TDJfUElY
X0ZNVF9QSVNQX0NPTVAxX1JHR0IgaXMgYSBSYXNwYmVycnkgUGkgZm9ybWF0LCBhbmQgaXRzIGZt
dGRlc2MgaXMgZmlsbGVkIGluIHY0bF9maWxsX2ZtdGRlc2MoKS4NClNvIG1vdmUgdGhlc2UgZmls
bCBjb2RlIGludG8gdjRsX2ZpbGxfZm10ZGVzYygpLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArCQli
cmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TR0JSRzg6DQo+ICsJCWRlc2NyID0g
IjgtYml0IEJheWVyIEdCUkcgTVRJU1AgUGFja2VkIjsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBW
NEwyX1BJWF9GTVRfTVRJU1BfU0dSQkc4Og0KPiArCQlkZXNjciA9ICI4LWJpdCBCYXllciBHUkJH
IE1USVNQIFBhY2tlZCI7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgVjRMMl9QSVhfRk1UX01USVNQ
X1NSR0dCODoNCj4gKwkJZGVzY3IgPSAiOC1iaXQgQmF5ZXIgUkdHQiBNVElTUCBQYWNrZWQiOw0K
PiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TQkdHUjEwOg0KPiArCQlk
ZXNjciA9ICIxMC1iaXQgQmF5ZXIgQkdHUiBNVElTUCBQYWNrZWQiOw0KPiArCQlicmVhazsNCj4g
KwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TR0JSRzEwOg0KPiArCQlkZXNjciA9ICIxMC1iaXQg
QmF5ZXIgR0JSRyBNVElTUCBQYWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElY
X0ZNVF9NVElTUF9TR1JCRzEwOg0KPiArCQlkZXNjciA9ICIxMC1iaXQgQmF5ZXIgR1JCRyBNVElT
UCBQYWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TUkdH
QjEwOg0KPiArCQlkZXNjciA9ICIxMC1iaXQgQmF5ZXIgUkdHQiBNVElTUCBQYWNrZWQiOw0KPiAr
CQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TQkdHUjEyOg0KPiArCQlkZXNj
ciA9ICIxMi1iaXQgQmF5ZXIgQkdHUiBNVElTUCBQYWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwlj
YXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TR0JSRzEyOg0KPiArCQlkZXNjciA9ICIxMi1iaXQgQmF5
ZXIgR0JSRyBNVElTUCBQYWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZN
VF9NVElTUF9TR1JCRzEyOg0KPiArCQlkZXNjciA9ICIxMi1iaXQgQmF5ZXIgR1JCRyBNVElTUCBQ
YWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TUkdHQjEy
Og0KPiArCQlkZXNjciA9ICIxMi1iaXQgQmF5ZXIgUkdHQiBNVElTUCBQYWNrZWQiOw0KPiArCQli
cmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TQkdHUjE0Og0KPiArCQlkZXNjciA9
ICIxNC1iaXQgQmF5ZXIgQkdHUiBNVElTUCBQYWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNl
IFY0TDJfUElYX0ZNVF9NVElTUF9TR0JSRzE0Og0KPiArCQlkZXNjciA9ICIxNC1iaXQgQmF5ZXIg
R0JSRyBNVElTUCBQYWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9N
VElTUF9TR1JCRzE0Og0KPiArCQlkZXNjciA9ICIxNC1iaXQgQmF5ZXIgR1JCRyBNVElTUCBQYWNr
ZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TUkdHQjE0Og0K
PiArCQlkZXNjciA9ICIxNC1iaXQgQmF5ZXIgUkdHQiBNVElTUCBQYWNrZWQiOw0KPiArCQlicmVh
azsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TQkdHUjhGOg0KPiArCQlkZXNjciA9ICI4
LWJpdCBGdWxsLUcgQmF5ZXIgQkdHUiBQYWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0
TDJfUElYX0ZNVF9NVElTUF9TR0JSRzhGOg0KPiArCQlkZXNjciA9ICI4LWJpdCBGdWxsLUcgQmF5
ZXIgR0JSRyBQYWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElT
UF9TR1JCRzhGOg0KPiArCQlkZXNjciA9ICI4LWJpdCBGdWxsLUcgQmF5ZXIgR1JCRyBQYWNrZWQi
Ow0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TUkdHQjhGOg0KPiAr
CQlkZXNjciA9ICI4LWJpdCBGdWxsLUcgQmF5ZXIgUkdHQiBQYWNrZWQiOw0KPiArCQlicmVhazsN
Cj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TQkdHUjEwRjoNCj4gKwkJZGVzY3IgPSAiMTAt
Yml0IEZ1bGwtRyBCYXllciBCR0dSIFBhY2tlZCI7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgVjRM
Ml9QSVhfRk1UX01USVNQX1NHQlJHMTBGOg0KPiArCQlkZXNjciA9ICIxMC1iaXQgRnVsbC1HIEJh
eWVyIEdCUkcgUGFja2VkIjsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJ
U1BfU0dSQkcxMEY6DQo+ICsJCWRlc2NyID0gIjEwLWJpdCBGdWxsLUcgQmF5ZXIgR1JCRyBQYWNr
ZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TUkdHQjEwRjoN
Cj4gKwkJZGVzY3IgPSAiMTAtYml0IEZ1bGwtRyBCYXllciBSR0dCIFBhY2tlZCI7DQo+ICsJCWJy
ZWFrOw0KPiArCWNhc2UgVjRMMl9QSVhfRk1UX01USVNQX1NCR0dSMTJGOg0KPiArCQlkZXNjciA9
ICIxMi1iaXQgRnVsbC1HIEJheWVyIEJHR1IgUGFja2VkIjsNCj4gKwkJYnJlYWs7DQo+ICsJY2Fz
ZSBWNEwyX1BJWF9GTVRfTVRJU1BfU0dCUkcxMkY6DQo+ICsJCWRlc2NyID0gIjEyLWJpdCBGdWxs
LUcgQmF5ZXIgR0JSRyBQYWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZN
VF9NVElTUF9TR1JCRzEyRjoNCj4gKwkJZGVzY3IgPSAiMTItYml0IEZ1bGwtRyBCYXllciBHUkJH
IFBhY2tlZCI7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgVjRMMl9QSVhfRk1UX01USVNQX1NSR0dC
MTJGOg0KPiArCQlkZXNjciA9ICIxMi1iaXQgRnVsbC1HIEJheWVyIFJHR0IgUGFja2VkIjsNCj4g
KwkJYnJlYWs7DQo+ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJU1BfU0JHR1IxNEY6DQo+ICsJCWRl
c2NyID0gIjE0LWJpdCBGdWxsLUcgQmF5ZXIgQkdHUiBQYWNrZWQiOw0KPiArCQlicmVhazsNCj4g
KwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9TR0JSRzE0RjoNCj4gKwkJZGVzY3IgPSAiMTQtYml0
IEZ1bGwtRyBCYXllciBHQlJHIFBhY2tlZCI7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgVjRMMl9Q
SVhfRk1UX01USVNQX1NHUkJHMTRGOg0KPiArCQlkZXNjciA9ICIxNC1iaXQgRnVsbC1HIEJheWVy
IEdSQkcgUGFja2VkIjsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJU1Bf
U1JHR0IxNEY6DQo+ICsJCWRlc2NyID0gIjE0LWJpdCBGdWxsLUcgQmF5ZXIgUkdHQiBQYWNrZWQi
Ow0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9OVjEyXzEwUDoNCj4g
KwkJZGVzY3IgPSAiWS9DYkNyIDQ6MjowIDEwIGJpdHMgcGFja2VkIjsNCj4gKwkJYnJlYWs7DQo+
ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJU1BfTlYyMV8xMFA6DQo+ICsJCWRlc2NyID0gIlkvQ3JD
YiA0OjI6MCAxMCBiaXRzIHBhY2tlZCI7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgVjRMMl9QSVhf
Rk1UX01USVNQX05WMTZfMTBQOg0KPiArCQlkZXNjciA9ICJZL0NiQ3IgNDoyOjIgMTAgYml0cyBw
YWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9OVjYxXzEw
UDoNCj4gKwkJZGVzY3IgPSAiWS9DckNiIDQ6MjoyIDEwIGJpdHMgcGFja2VkIjsNCj4gKwkJYnJl
YWs7DQo+ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJU1BfWVVZVjEwUDoNCj4gKwkJZGVzY3IgPSAi
WVVZViA0OjI6MiAxMCBiaXRzIHBhY2tlZCI7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgVjRMMl9Q
SVhfRk1UX01USVNQX1lWWVUxMFA6DQo+ICsJCWRlc2NyID0gIllWWVUgNDoyOjIgMTAgYml0cyBw
YWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9VWVZZMTBQ
Og0KPiArCQlkZXNjciA9ICJVWVZZIDQ6MjoyIDEwIGJpdHMgcGFja2VkIjsNCj4gKwkJYnJlYWs7
DQo+ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJU1BfVllVWTEwUDoNCj4gKwkJZGVzY3IgPSAiVllV
WSA0OjI6MiAxMCBiaXRzIHBhY2tlZCI7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgVjRMMl9QSVhf
Rk1UX01USVNQX05WMTJfMTJQOg0KPiArCQlkZXNjciA9ICJZL0NiQ3IgNDoyOjAgMTIgYml0cyBw
YWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9OVjIxXzEy
UDoNCj4gKwkJZGVzY3IgPSAiWS9DckNiIDQ6MjowIDEyIGJpdHMgcGFja2VkIjsNCj4gKwkJYnJl
YWs7DQo+ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJU1BfTlYxNl8xMlA6DQo+ICsJCWRlc2NyID0g
IlkvQ2JDciA0OjI6MiAxMiBiaXRzIHBhY2tlZCI7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgVjRM
Ml9QSVhfRk1UX01USVNQX05WNjFfMTJQOg0KPiArCQlkZXNjciA9ICJZL0NyQ2IgNDoyOjIgMTIg
Yml0cyBwYWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9Z
VVlWMTJQOg0KPiArCQlkZXNjciA9ICJZVVlWIDQ6MjoyIDEyIGJpdHMgcGFja2VkIjsNCj4gKwkJ
YnJlYWs7DQo+ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJU1BfWVZZVTEyUDoNCj4gKwkJZGVzY3Ig
PSAiWVZZVSA0OjI6MiAxMiBiaXRzIHBhY2tlZCI7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgVjRM
Ml9QSVhfRk1UX01USVNQX1VZVlkxMlA6DQo+ICsJCWRlc2NyID0gIlVZVlkgNDoyOjIgMTIgYml0
cyBwYWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9WWVVZ
MTJQOg0KPiArCQlkZXNjciA9ICJWWVVZIDQ6MjoyIDEyIGJpdHMgcGFja2VkIjsNCj4gKwkJYnJl
YWs7DQo+ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJU1BfTlYxMl9VRkJDOg0KPiArCQlkZXNjciA9
ICJZQ2JDciA0MjAgOCBiaXRzIGNvbXByZXNzIjsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBWNEwy
X1BJWF9GTVRfTVRJU1BfTlYyMV9VRkJDOg0KPiArCQlkZXNjciA9ICJZQ3JDYiA0MjAgOCBiaXRz
IGNvbXByZXNzIjsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJU1BfTlYx
Ml8xMF9VRkJDOg0KPiArCQlkZXNjciA9ICJZQ2JDciA0MjAgMTAgYml0cyBjb21wcmVzcyI7DQo+
ICsJCWJyZWFrOw0KPiArCWNhc2UgVjRMMl9QSVhfRk1UX01USVNQX05WMjFfMTBfVUZCQzoNCj4g
KwkJZGVzY3IgPSAiWUNyQ2IgNDIwIDEwIGJpdHMgY29tcHJlc3MiOw0KPiArCQlicmVhazsNCj4g
KwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9OVjEyXzEyX1VGQkM6DQo+ICsJCWRlc2NyID0gIllD
YkNyIDQyMCAxMiBiaXRzIGNvbXByZXNzIjsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBWNEwyX1BJ
WF9GTVRfTVRJU1BfTlYyMV8xMl9VRkJDOg0KPiArCQlkZXNjciA9ICJZQ3JDYiA0MjAgMTIgYml0
cyBjb21wcmVzcyI7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgVjRMMl9QSVhfRk1UX01USVNQX0JB
WUVSOF9VRkJDOg0KPiArCQlkZXNjciA9ICJSQVcgOCBiaXRzIGNvbXByZXNzIjsNCj4gKwkJYnJl
YWs7DQo+ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJU1BfQkFZRVIxMF9VRkJDOg0KPiArCQlkZXNj
ciA9ICJSQVcgMTAgYml0cyBjb21wcmVzcyI7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgVjRMMl9Q
SVhfRk1UX01USVNQX0JBWUVSMTJfVUZCQzoNCj4gKwkJZGVzY3IgPSAiUkFXIDEyIGJpdHMgY29t
cHJlc3MiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZNVF9NVElTUF9CQVlFUjE0
X1VGQkM6DQo+ICsJCWRlc2NyID0gIlJBVyAxNCBiaXRzIGNvbXByZXNzIjsNCj4gKwkJYnJlYWs7
DQo+ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJU1BfU0dSQjhGOg0KPiArCQlkZXNjciA9ICI4LWJp
dCAzIHBsYW5lIEdSQiBQYWNrZWQiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfUElYX0ZN
VF9NVElTUF9TR1JCMTBGOg0KPiArCQlkZXNjciA9ICIxMC1iaXQgMyBwbGFuZSBHUkIgUGFja2Vk
IjsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBWNEwyX1BJWF9GTVRfTVRJU1BfU0dSQjEyRjoNCj4g
KwkJZGVzY3IgPSAiMTItYml0IDMgcGxhbmUgR1JCIFBhY2tlZCI7DQo+ICsJCWJyZWFrOw0KPiAr
CWNhc2UgVjRMMl9NRVRBX0ZNVF9NVElTUF9QQVJBTVM6DQo+ICsJCWRlc2NyID0gIk1USyBJU1Ag
VHVuaW5nIE1ldGFkYXRhIjsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBWNEwyX01FVEFfRk1UX01U
SVNQXzNBOg0KPiArCQlkZXNjciA9ICJNVEsgM0EgU3RhdGlzdGljcyI7DQo+ICsJCWJyZWFrOw0K
PiArCWNhc2UgVjRMMl9NRVRBX0ZNVF9NVElTUF9BRjoNCj4gKwkJZGVzY3IgPSAiTVRLIEFGIFN0
YXRpc3RpY3MiOw0KPiArCQlicmVhazsNCj4gKwljYXNlIFY0TDJfTUVUQV9GTVRfTVRJU1BfTENT
Og0KPiArCQlkZXNjciA9ICJNVEsgTENTIFN0YXRpc3RpY3MiOw0KPiArCQlicmVhazsNCj4gKwlj
YXNlIFY0TDJfTUVUQV9GTVRfTVRJU1BfTE1WOg0KPiArCQlkZXNjciA9ICJNVEsgTE1WIFN0YXRp
c3RpY3MiOw0KPiArCQlicmVhazsNCj4gKwlkZWZhdWx0Og0KPiArCQlkZXNjciA9IE5VTEw7DQo+
ICsJCWJyZWFrOw0KPiArCX0NCj4gKw0KPiArCWlmIChkZXNjcikNCj4gKwkJV0FSTl9PTihzdHJz
Y3B5KGZtdC0+ZGVzY3JpcHRpb24sIGRlc2NyLCBzeikgPCAwKTsNCj4gK30NCj4gKw0K

