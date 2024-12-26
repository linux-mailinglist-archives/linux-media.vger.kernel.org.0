Return-Path: <linux-media+bounces-24090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B70049FC8D4
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 07:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16D3E1882CA3
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 06:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3AB15DBAE;
	Thu, 26 Dec 2024 06:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HBBT5/HS";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Ko1xk0Oi"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2354A14A0A4;
	Thu, 26 Dec 2024 06:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735193398; cv=fail; b=C2WPfA43ExZoC9AsBL0T8UH5WFL0yVYFQpZ/iteQp5YiUI3i7ct894zefo24JGTdlZixvfLzHDCIsoxVTk3IHUCy8HsnER10dH7NbDvXl3utjrsrEcIMXVNcwO+lPlGin3UJDwT1cfhL6MSbPjEiB9Ymv1l3TJTCZX3GW+MWHIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735193398; c=relaxed/simple;
	bh=gXPd4zS/16vy/bInEUQwZf8jN6vyJ931q9gBjqEOtkA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gY4JwRHsVNwW5UfROyIO1cdvgMGdhY73uOY5ipmJP6e1Y6+4z5vN62hNc4/fKnsXaz/J/+XCaV77MZ7IaoaNQROgmJxSNA6KwkuSqJ/YseHQDNH/wh2BjAoTgc3w82Ud32eAtDMQtS0UGjNz/Uinwb2V2ctjo+/UAIQjAunDC9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=HBBT5/HS; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Ko1xk0Oi; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 04cdc9c8c35011ef99858b75a2457dd9-20241226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=gXPd4zS/16vy/bInEUQwZf8jN6vyJ931q9gBjqEOtkA=;
	b=HBBT5/HS5Q1j7GfQ1pqzix/TyR7ib8igs5jIZolZNUQxzTrhVmj6ZWaDF0MUyoPLhmti51BGEzp9Tg/llwoJtxKwKcog6JZFlVcmW768ZEDPIJ3wW4Dlujf1lbsch9xjycaI1YmNZrfLh+ESNhlPoz5Aw7Ag8Bj6eI/xY6dCVNY=;
X-CID-CACHE: Type:Local,Time:202412261320+08,HitQuantity:3
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:4a3cc115-11b0-4dd5-a9d4-18f1a359880d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:922c3625-8650-4337-bf57-045b64170f0c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 04cdc9c8c35011ef99858b75a2457dd9-20241226
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 439560208; Thu, 26 Dec 2024 14:09:51 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Dec 2024 14:09:50 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Dec 2024 14:09:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yv+2kxQMjSw1/EggGrNNtEgjIy/U1M6WQ8n21xql+AlnuxfiAYuV+aSwM74i3I3ht7d8IKhFqHNMm2Zoj2On42ZpZ4qDqKyIO3ki89xUh3op/Fq4fbr7IGAkzGE6VbkU+xC+RBiE9QZHCVOh4Es26q84ZKoTRcNDhbQIid4gzcK7M/UAxtOXfyrM364fek2pUbKkolqqR8F2sm8SZUjce4u3xjcKL/Jtu9RbxObrbz18G+S9T1wTkMWcEbcRtST/bsz0V9tOq6feBuLoE5iG/fUMv6dLzL5tF6lCAd/R1wd1AFB3DUu0RTPTVKnpSAdwxDyS4/ea7IjZ0vlvec/ovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXPd4zS/16vy/bInEUQwZf8jN6vyJ931q9gBjqEOtkA=;
 b=kWzcDKkUSmd+zHYxRZKCVR6/ZsyqdfBOm/7ga1en5Bwy60Vx7mby23NzYrDa37nJjDH2jO7LYMwBUWko6ZzuE2PrKhRyhBNcbDYXxn769Q0DU3H9QOgT4mWGWIMqQpWALHVFkczRMzu0m2YtBtrfB0VHYS6oo1pEdjuDp1xqONmkVjp6H9ud5akjuRKoB3qzHNTu3qIKsHgM+f2JRlYYuRPL4zinwjECS1FC+nF4wEliuLbUv2TAoysBTRMCoyAafEIVYMABTwmZsaGGNNs4nEL5OhhoRrISFQpfW/Cc73A8n43Ia4IdadOFgrdS+f+rQixEJrKn/Ic+zhii942gCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXPd4zS/16vy/bInEUQwZf8jN6vyJ931q9gBjqEOtkA=;
 b=Ko1xk0OiUCCy9qmNiOoAAqP/eLmbf1MmAP1Vu418W4I+l0hUYDSdYd6fVKN1iCoxL6bI4NhJYYTNx3JRtC57mTx6sF3kPy+RNq+rlHdVz3l05sf9mzupXDZ1DYWG+nc8ctY5jj3/uvg1pGQrvg+JvN/+m++PgjWyBEo9JUjp4vs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7671.apcprd03.prod.outlook.com (2603:1096:820:e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Thu, 26 Dec
 2024 06:09:48 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Thu, 26 Dec 2024
 06:09:48 +0000
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
Thread-Index: AQHbVqv2E/LiiDV3F0q0O1OD05OMm7L4DC+A
Date: Thu, 26 Dec 2024 06:09:48 +0000
Message-ID: <4875668285a6ef46ab8924899995b5d432b01647.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7671:EE_
x-ms-office365-filtering-correlation-id: 661227da-3c11-4e81-ed3c-08dd2573e6d6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MnY1MHRCak1ONWhaa0NOajJzb2Z0UjkzUkZ3czNrVVdlS2VBRzF1S05senZw?=
 =?utf-8?B?ZkJZNHJDQ3UwL0dRWWxyYWRZdVQ3Y1RDRjlWRGVPQWUvYWJXTDl1NDEyTHJt?=
 =?utf-8?B?RGEyS3VhdWRPMFFjUlpqa1FPS3M4TkMxMTlSZlhYUmhmUW04QloxL3VSMWxE?=
 =?utf-8?B?b0w1NlZRZWVta1BPRHlEb21ZNjRDakxJUWFya0pTZHljNDM2ajd6TElxK3VZ?=
 =?utf-8?B?cjlPcFkrbXNXU0dwNzRPSXY3NkVhbDJvelUxcWlHdEM0OXc2Q3ZBalY2TWZI?=
 =?utf-8?B?SVY2WWsvQnNzZWFNWERMeTFjajRWWDlUSGhyUC9WaWowZ2U0bCtkMTZwd2tx?=
 =?utf-8?B?TWZVQmNuRkkxdUdwbHBsM2JvUkZFNng4dVlYSGVaQkFaNFBCcHdqek9NdWEv?=
 =?utf-8?B?bjMwK1NKZnZpc0dkOWkzQ0RxQ3A2LzgvbVBvb3VzaklJUnhQV0Rjb29OQUZC?=
 =?utf-8?B?cUxHWmFTWlFXWEpYN3VvZW4xYkdidERMTnh5cWlHSUQ2MzFtUmVJTHBwYTA0?=
 =?utf-8?B?b2hYNTFTQ29XemJDbHlRenVibFFiUDlKVUtNK29YY0ZDMDhZVytMaUtNZm1X?=
 =?utf-8?B?UUxnc01JbTBQS25Wam1teExBNTdvMXU2VWFEUk1uRHNJcDZ2UkVjQ1ZqRmRQ?=
 =?utf-8?B?K0w1czNKLzZDYWNiNmI2YlV6Q01pVDR2OElkMTltS1M2TnBraFovaXZQcjZo?=
 =?utf-8?B?ajFsUkVRUDRhZXdvM1FFUGt6R0JzL3R3RmYrTUNzMzVPSVlwSWdxTE5Cd3RQ?=
 =?utf-8?B?Q3ZmeE4wU3FhOWNXbmozUnA1Q29EYjBjdUpRbXJ6Y1ZNemdpeXM1N1BiYXc4?=
 =?utf-8?B?TklIYW5xdzM3SCsxT3B0N3RaUUJZN3JPMG1VTzdVYkVxM0ZvWEgwM1M1Y3Fy?=
 =?utf-8?B?b1h3UUFXMGVuM2JpTHorWXFrQW15ZVExRzNjTkFpUUZHQ1lyNVp2b0RrRW0v?=
 =?utf-8?B?VjJVVXJwd2Z3dktvMDQycVhrNkRhSm1HeUdsendrSEN3NDZKR1RvUTJqVXpT?=
 =?utf-8?B?TzM4Q2s3QUdvSXhpcVBHbCtQN0tYZ3B1OFBmVEN0TmtBNHFRMDRETXMxQ0Fi?=
 =?utf-8?B?cFZDMGRzSUVqYkxsNWJ5Sm9HcWs0WWZ2djd2VUV3SGs4aFRYcnNSclhGaitw?=
 =?utf-8?B?ZDAxTjdTak1rU0FFMlBrUDBPZVBvbm9tbDA3WGNBa1VmQ2lCWjhYWEg4Q0Ix?=
 =?utf-8?B?RjJFcU53aTcwaUxMb2c5T0V4cVJLaXNCSlZUTGZsWU9qWS9jS2RLQ3BKTUhH?=
 =?utf-8?B?Q0U4RWNoaUZpNEFpYUYyL0s1M25lc2ExWktSK1JvUUgyckdXRlIwam42WVJz?=
 =?utf-8?B?Ym5vZGsyeHVyVi92RFM5QnFvSk5IekFGTlpHVXpZNWpGMVovS2ZyblQrajdJ?=
 =?utf-8?B?bWZubXVZcmdtK2hrcWlSQ2pxTEdjSVlpcUZReUFHK01RdFF4YWU1MnNLRWFn?=
 =?utf-8?B?ZDFDVk51eXNwY29hZVduVnFKZzdxYnBtUEdiWFRxOEVROGNDSXRCcXJSd2VK?=
 =?utf-8?B?UnNlVDlHV1pFZ1VTUG1rZ3FyVUhFKzY3SmlVK1VzQS85Z1IraVlGMHFBWHFp?=
 =?utf-8?B?bDRKNmNybC94RXJmRk1YMEI2TXlmSFdQRzN5amZJOUpDaDVSSE5hZFNkNDI3?=
 =?utf-8?B?QkJkYzFvZ3pLbnpFNDBiMHhiSTVxNlNBZi81K1p6aGNUT1RqS3pkOE9iTmM4?=
 =?utf-8?B?dm9ZeGxBbnpEOHJWQVdJbE5obTdaMWFSUGFKcGdqVi9scGJCMTVzYU42aWtX?=
 =?utf-8?B?eE1yYUgwMitKYjF0eFlubE1wV1pRWUhDbDZSbUJVR0w2SEU3QnRUVzZESmxV?=
 =?utf-8?B?YTlQMVQyOVNjVUlPV3R2NDdpRllvOFkrREJlS3VIdXFUMlVWSHIrLzNtVVcx?=
 =?utf-8?B?TXgwRTlES0xpSm9Ecm5tRWNKZDYyVW5Iem9tdEFHSm1RaDFsUlZwbjE4S1ZW?=
 =?utf-8?Q?RkCxbcb4+iRpolrPp8bxzej3vvG+C2cp?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlNVbkJpeEpxekNUZVIzcmRrMVNmTjZlRjJQODVjSXFkNzZOMWNTcURNa1dt?=
 =?utf-8?B?U3dzdzBQWHVjcUorcTczV0NWVlVjQktsbE40NUlyWi96blRyNUNNamt6a293?=
 =?utf-8?B?R1l3b3NnWEF5UkQxN3UxZUV3QkJmUDYvZHluQ0c5NlNCdkZDdjQ1M1pYbTZm?=
 =?utf-8?B?TkdtOTZac2pQejZjc0NtbkZCcHVHM2JhWEhDaG9odVROWXFDTlZVUVRTUkN6?=
 =?utf-8?B?NjMzbVJVSkMvbEtPS1BnSnp2T3k0UURPNVZGRnFGQmZPcTZJUCtoVFlhRnR5?=
 =?utf-8?B?TGNBeGJIbTM4cjVUNWlRWGV6enZCREdqNTZSVGpYREQ3RWIwNWx1YVM4WWNj?=
 =?utf-8?B?bWQwRjRGUmwvWHR5a0d0UmpaQWoxUGRhM25ITmRsTlBERFlLdXFFeURHOWJq?=
 =?utf-8?B?NTYvWmZVZ3F0ajBFU1NMSDlFR2N4azJJMllTRGdmV0lyVk15d3ZsVTAxWlk5?=
 =?utf-8?B?Y1hCUG5iSnM2ZTlDSWhrU052bkRUcmdIQU5nU3JBd3dGVGxDZHBSTDNNOVV0?=
 =?utf-8?B?N1Y4eUt2VEFPa0tIcGU4VXh6ckJRby9ZSHEvcGRkS01nekgvaFdHQWVEbSt3?=
 =?utf-8?B?ZXJRUzhOYStzQUtJVzFhQjJ2cy8xSUJMZWk3VkJUSDh1L0Vmc0N4SjN1Uk03?=
 =?utf-8?B?UU5Sakg0ZElPNVJEemUxTURtWTBqVlRYSGRtV2xPRXptQW82TlZaeFI1am9F?=
 =?utf-8?B?djhjQTN4STBkV2RMci9vRjh3SWxTbnFjdmlHY3ZJMG5JMnFKd2pkRDBLbmlh?=
 =?utf-8?B?UmNqS1NFVGFNQjdIY3pmMXg5MVBKNEx2WitiLzRpcmtIbVk1RXBxaFhER1dU?=
 =?utf-8?B?dmFhL283NVBubVdDTDhZUE0xTVlteW5tcVNTb0NwMldUVm5TSEcyMTJwTU8v?=
 =?utf-8?B?RmxGNG8wQWdiaHFLQklBaTA3eS9hVENKYzNhbkpTTU1EVkUzaHRub0QyNFBw?=
 =?utf-8?B?TGdqY3RBYW9YN09oSTVoNzIrNXJ1eUJjNWVseEhKS1h2YjVGODdqSHFMeFUy?=
 =?utf-8?B?dFh5RkljcjdadDVRODJVMEowSjhITUxTcWlJaXR2ZlVMQlJycEYyT3B4WTZa?=
 =?utf-8?B?SVdqRGt3NkJjMnRDTGM3bGljR1NLZFdEbEFOR01KeTlLSFhsUm5XQzg3aU9z?=
 =?utf-8?B?K0MwM1FqTHE1NTZ4ak1FMmhQQm8zMkRNRkF5YkV3cTV5TXhTVlFuenJrUHlv?=
 =?utf-8?B?MnhRbHI3ZThGSXNkVmc4ZkhNeXNwemZkenRwQjhyN1U4Sk9GTG94cWFHNTRh?=
 =?utf-8?B?SWhYRDJuWUQyajdrTDlwNHV4Yk50bTVhVG9mZzV3UFdFWmU3aUIyeGJ5dDA2?=
 =?utf-8?B?M29JSFNDM1NtZUh5WDRaWk01eDNxTk9vTlRPbndrYjduWlpyTlU5YlBYdG9x?=
 =?utf-8?B?UG4vc2tvT0RXN0xVQVRjYy9rNDdyZlBJbUVvQlQ1T0FEc0hnTlVRVEV4ZzlH?=
 =?utf-8?B?NmZnUkQ2SWtNNjZyZ0Q5R0hRZVNnL2tNQjI5NDU1UVNWMkFVSTU4elM5WUJI?=
 =?utf-8?B?aG1oQW5JVUJYQmVYa0NkRVNOZjFuYnkyaVViUTltY2lhK3ZiRm1hMkxqdnc1?=
 =?utf-8?B?UFRhQzlka3dKTzJNOENWNmtJWndUSzZUYTVkdzVlL3ljeG1uUTQ0c0NzbTNP?=
 =?utf-8?B?MG0zVlFYQUhybzdIVXRmRkdQbDBKTnBHMTVHOFlEVk1WV0ZHbFVhb3l5bFJD?=
 =?utf-8?B?MC9yMHQzcy9nZVoySlgvZDdSdklHQTZ1OUZaSzhXMW45T21FOGxmTnovRE1W?=
 =?utf-8?B?eWN0eHZBZkFMMUdFZ01NS010RHpwWTRyQmtBaEF5SnZLRU14cm5UbjMxbEhH?=
 =?utf-8?B?SlBIOGxzQ1VvSCt6LzJmT2FRUjUvZmo5Y05Ib3BVSHBzKzZQTitoVFRoQUNj?=
 =?utf-8?B?aTZMQk9UcTRSeHRBVG9RM3ZLWDBiRWFnMFF5TDNYT1lMUzZEd3h6OWU5bkVl?=
 =?utf-8?B?ZFErcnlIVlRwMHhSUGxySFM2c0ZSUE1ncjExd3JYd2tyRXRxY01Wdk5FYzBQ?=
 =?utf-8?B?WjRXaWFtQVRleGZqSnJXbHJMZDRCTHFWZzdMQUJUeU51bXZHSVorL1kzYktn?=
 =?utf-8?B?NnVRZlNtWmdFYmZBdkQ3amxqaFdrUWhIUEw4bTVEdjFSN0M0UStOdEIwbTZs?=
 =?utf-8?Q?BHbHrokr2jdK+dBYVxEex7mWT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E2399F90C55134C9139071100D0C06C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 661227da-3c11-4e81-ed3c-08dd2573e6d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2024 06:09:48.0552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZjTaxeMsEkUlMhePFQr3bPWNKVBB+1o+d8u2VsLVo52+aT5RB5Bfsf8SHFQpd1Ei9L3TsZSUjK8z3ZAWoAJprA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7671

T24gV2VkLCAyMDI0LTEyLTI1IGF0IDE3OjAwICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBhIFY0TDIgc3ViLWRl
dmljZSBkcml2ZXIgZm9yIE1UODE4OCBBSUUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCbyBLb25n
IDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgY29u
c3QgdW5zaWduZWQgaW50IGZsZF9mYWNlX2luZm9fMFtGTERfTUFYX0ZSQU1FXSA9IHsNCj4gKwlG
TERfSU5GT18wX0ZBQ0VfMCwgRkxEX0lORk9fMF9GQUNFXzEsIEZMRF9JTkZPXzBfRkFDRV8yLA0K
PiArCUZMRF9JTkZPXzBfRkFDRV8zLCBGTERfSU5GT18wX0ZBQ0VfNCwgRkxEX0lORk9fMF9GQUNF
XzUsDQo+ICsJRkxEX0lORk9fMF9GQUNFXzYsIEZMRF9JTkZPXzBfRkFDRV83LCBGTERfSU5GT18w
X0ZBQ0VfOCwNCj4gKwlGTERfSU5GT18wX0ZBQ0VfOSwgRkxEX0lORk9fMF9GQUNFXzEwLCBGTERf
SU5GT18wX0ZBQ0VfMTEsDQo+ICsJRkxEX0lORk9fMF9GQUNFXzEyLCBGTERfSU5GT18wX0ZBQ0Vf
MTMsIEZMRF9JTkZPXzBfRkFDRV8xNA0KPiArfTsNCj4gKw0KPiArc3RhdGljIGNvbnN0IHVuc2ln
bmVkIGludCBmbGRfZmFjZV9pbmZvXzFbRkxEX01BWF9GUkFNRV0gPSB7DQo+ICsJRkxEX0lORk9f
MV9GQUNFXzAsIEZMRF9JTkZPXzFfRkFDRV8xLCBGTERfSU5GT18xX0ZBQ0VfMiwNCj4gKwlGTERf
SU5GT18xX0ZBQ0VfMywgRkxEX0lORk9fMV9GQUNFXzQsIEZMRF9JTkZPXzFfRkFDRV81LA0KPiAr
CUZMRF9JTkZPXzFfRkFDRV82LCBGTERfSU5GT18xX0ZBQ0VfNywgRkxEX0lORk9fMV9GQUNFXzgs
DQo+ICsJRkxEX0lORk9fMV9GQUNFXzksIEZMRF9JTkZPXzFfRkFDRV8xMCwgRkxEX0lORk9fMV9G
QUNFXzExLA0KPiArCUZMRF9JTkZPXzFfRkFDRV8xMiwgRkxEX0lORk9fMV9GQUNFXzEzLCBGTERf
SU5GT18xX0ZBQ0VfMTQNCj4gK307DQo+ICsNCj4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQg
ZmxkX2ZhY2VfaW5mb18yW0ZMRF9NQVhfRlJBTUVdID0gew0KPiArCUZMRF9JTkZPXzJfRkFDRV8w
LCBGTERfSU5GT18yX0ZBQ0VfMSwgRkxEX0lORk9fMl9GQUNFXzIsDQo+ICsJRkxEX0lORk9fMl9G
QUNFXzMsIEZMRF9JTkZPXzJfRkFDRV80LCBGTERfSU5GT18yX0ZBQ0VfNSwNCj4gKwlGTERfSU5G
T18yX0ZBQ0VfNiwgRkxEX0lORk9fMl9GQUNFXzcsIEZMRF9JTkZPXzJfRkFDRV84LA0KPiArCUZM
RF9JTkZPXzJfRkFDRV85LCBGTERfSU5GT18yX0ZBQ0VfMTAsIEZMRF9JTkZPXzJfRkFDRV8xMSwN
Cj4gKwlGTERfSU5GT18yX0ZBQ0VfMTIsIEZMRF9JTkZPXzJfRkFDRV8xMywgRkxEX0lORk9fMl9G
QUNFXzE0DQo+ICt9Ow0KDQpVc2UgYSBtYWNybyB0byByZXBsYWNlIHRoZXNlIGFycmF5Og0KDQoj
ZGVmaW5lIEZMRF9GQUNFX0lORk8obSwgbikgKDB4NDQwICsgMHg0ICogbSArIDB4YyAqIG4pDQoN
ClJlZ2FyZHMsDQpDSw0KDQo=

