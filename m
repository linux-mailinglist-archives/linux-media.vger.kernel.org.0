Return-Path: <linux-media+bounces-44506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBD4BDC61A
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 05:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 551D0352910
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 03:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE7E2DAFC3;
	Wed, 15 Oct 2025 03:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XcCHZzVr";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="Afem9eAW"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3852BD5A7;
	Wed, 15 Oct 2025 03:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760500058; cv=fail; b=M8dPk450DRnEF/H2r3BBPLhPzqPqdedl5V32KvLNstfmvsctLZ94p9CrOZXWfy+tV1IR7oxc5/xg9PXRm2ukahd7LIC2tl890i5KkkMuVR8J0QA1jso7r3sl+uzfWtMnLR0MHWsLq4wXMC/ilq4jsQJBTxd5nuarj6Zk69p8UMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760500058; c=relaxed/simple;
	bh=p8ShO5PX6hwM+I0INbCzHlSey/Vw32a7p7w3ZHIH6zM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Aq89J8JMe5JTfwhvq/raVorNJ6B+JaGbVNOSBlgcwouTlllxXnM8YNrx/XRFaVI/3Db5S4SomwcBR9vyzIVeHdhxF9mtE7aoiqf9+46JDnsrCj4odPfZvV5ZEgsiNMOMZCzHtgeBeYNuo0HXE76Rds127eUv49kQyXDSUcyJ/Kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=XcCHZzVr; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=Afem9eAW; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ac9b4bfca97911f0b33aeb1e7f16c2b6-20251015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=p8ShO5PX6hwM+I0INbCzHlSey/Vw32a7p7w3ZHIH6zM=;
	b=XcCHZzVrTqPoLXQYg6Jtwi7EKCQGyzXQBAgw2MWfLN6eafKfsXn4jHncY98sd4VMftWLJHVE63YDAjaH4iyO4KEL+DTjVgoL3crid+u1QfQ65IEdlk7RYfinJw7kZBChQYZP3ogempLW1dw76JOwfaritS3WgGhP/Apu2Lp1G8I=;
X-CID-CACHE: Type:Local,Time:202510151147+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:ea761323-d7e0-4f50-9762-b76858156a69,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:0c803986-2e17-44e4-a09c-1e463bf6bc47,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:-10|4|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ac9b4bfca97911f0b33aeb1e7f16c2b6-20251015
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 130989054; Wed, 15 Oct 2025 11:47:30 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 15 Oct 2025 11:47:28 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 15 Oct 2025 11:47:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6PpTLFZATrutSmtDgxUhVxnWbXYTXZW3UUYJHYci6QnVWvDpgyGRwxqhEeGcFrraFUXebacJjNNIV4hzYq9dvy3wOlStvREjfipH0CS8BRi7buKmdqaE4jASx43m8PuzmMaKhwxj5sAQZUSQ+Acb3/iY04EeJyXI96Gqp0jZUcL3C6hTxm2lbXQL/n2YmQXcvz7kTUwvoIdnhxST1mYWSVe80ZYjkFJrHN8330nLAWV9g1ElnDGp46z+bXRbV36LtEyZOJfB5U4iHD88PDdLCmN+C2cVGykg2injSkeOOmjhSa8jkjnMIy1mJKIHj0KataMVbYJb1BZbJLm0JuLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8ShO5PX6hwM+I0INbCzHlSey/Vw32a7p7w3ZHIH6zM=;
 b=tv9KuYVzReSt6MhV64prhov2vee54NOPXp+XtI3EBydFzfcx2+wPaDWsWYFrP8QxK2YEdbjP8GSfySR5w+YTwVjUVuEcSnrwk5OP9ICBpBcrtO3ZCdwHHypdIxoTN2gkUEaJ7LGLUkpURX/wA3yZZtaYwaM3Oj2CuZCnwbcAU2k2ISlkhijxaluatRbkKPvfWKp+f07arLxHWtl0Ppnz4BIi0+sJGbBjBzDGj7fPi2U8rnSnCXKau8KddLbufHxaFW131xdgLRejDo1LsuCmvRP/fJsWVE+l88UWcd9cwKOJ4KAhnZUnRC+u5eFp6WgByby8W4WX8ihFtzi3G4AdxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8ShO5PX6hwM+I0INbCzHlSey/Vw32a7p7w3ZHIH6zM=;
 b=Afem9eAWGKn68JW+LLhIaA9xCihoLBYJjHANJlSrQ70S7RONacl+ai+L1I6zmUL/YYK9xldsa2bf+JAuArXxhmBP/JcYWkVUhJ2FRGkLw7y8YiRC1ERPVW5vh0xr58wz18yuu4QrEBDthqBSIS9JHkffxn95FiitbF5Mv/L1NsE=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB7957.apcprd03.prod.outlook.com (2603:1096:101:17c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 03:47:22 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 03:47:21 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "nicolas@ndufresne.ca"
	<nicolas@ndufresne.ca>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v7 10/20] soc: mediatek: mtk-cmdq: Add new APIs to replace
 cmdq_pkt_write() and cmdq_pkt_write_mask()
Thread-Topic: [PATCH v7 10/20] soc: mediatek: mtk-cmdq: Add new APIs to
 replace cmdq_pkt_write() and cmdq_pkt_write_mask()
Thread-Index: AQHcF0duXD4dz8Xnf0OAJQGEg7D0CLSEZA8AgDu7FYCAAa60AIABEGuA
Date: Wed, 15 Oct 2025 03:47:21 +0000
Message-ID: <20f251d7b6a345f607c60e703164f6baa8f8afad.camel@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
	 <20250827114006.3310175-11-jason-jh.lin@mediatek.com>
	 <b2335fd9296bc6f3511f8139870f0c34db1be62a.camel@mediatek.com>
	 <fa46fec3f7ca25532c39e6e864ea692e19b7f5bb.camel@mediatek.com>
	 <87489f92-7bc0-4494-8532-f8f2d220bd27@collabora.com>
In-Reply-To: <87489f92-7bc0-4494-8532-f8f2d220bd27@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB7957:EE_
x-ms-office365-filtering-correlation-id: eae7e89e-2f72-4789-cb24-08de0b9d8bd0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?R1pGS2JuUk1LbEtWejJOMi8rTTF0RlM3VlNoZWFhaTl2SjJtR3QwVUp3OW9i?=
 =?utf-8?B?d2V4dlpNMVYzdHhzdk9wcE56V1hrZ2kyeCtxOG5STmYxWGJQdXZmNkdZSWtX?=
 =?utf-8?B?cStjemVtWUI4YU9XVE5nRmtud2FZMHJCRUVBeXI2WmhWMDg3TFBPNkkzTGxL?=
 =?utf-8?B?VCs1ajlBT09ZNGQzd0VvdytaQWFhSEgrdXB0bkxHcGoyb3hkRVQ3UjIyb3pp?=
 =?utf-8?B?cU82NzZXeWU3UVJrbnY4aFV4QWN0K2hIbkpabUxQMU1yZ1FCNTc5NHJtZ2tV?=
 =?utf-8?B?c2I3aE80U29sOHVacXN2T2hrUHM0RDBwYU9KVTRoV0tSdkgyWHpKNDBybmtB?=
 =?utf-8?B?dGNGNTAzaDl4dVdYYllKaGp2a2xDOGFqKzd2M29qRWZ5T1ZIN0pDR0Q3UzZs?=
 =?utf-8?B?U25heU9yQ2VXTlJ0Y2lsYnQ1VjBwVmxialZUSmVMMU02U2M1YmxGNG1nTnpB?=
 =?utf-8?B?b2lhL05YeWM3bVdxUTlxMmE1UUxVUmhKbUlBb1h1RW0wVUdHVk4vdVZMSGYz?=
 =?utf-8?B?MVdnZkJUMlVzZ0lPc0ZLTFJyWVc3REZmaVpkdHpkRWVmRENSYjd5UklScTEz?=
 =?utf-8?B?QmhKODAvSFhLeDJoU2czUG9aTFI3UFEzU0VzYXBuSHdvQVlzc0pzdjd2WCtL?=
 =?utf-8?B?MzQrMTZueFRYVURCZmxkQ2xmSktvODNaRVVRLy9keE1LWFh4bUMvazZEYWNJ?=
 =?utf-8?B?RFZTNmpGdnpydG04eHZGcmJGMzNtaHFRVGVTUDN2RTh5MVN4UklwRmRlbVd5?=
 =?utf-8?B?Y3JzSysrbTZNTXVjRXkxV1VkVndrM3IzUkZoMUVnUzVrQWp0VitsdWc5SjM4?=
 =?utf-8?B?UjRlMmxFOWUxc0hmY3IrZElqTVVPVnBzQ1Z2VFd6d01EOFJvMGUxc2xGWTl4?=
 =?utf-8?B?K3diYmJXRmxNVG9iZ1JlNjBrZ2d4Z3NmUVgzN0JwbmwwRjRXdHBJNDQxMWo4?=
 =?utf-8?B?MzBUSEhRR1dodWFLbzI0aTI3dkNmMS9ibjNBT2kyamV3TUpENXczR0htSnpa?=
 =?utf-8?B?Vi9lMThBNm4zMGQyZ20xTHdaRFo3VzFJZHc5YTI1cUxRNUp5OURaSXdJWWwy?=
 =?utf-8?B?TmZaZDBPcjBZT25ZazNvcjhaVWphVmxtNU1jdXFoQ1QvWVVZOEZoSmZ5dEhR?=
 =?utf-8?B?Mkh0TmpvaFZITWVRVEJBaVp4V05WWktwVkYxZ2N4TnYxTU5ZRjB0WU5zSkZi?=
 =?utf-8?B?clg5c3liNDc0ZktScU43SFBiWVBlWXlHZDhjc0RHN2tQenZEQVUvcC9QWDYx?=
 =?utf-8?B?Nlp6UXYxUkFlRlVCQktONm1lclNmVmUwRGx6dVRzQmdDMHJqUTFjWk5objJO?=
 =?utf-8?B?QmZyL3k0MVZhTUxDTGVWNFZtZ0NyZWtsaUZ0cVNsOGNBZGZybXN6VkRkTWJR?=
 =?utf-8?B?eWtlRE1mdnBxbmhHandVcXE3eWZ5WEpiYjdGZUpEeGdqS2JRQWozU0pYSFB6?=
 =?utf-8?B?NUY1MktOcnRBUlBkR3I3enBCUVF3c0paVXo5UjJ5YnhvamR6ZndYd3dLMVB0?=
 =?utf-8?B?RHdSSXplT0Zzc1QyOFFtUXhKcXowQnRjcG9XZHdXZ3lnUW5wZ2lVQmtmWEZ6?=
 =?utf-8?B?ckZKN0xScmRYUWE3RkR4cHdXUkNDM0VYR0k2ME4ybVRKOENhTnNSTkRvd1dC?=
 =?utf-8?B?cXFpb0hNd1FpNmtjN0V0K3MyaWJteGlCNGNheURNd1hWS3lYMkRVcmtabk5S?=
 =?utf-8?B?cEprYlhBa0s0dHFodnFteDZ0ZkhNVnhuaTMwdmVGamw4RFZMYnN2Yi9PNUFw?=
 =?utf-8?B?cWNXdjdSbURVQUtsZlVRSkkrM2VMUTFBNEF2aHdLZWFQNzRJempta3p2TWh3?=
 =?utf-8?B?QVg0UHQ5VGtIQWRjd3ppM05haGdEaUkrSm9WUGp4V0FXa1ViVUxJQWpwMUJP?=
 =?utf-8?B?RHBOZGFsWS9ISVpPMjk0UDZ0OTVJY1U4R0xVN0kxY1hNQUlzNFEyemxVUmFN?=
 =?utf-8?B?S1VQQkxudVhWWW44VmZiVTg3N3UvWDI4NEtHN2krZVIwQTdvVytwVHNzckh0?=
 =?utf-8?B?d0VyMWVZM3ZTcHlQUUlkMjBDOTNuOG9OZDNyWFUvTkJLUHprTkQ1cTdaOWdQ?=
 =?utf-8?Q?n5hSwz?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlNDSnRvSmdWdEtWU3pSVGJlRFRSVmM5aHpjdmdRNjZiZjhvN0hRbUVKZFI5?=
 =?utf-8?B?L0Q4WEd1MDNnakRPOS9WTks5dXovQjF0UDNzb0J3SWVLcW1JTVJ4WUhTL3hx?=
 =?utf-8?B?YjJvMTBLQmRSbk1qYWh2dE5pWHB0dWQwaVZrUU8xY0ZhUW91dGExdmtWNlMr?=
 =?utf-8?B?VTZ6SG91MFY2d28yZjVTemtLbm5udVRiUkFTaE43cXZWVkJoeURxNnA2Qjdz?=
 =?utf-8?B?WlFsbUNqaTZrOXNsQnZOMHowTzNtWTN0YnV3MnNKaHF4NnRoTW5EUGt4U3hs?=
 =?utf-8?B?YjZBdFJYZUdUODRNek5YWlN5V3dTRFpWVkdicDQwL0gyZTBqd2RoWkZWdDNC?=
 =?utf-8?B?R3dEZmdreHk2U2hhdDQ4RWxMb3AxQ1puNG5nS0Q1aW1TUzBReFZHakxNZlQ0?=
 =?utf-8?B?VGl3R2ZLVXR1ZnhIYUcwOENnbHdaR3NrRkp0Y3NqWjJVR0FVRElDZDNUVno4?=
 =?utf-8?B?MDlRbGtOTGdBZU9UUnVNc2pJbHBINFBUTkhIRVZhTnpTcDBYOEpZQjA2ZGhz?=
 =?utf-8?B?VFVJK2hrbGdqOCs4N1Y1SUduUDJoZVdkUk5FZFUzOGkxVUlabGJ3ZFVpSUFR?=
 =?utf-8?B?TzN6b2dRZVRaeis1NHU2d2kvazdHQlJScTg1enlxL29vUlFyVWpzREhqeXBl?=
 =?utf-8?B?bE4wRWVFalJ5QmphYTdxZzN5RnNZbW82am5vOFVIT1FRS2dYZnhUMmIwK1pS?=
 =?utf-8?B?NzRuUzZBWmdLSVhzVGxiRkxTNUxFeXI3aGNxZ0V5UlptS1FYL0FKc3RpYnZX?=
 =?utf-8?B?Q3BoU1YvR3JzVFNGakNpdkRBZ1N5WW9CazN2NSs0ZDFrZmZwQkFISHVwRks4?=
 =?utf-8?B?akxDUEl5MC9CQ09SUmpSUUNmMGdNN2F3cENWbFFFdnlYZ2U0KzUvd3R0UFZ3?=
 =?utf-8?B?QVdtbkIxNHJpMjFwRTg1RjBmanovZHZLTzNWZjNiUytWdjlsK2xkQldLUHNN?=
 =?utf-8?B?eHRobWpvenBLZ2VPbEpZZWNCVWtTOW9VMFBJYkdORUVmWkx6RVZoZmdhb2Rj?=
 =?utf-8?B?djFDZkpSRHJDR1FEbFgxOWNMVmo0ekh3TjFBQUYwaVlnT1RRZVpQcEM4QjBr?=
 =?utf-8?B?V0FiWXNXWUM2NzdmWGc4dEtYc2JjNGpGT2x2LzhCbk9veTdMekppUW1oNE5D?=
 =?utf-8?B?Y3NYejc2emEvS3dZdjFBaTllMEU4NGRLa0JmOEVEak9pQ1F1dDY0dk0xSU1j?=
 =?utf-8?B?WEdud1FkaGFpN25HT3MvZmxmWXBKWk1Tdm05MnpkSGF0LzA4MVVuNkdRZTJu?=
 =?utf-8?B?NS9XWi8vNzh4a2Y5K0FQaUxkVGVYUmNJbWxHaytMei9HQk11a1RzNTZLOGFH?=
 =?utf-8?B?c29EeDk3RDlvSnpqZkIxNkVDdXRncTFVRU5rOFQ3ZUdDRGk0V2QyODJFeXR6?=
 =?utf-8?B?RGJncVhyVHlud0ZqK2trSU5pM3ZPTzhZVGw4dFpCSjBPQS81M1B3eUV1Vzgz?=
 =?utf-8?B?NzFVLzc4dGxwZmpGSmY4QnE4L21mTjFVL2UrNzkzVnloV0hRNFZOV1IzRDJC?=
 =?utf-8?B?VnNiVXBCbXdWcWd0aUhQSklkVlNuY2RQbWxjdFd6RUJHMUdkNVpLazdWWU1t?=
 =?utf-8?B?YXFlalpaMkVqazF6U1dFWmVKNXNjam80aGI2aUx2dnl1M1k2RHBURXdacXJJ?=
 =?utf-8?B?N2IwUC9xeWxST1gyOUJJUmVqamg2Zm9mY2tNL3o3T28rcXpVUGJKVUV0K2Rh?=
 =?utf-8?B?bllRSDFXWVkyb0dPV21wckV3NWt0UjNlUndSYS9wZjBlRXRKeXB2c1VQcGw4?=
 =?utf-8?B?WXdKMGgxczV6czBrVzhzd0xzYnpMdVNHK3RPL0x4c3BlOHZSTE5WQ0haemcv?=
 =?utf-8?B?RVhCcWVtd0krRXlWbzl3U0tLVWxBblpweGtoa041VitWRmFsSTJ5RWhaUXBk?=
 =?utf-8?B?QW1XNDZ1OUlOVnhMRFFjY21IMGdha0dPWW5LOWlkNTdWVm1uMHkrOFZuWnZr?=
 =?utf-8?B?QzJOVkNaL20wZzMxajJrZUlGTVViQ3F4aVV6S1Q3Rk02dDNMaTNwU0R3czNG?=
 =?utf-8?B?ampqSjBVZ0xQNitrdW5WQUJra1k2Q3pRMnB5UjNDVFFlWnNPNktYN1RPR3FN?=
 =?utf-8?B?bnZrZlJDbmtxbklpM2taVWI0TkdCWGthdVpNTjM4K1RERFNEa0R5TnU2TEJ2?=
 =?utf-8?B?RFA2OUVTdVdwb1lpUG5wWjlrRWIvVU0yN21MNEFrVzdXMmlnV1I1NWw2Rm41?=
 =?utf-8?B?YXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21F79875444EC74BAD4FE2605A5C139F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eae7e89e-2f72-4789-cb24-08de0b9d8bd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 03:47:21.6375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WBrR8WmVi8Gw1iv0WnXKwh49LOyTFbc8Th3KQ+M15KZI/P71r+4Ebf7iTgkZo/kPyf8R17KXjPwJKhnP+inAV3vOBvBuUfQzWOPwKibCmKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7957

W3NuaXBdDQoNCj4gPiA+ID4gKw0KPiA+ID4gPiAraW50IGNtZHFfcGt0X3dyaXRlX21hc2tfc3Vi
c3lzKHN0cnVjdCBjbWRxX3BrdCAqcGt0LCB1OA0KPiA+ID4gPiBzdWJzeXMsDQo+ID4gPiA+IHUz
MiBwYV9iYXNlIC8qdW51c2VkKi8sDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MTYgb2Zmc2V0LCB1MzIgdmFsdWUsIHUzMiBtYXNr
KQ0KPiA+ID4gDQo+ID4gPiBwYV9iYXNlIGlzIHVzZWxlc3MuIERyb3AgaXQuDQo+ID4gPiANCj4g
PiA+ID4gK3sNCj4gPiA+ID4gK8KgwqAgcmV0dXJuIGNtZHFfcGt0X3dyaXRlX21hc2socGt0LCBz
dWJzeXMsIG9mZnNldCwgdmFsdWUsDQo+ID4gPiA+IG1hc2spOw0KPiA+ID4gPiArfQ0KPiA+ID4g
PiArRVhQT1JUX1NZTUJPTChjbWRxX3BrdF93cml0ZV9tYXNrX3N1YnN5cyk7DQo+ID4gPiA+ICsN
Cj4gPiANCj4gPiBIaSBDSywNCj4gPiANCj4gPiBJJ2xsIGRyb3AgdGhlIHVudXNlZCBwYXJhbWV0
ZXJzLg0KPiA+IFRoYW5rcyBmb3IgdGhlIHJldmlld3MuDQo+IA0KPiBJdCdzIHVudXNlZCwgYnV0
IGlmIHdlIHdhbnQgdG8gdXNlIGZ1bmN0aW9uIHBvaW50ZXJzIHdlIGRvIG5lZWQNCj4gdGhvc2Uu
DQo+IA0KPiBVbmxlc3MgeW91IHdhbnQgdG8gdXNlIG9uZSB2YXJpYWJsZSBmb3IgYm90aCB0aGlu
Z3MsIHdoaWNoIHRoZW4NCj4gYmVjb21lcw0KPiBraW5kIG9mIGphbmt5IGFuZCB1bnJlYWRhYmxl
Lg0KPiANCg0KWWVzLCBJIGVuY291bnRlcmVkIHRoaXMgcHJvYmxlbSB3aGVuIEkgd2FzIGVkaXRp
bmcgaXQgeWVzdGVyZGF5Lg0KDQpJJ2xsIGtlZXAgdGhlc2UgdW51c2VkIHBhcmFtZXRlcnMgdG8g
bWFrZSB0aGUgZnVuY3Rpb24gcG9pbnRlcg0KaW50ZXJmYWNlIGFsaWduZWQgYW5kIHNlbmQgdGhl
IG5leHQgdmVyc2lvbiBzb29uLg0KDQpUaGFua3MsDQpKYXNvbi1KSCBMaW4NCg0KPiBDaGVlcnMs
DQo+IEFuZ2Vsbw0KPiANCj4gPiANCj4gPiBSZWdhcmRzLA0KPiA+IEphc29uLUpIIExpbg0K

