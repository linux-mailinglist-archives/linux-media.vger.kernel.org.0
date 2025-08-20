Return-Path: <linux-media+bounces-40331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7C9B2D217
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 04:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 435872A7E70
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 02:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610D62512FF;
	Wed, 20 Aug 2025 02:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="W9diEUGC";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qlHj5j+T"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE3D23E33D;
	Wed, 20 Aug 2025 02:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755658524; cv=fail; b=LGT/VthU87gGNAmwGg3UsTQmyfXaLDkgL+pDA+Mu4vgWYjTI/cntsNcdx6xovN3TIBMTl6vkPt3WEKPc0hwzQoc2wbm6/PaW4NU5CzhqB/H/pF5m8t1GZD3RM5zf+z2cpzTC01w+YMfFnt2kXbJC4oURTMskBTIJvqQa+M15bwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755658524; c=relaxed/simple;
	bh=UEeWvBg8QdE//Vkh0TdU9cMHPY1FbVst9DNGwF+vHJs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NZT5NnG9xQb8s+pXB8I6w+pnpCOudBvBYGzPW8DoFh6aVUZkY/bdAiDILigZLlvx5Z1W2xxf5B0xgxKLnbRYoAsYdzWWcGGwhuggoBPAIqnDKA+NS9eI2ezVk/2hplrmnnjNl/LzV4sh3dt75d9LRTSHtQXHakUDQwDPoW9iQF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=W9diEUGC; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=qlHj5j+T; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 184fbfe87d7111f08729452bf625a8b4-20250820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=UEeWvBg8QdE//Vkh0TdU9cMHPY1FbVst9DNGwF+vHJs=;
	b=W9diEUGC/Em+orm+86/nuWU4LnJMoBXNjX2Amc4m/nXfSylS5qq4CI5Px0ZV9aY89T0SsCAeHxW3md/BClqmrF4Vrb88EOuyRdDJipqd5/jHE98hFkVcMgbmO/77Lg8W5yuigdBP+TXpPSaEXfOhHa9J64nm/ha9KOj6WDfLMkA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:72523398-91c9-48f9-89c8-8fea7bc7cb46,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:350fa844-18c5-4075-a135-4c0afe29f9d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 184fbfe87d7111f08729452bf625a8b4-20250820
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2115726478; Wed, 20 Aug 2025 10:55:14 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 20 Aug 2025 10:55:11 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 20 Aug 2025 10:55:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEnXsgPfK9zW1OMf/fnz5uRcRAagoNAgH3vS/Unykc/rdJOB+g8h+KZUzcEkG9U02h93WaoezPPDf+YLuU8wHdFm++RrnGsh3lHKxQNcEI0/NWL98aF5Yy95iwH9Jrwg/EMQrYsdgEg8HGmEE8yROWAjei1ClUXWkhBzc2yoBaNDoVOdwVb1/K622k2qDBhOfBPyqPqCl9cL3VrWCHuo78WdGGP1qnRsuP4KUwyHUyyZJjVBjnJ+10XA6wdPkMEq/NpbhU/U5HWboKikmdKk8cI8VL+MLdKZqOVDQ/NN1U98/1O0JYhE9eYPpZufllIzno/m3Z38qf6HxWNGCBe6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEeWvBg8QdE//Vkh0TdU9cMHPY1FbVst9DNGwF+vHJs=;
 b=i+KfQxrKEO3mHKWPAaCf6APVwj1yE5HGkHcHhXlpgfYItUE9M3Q2DZz3jq+crXaZu198e9nVXJG+f3+M0x7hkKCuE8+c+WnTXdjzqAijKBGu8BmNloTOxiszPwxaV2rywi9ePRoWHRKtEViVKktPt04m61dxyM1PKMTbGKG71WG7IkFbudJpQ+C4gfR5FJn5sDUeSGZrZqvpKqYVaZIcoAQGt6aH39NW8uZA+jDMR/ziOzTqeLviMc4/vJ4j4yA2eo7Zlo5fFhVml7s9aYGX34VQSfU26ctcJ9X/IM94+6x662ianlBLSar42QtqpnxMGWGRpqSw102Y5OX2Ou3Pzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEeWvBg8QdE//Vkh0TdU9cMHPY1FbVst9DNGwF+vHJs=;
 b=qlHj5j+TRcX9474C8t4rKqoooHU15xBe9XvKPn6g/bdIp4kqn/xEclZYQuqWv+RtwEK9Snhg672W2LViRCSXhKjsb54zZ7nhpD0M0d0T48rMTifvfbulHSrEj+rhKMYRvwQqIJ3njr9rDwD5hT6rUDKWCVudj1D1p9M2+CgTZQk=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by SEYPR03MB7071.apcprd03.prod.outlook.com (2603:1096:101:d8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 02:55:08 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3%4]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 02:55:08 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>, "nhebert@chromium.org"
	<nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/6] dt-bindings: media: Add MT8196
 mediatek,vcodec-encoder
Thread-Topic: [PATCH v3 5/6] dt-bindings: media: Add MT8196
 mediatek,vcodec-encoder
Thread-Index: AQHcDPmHU/RhhVHUtEqe9mu7nGSfe7RjalaAgAd3YoA=
Date: Wed, 20 Aug 2025 02:55:08 +0000
Message-ID: <cff7beabdfce15b014597f6fbb0ea23375ecb902.camel@mediatek.com>
References: <20250814085642.17343-1-kyrie.wu@mediatek.com>
	 <20250814085642.17343-6-kyrie.wu@mediatek.com>
	 <20250815-meek-porcelain-oarfish-1411e3@kuoka>
In-Reply-To: <20250815-meek-porcelain-oarfish-1411e3@kuoka>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|SEYPR03MB7071:EE_
x-ms-office365-filtering-correlation-id: bb70ca32-ee89-4d10-9653-08dddf94f927
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aGl5Q0l2cDZNUkRvUWRlL1o5dkRFZVJtVXh4bllzNnUzby9ZSUNCZUd1K3hk?=
 =?utf-8?B?OGNtY0crOW5VSzhJR1ltQ1ZFRlViQUc0M2E5NGVqdVEyYjlYT2VudEN0cFR6?=
 =?utf-8?B?WlF3VzJpaWVQK2FpTHRWTFZkbHZZQ1hqcmtuYTFLRjZvUzRBYThhMGo0L1cz?=
 =?utf-8?B?ZVVMY2VqMlJkM2VSZlcxQ1N5L1BDQUhBL2FkOFd5eW1LNmY1SktER0JtSG1T?=
 =?utf-8?B?WlBhcDJwbEdkVExXQmI1OGN2NFY4c1BBTlozMmpLbWJQekRIM05icFFiMUZp?=
 =?utf-8?B?SHBDSmR5dEJ5S0JFS1EzbjFVZTJCaE1vSC9PczcyYVhTQVEwRHdTNkZSWXJo?=
 =?utf-8?B?UGNXakY1aStWQ1RRUnZ4b1VFRFlSaFVyUnNycU05aFQvaHpLWWsyd2pWQWpk?=
 =?utf-8?B?cmhVUmhnbEhFRHBKbVN5MmVIZitDZ0ZmdWg3Qk5ydXZxekJjWjlJVmpUUklY?=
 =?utf-8?B?MHVOUGNVaGt6bVY3K1VzenhVVUZab2lyVFltK3FGeVVUTHAwN2h0ZmVmS3N6?=
 =?utf-8?B?UXZNMWxMNXpFRjdLOWxHVGZlZVIyQmhVVDBrdUY5WnZGclNYRVpJZlBOUVl1?=
 =?utf-8?B?MHliT1A2ekM1aGQ1T3lYOS95ZnpHNTd0cGJYYzlBWE1RZUtYV2JSWisybkFI?=
 =?utf-8?B?SzFCMUw5S3VlYzlvYzRDK0FEelNyYkFZRmVPWkoyVTArRzNuVmxzMDlCOXRH?=
 =?utf-8?B?SFNsaUozYlMrMGtLVGxWNHJPSGp5dGVMa3d4dUpDUnR3WUhub0YxZXZST0ly?=
 =?utf-8?B?c2VHWXN1V04vVWErK20ya3NHa01pT3dRQm02R0psZUV4WmswZGM3RFdTYkcx?=
 =?utf-8?B?cDJOenNGQnJRVERZa053c2R5bXNmYTIxcGxWOFhiRlBHZWR1bTBBWU5HUTRx?=
 =?utf-8?B?UGxEQ0IxQ2hOM3FvRHlKWTloMDRhemJaQk9VU2lvYS9QRWlqNzVUSnl5NEpR?=
 =?utf-8?B?eUpUbWk1b084NUdZaW95ak1FRlhvOGo1TWU5VG1VTGRPQ21yRGk3QTdZaFZY?=
 =?utf-8?B?VWJ6ZjFGR1c5VVhpZjJiUHV2SE93clA5Q3F1MndjaGFITkIrcXU2dWM1U01W?=
 =?utf-8?B?VUxqSHBTa1BjcmpmcGkvWmxkcjJZK3pUSk02ZWMvd2lLci9hM2MxZFVnQzJk?=
 =?utf-8?B?UndqZ2ZKNzVlVk9WQk9qaW8vZHNpVFA1d1ZiSnA4WDd0K0hHdjdVYTUzQldL?=
 =?utf-8?B?czNOYmdDelJ2aWxmM3h0N0lMb0grdjI3Ly9zV0pML2ROSFI0YUVmZjRvSHZh?=
 =?utf-8?B?NHJhS3N4QjB4ZzJoWFkzSE9HazY0THQ4MFJ4ZzFYS3ZNR1B2WHFuZGhaK0Rl?=
 =?utf-8?B?eVRKZmtPQmZCZkdDc1FVQmFXYmg3RkUrR2xBSCtHWEJmL1FrMzQ3ZTVVbDM2?=
 =?utf-8?B?OEVxbW1mVWhnRGVlU1hlbUpaNEQ0ZkI0UjExenp2TFVXdFlsbHoyU3BLNG5j?=
 =?utf-8?B?eHpIZFEycVBsdGZmYWdqTmx3WUQzd1dkM2ZmdXA3aGxVNkRVd0c2U29vYks0?=
 =?utf-8?B?MHpQYmtZbndJdXBRd2RKOHpwdDk0OWRLeGlMSG1FY1ByQTFQM2p6STdKbUll?=
 =?utf-8?B?eVpzcGdZL3I3UTZvc09Tajd0TmtiRnFFdFJrRGtFY1dZOUJPQkNldFphcnYr?=
 =?utf-8?B?U1cxTHg3ZTJmVUF1aWJrY0JlTzlWa2tRWWNtS3dMUzdHSFM3MTk3V3ZhMjlM?=
 =?utf-8?B?dU9CSFI5RDN3bS9kV2hMeVJMSkVYRzREQjR2d21EMWFpTElpdEltUXo3UnJa?=
 =?utf-8?B?M1MzRkNRcGtUVk1Ud1hhNmZWajVyU0RhWXVVRVJ0bXRYRk1aVHY3M04rYTNO?=
 =?utf-8?B?dDNteU56SlFOUS9iK21zN2lER2RBcEZTWXp3a3BjQ0twRi91SGhybzRnTnNr?=
 =?utf-8?B?SlN5TW8rK3RyZjdsU0d2UGRnZnhOYVhvT3JSMGE1ZkJRcHRhSTdSLzZEd2Vq?=
 =?utf-8?B?RWpyV1ByaTJjeWxoTFN4Mi9BdmJqa0krOFhnblQvRTI4UXJ3K1lyejRBci9H?=
 =?utf-8?B?VWlSYVFZRUZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUhtYkh4Uis0OHdHOUtiODY1UG1NZFNTUGV0SVJnOFlvZ3dTZ0F6VXIwMkpk?=
 =?utf-8?B?NHl3Z1dNdCtQOGU5U1lRMHg2ZzRzMzhmSEZxQUhvUlRPUmZJbE9mVmtCT0JJ?=
 =?utf-8?B?NzNmUXoycFVVZGNuYkNLMTJ6U3ZGYnpGcU5ybkJFaDMyR0RkdHY1aG1qN0Fi?=
 =?utf-8?B?L1diUlNjWm5KSTdOMkV0aFgvSW5Wd3IvdDU1RHdTTUVXMktuQVY0VUxNMndZ?=
 =?utf-8?B?MHROR0J1aFRtSEorTk1Rb1hXbGdMUkJiem9TemxDTXZlQTdyWmx5Rk9LV2dO?=
 =?utf-8?B?NEFXQzhzUEl6SlNtakFWdlh5MDBmT0x0Wkxhb1BLVTVSbTFrMVAySlk1WXpz?=
 =?utf-8?B?czFHTWkzbHorWGhKR0twUU1zdmVLdDk1OFloR0NuUU1IVTNnc0Y0ejYzNWhL?=
 =?utf-8?B?b040SHdvQUliVzdMaGcxNmJiZFhCSlBZYW1GZlNSNnRvS2t1YlVBTkQ5aGVw?=
 =?utf-8?B?UExjanpzMEoyaSs1NnluSDQ5MndOTTNWczNGR1dIUHFab2RtRXdKeStBQjAv?=
 =?utf-8?B?ZFF2VjVGU2N5TU9MODM4RjBvNDU5L1R0V2lqaytVbmZrVWQxYVZ6cVlOWGNU?=
 =?utf-8?B?SDZzZUVyOXQzNlZNcmYvU1R1by9pRzlIdzA2TUUvSHk4WG5YWDJkdDhPdFFt?=
 =?utf-8?B?VjdqWlZOU2IxK2VGazFpYW1XZkxHekdIdElQQnRNK2V5d2xwdkRKWHpyaXFx?=
 =?utf-8?B?QTZXQlRyeWVrcjNqS3c0OGhaK0d2Y2RlMlc1YXhuY2pwMFUxY2JHbkxJUUpG?=
 =?utf-8?B?c2MrSUZWRU0yaHZDbnFsUTJIbHI2V05RRy9yZDVQME9WQk40eU9TdTlDajU4?=
 =?utf-8?B?bXpSU3hHTU1wQUlWV2dLQjZrWUdXdFFNSW53UzhSUFRoZG1aTUxVL2dHMnNs?=
 =?utf-8?B?NEw4NEJObWc0Rlg4SGxDaGNkUXAxY0QzUklUdmE4aXJTTDdNUVA1VHQxTU9M?=
 =?utf-8?B?RGdYcWJwOFhNNG5ydXg0azFRVCtiVWpINTVCUWQ4MktmMnVHa3VXeDVXcGZG?=
 =?utf-8?B?WThRL1dMQ1ExS1dhUWlEVmN4bWlIUDJLWUI5d0NFcDFEYmFlKzVNNzVwZm02?=
 =?utf-8?B?cHpXMUs2TUVYWGJYSkpYRXlub0ZUVjBRUXpGOVRYZEp3ZktTS200ODBpbVNu?=
 =?utf-8?B?cG1tZUJqRlpVM2VGQy9qQnIrc2JnMi96Z0dsbmZ2TmlsY1VnTWxMS21ISzV0?=
 =?utf-8?B?QUlud0d2QVZNcEZWa1ZqZVhpRHZGbS84T1pSVzYzZ2M0WXcxTTJNL3RldDV1?=
 =?utf-8?B?OGtiL1R4YklJVEpQb3doLzFVRVk3UlpVdXJ3R095cEZqYjhDQzRKbnpMRXR0?=
 =?utf-8?B?aUZScmxQTGd1MXdkakppQlhIVjdQbG8yWDdzSzFJcnRQNHpjS2FoWmlaVzNS?=
 =?utf-8?B?MFh5VzVsMXYvbjdXUkkzb1lNcjUzcmhCVW1uTzlSYVZJSmtXRFJSRmQ2MGg5?=
 =?utf-8?B?WVVlcTdEMlZKRGcwRE9hRTNCelk4dnZKODZYQURkN0FWOEUrMUI3MEF2MzJR?=
 =?utf-8?B?MzVLVXRKNUxJMFg2bzVlN3Vuc3dvVVlRRFEzRW1pRDBpRkRUZThCR2tYZ2R1?=
 =?utf-8?B?OGFZQW9XZ09nWkczeGtDdThYdmFLOFZucXhMaFJkanRTWjhyazNqWWR6Nmpi?=
 =?utf-8?B?NXlxdnNTTzJMSVF0akQ5L0NGY2RVOWttUjhlUHpjdkN3NHNlMzNYSWoyNTlM?=
 =?utf-8?B?T0FuSE1IV2MvcEMyVFFTMHA3eXpXKzFvVmZmckpKK0VKZjkzVlNiVjhxMUV4?=
 =?utf-8?B?cFY5c3ZDem1LK29FMHMxaThJQUpnSnBpSGNnclJBWHJLT1FIM0ZhMWtOeXZN?=
 =?utf-8?B?VlkzQjA2VGN3dUFGOEtSNWpaRXV5T0dKY2cwNE5wNVk5c2xwcnhKTnhwbW9R?=
 =?utf-8?B?ZVNhbm1zMnBYUTNHUTRYRm1ZK2RwT0dJMUFmUU5EeU05S3dwMi9BTlBTV1Zk?=
 =?utf-8?B?azVrVWNCc0VDVjJ6VlN6YTJNbVJzNmtFeGVHVE1TVTJKcU04NkJNRHRvUURv?=
 =?utf-8?B?YzJkWHJLcEJvU3UyMW1lUHBibWExdFBrMUhjaTVMOEliS1E0TjZ6LzVGbFpn?=
 =?utf-8?B?ZlBmeUxVRkpVdlVlNHVrKzU1OWU1QmxzdVNPVW91RzF6Lzh6elZKN2NPL2hK?=
 =?utf-8?Q?nlp0fRnbSILtACdcfUh1pc94a?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <86E7494775E8F24FA40B0D3CA7DED8FA@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb70ca32-ee89-4d10-9653-08dddf94f927
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 02:55:08.4384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xBYR4Jsrmj5MCst5v7algsjfpcATiz/WyfiZW6IuWthQCAHC+qNA/ojl2hgpjPIzIoM+PDZk5s2vOh8OyzuQ2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7071

RGVhciBLcnp5c3p0b2YsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXdpbmcuDQoNCk9uIEZyaSwg
MjAyNS0wOC0xNSBhdCAxMDo1NCArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4g
RXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVu
dC4NCj4gDQo+IA0KPiBPbiBUaHUsIEF1ZyAxNCwgMjAyNSBhdCAwNDo1Njo0MVBNICswODAwLCBL
eXJpZSBXdSB3cm90ZToNCj4gPiBGcm9tOiBJcnVpIFdhbmcgPGlydWkud2FuZ0BtZWRpYXRlay5j
b20+DQo+ID4gDQo+ID4gQWRkIE1UODE5NiBlbmNvZGVyIGNvbXBhdGlibGUgc3RyaW5nLCB3aGlj
aCB3aWxsIHJlZmVyZW5jZSBWQ1ANCj4gPiBkZXZpY2UuDQo+IA0KPiBZb3UgaWdub3JlZCBjb21t
ZW50cyBmcm9tIHYyLg0KDQpJIHRoaW5rIEkgbWlzdW5kZXJzdG9vZCB0aGUgdjIgY29tbWVudHMs
IEkgcmV3cm90ZSB0aGUgdGl0bGUgYmVjYXVzZSBpdA0Kc2FpZCBkdC1iaW5kaW5ncyBhbmQgZW5j
b2RlciB0d2ljZSwgdGhpcyBpcyBub3QgZW5vdWdoLCByaWdodD8gd2UgbmVlZA0KdG8gZGVzY3Jp
YmUgbW9yZSBpbmZvcm1hdGlvbiBpbiBCb2R5IHRleHQ/DQoNCj4gDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogSXJ1aSBXYW5nIDxpcnVpLndhbmdAbWVkaWF0ZWsuY29tPg0KPiANCj4gSW5jb3Jy
ZWN0IFNvQiBjaGFpbi4NCj4gDQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRp
YXRlayx2Y29kZWMtZW5jb2Rlci55YW1sIHwgMTcNCj4gPiArKysrKysrKysrKysrKysrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQN
Cj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2
Y29kZWMtDQo+ID4gZW5jb2Rlci55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLQ0KPiA+IGVuY29kZXIueWFtbA0KPiA+IGlu
ZGV4IGViYzYxNTU4NGY5Mi4uYmI0ZGJmMjNjY2M1IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtDQo+ID4gZW5j
b2Rlci55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL21lZGlhdGVrLHZjb2RlYy0NCj4gPiBlbmNvZGVyLnlhbWwNCj4gPiBAQCAtMjQsNiArMjQs
NyBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTg4LXZj
b2RlYy1lbmMNCj4gPiAgICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5Mi12Y29kZWMtZW5j
DQo+ID4gICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtdmNvZGVjLWVuYw0KPiA+ICsg
ICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk2LXZjb2RlYy1lbmMNCj4gPiAgICAgICAgLSBp
dGVtczoNCj4gPiAgICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE4Ni12Y29kZWMtZW5j
DQo+ID4gICAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODMtdmNvZGVjLWVuYw0KPiA+
IEBAIC01OCw2ICs1OSwxMSBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgZGVzY3JpcHRpb246DQo+
ID4gICAgICAgIERlc2NyaWJlcyBwb2ludCB0byBzY3AuDQo+ID4gDQo+ID4gKyAgbWVkaWF0ZWss
dmNwOg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhh
bmRsZQ0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIERlc2NyaWJlcyBwb2ludCB0
byB2Y3AuDQo+IA0KPiBGb3Igd2hhdD8gWW91IGp1c3QgcmVwZWF0ZWQgdGhlIHByb3BlcnR5IG5h
bWUuIFlvdSBtdXN0IHNheSBoZXJlDQo+IHNvbWV0aGluZyB1c2VmdWwgaW5zdGVhZDogd2h5IHRo
aXMgaXMgbmVlZGVkLCB3aGF0IGlzIGl0cyBwdXJwb3NlLg0KDQpJIHdvdWxkIGxpa2UgdG8gc2F5
Og0KImRlZmluZSB0aGlzICdtZWRpYXRlayx2Y3AnIHByb3BlcnR5IGhlcmUsIHRoaXMgaXMgYSBw
aGFuZGxlIHBvaW50IHRvDQp2Y3AgZGV2aWNlLCBmb3IgcGxhdGZvcm1zIHVzaW5nIHZjcCBmaXJt
d2FyZS4iDQoNCklzIHRoaXMgT0sgZm9yIHlvdT8NCj4gDQo+IA0KDQo+ID4gKw0KPiA+ICAgIHBv
d2VyLWRvbWFpbnM6DQo+ID4gICAgICBtYXhJdGVtczogMQ0KPiA+IA0KPiA+IEBAIC03Niw2ICs4
MiwxNyBAQCByZXF1aXJlZDoNCj4gPiAgICAtIGlvbW11cw0KPiA+IA0KPiA+ICBhbGxPZjoNCj4g
PiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNvbXBhdGli
bGU6DQo+ID4gKyAgICAgICAgICBjb250YWluczoNCj4gPiArICAgICAgICAgICAgZW51bToNCj4g
PiArICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5Ni12Y29kZWMtZW5jDQo+ID4gKw0KPiA+
ICsgICAgdGhlbjoNCj4gPiArICAgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgICAgLSBtZWRpYXRl
ayx2Y3ANCj4gDQo+IGVsc2UNCj4gDQo+IG1lZGlhdGVrLHZjcDogZmFsc2UNCg0KSSB0aGluayB0
aGUgZWxzZSBzdGF0ZW1lbnQgaXMgbm8gbmVlZCBoZXJlLiBEaWZmZXJlbnQgcGxhdGZvcm1zIGFy
ZQ0KdXNpbmcgZGlmZmVyZW50IGZpcm13YXJlIHBoYW5kbGUsIHZwdSwgc2NwLCBhbmQgdmNwLiBz
byB3ZSB1c2UgaWYtdGhlbg0KdG8gZGVzY3JpYmUgdGhlIHJlcXVpcmVkIHByb3BlcnR5IGZvciB0
aGVzZSBwbGF0Zm9ybXMuIA0KDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cj4gDQoNClRoYW5rcyBhZ2FpbiBmb3IgeW91ciBraW5kbHkgcmV2aWV3aW5nLg0KDQpCZXN0IFJl
Z2FyZHMNCg==

