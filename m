Return-Path: <linux-media+bounces-21789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3861A9D5B24
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB6DA28328F
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 08:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0EF18A6C8;
	Fri, 22 Nov 2024 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="B5xGt4Aa";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="OhNq8UX8"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D80165EE6;
	Fri, 22 Nov 2024 08:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732264912; cv=fail; b=h/gAwcu1mswKzxiCzm8iIg5L2XluxYT/r8CMOnLW3NlOOz4fXb17WYcilNHIl4CJsHfCT0XAX8qbHn7tWW98YJQZsDdihjk8JnAoC3GAHL6XN8KKxQCOfJtE9TlY91luqa9dkTtEUSHHwJ04SC+oFpL+EVWSLQODVKaC61ABqvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732264912; c=relaxed/simple;
	bh=NeL9jT5ygx8wnN3CyttV3X3XXzF7wRQRZSIB526QbRU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LssmCmfRMD8al+tAGOGAlkgHrCYv3A/Nxti8SUJdDfTT57Fj7F/AXDpbrcenyVKfo20x6fKKW5R/aIu2rb3L7QohEHVCmNNMtdJ7R2CxlgsctUvj5/ZSc6rbXMIItWIcxSBafZmvb1xTBdumb7cMtjdRbkns12bvwXtuGIocp5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=B5xGt4Aa; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=OhNq8UX8; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 965f7faca8ad11ef99858b75a2457dd9-20241122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=NeL9jT5ygx8wnN3CyttV3X3XXzF7wRQRZSIB526QbRU=;
	b=B5xGt4AadQTFcRSBVjXWmB23Xl8l4jcVtr/StUnpGqkRcNqT9CGAE2A1qJC6Ewf08XpwT5cTw3ggkqzgFWHadYshJQ2qHdTNf2dzE779hsyxCd2IiOQrgqUHM7jDcnEg3xclMn6XseqdxUARMoGJgPdfNZ+oJfSK80Qh/uikQko=;
X-CID-CACHE: Type:Local,Time:202411221554+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:cde3e0af-4cdc-4328-b272-3a04b63c4ab0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:9b13e9fe-58af-4a77-b036-41f515d81476,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 965f7faca8ad11ef99858b75a2457dd9-20241122
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 955795995; Fri, 22 Nov 2024 16:41:37 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Nov 2024 16:41:35 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Nov 2024 16:41:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKOWrzIeS4qPPmeHnfkhzRq/NS062ogjNR4Q09muPqSW40qxKgHmexQRFmwncrB9J9a8yE7H7CnDi7xrGsCyR/Zb1pokdxb4vIPFQYA5gLxNQprdy2khecfh6vGeGRhNKcisI9GTEGEOTi2nCuA6AVHb1FTbDTzX57YsxlWiel2TdIRGnYl/9dYOXaJYJHOjtfLFjpx6WaJZEV8hxy+YJU7JwgtbEQ60kCFUnKvtyVTkdwDFCljFFaljhAmzd/xsmGjLuIcoXMfRmoJMlOs6LQAR+SHOi+VTKeN3gBiVRyy2LHFA52Nn4zz/26HDXT89beQ1GO58Rt3ld+HasWHgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeL9jT5ygx8wnN3CyttV3X3XXzF7wRQRZSIB526QbRU=;
 b=R0plVJ77IwzinwWjwCRs4fA1ugd6tNaeQSRAqyzPk5bKO2MFY/AeT97mF2x4+HPsf3+5a7foDrlrHP/yxRYttMnOy6xXo+405yTA+WPi1AJiqBpB8YX4crVZVLGOxFyh+UHYABCR6BCkpvFoQgctGRZiwEQtGYyccJPt4Zb0yXKcxBdPZNsXRYkomJ8FWNuDQENk0vQ8eQ9h2XjrJ2VxKJ9DTzf72Uu4zuR2zcUH88v1JdZ7Pv7ogRBcPvuh1/74I3hC7FozFdmlATD5UjBWOA4oAdIapR4wuynKKGV5/iHyeet9pjqqIMW2gcr8tO5nzw49Xdj8RZ4nJ6F3VLe74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeL9jT5ygx8wnN3CyttV3X3XXzF7wRQRZSIB526QbRU=;
 b=OhNq8UX8uDxK1YIwLJZMOtN32K30Wm2wzp2W3ra8un8Mo0N5ncZmkWfL9UYA4Tl+GWltqaES6SYX+/q0Um7RiqaLpcTDzKdht54ydGxdoiCrEgOnp3/hHuXe/SdF1gdUc9N5BAjRKGe/ZRkQtDe4jhO9Hc58KSyUATCIMipLxDI=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB7356.apcprd03.prod.outlook.com (2603:1096:101:12b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 08:41:32 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 08:41:32 +0000
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
Thread-Index: AQHbO/Orh37t76qSsU6WSMvGDnK0HLLC/MCA
Date: Fri, 22 Nov 2024 08:41:32 +0000
Message-ID: <767085562b5efb43f248e8528bb154a6c30d3999.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB7356:EE_
x-ms-office365-filtering-correlation-id: 590bde42-0c67-4af4-ba58-08dd0ad17772
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VGpLOFlJa1hZQ3FpM1lLTkpQUnZWYjB6RndySlVrbk0wbnN2ZFYzZWhGa1ZV?=
 =?utf-8?B?TU1yanEwdGg5MGxqclFjRzJZbDRPUEgxcy9mMlNVQ3hSSzFNMUk1TWZ6MVlj?=
 =?utf-8?B?ZjJoOWcrWFQvT2VpUmFkaGdlcVRac0UxeGZZQWVBTTBaQW9Hd05Sb2VoM3lz?=
 =?utf-8?B?UmhUOEdGNm9QZlpCMGtDWElFWElaK1owVm9KZ0gwYTFaNFdpZlgrSllpeVd2?=
 =?utf-8?B?eFY1WGtsM0lDdGFJUVRPL3Z0UTlpT3FZejBVM0h0RnU4M0U0OFJYVk55b21Q?=
 =?utf-8?B?YzFycXBHQ3NxMVQvRW5KWHJEMWNIMDIwT1BWL2FLNTBKZUwrdERBcjJHaVl4?=
 =?utf-8?B?RUFzYkdOTms4eCtsZnlTVXY1eHVQRmozdnljeWJ0a2k4ZEpMcElRRitWZndD?=
 =?utf-8?B?SGFlU1dVaWZYMGRhOFVNeWhlNkg3YTZENEVkSzc2ZXZuZm4vNjVqaTdLVUlI?=
 =?utf-8?B?SU1JTmRUcnF3VmppTDlWN3A0d2ZWY1FoVVRlbHN2NmV3NUFhRm9ocDBQTEsw?=
 =?utf-8?B?VjdxRDVYZXJZZVpVbHNkK3hVT3JGd0ozOEFTd1ZxaVk3RFJBWFZiTlRrOWJ2?=
 =?utf-8?B?R1RCa2o1ekRvd2IvbGlkZVUrQzJWWUJKS1J2VGthYmhRMVNuRDgxVG1DYmxu?=
 =?utf-8?B?bzFUbU5qWXlPaTE5cVMwcFlJWGl6SU8rc0RwVERWaE1VR2tZTm43YTQxdXlO?=
 =?utf-8?B?ajFIeDkxQ3FDaFJvNlgrd3pUeGVlc2lQVE4ra210eFBWeEhQMkUwdkxyS0t2?=
 =?utf-8?B?YW01Q1k4eklCS2tuRGFBL1dsamJpbzM3eXd3Ymg5OGtkdEdKTmJTYjlTNitF?=
 =?utf-8?B?U1hKMlJNMk9wK3djQW4yQmp6a0EyR2Q0YVlZZERiQ1doNEYvMFRNcm83OEhi?=
 =?utf-8?B?MlBhdVd6dXlROVhVZ2h1NXlOa1p3dFBvTDgzUURyRGlzUlZrZmJRU2xycll5?=
 =?utf-8?B?V2JISEI2RUJ6dElnZFF1WmFZTHBJS1kzdmxTQUtUYmVFYlNxUGpqMUpSRHBO?=
 =?utf-8?B?b0EwamtBOVVGcXo0VFlaZjhZOXYxblFUdjRYL1dhQ2Q0dEc3emZ2MlhnSUUw?=
 =?utf-8?B?UHozbnpzVFFIUVFQS2l5U3l4ZjJHS1NsMHF0ODlzQjZoaERtd05zc0huOUJ4?=
 =?utf-8?B?L1BYci9XRU5xVzhqWXVrS3R4ano5Q1UwTnRaMzZsL1E4VjE0Zm9KbVFyb0V6?=
 =?utf-8?B?bmNKa0dRanY5aXJaTXFPOCtGSkwrc3dUWGpsT1BhWTZ6a2M2cldLazVYRW91?=
 =?utf-8?B?ZHo0T2V1VVNEbHFvejE0WHdpeUJIMUZ0akY3Szh1a0lGV3BwMzFaMm12WjBl?=
 =?utf-8?B?WlZkbmhTZHYybFVrZUxVSVhncDM5VXo3Sk5YRFBrUHRtVUJsUXZ2YTRiK1dI?=
 =?utf-8?B?Zk5GN3BXdHZUb0VZczZDalpYN3hSREJDNjhtV09SL3g0TWxHZlhWNkNtTUUx?=
 =?utf-8?B?WGE0ZlVwYzN3Qm9DRVJobjZ2TVhNUFlXY1VobW5ZUzgvaXAxY2QvOUxYNXNs?=
 =?utf-8?B?d1E1QlNYNTk1ZkRDTHd3Qk4yOUdZYXhXS1o0eUNxNWVETFBjbllpT3lrMVRH?=
 =?utf-8?B?YlVVZWdsbWJ1bzlCYWg2WW9iUGRzRHlDRU14Q000VFhwSWZhV0piRE95OEVZ?=
 =?utf-8?B?TVlnMk94aXdONkVTVDJKQXlOd0lNOTVxTGNzMHliY1Q5eGVDdDdGQjJtYVBE?=
 =?utf-8?B?cXRGVlVIbjM3cGlBUEJTQnl5d2dsSDBDeFovTEhEVFhOd25FMURJYjBmK2VV?=
 =?utf-8?B?MHdMaERTNXZ5bHQxcEhOTVFLdEw0Y3Q2Q2o2bUtPNzNnUDhqbHZZRUNuMzUv?=
 =?utf-8?B?TWU1ZHZRUk9UeTdXT3pHSkhKejJEa0xWaE5CNFdSVlNYUHBPdmJWS3FFTGJN?=
 =?utf-8?B?Y1Z6VytGSG9nc2pjaUV3WkxYNWJxWnBBTHRSMDFBVS9BREE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDhJS2s0dHRPQVZnVW1DVWpPMUE2MVNBZFNqMjZEd3owbzgvQ0Faby9SODRL?=
 =?utf-8?B?dmNWQUNUNWsxcmtTS1RvRzJQRkZIbWc5SUl3U0hLcDZxWEpYRjZaV1dYZ0RO?=
 =?utf-8?B?YjZKRnl6bEMrNlVaOHBoaGUrQ3B0aXByTlhYcWVCbUt3QTE4ajN6aTVGU0cx?=
 =?utf-8?B?VDUyUFNodElFUDBkMkE0cTlUYThrQUNLbGFBOU5pcmp5WnRmaDVpK0JSSzVo?=
 =?utf-8?B?c0F0cnAzK05QU2ZLWGVsOXJZRXQvMXFSbmZTOEhiZ29jRVovb2I1NUxQNGZh?=
 =?utf-8?B?RGl3WVdlMkx0M25FMnRJRTlQN2JieXVtK042UHVDR0tJUmJ0OVdGZXMzNEt6?=
 =?utf-8?B?MHB2dElTaXBGcXlUL2pZS1dsRWtubXdQa3c0WDdqYlZwL0xPdGlkbzZSTkRY?=
 =?utf-8?B?TzhLK1dzSDAxcFp1b3VuQThBRFk0QWUwSElHd0NaQnNBWWFLQk9sZzhoc2FY?=
 =?utf-8?B?T0xQWDVpZ3UwdHQwQlpRTXNUSUhwUVJ5Mks4RXBXRnpPR2dnc2FtR29qRDhR?=
 =?utf-8?B?aVhqenNkRXBsWm5ZM3NhYnRZbGJ5cUcrVzVXMHRXTXpHaDFETmRNbWR3WENJ?=
 =?utf-8?B?ZnF4ZHNOWFQ3NzUwcUFCZTZ4SCttbUxYcDZ3QVh6YnlBbjhWb0luWC9TNm9Y?=
 =?utf-8?B?MUs1d0k0cVlJZlEvRmlwRWJhOFltaVNHblRqQXJHa2JrRlJ1dGMzZmtWeVlS?=
 =?utf-8?B?YWdCWEhHUURJdmV4WUoyUlNJVXNVT2VWbDI5U1ZwTzNGVmsxN2xEdVRWSnRY?=
 =?utf-8?B?ejZzSTlRTXdIcmZkcFpxQm1HVVJocWRhV1J5clEvV1AwcldaNVRGNWpqbXM4?=
 =?utf-8?B?ZHo3MUxaeXAvcndKZDZvUmMxUEt3d09sak40dHVmRVRIenRpeGtHMGhIZUVD?=
 =?utf-8?B?MVlUbktKcnZzMjZQY1dLM2ZBN2dYN01zMzhEa2YxalAxZWlnYjFxOS9pNFpl?=
 =?utf-8?B?SjBJeEp5WnFoNE54V3RESktVN1JteGhsSlFGWHJUdUZkYVZKWE1RVEFNSDJk?=
 =?utf-8?B?bHN6eWtRam5wZUdwUENpUG5ZMzlzYWRERU1SRzBlOGZlYkZydE9qWVhDRExh?=
 =?utf-8?B?cy9EN2JRYTFnRVBkNVE1enhvY2JPZHRKWXhxaUlBY1V1aVBzTElmSm1SaEF1?=
 =?utf-8?B?YU1WcjBvdVlMSVF3ZEJXWjBGRktwbDdUQU92VXlLMkhIU2pxVk8ySU9lVWMx?=
 =?utf-8?B?Z1FwQzhBcGhPTkorWXVVbEhjSDdTUWcxT2FMeUhIMERnSGhSbCtFd0ZpMTVF?=
 =?utf-8?B?bEhvNlVlU1J0VnVVOEIrNmlVRzRzL0xGNXVacEtMNmtNZDJsTDF5L2FGMFV3?=
 =?utf-8?B?OWhPTjNINkdhSC9Ccjk4OFR1SEM2ODEwSUpzTE03NnJTWWhrMDZtVEk4aCtR?=
 =?utf-8?B?bWxxY1ZRTE5Db29qQzBhSDBySzhpdUJxQXcyc2JFc2c4dW95L0h2bEMrcXpa?=
 =?utf-8?B?V003Y0ZUUjFLRVA2blFja2FEeDZtWHUxRTBVYkgyTU1teHBacDlTTGgzV01T?=
 =?utf-8?B?Z092V3dpUDJXa0tUVXBTL3hHMG9yM0ROQ3BHVE5xdDJIWG5uQmIvK2FXMzN1?=
 =?utf-8?B?OVZYeXBvdEdhTHBBamU2bG1lQzRRZVZhZHNBUGlkY1F1ZUZIdC9IaHZRSCtV?=
 =?utf-8?B?M0kzNk1pUjJMbkxIT0xsSzNwZ0JGK2JPNmUwRGx4WXpUOHA5cTI4c1hWbSt1?=
 =?utf-8?B?aEF1YzVGMzArV2FTNUl0TEhUSmRBQ0dpVy9kVzVaOVI4ek44clFKV0RqYjJq?=
 =?utf-8?B?Wmc2c1oxTk1HemZyZHZMZ0dOQUtwTkZvQW52TUVIQXJxUWVYbnpTUUs0SE8v?=
 =?utf-8?B?RE1BbUV2T3h4eWFGbmVvQmY3VEJFYXpLTmo0dm5GaXpiN2tmTis4czR0c0Rq?=
 =?utf-8?B?QXZ6dWhsUDF1VjI5aHlYZjU3c241bVNhSElzSlpieVhsdFQrdGJOQ1ByRHNB?=
 =?utf-8?B?aDQ5TTJrU3pFdGI1K0hMOU13ZjBpUTlEaDdJZmF0czd3Smt3NW9wdW5hOXVx?=
 =?utf-8?B?Q2kwelVxYWRTNmhBcUpHNUxxZlZHb3lmVE9XaGxha1dMSXpSTDNzV3RyeG03?=
 =?utf-8?B?RVI2QUI3ckxzMkY5bCs1Y0NmYzEzUDhsL0ZjTVByOTJ3SGlLcjB3R1dYSzQ5?=
 =?utf-8?Q?LGB24xa2cs80fLtt7UpAmr93l?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE9FB3A61DF367429BB23442B36BD250@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590bde42-0c67-4af4-ba58-08dd0ad17772
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 08:41:32.4539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nRhrEVKHNXJHaSnrOc03ENbmqsaRDE5yRse1UfCdn6Dsf/jA+9VexxCJff643ATQeturE/7yzUTOO66FTprr4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7356
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--21.111500-8.000000
X-TMASE-MatchedRID: VfovoVrt/oYOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0r/XD0CNJ3fxO4dcT3ZaTocyYHhs0mgDoxyETzgIO4sasaQTVtPXXNM8ha
	W4U9IrFq4+90dmk+Zo8Zvfq/DYLt4WU/fB/XFmJzJ5W6OZe5hhQBqi9O94W3VV9eB8vnmKe8GxP
	EJpxlnFefv7tafU7Bi6lAvO0DVm9AIKTbeRIBWzI9BVqQOQlT5ELbqrOgWzyd6ttL9nwYPsovGP
	9arq5hqZsAAlfA/+SWRk6XtYogiatLvsKjhs0ldVnRXm1iHN1bEQdG7H66TyOk/y0w7JiZo
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--21.111500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	54AB0DBC32CE56926F342B4C1ED25D2DFFBCDEF30B161C0D3F2A9BDE2574C46F2000:8

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
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIGlycXJldHVybl90IGlzcF9p
cnFfY2Ftc3YzMChpbnQgaXJxLCB2b2lkICpkYXRhKQ0KPiArew0KPiArICAgICAgIHN0cnVjdCBt
dGtfY2FtX2RldiAqY2FtX2RldiA9IChzdHJ1Y3QgbXRrX2NhbV9kZXYgKilkYXRhOw0KPiArICAg
ICAgIHN0cnVjdCBtdGtfY2FtX2Rldl9idWZmZXIgKmJ1ZjsNCj4gKyAgICAgICB1bnNpZ25lZCBp
bnQgaXJxX3N0YXR1czsNCj4gKw0KPiArICAgICAgIHNwaW5fbG9jaygmY2FtX2Rldi0+YnVmX2xp
c3RfbG9jayk7DQo+ICsNCj4gKyAgICAgICBpcnFfc3RhdHVzID0gbXRrX2NhbXN2MzBfcmVhZChj
YW1fZGV2LCBDQU1TVl9JTlRfU1RBVFVTKTsNCj4gKw0KPiArICAgICAgIGlmIChpcnFfc3RhdHVz
ICYgSU5UX1NUX01BU0tfQ0FNU1ZfRVJSKQ0KPiArICAgICAgICAgICAgICAgZGV2X2VycihjYW1f
ZGV2LT5kZXYsICJpcnEgZXJyb3IgMHglbHhcbiIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGlycV9zdGF0dXMgJiBJTlRfU1RfTUFTS19DQU1TVl9FUlIpOw0KPiArDQo+ICsgICAgICAgLyog
RGUtcXVldWUgZnJhbWUgKi8NCj4gKyAgICAgICBpZiAoaXJxX3N0YXR1cyAmIENBTVNWX0lSUV9Q
QVNTMV9ET04pIHsNCj4gKyAgICAgICAgICAgICAgIGNhbV9kZXYtPnNlcXVlbmNlKys7DQo+ICsN
Cj4gKyAgICAgICAgICAgICAgIGJ1ZiA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmY2FtX2Rl
di0+YnVmX2xpc3QsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IG10a19jYW1fZGV2X2J1ZmZlciwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBsaXN0KTsNCj4gKyAgICAgICAgICAgICAgIGlmIChi
dWYpIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgYnVmLT52NGwyX2J1Zi5zZXF1ZW5jZSA9
IGNhbV9kZXYtPnNlcXVlbmNlOw0KPiArICAgICAgICAgICAgICAgICAgICAgICBidWYtPnY0bDJf
YnVmLnZiMl9idWYudGltZXN0YW1wID0NCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBrdGltZV9nZXRfbnMoKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdmIyX2J1ZmZlcl9k
b25lKCZidWYtPnY0bDJfYnVmLnZiMl9idWYsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBWQjJfQlVGX1NUQVRFX0RPTkUpOw0KPiArICAgICAgICAgICAgICAgICAg
ICAgICBsaXN0X2RlbCgmYnVmLT5saXN0KTsNCj4gKyAgICAgICAgICAgICAgIH0NCj4gKw0KPiAr
ICAgICAgICAgICAgICAgYnVmID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZjYW1fZGV2LT5i
dWZfbGlzdCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgbXRrX2NhbV9kZXZfYnVmZmVyLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxpc3QpOw0KPiArICAgICAgICAgICAgICAgaWYgKGJ1ZikN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgbXRrX2NhbXN2MzBfdXBkYXRlX2J1ZmZlcnNfYWRk
KGNhbV9kZXYsIGJ1Zik7DQoNCklmIGJ1ZiA9PSBOVUxMLCBzbyBoYXJkd2FyZSB3b3VsZCBhdXRv
bWF0aWNhbGx5IHN0b3AgRE1BPw0KSSBkb24ndCBrbm93IGhvdyB0aGlzIGhhcmR3YXJlIHdvcmsu
DQpCZWxvdyBpcyBteSBpbWFnaW5lIGFib3V0IHRoaXMgaGFyZHdhcmUuDQoNCjEuIFNvZnR3YXJl
IHVzZSBDQU1TVl9JTUdPX0ZCQ19SQ05UX0lOQyB0byBpbmNyZWFzZSBzb2Z0d2FyZSBidWZmZXIg
aW5kZXguDQoyLiBIYXJkd2FyZSBoYXMgYSBoYXJkd2FyZSBidWZmZXIgaW5kZXguIEFmdGVyIGhh
cmR3YXJlIGZpbmlzaCBvbmUgZnJhbWUsIGhhcmR3YXJlIGJ1ZmZlciBpbmRleCBpbmNyZWFzZS4N
CjMuIEFmdGVyIHNvZnR3YXJlIGJ1ZmZlciBpbmRleCBpbmNyZWFzZSwgaGFyZHdhcmUgc3RhcnQg
RE1BLg0KNC4gV2hlbiBoYXJkd2FyZSBidWZmZXIgaW5kZXggaXMgZXF1YWwgdG8gc29mdHdhcmUg
YnVmZmVyIGluZGV4LCBoYXJkd2FyZSBhdXRvbWF0aWNhbGx5IHN0b3AgRE1BLg0KDQpEb2VzIHRo
ZSBoYXJkd2FyZSB3b3JrIGFzIG15IGltYWdpbmU/DQpJZiBoYXJkd2FyZSBjb3VsZCBhdXRvbWF0
aWNhbGx5IHN0b3AgRE1BLCBhZGQgY29tbWVudCB0byBkZXNjcmliZS4NCklmIGhhcmR3YXJlIGNv
dWxkIG5vdCBhdXRvbWF0aWNhbGx5IHN0b3AgRE1BLCBzb2Z0d2FyZSBzaG91bGQgZG8gc29tZXRo
aW5nIHRvIHN0b3AgRE1BIHdoZW4gYnVmID09IE5VTEwuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsg
ICAgICAgfQ0KPiArDQo+ICsgICAgICAgc3Bpbl91bmxvY2soJmNhbV9kZXYtPmJ1Zl9saXN0X2xv
Y2spOw0KPiArDQo+ICsgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOw0KPiArfQ0KPiArDQo=

