Return-Path: <linux-media+bounces-21572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6889D2186
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 09:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB779B22754
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 08:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5788C19D064;
	Tue, 19 Nov 2024 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="O0TD6pMs";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="RSHXUBIX"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C66B19C54D;
	Tue, 19 Nov 2024 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732004605; cv=fail; b=L1JuWVHsXDhXHJBW9qhRShvKEyvRfsyQzeg1/WQXaLFQ27AA1EQgHZNuJhLetAMrLbTGFCXqljtBBNFWO3p1JGXEKmoLCzzKZRx/ovuVta/3+1SZU8lETXUcp6+XjKm4q2K3z97eQm9TtCbG+CuO+EUBahIKg7VPM1WO0Klf3wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732004605; c=relaxed/simple;
	bh=cMP6315SfKYiETN3iwCQx/qkhMCaG3PMGyT1RHunS/Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uZsxnwX2uWH3EPoeH3JR7xdCftsBVQrky17vUm8JdPtFGQN21FGo35wWU8M/+0wJQ5/dWS7sKnV7boT1ndGZ5OiItUctpQmqLkh1RgtzWY1aetYVTuQ84GbU9CS2KCyezWUxcYCLmH+92idTaLrT9pD+RWOiT0vnGUaTiRRaQjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=O0TD6pMs; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=RSHXUBIX; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 864a8ff4a64f11efbd192953cf12861f-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=cMP6315SfKYiETN3iwCQx/qkhMCaG3PMGyT1RHunS/Q=;
	b=O0TD6pMshib0Pv61sd4bKOALfQVR5/kv5YKRAjdTx2f6QAOQXOl/d2SqD0k6d7R6wxJoBwsR5YUBw9ULw+MaZudpAiiOdLjR+WEy3XGMCHqSTblqmPC4uv5ylYM8XkSV0CurpcN7Qf4XKA1XnCnOutHFM/naPahtgdEpqWtFKEw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:6475df13-6fe3-41e7-9072-1e90f2688660,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:75294a4f-a2ae-4b53-acd4-c3dc8f449198,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 864a8ff4a64f11efbd192953cf12861f-20241119
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 32578307; Tue, 19 Nov 2024 16:23:15 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Nov 2024 00:23:14 -0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Nov 2024 16:23:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQ9Kpkx0iB/MS1KXSUxR6PQy+Uy8Yby5Nynpu4qMk76Bbf7snIHB42Mx7ncl+6nNzdrN2lLphRifrEU6X7ivTQgj8lPGlcCS/dQUGvw1pUYVbqnGFXrjMbgz3yF3S99V53EFxSslvrJvCO8iyQRXbj27OIdFGU1FN8U4wldy1RpNv6h5ciGYD+UP9EeF+ihYrXiU8VEm0Q1nAjbaKkUCI3DeVIWxOlBY2eyPQkjfY+QXwjSXOsZ9Q1MLrqD9Q1xy+J3CsUJ0ToIldNXP0oDHhHjgbAYV+aQ7GmzaJ+EbkwlNvhCJyJIvt7aJpXc6oEJyIAlxOMzdp0v+9cpeFpEVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMP6315SfKYiETN3iwCQx/qkhMCaG3PMGyT1RHunS/Q=;
 b=Pv1xn+kbYe/MNCu13XoaV2PbT6ZnNRaM0NhX+VdoqWQ20ZFTCKiE658xs+zFFVboj9WM3De6GIi5mElmSGg+ZsX6Dcek6dkkTHepPuIkWF4xO/U5lhuVdKN8V86RBuwEvLKqoK1OOeHhkZzrnf9zhw7hbyvLwjKi+Yz2w/ZKFeoH3rtV81fz2PRZHnfpT/fhEe+hzhKQHTZmbyEAzvvV8G4kvcOacYLglqf/vqMJ/csm1rZAv7iwib4l6CiE8RzgTpcOAsO+X1kdN4jSuScsC48poZC84p6QERUjbEAM7Vz5zNTYpA2n0B2ibccc3Cl/Rzl0JrPcY/A+To4Yq/hQ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMP6315SfKYiETN3iwCQx/qkhMCaG3PMGyT1RHunS/Q=;
 b=RSHXUBIXrH9P0E22sgSGzDwt4cFSYpZHZaW0sHokyS+GEQqkY6q+9zjCtR79NN+ZTHo05Pgs8ioovL9hdu0e2R1uhVlkGsB/67r+P3XfBvvBrz9kH1/HitaIWIrVz4yIM0bbAFkKiWY3vZRP8c0H7yxt2d0KBN7pUnCipi8oW0s=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7721.apcprd03.prod.outlook.com (2603:1096:400:41f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Tue, 19 Nov
 2024 08:23:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Tue, 19 Nov 2024
 08:23:12 +0000
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
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbK+hA+A
Date: Tue, 19 Nov 2024 08:23:12 +0000
Message-ID: <70b8e4e450b46aa668500213f93c911ac64e5529.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7721:EE_
x-ms-office365-filtering-correlation-id: c169042d-b311-40fb-dd67-08dd08736891
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZzM3eFVWS2QvRFRsWFBPRWI2YW02QU45UExWK1hqRWNKcFgyeGVkTUFxV2pp?=
 =?utf-8?B?YytWWXpFYzh5a1FFMHNpZDZ2dUdSUSt4M21rUU5DSDBOR3hqYlN6OEdwbGhw?=
 =?utf-8?B?bkZTMjBDYTQxRVZOazc3TTFld1NjOHlaV1VVc3V6aG5pTzhLY3JmbU9mMnVE?=
 =?utf-8?B?RHdGMU9hWjBac281SlV6dEovbG11c2xPOWZZY1BjQTZYbWpKK0xvcEVMRDBB?=
 =?utf-8?B?SFhvT0VBcENMRzIyWlhOSWplZFY5bE9jMHc0YlltTkJBZW5UR0RlYS8zVzli?=
 =?utf-8?B?Tzdmdk9ZQlRiSTVVS205eW4zaFZzWnArWFg1UkY3eFZkRVcwL2xpZWFKUWtl?=
 =?utf-8?B?TnhuSTJQMTgvR2NhdHp2QmlHSGluSWJaYzNFbjd4K2wyUzRyOUJFUTR4cG5M?=
 =?utf-8?B?VityWnF1MmUvendVb3U4Q0NFWkpDY0xBdTZVVDVBTFlXelY0UUxQNGQwWUg3?=
 =?utf-8?B?MVFJamRhaFFleTJSWVE5WEIwRnhRTk5aQjRXTjlYcGZmZExTSkJ1bUFhZ3ZN?=
 =?utf-8?B?Nnk4TEF0cVY0UStQNE9hOExBcVRaWnMzWTFsaDdKVVl1WTU3bDRrOFM5NkJ3?=
 =?utf-8?B?MmNjVzhlY2ZFbXg5T0wwcTRjZ210RWUzZ0VzNTB1U3BQb0NYZmJTVmxWU1Fh?=
 =?utf-8?B?MUMwVXlTTUhnTjVaZUNpYmVVWmxJNzF1MXZYR09GZURkb3Nuak9xZXd4VGRz?=
 =?utf-8?B?V21OVzhJbkJJYW1HUG02VjFDQWRpRzNUNmhRQVF6QklONGN1K1Z3KzFYRFpU?=
 =?utf-8?B?dDF2VnhWRnpmbHRkVzM4SFhSRi94S3JzNS9KelRLWmlHYTFsUFE1b3BNaTFQ?=
 =?utf-8?B?OEZrZVNia2w0N0F4QzdnZXVseitKL0hTZnBkSkNmRHhQS1p3KytqRUIyemdj?=
 =?utf-8?B?Z0s4R0NkTi9ONEp2dlBpK2ZDL2E5ZGxnLy83eCs2YVl4cjhHQlQwM1pObWVE?=
 =?utf-8?B?MzZHQU9PekR2Wi9kZ2VPK3lkb1pnckR6YklQUGZPUmdqMFY0aEFzRnByMHh0?=
 =?utf-8?B?dXBoQSt6SDRmR0UyZE9GeWEzTWpyNnkvLzdNREMwWjZYU3FwdkQzMWxWRzd0?=
 =?utf-8?B?aFpVdThKZXF6ZTFpVThyYmNVVWxoTlRxb0NwMXpPaS9adU9OUTQ5UUNONzNj?=
 =?utf-8?B?T3dzQVo1c3JWcWhkVElvWS9rMld3NmxwREhxMldDa2oxWU5HVElmZHh6SENI?=
 =?utf-8?B?WEFxUDhpOGg2SnVOaGdpcjhNUzJQeGFzQzFEZTBCOWRKalRESEFheHdWTC9u?=
 =?utf-8?B?V0hEc0x4ZXpQRUllM0Q3RUpDZ1JHVG52NE9LNmpWemcxdzVIK0RwZjcxcGJL?=
 =?utf-8?B?cG9wRzVOTFQ2UHZybThHdHVRN2JHQ3VkQWJOL09lbkI0RmczalJMdWZ4Qjhz?=
 =?utf-8?B?VnRGWEJSYnVHWTNHZ0thNzhZdnNOdmhvbjBoelNYOW5EdHlaOHZGZC9TOXk4?=
 =?utf-8?B?KzMrTnZhMVdrVytrSlVFYnd6OHE4QUV0NVRrbFdTcWN0VXVxbkdNMGVHOGhP?=
 =?utf-8?B?bENsT0FjQmNveTF1bUtZczFLYzd4Qjdjc1NYdG5iY0orWm4wWGRBemd0TDhh?=
 =?utf-8?B?QlozUktoM1FCVVowc0h6UDRTUWJPbEVuUjAzMjgvSWNQdDN5YUdBdUVIWE5l?=
 =?utf-8?B?MnBDWTA1NWhBWXBiRXkzMUEyRGZqMzg3Y04yVUxuREdPa1lvSnREK0R4bHho?=
 =?utf-8?B?YTRZcEl3NHR1QVN6amx6VHZ3WXdySlVzV0hBcm1YMFMydExsSVVvVlZmS3Jx?=
 =?utf-8?B?YnZHY0NkOTNHWk0xYlZNd3ZjRnBOZW5lR3VrcUNXTVh1N2Y2TFliNGVGOTNF?=
 =?utf-8?Q?FsS8fpX92bQ7drE+xCYiyCtMfC6U5I6xyjx2Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TnVHZisxM2sxTFVBTURRTGlkbHptTWdqMnJKZGo2MXZEYmRrWVJ4SGFna1Fr?=
 =?utf-8?B?WW5LUzZtNi96ekVyUngvM0orc09wMEhzcUtUV2kzMlUyeUFhQnVMcjJ5blAw?=
 =?utf-8?B?NXEreXlEU041QnNqUmw0QVU0V0dpaHFlMVBzc1ZTWGxMSE9lY3gra2EvbE56?=
 =?utf-8?B?L1V2NmR5TjhxdExCYjBycDZ5L3h1Y1ZScjhFWTJiMUZEaE1rNUpCYVRwN3c0?=
 =?utf-8?B?S0ZJRW42TTZjc1dhWXlmWE5xN3NxeGZ4UVFyWDIwa0Z4ZEMzQ0UrRzZhazRO?=
 =?utf-8?B?YnZzaGVBL0VHUFEvYW5xR2pqaWRJSjRGY2lVZjFoL2ZaTUJ5ZnR0eHJrUSt3?=
 =?utf-8?B?Y0JNY1BoMDFYQVJPSXcxVXpoTEtIVEdOWnRYbnQ5UnhONnc0V1FxQXR1RGV2?=
 =?utf-8?B?WGh0YlBOdGhOWDAvYmt0ekFOUEF5OXkzMzkxTVQ0Z0trWmR2dy9zUlpvUmov?=
 =?utf-8?B?VjRIVWZVUUhSWTcrN2NjejlUTUZnSnB2UnI5aThNcExaL0YzNWQxd1FEZnpq?=
 =?utf-8?B?aUZkSGpNKzgwazhva0FXcG9QNWQzZGt0b3h1TjMrME9iWHZPMUREU1loOEdX?=
 =?utf-8?B?RG1hRHFpVDhoeDdxWmtWQ01aZlVhdml6TnIyU2FjOXJaNUdqNXZWQ2QyVS9r?=
 =?utf-8?B?blc1Z05UWUhvQUc5Z0ppc0RHb2RVdWxwdVVUTk16MHhoL2tyOTFxQWZUbWxM?=
 =?utf-8?B?ZE80V0FJM0RNb2FoWXR1dEIvSDZjQ2lVa3lhVGN6eVFJVG1wWTR6ZlJRSmI2?=
 =?utf-8?B?aWhlZFNMenAzcDRkR1VsMFIrMGREcVlEaTVwalFnek9IdmNra3BGZklRUTFq?=
 =?utf-8?B?NXlJTTVFRDB6QVJydHgxNklyNDNURHhqLzBEY2I4enlUNVlOS2hhVEJBVjZH?=
 =?utf-8?B?d21zTTA0eUdrNENJSFY0bHViTFhPbEZkT2FVMktPczBaMllUNjl0N2RNc3h6?=
 =?utf-8?B?THJUUTU2bVd4a3daMzYxdmV5cUpUMkpVN2xSWXIrY1pweDU3ODVUVzI0dkZD?=
 =?utf-8?B?eGllOEM5ZTIraG5ydzBac2o2UzVGd01qbk9rbG9SaEpLRk9OKy9XMGVsakkw?=
 =?utf-8?B?UE0wQXhOUWlkK0phZ3ZjWXJWRElKWFkrclJQZStNNlI3bmswZDhMKzRkMVUv?=
 =?utf-8?B?MTZVS3pjaFdKTjM5M2x0cUtNMkFXWnNOa1YyVlhjQlJvU0wzNUp3YnMvTi9y?=
 =?utf-8?B?c0o1QzkyM1VHcS9UNkRidW1rUVlCbGNXc0pWblFZdWVaUHlZK1ozeXB3Nm9J?=
 =?utf-8?B?K1cwbW00K1hRb21jdy9Wck5aSktoWW9PSDFZU01SRVNEYzNNVm9FOVUyWTFL?=
 =?utf-8?B?SUQ2dEpBVWFTaEtqTnc3cWtHSmI3cm5hWW1nTDRQZjZURU92Skd2dHlaeERE?=
 =?utf-8?B?Rk10TXNMcXEvbGV5ajNVRlN2UUxkVkw2eGVZSldKWTVXUnIrVGRZRVdPd3VF?=
 =?utf-8?B?di9sN3hwLy9OaUVxYmtyQTJrMWFCVysxT0xENHcwWENsVFlzeUpEMHdNalZk?=
 =?utf-8?B?RzNpRkJNY1BsTk1QK2IvT2lSa2srT1poWEJrYmlJeXpNTzFKOWpCV3dOZ0FP?=
 =?utf-8?B?QkZ3bGJlWlhqM0g2RWJIUzhGbFV2enMzN0VJYXcwUytPTFo2RXFiQTQrbXox?=
 =?utf-8?B?VThrMHY5TTgyM3YxV0tJRFhQU25YNTFmS1VVOVg2MWszWm9vVCthMlpJUkdl?=
 =?utf-8?B?QWJoSmh2R205ZFZNLzFUZjBwS0xnTGFaSjFxTmJGTFluQVhmV2d0aHkwa1ls?=
 =?utf-8?B?bEZORm5sMExzbGU1SEtTMkVQVFJ5bjlSVFQzbVNPczFORGxKN1JFZExPODVa?=
 =?utf-8?B?WXJHTmxaNzRjS244OU9ORWVVbWIxODFmakRWNEFweUlvb0x4U0VuYURqaWxp?=
 =?utf-8?B?VXo2NWpMUGtWRTVoc1RSWUpmR0R4blYySGVxcm5WSnI0SjRPSU9waFZkNHo4?=
 =?utf-8?B?OUZGMVZMTC8zSmR0eFlrdThuRXBNVGJqSk1qRGtmVkg2NFI4NnJCZ3BIRlJK?=
 =?utf-8?B?R0llb3JSakNWTU1YcDFKQXhhTU9pNG9Ca1BhWVREaU5DMlNYdll6aHE3azNp?=
 =?utf-8?B?ekNmL1p5K2wwZlRmck9ERmRKTEhZbm00U24rSE1LSTZJcmUwYTJnMnBLQnZh?=
 =?utf-8?Q?/Pp2zjB37YPIxQL/X/BMi9hKv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDF3A439FCA6C74F9EDD63CA996CE193@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c169042d-b311-40fb-dd67-08dd08736891
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 08:23:12.4691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hV4rvOiDqxE+SlKdyDovdHhi1cB2KaiSL0hrnlc2ZJSMWNWjTfRiW3PQAuvod1HYoeUE+Y6G+ZQ3LL/NUo+XVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7721

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gK3N0
cnVjdCBtdGtjYW1faXBpX2NvbmZpZ19wYXJhbSB7DQo+ICsJdTgJZmxhZ3M7DQo+ICsJc3RydWN0
IG10a2NhbV9pcGlfaW5wdXRfcGFyYW0JaW5wdXQ7DQo+ICsJdTgJbl9tYXBzOw0KDQpEcml2ZXIg
YWx3YXlzIHNldCBuX21hcHMgPSAxLCB3aGVuIHdvdWxkIGl0IGJlIG90aGVyIHZhbHVlPw0KSWYg
aXQgaXMgYWx3YXlzIDEsIGRyb3AgaXQgYW5kIGxldCBmaXJtd2FyZSBqdXN0IHN1cHBvcnQgMS4N
Cg0KPiArCS8qIG1heGltdW0gIyBvZiBwaXBlcyBwZXIgc3RyZWFtICovDQo+ICsJc3RydWN0IG10
a2NhbV9pcGlfaHdfbWFwcGluZyBtYXBzWzZdOw0KPiArCS8qIHN1Yl9yYXRpbzo4LCB2YWxpZCBu
dW1iZXI6IDggKi8NCj4gKwl1MTYJdmFsaWRfbnVtYmVyc1tNVEtDQU1fSVBJX0ZCQ1hfTEFTVF07
DQoNCnZhbGlkX251bWJlcnMgaXMgdXNlbGVzcywgc28gZHJvcCBpdC4NCg0KUmVnYXJkcywNCkNL
DQoNCj4gKwl1OAlzd19mZWF0dXJlOw0KPiArfSBfX3BhY2tlZDsNCj4gKw0KDQo=

